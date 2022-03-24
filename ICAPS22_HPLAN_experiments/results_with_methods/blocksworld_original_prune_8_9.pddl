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
      ?auto_150647 - BLOCK
      ?auto_150648 - BLOCK
      ?auto_150649 - BLOCK
      ?auto_150650 - BLOCK
      ?auto_150651 - BLOCK
      ?auto_150652 - BLOCK
      ?auto_150653 - BLOCK
      ?auto_150654 - BLOCK
    )
    :vars
    (
      ?auto_150655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150655 ?auto_150654 ) ( CLEAR ?auto_150655 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150647 ) ( ON ?auto_150648 ?auto_150647 ) ( ON ?auto_150649 ?auto_150648 ) ( ON ?auto_150650 ?auto_150649 ) ( ON ?auto_150651 ?auto_150650 ) ( ON ?auto_150652 ?auto_150651 ) ( ON ?auto_150653 ?auto_150652 ) ( ON ?auto_150654 ?auto_150653 ) ( not ( = ?auto_150647 ?auto_150648 ) ) ( not ( = ?auto_150647 ?auto_150649 ) ) ( not ( = ?auto_150647 ?auto_150650 ) ) ( not ( = ?auto_150647 ?auto_150651 ) ) ( not ( = ?auto_150647 ?auto_150652 ) ) ( not ( = ?auto_150647 ?auto_150653 ) ) ( not ( = ?auto_150647 ?auto_150654 ) ) ( not ( = ?auto_150647 ?auto_150655 ) ) ( not ( = ?auto_150648 ?auto_150649 ) ) ( not ( = ?auto_150648 ?auto_150650 ) ) ( not ( = ?auto_150648 ?auto_150651 ) ) ( not ( = ?auto_150648 ?auto_150652 ) ) ( not ( = ?auto_150648 ?auto_150653 ) ) ( not ( = ?auto_150648 ?auto_150654 ) ) ( not ( = ?auto_150648 ?auto_150655 ) ) ( not ( = ?auto_150649 ?auto_150650 ) ) ( not ( = ?auto_150649 ?auto_150651 ) ) ( not ( = ?auto_150649 ?auto_150652 ) ) ( not ( = ?auto_150649 ?auto_150653 ) ) ( not ( = ?auto_150649 ?auto_150654 ) ) ( not ( = ?auto_150649 ?auto_150655 ) ) ( not ( = ?auto_150650 ?auto_150651 ) ) ( not ( = ?auto_150650 ?auto_150652 ) ) ( not ( = ?auto_150650 ?auto_150653 ) ) ( not ( = ?auto_150650 ?auto_150654 ) ) ( not ( = ?auto_150650 ?auto_150655 ) ) ( not ( = ?auto_150651 ?auto_150652 ) ) ( not ( = ?auto_150651 ?auto_150653 ) ) ( not ( = ?auto_150651 ?auto_150654 ) ) ( not ( = ?auto_150651 ?auto_150655 ) ) ( not ( = ?auto_150652 ?auto_150653 ) ) ( not ( = ?auto_150652 ?auto_150654 ) ) ( not ( = ?auto_150652 ?auto_150655 ) ) ( not ( = ?auto_150653 ?auto_150654 ) ) ( not ( = ?auto_150653 ?auto_150655 ) ) ( not ( = ?auto_150654 ?auto_150655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150655 ?auto_150654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150657 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_150657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_150658 - BLOCK
    )
    :vars
    (
      ?auto_150659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150658 ?auto_150659 ) ( CLEAR ?auto_150658 ) ( HAND-EMPTY ) ( not ( = ?auto_150658 ?auto_150659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150658 ?auto_150659 )
      ( MAKE-1PILE ?auto_150658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150667 - BLOCK
      ?auto_150668 - BLOCK
      ?auto_150669 - BLOCK
      ?auto_150670 - BLOCK
      ?auto_150671 - BLOCK
      ?auto_150672 - BLOCK
      ?auto_150673 - BLOCK
    )
    :vars
    (
      ?auto_150674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150674 ?auto_150673 ) ( CLEAR ?auto_150674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150667 ) ( ON ?auto_150668 ?auto_150667 ) ( ON ?auto_150669 ?auto_150668 ) ( ON ?auto_150670 ?auto_150669 ) ( ON ?auto_150671 ?auto_150670 ) ( ON ?auto_150672 ?auto_150671 ) ( ON ?auto_150673 ?auto_150672 ) ( not ( = ?auto_150667 ?auto_150668 ) ) ( not ( = ?auto_150667 ?auto_150669 ) ) ( not ( = ?auto_150667 ?auto_150670 ) ) ( not ( = ?auto_150667 ?auto_150671 ) ) ( not ( = ?auto_150667 ?auto_150672 ) ) ( not ( = ?auto_150667 ?auto_150673 ) ) ( not ( = ?auto_150667 ?auto_150674 ) ) ( not ( = ?auto_150668 ?auto_150669 ) ) ( not ( = ?auto_150668 ?auto_150670 ) ) ( not ( = ?auto_150668 ?auto_150671 ) ) ( not ( = ?auto_150668 ?auto_150672 ) ) ( not ( = ?auto_150668 ?auto_150673 ) ) ( not ( = ?auto_150668 ?auto_150674 ) ) ( not ( = ?auto_150669 ?auto_150670 ) ) ( not ( = ?auto_150669 ?auto_150671 ) ) ( not ( = ?auto_150669 ?auto_150672 ) ) ( not ( = ?auto_150669 ?auto_150673 ) ) ( not ( = ?auto_150669 ?auto_150674 ) ) ( not ( = ?auto_150670 ?auto_150671 ) ) ( not ( = ?auto_150670 ?auto_150672 ) ) ( not ( = ?auto_150670 ?auto_150673 ) ) ( not ( = ?auto_150670 ?auto_150674 ) ) ( not ( = ?auto_150671 ?auto_150672 ) ) ( not ( = ?auto_150671 ?auto_150673 ) ) ( not ( = ?auto_150671 ?auto_150674 ) ) ( not ( = ?auto_150672 ?auto_150673 ) ) ( not ( = ?auto_150672 ?auto_150674 ) ) ( not ( = ?auto_150673 ?auto_150674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150674 ?auto_150673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150675 - BLOCK
      ?auto_150676 - BLOCK
      ?auto_150677 - BLOCK
      ?auto_150678 - BLOCK
      ?auto_150679 - BLOCK
      ?auto_150680 - BLOCK
      ?auto_150681 - BLOCK
    )
    :vars
    (
      ?auto_150682 - BLOCK
      ?auto_150683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150682 ?auto_150681 ) ( CLEAR ?auto_150682 ) ( ON-TABLE ?auto_150675 ) ( ON ?auto_150676 ?auto_150675 ) ( ON ?auto_150677 ?auto_150676 ) ( ON ?auto_150678 ?auto_150677 ) ( ON ?auto_150679 ?auto_150678 ) ( ON ?auto_150680 ?auto_150679 ) ( ON ?auto_150681 ?auto_150680 ) ( not ( = ?auto_150675 ?auto_150676 ) ) ( not ( = ?auto_150675 ?auto_150677 ) ) ( not ( = ?auto_150675 ?auto_150678 ) ) ( not ( = ?auto_150675 ?auto_150679 ) ) ( not ( = ?auto_150675 ?auto_150680 ) ) ( not ( = ?auto_150675 ?auto_150681 ) ) ( not ( = ?auto_150675 ?auto_150682 ) ) ( not ( = ?auto_150676 ?auto_150677 ) ) ( not ( = ?auto_150676 ?auto_150678 ) ) ( not ( = ?auto_150676 ?auto_150679 ) ) ( not ( = ?auto_150676 ?auto_150680 ) ) ( not ( = ?auto_150676 ?auto_150681 ) ) ( not ( = ?auto_150676 ?auto_150682 ) ) ( not ( = ?auto_150677 ?auto_150678 ) ) ( not ( = ?auto_150677 ?auto_150679 ) ) ( not ( = ?auto_150677 ?auto_150680 ) ) ( not ( = ?auto_150677 ?auto_150681 ) ) ( not ( = ?auto_150677 ?auto_150682 ) ) ( not ( = ?auto_150678 ?auto_150679 ) ) ( not ( = ?auto_150678 ?auto_150680 ) ) ( not ( = ?auto_150678 ?auto_150681 ) ) ( not ( = ?auto_150678 ?auto_150682 ) ) ( not ( = ?auto_150679 ?auto_150680 ) ) ( not ( = ?auto_150679 ?auto_150681 ) ) ( not ( = ?auto_150679 ?auto_150682 ) ) ( not ( = ?auto_150680 ?auto_150681 ) ) ( not ( = ?auto_150680 ?auto_150682 ) ) ( not ( = ?auto_150681 ?auto_150682 ) ) ( HOLDING ?auto_150683 ) ( not ( = ?auto_150675 ?auto_150683 ) ) ( not ( = ?auto_150676 ?auto_150683 ) ) ( not ( = ?auto_150677 ?auto_150683 ) ) ( not ( = ?auto_150678 ?auto_150683 ) ) ( not ( = ?auto_150679 ?auto_150683 ) ) ( not ( = ?auto_150680 ?auto_150683 ) ) ( not ( = ?auto_150681 ?auto_150683 ) ) ( not ( = ?auto_150682 ?auto_150683 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_150683 )
      ( MAKE-7PILE ?auto_150675 ?auto_150676 ?auto_150677 ?auto_150678 ?auto_150679 ?auto_150680 ?auto_150681 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_150684 - BLOCK
      ?auto_150685 - BLOCK
      ?auto_150686 - BLOCK
      ?auto_150687 - BLOCK
      ?auto_150688 - BLOCK
      ?auto_150689 - BLOCK
      ?auto_150690 - BLOCK
    )
    :vars
    (
      ?auto_150691 - BLOCK
      ?auto_150692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150691 ?auto_150690 ) ( ON-TABLE ?auto_150684 ) ( ON ?auto_150685 ?auto_150684 ) ( ON ?auto_150686 ?auto_150685 ) ( ON ?auto_150687 ?auto_150686 ) ( ON ?auto_150688 ?auto_150687 ) ( ON ?auto_150689 ?auto_150688 ) ( ON ?auto_150690 ?auto_150689 ) ( not ( = ?auto_150684 ?auto_150685 ) ) ( not ( = ?auto_150684 ?auto_150686 ) ) ( not ( = ?auto_150684 ?auto_150687 ) ) ( not ( = ?auto_150684 ?auto_150688 ) ) ( not ( = ?auto_150684 ?auto_150689 ) ) ( not ( = ?auto_150684 ?auto_150690 ) ) ( not ( = ?auto_150684 ?auto_150691 ) ) ( not ( = ?auto_150685 ?auto_150686 ) ) ( not ( = ?auto_150685 ?auto_150687 ) ) ( not ( = ?auto_150685 ?auto_150688 ) ) ( not ( = ?auto_150685 ?auto_150689 ) ) ( not ( = ?auto_150685 ?auto_150690 ) ) ( not ( = ?auto_150685 ?auto_150691 ) ) ( not ( = ?auto_150686 ?auto_150687 ) ) ( not ( = ?auto_150686 ?auto_150688 ) ) ( not ( = ?auto_150686 ?auto_150689 ) ) ( not ( = ?auto_150686 ?auto_150690 ) ) ( not ( = ?auto_150686 ?auto_150691 ) ) ( not ( = ?auto_150687 ?auto_150688 ) ) ( not ( = ?auto_150687 ?auto_150689 ) ) ( not ( = ?auto_150687 ?auto_150690 ) ) ( not ( = ?auto_150687 ?auto_150691 ) ) ( not ( = ?auto_150688 ?auto_150689 ) ) ( not ( = ?auto_150688 ?auto_150690 ) ) ( not ( = ?auto_150688 ?auto_150691 ) ) ( not ( = ?auto_150689 ?auto_150690 ) ) ( not ( = ?auto_150689 ?auto_150691 ) ) ( not ( = ?auto_150690 ?auto_150691 ) ) ( not ( = ?auto_150684 ?auto_150692 ) ) ( not ( = ?auto_150685 ?auto_150692 ) ) ( not ( = ?auto_150686 ?auto_150692 ) ) ( not ( = ?auto_150687 ?auto_150692 ) ) ( not ( = ?auto_150688 ?auto_150692 ) ) ( not ( = ?auto_150689 ?auto_150692 ) ) ( not ( = ?auto_150690 ?auto_150692 ) ) ( not ( = ?auto_150691 ?auto_150692 ) ) ( ON ?auto_150692 ?auto_150691 ) ( CLEAR ?auto_150692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150684 ?auto_150685 ?auto_150686 ?auto_150687 ?auto_150688 ?auto_150689 ?auto_150690 ?auto_150691 )
      ( MAKE-7PILE ?auto_150684 ?auto_150685 ?auto_150686 ?auto_150687 ?auto_150688 ?auto_150689 ?auto_150690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150695 - BLOCK
      ?auto_150696 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150696 ) ( CLEAR ?auto_150695 ) ( ON-TABLE ?auto_150695 ) ( not ( = ?auto_150695 ?auto_150696 ) ) )
    :subtasks
    ( ( !STACK ?auto_150696 ?auto_150695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150697 - BLOCK
      ?auto_150698 - BLOCK
    )
    :vars
    (
      ?auto_150699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150697 ) ( ON-TABLE ?auto_150697 ) ( not ( = ?auto_150697 ?auto_150698 ) ) ( ON ?auto_150698 ?auto_150699 ) ( CLEAR ?auto_150698 ) ( HAND-EMPTY ) ( not ( = ?auto_150697 ?auto_150699 ) ) ( not ( = ?auto_150698 ?auto_150699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150698 ?auto_150699 )
      ( MAKE-2PILE ?auto_150697 ?auto_150698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150700 - BLOCK
      ?auto_150701 - BLOCK
    )
    :vars
    (
      ?auto_150702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150700 ?auto_150701 ) ) ( ON ?auto_150701 ?auto_150702 ) ( CLEAR ?auto_150701 ) ( not ( = ?auto_150700 ?auto_150702 ) ) ( not ( = ?auto_150701 ?auto_150702 ) ) ( HOLDING ?auto_150700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150700 )
      ( MAKE-2PILE ?auto_150700 ?auto_150701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_150703 - BLOCK
      ?auto_150704 - BLOCK
    )
    :vars
    (
      ?auto_150705 - BLOCK
      ?auto_150709 - BLOCK
      ?auto_150710 - BLOCK
      ?auto_150706 - BLOCK
      ?auto_150708 - BLOCK
      ?auto_150707 - BLOCK
      ?auto_150711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150703 ?auto_150704 ) ) ( ON ?auto_150704 ?auto_150705 ) ( not ( = ?auto_150703 ?auto_150705 ) ) ( not ( = ?auto_150704 ?auto_150705 ) ) ( ON ?auto_150703 ?auto_150704 ) ( CLEAR ?auto_150703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150709 ) ( ON ?auto_150710 ?auto_150709 ) ( ON ?auto_150706 ?auto_150710 ) ( ON ?auto_150708 ?auto_150706 ) ( ON ?auto_150707 ?auto_150708 ) ( ON ?auto_150711 ?auto_150707 ) ( ON ?auto_150705 ?auto_150711 ) ( not ( = ?auto_150709 ?auto_150710 ) ) ( not ( = ?auto_150709 ?auto_150706 ) ) ( not ( = ?auto_150709 ?auto_150708 ) ) ( not ( = ?auto_150709 ?auto_150707 ) ) ( not ( = ?auto_150709 ?auto_150711 ) ) ( not ( = ?auto_150709 ?auto_150705 ) ) ( not ( = ?auto_150709 ?auto_150704 ) ) ( not ( = ?auto_150709 ?auto_150703 ) ) ( not ( = ?auto_150710 ?auto_150706 ) ) ( not ( = ?auto_150710 ?auto_150708 ) ) ( not ( = ?auto_150710 ?auto_150707 ) ) ( not ( = ?auto_150710 ?auto_150711 ) ) ( not ( = ?auto_150710 ?auto_150705 ) ) ( not ( = ?auto_150710 ?auto_150704 ) ) ( not ( = ?auto_150710 ?auto_150703 ) ) ( not ( = ?auto_150706 ?auto_150708 ) ) ( not ( = ?auto_150706 ?auto_150707 ) ) ( not ( = ?auto_150706 ?auto_150711 ) ) ( not ( = ?auto_150706 ?auto_150705 ) ) ( not ( = ?auto_150706 ?auto_150704 ) ) ( not ( = ?auto_150706 ?auto_150703 ) ) ( not ( = ?auto_150708 ?auto_150707 ) ) ( not ( = ?auto_150708 ?auto_150711 ) ) ( not ( = ?auto_150708 ?auto_150705 ) ) ( not ( = ?auto_150708 ?auto_150704 ) ) ( not ( = ?auto_150708 ?auto_150703 ) ) ( not ( = ?auto_150707 ?auto_150711 ) ) ( not ( = ?auto_150707 ?auto_150705 ) ) ( not ( = ?auto_150707 ?auto_150704 ) ) ( not ( = ?auto_150707 ?auto_150703 ) ) ( not ( = ?auto_150711 ?auto_150705 ) ) ( not ( = ?auto_150711 ?auto_150704 ) ) ( not ( = ?auto_150711 ?auto_150703 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150709 ?auto_150710 ?auto_150706 ?auto_150708 ?auto_150707 ?auto_150711 ?auto_150705 ?auto_150704 )
      ( MAKE-2PILE ?auto_150703 ?auto_150704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150718 - BLOCK
      ?auto_150719 - BLOCK
      ?auto_150720 - BLOCK
      ?auto_150721 - BLOCK
      ?auto_150722 - BLOCK
      ?auto_150723 - BLOCK
    )
    :vars
    (
      ?auto_150724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150724 ?auto_150723 ) ( CLEAR ?auto_150724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150718 ) ( ON ?auto_150719 ?auto_150718 ) ( ON ?auto_150720 ?auto_150719 ) ( ON ?auto_150721 ?auto_150720 ) ( ON ?auto_150722 ?auto_150721 ) ( ON ?auto_150723 ?auto_150722 ) ( not ( = ?auto_150718 ?auto_150719 ) ) ( not ( = ?auto_150718 ?auto_150720 ) ) ( not ( = ?auto_150718 ?auto_150721 ) ) ( not ( = ?auto_150718 ?auto_150722 ) ) ( not ( = ?auto_150718 ?auto_150723 ) ) ( not ( = ?auto_150718 ?auto_150724 ) ) ( not ( = ?auto_150719 ?auto_150720 ) ) ( not ( = ?auto_150719 ?auto_150721 ) ) ( not ( = ?auto_150719 ?auto_150722 ) ) ( not ( = ?auto_150719 ?auto_150723 ) ) ( not ( = ?auto_150719 ?auto_150724 ) ) ( not ( = ?auto_150720 ?auto_150721 ) ) ( not ( = ?auto_150720 ?auto_150722 ) ) ( not ( = ?auto_150720 ?auto_150723 ) ) ( not ( = ?auto_150720 ?auto_150724 ) ) ( not ( = ?auto_150721 ?auto_150722 ) ) ( not ( = ?auto_150721 ?auto_150723 ) ) ( not ( = ?auto_150721 ?auto_150724 ) ) ( not ( = ?auto_150722 ?auto_150723 ) ) ( not ( = ?auto_150722 ?auto_150724 ) ) ( not ( = ?auto_150723 ?auto_150724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150724 ?auto_150723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150725 - BLOCK
      ?auto_150726 - BLOCK
      ?auto_150727 - BLOCK
      ?auto_150728 - BLOCK
      ?auto_150729 - BLOCK
      ?auto_150730 - BLOCK
    )
    :vars
    (
      ?auto_150731 - BLOCK
      ?auto_150732 - BLOCK
      ?auto_150733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150731 ?auto_150730 ) ( CLEAR ?auto_150731 ) ( ON-TABLE ?auto_150725 ) ( ON ?auto_150726 ?auto_150725 ) ( ON ?auto_150727 ?auto_150726 ) ( ON ?auto_150728 ?auto_150727 ) ( ON ?auto_150729 ?auto_150728 ) ( ON ?auto_150730 ?auto_150729 ) ( not ( = ?auto_150725 ?auto_150726 ) ) ( not ( = ?auto_150725 ?auto_150727 ) ) ( not ( = ?auto_150725 ?auto_150728 ) ) ( not ( = ?auto_150725 ?auto_150729 ) ) ( not ( = ?auto_150725 ?auto_150730 ) ) ( not ( = ?auto_150725 ?auto_150731 ) ) ( not ( = ?auto_150726 ?auto_150727 ) ) ( not ( = ?auto_150726 ?auto_150728 ) ) ( not ( = ?auto_150726 ?auto_150729 ) ) ( not ( = ?auto_150726 ?auto_150730 ) ) ( not ( = ?auto_150726 ?auto_150731 ) ) ( not ( = ?auto_150727 ?auto_150728 ) ) ( not ( = ?auto_150727 ?auto_150729 ) ) ( not ( = ?auto_150727 ?auto_150730 ) ) ( not ( = ?auto_150727 ?auto_150731 ) ) ( not ( = ?auto_150728 ?auto_150729 ) ) ( not ( = ?auto_150728 ?auto_150730 ) ) ( not ( = ?auto_150728 ?auto_150731 ) ) ( not ( = ?auto_150729 ?auto_150730 ) ) ( not ( = ?auto_150729 ?auto_150731 ) ) ( not ( = ?auto_150730 ?auto_150731 ) ) ( HOLDING ?auto_150732 ) ( CLEAR ?auto_150733 ) ( not ( = ?auto_150725 ?auto_150732 ) ) ( not ( = ?auto_150725 ?auto_150733 ) ) ( not ( = ?auto_150726 ?auto_150732 ) ) ( not ( = ?auto_150726 ?auto_150733 ) ) ( not ( = ?auto_150727 ?auto_150732 ) ) ( not ( = ?auto_150727 ?auto_150733 ) ) ( not ( = ?auto_150728 ?auto_150732 ) ) ( not ( = ?auto_150728 ?auto_150733 ) ) ( not ( = ?auto_150729 ?auto_150732 ) ) ( not ( = ?auto_150729 ?auto_150733 ) ) ( not ( = ?auto_150730 ?auto_150732 ) ) ( not ( = ?auto_150730 ?auto_150733 ) ) ( not ( = ?auto_150731 ?auto_150732 ) ) ( not ( = ?auto_150731 ?auto_150733 ) ) ( not ( = ?auto_150732 ?auto_150733 ) ) )
    :subtasks
    ( ( !STACK ?auto_150732 ?auto_150733 )
      ( MAKE-6PILE ?auto_150725 ?auto_150726 ?auto_150727 ?auto_150728 ?auto_150729 ?auto_150730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152065 - BLOCK
      ?auto_152066 - BLOCK
      ?auto_152067 - BLOCK
      ?auto_152068 - BLOCK
      ?auto_152069 - BLOCK
      ?auto_152070 - BLOCK
    )
    :vars
    (
      ?auto_152072 - BLOCK
      ?auto_152071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152072 ?auto_152070 ) ( ON-TABLE ?auto_152065 ) ( ON ?auto_152066 ?auto_152065 ) ( ON ?auto_152067 ?auto_152066 ) ( ON ?auto_152068 ?auto_152067 ) ( ON ?auto_152069 ?auto_152068 ) ( ON ?auto_152070 ?auto_152069 ) ( not ( = ?auto_152065 ?auto_152066 ) ) ( not ( = ?auto_152065 ?auto_152067 ) ) ( not ( = ?auto_152065 ?auto_152068 ) ) ( not ( = ?auto_152065 ?auto_152069 ) ) ( not ( = ?auto_152065 ?auto_152070 ) ) ( not ( = ?auto_152065 ?auto_152072 ) ) ( not ( = ?auto_152066 ?auto_152067 ) ) ( not ( = ?auto_152066 ?auto_152068 ) ) ( not ( = ?auto_152066 ?auto_152069 ) ) ( not ( = ?auto_152066 ?auto_152070 ) ) ( not ( = ?auto_152066 ?auto_152072 ) ) ( not ( = ?auto_152067 ?auto_152068 ) ) ( not ( = ?auto_152067 ?auto_152069 ) ) ( not ( = ?auto_152067 ?auto_152070 ) ) ( not ( = ?auto_152067 ?auto_152072 ) ) ( not ( = ?auto_152068 ?auto_152069 ) ) ( not ( = ?auto_152068 ?auto_152070 ) ) ( not ( = ?auto_152068 ?auto_152072 ) ) ( not ( = ?auto_152069 ?auto_152070 ) ) ( not ( = ?auto_152069 ?auto_152072 ) ) ( not ( = ?auto_152070 ?auto_152072 ) ) ( not ( = ?auto_152065 ?auto_152071 ) ) ( not ( = ?auto_152066 ?auto_152071 ) ) ( not ( = ?auto_152067 ?auto_152071 ) ) ( not ( = ?auto_152068 ?auto_152071 ) ) ( not ( = ?auto_152069 ?auto_152071 ) ) ( not ( = ?auto_152070 ?auto_152071 ) ) ( not ( = ?auto_152072 ?auto_152071 ) ) ( ON ?auto_152071 ?auto_152072 ) ( CLEAR ?auto_152071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152065 ?auto_152066 ?auto_152067 ?auto_152068 ?auto_152069 ?auto_152070 ?auto_152072 )
      ( MAKE-6PILE ?auto_152065 ?auto_152066 ?auto_152067 ?auto_152068 ?auto_152069 ?auto_152070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150743 - BLOCK
      ?auto_150744 - BLOCK
      ?auto_150745 - BLOCK
      ?auto_150746 - BLOCK
      ?auto_150747 - BLOCK
      ?auto_150748 - BLOCK
    )
    :vars
    (
      ?auto_150750 - BLOCK
      ?auto_150749 - BLOCK
      ?auto_150751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150750 ?auto_150748 ) ( ON-TABLE ?auto_150743 ) ( ON ?auto_150744 ?auto_150743 ) ( ON ?auto_150745 ?auto_150744 ) ( ON ?auto_150746 ?auto_150745 ) ( ON ?auto_150747 ?auto_150746 ) ( ON ?auto_150748 ?auto_150747 ) ( not ( = ?auto_150743 ?auto_150744 ) ) ( not ( = ?auto_150743 ?auto_150745 ) ) ( not ( = ?auto_150743 ?auto_150746 ) ) ( not ( = ?auto_150743 ?auto_150747 ) ) ( not ( = ?auto_150743 ?auto_150748 ) ) ( not ( = ?auto_150743 ?auto_150750 ) ) ( not ( = ?auto_150744 ?auto_150745 ) ) ( not ( = ?auto_150744 ?auto_150746 ) ) ( not ( = ?auto_150744 ?auto_150747 ) ) ( not ( = ?auto_150744 ?auto_150748 ) ) ( not ( = ?auto_150744 ?auto_150750 ) ) ( not ( = ?auto_150745 ?auto_150746 ) ) ( not ( = ?auto_150745 ?auto_150747 ) ) ( not ( = ?auto_150745 ?auto_150748 ) ) ( not ( = ?auto_150745 ?auto_150750 ) ) ( not ( = ?auto_150746 ?auto_150747 ) ) ( not ( = ?auto_150746 ?auto_150748 ) ) ( not ( = ?auto_150746 ?auto_150750 ) ) ( not ( = ?auto_150747 ?auto_150748 ) ) ( not ( = ?auto_150747 ?auto_150750 ) ) ( not ( = ?auto_150748 ?auto_150750 ) ) ( not ( = ?auto_150743 ?auto_150749 ) ) ( not ( = ?auto_150743 ?auto_150751 ) ) ( not ( = ?auto_150744 ?auto_150749 ) ) ( not ( = ?auto_150744 ?auto_150751 ) ) ( not ( = ?auto_150745 ?auto_150749 ) ) ( not ( = ?auto_150745 ?auto_150751 ) ) ( not ( = ?auto_150746 ?auto_150749 ) ) ( not ( = ?auto_150746 ?auto_150751 ) ) ( not ( = ?auto_150747 ?auto_150749 ) ) ( not ( = ?auto_150747 ?auto_150751 ) ) ( not ( = ?auto_150748 ?auto_150749 ) ) ( not ( = ?auto_150748 ?auto_150751 ) ) ( not ( = ?auto_150750 ?auto_150749 ) ) ( not ( = ?auto_150750 ?auto_150751 ) ) ( not ( = ?auto_150749 ?auto_150751 ) ) ( ON ?auto_150749 ?auto_150750 ) ( CLEAR ?auto_150749 ) ( HOLDING ?auto_150751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150751 )
      ( MAKE-6PILE ?auto_150743 ?auto_150744 ?auto_150745 ?auto_150746 ?auto_150747 ?auto_150748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_150752 - BLOCK
      ?auto_150753 - BLOCK
      ?auto_150754 - BLOCK
      ?auto_150755 - BLOCK
      ?auto_150756 - BLOCK
      ?auto_150757 - BLOCK
    )
    :vars
    (
      ?auto_150760 - BLOCK
      ?auto_150759 - BLOCK
      ?auto_150758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150760 ?auto_150757 ) ( ON-TABLE ?auto_150752 ) ( ON ?auto_150753 ?auto_150752 ) ( ON ?auto_150754 ?auto_150753 ) ( ON ?auto_150755 ?auto_150754 ) ( ON ?auto_150756 ?auto_150755 ) ( ON ?auto_150757 ?auto_150756 ) ( not ( = ?auto_150752 ?auto_150753 ) ) ( not ( = ?auto_150752 ?auto_150754 ) ) ( not ( = ?auto_150752 ?auto_150755 ) ) ( not ( = ?auto_150752 ?auto_150756 ) ) ( not ( = ?auto_150752 ?auto_150757 ) ) ( not ( = ?auto_150752 ?auto_150760 ) ) ( not ( = ?auto_150753 ?auto_150754 ) ) ( not ( = ?auto_150753 ?auto_150755 ) ) ( not ( = ?auto_150753 ?auto_150756 ) ) ( not ( = ?auto_150753 ?auto_150757 ) ) ( not ( = ?auto_150753 ?auto_150760 ) ) ( not ( = ?auto_150754 ?auto_150755 ) ) ( not ( = ?auto_150754 ?auto_150756 ) ) ( not ( = ?auto_150754 ?auto_150757 ) ) ( not ( = ?auto_150754 ?auto_150760 ) ) ( not ( = ?auto_150755 ?auto_150756 ) ) ( not ( = ?auto_150755 ?auto_150757 ) ) ( not ( = ?auto_150755 ?auto_150760 ) ) ( not ( = ?auto_150756 ?auto_150757 ) ) ( not ( = ?auto_150756 ?auto_150760 ) ) ( not ( = ?auto_150757 ?auto_150760 ) ) ( not ( = ?auto_150752 ?auto_150759 ) ) ( not ( = ?auto_150752 ?auto_150758 ) ) ( not ( = ?auto_150753 ?auto_150759 ) ) ( not ( = ?auto_150753 ?auto_150758 ) ) ( not ( = ?auto_150754 ?auto_150759 ) ) ( not ( = ?auto_150754 ?auto_150758 ) ) ( not ( = ?auto_150755 ?auto_150759 ) ) ( not ( = ?auto_150755 ?auto_150758 ) ) ( not ( = ?auto_150756 ?auto_150759 ) ) ( not ( = ?auto_150756 ?auto_150758 ) ) ( not ( = ?auto_150757 ?auto_150759 ) ) ( not ( = ?auto_150757 ?auto_150758 ) ) ( not ( = ?auto_150760 ?auto_150759 ) ) ( not ( = ?auto_150760 ?auto_150758 ) ) ( not ( = ?auto_150759 ?auto_150758 ) ) ( ON ?auto_150759 ?auto_150760 ) ( ON ?auto_150758 ?auto_150759 ) ( CLEAR ?auto_150758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150752 ?auto_150753 ?auto_150754 ?auto_150755 ?auto_150756 ?auto_150757 ?auto_150760 ?auto_150759 )
      ( MAKE-6PILE ?auto_150752 ?auto_150753 ?auto_150754 ?auto_150755 ?auto_150756 ?auto_150757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150764 - BLOCK
      ?auto_150765 - BLOCK
      ?auto_150766 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150766 ) ( CLEAR ?auto_150765 ) ( ON-TABLE ?auto_150764 ) ( ON ?auto_150765 ?auto_150764 ) ( not ( = ?auto_150764 ?auto_150765 ) ) ( not ( = ?auto_150764 ?auto_150766 ) ) ( not ( = ?auto_150765 ?auto_150766 ) ) )
    :subtasks
    ( ( !STACK ?auto_150766 ?auto_150765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150767 - BLOCK
      ?auto_150768 - BLOCK
      ?auto_150769 - BLOCK
    )
    :vars
    (
      ?auto_150770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150768 ) ( ON-TABLE ?auto_150767 ) ( ON ?auto_150768 ?auto_150767 ) ( not ( = ?auto_150767 ?auto_150768 ) ) ( not ( = ?auto_150767 ?auto_150769 ) ) ( not ( = ?auto_150768 ?auto_150769 ) ) ( ON ?auto_150769 ?auto_150770 ) ( CLEAR ?auto_150769 ) ( HAND-EMPTY ) ( not ( = ?auto_150767 ?auto_150770 ) ) ( not ( = ?auto_150768 ?auto_150770 ) ) ( not ( = ?auto_150769 ?auto_150770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150769 ?auto_150770 )
      ( MAKE-3PILE ?auto_150767 ?auto_150768 ?auto_150769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150771 - BLOCK
      ?auto_150772 - BLOCK
      ?auto_150773 - BLOCK
    )
    :vars
    (
      ?auto_150774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150771 ) ( not ( = ?auto_150771 ?auto_150772 ) ) ( not ( = ?auto_150771 ?auto_150773 ) ) ( not ( = ?auto_150772 ?auto_150773 ) ) ( ON ?auto_150773 ?auto_150774 ) ( CLEAR ?auto_150773 ) ( not ( = ?auto_150771 ?auto_150774 ) ) ( not ( = ?auto_150772 ?auto_150774 ) ) ( not ( = ?auto_150773 ?auto_150774 ) ) ( HOLDING ?auto_150772 ) ( CLEAR ?auto_150771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150771 ?auto_150772 )
      ( MAKE-3PILE ?auto_150771 ?auto_150772 ?auto_150773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150775 - BLOCK
      ?auto_150776 - BLOCK
      ?auto_150777 - BLOCK
    )
    :vars
    (
      ?auto_150778 - BLOCK
      ?auto_150783 - BLOCK
      ?auto_150781 - BLOCK
      ?auto_150779 - BLOCK
      ?auto_150782 - BLOCK
      ?auto_150780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150775 ) ( not ( = ?auto_150775 ?auto_150776 ) ) ( not ( = ?auto_150775 ?auto_150777 ) ) ( not ( = ?auto_150776 ?auto_150777 ) ) ( ON ?auto_150777 ?auto_150778 ) ( not ( = ?auto_150775 ?auto_150778 ) ) ( not ( = ?auto_150776 ?auto_150778 ) ) ( not ( = ?auto_150777 ?auto_150778 ) ) ( CLEAR ?auto_150775 ) ( ON ?auto_150776 ?auto_150777 ) ( CLEAR ?auto_150776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150783 ) ( ON ?auto_150781 ?auto_150783 ) ( ON ?auto_150779 ?auto_150781 ) ( ON ?auto_150782 ?auto_150779 ) ( ON ?auto_150780 ?auto_150782 ) ( ON ?auto_150778 ?auto_150780 ) ( not ( = ?auto_150783 ?auto_150781 ) ) ( not ( = ?auto_150783 ?auto_150779 ) ) ( not ( = ?auto_150783 ?auto_150782 ) ) ( not ( = ?auto_150783 ?auto_150780 ) ) ( not ( = ?auto_150783 ?auto_150778 ) ) ( not ( = ?auto_150783 ?auto_150777 ) ) ( not ( = ?auto_150783 ?auto_150776 ) ) ( not ( = ?auto_150781 ?auto_150779 ) ) ( not ( = ?auto_150781 ?auto_150782 ) ) ( not ( = ?auto_150781 ?auto_150780 ) ) ( not ( = ?auto_150781 ?auto_150778 ) ) ( not ( = ?auto_150781 ?auto_150777 ) ) ( not ( = ?auto_150781 ?auto_150776 ) ) ( not ( = ?auto_150779 ?auto_150782 ) ) ( not ( = ?auto_150779 ?auto_150780 ) ) ( not ( = ?auto_150779 ?auto_150778 ) ) ( not ( = ?auto_150779 ?auto_150777 ) ) ( not ( = ?auto_150779 ?auto_150776 ) ) ( not ( = ?auto_150782 ?auto_150780 ) ) ( not ( = ?auto_150782 ?auto_150778 ) ) ( not ( = ?auto_150782 ?auto_150777 ) ) ( not ( = ?auto_150782 ?auto_150776 ) ) ( not ( = ?auto_150780 ?auto_150778 ) ) ( not ( = ?auto_150780 ?auto_150777 ) ) ( not ( = ?auto_150780 ?auto_150776 ) ) ( not ( = ?auto_150775 ?auto_150783 ) ) ( not ( = ?auto_150775 ?auto_150781 ) ) ( not ( = ?auto_150775 ?auto_150779 ) ) ( not ( = ?auto_150775 ?auto_150782 ) ) ( not ( = ?auto_150775 ?auto_150780 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150783 ?auto_150781 ?auto_150779 ?auto_150782 ?auto_150780 ?auto_150778 ?auto_150777 )
      ( MAKE-3PILE ?auto_150775 ?auto_150776 ?auto_150777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150784 - BLOCK
      ?auto_150785 - BLOCK
      ?auto_150786 - BLOCK
    )
    :vars
    (
      ?auto_150791 - BLOCK
      ?auto_150788 - BLOCK
      ?auto_150789 - BLOCK
      ?auto_150790 - BLOCK
      ?auto_150792 - BLOCK
      ?auto_150787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150784 ?auto_150785 ) ) ( not ( = ?auto_150784 ?auto_150786 ) ) ( not ( = ?auto_150785 ?auto_150786 ) ) ( ON ?auto_150786 ?auto_150791 ) ( not ( = ?auto_150784 ?auto_150791 ) ) ( not ( = ?auto_150785 ?auto_150791 ) ) ( not ( = ?auto_150786 ?auto_150791 ) ) ( ON ?auto_150785 ?auto_150786 ) ( CLEAR ?auto_150785 ) ( ON-TABLE ?auto_150788 ) ( ON ?auto_150789 ?auto_150788 ) ( ON ?auto_150790 ?auto_150789 ) ( ON ?auto_150792 ?auto_150790 ) ( ON ?auto_150787 ?auto_150792 ) ( ON ?auto_150791 ?auto_150787 ) ( not ( = ?auto_150788 ?auto_150789 ) ) ( not ( = ?auto_150788 ?auto_150790 ) ) ( not ( = ?auto_150788 ?auto_150792 ) ) ( not ( = ?auto_150788 ?auto_150787 ) ) ( not ( = ?auto_150788 ?auto_150791 ) ) ( not ( = ?auto_150788 ?auto_150786 ) ) ( not ( = ?auto_150788 ?auto_150785 ) ) ( not ( = ?auto_150789 ?auto_150790 ) ) ( not ( = ?auto_150789 ?auto_150792 ) ) ( not ( = ?auto_150789 ?auto_150787 ) ) ( not ( = ?auto_150789 ?auto_150791 ) ) ( not ( = ?auto_150789 ?auto_150786 ) ) ( not ( = ?auto_150789 ?auto_150785 ) ) ( not ( = ?auto_150790 ?auto_150792 ) ) ( not ( = ?auto_150790 ?auto_150787 ) ) ( not ( = ?auto_150790 ?auto_150791 ) ) ( not ( = ?auto_150790 ?auto_150786 ) ) ( not ( = ?auto_150790 ?auto_150785 ) ) ( not ( = ?auto_150792 ?auto_150787 ) ) ( not ( = ?auto_150792 ?auto_150791 ) ) ( not ( = ?auto_150792 ?auto_150786 ) ) ( not ( = ?auto_150792 ?auto_150785 ) ) ( not ( = ?auto_150787 ?auto_150791 ) ) ( not ( = ?auto_150787 ?auto_150786 ) ) ( not ( = ?auto_150787 ?auto_150785 ) ) ( not ( = ?auto_150784 ?auto_150788 ) ) ( not ( = ?auto_150784 ?auto_150789 ) ) ( not ( = ?auto_150784 ?auto_150790 ) ) ( not ( = ?auto_150784 ?auto_150792 ) ) ( not ( = ?auto_150784 ?auto_150787 ) ) ( HOLDING ?auto_150784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150784 )
      ( MAKE-3PILE ?auto_150784 ?auto_150785 ?auto_150786 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_150793 - BLOCK
      ?auto_150794 - BLOCK
      ?auto_150795 - BLOCK
    )
    :vars
    (
      ?auto_150798 - BLOCK
      ?auto_150796 - BLOCK
      ?auto_150797 - BLOCK
      ?auto_150800 - BLOCK
      ?auto_150799 - BLOCK
      ?auto_150801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150793 ?auto_150794 ) ) ( not ( = ?auto_150793 ?auto_150795 ) ) ( not ( = ?auto_150794 ?auto_150795 ) ) ( ON ?auto_150795 ?auto_150798 ) ( not ( = ?auto_150793 ?auto_150798 ) ) ( not ( = ?auto_150794 ?auto_150798 ) ) ( not ( = ?auto_150795 ?auto_150798 ) ) ( ON ?auto_150794 ?auto_150795 ) ( ON-TABLE ?auto_150796 ) ( ON ?auto_150797 ?auto_150796 ) ( ON ?auto_150800 ?auto_150797 ) ( ON ?auto_150799 ?auto_150800 ) ( ON ?auto_150801 ?auto_150799 ) ( ON ?auto_150798 ?auto_150801 ) ( not ( = ?auto_150796 ?auto_150797 ) ) ( not ( = ?auto_150796 ?auto_150800 ) ) ( not ( = ?auto_150796 ?auto_150799 ) ) ( not ( = ?auto_150796 ?auto_150801 ) ) ( not ( = ?auto_150796 ?auto_150798 ) ) ( not ( = ?auto_150796 ?auto_150795 ) ) ( not ( = ?auto_150796 ?auto_150794 ) ) ( not ( = ?auto_150797 ?auto_150800 ) ) ( not ( = ?auto_150797 ?auto_150799 ) ) ( not ( = ?auto_150797 ?auto_150801 ) ) ( not ( = ?auto_150797 ?auto_150798 ) ) ( not ( = ?auto_150797 ?auto_150795 ) ) ( not ( = ?auto_150797 ?auto_150794 ) ) ( not ( = ?auto_150800 ?auto_150799 ) ) ( not ( = ?auto_150800 ?auto_150801 ) ) ( not ( = ?auto_150800 ?auto_150798 ) ) ( not ( = ?auto_150800 ?auto_150795 ) ) ( not ( = ?auto_150800 ?auto_150794 ) ) ( not ( = ?auto_150799 ?auto_150801 ) ) ( not ( = ?auto_150799 ?auto_150798 ) ) ( not ( = ?auto_150799 ?auto_150795 ) ) ( not ( = ?auto_150799 ?auto_150794 ) ) ( not ( = ?auto_150801 ?auto_150798 ) ) ( not ( = ?auto_150801 ?auto_150795 ) ) ( not ( = ?auto_150801 ?auto_150794 ) ) ( not ( = ?auto_150793 ?auto_150796 ) ) ( not ( = ?auto_150793 ?auto_150797 ) ) ( not ( = ?auto_150793 ?auto_150800 ) ) ( not ( = ?auto_150793 ?auto_150799 ) ) ( not ( = ?auto_150793 ?auto_150801 ) ) ( ON ?auto_150793 ?auto_150794 ) ( CLEAR ?auto_150793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150796 ?auto_150797 ?auto_150800 ?auto_150799 ?auto_150801 ?auto_150798 ?auto_150795 ?auto_150794 )
      ( MAKE-3PILE ?auto_150793 ?auto_150794 ?auto_150795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150807 - BLOCK
      ?auto_150808 - BLOCK
      ?auto_150809 - BLOCK
      ?auto_150810 - BLOCK
      ?auto_150811 - BLOCK
    )
    :vars
    (
      ?auto_150812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150812 ?auto_150811 ) ( CLEAR ?auto_150812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150807 ) ( ON ?auto_150808 ?auto_150807 ) ( ON ?auto_150809 ?auto_150808 ) ( ON ?auto_150810 ?auto_150809 ) ( ON ?auto_150811 ?auto_150810 ) ( not ( = ?auto_150807 ?auto_150808 ) ) ( not ( = ?auto_150807 ?auto_150809 ) ) ( not ( = ?auto_150807 ?auto_150810 ) ) ( not ( = ?auto_150807 ?auto_150811 ) ) ( not ( = ?auto_150807 ?auto_150812 ) ) ( not ( = ?auto_150808 ?auto_150809 ) ) ( not ( = ?auto_150808 ?auto_150810 ) ) ( not ( = ?auto_150808 ?auto_150811 ) ) ( not ( = ?auto_150808 ?auto_150812 ) ) ( not ( = ?auto_150809 ?auto_150810 ) ) ( not ( = ?auto_150809 ?auto_150811 ) ) ( not ( = ?auto_150809 ?auto_150812 ) ) ( not ( = ?auto_150810 ?auto_150811 ) ) ( not ( = ?auto_150810 ?auto_150812 ) ) ( not ( = ?auto_150811 ?auto_150812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150812 ?auto_150811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150813 - BLOCK
      ?auto_150814 - BLOCK
      ?auto_150815 - BLOCK
      ?auto_150816 - BLOCK
      ?auto_150817 - BLOCK
    )
    :vars
    (
      ?auto_150818 - BLOCK
      ?auto_150819 - BLOCK
      ?auto_150820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150818 ?auto_150817 ) ( CLEAR ?auto_150818 ) ( ON-TABLE ?auto_150813 ) ( ON ?auto_150814 ?auto_150813 ) ( ON ?auto_150815 ?auto_150814 ) ( ON ?auto_150816 ?auto_150815 ) ( ON ?auto_150817 ?auto_150816 ) ( not ( = ?auto_150813 ?auto_150814 ) ) ( not ( = ?auto_150813 ?auto_150815 ) ) ( not ( = ?auto_150813 ?auto_150816 ) ) ( not ( = ?auto_150813 ?auto_150817 ) ) ( not ( = ?auto_150813 ?auto_150818 ) ) ( not ( = ?auto_150814 ?auto_150815 ) ) ( not ( = ?auto_150814 ?auto_150816 ) ) ( not ( = ?auto_150814 ?auto_150817 ) ) ( not ( = ?auto_150814 ?auto_150818 ) ) ( not ( = ?auto_150815 ?auto_150816 ) ) ( not ( = ?auto_150815 ?auto_150817 ) ) ( not ( = ?auto_150815 ?auto_150818 ) ) ( not ( = ?auto_150816 ?auto_150817 ) ) ( not ( = ?auto_150816 ?auto_150818 ) ) ( not ( = ?auto_150817 ?auto_150818 ) ) ( HOLDING ?auto_150819 ) ( CLEAR ?auto_150820 ) ( not ( = ?auto_150813 ?auto_150819 ) ) ( not ( = ?auto_150813 ?auto_150820 ) ) ( not ( = ?auto_150814 ?auto_150819 ) ) ( not ( = ?auto_150814 ?auto_150820 ) ) ( not ( = ?auto_150815 ?auto_150819 ) ) ( not ( = ?auto_150815 ?auto_150820 ) ) ( not ( = ?auto_150816 ?auto_150819 ) ) ( not ( = ?auto_150816 ?auto_150820 ) ) ( not ( = ?auto_150817 ?auto_150819 ) ) ( not ( = ?auto_150817 ?auto_150820 ) ) ( not ( = ?auto_150818 ?auto_150819 ) ) ( not ( = ?auto_150818 ?auto_150820 ) ) ( not ( = ?auto_150819 ?auto_150820 ) ) )
    :subtasks
    ( ( !STACK ?auto_150819 ?auto_150820 )
      ( MAKE-5PILE ?auto_150813 ?auto_150814 ?auto_150815 ?auto_150816 ?auto_150817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150821 - BLOCK
      ?auto_150822 - BLOCK
      ?auto_150823 - BLOCK
      ?auto_150824 - BLOCK
      ?auto_150825 - BLOCK
    )
    :vars
    (
      ?auto_150827 - BLOCK
      ?auto_150828 - BLOCK
      ?auto_150826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150827 ?auto_150825 ) ( ON-TABLE ?auto_150821 ) ( ON ?auto_150822 ?auto_150821 ) ( ON ?auto_150823 ?auto_150822 ) ( ON ?auto_150824 ?auto_150823 ) ( ON ?auto_150825 ?auto_150824 ) ( not ( = ?auto_150821 ?auto_150822 ) ) ( not ( = ?auto_150821 ?auto_150823 ) ) ( not ( = ?auto_150821 ?auto_150824 ) ) ( not ( = ?auto_150821 ?auto_150825 ) ) ( not ( = ?auto_150821 ?auto_150827 ) ) ( not ( = ?auto_150822 ?auto_150823 ) ) ( not ( = ?auto_150822 ?auto_150824 ) ) ( not ( = ?auto_150822 ?auto_150825 ) ) ( not ( = ?auto_150822 ?auto_150827 ) ) ( not ( = ?auto_150823 ?auto_150824 ) ) ( not ( = ?auto_150823 ?auto_150825 ) ) ( not ( = ?auto_150823 ?auto_150827 ) ) ( not ( = ?auto_150824 ?auto_150825 ) ) ( not ( = ?auto_150824 ?auto_150827 ) ) ( not ( = ?auto_150825 ?auto_150827 ) ) ( CLEAR ?auto_150828 ) ( not ( = ?auto_150821 ?auto_150826 ) ) ( not ( = ?auto_150821 ?auto_150828 ) ) ( not ( = ?auto_150822 ?auto_150826 ) ) ( not ( = ?auto_150822 ?auto_150828 ) ) ( not ( = ?auto_150823 ?auto_150826 ) ) ( not ( = ?auto_150823 ?auto_150828 ) ) ( not ( = ?auto_150824 ?auto_150826 ) ) ( not ( = ?auto_150824 ?auto_150828 ) ) ( not ( = ?auto_150825 ?auto_150826 ) ) ( not ( = ?auto_150825 ?auto_150828 ) ) ( not ( = ?auto_150827 ?auto_150826 ) ) ( not ( = ?auto_150827 ?auto_150828 ) ) ( not ( = ?auto_150826 ?auto_150828 ) ) ( ON ?auto_150826 ?auto_150827 ) ( CLEAR ?auto_150826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150821 ?auto_150822 ?auto_150823 ?auto_150824 ?auto_150825 ?auto_150827 )
      ( MAKE-5PILE ?auto_150821 ?auto_150822 ?auto_150823 ?auto_150824 ?auto_150825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150829 - BLOCK
      ?auto_150830 - BLOCK
      ?auto_150831 - BLOCK
      ?auto_150832 - BLOCK
      ?auto_150833 - BLOCK
    )
    :vars
    (
      ?auto_150836 - BLOCK
      ?auto_150834 - BLOCK
      ?auto_150835 - BLOCK
      ?auto_150837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150836 ?auto_150833 ) ( ON-TABLE ?auto_150829 ) ( ON ?auto_150830 ?auto_150829 ) ( ON ?auto_150831 ?auto_150830 ) ( ON ?auto_150832 ?auto_150831 ) ( ON ?auto_150833 ?auto_150832 ) ( not ( = ?auto_150829 ?auto_150830 ) ) ( not ( = ?auto_150829 ?auto_150831 ) ) ( not ( = ?auto_150829 ?auto_150832 ) ) ( not ( = ?auto_150829 ?auto_150833 ) ) ( not ( = ?auto_150829 ?auto_150836 ) ) ( not ( = ?auto_150830 ?auto_150831 ) ) ( not ( = ?auto_150830 ?auto_150832 ) ) ( not ( = ?auto_150830 ?auto_150833 ) ) ( not ( = ?auto_150830 ?auto_150836 ) ) ( not ( = ?auto_150831 ?auto_150832 ) ) ( not ( = ?auto_150831 ?auto_150833 ) ) ( not ( = ?auto_150831 ?auto_150836 ) ) ( not ( = ?auto_150832 ?auto_150833 ) ) ( not ( = ?auto_150832 ?auto_150836 ) ) ( not ( = ?auto_150833 ?auto_150836 ) ) ( not ( = ?auto_150829 ?auto_150834 ) ) ( not ( = ?auto_150829 ?auto_150835 ) ) ( not ( = ?auto_150830 ?auto_150834 ) ) ( not ( = ?auto_150830 ?auto_150835 ) ) ( not ( = ?auto_150831 ?auto_150834 ) ) ( not ( = ?auto_150831 ?auto_150835 ) ) ( not ( = ?auto_150832 ?auto_150834 ) ) ( not ( = ?auto_150832 ?auto_150835 ) ) ( not ( = ?auto_150833 ?auto_150834 ) ) ( not ( = ?auto_150833 ?auto_150835 ) ) ( not ( = ?auto_150836 ?auto_150834 ) ) ( not ( = ?auto_150836 ?auto_150835 ) ) ( not ( = ?auto_150834 ?auto_150835 ) ) ( ON ?auto_150834 ?auto_150836 ) ( CLEAR ?auto_150834 ) ( HOLDING ?auto_150835 ) ( CLEAR ?auto_150837 ) ( ON-TABLE ?auto_150837 ) ( not ( = ?auto_150837 ?auto_150835 ) ) ( not ( = ?auto_150829 ?auto_150837 ) ) ( not ( = ?auto_150830 ?auto_150837 ) ) ( not ( = ?auto_150831 ?auto_150837 ) ) ( not ( = ?auto_150832 ?auto_150837 ) ) ( not ( = ?auto_150833 ?auto_150837 ) ) ( not ( = ?auto_150836 ?auto_150837 ) ) ( not ( = ?auto_150834 ?auto_150837 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150837 ?auto_150835 )
      ( MAKE-5PILE ?auto_150829 ?auto_150830 ?auto_150831 ?auto_150832 ?auto_150833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152357 - BLOCK
      ?auto_152358 - BLOCK
      ?auto_152359 - BLOCK
      ?auto_152360 - BLOCK
      ?auto_152361 - BLOCK
    )
    :vars
    (
      ?auto_152362 - BLOCK
      ?auto_152364 - BLOCK
      ?auto_152363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152362 ?auto_152361 ) ( ON-TABLE ?auto_152357 ) ( ON ?auto_152358 ?auto_152357 ) ( ON ?auto_152359 ?auto_152358 ) ( ON ?auto_152360 ?auto_152359 ) ( ON ?auto_152361 ?auto_152360 ) ( not ( = ?auto_152357 ?auto_152358 ) ) ( not ( = ?auto_152357 ?auto_152359 ) ) ( not ( = ?auto_152357 ?auto_152360 ) ) ( not ( = ?auto_152357 ?auto_152361 ) ) ( not ( = ?auto_152357 ?auto_152362 ) ) ( not ( = ?auto_152358 ?auto_152359 ) ) ( not ( = ?auto_152358 ?auto_152360 ) ) ( not ( = ?auto_152358 ?auto_152361 ) ) ( not ( = ?auto_152358 ?auto_152362 ) ) ( not ( = ?auto_152359 ?auto_152360 ) ) ( not ( = ?auto_152359 ?auto_152361 ) ) ( not ( = ?auto_152359 ?auto_152362 ) ) ( not ( = ?auto_152360 ?auto_152361 ) ) ( not ( = ?auto_152360 ?auto_152362 ) ) ( not ( = ?auto_152361 ?auto_152362 ) ) ( not ( = ?auto_152357 ?auto_152364 ) ) ( not ( = ?auto_152357 ?auto_152363 ) ) ( not ( = ?auto_152358 ?auto_152364 ) ) ( not ( = ?auto_152358 ?auto_152363 ) ) ( not ( = ?auto_152359 ?auto_152364 ) ) ( not ( = ?auto_152359 ?auto_152363 ) ) ( not ( = ?auto_152360 ?auto_152364 ) ) ( not ( = ?auto_152360 ?auto_152363 ) ) ( not ( = ?auto_152361 ?auto_152364 ) ) ( not ( = ?auto_152361 ?auto_152363 ) ) ( not ( = ?auto_152362 ?auto_152364 ) ) ( not ( = ?auto_152362 ?auto_152363 ) ) ( not ( = ?auto_152364 ?auto_152363 ) ) ( ON ?auto_152364 ?auto_152362 ) ( ON ?auto_152363 ?auto_152364 ) ( CLEAR ?auto_152363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152357 ?auto_152358 ?auto_152359 ?auto_152360 ?auto_152361 ?auto_152362 ?auto_152364 )
      ( MAKE-5PILE ?auto_152357 ?auto_152358 ?auto_152359 ?auto_152360 ?auto_152361 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150847 - BLOCK
      ?auto_150848 - BLOCK
      ?auto_150849 - BLOCK
      ?auto_150850 - BLOCK
      ?auto_150851 - BLOCK
    )
    :vars
    (
      ?auto_150852 - BLOCK
      ?auto_150854 - BLOCK
      ?auto_150855 - BLOCK
      ?auto_150853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150852 ?auto_150851 ) ( ON-TABLE ?auto_150847 ) ( ON ?auto_150848 ?auto_150847 ) ( ON ?auto_150849 ?auto_150848 ) ( ON ?auto_150850 ?auto_150849 ) ( ON ?auto_150851 ?auto_150850 ) ( not ( = ?auto_150847 ?auto_150848 ) ) ( not ( = ?auto_150847 ?auto_150849 ) ) ( not ( = ?auto_150847 ?auto_150850 ) ) ( not ( = ?auto_150847 ?auto_150851 ) ) ( not ( = ?auto_150847 ?auto_150852 ) ) ( not ( = ?auto_150848 ?auto_150849 ) ) ( not ( = ?auto_150848 ?auto_150850 ) ) ( not ( = ?auto_150848 ?auto_150851 ) ) ( not ( = ?auto_150848 ?auto_150852 ) ) ( not ( = ?auto_150849 ?auto_150850 ) ) ( not ( = ?auto_150849 ?auto_150851 ) ) ( not ( = ?auto_150849 ?auto_150852 ) ) ( not ( = ?auto_150850 ?auto_150851 ) ) ( not ( = ?auto_150850 ?auto_150852 ) ) ( not ( = ?auto_150851 ?auto_150852 ) ) ( not ( = ?auto_150847 ?auto_150854 ) ) ( not ( = ?auto_150847 ?auto_150855 ) ) ( not ( = ?auto_150848 ?auto_150854 ) ) ( not ( = ?auto_150848 ?auto_150855 ) ) ( not ( = ?auto_150849 ?auto_150854 ) ) ( not ( = ?auto_150849 ?auto_150855 ) ) ( not ( = ?auto_150850 ?auto_150854 ) ) ( not ( = ?auto_150850 ?auto_150855 ) ) ( not ( = ?auto_150851 ?auto_150854 ) ) ( not ( = ?auto_150851 ?auto_150855 ) ) ( not ( = ?auto_150852 ?auto_150854 ) ) ( not ( = ?auto_150852 ?auto_150855 ) ) ( not ( = ?auto_150854 ?auto_150855 ) ) ( ON ?auto_150854 ?auto_150852 ) ( not ( = ?auto_150853 ?auto_150855 ) ) ( not ( = ?auto_150847 ?auto_150853 ) ) ( not ( = ?auto_150848 ?auto_150853 ) ) ( not ( = ?auto_150849 ?auto_150853 ) ) ( not ( = ?auto_150850 ?auto_150853 ) ) ( not ( = ?auto_150851 ?auto_150853 ) ) ( not ( = ?auto_150852 ?auto_150853 ) ) ( not ( = ?auto_150854 ?auto_150853 ) ) ( ON ?auto_150855 ?auto_150854 ) ( CLEAR ?auto_150855 ) ( HOLDING ?auto_150853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150853 )
      ( MAKE-5PILE ?auto_150847 ?auto_150848 ?auto_150849 ?auto_150850 ?auto_150851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_150856 - BLOCK
      ?auto_150857 - BLOCK
      ?auto_150858 - BLOCK
      ?auto_150859 - BLOCK
      ?auto_150860 - BLOCK
    )
    :vars
    (
      ?auto_150861 - BLOCK
      ?auto_150862 - BLOCK
      ?auto_150863 - BLOCK
      ?auto_150864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150861 ?auto_150860 ) ( ON-TABLE ?auto_150856 ) ( ON ?auto_150857 ?auto_150856 ) ( ON ?auto_150858 ?auto_150857 ) ( ON ?auto_150859 ?auto_150858 ) ( ON ?auto_150860 ?auto_150859 ) ( not ( = ?auto_150856 ?auto_150857 ) ) ( not ( = ?auto_150856 ?auto_150858 ) ) ( not ( = ?auto_150856 ?auto_150859 ) ) ( not ( = ?auto_150856 ?auto_150860 ) ) ( not ( = ?auto_150856 ?auto_150861 ) ) ( not ( = ?auto_150857 ?auto_150858 ) ) ( not ( = ?auto_150857 ?auto_150859 ) ) ( not ( = ?auto_150857 ?auto_150860 ) ) ( not ( = ?auto_150857 ?auto_150861 ) ) ( not ( = ?auto_150858 ?auto_150859 ) ) ( not ( = ?auto_150858 ?auto_150860 ) ) ( not ( = ?auto_150858 ?auto_150861 ) ) ( not ( = ?auto_150859 ?auto_150860 ) ) ( not ( = ?auto_150859 ?auto_150861 ) ) ( not ( = ?auto_150860 ?auto_150861 ) ) ( not ( = ?auto_150856 ?auto_150862 ) ) ( not ( = ?auto_150856 ?auto_150863 ) ) ( not ( = ?auto_150857 ?auto_150862 ) ) ( not ( = ?auto_150857 ?auto_150863 ) ) ( not ( = ?auto_150858 ?auto_150862 ) ) ( not ( = ?auto_150858 ?auto_150863 ) ) ( not ( = ?auto_150859 ?auto_150862 ) ) ( not ( = ?auto_150859 ?auto_150863 ) ) ( not ( = ?auto_150860 ?auto_150862 ) ) ( not ( = ?auto_150860 ?auto_150863 ) ) ( not ( = ?auto_150861 ?auto_150862 ) ) ( not ( = ?auto_150861 ?auto_150863 ) ) ( not ( = ?auto_150862 ?auto_150863 ) ) ( ON ?auto_150862 ?auto_150861 ) ( not ( = ?auto_150864 ?auto_150863 ) ) ( not ( = ?auto_150856 ?auto_150864 ) ) ( not ( = ?auto_150857 ?auto_150864 ) ) ( not ( = ?auto_150858 ?auto_150864 ) ) ( not ( = ?auto_150859 ?auto_150864 ) ) ( not ( = ?auto_150860 ?auto_150864 ) ) ( not ( = ?auto_150861 ?auto_150864 ) ) ( not ( = ?auto_150862 ?auto_150864 ) ) ( ON ?auto_150863 ?auto_150862 ) ( ON ?auto_150864 ?auto_150863 ) ( CLEAR ?auto_150864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150856 ?auto_150857 ?auto_150858 ?auto_150859 ?auto_150860 ?auto_150861 ?auto_150862 ?auto_150863 )
      ( MAKE-5PILE ?auto_150856 ?auto_150857 ?auto_150858 ?auto_150859 ?auto_150860 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150869 - BLOCK
      ?auto_150870 - BLOCK
      ?auto_150871 - BLOCK
      ?auto_150872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_150872 ) ( CLEAR ?auto_150871 ) ( ON-TABLE ?auto_150869 ) ( ON ?auto_150870 ?auto_150869 ) ( ON ?auto_150871 ?auto_150870 ) ( not ( = ?auto_150869 ?auto_150870 ) ) ( not ( = ?auto_150869 ?auto_150871 ) ) ( not ( = ?auto_150869 ?auto_150872 ) ) ( not ( = ?auto_150870 ?auto_150871 ) ) ( not ( = ?auto_150870 ?auto_150872 ) ) ( not ( = ?auto_150871 ?auto_150872 ) ) )
    :subtasks
    ( ( !STACK ?auto_150872 ?auto_150871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150873 - BLOCK
      ?auto_150874 - BLOCK
      ?auto_150875 - BLOCK
      ?auto_150876 - BLOCK
    )
    :vars
    (
      ?auto_150877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_150875 ) ( ON-TABLE ?auto_150873 ) ( ON ?auto_150874 ?auto_150873 ) ( ON ?auto_150875 ?auto_150874 ) ( not ( = ?auto_150873 ?auto_150874 ) ) ( not ( = ?auto_150873 ?auto_150875 ) ) ( not ( = ?auto_150873 ?auto_150876 ) ) ( not ( = ?auto_150874 ?auto_150875 ) ) ( not ( = ?auto_150874 ?auto_150876 ) ) ( not ( = ?auto_150875 ?auto_150876 ) ) ( ON ?auto_150876 ?auto_150877 ) ( CLEAR ?auto_150876 ) ( HAND-EMPTY ) ( not ( = ?auto_150873 ?auto_150877 ) ) ( not ( = ?auto_150874 ?auto_150877 ) ) ( not ( = ?auto_150875 ?auto_150877 ) ) ( not ( = ?auto_150876 ?auto_150877 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150876 ?auto_150877 )
      ( MAKE-4PILE ?auto_150873 ?auto_150874 ?auto_150875 ?auto_150876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150878 - BLOCK
      ?auto_150879 - BLOCK
      ?auto_150880 - BLOCK
      ?auto_150881 - BLOCK
    )
    :vars
    (
      ?auto_150882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150878 ) ( ON ?auto_150879 ?auto_150878 ) ( not ( = ?auto_150878 ?auto_150879 ) ) ( not ( = ?auto_150878 ?auto_150880 ) ) ( not ( = ?auto_150878 ?auto_150881 ) ) ( not ( = ?auto_150879 ?auto_150880 ) ) ( not ( = ?auto_150879 ?auto_150881 ) ) ( not ( = ?auto_150880 ?auto_150881 ) ) ( ON ?auto_150881 ?auto_150882 ) ( CLEAR ?auto_150881 ) ( not ( = ?auto_150878 ?auto_150882 ) ) ( not ( = ?auto_150879 ?auto_150882 ) ) ( not ( = ?auto_150880 ?auto_150882 ) ) ( not ( = ?auto_150881 ?auto_150882 ) ) ( HOLDING ?auto_150880 ) ( CLEAR ?auto_150879 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150878 ?auto_150879 ?auto_150880 )
      ( MAKE-4PILE ?auto_150878 ?auto_150879 ?auto_150880 ?auto_150881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150883 - BLOCK
      ?auto_150884 - BLOCK
      ?auto_150885 - BLOCK
      ?auto_150886 - BLOCK
    )
    :vars
    (
      ?auto_150887 - BLOCK
      ?auto_150890 - BLOCK
      ?auto_150891 - BLOCK
      ?auto_150889 - BLOCK
      ?auto_150888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150883 ) ( ON ?auto_150884 ?auto_150883 ) ( not ( = ?auto_150883 ?auto_150884 ) ) ( not ( = ?auto_150883 ?auto_150885 ) ) ( not ( = ?auto_150883 ?auto_150886 ) ) ( not ( = ?auto_150884 ?auto_150885 ) ) ( not ( = ?auto_150884 ?auto_150886 ) ) ( not ( = ?auto_150885 ?auto_150886 ) ) ( ON ?auto_150886 ?auto_150887 ) ( not ( = ?auto_150883 ?auto_150887 ) ) ( not ( = ?auto_150884 ?auto_150887 ) ) ( not ( = ?auto_150885 ?auto_150887 ) ) ( not ( = ?auto_150886 ?auto_150887 ) ) ( CLEAR ?auto_150884 ) ( ON ?auto_150885 ?auto_150886 ) ( CLEAR ?auto_150885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150890 ) ( ON ?auto_150891 ?auto_150890 ) ( ON ?auto_150889 ?auto_150891 ) ( ON ?auto_150888 ?auto_150889 ) ( ON ?auto_150887 ?auto_150888 ) ( not ( = ?auto_150890 ?auto_150891 ) ) ( not ( = ?auto_150890 ?auto_150889 ) ) ( not ( = ?auto_150890 ?auto_150888 ) ) ( not ( = ?auto_150890 ?auto_150887 ) ) ( not ( = ?auto_150890 ?auto_150886 ) ) ( not ( = ?auto_150890 ?auto_150885 ) ) ( not ( = ?auto_150891 ?auto_150889 ) ) ( not ( = ?auto_150891 ?auto_150888 ) ) ( not ( = ?auto_150891 ?auto_150887 ) ) ( not ( = ?auto_150891 ?auto_150886 ) ) ( not ( = ?auto_150891 ?auto_150885 ) ) ( not ( = ?auto_150889 ?auto_150888 ) ) ( not ( = ?auto_150889 ?auto_150887 ) ) ( not ( = ?auto_150889 ?auto_150886 ) ) ( not ( = ?auto_150889 ?auto_150885 ) ) ( not ( = ?auto_150888 ?auto_150887 ) ) ( not ( = ?auto_150888 ?auto_150886 ) ) ( not ( = ?auto_150888 ?auto_150885 ) ) ( not ( = ?auto_150883 ?auto_150890 ) ) ( not ( = ?auto_150883 ?auto_150891 ) ) ( not ( = ?auto_150883 ?auto_150889 ) ) ( not ( = ?auto_150883 ?auto_150888 ) ) ( not ( = ?auto_150884 ?auto_150890 ) ) ( not ( = ?auto_150884 ?auto_150891 ) ) ( not ( = ?auto_150884 ?auto_150889 ) ) ( not ( = ?auto_150884 ?auto_150888 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150890 ?auto_150891 ?auto_150889 ?auto_150888 ?auto_150887 ?auto_150886 )
      ( MAKE-4PILE ?auto_150883 ?auto_150884 ?auto_150885 ?auto_150886 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150892 - BLOCK
      ?auto_150893 - BLOCK
      ?auto_150894 - BLOCK
      ?auto_150895 - BLOCK
    )
    :vars
    (
      ?auto_150898 - BLOCK
      ?auto_150897 - BLOCK
      ?auto_150899 - BLOCK
      ?auto_150900 - BLOCK
      ?auto_150896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150892 ) ( not ( = ?auto_150892 ?auto_150893 ) ) ( not ( = ?auto_150892 ?auto_150894 ) ) ( not ( = ?auto_150892 ?auto_150895 ) ) ( not ( = ?auto_150893 ?auto_150894 ) ) ( not ( = ?auto_150893 ?auto_150895 ) ) ( not ( = ?auto_150894 ?auto_150895 ) ) ( ON ?auto_150895 ?auto_150898 ) ( not ( = ?auto_150892 ?auto_150898 ) ) ( not ( = ?auto_150893 ?auto_150898 ) ) ( not ( = ?auto_150894 ?auto_150898 ) ) ( not ( = ?auto_150895 ?auto_150898 ) ) ( ON ?auto_150894 ?auto_150895 ) ( CLEAR ?auto_150894 ) ( ON-TABLE ?auto_150897 ) ( ON ?auto_150899 ?auto_150897 ) ( ON ?auto_150900 ?auto_150899 ) ( ON ?auto_150896 ?auto_150900 ) ( ON ?auto_150898 ?auto_150896 ) ( not ( = ?auto_150897 ?auto_150899 ) ) ( not ( = ?auto_150897 ?auto_150900 ) ) ( not ( = ?auto_150897 ?auto_150896 ) ) ( not ( = ?auto_150897 ?auto_150898 ) ) ( not ( = ?auto_150897 ?auto_150895 ) ) ( not ( = ?auto_150897 ?auto_150894 ) ) ( not ( = ?auto_150899 ?auto_150900 ) ) ( not ( = ?auto_150899 ?auto_150896 ) ) ( not ( = ?auto_150899 ?auto_150898 ) ) ( not ( = ?auto_150899 ?auto_150895 ) ) ( not ( = ?auto_150899 ?auto_150894 ) ) ( not ( = ?auto_150900 ?auto_150896 ) ) ( not ( = ?auto_150900 ?auto_150898 ) ) ( not ( = ?auto_150900 ?auto_150895 ) ) ( not ( = ?auto_150900 ?auto_150894 ) ) ( not ( = ?auto_150896 ?auto_150898 ) ) ( not ( = ?auto_150896 ?auto_150895 ) ) ( not ( = ?auto_150896 ?auto_150894 ) ) ( not ( = ?auto_150892 ?auto_150897 ) ) ( not ( = ?auto_150892 ?auto_150899 ) ) ( not ( = ?auto_150892 ?auto_150900 ) ) ( not ( = ?auto_150892 ?auto_150896 ) ) ( not ( = ?auto_150893 ?auto_150897 ) ) ( not ( = ?auto_150893 ?auto_150899 ) ) ( not ( = ?auto_150893 ?auto_150900 ) ) ( not ( = ?auto_150893 ?auto_150896 ) ) ( HOLDING ?auto_150893 ) ( CLEAR ?auto_150892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150892 ?auto_150893 )
      ( MAKE-4PILE ?auto_150892 ?auto_150893 ?auto_150894 ?auto_150895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150901 - BLOCK
      ?auto_150902 - BLOCK
      ?auto_150903 - BLOCK
      ?auto_150904 - BLOCK
    )
    :vars
    (
      ?auto_150906 - BLOCK
      ?auto_150909 - BLOCK
      ?auto_150908 - BLOCK
      ?auto_150907 - BLOCK
      ?auto_150905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150901 ) ( not ( = ?auto_150901 ?auto_150902 ) ) ( not ( = ?auto_150901 ?auto_150903 ) ) ( not ( = ?auto_150901 ?auto_150904 ) ) ( not ( = ?auto_150902 ?auto_150903 ) ) ( not ( = ?auto_150902 ?auto_150904 ) ) ( not ( = ?auto_150903 ?auto_150904 ) ) ( ON ?auto_150904 ?auto_150906 ) ( not ( = ?auto_150901 ?auto_150906 ) ) ( not ( = ?auto_150902 ?auto_150906 ) ) ( not ( = ?auto_150903 ?auto_150906 ) ) ( not ( = ?auto_150904 ?auto_150906 ) ) ( ON ?auto_150903 ?auto_150904 ) ( ON-TABLE ?auto_150909 ) ( ON ?auto_150908 ?auto_150909 ) ( ON ?auto_150907 ?auto_150908 ) ( ON ?auto_150905 ?auto_150907 ) ( ON ?auto_150906 ?auto_150905 ) ( not ( = ?auto_150909 ?auto_150908 ) ) ( not ( = ?auto_150909 ?auto_150907 ) ) ( not ( = ?auto_150909 ?auto_150905 ) ) ( not ( = ?auto_150909 ?auto_150906 ) ) ( not ( = ?auto_150909 ?auto_150904 ) ) ( not ( = ?auto_150909 ?auto_150903 ) ) ( not ( = ?auto_150908 ?auto_150907 ) ) ( not ( = ?auto_150908 ?auto_150905 ) ) ( not ( = ?auto_150908 ?auto_150906 ) ) ( not ( = ?auto_150908 ?auto_150904 ) ) ( not ( = ?auto_150908 ?auto_150903 ) ) ( not ( = ?auto_150907 ?auto_150905 ) ) ( not ( = ?auto_150907 ?auto_150906 ) ) ( not ( = ?auto_150907 ?auto_150904 ) ) ( not ( = ?auto_150907 ?auto_150903 ) ) ( not ( = ?auto_150905 ?auto_150906 ) ) ( not ( = ?auto_150905 ?auto_150904 ) ) ( not ( = ?auto_150905 ?auto_150903 ) ) ( not ( = ?auto_150901 ?auto_150909 ) ) ( not ( = ?auto_150901 ?auto_150908 ) ) ( not ( = ?auto_150901 ?auto_150907 ) ) ( not ( = ?auto_150901 ?auto_150905 ) ) ( not ( = ?auto_150902 ?auto_150909 ) ) ( not ( = ?auto_150902 ?auto_150908 ) ) ( not ( = ?auto_150902 ?auto_150907 ) ) ( not ( = ?auto_150902 ?auto_150905 ) ) ( CLEAR ?auto_150901 ) ( ON ?auto_150902 ?auto_150903 ) ( CLEAR ?auto_150902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_150909 ?auto_150908 ?auto_150907 ?auto_150905 ?auto_150906 ?auto_150904 ?auto_150903 )
      ( MAKE-4PILE ?auto_150901 ?auto_150902 ?auto_150903 ?auto_150904 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150910 - BLOCK
      ?auto_150911 - BLOCK
      ?auto_150912 - BLOCK
      ?auto_150913 - BLOCK
    )
    :vars
    (
      ?auto_150916 - BLOCK
      ?auto_150917 - BLOCK
      ?auto_150918 - BLOCK
      ?auto_150914 - BLOCK
      ?auto_150915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150910 ?auto_150911 ) ) ( not ( = ?auto_150910 ?auto_150912 ) ) ( not ( = ?auto_150910 ?auto_150913 ) ) ( not ( = ?auto_150911 ?auto_150912 ) ) ( not ( = ?auto_150911 ?auto_150913 ) ) ( not ( = ?auto_150912 ?auto_150913 ) ) ( ON ?auto_150913 ?auto_150916 ) ( not ( = ?auto_150910 ?auto_150916 ) ) ( not ( = ?auto_150911 ?auto_150916 ) ) ( not ( = ?auto_150912 ?auto_150916 ) ) ( not ( = ?auto_150913 ?auto_150916 ) ) ( ON ?auto_150912 ?auto_150913 ) ( ON-TABLE ?auto_150917 ) ( ON ?auto_150918 ?auto_150917 ) ( ON ?auto_150914 ?auto_150918 ) ( ON ?auto_150915 ?auto_150914 ) ( ON ?auto_150916 ?auto_150915 ) ( not ( = ?auto_150917 ?auto_150918 ) ) ( not ( = ?auto_150917 ?auto_150914 ) ) ( not ( = ?auto_150917 ?auto_150915 ) ) ( not ( = ?auto_150917 ?auto_150916 ) ) ( not ( = ?auto_150917 ?auto_150913 ) ) ( not ( = ?auto_150917 ?auto_150912 ) ) ( not ( = ?auto_150918 ?auto_150914 ) ) ( not ( = ?auto_150918 ?auto_150915 ) ) ( not ( = ?auto_150918 ?auto_150916 ) ) ( not ( = ?auto_150918 ?auto_150913 ) ) ( not ( = ?auto_150918 ?auto_150912 ) ) ( not ( = ?auto_150914 ?auto_150915 ) ) ( not ( = ?auto_150914 ?auto_150916 ) ) ( not ( = ?auto_150914 ?auto_150913 ) ) ( not ( = ?auto_150914 ?auto_150912 ) ) ( not ( = ?auto_150915 ?auto_150916 ) ) ( not ( = ?auto_150915 ?auto_150913 ) ) ( not ( = ?auto_150915 ?auto_150912 ) ) ( not ( = ?auto_150910 ?auto_150917 ) ) ( not ( = ?auto_150910 ?auto_150918 ) ) ( not ( = ?auto_150910 ?auto_150914 ) ) ( not ( = ?auto_150910 ?auto_150915 ) ) ( not ( = ?auto_150911 ?auto_150917 ) ) ( not ( = ?auto_150911 ?auto_150918 ) ) ( not ( = ?auto_150911 ?auto_150914 ) ) ( not ( = ?auto_150911 ?auto_150915 ) ) ( ON ?auto_150911 ?auto_150912 ) ( CLEAR ?auto_150911 ) ( HOLDING ?auto_150910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150910 )
      ( MAKE-4PILE ?auto_150910 ?auto_150911 ?auto_150912 ?auto_150913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150919 - BLOCK
      ?auto_150920 - BLOCK
      ?auto_150921 - BLOCK
      ?auto_150922 - BLOCK
    )
    :vars
    (
      ?auto_150927 - BLOCK
      ?auto_150925 - BLOCK
      ?auto_150926 - BLOCK
      ?auto_150923 - BLOCK
      ?auto_150924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150919 ?auto_150920 ) ) ( not ( = ?auto_150919 ?auto_150921 ) ) ( not ( = ?auto_150919 ?auto_150922 ) ) ( not ( = ?auto_150920 ?auto_150921 ) ) ( not ( = ?auto_150920 ?auto_150922 ) ) ( not ( = ?auto_150921 ?auto_150922 ) ) ( ON ?auto_150922 ?auto_150927 ) ( not ( = ?auto_150919 ?auto_150927 ) ) ( not ( = ?auto_150920 ?auto_150927 ) ) ( not ( = ?auto_150921 ?auto_150927 ) ) ( not ( = ?auto_150922 ?auto_150927 ) ) ( ON ?auto_150921 ?auto_150922 ) ( ON-TABLE ?auto_150925 ) ( ON ?auto_150926 ?auto_150925 ) ( ON ?auto_150923 ?auto_150926 ) ( ON ?auto_150924 ?auto_150923 ) ( ON ?auto_150927 ?auto_150924 ) ( not ( = ?auto_150925 ?auto_150926 ) ) ( not ( = ?auto_150925 ?auto_150923 ) ) ( not ( = ?auto_150925 ?auto_150924 ) ) ( not ( = ?auto_150925 ?auto_150927 ) ) ( not ( = ?auto_150925 ?auto_150922 ) ) ( not ( = ?auto_150925 ?auto_150921 ) ) ( not ( = ?auto_150926 ?auto_150923 ) ) ( not ( = ?auto_150926 ?auto_150924 ) ) ( not ( = ?auto_150926 ?auto_150927 ) ) ( not ( = ?auto_150926 ?auto_150922 ) ) ( not ( = ?auto_150926 ?auto_150921 ) ) ( not ( = ?auto_150923 ?auto_150924 ) ) ( not ( = ?auto_150923 ?auto_150927 ) ) ( not ( = ?auto_150923 ?auto_150922 ) ) ( not ( = ?auto_150923 ?auto_150921 ) ) ( not ( = ?auto_150924 ?auto_150927 ) ) ( not ( = ?auto_150924 ?auto_150922 ) ) ( not ( = ?auto_150924 ?auto_150921 ) ) ( not ( = ?auto_150919 ?auto_150925 ) ) ( not ( = ?auto_150919 ?auto_150926 ) ) ( not ( = ?auto_150919 ?auto_150923 ) ) ( not ( = ?auto_150919 ?auto_150924 ) ) ( not ( = ?auto_150920 ?auto_150925 ) ) ( not ( = ?auto_150920 ?auto_150926 ) ) ( not ( = ?auto_150920 ?auto_150923 ) ) ( not ( = ?auto_150920 ?auto_150924 ) ) ( ON ?auto_150920 ?auto_150921 ) ( ON ?auto_150919 ?auto_150920 ) ( CLEAR ?auto_150919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150925 ?auto_150926 ?auto_150923 ?auto_150924 ?auto_150927 ?auto_150922 ?auto_150921 ?auto_150920 )
      ( MAKE-4PILE ?auto_150919 ?auto_150920 ?auto_150921 ?auto_150922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150932 - BLOCK
      ?auto_150933 - BLOCK
      ?auto_150934 - BLOCK
      ?auto_150935 - BLOCK
    )
    :vars
    (
      ?auto_150936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150936 ?auto_150935 ) ( CLEAR ?auto_150936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_150932 ) ( ON ?auto_150933 ?auto_150932 ) ( ON ?auto_150934 ?auto_150933 ) ( ON ?auto_150935 ?auto_150934 ) ( not ( = ?auto_150932 ?auto_150933 ) ) ( not ( = ?auto_150932 ?auto_150934 ) ) ( not ( = ?auto_150932 ?auto_150935 ) ) ( not ( = ?auto_150932 ?auto_150936 ) ) ( not ( = ?auto_150933 ?auto_150934 ) ) ( not ( = ?auto_150933 ?auto_150935 ) ) ( not ( = ?auto_150933 ?auto_150936 ) ) ( not ( = ?auto_150934 ?auto_150935 ) ) ( not ( = ?auto_150934 ?auto_150936 ) ) ( not ( = ?auto_150935 ?auto_150936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_150936 ?auto_150935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150937 - BLOCK
      ?auto_150938 - BLOCK
      ?auto_150939 - BLOCK
      ?auto_150940 - BLOCK
    )
    :vars
    (
      ?auto_150941 - BLOCK
      ?auto_150942 - BLOCK
      ?auto_150943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150941 ?auto_150940 ) ( CLEAR ?auto_150941 ) ( ON-TABLE ?auto_150937 ) ( ON ?auto_150938 ?auto_150937 ) ( ON ?auto_150939 ?auto_150938 ) ( ON ?auto_150940 ?auto_150939 ) ( not ( = ?auto_150937 ?auto_150938 ) ) ( not ( = ?auto_150937 ?auto_150939 ) ) ( not ( = ?auto_150937 ?auto_150940 ) ) ( not ( = ?auto_150937 ?auto_150941 ) ) ( not ( = ?auto_150938 ?auto_150939 ) ) ( not ( = ?auto_150938 ?auto_150940 ) ) ( not ( = ?auto_150938 ?auto_150941 ) ) ( not ( = ?auto_150939 ?auto_150940 ) ) ( not ( = ?auto_150939 ?auto_150941 ) ) ( not ( = ?auto_150940 ?auto_150941 ) ) ( HOLDING ?auto_150942 ) ( CLEAR ?auto_150943 ) ( not ( = ?auto_150937 ?auto_150942 ) ) ( not ( = ?auto_150937 ?auto_150943 ) ) ( not ( = ?auto_150938 ?auto_150942 ) ) ( not ( = ?auto_150938 ?auto_150943 ) ) ( not ( = ?auto_150939 ?auto_150942 ) ) ( not ( = ?auto_150939 ?auto_150943 ) ) ( not ( = ?auto_150940 ?auto_150942 ) ) ( not ( = ?auto_150940 ?auto_150943 ) ) ( not ( = ?auto_150941 ?auto_150942 ) ) ( not ( = ?auto_150941 ?auto_150943 ) ) ( not ( = ?auto_150942 ?auto_150943 ) ) )
    :subtasks
    ( ( !STACK ?auto_150942 ?auto_150943 )
      ( MAKE-4PILE ?auto_150937 ?auto_150938 ?auto_150939 ?auto_150940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150944 - BLOCK
      ?auto_150945 - BLOCK
      ?auto_150946 - BLOCK
      ?auto_150947 - BLOCK
    )
    :vars
    (
      ?auto_150949 - BLOCK
      ?auto_150950 - BLOCK
      ?auto_150948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150949 ?auto_150947 ) ( ON-TABLE ?auto_150944 ) ( ON ?auto_150945 ?auto_150944 ) ( ON ?auto_150946 ?auto_150945 ) ( ON ?auto_150947 ?auto_150946 ) ( not ( = ?auto_150944 ?auto_150945 ) ) ( not ( = ?auto_150944 ?auto_150946 ) ) ( not ( = ?auto_150944 ?auto_150947 ) ) ( not ( = ?auto_150944 ?auto_150949 ) ) ( not ( = ?auto_150945 ?auto_150946 ) ) ( not ( = ?auto_150945 ?auto_150947 ) ) ( not ( = ?auto_150945 ?auto_150949 ) ) ( not ( = ?auto_150946 ?auto_150947 ) ) ( not ( = ?auto_150946 ?auto_150949 ) ) ( not ( = ?auto_150947 ?auto_150949 ) ) ( CLEAR ?auto_150950 ) ( not ( = ?auto_150944 ?auto_150948 ) ) ( not ( = ?auto_150944 ?auto_150950 ) ) ( not ( = ?auto_150945 ?auto_150948 ) ) ( not ( = ?auto_150945 ?auto_150950 ) ) ( not ( = ?auto_150946 ?auto_150948 ) ) ( not ( = ?auto_150946 ?auto_150950 ) ) ( not ( = ?auto_150947 ?auto_150948 ) ) ( not ( = ?auto_150947 ?auto_150950 ) ) ( not ( = ?auto_150949 ?auto_150948 ) ) ( not ( = ?auto_150949 ?auto_150950 ) ) ( not ( = ?auto_150948 ?auto_150950 ) ) ( ON ?auto_150948 ?auto_150949 ) ( CLEAR ?auto_150948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_150944 ?auto_150945 ?auto_150946 ?auto_150947 ?auto_150949 )
      ( MAKE-4PILE ?auto_150944 ?auto_150945 ?auto_150946 ?auto_150947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150951 - BLOCK
      ?auto_150952 - BLOCK
      ?auto_150953 - BLOCK
      ?auto_150954 - BLOCK
    )
    :vars
    (
      ?auto_150955 - BLOCK
      ?auto_150957 - BLOCK
      ?auto_150956 - BLOCK
      ?auto_150958 - BLOCK
      ?auto_150959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150955 ?auto_150954 ) ( ON-TABLE ?auto_150951 ) ( ON ?auto_150952 ?auto_150951 ) ( ON ?auto_150953 ?auto_150952 ) ( ON ?auto_150954 ?auto_150953 ) ( not ( = ?auto_150951 ?auto_150952 ) ) ( not ( = ?auto_150951 ?auto_150953 ) ) ( not ( = ?auto_150951 ?auto_150954 ) ) ( not ( = ?auto_150951 ?auto_150955 ) ) ( not ( = ?auto_150952 ?auto_150953 ) ) ( not ( = ?auto_150952 ?auto_150954 ) ) ( not ( = ?auto_150952 ?auto_150955 ) ) ( not ( = ?auto_150953 ?auto_150954 ) ) ( not ( = ?auto_150953 ?auto_150955 ) ) ( not ( = ?auto_150954 ?auto_150955 ) ) ( not ( = ?auto_150951 ?auto_150957 ) ) ( not ( = ?auto_150951 ?auto_150956 ) ) ( not ( = ?auto_150952 ?auto_150957 ) ) ( not ( = ?auto_150952 ?auto_150956 ) ) ( not ( = ?auto_150953 ?auto_150957 ) ) ( not ( = ?auto_150953 ?auto_150956 ) ) ( not ( = ?auto_150954 ?auto_150957 ) ) ( not ( = ?auto_150954 ?auto_150956 ) ) ( not ( = ?auto_150955 ?auto_150957 ) ) ( not ( = ?auto_150955 ?auto_150956 ) ) ( not ( = ?auto_150957 ?auto_150956 ) ) ( ON ?auto_150957 ?auto_150955 ) ( CLEAR ?auto_150957 ) ( HOLDING ?auto_150956 ) ( CLEAR ?auto_150958 ) ( ON-TABLE ?auto_150959 ) ( ON ?auto_150958 ?auto_150959 ) ( not ( = ?auto_150959 ?auto_150958 ) ) ( not ( = ?auto_150959 ?auto_150956 ) ) ( not ( = ?auto_150958 ?auto_150956 ) ) ( not ( = ?auto_150951 ?auto_150958 ) ) ( not ( = ?auto_150951 ?auto_150959 ) ) ( not ( = ?auto_150952 ?auto_150958 ) ) ( not ( = ?auto_150952 ?auto_150959 ) ) ( not ( = ?auto_150953 ?auto_150958 ) ) ( not ( = ?auto_150953 ?auto_150959 ) ) ( not ( = ?auto_150954 ?auto_150958 ) ) ( not ( = ?auto_150954 ?auto_150959 ) ) ( not ( = ?auto_150955 ?auto_150958 ) ) ( not ( = ?auto_150955 ?auto_150959 ) ) ( not ( = ?auto_150957 ?auto_150958 ) ) ( not ( = ?auto_150957 ?auto_150959 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_150959 ?auto_150958 ?auto_150956 )
      ( MAKE-4PILE ?auto_150951 ?auto_150952 ?auto_150953 ?auto_150954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150960 - BLOCK
      ?auto_150961 - BLOCK
      ?auto_150962 - BLOCK
      ?auto_150963 - BLOCK
    )
    :vars
    (
      ?auto_150964 - BLOCK
      ?auto_150967 - BLOCK
      ?auto_150965 - BLOCK
      ?auto_150968 - BLOCK
      ?auto_150966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150964 ?auto_150963 ) ( ON-TABLE ?auto_150960 ) ( ON ?auto_150961 ?auto_150960 ) ( ON ?auto_150962 ?auto_150961 ) ( ON ?auto_150963 ?auto_150962 ) ( not ( = ?auto_150960 ?auto_150961 ) ) ( not ( = ?auto_150960 ?auto_150962 ) ) ( not ( = ?auto_150960 ?auto_150963 ) ) ( not ( = ?auto_150960 ?auto_150964 ) ) ( not ( = ?auto_150961 ?auto_150962 ) ) ( not ( = ?auto_150961 ?auto_150963 ) ) ( not ( = ?auto_150961 ?auto_150964 ) ) ( not ( = ?auto_150962 ?auto_150963 ) ) ( not ( = ?auto_150962 ?auto_150964 ) ) ( not ( = ?auto_150963 ?auto_150964 ) ) ( not ( = ?auto_150960 ?auto_150967 ) ) ( not ( = ?auto_150960 ?auto_150965 ) ) ( not ( = ?auto_150961 ?auto_150967 ) ) ( not ( = ?auto_150961 ?auto_150965 ) ) ( not ( = ?auto_150962 ?auto_150967 ) ) ( not ( = ?auto_150962 ?auto_150965 ) ) ( not ( = ?auto_150963 ?auto_150967 ) ) ( not ( = ?auto_150963 ?auto_150965 ) ) ( not ( = ?auto_150964 ?auto_150967 ) ) ( not ( = ?auto_150964 ?auto_150965 ) ) ( not ( = ?auto_150967 ?auto_150965 ) ) ( ON ?auto_150967 ?auto_150964 ) ( CLEAR ?auto_150968 ) ( ON-TABLE ?auto_150966 ) ( ON ?auto_150968 ?auto_150966 ) ( not ( = ?auto_150966 ?auto_150968 ) ) ( not ( = ?auto_150966 ?auto_150965 ) ) ( not ( = ?auto_150968 ?auto_150965 ) ) ( not ( = ?auto_150960 ?auto_150968 ) ) ( not ( = ?auto_150960 ?auto_150966 ) ) ( not ( = ?auto_150961 ?auto_150968 ) ) ( not ( = ?auto_150961 ?auto_150966 ) ) ( not ( = ?auto_150962 ?auto_150968 ) ) ( not ( = ?auto_150962 ?auto_150966 ) ) ( not ( = ?auto_150963 ?auto_150968 ) ) ( not ( = ?auto_150963 ?auto_150966 ) ) ( not ( = ?auto_150964 ?auto_150968 ) ) ( not ( = ?auto_150964 ?auto_150966 ) ) ( not ( = ?auto_150967 ?auto_150968 ) ) ( not ( = ?auto_150967 ?auto_150966 ) ) ( ON ?auto_150965 ?auto_150967 ) ( CLEAR ?auto_150965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_150960 ?auto_150961 ?auto_150962 ?auto_150963 ?auto_150964 ?auto_150967 )
      ( MAKE-4PILE ?auto_150960 ?auto_150961 ?auto_150962 ?auto_150963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150969 - BLOCK
      ?auto_150970 - BLOCK
      ?auto_150971 - BLOCK
      ?auto_150972 - BLOCK
    )
    :vars
    (
      ?auto_150975 - BLOCK
      ?auto_150977 - BLOCK
      ?auto_150976 - BLOCK
      ?auto_150974 - BLOCK
      ?auto_150973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150975 ?auto_150972 ) ( ON-TABLE ?auto_150969 ) ( ON ?auto_150970 ?auto_150969 ) ( ON ?auto_150971 ?auto_150970 ) ( ON ?auto_150972 ?auto_150971 ) ( not ( = ?auto_150969 ?auto_150970 ) ) ( not ( = ?auto_150969 ?auto_150971 ) ) ( not ( = ?auto_150969 ?auto_150972 ) ) ( not ( = ?auto_150969 ?auto_150975 ) ) ( not ( = ?auto_150970 ?auto_150971 ) ) ( not ( = ?auto_150970 ?auto_150972 ) ) ( not ( = ?auto_150970 ?auto_150975 ) ) ( not ( = ?auto_150971 ?auto_150972 ) ) ( not ( = ?auto_150971 ?auto_150975 ) ) ( not ( = ?auto_150972 ?auto_150975 ) ) ( not ( = ?auto_150969 ?auto_150977 ) ) ( not ( = ?auto_150969 ?auto_150976 ) ) ( not ( = ?auto_150970 ?auto_150977 ) ) ( not ( = ?auto_150970 ?auto_150976 ) ) ( not ( = ?auto_150971 ?auto_150977 ) ) ( not ( = ?auto_150971 ?auto_150976 ) ) ( not ( = ?auto_150972 ?auto_150977 ) ) ( not ( = ?auto_150972 ?auto_150976 ) ) ( not ( = ?auto_150975 ?auto_150977 ) ) ( not ( = ?auto_150975 ?auto_150976 ) ) ( not ( = ?auto_150977 ?auto_150976 ) ) ( ON ?auto_150977 ?auto_150975 ) ( ON-TABLE ?auto_150974 ) ( not ( = ?auto_150974 ?auto_150973 ) ) ( not ( = ?auto_150974 ?auto_150976 ) ) ( not ( = ?auto_150973 ?auto_150976 ) ) ( not ( = ?auto_150969 ?auto_150973 ) ) ( not ( = ?auto_150969 ?auto_150974 ) ) ( not ( = ?auto_150970 ?auto_150973 ) ) ( not ( = ?auto_150970 ?auto_150974 ) ) ( not ( = ?auto_150971 ?auto_150973 ) ) ( not ( = ?auto_150971 ?auto_150974 ) ) ( not ( = ?auto_150972 ?auto_150973 ) ) ( not ( = ?auto_150972 ?auto_150974 ) ) ( not ( = ?auto_150975 ?auto_150973 ) ) ( not ( = ?auto_150975 ?auto_150974 ) ) ( not ( = ?auto_150977 ?auto_150973 ) ) ( not ( = ?auto_150977 ?auto_150974 ) ) ( ON ?auto_150976 ?auto_150977 ) ( CLEAR ?auto_150976 ) ( HOLDING ?auto_150973 ) ( CLEAR ?auto_150974 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150974 ?auto_150973 )
      ( MAKE-4PILE ?auto_150969 ?auto_150970 ?auto_150971 ?auto_150972 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152671 - BLOCK
      ?auto_152672 - BLOCK
      ?auto_152673 - BLOCK
      ?auto_152674 - BLOCK
    )
    :vars
    (
      ?auto_152678 - BLOCK
      ?auto_152676 - BLOCK
      ?auto_152675 - BLOCK
      ?auto_152677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152678 ?auto_152674 ) ( ON-TABLE ?auto_152671 ) ( ON ?auto_152672 ?auto_152671 ) ( ON ?auto_152673 ?auto_152672 ) ( ON ?auto_152674 ?auto_152673 ) ( not ( = ?auto_152671 ?auto_152672 ) ) ( not ( = ?auto_152671 ?auto_152673 ) ) ( not ( = ?auto_152671 ?auto_152674 ) ) ( not ( = ?auto_152671 ?auto_152678 ) ) ( not ( = ?auto_152672 ?auto_152673 ) ) ( not ( = ?auto_152672 ?auto_152674 ) ) ( not ( = ?auto_152672 ?auto_152678 ) ) ( not ( = ?auto_152673 ?auto_152674 ) ) ( not ( = ?auto_152673 ?auto_152678 ) ) ( not ( = ?auto_152674 ?auto_152678 ) ) ( not ( = ?auto_152671 ?auto_152676 ) ) ( not ( = ?auto_152671 ?auto_152675 ) ) ( not ( = ?auto_152672 ?auto_152676 ) ) ( not ( = ?auto_152672 ?auto_152675 ) ) ( not ( = ?auto_152673 ?auto_152676 ) ) ( not ( = ?auto_152673 ?auto_152675 ) ) ( not ( = ?auto_152674 ?auto_152676 ) ) ( not ( = ?auto_152674 ?auto_152675 ) ) ( not ( = ?auto_152678 ?auto_152676 ) ) ( not ( = ?auto_152678 ?auto_152675 ) ) ( not ( = ?auto_152676 ?auto_152675 ) ) ( ON ?auto_152676 ?auto_152678 ) ( not ( = ?auto_152677 ?auto_152675 ) ) ( not ( = ?auto_152671 ?auto_152677 ) ) ( not ( = ?auto_152672 ?auto_152677 ) ) ( not ( = ?auto_152673 ?auto_152677 ) ) ( not ( = ?auto_152674 ?auto_152677 ) ) ( not ( = ?auto_152678 ?auto_152677 ) ) ( not ( = ?auto_152676 ?auto_152677 ) ) ( ON ?auto_152675 ?auto_152676 ) ( ON ?auto_152677 ?auto_152675 ) ( CLEAR ?auto_152677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152671 ?auto_152672 ?auto_152673 ?auto_152674 ?auto_152678 ?auto_152676 ?auto_152675 )
      ( MAKE-4PILE ?auto_152671 ?auto_152672 ?auto_152673 ?auto_152674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150987 - BLOCK
      ?auto_150988 - BLOCK
      ?auto_150989 - BLOCK
      ?auto_150990 - BLOCK
    )
    :vars
    (
      ?auto_150994 - BLOCK
      ?auto_150995 - BLOCK
      ?auto_150993 - BLOCK
      ?auto_150992 - BLOCK
      ?auto_150991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150994 ?auto_150990 ) ( ON-TABLE ?auto_150987 ) ( ON ?auto_150988 ?auto_150987 ) ( ON ?auto_150989 ?auto_150988 ) ( ON ?auto_150990 ?auto_150989 ) ( not ( = ?auto_150987 ?auto_150988 ) ) ( not ( = ?auto_150987 ?auto_150989 ) ) ( not ( = ?auto_150987 ?auto_150990 ) ) ( not ( = ?auto_150987 ?auto_150994 ) ) ( not ( = ?auto_150988 ?auto_150989 ) ) ( not ( = ?auto_150988 ?auto_150990 ) ) ( not ( = ?auto_150988 ?auto_150994 ) ) ( not ( = ?auto_150989 ?auto_150990 ) ) ( not ( = ?auto_150989 ?auto_150994 ) ) ( not ( = ?auto_150990 ?auto_150994 ) ) ( not ( = ?auto_150987 ?auto_150995 ) ) ( not ( = ?auto_150987 ?auto_150993 ) ) ( not ( = ?auto_150988 ?auto_150995 ) ) ( not ( = ?auto_150988 ?auto_150993 ) ) ( not ( = ?auto_150989 ?auto_150995 ) ) ( not ( = ?auto_150989 ?auto_150993 ) ) ( not ( = ?auto_150990 ?auto_150995 ) ) ( not ( = ?auto_150990 ?auto_150993 ) ) ( not ( = ?auto_150994 ?auto_150995 ) ) ( not ( = ?auto_150994 ?auto_150993 ) ) ( not ( = ?auto_150995 ?auto_150993 ) ) ( ON ?auto_150995 ?auto_150994 ) ( not ( = ?auto_150992 ?auto_150991 ) ) ( not ( = ?auto_150992 ?auto_150993 ) ) ( not ( = ?auto_150991 ?auto_150993 ) ) ( not ( = ?auto_150987 ?auto_150991 ) ) ( not ( = ?auto_150987 ?auto_150992 ) ) ( not ( = ?auto_150988 ?auto_150991 ) ) ( not ( = ?auto_150988 ?auto_150992 ) ) ( not ( = ?auto_150989 ?auto_150991 ) ) ( not ( = ?auto_150989 ?auto_150992 ) ) ( not ( = ?auto_150990 ?auto_150991 ) ) ( not ( = ?auto_150990 ?auto_150992 ) ) ( not ( = ?auto_150994 ?auto_150991 ) ) ( not ( = ?auto_150994 ?auto_150992 ) ) ( not ( = ?auto_150995 ?auto_150991 ) ) ( not ( = ?auto_150995 ?auto_150992 ) ) ( ON ?auto_150993 ?auto_150995 ) ( ON ?auto_150991 ?auto_150993 ) ( CLEAR ?auto_150991 ) ( HOLDING ?auto_150992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150992 )
      ( MAKE-4PILE ?auto_150987 ?auto_150988 ?auto_150989 ?auto_150990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_150996 - BLOCK
      ?auto_150997 - BLOCK
      ?auto_150998 - BLOCK
      ?auto_150999 - BLOCK
    )
    :vars
    (
      ?auto_151000 - BLOCK
      ?auto_151002 - BLOCK
      ?auto_151003 - BLOCK
      ?auto_151004 - BLOCK
      ?auto_151001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151000 ?auto_150999 ) ( ON-TABLE ?auto_150996 ) ( ON ?auto_150997 ?auto_150996 ) ( ON ?auto_150998 ?auto_150997 ) ( ON ?auto_150999 ?auto_150998 ) ( not ( = ?auto_150996 ?auto_150997 ) ) ( not ( = ?auto_150996 ?auto_150998 ) ) ( not ( = ?auto_150996 ?auto_150999 ) ) ( not ( = ?auto_150996 ?auto_151000 ) ) ( not ( = ?auto_150997 ?auto_150998 ) ) ( not ( = ?auto_150997 ?auto_150999 ) ) ( not ( = ?auto_150997 ?auto_151000 ) ) ( not ( = ?auto_150998 ?auto_150999 ) ) ( not ( = ?auto_150998 ?auto_151000 ) ) ( not ( = ?auto_150999 ?auto_151000 ) ) ( not ( = ?auto_150996 ?auto_151002 ) ) ( not ( = ?auto_150996 ?auto_151003 ) ) ( not ( = ?auto_150997 ?auto_151002 ) ) ( not ( = ?auto_150997 ?auto_151003 ) ) ( not ( = ?auto_150998 ?auto_151002 ) ) ( not ( = ?auto_150998 ?auto_151003 ) ) ( not ( = ?auto_150999 ?auto_151002 ) ) ( not ( = ?auto_150999 ?auto_151003 ) ) ( not ( = ?auto_151000 ?auto_151002 ) ) ( not ( = ?auto_151000 ?auto_151003 ) ) ( not ( = ?auto_151002 ?auto_151003 ) ) ( ON ?auto_151002 ?auto_151000 ) ( not ( = ?auto_151004 ?auto_151001 ) ) ( not ( = ?auto_151004 ?auto_151003 ) ) ( not ( = ?auto_151001 ?auto_151003 ) ) ( not ( = ?auto_150996 ?auto_151001 ) ) ( not ( = ?auto_150996 ?auto_151004 ) ) ( not ( = ?auto_150997 ?auto_151001 ) ) ( not ( = ?auto_150997 ?auto_151004 ) ) ( not ( = ?auto_150998 ?auto_151001 ) ) ( not ( = ?auto_150998 ?auto_151004 ) ) ( not ( = ?auto_150999 ?auto_151001 ) ) ( not ( = ?auto_150999 ?auto_151004 ) ) ( not ( = ?auto_151000 ?auto_151001 ) ) ( not ( = ?auto_151000 ?auto_151004 ) ) ( not ( = ?auto_151002 ?auto_151001 ) ) ( not ( = ?auto_151002 ?auto_151004 ) ) ( ON ?auto_151003 ?auto_151002 ) ( ON ?auto_151001 ?auto_151003 ) ( ON ?auto_151004 ?auto_151001 ) ( CLEAR ?auto_151004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_150996 ?auto_150997 ?auto_150998 ?auto_150999 ?auto_151000 ?auto_151002 ?auto_151003 ?auto_151001 )
      ( MAKE-4PILE ?auto_150996 ?auto_150997 ?auto_150998 ?auto_150999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151010 - BLOCK
      ?auto_151011 - BLOCK
      ?auto_151012 - BLOCK
      ?auto_151013 - BLOCK
      ?auto_151014 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151014 ) ( CLEAR ?auto_151013 ) ( ON-TABLE ?auto_151010 ) ( ON ?auto_151011 ?auto_151010 ) ( ON ?auto_151012 ?auto_151011 ) ( ON ?auto_151013 ?auto_151012 ) ( not ( = ?auto_151010 ?auto_151011 ) ) ( not ( = ?auto_151010 ?auto_151012 ) ) ( not ( = ?auto_151010 ?auto_151013 ) ) ( not ( = ?auto_151010 ?auto_151014 ) ) ( not ( = ?auto_151011 ?auto_151012 ) ) ( not ( = ?auto_151011 ?auto_151013 ) ) ( not ( = ?auto_151011 ?auto_151014 ) ) ( not ( = ?auto_151012 ?auto_151013 ) ) ( not ( = ?auto_151012 ?auto_151014 ) ) ( not ( = ?auto_151013 ?auto_151014 ) ) )
    :subtasks
    ( ( !STACK ?auto_151014 ?auto_151013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151015 - BLOCK
      ?auto_151016 - BLOCK
      ?auto_151017 - BLOCK
      ?auto_151018 - BLOCK
      ?auto_151019 - BLOCK
    )
    :vars
    (
      ?auto_151020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151018 ) ( ON-TABLE ?auto_151015 ) ( ON ?auto_151016 ?auto_151015 ) ( ON ?auto_151017 ?auto_151016 ) ( ON ?auto_151018 ?auto_151017 ) ( not ( = ?auto_151015 ?auto_151016 ) ) ( not ( = ?auto_151015 ?auto_151017 ) ) ( not ( = ?auto_151015 ?auto_151018 ) ) ( not ( = ?auto_151015 ?auto_151019 ) ) ( not ( = ?auto_151016 ?auto_151017 ) ) ( not ( = ?auto_151016 ?auto_151018 ) ) ( not ( = ?auto_151016 ?auto_151019 ) ) ( not ( = ?auto_151017 ?auto_151018 ) ) ( not ( = ?auto_151017 ?auto_151019 ) ) ( not ( = ?auto_151018 ?auto_151019 ) ) ( ON ?auto_151019 ?auto_151020 ) ( CLEAR ?auto_151019 ) ( HAND-EMPTY ) ( not ( = ?auto_151015 ?auto_151020 ) ) ( not ( = ?auto_151016 ?auto_151020 ) ) ( not ( = ?auto_151017 ?auto_151020 ) ) ( not ( = ?auto_151018 ?auto_151020 ) ) ( not ( = ?auto_151019 ?auto_151020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151019 ?auto_151020 )
      ( MAKE-5PILE ?auto_151015 ?auto_151016 ?auto_151017 ?auto_151018 ?auto_151019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151021 - BLOCK
      ?auto_151022 - BLOCK
      ?auto_151023 - BLOCK
      ?auto_151024 - BLOCK
      ?auto_151025 - BLOCK
    )
    :vars
    (
      ?auto_151026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151021 ) ( ON ?auto_151022 ?auto_151021 ) ( ON ?auto_151023 ?auto_151022 ) ( not ( = ?auto_151021 ?auto_151022 ) ) ( not ( = ?auto_151021 ?auto_151023 ) ) ( not ( = ?auto_151021 ?auto_151024 ) ) ( not ( = ?auto_151021 ?auto_151025 ) ) ( not ( = ?auto_151022 ?auto_151023 ) ) ( not ( = ?auto_151022 ?auto_151024 ) ) ( not ( = ?auto_151022 ?auto_151025 ) ) ( not ( = ?auto_151023 ?auto_151024 ) ) ( not ( = ?auto_151023 ?auto_151025 ) ) ( not ( = ?auto_151024 ?auto_151025 ) ) ( ON ?auto_151025 ?auto_151026 ) ( CLEAR ?auto_151025 ) ( not ( = ?auto_151021 ?auto_151026 ) ) ( not ( = ?auto_151022 ?auto_151026 ) ) ( not ( = ?auto_151023 ?auto_151026 ) ) ( not ( = ?auto_151024 ?auto_151026 ) ) ( not ( = ?auto_151025 ?auto_151026 ) ) ( HOLDING ?auto_151024 ) ( CLEAR ?auto_151023 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151021 ?auto_151022 ?auto_151023 ?auto_151024 )
      ( MAKE-5PILE ?auto_151021 ?auto_151022 ?auto_151023 ?auto_151024 ?auto_151025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151027 - BLOCK
      ?auto_151028 - BLOCK
      ?auto_151029 - BLOCK
      ?auto_151030 - BLOCK
      ?auto_151031 - BLOCK
    )
    :vars
    (
      ?auto_151032 - BLOCK
      ?auto_151034 - BLOCK
      ?auto_151035 - BLOCK
      ?auto_151033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151027 ) ( ON ?auto_151028 ?auto_151027 ) ( ON ?auto_151029 ?auto_151028 ) ( not ( = ?auto_151027 ?auto_151028 ) ) ( not ( = ?auto_151027 ?auto_151029 ) ) ( not ( = ?auto_151027 ?auto_151030 ) ) ( not ( = ?auto_151027 ?auto_151031 ) ) ( not ( = ?auto_151028 ?auto_151029 ) ) ( not ( = ?auto_151028 ?auto_151030 ) ) ( not ( = ?auto_151028 ?auto_151031 ) ) ( not ( = ?auto_151029 ?auto_151030 ) ) ( not ( = ?auto_151029 ?auto_151031 ) ) ( not ( = ?auto_151030 ?auto_151031 ) ) ( ON ?auto_151031 ?auto_151032 ) ( not ( = ?auto_151027 ?auto_151032 ) ) ( not ( = ?auto_151028 ?auto_151032 ) ) ( not ( = ?auto_151029 ?auto_151032 ) ) ( not ( = ?auto_151030 ?auto_151032 ) ) ( not ( = ?auto_151031 ?auto_151032 ) ) ( CLEAR ?auto_151029 ) ( ON ?auto_151030 ?auto_151031 ) ( CLEAR ?auto_151030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151034 ) ( ON ?auto_151035 ?auto_151034 ) ( ON ?auto_151033 ?auto_151035 ) ( ON ?auto_151032 ?auto_151033 ) ( not ( = ?auto_151034 ?auto_151035 ) ) ( not ( = ?auto_151034 ?auto_151033 ) ) ( not ( = ?auto_151034 ?auto_151032 ) ) ( not ( = ?auto_151034 ?auto_151031 ) ) ( not ( = ?auto_151034 ?auto_151030 ) ) ( not ( = ?auto_151035 ?auto_151033 ) ) ( not ( = ?auto_151035 ?auto_151032 ) ) ( not ( = ?auto_151035 ?auto_151031 ) ) ( not ( = ?auto_151035 ?auto_151030 ) ) ( not ( = ?auto_151033 ?auto_151032 ) ) ( not ( = ?auto_151033 ?auto_151031 ) ) ( not ( = ?auto_151033 ?auto_151030 ) ) ( not ( = ?auto_151027 ?auto_151034 ) ) ( not ( = ?auto_151027 ?auto_151035 ) ) ( not ( = ?auto_151027 ?auto_151033 ) ) ( not ( = ?auto_151028 ?auto_151034 ) ) ( not ( = ?auto_151028 ?auto_151035 ) ) ( not ( = ?auto_151028 ?auto_151033 ) ) ( not ( = ?auto_151029 ?auto_151034 ) ) ( not ( = ?auto_151029 ?auto_151035 ) ) ( not ( = ?auto_151029 ?auto_151033 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151034 ?auto_151035 ?auto_151033 ?auto_151032 ?auto_151031 )
      ( MAKE-5PILE ?auto_151027 ?auto_151028 ?auto_151029 ?auto_151030 ?auto_151031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151036 - BLOCK
      ?auto_151037 - BLOCK
      ?auto_151038 - BLOCK
      ?auto_151039 - BLOCK
      ?auto_151040 - BLOCK
    )
    :vars
    (
      ?auto_151041 - BLOCK
      ?auto_151043 - BLOCK
      ?auto_151044 - BLOCK
      ?auto_151042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151036 ) ( ON ?auto_151037 ?auto_151036 ) ( not ( = ?auto_151036 ?auto_151037 ) ) ( not ( = ?auto_151036 ?auto_151038 ) ) ( not ( = ?auto_151036 ?auto_151039 ) ) ( not ( = ?auto_151036 ?auto_151040 ) ) ( not ( = ?auto_151037 ?auto_151038 ) ) ( not ( = ?auto_151037 ?auto_151039 ) ) ( not ( = ?auto_151037 ?auto_151040 ) ) ( not ( = ?auto_151038 ?auto_151039 ) ) ( not ( = ?auto_151038 ?auto_151040 ) ) ( not ( = ?auto_151039 ?auto_151040 ) ) ( ON ?auto_151040 ?auto_151041 ) ( not ( = ?auto_151036 ?auto_151041 ) ) ( not ( = ?auto_151037 ?auto_151041 ) ) ( not ( = ?auto_151038 ?auto_151041 ) ) ( not ( = ?auto_151039 ?auto_151041 ) ) ( not ( = ?auto_151040 ?auto_151041 ) ) ( ON ?auto_151039 ?auto_151040 ) ( CLEAR ?auto_151039 ) ( ON-TABLE ?auto_151043 ) ( ON ?auto_151044 ?auto_151043 ) ( ON ?auto_151042 ?auto_151044 ) ( ON ?auto_151041 ?auto_151042 ) ( not ( = ?auto_151043 ?auto_151044 ) ) ( not ( = ?auto_151043 ?auto_151042 ) ) ( not ( = ?auto_151043 ?auto_151041 ) ) ( not ( = ?auto_151043 ?auto_151040 ) ) ( not ( = ?auto_151043 ?auto_151039 ) ) ( not ( = ?auto_151044 ?auto_151042 ) ) ( not ( = ?auto_151044 ?auto_151041 ) ) ( not ( = ?auto_151044 ?auto_151040 ) ) ( not ( = ?auto_151044 ?auto_151039 ) ) ( not ( = ?auto_151042 ?auto_151041 ) ) ( not ( = ?auto_151042 ?auto_151040 ) ) ( not ( = ?auto_151042 ?auto_151039 ) ) ( not ( = ?auto_151036 ?auto_151043 ) ) ( not ( = ?auto_151036 ?auto_151044 ) ) ( not ( = ?auto_151036 ?auto_151042 ) ) ( not ( = ?auto_151037 ?auto_151043 ) ) ( not ( = ?auto_151037 ?auto_151044 ) ) ( not ( = ?auto_151037 ?auto_151042 ) ) ( not ( = ?auto_151038 ?auto_151043 ) ) ( not ( = ?auto_151038 ?auto_151044 ) ) ( not ( = ?auto_151038 ?auto_151042 ) ) ( HOLDING ?auto_151038 ) ( CLEAR ?auto_151037 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151036 ?auto_151037 ?auto_151038 )
      ( MAKE-5PILE ?auto_151036 ?auto_151037 ?auto_151038 ?auto_151039 ?auto_151040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151045 - BLOCK
      ?auto_151046 - BLOCK
      ?auto_151047 - BLOCK
      ?auto_151048 - BLOCK
      ?auto_151049 - BLOCK
    )
    :vars
    (
      ?auto_151050 - BLOCK
      ?auto_151051 - BLOCK
      ?auto_151053 - BLOCK
      ?auto_151052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151045 ) ( ON ?auto_151046 ?auto_151045 ) ( not ( = ?auto_151045 ?auto_151046 ) ) ( not ( = ?auto_151045 ?auto_151047 ) ) ( not ( = ?auto_151045 ?auto_151048 ) ) ( not ( = ?auto_151045 ?auto_151049 ) ) ( not ( = ?auto_151046 ?auto_151047 ) ) ( not ( = ?auto_151046 ?auto_151048 ) ) ( not ( = ?auto_151046 ?auto_151049 ) ) ( not ( = ?auto_151047 ?auto_151048 ) ) ( not ( = ?auto_151047 ?auto_151049 ) ) ( not ( = ?auto_151048 ?auto_151049 ) ) ( ON ?auto_151049 ?auto_151050 ) ( not ( = ?auto_151045 ?auto_151050 ) ) ( not ( = ?auto_151046 ?auto_151050 ) ) ( not ( = ?auto_151047 ?auto_151050 ) ) ( not ( = ?auto_151048 ?auto_151050 ) ) ( not ( = ?auto_151049 ?auto_151050 ) ) ( ON ?auto_151048 ?auto_151049 ) ( ON-TABLE ?auto_151051 ) ( ON ?auto_151053 ?auto_151051 ) ( ON ?auto_151052 ?auto_151053 ) ( ON ?auto_151050 ?auto_151052 ) ( not ( = ?auto_151051 ?auto_151053 ) ) ( not ( = ?auto_151051 ?auto_151052 ) ) ( not ( = ?auto_151051 ?auto_151050 ) ) ( not ( = ?auto_151051 ?auto_151049 ) ) ( not ( = ?auto_151051 ?auto_151048 ) ) ( not ( = ?auto_151053 ?auto_151052 ) ) ( not ( = ?auto_151053 ?auto_151050 ) ) ( not ( = ?auto_151053 ?auto_151049 ) ) ( not ( = ?auto_151053 ?auto_151048 ) ) ( not ( = ?auto_151052 ?auto_151050 ) ) ( not ( = ?auto_151052 ?auto_151049 ) ) ( not ( = ?auto_151052 ?auto_151048 ) ) ( not ( = ?auto_151045 ?auto_151051 ) ) ( not ( = ?auto_151045 ?auto_151053 ) ) ( not ( = ?auto_151045 ?auto_151052 ) ) ( not ( = ?auto_151046 ?auto_151051 ) ) ( not ( = ?auto_151046 ?auto_151053 ) ) ( not ( = ?auto_151046 ?auto_151052 ) ) ( not ( = ?auto_151047 ?auto_151051 ) ) ( not ( = ?auto_151047 ?auto_151053 ) ) ( not ( = ?auto_151047 ?auto_151052 ) ) ( CLEAR ?auto_151046 ) ( ON ?auto_151047 ?auto_151048 ) ( CLEAR ?auto_151047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151051 ?auto_151053 ?auto_151052 ?auto_151050 ?auto_151049 ?auto_151048 )
      ( MAKE-5PILE ?auto_151045 ?auto_151046 ?auto_151047 ?auto_151048 ?auto_151049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151054 - BLOCK
      ?auto_151055 - BLOCK
      ?auto_151056 - BLOCK
      ?auto_151057 - BLOCK
      ?auto_151058 - BLOCK
    )
    :vars
    (
      ?auto_151059 - BLOCK
      ?auto_151062 - BLOCK
      ?auto_151061 - BLOCK
      ?auto_151060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151054 ) ( not ( = ?auto_151054 ?auto_151055 ) ) ( not ( = ?auto_151054 ?auto_151056 ) ) ( not ( = ?auto_151054 ?auto_151057 ) ) ( not ( = ?auto_151054 ?auto_151058 ) ) ( not ( = ?auto_151055 ?auto_151056 ) ) ( not ( = ?auto_151055 ?auto_151057 ) ) ( not ( = ?auto_151055 ?auto_151058 ) ) ( not ( = ?auto_151056 ?auto_151057 ) ) ( not ( = ?auto_151056 ?auto_151058 ) ) ( not ( = ?auto_151057 ?auto_151058 ) ) ( ON ?auto_151058 ?auto_151059 ) ( not ( = ?auto_151054 ?auto_151059 ) ) ( not ( = ?auto_151055 ?auto_151059 ) ) ( not ( = ?auto_151056 ?auto_151059 ) ) ( not ( = ?auto_151057 ?auto_151059 ) ) ( not ( = ?auto_151058 ?auto_151059 ) ) ( ON ?auto_151057 ?auto_151058 ) ( ON-TABLE ?auto_151062 ) ( ON ?auto_151061 ?auto_151062 ) ( ON ?auto_151060 ?auto_151061 ) ( ON ?auto_151059 ?auto_151060 ) ( not ( = ?auto_151062 ?auto_151061 ) ) ( not ( = ?auto_151062 ?auto_151060 ) ) ( not ( = ?auto_151062 ?auto_151059 ) ) ( not ( = ?auto_151062 ?auto_151058 ) ) ( not ( = ?auto_151062 ?auto_151057 ) ) ( not ( = ?auto_151061 ?auto_151060 ) ) ( not ( = ?auto_151061 ?auto_151059 ) ) ( not ( = ?auto_151061 ?auto_151058 ) ) ( not ( = ?auto_151061 ?auto_151057 ) ) ( not ( = ?auto_151060 ?auto_151059 ) ) ( not ( = ?auto_151060 ?auto_151058 ) ) ( not ( = ?auto_151060 ?auto_151057 ) ) ( not ( = ?auto_151054 ?auto_151062 ) ) ( not ( = ?auto_151054 ?auto_151061 ) ) ( not ( = ?auto_151054 ?auto_151060 ) ) ( not ( = ?auto_151055 ?auto_151062 ) ) ( not ( = ?auto_151055 ?auto_151061 ) ) ( not ( = ?auto_151055 ?auto_151060 ) ) ( not ( = ?auto_151056 ?auto_151062 ) ) ( not ( = ?auto_151056 ?auto_151061 ) ) ( not ( = ?auto_151056 ?auto_151060 ) ) ( ON ?auto_151056 ?auto_151057 ) ( CLEAR ?auto_151056 ) ( HOLDING ?auto_151055 ) ( CLEAR ?auto_151054 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151054 ?auto_151055 )
      ( MAKE-5PILE ?auto_151054 ?auto_151055 ?auto_151056 ?auto_151057 ?auto_151058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151063 - BLOCK
      ?auto_151064 - BLOCK
      ?auto_151065 - BLOCK
      ?auto_151066 - BLOCK
      ?auto_151067 - BLOCK
    )
    :vars
    (
      ?auto_151070 - BLOCK
      ?auto_151071 - BLOCK
      ?auto_151068 - BLOCK
      ?auto_151069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151063 ) ( not ( = ?auto_151063 ?auto_151064 ) ) ( not ( = ?auto_151063 ?auto_151065 ) ) ( not ( = ?auto_151063 ?auto_151066 ) ) ( not ( = ?auto_151063 ?auto_151067 ) ) ( not ( = ?auto_151064 ?auto_151065 ) ) ( not ( = ?auto_151064 ?auto_151066 ) ) ( not ( = ?auto_151064 ?auto_151067 ) ) ( not ( = ?auto_151065 ?auto_151066 ) ) ( not ( = ?auto_151065 ?auto_151067 ) ) ( not ( = ?auto_151066 ?auto_151067 ) ) ( ON ?auto_151067 ?auto_151070 ) ( not ( = ?auto_151063 ?auto_151070 ) ) ( not ( = ?auto_151064 ?auto_151070 ) ) ( not ( = ?auto_151065 ?auto_151070 ) ) ( not ( = ?auto_151066 ?auto_151070 ) ) ( not ( = ?auto_151067 ?auto_151070 ) ) ( ON ?auto_151066 ?auto_151067 ) ( ON-TABLE ?auto_151071 ) ( ON ?auto_151068 ?auto_151071 ) ( ON ?auto_151069 ?auto_151068 ) ( ON ?auto_151070 ?auto_151069 ) ( not ( = ?auto_151071 ?auto_151068 ) ) ( not ( = ?auto_151071 ?auto_151069 ) ) ( not ( = ?auto_151071 ?auto_151070 ) ) ( not ( = ?auto_151071 ?auto_151067 ) ) ( not ( = ?auto_151071 ?auto_151066 ) ) ( not ( = ?auto_151068 ?auto_151069 ) ) ( not ( = ?auto_151068 ?auto_151070 ) ) ( not ( = ?auto_151068 ?auto_151067 ) ) ( not ( = ?auto_151068 ?auto_151066 ) ) ( not ( = ?auto_151069 ?auto_151070 ) ) ( not ( = ?auto_151069 ?auto_151067 ) ) ( not ( = ?auto_151069 ?auto_151066 ) ) ( not ( = ?auto_151063 ?auto_151071 ) ) ( not ( = ?auto_151063 ?auto_151068 ) ) ( not ( = ?auto_151063 ?auto_151069 ) ) ( not ( = ?auto_151064 ?auto_151071 ) ) ( not ( = ?auto_151064 ?auto_151068 ) ) ( not ( = ?auto_151064 ?auto_151069 ) ) ( not ( = ?auto_151065 ?auto_151071 ) ) ( not ( = ?auto_151065 ?auto_151068 ) ) ( not ( = ?auto_151065 ?auto_151069 ) ) ( ON ?auto_151065 ?auto_151066 ) ( CLEAR ?auto_151063 ) ( ON ?auto_151064 ?auto_151065 ) ( CLEAR ?auto_151064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151071 ?auto_151068 ?auto_151069 ?auto_151070 ?auto_151067 ?auto_151066 ?auto_151065 )
      ( MAKE-5PILE ?auto_151063 ?auto_151064 ?auto_151065 ?auto_151066 ?auto_151067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151072 - BLOCK
      ?auto_151073 - BLOCK
      ?auto_151074 - BLOCK
      ?auto_151075 - BLOCK
      ?auto_151076 - BLOCK
    )
    :vars
    (
      ?auto_151078 - BLOCK
      ?auto_151077 - BLOCK
      ?auto_151079 - BLOCK
      ?auto_151080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151072 ?auto_151073 ) ) ( not ( = ?auto_151072 ?auto_151074 ) ) ( not ( = ?auto_151072 ?auto_151075 ) ) ( not ( = ?auto_151072 ?auto_151076 ) ) ( not ( = ?auto_151073 ?auto_151074 ) ) ( not ( = ?auto_151073 ?auto_151075 ) ) ( not ( = ?auto_151073 ?auto_151076 ) ) ( not ( = ?auto_151074 ?auto_151075 ) ) ( not ( = ?auto_151074 ?auto_151076 ) ) ( not ( = ?auto_151075 ?auto_151076 ) ) ( ON ?auto_151076 ?auto_151078 ) ( not ( = ?auto_151072 ?auto_151078 ) ) ( not ( = ?auto_151073 ?auto_151078 ) ) ( not ( = ?auto_151074 ?auto_151078 ) ) ( not ( = ?auto_151075 ?auto_151078 ) ) ( not ( = ?auto_151076 ?auto_151078 ) ) ( ON ?auto_151075 ?auto_151076 ) ( ON-TABLE ?auto_151077 ) ( ON ?auto_151079 ?auto_151077 ) ( ON ?auto_151080 ?auto_151079 ) ( ON ?auto_151078 ?auto_151080 ) ( not ( = ?auto_151077 ?auto_151079 ) ) ( not ( = ?auto_151077 ?auto_151080 ) ) ( not ( = ?auto_151077 ?auto_151078 ) ) ( not ( = ?auto_151077 ?auto_151076 ) ) ( not ( = ?auto_151077 ?auto_151075 ) ) ( not ( = ?auto_151079 ?auto_151080 ) ) ( not ( = ?auto_151079 ?auto_151078 ) ) ( not ( = ?auto_151079 ?auto_151076 ) ) ( not ( = ?auto_151079 ?auto_151075 ) ) ( not ( = ?auto_151080 ?auto_151078 ) ) ( not ( = ?auto_151080 ?auto_151076 ) ) ( not ( = ?auto_151080 ?auto_151075 ) ) ( not ( = ?auto_151072 ?auto_151077 ) ) ( not ( = ?auto_151072 ?auto_151079 ) ) ( not ( = ?auto_151072 ?auto_151080 ) ) ( not ( = ?auto_151073 ?auto_151077 ) ) ( not ( = ?auto_151073 ?auto_151079 ) ) ( not ( = ?auto_151073 ?auto_151080 ) ) ( not ( = ?auto_151074 ?auto_151077 ) ) ( not ( = ?auto_151074 ?auto_151079 ) ) ( not ( = ?auto_151074 ?auto_151080 ) ) ( ON ?auto_151074 ?auto_151075 ) ( ON ?auto_151073 ?auto_151074 ) ( CLEAR ?auto_151073 ) ( HOLDING ?auto_151072 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151072 )
      ( MAKE-5PILE ?auto_151072 ?auto_151073 ?auto_151074 ?auto_151075 ?auto_151076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_151081 - BLOCK
      ?auto_151082 - BLOCK
      ?auto_151083 - BLOCK
      ?auto_151084 - BLOCK
      ?auto_151085 - BLOCK
    )
    :vars
    (
      ?auto_151089 - BLOCK
      ?auto_151087 - BLOCK
      ?auto_151086 - BLOCK
      ?auto_151088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151081 ?auto_151082 ) ) ( not ( = ?auto_151081 ?auto_151083 ) ) ( not ( = ?auto_151081 ?auto_151084 ) ) ( not ( = ?auto_151081 ?auto_151085 ) ) ( not ( = ?auto_151082 ?auto_151083 ) ) ( not ( = ?auto_151082 ?auto_151084 ) ) ( not ( = ?auto_151082 ?auto_151085 ) ) ( not ( = ?auto_151083 ?auto_151084 ) ) ( not ( = ?auto_151083 ?auto_151085 ) ) ( not ( = ?auto_151084 ?auto_151085 ) ) ( ON ?auto_151085 ?auto_151089 ) ( not ( = ?auto_151081 ?auto_151089 ) ) ( not ( = ?auto_151082 ?auto_151089 ) ) ( not ( = ?auto_151083 ?auto_151089 ) ) ( not ( = ?auto_151084 ?auto_151089 ) ) ( not ( = ?auto_151085 ?auto_151089 ) ) ( ON ?auto_151084 ?auto_151085 ) ( ON-TABLE ?auto_151087 ) ( ON ?auto_151086 ?auto_151087 ) ( ON ?auto_151088 ?auto_151086 ) ( ON ?auto_151089 ?auto_151088 ) ( not ( = ?auto_151087 ?auto_151086 ) ) ( not ( = ?auto_151087 ?auto_151088 ) ) ( not ( = ?auto_151087 ?auto_151089 ) ) ( not ( = ?auto_151087 ?auto_151085 ) ) ( not ( = ?auto_151087 ?auto_151084 ) ) ( not ( = ?auto_151086 ?auto_151088 ) ) ( not ( = ?auto_151086 ?auto_151089 ) ) ( not ( = ?auto_151086 ?auto_151085 ) ) ( not ( = ?auto_151086 ?auto_151084 ) ) ( not ( = ?auto_151088 ?auto_151089 ) ) ( not ( = ?auto_151088 ?auto_151085 ) ) ( not ( = ?auto_151088 ?auto_151084 ) ) ( not ( = ?auto_151081 ?auto_151087 ) ) ( not ( = ?auto_151081 ?auto_151086 ) ) ( not ( = ?auto_151081 ?auto_151088 ) ) ( not ( = ?auto_151082 ?auto_151087 ) ) ( not ( = ?auto_151082 ?auto_151086 ) ) ( not ( = ?auto_151082 ?auto_151088 ) ) ( not ( = ?auto_151083 ?auto_151087 ) ) ( not ( = ?auto_151083 ?auto_151086 ) ) ( not ( = ?auto_151083 ?auto_151088 ) ) ( ON ?auto_151083 ?auto_151084 ) ( ON ?auto_151082 ?auto_151083 ) ( ON ?auto_151081 ?auto_151082 ) ( CLEAR ?auto_151081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151087 ?auto_151086 ?auto_151088 ?auto_151089 ?auto_151085 ?auto_151084 ?auto_151083 ?auto_151082 )
      ( MAKE-5PILE ?auto_151081 ?auto_151082 ?auto_151083 ?auto_151084 ?auto_151085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151093 - BLOCK
      ?auto_151094 - BLOCK
      ?auto_151095 - BLOCK
    )
    :vars
    (
      ?auto_151096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151096 ?auto_151095 ) ( CLEAR ?auto_151096 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151093 ) ( ON ?auto_151094 ?auto_151093 ) ( ON ?auto_151095 ?auto_151094 ) ( not ( = ?auto_151093 ?auto_151094 ) ) ( not ( = ?auto_151093 ?auto_151095 ) ) ( not ( = ?auto_151093 ?auto_151096 ) ) ( not ( = ?auto_151094 ?auto_151095 ) ) ( not ( = ?auto_151094 ?auto_151096 ) ) ( not ( = ?auto_151095 ?auto_151096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151096 ?auto_151095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151097 - BLOCK
      ?auto_151098 - BLOCK
      ?auto_151099 - BLOCK
    )
    :vars
    (
      ?auto_151100 - BLOCK
      ?auto_151101 - BLOCK
      ?auto_151102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151100 ?auto_151099 ) ( CLEAR ?auto_151100 ) ( ON-TABLE ?auto_151097 ) ( ON ?auto_151098 ?auto_151097 ) ( ON ?auto_151099 ?auto_151098 ) ( not ( = ?auto_151097 ?auto_151098 ) ) ( not ( = ?auto_151097 ?auto_151099 ) ) ( not ( = ?auto_151097 ?auto_151100 ) ) ( not ( = ?auto_151098 ?auto_151099 ) ) ( not ( = ?auto_151098 ?auto_151100 ) ) ( not ( = ?auto_151099 ?auto_151100 ) ) ( HOLDING ?auto_151101 ) ( CLEAR ?auto_151102 ) ( not ( = ?auto_151097 ?auto_151101 ) ) ( not ( = ?auto_151097 ?auto_151102 ) ) ( not ( = ?auto_151098 ?auto_151101 ) ) ( not ( = ?auto_151098 ?auto_151102 ) ) ( not ( = ?auto_151099 ?auto_151101 ) ) ( not ( = ?auto_151099 ?auto_151102 ) ) ( not ( = ?auto_151100 ?auto_151101 ) ) ( not ( = ?auto_151100 ?auto_151102 ) ) ( not ( = ?auto_151101 ?auto_151102 ) ) )
    :subtasks
    ( ( !STACK ?auto_151101 ?auto_151102 )
      ( MAKE-3PILE ?auto_151097 ?auto_151098 ?auto_151099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151103 - BLOCK
      ?auto_151104 - BLOCK
      ?auto_151105 - BLOCK
    )
    :vars
    (
      ?auto_151108 - BLOCK
      ?auto_151106 - BLOCK
      ?auto_151107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151108 ?auto_151105 ) ( ON-TABLE ?auto_151103 ) ( ON ?auto_151104 ?auto_151103 ) ( ON ?auto_151105 ?auto_151104 ) ( not ( = ?auto_151103 ?auto_151104 ) ) ( not ( = ?auto_151103 ?auto_151105 ) ) ( not ( = ?auto_151103 ?auto_151108 ) ) ( not ( = ?auto_151104 ?auto_151105 ) ) ( not ( = ?auto_151104 ?auto_151108 ) ) ( not ( = ?auto_151105 ?auto_151108 ) ) ( CLEAR ?auto_151106 ) ( not ( = ?auto_151103 ?auto_151107 ) ) ( not ( = ?auto_151103 ?auto_151106 ) ) ( not ( = ?auto_151104 ?auto_151107 ) ) ( not ( = ?auto_151104 ?auto_151106 ) ) ( not ( = ?auto_151105 ?auto_151107 ) ) ( not ( = ?auto_151105 ?auto_151106 ) ) ( not ( = ?auto_151108 ?auto_151107 ) ) ( not ( = ?auto_151108 ?auto_151106 ) ) ( not ( = ?auto_151107 ?auto_151106 ) ) ( ON ?auto_151107 ?auto_151108 ) ( CLEAR ?auto_151107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151103 ?auto_151104 ?auto_151105 ?auto_151108 )
      ( MAKE-3PILE ?auto_151103 ?auto_151104 ?auto_151105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151109 - BLOCK
      ?auto_151110 - BLOCK
      ?auto_151111 - BLOCK
    )
    :vars
    (
      ?auto_151112 - BLOCK
      ?auto_151114 - BLOCK
      ?auto_151113 - BLOCK
      ?auto_151115 - BLOCK
      ?auto_151116 - BLOCK
      ?auto_151117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151112 ?auto_151111 ) ( ON-TABLE ?auto_151109 ) ( ON ?auto_151110 ?auto_151109 ) ( ON ?auto_151111 ?auto_151110 ) ( not ( = ?auto_151109 ?auto_151110 ) ) ( not ( = ?auto_151109 ?auto_151111 ) ) ( not ( = ?auto_151109 ?auto_151112 ) ) ( not ( = ?auto_151110 ?auto_151111 ) ) ( not ( = ?auto_151110 ?auto_151112 ) ) ( not ( = ?auto_151111 ?auto_151112 ) ) ( not ( = ?auto_151109 ?auto_151114 ) ) ( not ( = ?auto_151109 ?auto_151113 ) ) ( not ( = ?auto_151110 ?auto_151114 ) ) ( not ( = ?auto_151110 ?auto_151113 ) ) ( not ( = ?auto_151111 ?auto_151114 ) ) ( not ( = ?auto_151111 ?auto_151113 ) ) ( not ( = ?auto_151112 ?auto_151114 ) ) ( not ( = ?auto_151112 ?auto_151113 ) ) ( not ( = ?auto_151114 ?auto_151113 ) ) ( ON ?auto_151114 ?auto_151112 ) ( CLEAR ?auto_151114 ) ( HOLDING ?auto_151113 ) ( CLEAR ?auto_151115 ) ( ON-TABLE ?auto_151116 ) ( ON ?auto_151117 ?auto_151116 ) ( ON ?auto_151115 ?auto_151117 ) ( not ( = ?auto_151116 ?auto_151117 ) ) ( not ( = ?auto_151116 ?auto_151115 ) ) ( not ( = ?auto_151116 ?auto_151113 ) ) ( not ( = ?auto_151117 ?auto_151115 ) ) ( not ( = ?auto_151117 ?auto_151113 ) ) ( not ( = ?auto_151115 ?auto_151113 ) ) ( not ( = ?auto_151109 ?auto_151115 ) ) ( not ( = ?auto_151109 ?auto_151116 ) ) ( not ( = ?auto_151109 ?auto_151117 ) ) ( not ( = ?auto_151110 ?auto_151115 ) ) ( not ( = ?auto_151110 ?auto_151116 ) ) ( not ( = ?auto_151110 ?auto_151117 ) ) ( not ( = ?auto_151111 ?auto_151115 ) ) ( not ( = ?auto_151111 ?auto_151116 ) ) ( not ( = ?auto_151111 ?auto_151117 ) ) ( not ( = ?auto_151112 ?auto_151115 ) ) ( not ( = ?auto_151112 ?auto_151116 ) ) ( not ( = ?auto_151112 ?auto_151117 ) ) ( not ( = ?auto_151114 ?auto_151115 ) ) ( not ( = ?auto_151114 ?auto_151116 ) ) ( not ( = ?auto_151114 ?auto_151117 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151116 ?auto_151117 ?auto_151115 ?auto_151113 )
      ( MAKE-3PILE ?auto_151109 ?auto_151110 ?auto_151111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151118 - BLOCK
      ?auto_151119 - BLOCK
      ?auto_151120 - BLOCK
    )
    :vars
    (
      ?auto_151126 - BLOCK
      ?auto_151124 - BLOCK
      ?auto_151123 - BLOCK
      ?auto_151122 - BLOCK
      ?auto_151121 - BLOCK
      ?auto_151125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151126 ?auto_151120 ) ( ON-TABLE ?auto_151118 ) ( ON ?auto_151119 ?auto_151118 ) ( ON ?auto_151120 ?auto_151119 ) ( not ( = ?auto_151118 ?auto_151119 ) ) ( not ( = ?auto_151118 ?auto_151120 ) ) ( not ( = ?auto_151118 ?auto_151126 ) ) ( not ( = ?auto_151119 ?auto_151120 ) ) ( not ( = ?auto_151119 ?auto_151126 ) ) ( not ( = ?auto_151120 ?auto_151126 ) ) ( not ( = ?auto_151118 ?auto_151124 ) ) ( not ( = ?auto_151118 ?auto_151123 ) ) ( not ( = ?auto_151119 ?auto_151124 ) ) ( not ( = ?auto_151119 ?auto_151123 ) ) ( not ( = ?auto_151120 ?auto_151124 ) ) ( not ( = ?auto_151120 ?auto_151123 ) ) ( not ( = ?auto_151126 ?auto_151124 ) ) ( not ( = ?auto_151126 ?auto_151123 ) ) ( not ( = ?auto_151124 ?auto_151123 ) ) ( ON ?auto_151124 ?auto_151126 ) ( CLEAR ?auto_151122 ) ( ON-TABLE ?auto_151121 ) ( ON ?auto_151125 ?auto_151121 ) ( ON ?auto_151122 ?auto_151125 ) ( not ( = ?auto_151121 ?auto_151125 ) ) ( not ( = ?auto_151121 ?auto_151122 ) ) ( not ( = ?auto_151121 ?auto_151123 ) ) ( not ( = ?auto_151125 ?auto_151122 ) ) ( not ( = ?auto_151125 ?auto_151123 ) ) ( not ( = ?auto_151122 ?auto_151123 ) ) ( not ( = ?auto_151118 ?auto_151122 ) ) ( not ( = ?auto_151118 ?auto_151121 ) ) ( not ( = ?auto_151118 ?auto_151125 ) ) ( not ( = ?auto_151119 ?auto_151122 ) ) ( not ( = ?auto_151119 ?auto_151121 ) ) ( not ( = ?auto_151119 ?auto_151125 ) ) ( not ( = ?auto_151120 ?auto_151122 ) ) ( not ( = ?auto_151120 ?auto_151121 ) ) ( not ( = ?auto_151120 ?auto_151125 ) ) ( not ( = ?auto_151126 ?auto_151122 ) ) ( not ( = ?auto_151126 ?auto_151121 ) ) ( not ( = ?auto_151126 ?auto_151125 ) ) ( not ( = ?auto_151124 ?auto_151122 ) ) ( not ( = ?auto_151124 ?auto_151121 ) ) ( not ( = ?auto_151124 ?auto_151125 ) ) ( ON ?auto_151123 ?auto_151124 ) ( CLEAR ?auto_151123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151118 ?auto_151119 ?auto_151120 ?auto_151126 ?auto_151124 )
      ( MAKE-3PILE ?auto_151118 ?auto_151119 ?auto_151120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151127 - BLOCK
      ?auto_151128 - BLOCK
      ?auto_151129 - BLOCK
    )
    :vars
    (
      ?auto_151133 - BLOCK
      ?auto_151130 - BLOCK
      ?auto_151134 - BLOCK
      ?auto_151132 - BLOCK
      ?auto_151131 - BLOCK
      ?auto_151135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151133 ?auto_151129 ) ( ON-TABLE ?auto_151127 ) ( ON ?auto_151128 ?auto_151127 ) ( ON ?auto_151129 ?auto_151128 ) ( not ( = ?auto_151127 ?auto_151128 ) ) ( not ( = ?auto_151127 ?auto_151129 ) ) ( not ( = ?auto_151127 ?auto_151133 ) ) ( not ( = ?auto_151128 ?auto_151129 ) ) ( not ( = ?auto_151128 ?auto_151133 ) ) ( not ( = ?auto_151129 ?auto_151133 ) ) ( not ( = ?auto_151127 ?auto_151130 ) ) ( not ( = ?auto_151127 ?auto_151134 ) ) ( not ( = ?auto_151128 ?auto_151130 ) ) ( not ( = ?auto_151128 ?auto_151134 ) ) ( not ( = ?auto_151129 ?auto_151130 ) ) ( not ( = ?auto_151129 ?auto_151134 ) ) ( not ( = ?auto_151133 ?auto_151130 ) ) ( not ( = ?auto_151133 ?auto_151134 ) ) ( not ( = ?auto_151130 ?auto_151134 ) ) ( ON ?auto_151130 ?auto_151133 ) ( ON-TABLE ?auto_151132 ) ( ON ?auto_151131 ?auto_151132 ) ( not ( = ?auto_151132 ?auto_151131 ) ) ( not ( = ?auto_151132 ?auto_151135 ) ) ( not ( = ?auto_151132 ?auto_151134 ) ) ( not ( = ?auto_151131 ?auto_151135 ) ) ( not ( = ?auto_151131 ?auto_151134 ) ) ( not ( = ?auto_151135 ?auto_151134 ) ) ( not ( = ?auto_151127 ?auto_151135 ) ) ( not ( = ?auto_151127 ?auto_151132 ) ) ( not ( = ?auto_151127 ?auto_151131 ) ) ( not ( = ?auto_151128 ?auto_151135 ) ) ( not ( = ?auto_151128 ?auto_151132 ) ) ( not ( = ?auto_151128 ?auto_151131 ) ) ( not ( = ?auto_151129 ?auto_151135 ) ) ( not ( = ?auto_151129 ?auto_151132 ) ) ( not ( = ?auto_151129 ?auto_151131 ) ) ( not ( = ?auto_151133 ?auto_151135 ) ) ( not ( = ?auto_151133 ?auto_151132 ) ) ( not ( = ?auto_151133 ?auto_151131 ) ) ( not ( = ?auto_151130 ?auto_151135 ) ) ( not ( = ?auto_151130 ?auto_151132 ) ) ( not ( = ?auto_151130 ?auto_151131 ) ) ( ON ?auto_151134 ?auto_151130 ) ( CLEAR ?auto_151134 ) ( HOLDING ?auto_151135 ) ( CLEAR ?auto_151131 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151132 ?auto_151131 ?auto_151135 )
      ( MAKE-3PILE ?auto_151127 ?auto_151128 ?auto_151129 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151136 - BLOCK
      ?auto_151137 - BLOCK
      ?auto_151138 - BLOCK
    )
    :vars
    (
      ?auto_151144 - BLOCK
      ?auto_151143 - BLOCK
      ?auto_151142 - BLOCK
      ?auto_151140 - BLOCK
      ?auto_151141 - BLOCK
      ?auto_151139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151144 ?auto_151138 ) ( ON-TABLE ?auto_151136 ) ( ON ?auto_151137 ?auto_151136 ) ( ON ?auto_151138 ?auto_151137 ) ( not ( = ?auto_151136 ?auto_151137 ) ) ( not ( = ?auto_151136 ?auto_151138 ) ) ( not ( = ?auto_151136 ?auto_151144 ) ) ( not ( = ?auto_151137 ?auto_151138 ) ) ( not ( = ?auto_151137 ?auto_151144 ) ) ( not ( = ?auto_151138 ?auto_151144 ) ) ( not ( = ?auto_151136 ?auto_151143 ) ) ( not ( = ?auto_151136 ?auto_151142 ) ) ( not ( = ?auto_151137 ?auto_151143 ) ) ( not ( = ?auto_151137 ?auto_151142 ) ) ( not ( = ?auto_151138 ?auto_151143 ) ) ( not ( = ?auto_151138 ?auto_151142 ) ) ( not ( = ?auto_151144 ?auto_151143 ) ) ( not ( = ?auto_151144 ?auto_151142 ) ) ( not ( = ?auto_151143 ?auto_151142 ) ) ( ON ?auto_151143 ?auto_151144 ) ( ON-TABLE ?auto_151140 ) ( ON ?auto_151141 ?auto_151140 ) ( not ( = ?auto_151140 ?auto_151141 ) ) ( not ( = ?auto_151140 ?auto_151139 ) ) ( not ( = ?auto_151140 ?auto_151142 ) ) ( not ( = ?auto_151141 ?auto_151139 ) ) ( not ( = ?auto_151141 ?auto_151142 ) ) ( not ( = ?auto_151139 ?auto_151142 ) ) ( not ( = ?auto_151136 ?auto_151139 ) ) ( not ( = ?auto_151136 ?auto_151140 ) ) ( not ( = ?auto_151136 ?auto_151141 ) ) ( not ( = ?auto_151137 ?auto_151139 ) ) ( not ( = ?auto_151137 ?auto_151140 ) ) ( not ( = ?auto_151137 ?auto_151141 ) ) ( not ( = ?auto_151138 ?auto_151139 ) ) ( not ( = ?auto_151138 ?auto_151140 ) ) ( not ( = ?auto_151138 ?auto_151141 ) ) ( not ( = ?auto_151144 ?auto_151139 ) ) ( not ( = ?auto_151144 ?auto_151140 ) ) ( not ( = ?auto_151144 ?auto_151141 ) ) ( not ( = ?auto_151143 ?auto_151139 ) ) ( not ( = ?auto_151143 ?auto_151140 ) ) ( not ( = ?auto_151143 ?auto_151141 ) ) ( ON ?auto_151142 ?auto_151143 ) ( CLEAR ?auto_151141 ) ( ON ?auto_151139 ?auto_151142 ) ( CLEAR ?auto_151139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151136 ?auto_151137 ?auto_151138 ?auto_151144 ?auto_151143 ?auto_151142 )
      ( MAKE-3PILE ?auto_151136 ?auto_151137 ?auto_151138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151145 - BLOCK
      ?auto_151146 - BLOCK
      ?auto_151147 - BLOCK
    )
    :vars
    (
      ?auto_151153 - BLOCK
      ?auto_151152 - BLOCK
      ?auto_151149 - BLOCK
      ?auto_151148 - BLOCK
      ?auto_151150 - BLOCK
      ?auto_151151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151153 ?auto_151147 ) ( ON-TABLE ?auto_151145 ) ( ON ?auto_151146 ?auto_151145 ) ( ON ?auto_151147 ?auto_151146 ) ( not ( = ?auto_151145 ?auto_151146 ) ) ( not ( = ?auto_151145 ?auto_151147 ) ) ( not ( = ?auto_151145 ?auto_151153 ) ) ( not ( = ?auto_151146 ?auto_151147 ) ) ( not ( = ?auto_151146 ?auto_151153 ) ) ( not ( = ?auto_151147 ?auto_151153 ) ) ( not ( = ?auto_151145 ?auto_151152 ) ) ( not ( = ?auto_151145 ?auto_151149 ) ) ( not ( = ?auto_151146 ?auto_151152 ) ) ( not ( = ?auto_151146 ?auto_151149 ) ) ( not ( = ?auto_151147 ?auto_151152 ) ) ( not ( = ?auto_151147 ?auto_151149 ) ) ( not ( = ?auto_151153 ?auto_151152 ) ) ( not ( = ?auto_151153 ?auto_151149 ) ) ( not ( = ?auto_151152 ?auto_151149 ) ) ( ON ?auto_151152 ?auto_151153 ) ( ON-TABLE ?auto_151148 ) ( not ( = ?auto_151148 ?auto_151150 ) ) ( not ( = ?auto_151148 ?auto_151151 ) ) ( not ( = ?auto_151148 ?auto_151149 ) ) ( not ( = ?auto_151150 ?auto_151151 ) ) ( not ( = ?auto_151150 ?auto_151149 ) ) ( not ( = ?auto_151151 ?auto_151149 ) ) ( not ( = ?auto_151145 ?auto_151151 ) ) ( not ( = ?auto_151145 ?auto_151148 ) ) ( not ( = ?auto_151145 ?auto_151150 ) ) ( not ( = ?auto_151146 ?auto_151151 ) ) ( not ( = ?auto_151146 ?auto_151148 ) ) ( not ( = ?auto_151146 ?auto_151150 ) ) ( not ( = ?auto_151147 ?auto_151151 ) ) ( not ( = ?auto_151147 ?auto_151148 ) ) ( not ( = ?auto_151147 ?auto_151150 ) ) ( not ( = ?auto_151153 ?auto_151151 ) ) ( not ( = ?auto_151153 ?auto_151148 ) ) ( not ( = ?auto_151153 ?auto_151150 ) ) ( not ( = ?auto_151152 ?auto_151151 ) ) ( not ( = ?auto_151152 ?auto_151148 ) ) ( not ( = ?auto_151152 ?auto_151150 ) ) ( ON ?auto_151149 ?auto_151152 ) ( ON ?auto_151151 ?auto_151149 ) ( CLEAR ?auto_151151 ) ( HOLDING ?auto_151150 ) ( CLEAR ?auto_151148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151148 ?auto_151150 )
      ( MAKE-3PILE ?auto_151145 ?auto_151146 ?auto_151147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153012 - BLOCK
      ?auto_153013 - BLOCK
      ?auto_153014 - BLOCK
    )
    :vars
    (
      ?auto_153019 - BLOCK
      ?auto_153018 - BLOCK
      ?auto_153017 - BLOCK
      ?auto_153015 - BLOCK
      ?auto_153016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153019 ?auto_153014 ) ( ON-TABLE ?auto_153012 ) ( ON ?auto_153013 ?auto_153012 ) ( ON ?auto_153014 ?auto_153013 ) ( not ( = ?auto_153012 ?auto_153013 ) ) ( not ( = ?auto_153012 ?auto_153014 ) ) ( not ( = ?auto_153012 ?auto_153019 ) ) ( not ( = ?auto_153013 ?auto_153014 ) ) ( not ( = ?auto_153013 ?auto_153019 ) ) ( not ( = ?auto_153014 ?auto_153019 ) ) ( not ( = ?auto_153012 ?auto_153018 ) ) ( not ( = ?auto_153012 ?auto_153017 ) ) ( not ( = ?auto_153013 ?auto_153018 ) ) ( not ( = ?auto_153013 ?auto_153017 ) ) ( not ( = ?auto_153014 ?auto_153018 ) ) ( not ( = ?auto_153014 ?auto_153017 ) ) ( not ( = ?auto_153019 ?auto_153018 ) ) ( not ( = ?auto_153019 ?auto_153017 ) ) ( not ( = ?auto_153018 ?auto_153017 ) ) ( ON ?auto_153018 ?auto_153019 ) ( not ( = ?auto_153015 ?auto_153016 ) ) ( not ( = ?auto_153015 ?auto_153017 ) ) ( not ( = ?auto_153016 ?auto_153017 ) ) ( not ( = ?auto_153012 ?auto_153016 ) ) ( not ( = ?auto_153012 ?auto_153015 ) ) ( not ( = ?auto_153013 ?auto_153016 ) ) ( not ( = ?auto_153013 ?auto_153015 ) ) ( not ( = ?auto_153014 ?auto_153016 ) ) ( not ( = ?auto_153014 ?auto_153015 ) ) ( not ( = ?auto_153019 ?auto_153016 ) ) ( not ( = ?auto_153019 ?auto_153015 ) ) ( not ( = ?auto_153018 ?auto_153016 ) ) ( not ( = ?auto_153018 ?auto_153015 ) ) ( ON ?auto_153017 ?auto_153018 ) ( ON ?auto_153016 ?auto_153017 ) ( ON ?auto_153015 ?auto_153016 ) ( CLEAR ?auto_153015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153012 ?auto_153013 ?auto_153014 ?auto_153019 ?auto_153018 ?auto_153017 ?auto_153016 )
      ( MAKE-3PILE ?auto_153012 ?auto_153013 ?auto_153014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151163 - BLOCK
      ?auto_151164 - BLOCK
      ?auto_151165 - BLOCK
    )
    :vars
    (
      ?auto_151171 - BLOCK
      ?auto_151169 - BLOCK
      ?auto_151166 - BLOCK
      ?auto_151168 - BLOCK
      ?auto_151167 - BLOCK
      ?auto_151170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151171 ?auto_151165 ) ( ON-TABLE ?auto_151163 ) ( ON ?auto_151164 ?auto_151163 ) ( ON ?auto_151165 ?auto_151164 ) ( not ( = ?auto_151163 ?auto_151164 ) ) ( not ( = ?auto_151163 ?auto_151165 ) ) ( not ( = ?auto_151163 ?auto_151171 ) ) ( not ( = ?auto_151164 ?auto_151165 ) ) ( not ( = ?auto_151164 ?auto_151171 ) ) ( not ( = ?auto_151165 ?auto_151171 ) ) ( not ( = ?auto_151163 ?auto_151169 ) ) ( not ( = ?auto_151163 ?auto_151166 ) ) ( not ( = ?auto_151164 ?auto_151169 ) ) ( not ( = ?auto_151164 ?auto_151166 ) ) ( not ( = ?auto_151165 ?auto_151169 ) ) ( not ( = ?auto_151165 ?auto_151166 ) ) ( not ( = ?auto_151171 ?auto_151169 ) ) ( not ( = ?auto_151171 ?auto_151166 ) ) ( not ( = ?auto_151169 ?auto_151166 ) ) ( ON ?auto_151169 ?auto_151171 ) ( not ( = ?auto_151168 ?auto_151167 ) ) ( not ( = ?auto_151168 ?auto_151170 ) ) ( not ( = ?auto_151168 ?auto_151166 ) ) ( not ( = ?auto_151167 ?auto_151170 ) ) ( not ( = ?auto_151167 ?auto_151166 ) ) ( not ( = ?auto_151170 ?auto_151166 ) ) ( not ( = ?auto_151163 ?auto_151170 ) ) ( not ( = ?auto_151163 ?auto_151168 ) ) ( not ( = ?auto_151163 ?auto_151167 ) ) ( not ( = ?auto_151164 ?auto_151170 ) ) ( not ( = ?auto_151164 ?auto_151168 ) ) ( not ( = ?auto_151164 ?auto_151167 ) ) ( not ( = ?auto_151165 ?auto_151170 ) ) ( not ( = ?auto_151165 ?auto_151168 ) ) ( not ( = ?auto_151165 ?auto_151167 ) ) ( not ( = ?auto_151171 ?auto_151170 ) ) ( not ( = ?auto_151171 ?auto_151168 ) ) ( not ( = ?auto_151171 ?auto_151167 ) ) ( not ( = ?auto_151169 ?auto_151170 ) ) ( not ( = ?auto_151169 ?auto_151168 ) ) ( not ( = ?auto_151169 ?auto_151167 ) ) ( ON ?auto_151166 ?auto_151169 ) ( ON ?auto_151170 ?auto_151166 ) ( ON ?auto_151167 ?auto_151170 ) ( CLEAR ?auto_151167 ) ( HOLDING ?auto_151168 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151168 )
      ( MAKE-3PILE ?auto_151163 ?auto_151164 ?auto_151165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_151172 - BLOCK
      ?auto_151173 - BLOCK
      ?auto_151174 - BLOCK
    )
    :vars
    (
      ?auto_151179 - BLOCK
      ?auto_151177 - BLOCK
      ?auto_151180 - BLOCK
      ?auto_151178 - BLOCK
      ?auto_151176 - BLOCK
      ?auto_151175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151179 ?auto_151174 ) ( ON-TABLE ?auto_151172 ) ( ON ?auto_151173 ?auto_151172 ) ( ON ?auto_151174 ?auto_151173 ) ( not ( = ?auto_151172 ?auto_151173 ) ) ( not ( = ?auto_151172 ?auto_151174 ) ) ( not ( = ?auto_151172 ?auto_151179 ) ) ( not ( = ?auto_151173 ?auto_151174 ) ) ( not ( = ?auto_151173 ?auto_151179 ) ) ( not ( = ?auto_151174 ?auto_151179 ) ) ( not ( = ?auto_151172 ?auto_151177 ) ) ( not ( = ?auto_151172 ?auto_151180 ) ) ( not ( = ?auto_151173 ?auto_151177 ) ) ( not ( = ?auto_151173 ?auto_151180 ) ) ( not ( = ?auto_151174 ?auto_151177 ) ) ( not ( = ?auto_151174 ?auto_151180 ) ) ( not ( = ?auto_151179 ?auto_151177 ) ) ( not ( = ?auto_151179 ?auto_151180 ) ) ( not ( = ?auto_151177 ?auto_151180 ) ) ( ON ?auto_151177 ?auto_151179 ) ( not ( = ?auto_151178 ?auto_151176 ) ) ( not ( = ?auto_151178 ?auto_151175 ) ) ( not ( = ?auto_151178 ?auto_151180 ) ) ( not ( = ?auto_151176 ?auto_151175 ) ) ( not ( = ?auto_151176 ?auto_151180 ) ) ( not ( = ?auto_151175 ?auto_151180 ) ) ( not ( = ?auto_151172 ?auto_151175 ) ) ( not ( = ?auto_151172 ?auto_151178 ) ) ( not ( = ?auto_151172 ?auto_151176 ) ) ( not ( = ?auto_151173 ?auto_151175 ) ) ( not ( = ?auto_151173 ?auto_151178 ) ) ( not ( = ?auto_151173 ?auto_151176 ) ) ( not ( = ?auto_151174 ?auto_151175 ) ) ( not ( = ?auto_151174 ?auto_151178 ) ) ( not ( = ?auto_151174 ?auto_151176 ) ) ( not ( = ?auto_151179 ?auto_151175 ) ) ( not ( = ?auto_151179 ?auto_151178 ) ) ( not ( = ?auto_151179 ?auto_151176 ) ) ( not ( = ?auto_151177 ?auto_151175 ) ) ( not ( = ?auto_151177 ?auto_151178 ) ) ( not ( = ?auto_151177 ?auto_151176 ) ) ( ON ?auto_151180 ?auto_151177 ) ( ON ?auto_151175 ?auto_151180 ) ( ON ?auto_151176 ?auto_151175 ) ( ON ?auto_151178 ?auto_151176 ) ( CLEAR ?auto_151178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151172 ?auto_151173 ?auto_151174 ?auto_151179 ?auto_151177 ?auto_151180 ?auto_151175 ?auto_151176 )
      ( MAKE-3PILE ?auto_151172 ?auto_151173 ?auto_151174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151187 - BLOCK
      ?auto_151188 - BLOCK
      ?auto_151189 - BLOCK
      ?auto_151190 - BLOCK
      ?auto_151191 - BLOCK
      ?auto_151192 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151192 ) ( CLEAR ?auto_151191 ) ( ON-TABLE ?auto_151187 ) ( ON ?auto_151188 ?auto_151187 ) ( ON ?auto_151189 ?auto_151188 ) ( ON ?auto_151190 ?auto_151189 ) ( ON ?auto_151191 ?auto_151190 ) ( not ( = ?auto_151187 ?auto_151188 ) ) ( not ( = ?auto_151187 ?auto_151189 ) ) ( not ( = ?auto_151187 ?auto_151190 ) ) ( not ( = ?auto_151187 ?auto_151191 ) ) ( not ( = ?auto_151187 ?auto_151192 ) ) ( not ( = ?auto_151188 ?auto_151189 ) ) ( not ( = ?auto_151188 ?auto_151190 ) ) ( not ( = ?auto_151188 ?auto_151191 ) ) ( not ( = ?auto_151188 ?auto_151192 ) ) ( not ( = ?auto_151189 ?auto_151190 ) ) ( not ( = ?auto_151189 ?auto_151191 ) ) ( not ( = ?auto_151189 ?auto_151192 ) ) ( not ( = ?auto_151190 ?auto_151191 ) ) ( not ( = ?auto_151190 ?auto_151192 ) ) ( not ( = ?auto_151191 ?auto_151192 ) ) )
    :subtasks
    ( ( !STACK ?auto_151192 ?auto_151191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151193 - BLOCK
      ?auto_151194 - BLOCK
      ?auto_151195 - BLOCK
      ?auto_151196 - BLOCK
      ?auto_151197 - BLOCK
      ?auto_151198 - BLOCK
    )
    :vars
    (
      ?auto_151199 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151197 ) ( ON-TABLE ?auto_151193 ) ( ON ?auto_151194 ?auto_151193 ) ( ON ?auto_151195 ?auto_151194 ) ( ON ?auto_151196 ?auto_151195 ) ( ON ?auto_151197 ?auto_151196 ) ( not ( = ?auto_151193 ?auto_151194 ) ) ( not ( = ?auto_151193 ?auto_151195 ) ) ( not ( = ?auto_151193 ?auto_151196 ) ) ( not ( = ?auto_151193 ?auto_151197 ) ) ( not ( = ?auto_151193 ?auto_151198 ) ) ( not ( = ?auto_151194 ?auto_151195 ) ) ( not ( = ?auto_151194 ?auto_151196 ) ) ( not ( = ?auto_151194 ?auto_151197 ) ) ( not ( = ?auto_151194 ?auto_151198 ) ) ( not ( = ?auto_151195 ?auto_151196 ) ) ( not ( = ?auto_151195 ?auto_151197 ) ) ( not ( = ?auto_151195 ?auto_151198 ) ) ( not ( = ?auto_151196 ?auto_151197 ) ) ( not ( = ?auto_151196 ?auto_151198 ) ) ( not ( = ?auto_151197 ?auto_151198 ) ) ( ON ?auto_151198 ?auto_151199 ) ( CLEAR ?auto_151198 ) ( HAND-EMPTY ) ( not ( = ?auto_151193 ?auto_151199 ) ) ( not ( = ?auto_151194 ?auto_151199 ) ) ( not ( = ?auto_151195 ?auto_151199 ) ) ( not ( = ?auto_151196 ?auto_151199 ) ) ( not ( = ?auto_151197 ?auto_151199 ) ) ( not ( = ?auto_151198 ?auto_151199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151198 ?auto_151199 )
      ( MAKE-6PILE ?auto_151193 ?auto_151194 ?auto_151195 ?auto_151196 ?auto_151197 ?auto_151198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151200 - BLOCK
      ?auto_151201 - BLOCK
      ?auto_151202 - BLOCK
      ?auto_151203 - BLOCK
      ?auto_151204 - BLOCK
      ?auto_151205 - BLOCK
    )
    :vars
    (
      ?auto_151206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151200 ) ( ON ?auto_151201 ?auto_151200 ) ( ON ?auto_151202 ?auto_151201 ) ( ON ?auto_151203 ?auto_151202 ) ( not ( = ?auto_151200 ?auto_151201 ) ) ( not ( = ?auto_151200 ?auto_151202 ) ) ( not ( = ?auto_151200 ?auto_151203 ) ) ( not ( = ?auto_151200 ?auto_151204 ) ) ( not ( = ?auto_151200 ?auto_151205 ) ) ( not ( = ?auto_151201 ?auto_151202 ) ) ( not ( = ?auto_151201 ?auto_151203 ) ) ( not ( = ?auto_151201 ?auto_151204 ) ) ( not ( = ?auto_151201 ?auto_151205 ) ) ( not ( = ?auto_151202 ?auto_151203 ) ) ( not ( = ?auto_151202 ?auto_151204 ) ) ( not ( = ?auto_151202 ?auto_151205 ) ) ( not ( = ?auto_151203 ?auto_151204 ) ) ( not ( = ?auto_151203 ?auto_151205 ) ) ( not ( = ?auto_151204 ?auto_151205 ) ) ( ON ?auto_151205 ?auto_151206 ) ( CLEAR ?auto_151205 ) ( not ( = ?auto_151200 ?auto_151206 ) ) ( not ( = ?auto_151201 ?auto_151206 ) ) ( not ( = ?auto_151202 ?auto_151206 ) ) ( not ( = ?auto_151203 ?auto_151206 ) ) ( not ( = ?auto_151204 ?auto_151206 ) ) ( not ( = ?auto_151205 ?auto_151206 ) ) ( HOLDING ?auto_151204 ) ( CLEAR ?auto_151203 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151200 ?auto_151201 ?auto_151202 ?auto_151203 ?auto_151204 )
      ( MAKE-6PILE ?auto_151200 ?auto_151201 ?auto_151202 ?auto_151203 ?auto_151204 ?auto_151205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151207 - BLOCK
      ?auto_151208 - BLOCK
      ?auto_151209 - BLOCK
      ?auto_151210 - BLOCK
      ?auto_151211 - BLOCK
      ?auto_151212 - BLOCK
    )
    :vars
    (
      ?auto_151213 - BLOCK
      ?auto_151214 - BLOCK
      ?auto_151215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151207 ) ( ON ?auto_151208 ?auto_151207 ) ( ON ?auto_151209 ?auto_151208 ) ( ON ?auto_151210 ?auto_151209 ) ( not ( = ?auto_151207 ?auto_151208 ) ) ( not ( = ?auto_151207 ?auto_151209 ) ) ( not ( = ?auto_151207 ?auto_151210 ) ) ( not ( = ?auto_151207 ?auto_151211 ) ) ( not ( = ?auto_151207 ?auto_151212 ) ) ( not ( = ?auto_151208 ?auto_151209 ) ) ( not ( = ?auto_151208 ?auto_151210 ) ) ( not ( = ?auto_151208 ?auto_151211 ) ) ( not ( = ?auto_151208 ?auto_151212 ) ) ( not ( = ?auto_151209 ?auto_151210 ) ) ( not ( = ?auto_151209 ?auto_151211 ) ) ( not ( = ?auto_151209 ?auto_151212 ) ) ( not ( = ?auto_151210 ?auto_151211 ) ) ( not ( = ?auto_151210 ?auto_151212 ) ) ( not ( = ?auto_151211 ?auto_151212 ) ) ( ON ?auto_151212 ?auto_151213 ) ( not ( = ?auto_151207 ?auto_151213 ) ) ( not ( = ?auto_151208 ?auto_151213 ) ) ( not ( = ?auto_151209 ?auto_151213 ) ) ( not ( = ?auto_151210 ?auto_151213 ) ) ( not ( = ?auto_151211 ?auto_151213 ) ) ( not ( = ?auto_151212 ?auto_151213 ) ) ( CLEAR ?auto_151210 ) ( ON ?auto_151211 ?auto_151212 ) ( CLEAR ?auto_151211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151214 ) ( ON ?auto_151215 ?auto_151214 ) ( ON ?auto_151213 ?auto_151215 ) ( not ( = ?auto_151214 ?auto_151215 ) ) ( not ( = ?auto_151214 ?auto_151213 ) ) ( not ( = ?auto_151214 ?auto_151212 ) ) ( not ( = ?auto_151214 ?auto_151211 ) ) ( not ( = ?auto_151215 ?auto_151213 ) ) ( not ( = ?auto_151215 ?auto_151212 ) ) ( not ( = ?auto_151215 ?auto_151211 ) ) ( not ( = ?auto_151207 ?auto_151214 ) ) ( not ( = ?auto_151207 ?auto_151215 ) ) ( not ( = ?auto_151208 ?auto_151214 ) ) ( not ( = ?auto_151208 ?auto_151215 ) ) ( not ( = ?auto_151209 ?auto_151214 ) ) ( not ( = ?auto_151209 ?auto_151215 ) ) ( not ( = ?auto_151210 ?auto_151214 ) ) ( not ( = ?auto_151210 ?auto_151215 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151214 ?auto_151215 ?auto_151213 ?auto_151212 )
      ( MAKE-6PILE ?auto_151207 ?auto_151208 ?auto_151209 ?auto_151210 ?auto_151211 ?auto_151212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151216 - BLOCK
      ?auto_151217 - BLOCK
      ?auto_151218 - BLOCK
      ?auto_151219 - BLOCK
      ?auto_151220 - BLOCK
      ?auto_151221 - BLOCK
    )
    :vars
    (
      ?auto_151224 - BLOCK
      ?auto_151222 - BLOCK
      ?auto_151223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151216 ) ( ON ?auto_151217 ?auto_151216 ) ( ON ?auto_151218 ?auto_151217 ) ( not ( = ?auto_151216 ?auto_151217 ) ) ( not ( = ?auto_151216 ?auto_151218 ) ) ( not ( = ?auto_151216 ?auto_151219 ) ) ( not ( = ?auto_151216 ?auto_151220 ) ) ( not ( = ?auto_151216 ?auto_151221 ) ) ( not ( = ?auto_151217 ?auto_151218 ) ) ( not ( = ?auto_151217 ?auto_151219 ) ) ( not ( = ?auto_151217 ?auto_151220 ) ) ( not ( = ?auto_151217 ?auto_151221 ) ) ( not ( = ?auto_151218 ?auto_151219 ) ) ( not ( = ?auto_151218 ?auto_151220 ) ) ( not ( = ?auto_151218 ?auto_151221 ) ) ( not ( = ?auto_151219 ?auto_151220 ) ) ( not ( = ?auto_151219 ?auto_151221 ) ) ( not ( = ?auto_151220 ?auto_151221 ) ) ( ON ?auto_151221 ?auto_151224 ) ( not ( = ?auto_151216 ?auto_151224 ) ) ( not ( = ?auto_151217 ?auto_151224 ) ) ( not ( = ?auto_151218 ?auto_151224 ) ) ( not ( = ?auto_151219 ?auto_151224 ) ) ( not ( = ?auto_151220 ?auto_151224 ) ) ( not ( = ?auto_151221 ?auto_151224 ) ) ( ON ?auto_151220 ?auto_151221 ) ( CLEAR ?auto_151220 ) ( ON-TABLE ?auto_151222 ) ( ON ?auto_151223 ?auto_151222 ) ( ON ?auto_151224 ?auto_151223 ) ( not ( = ?auto_151222 ?auto_151223 ) ) ( not ( = ?auto_151222 ?auto_151224 ) ) ( not ( = ?auto_151222 ?auto_151221 ) ) ( not ( = ?auto_151222 ?auto_151220 ) ) ( not ( = ?auto_151223 ?auto_151224 ) ) ( not ( = ?auto_151223 ?auto_151221 ) ) ( not ( = ?auto_151223 ?auto_151220 ) ) ( not ( = ?auto_151216 ?auto_151222 ) ) ( not ( = ?auto_151216 ?auto_151223 ) ) ( not ( = ?auto_151217 ?auto_151222 ) ) ( not ( = ?auto_151217 ?auto_151223 ) ) ( not ( = ?auto_151218 ?auto_151222 ) ) ( not ( = ?auto_151218 ?auto_151223 ) ) ( not ( = ?auto_151219 ?auto_151222 ) ) ( not ( = ?auto_151219 ?auto_151223 ) ) ( HOLDING ?auto_151219 ) ( CLEAR ?auto_151218 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151216 ?auto_151217 ?auto_151218 ?auto_151219 )
      ( MAKE-6PILE ?auto_151216 ?auto_151217 ?auto_151218 ?auto_151219 ?auto_151220 ?auto_151221 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151225 - BLOCK
      ?auto_151226 - BLOCK
      ?auto_151227 - BLOCK
      ?auto_151228 - BLOCK
      ?auto_151229 - BLOCK
      ?auto_151230 - BLOCK
    )
    :vars
    (
      ?auto_151232 - BLOCK
      ?auto_151231 - BLOCK
      ?auto_151233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151225 ) ( ON ?auto_151226 ?auto_151225 ) ( ON ?auto_151227 ?auto_151226 ) ( not ( = ?auto_151225 ?auto_151226 ) ) ( not ( = ?auto_151225 ?auto_151227 ) ) ( not ( = ?auto_151225 ?auto_151228 ) ) ( not ( = ?auto_151225 ?auto_151229 ) ) ( not ( = ?auto_151225 ?auto_151230 ) ) ( not ( = ?auto_151226 ?auto_151227 ) ) ( not ( = ?auto_151226 ?auto_151228 ) ) ( not ( = ?auto_151226 ?auto_151229 ) ) ( not ( = ?auto_151226 ?auto_151230 ) ) ( not ( = ?auto_151227 ?auto_151228 ) ) ( not ( = ?auto_151227 ?auto_151229 ) ) ( not ( = ?auto_151227 ?auto_151230 ) ) ( not ( = ?auto_151228 ?auto_151229 ) ) ( not ( = ?auto_151228 ?auto_151230 ) ) ( not ( = ?auto_151229 ?auto_151230 ) ) ( ON ?auto_151230 ?auto_151232 ) ( not ( = ?auto_151225 ?auto_151232 ) ) ( not ( = ?auto_151226 ?auto_151232 ) ) ( not ( = ?auto_151227 ?auto_151232 ) ) ( not ( = ?auto_151228 ?auto_151232 ) ) ( not ( = ?auto_151229 ?auto_151232 ) ) ( not ( = ?auto_151230 ?auto_151232 ) ) ( ON ?auto_151229 ?auto_151230 ) ( ON-TABLE ?auto_151231 ) ( ON ?auto_151233 ?auto_151231 ) ( ON ?auto_151232 ?auto_151233 ) ( not ( = ?auto_151231 ?auto_151233 ) ) ( not ( = ?auto_151231 ?auto_151232 ) ) ( not ( = ?auto_151231 ?auto_151230 ) ) ( not ( = ?auto_151231 ?auto_151229 ) ) ( not ( = ?auto_151233 ?auto_151232 ) ) ( not ( = ?auto_151233 ?auto_151230 ) ) ( not ( = ?auto_151233 ?auto_151229 ) ) ( not ( = ?auto_151225 ?auto_151231 ) ) ( not ( = ?auto_151225 ?auto_151233 ) ) ( not ( = ?auto_151226 ?auto_151231 ) ) ( not ( = ?auto_151226 ?auto_151233 ) ) ( not ( = ?auto_151227 ?auto_151231 ) ) ( not ( = ?auto_151227 ?auto_151233 ) ) ( not ( = ?auto_151228 ?auto_151231 ) ) ( not ( = ?auto_151228 ?auto_151233 ) ) ( CLEAR ?auto_151227 ) ( ON ?auto_151228 ?auto_151229 ) ( CLEAR ?auto_151228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151231 ?auto_151233 ?auto_151232 ?auto_151230 ?auto_151229 )
      ( MAKE-6PILE ?auto_151225 ?auto_151226 ?auto_151227 ?auto_151228 ?auto_151229 ?auto_151230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151234 - BLOCK
      ?auto_151235 - BLOCK
      ?auto_151236 - BLOCK
      ?auto_151237 - BLOCK
      ?auto_151238 - BLOCK
      ?auto_151239 - BLOCK
    )
    :vars
    (
      ?auto_151240 - BLOCK
      ?auto_151242 - BLOCK
      ?auto_151241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151234 ) ( ON ?auto_151235 ?auto_151234 ) ( not ( = ?auto_151234 ?auto_151235 ) ) ( not ( = ?auto_151234 ?auto_151236 ) ) ( not ( = ?auto_151234 ?auto_151237 ) ) ( not ( = ?auto_151234 ?auto_151238 ) ) ( not ( = ?auto_151234 ?auto_151239 ) ) ( not ( = ?auto_151235 ?auto_151236 ) ) ( not ( = ?auto_151235 ?auto_151237 ) ) ( not ( = ?auto_151235 ?auto_151238 ) ) ( not ( = ?auto_151235 ?auto_151239 ) ) ( not ( = ?auto_151236 ?auto_151237 ) ) ( not ( = ?auto_151236 ?auto_151238 ) ) ( not ( = ?auto_151236 ?auto_151239 ) ) ( not ( = ?auto_151237 ?auto_151238 ) ) ( not ( = ?auto_151237 ?auto_151239 ) ) ( not ( = ?auto_151238 ?auto_151239 ) ) ( ON ?auto_151239 ?auto_151240 ) ( not ( = ?auto_151234 ?auto_151240 ) ) ( not ( = ?auto_151235 ?auto_151240 ) ) ( not ( = ?auto_151236 ?auto_151240 ) ) ( not ( = ?auto_151237 ?auto_151240 ) ) ( not ( = ?auto_151238 ?auto_151240 ) ) ( not ( = ?auto_151239 ?auto_151240 ) ) ( ON ?auto_151238 ?auto_151239 ) ( ON-TABLE ?auto_151242 ) ( ON ?auto_151241 ?auto_151242 ) ( ON ?auto_151240 ?auto_151241 ) ( not ( = ?auto_151242 ?auto_151241 ) ) ( not ( = ?auto_151242 ?auto_151240 ) ) ( not ( = ?auto_151242 ?auto_151239 ) ) ( not ( = ?auto_151242 ?auto_151238 ) ) ( not ( = ?auto_151241 ?auto_151240 ) ) ( not ( = ?auto_151241 ?auto_151239 ) ) ( not ( = ?auto_151241 ?auto_151238 ) ) ( not ( = ?auto_151234 ?auto_151242 ) ) ( not ( = ?auto_151234 ?auto_151241 ) ) ( not ( = ?auto_151235 ?auto_151242 ) ) ( not ( = ?auto_151235 ?auto_151241 ) ) ( not ( = ?auto_151236 ?auto_151242 ) ) ( not ( = ?auto_151236 ?auto_151241 ) ) ( not ( = ?auto_151237 ?auto_151242 ) ) ( not ( = ?auto_151237 ?auto_151241 ) ) ( ON ?auto_151237 ?auto_151238 ) ( CLEAR ?auto_151237 ) ( HOLDING ?auto_151236 ) ( CLEAR ?auto_151235 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151234 ?auto_151235 ?auto_151236 )
      ( MAKE-6PILE ?auto_151234 ?auto_151235 ?auto_151236 ?auto_151237 ?auto_151238 ?auto_151239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151243 - BLOCK
      ?auto_151244 - BLOCK
      ?auto_151245 - BLOCK
      ?auto_151246 - BLOCK
      ?auto_151247 - BLOCK
      ?auto_151248 - BLOCK
    )
    :vars
    (
      ?auto_151251 - BLOCK
      ?auto_151250 - BLOCK
      ?auto_151249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151243 ) ( ON ?auto_151244 ?auto_151243 ) ( not ( = ?auto_151243 ?auto_151244 ) ) ( not ( = ?auto_151243 ?auto_151245 ) ) ( not ( = ?auto_151243 ?auto_151246 ) ) ( not ( = ?auto_151243 ?auto_151247 ) ) ( not ( = ?auto_151243 ?auto_151248 ) ) ( not ( = ?auto_151244 ?auto_151245 ) ) ( not ( = ?auto_151244 ?auto_151246 ) ) ( not ( = ?auto_151244 ?auto_151247 ) ) ( not ( = ?auto_151244 ?auto_151248 ) ) ( not ( = ?auto_151245 ?auto_151246 ) ) ( not ( = ?auto_151245 ?auto_151247 ) ) ( not ( = ?auto_151245 ?auto_151248 ) ) ( not ( = ?auto_151246 ?auto_151247 ) ) ( not ( = ?auto_151246 ?auto_151248 ) ) ( not ( = ?auto_151247 ?auto_151248 ) ) ( ON ?auto_151248 ?auto_151251 ) ( not ( = ?auto_151243 ?auto_151251 ) ) ( not ( = ?auto_151244 ?auto_151251 ) ) ( not ( = ?auto_151245 ?auto_151251 ) ) ( not ( = ?auto_151246 ?auto_151251 ) ) ( not ( = ?auto_151247 ?auto_151251 ) ) ( not ( = ?auto_151248 ?auto_151251 ) ) ( ON ?auto_151247 ?auto_151248 ) ( ON-TABLE ?auto_151250 ) ( ON ?auto_151249 ?auto_151250 ) ( ON ?auto_151251 ?auto_151249 ) ( not ( = ?auto_151250 ?auto_151249 ) ) ( not ( = ?auto_151250 ?auto_151251 ) ) ( not ( = ?auto_151250 ?auto_151248 ) ) ( not ( = ?auto_151250 ?auto_151247 ) ) ( not ( = ?auto_151249 ?auto_151251 ) ) ( not ( = ?auto_151249 ?auto_151248 ) ) ( not ( = ?auto_151249 ?auto_151247 ) ) ( not ( = ?auto_151243 ?auto_151250 ) ) ( not ( = ?auto_151243 ?auto_151249 ) ) ( not ( = ?auto_151244 ?auto_151250 ) ) ( not ( = ?auto_151244 ?auto_151249 ) ) ( not ( = ?auto_151245 ?auto_151250 ) ) ( not ( = ?auto_151245 ?auto_151249 ) ) ( not ( = ?auto_151246 ?auto_151250 ) ) ( not ( = ?auto_151246 ?auto_151249 ) ) ( ON ?auto_151246 ?auto_151247 ) ( CLEAR ?auto_151244 ) ( ON ?auto_151245 ?auto_151246 ) ( CLEAR ?auto_151245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151250 ?auto_151249 ?auto_151251 ?auto_151248 ?auto_151247 ?auto_151246 )
      ( MAKE-6PILE ?auto_151243 ?auto_151244 ?auto_151245 ?auto_151246 ?auto_151247 ?auto_151248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151252 - BLOCK
      ?auto_151253 - BLOCK
      ?auto_151254 - BLOCK
      ?auto_151255 - BLOCK
      ?auto_151256 - BLOCK
      ?auto_151257 - BLOCK
    )
    :vars
    (
      ?auto_151259 - BLOCK
      ?auto_151258 - BLOCK
      ?auto_151260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151252 ) ( not ( = ?auto_151252 ?auto_151253 ) ) ( not ( = ?auto_151252 ?auto_151254 ) ) ( not ( = ?auto_151252 ?auto_151255 ) ) ( not ( = ?auto_151252 ?auto_151256 ) ) ( not ( = ?auto_151252 ?auto_151257 ) ) ( not ( = ?auto_151253 ?auto_151254 ) ) ( not ( = ?auto_151253 ?auto_151255 ) ) ( not ( = ?auto_151253 ?auto_151256 ) ) ( not ( = ?auto_151253 ?auto_151257 ) ) ( not ( = ?auto_151254 ?auto_151255 ) ) ( not ( = ?auto_151254 ?auto_151256 ) ) ( not ( = ?auto_151254 ?auto_151257 ) ) ( not ( = ?auto_151255 ?auto_151256 ) ) ( not ( = ?auto_151255 ?auto_151257 ) ) ( not ( = ?auto_151256 ?auto_151257 ) ) ( ON ?auto_151257 ?auto_151259 ) ( not ( = ?auto_151252 ?auto_151259 ) ) ( not ( = ?auto_151253 ?auto_151259 ) ) ( not ( = ?auto_151254 ?auto_151259 ) ) ( not ( = ?auto_151255 ?auto_151259 ) ) ( not ( = ?auto_151256 ?auto_151259 ) ) ( not ( = ?auto_151257 ?auto_151259 ) ) ( ON ?auto_151256 ?auto_151257 ) ( ON-TABLE ?auto_151258 ) ( ON ?auto_151260 ?auto_151258 ) ( ON ?auto_151259 ?auto_151260 ) ( not ( = ?auto_151258 ?auto_151260 ) ) ( not ( = ?auto_151258 ?auto_151259 ) ) ( not ( = ?auto_151258 ?auto_151257 ) ) ( not ( = ?auto_151258 ?auto_151256 ) ) ( not ( = ?auto_151260 ?auto_151259 ) ) ( not ( = ?auto_151260 ?auto_151257 ) ) ( not ( = ?auto_151260 ?auto_151256 ) ) ( not ( = ?auto_151252 ?auto_151258 ) ) ( not ( = ?auto_151252 ?auto_151260 ) ) ( not ( = ?auto_151253 ?auto_151258 ) ) ( not ( = ?auto_151253 ?auto_151260 ) ) ( not ( = ?auto_151254 ?auto_151258 ) ) ( not ( = ?auto_151254 ?auto_151260 ) ) ( not ( = ?auto_151255 ?auto_151258 ) ) ( not ( = ?auto_151255 ?auto_151260 ) ) ( ON ?auto_151255 ?auto_151256 ) ( ON ?auto_151254 ?auto_151255 ) ( CLEAR ?auto_151254 ) ( HOLDING ?auto_151253 ) ( CLEAR ?auto_151252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151252 ?auto_151253 )
      ( MAKE-6PILE ?auto_151252 ?auto_151253 ?auto_151254 ?auto_151255 ?auto_151256 ?auto_151257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151261 - BLOCK
      ?auto_151262 - BLOCK
      ?auto_151263 - BLOCK
      ?auto_151264 - BLOCK
      ?auto_151265 - BLOCK
      ?auto_151266 - BLOCK
    )
    :vars
    (
      ?auto_151269 - BLOCK
      ?auto_151268 - BLOCK
      ?auto_151267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151261 ) ( not ( = ?auto_151261 ?auto_151262 ) ) ( not ( = ?auto_151261 ?auto_151263 ) ) ( not ( = ?auto_151261 ?auto_151264 ) ) ( not ( = ?auto_151261 ?auto_151265 ) ) ( not ( = ?auto_151261 ?auto_151266 ) ) ( not ( = ?auto_151262 ?auto_151263 ) ) ( not ( = ?auto_151262 ?auto_151264 ) ) ( not ( = ?auto_151262 ?auto_151265 ) ) ( not ( = ?auto_151262 ?auto_151266 ) ) ( not ( = ?auto_151263 ?auto_151264 ) ) ( not ( = ?auto_151263 ?auto_151265 ) ) ( not ( = ?auto_151263 ?auto_151266 ) ) ( not ( = ?auto_151264 ?auto_151265 ) ) ( not ( = ?auto_151264 ?auto_151266 ) ) ( not ( = ?auto_151265 ?auto_151266 ) ) ( ON ?auto_151266 ?auto_151269 ) ( not ( = ?auto_151261 ?auto_151269 ) ) ( not ( = ?auto_151262 ?auto_151269 ) ) ( not ( = ?auto_151263 ?auto_151269 ) ) ( not ( = ?auto_151264 ?auto_151269 ) ) ( not ( = ?auto_151265 ?auto_151269 ) ) ( not ( = ?auto_151266 ?auto_151269 ) ) ( ON ?auto_151265 ?auto_151266 ) ( ON-TABLE ?auto_151268 ) ( ON ?auto_151267 ?auto_151268 ) ( ON ?auto_151269 ?auto_151267 ) ( not ( = ?auto_151268 ?auto_151267 ) ) ( not ( = ?auto_151268 ?auto_151269 ) ) ( not ( = ?auto_151268 ?auto_151266 ) ) ( not ( = ?auto_151268 ?auto_151265 ) ) ( not ( = ?auto_151267 ?auto_151269 ) ) ( not ( = ?auto_151267 ?auto_151266 ) ) ( not ( = ?auto_151267 ?auto_151265 ) ) ( not ( = ?auto_151261 ?auto_151268 ) ) ( not ( = ?auto_151261 ?auto_151267 ) ) ( not ( = ?auto_151262 ?auto_151268 ) ) ( not ( = ?auto_151262 ?auto_151267 ) ) ( not ( = ?auto_151263 ?auto_151268 ) ) ( not ( = ?auto_151263 ?auto_151267 ) ) ( not ( = ?auto_151264 ?auto_151268 ) ) ( not ( = ?auto_151264 ?auto_151267 ) ) ( ON ?auto_151264 ?auto_151265 ) ( ON ?auto_151263 ?auto_151264 ) ( CLEAR ?auto_151261 ) ( ON ?auto_151262 ?auto_151263 ) ( CLEAR ?auto_151262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151268 ?auto_151267 ?auto_151269 ?auto_151266 ?auto_151265 ?auto_151264 ?auto_151263 )
      ( MAKE-6PILE ?auto_151261 ?auto_151262 ?auto_151263 ?auto_151264 ?auto_151265 ?auto_151266 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151270 - BLOCK
      ?auto_151271 - BLOCK
      ?auto_151272 - BLOCK
      ?auto_151273 - BLOCK
      ?auto_151274 - BLOCK
      ?auto_151275 - BLOCK
    )
    :vars
    (
      ?auto_151277 - BLOCK
      ?auto_151278 - BLOCK
      ?auto_151276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151270 ?auto_151271 ) ) ( not ( = ?auto_151270 ?auto_151272 ) ) ( not ( = ?auto_151270 ?auto_151273 ) ) ( not ( = ?auto_151270 ?auto_151274 ) ) ( not ( = ?auto_151270 ?auto_151275 ) ) ( not ( = ?auto_151271 ?auto_151272 ) ) ( not ( = ?auto_151271 ?auto_151273 ) ) ( not ( = ?auto_151271 ?auto_151274 ) ) ( not ( = ?auto_151271 ?auto_151275 ) ) ( not ( = ?auto_151272 ?auto_151273 ) ) ( not ( = ?auto_151272 ?auto_151274 ) ) ( not ( = ?auto_151272 ?auto_151275 ) ) ( not ( = ?auto_151273 ?auto_151274 ) ) ( not ( = ?auto_151273 ?auto_151275 ) ) ( not ( = ?auto_151274 ?auto_151275 ) ) ( ON ?auto_151275 ?auto_151277 ) ( not ( = ?auto_151270 ?auto_151277 ) ) ( not ( = ?auto_151271 ?auto_151277 ) ) ( not ( = ?auto_151272 ?auto_151277 ) ) ( not ( = ?auto_151273 ?auto_151277 ) ) ( not ( = ?auto_151274 ?auto_151277 ) ) ( not ( = ?auto_151275 ?auto_151277 ) ) ( ON ?auto_151274 ?auto_151275 ) ( ON-TABLE ?auto_151278 ) ( ON ?auto_151276 ?auto_151278 ) ( ON ?auto_151277 ?auto_151276 ) ( not ( = ?auto_151278 ?auto_151276 ) ) ( not ( = ?auto_151278 ?auto_151277 ) ) ( not ( = ?auto_151278 ?auto_151275 ) ) ( not ( = ?auto_151278 ?auto_151274 ) ) ( not ( = ?auto_151276 ?auto_151277 ) ) ( not ( = ?auto_151276 ?auto_151275 ) ) ( not ( = ?auto_151276 ?auto_151274 ) ) ( not ( = ?auto_151270 ?auto_151278 ) ) ( not ( = ?auto_151270 ?auto_151276 ) ) ( not ( = ?auto_151271 ?auto_151278 ) ) ( not ( = ?auto_151271 ?auto_151276 ) ) ( not ( = ?auto_151272 ?auto_151278 ) ) ( not ( = ?auto_151272 ?auto_151276 ) ) ( not ( = ?auto_151273 ?auto_151278 ) ) ( not ( = ?auto_151273 ?auto_151276 ) ) ( ON ?auto_151273 ?auto_151274 ) ( ON ?auto_151272 ?auto_151273 ) ( ON ?auto_151271 ?auto_151272 ) ( CLEAR ?auto_151271 ) ( HOLDING ?auto_151270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151270 )
      ( MAKE-6PILE ?auto_151270 ?auto_151271 ?auto_151272 ?auto_151273 ?auto_151274 ?auto_151275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_151279 - BLOCK
      ?auto_151280 - BLOCK
      ?auto_151281 - BLOCK
      ?auto_151282 - BLOCK
      ?auto_151283 - BLOCK
      ?auto_151284 - BLOCK
    )
    :vars
    (
      ?auto_151287 - BLOCK
      ?auto_151285 - BLOCK
      ?auto_151286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151279 ?auto_151280 ) ) ( not ( = ?auto_151279 ?auto_151281 ) ) ( not ( = ?auto_151279 ?auto_151282 ) ) ( not ( = ?auto_151279 ?auto_151283 ) ) ( not ( = ?auto_151279 ?auto_151284 ) ) ( not ( = ?auto_151280 ?auto_151281 ) ) ( not ( = ?auto_151280 ?auto_151282 ) ) ( not ( = ?auto_151280 ?auto_151283 ) ) ( not ( = ?auto_151280 ?auto_151284 ) ) ( not ( = ?auto_151281 ?auto_151282 ) ) ( not ( = ?auto_151281 ?auto_151283 ) ) ( not ( = ?auto_151281 ?auto_151284 ) ) ( not ( = ?auto_151282 ?auto_151283 ) ) ( not ( = ?auto_151282 ?auto_151284 ) ) ( not ( = ?auto_151283 ?auto_151284 ) ) ( ON ?auto_151284 ?auto_151287 ) ( not ( = ?auto_151279 ?auto_151287 ) ) ( not ( = ?auto_151280 ?auto_151287 ) ) ( not ( = ?auto_151281 ?auto_151287 ) ) ( not ( = ?auto_151282 ?auto_151287 ) ) ( not ( = ?auto_151283 ?auto_151287 ) ) ( not ( = ?auto_151284 ?auto_151287 ) ) ( ON ?auto_151283 ?auto_151284 ) ( ON-TABLE ?auto_151285 ) ( ON ?auto_151286 ?auto_151285 ) ( ON ?auto_151287 ?auto_151286 ) ( not ( = ?auto_151285 ?auto_151286 ) ) ( not ( = ?auto_151285 ?auto_151287 ) ) ( not ( = ?auto_151285 ?auto_151284 ) ) ( not ( = ?auto_151285 ?auto_151283 ) ) ( not ( = ?auto_151286 ?auto_151287 ) ) ( not ( = ?auto_151286 ?auto_151284 ) ) ( not ( = ?auto_151286 ?auto_151283 ) ) ( not ( = ?auto_151279 ?auto_151285 ) ) ( not ( = ?auto_151279 ?auto_151286 ) ) ( not ( = ?auto_151280 ?auto_151285 ) ) ( not ( = ?auto_151280 ?auto_151286 ) ) ( not ( = ?auto_151281 ?auto_151285 ) ) ( not ( = ?auto_151281 ?auto_151286 ) ) ( not ( = ?auto_151282 ?auto_151285 ) ) ( not ( = ?auto_151282 ?auto_151286 ) ) ( ON ?auto_151282 ?auto_151283 ) ( ON ?auto_151281 ?auto_151282 ) ( ON ?auto_151280 ?auto_151281 ) ( ON ?auto_151279 ?auto_151280 ) ( CLEAR ?auto_151279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151285 ?auto_151286 ?auto_151287 ?auto_151284 ?auto_151283 ?auto_151282 ?auto_151281 ?auto_151280 )
      ( MAKE-6PILE ?auto_151279 ?auto_151280 ?auto_151281 ?auto_151282 ?auto_151283 ?auto_151284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151290 - BLOCK
      ?auto_151291 - BLOCK
    )
    :vars
    (
      ?auto_151292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151292 ?auto_151291 ) ( CLEAR ?auto_151292 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151290 ) ( ON ?auto_151291 ?auto_151290 ) ( not ( = ?auto_151290 ?auto_151291 ) ) ( not ( = ?auto_151290 ?auto_151292 ) ) ( not ( = ?auto_151291 ?auto_151292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151292 ?auto_151291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151293 - BLOCK
      ?auto_151294 - BLOCK
    )
    :vars
    (
      ?auto_151295 - BLOCK
      ?auto_151296 - BLOCK
      ?auto_151297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151295 ?auto_151294 ) ( CLEAR ?auto_151295 ) ( ON-TABLE ?auto_151293 ) ( ON ?auto_151294 ?auto_151293 ) ( not ( = ?auto_151293 ?auto_151294 ) ) ( not ( = ?auto_151293 ?auto_151295 ) ) ( not ( = ?auto_151294 ?auto_151295 ) ) ( HOLDING ?auto_151296 ) ( CLEAR ?auto_151297 ) ( not ( = ?auto_151293 ?auto_151296 ) ) ( not ( = ?auto_151293 ?auto_151297 ) ) ( not ( = ?auto_151294 ?auto_151296 ) ) ( not ( = ?auto_151294 ?auto_151297 ) ) ( not ( = ?auto_151295 ?auto_151296 ) ) ( not ( = ?auto_151295 ?auto_151297 ) ) ( not ( = ?auto_151296 ?auto_151297 ) ) )
    :subtasks
    ( ( !STACK ?auto_151296 ?auto_151297 )
      ( MAKE-2PILE ?auto_151293 ?auto_151294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151298 - BLOCK
      ?auto_151299 - BLOCK
    )
    :vars
    (
      ?auto_151302 - BLOCK
      ?auto_151300 - BLOCK
      ?auto_151301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151302 ?auto_151299 ) ( ON-TABLE ?auto_151298 ) ( ON ?auto_151299 ?auto_151298 ) ( not ( = ?auto_151298 ?auto_151299 ) ) ( not ( = ?auto_151298 ?auto_151302 ) ) ( not ( = ?auto_151299 ?auto_151302 ) ) ( CLEAR ?auto_151300 ) ( not ( = ?auto_151298 ?auto_151301 ) ) ( not ( = ?auto_151298 ?auto_151300 ) ) ( not ( = ?auto_151299 ?auto_151301 ) ) ( not ( = ?auto_151299 ?auto_151300 ) ) ( not ( = ?auto_151302 ?auto_151301 ) ) ( not ( = ?auto_151302 ?auto_151300 ) ) ( not ( = ?auto_151301 ?auto_151300 ) ) ( ON ?auto_151301 ?auto_151302 ) ( CLEAR ?auto_151301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151298 ?auto_151299 ?auto_151302 )
      ( MAKE-2PILE ?auto_151298 ?auto_151299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151303 - BLOCK
      ?auto_151304 - BLOCK
    )
    :vars
    (
      ?auto_151305 - BLOCK
      ?auto_151307 - BLOCK
      ?auto_151306 - BLOCK
      ?auto_151311 - BLOCK
      ?auto_151308 - BLOCK
      ?auto_151309 - BLOCK
      ?auto_151310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151305 ?auto_151304 ) ( ON-TABLE ?auto_151303 ) ( ON ?auto_151304 ?auto_151303 ) ( not ( = ?auto_151303 ?auto_151304 ) ) ( not ( = ?auto_151303 ?auto_151305 ) ) ( not ( = ?auto_151304 ?auto_151305 ) ) ( not ( = ?auto_151303 ?auto_151307 ) ) ( not ( = ?auto_151303 ?auto_151306 ) ) ( not ( = ?auto_151304 ?auto_151307 ) ) ( not ( = ?auto_151304 ?auto_151306 ) ) ( not ( = ?auto_151305 ?auto_151307 ) ) ( not ( = ?auto_151305 ?auto_151306 ) ) ( not ( = ?auto_151307 ?auto_151306 ) ) ( ON ?auto_151307 ?auto_151305 ) ( CLEAR ?auto_151307 ) ( HOLDING ?auto_151306 ) ( CLEAR ?auto_151311 ) ( ON-TABLE ?auto_151308 ) ( ON ?auto_151309 ?auto_151308 ) ( ON ?auto_151310 ?auto_151309 ) ( ON ?auto_151311 ?auto_151310 ) ( not ( = ?auto_151308 ?auto_151309 ) ) ( not ( = ?auto_151308 ?auto_151310 ) ) ( not ( = ?auto_151308 ?auto_151311 ) ) ( not ( = ?auto_151308 ?auto_151306 ) ) ( not ( = ?auto_151309 ?auto_151310 ) ) ( not ( = ?auto_151309 ?auto_151311 ) ) ( not ( = ?auto_151309 ?auto_151306 ) ) ( not ( = ?auto_151310 ?auto_151311 ) ) ( not ( = ?auto_151310 ?auto_151306 ) ) ( not ( = ?auto_151311 ?auto_151306 ) ) ( not ( = ?auto_151303 ?auto_151311 ) ) ( not ( = ?auto_151303 ?auto_151308 ) ) ( not ( = ?auto_151303 ?auto_151309 ) ) ( not ( = ?auto_151303 ?auto_151310 ) ) ( not ( = ?auto_151304 ?auto_151311 ) ) ( not ( = ?auto_151304 ?auto_151308 ) ) ( not ( = ?auto_151304 ?auto_151309 ) ) ( not ( = ?auto_151304 ?auto_151310 ) ) ( not ( = ?auto_151305 ?auto_151311 ) ) ( not ( = ?auto_151305 ?auto_151308 ) ) ( not ( = ?auto_151305 ?auto_151309 ) ) ( not ( = ?auto_151305 ?auto_151310 ) ) ( not ( = ?auto_151307 ?auto_151311 ) ) ( not ( = ?auto_151307 ?auto_151308 ) ) ( not ( = ?auto_151307 ?auto_151309 ) ) ( not ( = ?auto_151307 ?auto_151310 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151308 ?auto_151309 ?auto_151310 ?auto_151311 ?auto_151306 )
      ( MAKE-2PILE ?auto_151303 ?auto_151304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151312 - BLOCK
      ?auto_151313 - BLOCK
    )
    :vars
    (
      ?auto_151316 - BLOCK
      ?auto_151315 - BLOCK
      ?auto_151320 - BLOCK
      ?auto_151318 - BLOCK
      ?auto_151319 - BLOCK
      ?auto_151317 - BLOCK
      ?auto_151314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151316 ?auto_151313 ) ( ON-TABLE ?auto_151312 ) ( ON ?auto_151313 ?auto_151312 ) ( not ( = ?auto_151312 ?auto_151313 ) ) ( not ( = ?auto_151312 ?auto_151316 ) ) ( not ( = ?auto_151313 ?auto_151316 ) ) ( not ( = ?auto_151312 ?auto_151315 ) ) ( not ( = ?auto_151312 ?auto_151320 ) ) ( not ( = ?auto_151313 ?auto_151315 ) ) ( not ( = ?auto_151313 ?auto_151320 ) ) ( not ( = ?auto_151316 ?auto_151315 ) ) ( not ( = ?auto_151316 ?auto_151320 ) ) ( not ( = ?auto_151315 ?auto_151320 ) ) ( ON ?auto_151315 ?auto_151316 ) ( CLEAR ?auto_151318 ) ( ON-TABLE ?auto_151319 ) ( ON ?auto_151317 ?auto_151319 ) ( ON ?auto_151314 ?auto_151317 ) ( ON ?auto_151318 ?auto_151314 ) ( not ( = ?auto_151319 ?auto_151317 ) ) ( not ( = ?auto_151319 ?auto_151314 ) ) ( not ( = ?auto_151319 ?auto_151318 ) ) ( not ( = ?auto_151319 ?auto_151320 ) ) ( not ( = ?auto_151317 ?auto_151314 ) ) ( not ( = ?auto_151317 ?auto_151318 ) ) ( not ( = ?auto_151317 ?auto_151320 ) ) ( not ( = ?auto_151314 ?auto_151318 ) ) ( not ( = ?auto_151314 ?auto_151320 ) ) ( not ( = ?auto_151318 ?auto_151320 ) ) ( not ( = ?auto_151312 ?auto_151318 ) ) ( not ( = ?auto_151312 ?auto_151319 ) ) ( not ( = ?auto_151312 ?auto_151317 ) ) ( not ( = ?auto_151312 ?auto_151314 ) ) ( not ( = ?auto_151313 ?auto_151318 ) ) ( not ( = ?auto_151313 ?auto_151319 ) ) ( not ( = ?auto_151313 ?auto_151317 ) ) ( not ( = ?auto_151313 ?auto_151314 ) ) ( not ( = ?auto_151316 ?auto_151318 ) ) ( not ( = ?auto_151316 ?auto_151319 ) ) ( not ( = ?auto_151316 ?auto_151317 ) ) ( not ( = ?auto_151316 ?auto_151314 ) ) ( not ( = ?auto_151315 ?auto_151318 ) ) ( not ( = ?auto_151315 ?auto_151319 ) ) ( not ( = ?auto_151315 ?auto_151317 ) ) ( not ( = ?auto_151315 ?auto_151314 ) ) ( ON ?auto_151320 ?auto_151315 ) ( CLEAR ?auto_151320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151312 ?auto_151313 ?auto_151316 ?auto_151315 )
      ( MAKE-2PILE ?auto_151312 ?auto_151313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151321 - BLOCK
      ?auto_151322 - BLOCK
    )
    :vars
    (
      ?auto_151325 - BLOCK
      ?auto_151323 - BLOCK
      ?auto_151328 - BLOCK
      ?auto_151327 - BLOCK
      ?auto_151324 - BLOCK
      ?auto_151326 - BLOCK
      ?auto_151329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151325 ?auto_151322 ) ( ON-TABLE ?auto_151321 ) ( ON ?auto_151322 ?auto_151321 ) ( not ( = ?auto_151321 ?auto_151322 ) ) ( not ( = ?auto_151321 ?auto_151325 ) ) ( not ( = ?auto_151322 ?auto_151325 ) ) ( not ( = ?auto_151321 ?auto_151323 ) ) ( not ( = ?auto_151321 ?auto_151328 ) ) ( not ( = ?auto_151322 ?auto_151323 ) ) ( not ( = ?auto_151322 ?auto_151328 ) ) ( not ( = ?auto_151325 ?auto_151323 ) ) ( not ( = ?auto_151325 ?auto_151328 ) ) ( not ( = ?auto_151323 ?auto_151328 ) ) ( ON ?auto_151323 ?auto_151325 ) ( ON-TABLE ?auto_151327 ) ( ON ?auto_151324 ?auto_151327 ) ( ON ?auto_151326 ?auto_151324 ) ( not ( = ?auto_151327 ?auto_151324 ) ) ( not ( = ?auto_151327 ?auto_151326 ) ) ( not ( = ?auto_151327 ?auto_151329 ) ) ( not ( = ?auto_151327 ?auto_151328 ) ) ( not ( = ?auto_151324 ?auto_151326 ) ) ( not ( = ?auto_151324 ?auto_151329 ) ) ( not ( = ?auto_151324 ?auto_151328 ) ) ( not ( = ?auto_151326 ?auto_151329 ) ) ( not ( = ?auto_151326 ?auto_151328 ) ) ( not ( = ?auto_151329 ?auto_151328 ) ) ( not ( = ?auto_151321 ?auto_151329 ) ) ( not ( = ?auto_151321 ?auto_151327 ) ) ( not ( = ?auto_151321 ?auto_151324 ) ) ( not ( = ?auto_151321 ?auto_151326 ) ) ( not ( = ?auto_151322 ?auto_151329 ) ) ( not ( = ?auto_151322 ?auto_151327 ) ) ( not ( = ?auto_151322 ?auto_151324 ) ) ( not ( = ?auto_151322 ?auto_151326 ) ) ( not ( = ?auto_151325 ?auto_151329 ) ) ( not ( = ?auto_151325 ?auto_151327 ) ) ( not ( = ?auto_151325 ?auto_151324 ) ) ( not ( = ?auto_151325 ?auto_151326 ) ) ( not ( = ?auto_151323 ?auto_151329 ) ) ( not ( = ?auto_151323 ?auto_151327 ) ) ( not ( = ?auto_151323 ?auto_151324 ) ) ( not ( = ?auto_151323 ?auto_151326 ) ) ( ON ?auto_151328 ?auto_151323 ) ( CLEAR ?auto_151328 ) ( HOLDING ?auto_151329 ) ( CLEAR ?auto_151326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151327 ?auto_151324 ?auto_151326 ?auto_151329 )
      ( MAKE-2PILE ?auto_151321 ?auto_151322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151330 - BLOCK
      ?auto_151331 - BLOCK
    )
    :vars
    (
      ?auto_151334 - BLOCK
      ?auto_151332 - BLOCK
      ?auto_151338 - BLOCK
      ?auto_151333 - BLOCK
      ?auto_151336 - BLOCK
      ?auto_151335 - BLOCK
      ?auto_151337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151334 ?auto_151331 ) ( ON-TABLE ?auto_151330 ) ( ON ?auto_151331 ?auto_151330 ) ( not ( = ?auto_151330 ?auto_151331 ) ) ( not ( = ?auto_151330 ?auto_151334 ) ) ( not ( = ?auto_151331 ?auto_151334 ) ) ( not ( = ?auto_151330 ?auto_151332 ) ) ( not ( = ?auto_151330 ?auto_151338 ) ) ( not ( = ?auto_151331 ?auto_151332 ) ) ( not ( = ?auto_151331 ?auto_151338 ) ) ( not ( = ?auto_151334 ?auto_151332 ) ) ( not ( = ?auto_151334 ?auto_151338 ) ) ( not ( = ?auto_151332 ?auto_151338 ) ) ( ON ?auto_151332 ?auto_151334 ) ( ON-TABLE ?auto_151333 ) ( ON ?auto_151336 ?auto_151333 ) ( ON ?auto_151335 ?auto_151336 ) ( not ( = ?auto_151333 ?auto_151336 ) ) ( not ( = ?auto_151333 ?auto_151335 ) ) ( not ( = ?auto_151333 ?auto_151337 ) ) ( not ( = ?auto_151333 ?auto_151338 ) ) ( not ( = ?auto_151336 ?auto_151335 ) ) ( not ( = ?auto_151336 ?auto_151337 ) ) ( not ( = ?auto_151336 ?auto_151338 ) ) ( not ( = ?auto_151335 ?auto_151337 ) ) ( not ( = ?auto_151335 ?auto_151338 ) ) ( not ( = ?auto_151337 ?auto_151338 ) ) ( not ( = ?auto_151330 ?auto_151337 ) ) ( not ( = ?auto_151330 ?auto_151333 ) ) ( not ( = ?auto_151330 ?auto_151336 ) ) ( not ( = ?auto_151330 ?auto_151335 ) ) ( not ( = ?auto_151331 ?auto_151337 ) ) ( not ( = ?auto_151331 ?auto_151333 ) ) ( not ( = ?auto_151331 ?auto_151336 ) ) ( not ( = ?auto_151331 ?auto_151335 ) ) ( not ( = ?auto_151334 ?auto_151337 ) ) ( not ( = ?auto_151334 ?auto_151333 ) ) ( not ( = ?auto_151334 ?auto_151336 ) ) ( not ( = ?auto_151334 ?auto_151335 ) ) ( not ( = ?auto_151332 ?auto_151337 ) ) ( not ( = ?auto_151332 ?auto_151333 ) ) ( not ( = ?auto_151332 ?auto_151336 ) ) ( not ( = ?auto_151332 ?auto_151335 ) ) ( ON ?auto_151338 ?auto_151332 ) ( CLEAR ?auto_151335 ) ( ON ?auto_151337 ?auto_151338 ) ( CLEAR ?auto_151337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151330 ?auto_151331 ?auto_151334 ?auto_151332 ?auto_151338 )
      ( MAKE-2PILE ?auto_151330 ?auto_151331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151339 - BLOCK
      ?auto_151340 - BLOCK
    )
    :vars
    (
      ?auto_151343 - BLOCK
      ?auto_151341 - BLOCK
      ?auto_151346 - BLOCK
      ?auto_151344 - BLOCK
      ?auto_151345 - BLOCK
      ?auto_151342 - BLOCK
      ?auto_151347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151343 ?auto_151340 ) ( ON-TABLE ?auto_151339 ) ( ON ?auto_151340 ?auto_151339 ) ( not ( = ?auto_151339 ?auto_151340 ) ) ( not ( = ?auto_151339 ?auto_151343 ) ) ( not ( = ?auto_151340 ?auto_151343 ) ) ( not ( = ?auto_151339 ?auto_151341 ) ) ( not ( = ?auto_151339 ?auto_151346 ) ) ( not ( = ?auto_151340 ?auto_151341 ) ) ( not ( = ?auto_151340 ?auto_151346 ) ) ( not ( = ?auto_151343 ?auto_151341 ) ) ( not ( = ?auto_151343 ?auto_151346 ) ) ( not ( = ?auto_151341 ?auto_151346 ) ) ( ON ?auto_151341 ?auto_151343 ) ( ON-TABLE ?auto_151344 ) ( ON ?auto_151345 ?auto_151344 ) ( not ( = ?auto_151344 ?auto_151345 ) ) ( not ( = ?auto_151344 ?auto_151342 ) ) ( not ( = ?auto_151344 ?auto_151347 ) ) ( not ( = ?auto_151344 ?auto_151346 ) ) ( not ( = ?auto_151345 ?auto_151342 ) ) ( not ( = ?auto_151345 ?auto_151347 ) ) ( not ( = ?auto_151345 ?auto_151346 ) ) ( not ( = ?auto_151342 ?auto_151347 ) ) ( not ( = ?auto_151342 ?auto_151346 ) ) ( not ( = ?auto_151347 ?auto_151346 ) ) ( not ( = ?auto_151339 ?auto_151347 ) ) ( not ( = ?auto_151339 ?auto_151344 ) ) ( not ( = ?auto_151339 ?auto_151345 ) ) ( not ( = ?auto_151339 ?auto_151342 ) ) ( not ( = ?auto_151340 ?auto_151347 ) ) ( not ( = ?auto_151340 ?auto_151344 ) ) ( not ( = ?auto_151340 ?auto_151345 ) ) ( not ( = ?auto_151340 ?auto_151342 ) ) ( not ( = ?auto_151343 ?auto_151347 ) ) ( not ( = ?auto_151343 ?auto_151344 ) ) ( not ( = ?auto_151343 ?auto_151345 ) ) ( not ( = ?auto_151343 ?auto_151342 ) ) ( not ( = ?auto_151341 ?auto_151347 ) ) ( not ( = ?auto_151341 ?auto_151344 ) ) ( not ( = ?auto_151341 ?auto_151345 ) ) ( not ( = ?auto_151341 ?auto_151342 ) ) ( ON ?auto_151346 ?auto_151341 ) ( ON ?auto_151347 ?auto_151346 ) ( CLEAR ?auto_151347 ) ( HOLDING ?auto_151342 ) ( CLEAR ?auto_151345 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151344 ?auto_151345 ?auto_151342 )
      ( MAKE-2PILE ?auto_151339 ?auto_151340 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151348 - BLOCK
      ?auto_151349 - BLOCK
    )
    :vars
    (
      ?auto_151352 - BLOCK
      ?auto_151351 - BLOCK
      ?auto_151354 - BLOCK
      ?auto_151353 - BLOCK
      ?auto_151356 - BLOCK
      ?auto_151350 - BLOCK
      ?auto_151355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151352 ?auto_151349 ) ( ON-TABLE ?auto_151348 ) ( ON ?auto_151349 ?auto_151348 ) ( not ( = ?auto_151348 ?auto_151349 ) ) ( not ( = ?auto_151348 ?auto_151352 ) ) ( not ( = ?auto_151349 ?auto_151352 ) ) ( not ( = ?auto_151348 ?auto_151351 ) ) ( not ( = ?auto_151348 ?auto_151354 ) ) ( not ( = ?auto_151349 ?auto_151351 ) ) ( not ( = ?auto_151349 ?auto_151354 ) ) ( not ( = ?auto_151352 ?auto_151351 ) ) ( not ( = ?auto_151352 ?auto_151354 ) ) ( not ( = ?auto_151351 ?auto_151354 ) ) ( ON ?auto_151351 ?auto_151352 ) ( ON-TABLE ?auto_151353 ) ( ON ?auto_151356 ?auto_151353 ) ( not ( = ?auto_151353 ?auto_151356 ) ) ( not ( = ?auto_151353 ?auto_151350 ) ) ( not ( = ?auto_151353 ?auto_151355 ) ) ( not ( = ?auto_151353 ?auto_151354 ) ) ( not ( = ?auto_151356 ?auto_151350 ) ) ( not ( = ?auto_151356 ?auto_151355 ) ) ( not ( = ?auto_151356 ?auto_151354 ) ) ( not ( = ?auto_151350 ?auto_151355 ) ) ( not ( = ?auto_151350 ?auto_151354 ) ) ( not ( = ?auto_151355 ?auto_151354 ) ) ( not ( = ?auto_151348 ?auto_151355 ) ) ( not ( = ?auto_151348 ?auto_151353 ) ) ( not ( = ?auto_151348 ?auto_151356 ) ) ( not ( = ?auto_151348 ?auto_151350 ) ) ( not ( = ?auto_151349 ?auto_151355 ) ) ( not ( = ?auto_151349 ?auto_151353 ) ) ( not ( = ?auto_151349 ?auto_151356 ) ) ( not ( = ?auto_151349 ?auto_151350 ) ) ( not ( = ?auto_151352 ?auto_151355 ) ) ( not ( = ?auto_151352 ?auto_151353 ) ) ( not ( = ?auto_151352 ?auto_151356 ) ) ( not ( = ?auto_151352 ?auto_151350 ) ) ( not ( = ?auto_151351 ?auto_151355 ) ) ( not ( = ?auto_151351 ?auto_151353 ) ) ( not ( = ?auto_151351 ?auto_151356 ) ) ( not ( = ?auto_151351 ?auto_151350 ) ) ( ON ?auto_151354 ?auto_151351 ) ( ON ?auto_151355 ?auto_151354 ) ( CLEAR ?auto_151356 ) ( ON ?auto_151350 ?auto_151355 ) ( CLEAR ?auto_151350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151348 ?auto_151349 ?auto_151352 ?auto_151351 ?auto_151354 ?auto_151355 )
      ( MAKE-2PILE ?auto_151348 ?auto_151349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151357 - BLOCK
      ?auto_151358 - BLOCK
    )
    :vars
    (
      ?auto_151364 - BLOCK
      ?auto_151361 - BLOCK
      ?auto_151363 - BLOCK
      ?auto_151362 - BLOCK
      ?auto_151365 - BLOCK
      ?auto_151360 - BLOCK
      ?auto_151359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151364 ?auto_151358 ) ( ON-TABLE ?auto_151357 ) ( ON ?auto_151358 ?auto_151357 ) ( not ( = ?auto_151357 ?auto_151358 ) ) ( not ( = ?auto_151357 ?auto_151364 ) ) ( not ( = ?auto_151358 ?auto_151364 ) ) ( not ( = ?auto_151357 ?auto_151361 ) ) ( not ( = ?auto_151357 ?auto_151363 ) ) ( not ( = ?auto_151358 ?auto_151361 ) ) ( not ( = ?auto_151358 ?auto_151363 ) ) ( not ( = ?auto_151364 ?auto_151361 ) ) ( not ( = ?auto_151364 ?auto_151363 ) ) ( not ( = ?auto_151361 ?auto_151363 ) ) ( ON ?auto_151361 ?auto_151364 ) ( ON-TABLE ?auto_151362 ) ( not ( = ?auto_151362 ?auto_151365 ) ) ( not ( = ?auto_151362 ?auto_151360 ) ) ( not ( = ?auto_151362 ?auto_151359 ) ) ( not ( = ?auto_151362 ?auto_151363 ) ) ( not ( = ?auto_151365 ?auto_151360 ) ) ( not ( = ?auto_151365 ?auto_151359 ) ) ( not ( = ?auto_151365 ?auto_151363 ) ) ( not ( = ?auto_151360 ?auto_151359 ) ) ( not ( = ?auto_151360 ?auto_151363 ) ) ( not ( = ?auto_151359 ?auto_151363 ) ) ( not ( = ?auto_151357 ?auto_151359 ) ) ( not ( = ?auto_151357 ?auto_151362 ) ) ( not ( = ?auto_151357 ?auto_151365 ) ) ( not ( = ?auto_151357 ?auto_151360 ) ) ( not ( = ?auto_151358 ?auto_151359 ) ) ( not ( = ?auto_151358 ?auto_151362 ) ) ( not ( = ?auto_151358 ?auto_151365 ) ) ( not ( = ?auto_151358 ?auto_151360 ) ) ( not ( = ?auto_151364 ?auto_151359 ) ) ( not ( = ?auto_151364 ?auto_151362 ) ) ( not ( = ?auto_151364 ?auto_151365 ) ) ( not ( = ?auto_151364 ?auto_151360 ) ) ( not ( = ?auto_151361 ?auto_151359 ) ) ( not ( = ?auto_151361 ?auto_151362 ) ) ( not ( = ?auto_151361 ?auto_151365 ) ) ( not ( = ?auto_151361 ?auto_151360 ) ) ( ON ?auto_151363 ?auto_151361 ) ( ON ?auto_151359 ?auto_151363 ) ( ON ?auto_151360 ?auto_151359 ) ( CLEAR ?auto_151360 ) ( HOLDING ?auto_151365 ) ( CLEAR ?auto_151362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151362 ?auto_151365 )
      ( MAKE-2PILE ?auto_151357 ?auto_151358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153384 - BLOCK
      ?auto_153385 - BLOCK
    )
    :vars
    (
      ?auto_153390 - BLOCK
      ?auto_153387 - BLOCK
      ?auto_153389 - BLOCK
      ?auto_153391 - BLOCK
      ?auto_153388 - BLOCK
      ?auto_153386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153390 ?auto_153385 ) ( ON-TABLE ?auto_153384 ) ( ON ?auto_153385 ?auto_153384 ) ( not ( = ?auto_153384 ?auto_153385 ) ) ( not ( = ?auto_153384 ?auto_153390 ) ) ( not ( = ?auto_153385 ?auto_153390 ) ) ( not ( = ?auto_153384 ?auto_153387 ) ) ( not ( = ?auto_153384 ?auto_153389 ) ) ( not ( = ?auto_153385 ?auto_153387 ) ) ( not ( = ?auto_153385 ?auto_153389 ) ) ( not ( = ?auto_153390 ?auto_153387 ) ) ( not ( = ?auto_153390 ?auto_153389 ) ) ( not ( = ?auto_153387 ?auto_153389 ) ) ( ON ?auto_153387 ?auto_153390 ) ( not ( = ?auto_153391 ?auto_153388 ) ) ( not ( = ?auto_153391 ?auto_153386 ) ) ( not ( = ?auto_153391 ?auto_153389 ) ) ( not ( = ?auto_153388 ?auto_153386 ) ) ( not ( = ?auto_153388 ?auto_153389 ) ) ( not ( = ?auto_153386 ?auto_153389 ) ) ( not ( = ?auto_153384 ?auto_153386 ) ) ( not ( = ?auto_153384 ?auto_153391 ) ) ( not ( = ?auto_153384 ?auto_153388 ) ) ( not ( = ?auto_153385 ?auto_153386 ) ) ( not ( = ?auto_153385 ?auto_153391 ) ) ( not ( = ?auto_153385 ?auto_153388 ) ) ( not ( = ?auto_153390 ?auto_153386 ) ) ( not ( = ?auto_153390 ?auto_153391 ) ) ( not ( = ?auto_153390 ?auto_153388 ) ) ( not ( = ?auto_153387 ?auto_153386 ) ) ( not ( = ?auto_153387 ?auto_153391 ) ) ( not ( = ?auto_153387 ?auto_153388 ) ) ( ON ?auto_153389 ?auto_153387 ) ( ON ?auto_153386 ?auto_153389 ) ( ON ?auto_153388 ?auto_153386 ) ( ON ?auto_153391 ?auto_153388 ) ( CLEAR ?auto_153391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153384 ?auto_153385 ?auto_153390 ?auto_153387 ?auto_153389 ?auto_153386 ?auto_153388 )
      ( MAKE-2PILE ?auto_153384 ?auto_153385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151375 - BLOCK
      ?auto_151376 - BLOCK
    )
    :vars
    (
      ?auto_151381 - BLOCK
      ?auto_151378 - BLOCK
      ?auto_151383 - BLOCK
      ?auto_151382 - BLOCK
      ?auto_151380 - BLOCK
      ?auto_151377 - BLOCK
      ?auto_151379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151381 ?auto_151376 ) ( ON-TABLE ?auto_151375 ) ( ON ?auto_151376 ?auto_151375 ) ( not ( = ?auto_151375 ?auto_151376 ) ) ( not ( = ?auto_151375 ?auto_151381 ) ) ( not ( = ?auto_151376 ?auto_151381 ) ) ( not ( = ?auto_151375 ?auto_151378 ) ) ( not ( = ?auto_151375 ?auto_151383 ) ) ( not ( = ?auto_151376 ?auto_151378 ) ) ( not ( = ?auto_151376 ?auto_151383 ) ) ( not ( = ?auto_151381 ?auto_151378 ) ) ( not ( = ?auto_151381 ?auto_151383 ) ) ( not ( = ?auto_151378 ?auto_151383 ) ) ( ON ?auto_151378 ?auto_151381 ) ( not ( = ?auto_151382 ?auto_151380 ) ) ( not ( = ?auto_151382 ?auto_151377 ) ) ( not ( = ?auto_151382 ?auto_151379 ) ) ( not ( = ?auto_151382 ?auto_151383 ) ) ( not ( = ?auto_151380 ?auto_151377 ) ) ( not ( = ?auto_151380 ?auto_151379 ) ) ( not ( = ?auto_151380 ?auto_151383 ) ) ( not ( = ?auto_151377 ?auto_151379 ) ) ( not ( = ?auto_151377 ?auto_151383 ) ) ( not ( = ?auto_151379 ?auto_151383 ) ) ( not ( = ?auto_151375 ?auto_151379 ) ) ( not ( = ?auto_151375 ?auto_151382 ) ) ( not ( = ?auto_151375 ?auto_151380 ) ) ( not ( = ?auto_151375 ?auto_151377 ) ) ( not ( = ?auto_151376 ?auto_151379 ) ) ( not ( = ?auto_151376 ?auto_151382 ) ) ( not ( = ?auto_151376 ?auto_151380 ) ) ( not ( = ?auto_151376 ?auto_151377 ) ) ( not ( = ?auto_151381 ?auto_151379 ) ) ( not ( = ?auto_151381 ?auto_151382 ) ) ( not ( = ?auto_151381 ?auto_151380 ) ) ( not ( = ?auto_151381 ?auto_151377 ) ) ( not ( = ?auto_151378 ?auto_151379 ) ) ( not ( = ?auto_151378 ?auto_151382 ) ) ( not ( = ?auto_151378 ?auto_151380 ) ) ( not ( = ?auto_151378 ?auto_151377 ) ) ( ON ?auto_151383 ?auto_151378 ) ( ON ?auto_151379 ?auto_151383 ) ( ON ?auto_151377 ?auto_151379 ) ( ON ?auto_151380 ?auto_151377 ) ( CLEAR ?auto_151380 ) ( HOLDING ?auto_151382 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151382 )
      ( MAKE-2PILE ?auto_151375 ?auto_151376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_151384 - BLOCK
      ?auto_151385 - BLOCK
    )
    :vars
    (
      ?auto_151386 - BLOCK
      ?auto_151390 - BLOCK
      ?auto_151392 - BLOCK
      ?auto_151388 - BLOCK
      ?auto_151389 - BLOCK
      ?auto_151391 - BLOCK
      ?auto_151387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151386 ?auto_151385 ) ( ON-TABLE ?auto_151384 ) ( ON ?auto_151385 ?auto_151384 ) ( not ( = ?auto_151384 ?auto_151385 ) ) ( not ( = ?auto_151384 ?auto_151386 ) ) ( not ( = ?auto_151385 ?auto_151386 ) ) ( not ( = ?auto_151384 ?auto_151390 ) ) ( not ( = ?auto_151384 ?auto_151392 ) ) ( not ( = ?auto_151385 ?auto_151390 ) ) ( not ( = ?auto_151385 ?auto_151392 ) ) ( not ( = ?auto_151386 ?auto_151390 ) ) ( not ( = ?auto_151386 ?auto_151392 ) ) ( not ( = ?auto_151390 ?auto_151392 ) ) ( ON ?auto_151390 ?auto_151386 ) ( not ( = ?auto_151388 ?auto_151389 ) ) ( not ( = ?auto_151388 ?auto_151391 ) ) ( not ( = ?auto_151388 ?auto_151387 ) ) ( not ( = ?auto_151388 ?auto_151392 ) ) ( not ( = ?auto_151389 ?auto_151391 ) ) ( not ( = ?auto_151389 ?auto_151387 ) ) ( not ( = ?auto_151389 ?auto_151392 ) ) ( not ( = ?auto_151391 ?auto_151387 ) ) ( not ( = ?auto_151391 ?auto_151392 ) ) ( not ( = ?auto_151387 ?auto_151392 ) ) ( not ( = ?auto_151384 ?auto_151387 ) ) ( not ( = ?auto_151384 ?auto_151388 ) ) ( not ( = ?auto_151384 ?auto_151389 ) ) ( not ( = ?auto_151384 ?auto_151391 ) ) ( not ( = ?auto_151385 ?auto_151387 ) ) ( not ( = ?auto_151385 ?auto_151388 ) ) ( not ( = ?auto_151385 ?auto_151389 ) ) ( not ( = ?auto_151385 ?auto_151391 ) ) ( not ( = ?auto_151386 ?auto_151387 ) ) ( not ( = ?auto_151386 ?auto_151388 ) ) ( not ( = ?auto_151386 ?auto_151389 ) ) ( not ( = ?auto_151386 ?auto_151391 ) ) ( not ( = ?auto_151390 ?auto_151387 ) ) ( not ( = ?auto_151390 ?auto_151388 ) ) ( not ( = ?auto_151390 ?auto_151389 ) ) ( not ( = ?auto_151390 ?auto_151391 ) ) ( ON ?auto_151392 ?auto_151390 ) ( ON ?auto_151387 ?auto_151392 ) ( ON ?auto_151391 ?auto_151387 ) ( ON ?auto_151389 ?auto_151391 ) ( ON ?auto_151388 ?auto_151389 ) ( CLEAR ?auto_151388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151384 ?auto_151385 ?auto_151386 ?auto_151390 ?auto_151392 ?auto_151387 ?auto_151391 ?auto_151389 )
      ( MAKE-2PILE ?auto_151384 ?auto_151385 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151400 - BLOCK
      ?auto_151401 - BLOCK
      ?auto_151402 - BLOCK
      ?auto_151403 - BLOCK
      ?auto_151404 - BLOCK
      ?auto_151405 - BLOCK
      ?auto_151406 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151406 ) ( CLEAR ?auto_151405 ) ( ON-TABLE ?auto_151400 ) ( ON ?auto_151401 ?auto_151400 ) ( ON ?auto_151402 ?auto_151401 ) ( ON ?auto_151403 ?auto_151402 ) ( ON ?auto_151404 ?auto_151403 ) ( ON ?auto_151405 ?auto_151404 ) ( not ( = ?auto_151400 ?auto_151401 ) ) ( not ( = ?auto_151400 ?auto_151402 ) ) ( not ( = ?auto_151400 ?auto_151403 ) ) ( not ( = ?auto_151400 ?auto_151404 ) ) ( not ( = ?auto_151400 ?auto_151405 ) ) ( not ( = ?auto_151400 ?auto_151406 ) ) ( not ( = ?auto_151401 ?auto_151402 ) ) ( not ( = ?auto_151401 ?auto_151403 ) ) ( not ( = ?auto_151401 ?auto_151404 ) ) ( not ( = ?auto_151401 ?auto_151405 ) ) ( not ( = ?auto_151401 ?auto_151406 ) ) ( not ( = ?auto_151402 ?auto_151403 ) ) ( not ( = ?auto_151402 ?auto_151404 ) ) ( not ( = ?auto_151402 ?auto_151405 ) ) ( not ( = ?auto_151402 ?auto_151406 ) ) ( not ( = ?auto_151403 ?auto_151404 ) ) ( not ( = ?auto_151403 ?auto_151405 ) ) ( not ( = ?auto_151403 ?auto_151406 ) ) ( not ( = ?auto_151404 ?auto_151405 ) ) ( not ( = ?auto_151404 ?auto_151406 ) ) ( not ( = ?auto_151405 ?auto_151406 ) ) )
    :subtasks
    ( ( !STACK ?auto_151406 ?auto_151405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151407 - BLOCK
      ?auto_151408 - BLOCK
      ?auto_151409 - BLOCK
      ?auto_151410 - BLOCK
      ?auto_151411 - BLOCK
      ?auto_151412 - BLOCK
      ?auto_151413 - BLOCK
    )
    :vars
    (
      ?auto_151414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151412 ) ( ON-TABLE ?auto_151407 ) ( ON ?auto_151408 ?auto_151407 ) ( ON ?auto_151409 ?auto_151408 ) ( ON ?auto_151410 ?auto_151409 ) ( ON ?auto_151411 ?auto_151410 ) ( ON ?auto_151412 ?auto_151411 ) ( not ( = ?auto_151407 ?auto_151408 ) ) ( not ( = ?auto_151407 ?auto_151409 ) ) ( not ( = ?auto_151407 ?auto_151410 ) ) ( not ( = ?auto_151407 ?auto_151411 ) ) ( not ( = ?auto_151407 ?auto_151412 ) ) ( not ( = ?auto_151407 ?auto_151413 ) ) ( not ( = ?auto_151408 ?auto_151409 ) ) ( not ( = ?auto_151408 ?auto_151410 ) ) ( not ( = ?auto_151408 ?auto_151411 ) ) ( not ( = ?auto_151408 ?auto_151412 ) ) ( not ( = ?auto_151408 ?auto_151413 ) ) ( not ( = ?auto_151409 ?auto_151410 ) ) ( not ( = ?auto_151409 ?auto_151411 ) ) ( not ( = ?auto_151409 ?auto_151412 ) ) ( not ( = ?auto_151409 ?auto_151413 ) ) ( not ( = ?auto_151410 ?auto_151411 ) ) ( not ( = ?auto_151410 ?auto_151412 ) ) ( not ( = ?auto_151410 ?auto_151413 ) ) ( not ( = ?auto_151411 ?auto_151412 ) ) ( not ( = ?auto_151411 ?auto_151413 ) ) ( not ( = ?auto_151412 ?auto_151413 ) ) ( ON ?auto_151413 ?auto_151414 ) ( CLEAR ?auto_151413 ) ( HAND-EMPTY ) ( not ( = ?auto_151407 ?auto_151414 ) ) ( not ( = ?auto_151408 ?auto_151414 ) ) ( not ( = ?auto_151409 ?auto_151414 ) ) ( not ( = ?auto_151410 ?auto_151414 ) ) ( not ( = ?auto_151411 ?auto_151414 ) ) ( not ( = ?auto_151412 ?auto_151414 ) ) ( not ( = ?auto_151413 ?auto_151414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151413 ?auto_151414 )
      ( MAKE-7PILE ?auto_151407 ?auto_151408 ?auto_151409 ?auto_151410 ?auto_151411 ?auto_151412 ?auto_151413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151415 - BLOCK
      ?auto_151416 - BLOCK
      ?auto_151417 - BLOCK
      ?auto_151418 - BLOCK
      ?auto_151419 - BLOCK
      ?auto_151420 - BLOCK
      ?auto_151421 - BLOCK
    )
    :vars
    (
      ?auto_151422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151415 ) ( ON ?auto_151416 ?auto_151415 ) ( ON ?auto_151417 ?auto_151416 ) ( ON ?auto_151418 ?auto_151417 ) ( ON ?auto_151419 ?auto_151418 ) ( not ( = ?auto_151415 ?auto_151416 ) ) ( not ( = ?auto_151415 ?auto_151417 ) ) ( not ( = ?auto_151415 ?auto_151418 ) ) ( not ( = ?auto_151415 ?auto_151419 ) ) ( not ( = ?auto_151415 ?auto_151420 ) ) ( not ( = ?auto_151415 ?auto_151421 ) ) ( not ( = ?auto_151416 ?auto_151417 ) ) ( not ( = ?auto_151416 ?auto_151418 ) ) ( not ( = ?auto_151416 ?auto_151419 ) ) ( not ( = ?auto_151416 ?auto_151420 ) ) ( not ( = ?auto_151416 ?auto_151421 ) ) ( not ( = ?auto_151417 ?auto_151418 ) ) ( not ( = ?auto_151417 ?auto_151419 ) ) ( not ( = ?auto_151417 ?auto_151420 ) ) ( not ( = ?auto_151417 ?auto_151421 ) ) ( not ( = ?auto_151418 ?auto_151419 ) ) ( not ( = ?auto_151418 ?auto_151420 ) ) ( not ( = ?auto_151418 ?auto_151421 ) ) ( not ( = ?auto_151419 ?auto_151420 ) ) ( not ( = ?auto_151419 ?auto_151421 ) ) ( not ( = ?auto_151420 ?auto_151421 ) ) ( ON ?auto_151421 ?auto_151422 ) ( CLEAR ?auto_151421 ) ( not ( = ?auto_151415 ?auto_151422 ) ) ( not ( = ?auto_151416 ?auto_151422 ) ) ( not ( = ?auto_151417 ?auto_151422 ) ) ( not ( = ?auto_151418 ?auto_151422 ) ) ( not ( = ?auto_151419 ?auto_151422 ) ) ( not ( = ?auto_151420 ?auto_151422 ) ) ( not ( = ?auto_151421 ?auto_151422 ) ) ( HOLDING ?auto_151420 ) ( CLEAR ?auto_151419 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151415 ?auto_151416 ?auto_151417 ?auto_151418 ?auto_151419 ?auto_151420 )
      ( MAKE-7PILE ?auto_151415 ?auto_151416 ?auto_151417 ?auto_151418 ?auto_151419 ?auto_151420 ?auto_151421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151423 - BLOCK
      ?auto_151424 - BLOCK
      ?auto_151425 - BLOCK
      ?auto_151426 - BLOCK
      ?auto_151427 - BLOCK
      ?auto_151428 - BLOCK
      ?auto_151429 - BLOCK
    )
    :vars
    (
      ?auto_151430 - BLOCK
      ?auto_151431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151423 ) ( ON ?auto_151424 ?auto_151423 ) ( ON ?auto_151425 ?auto_151424 ) ( ON ?auto_151426 ?auto_151425 ) ( ON ?auto_151427 ?auto_151426 ) ( not ( = ?auto_151423 ?auto_151424 ) ) ( not ( = ?auto_151423 ?auto_151425 ) ) ( not ( = ?auto_151423 ?auto_151426 ) ) ( not ( = ?auto_151423 ?auto_151427 ) ) ( not ( = ?auto_151423 ?auto_151428 ) ) ( not ( = ?auto_151423 ?auto_151429 ) ) ( not ( = ?auto_151424 ?auto_151425 ) ) ( not ( = ?auto_151424 ?auto_151426 ) ) ( not ( = ?auto_151424 ?auto_151427 ) ) ( not ( = ?auto_151424 ?auto_151428 ) ) ( not ( = ?auto_151424 ?auto_151429 ) ) ( not ( = ?auto_151425 ?auto_151426 ) ) ( not ( = ?auto_151425 ?auto_151427 ) ) ( not ( = ?auto_151425 ?auto_151428 ) ) ( not ( = ?auto_151425 ?auto_151429 ) ) ( not ( = ?auto_151426 ?auto_151427 ) ) ( not ( = ?auto_151426 ?auto_151428 ) ) ( not ( = ?auto_151426 ?auto_151429 ) ) ( not ( = ?auto_151427 ?auto_151428 ) ) ( not ( = ?auto_151427 ?auto_151429 ) ) ( not ( = ?auto_151428 ?auto_151429 ) ) ( ON ?auto_151429 ?auto_151430 ) ( not ( = ?auto_151423 ?auto_151430 ) ) ( not ( = ?auto_151424 ?auto_151430 ) ) ( not ( = ?auto_151425 ?auto_151430 ) ) ( not ( = ?auto_151426 ?auto_151430 ) ) ( not ( = ?auto_151427 ?auto_151430 ) ) ( not ( = ?auto_151428 ?auto_151430 ) ) ( not ( = ?auto_151429 ?auto_151430 ) ) ( CLEAR ?auto_151427 ) ( ON ?auto_151428 ?auto_151429 ) ( CLEAR ?auto_151428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151431 ) ( ON ?auto_151430 ?auto_151431 ) ( not ( = ?auto_151431 ?auto_151430 ) ) ( not ( = ?auto_151431 ?auto_151429 ) ) ( not ( = ?auto_151431 ?auto_151428 ) ) ( not ( = ?auto_151423 ?auto_151431 ) ) ( not ( = ?auto_151424 ?auto_151431 ) ) ( not ( = ?auto_151425 ?auto_151431 ) ) ( not ( = ?auto_151426 ?auto_151431 ) ) ( not ( = ?auto_151427 ?auto_151431 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151431 ?auto_151430 ?auto_151429 )
      ( MAKE-7PILE ?auto_151423 ?auto_151424 ?auto_151425 ?auto_151426 ?auto_151427 ?auto_151428 ?auto_151429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151432 - BLOCK
      ?auto_151433 - BLOCK
      ?auto_151434 - BLOCK
      ?auto_151435 - BLOCK
      ?auto_151436 - BLOCK
      ?auto_151437 - BLOCK
      ?auto_151438 - BLOCK
    )
    :vars
    (
      ?auto_151440 - BLOCK
      ?auto_151439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151432 ) ( ON ?auto_151433 ?auto_151432 ) ( ON ?auto_151434 ?auto_151433 ) ( ON ?auto_151435 ?auto_151434 ) ( not ( = ?auto_151432 ?auto_151433 ) ) ( not ( = ?auto_151432 ?auto_151434 ) ) ( not ( = ?auto_151432 ?auto_151435 ) ) ( not ( = ?auto_151432 ?auto_151436 ) ) ( not ( = ?auto_151432 ?auto_151437 ) ) ( not ( = ?auto_151432 ?auto_151438 ) ) ( not ( = ?auto_151433 ?auto_151434 ) ) ( not ( = ?auto_151433 ?auto_151435 ) ) ( not ( = ?auto_151433 ?auto_151436 ) ) ( not ( = ?auto_151433 ?auto_151437 ) ) ( not ( = ?auto_151433 ?auto_151438 ) ) ( not ( = ?auto_151434 ?auto_151435 ) ) ( not ( = ?auto_151434 ?auto_151436 ) ) ( not ( = ?auto_151434 ?auto_151437 ) ) ( not ( = ?auto_151434 ?auto_151438 ) ) ( not ( = ?auto_151435 ?auto_151436 ) ) ( not ( = ?auto_151435 ?auto_151437 ) ) ( not ( = ?auto_151435 ?auto_151438 ) ) ( not ( = ?auto_151436 ?auto_151437 ) ) ( not ( = ?auto_151436 ?auto_151438 ) ) ( not ( = ?auto_151437 ?auto_151438 ) ) ( ON ?auto_151438 ?auto_151440 ) ( not ( = ?auto_151432 ?auto_151440 ) ) ( not ( = ?auto_151433 ?auto_151440 ) ) ( not ( = ?auto_151434 ?auto_151440 ) ) ( not ( = ?auto_151435 ?auto_151440 ) ) ( not ( = ?auto_151436 ?auto_151440 ) ) ( not ( = ?auto_151437 ?auto_151440 ) ) ( not ( = ?auto_151438 ?auto_151440 ) ) ( ON ?auto_151437 ?auto_151438 ) ( CLEAR ?auto_151437 ) ( ON-TABLE ?auto_151439 ) ( ON ?auto_151440 ?auto_151439 ) ( not ( = ?auto_151439 ?auto_151440 ) ) ( not ( = ?auto_151439 ?auto_151438 ) ) ( not ( = ?auto_151439 ?auto_151437 ) ) ( not ( = ?auto_151432 ?auto_151439 ) ) ( not ( = ?auto_151433 ?auto_151439 ) ) ( not ( = ?auto_151434 ?auto_151439 ) ) ( not ( = ?auto_151435 ?auto_151439 ) ) ( not ( = ?auto_151436 ?auto_151439 ) ) ( HOLDING ?auto_151436 ) ( CLEAR ?auto_151435 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151432 ?auto_151433 ?auto_151434 ?auto_151435 ?auto_151436 )
      ( MAKE-7PILE ?auto_151432 ?auto_151433 ?auto_151434 ?auto_151435 ?auto_151436 ?auto_151437 ?auto_151438 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151441 - BLOCK
      ?auto_151442 - BLOCK
      ?auto_151443 - BLOCK
      ?auto_151444 - BLOCK
      ?auto_151445 - BLOCK
      ?auto_151446 - BLOCK
      ?auto_151447 - BLOCK
    )
    :vars
    (
      ?auto_151448 - BLOCK
      ?auto_151449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151441 ) ( ON ?auto_151442 ?auto_151441 ) ( ON ?auto_151443 ?auto_151442 ) ( ON ?auto_151444 ?auto_151443 ) ( not ( = ?auto_151441 ?auto_151442 ) ) ( not ( = ?auto_151441 ?auto_151443 ) ) ( not ( = ?auto_151441 ?auto_151444 ) ) ( not ( = ?auto_151441 ?auto_151445 ) ) ( not ( = ?auto_151441 ?auto_151446 ) ) ( not ( = ?auto_151441 ?auto_151447 ) ) ( not ( = ?auto_151442 ?auto_151443 ) ) ( not ( = ?auto_151442 ?auto_151444 ) ) ( not ( = ?auto_151442 ?auto_151445 ) ) ( not ( = ?auto_151442 ?auto_151446 ) ) ( not ( = ?auto_151442 ?auto_151447 ) ) ( not ( = ?auto_151443 ?auto_151444 ) ) ( not ( = ?auto_151443 ?auto_151445 ) ) ( not ( = ?auto_151443 ?auto_151446 ) ) ( not ( = ?auto_151443 ?auto_151447 ) ) ( not ( = ?auto_151444 ?auto_151445 ) ) ( not ( = ?auto_151444 ?auto_151446 ) ) ( not ( = ?auto_151444 ?auto_151447 ) ) ( not ( = ?auto_151445 ?auto_151446 ) ) ( not ( = ?auto_151445 ?auto_151447 ) ) ( not ( = ?auto_151446 ?auto_151447 ) ) ( ON ?auto_151447 ?auto_151448 ) ( not ( = ?auto_151441 ?auto_151448 ) ) ( not ( = ?auto_151442 ?auto_151448 ) ) ( not ( = ?auto_151443 ?auto_151448 ) ) ( not ( = ?auto_151444 ?auto_151448 ) ) ( not ( = ?auto_151445 ?auto_151448 ) ) ( not ( = ?auto_151446 ?auto_151448 ) ) ( not ( = ?auto_151447 ?auto_151448 ) ) ( ON ?auto_151446 ?auto_151447 ) ( ON-TABLE ?auto_151449 ) ( ON ?auto_151448 ?auto_151449 ) ( not ( = ?auto_151449 ?auto_151448 ) ) ( not ( = ?auto_151449 ?auto_151447 ) ) ( not ( = ?auto_151449 ?auto_151446 ) ) ( not ( = ?auto_151441 ?auto_151449 ) ) ( not ( = ?auto_151442 ?auto_151449 ) ) ( not ( = ?auto_151443 ?auto_151449 ) ) ( not ( = ?auto_151444 ?auto_151449 ) ) ( not ( = ?auto_151445 ?auto_151449 ) ) ( CLEAR ?auto_151444 ) ( ON ?auto_151445 ?auto_151446 ) ( CLEAR ?auto_151445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151449 ?auto_151448 ?auto_151447 ?auto_151446 )
      ( MAKE-7PILE ?auto_151441 ?auto_151442 ?auto_151443 ?auto_151444 ?auto_151445 ?auto_151446 ?auto_151447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151450 - BLOCK
      ?auto_151451 - BLOCK
      ?auto_151452 - BLOCK
      ?auto_151453 - BLOCK
      ?auto_151454 - BLOCK
      ?auto_151455 - BLOCK
      ?auto_151456 - BLOCK
    )
    :vars
    (
      ?auto_151458 - BLOCK
      ?auto_151457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151450 ) ( ON ?auto_151451 ?auto_151450 ) ( ON ?auto_151452 ?auto_151451 ) ( not ( = ?auto_151450 ?auto_151451 ) ) ( not ( = ?auto_151450 ?auto_151452 ) ) ( not ( = ?auto_151450 ?auto_151453 ) ) ( not ( = ?auto_151450 ?auto_151454 ) ) ( not ( = ?auto_151450 ?auto_151455 ) ) ( not ( = ?auto_151450 ?auto_151456 ) ) ( not ( = ?auto_151451 ?auto_151452 ) ) ( not ( = ?auto_151451 ?auto_151453 ) ) ( not ( = ?auto_151451 ?auto_151454 ) ) ( not ( = ?auto_151451 ?auto_151455 ) ) ( not ( = ?auto_151451 ?auto_151456 ) ) ( not ( = ?auto_151452 ?auto_151453 ) ) ( not ( = ?auto_151452 ?auto_151454 ) ) ( not ( = ?auto_151452 ?auto_151455 ) ) ( not ( = ?auto_151452 ?auto_151456 ) ) ( not ( = ?auto_151453 ?auto_151454 ) ) ( not ( = ?auto_151453 ?auto_151455 ) ) ( not ( = ?auto_151453 ?auto_151456 ) ) ( not ( = ?auto_151454 ?auto_151455 ) ) ( not ( = ?auto_151454 ?auto_151456 ) ) ( not ( = ?auto_151455 ?auto_151456 ) ) ( ON ?auto_151456 ?auto_151458 ) ( not ( = ?auto_151450 ?auto_151458 ) ) ( not ( = ?auto_151451 ?auto_151458 ) ) ( not ( = ?auto_151452 ?auto_151458 ) ) ( not ( = ?auto_151453 ?auto_151458 ) ) ( not ( = ?auto_151454 ?auto_151458 ) ) ( not ( = ?auto_151455 ?auto_151458 ) ) ( not ( = ?auto_151456 ?auto_151458 ) ) ( ON ?auto_151455 ?auto_151456 ) ( ON-TABLE ?auto_151457 ) ( ON ?auto_151458 ?auto_151457 ) ( not ( = ?auto_151457 ?auto_151458 ) ) ( not ( = ?auto_151457 ?auto_151456 ) ) ( not ( = ?auto_151457 ?auto_151455 ) ) ( not ( = ?auto_151450 ?auto_151457 ) ) ( not ( = ?auto_151451 ?auto_151457 ) ) ( not ( = ?auto_151452 ?auto_151457 ) ) ( not ( = ?auto_151453 ?auto_151457 ) ) ( not ( = ?auto_151454 ?auto_151457 ) ) ( ON ?auto_151454 ?auto_151455 ) ( CLEAR ?auto_151454 ) ( HOLDING ?auto_151453 ) ( CLEAR ?auto_151452 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151450 ?auto_151451 ?auto_151452 ?auto_151453 )
      ( MAKE-7PILE ?auto_151450 ?auto_151451 ?auto_151452 ?auto_151453 ?auto_151454 ?auto_151455 ?auto_151456 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151459 - BLOCK
      ?auto_151460 - BLOCK
      ?auto_151461 - BLOCK
      ?auto_151462 - BLOCK
      ?auto_151463 - BLOCK
      ?auto_151464 - BLOCK
      ?auto_151465 - BLOCK
    )
    :vars
    (
      ?auto_151467 - BLOCK
      ?auto_151466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151459 ) ( ON ?auto_151460 ?auto_151459 ) ( ON ?auto_151461 ?auto_151460 ) ( not ( = ?auto_151459 ?auto_151460 ) ) ( not ( = ?auto_151459 ?auto_151461 ) ) ( not ( = ?auto_151459 ?auto_151462 ) ) ( not ( = ?auto_151459 ?auto_151463 ) ) ( not ( = ?auto_151459 ?auto_151464 ) ) ( not ( = ?auto_151459 ?auto_151465 ) ) ( not ( = ?auto_151460 ?auto_151461 ) ) ( not ( = ?auto_151460 ?auto_151462 ) ) ( not ( = ?auto_151460 ?auto_151463 ) ) ( not ( = ?auto_151460 ?auto_151464 ) ) ( not ( = ?auto_151460 ?auto_151465 ) ) ( not ( = ?auto_151461 ?auto_151462 ) ) ( not ( = ?auto_151461 ?auto_151463 ) ) ( not ( = ?auto_151461 ?auto_151464 ) ) ( not ( = ?auto_151461 ?auto_151465 ) ) ( not ( = ?auto_151462 ?auto_151463 ) ) ( not ( = ?auto_151462 ?auto_151464 ) ) ( not ( = ?auto_151462 ?auto_151465 ) ) ( not ( = ?auto_151463 ?auto_151464 ) ) ( not ( = ?auto_151463 ?auto_151465 ) ) ( not ( = ?auto_151464 ?auto_151465 ) ) ( ON ?auto_151465 ?auto_151467 ) ( not ( = ?auto_151459 ?auto_151467 ) ) ( not ( = ?auto_151460 ?auto_151467 ) ) ( not ( = ?auto_151461 ?auto_151467 ) ) ( not ( = ?auto_151462 ?auto_151467 ) ) ( not ( = ?auto_151463 ?auto_151467 ) ) ( not ( = ?auto_151464 ?auto_151467 ) ) ( not ( = ?auto_151465 ?auto_151467 ) ) ( ON ?auto_151464 ?auto_151465 ) ( ON-TABLE ?auto_151466 ) ( ON ?auto_151467 ?auto_151466 ) ( not ( = ?auto_151466 ?auto_151467 ) ) ( not ( = ?auto_151466 ?auto_151465 ) ) ( not ( = ?auto_151466 ?auto_151464 ) ) ( not ( = ?auto_151459 ?auto_151466 ) ) ( not ( = ?auto_151460 ?auto_151466 ) ) ( not ( = ?auto_151461 ?auto_151466 ) ) ( not ( = ?auto_151462 ?auto_151466 ) ) ( not ( = ?auto_151463 ?auto_151466 ) ) ( ON ?auto_151463 ?auto_151464 ) ( CLEAR ?auto_151461 ) ( ON ?auto_151462 ?auto_151463 ) ( CLEAR ?auto_151462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151466 ?auto_151467 ?auto_151465 ?auto_151464 ?auto_151463 )
      ( MAKE-7PILE ?auto_151459 ?auto_151460 ?auto_151461 ?auto_151462 ?auto_151463 ?auto_151464 ?auto_151465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151468 - BLOCK
      ?auto_151469 - BLOCK
      ?auto_151470 - BLOCK
      ?auto_151471 - BLOCK
      ?auto_151472 - BLOCK
      ?auto_151473 - BLOCK
      ?auto_151474 - BLOCK
    )
    :vars
    (
      ?auto_151476 - BLOCK
      ?auto_151475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151468 ) ( ON ?auto_151469 ?auto_151468 ) ( not ( = ?auto_151468 ?auto_151469 ) ) ( not ( = ?auto_151468 ?auto_151470 ) ) ( not ( = ?auto_151468 ?auto_151471 ) ) ( not ( = ?auto_151468 ?auto_151472 ) ) ( not ( = ?auto_151468 ?auto_151473 ) ) ( not ( = ?auto_151468 ?auto_151474 ) ) ( not ( = ?auto_151469 ?auto_151470 ) ) ( not ( = ?auto_151469 ?auto_151471 ) ) ( not ( = ?auto_151469 ?auto_151472 ) ) ( not ( = ?auto_151469 ?auto_151473 ) ) ( not ( = ?auto_151469 ?auto_151474 ) ) ( not ( = ?auto_151470 ?auto_151471 ) ) ( not ( = ?auto_151470 ?auto_151472 ) ) ( not ( = ?auto_151470 ?auto_151473 ) ) ( not ( = ?auto_151470 ?auto_151474 ) ) ( not ( = ?auto_151471 ?auto_151472 ) ) ( not ( = ?auto_151471 ?auto_151473 ) ) ( not ( = ?auto_151471 ?auto_151474 ) ) ( not ( = ?auto_151472 ?auto_151473 ) ) ( not ( = ?auto_151472 ?auto_151474 ) ) ( not ( = ?auto_151473 ?auto_151474 ) ) ( ON ?auto_151474 ?auto_151476 ) ( not ( = ?auto_151468 ?auto_151476 ) ) ( not ( = ?auto_151469 ?auto_151476 ) ) ( not ( = ?auto_151470 ?auto_151476 ) ) ( not ( = ?auto_151471 ?auto_151476 ) ) ( not ( = ?auto_151472 ?auto_151476 ) ) ( not ( = ?auto_151473 ?auto_151476 ) ) ( not ( = ?auto_151474 ?auto_151476 ) ) ( ON ?auto_151473 ?auto_151474 ) ( ON-TABLE ?auto_151475 ) ( ON ?auto_151476 ?auto_151475 ) ( not ( = ?auto_151475 ?auto_151476 ) ) ( not ( = ?auto_151475 ?auto_151474 ) ) ( not ( = ?auto_151475 ?auto_151473 ) ) ( not ( = ?auto_151468 ?auto_151475 ) ) ( not ( = ?auto_151469 ?auto_151475 ) ) ( not ( = ?auto_151470 ?auto_151475 ) ) ( not ( = ?auto_151471 ?auto_151475 ) ) ( not ( = ?auto_151472 ?auto_151475 ) ) ( ON ?auto_151472 ?auto_151473 ) ( ON ?auto_151471 ?auto_151472 ) ( CLEAR ?auto_151471 ) ( HOLDING ?auto_151470 ) ( CLEAR ?auto_151469 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151468 ?auto_151469 ?auto_151470 )
      ( MAKE-7PILE ?auto_151468 ?auto_151469 ?auto_151470 ?auto_151471 ?auto_151472 ?auto_151473 ?auto_151474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151477 - BLOCK
      ?auto_151478 - BLOCK
      ?auto_151479 - BLOCK
      ?auto_151480 - BLOCK
      ?auto_151481 - BLOCK
      ?auto_151482 - BLOCK
      ?auto_151483 - BLOCK
    )
    :vars
    (
      ?auto_151484 - BLOCK
      ?auto_151485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151477 ) ( ON ?auto_151478 ?auto_151477 ) ( not ( = ?auto_151477 ?auto_151478 ) ) ( not ( = ?auto_151477 ?auto_151479 ) ) ( not ( = ?auto_151477 ?auto_151480 ) ) ( not ( = ?auto_151477 ?auto_151481 ) ) ( not ( = ?auto_151477 ?auto_151482 ) ) ( not ( = ?auto_151477 ?auto_151483 ) ) ( not ( = ?auto_151478 ?auto_151479 ) ) ( not ( = ?auto_151478 ?auto_151480 ) ) ( not ( = ?auto_151478 ?auto_151481 ) ) ( not ( = ?auto_151478 ?auto_151482 ) ) ( not ( = ?auto_151478 ?auto_151483 ) ) ( not ( = ?auto_151479 ?auto_151480 ) ) ( not ( = ?auto_151479 ?auto_151481 ) ) ( not ( = ?auto_151479 ?auto_151482 ) ) ( not ( = ?auto_151479 ?auto_151483 ) ) ( not ( = ?auto_151480 ?auto_151481 ) ) ( not ( = ?auto_151480 ?auto_151482 ) ) ( not ( = ?auto_151480 ?auto_151483 ) ) ( not ( = ?auto_151481 ?auto_151482 ) ) ( not ( = ?auto_151481 ?auto_151483 ) ) ( not ( = ?auto_151482 ?auto_151483 ) ) ( ON ?auto_151483 ?auto_151484 ) ( not ( = ?auto_151477 ?auto_151484 ) ) ( not ( = ?auto_151478 ?auto_151484 ) ) ( not ( = ?auto_151479 ?auto_151484 ) ) ( not ( = ?auto_151480 ?auto_151484 ) ) ( not ( = ?auto_151481 ?auto_151484 ) ) ( not ( = ?auto_151482 ?auto_151484 ) ) ( not ( = ?auto_151483 ?auto_151484 ) ) ( ON ?auto_151482 ?auto_151483 ) ( ON-TABLE ?auto_151485 ) ( ON ?auto_151484 ?auto_151485 ) ( not ( = ?auto_151485 ?auto_151484 ) ) ( not ( = ?auto_151485 ?auto_151483 ) ) ( not ( = ?auto_151485 ?auto_151482 ) ) ( not ( = ?auto_151477 ?auto_151485 ) ) ( not ( = ?auto_151478 ?auto_151485 ) ) ( not ( = ?auto_151479 ?auto_151485 ) ) ( not ( = ?auto_151480 ?auto_151485 ) ) ( not ( = ?auto_151481 ?auto_151485 ) ) ( ON ?auto_151481 ?auto_151482 ) ( ON ?auto_151480 ?auto_151481 ) ( CLEAR ?auto_151478 ) ( ON ?auto_151479 ?auto_151480 ) ( CLEAR ?auto_151479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151485 ?auto_151484 ?auto_151483 ?auto_151482 ?auto_151481 ?auto_151480 )
      ( MAKE-7PILE ?auto_151477 ?auto_151478 ?auto_151479 ?auto_151480 ?auto_151481 ?auto_151482 ?auto_151483 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151486 - BLOCK
      ?auto_151487 - BLOCK
      ?auto_151488 - BLOCK
      ?auto_151489 - BLOCK
      ?auto_151490 - BLOCK
      ?auto_151491 - BLOCK
      ?auto_151492 - BLOCK
    )
    :vars
    (
      ?auto_151494 - BLOCK
      ?auto_151493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151486 ) ( not ( = ?auto_151486 ?auto_151487 ) ) ( not ( = ?auto_151486 ?auto_151488 ) ) ( not ( = ?auto_151486 ?auto_151489 ) ) ( not ( = ?auto_151486 ?auto_151490 ) ) ( not ( = ?auto_151486 ?auto_151491 ) ) ( not ( = ?auto_151486 ?auto_151492 ) ) ( not ( = ?auto_151487 ?auto_151488 ) ) ( not ( = ?auto_151487 ?auto_151489 ) ) ( not ( = ?auto_151487 ?auto_151490 ) ) ( not ( = ?auto_151487 ?auto_151491 ) ) ( not ( = ?auto_151487 ?auto_151492 ) ) ( not ( = ?auto_151488 ?auto_151489 ) ) ( not ( = ?auto_151488 ?auto_151490 ) ) ( not ( = ?auto_151488 ?auto_151491 ) ) ( not ( = ?auto_151488 ?auto_151492 ) ) ( not ( = ?auto_151489 ?auto_151490 ) ) ( not ( = ?auto_151489 ?auto_151491 ) ) ( not ( = ?auto_151489 ?auto_151492 ) ) ( not ( = ?auto_151490 ?auto_151491 ) ) ( not ( = ?auto_151490 ?auto_151492 ) ) ( not ( = ?auto_151491 ?auto_151492 ) ) ( ON ?auto_151492 ?auto_151494 ) ( not ( = ?auto_151486 ?auto_151494 ) ) ( not ( = ?auto_151487 ?auto_151494 ) ) ( not ( = ?auto_151488 ?auto_151494 ) ) ( not ( = ?auto_151489 ?auto_151494 ) ) ( not ( = ?auto_151490 ?auto_151494 ) ) ( not ( = ?auto_151491 ?auto_151494 ) ) ( not ( = ?auto_151492 ?auto_151494 ) ) ( ON ?auto_151491 ?auto_151492 ) ( ON-TABLE ?auto_151493 ) ( ON ?auto_151494 ?auto_151493 ) ( not ( = ?auto_151493 ?auto_151494 ) ) ( not ( = ?auto_151493 ?auto_151492 ) ) ( not ( = ?auto_151493 ?auto_151491 ) ) ( not ( = ?auto_151486 ?auto_151493 ) ) ( not ( = ?auto_151487 ?auto_151493 ) ) ( not ( = ?auto_151488 ?auto_151493 ) ) ( not ( = ?auto_151489 ?auto_151493 ) ) ( not ( = ?auto_151490 ?auto_151493 ) ) ( ON ?auto_151490 ?auto_151491 ) ( ON ?auto_151489 ?auto_151490 ) ( ON ?auto_151488 ?auto_151489 ) ( CLEAR ?auto_151488 ) ( HOLDING ?auto_151487 ) ( CLEAR ?auto_151486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151486 ?auto_151487 )
      ( MAKE-7PILE ?auto_151486 ?auto_151487 ?auto_151488 ?auto_151489 ?auto_151490 ?auto_151491 ?auto_151492 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151495 - BLOCK
      ?auto_151496 - BLOCK
      ?auto_151497 - BLOCK
      ?auto_151498 - BLOCK
      ?auto_151499 - BLOCK
      ?auto_151500 - BLOCK
      ?auto_151501 - BLOCK
    )
    :vars
    (
      ?auto_151502 - BLOCK
      ?auto_151503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151495 ) ( not ( = ?auto_151495 ?auto_151496 ) ) ( not ( = ?auto_151495 ?auto_151497 ) ) ( not ( = ?auto_151495 ?auto_151498 ) ) ( not ( = ?auto_151495 ?auto_151499 ) ) ( not ( = ?auto_151495 ?auto_151500 ) ) ( not ( = ?auto_151495 ?auto_151501 ) ) ( not ( = ?auto_151496 ?auto_151497 ) ) ( not ( = ?auto_151496 ?auto_151498 ) ) ( not ( = ?auto_151496 ?auto_151499 ) ) ( not ( = ?auto_151496 ?auto_151500 ) ) ( not ( = ?auto_151496 ?auto_151501 ) ) ( not ( = ?auto_151497 ?auto_151498 ) ) ( not ( = ?auto_151497 ?auto_151499 ) ) ( not ( = ?auto_151497 ?auto_151500 ) ) ( not ( = ?auto_151497 ?auto_151501 ) ) ( not ( = ?auto_151498 ?auto_151499 ) ) ( not ( = ?auto_151498 ?auto_151500 ) ) ( not ( = ?auto_151498 ?auto_151501 ) ) ( not ( = ?auto_151499 ?auto_151500 ) ) ( not ( = ?auto_151499 ?auto_151501 ) ) ( not ( = ?auto_151500 ?auto_151501 ) ) ( ON ?auto_151501 ?auto_151502 ) ( not ( = ?auto_151495 ?auto_151502 ) ) ( not ( = ?auto_151496 ?auto_151502 ) ) ( not ( = ?auto_151497 ?auto_151502 ) ) ( not ( = ?auto_151498 ?auto_151502 ) ) ( not ( = ?auto_151499 ?auto_151502 ) ) ( not ( = ?auto_151500 ?auto_151502 ) ) ( not ( = ?auto_151501 ?auto_151502 ) ) ( ON ?auto_151500 ?auto_151501 ) ( ON-TABLE ?auto_151503 ) ( ON ?auto_151502 ?auto_151503 ) ( not ( = ?auto_151503 ?auto_151502 ) ) ( not ( = ?auto_151503 ?auto_151501 ) ) ( not ( = ?auto_151503 ?auto_151500 ) ) ( not ( = ?auto_151495 ?auto_151503 ) ) ( not ( = ?auto_151496 ?auto_151503 ) ) ( not ( = ?auto_151497 ?auto_151503 ) ) ( not ( = ?auto_151498 ?auto_151503 ) ) ( not ( = ?auto_151499 ?auto_151503 ) ) ( ON ?auto_151499 ?auto_151500 ) ( ON ?auto_151498 ?auto_151499 ) ( ON ?auto_151497 ?auto_151498 ) ( CLEAR ?auto_151495 ) ( ON ?auto_151496 ?auto_151497 ) ( CLEAR ?auto_151496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151503 ?auto_151502 ?auto_151501 ?auto_151500 ?auto_151499 ?auto_151498 ?auto_151497 )
      ( MAKE-7PILE ?auto_151495 ?auto_151496 ?auto_151497 ?auto_151498 ?auto_151499 ?auto_151500 ?auto_151501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151504 - BLOCK
      ?auto_151505 - BLOCK
      ?auto_151506 - BLOCK
      ?auto_151507 - BLOCK
      ?auto_151508 - BLOCK
      ?auto_151509 - BLOCK
      ?auto_151510 - BLOCK
    )
    :vars
    (
      ?auto_151512 - BLOCK
      ?auto_151511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151504 ?auto_151505 ) ) ( not ( = ?auto_151504 ?auto_151506 ) ) ( not ( = ?auto_151504 ?auto_151507 ) ) ( not ( = ?auto_151504 ?auto_151508 ) ) ( not ( = ?auto_151504 ?auto_151509 ) ) ( not ( = ?auto_151504 ?auto_151510 ) ) ( not ( = ?auto_151505 ?auto_151506 ) ) ( not ( = ?auto_151505 ?auto_151507 ) ) ( not ( = ?auto_151505 ?auto_151508 ) ) ( not ( = ?auto_151505 ?auto_151509 ) ) ( not ( = ?auto_151505 ?auto_151510 ) ) ( not ( = ?auto_151506 ?auto_151507 ) ) ( not ( = ?auto_151506 ?auto_151508 ) ) ( not ( = ?auto_151506 ?auto_151509 ) ) ( not ( = ?auto_151506 ?auto_151510 ) ) ( not ( = ?auto_151507 ?auto_151508 ) ) ( not ( = ?auto_151507 ?auto_151509 ) ) ( not ( = ?auto_151507 ?auto_151510 ) ) ( not ( = ?auto_151508 ?auto_151509 ) ) ( not ( = ?auto_151508 ?auto_151510 ) ) ( not ( = ?auto_151509 ?auto_151510 ) ) ( ON ?auto_151510 ?auto_151512 ) ( not ( = ?auto_151504 ?auto_151512 ) ) ( not ( = ?auto_151505 ?auto_151512 ) ) ( not ( = ?auto_151506 ?auto_151512 ) ) ( not ( = ?auto_151507 ?auto_151512 ) ) ( not ( = ?auto_151508 ?auto_151512 ) ) ( not ( = ?auto_151509 ?auto_151512 ) ) ( not ( = ?auto_151510 ?auto_151512 ) ) ( ON ?auto_151509 ?auto_151510 ) ( ON-TABLE ?auto_151511 ) ( ON ?auto_151512 ?auto_151511 ) ( not ( = ?auto_151511 ?auto_151512 ) ) ( not ( = ?auto_151511 ?auto_151510 ) ) ( not ( = ?auto_151511 ?auto_151509 ) ) ( not ( = ?auto_151504 ?auto_151511 ) ) ( not ( = ?auto_151505 ?auto_151511 ) ) ( not ( = ?auto_151506 ?auto_151511 ) ) ( not ( = ?auto_151507 ?auto_151511 ) ) ( not ( = ?auto_151508 ?auto_151511 ) ) ( ON ?auto_151508 ?auto_151509 ) ( ON ?auto_151507 ?auto_151508 ) ( ON ?auto_151506 ?auto_151507 ) ( ON ?auto_151505 ?auto_151506 ) ( CLEAR ?auto_151505 ) ( HOLDING ?auto_151504 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151504 )
      ( MAKE-7PILE ?auto_151504 ?auto_151505 ?auto_151506 ?auto_151507 ?auto_151508 ?auto_151509 ?auto_151510 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_151513 - BLOCK
      ?auto_151514 - BLOCK
      ?auto_151515 - BLOCK
      ?auto_151516 - BLOCK
      ?auto_151517 - BLOCK
      ?auto_151518 - BLOCK
      ?auto_151519 - BLOCK
    )
    :vars
    (
      ?auto_151521 - BLOCK
      ?auto_151520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151513 ?auto_151514 ) ) ( not ( = ?auto_151513 ?auto_151515 ) ) ( not ( = ?auto_151513 ?auto_151516 ) ) ( not ( = ?auto_151513 ?auto_151517 ) ) ( not ( = ?auto_151513 ?auto_151518 ) ) ( not ( = ?auto_151513 ?auto_151519 ) ) ( not ( = ?auto_151514 ?auto_151515 ) ) ( not ( = ?auto_151514 ?auto_151516 ) ) ( not ( = ?auto_151514 ?auto_151517 ) ) ( not ( = ?auto_151514 ?auto_151518 ) ) ( not ( = ?auto_151514 ?auto_151519 ) ) ( not ( = ?auto_151515 ?auto_151516 ) ) ( not ( = ?auto_151515 ?auto_151517 ) ) ( not ( = ?auto_151515 ?auto_151518 ) ) ( not ( = ?auto_151515 ?auto_151519 ) ) ( not ( = ?auto_151516 ?auto_151517 ) ) ( not ( = ?auto_151516 ?auto_151518 ) ) ( not ( = ?auto_151516 ?auto_151519 ) ) ( not ( = ?auto_151517 ?auto_151518 ) ) ( not ( = ?auto_151517 ?auto_151519 ) ) ( not ( = ?auto_151518 ?auto_151519 ) ) ( ON ?auto_151519 ?auto_151521 ) ( not ( = ?auto_151513 ?auto_151521 ) ) ( not ( = ?auto_151514 ?auto_151521 ) ) ( not ( = ?auto_151515 ?auto_151521 ) ) ( not ( = ?auto_151516 ?auto_151521 ) ) ( not ( = ?auto_151517 ?auto_151521 ) ) ( not ( = ?auto_151518 ?auto_151521 ) ) ( not ( = ?auto_151519 ?auto_151521 ) ) ( ON ?auto_151518 ?auto_151519 ) ( ON-TABLE ?auto_151520 ) ( ON ?auto_151521 ?auto_151520 ) ( not ( = ?auto_151520 ?auto_151521 ) ) ( not ( = ?auto_151520 ?auto_151519 ) ) ( not ( = ?auto_151520 ?auto_151518 ) ) ( not ( = ?auto_151513 ?auto_151520 ) ) ( not ( = ?auto_151514 ?auto_151520 ) ) ( not ( = ?auto_151515 ?auto_151520 ) ) ( not ( = ?auto_151516 ?auto_151520 ) ) ( not ( = ?auto_151517 ?auto_151520 ) ) ( ON ?auto_151517 ?auto_151518 ) ( ON ?auto_151516 ?auto_151517 ) ( ON ?auto_151515 ?auto_151516 ) ( ON ?auto_151514 ?auto_151515 ) ( ON ?auto_151513 ?auto_151514 ) ( CLEAR ?auto_151513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151520 ?auto_151521 ?auto_151519 ?auto_151518 ?auto_151517 ?auto_151516 ?auto_151515 ?auto_151514 )
      ( MAKE-7PILE ?auto_151513 ?auto_151514 ?auto_151515 ?auto_151516 ?auto_151517 ?auto_151518 ?auto_151519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151523 - BLOCK
    )
    :vars
    (
      ?auto_151524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151524 ?auto_151523 ) ( CLEAR ?auto_151524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151523 ) ( not ( = ?auto_151523 ?auto_151524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151524 ?auto_151523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151525 - BLOCK
    )
    :vars
    (
      ?auto_151526 - BLOCK
      ?auto_151527 - BLOCK
      ?auto_151528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151526 ?auto_151525 ) ( CLEAR ?auto_151526 ) ( ON-TABLE ?auto_151525 ) ( not ( = ?auto_151525 ?auto_151526 ) ) ( HOLDING ?auto_151527 ) ( CLEAR ?auto_151528 ) ( not ( = ?auto_151525 ?auto_151527 ) ) ( not ( = ?auto_151525 ?auto_151528 ) ) ( not ( = ?auto_151526 ?auto_151527 ) ) ( not ( = ?auto_151526 ?auto_151528 ) ) ( not ( = ?auto_151527 ?auto_151528 ) ) )
    :subtasks
    ( ( !STACK ?auto_151527 ?auto_151528 )
      ( MAKE-1PILE ?auto_151525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151529 - BLOCK
    )
    :vars
    (
      ?auto_151532 - BLOCK
      ?auto_151530 - BLOCK
      ?auto_151531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151532 ?auto_151529 ) ( ON-TABLE ?auto_151529 ) ( not ( = ?auto_151529 ?auto_151532 ) ) ( CLEAR ?auto_151530 ) ( not ( = ?auto_151529 ?auto_151531 ) ) ( not ( = ?auto_151529 ?auto_151530 ) ) ( not ( = ?auto_151532 ?auto_151531 ) ) ( not ( = ?auto_151532 ?auto_151530 ) ) ( not ( = ?auto_151531 ?auto_151530 ) ) ( ON ?auto_151531 ?auto_151532 ) ( CLEAR ?auto_151531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151529 ?auto_151532 )
      ( MAKE-1PILE ?auto_151529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151533 - BLOCK
    )
    :vars
    (
      ?auto_151534 - BLOCK
      ?auto_151536 - BLOCK
      ?auto_151535 - BLOCK
      ?auto_151539 - BLOCK
      ?auto_151537 - BLOCK
      ?auto_151538 - BLOCK
      ?auto_151541 - BLOCK
      ?auto_151540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151534 ?auto_151533 ) ( ON-TABLE ?auto_151533 ) ( not ( = ?auto_151533 ?auto_151534 ) ) ( not ( = ?auto_151533 ?auto_151536 ) ) ( not ( = ?auto_151533 ?auto_151535 ) ) ( not ( = ?auto_151534 ?auto_151536 ) ) ( not ( = ?auto_151534 ?auto_151535 ) ) ( not ( = ?auto_151536 ?auto_151535 ) ) ( ON ?auto_151536 ?auto_151534 ) ( CLEAR ?auto_151536 ) ( HOLDING ?auto_151535 ) ( CLEAR ?auto_151539 ) ( ON-TABLE ?auto_151537 ) ( ON ?auto_151538 ?auto_151537 ) ( ON ?auto_151541 ?auto_151538 ) ( ON ?auto_151540 ?auto_151541 ) ( ON ?auto_151539 ?auto_151540 ) ( not ( = ?auto_151537 ?auto_151538 ) ) ( not ( = ?auto_151537 ?auto_151541 ) ) ( not ( = ?auto_151537 ?auto_151540 ) ) ( not ( = ?auto_151537 ?auto_151539 ) ) ( not ( = ?auto_151537 ?auto_151535 ) ) ( not ( = ?auto_151538 ?auto_151541 ) ) ( not ( = ?auto_151538 ?auto_151540 ) ) ( not ( = ?auto_151538 ?auto_151539 ) ) ( not ( = ?auto_151538 ?auto_151535 ) ) ( not ( = ?auto_151541 ?auto_151540 ) ) ( not ( = ?auto_151541 ?auto_151539 ) ) ( not ( = ?auto_151541 ?auto_151535 ) ) ( not ( = ?auto_151540 ?auto_151539 ) ) ( not ( = ?auto_151540 ?auto_151535 ) ) ( not ( = ?auto_151539 ?auto_151535 ) ) ( not ( = ?auto_151533 ?auto_151539 ) ) ( not ( = ?auto_151533 ?auto_151537 ) ) ( not ( = ?auto_151533 ?auto_151538 ) ) ( not ( = ?auto_151533 ?auto_151541 ) ) ( not ( = ?auto_151533 ?auto_151540 ) ) ( not ( = ?auto_151534 ?auto_151539 ) ) ( not ( = ?auto_151534 ?auto_151537 ) ) ( not ( = ?auto_151534 ?auto_151538 ) ) ( not ( = ?auto_151534 ?auto_151541 ) ) ( not ( = ?auto_151534 ?auto_151540 ) ) ( not ( = ?auto_151536 ?auto_151539 ) ) ( not ( = ?auto_151536 ?auto_151537 ) ) ( not ( = ?auto_151536 ?auto_151538 ) ) ( not ( = ?auto_151536 ?auto_151541 ) ) ( not ( = ?auto_151536 ?auto_151540 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151537 ?auto_151538 ?auto_151541 ?auto_151540 ?auto_151539 ?auto_151535 )
      ( MAKE-1PILE ?auto_151533 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151542 - BLOCK
    )
    :vars
    (
      ?auto_151548 - BLOCK
      ?auto_151545 - BLOCK
      ?auto_151544 - BLOCK
      ?auto_151550 - BLOCK
      ?auto_151549 - BLOCK
      ?auto_151547 - BLOCK
      ?auto_151543 - BLOCK
      ?auto_151546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151548 ?auto_151542 ) ( ON-TABLE ?auto_151542 ) ( not ( = ?auto_151542 ?auto_151548 ) ) ( not ( = ?auto_151542 ?auto_151545 ) ) ( not ( = ?auto_151542 ?auto_151544 ) ) ( not ( = ?auto_151548 ?auto_151545 ) ) ( not ( = ?auto_151548 ?auto_151544 ) ) ( not ( = ?auto_151545 ?auto_151544 ) ) ( ON ?auto_151545 ?auto_151548 ) ( CLEAR ?auto_151550 ) ( ON-TABLE ?auto_151549 ) ( ON ?auto_151547 ?auto_151549 ) ( ON ?auto_151543 ?auto_151547 ) ( ON ?auto_151546 ?auto_151543 ) ( ON ?auto_151550 ?auto_151546 ) ( not ( = ?auto_151549 ?auto_151547 ) ) ( not ( = ?auto_151549 ?auto_151543 ) ) ( not ( = ?auto_151549 ?auto_151546 ) ) ( not ( = ?auto_151549 ?auto_151550 ) ) ( not ( = ?auto_151549 ?auto_151544 ) ) ( not ( = ?auto_151547 ?auto_151543 ) ) ( not ( = ?auto_151547 ?auto_151546 ) ) ( not ( = ?auto_151547 ?auto_151550 ) ) ( not ( = ?auto_151547 ?auto_151544 ) ) ( not ( = ?auto_151543 ?auto_151546 ) ) ( not ( = ?auto_151543 ?auto_151550 ) ) ( not ( = ?auto_151543 ?auto_151544 ) ) ( not ( = ?auto_151546 ?auto_151550 ) ) ( not ( = ?auto_151546 ?auto_151544 ) ) ( not ( = ?auto_151550 ?auto_151544 ) ) ( not ( = ?auto_151542 ?auto_151550 ) ) ( not ( = ?auto_151542 ?auto_151549 ) ) ( not ( = ?auto_151542 ?auto_151547 ) ) ( not ( = ?auto_151542 ?auto_151543 ) ) ( not ( = ?auto_151542 ?auto_151546 ) ) ( not ( = ?auto_151548 ?auto_151550 ) ) ( not ( = ?auto_151548 ?auto_151549 ) ) ( not ( = ?auto_151548 ?auto_151547 ) ) ( not ( = ?auto_151548 ?auto_151543 ) ) ( not ( = ?auto_151548 ?auto_151546 ) ) ( not ( = ?auto_151545 ?auto_151550 ) ) ( not ( = ?auto_151545 ?auto_151549 ) ) ( not ( = ?auto_151545 ?auto_151547 ) ) ( not ( = ?auto_151545 ?auto_151543 ) ) ( not ( = ?auto_151545 ?auto_151546 ) ) ( ON ?auto_151544 ?auto_151545 ) ( CLEAR ?auto_151544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151542 ?auto_151548 ?auto_151545 )
      ( MAKE-1PILE ?auto_151542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151551 - BLOCK
    )
    :vars
    (
      ?auto_151553 - BLOCK
      ?auto_151557 - BLOCK
      ?auto_151554 - BLOCK
      ?auto_151555 - BLOCK
      ?auto_151559 - BLOCK
      ?auto_151556 - BLOCK
      ?auto_151558 - BLOCK
      ?auto_151552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151553 ?auto_151551 ) ( ON-TABLE ?auto_151551 ) ( not ( = ?auto_151551 ?auto_151553 ) ) ( not ( = ?auto_151551 ?auto_151557 ) ) ( not ( = ?auto_151551 ?auto_151554 ) ) ( not ( = ?auto_151553 ?auto_151557 ) ) ( not ( = ?auto_151553 ?auto_151554 ) ) ( not ( = ?auto_151557 ?auto_151554 ) ) ( ON ?auto_151557 ?auto_151553 ) ( ON-TABLE ?auto_151555 ) ( ON ?auto_151559 ?auto_151555 ) ( ON ?auto_151556 ?auto_151559 ) ( ON ?auto_151558 ?auto_151556 ) ( not ( = ?auto_151555 ?auto_151559 ) ) ( not ( = ?auto_151555 ?auto_151556 ) ) ( not ( = ?auto_151555 ?auto_151558 ) ) ( not ( = ?auto_151555 ?auto_151552 ) ) ( not ( = ?auto_151555 ?auto_151554 ) ) ( not ( = ?auto_151559 ?auto_151556 ) ) ( not ( = ?auto_151559 ?auto_151558 ) ) ( not ( = ?auto_151559 ?auto_151552 ) ) ( not ( = ?auto_151559 ?auto_151554 ) ) ( not ( = ?auto_151556 ?auto_151558 ) ) ( not ( = ?auto_151556 ?auto_151552 ) ) ( not ( = ?auto_151556 ?auto_151554 ) ) ( not ( = ?auto_151558 ?auto_151552 ) ) ( not ( = ?auto_151558 ?auto_151554 ) ) ( not ( = ?auto_151552 ?auto_151554 ) ) ( not ( = ?auto_151551 ?auto_151552 ) ) ( not ( = ?auto_151551 ?auto_151555 ) ) ( not ( = ?auto_151551 ?auto_151559 ) ) ( not ( = ?auto_151551 ?auto_151556 ) ) ( not ( = ?auto_151551 ?auto_151558 ) ) ( not ( = ?auto_151553 ?auto_151552 ) ) ( not ( = ?auto_151553 ?auto_151555 ) ) ( not ( = ?auto_151553 ?auto_151559 ) ) ( not ( = ?auto_151553 ?auto_151556 ) ) ( not ( = ?auto_151553 ?auto_151558 ) ) ( not ( = ?auto_151557 ?auto_151552 ) ) ( not ( = ?auto_151557 ?auto_151555 ) ) ( not ( = ?auto_151557 ?auto_151559 ) ) ( not ( = ?auto_151557 ?auto_151556 ) ) ( not ( = ?auto_151557 ?auto_151558 ) ) ( ON ?auto_151554 ?auto_151557 ) ( CLEAR ?auto_151554 ) ( HOLDING ?auto_151552 ) ( CLEAR ?auto_151558 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151555 ?auto_151559 ?auto_151556 ?auto_151558 ?auto_151552 )
      ( MAKE-1PILE ?auto_151551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151560 - BLOCK
    )
    :vars
    (
      ?auto_151561 - BLOCK
      ?auto_151567 - BLOCK
      ?auto_151568 - BLOCK
      ?auto_151562 - BLOCK
      ?auto_151564 - BLOCK
      ?auto_151566 - BLOCK
      ?auto_151563 - BLOCK
      ?auto_151565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151561 ?auto_151560 ) ( ON-TABLE ?auto_151560 ) ( not ( = ?auto_151560 ?auto_151561 ) ) ( not ( = ?auto_151560 ?auto_151567 ) ) ( not ( = ?auto_151560 ?auto_151568 ) ) ( not ( = ?auto_151561 ?auto_151567 ) ) ( not ( = ?auto_151561 ?auto_151568 ) ) ( not ( = ?auto_151567 ?auto_151568 ) ) ( ON ?auto_151567 ?auto_151561 ) ( ON-TABLE ?auto_151562 ) ( ON ?auto_151564 ?auto_151562 ) ( ON ?auto_151566 ?auto_151564 ) ( ON ?auto_151563 ?auto_151566 ) ( not ( = ?auto_151562 ?auto_151564 ) ) ( not ( = ?auto_151562 ?auto_151566 ) ) ( not ( = ?auto_151562 ?auto_151563 ) ) ( not ( = ?auto_151562 ?auto_151565 ) ) ( not ( = ?auto_151562 ?auto_151568 ) ) ( not ( = ?auto_151564 ?auto_151566 ) ) ( not ( = ?auto_151564 ?auto_151563 ) ) ( not ( = ?auto_151564 ?auto_151565 ) ) ( not ( = ?auto_151564 ?auto_151568 ) ) ( not ( = ?auto_151566 ?auto_151563 ) ) ( not ( = ?auto_151566 ?auto_151565 ) ) ( not ( = ?auto_151566 ?auto_151568 ) ) ( not ( = ?auto_151563 ?auto_151565 ) ) ( not ( = ?auto_151563 ?auto_151568 ) ) ( not ( = ?auto_151565 ?auto_151568 ) ) ( not ( = ?auto_151560 ?auto_151565 ) ) ( not ( = ?auto_151560 ?auto_151562 ) ) ( not ( = ?auto_151560 ?auto_151564 ) ) ( not ( = ?auto_151560 ?auto_151566 ) ) ( not ( = ?auto_151560 ?auto_151563 ) ) ( not ( = ?auto_151561 ?auto_151565 ) ) ( not ( = ?auto_151561 ?auto_151562 ) ) ( not ( = ?auto_151561 ?auto_151564 ) ) ( not ( = ?auto_151561 ?auto_151566 ) ) ( not ( = ?auto_151561 ?auto_151563 ) ) ( not ( = ?auto_151567 ?auto_151565 ) ) ( not ( = ?auto_151567 ?auto_151562 ) ) ( not ( = ?auto_151567 ?auto_151564 ) ) ( not ( = ?auto_151567 ?auto_151566 ) ) ( not ( = ?auto_151567 ?auto_151563 ) ) ( ON ?auto_151568 ?auto_151567 ) ( CLEAR ?auto_151563 ) ( ON ?auto_151565 ?auto_151568 ) ( CLEAR ?auto_151565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151560 ?auto_151561 ?auto_151567 ?auto_151568 )
      ( MAKE-1PILE ?auto_151560 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151569 - BLOCK
    )
    :vars
    (
      ?auto_151572 - BLOCK
      ?auto_151577 - BLOCK
      ?auto_151576 - BLOCK
      ?auto_151571 - BLOCK
      ?auto_151573 - BLOCK
      ?auto_151570 - BLOCK
      ?auto_151574 - BLOCK
      ?auto_151575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151572 ?auto_151569 ) ( ON-TABLE ?auto_151569 ) ( not ( = ?auto_151569 ?auto_151572 ) ) ( not ( = ?auto_151569 ?auto_151577 ) ) ( not ( = ?auto_151569 ?auto_151576 ) ) ( not ( = ?auto_151572 ?auto_151577 ) ) ( not ( = ?auto_151572 ?auto_151576 ) ) ( not ( = ?auto_151577 ?auto_151576 ) ) ( ON ?auto_151577 ?auto_151572 ) ( ON-TABLE ?auto_151571 ) ( ON ?auto_151573 ?auto_151571 ) ( ON ?auto_151570 ?auto_151573 ) ( not ( = ?auto_151571 ?auto_151573 ) ) ( not ( = ?auto_151571 ?auto_151570 ) ) ( not ( = ?auto_151571 ?auto_151574 ) ) ( not ( = ?auto_151571 ?auto_151575 ) ) ( not ( = ?auto_151571 ?auto_151576 ) ) ( not ( = ?auto_151573 ?auto_151570 ) ) ( not ( = ?auto_151573 ?auto_151574 ) ) ( not ( = ?auto_151573 ?auto_151575 ) ) ( not ( = ?auto_151573 ?auto_151576 ) ) ( not ( = ?auto_151570 ?auto_151574 ) ) ( not ( = ?auto_151570 ?auto_151575 ) ) ( not ( = ?auto_151570 ?auto_151576 ) ) ( not ( = ?auto_151574 ?auto_151575 ) ) ( not ( = ?auto_151574 ?auto_151576 ) ) ( not ( = ?auto_151575 ?auto_151576 ) ) ( not ( = ?auto_151569 ?auto_151575 ) ) ( not ( = ?auto_151569 ?auto_151571 ) ) ( not ( = ?auto_151569 ?auto_151573 ) ) ( not ( = ?auto_151569 ?auto_151570 ) ) ( not ( = ?auto_151569 ?auto_151574 ) ) ( not ( = ?auto_151572 ?auto_151575 ) ) ( not ( = ?auto_151572 ?auto_151571 ) ) ( not ( = ?auto_151572 ?auto_151573 ) ) ( not ( = ?auto_151572 ?auto_151570 ) ) ( not ( = ?auto_151572 ?auto_151574 ) ) ( not ( = ?auto_151577 ?auto_151575 ) ) ( not ( = ?auto_151577 ?auto_151571 ) ) ( not ( = ?auto_151577 ?auto_151573 ) ) ( not ( = ?auto_151577 ?auto_151570 ) ) ( not ( = ?auto_151577 ?auto_151574 ) ) ( ON ?auto_151576 ?auto_151577 ) ( ON ?auto_151575 ?auto_151576 ) ( CLEAR ?auto_151575 ) ( HOLDING ?auto_151574 ) ( CLEAR ?auto_151570 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151571 ?auto_151573 ?auto_151570 ?auto_151574 )
      ( MAKE-1PILE ?auto_151569 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151578 - BLOCK
    )
    :vars
    (
      ?auto_151585 - BLOCK
      ?auto_151580 - BLOCK
      ?auto_151582 - BLOCK
      ?auto_151579 - BLOCK
      ?auto_151586 - BLOCK
      ?auto_151584 - BLOCK
      ?auto_151583 - BLOCK
      ?auto_151581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151585 ?auto_151578 ) ( ON-TABLE ?auto_151578 ) ( not ( = ?auto_151578 ?auto_151585 ) ) ( not ( = ?auto_151578 ?auto_151580 ) ) ( not ( = ?auto_151578 ?auto_151582 ) ) ( not ( = ?auto_151585 ?auto_151580 ) ) ( not ( = ?auto_151585 ?auto_151582 ) ) ( not ( = ?auto_151580 ?auto_151582 ) ) ( ON ?auto_151580 ?auto_151585 ) ( ON-TABLE ?auto_151579 ) ( ON ?auto_151586 ?auto_151579 ) ( ON ?auto_151584 ?auto_151586 ) ( not ( = ?auto_151579 ?auto_151586 ) ) ( not ( = ?auto_151579 ?auto_151584 ) ) ( not ( = ?auto_151579 ?auto_151583 ) ) ( not ( = ?auto_151579 ?auto_151581 ) ) ( not ( = ?auto_151579 ?auto_151582 ) ) ( not ( = ?auto_151586 ?auto_151584 ) ) ( not ( = ?auto_151586 ?auto_151583 ) ) ( not ( = ?auto_151586 ?auto_151581 ) ) ( not ( = ?auto_151586 ?auto_151582 ) ) ( not ( = ?auto_151584 ?auto_151583 ) ) ( not ( = ?auto_151584 ?auto_151581 ) ) ( not ( = ?auto_151584 ?auto_151582 ) ) ( not ( = ?auto_151583 ?auto_151581 ) ) ( not ( = ?auto_151583 ?auto_151582 ) ) ( not ( = ?auto_151581 ?auto_151582 ) ) ( not ( = ?auto_151578 ?auto_151581 ) ) ( not ( = ?auto_151578 ?auto_151579 ) ) ( not ( = ?auto_151578 ?auto_151586 ) ) ( not ( = ?auto_151578 ?auto_151584 ) ) ( not ( = ?auto_151578 ?auto_151583 ) ) ( not ( = ?auto_151585 ?auto_151581 ) ) ( not ( = ?auto_151585 ?auto_151579 ) ) ( not ( = ?auto_151585 ?auto_151586 ) ) ( not ( = ?auto_151585 ?auto_151584 ) ) ( not ( = ?auto_151585 ?auto_151583 ) ) ( not ( = ?auto_151580 ?auto_151581 ) ) ( not ( = ?auto_151580 ?auto_151579 ) ) ( not ( = ?auto_151580 ?auto_151586 ) ) ( not ( = ?auto_151580 ?auto_151584 ) ) ( not ( = ?auto_151580 ?auto_151583 ) ) ( ON ?auto_151582 ?auto_151580 ) ( ON ?auto_151581 ?auto_151582 ) ( CLEAR ?auto_151584 ) ( ON ?auto_151583 ?auto_151581 ) ( CLEAR ?auto_151583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151578 ?auto_151585 ?auto_151580 ?auto_151582 ?auto_151581 )
      ( MAKE-1PILE ?auto_151578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151587 - BLOCK
    )
    :vars
    (
      ?auto_151595 - BLOCK
      ?auto_151594 - BLOCK
      ?auto_151590 - BLOCK
      ?auto_151589 - BLOCK
      ?auto_151591 - BLOCK
      ?auto_151592 - BLOCK
      ?auto_151588 - BLOCK
      ?auto_151593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151595 ?auto_151587 ) ( ON-TABLE ?auto_151587 ) ( not ( = ?auto_151587 ?auto_151595 ) ) ( not ( = ?auto_151587 ?auto_151594 ) ) ( not ( = ?auto_151587 ?auto_151590 ) ) ( not ( = ?auto_151595 ?auto_151594 ) ) ( not ( = ?auto_151595 ?auto_151590 ) ) ( not ( = ?auto_151594 ?auto_151590 ) ) ( ON ?auto_151594 ?auto_151595 ) ( ON-TABLE ?auto_151589 ) ( ON ?auto_151591 ?auto_151589 ) ( not ( = ?auto_151589 ?auto_151591 ) ) ( not ( = ?auto_151589 ?auto_151592 ) ) ( not ( = ?auto_151589 ?auto_151588 ) ) ( not ( = ?auto_151589 ?auto_151593 ) ) ( not ( = ?auto_151589 ?auto_151590 ) ) ( not ( = ?auto_151591 ?auto_151592 ) ) ( not ( = ?auto_151591 ?auto_151588 ) ) ( not ( = ?auto_151591 ?auto_151593 ) ) ( not ( = ?auto_151591 ?auto_151590 ) ) ( not ( = ?auto_151592 ?auto_151588 ) ) ( not ( = ?auto_151592 ?auto_151593 ) ) ( not ( = ?auto_151592 ?auto_151590 ) ) ( not ( = ?auto_151588 ?auto_151593 ) ) ( not ( = ?auto_151588 ?auto_151590 ) ) ( not ( = ?auto_151593 ?auto_151590 ) ) ( not ( = ?auto_151587 ?auto_151593 ) ) ( not ( = ?auto_151587 ?auto_151589 ) ) ( not ( = ?auto_151587 ?auto_151591 ) ) ( not ( = ?auto_151587 ?auto_151592 ) ) ( not ( = ?auto_151587 ?auto_151588 ) ) ( not ( = ?auto_151595 ?auto_151593 ) ) ( not ( = ?auto_151595 ?auto_151589 ) ) ( not ( = ?auto_151595 ?auto_151591 ) ) ( not ( = ?auto_151595 ?auto_151592 ) ) ( not ( = ?auto_151595 ?auto_151588 ) ) ( not ( = ?auto_151594 ?auto_151593 ) ) ( not ( = ?auto_151594 ?auto_151589 ) ) ( not ( = ?auto_151594 ?auto_151591 ) ) ( not ( = ?auto_151594 ?auto_151592 ) ) ( not ( = ?auto_151594 ?auto_151588 ) ) ( ON ?auto_151590 ?auto_151594 ) ( ON ?auto_151593 ?auto_151590 ) ( ON ?auto_151588 ?auto_151593 ) ( CLEAR ?auto_151588 ) ( HOLDING ?auto_151592 ) ( CLEAR ?auto_151591 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151589 ?auto_151591 ?auto_151592 )
      ( MAKE-1PILE ?auto_151587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151596 - BLOCK
    )
    :vars
    (
      ?auto_151599 - BLOCK
      ?auto_151603 - BLOCK
      ?auto_151597 - BLOCK
      ?auto_151600 - BLOCK
      ?auto_151604 - BLOCK
      ?auto_151598 - BLOCK
      ?auto_151602 - BLOCK
      ?auto_151601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151599 ?auto_151596 ) ( ON-TABLE ?auto_151596 ) ( not ( = ?auto_151596 ?auto_151599 ) ) ( not ( = ?auto_151596 ?auto_151603 ) ) ( not ( = ?auto_151596 ?auto_151597 ) ) ( not ( = ?auto_151599 ?auto_151603 ) ) ( not ( = ?auto_151599 ?auto_151597 ) ) ( not ( = ?auto_151603 ?auto_151597 ) ) ( ON ?auto_151603 ?auto_151599 ) ( ON-TABLE ?auto_151600 ) ( ON ?auto_151604 ?auto_151600 ) ( not ( = ?auto_151600 ?auto_151604 ) ) ( not ( = ?auto_151600 ?auto_151598 ) ) ( not ( = ?auto_151600 ?auto_151602 ) ) ( not ( = ?auto_151600 ?auto_151601 ) ) ( not ( = ?auto_151600 ?auto_151597 ) ) ( not ( = ?auto_151604 ?auto_151598 ) ) ( not ( = ?auto_151604 ?auto_151602 ) ) ( not ( = ?auto_151604 ?auto_151601 ) ) ( not ( = ?auto_151604 ?auto_151597 ) ) ( not ( = ?auto_151598 ?auto_151602 ) ) ( not ( = ?auto_151598 ?auto_151601 ) ) ( not ( = ?auto_151598 ?auto_151597 ) ) ( not ( = ?auto_151602 ?auto_151601 ) ) ( not ( = ?auto_151602 ?auto_151597 ) ) ( not ( = ?auto_151601 ?auto_151597 ) ) ( not ( = ?auto_151596 ?auto_151601 ) ) ( not ( = ?auto_151596 ?auto_151600 ) ) ( not ( = ?auto_151596 ?auto_151604 ) ) ( not ( = ?auto_151596 ?auto_151598 ) ) ( not ( = ?auto_151596 ?auto_151602 ) ) ( not ( = ?auto_151599 ?auto_151601 ) ) ( not ( = ?auto_151599 ?auto_151600 ) ) ( not ( = ?auto_151599 ?auto_151604 ) ) ( not ( = ?auto_151599 ?auto_151598 ) ) ( not ( = ?auto_151599 ?auto_151602 ) ) ( not ( = ?auto_151603 ?auto_151601 ) ) ( not ( = ?auto_151603 ?auto_151600 ) ) ( not ( = ?auto_151603 ?auto_151604 ) ) ( not ( = ?auto_151603 ?auto_151598 ) ) ( not ( = ?auto_151603 ?auto_151602 ) ) ( ON ?auto_151597 ?auto_151603 ) ( ON ?auto_151601 ?auto_151597 ) ( ON ?auto_151602 ?auto_151601 ) ( CLEAR ?auto_151604 ) ( ON ?auto_151598 ?auto_151602 ) ( CLEAR ?auto_151598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151596 ?auto_151599 ?auto_151603 ?auto_151597 ?auto_151601 ?auto_151602 )
      ( MAKE-1PILE ?auto_151596 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151605 - BLOCK
    )
    :vars
    (
      ?auto_151607 - BLOCK
      ?auto_151608 - BLOCK
      ?auto_151610 - BLOCK
      ?auto_151612 - BLOCK
      ?auto_151606 - BLOCK
      ?auto_151613 - BLOCK
      ?auto_151609 - BLOCK
      ?auto_151611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151607 ?auto_151605 ) ( ON-TABLE ?auto_151605 ) ( not ( = ?auto_151605 ?auto_151607 ) ) ( not ( = ?auto_151605 ?auto_151608 ) ) ( not ( = ?auto_151605 ?auto_151610 ) ) ( not ( = ?auto_151607 ?auto_151608 ) ) ( not ( = ?auto_151607 ?auto_151610 ) ) ( not ( = ?auto_151608 ?auto_151610 ) ) ( ON ?auto_151608 ?auto_151607 ) ( ON-TABLE ?auto_151612 ) ( not ( = ?auto_151612 ?auto_151606 ) ) ( not ( = ?auto_151612 ?auto_151613 ) ) ( not ( = ?auto_151612 ?auto_151609 ) ) ( not ( = ?auto_151612 ?auto_151611 ) ) ( not ( = ?auto_151612 ?auto_151610 ) ) ( not ( = ?auto_151606 ?auto_151613 ) ) ( not ( = ?auto_151606 ?auto_151609 ) ) ( not ( = ?auto_151606 ?auto_151611 ) ) ( not ( = ?auto_151606 ?auto_151610 ) ) ( not ( = ?auto_151613 ?auto_151609 ) ) ( not ( = ?auto_151613 ?auto_151611 ) ) ( not ( = ?auto_151613 ?auto_151610 ) ) ( not ( = ?auto_151609 ?auto_151611 ) ) ( not ( = ?auto_151609 ?auto_151610 ) ) ( not ( = ?auto_151611 ?auto_151610 ) ) ( not ( = ?auto_151605 ?auto_151611 ) ) ( not ( = ?auto_151605 ?auto_151612 ) ) ( not ( = ?auto_151605 ?auto_151606 ) ) ( not ( = ?auto_151605 ?auto_151613 ) ) ( not ( = ?auto_151605 ?auto_151609 ) ) ( not ( = ?auto_151607 ?auto_151611 ) ) ( not ( = ?auto_151607 ?auto_151612 ) ) ( not ( = ?auto_151607 ?auto_151606 ) ) ( not ( = ?auto_151607 ?auto_151613 ) ) ( not ( = ?auto_151607 ?auto_151609 ) ) ( not ( = ?auto_151608 ?auto_151611 ) ) ( not ( = ?auto_151608 ?auto_151612 ) ) ( not ( = ?auto_151608 ?auto_151606 ) ) ( not ( = ?auto_151608 ?auto_151613 ) ) ( not ( = ?auto_151608 ?auto_151609 ) ) ( ON ?auto_151610 ?auto_151608 ) ( ON ?auto_151611 ?auto_151610 ) ( ON ?auto_151609 ?auto_151611 ) ( ON ?auto_151613 ?auto_151609 ) ( CLEAR ?auto_151613 ) ( HOLDING ?auto_151606 ) ( CLEAR ?auto_151612 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151612 ?auto_151606 )
      ( MAKE-1PILE ?auto_151605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153784 - BLOCK
    )
    :vars
    (
      ?auto_153787 - BLOCK
      ?auto_153785 - BLOCK
      ?auto_153791 - BLOCK
      ?auto_153786 - BLOCK
      ?auto_153788 - BLOCK
      ?auto_153790 - BLOCK
      ?auto_153789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153787 ?auto_153784 ) ( ON-TABLE ?auto_153784 ) ( not ( = ?auto_153784 ?auto_153787 ) ) ( not ( = ?auto_153784 ?auto_153785 ) ) ( not ( = ?auto_153784 ?auto_153791 ) ) ( not ( = ?auto_153787 ?auto_153785 ) ) ( not ( = ?auto_153787 ?auto_153791 ) ) ( not ( = ?auto_153785 ?auto_153791 ) ) ( ON ?auto_153785 ?auto_153787 ) ( not ( = ?auto_153786 ?auto_153788 ) ) ( not ( = ?auto_153786 ?auto_153790 ) ) ( not ( = ?auto_153786 ?auto_153789 ) ) ( not ( = ?auto_153786 ?auto_153791 ) ) ( not ( = ?auto_153788 ?auto_153790 ) ) ( not ( = ?auto_153788 ?auto_153789 ) ) ( not ( = ?auto_153788 ?auto_153791 ) ) ( not ( = ?auto_153790 ?auto_153789 ) ) ( not ( = ?auto_153790 ?auto_153791 ) ) ( not ( = ?auto_153789 ?auto_153791 ) ) ( not ( = ?auto_153784 ?auto_153789 ) ) ( not ( = ?auto_153784 ?auto_153786 ) ) ( not ( = ?auto_153784 ?auto_153788 ) ) ( not ( = ?auto_153784 ?auto_153790 ) ) ( not ( = ?auto_153787 ?auto_153789 ) ) ( not ( = ?auto_153787 ?auto_153786 ) ) ( not ( = ?auto_153787 ?auto_153788 ) ) ( not ( = ?auto_153787 ?auto_153790 ) ) ( not ( = ?auto_153785 ?auto_153789 ) ) ( not ( = ?auto_153785 ?auto_153786 ) ) ( not ( = ?auto_153785 ?auto_153788 ) ) ( not ( = ?auto_153785 ?auto_153790 ) ) ( ON ?auto_153791 ?auto_153785 ) ( ON ?auto_153789 ?auto_153791 ) ( ON ?auto_153790 ?auto_153789 ) ( ON ?auto_153788 ?auto_153790 ) ( ON ?auto_153786 ?auto_153788 ) ( CLEAR ?auto_153786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153784 ?auto_153787 ?auto_153785 ?auto_153791 ?auto_153789 ?auto_153790 ?auto_153788 )
      ( MAKE-1PILE ?auto_153784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151623 - BLOCK
    )
    :vars
    (
      ?auto_151624 - BLOCK
      ?auto_151626 - BLOCK
      ?auto_151629 - BLOCK
      ?auto_151627 - BLOCK
      ?auto_151628 - BLOCK
      ?auto_151625 - BLOCK
      ?auto_151630 - BLOCK
      ?auto_151631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151624 ?auto_151623 ) ( ON-TABLE ?auto_151623 ) ( not ( = ?auto_151623 ?auto_151624 ) ) ( not ( = ?auto_151623 ?auto_151626 ) ) ( not ( = ?auto_151623 ?auto_151629 ) ) ( not ( = ?auto_151624 ?auto_151626 ) ) ( not ( = ?auto_151624 ?auto_151629 ) ) ( not ( = ?auto_151626 ?auto_151629 ) ) ( ON ?auto_151626 ?auto_151624 ) ( not ( = ?auto_151627 ?auto_151628 ) ) ( not ( = ?auto_151627 ?auto_151625 ) ) ( not ( = ?auto_151627 ?auto_151630 ) ) ( not ( = ?auto_151627 ?auto_151631 ) ) ( not ( = ?auto_151627 ?auto_151629 ) ) ( not ( = ?auto_151628 ?auto_151625 ) ) ( not ( = ?auto_151628 ?auto_151630 ) ) ( not ( = ?auto_151628 ?auto_151631 ) ) ( not ( = ?auto_151628 ?auto_151629 ) ) ( not ( = ?auto_151625 ?auto_151630 ) ) ( not ( = ?auto_151625 ?auto_151631 ) ) ( not ( = ?auto_151625 ?auto_151629 ) ) ( not ( = ?auto_151630 ?auto_151631 ) ) ( not ( = ?auto_151630 ?auto_151629 ) ) ( not ( = ?auto_151631 ?auto_151629 ) ) ( not ( = ?auto_151623 ?auto_151631 ) ) ( not ( = ?auto_151623 ?auto_151627 ) ) ( not ( = ?auto_151623 ?auto_151628 ) ) ( not ( = ?auto_151623 ?auto_151625 ) ) ( not ( = ?auto_151623 ?auto_151630 ) ) ( not ( = ?auto_151624 ?auto_151631 ) ) ( not ( = ?auto_151624 ?auto_151627 ) ) ( not ( = ?auto_151624 ?auto_151628 ) ) ( not ( = ?auto_151624 ?auto_151625 ) ) ( not ( = ?auto_151624 ?auto_151630 ) ) ( not ( = ?auto_151626 ?auto_151631 ) ) ( not ( = ?auto_151626 ?auto_151627 ) ) ( not ( = ?auto_151626 ?auto_151628 ) ) ( not ( = ?auto_151626 ?auto_151625 ) ) ( not ( = ?auto_151626 ?auto_151630 ) ) ( ON ?auto_151629 ?auto_151626 ) ( ON ?auto_151631 ?auto_151629 ) ( ON ?auto_151630 ?auto_151631 ) ( ON ?auto_151625 ?auto_151630 ) ( ON ?auto_151628 ?auto_151625 ) ( CLEAR ?auto_151628 ) ( HOLDING ?auto_151627 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151627 )
      ( MAKE-1PILE ?auto_151623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151632 - BLOCK
    )
    :vars
    (
      ?auto_151633 - BLOCK
      ?auto_151636 - BLOCK
      ?auto_151635 - BLOCK
      ?auto_151634 - BLOCK
      ?auto_151640 - BLOCK
      ?auto_151637 - BLOCK
      ?auto_151639 - BLOCK
      ?auto_151638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151633 ?auto_151632 ) ( ON-TABLE ?auto_151632 ) ( not ( = ?auto_151632 ?auto_151633 ) ) ( not ( = ?auto_151632 ?auto_151636 ) ) ( not ( = ?auto_151632 ?auto_151635 ) ) ( not ( = ?auto_151633 ?auto_151636 ) ) ( not ( = ?auto_151633 ?auto_151635 ) ) ( not ( = ?auto_151636 ?auto_151635 ) ) ( ON ?auto_151636 ?auto_151633 ) ( not ( = ?auto_151634 ?auto_151640 ) ) ( not ( = ?auto_151634 ?auto_151637 ) ) ( not ( = ?auto_151634 ?auto_151639 ) ) ( not ( = ?auto_151634 ?auto_151638 ) ) ( not ( = ?auto_151634 ?auto_151635 ) ) ( not ( = ?auto_151640 ?auto_151637 ) ) ( not ( = ?auto_151640 ?auto_151639 ) ) ( not ( = ?auto_151640 ?auto_151638 ) ) ( not ( = ?auto_151640 ?auto_151635 ) ) ( not ( = ?auto_151637 ?auto_151639 ) ) ( not ( = ?auto_151637 ?auto_151638 ) ) ( not ( = ?auto_151637 ?auto_151635 ) ) ( not ( = ?auto_151639 ?auto_151638 ) ) ( not ( = ?auto_151639 ?auto_151635 ) ) ( not ( = ?auto_151638 ?auto_151635 ) ) ( not ( = ?auto_151632 ?auto_151638 ) ) ( not ( = ?auto_151632 ?auto_151634 ) ) ( not ( = ?auto_151632 ?auto_151640 ) ) ( not ( = ?auto_151632 ?auto_151637 ) ) ( not ( = ?auto_151632 ?auto_151639 ) ) ( not ( = ?auto_151633 ?auto_151638 ) ) ( not ( = ?auto_151633 ?auto_151634 ) ) ( not ( = ?auto_151633 ?auto_151640 ) ) ( not ( = ?auto_151633 ?auto_151637 ) ) ( not ( = ?auto_151633 ?auto_151639 ) ) ( not ( = ?auto_151636 ?auto_151638 ) ) ( not ( = ?auto_151636 ?auto_151634 ) ) ( not ( = ?auto_151636 ?auto_151640 ) ) ( not ( = ?auto_151636 ?auto_151637 ) ) ( not ( = ?auto_151636 ?auto_151639 ) ) ( ON ?auto_151635 ?auto_151636 ) ( ON ?auto_151638 ?auto_151635 ) ( ON ?auto_151639 ?auto_151638 ) ( ON ?auto_151637 ?auto_151639 ) ( ON ?auto_151640 ?auto_151637 ) ( ON ?auto_151634 ?auto_151640 ) ( CLEAR ?auto_151634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151632 ?auto_151633 ?auto_151636 ?auto_151635 ?auto_151638 ?auto_151639 ?auto_151637 ?auto_151640 )
      ( MAKE-1PILE ?auto_151632 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151649 - BLOCK
      ?auto_151650 - BLOCK
      ?auto_151651 - BLOCK
      ?auto_151652 - BLOCK
      ?auto_151653 - BLOCK
      ?auto_151654 - BLOCK
      ?auto_151655 - BLOCK
      ?auto_151656 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_151656 ) ( CLEAR ?auto_151655 ) ( ON-TABLE ?auto_151649 ) ( ON ?auto_151650 ?auto_151649 ) ( ON ?auto_151651 ?auto_151650 ) ( ON ?auto_151652 ?auto_151651 ) ( ON ?auto_151653 ?auto_151652 ) ( ON ?auto_151654 ?auto_151653 ) ( ON ?auto_151655 ?auto_151654 ) ( not ( = ?auto_151649 ?auto_151650 ) ) ( not ( = ?auto_151649 ?auto_151651 ) ) ( not ( = ?auto_151649 ?auto_151652 ) ) ( not ( = ?auto_151649 ?auto_151653 ) ) ( not ( = ?auto_151649 ?auto_151654 ) ) ( not ( = ?auto_151649 ?auto_151655 ) ) ( not ( = ?auto_151649 ?auto_151656 ) ) ( not ( = ?auto_151650 ?auto_151651 ) ) ( not ( = ?auto_151650 ?auto_151652 ) ) ( not ( = ?auto_151650 ?auto_151653 ) ) ( not ( = ?auto_151650 ?auto_151654 ) ) ( not ( = ?auto_151650 ?auto_151655 ) ) ( not ( = ?auto_151650 ?auto_151656 ) ) ( not ( = ?auto_151651 ?auto_151652 ) ) ( not ( = ?auto_151651 ?auto_151653 ) ) ( not ( = ?auto_151651 ?auto_151654 ) ) ( not ( = ?auto_151651 ?auto_151655 ) ) ( not ( = ?auto_151651 ?auto_151656 ) ) ( not ( = ?auto_151652 ?auto_151653 ) ) ( not ( = ?auto_151652 ?auto_151654 ) ) ( not ( = ?auto_151652 ?auto_151655 ) ) ( not ( = ?auto_151652 ?auto_151656 ) ) ( not ( = ?auto_151653 ?auto_151654 ) ) ( not ( = ?auto_151653 ?auto_151655 ) ) ( not ( = ?auto_151653 ?auto_151656 ) ) ( not ( = ?auto_151654 ?auto_151655 ) ) ( not ( = ?auto_151654 ?auto_151656 ) ) ( not ( = ?auto_151655 ?auto_151656 ) ) )
    :subtasks
    ( ( !STACK ?auto_151656 ?auto_151655 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151657 - BLOCK
      ?auto_151658 - BLOCK
      ?auto_151659 - BLOCK
      ?auto_151660 - BLOCK
      ?auto_151661 - BLOCK
      ?auto_151662 - BLOCK
      ?auto_151663 - BLOCK
      ?auto_151664 - BLOCK
    )
    :vars
    (
      ?auto_151665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_151663 ) ( ON-TABLE ?auto_151657 ) ( ON ?auto_151658 ?auto_151657 ) ( ON ?auto_151659 ?auto_151658 ) ( ON ?auto_151660 ?auto_151659 ) ( ON ?auto_151661 ?auto_151660 ) ( ON ?auto_151662 ?auto_151661 ) ( ON ?auto_151663 ?auto_151662 ) ( not ( = ?auto_151657 ?auto_151658 ) ) ( not ( = ?auto_151657 ?auto_151659 ) ) ( not ( = ?auto_151657 ?auto_151660 ) ) ( not ( = ?auto_151657 ?auto_151661 ) ) ( not ( = ?auto_151657 ?auto_151662 ) ) ( not ( = ?auto_151657 ?auto_151663 ) ) ( not ( = ?auto_151657 ?auto_151664 ) ) ( not ( = ?auto_151658 ?auto_151659 ) ) ( not ( = ?auto_151658 ?auto_151660 ) ) ( not ( = ?auto_151658 ?auto_151661 ) ) ( not ( = ?auto_151658 ?auto_151662 ) ) ( not ( = ?auto_151658 ?auto_151663 ) ) ( not ( = ?auto_151658 ?auto_151664 ) ) ( not ( = ?auto_151659 ?auto_151660 ) ) ( not ( = ?auto_151659 ?auto_151661 ) ) ( not ( = ?auto_151659 ?auto_151662 ) ) ( not ( = ?auto_151659 ?auto_151663 ) ) ( not ( = ?auto_151659 ?auto_151664 ) ) ( not ( = ?auto_151660 ?auto_151661 ) ) ( not ( = ?auto_151660 ?auto_151662 ) ) ( not ( = ?auto_151660 ?auto_151663 ) ) ( not ( = ?auto_151660 ?auto_151664 ) ) ( not ( = ?auto_151661 ?auto_151662 ) ) ( not ( = ?auto_151661 ?auto_151663 ) ) ( not ( = ?auto_151661 ?auto_151664 ) ) ( not ( = ?auto_151662 ?auto_151663 ) ) ( not ( = ?auto_151662 ?auto_151664 ) ) ( not ( = ?auto_151663 ?auto_151664 ) ) ( ON ?auto_151664 ?auto_151665 ) ( CLEAR ?auto_151664 ) ( HAND-EMPTY ) ( not ( = ?auto_151657 ?auto_151665 ) ) ( not ( = ?auto_151658 ?auto_151665 ) ) ( not ( = ?auto_151659 ?auto_151665 ) ) ( not ( = ?auto_151660 ?auto_151665 ) ) ( not ( = ?auto_151661 ?auto_151665 ) ) ( not ( = ?auto_151662 ?auto_151665 ) ) ( not ( = ?auto_151663 ?auto_151665 ) ) ( not ( = ?auto_151664 ?auto_151665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_151664 ?auto_151665 )
      ( MAKE-8PILE ?auto_151657 ?auto_151658 ?auto_151659 ?auto_151660 ?auto_151661 ?auto_151662 ?auto_151663 ?auto_151664 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151666 - BLOCK
      ?auto_151667 - BLOCK
      ?auto_151668 - BLOCK
      ?auto_151669 - BLOCK
      ?auto_151670 - BLOCK
      ?auto_151671 - BLOCK
      ?auto_151672 - BLOCK
      ?auto_151673 - BLOCK
    )
    :vars
    (
      ?auto_151674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151666 ) ( ON ?auto_151667 ?auto_151666 ) ( ON ?auto_151668 ?auto_151667 ) ( ON ?auto_151669 ?auto_151668 ) ( ON ?auto_151670 ?auto_151669 ) ( ON ?auto_151671 ?auto_151670 ) ( not ( = ?auto_151666 ?auto_151667 ) ) ( not ( = ?auto_151666 ?auto_151668 ) ) ( not ( = ?auto_151666 ?auto_151669 ) ) ( not ( = ?auto_151666 ?auto_151670 ) ) ( not ( = ?auto_151666 ?auto_151671 ) ) ( not ( = ?auto_151666 ?auto_151672 ) ) ( not ( = ?auto_151666 ?auto_151673 ) ) ( not ( = ?auto_151667 ?auto_151668 ) ) ( not ( = ?auto_151667 ?auto_151669 ) ) ( not ( = ?auto_151667 ?auto_151670 ) ) ( not ( = ?auto_151667 ?auto_151671 ) ) ( not ( = ?auto_151667 ?auto_151672 ) ) ( not ( = ?auto_151667 ?auto_151673 ) ) ( not ( = ?auto_151668 ?auto_151669 ) ) ( not ( = ?auto_151668 ?auto_151670 ) ) ( not ( = ?auto_151668 ?auto_151671 ) ) ( not ( = ?auto_151668 ?auto_151672 ) ) ( not ( = ?auto_151668 ?auto_151673 ) ) ( not ( = ?auto_151669 ?auto_151670 ) ) ( not ( = ?auto_151669 ?auto_151671 ) ) ( not ( = ?auto_151669 ?auto_151672 ) ) ( not ( = ?auto_151669 ?auto_151673 ) ) ( not ( = ?auto_151670 ?auto_151671 ) ) ( not ( = ?auto_151670 ?auto_151672 ) ) ( not ( = ?auto_151670 ?auto_151673 ) ) ( not ( = ?auto_151671 ?auto_151672 ) ) ( not ( = ?auto_151671 ?auto_151673 ) ) ( not ( = ?auto_151672 ?auto_151673 ) ) ( ON ?auto_151673 ?auto_151674 ) ( CLEAR ?auto_151673 ) ( not ( = ?auto_151666 ?auto_151674 ) ) ( not ( = ?auto_151667 ?auto_151674 ) ) ( not ( = ?auto_151668 ?auto_151674 ) ) ( not ( = ?auto_151669 ?auto_151674 ) ) ( not ( = ?auto_151670 ?auto_151674 ) ) ( not ( = ?auto_151671 ?auto_151674 ) ) ( not ( = ?auto_151672 ?auto_151674 ) ) ( not ( = ?auto_151673 ?auto_151674 ) ) ( HOLDING ?auto_151672 ) ( CLEAR ?auto_151671 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151666 ?auto_151667 ?auto_151668 ?auto_151669 ?auto_151670 ?auto_151671 ?auto_151672 )
      ( MAKE-8PILE ?auto_151666 ?auto_151667 ?auto_151668 ?auto_151669 ?auto_151670 ?auto_151671 ?auto_151672 ?auto_151673 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151675 - BLOCK
      ?auto_151676 - BLOCK
      ?auto_151677 - BLOCK
      ?auto_151678 - BLOCK
      ?auto_151679 - BLOCK
      ?auto_151680 - BLOCK
      ?auto_151681 - BLOCK
      ?auto_151682 - BLOCK
    )
    :vars
    (
      ?auto_151683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151675 ) ( ON ?auto_151676 ?auto_151675 ) ( ON ?auto_151677 ?auto_151676 ) ( ON ?auto_151678 ?auto_151677 ) ( ON ?auto_151679 ?auto_151678 ) ( ON ?auto_151680 ?auto_151679 ) ( not ( = ?auto_151675 ?auto_151676 ) ) ( not ( = ?auto_151675 ?auto_151677 ) ) ( not ( = ?auto_151675 ?auto_151678 ) ) ( not ( = ?auto_151675 ?auto_151679 ) ) ( not ( = ?auto_151675 ?auto_151680 ) ) ( not ( = ?auto_151675 ?auto_151681 ) ) ( not ( = ?auto_151675 ?auto_151682 ) ) ( not ( = ?auto_151676 ?auto_151677 ) ) ( not ( = ?auto_151676 ?auto_151678 ) ) ( not ( = ?auto_151676 ?auto_151679 ) ) ( not ( = ?auto_151676 ?auto_151680 ) ) ( not ( = ?auto_151676 ?auto_151681 ) ) ( not ( = ?auto_151676 ?auto_151682 ) ) ( not ( = ?auto_151677 ?auto_151678 ) ) ( not ( = ?auto_151677 ?auto_151679 ) ) ( not ( = ?auto_151677 ?auto_151680 ) ) ( not ( = ?auto_151677 ?auto_151681 ) ) ( not ( = ?auto_151677 ?auto_151682 ) ) ( not ( = ?auto_151678 ?auto_151679 ) ) ( not ( = ?auto_151678 ?auto_151680 ) ) ( not ( = ?auto_151678 ?auto_151681 ) ) ( not ( = ?auto_151678 ?auto_151682 ) ) ( not ( = ?auto_151679 ?auto_151680 ) ) ( not ( = ?auto_151679 ?auto_151681 ) ) ( not ( = ?auto_151679 ?auto_151682 ) ) ( not ( = ?auto_151680 ?auto_151681 ) ) ( not ( = ?auto_151680 ?auto_151682 ) ) ( not ( = ?auto_151681 ?auto_151682 ) ) ( ON ?auto_151682 ?auto_151683 ) ( not ( = ?auto_151675 ?auto_151683 ) ) ( not ( = ?auto_151676 ?auto_151683 ) ) ( not ( = ?auto_151677 ?auto_151683 ) ) ( not ( = ?auto_151678 ?auto_151683 ) ) ( not ( = ?auto_151679 ?auto_151683 ) ) ( not ( = ?auto_151680 ?auto_151683 ) ) ( not ( = ?auto_151681 ?auto_151683 ) ) ( not ( = ?auto_151682 ?auto_151683 ) ) ( CLEAR ?auto_151680 ) ( ON ?auto_151681 ?auto_151682 ) ( CLEAR ?auto_151681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151683 ?auto_151682 )
      ( MAKE-8PILE ?auto_151675 ?auto_151676 ?auto_151677 ?auto_151678 ?auto_151679 ?auto_151680 ?auto_151681 ?auto_151682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151684 - BLOCK
      ?auto_151685 - BLOCK
      ?auto_151686 - BLOCK
      ?auto_151687 - BLOCK
      ?auto_151688 - BLOCK
      ?auto_151689 - BLOCK
      ?auto_151690 - BLOCK
      ?auto_151691 - BLOCK
    )
    :vars
    (
      ?auto_151692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151684 ) ( ON ?auto_151685 ?auto_151684 ) ( ON ?auto_151686 ?auto_151685 ) ( ON ?auto_151687 ?auto_151686 ) ( ON ?auto_151688 ?auto_151687 ) ( not ( = ?auto_151684 ?auto_151685 ) ) ( not ( = ?auto_151684 ?auto_151686 ) ) ( not ( = ?auto_151684 ?auto_151687 ) ) ( not ( = ?auto_151684 ?auto_151688 ) ) ( not ( = ?auto_151684 ?auto_151689 ) ) ( not ( = ?auto_151684 ?auto_151690 ) ) ( not ( = ?auto_151684 ?auto_151691 ) ) ( not ( = ?auto_151685 ?auto_151686 ) ) ( not ( = ?auto_151685 ?auto_151687 ) ) ( not ( = ?auto_151685 ?auto_151688 ) ) ( not ( = ?auto_151685 ?auto_151689 ) ) ( not ( = ?auto_151685 ?auto_151690 ) ) ( not ( = ?auto_151685 ?auto_151691 ) ) ( not ( = ?auto_151686 ?auto_151687 ) ) ( not ( = ?auto_151686 ?auto_151688 ) ) ( not ( = ?auto_151686 ?auto_151689 ) ) ( not ( = ?auto_151686 ?auto_151690 ) ) ( not ( = ?auto_151686 ?auto_151691 ) ) ( not ( = ?auto_151687 ?auto_151688 ) ) ( not ( = ?auto_151687 ?auto_151689 ) ) ( not ( = ?auto_151687 ?auto_151690 ) ) ( not ( = ?auto_151687 ?auto_151691 ) ) ( not ( = ?auto_151688 ?auto_151689 ) ) ( not ( = ?auto_151688 ?auto_151690 ) ) ( not ( = ?auto_151688 ?auto_151691 ) ) ( not ( = ?auto_151689 ?auto_151690 ) ) ( not ( = ?auto_151689 ?auto_151691 ) ) ( not ( = ?auto_151690 ?auto_151691 ) ) ( ON ?auto_151691 ?auto_151692 ) ( not ( = ?auto_151684 ?auto_151692 ) ) ( not ( = ?auto_151685 ?auto_151692 ) ) ( not ( = ?auto_151686 ?auto_151692 ) ) ( not ( = ?auto_151687 ?auto_151692 ) ) ( not ( = ?auto_151688 ?auto_151692 ) ) ( not ( = ?auto_151689 ?auto_151692 ) ) ( not ( = ?auto_151690 ?auto_151692 ) ) ( not ( = ?auto_151691 ?auto_151692 ) ) ( ON ?auto_151690 ?auto_151691 ) ( CLEAR ?auto_151690 ) ( ON-TABLE ?auto_151692 ) ( HOLDING ?auto_151689 ) ( CLEAR ?auto_151688 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151684 ?auto_151685 ?auto_151686 ?auto_151687 ?auto_151688 ?auto_151689 )
      ( MAKE-8PILE ?auto_151684 ?auto_151685 ?auto_151686 ?auto_151687 ?auto_151688 ?auto_151689 ?auto_151690 ?auto_151691 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151693 - BLOCK
      ?auto_151694 - BLOCK
      ?auto_151695 - BLOCK
      ?auto_151696 - BLOCK
      ?auto_151697 - BLOCK
      ?auto_151698 - BLOCK
      ?auto_151699 - BLOCK
      ?auto_151700 - BLOCK
    )
    :vars
    (
      ?auto_151701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151693 ) ( ON ?auto_151694 ?auto_151693 ) ( ON ?auto_151695 ?auto_151694 ) ( ON ?auto_151696 ?auto_151695 ) ( ON ?auto_151697 ?auto_151696 ) ( not ( = ?auto_151693 ?auto_151694 ) ) ( not ( = ?auto_151693 ?auto_151695 ) ) ( not ( = ?auto_151693 ?auto_151696 ) ) ( not ( = ?auto_151693 ?auto_151697 ) ) ( not ( = ?auto_151693 ?auto_151698 ) ) ( not ( = ?auto_151693 ?auto_151699 ) ) ( not ( = ?auto_151693 ?auto_151700 ) ) ( not ( = ?auto_151694 ?auto_151695 ) ) ( not ( = ?auto_151694 ?auto_151696 ) ) ( not ( = ?auto_151694 ?auto_151697 ) ) ( not ( = ?auto_151694 ?auto_151698 ) ) ( not ( = ?auto_151694 ?auto_151699 ) ) ( not ( = ?auto_151694 ?auto_151700 ) ) ( not ( = ?auto_151695 ?auto_151696 ) ) ( not ( = ?auto_151695 ?auto_151697 ) ) ( not ( = ?auto_151695 ?auto_151698 ) ) ( not ( = ?auto_151695 ?auto_151699 ) ) ( not ( = ?auto_151695 ?auto_151700 ) ) ( not ( = ?auto_151696 ?auto_151697 ) ) ( not ( = ?auto_151696 ?auto_151698 ) ) ( not ( = ?auto_151696 ?auto_151699 ) ) ( not ( = ?auto_151696 ?auto_151700 ) ) ( not ( = ?auto_151697 ?auto_151698 ) ) ( not ( = ?auto_151697 ?auto_151699 ) ) ( not ( = ?auto_151697 ?auto_151700 ) ) ( not ( = ?auto_151698 ?auto_151699 ) ) ( not ( = ?auto_151698 ?auto_151700 ) ) ( not ( = ?auto_151699 ?auto_151700 ) ) ( ON ?auto_151700 ?auto_151701 ) ( not ( = ?auto_151693 ?auto_151701 ) ) ( not ( = ?auto_151694 ?auto_151701 ) ) ( not ( = ?auto_151695 ?auto_151701 ) ) ( not ( = ?auto_151696 ?auto_151701 ) ) ( not ( = ?auto_151697 ?auto_151701 ) ) ( not ( = ?auto_151698 ?auto_151701 ) ) ( not ( = ?auto_151699 ?auto_151701 ) ) ( not ( = ?auto_151700 ?auto_151701 ) ) ( ON ?auto_151699 ?auto_151700 ) ( ON-TABLE ?auto_151701 ) ( CLEAR ?auto_151697 ) ( ON ?auto_151698 ?auto_151699 ) ( CLEAR ?auto_151698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151701 ?auto_151700 ?auto_151699 )
      ( MAKE-8PILE ?auto_151693 ?auto_151694 ?auto_151695 ?auto_151696 ?auto_151697 ?auto_151698 ?auto_151699 ?auto_151700 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151702 - BLOCK
      ?auto_151703 - BLOCK
      ?auto_151704 - BLOCK
      ?auto_151705 - BLOCK
      ?auto_151706 - BLOCK
      ?auto_151707 - BLOCK
      ?auto_151708 - BLOCK
      ?auto_151709 - BLOCK
    )
    :vars
    (
      ?auto_151710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151702 ) ( ON ?auto_151703 ?auto_151702 ) ( ON ?auto_151704 ?auto_151703 ) ( ON ?auto_151705 ?auto_151704 ) ( not ( = ?auto_151702 ?auto_151703 ) ) ( not ( = ?auto_151702 ?auto_151704 ) ) ( not ( = ?auto_151702 ?auto_151705 ) ) ( not ( = ?auto_151702 ?auto_151706 ) ) ( not ( = ?auto_151702 ?auto_151707 ) ) ( not ( = ?auto_151702 ?auto_151708 ) ) ( not ( = ?auto_151702 ?auto_151709 ) ) ( not ( = ?auto_151703 ?auto_151704 ) ) ( not ( = ?auto_151703 ?auto_151705 ) ) ( not ( = ?auto_151703 ?auto_151706 ) ) ( not ( = ?auto_151703 ?auto_151707 ) ) ( not ( = ?auto_151703 ?auto_151708 ) ) ( not ( = ?auto_151703 ?auto_151709 ) ) ( not ( = ?auto_151704 ?auto_151705 ) ) ( not ( = ?auto_151704 ?auto_151706 ) ) ( not ( = ?auto_151704 ?auto_151707 ) ) ( not ( = ?auto_151704 ?auto_151708 ) ) ( not ( = ?auto_151704 ?auto_151709 ) ) ( not ( = ?auto_151705 ?auto_151706 ) ) ( not ( = ?auto_151705 ?auto_151707 ) ) ( not ( = ?auto_151705 ?auto_151708 ) ) ( not ( = ?auto_151705 ?auto_151709 ) ) ( not ( = ?auto_151706 ?auto_151707 ) ) ( not ( = ?auto_151706 ?auto_151708 ) ) ( not ( = ?auto_151706 ?auto_151709 ) ) ( not ( = ?auto_151707 ?auto_151708 ) ) ( not ( = ?auto_151707 ?auto_151709 ) ) ( not ( = ?auto_151708 ?auto_151709 ) ) ( ON ?auto_151709 ?auto_151710 ) ( not ( = ?auto_151702 ?auto_151710 ) ) ( not ( = ?auto_151703 ?auto_151710 ) ) ( not ( = ?auto_151704 ?auto_151710 ) ) ( not ( = ?auto_151705 ?auto_151710 ) ) ( not ( = ?auto_151706 ?auto_151710 ) ) ( not ( = ?auto_151707 ?auto_151710 ) ) ( not ( = ?auto_151708 ?auto_151710 ) ) ( not ( = ?auto_151709 ?auto_151710 ) ) ( ON ?auto_151708 ?auto_151709 ) ( ON-TABLE ?auto_151710 ) ( ON ?auto_151707 ?auto_151708 ) ( CLEAR ?auto_151707 ) ( HOLDING ?auto_151706 ) ( CLEAR ?auto_151705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151702 ?auto_151703 ?auto_151704 ?auto_151705 ?auto_151706 )
      ( MAKE-8PILE ?auto_151702 ?auto_151703 ?auto_151704 ?auto_151705 ?auto_151706 ?auto_151707 ?auto_151708 ?auto_151709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151711 - BLOCK
      ?auto_151712 - BLOCK
      ?auto_151713 - BLOCK
      ?auto_151714 - BLOCK
      ?auto_151715 - BLOCK
      ?auto_151716 - BLOCK
      ?auto_151717 - BLOCK
      ?auto_151718 - BLOCK
    )
    :vars
    (
      ?auto_151719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151711 ) ( ON ?auto_151712 ?auto_151711 ) ( ON ?auto_151713 ?auto_151712 ) ( ON ?auto_151714 ?auto_151713 ) ( not ( = ?auto_151711 ?auto_151712 ) ) ( not ( = ?auto_151711 ?auto_151713 ) ) ( not ( = ?auto_151711 ?auto_151714 ) ) ( not ( = ?auto_151711 ?auto_151715 ) ) ( not ( = ?auto_151711 ?auto_151716 ) ) ( not ( = ?auto_151711 ?auto_151717 ) ) ( not ( = ?auto_151711 ?auto_151718 ) ) ( not ( = ?auto_151712 ?auto_151713 ) ) ( not ( = ?auto_151712 ?auto_151714 ) ) ( not ( = ?auto_151712 ?auto_151715 ) ) ( not ( = ?auto_151712 ?auto_151716 ) ) ( not ( = ?auto_151712 ?auto_151717 ) ) ( not ( = ?auto_151712 ?auto_151718 ) ) ( not ( = ?auto_151713 ?auto_151714 ) ) ( not ( = ?auto_151713 ?auto_151715 ) ) ( not ( = ?auto_151713 ?auto_151716 ) ) ( not ( = ?auto_151713 ?auto_151717 ) ) ( not ( = ?auto_151713 ?auto_151718 ) ) ( not ( = ?auto_151714 ?auto_151715 ) ) ( not ( = ?auto_151714 ?auto_151716 ) ) ( not ( = ?auto_151714 ?auto_151717 ) ) ( not ( = ?auto_151714 ?auto_151718 ) ) ( not ( = ?auto_151715 ?auto_151716 ) ) ( not ( = ?auto_151715 ?auto_151717 ) ) ( not ( = ?auto_151715 ?auto_151718 ) ) ( not ( = ?auto_151716 ?auto_151717 ) ) ( not ( = ?auto_151716 ?auto_151718 ) ) ( not ( = ?auto_151717 ?auto_151718 ) ) ( ON ?auto_151718 ?auto_151719 ) ( not ( = ?auto_151711 ?auto_151719 ) ) ( not ( = ?auto_151712 ?auto_151719 ) ) ( not ( = ?auto_151713 ?auto_151719 ) ) ( not ( = ?auto_151714 ?auto_151719 ) ) ( not ( = ?auto_151715 ?auto_151719 ) ) ( not ( = ?auto_151716 ?auto_151719 ) ) ( not ( = ?auto_151717 ?auto_151719 ) ) ( not ( = ?auto_151718 ?auto_151719 ) ) ( ON ?auto_151717 ?auto_151718 ) ( ON-TABLE ?auto_151719 ) ( ON ?auto_151716 ?auto_151717 ) ( CLEAR ?auto_151714 ) ( ON ?auto_151715 ?auto_151716 ) ( CLEAR ?auto_151715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151719 ?auto_151718 ?auto_151717 ?auto_151716 )
      ( MAKE-8PILE ?auto_151711 ?auto_151712 ?auto_151713 ?auto_151714 ?auto_151715 ?auto_151716 ?auto_151717 ?auto_151718 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151720 - BLOCK
      ?auto_151721 - BLOCK
      ?auto_151722 - BLOCK
      ?auto_151723 - BLOCK
      ?auto_151724 - BLOCK
      ?auto_151725 - BLOCK
      ?auto_151726 - BLOCK
      ?auto_151727 - BLOCK
    )
    :vars
    (
      ?auto_151728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151720 ) ( ON ?auto_151721 ?auto_151720 ) ( ON ?auto_151722 ?auto_151721 ) ( not ( = ?auto_151720 ?auto_151721 ) ) ( not ( = ?auto_151720 ?auto_151722 ) ) ( not ( = ?auto_151720 ?auto_151723 ) ) ( not ( = ?auto_151720 ?auto_151724 ) ) ( not ( = ?auto_151720 ?auto_151725 ) ) ( not ( = ?auto_151720 ?auto_151726 ) ) ( not ( = ?auto_151720 ?auto_151727 ) ) ( not ( = ?auto_151721 ?auto_151722 ) ) ( not ( = ?auto_151721 ?auto_151723 ) ) ( not ( = ?auto_151721 ?auto_151724 ) ) ( not ( = ?auto_151721 ?auto_151725 ) ) ( not ( = ?auto_151721 ?auto_151726 ) ) ( not ( = ?auto_151721 ?auto_151727 ) ) ( not ( = ?auto_151722 ?auto_151723 ) ) ( not ( = ?auto_151722 ?auto_151724 ) ) ( not ( = ?auto_151722 ?auto_151725 ) ) ( not ( = ?auto_151722 ?auto_151726 ) ) ( not ( = ?auto_151722 ?auto_151727 ) ) ( not ( = ?auto_151723 ?auto_151724 ) ) ( not ( = ?auto_151723 ?auto_151725 ) ) ( not ( = ?auto_151723 ?auto_151726 ) ) ( not ( = ?auto_151723 ?auto_151727 ) ) ( not ( = ?auto_151724 ?auto_151725 ) ) ( not ( = ?auto_151724 ?auto_151726 ) ) ( not ( = ?auto_151724 ?auto_151727 ) ) ( not ( = ?auto_151725 ?auto_151726 ) ) ( not ( = ?auto_151725 ?auto_151727 ) ) ( not ( = ?auto_151726 ?auto_151727 ) ) ( ON ?auto_151727 ?auto_151728 ) ( not ( = ?auto_151720 ?auto_151728 ) ) ( not ( = ?auto_151721 ?auto_151728 ) ) ( not ( = ?auto_151722 ?auto_151728 ) ) ( not ( = ?auto_151723 ?auto_151728 ) ) ( not ( = ?auto_151724 ?auto_151728 ) ) ( not ( = ?auto_151725 ?auto_151728 ) ) ( not ( = ?auto_151726 ?auto_151728 ) ) ( not ( = ?auto_151727 ?auto_151728 ) ) ( ON ?auto_151726 ?auto_151727 ) ( ON-TABLE ?auto_151728 ) ( ON ?auto_151725 ?auto_151726 ) ( ON ?auto_151724 ?auto_151725 ) ( CLEAR ?auto_151724 ) ( HOLDING ?auto_151723 ) ( CLEAR ?auto_151722 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151720 ?auto_151721 ?auto_151722 ?auto_151723 )
      ( MAKE-8PILE ?auto_151720 ?auto_151721 ?auto_151722 ?auto_151723 ?auto_151724 ?auto_151725 ?auto_151726 ?auto_151727 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151729 - BLOCK
      ?auto_151730 - BLOCK
      ?auto_151731 - BLOCK
      ?auto_151732 - BLOCK
      ?auto_151733 - BLOCK
      ?auto_151734 - BLOCK
      ?auto_151735 - BLOCK
      ?auto_151736 - BLOCK
    )
    :vars
    (
      ?auto_151737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151729 ) ( ON ?auto_151730 ?auto_151729 ) ( ON ?auto_151731 ?auto_151730 ) ( not ( = ?auto_151729 ?auto_151730 ) ) ( not ( = ?auto_151729 ?auto_151731 ) ) ( not ( = ?auto_151729 ?auto_151732 ) ) ( not ( = ?auto_151729 ?auto_151733 ) ) ( not ( = ?auto_151729 ?auto_151734 ) ) ( not ( = ?auto_151729 ?auto_151735 ) ) ( not ( = ?auto_151729 ?auto_151736 ) ) ( not ( = ?auto_151730 ?auto_151731 ) ) ( not ( = ?auto_151730 ?auto_151732 ) ) ( not ( = ?auto_151730 ?auto_151733 ) ) ( not ( = ?auto_151730 ?auto_151734 ) ) ( not ( = ?auto_151730 ?auto_151735 ) ) ( not ( = ?auto_151730 ?auto_151736 ) ) ( not ( = ?auto_151731 ?auto_151732 ) ) ( not ( = ?auto_151731 ?auto_151733 ) ) ( not ( = ?auto_151731 ?auto_151734 ) ) ( not ( = ?auto_151731 ?auto_151735 ) ) ( not ( = ?auto_151731 ?auto_151736 ) ) ( not ( = ?auto_151732 ?auto_151733 ) ) ( not ( = ?auto_151732 ?auto_151734 ) ) ( not ( = ?auto_151732 ?auto_151735 ) ) ( not ( = ?auto_151732 ?auto_151736 ) ) ( not ( = ?auto_151733 ?auto_151734 ) ) ( not ( = ?auto_151733 ?auto_151735 ) ) ( not ( = ?auto_151733 ?auto_151736 ) ) ( not ( = ?auto_151734 ?auto_151735 ) ) ( not ( = ?auto_151734 ?auto_151736 ) ) ( not ( = ?auto_151735 ?auto_151736 ) ) ( ON ?auto_151736 ?auto_151737 ) ( not ( = ?auto_151729 ?auto_151737 ) ) ( not ( = ?auto_151730 ?auto_151737 ) ) ( not ( = ?auto_151731 ?auto_151737 ) ) ( not ( = ?auto_151732 ?auto_151737 ) ) ( not ( = ?auto_151733 ?auto_151737 ) ) ( not ( = ?auto_151734 ?auto_151737 ) ) ( not ( = ?auto_151735 ?auto_151737 ) ) ( not ( = ?auto_151736 ?auto_151737 ) ) ( ON ?auto_151735 ?auto_151736 ) ( ON-TABLE ?auto_151737 ) ( ON ?auto_151734 ?auto_151735 ) ( ON ?auto_151733 ?auto_151734 ) ( CLEAR ?auto_151731 ) ( ON ?auto_151732 ?auto_151733 ) ( CLEAR ?auto_151732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151737 ?auto_151736 ?auto_151735 ?auto_151734 ?auto_151733 )
      ( MAKE-8PILE ?auto_151729 ?auto_151730 ?auto_151731 ?auto_151732 ?auto_151733 ?auto_151734 ?auto_151735 ?auto_151736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151738 - BLOCK
      ?auto_151739 - BLOCK
      ?auto_151740 - BLOCK
      ?auto_151741 - BLOCK
      ?auto_151742 - BLOCK
      ?auto_151743 - BLOCK
      ?auto_151744 - BLOCK
      ?auto_151745 - BLOCK
    )
    :vars
    (
      ?auto_151746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151738 ) ( ON ?auto_151739 ?auto_151738 ) ( not ( = ?auto_151738 ?auto_151739 ) ) ( not ( = ?auto_151738 ?auto_151740 ) ) ( not ( = ?auto_151738 ?auto_151741 ) ) ( not ( = ?auto_151738 ?auto_151742 ) ) ( not ( = ?auto_151738 ?auto_151743 ) ) ( not ( = ?auto_151738 ?auto_151744 ) ) ( not ( = ?auto_151738 ?auto_151745 ) ) ( not ( = ?auto_151739 ?auto_151740 ) ) ( not ( = ?auto_151739 ?auto_151741 ) ) ( not ( = ?auto_151739 ?auto_151742 ) ) ( not ( = ?auto_151739 ?auto_151743 ) ) ( not ( = ?auto_151739 ?auto_151744 ) ) ( not ( = ?auto_151739 ?auto_151745 ) ) ( not ( = ?auto_151740 ?auto_151741 ) ) ( not ( = ?auto_151740 ?auto_151742 ) ) ( not ( = ?auto_151740 ?auto_151743 ) ) ( not ( = ?auto_151740 ?auto_151744 ) ) ( not ( = ?auto_151740 ?auto_151745 ) ) ( not ( = ?auto_151741 ?auto_151742 ) ) ( not ( = ?auto_151741 ?auto_151743 ) ) ( not ( = ?auto_151741 ?auto_151744 ) ) ( not ( = ?auto_151741 ?auto_151745 ) ) ( not ( = ?auto_151742 ?auto_151743 ) ) ( not ( = ?auto_151742 ?auto_151744 ) ) ( not ( = ?auto_151742 ?auto_151745 ) ) ( not ( = ?auto_151743 ?auto_151744 ) ) ( not ( = ?auto_151743 ?auto_151745 ) ) ( not ( = ?auto_151744 ?auto_151745 ) ) ( ON ?auto_151745 ?auto_151746 ) ( not ( = ?auto_151738 ?auto_151746 ) ) ( not ( = ?auto_151739 ?auto_151746 ) ) ( not ( = ?auto_151740 ?auto_151746 ) ) ( not ( = ?auto_151741 ?auto_151746 ) ) ( not ( = ?auto_151742 ?auto_151746 ) ) ( not ( = ?auto_151743 ?auto_151746 ) ) ( not ( = ?auto_151744 ?auto_151746 ) ) ( not ( = ?auto_151745 ?auto_151746 ) ) ( ON ?auto_151744 ?auto_151745 ) ( ON-TABLE ?auto_151746 ) ( ON ?auto_151743 ?auto_151744 ) ( ON ?auto_151742 ?auto_151743 ) ( ON ?auto_151741 ?auto_151742 ) ( CLEAR ?auto_151741 ) ( HOLDING ?auto_151740 ) ( CLEAR ?auto_151739 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151738 ?auto_151739 ?auto_151740 )
      ( MAKE-8PILE ?auto_151738 ?auto_151739 ?auto_151740 ?auto_151741 ?auto_151742 ?auto_151743 ?auto_151744 ?auto_151745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151747 - BLOCK
      ?auto_151748 - BLOCK
      ?auto_151749 - BLOCK
      ?auto_151750 - BLOCK
      ?auto_151751 - BLOCK
      ?auto_151752 - BLOCK
      ?auto_151753 - BLOCK
      ?auto_151754 - BLOCK
    )
    :vars
    (
      ?auto_151755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151747 ) ( ON ?auto_151748 ?auto_151747 ) ( not ( = ?auto_151747 ?auto_151748 ) ) ( not ( = ?auto_151747 ?auto_151749 ) ) ( not ( = ?auto_151747 ?auto_151750 ) ) ( not ( = ?auto_151747 ?auto_151751 ) ) ( not ( = ?auto_151747 ?auto_151752 ) ) ( not ( = ?auto_151747 ?auto_151753 ) ) ( not ( = ?auto_151747 ?auto_151754 ) ) ( not ( = ?auto_151748 ?auto_151749 ) ) ( not ( = ?auto_151748 ?auto_151750 ) ) ( not ( = ?auto_151748 ?auto_151751 ) ) ( not ( = ?auto_151748 ?auto_151752 ) ) ( not ( = ?auto_151748 ?auto_151753 ) ) ( not ( = ?auto_151748 ?auto_151754 ) ) ( not ( = ?auto_151749 ?auto_151750 ) ) ( not ( = ?auto_151749 ?auto_151751 ) ) ( not ( = ?auto_151749 ?auto_151752 ) ) ( not ( = ?auto_151749 ?auto_151753 ) ) ( not ( = ?auto_151749 ?auto_151754 ) ) ( not ( = ?auto_151750 ?auto_151751 ) ) ( not ( = ?auto_151750 ?auto_151752 ) ) ( not ( = ?auto_151750 ?auto_151753 ) ) ( not ( = ?auto_151750 ?auto_151754 ) ) ( not ( = ?auto_151751 ?auto_151752 ) ) ( not ( = ?auto_151751 ?auto_151753 ) ) ( not ( = ?auto_151751 ?auto_151754 ) ) ( not ( = ?auto_151752 ?auto_151753 ) ) ( not ( = ?auto_151752 ?auto_151754 ) ) ( not ( = ?auto_151753 ?auto_151754 ) ) ( ON ?auto_151754 ?auto_151755 ) ( not ( = ?auto_151747 ?auto_151755 ) ) ( not ( = ?auto_151748 ?auto_151755 ) ) ( not ( = ?auto_151749 ?auto_151755 ) ) ( not ( = ?auto_151750 ?auto_151755 ) ) ( not ( = ?auto_151751 ?auto_151755 ) ) ( not ( = ?auto_151752 ?auto_151755 ) ) ( not ( = ?auto_151753 ?auto_151755 ) ) ( not ( = ?auto_151754 ?auto_151755 ) ) ( ON ?auto_151753 ?auto_151754 ) ( ON-TABLE ?auto_151755 ) ( ON ?auto_151752 ?auto_151753 ) ( ON ?auto_151751 ?auto_151752 ) ( ON ?auto_151750 ?auto_151751 ) ( CLEAR ?auto_151748 ) ( ON ?auto_151749 ?auto_151750 ) ( CLEAR ?auto_151749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151755 ?auto_151754 ?auto_151753 ?auto_151752 ?auto_151751 ?auto_151750 )
      ( MAKE-8PILE ?auto_151747 ?auto_151748 ?auto_151749 ?auto_151750 ?auto_151751 ?auto_151752 ?auto_151753 ?auto_151754 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151756 - BLOCK
      ?auto_151757 - BLOCK
      ?auto_151758 - BLOCK
      ?auto_151759 - BLOCK
      ?auto_151760 - BLOCK
      ?auto_151761 - BLOCK
      ?auto_151762 - BLOCK
      ?auto_151763 - BLOCK
    )
    :vars
    (
      ?auto_151764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151756 ) ( not ( = ?auto_151756 ?auto_151757 ) ) ( not ( = ?auto_151756 ?auto_151758 ) ) ( not ( = ?auto_151756 ?auto_151759 ) ) ( not ( = ?auto_151756 ?auto_151760 ) ) ( not ( = ?auto_151756 ?auto_151761 ) ) ( not ( = ?auto_151756 ?auto_151762 ) ) ( not ( = ?auto_151756 ?auto_151763 ) ) ( not ( = ?auto_151757 ?auto_151758 ) ) ( not ( = ?auto_151757 ?auto_151759 ) ) ( not ( = ?auto_151757 ?auto_151760 ) ) ( not ( = ?auto_151757 ?auto_151761 ) ) ( not ( = ?auto_151757 ?auto_151762 ) ) ( not ( = ?auto_151757 ?auto_151763 ) ) ( not ( = ?auto_151758 ?auto_151759 ) ) ( not ( = ?auto_151758 ?auto_151760 ) ) ( not ( = ?auto_151758 ?auto_151761 ) ) ( not ( = ?auto_151758 ?auto_151762 ) ) ( not ( = ?auto_151758 ?auto_151763 ) ) ( not ( = ?auto_151759 ?auto_151760 ) ) ( not ( = ?auto_151759 ?auto_151761 ) ) ( not ( = ?auto_151759 ?auto_151762 ) ) ( not ( = ?auto_151759 ?auto_151763 ) ) ( not ( = ?auto_151760 ?auto_151761 ) ) ( not ( = ?auto_151760 ?auto_151762 ) ) ( not ( = ?auto_151760 ?auto_151763 ) ) ( not ( = ?auto_151761 ?auto_151762 ) ) ( not ( = ?auto_151761 ?auto_151763 ) ) ( not ( = ?auto_151762 ?auto_151763 ) ) ( ON ?auto_151763 ?auto_151764 ) ( not ( = ?auto_151756 ?auto_151764 ) ) ( not ( = ?auto_151757 ?auto_151764 ) ) ( not ( = ?auto_151758 ?auto_151764 ) ) ( not ( = ?auto_151759 ?auto_151764 ) ) ( not ( = ?auto_151760 ?auto_151764 ) ) ( not ( = ?auto_151761 ?auto_151764 ) ) ( not ( = ?auto_151762 ?auto_151764 ) ) ( not ( = ?auto_151763 ?auto_151764 ) ) ( ON ?auto_151762 ?auto_151763 ) ( ON-TABLE ?auto_151764 ) ( ON ?auto_151761 ?auto_151762 ) ( ON ?auto_151760 ?auto_151761 ) ( ON ?auto_151759 ?auto_151760 ) ( ON ?auto_151758 ?auto_151759 ) ( CLEAR ?auto_151758 ) ( HOLDING ?auto_151757 ) ( CLEAR ?auto_151756 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151756 ?auto_151757 )
      ( MAKE-8PILE ?auto_151756 ?auto_151757 ?auto_151758 ?auto_151759 ?auto_151760 ?auto_151761 ?auto_151762 ?auto_151763 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151765 - BLOCK
      ?auto_151766 - BLOCK
      ?auto_151767 - BLOCK
      ?auto_151768 - BLOCK
      ?auto_151769 - BLOCK
      ?auto_151770 - BLOCK
      ?auto_151771 - BLOCK
      ?auto_151772 - BLOCK
    )
    :vars
    (
      ?auto_151773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_151765 ) ( not ( = ?auto_151765 ?auto_151766 ) ) ( not ( = ?auto_151765 ?auto_151767 ) ) ( not ( = ?auto_151765 ?auto_151768 ) ) ( not ( = ?auto_151765 ?auto_151769 ) ) ( not ( = ?auto_151765 ?auto_151770 ) ) ( not ( = ?auto_151765 ?auto_151771 ) ) ( not ( = ?auto_151765 ?auto_151772 ) ) ( not ( = ?auto_151766 ?auto_151767 ) ) ( not ( = ?auto_151766 ?auto_151768 ) ) ( not ( = ?auto_151766 ?auto_151769 ) ) ( not ( = ?auto_151766 ?auto_151770 ) ) ( not ( = ?auto_151766 ?auto_151771 ) ) ( not ( = ?auto_151766 ?auto_151772 ) ) ( not ( = ?auto_151767 ?auto_151768 ) ) ( not ( = ?auto_151767 ?auto_151769 ) ) ( not ( = ?auto_151767 ?auto_151770 ) ) ( not ( = ?auto_151767 ?auto_151771 ) ) ( not ( = ?auto_151767 ?auto_151772 ) ) ( not ( = ?auto_151768 ?auto_151769 ) ) ( not ( = ?auto_151768 ?auto_151770 ) ) ( not ( = ?auto_151768 ?auto_151771 ) ) ( not ( = ?auto_151768 ?auto_151772 ) ) ( not ( = ?auto_151769 ?auto_151770 ) ) ( not ( = ?auto_151769 ?auto_151771 ) ) ( not ( = ?auto_151769 ?auto_151772 ) ) ( not ( = ?auto_151770 ?auto_151771 ) ) ( not ( = ?auto_151770 ?auto_151772 ) ) ( not ( = ?auto_151771 ?auto_151772 ) ) ( ON ?auto_151772 ?auto_151773 ) ( not ( = ?auto_151765 ?auto_151773 ) ) ( not ( = ?auto_151766 ?auto_151773 ) ) ( not ( = ?auto_151767 ?auto_151773 ) ) ( not ( = ?auto_151768 ?auto_151773 ) ) ( not ( = ?auto_151769 ?auto_151773 ) ) ( not ( = ?auto_151770 ?auto_151773 ) ) ( not ( = ?auto_151771 ?auto_151773 ) ) ( not ( = ?auto_151772 ?auto_151773 ) ) ( ON ?auto_151771 ?auto_151772 ) ( ON-TABLE ?auto_151773 ) ( ON ?auto_151770 ?auto_151771 ) ( ON ?auto_151769 ?auto_151770 ) ( ON ?auto_151768 ?auto_151769 ) ( ON ?auto_151767 ?auto_151768 ) ( CLEAR ?auto_151765 ) ( ON ?auto_151766 ?auto_151767 ) ( CLEAR ?auto_151766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_151773 ?auto_151772 ?auto_151771 ?auto_151770 ?auto_151769 ?auto_151768 ?auto_151767 )
      ( MAKE-8PILE ?auto_151765 ?auto_151766 ?auto_151767 ?auto_151768 ?auto_151769 ?auto_151770 ?auto_151771 ?auto_151772 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151774 - BLOCK
      ?auto_151775 - BLOCK
      ?auto_151776 - BLOCK
      ?auto_151777 - BLOCK
      ?auto_151778 - BLOCK
      ?auto_151779 - BLOCK
      ?auto_151780 - BLOCK
      ?auto_151781 - BLOCK
    )
    :vars
    (
      ?auto_151782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151774 ?auto_151775 ) ) ( not ( = ?auto_151774 ?auto_151776 ) ) ( not ( = ?auto_151774 ?auto_151777 ) ) ( not ( = ?auto_151774 ?auto_151778 ) ) ( not ( = ?auto_151774 ?auto_151779 ) ) ( not ( = ?auto_151774 ?auto_151780 ) ) ( not ( = ?auto_151774 ?auto_151781 ) ) ( not ( = ?auto_151775 ?auto_151776 ) ) ( not ( = ?auto_151775 ?auto_151777 ) ) ( not ( = ?auto_151775 ?auto_151778 ) ) ( not ( = ?auto_151775 ?auto_151779 ) ) ( not ( = ?auto_151775 ?auto_151780 ) ) ( not ( = ?auto_151775 ?auto_151781 ) ) ( not ( = ?auto_151776 ?auto_151777 ) ) ( not ( = ?auto_151776 ?auto_151778 ) ) ( not ( = ?auto_151776 ?auto_151779 ) ) ( not ( = ?auto_151776 ?auto_151780 ) ) ( not ( = ?auto_151776 ?auto_151781 ) ) ( not ( = ?auto_151777 ?auto_151778 ) ) ( not ( = ?auto_151777 ?auto_151779 ) ) ( not ( = ?auto_151777 ?auto_151780 ) ) ( not ( = ?auto_151777 ?auto_151781 ) ) ( not ( = ?auto_151778 ?auto_151779 ) ) ( not ( = ?auto_151778 ?auto_151780 ) ) ( not ( = ?auto_151778 ?auto_151781 ) ) ( not ( = ?auto_151779 ?auto_151780 ) ) ( not ( = ?auto_151779 ?auto_151781 ) ) ( not ( = ?auto_151780 ?auto_151781 ) ) ( ON ?auto_151781 ?auto_151782 ) ( not ( = ?auto_151774 ?auto_151782 ) ) ( not ( = ?auto_151775 ?auto_151782 ) ) ( not ( = ?auto_151776 ?auto_151782 ) ) ( not ( = ?auto_151777 ?auto_151782 ) ) ( not ( = ?auto_151778 ?auto_151782 ) ) ( not ( = ?auto_151779 ?auto_151782 ) ) ( not ( = ?auto_151780 ?auto_151782 ) ) ( not ( = ?auto_151781 ?auto_151782 ) ) ( ON ?auto_151780 ?auto_151781 ) ( ON-TABLE ?auto_151782 ) ( ON ?auto_151779 ?auto_151780 ) ( ON ?auto_151778 ?auto_151779 ) ( ON ?auto_151777 ?auto_151778 ) ( ON ?auto_151776 ?auto_151777 ) ( ON ?auto_151775 ?auto_151776 ) ( CLEAR ?auto_151775 ) ( HOLDING ?auto_151774 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_151774 )
      ( MAKE-8PILE ?auto_151774 ?auto_151775 ?auto_151776 ?auto_151777 ?auto_151778 ?auto_151779 ?auto_151780 ?auto_151781 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_151783 - BLOCK
      ?auto_151784 - BLOCK
      ?auto_151785 - BLOCK
      ?auto_151786 - BLOCK
      ?auto_151787 - BLOCK
      ?auto_151788 - BLOCK
      ?auto_151789 - BLOCK
      ?auto_151790 - BLOCK
    )
    :vars
    (
      ?auto_151791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_151783 ?auto_151784 ) ) ( not ( = ?auto_151783 ?auto_151785 ) ) ( not ( = ?auto_151783 ?auto_151786 ) ) ( not ( = ?auto_151783 ?auto_151787 ) ) ( not ( = ?auto_151783 ?auto_151788 ) ) ( not ( = ?auto_151783 ?auto_151789 ) ) ( not ( = ?auto_151783 ?auto_151790 ) ) ( not ( = ?auto_151784 ?auto_151785 ) ) ( not ( = ?auto_151784 ?auto_151786 ) ) ( not ( = ?auto_151784 ?auto_151787 ) ) ( not ( = ?auto_151784 ?auto_151788 ) ) ( not ( = ?auto_151784 ?auto_151789 ) ) ( not ( = ?auto_151784 ?auto_151790 ) ) ( not ( = ?auto_151785 ?auto_151786 ) ) ( not ( = ?auto_151785 ?auto_151787 ) ) ( not ( = ?auto_151785 ?auto_151788 ) ) ( not ( = ?auto_151785 ?auto_151789 ) ) ( not ( = ?auto_151785 ?auto_151790 ) ) ( not ( = ?auto_151786 ?auto_151787 ) ) ( not ( = ?auto_151786 ?auto_151788 ) ) ( not ( = ?auto_151786 ?auto_151789 ) ) ( not ( = ?auto_151786 ?auto_151790 ) ) ( not ( = ?auto_151787 ?auto_151788 ) ) ( not ( = ?auto_151787 ?auto_151789 ) ) ( not ( = ?auto_151787 ?auto_151790 ) ) ( not ( = ?auto_151788 ?auto_151789 ) ) ( not ( = ?auto_151788 ?auto_151790 ) ) ( not ( = ?auto_151789 ?auto_151790 ) ) ( ON ?auto_151790 ?auto_151791 ) ( not ( = ?auto_151783 ?auto_151791 ) ) ( not ( = ?auto_151784 ?auto_151791 ) ) ( not ( = ?auto_151785 ?auto_151791 ) ) ( not ( = ?auto_151786 ?auto_151791 ) ) ( not ( = ?auto_151787 ?auto_151791 ) ) ( not ( = ?auto_151788 ?auto_151791 ) ) ( not ( = ?auto_151789 ?auto_151791 ) ) ( not ( = ?auto_151790 ?auto_151791 ) ) ( ON ?auto_151789 ?auto_151790 ) ( ON-TABLE ?auto_151791 ) ( ON ?auto_151788 ?auto_151789 ) ( ON ?auto_151787 ?auto_151788 ) ( ON ?auto_151786 ?auto_151787 ) ( ON ?auto_151785 ?auto_151786 ) ( ON ?auto_151784 ?auto_151785 ) ( ON ?auto_151783 ?auto_151784 ) ( CLEAR ?auto_151783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_151791 ?auto_151790 ?auto_151789 ?auto_151788 ?auto_151787 ?auto_151786 ?auto_151785 ?auto_151784 )
      ( MAKE-8PILE ?auto_151783 ?auto_151784 ?auto_151785 ?auto_151786 ?auto_151787 ?auto_151788 ?auto_151789 ?auto_151790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151928 - BLOCK
    )
    :vars
    (
      ?auto_151929 - BLOCK
      ?auto_151930 - BLOCK
      ?auto_151931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151928 ?auto_151929 ) ( CLEAR ?auto_151928 ) ( not ( = ?auto_151928 ?auto_151929 ) ) ( HOLDING ?auto_151930 ) ( CLEAR ?auto_151931 ) ( not ( = ?auto_151928 ?auto_151930 ) ) ( not ( = ?auto_151928 ?auto_151931 ) ) ( not ( = ?auto_151929 ?auto_151930 ) ) ( not ( = ?auto_151929 ?auto_151931 ) ) ( not ( = ?auto_151930 ?auto_151931 ) ) )
    :subtasks
    ( ( !STACK ?auto_151930 ?auto_151931 )
      ( MAKE-1PILE ?auto_151928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151932 - BLOCK
    )
    :vars
    (
      ?auto_151935 - BLOCK
      ?auto_151933 - BLOCK
      ?auto_151934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151932 ?auto_151935 ) ( not ( = ?auto_151932 ?auto_151935 ) ) ( CLEAR ?auto_151933 ) ( not ( = ?auto_151932 ?auto_151934 ) ) ( not ( = ?auto_151932 ?auto_151933 ) ) ( not ( = ?auto_151935 ?auto_151934 ) ) ( not ( = ?auto_151935 ?auto_151933 ) ) ( not ( = ?auto_151934 ?auto_151933 ) ) ( ON ?auto_151934 ?auto_151932 ) ( CLEAR ?auto_151934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_151935 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_151935 ?auto_151932 )
      ( MAKE-1PILE ?auto_151932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151936 - BLOCK
    )
    :vars
    (
      ?auto_151937 - BLOCK
      ?auto_151939 - BLOCK
      ?auto_151938 - BLOCK
      ?auto_151942 - BLOCK
      ?auto_151940 - BLOCK
      ?auto_151941 - BLOCK
      ?auto_151944 - BLOCK
      ?auto_151943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151936 ?auto_151937 ) ( not ( = ?auto_151936 ?auto_151937 ) ) ( not ( = ?auto_151936 ?auto_151939 ) ) ( not ( = ?auto_151936 ?auto_151938 ) ) ( not ( = ?auto_151937 ?auto_151939 ) ) ( not ( = ?auto_151937 ?auto_151938 ) ) ( not ( = ?auto_151939 ?auto_151938 ) ) ( ON ?auto_151939 ?auto_151936 ) ( CLEAR ?auto_151939 ) ( ON-TABLE ?auto_151937 ) ( HOLDING ?auto_151938 ) ( CLEAR ?auto_151942 ) ( ON-TABLE ?auto_151940 ) ( ON ?auto_151941 ?auto_151940 ) ( ON ?auto_151944 ?auto_151941 ) ( ON ?auto_151943 ?auto_151944 ) ( ON ?auto_151942 ?auto_151943 ) ( not ( = ?auto_151940 ?auto_151941 ) ) ( not ( = ?auto_151940 ?auto_151944 ) ) ( not ( = ?auto_151940 ?auto_151943 ) ) ( not ( = ?auto_151940 ?auto_151942 ) ) ( not ( = ?auto_151940 ?auto_151938 ) ) ( not ( = ?auto_151941 ?auto_151944 ) ) ( not ( = ?auto_151941 ?auto_151943 ) ) ( not ( = ?auto_151941 ?auto_151942 ) ) ( not ( = ?auto_151941 ?auto_151938 ) ) ( not ( = ?auto_151944 ?auto_151943 ) ) ( not ( = ?auto_151944 ?auto_151942 ) ) ( not ( = ?auto_151944 ?auto_151938 ) ) ( not ( = ?auto_151943 ?auto_151942 ) ) ( not ( = ?auto_151943 ?auto_151938 ) ) ( not ( = ?auto_151942 ?auto_151938 ) ) ( not ( = ?auto_151936 ?auto_151942 ) ) ( not ( = ?auto_151936 ?auto_151940 ) ) ( not ( = ?auto_151936 ?auto_151941 ) ) ( not ( = ?auto_151936 ?auto_151944 ) ) ( not ( = ?auto_151936 ?auto_151943 ) ) ( not ( = ?auto_151937 ?auto_151942 ) ) ( not ( = ?auto_151937 ?auto_151940 ) ) ( not ( = ?auto_151937 ?auto_151941 ) ) ( not ( = ?auto_151937 ?auto_151944 ) ) ( not ( = ?auto_151937 ?auto_151943 ) ) ( not ( = ?auto_151939 ?auto_151942 ) ) ( not ( = ?auto_151939 ?auto_151940 ) ) ( not ( = ?auto_151939 ?auto_151941 ) ) ( not ( = ?auto_151939 ?auto_151944 ) ) ( not ( = ?auto_151939 ?auto_151943 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_151940 ?auto_151941 ?auto_151944 ?auto_151943 ?auto_151942 ?auto_151938 )
      ( MAKE-1PILE ?auto_151936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151945 - BLOCK
    )
    :vars
    (
      ?auto_151949 - BLOCK
      ?auto_151952 - BLOCK
      ?auto_151948 - BLOCK
      ?auto_151953 - BLOCK
      ?auto_151950 - BLOCK
      ?auto_151947 - BLOCK
      ?auto_151946 - BLOCK
      ?auto_151951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151945 ?auto_151949 ) ( not ( = ?auto_151945 ?auto_151949 ) ) ( not ( = ?auto_151945 ?auto_151952 ) ) ( not ( = ?auto_151945 ?auto_151948 ) ) ( not ( = ?auto_151949 ?auto_151952 ) ) ( not ( = ?auto_151949 ?auto_151948 ) ) ( not ( = ?auto_151952 ?auto_151948 ) ) ( ON ?auto_151952 ?auto_151945 ) ( ON-TABLE ?auto_151949 ) ( CLEAR ?auto_151953 ) ( ON-TABLE ?auto_151950 ) ( ON ?auto_151947 ?auto_151950 ) ( ON ?auto_151946 ?auto_151947 ) ( ON ?auto_151951 ?auto_151946 ) ( ON ?auto_151953 ?auto_151951 ) ( not ( = ?auto_151950 ?auto_151947 ) ) ( not ( = ?auto_151950 ?auto_151946 ) ) ( not ( = ?auto_151950 ?auto_151951 ) ) ( not ( = ?auto_151950 ?auto_151953 ) ) ( not ( = ?auto_151950 ?auto_151948 ) ) ( not ( = ?auto_151947 ?auto_151946 ) ) ( not ( = ?auto_151947 ?auto_151951 ) ) ( not ( = ?auto_151947 ?auto_151953 ) ) ( not ( = ?auto_151947 ?auto_151948 ) ) ( not ( = ?auto_151946 ?auto_151951 ) ) ( not ( = ?auto_151946 ?auto_151953 ) ) ( not ( = ?auto_151946 ?auto_151948 ) ) ( not ( = ?auto_151951 ?auto_151953 ) ) ( not ( = ?auto_151951 ?auto_151948 ) ) ( not ( = ?auto_151953 ?auto_151948 ) ) ( not ( = ?auto_151945 ?auto_151953 ) ) ( not ( = ?auto_151945 ?auto_151950 ) ) ( not ( = ?auto_151945 ?auto_151947 ) ) ( not ( = ?auto_151945 ?auto_151946 ) ) ( not ( = ?auto_151945 ?auto_151951 ) ) ( not ( = ?auto_151949 ?auto_151953 ) ) ( not ( = ?auto_151949 ?auto_151950 ) ) ( not ( = ?auto_151949 ?auto_151947 ) ) ( not ( = ?auto_151949 ?auto_151946 ) ) ( not ( = ?auto_151949 ?auto_151951 ) ) ( not ( = ?auto_151952 ?auto_151953 ) ) ( not ( = ?auto_151952 ?auto_151950 ) ) ( not ( = ?auto_151952 ?auto_151947 ) ) ( not ( = ?auto_151952 ?auto_151946 ) ) ( not ( = ?auto_151952 ?auto_151951 ) ) ( ON ?auto_151948 ?auto_151952 ) ( CLEAR ?auto_151948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151949 ?auto_151945 ?auto_151952 )
      ( MAKE-1PILE ?auto_151945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151954 - BLOCK
    )
    :vars
    (
      ?auto_151961 - BLOCK
      ?auto_151962 - BLOCK
      ?auto_151957 - BLOCK
      ?auto_151955 - BLOCK
      ?auto_151960 - BLOCK
      ?auto_151956 - BLOCK
      ?auto_151958 - BLOCK
      ?auto_151959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151954 ?auto_151961 ) ( not ( = ?auto_151954 ?auto_151961 ) ) ( not ( = ?auto_151954 ?auto_151962 ) ) ( not ( = ?auto_151954 ?auto_151957 ) ) ( not ( = ?auto_151961 ?auto_151962 ) ) ( not ( = ?auto_151961 ?auto_151957 ) ) ( not ( = ?auto_151962 ?auto_151957 ) ) ( ON ?auto_151962 ?auto_151954 ) ( ON-TABLE ?auto_151961 ) ( ON-TABLE ?auto_151955 ) ( ON ?auto_151960 ?auto_151955 ) ( ON ?auto_151956 ?auto_151960 ) ( ON ?auto_151958 ?auto_151956 ) ( not ( = ?auto_151955 ?auto_151960 ) ) ( not ( = ?auto_151955 ?auto_151956 ) ) ( not ( = ?auto_151955 ?auto_151958 ) ) ( not ( = ?auto_151955 ?auto_151959 ) ) ( not ( = ?auto_151955 ?auto_151957 ) ) ( not ( = ?auto_151960 ?auto_151956 ) ) ( not ( = ?auto_151960 ?auto_151958 ) ) ( not ( = ?auto_151960 ?auto_151959 ) ) ( not ( = ?auto_151960 ?auto_151957 ) ) ( not ( = ?auto_151956 ?auto_151958 ) ) ( not ( = ?auto_151956 ?auto_151959 ) ) ( not ( = ?auto_151956 ?auto_151957 ) ) ( not ( = ?auto_151958 ?auto_151959 ) ) ( not ( = ?auto_151958 ?auto_151957 ) ) ( not ( = ?auto_151959 ?auto_151957 ) ) ( not ( = ?auto_151954 ?auto_151959 ) ) ( not ( = ?auto_151954 ?auto_151955 ) ) ( not ( = ?auto_151954 ?auto_151960 ) ) ( not ( = ?auto_151954 ?auto_151956 ) ) ( not ( = ?auto_151954 ?auto_151958 ) ) ( not ( = ?auto_151961 ?auto_151959 ) ) ( not ( = ?auto_151961 ?auto_151955 ) ) ( not ( = ?auto_151961 ?auto_151960 ) ) ( not ( = ?auto_151961 ?auto_151956 ) ) ( not ( = ?auto_151961 ?auto_151958 ) ) ( not ( = ?auto_151962 ?auto_151959 ) ) ( not ( = ?auto_151962 ?auto_151955 ) ) ( not ( = ?auto_151962 ?auto_151960 ) ) ( not ( = ?auto_151962 ?auto_151956 ) ) ( not ( = ?auto_151962 ?auto_151958 ) ) ( ON ?auto_151957 ?auto_151962 ) ( CLEAR ?auto_151957 ) ( HOLDING ?auto_151959 ) ( CLEAR ?auto_151958 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151955 ?auto_151960 ?auto_151956 ?auto_151958 ?auto_151959 )
      ( MAKE-1PILE ?auto_151954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151963 - BLOCK
    )
    :vars
    (
      ?auto_151968 - BLOCK
      ?auto_151966 - BLOCK
      ?auto_151971 - BLOCK
      ?auto_151969 - BLOCK
      ?auto_151970 - BLOCK
      ?auto_151967 - BLOCK
      ?auto_151964 - BLOCK
      ?auto_151965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151963 ?auto_151968 ) ( not ( = ?auto_151963 ?auto_151968 ) ) ( not ( = ?auto_151963 ?auto_151966 ) ) ( not ( = ?auto_151963 ?auto_151971 ) ) ( not ( = ?auto_151968 ?auto_151966 ) ) ( not ( = ?auto_151968 ?auto_151971 ) ) ( not ( = ?auto_151966 ?auto_151971 ) ) ( ON ?auto_151966 ?auto_151963 ) ( ON-TABLE ?auto_151968 ) ( ON-TABLE ?auto_151969 ) ( ON ?auto_151970 ?auto_151969 ) ( ON ?auto_151967 ?auto_151970 ) ( ON ?auto_151964 ?auto_151967 ) ( not ( = ?auto_151969 ?auto_151970 ) ) ( not ( = ?auto_151969 ?auto_151967 ) ) ( not ( = ?auto_151969 ?auto_151964 ) ) ( not ( = ?auto_151969 ?auto_151965 ) ) ( not ( = ?auto_151969 ?auto_151971 ) ) ( not ( = ?auto_151970 ?auto_151967 ) ) ( not ( = ?auto_151970 ?auto_151964 ) ) ( not ( = ?auto_151970 ?auto_151965 ) ) ( not ( = ?auto_151970 ?auto_151971 ) ) ( not ( = ?auto_151967 ?auto_151964 ) ) ( not ( = ?auto_151967 ?auto_151965 ) ) ( not ( = ?auto_151967 ?auto_151971 ) ) ( not ( = ?auto_151964 ?auto_151965 ) ) ( not ( = ?auto_151964 ?auto_151971 ) ) ( not ( = ?auto_151965 ?auto_151971 ) ) ( not ( = ?auto_151963 ?auto_151965 ) ) ( not ( = ?auto_151963 ?auto_151969 ) ) ( not ( = ?auto_151963 ?auto_151970 ) ) ( not ( = ?auto_151963 ?auto_151967 ) ) ( not ( = ?auto_151963 ?auto_151964 ) ) ( not ( = ?auto_151968 ?auto_151965 ) ) ( not ( = ?auto_151968 ?auto_151969 ) ) ( not ( = ?auto_151968 ?auto_151970 ) ) ( not ( = ?auto_151968 ?auto_151967 ) ) ( not ( = ?auto_151968 ?auto_151964 ) ) ( not ( = ?auto_151966 ?auto_151965 ) ) ( not ( = ?auto_151966 ?auto_151969 ) ) ( not ( = ?auto_151966 ?auto_151970 ) ) ( not ( = ?auto_151966 ?auto_151967 ) ) ( not ( = ?auto_151966 ?auto_151964 ) ) ( ON ?auto_151971 ?auto_151966 ) ( CLEAR ?auto_151964 ) ( ON ?auto_151965 ?auto_151971 ) ( CLEAR ?auto_151965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151968 ?auto_151963 ?auto_151966 ?auto_151971 )
      ( MAKE-1PILE ?auto_151963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151972 - BLOCK
    )
    :vars
    (
      ?auto_151980 - BLOCK
      ?auto_151976 - BLOCK
      ?auto_151975 - BLOCK
      ?auto_151978 - BLOCK
      ?auto_151979 - BLOCK
      ?auto_151977 - BLOCK
      ?auto_151974 - BLOCK
      ?auto_151973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151972 ?auto_151980 ) ( not ( = ?auto_151972 ?auto_151980 ) ) ( not ( = ?auto_151972 ?auto_151976 ) ) ( not ( = ?auto_151972 ?auto_151975 ) ) ( not ( = ?auto_151980 ?auto_151976 ) ) ( not ( = ?auto_151980 ?auto_151975 ) ) ( not ( = ?auto_151976 ?auto_151975 ) ) ( ON ?auto_151976 ?auto_151972 ) ( ON-TABLE ?auto_151980 ) ( ON-TABLE ?auto_151978 ) ( ON ?auto_151979 ?auto_151978 ) ( ON ?auto_151977 ?auto_151979 ) ( not ( = ?auto_151978 ?auto_151979 ) ) ( not ( = ?auto_151978 ?auto_151977 ) ) ( not ( = ?auto_151978 ?auto_151974 ) ) ( not ( = ?auto_151978 ?auto_151973 ) ) ( not ( = ?auto_151978 ?auto_151975 ) ) ( not ( = ?auto_151979 ?auto_151977 ) ) ( not ( = ?auto_151979 ?auto_151974 ) ) ( not ( = ?auto_151979 ?auto_151973 ) ) ( not ( = ?auto_151979 ?auto_151975 ) ) ( not ( = ?auto_151977 ?auto_151974 ) ) ( not ( = ?auto_151977 ?auto_151973 ) ) ( not ( = ?auto_151977 ?auto_151975 ) ) ( not ( = ?auto_151974 ?auto_151973 ) ) ( not ( = ?auto_151974 ?auto_151975 ) ) ( not ( = ?auto_151973 ?auto_151975 ) ) ( not ( = ?auto_151972 ?auto_151973 ) ) ( not ( = ?auto_151972 ?auto_151978 ) ) ( not ( = ?auto_151972 ?auto_151979 ) ) ( not ( = ?auto_151972 ?auto_151977 ) ) ( not ( = ?auto_151972 ?auto_151974 ) ) ( not ( = ?auto_151980 ?auto_151973 ) ) ( not ( = ?auto_151980 ?auto_151978 ) ) ( not ( = ?auto_151980 ?auto_151979 ) ) ( not ( = ?auto_151980 ?auto_151977 ) ) ( not ( = ?auto_151980 ?auto_151974 ) ) ( not ( = ?auto_151976 ?auto_151973 ) ) ( not ( = ?auto_151976 ?auto_151978 ) ) ( not ( = ?auto_151976 ?auto_151979 ) ) ( not ( = ?auto_151976 ?auto_151977 ) ) ( not ( = ?auto_151976 ?auto_151974 ) ) ( ON ?auto_151975 ?auto_151976 ) ( ON ?auto_151973 ?auto_151975 ) ( CLEAR ?auto_151973 ) ( HOLDING ?auto_151974 ) ( CLEAR ?auto_151977 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_151978 ?auto_151979 ?auto_151977 ?auto_151974 )
      ( MAKE-1PILE ?auto_151972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151981 - BLOCK
    )
    :vars
    (
      ?auto_151987 - BLOCK
      ?auto_151982 - BLOCK
      ?auto_151986 - BLOCK
      ?auto_151989 - BLOCK
      ?auto_151984 - BLOCK
      ?auto_151983 - BLOCK
      ?auto_151985 - BLOCK
      ?auto_151988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151981 ?auto_151987 ) ( not ( = ?auto_151981 ?auto_151987 ) ) ( not ( = ?auto_151981 ?auto_151982 ) ) ( not ( = ?auto_151981 ?auto_151986 ) ) ( not ( = ?auto_151987 ?auto_151982 ) ) ( not ( = ?auto_151987 ?auto_151986 ) ) ( not ( = ?auto_151982 ?auto_151986 ) ) ( ON ?auto_151982 ?auto_151981 ) ( ON-TABLE ?auto_151987 ) ( ON-TABLE ?auto_151989 ) ( ON ?auto_151984 ?auto_151989 ) ( ON ?auto_151983 ?auto_151984 ) ( not ( = ?auto_151989 ?auto_151984 ) ) ( not ( = ?auto_151989 ?auto_151983 ) ) ( not ( = ?auto_151989 ?auto_151985 ) ) ( not ( = ?auto_151989 ?auto_151988 ) ) ( not ( = ?auto_151989 ?auto_151986 ) ) ( not ( = ?auto_151984 ?auto_151983 ) ) ( not ( = ?auto_151984 ?auto_151985 ) ) ( not ( = ?auto_151984 ?auto_151988 ) ) ( not ( = ?auto_151984 ?auto_151986 ) ) ( not ( = ?auto_151983 ?auto_151985 ) ) ( not ( = ?auto_151983 ?auto_151988 ) ) ( not ( = ?auto_151983 ?auto_151986 ) ) ( not ( = ?auto_151985 ?auto_151988 ) ) ( not ( = ?auto_151985 ?auto_151986 ) ) ( not ( = ?auto_151988 ?auto_151986 ) ) ( not ( = ?auto_151981 ?auto_151988 ) ) ( not ( = ?auto_151981 ?auto_151989 ) ) ( not ( = ?auto_151981 ?auto_151984 ) ) ( not ( = ?auto_151981 ?auto_151983 ) ) ( not ( = ?auto_151981 ?auto_151985 ) ) ( not ( = ?auto_151987 ?auto_151988 ) ) ( not ( = ?auto_151987 ?auto_151989 ) ) ( not ( = ?auto_151987 ?auto_151984 ) ) ( not ( = ?auto_151987 ?auto_151983 ) ) ( not ( = ?auto_151987 ?auto_151985 ) ) ( not ( = ?auto_151982 ?auto_151988 ) ) ( not ( = ?auto_151982 ?auto_151989 ) ) ( not ( = ?auto_151982 ?auto_151984 ) ) ( not ( = ?auto_151982 ?auto_151983 ) ) ( not ( = ?auto_151982 ?auto_151985 ) ) ( ON ?auto_151986 ?auto_151982 ) ( ON ?auto_151988 ?auto_151986 ) ( CLEAR ?auto_151983 ) ( ON ?auto_151985 ?auto_151988 ) ( CLEAR ?auto_151985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_151987 ?auto_151981 ?auto_151982 ?auto_151986 ?auto_151988 )
      ( MAKE-1PILE ?auto_151981 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151990 - BLOCK
    )
    :vars
    (
      ?auto_151998 - BLOCK
      ?auto_151996 - BLOCK
      ?auto_151994 - BLOCK
      ?auto_151993 - BLOCK
      ?auto_151997 - BLOCK
      ?auto_151991 - BLOCK
      ?auto_151995 - BLOCK
      ?auto_151992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151990 ?auto_151998 ) ( not ( = ?auto_151990 ?auto_151998 ) ) ( not ( = ?auto_151990 ?auto_151996 ) ) ( not ( = ?auto_151990 ?auto_151994 ) ) ( not ( = ?auto_151998 ?auto_151996 ) ) ( not ( = ?auto_151998 ?auto_151994 ) ) ( not ( = ?auto_151996 ?auto_151994 ) ) ( ON ?auto_151996 ?auto_151990 ) ( ON-TABLE ?auto_151998 ) ( ON-TABLE ?auto_151993 ) ( ON ?auto_151997 ?auto_151993 ) ( not ( = ?auto_151993 ?auto_151997 ) ) ( not ( = ?auto_151993 ?auto_151991 ) ) ( not ( = ?auto_151993 ?auto_151995 ) ) ( not ( = ?auto_151993 ?auto_151992 ) ) ( not ( = ?auto_151993 ?auto_151994 ) ) ( not ( = ?auto_151997 ?auto_151991 ) ) ( not ( = ?auto_151997 ?auto_151995 ) ) ( not ( = ?auto_151997 ?auto_151992 ) ) ( not ( = ?auto_151997 ?auto_151994 ) ) ( not ( = ?auto_151991 ?auto_151995 ) ) ( not ( = ?auto_151991 ?auto_151992 ) ) ( not ( = ?auto_151991 ?auto_151994 ) ) ( not ( = ?auto_151995 ?auto_151992 ) ) ( not ( = ?auto_151995 ?auto_151994 ) ) ( not ( = ?auto_151992 ?auto_151994 ) ) ( not ( = ?auto_151990 ?auto_151992 ) ) ( not ( = ?auto_151990 ?auto_151993 ) ) ( not ( = ?auto_151990 ?auto_151997 ) ) ( not ( = ?auto_151990 ?auto_151991 ) ) ( not ( = ?auto_151990 ?auto_151995 ) ) ( not ( = ?auto_151998 ?auto_151992 ) ) ( not ( = ?auto_151998 ?auto_151993 ) ) ( not ( = ?auto_151998 ?auto_151997 ) ) ( not ( = ?auto_151998 ?auto_151991 ) ) ( not ( = ?auto_151998 ?auto_151995 ) ) ( not ( = ?auto_151996 ?auto_151992 ) ) ( not ( = ?auto_151996 ?auto_151993 ) ) ( not ( = ?auto_151996 ?auto_151997 ) ) ( not ( = ?auto_151996 ?auto_151991 ) ) ( not ( = ?auto_151996 ?auto_151995 ) ) ( ON ?auto_151994 ?auto_151996 ) ( ON ?auto_151992 ?auto_151994 ) ( ON ?auto_151995 ?auto_151992 ) ( CLEAR ?auto_151995 ) ( HOLDING ?auto_151991 ) ( CLEAR ?auto_151997 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_151993 ?auto_151997 ?auto_151991 )
      ( MAKE-1PILE ?auto_151990 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_151999 - BLOCK
    )
    :vars
    (
      ?auto_152005 - BLOCK
      ?auto_152006 - BLOCK
      ?auto_152001 - BLOCK
      ?auto_152003 - BLOCK
      ?auto_152004 - BLOCK
      ?auto_152002 - BLOCK
      ?auto_152007 - BLOCK
      ?auto_152000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_151999 ?auto_152005 ) ( not ( = ?auto_151999 ?auto_152005 ) ) ( not ( = ?auto_151999 ?auto_152006 ) ) ( not ( = ?auto_151999 ?auto_152001 ) ) ( not ( = ?auto_152005 ?auto_152006 ) ) ( not ( = ?auto_152005 ?auto_152001 ) ) ( not ( = ?auto_152006 ?auto_152001 ) ) ( ON ?auto_152006 ?auto_151999 ) ( ON-TABLE ?auto_152005 ) ( ON-TABLE ?auto_152003 ) ( ON ?auto_152004 ?auto_152003 ) ( not ( = ?auto_152003 ?auto_152004 ) ) ( not ( = ?auto_152003 ?auto_152002 ) ) ( not ( = ?auto_152003 ?auto_152007 ) ) ( not ( = ?auto_152003 ?auto_152000 ) ) ( not ( = ?auto_152003 ?auto_152001 ) ) ( not ( = ?auto_152004 ?auto_152002 ) ) ( not ( = ?auto_152004 ?auto_152007 ) ) ( not ( = ?auto_152004 ?auto_152000 ) ) ( not ( = ?auto_152004 ?auto_152001 ) ) ( not ( = ?auto_152002 ?auto_152007 ) ) ( not ( = ?auto_152002 ?auto_152000 ) ) ( not ( = ?auto_152002 ?auto_152001 ) ) ( not ( = ?auto_152007 ?auto_152000 ) ) ( not ( = ?auto_152007 ?auto_152001 ) ) ( not ( = ?auto_152000 ?auto_152001 ) ) ( not ( = ?auto_151999 ?auto_152000 ) ) ( not ( = ?auto_151999 ?auto_152003 ) ) ( not ( = ?auto_151999 ?auto_152004 ) ) ( not ( = ?auto_151999 ?auto_152002 ) ) ( not ( = ?auto_151999 ?auto_152007 ) ) ( not ( = ?auto_152005 ?auto_152000 ) ) ( not ( = ?auto_152005 ?auto_152003 ) ) ( not ( = ?auto_152005 ?auto_152004 ) ) ( not ( = ?auto_152005 ?auto_152002 ) ) ( not ( = ?auto_152005 ?auto_152007 ) ) ( not ( = ?auto_152006 ?auto_152000 ) ) ( not ( = ?auto_152006 ?auto_152003 ) ) ( not ( = ?auto_152006 ?auto_152004 ) ) ( not ( = ?auto_152006 ?auto_152002 ) ) ( not ( = ?auto_152006 ?auto_152007 ) ) ( ON ?auto_152001 ?auto_152006 ) ( ON ?auto_152000 ?auto_152001 ) ( ON ?auto_152007 ?auto_152000 ) ( CLEAR ?auto_152004 ) ( ON ?auto_152002 ?auto_152007 ) ( CLEAR ?auto_152002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152005 ?auto_151999 ?auto_152006 ?auto_152001 ?auto_152000 ?auto_152007 )
      ( MAKE-1PILE ?auto_151999 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_152008 - BLOCK
    )
    :vars
    (
      ?auto_152010 - BLOCK
      ?auto_152014 - BLOCK
      ?auto_152016 - BLOCK
      ?auto_152011 - BLOCK
      ?auto_152009 - BLOCK
      ?auto_152015 - BLOCK
      ?auto_152012 - BLOCK
      ?auto_152013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152008 ?auto_152010 ) ( not ( = ?auto_152008 ?auto_152010 ) ) ( not ( = ?auto_152008 ?auto_152014 ) ) ( not ( = ?auto_152008 ?auto_152016 ) ) ( not ( = ?auto_152010 ?auto_152014 ) ) ( not ( = ?auto_152010 ?auto_152016 ) ) ( not ( = ?auto_152014 ?auto_152016 ) ) ( ON ?auto_152014 ?auto_152008 ) ( ON-TABLE ?auto_152010 ) ( ON-TABLE ?auto_152011 ) ( not ( = ?auto_152011 ?auto_152009 ) ) ( not ( = ?auto_152011 ?auto_152015 ) ) ( not ( = ?auto_152011 ?auto_152012 ) ) ( not ( = ?auto_152011 ?auto_152013 ) ) ( not ( = ?auto_152011 ?auto_152016 ) ) ( not ( = ?auto_152009 ?auto_152015 ) ) ( not ( = ?auto_152009 ?auto_152012 ) ) ( not ( = ?auto_152009 ?auto_152013 ) ) ( not ( = ?auto_152009 ?auto_152016 ) ) ( not ( = ?auto_152015 ?auto_152012 ) ) ( not ( = ?auto_152015 ?auto_152013 ) ) ( not ( = ?auto_152015 ?auto_152016 ) ) ( not ( = ?auto_152012 ?auto_152013 ) ) ( not ( = ?auto_152012 ?auto_152016 ) ) ( not ( = ?auto_152013 ?auto_152016 ) ) ( not ( = ?auto_152008 ?auto_152013 ) ) ( not ( = ?auto_152008 ?auto_152011 ) ) ( not ( = ?auto_152008 ?auto_152009 ) ) ( not ( = ?auto_152008 ?auto_152015 ) ) ( not ( = ?auto_152008 ?auto_152012 ) ) ( not ( = ?auto_152010 ?auto_152013 ) ) ( not ( = ?auto_152010 ?auto_152011 ) ) ( not ( = ?auto_152010 ?auto_152009 ) ) ( not ( = ?auto_152010 ?auto_152015 ) ) ( not ( = ?auto_152010 ?auto_152012 ) ) ( not ( = ?auto_152014 ?auto_152013 ) ) ( not ( = ?auto_152014 ?auto_152011 ) ) ( not ( = ?auto_152014 ?auto_152009 ) ) ( not ( = ?auto_152014 ?auto_152015 ) ) ( not ( = ?auto_152014 ?auto_152012 ) ) ( ON ?auto_152016 ?auto_152014 ) ( ON ?auto_152013 ?auto_152016 ) ( ON ?auto_152012 ?auto_152013 ) ( ON ?auto_152015 ?auto_152012 ) ( CLEAR ?auto_152015 ) ( HOLDING ?auto_152009 ) ( CLEAR ?auto_152011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152011 ?auto_152009 )
      ( MAKE-1PILE ?auto_152008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_152017 - BLOCK
    )
    :vars
    (
      ?auto_152019 - BLOCK
      ?auto_152023 - BLOCK
      ?auto_152022 - BLOCK
      ?auto_152025 - BLOCK
      ?auto_152018 - BLOCK
      ?auto_152024 - BLOCK
      ?auto_152021 - BLOCK
      ?auto_152020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152017 ?auto_152019 ) ( not ( = ?auto_152017 ?auto_152019 ) ) ( not ( = ?auto_152017 ?auto_152023 ) ) ( not ( = ?auto_152017 ?auto_152022 ) ) ( not ( = ?auto_152019 ?auto_152023 ) ) ( not ( = ?auto_152019 ?auto_152022 ) ) ( not ( = ?auto_152023 ?auto_152022 ) ) ( ON ?auto_152023 ?auto_152017 ) ( ON-TABLE ?auto_152019 ) ( ON-TABLE ?auto_152025 ) ( not ( = ?auto_152025 ?auto_152018 ) ) ( not ( = ?auto_152025 ?auto_152024 ) ) ( not ( = ?auto_152025 ?auto_152021 ) ) ( not ( = ?auto_152025 ?auto_152020 ) ) ( not ( = ?auto_152025 ?auto_152022 ) ) ( not ( = ?auto_152018 ?auto_152024 ) ) ( not ( = ?auto_152018 ?auto_152021 ) ) ( not ( = ?auto_152018 ?auto_152020 ) ) ( not ( = ?auto_152018 ?auto_152022 ) ) ( not ( = ?auto_152024 ?auto_152021 ) ) ( not ( = ?auto_152024 ?auto_152020 ) ) ( not ( = ?auto_152024 ?auto_152022 ) ) ( not ( = ?auto_152021 ?auto_152020 ) ) ( not ( = ?auto_152021 ?auto_152022 ) ) ( not ( = ?auto_152020 ?auto_152022 ) ) ( not ( = ?auto_152017 ?auto_152020 ) ) ( not ( = ?auto_152017 ?auto_152025 ) ) ( not ( = ?auto_152017 ?auto_152018 ) ) ( not ( = ?auto_152017 ?auto_152024 ) ) ( not ( = ?auto_152017 ?auto_152021 ) ) ( not ( = ?auto_152019 ?auto_152020 ) ) ( not ( = ?auto_152019 ?auto_152025 ) ) ( not ( = ?auto_152019 ?auto_152018 ) ) ( not ( = ?auto_152019 ?auto_152024 ) ) ( not ( = ?auto_152019 ?auto_152021 ) ) ( not ( = ?auto_152023 ?auto_152020 ) ) ( not ( = ?auto_152023 ?auto_152025 ) ) ( not ( = ?auto_152023 ?auto_152018 ) ) ( not ( = ?auto_152023 ?auto_152024 ) ) ( not ( = ?auto_152023 ?auto_152021 ) ) ( ON ?auto_152022 ?auto_152023 ) ( ON ?auto_152020 ?auto_152022 ) ( ON ?auto_152021 ?auto_152020 ) ( ON ?auto_152024 ?auto_152021 ) ( CLEAR ?auto_152025 ) ( ON ?auto_152018 ?auto_152024 ) ( CLEAR ?auto_152018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152019 ?auto_152017 ?auto_152023 ?auto_152022 ?auto_152020 ?auto_152021 ?auto_152024 )
      ( MAKE-1PILE ?auto_152017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_152026 - BLOCK
    )
    :vars
    (
      ?auto_152032 - BLOCK
      ?auto_152029 - BLOCK
      ?auto_152027 - BLOCK
      ?auto_152031 - BLOCK
      ?auto_152033 - BLOCK
      ?auto_152030 - BLOCK
      ?auto_152034 - BLOCK
      ?auto_152028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152026 ?auto_152032 ) ( not ( = ?auto_152026 ?auto_152032 ) ) ( not ( = ?auto_152026 ?auto_152029 ) ) ( not ( = ?auto_152026 ?auto_152027 ) ) ( not ( = ?auto_152032 ?auto_152029 ) ) ( not ( = ?auto_152032 ?auto_152027 ) ) ( not ( = ?auto_152029 ?auto_152027 ) ) ( ON ?auto_152029 ?auto_152026 ) ( ON-TABLE ?auto_152032 ) ( not ( = ?auto_152031 ?auto_152033 ) ) ( not ( = ?auto_152031 ?auto_152030 ) ) ( not ( = ?auto_152031 ?auto_152034 ) ) ( not ( = ?auto_152031 ?auto_152028 ) ) ( not ( = ?auto_152031 ?auto_152027 ) ) ( not ( = ?auto_152033 ?auto_152030 ) ) ( not ( = ?auto_152033 ?auto_152034 ) ) ( not ( = ?auto_152033 ?auto_152028 ) ) ( not ( = ?auto_152033 ?auto_152027 ) ) ( not ( = ?auto_152030 ?auto_152034 ) ) ( not ( = ?auto_152030 ?auto_152028 ) ) ( not ( = ?auto_152030 ?auto_152027 ) ) ( not ( = ?auto_152034 ?auto_152028 ) ) ( not ( = ?auto_152034 ?auto_152027 ) ) ( not ( = ?auto_152028 ?auto_152027 ) ) ( not ( = ?auto_152026 ?auto_152028 ) ) ( not ( = ?auto_152026 ?auto_152031 ) ) ( not ( = ?auto_152026 ?auto_152033 ) ) ( not ( = ?auto_152026 ?auto_152030 ) ) ( not ( = ?auto_152026 ?auto_152034 ) ) ( not ( = ?auto_152032 ?auto_152028 ) ) ( not ( = ?auto_152032 ?auto_152031 ) ) ( not ( = ?auto_152032 ?auto_152033 ) ) ( not ( = ?auto_152032 ?auto_152030 ) ) ( not ( = ?auto_152032 ?auto_152034 ) ) ( not ( = ?auto_152029 ?auto_152028 ) ) ( not ( = ?auto_152029 ?auto_152031 ) ) ( not ( = ?auto_152029 ?auto_152033 ) ) ( not ( = ?auto_152029 ?auto_152030 ) ) ( not ( = ?auto_152029 ?auto_152034 ) ) ( ON ?auto_152027 ?auto_152029 ) ( ON ?auto_152028 ?auto_152027 ) ( ON ?auto_152034 ?auto_152028 ) ( ON ?auto_152030 ?auto_152034 ) ( ON ?auto_152033 ?auto_152030 ) ( CLEAR ?auto_152033 ) ( HOLDING ?auto_152031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152031 )
      ( MAKE-1PILE ?auto_152026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_152035 - BLOCK
    )
    :vars
    (
      ?auto_152042 - BLOCK
      ?auto_152041 - BLOCK
      ?auto_152040 - BLOCK
      ?auto_152036 - BLOCK
      ?auto_152038 - BLOCK
      ?auto_152043 - BLOCK
      ?auto_152037 - BLOCK
      ?auto_152039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152035 ?auto_152042 ) ( not ( = ?auto_152035 ?auto_152042 ) ) ( not ( = ?auto_152035 ?auto_152041 ) ) ( not ( = ?auto_152035 ?auto_152040 ) ) ( not ( = ?auto_152042 ?auto_152041 ) ) ( not ( = ?auto_152042 ?auto_152040 ) ) ( not ( = ?auto_152041 ?auto_152040 ) ) ( ON ?auto_152041 ?auto_152035 ) ( ON-TABLE ?auto_152042 ) ( not ( = ?auto_152036 ?auto_152038 ) ) ( not ( = ?auto_152036 ?auto_152043 ) ) ( not ( = ?auto_152036 ?auto_152037 ) ) ( not ( = ?auto_152036 ?auto_152039 ) ) ( not ( = ?auto_152036 ?auto_152040 ) ) ( not ( = ?auto_152038 ?auto_152043 ) ) ( not ( = ?auto_152038 ?auto_152037 ) ) ( not ( = ?auto_152038 ?auto_152039 ) ) ( not ( = ?auto_152038 ?auto_152040 ) ) ( not ( = ?auto_152043 ?auto_152037 ) ) ( not ( = ?auto_152043 ?auto_152039 ) ) ( not ( = ?auto_152043 ?auto_152040 ) ) ( not ( = ?auto_152037 ?auto_152039 ) ) ( not ( = ?auto_152037 ?auto_152040 ) ) ( not ( = ?auto_152039 ?auto_152040 ) ) ( not ( = ?auto_152035 ?auto_152039 ) ) ( not ( = ?auto_152035 ?auto_152036 ) ) ( not ( = ?auto_152035 ?auto_152038 ) ) ( not ( = ?auto_152035 ?auto_152043 ) ) ( not ( = ?auto_152035 ?auto_152037 ) ) ( not ( = ?auto_152042 ?auto_152039 ) ) ( not ( = ?auto_152042 ?auto_152036 ) ) ( not ( = ?auto_152042 ?auto_152038 ) ) ( not ( = ?auto_152042 ?auto_152043 ) ) ( not ( = ?auto_152042 ?auto_152037 ) ) ( not ( = ?auto_152041 ?auto_152039 ) ) ( not ( = ?auto_152041 ?auto_152036 ) ) ( not ( = ?auto_152041 ?auto_152038 ) ) ( not ( = ?auto_152041 ?auto_152043 ) ) ( not ( = ?auto_152041 ?auto_152037 ) ) ( ON ?auto_152040 ?auto_152041 ) ( ON ?auto_152039 ?auto_152040 ) ( ON ?auto_152037 ?auto_152039 ) ( ON ?auto_152043 ?auto_152037 ) ( ON ?auto_152038 ?auto_152043 ) ( ON ?auto_152036 ?auto_152038 ) ( CLEAR ?auto_152036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152042 ?auto_152035 ?auto_152041 ?auto_152040 ?auto_152039 ?auto_152037 ?auto_152043 ?auto_152038 )
      ( MAKE-1PILE ?auto_152035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_152057 - BLOCK
      ?auto_152058 - BLOCK
      ?auto_152059 - BLOCK
      ?auto_152060 - BLOCK
      ?auto_152061 - BLOCK
      ?auto_152062 - BLOCK
    )
    :vars
    (
      ?auto_152063 - BLOCK
      ?auto_152064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152063 ?auto_152062 ) ( CLEAR ?auto_152063 ) ( ON-TABLE ?auto_152057 ) ( ON ?auto_152058 ?auto_152057 ) ( ON ?auto_152059 ?auto_152058 ) ( ON ?auto_152060 ?auto_152059 ) ( ON ?auto_152061 ?auto_152060 ) ( ON ?auto_152062 ?auto_152061 ) ( not ( = ?auto_152057 ?auto_152058 ) ) ( not ( = ?auto_152057 ?auto_152059 ) ) ( not ( = ?auto_152057 ?auto_152060 ) ) ( not ( = ?auto_152057 ?auto_152061 ) ) ( not ( = ?auto_152057 ?auto_152062 ) ) ( not ( = ?auto_152057 ?auto_152063 ) ) ( not ( = ?auto_152058 ?auto_152059 ) ) ( not ( = ?auto_152058 ?auto_152060 ) ) ( not ( = ?auto_152058 ?auto_152061 ) ) ( not ( = ?auto_152058 ?auto_152062 ) ) ( not ( = ?auto_152058 ?auto_152063 ) ) ( not ( = ?auto_152059 ?auto_152060 ) ) ( not ( = ?auto_152059 ?auto_152061 ) ) ( not ( = ?auto_152059 ?auto_152062 ) ) ( not ( = ?auto_152059 ?auto_152063 ) ) ( not ( = ?auto_152060 ?auto_152061 ) ) ( not ( = ?auto_152060 ?auto_152062 ) ) ( not ( = ?auto_152060 ?auto_152063 ) ) ( not ( = ?auto_152061 ?auto_152062 ) ) ( not ( = ?auto_152061 ?auto_152063 ) ) ( not ( = ?auto_152062 ?auto_152063 ) ) ( HOLDING ?auto_152064 ) ( not ( = ?auto_152057 ?auto_152064 ) ) ( not ( = ?auto_152058 ?auto_152064 ) ) ( not ( = ?auto_152059 ?auto_152064 ) ) ( not ( = ?auto_152060 ?auto_152064 ) ) ( not ( = ?auto_152061 ?auto_152064 ) ) ( not ( = ?auto_152062 ?auto_152064 ) ) ( not ( = ?auto_152063 ?auto_152064 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_152064 )
      ( MAKE-6PILE ?auto_152057 ?auto_152058 ?auto_152059 ?auto_152060 ?auto_152061 ?auto_152062 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152182 - BLOCK
      ?auto_152183 - BLOCK
    )
    :vars
    (
      ?auto_152184 - BLOCK
      ?auto_152187 - BLOCK
      ?auto_152189 - BLOCK
      ?auto_152185 - BLOCK
      ?auto_152186 - BLOCK
      ?auto_152188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152182 ?auto_152183 ) ) ( ON ?auto_152183 ?auto_152184 ) ( not ( = ?auto_152182 ?auto_152184 ) ) ( not ( = ?auto_152183 ?auto_152184 ) ) ( ON ?auto_152182 ?auto_152183 ) ( CLEAR ?auto_152182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152187 ) ( ON ?auto_152189 ?auto_152187 ) ( ON ?auto_152185 ?auto_152189 ) ( ON ?auto_152186 ?auto_152185 ) ( ON ?auto_152188 ?auto_152186 ) ( ON ?auto_152184 ?auto_152188 ) ( not ( = ?auto_152187 ?auto_152189 ) ) ( not ( = ?auto_152187 ?auto_152185 ) ) ( not ( = ?auto_152187 ?auto_152186 ) ) ( not ( = ?auto_152187 ?auto_152188 ) ) ( not ( = ?auto_152187 ?auto_152184 ) ) ( not ( = ?auto_152187 ?auto_152183 ) ) ( not ( = ?auto_152187 ?auto_152182 ) ) ( not ( = ?auto_152189 ?auto_152185 ) ) ( not ( = ?auto_152189 ?auto_152186 ) ) ( not ( = ?auto_152189 ?auto_152188 ) ) ( not ( = ?auto_152189 ?auto_152184 ) ) ( not ( = ?auto_152189 ?auto_152183 ) ) ( not ( = ?auto_152189 ?auto_152182 ) ) ( not ( = ?auto_152185 ?auto_152186 ) ) ( not ( = ?auto_152185 ?auto_152188 ) ) ( not ( = ?auto_152185 ?auto_152184 ) ) ( not ( = ?auto_152185 ?auto_152183 ) ) ( not ( = ?auto_152185 ?auto_152182 ) ) ( not ( = ?auto_152186 ?auto_152188 ) ) ( not ( = ?auto_152186 ?auto_152184 ) ) ( not ( = ?auto_152186 ?auto_152183 ) ) ( not ( = ?auto_152186 ?auto_152182 ) ) ( not ( = ?auto_152188 ?auto_152184 ) ) ( not ( = ?auto_152188 ?auto_152183 ) ) ( not ( = ?auto_152188 ?auto_152182 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152187 ?auto_152189 ?auto_152185 ?auto_152186 ?auto_152188 ?auto_152184 ?auto_152183 )
      ( MAKE-2PILE ?auto_152182 ?auto_152183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152192 - BLOCK
      ?auto_152193 - BLOCK
    )
    :vars
    (
      ?auto_152194 - BLOCK
      ?auto_152195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152192 ?auto_152193 ) ) ( ON ?auto_152193 ?auto_152194 ) ( CLEAR ?auto_152193 ) ( not ( = ?auto_152192 ?auto_152194 ) ) ( not ( = ?auto_152193 ?auto_152194 ) ) ( ON ?auto_152192 ?auto_152195 ) ( CLEAR ?auto_152192 ) ( HAND-EMPTY ) ( not ( = ?auto_152192 ?auto_152195 ) ) ( not ( = ?auto_152193 ?auto_152195 ) ) ( not ( = ?auto_152194 ?auto_152195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152192 ?auto_152195 )
      ( MAKE-2PILE ?auto_152192 ?auto_152193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152196 - BLOCK
      ?auto_152197 - BLOCK
    )
    :vars
    (
      ?auto_152199 - BLOCK
      ?auto_152198 - BLOCK
      ?auto_152200 - BLOCK
      ?auto_152203 - BLOCK
      ?auto_152202 - BLOCK
      ?auto_152204 - BLOCK
      ?auto_152201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152196 ?auto_152197 ) ) ( not ( = ?auto_152196 ?auto_152199 ) ) ( not ( = ?auto_152197 ?auto_152199 ) ) ( ON ?auto_152196 ?auto_152198 ) ( CLEAR ?auto_152196 ) ( not ( = ?auto_152196 ?auto_152198 ) ) ( not ( = ?auto_152197 ?auto_152198 ) ) ( not ( = ?auto_152199 ?auto_152198 ) ) ( HOLDING ?auto_152197 ) ( CLEAR ?auto_152199 ) ( ON-TABLE ?auto_152200 ) ( ON ?auto_152203 ?auto_152200 ) ( ON ?auto_152202 ?auto_152203 ) ( ON ?auto_152204 ?auto_152202 ) ( ON ?auto_152201 ?auto_152204 ) ( ON ?auto_152199 ?auto_152201 ) ( not ( = ?auto_152200 ?auto_152203 ) ) ( not ( = ?auto_152200 ?auto_152202 ) ) ( not ( = ?auto_152200 ?auto_152204 ) ) ( not ( = ?auto_152200 ?auto_152201 ) ) ( not ( = ?auto_152200 ?auto_152199 ) ) ( not ( = ?auto_152200 ?auto_152197 ) ) ( not ( = ?auto_152203 ?auto_152202 ) ) ( not ( = ?auto_152203 ?auto_152204 ) ) ( not ( = ?auto_152203 ?auto_152201 ) ) ( not ( = ?auto_152203 ?auto_152199 ) ) ( not ( = ?auto_152203 ?auto_152197 ) ) ( not ( = ?auto_152202 ?auto_152204 ) ) ( not ( = ?auto_152202 ?auto_152201 ) ) ( not ( = ?auto_152202 ?auto_152199 ) ) ( not ( = ?auto_152202 ?auto_152197 ) ) ( not ( = ?auto_152204 ?auto_152201 ) ) ( not ( = ?auto_152204 ?auto_152199 ) ) ( not ( = ?auto_152204 ?auto_152197 ) ) ( not ( = ?auto_152201 ?auto_152199 ) ) ( not ( = ?auto_152201 ?auto_152197 ) ) ( not ( = ?auto_152196 ?auto_152200 ) ) ( not ( = ?auto_152196 ?auto_152203 ) ) ( not ( = ?auto_152196 ?auto_152202 ) ) ( not ( = ?auto_152196 ?auto_152204 ) ) ( not ( = ?auto_152196 ?auto_152201 ) ) ( not ( = ?auto_152198 ?auto_152200 ) ) ( not ( = ?auto_152198 ?auto_152203 ) ) ( not ( = ?auto_152198 ?auto_152202 ) ) ( not ( = ?auto_152198 ?auto_152204 ) ) ( not ( = ?auto_152198 ?auto_152201 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152200 ?auto_152203 ?auto_152202 ?auto_152204 ?auto_152201 ?auto_152199 ?auto_152197 )
      ( MAKE-2PILE ?auto_152196 ?auto_152197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152205 - BLOCK
      ?auto_152206 - BLOCK
    )
    :vars
    (
      ?auto_152211 - BLOCK
      ?auto_152210 - BLOCK
      ?auto_152213 - BLOCK
      ?auto_152212 - BLOCK
      ?auto_152209 - BLOCK
      ?auto_152207 - BLOCK
      ?auto_152208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152205 ?auto_152206 ) ) ( not ( = ?auto_152205 ?auto_152211 ) ) ( not ( = ?auto_152206 ?auto_152211 ) ) ( ON ?auto_152205 ?auto_152210 ) ( not ( = ?auto_152205 ?auto_152210 ) ) ( not ( = ?auto_152206 ?auto_152210 ) ) ( not ( = ?auto_152211 ?auto_152210 ) ) ( CLEAR ?auto_152211 ) ( ON-TABLE ?auto_152213 ) ( ON ?auto_152212 ?auto_152213 ) ( ON ?auto_152209 ?auto_152212 ) ( ON ?auto_152207 ?auto_152209 ) ( ON ?auto_152208 ?auto_152207 ) ( ON ?auto_152211 ?auto_152208 ) ( not ( = ?auto_152213 ?auto_152212 ) ) ( not ( = ?auto_152213 ?auto_152209 ) ) ( not ( = ?auto_152213 ?auto_152207 ) ) ( not ( = ?auto_152213 ?auto_152208 ) ) ( not ( = ?auto_152213 ?auto_152211 ) ) ( not ( = ?auto_152213 ?auto_152206 ) ) ( not ( = ?auto_152212 ?auto_152209 ) ) ( not ( = ?auto_152212 ?auto_152207 ) ) ( not ( = ?auto_152212 ?auto_152208 ) ) ( not ( = ?auto_152212 ?auto_152211 ) ) ( not ( = ?auto_152212 ?auto_152206 ) ) ( not ( = ?auto_152209 ?auto_152207 ) ) ( not ( = ?auto_152209 ?auto_152208 ) ) ( not ( = ?auto_152209 ?auto_152211 ) ) ( not ( = ?auto_152209 ?auto_152206 ) ) ( not ( = ?auto_152207 ?auto_152208 ) ) ( not ( = ?auto_152207 ?auto_152211 ) ) ( not ( = ?auto_152207 ?auto_152206 ) ) ( not ( = ?auto_152208 ?auto_152211 ) ) ( not ( = ?auto_152208 ?auto_152206 ) ) ( not ( = ?auto_152205 ?auto_152213 ) ) ( not ( = ?auto_152205 ?auto_152212 ) ) ( not ( = ?auto_152205 ?auto_152209 ) ) ( not ( = ?auto_152205 ?auto_152207 ) ) ( not ( = ?auto_152205 ?auto_152208 ) ) ( not ( = ?auto_152210 ?auto_152213 ) ) ( not ( = ?auto_152210 ?auto_152212 ) ) ( not ( = ?auto_152210 ?auto_152209 ) ) ( not ( = ?auto_152210 ?auto_152207 ) ) ( not ( = ?auto_152210 ?auto_152208 ) ) ( ON ?auto_152206 ?auto_152205 ) ( CLEAR ?auto_152206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152210 ?auto_152205 )
      ( MAKE-2PILE ?auto_152205 ?auto_152206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152214 - BLOCK
      ?auto_152215 - BLOCK
    )
    :vars
    (
      ?auto_152219 - BLOCK
      ?auto_152221 - BLOCK
      ?auto_152220 - BLOCK
      ?auto_152216 - BLOCK
      ?auto_152218 - BLOCK
      ?auto_152217 - BLOCK
      ?auto_152222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152214 ?auto_152215 ) ) ( not ( = ?auto_152214 ?auto_152219 ) ) ( not ( = ?auto_152215 ?auto_152219 ) ) ( ON ?auto_152214 ?auto_152221 ) ( not ( = ?auto_152214 ?auto_152221 ) ) ( not ( = ?auto_152215 ?auto_152221 ) ) ( not ( = ?auto_152219 ?auto_152221 ) ) ( ON-TABLE ?auto_152220 ) ( ON ?auto_152216 ?auto_152220 ) ( ON ?auto_152218 ?auto_152216 ) ( ON ?auto_152217 ?auto_152218 ) ( ON ?auto_152222 ?auto_152217 ) ( not ( = ?auto_152220 ?auto_152216 ) ) ( not ( = ?auto_152220 ?auto_152218 ) ) ( not ( = ?auto_152220 ?auto_152217 ) ) ( not ( = ?auto_152220 ?auto_152222 ) ) ( not ( = ?auto_152220 ?auto_152219 ) ) ( not ( = ?auto_152220 ?auto_152215 ) ) ( not ( = ?auto_152216 ?auto_152218 ) ) ( not ( = ?auto_152216 ?auto_152217 ) ) ( not ( = ?auto_152216 ?auto_152222 ) ) ( not ( = ?auto_152216 ?auto_152219 ) ) ( not ( = ?auto_152216 ?auto_152215 ) ) ( not ( = ?auto_152218 ?auto_152217 ) ) ( not ( = ?auto_152218 ?auto_152222 ) ) ( not ( = ?auto_152218 ?auto_152219 ) ) ( not ( = ?auto_152218 ?auto_152215 ) ) ( not ( = ?auto_152217 ?auto_152222 ) ) ( not ( = ?auto_152217 ?auto_152219 ) ) ( not ( = ?auto_152217 ?auto_152215 ) ) ( not ( = ?auto_152222 ?auto_152219 ) ) ( not ( = ?auto_152222 ?auto_152215 ) ) ( not ( = ?auto_152214 ?auto_152220 ) ) ( not ( = ?auto_152214 ?auto_152216 ) ) ( not ( = ?auto_152214 ?auto_152218 ) ) ( not ( = ?auto_152214 ?auto_152217 ) ) ( not ( = ?auto_152214 ?auto_152222 ) ) ( not ( = ?auto_152221 ?auto_152220 ) ) ( not ( = ?auto_152221 ?auto_152216 ) ) ( not ( = ?auto_152221 ?auto_152218 ) ) ( not ( = ?auto_152221 ?auto_152217 ) ) ( not ( = ?auto_152221 ?auto_152222 ) ) ( ON ?auto_152215 ?auto_152214 ) ( CLEAR ?auto_152215 ) ( ON-TABLE ?auto_152221 ) ( HOLDING ?auto_152219 ) ( CLEAR ?auto_152222 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152220 ?auto_152216 ?auto_152218 ?auto_152217 ?auto_152222 ?auto_152219 )
      ( MAKE-2PILE ?auto_152214 ?auto_152215 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152223 - BLOCK
      ?auto_152224 - BLOCK
    )
    :vars
    (
      ?auto_152230 - BLOCK
      ?auto_152227 - BLOCK
      ?auto_152226 - BLOCK
      ?auto_152231 - BLOCK
      ?auto_152225 - BLOCK
      ?auto_152229 - BLOCK
      ?auto_152228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152223 ?auto_152224 ) ) ( not ( = ?auto_152223 ?auto_152230 ) ) ( not ( = ?auto_152224 ?auto_152230 ) ) ( ON ?auto_152223 ?auto_152227 ) ( not ( = ?auto_152223 ?auto_152227 ) ) ( not ( = ?auto_152224 ?auto_152227 ) ) ( not ( = ?auto_152230 ?auto_152227 ) ) ( ON-TABLE ?auto_152226 ) ( ON ?auto_152231 ?auto_152226 ) ( ON ?auto_152225 ?auto_152231 ) ( ON ?auto_152229 ?auto_152225 ) ( ON ?auto_152228 ?auto_152229 ) ( not ( = ?auto_152226 ?auto_152231 ) ) ( not ( = ?auto_152226 ?auto_152225 ) ) ( not ( = ?auto_152226 ?auto_152229 ) ) ( not ( = ?auto_152226 ?auto_152228 ) ) ( not ( = ?auto_152226 ?auto_152230 ) ) ( not ( = ?auto_152226 ?auto_152224 ) ) ( not ( = ?auto_152231 ?auto_152225 ) ) ( not ( = ?auto_152231 ?auto_152229 ) ) ( not ( = ?auto_152231 ?auto_152228 ) ) ( not ( = ?auto_152231 ?auto_152230 ) ) ( not ( = ?auto_152231 ?auto_152224 ) ) ( not ( = ?auto_152225 ?auto_152229 ) ) ( not ( = ?auto_152225 ?auto_152228 ) ) ( not ( = ?auto_152225 ?auto_152230 ) ) ( not ( = ?auto_152225 ?auto_152224 ) ) ( not ( = ?auto_152229 ?auto_152228 ) ) ( not ( = ?auto_152229 ?auto_152230 ) ) ( not ( = ?auto_152229 ?auto_152224 ) ) ( not ( = ?auto_152228 ?auto_152230 ) ) ( not ( = ?auto_152228 ?auto_152224 ) ) ( not ( = ?auto_152223 ?auto_152226 ) ) ( not ( = ?auto_152223 ?auto_152231 ) ) ( not ( = ?auto_152223 ?auto_152225 ) ) ( not ( = ?auto_152223 ?auto_152229 ) ) ( not ( = ?auto_152223 ?auto_152228 ) ) ( not ( = ?auto_152227 ?auto_152226 ) ) ( not ( = ?auto_152227 ?auto_152231 ) ) ( not ( = ?auto_152227 ?auto_152225 ) ) ( not ( = ?auto_152227 ?auto_152229 ) ) ( not ( = ?auto_152227 ?auto_152228 ) ) ( ON ?auto_152224 ?auto_152223 ) ( ON-TABLE ?auto_152227 ) ( CLEAR ?auto_152228 ) ( ON ?auto_152230 ?auto_152224 ) ( CLEAR ?auto_152230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152227 ?auto_152223 ?auto_152224 )
      ( MAKE-2PILE ?auto_152223 ?auto_152224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152232 - BLOCK
      ?auto_152233 - BLOCK
    )
    :vars
    (
      ?auto_152236 - BLOCK
      ?auto_152234 - BLOCK
      ?auto_152235 - BLOCK
      ?auto_152240 - BLOCK
      ?auto_152239 - BLOCK
      ?auto_152238 - BLOCK
      ?auto_152237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152232 ?auto_152233 ) ) ( not ( = ?auto_152232 ?auto_152236 ) ) ( not ( = ?auto_152233 ?auto_152236 ) ) ( ON ?auto_152232 ?auto_152234 ) ( not ( = ?auto_152232 ?auto_152234 ) ) ( not ( = ?auto_152233 ?auto_152234 ) ) ( not ( = ?auto_152236 ?auto_152234 ) ) ( ON-TABLE ?auto_152235 ) ( ON ?auto_152240 ?auto_152235 ) ( ON ?auto_152239 ?auto_152240 ) ( ON ?auto_152238 ?auto_152239 ) ( not ( = ?auto_152235 ?auto_152240 ) ) ( not ( = ?auto_152235 ?auto_152239 ) ) ( not ( = ?auto_152235 ?auto_152238 ) ) ( not ( = ?auto_152235 ?auto_152237 ) ) ( not ( = ?auto_152235 ?auto_152236 ) ) ( not ( = ?auto_152235 ?auto_152233 ) ) ( not ( = ?auto_152240 ?auto_152239 ) ) ( not ( = ?auto_152240 ?auto_152238 ) ) ( not ( = ?auto_152240 ?auto_152237 ) ) ( not ( = ?auto_152240 ?auto_152236 ) ) ( not ( = ?auto_152240 ?auto_152233 ) ) ( not ( = ?auto_152239 ?auto_152238 ) ) ( not ( = ?auto_152239 ?auto_152237 ) ) ( not ( = ?auto_152239 ?auto_152236 ) ) ( not ( = ?auto_152239 ?auto_152233 ) ) ( not ( = ?auto_152238 ?auto_152237 ) ) ( not ( = ?auto_152238 ?auto_152236 ) ) ( not ( = ?auto_152238 ?auto_152233 ) ) ( not ( = ?auto_152237 ?auto_152236 ) ) ( not ( = ?auto_152237 ?auto_152233 ) ) ( not ( = ?auto_152232 ?auto_152235 ) ) ( not ( = ?auto_152232 ?auto_152240 ) ) ( not ( = ?auto_152232 ?auto_152239 ) ) ( not ( = ?auto_152232 ?auto_152238 ) ) ( not ( = ?auto_152232 ?auto_152237 ) ) ( not ( = ?auto_152234 ?auto_152235 ) ) ( not ( = ?auto_152234 ?auto_152240 ) ) ( not ( = ?auto_152234 ?auto_152239 ) ) ( not ( = ?auto_152234 ?auto_152238 ) ) ( not ( = ?auto_152234 ?auto_152237 ) ) ( ON ?auto_152233 ?auto_152232 ) ( ON-TABLE ?auto_152234 ) ( ON ?auto_152236 ?auto_152233 ) ( CLEAR ?auto_152236 ) ( HOLDING ?auto_152237 ) ( CLEAR ?auto_152238 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152235 ?auto_152240 ?auto_152239 ?auto_152238 ?auto_152237 )
      ( MAKE-2PILE ?auto_152232 ?auto_152233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152241 - BLOCK
      ?auto_152242 - BLOCK
    )
    :vars
    (
      ?auto_152248 - BLOCK
      ?auto_152246 - BLOCK
      ?auto_152244 - BLOCK
      ?auto_152247 - BLOCK
      ?auto_152249 - BLOCK
      ?auto_152243 - BLOCK
      ?auto_152245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152241 ?auto_152242 ) ) ( not ( = ?auto_152241 ?auto_152248 ) ) ( not ( = ?auto_152242 ?auto_152248 ) ) ( ON ?auto_152241 ?auto_152246 ) ( not ( = ?auto_152241 ?auto_152246 ) ) ( not ( = ?auto_152242 ?auto_152246 ) ) ( not ( = ?auto_152248 ?auto_152246 ) ) ( ON-TABLE ?auto_152244 ) ( ON ?auto_152247 ?auto_152244 ) ( ON ?auto_152249 ?auto_152247 ) ( ON ?auto_152243 ?auto_152249 ) ( not ( = ?auto_152244 ?auto_152247 ) ) ( not ( = ?auto_152244 ?auto_152249 ) ) ( not ( = ?auto_152244 ?auto_152243 ) ) ( not ( = ?auto_152244 ?auto_152245 ) ) ( not ( = ?auto_152244 ?auto_152248 ) ) ( not ( = ?auto_152244 ?auto_152242 ) ) ( not ( = ?auto_152247 ?auto_152249 ) ) ( not ( = ?auto_152247 ?auto_152243 ) ) ( not ( = ?auto_152247 ?auto_152245 ) ) ( not ( = ?auto_152247 ?auto_152248 ) ) ( not ( = ?auto_152247 ?auto_152242 ) ) ( not ( = ?auto_152249 ?auto_152243 ) ) ( not ( = ?auto_152249 ?auto_152245 ) ) ( not ( = ?auto_152249 ?auto_152248 ) ) ( not ( = ?auto_152249 ?auto_152242 ) ) ( not ( = ?auto_152243 ?auto_152245 ) ) ( not ( = ?auto_152243 ?auto_152248 ) ) ( not ( = ?auto_152243 ?auto_152242 ) ) ( not ( = ?auto_152245 ?auto_152248 ) ) ( not ( = ?auto_152245 ?auto_152242 ) ) ( not ( = ?auto_152241 ?auto_152244 ) ) ( not ( = ?auto_152241 ?auto_152247 ) ) ( not ( = ?auto_152241 ?auto_152249 ) ) ( not ( = ?auto_152241 ?auto_152243 ) ) ( not ( = ?auto_152241 ?auto_152245 ) ) ( not ( = ?auto_152246 ?auto_152244 ) ) ( not ( = ?auto_152246 ?auto_152247 ) ) ( not ( = ?auto_152246 ?auto_152249 ) ) ( not ( = ?auto_152246 ?auto_152243 ) ) ( not ( = ?auto_152246 ?auto_152245 ) ) ( ON ?auto_152242 ?auto_152241 ) ( ON-TABLE ?auto_152246 ) ( ON ?auto_152248 ?auto_152242 ) ( CLEAR ?auto_152243 ) ( ON ?auto_152245 ?auto_152248 ) ( CLEAR ?auto_152245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152246 ?auto_152241 ?auto_152242 ?auto_152248 )
      ( MAKE-2PILE ?auto_152241 ?auto_152242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152250 - BLOCK
      ?auto_152251 - BLOCK
    )
    :vars
    (
      ?auto_152254 - BLOCK
      ?auto_152256 - BLOCK
      ?auto_152255 - BLOCK
      ?auto_152258 - BLOCK
      ?auto_152253 - BLOCK
      ?auto_152252 - BLOCK
      ?auto_152257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152250 ?auto_152251 ) ) ( not ( = ?auto_152250 ?auto_152254 ) ) ( not ( = ?auto_152251 ?auto_152254 ) ) ( ON ?auto_152250 ?auto_152256 ) ( not ( = ?auto_152250 ?auto_152256 ) ) ( not ( = ?auto_152251 ?auto_152256 ) ) ( not ( = ?auto_152254 ?auto_152256 ) ) ( ON-TABLE ?auto_152255 ) ( ON ?auto_152258 ?auto_152255 ) ( ON ?auto_152253 ?auto_152258 ) ( not ( = ?auto_152255 ?auto_152258 ) ) ( not ( = ?auto_152255 ?auto_152253 ) ) ( not ( = ?auto_152255 ?auto_152252 ) ) ( not ( = ?auto_152255 ?auto_152257 ) ) ( not ( = ?auto_152255 ?auto_152254 ) ) ( not ( = ?auto_152255 ?auto_152251 ) ) ( not ( = ?auto_152258 ?auto_152253 ) ) ( not ( = ?auto_152258 ?auto_152252 ) ) ( not ( = ?auto_152258 ?auto_152257 ) ) ( not ( = ?auto_152258 ?auto_152254 ) ) ( not ( = ?auto_152258 ?auto_152251 ) ) ( not ( = ?auto_152253 ?auto_152252 ) ) ( not ( = ?auto_152253 ?auto_152257 ) ) ( not ( = ?auto_152253 ?auto_152254 ) ) ( not ( = ?auto_152253 ?auto_152251 ) ) ( not ( = ?auto_152252 ?auto_152257 ) ) ( not ( = ?auto_152252 ?auto_152254 ) ) ( not ( = ?auto_152252 ?auto_152251 ) ) ( not ( = ?auto_152257 ?auto_152254 ) ) ( not ( = ?auto_152257 ?auto_152251 ) ) ( not ( = ?auto_152250 ?auto_152255 ) ) ( not ( = ?auto_152250 ?auto_152258 ) ) ( not ( = ?auto_152250 ?auto_152253 ) ) ( not ( = ?auto_152250 ?auto_152252 ) ) ( not ( = ?auto_152250 ?auto_152257 ) ) ( not ( = ?auto_152256 ?auto_152255 ) ) ( not ( = ?auto_152256 ?auto_152258 ) ) ( not ( = ?auto_152256 ?auto_152253 ) ) ( not ( = ?auto_152256 ?auto_152252 ) ) ( not ( = ?auto_152256 ?auto_152257 ) ) ( ON ?auto_152251 ?auto_152250 ) ( ON-TABLE ?auto_152256 ) ( ON ?auto_152254 ?auto_152251 ) ( ON ?auto_152257 ?auto_152254 ) ( CLEAR ?auto_152257 ) ( HOLDING ?auto_152252 ) ( CLEAR ?auto_152253 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152255 ?auto_152258 ?auto_152253 ?auto_152252 )
      ( MAKE-2PILE ?auto_152250 ?auto_152251 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152259 - BLOCK
      ?auto_152260 - BLOCK
    )
    :vars
    (
      ?auto_152265 - BLOCK
      ?auto_152263 - BLOCK
      ?auto_152266 - BLOCK
      ?auto_152264 - BLOCK
      ?auto_152267 - BLOCK
      ?auto_152261 - BLOCK
      ?auto_152262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152259 ?auto_152260 ) ) ( not ( = ?auto_152259 ?auto_152265 ) ) ( not ( = ?auto_152260 ?auto_152265 ) ) ( ON ?auto_152259 ?auto_152263 ) ( not ( = ?auto_152259 ?auto_152263 ) ) ( not ( = ?auto_152260 ?auto_152263 ) ) ( not ( = ?auto_152265 ?auto_152263 ) ) ( ON-TABLE ?auto_152266 ) ( ON ?auto_152264 ?auto_152266 ) ( ON ?auto_152267 ?auto_152264 ) ( not ( = ?auto_152266 ?auto_152264 ) ) ( not ( = ?auto_152266 ?auto_152267 ) ) ( not ( = ?auto_152266 ?auto_152261 ) ) ( not ( = ?auto_152266 ?auto_152262 ) ) ( not ( = ?auto_152266 ?auto_152265 ) ) ( not ( = ?auto_152266 ?auto_152260 ) ) ( not ( = ?auto_152264 ?auto_152267 ) ) ( not ( = ?auto_152264 ?auto_152261 ) ) ( not ( = ?auto_152264 ?auto_152262 ) ) ( not ( = ?auto_152264 ?auto_152265 ) ) ( not ( = ?auto_152264 ?auto_152260 ) ) ( not ( = ?auto_152267 ?auto_152261 ) ) ( not ( = ?auto_152267 ?auto_152262 ) ) ( not ( = ?auto_152267 ?auto_152265 ) ) ( not ( = ?auto_152267 ?auto_152260 ) ) ( not ( = ?auto_152261 ?auto_152262 ) ) ( not ( = ?auto_152261 ?auto_152265 ) ) ( not ( = ?auto_152261 ?auto_152260 ) ) ( not ( = ?auto_152262 ?auto_152265 ) ) ( not ( = ?auto_152262 ?auto_152260 ) ) ( not ( = ?auto_152259 ?auto_152266 ) ) ( not ( = ?auto_152259 ?auto_152264 ) ) ( not ( = ?auto_152259 ?auto_152267 ) ) ( not ( = ?auto_152259 ?auto_152261 ) ) ( not ( = ?auto_152259 ?auto_152262 ) ) ( not ( = ?auto_152263 ?auto_152266 ) ) ( not ( = ?auto_152263 ?auto_152264 ) ) ( not ( = ?auto_152263 ?auto_152267 ) ) ( not ( = ?auto_152263 ?auto_152261 ) ) ( not ( = ?auto_152263 ?auto_152262 ) ) ( ON ?auto_152260 ?auto_152259 ) ( ON-TABLE ?auto_152263 ) ( ON ?auto_152265 ?auto_152260 ) ( ON ?auto_152262 ?auto_152265 ) ( CLEAR ?auto_152267 ) ( ON ?auto_152261 ?auto_152262 ) ( CLEAR ?auto_152261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152263 ?auto_152259 ?auto_152260 ?auto_152265 ?auto_152262 )
      ( MAKE-2PILE ?auto_152259 ?auto_152260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152268 - BLOCK
      ?auto_152269 - BLOCK
    )
    :vars
    (
      ?auto_152274 - BLOCK
      ?auto_152275 - BLOCK
      ?auto_152272 - BLOCK
      ?auto_152276 - BLOCK
      ?auto_152270 - BLOCK
      ?auto_152273 - BLOCK
      ?auto_152271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152268 ?auto_152269 ) ) ( not ( = ?auto_152268 ?auto_152274 ) ) ( not ( = ?auto_152269 ?auto_152274 ) ) ( ON ?auto_152268 ?auto_152275 ) ( not ( = ?auto_152268 ?auto_152275 ) ) ( not ( = ?auto_152269 ?auto_152275 ) ) ( not ( = ?auto_152274 ?auto_152275 ) ) ( ON-TABLE ?auto_152272 ) ( ON ?auto_152276 ?auto_152272 ) ( not ( = ?auto_152272 ?auto_152276 ) ) ( not ( = ?auto_152272 ?auto_152270 ) ) ( not ( = ?auto_152272 ?auto_152273 ) ) ( not ( = ?auto_152272 ?auto_152271 ) ) ( not ( = ?auto_152272 ?auto_152274 ) ) ( not ( = ?auto_152272 ?auto_152269 ) ) ( not ( = ?auto_152276 ?auto_152270 ) ) ( not ( = ?auto_152276 ?auto_152273 ) ) ( not ( = ?auto_152276 ?auto_152271 ) ) ( not ( = ?auto_152276 ?auto_152274 ) ) ( not ( = ?auto_152276 ?auto_152269 ) ) ( not ( = ?auto_152270 ?auto_152273 ) ) ( not ( = ?auto_152270 ?auto_152271 ) ) ( not ( = ?auto_152270 ?auto_152274 ) ) ( not ( = ?auto_152270 ?auto_152269 ) ) ( not ( = ?auto_152273 ?auto_152271 ) ) ( not ( = ?auto_152273 ?auto_152274 ) ) ( not ( = ?auto_152273 ?auto_152269 ) ) ( not ( = ?auto_152271 ?auto_152274 ) ) ( not ( = ?auto_152271 ?auto_152269 ) ) ( not ( = ?auto_152268 ?auto_152272 ) ) ( not ( = ?auto_152268 ?auto_152276 ) ) ( not ( = ?auto_152268 ?auto_152270 ) ) ( not ( = ?auto_152268 ?auto_152273 ) ) ( not ( = ?auto_152268 ?auto_152271 ) ) ( not ( = ?auto_152275 ?auto_152272 ) ) ( not ( = ?auto_152275 ?auto_152276 ) ) ( not ( = ?auto_152275 ?auto_152270 ) ) ( not ( = ?auto_152275 ?auto_152273 ) ) ( not ( = ?auto_152275 ?auto_152271 ) ) ( ON ?auto_152269 ?auto_152268 ) ( ON-TABLE ?auto_152275 ) ( ON ?auto_152274 ?auto_152269 ) ( ON ?auto_152271 ?auto_152274 ) ( ON ?auto_152273 ?auto_152271 ) ( CLEAR ?auto_152273 ) ( HOLDING ?auto_152270 ) ( CLEAR ?auto_152276 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152272 ?auto_152276 ?auto_152270 )
      ( MAKE-2PILE ?auto_152268 ?auto_152269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152277 - BLOCK
      ?auto_152278 - BLOCK
    )
    :vars
    (
      ?auto_152281 - BLOCK
      ?auto_152285 - BLOCK
      ?auto_152279 - BLOCK
      ?auto_152283 - BLOCK
      ?auto_152282 - BLOCK
      ?auto_152280 - BLOCK
      ?auto_152284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152277 ?auto_152278 ) ) ( not ( = ?auto_152277 ?auto_152281 ) ) ( not ( = ?auto_152278 ?auto_152281 ) ) ( ON ?auto_152277 ?auto_152285 ) ( not ( = ?auto_152277 ?auto_152285 ) ) ( not ( = ?auto_152278 ?auto_152285 ) ) ( not ( = ?auto_152281 ?auto_152285 ) ) ( ON-TABLE ?auto_152279 ) ( ON ?auto_152283 ?auto_152279 ) ( not ( = ?auto_152279 ?auto_152283 ) ) ( not ( = ?auto_152279 ?auto_152282 ) ) ( not ( = ?auto_152279 ?auto_152280 ) ) ( not ( = ?auto_152279 ?auto_152284 ) ) ( not ( = ?auto_152279 ?auto_152281 ) ) ( not ( = ?auto_152279 ?auto_152278 ) ) ( not ( = ?auto_152283 ?auto_152282 ) ) ( not ( = ?auto_152283 ?auto_152280 ) ) ( not ( = ?auto_152283 ?auto_152284 ) ) ( not ( = ?auto_152283 ?auto_152281 ) ) ( not ( = ?auto_152283 ?auto_152278 ) ) ( not ( = ?auto_152282 ?auto_152280 ) ) ( not ( = ?auto_152282 ?auto_152284 ) ) ( not ( = ?auto_152282 ?auto_152281 ) ) ( not ( = ?auto_152282 ?auto_152278 ) ) ( not ( = ?auto_152280 ?auto_152284 ) ) ( not ( = ?auto_152280 ?auto_152281 ) ) ( not ( = ?auto_152280 ?auto_152278 ) ) ( not ( = ?auto_152284 ?auto_152281 ) ) ( not ( = ?auto_152284 ?auto_152278 ) ) ( not ( = ?auto_152277 ?auto_152279 ) ) ( not ( = ?auto_152277 ?auto_152283 ) ) ( not ( = ?auto_152277 ?auto_152282 ) ) ( not ( = ?auto_152277 ?auto_152280 ) ) ( not ( = ?auto_152277 ?auto_152284 ) ) ( not ( = ?auto_152285 ?auto_152279 ) ) ( not ( = ?auto_152285 ?auto_152283 ) ) ( not ( = ?auto_152285 ?auto_152282 ) ) ( not ( = ?auto_152285 ?auto_152280 ) ) ( not ( = ?auto_152285 ?auto_152284 ) ) ( ON ?auto_152278 ?auto_152277 ) ( ON-TABLE ?auto_152285 ) ( ON ?auto_152281 ?auto_152278 ) ( ON ?auto_152284 ?auto_152281 ) ( ON ?auto_152280 ?auto_152284 ) ( CLEAR ?auto_152283 ) ( ON ?auto_152282 ?auto_152280 ) ( CLEAR ?auto_152282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152285 ?auto_152277 ?auto_152278 ?auto_152281 ?auto_152284 ?auto_152280 )
      ( MAKE-2PILE ?auto_152277 ?auto_152278 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152286 - BLOCK
      ?auto_152287 - BLOCK
    )
    :vars
    (
      ?auto_152290 - BLOCK
      ?auto_152292 - BLOCK
      ?auto_152288 - BLOCK
      ?auto_152289 - BLOCK
      ?auto_152293 - BLOCK
      ?auto_152291 - BLOCK
      ?auto_152294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152286 ?auto_152287 ) ) ( not ( = ?auto_152286 ?auto_152290 ) ) ( not ( = ?auto_152287 ?auto_152290 ) ) ( ON ?auto_152286 ?auto_152292 ) ( not ( = ?auto_152286 ?auto_152292 ) ) ( not ( = ?auto_152287 ?auto_152292 ) ) ( not ( = ?auto_152290 ?auto_152292 ) ) ( ON-TABLE ?auto_152288 ) ( not ( = ?auto_152288 ?auto_152289 ) ) ( not ( = ?auto_152288 ?auto_152293 ) ) ( not ( = ?auto_152288 ?auto_152291 ) ) ( not ( = ?auto_152288 ?auto_152294 ) ) ( not ( = ?auto_152288 ?auto_152290 ) ) ( not ( = ?auto_152288 ?auto_152287 ) ) ( not ( = ?auto_152289 ?auto_152293 ) ) ( not ( = ?auto_152289 ?auto_152291 ) ) ( not ( = ?auto_152289 ?auto_152294 ) ) ( not ( = ?auto_152289 ?auto_152290 ) ) ( not ( = ?auto_152289 ?auto_152287 ) ) ( not ( = ?auto_152293 ?auto_152291 ) ) ( not ( = ?auto_152293 ?auto_152294 ) ) ( not ( = ?auto_152293 ?auto_152290 ) ) ( not ( = ?auto_152293 ?auto_152287 ) ) ( not ( = ?auto_152291 ?auto_152294 ) ) ( not ( = ?auto_152291 ?auto_152290 ) ) ( not ( = ?auto_152291 ?auto_152287 ) ) ( not ( = ?auto_152294 ?auto_152290 ) ) ( not ( = ?auto_152294 ?auto_152287 ) ) ( not ( = ?auto_152286 ?auto_152288 ) ) ( not ( = ?auto_152286 ?auto_152289 ) ) ( not ( = ?auto_152286 ?auto_152293 ) ) ( not ( = ?auto_152286 ?auto_152291 ) ) ( not ( = ?auto_152286 ?auto_152294 ) ) ( not ( = ?auto_152292 ?auto_152288 ) ) ( not ( = ?auto_152292 ?auto_152289 ) ) ( not ( = ?auto_152292 ?auto_152293 ) ) ( not ( = ?auto_152292 ?auto_152291 ) ) ( not ( = ?auto_152292 ?auto_152294 ) ) ( ON ?auto_152287 ?auto_152286 ) ( ON-TABLE ?auto_152292 ) ( ON ?auto_152290 ?auto_152287 ) ( ON ?auto_152294 ?auto_152290 ) ( ON ?auto_152291 ?auto_152294 ) ( ON ?auto_152293 ?auto_152291 ) ( CLEAR ?auto_152293 ) ( HOLDING ?auto_152289 ) ( CLEAR ?auto_152288 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152288 ?auto_152289 )
      ( MAKE-2PILE ?auto_152286 ?auto_152287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152295 - BLOCK
      ?auto_152296 - BLOCK
    )
    :vars
    (
      ?auto_152299 - BLOCK
      ?auto_152303 - BLOCK
      ?auto_152302 - BLOCK
      ?auto_152301 - BLOCK
      ?auto_152300 - BLOCK
      ?auto_152298 - BLOCK
      ?auto_152297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152295 ?auto_152296 ) ) ( not ( = ?auto_152295 ?auto_152299 ) ) ( not ( = ?auto_152296 ?auto_152299 ) ) ( ON ?auto_152295 ?auto_152303 ) ( not ( = ?auto_152295 ?auto_152303 ) ) ( not ( = ?auto_152296 ?auto_152303 ) ) ( not ( = ?auto_152299 ?auto_152303 ) ) ( ON-TABLE ?auto_152302 ) ( not ( = ?auto_152302 ?auto_152301 ) ) ( not ( = ?auto_152302 ?auto_152300 ) ) ( not ( = ?auto_152302 ?auto_152298 ) ) ( not ( = ?auto_152302 ?auto_152297 ) ) ( not ( = ?auto_152302 ?auto_152299 ) ) ( not ( = ?auto_152302 ?auto_152296 ) ) ( not ( = ?auto_152301 ?auto_152300 ) ) ( not ( = ?auto_152301 ?auto_152298 ) ) ( not ( = ?auto_152301 ?auto_152297 ) ) ( not ( = ?auto_152301 ?auto_152299 ) ) ( not ( = ?auto_152301 ?auto_152296 ) ) ( not ( = ?auto_152300 ?auto_152298 ) ) ( not ( = ?auto_152300 ?auto_152297 ) ) ( not ( = ?auto_152300 ?auto_152299 ) ) ( not ( = ?auto_152300 ?auto_152296 ) ) ( not ( = ?auto_152298 ?auto_152297 ) ) ( not ( = ?auto_152298 ?auto_152299 ) ) ( not ( = ?auto_152298 ?auto_152296 ) ) ( not ( = ?auto_152297 ?auto_152299 ) ) ( not ( = ?auto_152297 ?auto_152296 ) ) ( not ( = ?auto_152295 ?auto_152302 ) ) ( not ( = ?auto_152295 ?auto_152301 ) ) ( not ( = ?auto_152295 ?auto_152300 ) ) ( not ( = ?auto_152295 ?auto_152298 ) ) ( not ( = ?auto_152295 ?auto_152297 ) ) ( not ( = ?auto_152303 ?auto_152302 ) ) ( not ( = ?auto_152303 ?auto_152301 ) ) ( not ( = ?auto_152303 ?auto_152300 ) ) ( not ( = ?auto_152303 ?auto_152298 ) ) ( not ( = ?auto_152303 ?auto_152297 ) ) ( ON ?auto_152296 ?auto_152295 ) ( ON-TABLE ?auto_152303 ) ( ON ?auto_152299 ?auto_152296 ) ( ON ?auto_152297 ?auto_152299 ) ( ON ?auto_152298 ?auto_152297 ) ( ON ?auto_152300 ?auto_152298 ) ( CLEAR ?auto_152302 ) ( ON ?auto_152301 ?auto_152300 ) ( CLEAR ?auto_152301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152303 ?auto_152295 ?auto_152296 ?auto_152299 ?auto_152297 ?auto_152298 ?auto_152300 )
      ( MAKE-2PILE ?auto_152295 ?auto_152296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152304 - BLOCK
      ?auto_152305 - BLOCK
    )
    :vars
    (
      ?auto_152306 - BLOCK
      ?auto_152308 - BLOCK
      ?auto_152311 - BLOCK
      ?auto_152310 - BLOCK
      ?auto_152309 - BLOCK
      ?auto_152312 - BLOCK
      ?auto_152307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152304 ?auto_152305 ) ) ( not ( = ?auto_152304 ?auto_152306 ) ) ( not ( = ?auto_152305 ?auto_152306 ) ) ( ON ?auto_152304 ?auto_152308 ) ( not ( = ?auto_152304 ?auto_152308 ) ) ( not ( = ?auto_152305 ?auto_152308 ) ) ( not ( = ?auto_152306 ?auto_152308 ) ) ( not ( = ?auto_152311 ?auto_152310 ) ) ( not ( = ?auto_152311 ?auto_152309 ) ) ( not ( = ?auto_152311 ?auto_152312 ) ) ( not ( = ?auto_152311 ?auto_152307 ) ) ( not ( = ?auto_152311 ?auto_152306 ) ) ( not ( = ?auto_152311 ?auto_152305 ) ) ( not ( = ?auto_152310 ?auto_152309 ) ) ( not ( = ?auto_152310 ?auto_152312 ) ) ( not ( = ?auto_152310 ?auto_152307 ) ) ( not ( = ?auto_152310 ?auto_152306 ) ) ( not ( = ?auto_152310 ?auto_152305 ) ) ( not ( = ?auto_152309 ?auto_152312 ) ) ( not ( = ?auto_152309 ?auto_152307 ) ) ( not ( = ?auto_152309 ?auto_152306 ) ) ( not ( = ?auto_152309 ?auto_152305 ) ) ( not ( = ?auto_152312 ?auto_152307 ) ) ( not ( = ?auto_152312 ?auto_152306 ) ) ( not ( = ?auto_152312 ?auto_152305 ) ) ( not ( = ?auto_152307 ?auto_152306 ) ) ( not ( = ?auto_152307 ?auto_152305 ) ) ( not ( = ?auto_152304 ?auto_152311 ) ) ( not ( = ?auto_152304 ?auto_152310 ) ) ( not ( = ?auto_152304 ?auto_152309 ) ) ( not ( = ?auto_152304 ?auto_152312 ) ) ( not ( = ?auto_152304 ?auto_152307 ) ) ( not ( = ?auto_152308 ?auto_152311 ) ) ( not ( = ?auto_152308 ?auto_152310 ) ) ( not ( = ?auto_152308 ?auto_152309 ) ) ( not ( = ?auto_152308 ?auto_152312 ) ) ( not ( = ?auto_152308 ?auto_152307 ) ) ( ON ?auto_152305 ?auto_152304 ) ( ON-TABLE ?auto_152308 ) ( ON ?auto_152306 ?auto_152305 ) ( ON ?auto_152307 ?auto_152306 ) ( ON ?auto_152312 ?auto_152307 ) ( ON ?auto_152309 ?auto_152312 ) ( ON ?auto_152310 ?auto_152309 ) ( CLEAR ?auto_152310 ) ( HOLDING ?auto_152311 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152311 )
      ( MAKE-2PILE ?auto_152304 ?auto_152305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_152313 - BLOCK
      ?auto_152314 - BLOCK
    )
    :vars
    (
      ?auto_152319 - BLOCK
      ?auto_152317 - BLOCK
      ?auto_152316 - BLOCK
      ?auto_152315 - BLOCK
      ?auto_152321 - BLOCK
      ?auto_152320 - BLOCK
      ?auto_152318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152313 ?auto_152314 ) ) ( not ( = ?auto_152313 ?auto_152319 ) ) ( not ( = ?auto_152314 ?auto_152319 ) ) ( ON ?auto_152313 ?auto_152317 ) ( not ( = ?auto_152313 ?auto_152317 ) ) ( not ( = ?auto_152314 ?auto_152317 ) ) ( not ( = ?auto_152319 ?auto_152317 ) ) ( not ( = ?auto_152316 ?auto_152315 ) ) ( not ( = ?auto_152316 ?auto_152321 ) ) ( not ( = ?auto_152316 ?auto_152320 ) ) ( not ( = ?auto_152316 ?auto_152318 ) ) ( not ( = ?auto_152316 ?auto_152319 ) ) ( not ( = ?auto_152316 ?auto_152314 ) ) ( not ( = ?auto_152315 ?auto_152321 ) ) ( not ( = ?auto_152315 ?auto_152320 ) ) ( not ( = ?auto_152315 ?auto_152318 ) ) ( not ( = ?auto_152315 ?auto_152319 ) ) ( not ( = ?auto_152315 ?auto_152314 ) ) ( not ( = ?auto_152321 ?auto_152320 ) ) ( not ( = ?auto_152321 ?auto_152318 ) ) ( not ( = ?auto_152321 ?auto_152319 ) ) ( not ( = ?auto_152321 ?auto_152314 ) ) ( not ( = ?auto_152320 ?auto_152318 ) ) ( not ( = ?auto_152320 ?auto_152319 ) ) ( not ( = ?auto_152320 ?auto_152314 ) ) ( not ( = ?auto_152318 ?auto_152319 ) ) ( not ( = ?auto_152318 ?auto_152314 ) ) ( not ( = ?auto_152313 ?auto_152316 ) ) ( not ( = ?auto_152313 ?auto_152315 ) ) ( not ( = ?auto_152313 ?auto_152321 ) ) ( not ( = ?auto_152313 ?auto_152320 ) ) ( not ( = ?auto_152313 ?auto_152318 ) ) ( not ( = ?auto_152317 ?auto_152316 ) ) ( not ( = ?auto_152317 ?auto_152315 ) ) ( not ( = ?auto_152317 ?auto_152321 ) ) ( not ( = ?auto_152317 ?auto_152320 ) ) ( not ( = ?auto_152317 ?auto_152318 ) ) ( ON ?auto_152314 ?auto_152313 ) ( ON-TABLE ?auto_152317 ) ( ON ?auto_152319 ?auto_152314 ) ( ON ?auto_152318 ?auto_152319 ) ( ON ?auto_152320 ?auto_152318 ) ( ON ?auto_152321 ?auto_152320 ) ( ON ?auto_152315 ?auto_152321 ) ( ON ?auto_152316 ?auto_152315 ) ( CLEAR ?auto_152316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152317 ?auto_152313 ?auto_152314 ?auto_152319 ?auto_152318 ?auto_152320 ?auto_152321 ?auto_152315 )
      ( MAKE-2PILE ?auto_152313 ?auto_152314 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_152349 - BLOCK
      ?auto_152350 - BLOCK
      ?auto_152351 - BLOCK
      ?auto_152352 - BLOCK
      ?auto_152353 - BLOCK
    )
    :vars
    (
      ?auto_152355 - BLOCK
      ?auto_152354 - BLOCK
      ?auto_152356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152355 ?auto_152353 ) ( ON-TABLE ?auto_152349 ) ( ON ?auto_152350 ?auto_152349 ) ( ON ?auto_152351 ?auto_152350 ) ( ON ?auto_152352 ?auto_152351 ) ( ON ?auto_152353 ?auto_152352 ) ( not ( = ?auto_152349 ?auto_152350 ) ) ( not ( = ?auto_152349 ?auto_152351 ) ) ( not ( = ?auto_152349 ?auto_152352 ) ) ( not ( = ?auto_152349 ?auto_152353 ) ) ( not ( = ?auto_152349 ?auto_152355 ) ) ( not ( = ?auto_152350 ?auto_152351 ) ) ( not ( = ?auto_152350 ?auto_152352 ) ) ( not ( = ?auto_152350 ?auto_152353 ) ) ( not ( = ?auto_152350 ?auto_152355 ) ) ( not ( = ?auto_152351 ?auto_152352 ) ) ( not ( = ?auto_152351 ?auto_152353 ) ) ( not ( = ?auto_152351 ?auto_152355 ) ) ( not ( = ?auto_152352 ?auto_152353 ) ) ( not ( = ?auto_152352 ?auto_152355 ) ) ( not ( = ?auto_152353 ?auto_152355 ) ) ( not ( = ?auto_152349 ?auto_152354 ) ) ( not ( = ?auto_152349 ?auto_152356 ) ) ( not ( = ?auto_152350 ?auto_152354 ) ) ( not ( = ?auto_152350 ?auto_152356 ) ) ( not ( = ?auto_152351 ?auto_152354 ) ) ( not ( = ?auto_152351 ?auto_152356 ) ) ( not ( = ?auto_152352 ?auto_152354 ) ) ( not ( = ?auto_152352 ?auto_152356 ) ) ( not ( = ?auto_152353 ?auto_152354 ) ) ( not ( = ?auto_152353 ?auto_152356 ) ) ( not ( = ?auto_152355 ?auto_152354 ) ) ( not ( = ?auto_152355 ?auto_152356 ) ) ( not ( = ?auto_152354 ?auto_152356 ) ) ( ON ?auto_152354 ?auto_152355 ) ( CLEAR ?auto_152354 ) ( HOLDING ?auto_152356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152356 )
      ( MAKE-5PILE ?auto_152349 ?auto_152350 ?auto_152351 ?auto_152352 ?auto_152353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152462 - BLOCK
      ?auto_152463 - BLOCK
      ?auto_152464 - BLOCK
    )
    :vars
    (
      ?auto_152465 - BLOCK
      ?auto_152466 - BLOCK
      ?auto_152469 - BLOCK
      ?auto_152468 - BLOCK
      ?auto_152467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152462 ) ( not ( = ?auto_152462 ?auto_152463 ) ) ( not ( = ?auto_152462 ?auto_152464 ) ) ( not ( = ?auto_152463 ?auto_152464 ) ) ( ON ?auto_152464 ?auto_152465 ) ( not ( = ?auto_152462 ?auto_152465 ) ) ( not ( = ?auto_152463 ?auto_152465 ) ) ( not ( = ?auto_152464 ?auto_152465 ) ) ( CLEAR ?auto_152462 ) ( ON ?auto_152463 ?auto_152464 ) ( CLEAR ?auto_152463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152466 ) ( ON ?auto_152469 ?auto_152466 ) ( ON ?auto_152468 ?auto_152469 ) ( ON ?auto_152467 ?auto_152468 ) ( ON ?auto_152465 ?auto_152467 ) ( not ( = ?auto_152466 ?auto_152469 ) ) ( not ( = ?auto_152466 ?auto_152468 ) ) ( not ( = ?auto_152466 ?auto_152467 ) ) ( not ( = ?auto_152466 ?auto_152465 ) ) ( not ( = ?auto_152466 ?auto_152464 ) ) ( not ( = ?auto_152466 ?auto_152463 ) ) ( not ( = ?auto_152469 ?auto_152468 ) ) ( not ( = ?auto_152469 ?auto_152467 ) ) ( not ( = ?auto_152469 ?auto_152465 ) ) ( not ( = ?auto_152469 ?auto_152464 ) ) ( not ( = ?auto_152469 ?auto_152463 ) ) ( not ( = ?auto_152468 ?auto_152467 ) ) ( not ( = ?auto_152468 ?auto_152465 ) ) ( not ( = ?auto_152468 ?auto_152464 ) ) ( not ( = ?auto_152468 ?auto_152463 ) ) ( not ( = ?auto_152467 ?auto_152465 ) ) ( not ( = ?auto_152467 ?auto_152464 ) ) ( not ( = ?auto_152467 ?auto_152463 ) ) ( not ( = ?auto_152462 ?auto_152466 ) ) ( not ( = ?auto_152462 ?auto_152469 ) ) ( not ( = ?auto_152462 ?auto_152468 ) ) ( not ( = ?auto_152462 ?auto_152467 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152466 ?auto_152469 ?auto_152468 ?auto_152467 ?auto_152465 ?auto_152464 )
      ( MAKE-3PILE ?auto_152462 ?auto_152463 ?auto_152464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152470 - BLOCK
      ?auto_152471 - BLOCK
      ?auto_152472 - BLOCK
    )
    :vars
    (
      ?auto_152474 - BLOCK
      ?auto_152473 - BLOCK
      ?auto_152476 - BLOCK
      ?auto_152477 - BLOCK
      ?auto_152475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152470 ?auto_152471 ) ) ( not ( = ?auto_152470 ?auto_152472 ) ) ( not ( = ?auto_152471 ?auto_152472 ) ) ( ON ?auto_152472 ?auto_152474 ) ( not ( = ?auto_152470 ?auto_152474 ) ) ( not ( = ?auto_152471 ?auto_152474 ) ) ( not ( = ?auto_152472 ?auto_152474 ) ) ( ON ?auto_152471 ?auto_152472 ) ( CLEAR ?auto_152471 ) ( ON-TABLE ?auto_152473 ) ( ON ?auto_152476 ?auto_152473 ) ( ON ?auto_152477 ?auto_152476 ) ( ON ?auto_152475 ?auto_152477 ) ( ON ?auto_152474 ?auto_152475 ) ( not ( = ?auto_152473 ?auto_152476 ) ) ( not ( = ?auto_152473 ?auto_152477 ) ) ( not ( = ?auto_152473 ?auto_152475 ) ) ( not ( = ?auto_152473 ?auto_152474 ) ) ( not ( = ?auto_152473 ?auto_152472 ) ) ( not ( = ?auto_152473 ?auto_152471 ) ) ( not ( = ?auto_152476 ?auto_152477 ) ) ( not ( = ?auto_152476 ?auto_152475 ) ) ( not ( = ?auto_152476 ?auto_152474 ) ) ( not ( = ?auto_152476 ?auto_152472 ) ) ( not ( = ?auto_152476 ?auto_152471 ) ) ( not ( = ?auto_152477 ?auto_152475 ) ) ( not ( = ?auto_152477 ?auto_152474 ) ) ( not ( = ?auto_152477 ?auto_152472 ) ) ( not ( = ?auto_152477 ?auto_152471 ) ) ( not ( = ?auto_152475 ?auto_152474 ) ) ( not ( = ?auto_152475 ?auto_152472 ) ) ( not ( = ?auto_152475 ?auto_152471 ) ) ( not ( = ?auto_152470 ?auto_152473 ) ) ( not ( = ?auto_152470 ?auto_152476 ) ) ( not ( = ?auto_152470 ?auto_152477 ) ) ( not ( = ?auto_152470 ?auto_152475 ) ) ( HOLDING ?auto_152470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152470 )
      ( MAKE-3PILE ?auto_152470 ?auto_152471 ?auto_152472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152478 - BLOCK
      ?auto_152479 - BLOCK
      ?auto_152480 - BLOCK
    )
    :vars
    (
      ?auto_152484 - BLOCK
      ?auto_152482 - BLOCK
      ?auto_152485 - BLOCK
      ?auto_152481 - BLOCK
      ?auto_152483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152478 ?auto_152479 ) ) ( not ( = ?auto_152478 ?auto_152480 ) ) ( not ( = ?auto_152479 ?auto_152480 ) ) ( ON ?auto_152480 ?auto_152484 ) ( not ( = ?auto_152478 ?auto_152484 ) ) ( not ( = ?auto_152479 ?auto_152484 ) ) ( not ( = ?auto_152480 ?auto_152484 ) ) ( ON ?auto_152479 ?auto_152480 ) ( ON-TABLE ?auto_152482 ) ( ON ?auto_152485 ?auto_152482 ) ( ON ?auto_152481 ?auto_152485 ) ( ON ?auto_152483 ?auto_152481 ) ( ON ?auto_152484 ?auto_152483 ) ( not ( = ?auto_152482 ?auto_152485 ) ) ( not ( = ?auto_152482 ?auto_152481 ) ) ( not ( = ?auto_152482 ?auto_152483 ) ) ( not ( = ?auto_152482 ?auto_152484 ) ) ( not ( = ?auto_152482 ?auto_152480 ) ) ( not ( = ?auto_152482 ?auto_152479 ) ) ( not ( = ?auto_152485 ?auto_152481 ) ) ( not ( = ?auto_152485 ?auto_152483 ) ) ( not ( = ?auto_152485 ?auto_152484 ) ) ( not ( = ?auto_152485 ?auto_152480 ) ) ( not ( = ?auto_152485 ?auto_152479 ) ) ( not ( = ?auto_152481 ?auto_152483 ) ) ( not ( = ?auto_152481 ?auto_152484 ) ) ( not ( = ?auto_152481 ?auto_152480 ) ) ( not ( = ?auto_152481 ?auto_152479 ) ) ( not ( = ?auto_152483 ?auto_152484 ) ) ( not ( = ?auto_152483 ?auto_152480 ) ) ( not ( = ?auto_152483 ?auto_152479 ) ) ( not ( = ?auto_152478 ?auto_152482 ) ) ( not ( = ?auto_152478 ?auto_152485 ) ) ( not ( = ?auto_152478 ?auto_152481 ) ) ( not ( = ?auto_152478 ?auto_152483 ) ) ( ON ?auto_152478 ?auto_152479 ) ( CLEAR ?auto_152478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152482 ?auto_152485 ?auto_152481 ?auto_152483 ?auto_152484 ?auto_152480 ?auto_152479 )
      ( MAKE-3PILE ?auto_152478 ?auto_152479 ?auto_152480 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152489 - BLOCK
      ?auto_152490 - BLOCK
      ?auto_152491 - BLOCK
    )
    :vars
    (
      ?auto_152492 - BLOCK
      ?auto_152493 - BLOCK
      ?auto_152495 - BLOCK
      ?auto_152496 - BLOCK
      ?auto_152494 - BLOCK
      ?auto_152497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152489 ?auto_152490 ) ) ( not ( = ?auto_152489 ?auto_152491 ) ) ( not ( = ?auto_152490 ?auto_152491 ) ) ( ON ?auto_152491 ?auto_152492 ) ( not ( = ?auto_152489 ?auto_152492 ) ) ( not ( = ?auto_152490 ?auto_152492 ) ) ( not ( = ?auto_152491 ?auto_152492 ) ) ( ON ?auto_152490 ?auto_152491 ) ( CLEAR ?auto_152490 ) ( ON-TABLE ?auto_152493 ) ( ON ?auto_152495 ?auto_152493 ) ( ON ?auto_152496 ?auto_152495 ) ( ON ?auto_152494 ?auto_152496 ) ( ON ?auto_152492 ?auto_152494 ) ( not ( = ?auto_152493 ?auto_152495 ) ) ( not ( = ?auto_152493 ?auto_152496 ) ) ( not ( = ?auto_152493 ?auto_152494 ) ) ( not ( = ?auto_152493 ?auto_152492 ) ) ( not ( = ?auto_152493 ?auto_152491 ) ) ( not ( = ?auto_152493 ?auto_152490 ) ) ( not ( = ?auto_152495 ?auto_152496 ) ) ( not ( = ?auto_152495 ?auto_152494 ) ) ( not ( = ?auto_152495 ?auto_152492 ) ) ( not ( = ?auto_152495 ?auto_152491 ) ) ( not ( = ?auto_152495 ?auto_152490 ) ) ( not ( = ?auto_152496 ?auto_152494 ) ) ( not ( = ?auto_152496 ?auto_152492 ) ) ( not ( = ?auto_152496 ?auto_152491 ) ) ( not ( = ?auto_152496 ?auto_152490 ) ) ( not ( = ?auto_152494 ?auto_152492 ) ) ( not ( = ?auto_152494 ?auto_152491 ) ) ( not ( = ?auto_152494 ?auto_152490 ) ) ( not ( = ?auto_152489 ?auto_152493 ) ) ( not ( = ?auto_152489 ?auto_152495 ) ) ( not ( = ?auto_152489 ?auto_152496 ) ) ( not ( = ?auto_152489 ?auto_152494 ) ) ( ON ?auto_152489 ?auto_152497 ) ( CLEAR ?auto_152489 ) ( HAND-EMPTY ) ( not ( = ?auto_152489 ?auto_152497 ) ) ( not ( = ?auto_152490 ?auto_152497 ) ) ( not ( = ?auto_152491 ?auto_152497 ) ) ( not ( = ?auto_152492 ?auto_152497 ) ) ( not ( = ?auto_152493 ?auto_152497 ) ) ( not ( = ?auto_152495 ?auto_152497 ) ) ( not ( = ?auto_152496 ?auto_152497 ) ) ( not ( = ?auto_152494 ?auto_152497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152489 ?auto_152497 )
      ( MAKE-3PILE ?auto_152489 ?auto_152490 ?auto_152491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152498 - BLOCK
      ?auto_152499 - BLOCK
      ?auto_152500 - BLOCK
    )
    :vars
    (
      ?auto_152506 - BLOCK
      ?auto_152504 - BLOCK
      ?auto_152505 - BLOCK
      ?auto_152501 - BLOCK
      ?auto_152503 - BLOCK
      ?auto_152502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152498 ?auto_152499 ) ) ( not ( = ?auto_152498 ?auto_152500 ) ) ( not ( = ?auto_152499 ?auto_152500 ) ) ( ON ?auto_152500 ?auto_152506 ) ( not ( = ?auto_152498 ?auto_152506 ) ) ( not ( = ?auto_152499 ?auto_152506 ) ) ( not ( = ?auto_152500 ?auto_152506 ) ) ( ON-TABLE ?auto_152504 ) ( ON ?auto_152505 ?auto_152504 ) ( ON ?auto_152501 ?auto_152505 ) ( ON ?auto_152503 ?auto_152501 ) ( ON ?auto_152506 ?auto_152503 ) ( not ( = ?auto_152504 ?auto_152505 ) ) ( not ( = ?auto_152504 ?auto_152501 ) ) ( not ( = ?auto_152504 ?auto_152503 ) ) ( not ( = ?auto_152504 ?auto_152506 ) ) ( not ( = ?auto_152504 ?auto_152500 ) ) ( not ( = ?auto_152504 ?auto_152499 ) ) ( not ( = ?auto_152505 ?auto_152501 ) ) ( not ( = ?auto_152505 ?auto_152503 ) ) ( not ( = ?auto_152505 ?auto_152506 ) ) ( not ( = ?auto_152505 ?auto_152500 ) ) ( not ( = ?auto_152505 ?auto_152499 ) ) ( not ( = ?auto_152501 ?auto_152503 ) ) ( not ( = ?auto_152501 ?auto_152506 ) ) ( not ( = ?auto_152501 ?auto_152500 ) ) ( not ( = ?auto_152501 ?auto_152499 ) ) ( not ( = ?auto_152503 ?auto_152506 ) ) ( not ( = ?auto_152503 ?auto_152500 ) ) ( not ( = ?auto_152503 ?auto_152499 ) ) ( not ( = ?auto_152498 ?auto_152504 ) ) ( not ( = ?auto_152498 ?auto_152505 ) ) ( not ( = ?auto_152498 ?auto_152501 ) ) ( not ( = ?auto_152498 ?auto_152503 ) ) ( ON ?auto_152498 ?auto_152502 ) ( CLEAR ?auto_152498 ) ( not ( = ?auto_152498 ?auto_152502 ) ) ( not ( = ?auto_152499 ?auto_152502 ) ) ( not ( = ?auto_152500 ?auto_152502 ) ) ( not ( = ?auto_152506 ?auto_152502 ) ) ( not ( = ?auto_152504 ?auto_152502 ) ) ( not ( = ?auto_152505 ?auto_152502 ) ) ( not ( = ?auto_152501 ?auto_152502 ) ) ( not ( = ?auto_152503 ?auto_152502 ) ) ( HOLDING ?auto_152499 ) ( CLEAR ?auto_152500 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152504 ?auto_152505 ?auto_152501 ?auto_152503 ?auto_152506 ?auto_152500 ?auto_152499 )
      ( MAKE-3PILE ?auto_152498 ?auto_152499 ?auto_152500 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152507 - BLOCK
      ?auto_152508 - BLOCK
      ?auto_152509 - BLOCK
    )
    :vars
    (
      ?auto_152515 - BLOCK
      ?auto_152510 - BLOCK
      ?auto_152511 - BLOCK
      ?auto_152514 - BLOCK
      ?auto_152513 - BLOCK
      ?auto_152512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152507 ?auto_152508 ) ) ( not ( = ?auto_152507 ?auto_152509 ) ) ( not ( = ?auto_152508 ?auto_152509 ) ) ( ON ?auto_152509 ?auto_152515 ) ( not ( = ?auto_152507 ?auto_152515 ) ) ( not ( = ?auto_152508 ?auto_152515 ) ) ( not ( = ?auto_152509 ?auto_152515 ) ) ( ON-TABLE ?auto_152510 ) ( ON ?auto_152511 ?auto_152510 ) ( ON ?auto_152514 ?auto_152511 ) ( ON ?auto_152513 ?auto_152514 ) ( ON ?auto_152515 ?auto_152513 ) ( not ( = ?auto_152510 ?auto_152511 ) ) ( not ( = ?auto_152510 ?auto_152514 ) ) ( not ( = ?auto_152510 ?auto_152513 ) ) ( not ( = ?auto_152510 ?auto_152515 ) ) ( not ( = ?auto_152510 ?auto_152509 ) ) ( not ( = ?auto_152510 ?auto_152508 ) ) ( not ( = ?auto_152511 ?auto_152514 ) ) ( not ( = ?auto_152511 ?auto_152513 ) ) ( not ( = ?auto_152511 ?auto_152515 ) ) ( not ( = ?auto_152511 ?auto_152509 ) ) ( not ( = ?auto_152511 ?auto_152508 ) ) ( not ( = ?auto_152514 ?auto_152513 ) ) ( not ( = ?auto_152514 ?auto_152515 ) ) ( not ( = ?auto_152514 ?auto_152509 ) ) ( not ( = ?auto_152514 ?auto_152508 ) ) ( not ( = ?auto_152513 ?auto_152515 ) ) ( not ( = ?auto_152513 ?auto_152509 ) ) ( not ( = ?auto_152513 ?auto_152508 ) ) ( not ( = ?auto_152507 ?auto_152510 ) ) ( not ( = ?auto_152507 ?auto_152511 ) ) ( not ( = ?auto_152507 ?auto_152514 ) ) ( not ( = ?auto_152507 ?auto_152513 ) ) ( ON ?auto_152507 ?auto_152512 ) ( not ( = ?auto_152507 ?auto_152512 ) ) ( not ( = ?auto_152508 ?auto_152512 ) ) ( not ( = ?auto_152509 ?auto_152512 ) ) ( not ( = ?auto_152515 ?auto_152512 ) ) ( not ( = ?auto_152510 ?auto_152512 ) ) ( not ( = ?auto_152511 ?auto_152512 ) ) ( not ( = ?auto_152514 ?auto_152512 ) ) ( not ( = ?auto_152513 ?auto_152512 ) ) ( CLEAR ?auto_152509 ) ( ON ?auto_152508 ?auto_152507 ) ( CLEAR ?auto_152508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152512 ?auto_152507 )
      ( MAKE-3PILE ?auto_152507 ?auto_152508 ?auto_152509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152516 - BLOCK
      ?auto_152517 - BLOCK
      ?auto_152518 - BLOCK
    )
    :vars
    (
      ?auto_152519 - BLOCK
      ?auto_152524 - BLOCK
      ?auto_152520 - BLOCK
      ?auto_152521 - BLOCK
      ?auto_152522 - BLOCK
      ?auto_152523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152516 ?auto_152517 ) ) ( not ( = ?auto_152516 ?auto_152518 ) ) ( not ( = ?auto_152517 ?auto_152518 ) ) ( not ( = ?auto_152516 ?auto_152519 ) ) ( not ( = ?auto_152517 ?auto_152519 ) ) ( not ( = ?auto_152518 ?auto_152519 ) ) ( ON-TABLE ?auto_152524 ) ( ON ?auto_152520 ?auto_152524 ) ( ON ?auto_152521 ?auto_152520 ) ( ON ?auto_152522 ?auto_152521 ) ( ON ?auto_152519 ?auto_152522 ) ( not ( = ?auto_152524 ?auto_152520 ) ) ( not ( = ?auto_152524 ?auto_152521 ) ) ( not ( = ?auto_152524 ?auto_152522 ) ) ( not ( = ?auto_152524 ?auto_152519 ) ) ( not ( = ?auto_152524 ?auto_152518 ) ) ( not ( = ?auto_152524 ?auto_152517 ) ) ( not ( = ?auto_152520 ?auto_152521 ) ) ( not ( = ?auto_152520 ?auto_152522 ) ) ( not ( = ?auto_152520 ?auto_152519 ) ) ( not ( = ?auto_152520 ?auto_152518 ) ) ( not ( = ?auto_152520 ?auto_152517 ) ) ( not ( = ?auto_152521 ?auto_152522 ) ) ( not ( = ?auto_152521 ?auto_152519 ) ) ( not ( = ?auto_152521 ?auto_152518 ) ) ( not ( = ?auto_152521 ?auto_152517 ) ) ( not ( = ?auto_152522 ?auto_152519 ) ) ( not ( = ?auto_152522 ?auto_152518 ) ) ( not ( = ?auto_152522 ?auto_152517 ) ) ( not ( = ?auto_152516 ?auto_152524 ) ) ( not ( = ?auto_152516 ?auto_152520 ) ) ( not ( = ?auto_152516 ?auto_152521 ) ) ( not ( = ?auto_152516 ?auto_152522 ) ) ( ON ?auto_152516 ?auto_152523 ) ( not ( = ?auto_152516 ?auto_152523 ) ) ( not ( = ?auto_152517 ?auto_152523 ) ) ( not ( = ?auto_152518 ?auto_152523 ) ) ( not ( = ?auto_152519 ?auto_152523 ) ) ( not ( = ?auto_152524 ?auto_152523 ) ) ( not ( = ?auto_152520 ?auto_152523 ) ) ( not ( = ?auto_152521 ?auto_152523 ) ) ( not ( = ?auto_152522 ?auto_152523 ) ) ( ON ?auto_152517 ?auto_152516 ) ( CLEAR ?auto_152517 ) ( ON-TABLE ?auto_152523 ) ( HOLDING ?auto_152518 ) ( CLEAR ?auto_152519 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152524 ?auto_152520 ?auto_152521 ?auto_152522 ?auto_152519 ?auto_152518 )
      ( MAKE-3PILE ?auto_152516 ?auto_152517 ?auto_152518 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152525 - BLOCK
      ?auto_152526 - BLOCK
      ?auto_152527 - BLOCK
    )
    :vars
    (
      ?auto_152532 - BLOCK
      ?auto_152530 - BLOCK
      ?auto_152533 - BLOCK
      ?auto_152528 - BLOCK
      ?auto_152531 - BLOCK
      ?auto_152529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152525 ?auto_152526 ) ) ( not ( = ?auto_152525 ?auto_152527 ) ) ( not ( = ?auto_152526 ?auto_152527 ) ) ( not ( = ?auto_152525 ?auto_152532 ) ) ( not ( = ?auto_152526 ?auto_152532 ) ) ( not ( = ?auto_152527 ?auto_152532 ) ) ( ON-TABLE ?auto_152530 ) ( ON ?auto_152533 ?auto_152530 ) ( ON ?auto_152528 ?auto_152533 ) ( ON ?auto_152531 ?auto_152528 ) ( ON ?auto_152532 ?auto_152531 ) ( not ( = ?auto_152530 ?auto_152533 ) ) ( not ( = ?auto_152530 ?auto_152528 ) ) ( not ( = ?auto_152530 ?auto_152531 ) ) ( not ( = ?auto_152530 ?auto_152532 ) ) ( not ( = ?auto_152530 ?auto_152527 ) ) ( not ( = ?auto_152530 ?auto_152526 ) ) ( not ( = ?auto_152533 ?auto_152528 ) ) ( not ( = ?auto_152533 ?auto_152531 ) ) ( not ( = ?auto_152533 ?auto_152532 ) ) ( not ( = ?auto_152533 ?auto_152527 ) ) ( not ( = ?auto_152533 ?auto_152526 ) ) ( not ( = ?auto_152528 ?auto_152531 ) ) ( not ( = ?auto_152528 ?auto_152532 ) ) ( not ( = ?auto_152528 ?auto_152527 ) ) ( not ( = ?auto_152528 ?auto_152526 ) ) ( not ( = ?auto_152531 ?auto_152532 ) ) ( not ( = ?auto_152531 ?auto_152527 ) ) ( not ( = ?auto_152531 ?auto_152526 ) ) ( not ( = ?auto_152525 ?auto_152530 ) ) ( not ( = ?auto_152525 ?auto_152533 ) ) ( not ( = ?auto_152525 ?auto_152528 ) ) ( not ( = ?auto_152525 ?auto_152531 ) ) ( ON ?auto_152525 ?auto_152529 ) ( not ( = ?auto_152525 ?auto_152529 ) ) ( not ( = ?auto_152526 ?auto_152529 ) ) ( not ( = ?auto_152527 ?auto_152529 ) ) ( not ( = ?auto_152532 ?auto_152529 ) ) ( not ( = ?auto_152530 ?auto_152529 ) ) ( not ( = ?auto_152533 ?auto_152529 ) ) ( not ( = ?auto_152528 ?auto_152529 ) ) ( not ( = ?auto_152531 ?auto_152529 ) ) ( ON ?auto_152526 ?auto_152525 ) ( ON-TABLE ?auto_152529 ) ( CLEAR ?auto_152532 ) ( ON ?auto_152527 ?auto_152526 ) ( CLEAR ?auto_152527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152529 ?auto_152525 ?auto_152526 )
      ( MAKE-3PILE ?auto_152525 ?auto_152526 ?auto_152527 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152534 - BLOCK
      ?auto_152535 - BLOCK
      ?auto_152536 - BLOCK
    )
    :vars
    (
      ?auto_152541 - BLOCK
      ?auto_152542 - BLOCK
      ?auto_152537 - BLOCK
      ?auto_152539 - BLOCK
      ?auto_152538 - BLOCK
      ?auto_152540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152534 ?auto_152535 ) ) ( not ( = ?auto_152534 ?auto_152536 ) ) ( not ( = ?auto_152535 ?auto_152536 ) ) ( not ( = ?auto_152534 ?auto_152541 ) ) ( not ( = ?auto_152535 ?auto_152541 ) ) ( not ( = ?auto_152536 ?auto_152541 ) ) ( ON-TABLE ?auto_152542 ) ( ON ?auto_152537 ?auto_152542 ) ( ON ?auto_152539 ?auto_152537 ) ( ON ?auto_152538 ?auto_152539 ) ( not ( = ?auto_152542 ?auto_152537 ) ) ( not ( = ?auto_152542 ?auto_152539 ) ) ( not ( = ?auto_152542 ?auto_152538 ) ) ( not ( = ?auto_152542 ?auto_152541 ) ) ( not ( = ?auto_152542 ?auto_152536 ) ) ( not ( = ?auto_152542 ?auto_152535 ) ) ( not ( = ?auto_152537 ?auto_152539 ) ) ( not ( = ?auto_152537 ?auto_152538 ) ) ( not ( = ?auto_152537 ?auto_152541 ) ) ( not ( = ?auto_152537 ?auto_152536 ) ) ( not ( = ?auto_152537 ?auto_152535 ) ) ( not ( = ?auto_152539 ?auto_152538 ) ) ( not ( = ?auto_152539 ?auto_152541 ) ) ( not ( = ?auto_152539 ?auto_152536 ) ) ( not ( = ?auto_152539 ?auto_152535 ) ) ( not ( = ?auto_152538 ?auto_152541 ) ) ( not ( = ?auto_152538 ?auto_152536 ) ) ( not ( = ?auto_152538 ?auto_152535 ) ) ( not ( = ?auto_152534 ?auto_152542 ) ) ( not ( = ?auto_152534 ?auto_152537 ) ) ( not ( = ?auto_152534 ?auto_152539 ) ) ( not ( = ?auto_152534 ?auto_152538 ) ) ( ON ?auto_152534 ?auto_152540 ) ( not ( = ?auto_152534 ?auto_152540 ) ) ( not ( = ?auto_152535 ?auto_152540 ) ) ( not ( = ?auto_152536 ?auto_152540 ) ) ( not ( = ?auto_152541 ?auto_152540 ) ) ( not ( = ?auto_152542 ?auto_152540 ) ) ( not ( = ?auto_152537 ?auto_152540 ) ) ( not ( = ?auto_152539 ?auto_152540 ) ) ( not ( = ?auto_152538 ?auto_152540 ) ) ( ON ?auto_152535 ?auto_152534 ) ( ON-TABLE ?auto_152540 ) ( ON ?auto_152536 ?auto_152535 ) ( CLEAR ?auto_152536 ) ( HOLDING ?auto_152541 ) ( CLEAR ?auto_152538 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152542 ?auto_152537 ?auto_152539 ?auto_152538 ?auto_152541 )
      ( MAKE-3PILE ?auto_152534 ?auto_152535 ?auto_152536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152543 - BLOCK
      ?auto_152544 - BLOCK
      ?auto_152545 - BLOCK
    )
    :vars
    (
      ?auto_152549 - BLOCK
      ?auto_152551 - BLOCK
      ?auto_152550 - BLOCK
      ?auto_152546 - BLOCK
      ?auto_152547 - BLOCK
      ?auto_152548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152543 ?auto_152544 ) ) ( not ( = ?auto_152543 ?auto_152545 ) ) ( not ( = ?auto_152544 ?auto_152545 ) ) ( not ( = ?auto_152543 ?auto_152549 ) ) ( not ( = ?auto_152544 ?auto_152549 ) ) ( not ( = ?auto_152545 ?auto_152549 ) ) ( ON-TABLE ?auto_152551 ) ( ON ?auto_152550 ?auto_152551 ) ( ON ?auto_152546 ?auto_152550 ) ( ON ?auto_152547 ?auto_152546 ) ( not ( = ?auto_152551 ?auto_152550 ) ) ( not ( = ?auto_152551 ?auto_152546 ) ) ( not ( = ?auto_152551 ?auto_152547 ) ) ( not ( = ?auto_152551 ?auto_152549 ) ) ( not ( = ?auto_152551 ?auto_152545 ) ) ( not ( = ?auto_152551 ?auto_152544 ) ) ( not ( = ?auto_152550 ?auto_152546 ) ) ( not ( = ?auto_152550 ?auto_152547 ) ) ( not ( = ?auto_152550 ?auto_152549 ) ) ( not ( = ?auto_152550 ?auto_152545 ) ) ( not ( = ?auto_152550 ?auto_152544 ) ) ( not ( = ?auto_152546 ?auto_152547 ) ) ( not ( = ?auto_152546 ?auto_152549 ) ) ( not ( = ?auto_152546 ?auto_152545 ) ) ( not ( = ?auto_152546 ?auto_152544 ) ) ( not ( = ?auto_152547 ?auto_152549 ) ) ( not ( = ?auto_152547 ?auto_152545 ) ) ( not ( = ?auto_152547 ?auto_152544 ) ) ( not ( = ?auto_152543 ?auto_152551 ) ) ( not ( = ?auto_152543 ?auto_152550 ) ) ( not ( = ?auto_152543 ?auto_152546 ) ) ( not ( = ?auto_152543 ?auto_152547 ) ) ( ON ?auto_152543 ?auto_152548 ) ( not ( = ?auto_152543 ?auto_152548 ) ) ( not ( = ?auto_152544 ?auto_152548 ) ) ( not ( = ?auto_152545 ?auto_152548 ) ) ( not ( = ?auto_152549 ?auto_152548 ) ) ( not ( = ?auto_152551 ?auto_152548 ) ) ( not ( = ?auto_152550 ?auto_152548 ) ) ( not ( = ?auto_152546 ?auto_152548 ) ) ( not ( = ?auto_152547 ?auto_152548 ) ) ( ON ?auto_152544 ?auto_152543 ) ( ON-TABLE ?auto_152548 ) ( ON ?auto_152545 ?auto_152544 ) ( CLEAR ?auto_152547 ) ( ON ?auto_152549 ?auto_152545 ) ( CLEAR ?auto_152549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152548 ?auto_152543 ?auto_152544 ?auto_152545 )
      ( MAKE-3PILE ?auto_152543 ?auto_152544 ?auto_152545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152552 - BLOCK
      ?auto_152553 - BLOCK
      ?auto_152554 - BLOCK
    )
    :vars
    (
      ?auto_152559 - BLOCK
      ?auto_152555 - BLOCK
      ?auto_152556 - BLOCK
      ?auto_152557 - BLOCK
      ?auto_152560 - BLOCK
      ?auto_152558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152552 ?auto_152553 ) ) ( not ( = ?auto_152552 ?auto_152554 ) ) ( not ( = ?auto_152553 ?auto_152554 ) ) ( not ( = ?auto_152552 ?auto_152559 ) ) ( not ( = ?auto_152553 ?auto_152559 ) ) ( not ( = ?auto_152554 ?auto_152559 ) ) ( ON-TABLE ?auto_152555 ) ( ON ?auto_152556 ?auto_152555 ) ( ON ?auto_152557 ?auto_152556 ) ( not ( = ?auto_152555 ?auto_152556 ) ) ( not ( = ?auto_152555 ?auto_152557 ) ) ( not ( = ?auto_152555 ?auto_152560 ) ) ( not ( = ?auto_152555 ?auto_152559 ) ) ( not ( = ?auto_152555 ?auto_152554 ) ) ( not ( = ?auto_152555 ?auto_152553 ) ) ( not ( = ?auto_152556 ?auto_152557 ) ) ( not ( = ?auto_152556 ?auto_152560 ) ) ( not ( = ?auto_152556 ?auto_152559 ) ) ( not ( = ?auto_152556 ?auto_152554 ) ) ( not ( = ?auto_152556 ?auto_152553 ) ) ( not ( = ?auto_152557 ?auto_152560 ) ) ( not ( = ?auto_152557 ?auto_152559 ) ) ( not ( = ?auto_152557 ?auto_152554 ) ) ( not ( = ?auto_152557 ?auto_152553 ) ) ( not ( = ?auto_152560 ?auto_152559 ) ) ( not ( = ?auto_152560 ?auto_152554 ) ) ( not ( = ?auto_152560 ?auto_152553 ) ) ( not ( = ?auto_152552 ?auto_152555 ) ) ( not ( = ?auto_152552 ?auto_152556 ) ) ( not ( = ?auto_152552 ?auto_152557 ) ) ( not ( = ?auto_152552 ?auto_152560 ) ) ( ON ?auto_152552 ?auto_152558 ) ( not ( = ?auto_152552 ?auto_152558 ) ) ( not ( = ?auto_152553 ?auto_152558 ) ) ( not ( = ?auto_152554 ?auto_152558 ) ) ( not ( = ?auto_152559 ?auto_152558 ) ) ( not ( = ?auto_152555 ?auto_152558 ) ) ( not ( = ?auto_152556 ?auto_152558 ) ) ( not ( = ?auto_152557 ?auto_152558 ) ) ( not ( = ?auto_152560 ?auto_152558 ) ) ( ON ?auto_152553 ?auto_152552 ) ( ON-TABLE ?auto_152558 ) ( ON ?auto_152554 ?auto_152553 ) ( ON ?auto_152559 ?auto_152554 ) ( CLEAR ?auto_152559 ) ( HOLDING ?auto_152560 ) ( CLEAR ?auto_152557 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152555 ?auto_152556 ?auto_152557 ?auto_152560 )
      ( MAKE-3PILE ?auto_152552 ?auto_152553 ?auto_152554 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152561 - BLOCK
      ?auto_152562 - BLOCK
      ?auto_152563 - BLOCK
    )
    :vars
    (
      ?auto_152566 - BLOCK
      ?auto_152564 - BLOCK
      ?auto_152567 - BLOCK
      ?auto_152569 - BLOCK
      ?auto_152565 - BLOCK
      ?auto_152568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152561 ?auto_152562 ) ) ( not ( = ?auto_152561 ?auto_152563 ) ) ( not ( = ?auto_152562 ?auto_152563 ) ) ( not ( = ?auto_152561 ?auto_152566 ) ) ( not ( = ?auto_152562 ?auto_152566 ) ) ( not ( = ?auto_152563 ?auto_152566 ) ) ( ON-TABLE ?auto_152564 ) ( ON ?auto_152567 ?auto_152564 ) ( ON ?auto_152569 ?auto_152567 ) ( not ( = ?auto_152564 ?auto_152567 ) ) ( not ( = ?auto_152564 ?auto_152569 ) ) ( not ( = ?auto_152564 ?auto_152565 ) ) ( not ( = ?auto_152564 ?auto_152566 ) ) ( not ( = ?auto_152564 ?auto_152563 ) ) ( not ( = ?auto_152564 ?auto_152562 ) ) ( not ( = ?auto_152567 ?auto_152569 ) ) ( not ( = ?auto_152567 ?auto_152565 ) ) ( not ( = ?auto_152567 ?auto_152566 ) ) ( not ( = ?auto_152567 ?auto_152563 ) ) ( not ( = ?auto_152567 ?auto_152562 ) ) ( not ( = ?auto_152569 ?auto_152565 ) ) ( not ( = ?auto_152569 ?auto_152566 ) ) ( not ( = ?auto_152569 ?auto_152563 ) ) ( not ( = ?auto_152569 ?auto_152562 ) ) ( not ( = ?auto_152565 ?auto_152566 ) ) ( not ( = ?auto_152565 ?auto_152563 ) ) ( not ( = ?auto_152565 ?auto_152562 ) ) ( not ( = ?auto_152561 ?auto_152564 ) ) ( not ( = ?auto_152561 ?auto_152567 ) ) ( not ( = ?auto_152561 ?auto_152569 ) ) ( not ( = ?auto_152561 ?auto_152565 ) ) ( ON ?auto_152561 ?auto_152568 ) ( not ( = ?auto_152561 ?auto_152568 ) ) ( not ( = ?auto_152562 ?auto_152568 ) ) ( not ( = ?auto_152563 ?auto_152568 ) ) ( not ( = ?auto_152566 ?auto_152568 ) ) ( not ( = ?auto_152564 ?auto_152568 ) ) ( not ( = ?auto_152567 ?auto_152568 ) ) ( not ( = ?auto_152569 ?auto_152568 ) ) ( not ( = ?auto_152565 ?auto_152568 ) ) ( ON ?auto_152562 ?auto_152561 ) ( ON-TABLE ?auto_152568 ) ( ON ?auto_152563 ?auto_152562 ) ( ON ?auto_152566 ?auto_152563 ) ( CLEAR ?auto_152569 ) ( ON ?auto_152565 ?auto_152566 ) ( CLEAR ?auto_152565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152568 ?auto_152561 ?auto_152562 ?auto_152563 ?auto_152566 )
      ( MAKE-3PILE ?auto_152561 ?auto_152562 ?auto_152563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152570 - BLOCK
      ?auto_152571 - BLOCK
      ?auto_152572 - BLOCK
    )
    :vars
    (
      ?auto_152575 - BLOCK
      ?auto_152577 - BLOCK
      ?auto_152576 - BLOCK
      ?auto_152573 - BLOCK
      ?auto_152578 - BLOCK
      ?auto_152574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152570 ?auto_152571 ) ) ( not ( = ?auto_152570 ?auto_152572 ) ) ( not ( = ?auto_152571 ?auto_152572 ) ) ( not ( = ?auto_152570 ?auto_152575 ) ) ( not ( = ?auto_152571 ?auto_152575 ) ) ( not ( = ?auto_152572 ?auto_152575 ) ) ( ON-TABLE ?auto_152577 ) ( ON ?auto_152576 ?auto_152577 ) ( not ( = ?auto_152577 ?auto_152576 ) ) ( not ( = ?auto_152577 ?auto_152573 ) ) ( not ( = ?auto_152577 ?auto_152578 ) ) ( not ( = ?auto_152577 ?auto_152575 ) ) ( not ( = ?auto_152577 ?auto_152572 ) ) ( not ( = ?auto_152577 ?auto_152571 ) ) ( not ( = ?auto_152576 ?auto_152573 ) ) ( not ( = ?auto_152576 ?auto_152578 ) ) ( not ( = ?auto_152576 ?auto_152575 ) ) ( not ( = ?auto_152576 ?auto_152572 ) ) ( not ( = ?auto_152576 ?auto_152571 ) ) ( not ( = ?auto_152573 ?auto_152578 ) ) ( not ( = ?auto_152573 ?auto_152575 ) ) ( not ( = ?auto_152573 ?auto_152572 ) ) ( not ( = ?auto_152573 ?auto_152571 ) ) ( not ( = ?auto_152578 ?auto_152575 ) ) ( not ( = ?auto_152578 ?auto_152572 ) ) ( not ( = ?auto_152578 ?auto_152571 ) ) ( not ( = ?auto_152570 ?auto_152577 ) ) ( not ( = ?auto_152570 ?auto_152576 ) ) ( not ( = ?auto_152570 ?auto_152573 ) ) ( not ( = ?auto_152570 ?auto_152578 ) ) ( ON ?auto_152570 ?auto_152574 ) ( not ( = ?auto_152570 ?auto_152574 ) ) ( not ( = ?auto_152571 ?auto_152574 ) ) ( not ( = ?auto_152572 ?auto_152574 ) ) ( not ( = ?auto_152575 ?auto_152574 ) ) ( not ( = ?auto_152577 ?auto_152574 ) ) ( not ( = ?auto_152576 ?auto_152574 ) ) ( not ( = ?auto_152573 ?auto_152574 ) ) ( not ( = ?auto_152578 ?auto_152574 ) ) ( ON ?auto_152571 ?auto_152570 ) ( ON-TABLE ?auto_152574 ) ( ON ?auto_152572 ?auto_152571 ) ( ON ?auto_152575 ?auto_152572 ) ( ON ?auto_152578 ?auto_152575 ) ( CLEAR ?auto_152578 ) ( HOLDING ?auto_152573 ) ( CLEAR ?auto_152576 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152577 ?auto_152576 ?auto_152573 )
      ( MAKE-3PILE ?auto_152570 ?auto_152571 ?auto_152572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152579 - BLOCK
      ?auto_152580 - BLOCK
      ?auto_152581 - BLOCK
    )
    :vars
    (
      ?auto_152587 - BLOCK
      ?auto_152582 - BLOCK
      ?auto_152586 - BLOCK
      ?auto_152585 - BLOCK
      ?auto_152583 - BLOCK
      ?auto_152584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152579 ?auto_152580 ) ) ( not ( = ?auto_152579 ?auto_152581 ) ) ( not ( = ?auto_152580 ?auto_152581 ) ) ( not ( = ?auto_152579 ?auto_152587 ) ) ( not ( = ?auto_152580 ?auto_152587 ) ) ( not ( = ?auto_152581 ?auto_152587 ) ) ( ON-TABLE ?auto_152582 ) ( ON ?auto_152586 ?auto_152582 ) ( not ( = ?auto_152582 ?auto_152586 ) ) ( not ( = ?auto_152582 ?auto_152585 ) ) ( not ( = ?auto_152582 ?auto_152583 ) ) ( not ( = ?auto_152582 ?auto_152587 ) ) ( not ( = ?auto_152582 ?auto_152581 ) ) ( not ( = ?auto_152582 ?auto_152580 ) ) ( not ( = ?auto_152586 ?auto_152585 ) ) ( not ( = ?auto_152586 ?auto_152583 ) ) ( not ( = ?auto_152586 ?auto_152587 ) ) ( not ( = ?auto_152586 ?auto_152581 ) ) ( not ( = ?auto_152586 ?auto_152580 ) ) ( not ( = ?auto_152585 ?auto_152583 ) ) ( not ( = ?auto_152585 ?auto_152587 ) ) ( not ( = ?auto_152585 ?auto_152581 ) ) ( not ( = ?auto_152585 ?auto_152580 ) ) ( not ( = ?auto_152583 ?auto_152587 ) ) ( not ( = ?auto_152583 ?auto_152581 ) ) ( not ( = ?auto_152583 ?auto_152580 ) ) ( not ( = ?auto_152579 ?auto_152582 ) ) ( not ( = ?auto_152579 ?auto_152586 ) ) ( not ( = ?auto_152579 ?auto_152585 ) ) ( not ( = ?auto_152579 ?auto_152583 ) ) ( ON ?auto_152579 ?auto_152584 ) ( not ( = ?auto_152579 ?auto_152584 ) ) ( not ( = ?auto_152580 ?auto_152584 ) ) ( not ( = ?auto_152581 ?auto_152584 ) ) ( not ( = ?auto_152587 ?auto_152584 ) ) ( not ( = ?auto_152582 ?auto_152584 ) ) ( not ( = ?auto_152586 ?auto_152584 ) ) ( not ( = ?auto_152585 ?auto_152584 ) ) ( not ( = ?auto_152583 ?auto_152584 ) ) ( ON ?auto_152580 ?auto_152579 ) ( ON-TABLE ?auto_152584 ) ( ON ?auto_152581 ?auto_152580 ) ( ON ?auto_152587 ?auto_152581 ) ( ON ?auto_152583 ?auto_152587 ) ( CLEAR ?auto_152586 ) ( ON ?auto_152585 ?auto_152583 ) ( CLEAR ?auto_152585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152584 ?auto_152579 ?auto_152580 ?auto_152581 ?auto_152587 ?auto_152583 )
      ( MAKE-3PILE ?auto_152579 ?auto_152580 ?auto_152581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152588 - BLOCK
      ?auto_152589 - BLOCK
      ?auto_152590 - BLOCK
    )
    :vars
    (
      ?auto_152594 - BLOCK
      ?auto_152595 - BLOCK
      ?auto_152591 - BLOCK
      ?auto_152592 - BLOCK
      ?auto_152593 - BLOCK
      ?auto_152596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152588 ?auto_152589 ) ) ( not ( = ?auto_152588 ?auto_152590 ) ) ( not ( = ?auto_152589 ?auto_152590 ) ) ( not ( = ?auto_152588 ?auto_152594 ) ) ( not ( = ?auto_152589 ?auto_152594 ) ) ( not ( = ?auto_152590 ?auto_152594 ) ) ( ON-TABLE ?auto_152595 ) ( not ( = ?auto_152595 ?auto_152591 ) ) ( not ( = ?auto_152595 ?auto_152592 ) ) ( not ( = ?auto_152595 ?auto_152593 ) ) ( not ( = ?auto_152595 ?auto_152594 ) ) ( not ( = ?auto_152595 ?auto_152590 ) ) ( not ( = ?auto_152595 ?auto_152589 ) ) ( not ( = ?auto_152591 ?auto_152592 ) ) ( not ( = ?auto_152591 ?auto_152593 ) ) ( not ( = ?auto_152591 ?auto_152594 ) ) ( not ( = ?auto_152591 ?auto_152590 ) ) ( not ( = ?auto_152591 ?auto_152589 ) ) ( not ( = ?auto_152592 ?auto_152593 ) ) ( not ( = ?auto_152592 ?auto_152594 ) ) ( not ( = ?auto_152592 ?auto_152590 ) ) ( not ( = ?auto_152592 ?auto_152589 ) ) ( not ( = ?auto_152593 ?auto_152594 ) ) ( not ( = ?auto_152593 ?auto_152590 ) ) ( not ( = ?auto_152593 ?auto_152589 ) ) ( not ( = ?auto_152588 ?auto_152595 ) ) ( not ( = ?auto_152588 ?auto_152591 ) ) ( not ( = ?auto_152588 ?auto_152592 ) ) ( not ( = ?auto_152588 ?auto_152593 ) ) ( ON ?auto_152588 ?auto_152596 ) ( not ( = ?auto_152588 ?auto_152596 ) ) ( not ( = ?auto_152589 ?auto_152596 ) ) ( not ( = ?auto_152590 ?auto_152596 ) ) ( not ( = ?auto_152594 ?auto_152596 ) ) ( not ( = ?auto_152595 ?auto_152596 ) ) ( not ( = ?auto_152591 ?auto_152596 ) ) ( not ( = ?auto_152592 ?auto_152596 ) ) ( not ( = ?auto_152593 ?auto_152596 ) ) ( ON ?auto_152589 ?auto_152588 ) ( ON-TABLE ?auto_152596 ) ( ON ?auto_152590 ?auto_152589 ) ( ON ?auto_152594 ?auto_152590 ) ( ON ?auto_152593 ?auto_152594 ) ( ON ?auto_152592 ?auto_152593 ) ( CLEAR ?auto_152592 ) ( HOLDING ?auto_152591 ) ( CLEAR ?auto_152595 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152595 ?auto_152591 )
      ( MAKE-3PILE ?auto_152588 ?auto_152589 ?auto_152590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152597 - BLOCK
      ?auto_152598 - BLOCK
      ?auto_152599 - BLOCK
    )
    :vars
    (
      ?auto_152603 - BLOCK
      ?auto_152602 - BLOCK
      ?auto_152600 - BLOCK
      ?auto_152605 - BLOCK
      ?auto_152601 - BLOCK
      ?auto_152604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152597 ?auto_152598 ) ) ( not ( = ?auto_152597 ?auto_152599 ) ) ( not ( = ?auto_152598 ?auto_152599 ) ) ( not ( = ?auto_152597 ?auto_152603 ) ) ( not ( = ?auto_152598 ?auto_152603 ) ) ( not ( = ?auto_152599 ?auto_152603 ) ) ( ON-TABLE ?auto_152602 ) ( not ( = ?auto_152602 ?auto_152600 ) ) ( not ( = ?auto_152602 ?auto_152605 ) ) ( not ( = ?auto_152602 ?auto_152601 ) ) ( not ( = ?auto_152602 ?auto_152603 ) ) ( not ( = ?auto_152602 ?auto_152599 ) ) ( not ( = ?auto_152602 ?auto_152598 ) ) ( not ( = ?auto_152600 ?auto_152605 ) ) ( not ( = ?auto_152600 ?auto_152601 ) ) ( not ( = ?auto_152600 ?auto_152603 ) ) ( not ( = ?auto_152600 ?auto_152599 ) ) ( not ( = ?auto_152600 ?auto_152598 ) ) ( not ( = ?auto_152605 ?auto_152601 ) ) ( not ( = ?auto_152605 ?auto_152603 ) ) ( not ( = ?auto_152605 ?auto_152599 ) ) ( not ( = ?auto_152605 ?auto_152598 ) ) ( not ( = ?auto_152601 ?auto_152603 ) ) ( not ( = ?auto_152601 ?auto_152599 ) ) ( not ( = ?auto_152601 ?auto_152598 ) ) ( not ( = ?auto_152597 ?auto_152602 ) ) ( not ( = ?auto_152597 ?auto_152600 ) ) ( not ( = ?auto_152597 ?auto_152605 ) ) ( not ( = ?auto_152597 ?auto_152601 ) ) ( ON ?auto_152597 ?auto_152604 ) ( not ( = ?auto_152597 ?auto_152604 ) ) ( not ( = ?auto_152598 ?auto_152604 ) ) ( not ( = ?auto_152599 ?auto_152604 ) ) ( not ( = ?auto_152603 ?auto_152604 ) ) ( not ( = ?auto_152602 ?auto_152604 ) ) ( not ( = ?auto_152600 ?auto_152604 ) ) ( not ( = ?auto_152605 ?auto_152604 ) ) ( not ( = ?auto_152601 ?auto_152604 ) ) ( ON ?auto_152598 ?auto_152597 ) ( ON-TABLE ?auto_152604 ) ( ON ?auto_152599 ?auto_152598 ) ( ON ?auto_152603 ?auto_152599 ) ( ON ?auto_152601 ?auto_152603 ) ( ON ?auto_152605 ?auto_152601 ) ( CLEAR ?auto_152602 ) ( ON ?auto_152600 ?auto_152605 ) ( CLEAR ?auto_152600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152604 ?auto_152597 ?auto_152598 ?auto_152599 ?auto_152603 ?auto_152601 ?auto_152605 )
      ( MAKE-3PILE ?auto_152597 ?auto_152598 ?auto_152599 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152606 - BLOCK
      ?auto_152607 - BLOCK
      ?auto_152608 - BLOCK
    )
    :vars
    (
      ?auto_152611 - BLOCK
      ?auto_152609 - BLOCK
      ?auto_152610 - BLOCK
      ?auto_152614 - BLOCK
      ?auto_152612 - BLOCK
      ?auto_152613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152606 ?auto_152607 ) ) ( not ( = ?auto_152606 ?auto_152608 ) ) ( not ( = ?auto_152607 ?auto_152608 ) ) ( not ( = ?auto_152606 ?auto_152611 ) ) ( not ( = ?auto_152607 ?auto_152611 ) ) ( not ( = ?auto_152608 ?auto_152611 ) ) ( not ( = ?auto_152609 ?auto_152610 ) ) ( not ( = ?auto_152609 ?auto_152614 ) ) ( not ( = ?auto_152609 ?auto_152612 ) ) ( not ( = ?auto_152609 ?auto_152611 ) ) ( not ( = ?auto_152609 ?auto_152608 ) ) ( not ( = ?auto_152609 ?auto_152607 ) ) ( not ( = ?auto_152610 ?auto_152614 ) ) ( not ( = ?auto_152610 ?auto_152612 ) ) ( not ( = ?auto_152610 ?auto_152611 ) ) ( not ( = ?auto_152610 ?auto_152608 ) ) ( not ( = ?auto_152610 ?auto_152607 ) ) ( not ( = ?auto_152614 ?auto_152612 ) ) ( not ( = ?auto_152614 ?auto_152611 ) ) ( not ( = ?auto_152614 ?auto_152608 ) ) ( not ( = ?auto_152614 ?auto_152607 ) ) ( not ( = ?auto_152612 ?auto_152611 ) ) ( not ( = ?auto_152612 ?auto_152608 ) ) ( not ( = ?auto_152612 ?auto_152607 ) ) ( not ( = ?auto_152606 ?auto_152609 ) ) ( not ( = ?auto_152606 ?auto_152610 ) ) ( not ( = ?auto_152606 ?auto_152614 ) ) ( not ( = ?auto_152606 ?auto_152612 ) ) ( ON ?auto_152606 ?auto_152613 ) ( not ( = ?auto_152606 ?auto_152613 ) ) ( not ( = ?auto_152607 ?auto_152613 ) ) ( not ( = ?auto_152608 ?auto_152613 ) ) ( not ( = ?auto_152611 ?auto_152613 ) ) ( not ( = ?auto_152609 ?auto_152613 ) ) ( not ( = ?auto_152610 ?auto_152613 ) ) ( not ( = ?auto_152614 ?auto_152613 ) ) ( not ( = ?auto_152612 ?auto_152613 ) ) ( ON ?auto_152607 ?auto_152606 ) ( ON-TABLE ?auto_152613 ) ( ON ?auto_152608 ?auto_152607 ) ( ON ?auto_152611 ?auto_152608 ) ( ON ?auto_152612 ?auto_152611 ) ( ON ?auto_152614 ?auto_152612 ) ( ON ?auto_152610 ?auto_152614 ) ( CLEAR ?auto_152610 ) ( HOLDING ?auto_152609 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152609 )
      ( MAKE-3PILE ?auto_152606 ?auto_152607 ?auto_152608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152615 - BLOCK
      ?auto_152616 - BLOCK
      ?auto_152617 - BLOCK
    )
    :vars
    (
      ?auto_152619 - BLOCK
      ?auto_152621 - BLOCK
      ?auto_152618 - BLOCK
      ?auto_152623 - BLOCK
      ?auto_152620 - BLOCK
      ?auto_152622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152615 ?auto_152616 ) ) ( not ( = ?auto_152615 ?auto_152617 ) ) ( not ( = ?auto_152616 ?auto_152617 ) ) ( not ( = ?auto_152615 ?auto_152619 ) ) ( not ( = ?auto_152616 ?auto_152619 ) ) ( not ( = ?auto_152617 ?auto_152619 ) ) ( not ( = ?auto_152621 ?auto_152618 ) ) ( not ( = ?auto_152621 ?auto_152623 ) ) ( not ( = ?auto_152621 ?auto_152620 ) ) ( not ( = ?auto_152621 ?auto_152619 ) ) ( not ( = ?auto_152621 ?auto_152617 ) ) ( not ( = ?auto_152621 ?auto_152616 ) ) ( not ( = ?auto_152618 ?auto_152623 ) ) ( not ( = ?auto_152618 ?auto_152620 ) ) ( not ( = ?auto_152618 ?auto_152619 ) ) ( not ( = ?auto_152618 ?auto_152617 ) ) ( not ( = ?auto_152618 ?auto_152616 ) ) ( not ( = ?auto_152623 ?auto_152620 ) ) ( not ( = ?auto_152623 ?auto_152619 ) ) ( not ( = ?auto_152623 ?auto_152617 ) ) ( not ( = ?auto_152623 ?auto_152616 ) ) ( not ( = ?auto_152620 ?auto_152619 ) ) ( not ( = ?auto_152620 ?auto_152617 ) ) ( not ( = ?auto_152620 ?auto_152616 ) ) ( not ( = ?auto_152615 ?auto_152621 ) ) ( not ( = ?auto_152615 ?auto_152618 ) ) ( not ( = ?auto_152615 ?auto_152623 ) ) ( not ( = ?auto_152615 ?auto_152620 ) ) ( ON ?auto_152615 ?auto_152622 ) ( not ( = ?auto_152615 ?auto_152622 ) ) ( not ( = ?auto_152616 ?auto_152622 ) ) ( not ( = ?auto_152617 ?auto_152622 ) ) ( not ( = ?auto_152619 ?auto_152622 ) ) ( not ( = ?auto_152621 ?auto_152622 ) ) ( not ( = ?auto_152618 ?auto_152622 ) ) ( not ( = ?auto_152623 ?auto_152622 ) ) ( not ( = ?auto_152620 ?auto_152622 ) ) ( ON ?auto_152616 ?auto_152615 ) ( ON-TABLE ?auto_152622 ) ( ON ?auto_152617 ?auto_152616 ) ( ON ?auto_152619 ?auto_152617 ) ( ON ?auto_152620 ?auto_152619 ) ( ON ?auto_152623 ?auto_152620 ) ( ON ?auto_152618 ?auto_152623 ) ( ON ?auto_152621 ?auto_152618 ) ( CLEAR ?auto_152621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152622 ?auto_152615 ?auto_152616 ?auto_152617 ?auto_152619 ?auto_152620 ?auto_152623 ?auto_152618 )
      ( MAKE-3PILE ?auto_152615 ?auto_152616 ?auto_152617 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152647 - BLOCK
      ?auto_152648 - BLOCK
      ?auto_152649 - BLOCK
      ?auto_152650 - BLOCK
    )
    :vars
    (
      ?auto_152652 - BLOCK
      ?auto_152653 - BLOCK
      ?auto_152651 - BLOCK
      ?auto_152654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152652 ?auto_152650 ) ( ON-TABLE ?auto_152647 ) ( ON ?auto_152648 ?auto_152647 ) ( ON ?auto_152649 ?auto_152648 ) ( ON ?auto_152650 ?auto_152649 ) ( not ( = ?auto_152647 ?auto_152648 ) ) ( not ( = ?auto_152647 ?auto_152649 ) ) ( not ( = ?auto_152647 ?auto_152650 ) ) ( not ( = ?auto_152647 ?auto_152652 ) ) ( not ( = ?auto_152648 ?auto_152649 ) ) ( not ( = ?auto_152648 ?auto_152650 ) ) ( not ( = ?auto_152648 ?auto_152652 ) ) ( not ( = ?auto_152649 ?auto_152650 ) ) ( not ( = ?auto_152649 ?auto_152652 ) ) ( not ( = ?auto_152650 ?auto_152652 ) ) ( not ( = ?auto_152647 ?auto_152653 ) ) ( not ( = ?auto_152647 ?auto_152651 ) ) ( not ( = ?auto_152648 ?auto_152653 ) ) ( not ( = ?auto_152648 ?auto_152651 ) ) ( not ( = ?auto_152649 ?auto_152653 ) ) ( not ( = ?auto_152649 ?auto_152651 ) ) ( not ( = ?auto_152650 ?auto_152653 ) ) ( not ( = ?auto_152650 ?auto_152651 ) ) ( not ( = ?auto_152652 ?auto_152653 ) ) ( not ( = ?auto_152652 ?auto_152651 ) ) ( not ( = ?auto_152653 ?auto_152651 ) ) ( ON ?auto_152653 ?auto_152652 ) ( CLEAR ?auto_152653 ) ( HOLDING ?auto_152651 ) ( CLEAR ?auto_152654 ) ( ON-TABLE ?auto_152654 ) ( not ( = ?auto_152654 ?auto_152651 ) ) ( not ( = ?auto_152647 ?auto_152654 ) ) ( not ( = ?auto_152648 ?auto_152654 ) ) ( not ( = ?auto_152649 ?auto_152654 ) ) ( not ( = ?auto_152650 ?auto_152654 ) ) ( not ( = ?auto_152652 ?auto_152654 ) ) ( not ( = ?auto_152653 ?auto_152654 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152654 ?auto_152651 )
      ( MAKE-4PILE ?auto_152647 ?auto_152648 ?auto_152649 ?auto_152650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152655 - BLOCK
      ?auto_152656 - BLOCK
      ?auto_152657 - BLOCK
      ?auto_152658 - BLOCK
    )
    :vars
    (
      ?auto_152659 - BLOCK
      ?auto_152661 - BLOCK
      ?auto_152660 - BLOCK
      ?auto_152662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152659 ?auto_152658 ) ( ON-TABLE ?auto_152655 ) ( ON ?auto_152656 ?auto_152655 ) ( ON ?auto_152657 ?auto_152656 ) ( ON ?auto_152658 ?auto_152657 ) ( not ( = ?auto_152655 ?auto_152656 ) ) ( not ( = ?auto_152655 ?auto_152657 ) ) ( not ( = ?auto_152655 ?auto_152658 ) ) ( not ( = ?auto_152655 ?auto_152659 ) ) ( not ( = ?auto_152656 ?auto_152657 ) ) ( not ( = ?auto_152656 ?auto_152658 ) ) ( not ( = ?auto_152656 ?auto_152659 ) ) ( not ( = ?auto_152657 ?auto_152658 ) ) ( not ( = ?auto_152657 ?auto_152659 ) ) ( not ( = ?auto_152658 ?auto_152659 ) ) ( not ( = ?auto_152655 ?auto_152661 ) ) ( not ( = ?auto_152655 ?auto_152660 ) ) ( not ( = ?auto_152656 ?auto_152661 ) ) ( not ( = ?auto_152656 ?auto_152660 ) ) ( not ( = ?auto_152657 ?auto_152661 ) ) ( not ( = ?auto_152657 ?auto_152660 ) ) ( not ( = ?auto_152658 ?auto_152661 ) ) ( not ( = ?auto_152658 ?auto_152660 ) ) ( not ( = ?auto_152659 ?auto_152661 ) ) ( not ( = ?auto_152659 ?auto_152660 ) ) ( not ( = ?auto_152661 ?auto_152660 ) ) ( ON ?auto_152661 ?auto_152659 ) ( CLEAR ?auto_152662 ) ( ON-TABLE ?auto_152662 ) ( not ( = ?auto_152662 ?auto_152660 ) ) ( not ( = ?auto_152655 ?auto_152662 ) ) ( not ( = ?auto_152656 ?auto_152662 ) ) ( not ( = ?auto_152657 ?auto_152662 ) ) ( not ( = ?auto_152658 ?auto_152662 ) ) ( not ( = ?auto_152659 ?auto_152662 ) ) ( not ( = ?auto_152661 ?auto_152662 ) ) ( ON ?auto_152660 ?auto_152661 ) ( CLEAR ?auto_152660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152655 ?auto_152656 ?auto_152657 ?auto_152658 ?auto_152659 ?auto_152661 )
      ( MAKE-4PILE ?auto_152655 ?auto_152656 ?auto_152657 ?auto_152658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152663 - BLOCK
      ?auto_152664 - BLOCK
      ?auto_152665 - BLOCK
      ?auto_152666 - BLOCK
    )
    :vars
    (
      ?auto_152668 - BLOCK
      ?auto_152670 - BLOCK
      ?auto_152669 - BLOCK
      ?auto_152667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152668 ?auto_152666 ) ( ON-TABLE ?auto_152663 ) ( ON ?auto_152664 ?auto_152663 ) ( ON ?auto_152665 ?auto_152664 ) ( ON ?auto_152666 ?auto_152665 ) ( not ( = ?auto_152663 ?auto_152664 ) ) ( not ( = ?auto_152663 ?auto_152665 ) ) ( not ( = ?auto_152663 ?auto_152666 ) ) ( not ( = ?auto_152663 ?auto_152668 ) ) ( not ( = ?auto_152664 ?auto_152665 ) ) ( not ( = ?auto_152664 ?auto_152666 ) ) ( not ( = ?auto_152664 ?auto_152668 ) ) ( not ( = ?auto_152665 ?auto_152666 ) ) ( not ( = ?auto_152665 ?auto_152668 ) ) ( not ( = ?auto_152666 ?auto_152668 ) ) ( not ( = ?auto_152663 ?auto_152670 ) ) ( not ( = ?auto_152663 ?auto_152669 ) ) ( not ( = ?auto_152664 ?auto_152670 ) ) ( not ( = ?auto_152664 ?auto_152669 ) ) ( not ( = ?auto_152665 ?auto_152670 ) ) ( not ( = ?auto_152665 ?auto_152669 ) ) ( not ( = ?auto_152666 ?auto_152670 ) ) ( not ( = ?auto_152666 ?auto_152669 ) ) ( not ( = ?auto_152668 ?auto_152670 ) ) ( not ( = ?auto_152668 ?auto_152669 ) ) ( not ( = ?auto_152670 ?auto_152669 ) ) ( ON ?auto_152670 ?auto_152668 ) ( not ( = ?auto_152667 ?auto_152669 ) ) ( not ( = ?auto_152663 ?auto_152667 ) ) ( not ( = ?auto_152664 ?auto_152667 ) ) ( not ( = ?auto_152665 ?auto_152667 ) ) ( not ( = ?auto_152666 ?auto_152667 ) ) ( not ( = ?auto_152668 ?auto_152667 ) ) ( not ( = ?auto_152670 ?auto_152667 ) ) ( ON ?auto_152669 ?auto_152670 ) ( CLEAR ?auto_152669 ) ( HOLDING ?auto_152667 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152667 )
      ( MAKE-4PILE ?auto_152663 ?auto_152664 ?auto_152665 ?auto_152666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152683 - BLOCK
      ?auto_152684 - BLOCK
      ?auto_152685 - BLOCK
      ?auto_152686 - BLOCK
    )
    :vars
    (
      ?auto_152690 - BLOCK
      ?auto_152687 - BLOCK
      ?auto_152689 - BLOCK
      ?auto_152688 - BLOCK
      ?auto_152691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152690 ?auto_152686 ) ( ON-TABLE ?auto_152683 ) ( ON ?auto_152684 ?auto_152683 ) ( ON ?auto_152685 ?auto_152684 ) ( ON ?auto_152686 ?auto_152685 ) ( not ( = ?auto_152683 ?auto_152684 ) ) ( not ( = ?auto_152683 ?auto_152685 ) ) ( not ( = ?auto_152683 ?auto_152686 ) ) ( not ( = ?auto_152683 ?auto_152690 ) ) ( not ( = ?auto_152684 ?auto_152685 ) ) ( not ( = ?auto_152684 ?auto_152686 ) ) ( not ( = ?auto_152684 ?auto_152690 ) ) ( not ( = ?auto_152685 ?auto_152686 ) ) ( not ( = ?auto_152685 ?auto_152690 ) ) ( not ( = ?auto_152686 ?auto_152690 ) ) ( not ( = ?auto_152683 ?auto_152687 ) ) ( not ( = ?auto_152683 ?auto_152689 ) ) ( not ( = ?auto_152684 ?auto_152687 ) ) ( not ( = ?auto_152684 ?auto_152689 ) ) ( not ( = ?auto_152685 ?auto_152687 ) ) ( not ( = ?auto_152685 ?auto_152689 ) ) ( not ( = ?auto_152686 ?auto_152687 ) ) ( not ( = ?auto_152686 ?auto_152689 ) ) ( not ( = ?auto_152690 ?auto_152687 ) ) ( not ( = ?auto_152690 ?auto_152689 ) ) ( not ( = ?auto_152687 ?auto_152689 ) ) ( ON ?auto_152687 ?auto_152690 ) ( not ( = ?auto_152688 ?auto_152689 ) ) ( not ( = ?auto_152683 ?auto_152688 ) ) ( not ( = ?auto_152684 ?auto_152688 ) ) ( not ( = ?auto_152685 ?auto_152688 ) ) ( not ( = ?auto_152686 ?auto_152688 ) ) ( not ( = ?auto_152690 ?auto_152688 ) ) ( not ( = ?auto_152687 ?auto_152688 ) ) ( ON ?auto_152689 ?auto_152687 ) ( CLEAR ?auto_152689 ) ( ON ?auto_152688 ?auto_152691 ) ( CLEAR ?auto_152688 ) ( HAND-EMPTY ) ( not ( = ?auto_152683 ?auto_152691 ) ) ( not ( = ?auto_152684 ?auto_152691 ) ) ( not ( = ?auto_152685 ?auto_152691 ) ) ( not ( = ?auto_152686 ?auto_152691 ) ) ( not ( = ?auto_152690 ?auto_152691 ) ) ( not ( = ?auto_152687 ?auto_152691 ) ) ( not ( = ?auto_152689 ?auto_152691 ) ) ( not ( = ?auto_152688 ?auto_152691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152688 ?auto_152691 )
      ( MAKE-4PILE ?auto_152683 ?auto_152684 ?auto_152685 ?auto_152686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152692 - BLOCK
      ?auto_152693 - BLOCK
      ?auto_152694 - BLOCK
      ?auto_152695 - BLOCK
    )
    :vars
    (
      ?auto_152700 - BLOCK
      ?auto_152696 - BLOCK
      ?auto_152698 - BLOCK
      ?auto_152699 - BLOCK
      ?auto_152697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152700 ?auto_152695 ) ( ON-TABLE ?auto_152692 ) ( ON ?auto_152693 ?auto_152692 ) ( ON ?auto_152694 ?auto_152693 ) ( ON ?auto_152695 ?auto_152694 ) ( not ( = ?auto_152692 ?auto_152693 ) ) ( not ( = ?auto_152692 ?auto_152694 ) ) ( not ( = ?auto_152692 ?auto_152695 ) ) ( not ( = ?auto_152692 ?auto_152700 ) ) ( not ( = ?auto_152693 ?auto_152694 ) ) ( not ( = ?auto_152693 ?auto_152695 ) ) ( not ( = ?auto_152693 ?auto_152700 ) ) ( not ( = ?auto_152694 ?auto_152695 ) ) ( not ( = ?auto_152694 ?auto_152700 ) ) ( not ( = ?auto_152695 ?auto_152700 ) ) ( not ( = ?auto_152692 ?auto_152696 ) ) ( not ( = ?auto_152692 ?auto_152698 ) ) ( not ( = ?auto_152693 ?auto_152696 ) ) ( not ( = ?auto_152693 ?auto_152698 ) ) ( not ( = ?auto_152694 ?auto_152696 ) ) ( not ( = ?auto_152694 ?auto_152698 ) ) ( not ( = ?auto_152695 ?auto_152696 ) ) ( not ( = ?auto_152695 ?auto_152698 ) ) ( not ( = ?auto_152700 ?auto_152696 ) ) ( not ( = ?auto_152700 ?auto_152698 ) ) ( not ( = ?auto_152696 ?auto_152698 ) ) ( ON ?auto_152696 ?auto_152700 ) ( not ( = ?auto_152699 ?auto_152698 ) ) ( not ( = ?auto_152692 ?auto_152699 ) ) ( not ( = ?auto_152693 ?auto_152699 ) ) ( not ( = ?auto_152694 ?auto_152699 ) ) ( not ( = ?auto_152695 ?auto_152699 ) ) ( not ( = ?auto_152700 ?auto_152699 ) ) ( not ( = ?auto_152696 ?auto_152699 ) ) ( ON ?auto_152699 ?auto_152697 ) ( CLEAR ?auto_152699 ) ( not ( = ?auto_152692 ?auto_152697 ) ) ( not ( = ?auto_152693 ?auto_152697 ) ) ( not ( = ?auto_152694 ?auto_152697 ) ) ( not ( = ?auto_152695 ?auto_152697 ) ) ( not ( = ?auto_152700 ?auto_152697 ) ) ( not ( = ?auto_152696 ?auto_152697 ) ) ( not ( = ?auto_152698 ?auto_152697 ) ) ( not ( = ?auto_152699 ?auto_152697 ) ) ( HOLDING ?auto_152698 ) ( CLEAR ?auto_152696 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152692 ?auto_152693 ?auto_152694 ?auto_152695 ?auto_152700 ?auto_152696 ?auto_152698 )
      ( MAKE-4PILE ?auto_152692 ?auto_152693 ?auto_152694 ?auto_152695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152774 - BLOCK
      ?auto_152775 - BLOCK
      ?auto_152776 - BLOCK
      ?auto_152777 - BLOCK
    )
    :vars
    (
      ?auto_152778 - BLOCK
      ?auto_152780 - BLOCK
      ?auto_152781 - BLOCK
      ?auto_152779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152774 ) ( ON ?auto_152775 ?auto_152774 ) ( not ( = ?auto_152774 ?auto_152775 ) ) ( not ( = ?auto_152774 ?auto_152776 ) ) ( not ( = ?auto_152774 ?auto_152777 ) ) ( not ( = ?auto_152775 ?auto_152776 ) ) ( not ( = ?auto_152775 ?auto_152777 ) ) ( not ( = ?auto_152776 ?auto_152777 ) ) ( ON ?auto_152777 ?auto_152778 ) ( not ( = ?auto_152774 ?auto_152778 ) ) ( not ( = ?auto_152775 ?auto_152778 ) ) ( not ( = ?auto_152776 ?auto_152778 ) ) ( not ( = ?auto_152777 ?auto_152778 ) ) ( CLEAR ?auto_152775 ) ( ON ?auto_152776 ?auto_152777 ) ( CLEAR ?auto_152776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152780 ) ( ON ?auto_152781 ?auto_152780 ) ( ON ?auto_152779 ?auto_152781 ) ( ON ?auto_152778 ?auto_152779 ) ( not ( = ?auto_152780 ?auto_152781 ) ) ( not ( = ?auto_152780 ?auto_152779 ) ) ( not ( = ?auto_152780 ?auto_152778 ) ) ( not ( = ?auto_152780 ?auto_152777 ) ) ( not ( = ?auto_152780 ?auto_152776 ) ) ( not ( = ?auto_152781 ?auto_152779 ) ) ( not ( = ?auto_152781 ?auto_152778 ) ) ( not ( = ?auto_152781 ?auto_152777 ) ) ( not ( = ?auto_152781 ?auto_152776 ) ) ( not ( = ?auto_152779 ?auto_152778 ) ) ( not ( = ?auto_152779 ?auto_152777 ) ) ( not ( = ?auto_152779 ?auto_152776 ) ) ( not ( = ?auto_152774 ?auto_152780 ) ) ( not ( = ?auto_152774 ?auto_152781 ) ) ( not ( = ?auto_152774 ?auto_152779 ) ) ( not ( = ?auto_152775 ?auto_152780 ) ) ( not ( = ?auto_152775 ?auto_152781 ) ) ( not ( = ?auto_152775 ?auto_152779 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152780 ?auto_152781 ?auto_152779 ?auto_152778 ?auto_152777 )
      ( MAKE-4PILE ?auto_152774 ?auto_152775 ?auto_152776 ?auto_152777 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152782 - BLOCK
      ?auto_152783 - BLOCK
      ?auto_152784 - BLOCK
      ?auto_152785 - BLOCK
    )
    :vars
    (
      ?auto_152787 - BLOCK
      ?auto_152789 - BLOCK
      ?auto_152786 - BLOCK
      ?auto_152788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152782 ) ( not ( = ?auto_152782 ?auto_152783 ) ) ( not ( = ?auto_152782 ?auto_152784 ) ) ( not ( = ?auto_152782 ?auto_152785 ) ) ( not ( = ?auto_152783 ?auto_152784 ) ) ( not ( = ?auto_152783 ?auto_152785 ) ) ( not ( = ?auto_152784 ?auto_152785 ) ) ( ON ?auto_152785 ?auto_152787 ) ( not ( = ?auto_152782 ?auto_152787 ) ) ( not ( = ?auto_152783 ?auto_152787 ) ) ( not ( = ?auto_152784 ?auto_152787 ) ) ( not ( = ?auto_152785 ?auto_152787 ) ) ( ON ?auto_152784 ?auto_152785 ) ( CLEAR ?auto_152784 ) ( ON-TABLE ?auto_152789 ) ( ON ?auto_152786 ?auto_152789 ) ( ON ?auto_152788 ?auto_152786 ) ( ON ?auto_152787 ?auto_152788 ) ( not ( = ?auto_152789 ?auto_152786 ) ) ( not ( = ?auto_152789 ?auto_152788 ) ) ( not ( = ?auto_152789 ?auto_152787 ) ) ( not ( = ?auto_152789 ?auto_152785 ) ) ( not ( = ?auto_152789 ?auto_152784 ) ) ( not ( = ?auto_152786 ?auto_152788 ) ) ( not ( = ?auto_152786 ?auto_152787 ) ) ( not ( = ?auto_152786 ?auto_152785 ) ) ( not ( = ?auto_152786 ?auto_152784 ) ) ( not ( = ?auto_152788 ?auto_152787 ) ) ( not ( = ?auto_152788 ?auto_152785 ) ) ( not ( = ?auto_152788 ?auto_152784 ) ) ( not ( = ?auto_152782 ?auto_152789 ) ) ( not ( = ?auto_152782 ?auto_152786 ) ) ( not ( = ?auto_152782 ?auto_152788 ) ) ( not ( = ?auto_152783 ?auto_152789 ) ) ( not ( = ?auto_152783 ?auto_152786 ) ) ( not ( = ?auto_152783 ?auto_152788 ) ) ( HOLDING ?auto_152783 ) ( CLEAR ?auto_152782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152782 ?auto_152783 )
      ( MAKE-4PILE ?auto_152782 ?auto_152783 ?auto_152784 ?auto_152785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152790 - BLOCK
      ?auto_152791 - BLOCK
      ?auto_152792 - BLOCK
      ?auto_152793 - BLOCK
    )
    :vars
    (
      ?auto_152795 - BLOCK
      ?auto_152794 - BLOCK
      ?auto_152797 - BLOCK
      ?auto_152796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_152790 ) ( not ( = ?auto_152790 ?auto_152791 ) ) ( not ( = ?auto_152790 ?auto_152792 ) ) ( not ( = ?auto_152790 ?auto_152793 ) ) ( not ( = ?auto_152791 ?auto_152792 ) ) ( not ( = ?auto_152791 ?auto_152793 ) ) ( not ( = ?auto_152792 ?auto_152793 ) ) ( ON ?auto_152793 ?auto_152795 ) ( not ( = ?auto_152790 ?auto_152795 ) ) ( not ( = ?auto_152791 ?auto_152795 ) ) ( not ( = ?auto_152792 ?auto_152795 ) ) ( not ( = ?auto_152793 ?auto_152795 ) ) ( ON ?auto_152792 ?auto_152793 ) ( ON-TABLE ?auto_152794 ) ( ON ?auto_152797 ?auto_152794 ) ( ON ?auto_152796 ?auto_152797 ) ( ON ?auto_152795 ?auto_152796 ) ( not ( = ?auto_152794 ?auto_152797 ) ) ( not ( = ?auto_152794 ?auto_152796 ) ) ( not ( = ?auto_152794 ?auto_152795 ) ) ( not ( = ?auto_152794 ?auto_152793 ) ) ( not ( = ?auto_152794 ?auto_152792 ) ) ( not ( = ?auto_152797 ?auto_152796 ) ) ( not ( = ?auto_152797 ?auto_152795 ) ) ( not ( = ?auto_152797 ?auto_152793 ) ) ( not ( = ?auto_152797 ?auto_152792 ) ) ( not ( = ?auto_152796 ?auto_152795 ) ) ( not ( = ?auto_152796 ?auto_152793 ) ) ( not ( = ?auto_152796 ?auto_152792 ) ) ( not ( = ?auto_152790 ?auto_152794 ) ) ( not ( = ?auto_152790 ?auto_152797 ) ) ( not ( = ?auto_152790 ?auto_152796 ) ) ( not ( = ?auto_152791 ?auto_152794 ) ) ( not ( = ?auto_152791 ?auto_152797 ) ) ( not ( = ?auto_152791 ?auto_152796 ) ) ( CLEAR ?auto_152790 ) ( ON ?auto_152791 ?auto_152792 ) ( CLEAR ?auto_152791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152794 ?auto_152797 ?auto_152796 ?auto_152795 ?auto_152793 ?auto_152792 )
      ( MAKE-4PILE ?auto_152790 ?auto_152791 ?auto_152792 ?auto_152793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152798 - BLOCK
      ?auto_152799 - BLOCK
      ?auto_152800 - BLOCK
      ?auto_152801 - BLOCK
    )
    :vars
    (
      ?auto_152805 - BLOCK
      ?auto_152804 - BLOCK
      ?auto_152803 - BLOCK
      ?auto_152802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152798 ?auto_152799 ) ) ( not ( = ?auto_152798 ?auto_152800 ) ) ( not ( = ?auto_152798 ?auto_152801 ) ) ( not ( = ?auto_152799 ?auto_152800 ) ) ( not ( = ?auto_152799 ?auto_152801 ) ) ( not ( = ?auto_152800 ?auto_152801 ) ) ( ON ?auto_152801 ?auto_152805 ) ( not ( = ?auto_152798 ?auto_152805 ) ) ( not ( = ?auto_152799 ?auto_152805 ) ) ( not ( = ?auto_152800 ?auto_152805 ) ) ( not ( = ?auto_152801 ?auto_152805 ) ) ( ON ?auto_152800 ?auto_152801 ) ( ON-TABLE ?auto_152804 ) ( ON ?auto_152803 ?auto_152804 ) ( ON ?auto_152802 ?auto_152803 ) ( ON ?auto_152805 ?auto_152802 ) ( not ( = ?auto_152804 ?auto_152803 ) ) ( not ( = ?auto_152804 ?auto_152802 ) ) ( not ( = ?auto_152804 ?auto_152805 ) ) ( not ( = ?auto_152804 ?auto_152801 ) ) ( not ( = ?auto_152804 ?auto_152800 ) ) ( not ( = ?auto_152803 ?auto_152802 ) ) ( not ( = ?auto_152803 ?auto_152805 ) ) ( not ( = ?auto_152803 ?auto_152801 ) ) ( not ( = ?auto_152803 ?auto_152800 ) ) ( not ( = ?auto_152802 ?auto_152805 ) ) ( not ( = ?auto_152802 ?auto_152801 ) ) ( not ( = ?auto_152802 ?auto_152800 ) ) ( not ( = ?auto_152798 ?auto_152804 ) ) ( not ( = ?auto_152798 ?auto_152803 ) ) ( not ( = ?auto_152798 ?auto_152802 ) ) ( not ( = ?auto_152799 ?auto_152804 ) ) ( not ( = ?auto_152799 ?auto_152803 ) ) ( not ( = ?auto_152799 ?auto_152802 ) ) ( ON ?auto_152799 ?auto_152800 ) ( CLEAR ?auto_152799 ) ( HOLDING ?auto_152798 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152798 )
      ( MAKE-4PILE ?auto_152798 ?auto_152799 ?auto_152800 ?auto_152801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152806 - BLOCK
      ?auto_152807 - BLOCK
      ?auto_152808 - BLOCK
      ?auto_152809 - BLOCK
    )
    :vars
    (
      ?auto_152810 - BLOCK
      ?auto_152813 - BLOCK
      ?auto_152812 - BLOCK
      ?auto_152811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152806 ?auto_152807 ) ) ( not ( = ?auto_152806 ?auto_152808 ) ) ( not ( = ?auto_152806 ?auto_152809 ) ) ( not ( = ?auto_152807 ?auto_152808 ) ) ( not ( = ?auto_152807 ?auto_152809 ) ) ( not ( = ?auto_152808 ?auto_152809 ) ) ( ON ?auto_152809 ?auto_152810 ) ( not ( = ?auto_152806 ?auto_152810 ) ) ( not ( = ?auto_152807 ?auto_152810 ) ) ( not ( = ?auto_152808 ?auto_152810 ) ) ( not ( = ?auto_152809 ?auto_152810 ) ) ( ON ?auto_152808 ?auto_152809 ) ( ON-TABLE ?auto_152813 ) ( ON ?auto_152812 ?auto_152813 ) ( ON ?auto_152811 ?auto_152812 ) ( ON ?auto_152810 ?auto_152811 ) ( not ( = ?auto_152813 ?auto_152812 ) ) ( not ( = ?auto_152813 ?auto_152811 ) ) ( not ( = ?auto_152813 ?auto_152810 ) ) ( not ( = ?auto_152813 ?auto_152809 ) ) ( not ( = ?auto_152813 ?auto_152808 ) ) ( not ( = ?auto_152812 ?auto_152811 ) ) ( not ( = ?auto_152812 ?auto_152810 ) ) ( not ( = ?auto_152812 ?auto_152809 ) ) ( not ( = ?auto_152812 ?auto_152808 ) ) ( not ( = ?auto_152811 ?auto_152810 ) ) ( not ( = ?auto_152811 ?auto_152809 ) ) ( not ( = ?auto_152811 ?auto_152808 ) ) ( not ( = ?auto_152806 ?auto_152813 ) ) ( not ( = ?auto_152806 ?auto_152812 ) ) ( not ( = ?auto_152806 ?auto_152811 ) ) ( not ( = ?auto_152807 ?auto_152813 ) ) ( not ( = ?auto_152807 ?auto_152812 ) ) ( not ( = ?auto_152807 ?auto_152811 ) ) ( ON ?auto_152807 ?auto_152808 ) ( ON ?auto_152806 ?auto_152807 ) ( CLEAR ?auto_152806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152813 ?auto_152812 ?auto_152811 ?auto_152810 ?auto_152809 ?auto_152808 ?auto_152807 )
      ( MAKE-4PILE ?auto_152806 ?auto_152807 ?auto_152808 ?auto_152809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152818 - BLOCK
      ?auto_152819 - BLOCK
      ?auto_152820 - BLOCK
      ?auto_152821 - BLOCK
    )
    :vars
    (
      ?auto_152822 - BLOCK
      ?auto_152823 - BLOCK
      ?auto_152825 - BLOCK
      ?auto_152824 - BLOCK
      ?auto_152826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152818 ?auto_152819 ) ) ( not ( = ?auto_152818 ?auto_152820 ) ) ( not ( = ?auto_152818 ?auto_152821 ) ) ( not ( = ?auto_152819 ?auto_152820 ) ) ( not ( = ?auto_152819 ?auto_152821 ) ) ( not ( = ?auto_152820 ?auto_152821 ) ) ( ON ?auto_152821 ?auto_152822 ) ( not ( = ?auto_152818 ?auto_152822 ) ) ( not ( = ?auto_152819 ?auto_152822 ) ) ( not ( = ?auto_152820 ?auto_152822 ) ) ( not ( = ?auto_152821 ?auto_152822 ) ) ( ON ?auto_152820 ?auto_152821 ) ( ON-TABLE ?auto_152823 ) ( ON ?auto_152825 ?auto_152823 ) ( ON ?auto_152824 ?auto_152825 ) ( ON ?auto_152822 ?auto_152824 ) ( not ( = ?auto_152823 ?auto_152825 ) ) ( not ( = ?auto_152823 ?auto_152824 ) ) ( not ( = ?auto_152823 ?auto_152822 ) ) ( not ( = ?auto_152823 ?auto_152821 ) ) ( not ( = ?auto_152823 ?auto_152820 ) ) ( not ( = ?auto_152825 ?auto_152824 ) ) ( not ( = ?auto_152825 ?auto_152822 ) ) ( not ( = ?auto_152825 ?auto_152821 ) ) ( not ( = ?auto_152825 ?auto_152820 ) ) ( not ( = ?auto_152824 ?auto_152822 ) ) ( not ( = ?auto_152824 ?auto_152821 ) ) ( not ( = ?auto_152824 ?auto_152820 ) ) ( not ( = ?auto_152818 ?auto_152823 ) ) ( not ( = ?auto_152818 ?auto_152825 ) ) ( not ( = ?auto_152818 ?auto_152824 ) ) ( not ( = ?auto_152819 ?auto_152823 ) ) ( not ( = ?auto_152819 ?auto_152825 ) ) ( not ( = ?auto_152819 ?auto_152824 ) ) ( ON ?auto_152819 ?auto_152820 ) ( CLEAR ?auto_152819 ) ( ON ?auto_152818 ?auto_152826 ) ( CLEAR ?auto_152818 ) ( HAND-EMPTY ) ( not ( = ?auto_152818 ?auto_152826 ) ) ( not ( = ?auto_152819 ?auto_152826 ) ) ( not ( = ?auto_152820 ?auto_152826 ) ) ( not ( = ?auto_152821 ?auto_152826 ) ) ( not ( = ?auto_152822 ?auto_152826 ) ) ( not ( = ?auto_152823 ?auto_152826 ) ) ( not ( = ?auto_152825 ?auto_152826 ) ) ( not ( = ?auto_152824 ?auto_152826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_152818 ?auto_152826 )
      ( MAKE-4PILE ?auto_152818 ?auto_152819 ?auto_152820 ?auto_152821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152827 - BLOCK
      ?auto_152828 - BLOCK
      ?auto_152829 - BLOCK
      ?auto_152830 - BLOCK
    )
    :vars
    (
      ?auto_152832 - BLOCK
      ?auto_152831 - BLOCK
      ?auto_152835 - BLOCK
      ?auto_152834 - BLOCK
      ?auto_152833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152827 ?auto_152828 ) ) ( not ( = ?auto_152827 ?auto_152829 ) ) ( not ( = ?auto_152827 ?auto_152830 ) ) ( not ( = ?auto_152828 ?auto_152829 ) ) ( not ( = ?auto_152828 ?auto_152830 ) ) ( not ( = ?auto_152829 ?auto_152830 ) ) ( ON ?auto_152830 ?auto_152832 ) ( not ( = ?auto_152827 ?auto_152832 ) ) ( not ( = ?auto_152828 ?auto_152832 ) ) ( not ( = ?auto_152829 ?auto_152832 ) ) ( not ( = ?auto_152830 ?auto_152832 ) ) ( ON ?auto_152829 ?auto_152830 ) ( ON-TABLE ?auto_152831 ) ( ON ?auto_152835 ?auto_152831 ) ( ON ?auto_152834 ?auto_152835 ) ( ON ?auto_152832 ?auto_152834 ) ( not ( = ?auto_152831 ?auto_152835 ) ) ( not ( = ?auto_152831 ?auto_152834 ) ) ( not ( = ?auto_152831 ?auto_152832 ) ) ( not ( = ?auto_152831 ?auto_152830 ) ) ( not ( = ?auto_152831 ?auto_152829 ) ) ( not ( = ?auto_152835 ?auto_152834 ) ) ( not ( = ?auto_152835 ?auto_152832 ) ) ( not ( = ?auto_152835 ?auto_152830 ) ) ( not ( = ?auto_152835 ?auto_152829 ) ) ( not ( = ?auto_152834 ?auto_152832 ) ) ( not ( = ?auto_152834 ?auto_152830 ) ) ( not ( = ?auto_152834 ?auto_152829 ) ) ( not ( = ?auto_152827 ?auto_152831 ) ) ( not ( = ?auto_152827 ?auto_152835 ) ) ( not ( = ?auto_152827 ?auto_152834 ) ) ( not ( = ?auto_152828 ?auto_152831 ) ) ( not ( = ?auto_152828 ?auto_152835 ) ) ( not ( = ?auto_152828 ?auto_152834 ) ) ( ON ?auto_152827 ?auto_152833 ) ( CLEAR ?auto_152827 ) ( not ( = ?auto_152827 ?auto_152833 ) ) ( not ( = ?auto_152828 ?auto_152833 ) ) ( not ( = ?auto_152829 ?auto_152833 ) ) ( not ( = ?auto_152830 ?auto_152833 ) ) ( not ( = ?auto_152832 ?auto_152833 ) ) ( not ( = ?auto_152831 ?auto_152833 ) ) ( not ( = ?auto_152835 ?auto_152833 ) ) ( not ( = ?auto_152834 ?auto_152833 ) ) ( HOLDING ?auto_152828 ) ( CLEAR ?auto_152829 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152831 ?auto_152835 ?auto_152834 ?auto_152832 ?auto_152830 ?auto_152829 ?auto_152828 )
      ( MAKE-4PILE ?auto_152827 ?auto_152828 ?auto_152829 ?auto_152830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152836 - BLOCK
      ?auto_152837 - BLOCK
      ?auto_152838 - BLOCK
      ?auto_152839 - BLOCK
    )
    :vars
    (
      ?auto_152841 - BLOCK
      ?auto_152840 - BLOCK
      ?auto_152844 - BLOCK
      ?auto_152843 - BLOCK
      ?auto_152842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152836 ?auto_152837 ) ) ( not ( = ?auto_152836 ?auto_152838 ) ) ( not ( = ?auto_152836 ?auto_152839 ) ) ( not ( = ?auto_152837 ?auto_152838 ) ) ( not ( = ?auto_152837 ?auto_152839 ) ) ( not ( = ?auto_152838 ?auto_152839 ) ) ( ON ?auto_152839 ?auto_152841 ) ( not ( = ?auto_152836 ?auto_152841 ) ) ( not ( = ?auto_152837 ?auto_152841 ) ) ( not ( = ?auto_152838 ?auto_152841 ) ) ( not ( = ?auto_152839 ?auto_152841 ) ) ( ON ?auto_152838 ?auto_152839 ) ( ON-TABLE ?auto_152840 ) ( ON ?auto_152844 ?auto_152840 ) ( ON ?auto_152843 ?auto_152844 ) ( ON ?auto_152841 ?auto_152843 ) ( not ( = ?auto_152840 ?auto_152844 ) ) ( not ( = ?auto_152840 ?auto_152843 ) ) ( not ( = ?auto_152840 ?auto_152841 ) ) ( not ( = ?auto_152840 ?auto_152839 ) ) ( not ( = ?auto_152840 ?auto_152838 ) ) ( not ( = ?auto_152844 ?auto_152843 ) ) ( not ( = ?auto_152844 ?auto_152841 ) ) ( not ( = ?auto_152844 ?auto_152839 ) ) ( not ( = ?auto_152844 ?auto_152838 ) ) ( not ( = ?auto_152843 ?auto_152841 ) ) ( not ( = ?auto_152843 ?auto_152839 ) ) ( not ( = ?auto_152843 ?auto_152838 ) ) ( not ( = ?auto_152836 ?auto_152840 ) ) ( not ( = ?auto_152836 ?auto_152844 ) ) ( not ( = ?auto_152836 ?auto_152843 ) ) ( not ( = ?auto_152837 ?auto_152840 ) ) ( not ( = ?auto_152837 ?auto_152844 ) ) ( not ( = ?auto_152837 ?auto_152843 ) ) ( ON ?auto_152836 ?auto_152842 ) ( not ( = ?auto_152836 ?auto_152842 ) ) ( not ( = ?auto_152837 ?auto_152842 ) ) ( not ( = ?auto_152838 ?auto_152842 ) ) ( not ( = ?auto_152839 ?auto_152842 ) ) ( not ( = ?auto_152841 ?auto_152842 ) ) ( not ( = ?auto_152840 ?auto_152842 ) ) ( not ( = ?auto_152844 ?auto_152842 ) ) ( not ( = ?auto_152843 ?auto_152842 ) ) ( CLEAR ?auto_152838 ) ( ON ?auto_152837 ?auto_152836 ) ( CLEAR ?auto_152837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_152842 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152842 ?auto_152836 )
      ( MAKE-4PILE ?auto_152836 ?auto_152837 ?auto_152838 ?auto_152839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152845 - BLOCK
      ?auto_152846 - BLOCK
      ?auto_152847 - BLOCK
      ?auto_152848 - BLOCK
    )
    :vars
    (
      ?auto_152852 - BLOCK
      ?auto_152853 - BLOCK
      ?auto_152851 - BLOCK
      ?auto_152849 - BLOCK
      ?auto_152850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152845 ?auto_152846 ) ) ( not ( = ?auto_152845 ?auto_152847 ) ) ( not ( = ?auto_152845 ?auto_152848 ) ) ( not ( = ?auto_152846 ?auto_152847 ) ) ( not ( = ?auto_152846 ?auto_152848 ) ) ( not ( = ?auto_152847 ?auto_152848 ) ) ( ON ?auto_152848 ?auto_152852 ) ( not ( = ?auto_152845 ?auto_152852 ) ) ( not ( = ?auto_152846 ?auto_152852 ) ) ( not ( = ?auto_152847 ?auto_152852 ) ) ( not ( = ?auto_152848 ?auto_152852 ) ) ( ON-TABLE ?auto_152853 ) ( ON ?auto_152851 ?auto_152853 ) ( ON ?auto_152849 ?auto_152851 ) ( ON ?auto_152852 ?auto_152849 ) ( not ( = ?auto_152853 ?auto_152851 ) ) ( not ( = ?auto_152853 ?auto_152849 ) ) ( not ( = ?auto_152853 ?auto_152852 ) ) ( not ( = ?auto_152853 ?auto_152848 ) ) ( not ( = ?auto_152853 ?auto_152847 ) ) ( not ( = ?auto_152851 ?auto_152849 ) ) ( not ( = ?auto_152851 ?auto_152852 ) ) ( not ( = ?auto_152851 ?auto_152848 ) ) ( not ( = ?auto_152851 ?auto_152847 ) ) ( not ( = ?auto_152849 ?auto_152852 ) ) ( not ( = ?auto_152849 ?auto_152848 ) ) ( not ( = ?auto_152849 ?auto_152847 ) ) ( not ( = ?auto_152845 ?auto_152853 ) ) ( not ( = ?auto_152845 ?auto_152851 ) ) ( not ( = ?auto_152845 ?auto_152849 ) ) ( not ( = ?auto_152846 ?auto_152853 ) ) ( not ( = ?auto_152846 ?auto_152851 ) ) ( not ( = ?auto_152846 ?auto_152849 ) ) ( ON ?auto_152845 ?auto_152850 ) ( not ( = ?auto_152845 ?auto_152850 ) ) ( not ( = ?auto_152846 ?auto_152850 ) ) ( not ( = ?auto_152847 ?auto_152850 ) ) ( not ( = ?auto_152848 ?auto_152850 ) ) ( not ( = ?auto_152852 ?auto_152850 ) ) ( not ( = ?auto_152853 ?auto_152850 ) ) ( not ( = ?auto_152851 ?auto_152850 ) ) ( not ( = ?auto_152849 ?auto_152850 ) ) ( ON ?auto_152846 ?auto_152845 ) ( CLEAR ?auto_152846 ) ( ON-TABLE ?auto_152850 ) ( HOLDING ?auto_152847 ) ( CLEAR ?auto_152848 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152853 ?auto_152851 ?auto_152849 ?auto_152852 ?auto_152848 ?auto_152847 )
      ( MAKE-4PILE ?auto_152845 ?auto_152846 ?auto_152847 ?auto_152848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152854 - BLOCK
      ?auto_152855 - BLOCK
      ?auto_152856 - BLOCK
      ?auto_152857 - BLOCK
    )
    :vars
    (
      ?auto_152858 - BLOCK
      ?auto_152862 - BLOCK
      ?auto_152861 - BLOCK
      ?auto_152859 - BLOCK
      ?auto_152860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152854 ?auto_152855 ) ) ( not ( = ?auto_152854 ?auto_152856 ) ) ( not ( = ?auto_152854 ?auto_152857 ) ) ( not ( = ?auto_152855 ?auto_152856 ) ) ( not ( = ?auto_152855 ?auto_152857 ) ) ( not ( = ?auto_152856 ?auto_152857 ) ) ( ON ?auto_152857 ?auto_152858 ) ( not ( = ?auto_152854 ?auto_152858 ) ) ( not ( = ?auto_152855 ?auto_152858 ) ) ( not ( = ?auto_152856 ?auto_152858 ) ) ( not ( = ?auto_152857 ?auto_152858 ) ) ( ON-TABLE ?auto_152862 ) ( ON ?auto_152861 ?auto_152862 ) ( ON ?auto_152859 ?auto_152861 ) ( ON ?auto_152858 ?auto_152859 ) ( not ( = ?auto_152862 ?auto_152861 ) ) ( not ( = ?auto_152862 ?auto_152859 ) ) ( not ( = ?auto_152862 ?auto_152858 ) ) ( not ( = ?auto_152862 ?auto_152857 ) ) ( not ( = ?auto_152862 ?auto_152856 ) ) ( not ( = ?auto_152861 ?auto_152859 ) ) ( not ( = ?auto_152861 ?auto_152858 ) ) ( not ( = ?auto_152861 ?auto_152857 ) ) ( not ( = ?auto_152861 ?auto_152856 ) ) ( not ( = ?auto_152859 ?auto_152858 ) ) ( not ( = ?auto_152859 ?auto_152857 ) ) ( not ( = ?auto_152859 ?auto_152856 ) ) ( not ( = ?auto_152854 ?auto_152862 ) ) ( not ( = ?auto_152854 ?auto_152861 ) ) ( not ( = ?auto_152854 ?auto_152859 ) ) ( not ( = ?auto_152855 ?auto_152862 ) ) ( not ( = ?auto_152855 ?auto_152861 ) ) ( not ( = ?auto_152855 ?auto_152859 ) ) ( ON ?auto_152854 ?auto_152860 ) ( not ( = ?auto_152854 ?auto_152860 ) ) ( not ( = ?auto_152855 ?auto_152860 ) ) ( not ( = ?auto_152856 ?auto_152860 ) ) ( not ( = ?auto_152857 ?auto_152860 ) ) ( not ( = ?auto_152858 ?auto_152860 ) ) ( not ( = ?auto_152862 ?auto_152860 ) ) ( not ( = ?auto_152861 ?auto_152860 ) ) ( not ( = ?auto_152859 ?auto_152860 ) ) ( ON ?auto_152855 ?auto_152854 ) ( ON-TABLE ?auto_152860 ) ( CLEAR ?auto_152857 ) ( ON ?auto_152856 ?auto_152855 ) ( CLEAR ?auto_152856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152860 ?auto_152854 ?auto_152855 )
      ( MAKE-4PILE ?auto_152854 ?auto_152855 ?auto_152856 ?auto_152857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152863 - BLOCK
      ?auto_152864 - BLOCK
      ?auto_152865 - BLOCK
      ?auto_152866 - BLOCK
    )
    :vars
    (
      ?auto_152871 - BLOCK
      ?auto_152869 - BLOCK
      ?auto_152867 - BLOCK
      ?auto_152868 - BLOCK
      ?auto_152870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152863 ?auto_152864 ) ) ( not ( = ?auto_152863 ?auto_152865 ) ) ( not ( = ?auto_152863 ?auto_152866 ) ) ( not ( = ?auto_152864 ?auto_152865 ) ) ( not ( = ?auto_152864 ?auto_152866 ) ) ( not ( = ?auto_152865 ?auto_152866 ) ) ( not ( = ?auto_152863 ?auto_152871 ) ) ( not ( = ?auto_152864 ?auto_152871 ) ) ( not ( = ?auto_152865 ?auto_152871 ) ) ( not ( = ?auto_152866 ?auto_152871 ) ) ( ON-TABLE ?auto_152869 ) ( ON ?auto_152867 ?auto_152869 ) ( ON ?auto_152868 ?auto_152867 ) ( ON ?auto_152871 ?auto_152868 ) ( not ( = ?auto_152869 ?auto_152867 ) ) ( not ( = ?auto_152869 ?auto_152868 ) ) ( not ( = ?auto_152869 ?auto_152871 ) ) ( not ( = ?auto_152869 ?auto_152866 ) ) ( not ( = ?auto_152869 ?auto_152865 ) ) ( not ( = ?auto_152867 ?auto_152868 ) ) ( not ( = ?auto_152867 ?auto_152871 ) ) ( not ( = ?auto_152867 ?auto_152866 ) ) ( not ( = ?auto_152867 ?auto_152865 ) ) ( not ( = ?auto_152868 ?auto_152871 ) ) ( not ( = ?auto_152868 ?auto_152866 ) ) ( not ( = ?auto_152868 ?auto_152865 ) ) ( not ( = ?auto_152863 ?auto_152869 ) ) ( not ( = ?auto_152863 ?auto_152867 ) ) ( not ( = ?auto_152863 ?auto_152868 ) ) ( not ( = ?auto_152864 ?auto_152869 ) ) ( not ( = ?auto_152864 ?auto_152867 ) ) ( not ( = ?auto_152864 ?auto_152868 ) ) ( ON ?auto_152863 ?auto_152870 ) ( not ( = ?auto_152863 ?auto_152870 ) ) ( not ( = ?auto_152864 ?auto_152870 ) ) ( not ( = ?auto_152865 ?auto_152870 ) ) ( not ( = ?auto_152866 ?auto_152870 ) ) ( not ( = ?auto_152871 ?auto_152870 ) ) ( not ( = ?auto_152869 ?auto_152870 ) ) ( not ( = ?auto_152867 ?auto_152870 ) ) ( not ( = ?auto_152868 ?auto_152870 ) ) ( ON ?auto_152864 ?auto_152863 ) ( ON-TABLE ?auto_152870 ) ( ON ?auto_152865 ?auto_152864 ) ( CLEAR ?auto_152865 ) ( HOLDING ?auto_152866 ) ( CLEAR ?auto_152871 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152869 ?auto_152867 ?auto_152868 ?auto_152871 ?auto_152866 )
      ( MAKE-4PILE ?auto_152863 ?auto_152864 ?auto_152865 ?auto_152866 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152872 - BLOCK
      ?auto_152873 - BLOCK
      ?auto_152874 - BLOCK
      ?auto_152875 - BLOCK
    )
    :vars
    (
      ?auto_152876 - BLOCK
      ?auto_152877 - BLOCK
      ?auto_152878 - BLOCK
      ?auto_152880 - BLOCK
      ?auto_152879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152872 ?auto_152873 ) ) ( not ( = ?auto_152872 ?auto_152874 ) ) ( not ( = ?auto_152872 ?auto_152875 ) ) ( not ( = ?auto_152873 ?auto_152874 ) ) ( not ( = ?auto_152873 ?auto_152875 ) ) ( not ( = ?auto_152874 ?auto_152875 ) ) ( not ( = ?auto_152872 ?auto_152876 ) ) ( not ( = ?auto_152873 ?auto_152876 ) ) ( not ( = ?auto_152874 ?auto_152876 ) ) ( not ( = ?auto_152875 ?auto_152876 ) ) ( ON-TABLE ?auto_152877 ) ( ON ?auto_152878 ?auto_152877 ) ( ON ?auto_152880 ?auto_152878 ) ( ON ?auto_152876 ?auto_152880 ) ( not ( = ?auto_152877 ?auto_152878 ) ) ( not ( = ?auto_152877 ?auto_152880 ) ) ( not ( = ?auto_152877 ?auto_152876 ) ) ( not ( = ?auto_152877 ?auto_152875 ) ) ( not ( = ?auto_152877 ?auto_152874 ) ) ( not ( = ?auto_152878 ?auto_152880 ) ) ( not ( = ?auto_152878 ?auto_152876 ) ) ( not ( = ?auto_152878 ?auto_152875 ) ) ( not ( = ?auto_152878 ?auto_152874 ) ) ( not ( = ?auto_152880 ?auto_152876 ) ) ( not ( = ?auto_152880 ?auto_152875 ) ) ( not ( = ?auto_152880 ?auto_152874 ) ) ( not ( = ?auto_152872 ?auto_152877 ) ) ( not ( = ?auto_152872 ?auto_152878 ) ) ( not ( = ?auto_152872 ?auto_152880 ) ) ( not ( = ?auto_152873 ?auto_152877 ) ) ( not ( = ?auto_152873 ?auto_152878 ) ) ( not ( = ?auto_152873 ?auto_152880 ) ) ( ON ?auto_152872 ?auto_152879 ) ( not ( = ?auto_152872 ?auto_152879 ) ) ( not ( = ?auto_152873 ?auto_152879 ) ) ( not ( = ?auto_152874 ?auto_152879 ) ) ( not ( = ?auto_152875 ?auto_152879 ) ) ( not ( = ?auto_152876 ?auto_152879 ) ) ( not ( = ?auto_152877 ?auto_152879 ) ) ( not ( = ?auto_152878 ?auto_152879 ) ) ( not ( = ?auto_152880 ?auto_152879 ) ) ( ON ?auto_152873 ?auto_152872 ) ( ON-TABLE ?auto_152879 ) ( ON ?auto_152874 ?auto_152873 ) ( CLEAR ?auto_152876 ) ( ON ?auto_152875 ?auto_152874 ) ( CLEAR ?auto_152875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152879 ?auto_152872 ?auto_152873 ?auto_152874 )
      ( MAKE-4PILE ?auto_152872 ?auto_152873 ?auto_152874 ?auto_152875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152881 - BLOCK
      ?auto_152882 - BLOCK
      ?auto_152883 - BLOCK
      ?auto_152884 - BLOCK
    )
    :vars
    (
      ?auto_152886 - BLOCK
      ?auto_152888 - BLOCK
      ?auto_152885 - BLOCK
      ?auto_152887 - BLOCK
      ?auto_152889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152881 ?auto_152882 ) ) ( not ( = ?auto_152881 ?auto_152883 ) ) ( not ( = ?auto_152881 ?auto_152884 ) ) ( not ( = ?auto_152882 ?auto_152883 ) ) ( not ( = ?auto_152882 ?auto_152884 ) ) ( not ( = ?auto_152883 ?auto_152884 ) ) ( not ( = ?auto_152881 ?auto_152886 ) ) ( not ( = ?auto_152882 ?auto_152886 ) ) ( not ( = ?auto_152883 ?auto_152886 ) ) ( not ( = ?auto_152884 ?auto_152886 ) ) ( ON-TABLE ?auto_152888 ) ( ON ?auto_152885 ?auto_152888 ) ( ON ?auto_152887 ?auto_152885 ) ( not ( = ?auto_152888 ?auto_152885 ) ) ( not ( = ?auto_152888 ?auto_152887 ) ) ( not ( = ?auto_152888 ?auto_152886 ) ) ( not ( = ?auto_152888 ?auto_152884 ) ) ( not ( = ?auto_152888 ?auto_152883 ) ) ( not ( = ?auto_152885 ?auto_152887 ) ) ( not ( = ?auto_152885 ?auto_152886 ) ) ( not ( = ?auto_152885 ?auto_152884 ) ) ( not ( = ?auto_152885 ?auto_152883 ) ) ( not ( = ?auto_152887 ?auto_152886 ) ) ( not ( = ?auto_152887 ?auto_152884 ) ) ( not ( = ?auto_152887 ?auto_152883 ) ) ( not ( = ?auto_152881 ?auto_152888 ) ) ( not ( = ?auto_152881 ?auto_152885 ) ) ( not ( = ?auto_152881 ?auto_152887 ) ) ( not ( = ?auto_152882 ?auto_152888 ) ) ( not ( = ?auto_152882 ?auto_152885 ) ) ( not ( = ?auto_152882 ?auto_152887 ) ) ( ON ?auto_152881 ?auto_152889 ) ( not ( = ?auto_152881 ?auto_152889 ) ) ( not ( = ?auto_152882 ?auto_152889 ) ) ( not ( = ?auto_152883 ?auto_152889 ) ) ( not ( = ?auto_152884 ?auto_152889 ) ) ( not ( = ?auto_152886 ?auto_152889 ) ) ( not ( = ?auto_152888 ?auto_152889 ) ) ( not ( = ?auto_152885 ?auto_152889 ) ) ( not ( = ?auto_152887 ?auto_152889 ) ) ( ON ?auto_152882 ?auto_152881 ) ( ON-TABLE ?auto_152889 ) ( ON ?auto_152883 ?auto_152882 ) ( ON ?auto_152884 ?auto_152883 ) ( CLEAR ?auto_152884 ) ( HOLDING ?auto_152886 ) ( CLEAR ?auto_152887 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_152888 ?auto_152885 ?auto_152887 ?auto_152886 )
      ( MAKE-4PILE ?auto_152881 ?auto_152882 ?auto_152883 ?auto_152884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152890 - BLOCK
      ?auto_152891 - BLOCK
      ?auto_152892 - BLOCK
      ?auto_152893 - BLOCK
    )
    :vars
    (
      ?auto_152898 - BLOCK
      ?auto_152896 - BLOCK
      ?auto_152897 - BLOCK
      ?auto_152895 - BLOCK
      ?auto_152894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152890 ?auto_152891 ) ) ( not ( = ?auto_152890 ?auto_152892 ) ) ( not ( = ?auto_152890 ?auto_152893 ) ) ( not ( = ?auto_152891 ?auto_152892 ) ) ( not ( = ?auto_152891 ?auto_152893 ) ) ( not ( = ?auto_152892 ?auto_152893 ) ) ( not ( = ?auto_152890 ?auto_152898 ) ) ( not ( = ?auto_152891 ?auto_152898 ) ) ( not ( = ?auto_152892 ?auto_152898 ) ) ( not ( = ?auto_152893 ?auto_152898 ) ) ( ON-TABLE ?auto_152896 ) ( ON ?auto_152897 ?auto_152896 ) ( ON ?auto_152895 ?auto_152897 ) ( not ( = ?auto_152896 ?auto_152897 ) ) ( not ( = ?auto_152896 ?auto_152895 ) ) ( not ( = ?auto_152896 ?auto_152898 ) ) ( not ( = ?auto_152896 ?auto_152893 ) ) ( not ( = ?auto_152896 ?auto_152892 ) ) ( not ( = ?auto_152897 ?auto_152895 ) ) ( not ( = ?auto_152897 ?auto_152898 ) ) ( not ( = ?auto_152897 ?auto_152893 ) ) ( not ( = ?auto_152897 ?auto_152892 ) ) ( not ( = ?auto_152895 ?auto_152898 ) ) ( not ( = ?auto_152895 ?auto_152893 ) ) ( not ( = ?auto_152895 ?auto_152892 ) ) ( not ( = ?auto_152890 ?auto_152896 ) ) ( not ( = ?auto_152890 ?auto_152897 ) ) ( not ( = ?auto_152890 ?auto_152895 ) ) ( not ( = ?auto_152891 ?auto_152896 ) ) ( not ( = ?auto_152891 ?auto_152897 ) ) ( not ( = ?auto_152891 ?auto_152895 ) ) ( ON ?auto_152890 ?auto_152894 ) ( not ( = ?auto_152890 ?auto_152894 ) ) ( not ( = ?auto_152891 ?auto_152894 ) ) ( not ( = ?auto_152892 ?auto_152894 ) ) ( not ( = ?auto_152893 ?auto_152894 ) ) ( not ( = ?auto_152898 ?auto_152894 ) ) ( not ( = ?auto_152896 ?auto_152894 ) ) ( not ( = ?auto_152897 ?auto_152894 ) ) ( not ( = ?auto_152895 ?auto_152894 ) ) ( ON ?auto_152891 ?auto_152890 ) ( ON-TABLE ?auto_152894 ) ( ON ?auto_152892 ?auto_152891 ) ( ON ?auto_152893 ?auto_152892 ) ( CLEAR ?auto_152895 ) ( ON ?auto_152898 ?auto_152893 ) ( CLEAR ?auto_152898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152894 ?auto_152890 ?auto_152891 ?auto_152892 ?auto_152893 )
      ( MAKE-4PILE ?auto_152890 ?auto_152891 ?auto_152892 ?auto_152893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152899 - BLOCK
      ?auto_152900 - BLOCK
      ?auto_152901 - BLOCK
      ?auto_152902 - BLOCK
    )
    :vars
    (
      ?auto_152904 - BLOCK
      ?auto_152905 - BLOCK
      ?auto_152903 - BLOCK
      ?auto_152907 - BLOCK
      ?auto_152906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152899 ?auto_152900 ) ) ( not ( = ?auto_152899 ?auto_152901 ) ) ( not ( = ?auto_152899 ?auto_152902 ) ) ( not ( = ?auto_152900 ?auto_152901 ) ) ( not ( = ?auto_152900 ?auto_152902 ) ) ( not ( = ?auto_152901 ?auto_152902 ) ) ( not ( = ?auto_152899 ?auto_152904 ) ) ( not ( = ?auto_152900 ?auto_152904 ) ) ( not ( = ?auto_152901 ?auto_152904 ) ) ( not ( = ?auto_152902 ?auto_152904 ) ) ( ON-TABLE ?auto_152905 ) ( ON ?auto_152903 ?auto_152905 ) ( not ( = ?auto_152905 ?auto_152903 ) ) ( not ( = ?auto_152905 ?auto_152907 ) ) ( not ( = ?auto_152905 ?auto_152904 ) ) ( not ( = ?auto_152905 ?auto_152902 ) ) ( not ( = ?auto_152905 ?auto_152901 ) ) ( not ( = ?auto_152903 ?auto_152907 ) ) ( not ( = ?auto_152903 ?auto_152904 ) ) ( not ( = ?auto_152903 ?auto_152902 ) ) ( not ( = ?auto_152903 ?auto_152901 ) ) ( not ( = ?auto_152907 ?auto_152904 ) ) ( not ( = ?auto_152907 ?auto_152902 ) ) ( not ( = ?auto_152907 ?auto_152901 ) ) ( not ( = ?auto_152899 ?auto_152905 ) ) ( not ( = ?auto_152899 ?auto_152903 ) ) ( not ( = ?auto_152899 ?auto_152907 ) ) ( not ( = ?auto_152900 ?auto_152905 ) ) ( not ( = ?auto_152900 ?auto_152903 ) ) ( not ( = ?auto_152900 ?auto_152907 ) ) ( ON ?auto_152899 ?auto_152906 ) ( not ( = ?auto_152899 ?auto_152906 ) ) ( not ( = ?auto_152900 ?auto_152906 ) ) ( not ( = ?auto_152901 ?auto_152906 ) ) ( not ( = ?auto_152902 ?auto_152906 ) ) ( not ( = ?auto_152904 ?auto_152906 ) ) ( not ( = ?auto_152905 ?auto_152906 ) ) ( not ( = ?auto_152903 ?auto_152906 ) ) ( not ( = ?auto_152907 ?auto_152906 ) ) ( ON ?auto_152900 ?auto_152899 ) ( ON-TABLE ?auto_152906 ) ( ON ?auto_152901 ?auto_152900 ) ( ON ?auto_152902 ?auto_152901 ) ( ON ?auto_152904 ?auto_152902 ) ( CLEAR ?auto_152904 ) ( HOLDING ?auto_152907 ) ( CLEAR ?auto_152903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152905 ?auto_152903 ?auto_152907 )
      ( MAKE-4PILE ?auto_152899 ?auto_152900 ?auto_152901 ?auto_152902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152908 - BLOCK
      ?auto_152909 - BLOCK
      ?auto_152910 - BLOCK
      ?auto_152911 - BLOCK
    )
    :vars
    (
      ?auto_152912 - BLOCK
      ?auto_152915 - BLOCK
      ?auto_152913 - BLOCK
      ?auto_152914 - BLOCK
      ?auto_152916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152908 ?auto_152909 ) ) ( not ( = ?auto_152908 ?auto_152910 ) ) ( not ( = ?auto_152908 ?auto_152911 ) ) ( not ( = ?auto_152909 ?auto_152910 ) ) ( not ( = ?auto_152909 ?auto_152911 ) ) ( not ( = ?auto_152910 ?auto_152911 ) ) ( not ( = ?auto_152908 ?auto_152912 ) ) ( not ( = ?auto_152909 ?auto_152912 ) ) ( not ( = ?auto_152910 ?auto_152912 ) ) ( not ( = ?auto_152911 ?auto_152912 ) ) ( ON-TABLE ?auto_152915 ) ( ON ?auto_152913 ?auto_152915 ) ( not ( = ?auto_152915 ?auto_152913 ) ) ( not ( = ?auto_152915 ?auto_152914 ) ) ( not ( = ?auto_152915 ?auto_152912 ) ) ( not ( = ?auto_152915 ?auto_152911 ) ) ( not ( = ?auto_152915 ?auto_152910 ) ) ( not ( = ?auto_152913 ?auto_152914 ) ) ( not ( = ?auto_152913 ?auto_152912 ) ) ( not ( = ?auto_152913 ?auto_152911 ) ) ( not ( = ?auto_152913 ?auto_152910 ) ) ( not ( = ?auto_152914 ?auto_152912 ) ) ( not ( = ?auto_152914 ?auto_152911 ) ) ( not ( = ?auto_152914 ?auto_152910 ) ) ( not ( = ?auto_152908 ?auto_152915 ) ) ( not ( = ?auto_152908 ?auto_152913 ) ) ( not ( = ?auto_152908 ?auto_152914 ) ) ( not ( = ?auto_152909 ?auto_152915 ) ) ( not ( = ?auto_152909 ?auto_152913 ) ) ( not ( = ?auto_152909 ?auto_152914 ) ) ( ON ?auto_152908 ?auto_152916 ) ( not ( = ?auto_152908 ?auto_152916 ) ) ( not ( = ?auto_152909 ?auto_152916 ) ) ( not ( = ?auto_152910 ?auto_152916 ) ) ( not ( = ?auto_152911 ?auto_152916 ) ) ( not ( = ?auto_152912 ?auto_152916 ) ) ( not ( = ?auto_152915 ?auto_152916 ) ) ( not ( = ?auto_152913 ?auto_152916 ) ) ( not ( = ?auto_152914 ?auto_152916 ) ) ( ON ?auto_152909 ?auto_152908 ) ( ON-TABLE ?auto_152916 ) ( ON ?auto_152910 ?auto_152909 ) ( ON ?auto_152911 ?auto_152910 ) ( ON ?auto_152912 ?auto_152911 ) ( CLEAR ?auto_152913 ) ( ON ?auto_152914 ?auto_152912 ) ( CLEAR ?auto_152914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152916 ?auto_152908 ?auto_152909 ?auto_152910 ?auto_152911 ?auto_152912 )
      ( MAKE-4PILE ?auto_152908 ?auto_152909 ?auto_152910 ?auto_152911 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152917 - BLOCK
      ?auto_152918 - BLOCK
      ?auto_152919 - BLOCK
      ?auto_152920 - BLOCK
    )
    :vars
    (
      ?auto_152924 - BLOCK
      ?auto_152921 - BLOCK
      ?auto_152925 - BLOCK
      ?auto_152923 - BLOCK
      ?auto_152922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152917 ?auto_152918 ) ) ( not ( = ?auto_152917 ?auto_152919 ) ) ( not ( = ?auto_152917 ?auto_152920 ) ) ( not ( = ?auto_152918 ?auto_152919 ) ) ( not ( = ?auto_152918 ?auto_152920 ) ) ( not ( = ?auto_152919 ?auto_152920 ) ) ( not ( = ?auto_152917 ?auto_152924 ) ) ( not ( = ?auto_152918 ?auto_152924 ) ) ( not ( = ?auto_152919 ?auto_152924 ) ) ( not ( = ?auto_152920 ?auto_152924 ) ) ( ON-TABLE ?auto_152921 ) ( not ( = ?auto_152921 ?auto_152925 ) ) ( not ( = ?auto_152921 ?auto_152923 ) ) ( not ( = ?auto_152921 ?auto_152924 ) ) ( not ( = ?auto_152921 ?auto_152920 ) ) ( not ( = ?auto_152921 ?auto_152919 ) ) ( not ( = ?auto_152925 ?auto_152923 ) ) ( not ( = ?auto_152925 ?auto_152924 ) ) ( not ( = ?auto_152925 ?auto_152920 ) ) ( not ( = ?auto_152925 ?auto_152919 ) ) ( not ( = ?auto_152923 ?auto_152924 ) ) ( not ( = ?auto_152923 ?auto_152920 ) ) ( not ( = ?auto_152923 ?auto_152919 ) ) ( not ( = ?auto_152917 ?auto_152921 ) ) ( not ( = ?auto_152917 ?auto_152925 ) ) ( not ( = ?auto_152917 ?auto_152923 ) ) ( not ( = ?auto_152918 ?auto_152921 ) ) ( not ( = ?auto_152918 ?auto_152925 ) ) ( not ( = ?auto_152918 ?auto_152923 ) ) ( ON ?auto_152917 ?auto_152922 ) ( not ( = ?auto_152917 ?auto_152922 ) ) ( not ( = ?auto_152918 ?auto_152922 ) ) ( not ( = ?auto_152919 ?auto_152922 ) ) ( not ( = ?auto_152920 ?auto_152922 ) ) ( not ( = ?auto_152924 ?auto_152922 ) ) ( not ( = ?auto_152921 ?auto_152922 ) ) ( not ( = ?auto_152925 ?auto_152922 ) ) ( not ( = ?auto_152923 ?auto_152922 ) ) ( ON ?auto_152918 ?auto_152917 ) ( ON-TABLE ?auto_152922 ) ( ON ?auto_152919 ?auto_152918 ) ( ON ?auto_152920 ?auto_152919 ) ( ON ?auto_152924 ?auto_152920 ) ( ON ?auto_152923 ?auto_152924 ) ( CLEAR ?auto_152923 ) ( HOLDING ?auto_152925 ) ( CLEAR ?auto_152921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152921 ?auto_152925 )
      ( MAKE-4PILE ?auto_152917 ?auto_152918 ?auto_152919 ?auto_152920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152926 - BLOCK
      ?auto_152927 - BLOCK
      ?auto_152928 - BLOCK
      ?auto_152929 - BLOCK
    )
    :vars
    (
      ?auto_152930 - BLOCK
      ?auto_152934 - BLOCK
      ?auto_152932 - BLOCK
      ?auto_152933 - BLOCK
      ?auto_152931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152926 ?auto_152927 ) ) ( not ( = ?auto_152926 ?auto_152928 ) ) ( not ( = ?auto_152926 ?auto_152929 ) ) ( not ( = ?auto_152927 ?auto_152928 ) ) ( not ( = ?auto_152927 ?auto_152929 ) ) ( not ( = ?auto_152928 ?auto_152929 ) ) ( not ( = ?auto_152926 ?auto_152930 ) ) ( not ( = ?auto_152927 ?auto_152930 ) ) ( not ( = ?auto_152928 ?auto_152930 ) ) ( not ( = ?auto_152929 ?auto_152930 ) ) ( ON-TABLE ?auto_152934 ) ( not ( = ?auto_152934 ?auto_152932 ) ) ( not ( = ?auto_152934 ?auto_152933 ) ) ( not ( = ?auto_152934 ?auto_152930 ) ) ( not ( = ?auto_152934 ?auto_152929 ) ) ( not ( = ?auto_152934 ?auto_152928 ) ) ( not ( = ?auto_152932 ?auto_152933 ) ) ( not ( = ?auto_152932 ?auto_152930 ) ) ( not ( = ?auto_152932 ?auto_152929 ) ) ( not ( = ?auto_152932 ?auto_152928 ) ) ( not ( = ?auto_152933 ?auto_152930 ) ) ( not ( = ?auto_152933 ?auto_152929 ) ) ( not ( = ?auto_152933 ?auto_152928 ) ) ( not ( = ?auto_152926 ?auto_152934 ) ) ( not ( = ?auto_152926 ?auto_152932 ) ) ( not ( = ?auto_152926 ?auto_152933 ) ) ( not ( = ?auto_152927 ?auto_152934 ) ) ( not ( = ?auto_152927 ?auto_152932 ) ) ( not ( = ?auto_152927 ?auto_152933 ) ) ( ON ?auto_152926 ?auto_152931 ) ( not ( = ?auto_152926 ?auto_152931 ) ) ( not ( = ?auto_152927 ?auto_152931 ) ) ( not ( = ?auto_152928 ?auto_152931 ) ) ( not ( = ?auto_152929 ?auto_152931 ) ) ( not ( = ?auto_152930 ?auto_152931 ) ) ( not ( = ?auto_152934 ?auto_152931 ) ) ( not ( = ?auto_152932 ?auto_152931 ) ) ( not ( = ?auto_152933 ?auto_152931 ) ) ( ON ?auto_152927 ?auto_152926 ) ( ON-TABLE ?auto_152931 ) ( ON ?auto_152928 ?auto_152927 ) ( ON ?auto_152929 ?auto_152928 ) ( ON ?auto_152930 ?auto_152929 ) ( ON ?auto_152933 ?auto_152930 ) ( CLEAR ?auto_152934 ) ( ON ?auto_152932 ?auto_152933 ) ( CLEAR ?auto_152932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_152931 ?auto_152926 ?auto_152927 ?auto_152928 ?auto_152929 ?auto_152930 ?auto_152933 )
      ( MAKE-4PILE ?auto_152926 ?auto_152927 ?auto_152928 ?auto_152929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152935 - BLOCK
      ?auto_152936 - BLOCK
      ?auto_152937 - BLOCK
      ?auto_152938 - BLOCK
    )
    :vars
    (
      ?auto_152940 - BLOCK
      ?auto_152939 - BLOCK
      ?auto_152942 - BLOCK
      ?auto_152943 - BLOCK
      ?auto_152941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152935 ?auto_152936 ) ) ( not ( = ?auto_152935 ?auto_152937 ) ) ( not ( = ?auto_152935 ?auto_152938 ) ) ( not ( = ?auto_152936 ?auto_152937 ) ) ( not ( = ?auto_152936 ?auto_152938 ) ) ( not ( = ?auto_152937 ?auto_152938 ) ) ( not ( = ?auto_152935 ?auto_152940 ) ) ( not ( = ?auto_152936 ?auto_152940 ) ) ( not ( = ?auto_152937 ?auto_152940 ) ) ( not ( = ?auto_152938 ?auto_152940 ) ) ( not ( = ?auto_152939 ?auto_152942 ) ) ( not ( = ?auto_152939 ?auto_152943 ) ) ( not ( = ?auto_152939 ?auto_152940 ) ) ( not ( = ?auto_152939 ?auto_152938 ) ) ( not ( = ?auto_152939 ?auto_152937 ) ) ( not ( = ?auto_152942 ?auto_152943 ) ) ( not ( = ?auto_152942 ?auto_152940 ) ) ( not ( = ?auto_152942 ?auto_152938 ) ) ( not ( = ?auto_152942 ?auto_152937 ) ) ( not ( = ?auto_152943 ?auto_152940 ) ) ( not ( = ?auto_152943 ?auto_152938 ) ) ( not ( = ?auto_152943 ?auto_152937 ) ) ( not ( = ?auto_152935 ?auto_152939 ) ) ( not ( = ?auto_152935 ?auto_152942 ) ) ( not ( = ?auto_152935 ?auto_152943 ) ) ( not ( = ?auto_152936 ?auto_152939 ) ) ( not ( = ?auto_152936 ?auto_152942 ) ) ( not ( = ?auto_152936 ?auto_152943 ) ) ( ON ?auto_152935 ?auto_152941 ) ( not ( = ?auto_152935 ?auto_152941 ) ) ( not ( = ?auto_152936 ?auto_152941 ) ) ( not ( = ?auto_152937 ?auto_152941 ) ) ( not ( = ?auto_152938 ?auto_152941 ) ) ( not ( = ?auto_152940 ?auto_152941 ) ) ( not ( = ?auto_152939 ?auto_152941 ) ) ( not ( = ?auto_152942 ?auto_152941 ) ) ( not ( = ?auto_152943 ?auto_152941 ) ) ( ON ?auto_152936 ?auto_152935 ) ( ON-TABLE ?auto_152941 ) ( ON ?auto_152937 ?auto_152936 ) ( ON ?auto_152938 ?auto_152937 ) ( ON ?auto_152940 ?auto_152938 ) ( ON ?auto_152943 ?auto_152940 ) ( ON ?auto_152942 ?auto_152943 ) ( CLEAR ?auto_152942 ) ( HOLDING ?auto_152939 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_152939 )
      ( MAKE-4PILE ?auto_152935 ?auto_152936 ?auto_152937 ?auto_152938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_152944 - BLOCK
      ?auto_152945 - BLOCK
      ?auto_152946 - BLOCK
      ?auto_152947 - BLOCK
    )
    :vars
    (
      ?auto_152952 - BLOCK
      ?auto_152948 - BLOCK
      ?auto_152949 - BLOCK
      ?auto_152950 - BLOCK
      ?auto_152951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_152944 ?auto_152945 ) ) ( not ( = ?auto_152944 ?auto_152946 ) ) ( not ( = ?auto_152944 ?auto_152947 ) ) ( not ( = ?auto_152945 ?auto_152946 ) ) ( not ( = ?auto_152945 ?auto_152947 ) ) ( not ( = ?auto_152946 ?auto_152947 ) ) ( not ( = ?auto_152944 ?auto_152952 ) ) ( not ( = ?auto_152945 ?auto_152952 ) ) ( not ( = ?auto_152946 ?auto_152952 ) ) ( not ( = ?auto_152947 ?auto_152952 ) ) ( not ( = ?auto_152948 ?auto_152949 ) ) ( not ( = ?auto_152948 ?auto_152950 ) ) ( not ( = ?auto_152948 ?auto_152952 ) ) ( not ( = ?auto_152948 ?auto_152947 ) ) ( not ( = ?auto_152948 ?auto_152946 ) ) ( not ( = ?auto_152949 ?auto_152950 ) ) ( not ( = ?auto_152949 ?auto_152952 ) ) ( not ( = ?auto_152949 ?auto_152947 ) ) ( not ( = ?auto_152949 ?auto_152946 ) ) ( not ( = ?auto_152950 ?auto_152952 ) ) ( not ( = ?auto_152950 ?auto_152947 ) ) ( not ( = ?auto_152950 ?auto_152946 ) ) ( not ( = ?auto_152944 ?auto_152948 ) ) ( not ( = ?auto_152944 ?auto_152949 ) ) ( not ( = ?auto_152944 ?auto_152950 ) ) ( not ( = ?auto_152945 ?auto_152948 ) ) ( not ( = ?auto_152945 ?auto_152949 ) ) ( not ( = ?auto_152945 ?auto_152950 ) ) ( ON ?auto_152944 ?auto_152951 ) ( not ( = ?auto_152944 ?auto_152951 ) ) ( not ( = ?auto_152945 ?auto_152951 ) ) ( not ( = ?auto_152946 ?auto_152951 ) ) ( not ( = ?auto_152947 ?auto_152951 ) ) ( not ( = ?auto_152952 ?auto_152951 ) ) ( not ( = ?auto_152948 ?auto_152951 ) ) ( not ( = ?auto_152949 ?auto_152951 ) ) ( not ( = ?auto_152950 ?auto_152951 ) ) ( ON ?auto_152945 ?auto_152944 ) ( ON-TABLE ?auto_152951 ) ( ON ?auto_152946 ?auto_152945 ) ( ON ?auto_152947 ?auto_152946 ) ( ON ?auto_152952 ?auto_152947 ) ( ON ?auto_152950 ?auto_152952 ) ( ON ?auto_152949 ?auto_152950 ) ( ON ?auto_152948 ?auto_152949 ) ( CLEAR ?auto_152948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_152951 ?auto_152944 ?auto_152945 ?auto_152946 ?auto_152947 ?auto_152952 ?auto_152950 ?auto_152949 )
      ( MAKE-4PILE ?auto_152944 ?auto_152945 ?auto_152946 ?auto_152947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152972 - BLOCK
      ?auto_152973 - BLOCK
      ?auto_152974 - BLOCK
    )
    :vars
    (
      ?auto_152975 - BLOCK
      ?auto_152976 - BLOCK
      ?auto_152977 - BLOCK
      ?auto_152979 - BLOCK
      ?auto_152978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152975 ?auto_152974 ) ( ON-TABLE ?auto_152972 ) ( ON ?auto_152973 ?auto_152972 ) ( ON ?auto_152974 ?auto_152973 ) ( not ( = ?auto_152972 ?auto_152973 ) ) ( not ( = ?auto_152972 ?auto_152974 ) ) ( not ( = ?auto_152972 ?auto_152975 ) ) ( not ( = ?auto_152973 ?auto_152974 ) ) ( not ( = ?auto_152973 ?auto_152975 ) ) ( not ( = ?auto_152974 ?auto_152975 ) ) ( not ( = ?auto_152972 ?auto_152976 ) ) ( not ( = ?auto_152972 ?auto_152977 ) ) ( not ( = ?auto_152973 ?auto_152976 ) ) ( not ( = ?auto_152973 ?auto_152977 ) ) ( not ( = ?auto_152974 ?auto_152976 ) ) ( not ( = ?auto_152974 ?auto_152977 ) ) ( not ( = ?auto_152975 ?auto_152976 ) ) ( not ( = ?auto_152975 ?auto_152977 ) ) ( not ( = ?auto_152976 ?auto_152977 ) ) ( ON ?auto_152976 ?auto_152975 ) ( CLEAR ?auto_152976 ) ( HOLDING ?auto_152977 ) ( CLEAR ?auto_152979 ) ( ON-TABLE ?auto_152978 ) ( ON ?auto_152979 ?auto_152978 ) ( not ( = ?auto_152978 ?auto_152979 ) ) ( not ( = ?auto_152978 ?auto_152977 ) ) ( not ( = ?auto_152979 ?auto_152977 ) ) ( not ( = ?auto_152972 ?auto_152979 ) ) ( not ( = ?auto_152972 ?auto_152978 ) ) ( not ( = ?auto_152973 ?auto_152979 ) ) ( not ( = ?auto_152973 ?auto_152978 ) ) ( not ( = ?auto_152974 ?auto_152979 ) ) ( not ( = ?auto_152974 ?auto_152978 ) ) ( not ( = ?auto_152975 ?auto_152979 ) ) ( not ( = ?auto_152975 ?auto_152978 ) ) ( not ( = ?auto_152976 ?auto_152979 ) ) ( not ( = ?auto_152976 ?auto_152978 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_152978 ?auto_152979 ?auto_152977 )
      ( MAKE-3PILE ?auto_152972 ?auto_152973 ?auto_152974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152980 - BLOCK
      ?auto_152981 - BLOCK
      ?auto_152982 - BLOCK
    )
    :vars
    (
      ?auto_152986 - BLOCK
      ?auto_152987 - BLOCK
      ?auto_152984 - BLOCK
      ?auto_152985 - BLOCK
      ?auto_152983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152986 ?auto_152982 ) ( ON-TABLE ?auto_152980 ) ( ON ?auto_152981 ?auto_152980 ) ( ON ?auto_152982 ?auto_152981 ) ( not ( = ?auto_152980 ?auto_152981 ) ) ( not ( = ?auto_152980 ?auto_152982 ) ) ( not ( = ?auto_152980 ?auto_152986 ) ) ( not ( = ?auto_152981 ?auto_152982 ) ) ( not ( = ?auto_152981 ?auto_152986 ) ) ( not ( = ?auto_152982 ?auto_152986 ) ) ( not ( = ?auto_152980 ?auto_152987 ) ) ( not ( = ?auto_152980 ?auto_152984 ) ) ( not ( = ?auto_152981 ?auto_152987 ) ) ( not ( = ?auto_152981 ?auto_152984 ) ) ( not ( = ?auto_152982 ?auto_152987 ) ) ( not ( = ?auto_152982 ?auto_152984 ) ) ( not ( = ?auto_152986 ?auto_152987 ) ) ( not ( = ?auto_152986 ?auto_152984 ) ) ( not ( = ?auto_152987 ?auto_152984 ) ) ( ON ?auto_152987 ?auto_152986 ) ( CLEAR ?auto_152985 ) ( ON-TABLE ?auto_152983 ) ( ON ?auto_152985 ?auto_152983 ) ( not ( = ?auto_152983 ?auto_152985 ) ) ( not ( = ?auto_152983 ?auto_152984 ) ) ( not ( = ?auto_152985 ?auto_152984 ) ) ( not ( = ?auto_152980 ?auto_152985 ) ) ( not ( = ?auto_152980 ?auto_152983 ) ) ( not ( = ?auto_152981 ?auto_152985 ) ) ( not ( = ?auto_152981 ?auto_152983 ) ) ( not ( = ?auto_152982 ?auto_152985 ) ) ( not ( = ?auto_152982 ?auto_152983 ) ) ( not ( = ?auto_152986 ?auto_152985 ) ) ( not ( = ?auto_152986 ?auto_152983 ) ) ( not ( = ?auto_152987 ?auto_152985 ) ) ( not ( = ?auto_152987 ?auto_152983 ) ) ( ON ?auto_152984 ?auto_152987 ) ( CLEAR ?auto_152984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_152980 ?auto_152981 ?auto_152982 ?auto_152986 ?auto_152987 )
      ( MAKE-3PILE ?auto_152980 ?auto_152981 ?auto_152982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152988 - BLOCK
      ?auto_152989 - BLOCK
      ?auto_152990 - BLOCK
    )
    :vars
    (
      ?auto_152994 - BLOCK
      ?auto_152993 - BLOCK
      ?auto_152995 - BLOCK
      ?auto_152991 - BLOCK
      ?auto_152992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_152994 ?auto_152990 ) ( ON-TABLE ?auto_152988 ) ( ON ?auto_152989 ?auto_152988 ) ( ON ?auto_152990 ?auto_152989 ) ( not ( = ?auto_152988 ?auto_152989 ) ) ( not ( = ?auto_152988 ?auto_152990 ) ) ( not ( = ?auto_152988 ?auto_152994 ) ) ( not ( = ?auto_152989 ?auto_152990 ) ) ( not ( = ?auto_152989 ?auto_152994 ) ) ( not ( = ?auto_152990 ?auto_152994 ) ) ( not ( = ?auto_152988 ?auto_152993 ) ) ( not ( = ?auto_152988 ?auto_152995 ) ) ( not ( = ?auto_152989 ?auto_152993 ) ) ( not ( = ?auto_152989 ?auto_152995 ) ) ( not ( = ?auto_152990 ?auto_152993 ) ) ( not ( = ?auto_152990 ?auto_152995 ) ) ( not ( = ?auto_152994 ?auto_152993 ) ) ( not ( = ?auto_152994 ?auto_152995 ) ) ( not ( = ?auto_152993 ?auto_152995 ) ) ( ON ?auto_152993 ?auto_152994 ) ( ON-TABLE ?auto_152991 ) ( not ( = ?auto_152991 ?auto_152992 ) ) ( not ( = ?auto_152991 ?auto_152995 ) ) ( not ( = ?auto_152992 ?auto_152995 ) ) ( not ( = ?auto_152988 ?auto_152992 ) ) ( not ( = ?auto_152988 ?auto_152991 ) ) ( not ( = ?auto_152989 ?auto_152992 ) ) ( not ( = ?auto_152989 ?auto_152991 ) ) ( not ( = ?auto_152990 ?auto_152992 ) ) ( not ( = ?auto_152990 ?auto_152991 ) ) ( not ( = ?auto_152994 ?auto_152992 ) ) ( not ( = ?auto_152994 ?auto_152991 ) ) ( not ( = ?auto_152993 ?auto_152992 ) ) ( not ( = ?auto_152993 ?auto_152991 ) ) ( ON ?auto_152995 ?auto_152993 ) ( CLEAR ?auto_152995 ) ( HOLDING ?auto_152992 ) ( CLEAR ?auto_152991 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_152991 ?auto_152992 )
      ( MAKE-3PILE ?auto_152988 ?auto_152989 ?auto_152990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_152996 - BLOCK
      ?auto_152997 - BLOCK
      ?auto_152998 - BLOCK
    )
    :vars
    (
      ?auto_153001 - BLOCK
      ?auto_153003 - BLOCK
      ?auto_153000 - BLOCK
      ?auto_153002 - BLOCK
      ?auto_152999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153001 ?auto_152998 ) ( ON-TABLE ?auto_152996 ) ( ON ?auto_152997 ?auto_152996 ) ( ON ?auto_152998 ?auto_152997 ) ( not ( = ?auto_152996 ?auto_152997 ) ) ( not ( = ?auto_152996 ?auto_152998 ) ) ( not ( = ?auto_152996 ?auto_153001 ) ) ( not ( = ?auto_152997 ?auto_152998 ) ) ( not ( = ?auto_152997 ?auto_153001 ) ) ( not ( = ?auto_152998 ?auto_153001 ) ) ( not ( = ?auto_152996 ?auto_153003 ) ) ( not ( = ?auto_152996 ?auto_153000 ) ) ( not ( = ?auto_152997 ?auto_153003 ) ) ( not ( = ?auto_152997 ?auto_153000 ) ) ( not ( = ?auto_152998 ?auto_153003 ) ) ( not ( = ?auto_152998 ?auto_153000 ) ) ( not ( = ?auto_153001 ?auto_153003 ) ) ( not ( = ?auto_153001 ?auto_153000 ) ) ( not ( = ?auto_153003 ?auto_153000 ) ) ( ON ?auto_153003 ?auto_153001 ) ( ON-TABLE ?auto_153002 ) ( not ( = ?auto_153002 ?auto_152999 ) ) ( not ( = ?auto_153002 ?auto_153000 ) ) ( not ( = ?auto_152999 ?auto_153000 ) ) ( not ( = ?auto_152996 ?auto_152999 ) ) ( not ( = ?auto_152996 ?auto_153002 ) ) ( not ( = ?auto_152997 ?auto_152999 ) ) ( not ( = ?auto_152997 ?auto_153002 ) ) ( not ( = ?auto_152998 ?auto_152999 ) ) ( not ( = ?auto_152998 ?auto_153002 ) ) ( not ( = ?auto_153001 ?auto_152999 ) ) ( not ( = ?auto_153001 ?auto_153002 ) ) ( not ( = ?auto_153003 ?auto_152999 ) ) ( not ( = ?auto_153003 ?auto_153002 ) ) ( ON ?auto_153000 ?auto_153003 ) ( CLEAR ?auto_153002 ) ( ON ?auto_152999 ?auto_153000 ) ( CLEAR ?auto_152999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_152996 ?auto_152997 ?auto_152998 ?auto_153001 ?auto_153003 ?auto_153000 )
      ( MAKE-3PILE ?auto_152996 ?auto_152997 ?auto_152998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153004 - BLOCK
      ?auto_153005 - BLOCK
      ?auto_153006 - BLOCK
    )
    :vars
    (
      ?auto_153010 - BLOCK
      ?auto_153007 - BLOCK
      ?auto_153008 - BLOCK
      ?auto_153011 - BLOCK
      ?auto_153009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153010 ?auto_153006 ) ( ON-TABLE ?auto_153004 ) ( ON ?auto_153005 ?auto_153004 ) ( ON ?auto_153006 ?auto_153005 ) ( not ( = ?auto_153004 ?auto_153005 ) ) ( not ( = ?auto_153004 ?auto_153006 ) ) ( not ( = ?auto_153004 ?auto_153010 ) ) ( not ( = ?auto_153005 ?auto_153006 ) ) ( not ( = ?auto_153005 ?auto_153010 ) ) ( not ( = ?auto_153006 ?auto_153010 ) ) ( not ( = ?auto_153004 ?auto_153007 ) ) ( not ( = ?auto_153004 ?auto_153008 ) ) ( not ( = ?auto_153005 ?auto_153007 ) ) ( not ( = ?auto_153005 ?auto_153008 ) ) ( not ( = ?auto_153006 ?auto_153007 ) ) ( not ( = ?auto_153006 ?auto_153008 ) ) ( not ( = ?auto_153010 ?auto_153007 ) ) ( not ( = ?auto_153010 ?auto_153008 ) ) ( not ( = ?auto_153007 ?auto_153008 ) ) ( ON ?auto_153007 ?auto_153010 ) ( not ( = ?auto_153011 ?auto_153009 ) ) ( not ( = ?auto_153011 ?auto_153008 ) ) ( not ( = ?auto_153009 ?auto_153008 ) ) ( not ( = ?auto_153004 ?auto_153009 ) ) ( not ( = ?auto_153004 ?auto_153011 ) ) ( not ( = ?auto_153005 ?auto_153009 ) ) ( not ( = ?auto_153005 ?auto_153011 ) ) ( not ( = ?auto_153006 ?auto_153009 ) ) ( not ( = ?auto_153006 ?auto_153011 ) ) ( not ( = ?auto_153010 ?auto_153009 ) ) ( not ( = ?auto_153010 ?auto_153011 ) ) ( not ( = ?auto_153007 ?auto_153009 ) ) ( not ( = ?auto_153007 ?auto_153011 ) ) ( ON ?auto_153008 ?auto_153007 ) ( ON ?auto_153009 ?auto_153008 ) ( CLEAR ?auto_153009 ) ( HOLDING ?auto_153011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153011 )
      ( MAKE-3PILE ?auto_153004 ?auto_153005 ?auto_153006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153023 - BLOCK
      ?auto_153024 - BLOCK
      ?auto_153025 - BLOCK
    )
    :vars
    (
      ?auto_153026 - BLOCK
      ?auto_153028 - BLOCK
      ?auto_153030 - BLOCK
      ?auto_153027 - BLOCK
      ?auto_153029 - BLOCK
      ?auto_153031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153026 ?auto_153025 ) ( ON-TABLE ?auto_153023 ) ( ON ?auto_153024 ?auto_153023 ) ( ON ?auto_153025 ?auto_153024 ) ( not ( = ?auto_153023 ?auto_153024 ) ) ( not ( = ?auto_153023 ?auto_153025 ) ) ( not ( = ?auto_153023 ?auto_153026 ) ) ( not ( = ?auto_153024 ?auto_153025 ) ) ( not ( = ?auto_153024 ?auto_153026 ) ) ( not ( = ?auto_153025 ?auto_153026 ) ) ( not ( = ?auto_153023 ?auto_153028 ) ) ( not ( = ?auto_153023 ?auto_153030 ) ) ( not ( = ?auto_153024 ?auto_153028 ) ) ( not ( = ?auto_153024 ?auto_153030 ) ) ( not ( = ?auto_153025 ?auto_153028 ) ) ( not ( = ?auto_153025 ?auto_153030 ) ) ( not ( = ?auto_153026 ?auto_153028 ) ) ( not ( = ?auto_153026 ?auto_153030 ) ) ( not ( = ?auto_153028 ?auto_153030 ) ) ( ON ?auto_153028 ?auto_153026 ) ( not ( = ?auto_153027 ?auto_153029 ) ) ( not ( = ?auto_153027 ?auto_153030 ) ) ( not ( = ?auto_153029 ?auto_153030 ) ) ( not ( = ?auto_153023 ?auto_153029 ) ) ( not ( = ?auto_153023 ?auto_153027 ) ) ( not ( = ?auto_153024 ?auto_153029 ) ) ( not ( = ?auto_153024 ?auto_153027 ) ) ( not ( = ?auto_153025 ?auto_153029 ) ) ( not ( = ?auto_153025 ?auto_153027 ) ) ( not ( = ?auto_153026 ?auto_153029 ) ) ( not ( = ?auto_153026 ?auto_153027 ) ) ( not ( = ?auto_153028 ?auto_153029 ) ) ( not ( = ?auto_153028 ?auto_153027 ) ) ( ON ?auto_153030 ?auto_153028 ) ( ON ?auto_153029 ?auto_153030 ) ( CLEAR ?auto_153029 ) ( ON ?auto_153027 ?auto_153031 ) ( CLEAR ?auto_153027 ) ( HAND-EMPTY ) ( not ( = ?auto_153023 ?auto_153031 ) ) ( not ( = ?auto_153024 ?auto_153031 ) ) ( not ( = ?auto_153025 ?auto_153031 ) ) ( not ( = ?auto_153026 ?auto_153031 ) ) ( not ( = ?auto_153028 ?auto_153031 ) ) ( not ( = ?auto_153030 ?auto_153031 ) ) ( not ( = ?auto_153027 ?auto_153031 ) ) ( not ( = ?auto_153029 ?auto_153031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153027 ?auto_153031 )
      ( MAKE-3PILE ?auto_153023 ?auto_153024 ?auto_153025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153032 - BLOCK
      ?auto_153033 - BLOCK
      ?auto_153034 - BLOCK
    )
    :vars
    (
      ?auto_153036 - BLOCK
      ?auto_153038 - BLOCK
      ?auto_153039 - BLOCK
      ?auto_153035 - BLOCK
      ?auto_153037 - BLOCK
      ?auto_153040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153036 ?auto_153034 ) ( ON-TABLE ?auto_153032 ) ( ON ?auto_153033 ?auto_153032 ) ( ON ?auto_153034 ?auto_153033 ) ( not ( = ?auto_153032 ?auto_153033 ) ) ( not ( = ?auto_153032 ?auto_153034 ) ) ( not ( = ?auto_153032 ?auto_153036 ) ) ( not ( = ?auto_153033 ?auto_153034 ) ) ( not ( = ?auto_153033 ?auto_153036 ) ) ( not ( = ?auto_153034 ?auto_153036 ) ) ( not ( = ?auto_153032 ?auto_153038 ) ) ( not ( = ?auto_153032 ?auto_153039 ) ) ( not ( = ?auto_153033 ?auto_153038 ) ) ( not ( = ?auto_153033 ?auto_153039 ) ) ( not ( = ?auto_153034 ?auto_153038 ) ) ( not ( = ?auto_153034 ?auto_153039 ) ) ( not ( = ?auto_153036 ?auto_153038 ) ) ( not ( = ?auto_153036 ?auto_153039 ) ) ( not ( = ?auto_153038 ?auto_153039 ) ) ( ON ?auto_153038 ?auto_153036 ) ( not ( = ?auto_153035 ?auto_153037 ) ) ( not ( = ?auto_153035 ?auto_153039 ) ) ( not ( = ?auto_153037 ?auto_153039 ) ) ( not ( = ?auto_153032 ?auto_153037 ) ) ( not ( = ?auto_153032 ?auto_153035 ) ) ( not ( = ?auto_153033 ?auto_153037 ) ) ( not ( = ?auto_153033 ?auto_153035 ) ) ( not ( = ?auto_153034 ?auto_153037 ) ) ( not ( = ?auto_153034 ?auto_153035 ) ) ( not ( = ?auto_153036 ?auto_153037 ) ) ( not ( = ?auto_153036 ?auto_153035 ) ) ( not ( = ?auto_153038 ?auto_153037 ) ) ( not ( = ?auto_153038 ?auto_153035 ) ) ( ON ?auto_153039 ?auto_153038 ) ( ON ?auto_153035 ?auto_153040 ) ( CLEAR ?auto_153035 ) ( not ( = ?auto_153032 ?auto_153040 ) ) ( not ( = ?auto_153033 ?auto_153040 ) ) ( not ( = ?auto_153034 ?auto_153040 ) ) ( not ( = ?auto_153036 ?auto_153040 ) ) ( not ( = ?auto_153038 ?auto_153040 ) ) ( not ( = ?auto_153039 ?auto_153040 ) ) ( not ( = ?auto_153035 ?auto_153040 ) ) ( not ( = ?auto_153037 ?auto_153040 ) ) ( HOLDING ?auto_153037 ) ( CLEAR ?auto_153039 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153032 ?auto_153033 ?auto_153034 ?auto_153036 ?auto_153038 ?auto_153039 ?auto_153037 )
      ( MAKE-3PILE ?auto_153032 ?auto_153033 ?auto_153034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153041 - BLOCK
      ?auto_153042 - BLOCK
      ?auto_153043 - BLOCK
    )
    :vars
    (
      ?auto_153045 - BLOCK
      ?auto_153049 - BLOCK
      ?auto_153048 - BLOCK
      ?auto_153047 - BLOCK
      ?auto_153046 - BLOCK
      ?auto_153044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153045 ?auto_153043 ) ( ON-TABLE ?auto_153041 ) ( ON ?auto_153042 ?auto_153041 ) ( ON ?auto_153043 ?auto_153042 ) ( not ( = ?auto_153041 ?auto_153042 ) ) ( not ( = ?auto_153041 ?auto_153043 ) ) ( not ( = ?auto_153041 ?auto_153045 ) ) ( not ( = ?auto_153042 ?auto_153043 ) ) ( not ( = ?auto_153042 ?auto_153045 ) ) ( not ( = ?auto_153043 ?auto_153045 ) ) ( not ( = ?auto_153041 ?auto_153049 ) ) ( not ( = ?auto_153041 ?auto_153048 ) ) ( not ( = ?auto_153042 ?auto_153049 ) ) ( not ( = ?auto_153042 ?auto_153048 ) ) ( not ( = ?auto_153043 ?auto_153049 ) ) ( not ( = ?auto_153043 ?auto_153048 ) ) ( not ( = ?auto_153045 ?auto_153049 ) ) ( not ( = ?auto_153045 ?auto_153048 ) ) ( not ( = ?auto_153049 ?auto_153048 ) ) ( ON ?auto_153049 ?auto_153045 ) ( not ( = ?auto_153047 ?auto_153046 ) ) ( not ( = ?auto_153047 ?auto_153048 ) ) ( not ( = ?auto_153046 ?auto_153048 ) ) ( not ( = ?auto_153041 ?auto_153046 ) ) ( not ( = ?auto_153041 ?auto_153047 ) ) ( not ( = ?auto_153042 ?auto_153046 ) ) ( not ( = ?auto_153042 ?auto_153047 ) ) ( not ( = ?auto_153043 ?auto_153046 ) ) ( not ( = ?auto_153043 ?auto_153047 ) ) ( not ( = ?auto_153045 ?auto_153046 ) ) ( not ( = ?auto_153045 ?auto_153047 ) ) ( not ( = ?auto_153049 ?auto_153046 ) ) ( not ( = ?auto_153049 ?auto_153047 ) ) ( ON ?auto_153048 ?auto_153049 ) ( ON ?auto_153047 ?auto_153044 ) ( not ( = ?auto_153041 ?auto_153044 ) ) ( not ( = ?auto_153042 ?auto_153044 ) ) ( not ( = ?auto_153043 ?auto_153044 ) ) ( not ( = ?auto_153045 ?auto_153044 ) ) ( not ( = ?auto_153049 ?auto_153044 ) ) ( not ( = ?auto_153048 ?auto_153044 ) ) ( not ( = ?auto_153047 ?auto_153044 ) ) ( not ( = ?auto_153046 ?auto_153044 ) ) ( CLEAR ?auto_153048 ) ( ON ?auto_153046 ?auto_153047 ) ( CLEAR ?auto_153046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153044 ?auto_153047 )
      ( MAKE-3PILE ?auto_153041 ?auto_153042 ?auto_153043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_153050 - BLOCK
      ?auto_153051 - BLOCK
      ?auto_153052 - BLOCK
    )
    :vars
    (
      ?auto_153054 - BLOCK
      ?auto_153055 - BLOCK
      ?auto_153058 - BLOCK
      ?auto_153056 - BLOCK
      ?auto_153053 - BLOCK
      ?auto_153057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153054 ?auto_153052 ) ( ON-TABLE ?auto_153050 ) ( ON ?auto_153051 ?auto_153050 ) ( ON ?auto_153052 ?auto_153051 ) ( not ( = ?auto_153050 ?auto_153051 ) ) ( not ( = ?auto_153050 ?auto_153052 ) ) ( not ( = ?auto_153050 ?auto_153054 ) ) ( not ( = ?auto_153051 ?auto_153052 ) ) ( not ( = ?auto_153051 ?auto_153054 ) ) ( not ( = ?auto_153052 ?auto_153054 ) ) ( not ( = ?auto_153050 ?auto_153055 ) ) ( not ( = ?auto_153050 ?auto_153058 ) ) ( not ( = ?auto_153051 ?auto_153055 ) ) ( not ( = ?auto_153051 ?auto_153058 ) ) ( not ( = ?auto_153052 ?auto_153055 ) ) ( not ( = ?auto_153052 ?auto_153058 ) ) ( not ( = ?auto_153054 ?auto_153055 ) ) ( not ( = ?auto_153054 ?auto_153058 ) ) ( not ( = ?auto_153055 ?auto_153058 ) ) ( ON ?auto_153055 ?auto_153054 ) ( not ( = ?auto_153056 ?auto_153053 ) ) ( not ( = ?auto_153056 ?auto_153058 ) ) ( not ( = ?auto_153053 ?auto_153058 ) ) ( not ( = ?auto_153050 ?auto_153053 ) ) ( not ( = ?auto_153050 ?auto_153056 ) ) ( not ( = ?auto_153051 ?auto_153053 ) ) ( not ( = ?auto_153051 ?auto_153056 ) ) ( not ( = ?auto_153052 ?auto_153053 ) ) ( not ( = ?auto_153052 ?auto_153056 ) ) ( not ( = ?auto_153054 ?auto_153053 ) ) ( not ( = ?auto_153054 ?auto_153056 ) ) ( not ( = ?auto_153055 ?auto_153053 ) ) ( not ( = ?auto_153055 ?auto_153056 ) ) ( ON ?auto_153056 ?auto_153057 ) ( not ( = ?auto_153050 ?auto_153057 ) ) ( not ( = ?auto_153051 ?auto_153057 ) ) ( not ( = ?auto_153052 ?auto_153057 ) ) ( not ( = ?auto_153054 ?auto_153057 ) ) ( not ( = ?auto_153055 ?auto_153057 ) ) ( not ( = ?auto_153058 ?auto_153057 ) ) ( not ( = ?auto_153056 ?auto_153057 ) ) ( not ( = ?auto_153053 ?auto_153057 ) ) ( ON ?auto_153053 ?auto_153056 ) ( CLEAR ?auto_153053 ) ( ON-TABLE ?auto_153057 ) ( HOLDING ?auto_153058 ) ( CLEAR ?auto_153055 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153050 ?auto_153051 ?auto_153052 ?auto_153054 ?auto_153055 ?auto_153058 )
      ( MAKE-3PILE ?auto_153050 ?auto_153051 ?auto_153052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153117 - BLOCK
      ?auto_153118 - BLOCK
      ?auto_153119 - BLOCK
      ?auto_153120 - BLOCK
      ?auto_153121 - BLOCK
    )
    :vars
    (
      ?auto_153122 - BLOCK
      ?auto_153123 - BLOCK
      ?auto_153124 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153117 ) ( ON ?auto_153118 ?auto_153117 ) ( ON ?auto_153119 ?auto_153118 ) ( not ( = ?auto_153117 ?auto_153118 ) ) ( not ( = ?auto_153117 ?auto_153119 ) ) ( not ( = ?auto_153117 ?auto_153120 ) ) ( not ( = ?auto_153117 ?auto_153121 ) ) ( not ( = ?auto_153118 ?auto_153119 ) ) ( not ( = ?auto_153118 ?auto_153120 ) ) ( not ( = ?auto_153118 ?auto_153121 ) ) ( not ( = ?auto_153119 ?auto_153120 ) ) ( not ( = ?auto_153119 ?auto_153121 ) ) ( not ( = ?auto_153120 ?auto_153121 ) ) ( ON ?auto_153121 ?auto_153122 ) ( not ( = ?auto_153117 ?auto_153122 ) ) ( not ( = ?auto_153118 ?auto_153122 ) ) ( not ( = ?auto_153119 ?auto_153122 ) ) ( not ( = ?auto_153120 ?auto_153122 ) ) ( not ( = ?auto_153121 ?auto_153122 ) ) ( CLEAR ?auto_153119 ) ( ON ?auto_153120 ?auto_153121 ) ( CLEAR ?auto_153120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153123 ) ( ON ?auto_153124 ?auto_153123 ) ( ON ?auto_153122 ?auto_153124 ) ( not ( = ?auto_153123 ?auto_153124 ) ) ( not ( = ?auto_153123 ?auto_153122 ) ) ( not ( = ?auto_153123 ?auto_153121 ) ) ( not ( = ?auto_153123 ?auto_153120 ) ) ( not ( = ?auto_153124 ?auto_153122 ) ) ( not ( = ?auto_153124 ?auto_153121 ) ) ( not ( = ?auto_153124 ?auto_153120 ) ) ( not ( = ?auto_153117 ?auto_153123 ) ) ( not ( = ?auto_153117 ?auto_153124 ) ) ( not ( = ?auto_153118 ?auto_153123 ) ) ( not ( = ?auto_153118 ?auto_153124 ) ) ( not ( = ?auto_153119 ?auto_153123 ) ) ( not ( = ?auto_153119 ?auto_153124 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153123 ?auto_153124 ?auto_153122 ?auto_153121 )
      ( MAKE-5PILE ?auto_153117 ?auto_153118 ?auto_153119 ?auto_153120 ?auto_153121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153125 - BLOCK
      ?auto_153126 - BLOCK
      ?auto_153127 - BLOCK
      ?auto_153128 - BLOCK
      ?auto_153129 - BLOCK
    )
    :vars
    (
      ?auto_153131 - BLOCK
      ?auto_153130 - BLOCK
      ?auto_153132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153125 ) ( ON ?auto_153126 ?auto_153125 ) ( not ( = ?auto_153125 ?auto_153126 ) ) ( not ( = ?auto_153125 ?auto_153127 ) ) ( not ( = ?auto_153125 ?auto_153128 ) ) ( not ( = ?auto_153125 ?auto_153129 ) ) ( not ( = ?auto_153126 ?auto_153127 ) ) ( not ( = ?auto_153126 ?auto_153128 ) ) ( not ( = ?auto_153126 ?auto_153129 ) ) ( not ( = ?auto_153127 ?auto_153128 ) ) ( not ( = ?auto_153127 ?auto_153129 ) ) ( not ( = ?auto_153128 ?auto_153129 ) ) ( ON ?auto_153129 ?auto_153131 ) ( not ( = ?auto_153125 ?auto_153131 ) ) ( not ( = ?auto_153126 ?auto_153131 ) ) ( not ( = ?auto_153127 ?auto_153131 ) ) ( not ( = ?auto_153128 ?auto_153131 ) ) ( not ( = ?auto_153129 ?auto_153131 ) ) ( ON ?auto_153128 ?auto_153129 ) ( CLEAR ?auto_153128 ) ( ON-TABLE ?auto_153130 ) ( ON ?auto_153132 ?auto_153130 ) ( ON ?auto_153131 ?auto_153132 ) ( not ( = ?auto_153130 ?auto_153132 ) ) ( not ( = ?auto_153130 ?auto_153131 ) ) ( not ( = ?auto_153130 ?auto_153129 ) ) ( not ( = ?auto_153130 ?auto_153128 ) ) ( not ( = ?auto_153132 ?auto_153131 ) ) ( not ( = ?auto_153132 ?auto_153129 ) ) ( not ( = ?auto_153132 ?auto_153128 ) ) ( not ( = ?auto_153125 ?auto_153130 ) ) ( not ( = ?auto_153125 ?auto_153132 ) ) ( not ( = ?auto_153126 ?auto_153130 ) ) ( not ( = ?auto_153126 ?auto_153132 ) ) ( not ( = ?auto_153127 ?auto_153130 ) ) ( not ( = ?auto_153127 ?auto_153132 ) ) ( HOLDING ?auto_153127 ) ( CLEAR ?auto_153126 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153125 ?auto_153126 ?auto_153127 )
      ( MAKE-5PILE ?auto_153125 ?auto_153126 ?auto_153127 ?auto_153128 ?auto_153129 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153133 - BLOCK
      ?auto_153134 - BLOCK
      ?auto_153135 - BLOCK
      ?auto_153136 - BLOCK
      ?auto_153137 - BLOCK
    )
    :vars
    (
      ?auto_153138 - BLOCK
      ?auto_153139 - BLOCK
      ?auto_153140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153133 ) ( ON ?auto_153134 ?auto_153133 ) ( not ( = ?auto_153133 ?auto_153134 ) ) ( not ( = ?auto_153133 ?auto_153135 ) ) ( not ( = ?auto_153133 ?auto_153136 ) ) ( not ( = ?auto_153133 ?auto_153137 ) ) ( not ( = ?auto_153134 ?auto_153135 ) ) ( not ( = ?auto_153134 ?auto_153136 ) ) ( not ( = ?auto_153134 ?auto_153137 ) ) ( not ( = ?auto_153135 ?auto_153136 ) ) ( not ( = ?auto_153135 ?auto_153137 ) ) ( not ( = ?auto_153136 ?auto_153137 ) ) ( ON ?auto_153137 ?auto_153138 ) ( not ( = ?auto_153133 ?auto_153138 ) ) ( not ( = ?auto_153134 ?auto_153138 ) ) ( not ( = ?auto_153135 ?auto_153138 ) ) ( not ( = ?auto_153136 ?auto_153138 ) ) ( not ( = ?auto_153137 ?auto_153138 ) ) ( ON ?auto_153136 ?auto_153137 ) ( ON-TABLE ?auto_153139 ) ( ON ?auto_153140 ?auto_153139 ) ( ON ?auto_153138 ?auto_153140 ) ( not ( = ?auto_153139 ?auto_153140 ) ) ( not ( = ?auto_153139 ?auto_153138 ) ) ( not ( = ?auto_153139 ?auto_153137 ) ) ( not ( = ?auto_153139 ?auto_153136 ) ) ( not ( = ?auto_153140 ?auto_153138 ) ) ( not ( = ?auto_153140 ?auto_153137 ) ) ( not ( = ?auto_153140 ?auto_153136 ) ) ( not ( = ?auto_153133 ?auto_153139 ) ) ( not ( = ?auto_153133 ?auto_153140 ) ) ( not ( = ?auto_153134 ?auto_153139 ) ) ( not ( = ?auto_153134 ?auto_153140 ) ) ( not ( = ?auto_153135 ?auto_153139 ) ) ( not ( = ?auto_153135 ?auto_153140 ) ) ( CLEAR ?auto_153134 ) ( ON ?auto_153135 ?auto_153136 ) ( CLEAR ?auto_153135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153139 ?auto_153140 ?auto_153138 ?auto_153137 ?auto_153136 )
      ( MAKE-5PILE ?auto_153133 ?auto_153134 ?auto_153135 ?auto_153136 ?auto_153137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153141 - BLOCK
      ?auto_153142 - BLOCK
      ?auto_153143 - BLOCK
      ?auto_153144 - BLOCK
      ?auto_153145 - BLOCK
    )
    :vars
    (
      ?auto_153147 - BLOCK
      ?auto_153146 - BLOCK
      ?auto_153148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153141 ) ( not ( = ?auto_153141 ?auto_153142 ) ) ( not ( = ?auto_153141 ?auto_153143 ) ) ( not ( = ?auto_153141 ?auto_153144 ) ) ( not ( = ?auto_153141 ?auto_153145 ) ) ( not ( = ?auto_153142 ?auto_153143 ) ) ( not ( = ?auto_153142 ?auto_153144 ) ) ( not ( = ?auto_153142 ?auto_153145 ) ) ( not ( = ?auto_153143 ?auto_153144 ) ) ( not ( = ?auto_153143 ?auto_153145 ) ) ( not ( = ?auto_153144 ?auto_153145 ) ) ( ON ?auto_153145 ?auto_153147 ) ( not ( = ?auto_153141 ?auto_153147 ) ) ( not ( = ?auto_153142 ?auto_153147 ) ) ( not ( = ?auto_153143 ?auto_153147 ) ) ( not ( = ?auto_153144 ?auto_153147 ) ) ( not ( = ?auto_153145 ?auto_153147 ) ) ( ON ?auto_153144 ?auto_153145 ) ( ON-TABLE ?auto_153146 ) ( ON ?auto_153148 ?auto_153146 ) ( ON ?auto_153147 ?auto_153148 ) ( not ( = ?auto_153146 ?auto_153148 ) ) ( not ( = ?auto_153146 ?auto_153147 ) ) ( not ( = ?auto_153146 ?auto_153145 ) ) ( not ( = ?auto_153146 ?auto_153144 ) ) ( not ( = ?auto_153148 ?auto_153147 ) ) ( not ( = ?auto_153148 ?auto_153145 ) ) ( not ( = ?auto_153148 ?auto_153144 ) ) ( not ( = ?auto_153141 ?auto_153146 ) ) ( not ( = ?auto_153141 ?auto_153148 ) ) ( not ( = ?auto_153142 ?auto_153146 ) ) ( not ( = ?auto_153142 ?auto_153148 ) ) ( not ( = ?auto_153143 ?auto_153146 ) ) ( not ( = ?auto_153143 ?auto_153148 ) ) ( ON ?auto_153143 ?auto_153144 ) ( CLEAR ?auto_153143 ) ( HOLDING ?auto_153142 ) ( CLEAR ?auto_153141 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153141 ?auto_153142 )
      ( MAKE-5PILE ?auto_153141 ?auto_153142 ?auto_153143 ?auto_153144 ?auto_153145 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153149 - BLOCK
      ?auto_153150 - BLOCK
      ?auto_153151 - BLOCK
      ?auto_153152 - BLOCK
      ?auto_153153 - BLOCK
    )
    :vars
    (
      ?auto_153155 - BLOCK
      ?auto_153154 - BLOCK
      ?auto_153156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153149 ) ( not ( = ?auto_153149 ?auto_153150 ) ) ( not ( = ?auto_153149 ?auto_153151 ) ) ( not ( = ?auto_153149 ?auto_153152 ) ) ( not ( = ?auto_153149 ?auto_153153 ) ) ( not ( = ?auto_153150 ?auto_153151 ) ) ( not ( = ?auto_153150 ?auto_153152 ) ) ( not ( = ?auto_153150 ?auto_153153 ) ) ( not ( = ?auto_153151 ?auto_153152 ) ) ( not ( = ?auto_153151 ?auto_153153 ) ) ( not ( = ?auto_153152 ?auto_153153 ) ) ( ON ?auto_153153 ?auto_153155 ) ( not ( = ?auto_153149 ?auto_153155 ) ) ( not ( = ?auto_153150 ?auto_153155 ) ) ( not ( = ?auto_153151 ?auto_153155 ) ) ( not ( = ?auto_153152 ?auto_153155 ) ) ( not ( = ?auto_153153 ?auto_153155 ) ) ( ON ?auto_153152 ?auto_153153 ) ( ON-TABLE ?auto_153154 ) ( ON ?auto_153156 ?auto_153154 ) ( ON ?auto_153155 ?auto_153156 ) ( not ( = ?auto_153154 ?auto_153156 ) ) ( not ( = ?auto_153154 ?auto_153155 ) ) ( not ( = ?auto_153154 ?auto_153153 ) ) ( not ( = ?auto_153154 ?auto_153152 ) ) ( not ( = ?auto_153156 ?auto_153155 ) ) ( not ( = ?auto_153156 ?auto_153153 ) ) ( not ( = ?auto_153156 ?auto_153152 ) ) ( not ( = ?auto_153149 ?auto_153154 ) ) ( not ( = ?auto_153149 ?auto_153156 ) ) ( not ( = ?auto_153150 ?auto_153154 ) ) ( not ( = ?auto_153150 ?auto_153156 ) ) ( not ( = ?auto_153151 ?auto_153154 ) ) ( not ( = ?auto_153151 ?auto_153156 ) ) ( ON ?auto_153151 ?auto_153152 ) ( CLEAR ?auto_153149 ) ( ON ?auto_153150 ?auto_153151 ) ( CLEAR ?auto_153150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153154 ?auto_153156 ?auto_153155 ?auto_153153 ?auto_153152 ?auto_153151 )
      ( MAKE-5PILE ?auto_153149 ?auto_153150 ?auto_153151 ?auto_153152 ?auto_153153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153157 - BLOCK
      ?auto_153158 - BLOCK
      ?auto_153159 - BLOCK
      ?auto_153160 - BLOCK
      ?auto_153161 - BLOCK
    )
    :vars
    (
      ?auto_153163 - BLOCK
      ?auto_153164 - BLOCK
      ?auto_153162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153157 ?auto_153158 ) ) ( not ( = ?auto_153157 ?auto_153159 ) ) ( not ( = ?auto_153157 ?auto_153160 ) ) ( not ( = ?auto_153157 ?auto_153161 ) ) ( not ( = ?auto_153158 ?auto_153159 ) ) ( not ( = ?auto_153158 ?auto_153160 ) ) ( not ( = ?auto_153158 ?auto_153161 ) ) ( not ( = ?auto_153159 ?auto_153160 ) ) ( not ( = ?auto_153159 ?auto_153161 ) ) ( not ( = ?auto_153160 ?auto_153161 ) ) ( ON ?auto_153161 ?auto_153163 ) ( not ( = ?auto_153157 ?auto_153163 ) ) ( not ( = ?auto_153158 ?auto_153163 ) ) ( not ( = ?auto_153159 ?auto_153163 ) ) ( not ( = ?auto_153160 ?auto_153163 ) ) ( not ( = ?auto_153161 ?auto_153163 ) ) ( ON ?auto_153160 ?auto_153161 ) ( ON-TABLE ?auto_153164 ) ( ON ?auto_153162 ?auto_153164 ) ( ON ?auto_153163 ?auto_153162 ) ( not ( = ?auto_153164 ?auto_153162 ) ) ( not ( = ?auto_153164 ?auto_153163 ) ) ( not ( = ?auto_153164 ?auto_153161 ) ) ( not ( = ?auto_153164 ?auto_153160 ) ) ( not ( = ?auto_153162 ?auto_153163 ) ) ( not ( = ?auto_153162 ?auto_153161 ) ) ( not ( = ?auto_153162 ?auto_153160 ) ) ( not ( = ?auto_153157 ?auto_153164 ) ) ( not ( = ?auto_153157 ?auto_153162 ) ) ( not ( = ?auto_153158 ?auto_153164 ) ) ( not ( = ?auto_153158 ?auto_153162 ) ) ( not ( = ?auto_153159 ?auto_153164 ) ) ( not ( = ?auto_153159 ?auto_153162 ) ) ( ON ?auto_153159 ?auto_153160 ) ( ON ?auto_153158 ?auto_153159 ) ( CLEAR ?auto_153158 ) ( HOLDING ?auto_153157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153157 )
      ( MAKE-5PILE ?auto_153157 ?auto_153158 ?auto_153159 ?auto_153160 ?auto_153161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153165 - BLOCK
      ?auto_153166 - BLOCK
      ?auto_153167 - BLOCK
      ?auto_153168 - BLOCK
      ?auto_153169 - BLOCK
    )
    :vars
    (
      ?auto_153172 - BLOCK
      ?auto_153170 - BLOCK
      ?auto_153171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153165 ?auto_153166 ) ) ( not ( = ?auto_153165 ?auto_153167 ) ) ( not ( = ?auto_153165 ?auto_153168 ) ) ( not ( = ?auto_153165 ?auto_153169 ) ) ( not ( = ?auto_153166 ?auto_153167 ) ) ( not ( = ?auto_153166 ?auto_153168 ) ) ( not ( = ?auto_153166 ?auto_153169 ) ) ( not ( = ?auto_153167 ?auto_153168 ) ) ( not ( = ?auto_153167 ?auto_153169 ) ) ( not ( = ?auto_153168 ?auto_153169 ) ) ( ON ?auto_153169 ?auto_153172 ) ( not ( = ?auto_153165 ?auto_153172 ) ) ( not ( = ?auto_153166 ?auto_153172 ) ) ( not ( = ?auto_153167 ?auto_153172 ) ) ( not ( = ?auto_153168 ?auto_153172 ) ) ( not ( = ?auto_153169 ?auto_153172 ) ) ( ON ?auto_153168 ?auto_153169 ) ( ON-TABLE ?auto_153170 ) ( ON ?auto_153171 ?auto_153170 ) ( ON ?auto_153172 ?auto_153171 ) ( not ( = ?auto_153170 ?auto_153171 ) ) ( not ( = ?auto_153170 ?auto_153172 ) ) ( not ( = ?auto_153170 ?auto_153169 ) ) ( not ( = ?auto_153170 ?auto_153168 ) ) ( not ( = ?auto_153171 ?auto_153172 ) ) ( not ( = ?auto_153171 ?auto_153169 ) ) ( not ( = ?auto_153171 ?auto_153168 ) ) ( not ( = ?auto_153165 ?auto_153170 ) ) ( not ( = ?auto_153165 ?auto_153171 ) ) ( not ( = ?auto_153166 ?auto_153170 ) ) ( not ( = ?auto_153166 ?auto_153171 ) ) ( not ( = ?auto_153167 ?auto_153170 ) ) ( not ( = ?auto_153167 ?auto_153171 ) ) ( ON ?auto_153167 ?auto_153168 ) ( ON ?auto_153166 ?auto_153167 ) ( ON ?auto_153165 ?auto_153166 ) ( CLEAR ?auto_153165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153170 ?auto_153171 ?auto_153172 ?auto_153169 ?auto_153168 ?auto_153167 ?auto_153166 )
      ( MAKE-5PILE ?auto_153165 ?auto_153166 ?auto_153167 ?auto_153168 ?auto_153169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153178 - BLOCK
      ?auto_153179 - BLOCK
      ?auto_153180 - BLOCK
      ?auto_153181 - BLOCK
      ?auto_153182 - BLOCK
    )
    :vars
    (
      ?auto_153184 - BLOCK
      ?auto_153185 - BLOCK
      ?auto_153183 - BLOCK
      ?auto_153186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153178 ?auto_153179 ) ) ( not ( = ?auto_153178 ?auto_153180 ) ) ( not ( = ?auto_153178 ?auto_153181 ) ) ( not ( = ?auto_153178 ?auto_153182 ) ) ( not ( = ?auto_153179 ?auto_153180 ) ) ( not ( = ?auto_153179 ?auto_153181 ) ) ( not ( = ?auto_153179 ?auto_153182 ) ) ( not ( = ?auto_153180 ?auto_153181 ) ) ( not ( = ?auto_153180 ?auto_153182 ) ) ( not ( = ?auto_153181 ?auto_153182 ) ) ( ON ?auto_153182 ?auto_153184 ) ( not ( = ?auto_153178 ?auto_153184 ) ) ( not ( = ?auto_153179 ?auto_153184 ) ) ( not ( = ?auto_153180 ?auto_153184 ) ) ( not ( = ?auto_153181 ?auto_153184 ) ) ( not ( = ?auto_153182 ?auto_153184 ) ) ( ON ?auto_153181 ?auto_153182 ) ( ON-TABLE ?auto_153185 ) ( ON ?auto_153183 ?auto_153185 ) ( ON ?auto_153184 ?auto_153183 ) ( not ( = ?auto_153185 ?auto_153183 ) ) ( not ( = ?auto_153185 ?auto_153184 ) ) ( not ( = ?auto_153185 ?auto_153182 ) ) ( not ( = ?auto_153185 ?auto_153181 ) ) ( not ( = ?auto_153183 ?auto_153184 ) ) ( not ( = ?auto_153183 ?auto_153182 ) ) ( not ( = ?auto_153183 ?auto_153181 ) ) ( not ( = ?auto_153178 ?auto_153185 ) ) ( not ( = ?auto_153178 ?auto_153183 ) ) ( not ( = ?auto_153179 ?auto_153185 ) ) ( not ( = ?auto_153179 ?auto_153183 ) ) ( not ( = ?auto_153180 ?auto_153185 ) ) ( not ( = ?auto_153180 ?auto_153183 ) ) ( ON ?auto_153180 ?auto_153181 ) ( ON ?auto_153179 ?auto_153180 ) ( CLEAR ?auto_153179 ) ( ON ?auto_153178 ?auto_153186 ) ( CLEAR ?auto_153178 ) ( HAND-EMPTY ) ( not ( = ?auto_153178 ?auto_153186 ) ) ( not ( = ?auto_153179 ?auto_153186 ) ) ( not ( = ?auto_153180 ?auto_153186 ) ) ( not ( = ?auto_153181 ?auto_153186 ) ) ( not ( = ?auto_153182 ?auto_153186 ) ) ( not ( = ?auto_153184 ?auto_153186 ) ) ( not ( = ?auto_153185 ?auto_153186 ) ) ( not ( = ?auto_153183 ?auto_153186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153178 ?auto_153186 )
      ( MAKE-5PILE ?auto_153178 ?auto_153179 ?auto_153180 ?auto_153181 ?auto_153182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153187 - BLOCK
      ?auto_153188 - BLOCK
      ?auto_153189 - BLOCK
      ?auto_153190 - BLOCK
      ?auto_153191 - BLOCK
    )
    :vars
    (
      ?auto_153192 - BLOCK
      ?auto_153193 - BLOCK
      ?auto_153194 - BLOCK
      ?auto_153195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153187 ?auto_153188 ) ) ( not ( = ?auto_153187 ?auto_153189 ) ) ( not ( = ?auto_153187 ?auto_153190 ) ) ( not ( = ?auto_153187 ?auto_153191 ) ) ( not ( = ?auto_153188 ?auto_153189 ) ) ( not ( = ?auto_153188 ?auto_153190 ) ) ( not ( = ?auto_153188 ?auto_153191 ) ) ( not ( = ?auto_153189 ?auto_153190 ) ) ( not ( = ?auto_153189 ?auto_153191 ) ) ( not ( = ?auto_153190 ?auto_153191 ) ) ( ON ?auto_153191 ?auto_153192 ) ( not ( = ?auto_153187 ?auto_153192 ) ) ( not ( = ?auto_153188 ?auto_153192 ) ) ( not ( = ?auto_153189 ?auto_153192 ) ) ( not ( = ?auto_153190 ?auto_153192 ) ) ( not ( = ?auto_153191 ?auto_153192 ) ) ( ON ?auto_153190 ?auto_153191 ) ( ON-TABLE ?auto_153193 ) ( ON ?auto_153194 ?auto_153193 ) ( ON ?auto_153192 ?auto_153194 ) ( not ( = ?auto_153193 ?auto_153194 ) ) ( not ( = ?auto_153193 ?auto_153192 ) ) ( not ( = ?auto_153193 ?auto_153191 ) ) ( not ( = ?auto_153193 ?auto_153190 ) ) ( not ( = ?auto_153194 ?auto_153192 ) ) ( not ( = ?auto_153194 ?auto_153191 ) ) ( not ( = ?auto_153194 ?auto_153190 ) ) ( not ( = ?auto_153187 ?auto_153193 ) ) ( not ( = ?auto_153187 ?auto_153194 ) ) ( not ( = ?auto_153188 ?auto_153193 ) ) ( not ( = ?auto_153188 ?auto_153194 ) ) ( not ( = ?auto_153189 ?auto_153193 ) ) ( not ( = ?auto_153189 ?auto_153194 ) ) ( ON ?auto_153189 ?auto_153190 ) ( ON ?auto_153187 ?auto_153195 ) ( CLEAR ?auto_153187 ) ( not ( = ?auto_153187 ?auto_153195 ) ) ( not ( = ?auto_153188 ?auto_153195 ) ) ( not ( = ?auto_153189 ?auto_153195 ) ) ( not ( = ?auto_153190 ?auto_153195 ) ) ( not ( = ?auto_153191 ?auto_153195 ) ) ( not ( = ?auto_153192 ?auto_153195 ) ) ( not ( = ?auto_153193 ?auto_153195 ) ) ( not ( = ?auto_153194 ?auto_153195 ) ) ( HOLDING ?auto_153188 ) ( CLEAR ?auto_153189 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153193 ?auto_153194 ?auto_153192 ?auto_153191 ?auto_153190 ?auto_153189 ?auto_153188 )
      ( MAKE-5PILE ?auto_153187 ?auto_153188 ?auto_153189 ?auto_153190 ?auto_153191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153196 - BLOCK
      ?auto_153197 - BLOCK
      ?auto_153198 - BLOCK
      ?auto_153199 - BLOCK
      ?auto_153200 - BLOCK
    )
    :vars
    (
      ?auto_153202 - BLOCK
      ?auto_153203 - BLOCK
      ?auto_153201 - BLOCK
      ?auto_153204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153196 ?auto_153197 ) ) ( not ( = ?auto_153196 ?auto_153198 ) ) ( not ( = ?auto_153196 ?auto_153199 ) ) ( not ( = ?auto_153196 ?auto_153200 ) ) ( not ( = ?auto_153197 ?auto_153198 ) ) ( not ( = ?auto_153197 ?auto_153199 ) ) ( not ( = ?auto_153197 ?auto_153200 ) ) ( not ( = ?auto_153198 ?auto_153199 ) ) ( not ( = ?auto_153198 ?auto_153200 ) ) ( not ( = ?auto_153199 ?auto_153200 ) ) ( ON ?auto_153200 ?auto_153202 ) ( not ( = ?auto_153196 ?auto_153202 ) ) ( not ( = ?auto_153197 ?auto_153202 ) ) ( not ( = ?auto_153198 ?auto_153202 ) ) ( not ( = ?auto_153199 ?auto_153202 ) ) ( not ( = ?auto_153200 ?auto_153202 ) ) ( ON ?auto_153199 ?auto_153200 ) ( ON-TABLE ?auto_153203 ) ( ON ?auto_153201 ?auto_153203 ) ( ON ?auto_153202 ?auto_153201 ) ( not ( = ?auto_153203 ?auto_153201 ) ) ( not ( = ?auto_153203 ?auto_153202 ) ) ( not ( = ?auto_153203 ?auto_153200 ) ) ( not ( = ?auto_153203 ?auto_153199 ) ) ( not ( = ?auto_153201 ?auto_153202 ) ) ( not ( = ?auto_153201 ?auto_153200 ) ) ( not ( = ?auto_153201 ?auto_153199 ) ) ( not ( = ?auto_153196 ?auto_153203 ) ) ( not ( = ?auto_153196 ?auto_153201 ) ) ( not ( = ?auto_153197 ?auto_153203 ) ) ( not ( = ?auto_153197 ?auto_153201 ) ) ( not ( = ?auto_153198 ?auto_153203 ) ) ( not ( = ?auto_153198 ?auto_153201 ) ) ( ON ?auto_153198 ?auto_153199 ) ( ON ?auto_153196 ?auto_153204 ) ( not ( = ?auto_153196 ?auto_153204 ) ) ( not ( = ?auto_153197 ?auto_153204 ) ) ( not ( = ?auto_153198 ?auto_153204 ) ) ( not ( = ?auto_153199 ?auto_153204 ) ) ( not ( = ?auto_153200 ?auto_153204 ) ) ( not ( = ?auto_153202 ?auto_153204 ) ) ( not ( = ?auto_153203 ?auto_153204 ) ) ( not ( = ?auto_153201 ?auto_153204 ) ) ( CLEAR ?auto_153198 ) ( ON ?auto_153197 ?auto_153196 ) ( CLEAR ?auto_153197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153204 ?auto_153196 )
      ( MAKE-5PILE ?auto_153196 ?auto_153197 ?auto_153198 ?auto_153199 ?auto_153200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153205 - BLOCK
      ?auto_153206 - BLOCK
      ?auto_153207 - BLOCK
      ?auto_153208 - BLOCK
      ?auto_153209 - BLOCK
    )
    :vars
    (
      ?auto_153213 - BLOCK
      ?auto_153211 - BLOCK
      ?auto_153210 - BLOCK
      ?auto_153212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153205 ?auto_153206 ) ) ( not ( = ?auto_153205 ?auto_153207 ) ) ( not ( = ?auto_153205 ?auto_153208 ) ) ( not ( = ?auto_153205 ?auto_153209 ) ) ( not ( = ?auto_153206 ?auto_153207 ) ) ( not ( = ?auto_153206 ?auto_153208 ) ) ( not ( = ?auto_153206 ?auto_153209 ) ) ( not ( = ?auto_153207 ?auto_153208 ) ) ( not ( = ?auto_153207 ?auto_153209 ) ) ( not ( = ?auto_153208 ?auto_153209 ) ) ( ON ?auto_153209 ?auto_153213 ) ( not ( = ?auto_153205 ?auto_153213 ) ) ( not ( = ?auto_153206 ?auto_153213 ) ) ( not ( = ?auto_153207 ?auto_153213 ) ) ( not ( = ?auto_153208 ?auto_153213 ) ) ( not ( = ?auto_153209 ?auto_153213 ) ) ( ON ?auto_153208 ?auto_153209 ) ( ON-TABLE ?auto_153211 ) ( ON ?auto_153210 ?auto_153211 ) ( ON ?auto_153213 ?auto_153210 ) ( not ( = ?auto_153211 ?auto_153210 ) ) ( not ( = ?auto_153211 ?auto_153213 ) ) ( not ( = ?auto_153211 ?auto_153209 ) ) ( not ( = ?auto_153211 ?auto_153208 ) ) ( not ( = ?auto_153210 ?auto_153213 ) ) ( not ( = ?auto_153210 ?auto_153209 ) ) ( not ( = ?auto_153210 ?auto_153208 ) ) ( not ( = ?auto_153205 ?auto_153211 ) ) ( not ( = ?auto_153205 ?auto_153210 ) ) ( not ( = ?auto_153206 ?auto_153211 ) ) ( not ( = ?auto_153206 ?auto_153210 ) ) ( not ( = ?auto_153207 ?auto_153211 ) ) ( not ( = ?auto_153207 ?auto_153210 ) ) ( ON ?auto_153205 ?auto_153212 ) ( not ( = ?auto_153205 ?auto_153212 ) ) ( not ( = ?auto_153206 ?auto_153212 ) ) ( not ( = ?auto_153207 ?auto_153212 ) ) ( not ( = ?auto_153208 ?auto_153212 ) ) ( not ( = ?auto_153209 ?auto_153212 ) ) ( not ( = ?auto_153213 ?auto_153212 ) ) ( not ( = ?auto_153211 ?auto_153212 ) ) ( not ( = ?auto_153210 ?auto_153212 ) ) ( ON ?auto_153206 ?auto_153205 ) ( CLEAR ?auto_153206 ) ( ON-TABLE ?auto_153212 ) ( HOLDING ?auto_153207 ) ( CLEAR ?auto_153208 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153211 ?auto_153210 ?auto_153213 ?auto_153209 ?auto_153208 ?auto_153207 )
      ( MAKE-5PILE ?auto_153205 ?auto_153206 ?auto_153207 ?auto_153208 ?auto_153209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153214 - BLOCK
      ?auto_153215 - BLOCK
      ?auto_153216 - BLOCK
      ?auto_153217 - BLOCK
      ?auto_153218 - BLOCK
    )
    :vars
    (
      ?auto_153219 - BLOCK
      ?auto_153221 - BLOCK
      ?auto_153220 - BLOCK
      ?auto_153222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153214 ?auto_153215 ) ) ( not ( = ?auto_153214 ?auto_153216 ) ) ( not ( = ?auto_153214 ?auto_153217 ) ) ( not ( = ?auto_153214 ?auto_153218 ) ) ( not ( = ?auto_153215 ?auto_153216 ) ) ( not ( = ?auto_153215 ?auto_153217 ) ) ( not ( = ?auto_153215 ?auto_153218 ) ) ( not ( = ?auto_153216 ?auto_153217 ) ) ( not ( = ?auto_153216 ?auto_153218 ) ) ( not ( = ?auto_153217 ?auto_153218 ) ) ( ON ?auto_153218 ?auto_153219 ) ( not ( = ?auto_153214 ?auto_153219 ) ) ( not ( = ?auto_153215 ?auto_153219 ) ) ( not ( = ?auto_153216 ?auto_153219 ) ) ( not ( = ?auto_153217 ?auto_153219 ) ) ( not ( = ?auto_153218 ?auto_153219 ) ) ( ON ?auto_153217 ?auto_153218 ) ( ON-TABLE ?auto_153221 ) ( ON ?auto_153220 ?auto_153221 ) ( ON ?auto_153219 ?auto_153220 ) ( not ( = ?auto_153221 ?auto_153220 ) ) ( not ( = ?auto_153221 ?auto_153219 ) ) ( not ( = ?auto_153221 ?auto_153218 ) ) ( not ( = ?auto_153221 ?auto_153217 ) ) ( not ( = ?auto_153220 ?auto_153219 ) ) ( not ( = ?auto_153220 ?auto_153218 ) ) ( not ( = ?auto_153220 ?auto_153217 ) ) ( not ( = ?auto_153214 ?auto_153221 ) ) ( not ( = ?auto_153214 ?auto_153220 ) ) ( not ( = ?auto_153215 ?auto_153221 ) ) ( not ( = ?auto_153215 ?auto_153220 ) ) ( not ( = ?auto_153216 ?auto_153221 ) ) ( not ( = ?auto_153216 ?auto_153220 ) ) ( ON ?auto_153214 ?auto_153222 ) ( not ( = ?auto_153214 ?auto_153222 ) ) ( not ( = ?auto_153215 ?auto_153222 ) ) ( not ( = ?auto_153216 ?auto_153222 ) ) ( not ( = ?auto_153217 ?auto_153222 ) ) ( not ( = ?auto_153218 ?auto_153222 ) ) ( not ( = ?auto_153219 ?auto_153222 ) ) ( not ( = ?auto_153221 ?auto_153222 ) ) ( not ( = ?auto_153220 ?auto_153222 ) ) ( ON ?auto_153215 ?auto_153214 ) ( ON-TABLE ?auto_153222 ) ( CLEAR ?auto_153217 ) ( ON ?auto_153216 ?auto_153215 ) ( CLEAR ?auto_153216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153222 ?auto_153214 ?auto_153215 )
      ( MAKE-5PILE ?auto_153214 ?auto_153215 ?auto_153216 ?auto_153217 ?auto_153218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153223 - BLOCK
      ?auto_153224 - BLOCK
      ?auto_153225 - BLOCK
      ?auto_153226 - BLOCK
      ?auto_153227 - BLOCK
    )
    :vars
    (
      ?auto_153230 - BLOCK
      ?auto_153229 - BLOCK
      ?auto_153231 - BLOCK
      ?auto_153228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153223 ?auto_153224 ) ) ( not ( = ?auto_153223 ?auto_153225 ) ) ( not ( = ?auto_153223 ?auto_153226 ) ) ( not ( = ?auto_153223 ?auto_153227 ) ) ( not ( = ?auto_153224 ?auto_153225 ) ) ( not ( = ?auto_153224 ?auto_153226 ) ) ( not ( = ?auto_153224 ?auto_153227 ) ) ( not ( = ?auto_153225 ?auto_153226 ) ) ( not ( = ?auto_153225 ?auto_153227 ) ) ( not ( = ?auto_153226 ?auto_153227 ) ) ( ON ?auto_153227 ?auto_153230 ) ( not ( = ?auto_153223 ?auto_153230 ) ) ( not ( = ?auto_153224 ?auto_153230 ) ) ( not ( = ?auto_153225 ?auto_153230 ) ) ( not ( = ?auto_153226 ?auto_153230 ) ) ( not ( = ?auto_153227 ?auto_153230 ) ) ( ON-TABLE ?auto_153229 ) ( ON ?auto_153231 ?auto_153229 ) ( ON ?auto_153230 ?auto_153231 ) ( not ( = ?auto_153229 ?auto_153231 ) ) ( not ( = ?auto_153229 ?auto_153230 ) ) ( not ( = ?auto_153229 ?auto_153227 ) ) ( not ( = ?auto_153229 ?auto_153226 ) ) ( not ( = ?auto_153231 ?auto_153230 ) ) ( not ( = ?auto_153231 ?auto_153227 ) ) ( not ( = ?auto_153231 ?auto_153226 ) ) ( not ( = ?auto_153223 ?auto_153229 ) ) ( not ( = ?auto_153223 ?auto_153231 ) ) ( not ( = ?auto_153224 ?auto_153229 ) ) ( not ( = ?auto_153224 ?auto_153231 ) ) ( not ( = ?auto_153225 ?auto_153229 ) ) ( not ( = ?auto_153225 ?auto_153231 ) ) ( ON ?auto_153223 ?auto_153228 ) ( not ( = ?auto_153223 ?auto_153228 ) ) ( not ( = ?auto_153224 ?auto_153228 ) ) ( not ( = ?auto_153225 ?auto_153228 ) ) ( not ( = ?auto_153226 ?auto_153228 ) ) ( not ( = ?auto_153227 ?auto_153228 ) ) ( not ( = ?auto_153230 ?auto_153228 ) ) ( not ( = ?auto_153229 ?auto_153228 ) ) ( not ( = ?auto_153231 ?auto_153228 ) ) ( ON ?auto_153224 ?auto_153223 ) ( ON-TABLE ?auto_153228 ) ( ON ?auto_153225 ?auto_153224 ) ( CLEAR ?auto_153225 ) ( HOLDING ?auto_153226 ) ( CLEAR ?auto_153227 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153229 ?auto_153231 ?auto_153230 ?auto_153227 ?auto_153226 )
      ( MAKE-5PILE ?auto_153223 ?auto_153224 ?auto_153225 ?auto_153226 ?auto_153227 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153232 - BLOCK
      ?auto_153233 - BLOCK
      ?auto_153234 - BLOCK
      ?auto_153235 - BLOCK
      ?auto_153236 - BLOCK
    )
    :vars
    (
      ?auto_153239 - BLOCK
      ?auto_153237 - BLOCK
      ?auto_153238 - BLOCK
      ?auto_153240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153232 ?auto_153233 ) ) ( not ( = ?auto_153232 ?auto_153234 ) ) ( not ( = ?auto_153232 ?auto_153235 ) ) ( not ( = ?auto_153232 ?auto_153236 ) ) ( not ( = ?auto_153233 ?auto_153234 ) ) ( not ( = ?auto_153233 ?auto_153235 ) ) ( not ( = ?auto_153233 ?auto_153236 ) ) ( not ( = ?auto_153234 ?auto_153235 ) ) ( not ( = ?auto_153234 ?auto_153236 ) ) ( not ( = ?auto_153235 ?auto_153236 ) ) ( ON ?auto_153236 ?auto_153239 ) ( not ( = ?auto_153232 ?auto_153239 ) ) ( not ( = ?auto_153233 ?auto_153239 ) ) ( not ( = ?auto_153234 ?auto_153239 ) ) ( not ( = ?auto_153235 ?auto_153239 ) ) ( not ( = ?auto_153236 ?auto_153239 ) ) ( ON-TABLE ?auto_153237 ) ( ON ?auto_153238 ?auto_153237 ) ( ON ?auto_153239 ?auto_153238 ) ( not ( = ?auto_153237 ?auto_153238 ) ) ( not ( = ?auto_153237 ?auto_153239 ) ) ( not ( = ?auto_153237 ?auto_153236 ) ) ( not ( = ?auto_153237 ?auto_153235 ) ) ( not ( = ?auto_153238 ?auto_153239 ) ) ( not ( = ?auto_153238 ?auto_153236 ) ) ( not ( = ?auto_153238 ?auto_153235 ) ) ( not ( = ?auto_153232 ?auto_153237 ) ) ( not ( = ?auto_153232 ?auto_153238 ) ) ( not ( = ?auto_153233 ?auto_153237 ) ) ( not ( = ?auto_153233 ?auto_153238 ) ) ( not ( = ?auto_153234 ?auto_153237 ) ) ( not ( = ?auto_153234 ?auto_153238 ) ) ( ON ?auto_153232 ?auto_153240 ) ( not ( = ?auto_153232 ?auto_153240 ) ) ( not ( = ?auto_153233 ?auto_153240 ) ) ( not ( = ?auto_153234 ?auto_153240 ) ) ( not ( = ?auto_153235 ?auto_153240 ) ) ( not ( = ?auto_153236 ?auto_153240 ) ) ( not ( = ?auto_153239 ?auto_153240 ) ) ( not ( = ?auto_153237 ?auto_153240 ) ) ( not ( = ?auto_153238 ?auto_153240 ) ) ( ON ?auto_153233 ?auto_153232 ) ( ON-TABLE ?auto_153240 ) ( ON ?auto_153234 ?auto_153233 ) ( CLEAR ?auto_153236 ) ( ON ?auto_153235 ?auto_153234 ) ( CLEAR ?auto_153235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153240 ?auto_153232 ?auto_153233 ?auto_153234 )
      ( MAKE-5PILE ?auto_153232 ?auto_153233 ?auto_153234 ?auto_153235 ?auto_153236 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153241 - BLOCK
      ?auto_153242 - BLOCK
      ?auto_153243 - BLOCK
      ?auto_153244 - BLOCK
      ?auto_153245 - BLOCK
    )
    :vars
    (
      ?auto_153247 - BLOCK
      ?auto_153248 - BLOCK
      ?auto_153246 - BLOCK
      ?auto_153249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153241 ?auto_153242 ) ) ( not ( = ?auto_153241 ?auto_153243 ) ) ( not ( = ?auto_153241 ?auto_153244 ) ) ( not ( = ?auto_153241 ?auto_153245 ) ) ( not ( = ?auto_153242 ?auto_153243 ) ) ( not ( = ?auto_153242 ?auto_153244 ) ) ( not ( = ?auto_153242 ?auto_153245 ) ) ( not ( = ?auto_153243 ?auto_153244 ) ) ( not ( = ?auto_153243 ?auto_153245 ) ) ( not ( = ?auto_153244 ?auto_153245 ) ) ( not ( = ?auto_153241 ?auto_153247 ) ) ( not ( = ?auto_153242 ?auto_153247 ) ) ( not ( = ?auto_153243 ?auto_153247 ) ) ( not ( = ?auto_153244 ?auto_153247 ) ) ( not ( = ?auto_153245 ?auto_153247 ) ) ( ON-TABLE ?auto_153248 ) ( ON ?auto_153246 ?auto_153248 ) ( ON ?auto_153247 ?auto_153246 ) ( not ( = ?auto_153248 ?auto_153246 ) ) ( not ( = ?auto_153248 ?auto_153247 ) ) ( not ( = ?auto_153248 ?auto_153245 ) ) ( not ( = ?auto_153248 ?auto_153244 ) ) ( not ( = ?auto_153246 ?auto_153247 ) ) ( not ( = ?auto_153246 ?auto_153245 ) ) ( not ( = ?auto_153246 ?auto_153244 ) ) ( not ( = ?auto_153241 ?auto_153248 ) ) ( not ( = ?auto_153241 ?auto_153246 ) ) ( not ( = ?auto_153242 ?auto_153248 ) ) ( not ( = ?auto_153242 ?auto_153246 ) ) ( not ( = ?auto_153243 ?auto_153248 ) ) ( not ( = ?auto_153243 ?auto_153246 ) ) ( ON ?auto_153241 ?auto_153249 ) ( not ( = ?auto_153241 ?auto_153249 ) ) ( not ( = ?auto_153242 ?auto_153249 ) ) ( not ( = ?auto_153243 ?auto_153249 ) ) ( not ( = ?auto_153244 ?auto_153249 ) ) ( not ( = ?auto_153245 ?auto_153249 ) ) ( not ( = ?auto_153247 ?auto_153249 ) ) ( not ( = ?auto_153248 ?auto_153249 ) ) ( not ( = ?auto_153246 ?auto_153249 ) ) ( ON ?auto_153242 ?auto_153241 ) ( ON-TABLE ?auto_153249 ) ( ON ?auto_153243 ?auto_153242 ) ( ON ?auto_153244 ?auto_153243 ) ( CLEAR ?auto_153244 ) ( HOLDING ?auto_153245 ) ( CLEAR ?auto_153247 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153248 ?auto_153246 ?auto_153247 ?auto_153245 )
      ( MAKE-5PILE ?auto_153241 ?auto_153242 ?auto_153243 ?auto_153244 ?auto_153245 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153250 - BLOCK
      ?auto_153251 - BLOCK
      ?auto_153252 - BLOCK
      ?auto_153253 - BLOCK
      ?auto_153254 - BLOCK
    )
    :vars
    (
      ?auto_153256 - BLOCK
      ?auto_153257 - BLOCK
      ?auto_153258 - BLOCK
      ?auto_153255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153250 ?auto_153251 ) ) ( not ( = ?auto_153250 ?auto_153252 ) ) ( not ( = ?auto_153250 ?auto_153253 ) ) ( not ( = ?auto_153250 ?auto_153254 ) ) ( not ( = ?auto_153251 ?auto_153252 ) ) ( not ( = ?auto_153251 ?auto_153253 ) ) ( not ( = ?auto_153251 ?auto_153254 ) ) ( not ( = ?auto_153252 ?auto_153253 ) ) ( not ( = ?auto_153252 ?auto_153254 ) ) ( not ( = ?auto_153253 ?auto_153254 ) ) ( not ( = ?auto_153250 ?auto_153256 ) ) ( not ( = ?auto_153251 ?auto_153256 ) ) ( not ( = ?auto_153252 ?auto_153256 ) ) ( not ( = ?auto_153253 ?auto_153256 ) ) ( not ( = ?auto_153254 ?auto_153256 ) ) ( ON-TABLE ?auto_153257 ) ( ON ?auto_153258 ?auto_153257 ) ( ON ?auto_153256 ?auto_153258 ) ( not ( = ?auto_153257 ?auto_153258 ) ) ( not ( = ?auto_153257 ?auto_153256 ) ) ( not ( = ?auto_153257 ?auto_153254 ) ) ( not ( = ?auto_153257 ?auto_153253 ) ) ( not ( = ?auto_153258 ?auto_153256 ) ) ( not ( = ?auto_153258 ?auto_153254 ) ) ( not ( = ?auto_153258 ?auto_153253 ) ) ( not ( = ?auto_153250 ?auto_153257 ) ) ( not ( = ?auto_153250 ?auto_153258 ) ) ( not ( = ?auto_153251 ?auto_153257 ) ) ( not ( = ?auto_153251 ?auto_153258 ) ) ( not ( = ?auto_153252 ?auto_153257 ) ) ( not ( = ?auto_153252 ?auto_153258 ) ) ( ON ?auto_153250 ?auto_153255 ) ( not ( = ?auto_153250 ?auto_153255 ) ) ( not ( = ?auto_153251 ?auto_153255 ) ) ( not ( = ?auto_153252 ?auto_153255 ) ) ( not ( = ?auto_153253 ?auto_153255 ) ) ( not ( = ?auto_153254 ?auto_153255 ) ) ( not ( = ?auto_153256 ?auto_153255 ) ) ( not ( = ?auto_153257 ?auto_153255 ) ) ( not ( = ?auto_153258 ?auto_153255 ) ) ( ON ?auto_153251 ?auto_153250 ) ( ON-TABLE ?auto_153255 ) ( ON ?auto_153252 ?auto_153251 ) ( ON ?auto_153253 ?auto_153252 ) ( CLEAR ?auto_153256 ) ( ON ?auto_153254 ?auto_153253 ) ( CLEAR ?auto_153254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153255 ?auto_153250 ?auto_153251 ?auto_153252 ?auto_153253 )
      ( MAKE-5PILE ?auto_153250 ?auto_153251 ?auto_153252 ?auto_153253 ?auto_153254 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153259 - BLOCK
      ?auto_153260 - BLOCK
      ?auto_153261 - BLOCK
      ?auto_153262 - BLOCK
      ?auto_153263 - BLOCK
    )
    :vars
    (
      ?auto_153267 - BLOCK
      ?auto_153266 - BLOCK
      ?auto_153265 - BLOCK
      ?auto_153264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153259 ?auto_153260 ) ) ( not ( = ?auto_153259 ?auto_153261 ) ) ( not ( = ?auto_153259 ?auto_153262 ) ) ( not ( = ?auto_153259 ?auto_153263 ) ) ( not ( = ?auto_153260 ?auto_153261 ) ) ( not ( = ?auto_153260 ?auto_153262 ) ) ( not ( = ?auto_153260 ?auto_153263 ) ) ( not ( = ?auto_153261 ?auto_153262 ) ) ( not ( = ?auto_153261 ?auto_153263 ) ) ( not ( = ?auto_153262 ?auto_153263 ) ) ( not ( = ?auto_153259 ?auto_153267 ) ) ( not ( = ?auto_153260 ?auto_153267 ) ) ( not ( = ?auto_153261 ?auto_153267 ) ) ( not ( = ?auto_153262 ?auto_153267 ) ) ( not ( = ?auto_153263 ?auto_153267 ) ) ( ON-TABLE ?auto_153266 ) ( ON ?auto_153265 ?auto_153266 ) ( not ( = ?auto_153266 ?auto_153265 ) ) ( not ( = ?auto_153266 ?auto_153267 ) ) ( not ( = ?auto_153266 ?auto_153263 ) ) ( not ( = ?auto_153266 ?auto_153262 ) ) ( not ( = ?auto_153265 ?auto_153267 ) ) ( not ( = ?auto_153265 ?auto_153263 ) ) ( not ( = ?auto_153265 ?auto_153262 ) ) ( not ( = ?auto_153259 ?auto_153266 ) ) ( not ( = ?auto_153259 ?auto_153265 ) ) ( not ( = ?auto_153260 ?auto_153266 ) ) ( not ( = ?auto_153260 ?auto_153265 ) ) ( not ( = ?auto_153261 ?auto_153266 ) ) ( not ( = ?auto_153261 ?auto_153265 ) ) ( ON ?auto_153259 ?auto_153264 ) ( not ( = ?auto_153259 ?auto_153264 ) ) ( not ( = ?auto_153260 ?auto_153264 ) ) ( not ( = ?auto_153261 ?auto_153264 ) ) ( not ( = ?auto_153262 ?auto_153264 ) ) ( not ( = ?auto_153263 ?auto_153264 ) ) ( not ( = ?auto_153267 ?auto_153264 ) ) ( not ( = ?auto_153266 ?auto_153264 ) ) ( not ( = ?auto_153265 ?auto_153264 ) ) ( ON ?auto_153260 ?auto_153259 ) ( ON-TABLE ?auto_153264 ) ( ON ?auto_153261 ?auto_153260 ) ( ON ?auto_153262 ?auto_153261 ) ( ON ?auto_153263 ?auto_153262 ) ( CLEAR ?auto_153263 ) ( HOLDING ?auto_153267 ) ( CLEAR ?auto_153265 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153266 ?auto_153265 ?auto_153267 )
      ( MAKE-5PILE ?auto_153259 ?auto_153260 ?auto_153261 ?auto_153262 ?auto_153263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153268 - BLOCK
      ?auto_153269 - BLOCK
      ?auto_153270 - BLOCK
      ?auto_153271 - BLOCK
      ?auto_153272 - BLOCK
    )
    :vars
    (
      ?auto_153274 - BLOCK
      ?auto_153276 - BLOCK
      ?auto_153275 - BLOCK
      ?auto_153273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153268 ?auto_153269 ) ) ( not ( = ?auto_153268 ?auto_153270 ) ) ( not ( = ?auto_153268 ?auto_153271 ) ) ( not ( = ?auto_153268 ?auto_153272 ) ) ( not ( = ?auto_153269 ?auto_153270 ) ) ( not ( = ?auto_153269 ?auto_153271 ) ) ( not ( = ?auto_153269 ?auto_153272 ) ) ( not ( = ?auto_153270 ?auto_153271 ) ) ( not ( = ?auto_153270 ?auto_153272 ) ) ( not ( = ?auto_153271 ?auto_153272 ) ) ( not ( = ?auto_153268 ?auto_153274 ) ) ( not ( = ?auto_153269 ?auto_153274 ) ) ( not ( = ?auto_153270 ?auto_153274 ) ) ( not ( = ?auto_153271 ?auto_153274 ) ) ( not ( = ?auto_153272 ?auto_153274 ) ) ( ON-TABLE ?auto_153276 ) ( ON ?auto_153275 ?auto_153276 ) ( not ( = ?auto_153276 ?auto_153275 ) ) ( not ( = ?auto_153276 ?auto_153274 ) ) ( not ( = ?auto_153276 ?auto_153272 ) ) ( not ( = ?auto_153276 ?auto_153271 ) ) ( not ( = ?auto_153275 ?auto_153274 ) ) ( not ( = ?auto_153275 ?auto_153272 ) ) ( not ( = ?auto_153275 ?auto_153271 ) ) ( not ( = ?auto_153268 ?auto_153276 ) ) ( not ( = ?auto_153268 ?auto_153275 ) ) ( not ( = ?auto_153269 ?auto_153276 ) ) ( not ( = ?auto_153269 ?auto_153275 ) ) ( not ( = ?auto_153270 ?auto_153276 ) ) ( not ( = ?auto_153270 ?auto_153275 ) ) ( ON ?auto_153268 ?auto_153273 ) ( not ( = ?auto_153268 ?auto_153273 ) ) ( not ( = ?auto_153269 ?auto_153273 ) ) ( not ( = ?auto_153270 ?auto_153273 ) ) ( not ( = ?auto_153271 ?auto_153273 ) ) ( not ( = ?auto_153272 ?auto_153273 ) ) ( not ( = ?auto_153274 ?auto_153273 ) ) ( not ( = ?auto_153276 ?auto_153273 ) ) ( not ( = ?auto_153275 ?auto_153273 ) ) ( ON ?auto_153269 ?auto_153268 ) ( ON-TABLE ?auto_153273 ) ( ON ?auto_153270 ?auto_153269 ) ( ON ?auto_153271 ?auto_153270 ) ( ON ?auto_153272 ?auto_153271 ) ( CLEAR ?auto_153275 ) ( ON ?auto_153274 ?auto_153272 ) ( CLEAR ?auto_153274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153273 ?auto_153268 ?auto_153269 ?auto_153270 ?auto_153271 ?auto_153272 )
      ( MAKE-5PILE ?auto_153268 ?auto_153269 ?auto_153270 ?auto_153271 ?auto_153272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153277 - BLOCK
      ?auto_153278 - BLOCK
      ?auto_153279 - BLOCK
      ?auto_153280 - BLOCK
      ?auto_153281 - BLOCK
    )
    :vars
    (
      ?auto_153285 - BLOCK
      ?auto_153283 - BLOCK
      ?auto_153284 - BLOCK
      ?auto_153282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153277 ?auto_153278 ) ) ( not ( = ?auto_153277 ?auto_153279 ) ) ( not ( = ?auto_153277 ?auto_153280 ) ) ( not ( = ?auto_153277 ?auto_153281 ) ) ( not ( = ?auto_153278 ?auto_153279 ) ) ( not ( = ?auto_153278 ?auto_153280 ) ) ( not ( = ?auto_153278 ?auto_153281 ) ) ( not ( = ?auto_153279 ?auto_153280 ) ) ( not ( = ?auto_153279 ?auto_153281 ) ) ( not ( = ?auto_153280 ?auto_153281 ) ) ( not ( = ?auto_153277 ?auto_153285 ) ) ( not ( = ?auto_153278 ?auto_153285 ) ) ( not ( = ?auto_153279 ?auto_153285 ) ) ( not ( = ?auto_153280 ?auto_153285 ) ) ( not ( = ?auto_153281 ?auto_153285 ) ) ( ON-TABLE ?auto_153283 ) ( not ( = ?auto_153283 ?auto_153284 ) ) ( not ( = ?auto_153283 ?auto_153285 ) ) ( not ( = ?auto_153283 ?auto_153281 ) ) ( not ( = ?auto_153283 ?auto_153280 ) ) ( not ( = ?auto_153284 ?auto_153285 ) ) ( not ( = ?auto_153284 ?auto_153281 ) ) ( not ( = ?auto_153284 ?auto_153280 ) ) ( not ( = ?auto_153277 ?auto_153283 ) ) ( not ( = ?auto_153277 ?auto_153284 ) ) ( not ( = ?auto_153278 ?auto_153283 ) ) ( not ( = ?auto_153278 ?auto_153284 ) ) ( not ( = ?auto_153279 ?auto_153283 ) ) ( not ( = ?auto_153279 ?auto_153284 ) ) ( ON ?auto_153277 ?auto_153282 ) ( not ( = ?auto_153277 ?auto_153282 ) ) ( not ( = ?auto_153278 ?auto_153282 ) ) ( not ( = ?auto_153279 ?auto_153282 ) ) ( not ( = ?auto_153280 ?auto_153282 ) ) ( not ( = ?auto_153281 ?auto_153282 ) ) ( not ( = ?auto_153285 ?auto_153282 ) ) ( not ( = ?auto_153283 ?auto_153282 ) ) ( not ( = ?auto_153284 ?auto_153282 ) ) ( ON ?auto_153278 ?auto_153277 ) ( ON-TABLE ?auto_153282 ) ( ON ?auto_153279 ?auto_153278 ) ( ON ?auto_153280 ?auto_153279 ) ( ON ?auto_153281 ?auto_153280 ) ( ON ?auto_153285 ?auto_153281 ) ( CLEAR ?auto_153285 ) ( HOLDING ?auto_153284 ) ( CLEAR ?auto_153283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153283 ?auto_153284 )
      ( MAKE-5PILE ?auto_153277 ?auto_153278 ?auto_153279 ?auto_153280 ?auto_153281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153286 - BLOCK
      ?auto_153287 - BLOCK
      ?auto_153288 - BLOCK
      ?auto_153289 - BLOCK
      ?auto_153290 - BLOCK
    )
    :vars
    (
      ?auto_153292 - BLOCK
      ?auto_153294 - BLOCK
      ?auto_153291 - BLOCK
      ?auto_153293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153286 ?auto_153287 ) ) ( not ( = ?auto_153286 ?auto_153288 ) ) ( not ( = ?auto_153286 ?auto_153289 ) ) ( not ( = ?auto_153286 ?auto_153290 ) ) ( not ( = ?auto_153287 ?auto_153288 ) ) ( not ( = ?auto_153287 ?auto_153289 ) ) ( not ( = ?auto_153287 ?auto_153290 ) ) ( not ( = ?auto_153288 ?auto_153289 ) ) ( not ( = ?auto_153288 ?auto_153290 ) ) ( not ( = ?auto_153289 ?auto_153290 ) ) ( not ( = ?auto_153286 ?auto_153292 ) ) ( not ( = ?auto_153287 ?auto_153292 ) ) ( not ( = ?auto_153288 ?auto_153292 ) ) ( not ( = ?auto_153289 ?auto_153292 ) ) ( not ( = ?auto_153290 ?auto_153292 ) ) ( ON-TABLE ?auto_153294 ) ( not ( = ?auto_153294 ?auto_153291 ) ) ( not ( = ?auto_153294 ?auto_153292 ) ) ( not ( = ?auto_153294 ?auto_153290 ) ) ( not ( = ?auto_153294 ?auto_153289 ) ) ( not ( = ?auto_153291 ?auto_153292 ) ) ( not ( = ?auto_153291 ?auto_153290 ) ) ( not ( = ?auto_153291 ?auto_153289 ) ) ( not ( = ?auto_153286 ?auto_153294 ) ) ( not ( = ?auto_153286 ?auto_153291 ) ) ( not ( = ?auto_153287 ?auto_153294 ) ) ( not ( = ?auto_153287 ?auto_153291 ) ) ( not ( = ?auto_153288 ?auto_153294 ) ) ( not ( = ?auto_153288 ?auto_153291 ) ) ( ON ?auto_153286 ?auto_153293 ) ( not ( = ?auto_153286 ?auto_153293 ) ) ( not ( = ?auto_153287 ?auto_153293 ) ) ( not ( = ?auto_153288 ?auto_153293 ) ) ( not ( = ?auto_153289 ?auto_153293 ) ) ( not ( = ?auto_153290 ?auto_153293 ) ) ( not ( = ?auto_153292 ?auto_153293 ) ) ( not ( = ?auto_153294 ?auto_153293 ) ) ( not ( = ?auto_153291 ?auto_153293 ) ) ( ON ?auto_153287 ?auto_153286 ) ( ON-TABLE ?auto_153293 ) ( ON ?auto_153288 ?auto_153287 ) ( ON ?auto_153289 ?auto_153288 ) ( ON ?auto_153290 ?auto_153289 ) ( ON ?auto_153292 ?auto_153290 ) ( CLEAR ?auto_153294 ) ( ON ?auto_153291 ?auto_153292 ) ( CLEAR ?auto_153291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153293 ?auto_153286 ?auto_153287 ?auto_153288 ?auto_153289 ?auto_153290 ?auto_153292 )
      ( MAKE-5PILE ?auto_153286 ?auto_153287 ?auto_153288 ?auto_153289 ?auto_153290 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153295 - BLOCK
      ?auto_153296 - BLOCK
      ?auto_153297 - BLOCK
      ?auto_153298 - BLOCK
      ?auto_153299 - BLOCK
    )
    :vars
    (
      ?auto_153301 - BLOCK
      ?auto_153302 - BLOCK
      ?auto_153303 - BLOCK
      ?auto_153300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153295 ?auto_153296 ) ) ( not ( = ?auto_153295 ?auto_153297 ) ) ( not ( = ?auto_153295 ?auto_153298 ) ) ( not ( = ?auto_153295 ?auto_153299 ) ) ( not ( = ?auto_153296 ?auto_153297 ) ) ( not ( = ?auto_153296 ?auto_153298 ) ) ( not ( = ?auto_153296 ?auto_153299 ) ) ( not ( = ?auto_153297 ?auto_153298 ) ) ( not ( = ?auto_153297 ?auto_153299 ) ) ( not ( = ?auto_153298 ?auto_153299 ) ) ( not ( = ?auto_153295 ?auto_153301 ) ) ( not ( = ?auto_153296 ?auto_153301 ) ) ( not ( = ?auto_153297 ?auto_153301 ) ) ( not ( = ?auto_153298 ?auto_153301 ) ) ( not ( = ?auto_153299 ?auto_153301 ) ) ( not ( = ?auto_153302 ?auto_153303 ) ) ( not ( = ?auto_153302 ?auto_153301 ) ) ( not ( = ?auto_153302 ?auto_153299 ) ) ( not ( = ?auto_153302 ?auto_153298 ) ) ( not ( = ?auto_153303 ?auto_153301 ) ) ( not ( = ?auto_153303 ?auto_153299 ) ) ( not ( = ?auto_153303 ?auto_153298 ) ) ( not ( = ?auto_153295 ?auto_153302 ) ) ( not ( = ?auto_153295 ?auto_153303 ) ) ( not ( = ?auto_153296 ?auto_153302 ) ) ( not ( = ?auto_153296 ?auto_153303 ) ) ( not ( = ?auto_153297 ?auto_153302 ) ) ( not ( = ?auto_153297 ?auto_153303 ) ) ( ON ?auto_153295 ?auto_153300 ) ( not ( = ?auto_153295 ?auto_153300 ) ) ( not ( = ?auto_153296 ?auto_153300 ) ) ( not ( = ?auto_153297 ?auto_153300 ) ) ( not ( = ?auto_153298 ?auto_153300 ) ) ( not ( = ?auto_153299 ?auto_153300 ) ) ( not ( = ?auto_153301 ?auto_153300 ) ) ( not ( = ?auto_153302 ?auto_153300 ) ) ( not ( = ?auto_153303 ?auto_153300 ) ) ( ON ?auto_153296 ?auto_153295 ) ( ON-TABLE ?auto_153300 ) ( ON ?auto_153297 ?auto_153296 ) ( ON ?auto_153298 ?auto_153297 ) ( ON ?auto_153299 ?auto_153298 ) ( ON ?auto_153301 ?auto_153299 ) ( ON ?auto_153303 ?auto_153301 ) ( CLEAR ?auto_153303 ) ( HOLDING ?auto_153302 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153302 )
      ( MAKE-5PILE ?auto_153295 ?auto_153296 ?auto_153297 ?auto_153298 ?auto_153299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_153304 - BLOCK
      ?auto_153305 - BLOCK
      ?auto_153306 - BLOCK
      ?auto_153307 - BLOCK
      ?auto_153308 - BLOCK
    )
    :vars
    (
      ?auto_153310 - BLOCK
      ?auto_153311 - BLOCK
      ?auto_153312 - BLOCK
      ?auto_153309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153304 ?auto_153305 ) ) ( not ( = ?auto_153304 ?auto_153306 ) ) ( not ( = ?auto_153304 ?auto_153307 ) ) ( not ( = ?auto_153304 ?auto_153308 ) ) ( not ( = ?auto_153305 ?auto_153306 ) ) ( not ( = ?auto_153305 ?auto_153307 ) ) ( not ( = ?auto_153305 ?auto_153308 ) ) ( not ( = ?auto_153306 ?auto_153307 ) ) ( not ( = ?auto_153306 ?auto_153308 ) ) ( not ( = ?auto_153307 ?auto_153308 ) ) ( not ( = ?auto_153304 ?auto_153310 ) ) ( not ( = ?auto_153305 ?auto_153310 ) ) ( not ( = ?auto_153306 ?auto_153310 ) ) ( not ( = ?auto_153307 ?auto_153310 ) ) ( not ( = ?auto_153308 ?auto_153310 ) ) ( not ( = ?auto_153311 ?auto_153312 ) ) ( not ( = ?auto_153311 ?auto_153310 ) ) ( not ( = ?auto_153311 ?auto_153308 ) ) ( not ( = ?auto_153311 ?auto_153307 ) ) ( not ( = ?auto_153312 ?auto_153310 ) ) ( not ( = ?auto_153312 ?auto_153308 ) ) ( not ( = ?auto_153312 ?auto_153307 ) ) ( not ( = ?auto_153304 ?auto_153311 ) ) ( not ( = ?auto_153304 ?auto_153312 ) ) ( not ( = ?auto_153305 ?auto_153311 ) ) ( not ( = ?auto_153305 ?auto_153312 ) ) ( not ( = ?auto_153306 ?auto_153311 ) ) ( not ( = ?auto_153306 ?auto_153312 ) ) ( ON ?auto_153304 ?auto_153309 ) ( not ( = ?auto_153304 ?auto_153309 ) ) ( not ( = ?auto_153305 ?auto_153309 ) ) ( not ( = ?auto_153306 ?auto_153309 ) ) ( not ( = ?auto_153307 ?auto_153309 ) ) ( not ( = ?auto_153308 ?auto_153309 ) ) ( not ( = ?auto_153310 ?auto_153309 ) ) ( not ( = ?auto_153311 ?auto_153309 ) ) ( not ( = ?auto_153312 ?auto_153309 ) ) ( ON ?auto_153305 ?auto_153304 ) ( ON-TABLE ?auto_153309 ) ( ON ?auto_153306 ?auto_153305 ) ( ON ?auto_153307 ?auto_153306 ) ( ON ?auto_153308 ?auto_153307 ) ( ON ?auto_153310 ?auto_153308 ) ( ON ?auto_153312 ?auto_153310 ) ( ON ?auto_153311 ?auto_153312 ) ( CLEAR ?auto_153311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153309 ?auto_153304 ?auto_153305 ?auto_153306 ?auto_153307 ?auto_153308 ?auto_153310 ?auto_153312 )
      ( MAKE-5PILE ?auto_153304 ?auto_153305 ?auto_153306 ?auto_153307 ?auto_153308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153328 - BLOCK
      ?auto_153329 - BLOCK
    )
    :vars
    (
      ?auto_153332 - BLOCK
      ?auto_153330 - BLOCK
      ?auto_153331 - BLOCK
      ?auto_153335 - BLOCK
      ?auto_153333 - BLOCK
      ?auto_153334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153332 ?auto_153329 ) ( ON-TABLE ?auto_153328 ) ( ON ?auto_153329 ?auto_153328 ) ( not ( = ?auto_153328 ?auto_153329 ) ) ( not ( = ?auto_153328 ?auto_153332 ) ) ( not ( = ?auto_153329 ?auto_153332 ) ) ( not ( = ?auto_153328 ?auto_153330 ) ) ( not ( = ?auto_153328 ?auto_153331 ) ) ( not ( = ?auto_153329 ?auto_153330 ) ) ( not ( = ?auto_153329 ?auto_153331 ) ) ( not ( = ?auto_153332 ?auto_153330 ) ) ( not ( = ?auto_153332 ?auto_153331 ) ) ( not ( = ?auto_153330 ?auto_153331 ) ) ( ON ?auto_153330 ?auto_153332 ) ( CLEAR ?auto_153330 ) ( HOLDING ?auto_153331 ) ( CLEAR ?auto_153335 ) ( ON-TABLE ?auto_153333 ) ( ON ?auto_153334 ?auto_153333 ) ( ON ?auto_153335 ?auto_153334 ) ( not ( = ?auto_153333 ?auto_153334 ) ) ( not ( = ?auto_153333 ?auto_153335 ) ) ( not ( = ?auto_153333 ?auto_153331 ) ) ( not ( = ?auto_153334 ?auto_153335 ) ) ( not ( = ?auto_153334 ?auto_153331 ) ) ( not ( = ?auto_153335 ?auto_153331 ) ) ( not ( = ?auto_153328 ?auto_153335 ) ) ( not ( = ?auto_153328 ?auto_153333 ) ) ( not ( = ?auto_153328 ?auto_153334 ) ) ( not ( = ?auto_153329 ?auto_153335 ) ) ( not ( = ?auto_153329 ?auto_153333 ) ) ( not ( = ?auto_153329 ?auto_153334 ) ) ( not ( = ?auto_153332 ?auto_153335 ) ) ( not ( = ?auto_153332 ?auto_153333 ) ) ( not ( = ?auto_153332 ?auto_153334 ) ) ( not ( = ?auto_153330 ?auto_153335 ) ) ( not ( = ?auto_153330 ?auto_153333 ) ) ( not ( = ?auto_153330 ?auto_153334 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153333 ?auto_153334 ?auto_153335 ?auto_153331 )
      ( MAKE-2PILE ?auto_153328 ?auto_153329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153336 - BLOCK
      ?auto_153337 - BLOCK
    )
    :vars
    (
      ?auto_153342 - BLOCK
      ?auto_153340 - BLOCK
      ?auto_153338 - BLOCK
      ?auto_153341 - BLOCK
      ?auto_153343 - BLOCK
      ?auto_153339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153342 ?auto_153337 ) ( ON-TABLE ?auto_153336 ) ( ON ?auto_153337 ?auto_153336 ) ( not ( = ?auto_153336 ?auto_153337 ) ) ( not ( = ?auto_153336 ?auto_153342 ) ) ( not ( = ?auto_153337 ?auto_153342 ) ) ( not ( = ?auto_153336 ?auto_153340 ) ) ( not ( = ?auto_153336 ?auto_153338 ) ) ( not ( = ?auto_153337 ?auto_153340 ) ) ( not ( = ?auto_153337 ?auto_153338 ) ) ( not ( = ?auto_153342 ?auto_153340 ) ) ( not ( = ?auto_153342 ?auto_153338 ) ) ( not ( = ?auto_153340 ?auto_153338 ) ) ( ON ?auto_153340 ?auto_153342 ) ( CLEAR ?auto_153341 ) ( ON-TABLE ?auto_153343 ) ( ON ?auto_153339 ?auto_153343 ) ( ON ?auto_153341 ?auto_153339 ) ( not ( = ?auto_153343 ?auto_153339 ) ) ( not ( = ?auto_153343 ?auto_153341 ) ) ( not ( = ?auto_153343 ?auto_153338 ) ) ( not ( = ?auto_153339 ?auto_153341 ) ) ( not ( = ?auto_153339 ?auto_153338 ) ) ( not ( = ?auto_153341 ?auto_153338 ) ) ( not ( = ?auto_153336 ?auto_153341 ) ) ( not ( = ?auto_153336 ?auto_153343 ) ) ( not ( = ?auto_153336 ?auto_153339 ) ) ( not ( = ?auto_153337 ?auto_153341 ) ) ( not ( = ?auto_153337 ?auto_153343 ) ) ( not ( = ?auto_153337 ?auto_153339 ) ) ( not ( = ?auto_153342 ?auto_153341 ) ) ( not ( = ?auto_153342 ?auto_153343 ) ) ( not ( = ?auto_153342 ?auto_153339 ) ) ( not ( = ?auto_153340 ?auto_153341 ) ) ( not ( = ?auto_153340 ?auto_153343 ) ) ( not ( = ?auto_153340 ?auto_153339 ) ) ( ON ?auto_153338 ?auto_153340 ) ( CLEAR ?auto_153338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153336 ?auto_153337 ?auto_153342 ?auto_153340 )
      ( MAKE-2PILE ?auto_153336 ?auto_153337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153344 - BLOCK
      ?auto_153345 - BLOCK
    )
    :vars
    (
      ?auto_153350 - BLOCK
      ?auto_153351 - BLOCK
      ?auto_153347 - BLOCK
      ?auto_153346 - BLOCK
      ?auto_153349 - BLOCK
      ?auto_153348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153350 ?auto_153345 ) ( ON-TABLE ?auto_153344 ) ( ON ?auto_153345 ?auto_153344 ) ( not ( = ?auto_153344 ?auto_153345 ) ) ( not ( = ?auto_153344 ?auto_153350 ) ) ( not ( = ?auto_153345 ?auto_153350 ) ) ( not ( = ?auto_153344 ?auto_153351 ) ) ( not ( = ?auto_153344 ?auto_153347 ) ) ( not ( = ?auto_153345 ?auto_153351 ) ) ( not ( = ?auto_153345 ?auto_153347 ) ) ( not ( = ?auto_153350 ?auto_153351 ) ) ( not ( = ?auto_153350 ?auto_153347 ) ) ( not ( = ?auto_153351 ?auto_153347 ) ) ( ON ?auto_153351 ?auto_153350 ) ( ON-TABLE ?auto_153346 ) ( ON ?auto_153349 ?auto_153346 ) ( not ( = ?auto_153346 ?auto_153349 ) ) ( not ( = ?auto_153346 ?auto_153348 ) ) ( not ( = ?auto_153346 ?auto_153347 ) ) ( not ( = ?auto_153349 ?auto_153348 ) ) ( not ( = ?auto_153349 ?auto_153347 ) ) ( not ( = ?auto_153348 ?auto_153347 ) ) ( not ( = ?auto_153344 ?auto_153348 ) ) ( not ( = ?auto_153344 ?auto_153346 ) ) ( not ( = ?auto_153344 ?auto_153349 ) ) ( not ( = ?auto_153345 ?auto_153348 ) ) ( not ( = ?auto_153345 ?auto_153346 ) ) ( not ( = ?auto_153345 ?auto_153349 ) ) ( not ( = ?auto_153350 ?auto_153348 ) ) ( not ( = ?auto_153350 ?auto_153346 ) ) ( not ( = ?auto_153350 ?auto_153349 ) ) ( not ( = ?auto_153351 ?auto_153348 ) ) ( not ( = ?auto_153351 ?auto_153346 ) ) ( not ( = ?auto_153351 ?auto_153349 ) ) ( ON ?auto_153347 ?auto_153351 ) ( CLEAR ?auto_153347 ) ( HOLDING ?auto_153348 ) ( CLEAR ?auto_153349 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153346 ?auto_153349 ?auto_153348 )
      ( MAKE-2PILE ?auto_153344 ?auto_153345 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153352 - BLOCK
      ?auto_153353 - BLOCK
    )
    :vars
    (
      ?auto_153357 - BLOCK
      ?auto_153356 - BLOCK
      ?auto_153358 - BLOCK
      ?auto_153359 - BLOCK
      ?auto_153355 - BLOCK
      ?auto_153354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153357 ?auto_153353 ) ( ON-TABLE ?auto_153352 ) ( ON ?auto_153353 ?auto_153352 ) ( not ( = ?auto_153352 ?auto_153353 ) ) ( not ( = ?auto_153352 ?auto_153357 ) ) ( not ( = ?auto_153353 ?auto_153357 ) ) ( not ( = ?auto_153352 ?auto_153356 ) ) ( not ( = ?auto_153352 ?auto_153358 ) ) ( not ( = ?auto_153353 ?auto_153356 ) ) ( not ( = ?auto_153353 ?auto_153358 ) ) ( not ( = ?auto_153357 ?auto_153356 ) ) ( not ( = ?auto_153357 ?auto_153358 ) ) ( not ( = ?auto_153356 ?auto_153358 ) ) ( ON ?auto_153356 ?auto_153357 ) ( ON-TABLE ?auto_153359 ) ( ON ?auto_153355 ?auto_153359 ) ( not ( = ?auto_153359 ?auto_153355 ) ) ( not ( = ?auto_153359 ?auto_153354 ) ) ( not ( = ?auto_153359 ?auto_153358 ) ) ( not ( = ?auto_153355 ?auto_153354 ) ) ( not ( = ?auto_153355 ?auto_153358 ) ) ( not ( = ?auto_153354 ?auto_153358 ) ) ( not ( = ?auto_153352 ?auto_153354 ) ) ( not ( = ?auto_153352 ?auto_153359 ) ) ( not ( = ?auto_153352 ?auto_153355 ) ) ( not ( = ?auto_153353 ?auto_153354 ) ) ( not ( = ?auto_153353 ?auto_153359 ) ) ( not ( = ?auto_153353 ?auto_153355 ) ) ( not ( = ?auto_153357 ?auto_153354 ) ) ( not ( = ?auto_153357 ?auto_153359 ) ) ( not ( = ?auto_153357 ?auto_153355 ) ) ( not ( = ?auto_153356 ?auto_153354 ) ) ( not ( = ?auto_153356 ?auto_153359 ) ) ( not ( = ?auto_153356 ?auto_153355 ) ) ( ON ?auto_153358 ?auto_153356 ) ( CLEAR ?auto_153355 ) ( ON ?auto_153354 ?auto_153358 ) ( CLEAR ?auto_153354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153352 ?auto_153353 ?auto_153357 ?auto_153356 ?auto_153358 )
      ( MAKE-2PILE ?auto_153352 ?auto_153353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153360 - BLOCK
      ?auto_153361 - BLOCK
    )
    :vars
    (
      ?auto_153364 - BLOCK
      ?auto_153362 - BLOCK
      ?auto_153366 - BLOCK
      ?auto_153367 - BLOCK
      ?auto_153363 - BLOCK
      ?auto_153365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153364 ?auto_153361 ) ( ON-TABLE ?auto_153360 ) ( ON ?auto_153361 ?auto_153360 ) ( not ( = ?auto_153360 ?auto_153361 ) ) ( not ( = ?auto_153360 ?auto_153364 ) ) ( not ( = ?auto_153361 ?auto_153364 ) ) ( not ( = ?auto_153360 ?auto_153362 ) ) ( not ( = ?auto_153360 ?auto_153366 ) ) ( not ( = ?auto_153361 ?auto_153362 ) ) ( not ( = ?auto_153361 ?auto_153366 ) ) ( not ( = ?auto_153364 ?auto_153362 ) ) ( not ( = ?auto_153364 ?auto_153366 ) ) ( not ( = ?auto_153362 ?auto_153366 ) ) ( ON ?auto_153362 ?auto_153364 ) ( ON-TABLE ?auto_153367 ) ( not ( = ?auto_153367 ?auto_153363 ) ) ( not ( = ?auto_153367 ?auto_153365 ) ) ( not ( = ?auto_153367 ?auto_153366 ) ) ( not ( = ?auto_153363 ?auto_153365 ) ) ( not ( = ?auto_153363 ?auto_153366 ) ) ( not ( = ?auto_153365 ?auto_153366 ) ) ( not ( = ?auto_153360 ?auto_153365 ) ) ( not ( = ?auto_153360 ?auto_153367 ) ) ( not ( = ?auto_153360 ?auto_153363 ) ) ( not ( = ?auto_153361 ?auto_153365 ) ) ( not ( = ?auto_153361 ?auto_153367 ) ) ( not ( = ?auto_153361 ?auto_153363 ) ) ( not ( = ?auto_153364 ?auto_153365 ) ) ( not ( = ?auto_153364 ?auto_153367 ) ) ( not ( = ?auto_153364 ?auto_153363 ) ) ( not ( = ?auto_153362 ?auto_153365 ) ) ( not ( = ?auto_153362 ?auto_153367 ) ) ( not ( = ?auto_153362 ?auto_153363 ) ) ( ON ?auto_153366 ?auto_153362 ) ( ON ?auto_153365 ?auto_153366 ) ( CLEAR ?auto_153365 ) ( HOLDING ?auto_153363 ) ( CLEAR ?auto_153367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153367 ?auto_153363 )
      ( MAKE-2PILE ?auto_153360 ?auto_153361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153368 - BLOCK
      ?auto_153369 - BLOCK
    )
    :vars
    (
      ?auto_153370 - BLOCK
      ?auto_153373 - BLOCK
      ?auto_153371 - BLOCK
      ?auto_153372 - BLOCK
      ?auto_153375 - BLOCK
      ?auto_153374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153370 ?auto_153369 ) ( ON-TABLE ?auto_153368 ) ( ON ?auto_153369 ?auto_153368 ) ( not ( = ?auto_153368 ?auto_153369 ) ) ( not ( = ?auto_153368 ?auto_153370 ) ) ( not ( = ?auto_153369 ?auto_153370 ) ) ( not ( = ?auto_153368 ?auto_153373 ) ) ( not ( = ?auto_153368 ?auto_153371 ) ) ( not ( = ?auto_153369 ?auto_153373 ) ) ( not ( = ?auto_153369 ?auto_153371 ) ) ( not ( = ?auto_153370 ?auto_153373 ) ) ( not ( = ?auto_153370 ?auto_153371 ) ) ( not ( = ?auto_153373 ?auto_153371 ) ) ( ON ?auto_153373 ?auto_153370 ) ( ON-TABLE ?auto_153372 ) ( not ( = ?auto_153372 ?auto_153375 ) ) ( not ( = ?auto_153372 ?auto_153374 ) ) ( not ( = ?auto_153372 ?auto_153371 ) ) ( not ( = ?auto_153375 ?auto_153374 ) ) ( not ( = ?auto_153375 ?auto_153371 ) ) ( not ( = ?auto_153374 ?auto_153371 ) ) ( not ( = ?auto_153368 ?auto_153374 ) ) ( not ( = ?auto_153368 ?auto_153372 ) ) ( not ( = ?auto_153368 ?auto_153375 ) ) ( not ( = ?auto_153369 ?auto_153374 ) ) ( not ( = ?auto_153369 ?auto_153372 ) ) ( not ( = ?auto_153369 ?auto_153375 ) ) ( not ( = ?auto_153370 ?auto_153374 ) ) ( not ( = ?auto_153370 ?auto_153372 ) ) ( not ( = ?auto_153370 ?auto_153375 ) ) ( not ( = ?auto_153373 ?auto_153374 ) ) ( not ( = ?auto_153373 ?auto_153372 ) ) ( not ( = ?auto_153373 ?auto_153375 ) ) ( ON ?auto_153371 ?auto_153373 ) ( ON ?auto_153374 ?auto_153371 ) ( CLEAR ?auto_153372 ) ( ON ?auto_153375 ?auto_153374 ) ( CLEAR ?auto_153375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153368 ?auto_153369 ?auto_153370 ?auto_153373 ?auto_153371 ?auto_153374 )
      ( MAKE-2PILE ?auto_153368 ?auto_153369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153376 - BLOCK
      ?auto_153377 - BLOCK
    )
    :vars
    (
      ?auto_153381 - BLOCK
      ?auto_153380 - BLOCK
      ?auto_153383 - BLOCK
      ?auto_153382 - BLOCK
      ?auto_153379 - BLOCK
      ?auto_153378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153381 ?auto_153377 ) ( ON-TABLE ?auto_153376 ) ( ON ?auto_153377 ?auto_153376 ) ( not ( = ?auto_153376 ?auto_153377 ) ) ( not ( = ?auto_153376 ?auto_153381 ) ) ( not ( = ?auto_153377 ?auto_153381 ) ) ( not ( = ?auto_153376 ?auto_153380 ) ) ( not ( = ?auto_153376 ?auto_153383 ) ) ( not ( = ?auto_153377 ?auto_153380 ) ) ( not ( = ?auto_153377 ?auto_153383 ) ) ( not ( = ?auto_153381 ?auto_153380 ) ) ( not ( = ?auto_153381 ?auto_153383 ) ) ( not ( = ?auto_153380 ?auto_153383 ) ) ( ON ?auto_153380 ?auto_153381 ) ( not ( = ?auto_153382 ?auto_153379 ) ) ( not ( = ?auto_153382 ?auto_153378 ) ) ( not ( = ?auto_153382 ?auto_153383 ) ) ( not ( = ?auto_153379 ?auto_153378 ) ) ( not ( = ?auto_153379 ?auto_153383 ) ) ( not ( = ?auto_153378 ?auto_153383 ) ) ( not ( = ?auto_153376 ?auto_153378 ) ) ( not ( = ?auto_153376 ?auto_153382 ) ) ( not ( = ?auto_153376 ?auto_153379 ) ) ( not ( = ?auto_153377 ?auto_153378 ) ) ( not ( = ?auto_153377 ?auto_153382 ) ) ( not ( = ?auto_153377 ?auto_153379 ) ) ( not ( = ?auto_153381 ?auto_153378 ) ) ( not ( = ?auto_153381 ?auto_153382 ) ) ( not ( = ?auto_153381 ?auto_153379 ) ) ( not ( = ?auto_153380 ?auto_153378 ) ) ( not ( = ?auto_153380 ?auto_153382 ) ) ( not ( = ?auto_153380 ?auto_153379 ) ) ( ON ?auto_153383 ?auto_153380 ) ( ON ?auto_153378 ?auto_153383 ) ( ON ?auto_153379 ?auto_153378 ) ( CLEAR ?auto_153379 ) ( HOLDING ?auto_153382 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153382 )
      ( MAKE-2PILE ?auto_153376 ?auto_153377 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153394 - BLOCK
      ?auto_153395 - BLOCK
    )
    :vars
    (
      ?auto_153400 - BLOCK
      ?auto_153397 - BLOCK
      ?auto_153399 - BLOCK
      ?auto_153396 - BLOCK
      ?auto_153398 - BLOCK
      ?auto_153401 - BLOCK
      ?auto_153402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153400 ?auto_153395 ) ( ON-TABLE ?auto_153394 ) ( ON ?auto_153395 ?auto_153394 ) ( not ( = ?auto_153394 ?auto_153395 ) ) ( not ( = ?auto_153394 ?auto_153400 ) ) ( not ( = ?auto_153395 ?auto_153400 ) ) ( not ( = ?auto_153394 ?auto_153397 ) ) ( not ( = ?auto_153394 ?auto_153399 ) ) ( not ( = ?auto_153395 ?auto_153397 ) ) ( not ( = ?auto_153395 ?auto_153399 ) ) ( not ( = ?auto_153400 ?auto_153397 ) ) ( not ( = ?auto_153400 ?auto_153399 ) ) ( not ( = ?auto_153397 ?auto_153399 ) ) ( ON ?auto_153397 ?auto_153400 ) ( not ( = ?auto_153396 ?auto_153398 ) ) ( not ( = ?auto_153396 ?auto_153401 ) ) ( not ( = ?auto_153396 ?auto_153399 ) ) ( not ( = ?auto_153398 ?auto_153401 ) ) ( not ( = ?auto_153398 ?auto_153399 ) ) ( not ( = ?auto_153401 ?auto_153399 ) ) ( not ( = ?auto_153394 ?auto_153401 ) ) ( not ( = ?auto_153394 ?auto_153396 ) ) ( not ( = ?auto_153394 ?auto_153398 ) ) ( not ( = ?auto_153395 ?auto_153401 ) ) ( not ( = ?auto_153395 ?auto_153396 ) ) ( not ( = ?auto_153395 ?auto_153398 ) ) ( not ( = ?auto_153400 ?auto_153401 ) ) ( not ( = ?auto_153400 ?auto_153396 ) ) ( not ( = ?auto_153400 ?auto_153398 ) ) ( not ( = ?auto_153397 ?auto_153401 ) ) ( not ( = ?auto_153397 ?auto_153396 ) ) ( not ( = ?auto_153397 ?auto_153398 ) ) ( ON ?auto_153399 ?auto_153397 ) ( ON ?auto_153401 ?auto_153399 ) ( ON ?auto_153398 ?auto_153401 ) ( CLEAR ?auto_153398 ) ( ON ?auto_153396 ?auto_153402 ) ( CLEAR ?auto_153396 ) ( HAND-EMPTY ) ( not ( = ?auto_153394 ?auto_153402 ) ) ( not ( = ?auto_153395 ?auto_153402 ) ) ( not ( = ?auto_153400 ?auto_153402 ) ) ( not ( = ?auto_153397 ?auto_153402 ) ) ( not ( = ?auto_153399 ?auto_153402 ) ) ( not ( = ?auto_153396 ?auto_153402 ) ) ( not ( = ?auto_153398 ?auto_153402 ) ) ( not ( = ?auto_153401 ?auto_153402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153396 ?auto_153402 )
      ( MAKE-2PILE ?auto_153394 ?auto_153395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153403 - BLOCK
      ?auto_153404 - BLOCK
    )
    :vars
    (
      ?auto_153411 - BLOCK
      ?auto_153407 - BLOCK
      ?auto_153408 - BLOCK
      ?auto_153406 - BLOCK
      ?auto_153405 - BLOCK
      ?auto_153410 - BLOCK
      ?auto_153409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153411 ?auto_153404 ) ( ON-TABLE ?auto_153403 ) ( ON ?auto_153404 ?auto_153403 ) ( not ( = ?auto_153403 ?auto_153404 ) ) ( not ( = ?auto_153403 ?auto_153411 ) ) ( not ( = ?auto_153404 ?auto_153411 ) ) ( not ( = ?auto_153403 ?auto_153407 ) ) ( not ( = ?auto_153403 ?auto_153408 ) ) ( not ( = ?auto_153404 ?auto_153407 ) ) ( not ( = ?auto_153404 ?auto_153408 ) ) ( not ( = ?auto_153411 ?auto_153407 ) ) ( not ( = ?auto_153411 ?auto_153408 ) ) ( not ( = ?auto_153407 ?auto_153408 ) ) ( ON ?auto_153407 ?auto_153411 ) ( not ( = ?auto_153406 ?auto_153405 ) ) ( not ( = ?auto_153406 ?auto_153410 ) ) ( not ( = ?auto_153406 ?auto_153408 ) ) ( not ( = ?auto_153405 ?auto_153410 ) ) ( not ( = ?auto_153405 ?auto_153408 ) ) ( not ( = ?auto_153410 ?auto_153408 ) ) ( not ( = ?auto_153403 ?auto_153410 ) ) ( not ( = ?auto_153403 ?auto_153406 ) ) ( not ( = ?auto_153403 ?auto_153405 ) ) ( not ( = ?auto_153404 ?auto_153410 ) ) ( not ( = ?auto_153404 ?auto_153406 ) ) ( not ( = ?auto_153404 ?auto_153405 ) ) ( not ( = ?auto_153411 ?auto_153410 ) ) ( not ( = ?auto_153411 ?auto_153406 ) ) ( not ( = ?auto_153411 ?auto_153405 ) ) ( not ( = ?auto_153407 ?auto_153410 ) ) ( not ( = ?auto_153407 ?auto_153406 ) ) ( not ( = ?auto_153407 ?auto_153405 ) ) ( ON ?auto_153408 ?auto_153407 ) ( ON ?auto_153410 ?auto_153408 ) ( ON ?auto_153406 ?auto_153409 ) ( CLEAR ?auto_153406 ) ( not ( = ?auto_153403 ?auto_153409 ) ) ( not ( = ?auto_153404 ?auto_153409 ) ) ( not ( = ?auto_153411 ?auto_153409 ) ) ( not ( = ?auto_153407 ?auto_153409 ) ) ( not ( = ?auto_153408 ?auto_153409 ) ) ( not ( = ?auto_153406 ?auto_153409 ) ) ( not ( = ?auto_153405 ?auto_153409 ) ) ( not ( = ?auto_153410 ?auto_153409 ) ) ( HOLDING ?auto_153405 ) ( CLEAR ?auto_153410 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153403 ?auto_153404 ?auto_153411 ?auto_153407 ?auto_153408 ?auto_153410 ?auto_153405 )
      ( MAKE-2PILE ?auto_153403 ?auto_153404 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153412 - BLOCK
      ?auto_153413 - BLOCK
    )
    :vars
    (
      ?auto_153419 - BLOCK
      ?auto_153415 - BLOCK
      ?auto_153416 - BLOCK
      ?auto_153414 - BLOCK
      ?auto_153420 - BLOCK
      ?auto_153418 - BLOCK
      ?auto_153417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153419 ?auto_153413 ) ( ON-TABLE ?auto_153412 ) ( ON ?auto_153413 ?auto_153412 ) ( not ( = ?auto_153412 ?auto_153413 ) ) ( not ( = ?auto_153412 ?auto_153419 ) ) ( not ( = ?auto_153413 ?auto_153419 ) ) ( not ( = ?auto_153412 ?auto_153415 ) ) ( not ( = ?auto_153412 ?auto_153416 ) ) ( not ( = ?auto_153413 ?auto_153415 ) ) ( not ( = ?auto_153413 ?auto_153416 ) ) ( not ( = ?auto_153419 ?auto_153415 ) ) ( not ( = ?auto_153419 ?auto_153416 ) ) ( not ( = ?auto_153415 ?auto_153416 ) ) ( ON ?auto_153415 ?auto_153419 ) ( not ( = ?auto_153414 ?auto_153420 ) ) ( not ( = ?auto_153414 ?auto_153418 ) ) ( not ( = ?auto_153414 ?auto_153416 ) ) ( not ( = ?auto_153420 ?auto_153418 ) ) ( not ( = ?auto_153420 ?auto_153416 ) ) ( not ( = ?auto_153418 ?auto_153416 ) ) ( not ( = ?auto_153412 ?auto_153418 ) ) ( not ( = ?auto_153412 ?auto_153414 ) ) ( not ( = ?auto_153412 ?auto_153420 ) ) ( not ( = ?auto_153413 ?auto_153418 ) ) ( not ( = ?auto_153413 ?auto_153414 ) ) ( not ( = ?auto_153413 ?auto_153420 ) ) ( not ( = ?auto_153419 ?auto_153418 ) ) ( not ( = ?auto_153419 ?auto_153414 ) ) ( not ( = ?auto_153419 ?auto_153420 ) ) ( not ( = ?auto_153415 ?auto_153418 ) ) ( not ( = ?auto_153415 ?auto_153414 ) ) ( not ( = ?auto_153415 ?auto_153420 ) ) ( ON ?auto_153416 ?auto_153415 ) ( ON ?auto_153418 ?auto_153416 ) ( ON ?auto_153414 ?auto_153417 ) ( not ( = ?auto_153412 ?auto_153417 ) ) ( not ( = ?auto_153413 ?auto_153417 ) ) ( not ( = ?auto_153419 ?auto_153417 ) ) ( not ( = ?auto_153415 ?auto_153417 ) ) ( not ( = ?auto_153416 ?auto_153417 ) ) ( not ( = ?auto_153414 ?auto_153417 ) ) ( not ( = ?auto_153420 ?auto_153417 ) ) ( not ( = ?auto_153418 ?auto_153417 ) ) ( CLEAR ?auto_153418 ) ( ON ?auto_153420 ?auto_153414 ) ( CLEAR ?auto_153420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153417 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153417 ?auto_153414 )
      ( MAKE-2PILE ?auto_153412 ?auto_153413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153421 - BLOCK
      ?auto_153422 - BLOCK
    )
    :vars
    (
      ?auto_153424 - BLOCK
      ?auto_153427 - BLOCK
      ?auto_153425 - BLOCK
      ?auto_153423 - BLOCK
      ?auto_153429 - BLOCK
      ?auto_153428 - BLOCK
      ?auto_153426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153424 ?auto_153422 ) ( ON-TABLE ?auto_153421 ) ( ON ?auto_153422 ?auto_153421 ) ( not ( = ?auto_153421 ?auto_153422 ) ) ( not ( = ?auto_153421 ?auto_153424 ) ) ( not ( = ?auto_153422 ?auto_153424 ) ) ( not ( = ?auto_153421 ?auto_153427 ) ) ( not ( = ?auto_153421 ?auto_153425 ) ) ( not ( = ?auto_153422 ?auto_153427 ) ) ( not ( = ?auto_153422 ?auto_153425 ) ) ( not ( = ?auto_153424 ?auto_153427 ) ) ( not ( = ?auto_153424 ?auto_153425 ) ) ( not ( = ?auto_153427 ?auto_153425 ) ) ( ON ?auto_153427 ?auto_153424 ) ( not ( = ?auto_153423 ?auto_153429 ) ) ( not ( = ?auto_153423 ?auto_153428 ) ) ( not ( = ?auto_153423 ?auto_153425 ) ) ( not ( = ?auto_153429 ?auto_153428 ) ) ( not ( = ?auto_153429 ?auto_153425 ) ) ( not ( = ?auto_153428 ?auto_153425 ) ) ( not ( = ?auto_153421 ?auto_153428 ) ) ( not ( = ?auto_153421 ?auto_153423 ) ) ( not ( = ?auto_153421 ?auto_153429 ) ) ( not ( = ?auto_153422 ?auto_153428 ) ) ( not ( = ?auto_153422 ?auto_153423 ) ) ( not ( = ?auto_153422 ?auto_153429 ) ) ( not ( = ?auto_153424 ?auto_153428 ) ) ( not ( = ?auto_153424 ?auto_153423 ) ) ( not ( = ?auto_153424 ?auto_153429 ) ) ( not ( = ?auto_153427 ?auto_153428 ) ) ( not ( = ?auto_153427 ?auto_153423 ) ) ( not ( = ?auto_153427 ?auto_153429 ) ) ( ON ?auto_153425 ?auto_153427 ) ( ON ?auto_153423 ?auto_153426 ) ( not ( = ?auto_153421 ?auto_153426 ) ) ( not ( = ?auto_153422 ?auto_153426 ) ) ( not ( = ?auto_153424 ?auto_153426 ) ) ( not ( = ?auto_153427 ?auto_153426 ) ) ( not ( = ?auto_153425 ?auto_153426 ) ) ( not ( = ?auto_153423 ?auto_153426 ) ) ( not ( = ?auto_153429 ?auto_153426 ) ) ( not ( = ?auto_153428 ?auto_153426 ) ) ( ON ?auto_153429 ?auto_153423 ) ( CLEAR ?auto_153429 ) ( ON-TABLE ?auto_153426 ) ( HOLDING ?auto_153428 ) ( CLEAR ?auto_153425 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153421 ?auto_153422 ?auto_153424 ?auto_153427 ?auto_153425 ?auto_153428 )
      ( MAKE-2PILE ?auto_153421 ?auto_153422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_153430 - BLOCK
      ?auto_153431 - BLOCK
    )
    :vars
    (
      ?auto_153433 - BLOCK
      ?auto_153436 - BLOCK
      ?auto_153435 - BLOCK
      ?auto_153438 - BLOCK
      ?auto_153432 - BLOCK
      ?auto_153437 - BLOCK
      ?auto_153434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153433 ?auto_153431 ) ( ON-TABLE ?auto_153430 ) ( ON ?auto_153431 ?auto_153430 ) ( not ( = ?auto_153430 ?auto_153431 ) ) ( not ( = ?auto_153430 ?auto_153433 ) ) ( not ( = ?auto_153431 ?auto_153433 ) ) ( not ( = ?auto_153430 ?auto_153436 ) ) ( not ( = ?auto_153430 ?auto_153435 ) ) ( not ( = ?auto_153431 ?auto_153436 ) ) ( not ( = ?auto_153431 ?auto_153435 ) ) ( not ( = ?auto_153433 ?auto_153436 ) ) ( not ( = ?auto_153433 ?auto_153435 ) ) ( not ( = ?auto_153436 ?auto_153435 ) ) ( ON ?auto_153436 ?auto_153433 ) ( not ( = ?auto_153438 ?auto_153432 ) ) ( not ( = ?auto_153438 ?auto_153437 ) ) ( not ( = ?auto_153438 ?auto_153435 ) ) ( not ( = ?auto_153432 ?auto_153437 ) ) ( not ( = ?auto_153432 ?auto_153435 ) ) ( not ( = ?auto_153437 ?auto_153435 ) ) ( not ( = ?auto_153430 ?auto_153437 ) ) ( not ( = ?auto_153430 ?auto_153438 ) ) ( not ( = ?auto_153430 ?auto_153432 ) ) ( not ( = ?auto_153431 ?auto_153437 ) ) ( not ( = ?auto_153431 ?auto_153438 ) ) ( not ( = ?auto_153431 ?auto_153432 ) ) ( not ( = ?auto_153433 ?auto_153437 ) ) ( not ( = ?auto_153433 ?auto_153438 ) ) ( not ( = ?auto_153433 ?auto_153432 ) ) ( not ( = ?auto_153436 ?auto_153437 ) ) ( not ( = ?auto_153436 ?auto_153438 ) ) ( not ( = ?auto_153436 ?auto_153432 ) ) ( ON ?auto_153435 ?auto_153436 ) ( ON ?auto_153438 ?auto_153434 ) ( not ( = ?auto_153430 ?auto_153434 ) ) ( not ( = ?auto_153431 ?auto_153434 ) ) ( not ( = ?auto_153433 ?auto_153434 ) ) ( not ( = ?auto_153436 ?auto_153434 ) ) ( not ( = ?auto_153435 ?auto_153434 ) ) ( not ( = ?auto_153438 ?auto_153434 ) ) ( not ( = ?auto_153432 ?auto_153434 ) ) ( not ( = ?auto_153437 ?auto_153434 ) ) ( ON ?auto_153432 ?auto_153438 ) ( ON-TABLE ?auto_153434 ) ( CLEAR ?auto_153435 ) ( ON ?auto_153437 ?auto_153432 ) ( CLEAR ?auto_153437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153434 ?auto_153438 ?auto_153432 )
      ( MAKE-2PILE ?auto_153430 ?auto_153431 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153488 - BLOCK
      ?auto_153489 - BLOCK
      ?auto_153490 - BLOCK
      ?auto_153491 - BLOCK
      ?auto_153492 - BLOCK
      ?auto_153493 - BLOCK
    )
    :vars
    (
      ?auto_153494 - BLOCK
      ?auto_153495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153488 ) ( ON ?auto_153489 ?auto_153488 ) ( ON ?auto_153490 ?auto_153489 ) ( ON ?auto_153491 ?auto_153490 ) ( not ( = ?auto_153488 ?auto_153489 ) ) ( not ( = ?auto_153488 ?auto_153490 ) ) ( not ( = ?auto_153488 ?auto_153491 ) ) ( not ( = ?auto_153488 ?auto_153492 ) ) ( not ( = ?auto_153488 ?auto_153493 ) ) ( not ( = ?auto_153489 ?auto_153490 ) ) ( not ( = ?auto_153489 ?auto_153491 ) ) ( not ( = ?auto_153489 ?auto_153492 ) ) ( not ( = ?auto_153489 ?auto_153493 ) ) ( not ( = ?auto_153490 ?auto_153491 ) ) ( not ( = ?auto_153490 ?auto_153492 ) ) ( not ( = ?auto_153490 ?auto_153493 ) ) ( not ( = ?auto_153491 ?auto_153492 ) ) ( not ( = ?auto_153491 ?auto_153493 ) ) ( not ( = ?auto_153492 ?auto_153493 ) ) ( ON ?auto_153493 ?auto_153494 ) ( not ( = ?auto_153488 ?auto_153494 ) ) ( not ( = ?auto_153489 ?auto_153494 ) ) ( not ( = ?auto_153490 ?auto_153494 ) ) ( not ( = ?auto_153491 ?auto_153494 ) ) ( not ( = ?auto_153492 ?auto_153494 ) ) ( not ( = ?auto_153493 ?auto_153494 ) ) ( CLEAR ?auto_153491 ) ( ON ?auto_153492 ?auto_153493 ) ( CLEAR ?auto_153492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153495 ) ( ON ?auto_153494 ?auto_153495 ) ( not ( = ?auto_153495 ?auto_153494 ) ) ( not ( = ?auto_153495 ?auto_153493 ) ) ( not ( = ?auto_153495 ?auto_153492 ) ) ( not ( = ?auto_153488 ?auto_153495 ) ) ( not ( = ?auto_153489 ?auto_153495 ) ) ( not ( = ?auto_153490 ?auto_153495 ) ) ( not ( = ?auto_153491 ?auto_153495 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153495 ?auto_153494 ?auto_153493 )
      ( MAKE-6PILE ?auto_153488 ?auto_153489 ?auto_153490 ?auto_153491 ?auto_153492 ?auto_153493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153496 - BLOCK
      ?auto_153497 - BLOCK
      ?auto_153498 - BLOCK
      ?auto_153499 - BLOCK
      ?auto_153500 - BLOCK
      ?auto_153501 - BLOCK
    )
    :vars
    (
      ?auto_153503 - BLOCK
      ?auto_153502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153496 ) ( ON ?auto_153497 ?auto_153496 ) ( ON ?auto_153498 ?auto_153497 ) ( not ( = ?auto_153496 ?auto_153497 ) ) ( not ( = ?auto_153496 ?auto_153498 ) ) ( not ( = ?auto_153496 ?auto_153499 ) ) ( not ( = ?auto_153496 ?auto_153500 ) ) ( not ( = ?auto_153496 ?auto_153501 ) ) ( not ( = ?auto_153497 ?auto_153498 ) ) ( not ( = ?auto_153497 ?auto_153499 ) ) ( not ( = ?auto_153497 ?auto_153500 ) ) ( not ( = ?auto_153497 ?auto_153501 ) ) ( not ( = ?auto_153498 ?auto_153499 ) ) ( not ( = ?auto_153498 ?auto_153500 ) ) ( not ( = ?auto_153498 ?auto_153501 ) ) ( not ( = ?auto_153499 ?auto_153500 ) ) ( not ( = ?auto_153499 ?auto_153501 ) ) ( not ( = ?auto_153500 ?auto_153501 ) ) ( ON ?auto_153501 ?auto_153503 ) ( not ( = ?auto_153496 ?auto_153503 ) ) ( not ( = ?auto_153497 ?auto_153503 ) ) ( not ( = ?auto_153498 ?auto_153503 ) ) ( not ( = ?auto_153499 ?auto_153503 ) ) ( not ( = ?auto_153500 ?auto_153503 ) ) ( not ( = ?auto_153501 ?auto_153503 ) ) ( ON ?auto_153500 ?auto_153501 ) ( CLEAR ?auto_153500 ) ( ON-TABLE ?auto_153502 ) ( ON ?auto_153503 ?auto_153502 ) ( not ( = ?auto_153502 ?auto_153503 ) ) ( not ( = ?auto_153502 ?auto_153501 ) ) ( not ( = ?auto_153502 ?auto_153500 ) ) ( not ( = ?auto_153496 ?auto_153502 ) ) ( not ( = ?auto_153497 ?auto_153502 ) ) ( not ( = ?auto_153498 ?auto_153502 ) ) ( not ( = ?auto_153499 ?auto_153502 ) ) ( HOLDING ?auto_153499 ) ( CLEAR ?auto_153498 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153496 ?auto_153497 ?auto_153498 ?auto_153499 )
      ( MAKE-6PILE ?auto_153496 ?auto_153497 ?auto_153498 ?auto_153499 ?auto_153500 ?auto_153501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153504 - BLOCK
      ?auto_153505 - BLOCK
      ?auto_153506 - BLOCK
      ?auto_153507 - BLOCK
      ?auto_153508 - BLOCK
      ?auto_153509 - BLOCK
    )
    :vars
    (
      ?auto_153511 - BLOCK
      ?auto_153510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153504 ) ( ON ?auto_153505 ?auto_153504 ) ( ON ?auto_153506 ?auto_153505 ) ( not ( = ?auto_153504 ?auto_153505 ) ) ( not ( = ?auto_153504 ?auto_153506 ) ) ( not ( = ?auto_153504 ?auto_153507 ) ) ( not ( = ?auto_153504 ?auto_153508 ) ) ( not ( = ?auto_153504 ?auto_153509 ) ) ( not ( = ?auto_153505 ?auto_153506 ) ) ( not ( = ?auto_153505 ?auto_153507 ) ) ( not ( = ?auto_153505 ?auto_153508 ) ) ( not ( = ?auto_153505 ?auto_153509 ) ) ( not ( = ?auto_153506 ?auto_153507 ) ) ( not ( = ?auto_153506 ?auto_153508 ) ) ( not ( = ?auto_153506 ?auto_153509 ) ) ( not ( = ?auto_153507 ?auto_153508 ) ) ( not ( = ?auto_153507 ?auto_153509 ) ) ( not ( = ?auto_153508 ?auto_153509 ) ) ( ON ?auto_153509 ?auto_153511 ) ( not ( = ?auto_153504 ?auto_153511 ) ) ( not ( = ?auto_153505 ?auto_153511 ) ) ( not ( = ?auto_153506 ?auto_153511 ) ) ( not ( = ?auto_153507 ?auto_153511 ) ) ( not ( = ?auto_153508 ?auto_153511 ) ) ( not ( = ?auto_153509 ?auto_153511 ) ) ( ON ?auto_153508 ?auto_153509 ) ( ON-TABLE ?auto_153510 ) ( ON ?auto_153511 ?auto_153510 ) ( not ( = ?auto_153510 ?auto_153511 ) ) ( not ( = ?auto_153510 ?auto_153509 ) ) ( not ( = ?auto_153510 ?auto_153508 ) ) ( not ( = ?auto_153504 ?auto_153510 ) ) ( not ( = ?auto_153505 ?auto_153510 ) ) ( not ( = ?auto_153506 ?auto_153510 ) ) ( not ( = ?auto_153507 ?auto_153510 ) ) ( CLEAR ?auto_153506 ) ( ON ?auto_153507 ?auto_153508 ) ( CLEAR ?auto_153507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153510 ?auto_153511 ?auto_153509 ?auto_153508 )
      ( MAKE-6PILE ?auto_153504 ?auto_153505 ?auto_153506 ?auto_153507 ?auto_153508 ?auto_153509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153512 - BLOCK
      ?auto_153513 - BLOCK
      ?auto_153514 - BLOCK
      ?auto_153515 - BLOCK
      ?auto_153516 - BLOCK
      ?auto_153517 - BLOCK
    )
    :vars
    (
      ?auto_153518 - BLOCK
      ?auto_153519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153512 ) ( ON ?auto_153513 ?auto_153512 ) ( not ( = ?auto_153512 ?auto_153513 ) ) ( not ( = ?auto_153512 ?auto_153514 ) ) ( not ( = ?auto_153512 ?auto_153515 ) ) ( not ( = ?auto_153512 ?auto_153516 ) ) ( not ( = ?auto_153512 ?auto_153517 ) ) ( not ( = ?auto_153513 ?auto_153514 ) ) ( not ( = ?auto_153513 ?auto_153515 ) ) ( not ( = ?auto_153513 ?auto_153516 ) ) ( not ( = ?auto_153513 ?auto_153517 ) ) ( not ( = ?auto_153514 ?auto_153515 ) ) ( not ( = ?auto_153514 ?auto_153516 ) ) ( not ( = ?auto_153514 ?auto_153517 ) ) ( not ( = ?auto_153515 ?auto_153516 ) ) ( not ( = ?auto_153515 ?auto_153517 ) ) ( not ( = ?auto_153516 ?auto_153517 ) ) ( ON ?auto_153517 ?auto_153518 ) ( not ( = ?auto_153512 ?auto_153518 ) ) ( not ( = ?auto_153513 ?auto_153518 ) ) ( not ( = ?auto_153514 ?auto_153518 ) ) ( not ( = ?auto_153515 ?auto_153518 ) ) ( not ( = ?auto_153516 ?auto_153518 ) ) ( not ( = ?auto_153517 ?auto_153518 ) ) ( ON ?auto_153516 ?auto_153517 ) ( ON-TABLE ?auto_153519 ) ( ON ?auto_153518 ?auto_153519 ) ( not ( = ?auto_153519 ?auto_153518 ) ) ( not ( = ?auto_153519 ?auto_153517 ) ) ( not ( = ?auto_153519 ?auto_153516 ) ) ( not ( = ?auto_153512 ?auto_153519 ) ) ( not ( = ?auto_153513 ?auto_153519 ) ) ( not ( = ?auto_153514 ?auto_153519 ) ) ( not ( = ?auto_153515 ?auto_153519 ) ) ( ON ?auto_153515 ?auto_153516 ) ( CLEAR ?auto_153515 ) ( HOLDING ?auto_153514 ) ( CLEAR ?auto_153513 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153512 ?auto_153513 ?auto_153514 )
      ( MAKE-6PILE ?auto_153512 ?auto_153513 ?auto_153514 ?auto_153515 ?auto_153516 ?auto_153517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153520 - BLOCK
      ?auto_153521 - BLOCK
      ?auto_153522 - BLOCK
      ?auto_153523 - BLOCK
      ?auto_153524 - BLOCK
      ?auto_153525 - BLOCK
    )
    :vars
    (
      ?auto_153526 - BLOCK
      ?auto_153527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153520 ) ( ON ?auto_153521 ?auto_153520 ) ( not ( = ?auto_153520 ?auto_153521 ) ) ( not ( = ?auto_153520 ?auto_153522 ) ) ( not ( = ?auto_153520 ?auto_153523 ) ) ( not ( = ?auto_153520 ?auto_153524 ) ) ( not ( = ?auto_153520 ?auto_153525 ) ) ( not ( = ?auto_153521 ?auto_153522 ) ) ( not ( = ?auto_153521 ?auto_153523 ) ) ( not ( = ?auto_153521 ?auto_153524 ) ) ( not ( = ?auto_153521 ?auto_153525 ) ) ( not ( = ?auto_153522 ?auto_153523 ) ) ( not ( = ?auto_153522 ?auto_153524 ) ) ( not ( = ?auto_153522 ?auto_153525 ) ) ( not ( = ?auto_153523 ?auto_153524 ) ) ( not ( = ?auto_153523 ?auto_153525 ) ) ( not ( = ?auto_153524 ?auto_153525 ) ) ( ON ?auto_153525 ?auto_153526 ) ( not ( = ?auto_153520 ?auto_153526 ) ) ( not ( = ?auto_153521 ?auto_153526 ) ) ( not ( = ?auto_153522 ?auto_153526 ) ) ( not ( = ?auto_153523 ?auto_153526 ) ) ( not ( = ?auto_153524 ?auto_153526 ) ) ( not ( = ?auto_153525 ?auto_153526 ) ) ( ON ?auto_153524 ?auto_153525 ) ( ON-TABLE ?auto_153527 ) ( ON ?auto_153526 ?auto_153527 ) ( not ( = ?auto_153527 ?auto_153526 ) ) ( not ( = ?auto_153527 ?auto_153525 ) ) ( not ( = ?auto_153527 ?auto_153524 ) ) ( not ( = ?auto_153520 ?auto_153527 ) ) ( not ( = ?auto_153521 ?auto_153527 ) ) ( not ( = ?auto_153522 ?auto_153527 ) ) ( not ( = ?auto_153523 ?auto_153527 ) ) ( ON ?auto_153523 ?auto_153524 ) ( CLEAR ?auto_153521 ) ( ON ?auto_153522 ?auto_153523 ) ( CLEAR ?auto_153522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153527 ?auto_153526 ?auto_153525 ?auto_153524 ?auto_153523 )
      ( MAKE-6PILE ?auto_153520 ?auto_153521 ?auto_153522 ?auto_153523 ?auto_153524 ?auto_153525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153528 - BLOCK
      ?auto_153529 - BLOCK
      ?auto_153530 - BLOCK
      ?auto_153531 - BLOCK
      ?auto_153532 - BLOCK
      ?auto_153533 - BLOCK
    )
    :vars
    (
      ?auto_153534 - BLOCK
      ?auto_153535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153528 ) ( not ( = ?auto_153528 ?auto_153529 ) ) ( not ( = ?auto_153528 ?auto_153530 ) ) ( not ( = ?auto_153528 ?auto_153531 ) ) ( not ( = ?auto_153528 ?auto_153532 ) ) ( not ( = ?auto_153528 ?auto_153533 ) ) ( not ( = ?auto_153529 ?auto_153530 ) ) ( not ( = ?auto_153529 ?auto_153531 ) ) ( not ( = ?auto_153529 ?auto_153532 ) ) ( not ( = ?auto_153529 ?auto_153533 ) ) ( not ( = ?auto_153530 ?auto_153531 ) ) ( not ( = ?auto_153530 ?auto_153532 ) ) ( not ( = ?auto_153530 ?auto_153533 ) ) ( not ( = ?auto_153531 ?auto_153532 ) ) ( not ( = ?auto_153531 ?auto_153533 ) ) ( not ( = ?auto_153532 ?auto_153533 ) ) ( ON ?auto_153533 ?auto_153534 ) ( not ( = ?auto_153528 ?auto_153534 ) ) ( not ( = ?auto_153529 ?auto_153534 ) ) ( not ( = ?auto_153530 ?auto_153534 ) ) ( not ( = ?auto_153531 ?auto_153534 ) ) ( not ( = ?auto_153532 ?auto_153534 ) ) ( not ( = ?auto_153533 ?auto_153534 ) ) ( ON ?auto_153532 ?auto_153533 ) ( ON-TABLE ?auto_153535 ) ( ON ?auto_153534 ?auto_153535 ) ( not ( = ?auto_153535 ?auto_153534 ) ) ( not ( = ?auto_153535 ?auto_153533 ) ) ( not ( = ?auto_153535 ?auto_153532 ) ) ( not ( = ?auto_153528 ?auto_153535 ) ) ( not ( = ?auto_153529 ?auto_153535 ) ) ( not ( = ?auto_153530 ?auto_153535 ) ) ( not ( = ?auto_153531 ?auto_153535 ) ) ( ON ?auto_153531 ?auto_153532 ) ( ON ?auto_153530 ?auto_153531 ) ( CLEAR ?auto_153530 ) ( HOLDING ?auto_153529 ) ( CLEAR ?auto_153528 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153528 ?auto_153529 )
      ( MAKE-6PILE ?auto_153528 ?auto_153529 ?auto_153530 ?auto_153531 ?auto_153532 ?auto_153533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153536 - BLOCK
      ?auto_153537 - BLOCK
      ?auto_153538 - BLOCK
      ?auto_153539 - BLOCK
      ?auto_153540 - BLOCK
      ?auto_153541 - BLOCK
    )
    :vars
    (
      ?auto_153542 - BLOCK
      ?auto_153543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153536 ) ( not ( = ?auto_153536 ?auto_153537 ) ) ( not ( = ?auto_153536 ?auto_153538 ) ) ( not ( = ?auto_153536 ?auto_153539 ) ) ( not ( = ?auto_153536 ?auto_153540 ) ) ( not ( = ?auto_153536 ?auto_153541 ) ) ( not ( = ?auto_153537 ?auto_153538 ) ) ( not ( = ?auto_153537 ?auto_153539 ) ) ( not ( = ?auto_153537 ?auto_153540 ) ) ( not ( = ?auto_153537 ?auto_153541 ) ) ( not ( = ?auto_153538 ?auto_153539 ) ) ( not ( = ?auto_153538 ?auto_153540 ) ) ( not ( = ?auto_153538 ?auto_153541 ) ) ( not ( = ?auto_153539 ?auto_153540 ) ) ( not ( = ?auto_153539 ?auto_153541 ) ) ( not ( = ?auto_153540 ?auto_153541 ) ) ( ON ?auto_153541 ?auto_153542 ) ( not ( = ?auto_153536 ?auto_153542 ) ) ( not ( = ?auto_153537 ?auto_153542 ) ) ( not ( = ?auto_153538 ?auto_153542 ) ) ( not ( = ?auto_153539 ?auto_153542 ) ) ( not ( = ?auto_153540 ?auto_153542 ) ) ( not ( = ?auto_153541 ?auto_153542 ) ) ( ON ?auto_153540 ?auto_153541 ) ( ON-TABLE ?auto_153543 ) ( ON ?auto_153542 ?auto_153543 ) ( not ( = ?auto_153543 ?auto_153542 ) ) ( not ( = ?auto_153543 ?auto_153541 ) ) ( not ( = ?auto_153543 ?auto_153540 ) ) ( not ( = ?auto_153536 ?auto_153543 ) ) ( not ( = ?auto_153537 ?auto_153543 ) ) ( not ( = ?auto_153538 ?auto_153543 ) ) ( not ( = ?auto_153539 ?auto_153543 ) ) ( ON ?auto_153539 ?auto_153540 ) ( ON ?auto_153538 ?auto_153539 ) ( CLEAR ?auto_153536 ) ( ON ?auto_153537 ?auto_153538 ) ( CLEAR ?auto_153537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153543 ?auto_153542 ?auto_153541 ?auto_153540 ?auto_153539 ?auto_153538 )
      ( MAKE-6PILE ?auto_153536 ?auto_153537 ?auto_153538 ?auto_153539 ?auto_153540 ?auto_153541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153544 - BLOCK
      ?auto_153545 - BLOCK
      ?auto_153546 - BLOCK
      ?auto_153547 - BLOCK
      ?auto_153548 - BLOCK
      ?auto_153549 - BLOCK
    )
    :vars
    (
      ?auto_153550 - BLOCK
      ?auto_153551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153544 ?auto_153545 ) ) ( not ( = ?auto_153544 ?auto_153546 ) ) ( not ( = ?auto_153544 ?auto_153547 ) ) ( not ( = ?auto_153544 ?auto_153548 ) ) ( not ( = ?auto_153544 ?auto_153549 ) ) ( not ( = ?auto_153545 ?auto_153546 ) ) ( not ( = ?auto_153545 ?auto_153547 ) ) ( not ( = ?auto_153545 ?auto_153548 ) ) ( not ( = ?auto_153545 ?auto_153549 ) ) ( not ( = ?auto_153546 ?auto_153547 ) ) ( not ( = ?auto_153546 ?auto_153548 ) ) ( not ( = ?auto_153546 ?auto_153549 ) ) ( not ( = ?auto_153547 ?auto_153548 ) ) ( not ( = ?auto_153547 ?auto_153549 ) ) ( not ( = ?auto_153548 ?auto_153549 ) ) ( ON ?auto_153549 ?auto_153550 ) ( not ( = ?auto_153544 ?auto_153550 ) ) ( not ( = ?auto_153545 ?auto_153550 ) ) ( not ( = ?auto_153546 ?auto_153550 ) ) ( not ( = ?auto_153547 ?auto_153550 ) ) ( not ( = ?auto_153548 ?auto_153550 ) ) ( not ( = ?auto_153549 ?auto_153550 ) ) ( ON ?auto_153548 ?auto_153549 ) ( ON-TABLE ?auto_153551 ) ( ON ?auto_153550 ?auto_153551 ) ( not ( = ?auto_153551 ?auto_153550 ) ) ( not ( = ?auto_153551 ?auto_153549 ) ) ( not ( = ?auto_153551 ?auto_153548 ) ) ( not ( = ?auto_153544 ?auto_153551 ) ) ( not ( = ?auto_153545 ?auto_153551 ) ) ( not ( = ?auto_153546 ?auto_153551 ) ) ( not ( = ?auto_153547 ?auto_153551 ) ) ( ON ?auto_153547 ?auto_153548 ) ( ON ?auto_153546 ?auto_153547 ) ( ON ?auto_153545 ?auto_153546 ) ( CLEAR ?auto_153545 ) ( HOLDING ?auto_153544 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153544 )
      ( MAKE-6PILE ?auto_153544 ?auto_153545 ?auto_153546 ?auto_153547 ?auto_153548 ?auto_153549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153552 - BLOCK
      ?auto_153553 - BLOCK
      ?auto_153554 - BLOCK
      ?auto_153555 - BLOCK
      ?auto_153556 - BLOCK
      ?auto_153557 - BLOCK
    )
    :vars
    (
      ?auto_153558 - BLOCK
      ?auto_153559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153552 ?auto_153553 ) ) ( not ( = ?auto_153552 ?auto_153554 ) ) ( not ( = ?auto_153552 ?auto_153555 ) ) ( not ( = ?auto_153552 ?auto_153556 ) ) ( not ( = ?auto_153552 ?auto_153557 ) ) ( not ( = ?auto_153553 ?auto_153554 ) ) ( not ( = ?auto_153553 ?auto_153555 ) ) ( not ( = ?auto_153553 ?auto_153556 ) ) ( not ( = ?auto_153553 ?auto_153557 ) ) ( not ( = ?auto_153554 ?auto_153555 ) ) ( not ( = ?auto_153554 ?auto_153556 ) ) ( not ( = ?auto_153554 ?auto_153557 ) ) ( not ( = ?auto_153555 ?auto_153556 ) ) ( not ( = ?auto_153555 ?auto_153557 ) ) ( not ( = ?auto_153556 ?auto_153557 ) ) ( ON ?auto_153557 ?auto_153558 ) ( not ( = ?auto_153552 ?auto_153558 ) ) ( not ( = ?auto_153553 ?auto_153558 ) ) ( not ( = ?auto_153554 ?auto_153558 ) ) ( not ( = ?auto_153555 ?auto_153558 ) ) ( not ( = ?auto_153556 ?auto_153558 ) ) ( not ( = ?auto_153557 ?auto_153558 ) ) ( ON ?auto_153556 ?auto_153557 ) ( ON-TABLE ?auto_153559 ) ( ON ?auto_153558 ?auto_153559 ) ( not ( = ?auto_153559 ?auto_153558 ) ) ( not ( = ?auto_153559 ?auto_153557 ) ) ( not ( = ?auto_153559 ?auto_153556 ) ) ( not ( = ?auto_153552 ?auto_153559 ) ) ( not ( = ?auto_153553 ?auto_153559 ) ) ( not ( = ?auto_153554 ?auto_153559 ) ) ( not ( = ?auto_153555 ?auto_153559 ) ) ( ON ?auto_153555 ?auto_153556 ) ( ON ?auto_153554 ?auto_153555 ) ( ON ?auto_153553 ?auto_153554 ) ( ON ?auto_153552 ?auto_153553 ) ( CLEAR ?auto_153552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153559 ?auto_153558 ?auto_153557 ?auto_153556 ?auto_153555 ?auto_153554 ?auto_153553 )
      ( MAKE-6PILE ?auto_153552 ?auto_153553 ?auto_153554 ?auto_153555 ?auto_153556 ?auto_153557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153566 - BLOCK
      ?auto_153567 - BLOCK
      ?auto_153568 - BLOCK
      ?auto_153569 - BLOCK
      ?auto_153570 - BLOCK
      ?auto_153571 - BLOCK
    )
    :vars
    (
      ?auto_153572 - BLOCK
      ?auto_153573 - BLOCK
      ?auto_153574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153566 ?auto_153567 ) ) ( not ( = ?auto_153566 ?auto_153568 ) ) ( not ( = ?auto_153566 ?auto_153569 ) ) ( not ( = ?auto_153566 ?auto_153570 ) ) ( not ( = ?auto_153566 ?auto_153571 ) ) ( not ( = ?auto_153567 ?auto_153568 ) ) ( not ( = ?auto_153567 ?auto_153569 ) ) ( not ( = ?auto_153567 ?auto_153570 ) ) ( not ( = ?auto_153567 ?auto_153571 ) ) ( not ( = ?auto_153568 ?auto_153569 ) ) ( not ( = ?auto_153568 ?auto_153570 ) ) ( not ( = ?auto_153568 ?auto_153571 ) ) ( not ( = ?auto_153569 ?auto_153570 ) ) ( not ( = ?auto_153569 ?auto_153571 ) ) ( not ( = ?auto_153570 ?auto_153571 ) ) ( ON ?auto_153571 ?auto_153572 ) ( not ( = ?auto_153566 ?auto_153572 ) ) ( not ( = ?auto_153567 ?auto_153572 ) ) ( not ( = ?auto_153568 ?auto_153572 ) ) ( not ( = ?auto_153569 ?auto_153572 ) ) ( not ( = ?auto_153570 ?auto_153572 ) ) ( not ( = ?auto_153571 ?auto_153572 ) ) ( ON ?auto_153570 ?auto_153571 ) ( ON-TABLE ?auto_153573 ) ( ON ?auto_153572 ?auto_153573 ) ( not ( = ?auto_153573 ?auto_153572 ) ) ( not ( = ?auto_153573 ?auto_153571 ) ) ( not ( = ?auto_153573 ?auto_153570 ) ) ( not ( = ?auto_153566 ?auto_153573 ) ) ( not ( = ?auto_153567 ?auto_153573 ) ) ( not ( = ?auto_153568 ?auto_153573 ) ) ( not ( = ?auto_153569 ?auto_153573 ) ) ( ON ?auto_153569 ?auto_153570 ) ( ON ?auto_153568 ?auto_153569 ) ( ON ?auto_153567 ?auto_153568 ) ( CLEAR ?auto_153567 ) ( ON ?auto_153566 ?auto_153574 ) ( CLEAR ?auto_153566 ) ( HAND-EMPTY ) ( not ( = ?auto_153566 ?auto_153574 ) ) ( not ( = ?auto_153567 ?auto_153574 ) ) ( not ( = ?auto_153568 ?auto_153574 ) ) ( not ( = ?auto_153569 ?auto_153574 ) ) ( not ( = ?auto_153570 ?auto_153574 ) ) ( not ( = ?auto_153571 ?auto_153574 ) ) ( not ( = ?auto_153572 ?auto_153574 ) ) ( not ( = ?auto_153573 ?auto_153574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153566 ?auto_153574 )
      ( MAKE-6PILE ?auto_153566 ?auto_153567 ?auto_153568 ?auto_153569 ?auto_153570 ?auto_153571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153575 - BLOCK
      ?auto_153576 - BLOCK
      ?auto_153577 - BLOCK
      ?auto_153578 - BLOCK
      ?auto_153579 - BLOCK
      ?auto_153580 - BLOCK
    )
    :vars
    (
      ?auto_153581 - BLOCK
      ?auto_153582 - BLOCK
      ?auto_153583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153575 ?auto_153576 ) ) ( not ( = ?auto_153575 ?auto_153577 ) ) ( not ( = ?auto_153575 ?auto_153578 ) ) ( not ( = ?auto_153575 ?auto_153579 ) ) ( not ( = ?auto_153575 ?auto_153580 ) ) ( not ( = ?auto_153576 ?auto_153577 ) ) ( not ( = ?auto_153576 ?auto_153578 ) ) ( not ( = ?auto_153576 ?auto_153579 ) ) ( not ( = ?auto_153576 ?auto_153580 ) ) ( not ( = ?auto_153577 ?auto_153578 ) ) ( not ( = ?auto_153577 ?auto_153579 ) ) ( not ( = ?auto_153577 ?auto_153580 ) ) ( not ( = ?auto_153578 ?auto_153579 ) ) ( not ( = ?auto_153578 ?auto_153580 ) ) ( not ( = ?auto_153579 ?auto_153580 ) ) ( ON ?auto_153580 ?auto_153581 ) ( not ( = ?auto_153575 ?auto_153581 ) ) ( not ( = ?auto_153576 ?auto_153581 ) ) ( not ( = ?auto_153577 ?auto_153581 ) ) ( not ( = ?auto_153578 ?auto_153581 ) ) ( not ( = ?auto_153579 ?auto_153581 ) ) ( not ( = ?auto_153580 ?auto_153581 ) ) ( ON ?auto_153579 ?auto_153580 ) ( ON-TABLE ?auto_153582 ) ( ON ?auto_153581 ?auto_153582 ) ( not ( = ?auto_153582 ?auto_153581 ) ) ( not ( = ?auto_153582 ?auto_153580 ) ) ( not ( = ?auto_153582 ?auto_153579 ) ) ( not ( = ?auto_153575 ?auto_153582 ) ) ( not ( = ?auto_153576 ?auto_153582 ) ) ( not ( = ?auto_153577 ?auto_153582 ) ) ( not ( = ?auto_153578 ?auto_153582 ) ) ( ON ?auto_153578 ?auto_153579 ) ( ON ?auto_153577 ?auto_153578 ) ( ON ?auto_153575 ?auto_153583 ) ( CLEAR ?auto_153575 ) ( not ( = ?auto_153575 ?auto_153583 ) ) ( not ( = ?auto_153576 ?auto_153583 ) ) ( not ( = ?auto_153577 ?auto_153583 ) ) ( not ( = ?auto_153578 ?auto_153583 ) ) ( not ( = ?auto_153579 ?auto_153583 ) ) ( not ( = ?auto_153580 ?auto_153583 ) ) ( not ( = ?auto_153581 ?auto_153583 ) ) ( not ( = ?auto_153582 ?auto_153583 ) ) ( HOLDING ?auto_153576 ) ( CLEAR ?auto_153577 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153582 ?auto_153581 ?auto_153580 ?auto_153579 ?auto_153578 ?auto_153577 ?auto_153576 )
      ( MAKE-6PILE ?auto_153575 ?auto_153576 ?auto_153577 ?auto_153578 ?auto_153579 ?auto_153580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153584 - BLOCK
      ?auto_153585 - BLOCK
      ?auto_153586 - BLOCK
      ?auto_153587 - BLOCK
      ?auto_153588 - BLOCK
      ?auto_153589 - BLOCK
    )
    :vars
    (
      ?auto_153592 - BLOCK
      ?auto_153591 - BLOCK
      ?auto_153590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153584 ?auto_153585 ) ) ( not ( = ?auto_153584 ?auto_153586 ) ) ( not ( = ?auto_153584 ?auto_153587 ) ) ( not ( = ?auto_153584 ?auto_153588 ) ) ( not ( = ?auto_153584 ?auto_153589 ) ) ( not ( = ?auto_153585 ?auto_153586 ) ) ( not ( = ?auto_153585 ?auto_153587 ) ) ( not ( = ?auto_153585 ?auto_153588 ) ) ( not ( = ?auto_153585 ?auto_153589 ) ) ( not ( = ?auto_153586 ?auto_153587 ) ) ( not ( = ?auto_153586 ?auto_153588 ) ) ( not ( = ?auto_153586 ?auto_153589 ) ) ( not ( = ?auto_153587 ?auto_153588 ) ) ( not ( = ?auto_153587 ?auto_153589 ) ) ( not ( = ?auto_153588 ?auto_153589 ) ) ( ON ?auto_153589 ?auto_153592 ) ( not ( = ?auto_153584 ?auto_153592 ) ) ( not ( = ?auto_153585 ?auto_153592 ) ) ( not ( = ?auto_153586 ?auto_153592 ) ) ( not ( = ?auto_153587 ?auto_153592 ) ) ( not ( = ?auto_153588 ?auto_153592 ) ) ( not ( = ?auto_153589 ?auto_153592 ) ) ( ON ?auto_153588 ?auto_153589 ) ( ON-TABLE ?auto_153591 ) ( ON ?auto_153592 ?auto_153591 ) ( not ( = ?auto_153591 ?auto_153592 ) ) ( not ( = ?auto_153591 ?auto_153589 ) ) ( not ( = ?auto_153591 ?auto_153588 ) ) ( not ( = ?auto_153584 ?auto_153591 ) ) ( not ( = ?auto_153585 ?auto_153591 ) ) ( not ( = ?auto_153586 ?auto_153591 ) ) ( not ( = ?auto_153587 ?auto_153591 ) ) ( ON ?auto_153587 ?auto_153588 ) ( ON ?auto_153586 ?auto_153587 ) ( ON ?auto_153584 ?auto_153590 ) ( not ( = ?auto_153584 ?auto_153590 ) ) ( not ( = ?auto_153585 ?auto_153590 ) ) ( not ( = ?auto_153586 ?auto_153590 ) ) ( not ( = ?auto_153587 ?auto_153590 ) ) ( not ( = ?auto_153588 ?auto_153590 ) ) ( not ( = ?auto_153589 ?auto_153590 ) ) ( not ( = ?auto_153592 ?auto_153590 ) ) ( not ( = ?auto_153591 ?auto_153590 ) ) ( CLEAR ?auto_153586 ) ( ON ?auto_153585 ?auto_153584 ) ( CLEAR ?auto_153585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153590 ?auto_153584 )
      ( MAKE-6PILE ?auto_153584 ?auto_153585 ?auto_153586 ?auto_153587 ?auto_153588 ?auto_153589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153593 - BLOCK
      ?auto_153594 - BLOCK
      ?auto_153595 - BLOCK
      ?auto_153596 - BLOCK
      ?auto_153597 - BLOCK
      ?auto_153598 - BLOCK
    )
    :vars
    (
      ?auto_153601 - BLOCK
      ?auto_153600 - BLOCK
      ?auto_153599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153593 ?auto_153594 ) ) ( not ( = ?auto_153593 ?auto_153595 ) ) ( not ( = ?auto_153593 ?auto_153596 ) ) ( not ( = ?auto_153593 ?auto_153597 ) ) ( not ( = ?auto_153593 ?auto_153598 ) ) ( not ( = ?auto_153594 ?auto_153595 ) ) ( not ( = ?auto_153594 ?auto_153596 ) ) ( not ( = ?auto_153594 ?auto_153597 ) ) ( not ( = ?auto_153594 ?auto_153598 ) ) ( not ( = ?auto_153595 ?auto_153596 ) ) ( not ( = ?auto_153595 ?auto_153597 ) ) ( not ( = ?auto_153595 ?auto_153598 ) ) ( not ( = ?auto_153596 ?auto_153597 ) ) ( not ( = ?auto_153596 ?auto_153598 ) ) ( not ( = ?auto_153597 ?auto_153598 ) ) ( ON ?auto_153598 ?auto_153601 ) ( not ( = ?auto_153593 ?auto_153601 ) ) ( not ( = ?auto_153594 ?auto_153601 ) ) ( not ( = ?auto_153595 ?auto_153601 ) ) ( not ( = ?auto_153596 ?auto_153601 ) ) ( not ( = ?auto_153597 ?auto_153601 ) ) ( not ( = ?auto_153598 ?auto_153601 ) ) ( ON ?auto_153597 ?auto_153598 ) ( ON-TABLE ?auto_153600 ) ( ON ?auto_153601 ?auto_153600 ) ( not ( = ?auto_153600 ?auto_153601 ) ) ( not ( = ?auto_153600 ?auto_153598 ) ) ( not ( = ?auto_153600 ?auto_153597 ) ) ( not ( = ?auto_153593 ?auto_153600 ) ) ( not ( = ?auto_153594 ?auto_153600 ) ) ( not ( = ?auto_153595 ?auto_153600 ) ) ( not ( = ?auto_153596 ?auto_153600 ) ) ( ON ?auto_153596 ?auto_153597 ) ( ON ?auto_153593 ?auto_153599 ) ( not ( = ?auto_153593 ?auto_153599 ) ) ( not ( = ?auto_153594 ?auto_153599 ) ) ( not ( = ?auto_153595 ?auto_153599 ) ) ( not ( = ?auto_153596 ?auto_153599 ) ) ( not ( = ?auto_153597 ?auto_153599 ) ) ( not ( = ?auto_153598 ?auto_153599 ) ) ( not ( = ?auto_153601 ?auto_153599 ) ) ( not ( = ?auto_153600 ?auto_153599 ) ) ( ON ?auto_153594 ?auto_153593 ) ( CLEAR ?auto_153594 ) ( ON-TABLE ?auto_153599 ) ( HOLDING ?auto_153595 ) ( CLEAR ?auto_153596 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153600 ?auto_153601 ?auto_153598 ?auto_153597 ?auto_153596 ?auto_153595 )
      ( MAKE-6PILE ?auto_153593 ?auto_153594 ?auto_153595 ?auto_153596 ?auto_153597 ?auto_153598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153602 - BLOCK
      ?auto_153603 - BLOCK
      ?auto_153604 - BLOCK
      ?auto_153605 - BLOCK
      ?auto_153606 - BLOCK
      ?auto_153607 - BLOCK
    )
    :vars
    (
      ?auto_153608 - BLOCK
      ?auto_153609 - BLOCK
      ?auto_153610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153602 ?auto_153603 ) ) ( not ( = ?auto_153602 ?auto_153604 ) ) ( not ( = ?auto_153602 ?auto_153605 ) ) ( not ( = ?auto_153602 ?auto_153606 ) ) ( not ( = ?auto_153602 ?auto_153607 ) ) ( not ( = ?auto_153603 ?auto_153604 ) ) ( not ( = ?auto_153603 ?auto_153605 ) ) ( not ( = ?auto_153603 ?auto_153606 ) ) ( not ( = ?auto_153603 ?auto_153607 ) ) ( not ( = ?auto_153604 ?auto_153605 ) ) ( not ( = ?auto_153604 ?auto_153606 ) ) ( not ( = ?auto_153604 ?auto_153607 ) ) ( not ( = ?auto_153605 ?auto_153606 ) ) ( not ( = ?auto_153605 ?auto_153607 ) ) ( not ( = ?auto_153606 ?auto_153607 ) ) ( ON ?auto_153607 ?auto_153608 ) ( not ( = ?auto_153602 ?auto_153608 ) ) ( not ( = ?auto_153603 ?auto_153608 ) ) ( not ( = ?auto_153604 ?auto_153608 ) ) ( not ( = ?auto_153605 ?auto_153608 ) ) ( not ( = ?auto_153606 ?auto_153608 ) ) ( not ( = ?auto_153607 ?auto_153608 ) ) ( ON ?auto_153606 ?auto_153607 ) ( ON-TABLE ?auto_153609 ) ( ON ?auto_153608 ?auto_153609 ) ( not ( = ?auto_153609 ?auto_153608 ) ) ( not ( = ?auto_153609 ?auto_153607 ) ) ( not ( = ?auto_153609 ?auto_153606 ) ) ( not ( = ?auto_153602 ?auto_153609 ) ) ( not ( = ?auto_153603 ?auto_153609 ) ) ( not ( = ?auto_153604 ?auto_153609 ) ) ( not ( = ?auto_153605 ?auto_153609 ) ) ( ON ?auto_153605 ?auto_153606 ) ( ON ?auto_153602 ?auto_153610 ) ( not ( = ?auto_153602 ?auto_153610 ) ) ( not ( = ?auto_153603 ?auto_153610 ) ) ( not ( = ?auto_153604 ?auto_153610 ) ) ( not ( = ?auto_153605 ?auto_153610 ) ) ( not ( = ?auto_153606 ?auto_153610 ) ) ( not ( = ?auto_153607 ?auto_153610 ) ) ( not ( = ?auto_153608 ?auto_153610 ) ) ( not ( = ?auto_153609 ?auto_153610 ) ) ( ON ?auto_153603 ?auto_153602 ) ( ON-TABLE ?auto_153610 ) ( CLEAR ?auto_153605 ) ( ON ?auto_153604 ?auto_153603 ) ( CLEAR ?auto_153604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153610 ?auto_153602 ?auto_153603 )
      ( MAKE-6PILE ?auto_153602 ?auto_153603 ?auto_153604 ?auto_153605 ?auto_153606 ?auto_153607 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153611 - BLOCK
      ?auto_153612 - BLOCK
      ?auto_153613 - BLOCK
      ?auto_153614 - BLOCK
      ?auto_153615 - BLOCK
      ?auto_153616 - BLOCK
    )
    :vars
    (
      ?auto_153619 - BLOCK
      ?auto_153617 - BLOCK
      ?auto_153618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153611 ?auto_153612 ) ) ( not ( = ?auto_153611 ?auto_153613 ) ) ( not ( = ?auto_153611 ?auto_153614 ) ) ( not ( = ?auto_153611 ?auto_153615 ) ) ( not ( = ?auto_153611 ?auto_153616 ) ) ( not ( = ?auto_153612 ?auto_153613 ) ) ( not ( = ?auto_153612 ?auto_153614 ) ) ( not ( = ?auto_153612 ?auto_153615 ) ) ( not ( = ?auto_153612 ?auto_153616 ) ) ( not ( = ?auto_153613 ?auto_153614 ) ) ( not ( = ?auto_153613 ?auto_153615 ) ) ( not ( = ?auto_153613 ?auto_153616 ) ) ( not ( = ?auto_153614 ?auto_153615 ) ) ( not ( = ?auto_153614 ?auto_153616 ) ) ( not ( = ?auto_153615 ?auto_153616 ) ) ( ON ?auto_153616 ?auto_153619 ) ( not ( = ?auto_153611 ?auto_153619 ) ) ( not ( = ?auto_153612 ?auto_153619 ) ) ( not ( = ?auto_153613 ?auto_153619 ) ) ( not ( = ?auto_153614 ?auto_153619 ) ) ( not ( = ?auto_153615 ?auto_153619 ) ) ( not ( = ?auto_153616 ?auto_153619 ) ) ( ON ?auto_153615 ?auto_153616 ) ( ON-TABLE ?auto_153617 ) ( ON ?auto_153619 ?auto_153617 ) ( not ( = ?auto_153617 ?auto_153619 ) ) ( not ( = ?auto_153617 ?auto_153616 ) ) ( not ( = ?auto_153617 ?auto_153615 ) ) ( not ( = ?auto_153611 ?auto_153617 ) ) ( not ( = ?auto_153612 ?auto_153617 ) ) ( not ( = ?auto_153613 ?auto_153617 ) ) ( not ( = ?auto_153614 ?auto_153617 ) ) ( ON ?auto_153611 ?auto_153618 ) ( not ( = ?auto_153611 ?auto_153618 ) ) ( not ( = ?auto_153612 ?auto_153618 ) ) ( not ( = ?auto_153613 ?auto_153618 ) ) ( not ( = ?auto_153614 ?auto_153618 ) ) ( not ( = ?auto_153615 ?auto_153618 ) ) ( not ( = ?auto_153616 ?auto_153618 ) ) ( not ( = ?auto_153619 ?auto_153618 ) ) ( not ( = ?auto_153617 ?auto_153618 ) ) ( ON ?auto_153612 ?auto_153611 ) ( ON-TABLE ?auto_153618 ) ( ON ?auto_153613 ?auto_153612 ) ( CLEAR ?auto_153613 ) ( HOLDING ?auto_153614 ) ( CLEAR ?auto_153615 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153617 ?auto_153619 ?auto_153616 ?auto_153615 ?auto_153614 )
      ( MAKE-6PILE ?auto_153611 ?auto_153612 ?auto_153613 ?auto_153614 ?auto_153615 ?auto_153616 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153620 - BLOCK
      ?auto_153621 - BLOCK
      ?auto_153622 - BLOCK
      ?auto_153623 - BLOCK
      ?auto_153624 - BLOCK
      ?auto_153625 - BLOCK
    )
    :vars
    (
      ?auto_153627 - BLOCK
      ?auto_153626 - BLOCK
      ?auto_153628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153620 ?auto_153621 ) ) ( not ( = ?auto_153620 ?auto_153622 ) ) ( not ( = ?auto_153620 ?auto_153623 ) ) ( not ( = ?auto_153620 ?auto_153624 ) ) ( not ( = ?auto_153620 ?auto_153625 ) ) ( not ( = ?auto_153621 ?auto_153622 ) ) ( not ( = ?auto_153621 ?auto_153623 ) ) ( not ( = ?auto_153621 ?auto_153624 ) ) ( not ( = ?auto_153621 ?auto_153625 ) ) ( not ( = ?auto_153622 ?auto_153623 ) ) ( not ( = ?auto_153622 ?auto_153624 ) ) ( not ( = ?auto_153622 ?auto_153625 ) ) ( not ( = ?auto_153623 ?auto_153624 ) ) ( not ( = ?auto_153623 ?auto_153625 ) ) ( not ( = ?auto_153624 ?auto_153625 ) ) ( ON ?auto_153625 ?auto_153627 ) ( not ( = ?auto_153620 ?auto_153627 ) ) ( not ( = ?auto_153621 ?auto_153627 ) ) ( not ( = ?auto_153622 ?auto_153627 ) ) ( not ( = ?auto_153623 ?auto_153627 ) ) ( not ( = ?auto_153624 ?auto_153627 ) ) ( not ( = ?auto_153625 ?auto_153627 ) ) ( ON ?auto_153624 ?auto_153625 ) ( ON-TABLE ?auto_153626 ) ( ON ?auto_153627 ?auto_153626 ) ( not ( = ?auto_153626 ?auto_153627 ) ) ( not ( = ?auto_153626 ?auto_153625 ) ) ( not ( = ?auto_153626 ?auto_153624 ) ) ( not ( = ?auto_153620 ?auto_153626 ) ) ( not ( = ?auto_153621 ?auto_153626 ) ) ( not ( = ?auto_153622 ?auto_153626 ) ) ( not ( = ?auto_153623 ?auto_153626 ) ) ( ON ?auto_153620 ?auto_153628 ) ( not ( = ?auto_153620 ?auto_153628 ) ) ( not ( = ?auto_153621 ?auto_153628 ) ) ( not ( = ?auto_153622 ?auto_153628 ) ) ( not ( = ?auto_153623 ?auto_153628 ) ) ( not ( = ?auto_153624 ?auto_153628 ) ) ( not ( = ?auto_153625 ?auto_153628 ) ) ( not ( = ?auto_153627 ?auto_153628 ) ) ( not ( = ?auto_153626 ?auto_153628 ) ) ( ON ?auto_153621 ?auto_153620 ) ( ON-TABLE ?auto_153628 ) ( ON ?auto_153622 ?auto_153621 ) ( CLEAR ?auto_153624 ) ( ON ?auto_153623 ?auto_153622 ) ( CLEAR ?auto_153623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153628 ?auto_153620 ?auto_153621 ?auto_153622 )
      ( MAKE-6PILE ?auto_153620 ?auto_153621 ?auto_153622 ?auto_153623 ?auto_153624 ?auto_153625 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153629 - BLOCK
      ?auto_153630 - BLOCK
      ?auto_153631 - BLOCK
      ?auto_153632 - BLOCK
      ?auto_153633 - BLOCK
      ?auto_153634 - BLOCK
    )
    :vars
    (
      ?auto_153637 - BLOCK
      ?auto_153636 - BLOCK
      ?auto_153635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153629 ?auto_153630 ) ) ( not ( = ?auto_153629 ?auto_153631 ) ) ( not ( = ?auto_153629 ?auto_153632 ) ) ( not ( = ?auto_153629 ?auto_153633 ) ) ( not ( = ?auto_153629 ?auto_153634 ) ) ( not ( = ?auto_153630 ?auto_153631 ) ) ( not ( = ?auto_153630 ?auto_153632 ) ) ( not ( = ?auto_153630 ?auto_153633 ) ) ( not ( = ?auto_153630 ?auto_153634 ) ) ( not ( = ?auto_153631 ?auto_153632 ) ) ( not ( = ?auto_153631 ?auto_153633 ) ) ( not ( = ?auto_153631 ?auto_153634 ) ) ( not ( = ?auto_153632 ?auto_153633 ) ) ( not ( = ?auto_153632 ?auto_153634 ) ) ( not ( = ?auto_153633 ?auto_153634 ) ) ( ON ?auto_153634 ?auto_153637 ) ( not ( = ?auto_153629 ?auto_153637 ) ) ( not ( = ?auto_153630 ?auto_153637 ) ) ( not ( = ?auto_153631 ?auto_153637 ) ) ( not ( = ?auto_153632 ?auto_153637 ) ) ( not ( = ?auto_153633 ?auto_153637 ) ) ( not ( = ?auto_153634 ?auto_153637 ) ) ( ON-TABLE ?auto_153636 ) ( ON ?auto_153637 ?auto_153636 ) ( not ( = ?auto_153636 ?auto_153637 ) ) ( not ( = ?auto_153636 ?auto_153634 ) ) ( not ( = ?auto_153636 ?auto_153633 ) ) ( not ( = ?auto_153629 ?auto_153636 ) ) ( not ( = ?auto_153630 ?auto_153636 ) ) ( not ( = ?auto_153631 ?auto_153636 ) ) ( not ( = ?auto_153632 ?auto_153636 ) ) ( ON ?auto_153629 ?auto_153635 ) ( not ( = ?auto_153629 ?auto_153635 ) ) ( not ( = ?auto_153630 ?auto_153635 ) ) ( not ( = ?auto_153631 ?auto_153635 ) ) ( not ( = ?auto_153632 ?auto_153635 ) ) ( not ( = ?auto_153633 ?auto_153635 ) ) ( not ( = ?auto_153634 ?auto_153635 ) ) ( not ( = ?auto_153637 ?auto_153635 ) ) ( not ( = ?auto_153636 ?auto_153635 ) ) ( ON ?auto_153630 ?auto_153629 ) ( ON-TABLE ?auto_153635 ) ( ON ?auto_153631 ?auto_153630 ) ( ON ?auto_153632 ?auto_153631 ) ( CLEAR ?auto_153632 ) ( HOLDING ?auto_153633 ) ( CLEAR ?auto_153634 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153636 ?auto_153637 ?auto_153634 ?auto_153633 )
      ( MAKE-6PILE ?auto_153629 ?auto_153630 ?auto_153631 ?auto_153632 ?auto_153633 ?auto_153634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153638 - BLOCK
      ?auto_153639 - BLOCK
      ?auto_153640 - BLOCK
      ?auto_153641 - BLOCK
      ?auto_153642 - BLOCK
      ?auto_153643 - BLOCK
    )
    :vars
    (
      ?auto_153646 - BLOCK
      ?auto_153645 - BLOCK
      ?auto_153644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153638 ?auto_153639 ) ) ( not ( = ?auto_153638 ?auto_153640 ) ) ( not ( = ?auto_153638 ?auto_153641 ) ) ( not ( = ?auto_153638 ?auto_153642 ) ) ( not ( = ?auto_153638 ?auto_153643 ) ) ( not ( = ?auto_153639 ?auto_153640 ) ) ( not ( = ?auto_153639 ?auto_153641 ) ) ( not ( = ?auto_153639 ?auto_153642 ) ) ( not ( = ?auto_153639 ?auto_153643 ) ) ( not ( = ?auto_153640 ?auto_153641 ) ) ( not ( = ?auto_153640 ?auto_153642 ) ) ( not ( = ?auto_153640 ?auto_153643 ) ) ( not ( = ?auto_153641 ?auto_153642 ) ) ( not ( = ?auto_153641 ?auto_153643 ) ) ( not ( = ?auto_153642 ?auto_153643 ) ) ( ON ?auto_153643 ?auto_153646 ) ( not ( = ?auto_153638 ?auto_153646 ) ) ( not ( = ?auto_153639 ?auto_153646 ) ) ( not ( = ?auto_153640 ?auto_153646 ) ) ( not ( = ?auto_153641 ?auto_153646 ) ) ( not ( = ?auto_153642 ?auto_153646 ) ) ( not ( = ?auto_153643 ?auto_153646 ) ) ( ON-TABLE ?auto_153645 ) ( ON ?auto_153646 ?auto_153645 ) ( not ( = ?auto_153645 ?auto_153646 ) ) ( not ( = ?auto_153645 ?auto_153643 ) ) ( not ( = ?auto_153645 ?auto_153642 ) ) ( not ( = ?auto_153638 ?auto_153645 ) ) ( not ( = ?auto_153639 ?auto_153645 ) ) ( not ( = ?auto_153640 ?auto_153645 ) ) ( not ( = ?auto_153641 ?auto_153645 ) ) ( ON ?auto_153638 ?auto_153644 ) ( not ( = ?auto_153638 ?auto_153644 ) ) ( not ( = ?auto_153639 ?auto_153644 ) ) ( not ( = ?auto_153640 ?auto_153644 ) ) ( not ( = ?auto_153641 ?auto_153644 ) ) ( not ( = ?auto_153642 ?auto_153644 ) ) ( not ( = ?auto_153643 ?auto_153644 ) ) ( not ( = ?auto_153646 ?auto_153644 ) ) ( not ( = ?auto_153645 ?auto_153644 ) ) ( ON ?auto_153639 ?auto_153638 ) ( ON-TABLE ?auto_153644 ) ( ON ?auto_153640 ?auto_153639 ) ( ON ?auto_153641 ?auto_153640 ) ( CLEAR ?auto_153643 ) ( ON ?auto_153642 ?auto_153641 ) ( CLEAR ?auto_153642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153644 ?auto_153638 ?auto_153639 ?auto_153640 ?auto_153641 )
      ( MAKE-6PILE ?auto_153638 ?auto_153639 ?auto_153640 ?auto_153641 ?auto_153642 ?auto_153643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153647 - BLOCK
      ?auto_153648 - BLOCK
      ?auto_153649 - BLOCK
      ?auto_153650 - BLOCK
      ?auto_153651 - BLOCK
      ?auto_153652 - BLOCK
    )
    :vars
    (
      ?auto_153654 - BLOCK
      ?auto_153653 - BLOCK
      ?auto_153655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153647 ?auto_153648 ) ) ( not ( = ?auto_153647 ?auto_153649 ) ) ( not ( = ?auto_153647 ?auto_153650 ) ) ( not ( = ?auto_153647 ?auto_153651 ) ) ( not ( = ?auto_153647 ?auto_153652 ) ) ( not ( = ?auto_153648 ?auto_153649 ) ) ( not ( = ?auto_153648 ?auto_153650 ) ) ( not ( = ?auto_153648 ?auto_153651 ) ) ( not ( = ?auto_153648 ?auto_153652 ) ) ( not ( = ?auto_153649 ?auto_153650 ) ) ( not ( = ?auto_153649 ?auto_153651 ) ) ( not ( = ?auto_153649 ?auto_153652 ) ) ( not ( = ?auto_153650 ?auto_153651 ) ) ( not ( = ?auto_153650 ?auto_153652 ) ) ( not ( = ?auto_153651 ?auto_153652 ) ) ( not ( = ?auto_153647 ?auto_153654 ) ) ( not ( = ?auto_153648 ?auto_153654 ) ) ( not ( = ?auto_153649 ?auto_153654 ) ) ( not ( = ?auto_153650 ?auto_153654 ) ) ( not ( = ?auto_153651 ?auto_153654 ) ) ( not ( = ?auto_153652 ?auto_153654 ) ) ( ON-TABLE ?auto_153653 ) ( ON ?auto_153654 ?auto_153653 ) ( not ( = ?auto_153653 ?auto_153654 ) ) ( not ( = ?auto_153653 ?auto_153652 ) ) ( not ( = ?auto_153653 ?auto_153651 ) ) ( not ( = ?auto_153647 ?auto_153653 ) ) ( not ( = ?auto_153648 ?auto_153653 ) ) ( not ( = ?auto_153649 ?auto_153653 ) ) ( not ( = ?auto_153650 ?auto_153653 ) ) ( ON ?auto_153647 ?auto_153655 ) ( not ( = ?auto_153647 ?auto_153655 ) ) ( not ( = ?auto_153648 ?auto_153655 ) ) ( not ( = ?auto_153649 ?auto_153655 ) ) ( not ( = ?auto_153650 ?auto_153655 ) ) ( not ( = ?auto_153651 ?auto_153655 ) ) ( not ( = ?auto_153652 ?auto_153655 ) ) ( not ( = ?auto_153654 ?auto_153655 ) ) ( not ( = ?auto_153653 ?auto_153655 ) ) ( ON ?auto_153648 ?auto_153647 ) ( ON-TABLE ?auto_153655 ) ( ON ?auto_153649 ?auto_153648 ) ( ON ?auto_153650 ?auto_153649 ) ( ON ?auto_153651 ?auto_153650 ) ( CLEAR ?auto_153651 ) ( HOLDING ?auto_153652 ) ( CLEAR ?auto_153654 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153653 ?auto_153654 ?auto_153652 )
      ( MAKE-6PILE ?auto_153647 ?auto_153648 ?auto_153649 ?auto_153650 ?auto_153651 ?auto_153652 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153656 - BLOCK
      ?auto_153657 - BLOCK
      ?auto_153658 - BLOCK
      ?auto_153659 - BLOCK
      ?auto_153660 - BLOCK
      ?auto_153661 - BLOCK
    )
    :vars
    (
      ?auto_153664 - BLOCK
      ?auto_153663 - BLOCK
      ?auto_153662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153656 ?auto_153657 ) ) ( not ( = ?auto_153656 ?auto_153658 ) ) ( not ( = ?auto_153656 ?auto_153659 ) ) ( not ( = ?auto_153656 ?auto_153660 ) ) ( not ( = ?auto_153656 ?auto_153661 ) ) ( not ( = ?auto_153657 ?auto_153658 ) ) ( not ( = ?auto_153657 ?auto_153659 ) ) ( not ( = ?auto_153657 ?auto_153660 ) ) ( not ( = ?auto_153657 ?auto_153661 ) ) ( not ( = ?auto_153658 ?auto_153659 ) ) ( not ( = ?auto_153658 ?auto_153660 ) ) ( not ( = ?auto_153658 ?auto_153661 ) ) ( not ( = ?auto_153659 ?auto_153660 ) ) ( not ( = ?auto_153659 ?auto_153661 ) ) ( not ( = ?auto_153660 ?auto_153661 ) ) ( not ( = ?auto_153656 ?auto_153664 ) ) ( not ( = ?auto_153657 ?auto_153664 ) ) ( not ( = ?auto_153658 ?auto_153664 ) ) ( not ( = ?auto_153659 ?auto_153664 ) ) ( not ( = ?auto_153660 ?auto_153664 ) ) ( not ( = ?auto_153661 ?auto_153664 ) ) ( ON-TABLE ?auto_153663 ) ( ON ?auto_153664 ?auto_153663 ) ( not ( = ?auto_153663 ?auto_153664 ) ) ( not ( = ?auto_153663 ?auto_153661 ) ) ( not ( = ?auto_153663 ?auto_153660 ) ) ( not ( = ?auto_153656 ?auto_153663 ) ) ( not ( = ?auto_153657 ?auto_153663 ) ) ( not ( = ?auto_153658 ?auto_153663 ) ) ( not ( = ?auto_153659 ?auto_153663 ) ) ( ON ?auto_153656 ?auto_153662 ) ( not ( = ?auto_153656 ?auto_153662 ) ) ( not ( = ?auto_153657 ?auto_153662 ) ) ( not ( = ?auto_153658 ?auto_153662 ) ) ( not ( = ?auto_153659 ?auto_153662 ) ) ( not ( = ?auto_153660 ?auto_153662 ) ) ( not ( = ?auto_153661 ?auto_153662 ) ) ( not ( = ?auto_153664 ?auto_153662 ) ) ( not ( = ?auto_153663 ?auto_153662 ) ) ( ON ?auto_153657 ?auto_153656 ) ( ON-TABLE ?auto_153662 ) ( ON ?auto_153658 ?auto_153657 ) ( ON ?auto_153659 ?auto_153658 ) ( ON ?auto_153660 ?auto_153659 ) ( CLEAR ?auto_153664 ) ( ON ?auto_153661 ?auto_153660 ) ( CLEAR ?auto_153661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153662 ?auto_153656 ?auto_153657 ?auto_153658 ?auto_153659 ?auto_153660 )
      ( MAKE-6PILE ?auto_153656 ?auto_153657 ?auto_153658 ?auto_153659 ?auto_153660 ?auto_153661 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153665 - BLOCK
      ?auto_153666 - BLOCK
      ?auto_153667 - BLOCK
      ?auto_153668 - BLOCK
      ?auto_153669 - BLOCK
      ?auto_153670 - BLOCK
    )
    :vars
    (
      ?auto_153673 - BLOCK
      ?auto_153671 - BLOCK
      ?auto_153672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153665 ?auto_153666 ) ) ( not ( = ?auto_153665 ?auto_153667 ) ) ( not ( = ?auto_153665 ?auto_153668 ) ) ( not ( = ?auto_153665 ?auto_153669 ) ) ( not ( = ?auto_153665 ?auto_153670 ) ) ( not ( = ?auto_153666 ?auto_153667 ) ) ( not ( = ?auto_153666 ?auto_153668 ) ) ( not ( = ?auto_153666 ?auto_153669 ) ) ( not ( = ?auto_153666 ?auto_153670 ) ) ( not ( = ?auto_153667 ?auto_153668 ) ) ( not ( = ?auto_153667 ?auto_153669 ) ) ( not ( = ?auto_153667 ?auto_153670 ) ) ( not ( = ?auto_153668 ?auto_153669 ) ) ( not ( = ?auto_153668 ?auto_153670 ) ) ( not ( = ?auto_153669 ?auto_153670 ) ) ( not ( = ?auto_153665 ?auto_153673 ) ) ( not ( = ?auto_153666 ?auto_153673 ) ) ( not ( = ?auto_153667 ?auto_153673 ) ) ( not ( = ?auto_153668 ?auto_153673 ) ) ( not ( = ?auto_153669 ?auto_153673 ) ) ( not ( = ?auto_153670 ?auto_153673 ) ) ( ON-TABLE ?auto_153671 ) ( not ( = ?auto_153671 ?auto_153673 ) ) ( not ( = ?auto_153671 ?auto_153670 ) ) ( not ( = ?auto_153671 ?auto_153669 ) ) ( not ( = ?auto_153665 ?auto_153671 ) ) ( not ( = ?auto_153666 ?auto_153671 ) ) ( not ( = ?auto_153667 ?auto_153671 ) ) ( not ( = ?auto_153668 ?auto_153671 ) ) ( ON ?auto_153665 ?auto_153672 ) ( not ( = ?auto_153665 ?auto_153672 ) ) ( not ( = ?auto_153666 ?auto_153672 ) ) ( not ( = ?auto_153667 ?auto_153672 ) ) ( not ( = ?auto_153668 ?auto_153672 ) ) ( not ( = ?auto_153669 ?auto_153672 ) ) ( not ( = ?auto_153670 ?auto_153672 ) ) ( not ( = ?auto_153673 ?auto_153672 ) ) ( not ( = ?auto_153671 ?auto_153672 ) ) ( ON ?auto_153666 ?auto_153665 ) ( ON-TABLE ?auto_153672 ) ( ON ?auto_153667 ?auto_153666 ) ( ON ?auto_153668 ?auto_153667 ) ( ON ?auto_153669 ?auto_153668 ) ( ON ?auto_153670 ?auto_153669 ) ( CLEAR ?auto_153670 ) ( HOLDING ?auto_153673 ) ( CLEAR ?auto_153671 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153671 ?auto_153673 )
      ( MAKE-6PILE ?auto_153665 ?auto_153666 ?auto_153667 ?auto_153668 ?auto_153669 ?auto_153670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153674 - BLOCK
      ?auto_153675 - BLOCK
      ?auto_153676 - BLOCK
      ?auto_153677 - BLOCK
      ?auto_153678 - BLOCK
      ?auto_153679 - BLOCK
    )
    :vars
    (
      ?auto_153681 - BLOCK
      ?auto_153680 - BLOCK
      ?auto_153682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153674 ?auto_153675 ) ) ( not ( = ?auto_153674 ?auto_153676 ) ) ( not ( = ?auto_153674 ?auto_153677 ) ) ( not ( = ?auto_153674 ?auto_153678 ) ) ( not ( = ?auto_153674 ?auto_153679 ) ) ( not ( = ?auto_153675 ?auto_153676 ) ) ( not ( = ?auto_153675 ?auto_153677 ) ) ( not ( = ?auto_153675 ?auto_153678 ) ) ( not ( = ?auto_153675 ?auto_153679 ) ) ( not ( = ?auto_153676 ?auto_153677 ) ) ( not ( = ?auto_153676 ?auto_153678 ) ) ( not ( = ?auto_153676 ?auto_153679 ) ) ( not ( = ?auto_153677 ?auto_153678 ) ) ( not ( = ?auto_153677 ?auto_153679 ) ) ( not ( = ?auto_153678 ?auto_153679 ) ) ( not ( = ?auto_153674 ?auto_153681 ) ) ( not ( = ?auto_153675 ?auto_153681 ) ) ( not ( = ?auto_153676 ?auto_153681 ) ) ( not ( = ?auto_153677 ?auto_153681 ) ) ( not ( = ?auto_153678 ?auto_153681 ) ) ( not ( = ?auto_153679 ?auto_153681 ) ) ( ON-TABLE ?auto_153680 ) ( not ( = ?auto_153680 ?auto_153681 ) ) ( not ( = ?auto_153680 ?auto_153679 ) ) ( not ( = ?auto_153680 ?auto_153678 ) ) ( not ( = ?auto_153674 ?auto_153680 ) ) ( not ( = ?auto_153675 ?auto_153680 ) ) ( not ( = ?auto_153676 ?auto_153680 ) ) ( not ( = ?auto_153677 ?auto_153680 ) ) ( ON ?auto_153674 ?auto_153682 ) ( not ( = ?auto_153674 ?auto_153682 ) ) ( not ( = ?auto_153675 ?auto_153682 ) ) ( not ( = ?auto_153676 ?auto_153682 ) ) ( not ( = ?auto_153677 ?auto_153682 ) ) ( not ( = ?auto_153678 ?auto_153682 ) ) ( not ( = ?auto_153679 ?auto_153682 ) ) ( not ( = ?auto_153681 ?auto_153682 ) ) ( not ( = ?auto_153680 ?auto_153682 ) ) ( ON ?auto_153675 ?auto_153674 ) ( ON-TABLE ?auto_153682 ) ( ON ?auto_153676 ?auto_153675 ) ( ON ?auto_153677 ?auto_153676 ) ( ON ?auto_153678 ?auto_153677 ) ( ON ?auto_153679 ?auto_153678 ) ( CLEAR ?auto_153680 ) ( ON ?auto_153681 ?auto_153679 ) ( CLEAR ?auto_153681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153682 ?auto_153674 ?auto_153675 ?auto_153676 ?auto_153677 ?auto_153678 ?auto_153679 )
      ( MAKE-6PILE ?auto_153674 ?auto_153675 ?auto_153676 ?auto_153677 ?auto_153678 ?auto_153679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153683 - BLOCK
      ?auto_153684 - BLOCK
      ?auto_153685 - BLOCK
      ?auto_153686 - BLOCK
      ?auto_153687 - BLOCK
      ?auto_153688 - BLOCK
    )
    :vars
    (
      ?auto_153690 - BLOCK
      ?auto_153691 - BLOCK
      ?auto_153689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153683 ?auto_153684 ) ) ( not ( = ?auto_153683 ?auto_153685 ) ) ( not ( = ?auto_153683 ?auto_153686 ) ) ( not ( = ?auto_153683 ?auto_153687 ) ) ( not ( = ?auto_153683 ?auto_153688 ) ) ( not ( = ?auto_153684 ?auto_153685 ) ) ( not ( = ?auto_153684 ?auto_153686 ) ) ( not ( = ?auto_153684 ?auto_153687 ) ) ( not ( = ?auto_153684 ?auto_153688 ) ) ( not ( = ?auto_153685 ?auto_153686 ) ) ( not ( = ?auto_153685 ?auto_153687 ) ) ( not ( = ?auto_153685 ?auto_153688 ) ) ( not ( = ?auto_153686 ?auto_153687 ) ) ( not ( = ?auto_153686 ?auto_153688 ) ) ( not ( = ?auto_153687 ?auto_153688 ) ) ( not ( = ?auto_153683 ?auto_153690 ) ) ( not ( = ?auto_153684 ?auto_153690 ) ) ( not ( = ?auto_153685 ?auto_153690 ) ) ( not ( = ?auto_153686 ?auto_153690 ) ) ( not ( = ?auto_153687 ?auto_153690 ) ) ( not ( = ?auto_153688 ?auto_153690 ) ) ( not ( = ?auto_153691 ?auto_153690 ) ) ( not ( = ?auto_153691 ?auto_153688 ) ) ( not ( = ?auto_153691 ?auto_153687 ) ) ( not ( = ?auto_153683 ?auto_153691 ) ) ( not ( = ?auto_153684 ?auto_153691 ) ) ( not ( = ?auto_153685 ?auto_153691 ) ) ( not ( = ?auto_153686 ?auto_153691 ) ) ( ON ?auto_153683 ?auto_153689 ) ( not ( = ?auto_153683 ?auto_153689 ) ) ( not ( = ?auto_153684 ?auto_153689 ) ) ( not ( = ?auto_153685 ?auto_153689 ) ) ( not ( = ?auto_153686 ?auto_153689 ) ) ( not ( = ?auto_153687 ?auto_153689 ) ) ( not ( = ?auto_153688 ?auto_153689 ) ) ( not ( = ?auto_153690 ?auto_153689 ) ) ( not ( = ?auto_153691 ?auto_153689 ) ) ( ON ?auto_153684 ?auto_153683 ) ( ON-TABLE ?auto_153689 ) ( ON ?auto_153685 ?auto_153684 ) ( ON ?auto_153686 ?auto_153685 ) ( ON ?auto_153687 ?auto_153686 ) ( ON ?auto_153688 ?auto_153687 ) ( ON ?auto_153690 ?auto_153688 ) ( CLEAR ?auto_153690 ) ( HOLDING ?auto_153691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153691 )
      ( MAKE-6PILE ?auto_153683 ?auto_153684 ?auto_153685 ?auto_153686 ?auto_153687 ?auto_153688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_153692 - BLOCK
      ?auto_153693 - BLOCK
      ?auto_153694 - BLOCK
      ?auto_153695 - BLOCK
      ?auto_153696 - BLOCK
      ?auto_153697 - BLOCK
    )
    :vars
    (
      ?auto_153700 - BLOCK
      ?auto_153699 - BLOCK
      ?auto_153698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153692 ?auto_153693 ) ) ( not ( = ?auto_153692 ?auto_153694 ) ) ( not ( = ?auto_153692 ?auto_153695 ) ) ( not ( = ?auto_153692 ?auto_153696 ) ) ( not ( = ?auto_153692 ?auto_153697 ) ) ( not ( = ?auto_153693 ?auto_153694 ) ) ( not ( = ?auto_153693 ?auto_153695 ) ) ( not ( = ?auto_153693 ?auto_153696 ) ) ( not ( = ?auto_153693 ?auto_153697 ) ) ( not ( = ?auto_153694 ?auto_153695 ) ) ( not ( = ?auto_153694 ?auto_153696 ) ) ( not ( = ?auto_153694 ?auto_153697 ) ) ( not ( = ?auto_153695 ?auto_153696 ) ) ( not ( = ?auto_153695 ?auto_153697 ) ) ( not ( = ?auto_153696 ?auto_153697 ) ) ( not ( = ?auto_153692 ?auto_153700 ) ) ( not ( = ?auto_153693 ?auto_153700 ) ) ( not ( = ?auto_153694 ?auto_153700 ) ) ( not ( = ?auto_153695 ?auto_153700 ) ) ( not ( = ?auto_153696 ?auto_153700 ) ) ( not ( = ?auto_153697 ?auto_153700 ) ) ( not ( = ?auto_153699 ?auto_153700 ) ) ( not ( = ?auto_153699 ?auto_153697 ) ) ( not ( = ?auto_153699 ?auto_153696 ) ) ( not ( = ?auto_153692 ?auto_153699 ) ) ( not ( = ?auto_153693 ?auto_153699 ) ) ( not ( = ?auto_153694 ?auto_153699 ) ) ( not ( = ?auto_153695 ?auto_153699 ) ) ( ON ?auto_153692 ?auto_153698 ) ( not ( = ?auto_153692 ?auto_153698 ) ) ( not ( = ?auto_153693 ?auto_153698 ) ) ( not ( = ?auto_153694 ?auto_153698 ) ) ( not ( = ?auto_153695 ?auto_153698 ) ) ( not ( = ?auto_153696 ?auto_153698 ) ) ( not ( = ?auto_153697 ?auto_153698 ) ) ( not ( = ?auto_153700 ?auto_153698 ) ) ( not ( = ?auto_153699 ?auto_153698 ) ) ( ON ?auto_153693 ?auto_153692 ) ( ON-TABLE ?auto_153698 ) ( ON ?auto_153694 ?auto_153693 ) ( ON ?auto_153695 ?auto_153694 ) ( ON ?auto_153696 ?auto_153695 ) ( ON ?auto_153697 ?auto_153696 ) ( ON ?auto_153700 ?auto_153697 ) ( ON ?auto_153699 ?auto_153700 ) ( CLEAR ?auto_153699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_153698 ?auto_153692 ?auto_153693 ?auto_153694 ?auto_153695 ?auto_153696 ?auto_153697 ?auto_153700 )
      ( MAKE-6PILE ?auto_153692 ?auto_153693 ?auto_153694 ?auto_153695 ?auto_153696 ?auto_153697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153712 - BLOCK
    )
    :vars
    (
      ?auto_153713 - BLOCK
      ?auto_153714 - BLOCK
      ?auto_153715 - BLOCK
      ?auto_153717 - BLOCK
      ?auto_153716 - BLOCK
      ?auto_153719 - BLOCK
      ?auto_153718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153713 ?auto_153712 ) ( ON-TABLE ?auto_153712 ) ( not ( = ?auto_153712 ?auto_153713 ) ) ( not ( = ?auto_153712 ?auto_153714 ) ) ( not ( = ?auto_153712 ?auto_153715 ) ) ( not ( = ?auto_153713 ?auto_153714 ) ) ( not ( = ?auto_153713 ?auto_153715 ) ) ( not ( = ?auto_153714 ?auto_153715 ) ) ( ON ?auto_153714 ?auto_153713 ) ( CLEAR ?auto_153714 ) ( HOLDING ?auto_153715 ) ( CLEAR ?auto_153717 ) ( ON-TABLE ?auto_153716 ) ( ON ?auto_153719 ?auto_153716 ) ( ON ?auto_153718 ?auto_153719 ) ( ON ?auto_153717 ?auto_153718 ) ( not ( = ?auto_153716 ?auto_153719 ) ) ( not ( = ?auto_153716 ?auto_153718 ) ) ( not ( = ?auto_153716 ?auto_153717 ) ) ( not ( = ?auto_153716 ?auto_153715 ) ) ( not ( = ?auto_153719 ?auto_153718 ) ) ( not ( = ?auto_153719 ?auto_153717 ) ) ( not ( = ?auto_153719 ?auto_153715 ) ) ( not ( = ?auto_153718 ?auto_153717 ) ) ( not ( = ?auto_153718 ?auto_153715 ) ) ( not ( = ?auto_153717 ?auto_153715 ) ) ( not ( = ?auto_153712 ?auto_153717 ) ) ( not ( = ?auto_153712 ?auto_153716 ) ) ( not ( = ?auto_153712 ?auto_153719 ) ) ( not ( = ?auto_153712 ?auto_153718 ) ) ( not ( = ?auto_153713 ?auto_153717 ) ) ( not ( = ?auto_153713 ?auto_153716 ) ) ( not ( = ?auto_153713 ?auto_153719 ) ) ( not ( = ?auto_153713 ?auto_153718 ) ) ( not ( = ?auto_153714 ?auto_153717 ) ) ( not ( = ?auto_153714 ?auto_153716 ) ) ( not ( = ?auto_153714 ?auto_153719 ) ) ( not ( = ?auto_153714 ?auto_153718 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153716 ?auto_153719 ?auto_153718 ?auto_153717 ?auto_153715 )
      ( MAKE-1PILE ?auto_153712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153720 - BLOCK
    )
    :vars
    (
      ?auto_153722 - BLOCK
      ?auto_153725 - BLOCK
      ?auto_153723 - BLOCK
      ?auto_153727 - BLOCK
      ?auto_153726 - BLOCK
      ?auto_153724 - BLOCK
      ?auto_153721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153722 ?auto_153720 ) ( ON-TABLE ?auto_153720 ) ( not ( = ?auto_153720 ?auto_153722 ) ) ( not ( = ?auto_153720 ?auto_153725 ) ) ( not ( = ?auto_153720 ?auto_153723 ) ) ( not ( = ?auto_153722 ?auto_153725 ) ) ( not ( = ?auto_153722 ?auto_153723 ) ) ( not ( = ?auto_153725 ?auto_153723 ) ) ( ON ?auto_153725 ?auto_153722 ) ( CLEAR ?auto_153727 ) ( ON-TABLE ?auto_153726 ) ( ON ?auto_153724 ?auto_153726 ) ( ON ?auto_153721 ?auto_153724 ) ( ON ?auto_153727 ?auto_153721 ) ( not ( = ?auto_153726 ?auto_153724 ) ) ( not ( = ?auto_153726 ?auto_153721 ) ) ( not ( = ?auto_153726 ?auto_153727 ) ) ( not ( = ?auto_153726 ?auto_153723 ) ) ( not ( = ?auto_153724 ?auto_153721 ) ) ( not ( = ?auto_153724 ?auto_153727 ) ) ( not ( = ?auto_153724 ?auto_153723 ) ) ( not ( = ?auto_153721 ?auto_153727 ) ) ( not ( = ?auto_153721 ?auto_153723 ) ) ( not ( = ?auto_153727 ?auto_153723 ) ) ( not ( = ?auto_153720 ?auto_153727 ) ) ( not ( = ?auto_153720 ?auto_153726 ) ) ( not ( = ?auto_153720 ?auto_153724 ) ) ( not ( = ?auto_153720 ?auto_153721 ) ) ( not ( = ?auto_153722 ?auto_153727 ) ) ( not ( = ?auto_153722 ?auto_153726 ) ) ( not ( = ?auto_153722 ?auto_153724 ) ) ( not ( = ?auto_153722 ?auto_153721 ) ) ( not ( = ?auto_153725 ?auto_153727 ) ) ( not ( = ?auto_153725 ?auto_153726 ) ) ( not ( = ?auto_153725 ?auto_153724 ) ) ( not ( = ?auto_153725 ?auto_153721 ) ) ( ON ?auto_153723 ?auto_153725 ) ( CLEAR ?auto_153723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153720 ?auto_153722 ?auto_153725 )
      ( MAKE-1PILE ?auto_153720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153728 - BLOCK
    )
    :vars
    (
      ?auto_153735 - BLOCK
      ?auto_153732 - BLOCK
      ?auto_153730 - BLOCK
      ?auto_153734 - BLOCK
      ?auto_153729 - BLOCK
      ?auto_153733 - BLOCK
      ?auto_153731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153735 ?auto_153728 ) ( ON-TABLE ?auto_153728 ) ( not ( = ?auto_153728 ?auto_153735 ) ) ( not ( = ?auto_153728 ?auto_153732 ) ) ( not ( = ?auto_153728 ?auto_153730 ) ) ( not ( = ?auto_153735 ?auto_153732 ) ) ( not ( = ?auto_153735 ?auto_153730 ) ) ( not ( = ?auto_153732 ?auto_153730 ) ) ( ON ?auto_153732 ?auto_153735 ) ( ON-TABLE ?auto_153734 ) ( ON ?auto_153729 ?auto_153734 ) ( ON ?auto_153733 ?auto_153729 ) ( not ( = ?auto_153734 ?auto_153729 ) ) ( not ( = ?auto_153734 ?auto_153733 ) ) ( not ( = ?auto_153734 ?auto_153731 ) ) ( not ( = ?auto_153734 ?auto_153730 ) ) ( not ( = ?auto_153729 ?auto_153733 ) ) ( not ( = ?auto_153729 ?auto_153731 ) ) ( not ( = ?auto_153729 ?auto_153730 ) ) ( not ( = ?auto_153733 ?auto_153731 ) ) ( not ( = ?auto_153733 ?auto_153730 ) ) ( not ( = ?auto_153731 ?auto_153730 ) ) ( not ( = ?auto_153728 ?auto_153731 ) ) ( not ( = ?auto_153728 ?auto_153734 ) ) ( not ( = ?auto_153728 ?auto_153729 ) ) ( not ( = ?auto_153728 ?auto_153733 ) ) ( not ( = ?auto_153735 ?auto_153731 ) ) ( not ( = ?auto_153735 ?auto_153734 ) ) ( not ( = ?auto_153735 ?auto_153729 ) ) ( not ( = ?auto_153735 ?auto_153733 ) ) ( not ( = ?auto_153732 ?auto_153731 ) ) ( not ( = ?auto_153732 ?auto_153734 ) ) ( not ( = ?auto_153732 ?auto_153729 ) ) ( not ( = ?auto_153732 ?auto_153733 ) ) ( ON ?auto_153730 ?auto_153732 ) ( CLEAR ?auto_153730 ) ( HOLDING ?auto_153731 ) ( CLEAR ?auto_153733 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153734 ?auto_153729 ?auto_153733 ?auto_153731 )
      ( MAKE-1PILE ?auto_153728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153736 - BLOCK
    )
    :vars
    (
      ?auto_153740 - BLOCK
      ?auto_153741 - BLOCK
      ?auto_153738 - BLOCK
      ?auto_153742 - BLOCK
      ?auto_153739 - BLOCK
      ?auto_153743 - BLOCK
      ?auto_153737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153740 ?auto_153736 ) ( ON-TABLE ?auto_153736 ) ( not ( = ?auto_153736 ?auto_153740 ) ) ( not ( = ?auto_153736 ?auto_153741 ) ) ( not ( = ?auto_153736 ?auto_153738 ) ) ( not ( = ?auto_153740 ?auto_153741 ) ) ( not ( = ?auto_153740 ?auto_153738 ) ) ( not ( = ?auto_153741 ?auto_153738 ) ) ( ON ?auto_153741 ?auto_153740 ) ( ON-TABLE ?auto_153742 ) ( ON ?auto_153739 ?auto_153742 ) ( ON ?auto_153743 ?auto_153739 ) ( not ( = ?auto_153742 ?auto_153739 ) ) ( not ( = ?auto_153742 ?auto_153743 ) ) ( not ( = ?auto_153742 ?auto_153737 ) ) ( not ( = ?auto_153742 ?auto_153738 ) ) ( not ( = ?auto_153739 ?auto_153743 ) ) ( not ( = ?auto_153739 ?auto_153737 ) ) ( not ( = ?auto_153739 ?auto_153738 ) ) ( not ( = ?auto_153743 ?auto_153737 ) ) ( not ( = ?auto_153743 ?auto_153738 ) ) ( not ( = ?auto_153737 ?auto_153738 ) ) ( not ( = ?auto_153736 ?auto_153737 ) ) ( not ( = ?auto_153736 ?auto_153742 ) ) ( not ( = ?auto_153736 ?auto_153739 ) ) ( not ( = ?auto_153736 ?auto_153743 ) ) ( not ( = ?auto_153740 ?auto_153737 ) ) ( not ( = ?auto_153740 ?auto_153742 ) ) ( not ( = ?auto_153740 ?auto_153739 ) ) ( not ( = ?auto_153740 ?auto_153743 ) ) ( not ( = ?auto_153741 ?auto_153737 ) ) ( not ( = ?auto_153741 ?auto_153742 ) ) ( not ( = ?auto_153741 ?auto_153739 ) ) ( not ( = ?auto_153741 ?auto_153743 ) ) ( ON ?auto_153738 ?auto_153741 ) ( CLEAR ?auto_153743 ) ( ON ?auto_153737 ?auto_153738 ) ( CLEAR ?auto_153737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153736 ?auto_153740 ?auto_153741 ?auto_153738 )
      ( MAKE-1PILE ?auto_153736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153744 - BLOCK
    )
    :vars
    (
      ?auto_153751 - BLOCK
      ?auto_153749 - BLOCK
      ?auto_153745 - BLOCK
      ?auto_153747 - BLOCK
      ?auto_153748 - BLOCK
      ?auto_153750 - BLOCK
      ?auto_153746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153751 ?auto_153744 ) ( ON-TABLE ?auto_153744 ) ( not ( = ?auto_153744 ?auto_153751 ) ) ( not ( = ?auto_153744 ?auto_153749 ) ) ( not ( = ?auto_153744 ?auto_153745 ) ) ( not ( = ?auto_153751 ?auto_153749 ) ) ( not ( = ?auto_153751 ?auto_153745 ) ) ( not ( = ?auto_153749 ?auto_153745 ) ) ( ON ?auto_153749 ?auto_153751 ) ( ON-TABLE ?auto_153747 ) ( ON ?auto_153748 ?auto_153747 ) ( not ( = ?auto_153747 ?auto_153748 ) ) ( not ( = ?auto_153747 ?auto_153750 ) ) ( not ( = ?auto_153747 ?auto_153746 ) ) ( not ( = ?auto_153747 ?auto_153745 ) ) ( not ( = ?auto_153748 ?auto_153750 ) ) ( not ( = ?auto_153748 ?auto_153746 ) ) ( not ( = ?auto_153748 ?auto_153745 ) ) ( not ( = ?auto_153750 ?auto_153746 ) ) ( not ( = ?auto_153750 ?auto_153745 ) ) ( not ( = ?auto_153746 ?auto_153745 ) ) ( not ( = ?auto_153744 ?auto_153746 ) ) ( not ( = ?auto_153744 ?auto_153747 ) ) ( not ( = ?auto_153744 ?auto_153748 ) ) ( not ( = ?auto_153744 ?auto_153750 ) ) ( not ( = ?auto_153751 ?auto_153746 ) ) ( not ( = ?auto_153751 ?auto_153747 ) ) ( not ( = ?auto_153751 ?auto_153748 ) ) ( not ( = ?auto_153751 ?auto_153750 ) ) ( not ( = ?auto_153749 ?auto_153746 ) ) ( not ( = ?auto_153749 ?auto_153747 ) ) ( not ( = ?auto_153749 ?auto_153748 ) ) ( not ( = ?auto_153749 ?auto_153750 ) ) ( ON ?auto_153745 ?auto_153749 ) ( ON ?auto_153746 ?auto_153745 ) ( CLEAR ?auto_153746 ) ( HOLDING ?auto_153750 ) ( CLEAR ?auto_153748 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153747 ?auto_153748 ?auto_153750 )
      ( MAKE-1PILE ?auto_153744 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153752 - BLOCK
    )
    :vars
    (
      ?auto_153754 - BLOCK
      ?auto_153755 - BLOCK
      ?auto_153756 - BLOCK
      ?auto_153757 - BLOCK
      ?auto_153758 - BLOCK
      ?auto_153759 - BLOCK
      ?auto_153753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153754 ?auto_153752 ) ( ON-TABLE ?auto_153752 ) ( not ( = ?auto_153752 ?auto_153754 ) ) ( not ( = ?auto_153752 ?auto_153755 ) ) ( not ( = ?auto_153752 ?auto_153756 ) ) ( not ( = ?auto_153754 ?auto_153755 ) ) ( not ( = ?auto_153754 ?auto_153756 ) ) ( not ( = ?auto_153755 ?auto_153756 ) ) ( ON ?auto_153755 ?auto_153754 ) ( ON-TABLE ?auto_153757 ) ( ON ?auto_153758 ?auto_153757 ) ( not ( = ?auto_153757 ?auto_153758 ) ) ( not ( = ?auto_153757 ?auto_153759 ) ) ( not ( = ?auto_153757 ?auto_153753 ) ) ( not ( = ?auto_153757 ?auto_153756 ) ) ( not ( = ?auto_153758 ?auto_153759 ) ) ( not ( = ?auto_153758 ?auto_153753 ) ) ( not ( = ?auto_153758 ?auto_153756 ) ) ( not ( = ?auto_153759 ?auto_153753 ) ) ( not ( = ?auto_153759 ?auto_153756 ) ) ( not ( = ?auto_153753 ?auto_153756 ) ) ( not ( = ?auto_153752 ?auto_153753 ) ) ( not ( = ?auto_153752 ?auto_153757 ) ) ( not ( = ?auto_153752 ?auto_153758 ) ) ( not ( = ?auto_153752 ?auto_153759 ) ) ( not ( = ?auto_153754 ?auto_153753 ) ) ( not ( = ?auto_153754 ?auto_153757 ) ) ( not ( = ?auto_153754 ?auto_153758 ) ) ( not ( = ?auto_153754 ?auto_153759 ) ) ( not ( = ?auto_153755 ?auto_153753 ) ) ( not ( = ?auto_153755 ?auto_153757 ) ) ( not ( = ?auto_153755 ?auto_153758 ) ) ( not ( = ?auto_153755 ?auto_153759 ) ) ( ON ?auto_153756 ?auto_153755 ) ( ON ?auto_153753 ?auto_153756 ) ( CLEAR ?auto_153758 ) ( ON ?auto_153759 ?auto_153753 ) ( CLEAR ?auto_153759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153752 ?auto_153754 ?auto_153755 ?auto_153756 ?auto_153753 )
      ( MAKE-1PILE ?auto_153752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153760 - BLOCK
    )
    :vars
    (
      ?auto_153763 - BLOCK
      ?auto_153761 - BLOCK
      ?auto_153767 - BLOCK
      ?auto_153765 - BLOCK
      ?auto_153764 - BLOCK
      ?auto_153766 - BLOCK
      ?auto_153762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153763 ?auto_153760 ) ( ON-TABLE ?auto_153760 ) ( not ( = ?auto_153760 ?auto_153763 ) ) ( not ( = ?auto_153760 ?auto_153761 ) ) ( not ( = ?auto_153760 ?auto_153767 ) ) ( not ( = ?auto_153763 ?auto_153761 ) ) ( not ( = ?auto_153763 ?auto_153767 ) ) ( not ( = ?auto_153761 ?auto_153767 ) ) ( ON ?auto_153761 ?auto_153763 ) ( ON-TABLE ?auto_153765 ) ( not ( = ?auto_153765 ?auto_153764 ) ) ( not ( = ?auto_153765 ?auto_153766 ) ) ( not ( = ?auto_153765 ?auto_153762 ) ) ( not ( = ?auto_153765 ?auto_153767 ) ) ( not ( = ?auto_153764 ?auto_153766 ) ) ( not ( = ?auto_153764 ?auto_153762 ) ) ( not ( = ?auto_153764 ?auto_153767 ) ) ( not ( = ?auto_153766 ?auto_153762 ) ) ( not ( = ?auto_153766 ?auto_153767 ) ) ( not ( = ?auto_153762 ?auto_153767 ) ) ( not ( = ?auto_153760 ?auto_153762 ) ) ( not ( = ?auto_153760 ?auto_153765 ) ) ( not ( = ?auto_153760 ?auto_153764 ) ) ( not ( = ?auto_153760 ?auto_153766 ) ) ( not ( = ?auto_153763 ?auto_153762 ) ) ( not ( = ?auto_153763 ?auto_153765 ) ) ( not ( = ?auto_153763 ?auto_153764 ) ) ( not ( = ?auto_153763 ?auto_153766 ) ) ( not ( = ?auto_153761 ?auto_153762 ) ) ( not ( = ?auto_153761 ?auto_153765 ) ) ( not ( = ?auto_153761 ?auto_153764 ) ) ( not ( = ?auto_153761 ?auto_153766 ) ) ( ON ?auto_153767 ?auto_153761 ) ( ON ?auto_153762 ?auto_153767 ) ( ON ?auto_153766 ?auto_153762 ) ( CLEAR ?auto_153766 ) ( HOLDING ?auto_153764 ) ( CLEAR ?auto_153765 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153765 ?auto_153764 )
      ( MAKE-1PILE ?auto_153760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153768 - BLOCK
    )
    :vars
    (
      ?auto_153769 - BLOCK
      ?auto_153775 - BLOCK
      ?auto_153772 - BLOCK
      ?auto_153773 - BLOCK
      ?auto_153774 - BLOCK
      ?auto_153770 - BLOCK
      ?auto_153771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153769 ?auto_153768 ) ( ON-TABLE ?auto_153768 ) ( not ( = ?auto_153768 ?auto_153769 ) ) ( not ( = ?auto_153768 ?auto_153775 ) ) ( not ( = ?auto_153768 ?auto_153772 ) ) ( not ( = ?auto_153769 ?auto_153775 ) ) ( not ( = ?auto_153769 ?auto_153772 ) ) ( not ( = ?auto_153775 ?auto_153772 ) ) ( ON ?auto_153775 ?auto_153769 ) ( ON-TABLE ?auto_153773 ) ( not ( = ?auto_153773 ?auto_153774 ) ) ( not ( = ?auto_153773 ?auto_153770 ) ) ( not ( = ?auto_153773 ?auto_153771 ) ) ( not ( = ?auto_153773 ?auto_153772 ) ) ( not ( = ?auto_153774 ?auto_153770 ) ) ( not ( = ?auto_153774 ?auto_153771 ) ) ( not ( = ?auto_153774 ?auto_153772 ) ) ( not ( = ?auto_153770 ?auto_153771 ) ) ( not ( = ?auto_153770 ?auto_153772 ) ) ( not ( = ?auto_153771 ?auto_153772 ) ) ( not ( = ?auto_153768 ?auto_153771 ) ) ( not ( = ?auto_153768 ?auto_153773 ) ) ( not ( = ?auto_153768 ?auto_153774 ) ) ( not ( = ?auto_153768 ?auto_153770 ) ) ( not ( = ?auto_153769 ?auto_153771 ) ) ( not ( = ?auto_153769 ?auto_153773 ) ) ( not ( = ?auto_153769 ?auto_153774 ) ) ( not ( = ?auto_153769 ?auto_153770 ) ) ( not ( = ?auto_153775 ?auto_153771 ) ) ( not ( = ?auto_153775 ?auto_153773 ) ) ( not ( = ?auto_153775 ?auto_153774 ) ) ( not ( = ?auto_153775 ?auto_153770 ) ) ( ON ?auto_153772 ?auto_153775 ) ( ON ?auto_153771 ?auto_153772 ) ( ON ?auto_153770 ?auto_153771 ) ( CLEAR ?auto_153773 ) ( ON ?auto_153774 ?auto_153770 ) ( CLEAR ?auto_153774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153768 ?auto_153769 ?auto_153775 ?auto_153772 ?auto_153771 ?auto_153770 )
      ( MAKE-1PILE ?auto_153768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153776 - BLOCK
    )
    :vars
    (
      ?auto_153779 - BLOCK
      ?auto_153783 - BLOCK
      ?auto_153778 - BLOCK
      ?auto_153781 - BLOCK
      ?auto_153780 - BLOCK
      ?auto_153777 - BLOCK
      ?auto_153782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153779 ?auto_153776 ) ( ON-TABLE ?auto_153776 ) ( not ( = ?auto_153776 ?auto_153779 ) ) ( not ( = ?auto_153776 ?auto_153783 ) ) ( not ( = ?auto_153776 ?auto_153778 ) ) ( not ( = ?auto_153779 ?auto_153783 ) ) ( not ( = ?auto_153779 ?auto_153778 ) ) ( not ( = ?auto_153783 ?auto_153778 ) ) ( ON ?auto_153783 ?auto_153779 ) ( not ( = ?auto_153781 ?auto_153780 ) ) ( not ( = ?auto_153781 ?auto_153777 ) ) ( not ( = ?auto_153781 ?auto_153782 ) ) ( not ( = ?auto_153781 ?auto_153778 ) ) ( not ( = ?auto_153780 ?auto_153777 ) ) ( not ( = ?auto_153780 ?auto_153782 ) ) ( not ( = ?auto_153780 ?auto_153778 ) ) ( not ( = ?auto_153777 ?auto_153782 ) ) ( not ( = ?auto_153777 ?auto_153778 ) ) ( not ( = ?auto_153782 ?auto_153778 ) ) ( not ( = ?auto_153776 ?auto_153782 ) ) ( not ( = ?auto_153776 ?auto_153781 ) ) ( not ( = ?auto_153776 ?auto_153780 ) ) ( not ( = ?auto_153776 ?auto_153777 ) ) ( not ( = ?auto_153779 ?auto_153782 ) ) ( not ( = ?auto_153779 ?auto_153781 ) ) ( not ( = ?auto_153779 ?auto_153780 ) ) ( not ( = ?auto_153779 ?auto_153777 ) ) ( not ( = ?auto_153783 ?auto_153782 ) ) ( not ( = ?auto_153783 ?auto_153781 ) ) ( not ( = ?auto_153783 ?auto_153780 ) ) ( not ( = ?auto_153783 ?auto_153777 ) ) ( ON ?auto_153778 ?auto_153783 ) ( ON ?auto_153782 ?auto_153778 ) ( ON ?auto_153777 ?auto_153782 ) ( ON ?auto_153780 ?auto_153777 ) ( CLEAR ?auto_153780 ) ( HOLDING ?auto_153781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153781 )
      ( MAKE-1PILE ?auto_153776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153793 - BLOCK
    )
    :vars
    (
      ?auto_153799 - BLOCK
      ?auto_153797 - BLOCK
      ?auto_153794 - BLOCK
      ?auto_153795 - BLOCK
      ?auto_153796 - BLOCK
      ?auto_153800 - BLOCK
      ?auto_153798 - BLOCK
      ?auto_153801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153799 ?auto_153793 ) ( ON-TABLE ?auto_153793 ) ( not ( = ?auto_153793 ?auto_153799 ) ) ( not ( = ?auto_153793 ?auto_153797 ) ) ( not ( = ?auto_153793 ?auto_153794 ) ) ( not ( = ?auto_153799 ?auto_153797 ) ) ( not ( = ?auto_153799 ?auto_153794 ) ) ( not ( = ?auto_153797 ?auto_153794 ) ) ( ON ?auto_153797 ?auto_153799 ) ( not ( = ?auto_153795 ?auto_153796 ) ) ( not ( = ?auto_153795 ?auto_153800 ) ) ( not ( = ?auto_153795 ?auto_153798 ) ) ( not ( = ?auto_153795 ?auto_153794 ) ) ( not ( = ?auto_153796 ?auto_153800 ) ) ( not ( = ?auto_153796 ?auto_153798 ) ) ( not ( = ?auto_153796 ?auto_153794 ) ) ( not ( = ?auto_153800 ?auto_153798 ) ) ( not ( = ?auto_153800 ?auto_153794 ) ) ( not ( = ?auto_153798 ?auto_153794 ) ) ( not ( = ?auto_153793 ?auto_153798 ) ) ( not ( = ?auto_153793 ?auto_153795 ) ) ( not ( = ?auto_153793 ?auto_153796 ) ) ( not ( = ?auto_153793 ?auto_153800 ) ) ( not ( = ?auto_153799 ?auto_153798 ) ) ( not ( = ?auto_153799 ?auto_153795 ) ) ( not ( = ?auto_153799 ?auto_153796 ) ) ( not ( = ?auto_153799 ?auto_153800 ) ) ( not ( = ?auto_153797 ?auto_153798 ) ) ( not ( = ?auto_153797 ?auto_153795 ) ) ( not ( = ?auto_153797 ?auto_153796 ) ) ( not ( = ?auto_153797 ?auto_153800 ) ) ( ON ?auto_153794 ?auto_153797 ) ( ON ?auto_153798 ?auto_153794 ) ( ON ?auto_153800 ?auto_153798 ) ( ON ?auto_153796 ?auto_153800 ) ( CLEAR ?auto_153796 ) ( ON ?auto_153795 ?auto_153801 ) ( CLEAR ?auto_153795 ) ( HAND-EMPTY ) ( not ( = ?auto_153793 ?auto_153801 ) ) ( not ( = ?auto_153799 ?auto_153801 ) ) ( not ( = ?auto_153797 ?auto_153801 ) ) ( not ( = ?auto_153794 ?auto_153801 ) ) ( not ( = ?auto_153795 ?auto_153801 ) ) ( not ( = ?auto_153796 ?auto_153801 ) ) ( not ( = ?auto_153800 ?auto_153801 ) ) ( not ( = ?auto_153798 ?auto_153801 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153795 ?auto_153801 )
      ( MAKE-1PILE ?auto_153793 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153802 - BLOCK
    )
    :vars
    (
      ?auto_153804 - BLOCK
      ?auto_153805 - BLOCK
      ?auto_153807 - BLOCK
      ?auto_153808 - BLOCK
      ?auto_153809 - BLOCK
      ?auto_153806 - BLOCK
      ?auto_153810 - BLOCK
      ?auto_153803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153804 ?auto_153802 ) ( ON-TABLE ?auto_153802 ) ( not ( = ?auto_153802 ?auto_153804 ) ) ( not ( = ?auto_153802 ?auto_153805 ) ) ( not ( = ?auto_153802 ?auto_153807 ) ) ( not ( = ?auto_153804 ?auto_153805 ) ) ( not ( = ?auto_153804 ?auto_153807 ) ) ( not ( = ?auto_153805 ?auto_153807 ) ) ( ON ?auto_153805 ?auto_153804 ) ( not ( = ?auto_153808 ?auto_153809 ) ) ( not ( = ?auto_153808 ?auto_153806 ) ) ( not ( = ?auto_153808 ?auto_153810 ) ) ( not ( = ?auto_153808 ?auto_153807 ) ) ( not ( = ?auto_153809 ?auto_153806 ) ) ( not ( = ?auto_153809 ?auto_153810 ) ) ( not ( = ?auto_153809 ?auto_153807 ) ) ( not ( = ?auto_153806 ?auto_153810 ) ) ( not ( = ?auto_153806 ?auto_153807 ) ) ( not ( = ?auto_153810 ?auto_153807 ) ) ( not ( = ?auto_153802 ?auto_153810 ) ) ( not ( = ?auto_153802 ?auto_153808 ) ) ( not ( = ?auto_153802 ?auto_153809 ) ) ( not ( = ?auto_153802 ?auto_153806 ) ) ( not ( = ?auto_153804 ?auto_153810 ) ) ( not ( = ?auto_153804 ?auto_153808 ) ) ( not ( = ?auto_153804 ?auto_153809 ) ) ( not ( = ?auto_153804 ?auto_153806 ) ) ( not ( = ?auto_153805 ?auto_153810 ) ) ( not ( = ?auto_153805 ?auto_153808 ) ) ( not ( = ?auto_153805 ?auto_153809 ) ) ( not ( = ?auto_153805 ?auto_153806 ) ) ( ON ?auto_153807 ?auto_153805 ) ( ON ?auto_153810 ?auto_153807 ) ( ON ?auto_153806 ?auto_153810 ) ( ON ?auto_153808 ?auto_153803 ) ( CLEAR ?auto_153808 ) ( not ( = ?auto_153802 ?auto_153803 ) ) ( not ( = ?auto_153804 ?auto_153803 ) ) ( not ( = ?auto_153805 ?auto_153803 ) ) ( not ( = ?auto_153807 ?auto_153803 ) ) ( not ( = ?auto_153808 ?auto_153803 ) ) ( not ( = ?auto_153809 ?auto_153803 ) ) ( not ( = ?auto_153806 ?auto_153803 ) ) ( not ( = ?auto_153810 ?auto_153803 ) ) ( HOLDING ?auto_153809 ) ( CLEAR ?auto_153806 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153802 ?auto_153804 ?auto_153805 ?auto_153807 ?auto_153810 ?auto_153806 ?auto_153809 )
      ( MAKE-1PILE ?auto_153802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153811 - BLOCK
    )
    :vars
    (
      ?auto_153816 - BLOCK
      ?auto_153819 - BLOCK
      ?auto_153813 - BLOCK
      ?auto_153817 - BLOCK
      ?auto_153814 - BLOCK
      ?auto_153818 - BLOCK
      ?auto_153815 - BLOCK
      ?auto_153812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153816 ?auto_153811 ) ( ON-TABLE ?auto_153811 ) ( not ( = ?auto_153811 ?auto_153816 ) ) ( not ( = ?auto_153811 ?auto_153819 ) ) ( not ( = ?auto_153811 ?auto_153813 ) ) ( not ( = ?auto_153816 ?auto_153819 ) ) ( not ( = ?auto_153816 ?auto_153813 ) ) ( not ( = ?auto_153819 ?auto_153813 ) ) ( ON ?auto_153819 ?auto_153816 ) ( not ( = ?auto_153817 ?auto_153814 ) ) ( not ( = ?auto_153817 ?auto_153818 ) ) ( not ( = ?auto_153817 ?auto_153815 ) ) ( not ( = ?auto_153817 ?auto_153813 ) ) ( not ( = ?auto_153814 ?auto_153818 ) ) ( not ( = ?auto_153814 ?auto_153815 ) ) ( not ( = ?auto_153814 ?auto_153813 ) ) ( not ( = ?auto_153818 ?auto_153815 ) ) ( not ( = ?auto_153818 ?auto_153813 ) ) ( not ( = ?auto_153815 ?auto_153813 ) ) ( not ( = ?auto_153811 ?auto_153815 ) ) ( not ( = ?auto_153811 ?auto_153817 ) ) ( not ( = ?auto_153811 ?auto_153814 ) ) ( not ( = ?auto_153811 ?auto_153818 ) ) ( not ( = ?auto_153816 ?auto_153815 ) ) ( not ( = ?auto_153816 ?auto_153817 ) ) ( not ( = ?auto_153816 ?auto_153814 ) ) ( not ( = ?auto_153816 ?auto_153818 ) ) ( not ( = ?auto_153819 ?auto_153815 ) ) ( not ( = ?auto_153819 ?auto_153817 ) ) ( not ( = ?auto_153819 ?auto_153814 ) ) ( not ( = ?auto_153819 ?auto_153818 ) ) ( ON ?auto_153813 ?auto_153819 ) ( ON ?auto_153815 ?auto_153813 ) ( ON ?auto_153818 ?auto_153815 ) ( ON ?auto_153817 ?auto_153812 ) ( not ( = ?auto_153811 ?auto_153812 ) ) ( not ( = ?auto_153816 ?auto_153812 ) ) ( not ( = ?auto_153819 ?auto_153812 ) ) ( not ( = ?auto_153813 ?auto_153812 ) ) ( not ( = ?auto_153817 ?auto_153812 ) ) ( not ( = ?auto_153814 ?auto_153812 ) ) ( not ( = ?auto_153818 ?auto_153812 ) ) ( not ( = ?auto_153815 ?auto_153812 ) ) ( CLEAR ?auto_153818 ) ( ON ?auto_153814 ?auto_153817 ) ( CLEAR ?auto_153814 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153812 ?auto_153817 )
      ( MAKE-1PILE ?auto_153811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153820 - BLOCK
    )
    :vars
    (
      ?auto_153828 - BLOCK
      ?auto_153823 - BLOCK
      ?auto_153826 - BLOCK
      ?auto_153825 - BLOCK
      ?auto_153824 - BLOCK
      ?auto_153822 - BLOCK
      ?auto_153821 - BLOCK
      ?auto_153827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153828 ?auto_153820 ) ( ON-TABLE ?auto_153820 ) ( not ( = ?auto_153820 ?auto_153828 ) ) ( not ( = ?auto_153820 ?auto_153823 ) ) ( not ( = ?auto_153820 ?auto_153826 ) ) ( not ( = ?auto_153828 ?auto_153823 ) ) ( not ( = ?auto_153828 ?auto_153826 ) ) ( not ( = ?auto_153823 ?auto_153826 ) ) ( ON ?auto_153823 ?auto_153828 ) ( not ( = ?auto_153825 ?auto_153824 ) ) ( not ( = ?auto_153825 ?auto_153822 ) ) ( not ( = ?auto_153825 ?auto_153821 ) ) ( not ( = ?auto_153825 ?auto_153826 ) ) ( not ( = ?auto_153824 ?auto_153822 ) ) ( not ( = ?auto_153824 ?auto_153821 ) ) ( not ( = ?auto_153824 ?auto_153826 ) ) ( not ( = ?auto_153822 ?auto_153821 ) ) ( not ( = ?auto_153822 ?auto_153826 ) ) ( not ( = ?auto_153821 ?auto_153826 ) ) ( not ( = ?auto_153820 ?auto_153821 ) ) ( not ( = ?auto_153820 ?auto_153825 ) ) ( not ( = ?auto_153820 ?auto_153824 ) ) ( not ( = ?auto_153820 ?auto_153822 ) ) ( not ( = ?auto_153828 ?auto_153821 ) ) ( not ( = ?auto_153828 ?auto_153825 ) ) ( not ( = ?auto_153828 ?auto_153824 ) ) ( not ( = ?auto_153828 ?auto_153822 ) ) ( not ( = ?auto_153823 ?auto_153821 ) ) ( not ( = ?auto_153823 ?auto_153825 ) ) ( not ( = ?auto_153823 ?auto_153824 ) ) ( not ( = ?auto_153823 ?auto_153822 ) ) ( ON ?auto_153826 ?auto_153823 ) ( ON ?auto_153821 ?auto_153826 ) ( ON ?auto_153825 ?auto_153827 ) ( not ( = ?auto_153820 ?auto_153827 ) ) ( not ( = ?auto_153828 ?auto_153827 ) ) ( not ( = ?auto_153823 ?auto_153827 ) ) ( not ( = ?auto_153826 ?auto_153827 ) ) ( not ( = ?auto_153825 ?auto_153827 ) ) ( not ( = ?auto_153824 ?auto_153827 ) ) ( not ( = ?auto_153822 ?auto_153827 ) ) ( not ( = ?auto_153821 ?auto_153827 ) ) ( ON ?auto_153824 ?auto_153825 ) ( CLEAR ?auto_153824 ) ( ON-TABLE ?auto_153827 ) ( HOLDING ?auto_153822 ) ( CLEAR ?auto_153821 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153820 ?auto_153828 ?auto_153823 ?auto_153826 ?auto_153821 ?auto_153822 )
      ( MAKE-1PILE ?auto_153820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_153829 - BLOCK
    )
    :vars
    (
      ?auto_153834 - BLOCK
      ?auto_153832 - BLOCK
      ?auto_153831 - BLOCK
      ?auto_153833 - BLOCK
      ?auto_153830 - BLOCK
      ?auto_153837 - BLOCK
      ?auto_153835 - BLOCK
      ?auto_153836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_153834 ?auto_153829 ) ( ON-TABLE ?auto_153829 ) ( not ( = ?auto_153829 ?auto_153834 ) ) ( not ( = ?auto_153829 ?auto_153832 ) ) ( not ( = ?auto_153829 ?auto_153831 ) ) ( not ( = ?auto_153834 ?auto_153832 ) ) ( not ( = ?auto_153834 ?auto_153831 ) ) ( not ( = ?auto_153832 ?auto_153831 ) ) ( ON ?auto_153832 ?auto_153834 ) ( not ( = ?auto_153833 ?auto_153830 ) ) ( not ( = ?auto_153833 ?auto_153837 ) ) ( not ( = ?auto_153833 ?auto_153835 ) ) ( not ( = ?auto_153833 ?auto_153831 ) ) ( not ( = ?auto_153830 ?auto_153837 ) ) ( not ( = ?auto_153830 ?auto_153835 ) ) ( not ( = ?auto_153830 ?auto_153831 ) ) ( not ( = ?auto_153837 ?auto_153835 ) ) ( not ( = ?auto_153837 ?auto_153831 ) ) ( not ( = ?auto_153835 ?auto_153831 ) ) ( not ( = ?auto_153829 ?auto_153835 ) ) ( not ( = ?auto_153829 ?auto_153833 ) ) ( not ( = ?auto_153829 ?auto_153830 ) ) ( not ( = ?auto_153829 ?auto_153837 ) ) ( not ( = ?auto_153834 ?auto_153835 ) ) ( not ( = ?auto_153834 ?auto_153833 ) ) ( not ( = ?auto_153834 ?auto_153830 ) ) ( not ( = ?auto_153834 ?auto_153837 ) ) ( not ( = ?auto_153832 ?auto_153835 ) ) ( not ( = ?auto_153832 ?auto_153833 ) ) ( not ( = ?auto_153832 ?auto_153830 ) ) ( not ( = ?auto_153832 ?auto_153837 ) ) ( ON ?auto_153831 ?auto_153832 ) ( ON ?auto_153835 ?auto_153831 ) ( ON ?auto_153833 ?auto_153836 ) ( not ( = ?auto_153829 ?auto_153836 ) ) ( not ( = ?auto_153834 ?auto_153836 ) ) ( not ( = ?auto_153832 ?auto_153836 ) ) ( not ( = ?auto_153831 ?auto_153836 ) ) ( not ( = ?auto_153833 ?auto_153836 ) ) ( not ( = ?auto_153830 ?auto_153836 ) ) ( not ( = ?auto_153837 ?auto_153836 ) ) ( not ( = ?auto_153835 ?auto_153836 ) ) ( ON ?auto_153830 ?auto_153833 ) ( ON-TABLE ?auto_153836 ) ( CLEAR ?auto_153835 ) ( ON ?auto_153837 ?auto_153830 ) ( CLEAR ?auto_153837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153836 ?auto_153833 ?auto_153830 )
      ( MAKE-1PILE ?auto_153829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153881 - BLOCK
      ?auto_153882 - BLOCK
      ?auto_153883 - BLOCK
      ?auto_153884 - BLOCK
      ?auto_153885 - BLOCK
      ?auto_153886 - BLOCK
      ?auto_153887 - BLOCK
    )
    :vars
    (
      ?auto_153888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153881 ) ( ON ?auto_153882 ?auto_153881 ) ( ON ?auto_153883 ?auto_153882 ) ( ON ?auto_153884 ?auto_153883 ) ( ON ?auto_153885 ?auto_153884 ) ( not ( = ?auto_153881 ?auto_153882 ) ) ( not ( = ?auto_153881 ?auto_153883 ) ) ( not ( = ?auto_153881 ?auto_153884 ) ) ( not ( = ?auto_153881 ?auto_153885 ) ) ( not ( = ?auto_153881 ?auto_153886 ) ) ( not ( = ?auto_153881 ?auto_153887 ) ) ( not ( = ?auto_153882 ?auto_153883 ) ) ( not ( = ?auto_153882 ?auto_153884 ) ) ( not ( = ?auto_153882 ?auto_153885 ) ) ( not ( = ?auto_153882 ?auto_153886 ) ) ( not ( = ?auto_153882 ?auto_153887 ) ) ( not ( = ?auto_153883 ?auto_153884 ) ) ( not ( = ?auto_153883 ?auto_153885 ) ) ( not ( = ?auto_153883 ?auto_153886 ) ) ( not ( = ?auto_153883 ?auto_153887 ) ) ( not ( = ?auto_153884 ?auto_153885 ) ) ( not ( = ?auto_153884 ?auto_153886 ) ) ( not ( = ?auto_153884 ?auto_153887 ) ) ( not ( = ?auto_153885 ?auto_153886 ) ) ( not ( = ?auto_153885 ?auto_153887 ) ) ( not ( = ?auto_153886 ?auto_153887 ) ) ( ON ?auto_153887 ?auto_153888 ) ( not ( = ?auto_153881 ?auto_153888 ) ) ( not ( = ?auto_153882 ?auto_153888 ) ) ( not ( = ?auto_153883 ?auto_153888 ) ) ( not ( = ?auto_153884 ?auto_153888 ) ) ( not ( = ?auto_153885 ?auto_153888 ) ) ( not ( = ?auto_153886 ?auto_153888 ) ) ( not ( = ?auto_153887 ?auto_153888 ) ) ( CLEAR ?auto_153885 ) ( ON ?auto_153886 ?auto_153887 ) ( CLEAR ?auto_153886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_153888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153888 ?auto_153887 )
      ( MAKE-7PILE ?auto_153881 ?auto_153882 ?auto_153883 ?auto_153884 ?auto_153885 ?auto_153886 ?auto_153887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153889 - BLOCK
      ?auto_153890 - BLOCK
      ?auto_153891 - BLOCK
      ?auto_153892 - BLOCK
      ?auto_153893 - BLOCK
      ?auto_153894 - BLOCK
      ?auto_153895 - BLOCK
    )
    :vars
    (
      ?auto_153896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153889 ) ( ON ?auto_153890 ?auto_153889 ) ( ON ?auto_153891 ?auto_153890 ) ( ON ?auto_153892 ?auto_153891 ) ( not ( = ?auto_153889 ?auto_153890 ) ) ( not ( = ?auto_153889 ?auto_153891 ) ) ( not ( = ?auto_153889 ?auto_153892 ) ) ( not ( = ?auto_153889 ?auto_153893 ) ) ( not ( = ?auto_153889 ?auto_153894 ) ) ( not ( = ?auto_153889 ?auto_153895 ) ) ( not ( = ?auto_153890 ?auto_153891 ) ) ( not ( = ?auto_153890 ?auto_153892 ) ) ( not ( = ?auto_153890 ?auto_153893 ) ) ( not ( = ?auto_153890 ?auto_153894 ) ) ( not ( = ?auto_153890 ?auto_153895 ) ) ( not ( = ?auto_153891 ?auto_153892 ) ) ( not ( = ?auto_153891 ?auto_153893 ) ) ( not ( = ?auto_153891 ?auto_153894 ) ) ( not ( = ?auto_153891 ?auto_153895 ) ) ( not ( = ?auto_153892 ?auto_153893 ) ) ( not ( = ?auto_153892 ?auto_153894 ) ) ( not ( = ?auto_153892 ?auto_153895 ) ) ( not ( = ?auto_153893 ?auto_153894 ) ) ( not ( = ?auto_153893 ?auto_153895 ) ) ( not ( = ?auto_153894 ?auto_153895 ) ) ( ON ?auto_153895 ?auto_153896 ) ( not ( = ?auto_153889 ?auto_153896 ) ) ( not ( = ?auto_153890 ?auto_153896 ) ) ( not ( = ?auto_153891 ?auto_153896 ) ) ( not ( = ?auto_153892 ?auto_153896 ) ) ( not ( = ?auto_153893 ?auto_153896 ) ) ( not ( = ?auto_153894 ?auto_153896 ) ) ( not ( = ?auto_153895 ?auto_153896 ) ) ( ON ?auto_153894 ?auto_153895 ) ( CLEAR ?auto_153894 ) ( ON-TABLE ?auto_153896 ) ( HOLDING ?auto_153893 ) ( CLEAR ?auto_153892 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153889 ?auto_153890 ?auto_153891 ?auto_153892 ?auto_153893 )
      ( MAKE-7PILE ?auto_153889 ?auto_153890 ?auto_153891 ?auto_153892 ?auto_153893 ?auto_153894 ?auto_153895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153897 - BLOCK
      ?auto_153898 - BLOCK
      ?auto_153899 - BLOCK
      ?auto_153900 - BLOCK
      ?auto_153901 - BLOCK
      ?auto_153902 - BLOCK
      ?auto_153903 - BLOCK
    )
    :vars
    (
      ?auto_153904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153897 ) ( ON ?auto_153898 ?auto_153897 ) ( ON ?auto_153899 ?auto_153898 ) ( ON ?auto_153900 ?auto_153899 ) ( not ( = ?auto_153897 ?auto_153898 ) ) ( not ( = ?auto_153897 ?auto_153899 ) ) ( not ( = ?auto_153897 ?auto_153900 ) ) ( not ( = ?auto_153897 ?auto_153901 ) ) ( not ( = ?auto_153897 ?auto_153902 ) ) ( not ( = ?auto_153897 ?auto_153903 ) ) ( not ( = ?auto_153898 ?auto_153899 ) ) ( not ( = ?auto_153898 ?auto_153900 ) ) ( not ( = ?auto_153898 ?auto_153901 ) ) ( not ( = ?auto_153898 ?auto_153902 ) ) ( not ( = ?auto_153898 ?auto_153903 ) ) ( not ( = ?auto_153899 ?auto_153900 ) ) ( not ( = ?auto_153899 ?auto_153901 ) ) ( not ( = ?auto_153899 ?auto_153902 ) ) ( not ( = ?auto_153899 ?auto_153903 ) ) ( not ( = ?auto_153900 ?auto_153901 ) ) ( not ( = ?auto_153900 ?auto_153902 ) ) ( not ( = ?auto_153900 ?auto_153903 ) ) ( not ( = ?auto_153901 ?auto_153902 ) ) ( not ( = ?auto_153901 ?auto_153903 ) ) ( not ( = ?auto_153902 ?auto_153903 ) ) ( ON ?auto_153903 ?auto_153904 ) ( not ( = ?auto_153897 ?auto_153904 ) ) ( not ( = ?auto_153898 ?auto_153904 ) ) ( not ( = ?auto_153899 ?auto_153904 ) ) ( not ( = ?auto_153900 ?auto_153904 ) ) ( not ( = ?auto_153901 ?auto_153904 ) ) ( not ( = ?auto_153902 ?auto_153904 ) ) ( not ( = ?auto_153903 ?auto_153904 ) ) ( ON ?auto_153902 ?auto_153903 ) ( ON-TABLE ?auto_153904 ) ( CLEAR ?auto_153900 ) ( ON ?auto_153901 ?auto_153902 ) ( CLEAR ?auto_153901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153904 ?auto_153903 ?auto_153902 )
      ( MAKE-7PILE ?auto_153897 ?auto_153898 ?auto_153899 ?auto_153900 ?auto_153901 ?auto_153902 ?auto_153903 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153905 - BLOCK
      ?auto_153906 - BLOCK
      ?auto_153907 - BLOCK
      ?auto_153908 - BLOCK
      ?auto_153909 - BLOCK
      ?auto_153910 - BLOCK
      ?auto_153911 - BLOCK
    )
    :vars
    (
      ?auto_153912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153905 ) ( ON ?auto_153906 ?auto_153905 ) ( ON ?auto_153907 ?auto_153906 ) ( not ( = ?auto_153905 ?auto_153906 ) ) ( not ( = ?auto_153905 ?auto_153907 ) ) ( not ( = ?auto_153905 ?auto_153908 ) ) ( not ( = ?auto_153905 ?auto_153909 ) ) ( not ( = ?auto_153905 ?auto_153910 ) ) ( not ( = ?auto_153905 ?auto_153911 ) ) ( not ( = ?auto_153906 ?auto_153907 ) ) ( not ( = ?auto_153906 ?auto_153908 ) ) ( not ( = ?auto_153906 ?auto_153909 ) ) ( not ( = ?auto_153906 ?auto_153910 ) ) ( not ( = ?auto_153906 ?auto_153911 ) ) ( not ( = ?auto_153907 ?auto_153908 ) ) ( not ( = ?auto_153907 ?auto_153909 ) ) ( not ( = ?auto_153907 ?auto_153910 ) ) ( not ( = ?auto_153907 ?auto_153911 ) ) ( not ( = ?auto_153908 ?auto_153909 ) ) ( not ( = ?auto_153908 ?auto_153910 ) ) ( not ( = ?auto_153908 ?auto_153911 ) ) ( not ( = ?auto_153909 ?auto_153910 ) ) ( not ( = ?auto_153909 ?auto_153911 ) ) ( not ( = ?auto_153910 ?auto_153911 ) ) ( ON ?auto_153911 ?auto_153912 ) ( not ( = ?auto_153905 ?auto_153912 ) ) ( not ( = ?auto_153906 ?auto_153912 ) ) ( not ( = ?auto_153907 ?auto_153912 ) ) ( not ( = ?auto_153908 ?auto_153912 ) ) ( not ( = ?auto_153909 ?auto_153912 ) ) ( not ( = ?auto_153910 ?auto_153912 ) ) ( not ( = ?auto_153911 ?auto_153912 ) ) ( ON ?auto_153910 ?auto_153911 ) ( ON-TABLE ?auto_153912 ) ( ON ?auto_153909 ?auto_153910 ) ( CLEAR ?auto_153909 ) ( HOLDING ?auto_153908 ) ( CLEAR ?auto_153907 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153905 ?auto_153906 ?auto_153907 ?auto_153908 )
      ( MAKE-7PILE ?auto_153905 ?auto_153906 ?auto_153907 ?auto_153908 ?auto_153909 ?auto_153910 ?auto_153911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153913 - BLOCK
      ?auto_153914 - BLOCK
      ?auto_153915 - BLOCK
      ?auto_153916 - BLOCK
      ?auto_153917 - BLOCK
      ?auto_153918 - BLOCK
      ?auto_153919 - BLOCK
    )
    :vars
    (
      ?auto_153920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153913 ) ( ON ?auto_153914 ?auto_153913 ) ( ON ?auto_153915 ?auto_153914 ) ( not ( = ?auto_153913 ?auto_153914 ) ) ( not ( = ?auto_153913 ?auto_153915 ) ) ( not ( = ?auto_153913 ?auto_153916 ) ) ( not ( = ?auto_153913 ?auto_153917 ) ) ( not ( = ?auto_153913 ?auto_153918 ) ) ( not ( = ?auto_153913 ?auto_153919 ) ) ( not ( = ?auto_153914 ?auto_153915 ) ) ( not ( = ?auto_153914 ?auto_153916 ) ) ( not ( = ?auto_153914 ?auto_153917 ) ) ( not ( = ?auto_153914 ?auto_153918 ) ) ( not ( = ?auto_153914 ?auto_153919 ) ) ( not ( = ?auto_153915 ?auto_153916 ) ) ( not ( = ?auto_153915 ?auto_153917 ) ) ( not ( = ?auto_153915 ?auto_153918 ) ) ( not ( = ?auto_153915 ?auto_153919 ) ) ( not ( = ?auto_153916 ?auto_153917 ) ) ( not ( = ?auto_153916 ?auto_153918 ) ) ( not ( = ?auto_153916 ?auto_153919 ) ) ( not ( = ?auto_153917 ?auto_153918 ) ) ( not ( = ?auto_153917 ?auto_153919 ) ) ( not ( = ?auto_153918 ?auto_153919 ) ) ( ON ?auto_153919 ?auto_153920 ) ( not ( = ?auto_153913 ?auto_153920 ) ) ( not ( = ?auto_153914 ?auto_153920 ) ) ( not ( = ?auto_153915 ?auto_153920 ) ) ( not ( = ?auto_153916 ?auto_153920 ) ) ( not ( = ?auto_153917 ?auto_153920 ) ) ( not ( = ?auto_153918 ?auto_153920 ) ) ( not ( = ?auto_153919 ?auto_153920 ) ) ( ON ?auto_153918 ?auto_153919 ) ( ON-TABLE ?auto_153920 ) ( ON ?auto_153917 ?auto_153918 ) ( CLEAR ?auto_153915 ) ( ON ?auto_153916 ?auto_153917 ) ( CLEAR ?auto_153916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_153920 ?auto_153919 ?auto_153918 ?auto_153917 )
      ( MAKE-7PILE ?auto_153913 ?auto_153914 ?auto_153915 ?auto_153916 ?auto_153917 ?auto_153918 ?auto_153919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153921 - BLOCK
      ?auto_153922 - BLOCK
      ?auto_153923 - BLOCK
      ?auto_153924 - BLOCK
      ?auto_153925 - BLOCK
      ?auto_153926 - BLOCK
      ?auto_153927 - BLOCK
    )
    :vars
    (
      ?auto_153928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153921 ) ( ON ?auto_153922 ?auto_153921 ) ( not ( = ?auto_153921 ?auto_153922 ) ) ( not ( = ?auto_153921 ?auto_153923 ) ) ( not ( = ?auto_153921 ?auto_153924 ) ) ( not ( = ?auto_153921 ?auto_153925 ) ) ( not ( = ?auto_153921 ?auto_153926 ) ) ( not ( = ?auto_153921 ?auto_153927 ) ) ( not ( = ?auto_153922 ?auto_153923 ) ) ( not ( = ?auto_153922 ?auto_153924 ) ) ( not ( = ?auto_153922 ?auto_153925 ) ) ( not ( = ?auto_153922 ?auto_153926 ) ) ( not ( = ?auto_153922 ?auto_153927 ) ) ( not ( = ?auto_153923 ?auto_153924 ) ) ( not ( = ?auto_153923 ?auto_153925 ) ) ( not ( = ?auto_153923 ?auto_153926 ) ) ( not ( = ?auto_153923 ?auto_153927 ) ) ( not ( = ?auto_153924 ?auto_153925 ) ) ( not ( = ?auto_153924 ?auto_153926 ) ) ( not ( = ?auto_153924 ?auto_153927 ) ) ( not ( = ?auto_153925 ?auto_153926 ) ) ( not ( = ?auto_153925 ?auto_153927 ) ) ( not ( = ?auto_153926 ?auto_153927 ) ) ( ON ?auto_153927 ?auto_153928 ) ( not ( = ?auto_153921 ?auto_153928 ) ) ( not ( = ?auto_153922 ?auto_153928 ) ) ( not ( = ?auto_153923 ?auto_153928 ) ) ( not ( = ?auto_153924 ?auto_153928 ) ) ( not ( = ?auto_153925 ?auto_153928 ) ) ( not ( = ?auto_153926 ?auto_153928 ) ) ( not ( = ?auto_153927 ?auto_153928 ) ) ( ON ?auto_153926 ?auto_153927 ) ( ON-TABLE ?auto_153928 ) ( ON ?auto_153925 ?auto_153926 ) ( ON ?auto_153924 ?auto_153925 ) ( CLEAR ?auto_153924 ) ( HOLDING ?auto_153923 ) ( CLEAR ?auto_153922 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_153921 ?auto_153922 ?auto_153923 )
      ( MAKE-7PILE ?auto_153921 ?auto_153922 ?auto_153923 ?auto_153924 ?auto_153925 ?auto_153926 ?auto_153927 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153929 - BLOCK
      ?auto_153930 - BLOCK
      ?auto_153931 - BLOCK
      ?auto_153932 - BLOCK
      ?auto_153933 - BLOCK
      ?auto_153934 - BLOCK
      ?auto_153935 - BLOCK
    )
    :vars
    (
      ?auto_153936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153929 ) ( ON ?auto_153930 ?auto_153929 ) ( not ( = ?auto_153929 ?auto_153930 ) ) ( not ( = ?auto_153929 ?auto_153931 ) ) ( not ( = ?auto_153929 ?auto_153932 ) ) ( not ( = ?auto_153929 ?auto_153933 ) ) ( not ( = ?auto_153929 ?auto_153934 ) ) ( not ( = ?auto_153929 ?auto_153935 ) ) ( not ( = ?auto_153930 ?auto_153931 ) ) ( not ( = ?auto_153930 ?auto_153932 ) ) ( not ( = ?auto_153930 ?auto_153933 ) ) ( not ( = ?auto_153930 ?auto_153934 ) ) ( not ( = ?auto_153930 ?auto_153935 ) ) ( not ( = ?auto_153931 ?auto_153932 ) ) ( not ( = ?auto_153931 ?auto_153933 ) ) ( not ( = ?auto_153931 ?auto_153934 ) ) ( not ( = ?auto_153931 ?auto_153935 ) ) ( not ( = ?auto_153932 ?auto_153933 ) ) ( not ( = ?auto_153932 ?auto_153934 ) ) ( not ( = ?auto_153932 ?auto_153935 ) ) ( not ( = ?auto_153933 ?auto_153934 ) ) ( not ( = ?auto_153933 ?auto_153935 ) ) ( not ( = ?auto_153934 ?auto_153935 ) ) ( ON ?auto_153935 ?auto_153936 ) ( not ( = ?auto_153929 ?auto_153936 ) ) ( not ( = ?auto_153930 ?auto_153936 ) ) ( not ( = ?auto_153931 ?auto_153936 ) ) ( not ( = ?auto_153932 ?auto_153936 ) ) ( not ( = ?auto_153933 ?auto_153936 ) ) ( not ( = ?auto_153934 ?auto_153936 ) ) ( not ( = ?auto_153935 ?auto_153936 ) ) ( ON ?auto_153934 ?auto_153935 ) ( ON-TABLE ?auto_153936 ) ( ON ?auto_153933 ?auto_153934 ) ( ON ?auto_153932 ?auto_153933 ) ( CLEAR ?auto_153930 ) ( ON ?auto_153931 ?auto_153932 ) ( CLEAR ?auto_153931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_153936 ?auto_153935 ?auto_153934 ?auto_153933 ?auto_153932 )
      ( MAKE-7PILE ?auto_153929 ?auto_153930 ?auto_153931 ?auto_153932 ?auto_153933 ?auto_153934 ?auto_153935 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153937 - BLOCK
      ?auto_153938 - BLOCK
      ?auto_153939 - BLOCK
      ?auto_153940 - BLOCK
      ?auto_153941 - BLOCK
      ?auto_153942 - BLOCK
      ?auto_153943 - BLOCK
    )
    :vars
    (
      ?auto_153944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153937 ) ( not ( = ?auto_153937 ?auto_153938 ) ) ( not ( = ?auto_153937 ?auto_153939 ) ) ( not ( = ?auto_153937 ?auto_153940 ) ) ( not ( = ?auto_153937 ?auto_153941 ) ) ( not ( = ?auto_153937 ?auto_153942 ) ) ( not ( = ?auto_153937 ?auto_153943 ) ) ( not ( = ?auto_153938 ?auto_153939 ) ) ( not ( = ?auto_153938 ?auto_153940 ) ) ( not ( = ?auto_153938 ?auto_153941 ) ) ( not ( = ?auto_153938 ?auto_153942 ) ) ( not ( = ?auto_153938 ?auto_153943 ) ) ( not ( = ?auto_153939 ?auto_153940 ) ) ( not ( = ?auto_153939 ?auto_153941 ) ) ( not ( = ?auto_153939 ?auto_153942 ) ) ( not ( = ?auto_153939 ?auto_153943 ) ) ( not ( = ?auto_153940 ?auto_153941 ) ) ( not ( = ?auto_153940 ?auto_153942 ) ) ( not ( = ?auto_153940 ?auto_153943 ) ) ( not ( = ?auto_153941 ?auto_153942 ) ) ( not ( = ?auto_153941 ?auto_153943 ) ) ( not ( = ?auto_153942 ?auto_153943 ) ) ( ON ?auto_153943 ?auto_153944 ) ( not ( = ?auto_153937 ?auto_153944 ) ) ( not ( = ?auto_153938 ?auto_153944 ) ) ( not ( = ?auto_153939 ?auto_153944 ) ) ( not ( = ?auto_153940 ?auto_153944 ) ) ( not ( = ?auto_153941 ?auto_153944 ) ) ( not ( = ?auto_153942 ?auto_153944 ) ) ( not ( = ?auto_153943 ?auto_153944 ) ) ( ON ?auto_153942 ?auto_153943 ) ( ON-TABLE ?auto_153944 ) ( ON ?auto_153941 ?auto_153942 ) ( ON ?auto_153940 ?auto_153941 ) ( ON ?auto_153939 ?auto_153940 ) ( CLEAR ?auto_153939 ) ( HOLDING ?auto_153938 ) ( CLEAR ?auto_153937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_153937 ?auto_153938 )
      ( MAKE-7PILE ?auto_153937 ?auto_153938 ?auto_153939 ?auto_153940 ?auto_153941 ?auto_153942 ?auto_153943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153945 - BLOCK
      ?auto_153946 - BLOCK
      ?auto_153947 - BLOCK
      ?auto_153948 - BLOCK
      ?auto_153949 - BLOCK
      ?auto_153950 - BLOCK
      ?auto_153951 - BLOCK
    )
    :vars
    (
      ?auto_153952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_153945 ) ( not ( = ?auto_153945 ?auto_153946 ) ) ( not ( = ?auto_153945 ?auto_153947 ) ) ( not ( = ?auto_153945 ?auto_153948 ) ) ( not ( = ?auto_153945 ?auto_153949 ) ) ( not ( = ?auto_153945 ?auto_153950 ) ) ( not ( = ?auto_153945 ?auto_153951 ) ) ( not ( = ?auto_153946 ?auto_153947 ) ) ( not ( = ?auto_153946 ?auto_153948 ) ) ( not ( = ?auto_153946 ?auto_153949 ) ) ( not ( = ?auto_153946 ?auto_153950 ) ) ( not ( = ?auto_153946 ?auto_153951 ) ) ( not ( = ?auto_153947 ?auto_153948 ) ) ( not ( = ?auto_153947 ?auto_153949 ) ) ( not ( = ?auto_153947 ?auto_153950 ) ) ( not ( = ?auto_153947 ?auto_153951 ) ) ( not ( = ?auto_153948 ?auto_153949 ) ) ( not ( = ?auto_153948 ?auto_153950 ) ) ( not ( = ?auto_153948 ?auto_153951 ) ) ( not ( = ?auto_153949 ?auto_153950 ) ) ( not ( = ?auto_153949 ?auto_153951 ) ) ( not ( = ?auto_153950 ?auto_153951 ) ) ( ON ?auto_153951 ?auto_153952 ) ( not ( = ?auto_153945 ?auto_153952 ) ) ( not ( = ?auto_153946 ?auto_153952 ) ) ( not ( = ?auto_153947 ?auto_153952 ) ) ( not ( = ?auto_153948 ?auto_153952 ) ) ( not ( = ?auto_153949 ?auto_153952 ) ) ( not ( = ?auto_153950 ?auto_153952 ) ) ( not ( = ?auto_153951 ?auto_153952 ) ) ( ON ?auto_153950 ?auto_153951 ) ( ON-TABLE ?auto_153952 ) ( ON ?auto_153949 ?auto_153950 ) ( ON ?auto_153948 ?auto_153949 ) ( ON ?auto_153947 ?auto_153948 ) ( CLEAR ?auto_153945 ) ( ON ?auto_153946 ?auto_153947 ) ( CLEAR ?auto_153946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_153952 ?auto_153951 ?auto_153950 ?auto_153949 ?auto_153948 ?auto_153947 )
      ( MAKE-7PILE ?auto_153945 ?auto_153946 ?auto_153947 ?auto_153948 ?auto_153949 ?auto_153950 ?auto_153951 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153953 - BLOCK
      ?auto_153954 - BLOCK
      ?auto_153955 - BLOCK
      ?auto_153956 - BLOCK
      ?auto_153957 - BLOCK
      ?auto_153958 - BLOCK
      ?auto_153959 - BLOCK
    )
    :vars
    (
      ?auto_153960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153953 ?auto_153954 ) ) ( not ( = ?auto_153953 ?auto_153955 ) ) ( not ( = ?auto_153953 ?auto_153956 ) ) ( not ( = ?auto_153953 ?auto_153957 ) ) ( not ( = ?auto_153953 ?auto_153958 ) ) ( not ( = ?auto_153953 ?auto_153959 ) ) ( not ( = ?auto_153954 ?auto_153955 ) ) ( not ( = ?auto_153954 ?auto_153956 ) ) ( not ( = ?auto_153954 ?auto_153957 ) ) ( not ( = ?auto_153954 ?auto_153958 ) ) ( not ( = ?auto_153954 ?auto_153959 ) ) ( not ( = ?auto_153955 ?auto_153956 ) ) ( not ( = ?auto_153955 ?auto_153957 ) ) ( not ( = ?auto_153955 ?auto_153958 ) ) ( not ( = ?auto_153955 ?auto_153959 ) ) ( not ( = ?auto_153956 ?auto_153957 ) ) ( not ( = ?auto_153956 ?auto_153958 ) ) ( not ( = ?auto_153956 ?auto_153959 ) ) ( not ( = ?auto_153957 ?auto_153958 ) ) ( not ( = ?auto_153957 ?auto_153959 ) ) ( not ( = ?auto_153958 ?auto_153959 ) ) ( ON ?auto_153959 ?auto_153960 ) ( not ( = ?auto_153953 ?auto_153960 ) ) ( not ( = ?auto_153954 ?auto_153960 ) ) ( not ( = ?auto_153955 ?auto_153960 ) ) ( not ( = ?auto_153956 ?auto_153960 ) ) ( not ( = ?auto_153957 ?auto_153960 ) ) ( not ( = ?auto_153958 ?auto_153960 ) ) ( not ( = ?auto_153959 ?auto_153960 ) ) ( ON ?auto_153958 ?auto_153959 ) ( ON-TABLE ?auto_153960 ) ( ON ?auto_153957 ?auto_153958 ) ( ON ?auto_153956 ?auto_153957 ) ( ON ?auto_153955 ?auto_153956 ) ( ON ?auto_153954 ?auto_153955 ) ( CLEAR ?auto_153954 ) ( HOLDING ?auto_153953 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_153953 )
      ( MAKE-7PILE ?auto_153953 ?auto_153954 ?auto_153955 ?auto_153956 ?auto_153957 ?auto_153958 ?auto_153959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153961 - BLOCK
      ?auto_153962 - BLOCK
      ?auto_153963 - BLOCK
      ?auto_153964 - BLOCK
      ?auto_153965 - BLOCK
      ?auto_153966 - BLOCK
      ?auto_153967 - BLOCK
    )
    :vars
    (
      ?auto_153968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153961 ?auto_153962 ) ) ( not ( = ?auto_153961 ?auto_153963 ) ) ( not ( = ?auto_153961 ?auto_153964 ) ) ( not ( = ?auto_153961 ?auto_153965 ) ) ( not ( = ?auto_153961 ?auto_153966 ) ) ( not ( = ?auto_153961 ?auto_153967 ) ) ( not ( = ?auto_153962 ?auto_153963 ) ) ( not ( = ?auto_153962 ?auto_153964 ) ) ( not ( = ?auto_153962 ?auto_153965 ) ) ( not ( = ?auto_153962 ?auto_153966 ) ) ( not ( = ?auto_153962 ?auto_153967 ) ) ( not ( = ?auto_153963 ?auto_153964 ) ) ( not ( = ?auto_153963 ?auto_153965 ) ) ( not ( = ?auto_153963 ?auto_153966 ) ) ( not ( = ?auto_153963 ?auto_153967 ) ) ( not ( = ?auto_153964 ?auto_153965 ) ) ( not ( = ?auto_153964 ?auto_153966 ) ) ( not ( = ?auto_153964 ?auto_153967 ) ) ( not ( = ?auto_153965 ?auto_153966 ) ) ( not ( = ?auto_153965 ?auto_153967 ) ) ( not ( = ?auto_153966 ?auto_153967 ) ) ( ON ?auto_153967 ?auto_153968 ) ( not ( = ?auto_153961 ?auto_153968 ) ) ( not ( = ?auto_153962 ?auto_153968 ) ) ( not ( = ?auto_153963 ?auto_153968 ) ) ( not ( = ?auto_153964 ?auto_153968 ) ) ( not ( = ?auto_153965 ?auto_153968 ) ) ( not ( = ?auto_153966 ?auto_153968 ) ) ( not ( = ?auto_153967 ?auto_153968 ) ) ( ON ?auto_153966 ?auto_153967 ) ( ON-TABLE ?auto_153968 ) ( ON ?auto_153965 ?auto_153966 ) ( ON ?auto_153964 ?auto_153965 ) ( ON ?auto_153963 ?auto_153964 ) ( ON ?auto_153962 ?auto_153963 ) ( ON ?auto_153961 ?auto_153962 ) ( CLEAR ?auto_153961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153968 ?auto_153967 ?auto_153966 ?auto_153965 ?auto_153964 ?auto_153963 ?auto_153962 )
      ( MAKE-7PILE ?auto_153961 ?auto_153962 ?auto_153963 ?auto_153964 ?auto_153965 ?auto_153966 ?auto_153967 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153976 - BLOCK
      ?auto_153977 - BLOCK
      ?auto_153978 - BLOCK
      ?auto_153979 - BLOCK
      ?auto_153980 - BLOCK
      ?auto_153981 - BLOCK
      ?auto_153982 - BLOCK
    )
    :vars
    (
      ?auto_153983 - BLOCK
      ?auto_153984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153976 ?auto_153977 ) ) ( not ( = ?auto_153976 ?auto_153978 ) ) ( not ( = ?auto_153976 ?auto_153979 ) ) ( not ( = ?auto_153976 ?auto_153980 ) ) ( not ( = ?auto_153976 ?auto_153981 ) ) ( not ( = ?auto_153976 ?auto_153982 ) ) ( not ( = ?auto_153977 ?auto_153978 ) ) ( not ( = ?auto_153977 ?auto_153979 ) ) ( not ( = ?auto_153977 ?auto_153980 ) ) ( not ( = ?auto_153977 ?auto_153981 ) ) ( not ( = ?auto_153977 ?auto_153982 ) ) ( not ( = ?auto_153978 ?auto_153979 ) ) ( not ( = ?auto_153978 ?auto_153980 ) ) ( not ( = ?auto_153978 ?auto_153981 ) ) ( not ( = ?auto_153978 ?auto_153982 ) ) ( not ( = ?auto_153979 ?auto_153980 ) ) ( not ( = ?auto_153979 ?auto_153981 ) ) ( not ( = ?auto_153979 ?auto_153982 ) ) ( not ( = ?auto_153980 ?auto_153981 ) ) ( not ( = ?auto_153980 ?auto_153982 ) ) ( not ( = ?auto_153981 ?auto_153982 ) ) ( ON ?auto_153982 ?auto_153983 ) ( not ( = ?auto_153976 ?auto_153983 ) ) ( not ( = ?auto_153977 ?auto_153983 ) ) ( not ( = ?auto_153978 ?auto_153983 ) ) ( not ( = ?auto_153979 ?auto_153983 ) ) ( not ( = ?auto_153980 ?auto_153983 ) ) ( not ( = ?auto_153981 ?auto_153983 ) ) ( not ( = ?auto_153982 ?auto_153983 ) ) ( ON ?auto_153981 ?auto_153982 ) ( ON-TABLE ?auto_153983 ) ( ON ?auto_153980 ?auto_153981 ) ( ON ?auto_153979 ?auto_153980 ) ( ON ?auto_153978 ?auto_153979 ) ( ON ?auto_153977 ?auto_153978 ) ( CLEAR ?auto_153977 ) ( ON ?auto_153976 ?auto_153984 ) ( CLEAR ?auto_153976 ) ( HAND-EMPTY ) ( not ( = ?auto_153976 ?auto_153984 ) ) ( not ( = ?auto_153977 ?auto_153984 ) ) ( not ( = ?auto_153978 ?auto_153984 ) ) ( not ( = ?auto_153979 ?auto_153984 ) ) ( not ( = ?auto_153980 ?auto_153984 ) ) ( not ( = ?auto_153981 ?auto_153984 ) ) ( not ( = ?auto_153982 ?auto_153984 ) ) ( not ( = ?auto_153983 ?auto_153984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_153976 ?auto_153984 )
      ( MAKE-7PILE ?auto_153976 ?auto_153977 ?auto_153978 ?auto_153979 ?auto_153980 ?auto_153981 ?auto_153982 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153985 - BLOCK
      ?auto_153986 - BLOCK
      ?auto_153987 - BLOCK
      ?auto_153988 - BLOCK
      ?auto_153989 - BLOCK
      ?auto_153990 - BLOCK
      ?auto_153991 - BLOCK
    )
    :vars
    (
      ?auto_153992 - BLOCK
      ?auto_153993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153985 ?auto_153986 ) ) ( not ( = ?auto_153985 ?auto_153987 ) ) ( not ( = ?auto_153985 ?auto_153988 ) ) ( not ( = ?auto_153985 ?auto_153989 ) ) ( not ( = ?auto_153985 ?auto_153990 ) ) ( not ( = ?auto_153985 ?auto_153991 ) ) ( not ( = ?auto_153986 ?auto_153987 ) ) ( not ( = ?auto_153986 ?auto_153988 ) ) ( not ( = ?auto_153986 ?auto_153989 ) ) ( not ( = ?auto_153986 ?auto_153990 ) ) ( not ( = ?auto_153986 ?auto_153991 ) ) ( not ( = ?auto_153987 ?auto_153988 ) ) ( not ( = ?auto_153987 ?auto_153989 ) ) ( not ( = ?auto_153987 ?auto_153990 ) ) ( not ( = ?auto_153987 ?auto_153991 ) ) ( not ( = ?auto_153988 ?auto_153989 ) ) ( not ( = ?auto_153988 ?auto_153990 ) ) ( not ( = ?auto_153988 ?auto_153991 ) ) ( not ( = ?auto_153989 ?auto_153990 ) ) ( not ( = ?auto_153989 ?auto_153991 ) ) ( not ( = ?auto_153990 ?auto_153991 ) ) ( ON ?auto_153991 ?auto_153992 ) ( not ( = ?auto_153985 ?auto_153992 ) ) ( not ( = ?auto_153986 ?auto_153992 ) ) ( not ( = ?auto_153987 ?auto_153992 ) ) ( not ( = ?auto_153988 ?auto_153992 ) ) ( not ( = ?auto_153989 ?auto_153992 ) ) ( not ( = ?auto_153990 ?auto_153992 ) ) ( not ( = ?auto_153991 ?auto_153992 ) ) ( ON ?auto_153990 ?auto_153991 ) ( ON-TABLE ?auto_153992 ) ( ON ?auto_153989 ?auto_153990 ) ( ON ?auto_153988 ?auto_153989 ) ( ON ?auto_153987 ?auto_153988 ) ( ON ?auto_153985 ?auto_153993 ) ( CLEAR ?auto_153985 ) ( not ( = ?auto_153985 ?auto_153993 ) ) ( not ( = ?auto_153986 ?auto_153993 ) ) ( not ( = ?auto_153987 ?auto_153993 ) ) ( not ( = ?auto_153988 ?auto_153993 ) ) ( not ( = ?auto_153989 ?auto_153993 ) ) ( not ( = ?auto_153990 ?auto_153993 ) ) ( not ( = ?auto_153991 ?auto_153993 ) ) ( not ( = ?auto_153992 ?auto_153993 ) ) ( HOLDING ?auto_153986 ) ( CLEAR ?auto_153987 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_153992 ?auto_153991 ?auto_153990 ?auto_153989 ?auto_153988 ?auto_153987 ?auto_153986 )
      ( MAKE-7PILE ?auto_153985 ?auto_153986 ?auto_153987 ?auto_153988 ?auto_153989 ?auto_153990 ?auto_153991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_153994 - BLOCK
      ?auto_153995 - BLOCK
      ?auto_153996 - BLOCK
      ?auto_153997 - BLOCK
      ?auto_153998 - BLOCK
      ?auto_153999 - BLOCK
      ?auto_154000 - BLOCK
    )
    :vars
    (
      ?auto_154001 - BLOCK
      ?auto_154002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_153994 ?auto_153995 ) ) ( not ( = ?auto_153994 ?auto_153996 ) ) ( not ( = ?auto_153994 ?auto_153997 ) ) ( not ( = ?auto_153994 ?auto_153998 ) ) ( not ( = ?auto_153994 ?auto_153999 ) ) ( not ( = ?auto_153994 ?auto_154000 ) ) ( not ( = ?auto_153995 ?auto_153996 ) ) ( not ( = ?auto_153995 ?auto_153997 ) ) ( not ( = ?auto_153995 ?auto_153998 ) ) ( not ( = ?auto_153995 ?auto_153999 ) ) ( not ( = ?auto_153995 ?auto_154000 ) ) ( not ( = ?auto_153996 ?auto_153997 ) ) ( not ( = ?auto_153996 ?auto_153998 ) ) ( not ( = ?auto_153996 ?auto_153999 ) ) ( not ( = ?auto_153996 ?auto_154000 ) ) ( not ( = ?auto_153997 ?auto_153998 ) ) ( not ( = ?auto_153997 ?auto_153999 ) ) ( not ( = ?auto_153997 ?auto_154000 ) ) ( not ( = ?auto_153998 ?auto_153999 ) ) ( not ( = ?auto_153998 ?auto_154000 ) ) ( not ( = ?auto_153999 ?auto_154000 ) ) ( ON ?auto_154000 ?auto_154001 ) ( not ( = ?auto_153994 ?auto_154001 ) ) ( not ( = ?auto_153995 ?auto_154001 ) ) ( not ( = ?auto_153996 ?auto_154001 ) ) ( not ( = ?auto_153997 ?auto_154001 ) ) ( not ( = ?auto_153998 ?auto_154001 ) ) ( not ( = ?auto_153999 ?auto_154001 ) ) ( not ( = ?auto_154000 ?auto_154001 ) ) ( ON ?auto_153999 ?auto_154000 ) ( ON-TABLE ?auto_154001 ) ( ON ?auto_153998 ?auto_153999 ) ( ON ?auto_153997 ?auto_153998 ) ( ON ?auto_153996 ?auto_153997 ) ( ON ?auto_153994 ?auto_154002 ) ( not ( = ?auto_153994 ?auto_154002 ) ) ( not ( = ?auto_153995 ?auto_154002 ) ) ( not ( = ?auto_153996 ?auto_154002 ) ) ( not ( = ?auto_153997 ?auto_154002 ) ) ( not ( = ?auto_153998 ?auto_154002 ) ) ( not ( = ?auto_153999 ?auto_154002 ) ) ( not ( = ?auto_154000 ?auto_154002 ) ) ( not ( = ?auto_154001 ?auto_154002 ) ) ( CLEAR ?auto_153996 ) ( ON ?auto_153995 ?auto_153994 ) ( CLEAR ?auto_153995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154002 ?auto_153994 )
      ( MAKE-7PILE ?auto_153994 ?auto_153995 ?auto_153996 ?auto_153997 ?auto_153998 ?auto_153999 ?auto_154000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154003 - BLOCK
      ?auto_154004 - BLOCK
      ?auto_154005 - BLOCK
      ?auto_154006 - BLOCK
      ?auto_154007 - BLOCK
      ?auto_154008 - BLOCK
      ?auto_154009 - BLOCK
    )
    :vars
    (
      ?auto_154010 - BLOCK
      ?auto_154011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154003 ?auto_154004 ) ) ( not ( = ?auto_154003 ?auto_154005 ) ) ( not ( = ?auto_154003 ?auto_154006 ) ) ( not ( = ?auto_154003 ?auto_154007 ) ) ( not ( = ?auto_154003 ?auto_154008 ) ) ( not ( = ?auto_154003 ?auto_154009 ) ) ( not ( = ?auto_154004 ?auto_154005 ) ) ( not ( = ?auto_154004 ?auto_154006 ) ) ( not ( = ?auto_154004 ?auto_154007 ) ) ( not ( = ?auto_154004 ?auto_154008 ) ) ( not ( = ?auto_154004 ?auto_154009 ) ) ( not ( = ?auto_154005 ?auto_154006 ) ) ( not ( = ?auto_154005 ?auto_154007 ) ) ( not ( = ?auto_154005 ?auto_154008 ) ) ( not ( = ?auto_154005 ?auto_154009 ) ) ( not ( = ?auto_154006 ?auto_154007 ) ) ( not ( = ?auto_154006 ?auto_154008 ) ) ( not ( = ?auto_154006 ?auto_154009 ) ) ( not ( = ?auto_154007 ?auto_154008 ) ) ( not ( = ?auto_154007 ?auto_154009 ) ) ( not ( = ?auto_154008 ?auto_154009 ) ) ( ON ?auto_154009 ?auto_154010 ) ( not ( = ?auto_154003 ?auto_154010 ) ) ( not ( = ?auto_154004 ?auto_154010 ) ) ( not ( = ?auto_154005 ?auto_154010 ) ) ( not ( = ?auto_154006 ?auto_154010 ) ) ( not ( = ?auto_154007 ?auto_154010 ) ) ( not ( = ?auto_154008 ?auto_154010 ) ) ( not ( = ?auto_154009 ?auto_154010 ) ) ( ON ?auto_154008 ?auto_154009 ) ( ON-TABLE ?auto_154010 ) ( ON ?auto_154007 ?auto_154008 ) ( ON ?auto_154006 ?auto_154007 ) ( ON ?auto_154003 ?auto_154011 ) ( not ( = ?auto_154003 ?auto_154011 ) ) ( not ( = ?auto_154004 ?auto_154011 ) ) ( not ( = ?auto_154005 ?auto_154011 ) ) ( not ( = ?auto_154006 ?auto_154011 ) ) ( not ( = ?auto_154007 ?auto_154011 ) ) ( not ( = ?auto_154008 ?auto_154011 ) ) ( not ( = ?auto_154009 ?auto_154011 ) ) ( not ( = ?auto_154010 ?auto_154011 ) ) ( ON ?auto_154004 ?auto_154003 ) ( CLEAR ?auto_154004 ) ( ON-TABLE ?auto_154011 ) ( HOLDING ?auto_154005 ) ( CLEAR ?auto_154006 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154010 ?auto_154009 ?auto_154008 ?auto_154007 ?auto_154006 ?auto_154005 )
      ( MAKE-7PILE ?auto_154003 ?auto_154004 ?auto_154005 ?auto_154006 ?auto_154007 ?auto_154008 ?auto_154009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154012 - BLOCK
      ?auto_154013 - BLOCK
      ?auto_154014 - BLOCK
      ?auto_154015 - BLOCK
      ?auto_154016 - BLOCK
      ?auto_154017 - BLOCK
      ?auto_154018 - BLOCK
    )
    :vars
    (
      ?auto_154019 - BLOCK
      ?auto_154020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154012 ?auto_154013 ) ) ( not ( = ?auto_154012 ?auto_154014 ) ) ( not ( = ?auto_154012 ?auto_154015 ) ) ( not ( = ?auto_154012 ?auto_154016 ) ) ( not ( = ?auto_154012 ?auto_154017 ) ) ( not ( = ?auto_154012 ?auto_154018 ) ) ( not ( = ?auto_154013 ?auto_154014 ) ) ( not ( = ?auto_154013 ?auto_154015 ) ) ( not ( = ?auto_154013 ?auto_154016 ) ) ( not ( = ?auto_154013 ?auto_154017 ) ) ( not ( = ?auto_154013 ?auto_154018 ) ) ( not ( = ?auto_154014 ?auto_154015 ) ) ( not ( = ?auto_154014 ?auto_154016 ) ) ( not ( = ?auto_154014 ?auto_154017 ) ) ( not ( = ?auto_154014 ?auto_154018 ) ) ( not ( = ?auto_154015 ?auto_154016 ) ) ( not ( = ?auto_154015 ?auto_154017 ) ) ( not ( = ?auto_154015 ?auto_154018 ) ) ( not ( = ?auto_154016 ?auto_154017 ) ) ( not ( = ?auto_154016 ?auto_154018 ) ) ( not ( = ?auto_154017 ?auto_154018 ) ) ( ON ?auto_154018 ?auto_154019 ) ( not ( = ?auto_154012 ?auto_154019 ) ) ( not ( = ?auto_154013 ?auto_154019 ) ) ( not ( = ?auto_154014 ?auto_154019 ) ) ( not ( = ?auto_154015 ?auto_154019 ) ) ( not ( = ?auto_154016 ?auto_154019 ) ) ( not ( = ?auto_154017 ?auto_154019 ) ) ( not ( = ?auto_154018 ?auto_154019 ) ) ( ON ?auto_154017 ?auto_154018 ) ( ON-TABLE ?auto_154019 ) ( ON ?auto_154016 ?auto_154017 ) ( ON ?auto_154015 ?auto_154016 ) ( ON ?auto_154012 ?auto_154020 ) ( not ( = ?auto_154012 ?auto_154020 ) ) ( not ( = ?auto_154013 ?auto_154020 ) ) ( not ( = ?auto_154014 ?auto_154020 ) ) ( not ( = ?auto_154015 ?auto_154020 ) ) ( not ( = ?auto_154016 ?auto_154020 ) ) ( not ( = ?auto_154017 ?auto_154020 ) ) ( not ( = ?auto_154018 ?auto_154020 ) ) ( not ( = ?auto_154019 ?auto_154020 ) ) ( ON ?auto_154013 ?auto_154012 ) ( ON-TABLE ?auto_154020 ) ( CLEAR ?auto_154015 ) ( ON ?auto_154014 ?auto_154013 ) ( CLEAR ?auto_154014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154020 ?auto_154012 ?auto_154013 )
      ( MAKE-7PILE ?auto_154012 ?auto_154013 ?auto_154014 ?auto_154015 ?auto_154016 ?auto_154017 ?auto_154018 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154021 - BLOCK
      ?auto_154022 - BLOCK
      ?auto_154023 - BLOCK
      ?auto_154024 - BLOCK
      ?auto_154025 - BLOCK
      ?auto_154026 - BLOCK
      ?auto_154027 - BLOCK
    )
    :vars
    (
      ?auto_154028 - BLOCK
      ?auto_154029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154021 ?auto_154022 ) ) ( not ( = ?auto_154021 ?auto_154023 ) ) ( not ( = ?auto_154021 ?auto_154024 ) ) ( not ( = ?auto_154021 ?auto_154025 ) ) ( not ( = ?auto_154021 ?auto_154026 ) ) ( not ( = ?auto_154021 ?auto_154027 ) ) ( not ( = ?auto_154022 ?auto_154023 ) ) ( not ( = ?auto_154022 ?auto_154024 ) ) ( not ( = ?auto_154022 ?auto_154025 ) ) ( not ( = ?auto_154022 ?auto_154026 ) ) ( not ( = ?auto_154022 ?auto_154027 ) ) ( not ( = ?auto_154023 ?auto_154024 ) ) ( not ( = ?auto_154023 ?auto_154025 ) ) ( not ( = ?auto_154023 ?auto_154026 ) ) ( not ( = ?auto_154023 ?auto_154027 ) ) ( not ( = ?auto_154024 ?auto_154025 ) ) ( not ( = ?auto_154024 ?auto_154026 ) ) ( not ( = ?auto_154024 ?auto_154027 ) ) ( not ( = ?auto_154025 ?auto_154026 ) ) ( not ( = ?auto_154025 ?auto_154027 ) ) ( not ( = ?auto_154026 ?auto_154027 ) ) ( ON ?auto_154027 ?auto_154028 ) ( not ( = ?auto_154021 ?auto_154028 ) ) ( not ( = ?auto_154022 ?auto_154028 ) ) ( not ( = ?auto_154023 ?auto_154028 ) ) ( not ( = ?auto_154024 ?auto_154028 ) ) ( not ( = ?auto_154025 ?auto_154028 ) ) ( not ( = ?auto_154026 ?auto_154028 ) ) ( not ( = ?auto_154027 ?auto_154028 ) ) ( ON ?auto_154026 ?auto_154027 ) ( ON-TABLE ?auto_154028 ) ( ON ?auto_154025 ?auto_154026 ) ( ON ?auto_154021 ?auto_154029 ) ( not ( = ?auto_154021 ?auto_154029 ) ) ( not ( = ?auto_154022 ?auto_154029 ) ) ( not ( = ?auto_154023 ?auto_154029 ) ) ( not ( = ?auto_154024 ?auto_154029 ) ) ( not ( = ?auto_154025 ?auto_154029 ) ) ( not ( = ?auto_154026 ?auto_154029 ) ) ( not ( = ?auto_154027 ?auto_154029 ) ) ( not ( = ?auto_154028 ?auto_154029 ) ) ( ON ?auto_154022 ?auto_154021 ) ( ON-TABLE ?auto_154029 ) ( ON ?auto_154023 ?auto_154022 ) ( CLEAR ?auto_154023 ) ( HOLDING ?auto_154024 ) ( CLEAR ?auto_154025 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154028 ?auto_154027 ?auto_154026 ?auto_154025 ?auto_154024 )
      ( MAKE-7PILE ?auto_154021 ?auto_154022 ?auto_154023 ?auto_154024 ?auto_154025 ?auto_154026 ?auto_154027 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154030 - BLOCK
      ?auto_154031 - BLOCK
      ?auto_154032 - BLOCK
      ?auto_154033 - BLOCK
      ?auto_154034 - BLOCK
      ?auto_154035 - BLOCK
      ?auto_154036 - BLOCK
    )
    :vars
    (
      ?auto_154037 - BLOCK
      ?auto_154038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154030 ?auto_154031 ) ) ( not ( = ?auto_154030 ?auto_154032 ) ) ( not ( = ?auto_154030 ?auto_154033 ) ) ( not ( = ?auto_154030 ?auto_154034 ) ) ( not ( = ?auto_154030 ?auto_154035 ) ) ( not ( = ?auto_154030 ?auto_154036 ) ) ( not ( = ?auto_154031 ?auto_154032 ) ) ( not ( = ?auto_154031 ?auto_154033 ) ) ( not ( = ?auto_154031 ?auto_154034 ) ) ( not ( = ?auto_154031 ?auto_154035 ) ) ( not ( = ?auto_154031 ?auto_154036 ) ) ( not ( = ?auto_154032 ?auto_154033 ) ) ( not ( = ?auto_154032 ?auto_154034 ) ) ( not ( = ?auto_154032 ?auto_154035 ) ) ( not ( = ?auto_154032 ?auto_154036 ) ) ( not ( = ?auto_154033 ?auto_154034 ) ) ( not ( = ?auto_154033 ?auto_154035 ) ) ( not ( = ?auto_154033 ?auto_154036 ) ) ( not ( = ?auto_154034 ?auto_154035 ) ) ( not ( = ?auto_154034 ?auto_154036 ) ) ( not ( = ?auto_154035 ?auto_154036 ) ) ( ON ?auto_154036 ?auto_154037 ) ( not ( = ?auto_154030 ?auto_154037 ) ) ( not ( = ?auto_154031 ?auto_154037 ) ) ( not ( = ?auto_154032 ?auto_154037 ) ) ( not ( = ?auto_154033 ?auto_154037 ) ) ( not ( = ?auto_154034 ?auto_154037 ) ) ( not ( = ?auto_154035 ?auto_154037 ) ) ( not ( = ?auto_154036 ?auto_154037 ) ) ( ON ?auto_154035 ?auto_154036 ) ( ON-TABLE ?auto_154037 ) ( ON ?auto_154034 ?auto_154035 ) ( ON ?auto_154030 ?auto_154038 ) ( not ( = ?auto_154030 ?auto_154038 ) ) ( not ( = ?auto_154031 ?auto_154038 ) ) ( not ( = ?auto_154032 ?auto_154038 ) ) ( not ( = ?auto_154033 ?auto_154038 ) ) ( not ( = ?auto_154034 ?auto_154038 ) ) ( not ( = ?auto_154035 ?auto_154038 ) ) ( not ( = ?auto_154036 ?auto_154038 ) ) ( not ( = ?auto_154037 ?auto_154038 ) ) ( ON ?auto_154031 ?auto_154030 ) ( ON-TABLE ?auto_154038 ) ( ON ?auto_154032 ?auto_154031 ) ( CLEAR ?auto_154034 ) ( ON ?auto_154033 ?auto_154032 ) ( CLEAR ?auto_154033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154038 ?auto_154030 ?auto_154031 ?auto_154032 )
      ( MAKE-7PILE ?auto_154030 ?auto_154031 ?auto_154032 ?auto_154033 ?auto_154034 ?auto_154035 ?auto_154036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154039 - BLOCK
      ?auto_154040 - BLOCK
      ?auto_154041 - BLOCK
      ?auto_154042 - BLOCK
      ?auto_154043 - BLOCK
      ?auto_154044 - BLOCK
      ?auto_154045 - BLOCK
    )
    :vars
    (
      ?auto_154047 - BLOCK
      ?auto_154046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154039 ?auto_154040 ) ) ( not ( = ?auto_154039 ?auto_154041 ) ) ( not ( = ?auto_154039 ?auto_154042 ) ) ( not ( = ?auto_154039 ?auto_154043 ) ) ( not ( = ?auto_154039 ?auto_154044 ) ) ( not ( = ?auto_154039 ?auto_154045 ) ) ( not ( = ?auto_154040 ?auto_154041 ) ) ( not ( = ?auto_154040 ?auto_154042 ) ) ( not ( = ?auto_154040 ?auto_154043 ) ) ( not ( = ?auto_154040 ?auto_154044 ) ) ( not ( = ?auto_154040 ?auto_154045 ) ) ( not ( = ?auto_154041 ?auto_154042 ) ) ( not ( = ?auto_154041 ?auto_154043 ) ) ( not ( = ?auto_154041 ?auto_154044 ) ) ( not ( = ?auto_154041 ?auto_154045 ) ) ( not ( = ?auto_154042 ?auto_154043 ) ) ( not ( = ?auto_154042 ?auto_154044 ) ) ( not ( = ?auto_154042 ?auto_154045 ) ) ( not ( = ?auto_154043 ?auto_154044 ) ) ( not ( = ?auto_154043 ?auto_154045 ) ) ( not ( = ?auto_154044 ?auto_154045 ) ) ( ON ?auto_154045 ?auto_154047 ) ( not ( = ?auto_154039 ?auto_154047 ) ) ( not ( = ?auto_154040 ?auto_154047 ) ) ( not ( = ?auto_154041 ?auto_154047 ) ) ( not ( = ?auto_154042 ?auto_154047 ) ) ( not ( = ?auto_154043 ?auto_154047 ) ) ( not ( = ?auto_154044 ?auto_154047 ) ) ( not ( = ?auto_154045 ?auto_154047 ) ) ( ON ?auto_154044 ?auto_154045 ) ( ON-TABLE ?auto_154047 ) ( ON ?auto_154039 ?auto_154046 ) ( not ( = ?auto_154039 ?auto_154046 ) ) ( not ( = ?auto_154040 ?auto_154046 ) ) ( not ( = ?auto_154041 ?auto_154046 ) ) ( not ( = ?auto_154042 ?auto_154046 ) ) ( not ( = ?auto_154043 ?auto_154046 ) ) ( not ( = ?auto_154044 ?auto_154046 ) ) ( not ( = ?auto_154045 ?auto_154046 ) ) ( not ( = ?auto_154047 ?auto_154046 ) ) ( ON ?auto_154040 ?auto_154039 ) ( ON-TABLE ?auto_154046 ) ( ON ?auto_154041 ?auto_154040 ) ( ON ?auto_154042 ?auto_154041 ) ( CLEAR ?auto_154042 ) ( HOLDING ?auto_154043 ) ( CLEAR ?auto_154044 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154047 ?auto_154045 ?auto_154044 ?auto_154043 )
      ( MAKE-7PILE ?auto_154039 ?auto_154040 ?auto_154041 ?auto_154042 ?auto_154043 ?auto_154044 ?auto_154045 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154048 - BLOCK
      ?auto_154049 - BLOCK
      ?auto_154050 - BLOCK
      ?auto_154051 - BLOCK
      ?auto_154052 - BLOCK
      ?auto_154053 - BLOCK
      ?auto_154054 - BLOCK
    )
    :vars
    (
      ?auto_154055 - BLOCK
      ?auto_154056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154048 ?auto_154049 ) ) ( not ( = ?auto_154048 ?auto_154050 ) ) ( not ( = ?auto_154048 ?auto_154051 ) ) ( not ( = ?auto_154048 ?auto_154052 ) ) ( not ( = ?auto_154048 ?auto_154053 ) ) ( not ( = ?auto_154048 ?auto_154054 ) ) ( not ( = ?auto_154049 ?auto_154050 ) ) ( not ( = ?auto_154049 ?auto_154051 ) ) ( not ( = ?auto_154049 ?auto_154052 ) ) ( not ( = ?auto_154049 ?auto_154053 ) ) ( not ( = ?auto_154049 ?auto_154054 ) ) ( not ( = ?auto_154050 ?auto_154051 ) ) ( not ( = ?auto_154050 ?auto_154052 ) ) ( not ( = ?auto_154050 ?auto_154053 ) ) ( not ( = ?auto_154050 ?auto_154054 ) ) ( not ( = ?auto_154051 ?auto_154052 ) ) ( not ( = ?auto_154051 ?auto_154053 ) ) ( not ( = ?auto_154051 ?auto_154054 ) ) ( not ( = ?auto_154052 ?auto_154053 ) ) ( not ( = ?auto_154052 ?auto_154054 ) ) ( not ( = ?auto_154053 ?auto_154054 ) ) ( ON ?auto_154054 ?auto_154055 ) ( not ( = ?auto_154048 ?auto_154055 ) ) ( not ( = ?auto_154049 ?auto_154055 ) ) ( not ( = ?auto_154050 ?auto_154055 ) ) ( not ( = ?auto_154051 ?auto_154055 ) ) ( not ( = ?auto_154052 ?auto_154055 ) ) ( not ( = ?auto_154053 ?auto_154055 ) ) ( not ( = ?auto_154054 ?auto_154055 ) ) ( ON ?auto_154053 ?auto_154054 ) ( ON-TABLE ?auto_154055 ) ( ON ?auto_154048 ?auto_154056 ) ( not ( = ?auto_154048 ?auto_154056 ) ) ( not ( = ?auto_154049 ?auto_154056 ) ) ( not ( = ?auto_154050 ?auto_154056 ) ) ( not ( = ?auto_154051 ?auto_154056 ) ) ( not ( = ?auto_154052 ?auto_154056 ) ) ( not ( = ?auto_154053 ?auto_154056 ) ) ( not ( = ?auto_154054 ?auto_154056 ) ) ( not ( = ?auto_154055 ?auto_154056 ) ) ( ON ?auto_154049 ?auto_154048 ) ( ON-TABLE ?auto_154056 ) ( ON ?auto_154050 ?auto_154049 ) ( ON ?auto_154051 ?auto_154050 ) ( CLEAR ?auto_154053 ) ( ON ?auto_154052 ?auto_154051 ) ( CLEAR ?auto_154052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154056 ?auto_154048 ?auto_154049 ?auto_154050 ?auto_154051 )
      ( MAKE-7PILE ?auto_154048 ?auto_154049 ?auto_154050 ?auto_154051 ?auto_154052 ?auto_154053 ?auto_154054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154057 - BLOCK
      ?auto_154058 - BLOCK
      ?auto_154059 - BLOCK
      ?auto_154060 - BLOCK
      ?auto_154061 - BLOCK
      ?auto_154062 - BLOCK
      ?auto_154063 - BLOCK
    )
    :vars
    (
      ?auto_154065 - BLOCK
      ?auto_154064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154057 ?auto_154058 ) ) ( not ( = ?auto_154057 ?auto_154059 ) ) ( not ( = ?auto_154057 ?auto_154060 ) ) ( not ( = ?auto_154057 ?auto_154061 ) ) ( not ( = ?auto_154057 ?auto_154062 ) ) ( not ( = ?auto_154057 ?auto_154063 ) ) ( not ( = ?auto_154058 ?auto_154059 ) ) ( not ( = ?auto_154058 ?auto_154060 ) ) ( not ( = ?auto_154058 ?auto_154061 ) ) ( not ( = ?auto_154058 ?auto_154062 ) ) ( not ( = ?auto_154058 ?auto_154063 ) ) ( not ( = ?auto_154059 ?auto_154060 ) ) ( not ( = ?auto_154059 ?auto_154061 ) ) ( not ( = ?auto_154059 ?auto_154062 ) ) ( not ( = ?auto_154059 ?auto_154063 ) ) ( not ( = ?auto_154060 ?auto_154061 ) ) ( not ( = ?auto_154060 ?auto_154062 ) ) ( not ( = ?auto_154060 ?auto_154063 ) ) ( not ( = ?auto_154061 ?auto_154062 ) ) ( not ( = ?auto_154061 ?auto_154063 ) ) ( not ( = ?auto_154062 ?auto_154063 ) ) ( ON ?auto_154063 ?auto_154065 ) ( not ( = ?auto_154057 ?auto_154065 ) ) ( not ( = ?auto_154058 ?auto_154065 ) ) ( not ( = ?auto_154059 ?auto_154065 ) ) ( not ( = ?auto_154060 ?auto_154065 ) ) ( not ( = ?auto_154061 ?auto_154065 ) ) ( not ( = ?auto_154062 ?auto_154065 ) ) ( not ( = ?auto_154063 ?auto_154065 ) ) ( ON-TABLE ?auto_154065 ) ( ON ?auto_154057 ?auto_154064 ) ( not ( = ?auto_154057 ?auto_154064 ) ) ( not ( = ?auto_154058 ?auto_154064 ) ) ( not ( = ?auto_154059 ?auto_154064 ) ) ( not ( = ?auto_154060 ?auto_154064 ) ) ( not ( = ?auto_154061 ?auto_154064 ) ) ( not ( = ?auto_154062 ?auto_154064 ) ) ( not ( = ?auto_154063 ?auto_154064 ) ) ( not ( = ?auto_154065 ?auto_154064 ) ) ( ON ?auto_154058 ?auto_154057 ) ( ON-TABLE ?auto_154064 ) ( ON ?auto_154059 ?auto_154058 ) ( ON ?auto_154060 ?auto_154059 ) ( ON ?auto_154061 ?auto_154060 ) ( CLEAR ?auto_154061 ) ( HOLDING ?auto_154062 ) ( CLEAR ?auto_154063 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154065 ?auto_154063 ?auto_154062 )
      ( MAKE-7PILE ?auto_154057 ?auto_154058 ?auto_154059 ?auto_154060 ?auto_154061 ?auto_154062 ?auto_154063 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154066 - BLOCK
      ?auto_154067 - BLOCK
      ?auto_154068 - BLOCK
      ?auto_154069 - BLOCK
      ?auto_154070 - BLOCK
      ?auto_154071 - BLOCK
      ?auto_154072 - BLOCK
    )
    :vars
    (
      ?auto_154073 - BLOCK
      ?auto_154074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154066 ?auto_154067 ) ) ( not ( = ?auto_154066 ?auto_154068 ) ) ( not ( = ?auto_154066 ?auto_154069 ) ) ( not ( = ?auto_154066 ?auto_154070 ) ) ( not ( = ?auto_154066 ?auto_154071 ) ) ( not ( = ?auto_154066 ?auto_154072 ) ) ( not ( = ?auto_154067 ?auto_154068 ) ) ( not ( = ?auto_154067 ?auto_154069 ) ) ( not ( = ?auto_154067 ?auto_154070 ) ) ( not ( = ?auto_154067 ?auto_154071 ) ) ( not ( = ?auto_154067 ?auto_154072 ) ) ( not ( = ?auto_154068 ?auto_154069 ) ) ( not ( = ?auto_154068 ?auto_154070 ) ) ( not ( = ?auto_154068 ?auto_154071 ) ) ( not ( = ?auto_154068 ?auto_154072 ) ) ( not ( = ?auto_154069 ?auto_154070 ) ) ( not ( = ?auto_154069 ?auto_154071 ) ) ( not ( = ?auto_154069 ?auto_154072 ) ) ( not ( = ?auto_154070 ?auto_154071 ) ) ( not ( = ?auto_154070 ?auto_154072 ) ) ( not ( = ?auto_154071 ?auto_154072 ) ) ( ON ?auto_154072 ?auto_154073 ) ( not ( = ?auto_154066 ?auto_154073 ) ) ( not ( = ?auto_154067 ?auto_154073 ) ) ( not ( = ?auto_154068 ?auto_154073 ) ) ( not ( = ?auto_154069 ?auto_154073 ) ) ( not ( = ?auto_154070 ?auto_154073 ) ) ( not ( = ?auto_154071 ?auto_154073 ) ) ( not ( = ?auto_154072 ?auto_154073 ) ) ( ON-TABLE ?auto_154073 ) ( ON ?auto_154066 ?auto_154074 ) ( not ( = ?auto_154066 ?auto_154074 ) ) ( not ( = ?auto_154067 ?auto_154074 ) ) ( not ( = ?auto_154068 ?auto_154074 ) ) ( not ( = ?auto_154069 ?auto_154074 ) ) ( not ( = ?auto_154070 ?auto_154074 ) ) ( not ( = ?auto_154071 ?auto_154074 ) ) ( not ( = ?auto_154072 ?auto_154074 ) ) ( not ( = ?auto_154073 ?auto_154074 ) ) ( ON ?auto_154067 ?auto_154066 ) ( ON-TABLE ?auto_154074 ) ( ON ?auto_154068 ?auto_154067 ) ( ON ?auto_154069 ?auto_154068 ) ( ON ?auto_154070 ?auto_154069 ) ( CLEAR ?auto_154072 ) ( ON ?auto_154071 ?auto_154070 ) ( CLEAR ?auto_154071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154074 ?auto_154066 ?auto_154067 ?auto_154068 ?auto_154069 ?auto_154070 )
      ( MAKE-7PILE ?auto_154066 ?auto_154067 ?auto_154068 ?auto_154069 ?auto_154070 ?auto_154071 ?auto_154072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154075 - BLOCK
      ?auto_154076 - BLOCK
      ?auto_154077 - BLOCK
      ?auto_154078 - BLOCK
      ?auto_154079 - BLOCK
      ?auto_154080 - BLOCK
      ?auto_154081 - BLOCK
    )
    :vars
    (
      ?auto_154082 - BLOCK
      ?auto_154083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154075 ?auto_154076 ) ) ( not ( = ?auto_154075 ?auto_154077 ) ) ( not ( = ?auto_154075 ?auto_154078 ) ) ( not ( = ?auto_154075 ?auto_154079 ) ) ( not ( = ?auto_154075 ?auto_154080 ) ) ( not ( = ?auto_154075 ?auto_154081 ) ) ( not ( = ?auto_154076 ?auto_154077 ) ) ( not ( = ?auto_154076 ?auto_154078 ) ) ( not ( = ?auto_154076 ?auto_154079 ) ) ( not ( = ?auto_154076 ?auto_154080 ) ) ( not ( = ?auto_154076 ?auto_154081 ) ) ( not ( = ?auto_154077 ?auto_154078 ) ) ( not ( = ?auto_154077 ?auto_154079 ) ) ( not ( = ?auto_154077 ?auto_154080 ) ) ( not ( = ?auto_154077 ?auto_154081 ) ) ( not ( = ?auto_154078 ?auto_154079 ) ) ( not ( = ?auto_154078 ?auto_154080 ) ) ( not ( = ?auto_154078 ?auto_154081 ) ) ( not ( = ?auto_154079 ?auto_154080 ) ) ( not ( = ?auto_154079 ?auto_154081 ) ) ( not ( = ?auto_154080 ?auto_154081 ) ) ( not ( = ?auto_154075 ?auto_154082 ) ) ( not ( = ?auto_154076 ?auto_154082 ) ) ( not ( = ?auto_154077 ?auto_154082 ) ) ( not ( = ?auto_154078 ?auto_154082 ) ) ( not ( = ?auto_154079 ?auto_154082 ) ) ( not ( = ?auto_154080 ?auto_154082 ) ) ( not ( = ?auto_154081 ?auto_154082 ) ) ( ON-TABLE ?auto_154082 ) ( ON ?auto_154075 ?auto_154083 ) ( not ( = ?auto_154075 ?auto_154083 ) ) ( not ( = ?auto_154076 ?auto_154083 ) ) ( not ( = ?auto_154077 ?auto_154083 ) ) ( not ( = ?auto_154078 ?auto_154083 ) ) ( not ( = ?auto_154079 ?auto_154083 ) ) ( not ( = ?auto_154080 ?auto_154083 ) ) ( not ( = ?auto_154081 ?auto_154083 ) ) ( not ( = ?auto_154082 ?auto_154083 ) ) ( ON ?auto_154076 ?auto_154075 ) ( ON-TABLE ?auto_154083 ) ( ON ?auto_154077 ?auto_154076 ) ( ON ?auto_154078 ?auto_154077 ) ( ON ?auto_154079 ?auto_154078 ) ( ON ?auto_154080 ?auto_154079 ) ( CLEAR ?auto_154080 ) ( HOLDING ?auto_154081 ) ( CLEAR ?auto_154082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154082 ?auto_154081 )
      ( MAKE-7PILE ?auto_154075 ?auto_154076 ?auto_154077 ?auto_154078 ?auto_154079 ?auto_154080 ?auto_154081 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154084 - BLOCK
      ?auto_154085 - BLOCK
      ?auto_154086 - BLOCK
      ?auto_154087 - BLOCK
      ?auto_154088 - BLOCK
      ?auto_154089 - BLOCK
      ?auto_154090 - BLOCK
    )
    :vars
    (
      ?auto_154091 - BLOCK
      ?auto_154092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154084 ?auto_154085 ) ) ( not ( = ?auto_154084 ?auto_154086 ) ) ( not ( = ?auto_154084 ?auto_154087 ) ) ( not ( = ?auto_154084 ?auto_154088 ) ) ( not ( = ?auto_154084 ?auto_154089 ) ) ( not ( = ?auto_154084 ?auto_154090 ) ) ( not ( = ?auto_154085 ?auto_154086 ) ) ( not ( = ?auto_154085 ?auto_154087 ) ) ( not ( = ?auto_154085 ?auto_154088 ) ) ( not ( = ?auto_154085 ?auto_154089 ) ) ( not ( = ?auto_154085 ?auto_154090 ) ) ( not ( = ?auto_154086 ?auto_154087 ) ) ( not ( = ?auto_154086 ?auto_154088 ) ) ( not ( = ?auto_154086 ?auto_154089 ) ) ( not ( = ?auto_154086 ?auto_154090 ) ) ( not ( = ?auto_154087 ?auto_154088 ) ) ( not ( = ?auto_154087 ?auto_154089 ) ) ( not ( = ?auto_154087 ?auto_154090 ) ) ( not ( = ?auto_154088 ?auto_154089 ) ) ( not ( = ?auto_154088 ?auto_154090 ) ) ( not ( = ?auto_154089 ?auto_154090 ) ) ( not ( = ?auto_154084 ?auto_154091 ) ) ( not ( = ?auto_154085 ?auto_154091 ) ) ( not ( = ?auto_154086 ?auto_154091 ) ) ( not ( = ?auto_154087 ?auto_154091 ) ) ( not ( = ?auto_154088 ?auto_154091 ) ) ( not ( = ?auto_154089 ?auto_154091 ) ) ( not ( = ?auto_154090 ?auto_154091 ) ) ( ON-TABLE ?auto_154091 ) ( ON ?auto_154084 ?auto_154092 ) ( not ( = ?auto_154084 ?auto_154092 ) ) ( not ( = ?auto_154085 ?auto_154092 ) ) ( not ( = ?auto_154086 ?auto_154092 ) ) ( not ( = ?auto_154087 ?auto_154092 ) ) ( not ( = ?auto_154088 ?auto_154092 ) ) ( not ( = ?auto_154089 ?auto_154092 ) ) ( not ( = ?auto_154090 ?auto_154092 ) ) ( not ( = ?auto_154091 ?auto_154092 ) ) ( ON ?auto_154085 ?auto_154084 ) ( ON-TABLE ?auto_154092 ) ( ON ?auto_154086 ?auto_154085 ) ( ON ?auto_154087 ?auto_154086 ) ( ON ?auto_154088 ?auto_154087 ) ( ON ?auto_154089 ?auto_154088 ) ( CLEAR ?auto_154091 ) ( ON ?auto_154090 ?auto_154089 ) ( CLEAR ?auto_154090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154092 ?auto_154084 ?auto_154085 ?auto_154086 ?auto_154087 ?auto_154088 ?auto_154089 )
      ( MAKE-7PILE ?auto_154084 ?auto_154085 ?auto_154086 ?auto_154087 ?auto_154088 ?auto_154089 ?auto_154090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154093 - BLOCK
      ?auto_154094 - BLOCK
      ?auto_154095 - BLOCK
      ?auto_154096 - BLOCK
      ?auto_154097 - BLOCK
      ?auto_154098 - BLOCK
      ?auto_154099 - BLOCK
    )
    :vars
    (
      ?auto_154101 - BLOCK
      ?auto_154100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154093 ?auto_154094 ) ) ( not ( = ?auto_154093 ?auto_154095 ) ) ( not ( = ?auto_154093 ?auto_154096 ) ) ( not ( = ?auto_154093 ?auto_154097 ) ) ( not ( = ?auto_154093 ?auto_154098 ) ) ( not ( = ?auto_154093 ?auto_154099 ) ) ( not ( = ?auto_154094 ?auto_154095 ) ) ( not ( = ?auto_154094 ?auto_154096 ) ) ( not ( = ?auto_154094 ?auto_154097 ) ) ( not ( = ?auto_154094 ?auto_154098 ) ) ( not ( = ?auto_154094 ?auto_154099 ) ) ( not ( = ?auto_154095 ?auto_154096 ) ) ( not ( = ?auto_154095 ?auto_154097 ) ) ( not ( = ?auto_154095 ?auto_154098 ) ) ( not ( = ?auto_154095 ?auto_154099 ) ) ( not ( = ?auto_154096 ?auto_154097 ) ) ( not ( = ?auto_154096 ?auto_154098 ) ) ( not ( = ?auto_154096 ?auto_154099 ) ) ( not ( = ?auto_154097 ?auto_154098 ) ) ( not ( = ?auto_154097 ?auto_154099 ) ) ( not ( = ?auto_154098 ?auto_154099 ) ) ( not ( = ?auto_154093 ?auto_154101 ) ) ( not ( = ?auto_154094 ?auto_154101 ) ) ( not ( = ?auto_154095 ?auto_154101 ) ) ( not ( = ?auto_154096 ?auto_154101 ) ) ( not ( = ?auto_154097 ?auto_154101 ) ) ( not ( = ?auto_154098 ?auto_154101 ) ) ( not ( = ?auto_154099 ?auto_154101 ) ) ( ON ?auto_154093 ?auto_154100 ) ( not ( = ?auto_154093 ?auto_154100 ) ) ( not ( = ?auto_154094 ?auto_154100 ) ) ( not ( = ?auto_154095 ?auto_154100 ) ) ( not ( = ?auto_154096 ?auto_154100 ) ) ( not ( = ?auto_154097 ?auto_154100 ) ) ( not ( = ?auto_154098 ?auto_154100 ) ) ( not ( = ?auto_154099 ?auto_154100 ) ) ( not ( = ?auto_154101 ?auto_154100 ) ) ( ON ?auto_154094 ?auto_154093 ) ( ON-TABLE ?auto_154100 ) ( ON ?auto_154095 ?auto_154094 ) ( ON ?auto_154096 ?auto_154095 ) ( ON ?auto_154097 ?auto_154096 ) ( ON ?auto_154098 ?auto_154097 ) ( ON ?auto_154099 ?auto_154098 ) ( CLEAR ?auto_154099 ) ( HOLDING ?auto_154101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154101 )
      ( MAKE-7PILE ?auto_154093 ?auto_154094 ?auto_154095 ?auto_154096 ?auto_154097 ?auto_154098 ?auto_154099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_154102 - BLOCK
      ?auto_154103 - BLOCK
      ?auto_154104 - BLOCK
      ?auto_154105 - BLOCK
      ?auto_154106 - BLOCK
      ?auto_154107 - BLOCK
      ?auto_154108 - BLOCK
    )
    :vars
    (
      ?auto_154110 - BLOCK
      ?auto_154109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154102 ?auto_154103 ) ) ( not ( = ?auto_154102 ?auto_154104 ) ) ( not ( = ?auto_154102 ?auto_154105 ) ) ( not ( = ?auto_154102 ?auto_154106 ) ) ( not ( = ?auto_154102 ?auto_154107 ) ) ( not ( = ?auto_154102 ?auto_154108 ) ) ( not ( = ?auto_154103 ?auto_154104 ) ) ( not ( = ?auto_154103 ?auto_154105 ) ) ( not ( = ?auto_154103 ?auto_154106 ) ) ( not ( = ?auto_154103 ?auto_154107 ) ) ( not ( = ?auto_154103 ?auto_154108 ) ) ( not ( = ?auto_154104 ?auto_154105 ) ) ( not ( = ?auto_154104 ?auto_154106 ) ) ( not ( = ?auto_154104 ?auto_154107 ) ) ( not ( = ?auto_154104 ?auto_154108 ) ) ( not ( = ?auto_154105 ?auto_154106 ) ) ( not ( = ?auto_154105 ?auto_154107 ) ) ( not ( = ?auto_154105 ?auto_154108 ) ) ( not ( = ?auto_154106 ?auto_154107 ) ) ( not ( = ?auto_154106 ?auto_154108 ) ) ( not ( = ?auto_154107 ?auto_154108 ) ) ( not ( = ?auto_154102 ?auto_154110 ) ) ( not ( = ?auto_154103 ?auto_154110 ) ) ( not ( = ?auto_154104 ?auto_154110 ) ) ( not ( = ?auto_154105 ?auto_154110 ) ) ( not ( = ?auto_154106 ?auto_154110 ) ) ( not ( = ?auto_154107 ?auto_154110 ) ) ( not ( = ?auto_154108 ?auto_154110 ) ) ( ON ?auto_154102 ?auto_154109 ) ( not ( = ?auto_154102 ?auto_154109 ) ) ( not ( = ?auto_154103 ?auto_154109 ) ) ( not ( = ?auto_154104 ?auto_154109 ) ) ( not ( = ?auto_154105 ?auto_154109 ) ) ( not ( = ?auto_154106 ?auto_154109 ) ) ( not ( = ?auto_154107 ?auto_154109 ) ) ( not ( = ?auto_154108 ?auto_154109 ) ) ( not ( = ?auto_154110 ?auto_154109 ) ) ( ON ?auto_154103 ?auto_154102 ) ( ON-TABLE ?auto_154109 ) ( ON ?auto_154104 ?auto_154103 ) ( ON ?auto_154105 ?auto_154104 ) ( ON ?auto_154106 ?auto_154105 ) ( ON ?auto_154107 ?auto_154106 ) ( ON ?auto_154108 ?auto_154107 ) ( ON ?auto_154110 ?auto_154108 ) ( CLEAR ?auto_154110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154109 ?auto_154102 ?auto_154103 ?auto_154104 ?auto_154105 ?auto_154106 ?auto_154107 ?auto_154108 )
      ( MAKE-7PILE ?auto_154102 ?auto_154103 ?auto_154104 ?auto_154105 ?auto_154106 ?auto_154107 ?auto_154108 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154127 - BLOCK
      ?auto_154128 - BLOCK
      ?auto_154129 - BLOCK
      ?auto_154130 - BLOCK
      ?auto_154131 - BLOCK
      ?auto_154132 - BLOCK
      ?auto_154133 - BLOCK
      ?auto_154134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_154133 ) ( ON-TABLE ?auto_154127 ) ( ON ?auto_154128 ?auto_154127 ) ( ON ?auto_154129 ?auto_154128 ) ( ON ?auto_154130 ?auto_154129 ) ( ON ?auto_154131 ?auto_154130 ) ( ON ?auto_154132 ?auto_154131 ) ( ON ?auto_154133 ?auto_154132 ) ( not ( = ?auto_154127 ?auto_154128 ) ) ( not ( = ?auto_154127 ?auto_154129 ) ) ( not ( = ?auto_154127 ?auto_154130 ) ) ( not ( = ?auto_154127 ?auto_154131 ) ) ( not ( = ?auto_154127 ?auto_154132 ) ) ( not ( = ?auto_154127 ?auto_154133 ) ) ( not ( = ?auto_154127 ?auto_154134 ) ) ( not ( = ?auto_154128 ?auto_154129 ) ) ( not ( = ?auto_154128 ?auto_154130 ) ) ( not ( = ?auto_154128 ?auto_154131 ) ) ( not ( = ?auto_154128 ?auto_154132 ) ) ( not ( = ?auto_154128 ?auto_154133 ) ) ( not ( = ?auto_154128 ?auto_154134 ) ) ( not ( = ?auto_154129 ?auto_154130 ) ) ( not ( = ?auto_154129 ?auto_154131 ) ) ( not ( = ?auto_154129 ?auto_154132 ) ) ( not ( = ?auto_154129 ?auto_154133 ) ) ( not ( = ?auto_154129 ?auto_154134 ) ) ( not ( = ?auto_154130 ?auto_154131 ) ) ( not ( = ?auto_154130 ?auto_154132 ) ) ( not ( = ?auto_154130 ?auto_154133 ) ) ( not ( = ?auto_154130 ?auto_154134 ) ) ( not ( = ?auto_154131 ?auto_154132 ) ) ( not ( = ?auto_154131 ?auto_154133 ) ) ( not ( = ?auto_154131 ?auto_154134 ) ) ( not ( = ?auto_154132 ?auto_154133 ) ) ( not ( = ?auto_154132 ?auto_154134 ) ) ( not ( = ?auto_154133 ?auto_154134 ) ) ( ON-TABLE ?auto_154134 ) ( CLEAR ?auto_154134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_154134 )
      ( MAKE-8PILE ?auto_154127 ?auto_154128 ?auto_154129 ?auto_154130 ?auto_154131 ?auto_154132 ?auto_154133 ?auto_154134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154135 - BLOCK
      ?auto_154136 - BLOCK
      ?auto_154137 - BLOCK
      ?auto_154138 - BLOCK
      ?auto_154139 - BLOCK
      ?auto_154140 - BLOCK
      ?auto_154141 - BLOCK
      ?auto_154142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154135 ) ( ON ?auto_154136 ?auto_154135 ) ( ON ?auto_154137 ?auto_154136 ) ( ON ?auto_154138 ?auto_154137 ) ( ON ?auto_154139 ?auto_154138 ) ( ON ?auto_154140 ?auto_154139 ) ( not ( = ?auto_154135 ?auto_154136 ) ) ( not ( = ?auto_154135 ?auto_154137 ) ) ( not ( = ?auto_154135 ?auto_154138 ) ) ( not ( = ?auto_154135 ?auto_154139 ) ) ( not ( = ?auto_154135 ?auto_154140 ) ) ( not ( = ?auto_154135 ?auto_154141 ) ) ( not ( = ?auto_154135 ?auto_154142 ) ) ( not ( = ?auto_154136 ?auto_154137 ) ) ( not ( = ?auto_154136 ?auto_154138 ) ) ( not ( = ?auto_154136 ?auto_154139 ) ) ( not ( = ?auto_154136 ?auto_154140 ) ) ( not ( = ?auto_154136 ?auto_154141 ) ) ( not ( = ?auto_154136 ?auto_154142 ) ) ( not ( = ?auto_154137 ?auto_154138 ) ) ( not ( = ?auto_154137 ?auto_154139 ) ) ( not ( = ?auto_154137 ?auto_154140 ) ) ( not ( = ?auto_154137 ?auto_154141 ) ) ( not ( = ?auto_154137 ?auto_154142 ) ) ( not ( = ?auto_154138 ?auto_154139 ) ) ( not ( = ?auto_154138 ?auto_154140 ) ) ( not ( = ?auto_154138 ?auto_154141 ) ) ( not ( = ?auto_154138 ?auto_154142 ) ) ( not ( = ?auto_154139 ?auto_154140 ) ) ( not ( = ?auto_154139 ?auto_154141 ) ) ( not ( = ?auto_154139 ?auto_154142 ) ) ( not ( = ?auto_154140 ?auto_154141 ) ) ( not ( = ?auto_154140 ?auto_154142 ) ) ( not ( = ?auto_154141 ?auto_154142 ) ) ( ON-TABLE ?auto_154142 ) ( CLEAR ?auto_154142 ) ( HOLDING ?auto_154141 ) ( CLEAR ?auto_154140 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154135 ?auto_154136 ?auto_154137 ?auto_154138 ?auto_154139 ?auto_154140 ?auto_154141 )
      ( MAKE-8PILE ?auto_154135 ?auto_154136 ?auto_154137 ?auto_154138 ?auto_154139 ?auto_154140 ?auto_154141 ?auto_154142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154143 - BLOCK
      ?auto_154144 - BLOCK
      ?auto_154145 - BLOCK
      ?auto_154146 - BLOCK
      ?auto_154147 - BLOCK
      ?auto_154148 - BLOCK
      ?auto_154149 - BLOCK
      ?auto_154150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154143 ) ( ON ?auto_154144 ?auto_154143 ) ( ON ?auto_154145 ?auto_154144 ) ( ON ?auto_154146 ?auto_154145 ) ( ON ?auto_154147 ?auto_154146 ) ( ON ?auto_154148 ?auto_154147 ) ( not ( = ?auto_154143 ?auto_154144 ) ) ( not ( = ?auto_154143 ?auto_154145 ) ) ( not ( = ?auto_154143 ?auto_154146 ) ) ( not ( = ?auto_154143 ?auto_154147 ) ) ( not ( = ?auto_154143 ?auto_154148 ) ) ( not ( = ?auto_154143 ?auto_154149 ) ) ( not ( = ?auto_154143 ?auto_154150 ) ) ( not ( = ?auto_154144 ?auto_154145 ) ) ( not ( = ?auto_154144 ?auto_154146 ) ) ( not ( = ?auto_154144 ?auto_154147 ) ) ( not ( = ?auto_154144 ?auto_154148 ) ) ( not ( = ?auto_154144 ?auto_154149 ) ) ( not ( = ?auto_154144 ?auto_154150 ) ) ( not ( = ?auto_154145 ?auto_154146 ) ) ( not ( = ?auto_154145 ?auto_154147 ) ) ( not ( = ?auto_154145 ?auto_154148 ) ) ( not ( = ?auto_154145 ?auto_154149 ) ) ( not ( = ?auto_154145 ?auto_154150 ) ) ( not ( = ?auto_154146 ?auto_154147 ) ) ( not ( = ?auto_154146 ?auto_154148 ) ) ( not ( = ?auto_154146 ?auto_154149 ) ) ( not ( = ?auto_154146 ?auto_154150 ) ) ( not ( = ?auto_154147 ?auto_154148 ) ) ( not ( = ?auto_154147 ?auto_154149 ) ) ( not ( = ?auto_154147 ?auto_154150 ) ) ( not ( = ?auto_154148 ?auto_154149 ) ) ( not ( = ?auto_154148 ?auto_154150 ) ) ( not ( = ?auto_154149 ?auto_154150 ) ) ( ON-TABLE ?auto_154150 ) ( CLEAR ?auto_154148 ) ( ON ?auto_154149 ?auto_154150 ) ( CLEAR ?auto_154149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154150 )
      ( MAKE-8PILE ?auto_154143 ?auto_154144 ?auto_154145 ?auto_154146 ?auto_154147 ?auto_154148 ?auto_154149 ?auto_154150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154151 - BLOCK
      ?auto_154152 - BLOCK
      ?auto_154153 - BLOCK
      ?auto_154154 - BLOCK
      ?auto_154155 - BLOCK
      ?auto_154156 - BLOCK
      ?auto_154157 - BLOCK
      ?auto_154158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154151 ) ( ON ?auto_154152 ?auto_154151 ) ( ON ?auto_154153 ?auto_154152 ) ( ON ?auto_154154 ?auto_154153 ) ( ON ?auto_154155 ?auto_154154 ) ( not ( = ?auto_154151 ?auto_154152 ) ) ( not ( = ?auto_154151 ?auto_154153 ) ) ( not ( = ?auto_154151 ?auto_154154 ) ) ( not ( = ?auto_154151 ?auto_154155 ) ) ( not ( = ?auto_154151 ?auto_154156 ) ) ( not ( = ?auto_154151 ?auto_154157 ) ) ( not ( = ?auto_154151 ?auto_154158 ) ) ( not ( = ?auto_154152 ?auto_154153 ) ) ( not ( = ?auto_154152 ?auto_154154 ) ) ( not ( = ?auto_154152 ?auto_154155 ) ) ( not ( = ?auto_154152 ?auto_154156 ) ) ( not ( = ?auto_154152 ?auto_154157 ) ) ( not ( = ?auto_154152 ?auto_154158 ) ) ( not ( = ?auto_154153 ?auto_154154 ) ) ( not ( = ?auto_154153 ?auto_154155 ) ) ( not ( = ?auto_154153 ?auto_154156 ) ) ( not ( = ?auto_154153 ?auto_154157 ) ) ( not ( = ?auto_154153 ?auto_154158 ) ) ( not ( = ?auto_154154 ?auto_154155 ) ) ( not ( = ?auto_154154 ?auto_154156 ) ) ( not ( = ?auto_154154 ?auto_154157 ) ) ( not ( = ?auto_154154 ?auto_154158 ) ) ( not ( = ?auto_154155 ?auto_154156 ) ) ( not ( = ?auto_154155 ?auto_154157 ) ) ( not ( = ?auto_154155 ?auto_154158 ) ) ( not ( = ?auto_154156 ?auto_154157 ) ) ( not ( = ?auto_154156 ?auto_154158 ) ) ( not ( = ?auto_154157 ?auto_154158 ) ) ( ON-TABLE ?auto_154158 ) ( ON ?auto_154157 ?auto_154158 ) ( CLEAR ?auto_154157 ) ( HOLDING ?auto_154156 ) ( CLEAR ?auto_154155 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154151 ?auto_154152 ?auto_154153 ?auto_154154 ?auto_154155 ?auto_154156 )
      ( MAKE-8PILE ?auto_154151 ?auto_154152 ?auto_154153 ?auto_154154 ?auto_154155 ?auto_154156 ?auto_154157 ?auto_154158 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154159 - BLOCK
      ?auto_154160 - BLOCK
      ?auto_154161 - BLOCK
      ?auto_154162 - BLOCK
      ?auto_154163 - BLOCK
      ?auto_154164 - BLOCK
      ?auto_154165 - BLOCK
      ?auto_154166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154159 ) ( ON ?auto_154160 ?auto_154159 ) ( ON ?auto_154161 ?auto_154160 ) ( ON ?auto_154162 ?auto_154161 ) ( ON ?auto_154163 ?auto_154162 ) ( not ( = ?auto_154159 ?auto_154160 ) ) ( not ( = ?auto_154159 ?auto_154161 ) ) ( not ( = ?auto_154159 ?auto_154162 ) ) ( not ( = ?auto_154159 ?auto_154163 ) ) ( not ( = ?auto_154159 ?auto_154164 ) ) ( not ( = ?auto_154159 ?auto_154165 ) ) ( not ( = ?auto_154159 ?auto_154166 ) ) ( not ( = ?auto_154160 ?auto_154161 ) ) ( not ( = ?auto_154160 ?auto_154162 ) ) ( not ( = ?auto_154160 ?auto_154163 ) ) ( not ( = ?auto_154160 ?auto_154164 ) ) ( not ( = ?auto_154160 ?auto_154165 ) ) ( not ( = ?auto_154160 ?auto_154166 ) ) ( not ( = ?auto_154161 ?auto_154162 ) ) ( not ( = ?auto_154161 ?auto_154163 ) ) ( not ( = ?auto_154161 ?auto_154164 ) ) ( not ( = ?auto_154161 ?auto_154165 ) ) ( not ( = ?auto_154161 ?auto_154166 ) ) ( not ( = ?auto_154162 ?auto_154163 ) ) ( not ( = ?auto_154162 ?auto_154164 ) ) ( not ( = ?auto_154162 ?auto_154165 ) ) ( not ( = ?auto_154162 ?auto_154166 ) ) ( not ( = ?auto_154163 ?auto_154164 ) ) ( not ( = ?auto_154163 ?auto_154165 ) ) ( not ( = ?auto_154163 ?auto_154166 ) ) ( not ( = ?auto_154164 ?auto_154165 ) ) ( not ( = ?auto_154164 ?auto_154166 ) ) ( not ( = ?auto_154165 ?auto_154166 ) ) ( ON-TABLE ?auto_154166 ) ( ON ?auto_154165 ?auto_154166 ) ( CLEAR ?auto_154163 ) ( ON ?auto_154164 ?auto_154165 ) ( CLEAR ?auto_154164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154166 ?auto_154165 )
      ( MAKE-8PILE ?auto_154159 ?auto_154160 ?auto_154161 ?auto_154162 ?auto_154163 ?auto_154164 ?auto_154165 ?auto_154166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154167 - BLOCK
      ?auto_154168 - BLOCK
      ?auto_154169 - BLOCK
      ?auto_154170 - BLOCK
      ?auto_154171 - BLOCK
      ?auto_154172 - BLOCK
      ?auto_154173 - BLOCK
      ?auto_154174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154167 ) ( ON ?auto_154168 ?auto_154167 ) ( ON ?auto_154169 ?auto_154168 ) ( ON ?auto_154170 ?auto_154169 ) ( not ( = ?auto_154167 ?auto_154168 ) ) ( not ( = ?auto_154167 ?auto_154169 ) ) ( not ( = ?auto_154167 ?auto_154170 ) ) ( not ( = ?auto_154167 ?auto_154171 ) ) ( not ( = ?auto_154167 ?auto_154172 ) ) ( not ( = ?auto_154167 ?auto_154173 ) ) ( not ( = ?auto_154167 ?auto_154174 ) ) ( not ( = ?auto_154168 ?auto_154169 ) ) ( not ( = ?auto_154168 ?auto_154170 ) ) ( not ( = ?auto_154168 ?auto_154171 ) ) ( not ( = ?auto_154168 ?auto_154172 ) ) ( not ( = ?auto_154168 ?auto_154173 ) ) ( not ( = ?auto_154168 ?auto_154174 ) ) ( not ( = ?auto_154169 ?auto_154170 ) ) ( not ( = ?auto_154169 ?auto_154171 ) ) ( not ( = ?auto_154169 ?auto_154172 ) ) ( not ( = ?auto_154169 ?auto_154173 ) ) ( not ( = ?auto_154169 ?auto_154174 ) ) ( not ( = ?auto_154170 ?auto_154171 ) ) ( not ( = ?auto_154170 ?auto_154172 ) ) ( not ( = ?auto_154170 ?auto_154173 ) ) ( not ( = ?auto_154170 ?auto_154174 ) ) ( not ( = ?auto_154171 ?auto_154172 ) ) ( not ( = ?auto_154171 ?auto_154173 ) ) ( not ( = ?auto_154171 ?auto_154174 ) ) ( not ( = ?auto_154172 ?auto_154173 ) ) ( not ( = ?auto_154172 ?auto_154174 ) ) ( not ( = ?auto_154173 ?auto_154174 ) ) ( ON-TABLE ?auto_154174 ) ( ON ?auto_154173 ?auto_154174 ) ( ON ?auto_154172 ?auto_154173 ) ( CLEAR ?auto_154172 ) ( HOLDING ?auto_154171 ) ( CLEAR ?auto_154170 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154167 ?auto_154168 ?auto_154169 ?auto_154170 ?auto_154171 )
      ( MAKE-8PILE ?auto_154167 ?auto_154168 ?auto_154169 ?auto_154170 ?auto_154171 ?auto_154172 ?auto_154173 ?auto_154174 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154175 - BLOCK
      ?auto_154176 - BLOCK
      ?auto_154177 - BLOCK
      ?auto_154178 - BLOCK
      ?auto_154179 - BLOCK
      ?auto_154180 - BLOCK
      ?auto_154181 - BLOCK
      ?auto_154182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154175 ) ( ON ?auto_154176 ?auto_154175 ) ( ON ?auto_154177 ?auto_154176 ) ( ON ?auto_154178 ?auto_154177 ) ( not ( = ?auto_154175 ?auto_154176 ) ) ( not ( = ?auto_154175 ?auto_154177 ) ) ( not ( = ?auto_154175 ?auto_154178 ) ) ( not ( = ?auto_154175 ?auto_154179 ) ) ( not ( = ?auto_154175 ?auto_154180 ) ) ( not ( = ?auto_154175 ?auto_154181 ) ) ( not ( = ?auto_154175 ?auto_154182 ) ) ( not ( = ?auto_154176 ?auto_154177 ) ) ( not ( = ?auto_154176 ?auto_154178 ) ) ( not ( = ?auto_154176 ?auto_154179 ) ) ( not ( = ?auto_154176 ?auto_154180 ) ) ( not ( = ?auto_154176 ?auto_154181 ) ) ( not ( = ?auto_154176 ?auto_154182 ) ) ( not ( = ?auto_154177 ?auto_154178 ) ) ( not ( = ?auto_154177 ?auto_154179 ) ) ( not ( = ?auto_154177 ?auto_154180 ) ) ( not ( = ?auto_154177 ?auto_154181 ) ) ( not ( = ?auto_154177 ?auto_154182 ) ) ( not ( = ?auto_154178 ?auto_154179 ) ) ( not ( = ?auto_154178 ?auto_154180 ) ) ( not ( = ?auto_154178 ?auto_154181 ) ) ( not ( = ?auto_154178 ?auto_154182 ) ) ( not ( = ?auto_154179 ?auto_154180 ) ) ( not ( = ?auto_154179 ?auto_154181 ) ) ( not ( = ?auto_154179 ?auto_154182 ) ) ( not ( = ?auto_154180 ?auto_154181 ) ) ( not ( = ?auto_154180 ?auto_154182 ) ) ( not ( = ?auto_154181 ?auto_154182 ) ) ( ON-TABLE ?auto_154182 ) ( ON ?auto_154181 ?auto_154182 ) ( ON ?auto_154180 ?auto_154181 ) ( CLEAR ?auto_154178 ) ( ON ?auto_154179 ?auto_154180 ) ( CLEAR ?auto_154179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154182 ?auto_154181 ?auto_154180 )
      ( MAKE-8PILE ?auto_154175 ?auto_154176 ?auto_154177 ?auto_154178 ?auto_154179 ?auto_154180 ?auto_154181 ?auto_154182 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154183 - BLOCK
      ?auto_154184 - BLOCK
      ?auto_154185 - BLOCK
      ?auto_154186 - BLOCK
      ?auto_154187 - BLOCK
      ?auto_154188 - BLOCK
      ?auto_154189 - BLOCK
      ?auto_154190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154183 ) ( ON ?auto_154184 ?auto_154183 ) ( ON ?auto_154185 ?auto_154184 ) ( not ( = ?auto_154183 ?auto_154184 ) ) ( not ( = ?auto_154183 ?auto_154185 ) ) ( not ( = ?auto_154183 ?auto_154186 ) ) ( not ( = ?auto_154183 ?auto_154187 ) ) ( not ( = ?auto_154183 ?auto_154188 ) ) ( not ( = ?auto_154183 ?auto_154189 ) ) ( not ( = ?auto_154183 ?auto_154190 ) ) ( not ( = ?auto_154184 ?auto_154185 ) ) ( not ( = ?auto_154184 ?auto_154186 ) ) ( not ( = ?auto_154184 ?auto_154187 ) ) ( not ( = ?auto_154184 ?auto_154188 ) ) ( not ( = ?auto_154184 ?auto_154189 ) ) ( not ( = ?auto_154184 ?auto_154190 ) ) ( not ( = ?auto_154185 ?auto_154186 ) ) ( not ( = ?auto_154185 ?auto_154187 ) ) ( not ( = ?auto_154185 ?auto_154188 ) ) ( not ( = ?auto_154185 ?auto_154189 ) ) ( not ( = ?auto_154185 ?auto_154190 ) ) ( not ( = ?auto_154186 ?auto_154187 ) ) ( not ( = ?auto_154186 ?auto_154188 ) ) ( not ( = ?auto_154186 ?auto_154189 ) ) ( not ( = ?auto_154186 ?auto_154190 ) ) ( not ( = ?auto_154187 ?auto_154188 ) ) ( not ( = ?auto_154187 ?auto_154189 ) ) ( not ( = ?auto_154187 ?auto_154190 ) ) ( not ( = ?auto_154188 ?auto_154189 ) ) ( not ( = ?auto_154188 ?auto_154190 ) ) ( not ( = ?auto_154189 ?auto_154190 ) ) ( ON-TABLE ?auto_154190 ) ( ON ?auto_154189 ?auto_154190 ) ( ON ?auto_154188 ?auto_154189 ) ( ON ?auto_154187 ?auto_154188 ) ( CLEAR ?auto_154187 ) ( HOLDING ?auto_154186 ) ( CLEAR ?auto_154185 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154183 ?auto_154184 ?auto_154185 ?auto_154186 )
      ( MAKE-8PILE ?auto_154183 ?auto_154184 ?auto_154185 ?auto_154186 ?auto_154187 ?auto_154188 ?auto_154189 ?auto_154190 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154191 - BLOCK
      ?auto_154192 - BLOCK
      ?auto_154193 - BLOCK
      ?auto_154194 - BLOCK
      ?auto_154195 - BLOCK
      ?auto_154196 - BLOCK
      ?auto_154197 - BLOCK
      ?auto_154198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154191 ) ( ON ?auto_154192 ?auto_154191 ) ( ON ?auto_154193 ?auto_154192 ) ( not ( = ?auto_154191 ?auto_154192 ) ) ( not ( = ?auto_154191 ?auto_154193 ) ) ( not ( = ?auto_154191 ?auto_154194 ) ) ( not ( = ?auto_154191 ?auto_154195 ) ) ( not ( = ?auto_154191 ?auto_154196 ) ) ( not ( = ?auto_154191 ?auto_154197 ) ) ( not ( = ?auto_154191 ?auto_154198 ) ) ( not ( = ?auto_154192 ?auto_154193 ) ) ( not ( = ?auto_154192 ?auto_154194 ) ) ( not ( = ?auto_154192 ?auto_154195 ) ) ( not ( = ?auto_154192 ?auto_154196 ) ) ( not ( = ?auto_154192 ?auto_154197 ) ) ( not ( = ?auto_154192 ?auto_154198 ) ) ( not ( = ?auto_154193 ?auto_154194 ) ) ( not ( = ?auto_154193 ?auto_154195 ) ) ( not ( = ?auto_154193 ?auto_154196 ) ) ( not ( = ?auto_154193 ?auto_154197 ) ) ( not ( = ?auto_154193 ?auto_154198 ) ) ( not ( = ?auto_154194 ?auto_154195 ) ) ( not ( = ?auto_154194 ?auto_154196 ) ) ( not ( = ?auto_154194 ?auto_154197 ) ) ( not ( = ?auto_154194 ?auto_154198 ) ) ( not ( = ?auto_154195 ?auto_154196 ) ) ( not ( = ?auto_154195 ?auto_154197 ) ) ( not ( = ?auto_154195 ?auto_154198 ) ) ( not ( = ?auto_154196 ?auto_154197 ) ) ( not ( = ?auto_154196 ?auto_154198 ) ) ( not ( = ?auto_154197 ?auto_154198 ) ) ( ON-TABLE ?auto_154198 ) ( ON ?auto_154197 ?auto_154198 ) ( ON ?auto_154196 ?auto_154197 ) ( ON ?auto_154195 ?auto_154196 ) ( CLEAR ?auto_154193 ) ( ON ?auto_154194 ?auto_154195 ) ( CLEAR ?auto_154194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154198 ?auto_154197 ?auto_154196 ?auto_154195 )
      ( MAKE-8PILE ?auto_154191 ?auto_154192 ?auto_154193 ?auto_154194 ?auto_154195 ?auto_154196 ?auto_154197 ?auto_154198 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154199 - BLOCK
      ?auto_154200 - BLOCK
      ?auto_154201 - BLOCK
      ?auto_154202 - BLOCK
      ?auto_154203 - BLOCK
      ?auto_154204 - BLOCK
      ?auto_154205 - BLOCK
      ?auto_154206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154199 ) ( ON ?auto_154200 ?auto_154199 ) ( not ( = ?auto_154199 ?auto_154200 ) ) ( not ( = ?auto_154199 ?auto_154201 ) ) ( not ( = ?auto_154199 ?auto_154202 ) ) ( not ( = ?auto_154199 ?auto_154203 ) ) ( not ( = ?auto_154199 ?auto_154204 ) ) ( not ( = ?auto_154199 ?auto_154205 ) ) ( not ( = ?auto_154199 ?auto_154206 ) ) ( not ( = ?auto_154200 ?auto_154201 ) ) ( not ( = ?auto_154200 ?auto_154202 ) ) ( not ( = ?auto_154200 ?auto_154203 ) ) ( not ( = ?auto_154200 ?auto_154204 ) ) ( not ( = ?auto_154200 ?auto_154205 ) ) ( not ( = ?auto_154200 ?auto_154206 ) ) ( not ( = ?auto_154201 ?auto_154202 ) ) ( not ( = ?auto_154201 ?auto_154203 ) ) ( not ( = ?auto_154201 ?auto_154204 ) ) ( not ( = ?auto_154201 ?auto_154205 ) ) ( not ( = ?auto_154201 ?auto_154206 ) ) ( not ( = ?auto_154202 ?auto_154203 ) ) ( not ( = ?auto_154202 ?auto_154204 ) ) ( not ( = ?auto_154202 ?auto_154205 ) ) ( not ( = ?auto_154202 ?auto_154206 ) ) ( not ( = ?auto_154203 ?auto_154204 ) ) ( not ( = ?auto_154203 ?auto_154205 ) ) ( not ( = ?auto_154203 ?auto_154206 ) ) ( not ( = ?auto_154204 ?auto_154205 ) ) ( not ( = ?auto_154204 ?auto_154206 ) ) ( not ( = ?auto_154205 ?auto_154206 ) ) ( ON-TABLE ?auto_154206 ) ( ON ?auto_154205 ?auto_154206 ) ( ON ?auto_154204 ?auto_154205 ) ( ON ?auto_154203 ?auto_154204 ) ( ON ?auto_154202 ?auto_154203 ) ( CLEAR ?auto_154202 ) ( HOLDING ?auto_154201 ) ( CLEAR ?auto_154200 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154199 ?auto_154200 ?auto_154201 )
      ( MAKE-8PILE ?auto_154199 ?auto_154200 ?auto_154201 ?auto_154202 ?auto_154203 ?auto_154204 ?auto_154205 ?auto_154206 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154207 - BLOCK
      ?auto_154208 - BLOCK
      ?auto_154209 - BLOCK
      ?auto_154210 - BLOCK
      ?auto_154211 - BLOCK
      ?auto_154212 - BLOCK
      ?auto_154213 - BLOCK
      ?auto_154214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154207 ) ( ON ?auto_154208 ?auto_154207 ) ( not ( = ?auto_154207 ?auto_154208 ) ) ( not ( = ?auto_154207 ?auto_154209 ) ) ( not ( = ?auto_154207 ?auto_154210 ) ) ( not ( = ?auto_154207 ?auto_154211 ) ) ( not ( = ?auto_154207 ?auto_154212 ) ) ( not ( = ?auto_154207 ?auto_154213 ) ) ( not ( = ?auto_154207 ?auto_154214 ) ) ( not ( = ?auto_154208 ?auto_154209 ) ) ( not ( = ?auto_154208 ?auto_154210 ) ) ( not ( = ?auto_154208 ?auto_154211 ) ) ( not ( = ?auto_154208 ?auto_154212 ) ) ( not ( = ?auto_154208 ?auto_154213 ) ) ( not ( = ?auto_154208 ?auto_154214 ) ) ( not ( = ?auto_154209 ?auto_154210 ) ) ( not ( = ?auto_154209 ?auto_154211 ) ) ( not ( = ?auto_154209 ?auto_154212 ) ) ( not ( = ?auto_154209 ?auto_154213 ) ) ( not ( = ?auto_154209 ?auto_154214 ) ) ( not ( = ?auto_154210 ?auto_154211 ) ) ( not ( = ?auto_154210 ?auto_154212 ) ) ( not ( = ?auto_154210 ?auto_154213 ) ) ( not ( = ?auto_154210 ?auto_154214 ) ) ( not ( = ?auto_154211 ?auto_154212 ) ) ( not ( = ?auto_154211 ?auto_154213 ) ) ( not ( = ?auto_154211 ?auto_154214 ) ) ( not ( = ?auto_154212 ?auto_154213 ) ) ( not ( = ?auto_154212 ?auto_154214 ) ) ( not ( = ?auto_154213 ?auto_154214 ) ) ( ON-TABLE ?auto_154214 ) ( ON ?auto_154213 ?auto_154214 ) ( ON ?auto_154212 ?auto_154213 ) ( ON ?auto_154211 ?auto_154212 ) ( ON ?auto_154210 ?auto_154211 ) ( CLEAR ?auto_154208 ) ( ON ?auto_154209 ?auto_154210 ) ( CLEAR ?auto_154209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154214 ?auto_154213 ?auto_154212 ?auto_154211 ?auto_154210 )
      ( MAKE-8PILE ?auto_154207 ?auto_154208 ?auto_154209 ?auto_154210 ?auto_154211 ?auto_154212 ?auto_154213 ?auto_154214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154215 - BLOCK
      ?auto_154216 - BLOCK
      ?auto_154217 - BLOCK
      ?auto_154218 - BLOCK
      ?auto_154219 - BLOCK
      ?auto_154220 - BLOCK
      ?auto_154221 - BLOCK
      ?auto_154222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154215 ) ( not ( = ?auto_154215 ?auto_154216 ) ) ( not ( = ?auto_154215 ?auto_154217 ) ) ( not ( = ?auto_154215 ?auto_154218 ) ) ( not ( = ?auto_154215 ?auto_154219 ) ) ( not ( = ?auto_154215 ?auto_154220 ) ) ( not ( = ?auto_154215 ?auto_154221 ) ) ( not ( = ?auto_154215 ?auto_154222 ) ) ( not ( = ?auto_154216 ?auto_154217 ) ) ( not ( = ?auto_154216 ?auto_154218 ) ) ( not ( = ?auto_154216 ?auto_154219 ) ) ( not ( = ?auto_154216 ?auto_154220 ) ) ( not ( = ?auto_154216 ?auto_154221 ) ) ( not ( = ?auto_154216 ?auto_154222 ) ) ( not ( = ?auto_154217 ?auto_154218 ) ) ( not ( = ?auto_154217 ?auto_154219 ) ) ( not ( = ?auto_154217 ?auto_154220 ) ) ( not ( = ?auto_154217 ?auto_154221 ) ) ( not ( = ?auto_154217 ?auto_154222 ) ) ( not ( = ?auto_154218 ?auto_154219 ) ) ( not ( = ?auto_154218 ?auto_154220 ) ) ( not ( = ?auto_154218 ?auto_154221 ) ) ( not ( = ?auto_154218 ?auto_154222 ) ) ( not ( = ?auto_154219 ?auto_154220 ) ) ( not ( = ?auto_154219 ?auto_154221 ) ) ( not ( = ?auto_154219 ?auto_154222 ) ) ( not ( = ?auto_154220 ?auto_154221 ) ) ( not ( = ?auto_154220 ?auto_154222 ) ) ( not ( = ?auto_154221 ?auto_154222 ) ) ( ON-TABLE ?auto_154222 ) ( ON ?auto_154221 ?auto_154222 ) ( ON ?auto_154220 ?auto_154221 ) ( ON ?auto_154219 ?auto_154220 ) ( ON ?auto_154218 ?auto_154219 ) ( ON ?auto_154217 ?auto_154218 ) ( CLEAR ?auto_154217 ) ( HOLDING ?auto_154216 ) ( CLEAR ?auto_154215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154215 ?auto_154216 )
      ( MAKE-8PILE ?auto_154215 ?auto_154216 ?auto_154217 ?auto_154218 ?auto_154219 ?auto_154220 ?auto_154221 ?auto_154222 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154223 - BLOCK
      ?auto_154224 - BLOCK
      ?auto_154225 - BLOCK
      ?auto_154226 - BLOCK
      ?auto_154227 - BLOCK
      ?auto_154228 - BLOCK
      ?auto_154229 - BLOCK
      ?auto_154230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_154223 ) ( not ( = ?auto_154223 ?auto_154224 ) ) ( not ( = ?auto_154223 ?auto_154225 ) ) ( not ( = ?auto_154223 ?auto_154226 ) ) ( not ( = ?auto_154223 ?auto_154227 ) ) ( not ( = ?auto_154223 ?auto_154228 ) ) ( not ( = ?auto_154223 ?auto_154229 ) ) ( not ( = ?auto_154223 ?auto_154230 ) ) ( not ( = ?auto_154224 ?auto_154225 ) ) ( not ( = ?auto_154224 ?auto_154226 ) ) ( not ( = ?auto_154224 ?auto_154227 ) ) ( not ( = ?auto_154224 ?auto_154228 ) ) ( not ( = ?auto_154224 ?auto_154229 ) ) ( not ( = ?auto_154224 ?auto_154230 ) ) ( not ( = ?auto_154225 ?auto_154226 ) ) ( not ( = ?auto_154225 ?auto_154227 ) ) ( not ( = ?auto_154225 ?auto_154228 ) ) ( not ( = ?auto_154225 ?auto_154229 ) ) ( not ( = ?auto_154225 ?auto_154230 ) ) ( not ( = ?auto_154226 ?auto_154227 ) ) ( not ( = ?auto_154226 ?auto_154228 ) ) ( not ( = ?auto_154226 ?auto_154229 ) ) ( not ( = ?auto_154226 ?auto_154230 ) ) ( not ( = ?auto_154227 ?auto_154228 ) ) ( not ( = ?auto_154227 ?auto_154229 ) ) ( not ( = ?auto_154227 ?auto_154230 ) ) ( not ( = ?auto_154228 ?auto_154229 ) ) ( not ( = ?auto_154228 ?auto_154230 ) ) ( not ( = ?auto_154229 ?auto_154230 ) ) ( ON-TABLE ?auto_154230 ) ( ON ?auto_154229 ?auto_154230 ) ( ON ?auto_154228 ?auto_154229 ) ( ON ?auto_154227 ?auto_154228 ) ( ON ?auto_154226 ?auto_154227 ) ( ON ?auto_154225 ?auto_154226 ) ( CLEAR ?auto_154223 ) ( ON ?auto_154224 ?auto_154225 ) ( CLEAR ?auto_154224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154230 ?auto_154229 ?auto_154228 ?auto_154227 ?auto_154226 ?auto_154225 )
      ( MAKE-8PILE ?auto_154223 ?auto_154224 ?auto_154225 ?auto_154226 ?auto_154227 ?auto_154228 ?auto_154229 ?auto_154230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154231 - BLOCK
      ?auto_154232 - BLOCK
      ?auto_154233 - BLOCK
      ?auto_154234 - BLOCK
      ?auto_154235 - BLOCK
      ?auto_154236 - BLOCK
      ?auto_154237 - BLOCK
      ?auto_154238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154231 ?auto_154232 ) ) ( not ( = ?auto_154231 ?auto_154233 ) ) ( not ( = ?auto_154231 ?auto_154234 ) ) ( not ( = ?auto_154231 ?auto_154235 ) ) ( not ( = ?auto_154231 ?auto_154236 ) ) ( not ( = ?auto_154231 ?auto_154237 ) ) ( not ( = ?auto_154231 ?auto_154238 ) ) ( not ( = ?auto_154232 ?auto_154233 ) ) ( not ( = ?auto_154232 ?auto_154234 ) ) ( not ( = ?auto_154232 ?auto_154235 ) ) ( not ( = ?auto_154232 ?auto_154236 ) ) ( not ( = ?auto_154232 ?auto_154237 ) ) ( not ( = ?auto_154232 ?auto_154238 ) ) ( not ( = ?auto_154233 ?auto_154234 ) ) ( not ( = ?auto_154233 ?auto_154235 ) ) ( not ( = ?auto_154233 ?auto_154236 ) ) ( not ( = ?auto_154233 ?auto_154237 ) ) ( not ( = ?auto_154233 ?auto_154238 ) ) ( not ( = ?auto_154234 ?auto_154235 ) ) ( not ( = ?auto_154234 ?auto_154236 ) ) ( not ( = ?auto_154234 ?auto_154237 ) ) ( not ( = ?auto_154234 ?auto_154238 ) ) ( not ( = ?auto_154235 ?auto_154236 ) ) ( not ( = ?auto_154235 ?auto_154237 ) ) ( not ( = ?auto_154235 ?auto_154238 ) ) ( not ( = ?auto_154236 ?auto_154237 ) ) ( not ( = ?auto_154236 ?auto_154238 ) ) ( not ( = ?auto_154237 ?auto_154238 ) ) ( ON-TABLE ?auto_154238 ) ( ON ?auto_154237 ?auto_154238 ) ( ON ?auto_154236 ?auto_154237 ) ( ON ?auto_154235 ?auto_154236 ) ( ON ?auto_154234 ?auto_154235 ) ( ON ?auto_154233 ?auto_154234 ) ( ON ?auto_154232 ?auto_154233 ) ( CLEAR ?auto_154232 ) ( HOLDING ?auto_154231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154231 )
      ( MAKE-8PILE ?auto_154231 ?auto_154232 ?auto_154233 ?auto_154234 ?auto_154235 ?auto_154236 ?auto_154237 ?auto_154238 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154239 - BLOCK
      ?auto_154240 - BLOCK
      ?auto_154241 - BLOCK
      ?auto_154242 - BLOCK
      ?auto_154243 - BLOCK
      ?auto_154244 - BLOCK
      ?auto_154245 - BLOCK
      ?auto_154246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154239 ?auto_154240 ) ) ( not ( = ?auto_154239 ?auto_154241 ) ) ( not ( = ?auto_154239 ?auto_154242 ) ) ( not ( = ?auto_154239 ?auto_154243 ) ) ( not ( = ?auto_154239 ?auto_154244 ) ) ( not ( = ?auto_154239 ?auto_154245 ) ) ( not ( = ?auto_154239 ?auto_154246 ) ) ( not ( = ?auto_154240 ?auto_154241 ) ) ( not ( = ?auto_154240 ?auto_154242 ) ) ( not ( = ?auto_154240 ?auto_154243 ) ) ( not ( = ?auto_154240 ?auto_154244 ) ) ( not ( = ?auto_154240 ?auto_154245 ) ) ( not ( = ?auto_154240 ?auto_154246 ) ) ( not ( = ?auto_154241 ?auto_154242 ) ) ( not ( = ?auto_154241 ?auto_154243 ) ) ( not ( = ?auto_154241 ?auto_154244 ) ) ( not ( = ?auto_154241 ?auto_154245 ) ) ( not ( = ?auto_154241 ?auto_154246 ) ) ( not ( = ?auto_154242 ?auto_154243 ) ) ( not ( = ?auto_154242 ?auto_154244 ) ) ( not ( = ?auto_154242 ?auto_154245 ) ) ( not ( = ?auto_154242 ?auto_154246 ) ) ( not ( = ?auto_154243 ?auto_154244 ) ) ( not ( = ?auto_154243 ?auto_154245 ) ) ( not ( = ?auto_154243 ?auto_154246 ) ) ( not ( = ?auto_154244 ?auto_154245 ) ) ( not ( = ?auto_154244 ?auto_154246 ) ) ( not ( = ?auto_154245 ?auto_154246 ) ) ( ON-TABLE ?auto_154246 ) ( ON ?auto_154245 ?auto_154246 ) ( ON ?auto_154244 ?auto_154245 ) ( ON ?auto_154243 ?auto_154244 ) ( ON ?auto_154242 ?auto_154243 ) ( ON ?auto_154241 ?auto_154242 ) ( ON ?auto_154240 ?auto_154241 ) ( ON ?auto_154239 ?auto_154240 ) ( CLEAR ?auto_154239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154246 ?auto_154245 ?auto_154244 ?auto_154243 ?auto_154242 ?auto_154241 ?auto_154240 )
      ( MAKE-8PILE ?auto_154239 ?auto_154240 ?auto_154241 ?auto_154242 ?auto_154243 ?auto_154244 ?auto_154245 ?auto_154246 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154255 - BLOCK
      ?auto_154256 - BLOCK
      ?auto_154257 - BLOCK
      ?auto_154258 - BLOCK
      ?auto_154259 - BLOCK
      ?auto_154260 - BLOCK
      ?auto_154261 - BLOCK
      ?auto_154262 - BLOCK
    )
    :vars
    (
      ?auto_154263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154255 ?auto_154256 ) ) ( not ( = ?auto_154255 ?auto_154257 ) ) ( not ( = ?auto_154255 ?auto_154258 ) ) ( not ( = ?auto_154255 ?auto_154259 ) ) ( not ( = ?auto_154255 ?auto_154260 ) ) ( not ( = ?auto_154255 ?auto_154261 ) ) ( not ( = ?auto_154255 ?auto_154262 ) ) ( not ( = ?auto_154256 ?auto_154257 ) ) ( not ( = ?auto_154256 ?auto_154258 ) ) ( not ( = ?auto_154256 ?auto_154259 ) ) ( not ( = ?auto_154256 ?auto_154260 ) ) ( not ( = ?auto_154256 ?auto_154261 ) ) ( not ( = ?auto_154256 ?auto_154262 ) ) ( not ( = ?auto_154257 ?auto_154258 ) ) ( not ( = ?auto_154257 ?auto_154259 ) ) ( not ( = ?auto_154257 ?auto_154260 ) ) ( not ( = ?auto_154257 ?auto_154261 ) ) ( not ( = ?auto_154257 ?auto_154262 ) ) ( not ( = ?auto_154258 ?auto_154259 ) ) ( not ( = ?auto_154258 ?auto_154260 ) ) ( not ( = ?auto_154258 ?auto_154261 ) ) ( not ( = ?auto_154258 ?auto_154262 ) ) ( not ( = ?auto_154259 ?auto_154260 ) ) ( not ( = ?auto_154259 ?auto_154261 ) ) ( not ( = ?auto_154259 ?auto_154262 ) ) ( not ( = ?auto_154260 ?auto_154261 ) ) ( not ( = ?auto_154260 ?auto_154262 ) ) ( not ( = ?auto_154261 ?auto_154262 ) ) ( ON-TABLE ?auto_154262 ) ( ON ?auto_154261 ?auto_154262 ) ( ON ?auto_154260 ?auto_154261 ) ( ON ?auto_154259 ?auto_154260 ) ( ON ?auto_154258 ?auto_154259 ) ( ON ?auto_154257 ?auto_154258 ) ( ON ?auto_154256 ?auto_154257 ) ( CLEAR ?auto_154256 ) ( ON ?auto_154255 ?auto_154263 ) ( CLEAR ?auto_154255 ) ( HAND-EMPTY ) ( not ( = ?auto_154255 ?auto_154263 ) ) ( not ( = ?auto_154256 ?auto_154263 ) ) ( not ( = ?auto_154257 ?auto_154263 ) ) ( not ( = ?auto_154258 ?auto_154263 ) ) ( not ( = ?auto_154259 ?auto_154263 ) ) ( not ( = ?auto_154260 ?auto_154263 ) ) ( not ( = ?auto_154261 ?auto_154263 ) ) ( not ( = ?auto_154262 ?auto_154263 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_154255 ?auto_154263 )
      ( MAKE-8PILE ?auto_154255 ?auto_154256 ?auto_154257 ?auto_154258 ?auto_154259 ?auto_154260 ?auto_154261 ?auto_154262 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154264 - BLOCK
      ?auto_154265 - BLOCK
      ?auto_154266 - BLOCK
      ?auto_154267 - BLOCK
      ?auto_154268 - BLOCK
      ?auto_154269 - BLOCK
      ?auto_154270 - BLOCK
      ?auto_154271 - BLOCK
    )
    :vars
    (
      ?auto_154272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154264 ?auto_154265 ) ) ( not ( = ?auto_154264 ?auto_154266 ) ) ( not ( = ?auto_154264 ?auto_154267 ) ) ( not ( = ?auto_154264 ?auto_154268 ) ) ( not ( = ?auto_154264 ?auto_154269 ) ) ( not ( = ?auto_154264 ?auto_154270 ) ) ( not ( = ?auto_154264 ?auto_154271 ) ) ( not ( = ?auto_154265 ?auto_154266 ) ) ( not ( = ?auto_154265 ?auto_154267 ) ) ( not ( = ?auto_154265 ?auto_154268 ) ) ( not ( = ?auto_154265 ?auto_154269 ) ) ( not ( = ?auto_154265 ?auto_154270 ) ) ( not ( = ?auto_154265 ?auto_154271 ) ) ( not ( = ?auto_154266 ?auto_154267 ) ) ( not ( = ?auto_154266 ?auto_154268 ) ) ( not ( = ?auto_154266 ?auto_154269 ) ) ( not ( = ?auto_154266 ?auto_154270 ) ) ( not ( = ?auto_154266 ?auto_154271 ) ) ( not ( = ?auto_154267 ?auto_154268 ) ) ( not ( = ?auto_154267 ?auto_154269 ) ) ( not ( = ?auto_154267 ?auto_154270 ) ) ( not ( = ?auto_154267 ?auto_154271 ) ) ( not ( = ?auto_154268 ?auto_154269 ) ) ( not ( = ?auto_154268 ?auto_154270 ) ) ( not ( = ?auto_154268 ?auto_154271 ) ) ( not ( = ?auto_154269 ?auto_154270 ) ) ( not ( = ?auto_154269 ?auto_154271 ) ) ( not ( = ?auto_154270 ?auto_154271 ) ) ( ON-TABLE ?auto_154271 ) ( ON ?auto_154270 ?auto_154271 ) ( ON ?auto_154269 ?auto_154270 ) ( ON ?auto_154268 ?auto_154269 ) ( ON ?auto_154267 ?auto_154268 ) ( ON ?auto_154266 ?auto_154267 ) ( ON ?auto_154264 ?auto_154272 ) ( CLEAR ?auto_154264 ) ( not ( = ?auto_154264 ?auto_154272 ) ) ( not ( = ?auto_154265 ?auto_154272 ) ) ( not ( = ?auto_154266 ?auto_154272 ) ) ( not ( = ?auto_154267 ?auto_154272 ) ) ( not ( = ?auto_154268 ?auto_154272 ) ) ( not ( = ?auto_154269 ?auto_154272 ) ) ( not ( = ?auto_154270 ?auto_154272 ) ) ( not ( = ?auto_154271 ?auto_154272 ) ) ( HOLDING ?auto_154265 ) ( CLEAR ?auto_154266 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154271 ?auto_154270 ?auto_154269 ?auto_154268 ?auto_154267 ?auto_154266 ?auto_154265 )
      ( MAKE-8PILE ?auto_154264 ?auto_154265 ?auto_154266 ?auto_154267 ?auto_154268 ?auto_154269 ?auto_154270 ?auto_154271 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154273 - BLOCK
      ?auto_154274 - BLOCK
      ?auto_154275 - BLOCK
      ?auto_154276 - BLOCK
      ?auto_154277 - BLOCK
      ?auto_154278 - BLOCK
      ?auto_154279 - BLOCK
      ?auto_154280 - BLOCK
    )
    :vars
    (
      ?auto_154281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154273 ?auto_154274 ) ) ( not ( = ?auto_154273 ?auto_154275 ) ) ( not ( = ?auto_154273 ?auto_154276 ) ) ( not ( = ?auto_154273 ?auto_154277 ) ) ( not ( = ?auto_154273 ?auto_154278 ) ) ( not ( = ?auto_154273 ?auto_154279 ) ) ( not ( = ?auto_154273 ?auto_154280 ) ) ( not ( = ?auto_154274 ?auto_154275 ) ) ( not ( = ?auto_154274 ?auto_154276 ) ) ( not ( = ?auto_154274 ?auto_154277 ) ) ( not ( = ?auto_154274 ?auto_154278 ) ) ( not ( = ?auto_154274 ?auto_154279 ) ) ( not ( = ?auto_154274 ?auto_154280 ) ) ( not ( = ?auto_154275 ?auto_154276 ) ) ( not ( = ?auto_154275 ?auto_154277 ) ) ( not ( = ?auto_154275 ?auto_154278 ) ) ( not ( = ?auto_154275 ?auto_154279 ) ) ( not ( = ?auto_154275 ?auto_154280 ) ) ( not ( = ?auto_154276 ?auto_154277 ) ) ( not ( = ?auto_154276 ?auto_154278 ) ) ( not ( = ?auto_154276 ?auto_154279 ) ) ( not ( = ?auto_154276 ?auto_154280 ) ) ( not ( = ?auto_154277 ?auto_154278 ) ) ( not ( = ?auto_154277 ?auto_154279 ) ) ( not ( = ?auto_154277 ?auto_154280 ) ) ( not ( = ?auto_154278 ?auto_154279 ) ) ( not ( = ?auto_154278 ?auto_154280 ) ) ( not ( = ?auto_154279 ?auto_154280 ) ) ( ON-TABLE ?auto_154280 ) ( ON ?auto_154279 ?auto_154280 ) ( ON ?auto_154278 ?auto_154279 ) ( ON ?auto_154277 ?auto_154278 ) ( ON ?auto_154276 ?auto_154277 ) ( ON ?auto_154275 ?auto_154276 ) ( ON ?auto_154273 ?auto_154281 ) ( not ( = ?auto_154273 ?auto_154281 ) ) ( not ( = ?auto_154274 ?auto_154281 ) ) ( not ( = ?auto_154275 ?auto_154281 ) ) ( not ( = ?auto_154276 ?auto_154281 ) ) ( not ( = ?auto_154277 ?auto_154281 ) ) ( not ( = ?auto_154278 ?auto_154281 ) ) ( not ( = ?auto_154279 ?auto_154281 ) ) ( not ( = ?auto_154280 ?auto_154281 ) ) ( CLEAR ?auto_154275 ) ( ON ?auto_154274 ?auto_154273 ) ( CLEAR ?auto_154274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_154281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154281 ?auto_154273 )
      ( MAKE-8PILE ?auto_154273 ?auto_154274 ?auto_154275 ?auto_154276 ?auto_154277 ?auto_154278 ?auto_154279 ?auto_154280 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154282 - BLOCK
      ?auto_154283 - BLOCK
      ?auto_154284 - BLOCK
      ?auto_154285 - BLOCK
      ?auto_154286 - BLOCK
      ?auto_154287 - BLOCK
      ?auto_154288 - BLOCK
      ?auto_154289 - BLOCK
    )
    :vars
    (
      ?auto_154290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154282 ?auto_154283 ) ) ( not ( = ?auto_154282 ?auto_154284 ) ) ( not ( = ?auto_154282 ?auto_154285 ) ) ( not ( = ?auto_154282 ?auto_154286 ) ) ( not ( = ?auto_154282 ?auto_154287 ) ) ( not ( = ?auto_154282 ?auto_154288 ) ) ( not ( = ?auto_154282 ?auto_154289 ) ) ( not ( = ?auto_154283 ?auto_154284 ) ) ( not ( = ?auto_154283 ?auto_154285 ) ) ( not ( = ?auto_154283 ?auto_154286 ) ) ( not ( = ?auto_154283 ?auto_154287 ) ) ( not ( = ?auto_154283 ?auto_154288 ) ) ( not ( = ?auto_154283 ?auto_154289 ) ) ( not ( = ?auto_154284 ?auto_154285 ) ) ( not ( = ?auto_154284 ?auto_154286 ) ) ( not ( = ?auto_154284 ?auto_154287 ) ) ( not ( = ?auto_154284 ?auto_154288 ) ) ( not ( = ?auto_154284 ?auto_154289 ) ) ( not ( = ?auto_154285 ?auto_154286 ) ) ( not ( = ?auto_154285 ?auto_154287 ) ) ( not ( = ?auto_154285 ?auto_154288 ) ) ( not ( = ?auto_154285 ?auto_154289 ) ) ( not ( = ?auto_154286 ?auto_154287 ) ) ( not ( = ?auto_154286 ?auto_154288 ) ) ( not ( = ?auto_154286 ?auto_154289 ) ) ( not ( = ?auto_154287 ?auto_154288 ) ) ( not ( = ?auto_154287 ?auto_154289 ) ) ( not ( = ?auto_154288 ?auto_154289 ) ) ( ON-TABLE ?auto_154289 ) ( ON ?auto_154288 ?auto_154289 ) ( ON ?auto_154287 ?auto_154288 ) ( ON ?auto_154286 ?auto_154287 ) ( ON ?auto_154285 ?auto_154286 ) ( ON ?auto_154282 ?auto_154290 ) ( not ( = ?auto_154282 ?auto_154290 ) ) ( not ( = ?auto_154283 ?auto_154290 ) ) ( not ( = ?auto_154284 ?auto_154290 ) ) ( not ( = ?auto_154285 ?auto_154290 ) ) ( not ( = ?auto_154286 ?auto_154290 ) ) ( not ( = ?auto_154287 ?auto_154290 ) ) ( not ( = ?auto_154288 ?auto_154290 ) ) ( not ( = ?auto_154289 ?auto_154290 ) ) ( ON ?auto_154283 ?auto_154282 ) ( CLEAR ?auto_154283 ) ( ON-TABLE ?auto_154290 ) ( HOLDING ?auto_154284 ) ( CLEAR ?auto_154285 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154289 ?auto_154288 ?auto_154287 ?auto_154286 ?auto_154285 ?auto_154284 )
      ( MAKE-8PILE ?auto_154282 ?auto_154283 ?auto_154284 ?auto_154285 ?auto_154286 ?auto_154287 ?auto_154288 ?auto_154289 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154291 - BLOCK
      ?auto_154292 - BLOCK
      ?auto_154293 - BLOCK
      ?auto_154294 - BLOCK
      ?auto_154295 - BLOCK
      ?auto_154296 - BLOCK
      ?auto_154297 - BLOCK
      ?auto_154298 - BLOCK
    )
    :vars
    (
      ?auto_154299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154291 ?auto_154292 ) ) ( not ( = ?auto_154291 ?auto_154293 ) ) ( not ( = ?auto_154291 ?auto_154294 ) ) ( not ( = ?auto_154291 ?auto_154295 ) ) ( not ( = ?auto_154291 ?auto_154296 ) ) ( not ( = ?auto_154291 ?auto_154297 ) ) ( not ( = ?auto_154291 ?auto_154298 ) ) ( not ( = ?auto_154292 ?auto_154293 ) ) ( not ( = ?auto_154292 ?auto_154294 ) ) ( not ( = ?auto_154292 ?auto_154295 ) ) ( not ( = ?auto_154292 ?auto_154296 ) ) ( not ( = ?auto_154292 ?auto_154297 ) ) ( not ( = ?auto_154292 ?auto_154298 ) ) ( not ( = ?auto_154293 ?auto_154294 ) ) ( not ( = ?auto_154293 ?auto_154295 ) ) ( not ( = ?auto_154293 ?auto_154296 ) ) ( not ( = ?auto_154293 ?auto_154297 ) ) ( not ( = ?auto_154293 ?auto_154298 ) ) ( not ( = ?auto_154294 ?auto_154295 ) ) ( not ( = ?auto_154294 ?auto_154296 ) ) ( not ( = ?auto_154294 ?auto_154297 ) ) ( not ( = ?auto_154294 ?auto_154298 ) ) ( not ( = ?auto_154295 ?auto_154296 ) ) ( not ( = ?auto_154295 ?auto_154297 ) ) ( not ( = ?auto_154295 ?auto_154298 ) ) ( not ( = ?auto_154296 ?auto_154297 ) ) ( not ( = ?auto_154296 ?auto_154298 ) ) ( not ( = ?auto_154297 ?auto_154298 ) ) ( ON-TABLE ?auto_154298 ) ( ON ?auto_154297 ?auto_154298 ) ( ON ?auto_154296 ?auto_154297 ) ( ON ?auto_154295 ?auto_154296 ) ( ON ?auto_154294 ?auto_154295 ) ( ON ?auto_154291 ?auto_154299 ) ( not ( = ?auto_154291 ?auto_154299 ) ) ( not ( = ?auto_154292 ?auto_154299 ) ) ( not ( = ?auto_154293 ?auto_154299 ) ) ( not ( = ?auto_154294 ?auto_154299 ) ) ( not ( = ?auto_154295 ?auto_154299 ) ) ( not ( = ?auto_154296 ?auto_154299 ) ) ( not ( = ?auto_154297 ?auto_154299 ) ) ( not ( = ?auto_154298 ?auto_154299 ) ) ( ON ?auto_154292 ?auto_154291 ) ( ON-TABLE ?auto_154299 ) ( CLEAR ?auto_154294 ) ( ON ?auto_154293 ?auto_154292 ) ( CLEAR ?auto_154293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154299 ?auto_154291 ?auto_154292 )
      ( MAKE-8PILE ?auto_154291 ?auto_154292 ?auto_154293 ?auto_154294 ?auto_154295 ?auto_154296 ?auto_154297 ?auto_154298 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154300 - BLOCK
      ?auto_154301 - BLOCK
      ?auto_154302 - BLOCK
      ?auto_154303 - BLOCK
      ?auto_154304 - BLOCK
      ?auto_154305 - BLOCK
      ?auto_154306 - BLOCK
      ?auto_154307 - BLOCK
    )
    :vars
    (
      ?auto_154308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154300 ?auto_154301 ) ) ( not ( = ?auto_154300 ?auto_154302 ) ) ( not ( = ?auto_154300 ?auto_154303 ) ) ( not ( = ?auto_154300 ?auto_154304 ) ) ( not ( = ?auto_154300 ?auto_154305 ) ) ( not ( = ?auto_154300 ?auto_154306 ) ) ( not ( = ?auto_154300 ?auto_154307 ) ) ( not ( = ?auto_154301 ?auto_154302 ) ) ( not ( = ?auto_154301 ?auto_154303 ) ) ( not ( = ?auto_154301 ?auto_154304 ) ) ( not ( = ?auto_154301 ?auto_154305 ) ) ( not ( = ?auto_154301 ?auto_154306 ) ) ( not ( = ?auto_154301 ?auto_154307 ) ) ( not ( = ?auto_154302 ?auto_154303 ) ) ( not ( = ?auto_154302 ?auto_154304 ) ) ( not ( = ?auto_154302 ?auto_154305 ) ) ( not ( = ?auto_154302 ?auto_154306 ) ) ( not ( = ?auto_154302 ?auto_154307 ) ) ( not ( = ?auto_154303 ?auto_154304 ) ) ( not ( = ?auto_154303 ?auto_154305 ) ) ( not ( = ?auto_154303 ?auto_154306 ) ) ( not ( = ?auto_154303 ?auto_154307 ) ) ( not ( = ?auto_154304 ?auto_154305 ) ) ( not ( = ?auto_154304 ?auto_154306 ) ) ( not ( = ?auto_154304 ?auto_154307 ) ) ( not ( = ?auto_154305 ?auto_154306 ) ) ( not ( = ?auto_154305 ?auto_154307 ) ) ( not ( = ?auto_154306 ?auto_154307 ) ) ( ON-TABLE ?auto_154307 ) ( ON ?auto_154306 ?auto_154307 ) ( ON ?auto_154305 ?auto_154306 ) ( ON ?auto_154304 ?auto_154305 ) ( ON ?auto_154300 ?auto_154308 ) ( not ( = ?auto_154300 ?auto_154308 ) ) ( not ( = ?auto_154301 ?auto_154308 ) ) ( not ( = ?auto_154302 ?auto_154308 ) ) ( not ( = ?auto_154303 ?auto_154308 ) ) ( not ( = ?auto_154304 ?auto_154308 ) ) ( not ( = ?auto_154305 ?auto_154308 ) ) ( not ( = ?auto_154306 ?auto_154308 ) ) ( not ( = ?auto_154307 ?auto_154308 ) ) ( ON ?auto_154301 ?auto_154300 ) ( ON-TABLE ?auto_154308 ) ( ON ?auto_154302 ?auto_154301 ) ( CLEAR ?auto_154302 ) ( HOLDING ?auto_154303 ) ( CLEAR ?auto_154304 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154307 ?auto_154306 ?auto_154305 ?auto_154304 ?auto_154303 )
      ( MAKE-8PILE ?auto_154300 ?auto_154301 ?auto_154302 ?auto_154303 ?auto_154304 ?auto_154305 ?auto_154306 ?auto_154307 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154309 - BLOCK
      ?auto_154310 - BLOCK
      ?auto_154311 - BLOCK
      ?auto_154312 - BLOCK
      ?auto_154313 - BLOCK
      ?auto_154314 - BLOCK
      ?auto_154315 - BLOCK
      ?auto_154316 - BLOCK
    )
    :vars
    (
      ?auto_154317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154309 ?auto_154310 ) ) ( not ( = ?auto_154309 ?auto_154311 ) ) ( not ( = ?auto_154309 ?auto_154312 ) ) ( not ( = ?auto_154309 ?auto_154313 ) ) ( not ( = ?auto_154309 ?auto_154314 ) ) ( not ( = ?auto_154309 ?auto_154315 ) ) ( not ( = ?auto_154309 ?auto_154316 ) ) ( not ( = ?auto_154310 ?auto_154311 ) ) ( not ( = ?auto_154310 ?auto_154312 ) ) ( not ( = ?auto_154310 ?auto_154313 ) ) ( not ( = ?auto_154310 ?auto_154314 ) ) ( not ( = ?auto_154310 ?auto_154315 ) ) ( not ( = ?auto_154310 ?auto_154316 ) ) ( not ( = ?auto_154311 ?auto_154312 ) ) ( not ( = ?auto_154311 ?auto_154313 ) ) ( not ( = ?auto_154311 ?auto_154314 ) ) ( not ( = ?auto_154311 ?auto_154315 ) ) ( not ( = ?auto_154311 ?auto_154316 ) ) ( not ( = ?auto_154312 ?auto_154313 ) ) ( not ( = ?auto_154312 ?auto_154314 ) ) ( not ( = ?auto_154312 ?auto_154315 ) ) ( not ( = ?auto_154312 ?auto_154316 ) ) ( not ( = ?auto_154313 ?auto_154314 ) ) ( not ( = ?auto_154313 ?auto_154315 ) ) ( not ( = ?auto_154313 ?auto_154316 ) ) ( not ( = ?auto_154314 ?auto_154315 ) ) ( not ( = ?auto_154314 ?auto_154316 ) ) ( not ( = ?auto_154315 ?auto_154316 ) ) ( ON-TABLE ?auto_154316 ) ( ON ?auto_154315 ?auto_154316 ) ( ON ?auto_154314 ?auto_154315 ) ( ON ?auto_154313 ?auto_154314 ) ( ON ?auto_154309 ?auto_154317 ) ( not ( = ?auto_154309 ?auto_154317 ) ) ( not ( = ?auto_154310 ?auto_154317 ) ) ( not ( = ?auto_154311 ?auto_154317 ) ) ( not ( = ?auto_154312 ?auto_154317 ) ) ( not ( = ?auto_154313 ?auto_154317 ) ) ( not ( = ?auto_154314 ?auto_154317 ) ) ( not ( = ?auto_154315 ?auto_154317 ) ) ( not ( = ?auto_154316 ?auto_154317 ) ) ( ON ?auto_154310 ?auto_154309 ) ( ON-TABLE ?auto_154317 ) ( ON ?auto_154311 ?auto_154310 ) ( CLEAR ?auto_154313 ) ( ON ?auto_154312 ?auto_154311 ) ( CLEAR ?auto_154312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154317 ?auto_154309 ?auto_154310 ?auto_154311 )
      ( MAKE-8PILE ?auto_154309 ?auto_154310 ?auto_154311 ?auto_154312 ?auto_154313 ?auto_154314 ?auto_154315 ?auto_154316 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154318 - BLOCK
      ?auto_154319 - BLOCK
      ?auto_154320 - BLOCK
      ?auto_154321 - BLOCK
      ?auto_154322 - BLOCK
      ?auto_154323 - BLOCK
      ?auto_154324 - BLOCK
      ?auto_154325 - BLOCK
    )
    :vars
    (
      ?auto_154326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154318 ?auto_154319 ) ) ( not ( = ?auto_154318 ?auto_154320 ) ) ( not ( = ?auto_154318 ?auto_154321 ) ) ( not ( = ?auto_154318 ?auto_154322 ) ) ( not ( = ?auto_154318 ?auto_154323 ) ) ( not ( = ?auto_154318 ?auto_154324 ) ) ( not ( = ?auto_154318 ?auto_154325 ) ) ( not ( = ?auto_154319 ?auto_154320 ) ) ( not ( = ?auto_154319 ?auto_154321 ) ) ( not ( = ?auto_154319 ?auto_154322 ) ) ( not ( = ?auto_154319 ?auto_154323 ) ) ( not ( = ?auto_154319 ?auto_154324 ) ) ( not ( = ?auto_154319 ?auto_154325 ) ) ( not ( = ?auto_154320 ?auto_154321 ) ) ( not ( = ?auto_154320 ?auto_154322 ) ) ( not ( = ?auto_154320 ?auto_154323 ) ) ( not ( = ?auto_154320 ?auto_154324 ) ) ( not ( = ?auto_154320 ?auto_154325 ) ) ( not ( = ?auto_154321 ?auto_154322 ) ) ( not ( = ?auto_154321 ?auto_154323 ) ) ( not ( = ?auto_154321 ?auto_154324 ) ) ( not ( = ?auto_154321 ?auto_154325 ) ) ( not ( = ?auto_154322 ?auto_154323 ) ) ( not ( = ?auto_154322 ?auto_154324 ) ) ( not ( = ?auto_154322 ?auto_154325 ) ) ( not ( = ?auto_154323 ?auto_154324 ) ) ( not ( = ?auto_154323 ?auto_154325 ) ) ( not ( = ?auto_154324 ?auto_154325 ) ) ( ON-TABLE ?auto_154325 ) ( ON ?auto_154324 ?auto_154325 ) ( ON ?auto_154323 ?auto_154324 ) ( ON ?auto_154318 ?auto_154326 ) ( not ( = ?auto_154318 ?auto_154326 ) ) ( not ( = ?auto_154319 ?auto_154326 ) ) ( not ( = ?auto_154320 ?auto_154326 ) ) ( not ( = ?auto_154321 ?auto_154326 ) ) ( not ( = ?auto_154322 ?auto_154326 ) ) ( not ( = ?auto_154323 ?auto_154326 ) ) ( not ( = ?auto_154324 ?auto_154326 ) ) ( not ( = ?auto_154325 ?auto_154326 ) ) ( ON ?auto_154319 ?auto_154318 ) ( ON-TABLE ?auto_154326 ) ( ON ?auto_154320 ?auto_154319 ) ( ON ?auto_154321 ?auto_154320 ) ( CLEAR ?auto_154321 ) ( HOLDING ?auto_154322 ) ( CLEAR ?auto_154323 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_154325 ?auto_154324 ?auto_154323 ?auto_154322 )
      ( MAKE-8PILE ?auto_154318 ?auto_154319 ?auto_154320 ?auto_154321 ?auto_154322 ?auto_154323 ?auto_154324 ?auto_154325 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154327 - BLOCK
      ?auto_154328 - BLOCK
      ?auto_154329 - BLOCK
      ?auto_154330 - BLOCK
      ?auto_154331 - BLOCK
      ?auto_154332 - BLOCK
      ?auto_154333 - BLOCK
      ?auto_154334 - BLOCK
    )
    :vars
    (
      ?auto_154335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154327 ?auto_154328 ) ) ( not ( = ?auto_154327 ?auto_154329 ) ) ( not ( = ?auto_154327 ?auto_154330 ) ) ( not ( = ?auto_154327 ?auto_154331 ) ) ( not ( = ?auto_154327 ?auto_154332 ) ) ( not ( = ?auto_154327 ?auto_154333 ) ) ( not ( = ?auto_154327 ?auto_154334 ) ) ( not ( = ?auto_154328 ?auto_154329 ) ) ( not ( = ?auto_154328 ?auto_154330 ) ) ( not ( = ?auto_154328 ?auto_154331 ) ) ( not ( = ?auto_154328 ?auto_154332 ) ) ( not ( = ?auto_154328 ?auto_154333 ) ) ( not ( = ?auto_154328 ?auto_154334 ) ) ( not ( = ?auto_154329 ?auto_154330 ) ) ( not ( = ?auto_154329 ?auto_154331 ) ) ( not ( = ?auto_154329 ?auto_154332 ) ) ( not ( = ?auto_154329 ?auto_154333 ) ) ( not ( = ?auto_154329 ?auto_154334 ) ) ( not ( = ?auto_154330 ?auto_154331 ) ) ( not ( = ?auto_154330 ?auto_154332 ) ) ( not ( = ?auto_154330 ?auto_154333 ) ) ( not ( = ?auto_154330 ?auto_154334 ) ) ( not ( = ?auto_154331 ?auto_154332 ) ) ( not ( = ?auto_154331 ?auto_154333 ) ) ( not ( = ?auto_154331 ?auto_154334 ) ) ( not ( = ?auto_154332 ?auto_154333 ) ) ( not ( = ?auto_154332 ?auto_154334 ) ) ( not ( = ?auto_154333 ?auto_154334 ) ) ( ON-TABLE ?auto_154334 ) ( ON ?auto_154333 ?auto_154334 ) ( ON ?auto_154332 ?auto_154333 ) ( ON ?auto_154327 ?auto_154335 ) ( not ( = ?auto_154327 ?auto_154335 ) ) ( not ( = ?auto_154328 ?auto_154335 ) ) ( not ( = ?auto_154329 ?auto_154335 ) ) ( not ( = ?auto_154330 ?auto_154335 ) ) ( not ( = ?auto_154331 ?auto_154335 ) ) ( not ( = ?auto_154332 ?auto_154335 ) ) ( not ( = ?auto_154333 ?auto_154335 ) ) ( not ( = ?auto_154334 ?auto_154335 ) ) ( ON ?auto_154328 ?auto_154327 ) ( ON-TABLE ?auto_154335 ) ( ON ?auto_154329 ?auto_154328 ) ( ON ?auto_154330 ?auto_154329 ) ( CLEAR ?auto_154332 ) ( ON ?auto_154331 ?auto_154330 ) ( CLEAR ?auto_154331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_154335 ?auto_154327 ?auto_154328 ?auto_154329 ?auto_154330 )
      ( MAKE-8PILE ?auto_154327 ?auto_154328 ?auto_154329 ?auto_154330 ?auto_154331 ?auto_154332 ?auto_154333 ?auto_154334 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154336 - BLOCK
      ?auto_154337 - BLOCK
      ?auto_154338 - BLOCK
      ?auto_154339 - BLOCK
      ?auto_154340 - BLOCK
      ?auto_154341 - BLOCK
      ?auto_154342 - BLOCK
      ?auto_154343 - BLOCK
    )
    :vars
    (
      ?auto_154344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154336 ?auto_154337 ) ) ( not ( = ?auto_154336 ?auto_154338 ) ) ( not ( = ?auto_154336 ?auto_154339 ) ) ( not ( = ?auto_154336 ?auto_154340 ) ) ( not ( = ?auto_154336 ?auto_154341 ) ) ( not ( = ?auto_154336 ?auto_154342 ) ) ( not ( = ?auto_154336 ?auto_154343 ) ) ( not ( = ?auto_154337 ?auto_154338 ) ) ( not ( = ?auto_154337 ?auto_154339 ) ) ( not ( = ?auto_154337 ?auto_154340 ) ) ( not ( = ?auto_154337 ?auto_154341 ) ) ( not ( = ?auto_154337 ?auto_154342 ) ) ( not ( = ?auto_154337 ?auto_154343 ) ) ( not ( = ?auto_154338 ?auto_154339 ) ) ( not ( = ?auto_154338 ?auto_154340 ) ) ( not ( = ?auto_154338 ?auto_154341 ) ) ( not ( = ?auto_154338 ?auto_154342 ) ) ( not ( = ?auto_154338 ?auto_154343 ) ) ( not ( = ?auto_154339 ?auto_154340 ) ) ( not ( = ?auto_154339 ?auto_154341 ) ) ( not ( = ?auto_154339 ?auto_154342 ) ) ( not ( = ?auto_154339 ?auto_154343 ) ) ( not ( = ?auto_154340 ?auto_154341 ) ) ( not ( = ?auto_154340 ?auto_154342 ) ) ( not ( = ?auto_154340 ?auto_154343 ) ) ( not ( = ?auto_154341 ?auto_154342 ) ) ( not ( = ?auto_154341 ?auto_154343 ) ) ( not ( = ?auto_154342 ?auto_154343 ) ) ( ON-TABLE ?auto_154343 ) ( ON ?auto_154342 ?auto_154343 ) ( ON ?auto_154336 ?auto_154344 ) ( not ( = ?auto_154336 ?auto_154344 ) ) ( not ( = ?auto_154337 ?auto_154344 ) ) ( not ( = ?auto_154338 ?auto_154344 ) ) ( not ( = ?auto_154339 ?auto_154344 ) ) ( not ( = ?auto_154340 ?auto_154344 ) ) ( not ( = ?auto_154341 ?auto_154344 ) ) ( not ( = ?auto_154342 ?auto_154344 ) ) ( not ( = ?auto_154343 ?auto_154344 ) ) ( ON ?auto_154337 ?auto_154336 ) ( ON-TABLE ?auto_154344 ) ( ON ?auto_154338 ?auto_154337 ) ( ON ?auto_154339 ?auto_154338 ) ( ON ?auto_154340 ?auto_154339 ) ( CLEAR ?auto_154340 ) ( HOLDING ?auto_154341 ) ( CLEAR ?auto_154342 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_154343 ?auto_154342 ?auto_154341 )
      ( MAKE-8PILE ?auto_154336 ?auto_154337 ?auto_154338 ?auto_154339 ?auto_154340 ?auto_154341 ?auto_154342 ?auto_154343 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154345 - BLOCK
      ?auto_154346 - BLOCK
      ?auto_154347 - BLOCK
      ?auto_154348 - BLOCK
      ?auto_154349 - BLOCK
      ?auto_154350 - BLOCK
      ?auto_154351 - BLOCK
      ?auto_154352 - BLOCK
    )
    :vars
    (
      ?auto_154353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154345 ?auto_154346 ) ) ( not ( = ?auto_154345 ?auto_154347 ) ) ( not ( = ?auto_154345 ?auto_154348 ) ) ( not ( = ?auto_154345 ?auto_154349 ) ) ( not ( = ?auto_154345 ?auto_154350 ) ) ( not ( = ?auto_154345 ?auto_154351 ) ) ( not ( = ?auto_154345 ?auto_154352 ) ) ( not ( = ?auto_154346 ?auto_154347 ) ) ( not ( = ?auto_154346 ?auto_154348 ) ) ( not ( = ?auto_154346 ?auto_154349 ) ) ( not ( = ?auto_154346 ?auto_154350 ) ) ( not ( = ?auto_154346 ?auto_154351 ) ) ( not ( = ?auto_154346 ?auto_154352 ) ) ( not ( = ?auto_154347 ?auto_154348 ) ) ( not ( = ?auto_154347 ?auto_154349 ) ) ( not ( = ?auto_154347 ?auto_154350 ) ) ( not ( = ?auto_154347 ?auto_154351 ) ) ( not ( = ?auto_154347 ?auto_154352 ) ) ( not ( = ?auto_154348 ?auto_154349 ) ) ( not ( = ?auto_154348 ?auto_154350 ) ) ( not ( = ?auto_154348 ?auto_154351 ) ) ( not ( = ?auto_154348 ?auto_154352 ) ) ( not ( = ?auto_154349 ?auto_154350 ) ) ( not ( = ?auto_154349 ?auto_154351 ) ) ( not ( = ?auto_154349 ?auto_154352 ) ) ( not ( = ?auto_154350 ?auto_154351 ) ) ( not ( = ?auto_154350 ?auto_154352 ) ) ( not ( = ?auto_154351 ?auto_154352 ) ) ( ON-TABLE ?auto_154352 ) ( ON ?auto_154351 ?auto_154352 ) ( ON ?auto_154345 ?auto_154353 ) ( not ( = ?auto_154345 ?auto_154353 ) ) ( not ( = ?auto_154346 ?auto_154353 ) ) ( not ( = ?auto_154347 ?auto_154353 ) ) ( not ( = ?auto_154348 ?auto_154353 ) ) ( not ( = ?auto_154349 ?auto_154353 ) ) ( not ( = ?auto_154350 ?auto_154353 ) ) ( not ( = ?auto_154351 ?auto_154353 ) ) ( not ( = ?auto_154352 ?auto_154353 ) ) ( ON ?auto_154346 ?auto_154345 ) ( ON-TABLE ?auto_154353 ) ( ON ?auto_154347 ?auto_154346 ) ( ON ?auto_154348 ?auto_154347 ) ( ON ?auto_154349 ?auto_154348 ) ( CLEAR ?auto_154351 ) ( ON ?auto_154350 ?auto_154349 ) ( CLEAR ?auto_154350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_154353 ?auto_154345 ?auto_154346 ?auto_154347 ?auto_154348 ?auto_154349 )
      ( MAKE-8PILE ?auto_154345 ?auto_154346 ?auto_154347 ?auto_154348 ?auto_154349 ?auto_154350 ?auto_154351 ?auto_154352 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154354 - BLOCK
      ?auto_154355 - BLOCK
      ?auto_154356 - BLOCK
      ?auto_154357 - BLOCK
      ?auto_154358 - BLOCK
      ?auto_154359 - BLOCK
      ?auto_154360 - BLOCK
      ?auto_154361 - BLOCK
    )
    :vars
    (
      ?auto_154362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154354 ?auto_154355 ) ) ( not ( = ?auto_154354 ?auto_154356 ) ) ( not ( = ?auto_154354 ?auto_154357 ) ) ( not ( = ?auto_154354 ?auto_154358 ) ) ( not ( = ?auto_154354 ?auto_154359 ) ) ( not ( = ?auto_154354 ?auto_154360 ) ) ( not ( = ?auto_154354 ?auto_154361 ) ) ( not ( = ?auto_154355 ?auto_154356 ) ) ( not ( = ?auto_154355 ?auto_154357 ) ) ( not ( = ?auto_154355 ?auto_154358 ) ) ( not ( = ?auto_154355 ?auto_154359 ) ) ( not ( = ?auto_154355 ?auto_154360 ) ) ( not ( = ?auto_154355 ?auto_154361 ) ) ( not ( = ?auto_154356 ?auto_154357 ) ) ( not ( = ?auto_154356 ?auto_154358 ) ) ( not ( = ?auto_154356 ?auto_154359 ) ) ( not ( = ?auto_154356 ?auto_154360 ) ) ( not ( = ?auto_154356 ?auto_154361 ) ) ( not ( = ?auto_154357 ?auto_154358 ) ) ( not ( = ?auto_154357 ?auto_154359 ) ) ( not ( = ?auto_154357 ?auto_154360 ) ) ( not ( = ?auto_154357 ?auto_154361 ) ) ( not ( = ?auto_154358 ?auto_154359 ) ) ( not ( = ?auto_154358 ?auto_154360 ) ) ( not ( = ?auto_154358 ?auto_154361 ) ) ( not ( = ?auto_154359 ?auto_154360 ) ) ( not ( = ?auto_154359 ?auto_154361 ) ) ( not ( = ?auto_154360 ?auto_154361 ) ) ( ON-TABLE ?auto_154361 ) ( ON ?auto_154354 ?auto_154362 ) ( not ( = ?auto_154354 ?auto_154362 ) ) ( not ( = ?auto_154355 ?auto_154362 ) ) ( not ( = ?auto_154356 ?auto_154362 ) ) ( not ( = ?auto_154357 ?auto_154362 ) ) ( not ( = ?auto_154358 ?auto_154362 ) ) ( not ( = ?auto_154359 ?auto_154362 ) ) ( not ( = ?auto_154360 ?auto_154362 ) ) ( not ( = ?auto_154361 ?auto_154362 ) ) ( ON ?auto_154355 ?auto_154354 ) ( ON-TABLE ?auto_154362 ) ( ON ?auto_154356 ?auto_154355 ) ( ON ?auto_154357 ?auto_154356 ) ( ON ?auto_154358 ?auto_154357 ) ( ON ?auto_154359 ?auto_154358 ) ( CLEAR ?auto_154359 ) ( HOLDING ?auto_154360 ) ( CLEAR ?auto_154361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_154361 ?auto_154360 )
      ( MAKE-8PILE ?auto_154354 ?auto_154355 ?auto_154356 ?auto_154357 ?auto_154358 ?auto_154359 ?auto_154360 ?auto_154361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154363 - BLOCK
      ?auto_154364 - BLOCK
      ?auto_154365 - BLOCK
      ?auto_154366 - BLOCK
      ?auto_154367 - BLOCK
      ?auto_154368 - BLOCK
      ?auto_154369 - BLOCK
      ?auto_154370 - BLOCK
    )
    :vars
    (
      ?auto_154371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154363 ?auto_154364 ) ) ( not ( = ?auto_154363 ?auto_154365 ) ) ( not ( = ?auto_154363 ?auto_154366 ) ) ( not ( = ?auto_154363 ?auto_154367 ) ) ( not ( = ?auto_154363 ?auto_154368 ) ) ( not ( = ?auto_154363 ?auto_154369 ) ) ( not ( = ?auto_154363 ?auto_154370 ) ) ( not ( = ?auto_154364 ?auto_154365 ) ) ( not ( = ?auto_154364 ?auto_154366 ) ) ( not ( = ?auto_154364 ?auto_154367 ) ) ( not ( = ?auto_154364 ?auto_154368 ) ) ( not ( = ?auto_154364 ?auto_154369 ) ) ( not ( = ?auto_154364 ?auto_154370 ) ) ( not ( = ?auto_154365 ?auto_154366 ) ) ( not ( = ?auto_154365 ?auto_154367 ) ) ( not ( = ?auto_154365 ?auto_154368 ) ) ( not ( = ?auto_154365 ?auto_154369 ) ) ( not ( = ?auto_154365 ?auto_154370 ) ) ( not ( = ?auto_154366 ?auto_154367 ) ) ( not ( = ?auto_154366 ?auto_154368 ) ) ( not ( = ?auto_154366 ?auto_154369 ) ) ( not ( = ?auto_154366 ?auto_154370 ) ) ( not ( = ?auto_154367 ?auto_154368 ) ) ( not ( = ?auto_154367 ?auto_154369 ) ) ( not ( = ?auto_154367 ?auto_154370 ) ) ( not ( = ?auto_154368 ?auto_154369 ) ) ( not ( = ?auto_154368 ?auto_154370 ) ) ( not ( = ?auto_154369 ?auto_154370 ) ) ( ON-TABLE ?auto_154370 ) ( ON ?auto_154363 ?auto_154371 ) ( not ( = ?auto_154363 ?auto_154371 ) ) ( not ( = ?auto_154364 ?auto_154371 ) ) ( not ( = ?auto_154365 ?auto_154371 ) ) ( not ( = ?auto_154366 ?auto_154371 ) ) ( not ( = ?auto_154367 ?auto_154371 ) ) ( not ( = ?auto_154368 ?auto_154371 ) ) ( not ( = ?auto_154369 ?auto_154371 ) ) ( not ( = ?auto_154370 ?auto_154371 ) ) ( ON ?auto_154364 ?auto_154363 ) ( ON-TABLE ?auto_154371 ) ( ON ?auto_154365 ?auto_154364 ) ( ON ?auto_154366 ?auto_154365 ) ( ON ?auto_154367 ?auto_154366 ) ( ON ?auto_154368 ?auto_154367 ) ( CLEAR ?auto_154370 ) ( ON ?auto_154369 ?auto_154368 ) ( CLEAR ?auto_154369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_154371 ?auto_154363 ?auto_154364 ?auto_154365 ?auto_154366 ?auto_154367 ?auto_154368 )
      ( MAKE-8PILE ?auto_154363 ?auto_154364 ?auto_154365 ?auto_154366 ?auto_154367 ?auto_154368 ?auto_154369 ?auto_154370 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154372 - BLOCK
      ?auto_154373 - BLOCK
      ?auto_154374 - BLOCK
      ?auto_154375 - BLOCK
      ?auto_154376 - BLOCK
      ?auto_154377 - BLOCK
      ?auto_154378 - BLOCK
      ?auto_154379 - BLOCK
    )
    :vars
    (
      ?auto_154380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154372 ?auto_154373 ) ) ( not ( = ?auto_154372 ?auto_154374 ) ) ( not ( = ?auto_154372 ?auto_154375 ) ) ( not ( = ?auto_154372 ?auto_154376 ) ) ( not ( = ?auto_154372 ?auto_154377 ) ) ( not ( = ?auto_154372 ?auto_154378 ) ) ( not ( = ?auto_154372 ?auto_154379 ) ) ( not ( = ?auto_154373 ?auto_154374 ) ) ( not ( = ?auto_154373 ?auto_154375 ) ) ( not ( = ?auto_154373 ?auto_154376 ) ) ( not ( = ?auto_154373 ?auto_154377 ) ) ( not ( = ?auto_154373 ?auto_154378 ) ) ( not ( = ?auto_154373 ?auto_154379 ) ) ( not ( = ?auto_154374 ?auto_154375 ) ) ( not ( = ?auto_154374 ?auto_154376 ) ) ( not ( = ?auto_154374 ?auto_154377 ) ) ( not ( = ?auto_154374 ?auto_154378 ) ) ( not ( = ?auto_154374 ?auto_154379 ) ) ( not ( = ?auto_154375 ?auto_154376 ) ) ( not ( = ?auto_154375 ?auto_154377 ) ) ( not ( = ?auto_154375 ?auto_154378 ) ) ( not ( = ?auto_154375 ?auto_154379 ) ) ( not ( = ?auto_154376 ?auto_154377 ) ) ( not ( = ?auto_154376 ?auto_154378 ) ) ( not ( = ?auto_154376 ?auto_154379 ) ) ( not ( = ?auto_154377 ?auto_154378 ) ) ( not ( = ?auto_154377 ?auto_154379 ) ) ( not ( = ?auto_154378 ?auto_154379 ) ) ( ON ?auto_154372 ?auto_154380 ) ( not ( = ?auto_154372 ?auto_154380 ) ) ( not ( = ?auto_154373 ?auto_154380 ) ) ( not ( = ?auto_154374 ?auto_154380 ) ) ( not ( = ?auto_154375 ?auto_154380 ) ) ( not ( = ?auto_154376 ?auto_154380 ) ) ( not ( = ?auto_154377 ?auto_154380 ) ) ( not ( = ?auto_154378 ?auto_154380 ) ) ( not ( = ?auto_154379 ?auto_154380 ) ) ( ON ?auto_154373 ?auto_154372 ) ( ON-TABLE ?auto_154380 ) ( ON ?auto_154374 ?auto_154373 ) ( ON ?auto_154375 ?auto_154374 ) ( ON ?auto_154376 ?auto_154375 ) ( ON ?auto_154377 ?auto_154376 ) ( ON ?auto_154378 ?auto_154377 ) ( CLEAR ?auto_154378 ) ( HOLDING ?auto_154379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_154379 )
      ( MAKE-8PILE ?auto_154372 ?auto_154373 ?auto_154374 ?auto_154375 ?auto_154376 ?auto_154377 ?auto_154378 ?auto_154379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_154381 - BLOCK
      ?auto_154382 - BLOCK
      ?auto_154383 - BLOCK
      ?auto_154384 - BLOCK
      ?auto_154385 - BLOCK
      ?auto_154386 - BLOCK
      ?auto_154387 - BLOCK
      ?auto_154388 - BLOCK
    )
    :vars
    (
      ?auto_154389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_154381 ?auto_154382 ) ) ( not ( = ?auto_154381 ?auto_154383 ) ) ( not ( = ?auto_154381 ?auto_154384 ) ) ( not ( = ?auto_154381 ?auto_154385 ) ) ( not ( = ?auto_154381 ?auto_154386 ) ) ( not ( = ?auto_154381 ?auto_154387 ) ) ( not ( = ?auto_154381 ?auto_154388 ) ) ( not ( = ?auto_154382 ?auto_154383 ) ) ( not ( = ?auto_154382 ?auto_154384 ) ) ( not ( = ?auto_154382 ?auto_154385 ) ) ( not ( = ?auto_154382 ?auto_154386 ) ) ( not ( = ?auto_154382 ?auto_154387 ) ) ( not ( = ?auto_154382 ?auto_154388 ) ) ( not ( = ?auto_154383 ?auto_154384 ) ) ( not ( = ?auto_154383 ?auto_154385 ) ) ( not ( = ?auto_154383 ?auto_154386 ) ) ( not ( = ?auto_154383 ?auto_154387 ) ) ( not ( = ?auto_154383 ?auto_154388 ) ) ( not ( = ?auto_154384 ?auto_154385 ) ) ( not ( = ?auto_154384 ?auto_154386 ) ) ( not ( = ?auto_154384 ?auto_154387 ) ) ( not ( = ?auto_154384 ?auto_154388 ) ) ( not ( = ?auto_154385 ?auto_154386 ) ) ( not ( = ?auto_154385 ?auto_154387 ) ) ( not ( = ?auto_154385 ?auto_154388 ) ) ( not ( = ?auto_154386 ?auto_154387 ) ) ( not ( = ?auto_154386 ?auto_154388 ) ) ( not ( = ?auto_154387 ?auto_154388 ) ) ( ON ?auto_154381 ?auto_154389 ) ( not ( = ?auto_154381 ?auto_154389 ) ) ( not ( = ?auto_154382 ?auto_154389 ) ) ( not ( = ?auto_154383 ?auto_154389 ) ) ( not ( = ?auto_154384 ?auto_154389 ) ) ( not ( = ?auto_154385 ?auto_154389 ) ) ( not ( = ?auto_154386 ?auto_154389 ) ) ( not ( = ?auto_154387 ?auto_154389 ) ) ( not ( = ?auto_154388 ?auto_154389 ) ) ( ON ?auto_154382 ?auto_154381 ) ( ON-TABLE ?auto_154389 ) ( ON ?auto_154383 ?auto_154382 ) ( ON ?auto_154384 ?auto_154383 ) ( ON ?auto_154385 ?auto_154384 ) ( ON ?auto_154386 ?auto_154385 ) ( ON ?auto_154387 ?auto_154386 ) ( ON ?auto_154388 ?auto_154387 ) ( CLEAR ?auto_154388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_154389 ?auto_154381 ?auto_154382 ?auto_154383 ?auto_154384 ?auto_154385 ?auto_154386 ?auto_154387 )
      ( MAKE-8PILE ?auto_154381 ?auto_154382 ?auto_154383 ?auto_154384 ?auto_154385 ?auto_154386 ?auto_154387 ?auto_154388 ) )
  )

)

