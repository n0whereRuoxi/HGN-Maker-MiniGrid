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
      ?auto_166628 - BLOCK
      ?auto_166629 - BLOCK
      ?auto_166630 - BLOCK
      ?auto_166631 - BLOCK
      ?auto_166632 - BLOCK
      ?auto_166633 - BLOCK
      ?auto_166634 - BLOCK
      ?auto_166635 - BLOCK
    )
    :vars
    (
      ?auto_166636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166636 ?auto_166635 ) ( CLEAR ?auto_166636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166628 ) ( ON ?auto_166629 ?auto_166628 ) ( ON ?auto_166630 ?auto_166629 ) ( ON ?auto_166631 ?auto_166630 ) ( ON ?auto_166632 ?auto_166631 ) ( ON ?auto_166633 ?auto_166632 ) ( ON ?auto_166634 ?auto_166633 ) ( ON ?auto_166635 ?auto_166634 ) ( not ( = ?auto_166628 ?auto_166629 ) ) ( not ( = ?auto_166628 ?auto_166630 ) ) ( not ( = ?auto_166628 ?auto_166631 ) ) ( not ( = ?auto_166628 ?auto_166632 ) ) ( not ( = ?auto_166628 ?auto_166633 ) ) ( not ( = ?auto_166628 ?auto_166634 ) ) ( not ( = ?auto_166628 ?auto_166635 ) ) ( not ( = ?auto_166628 ?auto_166636 ) ) ( not ( = ?auto_166629 ?auto_166630 ) ) ( not ( = ?auto_166629 ?auto_166631 ) ) ( not ( = ?auto_166629 ?auto_166632 ) ) ( not ( = ?auto_166629 ?auto_166633 ) ) ( not ( = ?auto_166629 ?auto_166634 ) ) ( not ( = ?auto_166629 ?auto_166635 ) ) ( not ( = ?auto_166629 ?auto_166636 ) ) ( not ( = ?auto_166630 ?auto_166631 ) ) ( not ( = ?auto_166630 ?auto_166632 ) ) ( not ( = ?auto_166630 ?auto_166633 ) ) ( not ( = ?auto_166630 ?auto_166634 ) ) ( not ( = ?auto_166630 ?auto_166635 ) ) ( not ( = ?auto_166630 ?auto_166636 ) ) ( not ( = ?auto_166631 ?auto_166632 ) ) ( not ( = ?auto_166631 ?auto_166633 ) ) ( not ( = ?auto_166631 ?auto_166634 ) ) ( not ( = ?auto_166631 ?auto_166635 ) ) ( not ( = ?auto_166631 ?auto_166636 ) ) ( not ( = ?auto_166632 ?auto_166633 ) ) ( not ( = ?auto_166632 ?auto_166634 ) ) ( not ( = ?auto_166632 ?auto_166635 ) ) ( not ( = ?auto_166632 ?auto_166636 ) ) ( not ( = ?auto_166633 ?auto_166634 ) ) ( not ( = ?auto_166633 ?auto_166635 ) ) ( not ( = ?auto_166633 ?auto_166636 ) ) ( not ( = ?auto_166634 ?auto_166635 ) ) ( not ( = ?auto_166634 ?auto_166636 ) ) ( not ( = ?auto_166635 ?auto_166636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166636 ?auto_166635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166638 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166638 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_166638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166639 - BLOCK
    )
    :vars
    (
      ?auto_166640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166639 ?auto_166640 ) ( CLEAR ?auto_166639 ) ( HAND-EMPTY ) ( not ( = ?auto_166639 ?auto_166640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166639 ?auto_166640 )
      ( MAKE-1PILE ?auto_166639 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166648 - BLOCK
      ?auto_166649 - BLOCK
      ?auto_166650 - BLOCK
      ?auto_166651 - BLOCK
      ?auto_166652 - BLOCK
      ?auto_166653 - BLOCK
      ?auto_166654 - BLOCK
    )
    :vars
    (
      ?auto_166655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166655 ?auto_166654 ) ( CLEAR ?auto_166655 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166648 ) ( ON ?auto_166649 ?auto_166648 ) ( ON ?auto_166650 ?auto_166649 ) ( ON ?auto_166651 ?auto_166650 ) ( ON ?auto_166652 ?auto_166651 ) ( ON ?auto_166653 ?auto_166652 ) ( ON ?auto_166654 ?auto_166653 ) ( not ( = ?auto_166648 ?auto_166649 ) ) ( not ( = ?auto_166648 ?auto_166650 ) ) ( not ( = ?auto_166648 ?auto_166651 ) ) ( not ( = ?auto_166648 ?auto_166652 ) ) ( not ( = ?auto_166648 ?auto_166653 ) ) ( not ( = ?auto_166648 ?auto_166654 ) ) ( not ( = ?auto_166648 ?auto_166655 ) ) ( not ( = ?auto_166649 ?auto_166650 ) ) ( not ( = ?auto_166649 ?auto_166651 ) ) ( not ( = ?auto_166649 ?auto_166652 ) ) ( not ( = ?auto_166649 ?auto_166653 ) ) ( not ( = ?auto_166649 ?auto_166654 ) ) ( not ( = ?auto_166649 ?auto_166655 ) ) ( not ( = ?auto_166650 ?auto_166651 ) ) ( not ( = ?auto_166650 ?auto_166652 ) ) ( not ( = ?auto_166650 ?auto_166653 ) ) ( not ( = ?auto_166650 ?auto_166654 ) ) ( not ( = ?auto_166650 ?auto_166655 ) ) ( not ( = ?auto_166651 ?auto_166652 ) ) ( not ( = ?auto_166651 ?auto_166653 ) ) ( not ( = ?auto_166651 ?auto_166654 ) ) ( not ( = ?auto_166651 ?auto_166655 ) ) ( not ( = ?auto_166652 ?auto_166653 ) ) ( not ( = ?auto_166652 ?auto_166654 ) ) ( not ( = ?auto_166652 ?auto_166655 ) ) ( not ( = ?auto_166653 ?auto_166654 ) ) ( not ( = ?auto_166653 ?auto_166655 ) ) ( not ( = ?auto_166654 ?auto_166655 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166655 ?auto_166654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166656 - BLOCK
      ?auto_166657 - BLOCK
      ?auto_166658 - BLOCK
      ?auto_166659 - BLOCK
      ?auto_166660 - BLOCK
      ?auto_166661 - BLOCK
      ?auto_166662 - BLOCK
    )
    :vars
    (
      ?auto_166663 - BLOCK
      ?auto_166664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166663 ?auto_166662 ) ( CLEAR ?auto_166663 ) ( ON-TABLE ?auto_166656 ) ( ON ?auto_166657 ?auto_166656 ) ( ON ?auto_166658 ?auto_166657 ) ( ON ?auto_166659 ?auto_166658 ) ( ON ?auto_166660 ?auto_166659 ) ( ON ?auto_166661 ?auto_166660 ) ( ON ?auto_166662 ?auto_166661 ) ( not ( = ?auto_166656 ?auto_166657 ) ) ( not ( = ?auto_166656 ?auto_166658 ) ) ( not ( = ?auto_166656 ?auto_166659 ) ) ( not ( = ?auto_166656 ?auto_166660 ) ) ( not ( = ?auto_166656 ?auto_166661 ) ) ( not ( = ?auto_166656 ?auto_166662 ) ) ( not ( = ?auto_166656 ?auto_166663 ) ) ( not ( = ?auto_166657 ?auto_166658 ) ) ( not ( = ?auto_166657 ?auto_166659 ) ) ( not ( = ?auto_166657 ?auto_166660 ) ) ( not ( = ?auto_166657 ?auto_166661 ) ) ( not ( = ?auto_166657 ?auto_166662 ) ) ( not ( = ?auto_166657 ?auto_166663 ) ) ( not ( = ?auto_166658 ?auto_166659 ) ) ( not ( = ?auto_166658 ?auto_166660 ) ) ( not ( = ?auto_166658 ?auto_166661 ) ) ( not ( = ?auto_166658 ?auto_166662 ) ) ( not ( = ?auto_166658 ?auto_166663 ) ) ( not ( = ?auto_166659 ?auto_166660 ) ) ( not ( = ?auto_166659 ?auto_166661 ) ) ( not ( = ?auto_166659 ?auto_166662 ) ) ( not ( = ?auto_166659 ?auto_166663 ) ) ( not ( = ?auto_166660 ?auto_166661 ) ) ( not ( = ?auto_166660 ?auto_166662 ) ) ( not ( = ?auto_166660 ?auto_166663 ) ) ( not ( = ?auto_166661 ?auto_166662 ) ) ( not ( = ?auto_166661 ?auto_166663 ) ) ( not ( = ?auto_166662 ?auto_166663 ) ) ( HOLDING ?auto_166664 ) ( not ( = ?auto_166656 ?auto_166664 ) ) ( not ( = ?auto_166657 ?auto_166664 ) ) ( not ( = ?auto_166658 ?auto_166664 ) ) ( not ( = ?auto_166659 ?auto_166664 ) ) ( not ( = ?auto_166660 ?auto_166664 ) ) ( not ( = ?auto_166661 ?auto_166664 ) ) ( not ( = ?auto_166662 ?auto_166664 ) ) ( not ( = ?auto_166663 ?auto_166664 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_166664 )
      ( MAKE-7PILE ?auto_166656 ?auto_166657 ?auto_166658 ?auto_166659 ?auto_166660 ?auto_166661 ?auto_166662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_166665 - BLOCK
      ?auto_166666 - BLOCK
      ?auto_166667 - BLOCK
      ?auto_166668 - BLOCK
      ?auto_166669 - BLOCK
      ?auto_166670 - BLOCK
      ?auto_166671 - BLOCK
    )
    :vars
    (
      ?auto_166672 - BLOCK
      ?auto_166673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166672 ?auto_166671 ) ( ON-TABLE ?auto_166665 ) ( ON ?auto_166666 ?auto_166665 ) ( ON ?auto_166667 ?auto_166666 ) ( ON ?auto_166668 ?auto_166667 ) ( ON ?auto_166669 ?auto_166668 ) ( ON ?auto_166670 ?auto_166669 ) ( ON ?auto_166671 ?auto_166670 ) ( not ( = ?auto_166665 ?auto_166666 ) ) ( not ( = ?auto_166665 ?auto_166667 ) ) ( not ( = ?auto_166665 ?auto_166668 ) ) ( not ( = ?auto_166665 ?auto_166669 ) ) ( not ( = ?auto_166665 ?auto_166670 ) ) ( not ( = ?auto_166665 ?auto_166671 ) ) ( not ( = ?auto_166665 ?auto_166672 ) ) ( not ( = ?auto_166666 ?auto_166667 ) ) ( not ( = ?auto_166666 ?auto_166668 ) ) ( not ( = ?auto_166666 ?auto_166669 ) ) ( not ( = ?auto_166666 ?auto_166670 ) ) ( not ( = ?auto_166666 ?auto_166671 ) ) ( not ( = ?auto_166666 ?auto_166672 ) ) ( not ( = ?auto_166667 ?auto_166668 ) ) ( not ( = ?auto_166667 ?auto_166669 ) ) ( not ( = ?auto_166667 ?auto_166670 ) ) ( not ( = ?auto_166667 ?auto_166671 ) ) ( not ( = ?auto_166667 ?auto_166672 ) ) ( not ( = ?auto_166668 ?auto_166669 ) ) ( not ( = ?auto_166668 ?auto_166670 ) ) ( not ( = ?auto_166668 ?auto_166671 ) ) ( not ( = ?auto_166668 ?auto_166672 ) ) ( not ( = ?auto_166669 ?auto_166670 ) ) ( not ( = ?auto_166669 ?auto_166671 ) ) ( not ( = ?auto_166669 ?auto_166672 ) ) ( not ( = ?auto_166670 ?auto_166671 ) ) ( not ( = ?auto_166670 ?auto_166672 ) ) ( not ( = ?auto_166671 ?auto_166672 ) ) ( not ( = ?auto_166665 ?auto_166673 ) ) ( not ( = ?auto_166666 ?auto_166673 ) ) ( not ( = ?auto_166667 ?auto_166673 ) ) ( not ( = ?auto_166668 ?auto_166673 ) ) ( not ( = ?auto_166669 ?auto_166673 ) ) ( not ( = ?auto_166670 ?auto_166673 ) ) ( not ( = ?auto_166671 ?auto_166673 ) ) ( not ( = ?auto_166672 ?auto_166673 ) ) ( ON ?auto_166673 ?auto_166672 ) ( CLEAR ?auto_166673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166665 ?auto_166666 ?auto_166667 ?auto_166668 ?auto_166669 ?auto_166670 ?auto_166671 ?auto_166672 )
      ( MAKE-7PILE ?auto_166665 ?auto_166666 ?auto_166667 ?auto_166668 ?auto_166669 ?auto_166670 ?auto_166671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166676 - BLOCK
      ?auto_166677 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166677 ) ( CLEAR ?auto_166676 ) ( ON-TABLE ?auto_166676 ) ( not ( = ?auto_166676 ?auto_166677 ) ) )
    :subtasks
    ( ( !STACK ?auto_166677 ?auto_166676 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166678 - BLOCK
      ?auto_166679 - BLOCK
    )
    :vars
    (
      ?auto_166680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166678 ) ( ON-TABLE ?auto_166678 ) ( not ( = ?auto_166678 ?auto_166679 ) ) ( ON ?auto_166679 ?auto_166680 ) ( CLEAR ?auto_166679 ) ( HAND-EMPTY ) ( not ( = ?auto_166678 ?auto_166680 ) ) ( not ( = ?auto_166679 ?auto_166680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166679 ?auto_166680 )
      ( MAKE-2PILE ?auto_166678 ?auto_166679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166681 - BLOCK
      ?auto_166682 - BLOCK
    )
    :vars
    (
      ?auto_166683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166681 ?auto_166682 ) ) ( ON ?auto_166682 ?auto_166683 ) ( CLEAR ?auto_166682 ) ( not ( = ?auto_166681 ?auto_166683 ) ) ( not ( = ?auto_166682 ?auto_166683 ) ) ( HOLDING ?auto_166681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166681 )
      ( MAKE-2PILE ?auto_166681 ?auto_166682 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166684 - BLOCK
      ?auto_166685 - BLOCK
    )
    :vars
    (
      ?auto_166686 - BLOCK
      ?auto_166690 - BLOCK
      ?auto_166687 - BLOCK
      ?auto_166692 - BLOCK
      ?auto_166689 - BLOCK
      ?auto_166688 - BLOCK
      ?auto_166691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166684 ?auto_166685 ) ) ( ON ?auto_166685 ?auto_166686 ) ( not ( = ?auto_166684 ?auto_166686 ) ) ( not ( = ?auto_166685 ?auto_166686 ) ) ( ON ?auto_166684 ?auto_166685 ) ( CLEAR ?auto_166684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166690 ) ( ON ?auto_166687 ?auto_166690 ) ( ON ?auto_166692 ?auto_166687 ) ( ON ?auto_166689 ?auto_166692 ) ( ON ?auto_166688 ?auto_166689 ) ( ON ?auto_166691 ?auto_166688 ) ( ON ?auto_166686 ?auto_166691 ) ( not ( = ?auto_166690 ?auto_166687 ) ) ( not ( = ?auto_166690 ?auto_166692 ) ) ( not ( = ?auto_166690 ?auto_166689 ) ) ( not ( = ?auto_166690 ?auto_166688 ) ) ( not ( = ?auto_166690 ?auto_166691 ) ) ( not ( = ?auto_166690 ?auto_166686 ) ) ( not ( = ?auto_166690 ?auto_166685 ) ) ( not ( = ?auto_166690 ?auto_166684 ) ) ( not ( = ?auto_166687 ?auto_166692 ) ) ( not ( = ?auto_166687 ?auto_166689 ) ) ( not ( = ?auto_166687 ?auto_166688 ) ) ( not ( = ?auto_166687 ?auto_166691 ) ) ( not ( = ?auto_166687 ?auto_166686 ) ) ( not ( = ?auto_166687 ?auto_166685 ) ) ( not ( = ?auto_166687 ?auto_166684 ) ) ( not ( = ?auto_166692 ?auto_166689 ) ) ( not ( = ?auto_166692 ?auto_166688 ) ) ( not ( = ?auto_166692 ?auto_166691 ) ) ( not ( = ?auto_166692 ?auto_166686 ) ) ( not ( = ?auto_166692 ?auto_166685 ) ) ( not ( = ?auto_166692 ?auto_166684 ) ) ( not ( = ?auto_166689 ?auto_166688 ) ) ( not ( = ?auto_166689 ?auto_166691 ) ) ( not ( = ?auto_166689 ?auto_166686 ) ) ( not ( = ?auto_166689 ?auto_166685 ) ) ( not ( = ?auto_166689 ?auto_166684 ) ) ( not ( = ?auto_166688 ?auto_166691 ) ) ( not ( = ?auto_166688 ?auto_166686 ) ) ( not ( = ?auto_166688 ?auto_166685 ) ) ( not ( = ?auto_166688 ?auto_166684 ) ) ( not ( = ?auto_166691 ?auto_166686 ) ) ( not ( = ?auto_166691 ?auto_166685 ) ) ( not ( = ?auto_166691 ?auto_166684 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166690 ?auto_166687 ?auto_166692 ?auto_166689 ?auto_166688 ?auto_166691 ?auto_166686 ?auto_166685 )
      ( MAKE-2PILE ?auto_166684 ?auto_166685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166699 - BLOCK
      ?auto_166700 - BLOCK
      ?auto_166701 - BLOCK
      ?auto_166702 - BLOCK
      ?auto_166703 - BLOCK
      ?auto_166704 - BLOCK
    )
    :vars
    (
      ?auto_166705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166705 ?auto_166704 ) ( CLEAR ?auto_166705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166699 ) ( ON ?auto_166700 ?auto_166699 ) ( ON ?auto_166701 ?auto_166700 ) ( ON ?auto_166702 ?auto_166701 ) ( ON ?auto_166703 ?auto_166702 ) ( ON ?auto_166704 ?auto_166703 ) ( not ( = ?auto_166699 ?auto_166700 ) ) ( not ( = ?auto_166699 ?auto_166701 ) ) ( not ( = ?auto_166699 ?auto_166702 ) ) ( not ( = ?auto_166699 ?auto_166703 ) ) ( not ( = ?auto_166699 ?auto_166704 ) ) ( not ( = ?auto_166699 ?auto_166705 ) ) ( not ( = ?auto_166700 ?auto_166701 ) ) ( not ( = ?auto_166700 ?auto_166702 ) ) ( not ( = ?auto_166700 ?auto_166703 ) ) ( not ( = ?auto_166700 ?auto_166704 ) ) ( not ( = ?auto_166700 ?auto_166705 ) ) ( not ( = ?auto_166701 ?auto_166702 ) ) ( not ( = ?auto_166701 ?auto_166703 ) ) ( not ( = ?auto_166701 ?auto_166704 ) ) ( not ( = ?auto_166701 ?auto_166705 ) ) ( not ( = ?auto_166702 ?auto_166703 ) ) ( not ( = ?auto_166702 ?auto_166704 ) ) ( not ( = ?auto_166702 ?auto_166705 ) ) ( not ( = ?auto_166703 ?auto_166704 ) ) ( not ( = ?auto_166703 ?auto_166705 ) ) ( not ( = ?auto_166704 ?auto_166705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166705 ?auto_166704 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166706 - BLOCK
      ?auto_166707 - BLOCK
      ?auto_166708 - BLOCK
      ?auto_166709 - BLOCK
      ?auto_166710 - BLOCK
      ?auto_166711 - BLOCK
    )
    :vars
    (
      ?auto_166712 - BLOCK
      ?auto_166713 - BLOCK
      ?auto_166714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166712 ?auto_166711 ) ( CLEAR ?auto_166712 ) ( ON-TABLE ?auto_166706 ) ( ON ?auto_166707 ?auto_166706 ) ( ON ?auto_166708 ?auto_166707 ) ( ON ?auto_166709 ?auto_166708 ) ( ON ?auto_166710 ?auto_166709 ) ( ON ?auto_166711 ?auto_166710 ) ( not ( = ?auto_166706 ?auto_166707 ) ) ( not ( = ?auto_166706 ?auto_166708 ) ) ( not ( = ?auto_166706 ?auto_166709 ) ) ( not ( = ?auto_166706 ?auto_166710 ) ) ( not ( = ?auto_166706 ?auto_166711 ) ) ( not ( = ?auto_166706 ?auto_166712 ) ) ( not ( = ?auto_166707 ?auto_166708 ) ) ( not ( = ?auto_166707 ?auto_166709 ) ) ( not ( = ?auto_166707 ?auto_166710 ) ) ( not ( = ?auto_166707 ?auto_166711 ) ) ( not ( = ?auto_166707 ?auto_166712 ) ) ( not ( = ?auto_166708 ?auto_166709 ) ) ( not ( = ?auto_166708 ?auto_166710 ) ) ( not ( = ?auto_166708 ?auto_166711 ) ) ( not ( = ?auto_166708 ?auto_166712 ) ) ( not ( = ?auto_166709 ?auto_166710 ) ) ( not ( = ?auto_166709 ?auto_166711 ) ) ( not ( = ?auto_166709 ?auto_166712 ) ) ( not ( = ?auto_166710 ?auto_166711 ) ) ( not ( = ?auto_166710 ?auto_166712 ) ) ( not ( = ?auto_166711 ?auto_166712 ) ) ( HOLDING ?auto_166713 ) ( CLEAR ?auto_166714 ) ( not ( = ?auto_166706 ?auto_166713 ) ) ( not ( = ?auto_166706 ?auto_166714 ) ) ( not ( = ?auto_166707 ?auto_166713 ) ) ( not ( = ?auto_166707 ?auto_166714 ) ) ( not ( = ?auto_166708 ?auto_166713 ) ) ( not ( = ?auto_166708 ?auto_166714 ) ) ( not ( = ?auto_166709 ?auto_166713 ) ) ( not ( = ?auto_166709 ?auto_166714 ) ) ( not ( = ?auto_166710 ?auto_166713 ) ) ( not ( = ?auto_166710 ?auto_166714 ) ) ( not ( = ?auto_166711 ?auto_166713 ) ) ( not ( = ?auto_166711 ?auto_166714 ) ) ( not ( = ?auto_166712 ?auto_166713 ) ) ( not ( = ?auto_166712 ?auto_166714 ) ) ( not ( = ?auto_166713 ?auto_166714 ) ) )
    :subtasks
    ( ( !STACK ?auto_166713 ?auto_166714 )
      ( MAKE-6PILE ?auto_166706 ?auto_166707 ?auto_166708 ?auto_166709 ?auto_166710 ?auto_166711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166715 - BLOCK
      ?auto_166716 - BLOCK
      ?auto_166717 - BLOCK
      ?auto_166718 - BLOCK
      ?auto_166719 - BLOCK
      ?auto_166720 - BLOCK
    )
    :vars
    (
      ?auto_166721 - BLOCK
      ?auto_166723 - BLOCK
      ?auto_166722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166721 ?auto_166720 ) ( ON-TABLE ?auto_166715 ) ( ON ?auto_166716 ?auto_166715 ) ( ON ?auto_166717 ?auto_166716 ) ( ON ?auto_166718 ?auto_166717 ) ( ON ?auto_166719 ?auto_166718 ) ( ON ?auto_166720 ?auto_166719 ) ( not ( = ?auto_166715 ?auto_166716 ) ) ( not ( = ?auto_166715 ?auto_166717 ) ) ( not ( = ?auto_166715 ?auto_166718 ) ) ( not ( = ?auto_166715 ?auto_166719 ) ) ( not ( = ?auto_166715 ?auto_166720 ) ) ( not ( = ?auto_166715 ?auto_166721 ) ) ( not ( = ?auto_166716 ?auto_166717 ) ) ( not ( = ?auto_166716 ?auto_166718 ) ) ( not ( = ?auto_166716 ?auto_166719 ) ) ( not ( = ?auto_166716 ?auto_166720 ) ) ( not ( = ?auto_166716 ?auto_166721 ) ) ( not ( = ?auto_166717 ?auto_166718 ) ) ( not ( = ?auto_166717 ?auto_166719 ) ) ( not ( = ?auto_166717 ?auto_166720 ) ) ( not ( = ?auto_166717 ?auto_166721 ) ) ( not ( = ?auto_166718 ?auto_166719 ) ) ( not ( = ?auto_166718 ?auto_166720 ) ) ( not ( = ?auto_166718 ?auto_166721 ) ) ( not ( = ?auto_166719 ?auto_166720 ) ) ( not ( = ?auto_166719 ?auto_166721 ) ) ( not ( = ?auto_166720 ?auto_166721 ) ) ( CLEAR ?auto_166723 ) ( not ( = ?auto_166715 ?auto_166722 ) ) ( not ( = ?auto_166715 ?auto_166723 ) ) ( not ( = ?auto_166716 ?auto_166722 ) ) ( not ( = ?auto_166716 ?auto_166723 ) ) ( not ( = ?auto_166717 ?auto_166722 ) ) ( not ( = ?auto_166717 ?auto_166723 ) ) ( not ( = ?auto_166718 ?auto_166722 ) ) ( not ( = ?auto_166718 ?auto_166723 ) ) ( not ( = ?auto_166719 ?auto_166722 ) ) ( not ( = ?auto_166719 ?auto_166723 ) ) ( not ( = ?auto_166720 ?auto_166722 ) ) ( not ( = ?auto_166720 ?auto_166723 ) ) ( not ( = ?auto_166721 ?auto_166722 ) ) ( not ( = ?auto_166721 ?auto_166723 ) ) ( not ( = ?auto_166722 ?auto_166723 ) ) ( ON ?auto_166722 ?auto_166721 ) ( CLEAR ?auto_166722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166715 ?auto_166716 ?auto_166717 ?auto_166718 ?auto_166719 ?auto_166720 ?auto_166721 )
      ( MAKE-6PILE ?auto_166715 ?auto_166716 ?auto_166717 ?auto_166718 ?auto_166719 ?auto_166720 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166724 - BLOCK
      ?auto_166725 - BLOCK
      ?auto_166726 - BLOCK
      ?auto_166727 - BLOCK
      ?auto_166728 - BLOCK
      ?auto_166729 - BLOCK
    )
    :vars
    (
      ?auto_166730 - BLOCK
      ?auto_166731 - BLOCK
      ?auto_166732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166730 ?auto_166729 ) ( ON-TABLE ?auto_166724 ) ( ON ?auto_166725 ?auto_166724 ) ( ON ?auto_166726 ?auto_166725 ) ( ON ?auto_166727 ?auto_166726 ) ( ON ?auto_166728 ?auto_166727 ) ( ON ?auto_166729 ?auto_166728 ) ( not ( = ?auto_166724 ?auto_166725 ) ) ( not ( = ?auto_166724 ?auto_166726 ) ) ( not ( = ?auto_166724 ?auto_166727 ) ) ( not ( = ?auto_166724 ?auto_166728 ) ) ( not ( = ?auto_166724 ?auto_166729 ) ) ( not ( = ?auto_166724 ?auto_166730 ) ) ( not ( = ?auto_166725 ?auto_166726 ) ) ( not ( = ?auto_166725 ?auto_166727 ) ) ( not ( = ?auto_166725 ?auto_166728 ) ) ( not ( = ?auto_166725 ?auto_166729 ) ) ( not ( = ?auto_166725 ?auto_166730 ) ) ( not ( = ?auto_166726 ?auto_166727 ) ) ( not ( = ?auto_166726 ?auto_166728 ) ) ( not ( = ?auto_166726 ?auto_166729 ) ) ( not ( = ?auto_166726 ?auto_166730 ) ) ( not ( = ?auto_166727 ?auto_166728 ) ) ( not ( = ?auto_166727 ?auto_166729 ) ) ( not ( = ?auto_166727 ?auto_166730 ) ) ( not ( = ?auto_166728 ?auto_166729 ) ) ( not ( = ?auto_166728 ?auto_166730 ) ) ( not ( = ?auto_166729 ?auto_166730 ) ) ( not ( = ?auto_166724 ?auto_166731 ) ) ( not ( = ?auto_166724 ?auto_166732 ) ) ( not ( = ?auto_166725 ?auto_166731 ) ) ( not ( = ?auto_166725 ?auto_166732 ) ) ( not ( = ?auto_166726 ?auto_166731 ) ) ( not ( = ?auto_166726 ?auto_166732 ) ) ( not ( = ?auto_166727 ?auto_166731 ) ) ( not ( = ?auto_166727 ?auto_166732 ) ) ( not ( = ?auto_166728 ?auto_166731 ) ) ( not ( = ?auto_166728 ?auto_166732 ) ) ( not ( = ?auto_166729 ?auto_166731 ) ) ( not ( = ?auto_166729 ?auto_166732 ) ) ( not ( = ?auto_166730 ?auto_166731 ) ) ( not ( = ?auto_166730 ?auto_166732 ) ) ( not ( = ?auto_166731 ?auto_166732 ) ) ( ON ?auto_166731 ?auto_166730 ) ( CLEAR ?auto_166731 ) ( HOLDING ?auto_166732 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166732 )
      ( MAKE-6PILE ?auto_166724 ?auto_166725 ?auto_166726 ?auto_166727 ?auto_166728 ?auto_166729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166733 - BLOCK
      ?auto_166734 - BLOCK
      ?auto_166735 - BLOCK
      ?auto_166736 - BLOCK
      ?auto_166737 - BLOCK
      ?auto_166738 - BLOCK
    )
    :vars
    (
      ?auto_166741 - BLOCK
      ?auto_166739 - BLOCK
      ?auto_166740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166741 ?auto_166738 ) ( ON-TABLE ?auto_166733 ) ( ON ?auto_166734 ?auto_166733 ) ( ON ?auto_166735 ?auto_166734 ) ( ON ?auto_166736 ?auto_166735 ) ( ON ?auto_166737 ?auto_166736 ) ( ON ?auto_166738 ?auto_166737 ) ( not ( = ?auto_166733 ?auto_166734 ) ) ( not ( = ?auto_166733 ?auto_166735 ) ) ( not ( = ?auto_166733 ?auto_166736 ) ) ( not ( = ?auto_166733 ?auto_166737 ) ) ( not ( = ?auto_166733 ?auto_166738 ) ) ( not ( = ?auto_166733 ?auto_166741 ) ) ( not ( = ?auto_166734 ?auto_166735 ) ) ( not ( = ?auto_166734 ?auto_166736 ) ) ( not ( = ?auto_166734 ?auto_166737 ) ) ( not ( = ?auto_166734 ?auto_166738 ) ) ( not ( = ?auto_166734 ?auto_166741 ) ) ( not ( = ?auto_166735 ?auto_166736 ) ) ( not ( = ?auto_166735 ?auto_166737 ) ) ( not ( = ?auto_166735 ?auto_166738 ) ) ( not ( = ?auto_166735 ?auto_166741 ) ) ( not ( = ?auto_166736 ?auto_166737 ) ) ( not ( = ?auto_166736 ?auto_166738 ) ) ( not ( = ?auto_166736 ?auto_166741 ) ) ( not ( = ?auto_166737 ?auto_166738 ) ) ( not ( = ?auto_166737 ?auto_166741 ) ) ( not ( = ?auto_166738 ?auto_166741 ) ) ( not ( = ?auto_166733 ?auto_166739 ) ) ( not ( = ?auto_166733 ?auto_166740 ) ) ( not ( = ?auto_166734 ?auto_166739 ) ) ( not ( = ?auto_166734 ?auto_166740 ) ) ( not ( = ?auto_166735 ?auto_166739 ) ) ( not ( = ?auto_166735 ?auto_166740 ) ) ( not ( = ?auto_166736 ?auto_166739 ) ) ( not ( = ?auto_166736 ?auto_166740 ) ) ( not ( = ?auto_166737 ?auto_166739 ) ) ( not ( = ?auto_166737 ?auto_166740 ) ) ( not ( = ?auto_166738 ?auto_166739 ) ) ( not ( = ?auto_166738 ?auto_166740 ) ) ( not ( = ?auto_166741 ?auto_166739 ) ) ( not ( = ?auto_166741 ?auto_166740 ) ) ( not ( = ?auto_166739 ?auto_166740 ) ) ( ON ?auto_166739 ?auto_166741 ) ( ON ?auto_166740 ?auto_166739 ) ( CLEAR ?auto_166740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166733 ?auto_166734 ?auto_166735 ?auto_166736 ?auto_166737 ?auto_166738 ?auto_166741 ?auto_166739 )
      ( MAKE-6PILE ?auto_166733 ?auto_166734 ?auto_166735 ?auto_166736 ?auto_166737 ?auto_166738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166745 - BLOCK
      ?auto_166746 - BLOCK
      ?auto_166747 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166747 ) ( CLEAR ?auto_166746 ) ( ON-TABLE ?auto_166745 ) ( ON ?auto_166746 ?auto_166745 ) ( not ( = ?auto_166745 ?auto_166746 ) ) ( not ( = ?auto_166745 ?auto_166747 ) ) ( not ( = ?auto_166746 ?auto_166747 ) ) )
    :subtasks
    ( ( !STACK ?auto_166747 ?auto_166746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166748 - BLOCK
      ?auto_166749 - BLOCK
      ?auto_166750 - BLOCK
    )
    :vars
    (
      ?auto_166751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166749 ) ( ON-TABLE ?auto_166748 ) ( ON ?auto_166749 ?auto_166748 ) ( not ( = ?auto_166748 ?auto_166749 ) ) ( not ( = ?auto_166748 ?auto_166750 ) ) ( not ( = ?auto_166749 ?auto_166750 ) ) ( ON ?auto_166750 ?auto_166751 ) ( CLEAR ?auto_166750 ) ( HAND-EMPTY ) ( not ( = ?auto_166748 ?auto_166751 ) ) ( not ( = ?auto_166749 ?auto_166751 ) ) ( not ( = ?auto_166750 ?auto_166751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166750 ?auto_166751 )
      ( MAKE-3PILE ?auto_166748 ?auto_166749 ?auto_166750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166752 - BLOCK
      ?auto_166753 - BLOCK
      ?auto_166754 - BLOCK
    )
    :vars
    (
      ?auto_166755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166752 ) ( not ( = ?auto_166752 ?auto_166753 ) ) ( not ( = ?auto_166752 ?auto_166754 ) ) ( not ( = ?auto_166753 ?auto_166754 ) ) ( ON ?auto_166754 ?auto_166755 ) ( CLEAR ?auto_166754 ) ( not ( = ?auto_166752 ?auto_166755 ) ) ( not ( = ?auto_166753 ?auto_166755 ) ) ( not ( = ?auto_166754 ?auto_166755 ) ) ( HOLDING ?auto_166753 ) ( CLEAR ?auto_166752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166752 ?auto_166753 )
      ( MAKE-3PILE ?auto_166752 ?auto_166753 ?auto_166754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166756 - BLOCK
      ?auto_166757 - BLOCK
      ?auto_166758 - BLOCK
    )
    :vars
    (
      ?auto_166759 - BLOCK
      ?auto_166762 - BLOCK
      ?auto_166763 - BLOCK
      ?auto_166764 - BLOCK
      ?auto_166761 - BLOCK
      ?auto_166760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166756 ) ( not ( = ?auto_166756 ?auto_166757 ) ) ( not ( = ?auto_166756 ?auto_166758 ) ) ( not ( = ?auto_166757 ?auto_166758 ) ) ( ON ?auto_166758 ?auto_166759 ) ( not ( = ?auto_166756 ?auto_166759 ) ) ( not ( = ?auto_166757 ?auto_166759 ) ) ( not ( = ?auto_166758 ?auto_166759 ) ) ( CLEAR ?auto_166756 ) ( ON ?auto_166757 ?auto_166758 ) ( CLEAR ?auto_166757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166762 ) ( ON ?auto_166763 ?auto_166762 ) ( ON ?auto_166764 ?auto_166763 ) ( ON ?auto_166761 ?auto_166764 ) ( ON ?auto_166760 ?auto_166761 ) ( ON ?auto_166759 ?auto_166760 ) ( not ( = ?auto_166762 ?auto_166763 ) ) ( not ( = ?auto_166762 ?auto_166764 ) ) ( not ( = ?auto_166762 ?auto_166761 ) ) ( not ( = ?auto_166762 ?auto_166760 ) ) ( not ( = ?auto_166762 ?auto_166759 ) ) ( not ( = ?auto_166762 ?auto_166758 ) ) ( not ( = ?auto_166762 ?auto_166757 ) ) ( not ( = ?auto_166763 ?auto_166764 ) ) ( not ( = ?auto_166763 ?auto_166761 ) ) ( not ( = ?auto_166763 ?auto_166760 ) ) ( not ( = ?auto_166763 ?auto_166759 ) ) ( not ( = ?auto_166763 ?auto_166758 ) ) ( not ( = ?auto_166763 ?auto_166757 ) ) ( not ( = ?auto_166764 ?auto_166761 ) ) ( not ( = ?auto_166764 ?auto_166760 ) ) ( not ( = ?auto_166764 ?auto_166759 ) ) ( not ( = ?auto_166764 ?auto_166758 ) ) ( not ( = ?auto_166764 ?auto_166757 ) ) ( not ( = ?auto_166761 ?auto_166760 ) ) ( not ( = ?auto_166761 ?auto_166759 ) ) ( not ( = ?auto_166761 ?auto_166758 ) ) ( not ( = ?auto_166761 ?auto_166757 ) ) ( not ( = ?auto_166760 ?auto_166759 ) ) ( not ( = ?auto_166760 ?auto_166758 ) ) ( not ( = ?auto_166760 ?auto_166757 ) ) ( not ( = ?auto_166756 ?auto_166762 ) ) ( not ( = ?auto_166756 ?auto_166763 ) ) ( not ( = ?auto_166756 ?auto_166764 ) ) ( not ( = ?auto_166756 ?auto_166761 ) ) ( not ( = ?auto_166756 ?auto_166760 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166762 ?auto_166763 ?auto_166764 ?auto_166761 ?auto_166760 ?auto_166759 ?auto_166758 )
      ( MAKE-3PILE ?auto_166756 ?auto_166757 ?auto_166758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166765 - BLOCK
      ?auto_166766 - BLOCK
      ?auto_166767 - BLOCK
    )
    :vars
    (
      ?auto_166773 - BLOCK
      ?auto_166770 - BLOCK
      ?auto_166768 - BLOCK
      ?auto_166772 - BLOCK
      ?auto_166769 - BLOCK
      ?auto_166771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166765 ?auto_166766 ) ) ( not ( = ?auto_166765 ?auto_166767 ) ) ( not ( = ?auto_166766 ?auto_166767 ) ) ( ON ?auto_166767 ?auto_166773 ) ( not ( = ?auto_166765 ?auto_166773 ) ) ( not ( = ?auto_166766 ?auto_166773 ) ) ( not ( = ?auto_166767 ?auto_166773 ) ) ( ON ?auto_166766 ?auto_166767 ) ( CLEAR ?auto_166766 ) ( ON-TABLE ?auto_166770 ) ( ON ?auto_166768 ?auto_166770 ) ( ON ?auto_166772 ?auto_166768 ) ( ON ?auto_166769 ?auto_166772 ) ( ON ?auto_166771 ?auto_166769 ) ( ON ?auto_166773 ?auto_166771 ) ( not ( = ?auto_166770 ?auto_166768 ) ) ( not ( = ?auto_166770 ?auto_166772 ) ) ( not ( = ?auto_166770 ?auto_166769 ) ) ( not ( = ?auto_166770 ?auto_166771 ) ) ( not ( = ?auto_166770 ?auto_166773 ) ) ( not ( = ?auto_166770 ?auto_166767 ) ) ( not ( = ?auto_166770 ?auto_166766 ) ) ( not ( = ?auto_166768 ?auto_166772 ) ) ( not ( = ?auto_166768 ?auto_166769 ) ) ( not ( = ?auto_166768 ?auto_166771 ) ) ( not ( = ?auto_166768 ?auto_166773 ) ) ( not ( = ?auto_166768 ?auto_166767 ) ) ( not ( = ?auto_166768 ?auto_166766 ) ) ( not ( = ?auto_166772 ?auto_166769 ) ) ( not ( = ?auto_166772 ?auto_166771 ) ) ( not ( = ?auto_166772 ?auto_166773 ) ) ( not ( = ?auto_166772 ?auto_166767 ) ) ( not ( = ?auto_166772 ?auto_166766 ) ) ( not ( = ?auto_166769 ?auto_166771 ) ) ( not ( = ?auto_166769 ?auto_166773 ) ) ( not ( = ?auto_166769 ?auto_166767 ) ) ( not ( = ?auto_166769 ?auto_166766 ) ) ( not ( = ?auto_166771 ?auto_166773 ) ) ( not ( = ?auto_166771 ?auto_166767 ) ) ( not ( = ?auto_166771 ?auto_166766 ) ) ( not ( = ?auto_166765 ?auto_166770 ) ) ( not ( = ?auto_166765 ?auto_166768 ) ) ( not ( = ?auto_166765 ?auto_166772 ) ) ( not ( = ?auto_166765 ?auto_166769 ) ) ( not ( = ?auto_166765 ?auto_166771 ) ) ( HOLDING ?auto_166765 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166765 )
      ( MAKE-3PILE ?auto_166765 ?auto_166766 ?auto_166767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166774 - BLOCK
      ?auto_166775 - BLOCK
      ?auto_166776 - BLOCK
    )
    :vars
    (
      ?auto_166780 - BLOCK
      ?auto_166781 - BLOCK
      ?auto_166778 - BLOCK
      ?auto_166782 - BLOCK
      ?auto_166777 - BLOCK
      ?auto_166779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166774 ?auto_166775 ) ) ( not ( = ?auto_166774 ?auto_166776 ) ) ( not ( = ?auto_166775 ?auto_166776 ) ) ( ON ?auto_166776 ?auto_166780 ) ( not ( = ?auto_166774 ?auto_166780 ) ) ( not ( = ?auto_166775 ?auto_166780 ) ) ( not ( = ?auto_166776 ?auto_166780 ) ) ( ON ?auto_166775 ?auto_166776 ) ( ON-TABLE ?auto_166781 ) ( ON ?auto_166778 ?auto_166781 ) ( ON ?auto_166782 ?auto_166778 ) ( ON ?auto_166777 ?auto_166782 ) ( ON ?auto_166779 ?auto_166777 ) ( ON ?auto_166780 ?auto_166779 ) ( not ( = ?auto_166781 ?auto_166778 ) ) ( not ( = ?auto_166781 ?auto_166782 ) ) ( not ( = ?auto_166781 ?auto_166777 ) ) ( not ( = ?auto_166781 ?auto_166779 ) ) ( not ( = ?auto_166781 ?auto_166780 ) ) ( not ( = ?auto_166781 ?auto_166776 ) ) ( not ( = ?auto_166781 ?auto_166775 ) ) ( not ( = ?auto_166778 ?auto_166782 ) ) ( not ( = ?auto_166778 ?auto_166777 ) ) ( not ( = ?auto_166778 ?auto_166779 ) ) ( not ( = ?auto_166778 ?auto_166780 ) ) ( not ( = ?auto_166778 ?auto_166776 ) ) ( not ( = ?auto_166778 ?auto_166775 ) ) ( not ( = ?auto_166782 ?auto_166777 ) ) ( not ( = ?auto_166782 ?auto_166779 ) ) ( not ( = ?auto_166782 ?auto_166780 ) ) ( not ( = ?auto_166782 ?auto_166776 ) ) ( not ( = ?auto_166782 ?auto_166775 ) ) ( not ( = ?auto_166777 ?auto_166779 ) ) ( not ( = ?auto_166777 ?auto_166780 ) ) ( not ( = ?auto_166777 ?auto_166776 ) ) ( not ( = ?auto_166777 ?auto_166775 ) ) ( not ( = ?auto_166779 ?auto_166780 ) ) ( not ( = ?auto_166779 ?auto_166776 ) ) ( not ( = ?auto_166779 ?auto_166775 ) ) ( not ( = ?auto_166774 ?auto_166781 ) ) ( not ( = ?auto_166774 ?auto_166778 ) ) ( not ( = ?auto_166774 ?auto_166782 ) ) ( not ( = ?auto_166774 ?auto_166777 ) ) ( not ( = ?auto_166774 ?auto_166779 ) ) ( ON ?auto_166774 ?auto_166775 ) ( CLEAR ?auto_166774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166781 ?auto_166778 ?auto_166782 ?auto_166777 ?auto_166779 ?auto_166780 ?auto_166776 ?auto_166775 )
      ( MAKE-3PILE ?auto_166774 ?auto_166775 ?auto_166776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166788 - BLOCK
      ?auto_166789 - BLOCK
      ?auto_166790 - BLOCK
      ?auto_166791 - BLOCK
      ?auto_166792 - BLOCK
    )
    :vars
    (
      ?auto_166793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166793 ?auto_166792 ) ( CLEAR ?auto_166793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166788 ) ( ON ?auto_166789 ?auto_166788 ) ( ON ?auto_166790 ?auto_166789 ) ( ON ?auto_166791 ?auto_166790 ) ( ON ?auto_166792 ?auto_166791 ) ( not ( = ?auto_166788 ?auto_166789 ) ) ( not ( = ?auto_166788 ?auto_166790 ) ) ( not ( = ?auto_166788 ?auto_166791 ) ) ( not ( = ?auto_166788 ?auto_166792 ) ) ( not ( = ?auto_166788 ?auto_166793 ) ) ( not ( = ?auto_166789 ?auto_166790 ) ) ( not ( = ?auto_166789 ?auto_166791 ) ) ( not ( = ?auto_166789 ?auto_166792 ) ) ( not ( = ?auto_166789 ?auto_166793 ) ) ( not ( = ?auto_166790 ?auto_166791 ) ) ( not ( = ?auto_166790 ?auto_166792 ) ) ( not ( = ?auto_166790 ?auto_166793 ) ) ( not ( = ?auto_166791 ?auto_166792 ) ) ( not ( = ?auto_166791 ?auto_166793 ) ) ( not ( = ?auto_166792 ?auto_166793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166793 ?auto_166792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166794 - BLOCK
      ?auto_166795 - BLOCK
      ?auto_166796 - BLOCK
      ?auto_166797 - BLOCK
      ?auto_166798 - BLOCK
    )
    :vars
    (
      ?auto_166799 - BLOCK
      ?auto_166800 - BLOCK
      ?auto_166801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166799 ?auto_166798 ) ( CLEAR ?auto_166799 ) ( ON-TABLE ?auto_166794 ) ( ON ?auto_166795 ?auto_166794 ) ( ON ?auto_166796 ?auto_166795 ) ( ON ?auto_166797 ?auto_166796 ) ( ON ?auto_166798 ?auto_166797 ) ( not ( = ?auto_166794 ?auto_166795 ) ) ( not ( = ?auto_166794 ?auto_166796 ) ) ( not ( = ?auto_166794 ?auto_166797 ) ) ( not ( = ?auto_166794 ?auto_166798 ) ) ( not ( = ?auto_166794 ?auto_166799 ) ) ( not ( = ?auto_166795 ?auto_166796 ) ) ( not ( = ?auto_166795 ?auto_166797 ) ) ( not ( = ?auto_166795 ?auto_166798 ) ) ( not ( = ?auto_166795 ?auto_166799 ) ) ( not ( = ?auto_166796 ?auto_166797 ) ) ( not ( = ?auto_166796 ?auto_166798 ) ) ( not ( = ?auto_166796 ?auto_166799 ) ) ( not ( = ?auto_166797 ?auto_166798 ) ) ( not ( = ?auto_166797 ?auto_166799 ) ) ( not ( = ?auto_166798 ?auto_166799 ) ) ( HOLDING ?auto_166800 ) ( CLEAR ?auto_166801 ) ( not ( = ?auto_166794 ?auto_166800 ) ) ( not ( = ?auto_166794 ?auto_166801 ) ) ( not ( = ?auto_166795 ?auto_166800 ) ) ( not ( = ?auto_166795 ?auto_166801 ) ) ( not ( = ?auto_166796 ?auto_166800 ) ) ( not ( = ?auto_166796 ?auto_166801 ) ) ( not ( = ?auto_166797 ?auto_166800 ) ) ( not ( = ?auto_166797 ?auto_166801 ) ) ( not ( = ?auto_166798 ?auto_166800 ) ) ( not ( = ?auto_166798 ?auto_166801 ) ) ( not ( = ?auto_166799 ?auto_166800 ) ) ( not ( = ?auto_166799 ?auto_166801 ) ) ( not ( = ?auto_166800 ?auto_166801 ) ) )
    :subtasks
    ( ( !STACK ?auto_166800 ?auto_166801 )
      ( MAKE-5PILE ?auto_166794 ?auto_166795 ?auto_166796 ?auto_166797 ?auto_166798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166802 - BLOCK
      ?auto_166803 - BLOCK
      ?auto_166804 - BLOCK
      ?auto_166805 - BLOCK
      ?auto_166806 - BLOCK
    )
    :vars
    (
      ?auto_166809 - BLOCK
      ?auto_166807 - BLOCK
      ?auto_166808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166809 ?auto_166806 ) ( ON-TABLE ?auto_166802 ) ( ON ?auto_166803 ?auto_166802 ) ( ON ?auto_166804 ?auto_166803 ) ( ON ?auto_166805 ?auto_166804 ) ( ON ?auto_166806 ?auto_166805 ) ( not ( = ?auto_166802 ?auto_166803 ) ) ( not ( = ?auto_166802 ?auto_166804 ) ) ( not ( = ?auto_166802 ?auto_166805 ) ) ( not ( = ?auto_166802 ?auto_166806 ) ) ( not ( = ?auto_166802 ?auto_166809 ) ) ( not ( = ?auto_166803 ?auto_166804 ) ) ( not ( = ?auto_166803 ?auto_166805 ) ) ( not ( = ?auto_166803 ?auto_166806 ) ) ( not ( = ?auto_166803 ?auto_166809 ) ) ( not ( = ?auto_166804 ?auto_166805 ) ) ( not ( = ?auto_166804 ?auto_166806 ) ) ( not ( = ?auto_166804 ?auto_166809 ) ) ( not ( = ?auto_166805 ?auto_166806 ) ) ( not ( = ?auto_166805 ?auto_166809 ) ) ( not ( = ?auto_166806 ?auto_166809 ) ) ( CLEAR ?auto_166807 ) ( not ( = ?auto_166802 ?auto_166808 ) ) ( not ( = ?auto_166802 ?auto_166807 ) ) ( not ( = ?auto_166803 ?auto_166808 ) ) ( not ( = ?auto_166803 ?auto_166807 ) ) ( not ( = ?auto_166804 ?auto_166808 ) ) ( not ( = ?auto_166804 ?auto_166807 ) ) ( not ( = ?auto_166805 ?auto_166808 ) ) ( not ( = ?auto_166805 ?auto_166807 ) ) ( not ( = ?auto_166806 ?auto_166808 ) ) ( not ( = ?auto_166806 ?auto_166807 ) ) ( not ( = ?auto_166809 ?auto_166808 ) ) ( not ( = ?auto_166809 ?auto_166807 ) ) ( not ( = ?auto_166808 ?auto_166807 ) ) ( ON ?auto_166808 ?auto_166809 ) ( CLEAR ?auto_166808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166802 ?auto_166803 ?auto_166804 ?auto_166805 ?auto_166806 ?auto_166809 )
      ( MAKE-5PILE ?auto_166802 ?auto_166803 ?auto_166804 ?auto_166805 ?auto_166806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166810 - BLOCK
      ?auto_166811 - BLOCK
      ?auto_166812 - BLOCK
      ?auto_166813 - BLOCK
      ?auto_166814 - BLOCK
    )
    :vars
    (
      ?auto_166817 - BLOCK
      ?auto_166815 - BLOCK
      ?auto_166816 - BLOCK
      ?auto_166818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166817 ?auto_166814 ) ( ON-TABLE ?auto_166810 ) ( ON ?auto_166811 ?auto_166810 ) ( ON ?auto_166812 ?auto_166811 ) ( ON ?auto_166813 ?auto_166812 ) ( ON ?auto_166814 ?auto_166813 ) ( not ( = ?auto_166810 ?auto_166811 ) ) ( not ( = ?auto_166810 ?auto_166812 ) ) ( not ( = ?auto_166810 ?auto_166813 ) ) ( not ( = ?auto_166810 ?auto_166814 ) ) ( not ( = ?auto_166810 ?auto_166817 ) ) ( not ( = ?auto_166811 ?auto_166812 ) ) ( not ( = ?auto_166811 ?auto_166813 ) ) ( not ( = ?auto_166811 ?auto_166814 ) ) ( not ( = ?auto_166811 ?auto_166817 ) ) ( not ( = ?auto_166812 ?auto_166813 ) ) ( not ( = ?auto_166812 ?auto_166814 ) ) ( not ( = ?auto_166812 ?auto_166817 ) ) ( not ( = ?auto_166813 ?auto_166814 ) ) ( not ( = ?auto_166813 ?auto_166817 ) ) ( not ( = ?auto_166814 ?auto_166817 ) ) ( not ( = ?auto_166810 ?auto_166815 ) ) ( not ( = ?auto_166810 ?auto_166816 ) ) ( not ( = ?auto_166811 ?auto_166815 ) ) ( not ( = ?auto_166811 ?auto_166816 ) ) ( not ( = ?auto_166812 ?auto_166815 ) ) ( not ( = ?auto_166812 ?auto_166816 ) ) ( not ( = ?auto_166813 ?auto_166815 ) ) ( not ( = ?auto_166813 ?auto_166816 ) ) ( not ( = ?auto_166814 ?auto_166815 ) ) ( not ( = ?auto_166814 ?auto_166816 ) ) ( not ( = ?auto_166817 ?auto_166815 ) ) ( not ( = ?auto_166817 ?auto_166816 ) ) ( not ( = ?auto_166815 ?auto_166816 ) ) ( ON ?auto_166815 ?auto_166817 ) ( CLEAR ?auto_166815 ) ( HOLDING ?auto_166816 ) ( CLEAR ?auto_166818 ) ( ON-TABLE ?auto_166818 ) ( not ( = ?auto_166818 ?auto_166816 ) ) ( not ( = ?auto_166810 ?auto_166818 ) ) ( not ( = ?auto_166811 ?auto_166818 ) ) ( not ( = ?auto_166812 ?auto_166818 ) ) ( not ( = ?auto_166813 ?auto_166818 ) ) ( not ( = ?auto_166814 ?auto_166818 ) ) ( not ( = ?auto_166817 ?auto_166818 ) ) ( not ( = ?auto_166815 ?auto_166818 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166818 ?auto_166816 )
      ( MAKE-5PILE ?auto_166810 ?auto_166811 ?auto_166812 ?auto_166813 ?auto_166814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166819 - BLOCK
      ?auto_166820 - BLOCK
      ?auto_166821 - BLOCK
      ?auto_166822 - BLOCK
      ?auto_166823 - BLOCK
    )
    :vars
    (
      ?auto_166824 - BLOCK
      ?auto_166826 - BLOCK
      ?auto_166827 - BLOCK
      ?auto_166825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166824 ?auto_166823 ) ( ON-TABLE ?auto_166819 ) ( ON ?auto_166820 ?auto_166819 ) ( ON ?auto_166821 ?auto_166820 ) ( ON ?auto_166822 ?auto_166821 ) ( ON ?auto_166823 ?auto_166822 ) ( not ( = ?auto_166819 ?auto_166820 ) ) ( not ( = ?auto_166819 ?auto_166821 ) ) ( not ( = ?auto_166819 ?auto_166822 ) ) ( not ( = ?auto_166819 ?auto_166823 ) ) ( not ( = ?auto_166819 ?auto_166824 ) ) ( not ( = ?auto_166820 ?auto_166821 ) ) ( not ( = ?auto_166820 ?auto_166822 ) ) ( not ( = ?auto_166820 ?auto_166823 ) ) ( not ( = ?auto_166820 ?auto_166824 ) ) ( not ( = ?auto_166821 ?auto_166822 ) ) ( not ( = ?auto_166821 ?auto_166823 ) ) ( not ( = ?auto_166821 ?auto_166824 ) ) ( not ( = ?auto_166822 ?auto_166823 ) ) ( not ( = ?auto_166822 ?auto_166824 ) ) ( not ( = ?auto_166823 ?auto_166824 ) ) ( not ( = ?auto_166819 ?auto_166826 ) ) ( not ( = ?auto_166819 ?auto_166827 ) ) ( not ( = ?auto_166820 ?auto_166826 ) ) ( not ( = ?auto_166820 ?auto_166827 ) ) ( not ( = ?auto_166821 ?auto_166826 ) ) ( not ( = ?auto_166821 ?auto_166827 ) ) ( not ( = ?auto_166822 ?auto_166826 ) ) ( not ( = ?auto_166822 ?auto_166827 ) ) ( not ( = ?auto_166823 ?auto_166826 ) ) ( not ( = ?auto_166823 ?auto_166827 ) ) ( not ( = ?auto_166824 ?auto_166826 ) ) ( not ( = ?auto_166824 ?auto_166827 ) ) ( not ( = ?auto_166826 ?auto_166827 ) ) ( ON ?auto_166826 ?auto_166824 ) ( CLEAR ?auto_166825 ) ( ON-TABLE ?auto_166825 ) ( not ( = ?auto_166825 ?auto_166827 ) ) ( not ( = ?auto_166819 ?auto_166825 ) ) ( not ( = ?auto_166820 ?auto_166825 ) ) ( not ( = ?auto_166821 ?auto_166825 ) ) ( not ( = ?auto_166822 ?auto_166825 ) ) ( not ( = ?auto_166823 ?auto_166825 ) ) ( not ( = ?auto_166824 ?auto_166825 ) ) ( not ( = ?auto_166826 ?auto_166825 ) ) ( ON ?auto_166827 ?auto_166826 ) ( CLEAR ?auto_166827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166819 ?auto_166820 ?auto_166821 ?auto_166822 ?auto_166823 ?auto_166824 ?auto_166826 )
      ( MAKE-5PILE ?auto_166819 ?auto_166820 ?auto_166821 ?auto_166822 ?auto_166823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166828 - BLOCK
      ?auto_166829 - BLOCK
      ?auto_166830 - BLOCK
      ?auto_166831 - BLOCK
      ?auto_166832 - BLOCK
    )
    :vars
    (
      ?auto_166835 - BLOCK
      ?auto_166834 - BLOCK
      ?auto_166833 - BLOCK
      ?auto_166836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166835 ?auto_166832 ) ( ON-TABLE ?auto_166828 ) ( ON ?auto_166829 ?auto_166828 ) ( ON ?auto_166830 ?auto_166829 ) ( ON ?auto_166831 ?auto_166830 ) ( ON ?auto_166832 ?auto_166831 ) ( not ( = ?auto_166828 ?auto_166829 ) ) ( not ( = ?auto_166828 ?auto_166830 ) ) ( not ( = ?auto_166828 ?auto_166831 ) ) ( not ( = ?auto_166828 ?auto_166832 ) ) ( not ( = ?auto_166828 ?auto_166835 ) ) ( not ( = ?auto_166829 ?auto_166830 ) ) ( not ( = ?auto_166829 ?auto_166831 ) ) ( not ( = ?auto_166829 ?auto_166832 ) ) ( not ( = ?auto_166829 ?auto_166835 ) ) ( not ( = ?auto_166830 ?auto_166831 ) ) ( not ( = ?auto_166830 ?auto_166832 ) ) ( not ( = ?auto_166830 ?auto_166835 ) ) ( not ( = ?auto_166831 ?auto_166832 ) ) ( not ( = ?auto_166831 ?auto_166835 ) ) ( not ( = ?auto_166832 ?auto_166835 ) ) ( not ( = ?auto_166828 ?auto_166834 ) ) ( not ( = ?auto_166828 ?auto_166833 ) ) ( not ( = ?auto_166829 ?auto_166834 ) ) ( not ( = ?auto_166829 ?auto_166833 ) ) ( not ( = ?auto_166830 ?auto_166834 ) ) ( not ( = ?auto_166830 ?auto_166833 ) ) ( not ( = ?auto_166831 ?auto_166834 ) ) ( not ( = ?auto_166831 ?auto_166833 ) ) ( not ( = ?auto_166832 ?auto_166834 ) ) ( not ( = ?auto_166832 ?auto_166833 ) ) ( not ( = ?auto_166835 ?auto_166834 ) ) ( not ( = ?auto_166835 ?auto_166833 ) ) ( not ( = ?auto_166834 ?auto_166833 ) ) ( ON ?auto_166834 ?auto_166835 ) ( not ( = ?auto_166836 ?auto_166833 ) ) ( not ( = ?auto_166828 ?auto_166836 ) ) ( not ( = ?auto_166829 ?auto_166836 ) ) ( not ( = ?auto_166830 ?auto_166836 ) ) ( not ( = ?auto_166831 ?auto_166836 ) ) ( not ( = ?auto_166832 ?auto_166836 ) ) ( not ( = ?auto_166835 ?auto_166836 ) ) ( not ( = ?auto_166834 ?auto_166836 ) ) ( ON ?auto_166833 ?auto_166834 ) ( CLEAR ?auto_166833 ) ( HOLDING ?auto_166836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166836 )
      ( MAKE-5PILE ?auto_166828 ?auto_166829 ?auto_166830 ?auto_166831 ?auto_166832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166837 - BLOCK
      ?auto_166838 - BLOCK
      ?auto_166839 - BLOCK
      ?auto_166840 - BLOCK
      ?auto_166841 - BLOCK
    )
    :vars
    (
      ?auto_166843 - BLOCK
      ?auto_166845 - BLOCK
      ?auto_166844 - BLOCK
      ?auto_166842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166843 ?auto_166841 ) ( ON-TABLE ?auto_166837 ) ( ON ?auto_166838 ?auto_166837 ) ( ON ?auto_166839 ?auto_166838 ) ( ON ?auto_166840 ?auto_166839 ) ( ON ?auto_166841 ?auto_166840 ) ( not ( = ?auto_166837 ?auto_166838 ) ) ( not ( = ?auto_166837 ?auto_166839 ) ) ( not ( = ?auto_166837 ?auto_166840 ) ) ( not ( = ?auto_166837 ?auto_166841 ) ) ( not ( = ?auto_166837 ?auto_166843 ) ) ( not ( = ?auto_166838 ?auto_166839 ) ) ( not ( = ?auto_166838 ?auto_166840 ) ) ( not ( = ?auto_166838 ?auto_166841 ) ) ( not ( = ?auto_166838 ?auto_166843 ) ) ( not ( = ?auto_166839 ?auto_166840 ) ) ( not ( = ?auto_166839 ?auto_166841 ) ) ( not ( = ?auto_166839 ?auto_166843 ) ) ( not ( = ?auto_166840 ?auto_166841 ) ) ( not ( = ?auto_166840 ?auto_166843 ) ) ( not ( = ?auto_166841 ?auto_166843 ) ) ( not ( = ?auto_166837 ?auto_166845 ) ) ( not ( = ?auto_166837 ?auto_166844 ) ) ( not ( = ?auto_166838 ?auto_166845 ) ) ( not ( = ?auto_166838 ?auto_166844 ) ) ( not ( = ?auto_166839 ?auto_166845 ) ) ( not ( = ?auto_166839 ?auto_166844 ) ) ( not ( = ?auto_166840 ?auto_166845 ) ) ( not ( = ?auto_166840 ?auto_166844 ) ) ( not ( = ?auto_166841 ?auto_166845 ) ) ( not ( = ?auto_166841 ?auto_166844 ) ) ( not ( = ?auto_166843 ?auto_166845 ) ) ( not ( = ?auto_166843 ?auto_166844 ) ) ( not ( = ?auto_166845 ?auto_166844 ) ) ( ON ?auto_166845 ?auto_166843 ) ( not ( = ?auto_166842 ?auto_166844 ) ) ( not ( = ?auto_166837 ?auto_166842 ) ) ( not ( = ?auto_166838 ?auto_166842 ) ) ( not ( = ?auto_166839 ?auto_166842 ) ) ( not ( = ?auto_166840 ?auto_166842 ) ) ( not ( = ?auto_166841 ?auto_166842 ) ) ( not ( = ?auto_166843 ?auto_166842 ) ) ( not ( = ?auto_166845 ?auto_166842 ) ) ( ON ?auto_166844 ?auto_166845 ) ( ON ?auto_166842 ?auto_166844 ) ( CLEAR ?auto_166842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166837 ?auto_166838 ?auto_166839 ?auto_166840 ?auto_166841 ?auto_166843 ?auto_166845 ?auto_166844 )
      ( MAKE-5PILE ?auto_166837 ?auto_166838 ?auto_166839 ?auto_166840 ?auto_166841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166850 - BLOCK
      ?auto_166851 - BLOCK
      ?auto_166852 - BLOCK
      ?auto_166853 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166853 ) ( CLEAR ?auto_166852 ) ( ON-TABLE ?auto_166850 ) ( ON ?auto_166851 ?auto_166850 ) ( ON ?auto_166852 ?auto_166851 ) ( not ( = ?auto_166850 ?auto_166851 ) ) ( not ( = ?auto_166850 ?auto_166852 ) ) ( not ( = ?auto_166850 ?auto_166853 ) ) ( not ( = ?auto_166851 ?auto_166852 ) ) ( not ( = ?auto_166851 ?auto_166853 ) ) ( not ( = ?auto_166852 ?auto_166853 ) ) )
    :subtasks
    ( ( !STACK ?auto_166853 ?auto_166852 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166854 - BLOCK
      ?auto_166855 - BLOCK
      ?auto_166856 - BLOCK
      ?auto_166857 - BLOCK
    )
    :vars
    (
      ?auto_166858 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166856 ) ( ON-TABLE ?auto_166854 ) ( ON ?auto_166855 ?auto_166854 ) ( ON ?auto_166856 ?auto_166855 ) ( not ( = ?auto_166854 ?auto_166855 ) ) ( not ( = ?auto_166854 ?auto_166856 ) ) ( not ( = ?auto_166854 ?auto_166857 ) ) ( not ( = ?auto_166855 ?auto_166856 ) ) ( not ( = ?auto_166855 ?auto_166857 ) ) ( not ( = ?auto_166856 ?auto_166857 ) ) ( ON ?auto_166857 ?auto_166858 ) ( CLEAR ?auto_166857 ) ( HAND-EMPTY ) ( not ( = ?auto_166854 ?auto_166858 ) ) ( not ( = ?auto_166855 ?auto_166858 ) ) ( not ( = ?auto_166856 ?auto_166858 ) ) ( not ( = ?auto_166857 ?auto_166858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166857 ?auto_166858 )
      ( MAKE-4PILE ?auto_166854 ?auto_166855 ?auto_166856 ?auto_166857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166859 - BLOCK
      ?auto_166860 - BLOCK
      ?auto_166861 - BLOCK
      ?auto_166862 - BLOCK
    )
    :vars
    (
      ?auto_166863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166859 ) ( ON ?auto_166860 ?auto_166859 ) ( not ( = ?auto_166859 ?auto_166860 ) ) ( not ( = ?auto_166859 ?auto_166861 ) ) ( not ( = ?auto_166859 ?auto_166862 ) ) ( not ( = ?auto_166860 ?auto_166861 ) ) ( not ( = ?auto_166860 ?auto_166862 ) ) ( not ( = ?auto_166861 ?auto_166862 ) ) ( ON ?auto_166862 ?auto_166863 ) ( CLEAR ?auto_166862 ) ( not ( = ?auto_166859 ?auto_166863 ) ) ( not ( = ?auto_166860 ?auto_166863 ) ) ( not ( = ?auto_166861 ?auto_166863 ) ) ( not ( = ?auto_166862 ?auto_166863 ) ) ( HOLDING ?auto_166861 ) ( CLEAR ?auto_166860 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166859 ?auto_166860 ?auto_166861 )
      ( MAKE-4PILE ?auto_166859 ?auto_166860 ?auto_166861 ?auto_166862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166864 - BLOCK
      ?auto_166865 - BLOCK
      ?auto_166866 - BLOCK
      ?auto_166867 - BLOCK
    )
    :vars
    (
      ?auto_166868 - BLOCK
      ?auto_166872 - BLOCK
      ?auto_166869 - BLOCK
      ?auto_166871 - BLOCK
      ?auto_166870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166864 ) ( ON ?auto_166865 ?auto_166864 ) ( not ( = ?auto_166864 ?auto_166865 ) ) ( not ( = ?auto_166864 ?auto_166866 ) ) ( not ( = ?auto_166864 ?auto_166867 ) ) ( not ( = ?auto_166865 ?auto_166866 ) ) ( not ( = ?auto_166865 ?auto_166867 ) ) ( not ( = ?auto_166866 ?auto_166867 ) ) ( ON ?auto_166867 ?auto_166868 ) ( not ( = ?auto_166864 ?auto_166868 ) ) ( not ( = ?auto_166865 ?auto_166868 ) ) ( not ( = ?auto_166866 ?auto_166868 ) ) ( not ( = ?auto_166867 ?auto_166868 ) ) ( CLEAR ?auto_166865 ) ( ON ?auto_166866 ?auto_166867 ) ( CLEAR ?auto_166866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166872 ) ( ON ?auto_166869 ?auto_166872 ) ( ON ?auto_166871 ?auto_166869 ) ( ON ?auto_166870 ?auto_166871 ) ( ON ?auto_166868 ?auto_166870 ) ( not ( = ?auto_166872 ?auto_166869 ) ) ( not ( = ?auto_166872 ?auto_166871 ) ) ( not ( = ?auto_166872 ?auto_166870 ) ) ( not ( = ?auto_166872 ?auto_166868 ) ) ( not ( = ?auto_166872 ?auto_166867 ) ) ( not ( = ?auto_166872 ?auto_166866 ) ) ( not ( = ?auto_166869 ?auto_166871 ) ) ( not ( = ?auto_166869 ?auto_166870 ) ) ( not ( = ?auto_166869 ?auto_166868 ) ) ( not ( = ?auto_166869 ?auto_166867 ) ) ( not ( = ?auto_166869 ?auto_166866 ) ) ( not ( = ?auto_166871 ?auto_166870 ) ) ( not ( = ?auto_166871 ?auto_166868 ) ) ( not ( = ?auto_166871 ?auto_166867 ) ) ( not ( = ?auto_166871 ?auto_166866 ) ) ( not ( = ?auto_166870 ?auto_166868 ) ) ( not ( = ?auto_166870 ?auto_166867 ) ) ( not ( = ?auto_166870 ?auto_166866 ) ) ( not ( = ?auto_166864 ?auto_166872 ) ) ( not ( = ?auto_166864 ?auto_166869 ) ) ( not ( = ?auto_166864 ?auto_166871 ) ) ( not ( = ?auto_166864 ?auto_166870 ) ) ( not ( = ?auto_166865 ?auto_166872 ) ) ( not ( = ?auto_166865 ?auto_166869 ) ) ( not ( = ?auto_166865 ?auto_166871 ) ) ( not ( = ?auto_166865 ?auto_166870 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166872 ?auto_166869 ?auto_166871 ?auto_166870 ?auto_166868 ?auto_166867 )
      ( MAKE-4PILE ?auto_166864 ?auto_166865 ?auto_166866 ?auto_166867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166873 - BLOCK
      ?auto_166874 - BLOCK
      ?auto_166875 - BLOCK
      ?auto_166876 - BLOCK
    )
    :vars
    (
      ?auto_166881 - BLOCK
      ?auto_166879 - BLOCK
      ?auto_166880 - BLOCK
      ?auto_166878 - BLOCK
      ?auto_166877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166873 ) ( not ( = ?auto_166873 ?auto_166874 ) ) ( not ( = ?auto_166873 ?auto_166875 ) ) ( not ( = ?auto_166873 ?auto_166876 ) ) ( not ( = ?auto_166874 ?auto_166875 ) ) ( not ( = ?auto_166874 ?auto_166876 ) ) ( not ( = ?auto_166875 ?auto_166876 ) ) ( ON ?auto_166876 ?auto_166881 ) ( not ( = ?auto_166873 ?auto_166881 ) ) ( not ( = ?auto_166874 ?auto_166881 ) ) ( not ( = ?auto_166875 ?auto_166881 ) ) ( not ( = ?auto_166876 ?auto_166881 ) ) ( ON ?auto_166875 ?auto_166876 ) ( CLEAR ?auto_166875 ) ( ON-TABLE ?auto_166879 ) ( ON ?auto_166880 ?auto_166879 ) ( ON ?auto_166878 ?auto_166880 ) ( ON ?auto_166877 ?auto_166878 ) ( ON ?auto_166881 ?auto_166877 ) ( not ( = ?auto_166879 ?auto_166880 ) ) ( not ( = ?auto_166879 ?auto_166878 ) ) ( not ( = ?auto_166879 ?auto_166877 ) ) ( not ( = ?auto_166879 ?auto_166881 ) ) ( not ( = ?auto_166879 ?auto_166876 ) ) ( not ( = ?auto_166879 ?auto_166875 ) ) ( not ( = ?auto_166880 ?auto_166878 ) ) ( not ( = ?auto_166880 ?auto_166877 ) ) ( not ( = ?auto_166880 ?auto_166881 ) ) ( not ( = ?auto_166880 ?auto_166876 ) ) ( not ( = ?auto_166880 ?auto_166875 ) ) ( not ( = ?auto_166878 ?auto_166877 ) ) ( not ( = ?auto_166878 ?auto_166881 ) ) ( not ( = ?auto_166878 ?auto_166876 ) ) ( not ( = ?auto_166878 ?auto_166875 ) ) ( not ( = ?auto_166877 ?auto_166881 ) ) ( not ( = ?auto_166877 ?auto_166876 ) ) ( not ( = ?auto_166877 ?auto_166875 ) ) ( not ( = ?auto_166873 ?auto_166879 ) ) ( not ( = ?auto_166873 ?auto_166880 ) ) ( not ( = ?auto_166873 ?auto_166878 ) ) ( not ( = ?auto_166873 ?auto_166877 ) ) ( not ( = ?auto_166874 ?auto_166879 ) ) ( not ( = ?auto_166874 ?auto_166880 ) ) ( not ( = ?auto_166874 ?auto_166878 ) ) ( not ( = ?auto_166874 ?auto_166877 ) ) ( HOLDING ?auto_166874 ) ( CLEAR ?auto_166873 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166873 ?auto_166874 )
      ( MAKE-4PILE ?auto_166873 ?auto_166874 ?auto_166875 ?auto_166876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166882 - BLOCK
      ?auto_166883 - BLOCK
      ?auto_166884 - BLOCK
      ?auto_166885 - BLOCK
    )
    :vars
    (
      ?auto_166890 - BLOCK
      ?auto_166889 - BLOCK
      ?auto_166888 - BLOCK
      ?auto_166887 - BLOCK
      ?auto_166886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_166882 ) ( not ( = ?auto_166882 ?auto_166883 ) ) ( not ( = ?auto_166882 ?auto_166884 ) ) ( not ( = ?auto_166882 ?auto_166885 ) ) ( not ( = ?auto_166883 ?auto_166884 ) ) ( not ( = ?auto_166883 ?auto_166885 ) ) ( not ( = ?auto_166884 ?auto_166885 ) ) ( ON ?auto_166885 ?auto_166890 ) ( not ( = ?auto_166882 ?auto_166890 ) ) ( not ( = ?auto_166883 ?auto_166890 ) ) ( not ( = ?auto_166884 ?auto_166890 ) ) ( not ( = ?auto_166885 ?auto_166890 ) ) ( ON ?auto_166884 ?auto_166885 ) ( ON-TABLE ?auto_166889 ) ( ON ?auto_166888 ?auto_166889 ) ( ON ?auto_166887 ?auto_166888 ) ( ON ?auto_166886 ?auto_166887 ) ( ON ?auto_166890 ?auto_166886 ) ( not ( = ?auto_166889 ?auto_166888 ) ) ( not ( = ?auto_166889 ?auto_166887 ) ) ( not ( = ?auto_166889 ?auto_166886 ) ) ( not ( = ?auto_166889 ?auto_166890 ) ) ( not ( = ?auto_166889 ?auto_166885 ) ) ( not ( = ?auto_166889 ?auto_166884 ) ) ( not ( = ?auto_166888 ?auto_166887 ) ) ( not ( = ?auto_166888 ?auto_166886 ) ) ( not ( = ?auto_166888 ?auto_166890 ) ) ( not ( = ?auto_166888 ?auto_166885 ) ) ( not ( = ?auto_166888 ?auto_166884 ) ) ( not ( = ?auto_166887 ?auto_166886 ) ) ( not ( = ?auto_166887 ?auto_166890 ) ) ( not ( = ?auto_166887 ?auto_166885 ) ) ( not ( = ?auto_166887 ?auto_166884 ) ) ( not ( = ?auto_166886 ?auto_166890 ) ) ( not ( = ?auto_166886 ?auto_166885 ) ) ( not ( = ?auto_166886 ?auto_166884 ) ) ( not ( = ?auto_166882 ?auto_166889 ) ) ( not ( = ?auto_166882 ?auto_166888 ) ) ( not ( = ?auto_166882 ?auto_166887 ) ) ( not ( = ?auto_166882 ?auto_166886 ) ) ( not ( = ?auto_166883 ?auto_166889 ) ) ( not ( = ?auto_166883 ?auto_166888 ) ) ( not ( = ?auto_166883 ?auto_166887 ) ) ( not ( = ?auto_166883 ?auto_166886 ) ) ( CLEAR ?auto_166882 ) ( ON ?auto_166883 ?auto_166884 ) ( CLEAR ?auto_166883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166889 ?auto_166888 ?auto_166887 ?auto_166886 ?auto_166890 ?auto_166885 ?auto_166884 )
      ( MAKE-4PILE ?auto_166882 ?auto_166883 ?auto_166884 ?auto_166885 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166891 - BLOCK
      ?auto_166892 - BLOCK
      ?auto_166893 - BLOCK
      ?auto_166894 - BLOCK
    )
    :vars
    (
      ?auto_166897 - BLOCK
      ?auto_166899 - BLOCK
      ?auto_166898 - BLOCK
      ?auto_166896 - BLOCK
      ?auto_166895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166891 ?auto_166892 ) ) ( not ( = ?auto_166891 ?auto_166893 ) ) ( not ( = ?auto_166891 ?auto_166894 ) ) ( not ( = ?auto_166892 ?auto_166893 ) ) ( not ( = ?auto_166892 ?auto_166894 ) ) ( not ( = ?auto_166893 ?auto_166894 ) ) ( ON ?auto_166894 ?auto_166897 ) ( not ( = ?auto_166891 ?auto_166897 ) ) ( not ( = ?auto_166892 ?auto_166897 ) ) ( not ( = ?auto_166893 ?auto_166897 ) ) ( not ( = ?auto_166894 ?auto_166897 ) ) ( ON ?auto_166893 ?auto_166894 ) ( ON-TABLE ?auto_166899 ) ( ON ?auto_166898 ?auto_166899 ) ( ON ?auto_166896 ?auto_166898 ) ( ON ?auto_166895 ?auto_166896 ) ( ON ?auto_166897 ?auto_166895 ) ( not ( = ?auto_166899 ?auto_166898 ) ) ( not ( = ?auto_166899 ?auto_166896 ) ) ( not ( = ?auto_166899 ?auto_166895 ) ) ( not ( = ?auto_166899 ?auto_166897 ) ) ( not ( = ?auto_166899 ?auto_166894 ) ) ( not ( = ?auto_166899 ?auto_166893 ) ) ( not ( = ?auto_166898 ?auto_166896 ) ) ( not ( = ?auto_166898 ?auto_166895 ) ) ( not ( = ?auto_166898 ?auto_166897 ) ) ( not ( = ?auto_166898 ?auto_166894 ) ) ( not ( = ?auto_166898 ?auto_166893 ) ) ( not ( = ?auto_166896 ?auto_166895 ) ) ( not ( = ?auto_166896 ?auto_166897 ) ) ( not ( = ?auto_166896 ?auto_166894 ) ) ( not ( = ?auto_166896 ?auto_166893 ) ) ( not ( = ?auto_166895 ?auto_166897 ) ) ( not ( = ?auto_166895 ?auto_166894 ) ) ( not ( = ?auto_166895 ?auto_166893 ) ) ( not ( = ?auto_166891 ?auto_166899 ) ) ( not ( = ?auto_166891 ?auto_166898 ) ) ( not ( = ?auto_166891 ?auto_166896 ) ) ( not ( = ?auto_166891 ?auto_166895 ) ) ( not ( = ?auto_166892 ?auto_166899 ) ) ( not ( = ?auto_166892 ?auto_166898 ) ) ( not ( = ?auto_166892 ?auto_166896 ) ) ( not ( = ?auto_166892 ?auto_166895 ) ) ( ON ?auto_166892 ?auto_166893 ) ( CLEAR ?auto_166892 ) ( HOLDING ?auto_166891 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166891 )
      ( MAKE-4PILE ?auto_166891 ?auto_166892 ?auto_166893 ?auto_166894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166900 - BLOCK
      ?auto_166901 - BLOCK
      ?auto_166902 - BLOCK
      ?auto_166903 - BLOCK
    )
    :vars
    (
      ?auto_166906 - BLOCK
      ?auto_166907 - BLOCK
      ?auto_166905 - BLOCK
      ?auto_166908 - BLOCK
      ?auto_166904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_166900 ?auto_166901 ) ) ( not ( = ?auto_166900 ?auto_166902 ) ) ( not ( = ?auto_166900 ?auto_166903 ) ) ( not ( = ?auto_166901 ?auto_166902 ) ) ( not ( = ?auto_166901 ?auto_166903 ) ) ( not ( = ?auto_166902 ?auto_166903 ) ) ( ON ?auto_166903 ?auto_166906 ) ( not ( = ?auto_166900 ?auto_166906 ) ) ( not ( = ?auto_166901 ?auto_166906 ) ) ( not ( = ?auto_166902 ?auto_166906 ) ) ( not ( = ?auto_166903 ?auto_166906 ) ) ( ON ?auto_166902 ?auto_166903 ) ( ON-TABLE ?auto_166907 ) ( ON ?auto_166905 ?auto_166907 ) ( ON ?auto_166908 ?auto_166905 ) ( ON ?auto_166904 ?auto_166908 ) ( ON ?auto_166906 ?auto_166904 ) ( not ( = ?auto_166907 ?auto_166905 ) ) ( not ( = ?auto_166907 ?auto_166908 ) ) ( not ( = ?auto_166907 ?auto_166904 ) ) ( not ( = ?auto_166907 ?auto_166906 ) ) ( not ( = ?auto_166907 ?auto_166903 ) ) ( not ( = ?auto_166907 ?auto_166902 ) ) ( not ( = ?auto_166905 ?auto_166908 ) ) ( not ( = ?auto_166905 ?auto_166904 ) ) ( not ( = ?auto_166905 ?auto_166906 ) ) ( not ( = ?auto_166905 ?auto_166903 ) ) ( not ( = ?auto_166905 ?auto_166902 ) ) ( not ( = ?auto_166908 ?auto_166904 ) ) ( not ( = ?auto_166908 ?auto_166906 ) ) ( not ( = ?auto_166908 ?auto_166903 ) ) ( not ( = ?auto_166908 ?auto_166902 ) ) ( not ( = ?auto_166904 ?auto_166906 ) ) ( not ( = ?auto_166904 ?auto_166903 ) ) ( not ( = ?auto_166904 ?auto_166902 ) ) ( not ( = ?auto_166900 ?auto_166907 ) ) ( not ( = ?auto_166900 ?auto_166905 ) ) ( not ( = ?auto_166900 ?auto_166908 ) ) ( not ( = ?auto_166900 ?auto_166904 ) ) ( not ( = ?auto_166901 ?auto_166907 ) ) ( not ( = ?auto_166901 ?auto_166905 ) ) ( not ( = ?auto_166901 ?auto_166908 ) ) ( not ( = ?auto_166901 ?auto_166904 ) ) ( ON ?auto_166901 ?auto_166902 ) ( ON ?auto_166900 ?auto_166901 ) ( CLEAR ?auto_166900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166907 ?auto_166905 ?auto_166908 ?auto_166904 ?auto_166906 ?auto_166903 ?auto_166902 ?auto_166901 )
      ( MAKE-4PILE ?auto_166900 ?auto_166901 ?auto_166902 ?auto_166903 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166913 - BLOCK
      ?auto_166914 - BLOCK
      ?auto_166915 - BLOCK
      ?auto_166916 - BLOCK
    )
    :vars
    (
      ?auto_166917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166917 ?auto_166916 ) ( CLEAR ?auto_166917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166913 ) ( ON ?auto_166914 ?auto_166913 ) ( ON ?auto_166915 ?auto_166914 ) ( ON ?auto_166916 ?auto_166915 ) ( not ( = ?auto_166913 ?auto_166914 ) ) ( not ( = ?auto_166913 ?auto_166915 ) ) ( not ( = ?auto_166913 ?auto_166916 ) ) ( not ( = ?auto_166913 ?auto_166917 ) ) ( not ( = ?auto_166914 ?auto_166915 ) ) ( not ( = ?auto_166914 ?auto_166916 ) ) ( not ( = ?auto_166914 ?auto_166917 ) ) ( not ( = ?auto_166915 ?auto_166916 ) ) ( not ( = ?auto_166915 ?auto_166917 ) ) ( not ( = ?auto_166916 ?auto_166917 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166917 ?auto_166916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166918 - BLOCK
      ?auto_166919 - BLOCK
      ?auto_166920 - BLOCK
      ?auto_166921 - BLOCK
    )
    :vars
    (
      ?auto_166922 - BLOCK
      ?auto_166923 - BLOCK
      ?auto_166924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166922 ?auto_166921 ) ( CLEAR ?auto_166922 ) ( ON-TABLE ?auto_166918 ) ( ON ?auto_166919 ?auto_166918 ) ( ON ?auto_166920 ?auto_166919 ) ( ON ?auto_166921 ?auto_166920 ) ( not ( = ?auto_166918 ?auto_166919 ) ) ( not ( = ?auto_166918 ?auto_166920 ) ) ( not ( = ?auto_166918 ?auto_166921 ) ) ( not ( = ?auto_166918 ?auto_166922 ) ) ( not ( = ?auto_166919 ?auto_166920 ) ) ( not ( = ?auto_166919 ?auto_166921 ) ) ( not ( = ?auto_166919 ?auto_166922 ) ) ( not ( = ?auto_166920 ?auto_166921 ) ) ( not ( = ?auto_166920 ?auto_166922 ) ) ( not ( = ?auto_166921 ?auto_166922 ) ) ( HOLDING ?auto_166923 ) ( CLEAR ?auto_166924 ) ( not ( = ?auto_166918 ?auto_166923 ) ) ( not ( = ?auto_166918 ?auto_166924 ) ) ( not ( = ?auto_166919 ?auto_166923 ) ) ( not ( = ?auto_166919 ?auto_166924 ) ) ( not ( = ?auto_166920 ?auto_166923 ) ) ( not ( = ?auto_166920 ?auto_166924 ) ) ( not ( = ?auto_166921 ?auto_166923 ) ) ( not ( = ?auto_166921 ?auto_166924 ) ) ( not ( = ?auto_166922 ?auto_166923 ) ) ( not ( = ?auto_166922 ?auto_166924 ) ) ( not ( = ?auto_166923 ?auto_166924 ) ) )
    :subtasks
    ( ( !STACK ?auto_166923 ?auto_166924 )
      ( MAKE-4PILE ?auto_166918 ?auto_166919 ?auto_166920 ?auto_166921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166925 - BLOCK
      ?auto_166926 - BLOCK
      ?auto_166927 - BLOCK
      ?auto_166928 - BLOCK
    )
    :vars
    (
      ?auto_166930 - BLOCK
      ?auto_166931 - BLOCK
      ?auto_166929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166930 ?auto_166928 ) ( ON-TABLE ?auto_166925 ) ( ON ?auto_166926 ?auto_166925 ) ( ON ?auto_166927 ?auto_166926 ) ( ON ?auto_166928 ?auto_166927 ) ( not ( = ?auto_166925 ?auto_166926 ) ) ( not ( = ?auto_166925 ?auto_166927 ) ) ( not ( = ?auto_166925 ?auto_166928 ) ) ( not ( = ?auto_166925 ?auto_166930 ) ) ( not ( = ?auto_166926 ?auto_166927 ) ) ( not ( = ?auto_166926 ?auto_166928 ) ) ( not ( = ?auto_166926 ?auto_166930 ) ) ( not ( = ?auto_166927 ?auto_166928 ) ) ( not ( = ?auto_166927 ?auto_166930 ) ) ( not ( = ?auto_166928 ?auto_166930 ) ) ( CLEAR ?auto_166931 ) ( not ( = ?auto_166925 ?auto_166929 ) ) ( not ( = ?auto_166925 ?auto_166931 ) ) ( not ( = ?auto_166926 ?auto_166929 ) ) ( not ( = ?auto_166926 ?auto_166931 ) ) ( not ( = ?auto_166927 ?auto_166929 ) ) ( not ( = ?auto_166927 ?auto_166931 ) ) ( not ( = ?auto_166928 ?auto_166929 ) ) ( not ( = ?auto_166928 ?auto_166931 ) ) ( not ( = ?auto_166930 ?auto_166929 ) ) ( not ( = ?auto_166930 ?auto_166931 ) ) ( not ( = ?auto_166929 ?auto_166931 ) ) ( ON ?auto_166929 ?auto_166930 ) ( CLEAR ?auto_166929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166925 ?auto_166926 ?auto_166927 ?auto_166928 ?auto_166930 )
      ( MAKE-4PILE ?auto_166925 ?auto_166926 ?auto_166927 ?auto_166928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166932 - BLOCK
      ?auto_166933 - BLOCK
      ?auto_166934 - BLOCK
      ?auto_166935 - BLOCK
    )
    :vars
    (
      ?auto_166936 - BLOCK
      ?auto_166937 - BLOCK
      ?auto_166938 - BLOCK
      ?auto_166939 - BLOCK
      ?auto_166940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166936 ?auto_166935 ) ( ON-TABLE ?auto_166932 ) ( ON ?auto_166933 ?auto_166932 ) ( ON ?auto_166934 ?auto_166933 ) ( ON ?auto_166935 ?auto_166934 ) ( not ( = ?auto_166932 ?auto_166933 ) ) ( not ( = ?auto_166932 ?auto_166934 ) ) ( not ( = ?auto_166932 ?auto_166935 ) ) ( not ( = ?auto_166932 ?auto_166936 ) ) ( not ( = ?auto_166933 ?auto_166934 ) ) ( not ( = ?auto_166933 ?auto_166935 ) ) ( not ( = ?auto_166933 ?auto_166936 ) ) ( not ( = ?auto_166934 ?auto_166935 ) ) ( not ( = ?auto_166934 ?auto_166936 ) ) ( not ( = ?auto_166935 ?auto_166936 ) ) ( not ( = ?auto_166932 ?auto_166937 ) ) ( not ( = ?auto_166932 ?auto_166938 ) ) ( not ( = ?auto_166933 ?auto_166937 ) ) ( not ( = ?auto_166933 ?auto_166938 ) ) ( not ( = ?auto_166934 ?auto_166937 ) ) ( not ( = ?auto_166934 ?auto_166938 ) ) ( not ( = ?auto_166935 ?auto_166937 ) ) ( not ( = ?auto_166935 ?auto_166938 ) ) ( not ( = ?auto_166936 ?auto_166937 ) ) ( not ( = ?auto_166936 ?auto_166938 ) ) ( not ( = ?auto_166937 ?auto_166938 ) ) ( ON ?auto_166937 ?auto_166936 ) ( CLEAR ?auto_166937 ) ( HOLDING ?auto_166938 ) ( CLEAR ?auto_166939 ) ( ON-TABLE ?auto_166940 ) ( ON ?auto_166939 ?auto_166940 ) ( not ( = ?auto_166940 ?auto_166939 ) ) ( not ( = ?auto_166940 ?auto_166938 ) ) ( not ( = ?auto_166939 ?auto_166938 ) ) ( not ( = ?auto_166932 ?auto_166939 ) ) ( not ( = ?auto_166932 ?auto_166940 ) ) ( not ( = ?auto_166933 ?auto_166939 ) ) ( not ( = ?auto_166933 ?auto_166940 ) ) ( not ( = ?auto_166934 ?auto_166939 ) ) ( not ( = ?auto_166934 ?auto_166940 ) ) ( not ( = ?auto_166935 ?auto_166939 ) ) ( not ( = ?auto_166935 ?auto_166940 ) ) ( not ( = ?auto_166936 ?auto_166939 ) ) ( not ( = ?auto_166936 ?auto_166940 ) ) ( not ( = ?auto_166937 ?auto_166939 ) ) ( not ( = ?auto_166937 ?auto_166940 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166940 ?auto_166939 ?auto_166938 )
      ( MAKE-4PILE ?auto_166932 ?auto_166933 ?auto_166934 ?auto_166935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166941 - BLOCK
      ?auto_166942 - BLOCK
      ?auto_166943 - BLOCK
      ?auto_166944 - BLOCK
    )
    :vars
    (
      ?auto_166948 - BLOCK
      ?auto_166949 - BLOCK
      ?auto_166945 - BLOCK
      ?auto_166946 - BLOCK
      ?auto_166947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166948 ?auto_166944 ) ( ON-TABLE ?auto_166941 ) ( ON ?auto_166942 ?auto_166941 ) ( ON ?auto_166943 ?auto_166942 ) ( ON ?auto_166944 ?auto_166943 ) ( not ( = ?auto_166941 ?auto_166942 ) ) ( not ( = ?auto_166941 ?auto_166943 ) ) ( not ( = ?auto_166941 ?auto_166944 ) ) ( not ( = ?auto_166941 ?auto_166948 ) ) ( not ( = ?auto_166942 ?auto_166943 ) ) ( not ( = ?auto_166942 ?auto_166944 ) ) ( not ( = ?auto_166942 ?auto_166948 ) ) ( not ( = ?auto_166943 ?auto_166944 ) ) ( not ( = ?auto_166943 ?auto_166948 ) ) ( not ( = ?auto_166944 ?auto_166948 ) ) ( not ( = ?auto_166941 ?auto_166949 ) ) ( not ( = ?auto_166941 ?auto_166945 ) ) ( not ( = ?auto_166942 ?auto_166949 ) ) ( not ( = ?auto_166942 ?auto_166945 ) ) ( not ( = ?auto_166943 ?auto_166949 ) ) ( not ( = ?auto_166943 ?auto_166945 ) ) ( not ( = ?auto_166944 ?auto_166949 ) ) ( not ( = ?auto_166944 ?auto_166945 ) ) ( not ( = ?auto_166948 ?auto_166949 ) ) ( not ( = ?auto_166948 ?auto_166945 ) ) ( not ( = ?auto_166949 ?auto_166945 ) ) ( ON ?auto_166949 ?auto_166948 ) ( CLEAR ?auto_166946 ) ( ON-TABLE ?auto_166947 ) ( ON ?auto_166946 ?auto_166947 ) ( not ( = ?auto_166947 ?auto_166946 ) ) ( not ( = ?auto_166947 ?auto_166945 ) ) ( not ( = ?auto_166946 ?auto_166945 ) ) ( not ( = ?auto_166941 ?auto_166946 ) ) ( not ( = ?auto_166941 ?auto_166947 ) ) ( not ( = ?auto_166942 ?auto_166946 ) ) ( not ( = ?auto_166942 ?auto_166947 ) ) ( not ( = ?auto_166943 ?auto_166946 ) ) ( not ( = ?auto_166943 ?auto_166947 ) ) ( not ( = ?auto_166944 ?auto_166946 ) ) ( not ( = ?auto_166944 ?auto_166947 ) ) ( not ( = ?auto_166948 ?auto_166946 ) ) ( not ( = ?auto_166948 ?auto_166947 ) ) ( not ( = ?auto_166949 ?auto_166946 ) ) ( not ( = ?auto_166949 ?auto_166947 ) ) ( ON ?auto_166945 ?auto_166949 ) ( CLEAR ?auto_166945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_166941 ?auto_166942 ?auto_166943 ?auto_166944 ?auto_166948 ?auto_166949 )
      ( MAKE-4PILE ?auto_166941 ?auto_166942 ?auto_166943 ?auto_166944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166950 - BLOCK
      ?auto_166951 - BLOCK
      ?auto_166952 - BLOCK
      ?auto_166953 - BLOCK
    )
    :vars
    (
      ?auto_166954 - BLOCK
      ?auto_166957 - BLOCK
      ?auto_166955 - BLOCK
      ?auto_166958 - BLOCK
      ?auto_166956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166954 ?auto_166953 ) ( ON-TABLE ?auto_166950 ) ( ON ?auto_166951 ?auto_166950 ) ( ON ?auto_166952 ?auto_166951 ) ( ON ?auto_166953 ?auto_166952 ) ( not ( = ?auto_166950 ?auto_166951 ) ) ( not ( = ?auto_166950 ?auto_166952 ) ) ( not ( = ?auto_166950 ?auto_166953 ) ) ( not ( = ?auto_166950 ?auto_166954 ) ) ( not ( = ?auto_166951 ?auto_166952 ) ) ( not ( = ?auto_166951 ?auto_166953 ) ) ( not ( = ?auto_166951 ?auto_166954 ) ) ( not ( = ?auto_166952 ?auto_166953 ) ) ( not ( = ?auto_166952 ?auto_166954 ) ) ( not ( = ?auto_166953 ?auto_166954 ) ) ( not ( = ?auto_166950 ?auto_166957 ) ) ( not ( = ?auto_166950 ?auto_166955 ) ) ( not ( = ?auto_166951 ?auto_166957 ) ) ( not ( = ?auto_166951 ?auto_166955 ) ) ( not ( = ?auto_166952 ?auto_166957 ) ) ( not ( = ?auto_166952 ?auto_166955 ) ) ( not ( = ?auto_166953 ?auto_166957 ) ) ( not ( = ?auto_166953 ?auto_166955 ) ) ( not ( = ?auto_166954 ?auto_166957 ) ) ( not ( = ?auto_166954 ?auto_166955 ) ) ( not ( = ?auto_166957 ?auto_166955 ) ) ( ON ?auto_166957 ?auto_166954 ) ( ON-TABLE ?auto_166958 ) ( not ( = ?auto_166958 ?auto_166956 ) ) ( not ( = ?auto_166958 ?auto_166955 ) ) ( not ( = ?auto_166956 ?auto_166955 ) ) ( not ( = ?auto_166950 ?auto_166956 ) ) ( not ( = ?auto_166950 ?auto_166958 ) ) ( not ( = ?auto_166951 ?auto_166956 ) ) ( not ( = ?auto_166951 ?auto_166958 ) ) ( not ( = ?auto_166952 ?auto_166956 ) ) ( not ( = ?auto_166952 ?auto_166958 ) ) ( not ( = ?auto_166953 ?auto_166956 ) ) ( not ( = ?auto_166953 ?auto_166958 ) ) ( not ( = ?auto_166954 ?auto_166956 ) ) ( not ( = ?auto_166954 ?auto_166958 ) ) ( not ( = ?auto_166957 ?auto_166956 ) ) ( not ( = ?auto_166957 ?auto_166958 ) ) ( ON ?auto_166955 ?auto_166957 ) ( CLEAR ?auto_166955 ) ( HOLDING ?auto_166956 ) ( CLEAR ?auto_166958 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166958 ?auto_166956 )
      ( MAKE-4PILE ?auto_166950 ?auto_166951 ?auto_166952 ?auto_166953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166959 - BLOCK
      ?auto_166960 - BLOCK
      ?auto_166961 - BLOCK
      ?auto_166962 - BLOCK
    )
    :vars
    (
      ?auto_166964 - BLOCK
      ?auto_166966 - BLOCK
      ?auto_166965 - BLOCK
      ?auto_166963 - BLOCK
      ?auto_166967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166964 ?auto_166962 ) ( ON-TABLE ?auto_166959 ) ( ON ?auto_166960 ?auto_166959 ) ( ON ?auto_166961 ?auto_166960 ) ( ON ?auto_166962 ?auto_166961 ) ( not ( = ?auto_166959 ?auto_166960 ) ) ( not ( = ?auto_166959 ?auto_166961 ) ) ( not ( = ?auto_166959 ?auto_166962 ) ) ( not ( = ?auto_166959 ?auto_166964 ) ) ( not ( = ?auto_166960 ?auto_166961 ) ) ( not ( = ?auto_166960 ?auto_166962 ) ) ( not ( = ?auto_166960 ?auto_166964 ) ) ( not ( = ?auto_166961 ?auto_166962 ) ) ( not ( = ?auto_166961 ?auto_166964 ) ) ( not ( = ?auto_166962 ?auto_166964 ) ) ( not ( = ?auto_166959 ?auto_166966 ) ) ( not ( = ?auto_166959 ?auto_166965 ) ) ( not ( = ?auto_166960 ?auto_166966 ) ) ( not ( = ?auto_166960 ?auto_166965 ) ) ( not ( = ?auto_166961 ?auto_166966 ) ) ( not ( = ?auto_166961 ?auto_166965 ) ) ( not ( = ?auto_166962 ?auto_166966 ) ) ( not ( = ?auto_166962 ?auto_166965 ) ) ( not ( = ?auto_166964 ?auto_166966 ) ) ( not ( = ?auto_166964 ?auto_166965 ) ) ( not ( = ?auto_166966 ?auto_166965 ) ) ( ON ?auto_166966 ?auto_166964 ) ( ON-TABLE ?auto_166963 ) ( not ( = ?auto_166963 ?auto_166967 ) ) ( not ( = ?auto_166963 ?auto_166965 ) ) ( not ( = ?auto_166967 ?auto_166965 ) ) ( not ( = ?auto_166959 ?auto_166967 ) ) ( not ( = ?auto_166959 ?auto_166963 ) ) ( not ( = ?auto_166960 ?auto_166967 ) ) ( not ( = ?auto_166960 ?auto_166963 ) ) ( not ( = ?auto_166961 ?auto_166967 ) ) ( not ( = ?auto_166961 ?auto_166963 ) ) ( not ( = ?auto_166962 ?auto_166967 ) ) ( not ( = ?auto_166962 ?auto_166963 ) ) ( not ( = ?auto_166964 ?auto_166967 ) ) ( not ( = ?auto_166964 ?auto_166963 ) ) ( not ( = ?auto_166966 ?auto_166967 ) ) ( not ( = ?auto_166966 ?auto_166963 ) ) ( ON ?auto_166965 ?auto_166966 ) ( CLEAR ?auto_166963 ) ( ON ?auto_166967 ?auto_166965 ) ( CLEAR ?auto_166967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_166959 ?auto_166960 ?auto_166961 ?auto_166962 ?auto_166964 ?auto_166966 ?auto_166965 )
      ( MAKE-4PILE ?auto_166959 ?auto_166960 ?auto_166961 ?auto_166962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166968 - BLOCK
      ?auto_166969 - BLOCK
      ?auto_166970 - BLOCK
      ?auto_166971 - BLOCK
    )
    :vars
    (
      ?auto_166975 - BLOCK
      ?auto_166972 - BLOCK
      ?auto_166973 - BLOCK
      ?auto_166974 - BLOCK
      ?auto_166976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166975 ?auto_166971 ) ( ON-TABLE ?auto_166968 ) ( ON ?auto_166969 ?auto_166968 ) ( ON ?auto_166970 ?auto_166969 ) ( ON ?auto_166971 ?auto_166970 ) ( not ( = ?auto_166968 ?auto_166969 ) ) ( not ( = ?auto_166968 ?auto_166970 ) ) ( not ( = ?auto_166968 ?auto_166971 ) ) ( not ( = ?auto_166968 ?auto_166975 ) ) ( not ( = ?auto_166969 ?auto_166970 ) ) ( not ( = ?auto_166969 ?auto_166971 ) ) ( not ( = ?auto_166969 ?auto_166975 ) ) ( not ( = ?auto_166970 ?auto_166971 ) ) ( not ( = ?auto_166970 ?auto_166975 ) ) ( not ( = ?auto_166971 ?auto_166975 ) ) ( not ( = ?auto_166968 ?auto_166972 ) ) ( not ( = ?auto_166968 ?auto_166973 ) ) ( not ( = ?auto_166969 ?auto_166972 ) ) ( not ( = ?auto_166969 ?auto_166973 ) ) ( not ( = ?auto_166970 ?auto_166972 ) ) ( not ( = ?auto_166970 ?auto_166973 ) ) ( not ( = ?auto_166971 ?auto_166972 ) ) ( not ( = ?auto_166971 ?auto_166973 ) ) ( not ( = ?auto_166975 ?auto_166972 ) ) ( not ( = ?auto_166975 ?auto_166973 ) ) ( not ( = ?auto_166972 ?auto_166973 ) ) ( ON ?auto_166972 ?auto_166975 ) ( not ( = ?auto_166974 ?auto_166976 ) ) ( not ( = ?auto_166974 ?auto_166973 ) ) ( not ( = ?auto_166976 ?auto_166973 ) ) ( not ( = ?auto_166968 ?auto_166976 ) ) ( not ( = ?auto_166968 ?auto_166974 ) ) ( not ( = ?auto_166969 ?auto_166976 ) ) ( not ( = ?auto_166969 ?auto_166974 ) ) ( not ( = ?auto_166970 ?auto_166976 ) ) ( not ( = ?auto_166970 ?auto_166974 ) ) ( not ( = ?auto_166971 ?auto_166976 ) ) ( not ( = ?auto_166971 ?auto_166974 ) ) ( not ( = ?auto_166975 ?auto_166976 ) ) ( not ( = ?auto_166975 ?auto_166974 ) ) ( not ( = ?auto_166972 ?auto_166976 ) ) ( not ( = ?auto_166972 ?auto_166974 ) ) ( ON ?auto_166973 ?auto_166972 ) ( ON ?auto_166976 ?auto_166973 ) ( CLEAR ?auto_166976 ) ( HOLDING ?auto_166974 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166974 )
      ( MAKE-4PILE ?auto_166968 ?auto_166969 ?auto_166970 ?auto_166971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166977 - BLOCK
      ?auto_166978 - BLOCK
      ?auto_166979 - BLOCK
      ?auto_166980 - BLOCK
    )
    :vars
    (
      ?auto_166984 - BLOCK
      ?auto_166981 - BLOCK
      ?auto_166985 - BLOCK
      ?auto_166983 - BLOCK
      ?auto_166982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166984 ?auto_166980 ) ( ON-TABLE ?auto_166977 ) ( ON ?auto_166978 ?auto_166977 ) ( ON ?auto_166979 ?auto_166978 ) ( ON ?auto_166980 ?auto_166979 ) ( not ( = ?auto_166977 ?auto_166978 ) ) ( not ( = ?auto_166977 ?auto_166979 ) ) ( not ( = ?auto_166977 ?auto_166980 ) ) ( not ( = ?auto_166977 ?auto_166984 ) ) ( not ( = ?auto_166978 ?auto_166979 ) ) ( not ( = ?auto_166978 ?auto_166980 ) ) ( not ( = ?auto_166978 ?auto_166984 ) ) ( not ( = ?auto_166979 ?auto_166980 ) ) ( not ( = ?auto_166979 ?auto_166984 ) ) ( not ( = ?auto_166980 ?auto_166984 ) ) ( not ( = ?auto_166977 ?auto_166981 ) ) ( not ( = ?auto_166977 ?auto_166985 ) ) ( not ( = ?auto_166978 ?auto_166981 ) ) ( not ( = ?auto_166978 ?auto_166985 ) ) ( not ( = ?auto_166979 ?auto_166981 ) ) ( not ( = ?auto_166979 ?auto_166985 ) ) ( not ( = ?auto_166980 ?auto_166981 ) ) ( not ( = ?auto_166980 ?auto_166985 ) ) ( not ( = ?auto_166984 ?auto_166981 ) ) ( not ( = ?auto_166984 ?auto_166985 ) ) ( not ( = ?auto_166981 ?auto_166985 ) ) ( ON ?auto_166981 ?auto_166984 ) ( not ( = ?auto_166983 ?auto_166982 ) ) ( not ( = ?auto_166983 ?auto_166985 ) ) ( not ( = ?auto_166982 ?auto_166985 ) ) ( not ( = ?auto_166977 ?auto_166982 ) ) ( not ( = ?auto_166977 ?auto_166983 ) ) ( not ( = ?auto_166978 ?auto_166982 ) ) ( not ( = ?auto_166978 ?auto_166983 ) ) ( not ( = ?auto_166979 ?auto_166982 ) ) ( not ( = ?auto_166979 ?auto_166983 ) ) ( not ( = ?auto_166980 ?auto_166982 ) ) ( not ( = ?auto_166980 ?auto_166983 ) ) ( not ( = ?auto_166984 ?auto_166982 ) ) ( not ( = ?auto_166984 ?auto_166983 ) ) ( not ( = ?auto_166981 ?auto_166982 ) ) ( not ( = ?auto_166981 ?auto_166983 ) ) ( ON ?auto_166985 ?auto_166981 ) ( ON ?auto_166982 ?auto_166985 ) ( ON ?auto_166983 ?auto_166982 ) ( CLEAR ?auto_166983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_166977 ?auto_166978 ?auto_166979 ?auto_166980 ?auto_166984 ?auto_166981 ?auto_166985 ?auto_166982 )
      ( MAKE-4PILE ?auto_166977 ?auto_166978 ?auto_166979 ?auto_166980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166991 - BLOCK
      ?auto_166992 - BLOCK
      ?auto_166993 - BLOCK
      ?auto_166994 - BLOCK
      ?auto_166995 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_166995 ) ( CLEAR ?auto_166994 ) ( ON-TABLE ?auto_166991 ) ( ON ?auto_166992 ?auto_166991 ) ( ON ?auto_166993 ?auto_166992 ) ( ON ?auto_166994 ?auto_166993 ) ( not ( = ?auto_166991 ?auto_166992 ) ) ( not ( = ?auto_166991 ?auto_166993 ) ) ( not ( = ?auto_166991 ?auto_166994 ) ) ( not ( = ?auto_166991 ?auto_166995 ) ) ( not ( = ?auto_166992 ?auto_166993 ) ) ( not ( = ?auto_166992 ?auto_166994 ) ) ( not ( = ?auto_166992 ?auto_166995 ) ) ( not ( = ?auto_166993 ?auto_166994 ) ) ( not ( = ?auto_166993 ?auto_166995 ) ) ( not ( = ?auto_166994 ?auto_166995 ) ) )
    :subtasks
    ( ( !STACK ?auto_166995 ?auto_166994 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166996 - BLOCK
      ?auto_166997 - BLOCK
      ?auto_166998 - BLOCK
      ?auto_166999 - BLOCK
      ?auto_167000 - BLOCK
    )
    :vars
    (
      ?auto_167001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166999 ) ( ON-TABLE ?auto_166996 ) ( ON ?auto_166997 ?auto_166996 ) ( ON ?auto_166998 ?auto_166997 ) ( ON ?auto_166999 ?auto_166998 ) ( not ( = ?auto_166996 ?auto_166997 ) ) ( not ( = ?auto_166996 ?auto_166998 ) ) ( not ( = ?auto_166996 ?auto_166999 ) ) ( not ( = ?auto_166996 ?auto_167000 ) ) ( not ( = ?auto_166997 ?auto_166998 ) ) ( not ( = ?auto_166997 ?auto_166999 ) ) ( not ( = ?auto_166997 ?auto_167000 ) ) ( not ( = ?auto_166998 ?auto_166999 ) ) ( not ( = ?auto_166998 ?auto_167000 ) ) ( not ( = ?auto_166999 ?auto_167000 ) ) ( ON ?auto_167000 ?auto_167001 ) ( CLEAR ?auto_167000 ) ( HAND-EMPTY ) ( not ( = ?auto_166996 ?auto_167001 ) ) ( not ( = ?auto_166997 ?auto_167001 ) ) ( not ( = ?auto_166998 ?auto_167001 ) ) ( not ( = ?auto_166999 ?auto_167001 ) ) ( not ( = ?auto_167000 ?auto_167001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167000 ?auto_167001 )
      ( MAKE-5PILE ?auto_166996 ?auto_166997 ?auto_166998 ?auto_166999 ?auto_167000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167002 - BLOCK
      ?auto_167003 - BLOCK
      ?auto_167004 - BLOCK
      ?auto_167005 - BLOCK
      ?auto_167006 - BLOCK
    )
    :vars
    (
      ?auto_167007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167002 ) ( ON ?auto_167003 ?auto_167002 ) ( ON ?auto_167004 ?auto_167003 ) ( not ( = ?auto_167002 ?auto_167003 ) ) ( not ( = ?auto_167002 ?auto_167004 ) ) ( not ( = ?auto_167002 ?auto_167005 ) ) ( not ( = ?auto_167002 ?auto_167006 ) ) ( not ( = ?auto_167003 ?auto_167004 ) ) ( not ( = ?auto_167003 ?auto_167005 ) ) ( not ( = ?auto_167003 ?auto_167006 ) ) ( not ( = ?auto_167004 ?auto_167005 ) ) ( not ( = ?auto_167004 ?auto_167006 ) ) ( not ( = ?auto_167005 ?auto_167006 ) ) ( ON ?auto_167006 ?auto_167007 ) ( CLEAR ?auto_167006 ) ( not ( = ?auto_167002 ?auto_167007 ) ) ( not ( = ?auto_167003 ?auto_167007 ) ) ( not ( = ?auto_167004 ?auto_167007 ) ) ( not ( = ?auto_167005 ?auto_167007 ) ) ( not ( = ?auto_167006 ?auto_167007 ) ) ( HOLDING ?auto_167005 ) ( CLEAR ?auto_167004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167002 ?auto_167003 ?auto_167004 ?auto_167005 )
      ( MAKE-5PILE ?auto_167002 ?auto_167003 ?auto_167004 ?auto_167005 ?auto_167006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167008 - BLOCK
      ?auto_167009 - BLOCK
      ?auto_167010 - BLOCK
      ?auto_167011 - BLOCK
      ?auto_167012 - BLOCK
    )
    :vars
    (
      ?auto_167013 - BLOCK
      ?auto_167016 - BLOCK
      ?auto_167014 - BLOCK
      ?auto_167015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167008 ) ( ON ?auto_167009 ?auto_167008 ) ( ON ?auto_167010 ?auto_167009 ) ( not ( = ?auto_167008 ?auto_167009 ) ) ( not ( = ?auto_167008 ?auto_167010 ) ) ( not ( = ?auto_167008 ?auto_167011 ) ) ( not ( = ?auto_167008 ?auto_167012 ) ) ( not ( = ?auto_167009 ?auto_167010 ) ) ( not ( = ?auto_167009 ?auto_167011 ) ) ( not ( = ?auto_167009 ?auto_167012 ) ) ( not ( = ?auto_167010 ?auto_167011 ) ) ( not ( = ?auto_167010 ?auto_167012 ) ) ( not ( = ?auto_167011 ?auto_167012 ) ) ( ON ?auto_167012 ?auto_167013 ) ( not ( = ?auto_167008 ?auto_167013 ) ) ( not ( = ?auto_167009 ?auto_167013 ) ) ( not ( = ?auto_167010 ?auto_167013 ) ) ( not ( = ?auto_167011 ?auto_167013 ) ) ( not ( = ?auto_167012 ?auto_167013 ) ) ( CLEAR ?auto_167010 ) ( ON ?auto_167011 ?auto_167012 ) ( CLEAR ?auto_167011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167016 ) ( ON ?auto_167014 ?auto_167016 ) ( ON ?auto_167015 ?auto_167014 ) ( ON ?auto_167013 ?auto_167015 ) ( not ( = ?auto_167016 ?auto_167014 ) ) ( not ( = ?auto_167016 ?auto_167015 ) ) ( not ( = ?auto_167016 ?auto_167013 ) ) ( not ( = ?auto_167016 ?auto_167012 ) ) ( not ( = ?auto_167016 ?auto_167011 ) ) ( not ( = ?auto_167014 ?auto_167015 ) ) ( not ( = ?auto_167014 ?auto_167013 ) ) ( not ( = ?auto_167014 ?auto_167012 ) ) ( not ( = ?auto_167014 ?auto_167011 ) ) ( not ( = ?auto_167015 ?auto_167013 ) ) ( not ( = ?auto_167015 ?auto_167012 ) ) ( not ( = ?auto_167015 ?auto_167011 ) ) ( not ( = ?auto_167008 ?auto_167016 ) ) ( not ( = ?auto_167008 ?auto_167014 ) ) ( not ( = ?auto_167008 ?auto_167015 ) ) ( not ( = ?auto_167009 ?auto_167016 ) ) ( not ( = ?auto_167009 ?auto_167014 ) ) ( not ( = ?auto_167009 ?auto_167015 ) ) ( not ( = ?auto_167010 ?auto_167016 ) ) ( not ( = ?auto_167010 ?auto_167014 ) ) ( not ( = ?auto_167010 ?auto_167015 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167016 ?auto_167014 ?auto_167015 ?auto_167013 ?auto_167012 )
      ( MAKE-5PILE ?auto_167008 ?auto_167009 ?auto_167010 ?auto_167011 ?auto_167012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167017 - BLOCK
      ?auto_167018 - BLOCK
      ?auto_167019 - BLOCK
      ?auto_167020 - BLOCK
      ?auto_167021 - BLOCK
    )
    :vars
    (
      ?auto_167023 - BLOCK
      ?auto_167025 - BLOCK
      ?auto_167024 - BLOCK
      ?auto_167022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167017 ) ( ON ?auto_167018 ?auto_167017 ) ( not ( = ?auto_167017 ?auto_167018 ) ) ( not ( = ?auto_167017 ?auto_167019 ) ) ( not ( = ?auto_167017 ?auto_167020 ) ) ( not ( = ?auto_167017 ?auto_167021 ) ) ( not ( = ?auto_167018 ?auto_167019 ) ) ( not ( = ?auto_167018 ?auto_167020 ) ) ( not ( = ?auto_167018 ?auto_167021 ) ) ( not ( = ?auto_167019 ?auto_167020 ) ) ( not ( = ?auto_167019 ?auto_167021 ) ) ( not ( = ?auto_167020 ?auto_167021 ) ) ( ON ?auto_167021 ?auto_167023 ) ( not ( = ?auto_167017 ?auto_167023 ) ) ( not ( = ?auto_167018 ?auto_167023 ) ) ( not ( = ?auto_167019 ?auto_167023 ) ) ( not ( = ?auto_167020 ?auto_167023 ) ) ( not ( = ?auto_167021 ?auto_167023 ) ) ( ON ?auto_167020 ?auto_167021 ) ( CLEAR ?auto_167020 ) ( ON-TABLE ?auto_167025 ) ( ON ?auto_167024 ?auto_167025 ) ( ON ?auto_167022 ?auto_167024 ) ( ON ?auto_167023 ?auto_167022 ) ( not ( = ?auto_167025 ?auto_167024 ) ) ( not ( = ?auto_167025 ?auto_167022 ) ) ( not ( = ?auto_167025 ?auto_167023 ) ) ( not ( = ?auto_167025 ?auto_167021 ) ) ( not ( = ?auto_167025 ?auto_167020 ) ) ( not ( = ?auto_167024 ?auto_167022 ) ) ( not ( = ?auto_167024 ?auto_167023 ) ) ( not ( = ?auto_167024 ?auto_167021 ) ) ( not ( = ?auto_167024 ?auto_167020 ) ) ( not ( = ?auto_167022 ?auto_167023 ) ) ( not ( = ?auto_167022 ?auto_167021 ) ) ( not ( = ?auto_167022 ?auto_167020 ) ) ( not ( = ?auto_167017 ?auto_167025 ) ) ( not ( = ?auto_167017 ?auto_167024 ) ) ( not ( = ?auto_167017 ?auto_167022 ) ) ( not ( = ?auto_167018 ?auto_167025 ) ) ( not ( = ?auto_167018 ?auto_167024 ) ) ( not ( = ?auto_167018 ?auto_167022 ) ) ( not ( = ?auto_167019 ?auto_167025 ) ) ( not ( = ?auto_167019 ?auto_167024 ) ) ( not ( = ?auto_167019 ?auto_167022 ) ) ( HOLDING ?auto_167019 ) ( CLEAR ?auto_167018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167017 ?auto_167018 ?auto_167019 )
      ( MAKE-5PILE ?auto_167017 ?auto_167018 ?auto_167019 ?auto_167020 ?auto_167021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167026 - BLOCK
      ?auto_167027 - BLOCK
      ?auto_167028 - BLOCK
      ?auto_167029 - BLOCK
      ?auto_167030 - BLOCK
    )
    :vars
    (
      ?auto_167034 - BLOCK
      ?auto_167033 - BLOCK
      ?auto_167032 - BLOCK
      ?auto_167031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167026 ) ( ON ?auto_167027 ?auto_167026 ) ( not ( = ?auto_167026 ?auto_167027 ) ) ( not ( = ?auto_167026 ?auto_167028 ) ) ( not ( = ?auto_167026 ?auto_167029 ) ) ( not ( = ?auto_167026 ?auto_167030 ) ) ( not ( = ?auto_167027 ?auto_167028 ) ) ( not ( = ?auto_167027 ?auto_167029 ) ) ( not ( = ?auto_167027 ?auto_167030 ) ) ( not ( = ?auto_167028 ?auto_167029 ) ) ( not ( = ?auto_167028 ?auto_167030 ) ) ( not ( = ?auto_167029 ?auto_167030 ) ) ( ON ?auto_167030 ?auto_167034 ) ( not ( = ?auto_167026 ?auto_167034 ) ) ( not ( = ?auto_167027 ?auto_167034 ) ) ( not ( = ?auto_167028 ?auto_167034 ) ) ( not ( = ?auto_167029 ?auto_167034 ) ) ( not ( = ?auto_167030 ?auto_167034 ) ) ( ON ?auto_167029 ?auto_167030 ) ( ON-TABLE ?auto_167033 ) ( ON ?auto_167032 ?auto_167033 ) ( ON ?auto_167031 ?auto_167032 ) ( ON ?auto_167034 ?auto_167031 ) ( not ( = ?auto_167033 ?auto_167032 ) ) ( not ( = ?auto_167033 ?auto_167031 ) ) ( not ( = ?auto_167033 ?auto_167034 ) ) ( not ( = ?auto_167033 ?auto_167030 ) ) ( not ( = ?auto_167033 ?auto_167029 ) ) ( not ( = ?auto_167032 ?auto_167031 ) ) ( not ( = ?auto_167032 ?auto_167034 ) ) ( not ( = ?auto_167032 ?auto_167030 ) ) ( not ( = ?auto_167032 ?auto_167029 ) ) ( not ( = ?auto_167031 ?auto_167034 ) ) ( not ( = ?auto_167031 ?auto_167030 ) ) ( not ( = ?auto_167031 ?auto_167029 ) ) ( not ( = ?auto_167026 ?auto_167033 ) ) ( not ( = ?auto_167026 ?auto_167032 ) ) ( not ( = ?auto_167026 ?auto_167031 ) ) ( not ( = ?auto_167027 ?auto_167033 ) ) ( not ( = ?auto_167027 ?auto_167032 ) ) ( not ( = ?auto_167027 ?auto_167031 ) ) ( not ( = ?auto_167028 ?auto_167033 ) ) ( not ( = ?auto_167028 ?auto_167032 ) ) ( not ( = ?auto_167028 ?auto_167031 ) ) ( CLEAR ?auto_167027 ) ( ON ?auto_167028 ?auto_167029 ) ( CLEAR ?auto_167028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167033 ?auto_167032 ?auto_167031 ?auto_167034 ?auto_167030 ?auto_167029 )
      ( MAKE-5PILE ?auto_167026 ?auto_167027 ?auto_167028 ?auto_167029 ?auto_167030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167035 - BLOCK
      ?auto_167036 - BLOCK
      ?auto_167037 - BLOCK
      ?auto_167038 - BLOCK
      ?auto_167039 - BLOCK
    )
    :vars
    (
      ?auto_167043 - BLOCK
      ?auto_167042 - BLOCK
      ?auto_167040 - BLOCK
      ?auto_167041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167035 ) ( not ( = ?auto_167035 ?auto_167036 ) ) ( not ( = ?auto_167035 ?auto_167037 ) ) ( not ( = ?auto_167035 ?auto_167038 ) ) ( not ( = ?auto_167035 ?auto_167039 ) ) ( not ( = ?auto_167036 ?auto_167037 ) ) ( not ( = ?auto_167036 ?auto_167038 ) ) ( not ( = ?auto_167036 ?auto_167039 ) ) ( not ( = ?auto_167037 ?auto_167038 ) ) ( not ( = ?auto_167037 ?auto_167039 ) ) ( not ( = ?auto_167038 ?auto_167039 ) ) ( ON ?auto_167039 ?auto_167043 ) ( not ( = ?auto_167035 ?auto_167043 ) ) ( not ( = ?auto_167036 ?auto_167043 ) ) ( not ( = ?auto_167037 ?auto_167043 ) ) ( not ( = ?auto_167038 ?auto_167043 ) ) ( not ( = ?auto_167039 ?auto_167043 ) ) ( ON ?auto_167038 ?auto_167039 ) ( ON-TABLE ?auto_167042 ) ( ON ?auto_167040 ?auto_167042 ) ( ON ?auto_167041 ?auto_167040 ) ( ON ?auto_167043 ?auto_167041 ) ( not ( = ?auto_167042 ?auto_167040 ) ) ( not ( = ?auto_167042 ?auto_167041 ) ) ( not ( = ?auto_167042 ?auto_167043 ) ) ( not ( = ?auto_167042 ?auto_167039 ) ) ( not ( = ?auto_167042 ?auto_167038 ) ) ( not ( = ?auto_167040 ?auto_167041 ) ) ( not ( = ?auto_167040 ?auto_167043 ) ) ( not ( = ?auto_167040 ?auto_167039 ) ) ( not ( = ?auto_167040 ?auto_167038 ) ) ( not ( = ?auto_167041 ?auto_167043 ) ) ( not ( = ?auto_167041 ?auto_167039 ) ) ( not ( = ?auto_167041 ?auto_167038 ) ) ( not ( = ?auto_167035 ?auto_167042 ) ) ( not ( = ?auto_167035 ?auto_167040 ) ) ( not ( = ?auto_167035 ?auto_167041 ) ) ( not ( = ?auto_167036 ?auto_167042 ) ) ( not ( = ?auto_167036 ?auto_167040 ) ) ( not ( = ?auto_167036 ?auto_167041 ) ) ( not ( = ?auto_167037 ?auto_167042 ) ) ( not ( = ?auto_167037 ?auto_167040 ) ) ( not ( = ?auto_167037 ?auto_167041 ) ) ( ON ?auto_167037 ?auto_167038 ) ( CLEAR ?auto_167037 ) ( HOLDING ?auto_167036 ) ( CLEAR ?auto_167035 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167035 ?auto_167036 )
      ( MAKE-5PILE ?auto_167035 ?auto_167036 ?auto_167037 ?auto_167038 ?auto_167039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167044 - BLOCK
      ?auto_167045 - BLOCK
      ?auto_167046 - BLOCK
      ?auto_167047 - BLOCK
      ?auto_167048 - BLOCK
    )
    :vars
    (
      ?auto_167052 - BLOCK
      ?auto_167049 - BLOCK
      ?auto_167051 - BLOCK
      ?auto_167050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167044 ) ( not ( = ?auto_167044 ?auto_167045 ) ) ( not ( = ?auto_167044 ?auto_167046 ) ) ( not ( = ?auto_167044 ?auto_167047 ) ) ( not ( = ?auto_167044 ?auto_167048 ) ) ( not ( = ?auto_167045 ?auto_167046 ) ) ( not ( = ?auto_167045 ?auto_167047 ) ) ( not ( = ?auto_167045 ?auto_167048 ) ) ( not ( = ?auto_167046 ?auto_167047 ) ) ( not ( = ?auto_167046 ?auto_167048 ) ) ( not ( = ?auto_167047 ?auto_167048 ) ) ( ON ?auto_167048 ?auto_167052 ) ( not ( = ?auto_167044 ?auto_167052 ) ) ( not ( = ?auto_167045 ?auto_167052 ) ) ( not ( = ?auto_167046 ?auto_167052 ) ) ( not ( = ?auto_167047 ?auto_167052 ) ) ( not ( = ?auto_167048 ?auto_167052 ) ) ( ON ?auto_167047 ?auto_167048 ) ( ON-TABLE ?auto_167049 ) ( ON ?auto_167051 ?auto_167049 ) ( ON ?auto_167050 ?auto_167051 ) ( ON ?auto_167052 ?auto_167050 ) ( not ( = ?auto_167049 ?auto_167051 ) ) ( not ( = ?auto_167049 ?auto_167050 ) ) ( not ( = ?auto_167049 ?auto_167052 ) ) ( not ( = ?auto_167049 ?auto_167048 ) ) ( not ( = ?auto_167049 ?auto_167047 ) ) ( not ( = ?auto_167051 ?auto_167050 ) ) ( not ( = ?auto_167051 ?auto_167052 ) ) ( not ( = ?auto_167051 ?auto_167048 ) ) ( not ( = ?auto_167051 ?auto_167047 ) ) ( not ( = ?auto_167050 ?auto_167052 ) ) ( not ( = ?auto_167050 ?auto_167048 ) ) ( not ( = ?auto_167050 ?auto_167047 ) ) ( not ( = ?auto_167044 ?auto_167049 ) ) ( not ( = ?auto_167044 ?auto_167051 ) ) ( not ( = ?auto_167044 ?auto_167050 ) ) ( not ( = ?auto_167045 ?auto_167049 ) ) ( not ( = ?auto_167045 ?auto_167051 ) ) ( not ( = ?auto_167045 ?auto_167050 ) ) ( not ( = ?auto_167046 ?auto_167049 ) ) ( not ( = ?auto_167046 ?auto_167051 ) ) ( not ( = ?auto_167046 ?auto_167050 ) ) ( ON ?auto_167046 ?auto_167047 ) ( CLEAR ?auto_167044 ) ( ON ?auto_167045 ?auto_167046 ) ( CLEAR ?auto_167045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167049 ?auto_167051 ?auto_167050 ?auto_167052 ?auto_167048 ?auto_167047 ?auto_167046 )
      ( MAKE-5PILE ?auto_167044 ?auto_167045 ?auto_167046 ?auto_167047 ?auto_167048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167053 - BLOCK
      ?auto_167054 - BLOCK
      ?auto_167055 - BLOCK
      ?auto_167056 - BLOCK
      ?auto_167057 - BLOCK
    )
    :vars
    (
      ?auto_167058 - BLOCK
      ?auto_167059 - BLOCK
      ?auto_167061 - BLOCK
      ?auto_167060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167053 ?auto_167054 ) ) ( not ( = ?auto_167053 ?auto_167055 ) ) ( not ( = ?auto_167053 ?auto_167056 ) ) ( not ( = ?auto_167053 ?auto_167057 ) ) ( not ( = ?auto_167054 ?auto_167055 ) ) ( not ( = ?auto_167054 ?auto_167056 ) ) ( not ( = ?auto_167054 ?auto_167057 ) ) ( not ( = ?auto_167055 ?auto_167056 ) ) ( not ( = ?auto_167055 ?auto_167057 ) ) ( not ( = ?auto_167056 ?auto_167057 ) ) ( ON ?auto_167057 ?auto_167058 ) ( not ( = ?auto_167053 ?auto_167058 ) ) ( not ( = ?auto_167054 ?auto_167058 ) ) ( not ( = ?auto_167055 ?auto_167058 ) ) ( not ( = ?auto_167056 ?auto_167058 ) ) ( not ( = ?auto_167057 ?auto_167058 ) ) ( ON ?auto_167056 ?auto_167057 ) ( ON-TABLE ?auto_167059 ) ( ON ?auto_167061 ?auto_167059 ) ( ON ?auto_167060 ?auto_167061 ) ( ON ?auto_167058 ?auto_167060 ) ( not ( = ?auto_167059 ?auto_167061 ) ) ( not ( = ?auto_167059 ?auto_167060 ) ) ( not ( = ?auto_167059 ?auto_167058 ) ) ( not ( = ?auto_167059 ?auto_167057 ) ) ( not ( = ?auto_167059 ?auto_167056 ) ) ( not ( = ?auto_167061 ?auto_167060 ) ) ( not ( = ?auto_167061 ?auto_167058 ) ) ( not ( = ?auto_167061 ?auto_167057 ) ) ( not ( = ?auto_167061 ?auto_167056 ) ) ( not ( = ?auto_167060 ?auto_167058 ) ) ( not ( = ?auto_167060 ?auto_167057 ) ) ( not ( = ?auto_167060 ?auto_167056 ) ) ( not ( = ?auto_167053 ?auto_167059 ) ) ( not ( = ?auto_167053 ?auto_167061 ) ) ( not ( = ?auto_167053 ?auto_167060 ) ) ( not ( = ?auto_167054 ?auto_167059 ) ) ( not ( = ?auto_167054 ?auto_167061 ) ) ( not ( = ?auto_167054 ?auto_167060 ) ) ( not ( = ?auto_167055 ?auto_167059 ) ) ( not ( = ?auto_167055 ?auto_167061 ) ) ( not ( = ?auto_167055 ?auto_167060 ) ) ( ON ?auto_167055 ?auto_167056 ) ( ON ?auto_167054 ?auto_167055 ) ( CLEAR ?auto_167054 ) ( HOLDING ?auto_167053 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167053 )
      ( MAKE-5PILE ?auto_167053 ?auto_167054 ?auto_167055 ?auto_167056 ?auto_167057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_167062 - BLOCK
      ?auto_167063 - BLOCK
      ?auto_167064 - BLOCK
      ?auto_167065 - BLOCK
      ?auto_167066 - BLOCK
    )
    :vars
    (
      ?auto_167070 - BLOCK
      ?auto_167067 - BLOCK
      ?auto_167068 - BLOCK
      ?auto_167069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167062 ?auto_167063 ) ) ( not ( = ?auto_167062 ?auto_167064 ) ) ( not ( = ?auto_167062 ?auto_167065 ) ) ( not ( = ?auto_167062 ?auto_167066 ) ) ( not ( = ?auto_167063 ?auto_167064 ) ) ( not ( = ?auto_167063 ?auto_167065 ) ) ( not ( = ?auto_167063 ?auto_167066 ) ) ( not ( = ?auto_167064 ?auto_167065 ) ) ( not ( = ?auto_167064 ?auto_167066 ) ) ( not ( = ?auto_167065 ?auto_167066 ) ) ( ON ?auto_167066 ?auto_167070 ) ( not ( = ?auto_167062 ?auto_167070 ) ) ( not ( = ?auto_167063 ?auto_167070 ) ) ( not ( = ?auto_167064 ?auto_167070 ) ) ( not ( = ?auto_167065 ?auto_167070 ) ) ( not ( = ?auto_167066 ?auto_167070 ) ) ( ON ?auto_167065 ?auto_167066 ) ( ON-TABLE ?auto_167067 ) ( ON ?auto_167068 ?auto_167067 ) ( ON ?auto_167069 ?auto_167068 ) ( ON ?auto_167070 ?auto_167069 ) ( not ( = ?auto_167067 ?auto_167068 ) ) ( not ( = ?auto_167067 ?auto_167069 ) ) ( not ( = ?auto_167067 ?auto_167070 ) ) ( not ( = ?auto_167067 ?auto_167066 ) ) ( not ( = ?auto_167067 ?auto_167065 ) ) ( not ( = ?auto_167068 ?auto_167069 ) ) ( not ( = ?auto_167068 ?auto_167070 ) ) ( not ( = ?auto_167068 ?auto_167066 ) ) ( not ( = ?auto_167068 ?auto_167065 ) ) ( not ( = ?auto_167069 ?auto_167070 ) ) ( not ( = ?auto_167069 ?auto_167066 ) ) ( not ( = ?auto_167069 ?auto_167065 ) ) ( not ( = ?auto_167062 ?auto_167067 ) ) ( not ( = ?auto_167062 ?auto_167068 ) ) ( not ( = ?auto_167062 ?auto_167069 ) ) ( not ( = ?auto_167063 ?auto_167067 ) ) ( not ( = ?auto_167063 ?auto_167068 ) ) ( not ( = ?auto_167063 ?auto_167069 ) ) ( not ( = ?auto_167064 ?auto_167067 ) ) ( not ( = ?auto_167064 ?auto_167068 ) ) ( not ( = ?auto_167064 ?auto_167069 ) ) ( ON ?auto_167064 ?auto_167065 ) ( ON ?auto_167063 ?auto_167064 ) ( ON ?auto_167062 ?auto_167063 ) ( CLEAR ?auto_167062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167067 ?auto_167068 ?auto_167069 ?auto_167070 ?auto_167066 ?auto_167065 ?auto_167064 ?auto_167063 )
      ( MAKE-5PILE ?auto_167062 ?auto_167063 ?auto_167064 ?auto_167065 ?auto_167066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167074 - BLOCK
      ?auto_167075 - BLOCK
      ?auto_167076 - BLOCK
    )
    :vars
    (
      ?auto_167077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167077 ?auto_167076 ) ( CLEAR ?auto_167077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167074 ) ( ON ?auto_167075 ?auto_167074 ) ( ON ?auto_167076 ?auto_167075 ) ( not ( = ?auto_167074 ?auto_167075 ) ) ( not ( = ?auto_167074 ?auto_167076 ) ) ( not ( = ?auto_167074 ?auto_167077 ) ) ( not ( = ?auto_167075 ?auto_167076 ) ) ( not ( = ?auto_167075 ?auto_167077 ) ) ( not ( = ?auto_167076 ?auto_167077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167077 ?auto_167076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167078 - BLOCK
      ?auto_167079 - BLOCK
      ?auto_167080 - BLOCK
    )
    :vars
    (
      ?auto_167081 - BLOCK
      ?auto_167082 - BLOCK
      ?auto_167083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167081 ?auto_167080 ) ( CLEAR ?auto_167081 ) ( ON-TABLE ?auto_167078 ) ( ON ?auto_167079 ?auto_167078 ) ( ON ?auto_167080 ?auto_167079 ) ( not ( = ?auto_167078 ?auto_167079 ) ) ( not ( = ?auto_167078 ?auto_167080 ) ) ( not ( = ?auto_167078 ?auto_167081 ) ) ( not ( = ?auto_167079 ?auto_167080 ) ) ( not ( = ?auto_167079 ?auto_167081 ) ) ( not ( = ?auto_167080 ?auto_167081 ) ) ( HOLDING ?auto_167082 ) ( CLEAR ?auto_167083 ) ( not ( = ?auto_167078 ?auto_167082 ) ) ( not ( = ?auto_167078 ?auto_167083 ) ) ( not ( = ?auto_167079 ?auto_167082 ) ) ( not ( = ?auto_167079 ?auto_167083 ) ) ( not ( = ?auto_167080 ?auto_167082 ) ) ( not ( = ?auto_167080 ?auto_167083 ) ) ( not ( = ?auto_167081 ?auto_167082 ) ) ( not ( = ?auto_167081 ?auto_167083 ) ) ( not ( = ?auto_167082 ?auto_167083 ) ) )
    :subtasks
    ( ( !STACK ?auto_167082 ?auto_167083 )
      ( MAKE-3PILE ?auto_167078 ?auto_167079 ?auto_167080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167084 - BLOCK
      ?auto_167085 - BLOCK
      ?auto_167086 - BLOCK
    )
    :vars
    (
      ?auto_167089 - BLOCK
      ?auto_167087 - BLOCK
      ?auto_167088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167089 ?auto_167086 ) ( ON-TABLE ?auto_167084 ) ( ON ?auto_167085 ?auto_167084 ) ( ON ?auto_167086 ?auto_167085 ) ( not ( = ?auto_167084 ?auto_167085 ) ) ( not ( = ?auto_167084 ?auto_167086 ) ) ( not ( = ?auto_167084 ?auto_167089 ) ) ( not ( = ?auto_167085 ?auto_167086 ) ) ( not ( = ?auto_167085 ?auto_167089 ) ) ( not ( = ?auto_167086 ?auto_167089 ) ) ( CLEAR ?auto_167087 ) ( not ( = ?auto_167084 ?auto_167088 ) ) ( not ( = ?auto_167084 ?auto_167087 ) ) ( not ( = ?auto_167085 ?auto_167088 ) ) ( not ( = ?auto_167085 ?auto_167087 ) ) ( not ( = ?auto_167086 ?auto_167088 ) ) ( not ( = ?auto_167086 ?auto_167087 ) ) ( not ( = ?auto_167089 ?auto_167088 ) ) ( not ( = ?auto_167089 ?auto_167087 ) ) ( not ( = ?auto_167088 ?auto_167087 ) ) ( ON ?auto_167088 ?auto_167089 ) ( CLEAR ?auto_167088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167084 ?auto_167085 ?auto_167086 ?auto_167089 )
      ( MAKE-3PILE ?auto_167084 ?auto_167085 ?auto_167086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167090 - BLOCK
      ?auto_167091 - BLOCK
      ?auto_167092 - BLOCK
    )
    :vars
    (
      ?auto_167093 - BLOCK
      ?auto_167095 - BLOCK
      ?auto_167094 - BLOCK
      ?auto_167098 - BLOCK
      ?auto_167097 - BLOCK
      ?auto_167096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167093 ?auto_167092 ) ( ON-TABLE ?auto_167090 ) ( ON ?auto_167091 ?auto_167090 ) ( ON ?auto_167092 ?auto_167091 ) ( not ( = ?auto_167090 ?auto_167091 ) ) ( not ( = ?auto_167090 ?auto_167092 ) ) ( not ( = ?auto_167090 ?auto_167093 ) ) ( not ( = ?auto_167091 ?auto_167092 ) ) ( not ( = ?auto_167091 ?auto_167093 ) ) ( not ( = ?auto_167092 ?auto_167093 ) ) ( not ( = ?auto_167090 ?auto_167095 ) ) ( not ( = ?auto_167090 ?auto_167094 ) ) ( not ( = ?auto_167091 ?auto_167095 ) ) ( not ( = ?auto_167091 ?auto_167094 ) ) ( not ( = ?auto_167092 ?auto_167095 ) ) ( not ( = ?auto_167092 ?auto_167094 ) ) ( not ( = ?auto_167093 ?auto_167095 ) ) ( not ( = ?auto_167093 ?auto_167094 ) ) ( not ( = ?auto_167095 ?auto_167094 ) ) ( ON ?auto_167095 ?auto_167093 ) ( CLEAR ?auto_167095 ) ( HOLDING ?auto_167094 ) ( CLEAR ?auto_167098 ) ( ON-TABLE ?auto_167097 ) ( ON ?auto_167096 ?auto_167097 ) ( ON ?auto_167098 ?auto_167096 ) ( not ( = ?auto_167097 ?auto_167096 ) ) ( not ( = ?auto_167097 ?auto_167098 ) ) ( not ( = ?auto_167097 ?auto_167094 ) ) ( not ( = ?auto_167096 ?auto_167098 ) ) ( not ( = ?auto_167096 ?auto_167094 ) ) ( not ( = ?auto_167098 ?auto_167094 ) ) ( not ( = ?auto_167090 ?auto_167098 ) ) ( not ( = ?auto_167090 ?auto_167097 ) ) ( not ( = ?auto_167090 ?auto_167096 ) ) ( not ( = ?auto_167091 ?auto_167098 ) ) ( not ( = ?auto_167091 ?auto_167097 ) ) ( not ( = ?auto_167091 ?auto_167096 ) ) ( not ( = ?auto_167092 ?auto_167098 ) ) ( not ( = ?auto_167092 ?auto_167097 ) ) ( not ( = ?auto_167092 ?auto_167096 ) ) ( not ( = ?auto_167093 ?auto_167098 ) ) ( not ( = ?auto_167093 ?auto_167097 ) ) ( not ( = ?auto_167093 ?auto_167096 ) ) ( not ( = ?auto_167095 ?auto_167098 ) ) ( not ( = ?auto_167095 ?auto_167097 ) ) ( not ( = ?auto_167095 ?auto_167096 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167097 ?auto_167096 ?auto_167098 ?auto_167094 )
      ( MAKE-3PILE ?auto_167090 ?auto_167091 ?auto_167092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167099 - BLOCK
      ?auto_167100 - BLOCK
      ?auto_167101 - BLOCK
    )
    :vars
    (
      ?auto_167102 - BLOCK
      ?auto_167103 - BLOCK
      ?auto_167105 - BLOCK
      ?auto_167107 - BLOCK
      ?auto_167104 - BLOCK
      ?auto_167106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167102 ?auto_167101 ) ( ON-TABLE ?auto_167099 ) ( ON ?auto_167100 ?auto_167099 ) ( ON ?auto_167101 ?auto_167100 ) ( not ( = ?auto_167099 ?auto_167100 ) ) ( not ( = ?auto_167099 ?auto_167101 ) ) ( not ( = ?auto_167099 ?auto_167102 ) ) ( not ( = ?auto_167100 ?auto_167101 ) ) ( not ( = ?auto_167100 ?auto_167102 ) ) ( not ( = ?auto_167101 ?auto_167102 ) ) ( not ( = ?auto_167099 ?auto_167103 ) ) ( not ( = ?auto_167099 ?auto_167105 ) ) ( not ( = ?auto_167100 ?auto_167103 ) ) ( not ( = ?auto_167100 ?auto_167105 ) ) ( not ( = ?auto_167101 ?auto_167103 ) ) ( not ( = ?auto_167101 ?auto_167105 ) ) ( not ( = ?auto_167102 ?auto_167103 ) ) ( not ( = ?auto_167102 ?auto_167105 ) ) ( not ( = ?auto_167103 ?auto_167105 ) ) ( ON ?auto_167103 ?auto_167102 ) ( CLEAR ?auto_167107 ) ( ON-TABLE ?auto_167104 ) ( ON ?auto_167106 ?auto_167104 ) ( ON ?auto_167107 ?auto_167106 ) ( not ( = ?auto_167104 ?auto_167106 ) ) ( not ( = ?auto_167104 ?auto_167107 ) ) ( not ( = ?auto_167104 ?auto_167105 ) ) ( not ( = ?auto_167106 ?auto_167107 ) ) ( not ( = ?auto_167106 ?auto_167105 ) ) ( not ( = ?auto_167107 ?auto_167105 ) ) ( not ( = ?auto_167099 ?auto_167107 ) ) ( not ( = ?auto_167099 ?auto_167104 ) ) ( not ( = ?auto_167099 ?auto_167106 ) ) ( not ( = ?auto_167100 ?auto_167107 ) ) ( not ( = ?auto_167100 ?auto_167104 ) ) ( not ( = ?auto_167100 ?auto_167106 ) ) ( not ( = ?auto_167101 ?auto_167107 ) ) ( not ( = ?auto_167101 ?auto_167104 ) ) ( not ( = ?auto_167101 ?auto_167106 ) ) ( not ( = ?auto_167102 ?auto_167107 ) ) ( not ( = ?auto_167102 ?auto_167104 ) ) ( not ( = ?auto_167102 ?auto_167106 ) ) ( not ( = ?auto_167103 ?auto_167107 ) ) ( not ( = ?auto_167103 ?auto_167104 ) ) ( not ( = ?auto_167103 ?auto_167106 ) ) ( ON ?auto_167105 ?auto_167103 ) ( CLEAR ?auto_167105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167099 ?auto_167100 ?auto_167101 ?auto_167102 ?auto_167103 )
      ( MAKE-3PILE ?auto_167099 ?auto_167100 ?auto_167101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167108 - BLOCK
      ?auto_167109 - BLOCK
      ?auto_167110 - BLOCK
    )
    :vars
    (
      ?auto_167115 - BLOCK
      ?auto_167116 - BLOCK
      ?auto_167114 - BLOCK
      ?auto_167111 - BLOCK
      ?auto_167113 - BLOCK
      ?auto_167112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167115 ?auto_167110 ) ( ON-TABLE ?auto_167108 ) ( ON ?auto_167109 ?auto_167108 ) ( ON ?auto_167110 ?auto_167109 ) ( not ( = ?auto_167108 ?auto_167109 ) ) ( not ( = ?auto_167108 ?auto_167110 ) ) ( not ( = ?auto_167108 ?auto_167115 ) ) ( not ( = ?auto_167109 ?auto_167110 ) ) ( not ( = ?auto_167109 ?auto_167115 ) ) ( not ( = ?auto_167110 ?auto_167115 ) ) ( not ( = ?auto_167108 ?auto_167116 ) ) ( not ( = ?auto_167108 ?auto_167114 ) ) ( not ( = ?auto_167109 ?auto_167116 ) ) ( not ( = ?auto_167109 ?auto_167114 ) ) ( not ( = ?auto_167110 ?auto_167116 ) ) ( not ( = ?auto_167110 ?auto_167114 ) ) ( not ( = ?auto_167115 ?auto_167116 ) ) ( not ( = ?auto_167115 ?auto_167114 ) ) ( not ( = ?auto_167116 ?auto_167114 ) ) ( ON ?auto_167116 ?auto_167115 ) ( ON-TABLE ?auto_167111 ) ( ON ?auto_167113 ?auto_167111 ) ( not ( = ?auto_167111 ?auto_167113 ) ) ( not ( = ?auto_167111 ?auto_167112 ) ) ( not ( = ?auto_167111 ?auto_167114 ) ) ( not ( = ?auto_167113 ?auto_167112 ) ) ( not ( = ?auto_167113 ?auto_167114 ) ) ( not ( = ?auto_167112 ?auto_167114 ) ) ( not ( = ?auto_167108 ?auto_167112 ) ) ( not ( = ?auto_167108 ?auto_167111 ) ) ( not ( = ?auto_167108 ?auto_167113 ) ) ( not ( = ?auto_167109 ?auto_167112 ) ) ( not ( = ?auto_167109 ?auto_167111 ) ) ( not ( = ?auto_167109 ?auto_167113 ) ) ( not ( = ?auto_167110 ?auto_167112 ) ) ( not ( = ?auto_167110 ?auto_167111 ) ) ( not ( = ?auto_167110 ?auto_167113 ) ) ( not ( = ?auto_167115 ?auto_167112 ) ) ( not ( = ?auto_167115 ?auto_167111 ) ) ( not ( = ?auto_167115 ?auto_167113 ) ) ( not ( = ?auto_167116 ?auto_167112 ) ) ( not ( = ?auto_167116 ?auto_167111 ) ) ( not ( = ?auto_167116 ?auto_167113 ) ) ( ON ?auto_167114 ?auto_167116 ) ( CLEAR ?auto_167114 ) ( HOLDING ?auto_167112 ) ( CLEAR ?auto_167113 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167111 ?auto_167113 ?auto_167112 )
      ( MAKE-3PILE ?auto_167108 ?auto_167109 ?auto_167110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167117 - BLOCK
      ?auto_167118 - BLOCK
      ?auto_167119 - BLOCK
    )
    :vars
    (
      ?auto_167124 - BLOCK
      ?auto_167120 - BLOCK
      ?auto_167125 - BLOCK
      ?auto_167123 - BLOCK
      ?auto_167121 - BLOCK
      ?auto_167122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167124 ?auto_167119 ) ( ON-TABLE ?auto_167117 ) ( ON ?auto_167118 ?auto_167117 ) ( ON ?auto_167119 ?auto_167118 ) ( not ( = ?auto_167117 ?auto_167118 ) ) ( not ( = ?auto_167117 ?auto_167119 ) ) ( not ( = ?auto_167117 ?auto_167124 ) ) ( not ( = ?auto_167118 ?auto_167119 ) ) ( not ( = ?auto_167118 ?auto_167124 ) ) ( not ( = ?auto_167119 ?auto_167124 ) ) ( not ( = ?auto_167117 ?auto_167120 ) ) ( not ( = ?auto_167117 ?auto_167125 ) ) ( not ( = ?auto_167118 ?auto_167120 ) ) ( not ( = ?auto_167118 ?auto_167125 ) ) ( not ( = ?auto_167119 ?auto_167120 ) ) ( not ( = ?auto_167119 ?auto_167125 ) ) ( not ( = ?auto_167124 ?auto_167120 ) ) ( not ( = ?auto_167124 ?auto_167125 ) ) ( not ( = ?auto_167120 ?auto_167125 ) ) ( ON ?auto_167120 ?auto_167124 ) ( ON-TABLE ?auto_167123 ) ( ON ?auto_167121 ?auto_167123 ) ( not ( = ?auto_167123 ?auto_167121 ) ) ( not ( = ?auto_167123 ?auto_167122 ) ) ( not ( = ?auto_167123 ?auto_167125 ) ) ( not ( = ?auto_167121 ?auto_167122 ) ) ( not ( = ?auto_167121 ?auto_167125 ) ) ( not ( = ?auto_167122 ?auto_167125 ) ) ( not ( = ?auto_167117 ?auto_167122 ) ) ( not ( = ?auto_167117 ?auto_167123 ) ) ( not ( = ?auto_167117 ?auto_167121 ) ) ( not ( = ?auto_167118 ?auto_167122 ) ) ( not ( = ?auto_167118 ?auto_167123 ) ) ( not ( = ?auto_167118 ?auto_167121 ) ) ( not ( = ?auto_167119 ?auto_167122 ) ) ( not ( = ?auto_167119 ?auto_167123 ) ) ( not ( = ?auto_167119 ?auto_167121 ) ) ( not ( = ?auto_167124 ?auto_167122 ) ) ( not ( = ?auto_167124 ?auto_167123 ) ) ( not ( = ?auto_167124 ?auto_167121 ) ) ( not ( = ?auto_167120 ?auto_167122 ) ) ( not ( = ?auto_167120 ?auto_167123 ) ) ( not ( = ?auto_167120 ?auto_167121 ) ) ( ON ?auto_167125 ?auto_167120 ) ( CLEAR ?auto_167121 ) ( ON ?auto_167122 ?auto_167125 ) ( CLEAR ?auto_167122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167117 ?auto_167118 ?auto_167119 ?auto_167124 ?auto_167120 ?auto_167125 )
      ( MAKE-3PILE ?auto_167117 ?auto_167118 ?auto_167119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167126 - BLOCK
      ?auto_167127 - BLOCK
      ?auto_167128 - BLOCK
    )
    :vars
    (
      ?auto_167130 - BLOCK
      ?auto_167132 - BLOCK
      ?auto_167131 - BLOCK
      ?auto_167133 - BLOCK
      ?auto_167134 - BLOCK
      ?auto_167129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167130 ?auto_167128 ) ( ON-TABLE ?auto_167126 ) ( ON ?auto_167127 ?auto_167126 ) ( ON ?auto_167128 ?auto_167127 ) ( not ( = ?auto_167126 ?auto_167127 ) ) ( not ( = ?auto_167126 ?auto_167128 ) ) ( not ( = ?auto_167126 ?auto_167130 ) ) ( not ( = ?auto_167127 ?auto_167128 ) ) ( not ( = ?auto_167127 ?auto_167130 ) ) ( not ( = ?auto_167128 ?auto_167130 ) ) ( not ( = ?auto_167126 ?auto_167132 ) ) ( not ( = ?auto_167126 ?auto_167131 ) ) ( not ( = ?auto_167127 ?auto_167132 ) ) ( not ( = ?auto_167127 ?auto_167131 ) ) ( not ( = ?auto_167128 ?auto_167132 ) ) ( not ( = ?auto_167128 ?auto_167131 ) ) ( not ( = ?auto_167130 ?auto_167132 ) ) ( not ( = ?auto_167130 ?auto_167131 ) ) ( not ( = ?auto_167132 ?auto_167131 ) ) ( ON ?auto_167132 ?auto_167130 ) ( ON-TABLE ?auto_167133 ) ( not ( = ?auto_167133 ?auto_167134 ) ) ( not ( = ?auto_167133 ?auto_167129 ) ) ( not ( = ?auto_167133 ?auto_167131 ) ) ( not ( = ?auto_167134 ?auto_167129 ) ) ( not ( = ?auto_167134 ?auto_167131 ) ) ( not ( = ?auto_167129 ?auto_167131 ) ) ( not ( = ?auto_167126 ?auto_167129 ) ) ( not ( = ?auto_167126 ?auto_167133 ) ) ( not ( = ?auto_167126 ?auto_167134 ) ) ( not ( = ?auto_167127 ?auto_167129 ) ) ( not ( = ?auto_167127 ?auto_167133 ) ) ( not ( = ?auto_167127 ?auto_167134 ) ) ( not ( = ?auto_167128 ?auto_167129 ) ) ( not ( = ?auto_167128 ?auto_167133 ) ) ( not ( = ?auto_167128 ?auto_167134 ) ) ( not ( = ?auto_167130 ?auto_167129 ) ) ( not ( = ?auto_167130 ?auto_167133 ) ) ( not ( = ?auto_167130 ?auto_167134 ) ) ( not ( = ?auto_167132 ?auto_167129 ) ) ( not ( = ?auto_167132 ?auto_167133 ) ) ( not ( = ?auto_167132 ?auto_167134 ) ) ( ON ?auto_167131 ?auto_167132 ) ( ON ?auto_167129 ?auto_167131 ) ( CLEAR ?auto_167129 ) ( HOLDING ?auto_167134 ) ( CLEAR ?auto_167133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167133 ?auto_167134 )
      ( MAKE-3PILE ?auto_167126 ?auto_167127 ?auto_167128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167135 - BLOCK
      ?auto_167136 - BLOCK
      ?auto_167137 - BLOCK
    )
    :vars
    (
      ?auto_167140 - BLOCK
      ?auto_167141 - BLOCK
      ?auto_167139 - BLOCK
      ?auto_167143 - BLOCK
      ?auto_167138 - BLOCK
      ?auto_167142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167140 ?auto_167137 ) ( ON-TABLE ?auto_167135 ) ( ON ?auto_167136 ?auto_167135 ) ( ON ?auto_167137 ?auto_167136 ) ( not ( = ?auto_167135 ?auto_167136 ) ) ( not ( = ?auto_167135 ?auto_167137 ) ) ( not ( = ?auto_167135 ?auto_167140 ) ) ( not ( = ?auto_167136 ?auto_167137 ) ) ( not ( = ?auto_167136 ?auto_167140 ) ) ( not ( = ?auto_167137 ?auto_167140 ) ) ( not ( = ?auto_167135 ?auto_167141 ) ) ( not ( = ?auto_167135 ?auto_167139 ) ) ( not ( = ?auto_167136 ?auto_167141 ) ) ( not ( = ?auto_167136 ?auto_167139 ) ) ( not ( = ?auto_167137 ?auto_167141 ) ) ( not ( = ?auto_167137 ?auto_167139 ) ) ( not ( = ?auto_167140 ?auto_167141 ) ) ( not ( = ?auto_167140 ?auto_167139 ) ) ( not ( = ?auto_167141 ?auto_167139 ) ) ( ON ?auto_167141 ?auto_167140 ) ( ON-TABLE ?auto_167143 ) ( not ( = ?auto_167143 ?auto_167138 ) ) ( not ( = ?auto_167143 ?auto_167142 ) ) ( not ( = ?auto_167143 ?auto_167139 ) ) ( not ( = ?auto_167138 ?auto_167142 ) ) ( not ( = ?auto_167138 ?auto_167139 ) ) ( not ( = ?auto_167142 ?auto_167139 ) ) ( not ( = ?auto_167135 ?auto_167142 ) ) ( not ( = ?auto_167135 ?auto_167143 ) ) ( not ( = ?auto_167135 ?auto_167138 ) ) ( not ( = ?auto_167136 ?auto_167142 ) ) ( not ( = ?auto_167136 ?auto_167143 ) ) ( not ( = ?auto_167136 ?auto_167138 ) ) ( not ( = ?auto_167137 ?auto_167142 ) ) ( not ( = ?auto_167137 ?auto_167143 ) ) ( not ( = ?auto_167137 ?auto_167138 ) ) ( not ( = ?auto_167140 ?auto_167142 ) ) ( not ( = ?auto_167140 ?auto_167143 ) ) ( not ( = ?auto_167140 ?auto_167138 ) ) ( not ( = ?auto_167141 ?auto_167142 ) ) ( not ( = ?auto_167141 ?auto_167143 ) ) ( not ( = ?auto_167141 ?auto_167138 ) ) ( ON ?auto_167139 ?auto_167141 ) ( ON ?auto_167142 ?auto_167139 ) ( CLEAR ?auto_167143 ) ( ON ?auto_167138 ?auto_167142 ) ( CLEAR ?auto_167138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167135 ?auto_167136 ?auto_167137 ?auto_167140 ?auto_167141 ?auto_167139 ?auto_167142 )
      ( MAKE-3PILE ?auto_167135 ?auto_167136 ?auto_167137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167144 - BLOCK
      ?auto_167145 - BLOCK
      ?auto_167146 - BLOCK
    )
    :vars
    (
      ?auto_167149 - BLOCK
      ?auto_167150 - BLOCK
      ?auto_167151 - BLOCK
      ?auto_167152 - BLOCK
      ?auto_167147 - BLOCK
      ?auto_167148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167149 ?auto_167146 ) ( ON-TABLE ?auto_167144 ) ( ON ?auto_167145 ?auto_167144 ) ( ON ?auto_167146 ?auto_167145 ) ( not ( = ?auto_167144 ?auto_167145 ) ) ( not ( = ?auto_167144 ?auto_167146 ) ) ( not ( = ?auto_167144 ?auto_167149 ) ) ( not ( = ?auto_167145 ?auto_167146 ) ) ( not ( = ?auto_167145 ?auto_167149 ) ) ( not ( = ?auto_167146 ?auto_167149 ) ) ( not ( = ?auto_167144 ?auto_167150 ) ) ( not ( = ?auto_167144 ?auto_167151 ) ) ( not ( = ?auto_167145 ?auto_167150 ) ) ( not ( = ?auto_167145 ?auto_167151 ) ) ( not ( = ?auto_167146 ?auto_167150 ) ) ( not ( = ?auto_167146 ?auto_167151 ) ) ( not ( = ?auto_167149 ?auto_167150 ) ) ( not ( = ?auto_167149 ?auto_167151 ) ) ( not ( = ?auto_167150 ?auto_167151 ) ) ( ON ?auto_167150 ?auto_167149 ) ( not ( = ?auto_167152 ?auto_167147 ) ) ( not ( = ?auto_167152 ?auto_167148 ) ) ( not ( = ?auto_167152 ?auto_167151 ) ) ( not ( = ?auto_167147 ?auto_167148 ) ) ( not ( = ?auto_167147 ?auto_167151 ) ) ( not ( = ?auto_167148 ?auto_167151 ) ) ( not ( = ?auto_167144 ?auto_167148 ) ) ( not ( = ?auto_167144 ?auto_167152 ) ) ( not ( = ?auto_167144 ?auto_167147 ) ) ( not ( = ?auto_167145 ?auto_167148 ) ) ( not ( = ?auto_167145 ?auto_167152 ) ) ( not ( = ?auto_167145 ?auto_167147 ) ) ( not ( = ?auto_167146 ?auto_167148 ) ) ( not ( = ?auto_167146 ?auto_167152 ) ) ( not ( = ?auto_167146 ?auto_167147 ) ) ( not ( = ?auto_167149 ?auto_167148 ) ) ( not ( = ?auto_167149 ?auto_167152 ) ) ( not ( = ?auto_167149 ?auto_167147 ) ) ( not ( = ?auto_167150 ?auto_167148 ) ) ( not ( = ?auto_167150 ?auto_167152 ) ) ( not ( = ?auto_167150 ?auto_167147 ) ) ( ON ?auto_167151 ?auto_167150 ) ( ON ?auto_167148 ?auto_167151 ) ( ON ?auto_167147 ?auto_167148 ) ( CLEAR ?auto_167147 ) ( HOLDING ?auto_167152 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167152 )
      ( MAKE-3PILE ?auto_167144 ?auto_167145 ?auto_167146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_167153 - BLOCK
      ?auto_167154 - BLOCK
      ?auto_167155 - BLOCK
    )
    :vars
    (
      ?auto_167157 - BLOCK
      ?auto_167161 - BLOCK
      ?auto_167159 - BLOCK
      ?auto_167160 - BLOCK
      ?auto_167158 - BLOCK
      ?auto_167156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167157 ?auto_167155 ) ( ON-TABLE ?auto_167153 ) ( ON ?auto_167154 ?auto_167153 ) ( ON ?auto_167155 ?auto_167154 ) ( not ( = ?auto_167153 ?auto_167154 ) ) ( not ( = ?auto_167153 ?auto_167155 ) ) ( not ( = ?auto_167153 ?auto_167157 ) ) ( not ( = ?auto_167154 ?auto_167155 ) ) ( not ( = ?auto_167154 ?auto_167157 ) ) ( not ( = ?auto_167155 ?auto_167157 ) ) ( not ( = ?auto_167153 ?auto_167161 ) ) ( not ( = ?auto_167153 ?auto_167159 ) ) ( not ( = ?auto_167154 ?auto_167161 ) ) ( not ( = ?auto_167154 ?auto_167159 ) ) ( not ( = ?auto_167155 ?auto_167161 ) ) ( not ( = ?auto_167155 ?auto_167159 ) ) ( not ( = ?auto_167157 ?auto_167161 ) ) ( not ( = ?auto_167157 ?auto_167159 ) ) ( not ( = ?auto_167161 ?auto_167159 ) ) ( ON ?auto_167161 ?auto_167157 ) ( not ( = ?auto_167160 ?auto_167158 ) ) ( not ( = ?auto_167160 ?auto_167156 ) ) ( not ( = ?auto_167160 ?auto_167159 ) ) ( not ( = ?auto_167158 ?auto_167156 ) ) ( not ( = ?auto_167158 ?auto_167159 ) ) ( not ( = ?auto_167156 ?auto_167159 ) ) ( not ( = ?auto_167153 ?auto_167156 ) ) ( not ( = ?auto_167153 ?auto_167160 ) ) ( not ( = ?auto_167153 ?auto_167158 ) ) ( not ( = ?auto_167154 ?auto_167156 ) ) ( not ( = ?auto_167154 ?auto_167160 ) ) ( not ( = ?auto_167154 ?auto_167158 ) ) ( not ( = ?auto_167155 ?auto_167156 ) ) ( not ( = ?auto_167155 ?auto_167160 ) ) ( not ( = ?auto_167155 ?auto_167158 ) ) ( not ( = ?auto_167157 ?auto_167156 ) ) ( not ( = ?auto_167157 ?auto_167160 ) ) ( not ( = ?auto_167157 ?auto_167158 ) ) ( not ( = ?auto_167161 ?auto_167156 ) ) ( not ( = ?auto_167161 ?auto_167160 ) ) ( not ( = ?auto_167161 ?auto_167158 ) ) ( ON ?auto_167159 ?auto_167161 ) ( ON ?auto_167156 ?auto_167159 ) ( ON ?auto_167158 ?auto_167156 ) ( ON ?auto_167160 ?auto_167158 ) ( CLEAR ?auto_167160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167153 ?auto_167154 ?auto_167155 ?auto_167157 ?auto_167161 ?auto_167159 ?auto_167156 ?auto_167158 )
      ( MAKE-3PILE ?auto_167153 ?auto_167154 ?auto_167155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167168 - BLOCK
      ?auto_167169 - BLOCK
      ?auto_167170 - BLOCK
      ?auto_167171 - BLOCK
      ?auto_167172 - BLOCK
      ?auto_167173 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_167173 ) ( CLEAR ?auto_167172 ) ( ON-TABLE ?auto_167168 ) ( ON ?auto_167169 ?auto_167168 ) ( ON ?auto_167170 ?auto_167169 ) ( ON ?auto_167171 ?auto_167170 ) ( ON ?auto_167172 ?auto_167171 ) ( not ( = ?auto_167168 ?auto_167169 ) ) ( not ( = ?auto_167168 ?auto_167170 ) ) ( not ( = ?auto_167168 ?auto_167171 ) ) ( not ( = ?auto_167168 ?auto_167172 ) ) ( not ( = ?auto_167168 ?auto_167173 ) ) ( not ( = ?auto_167169 ?auto_167170 ) ) ( not ( = ?auto_167169 ?auto_167171 ) ) ( not ( = ?auto_167169 ?auto_167172 ) ) ( not ( = ?auto_167169 ?auto_167173 ) ) ( not ( = ?auto_167170 ?auto_167171 ) ) ( not ( = ?auto_167170 ?auto_167172 ) ) ( not ( = ?auto_167170 ?auto_167173 ) ) ( not ( = ?auto_167171 ?auto_167172 ) ) ( not ( = ?auto_167171 ?auto_167173 ) ) ( not ( = ?auto_167172 ?auto_167173 ) ) )
    :subtasks
    ( ( !STACK ?auto_167173 ?auto_167172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167174 - BLOCK
      ?auto_167175 - BLOCK
      ?auto_167176 - BLOCK
      ?auto_167177 - BLOCK
      ?auto_167178 - BLOCK
      ?auto_167179 - BLOCK
    )
    :vars
    (
      ?auto_167180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167178 ) ( ON-TABLE ?auto_167174 ) ( ON ?auto_167175 ?auto_167174 ) ( ON ?auto_167176 ?auto_167175 ) ( ON ?auto_167177 ?auto_167176 ) ( ON ?auto_167178 ?auto_167177 ) ( not ( = ?auto_167174 ?auto_167175 ) ) ( not ( = ?auto_167174 ?auto_167176 ) ) ( not ( = ?auto_167174 ?auto_167177 ) ) ( not ( = ?auto_167174 ?auto_167178 ) ) ( not ( = ?auto_167174 ?auto_167179 ) ) ( not ( = ?auto_167175 ?auto_167176 ) ) ( not ( = ?auto_167175 ?auto_167177 ) ) ( not ( = ?auto_167175 ?auto_167178 ) ) ( not ( = ?auto_167175 ?auto_167179 ) ) ( not ( = ?auto_167176 ?auto_167177 ) ) ( not ( = ?auto_167176 ?auto_167178 ) ) ( not ( = ?auto_167176 ?auto_167179 ) ) ( not ( = ?auto_167177 ?auto_167178 ) ) ( not ( = ?auto_167177 ?auto_167179 ) ) ( not ( = ?auto_167178 ?auto_167179 ) ) ( ON ?auto_167179 ?auto_167180 ) ( CLEAR ?auto_167179 ) ( HAND-EMPTY ) ( not ( = ?auto_167174 ?auto_167180 ) ) ( not ( = ?auto_167175 ?auto_167180 ) ) ( not ( = ?auto_167176 ?auto_167180 ) ) ( not ( = ?auto_167177 ?auto_167180 ) ) ( not ( = ?auto_167178 ?auto_167180 ) ) ( not ( = ?auto_167179 ?auto_167180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167179 ?auto_167180 )
      ( MAKE-6PILE ?auto_167174 ?auto_167175 ?auto_167176 ?auto_167177 ?auto_167178 ?auto_167179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167181 - BLOCK
      ?auto_167182 - BLOCK
      ?auto_167183 - BLOCK
      ?auto_167184 - BLOCK
      ?auto_167185 - BLOCK
      ?auto_167186 - BLOCK
    )
    :vars
    (
      ?auto_167187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167181 ) ( ON ?auto_167182 ?auto_167181 ) ( ON ?auto_167183 ?auto_167182 ) ( ON ?auto_167184 ?auto_167183 ) ( not ( = ?auto_167181 ?auto_167182 ) ) ( not ( = ?auto_167181 ?auto_167183 ) ) ( not ( = ?auto_167181 ?auto_167184 ) ) ( not ( = ?auto_167181 ?auto_167185 ) ) ( not ( = ?auto_167181 ?auto_167186 ) ) ( not ( = ?auto_167182 ?auto_167183 ) ) ( not ( = ?auto_167182 ?auto_167184 ) ) ( not ( = ?auto_167182 ?auto_167185 ) ) ( not ( = ?auto_167182 ?auto_167186 ) ) ( not ( = ?auto_167183 ?auto_167184 ) ) ( not ( = ?auto_167183 ?auto_167185 ) ) ( not ( = ?auto_167183 ?auto_167186 ) ) ( not ( = ?auto_167184 ?auto_167185 ) ) ( not ( = ?auto_167184 ?auto_167186 ) ) ( not ( = ?auto_167185 ?auto_167186 ) ) ( ON ?auto_167186 ?auto_167187 ) ( CLEAR ?auto_167186 ) ( not ( = ?auto_167181 ?auto_167187 ) ) ( not ( = ?auto_167182 ?auto_167187 ) ) ( not ( = ?auto_167183 ?auto_167187 ) ) ( not ( = ?auto_167184 ?auto_167187 ) ) ( not ( = ?auto_167185 ?auto_167187 ) ) ( not ( = ?auto_167186 ?auto_167187 ) ) ( HOLDING ?auto_167185 ) ( CLEAR ?auto_167184 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167181 ?auto_167182 ?auto_167183 ?auto_167184 ?auto_167185 )
      ( MAKE-6PILE ?auto_167181 ?auto_167182 ?auto_167183 ?auto_167184 ?auto_167185 ?auto_167186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167188 - BLOCK
      ?auto_167189 - BLOCK
      ?auto_167190 - BLOCK
      ?auto_167191 - BLOCK
      ?auto_167192 - BLOCK
      ?auto_167193 - BLOCK
    )
    :vars
    (
      ?auto_167194 - BLOCK
      ?auto_167195 - BLOCK
      ?auto_167196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167188 ) ( ON ?auto_167189 ?auto_167188 ) ( ON ?auto_167190 ?auto_167189 ) ( ON ?auto_167191 ?auto_167190 ) ( not ( = ?auto_167188 ?auto_167189 ) ) ( not ( = ?auto_167188 ?auto_167190 ) ) ( not ( = ?auto_167188 ?auto_167191 ) ) ( not ( = ?auto_167188 ?auto_167192 ) ) ( not ( = ?auto_167188 ?auto_167193 ) ) ( not ( = ?auto_167189 ?auto_167190 ) ) ( not ( = ?auto_167189 ?auto_167191 ) ) ( not ( = ?auto_167189 ?auto_167192 ) ) ( not ( = ?auto_167189 ?auto_167193 ) ) ( not ( = ?auto_167190 ?auto_167191 ) ) ( not ( = ?auto_167190 ?auto_167192 ) ) ( not ( = ?auto_167190 ?auto_167193 ) ) ( not ( = ?auto_167191 ?auto_167192 ) ) ( not ( = ?auto_167191 ?auto_167193 ) ) ( not ( = ?auto_167192 ?auto_167193 ) ) ( ON ?auto_167193 ?auto_167194 ) ( not ( = ?auto_167188 ?auto_167194 ) ) ( not ( = ?auto_167189 ?auto_167194 ) ) ( not ( = ?auto_167190 ?auto_167194 ) ) ( not ( = ?auto_167191 ?auto_167194 ) ) ( not ( = ?auto_167192 ?auto_167194 ) ) ( not ( = ?auto_167193 ?auto_167194 ) ) ( CLEAR ?auto_167191 ) ( ON ?auto_167192 ?auto_167193 ) ( CLEAR ?auto_167192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167195 ) ( ON ?auto_167196 ?auto_167195 ) ( ON ?auto_167194 ?auto_167196 ) ( not ( = ?auto_167195 ?auto_167196 ) ) ( not ( = ?auto_167195 ?auto_167194 ) ) ( not ( = ?auto_167195 ?auto_167193 ) ) ( not ( = ?auto_167195 ?auto_167192 ) ) ( not ( = ?auto_167196 ?auto_167194 ) ) ( not ( = ?auto_167196 ?auto_167193 ) ) ( not ( = ?auto_167196 ?auto_167192 ) ) ( not ( = ?auto_167188 ?auto_167195 ) ) ( not ( = ?auto_167188 ?auto_167196 ) ) ( not ( = ?auto_167189 ?auto_167195 ) ) ( not ( = ?auto_167189 ?auto_167196 ) ) ( not ( = ?auto_167190 ?auto_167195 ) ) ( not ( = ?auto_167190 ?auto_167196 ) ) ( not ( = ?auto_167191 ?auto_167195 ) ) ( not ( = ?auto_167191 ?auto_167196 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167195 ?auto_167196 ?auto_167194 ?auto_167193 )
      ( MAKE-6PILE ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 ?auto_167192 ?auto_167193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167197 - BLOCK
      ?auto_167198 - BLOCK
      ?auto_167199 - BLOCK
      ?auto_167200 - BLOCK
      ?auto_167201 - BLOCK
      ?auto_167202 - BLOCK
    )
    :vars
    (
      ?auto_167203 - BLOCK
      ?auto_167205 - BLOCK
      ?auto_167204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167197 ) ( ON ?auto_167198 ?auto_167197 ) ( ON ?auto_167199 ?auto_167198 ) ( not ( = ?auto_167197 ?auto_167198 ) ) ( not ( = ?auto_167197 ?auto_167199 ) ) ( not ( = ?auto_167197 ?auto_167200 ) ) ( not ( = ?auto_167197 ?auto_167201 ) ) ( not ( = ?auto_167197 ?auto_167202 ) ) ( not ( = ?auto_167198 ?auto_167199 ) ) ( not ( = ?auto_167198 ?auto_167200 ) ) ( not ( = ?auto_167198 ?auto_167201 ) ) ( not ( = ?auto_167198 ?auto_167202 ) ) ( not ( = ?auto_167199 ?auto_167200 ) ) ( not ( = ?auto_167199 ?auto_167201 ) ) ( not ( = ?auto_167199 ?auto_167202 ) ) ( not ( = ?auto_167200 ?auto_167201 ) ) ( not ( = ?auto_167200 ?auto_167202 ) ) ( not ( = ?auto_167201 ?auto_167202 ) ) ( ON ?auto_167202 ?auto_167203 ) ( not ( = ?auto_167197 ?auto_167203 ) ) ( not ( = ?auto_167198 ?auto_167203 ) ) ( not ( = ?auto_167199 ?auto_167203 ) ) ( not ( = ?auto_167200 ?auto_167203 ) ) ( not ( = ?auto_167201 ?auto_167203 ) ) ( not ( = ?auto_167202 ?auto_167203 ) ) ( ON ?auto_167201 ?auto_167202 ) ( CLEAR ?auto_167201 ) ( ON-TABLE ?auto_167205 ) ( ON ?auto_167204 ?auto_167205 ) ( ON ?auto_167203 ?auto_167204 ) ( not ( = ?auto_167205 ?auto_167204 ) ) ( not ( = ?auto_167205 ?auto_167203 ) ) ( not ( = ?auto_167205 ?auto_167202 ) ) ( not ( = ?auto_167205 ?auto_167201 ) ) ( not ( = ?auto_167204 ?auto_167203 ) ) ( not ( = ?auto_167204 ?auto_167202 ) ) ( not ( = ?auto_167204 ?auto_167201 ) ) ( not ( = ?auto_167197 ?auto_167205 ) ) ( not ( = ?auto_167197 ?auto_167204 ) ) ( not ( = ?auto_167198 ?auto_167205 ) ) ( not ( = ?auto_167198 ?auto_167204 ) ) ( not ( = ?auto_167199 ?auto_167205 ) ) ( not ( = ?auto_167199 ?auto_167204 ) ) ( not ( = ?auto_167200 ?auto_167205 ) ) ( not ( = ?auto_167200 ?auto_167204 ) ) ( HOLDING ?auto_167200 ) ( CLEAR ?auto_167199 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167197 ?auto_167198 ?auto_167199 ?auto_167200 )
      ( MAKE-6PILE ?auto_167197 ?auto_167198 ?auto_167199 ?auto_167200 ?auto_167201 ?auto_167202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167206 - BLOCK
      ?auto_167207 - BLOCK
      ?auto_167208 - BLOCK
      ?auto_167209 - BLOCK
      ?auto_167210 - BLOCK
      ?auto_167211 - BLOCK
    )
    :vars
    (
      ?auto_167213 - BLOCK
      ?auto_167214 - BLOCK
      ?auto_167212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167206 ) ( ON ?auto_167207 ?auto_167206 ) ( ON ?auto_167208 ?auto_167207 ) ( not ( = ?auto_167206 ?auto_167207 ) ) ( not ( = ?auto_167206 ?auto_167208 ) ) ( not ( = ?auto_167206 ?auto_167209 ) ) ( not ( = ?auto_167206 ?auto_167210 ) ) ( not ( = ?auto_167206 ?auto_167211 ) ) ( not ( = ?auto_167207 ?auto_167208 ) ) ( not ( = ?auto_167207 ?auto_167209 ) ) ( not ( = ?auto_167207 ?auto_167210 ) ) ( not ( = ?auto_167207 ?auto_167211 ) ) ( not ( = ?auto_167208 ?auto_167209 ) ) ( not ( = ?auto_167208 ?auto_167210 ) ) ( not ( = ?auto_167208 ?auto_167211 ) ) ( not ( = ?auto_167209 ?auto_167210 ) ) ( not ( = ?auto_167209 ?auto_167211 ) ) ( not ( = ?auto_167210 ?auto_167211 ) ) ( ON ?auto_167211 ?auto_167213 ) ( not ( = ?auto_167206 ?auto_167213 ) ) ( not ( = ?auto_167207 ?auto_167213 ) ) ( not ( = ?auto_167208 ?auto_167213 ) ) ( not ( = ?auto_167209 ?auto_167213 ) ) ( not ( = ?auto_167210 ?auto_167213 ) ) ( not ( = ?auto_167211 ?auto_167213 ) ) ( ON ?auto_167210 ?auto_167211 ) ( ON-TABLE ?auto_167214 ) ( ON ?auto_167212 ?auto_167214 ) ( ON ?auto_167213 ?auto_167212 ) ( not ( = ?auto_167214 ?auto_167212 ) ) ( not ( = ?auto_167214 ?auto_167213 ) ) ( not ( = ?auto_167214 ?auto_167211 ) ) ( not ( = ?auto_167214 ?auto_167210 ) ) ( not ( = ?auto_167212 ?auto_167213 ) ) ( not ( = ?auto_167212 ?auto_167211 ) ) ( not ( = ?auto_167212 ?auto_167210 ) ) ( not ( = ?auto_167206 ?auto_167214 ) ) ( not ( = ?auto_167206 ?auto_167212 ) ) ( not ( = ?auto_167207 ?auto_167214 ) ) ( not ( = ?auto_167207 ?auto_167212 ) ) ( not ( = ?auto_167208 ?auto_167214 ) ) ( not ( = ?auto_167208 ?auto_167212 ) ) ( not ( = ?auto_167209 ?auto_167214 ) ) ( not ( = ?auto_167209 ?auto_167212 ) ) ( CLEAR ?auto_167208 ) ( ON ?auto_167209 ?auto_167210 ) ( CLEAR ?auto_167209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167214 ?auto_167212 ?auto_167213 ?auto_167211 ?auto_167210 )
      ( MAKE-6PILE ?auto_167206 ?auto_167207 ?auto_167208 ?auto_167209 ?auto_167210 ?auto_167211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167215 - BLOCK
      ?auto_167216 - BLOCK
      ?auto_167217 - BLOCK
      ?auto_167218 - BLOCK
      ?auto_167219 - BLOCK
      ?auto_167220 - BLOCK
    )
    :vars
    (
      ?auto_167222 - BLOCK
      ?auto_167223 - BLOCK
      ?auto_167221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167215 ) ( ON ?auto_167216 ?auto_167215 ) ( not ( = ?auto_167215 ?auto_167216 ) ) ( not ( = ?auto_167215 ?auto_167217 ) ) ( not ( = ?auto_167215 ?auto_167218 ) ) ( not ( = ?auto_167215 ?auto_167219 ) ) ( not ( = ?auto_167215 ?auto_167220 ) ) ( not ( = ?auto_167216 ?auto_167217 ) ) ( not ( = ?auto_167216 ?auto_167218 ) ) ( not ( = ?auto_167216 ?auto_167219 ) ) ( not ( = ?auto_167216 ?auto_167220 ) ) ( not ( = ?auto_167217 ?auto_167218 ) ) ( not ( = ?auto_167217 ?auto_167219 ) ) ( not ( = ?auto_167217 ?auto_167220 ) ) ( not ( = ?auto_167218 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167220 ) ) ( not ( = ?auto_167219 ?auto_167220 ) ) ( ON ?auto_167220 ?auto_167222 ) ( not ( = ?auto_167215 ?auto_167222 ) ) ( not ( = ?auto_167216 ?auto_167222 ) ) ( not ( = ?auto_167217 ?auto_167222 ) ) ( not ( = ?auto_167218 ?auto_167222 ) ) ( not ( = ?auto_167219 ?auto_167222 ) ) ( not ( = ?auto_167220 ?auto_167222 ) ) ( ON ?auto_167219 ?auto_167220 ) ( ON-TABLE ?auto_167223 ) ( ON ?auto_167221 ?auto_167223 ) ( ON ?auto_167222 ?auto_167221 ) ( not ( = ?auto_167223 ?auto_167221 ) ) ( not ( = ?auto_167223 ?auto_167222 ) ) ( not ( = ?auto_167223 ?auto_167220 ) ) ( not ( = ?auto_167223 ?auto_167219 ) ) ( not ( = ?auto_167221 ?auto_167222 ) ) ( not ( = ?auto_167221 ?auto_167220 ) ) ( not ( = ?auto_167221 ?auto_167219 ) ) ( not ( = ?auto_167215 ?auto_167223 ) ) ( not ( = ?auto_167215 ?auto_167221 ) ) ( not ( = ?auto_167216 ?auto_167223 ) ) ( not ( = ?auto_167216 ?auto_167221 ) ) ( not ( = ?auto_167217 ?auto_167223 ) ) ( not ( = ?auto_167217 ?auto_167221 ) ) ( not ( = ?auto_167218 ?auto_167223 ) ) ( not ( = ?auto_167218 ?auto_167221 ) ) ( ON ?auto_167218 ?auto_167219 ) ( CLEAR ?auto_167218 ) ( HOLDING ?auto_167217 ) ( CLEAR ?auto_167216 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167215 ?auto_167216 ?auto_167217 )
      ( MAKE-6PILE ?auto_167215 ?auto_167216 ?auto_167217 ?auto_167218 ?auto_167219 ?auto_167220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167224 - BLOCK
      ?auto_167225 - BLOCK
      ?auto_167226 - BLOCK
      ?auto_167227 - BLOCK
      ?auto_167228 - BLOCK
      ?auto_167229 - BLOCK
    )
    :vars
    (
      ?auto_167231 - BLOCK
      ?auto_167232 - BLOCK
      ?auto_167230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167224 ) ( ON ?auto_167225 ?auto_167224 ) ( not ( = ?auto_167224 ?auto_167225 ) ) ( not ( = ?auto_167224 ?auto_167226 ) ) ( not ( = ?auto_167224 ?auto_167227 ) ) ( not ( = ?auto_167224 ?auto_167228 ) ) ( not ( = ?auto_167224 ?auto_167229 ) ) ( not ( = ?auto_167225 ?auto_167226 ) ) ( not ( = ?auto_167225 ?auto_167227 ) ) ( not ( = ?auto_167225 ?auto_167228 ) ) ( not ( = ?auto_167225 ?auto_167229 ) ) ( not ( = ?auto_167226 ?auto_167227 ) ) ( not ( = ?auto_167226 ?auto_167228 ) ) ( not ( = ?auto_167226 ?auto_167229 ) ) ( not ( = ?auto_167227 ?auto_167228 ) ) ( not ( = ?auto_167227 ?auto_167229 ) ) ( not ( = ?auto_167228 ?auto_167229 ) ) ( ON ?auto_167229 ?auto_167231 ) ( not ( = ?auto_167224 ?auto_167231 ) ) ( not ( = ?auto_167225 ?auto_167231 ) ) ( not ( = ?auto_167226 ?auto_167231 ) ) ( not ( = ?auto_167227 ?auto_167231 ) ) ( not ( = ?auto_167228 ?auto_167231 ) ) ( not ( = ?auto_167229 ?auto_167231 ) ) ( ON ?auto_167228 ?auto_167229 ) ( ON-TABLE ?auto_167232 ) ( ON ?auto_167230 ?auto_167232 ) ( ON ?auto_167231 ?auto_167230 ) ( not ( = ?auto_167232 ?auto_167230 ) ) ( not ( = ?auto_167232 ?auto_167231 ) ) ( not ( = ?auto_167232 ?auto_167229 ) ) ( not ( = ?auto_167232 ?auto_167228 ) ) ( not ( = ?auto_167230 ?auto_167231 ) ) ( not ( = ?auto_167230 ?auto_167229 ) ) ( not ( = ?auto_167230 ?auto_167228 ) ) ( not ( = ?auto_167224 ?auto_167232 ) ) ( not ( = ?auto_167224 ?auto_167230 ) ) ( not ( = ?auto_167225 ?auto_167232 ) ) ( not ( = ?auto_167225 ?auto_167230 ) ) ( not ( = ?auto_167226 ?auto_167232 ) ) ( not ( = ?auto_167226 ?auto_167230 ) ) ( not ( = ?auto_167227 ?auto_167232 ) ) ( not ( = ?auto_167227 ?auto_167230 ) ) ( ON ?auto_167227 ?auto_167228 ) ( CLEAR ?auto_167225 ) ( ON ?auto_167226 ?auto_167227 ) ( CLEAR ?auto_167226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167232 ?auto_167230 ?auto_167231 ?auto_167229 ?auto_167228 ?auto_167227 )
      ( MAKE-6PILE ?auto_167224 ?auto_167225 ?auto_167226 ?auto_167227 ?auto_167228 ?auto_167229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167233 - BLOCK
      ?auto_167234 - BLOCK
      ?auto_167235 - BLOCK
      ?auto_167236 - BLOCK
      ?auto_167237 - BLOCK
      ?auto_167238 - BLOCK
    )
    :vars
    (
      ?auto_167239 - BLOCK
      ?auto_167241 - BLOCK
      ?auto_167240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167233 ) ( not ( = ?auto_167233 ?auto_167234 ) ) ( not ( = ?auto_167233 ?auto_167235 ) ) ( not ( = ?auto_167233 ?auto_167236 ) ) ( not ( = ?auto_167233 ?auto_167237 ) ) ( not ( = ?auto_167233 ?auto_167238 ) ) ( not ( = ?auto_167234 ?auto_167235 ) ) ( not ( = ?auto_167234 ?auto_167236 ) ) ( not ( = ?auto_167234 ?auto_167237 ) ) ( not ( = ?auto_167234 ?auto_167238 ) ) ( not ( = ?auto_167235 ?auto_167236 ) ) ( not ( = ?auto_167235 ?auto_167237 ) ) ( not ( = ?auto_167235 ?auto_167238 ) ) ( not ( = ?auto_167236 ?auto_167237 ) ) ( not ( = ?auto_167236 ?auto_167238 ) ) ( not ( = ?auto_167237 ?auto_167238 ) ) ( ON ?auto_167238 ?auto_167239 ) ( not ( = ?auto_167233 ?auto_167239 ) ) ( not ( = ?auto_167234 ?auto_167239 ) ) ( not ( = ?auto_167235 ?auto_167239 ) ) ( not ( = ?auto_167236 ?auto_167239 ) ) ( not ( = ?auto_167237 ?auto_167239 ) ) ( not ( = ?auto_167238 ?auto_167239 ) ) ( ON ?auto_167237 ?auto_167238 ) ( ON-TABLE ?auto_167241 ) ( ON ?auto_167240 ?auto_167241 ) ( ON ?auto_167239 ?auto_167240 ) ( not ( = ?auto_167241 ?auto_167240 ) ) ( not ( = ?auto_167241 ?auto_167239 ) ) ( not ( = ?auto_167241 ?auto_167238 ) ) ( not ( = ?auto_167241 ?auto_167237 ) ) ( not ( = ?auto_167240 ?auto_167239 ) ) ( not ( = ?auto_167240 ?auto_167238 ) ) ( not ( = ?auto_167240 ?auto_167237 ) ) ( not ( = ?auto_167233 ?auto_167241 ) ) ( not ( = ?auto_167233 ?auto_167240 ) ) ( not ( = ?auto_167234 ?auto_167241 ) ) ( not ( = ?auto_167234 ?auto_167240 ) ) ( not ( = ?auto_167235 ?auto_167241 ) ) ( not ( = ?auto_167235 ?auto_167240 ) ) ( not ( = ?auto_167236 ?auto_167241 ) ) ( not ( = ?auto_167236 ?auto_167240 ) ) ( ON ?auto_167236 ?auto_167237 ) ( ON ?auto_167235 ?auto_167236 ) ( CLEAR ?auto_167235 ) ( HOLDING ?auto_167234 ) ( CLEAR ?auto_167233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167233 ?auto_167234 )
      ( MAKE-6PILE ?auto_167233 ?auto_167234 ?auto_167235 ?auto_167236 ?auto_167237 ?auto_167238 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167242 - BLOCK
      ?auto_167243 - BLOCK
      ?auto_167244 - BLOCK
      ?auto_167245 - BLOCK
      ?auto_167246 - BLOCK
      ?auto_167247 - BLOCK
    )
    :vars
    (
      ?auto_167248 - BLOCK
      ?auto_167249 - BLOCK
      ?auto_167250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167242 ) ( not ( = ?auto_167242 ?auto_167243 ) ) ( not ( = ?auto_167242 ?auto_167244 ) ) ( not ( = ?auto_167242 ?auto_167245 ) ) ( not ( = ?auto_167242 ?auto_167246 ) ) ( not ( = ?auto_167242 ?auto_167247 ) ) ( not ( = ?auto_167243 ?auto_167244 ) ) ( not ( = ?auto_167243 ?auto_167245 ) ) ( not ( = ?auto_167243 ?auto_167246 ) ) ( not ( = ?auto_167243 ?auto_167247 ) ) ( not ( = ?auto_167244 ?auto_167245 ) ) ( not ( = ?auto_167244 ?auto_167246 ) ) ( not ( = ?auto_167244 ?auto_167247 ) ) ( not ( = ?auto_167245 ?auto_167246 ) ) ( not ( = ?auto_167245 ?auto_167247 ) ) ( not ( = ?auto_167246 ?auto_167247 ) ) ( ON ?auto_167247 ?auto_167248 ) ( not ( = ?auto_167242 ?auto_167248 ) ) ( not ( = ?auto_167243 ?auto_167248 ) ) ( not ( = ?auto_167244 ?auto_167248 ) ) ( not ( = ?auto_167245 ?auto_167248 ) ) ( not ( = ?auto_167246 ?auto_167248 ) ) ( not ( = ?auto_167247 ?auto_167248 ) ) ( ON ?auto_167246 ?auto_167247 ) ( ON-TABLE ?auto_167249 ) ( ON ?auto_167250 ?auto_167249 ) ( ON ?auto_167248 ?auto_167250 ) ( not ( = ?auto_167249 ?auto_167250 ) ) ( not ( = ?auto_167249 ?auto_167248 ) ) ( not ( = ?auto_167249 ?auto_167247 ) ) ( not ( = ?auto_167249 ?auto_167246 ) ) ( not ( = ?auto_167250 ?auto_167248 ) ) ( not ( = ?auto_167250 ?auto_167247 ) ) ( not ( = ?auto_167250 ?auto_167246 ) ) ( not ( = ?auto_167242 ?auto_167249 ) ) ( not ( = ?auto_167242 ?auto_167250 ) ) ( not ( = ?auto_167243 ?auto_167249 ) ) ( not ( = ?auto_167243 ?auto_167250 ) ) ( not ( = ?auto_167244 ?auto_167249 ) ) ( not ( = ?auto_167244 ?auto_167250 ) ) ( not ( = ?auto_167245 ?auto_167249 ) ) ( not ( = ?auto_167245 ?auto_167250 ) ) ( ON ?auto_167245 ?auto_167246 ) ( ON ?auto_167244 ?auto_167245 ) ( CLEAR ?auto_167242 ) ( ON ?auto_167243 ?auto_167244 ) ( CLEAR ?auto_167243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167249 ?auto_167250 ?auto_167248 ?auto_167247 ?auto_167246 ?auto_167245 ?auto_167244 )
      ( MAKE-6PILE ?auto_167242 ?auto_167243 ?auto_167244 ?auto_167245 ?auto_167246 ?auto_167247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167251 - BLOCK
      ?auto_167252 - BLOCK
      ?auto_167253 - BLOCK
      ?auto_167254 - BLOCK
      ?auto_167255 - BLOCK
      ?auto_167256 - BLOCK
    )
    :vars
    (
      ?auto_167259 - BLOCK
      ?auto_167257 - BLOCK
      ?auto_167258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167251 ?auto_167252 ) ) ( not ( = ?auto_167251 ?auto_167253 ) ) ( not ( = ?auto_167251 ?auto_167254 ) ) ( not ( = ?auto_167251 ?auto_167255 ) ) ( not ( = ?auto_167251 ?auto_167256 ) ) ( not ( = ?auto_167252 ?auto_167253 ) ) ( not ( = ?auto_167252 ?auto_167254 ) ) ( not ( = ?auto_167252 ?auto_167255 ) ) ( not ( = ?auto_167252 ?auto_167256 ) ) ( not ( = ?auto_167253 ?auto_167254 ) ) ( not ( = ?auto_167253 ?auto_167255 ) ) ( not ( = ?auto_167253 ?auto_167256 ) ) ( not ( = ?auto_167254 ?auto_167255 ) ) ( not ( = ?auto_167254 ?auto_167256 ) ) ( not ( = ?auto_167255 ?auto_167256 ) ) ( ON ?auto_167256 ?auto_167259 ) ( not ( = ?auto_167251 ?auto_167259 ) ) ( not ( = ?auto_167252 ?auto_167259 ) ) ( not ( = ?auto_167253 ?auto_167259 ) ) ( not ( = ?auto_167254 ?auto_167259 ) ) ( not ( = ?auto_167255 ?auto_167259 ) ) ( not ( = ?auto_167256 ?auto_167259 ) ) ( ON ?auto_167255 ?auto_167256 ) ( ON-TABLE ?auto_167257 ) ( ON ?auto_167258 ?auto_167257 ) ( ON ?auto_167259 ?auto_167258 ) ( not ( = ?auto_167257 ?auto_167258 ) ) ( not ( = ?auto_167257 ?auto_167259 ) ) ( not ( = ?auto_167257 ?auto_167256 ) ) ( not ( = ?auto_167257 ?auto_167255 ) ) ( not ( = ?auto_167258 ?auto_167259 ) ) ( not ( = ?auto_167258 ?auto_167256 ) ) ( not ( = ?auto_167258 ?auto_167255 ) ) ( not ( = ?auto_167251 ?auto_167257 ) ) ( not ( = ?auto_167251 ?auto_167258 ) ) ( not ( = ?auto_167252 ?auto_167257 ) ) ( not ( = ?auto_167252 ?auto_167258 ) ) ( not ( = ?auto_167253 ?auto_167257 ) ) ( not ( = ?auto_167253 ?auto_167258 ) ) ( not ( = ?auto_167254 ?auto_167257 ) ) ( not ( = ?auto_167254 ?auto_167258 ) ) ( ON ?auto_167254 ?auto_167255 ) ( ON ?auto_167253 ?auto_167254 ) ( ON ?auto_167252 ?auto_167253 ) ( CLEAR ?auto_167252 ) ( HOLDING ?auto_167251 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167251 )
      ( MAKE-6PILE ?auto_167251 ?auto_167252 ?auto_167253 ?auto_167254 ?auto_167255 ?auto_167256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167260 - BLOCK
      ?auto_167261 - BLOCK
      ?auto_167262 - BLOCK
      ?auto_167263 - BLOCK
      ?auto_167264 - BLOCK
      ?auto_167265 - BLOCK
    )
    :vars
    (
      ?auto_167266 - BLOCK
      ?auto_167267 - BLOCK
      ?auto_167268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167260 ?auto_167261 ) ) ( not ( = ?auto_167260 ?auto_167262 ) ) ( not ( = ?auto_167260 ?auto_167263 ) ) ( not ( = ?auto_167260 ?auto_167264 ) ) ( not ( = ?auto_167260 ?auto_167265 ) ) ( not ( = ?auto_167261 ?auto_167262 ) ) ( not ( = ?auto_167261 ?auto_167263 ) ) ( not ( = ?auto_167261 ?auto_167264 ) ) ( not ( = ?auto_167261 ?auto_167265 ) ) ( not ( = ?auto_167262 ?auto_167263 ) ) ( not ( = ?auto_167262 ?auto_167264 ) ) ( not ( = ?auto_167262 ?auto_167265 ) ) ( not ( = ?auto_167263 ?auto_167264 ) ) ( not ( = ?auto_167263 ?auto_167265 ) ) ( not ( = ?auto_167264 ?auto_167265 ) ) ( ON ?auto_167265 ?auto_167266 ) ( not ( = ?auto_167260 ?auto_167266 ) ) ( not ( = ?auto_167261 ?auto_167266 ) ) ( not ( = ?auto_167262 ?auto_167266 ) ) ( not ( = ?auto_167263 ?auto_167266 ) ) ( not ( = ?auto_167264 ?auto_167266 ) ) ( not ( = ?auto_167265 ?auto_167266 ) ) ( ON ?auto_167264 ?auto_167265 ) ( ON-TABLE ?auto_167267 ) ( ON ?auto_167268 ?auto_167267 ) ( ON ?auto_167266 ?auto_167268 ) ( not ( = ?auto_167267 ?auto_167268 ) ) ( not ( = ?auto_167267 ?auto_167266 ) ) ( not ( = ?auto_167267 ?auto_167265 ) ) ( not ( = ?auto_167267 ?auto_167264 ) ) ( not ( = ?auto_167268 ?auto_167266 ) ) ( not ( = ?auto_167268 ?auto_167265 ) ) ( not ( = ?auto_167268 ?auto_167264 ) ) ( not ( = ?auto_167260 ?auto_167267 ) ) ( not ( = ?auto_167260 ?auto_167268 ) ) ( not ( = ?auto_167261 ?auto_167267 ) ) ( not ( = ?auto_167261 ?auto_167268 ) ) ( not ( = ?auto_167262 ?auto_167267 ) ) ( not ( = ?auto_167262 ?auto_167268 ) ) ( not ( = ?auto_167263 ?auto_167267 ) ) ( not ( = ?auto_167263 ?auto_167268 ) ) ( ON ?auto_167263 ?auto_167264 ) ( ON ?auto_167262 ?auto_167263 ) ( ON ?auto_167261 ?auto_167262 ) ( ON ?auto_167260 ?auto_167261 ) ( CLEAR ?auto_167260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167267 ?auto_167268 ?auto_167266 ?auto_167265 ?auto_167264 ?auto_167263 ?auto_167262 ?auto_167261 )
      ( MAKE-6PILE ?auto_167260 ?auto_167261 ?auto_167262 ?auto_167263 ?auto_167264 ?auto_167265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167271 - BLOCK
      ?auto_167272 - BLOCK
    )
    :vars
    (
      ?auto_167273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167273 ?auto_167272 ) ( CLEAR ?auto_167273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167271 ) ( ON ?auto_167272 ?auto_167271 ) ( not ( = ?auto_167271 ?auto_167272 ) ) ( not ( = ?auto_167271 ?auto_167273 ) ) ( not ( = ?auto_167272 ?auto_167273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167273 ?auto_167272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167274 - BLOCK
      ?auto_167275 - BLOCK
    )
    :vars
    (
      ?auto_167276 - BLOCK
      ?auto_167277 - BLOCK
      ?auto_167278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167276 ?auto_167275 ) ( CLEAR ?auto_167276 ) ( ON-TABLE ?auto_167274 ) ( ON ?auto_167275 ?auto_167274 ) ( not ( = ?auto_167274 ?auto_167275 ) ) ( not ( = ?auto_167274 ?auto_167276 ) ) ( not ( = ?auto_167275 ?auto_167276 ) ) ( HOLDING ?auto_167277 ) ( CLEAR ?auto_167278 ) ( not ( = ?auto_167274 ?auto_167277 ) ) ( not ( = ?auto_167274 ?auto_167278 ) ) ( not ( = ?auto_167275 ?auto_167277 ) ) ( not ( = ?auto_167275 ?auto_167278 ) ) ( not ( = ?auto_167276 ?auto_167277 ) ) ( not ( = ?auto_167276 ?auto_167278 ) ) ( not ( = ?auto_167277 ?auto_167278 ) ) )
    :subtasks
    ( ( !STACK ?auto_167277 ?auto_167278 )
      ( MAKE-2PILE ?auto_167274 ?auto_167275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167279 - BLOCK
      ?auto_167280 - BLOCK
    )
    :vars
    (
      ?auto_167282 - BLOCK
      ?auto_167283 - BLOCK
      ?auto_167281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167282 ?auto_167280 ) ( ON-TABLE ?auto_167279 ) ( ON ?auto_167280 ?auto_167279 ) ( not ( = ?auto_167279 ?auto_167280 ) ) ( not ( = ?auto_167279 ?auto_167282 ) ) ( not ( = ?auto_167280 ?auto_167282 ) ) ( CLEAR ?auto_167283 ) ( not ( = ?auto_167279 ?auto_167281 ) ) ( not ( = ?auto_167279 ?auto_167283 ) ) ( not ( = ?auto_167280 ?auto_167281 ) ) ( not ( = ?auto_167280 ?auto_167283 ) ) ( not ( = ?auto_167282 ?auto_167281 ) ) ( not ( = ?auto_167282 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( ON ?auto_167281 ?auto_167282 ) ( CLEAR ?auto_167281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167279 ?auto_167280 ?auto_167282 )
      ( MAKE-2PILE ?auto_167279 ?auto_167280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167284 - BLOCK
      ?auto_167285 - BLOCK
    )
    :vars
    (
      ?auto_167286 - BLOCK
      ?auto_167287 - BLOCK
      ?auto_167288 - BLOCK
      ?auto_167289 - BLOCK
      ?auto_167290 - BLOCK
      ?auto_167291 - BLOCK
      ?auto_167292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167286 ?auto_167285 ) ( ON-TABLE ?auto_167284 ) ( ON ?auto_167285 ?auto_167284 ) ( not ( = ?auto_167284 ?auto_167285 ) ) ( not ( = ?auto_167284 ?auto_167286 ) ) ( not ( = ?auto_167285 ?auto_167286 ) ) ( not ( = ?auto_167284 ?auto_167287 ) ) ( not ( = ?auto_167284 ?auto_167288 ) ) ( not ( = ?auto_167285 ?auto_167287 ) ) ( not ( = ?auto_167285 ?auto_167288 ) ) ( not ( = ?auto_167286 ?auto_167287 ) ) ( not ( = ?auto_167286 ?auto_167288 ) ) ( not ( = ?auto_167287 ?auto_167288 ) ) ( ON ?auto_167287 ?auto_167286 ) ( CLEAR ?auto_167287 ) ( HOLDING ?auto_167288 ) ( CLEAR ?auto_167289 ) ( ON-TABLE ?auto_167290 ) ( ON ?auto_167291 ?auto_167290 ) ( ON ?auto_167292 ?auto_167291 ) ( ON ?auto_167289 ?auto_167292 ) ( not ( = ?auto_167290 ?auto_167291 ) ) ( not ( = ?auto_167290 ?auto_167292 ) ) ( not ( = ?auto_167290 ?auto_167289 ) ) ( not ( = ?auto_167290 ?auto_167288 ) ) ( not ( = ?auto_167291 ?auto_167292 ) ) ( not ( = ?auto_167291 ?auto_167289 ) ) ( not ( = ?auto_167291 ?auto_167288 ) ) ( not ( = ?auto_167292 ?auto_167289 ) ) ( not ( = ?auto_167292 ?auto_167288 ) ) ( not ( = ?auto_167289 ?auto_167288 ) ) ( not ( = ?auto_167284 ?auto_167289 ) ) ( not ( = ?auto_167284 ?auto_167290 ) ) ( not ( = ?auto_167284 ?auto_167291 ) ) ( not ( = ?auto_167284 ?auto_167292 ) ) ( not ( = ?auto_167285 ?auto_167289 ) ) ( not ( = ?auto_167285 ?auto_167290 ) ) ( not ( = ?auto_167285 ?auto_167291 ) ) ( not ( = ?auto_167285 ?auto_167292 ) ) ( not ( = ?auto_167286 ?auto_167289 ) ) ( not ( = ?auto_167286 ?auto_167290 ) ) ( not ( = ?auto_167286 ?auto_167291 ) ) ( not ( = ?auto_167286 ?auto_167292 ) ) ( not ( = ?auto_167287 ?auto_167289 ) ) ( not ( = ?auto_167287 ?auto_167290 ) ) ( not ( = ?auto_167287 ?auto_167291 ) ) ( not ( = ?auto_167287 ?auto_167292 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167290 ?auto_167291 ?auto_167292 ?auto_167289 ?auto_167288 )
      ( MAKE-2PILE ?auto_167284 ?auto_167285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167293 - BLOCK
      ?auto_167294 - BLOCK
    )
    :vars
    (
      ?auto_167297 - BLOCK
      ?auto_167299 - BLOCK
      ?auto_167300 - BLOCK
      ?auto_167301 - BLOCK
      ?auto_167295 - BLOCK
      ?auto_167298 - BLOCK
      ?auto_167296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167297 ?auto_167294 ) ( ON-TABLE ?auto_167293 ) ( ON ?auto_167294 ?auto_167293 ) ( not ( = ?auto_167293 ?auto_167294 ) ) ( not ( = ?auto_167293 ?auto_167297 ) ) ( not ( = ?auto_167294 ?auto_167297 ) ) ( not ( = ?auto_167293 ?auto_167299 ) ) ( not ( = ?auto_167293 ?auto_167300 ) ) ( not ( = ?auto_167294 ?auto_167299 ) ) ( not ( = ?auto_167294 ?auto_167300 ) ) ( not ( = ?auto_167297 ?auto_167299 ) ) ( not ( = ?auto_167297 ?auto_167300 ) ) ( not ( = ?auto_167299 ?auto_167300 ) ) ( ON ?auto_167299 ?auto_167297 ) ( CLEAR ?auto_167301 ) ( ON-TABLE ?auto_167295 ) ( ON ?auto_167298 ?auto_167295 ) ( ON ?auto_167296 ?auto_167298 ) ( ON ?auto_167301 ?auto_167296 ) ( not ( = ?auto_167295 ?auto_167298 ) ) ( not ( = ?auto_167295 ?auto_167296 ) ) ( not ( = ?auto_167295 ?auto_167301 ) ) ( not ( = ?auto_167295 ?auto_167300 ) ) ( not ( = ?auto_167298 ?auto_167296 ) ) ( not ( = ?auto_167298 ?auto_167301 ) ) ( not ( = ?auto_167298 ?auto_167300 ) ) ( not ( = ?auto_167296 ?auto_167301 ) ) ( not ( = ?auto_167296 ?auto_167300 ) ) ( not ( = ?auto_167301 ?auto_167300 ) ) ( not ( = ?auto_167293 ?auto_167301 ) ) ( not ( = ?auto_167293 ?auto_167295 ) ) ( not ( = ?auto_167293 ?auto_167298 ) ) ( not ( = ?auto_167293 ?auto_167296 ) ) ( not ( = ?auto_167294 ?auto_167301 ) ) ( not ( = ?auto_167294 ?auto_167295 ) ) ( not ( = ?auto_167294 ?auto_167298 ) ) ( not ( = ?auto_167294 ?auto_167296 ) ) ( not ( = ?auto_167297 ?auto_167301 ) ) ( not ( = ?auto_167297 ?auto_167295 ) ) ( not ( = ?auto_167297 ?auto_167298 ) ) ( not ( = ?auto_167297 ?auto_167296 ) ) ( not ( = ?auto_167299 ?auto_167301 ) ) ( not ( = ?auto_167299 ?auto_167295 ) ) ( not ( = ?auto_167299 ?auto_167298 ) ) ( not ( = ?auto_167299 ?auto_167296 ) ) ( ON ?auto_167300 ?auto_167299 ) ( CLEAR ?auto_167300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167293 ?auto_167294 ?auto_167297 ?auto_167299 )
      ( MAKE-2PILE ?auto_167293 ?auto_167294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167302 - BLOCK
      ?auto_167303 - BLOCK
    )
    :vars
    (
      ?auto_167304 - BLOCK
      ?auto_167306 - BLOCK
      ?auto_167307 - BLOCK
      ?auto_167308 - BLOCK
      ?auto_167309 - BLOCK
      ?auto_167310 - BLOCK
      ?auto_167305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167304 ?auto_167303 ) ( ON-TABLE ?auto_167302 ) ( ON ?auto_167303 ?auto_167302 ) ( not ( = ?auto_167302 ?auto_167303 ) ) ( not ( = ?auto_167302 ?auto_167304 ) ) ( not ( = ?auto_167303 ?auto_167304 ) ) ( not ( = ?auto_167302 ?auto_167306 ) ) ( not ( = ?auto_167302 ?auto_167307 ) ) ( not ( = ?auto_167303 ?auto_167306 ) ) ( not ( = ?auto_167303 ?auto_167307 ) ) ( not ( = ?auto_167304 ?auto_167306 ) ) ( not ( = ?auto_167304 ?auto_167307 ) ) ( not ( = ?auto_167306 ?auto_167307 ) ) ( ON ?auto_167306 ?auto_167304 ) ( ON-TABLE ?auto_167308 ) ( ON ?auto_167309 ?auto_167308 ) ( ON ?auto_167310 ?auto_167309 ) ( not ( = ?auto_167308 ?auto_167309 ) ) ( not ( = ?auto_167308 ?auto_167310 ) ) ( not ( = ?auto_167308 ?auto_167305 ) ) ( not ( = ?auto_167308 ?auto_167307 ) ) ( not ( = ?auto_167309 ?auto_167310 ) ) ( not ( = ?auto_167309 ?auto_167305 ) ) ( not ( = ?auto_167309 ?auto_167307 ) ) ( not ( = ?auto_167310 ?auto_167305 ) ) ( not ( = ?auto_167310 ?auto_167307 ) ) ( not ( = ?auto_167305 ?auto_167307 ) ) ( not ( = ?auto_167302 ?auto_167305 ) ) ( not ( = ?auto_167302 ?auto_167308 ) ) ( not ( = ?auto_167302 ?auto_167309 ) ) ( not ( = ?auto_167302 ?auto_167310 ) ) ( not ( = ?auto_167303 ?auto_167305 ) ) ( not ( = ?auto_167303 ?auto_167308 ) ) ( not ( = ?auto_167303 ?auto_167309 ) ) ( not ( = ?auto_167303 ?auto_167310 ) ) ( not ( = ?auto_167304 ?auto_167305 ) ) ( not ( = ?auto_167304 ?auto_167308 ) ) ( not ( = ?auto_167304 ?auto_167309 ) ) ( not ( = ?auto_167304 ?auto_167310 ) ) ( not ( = ?auto_167306 ?auto_167305 ) ) ( not ( = ?auto_167306 ?auto_167308 ) ) ( not ( = ?auto_167306 ?auto_167309 ) ) ( not ( = ?auto_167306 ?auto_167310 ) ) ( ON ?auto_167307 ?auto_167306 ) ( CLEAR ?auto_167307 ) ( HOLDING ?auto_167305 ) ( CLEAR ?auto_167310 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167308 ?auto_167309 ?auto_167310 ?auto_167305 )
      ( MAKE-2PILE ?auto_167302 ?auto_167303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167311 - BLOCK
      ?auto_167312 - BLOCK
    )
    :vars
    (
      ?auto_167314 - BLOCK
      ?auto_167313 - BLOCK
      ?auto_167319 - BLOCK
      ?auto_167316 - BLOCK
      ?auto_167318 - BLOCK
      ?auto_167317 - BLOCK
      ?auto_167315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167314 ?auto_167312 ) ( ON-TABLE ?auto_167311 ) ( ON ?auto_167312 ?auto_167311 ) ( not ( = ?auto_167311 ?auto_167312 ) ) ( not ( = ?auto_167311 ?auto_167314 ) ) ( not ( = ?auto_167312 ?auto_167314 ) ) ( not ( = ?auto_167311 ?auto_167313 ) ) ( not ( = ?auto_167311 ?auto_167319 ) ) ( not ( = ?auto_167312 ?auto_167313 ) ) ( not ( = ?auto_167312 ?auto_167319 ) ) ( not ( = ?auto_167314 ?auto_167313 ) ) ( not ( = ?auto_167314 ?auto_167319 ) ) ( not ( = ?auto_167313 ?auto_167319 ) ) ( ON ?auto_167313 ?auto_167314 ) ( ON-TABLE ?auto_167316 ) ( ON ?auto_167318 ?auto_167316 ) ( ON ?auto_167317 ?auto_167318 ) ( not ( = ?auto_167316 ?auto_167318 ) ) ( not ( = ?auto_167316 ?auto_167317 ) ) ( not ( = ?auto_167316 ?auto_167315 ) ) ( not ( = ?auto_167316 ?auto_167319 ) ) ( not ( = ?auto_167318 ?auto_167317 ) ) ( not ( = ?auto_167318 ?auto_167315 ) ) ( not ( = ?auto_167318 ?auto_167319 ) ) ( not ( = ?auto_167317 ?auto_167315 ) ) ( not ( = ?auto_167317 ?auto_167319 ) ) ( not ( = ?auto_167315 ?auto_167319 ) ) ( not ( = ?auto_167311 ?auto_167315 ) ) ( not ( = ?auto_167311 ?auto_167316 ) ) ( not ( = ?auto_167311 ?auto_167318 ) ) ( not ( = ?auto_167311 ?auto_167317 ) ) ( not ( = ?auto_167312 ?auto_167315 ) ) ( not ( = ?auto_167312 ?auto_167316 ) ) ( not ( = ?auto_167312 ?auto_167318 ) ) ( not ( = ?auto_167312 ?auto_167317 ) ) ( not ( = ?auto_167314 ?auto_167315 ) ) ( not ( = ?auto_167314 ?auto_167316 ) ) ( not ( = ?auto_167314 ?auto_167318 ) ) ( not ( = ?auto_167314 ?auto_167317 ) ) ( not ( = ?auto_167313 ?auto_167315 ) ) ( not ( = ?auto_167313 ?auto_167316 ) ) ( not ( = ?auto_167313 ?auto_167318 ) ) ( not ( = ?auto_167313 ?auto_167317 ) ) ( ON ?auto_167319 ?auto_167313 ) ( CLEAR ?auto_167317 ) ( ON ?auto_167315 ?auto_167319 ) ( CLEAR ?auto_167315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167311 ?auto_167312 ?auto_167314 ?auto_167313 ?auto_167319 )
      ( MAKE-2PILE ?auto_167311 ?auto_167312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167320 - BLOCK
      ?auto_167321 - BLOCK
    )
    :vars
    (
      ?auto_167324 - BLOCK
      ?auto_167327 - BLOCK
      ?auto_167328 - BLOCK
      ?auto_167325 - BLOCK
      ?auto_167322 - BLOCK
      ?auto_167326 - BLOCK
      ?auto_167323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167324 ?auto_167321 ) ( ON-TABLE ?auto_167320 ) ( ON ?auto_167321 ?auto_167320 ) ( not ( = ?auto_167320 ?auto_167321 ) ) ( not ( = ?auto_167320 ?auto_167324 ) ) ( not ( = ?auto_167321 ?auto_167324 ) ) ( not ( = ?auto_167320 ?auto_167327 ) ) ( not ( = ?auto_167320 ?auto_167328 ) ) ( not ( = ?auto_167321 ?auto_167327 ) ) ( not ( = ?auto_167321 ?auto_167328 ) ) ( not ( = ?auto_167324 ?auto_167327 ) ) ( not ( = ?auto_167324 ?auto_167328 ) ) ( not ( = ?auto_167327 ?auto_167328 ) ) ( ON ?auto_167327 ?auto_167324 ) ( ON-TABLE ?auto_167325 ) ( ON ?auto_167322 ?auto_167325 ) ( not ( = ?auto_167325 ?auto_167322 ) ) ( not ( = ?auto_167325 ?auto_167326 ) ) ( not ( = ?auto_167325 ?auto_167323 ) ) ( not ( = ?auto_167325 ?auto_167328 ) ) ( not ( = ?auto_167322 ?auto_167326 ) ) ( not ( = ?auto_167322 ?auto_167323 ) ) ( not ( = ?auto_167322 ?auto_167328 ) ) ( not ( = ?auto_167326 ?auto_167323 ) ) ( not ( = ?auto_167326 ?auto_167328 ) ) ( not ( = ?auto_167323 ?auto_167328 ) ) ( not ( = ?auto_167320 ?auto_167323 ) ) ( not ( = ?auto_167320 ?auto_167325 ) ) ( not ( = ?auto_167320 ?auto_167322 ) ) ( not ( = ?auto_167320 ?auto_167326 ) ) ( not ( = ?auto_167321 ?auto_167323 ) ) ( not ( = ?auto_167321 ?auto_167325 ) ) ( not ( = ?auto_167321 ?auto_167322 ) ) ( not ( = ?auto_167321 ?auto_167326 ) ) ( not ( = ?auto_167324 ?auto_167323 ) ) ( not ( = ?auto_167324 ?auto_167325 ) ) ( not ( = ?auto_167324 ?auto_167322 ) ) ( not ( = ?auto_167324 ?auto_167326 ) ) ( not ( = ?auto_167327 ?auto_167323 ) ) ( not ( = ?auto_167327 ?auto_167325 ) ) ( not ( = ?auto_167327 ?auto_167322 ) ) ( not ( = ?auto_167327 ?auto_167326 ) ) ( ON ?auto_167328 ?auto_167327 ) ( ON ?auto_167323 ?auto_167328 ) ( CLEAR ?auto_167323 ) ( HOLDING ?auto_167326 ) ( CLEAR ?auto_167322 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167325 ?auto_167322 ?auto_167326 )
      ( MAKE-2PILE ?auto_167320 ?auto_167321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167329 - BLOCK
      ?auto_167330 - BLOCK
    )
    :vars
    (
      ?auto_167331 - BLOCK
      ?auto_167335 - BLOCK
      ?auto_167336 - BLOCK
      ?auto_167334 - BLOCK
      ?auto_167337 - BLOCK
      ?auto_167333 - BLOCK
      ?auto_167332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167331 ?auto_167330 ) ( ON-TABLE ?auto_167329 ) ( ON ?auto_167330 ?auto_167329 ) ( not ( = ?auto_167329 ?auto_167330 ) ) ( not ( = ?auto_167329 ?auto_167331 ) ) ( not ( = ?auto_167330 ?auto_167331 ) ) ( not ( = ?auto_167329 ?auto_167335 ) ) ( not ( = ?auto_167329 ?auto_167336 ) ) ( not ( = ?auto_167330 ?auto_167335 ) ) ( not ( = ?auto_167330 ?auto_167336 ) ) ( not ( = ?auto_167331 ?auto_167335 ) ) ( not ( = ?auto_167331 ?auto_167336 ) ) ( not ( = ?auto_167335 ?auto_167336 ) ) ( ON ?auto_167335 ?auto_167331 ) ( ON-TABLE ?auto_167334 ) ( ON ?auto_167337 ?auto_167334 ) ( not ( = ?auto_167334 ?auto_167337 ) ) ( not ( = ?auto_167334 ?auto_167333 ) ) ( not ( = ?auto_167334 ?auto_167332 ) ) ( not ( = ?auto_167334 ?auto_167336 ) ) ( not ( = ?auto_167337 ?auto_167333 ) ) ( not ( = ?auto_167337 ?auto_167332 ) ) ( not ( = ?auto_167337 ?auto_167336 ) ) ( not ( = ?auto_167333 ?auto_167332 ) ) ( not ( = ?auto_167333 ?auto_167336 ) ) ( not ( = ?auto_167332 ?auto_167336 ) ) ( not ( = ?auto_167329 ?auto_167332 ) ) ( not ( = ?auto_167329 ?auto_167334 ) ) ( not ( = ?auto_167329 ?auto_167337 ) ) ( not ( = ?auto_167329 ?auto_167333 ) ) ( not ( = ?auto_167330 ?auto_167332 ) ) ( not ( = ?auto_167330 ?auto_167334 ) ) ( not ( = ?auto_167330 ?auto_167337 ) ) ( not ( = ?auto_167330 ?auto_167333 ) ) ( not ( = ?auto_167331 ?auto_167332 ) ) ( not ( = ?auto_167331 ?auto_167334 ) ) ( not ( = ?auto_167331 ?auto_167337 ) ) ( not ( = ?auto_167331 ?auto_167333 ) ) ( not ( = ?auto_167335 ?auto_167332 ) ) ( not ( = ?auto_167335 ?auto_167334 ) ) ( not ( = ?auto_167335 ?auto_167337 ) ) ( not ( = ?auto_167335 ?auto_167333 ) ) ( ON ?auto_167336 ?auto_167335 ) ( ON ?auto_167332 ?auto_167336 ) ( CLEAR ?auto_167337 ) ( ON ?auto_167333 ?auto_167332 ) ( CLEAR ?auto_167333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167329 ?auto_167330 ?auto_167331 ?auto_167335 ?auto_167336 ?auto_167332 )
      ( MAKE-2PILE ?auto_167329 ?auto_167330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167338 - BLOCK
      ?auto_167339 - BLOCK
    )
    :vars
    (
      ?auto_167344 - BLOCK
      ?auto_167345 - BLOCK
      ?auto_167346 - BLOCK
      ?auto_167340 - BLOCK
      ?auto_167342 - BLOCK
      ?auto_167341 - BLOCK
      ?auto_167343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167344 ?auto_167339 ) ( ON-TABLE ?auto_167338 ) ( ON ?auto_167339 ?auto_167338 ) ( not ( = ?auto_167338 ?auto_167339 ) ) ( not ( = ?auto_167338 ?auto_167344 ) ) ( not ( = ?auto_167339 ?auto_167344 ) ) ( not ( = ?auto_167338 ?auto_167345 ) ) ( not ( = ?auto_167338 ?auto_167346 ) ) ( not ( = ?auto_167339 ?auto_167345 ) ) ( not ( = ?auto_167339 ?auto_167346 ) ) ( not ( = ?auto_167344 ?auto_167345 ) ) ( not ( = ?auto_167344 ?auto_167346 ) ) ( not ( = ?auto_167345 ?auto_167346 ) ) ( ON ?auto_167345 ?auto_167344 ) ( ON-TABLE ?auto_167340 ) ( not ( = ?auto_167340 ?auto_167342 ) ) ( not ( = ?auto_167340 ?auto_167341 ) ) ( not ( = ?auto_167340 ?auto_167343 ) ) ( not ( = ?auto_167340 ?auto_167346 ) ) ( not ( = ?auto_167342 ?auto_167341 ) ) ( not ( = ?auto_167342 ?auto_167343 ) ) ( not ( = ?auto_167342 ?auto_167346 ) ) ( not ( = ?auto_167341 ?auto_167343 ) ) ( not ( = ?auto_167341 ?auto_167346 ) ) ( not ( = ?auto_167343 ?auto_167346 ) ) ( not ( = ?auto_167338 ?auto_167343 ) ) ( not ( = ?auto_167338 ?auto_167340 ) ) ( not ( = ?auto_167338 ?auto_167342 ) ) ( not ( = ?auto_167338 ?auto_167341 ) ) ( not ( = ?auto_167339 ?auto_167343 ) ) ( not ( = ?auto_167339 ?auto_167340 ) ) ( not ( = ?auto_167339 ?auto_167342 ) ) ( not ( = ?auto_167339 ?auto_167341 ) ) ( not ( = ?auto_167344 ?auto_167343 ) ) ( not ( = ?auto_167344 ?auto_167340 ) ) ( not ( = ?auto_167344 ?auto_167342 ) ) ( not ( = ?auto_167344 ?auto_167341 ) ) ( not ( = ?auto_167345 ?auto_167343 ) ) ( not ( = ?auto_167345 ?auto_167340 ) ) ( not ( = ?auto_167345 ?auto_167342 ) ) ( not ( = ?auto_167345 ?auto_167341 ) ) ( ON ?auto_167346 ?auto_167345 ) ( ON ?auto_167343 ?auto_167346 ) ( ON ?auto_167341 ?auto_167343 ) ( CLEAR ?auto_167341 ) ( HOLDING ?auto_167342 ) ( CLEAR ?auto_167340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167340 ?auto_167342 )
      ( MAKE-2PILE ?auto_167338 ?auto_167339 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167347 - BLOCK
      ?auto_167348 - BLOCK
    )
    :vars
    (
      ?auto_167355 - BLOCK
      ?auto_167353 - BLOCK
      ?auto_167352 - BLOCK
      ?auto_167351 - BLOCK
      ?auto_167354 - BLOCK
      ?auto_167349 - BLOCK
      ?auto_167350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167355 ?auto_167348 ) ( ON-TABLE ?auto_167347 ) ( ON ?auto_167348 ?auto_167347 ) ( not ( = ?auto_167347 ?auto_167348 ) ) ( not ( = ?auto_167347 ?auto_167355 ) ) ( not ( = ?auto_167348 ?auto_167355 ) ) ( not ( = ?auto_167347 ?auto_167353 ) ) ( not ( = ?auto_167347 ?auto_167352 ) ) ( not ( = ?auto_167348 ?auto_167353 ) ) ( not ( = ?auto_167348 ?auto_167352 ) ) ( not ( = ?auto_167355 ?auto_167353 ) ) ( not ( = ?auto_167355 ?auto_167352 ) ) ( not ( = ?auto_167353 ?auto_167352 ) ) ( ON ?auto_167353 ?auto_167355 ) ( ON-TABLE ?auto_167351 ) ( not ( = ?auto_167351 ?auto_167354 ) ) ( not ( = ?auto_167351 ?auto_167349 ) ) ( not ( = ?auto_167351 ?auto_167350 ) ) ( not ( = ?auto_167351 ?auto_167352 ) ) ( not ( = ?auto_167354 ?auto_167349 ) ) ( not ( = ?auto_167354 ?auto_167350 ) ) ( not ( = ?auto_167354 ?auto_167352 ) ) ( not ( = ?auto_167349 ?auto_167350 ) ) ( not ( = ?auto_167349 ?auto_167352 ) ) ( not ( = ?auto_167350 ?auto_167352 ) ) ( not ( = ?auto_167347 ?auto_167350 ) ) ( not ( = ?auto_167347 ?auto_167351 ) ) ( not ( = ?auto_167347 ?auto_167354 ) ) ( not ( = ?auto_167347 ?auto_167349 ) ) ( not ( = ?auto_167348 ?auto_167350 ) ) ( not ( = ?auto_167348 ?auto_167351 ) ) ( not ( = ?auto_167348 ?auto_167354 ) ) ( not ( = ?auto_167348 ?auto_167349 ) ) ( not ( = ?auto_167355 ?auto_167350 ) ) ( not ( = ?auto_167355 ?auto_167351 ) ) ( not ( = ?auto_167355 ?auto_167354 ) ) ( not ( = ?auto_167355 ?auto_167349 ) ) ( not ( = ?auto_167353 ?auto_167350 ) ) ( not ( = ?auto_167353 ?auto_167351 ) ) ( not ( = ?auto_167353 ?auto_167354 ) ) ( not ( = ?auto_167353 ?auto_167349 ) ) ( ON ?auto_167352 ?auto_167353 ) ( ON ?auto_167350 ?auto_167352 ) ( ON ?auto_167349 ?auto_167350 ) ( CLEAR ?auto_167351 ) ( ON ?auto_167354 ?auto_167349 ) ( CLEAR ?auto_167354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167347 ?auto_167348 ?auto_167355 ?auto_167353 ?auto_167352 ?auto_167350 ?auto_167349 )
      ( MAKE-2PILE ?auto_167347 ?auto_167348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167356 - BLOCK
      ?auto_167357 - BLOCK
    )
    :vars
    (
      ?auto_167363 - BLOCK
      ?auto_167360 - BLOCK
      ?auto_167364 - BLOCK
      ?auto_167362 - BLOCK
      ?auto_167359 - BLOCK
      ?auto_167358 - BLOCK
      ?auto_167361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167363 ?auto_167357 ) ( ON-TABLE ?auto_167356 ) ( ON ?auto_167357 ?auto_167356 ) ( not ( = ?auto_167356 ?auto_167357 ) ) ( not ( = ?auto_167356 ?auto_167363 ) ) ( not ( = ?auto_167357 ?auto_167363 ) ) ( not ( = ?auto_167356 ?auto_167360 ) ) ( not ( = ?auto_167356 ?auto_167364 ) ) ( not ( = ?auto_167357 ?auto_167360 ) ) ( not ( = ?auto_167357 ?auto_167364 ) ) ( not ( = ?auto_167363 ?auto_167360 ) ) ( not ( = ?auto_167363 ?auto_167364 ) ) ( not ( = ?auto_167360 ?auto_167364 ) ) ( ON ?auto_167360 ?auto_167363 ) ( not ( = ?auto_167362 ?auto_167359 ) ) ( not ( = ?auto_167362 ?auto_167358 ) ) ( not ( = ?auto_167362 ?auto_167361 ) ) ( not ( = ?auto_167362 ?auto_167364 ) ) ( not ( = ?auto_167359 ?auto_167358 ) ) ( not ( = ?auto_167359 ?auto_167361 ) ) ( not ( = ?auto_167359 ?auto_167364 ) ) ( not ( = ?auto_167358 ?auto_167361 ) ) ( not ( = ?auto_167358 ?auto_167364 ) ) ( not ( = ?auto_167361 ?auto_167364 ) ) ( not ( = ?auto_167356 ?auto_167361 ) ) ( not ( = ?auto_167356 ?auto_167362 ) ) ( not ( = ?auto_167356 ?auto_167359 ) ) ( not ( = ?auto_167356 ?auto_167358 ) ) ( not ( = ?auto_167357 ?auto_167361 ) ) ( not ( = ?auto_167357 ?auto_167362 ) ) ( not ( = ?auto_167357 ?auto_167359 ) ) ( not ( = ?auto_167357 ?auto_167358 ) ) ( not ( = ?auto_167363 ?auto_167361 ) ) ( not ( = ?auto_167363 ?auto_167362 ) ) ( not ( = ?auto_167363 ?auto_167359 ) ) ( not ( = ?auto_167363 ?auto_167358 ) ) ( not ( = ?auto_167360 ?auto_167361 ) ) ( not ( = ?auto_167360 ?auto_167362 ) ) ( not ( = ?auto_167360 ?auto_167359 ) ) ( not ( = ?auto_167360 ?auto_167358 ) ) ( ON ?auto_167364 ?auto_167360 ) ( ON ?auto_167361 ?auto_167364 ) ( ON ?auto_167358 ?auto_167361 ) ( ON ?auto_167359 ?auto_167358 ) ( CLEAR ?auto_167359 ) ( HOLDING ?auto_167362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167362 )
      ( MAKE-2PILE ?auto_167356 ?auto_167357 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_167365 - BLOCK
      ?auto_167366 - BLOCK
    )
    :vars
    (
      ?auto_167367 - BLOCK
      ?auto_167368 - BLOCK
      ?auto_167369 - BLOCK
      ?auto_167373 - BLOCK
      ?auto_167370 - BLOCK
      ?auto_167371 - BLOCK
      ?auto_167372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167367 ?auto_167366 ) ( ON-TABLE ?auto_167365 ) ( ON ?auto_167366 ?auto_167365 ) ( not ( = ?auto_167365 ?auto_167366 ) ) ( not ( = ?auto_167365 ?auto_167367 ) ) ( not ( = ?auto_167366 ?auto_167367 ) ) ( not ( = ?auto_167365 ?auto_167368 ) ) ( not ( = ?auto_167365 ?auto_167369 ) ) ( not ( = ?auto_167366 ?auto_167368 ) ) ( not ( = ?auto_167366 ?auto_167369 ) ) ( not ( = ?auto_167367 ?auto_167368 ) ) ( not ( = ?auto_167367 ?auto_167369 ) ) ( not ( = ?auto_167368 ?auto_167369 ) ) ( ON ?auto_167368 ?auto_167367 ) ( not ( = ?auto_167373 ?auto_167370 ) ) ( not ( = ?auto_167373 ?auto_167371 ) ) ( not ( = ?auto_167373 ?auto_167372 ) ) ( not ( = ?auto_167373 ?auto_167369 ) ) ( not ( = ?auto_167370 ?auto_167371 ) ) ( not ( = ?auto_167370 ?auto_167372 ) ) ( not ( = ?auto_167370 ?auto_167369 ) ) ( not ( = ?auto_167371 ?auto_167372 ) ) ( not ( = ?auto_167371 ?auto_167369 ) ) ( not ( = ?auto_167372 ?auto_167369 ) ) ( not ( = ?auto_167365 ?auto_167372 ) ) ( not ( = ?auto_167365 ?auto_167373 ) ) ( not ( = ?auto_167365 ?auto_167370 ) ) ( not ( = ?auto_167365 ?auto_167371 ) ) ( not ( = ?auto_167366 ?auto_167372 ) ) ( not ( = ?auto_167366 ?auto_167373 ) ) ( not ( = ?auto_167366 ?auto_167370 ) ) ( not ( = ?auto_167366 ?auto_167371 ) ) ( not ( = ?auto_167367 ?auto_167372 ) ) ( not ( = ?auto_167367 ?auto_167373 ) ) ( not ( = ?auto_167367 ?auto_167370 ) ) ( not ( = ?auto_167367 ?auto_167371 ) ) ( not ( = ?auto_167368 ?auto_167372 ) ) ( not ( = ?auto_167368 ?auto_167373 ) ) ( not ( = ?auto_167368 ?auto_167370 ) ) ( not ( = ?auto_167368 ?auto_167371 ) ) ( ON ?auto_167369 ?auto_167368 ) ( ON ?auto_167372 ?auto_167369 ) ( ON ?auto_167371 ?auto_167372 ) ( ON ?auto_167370 ?auto_167371 ) ( ON ?auto_167373 ?auto_167370 ) ( CLEAR ?auto_167373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167365 ?auto_167366 ?auto_167367 ?auto_167368 ?auto_167369 ?auto_167372 ?auto_167371 ?auto_167370 )
      ( MAKE-2PILE ?auto_167365 ?auto_167366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167381 - BLOCK
      ?auto_167382 - BLOCK
      ?auto_167383 - BLOCK
      ?auto_167384 - BLOCK
      ?auto_167385 - BLOCK
      ?auto_167386 - BLOCK
      ?auto_167387 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_167387 ) ( CLEAR ?auto_167386 ) ( ON-TABLE ?auto_167381 ) ( ON ?auto_167382 ?auto_167381 ) ( ON ?auto_167383 ?auto_167382 ) ( ON ?auto_167384 ?auto_167383 ) ( ON ?auto_167385 ?auto_167384 ) ( ON ?auto_167386 ?auto_167385 ) ( not ( = ?auto_167381 ?auto_167382 ) ) ( not ( = ?auto_167381 ?auto_167383 ) ) ( not ( = ?auto_167381 ?auto_167384 ) ) ( not ( = ?auto_167381 ?auto_167385 ) ) ( not ( = ?auto_167381 ?auto_167386 ) ) ( not ( = ?auto_167381 ?auto_167387 ) ) ( not ( = ?auto_167382 ?auto_167383 ) ) ( not ( = ?auto_167382 ?auto_167384 ) ) ( not ( = ?auto_167382 ?auto_167385 ) ) ( not ( = ?auto_167382 ?auto_167386 ) ) ( not ( = ?auto_167382 ?auto_167387 ) ) ( not ( = ?auto_167383 ?auto_167384 ) ) ( not ( = ?auto_167383 ?auto_167385 ) ) ( not ( = ?auto_167383 ?auto_167386 ) ) ( not ( = ?auto_167383 ?auto_167387 ) ) ( not ( = ?auto_167384 ?auto_167385 ) ) ( not ( = ?auto_167384 ?auto_167386 ) ) ( not ( = ?auto_167384 ?auto_167387 ) ) ( not ( = ?auto_167385 ?auto_167386 ) ) ( not ( = ?auto_167385 ?auto_167387 ) ) ( not ( = ?auto_167386 ?auto_167387 ) ) )
    :subtasks
    ( ( !STACK ?auto_167387 ?auto_167386 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167388 - BLOCK
      ?auto_167389 - BLOCK
      ?auto_167390 - BLOCK
      ?auto_167391 - BLOCK
      ?auto_167392 - BLOCK
      ?auto_167393 - BLOCK
      ?auto_167394 - BLOCK
    )
    :vars
    (
      ?auto_167395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167393 ) ( ON-TABLE ?auto_167388 ) ( ON ?auto_167389 ?auto_167388 ) ( ON ?auto_167390 ?auto_167389 ) ( ON ?auto_167391 ?auto_167390 ) ( ON ?auto_167392 ?auto_167391 ) ( ON ?auto_167393 ?auto_167392 ) ( not ( = ?auto_167388 ?auto_167389 ) ) ( not ( = ?auto_167388 ?auto_167390 ) ) ( not ( = ?auto_167388 ?auto_167391 ) ) ( not ( = ?auto_167388 ?auto_167392 ) ) ( not ( = ?auto_167388 ?auto_167393 ) ) ( not ( = ?auto_167388 ?auto_167394 ) ) ( not ( = ?auto_167389 ?auto_167390 ) ) ( not ( = ?auto_167389 ?auto_167391 ) ) ( not ( = ?auto_167389 ?auto_167392 ) ) ( not ( = ?auto_167389 ?auto_167393 ) ) ( not ( = ?auto_167389 ?auto_167394 ) ) ( not ( = ?auto_167390 ?auto_167391 ) ) ( not ( = ?auto_167390 ?auto_167392 ) ) ( not ( = ?auto_167390 ?auto_167393 ) ) ( not ( = ?auto_167390 ?auto_167394 ) ) ( not ( = ?auto_167391 ?auto_167392 ) ) ( not ( = ?auto_167391 ?auto_167393 ) ) ( not ( = ?auto_167391 ?auto_167394 ) ) ( not ( = ?auto_167392 ?auto_167393 ) ) ( not ( = ?auto_167392 ?auto_167394 ) ) ( not ( = ?auto_167393 ?auto_167394 ) ) ( ON ?auto_167394 ?auto_167395 ) ( CLEAR ?auto_167394 ) ( HAND-EMPTY ) ( not ( = ?auto_167388 ?auto_167395 ) ) ( not ( = ?auto_167389 ?auto_167395 ) ) ( not ( = ?auto_167390 ?auto_167395 ) ) ( not ( = ?auto_167391 ?auto_167395 ) ) ( not ( = ?auto_167392 ?auto_167395 ) ) ( not ( = ?auto_167393 ?auto_167395 ) ) ( not ( = ?auto_167394 ?auto_167395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167394 ?auto_167395 )
      ( MAKE-7PILE ?auto_167388 ?auto_167389 ?auto_167390 ?auto_167391 ?auto_167392 ?auto_167393 ?auto_167394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167396 - BLOCK
      ?auto_167397 - BLOCK
      ?auto_167398 - BLOCK
      ?auto_167399 - BLOCK
      ?auto_167400 - BLOCK
      ?auto_167401 - BLOCK
      ?auto_167402 - BLOCK
    )
    :vars
    (
      ?auto_167403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167396 ) ( ON ?auto_167397 ?auto_167396 ) ( ON ?auto_167398 ?auto_167397 ) ( ON ?auto_167399 ?auto_167398 ) ( ON ?auto_167400 ?auto_167399 ) ( not ( = ?auto_167396 ?auto_167397 ) ) ( not ( = ?auto_167396 ?auto_167398 ) ) ( not ( = ?auto_167396 ?auto_167399 ) ) ( not ( = ?auto_167396 ?auto_167400 ) ) ( not ( = ?auto_167396 ?auto_167401 ) ) ( not ( = ?auto_167396 ?auto_167402 ) ) ( not ( = ?auto_167397 ?auto_167398 ) ) ( not ( = ?auto_167397 ?auto_167399 ) ) ( not ( = ?auto_167397 ?auto_167400 ) ) ( not ( = ?auto_167397 ?auto_167401 ) ) ( not ( = ?auto_167397 ?auto_167402 ) ) ( not ( = ?auto_167398 ?auto_167399 ) ) ( not ( = ?auto_167398 ?auto_167400 ) ) ( not ( = ?auto_167398 ?auto_167401 ) ) ( not ( = ?auto_167398 ?auto_167402 ) ) ( not ( = ?auto_167399 ?auto_167400 ) ) ( not ( = ?auto_167399 ?auto_167401 ) ) ( not ( = ?auto_167399 ?auto_167402 ) ) ( not ( = ?auto_167400 ?auto_167401 ) ) ( not ( = ?auto_167400 ?auto_167402 ) ) ( not ( = ?auto_167401 ?auto_167402 ) ) ( ON ?auto_167402 ?auto_167403 ) ( CLEAR ?auto_167402 ) ( not ( = ?auto_167396 ?auto_167403 ) ) ( not ( = ?auto_167397 ?auto_167403 ) ) ( not ( = ?auto_167398 ?auto_167403 ) ) ( not ( = ?auto_167399 ?auto_167403 ) ) ( not ( = ?auto_167400 ?auto_167403 ) ) ( not ( = ?auto_167401 ?auto_167403 ) ) ( not ( = ?auto_167402 ?auto_167403 ) ) ( HOLDING ?auto_167401 ) ( CLEAR ?auto_167400 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167396 ?auto_167397 ?auto_167398 ?auto_167399 ?auto_167400 ?auto_167401 )
      ( MAKE-7PILE ?auto_167396 ?auto_167397 ?auto_167398 ?auto_167399 ?auto_167400 ?auto_167401 ?auto_167402 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167404 - BLOCK
      ?auto_167405 - BLOCK
      ?auto_167406 - BLOCK
      ?auto_167407 - BLOCK
      ?auto_167408 - BLOCK
      ?auto_167409 - BLOCK
      ?auto_167410 - BLOCK
    )
    :vars
    (
      ?auto_167411 - BLOCK
      ?auto_167412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167404 ) ( ON ?auto_167405 ?auto_167404 ) ( ON ?auto_167406 ?auto_167405 ) ( ON ?auto_167407 ?auto_167406 ) ( ON ?auto_167408 ?auto_167407 ) ( not ( = ?auto_167404 ?auto_167405 ) ) ( not ( = ?auto_167404 ?auto_167406 ) ) ( not ( = ?auto_167404 ?auto_167407 ) ) ( not ( = ?auto_167404 ?auto_167408 ) ) ( not ( = ?auto_167404 ?auto_167409 ) ) ( not ( = ?auto_167404 ?auto_167410 ) ) ( not ( = ?auto_167405 ?auto_167406 ) ) ( not ( = ?auto_167405 ?auto_167407 ) ) ( not ( = ?auto_167405 ?auto_167408 ) ) ( not ( = ?auto_167405 ?auto_167409 ) ) ( not ( = ?auto_167405 ?auto_167410 ) ) ( not ( = ?auto_167406 ?auto_167407 ) ) ( not ( = ?auto_167406 ?auto_167408 ) ) ( not ( = ?auto_167406 ?auto_167409 ) ) ( not ( = ?auto_167406 ?auto_167410 ) ) ( not ( = ?auto_167407 ?auto_167408 ) ) ( not ( = ?auto_167407 ?auto_167409 ) ) ( not ( = ?auto_167407 ?auto_167410 ) ) ( not ( = ?auto_167408 ?auto_167409 ) ) ( not ( = ?auto_167408 ?auto_167410 ) ) ( not ( = ?auto_167409 ?auto_167410 ) ) ( ON ?auto_167410 ?auto_167411 ) ( not ( = ?auto_167404 ?auto_167411 ) ) ( not ( = ?auto_167405 ?auto_167411 ) ) ( not ( = ?auto_167406 ?auto_167411 ) ) ( not ( = ?auto_167407 ?auto_167411 ) ) ( not ( = ?auto_167408 ?auto_167411 ) ) ( not ( = ?auto_167409 ?auto_167411 ) ) ( not ( = ?auto_167410 ?auto_167411 ) ) ( CLEAR ?auto_167408 ) ( ON ?auto_167409 ?auto_167410 ) ( CLEAR ?auto_167409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167412 ) ( ON ?auto_167411 ?auto_167412 ) ( not ( = ?auto_167412 ?auto_167411 ) ) ( not ( = ?auto_167412 ?auto_167410 ) ) ( not ( = ?auto_167412 ?auto_167409 ) ) ( not ( = ?auto_167404 ?auto_167412 ) ) ( not ( = ?auto_167405 ?auto_167412 ) ) ( not ( = ?auto_167406 ?auto_167412 ) ) ( not ( = ?auto_167407 ?auto_167412 ) ) ( not ( = ?auto_167408 ?auto_167412 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167412 ?auto_167411 ?auto_167410 )
      ( MAKE-7PILE ?auto_167404 ?auto_167405 ?auto_167406 ?auto_167407 ?auto_167408 ?auto_167409 ?auto_167410 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167413 - BLOCK
      ?auto_167414 - BLOCK
      ?auto_167415 - BLOCK
      ?auto_167416 - BLOCK
      ?auto_167417 - BLOCK
      ?auto_167418 - BLOCK
      ?auto_167419 - BLOCK
    )
    :vars
    (
      ?auto_167421 - BLOCK
      ?auto_167420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167413 ) ( ON ?auto_167414 ?auto_167413 ) ( ON ?auto_167415 ?auto_167414 ) ( ON ?auto_167416 ?auto_167415 ) ( not ( = ?auto_167413 ?auto_167414 ) ) ( not ( = ?auto_167413 ?auto_167415 ) ) ( not ( = ?auto_167413 ?auto_167416 ) ) ( not ( = ?auto_167413 ?auto_167417 ) ) ( not ( = ?auto_167413 ?auto_167418 ) ) ( not ( = ?auto_167413 ?auto_167419 ) ) ( not ( = ?auto_167414 ?auto_167415 ) ) ( not ( = ?auto_167414 ?auto_167416 ) ) ( not ( = ?auto_167414 ?auto_167417 ) ) ( not ( = ?auto_167414 ?auto_167418 ) ) ( not ( = ?auto_167414 ?auto_167419 ) ) ( not ( = ?auto_167415 ?auto_167416 ) ) ( not ( = ?auto_167415 ?auto_167417 ) ) ( not ( = ?auto_167415 ?auto_167418 ) ) ( not ( = ?auto_167415 ?auto_167419 ) ) ( not ( = ?auto_167416 ?auto_167417 ) ) ( not ( = ?auto_167416 ?auto_167418 ) ) ( not ( = ?auto_167416 ?auto_167419 ) ) ( not ( = ?auto_167417 ?auto_167418 ) ) ( not ( = ?auto_167417 ?auto_167419 ) ) ( not ( = ?auto_167418 ?auto_167419 ) ) ( ON ?auto_167419 ?auto_167421 ) ( not ( = ?auto_167413 ?auto_167421 ) ) ( not ( = ?auto_167414 ?auto_167421 ) ) ( not ( = ?auto_167415 ?auto_167421 ) ) ( not ( = ?auto_167416 ?auto_167421 ) ) ( not ( = ?auto_167417 ?auto_167421 ) ) ( not ( = ?auto_167418 ?auto_167421 ) ) ( not ( = ?auto_167419 ?auto_167421 ) ) ( ON ?auto_167418 ?auto_167419 ) ( CLEAR ?auto_167418 ) ( ON-TABLE ?auto_167420 ) ( ON ?auto_167421 ?auto_167420 ) ( not ( = ?auto_167420 ?auto_167421 ) ) ( not ( = ?auto_167420 ?auto_167419 ) ) ( not ( = ?auto_167420 ?auto_167418 ) ) ( not ( = ?auto_167413 ?auto_167420 ) ) ( not ( = ?auto_167414 ?auto_167420 ) ) ( not ( = ?auto_167415 ?auto_167420 ) ) ( not ( = ?auto_167416 ?auto_167420 ) ) ( not ( = ?auto_167417 ?auto_167420 ) ) ( HOLDING ?auto_167417 ) ( CLEAR ?auto_167416 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167413 ?auto_167414 ?auto_167415 ?auto_167416 ?auto_167417 )
      ( MAKE-7PILE ?auto_167413 ?auto_167414 ?auto_167415 ?auto_167416 ?auto_167417 ?auto_167418 ?auto_167419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167422 - BLOCK
      ?auto_167423 - BLOCK
      ?auto_167424 - BLOCK
      ?auto_167425 - BLOCK
      ?auto_167426 - BLOCK
      ?auto_167427 - BLOCK
      ?auto_167428 - BLOCK
    )
    :vars
    (
      ?auto_167429 - BLOCK
      ?auto_167430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167422 ) ( ON ?auto_167423 ?auto_167422 ) ( ON ?auto_167424 ?auto_167423 ) ( ON ?auto_167425 ?auto_167424 ) ( not ( = ?auto_167422 ?auto_167423 ) ) ( not ( = ?auto_167422 ?auto_167424 ) ) ( not ( = ?auto_167422 ?auto_167425 ) ) ( not ( = ?auto_167422 ?auto_167426 ) ) ( not ( = ?auto_167422 ?auto_167427 ) ) ( not ( = ?auto_167422 ?auto_167428 ) ) ( not ( = ?auto_167423 ?auto_167424 ) ) ( not ( = ?auto_167423 ?auto_167425 ) ) ( not ( = ?auto_167423 ?auto_167426 ) ) ( not ( = ?auto_167423 ?auto_167427 ) ) ( not ( = ?auto_167423 ?auto_167428 ) ) ( not ( = ?auto_167424 ?auto_167425 ) ) ( not ( = ?auto_167424 ?auto_167426 ) ) ( not ( = ?auto_167424 ?auto_167427 ) ) ( not ( = ?auto_167424 ?auto_167428 ) ) ( not ( = ?auto_167425 ?auto_167426 ) ) ( not ( = ?auto_167425 ?auto_167427 ) ) ( not ( = ?auto_167425 ?auto_167428 ) ) ( not ( = ?auto_167426 ?auto_167427 ) ) ( not ( = ?auto_167426 ?auto_167428 ) ) ( not ( = ?auto_167427 ?auto_167428 ) ) ( ON ?auto_167428 ?auto_167429 ) ( not ( = ?auto_167422 ?auto_167429 ) ) ( not ( = ?auto_167423 ?auto_167429 ) ) ( not ( = ?auto_167424 ?auto_167429 ) ) ( not ( = ?auto_167425 ?auto_167429 ) ) ( not ( = ?auto_167426 ?auto_167429 ) ) ( not ( = ?auto_167427 ?auto_167429 ) ) ( not ( = ?auto_167428 ?auto_167429 ) ) ( ON ?auto_167427 ?auto_167428 ) ( ON-TABLE ?auto_167430 ) ( ON ?auto_167429 ?auto_167430 ) ( not ( = ?auto_167430 ?auto_167429 ) ) ( not ( = ?auto_167430 ?auto_167428 ) ) ( not ( = ?auto_167430 ?auto_167427 ) ) ( not ( = ?auto_167422 ?auto_167430 ) ) ( not ( = ?auto_167423 ?auto_167430 ) ) ( not ( = ?auto_167424 ?auto_167430 ) ) ( not ( = ?auto_167425 ?auto_167430 ) ) ( not ( = ?auto_167426 ?auto_167430 ) ) ( CLEAR ?auto_167425 ) ( ON ?auto_167426 ?auto_167427 ) ( CLEAR ?auto_167426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167430 ?auto_167429 ?auto_167428 ?auto_167427 )
      ( MAKE-7PILE ?auto_167422 ?auto_167423 ?auto_167424 ?auto_167425 ?auto_167426 ?auto_167427 ?auto_167428 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167431 - BLOCK
      ?auto_167432 - BLOCK
      ?auto_167433 - BLOCK
      ?auto_167434 - BLOCK
      ?auto_167435 - BLOCK
      ?auto_167436 - BLOCK
      ?auto_167437 - BLOCK
    )
    :vars
    (
      ?auto_167438 - BLOCK
      ?auto_167439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167431 ) ( ON ?auto_167432 ?auto_167431 ) ( ON ?auto_167433 ?auto_167432 ) ( not ( = ?auto_167431 ?auto_167432 ) ) ( not ( = ?auto_167431 ?auto_167433 ) ) ( not ( = ?auto_167431 ?auto_167434 ) ) ( not ( = ?auto_167431 ?auto_167435 ) ) ( not ( = ?auto_167431 ?auto_167436 ) ) ( not ( = ?auto_167431 ?auto_167437 ) ) ( not ( = ?auto_167432 ?auto_167433 ) ) ( not ( = ?auto_167432 ?auto_167434 ) ) ( not ( = ?auto_167432 ?auto_167435 ) ) ( not ( = ?auto_167432 ?auto_167436 ) ) ( not ( = ?auto_167432 ?auto_167437 ) ) ( not ( = ?auto_167433 ?auto_167434 ) ) ( not ( = ?auto_167433 ?auto_167435 ) ) ( not ( = ?auto_167433 ?auto_167436 ) ) ( not ( = ?auto_167433 ?auto_167437 ) ) ( not ( = ?auto_167434 ?auto_167435 ) ) ( not ( = ?auto_167434 ?auto_167436 ) ) ( not ( = ?auto_167434 ?auto_167437 ) ) ( not ( = ?auto_167435 ?auto_167436 ) ) ( not ( = ?auto_167435 ?auto_167437 ) ) ( not ( = ?auto_167436 ?auto_167437 ) ) ( ON ?auto_167437 ?auto_167438 ) ( not ( = ?auto_167431 ?auto_167438 ) ) ( not ( = ?auto_167432 ?auto_167438 ) ) ( not ( = ?auto_167433 ?auto_167438 ) ) ( not ( = ?auto_167434 ?auto_167438 ) ) ( not ( = ?auto_167435 ?auto_167438 ) ) ( not ( = ?auto_167436 ?auto_167438 ) ) ( not ( = ?auto_167437 ?auto_167438 ) ) ( ON ?auto_167436 ?auto_167437 ) ( ON-TABLE ?auto_167439 ) ( ON ?auto_167438 ?auto_167439 ) ( not ( = ?auto_167439 ?auto_167438 ) ) ( not ( = ?auto_167439 ?auto_167437 ) ) ( not ( = ?auto_167439 ?auto_167436 ) ) ( not ( = ?auto_167431 ?auto_167439 ) ) ( not ( = ?auto_167432 ?auto_167439 ) ) ( not ( = ?auto_167433 ?auto_167439 ) ) ( not ( = ?auto_167434 ?auto_167439 ) ) ( not ( = ?auto_167435 ?auto_167439 ) ) ( ON ?auto_167435 ?auto_167436 ) ( CLEAR ?auto_167435 ) ( HOLDING ?auto_167434 ) ( CLEAR ?auto_167433 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167431 ?auto_167432 ?auto_167433 ?auto_167434 )
      ( MAKE-7PILE ?auto_167431 ?auto_167432 ?auto_167433 ?auto_167434 ?auto_167435 ?auto_167436 ?auto_167437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167440 - BLOCK
      ?auto_167441 - BLOCK
      ?auto_167442 - BLOCK
      ?auto_167443 - BLOCK
      ?auto_167444 - BLOCK
      ?auto_167445 - BLOCK
      ?auto_167446 - BLOCK
    )
    :vars
    (
      ?auto_167447 - BLOCK
      ?auto_167448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167440 ) ( ON ?auto_167441 ?auto_167440 ) ( ON ?auto_167442 ?auto_167441 ) ( not ( = ?auto_167440 ?auto_167441 ) ) ( not ( = ?auto_167440 ?auto_167442 ) ) ( not ( = ?auto_167440 ?auto_167443 ) ) ( not ( = ?auto_167440 ?auto_167444 ) ) ( not ( = ?auto_167440 ?auto_167445 ) ) ( not ( = ?auto_167440 ?auto_167446 ) ) ( not ( = ?auto_167441 ?auto_167442 ) ) ( not ( = ?auto_167441 ?auto_167443 ) ) ( not ( = ?auto_167441 ?auto_167444 ) ) ( not ( = ?auto_167441 ?auto_167445 ) ) ( not ( = ?auto_167441 ?auto_167446 ) ) ( not ( = ?auto_167442 ?auto_167443 ) ) ( not ( = ?auto_167442 ?auto_167444 ) ) ( not ( = ?auto_167442 ?auto_167445 ) ) ( not ( = ?auto_167442 ?auto_167446 ) ) ( not ( = ?auto_167443 ?auto_167444 ) ) ( not ( = ?auto_167443 ?auto_167445 ) ) ( not ( = ?auto_167443 ?auto_167446 ) ) ( not ( = ?auto_167444 ?auto_167445 ) ) ( not ( = ?auto_167444 ?auto_167446 ) ) ( not ( = ?auto_167445 ?auto_167446 ) ) ( ON ?auto_167446 ?auto_167447 ) ( not ( = ?auto_167440 ?auto_167447 ) ) ( not ( = ?auto_167441 ?auto_167447 ) ) ( not ( = ?auto_167442 ?auto_167447 ) ) ( not ( = ?auto_167443 ?auto_167447 ) ) ( not ( = ?auto_167444 ?auto_167447 ) ) ( not ( = ?auto_167445 ?auto_167447 ) ) ( not ( = ?auto_167446 ?auto_167447 ) ) ( ON ?auto_167445 ?auto_167446 ) ( ON-TABLE ?auto_167448 ) ( ON ?auto_167447 ?auto_167448 ) ( not ( = ?auto_167448 ?auto_167447 ) ) ( not ( = ?auto_167448 ?auto_167446 ) ) ( not ( = ?auto_167448 ?auto_167445 ) ) ( not ( = ?auto_167440 ?auto_167448 ) ) ( not ( = ?auto_167441 ?auto_167448 ) ) ( not ( = ?auto_167442 ?auto_167448 ) ) ( not ( = ?auto_167443 ?auto_167448 ) ) ( not ( = ?auto_167444 ?auto_167448 ) ) ( ON ?auto_167444 ?auto_167445 ) ( CLEAR ?auto_167442 ) ( ON ?auto_167443 ?auto_167444 ) ( CLEAR ?auto_167443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167448 ?auto_167447 ?auto_167446 ?auto_167445 ?auto_167444 )
      ( MAKE-7PILE ?auto_167440 ?auto_167441 ?auto_167442 ?auto_167443 ?auto_167444 ?auto_167445 ?auto_167446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167449 - BLOCK
      ?auto_167450 - BLOCK
      ?auto_167451 - BLOCK
      ?auto_167452 - BLOCK
      ?auto_167453 - BLOCK
      ?auto_167454 - BLOCK
      ?auto_167455 - BLOCK
    )
    :vars
    (
      ?auto_167457 - BLOCK
      ?auto_167456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167449 ) ( ON ?auto_167450 ?auto_167449 ) ( not ( = ?auto_167449 ?auto_167450 ) ) ( not ( = ?auto_167449 ?auto_167451 ) ) ( not ( = ?auto_167449 ?auto_167452 ) ) ( not ( = ?auto_167449 ?auto_167453 ) ) ( not ( = ?auto_167449 ?auto_167454 ) ) ( not ( = ?auto_167449 ?auto_167455 ) ) ( not ( = ?auto_167450 ?auto_167451 ) ) ( not ( = ?auto_167450 ?auto_167452 ) ) ( not ( = ?auto_167450 ?auto_167453 ) ) ( not ( = ?auto_167450 ?auto_167454 ) ) ( not ( = ?auto_167450 ?auto_167455 ) ) ( not ( = ?auto_167451 ?auto_167452 ) ) ( not ( = ?auto_167451 ?auto_167453 ) ) ( not ( = ?auto_167451 ?auto_167454 ) ) ( not ( = ?auto_167451 ?auto_167455 ) ) ( not ( = ?auto_167452 ?auto_167453 ) ) ( not ( = ?auto_167452 ?auto_167454 ) ) ( not ( = ?auto_167452 ?auto_167455 ) ) ( not ( = ?auto_167453 ?auto_167454 ) ) ( not ( = ?auto_167453 ?auto_167455 ) ) ( not ( = ?auto_167454 ?auto_167455 ) ) ( ON ?auto_167455 ?auto_167457 ) ( not ( = ?auto_167449 ?auto_167457 ) ) ( not ( = ?auto_167450 ?auto_167457 ) ) ( not ( = ?auto_167451 ?auto_167457 ) ) ( not ( = ?auto_167452 ?auto_167457 ) ) ( not ( = ?auto_167453 ?auto_167457 ) ) ( not ( = ?auto_167454 ?auto_167457 ) ) ( not ( = ?auto_167455 ?auto_167457 ) ) ( ON ?auto_167454 ?auto_167455 ) ( ON-TABLE ?auto_167456 ) ( ON ?auto_167457 ?auto_167456 ) ( not ( = ?auto_167456 ?auto_167457 ) ) ( not ( = ?auto_167456 ?auto_167455 ) ) ( not ( = ?auto_167456 ?auto_167454 ) ) ( not ( = ?auto_167449 ?auto_167456 ) ) ( not ( = ?auto_167450 ?auto_167456 ) ) ( not ( = ?auto_167451 ?auto_167456 ) ) ( not ( = ?auto_167452 ?auto_167456 ) ) ( not ( = ?auto_167453 ?auto_167456 ) ) ( ON ?auto_167453 ?auto_167454 ) ( ON ?auto_167452 ?auto_167453 ) ( CLEAR ?auto_167452 ) ( HOLDING ?auto_167451 ) ( CLEAR ?auto_167450 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167449 ?auto_167450 ?auto_167451 )
      ( MAKE-7PILE ?auto_167449 ?auto_167450 ?auto_167451 ?auto_167452 ?auto_167453 ?auto_167454 ?auto_167455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167458 - BLOCK
      ?auto_167459 - BLOCK
      ?auto_167460 - BLOCK
      ?auto_167461 - BLOCK
      ?auto_167462 - BLOCK
      ?auto_167463 - BLOCK
      ?auto_167464 - BLOCK
    )
    :vars
    (
      ?auto_167466 - BLOCK
      ?auto_167465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167458 ) ( ON ?auto_167459 ?auto_167458 ) ( not ( = ?auto_167458 ?auto_167459 ) ) ( not ( = ?auto_167458 ?auto_167460 ) ) ( not ( = ?auto_167458 ?auto_167461 ) ) ( not ( = ?auto_167458 ?auto_167462 ) ) ( not ( = ?auto_167458 ?auto_167463 ) ) ( not ( = ?auto_167458 ?auto_167464 ) ) ( not ( = ?auto_167459 ?auto_167460 ) ) ( not ( = ?auto_167459 ?auto_167461 ) ) ( not ( = ?auto_167459 ?auto_167462 ) ) ( not ( = ?auto_167459 ?auto_167463 ) ) ( not ( = ?auto_167459 ?auto_167464 ) ) ( not ( = ?auto_167460 ?auto_167461 ) ) ( not ( = ?auto_167460 ?auto_167462 ) ) ( not ( = ?auto_167460 ?auto_167463 ) ) ( not ( = ?auto_167460 ?auto_167464 ) ) ( not ( = ?auto_167461 ?auto_167462 ) ) ( not ( = ?auto_167461 ?auto_167463 ) ) ( not ( = ?auto_167461 ?auto_167464 ) ) ( not ( = ?auto_167462 ?auto_167463 ) ) ( not ( = ?auto_167462 ?auto_167464 ) ) ( not ( = ?auto_167463 ?auto_167464 ) ) ( ON ?auto_167464 ?auto_167466 ) ( not ( = ?auto_167458 ?auto_167466 ) ) ( not ( = ?auto_167459 ?auto_167466 ) ) ( not ( = ?auto_167460 ?auto_167466 ) ) ( not ( = ?auto_167461 ?auto_167466 ) ) ( not ( = ?auto_167462 ?auto_167466 ) ) ( not ( = ?auto_167463 ?auto_167466 ) ) ( not ( = ?auto_167464 ?auto_167466 ) ) ( ON ?auto_167463 ?auto_167464 ) ( ON-TABLE ?auto_167465 ) ( ON ?auto_167466 ?auto_167465 ) ( not ( = ?auto_167465 ?auto_167466 ) ) ( not ( = ?auto_167465 ?auto_167464 ) ) ( not ( = ?auto_167465 ?auto_167463 ) ) ( not ( = ?auto_167458 ?auto_167465 ) ) ( not ( = ?auto_167459 ?auto_167465 ) ) ( not ( = ?auto_167460 ?auto_167465 ) ) ( not ( = ?auto_167461 ?auto_167465 ) ) ( not ( = ?auto_167462 ?auto_167465 ) ) ( ON ?auto_167462 ?auto_167463 ) ( ON ?auto_167461 ?auto_167462 ) ( CLEAR ?auto_167459 ) ( ON ?auto_167460 ?auto_167461 ) ( CLEAR ?auto_167460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167465 ?auto_167466 ?auto_167464 ?auto_167463 ?auto_167462 ?auto_167461 )
      ( MAKE-7PILE ?auto_167458 ?auto_167459 ?auto_167460 ?auto_167461 ?auto_167462 ?auto_167463 ?auto_167464 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167467 - BLOCK
      ?auto_167468 - BLOCK
      ?auto_167469 - BLOCK
      ?auto_167470 - BLOCK
      ?auto_167471 - BLOCK
      ?auto_167472 - BLOCK
      ?auto_167473 - BLOCK
    )
    :vars
    (
      ?auto_167475 - BLOCK
      ?auto_167474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167467 ) ( not ( = ?auto_167467 ?auto_167468 ) ) ( not ( = ?auto_167467 ?auto_167469 ) ) ( not ( = ?auto_167467 ?auto_167470 ) ) ( not ( = ?auto_167467 ?auto_167471 ) ) ( not ( = ?auto_167467 ?auto_167472 ) ) ( not ( = ?auto_167467 ?auto_167473 ) ) ( not ( = ?auto_167468 ?auto_167469 ) ) ( not ( = ?auto_167468 ?auto_167470 ) ) ( not ( = ?auto_167468 ?auto_167471 ) ) ( not ( = ?auto_167468 ?auto_167472 ) ) ( not ( = ?auto_167468 ?auto_167473 ) ) ( not ( = ?auto_167469 ?auto_167470 ) ) ( not ( = ?auto_167469 ?auto_167471 ) ) ( not ( = ?auto_167469 ?auto_167472 ) ) ( not ( = ?auto_167469 ?auto_167473 ) ) ( not ( = ?auto_167470 ?auto_167471 ) ) ( not ( = ?auto_167470 ?auto_167472 ) ) ( not ( = ?auto_167470 ?auto_167473 ) ) ( not ( = ?auto_167471 ?auto_167472 ) ) ( not ( = ?auto_167471 ?auto_167473 ) ) ( not ( = ?auto_167472 ?auto_167473 ) ) ( ON ?auto_167473 ?auto_167475 ) ( not ( = ?auto_167467 ?auto_167475 ) ) ( not ( = ?auto_167468 ?auto_167475 ) ) ( not ( = ?auto_167469 ?auto_167475 ) ) ( not ( = ?auto_167470 ?auto_167475 ) ) ( not ( = ?auto_167471 ?auto_167475 ) ) ( not ( = ?auto_167472 ?auto_167475 ) ) ( not ( = ?auto_167473 ?auto_167475 ) ) ( ON ?auto_167472 ?auto_167473 ) ( ON-TABLE ?auto_167474 ) ( ON ?auto_167475 ?auto_167474 ) ( not ( = ?auto_167474 ?auto_167475 ) ) ( not ( = ?auto_167474 ?auto_167473 ) ) ( not ( = ?auto_167474 ?auto_167472 ) ) ( not ( = ?auto_167467 ?auto_167474 ) ) ( not ( = ?auto_167468 ?auto_167474 ) ) ( not ( = ?auto_167469 ?auto_167474 ) ) ( not ( = ?auto_167470 ?auto_167474 ) ) ( not ( = ?auto_167471 ?auto_167474 ) ) ( ON ?auto_167471 ?auto_167472 ) ( ON ?auto_167470 ?auto_167471 ) ( ON ?auto_167469 ?auto_167470 ) ( CLEAR ?auto_167469 ) ( HOLDING ?auto_167468 ) ( CLEAR ?auto_167467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167467 ?auto_167468 )
      ( MAKE-7PILE ?auto_167467 ?auto_167468 ?auto_167469 ?auto_167470 ?auto_167471 ?auto_167472 ?auto_167473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167476 - BLOCK
      ?auto_167477 - BLOCK
      ?auto_167478 - BLOCK
      ?auto_167479 - BLOCK
      ?auto_167480 - BLOCK
      ?auto_167481 - BLOCK
      ?auto_167482 - BLOCK
    )
    :vars
    (
      ?auto_167483 - BLOCK
      ?auto_167484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167476 ) ( not ( = ?auto_167476 ?auto_167477 ) ) ( not ( = ?auto_167476 ?auto_167478 ) ) ( not ( = ?auto_167476 ?auto_167479 ) ) ( not ( = ?auto_167476 ?auto_167480 ) ) ( not ( = ?auto_167476 ?auto_167481 ) ) ( not ( = ?auto_167476 ?auto_167482 ) ) ( not ( = ?auto_167477 ?auto_167478 ) ) ( not ( = ?auto_167477 ?auto_167479 ) ) ( not ( = ?auto_167477 ?auto_167480 ) ) ( not ( = ?auto_167477 ?auto_167481 ) ) ( not ( = ?auto_167477 ?auto_167482 ) ) ( not ( = ?auto_167478 ?auto_167479 ) ) ( not ( = ?auto_167478 ?auto_167480 ) ) ( not ( = ?auto_167478 ?auto_167481 ) ) ( not ( = ?auto_167478 ?auto_167482 ) ) ( not ( = ?auto_167479 ?auto_167480 ) ) ( not ( = ?auto_167479 ?auto_167481 ) ) ( not ( = ?auto_167479 ?auto_167482 ) ) ( not ( = ?auto_167480 ?auto_167481 ) ) ( not ( = ?auto_167480 ?auto_167482 ) ) ( not ( = ?auto_167481 ?auto_167482 ) ) ( ON ?auto_167482 ?auto_167483 ) ( not ( = ?auto_167476 ?auto_167483 ) ) ( not ( = ?auto_167477 ?auto_167483 ) ) ( not ( = ?auto_167478 ?auto_167483 ) ) ( not ( = ?auto_167479 ?auto_167483 ) ) ( not ( = ?auto_167480 ?auto_167483 ) ) ( not ( = ?auto_167481 ?auto_167483 ) ) ( not ( = ?auto_167482 ?auto_167483 ) ) ( ON ?auto_167481 ?auto_167482 ) ( ON-TABLE ?auto_167484 ) ( ON ?auto_167483 ?auto_167484 ) ( not ( = ?auto_167484 ?auto_167483 ) ) ( not ( = ?auto_167484 ?auto_167482 ) ) ( not ( = ?auto_167484 ?auto_167481 ) ) ( not ( = ?auto_167476 ?auto_167484 ) ) ( not ( = ?auto_167477 ?auto_167484 ) ) ( not ( = ?auto_167478 ?auto_167484 ) ) ( not ( = ?auto_167479 ?auto_167484 ) ) ( not ( = ?auto_167480 ?auto_167484 ) ) ( ON ?auto_167480 ?auto_167481 ) ( ON ?auto_167479 ?auto_167480 ) ( ON ?auto_167478 ?auto_167479 ) ( CLEAR ?auto_167476 ) ( ON ?auto_167477 ?auto_167478 ) ( CLEAR ?auto_167477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167484 ?auto_167483 ?auto_167482 ?auto_167481 ?auto_167480 ?auto_167479 ?auto_167478 )
      ( MAKE-7PILE ?auto_167476 ?auto_167477 ?auto_167478 ?auto_167479 ?auto_167480 ?auto_167481 ?auto_167482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167485 - BLOCK
      ?auto_167486 - BLOCK
      ?auto_167487 - BLOCK
      ?auto_167488 - BLOCK
      ?auto_167489 - BLOCK
      ?auto_167490 - BLOCK
      ?auto_167491 - BLOCK
    )
    :vars
    (
      ?auto_167492 - BLOCK
      ?auto_167493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167485 ?auto_167486 ) ) ( not ( = ?auto_167485 ?auto_167487 ) ) ( not ( = ?auto_167485 ?auto_167488 ) ) ( not ( = ?auto_167485 ?auto_167489 ) ) ( not ( = ?auto_167485 ?auto_167490 ) ) ( not ( = ?auto_167485 ?auto_167491 ) ) ( not ( = ?auto_167486 ?auto_167487 ) ) ( not ( = ?auto_167486 ?auto_167488 ) ) ( not ( = ?auto_167486 ?auto_167489 ) ) ( not ( = ?auto_167486 ?auto_167490 ) ) ( not ( = ?auto_167486 ?auto_167491 ) ) ( not ( = ?auto_167487 ?auto_167488 ) ) ( not ( = ?auto_167487 ?auto_167489 ) ) ( not ( = ?auto_167487 ?auto_167490 ) ) ( not ( = ?auto_167487 ?auto_167491 ) ) ( not ( = ?auto_167488 ?auto_167489 ) ) ( not ( = ?auto_167488 ?auto_167490 ) ) ( not ( = ?auto_167488 ?auto_167491 ) ) ( not ( = ?auto_167489 ?auto_167490 ) ) ( not ( = ?auto_167489 ?auto_167491 ) ) ( not ( = ?auto_167490 ?auto_167491 ) ) ( ON ?auto_167491 ?auto_167492 ) ( not ( = ?auto_167485 ?auto_167492 ) ) ( not ( = ?auto_167486 ?auto_167492 ) ) ( not ( = ?auto_167487 ?auto_167492 ) ) ( not ( = ?auto_167488 ?auto_167492 ) ) ( not ( = ?auto_167489 ?auto_167492 ) ) ( not ( = ?auto_167490 ?auto_167492 ) ) ( not ( = ?auto_167491 ?auto_167492 ) ) ( ON ?auto_167490 ?auto_167491 ) ( ON-TABLE ?auto_167493 ) ( ON ?auto_167492 ?auto_167493 ) ( not ( = ?auto_167493 ?auto_167492 ) ) ( not ( = ?auto_167493 ?auto_167491 ) ) ( not ( = ?auto_167493 ?auto_167490 ) ) ( not ( = ?auto_167485 ?auto_167493 ) ) ( not ( = ?auto_167486 ?auto_167493 ) ) ( not ( = ?auto_167487 ?auto_167493 ) ) ( not ( = ?auto_167488 ?auto_167493 ) ) ( not ( = ?auto_167489 ?auto_167493 ) ) ( ON ?auto_167489 ?auto_167490 ) ( ON ?auto_167488 ?auto_167489 ) ( ON ?auto_167487 ?auto_167488 ) ( ON ?auto_167486 ?auto_167487 ) ( CLEAR ?auto_167486 ) ( HOLDING ?auto_167485 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167485 )
      ( MAKE-7PILE ?auto_167485 ?auto_167486 ?auto_167487 ?auto_167488 ?auto_167489 ?auto_167490 ?auto_167491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167494 - BLOCK
      ?auto_167495 - BLOCK
      ?auto_167496 - BLOCK
      ?auto_167497 - BLOCK
      ?auto_167498 - BLOCK
      ?auto_167499 - BLOCK
      ?auto_167500 - BLOCK
    )
    :vars
    (
      ?auto_167501 - BLOCK
      ?auto_167502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167494 ?auto_167495 ) ) ( not ( = ?auto_167494 ?auto_167496 ) ) ( not ( = ?auto_167494 ?auto_167497 ) ) ( not ( = ?auto_167494 ?auto_167498 ) ) ( not ( = ?auto_167494 ?auto_167499 ) ) ( not ( = ?auto_167494 ?auto_167500 ) ) ( not ( = ?auto_167495 ?auto_167496 ) ) ( not ( = ?auto_167495 ?auto_167497 ) ) ( not ( = ?auto_167495 ?auto_167498 ) ) ( not ( = ?auto_167495 ?auto_167499 ) ) ( not ( = ?auto_167495 ?auto_167500 ) ) ( not ( = ?auto_167496 ?auto_167497 ) ) ( not ( = ?auto_167496 ?auto_167498 ) ) ( not ( = ?auto_167496 ?auto_167499 ) ) ( not ( = ?auto_167496 ?auto_167500 ) ) ( not ( = ?auto_167497 ?auto_167498 ) ) ( not ( = ?auto_167497 ?auto_167499 ) ) ( not ( = ?auto_167497 ?auto_167500 ) ) ( not ( = ?auto_167498 ?auto_167499 ) ) ( not ( = ?auto_167498 ?auto_167500 ) ) ( not ( = ?auto_167499 ?auto_167500 ) ) ( ON ?auto_167500 ?auto_167501 ) ( not ( = ?auto_167494 ?auto_167501 ) ) ( not ( = ?auto_167495 ?auto_167501 ) ) ( not ( = ?auto_167496 ?auto_167501 ) ) ( not ( = ?auto_167497 ?auto_167501 ) ) ( not ( = ?auto_167498 ?auto_167501 ) ) ( not ( = ?auto_167499 ?auto_167501 ) ) ( not ( = ?auto_167500 ?auto_167501 ) ) ( ON ?auto_167499 ?auto_167500 ) ( ON-TABLE ?auto_167502 ) ( ON ?auto_167501 ?auto_167502 ) ( not ( = ?auto_167502 ?auto_167501 ) ) ( not ( = ?auto_167502 ?auto_167500 ) ) ( not ( = ?auto_167502 ?auto_167499 ) ) ( not ( = ?auto_167494 ?auto_167502 ) ) ( not ( = ?auto_167495 ?auto_167502 ) ) ( not ( = ?auto_167496 ?auto_167502 ) ) ( not ( = ?auto_167497 ?auto_167502 ) ) ( not ( = ?auto_167498 ?auto_167502 ) ) ( ON ?auto_167498 ?auto_167499 ) ( ON ?auto_167497 ?auto_167498 ) ( ON ?auto_167496 ?auto_167497 ) ( ON ?auto_167495 ?auto_167496 ) ( ON ?auto_167494 ?auto_167495 ) ( CLEAR ?auto_167494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167502 ?auto_167501 ?auto_167500 ?auto_167499 ?auto_167498 ?auto_167497 ?auto_167496 ?auto_167495 )
      ( MAKE-7PILE ?auto_167494 ?auto_167495 ?auto_167496 ?auto_167497 ?auto_167498 ?auto_167499 ?auto_167500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167504 - BLOCK
    )
    :vars
    (
      ?auto_167505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167505 ?auto_167504 ) ( CLEAR ?auto_167505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167504 ) ( not ( = ?auto_167504 ?auto_167505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167505 ?auto_167504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167506 - BLOCK
    )
    :vars
    (
      ?auto_167507 - BLOCK
      ?auto_167508 - BLOCK
      ?auto_167509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167507 ?auto_167506 ) ( CLEAR ?auto_167507 ) ( ON-TABLE ?auto_167506 ) ( not ( = ?auto_167506 ?auto_167507 ) ) ( HOLDING ?auto_167508 ) ( CLEAR ?auto_167509 ) ( not ( = ?auto_167506 ?auto_167508 ) ) ( not ( = ?auto_167506 ?auto_167509 ) ) ( not ( = ?auto_167507 ?auto_167508 ) ) ( not ( = ?auto_167507 ?auto_167509 ) ) ( not ( = ?auto_167508 ?auto_167509 ) ) )
    :subtasks
    ( ( !STACK ?auto_167508 ?auto_167509 )
      ( MAKE-1PILE ?auto_167506 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167510 - BLOCK
    )
    :vars
    (
      ?auto_167511 - BLOCK
      ?auto_167513 - BLOCK
      ?auto_167512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167511 ?auto_167510 ) ( ON-TABLE ?auto_167510 ) ( not ( = ?auto_167510 ?auto_167511 ) ) ( CLEAR ?auto_167513 ) ( not ( = ?auto_167510 ?auto_167512 ) ) ( not ( = ?auto_167510 ?auto_167513 ) ) ( not ( = ?auto_167511 ?auto_167512 ) ) ( not ( = ?auto_167511 ?auto_167513 ) ) ( not ( = ?auto_167512 ?auto_167513 ) ) ( ON ?auto_167512 ?auto_167511 ) ( CLEAR ?auto_167512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167510 ?auto_167511 )
      ( MAKE-1PILE ?auto_167510 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167514 - BLOCK
    )
    :vars
    (
      ?auto_167517 - BLOCK
      ?auto_167515 - BLOCK
      ?auto_167516 - BLOCK
      ?auto_167518 - BLOCK
      ?auto_167522 - BLOCK
      ?auto_167520 - BLOCK
      ?auto_167521 - BLOCK
      ?auto_167519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167517 ?auto_167514 ) ( ON-TABLE ?auto_167514 ) ( not ( = ?auto_167514 ?auto_167517 ) ) ( not ( = ?auto_167514 ?auto_167515 ) ) ( not ( = ?auto_167514 ?auto_167516 ) ) ( not ( = ?auto_167517 ?auto_167515 ) ) ( not ( = ?auto_167517 ?auto_167516 ) ) ( not ( = ?auto_167515 ?auto_167516 ) ) ( ON ?auto_167515 ?auto_167517 ) ( CLEAR ?auto_167515 ) ( HOLDING ?auto_167516 ) ( CLEAR ?auto_167518 ) ( ON-TABLE ?auto_167522 ) ( ON ?auto_167520 ?auto_167522 ) ( ON ?auto_167521 ?auto_167520 ) ( ON ?auto_167519 ?auto_167521 ) ( ON ?auto_167518 ?auto_167519 ) ( not ( = ?auto_167522 ?auto_167520 ) ) ( not ( = ?auto_167522 ?auto_167521 ) ) ( not ( = ?auto_167522 ?auto_167519 ) ) ( not ( = ?auto_167522 ?auto_167518 ) ) ( not ( = ?auto_167522 ?auto_167516 ) ) ( not ( = ?auto_167520 ?auto_167521 ) ) ( not ( = ?auto_167520 ?auto_167519 ) ) ( not ( = ?auto_167520 ?auto_167518 ) ) ( not ( = ?auto_167520 ?auto_167516 ) ) ( not ( = ?auto_167521 ?auto_167519 ) ) ( not ( = ?auto_167521 ?auto_167518 ) ) ( not ( = ?auto_167521 ?auto_167516 ) ) ( not ( = ?auto_167519 ?auto_167518 ) ) ( not ( = ?auto_167519 ?auto_167516 ) ) ( not ( = ?auto_167518 ?auto_167516 ) ) ( not ( = ?auto_167514 ?auto_167518 ) ) ( not ( = ?auto_167514 ?auto_167522 ) ) ( not ( = ?auto_167514 ?auto_167520 ) ) ( not ( = ?auto_167514 ?auto_167521 ) ) ( not ( = ?auto_167514 ?auto_167519 ) ) ( not ( = ?auto_167517 ?auto_167518 ) ) ( not ( = ?auto_167517 ?auto_167522 ) ) ( not ( = ?auto_167517 ?auto_167520 ) ) ( not ( = ?auto_167517 ?auto_167521 ) ) ( not ( = ?auto_167517 ?auto_167519 ) ) ( not ( = ?auto_167515 ?auto_167518 ) ) ( not ( = ?auto_167515 ?auto_167522 ) ) ( not ( = ?auto_167515 ?auto_167520 ) ) ( not ( = ?auto_167515 ?auto_167521 ) ) ( not ( = ?auto_167515 ?auto_167519 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167522 ?auto_167520 ?auto_167521 ?auto_167519 ?auto_167518 ?auto_167516 )
      ( MAKE-1PILE ?auto_167514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167523 - BLOCK
    )
    :vars
    (
      ?auto_167524 - BLOCK
      ?auto_167531 - BLOCK
      ?auto_167525 - BLOCK
      ?auto_167529 - BLOCK
      ?auto_167530 - BLOCK
      ?auto_167527 - BLOCK
      ?auto_167526 - BLOCK
      ?auto_167528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167524 ?auto_167523 ) ( ON-TABLE ?auto_167523 ) ( not ( = ?auto_167523 ?auto_167524 ) ) ( not ( = ?auto_167523 ?auto_167531 ) ) ( not ( = ?auto_167523 ?auto_167525 ) ) ( not ( = ?auto_167524 ?auto_167531 ) ) ( not ( = ?auto_167524 ?auto_167525 ) ) ( not ( = ?auto_167531 ?auto_167525 ) ) ( ON ?auto_167531 ?auto_167524 ) ( CLEAR ?auto_167529 ) ( ON-TABLE ?auto_167530 ) ( ON ?auto_167527 ?auto_167530 ) ( ON ?auto_167526 ?auto_167527 ) ( ON ?auto_167528 ?auto_167526 ) ( ON ?auto_167529 ?auto_167528 ) ( not ( = ?auto_167530 ?auto_167527 ) ) ( not ( = ?auto_167530 ?auto_167526 ) ) ( not ( = ?auto_167530 ?auto_167528 ) ) ( not ( = ?auto_167530 ?auto_167529 ) ) ( not ( = ?auto_167530 ?auto_167525 ) ) ( not ( = ?auto_167527 ?auto_167526 ) ) ( not ( = ?auto_167527 ?auto_167528 ) ) ( not ( = ?auto_167527 ?auto_167529 ) ) ( not ( = ?auto_167527 ?auto_167525 ) ) ( not ( = ?auto_167526 ?auto_167528 ) ) ( not ( = ?auto_167526 ?auto_167529 ) ) ( not ( = ?auto_167526 ?auto_167525 ) ) ( not ( = ?auto_167528 ?auto_167529 ) ) ( not ( = ?auto_167528 ?auto_167525 ) ) ( not ( = ?auto_167529 ?auto_167525 ) ) ( not ( = ?auto_167523 ?auto_167529 ) ) ( not ( = ?auto_167523 ?auto_167530 ) ) ( not ( = ?auto_167523 ?auto_167527 ) ) ( not ( = ?auto_167523 ?auto_167526 ) ) ( not ( = ?auto_167523 ?auto_167528 ) ) ( not ( = ?auto_167524 ?auto_167529 ) ) ( not ( = ?auto_167524 ?auto_167530 ) ) ( not ( = ?auto_167524 ?auto_167527 ) ) ( not ( = ?auto_167524 ?auto_167526 ) ) ( not ( = ?auto_167524 ?auto_167528 ) ) ( not ( = ?auto_167531 ?auto_167529 ) ) ( not ( = ?auto_167531 ?auto_167530 ) ) ( not ( = ?auto_167531 ?auto_167527 ) ) ( not ( = ?auto_167531 ?auto_167526 ) ) ( not ( = ?auto_167531 ?auto_167528 ) ) ( ON ?auto_167525 ?auto_167531 ) ( CLEAR ?auto_167525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167523 ?auto_167524 ?auto_167531 )
      ( MAKE-1PILE ?auto_167523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167532 - BLOCK
    )
    :vars
    (
      ?auto_167534 - BLOCK
      ?auto_167538 - BLOCK
      ?auto_167535 - BLOCK
      ?auto_167539 - BLOCK
      ?auto_167537 - BLOCK
      ?auto_167536 - BLOCK
      ?auto_167533 - BLOCK
      ?auto_167540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167534 ?auto_167532 ) ( ON-TABLE ?auto_167532 ) ( not ( = ?auto_167532 ?auto_167534 ) ) ( not ( = ?auto_167532 ?auto_167538 ) ) ( not ( = ?auto_167532 ?auto_167535 ) ) ( not ( = ?auto_167534 ?auto_167538 ) ) ( not ( = ?auto_167534 ?auto_167535 ) ) ( not ( = ?auto_167538 ?auto_167535 ) ) ( ON ?auto_167538 ?auto_167534 ) ( ON-TABLE ?auto_167539 ) ( ON ?auto_167537 ?auto_167539 ) ( ON ?auto_167536 ?auto_167537 ) ( ON ?auto_167533 ?auto_167536 ) ( not ( = ?auto_167539 ?auto_167537 ) ) ( not ( = ?auto_167539 ?auto_167536 ) ) ( not ( = ?auto_167539 ?auto_167533 ) ) ( not ( = ?auto_167539 ?auto_167540 ) ) ( not ( = ?auto_167539 ?auto_167535 ) ) ( not ( = ?auto_167537 ?auto_167536 ) ) ( not ( = ?auto_167537 ?auto_167533 ) ) ( not ( = ?auto_167537 ?auto_167540 ) ) ( not ( = ?auto_167537 ?auto_167535 ) ) ( not ( = ?auto_167536 ?auto_167533 ) ) ( not ( = ?auto_167536 ?auto_167540 ) ) ( not ( = ?auto_167536 ?auto_167535 ) ) ( not ( = ?auto_167533 ?auto_167540 ) ) ( not ( = ?auto_167533 ?auto_167535 ) ) ( not ( = ?auto_167540 ?auto_167535 ) ) ( not ( = ?auto_167532 ?auto_167540 ) ) ( not ( = ?auto_167532 ?auto_167539 ) ) ( not ( = ?auto_167532 ?auto_167537 ) ) ( not ( = ?auto_167532 ?auto_167536 ) ) ( not ( = ?auto_167532 ?auto_167533 ) ) ( not ( = ?auto_167534 ?auto_167540 ) ) ( not ( = ?auto_167534 ?auto_167539 ) ) ( not ( = ?auto_167534 ?auto_167537 ) ) ( not ( = ?auto_167534 ?auto_167536 ) ) ( not ( = ?auto_167534 ?auto_167533 ) ) ( not ( = ?auto_167538 ?auto_167540 ) ) ( not ( = ?auto_167538 ?auto_167539 ) ) ( not ( = ?auto_167538 ?auto_167537 ) ) ( not ( = ?auto_167538 ?auto_167536 ) ) ( not ( = ?auto_167538 ?auto_167533 ) ) ( ON ?auto_167535 ?auto_167538 ) ( CLEAR ?auto_167535 ) ( HOLDING ?auto_167540 ) ( CLEAR ?auto_167533 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167539 ?auto_167537 ?auto_167536 ?auto_167533 ?auto_167540 )
      ( MAKE-1PILE ?auto_167532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167541 - BLOCK
    )
    :vars
    (
      ?auto_167542 - BLOCK
      ?auto_167549 - BLOCK
      ?auto_167548 - BLOCK
      ?auto_167547 - BLOCK
      ?auto_167546 - BLOCK
      ?auto_167545 - BLOCK
      ?auto_167544 - BLOCK
      ?auto_167543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167542 ?auto_167541 ) ( ON-TABLE ?auto_167541 ) ( not ( = ?auto_167541 ?auto_167542 ) ) ( not ( = ?auto_167541 ?auto_167549 ) ) ( not ( = ?auto_167541 ?auto_167548 ) ) ( not ( = ?auto_167542 ?auto_167549 ) ) ( not ( = ?auto_167542 ?auto_167548 ) ) ( not ( = ?auto_167549 ?auto_167548 ) ) ( ON ?auto_167549 ?auto_167542 ) ( ON-TABLE ?auto_167547 ) ( ON ?auto_167546 ?auto_167547 ) ( ON ?auto_167545 ?auto_167546 ) ( ON ?auto_167544 ?auto_167545 ) ( not ( = ?auto_167547 ?auto_167546 ) ) ( not ( = ?auto_167547 ?auto_167545 ) ) ( not ( = ?auto_167547 ?auto_167544 ) ) ( not ( = ?auto_167547 ?auto_167543 ) ) ( not ( = ?auto_167547 ?auto_167548 ) ) ( not ( = ?auto_167546 ?auto_167545 ) ) ( not ( = ?auto_167546 ?auto_167544 ) ) ( not ( = ?auto_167546 ?auto_167543 ) ) ( not ( = ?auto_167546 ?auto_167548 ) ) ( not ( = ?auto_167545 ?auto_167544 ) ) ( not ( = ?auto_167545 ?auto_167543 ) ) ( not ( = ?auto_167545 ?auto_167548 ) ) ( not ( = ?auto_167544 ?auto_167543 ) ) ( not ( = ?auto_167544 ?auto_167548 ) ) ( not ( = ?auto_167543 ?auto_167548 ) ) ( not ( = ?auto_167541 ?auto_167543 ) ) ( not ( = ?auto_167541 ?auto_167547 ) ) ( not ( = ?auto_167541 ?auto_167546 ) ) ( not ( = ?auto_167541 ?auto_167545 ) ) ( not ( = ?auto_167541 ?auto_167544 ) ) ( not ( = ?auto_167542 ?auto_167543 ) ) ( not ( = ?auto_167542 ?auto_167547 ) ) ( not ( = ?auto_167542 ?auto_167546 ) ) ( not ( = ?auto_167542 ?auto_167545 ) ) ( not ( = ?auto_167542 ?auto_167544 ) ) ( not ( = ?auto_167549 ?auto_167543 ) ) ( not ( = ?auto_167549 ?auto_167547 ) ) ( not ( = ?auto_167549 ?auto_167546 ) ) ( not ( = ?auto_167549 ?auto_167545 ) ) ( not ( = ?auto_167549 ?auto_167544 ) ) ( ON ?auto_167548 ?auto_167549 ) ( CLEAR ?auto_167544 ) ( ON ?auto_167543 ?auto_167548 ) ( CLEAR ?auto_167543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167541 ?auto_167542 ?auto_167549 ?auto_167548 )
      ( MAKE-1PILE ?auto_167541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167550 - BLOCK
    )
    :vars
    (
      ?auto_167556 - BLOCK
      ?auto_167554 - BLOCK
      ?auto_167551 - BLOCK
      ?auto_167552 - BLOCK
      ?auto_167557 - BLOCK
      ?auto_167555 - BLOCK
      ?auto_167553 - BLOCK
      ?auto_167558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167556 ?auto_167550 ) ( ON-TABLE ?auto_167550 ) ( not ( = ?auto_167550 ?auto_167556 ) ) ( not ( = ?auto_167550 ?auto_167554 ) ) ( not ( = ?auto_167550 ?auto_167551 ) ) ( not ( = ?auto_167556 ?auto_167554 ) ) ( not ( = ?auto_167556 ?auto_167551 ) ) ( not ( = ?auto_167554 ?auto_167551 ) ) ( ON ?auto_167554 ?auto_167556 ) ( ON-TABLE ?auto_167552 ) ( ON ?auto_167557 ?auto_167552 ) ( ON ?auto_167555 ?auto_167557 ) ( not ( = ?auto_167552 ?auto_167557 ) ) ( not ( = ?auto_167552 ?auto_167555 ) ) ( not ( = ?auto_167552 ?auto_167553 ) ) ( not ( = ?auto_167552 ?auto_167558 ) ) ( not ( = ?auto_167552 ?auto_167551 ) ) ( not ( = ?auto_167557 ?auto_167555 ) ) ( not ( = ?auto_167557 ?auto_167553 ) ) ( not ( = ?auto_167557 ?auto_167558 ) ) ( not ( = ?auto_167557 ?auto_167551 ) ) ( not ( = ?auto_167555 ?auto_167553 ) ) ( not ( = ?auto_167555 ?auto_167558 ) ) ( not ( = ?auto_167555 ?auto_167551 ) ) ( not ( = ?auto_167553 ?auto_167558 ) ) ( not ( = ?auto_167553 ?auto_167551 ) ) ( not ( = ?auto_167558 ?auto_167551 ) ) ( not ( = ?auto_167550 ?auto_167558 ) ) ( not ( = ?auto_167550 ?auto_167552 ) ) ( not ( = ?auto_167550 ?auto_167557 ) ) ( not ( = ?auto_167550 ?auto_167555 ) ) ( not ( = ?auto_167550 ?auto_167553 ) ) ( not ( = ?auto_167556 ?auto_167558 ) ) ( not ( = ?auto_167556 ?auto_167552 ) ) ( not ( = ?auto_167556 ?auto_167557 ) ) ( not ( = ?auto_167556 ?auto_167555 ) ) ( not ( = ?auto_167556 ?auto_167553 ) ) ( not ( = ?auto_167554 ?auto_167558 ) ) ( not ( = ?auto_167554 ?auto_167552 ) ) ( not ( = ?auto_167554 ?auto_167557 ) ) ( not ( = ?auto_167554 ?auto_167555 ) ) ( not ( = ?auto_167554 ?auto_167553 ) ) ( ON ?auto_167551 ?auto_167554 ) ( ON ?auto_167558 ?auto_167551 ) ( CLEAR ?auto_167558 ) ( HOLDING ?auto_167553 ) ( CLEAR ?auto_167555 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167552 ?auto_167557 ?auto_167555 ?auto_167553 )
      ( MAKE-1PILE ?auto_167550 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167559 - BLOCK
    )
    :vars
    (
      ?auto_167566 - BLOCK
      ?auto_167565 - BLOCK
      ?auto_167560 - BLOCK
      ?auto_167564 - BLOCK
      ?auto_167561 - BLOCK
      ?auto_167562 - BLOCK
      ?auto_167567 - BLOCK
      ?auto_167563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167566 ?auto_167559 ) ( ON-TABLE ?auto_167559 ) ( not ( = ?auto_167559 ?auto_167566 ) ) ( not ( = ?auto_167559 ?auto_167565 ) ) ( not ( = ?auto_167559 ?auto_167560 ) ) ( not ( = ?auto_167566 ?auto_167565 ) ) ( not ( = ?auto_167566 ?auto_167560 ) ) ( not ( = ?auto_167565 ?auto_167560 ) ) ( ON ?auto_167565 ?auto_167566 ) ( ON-TABLE ?auto_167564 ) ( ON ?auto_167561 ?auto_167564 ) ( ON ?auto_167562 ?auto_167561 ) ( not ( = ?auto_167564 ?auto_167561 ) ) ( not ( = ?auto_167564 ?auto_167562 ) ) ( not ( = ?auto_167564 ?auto_167567 ) ) ( not ( = ?auto_167564 ?auto_167563 ) ) ( not ( = ?auto_167564 ?auto_167560 ) ) ( not ( = ?auto_167561 ?auto_167562 ) ) ( not ( = ?auto_167561 ?auto_167567 ) ) ( not ( = ?auto_167561 ?auto_167563 ) ) ( not ( = ?auto_167561 ?auto_167560 ) ) ( not ( = ?auto_167562 ?auto_167567 ) ) ( not ( = ?auto_167562 ?auto_167563 ) ) ( not ( = ?auto_167562 ?auto_167560 ) ) ( not ( = ?auto_167567 ?auto_167563 ) ) ( not ( = ?auto_167567 ?auto_167560 ) ) ( not ( = ?auto_167563 ?auto_167560 ) ) ( not ( = ?auto_167559 ?auto_167563 ) ) ( not ( = ?auto_167559 ?auto_167564 ) ) ( not ( = ?auto_167559 ?auto_167561 ) ) ( not ( = ?auto_167559 ?auto_167562 ) ) ( not ( = ?auto_167559 ?auto_167567 ) ) ( not ( = ?auto_167566 ?auto_167563 ) ) ( not ( = ?auto_167566 ?auto_167564 ) ) ( not ( = ?auto_167566 ?auto_167561 ) ) ( not ( = ?auto_167566 ?auto_167562 ) ) ( not ( = ?auto_167566 ?auto_167567 ) ) ( not ( = ?auto_167565 ?auto_167563 ) ) ( not ( = ?auto_167565 ?auto_167564 ) ) ( not ( = ?auto_167565 ?auto_167561 ) ) ( not ( = ?auto_167565 ?auto_167562 ) ) ( not ( = ?auto_167565 ?auto_167567 ) ) ( ON ?auto_167560 ?auto_167565 ) ( ON ?auto_167563 ?auto_167560 ) ( CLEAR ?auto_167562 ) ( ON ?auto_167567 ?auto_167563 ) ( CLEAR ?auto_167567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167559 ?auto_167566 ?auto_167565 ?auto_167560 ?auto_167563 )
      ( MAKE-1PILE ?auto_167559 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167568 - BLOCK
    )
    :vars
    (
      ?auto_167571 - BLOCK
      ?auto_167574 - BLOCK
      ?auto_167573 - BLOCK
      ?auto_167576 - BLOCK
      ?auto_167570 - BLOCK
      ?auto_167575 - BLOCK
      ?auto_167569 - BLOCK
      ?auto_167572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167571 ?auto_167568 ) ( ON-TABLE ?auto_167568 ) ( not ( = ?auto_167568 ?auto_167571 ) ) ( not ( = ?auto_167568 ?auto_167574 ) ) ( not ( = ?auto_167568 ?auto_167573 ) ) ( not ( = ?auto_167571 ?auto_167574 ) ) ( not ( = ?auto_167571 ?auto_167573 ) ) ( not ( = ?auto_167574 ?auto_167573 ) ) ( ON ?auto_167574 ?auto_167571 ) ( ON-TABLE ?auto_167576 ) ( ON ?auto_167570 ?auto_167576 ) ( not ( = ?auto_167576 ?auto_167570 ) ) ( not ( = ?auto_167576 ?auto_167575 ) ) ( not ( = ?auto_167576 ?auto_167569 ) ) ( not ( = ?auto_167576 ?auto_167572 ) ) ( not ( = ?auto_167576 ?auto_167573 ) ) ( not ( = ?auto_167570 ?auto_167575 ) ) ( not ( = ?auto_167570 ?auto_167569 ) ) ( not ( = ?auto_167570 ?auto_167572 ) ) ( not ( = ?auto_167570 ?auto_167573 ) ) ( not ( = ?auto_167575 ?auto_167569 ) ) ( not ( = ?auto_167575 ?auto_167572 ) ) ( not ( = ?auto_167575 ?auto_167573 ) ) ( not ( = ?auto_167569 ?auto_167572 ) ) ( not ( = ?auto_167569 ?auto_167573 ) ) ( not ( = ?auto_167572 ?auto_167573 ) ) ( not ( = ?auto_167568 ?auto_167572 ) ) ( not ( = ?auto_167568 ?auto_167576 ) ) ( not ( = ?auto_167568 ?auto_167570 ) ) ( not ( = ?auto_167568 ?auto_167575 ) ) ( not ( = ?auto_167568 ?auto_167569 ) ) ( not ( = ?auto_167571 ?auto_167572 ) ) ( not ( = ?auto_167571 ?auto_167576 ) ) ( not ( = ?auto_167571 ?auto_167570 ) ) ( not ( = ?auto_167571 ?auto_167575 ) ) ( not ( = ?auto_167571 ?auto_167569 ) ) ( not ( = ?auto_167574 ?auto_167572 ) ) ( not ( = ?auto_167574 ?auto_167576 ) ) ( not ( = ?auto_167574 ?auto_167570 ) ) ( not ( = ?auto_167574 ?auto_167575 ) ) ( not ( = ?auto_167574 ?auto_167569 ) ) ( ON ?auto_167573 ?auto_167574 ) ( ON ?auto_167572 ?auto_167573 ) ( ON ?auto_167569 ?auto_167572 ) ( CLEAR ?auto_167569 ) ( HOLDING ?auto_167575 ) ( CLEAR ?auto_167570 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167576 ?auto_167570 ?auto_167575 )
      ( MAKE-1PILE ?auto_167568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167577 - BLOCK
    )
    :vars
    (
      ?auto_167581 - BLOCK
      ?auto_167584 - BLOCK
      ?auto_167580 - BLOCK
      ?auto_167578 - BLOCK
      ?auto_167579 - BLOCK
      ?auto_167582 - BLOCK
      ?auto_167585 - BLOCK
      ?auto_167583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167581 ?auto_167577 ) ( ON-TABLE ?auto_167577 ) ( not ( = ?auto_167577 ?auto_167581 ) ) ( not ( = ?auto_167577 ?auto_167584 ) ) ( not ( = ?auto_167577 ?auto_167580 ) ) ( not ( = ?auto_167581 ?auto_167584 ) ) ( not ( = ?auto_167581 ?auto_167580 ) ) ( not ( = ?auto_167584 ?auto_167580 ) ) ( ON ?auto_167584 ?auto_167581 ) ( ON-TABLE ?auto_167578 ) ( ON ?auto_167579 ?auto_167578 ) ( not ( = ?auto_167578 ?auto_167579 ) ) ( not ( = ?auto_167578 ?auto_167582 ) ) ( not ( = ?auto_167578 ?auto_167585 ) ) ( not ( = ?auto_167578 ?auto_167583 ) ) ( not ( = ?auto_167578 ?auto_167580 ) ) ( not ( = ?auto_167579 ?auto_167582 ) ) ( not ( = ?auto_167579 ?auto_167585 ) ) ( not ( = ?auto_167579 ?auto_167583 ) ) ( not ( = ?auto_167579 ?auto_167580 ) ) ( not ( = ?auto_167582 ?auto_167585 ) ) ( not ( = ?auto_167582 ?auto_167583 ) ) ( not ( = ?auto_167582 ?auto_167580 ) ) ( not ( = ?auto_167585 ?auto_167583 ) ) ( not ( = ?auto_167585 ?auto_167580 ) ) ( not ( = ?auto_167583 ?auto_167580 ) ) ( not ( = ?auto_167577 ?auto_167583 ) ) ( not ( = ?auto_167577 ?auto_167578 ) ) ( not ( = ?auto_167577 ?auto_167579 ) ) ( not ( = ?auto_167577 ?auto_167582 ) ) ( not ( = ?auto_167577 ?auto_167585 ) ) ( not ( = ?auto_167581 ?auto_167583 ) ) ( not ( = ?auto_167581 ?auto_167578 ) ) ( not ( = ?auto_167581 ?auto_167579 ) ) ( not ( = ?auto_167581 ?auto_167582 ) ) ( not ( = ?auto_167581 ?auto_167585 ) ) ( not ( = ?auto_167584 ?auto_167583 ) ) ( not ( = ?auto_167584 ?auto_167578 ) ) ( not ( = ?auto_167584 ?auto_167579 ) ) ( not ( = ?auto_167584 ?auto_167582 ) ) ( not ( = ?auto_167584 ?auto_167585 ) ) ( ON ?auto_167580 ?auto_167584 ) ( ON ?auto_167583 ?auto_167580 ) ( ON ?auto_167585 ?auto_167583 ) ( CLEAR ?auto_167579 ) ( ON ?auto_167582 ?auto_167585 ) ( CLEAR ?auto_167582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167577 ?auto_167581 ?auto_167584 ?auto_167580 ?auto_167583 ?auto_167585 )
      ( MAKE-1PILE ?auto_167577 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167586 - BLOCK
    )
    :vars
    (
      ?auto_167587 - BLOCK
      ?auto_167590 - BLOCK
      ?auto_167591 - BLOCK
      ?auto_167593 - BLOCK
      ?auto_167592 - BLOCK
      ?auto_167589 - BLOCK
      ?auto_167588 - BLOCK
      ?auto_167594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167587 ?auto_167586 ) ( ON-TABLE ?auto_167586 ) ( not ( = ?auto_167586 ?auto_167587 ) ) ( not ( = ?auto_167586 ?auto_167590 ) ) ( not ( = ?auto_167586 ?auto_167591 ) ) ( not ( = ?auto_167587 ?auto_167590 ) ) ( not ( = ?auto_167587 ?auto_167591 ) ) ( not ( = ?auto_167590 ?auto_167591 ) ) ( ON ?auto_167590 ?auto_167587 ) ( ON-TABLE ?auto_167593 ) ( not ( = ?auto_167593 ?auto_167592 ) ) ( not ( = ?auto_167593 ?auto_167589 ) ) ( not ( = ?auto_167593 ?auto_167588 ) ) ( not ( = ?auto_167593 ?auto_167594 ) ) ( not ( = ?auto_167593 ?auto_167591 ) ) ( not ( = ?auto_167592 ?auto_167589 ) ) ( not ( = ?auto_167592 ?auto_167588 ) ) ( not ( = ?auto_167592 ?auto_167594 ) ) ( not ( = ?auto_167592 ?auto_167591 ) ) ( not ( = ?auto_167589 ?auto_167588 ) ) ( not ( = ?auto_167589 ?auto_167594 ) ) ( not ( = ?auto_167589 ?auto_167591 ) ) ( not ( = ?auto_167588 ?auto_167594 ) ) ( not ( = ?auto_167588 ?auto_167591 ) ) ( not ( = ?auto_167594 ?auto_167591 ) ) ( not ( = ?auto_167586 ?auto_167594 ) ) ( not ( = ?auto_167586 ?auto_167593 ) ) ( not ( = ?auto_167586 ?auto_167592 ) ) ( not ( = ?auto_167586 ?auto_167589 ) ) ( not ( = ?auto_167586 ?auto_167588 ) ) ( not ( = ?auto_167587 ?auto_167594 ) ) ( not ( = ?auto_167587 ?auto_167593 ) ) ( not ( = ?auto_167587 ?auto_167592 ) ) ( not ( = ?auto_167587 ?auto_167589 ) ) ( not ( = ?auto_167587 ?auto_167588 ) ) ( not ( = ?auto_167590 ?auto_167594 ) ) ( not ( = ?auto_167590 ?auto_167593 ) ) ( not ( = ?auto_167590 ?auto_167592 ) ) ( not ( = ?auto_167590 ?auto_167589 ) ) ( not ( = ?auto_167590 ?auto_167588 ) ) ( ON ?auto_167591 ?auto_167590 ) ( ON ?auto_167594 ?auto_167591 ) ( ON ?auto_167588 ?auto_167594 ) ( ON ?auto_167589 ?auto_167588 ) ( CLEAR ?auto_167589 ) ( HOLDING ?auto_167592 ) ( CLEAR ?auto_167593 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167593 ?auto_167592 )
      ( MAKE-1PILE ?auto_167586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167595 - BLOCK
    )
    :vars
    (
      ?auto_167602 - BLOCK
      ?auto_167597 - BLOCK
      ?auto_167603 - BLOCK
      ?auto_167599 - BLOCK
      ?auto_167601 - BLOCK
      ?auto_167598 - BLOCK
      ?auto_167596 - BLOCK
      ?auto_167600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167602 ?auto_167595 ) ( ON-TABLE ?auto_167595 ) ( not ( = ?auto_167595 ?auto_167602 ) ) ( not ( = ?auto_167595 ?auto_167597 ) ) ( not ( = ?auto_167595 ?auto_167603 ) ) ( not ( = ?auto_167602 ?auto_167597 ) ) ( not ( = ?auto_167602 ?auto_167603 ) ) ( not ( = ?auto_167597 ?auto_167603 ) ) ( ON ?auto_167597 ?auto_167602 ) ( ON-TABLE ?auto_167599 ) ( not ( = ?auto_167599 ?auto_167601 ) ) ( not ( = ?auto_167599 ?auto_167598 ) ) ( not ( = ?auto_167599 ?auto_167596 ) ) ( not ( = ?auto_167599 ?auto_167600 ) ) ( not ( = ?auto_167599 ?auto_167603 ) ) ( not ( = ?auto_167601 ?auto_167598 ) ) ( not ( = ?auto_167601 ?auto_167596 ) ) ( not ( = ?auto_167601 ?auto_167600 ) ) ( not ( = ?auto_167601 ?auto_167603 ) ) ( not ( = ?auto_167598 ?auto_167596 ) ) ( not ( = ?auto_167598 ?auto_167600 ) ) ( not ( = ?auto_167598 ?auto_167603 ) ) ( not ( = ?auto_167596 ?auto_167600 ) ) ( not ( = ?auto_167596 ?auto_167603 ) ) ( not ( = ?auto_167600 ?auto_167603 ) ) ( not ( = ?auto_167595 ?auto_167600 ) ) ( not ( = ?auto_167595 ?auto_167599 ) ) ( not ( = ?auto_167595 ?auto_167601 ) ) ( not ( = ?auto_167595 ?auto_167598 ) ) ( not ( = ?auto_167595 ?auto_167596 ) ) ( not ( = ?auto_167602 ?auto_167600 ) ) ( not ( = ?auto_167602 ?auto_167599 ) ) ( not ( = ?auto_167602 ?auto_167601 ) ) ( not ( = ?auto_167602 ?auto_167598 ) ) ( not ( = ?auto_167602 ?auto_167596 ) ) ( not ( = ?auto_167597 ?auto_167600 ) ) ( not ( = ?auto_167597 ?auto_167599 ) ) ( not ( = ?auto_167597 ?auto_167601 ) ) ( not ( = ?auto_167597 ?auto_167598 ) ) ( not ( = ?auto_167597 ?auto_167596 ) ) ( ON ?auto_167603 ?auto_167597 ) ( ON ?auto_167600 ?auto_167603 ) ( ON ?auto_167596 ?auto_167600 ) ( ON ?auto_167598 ?auto_167596 ) ( CLEAR ?auto_167599 ) ( ON ?auto_167601 ?auto_167598 ) ( CLEAR ?auto_167601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167595 ?auto_167602 ?auto_167597 ?auto_167603 ?auto_167600 ?auto_167596 ?auto_167598 )
      ( MAKE-1PILE ?auto_167595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167604 - BLOCK
    )
    :vars
    (
      ?auto_167606 - BLOCK
      ?auto_167610 - BLOCK
      ?auto_167608 - BLOCK
      ?auto_167611 - BLOCK
      ?auto_167605 - BLOCK
      ?auto_167612 - BLOCK
      ?auto_167609 - BLOCK
      ?auto_167607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167606 ?auto_167604 ) ( ON-TABLE ?auto_167604 ) ( not ( = ?auto_167604 ?auto_167606 ) ) ( not ( = ?auto_167604 ?auto_167610 ) ) ( not ( = ?auto_167604 ?auto_167608 ) ) ( not ( = ?auto_167606 ?auto_167610 ) ) ( not ( = ?auto_167606 ?auto_167608 ) ) ( not ( = ?auto_167610 ?auto_167608 ) ) ( ON ?auto_167610 ?auto_167606 ) ( not ( = ?auto_167611 ?auto_167605 ) ) ( not ( = ?auto_167611 ?auto_167612 ) ) ( not ( = ?auto_167611 ?auto_167609 ) ) ( not ( = ?auto_167611 ?auto_167607 ) ) ( not ( = ?auto_167611 ?auto_167608 ) ) ( not ( = ?auto_167605 ?auto_167612 ) ) ( not ( = ?auto_167605 ?auto_167609 ) ) ( not ( = ?auto_167605 ?auto_167607 ) ) ( not ( = ?auto_167605 ?auto_167608 ) ) ( not ( = ?auto_167612 ?auto_167609 ) ) ( not ( = ?auto_167612 ?auto_167607 ) ) ( not ( = ?auto_167612 ?auto_167608 ) ) ( not ( = ?auto_167609 ?auto_167607 ) ) ( not ( = ?auto_167609 ?auto_167608 ) ) ( not ( = ?auto_167607 ?auto_167608 ) ) ( not ( = ?auto_167604 ?auto_167607 ) ) ( not ( = ?auto_167604 ?auto_167611 ) ) ( not ( = ?auto_167604 ?auto_167605 ) ) ( not ( = ?auto_167604 ?auto_167612 ) ) ( not ( = ?auto_167604 ?auto_167609 ) ) ( not ( = ?auto_167606 ?auto_167607 ) ) ( not ( = ?auto_167606 ?auto_167611 ) ) ( not ( = ?auto_167606 ?auto_167605 ) ) ( not ( = ?auto_167606 ?auto_167612 ) ) ( not ( = ?auto_167606 ?auto_167609 ) ) ( not ( = ?auto_167610 ?auto_167607 ) ) ( not ( = ?auto_167610 ?auto_167611 ) ) ( not ( = ?auto_167610 ?auto_167605 ) ) ( not ( = ?auto_167610 ?auto_167612 ) ) ( not ( = ?auto_167610 ?auto_167609 ) ) ( ON ?auto_167608 ?auto_167610 ) ( ON ?auto_167607 ?auto_167608 ) ( ON ?auto_167609 ?auto_167607 ) ( ON ?auto_167612 ?auto_167609 ) ( ON ?auto_167605 ?auto_167612 ) ( CLEAR ?auto_167605 ) ( HOLDING ?auto_167611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167611 )
      ( MAKE-1PILE ?auto_167604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167613 - BLOCK
    )
    :vars
    (
      ?auto_167621 - BLOCK
      ?auto_167618 - BLOCK
      ?auto_167617 - BLOCK
      ?auto_167619 - BLOCK
      ?auto_167615 - BLOCK
      ?auto_167620 - BLOCK
      ?auto_167614 - BLOCK
      ?auto_167616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167621 ?auto_167613 ) ( ON-TABLE ?auto_167613 ) ( not ( = ?auto_167613 ?auto_167621 ) ) ( not ( = ?auto_167613 ?auto_167618 ) ) ( not ( = ?auto_167613 ?auto_167617 ) ) ( not ( = ?auto_167621 ?auto_167618 ) ) ( not ( = ?auto_167621 ?auto_167617 ) ) ( not ( = ?auto_167618 ?auto_167617 ) ) ( ON ?auto_167618 ?auto_167621 ) ( not ( = ?auto_167619 ?auto_167615 ) ) ( not ( = ?auto_167619 ?auto_167620 ) ) ( not ( = ?auto_167619 ?auto_167614 ) ) ( not ( = ?auto_167619 ?auto_167616 ) ) ( not ( = ?auto_167619 ?auto_167617 ) ) ( not ( = ?auto_167615 ?auto_167620 ) ) ( not ( = ?auto_167615 ?auto_167614 ) ) ( not ( = ?auto_167615 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167617 ) ) ( not ( = ?auto_167620 ?auto_167614 ) ) ( not ( = ?auto_167620 ?auto_167616 ) ) ( not ( = ?auto_167620 ?auto_167617 ) ) ( not ( = ?auto_167614 ?auto_167616 ) ) ( not ( = ?auto_167614 ?auto_167617 ) ) ( not ( = ?auto_167616 ?auto_167617 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167613 ?auto_167619 ) ) ( not ( = ?auto_167613 ?auto_167615 ) ) ( not ( = ?auto_167613 ?auto_167620 ) ) ( not ( = ?auto_167613 ?auto_167614 ) ) ( not ( = ?auto_167621 ?auto_167616 ) ) ( not ( = ?auto_167621 ?auto_167619 ) ) ( not ( = ?auto_167621 ?auto_167615 ) ) ( not ( = ?auto_167621 ?auto_167620 ) ) ( not ( = ?auto_167621 ?auto_167614 ) ) ( not ( = ?auto_167618 ?auto_167616 ) ) ( not ( = ?auto_167618 ?auto_167619 ) ) ( not ( = ?auto_167618 ?auto_167615 ) ) ( not ( = ?auto_167618 ?auto_167620 ) ) ( not ( = ?auto_167618 ?auto_167614 ) ) ( ON ?auto_167617 ?auto_167618 ) ( ON ?auto_167616 ?auto_167617 ) ( ON ?auto_167614 ?auto_167616 ) ( ON ?auto_167620 ?auto_167614 ) ( ON ?auto_167615 ?auto_167620 ) ( ON ?auto_167619 ?auto_167615 ) ( CLEAR ?auto_167619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167613 ?auto_167621 ?auto_167618 ?auto_167617 ?auto_167616 ?auto_167614 ?auto_167620 ?auto_167615 )
      ( MAKE-1PILE ?auto_167613 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167630 - BLOCK
      ?auto_167631 - BLOCK
      ?auto_167632 - BLOCK
      ?auto_167633 - BLOCK
      ?auto_167634 - BLOCK
      ?auto_167635 - BLOCK
      ?auto_167636 - BLOCK
      ?auto_167637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_167637 ) ( CLEAR ?auto_167636 ) ( ON-TABLE ?auto_167630 ) ( ON ?auto_167631 ?auto_167630 ) ( ON ?auto_167632 ?auto_167631 ) ( ON ?auto_167633 ?auto_167632 ) ( ON ?auto_167634 ?auto_167633 ) ( ON ?auto_167635 ?auto_167634 ) ( ON ?auto_167636 ?auto_167635 ) ( not ( = ?auto_167630 ?auto_167631 ) ) ( not ( = ?auto_167630 ?auto_167632 ) ) ( not ( = ?auto_167630 ?auto_167633 ) ) ( not ( = ?auto_167630 ?auto_167634 ) ) ( not ( = ?auto_167630 ?auto_167635 ) ) ( not ( = ?auto_167630 ?auto_167636 ) ) ( not ( = ?auto_167630 ?auto_167637 ) ) ( not ( = ?auto_167631 ?auto_167632 ) ) ( not ( = ?auto_167631 ?auto_167633 ) ) ( not ( = ?auto_167631 ?auto_167634 ) ) ( not ( = ?auto_167631 ?auto_167635 ) ) ( not ( = ?auto_167631 ?auto_167636 ) ) ( not ( = ?auto_167631 ?auto_167637 ) ) ( not ( = ?auto_167632 ?auto_167633 ) ) ( not ( = ?auto_167632 ?auto_167634 ) ) ( not ( = ?auto_167632 ?auto_167635 ) ) ( not ( = ?auto_167632 ?auto_167636 ) ) ( not ( = ?auto_167632 ?auto_167637 ) ) ( not ( = ?auto_167633 ?auto_167634 ) ) ( not ( = ?auto_167633 ?auto_167635 ) ) ( not ( = ?auto_167633 ?auto_167636 ) ) ( not ( = ?auto_167633 ?auto_167637 ) ) ( not ( = ?auto_167634 ?auto_167635 ) ) ( not ( = ?auto_167634 ?auto_167636 ) ) ( not ( = ?auto_167634 ?auto_167637 ) ) ( not ( = ?auto_167635 ?auto_167636 ) ) ( not ( = ?auto_167635 ?auto_167637 ) ) ( not ( = ?auto_167636 ?auto_167637 ) ) )
    :subtasks
    ( ( !STACK ?auto_167637 ?auto_167636 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167638 - BLOCK
      ?auto_167639 - BLOCK
      ?auto_167640 - BLOCK
      ?auto_167641 - BLOCK
      ?auto_167642 - BLOCK
      ?auto_167643 - BLOCK
      ?auto_167644 - BLOCK
      ?auto_167645 - BLOCK
    )
    :vars
    (
      ?auto_167646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167644 ) ( ON-TABLE ?auto_167638 ) ( ON ?auto_167639 ?auto_167638 ) ( ON ?auto_167640 ?auto_167639 ) ( ON ?auto_167641 ?auto_167640 ) ( ON ?auto_167642 ?auto_167641 ) ( ON ?auto_167643 ?auto_167642 ) ( ON ?auto_167644 ?auto_167643 ) ( not ( = ?auto_167638 ?auto_167639 ) ) ( not ( = ?auto_167638 ?auto_167640 ) ) ( not ( = ?auto_167638 ?auto_167641 ) ) ( not ( = ?auto_167638 ?auto_167642 ) ) ( not ( = ?auto_167638 ?auto_167643 ) ) ( not ( = ?auto_167638 ?auto_167644 ) ) ( not ( = ?auto_167638 ?auto_167645 ) ) ( not ( = ?auto_167639 ?auto_167640 ) ) ( not ( = ?auto_167639 ?auto_167641 ) ) ( not ( = ?auto_167639 ?auto_167642 ) ) ( not ( = ?auto_167639 ?auto_167643 ) ) ( not ( = ?auto_167639 ?auto_167644 ) ) ( not ( = ?auto_167639 ?auto_167645 ) ) ( not ( = ?auto_167640 ?auto_167641 ) ) ( not ( = ?auto_167640 ?auto_167642 ) ) ( not ( = ?auto_167640 ?auto_167643 ) ) ( not ( = ?auto_167640 ?auto_167644 ) ) ( not ( = ?auto_167640 ?auto_167645 ) ) ( not ( = ?auto_167641 ?auto_167642 ) ) ( not ( = ?auto_167641 ?auto_167643 ) ) ( not ( = ?auto_167641 ?auto_167644 ) ) ( not ( = ?auto_167641 ?auto_167645 ) ) ( not ( = ?auto_167642 ?auto_167643 ) ) ( not ( = ?auto_167642 ?auto_167644 ) ) ( not ( = ?auto_167642 ?auto_167645 ) ) ( not ( = ?auto_167643 ?auto_167644 ) ) ( not ( = ?auto_167643 ?auto_167645 ) ) ( not ( = ?auto_167644 ?auto_167645 ) ) ( ON ?auto_167645 ?auto_167646 ) ( CLEAR ?auto_167645 ) ( HAND-EMPTY ) ( not ( = ?auto_167638 ?auto_167646 ) ) ( not ( = ?auto_167639 ?auto_167646 ) ) ( not ( = ?auto_167640 ?auto_167646 ) ) ( not ( = ?auto_167641 ?auto_167646 ) ) ( not ( = ?auto_167642 ?auto_167646 ) ) ( not ( = ?auto_167643 ?auto_167646 ) ) ( not ( = ?auto_167644 ?auto_167646 ) ) ( not ( = ?auto_167645 ?auto_167646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167645 ?auto_167646 )
      ( MAKE-8PILE ?auto_167638 ?auto_167639 ?auto_167640 ?auto_167641 ?auto_167642 ?auto_167643 ?auto_167644 ?auto_167645 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167647 - BLOCK
      ?auto_167648 - BLOCK
      ?auto_167649 - BLOCK
      ?auto_167650 - BLOCK
      ?auto_167651 - BLOCK
      ?auto_167652 - BLOCK
      ?auto_167653 - BLOCK
      ?auto_167654 - BLOCK
    )
    :vars
    (
      ?auto_167655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167647 ) ( ON ?auto_167648 ?auto_167647 ) ( ON ?auto_167649 ?auto_167648 ) ( ON ?auto_167650 ?auto_167649 ) ( ON ?auto_167651 ?auto_167650 ) ( ON ?auto_167652 ?auto_167651 ) ( not ( = ?auto_167647 ?auto_167648 ) ) ( not ( = ?auto_167647 ?auto_167649 ) ) ( not ( = ?auto_167647 ?auto_167650 ) ) ( not ( = ?auto_167647 ?auto_167651 ) ) ( not ( = ?auto_167647 ?auto_167652 ) ) ( not ( = ?auto_167647 ?auto_167653 ) ) ( not ( = ?auto_167647 ?auto_167654 ) ) ( not ( = ?auto_167648 ?auto_167649 ) ) ( not ( = ?auto_167648 ?auto_167650 ) ) ( not ( = ?auto_167648 ?auto_167651 ) ) ( not ( = ?auto_167648 ?auto_167652 ) ) ( not ( = ?auto_167648 ?auto_167653 ) ) ( not ( = ?auto_167648 ?auto_167654 ) ) ( not ( = ?auto_167649 ?auto_167650 ) ) ( not ( = ?auto_167649 ?auto_167651 ) ) ( not ( = ?auto_167649 ?auto_167652 ) ) ( not ( = ?auto_167649 ?auto_167653 ) ) ( not ( = ?auto_167649 ?auto_167654 ) ) ( not ( = ?auto_167650 ?auto_167651 ) ) ( not ( = ?auto_167650 ?auto_167652 ) ) ( not ( = ?auto_167650 ?auto_167653 ) ) ( not ( = ?auto_167650 ?auto_167654 ) ) ( not ( = ?auto_167651 ?auto_167652 ) ) ( not ( = ?auto_167651 ?auto_167653 ) ) ( not ( = ?auto_167651 ?auto_167654 ) ) ( not ( = ?auto_167652 ?auto_167653 ) ) ( not ( = ?auto_167652 ?auto_167654 ) ) ( not ( = ?auto_167653 ?auto_167654 ) ) ( ON ?auto_167654 ?auto_167655 ) ( CLEAR ?auto_167654 ) ( not ( = ?auto_167647 ?auto_167655 ) ) ( not ( = ?auto_167648 ?auto_167655 ) ) ( not ( = ?auto_167649 ?auto_167655 ) ) ( not ( = ?auto_167650 ?auto_167655 ) ) ( not ( = ?auto_167651 ?auto_167655 ) ) ( not ( = ?auto_167652 ?auto_167655 ) ) ( not ( = ?auto_167653 ?auto_167655 ) ) ( not ( = ?auto_167654 ?auto_167655 ) ) ( HOLDING ?auto_167653 ) ( CLEAR ?auto_167652 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167647 ?auto_167648 ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 )
      ( MAKE-8PILE ?auto_167647 ?auto_167648 ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167656 - BLOCK
      ?auto_167657 - BLOCK
      ?auto_167658 - BLOCK
      ?auto_167659 - BLOCK
      ?auto_167660 - BLOCK
      ?auto_167661 - BLOCK
      ?auto_167662 - BLOCK
      ?auto_167663 - BLOCK
    )
    :vars
    (
      ?auto_167664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167656 ) ( ON ?auto_167657 ?auto_167656 ) ( ON ?auto_167658 ?auto_167657 ) ( ON ?auto_167659 ?auto_167658 ) ( ON ?auto_167660 ?auto_167659 ) ( ON ?auto_167661 ?auto_167660 ) ( not ( = ?auto_167656 ?auto_167657 ) ) ( not ( = ?auto_167656 ?auto_167658 ) ) ( not ( = ?auto_167656 ?auto_167659 ) ) ( not ( = ?auto_167656 ?auto_167660 ) ) ( not ( = ?auto_167656 ?auto_167661 ) ) ( not ( = ?auto_167656 ?auto_167662 ) ) ( not ( = ?auto_167656 ?auto_167663 ) ) ( not ( = ?auto_167657 ?auto_167658 ) ) ( not ( = ?auto_167657 ?auto_167659 ) ) ( not ( = ?auto_167657 ?auto_167660 ) ) ( not ( = ?auto_167657 ?auto_167661 ) ) ( not ( = ?auto_167657 ?auto_167662 ) ) ( not ( = ?auto_167657 ?auto_167663 ) ) ( not ( = ?auto_167658 ?auto_167659 ) ) ( not ( = ?auto_167658 ?auto_167660 ) ) ( not ( = ?auto_167658 ?auto_167661 ) ) ( not ( = ?auto_167658 ?auto_167662 ) ) ( not ( = ?auto_167658 ?auto_167663 ) ) ( not ( = ?auto_167659 ?auto_167660 ) ) ( not ( = ?auto_167659 ?auto_167661 ) ) ( not ( = ?auto_167659 ?auto_167662 ) ) ( not ( = ?auto_167659 ?auto_167663 ) ) ( not ( = ?auto_167660 ?auto_167661 ) ) ( not ( = ?auto_167660 ?auto_167662 ) ) ( not ( = ?auto_167660 ?auto_167663 ) ) ( not ( = ?auto_167661 ?auto_167662 ) ) ( not ( = ?auto_167661 ?auto_167663 ) ) ( not ( = ?auto_167662 ?auto_167663 ) ) ( ON ?auto_167663 ?auto_167664 ) ( not ( = ?auto_167656 ?auto_167664 ) ) ( not ( = ?auto_167657 ?auto_167664 ) ) ( not ( = ?auto_167658 ?auto_167664 ) ) ( not ( = ?auto_167659 ?auto_167664 ) ) ( not ( = ?auto_167660 ?auto_167664 ) ) ( not ( = ?auto_167661 ?auto_167664 ) ) ( not ( = ?auto_167662 ?auto_167664 ) ) ( not ( = ?auto_167663 ?auto_167664 ) ) ( CLEAR ?auto_167661 ) ( ON ?auto_167662 ?auto_167663 ) ( CLEAR ?auto_167662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167664 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167664 ?auto_167663 )
      ( MAKE-8PILE ?auto_167656 ?auto_167657 ?auto_167658 ?auto_167659 ?auto_167660 ?auto_167661 ?auto_167662 ?auto_167663 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167665 - BLOCK
      ?auto_167666 - BLOCK
      ?auto_167667 - BLOCK
      ?auto_167668 - BLOCK
      ?auto_167669 - BLOCK
      ?auto_167670 - BLOCK
      ?auto_167671 - BLOCK
      ?auto_167672 - BLOCK
    )
    :vars
    (
      ?auto_167673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167665 ) ( ON ?auto_167666 ?auto_167665 ) ( ON ?auto_167667 ?auto_167666 ) ( ON ?auto_167668 ?auto_167667 ) ( ON ?auto_167669 ?auto_167668 ) ( not ( = ?auto_167665 ?auto_167666 ) ) ( not ( = ?auto_167665 ?auto_167667 ) ) ( not ( = ?auto_167665 ?auto_167668 ) ) ( not ( = ?auto_167665 ?auto_167669 ) ) ( not ( = ?auto_167665 ?auto_167670 ) ) ( not ( = ?auto_167665 ?auto_167671 ) ) ( not ( = ?auto_167665 ?auto_167672 ) ) ( not ( = ?auto_167666 ?auto_167667 ) ) ( not ( = ?auto_167666 ?auto_167668 ) ) ( not ( = ?auto_167666 ?auto_167669 ) ) ( not ( = ?auto_167666 ?auto_167670 ) ) ( not ( = ?auto_167666 ?auto_167671 ) ) ( not ( = ?auto_167666 ?auto_167672 ) ) ( not ( = ?auto_167667 ?auto_167668 ) ) ( not ( = ?auto_167667 ?auto_167669 ) ) ( not ( = ?auto_167667 ?auto_167670 ) ) ( not ( = ?auto_167667 ?auto_167671 ) ) ( not ( = ?auto_167667 ?auto_167672 ) ) ( not ( = ?auto_167668 ?auto_167669 ) ) ( not ( = ?auto_167668 ?auto_167670 ) ) ( not ( = ?auto_167668 ?auto_167671 ) ) ( not ( = ?auto_167668 ?auto_167672 ) ) ( not ( = ?auto_167669 ?auto_167670 ) ) ( not ( = ?auto_167669 ?auto_167671 ) ) ( not ( = ?auto_167669 ?auto_167672 ) ) ( not ( = ?auto_167670 ?auto_167671 ) ) ( not ( = ?auto_167670 ?auto_167672 ) ) ( not ( = ?auto_167671 ?auto_167672 ) ) ( ON ?auto_167672 ?auto_167673 ) ( not ( = ?auto_167665 ?auto_167673 ) ) ( not ( = ?auto_167666 ?auto_167673 ) ) ( not ( = ?auto_167667 ?auto_167673 ) ) ( not ( = ?auto_167668 ?auto_167673 ) ) ( not ( = ?auto_167669 ?auto_167673 ) ) ( not ( = ?auto_167670 ?auto_167673 ) ) ( not ( = ?auto_167671 ?auto_167673 ) ) ( not ( = ?auto_167672 ?auto_167673 ) ) ( ON ?auto_167671 ?auto_167672 ) ( CLEAR ?auto_167671 ) ( ON-TABLE ?auto_167673 ) ( HOLDING ?auto_167670 ) ( CLEAR ?auto_167669 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167665 ?auto_167666 ?auto_167667 ?auto_167668 ?auto_167669 ?auto_167670 )
      ( MAKE-8PILE ?auto_167665 ?auto_167666 ?auto_167667 ?auto_167668 ?auto_167669 ?auto_167670 ?auto_167671 ?auto_167672 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167674 - BLOCK
      ?auto_167675 - BLOCK
      ?auto_167676 - BLOCK
      ?auto_167677 - BLOCK
      ?auto_167678 - BLOCK
      ?auto_167679 - BLOCK
      ?auto_167680 - BLOCK
      ?auto_167681 - BLOCK
    )
    :vars
    (
      ?auto_167682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167674 ) ( ON ?auto_167675 ?auto_167674 ) ( ON ?auto_167676 ?auto_167675 ) ( ON ?auto_167677 ?auto_167676 ) ( ON ?auto_167678 ?auto_167677 ) ( not ( = ?auto_167674 ?auto_167675 ) ) ( not ( = ?auto_167674 ?auto_167676 ) ) ( not ( = ?auto_167674 ?auto_167677 ) ) ( not ( = ?auto_167674 ?auto_167678 ) ) ( not ( = ?auto_167674 ?auto_167679 ) ) ( not ( = ?auto_167674 ?auto_167680 ) ) ( not ( = ?auto_167674 ?auto_167681 ) ) ( not ( = ?auto_167675 ?auto_167676 ) ) ( not ( = ?auto_167675 ?auto_167677 ) ) ( not ( = ?auto_167675 ?auto_167678 ) ) ( not ( = ?auto_167675 ?auto_167679 ) ) ( not ( = ?auto_167675 ?auto_167680 ) ) ( not ( = ?auto_167675 ?auto_167681 ) ) ( not ( = ?auto_167676 ?auto_167677 ) ) ( not ( = ?auto_167676 ?auto_167678 ) ) ( not ( = ?auto_167676 ?auto_167679 ) ) ( not ( = ?auto_167676 ?auto_167680 ) ) ( not ( = ?auto_167676 ?auto_167681 ) ) ( not ( = ?auto_167677 ?auto_167678 ) ) ( not ( = ?auto_167677 ?auto_167679 ) ) ( not ( = ?auto_167677 ?auto_167680 ) ) ( not ( = ?auto_167677 ?auto_167681 ) ) ( not ( = ?auto_167678 ?auto_167679 ) ) ( not ( = ?auto_167678 ?auto_167680 ) ) ( not ( = ?auto_167678 ?auto_167681 ) ) ( not ( = ?auto_167679 ?auto_167680 ) ) ( not ( = ?auto_167679 ?auto_167681 ) ) ( not ( = ?auto_167680 ?auto_167681 ) ) ( ON ?auto_167681 ?auto_167682 ) ( not ( = ?auto_167674 ?auto_167682 ) ) ( not ( = ?auto_167675 ?auto_167682 ) ) ( not ( = ?auto_167676 ?auto_167682 ) ) ( not ( = ?auto_167677 ?auto_167682 ) ) ( not ( = ?auto_167678 ?auto_167682 ) ) ( not ( = ?auto_167679 ?auto_167682 ) ) ( not ( = ?auto_167680 ?auto_167682 ) ) ( not ( = ?auto_167681 ?auto_167682 ) ) ( ON ?auto_167680 ?auto_167681 ) ( ON-TABLE ?auto_167682 ) ( CLEAR ?auto_167678 ) ( ON ?auto_167679 ?auto_167680 ) ( CLEAR ?auto_167679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167682 ?auto_167681 ?auto_167680 )
      ( MAKE-8PILE ?auto_167674 ?auto_167675 ?auto_167676 ?auto_167677 ?auto_167678 ?auto_167679 ?auto_167680 ?auto_167681 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167683 - BLOCK
      ?auto_167684 - BLOCK
      ?auto_167685 - BLOCK
      ?auto_167686 - BLOCK
      ?auto_167687 - BLOCK
      ?auto_167688 - BLOCK
      ?auto_167689 - BLOCK
      ?auto_167690 - BLOCK
    )
    :vars
    (
      ?auto_167691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167683 ) ( ON ?auto_167684 ?auto_167683 ) ( ON ?auto_167685 ?auto_167684 ) ( ON ?auto_167686 ?auto_167685 ) ( not ( = ?auto_167683 ?auto_167684 ) ) ( not ( = ?auto_167683 ?auto_167685 ) ) ( not ( = ?auto_167683 ?auto_167686 ) ) ( not ( = ?auto_167683 ?auto_167687 ) ) ( not ( = ?auto_167683 ?auto_167688 ) ) ( not ( = ?auto_167683 ?auto_167689 ) ) ( not ( = ?auto_167683 ?auto_167690 ) ) ( not ( = ?auto_167684 ?auto_167685 ) ) ( not ( = ?auto_167684 ?auto_167686 ) ) ( not ( = ?auto_167684 ?auto_167687 ) ) ( not ( = ?auto_167684 ?auto_167688 ) ) ( not ( = ?auto_167684 ?auto_167689 ) ) ( not ( = ?auto_167684 ?auto_167690 ) ) ( not ( = ?auto_167685 ?auto_167686 ) ) ( not ( = ?auto_167685 ?auto_167687 ) ) ( not ( = ?auto_167685 ?auto_167688 ) ) ( not ( = ?auto_167685 ?auto_167689 ) ) ( not ( = ?auto_167685 ?auto_167690 ) ) ( not ( = ?auto_167686 ?auto_167687 ) ) ( not ( = ?auto_167686 ?auto_167688 ) ) ( not ( = ?auto_167686 ?auto_167689 ) ) ( not ( = ?auto_167686 ?auto_167690 ) ) ( not ( = ?auto_167687 ?auto_167688 ) ) ( not ( = ?auto_167687 ?auto_167689 ) ) ( not ( = ?auto_167687 ?auto_167690 ) ) ( not ( = ?auto_167688 ?auto_167689 ) ) ( not ( = ?auto_167688 ?auto_167690 ) ) ( not ( = ?auto_167689 ?auto_167690 ) ) ( ON ?auto_167690 ?auto_167691 ) ( not ( = ?auto_167683 ?auto_167691 ) ) ( not ( = ?auto_167684 ?auto_167691 ) ) ( not ( = ?auto_167685 ?auto_167691 ) ) ( not ( = ?auto_167686 ?auto_167691 ) ) ( not ( = ?auto_167687 ?auto_167691 ) ) ( not ( = ?auto_167688 ?auto_167691 ) ) ( not ( = ?auto_167689 ?auto_167691 ) ) ( not ( = ?auto_167690 ?auto_167691 ) ) ( ON ?auto_167689 ?auto_167690 ) ( ON-TABLE ?auto_167691 ) ( ON ?auto_167688 ?auto_167689 ) ( CLEAR ?auto_167688 ) ( HOLDING ?auto_167687 ) ( CLEAR ?auto_167686 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167683 ?auto_167684 ?auto_167685 ?auto_167686 ?auto_167687 )
      ( MAKE-8PILE ?auto_167683 ?auto_167684 ?auto_167685 ?auto_167686 ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167692 - BLOCK
      ?auto_167693 - BLOCK
      ?auto_167694 - BLOCK
      ?auto_167695 - BLOCK
      ?auto_167696 - BLOCK
      ?auto_167697 - BLOCK
      ?auto_167698 - BLOCK
      ?auto_167699 - BLOCK
    )
    :vars
    (
      ?auto_167700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167692 ) ( ON ?auto_167693 ?auto_167692 ) ( ON ?auto_167694 ?auto_167693 ) ( ON ?auto_167695 ?auto_167694 ) ( not ( = ?auto_167692 ?auto_167693 ) ) ( not ( = ?auto_167692 ?auto_167694 ) ) ( not ( = ?auto_167692 ?auto_167695 ) ) ( not ( = ?auto_167692 ?auto_167696 ) ) ( not ( = ?auto_167692 ?auto_167697 ) ) ( not ( = ?auto_167692 ?auto_167698 ) ) ( not ( = ?auto_167692 ?auto_167699 ) ) ( not ( = ?auto_167693 ?auto_167694 ) ) ( not ( = ?auto_167693 ?auto_167695 ) ) ( not ( = ?auto_167693 ?auto_167696 ) ) ( not ( = ?auto_167693 ?auto_167697 ) ) ( not ( = ?auto_167693 ?auto_167698 ) ) ( not ( = ?auto_167693 ?auto_167699 ) ) ( not ( = ?auto_167694 ?auto_167695 ) ) ( not ( = ?auto_167694 ?auto_167696 ) ) ( not ( = ?auto_167694 ?auto_167697 ) ) ( not ( = ?auto_167694 ?auto_167698 ) ) ( not ( = ?auto_167694 ?auto_167699 ) ) ( not ( = ?auto_167695 ?auto_167696 ) ) ( not ( = ?auto_167695 ?auto_167697 ) ) ( not ( = ?auto_167695 ?auto_167698 ) ) ( not ( = ?auto_167695 ?auto_167699 ) ) ( not ( = ?auto_167696 ?auto_167697 ) ) ( not ( = ?auto_167696 ?auto_167698 ) ) ( not ( = ?auto_167696 ?auto_167699 ) ) ( not ( = ?auto_167697 ?auto_167698 ) ) ( not ( = ?auto_167697 ?auto_167699 ) ) ( not ( = ?auto_167698 ?auto_167699 ) ) ( ON ?auto_167699 ?auto_167700 ) ( not ( = ?auto_167692 ?auto_167700 ) ) ( not ( = ?auto_167693 ?auto_167700 ) ) ( not ( = ?auto_167694 ?auto_167700 ) ) ( not ( = ?auto_167695 ?auto_167700 ) ) ( not ( = ?auto_167696 ?auto_167700 ) ) ( not ( = ?auto_167697 ?auto_167700 ) ) ( not ( = ?auto_167698 ?auto_167700 ) ) ( not ( = ?auto_167699 ?auto_167700 ) ) ( ON ?auto_167698 ?auto_167699 ) ( ON-TABLE ?auto_167700 ) ( ON ?auto_167697 ?auto_167698 ) ( CLEAR ?auto_167695 ) ( ON ?auto_167696 ?auto_167697 ) ( CLEAR ?auto_167696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167700 ?auto_167699 ?auto_167698 ?auto_167697 )
      ( MAKE-8PILE ?auto_167692 ?auto_167693 ?auto_167694 ?auto_167695 ?auto_167696 ?auto_167697 ?auto_167698 ?auto_167699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167701 - BLOCK
      ?auto_167702 - BLOCK
      ?auto_167703 - BLOCK
      ?auto_167704 - BLOCK
      ?auto_167705 - BLOCK
      ?auto_167706 - BLOCK
      ?auto_167707 - BLOCK
      ?auto_167708 - BLOCK
    )
    :vars
    (
      ?auto_167709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167701 ) ( ON ?auto_167702 ?auto_167701 ) ( ON ?auto_167703 ?auto_167702 ) ( not ( = ?auto_167701 ?auto_167702 ) ) ( not ( = ?auto_167701 ?auto_167703 ) ) ( not ( = ?auto_167701 ?auto_167704 ) ) ( not ( = ?auto_167701 ?auto_167705 ) ) ( not ( = ?auto_167701 ?auto_167706 ) ) ( not ( = ?auto_167701 ?auto_167707 ) ) ( not ( = ?auto_167701 ?auto_167708 ) ) ( not ( = ?auto_167702 ?auto_167703 ) ) ( not ( = ?auto_167702 ?auto_167704 ) ) ( not ( = ?auto_167702 ?auto_167705 ) ) ( not ( = ?auto_167702 ?auto_167706 ) ) ( not ( = ?auto_167702 ?auto_167707 ) ) ( not ( = ?auto_167702 ?auto_167708 ) ) ( not ( = ?auto_167703 ?auto_167704 ) ) ( not ( = ?auto_167703 ?auto_167705 ) ) ( not ( = ?auto_167703 ?auto_167706 ) ) ( not ( = ?auto_167703 ?auto_167707 ) ) ( not ( = ?auto_167703 ?auto_167708 ) ) ( not ( = ?auto_167704 ?auto_167705 ) ) ( not ( = ?auto_167704 ?auto_167706 ) ) ( not ( = ?auto_167704 ?auto_167707 ) ) ( not ( = ?auto_167704 ?auto_167708 ) ) ( not ( = ?auto_167705 ?auto_167706 ) ) ( not ( = ?auto_167705 ?auto_167707 ) ) ( not ( = ?auto_167705 ?auto_167708 ) ) ( not ( = ?auto_167706 ?auto_167707 ) ) ( not ( = ?auto_167706 ?auto_167708 ) ) ( not ( = ?auto_167707 ?auto_167708 ) ) ( ON ?auto_167708 ?auto_167709 ) ( not ( = ?auto_167701 ?auto_167709 ) ) ( not ( = ?auto_167702 ?auto_167709 ) ) ( not ( = ?auto_167703 ?auto_167709 ) ) ( not ( = ?auto_167704 ?auto_167709 ) ) ( not ( = ?auto_167705 ?auto_167709 ) ) ( not ( = ?auto_167706 ?auto_167709 ) ) ( not ( = ?auto_167707 ?auto_167709 ) ) ( not ( = ?auto_167708 ?auto_167709 ) ) ( ON ?auto_167707 ?auto_167708 ) ( ON-TABLE ?auto_167709 ) ( ON ?auto_167706 ?auto_167707 ) ( ON ?auto_167705 ?auto_167706 ) ( CLEAR ?auto_167705 ) ( HOLDING ?auto_167704 ) ( CLEAR ?auto_167703 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167701 ?auto_167702 ?auto_167703 ?auto_167704 )
      ( MAKE-8PILE ?auto_167701 ?auto_167702 ?auto_167703 ?auto_167704 ?auto_167705 ?auto_167706 ?auto_167707 ?auto_167708 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167710 - BLOCK
      ?auto_167711 - BLOCK
      ?auto_167712 - BLOCK
      ?auto_167713 - BLOCK
      ?auto_167714 - BLOCK
      ?auto_167715 - BLOCK
      ?auto_167716 - BLOCK
      ?auto_167717 - BLOCK
    )
    :vars
    (
      ?auto_167718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167710 ) ( ON ?auto_167711 ?auto_167710 ) ( ON ?auto_167712 ?auto_167711 ) ( not ( = ?auto_167710 ?auto_167711 ) ) ( not ( = ?auto_167710 ?auto_167712 ) ) ( not ( = ?auto_167710 ?auto_167713 ) ) ( not ( = ?auto_167710 ?auto_167714 ) ) ( not ( = ?auto_167710 ?auto_167715 ) ) ( not ( = ?auto_167710 ?auto_167716 ) ) ( not ( = ?auto_167710 ?auto_167717 ) ) ( not ( = ?auto_167711 ?auto_167712 ) ) ( not ( = ?auto_167711 ?auto_167713 ) ) ( not ( = ?auto_167711 ?auto_167714 ) ) ( not ( = ?auto_167711 ?auto_167715 ) ) ( not ( = ?auto_167711 ?auto_167716 ) ) ( not ( = ?auto_167711 ?auto_167717 ) ) ( not ( = ?auto_167712 ?auto_167713 ) ) ( not ( = ?auto_167712 ?auto_167714 ) ) ( not ( = ?auto_167712 ?auto_167715 ) ) ( not ( = ?auto_167712 ?auto_167716 ) ) ( not ( = ?auto_167712 ?auto_167717 ) ) ( not ( = ?auto_167713 ?auto_167714 ) ) ( not ( = ?auto_167713 ?auto_167715 ) ) ( not ( = ?auto_167713 ?auto_167716 ) ) ( not ( = ?auto_167713 ?auto_167717 ) ) ( not ( = ?auto_167714 ?auto_167715 ) ) ( not ( = ?auto_167714 ?auto_167716 ) ) ( not ( = ?auto_167714 ?auto_167717 ) ) ( not ( = ?auto_167715 ?auto_167716 ) ) ( not ( = ?auto_167715 ?auto_167717 ) ) ( not ( = ?auto_167716 ?auto_167717 ) ) ( ON ?auto_167717 ?auto_167718 ) ( not ( = ?auto_167710 ?auto_167718 ) ) ( not ( = ?auto_167711 ?auto_167718 ) ) ( not ( = ?auto_167712 ?auto_167718 ) ) ( not ( = ?auto_167713 ?auto_167718 ) ) ( not ( = ?auto_167714 ?auto_167718 ) ) ( not ( = ?auto_167715 ?auto_167718 ) ) ( not ( = ?auto_167716 ?auto_167718 ) ) ( not ( = ?auto_167717 ?auto_167718 ) ) ( ON ?auto_167716 ?auto_167717 ) ( ON-TABLE ?auto_167718 ) ( ON ?auto_167715 ?auto_167716 ) ( ON ?auto_167714 ?auto_167715 ) ( CLEAR ?auto_167712 ) ( ON ?auto_167713 ?auto_167714 ) ( CLEAR ?auto_167713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167718 ?auto_167717 ?auto_167716 ?auto_167715 ?auto_167714 )
      ( MAKE-8PILE ?auto_167710 ?auto_167711 ?auto_167712 ?auto_167713 ?auto_167714 ?auto_167715 ?auto_167716 ?auto_167717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167719 - BLOCK
      ?auto_167720 - BLOCK
      ?auto_167721 - BLOCK
      ?auto_167722 - BLOCK
      ?auto_167723 - BLOCK
      ?auto_167724 - BLOCK
      ?auto_167725 - BLOCK
      ?auto_167726 - BLOCK
    )
    :vars
    (
      ?auto_167727 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167719 ) ( ON ?auto_167720 ?auto_167719 ) ( not ( = ?auto_167719 ?auto_167720 ) ) ( not ( = ?auto_167719 ?auto_167721 ) ) ( not ( = ?auto_167719 ?auto_167722 ) ) ( not ( = ?auto_167719 ?auto_167723 ) ) ( not ( = ?auto_167719 ?auto_167724 ) ) ( not ( = ?auto_167719 ?auto_167725 ) ) ( not ( = ?auto_167719 ?auto_167726 ) ) ( not ( = ?auto_167720 ?auto_167721 ) ) ( not ( = ?auto_167720 ?auto_167722 ) ) ( not ( = ?auto_167720 ?auto_167723 ) ) ( not ( = ?auto_167720 ?auto_167724 ) ) ( not ( = ?auto_167720 ?auto_167725 ) ) ( not ( = ?auto_167720 ?auto_167726 ) ) ( not ( = ?auto_167721 ?auto_167722 ) ) ( not ( = ?auto_167721 ?auto_167723 ) ) ( not ( = ?auto_167721 ?auto_167724 ) ) ( not ( = ?auto_167721 ?auto_167725 ) ) ( not ( = ?auto_167721 ?auto_167726 ) ) ( not ( = ?auto_167722 ?auto_167723 ) ) ( not ( = ?auto_167722 ?auto_167724 ) ) ( not ( = ?auto_167722 ?auto_167725 ) ) ( not ( = ?auto_167722 ?auto_167726 ) ) ( not ( = ?auto_167723 ?auto_167724 ) ) ( not ( = ?auto_167723 ?auto_167725 ) ) ( not ( = ?auto_167723 ?auto_167726 ) ) ( not ( = ?auto_167724 ?auto_167725 ) ) ( not ( = ?auto_167724 ?auto_167726 ) ) ( not ( = ?auto_167725 ?auto_167726 ) ) ( ON ?auto_167726 ?auto_167727 ) ( not ( = ?auto_167719 ?auto_167727 ) ) ( not ( = ?auto_167720 ?auto_167727 ) ) ( not ( = ?auto_167721 ?auto_167727 ) ) ( not ( = ?auto_167722 ?auto_167727 ) ) ( not ( = ?auto_167723 ?auto_167727 ) ) ( not ( = ?auto_167724 ?auto_167727 ) ) ( not ( = ?auto_167725 ?auto_167727 ) ) ( not ( = ?auto_167726 ?auto_167727 ) ) ( ON ?auto_167725 ?auto_167726 ) ( ON-TABLE ?auto_167727 ) ( ON ?auto_167724 ?auto_167725 ) ( ON ?auto_167723 ?auto_167724 ) ( ON ?auto_167722 ?auto_167723 ) ( CLEAR ?auto_167722 ) ( HOLDING ?auto_167721 ) ( CLEAR ?auto_167720 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167719 ?auto_167720 ?auto_167721 )
      ( MAKE-8PILE ?auto_167719 ?auto_167720 ?auto_167721 ?auto_167722 ?auto_167723 ?auto_167724 ?auto_167725 ?auto_167726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167728 - BLOCK
      ?auto_167729 - BLOCK
      ?auto_167730 - BLOCK
      ?auto_167731 - BLOCK
      ?auto_167732 - BLOCK
      ?auto_167733 - BLOCK
      ?auto_167734 - BLOCK
      ?auto_167735 - BLOCK
    )
    :vars
    (
      ?auto_167736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167728 ) ( ON ?auto_167729 ?auto_167728 ) ( not ( = ?auto_167728 ?auto_167729 ) ) ( not ( = ?auto_167728 ?auto_167730 ) ) ( not ( = ?auto_167728 ?auto_167731 ) ) ( not ( = ?auto_167728 ?auto_167732 ) ) ( not ( = ?auto_167728 ?auto_167733 ) ) ( not ( = ?auto_167728 ?auto_167734 ) ) ( not ( = ?auto_167728 ?auto_167735 ) ) ( not ( = ?auto_167729 ?auto_167730 ) ) ( not ( = ?auto_167729 ?auto_167731 ) ) ( not ( = ?auto_167729 ?auto_167732 ) ) ( not ( = ?auto_167729 ?auto_167733 ) ) ( not ( = ?auto_167729 ?auto_167734 ) ) ( not ( = ?auto_167729 ?auto_167735 ) ) ( not ( = ?auto_167730 ?auto_167731 ) ) ( not ( = ?auto_167730 ?auto_167732 ) ) ( not ( = ?auto_167730 ?auto_167733 ) ) ( not ( = ?auto_167730 ?auto_167734 ) ) ( not ( = ?auto_167730 ?auto_167735 ) ) ( not ( = ?auto_167731 ?auto_167732 ) ) ( not ( = ?auto_167731 ?auto_167733 ) ) ( not ( = ?auto_167731 ?auto_167734 ) ) ( not ( = ?auto_167731 ?auto_167735 ) ) ( not ( = ?auto_167732 ?auto_167733 ) ) ( not ( = ?auto_167732 ?auto_167734 ) ) ( not ( = ?auto_167732 ?auto_167735 ) ) ( not ( = ?auto_167733 ?auto_167734 ) ) ( not ( = ?auto_167733 ?auto_167735 ) ) ( not ( = ?auto_167734 ?auto_167735 ) ) ( ON ?auto_167735 ?auto_167736 ) ( not ( = ?auto_167728 ?auto_167736 ) ) ( not ( = ?auto_167729 ?auto_167736 ) ) ( not ( = ?auto_167730 ?auto_167736 ) ) ( not ( = ?auto_167731 ?auto_167736 ) ) ( not ( = ?auto_167732 ?auto_167736 ) ) ( not ( = ?auto_167733 ?auto_167736 ) ) ( not ( = ?auto_167734 ?auto_167736 ) ) ( not ( = ?auto_167735 ?auto_167736 ) ) ( ON ?auto_167734 ?auto_167735 ) ( ON-TABLE ?auto_167736 ) ( ON ?auto_167733 ?auto_167734 ) ( ON ?auto_167732 ?auto_167733 ) ( ON ?auto_167731 ?auto_167732 ) ( CLEAR ?auto_167729 ) ( ON ?auto_167730 ?auto_167731 ) ( CLEAR ?auto_167730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167736 ?auto_167735 ?auto_167734 ?auto_167733 ?auto_167732 ?auto_167731 )
      ( MAKE-8PILE ?auto_167728 ?auto_167729 ?auto_167730 ?auto_167731 ?auto_167732 ?auto_167733 ?auto_167734 ?auto_167735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167737 - BLOCK
      ?auto_167738 - BLOCK
      ?auto_167739 - BLOCK
      ?auto_167740 - BLOCK
      ?auto_167741 - BLOCK
      ?auto_167742 - BLOCK
      ?auto_167743 - BLOCK
      ?auto_167744 - BLOCK
    )
    :vars
    (
      ?auto_167745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167737 ) ( not ( = ?auto_167737 ?auto_167738 ) ) ( not ( = ?auto_167737 ?auto_167739 ) ) ( not ( = ?auto_167737 ?auto_167740 ) ) ( not ( = ?auto_167737 ?auto_167741 ) ) ( not ( = ?auto_167737 ?auto_167742 ) ) ( not ( = ?auto_167737 ?auto_167743 ) ) ( not ( = ?auto_167737 ?auto_167744 ) ) ( not ( = ?auto_167738 ?auto_167739 ) ) ( not ( = ?auto_167738 ?auto_167740 ) ) ( not ( = ?auto_167738 ?auto_167741 ) ) ( not ( = ?auto_167738 ?auto_167742 ) ) ( not ( = ?auto_167738 ?auto_167743 ) ) ( not ( = ?auto_167738 ?auto_167744 ) ) ( not ( = ?auto_167739 ?auto_167740 ) ) ( not ( = ?auto_167739 ?auto_167741 ) ) ( not ( = ?auto_167739 ?auto_167742 ) ) ( not ( = ?auto_167739 ?auto_167743 ) ) ( not ( = ?auto_167739 ?auto_167744 ) ) ( not ( = ?auto_167740 ?auto_167741 ) ) ( not ( = ?auto_167740 ?auto_167742 ) ) ( not ( = ?auto_167740 ?auto_167743 ) ) ( not ( = ?auto_167740 ?auto_167744 ) ) ( not ( = ?auto_167741 ?auto_167742 ) ) ( not ( = ?auto_167741 ?auto_167743 ) ) ( not ( = ?auto_167741 ?auto_167744 ) ) ( not ( = ?auto_167742 ?auto_167743 ) ) ( not ( = ?auto_167742 ?auto_167744 ) ) ( not ( = ?auto_167743 ?auto_167744 ) ) ( ON ?auto_167744 ?auto_167745 ) ( not ( = ?auto_167737 ?auto_167745 ) ) ( not ( = ?auto_167738 ?auto_167745 ) ) ( not ( = ?auto_167739 ?auto_167745 ) ) ( not ( = ?auto_167740 ?auto_167745 ) ) ( not ( = ?auto_167741 ?auto_167745 ) ) ( not ( = ?auto_167742 ?auto_167745 ) ) ( not ( = ?auto_167743 ?auto_167745 ) ) ( not ( = ?auto_167744 ?auto_167745 ) ) ( ON ?auto_167743 ?auto_167744 ) ( ON-TABLE ?auto_167745 ) ( ON ?auto_167742 ?auto_167743 ) ( ON ?auto_167741 ?auto_167742 ) ( ON ?auto_167740 ?auto_167741 ) ( ON ?auto_167739 ?auto_167740 ) ( CLEAR ?auto_167739 ) ( HOLDING ?auto_167738 ) ( CLEAR ?auto_167737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167737 ?auto_167738 )
      ( MAKE-8PILE ?auto_167737 ?auto_167738 ?auto_167739 ?auto_167740 ?auto_167741 ?auto_167742 ?auto_167743 ?auto_167744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167746 - BLOCK
      ?auto_167747 - BLOCK
      ?auto_167748 - BLOCK
      ?auto_167749 - BLOCK
      ?auto_167750 - BLOCK
      ?auto_167751 - BLOCK
      ?auto_167752 - BLOCK
      ?auto_167753 - BLOCK
    )
    :vars
    (
      ?auto_167754 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167746 ) ( not ( = ?auto_167746 ?auto_167747 ) ) ( not ( = ?auto_167746 ?auto_167748 ) ) ( not ( = ?auto_167746 ?auto_167749 ) ) ( not ( = ?auto_167746 ?auto_167750 ) ) ( not ( = ?auto_167746 ?auto_167751 ) ) ( not ( = ?auto_167746 ?auto_167752 ) ) ( not ( = ?auto_167746 ?auto_167753 ) ) ( not ( = ?auto_167747 ?auto_167748 ) ) ( not ( = ?auto_167747 ?auto_167749 ) ) ( not ( = ?auto_167747 ?auto_167750 ) ) ( not ( = ?auto_167747 ?auto_167751 ) ) ( not ( = ?auto_167747 ?auto_167752 ) ) ( not ( = ?auto_167747 ?auto_167753 ) ) ( not ( = ?auto_167748 ?auto_167749 ) ) ( not ( = ?auto_167748 ?auto_167750 ) ) ( not ( = ?auto_167748 ?auto_167751 ) ) ( not ( = ?auto_167748 ?auto_167752 ) ) ( not ( = ?auto_167748 ?auto_167753 ) ) ( not ( = ?auto_167749 ?auto_167750 ) ) ( not ( = ?auto_167749 ?auto_167751 ) ) ( not ( = ?auto_167749 ?auto_167752 ) ) ( not ( = ?auto_167749 ?auto_167753 ) ) ( not ( = ?auto_167750 ?auto_167751 ) ) ( not ( = ?auto_167750 ?auto_167752 ) ) ( not ( = ?auto_167750 ?auto_167753 ) ) ( not ( = ?auto_167751 ?auto_167752 ) ) ( not ( = ?auto_167751 ?auto_167753 ) ) ( not ( = ?auto_167752 ?auto_167753 ) ) ( ON ?auto_167753 ?auto_167754 ) ( not ( = ?auto_167746 ?auto_167754 ) ) ( not ( = ?auto_167747 ?auto_167754 ) ) ( not ( = ?auto_167748 ?auto_167754 ) ) ( not ( = ?auto_167749 ?auto_167754 ) ) ( not ( = ?auto_167750 ?auto_167754 ) ) ( not ( = ?auto_167751 ?auto_167754 ) ) ( not ( = ?auto_167752 ?auto_167754 ) ) ( not ( = ?auto_167753 ?auto_167754 ) ) ( ON ?auto_167752 ?auto_167753 ) ( ON-TABLE ?auto_167754 ) ( ON ?auto_167751 ?auto_167752 ) ( ON ?auto_167750 ?auto_167751 ) ( ON ?auto_167749 ?auto_167750 ) ( ON ?auto_167748 ?auto_167749 ) ( CLEAR ?auto_167746 ) ( ON ?auto_167747 ?auto_167748 ) ( CLEAR ?auto_167747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167754 ?auto_167753 ?auto_167752 ?auto_167751 ?auto_167750 ?auto_167749 ?auto_167748 )
      ( MAKE-8PILE ?auto_167746 ?auto_167747 ?auto_167748 ?auto_167749 ?auto_167750 ?auto_167751 ?auto_167752 ?auto_167753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167755 - BLOCK
      ?auto_167756 - BLOCK
      ?auto_167757 - BLOCK
      ?auto_167758 - BLOCK
      ?auto_167759 - BLOCK
      ?auto_167760 - BLOCK
      ?auto_167761 - BLOCK
      ?auto_167762 - BLOCK
    )
    :vars
    (
      ?auto_167763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167755 ?auto_167756 ) ) ( not ( = ?auto_167755 ?auto_167757 ) ) ( not ( = ?auto_167755 ?auto_167758 ) ) ( not ( = ?auto_167755 ?auto_167759 ) ) ( not ( = ?auto_167755 ?auto_167760 ) ) ( not ( = ?auto_167755 ?auto_167761 ) ) ( not ( = ?auto_167755 ?auto_167762 ) ) ( not ( = ?auto_167756 ?auto_167757 ) ) ( not ( = ?auto_167756 ?auto_167758 ) ) ( not ( = ?auto_167756 ?auto_167759 ) ) ( not ( = ?auto_167756 ?auto_167760 ) ) ( not ( = ?auto_167756 ?auto_167761 ) ) ( not ( = ?auto_167756 ?auto_167762 ) ) ( not ( = ?auto_167757 ?auto_167758 ) ) ( not ( = ?auto_167757 ?auto_167759 ) ) ( not ( = ?auto_167757 ?auto_167760 ) ) ( not ( = ?auto_167757 ?auto_167761 ) ) ( not ( = ?auto_167757 ?auto_167762 ) ) ( not ( = ?auto_167758 ?auto_167759 ) ) ( not ( = ?auto_167758 ?auto_167760 ) ) ( not ( = ?auto_167758 ?auto_167761 ) ) ( not ( = ?auto_167758 ?auto_167762 ) ) ( not ( = ?auto_167759 ?auto_167760 ) ) ( not ( = ?auto_167759 ?auto_167761 ) ) ( not ( = ?auto_167759 ?auto_167762 ) ) ( not ( = ?auto_167760 ?auto_167761 ) ) ( not ( = ?auto_167760 ?auto_167762 ) ) ( not ( = ?auto_167761 ?auto_167762 ) ) ( ON ?auto_167762 ?auto_167763 ) ( not ( = ?auto_167755 ?auto_167763 ) ) ( not ( = ?auto_167756 ?auto_167763 ) ) ( not ( = ?auto_167757 ?auto_167763 ) ) ( not ( = ?auto_167758 ?auto_167763 ) ) ( not ( = ?auto_167759 ?auto_167763 ) ) ( not ( = ?auto_167760 ?auto_167763 ) ) ( not ( = ?auto_167761 ?auto_167763 ) ) ( not ( = ?auto_167762 ?auto_167763 ) ) ( ON ?auto_167761 ?auto_167762 ) ( ON-TABLE ?auto_167763 ) ( ON ?auto_167760 ?auto_167761 ) ( ON ?auto_167759 ?auto_167760 ) ( ON ?auto_167758 ?auto_167759 ) ( ON ?auto_167757 ?auto_167758 ) ( ON ?auto_167756 ?auto_167757 ) ( CLEAR ?auto_167756 ) ( HOLDING ?auto_167755 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167755 )
      ( MAKE-8PILE ?auto_167755 ?auto_167756 ?auto_167757 ?auto_167758 ?auto_167759 ?auto_167760 ?auto_167761 ?auto_167762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167764 - BLOCK
      ?auto_167765 - BLOCK
      ?auto_167766 - BLOCK
      ?auto_167767 - BLOCK
      ?auto_167768 - BLOCK
      ?auto_167769 - BLOCK
      ?auto_167770 - BLOCK
      ?auto_167771 - BLOCK
    )
    :vars
    (
      ?auto_167772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167764 ?auto_167765 ) ) ( not ( = ?auto_167764 ?auto_167766 ) ) ( not ( = ?auto_167764 ?auto_167767 ) ) ( not ( = ?auto_167764 ?auto_167768 ) ) ( not ( = ?auto_167764 ?auto_167769 ) ) ( not ( = ?auto_167764 ?auto_167770 ) ) ( not ( = ?auto_167764 ?auto_167771 ) ) ( not ( = ?auto_167765 ?auto_167766 ) ) ( not ( = ?auto_167765 ?auto_167767 ) ) ( not ( = ?auto_167765 ?auto_167768 ) ) ( not ( = ?auto_167765 ?auto_167769 ) ) ( not ( = ?auto_167765 ?auto_167770 ) ) ( not ( = ?auto_167765 ?auto_167771 ) ) ( not ( = ?auto_167766 ?auto_167767 ) ) ( not ( = ?auto_167766 ?auto_167768 ) ) ( not ( = ?auto_167766 ?auto_167769 ) ) ( not ( = ?auto_167766 ?auto_167770 ) ) ( not ( = ?auto_167766 ?auto_167771 ) ) ( not ( = ?auto_167767 ?auto_167768 ) ) ( not ( = ?auto_167767 ?auto_167769 ) ) ( not ( = ?auto_167767 ?auto_167770 ) ) ( not ( = ?auto_167767 ?auto_167771 ) ) ( not ( = ?auto_167768 ?auto_167769 ) ) ( not ( = ?auto_167768 ?auto_167770 ) ) ( not ( = ?auto_167768 ?auto_167771 ) ) ( not ( = ?auto_167769 ?auto_167770 ) ) ( not ( = ?auto_167769 ?auto_167771 ) ) ( not ( = ?auto_167770 ?auto_167771 ) ) ( ON ?auto_167771 ?auto_167772 ) ( not ( = ?auto_167764 ?auto_167772 ) ) ( not ( = ?auto_167765 ?auto_167772 ) ) ( not ( = ?auto_167766 ?auto_167772 ) ) ( not ( = ?auto_167767 ?auto_167772 ) ) ( not ( = ?auto_167768 ?auto_167772 ) ) ( not ( = ?auto_167769 ?auto_167772 ) ) ( not ( = ?auto_167770 ?auto_167772 ) ) ( not ( = ?auto_167771 ?auto_167772 ) ) ( ON ?auto_167770 ?auto_167771 ) ( ON-TABLE ?auto_167772 ) ( ON ?auto_167769 ?auto_167770 ) ( ON ?auto_167768 ?auto_167769 ) ( ON ?auto_167767 ?auto_167768 ) ( ON ?auto_167766 ?auto_167767 ) ( ON ?auto_167765 ?auto_167766 ) ( ON ?auto_167764 ?auto_167765 ) ( CLEAR ?auto_167764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167772 ?auto_167771 ?auto_167770 ?auto_167769 ?auto_167768 ?auto_167767 ?auto_167766 ?auto_167765 )
      ( MAKE-8PILE ?auto_167764 ?auto_167765 ?auto_167766 ?auto_167767 ?auto_167768 ?auto_167769 ?auto_167770 ?auto_167771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167780 - BLOCK
      ?auto_167781 - BLOCK
      ?auto_167782 - BLOCK
      ?auto_167783 - BLOCK
      ?auto_167784 - BLOCK
      ?auto_167785 - BLOCK
      ?auto_167786 - BLOCK
    )
    :vars
    (
      ?auto_167787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167787 ?auto_167786 ) ( CLEAR ?auto_167787 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167780 ) ( ON ?auto_167781 ?auto_167780 ) ( ON ?auto_167782 ?auto_167781 ) ( ON ?auto_167783 ?auto_167782 ) ( ON ?auto_167784 ?auto_167783 ) ( ON ?auto_167785 ?auto_167784 ) ( ON ?auto_167786 ?auto_167785 ) ( not ( = ?auto_167780 ?auto_167781 ) ) ( not ( = ?auto_167780 ?auto_167782 ) ) ( not ( = ?auto_167780 ?auto_167783 ) ) ( not ( = ?auto_167780 ?auto_167784 ) ) ( not ( = ?auto_167780 ?auto_167785 ) ) ( not ( = ?auto_167780 ?auto_167786 ) ) ( not ( = ?auto_167780 ?auto_167787 ) ) ( not ( = ?auto_167781 ?auto_167782 ) ) ( not ( = ?auto_167781 ?auto_167783 ) ) ( not ( = ?auto_167781 ?auto_167784 ) ) ( not ( = ?auto_167781 ?auto_167785 ) ) ( not ( = ?auto_167781 ?auto_167786 ) ) ( not ( = ?auto_167781 ?auto_167787 ) ) ( not ( = ?auto_167782 ?auto_167783 ) ) ( not ( = ?auto_167782 ?auto_167784 ) ) ( not ( = ?auto_167782 ?auto_167785 ) ) ( not ( = ?auto_167782 ?auto_167786 ) ) ( not ( = ?auto_167782 ?auto_167787 ) ) ( not ( = ?auto_167783 ?auto_167784 ) ) ( not ( = ?auto_167783 ?auto_167785 ) ) ( not ( = ?auto_167783 ?auto_167786 ) ) ( not ( = ?auto_167783 ?auto_167787 ) ) ( not ( = ?auto_167784 ?auto_167785 ) ) ( not ( = ?auto_167784 ?auto_167786 ) ) ( not ( = ?auto_167784 ?auto_167787 ) ) ( not ( = ?auto_167785 ?auto_167786 ) ) ( not ( = ?auto_167785 ?auto_167787 ) ) ( not ( = ?auto_167786 ?auto_167787 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167787 ?auto_167786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167805 - BLOCK
      ?auto_167806 - BLOCK
      ?auto_167807 - BLOCK
      ?auto_167808 - BLOCK
      ?auto_167809 - BLOCK
      ?auto_167810 - BLOCK
      ?auto_167811 - BLOCK
    )
    :vars
    (
      ?auto_167812 - BLOCK
      ?auto_167813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167805 ) ( ON ?auto_167806 ?auto_167805 ) ( ON ?auto_167807 ?auto_167806 ) ( ON ?auto_167808 ?auto_167807 ) ( ON ?auto_167809 ?auto_167808 ) ( ON ?auto_167810 ?auto_167809 ) ( not ( = ?auto_167805 ?auto_167806 ) ) ( not ( = ?auto_167805 ?auto_167807 ) ) ( not ( = ?auto_167805 ?auto_167808 ) ) ( not ( = ?auto_167805 ?auto_167809 ) ) ( not ( = ?auto_167805 ?auto_167810 ) ) ( not ( = ?auto_167805 ?auto_167811 ) ) ( not ( = ?auto_167805 ?auto_167812 ) ) ( not ( = ?auto_167806 ?auto_167807 ) ) ( not ( = ?auto_167806 ?auto_167808 ) ) ( not ( = ?auto_167806 ?auto_167809 ) ) ( not ( = ?auto_167806 ?auto_167810 ) ) ( not ( = ?auto_167806 ?auto_167811 ) ) ( not ( = ?auto_167806 ?auto_167812 ) ) ( not ( = ?auto_167807 ?auto_167808 ) ) ( not ( = ?auto_167807 ?auto_167809 ) ) ( not ( = ?auto_167807 ?auto_167810 ) ) ( not ( = ?auto_167807 ?auto_167811 ) ) ( not ( = ?auto_167807 ?auto_167812 ) ) ( not ( = ?auto_167808 ?auto_167809 ) ) ( not ( = ?auto_167808 ?auto_167810 ) ) ( not ( = ?auto_167808 ?auto_167811 ) ) ( not ( = ?auto_167808 ?auto_167812 ) ) ( not ( = ?auto_167809 ?auto_167810 ) ) ( not ( = ?auto_167809 ?auto_167811 ) ) ( not ( = ?auto_167809 ?auto_167812 ) ) ( not ( = ?auto_167810 ?auto_167811 ) ) ( not ( = ?auto_167810 ?auto_167812 ) ) ( not ( = ?auto_167811 ?auto_167812 ) ) ( ON ?auto_167812 ?auto_167813 ) ( CLEAR ?auto_167812 ) ( not ( = ?auto_167805 ?auto_167813 ) ) ( not ( = ?auto_167806 ?auto_167813 ) ) ( not ( = ?auto_167807 ?auto_167813 ) ) ( not ( = ?auto_167808 ?auto_167813 ) ) ( not ( = ?auto_167809 ?auto_167813 ) ) ( not ( = ?auto_167810 ?auto_167813 ) ) ( not ( = ?auto_167811 ?auto_167813 ) ) ( not ( = ?auto_167812 ?auto_167813 ) ) ( HOLDING ?auto_167811 ) ( CLEAR ?auto_167810 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167805 ?auto_167806 ?auto_167807 ?auto_167808 ?auto_167809 ?auto_167810 ?auto_167811 ?auto_167812 )
      ( MAKE-7PILE ?auto_167805 ?auto_167806 ?auto_167807 ?auto_167808 ?auto_167809 ?auto_167810 ?auto_167811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167814 - BLOCK
      ?auto_167815 - BLOCK
      ?auto_167816 - BLOCK
      ?auto_167817 - BLOCK
      ?auto_167818 - BLOCK
      ?auto_167819 - BLOCK
      ?auto_167820 - BLOCK
    )
    :vars
    (
      ?auto_167822 - BLOCK
      ?auto_167821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167814 ) ( ON ?auto_167815 ?auto_167814 ) ( ON ?auto_167816 ?auto_167815 ) ( ON ?auto_167817 ?auto_167816 ) ( ON ?auto_167818 ?auto_167817 ) ( ON ?auto_167819 ?auto_167818 ) ( not ( = ?auto_167814 ?auto_167815 ) ) ( not ( = ?auto_167814 ?auto_167816 ) ) ( not ( = ?auto_167814 ?auto_167817 ) ) ( not ( = ?auto_167814 ?auto_167818 ) ) ( not ( = ?auto_167814 ?auto_167819 ) ) ( not ( = ?auto_167814 ?auto_167820 ) ) ( not ( = ?auto_167814 ?auto_167822 ) ) ( not ( = ?auto_167815 ?auto_167816 ) ) ( not ( = ?auto_167815 ?auto_167817 ) ) ( not ( = ?auto_167815 ?auto_167818 ) ) ( not ( = ?auto_167815 ?auto_167819 ) ) ( not ( = ?auto_167815 ?auto_167820 ) ) ( not ( = ?auto_167815 ?auto_167822 ) ) ( not ( = ?auto_167816 ?auto_167817 ) ) ( not ( = ?auto_167816 ?auto_167818 ) ) ( not ( = ?auto_167816 ?auto_167819 ) ) ( not ( = ?auto_167816 ?auto_167820 ) ) ( not ( = ?auto_167816 ?auto_167822 ) ) ( not ( = ?auto_167817 ?auto_167818 ) ) ( not ( = ?auto_167817 ?auto_167819 ) ) ( not ( = ?auto_167817 ?auto_167820 ) ) ( not ( = ?auto_167817 ?auto_167822 ) ) ( not ( = ?auto_167818 ?auto_167819 ) ) ( not ( = ?auto_167818 ?auto_167820 ) ) ( not ( = ?auto_167818 ?auto_167822 ) ) ( not ( = ?auto_167819 ?auto_167820 ) ) ( not ( = ?auto_167819 ?auto_167822 ) ) ( not ( = ?auto_167820 ?auto_167822 ) ) ( ON ?auto_167822 ?auto_167821 ) ( not ( = ?auto_167814 ?auto_167821 ) ) ( not ( = ?auto_167815 ?auto_167821 ) ) ( not ( = ?auto_167816 ?auto_167821 ) ) ( not ( = ?auto_167817 ?auto_167821 ) ) ( not ( = ?auto_167818 ?auto_167821 ) ) ( not ( = ?auto_167819 ?auto_167821 ) ) ( not ( = ?auto_167820 ?auto_167821 ) ) ( not ( = ?auto_167822 ?auto_167821 ) ) ( CLEAR ?auto_167819 ) ( ON ?auto_167820 ?auto_167822 ) ( CLEAR ?auto_167820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167821 ?auto_167822 )
      ( MAKE-7PILE ?auto_167814 ?auto_167815 ?auto_167816 ?auto_167817 ?auto_167818 ?auto_167819 ?auto_167820 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167823 - BLOCK
      ?auto_167824 - BLOCK
      ?auto_167825 - BLOCK
      ?auto_167826 - BLOCK
      ?auto_167827 - BLOCK
      ?auto_167828 - BLOCK
      ?auto_167829 - BLOCK
    )
    :vars
    (
      ?auto_167830 - BLOCK
      ?auto_167831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167823 ) ( ON ?auto_167824 ?auto_167823 ) ( ON ?auto_167825 ?auto_167824 ) ( ON ?auto_167826 ?auto_167825 ) ( ON ?auto_167827 ?auto_167826 ) ( not ( = ?auto_167823 ?auto_167824 ) ) ( not ( = ?auto_167823 ?auto_167825 ) ) ( not ( = ?auto_167823 ?auto_167826 ) ) ( not ( = ?auto_167823 ?auto_167827 ) ) ( not ( = ?auto_167823 ?auto_167828 ) ) ( not ( = ?auto_167823 ?auto_167829 ) ) ( not ( = ?auto_167823 ?auto_167830 ) ) ( not ( = ?auto_167824 ?auto_167825 ) ) ( not ( = ?auto_167824 ?auto_167826 ) ) ( not ( = ?auto_167824 ?auto_167827 ) ) ( not ( = ?auto_167824 ?auto_167828 ) ) ( not ( = ?auto_167824 ?auto_167829 ) ) ( not ( = ?auto_167824 ?auto_167830 ) ) ( not ( = ?auto_167825 ?auto_167826 ) ) ( not ( = ?auto_167825 ?auto_167827 ) ) ( not ( = ?auto_167825 ?auto_167828 ) ) ( not ( = ?auto_167825 ?auto_167829 ) ) ( not ( = ?auto_167825 ?auto_167830 ) ) ( not ( = ?auto_167826 ?auto_167827 ) ) ( not ( = ?auto_167826 ?auto_167828 ) ) ( not ( = ?auto_167826 ?auto_167829 ) ) ( not ( = ?auto_167826 ?auto_167830 ) ) ( not ( = ?auto_167827 ?auto_167828 ) ) ( not ( = ?auto_167827 ?auto_167829 ) ) ( not ( = ?auto_167827 ?auto_167830 ) ) ( not ( = ?auto_167828 ?auto_167829 ) ) ( not ( = ?auto_167828 ?auto_167830 ) ) ( not ( = ?auto_167829 ?auto_167830 ) ) ( ON ?auto_167830 ?auto_167831 ) ( not ( = ?auto_167823 ?auto_167831 ) ) ( not ( = ?auto_167824 ?auto_167831 ) ) ( not ( = ?auto_167825 ?auto_167831 ) ) ( not ( = ?auto_167826 ?auto_167831 ) ) ( not ( = ?auto_167827 ?auto_167831 ) ) ( not ( = ?auto_167828 ?auto_167831 ) ) ( not ( = ?auto_167829 ?auto_167831 ) ) ( not ( = ?auto_167830 ?auto_167831 ) ) ( ON ?auto_167829 ?auto_167830 ) ( CLEAR ?auto_167829 ) ( ON-TABLE ?auto_167831 ) ( HOLDING ?auto_167828 ) ( CLEAR ?auto_167827 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167823 ?auto_167824 ?auto_167825 ?auto_167826 ?auto_167827 ?auto_167828 )
      ( MAKE-7PILE ?auto_167823 ?auto_167824 ?auto_167825 ?auto_167826 ?auto_167827 ?auto_167828 ?auto_167829 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167832 - BLOCK
      ?auto_167833 - BLOCK
      ?auto_167834 - BLOCK
      ?auto_167835 - BLOCK
      ?auto_167836 - BLOCK
      ?auto_167837 - BLOCK
      ?auto_167838 - BLOCK
    )
    :vars
    (
      ?auto_167839 - BLOCK
      ?auto_167840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167832 ) ( ON ?auto_167833 ?auto_167832 ) ( ON ?auto_167834 ?auto_167833 ) ( ON ?auto_167835 ?auto_167834 ) ( ON ?auto_167836 ?auto_167835 ) ( not ( = ?auto_167832 ?auto_167833 ) ) ( not ( = ?auto_167832 ?auto_167834 ) ) ( not ( = ?auto_167832 ?auto_167835 ) ) ( not ( = ?auto_167832 ?auto_167836 ) ) ( not ( = ?auto_167832 ?auto_167837 ) ) ( not ( = ?auto_167832 ?auto_167838 ) ) ( not ( = ?auto_167832 ?auto_167839 ) ) ( not ( = ?auto_167833 ?auto_167834 ) ) ( not ( = ?auto_167833 ?auto_167835 ) ) ( not ( = ?auto_167833 ?auto_167836 ) ) ( not ( = ?auto_167833 ?auto_167837 ) ) ( not ( = ?auto_167833 ?auto_167838 ) ) ( not ( = ?auto_167833 ?auto_167839 ) ) ( not ( = ?auto_167834 ?auto_167835 ) ) ( not ( = ?auto_167834 ?auto_167836 ) ) ( not ( = ?auto_167834 ?auto_167837 ) ) ( not ( = ?auto_167834 ?auto_167838 ) ) ( not ( = ?auto_167834 ?auto_167839 ) ) ( not ( = ?auto_167835 ?auto_167836 ) ) ( not ( = ?auto_167835 ?auto_167837 ) ) ( not ( = ?auto_167835 ?auto_167838 ) ) ( not ( = ?auto_167835 ?auto_167839 ) ) ( not ( = ?auto_167836 ?auto_167837 ) ) ( not ( = ?auto_167836 ?auto_167838 ) ) ( not ( = ?auto_167836 ?auto_167839 ) ) ( not ( = ?auto_167837 ?auto_167838 ) ) ( not ( = ?auto_167837 ?auto_167839 ) ) ( not ( = ?auto_167838 ?auto_167839 ) ) ( ON ?auto_167839 ?auto_167840 ) ( not ( = ?auto_167832 ?auto_167840 ) ) ( not ( = ?auto_167833 ?auto_167840 ) ) ( not ( = ?auto_167834 ?auto_167840 ) ) ( not ( = ?auto_167835 ?auto_167840 ) ) ( not ( = ?auto_167836 ?auto_167840 ) ) ( not ( = ?auto_167837 ?auto_167840 ) ) ( not ( = ?auto_167838 ?auto_167840 ) ) ( not ( = ?auto_167839 ?auto_167840 ) ) ( ON ?auto_167838 ?auto_167839 ) ( ON-TABLE ?auto_167840 ) ( CLEAR ?auto_167836 ) ( ON ?auto_167837 ?auto_167838 ) ( CLEAR ?auto_167837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167840 ?auto_167839 ?auto_167838 )
      ( MAKE-7PILE ?auto_167832 ?auto_167833 ?auto_167834 ?auto_167835 ?auto_167836 ?auto_167837 ?auto_167838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167841 - BLOCK
      ?auto_167842 - BLOCK
      ?auto_167843 - BLOCK
      ?auto_167844 - BLOCK
      ?auto_167845 - BLOCK
      ?auto_167846 - BLOCK
      ?auto_167847 - BLOCK
    )
    :vars
    (
      ?auto_167848 - BLOCK
      ?auto_167849 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167841 ) ( ON ?auto_167842 ?auto_167841 ) ( ON ?auto_167843 ?auto_167842 ) ( ON ?auto_167844 ?auto_167843 ) ( not ( = ?auto_167841 ?auto_167842 ) ) ( not ( = ?auto_167841 ?auto_167843 ) ) ( not ( = ?auto_167841 ?auto_167844 ) ) ( not ( = ?auto_167841 ?auto_167845 ) ) ( not ( = ?auto_167841 ?auto_167846 ) ) ( not ( = ?auto_167841 ?auto_167847 ) ) ( not ( = ?auto_167841 ?auto_167848 ) ) ( not ( = ?auto_167842 ?auto_167843 ) ) ( not ( = ?auto_167842 ?auto_167844 ) ) ( not ( = ?auto_167842 ?auto_167845 ) ) ( not ( = ?auto_167842 ?auto_167846 ) ) ( not ( = ?auto_167842 ?auto_167847 ) ) ( not ( = ?auto_167842 ?auto_167848 ) ) ( not ( = ?auto_167843 ?auto_167844 ) ) ( not ( = ?auto_167843 ?auto_167845 ) ) ( not ( = ?auto_167843 ?auto_167846 ) ) ( not ( = ?auto_167843 ?auto_167847 ) ) ( not ( = ?auto_167843 ?auto_167848 ) ) ( not ( = ?auto_167844 ?auto_167845 ) ) ( not ( = ?auto_167844 ?auto_167846 ) ) ( not ( = ?auto_167844 ?auto_167847 ) ) ( not ( = ?auto_167844 ?auto_167848 ) ) ( not ( = ?auto_167845 ?auto_167846 ) ) ( not ( = ?auto_167845 ?auto_167847 ) ) ( not ( = ?auto_167845 ?auto_167848 ) ) ( not ( = ?auto_167846 ?auto_167847 ) ) ( not ( = ?auto_167846 ?auto_167848 ) ) ( not ( = ?auto_167847 ?auto_167848 ) ) ( ON ?auto_167848 ?auto_167849 ) ( not ( = ?auto_167841 ?auto_167849 ) ) ( not ( = ?auto_167842 ?auto_167849 ) ) ( not ( = ?auto_167843 ?auto_167849 ) ) ( not ( = ?auto_167844 ?auto_167849 ) ) ( not ( = ?auto_167845 ?auto_167849 ) ) ( not ( = ?auto_167846 ?auto_167849 ) ) ( not ( = ?auto_167847 ?auto_167849 ) ) ( not ( = ?auto_167848 ?auto_167849 ) ) ( ON ?auto_167847 ?auto_167848 ) ( ON-TABLE ?auto_167849 ) ( ON ?auto_167846 ?auto_167847 ) ( CLEAR ?auto_167846 ) ( HOLDING ?auto_167845 ) ( CLEAR ?auto_167844 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167841 ?auto_167842 ?auto_167843 ?auto_167844 ?auto_167845 )
      ( MAKE-7PILE ?auto_167841 ?auto_167842 ?auto_167843 ?auto_167844 ?auto_167845 ?auto_167846 ?auto_167847 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167850 - BLOCK
      ?auto_167851 - BLOCK
      ?auto_167852 - BLOCK
      ?auto_167853 - BLOCK
      ?auto_167854 - BLOCK
      ?auto_167855 - BLOCK
      ?auto_167856 - BLOCK
    )
    :vars
    (
      ?auto_167858 - BLOCK
      ?auto_167857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167850 ) ( ON ?auto_167851 ?auto_167850 ) ( ON ?auto_167852 ?auto_167851 ) ( ON ?auto_167853 ?auto_167852 ) ( not ( = ?auto_167850 ?auto_167851 ) ) ( not ( = ?auto_167850 ?auto_167852 ) ) ( not ( = ?auto_167850 ?auto_167853 ) ) ( not ( = ?auto_167850 ?auto_167854 ) ) ( not ( = ?auto_167850 ?auto_167855 ) ) ( not ( = ?auto_167850 ?auto_167856 ) ) ( not ( = ?auto_167850 ?auto_167858 ) ) ( not ( = ?auto_167851 ?auto_167852 ) ) ( not ( = ?auto_167851 ?auto_167853 ) ) ( not ( = ?auto_167851 ?auto_167854 ) ) ( not ( = ?auto_167851 ?auto_167855 ) ) ( not ( = ?auto_167851 ?auto_167856 ) ) ( not ( = ?auto_167851 ?auto_167858 ) ) ( not ( = ?auto_167852 ?auto_167853 ) ) ( not ( = ?auto_167852 ?auto_167854 ) ) ( not ( = ?auto_167852 ?auto_167855 ) ) ( not ( = ?auto_167852 ?auto_167856 ) ) ( not ( = ?auto_167852 ?auto_167858 ) ) ( not ( = ?auto_167853 ?auto_167854 ) ) ( not ( = ?auto_167853 ?auto_167855 ) ) ( not ( = ?auto_167853 ?auto_167856 ) ) ( not ( = ?auto_167853 ?auto_167858 ) ) ( not ( = ?auto_167854 ?auto_167855 ) ) ( not ( = ?auto_167854 ?auto_167856 ) ) ( not ( = ?auto_167854 ?auto_167858 ) ) ( not ( = ?auto_167855 ?auto_167856 ) ) ( not ( = ?auto_167855 ?auto_167858 ) ) ( not ( = ?auto_167856 ?auto_167858 ) ) ( ON ?auto_167858 ?auto_167857 ) ( not ( = ?auto_167850 ?auto_167857 ) ) ( not ( = ?auto_167851 ?auto_167857 ) ) ( not ( = ?auto_167852 ?auto_167857 ) ) ( not ( = ?auto_167853 ?auto_167857 ) ) ( not ( = ?auto_167854 ?auto_167857 ) ) ( not ( = ?auto_167855 ?auto_167857 ) ) ( not ( = ?auto_167856 ?auto_167857 ) ) ( not ( = ?auto_167858 ?auto_167857 ) ) ( ON ?auto_167856 ?auto_167858 ) ( ON-TABLE ?auto_167857 ) ( ON ?auto_167855 ?auto_167856 ) ( CLEAR ?auto_167853 ) ( ON ?auto_167854 ?auto_167855 ) ( CLEAR ?auto_167854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167857 ?auto_167858 ?auto_167856 ?auto_167855 )
      ( MAKE-7PILE ?auto_167850 ?auto_167851 ?auto_167852 ?auto_167853 ?auto_167854 ?auto_167855 ?auto_167856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167859 - BLOCK
      ?auto_167860 - BLOCK
      ?auto_167861 - BLOCK
      ?auto_167862 - BLOCK
      ?auto_167863 - BLOCK
      ?auto_167864 - BLOCK
      ?auto_167865 - BLOCK
    )
    :vars
    (
      ?auto_167866 - BLOCK
      ?auto_167867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167859 ) ( ON ?auto_167860 ?auto_167859 ) ( ON ?auto_167861 ?auto_167860 ) ( not ( = ?auto_167859 ?auto_167860 ) ) ( not ( = ?auto_167859 ?auto_167861 ) ) ( not ( = ?auto_167859 ?auto_167862 ) ) ( not ( = ?auto_167859 ?auto_167863 ) ) ( not ( = ?auto_167859 ?auto_167864 ) ) ( not ( = ?auto_167859 ?auto_167865 ) ) ( not ( = ?auto_167859 ?auto_167866 ) ) ( not ( = ?auto_167860 ?auto_167861 ) ) ( not ( = ?auto_167860 ?auto_167862 ) ) ( not ( = ?auto_167860 ?auto_167863 ) ) ( not ( = ?auto_167860 ?auto_167864 ) ) ( not ( = ?auto_167860 ?auto_167865 ) ) ( not ( = ?auto_167860 ?auto_167866 ) ) ( not ( = ?auto_167861 ?auto_167862 ) ) ( not ( = ?auto_167861 ?auto_167863 ) ) ( not ( = ?auto_167861 ?auto_167864 ) ) ( not ( = ?auto_167861 ?auto_167865 ) ) ( not ( = ?auto_167861 ?auto_167866 ) ) ( not ( = ?auto_167862 ?auto_167863 ) ) ( not ( = ?auto_167862 ?auto_167864 ) ) ( not ( = ?auto_167862 ?auto_167865 ) ) ( not ( = ?auto_167862 ?auto_167866 ) ) ( not ( = ?auto_167863 ?auto_167864 ) ) ( not ( = ?auto_167863 ?auto_167865 ) ) ( not ( = ?auto_167863 ?auto_167866 ) ) ( not ( = ?auto_167864 ?auto_167865 ) ) ( not ( = ?auto_167864 ?auto_167866 ) ) ( not ( = ?auto_167865 ?auto_167866 ) ) ( ON ?auto_167866 ?auto_167867 ) ( not ( = ?auto_167859 ?auto_167867 ) ) ( not ( = ?auto_167860 ?auto_167867 ) ) ( not ( = ?auto_167861 ?auto_167867 ) ) ( not ( = ?auto_167862 ?auto_167867 ) ) ( not ( = ?auto_167863 ?auto_167867 ) ) ( not ( = ?auto_167864 ?auto_167867 ) ) ( not ( = ?auto_167865 ?auto_167867 ) ) ( not ( = ?auto_167866 ?auto_167867 ) ) ( ON ?auto_167865 ?auto_167866 ) ( ON-TABLE ?auto_167867 ) ( ON ?auto_167864 ?auto_167865 ) ( ON ?auto_167863 ?auto_167864 ) ( CLEAR ?auto_167863 ) ( HOLDING ?auto_167862 ) ( CLEAR ?auto_167861 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167859 ?auto_167860 ?auto_167861 ?auto_167862 )
      ( MAKE-7PILE ?auto_167859 ?auto_167860 ?auto_167861 ?auto_167862 ?auto_167863 ?auto_167864 ?auto_167865 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167868 - BLOCK
      ?auto_167869 - BLOCK
      ?auto_167870 - BLOCK
      ?auto_167871 - BLOCK
      ?auto_167872 - BLOCK
      ?auto_167873 - BLOCK
      ?auto_167874 - BLOCK
    )
    :vars
    (
      ?auto_167875 - BLOCK
      ?auto_167876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167868 ) ( ON ?auto_167869 ?auto_167868 ) ( ON ?auto_167870 ?auto_167869 ) ( not ( = ?auto_167868 ?auto_167869 ) ) ( not ( = ?auto_167868 ?auto_167870 ) ) ( not ( = ?auto_167868 ?auto_167871 ) ) ( not ( = ?auto_167868 ?auto_167872 ) ) ( not ( = ?auto_167868 ?auto_167873 ) ) ( not ( = ?auto_167868 ?auto_167874 ) ) ( not ( = ?auto_167868 ?auto_167875 ) ) ( not ( = ?auto_167869 ?auto_167870 ) ) ( not ( = ?auto_167869 ?auto_167871 ) ) ( not ( = ?auto_167869 ?auto_167872 ) ) ( not ( = ?auto_167869 ?auto_167873 ) ) ( not ( = ?auto_167869 ?auto_167874 ) ) ( not ( = ?auto_167869 ?auto_167875 ) ) ( not ( = ?auto_167870 ?auto_167871 ) ) ( not ( = ?auto_167870 ?auto_167872 ) ) ( not ( = ?auto_167870 ?auto_167873 ) ) ( not ( = ?auto_167870 ?auto_167874 ) ) ( not ( = ?auto_167870 ?auto_167875 ) ) ( not ( = ?auto_167871 ?auto_167872 ) ) ( not ( = ?auto_167871 ?auto_167873 ) ) ( not ( = ?auto_167871 ?auto_167874 ) ) ( not ( = ?auto_167871 ?auto_167875 ) ) ( not ( = ?auto_167872 ?auto_167873 ) ) ( not ( = ?auto_167872 ?auto_167874 ) ) ( not ( = ?auto_167872 ?auto_167875 ) ) ( not ( = ?auto_167873 ?auto_167874 ) ) ( not ( = ?auto_167873 ?auto_167875 ) ) ( not ( = ?auto_167874 ?auto_167875 ) ) ( ON ?auto_167875 ?auto_167876 ) ( not ( = ?auto_167868 ?auto_167876 ) ) ( not ( = ?auto_167869 ?auto_167876 ) ) ( not ( = ?auto_167870 ?auto_167876 ) ) ( not ( = ?auto_167871 ?auto_167876 ) ) ( not ( = ?auto_167872 ?auto_167876 ) ) ( not ( = ?auto_167873 ?auto_167876 ) ) ( not ( = ?auto_167874 ?auto_167876 ) ) ( not ( = ?auto_167875 ?auto_167876 ) ) ( ON ?auto_167874 ?auto_167875 ) ( ON-TABLE ?auto_167876 ) ( ON ?auto_167873 ?auto_167874 ) ( ON ?auto_167872 ?auto_167873 ) ( CLEAR ?auto_167870 ) ( ON ?auto_167871 ?auto_167872 ) ( CLEAR ?auto_167871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167876 ?auto_167875 ?auto_167874 ?auto_167873 ?auto_167872 )
      ( MAKE-7PILE ?auto_167868 ?auto_167869 ?auto_167870 ?auto_167871 ?auto_167872 ?auto_167873 ?auto_167874 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167877 - BLOCK
      ?auto_167878 - BLOCK
      ?auto_167879 - BLOCK
      ?auto_167880 - BLOCK
      ?auto_167881 - BLOCK
      ?auto_167882 - BLOCK
      ?auto_167883 - BLOCK
    )
    :vars
    (
      ?auto_167884 - BLOCK
      ?auto_167885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167877 ) ( ON ?auto_167878 ?auto_167877 ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( not ( = ?auto_167877 ?auto_167882 ) ) ( not ( = ?auto_167877 ?auto_167883 ) ) ( not ( = ?auto_167877 ?auto_167884 ) ) ( not ( = ?auto_167878 ?auto_167879 ) ) ( not ( = ?auto_167878 ?auto_167880 ) ) ( not ( = ?auto_167878 ?auto_167881 ) ) ( not ( = ?auto_167878 ?auto_167882 ) ) ( not ( = ?auto_167878 ?auto_167883 ) ) ( not ( = ?auto_167878 ?auto_167884 ) ) ( not ( = ?auto_167879 ?auto_167880 ) ) ( not ( = ?auto_167879 ?auto_167881 ) ) ( not ( = ?auto_167879 ?auto_167882 ) ) ( not ( = ?auto_167879 ?auto_167883 ) ) ( not ( = ?auto_167879 ?auto_167884 ) ) ( not ( = ?auto_167880 ?auto_167881 ) ) ( not ( = ?auto_167880 ?auto_167882 ) ) ( not ( = ?auto_167880 ?auto_167883 ) ) ( not ( = ?auto_167880 ?auto_167884 ) ) ( not ( = ?auto_167881 ?auto_167882 ) ) ( not ( = ?auto_167881 ?auto_167883 ) ) ( not ( = ?auto_167881 ?auto_167884 ) ) ( not ( = ?auto_167882 ?auto_167883 ) ) ( not ( = ?auto_167882 ?auto_167884 ) ) ( not ( = ?auto_167883 ?auto_167884 ) ) ( ON ?auto_167884 ?auto_167885 ) ( not ( = ?auto_167877 ?auto_167885 ) ) ( not ( = ?auto_167878 ?auto_167885 ) ) ( not ( = ?auto_167879 ?auto_167885 ) ) ( not ( = ?auto_167880 ?auto_167885 ) ) ( not ( = ?auto_167881 ?auto_167885 ) ) ( not ( = ?auto_167882 ?auto_167885 ) ) ( not ( = ?auto_167883 ?auto_167885 ) ) ( not ( = ?auto_167884 ?auto_167885 ) ) ( ON ?auto_167883 ?auto_167884 ) ( ON-TABLE ?auto_167885 ) ( ON ?auto_167882 ?auto_167883 ) ( ON ?auto_167881 ?auto_167882 ) ( ON ?auto_167880 ?auto_167881 ) ( CLEAR ?auto_167880 ) ( HOLDING ?auto_167879 ) ( CLEAR ?auto_167878 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167877 ?auto_167878 ?auto_167879 )
      ( MAKE-7PILE ?auto_167877 ?auto_167878 ?auto_167879 ?auto_167880 ?auto_167881 ?auto_167882 ?auto_167883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167886 - BLOCK
      ?auto_167887 - BLOCK
      ?auto_167888 - BLOCK
      ?auto_167889 - BLOCK
      ?auto_167890 - BLOCK
      ?auto_167891 - BLOCK
      ?auto_167892 - BLOCK
    )
    :vars
    (
      ?auto_167893 - BLOCK
      ?auto_167894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167886 ) ( ON ?auto_167887 ?auto_167886 ) ( not ( = ?auto_167886 ?auto_167887 ) ) ( not ( = ?auto_167886 ?auto_167888 ) ) ( not ( = ?auto_167886 ?auto_167889 ) ) ( not ( = ?auto_167886 ?auto_167890 ) ) ( not ( = ?auto_167886 ?auto_167891 ) ) ( not ( = ?auto_167886 ?auto_167892 ) ) ( not ( = ?auto_167886 ?auto_167893 ) ) ( not ( = ?auto_167887 ?auto_167888 ) ) ( not ( = ?auto_167887 ?auto_167889 ) ) ( not ( = ?auto_167887 ?auto_167890 ) ) ( not ( = ?auto_167887 ?auto_167891 ) ) ( not ( = ?auto_167887 ?auto_167892 ) ) ( not ( = ?auto_167887 ?auto_167893 ) ) ( not ( = ?auto_167888 ?auto_167889 ) ) ( not ( = ?auto_167888 ?auto_167890 ) ) ( not ( = ?auto_167888 ?auto_167891 ) ) ( not ( = ?auto_167888 ?auto_167892 ) ) ( not ( = ?auto_167888 ?auto_167893 ) ) ( not ( = ?auto_167889 ?auto_167890 ) ) ( not ( = ?auto_167889 ?auto_167891 ) ) ( not ( = ?auto_167889 ?auto_167892 ) ) ( not ( = ?auto_167889 ?auto_167893 ) ) ( not ( = ?auto_167890 ?auto_167891 ) ) ( not ( = ?auto_167890 ?auto_167892 ) ) ( not ( = ?auto_167890 ?auto_167893 ) ) ( not ( = ?auto_167891 ?auto_167892 ) ) ( not ( = ?auto_167891 ?auto_167893 ) ) ( not ( = ?auto_167892 ?auto_167893 ) ) ( ON ?auto_167893 ?auto_167894 ) ( not ( = ?auto_167886 ?auto_167894 ) ) ( not ( = ?auto_167887 ?auto_167894 ) ) ( not ( = ?auto_167888 ?auto_167894 ) ) ( not ( = ?auto_167889 ?auto_167894 ) ) ( not ( = ?auto_167890 ?auto_167894 ) ) ( not ( = ?auto_167891 ?auto_167894 ) ) ( not ( = ?auto_167892 ?auto_167894 ) ) ( not ( = ?auto_167893 ?auto_167894 ) ) ( ON ?auto_167892 ?auto_167893 ) ( ON-TABLE ?auto_167894 ) ( ON ?auto_167891 ?auto_167892 ) ( ON ?auto_167890 ?auto_167891 ) ( ON ?auto_167889 ?auto_167890 ) ( CLEAR ?auto_167887 ) ( ON ?auto_167888 ?auto_167889 ) ( CLEAR ?auto_167888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167894 ?auto_167893 ?auto_167892 ?auto_167891 ?auto_167890 ?auto_167889 )
      ( MAKE-7PILE ?auto_167886 ?auto_167887 ?auto_167888 ?auto_167889 ?auto_167890 ?auto_167891 ?auto_167892 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167895 - BLOCK
      ?auto_167896 - BLOCK
      ?auto_167897 - BLOCK
      ?auto_167898 - BLOCK
      ?auto_167899 - BLOCK
      ?auto_167900 - BLOCK
      ?auto_167901 - BLOCK
    )
    :vars
    (
      ?auto_167903 - BLOCK
      ?auto_167902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167895 ) ( not ( = ?auto_167895 ?auto_167896 ) ) ( not ( = ?auto_167895 ?auto_167897 ) ) ( not ( = ?auto_167895 ?auto_167898 ) ) ( not ( = ?auto_167895 ?auto_167899 ) ) ( not ( = ?auto_167895 ?auto_167900 ) ) ( not ( = ?auto_167895 ?auto_167901 ) ) ( not ( = ?auto_167895 ?auto_167903 ) ) ( not ( = ?auto_167896 ?auto_167897 ) ) ( not ( = ?auto_167896 ?auto_167898 ) ) ( not ( = ?auto_167896 ?auto_167899 ) ) ( not ( = ?auto_167896 ?auto_167900 ) ) ( not ( = ?auto_167896 ?auto_167901 ) ) ( not ( = ?auto_167896 ?auto_167903 ) ) ( not ( = ?auto_167897 ?auto_167898 ) ) ( not ( = ?auto_167897 ?auto_167899 ) ) ( not ( = ?auto_167897 ?auto_167900 ) ) ( not ( = ?auto_167897 ?auto_167901 ) ) ( not ( = ?auto_167897 ?auto_167903 ) ) ( not ( = ?auto_167898 ?auto_167899 ) ) ( not ( = ?auto_167898 ?auto_167900 ) ) ( not ( = ?auto_167898 ?auto_167901 ) ) ( not ( = ?auto_167898 ?auto_167903 ) ) ( not ( = ?auto_167899 ?auto_167900 ) ) ( not ( = ?auto_167899 ?auto_167901 ) ) ( not ( = ?auto_167899 ?auto_167903 ) ) ( not ( = ?auto_167900 ?auto_167901 ) ) ( not ( = ?auto_167900 ?auto_167903 ) ) ( not ( = ?auto_167901 ?auto_167903 ) ) ( ON ?auto_167903 ?auto_167902 ) ( not ( = ?auto_167895 ?auto_167902 ) ) ( not ( = ?auto_167896 ?auto_167902 ) ) ( not ( = ?auto_167897 ?auto_167902 ) ) ( not ( = ?auto_167898 ?auto_167902 ) ) ( not ( = ?auto_167899 ?auto_167902 ) ) ( not ( = ?auto_167900 ?auto_167902 ) ) ( not ( = ?auto_167901 ?auto_167902 ) ) ( not ( = ?auto_167903 ?auto_167902 ) ) ( ON ?auto_167901 ?auto_167903 ) ( ON-TABLE ?auto_167902 ) ( ON ?auto_167900 ?auto_167901 ) ( ON ?auto_167899 ?auto_167900 ) ( ON ?auto_167898 ?auto_167899 ) ( ON ?auto_167897 ?auto_167898 ) ( CLEAR ?auto_167897 ) ( HOLDING ?auto_167896 ) ( CLEAR ?auto_167895 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167895 ?auto_167896 )
      ( MAKE-7PILE ?auto_167895 ?auto_167896 ?auto_167897 ?auto_167898 ?auto_167899 ?auto_167900 ?auto_167901 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167904 - BLOCK
      ?auto_167905 - BLOCK
      ?auto_167906 - BLOCK
      ?auto_167907 - BLOCK
      ?auto_167908 - BLOCK
      ?auto_167909 - BLOCK
      ?auto_167910 - BLOCK
    )
    :vars
    (
      ?auto_167912 - BLOCK
      ?auto_167911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_167904 ) ( not ( = ?auto_167904 ?auto_167905 ) ) ( not ( = ?auto_167904 ?auto_167906 ) ) ( not ( = ?auto_167904 ?auto_167907 ) ) ( not ( = ?auto_167904 ?auto_167908 ) ) ( not ( = ?auto_167904 ?auto_167909 ) ) ( not ( = ?auto_167904 ?auto_167910 ) ) ( not ( = ?auto_167904 ?auto_167912 ) ) ( not ( = ?auto_167905 ?auto_167906 ) ) ( not ( = ?auto_167905 ?auto_167907 ) ) ( not ( = ?auto_167905 ?auto_167908 ) ) ( not ( = ?auto_167905 ?auto_167909 ) ) ( not ( = ?auto_167905 ?auto_167910 ) ) ( not ( = ?auto_167905 ?auto_167912 ) ) ( not ( = ?auto_167906 ?auto_167907 ) ) ( not ( = ?auto_167906 ?auto_167908 ) ) ( not ( = ?auto_167906 ?auto_167909 ) ) ( not ( = ?auto_167906 ?auto_167910 ) ) ( not ( = ?auto_167906 ?auto_167912 ) ) ( not ( = ?auto_167907 ?auto_167908 ) ) ( not ( = ?auto_167907 ?auto_167909 ) ) ( not ( = ?auto_167907 ?auto_167910 ) ) ( not ( = ?auto_167907 ?auto_167912 ) ) ( not ( = ?auto_167908 ?auto_167909 ) ) ( not ( = ?auto_167908 ?auto_167910 ) ) ( not ( = ?auto_167908 ?auto_167912 ) ) ( not ( = ?auto_167909 ?auto_167910 ) ) ( not ( = ?auto_167909 ?auto_167912 ) ) ( not ( = ?auto_167910 ?auto_167912 ) ) ( ON ?auto_167912 ?auto_167911 ) ( not ( = ?auto_167904 ?auto_167911 ) ) ( not ( = ?auto_167905 ?auto_167911 ) ) ( not ( = ?auto_167906 ?auto_167911 ) ) ( not ( = ?auto_167907 ?auto_167911 ) ) ( not ( = ?auto_167908 ?auto_167911 ) ) ( not ( = ?auto_167909 ?auto_167911 ) ) ( not ( = ?auto_167910 ?auto_167911 ) ) ( not ( = ?auto_167912 ?auto_167911 ) ) ( ON ?auto_167910 ?auto_167912 ) ( ON-TABLE ?auto_167911 ) ( ON ?auto_167909 ?auto_167910 ) ( ON ?auto_167908 ?auto_167909 ) ( ON ?auto_167907 ?auto_167908 ) ( ON ?auto_167906 ?auto_167907 ) ( CLEAR ?auto_167904 ) ( ON ?auto_167905 ?auto_167906 ) ( CLEAR ?auto_167905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167911 ?auto_167912 ?auto_167910 ?auto_167909 ?auto_167908 ?auto_167907 ?auto_167906 )
      ( MAKE-7PILE ?auto_167904 ?auto_167905 ?auto_167906 ?auto_167907 ?auto_167908 ?auto_167909 ?auto_167910 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167913 - BLOCK
      ?auto_167914 - BLOCK
      ?auto_167915 - BLOCK
      ?auto_167916 - BLOCK
      ?auto_167917 - BLOCK
      ?auto_167918 - BLOCK
      ?auto_167919 - BLOCK
    )
    :vars
    (
      ?auto_167920 - BLOCK
      ?auto_167921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167913 ?auto_167914 ) ) ( not ( = ?auto_167913 ?auto_167915 ) ) ( not ( = ?auto_167913 ?auto_167916 ) ) ( not ( = ?auto_167913 ?auto_167917 ) ) ( not ( = ?auto_167913 ?auto_167918 ) ) ( not ( = ?auto_167913 ?auto_167919 ) ) ( not ( = ?auto_167913 ?auto_167920 ) ) ( not ( = ?auto_167914 ?auto_167915 ) ) ( not ( = ?auto_167914 ?auto_167916 ) ) ( not ( = ?auto_167914 ?auto_167917 ) ) ( not ( = ?auto_167914 ?auto_167918 ) ) ( not ( = ?auto_167914 ?auto_167919 ) ) ( not ( = ?auto_167914 ?auto_167920 ) ) ( not ( = ?auto_167915 ?auto_167916 ) ) ( not ( = ?auto_167915 ?auto_167917 ) ) ( not ( = ?auto_167915 ?auto_167918 ) ) ( not ( = ?auto_167915 ?auto_167919 ) ) ( not ( = ?auto_167915 ?auto_167920 ) ) ( not ( = ?auto_167916 ?auto_167917 ) ) ( not ( = ?auto_167916 ?auto_167918 ) ) ( not ( = ?auto_167916 ?auto_167919 ) ) ( not ( = ?auto_167916 ?auto_167920 ) ) ( not ( = ?auto_167917 ?auto_167918 ) ) ( not ( = ?auto_167917 ?auto_167919 ) ) ( not ( = ?auto_167917 ?auto_167920 ) ) ( not ( = ?auto_167918 ?auto_167919 ) ) ( not ( = ?auto_167918 ?auto_167920 ) ) ( not ( = ?auto_167919 ?auto_167920 ) ) ( ON ?auto_167920 ?auto_167921 ) ( not ( = ?auto_167913 ?auto_167921 ) ) ( not ( = ?auto_167914 ?auto_167921 ) ) ( not ( = ?auto_167915 ?auto_167921 ) ) ( not ( = ?auto_167916 ?auto_167921 ) ) ( not ( = ?auto_167917 ?auto_167921 ) ) ( not ( = ?auto_167918 ?auto_167921 ) ) ( not ( = ?auto_167919 ?auto_167921 ) ) ( not ( = ?auto_167920 ?auto_167921 ) ) ( ON ?auto_167919 ?auto_167920 ) ( ON-TABLE ?auto_167921 ) ( ON ?auto_167918 ?auto_167919 ) ( ON ?auto_167917 ?auto_167918 ) ( ON ?auto_167916 ?auto_167917 ) ( ON ?auto_167915 ?auto_167916 ) ( ON ?auto_167914 ?auto_167915 ) ( CLEAR ?auto_167914 ) ( HOLDING ?auto_167913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167913 )
      ( MAKE-7PILE ?auto_167913 ?auto_167914 ?auto_167915 ?auto_167916 ?auto_167917 ?auto_167918 ?auto_167919 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167922 - BLOCK
      ?auto_167923 - BLOCK
      ?auto_167924 - BLOCK
      ?auto_167925 - BLOCK
      ?auto_167926 - BLOCK
      ?auto_167927 - BLOCK
      ?auto_167928 - BLOCK
    )
    :vars
    (
      ?auto_167930 - BLOCK
      ?auto_167929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167922 ?auto_167923 ) ) ( not ( = ?auto_167922 ?auto_167924 ) ) ( not ( = ?auto_167922 ?auto_167925 ) ) ( not ( = ?auto_167922 ?auto_167926 ) ) ( not ( = ?auto_167922 ?auto_167927 ) ) ( not ( = ?auto_167922 ?auto_167928 ) ) ( not ( = ?auto_167922 ?auto_167930 ) ) ( not ( = ?auto_167923 ?auto_167924 ) ) ( not ( = ?auto_167923 ?auto_167925 ) ) ( not ( = ?auto_167923 ?auto_167926 ) ) ( not ( = ?auto_167923 ?auto_167927 ) ) ( not ( = ?auto_167923 ?auto_167928 ) ) ( not ( = ?auto_167923 ?auto_167930 ) ) ( not ( = ?auto_167924 ?auto_167925 ) ) ( not ( = ?auto_167924 ?auto_167926 ) ) ( not ( = ?auto_167924 ?auto_167927 ) ) ( not ( = ?auto_167924 ?auto_167928 ) ) ( not ( = ?auto_167924 ?auto_167930 ) ) ( not ( = ?auto_167925 ?auto_167926 ) ) ( not ( = ?auto_167925 ?auto_167927 ) ) ( not ( = ?auto_167925 ?auto_167928 ) ) ( not ( = ?auto_167925 ?auto_167930 ) ) ( not ( = ?auto_167926 ?auto_167927 ) ) ( not ( = ?auto_167926 ?auto_167928 ) ) ( not ( = ?auto_167926 ?auto_167930 ) ) ( not ( = ?auto_167927 ?auto_167928 ) ) ( not ( = ?auto_167927 ?auto_167930 ) ) ( not ( = ?auto_167928 ?auto_167930 ) ) ( ON ?auto_167930 ?auto_167929 ) ( not ( = ?auto_167922 ?auto_167929 ) ) ( not ( = ?auto_167923 ?auto_167929 ) ) ( not ( = ?auto_167924 ?auto_167929 ) ) ( not ( = ?auto_167925 ?auto_167929 ) ) ( not ( = ?auto_167926 ?auto_167929 ) ) ( not ( = ?auto_167927 ?auto_167929 ) ) ( not ( = ?auto_167928 ?auto_167929 ) ) ( not ( = ?auto_167930 ?auto_167929 ) ) ( ON ?auto_167928 ?auto_167930 ) ( ON-TABLE ?auto_167929 ) ( ON ?auto_167927 ?auto_167928 ) ( ON ?auto_167926 ?auto_167927 ) ( ON ?auto_167925 ?auto_167926 ) ( ON ?auto_167924 ?auto_167925 ) ( ON ?auto_167923 ?auto_167924 ) ( ON ?auto_167922 ?auto_167923 ) ( CLEAR ?auto_167922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167929 ?auto_167930 ?auto_167928 ?auto_167927 ?auto_167926 ?auto_167925 ?auto_167924 ?auto_167923 )
      ( MAKE-7PILE ?auto_167922 ?auto_167923 ?auto_167924 ?auto_167925 ?auto_167926 ?auto_167927 ?auto_167928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_167932 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_167932 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167933 - BLOCK
    )
    :vars
    (
      ?auto_167934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167933 ?auto_167934 ) ( CLEAR ?auto_167933 ) ( HAND-EMPTY ) ( not ( = ?auto_167933 ?auto_167934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167933 ?auto_167934 )
      ( MAKE-1PILE ?auto_167933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167935 - BLOCK
    )
    :vars
    (
      ?auto_167936 - BLOCK
      ?auto_167937 - BLOCK
      ?auto_167940 - BLOCK
      ?auto_167938 - BLOCK
      ?auto_167942 - BLOCK
      ?auto_167941 - BLOCK
      ?auto_167939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167935 ?auto_167936 ) ) ( HOLDING ?auto_167935 ) ( CLEAR ?auto_167936 ) ( ON-TABLE ?auto_167937 ) ( ON ?auto_167940 ?auto_167937 ) ( ON ?auto_167938 ?auto_167940 ) ( ON ?auto_167942 ?auto_167938 ) ( ON ?auto_167941 ?auto_167942 ) ( ON ?auto_167939 ?auto_167941 ) ( ON ?auto_167936 ?auto_167939 ) ( not ( = ?auto_167937 ?auto_167940 ) ) ( not ( = ?auto_167937 ?auto_167938 ) ) ( not ( = ?auto_167937 ?auto_167942 ) ) ( not ( = ?auto_167937 ?auto_167941 ) ) ( not ( = ?auto_167937 ?auto_167939 ) ) ( not ( = ?auto_167937 ?auto_167936 ) ) ( not ( = ?auto_167937 ?auto_167935 ) ) ( not ( = ?auto_167940 ?auto_167938 ) ) ( not ( = ?auto_167940 ?auto_167942 ) ) ( not ( = ?auto_167940 ?auto_167941 ) ) ( not ( = ?auto_167940 ?auto_167939 ) ) ( not ( = ?auto_167940 ?auto_167936 ) ) ( not ( = ?auto_167940 ?auto_167935 ) ) ( not ( = ?auto_167938 ?auto_167942 ) ) ( not ( = ?auto_167938 ?auto_167941 ) ) ( not ( = ?auto_167938 ?auto_167939 ) ) ( not ( = ?auto_167938 ?auto_167936 ) ) ( not ( = ?auto_167938 ?auto_167935 ) ) ( not ( = ?auto_167942 ?auto_167941 ) ) ( not ( = ?auto_167942 ?auto_167939 ) ) ( not ( = ?auto_167942 ?auto_167936 ) ) ( not ( = ?auto_167942 ?auto_167935 ) ) ( not ( = ?auto_167941 ?auto_167939 ) ) ( not ( = ?auto_167941 ?auto_167936 ) ) ( not ( = ?auto_167941 ?auto_167935 ) ) ( not ( = ?auto_167939 ?auto_167936 ) ) ( not ( = ?auto_167939 ?auto_167935 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167937 ?auto_167940 ?auto_167938 ?auto_167942 ?auto_167941 ?auto_167939 ?auto_167936 ?auto_167935 )
      ( MAKE-1PILE ?auto_167935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167943 - BLOCK
    )
    :vars
    (
      ?auto_167944 - BLOCK
      ?auto_167947 - BLOCK
      ?auto_167945 - BLOCK
      ?auto_167946 - BLOCK
      ?auto_167949 - BLOCK
      ?auto_167950 - BLOCK
      ?auto_167948 - BLOCK
      ?auto_167951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167943 ?auto_167944 ) ) ( CLEAR ?auto_167944 ) ( ON-TABLE ?auto_167947 ) ( ON ?auto_167945 ?auto_167947 ) ( ON ?auto_167946 ?auto_167945 ) ( ON ?auto_167949 ?auto_167946 ) ( ON ?auto_167950 ?auto_167949 ) ( ON ?auto_167948 ?auto_167950 ) ( ON ?auto_167944 ?auto_167948 ) ( not ( = ?auto_167947 ?auto_167945 ) ) ( not ( = ?auto_167947 ?auto_167946 ) ) ( not ( = ?auto_167947 ?auto_167949 ) ) ( not ( = ?auto_167947 ?auto_167950 ) ) ( not ( = ?auto_167947 ?auto_167948 ) ) ( not ( = ?auto_167947 ?auto_167944 ) ) ( not ( = ?auto_167947 ?auto_167943 ) ) ( not ( = ?auto_167945 ?auto_167946 ) ) ( not ( = ?auto_167945 ?auto_167949 ) ) ( not ( = ?auto_167945 ?auto_167950 ) ) ( not ( = ?auto_167945 ?auto_167948 ) ) ( not ( = ?auto_167945 ?auto_167944 ) ) ( not ( = ?auto_167945 ?auto_167943 ) ) ( not ( = ?auto_167946 ?auto_167949 ) ) ( not ( = ?auto_167946 ?auto_167950 ) ) ( not ( = ?auto_167946 ?auto_167948 ) ) ( not ( = ?auto_167946 ?auto_167944 ) ) ( not ( = ?auto_167946 ?auto_167943 ) ) ( not ( = ?auto_167949 ?auto_167950 ) ) ( not ( = ?auto_167949 ?auto_167948 ) ) ( not ( = ?auto_167949 ?auto_167944 ) ) ( not ( = ?auto_167949 ?auto_167943 ) ) ( not ( = ?auto_167950 ?auto_167948 ) ) ( not ( = ?auto_167950 ?auto_167944 ) ) ( not ( = ?auto_167950 ?auto_167943 ) ) ( not ( = ?auto_167948 ?auto_167944 ) ) ( not ( = ?auto_167948 ?auto_167943 ) ) ( ON ?auto_167943 ?auto_167951 ) ( CLEAR ?auto_167943 ) ( HAND-EMPTY ) ( not ( = ?auto_167943 ?auto_167951 ) ) ( not ( = ?auto_167944 ?auto_167951 ) ) ( not ( = ?auto_167947 ?auto_167951 ) ) ( not ( = ?auto_167945 ?auto_167951 ) ) ( not ( = ?auto_167946 ?auto_167951 ) ) ( not ( = ?auto_167949 ?auto_167951 ) ) ( not ( = ?auto_167950 ?auto_167951 ) ) ( not ( = ?auto_167948 ?auto_167951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167943 ?auto_167951 )
      ( MAKE-1PILE ?auto_167943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167952 - BLOCK
    )
    :vars
    (
      ?auto_167957 - BLOCK
      ?auto_167955 - BLOCK
      ?auto_167960 - BLOCK
      ?auto_167954 - BLOCK
      ?auto_167956 - BLOCK
      ?auto_167958 - BLOCK
      ?auto_167953 - BLOCK
      ?auto_167959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167952 ?auto_167957 ) ) ( ON-TABLE ?auto_167955 ) ( ON ?auto_167960 ?auto_167955 ) ( ON ?auto_167954 ?auto_167960 ) ( ON ?auto_167956 ?auto_167954 ) ( ON ?auto_167958 ?auto_167956 ) ( ON ?auto_167953 ?auto_167958 ) ( not ( = ?auto_167955 ?auto_167960 ) ) ( not ( = ?auto_167955 ?auto_167954 ) ) ( not ( = ?auto_167955 ?auto_167956 ) ) ( not ( = ?auto_167955 ?auto_167958 ) ) ( not ( = ?auto_167955 ?auto_167953 ) ) ( not ( = ?auto_167955 ?auto_167957 ) ) ( not ( = ?auto_167955 ?auto_167952 ) ) ( not ( = ?auto_167960 ?auto_167954 ) ) ( not ( = ?auto_167960 ?auto_167956 ) ) ( not ( = ?auto_167960 ?auto_167958 ) ) ( not ( = ?auto_167960 ?auto_167953 ) ) ( not ( = ?auto_167960 ?auto_167957 ) ) ( not ( = ?auto_167960 ?auto_167952 ) ) ( not ( = ?auto_167954 ?auto_167956 ) ) ( not ( = ?auto_167954 ?auto_167958 ) ) ( not ( = ?auto_167954 ?auto_167953 ) ) ( not ( = ?auto_167954 ?auto_167957 ) ) ( not ( = ?auto_167954 ?auto_167952 ) ) ( not ( = ?auto_167956 ?auto_167958 ) ) ( not ( = ?auto_167956 ?auto_167953 ) ) ( not ( = ?auto_167956 ?auto_167957 ) ) ( not ( = ?auto_167956 ?auto_167952 ) ) ( not ( = ?auto_167958 ?auto_167953 ) ) ( not ( = ?auto_167958 ?auto_167957 ) ) ( not ( = ?auto_167958 ?auto_167952 ) ) ( not ( = ?auto_167953 ?auto_167957 ) ) ( not ( = ?auto_167953 ?auto_167952 ) ) ( ON ?auto_167952 ?auto_167959 ) ( CLEAR ?auto_167952 ) ( not ( = ?auto_167952 ?auto_167959 ) ) ( not ( = ?auto_167957 ?auto_167959 ) ) ( not ( = ?auto_167955 ?auto_167959 ) ) ( not ( = ?auto_167960 ?auto_167959 ) ) ( not ( = ?auto_167954 ?auto_167959 ) ) ( not ( = ?auto_167956 ?auto_167959 ) ) ( not ( = ?auto_167958 ?auto_167959 ) ) ( not ( = ?auto_167953 ?auto_167959 ) ) ( HOLDING ?auto_167957 ) ( CLEAR ?auto_167953 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167955 ?auto_167960 ?auto_167954 ?auto_167956 ?auto_167958 ?auto_167953 ?auto_167957 )
      ( MAKE-1PILE ?auto_167952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167961 - BLOCK
    )
    :vars
    (
      ?auto_167967 - BLOCK
      ?auto_167964 - BLOCK
      ?auto_167968 - BLOCK
      ?auto_167966 - BLOCK
      ?auto_167969 - BLOCK
      ?auto_167963 - BLOCK
      ?auto_167965 - BLOCK
      ?auto_167962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167961 ?auto_167967 ) ) ( ON-TABLE ?auto_167964 ) ( ON ?auto_167968 ?auto_167964 ) ( ON ?auto_167966 ?auto_167968 ) ( ON ?auto_167969 ?auto_167966 ) ( ON ?auto_167963 ?auto_167969 ) ( ON ?auto_167965 ?auto_167963 ) ( not ( = ?auto_167964 ?auto_167968 ) ) ( not ( = ?auto_167964 ?auto_167966 ) ) ( not ( = ?auto_167964 ?auto_167969 ) ) ( not ( = ?auto_167964 ?auto_167963 ) ) ( not ( = ?auto_167964 ?auto_167965 ) ) ( not ( = ?auto_167964 ?auto_167967 ) ) ( not ( = ?auto_167964 ?auto_167961 ) ) ( not ( = ?auto_167968 ?auto_167966 ) ) ( not ( = ?auto_167968 ?auto_167969 ) ) ( not ( = ?auto_167968 ?auto_167963 ) ) ( not ( = ?auto_167968 ?auto_167965 ) ) ( not ( = ?auto_167968 ?auto_167967 ) ) ( not ( = ?auto_167968 ?auto_167961 ) ) ( not ( = ?auto_167966 ?auto_167969 ) ) ( not ( = ?auto_167966 ?auto_167963 ) ) ( not ( = ?auto_167966 ?auto_167965 ) ) ( not ( = ?auto_167966 ?auto_167967 ) ) ( not ( = ?auto_167966 ?auto_167961 ) ) ( not ( = ?auto_167969 ?auto_167963 ) ) ( not ( = ?auto_167969 ?auto_167965 ) ) ( not ( = ?auto_167969 ?auto_167967 ) ) ( not ( = ?auto_167969 ?auto_167961 ) ) ( not ( = ?auto_167963 ?auto_167965 ) ) ( not ( = ?auto_167963 ?auto_167967 ) ) ( not ( = ?auto_167963 ?auto_167961 ) ) ( not ( = ?auto_167965 ?auto_167967 ) ) ( not ( = ?auto_167965 ?auto_167961 ) ) ( ON ?auto_167961 ?auto_167962 ) ( not ( = ?auto_167961 ?auto_167962 ) ) ( not ( = ?auto_167967 ?auto_167962 ) ) ( not ( = ?auto_167964 ?auto_167962 ) ) ( not ( = ?auto_167968 ?auto_167962 ) ) ( not ( = ?auto_167966 ?auto_167962 ) ) ( not ( = ?auto_167969 ?auto_167962 ) ) ( not ( = ?auto_167963 ?auto_167962 ) ) ( not ( = ?auto_167965 ?auto_167962 ) ) ( CLEAR ?auto_167965 ) ( ON ?auto_167967 ?auto_167961 ) ( CLEAR ?auto_167967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167962 ?auto_167961 )
      ( MAKE-1PILE ?auto_167961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167970 - BLOCK
    )
    :vars
    (
      ?auto_167972 - BLOCK
      ?auto_167975 - BLOCK
      ?auto_167977 - BLOCK
      ?auto_167971 - BLOCK
      ?auto_167974 - BLOCK
      ?auto_167978 - BLOCK
      ?auto_167973 - BLOCK
      ?auto_167976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167970 ?auto_167972 ) ) ( ON-TABLE ?auto_167975 ) ( ON ?auto_167977 ?auto_167975 ) ( ON ?auto_167971 ?auto_167977 ) ( ON ?auto_167974 ?auto_167971 ) ( ON ?auto_167978 ?auto_167974 ) ( not ( = ?auto_167975 ?auto_167977 ) ) ( not ( = ?auto_167975 ?auto_167971 ) ) ( not ( = ?auto_167975 ?auto_167974 ) ) ( not ( = ?auto_167975 ?auto_167978 ) ) ( not ( = ?auto_167975 ?auto_167973 ) ) ( not ( = ?auto_167975 ?auto_167972 ) ) ( not ( = ?auto_167975 ?auto_167970 ) ) ( not ( = ?auto_167977 ?auto_167971 ) ) ( not ( = ?auto_167977 ?auto_167974 ) ) ( not ( = ?auto_167977 ?auto_167978 ) ) ( not ( = ?auto_167977 ?auto_167973 ) ) ( not ( = ?auto_167977 ?auto_167972 ) ) ( not ( = ?auto_167977 ?auto_167970 ) ) ( not ( = ?auto_167971 ?auto_167974 ) ) ( not ( = ?auto_167971 ?auto_167978 ) ) ( not ( = ?auto_167971 ?auto_167973 ) ) ( not ( = ?auto_167971 ?auto_167972 ) ) ( not ( = ?auto_167971 ?auto_167970 ) ) ( not ( = ?auto_167974 ?auto_167978 ) ) ( not ( = ?auto_167974 ?auto_167973 ) ) ( not ( = ?auto_167974 ?auto_167972 ) ) ( not ( = ?auto_167974 ?auto_167970 ) ) ( not ( = ?auto_167978 ?auto_167973 ) ) ( not ( = ?auto_167978 ?auto_167972 ) ) ( not ( = ?auto_167978 ?auto_167970 ) ) ( not ( = ?auto_167973 ?auto_167972 ) ) ( not ( = ?auto_167973 ?auto_167970 ) ) ( ON ?auto_167970 ?auto_167976 ) ( not ( = ?auto_167970 ?auto_167976 ) ) ( not ( = ?auto_167972 ?auto_167976 ) ) ( not ( = ?auto_167975 ?auto_167976 ) ) ( not ( = ?auto_167977 ?auto_167976 ) ) ( not ( = ?auto_167971 ?auto_167976 ) ) ( not ( = ?auto_167974 ?auto_167976 ) ) ( not ( = ?auto_167978 ?auto_167976 ) ) ( not ( = ?auto_167973 ?auto_167976 ) ) ( ON ?auto_167972 ?auto_167970 ) ( CLEAR ?auto_167972 ) ( ON-TABLE ?auto_167976 ) ( HOLDING ?auto_167973 ) ( CLEAR ?auto_167978 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167975 ?auto_167977 ?auto_167971 ?auto_167974 ?auto_167978 ?auto_167973 )
      ( MAKE-1PILE ?auto_167970 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167979 - BLOCK
    )
    :vars
    (
      ?auto_167986 - BLOCK
      ?auto_167984 - BLOCK
      ?auto_167981 - BLOCK
      ?auto_167980 - BLOCK
      ?auto_167985 - BLOCK
      ?auto_167987 - BLOCK
      ?auto_167983 - BLOCK
      ?auto_167982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167979 ?auto_167986 ) ) ( ON-TABLE ?auto_167984 ) ( ON ?auto_167981 ?auto_167984 ) ( ON ?auto_167980 ?auto_167981 ) ( ON ?auto_167985 ?auto_167980 ) ( ON ?auto_167987 ?auto_167985 ) ( not ( = ?auto_167984 ?auto_167981 ) ) ( not ( = ?auto_167984 ?auto_167980 ) ) ( not ( = ?auto_167984 ?auto_167985 ) ) ( not ( = ?auto_167984 ?auto_167987 ) ) ( not ( = ?auto_167984 ?auto_167983 ) ) ( not ( = ?auto_167984 ?auto_167986 ) ) ( not ( = ?auto_167984 ?auto_167979 ) ) ( not ( = ?auto_167981 ?auto_167980 ) ) ( not ( = ?auto_167981 ?auto_167985 ) ) ( not ( = ?auto_167981 ?auto_167987 ) ) ( not ( = ?auto_167981 ?auto_167983 ) ) ( not ( = ?auto_167981 ?auto_167986 ) ) ( not ( = ?auto_167981 ?auto_167979 ) ) ( not ( = ?auto_167980 ?auto_167985 ) ) ( not ( = ?auto_167980 ?auto_167987 ) ) ( not ( = ?auto_167980 ?auto_167983 ) ) ( not ( = ?auto_167980 ?auto_167986 ) ) ( not ( = ?auto_167980 ?auto_167979 ) ) ( not ( = ?auto_167985 ?auto_167987 ) ) ( not ( = ?auto_167985 ?auto_167983 ) ) ( not ( = ?auto_167985 ?auto_167986 ) ) ( not ( = ?auto_167985 ?auto_167979 ) ) ( not ( = ?auto_167987 ?auto_167983 ) ) ( not ( = ?auto_167987 ?auto_167986 ) ) ( not ( = ?auto_167987 ?auto_167979 ) ) ( not ( = ?auto_167983 ?auto_167986 ) ) ( not ( = ?auto_167983 ?auto_167979 ) ) ( ON ?auto_167979 ?auto_167982 ) ( not ( = ?auto_167979 ?auto_167982 ) ) ( not ( = ?auto_167986 ?auto_167982 ) ) ( not ( = ?auto_167984 ?auto_167982 ) ) ( not ( = ?auto_167981 ?auto_167982 ) ) ( not ( = ?auto_167980 ?auto_167982 ) ) ( not ( = ?auto_167985 ?auto_167982 ) ) ( not ( = ?auto_167987 ?auto_167982 ) ) ( not ( = ?auto_167983 ?auto_167982 ) ) ( ON ?auto_167986 ?auto_167979 ) ( ON-TABLE ?auto_167982 ) ( CLEAR ?auto_167987 ) ( ON ?auto_167983 ?auto_167986 ) ( CLEAR ?auto_167983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167982 ?auto_167979 ?auto_167986 )
      ( MAKE-1PILE ?auto_167979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167988 - BLOCK
    )
    :vars
    (
      ?auto_167993 - BLOCK
      ?auto_167990 - BLOCK
      ?auto_167995 - BLOCK
      ?auto_167996 - BLOCK
      ?auto_167989 - BLOCK
      ?auto_167994 - BLOCK
      ?auto_167991 - BLOCK
      ?auto_167992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167988 ?auto_167993 ) ) ( ON-TABLE ?auto_167990 ) ( ON ?auto_167995 ?auto_167990 ) ( ON ?auto_167996 ?auto_167995 ) ( ON ?auto_167989 ?auto_167996 ) ( not ( = ?auto_167990 ?auto_167995 ) ) ( not ( = ?auto_167990 ?auto_167996 ) ) ( not ( = ?auto_167990 ?auto_167989 ) ) ( not ( = ?auto_167990 ?auto_167994 ) ) ( not ( = ?auto_167990 ?auto_167991 ) ) ( not ( = ?auto_167990 ?auto_167993 ) ) ( not ( = ?auto_167990 ?auto_167988 ) ) ( not ( = ?auto_167995 ?auto_167996 ) ) ( not ( = ?auto_167995 ?auto_167989 ) ) ( not ( = ?auto_167995 ?auto_167994 ) ) ( not ( = ?auto_167995 ?auto_167991 ) ) ( not ( = ?auto_167995 ?auto_167993 ) ) ( not ( = ?auto_167995 ?auto_167988 ) ) ( not ( = ?auto_167996 ?auto_167989 ) ) ( not ( = ?auto_167996 ?auto_167994 ) ) ( not ( = ?auto_167996 ?auto_167991 ) ) ( not ( = ?auto_167996 ?auto_167993 ) ) ( not ( = ?auto_167996 ?auto_167988 ) ) ( not ( = ?auto_167989 ?auto_167994 ) ) ( not ( = ?auto_167989 ?auto_167991 ) ) ( not ( = ?auto_167989 ?auto_167993 ) ) ( not ( = ?auto_167989 ?auto_167988 ) ) ( not ( = ?auto_167994 ?auto_167991 ) ) ( not ( = ?auto_167994 ?auto_167993 ) ) ( not ( = ?auto_167994 ?auto_167988 ) ) ( not ( = ?auto_167991 ?auto_167993 ) ) ( not ( = ?auto_167991 ?auto_167988 ) ) ( ON ?auto_167988 ?auto_167992 ) ( not ( = ?auto_167988 ?auto_167992 ) ) ( not ( = ?auto_167993 ?auto_167992 ) ) ( not ( = ?auto_167990 ?auto_167992 ) ) ( not ( = ?auto_167995 ?auto_167992 ) ) ( not ( = ?auto_167996 ?auto_167992 ) ) ( not ( = ?auto_167989 ?auto_167992 ) ) ( not ( = ?auto_167994 ?auto_167992 ) ) ( not ( = ?auto_167991 ?auto_167992 ) ) ( ON ?auto_167993 ?auto_167988 ) ( ON-TABLE ?auto_167992 ) ( ON ?auto_167991 ?auto_167993 ) ( CLEAR ?auto_167991 ) ( HOLDING ?auto_167994 ) ( CLEAR ?auto_167989 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167990 ?auto_167995 ?auto_167996 ?auto_167989 ?auto_167994 )
      ( MAKE-1PILE ?auto_167988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_167997 - BLOCK
    )
    :vars
    (
      ?auto_168002 - BLOCK
      ?auto_167999 - BLOCK
      ?auto_168003 - BLOCK
      ?auto_168004 - BLOCK
      ?auto_168001 - BLOCK
      ?auto_168000 - BLOCK
      ?auto_167998 - BLOCK
      ?auto_168005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_167997 ?auto_168002 ) ) ( ON-TABLE ?auto_167999 ) ( ON ?auto_168003 ?auto_167999 ) ( ON ?auto_168004 ?auto_168003 ) ( ON ?auto_168001 ?auto_168004 ) ( not ( = ?auto_167999 ?auto_168003 ) ) ( not ( = ?auto_167999 ?auto_168004 ) ) ( not ( = ?auto_167999 ?auto_168001 ) ) ( not ( = ?auto_167999 ?auto_168000 ) ) ( not ( = ?auto_167999 ?auto_167998 ) ) ( not ( = ?auto_167999 ?auto_168002 ) ) ( not ( = ?auto_167999 ?auto_167997 ) ) ( not ( = ?auto_168003 ?auto_168004 ) ) ( not ( = ?auto_168003 ?auto_168001 ) ) ( not ( = ?auto_168003 ?auto_168000 ) ) ( not ( = ?auto_168003 ?auto_167998 ) ) ( not ( = ?auto_168003 ?auto_168002 ) ) ( not ( = ?auto_168003 ?auto_167997 ) ) ( not ( = ?auto_168004 ?auto_168001 ) ) ( not ( = ?auto_168004 ?auto_168000 ) ) ( not ( = ?auto_168004 ?auto_167998 ) ) ( not ( = ?auto_168004 ?auto_168002 ) ) ( not ( = ?auto_168004 ?auto_167997 ) ) ( not ( = ?auto_168001 ?auto_168000 ) ) ( not ( = ?auto_168001 ?auto_167998 ) ) ( not ( = ?auto_168001 ?auto_168002 ) ) ( not ( = ?auto_168001 ?auto_167997 ) ) ( not ( = ?auto_168000 ?auto_167998 ) ) ( not ( = ?auto_168000 ?auto_168002 ) ) ( not ( = ?auto_168000 ?auto_167997 ) ) ( not ( = ?auto_167998 ?auto_168002 ) ) ( not ( = ?auto_167998 ?auto_167997 ) ) ( ON ?auto_167997 ?auto_168005 ) ( not ( = ?auto_167997 ?auto_168005 ) ) ( not ( = ?auto_168002 ?auto_168005 ) ) ( not ( = ?auto_167999 ?auto_168005 ) ) ( not ( = ?auto_168003 ?auto_168005 ) ) ( not ( = ?auto_168004 ?auto_168005 ) ) ( not ( = ?auto_168001 ?auto_168005 ) ) ( not ( = ?auto_168000 ?auto_168005 ) ) ( not ( = ?auto_167998 ?auto_168005 ) ) ( ON ?auto_168002 ?auto_167997 ) ( ON-TABLE ?auto_168005 ) ( ON ?auto_167998 ?auto_168002 ) ( CLEAR ?auto_168001 ) ( ON ?auto_168000 ?auto_167998 ) ( CLEAR ?auto_168000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168005 ?auto_167997 ?auto_168002 ?auto_167998 )
      ( MAKE-1PILE ?auto_167997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168006 - BLOCK
    )
    :vars
    (
      ?auto_168009 - BLOCK
      ?auto_168010 - BLOCK
      ?auto_168014 - BLOCK
      ?auto_168013 - BLOCK
      ?auto_168011 - BLOCK
      ?auto_168012 - BLOCK
      ?auto_168007 - BLOCK
      ?auto_168008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168006 ?auto_168009 ) ) ( ON-TABLE ?auto_168010 ) ( ON ?auto_168014 ?auto_168010 ) ( ON ?auto_168013 ?auto_168014 ) ( not ( = ?auto_168010 ?auto_168014 ) ) ( not ( = ?auto_168010 ?auto_168013 ) ) ( not ( = ?auto_168010 ?auto_168011 ) ) ( not ( = ?auto_168010 ?auto_168012 ) ) ( not ( = ?auto_168010 ?auto_168007 ) ) ( not ( = ?auto_168010 ?auto_168009 ) ) ( not ( = ?auto_168010 ?auto_168006 ) ) ( not ( = ?auto_168014 ?auto_168013 ) ) ( not ( = ?auto_168014 ?auto_168011 ) ) ( not ( = ?auto_168014 ?auto_168012 ) ) ( not ( = ?auto_168014 ?auto_168007 ) ) ( not ( = ?auto_168014 ?auto_168009 ) ) ( not ( = ?auto_168014 ?auto_168006 ) ) ( not ( = ?auto_168013 ?auto_168011 ) ) ( not ( = ?auto_168013 ?auto_168012 ) ) ( not ( = ?auto_168013 ?auto_168007 ) ) ( not ( = ?auto_168013 ?auto_168009 ) ) ( not ( = ?auto_168013 ?auto_168006 ) ) ( not ( = ?auto_168011 ?auto_168012 ) ) ( not ( = ?auto_168011 ?auto_168007 ) ) ( not ( = ?auto_168011 ?auto_168009 ) ) ( not ( = ?auto_168011 ?auto_168006 ) ) ( not ( = ?auto_168012 ?auto_168007 ) ) ( not ( = ?auto_168012 ?auto_168009 ) ) ( not ( = ?auto_168012 ?auto_168006 ) ) ( not ( = ?auto_168007 ?auto_168009 ) ) ( not ( = ?auto_168007 ?auto_168006 ) ) ( ON ?auto_168006 ?auto_168008 ) ( not ( = ?auto_168006 ?auto_168008 ) ) ( not ( = ?auto_168009 ?auto_168008 ) ) ( not ( = ?auto_168010 ?auto_168008 ) ) ( not ( = ?auto_168014 ?auto_168008 ) ) ( not ( = ?auto_168013 ?auto_168008 ) ) ( not ( = ?auto_168011 ?auto_168008 ) ) ( not ( = ?auto_168012 ?auto_168008 ) ) ( not ( = ?auto_168007 ?auto_168008 ) ) ( ON ?auto_168009 ?auto_168006 ) ( ON-TABLE ?auto_168008 ) ( ON ?auto_168007 ?auto_168009 ) ( ON ?auto_168012 ?auto_168007 ) ( CLEAR ?auto_168012 ) ( HOLDING ?auto_168011 ) ( CLEAR ?auto_168013 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168010 ?auto_168014 ?auto_168013 ?auto_168011 )
      ( MAKE-1PILE ?auto_168006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168015 - BLOCK
    )
    :vars
    (
      ?auto_168022 - BLOCK
      ?auto_168020 - BLOCK
      ?auto_168017 - BLOCK
      ?auto_168023 - BLOCK
      ?auto_168021 - BLOCK
      ?auto_168016 - BLOCK
      ?auto_168019 - BLOCK
      ?auto_168018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168015 ?auto_168022 ) ) ( ON-TABLE ?auto_168020 ) ( ON ?auto_168017 ?auto_168020 ) ( ON ?auto_168023 ?auto_168017 ) ( not ( = ?auto_168020 ?auto_168017 ) ) ( not ( = ?auto_168020 ?auto_168023 ) ) ( not ( = ?auto_168020 ?auto_168021 ) ) ( not ( = ?auto_168020 ?auto_168016 ) ) ( not ( = ?auto_168020 ?auto_168019 ) ) ( not ( = ?auto_168020 ?auto_168022 ) ) ( not ( = ?auto_168020 ?auto_168015 ) ) ( not ( = ?auto_168017 ?auto_168023 ) ) ( not ( = ?auto_168017 ?auto_168021 ) ) ( not ( = ?auto_168017 ?auto_168016 ) ) ( not ( = ?auto_168017 ?auto_168019 ) ) ( not ( = ?auto_168017 ?auto_168022 ) ) ( not ( = ?auto_168017 ?auto_168015 ) ) ( not ( = ?auto_168023 ?auto_168021 ) ) ( not ( = ?auto_168023 ?auto_168016 ) ) ( not ( = ?auto_168023 ?auto_168019 ) ) ( not ( = ?auto_168023 ?auto_168022 ) ) ( not ( = ?auto_168023 ?auto_168015 ) ) ( not ( = ?auto_168021 ?auto_168016 ) ) ( not ( = ?auto_168021 ?auto_168019 ) ) ( not ( = ?auto_168021 ?auto_168022 ) ) ( not ( = ?auto_168021 ?auto_168015 ) ) ( not ( = ?auto_168016 ?auto_168019 ) ) ( not ( = ?auto_168016 ?auto_168022 ) ) ( not ( = ?auto_168016 ?auto_168015 ) ) ( not ( = ?auto_168019 ?auto_168022 ) ) ( not ( = ?auto_168019 ?auto_168015 ) ) ( ON ?auto_168015 ?auto_168018 ) ( not ( = ?auto_168015 ?auto_168018 ) ) ( not ( = ?auto_168022 ?auto_168018 ) ) ( not ( = ?auto_168020 ?auto_168018 ) ) ( not ( = ?auto_168017 ?auto_168018 ) ) ( not ( = ?auto_168023 ?auto_168018 ) ) ( not ( = ?auto_168021 ?auto_168018 ) ) ( not ( = ?auto_168016 ?auto_168018 ) ) ( not ( = ?auto_168019 ?auto_168018 ) ) ( ON ?auto_168022 ?auto_168015 ) ( ON-TABLE ?auto_168018 ) ( ON ?auto_168019 ?auto_168022 ) ( ON ?auto_168016 ?auto_168019 ) ( CLEAR ?auto_168023 ) ( ON ?auto_168021 ?auto_168016 ) ( CLEAR ?auto_168021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168018 ?auto_168015 ?auto_168022 ?auto_168019 ?auto_168016 )
      ( MAKE-1PILE ?auto_168015 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168024 - BLOCK
    )
    :vars
    (
      ?auto_168026 - BLOCK
      ?auto_168029 - BLOCK
      ?auto_168030 - BLOCK
      ?auto_168031 - BLOCK
      ?auto_168028 - BLOCK
      ?auto_168025 - BLOCK
      ?auto_168032 - BLOCK
      ?auto_168027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168024 ?auto_168026 ) ) ( ON-TABLE ?auto_168029 ) ( ON ?auto_168030 ?auto_168029 ) ( not ( = ?auto_168029 ?auto_168030 ) ) ( not ( = ?auto_168029 ?auto_168031 ) ) ( not ( = ?auto_168029 ?auto_168028 ) ) ( not ( = ?auto_168029 ?auto_168025 ) ) ( not ( = ?auto_168029 ?auto_168032 ) ) ( not ( = ?auto_168029 ?auto_168026 ) ) ( not ( = ?auto_168029 ?auto_168024 ) ) ( not ( = ?auto_168030 ?auto_168031 ) ) ( not ( = ?auto_168030 ?auto_168028 ) ) ( not ( = ?auto_168030 ?auto_168025 ) ) ( not ( = ?auto_168030 ?auto_168032 ) ) ( not ( = ?auto_168030 ?auto_168026 ) ) ( not ( = ?auto_168030 ?auto_168024 ) ) ( not ( = ?auto_168031 ?auto_168028 ) ) ( not ( = ?auto_168031 ?auto_168025 ) ) ( not ( = ?auto_168031 ?auto_168032 ) ) ( not ( = ?auto_168031 ?auto_168026 ) ) ( not ( = ?auto_168031 ?auto_168024 ) ) ( not ( = ?auto_168028 ?auto_168025 ) ) ( not ( = ?auto_168028 ?auto_168032 ) ) ( not ( = ?auto_168028 ?auto_168026 ) ) ( not ( = ?auto_168028 ?auto_168024 ) ) ( not ( = ?auto_168025 ?auto_168032 ) ) ( not ( = ?auto_168025 ?auto_168026 ) ) ( not ( = ?auto_168025 ?auto_168024 ) ) ( not ( = ?auto_168032 ?auto_168026 ) ) ( not ( = ?auto_168032 ?auto_168024 ) ) ( ON ?auto_168024 ?auto_168027 ) ( not ( = ?auto_168024 ?auto_168027 ) ) ( not ( = ?auto_168026 ?auto_168027 ) ) ( not ( = ?auto_168029 ?auto_168027 ) ) ( not ( = ?auto_168030 ?auto_168027 ) ) ( not ( = ?auto_168031 ?auto_168027 ) ) ( not ( = ?auto_168028 ?auto_168027 ) ) ( not ( = ?auto_168025 ?auto_168027 ) ) ( not ( = ?auto_168032 ?auto_168027 ) ) ( ON ?auto_168026 ?auto_168024 ) ( ON-TABLE ?auto_168027 ) ( ON ?auto_168032 ?auto_168026 ) ( ON ?auto_168025 ?auto_168032 ) ( ON ?auto_168028 ?auto_168025 ) ( CLEAR ?auto_168028 ) ( HOLDING ?auto_168031 ) ( CLEAR ?auto_168030 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168029 ?auto_168030 ?auto_168031 )
      ( MAKE-1PILE ?auto_168024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168033 - BLOCK
    )
    :vars
    (
      ?auto_168038 - BLOCK
      ?auto_168036 - BLOCK
      ?auto_168039 - BLOCK
      ?auto_168041 - BLOCK
      ?auto_168040 - BLOCK
      ?auto_168034 - BLOCK
      ?auto_168035 - BLOCK
      ?auto_168037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168033 ?auto_168038 ) ) ( ON-TABLE ?auto_168036 ) ( ON ?auto_168039 ?auto_168036 ) ( not ( = ?auto_168036 ?auto_168039 ) ) ( not ( = ?auto_168036 ?auto_168041 ) ) ( not ( = ?auto_168036 ?auto_168040 ) ) ( not ( = ?auto_168036 ?auto_168034 ) ) ( not ( = ?auto_168036 ?auto_168035 ) ) ( not ( = ?auto_168036 ?auto_168038 ) ) ( not ( = ?auto_168036 ?auto_168033 ) ) ( not ( = ?auto_168039 ?auto_168041 ) ) ( not ( = ?auto_168039 ?auto_168040 ) ) ( not ( = ?auto_168039 ?auto_168034 ) ) ( not ( = ?auto_168039 ?auto_168035 ) ) ( not ( = ?auto_168039 ?auto_168038 ) ) ( not ( = ?auto_168039 ?auto_168033 ) ) ( not ( = ?auto_168041 ?auto_168040 ) ) ( not ( = ?auto_168041 ?auto_168034 ) ) ( not ( = ?auto_168041 ?auto_168035 ) ) ( not ( = ?auto_168041 ?auto_168038 ) ) ( not ( = ?auto_168041 ?auto_168033 ) ) ( not ( = ?auto_168040 ?auto_168034 ) ) ( not ( = ?auto_168040 ?auto_168035 ) ) ( not ( = ?auto_168040 ?auto_168038 ) ) ( not ( = ?auto_168040 ?auto_168033 ) ) ( not ( = ?auto_168034 ?auto_168035 ) ) ( not ( = ?auto_168034 ?auto_168038 ) ) ( not ( = ?auto_168034 ?auto_168033 ) ) ( not ( = ?auto_168035 ?auto_168038 ) ) ( not ( = ?auto_168035 ?auto_168033 ) ) ( ON ?auto_168033 ?auto_168037 ) ( not ( = ?auto_168033 ?auto_168037 ) ) ( not ( = ?auto_168038 ?auto_168037 ) ) ( not ( = ?auto_168036 ?auto_168037 ) ) ( not ( = ?auto_168039 ?auto_168037 ) ) ( not ( = ?auto_168041 ?auto_168037 ) ) ( not ( = ?auto_168040 ?auto_168037 ) ) ( not ( = ?auto_168034 ?auto_168037 ) ) ( not ( = ?auto_168035 ?auto_168037 ) ) ( ON ?auto_168038 ?auto_168033 ) ( ON-TABLE ?auto_168037 ) ( ON ?auto_168035 ?auto_168038 ) ( ON ?auto_168034 ?auto_168035 ) ( ON ?auto_168040 ?auto_168034 ) ( CLEAR ?auto_168039 ) ( ON ?auto_168041 ?auto_168040 ) ( CLEAR ?auto_168041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168037 ?auto_168033 ?auto_168038 ?auto_168035 ?auto_168034 ?auto_168040 )
      ( MAKE-1PILE ?auto_168033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168042 - BLOCK
    )
    :vars
    (
      ?auto_168050 - BLOCK
      ?auto_168045 - BLOCK
      ?auto_168048 - BLOCK
      ?auto_168046 - BLOCK
      ?auto_168043 - BLOCK
      ?auto_168049 - BLOCK
      ?auto_168044 - BLOCK
      ?auto_168047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168042 ?auto_168050 ) ) ( ON-TABLE ?auto_168045 ) ( not ( = ?auto_168045 ?auto_168048 ) ) ( not ( = ?auto_168045 ?auto_168046 ) ) ( not ( = ?auto_168045 ?auto_168043 ) ) ( not ( = ?auto_168045 ?auto_168049 ) ) ( not ( = ?auto_168045 ?auto_168044 ) ) ( not ( = ?auto_168045 ?auto_168050 ) ) ( not ( = ?auto_168045 ?auto_168042 ) ) ( not ( = ?auto_168048 ?auto_168046 ) ) ( not ( = ?auto_168048 ?auto_168043 ) ) ( not ( = ?auto_168048 ?auto_168049 ) ) ( not ( = ?auto_168048 ?auto_168044 ) ) ( not ( = ?auto_168048 ?auto_168050 ) ) ( not ( = ?auto_168048 ?auto_168042 ) ) ( not ( = ?auto_168046 ?auto_168043 ) ) ( not ( = ?auto_168046 ?auto_168049 ) ) ( not ( = ?auto_168046 ?auto_168044 ) ) ( not ( = ?auto_168046 ?auto_168050 ) ) ( not ( = ?auto_168046 ?auto_168042 ) ) ( not ( = ?auto_168043 ?auto_168049 ) ) ( not ( = ?auto_168043 ?auto_168044 ) ) ( not ( = ?auto_168043 ?auto_168050 ) ) ( not ( = ?auto_168043 ?auto_168042 ) ) ( not ( = ?auto_168049 ?auto_168044 ) ) ( not ( = ?auto_168049 ?auto_168050 ) ) ( not ( = ?auto_168049 ?auto_168042 ) ) ( not ( = ?auto_168044 ?auto_168050 ) ) ( not ( = ?auto_168044 ?auto_168042 ) ) ( ON ?auto_168042 ?auto_168047 ) ( not ( = ?auto_168042 ?auto_168047 ) ) ( not ( = ?auto_168050 ?auto_168047 ) ) ( not ( = ?auto_168045 ?auto_168047 ) ) ( not ( = ?auto_168048 ?auto_168047 ) ) ( not ( = ?auto_168046 ?auto_168047 ) ) ( not ( = ?auto_168043 ?auto_168047 ) ) ( not ( = ?auto_168049 ?auto_168047 ) ) ( not ( = ?auto_168044 ?auto_168047 ) ) ( ON ?auto_168050 ?auto_168042 ) ( ON-TABLE ?auto_168047 ) ( ON ?auto_168044 ?auto_168050 ) ( ON ?auto_168049 ?auto_168044 ) ( ON ?auto_168043 ?auto_168049 ) ( ON ?auto_168046 ?auto_168043 ) ( CLEAR ?auto_168046 ) ( HOLDING ?auto_168048 ) ( CLEAR ?auto_168045 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168045 ?auto_168048 )
      ( MAKE-1PILE ?auto_168042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168051 - BLOCK
    )
    :vars
    (
      ?auto_168058 - BLOCK
      ?auto_168053 - BLOCK
      ?auto_168057 - BLOCK
      ?auto_168059 - BLOCK
      ?auto_168056 - BLOCK
      ?auto_168054 - BLOCK
      ?auto_168055 - BLOCK
      ?auto_168052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168051 ?auto_168058 ) ) ( ON-TABLE ?auto_168053 ) ( not ( = ?auto_168053 ?auto_168057 ) ) ( not ( = ?auto_168053 ?auto_168059 ) ) ( not ( = ?auto_168053 ?auto_168056 ) ) ( not ( = ?auto_168053 ?auto_168054 ) ) ( not ( = ?auto_168053 ?auto_168055 ) ) ( not ( = ?auto_168053 ?auto_168058 ) ) ( not ( = ?auto_168053 ?auto_168051 ) ) ( not ( = ?auto_168057 ?auto_168059 ) ) ( not ( = ?auto_168057 ?auto_168056 ) ) ( not ( = ?auto_168057 ?auto_168054 ) ) ( not ( = ?auto_168057 ?auto_168055 ) ) ( not ( = ?auto_168057 ?auto_168058 ) ) ( not ( = ?auto_168057 ?auto_168051 ) ) ( not ( = ?auto_168059 ?auto_168056 ) ) ( not ( = ?auto_168059 ?auto_168054 ) ) ( not ( = ?auto_168059 ?auto_168055 ) ) ( not ( = ?auto_168059 ?auto_168058 ) ) ( not ( = ?auto_168059 ?auto_168051 ) ) ( not ( = ?auto_168056 ?auto_168054 ) ) ( not ( = ?auto_168056 ?auto_168055 ) ) ( not ( = ?auto_168056 ?auto_168058 ) ) ( not ( = ?auto_168056 ?auto_168051 ) ) ( not ( = ?auto_168054 ?auto_168055 ) ) ( not ( = ?auto_168054 ?auto_168058 ) ) ( not ( = ?auto_168054 ?auto_168051 ) ) ( not ( = ?auto_168055 ?auto_168058 ) ) ( not ( = ?auto_168055 ?auto_168051 ) ) ( ON ?auto_168051 ?auto_168052 ) ( not ( = ?auto_168051 ?auto_168052 ) ) ( not ( = ?auto_168058 ?auto_168052 ) ) ( not ( = ?auto_168053 ?auto_168052 ) ) ( not ( = ?auto_168057 ?auto_168052 ) ) ( not ( = ?auto_168059 ?auto_168052 ) ) ( not ( = ?auto_168056 ?auto_168052 ) ) ( not ( = ?auto_168054 ?auto_168052 ) ) ( not ( = ?auto_168055 ?auto_168052 ) ) ( ON ?auto_168058 ?auto_168051 ) ( ON-TABLE ?auto_168052 ) ( ON ?auto_168055 ?auto_168058 ) ( ON ?auto_168054 ?auto_168055 ) ( ON ?auto_168056 ?auto_168054 ) ( ON ?auto_168059 ?auto_168056 ) ( CLEAR ?auto_168053 ) ( ON ?auto_168057 ?auto_168059 ) ( CLEAR ?auto_168057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168052 ?auto_168051 ?auto_168058 ?auto_168055 ?auto_168054 ?auto_168056 ?auto_168059 )
      ( MAKE-1PILE ?auto_168051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168060 - BLOCK
    )
    :vars
    (
      ?auto_168066 - BLOCK
      ?auto_168067 - BLOCK
      ?auto_168068 - BLOCK
      ?auto_168065 - BLOCK
      ?auto_168062 - BLOCK
      ?auto_168063 - BLOCK
      ?auto_168064 - BLOCK
      ?auto_168061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168060 ?auto_168066 ) ) ( not ( = ?auto_168067 ?auto_168068 ) ) ( not ( = ?auto_168067 ?auto_168065 ) ) ( not ( = ?auto_168067 ?auto_168062 ) ) ( not ( = ?auto_168067 ?auto_168063 ) ) ( not ( = ?auto_168067 ?auto_168064 ) ) ( not ( = ?auto_168067 ?auto_168066 ) ) ( not ( = ?auto_168067 ?auto_168060 ) ) ( not ( = ?auto_168068 ?auto_168065 ) ) ( not ( = ?auto_168068 ?auto_168062 ) ) ( not ( = ?auto_168068 ?auto_168063 ) ) ( not ( = ?auto_168068 ?auto_168064 ) ) ( not ( = ?auto_168068 ?auto_168066 ) ) ( not ( = ?auto_168068 ?auto_168060 ) ) ( not ( = ?auto_168065 ?auto_168062 ) ) ( not ( = ?auto_168065 ?auto_168063 ) ) ( not ( = ?auto_168065 ?auto_168064 ) ) ( not ( = ?auto_168065 ?auto_168066 ) ) ( not ( = ?auto_168065 ?auto_168060 ) ) ( not ( = ?auto_168062 ?auto_168063 ) ) ( not ( = ?auto_168062 ?auto_168064 ) ) ( not ( = ?auto_168062 ?auto_168066 ) ) ( not ( = ?auto_168062 ?auto_168060 ) ) ( not ( = ?auto_168063 ?auto_168064 ) ) ( not ( = ?auto_168063 ?auto_168066 ) ) ( not ( = ?auto_168063 ?auto_168060 ) ) ( not ( = ?auto_168064 ?auto_168066 ) ) ( not ( = ?auto_168064 ?auto_168060 ) ) ( ON ?auto_168060 ?auto_168061 ) ( not ( = ?auto_168060 ?auto_168061 ) ) ( not ( = ?auto_168066 ?auto_168061 ) ) ( not ( = ?auto_168067 ?auto_168061 ) ) ( not ( = ?auto_168068 ?auto_168061 ) ) ( not ( = ?auto_168065 ?auto_168061 ) ) ( not ( = ?auto_168062 ?auto_168061 ) ) ( not ( = ?auto_168063 ?auto_168061 ) ) ( not ( = ?auto_168064 ?auto_168061 ) ) ( ON ?auto_168066 ?auto_168060 ) ( ON-TABLE ?auto_168061 ) ( ON ?auto_168064 ?auto_168066 ) ( ON ?auto_168063 ?auto_168064 ) ( ON ?auto_168062 ?auto_168063 ) ( ON ?auto_168065 ?auto_168062 ) ( ON ?auto_168068 ?auto_168065 ) ( CLEAR ?auto_168068 ) ( HOLDING ?auto_168067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168067 )
      ( MAKE-1PILE ?auto_168060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168069 - BLOCK
    )
    :vars
    (
      ?auto_168074 - BLOCK
      ?auto_168072 - BLOCK
      ?auto_168075 - BLOCK
      ?auto_168077 - BLOCK
      ?auto_168076 - BLOCK
      ?auto_168073 - BLOCK
      ?auto_168071 - BLOCK
      ?auto_168070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168069 ?auto_168074 ) ) ( not ( = ?auto_168072 ?auto_168075 ) ) ( not ( = ?auto_168072 ?auto_168077 ) ) ( not ( = ?auto_168072 ?auto_168076 ) ) ( not ( = ?auto_168072 ?auto_168073 ) ) ( not ( = ?auto_168072 ?auto_168071 ) ) ( not ( = ?auto_168072 ?auto_168074 ) ) ( not ( = ?auto_168072 ?auto_168069 ) ) ( not ( = ?auto_168075 ?auto_168077 ) ) ( not ( = ?auto_168075 ?auto_168076 ) ) ( not ( = ?auto_168075 ?auto_168073 ) ) ( not ( = ?auto_168075 ?auto_168071 ) ) ( not ( = ?auto_168075 ?auto_168074 ) ) ( not ( = ?auto_168075 ?auto_168069 ) ) ( not ( = ?auto_168077 ?auto_168076 ) ) ( not ( = ?auto_168077 ?auto_168073 ) ) ( not ( = ?auto_168077 ?auto_168071 ) ) ( not ( = ?auto_168077 ?auto_168074 ) ) ( not ( = ?auto_168077 ?auto_168069 ) ) ( not ( = ?auto_168076 ?auto_168073 ) ) ( not ( = ?auto_168076 ?auto_168071 ) ) ( not ( = ?auto_168076 ?auto_168074 ) ) ( not ( = ?auto_168076 ?auto_168069 ) ) ( not ( = ?auto_168073 ?auto_168071 ) ) ( not ( = ?auto_168073 ?auto_168074 ) ) ( not ( = ?auto_168073 ?auto_168069 ) ) ( not ( = ?auto_168071 ?auto_168074 ) ) ( not ( = ?auto_168071 ?auto_168069 ) ) ( ON ?auto_168069 ?auto_168070 ) ( not ( = ?auto_168069 ?auto_168070 ) ) ( not ( = ?auto_168074 ?auto_168070 ) ) ( not ( = ?auto_168072 ?auto_168070 ) ) ( not ( = ?auto_168075 ?auto_168070 ) ) ( not ( = ?auto_168077 ?auto_168070 ) ) ( not ( = ?auto_168076 ?auto_168070 ) ) ( not ( = ?auto_168073 ?auto_168070 ) ) ( not ( = ?auto_168071 ?auto_168070 ) ) ( ON ?auto_168074 ?auto_168069 ) ( ON-TABLE ?auto_168070 ) ( ON ?auto_168071 ?auto_168074 ) ( ON ?auto_168073 ?auto_168071 ) ( ON ?auto_168076 ?auto_168073 ) ( ON ?auto_168077 ?auto_168076 ) ( ON ?auto_168075 ?auto_168077 ) ( ON ?auto_168072 ?auto_168075 ) ( CLEAR ?auto_168072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168070 ?auto_168069 ?auto_168074 ?auto_168071 ?auto_168073 ?auto_168076 ?auto_168077 ?auto_168075 )
      ( MAKE-1PILE ?auto_168069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168084 - BLOCK
      ?auto_168085 - BLOCK
      ?auto_168086 - BLOCK
      ?auto_168087 - BLOCK
      ?auto_168088 - BLOCK
      ?auto_168089 - BLOCK
    )
    :vars
    (
      ?auto_168090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168090 ?auto_168089 ) ( CLEAR ?auto_168090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168084 ) ( ON ?auto_168085 ?auto_168084 ) ( ON ?auto_168086 ?auto_168085 ) ( ON ?auto_168087 ?auto_168086 ) ( ON ?auto_168088 ?auto_168087 ) ( ON ?auto_168089 ?auto_168088 ) ( not ( = ?auto_168084 ?auto_168085 ) ) ( not ( = ?auto_168084 ?auto_168086 ) ) ( not ( = ?auto_168084 ?auto_168087 ) ) ( not ( = ?auto_168084 ?auto_168088 ) ) ( not ( = ?auto_168084 ?auto_168089 ) ) ( not ( = ?auto_168084 ?auto_168090 ) ) ( not ( = ?auto_168085 ?auto_168086 ) ) ( not ( = ?auto_168085 ?auto_168087 ) ) ( not ( = ?auto_168085 ?auto_168088 ) ) ( not ( = ?auto_168085 ?auto_168089 ) ) ( not ( = ?auto_168085 ?auto_168090 ) ) ( not ( = ?auto_168086 ?auto_168087 ) ) ( not ( = ?auto_168086 ?auto_168088 ) ) ( not ( = ?auto_168086 ?auto_168089 ) ) ( not ( = ?auto_168086 ?auto_168090 ) ) ( not ( = ?auto_168087 ?auto_168088 ) ) ( not ( = ?auto_168087 ?auto_168089 ) ) ( not ( = ?auto_168087 ?auto_168090 ) ) ( not ( = ?auto_168088 ?auto_168089 ) ) ( not ( = ?auto_168088 ?auto_168090 ) ) ( not ( = ?auto_168089 ?auto_168090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168090 ?auto_168089 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168091 - BLOCK
      ?auto_168092 - BLOCK
      ?auto_168093 - BLOCK
      ?auto_168094 - BLOCK
      ?auto_168095 - BLOCK
      ?auto_168096 - BLOCK
    )
    :vars
    (
      ?auto_168097 - BLOCK
      ?auto_168098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168097 ?auto_168096 ) ( CLEAR ?auto_168097 ) ( ON-TABLE ?auto_168091 ) ( ON ?auto_168092 ?auto_168091 ) ( ON ?auto_168093 ?auto_168092 ) ( ON ?auto_168094 ?auto_168093 ) ( ON ?auto_168095 ?auto_168094 ) ( ON ?auto_168096 ?auto_168095 ) ( not ( = ?auto_168091 ?auto_168092 ) ) ( not ( = ?auto_168091 ?auto_168093 ) ) ( not ( = ?auto_168091 ?auto_168094 ) ) ( not ( = ?auto_168091 ?auto_168095 ) ) ( not ( = ?auto_168091 ?auto_168096 ) ) ( not ( = ?auto_168091 ?auto_168097 ) ) ( not ( = ?auto_168092 ?auto_168093 ) ) ( not ( = ?auto_168092 ?auto_168094 ) ) ( not ( = ?auto_168092 ?auto_168095 ) ) ( not ( = ?auto_168092 ?auto_168096 ) ) ( not ( = ?auto_168092 ?auto_168097 ) ) ( not ( = ?auto_168093 ?auto_168094 ) ) ( not ( = ?auto_168093 ?auto_168095 ) ) ( not ( = ?auto_168093 ?auto_168096 ) ) ( not ( = ?auto_168093 ?auto_168097 ) ) ( not ( = ?auto_168094 ?auto_168095 ) ) ( not ( = ?auto_168094 ?auto_168096 ) ) ( not ( = ?auto_168094 ?auto_168097 ) ) ( not ( = ?auto_168095 ?auto_168096 ) ) ( not ( = ?auto_168095 ?auto_168097 ) ) ( not ( = ?auto_168096 ?auto_168097 ) ) ( HOLDING ?auto_168098 ) ( not ( = ?auto_168091 ?auto_168098 ) ) ( not ( = ?auto_168092 ?auto_168098 ) ) ( not ( = ?auto_168093 ?auto_168098 ) ) ( not ( = ?auto_168094 ?auto_168098 ) ) ( not ( = ?auto_168095 ?auto_168098 ) ) ( not ( = ?auto_168096 ?auto_168098 ) ) ( not ( = ?auto_168097 ?auto_168098 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_168098 )
      ( MAKE-6PILE ?auto_168091 ?auto_168092 ?auto_168093 ?auto_168094 ?auto_168095 ?auto_168096 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168099 - BLOCK
      ?auto_168100 - BLOCK
      ?auto_168101 - BLOCK
      ?auto_168102 - BLOCK
      ?auto_168103 - BLOCK
      ?auto_168104 - BLOCK
    )
    :vars
    (
      ?auto_168106 - BLOCK
      ?auto_168105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168106 ?auto_168104 ) ( ON-TABLE ?auto_168099 ) ( ON ?auto_168100 ?auto_168099 ) ( ON ?auto_168101 ?auto_168100 ) ( ON ?auto_168102 ?auto_168101 ) ( ON ?auto_168103 ?auto_168102 ) ( ON ?auto_168104 ?auto_168103 ) ( not ( = ?auto_168099 ?auto_168100 ) ) ( not ( = ?auto_168099 ?auto_168101 ) ) ( not ( = ?auto_168099 ?auto_168102 ) ) ( not ( = ?auto_168099 ?auto_168103 ) ) ( not ( = ?auto_168099 ?auto_168104 ) ) ( not ( = ?auto_168099 ?auto_168106 ) ) ( not ( = ?auto_168100 ?auto_168101 ) ) ( not ( = ?auto_168100 ?auto_168102 ) ) ( not ( = ?auto_168100 ?auto_168103 ) ) ( not ( = ?auto_168100 ?auto_168104 ) ) ( not ( = ?auto_168100 ?auto_168106 ) ) ( not ( = ?auto_168101 ?auto_168102 ) ) ( not ( = ?auto_168101 ?auto_168103 ) ) ( not ( = ?auto_168101 ?auto_168104 ) ) ( not ( = ?auto_168101 ?auto_168106 ) ) ( not ( = ?auto_168102 ?auto_168103 ) ) ( not ( = ?auto_168102 ?auto_168104 ) ) ( not ( = ?auto_168102 ?auto_168106 ) ) ( not ( = ?auto_168103 ?auto_168104 ) ) ( not ( = ?auto_168103 ?auto_168106 ) ) ( not ( = ?auto_168104 ?auto_168106 ) ) ( not ( = ?auto_168099 ?auto_168105 ) ) ( not ( = ?auto_168100 ?auto_168105 ) ) ( not ( = ?auto_168101 ?auto_168105 ) ) ( not ( = ?auto_168102 ?auto_168105 ) ) ( not ( = ?auto_168103 ?auto_168105 ) ) ( not ( = ?auto_168104 ?auto_168105 ) ) ( not ( = ?auto_168106 ?auto_168105 ) ) ( ON ?auto_168105 ?auto_168106 ) ( CLEAR ?auto_168105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168099 ?auto_168100 ?auto_168101 ?auto_168102 ?auto_168103 ?auto_168104 ?auto_168106 )
      ( MAKE-6PILE ?auto_168099 ?auto_168100 ?auto_168101 ?auto_168102 ?auto_168103 ?auto_168104 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168107 - BLOCK
      ?auto_168108 - BLOCK
      ?auto_168109 - BLOCK
      ?auto_168110 - BLOCK
      ?auto_168111 - BLOCK
      ?auto_168112 - BLOCK
    )
    :vars
    (
      ?auto_168113 - BLOCK
      ?auto_168114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168113 ?auto_168112 ) ( ON-TABLE ?auto_168107 ) ( ON ?auto_168108 ?auto_168107 ) ( ON ?auto_168109 ?auto_168108 ) ( ON ?auto_168110 ?auto_168109 ) ( ON ?auto_168111 ?auto_168110 ) ( ON ?auto_168112 ?auto_168111 ) ( not ( = ?auto_168107 ?auto_168108 ) ) ( not ( = ?auto_168107 ?auto_168109 ) ) ( not ( = ?auto_168107 ?auto_168110 ) ) ( not ( = ?auto_168107 ?auto_168111 ) ) ( not ( = ?auto_168107 ?auto_168112 ) ) ( not ( = ?auto_168107 ?auto_168113 ) ) ( not ( = ?auto_168108 ?auto_168109 ) ) ( not ( = ?auto_168108 ?auto_168110 ) ) ( not ( = ?auto_168108 ?auto_168111 ) ) ( not ( = ?auto_168108 ?auto_168112 ) ) ( not ( = ?auto_168108 ?auto_168113 ) ) ( not ( = ?auto_168109 ?auto_168110 ) ) ( not ( = ?auto_168109 ?auto_168111 ) ) ( not ( = ?auto_168109 ?auto_168112 ) ) ( not ( = ?auto_168109 ?auto_168113 ) ) ( not ( = ?auto_168110 ?auto_168111 ) ) ( not ( = ?auto_168110 ?auto_168112 ) ) ( not ( = ?auto_168110 ?auto_168113 ) ) ( not ( = ?auto_168111 ?auto_168112 ) ) ( not ( = ?auto_168111 ?auto_168113 ) ) ( not ( = ?auto_168112 ?auto_168113 ) ) ( not ( = ?auto_168107 ?auto_168114 ) ) ( not ( = ?auto_168108 ?auto_168114 ) ) ( not ( = ?auto_168109 ?auto_168114 ) ) ( not ( = ?auto_168110 ?auto_168114 ) ) ( not ( = ?auto_168111 ?auto_168114 ) ) ( not ( = ?auto_168112 ?auto_168114 ) ) ( not ( = ?auto_168113 ?auto_168114 ) ) ( HOLDING ?auto_168114 ) ( CLEAR ?auto_168113 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168107 ?auto_168108 ?auto_168109 ?auto_168110 ?auto_168111 ?auto_168112 ?auto_168113 ?auto_168114 )
      ( MAKE-6PILE ?auto_168107 ?auto_168108 ?auto_168109 ?auto_168110 ?auto_168111 ?auto_168112 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168115 - BLOCK
      ?auto_168116 - BLOCK
      ?auto_168117 - BLOCK
      ?auto_168118 - BLOCK
      ?auto_168119 - BLOCK
      ?auto_168120 - BLOCK
    )
    :vars
    (
      ?auto_168121 - BLOCK
      ?auto_168122 - BLOCK
      ?auto_168123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168121 ?auto_168120 ) ( ON-TABLE ?auto_168115 ) ( ON ?auto_168116 ?auto_168115 ) ( ON ?auto_168117 ?auto_168116 ) ( ON ?auto_168118 ?auto_168117 ) ( ON ?auto_168119 ?auto_168118 ) ( ON ?auto_168120 ?auto_168119 ) ( not ( = ?auto_168115 ?auto_168116 ) ) ( not ( = ?auto_168115 ?auto_168117 ) ) ( not ( = ?auto_168115 ?auto_168118 ) ) ( not ( = ?auto_168115 ?auto_168119 ) ) ( not ( = ?auto_168115 ?auto_168120 ) ) ( not ( = ?auto_168115 ?auto_168121 ) ) ( not ( = ?auto_168116 ?auto_168117 ) ) ( not ( = ?auto_168116 ?auto_168118 ) ) ( not ( = ?auto_168116 ?auto_168119 ) ) ( not ( = ?auto_168116 ?auto_168120 ) ) ( not ( = ?auto_168116 ?auto_168121 ) ) ( not ( = ?auto_168117 ?auto_168118 ) ) ( not ( = ?auto_168117 ?auto_168119 ) ) ( not ( = ?auto_168117 ?auto_168120 ) ) ( not ( = ?auto_168117 ?auto_168121 ) ) ( not ( = ?auto_168118 ?auto_168119 ) ) ( not ( = ?auto_168118 ?auto_168120 ) ) ( not ( = ?auto_168118 ?auto_168121 ) ) ( not ( = ?auto_168119 ?auto_168120 ) ) ( not ( = ?auto_168119 ?auto_168121 ) ) ( not ( = ?auto_168120 ?auto_168121 ) ) ( not ( = ?auto_168115 ?auto_168122 ) ) ( not ( = ?auto_168116 ?auto_168122 ) ) ( not ( = ?auto_168117 ?auto_168122 ) ) ( not ( = ?auto_168118 ?auto_168122 ) ) ( not ( = ?auto_168119 ?auto_168122 ) ) ( not ( = ?auto_168120 ?auto_168122 ) ) ( not ( = ?auto_168121 ?auto_168122 ) ) ( CLEAR ?auto_168121 ) ( ON ?auto_168122 ?auto_168123 ) ( CLEAR ?auto_168122 ) ( HAND-EMPTY ) ( not ( = ?auto_168115 ?auto_168123 ) ) ( not ( = ?auto_168116 ?auto_168123 ) ) ( not ( = ?auto_168117 ?auto_168123 ) ) ( not ( = ?auto_168118 ?auto_168123 ) ) ( not ( = ?auto_168119 ?auto_168123 ) ) ( not ( = ?auto_168120 ?auto_168123 ) ) ( not ( = ?auto_168121 ?auto_168123 ) ) ( not ( = ?auto_168122 ?auto_168123 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168122 ?auto_168123 )
      ( MAKE-6PILE ?auto_168115 ?auto_168116 ?auto_168117 ?auto_168118 ?auto_168119 ?auto_168120 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168142 - BLOCK
      ?auto_168143 - BLOCK
      ?auto_168144 - BLOCK
      ?auto_168145 - BLOCK
      ?auto_168146 - BLOCK
      ?auto_168147 - BLOCK
    )
    :vars
    (
      ?auto_168149 - BLOCK
      ?auto_168148 - BLOCK
      ?auto_168150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168142 ) ( ON ?auto_168143 ?auto_168142 ) ( ON ?auto_168144 ?auto_168143 ) ( ON ?auto_168145 ?auto_168144 ) ( ON ?auto_168146 ?auto_168145 ) ( not ( = ?auto_168142 ?auto_168143 ) ) ( not ( = ?auto_168142 ?auto_168144 ) ) ( not ( = ?auto_168142 ?auto_168145 ) ) ( not ( = ?auto_168142 ?auto_168146 ) ) ( not ( = ?auto_168142 ?auto_168147 ) ) ( not ( = ?auto_168142 ?auto_168149 ) ) ( not ( = ?auto_168143 ?auto_168144 ) ) ( not ( = ?auto_168143 ?auto_168145 ) ) ( not ( = ?auto_168143 ?auto_168146 ) ) ( not ( = ?auto_168143 ?auto_168147 ) ) ( not ( = ?auto_168143 ?auto_168149 ) ) ( not ( = ?auto_168144 ?auto_168145 ) ) ( not ( = ?auto_168144 ?auto_168146 ) ) ( not ( = ?auto_168144 ?auto_168147 ) ) ( not ( = ?auto_168144 ?auto_168149 ) ) ( not ( = ?auto_168145 ?auto_168146 ) ) ( not ( = ?auto_168145 ?auto_168147 ) ) ( not ( = ?auto_168145 ?auto_168149 ) ) ( not ( = ?auto_168146 ?auto_168147 ) ) ( not ( = ?auto_168146 ?auto_168149 ) ) ( not ( = ?auto_168147 ?auto_168149 ) ) ( not ( = ?auto_168142 ?auto_168148 ) ) ( not ( = ?auto_168143 ?auto_168148 ) ) ( not ( = ?auto_168144 ?auto_168148 ) ) ( not ( = ?auto_168145 ?auto_168148 ) ) ( not ( = ?auto_168146 ?auto_168148 ) ) ( not ( = ?auto_168147 ?auto_168148 ) ) ( not ( = ?auto_168149 ?auto_168148 ) ) ( ON ?auto_168148 ?auto_168150 ) ( not ( = ?auto_168142 ?auto_168150 ) ) ( not ( = ?auto_168143 ?auto_168150 ) ) ( not ( = ?auto_168144 ?auto_168150 ) ) ( not ( = ?auto_168145 ?auto_168150 ) ) ( not ( = ?auto_168146 ?auto_168150 ) ) ( not ( = ?auto_168147 ?auto_168150 ) ) ( not ( = ?auto_168149 ?auto_168150 ) ) ( not ( = ?auto_168148 ?auto_168150 ) ) ( ON ?auto_168149 ?auto_168148 ) ( CLEAR ?auto_168149 ) ( HOLDING ?auto_168147 ) ( CLEAR ?auto_168146 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168142 ?auto_168143 ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168147 ?auto_168149 )
      ( MAKE-6PILE ?auto_168142 ?auto_168143 ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168151 - BLOCK
      ?auto_168152 - BLOCK
      ?auto_168153 - BLOCK
      ?auto_168154 - BLOCK
      ?auto_168155 - BLOCK
      ?auto_168156 - BLOCK
    )
    :vars
    (
      ?auto_168158 - BLOCK
      ?auto_168157 - BLOCK
      ?auto_168159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168151 ) ( ON ?auto_168152 ?auto_168151 ) ( ON ?auto_168153 ?auto_168152 ) ( ON ?auto_168154 ?auto_168153 ) ( ON ?auto_168155 ?auto_168154 ) ( not ( = ?auto_168151 ?auto_168152 ) ) ( not ( = ?auto_168151 ?auto_168153 ) ) ( not ( = ?auto_168151 ?auto_168154 ) ) ( not ( = ?auto_168151 ?auto_168155 ) ) ( not ( = ?auto_168151 ?auto_168156 ) ) ( not ( = ?auto_168151 ?auto_168158 ) ) ( not ( = ?auto_168152 ?auto_168153 ) ) ( not ( = ?auto_168152 ?auto_168154 ) ) ( not ( = ?auto_168152 ?auto_168155 ) ) ( not ( = ?auto_168152 ?auto_168156 ) ) ( not ( = ?auto_168152 ?auto_168158 ) ) ( not ( = ?auto_168153 ?auto_168154 ) ) ( not ( = ?auto_168153 ?auto_168155 ) ) ( not ( = ?auto_168153 ?auto_168156 ) ) ( not ( = ?auto_168153 ?auto_168158 ) ) ( not ( = ?auto_168154 ?auto_168155 ) ) ( not ( = ?auto_168154 ?auto_168156 ) ) ( not ( = ?auto_168154 ?auto_168158 ) ) ( not ( = ?auto_168155 ?auto_168156 ) ) ( not ( = ?auto_168155 ?auto_168158 ) ) ( not ( = ?auto_168156 ?auto_168158 ) ) ( not ( = ?auto_168151 ?auto_168157 ) ) ( not ( = ?auto_168152 ?auto_168157 ) ) ( not ( = ?auto_168153 ?auto_168157 ) ) ( not ( = ?auto_168154 ?auto_168157 ) ) ( not ( = ?auto_168155 ?auto_168157 ) ) ( not ( = ?auto_168156 ?auto_168157 ) ) ( not ( = ?auto_168158 ?auto_168157 ) ) ( ON ?auto_168157 ?auto_168159 ) ( not ( = ?auto_168151 ?auto_168159 ) ) ( not ( = ?auto_168152 ?auto_168159 ) ) ( not ( = ?auto_168153 ?auto_168159 ) ) ( not ( = ?auto_168154 ?auto_168159 ) ) ( not ( = ?auto_168155 ?auto_168159 ) ) ( not ( = ?auto_168156 ?auto_168159 ) ) ( not ( = ?auto_168158 ?auto_168159 ) ) ( not ( = ?auto_168157 ?auto_168159 ) ) ( ON ?auto_168158 ?auto_168157 ) ( CLEAR ?auto_168155 ) ( ON ?auto_168156 ?auto_168158 ) ( CLEAR ?auto_168156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168159 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168159 ?auto_168157 ?auto_168158 )
      ( MAKE-6PILE ?auto_168151 ?auto_168152 ?auto_168153 ?auto_168154 ?auto_168155 ?auto_168156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168160 - BLOCK
      ?auto_168161 - BLOCK
      ?auto_168162 - BLOCK
      ?auto_168163 - BLOCK
      ?auto_168164 - BLOCK
      ?auto_168165 - BLOCK
    )
    :vars
    (
      ?auto_168167 - BLOCK
      ?auto_168168 - BLOCK
      ?auto_168166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168160 ) ( ON ?auto_168161 ?auto_168160 ) ( ON ?auto_168162 ?auto_168161 ) ( ON ?auto_168163 ?auto_168162 ) ( not ( = ?auto_168160 ?auto_168161 ) ) ( not ( = ?auto_168160 ?auto_168162 ) ) ( not ( = ?auto_168160 ?auto_168163 ) ) ( not ( = ?auto_168160 ?auto_168164 ) ) ( not ( = ?auto_168160 ?auto_168165 ) ) ( not ( = ?auto_168160 ?auto_168167 ) ) ( not ( = ?auto_168161 ?auto_168162 ) ) ( not ( = ?auto_168161 ?auto_168163 ) ) ( not ( = ?auto_168161 ?auto_168164 ) ) ( not ( = ?auto_168161 ?auto_168165 ) ) ( not ( = ?auto_168161 ?auto_168167 ) ) ( not ( = ?auto_168162 ?auto_168163 ) ) ( not ( = ?auto_168162 ?auto_168164 ) ) ( not ( = ?auto_168162 ?auto_168165 ) ) ( not ( = ?auto_168162 ?auto_168167 ) ) ( not ( = ?auto_168163 ?auto_168164 ) ) ( not ( = ?auto_168163 ?auto_168165 ) ) ( not ( = ?auto_168163 ?auto_168167 ) ) ( not ( = ?auto_168164 ?auto_168165 ) ) ( not ( = ?auto_168164 ?auto_168167 ) ) ( not ( = ?auto_168165 ?auto_168167 ) ) ( not ( = ?auto_168160 ?auto_168168 ) ) ( not ( = ?auto_168161 ?auto_168168 ) ) ( not ( = ?auto_168162 ?auto_168168 ) ) ( not ( = ?auto_168163 ?auto_168168 ) ) ( not ( = ?auto_168164 ?auto_168168 ) ) ( not ( = ?auto_168165 ?auto_168168 ) ) ( not ( = ?auto_168167 ?auto_168168 ) ) ( ON ?auto_168168 ?auto_168166 ) ( not ( = ?auto_168160 ?auto_168166 ) ) ( not ( = ?auto_168161 ?auto_168166 ) ) ( not ( = ?auto_168162 ?auto_168166 ) ) ( not ( = ?auto_168163 ?auto_168166 ) ) ( not ( = ?auto_168164 ?auto_168166 ) ) ( not ( = ?auto_168165 ?auto_168166 ) ) ( not ( = ?auto_168167 ?auto_168166 ) ) ( not ( = ?auto_168168 ?auto_168166 ) ) ( ON ?auto_168167 ?auto_168168 ) ( ON ?auto_168165 ?auto_168167 ) ( CLEAR ?auto_168165 ) ( ON-TABLE ?auto_168166 ) ( HOLDING ?auto_168164 ) ( CLEAR ?auto_168163 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168160 ?auto_168161 ?auto_168162 ?auto_168163 ?auto_168164 )
      ( MAKE-6PILE ?auto_168160 ?auto_168161 ?auto_168162 ?auto_168163 ?auto_168164 ?auto_168165 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168169 - BLOCK
      ?auto_168170 - BLOCK
      ?auto_168171 - BLOCK
      ?auto_168172 - BLOCK
      ?auto_168173 - BLOCK
      ?auto_168174 - BLOCK
    )
    :vars
    (
      ?auto_168177 - BLOCK
      ?auto_168175 - BLOCK
      ?auto_168176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168169 ) ( ON ?auto_168170 ?auto_168169 ) ( ON ?auto_168171 ?auto_168170 ) ( ON ?auto_168172 ?auto_168171 ) ( not ( = ?auto_168169 ?auto_168170 ) ) ( not ( = ?auto_168169 ?auto_168171 ) ) ( not ( = ?auto_168169 ?auto_168172 ) ) ( not ( = ?auto_168169 ?auto_168173 ) ) ( not ( = ?auto_168169 ?auto_168174 ) ) ( not ( = ?auto_168169 ?auto_168177 ) ) ( not ( = ?auto_168170 ?auto_168171 ) ) ( not ( = ?auto_168170 ?auto_168172 ) ) ( not ( = ?auto_168170 ?auto_168173 ) ) ( not ( = ?auto_168170 ?auto_168174 ) ) ( not ( = ?auto_168170 ?auto_168177 ) ) ( not ( = ?auto_168171 ?auto_168172 ) ) ( not ( = ?auto_168171 ?auto_168173 ) ) ( not ( = ?auto_168171 ?auto_168174 ) ) ( not ( = ?auto_168171 ?auto_168177 ) ) ( not ( = ?auto_168172 ?auto_168173 ) ) ( not ( = ?auto_168172 ?auto_168174 ) ) ( not ( = ?auto_168172 ?auto_168177 ) ) ( not ( = ?auto_168173 ?auto_168174 ) ) ( not ( = ?auto_168173 ?auto_168177 ) ) ( not ( = ?auto_168174 ?auto_168177 ) ) ( not ( = ?auto_168169 ?auto_168175 ) ) ( not ( = ?auto_168170 ?auto_168175 ) ) ( not ( = ?auto_168171 ?auto_168175 ) ) ( not ( = ?auto_168172 ?auto_168175 ) ) ( not ( = ?auto_168173 ?auto_168175 ) ) ( not ( = ?auto_168174 ?auto_168175 ) ) ( not ( = ?auto_168177 ?auto_168175 ) ) ( ON ?auto_168175 ?auto_168176 ) ( not ( = ?auto_168169 ?auto_168176 ) ) ( not ( = ?auto_168170 ?auto_168176 ) ) ( not ( = ?auto_168171 ?auto_168176 ) ) ( not ( = ?auto_168172 ?auto_168176 ) ) ( not ( = ?auto_168173 ?auto_168176 ) ) ( not ( = ?auto_168174 ?auto_168176 ) ) ( not ( = ?auto_168177 ?auto_168176 ) ) ( not ( = ?auto_168175 ?auto_168176 ) ) ( ON ?auto_168177 ?auto_168175 ) ( ON ?auto_168174 ?auto_168177 ) ( ON-TABLE ?auto_168176 ) ( CLEAR ?auto_168172 ) ( ON ?auto_168173 ?auto_168174 ) ( CLEAR ?auto_168173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168176 ?auto_168175 ?auto_168177 ?auto_168174 )
      ( MAKE-6PILE ?auto_168169 ?auto_168170 ?auto_168171 ?auto_168172 ?auto_168173 ?auto_168174 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168178 - BLOCK
      ?auto_168179 - BLOCK
      ?auto_168180 - BLOCK
      ?auto_168181 - BLOCK
      ?auto_168182 - BLOCK
      ?auto_168183 - BLOCK
    )
    :vars
    (
      ?auto_168186 - BLOCK
      ?auto_168184 - BLOCK
      ?auto_168185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168178 ) ( ON ?auto_168179 ?auto_168178 ) ( ON ?auto_168180 ?auto_168179 ) ( not ( = ?auto_168178 ?auto_168179 ) ) ( not ( = ?auto_168178 ?auto_168180 ) ) ( not ( = ?auto_168178 ?auto_168181 ) ) ( not ( = ?auto_168178 ?auto_168182 ) ) ( not ( = ?auto_168178 ?auto_168183 ) ) ( not ( = ?auto_168178 ?auto_168186 ) ) ( not ( = ?auto_168179 ?auto_168180 ) ) ( not ( = ?auto_168179 ?auto_168181 ) ) ( not ( = ?auto_168179 ?auto_168182 ) ) ( not ( = ?auto_168179 ?auto_168183 ) ) ( not ( = ?auto_168179 ?auto_168186 ) ) ( not ( = ?auto_168180 ?auto_168181 ) ) ( not ( = ?auto_168180 ?auto_168182 ) ) ( not ( = ?auto_168180 ?auto_168183 ) ) ( not ( = ?auto_168180 ?auto_168186 ) ) ( not ( = ?auto_168181 ?auto_168182 ) ) ( not ( = ?auto_168181 ?auto_168183 ) ) ( not ( = ?auto_168181 ?auto_168186 ) ) ( not ( = ?auto_168182 ?auto_168183 ) ) ( not ( = ?auto_168182 ?auto_168186 ) ) ( not ( = ?auto_168183 ?auto_168186 ) ) ( not ( = ?auto_168178 ?auto_168184 ) ) ( not ( = ?auto_168179 ?auto_168184 ) ) ( not ( = ?auto_168180 ?auto_168184 ) ) ( not ( = ?auto_168181 ?auto_168184 ) ) ( not ( = ?auto_168182 ?auto_168184 ) ) ( not ( = ?auto_168183 ?auto_168184 ) ) ( not ( = ?auto_168186 ?auto_168184 ) ) ( ON ?auto_168184 ?auto_168185 ) ( not ( = ?auto_168178 ?auto_168185 ) ) ( not ( = ?auto_168179 ?auto_168185 ) ) ( not ( = ?auto_168180 ?auto_168185 ) ) ( not ( = ?auto_168181 ?auto_168185 ) ) ( not ( = ?auto_168182 ?auto_168185 ) ) ( not ( = ?auto_168183 ?auto_168185 ) ) ( not ( = ?auto_168186 ?auto_168185 ) ) ( not ( = ?auto_168184 ?auto_168185 ) ) ( ON ?auto_168186 ?auto_168184 ) ( ON ?auto_168183 ?auto_168186 ) ( ON-TABLE ?auto_168185 ) ( ON ?auto_168182 ?auto_168183 ) ( CLEAR ?auto_168182 ) ( HOLDING ?auto_168181 ) ( CLEAR ?auto_168180 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168178 ?auto_168179 ?auto_168180 ?auto_168181 )
      ( MAKE-6PILE ?auto_168178 ?auto_168179 ?auto_168180 ?auto_168181 ?auto_168182 ?auto_168183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168187 - BLOCK
      ?auto_168188 - BLOCK
      ?auto_168189 - BLOCK
      ?auto_168190 - BLOCK
      ?auto_168191 - BLOCK
      ?auto_168192 - BLOCK
    )
    :vars
    (
      ?auto_168195 - BLOCK
      ?auto_168193 - BLOCK
      ?auto_168194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168187 ) ( ON ?auto_168188 ?auto_168187 ) ( ON ?auto_168189 ?auto_168188 ) ( not ( = ?auto_168187 ?auto_168188 ) ) ( not ( = ?auto_168187 ?auto_168189 ) ) ( not ( = ?auto_168187 ?auto_168190 ) ) ( not ( = ?auto_168187 ?auto_168191 ) ) ( not ( = ?auto_168187 ?auto_168192 ) ) ( not ( = ?auto_168187 ?auto_168195 ) ) ( not ( = ?auto_168188 ?auto_168189 ) ) ( not ( = ?auto_168188 ?auto_168190 ) ) ( not ( = ?auto_168188 ?auto_168191 ) ) ( not ( = ?auto_168188 ?auto_168192 ) ) ( not ( = ?auto_168188 ?auto_168195 ) ) ( not ( = ?auto_168189 ?auto_168190 ) ) ( not ( = ?auto_168189 ?auto_168191 ) ) ( not ( = ?auto_168189 ?auto_168192 ) ) ( not ( = ?auto_168189 ?auto_168195 ) ) ( not ( = ?auto_168190 ?auto_168191 ) ) ( not ( = ?auto_168190 ?auto_168192 ) ) ( not ( = ?auto_168190 ?auto_168195 ) ) ( not ( = ?auto_168191 ?auto_168192 ) ) ( not ( = ?auto_168191 ?auto_168195 ) ) ( not ( = ?auto_168192 ?auto_168195 ) ) ( not ( = ?auto_168187 ?auto_168193 ) ) ( not ( = ?auto_168188 ?auto_168193 ) ) ( not ( = ?auto_168189 ?auto_168193 ) ) ( not ( = ?auto_168190 ?auto_168193 ) ) ( not ( = ?auto_168191 ?auto_168193 ) ) ( not ( = ?auto_168192 ?auto_168193 ) ) ( not ( = ?auto_168195 ?auto_168193 ) ) ( ON ?auto_168193 ?auto_168194 ) ( not ( = ?auto_168187 ?auto_168194 ) ) ( not ( = ?auto_168188 ?auto_168194 ) ) ( not ( = ?auto_168189 ?auto_168194 ) ) ( not ( = ?auto_168190 ?auto_168194 ) ) ( not ( = ?auto_168191 ?auto_168194 ) ) ( not ( = ?auto_168192 ?auto_168194 ) ) ( not ( = ?auto_168195 ?auto_168194 ) ) ( not ( = ?auto_168193 ?auto_168194 ) ) ( ON ?auto_168195 ?auto_168193 ) ( ON ?auto_168192 ?auto_168195 ) ( ON-TABLE ?auto_168194 ) ( ON ?auto_168191 ?auto_168192 ) ( CLEAR ?auto_168189 ) ( ON ?auto_168190 ?auto_168191 ) ( CLEAR ?auto_168190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168194 ?auto_168193 ?auto_168195 ?auto_168192 ?auto_168191 )
      ( MAKE-6PILE ?auto_168187 ?auto_168188 ?auto_168189 ?auto_168190 ?auto_168191 ?auto_168192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168196 - BLOCK
      ?auto_168197 - BLOCK
      ?auto_168198 - BLOCK
      ?auto_168199 - BLOCK
      ?auto_168200 - BLOCK
      ?auto_168201 - BLOCK
    )
    :vars
    (
      ?auto_168203 - BLOCK
      ?auto_168202 - BLOCK
      ?auto_168204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168196 ) ( ON ?auto_168197 ?auto_168196 ) ( not ( = ?auto_168196 ?auto_168197 ) ) ( not ( = ?auto_168196 ?auto_168198 ) ) ( not ( = ?auto_168196 ?auto_168199 ) ) ( not ( = ?auto_168196 ?auto_168200 ) ) ( not ( = ?auto_168196 ?auto_168201 ) ) ( not ( = ?auto_168196 ?auto_168203 ) ) ( not ( = ?auto_168197 ?auto_168198 ) ) ( not ( = ?auto_168197 ?auto_168199 ) ) ( not ( = ?auto_168197 ?auto_168200 ) ) ( not ( = ?auto_168197 ?auto_168201 ) ) ( not ( = ?auto_168197 ?auto_168203 ) ) ( not ( = ?auto_168198 ?auto_168199 ) ) ( not ( = ?auto_168198 ?auto_168200 ) ) ( not ( = ?auto_168198 ?auto_168201 ) ) ( not ( = ?auto_168198 ?auto_168203 ) ) ( not ( = ?auto_168199 ?auto_168200 ) ) ( not ( = ?auto_168199 ?auto_168201 ) ) ( not ( = ?auto_168199 ?auto_168203 ) ) ( not ( = ?auto_168200 ?auto_168201 ) ) ( not ( = ?auto_168200 ?auto_168203 ) ) ( not ( = ?auto_168201 ?auto_168203 ) ) ( not ( = ?auto_168196 ?auto_168202 ) ) ( not ( = ?auto_168197 ?auto_168202 ) ) ( not ( = ?auto_168198 ?auto_168202 ) ) ( not ( = ?auto_168199 ?auto_168202 ) ) ( not ( = ?auto_168200 ?auto_168202 ) ) ( not ( = ?auto_168201 ?auto_168202 ) ) ( not ( = ?auto_168203 ?auto_168202 ) ) ( ON ?auto_168202 ?auto_168204 ) ( not ( = ?auto_168196 ?auto_168204 ) ) ( not ( = ?auto_168197 ?auto_168204 ) ) ( not ( = ?auto_168198 ?auto_168204 ) ) ( not ( = ?auto_168199 ?auto_168204 ) ) ( not ( = ?auto_168200 ?auto_168204 ) ) ( not ( = ?auto_168201 ?auto_168204 ) ) ( not ( = ?auto_168203 ?auto_168204 ) ) ( not ( = ?auto_168202 ?auto_168204 ) ) ( ON ?auto_168203 ?auto_168202 ) ( ON ?auto_168201 ?auto_168203 ) ( ON-TABLE ?auto_168204 ) ( ON ?auto_168200 ?auto_168201 ) ( ON ?auto_168199 ?auto_168200 ) ( CLEAR ?auto_168199 ) ( HOLDING ?auto_168198 ) ( CLEAR ?auto_168197 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168196 ?auto_168197 ?auto_168198 )
      ( MAKE-6PILE ?auto_168196 ?auto_168197 ?auto_168198 ?auto_168199 ?auto_168200 ?auto_168201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168205 - BLOCK
      ?auto_168206 - BLOCK
      ?auto_168207 - BLOCK
      ?auto_168208 - BLOCK
      ?auto_168209 - BLOCK
      ?auto_168210 - BLOCK
    )
    :vars
    (
      ?auto_168213 - BLOCK
      ?auto_168211 - BLOCK
      ?auto_168212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168205 ) ( ON ?auto_168206 ?auto_168205 ) ( not ( = ?auto_168205 ?auto_168206 ) ) ( not ( = ?auto_168205 ?auto_168207 ) ) ( not ( = ?auto_168205 ?auto_168208 ) ) ( not ( = ?auto_168205 ?auto_168209 ) ) ( not ( = ?auto_168205 ?auto_168210 ) ) ( not ( = ?auto_168205 ?auto_168213 ) ) ( not ( = ?auto_168206 ?auto_168207 ) ) ( not ( = ?auto_168206 ?auto_168208 ) ) ( not ( = ?auto_168206 ?auto_168209 ) ) ( not ( = ?auto_168206 ?auto_168210 ) ) ( not ( = ?auto_168206 ?auto_168213 ) ) ( not ( = ?auto_168207 ?auto_168208 ) ) ( not ( = ?auto_168207 ?auto_168209 ) ) ( not ( = ?auto_168207 ?auto_168210 ) ) ( not ( = ?auto_168207 ?auto_168213 ) ) ( not ( = ?auto_168208 ?auto_168209 ) ) ( not ( = ?auto_168208 ?auto_168210 ) ) ( not ( = ?auto_168208 ?auto_168213 ) ) ( not ( = ?auto_168209 ?auto_168210 ) ) ( not ( = ?auto_168209 ?auto_168213 ) ) ( not ( = ?auto_168210 ?auto_168213 ) ) ( not ( = ?auto_168205 ?auto_168211 ) ) ( not ( = ?auto_168206 ?auto_168211 ) ) ( not ( = ?auto_168207 ?auto_168211 ) ) ( not ( = ?auto_168208 ?auto_168211 ) ) ( not ( = ?auto_168209 ?auto_168211 ) ) ( not ( = ?auto_168210 ?auto_168211 ) ) ( not ( = ?auto_168213 ?auto_168211 ) ) ( ON ?auto_168211 ?auto_168212 ) ( not ( = ?auto_168205 ?auto_168212 ) ) ( not ( = ?auto_168206 ?auto_168212 ) ) ( not ( = ?auto_168207 ?auto_168212 ) ) ( not ( = ?auto_168208 ?auto_168212 ) ) ( not ( = ?auto_168209 ?auto_168212 ) ) ( not ( = ?auto_168210 ?auto_168212 ) ) ( not ( = ?auto_168213 ?auto_168212 ) ) ( not ( = ?auto_168211 ?auto_168212 ) ) ( ON ?auto_168213 ?auto_168211 ) ( ON ?auto_168210 ?auto_168213 ) ( ON-TABLE ?auto_168212 ) ( ON ?auto_168209 ?auto_168210 ) ( ON ?auto_168208 ?auto_168209 ) ( CLEAR ?auto_168206 ) ( ON ?auto_168207 ?auto_168208 ) ( CLEAR ?auto_168207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168212 ?auto_168211 ?auto_168213 ?auto_168210 ?auto_168209 ?auto_168208 )
      ( MAKE-6PILE ?auto_168205 ?auto_168206 ?auto_168207 ?auto_168208 ?auto_168209 ?auto_168210 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168214 - BLOCK
      ?auto_168215 - BLOCK
      ?auto_168216 - BLOCK
      ?auto_168217 - BLOCK
      ?auto_168218 - BLOCK
      ?auto_168219 - BLOCK
    )
    :vars
    (
      ?auto_168221 - BLOCK
      ?auto_168220 - BLOCK
      ?auto_168222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168214 ) ( not ( = ?auto_168214 ?auto_168215 ) ) ( not ( = ?auto_168214 ?auto_168216 ) ) ( not ( = ?auto_168214 ?auto_168217 ) ) ( not ( = ?auto_168214 ?auto_168218 ) ) ( not ( = ?auto_168214 ?auto_168219 ) ) ( not ( = ?auto_168214 ?auto_168221 ) ) ( not ( = ?auto_168215 ?auto_168216 ) ) ( not ( = ?auto_168215 ?auto_168217 ) ) ( not ( = ?auto_168215 ?auto_168218 ) ) ( not ( = ?auto_168215 ?auto_168219 ) ) ( not ( = ?auto_168215 ?auto_168221 ) ) ( not ( = ?auto_168216 ?auto_168217 ) ) ( not ( = ?auto_168216 ?auto_168218 ) ) ( not ( = ?auto_168216 ?auto_168219 ) ) ( not ( = ?auto_168216 ?auto_168221 ) ) ( not ( = ?auto_168217 ?auto_168218 ) ) ( not ( = ?auto_168217 ?auto_168219 ) ) ( not ( = ?auto_168217 ?auto_168221 ) ) ( not ( = ?auto_168218 ?auto_168219 ) ) ( not ( = ?auto_168218 ?auto_168221 ) ) ( not ( = ?auto_168219 ?auto_168221 ) ) ( not ( = ?auto_168214 ?auto_168220 ) ) ( not ( = ?auto_168215 ?auto_168220 ) ) ( not ( = ?auto_168216 ?auto_168220 ) ) ( not ( = ?auto_168217 ?auto_168220 ) ) ( not ( = ?auto_168218 ?auto_168220 ) ) ( not ( = ?auto_168219 ?auto_168220 ) ) ( not ( = ?auto_168221 ?auto_168220 ) ) ( ON ?auto_168220 ?auto_168222 ) ( not ( = ?auto_168214 ?auto_168222 ) ) ( not ( = ?auto_168215 ?auto_168222 ) ) ( not ( = ?auto_168216 ?auto_168222 ) ) ( not ( = ?auto_168217 ?auto_168222 ) ) ( not ( = ?auto_168218 ?auto_168222 ) ) ( not ( = ?auto_168219 ?auto_168222 ) ) ( not ( = ?auto_168221 ?auto_168222 ) ) ( not ( = ?auto_168220 ?auto_168222 ) ) ( ON ?auto_168221 ?auto_168220 ) ( ON ?auto_168219 ?auto_168221 ) ( ON-TABLE ?auto_168222 ) ( ON ?auto_168218 ?auto_168219 ) ( ON ?auto_168217 ?auto_168218 ) ( ON ?auto_168216 ?auto_168217 ) ( CLEAR ?auto_168216 ) ( HOLDING ?auto_168215 ) ( CLEAR ?auto_168214 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168214 ?auto_168215 )
      ( MAKE-6PILE ?auto_168214 ?auto_168215 ?auto_168216 ?auto_168217 ?auto_168218 ?auto_168219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168223 - BLOCK
      ?auto_168224 - BLOCK
      ?auto_168225 - BLOCK
      ?auto_168226 - BLOCK
      ?auto_168227 - BLOCK
      ?auto_168228 - BLOCK
    )
    :vars
    (
      ?auto_168231 - BLOCK
      ?auto_168229 - BLOCK
      ?auto_168230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168223 ) ( not ( = ?auto_168223 ?auto_168224 ) ) ( not ( = ?auto_168223 ?auto_168225 ) ) ( not ( = ?auto_168223 ?auto_168226 ) ) ( not ( = ?auto_168223 ?auto_168227 ) ) ( not ( = ?auto_168223 ?auto_168228 ) ) ( not ( = ?auto_168223 ?auto_168231 ) ) ( not ( = ?auto_168224 ?auto_168225 ) ) ( not ( = ?auto_168224 ?auto_168226 ) ) ( not ( = ?auto_168224 ?auto_168227 ) ) ( not ( = ?auto_168224 ?auto_168228 ) ) ( not ( = ?auto_168224 ?auto_168231 ) ) ( not ( = ?auto_168225 ?auto_168226 ) ) ( not ( = ?auto_168225 ?auto_168227 ) ) ( not ( = ?auto_168225 ?auto_168228 ) ) ( not ( = ?auto_168225 ?auto_168231 ) ) ( not ( = ?auto_168226 ?auto_168227 ) ) ( not ( = ?auto_168226 ?auto_168228 ) ) ( not ( = ?auto_168226 ?auto_168231 ) ) ( not ( = ?auto_168227 ?auto_168228 ) ) ( not ( = ?auto_168227 ?auto_168231 ) ) ( not ( = ?auto_168228 ?auto_168231 ) ) ( not ( = ?auto_168223 ?auto_168229 ) ) ( not ( = ?auto_168224 ?auto_168229 ) ) ( not ( = ?auto_168225 ?auto_168229 ) ) ( not ( = ?auto_168226 ?auto_168229 ) ) ( not ( = ?auto_168227 ?auto_168229 ) ) ( not ( = ?auto_168228 ?auto_168229 ) ) ( not ( = ?auto_168231 ?auto_168229 ) ) ( ON ?auto_168229 ?auto_168230 ) ( not ( = ?auto_168223 ?auto_168230 ) ) ( not ( = ?auto_168224 ?auto_168230 ) ) ( not ( = ?auto_168225 ?auto_168230 ) ) ( not ( = ?auto_168226 ?auto_168230 ) ) ( not ( = ?auto_168227 ?auto_168230 ) ) ( not ( = ?auto_168228 ?auto_168230 ) ) ( not ( = ?auto_168231 ?auto_168230 ) ) ( not ( = ?auto_168229 ?auto_168230 ) ) ( ON ?auto_168231 ?auto_168229 ) ( ON ?auto_168228 ?auto_168231 ) ( ON-TABLE ?auto_168230 ) ( ON ?auto_168227 ?auto_168228 ) ( ON ?auto_168226 ?auto_168227 ) ( ON ?auto_168225 ?auto_168226 ) ( CLEAR ?auto_168223 ) ( ON ?auto_168224 ?auto_168225 ) ( CLEAR ?auto_168224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168230 ?auto_168229 ?auto_168231 ?auto_168228 ?auto_168227 ?auto_168226 ?auto_168225 )
      ( MAKE-6PILE ?auto_168223 ?auto_168224 ?auto_168225 ?auto_168226 ?auto_168227 ?auto_168228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168232 - BLOCK
      ?auto_168233 - BLOCK
      ?auto_168234 - BLOCK
      ?auto_168235 - BLOCK
      ?auto_168236 - BLOCK
      ?auto_168237 - BLOCK
    )
    :vars
    (
      ?auto_168239 - BLOCK
      ?auto_168240 - BLOCK
      ?auto_168238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168232 ?auto_168233 ) ) ( not ( = ?auto_168232 ?auto_168234 ) ) ( not ( = ?auto_168232 ?auto_168235 ) ) ( not ( = ?auto_168232 ?auto_168236 ) ) ( not ( = ?auto_168232 ?auto_168237 ) ) ( not ( = ?auto_168232 ?auto_168239 ) ) ( not ( = ?auto_168233 ?auto_168234 ) ) ( not ( = ?auto_168233 ?auto_168235 ) ) ( not ( = ?auto_168233 ?auto_168236 ) ) ( not ( = ?auto_168233 ?auto_168237 ) ) ( not ( = ?auto_168233 ?auto_168239 ) ) ( not ( = ?auto_168234 ?auto_168235 ) ) ( not ( = ?auto_168234 ?auto_168236 ) ) ( not ( = ?auto_168234 ?auto_168237 ) ) ( not ( = ?auto_168234 ?auto_168239 ) ) ( not ( = ?auto_168235 ?auto_168236 ) ) ( not ( = ?auto_168235 ?auto_168237 ) ) ( not ( = ?auto_168235 ?auto_168239 ) ) ( not ( = ?auto_168236 ?auto_168237 ) ) ( not ( = ?auto_168236 ?auto_168239 ) ) ( not ( = ?auto_168237 ?auto_168239 ) ) ( not ( = ?auto_168232 ?auto_168240 ) ) ( not ( = ?auto_168233 ?auto_168240 ) ) ( not ( = ?auto_168234 ?auto_168240 ) ) ( not ( = ?auto_168235 ?auto_168240 ) ) ( not ( = ?auto_168236 ?auto_168240 ) ) ( not ( = ?auto_168237 ?auto_168240 ) ) ( not ( = ?auto_168239 ?auto_168240 ) ) ( ON ?auto_168240 ?auto_168238 ) ( not ( = ?auto_168232 ?auto_168238 ) ) ( not ( = ?auto_168233 ?auto_168238 ) ) ( not ( = ?auto_168234 ?auto_168238 ) ) ( not ( = ?auto_168235 ?auto_168238 ) ) ( not ( = ?auto_168236 ?auto_168238 ) ) ( not ( = ?auto_168237 ?auto_168238 ) ) ( not ( = ?auto_168239 ?auto_168238 ) ) ( not ( = ?auto_168240 ?auto_168238 ) ) ( ON ?auto_168239 ?auto_168240 ) ( ON ?auto_168237 ?auto_168239 ) ( ON-TABLE ?auto_168238 ) ( ON ?auto_168236 ?auto_168237 ) ( ON ?auto_168235 ?auto_168236 ) ( ON ?auto_168234 ?auto_168235 ) ( ON ?auto_168233 ?auto_168234 ) ( CLEAR ?auto_168233 ) ( HOLDING ?auto_168232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168232 )
      ( MAKE-6PILE ?auto_168232 ?auto_168233 ?auto_168234 ?auto_168235 ?auto_168236 ?auto_168237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_168241 - BLOCK
      ?auto_168242 - BLOCK
      ?auto_168243 - BLOCK
      ?auto_168244 - BLOCK
      ?auto_168245 - BLOCK
      ?auto_168246 - BLOCK
    )
    :vars
    (
      ?auto_168247 - BLOCK
      ?auto_168249 - BLOCK
      ?auto_168248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168241 ?auto_168242 ) ) ( not ( = ?auto_168241 ?auto_168243 ) ) ( not ( = ?auto_168241 ?auto_168244 ) ) ( not ( = ?auto_168241 ?auto_168245 ) ) ( not ( = ?auto_168241 ?auto_168246 ) ) ( not ( = ?auto_168241 ?auto_168247 ) ) ( not ( = ?auto_168242 ?auto_168243 ) ) ( not ( = ?auto_168242 ?auto_168244 ) ) ( not ( = ?auto_168242 ?auto_168245 ) ) ( not ( = ?auto_168242 ?auto_168246 ) ) ( not ( = ?auto_168242 ?auto_168247 ) ) ( not ( = ?auto_168243 ?auto_168244 ) ) ( not ( = ?auto_168243 ?auto_168245 ) ) ( not ( = ?auto_168243 ?auto_168246 ) ) ( not ( = ?auto_168243 ?auto_168247 ) ) ( not ( = ?auto_168244 ?auto_168245 ) ) ( not ( = ?auto_168244 ?auto_168246 ) ) ( not ( = ?auto_168244 ?auto_168247 ) ) ( not ( = ?auto_168245 ?auto_168246 ) ) ( not ( = ?auto_168245 ?auto_168247 ) ) ( not ( = ?auto_168246 ?auto_168247 ) ) ( not ( = ?auto_168241 ?auto_168249 ) ) ( not ( = ?auto_168242 ?auto_168249 ) ) ( not ( = ?auto_168243 ?auto_168249 ) ) ( not ( = ?auto_168244 ?auto_168249 ) ) ( not ( = ?auto_168245 ?auto_168249 ) ) ( not ( = ?auto_168246 ?auto_168249 ) ) ( not ( = ?auto_168247 ?auto_168249 ) ) ( ON ?auto_168249 ?auto_168248 ) ( not ( = ?auto_168241 ?auto_168248 ) ) ( not ( = ?auto_168242 ?auto_168248 ) ) ( not ( = ?auto_168243 ?auto_168248 ) ) ( not ( = ?auto_168244 ?auto_168248 ) ) ( not ( = ?auto_168245 ?auto_168248 ) ) ( not ( = ?auto_168246 ?auto_168248 ) ) ( not ( = ?auto_168247 ?auto_168248 ) ) ( not ( = ?auto_168249 ?auto_168248 ) ) ( ON ?auto_168247 ?auto_168249 ) ( ON ?auto_168246 ?auto_168247 ) ( ON-TABLE ?auto_168248 ) ( ON ?auto_168245 ?auto_168246 ) ( ON ?auto_168244 ?auto_168245 ) ( ON ?auto_168243 ?auto_168244 ) ( ON ?auto_168242 ?auto_168243 ) ( ON ?auto_168241 ?auto_168242 ) ( CLEAR ?auto_168241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168248 ?auto_168249 ?auto_168247 ?auto_168246 ?auto_168245 ?auto_168244 ?auto_168243 ?auto_168242 )
      ( MAKE-6PILE ?auto_168241 ?auto_168242 ?auto_168243 ?auto_168244 ?auto_168245 ?auto_168246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168252 - BLOCK
      ?auto_168253 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_168253 ) ( CLEAR ?auto_168252 ) ( ON-TABLE ?auto_168252 ) ( not ( = ?auto_168252 ?auto_168253 ) ) )
    :subtasks
    ( ( !STACK ?auto_168253 ?auto_168252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168254 - BLOCK
      ?auto_168255 - BLOCK
    )
    :vars
    (
      ?auto_168256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168254 ) ( ON-TABLE ?auto_168254 ) ( not ( = ?auto_168254 ?auto_168255 ) ) ( ON ?auto_168255 ?auto_168256 ) ( CLEAR ?auto_168255 ) ( HAND-EMPTY ) ( not ( = ?auto_168254 ?auto_168256 ) ) ( not ( = ?auto_168255 ?auto_168256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168255 ?auto_168256 )
      ( MAKE-2PILE ?auto_168254 ?auto_168255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168257 - BLOCK
      ?auto_168258 - BLOCK
    )
    :vars
    (
      ?auto_168259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168257 ?auto_168258 ) ) ( ON ?auto_168258 ?auto_168259 ) ( CLEAR ?auto_168258 ) ( not ( = ?auto_168257 ?auto_168259 ) ) ( not ( = ?auto_168258 ?auto_168259 ) ) ( HOLDING ?auto_168257 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168257 )
      ( MAKE-2PILE ?auto_168257 ?auto_168258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168260 - BLOCK
      ?auto_168261 - BLOCK
    )
    :vars
    (
      ?auto_168262 - BLOCK
      ?auto_168264 - BLOCK
      ?auto_168265 - BLOCK
      ?auto_168267 - BLOCK
      ?auto_168263 - BLOCK
      ?auto_168266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168260 ?auto_168261 ) ) ( ON ?auto_168261 ?auto_168262 ) ( not ( = ?auto_168260 ?auto_168262 ) ) ( not ( = ?auto_168261 ?auto_168262 ) ) ( ON ?auto_168260 ?auto_168261 ) ( CLEAR ?auto_168260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168264 ) ( ON ?auto_168265 ?auto_168264 ) ( ON ?auto_168267 ?auto_168265 ) ( ON ?auto_168263 ?auto_168267 ) ( ON ?auto_168266 ?auto_168263 ) ( ON ?auto_168262 ?auto_168266 ) ( not ( = ?auto_168264 ?auto_168265 ) ) ( not ( = ?auto_168264 ?auto_168267 ) ) ( not ( = ?auto_168264 ?auto_168263 ) ) ( not ( = ?auto_168264 ?auto_168266 ) ) ( not ( = ?auto_168264 ?auto_168262 ) ) ( not ( = ?auto_168264 ?auto_168261 ) ) ( not ( = ?auto_168264 ?auto_168260 ) ) ( not ( = ?auto_168265 ?auto_168267 ) ) ( not ( = ?auto_168265 ?auto_168263 ) ) ( not ( = ?auto_168265 ?auto_168266 ) ) ( not ( = ?auto_168265 ?auto_168262 ) ) ( not ( = ?auto_168265 ?auto_168261 ) ) ( not ( = ?auto_168265 ?auto_168260 ) ) ( not ( = ?auto_168267 ?auto_168263 ) ) ( not ( = ?auto_168267 ?auto_168266 ) ) ( not ( = ?auto_168267 ?auto_168262 ) ) ( not ( = ?auto_168267 ?auto_168261 ) ) ( not ( = ?auto_168267 ?auto_168260 ) ) ( not ( = ?auto_168263 ?auto_168266 ) ) ( not ( = ?auto_168263 ?auto_168262 ) ) ( not ( = ?auto_168263 ?auto_168261 ) ) ( not ( = ?auto_168263 ?auto_168260 ) ) ( not ( = ?auto_168266 ?auto_168262 ) ) ( not ( = ?auto_168266 ?auto_168261 ) ) ( not ( = ?auto_168266 ?auto_168260 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168264 ?auto_168265 ?auto_168267 ?auto_168263 ?auto_168266 ?auto_168262 ?auto_168261 )
      ( MAKE-2PILE ?auto_168260 ?auto_168261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168268 - BLOCK
      ?auto_168269 - BLOCK
    )
    :vars
    (
      ?auto_168274 - BLOCK
      ?auto_168272 - BLOCK
      ?auto_168270 - BLOCK
      ?auto_168271 - BLOCK
      ?auto_168273 - BLOCK
      ?auto_168275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168268 ?auto_168269 ) ) ( ON ?auto_168269 ?auto_168274 ) ( not ( = ?auto_168268 ?auto_168274 ) ) ( not ( = ?auto_168269 ?auto_168274 ) ) ( ON-TABLE ?auto_168272 ) ( ON ?auto_168270 ?auto_168272 ) ( ON ?auto_168271 ?auto_168270 ) ( ON ?auto_168273 ?auto_168271 ) ( ON ?auto_168275 ?auto_168273 ) ( ON ?auto_168274 ?auto_168275 ) ( not ( = ?auto_168272 ?auto_168270 ) ) ( not ( = ?auto_168272 ?auto_168271 ) ) ( not ( = ?auto_168272 ?auto_168273 ) ) ( not ( = ?auto_168272 ?auto_168275 ) ) ( not ( = ?auto_168272 ?auto_168274 ) ) ( not ( = ?auto_168272 ?auto_168269 ) ) ( not ( = ?auto_168272 ?auto_168268 ) ) ( not ( = ?auto_168270 ?auto_168271 ) ) ( not ( = ?auto_168270 ?auto_168273 ) ) ( not ( = ?auto_168270 ?auto_168275 ) ) ( not ( = ?auto_168270 ?auto_168274 ) ) ( not ( = ?auto_168270 ?auto_168269 ) ) ( not ( = ?auto_168270 ?auto_168268 ) ) ( not ( = ?auto_168271 ?auto_168273 ) ) ( not ( = ?auto_168271 ?auto_168275 ) ) ( not ( = ?auto_168271 ?auto_168274 ) ) ( not ( = ?auto_168271 ?auto_168269 ) ) ( not ( = ?auto_168271 ?auto_168268 ) ) ( not ( = ?auto_168273 ?auto_168275 ) ) ( not ( = ?auto_168273 ?auto_168274 ) ) ( not ( = ?auto_168273 ?auto_168269 ) ) ( not ( = ?auto_168273 ?auto_168268 ) ) ( not ( = ?auto_168275 ?auto_168274 ) ) ( not ( = ?auto_168275 ?auto_168269 ) ) ( not ( = ?auto_168275 ?auto_168268 ) ) ( HOLDING ?auto_168268 ) ( CLEAR ?auto_168269 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168272 ?auto_168270 ?auto_168271 ?auto_168273 ?auto_168275 ?auto_168274 ?auto_168269 ?auto_168268 )
      ( MAKE-2PILE ?auto_168268 ?auto_168269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168276 - BLOCK
      ?auto_168277 - BLOCK
    )
    :vars
    (
      ?auto_168279 - BLOCK
      ?auto_168281 - BLOCK
      ?auto_168278 - BLOCK
      ?auto_168282 - BLOCK
      ?auto_168280 - BLOCK
      ?auto_168283 - BLOCK
      ?auto_168284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168276 ?auto_168277 ) ) ( ON ?auto_168277 ?auto_168279 ) ( not ( = ?auto_168276 ?auto_168279 ) ) ( not ( = ?auto_168277 ?auto_168279 ) ) ( ON-TABLE ?auto_168281 ) ( ON ?auto_168278 ?auto_168281 ) ( ON ?auto_168282 ?auto_168278 ) ( ON ?auto_168280 ?auto_168282 ) ( ON ?auto_168283 ?auto_168280 ) ( ON ?auto_168279 ?auto_168283 ) ( not ( = ?auto_168281 ?auto_168278 ) ) ( not ( = ?auto_168281 ?auto_168282 ) ) ( not ( = ?auto_168281 ?auto_168280 ) ) ( not ( = ?auto_168281 ?auto_168283 ) ) ( not ( = ?auto_168281 ?auto_168279 ) ) ( not ( = ?auto_168281 ?auto_168277 ) ) ( not ( = ?auto_168281 ?auto_168276 ) ) ( not ( = ?auto_168278 ?auto_168282 ) ) ( not ( = ?auto_168278 ?auto_168280 ) ) ( not ( = ?auto_168278 ?auto_168283 ) ) ( not ( = ?auto_168278 ?auto_168279 ) ) ( not ( = ?auto_168278 ?auto_168277 ) ) ( not ( = ?auto_168278 ?auto_168276 ) ) ( not ( = ?auto_168282 ?auto_168280 ) ) ( not ( = ?auto_168282 ?auto_168283 ) ) ( not ( = ?auto_168282 ?auto_168279 ) ) ( not ( = ?auto_168282 ?auto_168277 ) ) ( not ( = ?auto_168282 ?auto_168276 ) ) ( not ( = ?auto_168280 ?auto_168283 ) ) ( not ( = ?auto_168280 ?auto_168279 ) ) ( not ( = ?auto_168280 ?auto_168277 ) ) ( not ( = ?auto_168280 ?auto_168276 ) ) ( not ( = ?auto_168283 ?auto_168279 ) ) ( not ( = ?auto_168283 ?auto_168277 ) ) ( not ( = ?auto_168283 ?auto_168276 ) ) ( CLEAR ?auto_168277 ) ( ON ?auto_168276 ?auto_168284 ) ( CLEAR ?auto_168276 ) ( HAND-EMPTY ) ( not ( = ?auto_168276 ?auto_168284 ) ) ( not ( = ?auto_168277 ?auto_168284 ) ) ( not ( = ?auto_168279 ?auto_168284 ) ) ( not ( = ?auto_168281 ?auto_168284 ) ) ( not ( = ?auto_168278 ?auto_168284 ) ) ( not ( = ?auto_168282 ?auto_168284 ) ) ( not ( = ?auto_168280 ?auto_168284 ) ) ( not ( = ?auto_168283 ?auto_168284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168276 ?auto_168284 )
      ( MAKE-2PILE ?auto_168276 ?auto_168277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168285 - BLOCK
      ?auto_168286 - BLOCK
    )
    :vars
    (
      ?auto_168292 - BLOCK
      ?auto_168287 - BLOCK
      ?auto_168293 - BLOCK
      ?auto_168290 - BLOCK
      ?auto_168288 - BLOCK
      ?auto_168289 - BLOCK
      ?auto_168291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168285 ?auto_168286 ) ) ( not ( = ?auto_168285 ?auto_168292 ) ) ( not ( = ?auto_168286 ?auto_168292 ) ) ( ON-TABLE ?auto_168287 ) ( ON ?auto_168293 ?auto_168287 ) ( ON ?auto_168290 ?auto_168293 ) ( ON ?auto_168288 ?auto_168290 ) ( ON ?auto_168289 ?auto_168288 ) ( ON ?auto_168292 ?auto_168289 ) ( not ( = ?auto_168287 ?auto_168293 ) ) ( not ( = ?auto_168287 ?auto_168290 ) ) ( not ( = ?auto_168287 ?auto_168288 ) ) ( not ( = ?auto_168287 ?auto_168289 ) ) ( not ( = ?auto_168287 ?auto_168292 ) ) ( not ( = ?auto_168287 ?auto_168286 ) ) ( not ( = ?auto_168287 ?auto_168285 ) ) ( not ( = ?auto_168293 ?auto_168290 ) ) ( not ( = ?auto_168293 ?auto_168288 ) ) ( not ( = ?auto_168293 ?auto_168289 ) ) ( not ( = ?auto_168293 ?auto_168292 ) ) ( not ( = ?auto_168293 ?auto_168286 ) ) ( not ( = ?auto_168293 ?auto_168285 ) ) ( not ( = ?auto_168290 ?auto_168288 ) ) ( not ( = ?auto_168290 ?auto_168289 ) ) ( not ( = ?auto_168290 ?auto_168292 ) ) ( not ( = ?auto_168290 ?auto_168286 ) ) ( not ( = ?auto_168290 ?auto_168285 ) ) ( not ( = ?auto_168288 ?auto_168289 ) ) ( not ( = ?auto_168288 ?auto_168292 ) ) ( not ( = ?auto_168288 ?auto_168286 ) ) ( not ( = ?auto_168288 ?auto_168285 ) ) ( not ( = ?auto_168289 ?auto_168292 ) ) ( not ( = ?auto_168289 ?auto_168286 ) ) ( not ( = ?auto_168289 ?auto_168285 ) ) ( ON ?auto_168285 ?auto_168291 ) ( CLEAR ?auto_168285 ) ( not ( = ?auto_168285 ?auto_168291 ) ) ( not ( = ?auto_168286 ?auto_168291 ) ) ( not ( = ?auto_168292 ?auto_168291 ) ) ( not ( = ?auto_168287 ?auto_168291 ) ) ( not ( = ?auto_168293 ?auto_168291 ) ) ( not ( = ?auto_168290 ?auto_168291 ) ) ( not ( = ?auto_168288 ?auto_168291 ) ) ( not ( = ?auto_168289 ?auto_168291 ) ) ( HOLDING ?auto_168286 ) ( CLEAR ?auto_168292 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168287 ?auto_168293 ?auto_168290 ?auto_168288 ?auto_168289 ?auto_168292 ?auto_168286 )
      ( MAKE-2PILE ?auto_168285 ?auto_168286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168294 - BLOCK
      ?auto_168295 - BLOCK
    )
    :vars
    (
      ?auto_168296 - BLOCK
      ?auto_168298 - BLOCK
      ?auto_168300 - BLOCK
      ?auto_168302 - BLOCK
      ?auto_168299 - BLOCK
      ?auto_168297 - BLOCK
      ?auto_168301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168294 ?auto_168295 ) ) ( not ( = ?auto_168294 ?auto_168296 ) ) ( not ( = ?auto_168295 ?auto_168296 ) ) ( ON-TABLE ?auto_168298 ) ( ON ?auto_168300 ?auto_168298 ) ( ON ?auto_168302 ?auto_168300 ) ( ON ?auto_168299 ?auto_168302 ) ( ON ?auto_168297 ?auto_168299 ) ( ON ?auto_168296 ?auto_168297 ) ( not ( = ?auto_168298 ?auto_168300 ) ) ( not ( = ?auto_168298 ?auto_168302 ) ) ( not ( = ?auto_168298 ?auto_168299 ) ) ( not ( = ?auto_168298 ?auto_168297 ) ) ( not ( = ?auto_168298 ?auto_168296 ) ) ( not ( = ?auto_168298 ?auto_168295 ) ) ( not ( = ?auto_168298 ?auto_168294 ) ) ( not ( = ?auto_168300 ?auto_168302 ) ) ( not ( = ?auto_168300 ?auto_168299 ) ) ( not ( = ?auto_168300 ?auto_168297 ) ) ( not ( = ?auto_168300 ?auto_168296 ) ) ( not ( = ?auto_168300 ?auto_168295 ) ) ( not ( = ?auto_168300 ?auto_168294 ) ) ( not ( = ?auto_168302 ?auto_168299 ) ) ( not ( = ?auto_168302 ?auto_168297 ) ) ( not ( = ?auto_168302 ?auto_168296 ) ) ( not ( = ?auto_168302 ?auto_168295 ) ) ( not ( = ?auto_168302 ?auto_168294 ) ) ( not ( = ?auto_168299 ?auto_168297 ) ) ( not ( = ?auto_168299 ?auto_168296 ) ) ( not ( = ?auto_168299 ?auto_168295 ) ) ( not ( = ?auto_168299 ?auto_168294 ) ) ( not ( = ?auto_168297 ?auto_168296 ) ) ( not ( = ?auto_168297 ?auto_168295 ) ) ( not ( = ?auto_168297 ?auto_168294 ) ) ( ON ?auto_168294 ?auto_168301 ) ( not ( = ?auto_168294 ?auto_168301 ) ) ( not ( = ?auto_168295 ?auto_168301 ) ) ( not ( = ?auto_168296 ?auto_168301 ) ) ( not ( = ?auto_168298 ?auto_168301 ) ) ( not ( = ?auto_168300 ?auto_168301 ) ) ( not ( = ?auto_168302 ?auto_168301 ) ) ( not ( = ?auto_168299 ?auto_168301 ) ) ( not ( = ?auto_168297 ?auto_168301 ) ) ( CLEAR ?auto_168296 ) ( ON ?auto_168295 ?auto_168294 ) ( CLEAR ?auto_168295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168301 ?auto_168294 )
      ( MAKE-2PILE ?auto_168294 ?auto_168295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168303 - BLOCK
      ?auto_168304 - BLOCK
    )
    :vars
    (
      ?auto_168309 - BLOCK
      ?auto_168306 - BLOCK
      ?auto_168307 - BLOCK
      ?auto_168305 - BLOCK
      ?auto_168308 - BLOCK
      ?auto_168310 - BLOCK
      ?auto_168311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168303 ?auto_168304 ) ) ( not ( = ?auto_168303 ?auto_168309 ) ) ( not ( = ?auto_168304 ?auto_168309 ) ) ( ON-TABLE ?auto_168306 ) ( ON ?auto_168307 ?auto_168306 ) ( ON ?auto_168305 ?auto_168307 ) ( ON ?auto_168308 ?auto_168305 ) ( ON ?auto_168310 ?auto_168308 ) ( not ( = ?auto_168306 ?auto_168307 ) ) ( not ( = ?auto_168306 ?auto_168305 ) ) ( not ( = ?auto_168306 ?auto_168308 ) ) ( not ( = ?auto_168306 ?auto_168310 ) ) ( not ( = ?auto_168306 ?auto_168309 ) ) ( not ( = ?auto_168306 ?auto_168304 ) ) ( not ( = ?auto_168306 ?auto_168303 ) ) ( not ( = ?auto_168307 ?auto_168305 ) ) ( not ( = ?auto_168307 ?auto_168308 ) ) ( not ( = ?auto_168307 ?auto_168310 ) ) ( not ( = ?auto_168307 ?auto_168309 ) ) ( not ( = ?auto_168307 ?auto_168304 ) ) ( not ( = ?auto_168307 ?auto_168303 ) ) ( not ( = ?auto_168305 ?auto_168308 ) ) ( not ( = ?auto_168305 ?auto_168310 ) ) ( not ( = ?auto_168305 ?auto_168309 ) ) ( not ( = ?auto_168305 ?auto_168304 ) ) ( not ( = ?auto_168305 ?auto_168303 ) ) ( not ( = ?auto_168308 ?auto_168310 ) ) ( not ( = ?auto_168308 ?auto_168309 ) ) ( not ( = ?auto_168308 ?auto_168304 ) ) ( not ( = ?auto_168308 ?auto_168303 ) ) ( not ( = ?auto_168310 ?auto_168309 ) ) ( not ( = ?auto_168310 ?auto_168304 ) ) ( not ( = ?auto_168310 ?auto_168303 ) ) ( ON ?auto_168303 ?auto_168311 ) ( not ( = ?auto_168303 ?auto_168311 ) ) ( not ( = ?auto_168304 ?auto_168311 ) ) ( not ( = ?auto_168309 ?auto_168311 ) ) ( not ( = ?auto_168306 ?auto_168311 ) ) ( not ( = ?auto_168307 ?auto_168311 ) ) ( not ( = ?auto_168305 ?auto_168311 ) ) ( not ( = ?auto_168308 ?auto_168311 ) ) ( not ( = ?auto_168310 ?auto_168311 ) ) ( ON ?auto_168304 ?auto_168303 ) ( CLEAR ?auto_168304 ) ( ON-TABLE ?auto_168311 ) ( HOLDING ?auto_168309 ) ( CLEAR ?auto_168310 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168306 ?auto_168307 ?auto_168305 ?auto_168308 ?auto_168310 ?auto_168309 )
      ( MAKE-2PILE ?auto_168303 ?auto_168304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168312 - BLOCK
      ?auto_168313 - BLOCK
    )
    :vars
    (
      ?auto_168316 - BLOCK
      ?auto_168320 - BLOCK
      ?auto_168319 - BLOCK
      ?auto_168315 - BLOCK
      ?auto_168318 - BLOCK
      ?auto_168317 - BLOCK
      ?auto_168314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168312 ?auto_168313 ) ) ( not ( = ?auto_168312 ?auto_168316 ) ) ( not ( = ?auto_168313 ?auto_168316 ) ) ( ON-TABLE ?auto_168320 ) ( ON ?auto_168319 ?auto_168320 ) ( ON ?auto_168315 ?auto_168319 ) ( ON ?auto_168318 ?auto_168315 ) ( ON ?auto_168317 ?auto_168318 ) ( not ( = ?auto_168320 ?auto_168319 ) ) ( not ( = ?auto_168320 ?auto_168315 ) ) ( not ( = ?auto_168320 ?auto_168318 ) ) ( not ( = ?auto_168320 ?auto_168317 ) ) ( not ( = ?auto_168320 ?auto_168316 ) ) ( not ( = ?auto_168320 ?auto_168313 ) ) ( not ( = ?auto_168320 ?auto_168312 ) ) ( not ( = ?auto_168319 ?auto_168315 ) ) ( not ( = ?auto_168319 ?auto_168318 ) ) ( not ( = ?auto_168319 ?auto_168317 ) ) ( not ( = ?auto_168319 ?auto_168316 ) ) ( not ( = ?auto_168319 ?auto_168313 ) ) ( not ( = ?auto_168319 ?auto_168312 ) ) ( not ( = ?auto_168315 ?auto_168318 ) ) ( not ( = ?auto_168315 ?auto_168317 ) ) ( not ( = ?auto_168315 ?auto_168316 ) ) ( not ( = ?auto_168315 ?auto_168313 ) ) ( not ( = ?auto_168315 ?auto_168312 ) ) ( not ( = ?auto_168318 ?auto_168317 ) ) ( not ( = ?auto_168318 ?auto_168316 ) ) ( not ( = ?auto_168318 ?auto_168313 ) ) ( not ( = ?auto_168318 ?auto_168312 ) ) ( not ( = ?auto_168317 ?auto_168316 ) ) ( not ( = ?auto_168317 ?auto_168313 ) ) ( not ( = ?auto_168317 ?auto_168312 ) ) ( ON ?auto_168312 ?auto_168314 ) ( not ( = ?auto_168312 ?auto_168314 ) ) ( not ( = ?auto_168313 ?auto_168314 ) ) ( not ( = ?auto_168316 ?auto_168314 ) ) ( not ( = ?auto_168320 ?auto_168314 ) ) ( not ( = ?auto_168319 ?auto_168314 ) ) ( not ( = ?auto_168315 ?auto_168314 ) ) ( not ( = ?auto_168318 ?auto_168314 ) ) ( not ( = ?auto_168317 ?auto_168314 ) ) ( ON ?auto_168313 ?auto_168312 ) ( ON-TABLE ?auto_168314 ) ( CLEAR ?auto_168317 ) ( ON ?auto_168316 ?auto_168313 ) ( CLEAR ?auto_168316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168314 ?auto_168312 ?auto_168313 )
      ( MAKE-2PILE ?auto_168312 ?auto_168313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168321 - BLOCK
      ?auto_168322 - BLOCK
    )
    :vars
    (
      ?auto_168324 - BLOCK
      ?auto_168329 - BLOCK
      ?auto_168323 - BLOCK
      ?auto_168326 - BLOCK
      ?auto_168327 - BLOCK
      ?auto_168325 - BLOCK
      ?auto_168328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168321 ?auto_168322 ) ) ( not ( = ?auto_168321 ?auto_168324 ) ) ( not ( = ?auto_168322 ?auto_168324 ) ) ( ON-TABLE ?auto_168329 ) ( ON ?auto_168323 ?auto_168329 ) ( ON ?auto_168326 ?auto_168323 ) ( ON ?auto_168327 ?auto_168326 ) ( not ( = ?auto_168329 ?auto_168323 ) ) ( not ( = ?auto_168329 ?auto_168326 ) ) ( not ( = ?auto_168329 ?auto_168327 ) ) ( not ( = ?auto_168329 ?auto_168325 ) ) ( not ( = ?auto_168329 ?auto_168324 ) ) ( not ( = ?auto_168329 ?auto_168322 ) ) ( not ( = ?auto_168329 ?auto_168321 ) ) ( not ( = ?auto_168323 ?auto_168326 ) ) ( not ( = ?auto_168323 ?auto_168327 ) ) ( not ( = ?auto_168323 ?auto_168325 ) ) ( not ( = ?auto_168323 ?auto_168324 ) ) ( not ( = ?auto_168323 ?auto_168322 ) ) ( not ( = ?auto_168323 ?auto_168321 ) ) ( not ( = ?auto_168326 ?auto_168327 ) ) ( not ( = ?auto_168326 ?auto_168325 ) ) ( not ( = ?auto_168326 ?auto_168324 ) ) ( not ( = ?auto_168326 ?auto_168322 ) ) ( not ( = ?auto_168326 ?auto_168321 ) ) ( not ( = ?auto_168327 ?auto_168325 ) ) ( not ( = ?auto_168327 ?auto_168324 ) ) ( not ( = ?auto_168327 ?auto_168322 ) ) ( not ( = ?auto_168327 ?auto_168321 ) ) ( not ( = ?auto_168325 ?auto_168324 ) ) ( not ( = ?auto_168325 ?auto_168322 ) ) ( not ( = ?auto_168325 ?auto_168321 ) ) ( ON ?auto_168321 ?auto_168328 ) ( not ( = ?auto_168321 ?auto_168328 ) ) ( not ( = ?auto_168322 ?auto_168328 ) ) ( not ( = ?auto_168324 ?auto_168328 ) ) ( not ( = ?auto_168329 ?auto_168328 ) ) ( not ( = ?auto_168323 ?auto_168328 ) ) ( not ( = ?auto_168326 ?auto_168328 ) ) ( not ( = ?auto_168327 ?auto_168328 ) ) ( not ( = ?auto_168325 ?auto_168328 ) ) ( ON ?auto_168322 ?auto_168321 ) ( ON-TABLE ?auto_168328 ) ( ON ?auto_168324 ?auto_168322 ) ( CLEAR ?auto_168324 ) ( HOLDING ?auto_168325 ) ( CLEAR ?auto_168327 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168329 ?auto_168323 ?auto_168326 ?auto_168327 ?auto_168325 )
      ( MAKE-2PILE ?auto_168321 ?auto_168322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168330 - BLOCK
      ?auto_168331 - BLOCK
    )
    :vars
    (
      ?auto_168332 - BLOCK
      ?auto_168338 - BLOCK
      ?auto_168337 - BLOCK
      ?auto_168335 - BLOCK
      ?auto_168333 - BLOCK
      ?auto_168336 - BLOCK
      ?auto_168334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168330 ?auto_168331 ) ) ( not ( = ?auto_168330 ?auto_168332 ) ) ( not ( = ?auto_168331 ?auto_168332 ) ) ( ON-TABLE ?auto_168338 ) ( ON ?auto_168337 ?auto_168338 ) ( ON ?auto_168335 ?auto_168337 ) ( ON ?auto_168333 ?auto_168335 ) ( not ( = ?auto_168338 ?auto_168337 ) ) ( not ( = ?auto_168338 ?auto_168335 ) ) ( not ( = ?auto_168338 ?auto_168333 ) ) ( not ( = ?auto_168338 ?auto_168336 ) ) ( not ( = ?auto_168338 ?auto_168332 ) ) ( not ( = ?auto_168338 ?auto_168331 ) ) ( not ( = ?auto_168338 ?auto_168330 ) ) ( not ( = ?auto_168337 ?auto_168335 ) ) ( not ( = ?auto_168337 ?auto_168333 ) ) ( not ( = ?auto_168337 ?auto_168336 ) ) ( not ( = ?auto_168337 ?auto_168332 ) ) ( not ( = ?auto_168337 ?auto_168331 ) ) ( not ( = ?auto_168337 ?auto_168330 ) ) ( not ( = ?auto_168335 ?auto_168333 ) ) ( not ( = ?auto_168335 ?auto_168336 ) ) ( not ( = ?auto_168335 ?auto_168332 ) ) ( not ( = ?auto_168335 ?auto_168331 ) ) ( not ( = ?auto_168335 ?auto_168330 ) ) ( not ( = ?auto_168333 ?auto_168336 ) ) ( not ( = ?auto_168333 ?auto_168332 ) ) ( not ( = ?auto_168333 ?auto_168331 ) ) ( not ( = ?auto_168333 ?auto_168330 ) ) ( not ( = ?auto_168336 ?auto_168332 ) ) ( not ( = ?auto_168336 ?auto_168331 ) ) ( not ( = ?auto_168336 ?auto_168330 ) ) ( ON ?auto_168330 ?auto_168334 ) ( not ( = ?auto_168330 ?auto_168334 ) ) ( not ( = ?auto_168331 ?auto_168334 ) ) ( not ( = ?auto_168332 ?auto_168334 ) ) ( not ( = ?auto_168338 ?auto_168334 ) ) ( not ( = ?auto_168337 ?auto_168334 ) ) ( not ( = ?auto_168335 ?auto_168334 ) ) ( not ( = ?auto_168333 ?auto_168334 ) ) ( not ( = ?auto_168336 ?auto_168334 ) ) ( ON ?auto_168331 ?auto_168330 ) ( ON-TABLE ?auto_168334 ) ( ON ?auto_168332 ?auto_168331 ) ( CLEAR ?auto_168333 ) ( ON ?auto_168336 ?auto_168332 ) ( CLEAR ?auto_168336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168334 ?auto_168330 ?auto_168331 ?auto_168332 )
      ( MAKE-2PILE ?auto_168330 ?auto_168331 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168339 - BLOCK
      ?auto_168340 - BLOCK
    )
    :vars
    (
      ?auto_168345 - BLOCK
      ?auto_168344 - BLOCK
      ?auto_168343 - BLOCK
      ?auto_168347 - BLOCK
      ?auto_168342 - BLOCK
      ?auto_168341 - BLOCK
      ?auto_168346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168339 ?auto_168340 ) ) ( not ( = ?auto_168339 ?auto_168345 ) ) ( not ( = ?auto_168340 ?auto_168345 ) ) ( ON-TABLE ?auto_168344 ) ( ON ?auto_168343 ?auto_168344 ) ( ON ?auto_168347 ?auto_168343 ) ( not ( = ?auto_168344 ?auto_168343 ) ) ( not ( = ?auto_168344 ?auto_168347 ) ) ( not ( = ?auto_168344 ?auto_168342 ) ) ( not ( = ?auto_168344 ?auto_168341 ) ) ( not ( = ?auto_168344 ?auto_168345 ) ) ( not ( = ?auto_168344 ?auto_168340 ) ) ( not ( = ?auto_168344 ?auto_168339 ) ) ( not ( = ?auto_168343 ?auto_168347 ) ) ( not ( = ?auto_168343 ?auto_168342 ) ) ( not ( = ?auto_168343 ?auto_168341 ) ) ( not ( = ?auto_168343 ?auto_168345 ) ) ( not ( = ?auto_168343 ?auto_168340 ) ) ( not ( = ?auto_168343 ?auto_168339 ) ) ( not ( = ?auto_168347 ?auto_168342 ) ) ( not ( = ?auto_168347 ?auto_168341 ) ) ( not ( = ?auto_168347 ?auto_168345 ) ) ( not ( = ?auto_168347 ?auto_168340 ) ) ( not ( = ?auto_168347 ?auto_168339 ) ) ( not ( = ?auto_168342 ?auto_168341 ) ) ( not ( = ?auto_168342 ?auto_168345 ) ) ( not ( = ?auto_168342 ?auto_168340 ) ) ( not ( = ?auto_168342 ?auto_168339 ) ) ( not ( = ?auto_168341 ?auto_168345 ) ) ( not ( = ?auto_168341 ?auto_168340 ) ) ( not ( = ?auto_168341 ?auto_168339 ) ) ( ON ?auto_168339 ?auto_168346 ) ( not ( = ?auto_168339 ?auto_168346 ) ) ( not ( = ?auto_168340 ?auto_168346 ) ) ( not ( = ?auto_168345 ?auto_168346 ) ) ( not ( = ?auto_168344 ?auto_168346 ) ) ( not ( = ?auto_168343 ?auto_168346 ) ) ( not ( = ?auto_168347 ?auto_168346 ) ) ( not ( = ?auto_168342 ?auto_168346 ) ) ( not ( = ?auto_168341 ?auto_168346 ) ) ( ON ?auto_168340 ?auto_168339 ) ( ON-TABLE ?auto_168346 ) ( ON ?auto_168345 ?auto_168340 ) ( ON ?auto_168341 ?auto_168345 ) ( CLEAR ?auto_168341 ) ( HOLDING ?auto_168342 ) ( CLEAR ?auto_168347 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168344 ?auto_168343 ?auto_168347 ?auto_168342 )
      ( MAKE-2PILE ?auto_168339 ?auto_168340 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168348 - BLOCK
      ?auto_168349 - BLOCK
    )
    :vars
    (
      ?auto_168353 - BLOCK
      ?auto_168350 - BLOCK
      ?auto_168354 - BLOCK
      ?auto_168351 - BLOCK
      ?auto_168352 - BLOCK
      ?auto_168356 - BLOCK
      ?auto_168355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168348 ?auto_168349 ) ) ( not ( = ?auto_168348 ?auto_168353 ) ) ( not ( = ?auto_168349 ?auto_168353 ) ) ( ON-TABLE ?auto_168350 ) ( ON ?auto_168354 ?auto_168350 ) ( ON ?auto_168351 ?auto_168354 ) ( not ( = ?auto_168350 ?auto_168354 ) ) ( not ( = ?auto_168350 ?auto_168351 ) ) ( not ( = ?auto_168350 ?auto_168352 ) ) ( not ( = ?auto_168350 ?auto_168356 ) ) ( not ( = ?auto_168350 ?auto_168353 ) ) ( not ( = ?auto_168350 ?auto_168349 ) ) ( not ( = ?auto_168350 ?auto_168348 ) ) ( not ( = ?auto_168354 ?auto_168351 ) ) ( not ( = ?auto_168354 ?auto_168352 ) ) ( not ( = ?auto_168354 ?auto_168356 ) ) ( not ( = ?auto_168354 ?auto_168353 ) ) ( not ( = ?auto_168354 ?auto_168349 ) ) ( not ( = ?auto_168354 ?auto_168348 ) ) ( not ( = ?auto_168351 ?auto_168352 ) ) ( not ( = ?auto_168351 ?auto_168356 ) ) ( not ( = ?auto_168351 ?auto_168353 ) ) ( not ( = ?auto_168351 ?auto_168349 ) ) ( not ( = ?auto_168351 ?auto_168348 ) ) ( not ( = ?auto_168352 ?auto_168356 ) ) ( not ( = ?auto_168352 ?auto_168353 ) ) ( not ( = ?auto_168352 ?auto_168349 ) ) ( not ( = ?auto_168352 ?auto_168348 ) ) ( not ( = ?auto_168356 ?auto_168353 ) ) ( not ( = ?auto_168356 ?auto_168349 ) ) ( not ( = ?auto_168356 ?auto_168348 ) ) ( ON ?auto_168348 ?auto_168355 ) ( not ( = ?auto_168348 ?auto_168355 ) ) ( not ( = ?auto_168349 ?auto_168355 ) ) ( not ( = ?auto_168353 ?auto_168355 ) ) ( not ( = ?auto_168350 ?auto_168355 ) ) ( not ( = ?auto_168354 ?auto_168355 ) ) ( not ( = ?auto_168351 ?auto_168355 ) ) ( not ( = ?auto_168352 ?auto_168355 ) ) ( not ( = ?auto_168356 ?auto_168355 ) ) ( ON ?auto_168349 ?auto_168348 ) ( ON-TABLE ?auto_168355 ) ( ON ?auto_168353 ?auto_168349 ) ( ON ?auto_168356 ?auto_168353 ) ( CLEAR ?auto_168351 ) ( ON ?auto_168352 ?auto_168356 ) ( CLEAR ?auto_168352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168355 ?auto_168348 ?auto_168349 ?auto_168353 ?auto_168356 )
      ( MAKE-2PILE ?auto_168348 ?auto_168349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168357 - BLOCK
      ?auto_168358 - BLOCK
    )
    :vars
    (
      ?auto_168361 - BLOCK
      ?auto_168364 - BLOCK
      ?auto_168359 - BLOCK
      ?auto_168363 - BLOCK
      ?auto_168362 - BLOCK
      ?auto_168365 - BLOCK
      ?auto_168360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168357 ?auto_168358 ) ) ( not ( = ?auto_168357 ?auto_168361 ) ) ( not ( = ?auto_168358 ?auto_168361 ) ) ( ON-TABLE ?auto_168364 ) ( ON ?auto_168359 ?auto_168364 ) ( not ( = ?auto_168364 ?auto_168359 ) ) ( not ( = ?auto_168364 ?auto_168363 ) ) ( not ( = ?auto_168364 ?auto_168362 ) ) ( not ( = ?auto_168364 ?auto_168365 ) ) ( not ( = ?auto_168364 ?auto_168361 ) ) ( not ( = ?auto_168364 ?auto_168358 ) ) ( not ( = ?auto_168364 ?auto_168357 ) ) ( not ( = ?auto_168359 ?auto_168363 ) ) ( not ( = ?auto_168359 ?auto_168362 ) ) ( not ( = ?auto_168359 ?auto_168365 ) ) ( not ( = ?auto_168359 ?auto_168361 ) ) ( not ( = ?auto_168359 ?auto_168358 ) ) ( not ( = ?auto_168359 ?auto_168357 ) ) ( not ( = ?auto_168363 ?auto_168362 ) ) ( not ( = ?auto_168363 ?auto_168365 ) ) ( not ( = ?auto_168363 ?auto_168361 ) ) ( not ( = ?auto_168363 ?auto_168358 ) ) ( not ( = ?auto_168363 ?auto_168357 ) ) ( not ( = ?auto_168362 ?auto_168365 ) ) ( not ( = ?auto_168362 ?auto_168361 ) ) ( not ( = ?auto_168362 ?auto_168358 ) ) ( not ( = ?auto_168362 ?auto_168357 ) ) ( not ( = ?auto_168365 ?auto_168361 ) ) ( not ( = ?auto_168365 ?auto_168358 ) ) ( not ( = ?auto_168365 ?auto_168357 ) ) ( ON ?auto_168357 ?auto_168360 ) ( not ( = ?auto_168357 ?auto_168360 ) ) ( not ( = ?auto_168358 ?auto_168360 ) ) ( not ( = ?auto_168361 ?auto_168360 ) ) ( not ( = ?auto_168364 ?auto_168360 ) ) ( not ( = ?auto_168359 ?auto_168360 ) ) ( not ( = ?auto_168363 ?auto_168360 ) ) ( not ( = ?auto_168362 ?auto_168360 ) ) ( not ( = ?auto_168365 ?auto_168360 ) ) ( ON ?auto_168358 ?auto_168357 ) ( ON-TABLE ?auto_168360 ) ( ON ?auto_168361 ?auto_168358 ) ( ON ?auto_168365 ?auto_168361 ) ( ON ?auto_168362 ?auto_168365 ) ( CLEAR ?auto_168362 ) ( HOLDING ?auto_168363 ) ( CLEAR ?auto_168359 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168364 ?auto_168359 ?auto_168363 )
      ( MAKE-2PILE ?auto_168357 ?auto_168358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168366 - BLOCK
      ?auto_168367 - BLOCK
    )
    :vars
    (
      ?auto_168371 - BLOCK
      ?auto_168370 - BLOCK
      ?auto_168373 - BLOCK
      ?auto_168372 - BLOCK
      ?auto_168374 - BLOCK
      ?auto_168368 - BLOCK
      ?auto_168369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168366 ?auto_168367 ) ) ( not ( = ?auto_168366 ?auto_168371 ) ) ( not ( = ?auto_168367 ?auto_168371 ) ) ( ON-TABLE ?auto_168370 ) ( ON ?auto_168373 ?auto_168370 ) ( not ( = ?auto_168370 ?auto_168373 ) ) ( not ( = ?auto_168370 ?auto_168372 ) ) ( not ( = ?auto_168370 ?auto_168374 ) ) ( not ( = ?auto_168370 ?auto_168368 ) ) ( not ( = ?auto_168370 ?auto_168371 ) ) ( not ( = ?auto_168370 ?auto_168367 ) ) ( not ( = ?auto_168370 ?auto_168366 ) ) ( not ( = ?auto_168373 ?auto_168372 ) ) ( not ( = ?auto_168373 ?auto_168374 ) ) ( not ( = ?auto_168373 ?auto_168368 ) ) ( not ( = ?auto_168373 ?auto_168371 ) ) ( not ( = ?auto_168373 ?auto_168367 ) ) ( not ( = ?auto_168373 ?auto_168366 ) ) ( not ( = ?auto_168372 ?auto_168374 ) ) ( not ( = ?auto_168372 ?auto_168368 ) ) ( not ( = ?auto_168372 ?auto_168371 ) ) ( not ( = ?auto_168372 ?auto_168367 ) ) ( not ( = ?auto_168372 ?auto_168366 ) ) ( not ( = ?auto_168374 ?auto_168368 ) ) ( not ( = ?auto_168374 ?auto_168371 ) ) ( not ( = ?auto_168374 ?auto_168367 ) ) ( not ( = ?auto_168374 ?auto_168366 ) ) ( not ( = ?auto_168368 ?auto_168371 ) ) ( not ( = ?auto_168368 ?auto_168367 ) ) ( not ( = ?auto_168368 ?auto_168366 ) ) ( ON ?auto_168366 ?auto_168369 ) ( not ( = ?auto_168366 ?auto_168369 ) ) ( not ( = ?auto_168367 ?auto_168369 ) ) ( not ( = ?auto_168371 ?auto_168369 ) ) ( not ( = ?auto_168370 ?auto_168369 ) ) ( not ( = ?auto_168373 ?auto_168369 ) ) ( not ( = ?auto_168372 ?auto_168369 ) ) ( not ( = ?auto_168374 ?auto_168369 ) ) ( not ( = ?auto_168368 ?auto_168369 ) ) ( ON ?auto_168367 ?auto_168366 ) ( ON-TABLE ?auto_168369 ) ( ON ?auto_168371 ?auto_168367 ) ( ON ?auto_168368 ?auto_168371 ) ( ON ?auto_168374 ?auto_168368 ) ( CLEAR ?auto_168373 ) ( ON ?auto_168372 ?auto_168374 ) ( CLEAR ?auto_168372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168369 ?auto_168366 ?auto_168367 ?auto_168371 ?auto_168368 ?auto_168374 )
      ( MAKE-2PILE ?auto_168366 ?auto_168367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168375 - BLOCK
      ?auto_168376 - BLOCK
    )
    :vars
    (
      ?auto_168383 - BLOCK
      ?auto_168381 - BLOCK
      ?auto_168382 - BLOCK
      ?auto_168379 - BLOCK
      ?auto_168380 - BLOCK
      ?auto_168378 - BLOCK
      ?auto_168377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168375 ?auto_168376 ) ) ( not ( = ?auto_168375 ?auto_168383 ) ) ( not ( = ?auto_168376 ?auto_168383 ) ) ( ON-TABLE ?auto_168381 ) ( not ( = ?auto_168381 ?auto_168382 ) ) ( not ( = ?auto_168381 ?auto_168379 ) ) ( not ( = ?auto_168381 ?auto_168380 ) ) ( not ( = ?auto_168381 ?auto_168378 ) ) ( not ( = ?auto_168381 ?auto_168383 ) ) ( not ( = ?auto_168381 ?auto_168376 ) ) ( not ( = ?auto_168381 ?auto_168375 ) ) ( not ( = ?auto_168382 ?auto_168379 ) ) ( not ( = ?auto_168382 ?auto_168380 ) ) ( not ( = ?auto_168382 ?auto_168378 ) ) ( not ( = ?auto_168382 ?auto_168383 ) ) ( not ( = ?auto_168382 ?auto_168376 ) ) ( not ( = ?auto_168382 ?auto_168375 ) ) ( not ( = ?auto_168379 ?auto_168380 ) ) ( not ( = ?auto_168379 ?auto_168378 ) ) ( not ( = ?auto_168379 ?auto_168383 ) ) ( not ( = ?auto_168379 ?auto_168376 ) ) ( not ( = ?auto_168379 ?auto_168375 ) ) ( not ( = ?auto_168380 ?auto_168378 ) ) ( not ( = ?auto_168380 ?auto_168383 ) ) ( not ( = ?auto_168380 ?auto_168376 ) ) ( not ( = ?auto_168380 ?auto_168375 ) ) ( not ( = ?auto_168378 ?auto_168383 ) ) ( not ( = ?auto_168378 ?auto_168376 ) ) ( not ( = ?auto_168378 ?auto_168375 ) ) ( ON ?auto_168375 ?auto_168377 ) ( not ( = ?auto_168375 ?auto_168377 ) ) ( not ( = ?auto_168376 ?auto_168377 ) ) ( not ( = ?auto_168383 ?auto_168377 ) ) ( not ( = ?auto_168381 ?auto_168377 ) ) ( not ( = ?auto_168382 ?auto_168377 ) ) ( not ( = ?auto_168379 ?auto_168377 ) ) ( not ( = ?auto_168380 ?auto_168377 ) ) ( not ( = ?auto_168378 ?auto_168377 ) ) ( ON ?auto_168376 ?auto_168375 ) ( ON-TABLE ?auto_168377 ) ( ON ?auto_168383 ?auto_168376 ) ( ON ?auto_168378 ?auto_168383 ) ( ON ?auto_168380 ?auto_168378 ) ( ON ?auto_168379 ?auto_168380 ) ( CLEAR ?auto_168379 ) ( HOLDING ?auto_168382 ) ( CLEAR ?auto_168381 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168381 ?auto_168382 )
      ( MAKE-2PILE ?auto_168375 ?auto_168376 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168384 - BLOCK
      ?auto_168385 - BLOCK
    )
    :vars
    (
      ?auto_168389 - BLOCK
      ?auto_168387 - BLOCK
      ?auto_168386 - BLOCK
      ?auto_168390 - BLOCK
      ?auto_168391 - BLOCK
      ?auto_168392 - BLOCK
      ?auto_168388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168384 ?auto_168385 ) ) ( not ( = ?auto_168384 ?auto_168389 ) ) ( not ( = ?auto_168385 ?auto_168389 ) ) ( ON-TABLE ?auto_168387 ) ( not ( = ?auto_168387 ?auto_168386 ) ) ( not ( = ?auto_168387 ?auto_168390 ) ) ( not ( = ?auto_168387 ?auto_168391 ) ) ( not ( = ?auto_168387 ?auto_168392 ) ) ( not ( = ?auto_168387 ?auto_168389 ) ) ( not ( = ?auto_168387 ?auto_168385 ) ) ( not ( = ?auto_168387 ?auto_168384 ) ) ( not ( = ?auto_168386 ?auto_168390 ) ) ( not ( = ?auto_168386 ?auto_168391 ) ) ( not ( = ?auto_168386 ?auto_168392 ) ) ( not ( = ?auto_168386 ?auto_168389 ) ) ( not ( = ?auto_168386 ?auto_168385 ) ) ( not ( = ?auto_168386 ?auto_168384 ) ) ( not ( = ?auto_168390 ?auto_168391 ) ) ( not ( = ?auto_168390 ?auto_168392 ) ) ( not ( = ?auto_168390 ?auto_168389 ) ) ( not ( = ?auto_168390 ?auto_168385 ) ) ( not ( = ?auto_168390 ?auto_168384 ) ) ( not ( = ?auto_168391 ?auto_168392 ) ) ( not ( = ?auto_168391 ?auto_168389 ) ) ( not ( = ?auto_168391 ?auto_168385 ) ) ( not ( = ?auto_168391 ?auto_168384 ) ) ( not ( = ?auto_168392 ?auto_168389 ) ) ( not ( = ?auto_168392 ?auto_168385 ) ) ( not ( = ?auto_168392 ?auto_168384 ) ) ( ON ?auto_168384 ?auto_168388 ) ( not ( = ?auto_168384 ?auto_168388 ) ) ( not ( = ?auto_168385 ?auto_168388 ) ) ( not ( = ?auto_168389 ?auto_168388 ) ) ( not ( = ?auto_168387 ?auto_168388 ) ) ( not ( = ?auto_168386 ?auto_168388 ) ) ( not ( = ?auto_168390 ?auto_168388 ) ) ( not ( = ?auto_168391 ?auto_168388 ) ) ( not ( = ?auto_168392 ?auto_168388 ) ) ( ON ?auto_168385 ?auto_168384 ) ( ON-TABLE ?auto_168388 ) ( ON ?auto_168389 ?auto_168385 ) ( ON ?auto_168392 ?auto_168389 ) ( ON ?auto_168391 ?auto_168392 ) ( ON ?auto_168390 ?auto_168391 ) ( CLEAR ?auto_168387 ) ( ON ?auto_168386 ?auto_168390 ) ( CLEAR ?auto_168386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168388 ?auto_168384 ?auto_168385 ?auto_168389 ?auto_168392 ?auto_168391 ?auto_168390 )
      ( MAKE-2PILE ?auto_168384 ?auto_168385 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168393 - BLOCK
      ?auto_168394 - BLOCK
    )
    :vars
    (
      ?auto_168396 - BLOCK
      ?auto_168401 - BLOCK
      ?auto_168397 - BLOCK
      ?auto_168398 - BLOCK
      ?auto_168399 - BLOCK
      ?auto_168400 - BLOCK
      ?auto_168395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168393 ?auto_168394 ) ) ( not ( = ?auto_168393 ?auto_168396 ) ) ( not ( = ?auto_168394 ?auto_168396 ) ) ( not ( = ?auto_168401 ?auto_168397 ) ) ( not ( = ?auto_168401 ?auto_168398 ) ) ( not ( = ?auto_168401 ?auto_168399 ) ) ( not ( = ?auto_168401 ?auto_168400 ) ) ( not ( = ?auto_168401 ?auto_168396 ) ) ( not ( = ?auto_168401 ?auto_168394 ) ) ( not ( = ?auto_168401 ?auto_168393 ) ) ( not ( = ?auto_168397 ?auto_168398 ) ) ( not ( = ?auto_168397 ?auto_168399 ) ) ( not ( = ?auto_168397 ?auto_168400 ) ) ( not ( = ?auto_168397 ?auto_168396 ) ) ( not ( = ?auto_168397 ?auto_168394 ) ) ( not ( = ?auto_168397 ?auto_168393 ) ) ( not ( = ?auto_168398 ?auto_168399 ) ) ( not ( = ?auto_168398 ?auto_168400 ) ) ( not ( = ?auto_168398 ?auto_168396 ) ) ( not ( = ?auto_168398 ?auto_168394 ) ) ( not ( = ?auto_168398 ?auto_168393 ) ) ( not ( = ?auto_168399 ?auto_168400 ) ) ( not ( = ?auto_168399 ?auto_168396 ) ) ( not ( = ?auto_168399 ?auto_168394 ) ) ( not ( = ?auto_168399 ?auto_168393 ) ) ( not ( = ?auto_168400 ?auto_168396 ) ) ( not ( = ?auto_168400 ?auto_168394 ) ) ( not ( = ?auto_168400 ?auto_168393 ) ) ( ON ?auto_168393 ?auto_168395 ) ( not ( = ?auto_168393 ?auto_168395 ) ) ( not ( = ?auto_168394 ?auto_168395 ) ) ( not ( = ?auto_168396 ?auto_168395 ) ) ( not ( = ?auto_168401 ?auto_168395 ) ) ( not ( = ?auto_168397 ?auto_168395 ) ) ( not ( = ?auto_168398 ?auto_168395 ) ) ( not ( = ?auto_168399 ?auto_168395 ) ) ( not ( = ?auto_168400 ?auto_168395 ) ) ( ON ?auto_168394 ?auto_168393 ) ( ON-TABLE ?auto_168395 ) ( ON ?auto_168396 ?auto_168394 ) ( ON ?auto_168400 ?auto_168396 ) ( ON ?auto_168399 ?auto_168400 ) ( ON ?auto_168398 ?auto_168399 ) ( ON ?auto_168397 ?auto_168398 ) ( CLEAR ?auto_168397 ) ( HOLDING ?auto_168401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168401 )
      ( MAKE-2PILE ?auto_168393 ?auto_168394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_168402 - BLOCK
      ?auto_168403 - BLOCK
    )
    :vars
    (
      ?auto_168409 - BLOCK
      ?auto_168406 - BLOCK
      ?auto_168408 - BLOCK
      ?auto_168404 - BLOCK
      ?auto_168410 - BLOCK
      ?auto_168405 - BLOCK
      ?auto_168407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168402 ?auto_168403 ) ) ( not ( = ?auto_168402 ?auto_168409 ) ) ( not ( = ?auto_168403 ?auto_168409 ) ) ( not ( = ?auto_168406 ?auto_168408 ) ) ( not ( = ?auto_168406 ?auto_168404 ) ) ( not ( = ?auto_168406 ?auto_168410 ) ) ( not ( = ?auto_168406 ?auto_168405 ) ) ( not ( = ?auto_168406 ?auto_168409 ) ) ( not ( = ?auto_168406 ?auto_168403 ) ) ( not ( = ?auto_168406 ?auto_168402 ) ) ( not ( = ?auto_168408 ?auto_168404 ) ) ( not ( = ?auto_168408 ?auto_168410 ) ) ( not ( = ?auto_168408 ?auto_168405 ) ) ( not ( = ?auto_168408 ?auto_168409 ) ) ( not ( = ?auto_168408 ?auto_168403 ) ) ( not ( = ?auto_168408 ?auto_168402 ) ) ( not ( = ?auto_168404 ?auto_168410 ) ) ( not ( = ?auto_168404 ?auto_168405 ) ) ( not ( = ?auto_168404 ?auto_168409 ) ) ( not ( = ?auto_168404 ?auto_168403 ) ) ( not ( = ?auto_168404 ?auto_168402 ) ) ( not ( = ?auto_168410 ?auto_168405 ) ) ( not ( = ?auto_168410 ?auto_168409 ) ) ( not ( = ?auto_168410 ?auto_168403 ) ) ( not ( = ?auto_168410 ?auto_168402 ) ) ( not ( = ?auto_168405 ?auto_168409 ) ) ( not ( = ?auto_168405 ?auto_168403 ) ) ( not ( = ?auto_168405 ?auto_168402 ) ) ( ON ?auto_168402 ?auto_168407 ) ( not ( = ?auto_168402 ?auto_168407 ) ) ( not ( = ?auto_168403 ?auto_168407 ) ) ( not ( = ?auto_168409 ?auto_168407 ) ) ( not ( = ?auto_168406 ?auto_168407 ) ) ( not ( = ?auto_168408 ?auto_168407 ) ) ( not ( = ?auto_168404 ?auto_168407 ) ) ( not ( = ?auto_168410 ?auto_168407 ) ) ( not ( = ?auto_168405 ?auto_168407 ) ) ( ON ?auto_168403 ?auto_168402 ) ( ON-TABLE ?auto_168407 ) ( ON ?auto_168409 ?auto_168403 ) ( ON ?auto_168405 ?auto_168409 ) ( ON ?auto_168410 ?auto_168405 ) ( ON ?auto_168404 ?auto_168410 ) ( ON ?auto_168408 ?auto_168404 ) ( ON ?auto_168406 ?auto_168408 ) ( CLEAR ?auto_168406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168407 ?auto_168402 ?auto_168403 ?auto_168409 ?auto_168405 ?auto_168410 ?auto_168404 ?auto_168408 )
      ( MAKE-2PILE ?auto_168402 ?auto_168403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168416 - BLOCK
      ?auto_168417 - BLOCK
      ?auto_168418 - BLOCK
      ?auto_168419 - BLOCK
      ?auto_168420 - BLOCK
    )
    :vars
    (
      ?auto_168421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168421 ?auto_168420 ) ( CLEAR ?auto_168421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168416 ) ( ON ?auto_168417 ?auto_168416 ) ( ON ?auto_168418 ?auto_168417 ) ( ON ?auto_168419 ?auto_168418 ) ( ON ?auto_168420 ?auto_168419 ) ( not ( = ?auto_168416 ?auto_168417 ) ) ( not ( = ?auto_168416 ?auto_168418 ) ) ( not ( = ?auto_168416 ?auto_168419 ) ) ( not ( = ?auto_168416 ?auto_168420 ) ) ( not ( = ?auto_168416 ?auto_168421 ) ) ( not ( = ?auto_168417 ?auto_168418 ) ) ( not ( = ?auto_168417 ?auto_168419 ) ) ( not ( = ?auto_168417 ?auto_168420 ) ) ( not ( = ?auto_168417 ?auto_168421 ) ) ( not ( = ?auto_168418 ?auto_168419 ) ) ( not ( = ?auto_168418 ?auto_168420 ) ) ( not ( = ?auto_168418 ?auto_168421 ) ) ( not ( = ?auto_168419 ?auto_168420 ) ) ( not ( = ?auto_168419 ?auto_168421 ) ) ( not ( = ?auto_168420 ?auto_168421 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168421 ?auto_168420 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168422 - BLOCK
      ?auto_168423 - BLOCK
      ?auto_168424 - BLOCK
      ?auto_168425 - BLOCK
      ?auto_168426 - BLOCK
    )
    :vars
    (
      ?auto_168427 - BLOCK
      ?auto_168428 - BLOCK
      ?auto_168429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168427 ?auto_168426 ) ( CLEAR ?auto_168427 ) ( ON-TABLE ?auto_168422 ) ( ON ?auto_168423 ?auto_168422 ) ( ON ?auto_168424 ?auto_168423 ) ( ON ?auto_168425 ?auto_168424 ) ( ON ?auto_168426 ?auto_168425 ) ( not ( = ?auto_168422 ?auto_168423 ) ) ( not ( = ?auto_168422 ?auto_168424 ) ) ( not ( = ?auto_168422 ?auto_168425 ) ) ( not ( = ?auto_168422 ?auto_168426 ) ) ( not ( = ?auto_168422 ?auto_168427 ) ) ( not ( = ?auto_168423 ?auto_168424 ) ) ( not ( = ?auto_168423 ?auto_168425 ) ) ( not ( = ?auto_168423 ?auto_168426 ) ) ( not ( = ?auto_168423 ?auto_168427 ) ) ( not ( = ?auto_168424 ?auto_168425 ) ) ( not ( = ?auto_168424 ?auto_168426 ) ) ( not ( = ?auto_168424 ?auto_168427 ) ) ( not ( = ?auto_168425 ?auto_168426 ) ) ( not ( = ?auto_168425 ?auto_168427 ) ) ( not ( = ?auto_168426 ?auto_168427 ) ) ( HOLDING ?auto_168428 ) ( CLEAR ?auto_168429 ) ( not ( = ?auto_168422 ?auto_168428 ) ) ( not ( = ?auto_168422 ?auto_168429 ) ) ( not ( = ?auto_168423 ?auto_168428 ) ) ( not ( = ?auto_168423 ?auto_168429 ) ) ( not ( = ?auto_168424 ?auto_168428 ) ) ( not ( = ?auto_168424 ?auto_168429 ) ) ( not ( = ?auto_168425 ?auto_168428 ) ) ( not ( = ?auto_168425 ?auto_168429 ) ) ( not ( = ?auto_168426 ?auto_168428 ) ) ( not ( = ?auto_168426 ?auto_168429 ) ) ( not ( = ?auto_168427 ?auto_168428 ) ) ( not ( = ?auto_168427 ?auto_168429 ) ) ( not ( = ?auto_168428 ?auto_168429 ) ) )
    :subtasks
    ( ( !STACK ?auto_168428 ?auto_168429 )
      ( MAKE-5PILE ?auto_168422 ?auto_168423 ?auto_168424 ?auto_168425 ?auto_168426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168430 - BLOCK
      ?auto_168431 - BLOCK
      ?auto_168432 - BLOCK
      ?auto_168433 - BLOCK
      ?auto_168434 - BLOCK
    )
    :vars
    (
      ?auto_168436 - BLOCK
      ?auto_168435 - BLOCK
      ?auto_168437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168436 ?auto_168434 ) ( ON-TABLE ?auto_168430 ) ( ON ?auto_168431 ?auto_168430 ) ( ON ?auto_168432 ?auto_168431 ) ( ON ?auto_168433 ?auto_168432 ) ( ON ?auto_168434 ?auto_168433 ) ( not ( = ?auto_168430 ?auto_168431 ) ) ( not ( = ?auto_168430 ?auto_168432 ) ) ( not ( = ?auto_168430 ?auto_168433 ) ) ( not ( = ?auto_168430 ?auto_168434 ) ) ( not ( = ?auto_168430 ?auto_168436 ) ) ( not ( = ?auto_168431 ?auto_168432 ) ) ( not ( = ?auto_168431 ?auto_168433 ) ) ( not ( = ?auto_168431 ?auto_168434 ) ) ( not ( = ?auto_168431 ?auto_168436 ) ) ( not ( = ?auto_168432 ?auto_168433 ) ) ( not ( = ?auto_168432 ?auto_168434 ) ) ( not ( = ?auto_168432 ?auto_168436 ) ) ( not ( = ?auto_168433 ?auto_168434 ) ) ( not ( = ?auto_168433 ?auto_168436 ) ) ( not ( = ?auto_168434 ?auto_168436 ) ) ( CLEAR ?auto_168435 ) ( not ( = ?auto_168430 ?auto_168437 ) ) ( not ( = ?auto_168430 ?auto_168435 ) ) ( not ( = ?auto_168431 ?auto_168437 ) ) ( not ( = ?auto_168431 ?auto_168435 ) ) ( not ( = ?auto_168432 ?auto_168437 ) ) ( not ( = ?auto_168432 ?auto_168435 ) ) ( not ( = ?auto_168433 ?auto_168437 ) ) ( not ( = ?auto_168433 ?auto_168435 ) ) ( not ( = ?auto_168434 ?auto_168437 ) ) ( not ( = ?auto_168434 ?auto_168435 ) ) ( not ( = ?auto_168436 ?auto_168437 ) ) ( not ( = ?auto_168436 ?auto_168435 ) ) ( not ( = ?auto_168437 ?auto_168435 ) ) ( ON ?auto_168437 ?auto_168436 ) ( CLEAR ?auto_168437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168430 ?auto_168431 ?auto_168432 ?auto_168433 ?auto_168434 ?auto_168436 )
      ( MAKE-5PILE ?auto_168430 ?auto_168431 ?auto_168432 ?auto_168433 ?auto_168434 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168438 - BLOCK
      ?auto_168439 - BLOCK
      ?auto_168440 - BLOCK
      ?auto_168441 - BLOCK
      ?auto_168442 - BLOCK
    )
    :vars
    (
      ?auto_168443 - BLOCK
      ?auto_168444 - BLOCK
      ?auto_168445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168443 ?auto_168442 ) ( ON-TABLE ?auto_168438 ) ( ON ?auto_168439 ?auto_168438 ) ( ON ?auto_168440 ?auto_168439 ) ( ON ?auto_168441 ?auto_168440 ) ( ON ?auto_168442 ?auto_168441 ) ( not ( = ?auto_168438 ?auto_168439 ) ) ( not ( = ?auto_168438 ?auto_168440 ) ) ( not ( = ?auto_168438 ?auto_168441 ) ) ( not ( = ?auto_168438 ?auto_168442 ) ) ( not ( = ?auto_168438 ?auto_168443 ) ) ( not ( = ?auto_168439 ?auto_168440 ) ) ( not ( = ?auto_168439 ?auto_168441 ) ) ( not ( = ?auto_168439 ?auto_168442 ) ) ( not ( = ?auto_168439 ?auto_168443 ) ) ( not ( = ?auto_168440 ?auto_168441 ) ) ( not ( = ?auto_168440 ?auto_168442 ) ) ( not ( = ?auto_168440 ?auto_168443 ) ) ( not ( = ?auto_168441 ?auto_168442 ) ) ( not ( = ?auto_168441 ?auto_168443 ) ) ( not ( = ?auto_168442 ?auto_168443 ) ) ( not ( = ?auto_168438 ?auto_168444 ) ) ( not ( = ?auto_168438 ?auto_168445 ) ) ( not ( = ?auto_168439 ?auto_168444 ) ) ( not ( = ?auto_168439 ?auto_168445 ) ) ( not ( = ?auto_168440 ?auto_168444 ) ) ( not ( = ?auto_168440 ?auto_168445 ) ) ( not ( = ?auto_168441 ?auto_168444 ) ) ( not ( = ?auto_168441 ?auto_168445 ) ) ( not ( = ?auto_168442 ?auto_168444 ) ) ( not ( = ?auto_168442 ?auto_168445 ) ) ( not ( = ?auto_168443 ?auto_168444 ) ) ( not ( = ?auto_168443 ?auto_168445 ) ) ( not ( = ?auto_168444 ?auto_168445 ) ) ( ON ?auto_168444 ?auto_168443 ) ( CLEAR ?auto_168444 ) ( HOLDING ?auto_168445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168445 )
      ( MAKE-5PILE ?auto_168438 ?auto_168439 ?auto_168440 ?auto_168441 ?auto_168442 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168446 - BLOCK
      ?auto_168447 - BLOCK
      ?auto_168448 - BLOCK
      ?auto_168449 - BLOCK
      ?auto_168450 - BLOCK
    )
    :vars
    (
      ?auto_168451 - BLOCK
      ?auto_168453 - BLOCK
      ?auto_168452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168451 ?auto_168450 ) ( ON-TABLE ?auto_168446 ) ( ON ?auto_168447 ?auto_168446 ) ( ON ?auto_168448 ?auto_168447 ) ( ON ?auto_168449 ?auto_168448 ) ( ON ?auto_168450 ?auto_168449 ) ( not ( = ?auto_168446 ?auto_168447 ) ) ( not ( = ?auto_168446 ?auto_168448 ) ) ( not ( = ?auto_168446 ?auto_168449 ) ) ( not ( = ?auto_168446 ?auto_168450 ) ) ( not ( = ?auto_168446 ?auto_168451 ) ) ( not ( = ?auto_168447 ?auto_168448 ) ) ( not ( = ?auto_168447 ?auto_168449 ) ) ( not ( = ?auto_168447 ?auto_168450 ) ) ( not ( = ?auto_168447 ?auto_168451 ) ) ( not ( = ?auto_168448 ?auto_168449 ) ) ( not ( = ?auto_168448 ?auto_168450 ) ) ( not ( = ?auto_168448 ?auto_168451 ) ) ( not ( = ?auto_168449 ?auto_168450 ) ) ( not ( = ?auto_168449 ?auto_168451 ) ) ( not ( = ?auto_168450 ?auto_168451 ) ) ( not ( = ?auto_168446 ?auto_168453 ) ) ( not ( = ?auto_168446 ?auto_168452 ) ) ( not ( = ?auto_168447 ?auto_168453 ) ) ( not ( = ?auto_168447 ?auto_168452 ) ) ( not ( = ?auto_168448 ?auto_168453 ) ) ( not ( = ?auto_168448 ?auto_168452 ) ) ( not ( = ?auto_168449 ?auto_168453 ) ) ( not ( = ?auto_168449 ?auto_168452 ) ) ( not ( = ?auto_168450 ?auto_168453 ) ) ( not ( = ?auto_168450 ?auto_168452 ) ) ( not ( = ?auto_168451 ?auto_168453 ) ) ( not ( = ?auto_168451 ?auto_168452 ) ) ( not ( = ?auto_168453 ?auto_168452 ) ) ( ON ?auto_168453 ?auto_168451 ) ( ON ?auto_168452 ?auto_168453 ) ( CLEAR ?auto_168452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168446 ?auto_168447 ?auto_168448 ?auto_168449 ?auto_168450 ?auto_168451 ?auto_168453 )
      ( MAKE-5PILE ?auto_168446 ?auto_168447 ?auto_168448 ?auto_168449 ?auto_168450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168454 - BLOCK
      ?auto_168455 - BLOCK
      ?auto_168456 - BLOCK
      ?auto_168457 - BLOCK
      ?auto_168458 - BLOCK
    )
    :vars
    (
      ?auto_168461 - BLOCK
      ?auto_168459 - BLOCK
      ?auto_168460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168461 ?auto_168458 ) ( ON-TABLE ?auto_168454 ) ( ON ?auto_168455 ?auto_168454 ) ( ON ?auto_168456 ?auto_168455 ) ( ON ?auto_168457 ?auto_168456 ) ( ON ?auto_168458 ?auto_168457 ) ( not ( = ?auto_168454 ?auto_168455 ) ) ( not ( = ?auto_168454 ?auto_168456 ) ) ( not ( = ?auto_168454 ?auto_168457 ) ) ( not ( = ?auto_168454 ?auto_168458 ) ) ( not ( = ?auto_168454 ?auto_168461 ) ) ( not ( = ?auto_168455 ?auto_168456 ) ) ( not ( = ?auto_168455 ?auto_168457 ) ) ( not ( = ?auto_168455 ?auto_168458 ) ) ( not ( = ?auto_168455 ?auto_168461 ) ) ( not ( = ?auto_168456 ?auto_168457 ) ) ( not ( = ?auto_168456 ?auto_168458 ) ) ( not ( = ?auto_168456 ?auto_168461 ) ) ( not ( = ?auto_168457 ?auto_168458 ) ) ( not ( = ?auto_168457 ?auto_168461 ) ) ( not ( = ?auto_168458 ?auto_168461 ) ) ( not ( = ?auto_168454 ?auto_168459 ) ) ( not ( = ?auto_168454 ?auto_168460 ) ) ( not ( = ?auto_168455 ?auto_168459 ) ) ( not ( = ?auto_168455 ?auto_168460 ) ) ( not ( = ?auto_168456 ?auto_168459 ) ) ( not ( = ?auto_168456 ?auto_168460 ) ) ( not ( = ?auto_168457 ?auto_168459 ) ) ( not ( = ?auto_168457 ?auto_168460 ) ) ( not ( = ?auto_168458 ?auto_168459 ) ) ( not ( = ?auto_168458 ?auto_168460 ) ) ( not ( = ?auto_168461 ?auto_168459 ) ) ( not ( = ?auto_168461 ?auto_168460 ) ) ( not ( = ?auto_168459 ?auto_168460 ) ) ( ON ?auto_168459 ?auto_168461 ) ( HOLDING ?auto_168460 ) ( CLEAR ?auto_168459 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168454 ?auto_168455 ?auto_168456 ?auto_168457 ?auto_168458 ?auto_168461 ?auto_168459 ?auto_168460 )
      ( MAKE-5PILE ?auto_168454 ?auto_168455 ?auto_168456 ?auto_168457 ?auto_168458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168462 - BLOCK
      ?auto_168463 - BLOCK
      ?auto_168464 - BLOCK
      ?auto_168465 - BLOCK
      ?auto_168466 - BLOCK
    )
    :vars
    (
      ?auto_168469 - BLOCK
      ?auto_168467 - BLOCK
      ?auto_168468 - BLOCK
      ?auto_168470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168469 ?auto_168466 ) ( ON-TABLE ?auto_168462 ) ( ON ?auto_168463 ?auto_168462 ) ( ON ?auto_168464 ?auto_168463 ) ( ON ?auto_168465 ?auto_168464 ) ( ON ?auto_168466 ?auto_168465 ) ( not ( = ?auto_168462 ?auto_168463 ) ) ( not ( = ?auto_168462 ?auto_168464 ) ) ( not ( = ?auto_168462 ?auto_168465 ) ) ( not ( = ?auto_168462 ?auto_168466 ) ) ( not ( = ?auto_168462 ?auto_168469 ) ) ( not ( = ?auto_168463 ?auto_168464 ) ) ( not ( = ?auto_168463 ?auto_168465 ) ) ( not ( = ?auto_168463 ?auto_168466 ) ) ( not ( = ?auto_168463 ?auto_168469 ) ) ( not ( = ?auto_168464 ?auto_168465 ) ) ( not ( = ?auto_168464 ?auto_168466 ) ) ( not ( = ?auto_168464 ?auto_168469 ) ) ( not ( = ?auto_168465 ?auto_168466 ) ) ( not ( = ?auto_168465 ?auto_168469 ) ) ( not ( = ?auto_168466 ?auto_168469 ) ) ( not ( = ?auto_168462 ?auto_168467 ) ) ( not ( = ?auto_168462 ?auto_168468 ) ) ( not ( = ?auto_168463 ?auto_168467 ) ) ( not ( = ?auto_168463 ?auto_168468 ) ) ( not ( = ?auto_168464 ?auto_168467 ) ) ( not ( = ?auto_168464 ?auto_168468 ) ) ( not ( = ?auto_168465 ?auto_168467 ) ) ( not ( = ?auto_168465 ?auto_168468 ) ) ( not ( = ?auto_168466 ?auto_168467 ) ) ( not ( = ?auto_168466 ?auto_168468 ) ) ( not ( = ?auto_168469 ?auto_168467 ) ) ( not ( = ?auto_168469 ?auto_168468 ) ) ( not ( = ?auto_168467 ?auto_168468 ) ) ( ON ?auto_168467 ?auto_168469 ) ( CLEAR ?auto_168467 ) ( ON ?auto_168468 ?auto_168470 ) ( CLEAR ?auto_168468 ) ( HAND-EMPTY ) ( not ( = ?auto_168462 ?auto_168470 ) ) ( not ( = ?auto_168463 ?auto_168470 ) ) ( not ( = ?auto_168464 ?auto_168470 ) ) ( not ( = ?auto_168465 ?auto_168470 ) ) ( not ( = ?auto_168466 ?auto_168470 ) ) ( not ( = ?auto_168469 ?auto_168470 ) ) ( not ( = ?auto_168467 ?auto_168470 ) ) ( not ( = ?auto_168468 ?auto_168470 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168468 ?auto_168470 )
      ( MAKE-5PILE ?auto_168462 ?auto_168463 ?auto_168464 ?auto_168465 ?auto_168466 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168471 - BLOCK
      ?auto_168472 - BLOCK
      ?auto_168473 - BLOCK
      ?auto_168474 - BLOCK
      ?auto_168475 - BLOCK
    )
    :vars
    (
      ?auto_168476 - BLOCK
      ?auto_168479 - BLOCK
      ?auto_168477 - BLOCK
      ?auto_168478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168476 ?auto_168475 ) ( ON-TABLE ?auto_168471 ) ( ON ?auto_168472 ?auto_168471 ) ( ON ?auto_168473 ?auto_168472 ) ( ON ?auto_168474 ?auto_168473 ) ( ON ?auto_168475 ?auto_168474 ) ( not ( = ?auto_168471 ?auto_168472 ) ) ( not ( = ?auto_168471 ?auto_168473 ) ) ( not ( = ?auto_168471 ?auto_168474 ) ) ( not ( = ?auto_168471 ?auto_168475 ) ) ( not ( = ?auto_168471 ?auto_168476 ) ) ( not ( = ?auto_168472 ?auto_168473 ) ) ( not ( = ?auto_168472 ?auto_168474 ) ) ( not ( = ?auto_168472 ?auto_168475 ) ) ( not ( = ?auto_168472 ?auto_168476 ) ) ( not ( = ?auto_168473 ?auto_168474 ) ) ( not ( = ?auto_168473 ?auto_168475 ) ) ( not ( = ?auto_168473 ?auto_168476 ) ) ( not ( = ?auto_168474 ?auto_168475 ) ) ( not ( = ?auto_168474 ?auto_168476 ) ) ( not ( = ?auto_168475 ?auto_168476 ) ) ( not ( = ?auto_168471 ?auto_168479 ) ) ( not ( = ?auto_168471 ?auto_168477 ) ) ( not ( = ?auto_168472 ?auto_168479 ) ) ( not ( = ?auto_168472 ?auto_168477 ) ) ( not ( = ?auto_168473 ?auto_168479 ) ) ( not ( = ?auto_168473 ?auto_168477 ) ) ( not ( = ?auto_168474 ?auto_168479 ) ) ( not ( = ?auto_168474 ?auto_168477 ) ) ( not ( = ?auto_168475 ?auto_168479 ) ) ( not ( = ?auto_168475 ?auto_168477 ) ) ( not ( = ?auto_168476 ?auto_168479 ) ) ( not ( = ?auto_168476 ?auto_168477 ) ) ( not ( = ?auto_168479 ?auto_168477 ) ) ( ON ?auto_168477 ?auto_168478 ) ( CLEAR ?auto_168477 ) ( not ( = ?auto_168471 ?auto_168478 ) ) ( not ( = ?auto_168472 ?auto_168478 ) ) ( not ( = ?auto_168473 ?auto_168478 ) ) ( not ( = ?auto_168474 ?auto_168478 ) ) ( not ( = ?auto_168475 ?auto_168478 ) ) ( not ( = ?auto_168476 ?auto_168478 ) ) ( not ( = ?auto_168479 ?auto_168478 ) ) ( not ( = ?auto_168477 ?auto_168478 ) ) ( HOLDING ?auto_168479 ) ( CLEAR ?auto_168476 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 ?auto_168476 ?auto_168479 )
      ( MAKE-5PILE ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168480 - BLOCK
      ?auto_168481 - BLOCK
      ?auto_168482 - BLOCK
      ?auto_168483 - BLOCK
      ?auto_168484 - BLOCK
    )
    :vars
    (
      ?auto_168488 - BLOCK
      ?auto_168485 - BLOCK
      ?auto_168487 - BLOCK
      ?auto_168486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168488 ?auto_168484 ) ( ON-TABLE ?auto_168480 ) ( ON ?auto_168481 ?auto_168480 ) ( ON ?auto_168482 ?auto_168481 ) ( ON ?auto_168483 ?auto_168482 ) ( ON ?auto_168484 ?auto_168483 ) ( not ( = ?auto_168480 ?auto_168481 ) ) ( not ( = ?auto_168480 ?auto_168482 ) ) ( not ( = ?auto_168480 ?auto_168483 ) ) ( not ( = ?auto_168480 ?auto_168484 ) ) ( not ( = ?auto_168480 ?auto_168488 ) ) ( not ( = ?auto_168481 ?auto_168482 ) ) ( not ( = ?auto_168481 ?auto_168483 ) ) ( not ( = ?auto_168481 ?auto_168484 ) ) ( not ( = ?auto_168481 ?auto_168488 ) ) ( not ( = ?auto_168482 ?auto_168483 ) ) ( not ( = ?auto_168482 ?auto_168484 ) ) ( not ( = ?auto_168482 ?auto_168488 ) ) ( not ( = ?auto_168483 ?auto_168484 ) ) ( not ( = ?auto_168483 ?auto_168488 ) ) ( not ( = ?auto_168484 ?auto_168488 ) ) ( not ( = ?auto_168480 ?auto_168485 ) ) ( not ( = ?auto_168480 ?auto_168487 ) ) ( not ( = ?auto_168481 ?auto_168485 ) ) ( not ( = ?auto_168481 ?auto_168487 ) ) ( not ( = ?auto_168482 ?auto_168485 ) ) ( not ( = ?auto_168482 ?auto_168487 ) ) ( not ( = ?auto_168483 ?auto_168485 ) ) ( not ( = ?auto_168483 ?auto_168487 ) ) ( not ( = ?auto_168484 ?auto_168485 ) ) ( not ( = ?auto_168484 ?auto_168487 ) ) ( not ( = ?auto_168488 ?auto_168485 ) ) ( not ( = ?auto_168488 ?auto_168487 ) ) ( not ( = ?auto_168485 ?auto_168487 ) ) ( ON ?auto_168487 ?auto_168486 ) ( not ( = ?auto_168480 ?auto_168486 ) ) ( not ( = ?auto_168481 ?auto_168486 ) ) ( not ( = ?auto_168482 ?auto_168486 ) ) ( not ( = ?auto_168483 ?auto_168486 ) ) ( not ( = ?auto_168484 ?auto_168486 ) ) ( not ( = ?auto_168488 ?auto_168486 ) ) ( not ( = ?auto_168485 ?auto_168486 ) ) ( not ( = ?auto_168487 ?auto_168486 ) ) ( CLEAR ?auto_168488 ) ( ON ?auto_168485 ?auto_168487 ) ( CLEAR ?auto_168485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168486 ?auto_168487 )
      ( MAKE-5PILE ?auto_168480 ?auto_168481 ?auto_168482 ?auto_168483 ?auto_168484 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168507 - BLOCK
      ?auto_168508 - BLOCK
      ?auto_168509 - BLOCK
      ?auto_168510 - BLOCK
      ?auto_168511 - BLOCK
    )
    :vars
    (
      ?auto_168513 - BLOCK
      ?auto_168515 - BLOCK
      ?auto_168514 - BLOCK
      ?auto_168512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168507 ) ( ON ?auto_168508 ?auto_168507 ) ( ON ?auto_168509 ?auto_168508 ) ( ON ?auto_168510 ?auto_168509 ) ( not ( = ?auto_168507 ?auto_168508 ) ) ( not ( = ?auto_168507 ?auto_168509 ) ) ( not ( = ?auto_168507 ?auto_168510 ) ) ( not ( = ?auto_168507 ?auto_168511 ) ) ( not ( = ?auto_168507 ?auto_168513 ) ) ( not ( = ?auto_168508 ?auto_168509 ) ) ( not ( = ?auto_168508 ?auto_168510 ) ) ( not ( = ?auto_168508 ?auto_168511 ) ) ( not ( = ?auto_168508 ?auto_168513 ) ) ( not ( = ?auto_168509 ?auto_168510 ) ) ( not ( = ?auto_168509 ?auto_168511 ) ) ( not ( = ?auto_168509 ?auto_168513 ) ) ( not ( = ?auto_168510 ?auto_168511 ) ) ( not ( = ?auto_168510 ?auto_168513 ) ) ( not ( = ?auto_168511 ?auto_168513 ) ) ( not ( = ?auto_168507 ?auto_168515 ) ) ( not ( = ?auto_168507 ?auto_168514 ) ) ( not ( = ?auto_168508 ?auto_168515 ) ) ( not ( = ?auto_168508 ?auto_168514 ) ) ( not ( = ?auto_168509 ?auto_168515 ) ) ( not ( = ?auto_168509 ?auto_168514 ) ) ( not ( = ?auto_168510 ?auto_168515 ) ) ( not ( = ?auto_168510 ?auto_168514 ) ) ( not ( = ?auto_168511 ?auto_168515 ) ) ( not ( = ?auto_168511 ?auto_168514 ) ) ( not ( = ?auto_168513 ?auto_168515 ) ) ( not ( = ?auto_168513 ?auto_168514 ) ) ( not ( = ?auto_168515 ?auto_168514 ) ) ( ON ?auto_168514 ?auto_168512 ) ( not ( = ?auto_168507 ?auto_168512 ) ) ( not ( = ?auto_168508 ?auto_168512 ) ) ( not ( = ?auto_168509 ?auto_168512 ) ) ( not ( = ?auto_168510 ?auto_168512 ) ) ( not ( = ?auto_168511 ?auto_168512 ) ) ( not ( = ?auto_168513 ?auto_168512 ) ) ( not ( = ?auto_168515 ?auto_168512 ) ) ( not ( = ?auto_168514 ?auto_168512 ) ) ( ON ?auto_168515 ?auto_168514 ) ( ON-TABLE ?auto_168512 ) ( ON ?auto_168513 ?auto_168515 ) ( CLEAR ?auto_168513 ) ( HOLDING ?auto_168511 ) ( CLEAR ?auto_168510 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168507 ?auto_168508 ?auto_168509 ?auto_168510 ?auto_168511 ?auto_168513 )
      ( MAKE-5PILE ?auto_168507 ?auto_168508 ?auto_168509 ?auto_168510 ?auto_168511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168516 - BLOCK
      ?auto_168517 - BLOCK
      ?auto_168518 - BLOCK
      ?auto_168519 - BLOCK
      ?auto_168520 - BLOCK
    )
    :vars
    (
      ?auto_168521 - BLOCK
      ?auto_168522 - BLOCK
      ?auto_168523 - BLOCK
      ?auto_168524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168516 ) ( ON ?auto_168517 ?auto_168516 ) ( ON ?auto_168518 ?auto_168517 ) ( ON ?auto_168519 ?auto_168518 ) ( not ( = ?auto_168516 ?auto_168517 ) ) ( not ( = ?auto_168516 ?auto_168518 ) ) ( not ( = ?auto_168516 ?auto_168519 ) ) ( not ( = ?auto_168516 ?auto_168520 ) ) ( not ( = ?auto_168516 ?auto_168521 ) ) ( not ( = ?auto_168517 ?auto_168518 ) ) ( not ( = ?auto_168517 ?auto_168519 ) ) ( not ( = ?auto_168517 ?auto_168520 ) ) ( not ( = ?auto_168517 ?auto_168521 ) ) ( not ( = ?auto_168518 ?auto_168519 ) ) ( not ( = ?auto_168518 ?auto_168520 ) ) ( not ( = ?auto_168518 ?auto_168521 ) ) ( not ( = ?auto_168519 ?auto_168520 ) ) ( not ( = ?auto_168519 ?auto_168521 ) ) ( not ( = ?auto_168520 ?auto_168521 ) ) ( not ( = ?auto_168516 ?auto_168522 ) ) ( not ( = ?auto_168516 ?auto_168523 ) ) ( not ( = ?auto_168517 ?auto_168522 ) ) ( not ( = ?auto_168517 ?auto_168523 ) ) ( not ( = ?auto_168518 ?auto_168522 ) ) ( not ( = ?auto_168518 ?auto_168523 ) ) ( not ( = ?auto_168519 ?auto_168522 ) ) ( not ( = ?auto_168519 ?auto_168523 ) ) ( not ( = ?auto_168520 ?auto_168522 ) ) ( not ( = ?auto_168520 ?auto_168523 ) ) ( not ( = ?auto_168521 ?auto_168522 ) ) ( not ( = ?auto_168521 ?auto_168523 ) ) ( not ( = ?auto_168522 ?auto_168523 ) ) ( ON ?auto_168523 ?auto_168524 ) ( not ( = ?auto_168516 ?auto_168524 ) ) ( not ( = ?auto_168517 ?auto_168524 ) ) ( not ( = ?auto_168518 ?auto_168524 ) ) ( not ( = ?auto_168519 ?auto_168524 ) ) ( not ( = ?auto_168520 ?auto_168524 ) ) ( not ( = ?auto_168521 ?auto_168524 ) ) ( not ( = ?auto_168522 ?auto_168524 ) ) ( not ( = ?auto_168523 ?auto_168524 ) ) ( ON ?auto_168522 ?auto_168523 ) ( ON-TABLE ?auto_168524 ) ( ON ?auto_168521 ?auto_168522 ) ( CLEAR ?auto_168519 ) ( ON ?auto_168520 ?auto_168521 ) ( CLEAR ?auto_168520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168524 ?auto_168523 ?auto_168522 ?auto_168521 )
      ( MAKE-5PILE ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168525 - BLOCK
      ?auto_168526 - BLOCK
      ?auto_168527 - BLOCK
      ?auto_168528 - BLOCK
      ?auto_168529 - BLOCK
    )
    :vars
    (
      ?auto_168532 - BLOCK
      ?auto_168531 - BLOCK
      ?auto_168533 - BLOCK
      ?auto_168530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168525 ) ( ON ?auto_168526 ?auto_168525 ) ( ON ?auto_168527 ?auto_168526 ) ( not ( = ?auto_168525 ?auto_168526 ) ) ( not ( = ?auto_168525 ?auto_168527 ) ) ( not ( = ?auto_168525 ?auto_168528 ) ) ( not ( = ?auto_168525 ?auto_168529 ) ) ( not ( = ?auto_168525 ?auto_168532 ) ) ( not ( = ?auto_168526 ?auto_168527 ) ) ( not ( = ?auto_168526 ?auto_168528 ) ) ( not ( = ?auto_168526 ?auto_168529 ) ) ( not ( = ?auto_168526 ?auto_168532 ) ) ( not ( = ?auto_168527 ?auto_168528 ) ) ( not ( = ?auto_168527 ?auto_168529 ) ) ( not ( = ?auto_168527 ?auto_168532 ) ) ( not ( = ?auto_168528 ?auto_168529 ) ) ( not ( = ?auto_168528 ?auto_168532 ) ) ( not ( = ?auto_168529 ?auto_168532 ) ) ( not ( = ?auto_168525 ?auto_168531 ) ) ( not ( = ?auto_168525 ?auto_168533 ) ) ( not ( = ?auto_168526 ?auto_168531 ) ) ( not ( = ?auto_168526 ?auto_168533 ) ) ( not ( = ?auto_168527 ?auto_168531 ) ) ( not ( = ?auto_168527 ?auto_168533 ) ) ( not ( = ?auto_168528 ?auto_168531 ) ) ( not ( = ?auto_168528 ?auto_168533 ) ) ( not ( = ?auto_168529 ?auto_168531 ) ) ( not ( = ?auto_168529 ?auto_168533 ) ) ( not ( = ?auto_168532 ?auto_168531 ) ) ( not ( = ?auto_168532 ?auto_168533 ) ) ( not ( = ?auto_168531 ?auto_168533 ) ) ( ON ?auto_168533 ?auto_168530 ) ( not ( = ?auto_168525 ?auto_168530 ) ) ( not ( = ?auto_168526 ?auto_168530 ) ) ( not ( = ?auto_168527 ?auto_168530 ) ) ( not ( = ?auto_168528 ?auto_168530 ) ) ( not ( = ?auto_168529 ?auto_168530 ) ) ( not ( = ?auto_168532 ?auto_168530 ) ) ( not ( = ?auto_168531 ?auto_168530 ) ) ( not ( = ?auto_168533 ?auto_168530 ) ) ( ON ?auto_168531 ?auto_168533 ) ( ON-TABLE ?auto_168530 ) ( ON ?auto_168532 ?auto_168531 ) ( ON ?auto_168529 ?auto_168532 ) ( CLEAR ?auto_168529 ) ( HOLDING ?auto_168528 ) ( CLEAR ?auto_168527 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168525 ?auto_168526 ?auto_168527 ?auto_168528 )
      ( MAKE-5PILE ?auto_168525 ?auto_168526 ?auto_168527 ?auto_168528 ?auto_168529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168534 - BLOCK
      ?auto_168535 - BLOCK
      ?auto_168536 - BLOCK
      ?auto_168537 - BLOCK
      ?auto_168538 - BLOCK
    )
    :vars
    (
      ?auto_168541 - BLOCK
      ?auto_168539 - BLOCK
      ?auto_168540 - BLOCK
      ?auto_168542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168534 ) ( ON ?auto_168535 ?auto_168534 ) ( ON ?auto_168536 ?auto_168535 ) ( not ( = ?auto_168534 ?auto_168535 ) ) ( not ( = ?auto_168534 ?auto_168536 ) ) ( not ( = ?auto_168534 ?auto_168537 ) ) ( not ( = ?auto_168534 ?auto_168538 ) ) ( not ( = ?auto_168534 ?auto_168541 ) ) ( not ( = ?auto_168535 ?auto_168536 ) ) ( not ( = ?auto_168535 ?auto_168537 ) ) ( not ( = ?auto_168535 ?auto_168538 ) ) ( not ( = ?auto_168535 ?auto_168541 ) ) ( not ( = ?auto_168536 ?auto_168537 ) ) ( not ( = ?auto_168536 ?auto_168538 ) ) ( not ( = ?auto_168536 ?auto_168541 ) ) ( not ( = ?auto_168537 ?auto_168538 ) ) ( not ( = ?auto_168537 ?auto_168541 ) ) ( not ( = ?auto_168538 ?auto_168541 ) ) ( not ( = ?auto_168534 ?auto_168539 ) ) ( not ( = ?auto_168534 ?auto_168540 ) ) ( not ( = ?auto_168535 ?auto_168539 ) ) ( not ( = ?auto_168535 ?auto_168540 ) ) ( not ( = ?auto_168536 ?auto_168539 ) ) ( not ( = ?auto_168536 ?auto_168540 ) ) ( not ( = ?auto_168537 ?auto_168539 ) ) ( not ( = ?auto_168537 ?auto_168540 ) ) ( not ( = ?auto_168538 ?auto_168539 ) ) ( not ( = ?auto_168538 ?auto_168540 ) ) ( not ( = ?auto_168541 ?auto_168539 ) ) ( not ( = ?auto_168541 ?auto_168540 ) ) ( not ( = ?auto_168539 ?auto_168540 ) ) ( ON ?auto_168540 ?auto_168542 ) ( not ( = ?auto_168534 ?auto_168542 ) ) ( not ( = ?auto_168535 ?auto_168542 ) ) ( not ( = ?auto_168536 ?auto_168542 ) ) ( not ( = ?auto_168537 ?auto_168542 ) ) ( not ( = ?auto_168538 ?auto_168542 ) ) ( not ( = ?auto_168541 ?auto_168542 ) ) ( not ( = ?auto_168539 ?auto_168542 ) ) ( not ( = ?auto_168540 ?auto_168542 ) ) ( ON ?auto_168539 ?auto_168540 ) ( ON-TABLE ?auto_168542 ) ( ON ?auto_168541 ?auto_168539 ) ( ON ?auto_168538 ?auto_168541 ) ( CLEAR ?auto_168536 ) ( ON ?auto_168537 ?auto_168538 ) ( CLEAR ?auto_168537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168542 ?auto_168540 ?auto_168539 ?auto_168541 ?auto_168538 )
      ( MAKE-5PILE ?auto_168534 ?auto_168535 ?auto_168536 ?auto_168537 ?auto_168538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168543 - BLOCK
      ?auto_168544 - BLOCK
      ?auto_168545 - BLOCK
      ?auto_168546 - BLOCK
      ?auto_168547 - BLOCK
    )
    :vars
    (
      ?auto_168551 - BLOCK
      ?auto_168548 - BLOCK
      ?auto_168549 - BLOCK
      ?auto_168550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168543 ) ( ON ?auto_168544 ?auto_168543 ) ( not ( = ?auto_168543 ?auto_168544 ) ) ( not ( = ?auto_168543 ?auto_168545 ) ) ( not ( = ?auto_168543 ?auto_168546 ) ) ( not ( = ?auto_168543 ?auto_168547 ) ) ( not ( = ?auto_168543 ?auto_168551 ) ) ( not ( = ?auto_168544 ?auto_168545 ) ) ( not ( = ?auto_168544 ?auto_168546 ) ) ( not ( = ?auto_168544 ?auto_168547 ) ) ( not ( = ?auto_168544 ?auto_168551 ) ) ( not ( = ?auto_168545 ?auto_168546 ) ) ( not ( = ?auto_168545 ?auto_168547 ) ) ( not ( = ?auto_168545 ?auto_168551 ) ) ( not ( = ?auto_168546 ?auto_168547 ) ) ( not ( = ?auto_168546 ?auto_168551 ) ) ( not ( = ?auto_168547 ?auto_168551 ) ) ( not ( = ?auto_168543 ?auto_168548 ) ) ( not ( = ?auto_168543 ?auto_168549 ) ) ( not ( = ?auto_168544 ?auto_168548 ) ) ( not ( = ?auto_168544 ?auto_168549 ) ) ( not ( = ?auto_168545 ?auto_168548 ) ) ( not ( = ?auto_168545 ?auto_168549 ) ) ( not ( = ?auto_168546 ?auto_168548 ) ) ( not ( = ?auto_168546 ?auto_168549 ) ) ( not ( = ?auto_168547 ?auto_168548 ) ) ( not ( = ?auto_168547 ?auto_168549 ) ) ( not ( = ?auto_168551 ?auto_168548 ) ) ( not ( = ?auto_168551 ?auto_168549 ) ) ( not ( = ?auto_168548 ?auto_168549 ) ) ( ON ?auto_168549 ?auto_168550 ) ( not ( = ?auto_168543 ?auto_168550 ) ) ( not ( = ?auto_168544 ?auto_168550 ) ) ( not ( = ?auto_168545 ?auto_168550 ) ) ( not ( = ?auto_168546 ?auto_168550 ) ) ( not ( = ?auto_168547 ?auto_168550 ) ) ( not ( = ?auto_168551 ?auto_168550 ) ) ( not ( = ?auto_168548 ?auto_168550 ) ) ( not ( = ?auto_168549 ?auto_168550 ) ) ( ON ?auto_168548 ?auto_168549 ) ( ON-TABLE ?auto_168550 ) ( ON ?auto_168551 ?auto_168548 ) ( ON ?auto_168547 ?auto_168551 ) ( ON ?auto_168546 ?auto_168547 ) ( CLEAR ?auto_168546 ) ( HOLDING ?auto_168545 ) ( CLEAR ?auto_168544 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168543 ?auto_168544 ?auto_168545 )
      ( MAKE-5PILE ?auto_168543 ?auto_168544 ?auto_168545 ?auto_168546 ?auto_168547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168552 - BLOCK
      ?auto_168553 - BLOCK
      ?auto_168554 - BLOCK
      ?auto_168555 - BLOCK
      ?auto_168556 - BLOCK
    )
    :vars
    (
      ?auto_168557 - BLOCK
      ?auto_168560 - BLOCK
      ?auto_168559 - BLOCK
      ?auto_168558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168552 ) ( ON ?auto_168553 ?auto_168552 ) ( not ( = ?auto_168552 ?auto_168553 ) ) ( not ( = ?auto_168552 ?auto_168554 ) ) ( not ( = ?auto_168552 ?auto_168555 ) ) ( not ( = ?auto_168552 ?auto_168556 ) ) ( not ( = ?auto_168552 ?auto_168557 ) ) ( not ( = ?auto_168553 ?auto_168554 ) ) ( not ( = ?auto_168553 ?auto_168555 ) ) ( not ( = ?auto_168553 ?auto_168556 ) ) ( not ( = ?auto_168553 ?auto_168557 ) ) ( not ( = ?auto_168554 ?auto_168555 ) ) ( not ( = ?auto_168554 ?auto_168556 ) ) ( not ( = ?auto_168554 ?auto_168557 ) ) ( not ( = ?auto_168555 ?auto_168556 ) ) ( not ( = ?auto_168555 ?auto_168557 ) ) ( not ( = ?auto_168556 ?auto_168557 ) ) ( not ( = ?auto_168552 ?auto_168560 ) ) ( not ( = ?auto_168552 ?auto_168559 ) ) ( not ( = ?auto_168553 ?auto_168560 ) ) ( not ( = ?auto_168553 ?auto_168559 ) ) ( not ( = ?auto_168554 ?auto_168560 ) ) ( not ( = ?auto_168554 ?auto_168559 ) ) ( not ( = ?auto_168555 ?auto_168560 ) ) ( not ( = ?auto_168555 ?auto_168559 ) ) ( not ( = ?auto_168556 ?auto_168560 ) ) ( not ( = ?auto_168556 ?auto_168559 ) ) ( not ( = ?auto_168557 ?auto_168560 ) ) ( not ( = ?auto_168557 ?auto_168559 ) ) ( not ( = ?auto_168560 ?auto_168559 ) ) ( ON ?auto_168559 ?auto_168558 ) ( not ( = ?auto_168552 ?auto_168558 ) ) ( not ( = ?auto_168553 ?auto_168558 ) ) ( not ( = ?auto_168554 ?auto_168558 ) ) ( not ( = ?auto_168555 ?auto_168558 ) ) ( not ( = ?auto_168556 ?auto_168558 ) ) ( not ( = ?auto_168557 ?auto_168558 ) ) ( not ( = ?auto_168560 ?auto_168558 ) ) ( not ( = ?auto_168559 ?auto_168558 ) ) ( ON ?auto_168560 ?auto_168559 ) ( ON-TABLE ?auto_168558 ) ( ON ?auto_168557 ?auto_168560 ) ( ON ?auto_168556 ?auto_168557 ) ( ON ?auto_168555 ?auto_168556 ) ( CLEAR ?auto_168553 ) ( ON ?auto_168554 ?auto_168555 ) ( CLEAR ?auto_168554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168558 ?auto_168559 ?auto_168560 ?auto_168557 ?auto_168556 ?auto_168555 )
      ( MAKE-5PILE ?auto_168552 ?auto_168553 ?auto_168554 ?auto_168555 ?auto_168556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168561 - BLOCK
      ?auto_168562 - BLOCK
      ?auto_168563 - BLOCK
      ?auto_168564 - BLOCK
      ?auto_168565 - BLOCK
    )
    :vars
    (
      ?auto_168567 - BLOCK
      ?auto_168569 - BLOCK
      ?auto_168568 - BLOCK
      ?auto_168566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168561 ) ( not ( = ?auto_168561 ?auto_168562 ) ) ( not ( = ?auto_168561 ?auto_168563 ) ) ( not ( = ?auto_168561 ?auto_168564 ) ) ( not ( = ?auto_168561 ?auto_168565 ) ) ( not ( = ?auto_168561 ?auto_168567 ) ) ( not ( = ?auto_168562 ?auto_168563 ) ) ( not ( = ?auto_168562 ?auto_168564 ) ) ( not ( = ?auto_168562 ?auto_168565 ) ) ( not ( = ?auto_168562 ?auto_168567 ) ) ( not ( = ?auto_168563 ?auto_168564 ) ) ( not ( = ?auto_168563 ?auto_168565 ) ) ( not ( = ?auto_168563 ?auto_168567 ) ) ( not ( = ?auto_168564 ?auto_168565 ) ) ( not ( = ?auto_168564 ?auto_168567 ) ) ( not ( = ?auto_168565 ?auto_168567 ) ) ( not ( = ?auto_168561 ?auto_168569 ) ) ( not ( = ?auto_168561 ?auto_168568 ) ) ( not ( = ?auto_168562 ?auto_168569 ) ) ( not ( = ?auto_168562 ?auto_168568 ) ) ( not ( = ?auto_168563 ?auto_168569 ) ) ( not ( = ?auto_168563 ?auto_168568 ) ) ( not ( = ?auto_168564 ?auto_168569 ) ) ( not ( = ?auto_168564 ?auto_168568 ) ) ( not ( = ?auto_168565 ?auto_168569 ) ) ( not ( = ?auto_168565 ?auto_168568 ) ) ( not ( = ?auto_168567 ?auto_168569 ) ) ( not ( = ?auto_168567 ?auto_168568 ) ) ( not ( = ?auto_168569 ?auto_168568 ) ) ( ON ?auto_168568 ?auto_168566 ) ( not ( = ?auto_168561 ?auto_168566 ) ) ( not ( = ?auto_168562 ?auto_168566 ) ) ( not ( = ?auto_168563 ?auto_168566 ) ) ( not ( = ?auto_168564 ?auto_168566 ) ) ( not ( = ?auto_168565 ?auto_168566 ) ) ( not ( = ?auto_168567 ?auto_168566 ) ) ( not ( = ?auto_168569 ?auto_168566 ) ) ( not ( = ?auto_168568 ?auto_168566 ) ) ( ON ?auto_168569 ?auto_168568 ) ( ON-TABLE ?auto_168566 ) ( ON ?auto_168567 ?auto_168569 ) ( ON ?auto_168565 ?auto_168567 ) ( ON ?auto_168564 ?auto_168565 ) ( ON ?auto_168563 ?auto_168564 ) ( CLEAR ?auto_168563 ) ( HOLDING ?auto_168562 ) ( CLEAR ?auto_168561 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168561 ?auto_168562 )
      ( MAKE-5PILE ?auto_168561 ?auto_168562 ?auto_168563 ?auto_168564 ?auto_168565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168570 - BLOCK
      ?auto_168571 - BLOCK
      ?auto_168572 - BLOCK
      ?auto_168573 - BLOCK
      ?auto_168574 - BLOCK
    )
    :vars
    (
      ?auto_168577 - BLOCK
      ?auto_168578 - BLOCK
      ?auto_168576 - BLOCK
      ?auto_168575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168570 ) ( not ( = ?auto_168570 ?auto_168571 ) ) ( not ( = ?auto_168570 ?auto_168572 ) ) ( not ( = ?auto_168570 ?auto_168573 ) ) ( not ( = ?auto_168570 ?auto_168574 ) ) ( not ( = ?auto_168570 ?auto_168577 ) ) ( not ( = ?auto_168571 ?auto_168572 ) ) ( not ( = ?auto_168571 ?auto_168573 ) ) ( not ( = ?auto_168571 ?auto_168574 ) ) ( not ( = ?auto_168571 ?auto_168577 ) ) ( not ( = ?auto_168572 ?auto_168573 ) ) ( not ( = ?auto_168572 ?auto_168574 ) ) ( not ( = ?auto_168572 ?auto_168577 ) ) ( not ( = ?auto_168573 ?auto_168574 ) ) ( not ( = ?auto_168573 ?auto_168577 ) ) ( not ( = ?auto_168574 ?auto_168577 ) ) ( not ( = ?auto_168570 ?auto_168578 ) ) ( not ( = ?auto_168570 ?auto_168576 ) ) ( not ( = ?auto_168571 ?auto_168578 ) ) ( not ( = ?auto_168571 ?auto_168576 ) ) ( not ( = ?auto_168572 ?auto_168578 ) ) ( not ( = ?auto_168572 ?auto_168576 ) ) ( not ( = ?auto_168573 ?auto_168578 ) ) ( not ( = ?auto_168573 ?auto_168576 ) ) ( not ( = ?auto_168574 ?auto_168578 ) ) ( not ( = ?auto_168574 ?auto_168576 ) ) ( not ( = ?auto_168577 ?auto_168578 ) ) ( not ( = ?auto_168577 ?auto_168576 ) ) ( not ( = ?auto_168578 ?auto_168576 ) ) ( ON ?auto_168576 ?auto_168575 ) ( not ( = ?auto_168570 ?auto_168575 ) ) ( not ( = ?auto_168571 ?auto_168575 ) ) ( not ( = ?auto_168572 ?auto_168575 ) ) ( not ( = ?auto_168573 ?auto_168575 ) ) ( not ( = ?auto_168574 ?auto_168575 ) ) ( not ( = ?auto_168577 ?auto_168575 ) ) ( not ( = ?auto_168578 ?auto_168575 ) ) ( not ( = ?auto_168576 ?auto_168575 ) ) ( ON ?auto_168578 ?auto_168576 ) ( ON-TABLE ?auto_168575 ) ( ON ?auto_168577 ?auto_168578 ) ( ON ?auto_168574 ?auto_168577 ) ( ON ?auto_168573 ?auto_168574 ) ( ON ?auto_168572 ?auto_168573 ) ( CLEAR ?auto_168570 ) ( ON ?auto_168571 ?auto_168572 ) ( CLEAR ?auto_168571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168575 ?auto_168576 ?auto_168578 ?auto_168577 ?auto_168574 ?auto_168573 ?auto_168572 )
      ( MAKE-5PILE ?auto_168570 ?auto_168571 ?auto_168572 ?auto_168573 ?auto_168574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168579 - BLOCK
      ?auto_168580 - BLOCK
      ?auto_168581 - BLOCK
      ?auto_168582 - BLOCK
      ?auto_168583 - BLOCK
    )
    :vars
    (
      ?auto_168586 - BLOCK
      ?auto_168587 - BLOCK
      ?auto_168585 - BLOCK
      ?auto_168584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168579 ?auto_168580 ) ) ( not ( = ?auto_168579 ?auto_168581 ) ) ( not ( = ?auto_168579 ?auto_168582 ) ) ( not ( = ?auto_168579 ?auto_168583 ) ) ( not ( = ?auto_168579 ?auto_168586 ) ) ( not ( = ?auto_168580 ?auto_168581 ) ) ( not ( = ?auto_168580 ?auto_168582 ) ) ( not ( = ?auto_168580 ?auto_168583 ) ) ( not ( = ?auto_168580 ?auto_168586 ) ) ( not ( = ?auto_168581 ?auto_168582 ) ) ( not ( = ?auto_168581 ?auto_168583 ) ) ( not ( = ?auto_168581 ?auto_168586 ) ) ( not ( = ?auto_168582 ?auto_168583 ) ) ( not ( = ?auto_168582 ?auto_168586 ) ) ( not ( = ?auto_168583 ?auto_168586 ) ) ( not ( = ?auto_168579 ?auto_168587 ) ) ( not ( = ?auto_168579 ?auto_168585 ) ) ( not ( = ?auto_168580 ?auto_168587 ) ) ( not ( = ?auto_168580 ?auto_168585 ) ) ( not ( = ?auto_168581 ?auto_168587 ) ) ( not ( = ?auto_168581 ?auto_168585 ) ) ( not ( = ?auto_168582 ?auto_168587 ) ) ( not ( = ?auto_168582 ?auto_168585 ) ) ( not ( = ?auto_168583 ?auto_168587 ) ) ( not ( = ?auto_168583 ?auto_168585 ) ) ( not ( = ?auto_168586 ?auto_168587 ) ) ( not ( = ?auto_168586 ?auto_168585 ) ) ( not ( = ?auto_168587 ?auto_168585 ) ) ( ON ?auto_168585 ?auto_168584 ) ( not ( = ?auto_168579 ?auto_168584 ) ) ( not ( = ?auto_168580 ?auto_168584 ) ) ( not ( = ?auto_168581 ?auto_168584 ) ) ( not ( = ?auto_168582 ?auto_168584 ) ) ( not ( = ?auto_168583 ?auto_168584 ) ) ( not ( = ?auto_168586 ?auto_168584 ) ) ( not ( = ?auto_168587 ?auto_168584 ) ) ( not ( = ?auto_168585 ?auto_168584 ) ) ( ON ?auto_168587 ?auto_168585 ) ( ON-TABLE ?auto_168584 ) ( ON ?auto_168586 ?auto_168587 ) ( ON ?auto_168583 ?auto_168586 ) ( ON ?auto_168582 ?auto_168583 ) ( ON ?auto_168581 ?auto_168582 ) ( ON ?auto_168580 ?auto_168581 ) ( CLEAR ?auto_168580 ) ( HOLDING ?auto_168579 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168579 )
      ( MAKE-5PILE ?auto_168579 ?auto_168580 ?auto_168581 ?auto_168582 ?auto_168583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_168588 - BLOCK
      ?auto_168589 - BLOCK
      ?auto_168590 - BLOCK
      ?auto_168591 - BLOCK
      ?auto_168592 - BLOCK
    )
    :vars
    (
      ?auto_168595 - BLOCK
      ?auto_168593 - BLOCK
      ?auto_168596 - BLOCK
      ?auto_168594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168588 ?auto_168589 ) ) ( not ( = ?auto_168588 ?auto_168590 ) ) ( not ( = ?auto_168588 ?auto_168591 ) ) ( not ( = ?auto_168588 ?auto_168592 ) ) ( not ( = ?auto_168588 ?auto_168595 ) ) ( not ( = ?auto_168589 ?auto_168590 ) ) ( not ( = ?auto_168589 ?auto_168591 ) ) ( not ( = ?auto_168589 ?auto_168592 ) ) ( not ( = ?auto_168589 ?auto_168595 ) ) ( not ( = ?auto_168590 ?auto_168591 ) ) ( not ( = ?auto_168590 ?auto_168592 ) ) ( not ( = ?auto_168590 ?auto_168595 ) ) ( not ( = ?auto_168591 ?auto_168592 ) ) ( not ( = ?auto_168591 ?auto_168595 ) ) ( not ( = ?auto_168592 ?auto_168595 ) ) ( not ( = ?auto_168588 ?auto_168593 ) ) ( not ( = ?auto_168588 ?auto_168596 ) ) ( not ( = ?auto_168589 ?auto_168593 ) ) ( not ( = ?auto_168589 ?auto_168596 ) ) ( not ( = ?auto_168590 ?auto_168593 ) ) ( not ( = ?auto_168590 ?auto_168596 ) ) ( not ( = ?auto_168591 ?auto_168593 ) ) ( not ( = ?auto_168591 ?auto_168596 ) ) ( not ( = ?auto_168592 ?auto_168593 ) ) ( not ( = ?auto_168592 ?auto_168596 ) ) ( not ( = ?auto_168595 ?auto_168593 ) ) ( not ( = ?auto_168595 ?auto_168596 ) ) ( not ( = ?auto_168593 ?auto_168596 ) ) ( ON ?auto_168596 ?auto_168594 ) ( not ( = ?auto_168588 ?auto_168594 ) ) ( not ( = ?auto_168589 ?auto_168594 ) ) ( not ( = ?auto_168590 ?auto_168594 ) ) ( not ( = ?auto_168591 ?auto_168594 ) ) ( not ( = ?auto_168592 ?auto_168594 ) ) ( not ( = ?auto_168595 ?auto_168594 ) ) ( not ( = ?auto_168593 ?auto_168594 ) ) ( not ( = ?auto_168596 ?auto_168594 ) ) ( ON ?auto_168593 ?auto_168596 ) ( ON-TABLE ?auto_168594 ) ( ON ?auto_168595 ?auto_168593 ) ( ON ?auto_168592 ?auto_168595 ) ( ON ?auto_168591 ?auto_168592 ) ( ON ?auto_168590 ?auto_168591 ) ( ON ?auto_168589 ?auto_168590 ) ( ON ?auto_168588 ?auto_168589 ) ( CLEAR ?auto_168588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168594 ?auto_168596 ?auto_168593 ?auto_168595 ?auto_168592 ?auto_168591 ?auto_168590 ?auto_168589 )
      ( MAKE-5PILE ?auto_168588 ?auto_168589 ?auto_168590 ?auto_168591 ?auto_168592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168600 - BLOCK
      ?auto_168601 - BLOCK
      ?auto_168602 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_168602 ) ( CLEAR ?auto_168601 ) ( ON-TABLE ?auto_168600 ) ( ON ?auto_168601 ?auto_168600 ) ( not ( = ?auto_168600 ?auto_168601 ) ) ( not ( = ?auto_168600 ?auto_168602 ) ) ( not ( = ?auto_168601 ?auto_168602 ) ) )
    :subtasks
    ( ( !STACK ?auto_168602 ?auto_168601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168603 - BLOCK
      ?auto_168604 - BLOCK
      ?auto_168605 - BLOCK
    )
    :vars
    (
      ?auto_168606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168604 ) ( ON-TABLE ?auto_168603 ) ( ON ?auto_168604 ?auto_168603 ) ( not ( = ?auto_168603 ?auto_168604 ) ) ( not ( = ?auto_168603 ?auto_168605 ) ) ( not ( = ?auto_168604 ?auto_168605 ) ) ( ON ?auto_168605 ?auto_168606 ) ( CLEAR ?auto_168605 ) ( HAND-EMPTY ) ( not ( = ?auto_168603 ?auto_168606 ) ) ( not ( = ?auto_168604 ?auto_168606 ) ) ( not ( = ?auto_168605 ?auto_168606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168605 ?auto_168606 )
      ( MAKE-3PILE ?auto_168603 ?auto_168604 ?auto_168605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168607 - BLOCK
      ?auto_168608 - BLOCK
      ?auto_168609 - BLOCK
    )
    :vars
    (
      ?auto_168610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168607 ) ( not ( = ?auto_168607 ?auto_168608 ) ) ( not ( = ?auto_168607 ?auto_168609 ) ) ( not ( = ?auto_168608 ?auto_168609 ) ) ( ON ?auto_168609 ?auto_168610 ) ( CLEAR ?auto_168609 ) ( not ( = ?auto_168607 ?auto_168610 ) ) ( not ( = ?auto_168608 ?auto_168610 ) ) ( not ( = ?auto_168609 ?auto_168610 ) ) ( HOLDING ?auto_168608 ) ( CLEAR ?auto_168607 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168607 ?auto_168608 )
      ( MAKE-3PILE ?auto_168607 ?auto_168608 ?auto_168609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168611 - BLOCK
      ?auto_168612 - BLOCK
      ?auto_168613 - BLOCK
    )
    :vars
    (
      ?auto_168614 - BLOCK
      ?auto_168618 - BLOCK
      ?auto_168617 - BLOCK
      ?auto_168616 - BLOCK
      ?auto_168615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168611 ) ( not ( = ?auto_168611 ?auto_168612 ) ) ( not ( = ?auto_168611 ?auto_168613 ) ) ( not ( = ?auto_168612 ?auto_168613 ) ) ( ON ?auto_168613 ?auto_168614 ) ( not ( = ?auto_168611 ?auto_168614 ) ) ( not ( = ?auto_168612 ?auto_168614 ) ) ( not ( = ?auto_168613 ?auto_168614 ) ) ( CLEAR ?auto_168611 ) ( ON ?auto_168612 ?auto_168613 ) ( CLEAR ?auto_168612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168618 ) ( ON ?auto_168617 ?auto_168618 ) ( ON ?auto_168616 ?auto_168617 ) ( ON ?auto_168615 ?auto_168616 ) ( ON ?auto_168614 ?auto_168615 ) ( not ( = ?auto_168618 ?auto_168617 ) ) ( not ( = ?auto_168618 ?auto_168616 ) ) ( not ( = ?auto_168618 ?auto_168615 ) ) ( not ( = ?auto_168618 ?auto_168614 ) ) ( not ( = ?auto_168618 ?auto_168613 ) ) ( not ( = ?auto_168618 ?auto_168612 ) ) ( not ( = ?auto_168617 ?auto_168616 ) ) ( not ( = ?auto_168617 ?auto_168615 ) ) ( not ( = ?auto_168617 ?auto_168614 ) ) ( not ( = ?auto_168617 ?auto_168613 ) ) ( not ( = ?auto_168617 ?auto_168612 ) ) ( not ( = ?auto_168616 ?auto_168615 ) ) ( not ( = ?auto_168616 ?auto_168614 ) ) ( not ( = ?auto_168616 ?auto_168613 ) ) ( not ( = ?auto_168616 ?auto_168612 ) ) ( not ( = ?auto_168615 ?auto_168614 ) ) ( not ( = ?auto_168615 ?auto_168613 ) ) ( not ( = ?auto_168615 ?auto_168612 ) ) ( not ( = ?auto_168611 ?auto_168618 ) ) ( not ( = ?auto_168611 ?auto_168617 ) ) ( not ( = ?auto_168611 ?auto_168616 ) ) ( not ( = ?auto_168611 ?auto_168615 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168618 ?auto_168617 ?auto_168616 ?auto_168615 ?auto_168614 ?auto_168613 )
      ( MAKE-3PILE ?auto_168611 ?auto_168612 ?auto_168613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168619 - BLOCK
      ?auto_168620 - BLOCK
      ?auto_168621 - BLOCK
    )
    :vars
    (
      ?auto_168626 - BLOCK
      ?auto_168622 - BLOCK
      ?auto_168625 - BLOCK
      ?auto_168624 - BLOCK
      ?auto_168623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168619 ?auto_168620 ) ) ( not ( = ?auto_168619 ?auto_168621 ) ) ( not ( = ?auto_168620 ?auto_168621 ) ) ( ON ?auto_168621 ?auto_168626 ) ( not ( = ?auto_168619 ?auto_168626 ) ) ( not ( = ?auto_168620 ?auto_168626 ) ) ( not ( = ?auto_168621 ?auto_168626 ) ) ( ON ?auto_168620 ?auto_168621 ) ( CLEAR ?auto_168620 ) ( ON-TABLE ?auto_168622 ) ( ON ?auto_168625 ?auto_168622 ) ( ON ?auto_168624 ?auto_168625 ) ( ON ?auto_168623 ?auto_168624 ) ( ON ?auto_168626 ?auto_168623 ) ( not ( = ?auto_168622 ?auto_168625 ) ) ( not ( = ?auto_168622 ?auto_168624 ) ) ( not ( = ?auto_168622 ?auto_168623 ) ) ( not ( = ?auto_168622 ?auto_168626 ) ) ( not ( = ?auto_168622 ?auto_168621 ) ) ( not ( = ?auto_168622 ?auto_168620 ) ) ( not ( = ?auto_168625 ?auto_168624 ) ) ( not ( = ?auto_168625 ?auto_168623 ) ) ( not ( = ?auto_168625 ?auto_168626 ) ) ( not ( = ?auto_168625 ?auto_168621 ) ) ( not ( = ?auto_168625 ?auto_168620 ) ) ( not ( = ?auto_168624 ?auto_168623 ) ) ( not ( = ?auto_168624 ?auto_168626 ) ) ( not ( = ?auto_168624 ?auto_168621 ) ) ( not ( = ?auto_168624 ?auto_168620 ) ) ( not ( = ?auto_168623 ?auto_168626 ) ) ( not ( = ?auto_168623 ?auto_168621 ) ) ( not ( = ?auto_168623 ?auto_168620 ) ) ( not ( = ?auto_168619 ?auto_168622 ) ) ( not ( = ?auto_168619 ?auto_168625 ) ) ( not ( = ?auto_168619 ?auto_168624 ) ) ( not ( = ?auto_168619 ?auto_168623 ) ) ( HOLDING ?auto_168619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168619 )
      ( MAKE-3PILE ?auto_168619 ?auto_168620 ?auto_168621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168627 - BLOCK
      ?auto_168628 - BLOCK
      ?auto_168629 - BLOCK
    )
    :vars
    (
      ?auto_168631 - BLOCK
      ?auto_168630 - BLOCK
      ?auto_168634 - BLOCK
      ?auto_168633 - BLOCK
      ?auto_168632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168627 ?auto_168628 ) ) ( not ( = ?auto_168627 ?auto_168629 ) ) ( not ( = ?auto_168628 ?auto_168629 ) ) ( ON ?auto_168629 ?auto_168631 ) ( not ( = ?auto_168627 ?auto_168631 ) ) ( not ( = ?auto_168628 ?auto_168631 ) ) ( not ( = ?auto_168629 ?auto_168631 ) ) ( ON ?auto_168628 ?auto_168629 ) ( ON-TABLE ?auto_168630 ) ( ON ?auto_168634 ?auto_168630 ) ( ON ?auto_168633 ?auto_168634 ) ( ON ?auto_168632 ?auto_168633 ) ( ON ?auto_168631 ?auto_168632 ) ( not ( = ?auto_168630 ?auto_168634 ) ) ( not ( = ?auto_168630 ?auto_168633 ) ) ( not ( = ?auto_168630 ?auto_168632 ) ) ( not ( = ?auto_168630 ?auto_168631 ) ) ( not ( = ?auto_168630 ?auto_168629 ) ) ( not ( = ?auto_168630 ?auto_168628 ) ) ( not ( = ?auto_168634 ?auto_168633 ) ) ( not ( = ?auto_168634 ?auto_168632 ) ) ( not ( = ?auto_168634 ?auto_168631 ) ) ( not ( = ?auto_168634 ?auto_168629 ) ) ( not ( = ?auto_168634 ?auto_168628 ) ) ( not ( = ?auto_168633 ?auto_168632 ) ) ( not ( = ?auto_168633 ?auto_168631 ) ) ( not ( = ?auto_168633 ?auto_168629 ) ) ( not ( = ?auto_168633 ?auto_168628 ) ) ( not ( = ?auto_168632 ?auto_168631 ) ) ( not ( = ?auto_168632 ?auto_168629 ) ) ( not ( = ?auto_168632 ?auto_168628 ) ) ( not ( = ?auto_168627 ?auto_168630 ) ) ( not ( = ?auto_168627 ?auto_168634 ) ) ( not ( = ?auto_168627 ?auto_168633 ) ) ( not ( = ?auto_168627 ?auto_168632 ) ) ( ON ?auto_168627 ?auto_168628 ) ( CLEAR ?auto_168627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168630 ?auto_168634 ?auto_168633 ?auto_168632 ?auto_168631 ?auto_168629 ?auto_168628 )
      ( MAKE-3PILE ?auto_168627 ?auto_168628 ?auto_168629 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168635 - BLOCK
      ?auto_168636 - BLOCK
      ?auto_168637 - BLOCK
    )
    :vars
    (
      ?auto_168640 - BLOCK
      ?auto_168641 - BLOCK
      ?auto_168638 - BLOCK
      ?auto_168639 - BLOCK
      ?auto_168642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168635 ?auto_168636 ) ) ( not ( = ?auto_168635 ?auto_168637 ) ) ( not ( = ?auto_168636 ?auto_168637 ) ) ( ON ?auto_168637 ?auto_168640 ) ( not ( = ?auto_168635 ?auto_168640 ) ) ( not ( = ?auto_168636 ?auto_168640 ) ) ( not ( = ?auto_168637 ?auto_168640 ) ) ( ON ?auto_168636 ?auto_168637 ) ( ON-TABLE ?auto_168641 ) ( ON ?auto_168638 ?auto_168641 ) ( ON ?auto_168639 ?auto_168638 ) ( ON ?auto_168642 ?auto_168639 ) ( ON ?auto_168640 ?auto_168642 ) ( not ( = ?auto_168641 ?auto_168638 ) ) ( not ( = ?auto_168641 ?auto_168639 ) ) ( not ( = ?auto_168641 ?auto_168642 ) ) ( not ( = ?auto_168641 ?auto_168640 ) ) ( not ( = ?auto_168641 ?auto_168637 ) ) ( not ( = ?auto_168641 ?auto_168636 ) ) ( not ( = ?auto_168638 ?auto_168639 ) ) ( not ( = ?auto_168638 ?auto_168642 ) ) ( not ( = ?auto_168638 ?auto_168640 ) ) ( not ( = ?auto_168638 ?auto_168637 ) ) ( not ( = ?auto_168638 ?auto_168636 ) ) ( not ( = ?auto_168639 ?auto_168642 ) ) ( not ( = ?auto_168639 ?auto_168640 ) ) ( not ( = ?auto_168639 ?auto_168637 ) ) ( not ( = ?auto_168639 ?auto_168636 ) ) ( not ( = ?auto_168642 ?auto_168640 ) ) ( not ( = ?auto_168642 ?auto_168637 ) ) ( not ( = ?auto_168642 ?auto_168636 ) ) ( not ( = ?auto_168635 ?auto_168641 ) ) ( not ( = ?auto_168635 ?auto_168638 ) ) ( not ( = ?auto_168635 ?auto_168639 ) ) ( not ( = ?auto_168635 ?auto_168642 ) ) ( HOLDING ?auto_168635 ) ( CLEAR ?auto_168636 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168641 ?auto_168638 ?auto_168639 ?auto_168642 ?auto_168640 ?auto_168637 ?auto_168636 ?auto_168635 )
      ( MAKE-3PILE ?auto_168635 ?auto_168636 ?auto_168637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168643 - BLOCK
      ?auto_168644 - BLOCK
      ?auto_168645 - BLOCK
    )
    :vars
    (
      ?auto_168648 - BLOCK
      ?auto_168649 - BLOCK
      ?auto_168647 - BLOCK
      ?auto_168650 - BLOCK
      ?auto_168646 - BLOCK
      ?auto_168651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168643 ?auto_168644 ) ) ( not ( = ?auto_168643 ?auto_168645 ) ) ( not ( = ?auto_168644 ?auto_168645 ) ) ( ON ?auto_168645 ?auto_168648 ) ( not ( = ?auto_168643 ?auto_168648 ) ) ( not ( = ?auto_168644 ?auto_168648 ) ) ( not ( = ?auto_168645 ?auto_168648 ) ) ( ON ?auto_168644 ?auto_168645 ) ( ON-TABLE ?auto_168649 ) ( ON ?auto_168647 ?auto_168649 ) ( ON ?auto_168650 ?auto_168647 ) ( ON ?auto_168646 ?auto_168650 ) ( ON ?auto_168648 ?auto_168646 ) ( not ( = ?auto_168649 ?auto_168647 ) ) ( not ( = ?auto_168649 ?auto_168650 ) ) ( not ( = ?auto_168649 ?auto_168646 ) ) ( not ( = ?auto_168649 ?auto_168648 ) ) ( not ( = ?auto_168649 ?auto_168645 ) ) ( not ( = ?auto_168649 ?auto_168644 ) ) ( not ( = ?auto_168647 ?auto_168650 ) ) ( not ( = ?auto_168647 ?auto_168646 ) ) ( not ( = ?auto_168647 ?auto_168648 ) ) ( not ( = ?auto_168647 ?auto_168645 ) ) ( not ( = ?auto_168647 ?auto_168644 ) ) ( not ( = ?auto_168650 ?auto_168646 ) ) ( not ( = ?auto_168650 ?auto_168648 ) ) ( not ( = ?auto_168650 ?auto_168645 ) ) ( not ( = ?auto_168650 ?auto_168644 ) ) ( not ( = ?auto_168646 ?auto_168648 ) ) ( not ( = ?auto_168646 ?auto_168645 ) ) ( not ( = ?auto_168646 ?auto_168644 ) ) ( not ( = ?auto_168643 ?auto_168649 ) ) ( not ( = ?auto_168643 ?auto_168647 ) ) ( not ( = ?auto_168643 ?auto_168650 ) ) ( not ( = ?auto_168643 ?auto_168646 ) ) ( CLEAR ?auto_168644 ) ( ON ?auto_168643 ?auto_168651 ) ( CLEAR ?auto_168643 ) ( HAND-EMPTY ) ( not ( = ?auto_168643 ?auto_168651 ) ) ( not ( = ?auto_168644 ?auto_168651 ) ) ( not ( = ?auto_168645 ?auto_168651 ) ) ( not ( = ?auto_168648 ?auto_168651 ) ) ( not ( = ?auto_168649 ?auto_168651 ) ) ( not ( = ?auto_168647 ?auto_168651 ) ) ( not ( = ?auto_168650 ?auto_168651 ) ) ( not ( = ?auto_168646 ?auto_168651 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168643 ?auto_168651 )
      ( MAKE-3PILE ?auto_168643 ?auto_168644 ?auto_168645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168652 - BLOCK
      ?auto_168653 - BLOCK
      ?auto_168654 - BLOCK
    )
    :vars
    (
      ?auto_168660 - BLOCK
      ?auto_168656 - BLOCK
      ?auto_168657 - BLOCK
      ?auto_168658 - BLOCK
      ?auto_168655 - BLOCK
      ?auto_168659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168652 ?auto_168653 ) ) ( not ( = ?auto_168652 ?auto_168654 ) ) ( not ( = ?auto_168653 ?auto_168654 ) ) ( ON ?auto_168654 ?auto_168660 ) ( not ( = ?auto_168652 ?auto_168660 ) ) ( not ( = ?auto_168653 ?auto_168660 ) ) ( not ( = ?auto_168654 ?auto_168660 ) ) ( ON-TABLE ?auto_168656 ) ( ON ?auto_168657 ?auto_168656 ) ( ON ?auto_168658 ?auto_168657 ) ( ON ?auto_168655 ?auto_168658 ) ( ON ?auto_168660 ?auto_168655 ) ( not ( = ?auto_168656 ?auto_168657 ) ) ( not ( = ?auto_168656 ?auto_168658 ) ) ( not ( = ?auto_168656 ?auto_168655 ) ) ( not ( = ?auto_168656 ?auto_168660 ) ) ( not ( = ?auto_168656 ?auto_168654 ) ) ( not ( = ?auto_168656 ?auto_168653 ) ) ( not ( = ?auto_168657 ?auto_168658 ) ) ( not ( = ?auto_168657 ?auto_168655 ) ) ( not ( = ?auto_168657 ?auto_168660 ) ) ( not ( = ?auto_168657 ?auto_168654 ) ) ( not ( = ?auto_168657 ?auto_168653 ) ) ( not ( = ?auto_168658 ?auto_168655 ) ) ( not ( = ?auto_168658 ?auto_168660 ) ) ( not ( = ?auto_168658 ?auto_168654 ) ) ( not ( = ?auto_168658 ?auto_168653 ) ) ( not ( = ?auto_168655 ?auto_168660 ) ) ( not ( = ?auto_168655 ?auto_168654 ) ) ( not ( = ?auto_168655 ?auto_168653 ) ) ( not ( = ?auto_168652 ?auto_168656 ) ) ( not ( = ?auto_168652 ?auto_168657 ) ) ( not ( = ?auto_168652 ?auto_168658 ) ) ( not ( = ?auto_168652 ?auto_168655 ) ) ( ON ?auto_168652 ?auto_168659 ) ( CLEAR ?auto_168652 ) ( not ( = ?auto_168652 ?auto_168659 ) ) ( not ( = ?auto_168653 ?auto_168659 ) ) ( not ( = ?auto_168654 ?auto_168659 ) ) ( not ( = ?auto_168660 ?auto_168659 ) ) ( not ( = ?auto_168656 ?auto_168659 ) ) ( not ( = ?auto_168657 ?auto_168659 ) ) ( not ( = ?auto_168658 ?auto_168659 ) ) ( not ( = ?auto_168655 ?auto_168659 ) ) ( HOLDING ?auto_168653 ) ( CLEAR ?auto_168654 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168656 ?auto_168657 ?auto_168658 ?auto_168655 ?auto_168660 ?auto_168654 ?auto_168653 )
      ( MAKE-3PILE ?auto_168652 ?auto_168653 ?auto_168654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168661 - BLOCK
      ?auto_168662 - BLOCK
      ?auto_168663 - BLOCK
    )
    :vars
    (
      ?auto_168664 - BLOCK
      ?auto_168666 - BLOCK
      ?auto_168665 - BLOCK
      ?auto_168668 - BLOCK
      ?auto_168667 - BLOCK
      ?auto_168669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168661 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168663 ) ) ( not ( = ?auto_168662 ?auto_168663 ) ) ( ON ?auto_168663 ?auto_168664 ) ( not ( = ?auto_168661 ?auto_168664 ) ) ( not ( = ?auto_168662 ?auto_168664 ) ) ( not ( = ?auto_168663 ?auto_168664 ) ) ( ON-TABLE ?auto_168666 ) ( ON ?auto_168665 ?auto_168666 ) ( ON ?auto_168668 ?auto_168665 ) ( ON ?auto_168667 ?auto_168668 ) ( ON ?auto_168664 ?auto_168667 ) ( not ( = ?auto_168666 ?auto_168665 ) ) ( not ( = ?auto_168666 ?auto_168668 ) ) ( not ( = ?auto_168666 ?auto_168667 ) ) ( not ( = ?auto_168666 ?auto_168664 ) ) ( not ( = ?auto_168666 ?auto_168663 ) ) ( not ( = ?auto_168666 ?auto_168662 ) ) ( not ( = ?auto_168665 ?auto_168668 ) ) ( not ( = ?auto_168665 ?auto_168667 ) ) ( not ( = ?auto_168665 ?auto_168664 ) ) ( not ( = ?auto_168665 ?auto_168663 ) ) ( not ( = ?auto_168665 ?auto_168662 ) ) ( not ( = ?auto_168668 ?auto_168667 ) ) ( not ( = ?auto_168668 ?auto_168664 ) ) ( not ( = ?auto_168668 ?auto_168663 ) ) ( not ( = ?auto_168668 ?auto_168662 ) ) ( not ( = ?auto_168667 ?auto_168664 ) ) ( not ( = ?auto_168667 ?auto_168663 ) ) ( not ( = ?auto_168667 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168666 ) ) ( not ( = ?auto_168661 ?auto_168665 ) ) ( not ( = ?auto_168661 ?auto_168668 ) ) ( not ( = ?auto_168661 ?auto_168667 ) ) ( ON ?auto_168661 ?auto_168669 ) ( not ( = ?auto_168661 ?auto_168669 ) ) ( not ( = ?auto_168662 ?auto_168669 ) ) ( not ( = ?auto_168663 ?auto_168669 ) ) ( not ( = ?auto_168664 ?auto_168669 ) ) ( not ( = ?auto_168666 ?auto_168669 ) ) ( not ( = ?auto_168665 ?auto_168669 ) ) ( not ( = ?auto_168668 ?auto_168669 ) ) ( not ( = ?auto_168667 ?auto_168669 ) ) ( CLEAR ?auto_168663 ) ( ON ?auto_168662 ?auto_168661 ) ( CLEAR ?auto_168662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168669 ?auto_168661 )
      ( MAKE-3PILE ?auto_168661 ?auto_168662 ?auto_168663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168670 - BLOCK
      ?auto_168671 - BLOCK
      ?auto_168672 - BLOCK
    )
    :vars
    (
      ?auto_168673 - BLOCK
      ?auto_168676 - BLOCK
      ?auto_168678 - BLOCK
      ?auto_168674 - BLOCK
      ?auto_168677 - BLOCK
      ?auto_168675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168670 ?auto_168671 ) ) ( not ( = ?auto_168670 ?auto_168672 ) ) ( not ( = ?auto_168671 ?auto_168672 ) ) ( not ( = ?auto_168670 ?auto_168673 ) ) ( not ( = ?auto_168671 ?auto_168673 ) ) ( not ( = ?auto_168672 ?auto_168673 ) ) ( ON-TABLE ?auto_168676 ) ( ON ?auto_168678 ?auto_168676 ) ( ON ?auto_168674 ?auto_168678 ) ( ON ?auto_168677 ?auto_168674 ) ( ON ?auto_168673 ?auto_168677 ) ( not ( = ?auto_168676 ?auto_168678 ) ) ( not ( = ?auto_168676 ?auto_168674 ) ) ( not ( = ?auto_168676 ?auto_168677 ) ) ( not ( = ?auto_168676 ?auto_168673 ) ) ( not ( = ?auto_168676 ?auto_168672 ) ) ( not ( = ?auto_168676 ?auto_168671 ) ) ( not ( = ?auto_168678 ?auto_168674 ) ) ( not ( = ?auto_168678 ?auto_168677 ) ) ( not ( = ?auto_168678 ?auto_168673 ) ) ( not ( = ?auto_168678 ?auto_168672 ) ) ( not ( = ?auto_168678 ?auto_168671 ) ) ( not ( = ?auto_168674 ?auto_168677 ) ) ( not ( = ?auto_168674 ?auto_168673 ) ) ( not ( = ?auto_168674 ?auto_168672 ) ) ( not ( = ?auto_168674 ?auto_168671 ) ) ( not ( = ?auto_168677 ?auto_168673 ) ) ( not ( = ?auto_168677 ?auto_168672 ) ) ( not ( = ?auto_168677 ?auto_168671 ) ) ( not ( = ?auto_168670 ?auto_168676 ) ) ( not ( = ?auto_168670 ?auto_168678 ) ) ( not ( = ?auto_168670 ?auto_168674 ) ) ( not ( = ?auto_168670 ?auto_168677 ) ) ( ON ?auto_168670 ?auto_168675 ) ( not ( = ?auto_168670 ?auto_168675 ) ) ( not ( = ?auto_168671 ?auto_168675 ) ) ( not ( = ?auto_168672 ?auto_168675 ) ) ( not ( = ?auto_168673 ?auto_168675 ) ) ( not ( = ?auto_168676 ?auto_168675 ) ) ( not ( = ?auto_168678 ?auto_168675 ) ) ( not ( = ?auto_168674 ?auto_168675 ) ) ( not ( = ?auto_168677 ?auto_168675 ) ) ( ON ?auto_168671 ?auto_168670 ) ( CLEAR ?auto_168671 ) ( ON-TABLE ?auto_168675 ) ( HOLDING ?auto_168672 ) ( CLEAR ?auto_168673 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168676 ?auto_168678 ?auto_168674 ?auto_168677 ?auto_168673 ?auto_168672 )
      ( MAKE-3PILE ?auto_168670 ?auto_168671 ?auto_168672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168679 - BLOCK
      ?auto_168680 - BLOCK
      ?auto_168681 - BLOCK
    )
    :vars
    (
      ?auto_168686 - BLOCK
      ?auto_168685 - BLOCK
      ?auto_168687 - BLOCK
      ?auto_168683 - BLOCK
      ?auto_168682 - BLOCK
      ?auto_168684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168679 ?auto_168680 ) ) ( not ( = ?auto_168679 ?auto_168681 ) ) ( not ( = ?auto_168680 ?auto_168681 ) ) ( not ( = ?auto_168679 ?auto_168686 ) ) ( not ( = ?auto_168680 ?auto_168686 ) ) ( not ( = ?auto_168681 ?auto_168686 ) ) ( ON-TABLE ?auto_168685 ) ( ON ?auto_168687 ?auto_168685 ) ( ON ?auto_168683 ?auto_168687 ) ( ON ?auto_168682 ?auto_168683 ) ( ON ?auto_168686 ?auto_168682 ) ( not ( = ?auto_168685 ?auto_168687 ) ) ( not ( = ?auto_168685 ?auto_168683 ) ) ( not ( = ?auto_168685 ?auto_168682 ) ) ( not ( = ?auto_168685 ?auto_168686 ) ) ( not ( = ?auto_168685 ?auto_168681 ) ) ( not ( = ?auto_168685 ?auto_168680 ) ) ( not ( = ?auto_168687 ?auto_168683 ) ) ( not ( = ?auto_168687 ?auto_168682 ) ) ( not ( = ?auto_168687 ?auto_168686 ) ) ( not ( = ?auto_168687 ?auto_168681 ) ) ( not ( = ?auto_168687 ?auto_168680 ) ) ( not ( = ?auto_168683 ?auto_168682 ) ) ( not ( = ?auto_168683 ?auto_168686 ) ) ( not ( = ?auto_168683 ?auto_168681 ) ) ( not ( = ?auto_168683 ?auto_168680 ) ) ( not ( = ?auto_168682 ?auto_168686 ) ) ( not ( = ?auto_168682 ?auto_168681 ) ) ( not ( = ?auto_168682 ?auto_168680 ) ) ( not ( = ?auto_168679 ?auto_168685 ) ) ( not ( = ?auto_168679 ?auto_168687 ) ) ( not ( = ?auto_168679 ?auto_168683 ) ) ( not ( = ?auto_168679 ?auto_168682 ) ) ( ON ?auto_168679 ?auto_168684 ) ( not ( = ?auto_168679 ?auto_168684 ) ) ( not ( = ?auto_168680 ?auto_168684 ) ) ( not ( = ?auto_168681 ?auto_168684 ) ) ( not ( = ?auto_168686 ?auto_168684 ) ) ( not ( = ?auto_168685 ?auto_168684 ) ) ( not ( = ?auto_168687 ?auto_168684 ) ) ( not ( = ?auto_168683 ?auto_168684 ) ) ( not ( = ?auto_168682 ?auto_168684 ) ) ( ON ?auto_168680 ?auto_168679 ) ( ON-TABLE ?auto_168684 ) ( CLEAR ?auto_168686 ) ( ON ?auto_168681 ?auto_168680 ) ( CLEAR ?auto_168681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168684 ?auto_168679 ?auto_168680 )
      ( MAKE-3PILE ?auto_168679 ?auto_168680 ?auto_168681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168688 - BLOCK
      ?auto_168689 - BLOCK
      ?auto_168690 - BLOCK
    )
    :vars
    (
      ?auto_168692 - BLOCK
      ?auto_168694 - BLOCK
      ?auto_168691 - BLOCK
      ?auto_168693 - BLOCK
      ?auto_168695 - BLOCK
      ?auto_168696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168688 ?auto_168689 ) ) ( not ( = ?auto_168688 ?auto_168690 ) ) ( not ( = ?auto_168689 ?auto_168690 ) ) ( not ( = ?auto_168688 ?auto_168692 ) ) ( not ( = ?auto_168689 ?auto_168692 ) ) ( not ( = ?auto_168690 ?auto_168692 ) ) ( ON-TABLE ?auto_168694 ) ( ON ?auto_168691 ?auto_168694 ) ( ON ?auto_168693 ?auto_168691 ) ( ON ?auto_168695 ?auto_168693 ) ( not ( = ?auto_168694 ?auto_168691 ) ) ( not ( = ?auto_168694 ?auto_168693 ) ) ( not ( = ?auto_168694 ?auto_168695 ) ) ( not ( = ?auto_168694 ?auto_168692 ) ) ( not ( = ?auto_168694 ?auto_168690 ) ) ( not ( = ?auto_168694 ?auto_168689 ) ) ( not ( = ?auto_168691 ?auto_168693 ) ) ( not ( = ?auto_168691 ?auto_168695 ) ) ( not ( = ?auto_168691 ?auto_168692 ) ) ( not ( = ?auto_168691 ?auto_168690 ) ) ( not ( = ?auto_168691 ?auto_168689 ) ) ( not ( = ?auto_168693 ?auto_168695 ) ) ( not ( = ?auto_168693 ?auto_168692 ) ) ( not ( = ?auto_168693 ?auto_168690 ) ) ( not ( = ?auto_168693 ?auto_168689 ) ) ( not ( = ?auto_168695 ?auto_168692 ) ) ( not ( = ?auto_168695 ?auto_168690 ) ) ( not ( = ?auto_168695 ?auto_168689 ) ) ( not ( = ?auto_168688 ?auto_168694 ) ) ( not ( = ?auto_168688 ?auto_168691 ) ) ( not ( = ?auto_168688 ?auto_168693 ) ) ( not ( = ?auto_168688 ?auto_168695 ) ) ( ON ?auto_168688 ?auto_168696 ) ( not ( = ?auto_168688 ?auto_168696 ) ) ( not ( = ?auto_168689 ?auto_168696 ) ) ( not ( = ?auto_168690 ?auto_168696 ) ) ( not ( = ?auto_168692 ?auto_168696 ) ) ( not ( = ?auto_168694 ?auto_168696 ) ) ( not ( = ?auto_168691 ?auto_168696 ) ) ( not ( = ?auto_168693 ?auto_168696 ) ) ( not ( = ?auto_168695 ?auto_168696 ) ) ( ON ?auto_168689 ?auto_168688 ) ( ON-TABLE ?auto_168696 ) ( ON ?auto_168690 ?auto_168689 ) ( CLEAR ?auto_168690 ) ( HOLDING ?auto_168692 ) ( CLEAR ?auto_168695 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168694 ?auto_168691 ?auto_168693 ?auto_168695 ?auto_168692 )
      ( MAKE-3PILE ?auto_168688 ?auto_168689 ?auto_168690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168697 - BLOCK
      ?auto_168698 - BLOCK
      ?auto_168699 - BLOCK
    )
    :vars
    (
      ?auto_168704 - BLOCK
      ?auto_168701 - BLOCK
      ?auto_168700 - BLOCK
      ?auto_168702 - BLOCK
      ?auto_168703 - BLOCK
      ?auto_168705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168697 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168699 ) ) ( not ( = ?auto_168698 ?auto_168699 ) ) ( not ( = ?auto_168697 ?auto_168704 ) ) ( not ( = ?auto_168698 ?auto_168704 ) ) ( not ( = ?auto_168699 ?auto_168704 ) ) ( ON-TABLE ?auto_168701 ) ( ON ?auto_168700 ?auto_168701 ) ( ON ?auto_168702 ?auto_168700 ) ( ON ?auto_168703 ?auto_168702 ) ( not ( = ?auto_168701 ?auto_168700 ) ) ( not ( = ?auto_168701 ?auto_168702 ) ) ( not ( = ?auto_168701 ?auto_168703 ) ) ( not ( = ?auto_168701 ?auto_168704 ) ) ( not ( = ?auto_168701 ?auto_168699 ) ) ( not ( = ?auto_168701 ?auto_168698 ) ) ( not ( = ?auto_168700 ?auto_168702 ) ) ( not ( = ?auto_168700 ?auto_168703 ) ) ( not ( = ?auto_168700 ?auto_168704 ) ) ( not ( = ?auto_168700 ?auto_168699 ) ) ( not ( = ?auto_168700 ?auto_168698 ) ) ( not ( = ?auto_168702 ?auto_168703 ) ) ( not ( = ?auto_168702 ?auto_168704 ) ) ( not ( = ?auto_168702 ?auto_168699 ) ) ( not ( = ?auto_168702 ?auto_168698 ) ) ( not ( = ?auto_168703 ?auto_168704 ) ) ( not ( = ?auto_168703 ?auto_168699 ) ) ( not ( = ?auto_168703 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168701 ) ) ( not ( = ?auto_168697 ?auto_168700 ) ) ( not ( = ?auto_168697 ?auto_168702 ) ) ( not ( = ?auto_168697 ?auto_168703 ) ) ( ON ?auto_168697 ?auto_168705 ) ( not ( = ?auto_168697 ?auto_168705 ) ) ( not ( = ?auto_168698 ?auto_168705 ) ) ( not ( = ?auto_168699 ?auto_168705 ) ) ( not ( = ?auto_168704 ?auto_168705 ) ) ( not ( = ?auto_168701 ?auto_168705 ) ) ( not ( = ?auto_168700 ?auto_168705 ) ) ( not ( = ?auto_168702 ?auto_168705 ) ) ( not ( = ?auto_168703 ?auto_168705 ) ) ( ON ?auto_168698 ?auto_168697 ) ( ON-TABLE ?auto_168705 ) ( ON ?auto_168699 ?auto_168698 ) ( CLEAR ?auto_168703 ) ( ON ?auto_168704 ?auto_168699 ) ( CLEAR ?auto_168704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168705 ?auto_168697 ?auto_168698 ?auto_168699 )
      ( MAKE-3PILE ?auto_168697 ?auto_168698 ?auto_168699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168706 - BLOCK
      ?auto_168707 - BLOCK
      ?auto_168708 - BLOCK
    )
    :vars
    (
      ?auto_168713 - BLOCK
      ?auto_168714 - BLOCK
      ?auto_168711 - BLOCK
      ?auto_168710 - BLOCK
      ?auto_168712 - BLOCK
      ?auto_168709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168706 ?auto_168707 ) ) ( not ( = ?auto_168706 ?auto_168708 ) ) ( not ( = ?auto_168707 ?auto_168708 ) ) ( not ( = ?auto_168706 ?auto_168713 ) ) ( not ( = ?auto_168707 ?auto_168713 ) ) ( not ( = ?auto_168708 ?auto_168713 ) ) ( ON-TABLE ?auto_168714 ) ( ON ?auto_168711 ?auto_168714 ) ( ON ?auto_168710 ?auto_168711 ) ( not ( = ?auto_168714 ?auto_168711 ) ) ( not ( = ?auto_168714 ?auto_168710 ) ) ( not ( = ?auto_168714 ?auto_168712 ) ) ( not ( = ?auto_168714 ?auto_168713 ) ) ( not ( = ?auto_168714 ?auto_168708 ) ) ( not ( = ?auto_168714 ?auto_168707 ) ) ( not ( = ?auto_168711 ?auto_168710 ) ) ( not ( = ?auto_168711 ?auto_168712 ) ) ( not ( = ?auto_168711 ?auto_168713 ) ) ( not ( = ?auto_168711 ?auto_168708 ) ) ( not ( = ?auto_168711 ?auto_168707 ) ) ( not ( = ?auto_168710 ?auto_168712 ) ) ( not ( = ?auto_168710 ?auto_168713 ) ) ( not ( = ?auto_168710 ?auto_168708 ) ) ( not ( = ?auto_168710 ?auto_168707 ) ) ( not ( = ?auto_168712 ?auto_168713 ) ) ( not ( = ?auto_168712 ?auto_168708 ) ) ( not ( = ?auto_168712 ?auto_168707 ) ) ( not ( = ?auto_168706 ?auto_168714 ) ) ( not ( = ?auto_168706 ?auto_168711 ) ) ( not ( = ?auto_168706 ?auto_168710 ) ) ( not ( = ?auto_168706 ?auto_168712 ) ) ( ON ?auto_168706 ?auto_168709 ) ( not ( = ?auto_168706 ?auto_168709 ) ) ( not ( = ?auto_168707 ?auto_168709 ) ) ( not ( = ?auto_168708 ?auto_168709 ) ) ( not ( = ?auto_168713 ?auto_168709 ) ) ( not ( = ?auto_168714 ?auto_168709 ) ) ( not ( = ?auto_168711 ?auto_168709 ) ) ( not ( = ?auto_168710 ?auto_168709 ) ) ( not ( = ?auto_168712 ?auto_168709 ) ) ( ON ?auto_168707 ?auto_168706 ) ( ON-TABLE ?auto_168709 ) ( ON ?auto_168708 ?auto_168707 ) ( ON ?auto_168713 ?auto_168708 ) ( CLEAR ?auto_168713 ) ( HOLDING ?auto_168712 ) ( CLEAR ?auto_168710 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168714 ?auto_168711 ?auto_168710 ?auto_168712 )
      ( MAKE-3PILE ?auto_168706 ?auto_168707 ?auto_168708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168715 - BLOCK
      ?auto_168716 - BLOCK
      ?auto_168717 - BLOCK
    )
    :vars
    (
      ?auto_168722 - BLOCK
      ?auto_168718 - BLOCK
      ?auto_168721 - BLOCK
      ?auto_168723 - BLOCK
      ?auto_168719 - BLOCK
      ?auto_168720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168715 ?auto_168716 ) ) ( not ( = ?auto_168715 ?auto_168717 ) ) ( not ( = ?auto_168716 ?auto_168717 ) ) ( not ( = ?auto_168715 ?auto_168722 ) ) ( not ( = ?auto_168716 ?auto_168722 ) ) ( not ( = ?auto_168717 ?auto_168722 ) ) ( ON-TABLE ?auto_168718 ) ( ON ?auto_168721 ?auto_168718 ) ( ON ?auto_168723 ?auto_168721 ) ( not ( = ?auto_168718 ?auto_168721 ) ) ( not ( = ?auto_168718 ?auto_168723 ) ) ( not ( = ?auto_168718 ?auto_168719 ) ) ( not ( = ?auto_168718 ?auto_168722 ) ) ( not ( = ?auto_168718 ?auto_168717 ) ) ( not ( = ?auto_168718 ?auto_168716 ) ) ( not ( = ?auto_168721 ?auto_168723 ) ) ( not ( = ?auto_168721 ?auto_168719 ) ) ( not ( = ?auto_168721 ?auto_168722 ) ) ( not ( = ?auto_168721 ?auto_168717 ) ) ( not ( = ?auto_168721 ?auto_168716 ) ) ( not ( = ?auto_168723 ?auto_168719 ) ) ( not ( = ?auto_168723 ?auto_168722 ) ) ( not ( = ?auto_168723 ?auto_168717 ) ) ( not ( = ?auto_168723 ?auto_168716 ) ) ( not ( = ?auto_168719 ?auto_168722 ) ) ( not ( = ?auto_168719 ?auto_168717 ) ) ( not ( = ?auto_168719 ?auto_168716 ) ) ( not ( = ?auto_168715 ?auto_168718 ) ) ( not ( = ?auto_168715 ?auto_168721 ) ) ( not ( = ?auto_168715 ?auto_168723 ) ) ( not ( = ?auto_168715 ?auto_168719 ) ) ( ON ?auto_168715 ?auto_168720 ) ( not ( = ?auto_168715 ?auto_168720 ) ) ( not ( = ?auto_168716 ?auto_168720 ) ) ( not ( = ?auto_168717 ?auto_168720 ) ) ( not ( = ?auto_168722 ?auto_168720 ) ) ( not ( = ?auto_168718 ?auto_168720 ) ) ( not ( = ?auto_168721 ?auto_168720 ) ) ( not ( = ?auto_168723 ?auto_168720 ) ) ( not ( = ?auto_168719 ?auto_168720 ) ) ( ON ?auto_168716 ?auto_168715 ) ( ON-TABLE ?auto_168720 ) ( ON ?auto_168717 ?auto_168716 ) ( ON ?auto_168722 ?auto_168717 ) ( CLEAR ?auto_168723 ) ( ON ?auto_168719 ?auto_168722 ) ( CLEAR ?auto_168719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168720 ?auto_168715 ?auto_168716 ?auto_168717 ?auto_168722 )
      ( MAKE-3PILE ?auto_168715 ?auto_168716 ?auto_168717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168724 - BLOCK
      ?auto_168725 - BLOCK
      ?auto_168726 - BLOCK
    )
    :vars
    (
      ?auto_168730 - BLOCK
      ?auto_168727 - BLOCK
      ?auto_168728 - BLOCK
      ?auto_168732 - BLOCK
      ?auto_168729 - BLOCK
      ?auto_168731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168724 ?auto_168725 ) ) ( not ( = ?auto_168724 ?auto_168726 ) ) ( not ( = ?auto_168725 ?auto_168726 ) ) ( not ( = ?auto_168724 ?auto_168730 ) ) ( not ( = ?auto_168725 ?auto_168730 ) ) ( not ( = ?auto_168726 ?auto_168730 ) ) ( ON-TABLE ?auto_168727 ) ( ON ?auto_168728 ?auto_168727 ) ( not ( = ?auto_168727 ?auto_168728 ) ) ( not ( = ?auto_168727 ?auto_168732 ) ) ( not ( = ?auto_168727 ?auto_168729 ) ) ( not ( = ?auto_168727 ?auto_168730 ) ) ( not ( = ?auto_168727 ?auto_168726 ) ) ( not ( = ?auto_168727 ?auto_168725 ) ) ( not ( = ?auto_168728 ?auto_168732 ) ) ( not ( = ?auto_168728 ?auto_168729 ) ) ( not ( = ?auto_168728 ?auto_168730 ) ) ( not ( = ?auto_168728 ?auto_168726 ) ) ( not ( = ?auto_168728 ?auto_168725 ) ) ( not ( = ?auto_168732 ?auto_168729 ) ) ( not ( = ?auto_168732 ?auto_168730 ) ) ( not ( = ?auto_168732 ?auto_168726 ) ) ( not ( = ?auto_168732 ?auto_168725 ) ) ( not ( = ?auto_168729 ?auto_168730 ) ) ( not ( = ?auto_168729 ?auto_168726 ) ) ( not ( = ?auto_168729 ?auto_168725 ) ) ( not ( = ?auto_168724 ?auto_168727 ) ) ( not ( = ?auto_168724 ?auto_168728 ) ) ( not ( = ?auto_168724 ?auto_168732 ) ) ( not ( = ?auto_168724 ?auto_168729 ) ) ( ON ?auto_168724 ?auto_168731 ) ( not ( = ?auto_168724 ?auto_168731 ) ) ( not ( = ?auto_168725 ?auto_168731 ) ) ( not ( = ?auto_168726 ?auto_168731 ) ) ( not ( = ?auto_168730 ?auto_168731 ) ) ( not ( = ?auto_168727 ?auto_168731 ) ) ( not ( = ?auto_168728 ?auto_168731 ) ) ( not ( = ?auto_168732 ?auto_168731 ) ) ( not ( = ?auto_168729 ?auto_168731 ) ) ( ON ?auto_168725 ?auto_168724 ) ( ON-TABLE ?auto_168731 ) ( ON ?auto_168726 ?auto_168725 ) ( ON ?auto_168730 ?auto_168726 ) ( ON ?auto_168729 ?auto_168730 ) ( CLEAR ?auto_168729 ) ( HOLDING ?auto_168732 ) ( CLEAR ?auto_168728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168727 ?auto_168728 ?auto_168732 )
      ( MAKE-3PILE ?auto_168724 ?auto_168725 ?auto_168726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168733 - BLOCK
      ?auto_168734 - BLOCK
      ?auto_168735 - BLOCK
    )
    :vars
    (
      ?auto_168737 - BLOCK
      ?auto_168740 - BLOCK
      ?auto_168738 - BLOCK
      ?auto_168736 - BLOCK
      ?auto_168739 - BLOCK
      ?auto_168741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168733 ?auto_168734 ) ) ( not ( = ?auto_168733 ?auto_168735 ) ) ( not ( = ?auto_168734 ?auto_168735 ) ) ( not ( = ?auto_168733 ?auto_168737 ) ) ( not ( = ?auto_168734 ?auto_168737 ) ) ( not ( = ?auto_168735 ?auto_168737 ) ) ( ON-TABLE ?auto_168740 ) ( ON ?auto_168738 ?auto_168740 ) ( not ( = ?auto_168740 ?auto_168738 ) ) ( not ( = ?auto_168740 ?auto_168736 ) ) ( not ( = ?auto_168740 ?auto_168739 ) ) ( not ( = ?auto_168740 ?auto_168737 ) ) ( not ( = ?auto_168740 ?auto_168735 ) ) ( not ( = ?auto_168740 ?auto_168734 ) ) ( not ( = ?auto_168738 ?auto_168736 ) ) ( not ( = ?auto_168738 ?auto_168739 ) ) ( not ( = ?auto_168738 ?auto_168737 ) ) ( not ( = ?auto_168738 ?auto_168735 ) ) ( not ( = ?auto_168738 ?auto_168734 ) ) ( not ( = ?auto_168736 ?auto_168739 ) ) ( not ( = ?auto_168736 ?auto_168737 ) ) ( not ( = ?auto_168736 ?auto_168735 ) ) ( not ( = ?auto_168736 ?auto_168734 ) ) ( not ( = ?auto_168739 ?auto_168737 ) ) ( not ( = ?auto_168739 ?auto_168735 ) ) ( not ( = ?auto_168739 ?auto_168734 ) ) ( not ( = ?auto_168733 ?auto_168740 ) ) ( not ( = ?auto_168733 ?auto_168738 ) ) ( not ( = ?auto_168733 ?auto_168736 ) ) ( not ( = ?auto_168733 ?auto_168739 ) ) ( ON ?auto_168733 ?auto_168741 ) ( not ( = ?auto_168733 ?auto_168741 ) ) ( not ( = ?auto_168734 ?auto_168741 ) ) ( not ( = ?auto_168735 ?auto_168741 ) ) ( not ( = ?auto_168737 ?auto_168741 ) ) ( not ( = ?auto_168740 ?auto_168741 ) ) ( not ( = ?auto_168738 ?auto_168741 ) ) ( not ( = ?auto_168736 ?auto_168741 ) ) ( not ( = ?auto_168739 ?auto_168741 ) ) ( ON ?auto_168734 ?auto_168733 ) ( ON-TABLE ?auto_168741 ) ( ON ?auto_168735 ?auto_168734 ) ( ON ?auto_168737 ?auto_168735 ) ( ON ?auto_168739 ?auto_168737 ) ( CLEAR ?auto_168738 ) ( ON ?auto_168736 ?auto_168739 ) ( CLEAR ?auto_168736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168741 ?auto_168733 ?auto_168734 ?auto_168735 ?auto_168737 ?auto_168739 )
      ( MAKE-3PILE ?auto_168733 ?auto_168734 ?auto_168735 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168742 - BLOCK
      ?auto_168743 - BLOCK
      ?auto_168744 - BLOCK
    )
    :vars
    (
      ?auto_168747 - BLOCK
      ?auto_168748 - BLOCK
      ?auto_168749 - BLOCK
      ?auto_168746 - BLOCK
      ?auto_168745 - BLOCK
      ?auto_168750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168742 ?auto_168743 ) ) ( not ( = ?auto_168742 ?auto_168744 ) ) ( not ( = ?auto_168743 ?auto_168744 ) ) ( not ( = ?auto_168742 ?auto_168747 ) ) ( not ( = ?auto_168743 ?auto_168747 ) ) ( not ( = ?auto_168744 ?auto_168747 ) ) ( ON-TABLE ?auto_168748 ) ( not ( = ?auto_168748 ?auto_168749 ) ) ( not ( = ?auto_168748 ?auto_168746 ) ) ( not ( = ?auto_168748 ?auto_168745 ) ) ( not ( = ?auto_168748 ?auto_168747 ) ) ( not ( = ?auto_168748 ?auto_168744 ) ) ( not ( = ?auto_168748 ?auto_168743 ) ) ( not ( = ?auto_168749 ?auto_168746 ) ) ( not ( = ?auto_168749 ?auto_168745 ) ) ( not ( = ?auto_168749 ?auto_168747 ) ) ( not ( = ?auto_168749 ?auto_168744 ) ) ( not ( = ?auto_168749 ?auto_168743 ) ) ( not ( = ?auto_168746 ?auto_168745 ) ) ( not ( = ?auto_168746 ?auto_168747 ) ) ( not ( = ?auto_168746 ?auto_168744 ) ) ( not ( = ?auto_168746 ?auto_168743 ) ) ( not ( = ?auto_168745 ?auto_168747 ) ) ( not ( = ?auto_168745 ?auto_168744 ) ) ( not ( = ?auto_168745 ?auto_168743 ) ) ( not ( = ?auto_168742 ?auto_168748 ) ) ( not ( = ?auto_168742 ?auto_168749 ) ) ( not ( = ?auto_168742 ?auto_168746 ) ) ( not ( = ?auto_168742 ?auto_168745 ) ) ( ON ?auto_168742 ?auto_168750 ) ( not ( = ?auto_168742 ?auto_168750 ) ) ( not ( = ?auto_168743 ?auto_168750 ) ) ( not ( = ?auto_168744 ?auto_168750 ) ) ( not ( = ?auto_168747 ?auto_168750 ) ) ( not ( = ?auto_168748 ?auto_168750 ) ) ( not ( = ?auto_168749 ?auto_168750 ) ) ( not ( = ?auto_168746 ?auto_168750 ) ) ( not ( = ?auto_168745 ?auto_168750 ) ) ( ON ?auto_168743 ?auto_168742 ) ( ON-TABLE ?auto_168750 ) ( ON ?auto_168744 ?auto_168743 ) ( ON ?auto_168747 ?auto_168744 ) ( ON ?auto_168745 ?auto_168747 ) ( ON ?auto_168746 ?auto_168745 ) ( CLEAR ?auto_168746 ) ( HOLDING ?auto_168749 ) ( CLEAR ?auto_168748 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168748 ?auto_168749 )
      ( MAKE-3PILE ?auto_168742 ?auto_168743 ?auto_168744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168751 - BLOCK
      ?auto_168752 - BLOCK
      ?auto_168753 - BLOCK
    )
    :vars
    (
      ?auto_168754 - BLOCK
      ?auto_168755 - BLOCK
      ?auto_168756 - BLOCK
      ?auto_168757 - BLOCK
      ?auto_168759 - BLOCK
      ?auto_168758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168751 ?auto_168752 ) ) ( not ( = ?auto_168751 ?auto_168753 ) ) ( not ( = ?auto_168752 ?auto_168753 ) ) ( not ( = ?auto_168751 ?auto_168754 ) ) ( not ( = ?auto_168752 ?auto_168754 ) ) ( not ( = ?auto_168753 ?auto_168754 ) ) ( ON-TABLE ?auto_168755 ) ( not ( = ?auto_168755 ?auto_168756 ) ) ( not ( = ?auto_168755 ?auto_168757 ) ) ( not ( = ?auto_168755 ?auto_168759 ) ) ( not ( = ?auto_168755 ?auto_168754 ) ) ( not ( = ?auto_168755 ?auto_168753 ) ) ( not ( = ?auto_168755 ?auto_168752 ) ) ( not ( = ?auto_168756 ?auto_168757 ) ) ( not ( = ?auto_168756 ?auto_168759 ) ) ( not ( = ?auto_168756 ?auto_168754 ) ) ( not ( = ?auto_168756 ?auto_168753 ) ) ( not ( = ?auto_168756 ?auto_168752 ) ) ( not ( = ?auto_168757 ?auto_168759 ) ) ( not ( = ?auto_168757 ?auto_168754 ) ) ( not ( = ?auto_168757 ?auto_168753 ) ) ( not ( = ?auto_168757 ?auto_168752 ) ) ( not ( = ?auto_168759 ?auto_168754 ) ) ( not ( = ?auto_168759 ?auto_168753 ) ) ( not ( = ?auto_168759 ?auto_168752 ) ) ( not ( = ?auto_168751 ?auto_168755 ) ) ( not ( = ?auto_168751 ?auto_168756 ) ) ( not ( = ?auto_168751 ?auto_168757 ) ) ( not ( = ?auto_168751 ?auto_168759 ) ) ( ON ?auto_168751 ?auto_168758 ) ( not ( = ?auto_168751 ?auto_168758 ) ) ( not ( = ?auto_168752 ?auto_168758 ) ) ( not ( = ?auto_168753 ?auto_168758 ) ) ( not ( = ?auto_168754 ?auto_168758 ) ) ( not ( = ?auto_168755 ?auto_168758 ) ) ( not ( = ?auto_168756 ?auto_168758 ) ) ( not ( = ?auto_168757 ?auto_168758 ) ) ( not ( = ?auto_168759 ?auto_168758 ) ) ( ON ?auto_168752 ?auto_168751 ) ( ON-TABLE ?auto_168758 ) ( ON ?auto_168753 ?auto_168752 ) ( ON ?auto_168754 ?auto_168753 ) ( ON ?auto_168759 ?auto_168754 ) ( ON ?auto_168757 ?auto_168759 ) ( CLEAR ?auto_168755 ) ( ON ?auto_168756 ?auto_168757 ) ( CLEAR ?auto_168756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168758 ?auto_168751 ?auto_168752 ?auto_168753 ?auto_168754 ?auto_168759 ?auto_168757 )
      ( MAKE-3PILE ?auto_168751 ?auto_168752 ?auto_168753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168760 - BLOCK
      ?auto_168761 - BLOCK
      ?auto_168762 - BLOCK
    )
    :vars
    (
      ?auto_168764 - BLOCK
      ?auto_168763 - BLOCK
      ?auto_168766 - BLOCK
      ?auto_168765 - BLOCK
      ?auto_168767 - BLOCK
      ?auto_168768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168760 ?auto_168761 ) ) ( not ( = ?auto_168760 ?auto_168762 ) ) ( not ( = ?auto_168761 ?auto_168762 ) ) ( not ( = ?auto_168760 ?auto_168764 ) ) ( not ( = ?auto_168761 ?auto_168764 ) ) ( not ( = ?auto_168762 ?auto_168764 ) ) ( not ( = ?auto_168763 ?auto_168766 ) ) ( not ( = ?auto_168763 ?auto_168765 ) ) ( not ( = ?auto_168763 ?auto_168767 ) ) ( not ( = ?auto_168763 ?auto_168764 ) ) ( not ( = ?auto_168763 ?auto_168762 ) ) ( not ( = ?auto_168763 ?auto_168761 ) ) ( not ( = ?auto_168766 ?auto_168765 ) ) ( not ( = ?auto_168766 ?auto_168767 ) ) ( not ( = ?auto_168766 ?auto_168764 ) ) ( not ( = ?auto_168766 ?auto_168762 ) ) ( not ( = ?auto_168766 ?auto_168761 ) ) ( not ( = ?auto_168765 ?auto_168767 ) ) ( not ( = ?auto_168765 ?auto_168764 ) ) ( not ( = ?auto_168765 ?auto_168762 ) ) ( not ( = ?auto_168765 ?auto_168761 ) ) ( not ( = ?auto_168767 ?auto_168764 ) ) ( not ( = ?auto_168767 ?auto_168762 ) ) ( not ( = ?auto_168767 ?auto_168761 ) ) ( not ( = ?auto_168760 ?auto_168763 ) ) ( not ( = ?auto_168760 ?auto_168766 ) ) ( not ( = ?auto_168760 ?auto_168765 ) ) ( not ( = ?auto_168760 ?auto_168767 ) ) ( ON ?auto_168760 ?auto_168768 ) ( not ( = ?auto_168760 ?auto_168768 ) ) ( not ( = ?auto_168761 ?auto_168768 ) ) ( not ( = ?auto_168762 ?auto_168768 ) ) ( not ( = ?auto_168764 ?auto_168768 ) ) ( not ( = ?auto_168763 ?auto_168768 ) ) ( not ( = ?auto_168766 ?auto_168768 ) ) ( not ( = ?auto_168765 ?auto_168768 ) ) ( not ( = ?auto_168767 ?auto_168768 ) ) ( ON ?auto_168761 ?auto_168760 ) ( ON-TABLE ?auto_168768 ) ( ON ?auto_168762 ?auto_168761 ) ( ON ?auto_168764 ?auto_168762 ) ( ON ?auto_168767 ?auto_168764 ) ( ON ?auto_168765 ?auto_168767 ) ( ON ?auto_168766 ?auto_168765 ) ( CLEAR ?auto_168766 ) ( HOLDING ?auto_168763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168763 )
      ( MAKE-3PILE ?auto_168760 ?auto_168761 ?auto_168762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_168769 - BLOCK
      ?auto_168770 - BLOCK
      ?auto_168771 - BLOCK
    )
    :vars
    (
      ?auto_168774 - BLOCK
      ?auto_168777 - BLOCK
      ?auto_168772 - BLOCK
      ?auto_168773 - BLOCK
      ?auto_168775 - BLOCK
      ?auto_168776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168769 ?auto_168770 ) ) ( not ( = ?auto_168769 ?auto_168771 ) ) ( not ( = ?auto_168770 ?auto_168771 ) ) ( not ( = ?auto_168769 ?auto_168774 ) ) ( not ( = ?auto_168770 ?auto_168774 ) ) ( not ( = ?auto_168771 ?auto_168774 ) ) ( not ( = ?auto_168777 ?auto_168772 ) ) ( not ( = ?auto_168777 ?auto_168773 ) ) ( not ( = ?auto_168777 ?auto_168775 ) ) ( not ( = ?auto_168777 ?auto_168774 ) ) ( not ( = ?auto_168777 ?auto_168771 ) ) ( not ( = ?auto_168777 ?auto_168770 ) ) ( not ( = ?auto_168772 ?auto_168773 ) ) ( not ( = ?auto_168772 ?auto_168775 ) ) ( not ( = ?auto_168772 ?auto_168774 ) ) ( not ( = ?auto_168772 ?auto_168771 ) ) ( not ( = ?auto_168772 ?auto_168770 ) ) ( not ( = ?auto_168773 ?auto_168775 ) ) ( not ( = ?auto_168773 ?auto_168774 ) ) ( not ( = ?auto_168773 ?auto_168771 ) ) ( not ( = ?auto_168773 ?auto_168770 ) ) ( not ( = ?auto_168775 ?auto_168774 ) ) ( not ( = ?auto_168775 ?auto_168771 ) ) ( not ( = ?auto_168775 ?auto_168770 ) ) ( not ( = ?auto_168769 ?auto_168777 ) ) ( not ( = ?auto_168769 ?auto_168772 ) ) ( not ( = ?auto_168769 ?auto_168773 ) ) ( not ( = ?auto_168769 ?auto_168775 ) ) ( ON ?auto_168769 ?auto_168776 ) ( not ( = ?auto_168769 ?auto_168776 ) ) ( not ( = ?auto_168770 ?auto_168776 ) ) ( not ( = ?auto_168771 ?auto_168776 ) ) ( not ( = ?auto_168774 ?auto_168776 ) ) ( not ( = ?auto_168777 ?auto_168776 ) ) ( not ( = ?auto_168772 ?auto_168776 ) ) ( not ( = ?auto_168773 ?auto_168776 ) ) ( not ( = ?auto_168775 ?auto_168776 ) ) ( ON ?auto_168770 ?auto_168769 ) ( ON-TABLE ?auto_168776 ) ( ON ?auto_168771 ?auto_168770 ) ( ON ?auto_168774 ?auto_168771 ) ( ON ?auto_168775 ?auto_168774 ) ( ON ?auto_168773 ?auto_168775 ) ( ON ?auto_168772 ?auto_168773 ) ( ON ?auto_168777 ?auto_168772 ) ( CLEAR ?auto_168777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168776 ?auto_168769 ?auto_168770 ?auto_168771 ?auto_168774 ?auto_168775 ?auto_168773 ?auto_168772 )
      ( MAKE-3PILE ?auto_168769 ?auto_168770 ?auto_168771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168782 - BLOCK
      ?auto_168783 - BLOCK
      ?auto_168784 - BLOCK
      ?auto_168785 - BLOCK
    )
    :vars
    (
      ?auto_168786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168786 ?auto_168785 ) ( CLEAR ?auto_168786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168782 ) ( ON ?auto_168783 ?auto_168782 ) ( ON ?auto_168784 ?auto_168783 ) ( ON ?auto_168785 ?auto_168784 ) ( not ( = ?auto_168782 ?auto_168783 ) ) ( not ( = ?auto_168782 ?auto_168784 ) ) ( not ( = ?auto_168782 ?auto_168785 ) ) ( not ( = ?auto_168782 ?auto_168786 ) ) ( not ( = ?auto_168783 ?auto_168784 ) ) ( not ( = ?auto_168783 ?auto_168785 ) ) ( not ( = ?auto_168783 ?auto_168786 ) ) ( not ( = ?auto_168784 ?auto_168785 ) ) ( not ( = ?auto_168784 ?auto_168786 ) ) ( not ( = ?auto_168785 ?auto_168786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168786 ?auto_168785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168787 - BLOCK
      ?auto_168788 - BLOCK
      ?auto_168789 - BLOCK
      ?auto_168790 - BLOCK
    )
    :vars
    (
      ?auto_168791 - BLOCK
      ?auto_168792 - BLOCK
      ?auto_168793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168791 ?auto_168790 ) ( CLEAR ?auto_168791 ) ( ON-TABLE ?auto_168787 ) ( ON ?auto_168788 ?auto_168787 ) ( ON ?auto_168789 ?auto_168788 ) ( ON ?auto_168790 ?auto_168789 ) ( not ( = ?auto_168787 ?auto_168788 ) ) ( not ( = ?auto_168787 ?auto_168789 ) ) ( not ( = ?auto_168787 ?auto_168790 ) ) ( not ( = ?auto_168787 ?auto_168791 ) ) ( not ( = ?auto_168788 ?auto_168789 ) ) ( not ( = ?auto_168788 ?auto_168790 ) ) ( not ( = ?auto_168788 ?auto_168791 ) ) ( not ( = ?auto_168789 ?auto_168790 ) ) ( not ( = ?auto_168789 ?auto_168791 ) ) ( not ( = ?auto_168790 ?auto_168791 ) ) ( HOLDING ?auto_168792 ) ( CLEAR ?auto_168793 ) ( not ( = ?auto_168787 ?auto_168792 ) ) ( not ( = ?auto_168787 ?auto_168793 ) ) ( not ( = ?auto_168788 ?auto_168792 ) ) ( not ( = ?auto_168788 ?auto_168793 ) ) ( not ( = ?auto_168789 ?auto_168792 ) ) ( not ( = ?auto_168789 ?auto_168793 ) ) ( not ( = ?auto_168790 ?auto_168792 ) ) ( not ( = ?auto_168790 ?auto_168793 ) ) ( not ( = ?auto_168791 ?auto_168792 ) ) ( not ( = ?auto_168791 ?auto_168793 ) ) ( not ( = ?auto_168792 ?auto_168793 ) ) )
    :subtasks
    ( ( !STACK ?auto_168792 ?auto_168793 )
      ( MAKE-4PILE ?auto_168787 ?auto_168788 ?auto_168789 ?auto_168790 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168794 - BLOCK
      ?auto_168795 - BLOCK
      ?auto_168796 - BLOCK
      ?auto_168797 - BLOCK
    )
    :vars
    (
      ?auto_168799 - BLOCK
      ?auto_168800 - BLOCK
      ?auto_168798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168799 ?auto_168797 ) ( ON-TABLE ?auto_168794 ) ( ON ?auto_168795 ?auto_168794 ) ( ON ?auto_168796 ?auto_168795 ) ( ON ?auto_168797 ?auto_168796 ) ( not ( = ?auto_168794 ?auto_168795 ) ) ( not ( = ?auto_168794 ?auto_168796 ) ) ( not ( = ?auto_168794 ?auto_168797 ) ) ( not ( = ?auto_168794 ?auto_168799 ) ) ( not ( = ?auto_168795 ?auto_168796 ) ) ( not ( = ?auto_168795 ?auto_168797 ) ) ( not ( = ?auto_168795 ?auto_168799 ) ) ( not ( = ?auto_168796 ?auto_168797 ) ) ( not ( = ?auto_168796 ?auto_168799 ) ) ( not ( = ?auto_168797 ?auto_168799 ) ) ( CLEAR ?auto_168800 ) ( not ( = ?auto_168794 ?auto_168798 ) ) ( not ( = ?auto_168794 ?auto_168800 ) ) ( not ( = ?auto_168795 ?auto_168798 ) ) ( not ( = ?auto_168795 ?auto_168800 ) ) ( not ( = ?auto_168796 ?auto_168798 ) ) ( not ( = ?auto_168796 ?auto_168800 ) ) ( not ( = ?auto_168797 ?auto_168798 ) ) ( not ( = ?auto_168797 ?auto_168800 ) ) ( not ( = ?auto_168799 ?auto_168798 ) ) ( not ( = ?auto_168799 ?auto_168800 ) ) ( not ( = ?auto_168798 ?auto_168800 ) ) ( ON ?auto_168798 ?auto_168799 ) ( CLEAR ?auto_168798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168794 ?auto_168795 ?auto_168796 ?auto_168797 ?auto_168799 )
      ( MAKE-4PILE ?auto_168794 ?auto_168795 ?auto_168796 ?auto_168797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168801 - BLOCK
      ?auto_168802 - BLOCK
      ?auto_168803 - BLOCK
      ?auto_168804 - BLOCK
    )
    :vars
    (
      ?auto_168805 - BLOCK
      ?auto_168806 - BLOCK
      ?auto_168807 - BLOCK
      ?auto_168808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168805 ?auto_168804 ) ( ON-TABLE ?auto_168801 ) ( ON ?auto_168802 ?auto_168801 ) ( ON ?auto_168803 ?auto_168802 ) ( ON ?auto_168804 ?auto_168803 ) ( not ( = ?auto_168801 ?auto_168802 ) ) ( not ( = ?auto_168801 ?auto_168803 ) ) ( not ( = ?auto_168801 ?auto_168804 ) ) ( not ( = ?auto_168801 ?auto_168805 ) ) ( not ( = ?auto_168802 ?auto_168803 ) ) ( not ( = ?auto_168802 ?auto_168804 ) ) ( not ( = ?auto_168802 ?auto_168805 ) ) ( not ( = ?auto_168803 ?auto_168804 ) ) ( not ( = ?auto_168803 ?auto_168805 ) ) ( not ( = ?auto_168804 ?auto_168805 ) ) ( not ( = ?auto_168801 ?auto_168806 ) ) ( not ( = ?auto_168801 ?auto_168807 ) ) ( not ( = ?auto_168802 ?auto_168806 ) ) ( not ( = ?auto_168802 ?auto_168807 ) ) ( not ( = ?auto_168803 ?auto_168806 ) ) ( not ( = ?auto_168803 ?auto_168807 ) ) ( not ( = ?auto_168804 ?auto_168806 ) ) ( not ( = ?auto_168804 ?auto_168807 ) ) ( not ( = ?auto_168805 ?auto_168806 ) ) ( not ( = ?auto_168805 ?auto_168807 ) ) ( not ( = ?auto_168806 ?auto_168807 ) ) ( ON ?auto_168806 ?auto_168805 ) ( CLEAR ?auto_168806 ) ( HOLDING ?auto_168807 ) ( CLEAR ?auto_168808 ) ( ON-TABLE ?auto_168808 ) ( not ( = ?auto_168808 ?auto_168807 ) ) ( not ( = ?auto_168801 ?auto_168808 ) ) ( not ( = ?auto_168802 ?auto_168808 ) ) ( not ( = ?auto_168803 ?auto_168808 ) ) ( not ( = ?auto_168804 ?auto_168808 ) ) ( not ( = ?auto_168805 ?auto_168808 ) ) ( not ( = ?auto_168806 ?auto_168808 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168808 ?auto_168807 )
      ( MAKE-4PILE ?auto_168801 ?auto_168802 ?auto_168803 ?auto_168804 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168809 - BLOCK
      ?auto_168810 - BLOCK
      ?auto_168811 - BLOCK
      ?auto_168812 - BLOCK
    )
    :vars
    (
      ?auto_168813 - BLOCK
      ?auto_168814 - BLOCK
      ?auto_168815 - BLOCK
      ?auto_168816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168813 ?auto_168812 ) ( ON-TABLE ?auto_168809 ) ( ON ?auto_168810 ?auto_168809 ) ( ON ?auto_168811 ?auto_168810 ) ( ON ?auto_168812 ?auto_168811 ) ( not ( = ?auto_168809 ?auto_168810 ) ) ( not ( = ?auto_168809 ?auto_168811 ) ) ( not ( = ?auto_168809 ?auto_168812 ) ) ( not ( = ?auto_168809 ?auto_168813 ) ) ( not ( = ?auto_168810 ?auto_168811 ) ) ( not ( = ?auto_168810 ?auto_168812 ) ) ( not ( = ?auto_168810 ?auto_168813 ) ) ( not ( = ?auto_168811 ?auto_168812 ) ) ( not ( = ?auto_168811 ?auto_168813 ) ) ( not ( = ?auto_168812 ?auto_168813 ) ) ( not ( = ?auto_168809 ?auto_168814 ) ) ( not ( = ?auto_168809 ?auto_168815 ) ) ( not ( = ?auto_168810 ?auto_168814 ) ) ( not ( = ?auto_168810 ?auto_168815 ) ) ( not ( = ?auto_168811 ?auto_168814 ) ) ( not ( = ?auto_168811 ?auto_168815 ) ) ( not ( = ?auto_168812 ?auto_168814 ) ) ( not ( = ?auto_168812 ?auto_168815 ) ) ( not ( = ?auto_168813 ?auto_168814 ) ) ( not ( = ?auto_168813 ?auto_168815 ) ) ( not ( = ?auto_168814 ?auto_168815 ) ) ( ON ?auto_168814 ?auto_168813 ) ( CLEAR ?auto_168816 ) ( ON-TABLE ?auto_168816 ) ( not ( = ?auto_168816 ?auto_168815 ) ) ( not ( = ?auto_168809 ?auto_168816 ) ) ( not ( = ?auto_168810 ?auto_168816 ) ) ( not ( = ?auto_168811 ?auto_168816 ) ) ( not ( = ?auto_168812 ?auto_168816 ) ) ( not ( = ?auto_168813 ?auto_168816 ) ) ( not ( = ?auto_168814 ?auto_168816 ) ) ( ON ?auto_168815 ?auto_168814 ) ( CLEAR ?auto_168815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168809 ?auto_168810 ?auto_168811 ?auto_168812 ?auto_168813 ?auto_168814 )
      ( MAKE-4PILE ?auto_168809 ?auto_168810 ?auto_168811 ?auto_168812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168817 - BLOCK
      ?auto_168818 - BLOCK
      ?auto_168819 - BLOCK
      ?auto_168820 - BLOCK
    )
    :vars
    (
      ?auto_168821 - BLOCK
      ?auto_168823 - BLOCK
      ?auto_168822 - BLOCK
      ?auto_168824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168821 ?auto_168820 ) ( ON-TABLE ?auto_168817 ) ( ON ?auto_168818 ?auto_168817 ) ( ON ?auto_168819 ?auto_168818 ) ( ON ?auto_168820 ?auto_168819 ) ( not ( = ?auto_168817 ?auto_168818 ) ) ( not ( = ?auto_168817 ?auto_168819 ) ) ( not ( = ?auto_168817 ?auto_168820 ) ) ( not ( = ?auto_168817 ?auto_168821 ) ) ( not ( = ?auto_168818 ?auto_168819 ) ) ( not ( = ?auto_168818 ?auto_168820 ) ) ( not ( = ?auto_168818 ?auto_168821 ) ) ( not ( = ?auto_168819 ?auto_168820 ) ) ( not ( = ?auto_168819 ?auto_168821 ) ) ( not ( = ?auto_168820 ?auto_168821 ) ) ( not ( = ?auto_168817 ?auto_168823 ) ) ( not ( = ?auto_168817 ?auto_168822 ) ) ( not ( = ?auto_168818 ?auto_168823 ) ) ( not ( = ?auto_168818 ?auto_168822 ) ) ( not ( = ?auto_168819 ?auto_168823 ) ) ( not ( = ?auto_168819 ?auto_168822 ) ) ( not ( = ?auto_168820 ?auto_168823 ) ) ( not ( = ?auto_168820 ?auto_168822 ) ) ( not ( = ?auto_168821 ?auto_168823 ) ) ( not ( = ?auto_168821 ?auto_168822 ) ) ( not ( = ?auto_168823 ?auto_168822 ) ) ( ON ?auto_168823 ?auto_168821 ) ( not ( = ?auto_168824 ?auto_168822 ) ) ( not ( = ?auto_168817 ?auto_168824 ) ) ( not ( = ?auto_168818 ?auto_168824 ) ) ( not ( = ?auto_168819 ?auto_168824 ) ) ( not ( = ?auto_168820 ?auto_168824 ) ) ( not ( = ?auto_168821 ?auto_168824 ) ) ( not ( = ?auto_168823 ?auto_168824 ) ) ( ON ?auto_168822 ?auto_168823 ) ( CLEAR ?auto_168822 ) ( HOLDING ?auto_168824 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168824 )
      ( MAKE-4PILE ?auto_168817 ?auto_168818 ?auto_168819 ?auto_168820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168825 - BLOCK
      ?auto_168826 - BLOCK
      ?auto_168827 - BLOCK
      ?auto_168828 - BLOCK
    )
    :vars
    (
      ?auto_168829 - BLOCK
      ?auto_168831 - BLOCK
      ?auto_168830 - BLOCK
      ?auto_168832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168829 ?auto_168828 ) ( ON-TABLE ?auto_168825 ) ( ON ?auto_168826 ?auto_168825 ) ( ON ?auto_168827 ?auto_168826 ) ( ON ?auto_168828 ?auto_168827 ) ( not ( = ?auto_168825 ?auto_168826 ) ) ( not ( = ?auto_168825 ?auto_168827 ) ) ( not ( = ?auto_168825 ?auto_168828 ) ) ( not ( = ?auto_168825 ?auto_168829 ) ) ( not ( = ?auto_168826 ?auto_168827 ) ) ( not ( = ?auto_168826 ?auto_168828 ) ) ( not ( = ?auto_168826 ?auto_168829 ) ) ( not ( = ?auto_168827 ?auto_168828 ) ) ( not ( = ?auto_168827 ?auto_168829 ) ) ( not ( = ?auto_168828 ?auto_168829 ) ) ( not ( = ?auto_168825 ?auto_168831 ) ) ( not ( = ?auto_168825 ?auto_168830 ) ) ( not ( = ?auto_168826 ?auto_168831 ) ) ( not ( = ?auto_168826 ?auto_168830 ) ) ( not ( = ?auto_168827 ?auto_168831 ) ) ( not ( = ?auto_168827 ?auto_168830 ) ) ( not ( = ?auto_168828 ?auto_168831 ) ) ( not ( = ?auto_168828 ?auto_168830 ) ) ( not ( = ?auto_168829 ?auto_168831 ) ) ( not ( = ?auto_168829 ?auto_168830 ) ) ( not ( = ?auto_168831 ?auto_168830 ) ) ( ON ?auto_168831 ?auto_168829 ) ( not ( = ?auto_168832 ?auto_168830 ) ) ( not ( = ?auto_168825 ?auto_168832 ) ) ( not ( = ?auto_168826 ?auto_168832 ) ) ( not ( = ?auto_168827 ?auto_168832 ) ) ( not ( = ?auto_168828 ?auto_168832 ) ) ( not ( = ?auto_168829 ?auto_168832 ) ) ( not ( = ?auto_168831 ?auto_168832 ) ) ( ON ?auto_168830 ?auto_168831 ) ( ON ?auto_168832 ?auto_168830 ) ( CLEAR ?auto_168832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168825 ?auto_168826 ?auto_168827 ?auto_168828 ?auto_168829 ?auto_168831 ?auto_168830 )
      ( MAKE-4PILE ?auto_168825 ?auto_168826 ?auto_168827 ?auto_168828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168833 - BLOCK
      ?auto_168834 - BLOCK
      ?auto_168835 - BLOCK
      ?auto_168836 - BLOCK
    )
    :vars
    (
      ?auto_168840 - BLOCK
      ?auto_168839 - BLOCK
      ?auto_168838 - BLOCK
      ?auto_168837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168840 ?auto_168836 ) ( ON-TABLE ?auto_168833 ) ( ON ?auto_168834 ?auto_168833 ) ( ON ?auto_168835 ?auto_168834 ) ( ON ?auto_168836 ?auto_168835 ) ( not ( = ?auto_168833 ?auto_168834 ) ) ( not ( = ?auto_168833 ?auto_168835 ) ) ( not ( = ?auto_168833 ?auto_168836 ) ) ( not ( = ?auto_168833 ?auto_168840 ) ) ( not ( = ?auto_168834 ?auto_168835 ) ) ( not ( = ?auto_168834 ?auto_168836 ) ) ( not ( = ?auto_168834 ?auto_168840 ) ) ( not ( = ?auto_168835 ?auto_168836 ) ) ( not ( = ?auto_168835 ?auto_168840 ) ) ( not ( = ?auto_168836 ?auto_168840 ) ) ( not ( = ?auto_168833 ?auto_168839 ) ) ( not ( = ?auto_168833 ?auto_168838 ) ) ( not ( = ?auto_168834 ?auto_168839 ) ) ( not ( = ?auto_168834 ?auto_168838 ) ) ( not ( = ?auto_168835 ?auto_168839 ) ) ( not ( = ?auto_168835 ?auto_168838 ) ) ( not ( = ?auto_168836 ?auto_168839 ) ) ( not ( = ?auto_168836 ?auto_168838 ) ) ( not ( = ?auto_168840 ?auto_168839 ) ) ( not ( = ?auto_168840 ?auto_168838 ) ) ( not ( = ?auto_168839 ?auto_168838 ) ) ( ON ?auto_168839 ?auto_168840 ) ( not ( = ?auto_168837 ?auto_168838 ) ) ( not ( = ?auto_168833 ?auto_168837 ) ) ( not ( = ?auto_168834 ?auto_168837 ) ) ( not ( = ?auto_168835 ?auto_168837 ) ) ( not ( = ?auto_168836 ?auto_168837 ) ) ( not ( = ?auto_168840 ?auto_168837 ) ) ( not ( = ?auto_168839 ?auto_168837 ) ) ( ON ?auto_168838 ?auto_168839 ) ( HOLDING ?auto_168837 ) ( CLEAR ?auto_168838 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168833 ?auto_168834 ?auto_168835 ?auto_168836 ?auto_168840 ?auto_168839 ?auto_168838 ?auto_168837 )
      ( MAKE-4PILE ?auto_168833 ?auto_168834 ?auto_168835 ?auto_168836 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168841 - BLOCK
      ?auto_168842 - BLOCK
      ?auto_168843 - BLOCK
      ?auto_168844 - BLOCK
    )
    :vars
    (
      ?auto_168848 - BLOCK
      ?auto_168846 - BLOCK
      ?auto_168847 - BLOCK
      ?auto_168845 - BLOCK
      ?auto_168849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168848 ?auto_168844 ) ( ON-TABLE ?auto_168841 ) ( ON ?auto_168842 ?auto_168841 ) ( ON ?auto_168843 ?auto_168842 ) ( ON ?auto_168844 ?auto_168843 ) ( not ( = ?auto_168841 ?auto_168842 ) ) ( not ( = ?auto_168841 ?auto_168843 ) ) ( not ( = ?auto_168841 ?auto_168844 ) ) ( not ( = ?auto_168841 ?auto_168848 ) ) ( not ( = ?auto_168842 ?auto_168843 ) ) ( not ( = ?auto_168842 ?auto_168844 ) ) ( not ( = ?auto_168842 ?auto_168848 ) ) ( not ( = ?auto_168843 ?auto_168844 ) ) ( not ( = ?auto_168843 ?auto_168848 ) ) ( not ( = ?auto_168844 ?auto_168848 ) ) ( not ( = ?auto_168841 ?auto_168846 ) ) ( not ( = ?auto_168841 ?auto_168847 ) ) ( not ( = ?auto_168842 ?auto_168846 ) ) ( not ( = ?auto_168842 ?auto_168847 ) ) ( not ( = ?auto_168843 ?auto_168846 ) ) ( not ( = ?auto_168843 ?auto_168847 ) ) ( not ( = ?auto_168844 ?auto_168846 ) ) ( not ( = ?auto_168844 ?auto_168847 ) ) ( not ( = ?auto_168848 ?auto_168846 ) ) ( not ( = ?auto_168848 ?auto_168847 ) ) ( not ( = ?auto_168846 ?auto_168847 ) ) ( ON ?auto_168846 ?auto_168848 ) ( not ( = ?auto_168845 ?auto_168847 ) ) ( not ( = ?auto_168841 ?auto_168845 ) ) ( not ( = ?auto_168842 ?auto_168845 ) ) ( not ( = ?auto_168843 ?auto_168845 ) ) ( not ( = ?auto_168844 ?auto_168845 ) ) ( not ( = ?auto_168848 ?auto_168845 ) ) ( not ( = ?auto_168846 ?auto_168845 ) ) ( ON ?auto_168847 ?auto_168846 ) ( CLEAR ?auto_168847 ) ( ON ?auto_168845 ?auto_168849 ) ( CLEAR ?auto_168845 ) ( HAND-EMPTY ) ( not ( = ?auto_168841 ?auto_168849 ) ) ( not ( = ?auto_168842 ?auto_168849 ) ) ( not ( = ?auto_168843 ?auto_168849 ) ) ( not ( = ?auto_168844 ?auto_168849 ) ) ( not ( = ?auto_168848 ?auto_168849 ) ) ( not ( = ?auto_168846 ?auto_168849 ) ) ( not ( = ?auto_168847 ?auto_168849 ) ) ( not ( = ?auto_168845 ?auto_168849 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168845 ?auto_168849 )
      ( MAKE-4PILE ?auto_168841 ?auto_168842 ?auto_168843 ?auto_168844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168850 - BLOCK
      ?auto_168851 - BLOCK
      ?auto_168852 - BLOCK
      ?auto_168853 - BLOCK
    )
    :vars
    (
      ?auto_168858 - BLOCK
      ?auto_168857 - BLOCK
      ?auto_168856 - BLOCK
      ?auto_168854 - BLOCK
      ?auto_168855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168858 ?auto_168853 ) ( ON-TABLE ?auto_168850 ) ( ON ?auto_168851 ?auto_168850 ) ( ON ?auto_168852 ?auto_168851 ) ( ON ?auto_168853 ?auto_168852 ) ( not ( = ?auto_168850 ?auto_168851 ) ) ( not ( = ?auto_168850 ?auto_168852 ) ) ( not ( = ?auto_168850 ?auto_168853 ) ) ( not ( = ?auto_168850 ?auto_168858 ) ) ( not ( = ?auto_168851 ?auto_168852 ) ) ( not ( = ?auto_168851 ?auto_168853 ) ) ( not ( = ?auto_168851 ?auto_168858 ) ) ( not ( = ?auto_168852 ?auto_168853 ) ) ( not ( = ?auto_168852 ?auto_168858 ) ) ( not ( = ?auto_168853 ?auto_168858 ) ) ( not ( = ?auto_168850 ?auto_168857 ) ) ( not ( = ?auto_168850 ?auto_168856 ) ) ( not ( = ?auto_168851 ?auto_168857 ) ) ( not ( = ?auto_168851 ?auto_168856 ) ) ( not ( = ?auto_168852 ?auto_168857 ) ) ( not ( = ?auto_168852 ?auto_168856 ) ) ( not ( = ?auto_168853 ?auto_168857 ) ) ( not ( = ?auto_168853 ?auto_168856 ) ) ( not ( = ?auto_168858 ?auto_168857 ) ) ( not ( = ?auto_168858 ?auto_168856 ) ) ( not ( = ?auto_168857 ?auto_168856 ) ) ( ON ?auto_168857 ?auto_168858 ) ( not ( = ?auto_168854 ?auto_168856 ) ) ( not ( = ?auto_168850 ?auto_168854 ) ) ( not ( = ?auto_168851 ?auto_168854 ) ) ( not ( = ?auto_168852 ?auto_168854 ) ) ( not ( = ?auto_168853 ?auto_168854 ) ) ( not ( = ?auto_168858 ?auto_168854 ) ) ( not ( = ?auto_168857 ?auto_168854 ) ) ( ON ?auto_168854 ?auto_168855 ) ( CLEAR ?auto_168854 ) ( not ( = ?auto_168850 ?auto_168855 ) ) ( not ( = ?auto_168851 ?auto_168855 ) ) ( not ( = ?auto_168852 ?auto_168855 ) ) ( not ( = ?auto_168853 ?auto_168855 ) ) ( not ( = ?auto_168858 ?auto_168855 ) ) ( not ( = ?auto_168857 ?auto_168855 ) ) ( not ( = ?auto_168856 ?auto_168855 ) ) ( not ( = ?auto_168854 ?auto_168855 ) ) ( HOLDING ?auto_168856 ) ( CLEAR ?auto_168857 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168850 ?auto_168851 ?auto_168852 ?auto_168853 ?auto_168858 ?auto_168857 ?auto_168856 )
      ( MAKE-4PILE ?auto_168850 ?auto_168851 ?auto_168852 ?auto_168853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168859 - BLOCK
      ?auto_168860 - BLOCK
      ?auto_168861 - BLOCK
      ?auto_168862 - BLOCK
    )
    :vars
    (
      ?auto_168863 - BLOCK
      ?auto_168867 - BLOCK
      ?auto_168864 - BLOCK
      ?auto_168865 - BLOCK
      ?auto_168866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168863 ?auto_168862 ) ( ON-TABLE ?auto_168859 ) ( ON ?auto_168860 ?auto_168859 ) ( ON ?auto_168861 ?auto_168860 ) ( ON ?auto_168862 ?auto_168861 ) ( not ( = ?auto_168859 ?auto_168860 ) ) ( not ( = ?auto_168859 ?auto_168861 ) ) ( not ( = ?auto_168859 ?auto_168862 ) ) ( not ( = ?auto_168859 ?auto_168863 ) ) ( not ( = ?auto_168860 ?auto_168861 ) ) ( not ( = ?auto_168860 ?auto_168862 ) ) ( not ( = ?auto_168860 ?auto_168863 ) ) ( not ( = ?auto_168861 ?auto_168862 ) ) ( not ( = ?auto_168861 ?auto_168863 ) ) ( not ( = ?auto_168862 ?auto_168863 ) ) ( not ( = ?auto_168859 ?auto_168867 ) ) ( not ( = ?auto_168859 ?auto_168864 ) ) ( not ( = ?auto_168860 ?auto_168867 ) ) ( not ( = ?auto_168860 ?auto_168864 ) ) ( not ( = ?auto_168861 ?auto_168867 ) ) ( not ( = ?auto_168861 ?auto_168864 ) ) ( not ( = ?auto_168862 ?auto_168867 ) ) ( not ( = ?auto_168862 ?auto_168864 ) ) ( not ( = ?auto_168863 ?auto_168867 ) ) ( not ( = ?auto_168863 ?auto_168864 ) ) ( not ( = ?auto_168867 ?auto_168864 ) ) ( ON ?auto_168867 ?auto_168863 ) ( not ( = ?auto_168865 ?auto_168864 ) ) ( not ( = ?auto_168859 ?auto_168865 ) ) ( not ( = ?auto_168860 ?auto_168865 ) ) ( not ( = ?auto_168861 ?auto_168865 ) ) ( not ( = ?auto_168862 ?auto_168865 ) ) ( not ( = ?auto_168863 ?auto_168865 ) ) ( not ( = ?auto_168867 ?auto_168865 ) ) ( ON ?auto_168865 ?auto_168866 ) ( not ( = ?auto_168859 ?auto_168866 ) ) ( not ( = ?auto_168860 ?auto_168866 ) ) ( not ( = ?auto_168861 ?auto_168866 ) ) ( not ( = ?auto_168862 ?auto_168866 ) ) ( not ( = ?auto_168863 ?auto_168866 ) ) ( not ( = ?auto_168867 ?auto_168866 ) ) ( not ( = ?auto_168864 ?auto_168866 ) ) ( not ( = ?auto_168865 ?auto_168866 ) ) ( CLEAR ?auto_168867 ) ( ON ?auto_168864 ?auto_168865 ) ( CLEAR ?auto_168864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168866 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168866 ?auto_168865 )
      ( MAKE-4PILE ?auto_168859 ?auto_168860 ?auto_168861 ?auto_168862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168868 - BLOCK
      ?auto_168869 - BLOCK
      ?auto_168870 - BLOCK
      ?auto_168871 - BLOCK
    )
    :vars
    (
      ?auto_168873 - BLOCK
      ?auto_168872 - BLOCK
      ?auto_168874 - BLOCK
      ?auto_168876 - BLOCK
      ?auto_168875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168873 ?auto_168871 ) ( ON-TABLE ?auto_168868 ) ( ON ?auto_168869 ?auto_168868 ) ( ON ?auto_168870 ?auto_168869 ) ( ON ?auto_168871 ?auto_168870 ) ( not ( = ?auto_168868 ?auto_168869 ) ) ( not ( = ?auto_168868 ?auto_168870 ) ) ( not ( = ?auto_168868 ?auto_168871 ) ) ( not ( = ?auto_168868 ?auto_168873 ) ) ( not ( = ?auto_168869 ?auto_168870 ) ) ( not ( = ?auto_168869 ?auto_168871 ) ) ( not ( = ?auto_168869 ?auto_168873 ) ) ( not ( = ?auto_168870 ?auto_168871 ) ) ( not ( = ?auto_168870 ?auto_168873 ) ) ( not ( = ?auto_168871 ?auto_168873 ) ) ( not ( = ?auto_168868 ?auto_168872 ) ) ( not ( = ?auto_168868 ?auto_168874 ) ) ( not ( = ?auto_168869 ?auto_168872 ) ) ( not ( = ?auto_168869 ?auto_168874 ) ) ( not ( = ?auto_168870 ?auto_168872 ) ) ( not ( = ?auto_168870 ?auto_168874 ) ) ( not ( = ?auto_168871 ?auto_168872 ) ) ( not ( = ?auto_168871 ?auto_168874 ) ) ( not ( = ?auto_168873 ?auto_168872 ) ) ( not ( = ?auto_168873 ?auto_168874 ) ) ( not ( = ?auto_168872 ?auto_168874 ) ) ( not ( = ?auto_168876 ?auto_168874 ) ) ( not ( = ?auto_168868 ?auto_168876 ) ) ( not ( = ?auto_168869 ?auto_168876 ) ) ( not ( = ?auto_168870 ?auto_168876 ) ) ( not ( = ?auto_168871 ?auto_168876 ) ) ( not ( = ?auto_168873 ?auto_168876 ) ) ( not ( = ?auto_168872 ?auto_168876 ) ) ( ON ?auto_168876 ?auto_168875 ) ( not ( = ?auto_168868 ?auto_168875 ) ) ( not ( = ?auto_168869 ?auto_168875 ) ) ( not ( = ?auto_168870 ?auto_168875 ) ) ( not ( = ?auto_168871 ?auto_168875 ) ) ( not ( = ?auto_168873 ?auto_168875 ) ) ( not ( = ?auto_168872 ?auto_168875 ) ) ( not ( = ?auto_168874 ?auto_168875 ) ) ( not ( = ?auto_168876 ?auto_168875 ) ) ( ON ?auto_168874 ?auto_168876 ) ( CLEAR ?auto_168874 ) ( ON-TABLE ?auto_168875 ) ( HOLDING ?auto_168872 ) ( CLEAR ?auto_168873 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168868 ?auto_168869 ?auto_168870 ?auto_168871 ?auto_168873 ?auto_168872 )
      ( MAKE-4PILE ?auto_168868 ?auto_168869 ?auto_168870 ?auto_168871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168877 - BLOCK
      ?auto_168878 - BLOCK
      ?auto_168879 - BLOCK
      ?auto_168880 - BLOCK
    )
    :vars
    (
      ?auto_168881 - BLOCK
      ?auto_168882 - BLOCK
      ?auto_168885 - BLOCK
      ?auto_168883 - BLOCK
      ?auto_168884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168881 ?auto_168880 ) ( ON-TABLE ?auto_168877 ) ( ON ?auto_168878 ?auto_168877 ) ( ON ?auto_168879 ?auto_168878 ) ( ON ?auto_168880 ?auto_168879 ) ( not ( = ?auto_168877 ?auto_168878 ) ) ( not ( = ?auto_168877 ?auto_168879 ) ) ( not ( = ?auto_168877 ?auto_168880 ) ) ( not ( = ?auto_168877 ?auto_168881 ) ) ( not ( = ?auto_168878 ?auto_168879 ) ) ( not ( = ?auto_168878 ?auto_168880 ) ) ( not ( = ?auto_168878 ?auto_168881 ) ) ( not ( = ?auto_168879 ?auto_168880 ) ) ( not ( = ?auto_168879 ?auto_168881 ) ) ( not ( = ?auto_168880 ?auto_168881 ) ) ( not ( = ?auto_168877 ?auto_168882 ) ) ( not ( = ?auto_168877 ?auto_168885 ) ) ( not ( = ?auto_168878 ?auto_168882 ) ) ( not ( = ?auto_168878 ?auto_168885 ) ) ( not ( = ?auto_168879 ?auto_168882 ) ) ( not ( = ?auto_168879 ?auto_168885 ) ) ( not ( = ?auto_168880 ?auto_168882 ) ) ( not ( = ?auto_168880 ?auto_168885 ) ) ( not ( = ?auto_168881 ?auto_168882 ) ) ( not ( = ?auto_168881 ?auto_168885 ) ) ( not ( = ?auto_168882 ?auto_168885 ) ) ( not ( = ?auto_168883 ?auto_168885 ) ) ( not ( = ?auto_168877 ?auto_168883 ) ) ( not ( = ?auto_168878 ?auto_168883 ) ) ( not ( = ?auto_168879 ?auto_168883 ) ) ( not ( = ?auto_168880 ?auto_168883 ) ) ( not ( = ?auto_168881 ?auto_168883 ) ) ( not ( = ?auto_168882 ?auto_168883 ) ) ( ON ?auto_168883 ?auto_168884 ) ( not ( = ?auto_168877 ?auto_168884 ) ) ( not ( = ?auto_168878 ?auto_168884 ) ) ( not ( = ?auto_168879 ?auto_168884 ) ) ( not ( = ?auto_168880 ?auto_168884 ) ) ( not ( = ?auto_168881 ?auto_168884 ) ) ( not ( = ?auto_168882 ?auto_168884 ) ) ( not ( = ?auto_168885 ?auto_168884 ) ) ( not ( = ?auto_168883 ?auto_168884 ) ) ( ON ?auto_168885 ?auto_168883 ) ( ON-TABLE ?auto_168884 ) ( CLEAR ?auto_168881 ) ( ON ?auto_168882 ?auto_168885 ) ( CLEAR ?auto_168882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168884 ?auto_168883 ?auto_168885 )
      ( MAKE-4PILE ?auto_168877 ?auto_168878 ?auto_168879 ?auto_168880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168904 - BLOCK
      ?auto_168905 - BLOCK
      ?auto_168906 - BLOCK
      ?auto_168907 - BLOCK
    )
    :vars
    (
      ?auto_168908 - BLOCK
      ?auto_168910 - BLOCK
      ?auto_168909 - BLOCK
      ?auto_168911 - BLOCK
      ?auto_168912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168904 ) ( ON ?auto_168905 ?auto_168904 ) ( ON ?auto_168906 ?auto_168905 ) ( not ( = ?auto_168904 ?auto_168905 ) ) ( not ( = ?auto_168904 ?auto_168906 ) ) ( not ( = ?auto_168904 ?auto_168907 ) ) ( not ( = ?auto_168904 ?auto_168908 ) ) ( not ( = ?auto_168905 ?auto_168906 ) ) ( not ( = ?auto_168905 ?auto_168907 ) ) ( not ( = ?auto_168905 ?auto_168908 ) ) ( not ( = ?auto_168906 ?auto_168907 ) ) ( not ( = ?auto_168906 ?auto_168908 ) ) ( not ( = ?auto_168907 ?auto_168908 ) ) ( not ( = ?auto_168904 ?auto_168910 ) ) ( not ( = ?auto_168904 ?auto_168909 ) ) ( not ( = ?auto_168905 ?auto_168910 ) ) ( not ( = ?auto_168905 ?auto_168909 ) ) ( not ( = ?auto_168906 ?auto_168910 ) ) ( not ( = ?auto_168906 ?auto_168909 ) ) ( not ( = ?auto_168907 ?auto_168910 ) ) ( not ( = ?auto_168907 ?auto_168909 ) ) ( not ( = ?auto_168908 ?auto_168910 ) ) ( not ( = ?auto_168908 ?auto_168909 ) ) ( not ( = ?auto_168910 ?auto_168909 ) ) ( not ( = ?auto_168911 ?auto_168909 ) ) ( not ( = ?auto_168904 ?auto_168911 ) ) ( not ( = ?auto_168905 ?auto_168911 ) ) ( not ( = ?auto_168906 ?auto_168911 ) ) ( not ( = ?auto_168907 ?auto_168911 ) ) ( not ( = ?auto_168908 ?auto_168911 ) ) ( not ( = ?auto_168910 ?auto_168911 ) ) ( ON ?auto_168911 ?auto_168912 ) ( not ( = ?auto_168904 ?auto_168912 ) ) ( not ( = ?auto_168905 ?auto_168912 ) ) ( not ( = ?auto_168906 ?auto_168912 ) ) ( not ( = ?auto_168907 ?auto_168912 ) ) ( not ( = ?auto_168908 ?auto_168912 ) ) ( not ( = ?auto_168910 ?auto_168912 ) ) ( not ( = ?auto_168909 ?auto_168912 ) ) ( not ( = ?auto_168911 ?auto_168912 ) ) ( ON ?auto_168909 ?auto_168911 ) ( ON-TABLE ?auto_168912 ) ( ON ?auto_168910 ?auto_168909 ) ( ON ?auto_168908 ?auto_168910 ) ( CLEAR ?auto_168908 ) ( HOLDING ?auto_168907 ) ( CLEAR ?auto_168906 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168904 ?auto_168905 ?auto_168906 ?auto_168907 ?auto_168908 )
      ( MAKE-4PILE ?auto_168904 ?auto_168905 ?auto_168906 ?auto_168907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168913 - BLOCK
      ?auto_168914 - BLOCK
      ?auto_168915 - BLOCK
      ?auto_168916 - BLOCK
    )
    :vars
    (
      ?auto_168919 - BLOCK
      ?auto_168921 - BLOCK
      ?auto_168917 - BLOCK
      ?auto_168918 - BLOCK
      ?auto_168920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168913 ) ( ON ?auto_168914 ?auto_168913 ) ( ON ?auto_168915 ?auto_168914 ) ( not ( = ?auto_168913 ?auto_168914 ) ) ( not ( = ?auto_168913 ?auto_168915 ) ) ( not ( = ?auto_168913 ?auto_168916 ) ) ( not ( = ?auto_168913 ?auto_168919 ) ) ( not ( = ?auto_168914 ?auto_168915 ) ) ( not ( = ?auto_168914 ?auto_168916 ) ) ( not ( = ?auto_168914 ?auto_168919 ) ) ( not ( = ?auto_168915 ?auto_168916 ) ) ( not ( = ?auto_168915 ?auto_168919 ) ) ( not ( = ?auto_168916 ?auto_168919 ) ) ( not ( = ?auto_168913 ?auto_168921 ) ) ( not ( = ?auto_168913 ?auto_168917 ) ) ( not ( = ?auto_168914 ?auto_168921 ) ) ( not ( = ?auto_168914 ?auto_168917 ) ) ( not ( = ?auto_168915 ?auto_168921 ) ) ( not ( = ?auto_168915 ?auto_168917 ) ) ( not ( = ?auto_168916 ?auto_168921 ) ) ( not ( = ?auto_168916 ?auto_168917 ) ) ( not ( = ?auto_168919 ?auto_168921 ) ) ( not ( = ?auto_168919 ?auto_168917 ) ) ( not ( = ?auto_168921 ?auto_168917 ) ) ( not ( = ?auto_168918 ?auto_168917 ) ) ( not ( = ?auto_168913 ?auto_168918 ) ) ( not ( = ?auto_168914 ?auto_168918 ) ) ( not ( = ?auto_168915 ?auto_168918 ) ) ( not ( = ?auto_168916 ?auto_168918 ) ) ( not ( = ?auto_168919 ?auto_168918 ) ) ( not ( = ?auto_168921 ?auto_168918 ) ) ( ON ?auto_168918 ?auto_168920 ) ( not ( = ?auto_168913 ?auto_168920 ) ) ( not ( = ?auto_168914 ?auto_168920 ) ) ( not ( = ?auto_168915 ?auto_168920 ) ) ( not ( = ?auto_168916 ?auto_168920 ) ) ( not ( = ?auto_168919 ?auto_168920 ) ) ( not ( = ?auto_168921 ?auto_168920 ) ) ( not ( = ?auto_168917 ?auto_168920 ) ) ( not ( = ?auto_168918 ?auto_168920 ) ) ( ON ?auto_168917 ?auto_168918 ) ( ON-TABLE ?auto_168920 ) ( ON ?auto_168921 ?auto_168917 ) ( ON ?auto_168919 ?auto_168921 ) ( CLEAR ?auto_168915 ) ( ON ?auto_168916 ?auto_168919 ) ( CLEAR ?auto_168916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168920 ?auto_168918 ?auto_168917 ?auto_168921 ?auto_168919 )
      ( MAKE-4PILE ?auto_168913 ?auto_168914 ?auto_168915 ?auto_168916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168922 - BLOCK
      ?auto_168923 - BLOCK
      ?auto_168924 - BLOCK
      ?auto_168925 - BLOCK
    )
    :vars
    (
      ?auto_168926 - BLOCK
      ?auto_168927 - BLOCK
      ?auto_168929 - BLOCK
      ?auto_168930 - BLOCK
      ?auto_168928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168922 ) ( ON ?auto_168923 ?auto_168922 ) ( not ( = ?auto_168922 ?auto_168923 ) ) ( not ( = ?auto_168922 ?auto_168924 ) ) ( not ( = ?auto_168922 ?auto_168925 ) ) ( not ( = ?auto_168922 ?auto_168926 ) ) ( not ( = ?auto_168923 ?auto_168924 ) ) ( not ( = ?auto_168923 ?auto_168925 ) ) ( not ( = ?auto_168923 ?auto_168926 ) ) ( not ( = ?auto_168924 ?auto_168925 ) ) ( not ( = ?auto_168924 ?auto_168926 ) ) ( not ( = ?auto_168925 ?auto_168926 ) ) ( not ( = ?auto_168922 ?auto_168927 ) ) ( not ( = ?auto_168922 ?auto_168929 ) ) ( not ( = ?auto_168923 ?auto_168927 ) ) ( not ( = ?auto_168923 ?auto_168929 ) ) ( not ( = ?auto_168924 ?auto_168927 ) ) ( not ( = ?auto_168924 ?auto_168929 ) ) ( not ( = ?auto_168925 ?auto_168927 ) ) ( not ( = ?auto_168925 ?auto_168929 ) ) ( not ( = ?auto_168926 ?auto_168927 ) ) ( not ( = ?auto_168926 ?auto_168929 ) ) ( not ( = ?auto_168927 ?auto_168929 ) ) ( not ( = ?auto_168930 ?auto_168929 ) ) ( not ( = ?auto_168922 ?auto_168930 ) ) ( not ( = ?auto_168923 ?auto_168930 ) ) ( not ( = ?auto_168924 ?auto_168930 ) ) ( not ( = ?auto_168925 ?auto_168930 ) ) ( not ( = ?auto_168926 ?auto_168930 ) ) ( not ( = ?auto_168927 ?auto_168930 ) ) ( ON ?auto_168930 ?auto_168928 ) ( not ( = ?auto_168922 ?auto_168928 ) ) ( not ( = ?auto_168923 ?auto_168928 ) ) ( not ( = ?auto_168924 ?auto_168928 ) ) ( not ( = ?auto_168925 ?auto_168928 ) ) ( not ( = ?auto_168926 ?auto_168928 ) ) ( not ( = ?auto_168927 ?auto_168928 ) ) ( not ( = ?auto_168929 ?auto_168928 ) ) ( not ( = ?auto_168930 ?auto_168928 ) ) ( ON ?auto_168929 ?auto_168930 ) ( ON-TABLE ?auto_168928 ) ( ON ?auto_168927 ?auto_168929 ) ( ON ?auto_168926 ?auto_168927 ) ( ON ?auto_168925 ?auto_168926 ) ( CLEAR ?auto_168925 ) ( HOLDING ?auto_168924 ) ( CLEAR ?auto_168923 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168922 ?auto_168923 ?auto_168924 )
      ( MAKE-4PILE ?auto_168922 ?auto_168923 ?auto_168924 ?auto_168925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168931 - BLOCK
      ?auto_168932 - BLOCK
      ?auto_168933 - BLOCK
      ?auto_168934 - BLOCK
    )
    :vars
    (
      ?auto_168939 - BLOCK
      ?auto_168936 - BLOCK
      ?auto_168938 - BLOCK
      ?auto_168935 - BLOCK
      ?auto_168937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168931 ) ( ON ?auto_168932 ?auto_168931 ) ( not ( = ?auto_168931 ?auto_168932 ) ) ( not ( = ?auto_168931 ?auto_168933 ) ) ( not ( = ?auto_168931 ?auto_168934 ) ) ( not ( = ?auto_168931 ?auto_168939 ) ) ( not ( = ?auto_168932 ?auto_168933 ) ) ( not ( = ?auto_168932 ?auto_168934 ) ) ( not ( = ?auto_168932 ?auto_168939 ) ) ( not ( = ?auto_168933 ?auto_168934 ) ) ( not ( = ?auto_168933 ?auto_168939 ) ) ( not ( = ?auto_168934 ?auto_168939 ) ) ( not ( = ?auto_168931 ?auto_168936 ) ) ( not ( = ?auto_168931 ?auto_168938 ) ) ( not ( = ?auto_168932 ?auto_168936 ) ) ( not ( = ?auto_168932 ?auto_168938 ) ) ( not ( = ?auto_168933 ?auto_168936 ) ) ( not ( = ?auto_168933 ?auto_168938 ) ) ( not ( = ?auto_168934 ?auto_168936 ) ) ( not ( = ?auto_168934 ?auto_168938 ) ) ( not ( = ?auto_168939 ?auto_168936 ) ) ( not ( = ?auto_168939 ?auto_168938 ) ) ( not ( = ?auto_168936 ?auto_168938 ) ) ( not ( = ?auto_168935 ?auto_168938 ) ) ( not ( = ?auto_168931 ?auto_168935 ) ) ( not ( = ?auto_168932 ?auto_168935 ) ) ( not ( = ?auto_168933 ?auto_168935 ) ) ( not ( = ?auto_168934 ?auto_168935 ) ) ( not ( = ?auto_168939 ?auto_168935 ) ) ( not ( = ?auto_168936 ?auto_168935 ) ) ( ON ?auto_168935 ?auto_168937 ) ( not ( = ?auto_168931 ?auto_168937 ) ) ( not ( = ?auto_168932 ?auto_168937 ) ) ( not ( = ?auto_168933 ?auto_168937 ) ) ( not ( = ?auto_168934 ?auto_168937 ) ) ( not ( = ?auto_168939 ?auto_168937 ) ) ( not ( = ?auto_168936 ?auto_168937 ) ) ( not ( = ?auto_168938 ?auto_168937 ) ) ( not ( = ?auto_168935 ?auto_168937 ) ) ( ON ?auto_168938 ?auto_168935 ) ( ON-TABLE ?auto_168937 ) ( ON ?auto_168936 ?auto_168938 ) ( ON ?auto_168939 ?auto_168936 ) ( ON ?auto_168934 ?auto_168939 ) ( CLEAR ?auto_168932 ) ( ON ?auto_168933 ?auto_168934 ) ( CLEAR ?auto_168933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168937 ?auto_168935 ?auto_168938 ?auto_168936 ?auto_168939 ?auto_168934 )
      ( MAKE-4PILE ?auto_168931 ?auto_168932 ?auto_168933 ?auto_168934 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168940 - BLOCK
      ?auto_168941 - BLOCK
      ?auto_168942 - BLOCK
      ?auto_168943 - BLOCK
    )
    :vars
    (
      ?auto_168948 - BLOCK
      ?auto_168947 - BLOCK
      ?auto_168946 - BLOCK
      ?auto_168944 - BLOCK
      ?auto_168945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168940 ) ( not ( = ?auto_168940 ?auto_168941 ) ) ( not ( = ?auto_168940 ?auto_168942 ) ) ( not ( = ?auto_168940 ?auto_168943 ) ) ( not ( = ?auto_168940 ?auto_168948 ) ) ( not ( = ?auto_168941 ?auto_168942 ) ) ( not ( = ?auto_168941 ?auto_168943 ) ) ( not ( = ?auto_168941 ?auto_168948 ) ) ( not ( = ?auto_168942 ?auto_168943 ) ) ( not ( = ?auto_168942 ?auto_168948 ) ) ( not ( = ?auto_168943 ?auto_168948 ) ) ( not ( = ?auto_168940 ?auto_168947 ) ) ( not ( = ?auto_168940 ?auto_168946 ) ) ( not ( = ?auto_168941 ?auto_168947 ) ) ( not ( = ?auto_168941 ?auto_168946 ) ) ( not ( = ?auto_168942 ?auto_168947 ) ) ( not ( = ?auto_168942 ?auto_168946 ) ) ( not ( = ?auto_168943 ?auto_168947 ) ) ( not ( = ?auto_168943 ?auto_168946 ) ) ( not ( = ?auto_168948 ?auto_168947 ) ) ( not ( = ?auto_168948 ?auto_168946 ) ) ( not ( = ?auto_168947 ?auto_168946 ) ) ( not ( = ?auto_168944 ?auto_168946 ) ) ( not ( = ?auto_168940 ?auto_168944 ) ) ( not ( = ?auto_168941 ?auto_168944 ) ) ( not ( = ?auto_168942 ?auto_168944 ) ) ( not ( = ?auto_168943 ?auto_168944 ) ) ( not ( = ?auto_168948 ?auto_168944 ) ) ( not ( = ?auto_168947 ?auto_168944 ) ) ( ON ?auto_168944 ?auto_168945 ) ( not ( = ?auto_168940 ?auto_168945 ) ) ( not ( = ?auto_168941 ?auto_168945 ) ) ( not ( = ?auto_168942 ?auto_168945 ) ) ( not ( = ?auto_168943 ?auto_168945 ) ) ( not ( = ?auto_168948 ?auto_168945 ) ) ( not ( = ?auto_168947 ?auto_168945 ) ) ( not ( = ?auto_168946 ?auto_168945 ) ) ( not ( = ?auto_168944 ?auto_168945 ) ) ( ON ?auto_168946 ?auto_168944 ) ( ON-TABLE ?auto_168945 ) ( ON ?auto_168947 ?auto_168946 ) ( ON ?auto_168948 ?auto_168947 ) ( ON ?auto_168943 ?auto_168948 ) ( ON ?auto_168942 ?auto_168943 ) ( CLEAR ?auto_168942 ) ( HOLDING ?auto_168941 ) ( CLEAR ?auto_168940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168940 ?auto_168941 )
      ( MAKE-4PILE ?auto_168940 ?auto_168941 ?auto_168942 ?auto_168943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168949 - BLOCK
      ?auto_168950 - BLOCK
      ?auto_168951 - BLOCK
      ?auto_168952 - BLOCK
    )
    :vars
    (
      ?auto_168957 - BLOCK
      ?auto_168954 - BLOCK
      ?auto_168953 - BLOCK
      ?auto_168955 - BLOCK
      ?auto_168956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168949 ) ( not ( = ?auto_168949 ?auto_168950 ) ) ( not ( = ?auto_168949 ?auto_168951 ) ) ( not ( = ?auto_168949 ?auto_168952 ) ) ( not ( = ?auto_168949 ?auto_168957 ) ) ( not ( = ?auto_168950 ?auto_168951 ) ) ( not ( = ?auto_168950 ?auto_168952 ) ) ( not ( = ?auto_168950 ?auto_168957 ) ) ( not ( = ?auto_168951 ?auto_168952 ) ) ( not ( = ?auto_168951 ?auto_168957 ) ) ( not ( = ?auto_168952 ?auto_168957 ) ) ( not ( = ?auto_168949 ?auto_168954 ) ) ( not ( = ?auto_168949 ?auto_168953 ) ) ( not ( = ?auto_168950 ?auto_168954 ) ) ( not ( = ?auto_168950 ?auto_168953 ) ) ( not ( = ?auto_168951 ?auto_168954 ) ) ( not ( = ?auto_168951 ?auto_168953 ) ) ( not ( = ?auto_168952 ?auto_168954 ) ) ( not ( = ?auto_168952 ?auto_168953 ) ) ( not ( = ?auto_168957 ?auto_168954 ) ) ( not ( = ?auto_168957 ?auto_168953 ) ) ( not ( = ?auto_168954 ?auto_168953 ) ) ( not ( = ?auto_168955 ?auto_168953 ) ) ( not ( = ?auto_168949 ?auto_168955 ) ) ( not ( = ?auto_168950 ?auto_168955 ) ) ( not ( = ?auto_168951 ?auto_168955 ) ) ( not ( = ?auto_168952 ?auto_168955 ) ) ( not ( = ?auto_168957 ?auto_168955 ) ) ( not ( = ?auto_168954 ?auto_168955 ) ) ( ON ?auto_168955 ?auto_168956 ) ( not ( = ?auto_168949 ?auto_168956 ) ) ( not ( = ?auto_168950 ?auto_168956 ) ) ( not ( = ?auto_168951 ?auto_168956 ) ) ( not ( = ?auto_168952 ?auto_168956 ) ) ( not ( = ?auto_168957 ?auto_168956 ) ) ( not ( = ?auto_168954 ?auto_168956 ) ) ( not ( = ?auto_168953 ?auto_168956 ) ) ( not ( = ?auto_168955 ?auto_168956 ) ) ( ON ?auto_168953 ?auto_168955 ) ( ON-TABLE ?auto_168956 ) ( ON ?auto_168954 ?auto_168953 ) ( ON ?auto_168957 ?auto_168954 ) ( ON ?auto_168952 ?auto_168957 ) ( ON ?auto_168951 ?auto_168952 ) ( CLEAR ?auto_168949 ) ( ON ?auto_168950 ?auto_168951 ) ( CLEAR ?auto_168950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168956 ?auto_168955 ?auto_168953 ?auto_168954 ?auto_168957 ?auto_168952 ?auto_168951 )
      ( MAKE-4PILE ?auto_168949 ?auto_168950 ?auto_168951 ?auto_168952 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168958 - BLOCK
      ?auto_168959 - BLOCK
      ?auto_168960 - BLOCK
      ?auto_168961 - BLOCK
    )
    :vars
    (
      ?auto_168963 - BLOCK
      ?auto_168966 - BLOCK
      ?auto_168964 - BLOCK
      ?auto_168965 - BLOCK
      ?auto_168962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168958 ?auto_168959 ) ) ( not ( = ?auto_168958 ?auto_168960 ) ) ( not ( = ?auto_168958 ?auto_168961 ) ) ( not ( = ?auto_168958 ?auto_168963 ) ) ( not ( = ?auto_168959 ?auto_168960 ) ) ( not ( = ?auto_168959 ?auto_168961 ) ) ( not ( = ?auto_168959 ?auto_168963 ) ) ( not ( = ?auto_168960 ?auto_168961 ) ) ( not ( = ?auto_168960 ?auto_168963 ) ) ( not ( = ?auto_168961 ?auto_168963 ) ) ( not ( = ?auto_168958 ?auto_168966 ) ) ( not ( = ?auto_168958 ?auto_168964 ) ) ( not ( = ?auto_168959 ?auto_168966 ) ) ( not ( = ?auto_168959 ?auto_168964 ) ) ( not ( = ?auto_168960 ?auto_168966 ) ) ( not ( = ?auto_168960 ?auto_168964 ) ) ( not ( = ?auto_168961 ?auto_168966 ) ) ( not ( = ?auto_168961 ?auto_168964 ) ) ( not ( = ?auto_168963 ?auto_168966 ) ) ( not ( = ?auto_168963 ?auto_168964 ) ) ( not ( = ?auto_168966 ?auto_168964 ) ) ( not ( = ?auto_168965 ?auto_168964 ) ) ( not ( = ?auto_168958 ?auto_168965 ) ) ( not ( = ?auto_168959 ?auto_168965 ) ) ( not ( = ?auto_168960 ?auto_168965 ) ) ( not ( = ?auto_168961 ?auto_168965 ) ) ( not ( = ?auto_168963 ?auto_168965 ) ) ( not ( = ?auto_168966 ?auto_168965 ) ) ( ON ?auto_168965 ?auto_168962 ) ( not ( = ?auto_168958 ?auto_168962 ) ) ( not ( = ?auto_168959 ?auto_168962 ) ) ( not ( = ?auto_168960 ?auto_168962 ) ) ( not ( = ?auto_168961 ?auto_168962 ) ) ( not ( = ?auto_168963 ?auto_168962 ) ) ( not ( = ?auto_168966 ?auto_168962 ) ) ( not ( = ?auto_168964 ?auto_168962 ) ) ( not ( = ?auto_168965 ?auto_168962 ) ) ( ON ?auto_168964 ?auto_168965 ) ( ON-TABLE ?auto_168962 ) ( ON ?auto_168966 ?auto_168964 ) ( ON ?auto_168963 ?auto_168966 ) ( ON ?auto_168961 ?auto_168963 ) ( ON ?auto_168960 ?auto_168961 ) ( ON ?auto_168959 ?auto_168960 ) ( CLEAR ?auto_168959 ) ( HOLDING ?auto_168958 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168958 )
      ( MAKE-4PILE ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168967 - BLOCK
      ?auto_168968 - BLOCK
      ?auto_168969 - BLOCK
      ?auto_168970 - BLOCK
    )
    :vars
    (
      ?auto_168972 - BLOCK
      ?auto_168971 - BLOCK
      ?auto_168975 - BLOCK
      ?auto_168973 - BLOCK
      ?auto_168974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_168967 ?auto_168968 ) ) ( not ( = ?auto_168967 ?auto_168969 ) ) ( not ( = ?auto_168967 ?auto_168970 ) ) ( not ( = ?auto_168967 ?auto_168972 ) ) ( not ( = ?auto_168968 ?auto_168969 ) ) ( not ( = ?auto_168968 ?auto_168970 ) ) ( not ( = ?auto_168968 ?auto_168972 ) ) ( not ( = ?auto_168969 ?auto_168970 ) ) ( not ( = ?auto_168969 ?auto_168972 ) ) ( not ( = ?auto_168970 ?auto_168972 ) ) ( not ( = ?auto_168967 ?auto_168971 ) ) ( not ( = ?auto_168967 ?auto_168975 ) ) ( not ( = ?auto_168968 ?auto_168971 ) ) ( not ( = ?auto_168968 ?auto_168975 ) ) ( not ( = ?auto_168969 ?auto_168971 ) ) ( not ( = ?auto_168969 ?auto_168975 ) ) ( not ( = ?auto_168970 ?auto_168971 ) ) ( not ( = ?auto_168970 ?auto_168975 ) ) ( not ( = ?auto_168972 ?auto_168971 ) ) ( not ( = ?auto_168972 ?auto_168975 ) ) ( not ( = ?auto_168971 ?auto_168975 ) ) ( not ( = ?auto_168973 ?auto_168975 ) ) ( not ( = ?auto_168967 ?auto_168973 ) ) ( not ( = ?auto_168968 ?auto_168973 ) ) ( not ( = ?auto_168969 ?auto_168973 ) ) ( not ( = ?auto_168970 ?auto_168973 ) ) ( not ( = ?auto_168972 ?auto_168973 ) ) ( not ( = ?auto_168971 ?auto_168973 ) ) ( ON ?auto_168973 ?auto_168974 ) ( not ( = ?auto_168967 ?auto_168974 ) ) ( not ( = ?auto_168968 ?auto_168974 ) ) ( not ( = ?auto_168969 ?auto_168974 ) ) ( not ( = ?auto_168970 ?auto_168974 ) ) ( not ( = ?auto_168972 ?auto_168974 ) ) ( not ( = ?auto_168971 ?auto_168974 ) ) ( not ( = ?auto_168975 ?auto_168974 ) ) ( not ( = ?auto_168973 ?auto_168974 ) ) ( ON ?auto_168975 ?auto_168973 ) ( ON-TABLE ?auto_168974 ) ( ON ?auto_168971 ?auto_168975 ) ( ON ?auto_168972 ?auto_168971 ) ( ON ?auto_168970 ?auto_168972 ) ( ON ?auto_168969 ?auto_168970 ) ( ON ?auto_168968 ?auto_168969 ) ( ON ?auto_168967 ?auto_168968 ) ( CLEAR ?auto_168967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168974 ?auto_168973 ?auto_168975 ?auto_168971 ?auto_168972 ?auto_168970 ?auto_168969 ?auto_168968 )
      ( MAKE-4PILE ?auto_168967 ?auto_168968 ?auto_168969 ?auto_168970 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168980 - BLOCK
      ?auto_168981 - BLOCK
      ?auto_168982 - BLOCK
      ?auto_168983 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_168983 ) ( CLEAR ?auto_168982 ) ( ON-TABLE ?auto_168980 ) ( ON ?auto_168981 ?auto_168980 ) ( ON ?auto_168982 ?auto_168981 ) ( not ( = ?auto_168980 ?auto_168981 ) ) ( not ( = ?auto_168980 ?auto_168982 ) ) ( not ( = ?auto_168980 ?auto_168983 ) ) ( not ( = ?auto_168981 ?auto_168982 ) ) ( not ( = ?auto_168981 ?auto_168983 ) ) ( not ( = ?auto_168982 ?auto_168983 ) ) )
    :subtasks
    ( ( !STACK ?auto_168983 ?auto_168982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168984 - BLOCK
      ?auto_168985 - BLOCK
      ?auto_168986 - BLOCK
      ?auto_168987 - BLOCK
    )
    :vars
    (
      ?auto_168988 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168986 ) ( ON-TABLE ?auto_168984 ) ( ON ?auto_168985 ?auto_168984 ) ( ON ?auto_168986 ?auto_168985 ) ( not ( = ?auto_168984 ?auto_168985 ) ) ( not ( = ?auto_168984 ?auto_168986 ) ) ( not ( = ?auto_168984 ?auto_168987 ) ) ( not ( = ?auto_168985 ?auto_168986 ) ) ( not ( = ?auto_168985 ?auto_168987 ) ) ( not ( = ?auto_168986 ?auto_168987 ) ) ( ON ?auto_168987 ?auto_168988 ) ( CLEAR ?auto_168987 ) ( HAND-EMPTY ) ( not ( = ?auto_168984 ?auto_168988 ) ) ( not ( = ?auto_168985 ?auto_168988 ) ) ( not ( = ?auto_168986 ?auto_168988 ) ) ( not ( = ?auto_168987 ?auto_168988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168987 ?auto_168988 )
      ( MAKE-4PILE ?auto_168984 ?auto_168985 ?auto_168986 ?auto_168987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168989 - BLOCK
      ?auto_168990 - BLOCK
      ?auto_168991 - BLOCK
      ?auto_168992 - BLOCK
    )
    :vars
    (
      ?auto_168993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168989 ) ( ON ?auto_168990 ?auto_168989 ) ( not ( = ?auto_168989 ?auto_168990 ) ) ( not ( = ?auto_168989 ?auto_168991 ) ) ( not ( = ?auto_168989 ?auto_168992 ) ) ( not ( = ?auto_168990 ?auto_168991 ) ) ( not ( = ?auto_168990 ?auto_168992 ) ) ( not ( = ?auto_168991 ?auto_168992 ) ) ( ON ?auto_168992 ?auto_168993 ) ( CLEAR ?auto_168992 ) ( not ( = ?auto_168989 ?auto_168993 ) ) ( not ( = ?auto_168990 ?auto_168993 ) ) ( not ( = ?auto_168991 ?auto_168993 ) ) ( not ( = ?auto_168992 ?auto_168993 ) ) ( HOLDING ?auto_168991 ) ( CLEAR ?auto_168990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168989 ?auto_168990 ?auto_168991 )
      ( MAKE-4PILE ?auto_168989 ?auto_168990 ?auto_168991 ?auto_168992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_168994 - BLOCK
      ?auto_168995 - BLOCK
      ?auto_168996 - BLOCK
      ?auto_168997 - BLOCK
    )
    :vars
    (
      ?auto_168998 - BLOCK
      ?auto_168999 - BLOCK
      ?auto_169001 - BLOCK
      ?auto_169000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168994 ) ( ON ?auto_168995 ?auto_168994 ) ( not ( = ?auto_168994 ?auto_168995 ) ) ( not ( = ?auto_168994 ?auto_168996 ) ) ( not ( = ?auto_168994 ?auto_168997 ) ) ( not ( = ?auto_168995 ?auto_168996 ) ) ( not ( = ?auto_168995 ?auto_168997 ) ) ( not ( = ?auto_168996 ?auto_168997 ) ) ( ON ?auto_168997 ?auto_168998 ) ( not ( = ?auto_168994 ?auto_168998 ) ) ( not ( = ?auto_168995 ?auto_168998 ) ) ( not ( = ?auto_168996 ?auto_168998 ) ) ( not ( = ?auto_168997 ?auto_168998 ) ) ( CLEAR ?auto_168995 ) ( ON ?auto_168996 ?auto_168997 ) ( CLEAR ?auto_168996 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168999 ) ( ON ?auto_169001 ?auto_168999 ) ( ON ?auto_169000 ?auto_169001 ) ( ON ?auto_168998 ?auto_169000 ) ( not ( = ?auto_168999 ?auto_169001 ) ) ( not ( = ?auto_168999 ?auto_169000 ) ) ( not ( = ?auto_168999 ?auto_168998 ) ) ( not ( = ?auto_168999 ?auto_168997 ) ) ( not ( = ?auto_168999 ?auto_168996 ) ) ( not ( = ?auto_169001 ?auto_169000 ) ) ( not ( = ?auto_169001 ?auto_168998 ) ) ( not ( = ?auto_169001 ?auto_168997 ) ) ( not ( = ?auto_169001 ?auto_168996 ) ) ( not ( = ?auto_169000 ?auto_168998 ) ) ( not ( = ?auto_169000 ?auto_168997 ) ) ( not ( = ?auto_169000 ?auto_168996 ) ) ( not ( = ?auto_168994 ?auto_168999 ) ) ( not ( = ?auto_168994 ?auto_169001 ) ) ( not ( = ?auto_168994 ?auto_169000 ) ) ( not ( = ?auto_168995 ?auto_168999 ) ) ( not ( = ?auto_168995 ?auto_169001 ) ) ( not ( = ?auto_168995 ?auto_169000 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168999 ?auto_169001 ?auto_169000 ?auto_168998 ?auto_168997 )
      ( MAKE-4PILE ?auto_168994 ?auto_168995 ?auto_168996 ?auto_168997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169002 - BLOCK
      ?auto_169003 - BLOCK
      ?auto_169004 - BLOCK
      ?auto_169005 - BLOCK
    )
    :vars
    (
      ?auto_169007 - BLOCK
      ?auto_169006 - BLOCK
      ?auto_169009 - BLOCK
      ?auto_169008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169002 ) ( not ( = ?auto_169002 ?auto_169003 ) ) ( not ( = ?auto_169002 ?auto_169004 ) ) ( not ( = ?auto_169002 ?auto_169005 ) ) ( not ( = ?auto_169003 ?auto_169004 ) ) ( not ( = ?auto_169003 ?auto_169005 ) ) ( not ( = ?auto_169004 ?auto_169005 ) ) ( ON ?auto_169005 ?auto_169007 ) ( not ( = ?auto_169002 ?auto_169007 ) ) ( not ( = ?auto_169003 ?auto_169007 ) ) ( not ( = ?auto_169004 ?auto_169007 ) ) ( not ( = ?auto_169005 ?auto_169007 ) ) ( ON ?auto_169004 ?auto_169005 ) ( CLEAR ?auto_169004 ) ( ON-TABLE ?auto_169006 ) ( ON ?auto_169009 ?auto_169006 ) ( ON ?auto_169008 ?auto_169009 ) ( ON ?auto_169007 ?auto_169008 ) ( not ( = ?auto_169006 ?auto_169009 ) ) ( not ( = ?auto_169006 ?auto_169008 ) ) ( not ( = ?auto_169006 ?auto_169007 ) ) ( not ( = ?auto_169006 ?auto_169005 ) ) ( not ( = ?auto_169006 ?auto_169004 ) ) ( not ( = ?auto_169009 ?auto_169008 ) ) ( not ( = ?auto_169009 ?auto_169007 ) ) ( not ( = ?auto_169009 ?auto_169005 ) ) ( not ( = ?auto_169009 ?auto_169004 ) ) ( not ( = ?auto_169008 ?auto_169007 ) ) ( not ( = ?auto_169008 ?auto_169005 ) ) ( not ( = ?auto_169008 ?auto_169004 ) ) ( not ( = ?auto_169002 ?auto_169006 ) ) ( not ( = ?auto_169002 ?auto_169009 ) ) ( not ( = ?auto_169002 ?auto_169008 ) ) ( not ( = ?auto_169003 ?auto_169006 ) ) ( not ( = ?auto_169003 ?auto_169009 ) ) ( not ( = ?auto_169003 ?auto_169008 ) ) ( HOLDING ?auto_169003 ) ( CLEAR ?auto_169002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169002 ?auto_169003 )
      ( MAKE-4PILE ?auto_169002 ?auto_169003 ?auto_169004 ?auto_169005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169010 - BLOCK
      ?auto_169011 - BLOCK
      ?auto_169012 - BLOCK
      ?auto_169013 - BLOCK
    )
    :vars
    (
      ?auto_169017 - BLOCK
      ?auto_169014 - BLOCK
      ?auto_169015 - BLOCK
      ?auto_169016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169010 ) ( not ( = ?auto_169010 ?auto_169011 ) ) ( not ( = ?auto_169010 ?auto_169012 ) ) ( not ( = ?auto_169010 ?auto_169013 ) ) ( not ( = ?auto_169011 ?auto_169012 ) ) ( not ( = ?auto_169011 ?auto_169013 ) ) ( not ( = ?auto_169012 ?auto_169013 ) ) ( ON ?auto_169013 ?auto_169017 ) ( not ( = ?auto_169010 ?auto_169017 ) ) ( not ( = ?auto_169011 ?auto_169017 ) ) ( not ( = ?auto_169012 ?auto_169017 ) ) ( not ( = ?auto_169013 ?auto_169017 ) ) ( ON ?auto_169012 ?auto_169013 ) ( ON-TABLE ?auto_169014 ) ( ON ?auto_169015 ?auto_169014 ) ( ON ?auto_169016 ?auto_169015 ) ( ON ?auto_169017 ?auto_169016 ) ( not ( = ?auto_169014 ?auto_169015 ) ) ( not ( = ?auto_169014 ?auto_169016 ) ) ( not ( = ?auto_169014 ?auto_169017 ) ) ( not ( = ?auto_169014 ?auto_169013 ) ) ( not ( = ?auto_169014 ?auto_169012 ) ) ( not ( = ?auto_169015 ?auto_169016 ) ) ( not ( = ?auto_169015 ?auto_169017 ) ) ( not ( = ?auto_169015 ?auto_169013 ) ) ( not ( = ?auto_169015 ?auto_169012 ) ) ( not ( = ?auto_169016 ?auto_169017 ) ) ( not ( = ?auto_169016 ?auto_169013 ) ) ( not ( = ?auto_169016 ?auto_169012 ) ) ( not ( = ?auto_169010 ?auto_169014 ) ) ( not ( = ?auto_169010 ?auto_169015 ) ) ( not ( = ?auto_169010 ?auto_169016 ) ) ( not ( = ?auto_169011 ?auto_169014 ) ) ( not ( = ?auto_169011 ?auto_169015 ) ) ( not ( = ?auto_169011 ?auto_169016 ) ) ( CLEAR ?auto_169010 ) ( ON ?auto_169011 ?auto_169012 ) ( CLEAR ?auto_169011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169014 ?auto_169015 ?auto_169016 ?auto_169017 ?auto_169013 ?auto_169012 )
      ( MAKE-4PILE ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169018 - BLOCK
      ?auto_169019 - BLOCK
      ?auto_169020 - BLOCK
      ?auto_169021 - BLOCK
    )
    :vars
    (
      ?auto_169023 - BLOCK
      ?auto_169024 - BLOCK
      ?auto_169022 - BLOCK
      ?auto_169025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169018 ?auto_169019 ) ) ( not ( = ?auto_169018 ?auto_169020 ) ) ( not ( = ?auto_169018 ?auto_169021 ) ) ( not ( = ?auto_169019 ?auto_169020 ) ) ( not ( = ?auto_169019 ?auto_169021 ) ) ( not ( = ?auto_169020 ?auto_169021 ) ) ( ON ?auto_169021 ?auto_169023 ) ( not ( = ?auto_169018 ?auto_169023 ) ) ( not ( = ?auto_169019 ?auto_169023 ) ) ( not ( = ?auto_169020 ?auto_169023 ) ) ( not ( = ?auto_169021 ?auto_169023 ) ) ( ON ?auto_169020 ?auto_169021 ) ( ON-TABLE ?auto_169024 ) ( ON ?auto_169022 ?auto_169024 ) ( ON ?auto_169025 ?auto_169022 ) ( ON ?auto_169023 ?auto_169025 ) ( not ( = ?auto_169024 ?auto_169022 ) ) ( not ( = ?auto_169024 ?auto_169025 ) ) ( not ( = ?auto_169024 ?auto_169023 ) ) ( not ( = ?auto_169024 ?auto_169021 ) ) ( not ( = ?auto_169024 ?auto_169020 ) ) ( not ( = ?auto_169022 ?auto_169025 ) ) ( not ( = ?auto_169022 ?auto_169023 ) ) ( not ( = ?auto_169022 ?auto_169021 ) ) ( not ( = ?auto_169022 ?auto_169020 ) ) ( not ( = ?auto_169025 ?auto_169023 ) ) ( not ( = ?auto_169025 ?auto_169021 ) ) ( not ( = ?auto_169025 ?auto_169020 ) ) ( not ( = ?auto_169018 ?auto_169024 ) ) ( not ( = ?auto_169018 ?auto_169022 ) ) ( not ( = ?auto_169018 ?auto_169025 ) ) ( not ( = ?auto_169019 ?auto_169024 ) ) ( not ( = ?auto_169019 ?auto_169022 ) ) ( not ( = ?auto_169019 ?auto_169025 ) ) ( ON ?auto_169019 ?auto_169020 ) ( CLEAR ?auto_169019 ) ( HOLDING ?auto_169018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169018 )
      ( MAKE-4PILE ?auto_169018 ?auto_169019 ?auto_169020 ?auto_169021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169026 - BLOCK
      ?auto_169027 - BLOCK
      ?auto_169028 - BLOCK
      ?auto_169029 - BLOCK
    )
    :vars
    (
      ?auto_169031 - BLOCK
      ?auto_169030 - BLOCK
      ?auto_169032 - BLOCK
      ?auto_169033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169026 ?auto_169027 ) ) ( not ( = ?auto_169026 ?auto_169028 ) ) ( not ( = ?auto_169026 ?auto_169029 ) ) ( not ( = ?auto_169027 ?auto_169028 ) ) ( not ( = ?auto_169027 ?auto_169029 ) ) ( not ( = ?auto_169028 ?auto_169029 ) ) ( ON ?auto_169029 ?auto_169031 ) ( not ( = ?auto_169026 ?auto_169031 ) ) ( not ( = ?auto_169027 ?auto_169031 ) ) ( not ( = ?auto_169028 ?auto_169031 ) ) ( not ( = ?auto_169029 ?auto_169031 ) ) ( ON ?auto_169028 ?auto_169029 ) ( ON-TABLE ?auto_169030 ) ( ON ?auto_169032 ?auto_169030 ) ( ON ?auto_169033 ?auto_169032 ) ( ON ?auto_169031 ?auto_169033 ) ( not ( = ?auto_169030 ?auto_169032 ) ) ( not ( = ?auto_169030 ?auto_169033 ) ) ( not ( = ?auto_169030 ?auto_169031 ) ) ( not ( = ?auto_169030 ?auto_169029 ) ) ( not ( = ?auto_169030 ?auto_169028 ) ) ( not ( = ?auto_169032 ?auto_169033 ) ) ( not ( = ?auto_169032 ?auto_169031 ) ) ( not ( = ?auto_169032 ?auto_169029 ) ) ( not ( = ?auto_169032 ?auto_169028 ) ) ( not ( = ?auto_169033 ?auto_169031 ) ) ( not ( = ?auto_169033 ?auto_169029 ) ) ( not ( = ?auto_169033 ?auto_169028 ) ) ( not ( = ?auto_169026 ?auto_169030 ) ) ( not ( = ?auto_169026 ?auto_169032 ) ) ( not ( = ?auto_169026 ?auto_169033 ) ) ( not ( = ?auto_169027 ?auto_169030 ) ) ( not ( = ?auto_169027 ?auto_169032 ) ) ( not ( = ?auto_169027 ?auto_169033 ) ) ( ON ?auto_169027 ?auto_169028 ) ( ON ?auto_169026 ?auto_169027 ) ( CLEAR ?auto_169026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169030 ?auto_169032 ?auto_169033 ?auto_169031 ?auto_169029 ?auto_169028 ?auto_169027 )
      ( MAKE-4PILE ?auto_169026 ?auto_169027 ?auto_169028 ?auto_169029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169034 - BLOCK
      ?auto_169035 - BLOCK
      ?auto_169036 - BLOCK
      ?auto_169037 - BLOCK
    )
    :vars
    (
      ?auto_169040 - BLOCK
      ?auto_169041 - BLOCK
      ?auto_169038 - BLOCK
      ?auto_169039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169034 ?auto_169035 ) ) ( not ( = ?auto_169034 ?auto_169036 ) ) ( not ( = ?auto_169034 ?auto_169037 ) ) ( not ( = ?auto_169035 ?auto_169036 ) ) ( not ( = ?auto_169035 ?auto_169037 ) ) ( not ( = ?auto_169036 ?auto_169037 ) ) ( ON ?auto_169037 ?auto_169040 ) ( not ( = ?auto_169034 ?auto_169040 ) ) ( not ( = ?auto_169035 ?auto_169040 ) ) ( not ( = ?auto_169036 ?auto_169040 ) ) ( not ( = ?auto_169037 ?auto_169040 ) ) ( ON ?auto_169036 ?auto_169037 ) ( ON-TABLE ?auto_169041 ) ( ON ?auto_169038 ?auto_169041 ) ( ON ?auto_169039 ?auto_169038 ) ( ON ?auto_169040 ?auto_169039 ) ( not ( = ?auto_169041 ?auto_169038 ) ) ( not ( = ?auto_169041 ?auto_169039 ) ) ( not ( = ?auto_169041 ?auto_169040 ) ) ( not ( = ?auto_169041 ?auto_169037 ) ) ( not ( = ?auto_169041 ?auto_169036 ) ) ( not ( = ?auto_169038 ?auto_169039 ) ) ( not ( = ?auto_169038 ?auto_169040 ) ) ( not ( = ?auto_169038 ?auto_169037 ) ) ( not ( = ?auto_169038 ?auto_169036 ) ) ( not ( = ?auto_169039 ?auto_169040 ) ) ( not ( = ?auto_169039 ?auto_169037 ) ) ( not ( = ?auto_169039 ?auto_169036 ) ) ( not ( = ?auto_169034 ?auto_169041 ) ) ( not ( = ?auto_169034 ?auto_169038 ) ) ( not ( = ?auto_169034 ?auto_169039 ) ) ( not ( = ?auto_169035 ?auto_169041 ) ) ( not ( = ?auto_169035 ?auto_169038 ) ) ( not ( = ?auto_169035 ?auto_169039 ) ) ( ON ?auto_169035 ?auto_169036 ) ( HOLDING ?auto_169034 ) ( CLEAR ?auto_169035 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169041 ?auto_169038 ?auto_169039 ?auto_169040 ?auto_169037 ?auto_169036 ?auto_169035 ?auto_169034 )
      ( MAKE-4PILE ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169042 - BLOCK
      ?auto_169043 - BLOCK
      ?auto_169044 - BLOCK
      ?auto_169045 - BLOCK
    )
    :vars
    (
      ?auto_169049 - BLOCK
      ?auto_169048 - BLOCK
      ?auto_169047 - BLOCK
      ?auto_169046 - BLOCK
      ?auto_169050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169042 ?auto_169043 ) ) ( not ( = ?auto_169042 ?auto_169044 ) ) ( not ( = ?auto_169042 ?auto_169045 ) ) ( not ( = ?auto_169043 ?auto_169044 ) ) ( not ( = ?auto_169043 ?auto_169045 ) ) ( not ( = ?auto_169044 ?auto_169045 ) ) ( ON ?auto_169045 ?auto_169049 ) ( not ( = ?auto_169042 ?auto_169049 ) ) ( not ( = ?auto_169043 ?auto_169049 ) ) ( not ( = ?auto_169044 ?auto_169049 ) ) ( not ( = ?auto_169045 ?auto_169049 ) ) ( ON ?auto_169044 ?auto_169045 ) ( ON-TABLE ?auto_169048 ) ( ON ?auto_169047 ?auto_169048 ) ( ON ?auto_169046 ?auto_169047 ) ( ON ?auto_169049 ?auto_169046 ) ( not ( = ?auto_169048 ?auto_169047 ) ) ( not ( = ?auto_169048 ?auto_169046 ) ) ( not ( = ?auto_169048 ?auto_169049 ) ) ( not ( = ?auto_169048 ?auto_169045 ) ) ( not ( = ?auto_169048 ?auto_169044 ) ) ( not ( = ?auto_169047 ?auto_169046 ) ) ( not ( = ?auto_169047 ?auto_169049 ) ) ( not ( = ?auto_169047 ?auto_169045 ) ) ( not ( = ?auto_169047 ?auto_169044 ) ) ( not ( = ?auto_169046 ?auto_169049 ) ) ( not ( = ?auto_169046 ?auto_169045 ) ) ( not ( = ?auto_169046 ?auto_169044 ) ) ( not ( = ?auto_169042 ?auto_169048 ) ) ( not ( = ?auto_169042 ?auto_169047 ) ) ( not ( = ?auto_169042 ?auto_169046 ) ) ( not ( = ?auto_169043 ?auto_169048 ) ) ( not ( = ?auto_169043 ?auto_169047 ) ) ( not ( = ?auto_169043 ?auto_169046 ) ) ( ON ?auto_169043 ?auto_169044 ) ( CLEAR ?auto_169043 ) ( ON ?auto_169042 ?auto_169050 ) ( CLEAR ?auto_169042 ) ( HAND-EMPTY ) ( not ( = ?auto_169042 ?auto_169050 ) ) ( not ( = ?auto_169043 ?auto_169050 ) ) ( not ( = ?auto_169044 ?auto_169050 ) ) ( not ( = ?auto_169045 ?auto_169050 ) ) ( not ( = ?auto_169049 ?auto_169050 ) ) ( not ( = ?auto_169048 ?auto_169050 ) ) ( not ( = ?auto_169047 ?auto_169050 ) ) ( not ( = ?auto_169046 ?auto_169050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169042 ?auto_169050 )
      ( MAKE-4PILE ?auto_169042 ?auto_169043 ?auto_169044 ?auto_169045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169051 - BLOCK
      ?auto_169052 - BLOCK
      ?auto_169053 - BLOCK
      ?auto_169054 - BLOCK
    )
    :vars
    (
      ?auto_169055 - BLOCK
      ?auto_169056 - BLOCK
      ?auto_169057 - BLOCK
      ?auto_169059 - BLOCK
      ?auto_169058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169051 ?auto_169052 ) ) ( not ( = ?auto_169051 ?auto_169053 ) ) ( not ( = ?auto_169051 ?auto_169054 ) ) ( not ( = ?auto_169052 ?auto_169053 ) ) ( not ( = ?auto_169052 ?auto_169054 ) ) ( not ( = ?auto_169053 ?auto_169054 ) ) ( ON ?auto_169054 ?auto_169055 ) ( not ( = ?auto_169051 ?auto_169055 ) ) ( not ( = ?auto_169052 ?auto_169055 ) ) ( not ( = ?auto_169053 ?auto_169055 ) ) ( not ( = ?auto_169054 ?auto_169055 ) ) ( ON ?auto_169053 ?auto_169054 ) ( ON-TABLE ?auto_169056 ) ( ON ?auto_169057 ?auto_169056 ) ( ON ?auto_169059 ?auto_169057 ) ( ON ?auto_169055 ?auto_169059 ) ( not ( = ?auto_169056 ?auto_169057 ) ) ( not ( = ?auto_169056 ?auto_169059 ) ) ( not ( = ?auto_169056 ?auto_169055 ) ) ( not ( = ?auto_169056 ?auto_169054 ) ) ( not ( = ?auto_169056 ?auto_169053 ) ) ( not ( = ?auto_169057 ?auto_169059 ) ) ( not ( = ?auto_169057 ?auto_169055 ) ) ( not ( = ?auto_169057 ?auto_169054 ) ) ( not ( = ?auto_169057 ?auto_169053 ) ) ( not ( = ?auto_169059 ?auto_169055 ) ) ( not ( = ?auto_169059 ?auto_169054 ) ) ( not ( = ?auto_169059 ?auto_169053 ) ) ( not ( = ?auto_169051 ?auto_169056 ) ) ( not ( = ?auto_169051 ?auto_169057 ) ) ( not ( = ?auto_169051 ?auto_169059 ) ) ( not ( = ?auto_169052 ?auto_169056 ) ) ( not ( = ?auto_169052 ?auto_169057 ) ) ( not ( = ?auto_169052 ?auto_169059 ) ) ( ON ?auto_169051 ?auto_169058 ) ( CLEAR ?auto_169051 ) ( not ( = ?auto_169051 ?auto_169058 ) ) ( not ( = ?auto_169052 ?auto_169058 ) ) ( not ( = ?auto_169053 ?auto_169058 ) ) ( not ( = ?auto_169054 ?auto_169058 ) ) ( not ( = ?auto_169055 ?auto_169058 ) ) ( not ( = ?auto_169056 ?auto_169058 ) ) ( not ( = ?auto_169057 ?auto_169058 ) ) ( not ( = ?auto_169059 ?auto_169058 ) ) ( HOLDING ?auto_169052 ) ( CLEAR ?auto_169053 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169056 ?auto_169057 ?auto_169059 ?auto_169055 ?auto_169054 ?auto_169053 ?auto_169052 )
      ( MAKE-4PILE ?auto_169051 ?auto_169052 ?auto_169053 ?auto_169054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169060 - BLOCK
      ?auto_169061 - BLOCK
      ?auto_169062 - BLOCK
      ?auto_169063 - BLOCK
    )
    :vars
    (
      ?auto_169067 - BLOCK
      ?auto_169065 - BLOCK
      ?auto_169066 - BLOCK
      ?auto_169068 - BLOCK
      ?auto_169064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169060 ?auto_169061 ) ) ( not ( = ?auto_169060 ?auto_169062 ) ) ( not ( = ?auto_169060 ?auto_169063 ) ) ( not ( = ?auto_169061 ?auto_169062 ) ) ( not ( = ?auto_169061 ?auto_169063 ) ) ( not ( = ?auto_169062 ?auto_169063 ) ) ( ON ?auto_169063 ?auto_169067 ) ( not ( = ?auto_169060 ?auto_169067 ) ) ( not ( = ?auto_169061 ?auto_169067 ) ) ( not ( = ?auto_169062 ?auto_169067 ) ) ( not ( = ?auto_169063 ?auto_169067 ) ) ( ON ?auto_169062 ?auto_169063 ) ( ON-TABLE ?auto_169065 ) ( ON ?auto_169066 ?auto_169065 ) ( ON ?auto_169068 ?auto_169066 ) ( ON ?auto_169067 ?auto_169068 ) ( not ( = ?auto_169065 ?auto_169066 ) ) ( not ( = ?auto_169065 ?auto_169068 ) ) ( not ( = ?auto_169065 ?auto_169067 ) ) ( not ( = ?auto_169065 ?auto_169063 ) ) ( not ( = ?auto_169065 ?auto_169062 ) ) ( not ( = ?auto_169066 ?auto_169068 ) ) ( not ( = ?auto_169066 ?auto_169067 ) ) ( not ( = ?auto_169066 ?auto_169063 ) ) ( not ( = ?auto_169066 ?auto_169062 ) ) ( not ( = ?auto_169068 ?auto_169067 ) ) ( not ( = ?auto_169068 ?auto_169063 ) ) ( not ( = ?auto_169068 ?auto_169062 ) ) ( not ( = ?auto_169060 ?auto_169065 ) ) ( not ( = ?auto_169060 ?auto_169066 ) ) ( not ( = ?auto_169060 ?auto_169068 ) ) ( not ( = ?auto_169061 ?auto_169065 ) ) ( not ( = ?auto_169061 ?auto_169066 ) ) ( not ( = ?auto_169061 ?auto_169068 ) ) ( ON ?auto_169060 ?auto_169064 ) ( not ( = ?auto_169060 ?auto_169064 ) ) ( not ( = ?auto_169061 ?auto_169064 ) ) ( not ( = ?auto_169062 ?auto_169064 ) ) ( not ( = ?auto_169063 ?auto_169064 ) ) ( not ( = ?auto_169067 ?auto_169064 ) ) ( not ( = ?auto_169065 ?auto_169064 ) ) ( not ( = ?auto_169066 ?auto_169064 ) ) ( not ( = ?auto_169068 ?auto_169064 ) ) ( CLEAR ?auto_169062 ) ( ON ?auto_169061 ?auto_169060 ) ( CLEAR ?auto_169061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169064 ?auto_169060 )
      ( MAKE-4PILE ?auto_169060 ?auto_169061 ?auto_169062 ?auto_169063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169069 - BLOCK
      ?auto_169070 - BLOCK
      ?auto_169071 - BLOCK
      ?auto_169072 - BLOCK
    )
    :vars
    (
      ?auto_169075 - BLOCK
      ?auto_169077 - BLOCK
      ?auto_169073 - BLOCK
      ?auto_169074 - BLOCK
      ?auto_169076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169069 ?auto_169070 ) ) ( not ( = ?auto_169069 ?auto_169071 ) ) ( not ( = ?auto_169069 ?auto_169072 ) ) ( not ( = ?auto_169070 ?auto_169071 ) ) ( not ( = ?auto_169070 ?auto_169072 ) ) ( not ( = ?auto_169071 ?auto_169072 ) ) ( ON ?auto_169072 ?auto_169075 ) ( not ( = ?auto_169069 ?auto_169075 ) ) ( not ( = ?auto_169070 ?auto_169075 ) ) ( not ( = ?auto_169071 ?auto_169075 ) ) ( not ( = ?auto_169072 ?auto_169075 ) ) ( ON-TABLE ?auto_169077 ) ( ON ?auto_169073 ?auto_169077 ) ( ON ?auto_169074 ?auto_169073 ) ( ON ?auto_169075 ?auto_169074 ) ( not ( = ?auto_169077 ?auto_169073 ) ) ( not ( = ?auto_169077 ?auto_169074 ) ) ( not ( = ?auto_169077 ?auto_169075 ) ) ( not ( = ?auto_169077 ?auto_169072 ) ) ( not ( = ?auto_169077 ?auto_169071 ) ) ( not ( = ?auto_169073 ?auto_169074 ) ) ( not ( = ?auto_169073 ?auto_169075 ) ) ( not ( = ?auto_169073 ?auto_169072 ) ) ( not ( = ?auto_169073 ?auto_169071 ) ) ( not ( = ?auto_169074 ?auto_169075 ) ) ( not ( = ?auto_169074 ?auto_169072 ) ) ( not ( = ?auto_169074 ?auto_169071 ) ) ( not ( = ?auto_169069 ?auto_169077 ) ) ( not ( = ?auto_169069 ?auto_169073 ) ) ( not ( = ?auto_169069 ?auto_169074 ) ) ( not ( = ?auto_169070 ?auto_169077 ) ) ( not ( = ?auto_169070 ?auto_169073 ) ) ( not ( = ?auto_169070 ?auto_169074 ) ) ( ON ?auto_169069 ?auto_169076 ) ( not ( = ?auto_169069 ?auto_169076 ) ) ( not ( = ?auto_169070 ?auto_169076 ) ) ( not ( = ?auto_169071 ?auto_169076 ) ) ( not ( = ?auto_169072 ?auto_169076 ) ) ( not ( = ?auto_169075 ?auto_169076 ) ) ( not ( = ?auto_169077 ?auto_169076 ) ) ( not ( = ?auto_169073 ?auto_169076 ) ) ( not ( = ?auto_169074 ?auto_169076 ) ) ( ON ?auto_169070 ?auto_169069 ) ( CLEAR ?auto_169070 ) ( ON-TABLE ?auto_169076 ) ( HOLDING ?auto_169071 ) ( CLEAR ?auto_169072 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169077 ?auto_169073 ?auto_169074 ?auto_169075 ?auto_169072 ?auto_169071 )
      ( MAKE-4PILE ?auto_169069 ?auto_169070 ?auto_169071 ?auto_169072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169078 - BLOCK
      ?auto_169079 - BLOCK
      ?auto_169080 - BLOCK
      ?auto_169081 - BLOCK
    )
    :vars
    (
      ?auto_169083 - BLOCK
      ?auto_169084 - BLOCK
      ?auto_169086 - BLOCK
      ?auto_169082 - BLOCK
      ?auto_169085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169078 ?auto_169079 ) ) ( not ( = ?auto_169078 ?auto_169080 ) ) ( not ( = ?auto_169078 ?auto_169081 ) ) ( not ( = ?auto_169079 ?auto_169080 ) ) ( not ( = ?auto_169079 ?auto_169081 ) ) ( not ( = ?auto_169080 ?auto_169081 ) ) ( ON ?auto_169081 ?auto_169083 ) ( not ( = ?auto_169078 ?auto_169083 ) ) ( not ( = ?auto_169079 ?auto_169083 ) ) ( not ( = ?auto_169080 ?auto_169083 ) ) ( not ( = ?auto_169081 ?auto_169083 ) ) ( ON-TABLE ?auto_169084 ) ( ON ?auto_169086 ?auto_169084 ) ( ON ?auto_169082 ?auto_169086 ) ( ON ?auto_169083 ?auto_169082 ) ( not ( = ?auto_169084 ?auto_169086 ) ) ( not ( = ?auto_169084 ?auto_169082 ) ) ( not ( = ?auto_169084 ?auto_169083 ) ) ( not ( = ?auto_169084 ?auto_169081 ) ) ( not ( = ?auto_169084 ?auto_169080 ) ) ( not ( = ?auto_169086 ?auto_169082 ) ) ( not ( = ?auto_169086 ?auto_169083 ) ) ( not ( = ?auto_169086 ?auto_169081 ) ) ( not ( = ?auto_169086 ?auto_169080 ) ) ( not ( = ?auto_169082 ?auto_169083 ) ) ( not ( = ?auto_169082 ?auto_169081 ) ) ( not ( = ?auto_169082 ?auto_169080 ) ) ( not ( = ?auto_169078 ?auto_169084 ) ) ( not ( = ?auto_169078 ?auto_169086 ) ) ( not ( = ?auto_169078 ?auto_169082 ) ) ( not ( = ?auto_169079 ?auto_169084 ) ) ( not ( = ?auto_169079 ?auto_169086 ) ) ( not ( = ?auto_169079 ?auto_169082 ) ) ( ON ?auto_169078 ?auto_169085 ) ( not ( = ?auto_169078 ?auto_169085 ) ) ( not ( = ?auto_169079 ?auto_169085 ) ) ( not ( = ?auto_169080 ?auto_169085 ) ) ( not ( = ?auto_169081 ?auto_169085 ) ) ( not ( = ?auto_169083 ?auto_169085 ) ) ( not ( = ?auto_169084 ?auto_169085 ) ) ( not ( = ?auto_169086 ?auto_169085 ) ) ( not ( = ?auto_169082 ?auto_169085 ) ) ( ON ?auto_169079 ?auto_169078 ) ( ON-TABLE ?auto_169085 ) ( CLEAR ?auto_169081 ) ( ON ?auto_169080 ?auto_169079 ) ( CLEAR ?auto_169080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169085 ?auto_169078 ?auto_169079 )
      ( MAKE-4PILE ?auto_169078 ?auto_169079 ?auto_169080 ?auto_169081 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169087 - BLOCK
      ?auto_169088 - BLOCK
      ?auto_169089 - BLOCK
      ?auto_169090 - BLOCK
    )
    :vars
    (
      ?auto_169093 - BLOCK
      ?auto_169092 - BLOCK
      ?auto_169094 - BLOCK
      ?auto_169091 - BLOCK
      ?auto_169095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169087 ?auto_169088 ) ) ( not ( = ?auto_169087 ?auto_169089 ) ) ( not ( = ?auto_169087 ?auto_169090 ) ) ( not ( = ?auto_169088 ?auto_169089 ) ) ( not ( = ?auto_169088 ?auto_169090 ) ) ( not ( = ?auto_169089 ?auto_169090 ) ) ( not ( = ?auto_169087 ?auto_169093 ) ) ( not ( = ?auto_169088 ?auto_169093 ) ) ( not ( = ?auto_169089 ?auto_169093 ) ) ( not ( = ?auto_169090 ?auto_169093 ) ) ( ON-TABLE ?auto_169092 ) ( ON ?auto_169094 ?auto_169092 ) ( ON ?auto_169091 ?auto_169094 ) ( ON ?auto_169093 ?auto_169091 ) ( not ( = ?auto_169092 ?auto_169094 ) ) ( not ( = ?auto_169092 ?auto_169091 ) ) ( not ( = ?auto_169092 ?auto_169093 ) ) ( not ( = ?auto_169092 ?auto_169090 ) ) ( not ( = ?auto_169092 ?auto_169089 ) ) ( not ( = ?auto_169094 ?auto_169091 ) ) ( not ( = ?auto_169094 ?auto_169093 ) ) ( not ( = ?auto_169094 ?auto_169090 ) ) ( not ( = ?auto_169094 ?auto_169089 ) ) ( not ( = ?auto_169091 ?auto_169093 ) ) ( not ( = ?auto_169091 ?auto_169090 ) ) ( not ( = ?auto_169091 ?auto_169089 ) ) ( not ( = ?auto_169087 ?auto_169092 ) ) ( not ( = ?auto_169087 ?auto_169094 ) ) ( not ( = ?auto_169087 ?auto_169091 ) ) ( not ( = ?auto_169088 ?auto_169092 ) ) ( not ( = ?auto_169088 ?auto_169094 ) ) ( not ( = ?auto_169088 ?auto_169091 ) ) ( ON ?auto_169087 ?auto_169095 ) ( not ( = ?auto_169087 ?auto_169095 ) ) ( not ( = ?auto_169088 ?auto_169095 ) ) ( not ( = ?auto_169089 ?auto_169095 ) ) ( not ( = ?auto_169090 ?auto_169095 ) ) ( not ( = ?auto_169093 ?auto_169095 ) ) ( not ( = ?auto_169092 ?auto_169095 ) ) ( not ( = ?auto_169094 ?auto_169095 ) ) ( not ( = ?auto_169091 ?auto_169095 ) ) ( ON ?auto_169088 ?auto_169087 ) ( ON-TABLE ?auto_169095 ) ( ON ?auto_169089 ?auto_169088 ) ( CLEAR ?auto_169089 ) ( HOLDING ?auto_169090 ) ( CLEAR ?auto_169093 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169092 ?auto_169094 ?auto_169091 ?auto_169093 ?auto_169090 )
      ( MAKE-4PILE ?auto_169087 ?auto_169088 ?auto_169089 ?auto_169090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169096 - BLOCK
      ?auto_169097 - BLOCK
      ?auto_169098 - BLOCK
      ?auto_169099 - BLOCK
    )
    :vars
    (
      ?auto_169101 - BLOCK
      ?auto_169103 - BLOCK
      ?auto_169100 - BLOCK
      ?auto_169104 - BLOCK
      ?auto_169102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169096 ?auto_169097 ) ) ( not ( = ?auto_169096 ?auto_169098 ) ) ( not ( = ?auto_169096 ?auto_169099 ) ) ( not ( = ?auto_169097 ?auto_169098 ) ) ( not ( = ?auto_169097 ?auto_169099 ) ) ( not ( = ?auto_169098 ?auto_169099 ) ) ( not ( = ?auto_169096 ?auto_169101 ) ) ( not ( = ?auto_169097 ?auto_169101 ) ) ( not ( = ?auto_169098 ?auto_169101 ) ) ( not ( = ?auto_169099 ?auto_169101 ) ) ( ON-TABLE ?auto_169103 ) ( ON ?auto_169100 ?auto_169103 ) ( ON ?auto_169104 ?auto_169100 ) ( ON ?auto_169101 ?auto_169104 ) ( not ( = ?auto_169103 ?auto_169100 ) ) ( not ( = ?auto_169103 ?auto_169104 ) ) ( not ( = ?auto_169103 ?auto_169101 ) ) ( not ( = ?auto_169103 ?auto_169099 ) ) ( not ( = ?auto_169103 ?auto_169098 ) ) ( not ( = ?auto_169100 ?auto_169104 ) ) ( not ( = ?auto_169100 ?auto_169101 ) ) ( not ( = ?auto_169100 ?auto_169099 ) ) ( not ( = ?auto_169100 ?auto_169098 ) ) ( not ( = ?auto_169104 ?auto_169101 ) ) ( not ( = ?auto_169104 ?auto_169099 ) ) ( not ( = ?auto_169104 ?auto_169098 ) ) ( not ( = ?auto_169096 ?auto_169103 ) ) ( not ( = ?auto_169096 ?auto_169100 ) ) ( not ( = ?auto_169096 ?auto_169104 ) ) ( not ( = ?auto_169097 ?auto_169103 ) ) ( not ( = ?auto_169097 ?auto_169100 ) ) ( not ( = ?auto_169097 ?auto_169104 ) ) ( ON ?auto_169096 ?auto_169102 ) ( not ( = ?auto_169096 ?auto_169102 ) ) ( not ( = ?auto_169097 ?auto_169102 ) ) ( not ( = ?auto_169098 ?auto_169102 ) ) ( not ( = ?auto_169099 ?auto_169102 ) ) ( not ( = ?auto_169101 ?auto_169102 ) ) ( not ( = ?auto_169103 ?auto_169102 ) ) ( not ( = ?auto_169100 ?auto_169102 ) ) ( not ( = ?auto_169104 ?auto_169102 ) ) ( ON ?auto_169097 ?auto_169096 ) ( ON-TABLE ?auto_169102 ) ( ON ?auto_169098 ?auto_169097 ) ( CLEAR ?auto_169101 ) ( ON ?auto_169099 ?auto_169098 ) ( CLEAR ?auto_169099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169102 ?auto_169096 ?auto_169097 ?auto_169098 )
      ( MAKE-4PILE ?auto_169096 ?auto_169097 ?auto_169098 ?auto_169099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169105 - BLOCK
      ?auto_169106 - BLOCK
      ?auto_169107 - BLOCK
      ?auto_169108 - BLOCK
    )
    :vars
    (
      ?auto_169111 - BLOCK
      ?auto_169110 - BLOCK
      ?auto_169112 - BLOCK
      ?auto_169113 - BLOCK
      ?auto_169109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169105 ?auto_169106 ) ) ( not ( = ?auto_169105 ?auto_169107 ) ) ( not ( = ?auto_169105 ?auto_169108 ) ) ( not ( = ?auto_169106 ?auto_169107 ) ) ( not ( = ?auto_169106 ?auto_169108 ) ) ( not ( = ?auto_169107 ?auto_169108 ) ) ( not ( = ?auto_169105 ?auto_169111 ) ) ( not ( = ?auto_169106 ?auto_169111 ) ) ( not ( = ?auto_169107 ?auto_169111 ) ) ( not ( = ?auto_169108 ?auto_169111 ) ) ( ON-TABLE ?auto_169110 ) ( ON ?auto_169112 ?auto_169110 ) ( ON ?auto_169113 ?auto_169112 ) ( not ( = ?auto_169110 ?auto_169112 ) ) ( not ( = ?auto_169110 ?auto_169113 ) ) ( not ( = ?auto_169110 ?auto_169111 ) ) ( not ( = ?auto_169110 ?auto_169108 ) ) ( not ( = ?auto_169110 ?auto_169107 ) ) ( not ( = ?auto_169112 ?auto_169113 ) ) ( not ( = ?auto_169112 ?auto_169111 ) ) ( not ( = ?auto_169112 ?auto_169108 ) ) ( not ( = ?auto_169112 ?auto_169107 ) ) ( not ( = ?auto_169113 ?auto_169111 ) ) ( not ( = ?auto_169113 ?auto_169108 ) ) ( not ( = ?auto_169113 ?auto_169107 ) ) ( not ( = ?auto_169105 ?auto_169110 ) ) ( not ( = ?auto_169105 ?auto_169112 ) ) ( not ( = ?auto_169105 ?auto_169113 ) ) ( not ( = ?auto_169106 ?auto_169110 ) ) ( not ( = ?auto_169106 ?auto_169112 ) ) ( not ( = ?auto_169106 ?auto_169113 ) ) ( ON ?auto_169105 ?auto_169109 ) ( not ( = ?auto_169105 ?auto_169109 ) ) ( not ( = ?auto_169106 ?auto_169109 ) ) ( not ( = ?auto_169107 ?auto_169109 ) ) ( not ( = ?auto_169108 ?auto_169109 ) ) ( not ( = ?auto_169111 ?auto_169109 ) ) ( not ( = ?auto_169110 ?auto_169109 ) ) ( not ( = ?auto_169112 ?auto_169109 ) ) ( not ( = ?auto_169113 ?auto_169109 ) ) ( ON ?auto_169106 ?auto_169105 ) ( ON-TABLE ?auto_169109 ) ( ON ?auto_169107 ?auto_169106 ) ( ON ?auto_169108 ?auto_169107 ) ( CLEAR ?auto_169108 ) ( HOLDING ?auto_169111 ) ( CLEAR ?auto_169113 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169110 ?auto_169112 ?auto_169113 ?auto_169111 )
      ( MAKE-4PILE ?auto_169105 ?auto_169106 ?auto_169107 ?auto_169108 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169114 - BLOCK
      ?auto_169115 - BLOCK
      ?auto_169116 - BLOCK
      ?auto_169117 - BLOCK
    )
    :vars
    (
      ?auto_169122 - BLOCK
      ?auto_169119 - BLOCK
      ?auto_169118 - BLOCK
      ?auto_169120 - BLOCK
      ?auto_169121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169114 ?auto_169115 ) ) ( not ( = ?auto_169114 ?auto_169116 ) ) ( not ( = ?auto_169114 ?auto_169117 ) ) ( not ( = ?auto_169115 ?auto_169116 ) ) ( not ( = ?auto_169115 ?auto_169117 ) ) ( not ( = ?auto_169116 ?auto_169117 ) ) ( not ( = ?auto_169114 ?auto_169122 ) ) ( not ( = ?auto_169115 ?auto_169122 ) ) ( not ( = ?auto_169116 ?auto_169122 ) ) ( not ( = ?auto_169117 ?auto_169122 ) ) ( ON-TABLE ?auto_169119 ) ( ON ?auto_169118 ?auto_169119 ) ( ON ?auto_169120 ?auto_169118 ) ( not ( = ?auto_169119 ?auto_169118 ) ) ( not ( = ?auto_169119 ?auto_169120 ) ) ( not ( = ?auto_169119 ?auto_169122 ) ) ( not ( = ?auto_169119 ?auto_169117 ) ) ( not ( = ?auto_169119 ?auto_169116 ) ) ( not ( = ?auto_169118 ?auto_169120 ) ) ( not ( = ?auto_169118 ?auto_169122 ) ) ( not ( = ?auto_169118 ?auto_169117 ) ) ( not ( = ?auto_169118 ?auto_169116 ) ) ( not ( = ?auto_169120 ?auto_169122 ) ) ( not ( = ?auto_169120 ?auto_169117 ) ) ( not ( = ?auto_169120 ?auto_169116 ) ) ( not ( = ?auto_169114 ?auto_169119 ) ) ( not ( = ?auto_169114 ?auto_169118 ) ) ( not ( = ?auto_169114 ?auto_169120 ) ) ( not ( = ?auto_169115 ?auto_169119 ) ) ( not ( = ?auto_169115 ?auto_169118 ) ) ( not ( = ?auto_169115 ?auto_169120 ) ) ( ON ?auto_169114 ?auto_169121 ) ( not ( = ?auto_169114 ?auto_169121 ) ) ( not ( = ?auto_169115 ?auto_169121 ) ) ( not ( = ?auto_169116 ?auto_169121 ) ) ( not ( = ?auto_169117 ?auto_169121 ) ) ( not ( = ?auto_169122 ?auto_169121 ) ) ( not ( = ?auto_169119 ?auto_169121 ) ) ( not ( = ?auto_169118 ?auto_169121 ) ) ( not ( = ?auto_169120 ?auto_169121 ) ) ( ON ?auto_169115 ?auto_169114 ) ( ON-TABLE ?auto_169121 ) ( ON ?auto_169116 ?auto_169115 ) ( ON ?auto_169117 ?auto_169116 ) ( CLEAR ?auto_169120 ) ( ON ?auto_169122 ?auto_169117 ) ( CLEAR ?auto_169122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169121 ?auto_169114 ?auto_169115 ?auto_169116 ?auto_169117 )
      ( MAKE-4PILE ?auto_169114 ?auto_169115 ?auto_169116 ?auto_169117 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169123 - BLOCK
      ?auto_169124 - BLOCK
      ?auto_169125 - BLOCK
      ?auto_169126 - BLOCK
    )
    :vars
    (
      ?auto_169127 - BLOCK
      ?auto_169129 - BLOCK
      ?auto_169130 - BLOCK
      ?auto_169131 - BLOCK
      ?auto_169128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169123 ?auto_169124 ) ) ( not ( = ?auto_169123 ?auto_169125 ) ) ( not ( = ?auto_169123 ?auto_169126 ) ) ( not ( = ?auto_169124 ?auto_169125 ) ) ( not ( = ?auto_169124 ?auto_169126 ) ) ( not ( = ?auto_169125 ?auto_169126 ) ) ( not ( = ?auto_169123 ?auto_169127 ) ) ( not ( = ?auto_169124 ?auto_169127 ) ) ( not ( = ?auto_169125 ?auto_169127 ) ) ( not ( = ?auto_169126 ?auto_169127 ) ) ( ON-TABLE ?auto_169129 ) ( ON ?auto_169130 ?auto_169129 ) ( not ( = ?auto_169129 ?auto_169130 ) ) ( not ( = ?auto_169129 ?auto_169131 ) ) ( not ( = ?auto_169129 ?auto_169127 ) ) ( not ( = ?auto_169129 ?auto_169126 ) ) ( not ( = ?auto_169129 ?auto_169125 ) ) ( not ( = ?auto_169130 ?auto_169131 ) ) ( not ( = ?auto_169130 ?auto_169127 ) ) ( not ( = ?auto_169130 ?auto_169126 ) ) ( not ( = ?auto_169130 ?auto_169125 ) ) ( not ( = ?auto_169131 ?auto_169127 ) ) ( not ( = ?auto_169131 ?auto_169126 ) ) ( not ( = ?auto_169131 ?auto_169125 ) ) ( not ( = ?auto_169123 ?auto_169129 ) ) ( not ( = ?auto_169123 ?auto_169130 ) ) ( not ( = ?auto_169123 ?auto_169131 ) ) ( not ( = ?auto_169124 ?auto_169129 ) ) ( not ( = ?auto_169124 ?auto_169130 ) ) ( not ( = ?auto_169124 ?auto_169131 ) ) ( ON ?auto_169123 ?auto_169128 ) ( not ( = ?auto_169123 ?auto_169128 ) ) ( not ( = ?auto_169124 ?auto_169128 ) ) ( not ( = ?auto_169125 ?auto_169128 ) ) ( not ( = ?auto_169126 ?auto_169128 ) ) ( not ( = ?auto_169127 ?auto_169128 ) ) ( not ( = ?auto_169129 ?auto_169128 ) ) ( not ( = ?auto_169130 ?auto_169128 ) ) ( not ( = ?auto_169131 ?auto_169128 ) ) ( ON ?auto_169124 ?auto_169123 ) ( ON-TABLE ?auto_169128 ) ( ON ?auto_169125 ?auto_169124 ) ( ON ?auto_169126 ?auto_169125 ) ( ON ?auto_169127 ?auto_169126 ) ( CLEAR ?auto_169127 ) ( HOLDING ?auto_169131 ) ( CLEAR ?auto_169130 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169129 ?auto_169130 ?auto_169131 )
      ( MAKE-4PILE ?auto_169123 ?auto_169124 ?auto_169125 ?auto_169126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169132 - BLOCK
      ?auto_169133 - BLOCK
      ?auto_169134 - BLOCK
      ?auto_169135 - BLOCK
    )
    :vars
    (
      ?auto_169136 - BLOCK
      ?auto_169137 - BLOCK
      ?auto_169139 - BLOCK
      ?auto_169140 - BLOCK
      ?auto_169138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169132 ?auto_169133 ) ) ( not ( = ?auto_169132 ?auto_169134 ) ) ( not ( = ?auto_169132 ?auto_169135 ) ) ( not ( = ?auto_169133 ?auto_169134 ) ) ( not ( = ?auto_169133 ?auto_169135 ) ) ( not ( = ?auto_169134 ?auto_169135 ) ) ( not ( = ?auto_169132 ?auto_169136 ) ) ( not ( = ?auto_169133 ?auto_169136 ) ) ( not ( = ?auto_169134 ?auto_169136 ) ) ( not ( = ?auto_169135 ?auto_169136 ) ) ( ON-TABLE ?auto_169137 ) ( ON ?auto_169139 ?auto_169137 ) ( not ( = ?auto_169137 ?auto_169139 ) ) ( not ( = ?auto_169137 ?auto_169140 ) ) ( not ( = ?auto_169137 ?auto_169136 ) ) ( not ( = ?auto_169137 ?auto_169135 ) ) ( not ( = ?auto_169137 ?auto_169134 ) ) ( not ( = ?auto_169139 ?auto_169140 ) ) ( not ( = ?auto_169139 ?auto_169136 ) ) ( not ( = ?auto_169139 ?auto_169135 ) ) ( not ( = ?auto_169139 ?auto_169134 ) ) ( not ( = ?auto_169140 ?auto_169136 ) ) ( not ( = ?auto_169140 ?auto_169135 ) ) ( not ( = ?auto_169140 ?auto_169134 ) ) ( not ( = ?auto_169132 ?auto_169137 ) ) ( not ( = ?auto_169132 ?auto_169139 ) ) ( not ( = ?auto_169132 ?auto_169140 ) ) ( not ( = ?auto_169133 ?auto_169137 ) ) ( not ( = ?auto_169133 ?auto_169139 ) ) ( not ( = ?auto_169133 ?auto_169140 ) ) ( ON ?auto_169132 ?auto_169138 ) ( not ( = ?auto_169132 ?auto_169138 ) ) ( not ( = ?auto_169133 ?auto_169138 ) ) ( not ( = ?auto_169134 ?auto_169138 ) ) ( not ( = ?auto_169135 ?auto_169138 ) ) ( not ( = ?auto_169136 ?auto_169138 ) ) ( not ( = ?auto_169137 ?auto_169138 ) ) ( not ( = ?auto_169139 ?auto_169138 ) ) ( not ( = ?auto_169140 ?auto_169138 ) ) ( ON ?auto_169133 ?auto_169132 ) ( ON-TABLE ?auto_169138 ) ( ON ?auto_169134 ?auto_169133 ) ( ON ?auto_169135 ?auto_169134 ) ( ON ?auto_169136 ?auto_169135 ) ( CLEAR ?auto_169139 ) ( ON ?auto_169140 ?auto_169136 ) ( CLEAR ?auto_169140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169138 ?auto_169132 ?auto_169133 ?auto_169134 ?auto_169135 ?auto_169136 )
      ( MAKE-4PILE ?auto_169132 ?auto_169133 ?auto_169134 ?auto_169135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169141 - BLOCK
      ?auto_169142 - BLOCK
      ?auto_169143 - BLOCK
      ?auto_169144 - BLOCK
    )
    :vars
    (
      ?auto_169146 - BLOCK
      ?auto_169148 - BLOCK
      ?auto_169149 - BLOCK
      ?auto_169145 - BLOCK
      ?auto_169147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169141 ?auto_169142 ) ) ( not ( = ?auto_169141 ?auto_169143 ) ) ( not ( = ?auto_169141 ?auto_169144 ) ) ( not ( = ?auto_169142 ?auto_169143 ) ) ( not ( = ?auto_169142 ?auto_169144 ) ) ( not ( = ?auto_169143 ?auto_169144 ) ) ( not ( = ?auto_169141 ?auto_169146 ) ) ( not ( = ?auto_169142 ?auto_169146 ) ) ( not ( = ?auto_169143 ?auto_169146 ) ) ( not ( = ?auto_169144 ?auto_169146 ) ) ( ON-TABLE ?auto_169148 ) ( not ( = ?auto_169148 ?auto_169149 ) ) ( not ( = ?auto_169148 ?auto_169145 ) ) ( not ( = ?auto_169148 ?auto_169146 ) ) ( not ( = ?auto_169148 ?auto_169144 ) ) ( not ( = ?auto_169148 ?auto_169143 ) ) ( not ( = ?auto_169149 ?auto_169145 ) ) ( not ( = ?auto_169149 ?auto_169146 ) ) ( not ( = ?auto_169149 ?auto_169144 ) ) ( not ( = ?auto_169149 ?auto_169143 ) ) ( not ( = ?auto_169145 ?auto_169146 ) ) ( not ( = ?auto_169145 ?auto_169144 ) ) ( not ( = ?auto_169145 ?auto_169143 ) ) ( not ( = ?auto_169141 ?auto_169148 ) ) ( not ( = ?auto_169141 ?auto_169149 ) ) ( not ( = ?auto_169141 ?auto_169145 ) ) ( not ( = ?auto_169142 ?auto_169148 ) ) ( not ( = ?auto_169142 ?auto_169149 ) ) ( not ( = ?auto_169142 ?auto_169145 ) ) ( ON ?auto_169141 ?auto_169147 ) ( not ( = ?auto_169141 ?auto_169147 ) ) ( not ( = ?auto_169142 ?auto_169147 ) ) ( not ( = ?auto_169143 ?auto_169147 ) ) ( not ( = ?auto_169144 ?auto_169147 ) ) ( not ( = ?auto_169146 ?auto_169147 ) ) ( not ( = ?auto_169148 ?auto_169147 ) ) ( not ( = ?auto_169149 ?auto_169147 ) ) ( not ( = ?auto_169145 ?auto_169147 ) ) ( ON ?auto_169142 ?auto_169141 ) ( ON-TABLE ?auto_169147 ) ( ON ?auto_169143 ?auto_169142 ) ( ON ?auto_169144 ?auto_169143 ) ( ON ?auto_169146 ?auto_169144 ) ( ON ?auto_169145 ?auto_169146 ) ( CLEAR ?auto_169145 ) ( HOLDING ?auto_169149 ) ( CLEAR ?auto_169148 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169148 ?auto_169149 )
      ( MAKE-4PILE ?auto_169141 ?auto_169142 ?auto_169143 ?auto_169144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169150 - BLOCK
      ?auto_169151 - BLOCK
      ?auto_169152 - BLOCK
      ?auto_169153 - BLOCK
    )
    :vars
    (
      ?auto_169155 - BLOCK
      ?auto_169154 - BLOCK
      ?auto_169157 - BLOCK
      ?auto_169158 - BLOCK
      ?auto_169156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169150 ?auto_169151 ) ) ( not ( = ?auto_169150 ?auto_169152 ) ) ( not ( = ?auto_169150 ?auto_169153 ) ) ( not ( = ?auto_169151 ?auto_169152 ) ) ( not ( = ?auto_169151 ?auto_169153 ) ) ( not ( = ?auto_169152 ?auto_169153 ) ) ( not ( = ?auto_169150 ?auto_169155 ) ) ( not ( = ?auto_169151 ?auto_169155 ) ) ( not ( = ?auto_169152 ?auto_169155 ) ) ( not ( = ?auto_169153 ?auto_169155 ) ) ( ON-TABLE ?auto_169154 ) ( not ( = ?auto_169154 ?auto_169157 ) ) ( not ( = ?auto_169154 ?auto_169158 ) ) ( not ( = ?auto_169154 ?auto_169155 ) ) ( not ( = ?auto_169154 ?auto_169153 ) ) ( not ( = ?auto_169154 ?auto_169152 ) ) ( not ( = ?auto_169157 ?auto_169158 ) ) ( not ( = ?auto_169157 ?auto_169155 ) ) ( not ( = ?auto_169157 ?auto_169153 ) ) ( not ( = ?auto_169157 ?auto_169152 ) ) ( not ( = ?auto_169158 ?auto_169155 ) ) ( not ( = ?auto_169158 ?auto_169153 ) ) ( not ( = ?auto_169158 ?auto_169152 ) ) ( not ( = ?auto_169150 ?auto_169154 ) ) ( not ( = ?auto_169150 ?auto_169157 ) ) ( not ( = ?auto_169150 ?auto_169158 ) ) ( not ( = ?auto_169151 ?auto_169154 ) ) ( not ( = ?auto_169151 ?auto_169157 ) ) ( not ( = ?auto_169151 ?auto_169158 ) ) ( ON ?auto_169150 ?auto_169156 ) ( not ( = ?auto_169150 ?auto_169156 ) ) ( not ( = ?auto_169151 ?auto_169156 ) ) ( not ( = ?auto_169152 ?auto_169156 ) ) ( not ( = ?auto_169153 ?auto_169156 ) ) ( not ( = ?auto_169155 ?auto_169156 ) ) ( not ( = ?auto_169154 ?auto_169156 ) ) ( not ( = ?auto_169157 ?auto_169156 ) ) ( not ( = ?auto_169158 ?auto_169156 ) ) ( ON ?auto_169151 ?auto_169150 ) ( ON-TABLE ?auto_169156 ) ( ON ?auto_169152 ?auto_169151 ) ( ON ?auto_169153 ?auto_169152 ) ( ON ?auto_169155 ?auto_169153 ) ( ON ?auto_169158 ?auto_169155 ) ( CLEAR ?auto_169154 ) ( ON ?auto_169157 ?auto_169158 ) ( CLEAR ?auto_169157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169156 ?auto_169150 ?auto_169151 ?auto_169152 ?auto_169153 ?auto_169155 ?auto_169158 )
      ( MAKE-4PILE ?auto_169150 ?auto_169151 ?auto_169152 ?auto_169153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169159 - BLOCK
      ?auto_169160 - BLOCK
      ?auto_169161 - BLOCK
      ?auto_169162 - BLOCK
    )
    :vars
    (
      ?auto_169163 - BLOCK
      ?auto_169166 - BLOCK
      ?auto_169167 - BLOCK
      ?auto_169164 - BLOCK
      ?auto_169165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169159 ?auto_169160 ) ) ( not ( = ?auto_169159 ?auto_169161 ) ) ( not ( = ?auto_169159 ?auto_169162 ) ) ( not ( = ?auto_169160 ?auto_169161 ) ) ( not ( = ?auto_169160 ?auto_169162 ) ) ( not ( = ?auto_169161 ?auto_169162 ) ) ( not ( = ?auto_169159 ?auto_169163 ) ) ( not ( = ?auto_169160 ?auto_169163 ) ) ( not ( = ?auto_169161 ?auto_169163 ) ) ( not ( = ?auto_169162 ?auto_169163 ) ) ( not ( = ?auto_169166 ?auto_169167 ) ) ( not ( = ?auto_169166 ?auto_169164 ) ) ( not ( = ?auto_169166 ?auto_169163 ) ) ( not ( = ?auto_169166 ?auto_169162 ) ) ( not ( = ?auto_169166 ?auto_169161 ) ) ( not ( = ?auto_169167 ?auto_169164 ) ) ( not ( = ?auto_169167 ?auto_169163 ) ) ( not ( = ?auto_169167 ?auto_169162 ) ) ( not ( = ?auto_169167 ?auto_169161 ) ) ( not ( = ?auto_169164 ?auto_169163 ) ) ( not ( = ?auto_169164 ?auto_169162 ) ) ( not ( = ?auto_169164 ?auto_169161 ) ) ( not ( = ?auto_169159 ?auto_169166 ) ) ( not ( = ?auto_169159 ?auto_169167 ) ) ( not ( = ?auto_169159 ?auto_169164 ) ) ( not ( = ?auto_169160 ?auto_169166 ) ) ( not ( = ?auto_169160 ?auto_169167 ) ) ( not ( = ?auto_169160 ?auto_169164 ) ) ( ON ?auto_169159 ?auto_169165 ) ( not ( = ?auto_169159 ?auto_169165 ) ) ( not ( = ?auto_169160 ?auto_169165 ) ) ( not ( = ?auto_169161 ?auto_169165 ) ) ( not ( = ?auto_169162 ?auto_169165 ) ) ( not ( = ?auto_169163 ?auto_169165 ) ) ( not ( = ?auto_169166 ?auto_169165 ) ) ( not ( = ?auto_169167 ?auto_169165 ) ) ( not ( = ?auto_169164 ?auto_169165 ) ) ( ON ?auto_169160 ?auto_169159 ) ( ON-TABLE ?auto_169165 ) ( ON ?auto_169161 ?auto_169160 ) ( ON ?auto_169162 ?auto_169161 ) ( ON ?auto_169163 ?auto_169162 ) ( ON ?auto_169164 ?auto_169163 ) ( ON ?auto_169167 ?auto_169164 ) ( CLEAR ?auto_169167 ) ( HOLDING ?auto_169166 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169166 )
      ( MAKE-4PILE ?auto_169159 ?auto_169160 ?auto_169161 ?auto_169162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169168 - BLOCK
      ?auto_169169 - BLOCK
      ?auto_169170 - BLOCK
      ?auto_169171 - BLOCK
    )
    :vars
    (
      ?auto_169173 - BLOCK
      ?auto_169175 - BLOCK
      ?auto_169172 - BLOCK
      ?auto_169176 - BLOCK
      ?auto_169174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169168 ?auto_169169 ) ) ( not ( = ?auto_169168 ?auto_169170 ) ) ( not ( = ?auto_169168 ?auto_169171 ) ) ( not ( = ?auto_169169 ?auto_169170 ) ) ( not ( = ?auto_169169 ?auto_169171 ) ) ( not ( = ?auto_169170 ?auto_169171 ) ) ( not ( = ?auto_169168 ?auto_169173 ) ) ( not ( = ?auto_169169 ?auto_169173 ) ) ( not ( = ?auto_169170 ?auto_169173 ) ) ( not ( = ?auto_169171 ?auto_169173 ) ) ( not ( = ?auto_169175 ?auto_169172 ) ) ( not ( = ?auto_169175 ?auto_169176 ) ) ( not ( = ?auto_169175 ?auto_169173 ) ) ( not ( = ?auto_169175 ?auto_169171 ) ) ( not ( = ?auto_169175 ?auto_169170 ) ) ( not ( = ?auto_169172 ?auto_169176 ) ) ( not ( = ?auto_169172 ?auto_169173 ) ) ( not ( = ?auto_169172 ?auto_169171 ) ) ( not ( = ?auto_169172 ?auto_169170 ) ) ( not ( = ?auto_169176 ?auto_169173 ) ) ( not ( = ?auto_169176 ?auto_169171 ) ) ( not ( = ?auto_169176 ?auto_169170 ) ) ( not ( = ?auto_169168 ?auto_169175 ) ) ( not ( = ?auto_169168 ?auto_169172 ) ) ( not ( = ?auto_169168 ?auto_169176 ) ) ( not ( = ?auto_169169 ?auto_169175 ) ) ( not ( = ?auto_169169 ?auto_169172 ) ) ( not ( = ?auto_169169 ?auto_169176 ) ) ( ON ?auto_169168 ?auto_169174 ) ( not ( = ?auto_169168 ?auto_169174 ) ) ( not ( = ?auto_169169 ?auto_169174 ) ) ( not ( = ?auto_169170 ?auto_169174 ) ) ( not ( = ?auto_169171 ?auto_169174 ) ) ( not ( = ?auto_169173 ?auto_169174 ) ) ( not ( = ?auto_169175 ?auto_169174 ) ) ( not ( = ?auto_169172 ?auto_169174 ) ) ( not ( = ?auto_169176 ?auto_169174 ) ) ( ON ?auto_169169 ?auto_169168 ) ( ON-TABLE ?auto_169174 ) ( ON ?auto_169170 ?auto_169169 ) ( ON ?auto_169171 ?auto_169170 ) ( ON ?auto_169173 ?auto_169171 ) ( ON ?auto_169176 ?auto_169173 ) ( ON ?auto_169172 ?auto_169176 ) ( ON ?auto_169175 ?auto_169172 ) ( CLEAR ?auto_169175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169174 ?auto_169168 ?auto_169169 ?auto_169170 ?auto_169171 ?auto_169173 ?auto_169176 ?auto_169172 )
      ( MAKE-4PILE ?auto_169168 ?auto_169169 ?auto_169170 ?auto_169171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169180 - BLOCK
      ?auto_169181 - BLOCK
      ?auto_169182 - BLOCK
    )
    :vars
    (
      ?auto_169183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169183 ?auto_169182 ) ( CLEAR ?auto_169183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169180 ) ( ON ?auto_169181 ?auto_169180 ) ( ON ?auto_169182 ?auto_169181 ) ( not ( = ?auto_169180 ?auto_169181 ) ) ( not ( = ?auto_169180 ?auto_169182 ) ) ( not ( = ?auto_169180 ?auto_169183 ) ) ( not ( = ?auto_169181 ?auto_169182 ) ) ( not ( = ?auto_169181 ?auto_169183 ) ) ( not ( = ?auto_169182 ?auto_169183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169183 ?auto_169182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169184 - BLOCK
      ?auto_169185 - BLOCK
      ?auto_169186 - BLOCK
    )
    :vars
    (
      ?auto_169187 - BLOCK
      ?auto_169188 - BLOCK
      ?auto_169189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169187 ?auto_169186 ) ( CLEAR ?auto_169187 ) ( ON-TABLE ?auto_169184 ) ( ON ?auto_169185 ?auto_169184 ) ( ON ?auto_169186 ?auto_169185 ) ( not ( = ?auto_169184 ?auto_169185 ) ) ( not ( = ?auto_169184 ?auto_169186 ) ) ( not ( = ?auto_169184 ?auto_169187 ) ) ( not ( = ?auto_169185 ?auto_169186 ) ) ( not ( = ?auto_169185 ?auto_169187 ) ) ( not ( = ?auto_169186 ?auto_169187 ) ) ( HOLDING ?auto_169188 ) ( CLEAR ?auto_169189 ) ( not ( = ?auto_169184 ?auto_169188 ) ) ( not ( = ?auto_169184 ?auto_169189 ) ) ( not ( = ?auto_169185 ?auto_169188 ) ) ( not ( = ?auto_169185 ?auto_169189 ) ) ( not ( = ?auto_169186 ?auto_169188 ) ) ( not ( = ?auto_169186 ?auto_169189 ) ) ( not ( = ?auto_169187 ?auto_169188 ) ) ( not ( = ?auto_169187 ?auto_169189 ) ) ( not ( = ?auto_169188 ?auto_169189 ) ) )
    :subtasks
    ( ( !STACK ?auto_169188 ?auto_169189 )
      ( MAKE-3PILE ?auto_169184 ?auto_169185 ?auto_169186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169190 - BLOCK
      ?auto_169191 - BLOCK
      ?auto_169192 - BLOCK
    )
    :vars
    (
      ?auto_169194 - BLOCK
      ?auto_169195 - BLOCK
      ?auto_169193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169194 ?auto_169192 ) ( ON-TABLE ?auto_169190 ) ( ON ?auto_169191 ?auto_169190 ) ( ON ?auto_169192 ?auto_169191 ) ( not ( = ?auto_169190 ?auto_169191 ) ) ( not ( = ?auto_169190 ?auto_169192 ) ) ( not ( = ?auto_169190 ?auto_169194 ) ) ( not ( = ?auto_169191 ?auto_169192 ) ) ( not ( = ?auto_169191 ?auto_169194 ) ) ( not ( = ?auto_169192 ?auto_169194 ) ) ( CLEAR ?auto_169195 ) ( not ( = ?auto_169190 ?auto_169193 ) ) ( not ( = ?auto_169190 ?auto_169195 ) ) ( not ( = ?auto_169191 ?auto_169193 ) ) ( not ( = ?auto_169191 ?auto_169195 ) ) ( not ( = ?auto_169192 ?auto_169193 ) ) ( not ( = ?auto_169192 ?auto_169195 ) ) ( not ( = ?auto_169194 ?auto_169193 ) ) ( not ( = ?auto_169194 ?auto_169195 ) ) ( not ( = ?auto_169193 ?auto_169195 ) ) ( ON ?auto_169193 ?auto_169194 ) ( CLEAR ?auto_169193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169190 ?auto_169191 ?auto_169192 ?auto_169194 )
      ( MAKE-3PILE ?auto_169190 ?auto_169191 ?auto_169192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169196 - BLOCK
      ?auto_169197 - BLOCK
      ?auto_169198 - BLOCK
    )
    :vars
    (
      ?auto_169199 - BLOCK
      ?auto_169200 - BLOCK
      ?auto_169201 - BLOCK
      ?auto_169203 - BLOCK
      ?auto_169202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169199 ?auto_169198 ) ( ON-TABLE ?auto_169196 ) ( ON ?auto_169197 ?auto_169196 ) ( ON ?auto_169198 ?auto_169197 ) ( not ( = ?auto_169196 ?auto_169197 ) ) ( not ( = ?auto_169196 ?auto_169198 ) ) ( not ( = ?auto_169196 ?auto_169199 ) ) ( not ( = ?auto_169197 ?auto_169198 ) ) ( not ( = ?auto_169197 ?auto_169199 ) ) ( not ( = ?auto_169198 ?auto_169199 ) ) ( not ( = ?auto_169196 ?auto_169200 ) ) ( not ( = ?auto_169196 ?auto_169201 ) ) ( not ( = ?auto_169197 ?auto_169200 ) ) ( not ( = ?auto_169197 ?auto_169201 ) ) ( not ( = ?auto_169198 ?auto_169200 ) ) ( not ( = ?auto_169198 ?auto_169201 ) ) ( not ( = ?auto_169199 ?auto_169200 ) ) ( not ( = ?auto_169199 ?auto_169201 ) ) ( not ( = ?auto_169200 ?auto_169201 ) ) ( ON ?auto_169200 ?auto_169199 ) ( CLEAR ?auto_169200 ) ( HOLDING ?auto_169201 ) ( CLEAR ?auto_169203 ) ( ON-TABLE ?auto_169202 ) ( ON ?auto_169203 ?auto_169202 ) ( not ( = ?auto_169202 ?auto_169203 ) ) ( not ( = ?auto_169202 ?auto_169201 ) ) ( not ( = ?auto_169203 ?auto_169201 ) ) ( not ( = ?auto_169196 ?auto_169203 ) ) ( not ( = ?auto_169196 ?auto_169202 ) ) ( not ( = ?auto_169197 ?auto_169203 ) ) ( not ( = ?auto_169197 ?auto_169202 ) ) ( not ( = ?auto_169198 ?auto_169203 ) ) ( not ( = ?auto_169198 ?auto_169202 ) ) ( not ( = ?auto_169199 ?auto_169203 ) ) ( not ( = ?auto_169199 ?auto_169202 ) ) ( not ( = ?auto_169200 ?auto_169203 ) ) ( not ( = ?auto_169200 ?auto_169202 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169202 ?auto_169203 ?auto_169201 )
      ( MAKE-3PILE ?auto_169196 ?auto_169197 ?auto_169198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169204 - BLOCK
      ?auto_169205 - BLOCK
      ?auto_169206 - BLOCK
    )
    :vars
    (
      ?auto_169211 - BLOCK
      ?auto_169207 - BLOCK
      ?auto_169210 - BLOCK
      ?auto_169208 - BLOCK
      ?auto_169209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169211 ?auto_169206 ) ( ON-TABLE ?auto_169204 ) ( ON ?auto_169205 ?auto_169204 ) ( ON ?auto_169206 ?auto_169205 ) ( not ( = ?auto_169204 ?auto_169205 ) ) ( not ( = ?auto_169204 ?auto_169206 ) ) ( not ( = ?auto_169204 ?auto_169211 ) ) ( not ( = ?auto_169205 ?auto_169206 ) ) ( not ( = ?auto_169205 ?auto_169211 ) ) ( not ( = ?auto_169206 ?auto_169211 ) ) ( not ( = ?auto_169204 ?auto_169207 ) ) ( not ( = ?auto_169204 ?auto_169210 ) ) ( not ( = ?auto_169205 ?auto_169207 ) ) ( not ( = ?auto_169205 ?auto_169210 ) ) ( not ( = ?auto_169206 ?auto_169207 ) ) ( not ( = ?auto_169206 ?auto_169210 ) ) ( not ( = ?auto_169211 ?auto_169207 ) ) ( not ( = ?auto_169211 ?auto_169210 ) ) ( not ( = ?auto_169207 ?auto_169210 ) ) ( ON ?auto_169207 ?auto_169211 ) ( CLEAR ?auto_169208 ) ( ON-TABLE ?auto_169209 ) ( ON ?auto_169208 ?auto_169209 ) ( not ( = ?auto_169209 ?auto_169208 ) ) ( not ( = ?auto_169209 ?auto_169210 ) ) ( not ( = ?auto_169208 ?auto_169210 ) ) ( not ( = ?auto_169204 ?auto_169208 ) ) ( not ( = ?auto_169204 ?auto_169209 ) ) ( not ( = ?auto_169205 ?auto_169208 ) ) ( not ( = ?auto_169205 ?auto_169209 ) ) ( not ( = ?auto_169206 ?auto_169208 ) ) ( not ( = ?auto_169206 ?auto_169209 ) ) ( not ( = ?auto_169211 ?auto_169208 ) ) ( not ( = ?auto_169211 ?auto_169209 ) ) ( not ( = ?auto_169207 ?auto_169208 ) ) ( not ( = ?auto_169207 ?auto_169209 ) ) ( ON ?auto_169210 ?auto_169207 ) ( CLEAR ?auto_169210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169204 ?auto_169205 ?auto_169206 ?auto_169211 ?auto_169207 )
      ( MAKE-3PILE ?auto_169204 ?auto_169205 ?auto_169206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169212 - BLOCK
      ?auto_169213 - BLOCK
      ?auto_169214 - BLOCK
    )
    :vars
    (
      ?auto_169218 - BLOCK
      ?auto_169219 - BLOCK
      ?auto_169217 - BLOCK
      ?auto_169215 - BLOCK
      ?auto_169216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169218 ?auto_169214 ) ( ON-TABLE ?auto_169212 ) ( ON ?auto_169213 ?auto_169212 ) ( ON ?auto_169214 ?auto_169213 ) ( not ( = ?auto_169212 ?auto_169213 ) ) ( not ( = ?auto_169212 ?auto_169214 ) ) ( not ( = ?auto_169212 ?auto_169218 ) ) ( not ( = ?auto_169213 ?auto_169214 ) ) ( not ( = ?auto_169213 ?auto_169218 ) ) ( not ( = ?auto_169214 ?auto_169218 ) ) ( not ( = ?auto_169212 ?auto_169219 ) ) ( not ( = ?auto_169212 ?auto_169217 ) ) ( not ( = ?auto_169213 ?auto_169219 ) ) ( not ( = ?auto_169213 ?auto_169217 ) ) ( not ( = ?auto_169214 ?auto_169219 ) ) ( not ( = ?auto_169214 ?auto_169217 ) ) ( not ( = ?auto_169218 ?auto_169219 ) ) ( not ( = ?auto_169218 ?auto_169217 ) ) ( not ( = ?auto_169219 ?auto_169217 ) ) ( ON ?auto_169219 ?auto_169218 ) ( ON-TABLE ?auto_169215 ) ( not ( = ?auto_169215 ?auto_169216 ) ) ( not ( = ?auto_169215 ?auto_169217 ) ) ( not ( = ?auto_169216 ?auto_169217 ) ) ( not ( = ?auto_169212 ?auto_169216 ) ) ( not ( = ?auto_169212 ?auto_169215 ) ) ( not ( = ?auto_169213 ?auto_169216 ) ) ( not ( = ?auto_169213 ?auto_169215 ) ) ( not ( = ?auto_169214 ?auto_169216 ) ) ( not ( = ?auto_169214 ?auto_169215 ) ) ( not ( = ?auto_169218 ?auto_169216 ) ) ( not ( = ?auto_169218 ?auto_169215 ) ) ( not ( = ?auto_169219 ?auto_169216 ) ) ( not ( = ?auto_169219 ?auto_169215 ) ) ( ON ?auto_169217 ?auto_169219 ) ( CLEAR ?auto_169217 ) ( HOLDING ?auto_169216 ) ( CLEAR ?auto_169215 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169215 ?auto_169216 )
      ( MAKE-3PILE ?auto_169212 ?auto_169213 ?auto_169214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169220 - BLOCK
      ?auto_169221 - BLOCK
      ?auto_169222 - BLOCK
    )
    :vars
    (
      ?auto_169225 - BLOCK
      ?auto_169227 - BLOCK
      ?auto_169226 - BLOCK
      ?auto_169224 - BLOCK
      ?auto_169223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169225 ?auto_169222 ) ( ON-TABLE ?auto_169220 ) ( ON ?auto_169221 ?auto_169220 ) ( ON ?auto_169222 ?auto_169221 ) ( not ( = ?auto_169220 ?auto_169221 ) ) ( not ( = ?auto_169220 ?auto_169222 ) ) ( not ( = ?auto_169220 ?auto_169225 ) ) ( not ( = ?auto_169221 ?auto_169222 ) ) ( not ( = ?auto_169221 ?auto_169225 ) ) ( not ( = ?auto_169222 ?auto_169225 ) ) ( not ( = ?auto_169220 ?auto_169227 ) ) ( not ( = ?auto_169220 ?auto_169226 ) ) ( not ( = ?auto_169221 ?auto_169227 ) ) ( not ( = ?auto_169221 ?auto_169226 ) ) ( not ( = ?auto_169222 ?auto_169227 ) ) ( not ( = ?auto_169222 ?auto_169226 ) ) ( not ( = ?auto_169225 ?auto_169227 ) ) ( not ( = ?auto_169225 ?auto_169226 ) ) ( not ( = ?auto_169227 ?auto_169226 ) ) ( ON ?auto_169227 ?auto_169225 ) ( ON-TABLE ?auto_169224 ) ( not ( = ?auto_169224 ?auto_169223 ) ) ( not ( = ?auto_169224 ?auto_169226 ) ) ( not ( = ?auto_169223 ?auto_169226 ) ) ( not ( = ?auto_169220 ?auto_169223 ) ) ( not ( = ?auto_169220 ?auto_169224 ) ) ( not ( = ?auto_169221 ?auto_169223 ) ) ( not ( = ?auto_169221 ?auto_169224 ) ) ( not ( = ?auto_169222 ?auto_169223 ) ) ( not ( = ?auto_169222 ?auto_169224 ) ) ( not ( = ?auto_169225 ?auto_169223 ) ) ( not ( = ?auto_169225 ?auto_169224 ) ) ( not ( = ?auto_169227 ?auto_169223 ) ) ( not ( = ?auto_169227 ?auto_169224 ) ) ( ON ?auto_169226 ?auto_169227 ) ( CLEAR ?auto_169224 ) ( ON ?auto_169223 ?auto_169226 ) ( CLEAR ?auto_169223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169220 ?auto_169221 ?auto_169222 ?auto_169225 ?auto_169227 ?auto_169226 )
      ( MAKE-3PILE ?auto_169220 ?auto_169221 ?auto_169222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169228 - BLOCK
      ?auto_169229 - BLOCK
      ?auto_169230 - BLOCK
    )
    :vars
    (
      ?auto_169233 - BLOCK
      ?auto_169234 - BLOCK
      ?auto_169232 - BLOCK
      ?auto_169231 - BLOCK
      ?auto_169235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169233 ?auto_169230 ) ( ON-TABLE ?auto_169228 ) ( ON ?auto_169229 ?auto_169228 ) ( ON ?auto_169230 ?auto_169229 ) ( not ( = ?auto_169228 ?auto_169229 ) ) ( not ( = ?auto_169228 ?auto_169230 ) ) ( not ( = ?auto_169228 ?auto_169233 ) ) ( not ( = ?auto_169229 ?auto_169230 ) ) ( not ( = ?auto_169229 ?auto_169233 ) ) ( not ( = ?auto_169230 ?auto_169233 ) ) ( not ( = ?auto_169228 ?auto_169234 ) ) ( not ( = ?auto_169228 ?auto_169232 ) ) ( not ( = ?auto_169229 ?auto_169234 ) ) ( not ( = ?auto_169229 ?auto_169232 ) ) ( not ( = ?auto_169230 ?auto_169234 ) ) ( not ( = ?auto_169230 ?auto_169232 ) ) ( not ( = ?auto_169233 ?auto_169234 ) ) ( not ( = ?auto_169233 ?auto_169232 ) ) ( not ( = ?auto_169234 ?auto_169232 ) ) ( ON ?auto_169234 ?auto_169233 ) ( not ( = ?auto_169231 ?auto_169235 ) ) ( not ( = ?auto_169231 ?auto_169232 ) ) ( not ( = ?auto_169235 ?auto_169232 ) ) ( not ( = ?auto_169228 ?auto_169235 ) ) ( not ( = ?auto_169228 ?auto_169231 ) ) ( not ( = ?auto_169229 ?auto_169235 ) ) ( not ( = ?auto_169229 ?auto_169231 ) ) ( not ( = ?auto_169230 ?auto_169235 ) ) ( not ( = ?auto_169230 ?auto_169231 ) ) ( not ( = ?auto_169233 ?auto_169235 ) ) ( not ( = ?auto_169233 ?auto_169231 ) ) ( not ( = ?auto_169234 ?auto_169235 ) ) ( not ( = ?auto_169234 ?auto_169231 ) ) ( ON ?auto_169232 ?auto_169234 ) ( ON ?auto_169235 ?auto_169232 ) ( CLEAR ?auto_169235 ) ( HOLDING ?auto_169231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169231 )
      ( MAKE-3PILE ?auto_169228 ?auto_169229 ?auto_169230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169236 - BLOCK
      ?auto_169237 - BLOCK
      ?auto_169238 - BLOCK
    )
    :vars
    (
      ?auto_169242 - BLOCK
      ?auto_169240 - BLOCK
      ?auto_169241 - BLOCK
      ?auto_169239 - BLOCK
      ?auto_169243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169242 ?auto_169238 ) ( ON-TABLE ?auto_169236 ) ( ON ?auto_169237 ?auto_169236 ) ( ON ?auto_169238 ?auto_169237 ) ( not ( = ?auto_169236 ?auto_169237 ) ) ( not ( = ?auto_169236 ?auto_169238 ) ) ( not ( = ?auto_169236 ?auto_169242 ) ) ( not ( = ?auto_169237 ?auto_169238 ) ) ( not ( = ?auto_169237 ?auto_169242 ) ) ( not ( = ?auto_169238 ?auto_169242 ) ) ( not ( = ?auto_169236 ?auto_169240 ) ) ( not ( = ?auto_169236 ?auto_169241 ) ) ( not ( = ?auto_169237 ?auto_169240 ) ) ( not ( = ?auto_169237 ?auto_169241 ) ) ( not ( = ?auto_169238 ?auto_169240 ) ) ( not ( = ?auto_169238 ?auto_169241 ) ) ( not ( = ?auto_169242 ?auto_169240 ) ) ( not ( = ?auto_169242 ?auto_169241 ) ) ( not ( = ?auto_169240 ?auto_169241 ) ) ( ON ?auto_169240 ?auto_169242 ) ( not ( = ?auto_169239 ?auto_169243 ) ) ( not ( = ?auto_169239 ?auto_169241 ) ) ( not ( = ?auto_169243 ?auto_169241 ) ) ( not ( = ?auto_169236 ?auto_169243 ) ) ( not ( = ?auto_169236 ?auto_169239 ) ) ( not ( = ?auto_169237 ?auto_169243 ) ) ( not ( = ?auto_169237 ?auto_169239 ) ) ( not ( = ?auto_169238 ?auto_169243 ) ) ( not ( = ?auto_169238 ?auto_169239 ) ) ( not ( = ?auto_169242 ?auto_169243 ) ) ( not ( = ?auto_169242 ?auto_169239 ) ) ( not ( = ?auto_169240 ?auto_169243 ) ) ( not ( = ?auto_169240 ?auto_169239 ) ) ( ON ?auto_169241 ?auto_169240 ) ( ON ?auto_169243 ?auto_169241 ) ( ON ?auto_169239 ?auto_169243 ) ( CLEAR ?auto_169239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169236 ?auto_169237 ?auto_169238 ?auto_169242 ?auto_169240 ?auto_169241 ?auto_169243 )
      ( MAKE-3PILE ?auto_169236 ?auto_169237 ?auto_169238 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169244 - BLOCK
      ?auto_169245 - BLOCK
      ?auto_169246 - BLOCK
    )
    :vars
    (
      ?auto_169247 - BLOCK
      ?auto_169251 - BLOCK
      ?auto_169248 - BLOCK
      ?auto_169249 - BLOCK
      ?auto_169250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169247 ?auto_169246 ) ( ON-TABLE ?auto_169244 ) ( ON ?auto_169245 ?auto_169244 ) ( ON ?auto_169246 ?auto_169245 ) ( not ( = ?auto_169244 ?auto_169245 ) ) ( not ( = ?auto_169244 ?auto_169246 ) ) ( not ( = ?auto_169244 ?auto_169247 ) ) ( not ( = ?auto_169245 ?auto_169246 ) ) ( not ( = ?auto_169245 ?auto_169247 ) ) ( not ( = ?auto_169246 ?auto_169247 ) ) ( not ( = ?auto_169244 ?auto_169251 ) ) ( not ( = ?auto_169244 ?auto_169248 ) ) ( not ( = ?auto_169245 ?auto_169251 ) ) ( not ( = ?auto_169245 ?auto_169248 ) ) ( not ( = ?auto_169246 ?auto_169251 ) ) ( not ( = ?auto_169246 ?auto_169248 ) ) ( not ( = ?auto_169247 ?auto_169251 ) ) ( not ( = ?auto_169247 ?auto_169248 ) ) ( not ( = ?auto_169251 ?auto_169248 ) ) ( ON ?auto_169251 ?auto_169247 ) ( not ( = ?auto_169249 ?auto_169250 ) ) ( not ( = ?auto_169249 ?auto_169248 ) ) ( not ( = ?auto_169250 ?auto_169248 ) ) ( not ( = ?auto_169244 ?auto_169250 ) ) ( not ( = ?auto_169244 ?auto_169249 ) ) ( not ( = ?auto_169245 ?auto_169250 ) ) ( not ( = ?auto_169245 ?auto_169249 ) ) ( not ( = ?auto_169246 ?auto_169250 ) ) ( not ( = ?auto_169246 ?auto_169249 ) ) ( not ( = ?auto_169247 ?auto_169250 ) ) ( not ( = ?auto_169247 ?auto_169249 ) ) ( not ( = ?auto_169251 ?auto_169250 ) ) ( not ( = ?auto_169251 ?auto_169249 ) ) ( ON ?auto_169248 ?auto_169251 ) ( ON ?auto_169250 ?auto_169248 ) ( HOLDING ?auto_169249 ) ( CLEAR ?auto_169250 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169244 ?auto_169245 ?auto_169246 ?auto_169247 ?auto_169251 ?auto_169248 ?auto_169250 ?auto_169249 )
      ( MAKE-3PILE ?auto_169244 ?auto_169245 ?auto_169246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169252 - BLOCK
      ?auto_169253 - BLOCK
      ?auto_169254 - BLOCK
    )
    :vars
    (
      ?auto_169257 - BLOCK
      ?auto_169256 - BLOCK
      ?auto_169259 - BLOCK
      ?auto_169258 - BLOCK
      ?auto_169255 - BLOCK
      ?auto_169260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169257 ?auto_169254 ) ( ON-TABLE ?auto_169252 ) ( ON ?auto_169253 ?auto_169252 ) ( ON ?auto_169254 ?auto_169253 ) ( not ( = ?auto_169252 ?auto_169253 ) ) ( not ( = ?auto_169252 ?auto_169254 ) ) ( not ( = ?auto_169252 ?auto_169257 ) ) ( not ( = ?auto_169253 ?auto_169254 ) ) ( not ( = ?auto_169253 ?auto_169257 ) ) ( not ( = ?auto_169254 ?auto_169257 ) ) ( not ( = ?auto_169252 ?auto_169256 ) ) ( not ( = ?auto_169252 ?auto_169259 ) ) ( not ( = ?auto_169253 ?auto_169256 ) ) ( not ( = ?auto_169253 ?auto_169259 ) ) ( not ( = ?auto_169254 ?auto_169256 ) ) ( not ( = ?auto_169254 ?auto_169259 ) ) ( not ( = ?auto_169257 ?auto_169256 ) ) ( not ( = ?auto_169257 ?auto_169259 ) ) ( not ( = ?auto_169256 ?auto_169259 ) ) ( ON ?auto_169256 ?auto_169257 ) ( not ( = ?auto_169258 ?auto_169255 ) ) ( not ( = ?auto_169258 ?auto_169259 ) ) ( not ( = ?auto_169255 ?auto_169259 ) ) ( not ( = ?auto_169252 ?auto_169255 ) ) ( not ( = ?auto_169252 ?auto_169258 ) ) ( not ( = ?auto_169253 ?auto_169255 ) ) ( not ( = ?auto_169253 ?auto_169258 ) ) ( not ( = ?auto_169254 ?auto_169255 ) ) ( not ( = ?auto_169254 ?auto_169258 ) ) ( not ( = ?auto_169257 ?auto_169255 ) ) ( not ( = ?auto_169257 ?auto_169258 ) ) ( not ( = ?auto_169256 ?auto_169255 ) ) ( not ( = ?auto_169256 ?auto_169258 ) ) ( ON ?auto_169259 ?auto_169256 ) ( ON ?auto_169255 ?auto_169259 ) ( CLEAR ?auto_169255 ) ( ON ?auto_169258 ?auto_169260 ) ( CLEAR ?auto_169258 ) ( HAND-EMPTY ) ( not ( = ?auto_169252 ?auto_169260 ) ) ( not ( = ?auto_169253 ?auto_169260 ) ) ( not ( = ?auto_169254 ?auto_169260 ) ) ( not ( = ?auto_169257 ?auto_169260 ) ) ( not ( = ?auto_169256 ?auto_169260 ) ) ( not ( = ?auto_169259 ?auto_169260 ) ) ( not ( = ?auto_169258 ?auto_169260 ) ) ( not ( = ?auto_169255 ?auto_169260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169258 ?auto_169260 )
      ( MAKE-3PILE ?auto_169252 ?auto_169253 ?auto_169254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169261 - BLOCK
      ?auto_169262 - BLOCK
      ?auto_169263 - BLOCK
    )
    :vars
    (
      ?auto_169266 - BLOCK
      ?auto_169269 - BLOCK
      ?auto_169265 - BLOCK
      ?auto_169264 - BLOCK
      ?auto_169267 - BLOCK
      ?auto_169268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169266 ?auto_169263 ) ( ON-TABLE ?auto_169261 ) ( ON ?auto_169262 ?auto_169261 ) ( ON ?auto_169263 ?auto_169262 ) ( not ( = ?auto_169261 ?auto_169262 ) ) ( not ( = ?auto_169261 ?auto_169263 ) ) ( not ( = ?auto_169261 ?auto_169266 ) ) ( not ( = ?auto_169262 ?auto_169263 ) ) ( not ( = ?auto_169262 ?auto_169266 ) ) ( not ( = ?auto_169263 ?auto_169266 ) ) ( not ( = ?auto_169261 ?auto_169269 ) ) ( not ( = ?auto_169261 ?auto_169265 ) ) ( not ( = ?auto_169262 ?auto_169269 ) ) ( not ( = ?auto_169262 ?auto_169265 ) ) ( not ( = ?auto_169263 ?auto_169269 ) ) ( not ( = ?auto_169263 ?auto_169265 ) ) ( not ( = ?auto_169266 ?auto_169269 ) ) ( not ( = ?auto_169266 ?auto_169265 ) ) ( not ( = ?auto_169269 ?auto_169265 ) ) ( ON ?auto_169269 ?auto_169266 ) ( not ( = ?auto_169264 ?auto_169267 ) ) ( not ( = ?auto_169264 ?auto_169265 ) ) ( not ( = ?auto_169267 ?auto_169265 ) ) ( not ( = ?auto_169261 ?auto_169267 ) ) ( not ( = ?auto_169261 ?auto_169264 ) ) ( not ( = ?auto_169262 ?auto_169267 ) ) ( not ( = ?auto_169262 ?auto_169264 ) ) ( not ( = ?auto_169263 ?auto_169267 ) ) ( not ( = ?auto_169263 ?auto_169264 ) ) ( not ( = ?auto_169266 ?auto_169267 ) ) ( not ( = ?auto_169266 ?auto_169264 ) ) ( not ( = ?auto_169269 ?auto_169267 ) ) ( not ( = ?auto_169269 ?auto_169264 ) ) ( ON ?auto_169265 ?auto_169269 ) ( ON ?auto_169264 ?auto_169268 ) ( CLEAR ?auto_169264 ) ( not ( = ?auto_169261 ?auto_169268 ) ) ( not ( = ?auto_169262 ?auto_169268 ) ) ( not ( = ?auto_169263 ?auto_169268 ) ) ( not ( = ?auto_169266 ?auto_169268 ) ) ( not ( = ?auto_169269 ?auto_169268 ) ) ( not ( = ?auto_169265 ?auto_169268 ) ) ( not ( = ?auto_169264 ?auto_169268 ) ) ( not ( = ?auto_169267 ?auto_169268 ) ) ( HOLDING ?auto_169267 ) ( CLEAR ?auto_169265 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169261 ?auto_169262 ?auto_169263 ?auto_169266 ?auto_169269 ?auto_169265 ?auto_169267 )
      ( MAKE-3PILE ?auto_169261 ?auto_169262 ?auto_169263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169270 - BLOCK
      ?auto_169271 - BLOCK
      ?auto_169272 - BLOCK
    )
    :vars
    (
      ?auto_169276 - BLOCK
      ?auto_169275 - BLOCK
      ?auto_169277 - BLOCK
      ?auto_169273 - BLOCK
      ?auto_169278 - BLOCK
      ?auto_169274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169276 ?auto_169272 ) ( ON-TABLE ?auto_169270 ) ( ON ?auto_169271 ?auto_169270 ) ( ON ?auto_169272 ?auto_169271 ) ( not ( = ?auto_169270 ?auto_169271 ) ) ( not ( = ?auto_169270 ?auto_169272 ) ) ( not ( = ?auto_169270 ?auto_169276 ) ) ( not ( = ?auto_169271 ?auto_169272 ) ) ( not ( = ?auto_169271 ?auto_169276 ) ) ( not ( = ?auto_169272 ?auto_169276 ) ) ( not ( = ?auto_169270 ?auto_169275 ) ) ( not ( = ?auto_169270 ?auto_169277 ) ) ( not ( = ?auto_169271 ?auto_169275 ) ) ( not ( = ?auto_169271 ?auto_169277 ) ) ( not ( = ?auto_169272 ?auto_169275 ) ) ( not ( = ?auto_169272 ?auto_169277 ) ) ( not ( = ?auto_169276 ?auto_169275 ) ) ( not ( = ?auto_169276 ?auto_169277 ) ) ( not ( = ?auto_169275 ?auto_169277 ) ) ( ON ?auto_169275 ?auto_169276 ) ( not ( = ?auto_169273 ?auto_169278 ) ) ( not ( = ?auto_169273 ?auto_169277 ) ) ( not ( = ?auto_169278 ?auto_169277 ) ) ( not ( = ?auto_169270 ?auto_169278 ) ) ( not ( = ?auto_169270 ?auto_169273 ) ) ( not ( = ?auto_169271 ?auto_169278 ) ) ( not ( = ?auto_169271 ?auto_169273 ) ) ( not ( = ?auto_169272 ?auto_169278 ) ) ( not ( = ?auto_169272 ?auto_169273 ) ) ( not ( = ?auto_169276 ?auto_169278 ) ) ( not ( = ?auto_169276 ?auto_169273 ) ) ( not ( = ?auto_169275 ?auto_169278 ) ) ( not ( = ?auto_169275 ?auto_169273 ) ) ( ON ?auto_169277 ?auto_169275 ) ( ON ?auto_169273 ?auto_169274 ) ( not ( = ?auto_169270 ?auto_169274 ) ) ( not ( = ?auto_169271 ?auto_169274 ) ) ( not ( = ?auto_169272 ?auto_169274 ) ) ( not ( = ?auto_169276 ?auto_169274 ) ) ( not ( = ?auto_169275 ?auto_169274 ) ) ( not ( = ?auto_169277 ?auto_169274 ) ) ( not ( = ?auto_169273 ?auto_169274 ) ) ( not ( = ?auto_169278 ?auto_169274 ) ) ( CLEAR ?auto_169277 ) ( ON ?auto_169278 ?auto_169273 ) ( CLEAR ?auto_169278 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169274 ?auto_169273 )
      ( MAKE-3PILE ?auto_169270 ?auto_169271 ?auto_169272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169279 - BLOCK
      ?auto_169280 - BLOCK
      ?auto_169281 - BLOCK
    )
    :vars
    (
      ?auto_169285 - BLOCK
      ?auto_169284 - BLOCK
      ?auto_169287 - BLOCK
      ?auto_169283 - BLOCK
      ?auto_169282 - BLOCK
      ?auto_169286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169285 ?auto_169281 ) ( ON-TABLE ?auto_169279 ) ( ON ?auto_169280 ?auto_169279 ) ( ON ?auto_169281 ?auto_169280 ) ( not ( = ?auto_169279 ?auto_169280 ) ) ( not ( = ?auto_169279 ?auto_169281 ) ) ( not ( = ?auto_169279 ?auto_169285 ) ) ( not ( = ?auto_169280 ?auto_169281 ) ) ( not ( = ?auto_169280 ?auto_169285 ) ) ( not ( = ?auto_169281 ?auto_169285 ) ) ( not ( = ?auto_169279 ?auto_169284 ) ) ( not ( = ?auto_169279 ?auto_169287 ) ) ( not ( = ?auto_169280 ?auto_169284 ) ) ( not ( = ?auto_169280 ?auto_169287 ) ) ( not ( = ?auto_169281 ?auto_169284 ) ) ( not ( = ?auto_169281 ?auto_169287 ) ) ( not ( = ?auto_169285 ?auto_169284 ) ) ( not ( = ?auto_169285 ?auto_169287 ) ) ( not ( = ?auto_169284 ?auto_169287 ) ) ( ON ?auto_169284 ?auto_169285 ) ( not ( = ?auto_169283 ?auto_169282 ) ) ( not ( = ?auto_169283 ?auto_169287 ) ) ( not ( = ?auto_169282 ?auto_169287 ) ) ( not ( = ?auto_169279 ?auto_169282 ) ) ( not ( = ?auto_169279 ?auto_169283 ) ) ( not ( = ?auto_169280 ?auto_169282 ) ) ( not ( = ?auto_169280 ?auto_169283 ) ) ( not ( = ?auto_169281 ?auto_169282 ) ) ( not ( = ?auto_169281 ?auto_169283 ) ) ( not ( = ?auto_169285 ?auto_169282 ) ) ( not ( = ?auto_169285 ?auto_169283 ) ) ( not ( = ?auto_169284 ?auto_169282 ) ) ( not ( = ?auto_169284 ?auto_169283 ) ) ( ON ?auto_169283 ?auto_169286 ) ( not ( = ?auto_169279 ?auto_169286 ) ) ( not ( = ?auto_169280 ?auto_169286 ) ) ( not ( = ?auto_169281 ?auto_169286 ) ) ( not ( = ?auto_169285 ?auto_169286 ) ) ( not ( = ?auto_169284 ?auto_169286 ) ) ( not ( = ?auto_169287 ?auto_169286 ) ) ( not ( = ?auto_169283 ?auto_169286 ) ) ( not ( = ?auto_169282 ?auto_169286 ) ) ( ON ?auto_169282 ?auto_169283 ) ( CLEAR ?auto_169282 ) ( ON-TABLE ?auto_169286 ) ( HOLDING ?auto_169287 ) ( CLEAR ?auto_169284 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169279 ?auto_169280 ?auto_169281 ?auto_169285 ?auto_169284 ?auto_169287 )
      ( MAKE-3PILE ?auto_169279 ?auto_169280 ?auto_169281 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169288 - BLOCK
      ?auto_169289 - BLOCK
      ?auto_169290 - BLOCK
    )
    :vars
    (
      ?auto_169294 - BLOCK
      ?auto_169293 - BLOCK
      ?auto_169295 - BLOCK
      ?auto_169292 - BLOCK
      ?auto_169291 - BLOCK
      ?auto_169296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169294 ?auto_169290 ) ( ON-TABLE ?auto_169288 ) ( ON ?auto_169289 ?auto_169288 ) ( ON ?auto_169290 ?auto_169289 ) ( not ( = ?auto_169288 ?auto_169289 ) ) ( not ( = ?auto_169288 ?auto_169290 ) ) ( not ( = ?auto_169288 ?auto_169294 ) ) ( not ( = ?auto_169289 ?auto_169290 ) ) ( not ( = ?auto_169289 ?auto_169294 ) ) ( not ( = ?auto_169290 ?auto_169294 ) ) ( not ( = ?auto_169288 ?auto_169293 ) ) ( not ( = ?auto_169288 ?auto_169295 ) ) ( not ( = ?auto_169289 ?auto_169293 ) ) ( not ( = ?auto_169289 ?auto_169295 ) ) ( not ( = ?auto_169290 ?auto_169293 ) ) ( not ( = ?auto_169290 ?auto_169295 ) ) ( not ( = ?auto_169294 ?auto_169293 ) ) ( not ( = ?auto_169294 ?auto_169295 ) ) ( not ( = ?auto_169293 ?auto_169295 ) ) ( ON ?auto_169293 ?auto_169294 ) ( not ( = ?auto_169292 ?auto_169291 ) ) ( not ( = ?auto_169292 ?auto_169295 ) ) ( not ( = ?auto_169291 ?auto_169295 ) ) ( not ( = ?auto_169288 ?auto_169291 ) ) ( not ( = ?auto_169288 ?auto_169292 ) ) ( not ( = ?auto_169289 ?auto_169291 ) ) ( not ( = ?auto_169289 ?auto_169292 ) ) ( not ( = ?auto_169290 ?auto_169291 ) ) ( not ( = ?auto_169290 ?auto_169292 ) ) ( not ( = ?auto_169294 ?auto_169291 ) ) ( not ( = ?auto_169294 ?auto_169292 ) ) ( not ( = ?auto_169293 ?auto_169291 ) ) ( not ( = ?auto_169293 ?auto_169292 ) ) ( ON ?auto_169292 ?auto_169296 ) ( not ( = ?auto_169288 ?auto_169296 ) ) ( not ( = ?auto_169289 ?auto_169296 ) ) ( not ( = ?auto_169290 ?auto_169296 ) ) ( not ( = ?auto_169294 ?auto_169296 ) ) ( not ( = ?auto_169293 ?auto_169296 ) ) ( not ( = ?auto_169295 ?auto_169296 ) ) ( not ( = ?auto_169292 ?auto_169296 ) ) ( not ( = ?auto_169291 ?auto_169296 ) ) ( ON ?auto_169291 ?auto_169292 ) ( ON-TABLE ?auto_169296 ) ( CLEAR ?auto_169293 ) ( ON ?auto_169295 ?auto_169291 ) ( CLEAR ?auto_169295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169296 ?auto_169292 ?auto_169291 )
      ( MAKE-3PILE ?auto_169288 ?auto_169289 ?auto_169290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169297 - BLOCK
      ?auto_169298 - BLOCK
      ?auto_169299 - BLOCK
    )
    :vars
    (
      ?auto_169304 - BLOCK
      ?auto_169303 - BLOCK
      ?auto_169301 - BLOCK
      ?auto_169300 - BLOCK
      ?auto_169302 - BLOCK
      ?auto_169305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169304 ?auto_169299 ) ( ON-TABLE ?auto_169297 ) ( ON ?auto_169298 ?auto_169297 ) ( ON ?auto_169299 ?auto_169298 ) ( not ( = ?auto_169297 ?auto_169298 ) ) ( not ( = ?auto_169297 ?auto_169299 ) ) ( not ( = ?auto_169297 ?auto_169304 ) ) ( not ( = ?auto_169298 ?auto_169299 ) ) ( not ( = ?auto_169298 ?auto_169304 ) ) ( not ( = ?auto_169299 ?auto_169304 ) ) ( not ( = ?auto_169297 ?auto_169303 ) ) ( not ( = ?auto_169297 ?auto_169301 ) ) ( not ( = ?auto_169298 ?auto_169303 ) ) ( not ( = ?auto_169298 ?auto_169301 ) ) ( not ( = ?auto_169299 ?auto_169303 ) ) ( not ( = ?auto_169299 ?auto_169301 ) ) ( not ( = ?auto_169304 ?auto_169303 ) ) ( not ( = ?auto_169304 ?auto_169301 ) ) ( not ( = ?auto_169303 ?auto_169301 ) ) ( not ( = ?auto_169300 ?auto_169302 ) ) ( not ( = ?auto_169300 ?auto_169301 ) ) ( not ( = ?auto_169302 ?auto_169301 ) ) ( not ( = ?auto_169297 ?auto_169302 ) ) ( not ( = ?auto_169297 ?auto_169300 ) ) ( not ( = ?auto_169298 ?auto_169302 ) ) ( not ( = ?auto_169298 ?auto_169300 ) ) ( not ( = ?auto_169299 ?auto_169302 ) ) ( not ( = ?auto_169299 ?auto_169300 ) ) ( not ( = ?auto_169304 ?auto_169302 ) ) ( not ( = ?auto_169304 ?auto_169300 ) ) ( not ( = ?auto_169303 ?auto_169302 ) ) ( not ( = ?auto_169303 ?auto_169300 ) ) ( ON ?auto_169300 ?auto_169305 ) ( not ( = ?auto_169297 ?auto_169305 ) ) ( not ( = ?auto_169298 ?auto_169305 ) ) ( not ( = ?auto_169299 ?auto_169305 ) ) ( not ( = ?auto_169304 ?auto_169305 ) ) ( not ( = ?auto_169303 ?auto_169305 ) ) ( not ( = ?auto_169301 ?auto_169305 ) ) ( not ( = ?auto_169300 ?auto_169305 ) ) ( not ( = ?auto_169302 ?auto_169305 ) ) ( ON ?auto_169302 ?auto_169300 ) ( ON-TABLE ?auto_169305 ) ( ON ?auto_169301 ?auto_169302 ) ( CLEAR ?auto_169301 ) ( HOLDING ?auto_169303 ) ( CLEAR ?auto_169304 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169297 ?auto_169298 ?auto_169299 ?auto_169304 ?auto_169303 )
      ( MAKE-3PILE ?auto_169297 ?auto_169298 ?auto_169299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169306 - BLOCK
      ?auto_169307 - BLOCK
      ?auto_169308 - BLOCK
    )
    :vars
    (
      ?auto_169310 - BLOCK
      ?auto_169314 - BLOCK
      ?auto_169312 - BLOCK
      ?auto_169313 - BLOCK
      ?auto_169311 - BLOCK
      ?auto_169309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169310 ?auto_169308 ) ( ON-TABLE ?auto_169306 ) ( ON ?auto_169307 ?auto_169306 ) ( ON ?auto_169308 ?auto_169307 ) ( not ( = ?auto_169306 ?auto_169307 ) ) ( not ( = ?auto_169306 ?auto_169308 ) ) ( not ( = ?auto_169306 ?auto_169310 ) ) ( not ( = ?auto_169307 ?auto_169308 ) ) ( not ( = ?auto_169307 ?auto_169310 ) ) ( not ( = ?auto_169308 ?auto_169310 ) ) ( not ( = ?auto_169306 ?auto_169314 ) ) ( not ( = ?auto_169306 ?auto_169312 ) ) ( not ( = ?auto_169307 ?auto_169314 ) ) ( not ( = ?auto_169307 ?auto_169312 ) ) ( not ( = ?auto_169308 ?auto_169314 ) ) ( not ( = ?auto_169308 ?auto_169312 ) ) ( not ( = ?auto_169310 ?auto_169314 ) ) ( not ( = ?auto_169310 ?auto_169312 ) ) ( not ( = ?auto_169314 ?auto_169312 ) ) ( not ( = ?auto_169313 ?auto_169311 ) ) ( not ( = ?auto_169313 ?auto_169312 ) ) ( not ( = ?auto_169311 ?auto_169312 ) ) ( not ( = ?auto_169306 ?auto_169311 ) ) ( not ( = ?auto_169306 ?auto_169313 ) ) ( not ( = ?auto_169307 ?auto_169311 ) ) ( not ( = ?auto_169307 ?auto_169313 ) ) ( not ( = ?auto_169308 ?auto_169311 ) ) ( not ( = ?auto_169308 ?auto_169313 ) ) ( not ( = ?auto_169310 ?auto_169311 ) ) ( not ( = ?auto_169310 ?auto_169313 ) ) ( not ( = ?auto_169314 ?auto_169311 ) ) ( not ( = ?auto_169314 ?auto_169313 ) ) ( ON ?auto_169313 ?auto_169309 ) ( not ( = ?auto_169306 ?auto_169309 ) ) ( not ( = ?auto_169307 ?auto_169309 ) ) ( not ( = ?auto_169308 ?auto_169309 ) ) ( not ( = ?auto_169310 ?auto_169309 ) ) ( not ( = ?auto_169314 ?auto_169309 ) ) ( not ( = ?auto_169312 ?auto_169309 ) ) ( not ( = ?auto_169313 ?auto_169309 ) ) ( not ( = ?auto_169311 ?auto_169309 ) ) ( ON ?auto_169311 ?auto_169313 ) ( ON-TABLE ?auto_169309 ) ( ON ?auto_169312 ?auto_169311 ) ( CLEAR ?auto_169310 ) ( ON ?auto_169314 ?auto_169312 ) ( CLEAR ?auto_169314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169309 ?auto_169313 ?auto_169311 ?auto_169312 )
      ( MAKE-3PILE ?auto_169306 ?auto_169307 ?auto_169308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169333 - BLOCK
      ?auto_169334 - BLOCK
      ?auto_169335 - BLOCK
    )
    :vars
    (
      ?auto_169340 - BLOCK
      ?auto_169336 - BLOCK
      ?auto_169339 - BLOCK
      ?auto_169338 - BLOCK
      ?auto_169341 - BLOCK
      ?auto_169337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169333 ) ( ON ?auto_169334 ?auto_169333 ) ( not ( = ?auto_169333 ?auto_169334 ) ) ( not ( = ?auto_169333 ?auto_169335 ) ) ( not ( = ?auto_169333 ?auto_169340 ) ) ( not ( = ?auto_169334 ?auto_169335 ) ) ( not ( = ?auto_169334 ?auto_169340 ) ) ( not ( = ?auto_169335 ?auto_169340 ) ) ( not ( = ?auto_169333 ?auto_169336 ) ) ( not ( = ?auto_169333 ?auto_169339 ) ) ( not ( = ?auto_169334 ?auto_169336 ) ) ( not ( = ?auto_169334 ?auto_169339 ) ) ( not ( = ?auto_169335 ?auto_169336 ) ) ( not ( = ?auto_169335 ?auto_169339 ) ) ( not ( = ?auto_169340 ?auto_169336 ) ) ( not ( = ?auto_169340 ?auto_169339 ) ) ( not ( = ?auto_169336 ?auto_169339 ) ) ( not ( = ?auto_169338 ?auto_169341 ) ) ( not ( = ?auto_169338 ?auto_169339 ) ) ( not ( = ?auto_169341 ?auto_169339 ) ) ( not ( = ?auto_169333 ?auto_169341 ) ) ( not ( = ?auto_169333 ?auto_169338 ) ) ( not ( = ?auto_169334 ?auto_169341 ) ) ( not ( = ?auto_169334 ?auto_169338 ) ) ( not ( = ?auto_169335 ?auto_169341 ) ) ( not ( = ?auto_169335 ?auto_169338 ) ) ( not ( = ?auto_169340 ?auto_169341 ) ) ( not ( = ?auto_169340 ?auto_169338 ) ) ( not ( = ?auto_169336 ?auto_169341 ) ) ( not ( = ?auto_169336 ?auto_169338 ) ) ( ON ?auto_169338 ?auto_169337 ) ( not ( = ?auto_169333 ?auto_169337 ) ) ( not ( = ?auto_169334 ?auto_169337 ) ) ( not ( = ?auto_169335 ?auto_169337 ) ) ( not ( = ?auto_169340 ?auto_169337 ) ) ( not ( = ?auto_169336 ?auto_169337 ) ) ( not ( = ?auto_169339 ?auto_169337 ) ) ( not ( = ?auto_169338 ?auto_169337 ) ) ( not ( = ?auto_169341 ?auto_169337 ) ) ( ON ?auto_169341 ?auto_169338 ) ( ON-TABLE ?auto_169337 ) ( ON ?auto_169339 ?auto_169341 ) ( ON ?auto_169336 ?auto_169339 ) ( ON ?auto_169340 ?auto_169336 ) ( CLEAR ?auto_169340 ) ( HOLDING ?auto_169335 ) ( CLEAR ?auto_169334 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169333 ?auto_169334 ?auto_169335 ?auto_169340 )
      ( MAKE-3PILE ?auto_169333 ?auto_169334 ?auto_169335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169342 - BLOCK
      ?auto_169343 - BLOCK
      ?auto_169344 - BLOCK
    )
    :vars
    (
      ?auto_169347 - BLOCK
      ?auto_169348 - BLOCK
      ?auto_169346 - BLOCK
      ?auto_169350 - BLOCK
      ?auto_169345 - BLOCK
      ?auto_169349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169342 ) ( ON ?auto_169343 ?auto_169342 ) ( not ( = ?auto_169342 ?auto_169343 ) ) ( not ( = ?auto_169342 ?auto_169344 ) ) ( not ( = ?auto_169342 ?auto_169347 ) ) ( not ( = ?auto_169343 ?auto_169344 ) ) ( not ( = ?auto_169343 ?auto_169347 ) ) ( not ( = ?auto_169344 ?auto_169347 ) ) ( not ( = ?auto_169342 ?auto_169348 ) ) ( not ( = ?auto_169342 ?auto_169346 ) ) ( not ( = ?auto_169343 ?auto_169348 ) ) ( not ( = ?auto_169343 ?auto_169346 ) ) ( not ( = ?auto_169344 ?auto_169348 ) ) ( not ( = ?auto_169344 ?auto_169346 ) ) ( not ( = ?auto_169347 ?auto_169348 ) ) ( not ( = ?auto_169347 ?auto_169346 ) ) ( not ( = ?auto_169348 ?auto_169346 ) ) ( not ( = ?auto_169350 ?auto_169345 ) ) ( not ( = ?auto_169350 ?auto_169346 ) ) ( not ( = ?auto_169345 ?auto_169346 ) ) ( not ( = ?auto_169342 ?auto_169345 ) ) ( not ( = ?auto_169342 ?auto_169350 ) ) ( not ( = ?auto_169343 ?auto_169345 ) ) ( not ( = ?auto_169343 ?auto_169350 ) ) ( not ( = ?auto_169344 ?auto_169345 ) ) ( not ( = ?auto_169344 ?auto_169350 ) ) ( not ( = ?auto_169347 ?auto_169345 ) ) ( not ( = ?auto_169347 ?auto_169350 ) ) ( not ( = ?auto_169348 ?auto_169345 ) ) ( not ( = ?auto_169348 ?auto_169350 ) ) ( ON ?auto_169350 ?auto_169349 ) ( not ( = ?auto_169342 ?auto_169349 ) ) ( not ( = ?auto_169343 ?auto_169349 ) ) ( not ( = ?auto_169344 ?auto_169349 ) ) ( not ( = ?auto_169347 ?auto_169349 ) ) ( not ( = ?auto_169348 ?auto_169349 ) ) ( not ( = ?auto_169346 ?auto_169349 ) ) ( not ( = ?auto_169350 ?auto_169349 ) ) ( not ( = ?auto_169345 ?auto_169349 ) ) ( ON ?auto_169345 ?auto_169350 ) ( ON-TABLE ?auto_169349 ) ( ON ?auto_169346 ?auto_169345 ) ( ON ?auto_169348 ?auto_169346 ) ( ON ?auto_169347 ?auto_169348 ) ( CLEAR ?auto_169343 ) ( ON ?auto_169344 ?auto_169347 ) ( CLEAR ?auto_169344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169349 ?auto_169350 ?auto_169345 ?auto_169346 ?auto_169348 ?auto_169347 )
      ( MAKE-3PILE ?auto_169342 ?auto_169343 ?auto_169344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169351 - BLOCK
      ?auto_169352 - BLOCK
      ?auto_169353 - BLOCK
    )
    :vars
    (
      ?auto_169359 - BLOCK
      ?auto_169357 - BLOCK
      ?auto_169354 - BLOCK
      ?auto_169358 - BLOCK
      ?auto_169355 - BLOCK
      ?auto_169356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169351 ) ( not ( = ?auto_169351 ?auto_169352 ) ) ( not ( = ?auto_169351 ?auto_169353 ) ) ( not ( = ?auto_169351 ?auto_169359 ) ) ( not ( = ?auto_169352 ?auto_169353 ) ) ( not ( = ?auto_169352 ?auto_169359 ) ) ( not ( = ?auto_169353 ?auto_169359 ) ) ( not ( = ?auto_169351 ?auto_169357 ) ) ( not ( = ?auto_169351 ?auto_169354 ) ) ( not ( = ?auto_169352 ?auto_169357 ) ) ( not ( = ?auto_169352 ?auto_169354 ) ) ( not ( = ?auto_169353 ?auto_169357 ) ) ( not ( = ?auto_169353 ?auto_169354 ) ) ( not ( = ?auto_169359 ?auto_169357 ) ) ( not ( = ?auto_169359 ?auto_169354 ) ) ( not ( = ?auto_169357 ?auto_169354 ) ) ( not ( = ?auto_169358 ?auto_169355 ) ) ( not ( = ?auto_169358 ?auto_169354 ) ) ( not ( = ?auto_169355 ?auto_169354 ) ) ( not ( = ?auto_169351 ?auto_169355 ) ) ( not ( = ?auto_169351 ?auto_169358 ) ) ( not ( = ?auto_169352 ?auto_169355 ) ) ( not ( = ?auto_169352 ?auto_169358 ) ) ( not ( = ?auto_169353 ?auto_169355 ) ) ( not ( = ?auto_169353 ?auto_169358 ) ) ( not ( = ?auto_169359 ?auto_169355 ) ) ( not ( = ?auto_169359 ?auto_169358 ) ) ( not ( = ?auto_169357 ?auto_169355 ) ) ( not ( = ?auto_169357 ?auto_169358 ) ) ( ON ?auto_169358 ?auto_169356 ) ( not ( = ?auto_169351 ?auto_169356 ) ) ( not ( = ?auto_169352 ?auto_169356 ) ) ( not ( = ?auto_169353 ?auto_169356 ) ) ( not ( = ?auto_169359 ?auto_169356 ) ) ( not ( = ?auto_169357 ?auto_169356 ) ) ( not ( = ?auto_169354 ?auto_169356 ) ) ( not ( = ?auto_169358 ?auto_169356 ) ) ( not ( = ?auto_169355 ?auto_169356 ) ) ( ON ?auto_169355 ?auto_169358 ) ( ON-TABLE ?auto_169356 ) ( ON ?auto_169354 ?auto_169355 ) ( ON ?auto_169357 ?auto_169354 ) ( ON ?auto_169359 ?auto_169357 ) ( ON ?auto_169353 ?auto_169359 ) ( CLEAR ?auto_169353 ) ( HOLDING ?auto_169352 ) ( CLEAR ?auto_169351 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169351 ?auto_169352 )
      ( MAKE-3PILE ?auto_169351 ?auto_169352 ?auto_169353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169360 - BLOCK
      ?auto_169361 - BLOCK
      ?auto_169362 - BLOCK
    )
    :vars
    (
      ?auto_169367 - BLOCK
      ?auto_169368 - BLOCK
      ?auto_169365 - BLOCK
      ?auto_169366 - BLOCK
      ?auto_169364 - BLOCK
      ?auto_169363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169360 ) ( not ( = ?auto_169360 ?auto_169361 ) ) ( not ( = ?auto_169360 ?auto_169362 ) ) ( not ( = ?auto_169360 ?auto_169367 ) ) ( not ( = ?auto_169361 ?auto_169362 ) ) ( not ( = ?auto_169361 ?auto_169367 ) ) ( not ( = ?auto_169362 ?auto_169367 ) ) ( not ( = ?auto_169360 ?auto_169368 ) ) ( not ( = ?auto_169360 ?auto_169365 ) ) ( not ( = ?auto_169361 ?auto_169368 ) ) ( not ( = ?auto_169361 ?auto_169365 ) ) ( not ( = ?auto_169362 ?auto_169368 ) ) ( not ( = ?auto_169362 ?auto_169365 ) ) ( not ( = ?auto_169367 ?auto_169368 ) ) ( not ( = ?auto_169367 ?auto_169365 ) ) ( not ( = ?auto_169368 ?auto_169365 ) ) ( not ( = ?auto_169366 ?auto_169364 ) ) ( not ( = ?auto_169366 ?auto_169365 ) ) ( not ( = ?auto_169364 ?auto_169365 ) ) ( not ( = ?auto_169360 ?auto_169364 ) ) ( not ( = ?auto_169360 ?auto_169366 ) ) ( not ( = ?auto_169361 ?auto_169364 ) ) ( not ( = ?auto_169361 ?auto_169366 ) ) ( not ( = ?auto_169362 ?auto_169364 ) ) ( not ( = ?auto_169362 ?auto_169366 ) ) ( not ( = ?auto_169367 ?auto_169364 ) ) ( not ( = ?auto_169367 ?auto_169366 ) ) ( not ( = ?auto_169368 ?auto_169364 ) ) ( not ( = ?auto_169368 ?auto_169366 ) ) ( ON ?auto_169366 ?auto_169363 ) ( not ( = ?auto_169360 ?auto_169363 ) ) ( not ( = ?auto_169361 ?auto_169363 ) ) ( not ( = ?auto_169362 ?auto_169363 ) ) ( not ( = ?auto_169367 ?auto_169363 ) ) ( not ( = ?auto_169368 ?auto_169363 ) ) ( not ( = ?auto_169365 ?auto_169363 ) ) ( not ( = ?auto_169366 ?auto_169363 ) ) ( not ( = ?auto_169364 ?auto_169363 ) ) ( ON ?auto_169364 ?auto_169366 ) ( ON-TABLE ?auto_169363 ) ( ON ?auto_169365 ?auto_169364 ) ( ON ?auto_169368 ?auto_169365 ) ( ON ?auto_169367 ?auto_169368 ) ( ON ?auto_169362 ?auto_169367 ) ( CLEAR ?auto_169360 ) ( ON ?auto_169361 ?auto_169362 ) ( CLEAR ?auto_169361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169363 ?auto_169366 ?auto_169364 ?auto_169365 ?auto_169368 ?auto_169367 ?auto_169362 )
      ( MAKE-3PILE ?auto_169360 ?auto_169361 ?auto_169362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169369 - BLOCK
      ?auto_169370 - BLOCK
      ?auto_169371 - BLOCK
    )
    :vars
    (
      ?auto_169375 - BLOCK
      ?auto_169376 - BLOCK
      ?auto_169372 - BLOCK
      ?auto_169374 - BLOCK
      ?auto_169373 - BLOCK
      ?auto_169377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169369 ?auto_169370 ) ) ( not ( = ?auto_169369 ?auto_169371 ) ) ( not ( = ?auto_169369 ?auto_169375 ) ) ( not ( = ?auto_169370 ?auto_169371 ) ) ( not ( = ?auto_169370 ?auto_169375 ) ) ( not ( = ?auto_169371 ?auto_169375 ) ) ( not ( = ?auto_169369 ?auto_169376 ) ) ( not ( = ?auto_169369 ?auto_169372 ) ) ( not ( = ?auto_169370 ?auto_169376 ) ) ( not ( = ?auto_169370 ?auto_169372 ) ) ( not ( = ?auto_169371 ?auto_169376 ) ) ( not ( = ?auto_169371 ?auto_169372 ) ) ( not ( = ?auto_169375 ?auto_169376 ) ) ( not ( = ?auto_169375 ?auto_169372 ) ) ( not ( = ?auto_169376 ?auto_169372 ) ) ( not ( = ?auto_169374 ?auto_169373 ) ) ( not ( = ?auto_169374 ?auto_169372 ) ) ( not ( = ?auto_169373 ?auto_169372 ) ) ( not ( = ?auto_169369 ?auto_169373 ) ) ( not ( = ?auto_169369 ?auto_169374 ) ) ( not ( = ?auto_169370 ?auto_169373 ) ) ( not ( = ?auto_169370 ?auto_169374 ) ) ( not ( = ?auto_169371 ?auto_169373 ) ) ( not ( = ?auto_169371 ?auto_169374 ) ) ( not ( = ?auto_169375 ?auto_169373 ) ) ( not ( = ?auto_169375 ?auto_169374 ) ) ( not ( = ?auto_169376 ?auto_169373 ) ) ( not ( = ?auto_169376 ?auto_169374 ) ) ( ON ?auto_169374 ?auto_169377 ) ( not ( = ?auto_169369 ?auto_169377 ) ) ( not ( = ?auto_169370 ?auto_169377 ) ) ( not ( = ?auto_169371 ?auto_169377 ) ) ( not ( = ?auto_169375 ?auto_169377 ) ) ( not ( = ?auto_169376 ?auto_169377 ) ) ( not ( = ?auto_169372 ?auto_169377 ) ) ( not ( = ?auto_169374 ?auto_169377 ) ) ( not ( = ?auto_169373 ?auto_169377 ) ) ( ON ?auto_169373 ?auto_169374 ) ( ON-TABLE ?auto_169377 ) ( ON ?auto_169372 ?auto_169373 ) ( ON ?auto_169376 ?auto_169372 ) ( ON ?auto_169375 ?auto_169376 ) ( ON ?auto_169371 ?auto_169375 ) ( ON ?auto_169370 ?auto_169371 ) ( CLEAR ?auto_169370 ) ( HOLDING ?auto_169369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169369 )
      ( MAKE-3PILE ?auto_169369 ?auto_169370 ?auto_169371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169378 - BLOCK
      ?auto_169379 - BLOCK
      ?auto_169380 - BLOCK
    )
    :vars
    (
      ?auto_169384 - BLOCK
      ?auto_169381 - BLOCK
      ?auto_169383 - BLOCK
      ?auto_169386 - BLOCK
      ?auto_169382 - BLOCK
      ?auto_169385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169378 ?auto_169379 ) ) ( not ( = ?auto_169378 ?auto_169380 ) ) ( not ( = ?auto_169378 ?auto_169384 ) ) ( not ( = ?auto_169379 ?auto_169380 ) ) ( not ( = ?auto_169379 ?auto_169384 ) ) ( not ( = ?auto_169380 ?auto_169384 ) ) ( not ( = ?auto_169378 ?auto_169381 ) ) ( not ( = ?auto_169378 ?auto_169383 ) ) ( not ( = ?auto_169379 ?auto_169381 ) ) ( not ( = ?auto_169379 ?auto_169383 ) ) ( not ( = ?auto_169380 ?auto_169381 ) ) ( not ( = ?auto_169380 ?auto_169383 ) ) ( not ( = ?auto_169384 ?auto_169381 ) ) ( not ( = ?auto_169384 ?auto_169383 ) ) ( not ( = ?auto_169381 ?auto_169383 ) ) ( not ( = ?auto_169386 ?auto_169382 ) ) ( not ( = ?auto_169386 ?auto_169383 ) ) ( not ( = ?auto_169382 ?auto_169383 ) ) ( not ( = ?auto_169378 ?auto_169382 ) ) ( not ( = ?auto_169378 ?auto_169386 ) ) ( not ( = ?auto_169379 ?auto_169382 ) ) ( not ( = ?auto_169379 ?auto_169386 ) ) ( not ( = ?auto_169380 ?auto_169382 ) ) ( not ( = ?auto_169380 ?auto_169386 ) ) ( not ( = ?auto_169384 ?auto_169382 ) ) ( not ( = ?auto_169384 ?auto_169386 ) ) ( not ( = ?auto_169381 ?auto_169382 ) ) ( not ( = ?auto_169381 ?auto_169386 ) ) ( ON ?auto_169386 ?auto_169385 ) ( not ( = ?auto_169378 ?auto_169385 ) ) ( not ( = ?auto_169379 ?auto_169385 ) ) ( not ( = ?auto_169380 ?auto_169385 ) ) ( not ( = ?auto_169384 ?auto_169385 ) ) ( not ( = ?auto_169381 ?auto_169385 ) ) ( not ( = ?auto_169383 ?auto_169385 ) ) ( not ( = ?auto_169386 ?auto_169385 ) ) ( not ( = ?auto_169382 ?auto_169385 ) ) ( ON ?auto_169382 ?auto_169386 ) ( ON-TABLE ?auto_169385 ) ( ON ?auto_169383 ?auto_169382 ) ( ON ?auto_169381 ?auto_169383 ) ( ON ?auto_169384 ?auto_169381 ) ( ON ?auto_169380 ?auto_169384 ) ( ON ?auto_169379 ?auto_169380 ) ( ON ?auto_169378 ?auto_169379 ) ( CLEAR ?auto_169378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169385 ?auto_169386 ?auto_169382 ?auto_169383 ?auto_169381 ?auto_169384 ?auto_169380 ?auto_169379 )
      ( MAKE-3PILE ?auto_169378 ?auto_169379 ?auto_169380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169392 - BLOCK
      ?auto_169393 - BLOCK
      ?auto_169394 - BLOCK
      ?auto_169395 - BLOCK
      ?auto_169396 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169396 ) ( CLEAR ?auto_169395 ) ( ON-TABLE ?auto_169392 ) ( ON ?auto_169393 ?auto_169392 ) ( ON ?auto_169394 ?auto_169393 ) ( ON ?auto_169395 ?auto_169394 ) ( not ( = ?auto_169392 ?auto_169393 ) ) ( not ( = ?auto_169392 ?auto_169394 ) ) ( not ( = ?auto_169392 ?auto_169395 ) ) ( not ( = ?auto_169392 ?auto_169396 ) ) ( not ( = ?auto_169393 ?auto_169394 ) ) ( not ( = ?auto_169393 ?auto_169395 ) ) ( not ( = ?auto_169393 ?auto_169396 ) ) ( not ( = ?auto_169394 ?auto_169395 ) ) ( not ( = ?auto_169394 ?auto_169396 ) ) ( not ( = ?auto_169395 ?auto_169396 ) ) )
    :subtasks
    ( ( !STACK ?auto_169396 ?auto_169395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169397 - BLOCK
      ?auto_169398 - BLOCK
      ?auto_169399 - BLOCK
      ?auto_169400 - BLOCK
      ?auto_169401 - BLOCK
    )
    :vars
    (
      ?auto_169402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169400 ) ( ON-TABLE ?auto_169397 ) ( ON ?auto_169398 ?auto_169397 ) ( ON ?auto_169399 ?auto_169398 ) ( ON ?auto_169400 ?auto_169399 ) ( not ( = ?auto_169397 ?auto_169398 ) ) ( not ( = ?auto_169397 ?auto_169399 ) ) ( not ( = ?auto_169397 ?auto_169400 ) ) ( not ( = ?auto_169397 ?auto_169401 ) ) ( not ( = ?auto_169398 ?auto_169399 ) ) ( not ( = ?auto_169398 ?auto_169400 ) ) ( not ( = ?auto_169398 ?auto_169401 ) ) ( not ( = ?auto_169399 ?auto_169400 ) ) ( not ( = ?auto_169399 ?auto_169401 ) ) ( not ( = ?auto_169400 ?auto_169401 ) ) ( ON ?auto_169401 ?auto_169402 ) ( CLEAR ?auto_169401 ) ( HAND-EMPTY ) ( not ( = ?auto_169397 ?auto_169402 ) ) ( not ( = ?auto_169398 ?auto_169402 ) ) ( not ( = ?auto_169399 ?auto_169402 ) ) ( not ( = ?auto_169400 ?auto_169402 ) ) ( not ( = ?auto_169401 ?auto_169402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169401 ?auto_169402 )
      ( MAKE-5PILE ?auto_169397 ?auto_169398 ?auto_169399 ?auto_169400 ?auto_169401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169403 - BLOCK
      ?auto_169404 - BLOCK
      ?auto_169405 - BLOCK
      ?auto_169406 - BLOCK
      ?auto_169407 - BLOCK
    )
    :vars
    (
      ?auto_169408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169403 ) ( ON ?auto_169404 ?auto_169403 ) ( ON ?auto_169405 ?auto_169404 ) ( not ( = ?auto_169403 ?auto_169404 ) ) ( not ( = ?auto_169403 ?auto_169405 ) ) ( not ( = ?auto_169403 ?auto_169406 ) ) ( not ( = ?auto_169403 ?auto_169407 ) ) ( not ( = ?auto_169404 ?auto_169405 ) ) ( not ( = ?auto_169404 ?auto_169406 ) ) ( not ( = ?auto_169404 ?auto_169407 ) ) ( not ( = ?auto_169405 ?auto_169406 ) ) ( not ( = ?auto_169405 ?auto_169407 ) ) ( not ( = ?auto_169406 ?auto_169407 ) ) ( ON ?auto_169407 ?auto_169408 ) ( CLEAR ?auto_169407 ) ( not ( = ?auto_169403 ?auto_169408 ) ) ( not ( = ?auto_169404 ?auto_169408 ) ) ( not ( = ?auto_169405 ?auto_169408 ) ) ( not ( = ?auto_169406 ?auto_169408 ) ) ( not ( = ?auto_169407 ?auto_169408 ) ) ( HOLDING ?auto_169406 ) ( CLEAR ?auto_169405 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169403 ?auto_169404 ?auto_169405 ?auto_169406 )
      ( MAKE-5PILE ?auto_169403 ?auto_169404 ?auto_169405 ?auto_169406 ?auto_169407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169409 - BLOCK
      ?auto_169410 - BLOCK
      ?auto_169411 - BLOCK
      ?auto_169412 - BLOCK
      ?auto_169413 - BLOCK
    )
    :vars
    (
      ?auto_169414 - BLOCK
      ?auto_169415 - BLOCK
      ?auto_169416 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169409 ) ( ON ?auto_169410 ?auto_169409 ) ( ON ?auto_169411 ?auto_169410 ) ( not ( = ?auto_169409 ?auto_169410 ) ) ( not ( = ?auto_169409 ?auto_169411 ) ) ( not ( = ?auto_169409 ?auto_169412 ) ) ( not ( = ?auto_169409 ?auto_169413 ) ) ( not ( = ?auto_169410 ?auto_169411 ) ) ( not ( = ?auto_169410 ?auto_169412 ) ) ( not ( = ?auto_169410 ?auto_169413 ) ) ( not ( = ?auto_169411 ?auto_169412 ) ) ( not ( = ?auto_169411 ?auto_169413 ) ) ( not ( = ?auto_169412 ?auto_169413 ) ) ( ON ?auto_169413 ?auto_169414 ) ( not ( = ?auto_169409 ?auto_169414 ) ) ( not ( = ?auto_169410 ?auto_169414 ) ) ( not ( = ?auto_169411 ?auto_169414 ) ) ( not ( = ?auto_169412 ?auto_169414 ) ) ( not ( = ?auto_169413 ?auto_169414 ) ) ( CLEAR ?auto_169411 ) ( ON ?auto_169412 ?auto_169413 ) ( CLEAR ?auto_169412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169415 ) ( ON ?auto_169416 ?auto_169415 ) ( ON ?auto_169414 ?auto_169416 ) ( not ( = ?auto_169415 ?auto_169416 ) ) ( not ( = ?auto_169415 ?auto_169414 ) ) ( not ( = ?auto_169415 ?auto_169413 ) ) ( not ( = ?auto_169415 ?auto_169412 ) ) ( not ( = ?auto_169416 ?auto_169414 ) ) ( not ( = ?auto_169416 ?auto_169413 ) ) ( not ( = ?auto_169416 ?auto_169412 ) ) ( not ( = ?auto_169409 ?auto_169415 ) ) ( not ( = ?auto_169409 ?auto_169416 ) ) ( not ( = ?auto_169410 ?auto_169415 ) ) ( not ( = ?auto_169410 ?auto_169416 ) ) ( not ( = ?auto_169411 ?auto_169415 ) ) ( not ( = ?auto_169411 ?auto_169416 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169415 ?auto_169416 ?auto_169414 ?auto_169413 )
      ( MAKE-5PILE ?auto_169409 ?auto_169410 ?auto_169411 ?auto_169412 ?auto_169413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169417 - BLOCK
      ?auto_169418 - BLOCK
      ?auto_169419 - BLOCK
      ?auto_169420 - BLOCK
      ?auto_169421 - BLOCK
    )
    :vars
    (
      ?auto_169424 - BLOCK
      ?auto_169422 - BLOCK
      ?auto_169423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169417 ) ( ON ?auto_169418 ?auto_169417 ) ( not ( = ?auto_169417 ?auto_169418 ) ) ( not ( = ?auto_169417 ?auto_169419 ) ) ( not ( = ?auto_169417 ?auto_169420 ) ) ( not ( = ?auto_169417 ?auto_169421 ) ) ( not ( = ?auto_169418 ?auto_169419 ) ) ( not ( = ?auto_169418 ?auto_169420 ) ) ( not ( = ?auto_169418 ?auto_169421 ) ) ( not ( = ?auto_169419 ?auto_169420 ) ) ( not ( = ?auto_169419 ?auto_169421 ) ) ( not ( = ?auto_169420 ?auto_169421 ) ) ( ON ?auto_169421 ?auto_169424 ) ( not ( = ?auto_169417 ?auto_169424 ) ) ( not ( = ?auto_169418 ?auto_169424 ) ) ( not ( = ?auto_169419 ?auto_169424 ) ) ( not ( = ?auto_169420 ?auto_169424 ) ) ( not ( = ?auto_169421 ?auto_169424 ) ) ( ON ?auto_169420 ?auto_169421 ) ( CLEAR ?auto_169420 ) ( ON-TABLE ?auto_169422 ) ( ON ?auto_169423 ?auto_169422 ) ( ON ?auto_169424 ?auto_169423 ) ( not ( = ?auto_169422 ?auto_169423 ) ) ( not ( = ?auto_169422 ?auto_169424 ) ) ( not ( = ?auto_169422 ?auto_169421 ) ) ( not ( = ?auto_169422 ?auto_169420 ) ) ( not ( = ?auto_169423 ?auto_169424 ) ) ( not ( = ?auto_169423 ?auto_169421 ) ) ( not ( = ?auto_169423 ?auto_169420 ) ) ( not ( = ?auto_169417 ?auto_169422 ) ) ( not ( = ?auto_169417 ?auto_169423 ) ) ( not ( = ?auto_169418 ?auto_169422 ) ) ( not ( = ?auto_169418 ?auto_169423 ) ) ( not ( = ?auto_169419 ?auto_169422 ) ) ( not ( = ?auto_169419 ?auto_169423 ) ) ( HOLDING ?auto_169419 ) ( CLEAR ?auto_169418 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169417 ?auto_169418 ?auto_169419 )
      ( MAKE-5PILE ?auto_169417 ?auto_169418 ?auto_169419 ?auto_169420 ?auto_169421 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169425 - BLOCK
      ?auto_169426 - BLOCK
      ?auto_169427 - BLOCK
      ?auto_169428 - BLOCK
      ?auto_169429 - BLOCK
    )
    :vars
    (
      ?auto_169431 - BLOCK
      ?auto_169430 - BLOCK
      ?auto_169432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169425 ) ( ON ?auto_169426 ?auto_169425 ) ( not ( = ?auto_169425 ?auto_169426 ) ) ( not ( = ?auto_169425 ?auto_169427 ) ) ( not ( = ?auto_169425 ?auto_169428 ) ) ( not ( = ?auto_169425 ?auto_169429 ) ) ( not ( = ?auto_169426 ?auto_169427 ) ) ( not ( = ?auto_169426 ?auto_169428 ) ) ( not ( = ?auto_169426 ?auto_169429 ) ) ( not ( = ?auto_169427 ?auto_169428 ) ) ( not ( = ?auto_169427 ?auto_169429 ) ) ( not ( = ?auto_169428 ?auto_169429 ) ) ( ON ?auto_169429 ?auto_169431 ) ( not ( = ?auto_169425 ?auto_169431 ) ) ( not ( = ?auto_169426 ?auto_169431 ) ) ( not ( = ?auto_169427 ?auto_169431 ) ) ( not ( = ?auto_169428 ?auto_169431 ) ) ( not ( = ?auto_169429 ?auto_169431 ) ) ( ON ?auto_169428 ?auto_169429 ) ( ON-TABLE ?auto_169430 ) ( ON ?auto_169432 ?auto_169430 ) ( ON ?auto_169431 ?auto_169432 ) ( not ( = ?auto_169430 ?auto_169432 ) ) ( not ( = ?auto_169430 ?auto_169431 ) ) ( not ( = ?auto_169430 ?auto_169429 ) ) ( not ( = ?auto_169430 ?auto_169428 ) ) ( not ( = ?auto_169432 ?auto_169431 ) ) ( not ( = ?auto_169432 ?auto_169429 ) ) ( not ( = ?auto_169432 ?auto_169428 ) ) ( not ( = ?auto_169425 ?auto_169430 ) ) ( not ( = ?auto_169425 ?auto_169432 ) ) ( not ( = ?auto_169426 ?auto_169430 ) ) ( not ( = ?auto_169426 ?auto_169432 ) ) ( not ( = ?auto_169427 ?auto_169430 ) ) ( not ( = ?auto_169427 ?auto_169432 ) ) ( CLEAR ?auto_169426 ) ( ON ?auto_169427 ?auto_169428 ) ( CLEAR ?auto_169427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169430 ?auto_169432 ?auto_169431 ?auto_169429 ?auto_169428 )
      ( MAKE-5PILE ?auto_169425 ?auto_169426 ?auto_169427 ?auto_169428 ?auto_169429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169433 - BLOCK
      ?auto_169434 - BLOCK
      ?auto_169435 - BLOCK
      ?auto_169436 - BLOCK
      ?auto_169437 - BLOCK
    )
    :vars
    (
      ?auto_169440 - BLOCK
      ?auto_169438 - BLOCK
      ?auto_169439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169433 ) ( not ( = ?auto_169433 ?auto_169434 ) ) ( not ( = ?auto_169433 ?auto_169435 ) ) ( not ( = ?auto_169433 ?auto_169436 ) ) ( not ( = ?auto_169433 ?auto_169437 ) ) ( not ( = ?auto_169434 ?auto_169435 ) ) ( not ( = ?auto_169434 ?auto_169436 ) ) ( not ( = ?auto_169434 ?auto_169437 ) ) ( not ( = ?auto_169435 ?auto_169436 ) ) ( not ( = ?auto_169435 ?auto_169437 ) ) ( not ( = ?auto_169436 ?auto_169437 ) ) ( ON ?auto_169437 ?auto_169440 ) ( not ( = ?auto_169433 ?auto_169440 ) ) ( not ( = ?auto_169434 ?auto_169440 ) ) ( not ( = ?auto_169435 ?auto_169440 ) ) ( not ( = ?auto_169436 ?auto_169440 ) ) ( not ( = ?auto_169437 ?auto_169440 ) ) ( ON ?auto_169436 ?auto_169437 ) ( ON-TABLE ?auto_169438 ) ( ON ?auto_169439 ?auto_169438 ) ( ON ?auto_169440 ?auto_169439 ) ( not ( = ?auto_169438 ?auto_169439 ) ) ( not ( = ?auto_169438 ?auto_169440 ) ) ( not ( = ?auto_169438 ?auto_169437 ) ) ( not ( = ?auto_169438 ?auto_169436 ) ) ( not ( = ?auto_169439 ?auto_169440 ) ) ( not ( = ?auto_169439 ?auto_169437 ) ) ( not ( = ?auto_169439 ?auto_169436 ) ) ( not ( = ?auto_169433 ?auto_169438 ) ) ( not ( = ?auto_169433 ?auto_169439 ) ) ( not ( = ?auto_169434 ?auto_169438 ) ) ( not ( = ?auto_169434 ?auto_169439 ) ) ( not ( = ?auto_169435 ?auto_169438 ) ) ( not ( = ?auto_169435 ?auto_169439 ) ) ( ON ?auto_169435 ?auto_169436 ) ( CLEAR ?auto_169435 ) ( HOLDING ?auto_169434 ) ( CLEAR ?auto_169433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169433 ?auto_169434 )
      ( MAKE-5PILE ?auto_169433 ?auto_169434 ?auto_169435 ?auto_169436 ?auto_169437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169441 - BLOCK
      ?auto_169442 - BLOCK
      ?auto_169443 - BLOCK
      ?auto_169444 - BLOCK
      ?auto_169445 - BLOCK
    )
    :vars
    (
      ?auto_169448 - BLOCK
      ?auto_169447 - BLOCK
      ?auto_169446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169441 ) ( not ( = ?auto_169441 ?auto_169442 ) ) ( not ( = ?auto_169441 ?auto_169443 ) ) ( not ( = ?auto_169441 ?auto_169444 ) ) ( not ( = ?auto_169441 ?auto_169445 ) ) ( not ( = ?auto_169442 ?auto_169443 ) ) ( not ( = ?auto_169442 ?auto_169444 ) ) ( not ( = ?auto_169442 ?auto_169445 ) ) ( not ( = ?auto_169443 ?auto_169444 ) ) ( not ( = ?auto_169443 ?auto_169445 ) ) ( not ( = ?auto_169444 ?auto_169445 ) ) ( ON ?auto_169445 ?auto_169448 ) ( not ( = ?auto_169441 ?auto_169448 ) ) ( not ( = ?auto_169442 ?auto_169448 ) ) ( not ( = ?auto_169443 ?auto_169448 ) ) ( not ( = ?auto_169444 ?auto_169448 ) ) ( not ( = ?auto_169445 ?auto_169448 ) ) ( ON ?auto_169444 ?auto_169445 ) ( ON-TABLE ?auto_169447 ) ( ON ?auto_169446 ?auto_169447 ) ( ON ?auto_169448 ?auto_169446 ) ( not ( = ?auto_169447 ?auto_169446 ) ) ( not ( = ?auto_169447 ?auto_169448 ) ) ( not ( = ?auto_169447 ?auto_169445 ) ) ( not ( = ?auto_169447 ?auto_169444 ) ) ( not ( = ?auto_169446 ?auto_169448 ) ) ( not ( = ?auto_169446 ?auto_169445 ) ) ( not ( = ?auto_169446 ?auto_169444 ) ) ( not ( = ?auto_169441 ?auto_169447 ) ) ( not ( = ?auto_169441 ?auto_169446 ) ) ( not ( = ?auto_169442 ?auto_169447 ) ) ( not ( = ?auto_169442 ?auto_169446 ) ) ( not ( = ?auto_169443 ?auto_169447 ) ) ( not ( = ?auto_169443 ?auto_169446 ) ) ( ON ?auto_169443 ?auto_169444 ) ( CLEAR ?auto_169441 ) ( ON ?auto_169442 ?auto_169443 ) ( CLEAR ?auto_169442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169447 ?auto_169446 ?auto_169448 ?auto_169445 ?auto_169444 ?auto_169443 )
      ( MAKE-5PILE ?auto_169441 ?auto_169442 ?auto_169443 ?auto_169444 ?auto_169445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169449 - BLOCK
      ?auto_169450 - BLOCK
      ?auto_169451 - BLOCK
      ?auto_169452 - BLOCK
      ?auto_169453 - BLOCK
    )
    :vars
    (
      ?auto_169454 - BLOCK
      ?auto_169456 - BLOCK
      ?auto_169455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169449 ?auto_169450 ) ) ( not ( = ?auto_169449 ?auto_169451 ) ) ( not ( = ?auto_169449 ?auto_169452 ) ) ( not ( = ?auto_169449 ?auto_169453 ) ) ( not ( = ?auto_169450 ?auto_169451 ) ) ( not ( = ?auto_169450 ?auto_169452 ) ) ( not ( = ?auto_169450 ?auto_169453 ) ) ( not ( = ?auto_169451 ?auto_169452 ) ) ( not ( = ?auto_169451 ?auto_169453 ) ) ( not ( = ?auto_169452 ?auto_169453 ) ) ( ON ?auto_169453 ?auto_169454 ) ( not ( = ?auto_169449 ?auto_169454 ) ) ( not ( = ?auto_169450 ?auto_169454 ) ) ( not ( = ?auto_169451 ?auto_169454 ) ) ( not ( = ?auto_169452 ?auto_169454 ) ) ( not ( = ?auto_169453 ?auto_169454 ) ) ( ON ?auto_169452 ?auto_169453 ) ( ON-TABLE ?auto_169456 ) ( ON ?auto_169455 ?auto_169456 ) ( ON ?auto_169454 ?auto_169455 ) ( not ( = ?auto_169456 ?auto_169455 ) ) ( not ( = ?auto_169456 ?auto_169454 ) ) ( not ( = ?auto_169456 ?auto_169453 ) ) ( not ( = ?auto_169456 ?auto_169452 ) ) ( not ( = ?auto_169455 ?auto_169454 ) ) ( not ( = ?auto_169455 ?auto_169453 ) ) ( not ( = ?auto_169455 ?auto_169452 ) ) ( not ( = ?auto_169449 ?auto_169456 ) ) ( not ( = ?auto_169449 ?auto_169455 ) ) ( not ( = ?auto_169450 ?auto_169456 ) ) ( not ( = ?auto_169450 ?auto_169455 ) ) ( not ( = ?auto_169451 ?auto_169456 ) ) ( not ( = ?auto_169451 ?auto_169455 ) ) ( ON ?auto_169451 ?auto_169452 ) ( ON ?auto_169450 ?auto_169451 ) ( CLEAR ?auto_169450 ) ( HOLDING ?auto_169449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169449 )
      ( MAKE-5PILE ?auto_169449 ?auto_169450 ?auto_169451 ?auto_169452 ?auto_169453 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169457 - BLOCK
      ?auto_169458 - BLOCK
      ?auto_169459 - BLOCK
      ?auto_169460 - BLOCK
      ?auto_169461 - BLOCK
    )
    :vars
    (
      ?auto_169462 - BLOCK
      ?auto_169464 - BLOCK
      ?auto_169463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169457 ?auto_169458 ) ) ( not ( = ?auto_169457 ?auto_169459 ) ) ( not ( = ?auto_169457 ?auto_169460 ) ) ( not ( = ?auto_169457 ?auto_169461 ) ) ( not ( = ?auto_169458 ?auto_169459 ) ) ( not ( = ?auto_169458 ?auto_169460 ) ) ( not ( = ?auto_169458 ?auto_169461 ) ) ( not ( = ?auto_169459 ?auto_169460 ) ) ( not ( = ?auto_169459 ?auto_169461 ) ) ( not ( = ?auto_169460 ?auto_169461 ) ) ( ON ?auto_169461 ?auto_169462 ) ( not ( = ?auto_169457 ?auto_169462 ) ) ( not ( = ?auto_169458 ?auto_169462 ) ) ( not ( = ?auto_169459 ?auto_169462 ) ) ( not ( = ?auto_169460 ?auto_169462 ) ) ( not ( = ?auto_169461 ?auto_169462 ) ) ( ON ?auto_169460 ?auto_169461 ) ( ON-TABLE ?auto_169464 ) ( ON ?auto_169463 ?auto_169464 ) ( ON ?auto_169462 ?auto_169463 ) ( not ( = ?auto_169464 ?auto_169463 ) ) ( not ( = ?auto_169464 ?auto_169462 ) ) ( not ( = ?auto_169464 ?auto_169461 ) ) ( not ( = ?auto_169464 ?auto_169460 ) ) ( not ( = ?auto_169463 ?auto_169462 ) ) ( not ( = ?auto_169463 ?auto_169461 ) ) ( not ( = ?auto_169463 ?auto_169460 ) ) ( not ( = ?auto_169457 ?auto_169464 ) ) ( not ( = ?auto_169457 ?auto_169463 ) ) ( not ( = ?auto_169458 ?auto_169464 ) ) ( not ( = ?auto_169458 ?auto_169463 ) ) ( not ( = ?auto_169459 ?auto_169464 ) ) ( not ( = ?auto_169459 ?auto_169463 ) ) ( ON ?auto_169459 ?auto_169460 ) ( ON ?auto_169458 ?auto_169459 ) ( ON ?auto_169457 ?auto_169458 ) ( CLEAR ?auto_169457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169464 ?auto_169463 ?auto_169462 ?auto_169461 ?auto_169460 ?auto_169459 ?auto_169458 )
      ( MAKE-5PILE ?auto_169457 ?auto_169458 ?auto_169459 ?auto_169460 ?auto_169461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169465 - BLOCK
      ?auto_169466 - BLOCK
      ?auto_169467 - BLOCK
      ?auto_169468 - BLOCK
      ?auto_169469 - BLOCK
    )
    :vars
    (
      ?auto_169471 - BLOCK
      ?auto_169472 - BLOCK
      ?auto_169470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169465 ?auto_169466 ) ) ( not ( = ?auto_169465 ?auto_169467 ) ) ( not ( = ?auto_169465 ?auto_169468 ) ) ( not ( = ?auto_169465 ?auto_169469 ) ) ( not ( = ?auto_169466 ?auto_169467 ) ) ( not ( = ?auto_169466 ?auto_169468 ) ) ( not ( = ?auto_169466 ?auto_169469 ) ) ( not ( = ?auto_169467 ?auto_169468 ) ) ( not ( = ?auto_169467 ?auto_169469 ) ) ( not ( = ?auto_169468 ?auto_169469 ) ) ( ON ?auto_169469 ?auto_169471 ) ( not ( = ?auto_169465 ?auto_169471 ) ) ( not ( = ?auto_169466 ?auto_169471 ) ) ( not ( = ?auto_169467 ?auto_169471 ) ) ( not ( = ?auto_169468 ?auto_169471 ) ) ( not ( = ?auto_169469 ?auto_169471 ) ) ( ON ?auto_169468 ?auto_169469 ) ( ON-TABLE ?auto_169472 ) ( ON ?auto_169470 ?auto_169472 ) ( ON ?auto_169471 ?auto_169470 ) ( not ( = ?auto_169472 ?auto_169470 ) ) ( not ( = ?auto_169472 ?auto_169471 ) ) ( not ( = ?auto_169472 ?auto_169469 ) ) ( not ( = ?auto_169472 ?auto_169468 ) ) ( not ( = ?auto_169470 ?auto_169471 ) ) ( not ( = ?auto_169470 ?auto_169469 ) ) ( not ( = ?auto_169470 ?auto_169468 ) ) ( not ( = ?auto_169465 ?auto_169472 ) ) ( not ( = ?auto_169465 ?auto_169470 ) ) ( not ( = ?auto_169466 ?auto_169472 ) ) ( not ( = ?auto_169466 ?auto_169470 ) ) ( not ( = ?auto_169467 ?auto_169472 ) ) ( not ( = ?auto_169467 ?auto_169470 ) ) ( ON ?auto_169467 ?auto_169468 ) ( ON ?auto_169466 ?auto_169467 ) ( HOLDING ?auto_169465 ) ( CLEAR ?auto_169466 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169472 ?auto_169470 ?auto_169471 ?auto_169469 ?auto_169468 ?auto_169467 ?auto_169466 ?auto_169465 )
      ( MAKE-5PILE ?auto_169465 ?auto_169466 ?auto_169467 ?auto_169468 ?auto_169469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169473 - BLOCK
      ?auto_169474 - BLOCK
      ?auto_169475 - BLOCK
      ?auto_169476 - BLOCK
      ?auto_169477 - BLOCK
    )
    :vars
    (
      ?auto_169478 - BLOCK
      ?auto_169479 - BLOCK
      ?auto_169480 - BLOCK
      ?auto_169481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169473 ?auto_169474 ) ) ( not ( = ?auto_169473 ?auto_169475 ) ) ( not ( = ?auto_169473 ?auto_169476 ) ) ( not ( = ?auto_169473 ?auto_169477 ) ) ( not ( = ?auto_169474 ?auto_169475 ) ) ( not ( = ?auto_169474 ?auto_169476 ) ) ( not ( = ?auto_169474 ?auto_169477 ) ) ( not ( = ?auto_169475 ?auto_169476 ) ) ( not ( = ?auto_169475 ?auto_169477 ) ) ( not ( = ?auto_169476 ?auto_169477 ) ) ( ON ?auto_169477 ?auto_169478 ) ( not ( = ?auto_169473 ?auto_169478 ) ) ( not ( = ?auto_169474 ?auto_169478 ) ) ( not ( = ?auto_169475 ?auto_169478 ) ) ( not ( = ?auto_169476 ?auto_169478 ) ) ( not ( = ?auto_169477 ?auto_169478 ) ) ( ON ?auto_169476 ?auto_169477 ) ( ON-TABLE ?auto_169479 ) ( ON ?auto_169480 ?auto_169479 ) ( ON ?auto_169478 ?auto_169480 ) ( not ( = ?auto_169479 ?auto_169480 ) ) ( not ( = ?auto_169479 ?auto_169478 ) ) ( not ( = ?auto_169479 ?auto_169477 ) ) ( not ( = ?auto_169479 ?auto_169476 ) ) ( not ( = ?auto_169480 ?auto_169478 ) ) ( not ( = ?auto_169480 ?auto_169477 ) ) ( not ( = ?auto_169480 ?auto_169476 ) ) ( not ( = ?auto_169473 ?auto_169479 ) ) ( not ( = ?auto_169473 ?auto_169480 ) ) ( not ( = ?auto_169474 ?auto_169479 ) ) ( not ( = ?auto_169474 ?auto_169480 ) ) ( not ( = ?auto_169475 ?auto_169479 ) ) ( not ( = ?auto_169475 ?auto_169480 ) ) ( ON ?auto_169475 ?auto_169476 ) ( ON ?auto_169474 ?auto_169475 ) ( CLEAR ?auto_169474 ) ( ON ?auto_169473 ?auto_169481 ) ( CLEAR ?auto_169473 ) ( HAND-EMPTY ) ( not ( = ?auto_169473 ?auto_169481 ) ) ( not ( = ?auto_169474 ?auto_169481 ) ) ( not ( = ?auto_169475 ?auto_169481 ) ) ( not ( = ?auto_169476 ?auto_169481 ) ) ( not ( = ?auto_169477 ?auto_169481 ) ) ( not ( = ?auto_169478 ?auto_169481 ) ) ( not ( = ?auto_169479 ?auto_169481 ) ) ( not ( = ?auto_169480 ?auto_169481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169473 ?auto_169481 )
      ( MAKE-5PILE ?auto_169473 ?auto_169474 ?auto_169475 ?auto_169476 ?auto_169477 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169482 - BLOCK
      ?auto_169483 - BLOCK
      ?auto_169484 - BLOCK
      ?auto_169485 - BLOCK
      ?auto_169486 - BLOCK
    )
    :vars
    (
      ?auto_169490 - BLOCK
      ?auto_169488 - BLOCK
      ?auto_169489 - BLOCK
      ?auto_169487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169482 ?auto_169483 ) ) ( not ( = ?auto_169482 ?auto_169484 ) ) ( not ( = ?auto_169482 ?auto_169485 ) ) ( not ( = ?auto_169482 ?auto_169486 ) ) ( not ( = ?auto_169483 ?auto_169484 ) ) ( not ( = ?auto_169483 ?auto_169485 ) ) ( not ( = ?auto_169483 ?auto_169486 ) ) ( not ( = ?auto_169484 ?auto_169485 ) ) ( not ( = ?auto_169484 ?auto_169486 ) ) ( not ( = ?auto_169485 ?auto_169486 ) ) ( ON ?auto_169486 ?auto_169490 ) ( not ( = ?auto_169482 ?auto_169490 ) ) ( not ( = ?auto_169483 ?auto_169490 ) ) ( not ( = ?auto_169484 ?auto_169490 ) ) ( not ( = ?auto_169485 ?auto_169490 ) ) ( not ( = ?auto_169486 ?auto_169490 ) ) ( ON ?auto_169485 ?auto_169486 ) ( ON-TABLE ?auto_169488 ) ( ON ?auto_169489 ?auto_169488 ) ( ON ?auto_169490 ?auto_169489 ) ( not ( = ?auto_169488 ?auto_169489 ) ) ( not ( = ?auto_169488 ?auto_169490 ) ) ( not ( = ?auto_169488 ?auto_169486 ) ) ( not ( = ?auto_169488 ?auto_169485 ) ) ( not ( = ?auto_169489 ?auto_169490 ) ) ( not ( = ?auto_169489 ?auto_169486 ) ) ( not ( = ?auto_169489 ?auto_169485 ) ) ( not ( = ?auto_169482 ?auto_169488 ) ) ( not ( = ?auto_169482 ?auto_169489 ) ) ( not ( = ?auto_169483 ?auto_169488 ) ) ( not ( = ?auto_169483 ?auto_169489 ) ) ( not ( = ?auto_169484 ?auto_169488 ) ) ( not ( = ?auto_169484 ?auto_169489 ) ) ( ON ?auto_169484 ?auto_169485 ) ( ON ?auto_169482 ?auto_169487 ) ( CLEAR ?auto_169482 ) ( not ( = ?auto_169482 ?auto_169487 ) ) ( not ( = ?auto_169483 ?auto_169487 ) ) ( not ( = ?auto_169484 ?auto_169487 ) ) ( not ( = ?auto_169485 ?auto_169487 ) ) ( not ( = ?auto_169486 ?auto_169487 ) ) ( not ( = ?auto_169490 ?auto_169487 ) ) ( not ( = ?auto_169488 ?auto_169487 ) ) ( not ( = ?auto_169489 ?auto_169487 ) ) ( HOLDING ?auto_169483 ) ( CLEAR ?auto_169484 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169488 ?auto_169489 ?auto_169490 ?auto_169486 ?auto_169485 ?auto_169484 ?auto_169483 )
      ( MAKE-5PILE ?auto_169482 ?auto_169483 ?auto_169484 ?auto_169485 ?auto_169486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169491 - BLOCK
      ?auto_169492 - BLOCK
      ?auto_169493 - BLOCK
      ?auto_169494 - BLOCK
      ?auto_169495 - BLOCK
    )
    :vars
    (
      ?auto_169498 - BLOCK
      ?auto_169496 - BLOCK
      ?auto_169497 - BLOCK
      ?auto_169499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169491 ?auto_169492 ) ) ( not ( = ?auto_169491 ?auto_169493 ) ) ( not ( = ?auto_169491 ?auto_169494 ) ) ( not ( = ?auto_169491 ?auto_169495 ) ) ( not ( = ?auto_169492 ?auto_169493 ) ) ( not ( = ?auto_169492 ?auto_169494 ) ) ( not ( = ?auto_169492 ?auto_169495 ) ) ( not ( = ?auto_169493 ?auto_169494 ) ) ( not ( = ?auto_169493 ?auto_169495 ) ) ( not ( = ?auto_169494 ?auto_169495 ) ) ( ON ?auto_169495 ?auto_169498 ) ( not ( = ?auto_169491 ?auto_169498 ) ) ( not ( = ?auto_169492 ?auto_169498 ) ) ( not ( = ?auto_169493 ?auto_169498 ) ) ( not ( = ?auto_169494 ?auto_169498 ) ) ( not ( = ?auto_169495 ?auto_169498 ) ) ( ON ?auto_169494 ?auto_169495 ) ( ON-TABLE ?auto_169496 ) ( ON ?auto_169497 ?auto_169496 ) ( ON ?auto_169498 ?auto_169497 ) ( not ( = ?auto_169496 ?auto_169497 ) ) ( not ( = ?auto_169496 ?auto_169498 ) ) ( not ( = ?auto_169496 ?auto_169495 ) ) ( not ( = ?auto_169496 ?auto_169494 ) ) ( not ( = ?auto_169497 ?auto_169498 ) ) ( not ( = ?auto_169497 ?auto_169495 ) ) ( not ( = ?auto_169497 ?auto_169494 ) ) ( not ( = ?auto_169491 ?auto_169496 ) ) ( not ( = ?auto_169491 ?auto_169497 ) ) ( not ( = ?auto_169492 ?auto_169496 ) ) ( not ( = ?auto_169492 ?auto_169497 ) ) ( not ( = ?auto_169493 ?auto_169496 ) ) ( not ( = ?auto_169493 ?auto_169497 ) ) ( ON ?auto_169493 ?auto_169494 ) ( ON ?auto_169491 ?auto_169499 ) ( not ( = ?auto_169491 ?auto_169499 ) ) ( not ( = ?auto_169492 ?auto_169499 ) ) ( not ( = ?auto_169493 ?auto_169499 ) ) ( not ( = ?auto_169494 ?auto_169499 ) ) ( not ( = ?auto_169495 ?auto_169499 ) ) ( not ( = ?auto_169498 ?auto_169499 ) ) ( not ( = ?auto_169496 ?auto_169499 ) ) ( not ( = ?auto_169497 ?auto_169499 ) ) ( CLEAR ?auto_169493 ) ( ON ?auto_169492 ?auto_169491 ) ( CLEAR ?auto_169492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169499 ?auto_169491 )
      ( MAKE-5PILE ?auto_169491 ?auto_169492 ?auto_169493 ?auto_169494 ?auto_169495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169500 - BLOCK
      ?auto_169501 - BLOCK
      ?auto_169502 - BLOCK
      ?auto_169503 - BLOCK
      ?auto_169504 - BLOCK
    )
    :vars
    (
      ?auto_169508 - BLOCK
      ?auto_169505 - BLOCK
      ?auto_169506 - BLOCK
      ?auto_169507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169500 ?auto_169501 ) ) ( not ( = ?auto_169500 ?auto_169502 ) ) ( not ( = ?auto_169500 ?auto_169503 ) ) ( not ( = ?auto_169500 ?auto_169504 ) ) ( not ( = ?auto_169501 ?auto_169502 ) ) ( not ( = ?auto_169501 ?auto_169503 ) ) ( not ( = ?auto_169501 ?auto_169504 ) ) ( not ( = ?auto_169502 ?auto_169503 ) ) ( not ( = ?auto_169502 ?auto_169504 ) ) ( not ( = ?auto_169503 ?auto_169504 ) ) ( ON ?auto_169504 ?auto_169508 ) ( not ( = ?auto_169500 ?auto_169508 ) ) ( not ( = ?auto_169501 ?auto_169508 ) ) ( not ( = ?auto_169502 ?auto_169508 ) ) ( not ( = ?auto_169503 ?auto_169508 ) ) ( not ( = ?auto_169504 ?auto_169508 ) ) ( ON ?auto_169503 ?auto_169504 ) ( ON-TABLE ?auto_169505 ) ( ON ?auto_169506 ?auto_169505 ) ( ON ?auto_169508 ?auto_169506 ) ( not ( = ?auto_169505 ?auto_169506 ) ) ( not ( = ?auto_169505 ?auto_169508 ) ) ( not ( = ?auto_169505 ?auto_169504 ) ) ( not ( = ?auto_169505 ?auto_169503 ) ) ( not ( = ?auto_169506 ?auto_169508 ) ) ( not ( = ?auto_169506 ?auto_169504 ) ) ( not ( = ?auto_169506 ?auto_169503 ) ) ( not ( = ?auto_169500 ?auto_169505 ) ) ( not ( = ?auto_169500 ?auto_169506 ) ) ( not ( = ?auto_169501 ?auto_169505 ) ) ( not ( = ?auto_169501 ?auto_169506 ) ) ( not ( = ?auto_169502 ?auto_169505 ) ) ( not ( = ?auto_169502 ?auto_169506 ) ) ( ON ?auto_169500 ?auto_169507 ) ( not ( = ?auto_169500 ?auto_169507 ) ) ( not ( = ?auto_169501 ?auto_169507 ) ) ( not ( = ?auto_169502 ?auto_169507 ) ) ( not ( = ?auto_169503 ?auto_169507 ) ) ( not ( = ?auto_169504 ?auto_169507 ) ) ( not ( = ?auto_169508 ?auto_169507 ) ) ( not ( = ?auto_169505 ?auto_169507 ) ) ( not ( = ?auto_169506 ?auto_169507 ) ) ( ON ?auto_169501 ?auto_169500 ) ( CLEAR ?auto_169501 ) ( ON-TABLE ?auto_169507 ) ( HOLDING ?auto_169502 ) ( CLEAR ?auto_169503 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169505 ?auto_169506 ?auto_169508 ?auto_169504 ?auto_169503 ?auto_169502 )
      ( MAKE-5PILE ?auto_169500 ?auto_169501 ?auto_169502 ?auto_169503 ?auto_169504 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169509 - BLOCK
      ?auto_169510 - BLOCK
      ?auto_169511 - BLOCK
      ?auto_169512 - BLOCK
      ?auto_169513 - BLOCK
    )
    :vars
    (
      ?auto_169515 - BLOCK
      ?auto_169514 - BLOCK
      ?auto_169516 - BLOCK
      ?auto_169517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169509 ?auto_169510 ) ) ( not ( = ?auto_169509 ?auto_169511 ) ) ( not ( = ?auto_169509 ?auto_169512 ) ) ( not ( = ?auto_169509 ?auto_169513 ) ) ( not ( = ?auto_169510 ?auto_169511 ) ) ( not ( = ?auto_169510 ?auto_169512 ) ) ( not ( = ?auto_169510 ?auto_169513 ) ) ( not ( = ?auto_169511 ?auto_169512 ) ) ( not ( = ?auto_169511 ?auto_169513 ) ) ( not ( = ?auto_169512 ?auto_169513 ) ) ( ON ?auto_169513 ?auto_169515 ) ( not ( = ?auto_169509 ?auto_169515 ) ) ( not ( = ?auto_169510 ?auto_169515 ) ) ( not ( = ?auto_169511 ?auto_169515 ) ) ( not ( = ?auto_169512 ?auto_169515 ) ) ( not ( = ?auto_169513 ?auto_169515 ) ) ( ON ?auto_169512 ?auto_169513 ) ( ON-TABLE ?auto_169514 ) ( ON ?auto_169516 ?auto_169514 ) ( ON ?auto_169515 ?auto_169516 ) ( not ( = ?auto_169514 ?auto_169516 ) ) ( not ( = ?auto_169514 ?auto_169515 ) ) ( not ( = ?auto_169514 ?auto_169513 ) ) ( not ( = ?auto_169514 ?auto_169512 ) ) ( not ( = ?auto_169516 ?auto_169515 ) ) ( not ( = ?auto_169516 ?auto_169513 ) ) ( not ( = ?auto_169516 ?auto_169512 ) ) ( not ( = ?auto_169509 ?auto_169514 ) ) ( not ( = ?auto_169509 ?auto_169516 ) ) ( not ( = ?auto_169510 ?auto_169514 ) ) ( not ( = ?auto_169510 ?auto_169516 ) ) ( not ( = ?auto_169511 ?auto_169514 ) ) ( not ( = ?auto_169511 ?auto_169516 ) ) ( ON ?auto_169509 ?auto_169517 ) ( not ( = ?auto_169509 ?auto_169517 ) ) ( not ( = ?auto_169510 ?auto_169517 ) ) ( not ( = ?auto_169511 ?auto_169517 ) ) ( not ( = ?auto_169512 ?auto_169517 ) ) ( not ( = ?auto_169513 ?auto_169517 ) ) ( not ( = ?auto_169515 ?auto_169517 ) ) ( not ( = ?auto_169514 ?auto_169517 ) ) ( not ( = ?auto_169516 ?auto_169517 ) ) ( ON ?auto_169510 ?auto_169509 ) ( ON-TABLE ?auto_169517 ) ( CLEAR ?auto_169512 ) ( ON ?auto_169511 ?auto_169510 ) ( CLEAR ?auto_169511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169517 ?auto_169509 ?auto_169510 )
      ( MAKE-5PILE ?auto_169509 ?auto_169510 ?auto_169511 ?auto_169512 ?auto_169513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169518 - BLOCK
      ?auto_169519 - BLOCK
      ?auto_169520 - BLOCK
      ?auto_169521 - BLOCK
      ?auto_169522 - BLOCK
    )
    :vars
    (
      ?auto_169526 - BLOCK
      ?auto_169523 - BLOCK
      ?auto_169525 - BLOCK
      ?auto_169524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169518 ?auto_169519 ) ) ( not ( = ?auto_169518 ?auto_169520 ) ) ( not ( = ?auto_169518 ?auto_169521 ) ) ( not ( = ?auto_169518 ?auto_169522 ) ) ( not ( = ?auto_169519 ?auto_169520 ) ) ( not ( = ?auto_169519 ?auto_169521 ) ) ( not ( = ?auto_169519 ?auto_169522 ) ) ( not ( = ?auto_169520 ?auto_169521 ) ) ( not ( = ?auto_169520 ?auto_169522 ) ) ( not ( = ?auto_169521 ?auto_169522 ) ) ( ON ?auto_169522 ?auto_169526 ) ( not ( = ?auto_169518 ?auto_169526 ) ) ( not ( = ?auto_169519 ?auto_169526 ) ) ( not ( = ?auto_169520 ?auto_169526 ) ) ( not ( = ?auto_169521 ?auto_169526 ) ) ( not ( = ?auto_169522 ?auto_169526 ) ) ( ON-TABLE ?auto_169523 ) ( ON ?auto_169525 ?auto_169523 ) ( ON ?auto_169526 ?auto_169525 ) ( not ( = ?auto_169523 ?auto_169525 ) ) ( not ( = ?auto_169523 ?auto_169526 ) ) ( not ( = ?auto_169523 ?auto_169522 ) ) ( not ( = ?auto_169523 ?auto_169521 ) ) ( not ( = ?auto_169525 ?auto_169526 ) ) ( not ( = ?auto_169525 ?auto_169522 ) ) ( not ( = ?auto_169525 ?auto_169521 ) ) ( not ( = ?auto_169518 ?auto_169523 ) ) ( not ( = ?auto_169518 ?auto_169525 ) ) ( not ( = ?auto_169519 ?auto_169523 ) ) ( not ( = ?auto_169519 ?auto_169525 ) ) ( not ( = ?auto_169520 ?auto_169523 ) ) ( not ( = ?auto_169520 ?auto_169525 ) ) ( ON ?auto_169518 ?auto_169524 ) ( not ( = ?auto_169518 ?auto_169524 ) ) ( not ( = ?auto_169519 ?auto_169524 ) ) ( not ( = ?auto_169520 ?auto_169524 ) ) ( not ( = ?auto_169521 ?auto_169524 ) ) ( not ( = ?auto_169522 ?auto_169524 ) ) ( not ( = ?auto_169526 ?auto_169524 ) ) ( not ( = ?auto_169523 ?auto_169524 ) ) ( not ( = ?auto_169525 ?auto_169524 ) ) ( ON ?auto_169519 ?auto_169518 ) ( ON-TABLE ?auto_169524 ) ( ON ?auto_169520 ?auto_169519 ) ( CLEAR ?auto_169520 ) ( HOLDING ?auto_169521 ) ( CLEAR ?auto_169522 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169523 ?auto_169525 ?auto_169526 ?auto_169522 ?auto_169521 )
      ( MAKE-5PILE ?auto_169518 ?auto_169519 ?auto_169520 ?auto_169521 ?auto_169522 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169527 - BLOCK
      ?auto_169528 - BLOCK
      ?auto_169529 - BLOCK
      ?auto_169530 - BLOCK
      ?auto_169531 - BLOCK
    )
    :vars
    (
      ?auto_169535 - BLOCK
      ?auto_169532 - BLOCK
      ?auto_169533 - BLOCK
      ?auto_169534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169527 ?auto_169528 ) ) ( not ( = ?auto_169527 ?auto_169529 ) ) ( not ( = ?auto_169527 ?auto_169530 ) ) ( not ( = ?auto_169527 ?auto_169531 ) ) ( not ( = ?auto_169528 ?auto_169529 ) ) ( not ( = ?auto_169528 ?auto_169530 ) ) ( not ( = ?auto_169528 ?auto_169531 ) ) ( not ( = ?auto_169529 ?auto_169530 ) ) ( not ( = ?auto_169529 ?auto_169531 ) ) ( not ( = ?auto_169530 ?auto_169531 ) ) ( ON ?auto_169531 ?auto_169535 ) ( not ( = ?auto_169527 ?auto_169535 ) ) ( not ( = ?auto_169528 ?auto_169535 ) ) ( not ( = ?auto_169529 ?auto_169535 ) ) ( not ( = ?auto_169530 ?auto_169535 ) ) ( not ( = ?auto_169531 ?auto_169535 ) ) ( ON-TABLE ?auto_169532 ) ( ON ?auto_169533 ?auto_169532 ) ( ON ?auto_169535 ?auto_169533 ) ( not ( = ?auto_169532 ?auto_169533 ) ) ( not ( = ?auto_169532 ?auto_169535 ) ) ( not ( = ?auto_169532 ?auto_169531 ) ) ( not ( = ?auto_169532 ?auto_169530 ) ) ( not ( = ?auto_169533 ?auto_169535 ) ) ( not ( = ?auto_169533 ?auto_169531 ) ) ( not ( = ?auto_169533 ?auto_169530 ) ) ( not ( = ?auto_169527 ?auto_169532 ) ) ( not ( = ?auto_169527 ?auto_169533 ) ) ( not ( = ?auto_169528 ?auto_169532 ) ) ( not ( = ?auto_169528 ?auto_169533 ) ) ( not ( = ?auto_169529 ?auto_169532 ) ) ( not ( = ?auto_169529 ?auto_169533 ) ) ( ON ?auto_169527 ?auto_169534 ) ( not ( = ?auto_169527 ?auto_169534 ) ) ( not ( = ?auto_169528 ?auto_169534 ) ) ( not ( = ?auto_169529 ?auto_169534 ) ) ( not ( = ?auto_169530 ?auto_169534 ) ) ( not ( = ?auto_169531 ?auto_169534 ) ) ( not ( = ?auto_169535 ?auto_169534 ) ) ( not ( = ?auto_169532 ?auto_169534 ) ) ( not ( = ?auto_169533 ?auto_169534 ) ) ( ON ?auto_169528 ?auto_169527 ) ( ON-TABLE ?auto_169534 ) ( ON ?auto_169529 ?auto_169528 ) ( CLEAR ?auto_169531 ) ( ON ?auto_169530 ?auto_169529 ) ( CLEAR ?auto_169530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169534 ?auto_169527 ?auto_169528 ?auto_169529 )
      ( MAKE-5PILE ?auto_169527 ?auto_169528 ?auto_169529 ?auto_169530 ?auto_169531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169536 - BLOCK
      ?auto_169537 - BLOCK
      ?auto_169538 - BLOCK
      ?auto_169539 - BLOCK
      ?auto_169540 - BLOCK
    )
    :vars
    (
      ?auto_169542 - BLOCK
      ?auto_169541 - BLOCK
      ?auto_169543 - BLOCK
      ?auto_169544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169536 ?auto_169537 ) ) ( not ( = ?auto_169536 ?auto_169538 ) ) ( not ( = ?auto_169536 ?auto_169539 ) ) ( not ( = ?auto_169536 ?auto_169540 ) ) ( not ( = ?auto_169537 ?auto_169538 ) ) ( not ( = ?auto_169537 ?auto_169539 ) ) ( not ( = ?auto_169537 ?auto_169540 ) ) ( not ( = ?auto_169538 ?auto_169539 ) ) ( not ( = ?auto_169538 ?auto_169540 ) ) ( not ( = ?auto_169539 ?auto_169540 ) ) ( not ( = ?auto_169536 ?auto_169542 ) ) ( not ( = ?auto_169537 ?auto_169542 ) ) ( not ( = ?auto_169538 ?auto_169542 ) ) ( not ( = ?auto_169539 ?auto_169542 ) ) ( not ( = ?auto_169540 ?auto_169542 ) ) ( ON-TABLE ?auto_169541 ) ( ON ?auto_169543 ?auto_169541 ) ( ON ?auto_169542 ?auto_169543 ) ( not ( = ?auto_169541 ?auto_169543 ) ) ( not ( = ?auto_169541 ?auto_169542 ) ) ( not ( = ?auto_169541 ?auto_169540 ) ) ( not ( = ?auto_169541 ?auto_169539 ) ) ( not ( = ?auto_169543 ?auto_169542 ) ) ( not ( = ?auto_169543 ?auto_169540 ) ) ( not ( = ?auto_169543 ?auto_169539 ) ) ( not ( = ?auto_169536 ?auto_169541 ) ) ( not ( = ?auto_169536 ?auto_169543 ) ) ( not ( = ?auto_169537 ?auto_169541 ) ) ( not ( = ?auto_169537 ?auto_169543 ) ) ( not ( = ?auto_169538 ?auto_169541 ) ) ( not ( = ?auto_169538 ?auto_169543 ) ) ( ON ?auto_169536 ?auto_169544 ) ( not ( = ?auto_169536 ?auto_169544 ) ) ( not ( = ?auto_169537 ?auto_169544 ) ) ( not ( = ?auto_169538 ?auto_169544 ) ) ( not ( = ?auto_169539 ?auto_169544 ) ) ( not ( = ?auto_169540 ?auto_169544 ) ) ( not ( = ?auto_169542 ?auto_169544 ) ) ( not ( = ?auto_169541 ?auto_169544 ) ) ( not ( = ?auto_169543 ?auto_169544 ) ) ( ON ?auto_169537 ?auto_169536 ) ( ON-TABLE ?auto_169544 ) ( ON ?auto_169538 ?auto_169537 ) ( ON ?auto_169539 ?auto_169538 ) ( CLEAR ?auto_169539 ) ( HOLDING ?auto_169540 ) ( CLEAR ?auto_169542 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169541 ?auto_169543 ?auto_169542 ?auto_169540 )
      ( MAKE-5PILE ?auto_169536 ?auto_169537 ?auto_169538 ?auto_169539 ?auto_169540 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169545 - BLOCK
      ?auto_169546 - BLOCK
      ?auto_169547 - BLOCK
      ?auto_169548 - BLOCK
      ?auto_169549 - BLOCK
    )
    :vars
    (
      ?auto_169551 - BLOCK
      ?auto_169550 - BLOCK
      ?auto_169553 - BLOCK
      ?auto_169552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169545 ?auto_169546 ) ) ( not ( = ?auto_169545 ?auto_169547 ) ) ( not ( = ?auto_169545 ?auto_169548 ) ) ( not ( = ?auto_169545 ?auto_169549 ) ) ( not ( = ?auto_169546 ?auto_169547 ) ) ( not ( = ?auto_169546 ?auto_169548 ) ) ( not ( = ?auto_169546 ?auto_169549 ) ) ( not ( = ?auto_169547 ?auto_169548 ) ) ( not ( = ?auto_169547 ?auto_169549 ) ) ( not ( = ?auto_169548 ?auto_169549 ) ) ( not ( = ?auto_169545 ?auto_169551 ) ) ( not ( = ?auto_169546 ?auto_169551 ) ) ( not ( = ?auto_169547 ?auto_169551 ) ) ( not ( = ?auto_169548 ?auto_169551 ) ) ( not ( = ?auto_169549 ?auto_169551 ) ) ( ON-TABLE ?auto_169550 ) ( ON ?auto_169553 ?auto_169550 ) ( ON ?auto_169551 ?auto_169553 ) ( not ( = ?auto_169550 ?auto_169553 ) ) ( not ( = ?auto_169550 ?auto_169551 ) ) ( not ( = ?auto_169550 ?auto_169549 ) ) ( not ( = ?auto_169550 ?auto_169548 ) ) ( not ( = ?auto_169553 ?auto_169551 ) ) ( not ( = ?auto_169553 ?auto_169549 ) ) ( not ( = ?auto_169553 ?auto_169548 ) ) ( not ( = ?auto_169545 ?auto_169550 ) ) ( not ( = ?auto_169545 ?auto_169553 ) ) ( not ( = ?auto_169546 ?auto_169550 ) ) ( not ( = ?auto_169546 ?auto_169553 ) ) ( not ( = ?auto_169547 ?auto_169550 ) ) ( not ( = ?auto_169547 ?auto_169553 ) ) ( ON ?auto_169545 ?auto_169552 ) ( not ( = ?auto_169545 ?auto_169552 ) ) ( not ( = ?auto_169546 ?auto_169552 ) ) ( not ( = ?auto_169547 ?auto_169552 ) ) ( not ( = ?auto_169548 ?auto_169552 ) ) ( not ( = ?auto_169549 ?auto_169552 ) ) ( not ( = ?auto_169551 ?auto_169552 ) ) ( not ( = ?auto_169550 ?auto_169552 ) ) ( not ( = ?auto_169553 ?auto_169552 ) ) ( ON ?auto_169546 ?auto_169545 ) ( ON-TABLE ?auto_169552 ) ( ON ?auto_169547 ?auto_169546 ) ( ON ?auto_169548 ?auto_169547 ) ( CLEAR ?auto_169551 ) ( ON ?auto_169549 ?auto_169548 ) ( CLEAR ?auto_169549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169552 ?auto_169545 ?auto_169546 ?auto_169547 ?auto_169548 )
      ( MAKE-5PILE ?auto_169545 ?auto_169546 ?auto_169547 ?auto_169548 ?auto_169549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169554 - BLOCK
      ?auto_169555 - BLOCK
      ?auto_169556 - BLOCK
      ?auto_169557 - BLOCK
      ?auto_169558 - BLOCK
    )
    :vars
    (
      ?auto_169559 - BLOCK
      ?auto_169561 - BLOCK
      ?auto_169560 - BLOCK
      ?auto_169562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169554 ?auto_169555 ) ) ( not ( = ?auto_169554 ?auto_169556 ) ) ( not ( = ?auto_169554 ?auto_169557 ) ) ( not ( = ?auto_169554 ?auto_169558 ) ) ( not ( = ?auto_169555 ?auto_169556 ) ) ( not ( = ?auto_169555 ?auto_169557 ) ) ( not ( = ?auto_169555 ?auto_169558 ) ) ( not ( = ?auto_169556 ?auto_169557 ) ) ( not ( = ?auto_169556 ?auto_169558 ) ) ( not ( = ?auto_169557 ?auto_169558 ) ) ( not ( = ?auto_169554 ?auto_169559 ) ) ( not ( = ?auto_169555 ?auto_169559 ) ) ( not ( = ?auto_169556 ?auto_169559 ) ) ( not ( = ?auto_169557 ?auto_169559 ) ) ( not ( = ?auto_169558 ?auto_169559 ) ) ( ON-TABLE ?auto_169561 ) ( ON ?auto_169560 ?auto_169561 ) ( not ( = ?auto_169561 ?auto_169560 ) ) ( not ( = ?auto_169561 ?auto_169559 ) ) ( not ( = ?auto_169561 ?auto_169558 ) ) ( not ( = ?auto_169561 ?auto_169557 ) ) ( not ( = ?auto_169560 ?auto_169559 ) ) ( not ( = ?auto_169560 ?auto_169558 ) ) ( not ( = ?auto_169560 ?auto_169557 ) ) ( not ( = ?auto_169554 ?auto_169561 ) ) ( not ( = ?auto_169554 ?auto_169560 ) ) ( not ( = ?auto_169555 ?auto_169561 ) ) ( not ( = ?auto_169555 ?auto_169560 ) ) ( not ( = ?auto_169556 ?auto_169561 ) ) ( not ( = ?auto_169556 ?auto_169560 ) ) ( ON ?auto_169554 ?auto_169562 ) ( not ( = ?auto_169554 ?auto_169562 ) ) ( not ( = ?auto_169555 ?auto_169562 ) ) ( not ( = ?auto_169556 ?auto_169562 ) ) ( not ( = ?auto_169557 ?auto_169562 ) ) ( not ( = ?auto_169558 ?auto_169562 ) ) ( not ( = ?auto_169559 ?auto_169562 ) ) ( not ( = ?auto_169561 ?auto_169562 ) ) ( not ( = ?auto_169560 ?auto_169562 ) ) ( ON ?auto_169555 ?auto_169554 ) ( ON-TABLE ?auto_169562 ) ( ON ?auto_169556 ?auto_169555 ) ( ON ?auto_169557 ?auto_169556 ) ( ON ?auto_169558 ?auto_169557 ) ( CLEAR ?auto_169558 ) ( HOLDING ?auto_169559 ) ( CLEAR ?auto_169560 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169561 ?auto_169560 ?auto_169559 )
      ( MAKE-5PILE ?auto_169554 ?auto_169555 ?auto_169556 ?auto_169557 ?auto_169558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169563 - BLOCK
      ?auto_169564 - BLOCK
      ?auto_169565 - BLOCK
      ?auto_169566 - BLOCK
      ?auto_169567 - BLOCK
    )
    :vars
    (
      ?auto_169569 - BLOCK
      ?auto_169570 - BLOCK
      ?auto_169568 - BLOCK
      ?auto_169571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169563 ?auto_169564 ) ) ( not ( = ?auto_169563 ?auto_169565 ) ) ( not ( = ?auto_169563 ?auto_169566 ) ) ( not ( = ?auto_169563 ?auto_169567 ) ) ( not ( = ?auto_169564 ?auto_169565 ) ) ( not ( = ?auto_169564 ?auto_169566 ) ) ( not ( = ?auto_169564 ?auto_169567 ) ) ( not ( = ?auto_169565 ?auto_169566 ) ) ( not ( = ?auto_169565 ?auto_169567 ) ) ( not ( = ?auto_169566 ?auto_169567 ) ) ( not ( = ?auto_169563 ?auto_169569 ) ) ( not ( = ?auto_169564 ?auto_169569 ) ) ( not ( = ?auto_169565 ?auto_169569 ) ) ( not ( = ?auto_169566 ?auto_169569 ) ) ( not ( = ?auto_169567 ?auto_169569 ) ) ( ON-TABLE ?auto_169570 ) ( ON ?auto_169568 ?auto_169570 ) ( not ( = ?auto_169570 ?auto_169568 ) ) ( not ( = ?auto_169570 ?auto_169569 ) ) ( not ( = ?auto_169570 ?auto_169567 ) ) ( not ( = ?auto_169570 ?auto_169566 ) ) ( not ( = ?auto_169568 ?auto_169569 ) ) ( not ( = ?auto_169568 ?auto_169567 ) ) ( not ( = ?auto_169568 ?auto_169566 ) ) ( not ( = ?auto_169563 ?auto_169570 ) ) ( not ( = ?auto_169563 ?auto_169568 ) ) ( not ( = ?auto_169564 ?auto_169570 ) ) ( not ( = ?auto_169564 ?auto_169568 ) ) ( not ( = ?auto_169565 ?auto_169570 ) ) ( not ( = ?auto_169565 ?auto_169568 ) ) ( ON ?auto_169563 ?auto_169571 ) ( not ( = ?auto_169563 ?auto_169571 ) ) ( not ( = ?auto_169564 ?auto_169571 ) ) ( not ( = ?auto_169565 ?auto_169571 ) ) ( not ( = ?auto_169566 ?auto_169571 ) ) ( not ( = ?auto_169567 ?auto_169571 ) ) ( not ( = ?auto_169569 ?auto_169571 ) ) ( not ( = ?auto_169570 ?auto_169571 ) ) ( not ( = ?auto_169568 ?auto_169571 ) ) ( ON ?auto_169564 ?auto_169563 ) ( ON-TABLE ?auto_169571 ) ( ON ?auto_169565 ?auto_169564 ) ( ON ?auto_169566 ?auto_169565 ) ( ON ?auto_169567 ?auto_169566 ) ( CLEAR ?auto_169568 ) ( ON ?auto_169569 ?auto_169567 ) ( CLEAR ?auto_169569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169571 ?auto_169563 ?auto_169564 ?auto_169565 ?auto_169566 ?auto_169567 )
      ( MAKE-5PILE ?auto_169563 ?auto_169564 ?auto_169565 ?auto_169566 ?auto_169567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169572 - BLOCK
      ?auto_169573 - BLOCK
      ?auto_169574 - BLOCK
      ?auto_169575 - BLOCK
      ?auto_169576 - BLOCK
    )
    :vars
    (
      ?auto_169577 - BLOCK
      ?auto_169578 - BLOCK
      ?auto_169579 - BLOCK
      ?auto_169580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169572 ?auto_169573 ) ) ( not ( = ?auto_169572 ?auto_169574 ) ) ( not ( = ?auto_169572 ?auto_169575 ) ) ( not ( = ?auto_169572 ?auto_169576 ) ) ( not ( = ?auto_169573 ?auto_169574 ) ) ( not ( = ?auto_169573 ?auto_169575 ) ) ( not ( = ?auto_169573 ?auto_169576 ) ) ( not ( = ?auto_169574 ?auto_169575 ) ) ( not ( = ?auto_169574 ?auto_169576 ) ) ( not ( = ?auto_169575 ?auto_169576 ) ) ( not ( = ?auto_169572 ?auto_169577 ) ) ( not ( = ?auto_169573 ?auto_169577 ) ) ( not ( = ?auto_169574 ?auto_169577 ) ) ( not ( = ?auto_169575 ?auto_169577 ) ) ( not ( = ?auto_169576 ?auto_169577 ) ) ( ON-TABLE ?auto_169578 ) ( not ( = ?auto_169578 ?auto_169579 ) ) ( not ( = ?auto_169578 ?auto_169577 ) ) ( not ( = ?auto_169578 ?auto_169576 ) ) ( not ( = ?auto_169578 ?auto_169575 ) ) ( not ( = ?auto_169579 ?auto_169577 ) ) ( not ( = ?auto_169579 ?auto_169576 ) ) ( not ( = ?auto_169579 ?auto_169575 ) ) ( not ( = ?auto_169572 ?auto_169578 ) ) ( not ( = ?auto_169572 ?auto_169579 ) ) ( not ( = ?auto_169573 ?auto_169578 ) ) ( not ( = ?auto_169573 ?auto_169579 ) ) ( not ( = ?auto_169574 ?auto_169578 ) ) ( not ( = ?auto_169574 ?auto_169579 ) ) ( ON ?auto_169572 ?auto_169580 ) ( not ( = ?auto_169572 ?auto_169580 ) ) ( not ( = ?auto_169573 ?auto_169580 ) ) ( not ( = ?auto_169574 ?auto_169580 ) ) ( not ( = ?auto_169575 ?auto_169580 ) ) ( not ( = ?auto_169576 ?auto_169580 ) ) ( not ( = ?auto_169577 ?auto_169580 ) ) ( not ( = ?auto_169578 ?auto_169580 ) ) ( not ( = ?auto_169579 ?auto_169580 ) ) ( ON ?auto_169573 ?auto_169572 ) ( ON-TABLE ?auto_169580 ) ( ON ?auto_169574 ?auto_169573 ) ( ON ?auto_169575 ?auto_169574 ) ( ON ?auto_169576 ?auto_169575 ) ( ON ?auto_169577 ?auto_169576 ) ( CLEAR ?auto_169577 ) ( HOLDING ?auto_169579 ) ( CLEAR ?auto_169578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169578 ?auto_169579 )
      ( MAKE-5PILE ?auto_169572 ?auto_169573 ?auto_169574 ?auto_169575 ?auto_169576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169581 - BLOCK
      ?auto_169582 - BLOCK
      ?auto_169583 - BLOCK
      ?auto_169584 - BLOCK
      ?auto_169585 - BLOCK
    )
    :vars
    (
      ?auto_169588 - BLOCK
      ?auto_169587 - BLOCK
      ?auto_169589 - BLOCK
      ?auto_169586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169581 ?auto_169582 ) ) ( not ( = ?auto_169581 ?auto_169583 ) ) ( not ( = ?auto_169581 ?auto_169584 ) ) ( not ( = ?auto_169581 ?auto_169585 ) ) ( not ( = ?auto_169582 ?auto_169583 ) ) ( not ( = ?auto_169582 ?auto_169584 ) ) ( not ( = ?auto_169582 ?auto_169585 ) ) ( not ( = ?auto_169583 ?auto_169584 ) ) ( not ( = ?auto_169583 ?auto_169585 ) ) ( not ( = ?auto_169584 ?auto_169585 ) ) ( not ( = ?auto_169581 ?auto_169588 ) ) ( not ( = ?auto_169582 ?auto_169588 ) ) ( not ( = ?auto_169583 ?auto_169588 ) ) ( not ( = ?auto_169584 ?auto_169588 ) ) ( not ( = ?auto_169585 ?auto_169588 ) ) ( ON-TABLE ?auto_169587 ) ( not ( = ?auto_169587 ?auto_169589 ) ) ( not ( = ?auto_169587 ?auto_169588 ) ) ( not ( = ?auto_169587 ?auto_169585 ) ) ( not ( = ?auto_169587 ?auto_169584 ) ) ( not ( = ?auto_169589 ?auto_169588 ) ) ( not ( = ?auto_169589 ?auto_169585 ) ) ( not ( = ?auto_169589 ?auto_169584 ) ) ( not ( = ?auto_169581 ?auto_169587 ) ) ( not ( = ?auto_169581 ?auto_169589 ) ) ( not ( = ?auto_169582 ?auto_169587 ) ) ( not ( = ?auto_169582 ?auto_169589 ) ) ( not ( = ?auto_169583 ?auto_169587 ) ) ( not ( = ?auto_169583 ?auto_169589 ) ) ( ON ?auto_169581 ?auto_169586 ) ( not ( = ?auto_169581 ?auto_169586 ) ) ( not ( = ?auto_169582 ?auto_169586 ) ) ( not ( = ?auto_169583 ?auto_169586 ) ) ( not ( = ?auto_169584 ?auto_169586 ) ) ( not ( = ?auto_169585 ?auto_169586 ) ) ( not ( = ?auto_169588 ?auto_169586 ) ) ( not ( = ?auto_169587 ?auto_169586 ) ) ( not ( = ?auto_169589 ?auto_169586 ) ) ( ON ?auto_169582 ?auto_169581 ) ( ON-TABLE ?auto_169586 ) ( ON ?auto_169583 ?auto_169582 ) ( ON ?auto_169584 ?auto_169583 ) ( ON ?auto_169585 ?auto_169584 ) ( ON ?auto_169588 ?auto_169585 ) ( CLEAR ?auto_169587 ) ( ON ?auto_169589 ?auto_169588 ) ( CLEAR ?auto_169589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169586 ?auto_169581 ?auto_169582 ?auto_169583 ?auto_169584 ?auto_169585 ?auto_169588 )
      ( MAKE-5PILE ?auto_169581 ?auto_169582 ?auto_169583 ?auto_169584 ?auto_169585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169590 - BLOCK
      ?auto_169591 - BLOCK
      ?auto_169592 - BLOCK
      ?auto_169593 - BLOCK
      ?auto_169594 - BLOCK
    )
    :vars
    (
      ?auto_169595 - BLOCK
      ?auto_169598 - BLOCK
      ?auto_169596 - BLOCK
      ?auto_169597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169590 ?auto_169591 ) ) ( not ( = ?auto_169590 ?auto_169592 ) ) ( not ( = ?auto_169590 ?auto_169593 ) ) ( not ( = ?auto_169590 ?auto_169594 ) ) ( not ( = ?auto_169591 ?auto_169592 ) ) ( not ( = ?auto_169591 ?auto_169593 ) ) ( not ( = ?auto_169591 ?auto_169594 ) ) ( not ( = ?auto_169592 ?auto_169593 ) ) ( not ( = ?auto_169592 ?auto_169594 ) ) ( not ( = ?auto_169593 ?auto_169594 ) ) ( not ( = ?auto_169590 ?auto_169595 ) ) ( not ( = ?auto_169591 ?auto_169595 ) ) ( not ( = ?auto_169592 ?auto_169595 ) ) ( not ( = ?auto_169593 ?auto_169595 ) ) ( not ( = ?auto_169594 ?auto_169595 ) ) ( not ( = ?auto_169598 ?auto_169596 ) ) ( not ( = ?auto_169598 ?auto_169595 ) ) ( not ( = ?auto_169598 ?auto_169594 ) ) ( not ( = ?auto_169598 ?auto_169593 ) ) ( not ( = ?auto_169596 ?auto_169595 ) ) ( not ( = ?auto_169596 ?auto_169594 ) ) ( not ( = ?auto_169596 ?auto_169593 ) ) ( not ( = ?auto_169590 ?auto_169598 ) ) ( not ( = ?auto_169590 ?auto_169596 ) ) ( not ( = ?auto_169591 ?auto_169598 ) ) ( not ( = ?auto_169591 ?auto_169596 ) ) ( not ( = ?auto_169592 ?auto_169598 ) ) ( not ( = ?auto_169592 ?auto_169596 ) ) ( ON ?auto_169590 ?auto_169597 ) ( not ( = ?auto_169590 ?auto_169597 ) ) ( not ( = ?auto_169591 ?auto_169597 ) ) ( not ( = ?auto_169592 ?auto_169597 ) ) ( not ( = ?auto_169593 ?auto_169597 ) ) ( not ( = ?auto_169594 ?auto_169597 ) ) ( not ( = ?auto_169595 ?auto_169597 ) ) ( not ( = ?auto_169598 ?auto_169597 ) ) ( not ( = ?auto_169596 ?auto_169597 ) ) ( ON ?auto_169591 ?auto_169590 ) ( ON-TABLE ?auto_169597 ) ( ON ?auto_169592 ?auto_169591 ) ( ON ?auto_169593 ?auto_169592 ) ( ON ?auto_169594 ?auto_169593 ) ( ON ?auto_169595 ?auto_169594 ) ( ON ?auto_169596 ?auto_169595 ) ( CLEAR ?auto_169596 ) ( HOLDING ?auto_169598 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169598 )
      ( MAKE-5PILE ?auto_169590 ?auto_169591 ?auto_169592 ?auto_169593 ?auto_169594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169599 - BLOCK
      ?auto_169600 - BLOCK
      ?auto_169601 - BLOCK
      ?auto_169602 - BLOCK
      ?auto_169603 - BLOCK
    )
    :vars
    (
      ?auto_169606 - BLOCK
      ?auto_169605 - BLOCK
      ?auto_169604 - BLOCK
      ?auto_169607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169599 ?auto_169600 ) ) ( not ( = ?auto_169599 ?auto_169601 ) ) ( not ( = ?auto_169599 ?auto_169602 ) ) ( not ( = ?auto_169599 ?auto_169603 ) ) ( not ( = ?auto_169600 ?auto_169601 ) ) ( not ( = ?auto_169600 ?auto_169602 ) ) ( not ( = ?auto_169600 ?auto_169603 ) ) ( not ( = ?auto_169601 ?auto_169602 ) ) ( not ( = ?auto_169601 ?auto_169603 ) ) ( not ( = ?auto_169602 ?auto_169603 ) ) ( not ( = ?auto_169599 ?auto_169606 ) ) ( not ( = ?auto_169600 ?auto_169606 ) ) ( not ( = ?auto_169601 ?auto_169606 ) ) ( not ( = ?auto_169602 ?auto_169606 ) ) ( not ( = ?auto_169603 ?auto_169606 ) ) ( not ( = ?auto_169605 ?auto_169604 ) ) ( not ( = ?auto_169605 ?auto_169606 ) ) ( not ( = ?auto_169605 ?auto_169603 ) ) ( not ( = ?auto_169605 ?auto_169602 ) ) ( not ( = ?auto_169604 ?auto_169606 ) ) ( not ( = ?auto_169604 ?auto_169603 ) ) ( not ( = ?auto_169604 ?auto_169602 ) ) ( not ( = ?auto_169599 ?auto_169605 ) ) ( not ( = ?auto_169599 ?auto_169604 ) ) ( not ( = ?auto_169600 ?auto_169605 ) ) ( not ( = ?auto_169600 ?auto_169604 ) ) ( not ( = ?auto_169601 ?auto_169605 ) ) ( not ( = ?auto_169601 ?auto_169604 ) ) ( ON ?auto_169599 ?auto_169607 ) ( not ( = ?auto_169599 ?auto_169607 ) ) ( not ( = ?auto_169600 ?auto_169607 ) ) ( not ( = ?auto_169601 ?auto_169607 ) ) ( not ( = ?auto_169602 ?auto_169607 ) ) ( not ( = ?auto_169603 ?auto_169607 ) ) ( not ( = ?auto_169606 ?auto_169607 ) ) ( not ( = ?auto_169605 ?auto_169607 ) ) ( not ( = ?auto_169604 ?auto_169607 ) ) ( ON ?auto_169600 ?auto_169599 ) ( ON-TABLE ?auto_169607 ) ( ON ?auto_169601 ?auto_169600 ) ( ON ?auto_169602 ?auto_169601 ) ( ON ?auto_169603 ?auto_169602 ) ( ON ?auto_169606 ?auto_169603 ) ( ON ?auto_169604 ?auto_169606 ) ( ON ?auto_169605 ?auto_169604 ) ( CLEAR ?auto_169605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169607 ?auto_169599 ?auto_169600 ?auto_169601 ?auto_169602 ?auto_169603 ?auto_169606 ?auto_169604 )
      ( MAKE-5PILE ?auto_169599 ?auto_169600 ?auto_169601 ?auto_169602 ?auto_169603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169610 - BLOCK
      ?auto_169611 - BLOCK
    )
    :vars
    (
      ?auto_169612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169612 ?auto_169611 ) ( CLEAR ?auto_169612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169610 ) ( ON ?auto_169611 ?auto_169610 ) ( not ( = ?auto_169610 ?auto_169611 ) ) ( not ( = ?auto_169610 ?auto_169612 ) ) ( not ( = ?auto_169611 ?auto_169612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169612 ?auto_169611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169613 - BLOCK
      ?auto_169614 - BLOCK
    )
    :vars
    (
      ?auto_169615 - BLOCK
      ?auto_169616 - BLOCK
      ?auto_169617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169615 ?auto_169614 ) ( CLEAR ?auto_169615 ) ( ON-TABLE ?auto_169613 ) ( ON ?auto_169614 ?auto_169613 ) ( not ( = ?auto_169613 ?auto_169614 ) ) ( not ( = ?auto_169613 ?auto_169615 ) ) ( not ( = ?auto_169614 ?auto_169615 ) ) ( HOLDING ?auto_169616 ) ( CLEAR ?auto_169617 ) ( not ( = ?auto_169613 ?auto_169616 ) ) ( not ( = ?auto_169613 ?auto_169617 ) ) ( not ( = ?auto_169614 ?auto_169616 ) ) ( not ( = ?auto_169614 ?auto_169617 ) ) ( not ( = ?auto_169615 ?auto_169616 ) ) ( not ( = ?auto_169615 ?auto_169617 ) ) ( not ( = ?auto_169616 ?auto_169617 ) ) )
    :subtasks
    ( ( !STACK ?auto_169616 ?auto_169617 )
      ( MAKE-2PILE ?auto_169613 ?auto_169614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169618 - BLOCK
      ?auto_169619 - BLOCK
    )
    :vars
    (
      ?auto_169621 - BLOCK
      ?auto_169620 - BLOCK
      ?auto_169622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169621 ?auto_169619 ) ( ON-TABLE ?auto_169618 ) ( ON ?auto_169619 ?auto_169618 ) ( not ( = ?auto_169618 ?auto_169619 ) ) ( not ( = ?auto_169618 ?auto_169621 ) ) ( not ( = ?auto_169619 ?auto_169621 ) ) ( CLEAR ?auto_169620 ) ( not ( = ?auto_169618 ?auto_169622 ) ) ( not ( = ?auto_169618 ?auto_169620 ) ) ( not ( = ?auto_169619 ?auto_169622 ) ) ( not ( = ?auto_169619 ?auto_169620 ) ) ( not ( = ?auto_169621 ?auto_169622 ) ) ( not ( = ?auto_169621 ?auto_169620 ) ) ( not ( = ?auto_169622 ?auto_169620 ) ) ( ON ?auto_169622 ?auto_169621 ) ( CLEAR ?auto_169622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169618 ?auto_169619 ?auto_169621 )
      ( MAKE-2PILE ?auto_169618 ?auto_169619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169623 - BLOCK
      ?auto_169624 - BLOCK
    )
    :vars
    (
      ?auto_169627 - BLOCK
      ?auto_169625 - BLOCK
      ?auto_169626 - BLOCK
      ?auto_169629 - BLOCK
      ?auto_169630 - BLOCK
      ?auto_169628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169627 ?auto_169624 ) ( ON-TABLE ?auto_169623 ) ( ON ?auto_169624 ?auto_169623 ) ( not ( = ?auto_169623 ?auto_169624 ) ) ( not ( = ?auto_169623 ?auto_169627 ) ) ( not ( = ?auto_169624 ?auto_169627 ) ) ( not ( = ?auto_169623 ?auto_169625 ) ) ( not ( = ?auto_169623 ?auto_169626 ) ) ( not ( = ?auto_169624 ?auto_169625 ) ) ( not ( = ?auto_169624 ?auto_169626 ) ) ( not ( = ?auto_169627 ?auto_169625 ) ) ( not ( = ?auto_169627 ?auto_169626 ) ) ( not ( = ?auto_169625 ?auto_169626 ) ) ( ON ?auto_169625 ?auto_169627 ) ( CLEAR ?auto_169625 ) ( HOLDING ?auto_169626 ) ( CLEAR ?auto_169629 ) ( ON-TABLE ?auto_169630 ) ( ON ?auto_169628 ?auto_169630 ) ( ON ?auto_169629 ?auto_169628 ) ( not ( = ?auto_169630 ?auto_169628 ) ) ( not ( = ?auto_169630 ?auto_169629 ) ) ( not ( = ?auto_169630 ?auto_169626 ) ) ( not ( = ?auto_169628 ?auto_169629 ) ) ( not ( = ?auto_169628 ?auto_169626 ) ) ( not ( = ?auto_169629 ?auto_169626 ) ) ( not ( = ?auto_169623 ?auto_169629 ) ) ( not ( = ?auto_169623 ?auto_169630 ) ) ( not ( = ?auto_169623 ?auto_169628 ) ) ( not ( = ?auto_169624 ?auto_169629 ) ) ( not ( = ?auto_169624 ?auto_169630 ) ) ( not ( = ?auto_169624 ?auto_169628 ) ) ( not ( = ?auto_169627 ?auto_169629 ) ) ( not ( = ?auto_169627 ?auto_169630 ) ) ( not ( = ?auto_169627 ?auto_169628 ) ) ( not ( = ?auto_169625 ?auto_169629 ) ) ( not ( = ?auto_169625 ?auto_169630 ) ) ( not ( = ?auto_169625 ?auto_169628 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169630 ?auto_169628 ?auto_169629 ?auto_169626 )
      ( MAKE-2PILE ?auto_169623 ?auto_169624 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169631 - BLOCK
      ?auto_169632 - BLOCK
    )
    :vars
    (
      ?auto_169638 - BLOCK
      ?auto_169634 - BLOCK
      ?auto_169633 - BLOCK
      ?auto_169636 - BLOCK
      ?auto_169635 - BLOCK
      ?auto_169637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169638 ?auto_169632 ) ( ON-TABLE ?auto_169631 ) ( ON ?auto_169632 ?auto_169631 ) ( not ( = ?auto_169631 ?auto_169632 ) ) ( not ( = ?auto_169631 ?auto_169638 ) ) ( not ( = ?auto_169632 ?auto_169638 ) ) ( not ( = ?auto_169631 ?auto_169634 ) ) ( not ( = ?auto_169631 ?auto_169633 ) ) ( not ( = ?auto_169632 ?auto_169634 ) ) ( not ( = ?auto_169632 ?auto_169633 ) ) ( not ( = ?auto_169638 ?auto_169634 ) ) ( not ( = ?auto_169638 ?auto_169633 ) ) ( not ( = ?auto_169634 ?auto_169633 ) ) ( ON ?auto_169634 ?auto_169638 ) ( CLEAR ?auto_169636 ) ( ON-TABLE ?auto_169635 ) ( ON ?auto_169637 ?auto_169635 ) ( ON ?auto_169636 ?auto_169637 ) ( not ( = ?auto_169635 ?auto_169637 ) ) ( not ( = ?auto_169635 ?auto_169636 ) ) ( not ( = ?auto_169635 ?auto_169633 ) ) ( not ( = ?auto_169637 ?auto_169636 ) ) ( not ( = ?auto_169637 ?auto_169633 ) ) ( not ( = ?auto_169636 ?auto_169633 ) ) ( not ( = ?auto_169631 ?auto_169636 ) ) ( not ( = ?auto_169631 ?auto_169635 ) ) ( not ( = ?auto_169631 ?auto_169637 ) ) ( not ( = ?auto_169632 ?auto_169636 ) ) ( not ( = ?auto_169632 ?auto_169635 ) ) ( not ( = ?auto_169632 ?auto_169637 ) ) ( not ( = ?auto_169638 ?auto_169636 ) ) ( not ( = ?auto_169638 ?auto_169635 ) ) ( not ( = ?auto_169638 ?auto_169637 ) ) ( not ( = ?auto_169634 ?auto_169636 ) ) ( not ( = ?auto_169634 ?auto_169635 ) ) ( not ( = ?auto_169634 ?auto_169637 ) ) ( ON ?auto_169633 ?auto_169634 ) ( CLEAR ?auto_169633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169631 ?auto_169632 ?auto_169638 ?auto_169634 )
      ( MAKE-2PILE ?auto_169631 ?auto_169632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169639 - BLOCK
      ?auto_169640 - BLOCK
    )
    :vars
    (
      ?auto_169644 - BLOCK
      ?auto_169641 - BLOCK
      ?auto_169645 - BLOCK
      ?auto_169646 - BLOCK
      ?auto_169642 - BLOCK
      ?auto_169643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169644 ?auto_169640 ) ( ON-TABLE ?auto_169639 ) ( ON ?auto_169640 ?auto_169639 ) ( not ( = ?auto_169639 ?auto_169640 ) ) ( not ( = ?auto_169639 ?auto_169644 ) ) ( not ( = ?auto_169640 ?auto_169644 ) ) ( not ( = ?auto_169639 ?auto_169641 ) ) ( not ( = ?auto_169639 ?auto_169645 ) ) ( not ( = ?auto_169640 ?auto_169641 ) ) ( not ( = ?auto_169640 ?auto_169645 ) ) ( not ( = ?auto_169644 ?auto_169641 ) ) ( not ( = ?auto_169644 ?auto_169645 ) ) ( not ( = ?auto_169641 ?auto_169645 ) ) ( ON ?auto_169641 ?auto_169644 ) ( ON-TABLE ?auto_169646 ) ( ON ?auto_169642 ?auto_169646 ) ( not ( = ?auto_169646 ?auto_169642 ) ) ( not ( = ?auto_169646 ?auto_169643 ) ) ( not ( = ?auto_169646 ?auto_169645 ) ) ( not ( = ?auto_169642 ?auto_169643 ) ) ( not ( = ?auto_169642 ?auto_169645 ) ) ( not ( = ?auto_169643 ?auto_169645 ) ) ( not ( = ?auto_169639 ?auto_169643 ) ) ( not ( = ?auto_169639 ?auto_169646 ) ) ( not ( = ?auto_169639 ?auto_169642 ) ) ( not ( = ?auto_169640 ?auto_169643 ) ) ( not ( = ?auto_169640 ?auto_169646 ) ) ( not ( = ?auto_169640 ?auto_169642 ) ) ( not ( = ?auto_169644 ?auto_169643 ) ) ( not ( = ?auto_169644 ?auto_169646 ) ) ( not ( = ?auto_169644 ?auto_169642 ) ) ( not ( = ?auto_169641 ?auto_169643 ) ) ( not ( = ?auto_169641 ?auto_169646 ) ) ( not ( = ?auto_169641 ?auto_169642 ) ) ( ON ?auto_169645 ?auto_169641 ) ( CLEAR ?auto_169645 ) ( HOLDING ?auto_169643 ) ( CLEAR ?auto_169642 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169646 ?auto_169642 ?auto_169643 )
      ( MAKE-2PILE ?auto_169639 ?auto_169640 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169647 - BLOCK
      ?auto_169648 - BLOCK
    )
    :vars
    (
      ?auto_169650 - BLOCK
      ?auto_169653 - BLOCK
      ?auto_169651 - BLOCK
      ?auto_169652 - BLOCK
      ?auto_169649 - BLOCK
      ?auto_169654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169650 ?auto_169648 ) ( ON-TABLE ?auto_169647 ) ( ON ?auto_169648 ?auto_169647 ) ( not ( = ?auto_169647 ?auto_169648 ) ) ( not ( = ?auto_169647 ?auto_169650 ) ) ( not ( = ?auto_169648 ?auto_169650 ) ) ( not ( = ?auto_169647 ?auto_169653 ) ) ( not ( = ?auto_169647 ?auto_169651 ) ) ( not ( = ?auto_169648 ?auto_169653 ) ) ( not ( = ?auto_169648 ?auto_169651 ) ) ( not ( = ?auto_169650 ?auto_169653 ) ) ( not ( = ?auto_169650 ?auto_169651 ) ) ( not ( = ?auto_169653 ?auto_169651 ) ) ( ON ?auto_169653 ?auto_169650 ) ( ON-TABLE ?auto_169652 ) ( ON ?auto_169649 ?auto_169652 ) ( not ( = ?auto_169652 ?auto_169649 ) ) ( not ( = ?auto_169652 ?auto_169654 ) ) ( not ( = ?auto_169652 ?auto_169651 ) ) ( not ( = ?auto_169649 ?auto_169654 ) ) ( not ( = ?auto_169649 ?auto_169651 ) ) ( not ( = ?auto_169654 ?auto_169651 ) ) ( not ( = ?auto_169647 ?auto_169654 ) ) ( not ( = ?auto_169647 ?auto_169652 ) ) ( not ( = ?auto_169647 ?auto_169649 ) ) ( not ( = ?auto_169648 ?auto_169654 ) ) ( not ( = ?auto_169648 ?auto_169652 ) ) ( not ( = ?auto_169648 ?auto_169649 ) ) ( not ( = ?auto_169650 ?auto_169654 ) ) ( not ( = ?auto_169650 ?auto_169652 ) ) ( not ( = ?auto_169650 ?auto_169649 ) ) ( not ( = ?auto_169653 ?auto_169654 ) ) ( not ( = ?auto_169653 ?auto_169652 ) ) ( not ( = ?auto_169653 ?auto_169649 ) ) ( ON ?auto_169651 ?auto_169653 ) ( CLEAR ?auto_169649 ) ( ON ?auto_169654 ?auto_169651 ) ( CLEAR ?auto_169654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169647 ?auto_169648 ?auto_169650 ?auto_169653 ?auto_169651 )
      ( MAKE-2PILE ?auto_169647 ?auto_169648 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169655 - BLOCK
      ?auto_169656 - BLOCK
    )
    :vars
    (
      ?auto_169657 - BLOCK
      ?auto_169662 - BLOCK
      ?auto_169661 - BLOCK
      ?auto_169659 - BLOCK
      ?auto_169660 - BLOCK
      ?auto_169658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169657 ?auto_169656 ) ( ON-TABLE ?auto_169655 ) ( ON ?auto_169656 ?auto_169655 ) ( not ( = ?auto_169655 ?auto_169656 ) ) ( not ( = ?auto_169655 ?auto_169657 ) ) ( not ( = ?auto_169656 ?auto_169657 ) ) ( not ( = ?auto_169655 ?auto_169662 ) ) ( not ( = ?auto_169655 ?auto_169661 ) ) ( not ( = ?auto_169656 ?auto_169662 ) ) ( not ( = ?auto_169656 ?auto_169661 ) ) ( not ( = ?auto_169657 ?auto_169662 ) ) ( not ( = ?auto_169657 ?auto_169661 ) ) ( not ( = ?auto_169662 ?auto_169661 ) ) ( ON ?auto_169662 ?auto_169657 ) ( ON-TABLE ?auto_169659 ) ( not ( = ?auto_169659 ?auto_169660 ) ) ( not ( = ?auto_169659 ?auto_169658 ) ) ( not ( = ?auto_169659 ?auto_169661 ) ) ( not ( = ?auto_169660 ?auto_169658 ) ) ( not ( = ?auto_169660 ?auto_169661 ) ) ( not ( = ?auto_169658 ?auto_169661 ) ) ( not ( = ?auto_169655 ?auto_169658 ) ) ( not ( = ?auto_169655 ?auto_169659 ) ) ( not ( = ?auto_169655 ?auto_169660 ) ) ( not ( = ?auto_169656 ?auto_169658 ) ) ( not ( = ?auto_169656 ?auto_169659 ) ) ( not ( = ?auto_169656 ?auto_169660 ) ) ( not ( = ?auto_169657 ?auto_169658 ) ) ( not ( = ?auto_169657 ?auto_169659 ) ) ( not ( = ?auto_169657 ?auto_169660 ) ) ( not ( = ?auto_169662 ?auto_169658 ) ) ( not ( = ?auto_169662 ?auto_169659 ) ) ( not ( = ?auto_169662 ?auto_169660 ) ) ( ON ?auto_169661 ?auto_169662 ) ( ON ?auto_169658 ?auto_169661 ) ( CLEAR ?auto_169658 ) ( HOLDING ?auto_169660 ) ( CLEAR ?auto_169659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169659 ?auto_169660 )
      ( MAKE-2PILE ?auto_169655 ?auto_169656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169663 - BLOCK
      ?auto_169664 - BLOCK
    )
    :vars
    (
      ?auto_169668 - BLOCK
      ?auto_169667 - BLOCK
      ?auto_169665 - BLOCK
      ?auto_169669 - BLOCK
      ?auto_169666 - BLOCK
      ?auto_169670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169668 ?auto_169664 ) ( ON-TABLE ?auto_169663 ) ( ON ?auto_169664 ?auto_169663 ) ( not ( = ?auto_169663 ?auto_169664 ) ) ( not ( = ?auto_169663 ?auto_169668 ) ) ( not ( = ?auto_169664 ?auto_169668 ) ) ( not ( = ?auto_169663 ?auto_169667 ) ) ( not ( = ?auto_169663 ?auto_169665 ) ) ( not ( = ?auto_169664 ?auto_169667 ) ) ( not ( = ?auto_169664 ?auto_169665 ) ) ( not ( = ?auto_169668 ?auto_169667 ) ) ( not ( = ?auto_169668 ?auto_169665 ) ) ( not ( = ?auto_169667 ?auto_169665 ) ) ( ON ?auto_169667 ?auto_169668 ) ( ON-TABLE ?auto_169669 ) ( not ( = ?auto_169669 ?auto_169666 ) ) ( not ( = ?auto_169669 ?auto_169670 ) ) ( not ( = ?auto_169669 ?auto_169665 ) ) ( not ( = ?auto_169666 ?auto_169670 ) ) ( not ( = ?auto_169666 ?auto_169665 ) ) ( not ( = ?auto_169670 ?auto_169665 ) ) ( not ( = ?auto_169663 ?auto_169670 ) ) ( not ( = ?auto_169663 ?auto_169669 ) ) ( not ( = ?auto_169663 ?auto_169666 ) ) ( not ( = ?auto_169664 ?auto_169670 ) ) ( not ( = ?auto_169664 ?auto_169669 ) ) ( not ( = ?auto_169664 ?auto_169666 ) ) ( not ( = ?auto_169668 ?auto_169670 ) ) ( not ( = ?auto_169668 ?auto_169669 ) ) ( not ( = ?auto_169668 ?auto_169666 ) ) ( not ( = ?auto_169667 ?auto_169670 ) ) ( not ( = ?auto_169667 ?auto_169669 ) ) ( not ( = ?auto_169667 ?auto_169666 ) ) ( ON ?auto_169665 ?auto_169667 ) ( ON ?auto_169670 ?auto_169665 ) ( CLEAR ?auto_169669 ) ( ON ?auto_169666 ?auto_169670 ) ( CLEAR ?auto_169666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169663 ?auto_169664 ?auto_169668 ?auto_169667 ?auto_169665 ?auto_169670 )
      ( MAKE-2PILE ?auto_169663 ?auto_169664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169671 - BLOCK
      ?auto_169672 - BLOCK
    )
    :vars
    (
      ?auto_169674 - BLOCK
      ?auto_169678 - BLOCK
      ?auto_169676 - BLOCK
      ?auto_169673 - BLOCK
      ?auto_169677 - BLOCK
      ?auto_169675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169674 ?auto_169672 ) ( ON-TABLE ?auto_169671 ) ( ON ?auto_169672 ?auto_169671 ) ( not ( = ?auto_169671 ?auto_169672 ) ) ( not ( = ?auto_169671 ?auto_169674 ) ) ( not ( = ?auto_169672 ?auto_169674 ) ) ( not ( = ?auto_169671 ?auto_169678 ) ) ( not ( = ?auto_169671 ?auto_169676 ) ) ( not ( = ?auto_169672 ?auto_169678 ) ) ( not ( = ?auto_169672 ?auto_169676 ) ) ( not ( = ?auto_169674 ?auto_169678 ) ) ( not ( = ?auto_169674 ?auto_169676 ) ) ( not ( = ?auto_169678 ?auto_169676 ) ) ( ON ?auto_169678 ?auto_169674 ) ( not ( = ?auto_169673 ?auto_169677 ) ) ( not ( = ?auto_169673 ?auto_169675 ) ) ( not ( = ?auto_169673 ?auto_169676 ) ) ( not ( = ?auto_169677 ?auto_169675 ) ) ( not ( = ?auto_169677 ?auto_169676 ) ) ( not ( = ?auto_169675 ?auto_169676 ) ) ( not ( = ?auto_169671 ?auto_169675 ) ) ( not ( = ?auto_169671 ?auto_169673 ) ) ( not ( = ?auto_169671 ?auto_169677 ) ) ( not ( = ?auto_169672 ?auto_169675 ) ) ( not ( = ?auto_169672 ?auto_169673 ) ) ( not ( = ?auto_169672 ?auto_169677 ) ) ( not ( = ?auto_169674 ?auto_169675 ) ) ( not ( = ?auto_169674 ?auto_169673 ) ) ( not ( = ?auto_169674 ?auto_169677 ) ) ( not ( = ?auto_169678 ?auto_169675 ) ) ( not ( = ?auto_169678 ?auto_169673 ) ) ( not ( = ?auto_169678 ?auto_169677 ) ) ( ON ?auto_169676 ?auto_169678 ) ( ON ?auto_169675 ?auto_169676 ) ( ON ?auto_169677 ?auto_169675 ) ( CLEAR ?auto_169677 ) ( HOLDING ?auto_169673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169673 )
      ( MAKE-2PILE ?auto_169671 ?auto_169672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169679 - BLOCK
      ?auto_169680 - BLOCK
    )
    :vars
    (
      ?auto_169686 - BLOCK
      ?auto_169682 - BLOCK
      ?auto_169685 - BLOCK
      ?auto_169684 - BLOCK
      ?auto_169683 - BLOCK
      ?auto_169681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169686 ?auto_169680 ) ( ON-TABLE ?auto_169679 ) ( ON ?auto_169680 ?auto_169679 ) ( not ( = ?auto_169679 ?auto_169680 ) ) ( not ( = ?auto_169679 ?auto_169686 ) ) ( not ( = ?auto_169680 ?auto_169686 ) ) ( not ( = ?auto_169679 ?auto_169682 ) ) ( not ( = ?auto_169679 ?auto_169685 ) ) ( not ( = ?auto_169680 ?auto_169682 ) ) ( not ( = ?auto_169680 ?auto_169685 ) ) ( not ( = ?auto_169686 ?auto_169682 ) ) ( not ( = ?auto_169686 ?auto_169685 ) ) ( not ( = ?auto_169682 ?auto_169685 ) ) ( ON ?auto_169682 ?auto_169686 ) ( not ( = ?auto_169684 ?auto_169683 ) ) ( not ( = ?auto_169684 ?auto_169681 ) ) ( not ( = ?auto_169684 ?auto_169685 ) ) ( not ( = ?auto_169683 ?auto_169681 ) ) ( not ( = ?auto_169683 ?auto_169685 ) ) ( not ( = ?auto_169681 ?auto_169685 ) ) ( not ( = ?auto_169679 ?auto_169681 ) ) ( not ( = ?auto_169679 ?auto_169684 ) ) ( not ( = ?auto_169679 ?auto_169683 ) ) ( not ( = ?auto_169680 ?auto_169681 ) ) ( not ( = ?auto_169680 ?auto_169684 ) ) ( not ( = ?auto_169680 ?auto_169683 ) ) ( not ( = ?auto_169686 ?auto_169681 ) ) ( not ( = ?auto_169686 ?auto_169684 ) ) ( not ( = ?auto_169686 ?auto_169683 ) ) ( not ( = ?auto_169682 ?auto_169681 ) ) ( not ( = ?auto_169682 ?auto_169684 ) ) ( not ( = ?auto_169682 ?auto_169683 ) ) ( ON ?auto_169685 ?auto_169682 ) ( ON ?auto_169681 ?auto_169685 ) ( ON ?auto_169683 ?auto_169681 ) ( ON ?auto_169684 ?auto_169683 ) ( CLEAR ?auto_169684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169679 ?auto_169680 ?auto_169686 ?auto_169682 ?auto_169685 ?auto_169681 ?auto_169683 )
      ( MAKE-2PILE ?auto_169679 ?auto_169680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169687 - BLOCK
      ?auto_169688 - BLOCK
    )
    :vars
    (
      ?auto_169694 - BLOCK
      ?auto_169689 - BLOCK
      ?auto_169691 - BLOCK
      ?auto_169690 - BLOCK
      ?auto_169692 - BLOCK
      ?auto_169693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169694 ?auto_169688 ) ( ON-TABLE ?auto_169687 ) ( ON ?auto_169688 ?auto_169687 ) ( not ( = ?auto_169687 ?auto_169688 ) ) ( not ( = ?auto_169687 ?auto_169694 ) ) ( not ( = ?auto_169688 ?auto_169694 ) ) ( not ( = ?auto_169687 ?auto_169689 ) ) ( not ( = ?auto_169687 ?auto_169691 ) ) ( not ( = ?auto_169688 ?auto_169689 ) ) ( not ( = ?auto_169688 ?auto_169691 ) ) ( not ( = ?auto_169694 ?auto_169689 ) ) ( not ( = ?auto_169694 ?auto_169691 ) ) ( not ( = ?auto_169689 ?auto_169691 ) ) ( ON ?auto_169689 ?auto_169694 ) ( not ( = ?auto_169690 ?auto_169692 ) ) ( not ( = ?auto_169690 ?auto_169693 ) ) ( not ( = ?auto_169690 ?auto_169691 ) ) ( not ( = ?auto_169692 ?auto_169693 ) ) ( not ( = ?auto_169692 ?auto_169691 ) ) ( not ( = ?auto_169693 ?auto_169691 ) ) ( not ( = ?auto_169687 ?auto_169693 ) ) ( not ( = ?auto_169687 ?auto_169690 ) ) ( not ( = ?auto_169687 ?auto_169692 ) ) ( not ( = ?auto_169688 ?auto_169693 ) ) ( not ( = ?auto_169688 ?auto_169690 ) ) ( not ( = ?auto_169688 ?auto_169692 ) ) ( not ( = ?auto_169694 ?auto_169693 ) ) ( not ( = ?auto_169694 ?auto_169690 ) ) ( not ( = ?auto_169694 ?auto_169692 ) ) ( not ( = ?auto_169689 ?auto_169693 ) ) ( not ( = ?auto_169689 ?auto_169690 ) ) ( not ( = ?auto_169689 ?auto_169692 ) ) ( ON ?auto_169691 ?auto_169689 ) ( ON ?auto_169693 ?auto_169691 ) ( ON ?auto_169692 ?auto_169693 ) ( HOLDING ?auto_169690 ) ( CLEAR ?auto_169692 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169687 ?auto_169688 ?auto_169694 ?auto_169689 ?auto_169691 ?auto_169693 ?auto_169692 ?auto_169690 )
      ( MAKE-2PILE ?auto_169687 ?auto_169688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169695 - BLOCK
      ?auto_169696 - BLOCK
    )
    :vars
    (
      ?auto_169698 - BLOCK
      ?auto_169702 - BLOCK
      ?auto_169697 - BLOCK
      ?auto_169701 - BLOCK
      ?auto_169699 - BLOCK
      ?auto_169700 - BLOCK
      ?auto_169703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169698 ?auto_169696 ) ( ON-TABLE ?auto_169695 ) ( ON ?auto_169696 ?auto_169695 ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( not ( = ?auto_169695 ?auto_169698 ) ) ( not ( = ?auto_169696 ?auto_169698 ) ) ( not ( = ?auto_169695 ?auto_169702 ) ) ( not ( = ?auto_169695 ?auto_169697 ) ) ( not ( = ?auto_169696 ?auto_169702 ) ) ( not ( = ?auto_169696 ?auto_169697 ) ) ( not ( = ?auto_169698 ?auto_169702 ) ) ( not ( = ?auto_169698 ?auto_169697 ) ) ( not ( = ?auto_169702 ?auto_169697 ) ) ( ON ?auto_169702 ?auto_169698 ) ( not ( = ?auto_169701 ?auto_169699 ) ) ( not ( = ?auto_169701 ?auto_169700 ) ) ( not ( = ?auto_169701 ?auto_169697 ) ) ( not ( = ?auto_169699 ?auto_169700 ) ) ( not ( = ?auto_169699 ?auto_169697 ) ) ( not ( = ?auto_169700 ?auto_169697 ) ) ( not ( = ?auto_169695 ?auto_169700 ) ) ( not ( = ?auto_169695 ?auto_169701 ) ) ( not ( = ?auto_169695 ?auto_169699 ) ) ( not ( = ?auto_169696 ?auto_169700 ) ) ( not ( = ?auto_169696 ?auto_169701 ) ) ( not ( = ?auto_169696 ?auto_169699 ) ) ( not ( = ?auto_169698 ?auto_169700 ) ) ( not ( = ?auto_169698 ?auto_169701 ) ) ( not ( = ?auto_169698 ?auto_169699 ) ) ( not ( = ?auto_169702 ?auto_169700 ) ) ( not ( = ?auto_169702 ?auto_169701 ) ) ( not ( = ?auto_169702 ?auto_169699 ) ) ( ON ?auto_169697 ?auto_169702 ) ( ON ?auto_169700 ?auto_169697 ) ( ON ?auto_169699 ?auto_169700 ) ( CLEAR ?auto_169699 ) ( ON ?auto_169701 ?auto_169703 ) ( CLEAR ?auto_169701 ) ( HAND-EMPTY ) ( not ( = ?auto_169695 ?auto_169703 ) ) ( not ( = ?auto_169696 ?auto_169703 ) ) ( not ( = ?auto_169698 ?auto_169703 ) ) ( not ( = ?auto_169702 ?auto_169703 ) ) ( not ( = ?auto_169697 ?auto_169703 ) ) ( not ( = ?auto_169701 ?auto_169703 ) ) ( not ( = ?auto_169699 ?auto_169703 ) ) ( not ( = ?auto_169700 ?auto_169703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169701 ?auto_169703 )
      ( MAKE-2PILE ?auto_169695 ?auto_169696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169704 - BLOCK
      ?auto_169705 - BLOCK
    )
    :vars
    (
      ?auto_169706 - BLOCK
      ?auto_169712 - BLOCK
      ?auto_169707 - BLOCK
      ?auto_169710 - BLOCK
      ?auto_169711 - BLOCK
      ?auto_169708 - BLOCK
      ?auto_169709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169706 ?auto_169705 ) ( ON-TABLE ?auto_169704 ) ( ON ?auto_169705 ?auto_169704 ) ( not ( = ?auto_169704 ?auto_169705 ) ) ( not ( = ?auto_169704 ?auto_169706 ) ) ( not ( = ?auto_169705 ?auto_169706 ) ) ( not ( = ?auto_169704 ?auto_169712 ) ) ( not ( = ?auto_169704 ?auto_169707 ) ) ( not ( = ?auto_169705 ?auto_169712 ) ) ( not ( = ?auto_169705 ?auto_169707 ) ) ( not ( = ?auto_169706 ?auto_169712 ) ) ( not ( = ?auto_169706 ?auto_169707 ) ) ( not ( = ?auto_169712 ?auto_169707 ) ) ( ON ?auto_169712 ?auto_169706 ) ( not ( = ?auto_169710 ?auto_169711 ) ) ( not ( = ?auto_169710 ?auto_169708 ) ) ( not ( = ?auto_169710 ?auto_169707 ) ) ( not ( = ?auto_169711 ?auto_169708 ) ) ( not ( = ?auto_169711 ?auto_169707 ) ) ( not ( = ?auto_169708 ?auto_169707 ) ) ( not ( = ?auto_169704 ?auto_169708 ) ) ( not ( = ?auto_169704 ?auto_169710 ) ) ( not ( = ?auto_169704 ?auto_169711 ) ) ( not ( = ?auto_169705 ?auto_169708 ) ) ( not ( = ?auto_169705 ?auto_169710 ) ) ( not ( = ?auto_169705 ?auto_169711 ) ) ( not ( = ?auto_169706 ?auto_169708 ) ) ( not ( = ?auto_169706 ?auto_169710 ) ) ( not ( = ?auto_169706 ?auto_169711 ) ) ( not ( = ?auto_169712 ?auto_169708 ) ) ( not ( = ?auto_169712 ?auto_169710 ) ) ( not ( = ?auto_169712 ?auto_169711 ) ) ( ON ?auto_169707 ?auto_169712 ) ( ON ?auto_169708 ?auto_169707 ) ( ON ?auto_169710 ?auto_169709 ) ( CLEAR ?auto_169710 ) ( not ( = ?auto_169704 ?auto_169709 ) ) ( not ( = ?auto_169705 ?auto_169709 ) ) ( not ( = ?auto_169706 ?auto_169709 ) ) ( not ( = ?auto_169712 ?auto_169709 ) ) ( not ( = ?auto_169707 ?auto_169709 ) ) ( not ( = ?auto_169710 ?auto_169709 ) ) ( not ( = ?auto_169711 ?auto_169709 ) ) ( not ( = ?auto_169708 ?auto_169709 ) ) ( HOLDING ?auto_169711 ) ( CLEAR ?auto_169708 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169704 ?auto_169705 ?auto_169706 ?auto_169712 ?auto_169707 ?auto_169708 ?auto_169711 )
      ( MAKE-2PILE ?auto_169704 ?auto_169705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169713 - BLOCK
      ?auto_169714 - BLOCK
    )
    :vars
    (
      ?auto_169715 - BLOCK
      ?auto_169720 - BLOCK
      ?auto_169717 - BLOCK
      ?auto_169718 - BLOCK
      ?auto_169721 - BLOCK
      ?auto_169716 - BLOCK
      ?auto_169719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169715 ?auto_169714 ) ( ON-TABLE ?auto_169713 ) ( ON ?auto_169714 ?auto_169713 ) ( not ( = ?auto_169713 ?auto_169714 ) ) ( not ( = ?auto_169713 ?auto_169715 ) ) ( not ( = ?auto_169714 ?auto_169715 ) ) ( not ( = ?auto_169713 ?auto_169720 ) ) ( not ( = ?auto_169713 ?auto_169717 ) ) ( not ( = ?auto_169714 ?auto_169720 ) ) ( not ( = ?auto_169714 ?auto_169717 ) ) ( not ( = ?auto_169715 ?auto_169720 ) ) ( not ( = ?auto_169715 ?auto_169717 ) ) ( not ( = ?auto_169720 ?auto_169717 ) ) ( ON ?auto_169720 ?auto_169715 ) ( not ( = ?auto_169718 ?auto_169721 ) ) ( not ( = ?auto_169718 ?auto_169716 ) ) ( not ( = ?auto_169718 ?auto_169717 ) ) ( not ( = ?auto_169721 ?auto_169716 ) ) ( not ( = ?auto_169721 ?auto_169717 ) ) ( not ( = ?auto_169716 ?auto_169717 ) ) ( not ( = ?auto_169713 ?auto_169716 ) ) ( not ( = ?auto_169713 ?auto_169718 ) ) ( not ( = ?auto_169713 ?auto_169721 ) ) ( not ( = ?auto_169714 ?auto_169716 ) ) ( not ( = ?auto_169714 ?auto_169718 ) ) ( not ( = ?auto_169714 ?auto_169721 ) ) ( not ( = ?auto_169715 ?auto_169716 ) ) ( not ( = ?auto_169715 ?auto_169718 ) ) ( not ( = ?auto_169715 ?auto_169721 ) ) ( not ( = ?auto_169720 ?auto_169716 ) ) ( not ( = ?auto_169720 ?auto_169718 ) ) ( not ( = ?auto_169720 ?auto_169721 ) ) ( ON ?auto_169717 ?auto_169720 ) ( ON ?auto_169716 ?auto_169717 ) ( ON ?auto_169718 ?auto_169719 ) ( not ( = ?auto_169713 ?auto_169719 ) ) ( not ( = ?auto_169714 ?auto_169719 ) ) ( not ( = ?auto_169715 ?auto_169719 ) ) ( not ( = ?auto_169720 ?auto_169719 ) ) ( not ( = ?auto_169717 ?auto_169719 ) ) ( not ( = ?auto_169718 ?auto_169719 ) ) ( not ( = ?auto_169721 ?auto_169719 ) ) ( not ( = ?auto_169716 ?auto_169719 ) ) ( CLEAR ?auto_169716 ) ( ON ?auto_169721 ?auto_169718 ) ( CLEAR ?auto_169721 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169719 ?auto_169718 )
      ( MAKE-2PILE ?auto_169713 ?auto_169714 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169722 - BLOCK
      ?auto_169723 - BLOCK
    )
    :vars
    (
      ?auto_169729 - BLOCK
      ?auto_169724 - BLOCK
      ?auto_169728 - BLOCK
      ?auto_169725 - BLOCK
      ?auto_169727 - BLOCK
      ?auto_169726 - BLOCK
      ?auto_169730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169729 ?auto_169723 ) ( ON-TABLE ?auto_169722 ) ( ON ?auto_169723 ?auto_169722 ) ( not ( = ?auto_169722 ?auto_169723 ) ) ( not ( = ?auto_169722 ?auto_169729 ) ) ( not ( = ?auto_169723 ?auto_169729 ) ) ( not ( = ?auto_169722 ?auto_169724 ) ) ( not ( = ?auto_169722 ?auto_169728 ) ) ( not ( = ?auto_169723 ?auto_169724 ) ) ( not ( = ?auto_169723 ?auto_169728 ) ) ( not ( = ?auto_169729 ?auto_169724 ) ) ( not ( = ?auto_169729 ?auto_169728 ) ) ( not ( = ?auto_169724 ?auto_169728 ) ) ( ON ?auto_169724 ?auto_169729 ) ( not ( = ?auto_169725 ?auto_169727 ) ) ( not ( = ?auto_169725 ?auto_169726 ) ) ( not ( = ?auto_169725 ?auto_169728 ) ) ( not ( = ?auto_169727 ?auto_169726 ) ) ( not ( = ?auto_169727 ?auto_169728 ) ) ( not ( = ?auto_169726 ?auto_169728 ) ) ( not ( = ?auto_169722 ?auto_169726 ) ) ( not ( = ?auto_169722 ?auto_169725 ) ) ( not ( = ?auto_169722 ?auto_169727 ) ) ( not ( = ?auto_169723 ?auto_169726 ) ) ( not ( = ?auto_169723 ?auto_169725 ) ) ( not ( = ?auto_169723 ?auto_169727 ) ) ( not ( = ?auto_169729 ?auto_169726 ) ) ( not ( = ?auto_169729 ?auto_169725 ) ) ( not ( = ?auto_169729 ?auto_169727 ) ) ( not ( = ?auto_169724 ?auto_169726 ) ) ( not ( = ?auto_169724 ?auto_169725 ) ) ( not ( = ?auto_169724 ?auto_169727 ) ) ( ON ?auto_169728 ?auto_169724 ) ( ON ?auto_169725 ?auto_169730 ) ( not ( = ?auto_169722 ?auto_169730 ) ) ( not ( = ?auto_169723 ?auto_169730 ) ) ( not ( = ?auto_169729 ?auto_169730 ) ) ( not ( = ?auto_169724 ?auto_169730 ) ) ( not ( = ?auto_169728 ?auto_169730 ) ) ( not ( = ?auto_169725 ?auto_169730 ) ) ( not ( = ?auto_169727 ?auto_169730 ) ) ( not ( = ?auto_169726 ?auto_169730 ) ) ( ON ?auto_169727 ?auto_169725 ) ( CLEAR ?auto_169727 ) ( ON-TABLE ?auto_169730 ) ( HOLDING ?auto_169726 ) ( CLEAR ?auto_169728 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169722 ?auto_169723 ?auto_169729 ?auto_169724 ?auto_169728 ?auto_169726 )
      ( MAKE-2PILE ?auto_169722 ?auto_169723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169731 - BLOCK
      ?auto_169732 - BLOCK
    )
    :vars
    (
      ?auto_169735 - BLOCK
      ?auto_169737 - BLOCK
      ?auto_169734 - BLOCK
      ?auto_169739 - BLOCK
      ?auto_169733 - BLOCK
      ?auto_169738 - BLOCK
      ?auto_169736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169735 ?auto_169732 ) ( ON-TABLE ?auto_169731 ) ( ON ?auto_169732 ?auto_169731 ) ( not ( = ?auto_169731 ?auto_169732 ) ) ( not ( = ?auto_169731 ?auto_169735 ) ) ( not ( = ?auto_169732 ?auto_169735 ) ) ( not ( = ?auto_169731 ?auto_169737 ) ) ( not ( = ?auto_169731 ?auto_169734 ) ) ( not ( = ?auto_169732 ?auto_169737 ) ) ( not ( = ?auto_169732 ?auto_169734 ) ) ( not ( = ?auto_169735 ?auto_169737 ) ) ( not ( = ?auto_169735 ?auto_169734 ) ) ( not ( = ?auto_169737 ?auto_169734 ) ) ( ON ?auto_169737 ?auto_169735 ) ( not ( = ?auto_169739 ?auto_169733 ) ) ( not ( = ?auto_169739 ?auto_169738 ) ) ( not ( = ?auto_169739 ?auto_169734 ) ) ( not ( = ?auto_169733 ?auto_169738 ) ) ( not ( = ?auto_169733 ?auto_169734 ) ) ( not ( = ?auto_169738 ?auto_169734 ) ) ( not ( = ?auto_169731 ?auto_169738 ) ) ( not ( = ?auto_169731 ?auto_169739 ) ) ( not ( = ?auto_169731 ?auto_169733 ) ) ( not ( = ?auto_169732 ?auto_169738 ) ) ( not ( = ?auto_169732 ?auto_169739 ) ) ( not ( = ?auto_169732 ?auto_169733 ) ) ( not ( = ?auto_169735 ?auto_169738 ) ) ( not ( = ?auto_169735 ?auto_169739 ) ) ( not ( = ?auto_169735 ?auto_169733 ) ) ( not ( = ?auto_169737 ?auto_169738 ) ) ( not ( = ?auto_169737 ?auto_169739 ) ) ( not ( = ?auto_169737 ?auto_169733 ) ) ( ON ?auto_169734 ?auto_169737 ) ( ON ?auto_169739 ?auto_169736 ) ( not ( = ?auto_169731 ?auto_169736 ) ) ( not ( = ?auto_169732 ?auto_169736 ) ) ( not ( = ?auto_169735 ?auto_169736 ) ) ( not ( = ?auto_169737 ?auto_169736 ) ) ( not ( = ?auto_169734 ?auto_169736 ) ) ( not ( = ?auto_169739 ?auto_169736 ) ) ( not ( = ?auto_169733 ?auto_169736 ) ) ( not ( = ?auto_169738 ?auto_169736 ) ) ( ON ?auto_169733 ?auto_169739 ) ( ON-TABLE ?auto_169736 ) ( CLEAR ?auto_169734 ) ( ON ?auto_169738 ?auto_169733 ) ( CLEAR ?auto_169738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169736 ?auto_169739 ?auto_169733 )
      ( MAKE-2PILE ?auto_169731 ?auto_169732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169740 - BLOCK
      ?auto_169741 - BLOCK
    )
    :vars
    (
      ?auto_169745 - BLOCK
      ?auto_169746 - BLOCK
      ?auto_169748 - BLOCK
      ?auto_169744 - BLOCK
      ?auto_169747 - BLOCK
      ?auto_169742 - BLOCK
      ?auto_169743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169745 ?auto_169741 ) ( ON-TABLE ?auto_169740 ) ( ON ?auto_169741 ?auto_169740 ) ( not ( = ?auto_169740 ?auto_169741 ) ) ( not ( = ?auto_169740 ?auto_169745 ) ) ( not ( = ?auto_169741 ?auto_169745 ) ) ( not ( = ?auto_169740 ?auto_169746 ) ) ( not ( = ?auto_169740 ?auto_169748 ) ) ( not ( = ?auto_169741 ?auto_169746 ) ) ( not ( = ?auto_169741 ?auto_169748 ) ) ( not ( = ?auto_169745 ?auto_169746 ) ) ( not ( = ?auto_169745 ?auto_169748 ) ) ( not ( = ?auto_169746 ?auto_169748 ) ) ( ON ?auto_169746 ?auto_169745 ) ( not ( = ?auto_169744 ?auto_169747 ) ) ( not ( = ?auto_169744 ?auto_169742 ) ) ( not ( = ?auto_169744 ?auto_169748 ) ) ( not ( = ?auto_169747 ?auto_169742 ) ) ( not ( = ?auto_169747 ?auto_169748 ) ) ( not ( = ?auto_169742 ?auto_169748 ) ) ( not ( = ?auto_169740 ?auto_169742 ) ) ( not ( = ?auto_169740 ?auto_169744 ) ) ( not ( = ?auto_169740 ?auto_169747 ) ) ( not ( = ?auto_169741 ?auto_169742 ) ) ( not ( = ?auto_169741 ?auto_169744 ) ) ( not ( = ?auto_169741 ?auto_169747 ) ) ( not ( = ?auto_169745 ?auto_169742 ) ) ( not ( = ?auto_169745 ?auto_169744 ) ) ( not ( = ?auto_169745 ?auto_169747 ) ) ( not ( = ?auto_169746 ?auto_169742 ) ) ( not ( = ?auto_169746 ?auto_169744 ) ) ( not ( = ?auto_169746 ?auto_169747 ) ) ( ON ?auto_169744 ?auto_169743 ) ( not ( = ?auto_169740 ?auto_169743 ) ) ( not ( = ?auto_169741 ?auto_169743 ) ) ( not ( = ?auto_169745 ?auto_169743 ) ) ( not ( = ?auto_169746 ?auto_169743 ) ) ( not ( = ?auto_169748 ?auto_169743 ) ) ( not ( = ?auto_169744 ?auto_169743 ) ) ( not ( = ?auto_169747 ?auto_169743 ) ) ( not ( = ?auto_169742 ?auto_169743 ) ) ( ON ?auto_169747 ?auto_169744 ) ( ON-TABLE ?auto_169743 ) ( ON ?auto_169742 ?auto_169747 ) ( CLEAR ?auto_169742 ) ( HOLDING ?auto_169748 ) ( CLEAR ?auto_169746 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169740 ?auto_169741 ?auto_169745 ?auto_169746 ?auto_169748 )
      ( MAKE-2PILE ?auto_169740 ?auto_169741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169749 - BLOCK
      ?auto_169750 - BLOCK
    )
    :vars
    (
      ?auto_169754 - BLOCK
      ?auto_169755 - BLOCK
      ?auto_169756 - BLOCK
      ?auto_169753 - BLOCK
      ?auto_169757 - BLOCK
      ?auto_169751 - BLOCK
      ?auto_169752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169754 ?auto_169750 ) ( ON-TABLE ?auto_169749 ) ( ON ?auto_169750 ?auto_169749 ) ( not ( = ?auto_169749 ?auto_169750 ) ) ( not ( = ?auto_169749 ?auto_169754 ) ) ( not ( = ?auto_169750 ?auto_169754 ) ) ( not ( = ?auto_169749 ?auto_169755 ) ) ( not ( = ?auto_169749 ?auto_169756 ) ) ( not ( = ?auto_169750 ?auto_169755 ) ) ( not ( = ?auto_169750 ?auto_169756 ) ) ( not ( = ?auto_169754 ?auto_169755 ) ) ( not ( = ?auto_169754 ?auto_169756 ) ) ( not ( = ?auto_169755 ?auto_169756 ) ) ( ON ?auto_169755 ?auto_169754 ) ( not ( = ?auto_169753 ?auto_169757 ) ) ( not ( = ?auto_169753 ?auto_169751 ) ) ( not ( = ?auto_169753 ?auto_169756 ) ) ( not ( = ?auto_169757 ?auto_169751 ) ) ( not ( = ?auto_169757 ?auto_169756 ) ) ( not ( = ?auto_169751 ?auto_169756 ) ) ( not ( = ?auto_169749 ?auto_169751 ) ) ( not ( = ?auto_169749 ?auto_169753 ) ) ( not ( = ?auto_169749 ?auto_169757 ) ) ( not ( = ?auto_169750 ?auto_169751 ) ) ( not ( = ?auto_169750 ?auto_169753 ) ) ( not ( = ?auto_169750 ?auto_169757 ) ) ( not ( = ?auto_169754 ?auto_169751 ) ) ( not ( = ?auto_169754 ?auto_169753 ) ) ( not ( = ?auto_169754 ?auto_169757 ) ) ( not ( = ?auto_169755 ?auto_169751 ) ) ( not ( = ?auto_169755 ?auto_169753 ) ) ( not ( = ?auto_169755 ?auto_169757 ) ) ( ON ?auto_169753 ?auto_169752 ) ( not ( = ?auto_169749 ?auto_169752 ) ) ( not ( = ?auto_169750 ?auto_169752 ) ) ( not ( = ?auto_169754 ?auto_169752 ) ) ( not ( = ?auto_169755 ?auto_169752 ) ) ( not ( = ?auto_169756 ?auto_169752 ) ) ( not ( = ?auto_169753 ?auto_169752 ) ) ( not ( = ?auto_169757 ?auto_169752 ) ) ( not ( = ?auto_169751 ?auto_169752 ) ) ( ON ?auto_169757 ?auto_169753 ) ( ON-TABLE ?auto_169752 ) ( ON ?auto_169751 ?auto_169757 ) ( CLEAR ?auto_169755 ) ( ON ?auto_169756 ?auto_169751 ) ( CLEAR ?auto_169756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169752 ?auto_169753 ?auto_169757 ?auto_169751 )
      ( MAKE-2PILE ?auto_169749 ?auto_169750 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169758 - BLOCK
      ?auto_169759 - BLOCK
    )
    :vars
    (
      ?auto_169762 - BLOCK
      ?auto_169761 - BLOCK
      ?auto_169760 - BLOCK
      ?auto_169763 - BLOCK
      ?auto_169765 - BLOCK
      ?auto_169764 - BLOCK
      ?auto_169766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169762 ?auto_169759 ) ( ON-TABLE ?auto_169758 ) ( ON ?auto_169759 ?auto_169758 ) ( not ( = ?auto_169758 ?auto_169759 ) ) ( not ( = ?auto_169758 ?auto_169762 ) ) ( not ( = ?auto_169759 ?auto_169762 ) ) ( not ( = ?auto_169758 ?auto_169761 ) ) ( not ( = ?auto_169758 ?auto_169760 ) ) ( not ( = ?auto_169759 ?auto_169761 ) ) ( not ( = ?auto_169759 ?auto_169760 ) ) ( not ( = ?auto_169762 ?auto_169761 ) ) ( not ( = ?auto_169762 ?auto_169760 ) ) ( not ( = ?auto_169761 ?auto_169760 ) ) ( not ( = ?auto_169763 ?auto_169765 ) ) ( not ( = ?auto_169763 ?auto_169764 ) ) ( not ( = ?auto_169763 ?auto_169760 ) ) ( not ( = ?auto_169765 ?auto_169764 ) ) ( not ( = ?auto_169765 ?auto_169760 ) ) ( not ( = ?auto_169764 ?auto_169760 ) ) ( not ( = ?auto_169758 ?auto_169764 ) ) ( not ( = ?auto_169758 ?auto_169763 ) ) ( not ( = ?auto_169758 ?auto_169765 ) ) ( not ( = ?auto_169759 ?auto_169764 ) ) ( not ( = ?auto_169759 ?auto_169763 ) ) ( not ( = ?auto_169759 ?auto_169765 ) ) ( not ( = ?auto_169762 ?auto_169764 ) ) ( not ( = ?auto_169762 ?auto_169763 ) ) ( not ( = ?auto_169762 ?auto_169765 ) ) ( not ( = ?auto_169761 ?auto_169764 ) ) ( not ( = ?auto_169761 ?auto_169763 ) ) ( not ( = ?auto_169761 ?auto_169765 ) ) ( ON ?auto_169763 ?auto_169766 ) ( not ( = ?auto_169758 ?auto_169766 ) ) ( not ( = ?auto_169759 ?auto_169766 ) ) ( not ( = ?auto_169762 ?auto_169766 ) ) ( not ( = ?auto_169761 ?auto_169766 ) ) ( not ( = ?auto_169760 ?auto_169766 ) ) ( not ( = ?auto_169763 ?auto_169766 ) ) ( not ( = ?auto_169765 ?auto_169766 ) ) ( not ( = ?auto_169764 ?auto_169766 ) ) ( ON ?auto_169765 ?auto_169763 ) ( ON-TABLE ?auto_169766 ) ( ON ?auto_169764 ?auto_169765 ) ( ON ?auto_169760 ?auto_169764 ) ( CLEAR ?auto_169760 ) ( HOLDING ?auto_169761 ) ( CLEAR ?auto_169762 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169758 ?auto_169759 ?auto_169762 ?auto_169761 )
      ( MAKE-2PILE ?auto_169758 ?auto_169759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169767 - BLOCK
      ?auto_169768 - BLOCK
    )
    :vars
    (
      ?auto_169771 - BLOCK
      ?auto_169775 - BLOCK
      ?auto_169772 - BLOCK
      ?auto_169774 - BLOCK
      ?auto_169773 - BLOCK
      ?auto_169769 - BLOCK
      ?auto_169770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169771 ?auto_169768 ) ( ON-TABLE ?auto_169767 ) ( ON ?auto_169768 ?auto_169767 ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( not ( = ?auto_169767 ?auto_169771 ) ) ( not ( = ?auto_169768 ?auto_169771 ) ) ( not ( = ?auto_169767 ?auto_169775 ) ) ( not ( = ?auto_169767 ?auto_169772 ) ) ( not ( = ?auto_169768 ?auto_169775 ) ) ( not ( = ?auto_169768 ?auto_169772 ) ) ( not ( = ?auto_169771 ?auto_169775 ) ) ( not ( = ?auto_169771 ?auto_169772 ) ) ( not ( = ?auto_169775 ?auto_169772 ) ) ( not ( = ?auto_169774 ?auto_169773 ) ) ( not ( = ?auto_169774 ?auto_169769 ) ) ( not ( = ?auto_169774 ?auto_169772 ) ) ( not ( = ?auto_169773 ?auto_169769 ) ) ( not ( = ?auto_169773 ?auto_169772 ) ) ( not ( = ?auto_169769 ?auto_169772 ) ) ( not ( = ?auto_169767 ?auto_169769 ) ) ( not ( = ?auto_169767 ?auto_169774 ) ) ( not ( = ?auto_169767 ?auto_169773 ) ) ( not ( = ?auto_169768 ?auto_169769 ) ) ( not ( = ?auto_169768 ?auto_169774 ) ) ( not ( = ?auto_169768 ?auto_169773 ) ) ( not ( = ?auto_169771 ?auto_169769 ) ) ( not ( = ?auto_169771 ?auto_169774 ) ) ( not ( = ?auto_169771 ?auto_169773 ) ) ( not ( = ?auto_169775 ?auto_169769 ) ) ( not ( = ?auto_169775 ?auto_169774 ) ) ( not ( = ?auto_169775 ?auto_169773 ) ) ( ON ?auto_169774 ?auto_169770 ) ( not ( = ?auto_169767 ?auto_169770 ) ) ( not ( = ?auto_169768 ?auto_169770 ) ) ( not ( = ?auto_169771 ?auto_169770 ) ) ( not ( = ?auto_169775 ?auto_169770 ) ) ( not ( = ?auto_169772 ?auto_169770 ) ) ( not ( = ?auto_169774 ?auto_169770 ) ) ( not ( = ?auto_169773 ?auto_169770 ) ) ( not ( = ?auto_169769 ?auto_169770 ) ) ( ON ?auto_169773 ?auto_169774 ) ( ON-TABLE ?auto_169770 ) ( ON ?auto_169769 ?auto_169773 ) ( ON ?auto_169772 ?auto_169769 ) ( CLEAR ?auto_169771 ) ( ON ?auto_169775 ?auto_169772 ) ( CLEAR ?auto_169775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169770 ?auto_169774 ?auto_169773 ?auto_169769 ?auto_169772 )
      ( MAKE-2PILE ?auto_169767 ?auto_169768 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169794 - BLOCK
      ?auto_169795 - BLOCK
    )
    :vars
    (
      ?auto_169801 - BLOCK
      ?auto_169796 - BLOCK
      ?auto_169800 - BLOCK
      ?auto_169799 - BLOCK
      ?auto_169802 - BLOCK
      ?auto_169797 - BLOCK
      ?auto_169798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169794 ) ( not ( = ?auto_169794 ?auto_169795 ) ) ( not ( = ?auto_169794 ?auto_169801 ) ) ( not ( = ?auto_169795 ?auto_169801 ) ) ( not ( = ?auto_169794 ?auto_169796 ) ) ( not ( = ?auto_169794 ?auto_169800 ) ) ( not ( = ?auto_169795 ?auto_169796 ) ) ( not ( = ?auto_169795 ?auto_169800 ) ) ( not ( = ?auto_169801 ?auto_169796 ) ) ( not ( = ?auto_169801 ?auto_169800 ) ) ( not ( = ?auto_169796 ?auto_169800 ) ) ( not ( = ?auto_169799 ?auto_169802 ) ) ( not ( = ?auto_169799 ?auto_169797 ) ) ( not ( = ?auto_169799 ?auto_169800 ) ) ( not ( = ?auto_169802 ?auto_169797 ) ) ( not ( = ?auto_169802 ?auto_169800 ) ) ( not ( = ?auto_169797 ?auto_169800 ) ) ( not ( = ?auto_169794 ?auto_169797 ) ) ( not ( = ?auto_169794 ?auto_169799 ) ) ( not ( = ?auto_169794 ?auto_169802 ) ) ( not ( = ?auto_169795 ?auto_169797 ) ) ( not ( = ?auto_169795 ?auto_169799 ) ) ( not ( = ?auto_169795 ?auto_169802 ) ) ( not ( = ?auto_169801 ?auto_169797 ) ) ( not ( = ?auto_169801 ?auto_169799 ) ) ( not ( = ?auto_169801 ?auto_169802 ) ) ( not ( = ?auto_169796 ?auto_169797 ) ) ( not ( = ?auto_169796 ?auto_169799 ) ) ( not ( = ?auto_169796 ?auto_169802 ) ) ( ON ?auto_169799 ?auto_169798 ) ( not ( = ?auto_169794 ?auto_169798 ) ) ( not ( = ?auto_169795 ?auto_169798 ) ) ( not ( = ?auto_169801 ?auto_169798 ) ) ( not ( = ?auto_169796 ?auto_169798 ) ) ( not ( = ?auto_169800 ?auto_169798 ) ) ( not ( = ?auto_169799 ?auto_169798 ) ) ( not ( = ?auto_169802 ?auto_169798 ) ) ( not ( = ?auto_169797 ?auto_169798 ) ) ( ON ?auto_169802 ?auto_169799 ) ( ON-TABLE ?auto_169798 ) ( ON ?auto_169797 ?auto_169802 ) ( ON ?auto_169800 ?auto_169797 ) ( ON ?auto_169796 ?auto_169800 ) ( ON ?auto_169801 ?auto_169796 ) ( CLEAR ?auto_169801 ) ( HOLDING ?auto_169795 ) ( CLEAR ?auto_169794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169794 ?auto_169795 ?auto_169801 )
      ( MAKE-2PILE ?auto_169794 ?auto_169795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169803 - BLOCK
      ?auto_169804 - BLOCK
    )
    :vars
    (
      ?auto_169808 - BLOCK
      ?auto_169809 - BLOCK
      ?auto_169806 - BLOCK
      ?auto_169810 - BLOCK
      ?auto_169807 - BLOCK
      ?auto_169811 - BLOCK
      ?auto_169805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169803 ) ( not ( = ?auto_169803 ?auto_169804 ) ) ( not ( = ?auto_169803 ?auto_169808 ) ) ( not ( = ?auto_169804 ?auto_169808 ) ) ( not ( = ?auto_169803 ?auto_169809 ) ) ( not ( = ?auto_169803 ?auto_169806 ) ) ( not ( = ?auto_169804 ?auto_169809 ) ) ( not ( = ?auto_169804 ?auto_169806 ) ) ( not ( = ?auto_169808 ?auto_169809 ) ) ( not ( = ?auto_169808 ?auto_169806 ) ) ( not ( = ?auto_169809 ?auto_169806 ) ) ( not ( = ?auto_169810 ?auto_169807 ) ) ( not ( = ?auto_169810 ?auto_169811 ) ) ( not ( = ?auto_169810 ?auto_169806 ) ) ( not ( = ?auto_169807 ?auto_169811 ) ) ( not ( = ?auto_169807 ?auto_169806 ) ) ( not ( = ?auto_169811 ?auto_169806 ) ) ( not ( = ?auto_169803 ?auto_169811 ) ) ( not ( = ?auto_169803 ?auto_169810 ) ) ( not ( = ?auto_169803 ?auto_169807 ) ) ( not ( = ?auto_169804 ?auto_169811 ) ) ( not ( = ?auto_169804 ?auto_169810 ) ) ( not ( = ?auto_169804 ?auto_169807 ) ) ( not ( = ?auto_169808 ?auto_169811 ) ) ( not ( = ?auto_169808 ?auto_169810 ) ) ( not ( = ?auto_169808 ?auto_169807 ) ) ( not ( = ?auto_169809 ?auto_169811 ) ) ( not ( = ?auto_169809 ?auto_169810 ) ) ( not ( = ?auto_169809 ?auto_169807 ) ) ( ON ?auto_169810 ?auto_169805 ) ( not ( = ?auto_169803 ?auto_169805 ) ) ( not ( = ?auto_169804 ?auto_169805 ) ) ( not ( = ?auto_169808 ?auto_169805 ) ) ( not ( = ?auto_169809 ?auto_169805 ) ) ( not ( = ?auto_169806 ?auto_169805 ) ) ( not ( = ?auto_169810 ?auto_169805 ) ) ( not ( = ?auto_169807 ?auto_169805 ) ) ( not ( = ?auto_169811 ?auto_169805 ) ) ( ON ?auto_169807 ?auto_169810 ) ( ON-TABLE ?auto_169805 ) ( ON ?auto_169811 ?auto_169807 ) ( ON ?auto_169806 ?auto_169811 ) ( ON ?auto_169809 ?auto_169806 ) ( ON ?auto_169808 ?auto_169809 ) ( CLEAR ?auto_169803 ) ( ON ?auto_169804 ?auto_169808 ) ( CLEAR ?auto_169804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169805 ?auto_169810 ?auto_169807 ?auto_169811 ?auto_169806 ?auto_169809 ?auto_169808 )
      ( MAKE-2PILE ?auto_169803 ?auto_169804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169812 - BLOCK
      ?auto_169813 - BLOCK
    )
    :vars
    (
      ?auto_169818 - BLOCK
      ?auto_169820 - BLOCK
      ?auto_169814 - BLOCK
      ?auto_169815 - BLOCK
      ?auto_169819 - BLOCK
      ?auto_169817 - BLOCK
      ?auto_169816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169812 ?auto_169813 ) ) ( not ( = ?auto_169812 ?auto_169818 ) ) ( not ( = ?auto_169813 ?auto_169818 ) ) ( not ( = ?auto_169812 ?auto_169820 ) ) ( not ( = ?auto_169812 ?auto_169814 ) ) ( not ( = ?auto_169813 ?auto_169820 ) ) ( not ( = ?auto_169813 ?auto_169814 ) ) ( not ( = ?auto_169818 ?auto_169820 ) ) ( not ( = ?auto_169818 ?auto_169814 ) ) ( not ( = ?auto_169820 ?auto_169814 ) ) ( not ( = ?auto_169815 ?auto_169819 ) ) ( not ( = ?auto_169815 ?auto_169817 ) ) ( not ( = ?auto_169815 ?auto_169814 ) ) ( not ( = ?auto_169819 ?auto_169817 ) ) ( not ( = ?auto_169819 ?auto_169814 ) ) ( not ( = ?auto_169817 ?auto_169814 ) ) ( not ( = ?auto_169812 ?auto_169817 ) ) ( not ( = ?auto_169812 ?auto_169815 ) ) ( not ( = ?auto_169812 ?auto_169819 ) ) ( not ( = ?auto_169813 ?auto_169817 ) ) ( not ( = ?auto_169813 ?auto_169815 ) ) ( not ( = ?auto_169813 ?auto_169819 ) ) ( not ( = ?auto_169818 ?auto_169817 ) ) ( not ( = ?auto_169818 ?auto_169815 ) ) ( not ( = ?auto_169818 ?auto_169819 ) ) ( not ( = ?auto_169820 ?auto_169817 ) ) ( not ( = ?auto_169820 ?auto_169815 ) ) ( not ( = ?auto_169820 ?auto_169819 ) ) ( ON ?auto_169815 ?auto_169816 ) ( not ( = ?auto_169812 ?auto_169816 ) ) ( not ( = ?auto_169813 ?auto_169816 ) ) ( not ( = ?auto_169818 ?auto_169816 ) ) ( not ( = ?auto_169820 ?auto_169816 ) ) ( not ( = ?auto_169814 ?auto_169816 ) ) ( not ( = ?auto_169815 ?auto_169816 ) ) ( not ( = ?auto_169819 ?auto_169816 ) ) ( not ( = ?auto_169817 ?auto_169816 ) ) ( ON ?auto_169819 ?auto_169815 ) ( ON-TABLE ?auto_169816 ) ( ON ?auto_169817 ?auto_169819 ) ( ON ?auto_169814 ?auto_169817 ) ( ON ?auto_169820 ?auto_169814 ) ( ON ?auto_169818 ?auto_169820 ) ( ON ?auto_169813 ?auto_169818 ) ( CLEAR ?auto_169813 ) ( HOLDING ?auto_169812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169812 )
      ( MAKE-2PILE ?auto_169812 ?auto_169813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169821 - BLOCK
      ?auto_169822 - BLOCK
    )
    :vars
    (
      ?auto_169829 - BLOCK
      ?auto_169825 - BLOCK
      ?auto_169827 - BLOCK
      ?auto_169826 - BLOCK
      ?auto_169823 - BLOCK
      ?auto_169824 - BLOCK
      ?auto_169828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169821 ?auto_169822 ) ) ( not ( = ?auto_169821 ?auto_169829 ) ) ( not ( = ?auto_169822 ?auto_169829 ) ) ( not ( = ?auto_169821 ?auto_169825 ) ) ( not ( = ?auto_169821 ?auto_169827 ) ) ( not ( = ?auto_169822 ?auto_169825 ) ) ( not ( = ?auto_169822 ?auto_169827 ) ) ( not ( = ?auto_169829 ?auto_169825 ) ) ( not ( = ?auto_169829 ?auto_169827 ) ) ( not ( = ?auto_169825 ?auto_169827 ) ) ( not ( = ?auto_169826 ?auto_169823 ) ) ( not ( = ?auto_169826 ?auto_169824 ) ) ( not ( = ?auto_169826 ?auto_169827 ) ) ( not ( = ?auto_169823 ?auto_169824 ) ) ( not ( = ?auto_169823 ?auto_169827 ) ) ( not ( = ?auto_169824 ?auto_169827 ) ) ( not ( = ?auto_169821 ?auto_169824 ) ) ( not ( = ?auto_169821 ?auto_169826 ) ) ( not ( = ?auto_169821 ?auto_169823 ) ) ( not ( = ?auto_169822 ?auto_169824 ) ) ( not ( = ?auto_169822 ?auto_169826 ) ) ( not ( = ?auto_169822 ?auto_169823 ) ) ( not ( = ?auto_169829 ?auto_169824 ) ) ( not ( = ?auto_169829 ?auto_169826 ) ) ( not ( = ?auto_169829 ?auto_169823 ) ) ( not ( = ?auto_169825 ?auto_169824 ) ) ( not ( = ?auto_169825 ?auto_169826 ) ) ( not ( = ?auto_169825 ?auto_169823 ) ) ( ON ?auto_169826 ?auto_169828 ) ( not ( = ?auto_169821 ?auto_169828 ) ) ( not ( = ?auto_169822 ?auto_169828 ) ) ( not ( = ?auto_169829 ?auto_169828 ) ) ( not ( = ?auto_169825 ?auto_169828 ) ) ( not ( = ?auto_169827 ?auto_169828 ) ) ( not ( = ?auto_169826 ?auto_169828 ) ) ( not ( = ?auto_169823 ?auto_169828 ) ) ( not ( = ?auto_169824 ?auto_169828 ) ) ( ON ?auto_169823 ?auto_169826 ) ( ON-TABLE ?auto_169828 ) ( ON ?auto_169824 ?auto_169823 ) ( ON ?auto_169827 ?auto_169824 ) ( ON ?auto_169825 ?auto_169827 ) ( ON ?auto_169829 ?auto_169825 ) ( ON ?auto_169822 ?auto_169829 ) ( ON ?auto_169821 ?auto_169822 ) ( CLEAR ?auto_169821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169828 ?auto_169826 ?auto_169823 ?auto_169824 ?auto_169827 ?auto_169825 ?auto_169829 ?auto_169822 )
      ( MAKE-2PILE ?auto_169821 ?auto_169822 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169836 - BLOCK
      ?auto_169837 - BLOCK
      ?auto_169838 - BLOCK
      ?auto_169839 - BLOCK
      ?auto_169840 - BLOCK
      ?auto_169841 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169841 ) ( CLEAR ?auto_169840 ) ( ON-TABLE ?auto_169836 ) ( ON ?auto_169837 ?auto_169836 ) ( ON ?auto_169838 ?auto_169837 ) ( ON ?auto_169839 ?auto_169838 ) ( ON ?auto_169840 ?auto_169839 ) ( not ( = ?auto_169836 ?auto_169837 ) ) ( not ( = ?auto_169836 ?auto_169838 ) ) ( not ( = ?auto_169836 ?auto_169839 ) ) ( not ( = ?auto_169836 ?auto_169840 ) ) ( not ( = ?auto_169836 ?auto_169841 ) ) ( not ( = ?auto_169837 ?auto_169838 ) ) ( not ( = ?auto_169837 ?auto_169839 ) ) ( not ( = ?auto_169837 ?auto_169840 ) ) ( not ( = ?auto_169837 ?auto_169841 ) ) ( not ( = ?auto_169838 ?auto_169839 ) ) ( not ( = ?auto_169838 ?auto_169840 ) ) ( not ( = ?auto_169838 ?auto_169841 ) ) ( not ( = ?auto_169839 ?auto_169840 ) ) ( not ( = ?auto_169839 ?auto_169841 ) ) ( not ( = ?auto_169840 ?auto_169841 ) ) )
    :subtasks
    ( ( !STACK ?auto_169841 ?auto_169840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169842 - BLOCK
      ?auto_169843 - BLOCK
      ?auto_169844 - BLOCK
      ?auto_169845 - BLOCK
      ?auto_169846 - BLOCK
      ?auto_169847 - BLOCK
    )
    :vars
    (
      ?auto_169848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169846 ) ( ON-TABLE ?auto_169842 ) ( ON ?auto_169843 ?auto_169842 ) ( ON ?auto_169844 ?auto_169843 ) ( ON ?auto_169845 ?auto_169844 ) ( ON ?auto_169846 ?auto_169845 ) ( not ( = ?auto_169842 ?auto_169843 ) ) ( not ( = ?auto_169842 ?auto_169844 ) ) ( not ( = ?auto_169842 ?auto_169845 ) ) ( not ( = ?auto_169842 ?auto_169846 ) ) ( not ( = ?auto_169842 ?auto_169847 ) ) ( not ( = ?auto_169843 ?auto_169844 ) ) ( not ( = ?auto_169843 ?auto_169845 ) ) ( not ( = ?auto_169843 ?auto_169846 ) ) ( not ( = ?auto_169843 ?auto_169847 ) ) ( not ( = ?auto_169844 ?auto_169845 ) ) ( not ( = ?auto_169844 ?auto_169846 ) ) ( not ( = ?auto_169844 ?auto_169847 ) ) ( not ( = ?auto_169845 ?auto_169846 ) ) ( not ( = ?auto_169845 ?auto_169847 ) ) ( not ( = ?auto_169846 ?auto_169847 ) ) ( ON ?auto_169847 ?auto_169848 ) ( CLEAR ?auto_169847 ) ( HAND-EMPTY ) ( not ( = ?auto_169842 ?auto_169848 ) ) ( not ( = ?auto_169843 ?auto_169848 ) ) ( not ( = ?auto_169844 ?auto_169848 ) ) ( not ( = ?auto_169845 ?auto_169848 ) ) ( not ( = ?auto_169846 ?auto_169848 ) ) ( not ( = ?auto_169847 ?auto_169848 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169847 ?auto_169848 )
      ( MAKE-6PILE ?auto_169842 ?auto_169843 ?auto_169844 ?auto_169845 ?auto_169846 ?auto_169847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169849 - BLOCK
      ?auto_169850 - BLOCK
      ?auto_169851 - BLOCK
      ?auto_169852 - BLOCK
      ?auto_169853 - BLOCK
      ?auto_169854 - BLOCK
    )
    :vars
    (
      ?auto_169855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169849 ) ( ON ?auto_169850 ?auto_169849 ) ( ON ?auto_169851 ?auto_169850 ) ( ON ?auto_169852 ?auto_169851 ) ( not ( = ?auto_169849 ?auto_169850 ) ) ( not ( = ?auto_169849 ?auto_169851 ) ) ( not ( = ?auto_169849 ?auto_169852 ) ) ( not ( = ?auto_169849 ?auto_169853 ) ) ( not ( = ?auto_169849 ?auto_169854 ) ) ( not ( = ?auto_169850 ?auto_169851 ) ) ( not ( = ?auto_169850 ?auto_169852 ) ) ( not ( = ?auto_169850 ?auto_169853 ) ) ( not ( = ?auto_169850 ?auto_169854 ) ) ( not ( = ?auto_169851 ?auto_169852 ) ) ( not ( = ?auto_169851 ?auto_169853 ) ) ( not ( = ?auto_169851 ?auto_169854 ) ) ( not ( = ?auto_169852 ?auto_169853 ) ) ( not ( = ?auto_169852 ?auto_169854 ) ) ( not ( = ?auto_169853 ?auto_169854 ) ) ( ON ?auto_169854 ?auto_169855 ) ( CLEAR ?auto_169854 ) ( not ( = ?auto_169849 ?auto_169855 ) ) ( not ( = ?auto_169850 ?auto_169855 ) ) ( not ( = ?auto_169851 ?auto_169855 ) ) ( not ( = ?auto_169852 ?auto_169855 ) ) ( not ( = ?auto_169853 ?auto_169855 ) ) ( not ( = ?auto_169854 ?auto_169855 ) ) ( HOLDING ?auto_169853 ) ( CLEAR ?auto_169852 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169849 ?auto_169850 ?auto_169851 ?auto_169852 ?auto_169853 )
      ( MAKE-6PILE ?auto_169849 ?auto_169850 ?auto_169851 ?auto_169852 ?auto_169853 ?auto_169854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169856 - BLOCK
      ?auto_169857 - BLOCK
      ?auto_169858 - BLOCK
      ?auto_169859 - BLOCK
      ?auto_169860 - BLOCK
      ?auto_169861 - BLOCK
    )
    :vars
    (
      ?auto_169862 - BLOCK
      ?auto_169863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169856 ) ( ON ?auto_169857 ?auto_169856 ) ( ON ?auto_169858 ?auto_169857 ) ( ON ?auto_169859 ?auto_169858 ) ( not ( = ?auto_169856 ?auto_169857 ) ) ( not ( = ?auto_169856 ?auto_169858 ) ) ( not ( = ?auto_169856 ?auto_169859 ) ) ( not ( = ?auto_169856 ?auto_169860 ) ) ( not ( = ?auto_169856 ?auto_169861 ) ) ( not ( = ?auto_169857 ?auto_169858 ) ) ( not ( = ?auto_169857 ?auto_169859 ) ) ( not ( = ?auto_169857 ?auto_169860 ) ) ( not ( = ?auto_169857 ?auto_169861 ) ) ( not ( = ?auto_169858 ?auto_169859 ) ) ( not ( = ?auto_169858 ?auto_169860 ) ) ( not ( = ?auto_169858 ?auto_169861 ) ) ( not ( = ?auto_169859 ?auto_169860 ) ) ( not ( = ?auto_169859 ?auto_169861 ) ) ( not ( = ?auto_169860 ?auto_169861 ) ) ( ON ?auto_169861 ?auto_169862 ) ( not ( = ?auto_169856 ?auto_169862 ) ) ( not ( = ?auto_169857 ?auto_169862 ) ) ( not ( = ?auto_169858 ?auto_169862 ) ) ( not ( = ?auto_169859 ?auto_169862 ) ) ( not ( = ?auto_169860 ?auto_169862 ) ) ( not ( = ?auto_169861 ?auto_169862 ) ) ( CLEAR ?auto_169859 ) ( ON ?auto_169860 ?auto_169861 ) ( CLEAR ?auto_169860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169863 ) ( ON ?auto_169862 ?auto_169863 ) ( not ( = ?auto_169863 ?auto_169862 ) ) ( not ( = ?auto_169863 ?auto_169861 ) ) ( not ( = ?auto_169863 ?auto_169860 ) ) ( not ( = ?auto_169856 ?auto_169863 ) ) ( not ( = ?auto_169857 ?auto_169863 ) ) ( not ( = ?auto_169858 ?auto_169863 ) ) ( not ( = ?auto_169859 ?auto_169863 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169863 ?auto_169862 ?auto_169861 )
      ( MAKE-6PILE ?auto_169856 ?auto_169857 ?auto_169858 ?auto_169859 ?auto_169860 ?auto_169861 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169864 - BLOCK
      ?auto_169865 - BLOCK
      ?auto_169866 - BLOCK
      ?auto_169867 - BLOCK
      ?auto_169868 - BLOCK
      ?auto_169869 - BLOCK
    )
    :vars
    (
      ?auto_169871 - BLOCK
      ?auto_169870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169864 ) ( ON ?auto_169865 ?auto_169864 ) ( ON ?auto_169866 ?auto_169865 ) ( not ( = ?auto_169864 ?auto_169865 ) ) ( not ( = ?auto_169864 ?auto_169866 ) ) ( not ( = ?auto_169864 ?auto_169867 ) ) ( not ( = ?auto_169864 ?auto_169868 ) ) ( not ( = ?auto_169864 ?auto_169869 ) ) ( not ( = ?auto_169865 ?auto_169866 ) ) ( not ( = ?auto_169865 ?auto_169867 ) ) ( not ( = ?auto_169865 ?auto_169868 ) ) ( not ( = ?auto_169865 ?auto_169869 ) ) ( not ( = ?auto_169866 ?auto_169867 ) ) ( not ( = ?auto_169866 ?auto_169868 ) ) ( not ( = ?auto_169866 ?auto_169869 ) ) ( not ( = ?auto_169867 ?auto_169868 ) ) ( not ( = ?auto_169867 ?auto_169869 ) ) ( not ( = ?auto_169868 ?auto_169869 ) ) ( ON ?auto_169869 ?auto_169871 ) ( not ( = ?auto_169864 ?auto_169871 ) ) ( not ( = ?auto_169865 ?auto_169871 ) ) ( not ( = ?auto_169866 ?auto_169871 ) ) ( not ( = ?auto_169867 ?auto_169871 ) ) ( not ( = ?auto_169868 ?auto_169871 ) ) ( not ( = ?auto_169869 ?auto_169871 ) ) ( ON ?auto_169868 ?auto_169869 ) ( CLEAR ?auto_169868 ) ( ON-TABLE ?auto_169870 ) ( ON ?auto_169871 ?auto_169870 ) ( not ( = ?auto_169870 ?auto_169871 ) ) ( not ( = ?auto_169870 ?auto_169869 ) ) ( not ( = ?auto_169870 ?auto_169868 ) ) ( not ( = ?auto_169864 ?auto_169870 ) ) ( not ( = ?auto_169865 ?auto_169870 ) ) ( not ( = ?auto_169866 ?auto_169870 ) ) ( not ( = ?auto_169867 ?auto_169870 ) ) ( HOLDING ?auto_169867 ) ( CLEAR ?auto_169866 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169864 ?auto_169865 ?auto_169866 ?auto_169867 )
      ( MAKE-6PILE ?auto_169864 ?auto_169865 ?auto_169866 ?auto_169867 ?auto_169868 ?auto_169869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169872 - BLOCK
      ?auto_169873 - BLOCK
      ?auto_169874 - BLOCK
      ?auto_169875 - BLOCK
      ?auto_169876 - BLOCK
      ?auto_169877 - BLOCK
    )
    :vars
    (
      ?auto_169878 - BLOCK
      ?auto_169879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169872 ) ( ON ?auto_169873 ?auto_169872 ) ( ON ?auto_169874 ?auto_169873 ) ( not ( = ?auto_169872 ?auto_169873 ) ) ( not ( = ?auto_169872 ?auto_169874 ) ) ( not ( = ?auto_169872 ?auto_169875 ) ) ( not ( = ?auto_169872 ?auto_169876 ) ) ( not ( = ?auto_169872 ?auto_169877 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169873 ?auto_169875 ) ) ( not ( = ?auto_169873 ?auto_169876 ) ) ( not ( = ?auto_169873 ?auto_169877 ) ) ( not ( = ?auto_169874 ?auto_169875 ) ) ( not ( = ?auto_169874 ?auto_169876 ) ) ( not ( = ?auto_169874 ?auto_169877 ) ) ( not ( = ?auto_169875 ?auto_169876 ) ) ( not ( = ?auto_169875 ?auto_169877 ) ) ( not ( = ?auto_169876 ?auto_169877 ) ) ( ON ?auto_169877 ?auto_169878 ) ( not ( = ?auto_169872 ?auto_169878 ) ) ( not ( = ?auto_169873 ?auto_169878 ) ) ( not ( = ?auto_169874 ?auto_169878 ) ) ( not ( = ?auto_169875 ?auto_169878 ) ) ( not ( = ?auto_169876 ?auto_169878 ) ) ( not ( = ?auto_169877 ?auto_169878 ) ) ( ON ?auto_169876 ?auto_169877 ) ( ON-TABLE ?auto_169879 ) ( ON ?auto_169878 ?auto_169879 ) ( not ( = ?auto_169879 ?auto_169878 ) ) ( not ( = ?auto_169879 ?auto_169877 ) ) ( not ( = ?auto_169879 ?auto_169876 ) ) ( not ( = ?auto_169872 ?auto_169879 ) ) ( not ( = ?auto_169873 ?auto_169879 ) ) ( not ( = ?auto_169874 ?auto_169879 ) ) ( not ( = ?auto_169875 ?auto_169879 ) ) ( CLEAR ?auto_169874 ) ( ON ?auto_169875 ?auto_169876 ) ( CLEAR ?auto_169875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169879 ?auto_169878 ?auto_169877 ?auto_169876 )
      ( MAKE-6PILE ?auto_169872 ?auto_169873 ?auto_169874 ?auto_169875 ?auto_169876 ?auto_169877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169880 - BLOCK
      ?auto_169881 - BLOCK
      ?auto_169882 - BLOCK
      ?auto_169883 - BLOCK
      ?auto_169884 - BLOCK
      ?auto_169885 - BLOCK
    )
    :vars
    (
      ?auto_169886 - BLOCK
      ?auto_169887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169880 ) ( ON ?auto_169881 ?auto_169880 ) ( not ( = ?auto_169880 ?auto_169881 ) ) ( not ( = ?auto_169880 ?auto_169882 ) ) ( not ( = ?auto_169880 ?auto_169883 ) ) ( not ( = ?auto_169880 ?auto_169884 ) ) ( not ( = ?auto_169880 ?auto_169885 ) ) ( not ( = ?auto_169881 ?auto_169882 ) ) ( not ( = ?auto_169881 ?auto_169883 ) ) ( not ( = ?auto_169881 ?auto_169884 ) ) ( not ( = ?auto_169881 ?auto_169885 ) ) ( not ( = ?auto_169882 ?auto_169883 ) ) ( not ( = ?auto_169882 ?auto_169884 ) ) ( not ( = ?auto_169882 ?auto_169885 ) ) ( not ( = ?auto_169883 ?auto_169884 ) ) ( not ( = ?auto_169883 ?auto_169885 ) ) ( not ( = ?auto_169884 ?auto_169885 ) ) ( ON ?auto_169885 ?auto_169886 ) ( not ( = ?auto_169880 ?auto_169886 ) ) ( not ( = ?auto_169881 ?auto_169886 ) ) ( not ( = ?auto_169882 ?auto_169886 ) ) ( not ( = ?auto_169883 ?auto_169886 ) ) ( not ( = ?auto_169884 ?auto_169886 ) ) ( not ( = ?auto_169885 ?auto_169886 ) ) ( ON ?auto_169884 ?auto_169885 ) ( ON-TABLE ?auto_169887 ) ( ON ?auto_169886 ?auto_169887 ) ( not ( = ?auto_169887 ?auto_169886 ) ) ( not ( = ?auto_169887 ?auto_169885 ) ) ( not ( = ?auto_169887 ?auto_169884 ) ) ( not ( = ?auto_169880 ?auto_169887 ) ) ( not ( = ?auto_169881 ?auto_169887 ) ) ( not ( = ?auto_169882 ?auto_169887 ) ) ( not ( = ?auto_169883 ?auto_169887 ) ) ( ON ?auto_169883 ?auto_169884 ) ( CLEAR ?auto_169883 ) ( HOLDING ?auto_169882 ) ( CLEAR ?auto_169881 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169880 ?auto_169881 ?auto_169882 )
      ( MAKE-6PILE ?auto_169880 ?auto_169881 ?auto_169882 ?auto_169883 ?auto_169884 ?auto_169885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169888 - BLOCK
      ?auto_169889 - BLOCK
      ?auto_169890 - BLOCK
      ?auto_169891 - BLOCK
      ?auto_169892 - BLOCK
      ?auto_169893 - BLOCK
    )
    :vars
    (
      ?auto_169895 - BLOCK
      ?auto_169894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169888 ) ( ON ?auto_169889 ?auto_169888 ) ( not ( = ?auto_169888 ?auto_169889 ) ) ( not ( = ?auto_169888 ?auto_169890 ) ) ( not ( = ?auto_169888 ?auto_169891 ) ) ( not ( = ?auto_169888 ?auto_169892 ) ) ( not ( = ?auto_169888 ?auto_169893 ) ) ( not ( = ?auto_169889 ?auto_169890 ) ) ( not ( = ?auto_169889 ?auto_169891 ) ) ( not ( = ?auto_169889 ?auto_169892 ) ) ( not ( = ?auto_169889 ?auto_169893 ) ) ( not ( = ?auto_169890 ?auto_169891 ) ) ( not ( = ?auto_169890 ?auto_169892 ) ) ( not ( = ?auto_169890 ?auto_169893 ) ) ( not ( = ?auto_169891 ?auto_169892 ) ) ( not ( = ?auto_169891 ?auto_169893 ) ) ( not ( = ?auto_169892 ?auto_169893 ) ) ( ON ?auto_169893 ?auto_169895 ) ( not ( = ?auto_169888 ?auto_169895 ) ) ( not ( = ?auto_169889 ?auto_169895 ) ) ( not ( = ?auto_169890 ?auto_169895 ) ) ( not ( = ?auto_169891 ?auto_169895 ) ) ( not ( = ?auto_169892 ?auto_169895 ) ) ( not ( = ?auto_169893 ?auto_169895 ) ) ( ON ?auto_169892 ?auto_169893 ) ( ON-TABLE ?auto_169894 ) ( ON ?auto_169895 ?auto_169894 ) ( not ( = ?auto_169894 ?auto_169895 ) ) ( not ( = ?auto_169894 ?auto_169893 ) ) ( not ( = ?auto_169894 ?auto_169892 ) ) ( not ( = ?auto_169888 ?auto_169894 ) ) ( not ( = ?auto_169889 ?auto_169894 ) ) ( not ( = ?auto_169890 ?auto_169894 ) ) ( not ( = ?auto_169891 ?auto_169894 ) ) ( ON ?auto_169891 ?auto_169892 ) ( CLEAR ?auto_169889 ) ( ON ?auto_169890 ?auto_169891 ) ( CLEAR ?auto_169890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169894 ?auto_169895 ?auto_169893 ?auto_169892 ?auto_169891 )
      ( MAKE-6PILE ?auto_169888 ?auto_169889 ?auto_169890 ?auto_169891 ?auto_169892 ?auto_169893 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169896 - BLOCK
      ?auto_169897 - BLOCK
      ?auto_169898 - BLOCK
      ?auto_169899 - BLOCK
      ?auto_169900 - BLOCK
      ?auto_169901 - BLOCK
    )
    :vars
    (
      ?auto_169903 - BLOCK
      ?auto_169902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169896 ) ( not ( = ?auto_169896 ?auto_169897 ) ) ( not ( = ?auto_169896 ?auto_169898 ) ) ( not ( = ?auto_169896 ?auto_169899 ) ) ( not ( = ?auto_169896 ?auto_169900 ) ) ( not ( = ?auto_169896 ?auto_169901 ) ) ( not ( = ?auto_169897 ?auto_169898 ) ) ( not ( = ?auto_169897 ?auto_169899 ) ) ( not ( = ?auto_169897 ?auto_169900 ) ) ( not ( = ?auto_169897 ?auto_169901 ) ) ( not ( = ?auto_169898 ?auto_169899 ) ) ( not ( = ?auto_169898 ?auto_169900 ) ) ( not ( = ?auto_169898 ?auto_169901 ) ) ( not ( = ?auto_169899 ?auto_169900 ) ) ( not ( = ?auto_169899 ?auto_169901 ) ) ( not ( = ?auto_169900 ?auto_169901 ) ) ( ON ?auto_169901 ?auto_169903 ) ( not ( = ?auto_169896 ?auto_169903 ) ) ( not ( = ?auto_169897 ?auto_169903 ) ) ( not ( = ?auto_169898 ?auto_169903 ) ) ( not ( = ?auto_169899 ?auto_169903 ) ) ( not ( = ?auto_169900 ?auto_169903 ) ) ( not ( = ?auto_169901 ?auto_169903 ) ) ( ON ?auto_169900 ?auto_169901 ) ( ON-TABLE ?auto_169902 ) ( ON ?auto_169903 ?auto_169902 ) ( not ( = ?auto_169902 ?auto_169903 ) ) ( not ( = ?auto_169902 ?auto_169901 ) ) ( not ( = ?auto_169902 ?auto_169900 ) ) ( not ( = ?auto_169896 ?auto_169902 ) ) ( not ( = ?auto_169897 ?auto_169902 ) ) ( not ( = ?auto_169898 ?auto_169902 ) ) ( not ( = ?auto_169899 ?auto_169902 ) ) ( ON ?auto_169899 ?auto_169900 ) ( ON ?auto_169898 ?auto_169899 ) ( CLEAR ?auto_169898 ) ( HOLDING ?auto_169897 ) ( CLEAR ?auto_169896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169896 ?auto_169897 )
      ( MAKE-6PILE ?auto_169896 ?auto_169897 ?auto_169898 ?auto_169899 ?auto_169900 ?auto_169901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169904 - BLOCK
      ?auto_169905 - BLOCK
      ?auto_169906 - BLOCK
      ?auto_169907 - BLOCK
      ?auto_169908 - BLOCK
      ?auto_169909 - BLOCK
    )
    :vars
    (
      ?auto_169911 - BLOCK
      ?auto_169910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169904 ) ( not ( = ?auto_169904 ?auto_169905 ) ) ( not ( = ?auto_169904 ?auto_169906 ) ) ( not ( = ?auto_169904 ?auto_169907 ) ) ( not ( = ?auto_169904 ?auto_169908 ) ) ( not ( = ?auto_169904 ?auto_169909 ) ) ( not ( = ?auto_169905 ?auto_169906 ) ) ( not ( = ?auto_169905 ?auto_169907 ) ) ( not ( = ?auto_169905 ?auto_169908 ) ) ( not ( = ?auto_169905 ?auto_169909 ) ) ( not ( = ?auto_169906 ?auto_169907 ) ) ( not ( = ?auto_169906 ?auto_169908 ) ) ( not ( = ?auto_169906 ?auto_169909 ) ) ( not ( = ?auto_169907 ?auto_169908 ) ) ( not ( = ?auto_169907 ?auto_169909 ) ) ( not ( = ?auto_169908 ?auto_169909 ) ) ( ON ?auto_169909 ?auto_169911 ) ( not ( = ?auto_169904 ?auto_169911 ) ) ( not ( = ?auto_169905 ?auto_169911 ) ) ( not ( = ?auto_169906 ?auto_169911 ) ) ( not ( = ?auto_169907 ?auto_169911 ) ) ( not ( = ?auto_169908 ?auto_169911 ) ) ( not ( = ?auto_169909 ?auto_169911 ) ) ( ON ?auto_169908 ?auto_169909 ) ( ON-TABLE ?auto_169910 ) ( ON ?auto_169911 ?auto_169910 ) ( not ( = ?auto_169910 ?auto_169911 ) ) ( not ( = ?auto_169910 ?auto_169909 ) ) ( not ( = ?auto_169910 ?auto_169908 ) ) ( not ( = ?auto_169904 ?auto_169910 ) ) ( not ( = ?auto_169905 ?auto_169910 ) ) ( not ( = ?auto_169906 ?auto_169910 ) ) ( not ( = ?auto_169907 ?auto_169910 ) ) ( ON ?auto_169907 ?auto_169908 ) ( ON ?auto_169906 ?auto_169907 ) ( CLEAR ?auto_169904 ) ( ON ?auto_169905 ?auto_169906 ) ( CLEAR ?auto_169905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169910 ?auto_169911 ?auto_169909 ?auto_169908 ?auto_169907 ?auto_169906 )
      ( MAKE-6PILE ?auto_169904 ?auto_169905 ?auto_169906 ?auto_169907 ?auto_169908 ?auto_169909 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169912 - BLOCK
      ?auto_169913 - BLOCK
      ?auto_169914 - BLOCK
      ?auto_169915 - BLOCK
      ?auto_169916 - BLOCK
      ?auto_169917 - BLOCK
    )
    :vars
    (
      ?auto_169918 - BLOCK
      ?auto_169919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169912 ?auto_169913 ) ) ( not ( = ?auto_169912 ?auto_169914 ) ) ( not ( = ?auto_169912 ?auto_169915 ) ) ( not ( = ?auto_169912 ?auto_169916 ) ) ( not ( = ?auto_169912 ?auto_169917 ) ) ( not ( = ?auto_169913 ?auto_169914 ) ) ( not ( = ?auto_169913 ?auto_169915 ) ) ( not ( = ?auto_169913 ?auto_169916 ) ) ( not ( = ?auto_169913 ?auto_169917 ) ) ( not ( = ?auto_169914 ?auto_169915 ) ) ( not ( = ?auto_169914 ?auto_169916 ) ) ( not ( = ?auto_169914 ?auto_169917 ) ) ( not ( = ?auto_169915 ?auto_169916 ) ) ( not ( = ?auto_169915 ?auto_169917 ) ) ( not ( = ?auto_169916 ?auto_169917 ) ) ( ON ?auto_169917 ?auto_169918 ) ( not ( = ?auto_169912 ?auto_169918 ) ) ( not ( = ?auto_169913 ?auto_169918 ) ) ( not ( = ?auto_169914 ?auto_169918 ) ) ( not ( = ?auto_169915 ?auto_169918 ) ) ( not ( = ?auto_169916 ?auto_169918 ) ) ( not ( = ?auto_169917 ?auto_169918 ) ) ( ON ?auto_169916 ?auto_169917 ) ( ON-TABLE ?auto_169919 ) ( ON ?auto_169918 ?auto_169919 ) ( not ( = ?auto_169919 ?auto_169918 ) ) ( not ( = ?auto_169919 ?auto_169917 ) ) ( not ( = ?auto_169919 ?auto_169916 ) ) ( not ( = ?auto_169912 ?auto_169919 ) ) ( not ( = ?auto_169913 ?auto_169919 ) ) ( not ( = ?auto_169914 ?auto_169919 ) ) ( not ( = ?auto_169915 ?auto_169919 ) ) ( ON ?auto_169915 ?auto_169916 ) ( ON ?auto_169914 ?auto_169915 ) ( ON ?auto_169913 ?auto_169914 ) ( CLEAR ?auto_169913 ) ( HOLDING ?auto_169912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169912 )
      ( MAKE-6PILE ?auto_169912 ?auto_169913 ?auto_169914 ?auto_169915 ?auto_169916 ?auto_169917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169920 - BLOCK
      ?auto_169921 - BLOCK
      ?auto_169922 - BLOCK
      ?auto_169923 - BLOCK
      ?auto_169924 - BLOCK
      ?auto_169925 - BLOCK
    )
    :vars
    (
      ?auto_169927 - BLOCK
      ?auto_169926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169920 ?auto_169921 ) ) ( not ( = ?auto_169920 ?auto_169922 ) ) ( not ( = ?auto_169920 ?auto_169923 ) ) ( not ( = ?auto_169920 ?auto_169924 ) ) ( not ( = ?auto_169920 ?auto_169925 ) ) ( not ( = ?auto_169921 ?auto_169922 ) ) ( not ( = ?auto_169921 ?auto_169923 ) ) ( not ( = ?auto_169921 ?auto_169924 ) ) ( not ( = ?auto_169921 ?auto_169925 ) ) ( not ( = ?auto_169922 ?auto_169923 ) ) ( not ( = ?auto_169922 ?auto_169924 ) ) ( not ( = ?auto_169922 ?auto_169925 ) ) ( not ( = ?auto_169923 ?auto_169924 ) ) ( not ( = ?auto_169923 ?auto_169925 ) ) ( not ( = ?auto_169924 ?auto_169925 ) ) ( ON ?auto_169925 ?auto_169927 ) ( not ( = ?auto_169920 ?auto_169927 ) ) ( not ( = ?auto_169921 ?auto_169927 ) ) ( not ( = ?auto_169922 ?auto_169927 ) ) ( not ( = ?auto_169923 ?auto_169927 ) ) ( not ( = ?auto_169924 ?auto_169927 ) ) ( not ( = ?auto_169925 ?auto_169927 ) ) ( ON ?auto_169924 ?auto_169925 ) ( ON-TABLE ?auto_169926 ) ( ON ?auto_169927 ?auto_169926 ) ( not ( = ?auto_169926 ?auto_169927 ) ) ( not ( = ?auto_169926 ?auto_169925 ) ) ( not ( = ?auto_169926 ?auto_169924 ) ) ( not ( = ?auto_169920 ?auto_169926 ) ) ( not ( = ?auto_169921 ?auto_169926 ) ) ( not ( = ?auto_169922 ?auto_169926 ) ) ( not ( = ?auto_169923 ?auto_169926 ) ) ( ON ?auto_169923 ?auto_169924 ) ( ON ?auto_169922 ?auto_169923 ) ( ON ?auto_169921 ?auto_169922 ) ( ON ?auto_169920 ?auto_169921 ) ( CLEAR ?auto_169920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169926 ?auto_169927 ?auto_169925 ?auto_169924 ?auto_169923 ?auto_169922 ?auto_169921 )
      ( MAKE-6PILE ?auto_169920 ?auto_169921 ?auto_169922 ?auto_169923 ?auto_169924 ?auto_169925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169928 - BLOCK
      ?auto_169929 - BLOCK
      ?auto_169930 - BLOCK
      ?auto_169931 - BLOCK
      ?auto_169932 - BLOCK
      ?auto_169933 - BLOCK
    )
    :vars
    (
      ?auto_169934 - BLOCK
      ?auto_169935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169928 ?auto_169929 ) ) ( not ( = ?auto_169928 ?auto_169930 ) ) ( not ( = ?auto_169928 ?auto_169931 ) ) ( not ( = ?auto_169928 ?auto_169932 ) ) ( not ( = ?auto_169928 ?auto_169933 ) ) ( not ( = ?auto_169929 ?auto_169930 ) ) ( not ( = ?auto_169929 ?auto_169931 ) ) ( not ( = ?auto_169929 ?auto_169932 ) ) ( not ( = ?auto_169929 ?auto_169933 ) ) ( not ( = ?auto_169930 ?auto_169931 ) ) ( not ( = ?auto_169930 ?auto_169932 ) ) ( not ( = ?auto_169930 ?auto_169933 ) ) ( not ( = ?auto_169931 ?auto_169932 ) ) ( not ( = ?auto_169931 ?auto_169933 ) ) ( not ( = ?auto_169932 ?auto_169933 ) ) ( ON ?auto_169933 ?auto_169934 ) ( not ( = ?auto_169928 ?auto_169934 ) ) ( not ( = ?auto_169929 ?auto_169934 ) ) ( not ( = ?auto_169930 ?auto_169934 ) ) ( not ( = ?auto_169931 ?auto_169934 ) ) ( not ( = ?auto_169932 ?auto_169934 ) ) ( not ( = ?auto_169933 ?auto_169934 ) ) ( ON ?auto_169932 ?auto_169933 ) ( ON-TABLE ?auto_169935 ) ( ON ?auto_169934 ?auto_169935 ) ( not ( = ?auto_169935 ?auto_169934 ) ) ( not ( = ?auto_169935 ?auto_169933 ) ) ( not ( = ?auto_169935 ?auto_169932 ) ) ( not ( = ?auto_169928 ?auto_169935 ) ) ( not ( = ?auto_169929 ?auto_169935 ) ) ( not ( = ?auto_169930 ?auto_169935 ) ) ( not ( = ?auto_169931 ?auto_169935 ) ) ( ON ?auto_169931 ?auto_169932 ) ( ON ?auto_169930 ?auto_169931 ) ( ON ?auto_169929 ?auto_169930 ) ( HOLDING ?auto_169928 ) ( CLEAR ?auto_169929 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169935 ?auto_169934 ?auto_169933 ?auto_169932 ?auto_169931 ?auto_169930 ?auto_169929 ?auto_169928 )
      ( MAKE-6PILE ?auto_169928 ?auto_169929 ?auto_169930 ?auto_169931 ?auto_169932 ?auto_169933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169936 - BLOCK
      ?auto_169937 - BLOCK
      ?auto_169938 - BLOCK
      ?auto_169939 - BLOCK
      ?auto_169940 - BLOCK
      ?auto_169941 - BLOCK
    )
    :vars
    (
      ?auto_169942 - BLOCK
      ?auto_169943 - BLOCK
      ?auto_169944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169936 ?auto_169937 ) ) ( not ( = ?auto_169936 ?auto_169938 ) ) ( not ( = ?auto_169936 ?auto_169939 ) ) ( not ( = ?auto_169936 ?auto_169940 ) ) ( not ( = ?auto_169936 ?auto_169941 ) ) ( not ( = ?auto_169937 ?auto_169938 ) ) ( not ( = ?auto_169937 ?auto_169939 ) ) ( not ( = ?auto_169937 ?auto_169940 ) ) ( not ( = ?auto_169937 ?auto_169941 ) ) ( not ( = ?auto_169938 ?auto_169939 ) ) ( not ( = ?auto_169938 ?auto_169940 ) ) ( not ( = ?auto_169938 ?auto_169941 ) ) ( not ( = ?auto_169939 ?auto_169940 ) ) ( not ( = ?auto_169939 ?auto_169941 ) ) ( not ( = ?auto_169940 ?auto_169941 ) ) ( ON ?auto_169941 ?auto_169942 ) ( not ( = ?auto_169936 ?auto_169942 ) ) ( not ( = ?auto_169937 ?auto_169942 ) ) ( not ( = ?auto_169938 ?auto_169942 ) ) ( not ( = ?auto_169939 ?auto_169942 ) ) ( not ( = ?auto_169940 ?auto_169942 ) ) ( not ( = ?auto_169941 ?auto_169942 ) ) ( ON ?auto_169940 ?auto_169941 ) ( ON-TABLE ?auto_169943 ) ( ON ?auto_169942 ?auto_169943 ) ( not ( = ?auto_169943 ?auto_169942 ) ) ( not ( = ?auto_169943 ?auto_169941 ) ) ( not ( = ?auto_169943 ?auto_169940 ) ) ( not ( = ?auto_169936 ?auto_169943 ) ) ( not ( = ?auto_169937 ?auto_169943 ) ) ( not ( = ?auto_169938 ?auto_169943 ) ) ( not ( = ?auto_169939 ?auto_169943 ) ) ( ON ?auto_169939 ?auto_169940 ) ( ON ?auto_169938 ?auto_169939 ) ( ON ?auto_169937 ?auto_169938 ) ( CLEAR ?auto_169937 ) ( ON ?auto_169936 ?auto_169944 ) ( CLEAR ?auto_169936 ) ( HAND-EMPTY ) ( not ( = ?auto_169936 ?auto_169944 ) ) ( not ( = ?auto_169937 ?auto_169944 ) ) ( not ( = ?auto_169938 ?auto_169944 ) ) ( not ( = ?auto_169939 ?auto_169944 ) ) ( not ( = ?auto_169940 ?auto_169944 ) ) ( not ( = ?auto_169941 ?auto_169944 ) ) ( not ( = ?auto_169942 ?auto_169944 ) ) ( not ( = ?auto_169943 ?auto_169944 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169936 ?auto_169944 )
      ( MAKE-6PILE ?auto_169936 ?auto_169937 ?auto_169938 ?auto_169939 ?auto_169940 ?auto_169941 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169945 - BLOCK
      ?auto_169946 - BLOCK
      ?auto_169947 - BLOCK
      ?auto_169948 - BLOCK
      ?auto_169949 - BLOCK
      ?auto_169950 - BLOCK
    )
    :vars
    (
      ?auto_169953 - BLOCK
      ?auto_169952 - BLOCK
      ?auto_169951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169945 ?auto_169946 ) ) ( not ( = ?auto_169945 ?auto_169947 ) ) ( not ( = ?auto_169945 ?auto_169948 ) ) ( not ( = ?auto_169945 ?auto_169949 ) ) ( not ( = ?auto_169945 ?auto_169950 ) ) ( not ( = ?auto_169946 ?auto_169947 ) ) ( not ( = ?auto_169946 ?auto_169948 ) ) ( not ( = ?auto_169946 ?auto_169949 ) ) ( not ( = ?auto_169946 ?auto_169950 ) ) ( not ( = ?auto_169947 ?auto_169948 ) ) ( not ( = ?auto_169947 ?auto_169949 ) ) ( not ( = ?auto_169947 ?auto_169950 ) ) ( not ( = ?auto_169948 ?auto_169949 ) ) ( not ( = ?auto_169948 ?auto_169950 ) ) ( not ( = ?auto_169949 ?auto_169950 ) ) ( ON ?auto_169950 ?auto_169953 ) ( not ( = ?auto_169945 ?auto_169953 ) ) ( not ( = ?auto_169946 ?auto_169953 ) ) ( not ( = ?auto_169947 ?auto_169953 ) ) ( not ( = ?auto_169948 ?auto_169953 ) ) ( not ( = ?auto_169949 ?auto_169953 ) ) ( not ( = ?auto_169950 ?auto_169953 ) ) ( ON ?auto_169949 ?auto_169950 ) ( ON-TABLE ?auto_169952 ) ( ON ?auto_169953 ?auto_169952 ) ( not ( = ?auto_169952 ?auto_169953 ) ) ( not ( = ?auto_169952 ?auto_169950 ) ) ( not ( = ?auto_169952 ?auto_169949 ) ) ( not ( = ?auto_169945 ?auto_169952 ) ) ( not ( = ?auto_169946 ?auto_169952 ) ) ( not ( = ?auto_169947 ?auto_169952 ) ) ( not ( = ?auto_169948 ?auto_169952 ) ) ( ON ?auto_169948 ?auto_169949 ) ( ON ?auto_169947 ?auto_169948 ) ( ON ?auto_169945 ?auto_169951 ) ( CLEAR ?auto_169945 ) ( not ( = ?auto_169945 ?auto_169951 ) ) ( not ( = ?auto_169946 ?auto_169951 ) ) ( not ( = ?auto_169947 ?auto_169951 ) ) ( not ( = ?auto_169948 ?auto_169951 ) ) ( not ( = ?auto_169949 ?auto_169951 ) ) ( not ( = ?auto_169950 ?auto_169951 ) ) ( not ( = ?auto_169953 ?auto_169951 ) ) ( not ( = ?auto_169952 ?auto_169951 ) ) ( HOLDING ?auto_169946 ) ( CLEAR ?auto_169947 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169952 ?auto_169953 ?auto_169950 ?auto_169949 ?auto_169948 ?auto_169947 ?auto_169946 )
      ( MAKE-6PILE ?auto_169945 ?auto_169946 ?auto_169947 ?auto_169948 ?auto_169949 ?auto_169950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169954 - BLOCK
      ?auto_169955 - BLOCK
      ?auto_169956 - BLOCK
      ?auto_169957 - BLOCK
      ?auto_169958 - BLOCK
      ?auto_169959 - BLOCK
    )
    :vars
    (
      ?auto_169960 - BLOCK
      ?auto_169962 - BLOCK
      ?auto_169961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169954 ?auto_169955 ) ) ( not ( = ?auto_169954 ?auto_169956 ) ) ( not ( = ?auto_169954 ?auto_169957 ) ) ( not ( = ?auto_169954 ?auto_169958 ) ) ( not ( = ?auto_169954 ?auto_169959 ) ) ( not ( = ?auto_169955 ?auto_169956 ) ) ( not ( = ?auto_169955 ?auto_169957 ) ) ( not ( = ?auto_169955 ?auto_169958 ) ) ( not ( = ?auto_169955 ?auto_169959 ) ) ( not ( = ?auto_169956 ?auto_169957 ) ) ( not ( = ?auto_169956 ?auto_169958 ) ) ( not ( = ?auto_169956 ?auto_169959 ) ) ( not ( = ?auto_169957 ?auto_169958 ) ) ( not ( = ?auto_169957 ?auto_169959 ) ) ( not ( = ?auto_169958 ?auto_169959 ) ) ( ON ?auto_169959 ?auto_169960 ) ( not ( = ?auto_169954 ?auto_169960 ) ) ( not ( = ?auto_169955 ?auto_169960 ) ) ( not ( = ?auto_169956 ?auto_169960 ) ) ( not ( = ?auto_169957 ?auto_169960 ) ) ( not ( = ?auto_169958 ?auto_169960 ) ) ( not ( = ?auto_169959 ?auto_169960 ) ) ( ON ?auto_169958 ?auto_169959 ) ( ON-TABLE ?auto_169962 ) ( ON ?auto_169960 ?auto_169962 ) ( not ( = ?auto_169962 ?auto_169960 ) ) ( not ( = ?auto_169962 ?auto_169959 ) ) ( not ( = ?auto_169962 ?auto_169958 ) ) ( not ( = ?auto_169954 ?auto_169962 ) ) ( not ( = ?auto_169955 ?auto_169962 ) ) ( not ( = ?auto_169956 ?auto_169962 ) ) ( not ( = ?auto_169957 ?auto_169962 ) ) ( ON ?auto_169957 ?auto_169958 ) ( ON ?auto_169956 ?auto_169957 ) ( ON ?auto_169954 ?auto_169961 ) ( not ( = ?auto_169954 ?auto_169961 ) ) ( not ( = ?auto_169955 ?auto_169961 ) ) ( not ( = ?auto_169956 ?auto_169961 ) ) ( not ( = ?auto_169957 ?auto_169961 ) ) ( not ( = ?auto_169958 ?auto_169961 ) ) ( not ( = ?auto_169959 ?auto_169961 ) ) ( not ( = ?auto_169960 ?auto_169961 ) ) ( not ( = ?auto_169962 ?auto_169961 ) ) ( CLEAR ?auto_169956 ) ( ON ?auto_169955 ?auto_169954 ) ( CLEAR ?auto_169955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169961 ?auto_169954 )
      ( MAKE-6PILE ?auto_169954 ?auto_169955 ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169963 - BLOCK
      ?auto_169964 - BLOCK
      ?auto_169965 - BLOCK
      ?auto_169966 - BLOCK
      ?auto_169967 - BLOCK
      ?auto_169968 - BLOCK
    )
    :vars
    (
      ?auto_169971 - BLOCK
      ?auto_169970 - BLOCK
      ?auto_169969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169963 ?auto_169964 ) ) ( not ( = ?auto_169963 ?auto_169965 ) ) ( not ( = ?auto_169963 ?auto_169966 ) ) ( not ( = ?auto_169963 ?auto_169967 ) ) ( not ( = ?auto_169963 ?auto_169968 ) ) ( not ( = ?auto_169964 ?auto_169965 ) ) ( not ( = ?auto_169964 ?auto_169966 ) ) ( not ( = ?auto_169964 ?auto_169967 ) ) ( not ( = ?auto_169964 ?auto_169968 ) ) ( not ( = ?auto_169965 ?auto_169966 ) ) ( not ( = ?auto_169965 ?auto_169967 ) ) ( not ( = ?auto_169965 ?auto_169968 ) ) ( not ( = ?auto_169966 ?auto_169967 ) ) ( not ( = ?auto_169966 ?auto_169968 ) ) ( not ( = ?auto_169967 ?auto_169968 ) ) ( ON ?auto_169968 ?auto_169971 ) ( not ( = ?auto_169963 ?auto_169971 ) ) ( not ( = ?auto_169964 ?auto_169971 ) ) ( not ( = ?auto_169965 ?auto_169971 ) ) ( not ( = ?auto_169966 ?auto_169971 ) ) ( not ( = ?auto_169967 ?auto_169971 ) ) ( not ( = ?auto_169968 ?auto_169971 ) ) ( ON ?auto_169967 ?auto_169968 ) ( ON-TABLE ?auto_169970 ) ( ON ?auto_169971 ?auto_169970 ) ( not ( = ?auto_169970 ?auto_169971 ) ) ( not ( = ?auto_169970 ?auto_169968 ) ) ( not ( = ?auto_169970 ?auto_169967 ) ) ( not ( = ?auto_169963 ?auto_169970 ) ) ( not ( = ?auto_169964 ?auto_169970 ) ) ( not ( = ?auto_169965 ?auto_169970 ) ) ( not ( = ?auto_169966 ?auto_169970 ) ) ( ON ?auto_169966 ?auto_169967 ) ( ON ?auto_169963 ?auto_169969 ) ( not ( = ?auto_169963 ?auto_169969 ) ) ( not ( = ?auto_169964 ?auto_169969 ) ) ( not ( = ?auto_169965 ?auto_169969 ) ) ( not ( = ?auto_169966 ?auto_169969 ) ) ( not ( = ?auto_169967 ?auto_169969 ) ) ( not ( = ?auto_169968 ?auto_169969 ) ) ( not ( = ?auto_169971 ?auto_169969 ) ) ( not ( = ?auto_169970 ?auto_169969 ) ) ( ON ?auto_169964 ?auto_169963 ) ( CLEAR ?auto_169964 ) ( ON-TABLE ?auto_169969 ) ( HOLDING ?auto_169965 ) ( CLEAR ?auto_169966 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169970 ?auto_169971 ?auto_169968 ?auto_169967 ?auto_169966 ?auto_169965 )
      ( MAKE-6PILE ?auto_169963 ?auto_169964 ?auto_169965 ?auto_169966 ?auto_169967 ?auto_169968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169972 - BLOCK
      ?auto_169973 - BLOCK
      ?auto_169974 - BLOCK
      ?auto_169975 - BLOCK
      ?auto_169976 - BLOCK
      ?auto_169977 - BLOCK
    )
    :vars
    (
      ?auto_169978 - BLOCK
      ?auto_169980 - BLOCK
      ?auto_169979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169972 ?auto_169973 ) ) ( not ( = ?auto_169972 ?auto_169974 ) ) ( not ( = ?auto_169972 ?auto_169975 ) ) ( not ( = ?auto_169972 ?auto_169976 ) ) ( not ( = ?auto_169972 ?auto_169977 ) ) ( not ( = ?auto_169973 ?auto_169974 ) ) ( not ( = ?auto_169973 ?auto_169975 ) ) ( not ( = ?auto_169973 ?auto_169976 ) ) ( not ( = ?auto_169973 ?auto_169977 ) ) ( not ( = ?auto_169974 ?auto_169975 ) ) ( not ( = ?auto_169974 ?auto_169976 ) ) ( not ( = ?auto_169974 ?auto_169977 ) ) ( not ( = ?auto_169975 ?auto_169976 ) ) ( not ( = ?auto_169975 ?auto_169977 ) ) ( not ( = ?auto_169976 ?auto_169977 ) ) ( ON ?auto_169977 ?auto_169978 ) ( not ( = ?auto_169972 ?auto_169978 ) ) ( not ( = ?auto_169973 ?auto_169978 ) ) ( not ( = ?auto_169974 ?auto_169978 ) ) ( not ( = ?auto_169975 ?auto_169978 ) ) ( not ( = ?auto_169976 ?auto_169978 ) ) ( not ( = ?auto_169977 ?auto_169978 ) ) ( ON ?auto_169976 ?auto_169977 ) ( ON-TABLE ?auto_169980 ) ( ON ?auto_169978 ?auto_169980 ) ( not ( = ?auto_169980 ?auto_169978 ) ) ( not ( = ?auto_169980 ?auto_169977 ) ) ( not ( = ?auto_169980 ?auto_169976 ) ) ( not ( = ?auto_169972 ?auto_169980 ) ) ( not ( = ?auto_169973 ?auto_169980 ) ) ( not ( = ?auto_169974 ?auto_169980 ) ) ( not ( = ?auto_169975 ?auto_169980 ) ) ( ON ?auto_169975 ?auto_169976 ) ( ON ?auto_169972 ?auto_169979 ) ( not ( = ?auto_169972 ?auto_169979 ) ) ( not ( = ?auto_169973 ?auto_169979 ) ) ( not ( = ?auto_169974 ?auto_169979 ) ) ( not ( = ?auto_169975 ?auto_169979 ) ) ( not ( = ?auto_169976 ?auto_169979 ) ) ( not ( = ?auto_169977 ?auto_169979 ) ) ( not ( = ?auto_169978 ?auto_169979 ) ) ( not ( = ?auto_169980 ?auto_169979 ) ) ( ON ?auto_169973 ?auto_169972 ) ( ON-TABLE ?auto_169979 ) ( CLEAR ?auto_169975 ) ( ON ?auto_169974 ?auto_169973 ) ( CLEAR ?auto_169974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169979 ?auto_169972 ?auto_169973 )
      ( MAKE-6PILE ?auto_169972 ?auto_169973 ?auto_169974 ?auto_169975 ?auto_169976 ?auto_169977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169981 - BLOCK
      ?auto_169982 - BLOCK
      ?auto_169983 - BLOCK
      ?auto_169984 - BLOCK
      ?auto_169985 - BLOCK
      ?auto_169986 - BLOCK
    )
    :vars
    (
      ?auto_169988 - BLOCK
      ?auto_169989 - BLOCK
      ?auto_169987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169981 ?auto_169982 ) ) ( not ( = ?auto_169981 ?auto_169983 ) ) ( not ( = ?auto_169981 ?auto_169984 ) ) ( not ( = ?auto_169981 ?auto_169985 ) ) ( not ( = ?auto_169981 ?auto_169986 ) ) ( not ( = ?auto_169982 ?auto_169983 ) ) ( not ( = ?auto_169982 ?auto_169984 ) ) ( not ( = ?auto_169982 ?auto_169985 ) ) ( not ( = ?auto_169982 ?auto_169986 ) ) ( not ( = ?auto_169983 ?auto_169984 ) ) ( not ( = ?auto_169983 ?auto_169985 ) ) ( not ( = ?auto_169983 ?auto_169986 ) ) ( not ( = ?auto_169984 ?auto_169985 ) ) ( not ( = ?auto_169984 ?auto_169986 ) ) ( not ( = ?auto_169985 ?auto_169986 ) ) ( ON ?auto_169986 ?auto_169988 ) ( not ( = ?auto_169981 ?auto_169988 ) ) ( not ( = ?auto_169982 ?auto_169988 ) ) ( not ( = ?auto_169983 ?auto_169988 ) ) ( not ( = ?auto_169984 ?auto_169988 ) ) ( not ( = ?auto_169985 ?auto_169988 ) ) ( not ( = ?auto_169986 ?auto_169988 ) ) ( ON ?auto_169985 ?auto_169986 ) ( ON-TABLE ?auto_169989 ) ( ON ?auto_169988 ?auto_169989 ) ( not ( = ?auto_169989 ?auto_169988 ) ) ( not ( = ?auto_169989 ?auto_169986 ) ) ( not ( = ?auto_169989 ?auto_169985 ) ) ( not ( = ?auto_169981 ?auto_169989 ) ) ( not ( = ?auto_169982 ?auto_169989 ) ) ( not ( = ?auto_169983 ?auto_169989 ) ) ( not ( = ?auto_169984 ?auto_169989 ) ) ( ON ?auto_169981 ?auto_169987 ) ( not ( = ?auto_169981 ?auto_169987 ) ) ( not ( = ?auto_169982 ?auto_169987 ) ) ( not ( = ?auto_169983 ?auto_169987 ) ) ( not ( = ?auto_169984 ?auto_169987 ) ) ( not ( = ?auto_169985 ?auto_169987 ) ) ( not ( = ?auto_169986 ?auto_169987 ) ) ( not ( = ?auto_169988 ?auto_169987 ) ) ( not ( = ?auto_169989 ?auto_169987 ) ) ( ON ?auto_169982 ?auto_169981 ) ( ON-TABLE ?auto_169987 ) ( ON ?auto_169983 ?auto_169982 ) ( CLEAR ?auto_169983 ) ( HOLDING ?auto_169984 ) ( CLEAR ?auto_169985 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169989 ?auto_169988 ?auto_169986 ?auto_169985 ?auto_169984 )
      ( MAKE-6PILE ?auto_169981 ?auto_169982 ?auto_169983 ?auto_169984 ?auto_169985 ?auto_169986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169990 - BLOCK
      ?auto_169991 - BLOCK
      ?auto_169992 - BLOCK
      ?auto_169993 - BLOCK
      ?auto_169994 - BLOCK
      ?auto_169995 - BLOCK
    )
    :vars
    (
      ?auto_169998 - BLOCK
      ?auto_169997 - BLOCK
      ?auto_169996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169990 ?auto_169991 ) ) ( not ( = ?auto_169990 ?auto_169992 ) ) ( not ( = ?auto_169990 ?auto_169993 ) ) ( not ( = ?auto_169990 ?auto_169994 ) ) ( not ( = ?auto_169990 ?auto_169995 ) ) ( not ( = ?auto_169991 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169993 ) ) ( not ( = ?auto_169991 ?auto_169994 ) ) ( not ( = ?auto_169991 ?auto_169995 ) ) ( not ( = ?auto_169992 ?auto_169993 ) ) ( not ( = ?auto_169992 ?auto_169994 ) ) ( not ( = ?auto_169992 ?auto_169995 ) ) ( not ( = ?auto_169993 ?auto_169994 ) ) ( not ( = ?auto_169993 ?auto_169995 ) ) ( not ( = ?auto_169994 ?auto_169995 ) ) ( ON ?auto_169995 ?auto_169998 ) ( not ( = ?auto_169990 ?auto_169998 ) ) ( not ( = ?auto_169991 ?auto_169998 ) ) ( not ( = ?auto_169992 ?auto_169998 ) ) ( not ( = ?auto_169993 ?auto_169998 ) ) ( not ( = ?auto_169994 ?auto_169998 ) ) ( not ( = ?auto_169995 ?auto_169998 ) ) ( ON ?auto_169994 ?auto_169995 ) ( ON-TABLE ?auto_169997 ) ( ON ?auto_169998 ?auto_169997 ) ( not ( = ?auto_169997 ?auto_169998 ) ) ( not ( = ?auto_169997 ?auto_169995 ) ) ( not ( = ?auto_169997 ?auto_169994 ) ) ( not ( = ?auto_169990 ?auto_169997 ) ) ( not ( = ?auto_169991 ?auto_169997 ) ) ( not ( = ?auto_169992 ?auto_169997 ) ) ( not ( = ?auto_169993 ?auto_169997 ) ) ( ON ?auto_169990 ?auto_169996 ) ( not ( = ?auto_169990 ?auto_169996 ) ) ( not ( = ?auto_169991 ?auto_169996 ) ) ( not ( = ?auto_169992 ?auto_169996 ) ) ( not ( = ?auto_169993 ?auto_169996 ) ) ( not ( = ?auto_169994 ?auto_169996 ) ) ( not ( = ?auto_169995 ?auto_169996 ) ) ( not ( = ?auto_169998 ?auto_169996 ) ) ( not ( = ?auto_169997 ?auto_169996 ) ) ( ON ?auto_169991 ?auto_169990 ) ( ON-TABLE ?auto_169996 ) ( ON ?auto_169992 ?auto_169991 ) ( CLEAR ?auto_169994 ) ( ON ?auto_169993 ?auto_169992 ) ( CLEAR ?auto_169993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169996 ?auto_169990 ?auto_169991 ?auto_169992 )
      ( MAKE-6PILE ?auto_169990 ?auto_169991 ?auto_169992 ?auto_169993 ?auto_169994 ?auto_169995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169999 - BLOCK
      ?auto_170000 - BLOCK
      ?auto_170001 - BLOCK
      ?auto_170002 - BLOCK
      ?auto_170003 - BLOCK
      ?auto_170004 - BLOCK
    )
    :vars
    (
      ?auto_170007 - BLOCK
      ?auto_170005 - BLOCK
      ?auto_170006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169999 ?auto_170000 ) ) ( not ( = ?auto_169999 ?auto_170001 ) ) ( not ( = ?auto_169999 ?auto_170002 ) ) ( not ( = ?auto_169999 ?auto_170003 ) ) ( not ( = ?auto_169999 ?auto_170004 ) ) ( not ( = ?auto_170000 ?auto_170001 ) ) ( not ( = ?auto_170000 ?auto_170002 ) ) ( not ( = ?auto_170000 ?auto_170003 ) ) ( not ( = ?auto_170000 ?auto_170004 ) ) ( not ( = ?auto_170001 ?auto_170002 ) ) ( not ( = ?auto_170001 ?auto_170003 ) ) ( not ( = ?auto_170001 ?auto_170004 ) ) ( not ( = ?auto_170002 ?auto_170003 ) ) ( not ( = ?auto_170002 ?auto_170004 ) ) ( not ( = ?auto_170003 ?auto_170004 ) ) ( ON ?auto_170004 ?auto_170007 ) ( not ( = ?auto_169999 ?auto_170007 ) ) ( not ( = ?auto_170000 ?auto_170007 ) ) ( not ( = ?auto_170001 ?auto_170007 ) ) ( not ( = ?auto_170002 ?auto_170007 ) ) ( not ( = ?auto_170003 ?auto_170007 ) ) ( not ( = ?auto_170004 ?auto_170007 ) ) ( ON-TABLE ?auto_170005 ) ( ON ?auto_170007 ?auto_170005 ) ( not ( = ?auto_170005 ?auto_170007 ) ) ( not ( = ?auto_170005 ?auto_170004 ) ) ( not ( = ?auto_170005 ?auto_170003 ) ) ( not ( = ?auto_169999 ?auto_170005 ) ) ( not ( = ?auto_170000 ?auto_170005 ) ) ( not ( = ?auto_170001 ?auto_170005 ) ) ( not ( = ?auto_170002 ?auto_170005 ) ) ( ON ?auto_169999 ?auto_170006 ) ( not ( = ?auto_169999 ?auto_170006 ) ) ( not ( = ?auto_170000 ?auto_170006 ) ) ( not ( = ?auto_170001 ?auto_170006 ) ) ( not ( = ?auto_170002 ?auto_170006 ) ) ( not ( = ?auto_170003 ?auto_170006 ) ) ( not ( = ?auto_170004 ?auto_170006 ) ) ( not ( = ?auto_170007 ?auto_170006 ) ) ( not ( = ?auto_170005 ?auto_170006 ) ) ( ON ?auto_170000 ?auto_169999 ) ( ON-TABLE ?auto_170006 ) ( ON ?auto_170001 ?auto_170000 ) ( ON ?auto_170002 ?auto_170001 ) ( CLEAR ?auto_170002 ) ( HOLDING ?auto_170003 ) ( CLEAR ?auto_170004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170005 ?auto_170007 ?auto_170004 ?auto_170003 )
      ( MAKE-6PILE ?auto_169999 ?auto_170000 ?auto_170001 ?auto_170002 ?auto_170003 ?auto_170004 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170008 - BLOCK
      ?auto_170009 - BLOCK
      ?auto_170010 - BLOCK
      ?auto_170011 - BLOCK
      ?auto_170012 - BLOCK
      ?auto_170013 - BLOCK
    )
    :vars
    (
      ?auto_170014 - BLOCK
      ?auto_170015 - BLOCK
      ?auto_170016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170008 ?auto_170009 ) ) ( not ( = ?auto_170008 ?auto_170010 ) ) ( not ( = ?auto_170008 ?auto_170011 ) ) ( not ( = ?auto_170008 ?auto_170012 ) ) ( not ( = ?auto_170008 ?auto_170013 ) ) ( not ( = ?auto_170009 ?auto_170010 ) ) ( not ( = ?auto_170009 ?auto_170011 ) ) ( not ( = ?auto_170009 ?auto_170012 ) ) ( not ( = ?auto_170009 ?auto_170013 ) ) ( not ( = ?auto_170010 ?auto_170011 ) ) ( not ( = ?auto_170010 ?auto_170012 ) ) ( not ( = ?auto_170010 ?auto_170013 ) ) ( not ( = ?auto_170011 ?auto_170012 ) ) ( not ( = ?auto_170011 ?auto_170013 ) ) ( not ( = ?auto_170012 ?auto_170013 ) ) ( ON ?auto_170013 ?auto_170014 ) ( not ( = ?auto_170008 ?auto_170014 ) ) ( not ( = ?auto_170009 ?auto_170014 ) ) ( not ( = ?auto_170010 ?auto_170014 ) ) ( not ( = ?auto_170011 ?auto_170014 ) ) ( not ( = ?auto_170012 ?auto_170014 ) ) ( not ( = ?auto_170013 ?auto_170014 ) ) ( ON-TABLE ?auto_170015 ) ( ON ?auto_170014 ?auto_170015 ) ( not ( = ?auto_170015 ?auto_170014 ) ) ( not ( = ?auto_170015 ?auto_170013 ) ) ( not ( = ?auto_170015 ?auto_170012 ) ) ( not ( = ?auto_170008 ?auto_170015 ) ) ( not ( = ?auto_170009 ?auto_170015 ) ) ( not ( = ?auto_170010 ?auto_170015 ) ) ( not ( = ?auto_170011 ?auto_170015 ) ) ( ON ?auto_170008 ?auto_170016 ) ( not ( = ?auto_170008 ?auto_170016 ) ) ( not ( = ?auto_170009 ?auto_170016 ) ) ( not ( = ?auto_170010 ?auto_170016 ) ) ( not ( = ?auto_170011 ?auto_170016 ) ) ( not ( = ?auto_170012 ?auto_170016 ) ) ( not ( = ?auto_170013 ?auto_170016 ) ) ( not ( = ?auto_170014 ?auto_170016 ) ) ( not ( = ?auto_170015 ?auto_170016 ) ) ( ON ?auto_170009 ?auto_170008 ) ( ON-TABLE ?auto_170016 ) ( ON ?auto_170010 ?auto_170009 ) ( ON ?auto_170011 ?auto_170010 ) ( CLEAR ?auto_170013 ) ( ON ?auto_170012 ?auto_170011 ) ( CLEAR ?auto_170012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170016 ?auto_170008 ?auto_170009 ?auto_170010 ?auto_170011 )
      ( MAKE-6PILE ?auto_170008 ?auto_170009 ?auto_170010 ?auto_170011 ?auto_170012 ?auto_170013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170017 - BLOCK
      ?auto_170018 - BLOCK
      ?auto_170019 - BLOCK
      ?auto_170020 - BLOCK
      ?auto_170021 - BLOCK
      ?auto_170022 - BLOCK
    )
    :vars
    (
      ?auto_170025 - BLOCK
      ?auto_170023 - BLOCK
      ?auto_170024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170017 ?auto_170018 ) ) ( not ( = ?auto_170017 ?auto_170019 ) ) ( not ( = ?auto_170017 ?auto_170020 ) ) ( not ( = ?auto_170017 ?auto_170021 ) ) ( not ( = ?auto_170017 ?auto_170022 ) ) ( not ( = ?auto_170018 ?auto_170019 ) ) ( not ( = ?auto_170018 ?auto_170020 ) ) ( not ( = ?auto_170018 ?auto_170021 ) ) ( not ( = ?auto_170018 ?auto_170022 ) ) ( not ( = ?auto_170019 ?auto_170020 ) ) ( not ( = ?auto_170019 ?auto_170021 ) ) ( not ( = ?auto_170019 ?auto_170022 ) ) ( not ( = ?auto_170020 ?auto_170021 ) ) ( not ( = ?auto_170020 ?auto_170022 ) ) ( not ( = ?auto_170021 ?auto_170022 ) ) ( not ( = ?auto_170017 ?auto_170025 ) ) ( not ( = ?auto_170018 ?auto_170025 ) ) ( not ( = ?auto_170019 ?auto_170025 ) ) ( not ( = ?auto_170020 ?auto_170025 ) ) ( not ( = ?auto_170021 ?auto_170025 ) ) ( not ( = ?auto_170022 ?auto_170025 ) ) ( ON-TABLE ?auto_170023 ) ( ON ?auto_170025 ?auto_170023 ) ( not ( = ?auto_170023 ?auto_170025 ) ) ( not ( = ?auto_170023 ?auto_170022 ) ) ( not ( = ?auto_170023 ?auto_170021 ) ) ( not ( = ?auto_170017 ?auto_170023 ) ) ( not ( = ?auto_170018 ?auto_170023 ) ) ( not ( = ?auto_170019 ?auto_170023 ) ) ( not ( = ?auto_170020 ?auto_170023 ) ) ( ON ?auto_170017 ?auto_170024 ) ( not ( = ?auto_170017 ?auto_170024 ) ) ( not ( = ?auto_170018 ?auto_170024 ) ) ( not ( = ?auto_170019 ?auto_170024 ) ) ( not ( = ?auto_170020 ?auto_170024 ) ) ( not ( = ?auto_170021 ?auto_170024 ) ) ( not ( = ?auto_170022 ?auto_170024 ) ) ( not ( = ?auto_170025 ?auto_170024 ) ) ( not ( = ?auto_170023 ?auto_170024 ) ) ( ON ?auto_170018 ?auto_170017 ) ( ON-TABLE ?auto_170024 ) ( ON ?auto_170019 ?auto_170018 ) ( ON ?auto_170020 ?auto_170019 ) ( ON ?auto_170021 ?auto_170020 ) ( CLEAR ?auto_170021 ) ( HOLDING ?auto_170022 ) ( CLEAR ?auto_170025 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170023 ?auto_170025 ?auto_170022 )
      ( MAKE-6PILE ?auto_170017 ?auto_170018 ?auto_170019 ?auto_170020 ?auto_170021 ?auto_170022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170026 - BLOCK
      ?auto_170027 - BLOCK
      ?auto_170028 - BLOCK
      ?auto_170029 - BLOCK
      ?auto_170030 - BLOCK
      ?auto_170031 - BLOCK
    )
    :vars
    (
      ?auto_170032 - BLOCK
      ?auto_170034 - BLOCK
      ?auto_170033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170026 ?auto_170027 ) ) ( not ( = ?auto_170026 ?auto_170028 ) ) ( not ( = ?auto_170026 ?auto_170029 ) ) ( not ( = ?auto_170026 ?auto_170030 ) ) ( not ( = ?auto_170026 ?auto_170031 ) ) ( not ( = ?auto_170027 ?auto_170028 ) ) ( not ( = ?auto_170027 ?auto_170029 ) ) ( not ( = ?auto_170027 ?auto_170030 ) ) ( not ( = ?auto_170027 ?auto_170031 ) ) ( not ( = ?auto_170028 ?auto_170029 ) ) ( not ( = ?auto_170028 ?auto_170030 ) ) ( not ( = ?auto_170028 ?auto_170031 ) ) ( not ( = ?auto_170029 ?auto_170030 ) ) ( not ( = ?auto_170029 ?auto_170031 ) ) ( not ( = ?auto_170030 ?auto_170031 ) ) ( not ( = ?auto_170026 ?auto_170032 ) ) ( not ( = ?auto_170027 ?auto_170032 ) ) ( not ( = ?auto_170028 ?auto_170032 ) ) ( not ( = ?auto_170029 ?auto_170032 ) ) ( not ( = ?auto_170030 ?auto_170032 ) ) ( not ( = ?auto_170031 ?auto_170032 ) ) ( ON-TABLE ?auto_170034 ) ( ON ?auto_170032 ?auto_170034 ) ( not ( = ?auto_170034 ?auto_170032 ) ) ( not ( = ?auto_170034 ?auto_170031 ) ) ( not ( = ?auto_170034 ?auto_170030 ) ) ( not ( = ?auto_170026 ?auto_170034 ) ) ( not ( = ?auto_170027 ?auto_170034 ) ) ( not ( = ?auto_170028 ?auto_170034 ) ) ( not ( = ?auto_170029 ?auto_170034 ) ) ( ON ?auto_170026 ?auto_170033 ) ( not ( = ?auto_170026 ?auto_170033 ) ) ( not ( = ?auto_170027 ?auto_170033 ) ) ( not ( = ?auto_170028 ?auto_170033 ) ) ( not ( = ?auto_170029 ?auto_170033 ) ) ( not ( = ?auto_170030 ?auto_170033 ) ) ( not ( = ?auto_170031 ?auto_170033 ) ) ( not ( = ?auto_170032 ?auto_170033 ) ) ( not ( = ?auto_170034 ?auto_170033 ) ) ( ON ?auto_170027 ?auto_170026 ) ( ON-TABLE ?auto_170033 ) ( ON ?auto_170028 ?auto_170027 ) ( ON ?auto_170029 ?auto_170028 ) ( ON ?auto_170030 ?auto_170029 ) ( CLEAR ?auto_170032 ) ( ON ?auto_170031 ?auto_170030 ) ( CLEAR ?auto_170031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170033 ?auto_170026 ?auto_170027 ?auto_170028 ?auto_170029 ?auto_170030 )
      ( MAKE-6PILE ?auto_170026 ?auto_170027 ?auto_170028 ?auto_170029 ?auto_170030 ?auto_170031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170035 - BLOCK
      ?auto_170036 - BLOCK
      ?auto_170037 - BLOCK
      ?auto_170038 - BLOCK
      ?auto_170039 - BLOCK
      ?auto_170040 - BLOCK
    )
    :vars
    (
      ?auto_170043 - BLOCK
      ?auto_170041 - BLOCK
      ?auto_170042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170035 ?auto_170036 ) ) ( not ( = ?auto_170035 ?auto_170037 ) ) ( not ( = ?auto_170035 ?auto_170038 ) ) ( not ( = ?auto_170035 ?auto_170039 ) ) ( not ( = ?auto_170035 ?auto_170040 ) ) ( not ( = ?auto_170036 ?auto_170037 ) ) ( not ( = ?auto_170036 ?auto_170038 ) ) ( not ( = ?auto_170036 ?auto_170039 ) ) ( not ( = ?auto_170036 ?auto_170040 ) ) ( not ( = ?auto_170037 ?auto_170038 ) ) ( not ( = ?auto_170037 ?auto_170039 ) ) ( not ( = ?auto_170037 ?auto_170040 ) ) ( not ( = ?auto_170038 ?auto_170039 ) ) ( not ( = ?auto_170038 ?auto_170040 ) ) ( not ( = ?auto_170039 ?auto_170040 ) ) ( not ( = ?auto_170035 ?auto_170043 ) ) ( not ( = ?auto_170036 ?auto_170043 ) ) ( not ( = ?auto_170037 ?auto_170043 ) ) ( not ( = ?auto_170038 ?auto_170043 ) ) ( not ( = ?auto_170039 ?auto_170043 ) ) ( not ( = ?auto_170040 ?auto_170043 ) ) ( ON-TABLE ?auto_170041 ) ( not ( = ?auto_170041 ?auto_170043 ) ) ( not ( = ?auto_170041 ?auto_170040 ) ) ( not ( = ?auto_170041 ?auto_170039 ) ) ( not ( = ?auto_170035 ?auto_170041 ) ) ( not ( = ?auto_170036 ?auto_170041 ) ) ( not ( = ?auto_170037 ?auto_170041 ) ) ( not ( = ?auto_170038 ?auto_170041 ) ) ( ON ?auto_170035 ?auto_170042 ) ( not ( = ?auto_170035 ?auto_170042 ) ) ( not ( = ?auto_170036 ?auto_170042 ) ) ( not ( = ?auto_170037 ?auto_170042 ) ) ( not ( = ?auto_170038 ?auto_170042 ) ) ( not ( = ?auto_170039 ?auto_170042 ) ) ( not ( = ?auto_170040 ?auto_170042 ) ) ( not ( = ?auto_170043 ?auto_170042 ) ) ( not ( = ?auto_170041 ?auto_170042 ) ) ( ON ?auto_170036 ?auto_170035 ) ( ON-TABLE ?auto_170042 ) ( ON ?auto_170037 ?auto_170036 ) ( ON ?auto_170038 ?auto_170037 ) ( ON ?auto_170039 ?auto_170038 ) ( ON ?auto_170040 ?auto_170039 ) ( CLEAR ?auto_170040 ) ( HOLDING ?auto_170043 ) ( CLEAR ?auto_170041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170041 ?auto_170043 )
      ( MAKE-6PILE ?auto_170035 ?auto_170036 ?auto_170037 ?auto_170038 ?auto_170039 ?auto_170040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170044 - BLOCK
      ?auto_170045 - BLOCK
      ?auto_170046 - BLOCK
      ?auto_170047 - BLOCK
      ?auto_170048 - BLOCK
      ?auto_170049 - BLOCK
    )
    :vars
    (
      ?auto_170052 - BLOCK
      ?auto_170050 - BLOCK
      ?auto_170051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170044 ?auto_170045 ) ) ( not ( = ?auto_170044 ?auto_170046 ) ) ( not ( = ?auto_170044 ?auto_170047 ) ) ( not ( = ?auto_170044 ?auto_170048 ) ) ( not ( = ?auto_170044 ?auto_170049 ) ) ( not ( = ?auto_170045 ?auto_170046 ) ) ( not ( = ?auto_170045 ?auto_170047 ) ) ( not ( = ?auto_170045 ?auto_170048 ) ) ( not ( = ?auto_170045 ?auto_170049 ) ) ( not ( = ?auto_170046 ?auto_170047 ) ) ( not ( = ?auto_170046 ?auto_170048 ) ) ( not ( = ?auto_170046 ?auto_170049 ) ) ( not ( = ?auto_170047 ?auto_170048 ) ) ( not ( = ?auto_170047 ?auto_170049 ) ) ( not ( = ?auto_170048 ?auto_170049 ) ) ( not ( = ?auto_170044 ?auto_170052 ) ) ( not ( = ?auto_170045 ?auto_170052 ) ) ( not ( = ?auto_170046 ?auto_170052 ) ) ( not ( = ?auto_170047 ?auto_170052 ) ) ( not ( = ?auto_170048 ?auto_170052 ) ) ( not ( = ?auto_170049 ?auto_170052 ) ) ( ON-TABLE ?auto_170050 ) ( not ( = ?auto_170050 ?auto_170052 ) ) ( not ( = ?auto_170050 ?auto_170049 ) ) ( not ( = ?auto_170050 ?auto_170048 ) ) ( not ( = ?auto_170044 ?auto_170050 ) ) ( not ( = ?auto_170045 ?auto_170050 ) ) ( not ( = ?auto_170046 ?auto_170050 ) ) ( not ( = ?auto_170047 ?auto_170050 ) ) ( ON ?auto_170044 ?auto_170051 ) ( not ( = ?auto_170044 ?auto_170051 ) ) ( not ( = ?auto_170045 ?auto_170051 ) ) ( not ( = ?auto_170046 ?auto_170051 ) ) ( not ( = ?auto_170047 ?auto_170051 ) ) ( not ( = ?auto_170048 ?auto_170051 ) ) ( not ( = ?auto_170049 ?auto_170051 ) ) ( not ( = ?auto_170052 ?auto_170051 ) ) ( not ( = ?auto_170050 ?auto_170051 ) ) ( ON ?auto_170045 ?auto_170044 ) ( ON-TABLE ?auto_170051 ) ( ON ?auto_170046 ?auto_170045 ) ( ON ?auto_170047 ?auto_170046 ) ( ON ?auto_170048 ?auto_170047 ) ( ON ?auto_170049 ?auto_170048 ) ( CLEAR ?auto_170050 ) ( ON ?auto_170052 ?auto_170049 ) ( CLEAR ?auto_170052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170051 ?auto_170044 ?auto_170045 ?auto_170046 ?auto_170047 ?auto_170048 ?auto_170049 )
      ( MAKE-6PILE ?auto_170044 ?auto_170045 ?auto_170046 ?auto_170047 ?auto_170048 ?auto_170049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170053 - BLOCK
      ?auto_170054 - BLOCK
      ?auto_170055 - BLOCK
      ?auto_170056 - BLOCK
      ?auto_170057 - BLOCK
      ?auto_170058 - BLOCK
    )
    :vars
    (
      ?auto_170061 - BLOCK
      ?auto_170059 - BLOCK
      ?auto_170060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170053 ?auto_170054 ) ) ( not ( = ?auto_170053 ?auto_170055 ) ) ( not ( = ?auto_170053 ?auto_170056 ) ) ( not ( = ?auto_170053 ?auto_170057 ) ) ( not ( = ?auto_170053 ?auto_170058 ) ) ( not ( = ?auto_170054 ?auto_170055 ) ) ( not ( = ?auto_170054 ?auto_170056 ) ) ( not ( = ?auto_170054 ?auto_170057 ) ) ( not ( = ?auto_170054 ?auto_170058 ) ) ( not ( = ?auto_170055 ?auto_170056 ) ) ( not ( = ?auto_170055 ?auto_170057 ) ) ( not ( = ?auto_170055 ?auto_170058 ) ) ( not ( = ?auto_170056 ?auto_170057 ) ) ( not ( = ?auto_170056 ?auto_170058 ) ) ( not ( = ?auto_170057 ?auto_170058 ) ) ( not ( = ?auto_170053 ?auto_170061 ) ) ( not ( = ?auto_170054 ?auto_170061 ) ) ( not ( = ?auto_170055 ?auto_170061 ) ) ( not ( = ?auto_170056 ?auto_170061 ) ) ( not ( = ?auto_170057 ?auto_170061 ) ) ( not ( = ?auto_170058 ?auto_170061 ) ) ( not ( = ?auto_170059 ?auto_170061 ) ) ( not ( = ?auto_170059 ?auto_170058 ) ) ( not ( = ?auto_170059 ?auto_170057 ) ) ( not ( = ?auto_170053 ?auto_170059 ) ) ( not ( = ?auto_170054 ?auto_170059 ) ) ( not ( = ?auto_170055 ?auto_170059 ) ) ( not ( = ?auto_170056 ?auto_170059 ) ) ( ON ?auto_170053 ?auto_170060 ) ( not ( = ?auto_170053 ?auto_170060 ) ) ( not ( = ?auto_170054 ?auto_170060 ) ) ( not ( = ?auto_170055 ?auto_170060 ) ) ( not ( = ?auto_170056 ?auto_170060 ) ) ( not ( = ?auto_170057 ?auto_170060 ) ) ( not ( = ?auto_170058 ?auto_170060 ) ) ( not ( = ?auto_170061 ?auto_170060 ) ) ( not ( = ?auto_170059 ?auto_170060 ) ) ( ON ?auto_170054 ?auto_170053 ) ( ON-TABLE ?auto_170060 ) ( ON ?auto_170055 ?auto_170054 ) ( ON ?auto_170056 ?auto_170055 ) ( ON ?auto_170057 ?auto_170056 ) ( ON ?auto_170058 ?auto_170057 ) ( ON ?auto_170061 ?auto_170058 ) ( CLEAR ?auto_170061 ) ( HOLDING ?auto_170059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170059 )
      ( MAKE-6PILE ?auto_170053 ?auto_170054 ?auto_170055 ?auto_170056 ?auto_170057 ?auto_170058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170062 - BLOCK
      ?auto_170063 - BLOCK
      ?auto_170064 - BLOCK
      ?auto_170065 - BLOCK
      ?auto_170066 - BLOCK
      ?auto_170067 - BLOCK
    )
    :vars
    (
      ?auto_170070 - BLOCK
      ?auto_170069 - BLOCK
      ?auto_170068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170062 ?auto_170063 ) ) ( not ( = ?auto_170062 ?auto_170064 ) ) ( not ( = ?auto_170062 ?auto_170065 ) ) ( not ( = ?auto_170062 ?auto_170066 ) ) ( not ( = ?auto_170062 ?auto_170067 ) ) ( not ( = ?auto_170063 ?auto_170064 ) ) ( not ( = ?auto_170063 ?auto_170065 ) ) ( not ( = ?auto_170063 ?auto_170066 ) ) ( not ( = ?auto_170063 ?auto_170067 ) ) ( not ( = ?auto_170064 ?auto_170065 ) ) ( not ( = ?auto_170064 ?auto_170066 ) ) ( not ( = ?auto_170064 ?auto_170067 ) ) ( not ( = ?auto_170065 ?auto_170066 ) ) ( not ( = ?auto_170065 ?auto_170067 ) ) ( not ( = ?auto_170066 ?auto_170067 ) ) ( not ( = ?auto_170062 ?auto_170070 ) ) ( not ( = ?auto_170063 ?auto_170070 ) ) ( not ( = ?auto_170064 ?auto_170070 ) ) ( not ( = ?auto_170065 ?auto_170070 ) ) ( not ( = ?auto_170066 ?auto_170070 ) ) ( not ( = ?auto_170067 ?auto_170070 ) ) ( not ( = ?auto_170069 ?auto_170070 ) ) ( not ( = ?auto_170069 ?auto_170067 ) ) ( not ( = ?auto_170069 ?auto_170066 ) ) ( not ( = ?auto_170062 ?auto_170069 ) ) ( not ( = ?auto_170063 ?auto_170069 ) ) ( not ( = ?auto_170064 ?auto_170069 ) ) ( not ( = ?auto_170065 ?auto_170069 ) ) ( ON ?auto_170062 ?auto_170068 ) ( not ( = ?auto_170062 ?auto_170068 ) ) ( not ( = ?auto_170063 ?auto_170068 ) ) ( not ( = ?auto_170064 ?auto_170068 ) ) ( not ( = ?auto_170065 ?auto_170068 ) ) ( not ( = ?auto_170066 ?auto_170068 ) ) ( not ( = ?auto_170067 ?auto_170068 ) ) ( not ( = ?auto_170070 ?auto_170068 ) ) ( not ( = ?auto_170069 ?auto_170068 ) ) ( ON ?auto_170063 ?auto_170062 ) ( ON-TABLE ?auto_170068 ) ( ON ?auto_170064 ?auto_170063 ) ( ON ?auto_170065 ?auto_170064 ) ( ON ?auto_170066 ?auto_170065 ) ( ON ?auto_170067 ?auto_170066 ) ( ON ?auto_170070 ?auto_170067 ) ( ON ?auto_170069 ?auto_170070 ) ( CLEAR ?auto_170069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170068 ?auto_170062 ?auto_170063 ?auto_170064 ?auto_170065 ?auto_170066 ?auto_170067 ?auto_170070 )
      ( MAKE-6PILE ?auto_170062 ?auto_170063 ?auto_170064 ?auto_170065 ?auto_170066 ?auto_170067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170072 - BLOCK
    )
    :vars
    (
      ?auto_170073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170073 ?auto_170072 ) ( CLEAR ?auto_170073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170072 ) ( not ( = ?auto_170072 ?auto_170073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170073 ?auto_170072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170074 - BLOCK
    )
    :vars
    (
      ?auto_170075 - BLOCK
      ?auto_170076 - BLOCK
      ?auto_170077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170075 ?auto_170074 ) ( CLEAR ?auto_170075 ) ( ON-TABLE ?auto_170074 ) ( not ( = ?auto_170074 ?auto_170075 ) ) ( HOLDING ?auto_170076 ) ( CLEAR ?auto_170077 ) ( not ( = ?auto_170074 ?auto_170076 ) ) ( not ( = ?auto_170074 ?auto_170077 ) ) ( not ( = ?auto_170075 ?auto_170076 ) ) ( not ( = ?auto_170075 ?auto_170077 ) ) ( not ( = ?auto_170076 ?auto_170077 ) ) )
    :subtasks
    ( ( !STACK ?auto_170076 ?auto_170077 )
      ( MAKE-1PILE ?auto_170074 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170078 - BLOCK
    )
    :vars
    (
      ?auto_170079 - BLOCK
      ?auto_170081 - BLOCK
      ?auto_170080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170079 ?auto_170078 ) ( ON-TABLE ?auto_170078 ) ( not ( = ?auto_170078 ?auto_170079 ) ) ( CLEAR ?auto_170081 ) ( not ( = ?auto_170078 ?auto_170080 ) ) ( not ( = ?auto_170078 ?auto_170081 ) ) ( not ( = ?auto_170079 ?auto_170080 ) ) ( not ( = ?auto_170079 ?auto_170081 ) ) ( not ( = ?auto_170080 ?auto_170081 ) ) ( ON ?auto_170080 ?auto_170079 ) ( CLEAR ?auto_170080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170078 ?auto_170079 )
      ( MAKE-1PILE ?auto_170078 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170082 - BLOCK
    )
    :vars
    (
      ?auto_170084 - BLOCK
      ?auto_170083 - BLOCK
      ?auto_170085 - BLOCK
      ?auto_170087 - BLOCK
      ?auto_170088 - BLOCK
      ?auto_170089 - BLOCK
      ?auto_170086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170084 ?auto_170082 ) ( ON-TABLE ?auto_170082 ) ( not ( = ?auto_170082 ?auto_170084 ) ) ( not ( = ?auto_170082 ?auto_170083 ) ) ( not ( = ?auto_170082 ?auto_170085 ) ) ( not ( = ?auto_170084 ?auto_170083 ) ) ( not ( = ?auto_170084 ?auto_170085 ) ) ( not ( = ?auto_170083 ?auto_170085 ) ) ( ON ?auto_170083 ?auto_170084 ) ( CLEAR ?auto_170083 ) ( HOLDING ?auto_170085 ) ( CLEAR ?auto_170087 ) ( ON-TABLE ?auto_170088 ) ( ON ?auto_170089 ?auto_170088 ) ( ON ?auto_170086 ?auto_170089 ) ( ON ?auto_170087 ?auto_170086 ) ( not ( = ?auto_170088 ?auto_170089 ) ) ( not ( = ?auto_170088 ?auto_170086 ) ) ( not ( = ?auto_170088 ?auto_170087 ) ) ( not ( = ?auto_170088 ?auto_170085 ) ) ( not ( = ?auto_170089 ?auto_170086 ) ) ( not ( = ?auto_170089 ?auto_170087 ) ) ( not ( = ?auto_170089 ?auto_170085 ) ) ( not ( = ?auto_170086 ?auto_170087 ) ) ( not ( = ?auto_170086 ?auto_170085 ) ) ( not ( = ?auto_170087 ?auto_170085 ) ) ( not ( = ?auto_170082 ?auto_170087 ) ) ( not ( = ?auto_170082 ?auto_170088 ) ) ( not ( = ?auto_170082 ?auto_170089 ) ) ( not ( = ?auto_170082 ?auto_170086 ) ) ( not ( = ?auto_170084 ?auto_170087 ) ) ( not ( = ?auto_170084 ?auto_170088 ) ) ( not ( = ?auto_170084 ?auto_170089 ) ) ( not ( = ?auto_170084 ?auto_170086 ) ) ( not ( = ?auto_170083 ?auto_170087 ) ) ( not ( = ?auto_170083 ?auto_170088 ) ) ( not ( = ?auto_170083 ?auto_170089 ) ) ( not ( = ?auto_170083 ?auto_170086 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170088 ?auto_170089 ?auto_170086 ?auto_170087 ?auto_170085 )
      ( MAKE-1PILE ?auto_170082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170090 - BLOCK
    )
    :vars
    (
      ?auto_170096 - BLOCK
      ?auto_170091 - BLOCK
      ?auto_170095 - BLOCK
      ?auto_170093 - BLOCK
      ?auto_170094 - BLOCK
      ?auto_170092 - BLOCK
      ?auto_170097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170096 ?auto_170090 ) ( ON-TABLE ?auto_170090 ) ( not ( = ?auto_170090 ?auto_170096 ) ) ( not ( = ?auto_170090 ?auto_170091 ) ) ( not ( = ?auto_170090 ?auto_170095 ) ) ( not ( = ?auto_170096 ?auto_170091 ) ) ( not ( = ?auto_170096 ?auto_170095 ) ) ( not ( = ?auto_170091 ?auto_170095 ) ) ( ON ?auto_170091 ?auto_170096 ) ( CLEAR ?auto_170093 ) ( ON-TABLE ?auto_170094 ) ( ON ?auto_170092 ?auto_170094 ) ( ON ?auto_170097 ?auto_170092 ) ( ON ?auto_170093 ?auto_170097 ) ( not ( = ?auto_170094 ?auto_170092 ) ) ( not ( = ?auto_170094 ?auto_170097 ) ) ( not ( = ?auto_170094 ?auto_170093 ) ) ( not ( = ?auto_170094 ?auto_170095 ) ) ( not ( = ?auto_170092 ?auto_170097 ) ) ( not ( = ?auto_170092 ?auto_170093 ) ) ( not ( = ?auto_170092 ?auto_170095 ) ) ( not ( = ?auto_170097 ?auto_170093 ) ) ( not ( = ?auto_170097 ?auto_170095 ) ) ( not ( = ?auto_170093 ?auto_170095 ) ) ( not ( = ?auto_170090 ?auto_170093 ) ) ( not ( = ?auto_170090 ?auto_170094 ) ) ( not ( = ?auto_170090 ?auto_170092 ) ) ( not ( = ?auto_170090 ?auto_170097 ) ) ( not ( = ?auto_170096 ?auto_170093 ) ) ( not ( = ?auto_170096 ?auto_170094 ) ) ( not ( = ?auto_170096 ?auto_170092 ) ) ( not ( = ?auto_170096 ?auto_170097 ) ) ( not ( = ?auto_170091 ?auto_170093 ) ) ( not ( = ?auto_170091 ?auto_170094 ) ) ( not ( = ?auto_170091 ?auto_170092 ) ) ( not ( = ?auto_170091 ?auto_170097 ) ) ( ON ?auto_170095 ?auto_170091 ) ( CLEAR ?auto_170095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170090 ?auto_170096 ?auto_170091 )
      ( MAKE-1PILE ?auto_170090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170098 - BLOCK
    )
    :vars
    (
      ?auto_170100 - BLOCK
      ?auto_170102 - BLOCK
      ?auto_170104 - BLOCK
      ?auto_170103 - BLOCK
      ?auto_170099 - BLOCK
      ?auto_170101 - BLOCK
      ?auto_170105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170100 ?auto_170098 ) ( ON-TABLE ?auto_170098 ) ( not ( = ?auto_170098 ?auto_170100 ) ) ( not ( = ?auto_170098 ?auto_170102 ) ) ( not ( = ?auto_170098 ?auto_170104 ) ) ( not ( = ?auto_170100 ?auto_170102 ) ) ( not ( = ?auto_170100 ?auto_170104 ) ) ( not ( = ?auto_170102 ?auto_170104 ) ) ( ON ?auto_170102 ?auto_170100 ) ( ON-TABLE ?auto_170103 ) ( ON ?auto_170099 ?auto_170103 ) ( ON ?auto_170101 ?auto_170099 ) ( not ( = ?auto_170103 ?auto_170099 ) ) ( not ( = ?auto_170103 ?auto_170101 ) ) ( not ( = ?auto_170103 ?auto_170105 ) ) ( not ( = ?auto_170103 ?auto_170104 ) ) ( not ( = ?auto_170099 ?auto_170101 ) ) ( not ( = ?auto_170099 ?auto_170105 ) ) ( not ( = ?auto_170099 ?auto_170104 ) ) ( not ( = ?auto_170101 ?auto_170105 ) ) ( not ( = ?auto_170101 ?auto_170104 ) ) ( not ( = ?auto_170105 ?auto_170104 ) ) ( not ( = ?auto_170098 ?auto_170105 ) ) ( not ( = ?auto_170098 ?auto_170103 ) ) ( not ( = ?auto_170098 ?auto_170099 ) ) ( not ( = ?auto_170098 ?auto_170101 ) ) ( not ( = ?auto_170100 ?auto_170105 ) ) ( not ( = ?auto_170100 ?auto_170103 ) ) ( not ( = ?auto_170100 ?auto_170099 ) ) ( not ( = ?auto_170100 ?auto_170101 ) ) ( not ( = ?auto_170102 ?auto_170105 ) ) ( not ( = ?auto_170102 ?auto_170103 ) ) ( not ( = ?auto_170102 ?auto_170099 ) ) ( not ( = ?auto_170102 ?auto_170101 ) ) ( ON ?auto_170104 ?auto_170102 ) ( CLEAR ?auto_170104 ) ( HOLDING ?auto_170105 ) ( CLEAR ?auto_170101 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170103 ?auto_170099 ?auto_170101 ?auto_170105 )
      ( MAKE-1PILE ?auto_170098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170106 - BLOCK
    )
    :vars
    (
      ?auto_170113 - BLOCK
      ?auto_170111 - BLOCK
      ?auto_170110 - BLOCK
      ?auto_170108 - BLOCK
      ?auto_170112 - BLOCK
      ?auto_170107 - BLOCK
      ?auto_170109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170113 ?auto_170106 ) ( ON-TABLE ?auto_170106 ) ( not ( = ?auto_170106 ?auto_170113 ) ) ( not ( = ?auto_170106 ?auto_170111 ) ) ( not ( = ?auto_170106 ?auto_170110 ) ) ( not ( = ?auto_170113 ?auto_170111 ) ) ( not ( = ?auto_170113 ?auto_170110 ) ) ( not ( = ?auto_170111 ?auto_170110 ) ) ( ON ?auto_170111 ?auto_170113 ) ( ON-TABLE ?auto_170108 ) ( ON ?auto_170112 ?auto_170108 ) ( ON ?auto_170107 ?auto_170112 ) ( not ( = ?auto_170108 ?auto_170112 ) ) ( not ( = ?auto_170108 ?auto_170107 ) ) ( not ( = ?auto_170108 ?auto_170109 ) ) ( not ( = ?auto_170108 ?auto_170110 ) ) ( not ( = ?auto_170112 ?auto_170107 ) ) ( not ( = ?auto_170112 ?auto_170109 ) ) ( not ( = ?auto_170112 ?auto_170110 ) ) ( not ( = ?auto_170107 ?auto_170109 ) ) ( not ( = ?auto_170107 ?auto_170110 ) ) ( not ( = ?auto_170109 ?auto_170110 ) ) ( not ( = ?auto_170106 ?auto_170109 ) ) ( not ( = ?auto_170106 ?auto_170108 ) ) ( not ( = ?auto_170106 ?auto_170112 ) ) ( not ( = ?auto_170106 ?auto_170107 ) ) ( not ( = ?auto_170113 ?auto_170109 ) ) ( not ( = ?auto_170113 ?auto_170108 ) ) ( not ( = ?auto_170113 ?auto_170112 ) ) ( not ( = ?auto_170113 ?auto_170107 ) ) ( not ( = ?auto_170111 ?auto_170109 ) ) ( not ( = ?auto_170111 ?auto_170108 ) ) ( not ( = ?auto_170111 ?auto_170112 ) ) ( not ( = ?auto_170111 ?auto_170107 ) ) ( ON ?auto_170110 ?auto_170111 ) ( CLEAR ?auto_170107 ) ( ON ?auto_170109 ?auto_170110 ) ( CLEAR ?auto_170109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170106 ?auto_170113 ?auto_170111 ?auto_170110 )
      ( MAKE-1PILE ?auto_170106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170114 - BLOCK
    )
    :vars
    (
      ?auto_170120 - BLOCK
      ?auto_170116 - BLOCK
      ?auto_170119 - BLOCK
      ?auto_170115 - BLOCK
      ?auto_170118 - BLOCK
      ?auto_170121 - BLOCK
      ?auto_170117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170120 ?auto_170114 ) ( ON-TABLE ?auto_170114 ) ( not ( = ?auto_170114 ?auto_170120 ) ) ( not ( = ?auto_170114 ?auto_170116 ) ) ( not ( = ?auto_170114 ?auto_170119 ) ) ( not ( = ?auto_170120 ?auto_170116 ) ) ( not ( = ?auto_170120 ?auto_170119 ) ) ( not ( = ?auto_170116 ?auto_170119 ) ) ( ON ?auto_170116 ?auto_170120 ) ( ON-TABLE ?auto_170115 ) ( ON ?auto_170118 ?auto_170115 ) ( not ( = ?auto_170115 ?auto_170118 ) ) ( not ( = ?auto_170115 ?auto_170121 ) ) ( not ( = ?auto_170115 ?auto_170117 ) ) ( not ( = ?auto_170115 ?auto_170119 ) ) ( not ( = ?auto_170118 ?auto_170121 ) ) ( not ( = ?auto_170118 ?auto_170117 ) ) ( not ( = ?auto_170118 ?auto_170119 ) ) ( not ( = ?auto_170121 ?auto_170117 ) ) ( not ( = ?auto_170121 ?auto_170119 ) ) ( not ( = ?auto_170117 ?auto_170119 ) ) ( not ( = ?auto_170114 ?auto_170117 ) ) ( not ( = ?auto_170114 ?auto_170115 ) ) ( not ( = ?auto_170114 ?auto_170118 ) ) ( not ( = ?auto_170114 ?auto_170121 ) ) ( not ( = ?auto_170120 ?auto_170117 ) ) ( not ( = ?auto_170120 ?auto_170115 ) ) ( not ( = ?auto_170120 ?auto_170118 ) ) ( not ( = ?auto_170120 ?auto_170121 ) ) ( not ( = ?auto_170116 ?auto_170117 ) ) ( not ( = ?auto_170116 ?auto_170115 ) ) ( not ( = ?auto_170116 ?auto_170118 ) ) ( not ( = ?auto_170116 ?auto_170121 ) ) ( ON ?auto_170119 ?auto_170116 ) ( ON ?auto_170117 ?auto_170119 ) ( CLEAR ?auto_170117 ) ( HOLDING ?auto_170121 ) ( CLEAR ?auto_170118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170115 ?auto_170118 ?auto_170121 )
      ( MAKE-1PILE ?auto_170114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170122 - BLOCK
    )
    :vars
    (
      ?auto_170127 - BLOCK
      ?auto_170123 - BLOCK
      ?auto_170125 - BLOCK
      ?auto_170126 - BLOCK
      ?auto_170129 - BLOCK
      ?auto_170124 - BLOCK
      ?auto_170128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170127 ?auto_170122 ) ( ON-TABLE ?auto_170122 ) ( not ( = ?auto_170122 ?auto_170127 ) ) ( not ( = ?auto_170122 ?auto_170123 ) ) ( not ( = ?auto_170122 ?auto_170125 ) ) ( not ( = ?auto_170127 ?auto_170123 ) ) ( not ( = ?auto_170127 ?auto_170125 ) ) ( not ( = ?auto_170123 ?auto_170125 ) ) ( ON ?auto_170123 ?auto_170127 ) ( ON-TABLE ?auto_170126 ) ( ON ?auto_170129 ?auto_170126 ) ( not ( = ?auto_170126 ?auto_170129 ) ) ( not ( = ?auto_170126 ?auto_170124 ) ) ( not ( = ?auto_170126 ?auto_170128 ) ) ( not ( = ?auto_170126 ?auto_170125 ) ) ( not ( = ?auto_170129 ?auto_170124 ) ) ( not ( = ?auto_170129 ?auto_170128 ) ) ( not ( = ?auto_170129 ?auto_170125 ) ) ( not ( = ?auto_170124 ?auto_170128 ) ) ( not ( = ?auto_170124 ?auto_170125 ) ) ( not ( = ?auto_170128 ?auto_170125 ) ) ( not ( = ?auto_170122 ?auto_170128 ) ) ( not ( = ?auto_170122 ?auto_170126 ) ) ( not ( = ?auto_170122 ?auto_170129 ) ) ( not ( = ?auto_170122 ?auto_170124 ) ) ( not ( = ?auto_170127 ?auto_170128 ) ) ( not ( = ?auto_170127 ?auto_170126 ) ) ( not ( = ?auto_170127 ?auto_170129 ) ) ( not ( = ?auto_170127 ?auto_170124 ) ) ( not ( = ?auto_170123 ?auto_170128 ) ) ( not ( = ?auto_170123 ?auto_170126 ) ) ( not ( = ?auto_170123 ?auto_170129 ) ) ( not ( = ?auto_170123 ?auto_170124 ) ) ( ON ?auto_170125 ?auto_170123 ) ( ON ?auto_170128 ?auto_170125 ) ( CLEAR ?auto_170129 ) ( ON ?auto_170124 ?auto_170128 ) ( CLEAR ?auto_170124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170122 ?auto_170127 ?auto_170123 ?auto_170125 ?auto_170128 )
      ( MAKE-1PILE ?auto_170122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170130 - BLOCK
    )
    :vars
    (
      ?auto_170134 - BLOCK
      ?auto_170136 - BLOCK
      ?auto_170137 - BLOCK
      ?auto_170135 - BLOCK
      ?auto_170133 - BLOCK
      ?auto_170132 - BLOCK
      ?auto_170131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170134 ?auto_170130 ) ( ON-TABLE ?auto_170130 ) ( not ( = ?auto_170130 ?auto_170134 ) ) ( not ( = ?auto_170130 ?auto_170136 ) ) ( not ( = ?auto_170130 ?auto_170137 ) ) ( not ( = ?auto_170134 ?auto_170136 ) ) ( not ( = ?auto_170134 ?auto_170137 ) ) ( not ( = ?auto_170136 ?auto_170137 ) ) ( ON ?auto_170136 ?auto_170134 ) ( ON-TABLE ?auto_170135 ) ( not ( = ?auto_170135 ?auto_170133 ) ) ( not ( = ?auto_170135 ?auto_170132 ) ) ( not ( = ?auto_170135 ?auto_170131 ) ) ( not ( = ?auto_170135 ?auto_170137 ) ) ( not ( = ?auto_170133 ?auto_170132 ) ) ( not ( = ?auto_170133 ?auto_170131 ) ) ( not ( = ?auto_170133 ?auto_170137 ) ) ( not ( = ?auto_170132 ?auto_170131 ) ) ( not ( = ?auto_170132 ?auto_170137 ) ) ( not ( = ?auto_170131 ?auto_170137 ) ) ( not ( = ?auto_170130 ?auto_170131 ) ) ( not ( = ?auto_170130 ?auto_170135 ) ) ( not ( = ?auto_170130 ?auto_170133 ) ) ( not ( = ?auto_170130 ?auto_170132 ) ) ( not ( = ?auto_170134 ?auto_170131 ) ) ( not ( = ?auto_170134 ?auto_170135 ) ) ( not ( = ?auto_170134 ?auto_170133 ) ) ( not ( = ?auto_170134 ?auto_170132 ) ) ( not ( = ?auto_170136 ?auto_170131 ) ) ( not ( = ?auto_170136 ?auto_170135 ) ) ( not ( = ?auto_170136 ?auto_170133 ) ) ( not ( = ?auto_170136 ?auto_170132 ) ) ( ON ?auto_170137 ?auto_170136 ) ( ON ?auto_170131 ?auto_170137 ) ( ON ?auto_170132 ?auto_170131 ) ( CLEAR ?auto_170132 ) ( HOLDING ?auto_170133 ) ( CLEAR ?auto_170135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170135 ?auto_170133 )
      ( MAKE-1PILE ?auto_170130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170138 - BLOCK
    )
    :vars
    (
      ?auto_170145 - BLOCK
      ?auto_170140 - BLOCK
      ?auto_170139 - BLOCK
      ?auto_170143 - BLOCK
      ?auto_170144 - BLOCK
      ?auto_170142 - BLOCK
      ?auto_170141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170145 ?auto_170138 ) ( ON-TABLE ?auto_170138 ) ( not ( = ?auto_170138 ?auto_170145 ) ) ( not ( = ?auto_170138 ?auto_170140 ) ) ( not ( = ?auto_170138 ?auto_170139 ) ) ( not ( = ?auto_170145 ?auto_170140 ) ) ( not ( = ?auto_170145 ?auto_170139 ) ) ( not ( = ?auto_170140 ?auto_170139 ) ) ( ON ?auto_170140 ?auto_170145 ) ( ON-TABLE ?auto_170143 ) ( not ( = ?auto_170143 ?auto_170144 ) ) ( not ( = ?auto_170143 ?auto_170142 ) ) ( not ( = ?auto_170143 ?auto_170141 ) ) ( not ( = ?auto_170143 ?auto_170139 ) ) ( not ( = ?auto_170144 ?auto_170142 ) ) ( not ( = ?auto_170144 ?auto_170141 ) ) ( not ( = ?auto_170144 ?auto_170139 ) ) ( not ( = ?auto_170142 ?auto_170141 ) ) ( not ( = ?auto_170142 ?auto_170139 ) ) ( not ( = ?auto_170141 ?auto_170139 ) ) ( not ( = ?auto_170138 ?auto_170141 ) ) ( not ( = ?auto_170138 ?auto_170143 ) ) ( not ( = ?auto_170138 ?auto_170144 ) ) ( not ( = ?auto_170138 ?auto_170142 ) ) ( not ( = ?auto_170145 ?auto_170141 ) ) ( not ( = ?auto_170145 ?auto_170143 ) ) ( not ( = ?auto_170145 ?auto_170144 ) ) ( not ( = ?auto_170145 ?auto_170142 ) ) ( not ( = ?auto_170140 ?auto_170141 ) ) ( not ( = ?auto_170140 ?auto_170143 ) ) ( not ( = ?auto_170140 ?auto_170144 ) ) ( not ( = ?auto_170140 ?auto_170142 ) ) ( ON ?auto_170139 ?auto_170140 ) ( ON ?auto_170141 ?auto_170139 ) ( ON ?auto_170142 ?auto_170141 ) ( CLEAR ?auto_170143 ) ( ON ?auto_170144 ?auto_170142 ) ( CLEAR ?auto_170144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170138 ?auto_170145 ?auto_170140 ?auto_170139 ?auto_170141 ?auto_170142 )
      ( MAKE-1PILE ?auto_170138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170146 - BLOCK
    )
    :vars
    (
      ?auto_170153 - BLOCK
      ?auto_170149 - BLOCK
      ?auto_170152 - BLOCK
      ?auto_170150 - BLOCK
      ?auto_170147 - BLOCK
      ?auto_170148 - BLOCK
      ?auto_170151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170153 ?auto_170146 ) ( ON-TABLE ?auto_170146 ) ( not ( = ?auto_170146 ?auto_170153 ) ) ( not ( = ?auto_170146 ?auto_170149 ) ) ( not ( = ?auto_170146 ?auto_170152 ) ) ( not ( = ?auto_170153 ?auto_170149 ) ) ( not ( = ?auto_170153 ?auto_170152 ) ) ( not ( = ?auto_170149 ?auto_170152 ) ) ( ON ?auto_170149 ?auto_170153 ) ( not ( = ?auto_170150 ?auto_170147 ) ) ( not ( = ?auto_170150 ?auto_170148 ) ) ( not ( = ?auto_170150 ?auto_170151 ) ) ( not ( = ?auto_170150 ?auto_170152 ) ) ( not ( = ?auto_170147 ?auto_170148 ) ) ( not ( = ?auto_170147 ?auto_170151 ) ) ( not ( = ?auto_170147 ?auto_170152 ) ) ( not ( = ?auto_170148 ?auto_170151 ) ) ( not ( = ?auto_170148 ?auto_170152 ) ) ( not ( = ?auto_170151 ?auto_170152 ) ) ( not ( = ?auto_170146 ?auto_170151 ) ) ( not ( = ?auto_170146 ?auto_170150 ) ) ( not ( = ?auto_170146 ?auto_170147 ) ) ( not ( = ?auto_170146 ?auto_170148 ) ) ( not ( = ?auto_170153 ?auto_170151 ) ) ( not ( = ?auto_170153 ?auto_170150 ) ) ( not ( = ?auto_170153 ?auto_170147 ) ) ( not ( = ?auto_170153 ?auto_170148 ) ) ( not ( = ?auto_170149 ?auto_170151 ) ) ( not ( = ?auto_170149 ?auto_170150 ) ) ( not ( = ?auto_170149 ?auto_170147 ) ) ( not ( = ?auto_170149 ?auto_170148 ) ) ( ON ?auto_170152 ?auto_170149 ) ( ON ?auto_170151 ?auto_170152 ) ( ON ?auto_170148 ?auto_170151 ) ( ON ?auto_170147 ?auto_170148 ) ( CLEAR ?auto_170147 ) ( HOLDING ?auto_170150 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170150 )
      ( MAKE-1PILE ?auto_170146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170154 - BLOCK
    )
    :vars
    (
      ?auto_170156 - BLOCK
      ?auto_170160 - BLOCK
      ?auto_170161 - BLOCK
      ?auto_170157 - BLOCK
      ?auto_170158 - BLOCK
      ?auto_170155 - BLOCK
      ?auto_170159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170156 ?auto_170154 ) ( ON-TABLE ?auto_170154 ) ( not ( = ?auto_170154 ?auto_170156 ) ) ( not ( = ?auto_170154 ?auto_170160 ) ) ( not ( = ?auto_170154 ?auto_170161 ) ) ( not ( = ?auto_170156 ?auto_170160 ) ) ( not ( = ?auto_170156 ?auto_170161 ) ) ( not ( = ?auto_170160 ?auto_170161 ) ) ( ON ?auto_170160 ?auto_170156 ) ( not ( = ?auto_170157 ?auto_170158 ) ) ( not ( = ?auto_170157 ?auto_170155 ) ) ( not ( = ?auto_170157 ?auto_170159 ) ) ( not ( = ?auto_170157 ?auto_170161 ) ) ( not ( = ?auto_170158 ?auto_170155 ) ) ( not ( = ?auto_170158 ?auto_170159 ) ) ( not ( = ?auto_170158 ?auto_170161 ) ) ( not ( = ?auto_170155 ?auto_170159 ) ) ( not ( = ?auto_170155 ?auto_170161 ) ) ( not ( = ?auto_170159 ?auto_170161 ) ) ( not ( = ?auto_170154 ?auto_170159 ) ) ( not ( = ?auto_170154 ?auto_170157 ) ) ( not ( = ?auto_170154 ?auto_170158 ) ) ( not ( = ?auto_170154 ?auto_170155 ) ) ( not ( = ?auto_170156 ?auto_170159 ) ) ( not ( = ?auto_170156 ?auto_170157 ) ) ( not ( = ?auto_170156 ?auto_170158 ) ) ( not ( = ?auto_170156 ?auto_170155 ) ) ( not ( = ?auto_170160 ?auto_170159 ) ) ( not ( = ?auto_170160 ?auto_170157 ) ) ( not ( = ?auto_170160 ?auto_170158 ) ) ( not ( = ?auto_170160 ?auto_170155 ) ) ( ON ?auto_170161 ?auto_170160 ) ( ON ?auto_170159 ?auto_170161 ) ( ON ?auto_170155 ?auto_170159 ) ( ON ?auto_170158 ?auto_170155 ) ( ON ?auto_170157 ?auto_170158 ) ( CLEAR ?auto_170157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170154 ?auto_170156 ?auto_170160 ?auto_170161 ?auto_170159 ?auto_170155 ?auto_170158 )
      ( MAKE-1PILE ?auto_170154 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170162 - BLOCK
    )
    :vars
    (
      ?auto_170166 - BLOCK
      ?auto_170165 - BLOCK
      ?auto_170167 - BLOCK
      ?auto_170164 - BLOCK
      ?auto_170163 - BLOCK
      ?auto_170168 - BLOCK
      ?auto_170169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170166 ?auto_170162 ) ( ON-TABLE ?auto_170162 ) ( not ( = ?auto_170162 ?auto_170166 ) ) ( not ( = ?auto_170162 ?auto_170165 ) ) ( not ( = ?auto_170162 ?auto_170167 ) ) ( not ( = ?auto_170166 ?auto_170165 ) ) ( not ( = ?auto_170166 ?auto_170167 ) ) ( not ( = ?auto_170165 ?auto_170167 ) ) ( ON ?auto_170165 ?auto_170166 ) ( not ( = ?auto_170164 ?auto_170163 ) ) ( not ( = ?auto_170164 ?auto_170168 ) ) ( not ( = ?auto_170164 ?auto_170169 ) ) ( not ( = ?auto_170164 ?auto_170167 ) ) ( not ( = ?auto_170163 ?auto_170168 ) ) ( not ( = ?auto_170163 ?auto_170169 ) ) ( not ( = ?auto_170163 ?auto_170167 ) ) ( not ( = ?auto_170168 ?auto_170169 ) ) ( not ( = ?auto_170168 ?auto_170167 ) ) ( not ( = ?auto_170169 ?auto_170167 ) ) ( not ( = ?auto_170162 ?auto_170169 ) ) ( not ( = ?auto_170162 ?auto_170164 ) ) ( not ( = ?auto_170162 ?auto_170163 ) ) ( not ( = ?auto_170162 ?auto_170168 ) ) ( not ( = ?auto_170166 ?auto_170169 ) ) ( not ( = ?auto_170166 ?auto_170164 ) ) ( not ( = ?auto_170166 ?auto_170163 ) ) ( not ( = ?auto_170166 ?auto_170168 ) ) ( not ( = ?auto_170165 ?auto_170169 ) ) ( not ( = ?auto_170165 ?auto_170164 ) ) ( not ( = ?auto_170165 ?auto_170163 ) ) ( not ( = ?auto_170165 ?auto_170168 ) ) ( ON ?auto_170167 ?auto_170165 ) ( ON ?auto_170169 ?auto_170167 ) ( ON ?auto_170168 ?auto_170169 ) ( ON ?auto_170163 ?auto_170168 ) ( HOLDING ?auto_170164 ) ( CLEAR ?auto_170163 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170162 ?auto_170166 ?auto_170165 ?auto_170167 ?auto_170169 ?auto_170168 ?auto_170163 ?auto_170164 )
      ( MAKE-1PILE ?auto_170162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170170 - BLOCK
    )
    :vars
    (
      ?auto_170174 - BLOCK
      ?auto_170172 - BLOCK
      ?auto_170176 - BLOCK
      ?auto_170171 - BLOCK
      ?auto_170173 - BLOCK
      ?auto_170177 - BLOCK
      ?auto_170175 - BLOCK
      ?auto_170178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170174 ?auto_170170 ) ( ON-TABLE ?auto_170170 ) ( not ( = ?auto_170170 ?auto_170174 ) ) ( not ( = ?auto_170170 ?auto_170172 ) ) ( not ( = ?auto_170170 ?auto_170176 ) ) ( not ( = ?auto_170174 ?auto_170172 ) ) ( not ( = ?auto_170174 ?auto_170176 ) ) ( not ( = ?auto_170172 ?auto_170176 ) ) ( ON ?auto_170172 ?auto_170174 ) ( not ( = ?auto_170171 ?auto_170173 ) ) ( not ( = ?auto_170171 ?auto_170177 ) ) ( not ( = ?auto_170171 ?auto_170175 ) ) ( not ( = ?auto_170171 ?auto_170176 ) ) ( not ( = ?auto_170173 ?auto_170177 ) ) ( not ( = ?auto_170173 ?auto_170175 ) ) ( not ( = ?auto_170173 ?auto_170176 ) ) ( not ( = ?auto_170177 ?auto_170175 ) ) ( not ( = ?auto_170177 ?auto_170176 ) ) ( not ( = ?auto_170175 ?auto_170176 ) ) ( not ( = ?auto_170170 ?auto_170175 ) ) ( not ( = ?auto_170170 ?auto_170171 ) ) ( not ( = ?auto_170170 ?auto_170173 ) ) ( not ( = ?auto_170170 ?auto_170177 ) ) ( not ( = ?auto_170174 ?auto_170175 ) ) ( not ( = ?auto_170174 ?auto_170171 ) ) ( not ( = ?auto_170174 ?auto_170173 ) ) ( not ( = ?auto_170174 ?auto_170177 ) ) ( not ( = ?auto_170172 ?auto_170175 ) ) ( not ( = ?auto_170172 ?auto_170171 ) ) ( not ( = ?auto_170172 ?auto_170173 ) ) ( not ( = ?auto_170172 ?auto_170177 ) ) ( ON ?auto_170176 ?auto_170172 ) ( ON ?auto_170175 ?auto_170176 ) ( ON ?auto_170177 ?auto_170175 ) ( ON ?auto_170173 ?auto_170177 ) ( CLEAR ?auto_170173 ) ( ON ?auto_170171 ?auto_170178 ) ( CLEAR ?auto_170171 ) ( HAND-EMPTY ) ( not ( = ?auto_170170 ?auto_170178 ) ) ( not ( = ?auto_170174 ?auto_170178 ) ) ( not ( = ?auto_170172 ?auto_170178 ) ) ( not ( = ?auto_170176 ?auto_170178 ) ) ( not ( = ?auto_170171 ?auto_170178 ) ) ( not ( = ?auto_170173 ?auto_170178 ) ) ( not ( = ?auto_170177 ?auto_170178 ) ) ( not ( = ?auto_170175 ?auto_170178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170171 ?auto_170178 )
      ( MAKE-1PILE ?auto_170170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170179 - BLOCK
    )
    :vars
    (
      ?auto_170183 - BLOCK
      ?auto_170185 - BLOCK
      ?auto_170182 - BLOCK
      ?auto_170186 - BLOCK
      ?auto_170184 - BLOCK
      ?auto_170181 - BLOCK
      ?auto_170180 - BLOCK
      ?auto_170187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170183 ?auto_170179 ) ( ON-TABLE ?auto_170179 ) ( not ( = ?auto_170179 ?auto_170183 ) ) ( not ( = ?auto_170179 ?auto_170185 ) ) ( not ( = ?auto_170179 ?auto_170182 ) ) ( not ( = ?auto_170183 ?auto_170185 ) ) ( not ( = ?auto_170183 ?auto_170182 ) ) ( not ( = ?auto_170185 ?auto_170182 ) ) ( ON ?auto_170185 ?auto_170183 ) ( not ( = ?auto_170186 ?auto_170184 ) ) ( not ( = ?auto_170186 ?auto_170181 ) ) ( not ( = ?auto_170186 ?auto_170180 ) ) ( not ( = ?auto_170186 ?auto_170182 ) ) ( not ( = ?auto_170184 ?auto_170181 ) ) ( not ( = ?auto_170184 ?auto_170180 ) ) ( not ( = ?auto_170184 ?auto_170182 ) ) ( not ( = ?auto_170181 ?auto_170180 ) ) ( not ( = ?auto_170181 ?auto_170182 ) ) ( not ( = ?auto_170180 ?auto_170182 ) ) ( not ( = ?auto_170179 ?auto_170180 ) ) ( not ( = ?auto_170179 ?auto_170186 ) ) ( not ( = ?auto_170179 ?auto_170184 ) ) ( not ( = ?auto_170179 ?auto_170181 ) ) ( not ( = ?auto_170183 ?auto_170180 ) ) ( not ( = ?auto_170183 ?auto_170186 ) ) ( not ( = ?auto_170183 ?auto_170184 ) ) ( not ( = ?auto_170183 ?auto_170181 ) ) ( not ( = ?auto_170185 ?auto_170180 ) ) ( not ( = ?auto_170185 ?auto_170186 ) ) ( not ( = ?auto_170185 ?auto_170184 ) ) ( not ( = ?auto_170185 ?auto_170181 ) ) ( ON ?auto_170182 ?auto_170185 ) ( ON ?auto_170180 ?auto_170182 ) ( ON ?auto_170181 ?auto_170180 ) ( ON ?auto_170186 ?auto_170187 ) ( CLEAR ?auto_170186 ) ( not ( = ?auto_170179 ?auto_170187 ) ) ( not ( = ?auto_170183 ?auto_170187 ) ) ( not ( = ?auto_170185 ?auto_170187 ) ) ( not ( = ?auto_170182 ?auto_170187 ) ) ( not ( = ?auto_170186 ?auto_170187 ) ) ( not ( = ?auto_170184 ?auto_170187 ) ) ( not ( = ?auto_170181 ?auto_170187 ) ) ( not ( = ?auto_170180 ?auto_170187 ) ) ( HOLDING ?auto_170184 ) ( CLEAR ?auto_170181 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170179 ?auto_170183 ?auto_170185 ?auto_170182 ?auto_170180 ?auto_170181 ?auto_170184 )
      ( MAKE-1PILE ?auto_170179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170188 - BLOCK
    )
    :vars
    (
      ?auto_170196 - BLOCK
      ?auto_170192 - BLOCK
      ?auto_170195 - BLOCK
      ?auto_170194 - BLOCK
      ?auto_170190 - BLOCK
      ?auto_170193 - BLOCK
      ?auto_170191 - BLOCK
      ?auto_170189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170196 ?auto_170188 ) ( ON-TABLE ?auto_170188 ) ( not ( = ?auto_170188 ?auto_170196 ) ) ( not ( = ?auto_170188 ?auto_170192 ) ) ( not ( = ?auto_170188 ?auto_170195 ) ) ( not ( = ?auto_170196 ?auto_170192 ) ) ( not ( = ?auto_170196 ?auto_170195 ) ) ( not ( = ?auto_170192 ?auto_170195 ) ) ( ON ?auto_170192 ?auto_170196 ) ( not ( = ?auto_170194 ?auto_170190 ) ) ( not ( = ?auto_170194 ?auto_170193 ) ) ( not ( = ?auto_170194 ?auto_170191 ) ) ( not ( = ?auto_170194 ?auto_170195 ) ) ( not ( = ?auto_170190 ?auto_170193 ) ) ( not ( = ?auto_170190 ?auto_170191 ) ) ( not ( = ?auto_170190 ?auto_170195 ) ) ( not ( = ?auto_170193 ?auto_170191 ) ) ( not ( = ?auto_170193 ?auto_170195 ) ) ( not ( = ?auto_170191 ?auto_170195 ) ) ( not ( = ?auto_170188 ?auto_170191 ) ) ( not ( = ?auto_170188 ?auto_170194 ) ) ( not ( = ?auto_170188 ?auto_170190 ) ) ( not ( = ?auto_170188 ?auto_170193 ) ) ( not ( = ?auto_170196 ?auto_170191 ) ) ( not ( = ?auto_170196 ?auto_170194 ) ) ( not ( = ?auto_170196 ?auto_170190 ) ) ( not ( = ?auto_170196 ?auto_170193 ) ) ( not ( = ?auto_170192 ?auto_170191 ) ) ( not ( = ?auto_170192 ?auto_170194 ) ) ( not ( = ?auto_170192 ?auto_170190 ) ) ( not ( = ?auto_170192 ?auto_170193 ) ) ( ON ?auto_170195 ?auto_170192 ) ( ON ?auto_170191 ?auto_170195 ) ( ON ?auto_170193 ?auto_170191 ) ( ON ?auto_170194 ?auto_170189 ) ( not ( = ?auto_170188 ?auto_170189 ) ) ( not ( = ?auto_170196 ?auto_170189 ) ) ( not ( = ?auto_170192 ?auto_170189 ) ) ( not ( = ?auto_170195 ?auto_170189 ) ) ( not ( = ?auto_170194 ?auto_170189 ) ) ( not ( = ?auto_170190 ?auto_170189 ) ) ( not ( = ?auto_170193 ?auto_170189 ) ) ( not ( = ?auto_170191 ?auto_170189 ) ) ( CLEAR ?auto_170193 ) ( ON ?auto_170190 ?auto_170194 ) ( CLEAR ?auto_170190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170189 ?auto_170194 )
      ( MAKE-1PILE ?auto_170188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170197 - BLOCK
    )
    :vars
    (
      ?auto_170205 - BLOCK
      ?auto_170200 - BLOCK
      ?auto_170203 - BLOCK
      ?auto_170202 - BLOCK
      ?auto_170201 - BLOCK
      ?auto_170204 - BLOCK
      ?auto_170198 - BLOCK
      ?auto_170199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170205 ?auto_170197 ) ( ON-TABLE ?auto_170197 ) ( not ( = ?auto_170197 ?auto_170205 ) ) ( not ( = ?auto_170197 ?auto_170200 ) ) ( not ( = ?auto_170197 ?auto_170203 ) ) ( not ( = ?auto_170205 ?auto_170200 ) ) ( not ( = ?auto_170205 ?auto_170203 ) ) ( not ( = ?auto_170200 ?auto_170203 ) ) ( ON ?auto_170200 ?auto_170205 ) ( not ( = ?auto_170202 ?auto_170201 ) ) ( not ( = ?auto_170202 ?auto_170204 ) ) ( not ( = ?auto_170202 ?auto_170198 ) ) ( not ( = ?auto_170202 ?auto_170203 ) ) ( not ( = ?auto_170201 ?auto_170204 ) ) ( not ( = ?auto_170201 ?auto_170198 ) ) ( not ( = ?auto_170201 ?auto_170203 ) ) ( not ( = ?auto_170204 ?auto_170198 ) ) ( not ( = ?auto_170204 ?auto_170203 ) ) ( not ( = ?auto_170198 ?auto_170203 ) ) ( not ( = ?auto_170197 ?auto_170198 ) ) ( not ( = ?auto_170197 ?auto_170202 ) ) ( not ( = ?auto_170197 ?auto_170201 ) ) ( not ( = ?auto_170197 ?auto_170204 ) ) ( not ( = ?auto_170205 ?auto_170198 ) ) ( not ( = ?auto_170205 ?auto_170202 ) ) ( not ( = ?auto_170205 ?auto_170201 ) ) ( not ( = ?auto_170205 ?auto_170204 ) ) ( not ( = ?auto_170200 ?auto_170198 ) ) ( not ( = ?auto_170200 ?auto_170202 ) ) ( not ( = ?auto_170200 ?auto_170201 ) ) ( not ( = ?auto_170200 ?auto_170204 ) ) ( ON ?auto_170203 ?auto_170200 ) ( ON ?auto_170198 ?auto_170203 ) ( ON ?auto_170202 ?auto_170199 ) ( not ( = ?auto_170197 ?auto_170199 ) ) ( not ( = ?auto_170205 ?auto_170199 ) ) ( not ( = ?auto_170200 ?auto_170199 ) ) ( not ( = ?auto_170203 ?auto_170199 ) ) ( not ( = ?auto_170202 ?auto_170199 ) ) ( not ( = ?auto_170201 ?auto_170199 ) ) ( not ( = ?auto_170204 ?auto_170199 ) ) ( not ( = ?auto_170198 ?auto_170199 ) ) ( ON ?auto_170201 ?auto_170202 ) ( CLEAR ?auto_170201 ) ( ON-TABLE ?auto_170199 ) ( HOLDING ?auto_170204 ) ( CLEAR ?auto_170198 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170197 ?auto_170205 ?auto_170200 ?auto_170203 ?auto_170198 ?auto_170204 )
      ( MAKE-1PILE ?auto_170197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170206 - BLOCK
    )
    :vars
    (
      ?auto_170210 - BLOCK
      ?auto_170209 - BLOCK
      ?auto_170208 - BLOCK
      ?auto_170214 - BLOCK
      ?auto_170211 - BLOCK
      ?auto_170213 - BLOCK
      ?auto_170212 - BLOCK
      ?auto_170207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170210 ?auto_170206 ) ( ON-TABLE ?auto_170206 ) ( not ( = ?auto_170206 ?auto_170210 ) ) ( not ( = ?auto_170206 ?auto_170209 ) ) ( not ( = ?auto_170206 ?auto_170208 ) ) ( not ( = ?auto_170210 ?auto_170209 ) ) ( not ( = ?auto_170210 ?auto_170208 ) ) ( not ( = ?auto_170209 ?auto_170208 ) ) ( ON ?auto_170209 ?auto_170210 ) ( not ( = ?auto_170214 ?auto_170211 ) ) ( not ( = ?auto_170214 ?auto_170213 ) ) ( not ( = ?auto_170214 ?auto_170212 ) ) ( not ( = ?auto_170214 ?auto_170208 ) ) ( not ( = ?auto_170211 ?auto_170213 ) ) ( not ( = ?auto_170211 ?auto_170212 ) ) ( not ( = ?auto_170211 ?auto_170208 ) ) ( not ( = ?auto_170213 ?auto_170212 ) ) ( not ( = ?auto_170213 ?auto_170208 ) ) ( not ( = ?auto_170212 ?auto_170208 ) ) ( not ( = ?auto_170206 ?auto_170212 ) ) ( not ( = ?auto_170206 ?auto_170214 ) ) ( not ( = ?auto_170206 ?auto_170211 ) ) ( not ( = ?auto_170206 ?auto_170213 ) ) ( not ( = ?auto_170210 ?auto_170212 ) ) ( not ( = ?auto_170210 ?auto_170214 ) ) ( not ( = ?auto_170210 ?auto_170211 ) ) ( not ( = ?auto_170210 ?auto_170213 ) ) ( not ( = ?auto_170209 ?auto_170212 ) ) ( not ( = ?auto_170209 ?auto_170214 ) ) ( not ( = ?auto_170209 ?auto_170211 ) ) ( not ( = ?auto_170209 ?auto_170213 ) ) ( ON ?auto_170208 ?auto_170209 ) ( ON ?auto_170212 ?auto_170208 ) ( ON ?auto_170214 ?auto_170207 ) ( not ( = ?auto_170206 ?auto_170207 ) ) ( not ( = ?auto_170210 ?auto_170207 ) ) ( not ( = ?auto_170209 ?auto_170207 ) ) ( not ( = ?auto_170208 ?auto_170207 ) ) ( not ( = ?auto_170214 ?auto_170207 ) ) ( not ( = ?auto_170211 ?auto_170207 ) ) ( not ( = ?auto_170213 ?auto_170207 ) ) ( not ( = ?auto_170212 ?auto_170207 ) ) ( ON ?auto_170211 ?auto_170214 ) ( ON-TABLE ?auto_170207 ) ( CLEAR ?auto_170212 ) ( ON ?auto_170213 ?auto_170211 ) ( CLEAR ?auto_170213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170207 ?auto_170214 ?auto_170211 )
      ( MAKE-1PILE ?auto_170206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170215 - BLOCK
    )
    :vars
    (
      ?auto_170218 - BLOCK
      ?auto_170221 - BLOCK
      ?auto_170219 - BLOCK
      ?auto_170216 - BLOCK
      ?auto_170217 - BLOCK
      ?auto_170220 - BLOCK
      ?auto_170223 - BLOCK
      ?auto_170222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170218 ?auto_170215 ) ( ON-TABLE ?auto_170215 ) ( not ( = ?auto_170215 ?auto_170218 ) ) ( not ( = ?auto_170215 ?auto_170221 ) ) ( not ( = ?auto_170215 ?auto_170219 ) ) ( not ( = ?auto_170218 ?auto_170221 ) ) ( not ( = ?auto_170218 ?auto_170219 ) ) ( not ( = ?auto_170221 ?auto_170219 ) ) ( ON ?auto_170221 ?auto_170218 ) ( not ( = ?auto_170216 ?auto_170217 ) ) ( not ( = ?auto_170216 ?auto_170220 ) ) ( not ( = ?auto_170216 ?auto_170223 ) ) ( not ( = ?auto_170216 ?auto_170219 ) ) ( not ( = ?auto_170217 ?auto_170220 ) ) ( not ( = ?auto_170217 ?auto_170223 ) ) ( not ( = ?auto_170217 ?auto_170219 ) ) ( not ( = ?auto_170220 ?auto_170223 ) ) ( not ( = ?auto_170220 ?auto_170219 ) ) ( not ( = ?auto_170223 ?auto_170219 ) ) ( not ( = ?auto_170215 ?auto_170223 ) ) ( not ( = ?auto_170215 ?auto_170216 ) ) ( not ( = ?auto_170215 ?auto_170217 ) ) ( not ( = ?auto_170215 ?auto_170220 ) ) ( not ( = ?auto_170218 ?auto_170223 ) ) ( not ( = ?auto_170218 ?auto_170216 ) ) ( not ( = ?auto_170218 ?auto_170217 ) ) ( not ( = ?auto_170218 ?auto_170220 ) ) ( not ( = ?auto_170221 ?auto_170223 ) ) ( not ( = ?auto_170221 ?auto_170216 ) ) ( not ( = ?auto_170221 ?auto_170217 ) ) ( not ( = ?auto_170221 ?auto_170220 ) ) ( ON ?auto_170219 ?auto_170221 ) ( ON ?auto_170216 ?auto_170222 ) ( not ( = ?auto_170215 ?auto_170222 ) ) ( not ( = ?auto_170218 ?auto_170222 ) ) ( not ( = ?auto_170221 ?auto_170222 ) ) ( not ( = ?auto_170219 ?auto_170222 ) ) ( not ( = ?auto_170216 ?auto_170222 ) ) ( not ( = ?auto_170217 ?auto_170222 ) ) ( not ( = ?auto_170220 ?auto_170222 ) ) ( not ( = ?auto_170223 ?auto_170222 ) ) ( ON ?auto_170217 ?auto_170216 ) ( ON-TABLE ?auto_170222 ) ( ON ?auto_170220 ?auto_170217 ) ( CLEAR ?auto_170220 ) ( HOLDING ?auto_170223 ) ( CLEAR ?auto_170219 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170215 ?auto_170218 ?auto_170221 ?auto_170219 ?auto_170223 )
      ( MAKE-1PILE ?auto_170215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170224 - BLOCK
    )
    :vars
    (
      ?auto_170228 - BLOCK
      ?auto_170225 - BLOCK
      ?auto_170230 - BLOCK
      ?auto_170232 - BLOCK
      ?auto_170226 - BLOCK
      ?auto_170231 - BLOCK
      ?auto_170229 - BLOCK
      ?auto_170227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170228 ?auto_170224 ) ( ON-TABLE ?auto_170224 ) ( not ( = ?auto_170224 ?auto_170228 ) ) ( not ( = ?auto_170224 ?auto_170225 ) ) ( not ( = ?auto_170224 ?auto_170230 ) ) ( not ( = ?auto_170228 ?auto_170225 ) ) ( not ( = ?auto_170228 ?auto_170230 ) ) ( not ( = ?auto_170225 ?auto_170230 ) ) ( ON ?auto_170225 ?auto_170228 ) ( not ( = ?auto_170232 ?auto_170226 ) ) ( not ( = ?auto_170232 ?auto_170231 ) ) ( not ( = ?auto_170232 ?auto_170229 ) ) ( not ( = ?auto_170232 ?auto_170230 ) ) ( not ( = ?auto_170226 ?auto_170231 ) ) ( not ( = ?auto_170226 ?auto_170229 ) ) ( not ( = ?auto_170226 ?auto_170230 ) ) ( not ( = ?auto_170231 ?auto_170229 ) ) ( not ( = ?auto_170231 ?auto_170230 ) ) ( not ( = ?auto_170229 ?auto_170230 ) ) ( not ( = ?auto_170224 ?auto_170229 ) ) ( not ( = ?auto_170224 ?auto_170232 ) ) ( not ( = ?auto_170224 ?auto_170226 ) ) ( not ( = ?auto_170224 ?auto_170231 ) ) ( not ( = ?auto_170228 ?auto_170229 ) ) ( not ( = ?auto_170228 ?auto_170232 ) ) ( not ( = ?auto_170228 ?auto_170226 ) ) ( not ( = ?auto_170228 ?auto_170231 ) ) ( not ( = ?auto_170225 ?auto_170229 ) ) ( not ( = ?auto_170225 ?auto_170232 ) ) ( not ( = ?auto_170225 ?auto_170226 ) ) ( not ( = ?auto_170225 ?auto_170231 ) ) ( ON ?auto_170230 ?auto_170225 ) ( ON ?auto_170232 ?auto_170227 ) ( not ( = ?auto_170224 ?auto_170227 ) ) ( not ( = ?auto_170228 ?auto_170227 ) ) ( not ( = ?auto_170225 ?auto_170227 ) ) ( not ( = ?auto_170230 ?auto_170227 ) ) ( not ( = ?auto_170232 ?auto_170227 ) ) ( not ( = ?auto_170226 ?auto_170227 ) ) ( not ( = ?auto_170231 ?auto_170227 ) ) ( not ( = ?auto_170229 ?auto_170227 ) ) ( ON ?auto_170226 ?auto_170232 ) ( ON-TABLE ?auto_170227 ) ( ON ?auto_170231 ?auto_170226 ) ( CLEAR ?auto_170230 ) ( ON ?auto_170229 ?auto_170231 ) ( CLEAR ?auto_170229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170227 ?auto_170232 ?auto_170226 ?auto_170231 )
      ( MAKE-1PILE ?auto_170224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170233 - BLOCK
    )
    :vars
    (
      ?auto_170241 - BLOCK
      ?auto_170240 - BLOCK
      ?auto_170234 - BLOCK
      ?auto_170239 - BLOCK
      ?auto_170236 - BLOCK
      ?auto_170238 - BLOCK
      ?auto_170235 - BLOCK
      ?auto_170237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170241 ?auto_170233 ) ( ON-TABLE ?auto_170233 ) ( not ( = ?auto_170233 ?auto_170241 ) ) ( not ( = ?auto_170233 ?auto_170240 ) ) ( not ( = ?auto_170233 ?auto_170234 ) ) ( not ( = ?auto_170241 ?auto_170240 ) ) ( not ( = ?auto_170241 ?auto_170234 ) ) ( not ( = ?auto_170240 ?auto_170234 ) ) ( ON ?auto_170240 ?auto_170241 ) ( not ( = ?auto_170239 ?auto_170236 ) ) ( not ( = ?auto_170239 ?auto_170238 ) ) ( not ( = ?auto_170239 ?auto_170235 ) ) ( not ( = ?auto_170239 ?auto_170234 ) ) ( not ( = ?auto_170236 ?auto_170238 ) ) ( not ( = ?auto_170236 ?auto_170235 ) ) ( not ( = ?auto_170236 ?auto_170234 ) ) ( not ( = ?auto_170238 ?auto_170235 ) ) ( not ( = ?auto_170238 ?auto_170234 ) ) ( not ( = ?auto_170235 ?auto_170234 ) ) ( not ( = ?auto_170233 ?auto_170235 ) ) ( not ( = ?auto_170233 ?auto_170239 ) ) ( not ( = ?auto_170233 ?auto_170236 ) ) ( not ( = ?auto_170233 ?auto_170238 ) ) ( not ( = ?auto_170241 ?auto_170235 ) ) ( not ( = ?auto_170241 ?auto_170239 ) ) ( not ( = ?auto_170241 ?auto_170236 ) ) ( not ( = ?auto_170241 ?auto_170238 ) ) ( not ( = ?auto_170240 ?auto_170235 ) ) ( not ( = ?auto_170240 ?auto_170239 ) ) ( not ( = ?auto_170240 ?auto_170236 ) ) ( not ( = ?auto_170240 ?auto_170238 ) ) ( ON ?auto_170239 ?auto_170237 ) ( not ( = ?auto_170233 ?auto_170237 ) ) ( not ( = ?auto_170241 ?auto_170237 ) ) ( not ( = ?auto_170240 ?auto_170237 ) ) ( not ( = ?auto_170234 ?auto_170237 ) ) ( not ( = ?auto_170239 ?auto_170237 ) ) ( not ( = ?auto_170236 ?auto_170237 ) ) ( not ( = ?auto_170238 ?auto_170237 ) ) ( not ( = ?auto_170235 ?auto_170237 ) ) ( ON ?auto_170236 ?auto_170239 ) ( ON-TABLE ?auto_170237 ) ( ON ?auto_170238 ?auto_170236 ) ( ON ?auto_170235 ?auto_170238 ) ( CLEAR ?auto_170235 ) ( HOLDING ?auto_170234 ) ( CLEAR ?auto_170240 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170233 ?auto_170241 ?auto_170240 ?auto_170234 )
      ( MAKE-1PILE ?auto_170233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170242 - BLOCK
    )
    :vars
    (
      ?auto_170249 - BLOCK
      ?auto_170247 - BLOCK
      ?auto_170250 - BLOCK
      ?auto_170246 - BLOCK
      ?auto_170245 - BLOCK
      ?auto_170248 - BLOCK
      ?auto_170243 - BLOCK
      ?auto_170244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170249 ?auto_170242 ) ( ON-TABLE ?auto_170242 ) ( not ( = ?auto_170242 ?auto_170249 ) ) ( not ( = ?auto_170242 ?auto_170247 ) ) ( not ( = ?auto_170242 ?auto_170250 ) ) ( not ( = ?auto_170249 ?auto_170247 ) ) ( not ( = ?auto_170249 ?auto_170250 ) ) ( not ( = ?auto_170247 ?auto_170250 ) ) ( ON ?auto_170247 ?auto_170249 ) ( not ( = ?auto_170246 ?auto_170245 ) ) ( not ( = ?auto_170246 ?auto_170248 ) ) ( not ( = ?auto_170246 ?auto_170243 ) ) ( not ( = ?auto_170246 ?auto_170250 ) ) ( not ( = ?auto_170245 ?auto_170248 ) ) ( not ( = ?auto_170245 ?auto_170243 ) ) ( not ( = ?auto_170245 ?auto_170250 ) ) ( not ( = ?auto_170248 ?auto_170243 ) ) ( not ( = ?auto_170248 ?auto_170250 ) ) ( not ( = ?auto_170243 ?auto_170250 ) ) ( not ( = ?auto_170242 ?auto_170243 ) ) ( not ( = ?auto_170242 ?auto_170246 ) ) ( not ( = ?auto_170242 ?auto_170245 ) ) ( not ( = ?auto_170242 ?auto_170248 ) ) ( not ( = ?auto_170249 ?auto_170243 ) ) ( not ( = ?auto_170249 ?auto_170246 ) ) ( not ( = ?auto_170249 ?auto_170245 ) ) ( not ( = ?auto_170249 ?auto_170248 ) ) ( not ( = ?auto_170247 ?auto_170243 ) ) ( not ( = ?auto_170247 ?auto_170246 ) ) ( not ( = ?auto_170247 ?auto_170245 ) ) ( not ( = ?auto_170247 ?auto_170248 ) ) ( ON ?auto_170246 ?auto_170244 ) ( not ( = ?auto_170242 ?auto_170244 ) ) ( not ( = ?auto_170249 ?auto_170244 ) ) ( not ( = ?auto_170247 ?auto_170244 ) ) ( not ( = ?auto_170250 ?auto_170244 ) ) ( not ( = ?auto_170246 ?auto_170244 ) ) ( not ( = ?auto_170245 ?auto_170244 ) ) ( not ( = ?auto_170248 ?auto_170244 ) ) ( not ( = ?auto_170243 ?auto_170244 ) ) ( ON ?auto_170245 ?auto_170246 ) ( ON-TABLE ?auto_170244 ) ( ON ?auto_170248 ?auto_170245 ) ( ON ?auto_170243 ?auto_170248 ) ( CLEAR ?auto_170247 ) ( ON ?auto_170250 ?auto_170243 ) ( CLEAR ?auto_170250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170244 ?auto_170246 ?auto_170245 ?auto_170248 ?auto_170243 )
      ( MAKE-1PILE ?auto_170242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170251 - BLOCK
    )
    :vars
    (
      ?auto_170256 - BLOCK
      ?auto_170257 - BLOCK
      ?auto_170252 - BLOCK
      ?auto_170254 - BLOCK
      ?auto_170255 - BLOCK
      ?auto_170258 - BLOCK
      ?auto_170253 - BLOCK
      ?auto_170259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170256 ?auto_170251 ) ( ON-TABLE ?auto_170251 ) ( not ( = ?auto_170251 ?auto_170256 ) ) ( not ( = ?auto_170251 ?auto_170257 ) ) ( not ( = ?auto_170251 ?auto_170252 ) ) ( not ( = ?auto_170256 ?auto_170257 ) ) ( not ( = ?auto_170256 ?auto_170252 ) ) ( not ( = ?auto_170257 ?auto_170252 ) ) ( not ( = ?auto_170254 ?auto_170255 ) ) ( not ( = ?auto_170254 ?auto_170258 ) ) ( not ( = ?auto_170254 ?auto_170253 ) ) ( not ( = ?auto_170254 ?auto_170252 ) ) ( not ( = ?auto_170255 ?auto_170258 ) ) ( not ( = ?auto_170255 ?auto_170253 ) ) ( not ( = ?auto_170255 ?auto_170252 ) ) ( not ( = ?auto_170258 ?auto_170253 ) ) ( not ( = ?auto_170258 ?auto_170252 ) ) ( not ( = ?auto_170253 ?auto_170252 ) ) ( not ( = ?auto_170251 ?auto_170253 ) ) ( not ( = ?auto_170251 ?auto_170254 ) ) ( not ( = ?auto_170251 ?auto_170255 ) ) ( not ( = ?auto_170251 ?auto_170258 ) ) ( not ( = ?auto_170256 ?auto_170253 ) ) ( not ( = ?auto_170256 ?auto_170254 ) ) ( not ( = ?auto_170256 ?auto_170255 ) ) ( not ( = ?auto_170256 ?auto_170258 ) ) ( not ( = ?auto_170257 ?auto_170253 ) ) ( not ( = ?auto_170257 ?auto_170254 ) ) ( not ( = ?auto_170257 ?auto_170255 ) ) ( not ( = ?auto_170257 ?auto_170258 ) ) ( ON ?auto_170254 ?auto_170259 ) ( not ( = ?auto_170251 ?auto_170259 ) ) ( not ( = ?auto_170256 ?auto_170259 ) ) ( not ( = ?auto_170257 ?auto_170259 ) ) ( not ( = ?auto_170252 ?auto_170259 ) ) ( not ( = ?auto_170254 ?auto_170259 ) ) ( not ( = ?auto_170255 ?auto_170259 ) ) ( not ( = ?auto_170258 ?auto_170259 ) ) ( not ( = ?auto_170253 ?auto_170259 ) ) ( ON ?auto_170255 ?auto_170254 ) ( ON-TABLE ?auto_170259 ) ( ON ?auto_170258 ?auto_170255 ) ( ON ?auto_170253 ?auto_170258 ) ( ON ?auto_170252 ?auto_170253 ) ( CLEAR ?auto_170252 ) ( HOLDING ?auto_170257 ) ( CLEAR ?auto_170256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170251 ?auto_170256 ?auto_170257 )
      ( MAKE-1PILE ?auto_170251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170260 - BLOCK
    )
    :vars
    (
      ?auto_170268 - BLOCK
      ?auto_170261 - BLOCK
      ?auto_170263 - BLOCK
      ?auto_170264 - BLOCK
      ?auto_170267 - BLOCK
      ?auto_170265 - BLOCK
      ?auto_170266 - BLOCK
      ?auto_170262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170268 ?auto_170260 ) ( ON-TABLE ?auto_170260 ) ( not ( = ?auto_170260 ?auto_170268 ) ) ( not ( = ?auto_170260 ?auto_170261 ) ) ( not ( = ?auto_170260 ?auto_170263 ) ) ( not ( = ?auto_170268 ?auto_170261 ) ) ( not ( = ?auto_170268 ?auto_170263 ) ) ( not ( = ?auto_170261 ?auto_170263 ) ) ( not ( = ?auto_170264 ?auto_170267 ) ) ( not ( = ?auto_170264 ?auto_170265 ) ) ( not ( = ?auto_170264 ?auto_170266 ) ) ( not ( = ?auto_170264 ?auto_170263 ) ) ( not ( = ?auto_170267 ?auto_170265 ) ) ( not ( = ?auto_170267 ?auto_170266 ) ) ( not ( = ?auto_170267 ?auto_170263 ) ) ( not ( = ?auto_170265 ?auto_170266 ) ) ( not ( = ?auto_170265 ?auto_170263 ) ) ( not ( = ?auto_170266 ?auto_170263 ) ) ( not ( = ?auto_170260 ?auto_170266 ) ) ( not ( = ?auto_170260 ?auto_170264 ) ) ( not ( = ?auto_170260 ?auto_170267 ) ) ( not ( = ?auto_170260 ?auto_170265 ) ) ( not ( = ?auto_170268 ?auto_170266 ) ) ( not ( = ?auto_170268 ?auto_170264 ) ) ( not ( = ?auto_170268 ?auto_170267 ) ) ( not ( = ?auto_170268 ?auto_170265 ) ) ( not ( = ?auto_170261 ?auto_170266 ) ) ( not ( = ?auto_170261 ?auto_170264 ) ) ( not ( = ?auto_170261 ?auto_170267 ) ) ( not ( = ?auto_170261 ?auto_170265 ) ) ( ON ?auto_170264 ?auto_170262 ) ( not ( = ?auto_170260 ?auto_170262 ) ) ( not ( = ?auto_170268 ?auto_170262 ) ) ( not ( = ?auto_170261 ?auto_170262 ) ) ( not ( = ?auto_170263 ?auto_170262 ) ) ( not ( = ?auto_170264 ?auto_170262 ) ) ( not ( = ?auto_170267 ?auto_170262 ) ) ( not ( = ?auto_170265 ?auto_170262 ) ) ( not ( = ?auto_170266 ?auto_170262 ) ) ( ON ?auto_170267 ?auto_170264 ) ( ON-TABLE ?auto_170262 ) ( ON ?auto_170265 ?auto_170267 ) ( ON ?auto_170266 ?auto_170265 ) ( ON ?auto_170263 ?auto_170266 ) ( CLEAR ?auto_170268 ) ( ON ?auto_170261 ?auto_170263 ) ( CLEAR ?auto_170261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170262 ?auto_170264 ?auto_170267 ?auto_170265 ?auto_170266 ?auto_170263 )
      ( MAKE-1PILE ?auto_170260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170287 - BLOCK
    )
    :vars
    (
      ?auto_170288 - BLOCK
      ?auto_170292 - BLOCK
      ?auto_170293 - BLOCK
      ?auto_170295 - BLOCK
      ?auto_170294 - BLOCK
      ?auto_170291 - BLOCK
      ?auto_170289 - BLOCK
      ?auto_170290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170287 ?auto_170288 ) ) ( not ( = ?auto_170287 ?auto_170292 ) ) ( not ( = ?auto_170287 ?auto_170293 ) ) ( not ( = ?auto_170288 ?auto_170292 ) ) ( not ( = ?auto_170288 ?auto_170293 ) ) ( not ( = ?auto_170292 ?auto_170293 ) ) ( not ( = ?auto_170295 ?auto_170294 ) ) ( not ( = ?auto_170295 ?auto_170291 ) ) ( not ( = ?auto_170295 ?auto_170289 ) ) ( not ( = ?auto_170295 ?auto_170293 ) ) ( not ( = ?auto_170294 ?auto_170291 ) ) ( not ( = ?auto_170294 ?auto_170289 ) ) ( not ( = ?auto_170294 ?auto_170293 ) ) ( not ( = ?auto_170291 ?auto_170289 ) ) ( not ( = ?auto_170291 ?auto_170293 ) ) ( not ( = ?auto_170289 ?auto_170293 ) ) ( not ( = ?auto_170287 ?auto_170289 ) ) ( not ( = ?auto_170287 ?auto_170295 ) ) ( not ( = ?auto_170287 ?auto_170294 ) ) ( not ( = ?auto_170287 ?auto_170291 ) ) ( not ( = ?auto_170288 ?auto_170289 ) ) ( not ( = ?auto_170288 ?auto_170295 ) ) ( not ( = ?auto_170288 ?auto_170294 ) ) ( not ( = ?auto_170288 ?auto_170291 ) ) ( not ( = ?auto_170292 ?auto_170289 ) ) ( not ( = ?auto_170292 ?auto_170295 ) ) ( not ( = ?auto_170292 ?auto_170294 ) ) ( not ( = ?auto_170292 ?auto_170291 ) ) ( ON ?auto_170295 ?auto_170290 ) ( not ( = ?auto_170287 ?auto_170290 ) ) ( not ( = ?auto_170288 ?auto_170290 ) ) ( not ( = ?auto_170292 ?auto_170290 ) ) ( not ( = ?auto_170293 ?auto_170290 ) ) ( not ( = ?auto_170295 ?auto_170290 ) ) ( not ( = ?auto_170294 ?auto_170290 ) ) ( not ( = ?auto_170291 ?auto_170290 ) ) ( not ( = ?auto_170289 ?auto_170290 ) ) ( ON ?auto_170294 ?auto_170295 ) ( ON-TABLE ?auto_170290 ) ( ON ?auto_170291 ?auto_170294 ) ( ON ?auto_170289 ?auto_170291 ) ( ON ?auto_170293 ?auto_170289 ) ( ON ?auto_170292 ?auto_170293 ) ( ON ?auto_170288 ?auto_170292 ) ( CLEAR ?auto_170288 ) ( HOLDING ?auto_170287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170287 ?auto_170288 )
      ( MAKE-1PILE ?auto_170287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170296 - BLOCK
    )
    :vars
    (
      ?auto_170304 - BLOCK
      ?auto_170302 - BLOCK
      ?auto_170300 - BLOCK
      ?auto_170301 - BLOCK
      ?auto_170299 - BLOCK
      ?auto_170298 - BLOCK
      ?auto_170303 - BLOCK
      ?auto_170297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170296 ?auto_170304 ) ) ( not ( = ?auto_170296 ?auto_170302 ) ) ( not ( = ?auto_170296 ?auto_170300 ) ) ( not ( = ?auto_170304 ?auto_170302 ) ) ( not ( = ?auto_170304 ?auto_170300 ) ) ( not ( = ?auto_170302 ?auto_170300 ) ) ( not ( = ?auto_170301 ?auto_170299 ) ) ( not ( = ?auto_170301 ?auto_170298 ) ) ( not ( = ?auto_170301 ?auto_170303 ) ) ( not ( = ?auto_170301 ?auto_170300 ) ) ( not ( = ?auto_170299 ?auto_170298 ) ) ( not ( = ?auto_170299 ?auto_170303 ) ) ( not ( = ?auto_170299 ?auto_170300 ) ) ( not ( = ?auto_170298 ?auto_170303 ) ) ( not ( = ?auto_170298 ?auto_170300 ) ) ( not ( = ?auto_170303 ?auto_170300 ) ) ( not ( = ?auto_170296 ?auto_170303 ) ) ( not ( = ?auto_170296 ?auto_170301 ) ) ( not ( = ?auto_170296 ?auto_170299 ) ) ( not ( = ?auto_170296 ?auto_170298 ) ) ( not ( = ?auto_170304 ?auto_170303 ) ) ( not ( = ?auto_170304 ?auto_170301 ) ) ( not ( = ?auto_170304 ?auto_170299 ) ) ( not ( = ?auto_170304 ?auto_170298 ) ) ( not ( = ?auto_170302 ?auto_170303 ) ) ( not ( = ?auto_170302 ?auto_170301 ) ) ( not ( = ?auto_170302 ?auto_170299 ) ) ( not ( = ?auto_170302 ?auto_170298 ) ) ( ON ?auto_170301 ?auto_170297 ) ( not ( = ?auto_170296 ?auto_170297 ) ) ( not ( = ?auto_170304 ?auto_170297 ) ) ( not ( = ?auto_170302 ?auto_170297 ) ) ( not ( = ?auto_170300 ?auto_170297 ) ) ( not ( = ?auto_170301 ?auto_170297 ) ) ( not ( = ?auto_170299 ?auto_170297 ) ) ( not ( = ?auto_170298 ?auto_170297 ) ) ( not ( = ?auto_170303 ?auto_170297 ) ) ( ON ?auto_170299 ?auto_170301 ) ( ON-TABLE ?auto_170297 ) ( ON ?auto_170298 ?auto_170299 ) ( ON ?auto_170303 ?auto_170298 ) ( ON ?auto_170300 ?auto_170303 ) ( ON ?auto_170302 ?auto_170300 ) ( ON ?auto_170304 ?auto_170302 ) ( ON ?auto_170296 ?auto_170304 ) ( CLEAR ?auto_170296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170297 ?auto_170301 ?auto_170299 ?auto_170298 ?auto_170303 ?auto_170300 ?auto_170302 ?auto_170304 )
      ( MAKE-1PILE ?auto_170296 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170312 - BLOCK
      ?auto_170313 - BLOCK
      ?auto_170314 - BLOCK
      ?auto_170315 - BLOCK
      ?auto_170316 - BLOCK
      ?auto_170317 - BLOCK
      ?auto_170318 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170318 ) ( CLEAR ?auto_170317 ) ( ON-TABLE ?auto_170312 ) ( ON ?auto_170313 ?auto_170312 ) ( ON ?auto_170314 ?auto_170313 ) ( ON ?auto_170315 ?auto_170314 ) ( ON ?auto_170316 ?auto_170315 ) ( ON ?auto_170317 ?auto_170316 ) ( not ( = ?auto_170312 ?auto_170313 ) ) ( not ( = ?auto_170312 ?auto_170314 ) ) ( not ( = ?auto_170312 ?auto_170315 ) ) ( not ( = ?auto_170312 ?auto_170316 ) ) ( not ( = ?auto_170312 ?auto_170317 ) ) ( not ( = ?auto_170312 ?auto_170318 ) ) ( not ( = ?auto_170313 ?auto_170314 ) ) ( not ( = ?auto_170313 ?auto_170315 ) ) ( not ( = ?auto_170313 ?auto_170316 ) ) ( not ( = ?auto_170313 ?auto_170317 ) ) ( not ( = ?auto_170313 ?auto_170318 ) ) ( not ( = ?auto_170314 ?auto_170315 ) ) ( not ( = ?auto_170314 ?auto_170316 ) ) ( not ( = ?auto_170314 ?auto_170317 ) ) ( not ( = ?auto_170314 ?auto_170318 ) ) ( not ( = ?auto_170315 ?auto_170316 ) ) ( not ( = ?auto_170315 ?auto_170317 ) ) ( not ( = ?auto_170315 ?auto_170318 ) ) ( not ( = ?auto_170316 ?auto_170317 ) ) ( not ( = ?auto_170316 ?auto_170318 ) ) ( not ( = ?auto_170317 ?auto_170318 ) ) )
    :subtasks
    ( ( !STACK ?auto_170318 ?auto_170317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170319 - BLOCK
      ?auto_170320 - BLOCK
      ?auto_170321 - BLOCK
      ?auto_170322 - BLOCK
      ?auto_170323 - BLOCK
      ?auto_170324 - BLOCK
      ?auto_170325 - BLOCK
    )
    :vars
    (
      ?auto_170326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170324 ) ( ON-TABLE ?auto_170319 ) ( ON ?auto_170320 ?auto_170319 ) ( ON ?auto_170321 ?auto_170320 ) ( ON ?auto_170322 ?auto_170321 ) ( ON ?auto_170323 ?auto_170322 ) ( ON ?auto_170324 ?auto_170323 ) ( not ( = ?auto_170319 ?auto_170320 ) ) ( not ( = ?auto_170319 ?auto_170321 ) ) ( not ( = ?auto_170319 ?auto_170322 ) ) ( not ( = ?auto_170319 ?auto_170323 ) ) ( not ( = ?auto_170319 ?auto_170324 ) ) ( not ( = ?auto_170319 ?auto_170325 ) ) ( not ( = ?auto_170320 ?auto_170321 ) ) ( not ( = ?auto_170320 ?auto_170322 ) ) ( not ( = ?auto_170320 ?auto_170323 ) ) ( not ( = ?auto_170320 ?auto_170324 ) ) ( not ( = ?auto_170320 ?auto_170325 ) ) ( not ( = ?auto_170321 ?auto_170322 ) ) ( not ( = ?auto_170321 ?auto_170323 ) ) ( not ( = ?auto_170321 ?auto_170324 ) ) ( not ( = ?auto_170321 ?auto_170325 ) ) ( not ( = ?auto_170322 ?auto_170323 ) ) ( not ( = ?auto_170322 ?auto_170324 ) ) ( not ( = ?auto_170322 ?auto_170325 ) ) ( not ( = ?auto_170323 ?auto_170324 ) ) ( not ( = ?auto_170323 ?auto_170325 ) ) ( not ( = ?auto_170324 ?auto_170325 ) ) ( ON ?auto_170325 ?auto_170326 ) ( CLEAR ?auto_170325 ) ( HAND-EMPTY ) ( not ( = ?auto_170319 ?auto_170326 ) ) ( not ( = ?auto_170320 ?auto_170326 ) ) ( not ( = ?auto_170321 ?auto_170326 ) ) ( not ( = ?auto_170322 ?auto_170326 ) ) ( not ( = ?auto_170323 ?auto_170326 ) ) ( not ( = ?auto_170324 ?auto_170326 ) ) ( not ( = ?auto_170325 ?auto_170326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170325 ?auto_170326 )
      ( MAKE-7PILE ?auto_170319 ?auto_170320 ?auto_170321 ?auto_170322 ?auto_170323 ?auto_170324 ?auto_170325 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170327 - BLOCK
      ?auto_170328 - BLOCK
      ?auto_170329 - BLOCK
      ?auto_170330 - BLOCK
      ?auto_170331 - BLOCK
      ?auto_170332 - BLOCK
      ?auto_170333 - BLOCK
    )
    :vars
    (
      ?auto_170334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170327 ) ( ON ?auto_170328 ?auto_170327 ) ( ON ?auto_170329 ?auto_170328 ) ( ON ?auto_170330 ?auto_170329 ) ( ON ?auto_170331 ?auto_170330 ) ( not ( = ?auto_170327 ?auto_170328 ) ) ( not ( = ?auto_170327 ?auto_170329 ) ) ( not ( = ?auto_170327 ?auto_170330 ) ) ( not ( = ?auto_170327 ?auto_170331 ) ) ( not ( = ?auto_170327 ?auto_170332 ) ) ( not ( = ?auto_170327 ?auto_170333 ) ) ( not ( = ?auto_170328 ?auto_170329 ) ) ( not ( = ?auto_170328 ?auto_170330 ) ) ( not ( = ?auto_170328 ?auto_170331 ) ) ( not ( = ?auto_170328 ?auto_170332 ) ) ( not ( = ?auto_170328 ?auto_170333 ) ) ( not ( = ?auto_170329 ?auto_170330 ) ) ( not ( = ?auto_170329 ?auto_170331 ) ) ( not ( = ?auto_170329 ?auto_170332 ) ) ( not ( = ?auto_170329 ?auto_170333 ) ) ( not ( = ?auto_170330 ?auto_170331 ) ) ( not ( = ?auto_170330 ?auto_170332 ) ) ( not ( = ?auto_170330 ?auto_170333 ) ) ( not ( = ?auto_170331 ?auto_170332 ) ) ( not ( = ?auto_170331 ?auto_170333 ) ) ( not ( = ?auto_170332 ?auto_170333 ) ) ( ON ?auto_170333 ?auto_170334 ) ( CLEAR ?auto_170333 ) ( not ( = ?auto_170327 ?auto_170334 ) ) ( not ( = ?auto_170328 ?auto_170334 ) ) ( not ( = ?auto_170329 ?auto_170334 ) ) ( not ( = ?auto_170330 ?auto_170334 ) ) ( not ( = ?auto_170331 ?auto_170334 ) ) ( not ( = ?auto_170332 ?auto_170334 ) ) ( not ( = ?auto_170333 ?auto_170334 ) ) ( HOLDING ?auto_170332 ) ( CLEAR ?auto_170331 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170327 ?auto_170328 ?auto_170329 ?auto_170330 ?auto_170331 ?auto_170332 )
      ( MAKE-7PILE ?auto_170327 ?auto_170328 ?auto_170329 ?auto_170330 ?auto_170331 ?auto_170332 ?auto_170333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170335 - BLOCK
      ?auto_170336 - BLOCK
      ?auto_170337 - BLOCK
      ?auto_170338 - BLOCK
      ?auto_170339 - BLOCK
      ?auto_170340 - BLOCK
      ?auto_170341 - BLOCK
    )
    :vars
    (
      ?auto_170342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170335 ) ( ON ?auto_170336 ?auto_170335 ) ( ON ?auto_170337 ?auto_170336 ) ( ON ?auto_170338 ?auto_170337 ) ( ON ?auto_170339 ?auto_170338 ) ( not ( = ?auto_170335 ?auto_170336 ) ) ( not ( = ?auto_170335 ?auto_170337 ) ) ( not ( = ?auto_170335 ?auto_170338 ) ) ( not ( = ?auto_170335 ?auto_170339 ) ) ( not ( = ?auto_170335 ?auto_170340 ) ) ( not ( = ?auto_170335 ?auto_170341 ) ) ( not ( = ?auto_170336 ?auto_170337 ) ) ( not ( = ?auto_170336 ?auto_170338 ) ) ( not ( = ?auto_170336 ?auto_170339 ) ) ( not ( = ?auto_170336 ?auto_170340 ) ) ( not ( = ?auto_170336 ?auto_170341 ) ) ( not ( = ?auto_170337 ?auto_170338 ) ) ( not ( = ?auto_170337 ?auto_170339 ) ) ( not ( = ?auto_170337 ?auto_170340 ) ) ( not ( = ?auto_170337 ?auto_170341 ) ) ( not ( = ?auto_170338 ?auto_170339 ) ) ( not ( = ?auto_170338 ?auto_170340 ) ) ( not ( = ?auto_170338 ?auto_170341 ) ) ( not ( = ?auto_170339 ?auto_170340 ) ) ( not ( = ?auto_170339 ?auto_170341 ) ) ( not ( = ?auto_170340 ?auto_170341 ) ) ( ON ?auto_170341 ?auto_170342 ) ( not ( = ?auto_170335 ?auto_170342 ) ) ( not ( = ?auto_170336 ?auto_170342 ) ) ( not ( = ?auto_170337 ?auto_170342 ) ) ( not ( = ?auto_170338 ?auto_170342 ) ) ( not ( = ?auto_170339 ?auto_170342 ) ) ( not ( = ?auto_170340 ?auto_170342 ) ) ( not ( = ?auto_170341 ?auto_170342 ) ) ( CLEAR ?auto_170339 ) ( ON ?auto_170340 ?auto_170341 ) ( CLEAR ?auto_170340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170342 ?auto_170341 )
      ( MAKE-7PILE ?auto_170335 ?auto_170336 ?auto_170337 ?auto_170338 ?auto_170339 ?auto_170340 ?auto_170341 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170343 - BLOCK
      ?auto_170344 - BLOCK
      ?auto_170345 - BLOCK
      ?auto_170346 - BLOCK
      ?auto_170347 - BLOCK
      ?auto_170348 - BLOCK
      ?auto_170349 - BLOCK
    )
    :vars
    (
      ?auto_170350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170343 ) ( ON ?auto_170344 ?auto_170343 ) ( ON ?auto_170345 ?auto_170344 ) ( ON ?auto_170346 ?auto_170345 ) ( not ( = ?auto_170343 ?auto_170344 ) ) ( not ( = ?auto_170343 ?auto_170345 ) ) ( not ( = ?auto_170343 ?auto_170346 ) ) ( not ( = ?auto_170343 ?auto_170347 ) ) ( not ( = ?auto_170343 ?auto_170348 ) ) ( not ( = ?auto_170343 ?auto_170349 ) ) ( not ( = ?auto_170344 ?auto_170345 ) ) ( not ( = ?auto_170344 ?auto_170346 ) ) ( not ( = ?auto_170344 ?auto_170347 ) ) ( not ( = ?auto_170344 ?auto_170348 ) ) ( not ( = ?auto_170344 ?auto_170349 ) ) ( not ( = ?auto_170345 ?auto_170346 ) ) ( not ( = ?auto_170345 ?auto_170347 ) ) ( not ( = ?auto_170345 ?auto_170348 ) ) ( not ( = ?auto_170345 ?auto_170349 ) ) ( not ( = ?auto_170346 ?auto_170347 ) ) ( not ( = ?auto_170346 ?auto_170348 ) ) ( not ( = ?auto_170346 ?auto_170349 ) ) ( not ( = ?auto_170347 ?auto_170348 ) ) ( not ( = ?auto_170347 ?auto_170349 ) ) ( not ( = ?auto_170348 ?auto_170349 ) ) ( ON ?auto_170349 ?auto_170350 ) ( not ( = ?auto_170343 ?auto_170350 ) ) ( not ( = ?auto_170344 ?auto_170350 ) ) ( not ( = ?auto_170345 ?auto_170350 ) ) ( not ( = ?auto_170346 ?auto_170350 ) ) ( not ( = ?auto_170347 ?auto_170350 ) ) ( not ( = ?auto_170348 ?auto_170350 ) ) ( not ( = ?auto_170349 ?auto_170350 ) ) ( ON ?auto_170348 ?auto_170349 ) ( CLEAR ?auto_170348 ) ( ON-TABLE ?auto_170350 ) ( HOLDING ?auto_170347 ) ( CLEAR ?auto_170346 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170343 ?auto_170344 ?auto_170345 ?auto_170346 ?auto_170347 )
      ( MAKE-7PILE ?auto_170343 ?auto_170344 ?auto_170345 ?auto_170346 ?auto_170347 ?auto_170348 ?auto_170349 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170351 - BLOCK
      ?auto_170352 - BLOCK
      ?auto_170353 - BLOCK
      ?auto_170354 - BLOCK
      ?auto_170355 - BLOCK
      ?auto_170356 - BLOCK
      ?auto_170357 - BLOCK
    )
    :vars
    (
      ?auto_170358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170351 ) ( ON ?auto_170352 ?auto_170351 ) ( ON ?auto_170353 ?auto_170352 ) ( ON ?auto_170354 ?auto_170353 ) ( not ( = ?auto_170351 ?auto_170352 ) ) ( not ( = ?auto_170351 ?auto_170353 ) ) ( not ( = ?auto_170351 ?auto_170354 ) ) ( not ( = ?auto_170351 ?auto_170355 ) ) ( not ( = ?auto_170351 ?auto_170356 ) ) ( not ( = ?auto_170351 ?auto_170357 ) ) ( not ( = ?auto_170352 ?auto_170353 ) ) ( not ( = ?auto_170352 ?auto_170354 ) ) ( not ( = ?auto_170352 ?auto_170355 ) ) ( not ( = ?auto_170352 ?auto_170356 ) ) ( not ( = ?auto_170352 ?auto_170357 ) ) ( not ( = ?auto_170353 ?auto_170354 ) ) ( not ( = ?auto_170353 ?auto_170355 ) ) ( not ( = ?auto_170353 ?auto_170356 ) ) ( not ( = ?auto_170353 ?auto_170357 ) ) ( not ( = ?auto_170354 ?auto_170355 ) ) ( not ( = ?auto_170354 ?auto_170356 ) ) ( not ( = ?auto_170354 ?auto_170357 ) ) ( not ( = ?auto_170355 ?auto_170356 ) ) ( not ( = ?auto_170355 ?auto_170357 ) ) ( not ( = ?auto_170356 ?auto_170357 ) ) ( ON ?auto_170357 ?auto_170358 ) ( not ( = ?auto_170351 ?auto_170358 ) ) ( not ( = ?auto_170352 ?auto_170358 ) ) ( not ( = ?auto_170353 ?auto_170358 ) ) ( not ( = ?auto_170354 ?auto_170358 ) ) ( not ( = ?auto_170355 ?auto_170358 ) ) ( not ( = ?auto_170356 ?auto_170358 ) ) ( not ( = ?auto_170357 ?auto_170358 ) ) ( ON ?auto_170356 ?auto_170357 ) ( ON-TABLE ?auto_170358 ) ( CLEAR ?auto_170354 ) ( ON ?auto_170355 ?auto_170356 ) ( CLEAR ?auto_170355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170358 ?auto_170357 ?auto_170356 )
      ( MAKE-7PILE ?auto_170351 ?auto_170352 ?auto_170353 ?auto_170354 ?auto_170355 ?auto_170356 ?auto_170357 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170359 - BLOCK
      ?auto_170360 - BLOCK
      ?auto_170361 - BLOCK
      ?auto_170362 - BLOCK
      ?auto_170363 - BLOCK
      ?auto_170364 - BLOCK
      ?auto_170365 - BLOCK
    )
    :vars
    (
      ?auto_170366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170359 ) ( ON ?auto_170360 ?auto_170359 ) ( ON ?auto_170361 ?auto_170360 ) ( not ( = ?auto_170359 ?auto_170360 ) ) ( not ( = ?auto_170359 ?auto_170361 ) ) ( not ( = ?auto_170359 ?auto_170362 ) ) ( not ( = ?auto_170359 ?auto_170363 ) ) ( not ( = ?auto_170359 ?auto_170364 ) ) ( not ( = ?auto_170359 ?auto_170365 ) ) ( not ( = ?auto_170360 ?auto_170361 ) ) ( not ( = ?auto_170360 ?auto_170362 ) ) ( not ( = ?auto_170360 ?auto_170363 ) ) ( not ( = ?auto_170360 ?auto_170364 ) ) ( not ( = ?auto_170360 ?auto_170365 ) ) ( not ( = ?auto_170361 ?auto_170362 ) ) ( not ( = ?auto_170361 ?auto_170363 ) ) ( not ( = ?auto_170361 ?auto_170364 ) ) ( not ( = ?auto_170361 ?auto_170365 ) ) ( not ( = ?auto_170362 ?auto_170363 ) ) ( not ( = ?auto_170362 ?auto_170364 ) ) ( not ( = ?auto_170362 ?auto_170365 ) ) ( not ( = ?auto_170363 ?auto_170364 ) ) ( not ( = ?auto_170363 ?auto_170365 ) ) ( not ( = ?auto_170364 ?auto_170365 ) ) ( ON ?auto_170365 ?auto_170366 ) ( not ( = ?auto_170359 ?auto_170366 ) ) ( not ( = ?auto_170360 ?auto_170366 ) ) ( not ( = ?auto_170361 ?auto_170366 ) ) ( not ( = ?auto_170362 ?auto_170366 ) ) ( not ( = ?auto_170363 ?auto_170366 ) ) ( not ( = ?auto_170364 ?auto_170366 ) ) ( not ( = ?auto_170365 ?auto_170366 ) ) ( ON ?auto_170364 ?auto_170365 ) ( ON-TABLE ?auto_170366 ) ( ON ?auto_170363 ?auto_170364 ) ( CLEAR ?auto_170363 ) ( HOLDING ?auto_170362 ) ( CLEAR ?auto_170361 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170359 ?auto_170360 ?auto_170361 ?auto_170362 )
      ( MAKE-7PILE ?auto_170359 ?auto_170360 ?auto_170361 ?auto_170362 ?auto_170363 ?auto_170364 ?auto_170365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170367 - BLOCK
      ?auto_170368 - BLOCK
      ?auto_170369 - BLOCK
      ?auto_170370 - BLOCK
      ?auto_170371 - BLOCK
      ?auto_170372 - BLOCK
      ?auto_170373 - BLOCK
    )
    :vars
    (
      ?auto_170374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170367 ) ( ON ?auto_170368 ?auto_170367 ) ( ON ?auto_170369 ?auto_170368 ) ( not ( = ?auto_170367 ?auto_170368 ) ) ( not ( = ?auto_170367 ?auto_170369 ) ) ( not ( = ?auto_170367 ?auto_170370 ) ) ( not ( = ?auto_170367 ?auto_170371 ) ) ( not ( = ?auto_170367 ?auto_170372 ) ) ( not ( = ?auto_170367 ?auto_170373 ) ) ( not ( = ?auto_170368 ?auto_170369 ) ) ( not ( = ?auto_170368 ?auto_170370 ) ) ( not ( = ?auto_170368 ?auto_170371 ) ) ( not ( = ?auto_170368 ?auto_170372 ) ) ( not ( = ?auto_170368 ?auto_170373 ) ) ( not ( = ?auto_170369 ?auto_170370 ) ) ( not ( = ?auto_170369 ?auto_170371 ) ) ( not ( = ?auto_170369 ?auto_170372 ) ) ( not ( = ?auto_170369 ?auto_170373 ) ) ( not ( = ?auto_170370 ?auto_170371 ) ) ( not ( = ?auto_170370 ?auto_170372 ) ) ( not ( = ?auto_170370 ?auto_170373 ) ) ( not ( = ?auto_170371 ?auto_170372 ) ) ( not ( = ?auto_170371 ?auto_170373 ) ) ( not ( = ?auto_170372 ?auto_170373 ) ) ( ON ?auto_170373 ?auto_170374 ) ( not ( = ?auto_170367 ?auto_170374 ) ) ( not ( = ?auto_170368 ?auto_170374 ) ) ( not ( = ?auto_170369 ?auto_170374 ) ) ( not ( = ?auto_170370 ?auto_170374 ) ) ( not ( = ?auto_170371 ?auto_170374 ) ) ( not ( = ?auto_170372 ?auto_170374 ) ) ( not ( = ?auto_170373 ?auto_170374 ) ) ( ON ?auto_170372 ?auto_170373 ) ( ON-TABLE ?auto_170374 ) ( ON ?auto_170371 ?auto_170372 ) ( CLEAR ?auto_170369 ) ( ON ?auto_170370 ?auto_170371 ) ( CLEAR ?auto_170370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170374 ?auto_170373 ?auto_170372 ?auto_170371 )
      ( MAKE-7PILE ?auto_170367 ?auto_170368 ?auto_170369 ?auto_170370 ?auto_170371 ?auto_170372 ?auto_170373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170375 - BLOCK
      ?auto_170376 - BLOCK
      ?auto_170377 - BLOCK
      ?auto_170378 - BLOCK
      ?auto_170379 - BLOCK
      ?auto_170380 - BLOCK
      ?auto_170381 - BLOCK
    )
    :vars
    (
      ?auto_170382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170375 ) ( ON ?auto_170376 ?auto_170375 ) ( not ( = ?auto_170375 ?auto_170376 ) ) ( not ( = ?auto_170375 ?auto_170377 ) ) ( not ( = ?auto_170375 ?auto_170378 ) ) ( not ( = ?auto_170375 ?auto_170379 ) ) ( not ( = ?auto_170375 ?auto_170380 ) ) ( not ( = ?auto_170375 ?auto_170381 ) ) ( not ( = ?auto_170376 ?auto_170377 ) ) ( not ( = ?auto_170376 ?auto_170378 ) ) ( not ( = ?auto_170376 ?auto_170379 ) ) ( not ( = ?auto_170376 ?auto_170380 ) ) ( not ( = ?auto_170376 ?auto_170381 ) ) ( not ( = ?auto_170377 ?auto_170378 ) ) ( not ( = ?auto_170377 ?auto_170379 ) ) ( not ( = ?auto_170377 ?auto_170380 ) ) ( not ( = ?auto_170377 ?auto_170381 ) ) ( not ( = ?auto_170378 ?auto_170379 ) ) ( not ( = ?auto_170378 ?auto_170380 ) ) ( not ( = ?auto_170378 ?auto_170381 ) ) ( not ( = ?auto_170379 ?auto_170380 ) ) ( not ( = ?auto_170379 ?auto_170381 ) ) ( not ( = ?auto_170380 ?auto_170381 ) ) ( ON ?auto_170381 ?auto_170382 ) ( not ( = ?auto_170375 ?auto_170382 ) ) ( not ( = ?auto_170376 ?auto_170382 ) ) ( not ( = ?auto_170377 ?auto_170382 ) ) ( not ( = ?auto_170378 ?auto_170382 ) ) ( not ( = ?auto_170379 ?auto_170382 ) ) ( not ( = ?auto_170380 ?auto_170382 ) ) ( not ( = ?auto_170381 ?auto_170382 ) ) ( ON ?auto_170380 ?auto_170381 ) ( ON-TABLE ?auto_170382 ) ( ON ?auto_170379 ?auto_170380 ) ( ON ?auto_170378 ?auto_170379 ) ( CLEAR ?auto_170378 ) ( HOLDING ?auto_170377 ) ( CLEAR ?auto_170376 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170375 ?auto_170376 ?auto_170377 )
      ( MAKE-7PILE ?auto_170375 ?auto_170376 ?auto_170377 ?auto_170378 ?auto_170379 ?auto_170380 ?auto_170381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170383 - BLOCK
      ?auto_170384 - BLOCK
      ?auto_170385 - BLOCK
      ?auto_170386 - BLOCK
      ?auto_170387 - BLOCK
      ?auto_170388 - BLOCK
      ?auto_170389 - BLOCK
    )
    :vars
    (
      ?auto_170390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170383 ) ( ON ?auto_170384 ?auto_170383 ) ( not ( = ?auto_170383 ?auto_170384 ) ) ( not ( = ?auto_170383 ?auto_170385 ) ) ( not ( = ?auto_170383 ?auto_170386 ) ) ( not ( = ?auto_170383 ?auto_170387 ) ) ( not ( = ?auto_170383 ?auto_170388 ) ) ( not ( = ?auto_170383 ?auto_170389 ) ) ( not ( = ?auto_170384 ?auto_170385 ) ) ( not ( = ?auto_170384 ?auto_170386 ) ) ( not ( = ?auto_170384 ?auto_170387 ) ) ( not ( = ?auto_170384 ?auto_170388 ) ) ( not ( = ?auto_170384 ?auto_170389 ) ) ( not ( = ?auto_170385 ?auto_170386 ) ) ( not ( = ?auto_170385 ?auto_170387 ) ) ( not ( = ?auto_170385 ?auto_170388 ) ) ( not ( = ?auto_170385 ?auto_170389 ) ) ( not ( = ?auto_170386 ?auto_170387 ) ) ( not ( = ?auto_170386 ?auto_170388 ) ) ( not ( = ?auto_170386 ?auto_170389 ) ) ( not ( = ?auto_170387 ?auto_170388 ) ) ( not ( = ?auto_170387 ?auto_170389 ) ) ( not ( = ?auto_170388 ?auto_170389 ) ) ( ON ?auto_170389 ?auto_170390 ) ( not ( = ?auto_170383 ?auto_170390 ) ) ( not ( = ?auto_170384 ?auto_170390 ) ) ( not ( = ?auto_170385 ?auto_170390 ) ) ( not ( = ?auto_170386 ?auto_170390 ) ) ( not ( = ?auto_170387 ?auto_170390 ) ) ( not ( = ?auto_170388 ?auto_170390 ) ) ( not ( = ?auto_170389 ?auto_170390 ) ) ( ON ?auto_170388 ?auto_170389 ) ( ON-TABLE ?auto_170390 ) ( ON ?auto_170387 ?auto_170388 ) ( ON ?auto_170386 ?auto_170387 ) ( CLEAR ?auto_170384 ) ( ON ?auto_170385 ?auto_170386 ) ( CLEAR ?auto_170385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170390 ?auto_170389 ?auto_170388 ?auto_170387 ?auto_170386 )
      ( MAKE-7PILE ?auto_170383 ?auto_170384 ?auto_170385 ?auto_170386 ?auto_170387 ?auto_170388 ?auto_170389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170391 - BLOCK
      ?auto_170392 - BLOCK
      ?auto_170393 - BLOCK
      ?auto_170394 - BLOCK
      ?auto_170395 - BLOCK
      ?auto_170396 - BLOCK
      ?auto_170397 - BLOCK
    )
    :vars
    (
      ?auto_170398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170391 ) ( not ( = ?auto_170391 ?auto_170392 ) ) ( not ( = ?auto_170391 ?auto_170393 ) ) ( not ( = ?auto_170391 ?auto_170394 ) ) ( not ( = ?auto_170391 ?auto_170395 ) ) ( not ( = ?auto_170391 ?auto_170396 ) ) ( not ( = ?auto_170391 ?auto_170397 ) ) ( not ( = ?auto_170392 ?auto_170393 ) ) ( not ( = ?auto_170392 ?auto_170394 ) ) ( not ( = ?auto_170392 ?auto_170395 ) ) ( not ( = ?auto_170392 ?auto_170396 ) ) ( not ( = ?auto_170392 ?auto_170397 ) ) ( not ( = ?auto_170393 ?auto_170394 ) ) ( not ( = ?auto_170393 ?auto_170395 ) ) ( not ( = ?auto_170393 ?auto_170396 ) ) ( not ( = ?auto_170393 ?auto_170397 ) ) ( not ( = ?auto_170394 ?auto_170395 ) ) ( not ( = ?auto_170394 ?auto_170396 ) ) ( not ( = ?auto_170394 ?auto_170397 ) ) ( not ( = ?auto_170395 ?auto_170396 ) ) ( not ( = ?auto_170395 ?auto_170397 ) ) ( not ( = ?auto_170396 ?auto_170397 ) ) ( ON ?auto_170397 ?auto_170398 ) ( not ( = ?auto_170391 ?auto_170398 ) ) ( not ( = ?auto_170392 ?auto_170398 ) ) ( not ( = ?auto_170393 ?auto_170398 ) ) ( not ( = ?auto_170394 ?auto_170398 ) ) ( not ( = ?auto_170395 ?auto_170398 ) ) ( not ( = ?auto_170396 ?auto_170398 ) ) ( not ( = ?auto_170397 ?auto_170398 ) ) ( ON ?auto_170396 ?auto_170397 ) ( ON-TABLE ?auto_170398 ) ( ON ?auto_170395 ?auto_170396 ) ( ON ?auto_170394 ?auto_170395 ) ( ON ?auto_170393 ?auto_170394 ) ( CLEAR ?auto_170393 ) ( HOLDING ?auto_170392 ) ( CLEAR ?auto_170391 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170391 ?auto_170392 )
      ( MAKE-7PILE ?auto_170391 ?auto_170392 ?auto_170393 ?auto_170394 ?auto_170395 ?auto_170396 ?auto_170397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170399 - BLOCK
      ?auto_170400 - BLOCK
      ?auto_170401 - BLOCK
      ?auto_170402 - BLOCK
      ?auto_170403 - BLOCK
      ?auto_170404 - BLOCK
      ?auto_170405 - BLOCK
    )
    :vars
    (
      ?auto_170406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170399 ) ( not ( = ?auto_170399 ?auto_170400 ) ) ( not ( = ?auto_170399 ?auto_170401 ) ) ( not ( = ?auto_170399 ?auto_170402 ) ) ( not ( = ?auto_170399 ?auto_170403 ) ) ( not ( = ?auto_170399 ?auto_170404 ) ) ( not ( = ?auto_170399 ?auto_170405 ) ) ( not ( = ?auto_170400 ?auto_170401 ) ) ( not ( = ?auto_170400 ?auto_170402 ) ) ( not ( = ?auto_170400 ?auto_170403 ) ) ( not ( = ?auto_170400 ?auto_170404 ) ) ( not ( = ?auto_170400 ?auto_170405 ) ) ( not ( = ?auto_170401 ?auto_170402 ) ) ( not ( = ?auto_170401 ?auto_170403 ) ) ( not ( = ?auto_170401 ?auto_170404 ) ) ( not ( = ?auto_170401 ?auto_170405 ) ) ( not ( = ?auto_170402 ?auto_170403 ) ) ( not ( = ?auto_170402 ?auto_170404 ) ) ( not ( = ?auto_170402 ?auto_170405 ) ) ( not ( = ?auto_170403 ?auto_170404 ) ) ( not ( = ?auto_170403 ?auto_170405 ) ) ( not ( = ?auto_170404 ?auto_170405 ) ) ( ON ?auto_170405 ?auto_170406 ) ( not ( = ?auto_170399 ?auto_170406 ) ) ( not ( = ?auto_170400 ?auto_170406 ) ) ( not ( = ?auto_170401 ?auto_170406 ) ) ( not ( = ?auto_170402 ?auto_170406 ) ) ( not ( = ?auto_170403 ?auto_170406 ) ) ( not ( = ?auto_170404 ?auto_170406 ) ) ( not ( = ?auto_170405 ?auto_170406 ) ) ( ON ?auto_170404 ?auto_170405 ) ( ON-TABLE ?auto_170406 ) ( ON ?auto_170403 ?auto_170404 ) ( ON ?auto_170402 ?auto_170403 ) ( ON ?auto_170401 ?auto_170402 ) ( CLEAR ?auto_170399 ) ( ON ?auto_170400 ?auto_170401 ) ( CLEAR ?auto_170400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170406 ?auto_170405 ?auto_170404 ?auto_170403 ?auto_170402 ?auto_170401 )
      ( MAKE-7PILE ?auto_170399 ?auto_170400 ?auto_170401 ?auto_170402 ?auto_170403 ?auto_170404 ?auto_170405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170407 - BLOCK
      ?auto_170408 - BLOCK
      ?auto_170409 - BLOCK
      ?auto_170410 - BLOCK
      ?auto_170411 - BLOCK
      ?auto_170412 - BLOCK
      ?auto_170413 - BLOCK
    )
    :vars
    (
      ?auto_170414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170407 ?auto_170408 ) ) ( not ( = ?auto_170407 ?auto_170409 ) ) ( not ( = ?auto_170407 ?auto_170410 ) ) ( not ( = ?auto_170407 ?auto_170411 ) ) ( not ( = ?auto_170407 ?auto_170412 ) ) ( not ( = ?auto_170407 ?auto_170413 ) ) ( not ( = ?auto_170408 ?auto_170409 ) ) ( not ( = ?auto_170408 ?auto_170410 ) ) ( not ( = ?auto_170408 ?auto_170411 ) ) ( not ( = ?auto_170408 ?auto_170412 ) ) ( not ( = ?auto_170408 ?auto_170413 ) ) ( not ( = ?auto_170409 ?auto_170410 ) ) ( not ( = ?auto_170409 ?auto_170411 ) ) ( not ( = ?auto_170409 ?auto_170412 ) ) ( not ( = ?auto_170409 ?auto_170413 ) ) ( not ( = ?auto_170410 ?auto_170411 ) ) ( not ( = ?auto_170410 ?auto_170412 ) ) ( not ( = ?auto_170410 ?auto_170413 ) ) ( not ( = ?auto_170411 ?auto_170412 ) ) ( not ( = ?auto_170411 ?auto_170413 ) ) ( not ( = ?auto_170412 ?auto_170413 ) ) ( ON ?auto_170413 ?auto_170414 ) ( not ( = ?auto_170407 ?auto_170414 ) ) ( not ( = ?auto_170408 ?auto_170414 ) ) ( not ( = ?auto_170409 ?auto_170414 ) ) ( not ( = ?auto_170410 ?auto_170414 ) ) ( not ( = ?auto_170411 ?auto_170414 ) ) ( not ( = ?auto_170412 ?auto_170414 ) ) ( not ( = ?auto_170413 ?auto_170414 ) ) ( ON ?auto_170412 ?auto_170413 ) ( ON-TABLE ?auto_170414 ) ( ON ?auto_170411 ?auto_170412 ) ( ON ?auto_170410 ?auto_170411 ) ( ON ?auto_170409 ?auto_170410 ) ( ON ?auto_170408 ?auto_170409 ) ( CLEAR ?auto_170408 ) ( HOLDING ?auto_170407 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170407 )
      ( MAKE-7PILE ?auto_170407 ?auto_170408 ?auto_170409 ?auto_170410 ?auto_170411 ?auto_170412 ?auto_170413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170415 - BLOCK
      ?auto_170416 - BLOCK
      ?auto_170417 - BLOCK
      ?auto_170418 - BLOCK
      ?auto_170419 - BLOCK
      ?auto_170420 - BLOCK
      ?auto_170421 - BLOCK
    )
    :vars
    (
      ?auto_170422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170415 ?auto_170416 ) ) ( not ( = ?auto_170415 ?auto_170417 ) ) ( not ( = ?auto_170415 ?auto_170418 ) ) ( not ( = ?auto_170415 ?auto_170419 ) ) ( not ( = ?auto_170415 ?auto_170420 ) ) ( not ( = ?auto_170415 ?auto_170421 ) ) ( not ( = ?auto_170416 ?auto_170417 ) ) ( not ( = ?auto_170416 ?auto_170418 ) ) ( not ( = ?auto_170416 ?auto_170419 ) ) ( not ( = ?auto_170416 ?auto_170420 ) ) ( not ( = ?auto_170416 ?auto_170421 ) ) ( not ( = ?auto_170417 ?auto_170418 ) ) ( not ( = ?auto_170417 ?auto_170419 ) ) ( not ( = ?auto_170417 ?auto_170420 ) ) ( not ( = ?auto_170417 ?auto_170421 ) ) ( not ( = ?auto_170418 ?auto_170419 ) ) ( not ( = ?auto_170418 ?auto_170420 ) ) ( not ( = ?auto_170418 ?auto_170421 ) ) ( not ( = ?auto_170419 ?auto_170420 ) ) ( not ( = ?auto_170419 ?auto_170421 ) ) ( not ( = ?auto_170420 ?auto_170421 ) ) ( ON ?auto_170421 ?auto_170422 ) ( not ( = ?auto_170415 ?auto_170422 ) ) ( not ( = ?auto_170416 ?auto_170422 ) ) ( not ( = ?auto_170417 ?auto_170422 ) ) ( not ( = ?auto_170418 ?auto_170422 ) ) ( not ( = ?auto_170419 ?auto_170422 ) ) ( not ( = ?auto_170420 ?auto_170422 ) ) ( not ( = ?auto_170421 ?auto_170422 ) ) ( ON ?auto_170420 ?auto_170421 ) ( ON-TABLE ?auto_170422 ) ( ON ?auto_170419 ?auto_170420 ) ( ON ?auto_170418 ?auto_170419 ) ( ON ?auto_170417 ?auto_170418 ) ( ON ?auto_170416 ?auto_170417 ) ( ON ?auto_170415 ?auto_170416 ) ( CLEAR ?auto_170415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170422 ?auto_170421 ?auto_170420 ?auto_170419 ?auto_170418 ?auto_170417 ?auto_170416 )
      ( MAKE-7PILE ?auto_170415 ?auto_170416 ?auto_170417 ?auto_170418 ?auto_170419 ?auto_170420 ?auto_170421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170423 - BLOCK
      ?auto_170424 - BLOCK
      ?auto_170425 - BLOCK
      ?auto_170426 - BLOCK
      ?auto_170427 - BLOCK
      ?auto_170428 - BLOCK
      ?auto_170429 - BLOCK
    )
    :vars
    (
      ?auto_170430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170423 ?auto_170424 ) ) ( not ( = ?auto_170423 ?auto_170425 ) ) ( not ( = ?auto_170423 ?auto_170426 ) ) ( not ( = ?auto_170423 ?auto_170427 ) ) ( not ( = ?auto_170423 ?auto_170428 ) ) ( not ( = ?auto_170423 ?auto_170429 ) ) ( not ( = ?auto_170424 ?auto_170425 ) ) ( not ( = ?auto_170424 ?auto_170426 ) ) ( not ( = ?auto_170424 ?auto_170427 ) ) ( not ( = ?auto_170424 ?auto_170428 ) ) ( not ( = ?auto_170424 ?auto_170429 ) ) ( not ( = ?auto_170425 ?auto_170426 ) ) ( not ( = ?auto_170425 ?auto_170427 ) ) ( not ( = ?auto_170425 ?auto_170428 ) ) ( not ( = ?auto_170425 ?auto_170429 ) ) ( not ( = ?auto_170426 ?auto_170427 ) ) ( not ( = ?auto_170426 ?auto_170428 ) ) ( not ( = ?auto_170426 ?auto_170429 ) ) ( not ( = ?auto_170427 ?auto_170428 ) ) ( not ( = ?auto_170427 ?auto_170429 ) ) ( not ( = ?auto_170428 ?auto_170429 ) ) ( ON ?auto_170429 ?auto_170430 ) ( not ( = ?auto_170423 ?auto_170430 ) ) ( not ( = ?auto_170424 ?auto_170430 ) ) ( not ( = ?auto_170425 ?auto_170430 ) ) ( not ( = ?auto_170426 ?auto_170430 ) ) ( not ( = ?auto_170427 ?auto_170430 ) ) ( not ( = ?auto_170428 ?auto_170430 ) ) ( not ( = ?auto_170429 ?auto_170430 ) ) ( ON ?auto_170428 ?auto_170429 ) ( ON-TABLE ?auto_170430 ) ( ON ?auto_170427 ?auto_170428 ) ( ON ?auto_170426 ?auto_170427 ) ( ON ?auto_170425 ?auto_170426 ) ( ON ?auto_170424 ?auto_170425 ) ( HOLDING ?auto_170423 ) ( CLEAR ?auto_170424 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170430 ?auto_170429 ?auto_170428 ?auto_170427 ?auto_170426 ?auto_170425 ?auto_170424 ?auto_170423 )
      ( MAKE-7PILE ?auto_170423 ?auto_170424 ?auto_170425 ?auto_170426 ?auto_170427 ?auto_170428 ?auto_170429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170431 - BLOCK
      ?auto_170432 - BLOCK
      ?auto_170433 - BLOCK
      ?auto_170434 - BLOCK
      ?auto_170435 - BLOCK
      ?auto_170436 - BLOCK
      ?auto_170437 - BLOCK
    )
    :vars
    (
      ?auto_170438 - BLOCK
      ?auto_170439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170431 ?auto_170432 ) ) ( not ( = ?auto_170431 ?auto_170433 ) ) ( not ( = ?auto_170431 ?auto_170434 ) ) ( not ( = ?auto_170431 ?auto_170435 ) ) ( not ( = ?auto_170431 ?auto_170436 ) ) ( not ( = ?auto_170431 ?auto_170437 ) ) ( not ( = ?auto_170432 ?auto_170433 ) ) ( not ( = ?auto_170432 ?auto_170434 ) ) ( not ( = ?auto_170432 ?auto_170435 ) ) ( not ( = ?auto_170432 ?auto_170436 ) ) ( not ( = ?auto_170432 ?auto_170437 ) ) ( not ( = ?auto_170433 ?auto_170434 ) ) ( not ( = ?auto_170433 ?auto_170435 ) ) ( not ( = ?auto_170433 ?auto_170436 ) ) ( not ( = ?auto_170433 ?auto_170437 ) ) ( not ( = ?auto_170434 ?auto_170435 ) ) ( not ( = ?auto_170434 ?auto_170436 ) ) ( not ( = ?auto_170434 ?auto_170437 ) ) ( not ( = ?auto_170435 ?auto_170436 ) ) ( not ( = ?auto_170435 ?auto_170437 ) ) ( not ( = ?auto_170436 ?auto_170437 ) ) ( ON ?auto_170437 ?auto_170438 ) ( not ( = ?auto_170431 ?auto_170438 ) ) ( not ( = ?auto_170432 ?auto_170438 ) ) ( not ( = ?auto_170433 ?auto_170438 ) ) ( not ( = ?auto_170434 ?auto_170438 ) ) ( not ( = ?auto_170435 ?auto_170438 ) ) ( not ( = ?auto_170436 ?auto_170438 ) ) ( not ( = ?auto_170437 ?auto_170438 ) ) ( ON ?auto_170436 ?auto_170437 ) ( ON-TABLE ?auto_170438 ) ( ON ?auto_170435 ?auto_170436 ) ( ON ?auto_170434 ?auto_170435 ) ( ON ?auto_170433 ?auto_170434 ) ( ON ?auto_170432 ?auto_170433 ) ( CLEAR ?auto_170432 ) ( ON ?auto_170431 ?auto_170439 ) ( CLEAR ?auto_170431 ) ( HAND-EMPTY ) ( not ( = ?auto_170431 ?auto_170439 ) ) ( not ( = ?auto_170432 ?auto_170439 ) ) ( not ( = ?auto_170433 ?auto_170439 ) ) ( not ( = ?auto_170434 ?auto_170439 ) ) ( not ( = ?auto_170435 ?auto_170439 ) ) ( not ( = ?auto_170436 ?auto_170439 ) ) ( not ( = ?auto_170437 ?auto_170439 ) ) ( not ( = ?auto_170438 ?auto_170439 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170431 ?auto_170439 )
      ( MAKE-7PILE ?auto_170431 ?auto_170432 ?auto_170433 ?auto_170434 ?auto_170435 ?auto_170436 ?auto_170437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170440 - BLOCK
      ?auto_170441 - BLOCK
      ?auto_170442 - BLOCK
      ?auto_170443 - BLOCK
      ?auto_170444 - BLOCK
      ?auto_170445 - BLOCK
      ?auto_170446 - BLOCK
    )
    :vars
    (
      ?auto_170448 - BLOCK
      ?auto_170447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170440 ?auto_170441 ) ) ( not ( = ?auto_170440 ?auto_170442 ) ) ( not ( = ?auto_170440 ?auto_170443 ) ) ( not ( = ?auto_170440 ?auto_170444 ) ) ( not ( = ?auto_170440 ?auto_170445 ) ) ( not ( = ?auto_170440 ?auto_170446 ) ) ( not ( = ?auto_170441 ?auto_170442 ) ) ( not ( = ?auto_170441 ?auto_170443 ) ) ( not ( = ?auto_170441 ?auto_170444 ) ) ( not ( = ?auto_170441 ?auto_170445 ) ) ( not ( = ?auto_170441 ?auto_170446 ) ) ( not ( = ?auto_170442 ?auto_170443 ) ) ( not ( = ?auto_170442 ?auto_170444 ) ) ( not ( = ?auto_170442 ?auto_170445 ) ) ( not ( = ?auto_170442 ?auto_170446 ) ) ( not ( = ?auto_170443 ?auto_170444 ) ) ( not ( = ?auto_170443 ?auto_170445 ) ) ( not ( = ?auto_170443 ?auto_170446 ) ) ( not ( = ?auto_170444 ?auto_170445 ) ) ( not ( = ?auto_170444 ?auto_170446 ) ) ( not ( = ?auto_170445 ?auto_170446 ) ) ( ON ?auto_170446 ?auto_170448 ) ( not ( = ?auto_170440 ?auto_170448 ) ) ( not ( = ?auto_170441 ?auto_170448 ) ) ( not ( = ?auto_170442 ?auto_170448 ) ) ( not ( = ?auto_170443 ?auto_170448 ) ) ( not ( = ?auto_170444 ?auto_170448 ) ) ( not ( = ?auto_170445 ?auto_170448 ) ) ( not ( = ?auto_170446 ?auto_170448 ) ) ( ON ?auto_170445 ?auto_170446 ) ( ON-TABLE ?auto_170448 ) ( ON ?auto_170444 ?auto_170445 ) ( ON ?auto_170443 ?auto_170444 ) ( ON ?auto_170442 ?auto_170443 ) ( ON ?auto_170440 ?auto_170447 ) ( CLEAR ?auto_170440 ) ( not ( = ?auto_170440 ?auto_170447 ) ) ( not ( = ?auto_170441 ?auto_170447 ) ) ( not ( = ?auto_170442 ?auto_170447 ) ) ( not ( = ?auto_170443 ?auto_170447 ) ) ( not ( = ?auto_170444 ?auto_170447 ) ) ( not ( = ?auto_170445 ?auto_170447 ) ) ( not ( = ?auto_170446 ?auto_170447 ) ) ( not ( = ?auto_170448 ?auto_170447 ) ) ( HOLDING ?auto_170441 ) ( CLEAR ?auto_170442 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170448 ?auto_170446 ?auto_170445 ?auto_170444 ?auto_170443 ?auto_170442 ?auto_170441 )
      ( MAKE-7PILE ?auto_170440 ?auto_170441 ?auto_170442 ?auto_170443 ?auto_170444 ?auto_170445 ?auto_170446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170449 - BLOCK
      ?auto_170450 - BLOCK
      ?auto_170451 - BLOCK
      ?auto_170452 - BLOCK
      ?auto_170453 - BLOCK
      ?auto_170454 - BLOCK
      ?auto_170455 - BLOCK
    )
    :vars
    (
      ?auto_170456 - BLOCK
      ?auto_170457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170449 ?auto_170450 ) ) ( not ( = ?auto_170449 ?auto_170451 ) ) ( not ( = ?auto_170449 ?auto_170452 ) ) ( not ( = ?auto_170449 ?auto_170453 ) ) ( not ( = ?auto_170449 ?auto_170454 ) ) ( not ( = ?auto_170449 ?auto_170455 ) ) ( not ( = ?auto_170450 ?auto_170451 ) ) ( not ( = ?auto_170450 ?auto_170452 ) ) ( not ( = ?auto_170450 ?auto_170453 ) ) ( not ( = ?auto_170450 ?auto_170454 ) ) ( not ( = ?auto_170450 ?auto_170455 ) ) ( not ( = ?auto_170451 ?auto_170452 ) ) ( not ( = ?auto_170451 ?auto_170453 ) ) ( not ( = ?auto_170451 ?auto_170454 ) ) ( not ( = ?auto_170451 ?auto_170455 ) ) ( not ( = ?auto_170452 ?auto_170453 ) ) ( not ( = ?auto_170452 ?auto_170454 ) ) ( not ( = ?auto_170452 ?auto_170455 ) ) ( not ( = ?auto_170453 ?auto_170454 ) ) ( not ( = ?auto_170453 ?auto_170455 ) ) ( not ( = ?auto_170454 ?auto_170455 ) ) ( ON ?auto_170455 ?auto_170456 ) ( not ( = ?auto_170449 ?auto_170456 ) ) ( not ( = ?auto_170450 ?auto_170456 ) ) ( not ( = ?auto_170451 ?auto_170456 ) ) ( not ( = ?auto_170452 ?auto_170456 ) ) ( not ( = ?auto_170453 ?auto_170456 ) ) ( not ( = ?auto_170454 ?auto_170456 ) ) ( not ( = ?auto_170455 ?auto_170456 ) ) ( ON ?auto_170454 ?auto_170455 ) ( ON-TABLE ?auto_170456 ) ( ON ?auto_170453 ?auto_170454 ) ( ON ?auto_170452 ?auto_170453 ) ( ON ?auto_170451 ?auto_170452 ) ( ON ?auto_170449 ?auto_170457 ) ( not ( = ?auto_170449 ?auto_170457 ) ) ( not ( = ?auto_170450 ?auto_170457 ) ) ( not ( = ?auto_170451 ?auto_170457 ) ) ( not ( = ?auto_170452 ?auto_170457 ) ) ( not ( = ?auto_170453 ?auto_170457 ) ) ( not ( = ?auto_170454 ?auto_170457 ) ) ( not ( = ?auto_170455 ?auto_170457 ) ) ( not ( = ?auto_170456 ?auto_170457 ) ) ( CLEAR ?auto_170451 ) ( ON ?auto_170450 ?auto_170449 ) ( CLEAR ?auto_170450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170457 ?auto_170449 )
      ( MAKE-7PILE ?auto_170449 ?auto_170450 ?auto_170451 ?auto_170452 ?auto_170453 ?auto_170454 ?auto_170455 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170458 - BLOCK
      ?auto_170459 - BLOCK
      ?auto_170460 - BLOCK
      ?auto_170461 - BLOCK
      ?auto_170462 - BLOCK
      ?auto_170463 - BLOCK
      ?auto_170464 - BLOCK
    )
    :vars
    (
      ?auto_170466 - BLOCK
      ?auto_170465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170458 ?auto_170459 ) ) ( not ( = ?auto_170458 ?auto_170460 ) ) ( not ( = ?auto_170458 ?auto_170461 ) ) ( not ( = ?auto_170458 ?auto_170462 ) ) ( not ( = ?auto_170458 ?auto_170463 ) ) ( not ( = ?auto_170458 ?auto_170464 ) ) ( not ( = ?auto_170459 ?auto_170460 ) ) ( not ( = ?auto_170459 ?auto_170461 ) ) ( not ( = ?auto_170459 ?auto_170462 ) ) ( not ( = ?auto_170459 ?auto_170463 ) ) ( not ( = ?auto_170459 ?auto_170464 ) ) ( not ( = ?auto_170460 ?auto_170461 ) ) ( not ( = ?auto_170460 ?auto_170462 ) ) ( not ( = ?auto_170460 ?auto_170463 ) ) ( not ( = ?auto_170460 ?auto_170464 ) ) ( not ( = ?auto_170461 ?auto_170462 ) ) ( not ( = ?auto_170461 ?auto_170463 ) ) ( not ( = ?auto_170461 ?auto_170464 ) ) ( not ( = ?auto_170462 ?auto_170463 ) ) ( not ( = ?auto_170462 ?auto_170464 ) ) ( not ( = ?auto_170463 ?auto_170464 ) ) ( ON ?auto_170464 ?auto_170466 ) ( not ( = ?auto_170458 ?auto_170466 ) ) ( not ( = ?auto_170459 ?auto_170466 ) ) ( not ( = ?auto_170460 ?auto_170466 ) ) ( not ( = ?auto_170461 ?auto_170466 ) ) ( not ( = ?auto_170462 ?auto_170466 ) ) ( not ( = ?auto_170463 ?auto_170466 ) ) ( not ( = ?auto_170464 ?auto_170466 ) ) ( ON ?auto_170463 ?auto_170464 ) ( ON-TABLE ?auto_170466 ) ( ON ?auto_170462 ?auto_170463 ) ( ON ?auto_170461 ?auto_170462 ) ( ON ?auto_170458 ?auto_170465 ) ( not ( = ?auto_170458 ?auto_170465 ) ) ( not ( = ?auto_170459 ?auto_170465 ) ) ( not ( = ?auto_170460 ?auto_170465 ) ) ( not ( = ?auto_170461 ?auto_170465 ) ) ( not ( = ?auto_170462 ?auto_170465 ) ) ( not ( = ?auto_170463 ?auto_170465 ) ) ( not ( = ?auto_170464 ?auto_170465 ) ) ( not ( = ?auto_170466 ?auto_170465 ) ) ( ON ?auto_170459 ?auto_170458 ) ( CLEAR ?auto_170459 ) ( ON-TABLE ?auto_170465 ) ( HOLDING ?auto_170460 ) ( CLEAR ?auto_170461 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170466 ?auto_170464 ?auto_170463 ?auto_170462 ?auto_170461 ?auto_170460 )
      ( MAKE-7PILE ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 ?auto_170463 ?auto_170464 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170467 - BLOCK
      ?auto_170468 - BLOCK
      ?auto_170469 - BLOCK
      ?auto_170470 - BLOCK
      ?auto_170471 - BLOCK
      ?auto_170472 - BLOCK
      ?auto_170473 - BLOCK
    )
    :vars
    (
      ?auto_170474 - BLOCK
      ?auto_170475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170467 ?auto_170468 ) ) ( not ( = ?auto_170467 ?auto_170469 ) ) ( not ( = ?auto_170467 ?auto_170470 ) ) ( not ( = ?auto_170467 ?auto_170471 ) ) ( not ( = ?auto_170467 ?auto_170472 ) ) ( not ( = ?auto_170467 ?auto_170473 ) ) ( not ( = ?auto_170468 ?auto_170469 ) ) ( not ( = ?auto_170468 ?auto_170470 ) ) ( not ( = ?auto_170468 ?auto_170471 ) ) ( not ( = ?auto_170468 ?auto_170472 ) ) ( not ( = ?auto_170468 ?auto_170473 ) ) ( not ( = ?auto_170469 ?auto_170470 ) ) ( not ( = ?auto_170469 ?auto_170471 ) ) ( not ( = ?auto_170469 ?auto_170472 ) ) ( not ( = ?auto_170469 ?auto_170473 ) ) ( not ( = ?auto_170470 ?auto_170471 ) ) ( not ( = ?auto_170470 ?auto_170472 ) ) ( not ( = ?auto_170470 ?auto_170473 ) ) ( not ( = ?auto_170471 ?auto_170472 ) ) ( not ( = ?auto_170471 ?auto_170473 ) ) ( not ( = ?auto_170472 ?auto_170473 ) ) ( ON ?auto_170473 ?auto_170474 ) ( not ( = ?auto_170467 ?auto_170474 ) ) ( not ( = ?auto_170468 ?auto_170474 ) ) ( not ( = ?auto_170469 ?auto_170474 ) ) ( not ( = ?auto_170470 ?auto_170474 ) ) ( not ( = ?auto_170471 ?auto_170474 ) ) ( not ( = ?auto_170472 ?auto_170474 ) ) ( not ( = ?auto_170473 ?auto_170474 ) ) ( ON ?auto_170472 ?auto_170473 ) ( ON-TABLE ?auto_170474 ) ( ON ?auto_170471 ?auto_170472 ) ( ON ?auto_170470 ?auto_170471 ) ( ON ?auto_170467 ?auto_170475 ) ( not ( = ?auto_170467 ?auto_170475 ) ) ( not ( = ?auto_170468 ?auto_170475 ) ) ( not ( = ?auto_170469 ?auto_170475 ) ) ( not ( = ?auto_170470 ?auto_170475 ) ) ( not ( = ?auto_170471 ?auto_170475 ) ) ( not ( = ?auto_170472 ?auto_170475 ) ) ( not ( = ?auto_170473 ?auto_170475 ) ) ( not ( = ?auto_170474 ?auto_170475 ) ) ( ON ?auto_170468 ?auto_170467 ) ( ON-TABLE ?auto_170475 ) ( CLEAR ?auto_170470 ) ( ON ?auto_170469 ?auto_170468 ) ( CLEAR ?auto_170469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170475 ?auto_170467 ?auto_170468 )
      ( MAKE-7PILE ?auto_170467 ?auto_170468 ?auto_170469 ?auto_170470 ?auto_170471 ?auto_170472 ?auto_170473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170476 - BLOCK
      ?auto_170477 - BLOCK
      ?auto_170478 - BLOCK
      ?auto_170479 - BLOCK
      ?auto_170480 - BLOCK
      ?auto_170481 - BLOCK
      ?auto_170482 - BLOCK
    )
    :vars
    (
      ?auto_170484 - BLOCK
      ?auto_170483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170476 ?auto_170477 ) ) ( not ( = ?auto_170476 ?auto_170478 ) ) ( not ( = ?auto_170476 ?auto_170479 ) ) ( not ( = ?auto_170476 ?auto_170480 ) ) ( not ( = ?auto_170476 ?auto_170481 ) ) ( not ( = ?auto_170476 ?auto_170482 ) ) ( not ( = ?auto_170477 ?auto_170478 ) ) ( not ( = ?auto_170477 ?auto_170479 ) ) ( not ( = ?auto_170477 ?auto_170480 ) ) ( not ( = ?auto_170477 ?auto_170481 ) ) ( not ( = ?auto_170477 ?auto_170482 ) ) ( not ( = ?auto_170478 ?auto_170479 ) ) ( not ( = ?auto_170478 ?auto_170480 ) ) ( not ( = ?auto_170478 ?auto_170481 ) ) ( not ( = ?auto_170478 ?auto_170482 ) ) ( not ( = ?auto_170479 ?auto_170480 ) ) ( not ( = ?auto_170479 ?auto_170481 ) ) ( not ( = ?auto_170479 ?auto_170482 ) ) ( not ( = ?auto_170480 ?auto_170481 ) ) ( not ( = ?auto_170480 ?auto_170482 ) ) ( not ( = ?auto_170481 ?auto_170482 ) ) ( ON ?auto_170482 ?auto_170484 ) ( not ( = ?auto_170476 ?auto_170484 ) ) ( not ( = ?auto_170477 ?auto_170484 ) ) ( not ( = ?auto_170478 ?auto_170484 ) ) ( not ( = ?auto_170479 ?auto_170484 ) ) ( not ( = ?auto_170480 ?auto_170484 ) ) ( not ( = ?auto_170481 ?auto_170484 ) ) ( not ( = ?auto_170482 ?auto_170484 ) ) ( ON ?auto_170481 ?auto_170482 ) ( ON-TABLE ?auto_170484 ) ( ON ?auto_170480 ?auto_170481 ) ( ON ?auto_170476 ?auto_170483 ) ( not ( = ?auto_170476 ?auto_170483 ) ) ( not ( = ?auto_170477 ?auto_170483 ) ) ( not ( = ?auto_170478 ?auto_170483 ) ) ( not ( = ?auto_170479 ?auto_170483 ) ) ( not ( = ?auto_170480 ?auto_170483 ) ) ( not ( = ?auto_170481 ?auto_170483 ) ) ( not ( = ?auto_170482 ?auto_170483 ) ) ( not ( = ?auto_170484 ?auto_170483 ) ) ( ON ?auto_170477 ?auto_170476 ) ( ON-TABLE ?auto_170483 ) ( ON ?auto_170478 ?auto_170477 ) ( CLEAR ?auto_170478 ) ( HOLDING ?auto_170479 ) ( CLEAR ?auto_170480 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170484 ?auto_170482 ?auto_170481 ?auto_170480 ?auto_170479 )
      ( MAKE-7PILE ?auto_170476 ?auto_170477 ?auto_170478 ?auto_170479 ?auto_170480 ?auto_170481 ?auto_170482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170485 - BLOCK
      ?auto_170486 - BLOCK
      ?auto_170487 - BLOCK
      ?auto_170488 - BLOCK
      ?auto_170489 - BLOCK
      ?auto_170490 - BLOCK
      ?auto_170491 - BLOCK
    )
    :vars
    (
      ?auto_170492 - BLOCK
      ?auto_170493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170485 ?auto_170486 ) ) ( not ( = ?auto_170485 ?auto_170487 ) ) ( not ( = ?auto_170485 ?auto_170488 ) ) ( not ( = ?auto_170485 ?auto_170489 ) ) ( not ( = ?auto_170485 ?auto_170490 ) ) ( not ( = ?auto_170485 ?auto_170491 ) ) ( not ( = ?auto_170486 ?auto_170487 ) ) ( not ( = ?auto_170486 ?auto_170488 ) ) ( not ( = ?auto_170486 ?auto_170489 ) ) ( not ( = ?auto_170486 ?auto_170490 ) ) ( not ( = ?auto_170486 ?auto_170491 ) ) ( not ( = ?auto_170487 ?auto_170488 ) ) ( not ( = ?auto_170487 ?auto_170489 ) ) ( not ( = ?auto_170487 ?auto_170490 ) ) ( not ( = ?auto_170487 ?auto_170491 ) ) ( not ( = ?auto_170488 ?auto_170489 ) ) ( not ( = ?auto_170488 ?auto_170490 ) ) ( not ( = ?auto_170488 ?auto_170491 ) ) ( not ( = ?auto_170489 ?auto_170490 ) ) ( not ( = ?auto_170489 ?auto_170491 ) ) ( not ( = ?auto_170490 ?auto_170491 ) ) ( ON ?auto_170491 ?auto_170492 ) ( not ( = ?auto_170485 ?auto_170492 ) ) ( not ( = ?auto_170486 ?auto_170492 ) ) ( not ( = ?auto_170487 ?auto_170492 ) ) ( not ( = ?auto_170488 ?auto_170492 ) ) ( not ( = ?auto_170489 ?auto_170492 ) ) ( not ( = ?auto_170490 ?auto_170492 ) ) ( not ( = ?auto_170491 ?auto_170492 ) ) ( ON ?auto_170490 ?auto_170491 ) ( ON-TABLE ?auto_170492 ) ( ON ?auto_170489 ?auto_170490 ) ( ON ?auto_170485 ?auto_170493 ) ( not ( = ?auto_170485 ?auto_170493 ) ) ( not ( = ?auto_170486 ?auto_170493 ) ) ( not ( = ?auto_170487 ?auto_170493 ) ) ( not ( = ?auto_170488 ?auto_170493 ) ) ( not ( = ?auto_170489 ?auto_170493 ) ) ( not ( = ?auto_170490 ?auto_170493 ) ) ( not ( = ?auto_170491 ?auto_170493 ) ) ( not ( = ?auto_170492 ?auto_170493 ) ) ( ON ?auto_170486 ?auto_170485 ) ( ON-TABLE ?auto_170493 ) ( ON ?auto_170487 ?auto_170486 ) ( CLEAR ?auto_170489 ) ( ON ?auto_170488 ?auto_170487 ) ( CLEAR ?auto_170488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170493 ?auto_170485 ?auto_170486 ?auto_170487 )
      ( MAKE-7PILE ?auto_170485 ?auto_170486 ?auto_170487 ?auto_170488 ?auto_170489 ?auto_170490 ?auto_170491 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170494 - BLOCK
      ?auto_170495 - BLOCK
      ?auto_170496 - BLOCK
      ?auto_170497 - BLOCK
      ?auto_170498 - BLOCK
      ?auto_170499 - BLOCK
      ?auto_170500 - BLOCK
    )
    :vars
    (
      ?auto_170502 - BLOCK
      ?auto_170501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170494 ?auto_170495 ) ) ( not ( = ?auto_170494 ?auto_170496 ) ) ( not ( = ?auto_170494 ?auto_170497 ) ) ( not ( = ?auto_170494 ?auto_170498 ) ) ( not ( = ?auto_170494 ?auto_170499 ) ) ( not ( = ?auto_170494 ?auto_170500 ) ) ( not ( = ?auto_170495 ?auto_170496 ) ) ( not ( = ?auto_170495 ?auto_170497 ) ) ( not ( = ?auto_170495 ?auto_170498 ) ) ( not ( = ?auto_170495 ?auto_170499 ) ) ( not ( = ?auto_170495 ?auto_170500 ) ) ( not ( = ?auto_170496 ?auto_170497 ) ) ( not ( = ?auto_170496 ?auto_170498 ) ) ( not ( = ?auto_170496 ?auto_170499 ) ) ( not ( = ?auto_170496 ?auto_170500 ) ) ( not ( = ?auto_170497 ?auto_170498 ) ) ( not ( = ?auto_170497 ?auto_170499 ) ) ( not ( = ?auto_170497 ?auto_170500 ) ) ( not ( = ?auto_170498 ?auto_170499 ) ) ( not ( = ?auto_170498 ?auto_170500 ) ) ( not ( = ?auto_170499 ?auto_170500 ) ) ( ON ?auto_170500 ?auto_170502 ) ( not ( = ?auto_170494 ?auto_170502 ) ) ( not ( = ?auto_170495 ?auto_170502 ) ) ( not ( = ?auto_170496 ?auto_170502 ) ) ( not ( = ?auto_170497 ?auto_170502 ) ) ( not ( = ?auto_170498 ?auto_170502 ) ) ( not ( = ?auto_170499 ?auto_170502 ) ) ( not ( = ?auto_170500 ?auto_170502 ) ) ( ON ?auto_170499 ?auto_170500 ) ( ON-TABLE ?auto_170502 ) ( ON ?auto_170494 ?auto_170501 ) ( not ( = ?auto_170494 ?auto_170501 ) ) ( not ( = ?auto_170495 ?auto_170501 ) ) ( not ( = ?auto_170496 ?auto_170501 ) ) ( not ( = ?auto_170497 ?auto_170501 ) ) ( not ( = ?auto_170498 ?auto_170501 ) ) ( not ( = ?auto_170499 ?auto_170501 ) ) ( not ( = ?auto_170500 ?auto_170501 ) ) ( not ( = ?auto_170502 ?auto_170501 ) ) ( ON ?auto_170495 ?auto_170494 ) ( ON-TABLE ?auto_170501 ) ( ON ?auto_170496 ?auto_170495 ) ( ON ?auto_170497 ?auto_170496 ) ( CLEAR ?auto_170497 ) ( HOLDING ?auto_170498 ) ( CLEAR ?auto_170499 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170502 ?auto_170500 ?auto_170499 ?auto_170498 )
      ( MAKE-7PILE ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 ?auto_170500 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170503 - BLOCK
      ?auto_170504 - BLOCK
      ?auto_170505 - BLOCK
      ?auto_170506 - BLOCK
      ?auto_170507 - BLOCK
      ?auto_170508 - BLOCK
      ?auto_170509 - BLOCK
    )
    :vars
    (
      ?auto_170510 - BLOCK
      ?auto_170511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170503 ?auto_170504 ) ) ( not ( = ?auto_170503 ?auto_170505 ) ) ( not ( = ?auto_170503 ?auto_170506 ) ) ( not ( = ?auto_170503 ?auto_170507 ) ) ( not ( = ?auto_170503 ?auto_170508 ) ) ( not ( = ?auto_170503 ?auto_170509 ) ) ( not ( = ?auto_170504 ?auto_170505 ) ) ( not ( = ?auto_170504 ?auto_170506 ) ) ( not ( = ?auto_170504 ?auto_170507 ) ) ( not ( = ?auto_170504 ?auto_170508 ) ) ( not ( = ?auto_170504 ?auto_170509 ) ) ( not ( = ?auto_170505 ?auto_170506 ) ) ( not ( = ?auto_170505 ?auto_170507 ) ) ( not ( = ?auto_170505 ?auto_170508 ) ) ( not ( = ?auto_170505 ?auto_170509 ) ) ( not ( = ?auto_170506 ?auto_170507 ) ) ( not ( = ?auto_170506 ?auto_170508 ) ) ( not ( = ?auto_170506 ?auto_170509 ) ) ( not ( = ?auto_170507 ?auto_170508 ) ) ( not ( = ?auto_170507 ?auto_170509 ) ) ( not ( = ?auto_170508 ?auto_170509 ) ) ( ON ?auto_170509 ?auto_170510 ) ( not ( = ?auto_170503 ?auto_170510 ) ) ( not ( = ?auto_170504 ?auto_170510 ) ) ( not ( = ?auto_170505 ?auto_170510 ) ) ( not ( = ?auto_170506 ?auto_170510 ) ) ( not ( = ?auto_170507 ?auto_170510 ) ) ( not ( = ?auto_170508 ?auto_170510 ) ) ( not ( = ?auto_170509 ?auto_170510 ) ) ( ON ?auto_170508 ?auto_170509 ) ( ON-TABLE ?auto_170510 ) ( ON ?auto_170503 ?auto_170511 ) ( not ( = ?auto_170503 ?auto_170511 ) ) ( not ( = ?auto_170504 ?auto_170511 ) ) ( not ( = ?auto_170505 ?auto_170511 ) ) ( not ( = ?auto_170506 ?auto_170511 ) ) ( not ( = ?auto_170507 ?auto_170511 ) ) ( not ( = ?auto_170508 ?auto_170511 ) ) ( not ( = ?auto_170509 ?auto_170511 ) ) ( not ( = ?auto_170510 ?auto_170511 ) ) ( ON ?auto_170504 ?auto_170503 ) ( ON-TABLE ?auto_170511 ) ( ON ?auto_170505 ?auto_170504 ) ( ON ?auto_170506 ?auto_170505 ) ( CLEAR ?auto_170508 ) ( ON ?auto_170507 ?auto_170506 ) ( CLEAR ?auto_170507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170511 ?auto_170503 ?auto_170504 ?auto_170505 ?auto_170506 )
      ( MAKE-7PILE ?auto_170503 ?auto_170504 ?auto_170505 ?auto_170506 ?auto_170507 ?auto_170508 ?auto_170509 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170512 - BLOCK
      ?auto_170513 - BLOCK
      ?auto_170514 - BLOCK
      ?auto_170515 - BLOCK
      ?auto_170516 - BLOCK
      ?auto_170517 - BLOCK
      ?auto_170518 - BLOCK
    )
    :vars
    (
      ?auto_170519 - BLOCK
      ?auto_170520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170512 ?auto_170513 ) ) ( not ( = ?auto_170512 ?auto_170514 ) ) ( not ( = ?auto_170512 ?auto_170515 ) ) ( not ( = ?auto_170512 ?auto_170516 ) ) ( not ( = ?auto_170512 ?auto_170517 ) ) ( not ( = ?auto_170512 ?auto_170518 ) ) ( not ( = ?auto_170513 ?auto_170514 ) ) ( not ( = ?auto_170513 ?auto_170515 ) ) ( not ( = ?auto_170513 ?auto_170516 ) ) ( not ( = ?auto_170513 ?auto_170517 ) ) ( not ( = ?auto_170513 ?auto_170518 ) ) ( not ( = ?auto_170514 ?auto_170515 ) ) ( not ( = ?auto_170514 ?auto_170516 ) ) ( not ( = ?auto_170514 ?auto_170517 ) ) ( not ( = ?auto_170514 ?auto_170518 ) ) ( not ( = ?auto_170515 ?auto_170516 ) ) ( not ( = ?auto_170515 ?auto_170517 ) ) ( not ( = ?auto_170515 ?auto_170518 ) ) ( not ( = ?auto_170516 ?auto_170517 ) ) ( not ( = ?auto_170516 ?auto_170518 ) ) ( not ( = ?auto_170517 ?auto_170518 ) ) ( ON ?auto_170518 ?auto_170519 ) ( not ( = ?auto_170512 ?auto_170519 ) ) ( not ( = ?auto_170513 ?auto_170519 ) ) ( not ( = ?auto_170514 ?auto_170519 ) ) ( not ( = ?auto_170515 ?auto_170519 ) ) ( not ( = ?auto_170516 ?auto_170519 ) ) ( not ( = ?auto_170517 ?auto_170519 ) ) ( not ( = ?auto_170518 ?auto_170519 ) ) ( ON-TABLE ?auto_170519 ) ( ON ?auto_170512 ?auto_170520 ) ( not ( = ?auto_170512 ?auto_170520 ) ) ( not ( = ?auto_170513 ?auto_170520 ) ) ( not ( = ?auto_170514 ?auto_170520 ) ) ( not ( = ?auto_170515 ?auto_170520 ) ) ( not ( = ?auto_170516 ?auto_170520 ) ) ( not ( = ?auto_170517 ?auto_170520 ) ) ( not ( = ?auto_170518 ?auto_170520 ) ) ( not ( = ?auto_170519 ?auto_170520 ) ) ( ON ?auto_170513 ?auto_170512 ) ( ON-TABLE ?auto_170520 ) ( ON ?auto_170514 ?auto_170513 ) ( ON ?auto_170515 ?auto_170514 ) ( ON ?auto_170516 ?auto_170515 ) ( CLEAR ?auto_170516 ) ( HOLDING ?auto_170517 ) ( CLEAR ?auto_170518 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170519 ?auto_170518 ?auto_170517 )
      ( MAKE-7PILE ?auto_170512 ?auto_170513 ?auto_170514 ?auto_170515 ?auto_170516 ?auto_170517 ?auto_170518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170521 - BLOCK
      ?auto_170522 - BLOCK
      ?auto_170523 - BLOCK
      ?auto_170524 - BLOCK
      ?auto_170525 - BLOCK
      ?auto_170526 - BLOCK
      ?auto_170527 - BLOCK
    )
    :vars
    (
      ?auto_170528 - BLOCK
      ?auto_170529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170521 ?auto_170522 ) ) ( not ( = ?auto_170521 ?auto_170523 ) ) ( not ( = ?auto_170521 ?auto_170524 ) ) ( not ( = ?auto_170521 ?auto_170525 ) ) ( not ( = ?auto_170521 ?auto_170526 ) ) ( not ( = ?auto_170521 ?auto_170527 ) ) ( not ( = ?auto_170522 ?auto_170523 ) ) ( not ( = ?auto_170522 ?auto_170524 ) ) ( not ( = ?auto_170522 ?auto_170525 ) ) ( not ( = ?auto_170522 ?auto_170526 ) ) ( not ( = ?auto_170522 ?auto_170527 ) ) ( not ( = ?auto_170523 ?auto_170524 ) ) ( not ( = ?auto_170523 ?auto_170525 ) ) ( not ( = ?auto_170523 ?auto_170526 ) ) ( not ( = ?auto_170523 ?auto_170527 ) ) ( not ( = ?auto_170524 ?auto_170525 ) ) ( not ( = ?auto_170524 ?auto_170526 ) ) ( not ( = ?auto_170524 ?auto_170527 ) ) ( not ( = ?auto_170525 ?auto_170526 ) ) ( not ( = ?auto_170525 ?auto_170527 ) ) ( not ( = ?auto_170526 ?auto_170527 ) ) ( ON ?auto_170527 ?auto_170528 ) ( not ( = ?auto_170521 ?auto_170528 ) ) ( not ( = ?auto_170522 ?auto_170528 ) ) ( not ( = ?auto_170523 ?auto_170528 ) ) ( not ( = ?auto_170524 ?auto_170528 ) ) ( not ( = ?auto_170525 ?auto_170528 ) ) ( not ( = ?auto_170526 ?auto_170528 ) ) ( not ( = ?auto_170527 ?auto_170528 ) ) ( ON-TABLE ?auto_170528 ) ( ON ?auto_170521 ?auto_170529 ) ( not ( = ?auto_170521 ?auto_170529 ) ) ( not ( = ?auto_170522 ?auto_170529 ) ) ( not ( = ?auto_170523 ?auto_170529 ) ) ( not ( = ?auto_170524 ?auto_170529 ) ) ( not ( = ?auto_170525 ?auto_170529 ) ) ( not ( = ?auto_170526 ?auto_170529 ) ) ( not ( = ?auto_170527 ?auto_170529 ) ) ( not ( = ?auto_170528 ?auto_170529 ) ) ( ON ?auto_170522 ?auto_170521 ) ( ON-TABLE ?auto_170529 ) ( ON ?auto_170523 ?auto_170522 ) ( ON ?auto_170524 ?auto_170523 ) ( ON ?auto_170525 ?auto_170524 ) ( CLEAR ?auto_170527 ) ( ON ?auto_170526 ?auto_170525 ) ( CLEAR ?auto_170526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170529 ?auto_170521 ?auto_170522 ?auto_170523 ?auto_170524 ?auto_170525 )
      ( MAKE-7PILE ?auto_170521 ?auto_170522 ?auto_170523 ?auto_170524 ?auto_170525 ?auto_170526 ?auto_170527 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170530 - BLOCK
      ?auto_170531 - BLOCK
      ?auto_170532 - BLOCK
      ?auto_170533 - BLOCK
      ?auto_170534 - BLOCK
      ?auto_170535 - BLOCK
      ?auto_170536 - BLOCK
    )
    :vars
    (
      ?auto_170538 - BLOCK
      ?auto_170537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170530 ?auto_170531 ) ) ( not ( = ?auto_170530 ?auto_170532 ) ) ( not ( = ?auto_170530 ?auto_170533 ) ) ( not ( = ?auto_170530 ?auto_170534 ) ) ( not ( = ?auto_170530 ?auto_170535 ) ) ( not ( = ?auto_170530 ?auto_170536 ) ) ( not ( = ?auto_170531 ?auto_170532 ) ) ( not ( = ?auto_170531 ?auto_170533 ) ) ( not ( = ?auto_170531 ?auto_170534 ) ) ( not ( = ?auto_170531 ?auto_170535 ) ) ( not ( = ?auto_170531 ?auto_170536 ) ) ( not ( = ?auto_170532 ?auto_170533 ) ) ( not ( = ?auto_170532 ?auto_170534 ) ) ( not ( = ?auto_170532 ?auto_170535 ) ) ( not ( = ?auto_170532 ?auto_170536 ) ) ( not ( = ?auto_170533 ?auto_170534 ) ) ( not ( = ?auto_170533 ?auto_170535 ) ) ( not ( = ?auto_170533 ?auto_170536 ) ) ( not ( = ?auto_170534 ?auto_170535 ) ) ( not ( = ?auto_170534 ?auto_170536 ) ) ( not ( = ?auto_170535 ?auto_170536 ) ) ( not ( = ?auto_170530 ?auto_170538 ) ) ( not ( = ?auto_170531 ?auto_170538 ) ) ( not ( = ?auto_170532 ?auto_170538 ) ) ( not ( = ?auto_170533 ?auto_170538 ) ) ( not ( = ?auto_170534 ?auto_170538 ) ) ( not ( = ?auto_170535 ?auto_170538 ) ) ( not ( = ?auto_170536 ?auto_170538 ) ) ( ON-TABLE ?auto_170538 ) ( ON ?auto_170530 ?auto_170537 ) ( not ( = ?auto_170530 ?auto_170537 ) ) ( not ( = ?auto_170531 ?auto_170537 ) ) ( not ( = ?auto_170532 ?auto_170537 ) ) ( not ( = ?auto_170533 ?auto_170537 ) ) ( not ( = ?auto_170534 ?auto_170537 ) ) ( not ( = ?auto_170535 ?auto_170537 ) ) ( not ( = ?auto_170536 ?auto_170537 ) ) ( not ( = ?auto_170538 ?auto_170537 ) ) ( ON ?auto_170531 ?auto_170530 ) ( ON-TABLE ?auto_170537 ) ( ON ?auto_170532 ?auto_170531 ) ( ON ?auto_170533 ?auto_170532 ) ( ON ?auto_170534 ?auto_170533 ) ( ON ?auto_170535 ?auto_170534 ) ( CLEAR ?auto_170535 ) ( HOLDING ?auto_170536 ) ( CLEAR ?auto_170538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170538 ?auto_170536 )
      ( MAKE-7PILE ?auto_170530 ?auto_170531 ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170539 - BLOCK
      ?auto_170540 - BLOCK
      ?auto_170541 - BLOCK
      ?auto_170542 - BLOCK
      ?auto_170543 - BLOCK
      ?auto_170544 - BLOCK
      ?auto_170545 - BLOCK
    )
    :vars
    (
      ?auto_170547 - BLOCK
      ?auto_170546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170539 ?auto_170540 ) ) ( not ( = ?auto_170539 ?auto_170541 ) ) ( not ( = ?auto_170539 ?auto_170542 ) ) ( not ( = ?auto_170539 ?auto_170543 ) ) ( not ( = ?auto_170539 ?auto_170544 ) ) ( not ( = ?auto_170539 ?auto_170545 ) ) ( not ( = ?auto_170540 ?auto_170541 ) ) ( not ( = ?auto_170540 ?auto_170542 ) ) ( not ( = ?auto_170540 ?auto_170543 ) ) ( not ( = ?auto_170540 ?auto_170544 ) ) ( not ( = ?auto_170540 ?auto_170545 ) ) ( not ( = ?auto_170541 ?auto_170542 ) ) ( not ( = ?auto_170541 ?auto_170543 ) ) ( not ( = ?auto_170541 ?auto_170544 ) ) ( not ( = ?auto_170541 ?auto_170545 ) ) ( not ( = ?auto_170542 ?auto_170543 ) ) ( not ( = ?auto_170542 ?auto_170544 ) ) ( not ( = ?auto_170542 ?auto_170545 ) ) ( not ( = ?auto_170543 ?auto_170544 ) ) ( not ( = ?auto_170543 ?auto_170545 ) ) ( not ( = ?auto_170544 ?auto_170545 ) ) ( not ( = ?auto_170539 ?auto_170547 ) ) ( not ( = ?auto_170540 ?auto_170547 ) ) ( not ( = ?auto_170541 ?auto_170547 ) ) ( not ( = ?auto_170542 ?auto_170547 ) ) ( not ( = ?auto_170543 ?auto_170547 ) ) ( not ( = ?auto_170544 ?auto_170547 ) ) ( not ( = ?auto_170545 ?auto_170547 ) ) ( ON-TABLE ?auto_170547 ) ( ON ?auto_170539 ?auto_170546 ) ( not ( = ?auto_170539 ?auto_170546 ) ) ( not ( = ?auto_170540 ?auto_170546 ) ) ( not ( = ?auto_170541 ?auto_170546 ) ) ( not ( = ?auto_170542 ?auto_170546 ) ) ( not ( = ?auto_170543 ?auto_170546 ) ) ( not ( = ?auto_170544 ?auto_170546 ) ) ( not ( = ?auto_170545 ?auto_170546 ) ) ( not ( = ?auto_170547 ?auto_170546 ) ) ( ON ?auto_170540 ?auto_170539 ) ( ON-TABLE ?auto_170546 ) ( ON ?auto_170541 ?auto_170540 ) ( ON ?auto_170542 ?auto_170541 ) ( ON ?auto_170543 ?auto_170542 ) ( ON ?auto_170544 ?auto_170543 ) ( CLEAR ?auto_170547 ) ( ON ?auto_170545 ?auto_170544 ) ( CLEAR ?auto_170545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170546 ?auto_170539 ?auto_170540 ?auto_170541 ?auto_170542 ?auto_170543 ?auto_170544 )
      ( MAKE-7PILE ?auto_170539 ?auto_170540 ?auto_170541 ?auto_170542 ?auto_170543 ?auto_170544 ?auto_170545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170548 - BLOCK
      ?auto_170549 - BLOCK
      ?auto_170550 - BLOCK
      ?auto_170551 - BLOCK
      ?auto_170552 - BLOCK
      ?auto_170553 - BLOCK
      ?auto_170554 - BLOCK
    )
    :vars
    (
      ?auto_170556 - BLOCK
      ?auto_170555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170548 ?auto_170549 ) ) ( not ( = ?auto_170548 ?auto_170550 ) ) ( not ( = ?auto_170548 ?auto_170551 ) ) ( not ( = ?auto_170548 ?auto_170552 ) ) ( not ( = ?auto_170548 ?auto_170553 ) ) ( not ( = ?auto_170548 ?auto_170554 ) ) ( not ( = ?auto_170549 ?auto_170550 ) ) ( not ( = ?auto_170549 ?auto_170551 ) ) ( not ( = ?auto_170549 ?auto_170552 ) ) ( not ( = ?auto_170549 ?auto_170553 ) ) ( not ( = ?auto_170549 ?auto_170554 ) ) ( not ( = ?auto_170550 ?auto_170551 ) ) ( not ( = ?auto_170550 ?auto_170552 ) ) ( not ( = ?auto_170550 ?auto_170553 ) ) ( not ( = ?auto_170550 ?auto_170554 ) ) ( not ( = ?auto_170551 ?auto_170552 ) ) ( not ( = ?auto_170551 ?auto_170553 ) ) ( not ( = ?auto_170551 ?auto_170554 ) ) ( not ( = ?auto_170552 ?auto_170553 ) ) ( not ( = ?auto_170552 ?auto_170554 ) ) ( not ( = ?auto_170553 ?auto_170554 ) ) ( not ( = ?auto_170548 ?auto_170556 ) ) ( not ( = ?auto_170549 ?auto_170556 ) ) ( not ( = ?auto_170550 ?auto_170556 ) ) ( not ( = ?auto_170551 ?auto_170556 ) ) ( not ( = ?auto_170552 ?auto_170556 ) ) ( not ( = ?auto_170553 ?auto_170556 ) ) ( not ( = ?auto_170554 ?auto_170556 ) ) ( ON ?auto_170548 ?auto_170555 ) ( not ( = ?auto_170548 ?auto_170555 ) ) ( not ( = ?auto_170549 ?auto_170555 ) ) ( not ( = ?auto_170550 ?auto_170555 ) ) ( not ( = ?auto_170551 ?auto_170555 ) ) ( not ( = ?auto_170552 ?auto_170555 ) ) ( not ( = ?auto_170553 ?auto_170555 ) ) ( not ( = ?auto_170554 ?auto_170555 ) ) ( not ( = ?auto_170556 ?auto_170555 ) ) ( ON ?auto_170549 ?auto_170548 ) ( ON-TABLE ?auto_170555 ) ( ON ?auto_170550 ?auto_170549 ) ( ON ?auto_170551 ?auto_170550 ) ( ON ?auto_170552 ?auto_170551 ) ( ON ?auto_170553 ?auto_170552 ) ( ON ?auto_170554 ?auto_170553 ) ( CLEAR ?auto_170554 ) ( HOLDING ?auto_170556 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170556 )
      ( MAKE-7PILE ?auto_170548 ?auto_170549 ?auto_170550 ?auto_170551 ?auto_170552 ?auto_170553 ?auto_170554 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170557 - BLOCK
      ?auto_170558 - BLOCK
      ?auto_170559 - BLOCK
      ?auto_170560 - BLOCK
      ?auto_170561 - BLOCK
      ?auto_170562 - BLOCK
      ?auto_170563 - BLOCK
    )
    :vars
    (
      ?auto_170565 - BLOCK
      ?auto_170564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170557 ?auto_170558 ) ) ( not ( = ?auto_170557 ?auto_170559 ) ) ( not ( = ?auto_170557 ?auto_170560 ) ) ( not ( = ?auto_170557 ?auto_170561 ) ) ( not ( = ?auto_170557 ?auto_170562 ) ) ( not ( = ?auto_170557 ?auto_170563 ) ) ( not ( = ?auto_170558 ?auto_170559 ) ) ( not ( = ?auto_170558 ?auto_170560 ) ) ( not ( = ?auto_170558 ?auto_170561 ) ) ( not ( = ?auto_170558 ?auto_170562 ) ) ( not ( = ?auto_170558 ?auto_170563 ) ) ( not ( = ?auto_170559 ?auto_170560 ) ) ( not ( = ?auto_170559 ?auto_170561 ) ) ( not ( = ?auto_170559 ?auto_170562 ) ) ( not ( = ?auto_170559 ?auto_170563 ) ) ( not ( = ?auto_170560 ?auto_170561 ) ) ( not ( = ?auto_170560 ?auto_170562 ) ) ( not ( = ?auto_170560 ?auto_170563 ) ) ( not ( = ?auto_170561 ?auto_170562 ) ) ( not ( = ?auto_170561 ?auto_170563 ) ) ( not ( = ?auto_170562 ?auto_170563 ) ) ( not ( = ?auto_170557 ?auto_170565 ) ) ( not ( = ?auto_170558 ?auto_170565 ) ) ( not ( = ?auto_170559 ?auto_170565 ) ) ( not ( = ?auto_170560 ?auto_170565 ) ) ( not ( = ?auto_170561 ?auto_170565 ) ) ( not ( = ?auto_170562 ?auto_170565 ) ) ( not ( = ?auto_170563 ?auto_170565 ) ) ( ON ?auto_170557 ?auto_170564 ) ( not ( = ?auto_170557 ?auto_170564 ) ) ( not ( = ?auto_170558 ?auto_170564 ) ) ( not ( = ?auto_170559 ?auto_170564 ) ) ( not ( = ?auto_170560 ?auto_170564 ) ) ( not ( = ?auto_170561 ?auto_170564 ) ) ( not ( = ?auto_170562 ?auto_170564 ) ) ( not ( = ?auto_170563 ?auto_170564 ) ) ( not ( = ?auto_170565 ?auto_170564 ) ) ( ON ?auto_170558 ?auto_170557 ) ( ON-TABLE ?auto_170564 ) ( ON ?auto_170559 ?auto_170558 ) ( ON ?auto_170560 ?auto_170559 ) ( ON ?auto_170561 ?auto_170560 ) ( ON ?auto_170562 ?auto_170561 ) ( ON ?auto_170563 ?auto_170562 ) ( ON ?auto_170565 ?auto_170563 ) ( CLEAR ?auto_170565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170564 ?auto_170557 ?auto_170558 ?auto_170559 ?auto_170560 ?auto_170561 ?auto_170562 ?auto_170563 )
      ( MAKE-7PILE ?auto_170557 ?auto_170558 ?auto_170559 ?auto_170560 ?auto_170561 ?auto_170562 ?auto_170563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170574 - BLOCK
      ?auto_170575 - BLOCK
      ?auto_170576 - BLOCK
      ?auto_170577 - BLOCK
      ?auto_170578 - BLOCK
      ?auto_170579 - BLOCK
      ?auto_170580 - BLOCK
      ?auto_170581 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170581 ) ( CLEAR ?auto_170580 ) ( ON-TABLE ?auto_170574 ) ( ON ?auto_170575 ?auto_170574 ) ( ON ?auto_170576 ?auto_170575 ) ( ON ?auto_170577 ?auto_170576 ) ( ON ?auto_170578 ?auto_170577 ) ( ON ?auto_170579 ?auto_170578 ) ( ON ?auto_170580 ?auto_170579 ) ( not ( = ?auto_170574 ?auto_170575 ) ) ( not ( = ?auto_170574 ?auto_170576 ) ) ( not ( = ?auto_170574 ?auto_170577 ) ) ( not ( = ?auto_170574 ?auto_170578 ) ) ( not ( = ?auto_170574 ?auto_170579 ) ) ( not ( = ?auto_170574 ?auto_170580 ) ) ( not ( = ?auto_170574 ?auto_170581 ) ) ( not ( = ?auto_170575 ?auto_170576 ) ) ( not ( = ?auto_170575 ?auto_170577 ) ) ( not ( = ?auto_170575 ?auto_170578 ) ) ( not ( = ?auto_170575 ?auto_170579 ) ) ( not ( = ?auto_170575 ?auto_170580 ) ) ( not ( = ?auto_170575 ?auto_170581 ) ) ( not ( = ?auto_170576 ?auto_170577 ) ) ( not ( = ?auto_170576 ?auto_170578 ) ) ( not ( = ?auto_170576 ?auto_170579 ) ) ( not ( = ?auto_170576 ?auto_170580 ) ) ( not ( = ?auto_170576 ?auto_170581 ) ) ( not ( = ?auto_170577 ?auto_170578 ) ) ( not ( = ?auto_170577 ?auto_170579 ) ) ( not ( = ?auto_170577 ?auto_170580 ) ) ( not ( = ?auto_170577 ?auto_170581 ) ) ( not ( = ?auto_170578 ?auto_170579 ) ) ( not ( = ?auto_170578 ?auto_170580 ) ) ( not ( = ?auto_170578 ?auto_170581 ) ) ( not ( = ?auto_170579 ?auto_170580 ) ) ( not ( = ?auto_170579 ?auto_170581 ) ) ( not ( = ?auto_170580 ?auto_170581 ) ) )
    :subtasks
    ( ( !STACK ?auto_170581 ?auto_170580 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170582 - BLOCK
      ?auto_170583 - BLOCK
      ?auto_170584 - BLOCK
      ?auto_170585 - BLOCK
      ?auto_170586 - BLOCK
      ?auto_170587 - BLOCK
      ?auto_170588 - BLOCK
      ?auto_170589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170588 ) ( ON-TABLE ?auto_170582 ) ( ON ?auto_170583 ?auto_170582 ) ( ON ?auto_170584 ?auto_170583 ) ( ON ?auto_170585 ?auto_170584 ) ( ON ?auto_170586 ?auto_170585 ) ( ON ?auto_170587 ?auto_170586 ) ( ON ?auto_170588 ?auto_170587 ) ( not ( = ?auto_170582 ?auto_170583 ) ) ( not ( = ?auto_170582 ?auto_170584 ) ) ( not ( = ?auto_170582 ?auto_170585 ) ) ( not ( = ?auto_170582 ?auto_170586 ) ) ( not ( = ?auto_170582 ?auto_170587 ) ) ( not ( = ?auto_170582 ?auto_170588 ) ) ( not ( = ?auto_170582 ?auto_170589 ) ) ( not ( = ?auto_170583 ?auto_170584 ) ) ( not ( = ?auto_170583 ?auto_170585 ) ) ( not ( = ?auto_170583 ?auto_170586 ) ) ( not ( = ?auto_170583 ?auto_170587 ) ) ( not ( = ?auto_170583 ?auto_170588 ) ) ( not ( = ?auto_170583 ?auto_170589 ) ) ( not ( = ?auto_170584 ?auto_170585 ) ) ( not ( = ?auto_170584 ?auto_170586 ) ) ( not ( = ?auto_170584 ?auto_170587 ) ) ( not ( = ?auto_170584 ?auto_170588 ) ) ( not ( = ?auto_170584 ?auto_170589 ) ) ( not ( = ?auto_170585 ?auto_170586 ) ) ( not ( = ?auto_170585 ?auto_170587 ) ) ( not ( = ?auto_170585 ?auto_170588 ) ) ( not ( = ?auto_170585 ?auto_170589 ) ) ( not ( = ?auto_170586 ?auto_170587 ) ) ( not ( = ?auto_170586 ?auto_170588 ) ) ( not ( = ?auto_170586 ?auto_170589 ) ) ( not ( = ?auto_170587 ?auto_170588 ) ) ( not ( = ?auto_170587 ?auto_170589 ) ) ( not ( = ?auto_170588 ?auto_170589 ) ) ( ON-TABLE ?auto_170589 ) ( CLEAR ?auto_170589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_170589 )
      ( MAKE-8PILE ?auto_170582 ?auto_170583 ?auto_170584 ?auto_170585 ?auto_170586 ?auto_170587 ?auto_170588 ?auto_170589 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170590 - BLOCK
      ?auto_170591 - BLOCK
      ?auto_170592 - BLOCK
      ?auto_170593 - BLOCK
      ?auto_170594 - BLOCK
      ?auto_170595 - BLOCK
      ?auto_170596 - BLOCK
      ?auto_170597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170590 ) ( ON ?auto_170591 ?auto_170590 ) ( ON ?auto_170592 ?auto_170591 ) ( ON ?auto_170593 ?auto_170592 ) ( ON ?auto_170594 ?auto_170593 ) ( ON ?auto_170595 ?auto_170594 ) ( not ( = ?auto_170590 ?auto_170591 ) ) ( not ( = ?auto_170590 ?auto_170592 ) ) ( not ( = ?auto_170590 ?auto_170593 ) ) ( not ( = ?auto_170590 ?auto_170594 ) ) ( not ( = ?auto_170590 ?auto_170595 ) ) ( not ( = ?auto_170590 ?auto_170596 ) ) ( not ( = ?auto_170590 ?auto_170597 ) ) ( not ( = ?auto_170591 ?auto_170592 ) ) ( not ( = ?auto_170591 ?auto_170593 ) ) ( not ( = ?auto_170591 ?auto_170594 ) ) ( not ( = ?auto_170591 ?auto_170595 ) ) ( not ( = ?auto_170591 ?auto_170596 ) ) ( not ( = ?auto_170591 ?auto_170597 ) ) ( not ( = ?auto_170592 ?auto_170593 ) ) ( not ( = ?auto_170592 ?auto_170594 ) ) ( not ( = ?auto_170592 ?auto_170595 ) ) ( not ( = ?auto_170592 ?auto_170596 ) ) ( not ( = ?auto_170592 ?auto_170597 ) ) ( not ( = ?auto_170593 ?auto_170594 ) ) ( not ( = ?auto_170593 ?auto_170595 ) ) ( not ( = ?auto_170593 ?auto_170596 ) ) ( not ( = ?auto_170593 ?auto_170597 ) ) ( not ( = ?auto_170594 ?auto_170595 ) ) ( not ( = ?auto_170594 ?auto_170596 ) ) ( not ( = ?auto_170594 ?auto_170597 ) ) ( not ( = ?auto_170595 ?auto_170596 ) ) ( not ( = ?auto_170595 ?auto_170597 ) ) ( not ( = ?auto_170596 ?auto_170597 ) ) ( ON-TABLE ?auto_170597 ) ( CLEAR ?auto_170597 ) ( HOLDING ?auto_170596 ) ( CLEAR ?auto_170595 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170590 ?auto_170591 ?auto_170592 ?auto_170593 ?auto_170594 ?auto_170595 ?auto_170596 )
      ( MAKE-8PILE ?auto_170590 ?auto_170591 ?auto_170592 ?auto_170593 ?auto_170594 ?auto_170595 ?auto_170596 ?auto_170597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170598 - BLOCK
      ?auto_170599 - BLOCK
      ?auto_170600 - BLOCK
      ?auto_170601 - BLOCK
      ?auto_170602 - BLOCK
      ?auto_170603 - BLOCK
      ?auto_170604 - BLOCK
      ?auto_170605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170598 ) ( ON ?auto_170599 ?auto_170598 ) ( ON ?auto_170600 ?auto_170599 ) ( ON ?auto_170601 ?auto_170600 ) ( ON ?auto_170602 ?auto_170601 ) ( ON ?auto_170603 ?auto_170602 ) ( not ( = ?auto_170598 ?auto_170599 ) ) ( not ( = ?auto_170598 ?auto_170600 ) ) ( not ( = ?auto_170598 ?auto_170601 ) ) ( not ( = ?auto_170598 ?auto_170602 ) ) ( not ( = ?auto_170598 ?auto_170603 ) ) ( not ( = ?auto_170598 ?auto_170604 ) ) ( not ( = ?auto_170598 ?auto_170605 ) ) ( not ( = ?auto_170599 ?auto_170600 ) ) ( not ( = ?auto_170599 ?auto_170601 ) ) ( not ( = ?auto_170599 ?auto_170602 ) ) ( not ( = ?auto_170599 ?auto_170603 ) ) ( not ( = ?auto_170599 ?auto_170604 ) ) ( not ( = ?auto_170599 ?auto_170605 ) ) ( not ( = ?auto_170600 ?auto_170601 ) ) ( not ( = ?auto_170600 ?auto_170602 ) ) ( not ( = ?auto_170600 ?auto_170603 ) ) ( not ( = ?auto_170600 ?auto_170604 ) ) ( not ( = ?auto_170600 ?auto_170605 ) ) ( not ( = ?auto_170601 ?auto_170602 ) ) ( not ( = ?auto_170601 ?auto_170603 ) ) ( not ( = ?auto_170601 ?auto_170604 ) ) ( not ( = ?auto_170601 ?auto_170605 ) ) ( not ( = ?auto_170602 ?auto_170603 ) ) ( not ( = ?auto_170602 ?auto_170604 ) ) ( not ( = ?auto_170602 ?auto_170605 ) ) ( not ( = ?auto_170603 ?auto_170604 ) ) ( not ( = ?auto_170603 ?auto_170605 ) ) ( not ( = ?auto_170604 ?auto_170605 ) ) ( ON-TABLE ?auto_170605 ) ( CLEAR ?auto_170603 ) ( ON ?auto_170604 ?auto_170605 ) ( CLEAR ?auto_170604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170605 )
      ( MAKE-8PILE ?auto_170598 ?auto_170599 ?auto_170600 ?auto_170601 ?auto_170602 ?auto_170603 ?auto_170604 ?auto_170605 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170606 - BLOCK
      ?auto_170607 - BLOCK
      ?auto_170608 - BLOCK
      ?auto_170609 - BLOCK
      ?auto_170610 - BLOCK
      ?auto_170611 - BLOCK
      ?auto_170612 - BLOCK
      ?auto_170613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170606 ) ( ON ?auto_170607 ?auto_170606 ) ( ON ?auto_170608 ?auto_170607 ) ( ON ?auto_170609 ?auto_170608 ) ( ON ?auto_170610 ?auto_170609 ) ( not ( = ?auto_170606 ?auto_170607 ) ) ( not ( = ?auto_170606 ?auto_170608 ) ) ( not ( = ?auto_170606 ?auto_170609 ) ) ( not ( = ?auto_170606 ?auto_170610 ) ) ( not ( = ?auto_170606 ?auto_170611 ) ) ( not ( = ?auto_170606 ?auto_170612 ) ) ( not ( = ?auto_170606 ?auto_170613 ) ) ( not ( = ?auto_170607 ?auto_170608 ) ) ( not ( = ?auto_170607 ?auto_170609 ) ) ( not ( = ?auto_170607 ?auto_170610 ) ) ( not ( = ?auto_170607 ?auto_170611 ) ) ( not ( = ?auto_170607 ?auto_170612 ) ) ( not ( = ?auto_170607 ?auto_170613 ) ) ( not ( = ?auto_170608 ?auto_170609 ) ) ( not ( = ?auto_170608 ?auto_170610 ) ) ( not ( = ?auto_170608 ?auto_170611 ) ) ( not ( = ?auto_170608 ?auto_170612 ) ) ( not ( = ?auto_170608 ?auto_170613 ) ) ( not ( = ?auto_170609 ?auto_170610 ) ) ( not ( = ?auto_170609 ?auto_170611 ) ) ( not ( = ?auto_170609 ?auto_170612 ) ) ( not ( = ?auto_170609 ?auto_170613 ) ) ( not ( = ?auto_170610 ?auto_170611 ) ) ( not ( = ?auto_170610 ?auto_170612 ) ) ( not ( = ?auto_170610 ?auto_170613 ) ) ( not ( = ?auto_170611 ?auto_170612 ) ) ( not ( = ?auto_170611 ?auto_170613 ) ) ( not ( = ?auto_170612 ?auto_170613 ) ) ( ON-TABLE ?auto_170613 ) ( ON ?auto_170612 ?auto_170613 ) ( CLEAR ?auto_170612 ) ( HOLDING ?auto_170611 ) ( CLEAR ?auto_170610 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170606 ?auto_170607 ?auto_170608 ?auto_170609 ?auto_170610 ?auto_170611 )
      ( MAKE-8PILE ?auto_170606 ?auto_170607 ?auto_170608 ?auto_170609 ?auto_170610 ?auto_170611 ?auto_170612 ?auto_170613 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170614 - BLOCK
      ?auto_170615 - BLOCK
      ?auto_170616 - BLOCK
      ?auto_170617 - BLOCK
      ?auto_170618 - BLOCK
      ?auto_170619 - BLOCK
      ?auto_170620 - BLOCK
      ?auto_170621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170614 ) ( ON ?auto_170615 ?auto_170614 ) ( ON ?auto_170616 ?auto_170615 ) ( ON ?auto_170617 ?auto_170616 ) ( ON ?auto_170618 ?auto_170617 ) ( not ( = ?auto_170614 ?auto_170615 ) ) ( not ( = ?auto_170614 ?auto_170616 ) ) ( not ( = ?auto_170614 ?auto_170617 ) ) ( not ( = ?auto_170614 ?auto_170618 ) ) ( not ( = ?auto_170614 ?auto_170619 ) ) ( not ( = ?auto_170614 ?auto_170620 ) ) ( not ( = ?auto_170614 ?auto_170621 ) ) ( not ( = ?auto_170615 ?auto_170616 ) ) ( not ( = ?auto_170615 ?auto_170617 ) ) ( not ( = ?auto_170615 ?auto_170618 ) ) ( not ( = ?auto_170615 ?auto_170619 ) ) ( not ( = ?auto_170615 ?auto_170620 ) ) ( not ( = ?auto_170615 ?auto_170621 ) ) ( not ( = ?auto_170616 ?auto_170617 ) ) ( not ( = ?auto_170616 ?auto_170618 ) ) ( not ( = ?auto_170616 ?auto_170619 ) ) ( not ( = ?auto_170616 ?auto_170620 ) ) ( not ( = ?auto_170616 ?auto_170621 ) ) ( not ( = ?auto_170617 ?auto_170618 ) ) ( not ( = ?auto_170617 ?auto_170619 ) ) ( not ( = ?auto_170617 ?auto_170620 ) ) ( not ( = ?auto_170617 ?auto_170621 ) ) ( not ( = ?auto_170618 ?auto_170619 ) ) ( not ( = ?auto_170618 ?auto_170620 ) ) ( not ( = ?auto_170618 ?auto_170621 ) ) ( not ( = ?auto_170619 ?auto_170620 ) ) ( not ( = ?auto_170619 ?auto_170621 ) ) ( not ( = ?auto_170620 ?auto_170621 ) ) ( ON-TABLE ?auto_170621 ) ( ON ?auto_170620 ?auto_170621 ) ( CLEAR ?auto_170618 ) ( ON ?auto_170619 ?auto_170620 ) ( CLEAR ?auto_170619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170621 ?auto_170620 )
      ( MAKE-8PILE ?auto_170614 ?auto_170615 ?auto_170616 ?auto_170617 ?auto_170618 ?auto_170619 ?auto_170620 ?auto_170621 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170622 - BLOCK
      ?auto_170623 - BLOCK
      ?auto_170624 - BLOCK
      ?auto_170625 - BLOCK
      ?auto_170626 - BLOCK
      ?auto_170627 - BLOCK
      ?auto_170628 - BLOCK
      ?auto_170629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170622 ) ( ON ?auto_170623 ?auto_170622 ) ( ON ?auto_170624 ?auto_170623 ) ( ON ?auto_170625 ?auto_170624 ) ( not ( = ?auto_170622 ?auto_170623 ) ) ( not ( = ?auto_170622 ?auto_170624 ) ) ( not ( = ?auto_170622 ?auto_170625 ) ) ( not ( = ?auto_170622 ?auto_170626 ) ) ( not ( = ?auto_170622 ?auto_170627 ) ) ( not ( = ?auto_170622 ?auto_170628 ) ) ( not ( = ?auto_170622 ?auto_170629 ) ) ( not ( = ?auto_170623 ?auto_170624 ) ) ( not ( = ?auto_170623 ?auto_170625 ) ) ( not ( = ?auto_170623 ?auto_170626 ) ) ( not ( = ?auto_170623 ?auto_170627 ) ) ( not ( = ?auto_170623 ?auto_170628 ) ) ( not ( = ?auto_170623 ?auto_170629 ) ) ( not ( = ?auto_170624 ?auto_170625 ) ) ( not ( = ?auto_170624 ?auto_170626 ) ) ( not ( = ?auto_170624 ?auto_170627 ) ) ( not ( = ?auto_170624 ?auto_170628 ) ) ( not ( = ?auto_170624 ?auto_170629 ) ) ( not ( = ?auto_170625 ?auto_170626 ) ) ( not ( = ?auto_170625 ?auto_170627 ) ) ( not ( = ?auto_170625 ?auto_170628 ) ) ( not ( = ?auto_170625 ?auto_170629 ) ) ( not ( = ?auto_170626 ?auto_170627 ) ) ( not ( = ?auto_170626 ?auto_170628 ) ) ( not ( = ?auto_170626 ?auto_170629 ) ) ( not ( = ?auto_170627 ?auto_170628 ) ) ( not ( = ?auto_170627 ?auto_170629 ) ) ( not ( = ?auto_170628 ?auto_170629 ) ) ( ON-TABLE ?auto_170629 ) ( ON ?auto_170628 ?auto_170629 ) ( ON ?auto_170627 ?auto_170628 ) ( CLEAR ?auto_170627 ) ( HOLDING ?auto_170626 ) ( CLEAR ?auto_170625 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170622 ?auto_170623 ?auto_170624 ?auto_170625 ?auto_170626 )
      ( MAKE-8PILE ?auto_170622 ?auto_170623 ?auto_170624 ?auto_170625 ?auto_170626 ?auto_170627 ?auto_170628 ?auto_170629 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170630 - BLOCK
      ?auto_170631 - BLOCK
      ?auto_170632 - BLOCK
      ?auto_170633 - BLOCK
      ?auto_170634 - BLOCK
      ?auto_170635 - BLOCK
      ?auto_170636 - BLOCK
      ?auto_170637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170630 ) ( ON ?auto_170631 ?auto_170630 ) ( ON ?auto_170632 ?auto_170631 ) ( ON ?auto_170633 ?auto_170632 ) ( not ( = ?auto_170630 ?auto_170631 ) ) ( not ( = ?auto_170630 ?auto_170632 ) ) ( not ( = ?auto_170630 ?auto_170633 ) ) ( not ( = ?auto_170630 ?auto_170634 ) ) ( not ( = ?auto_170630 ?auto_170635 ) ) ( not ( = ?auto_170630 ?auto_170636 ) ) ( not ( = ?auto_170630 ?auto_170637 ) ) ( not ( = ?auto_170631 ?auto_170632 ) ) ( not ( = ?auto_170631 ?auto_170633 ) ) ( not ( = ?auto_170631 ?auto_170634 ) ) ( not ( = ?auto_170631 ?auto_170635 ) ) ( not ( = ?auto_170631 ?auto_170636 ) ) ( not ( = ?auto_170631 ?auto_170637 ) ) ( not ( = ?auto_170632 ?auto_170633 ) ) ( not ( = ?auto_170632 ?auto_170634 ) ) ( not ( = ?auto_170632 ?auto_170635 ) ) ( not ( = ?auto_170632 ?auto_170636 ) ) ( not ( = ?auto_170632 ?auto_170637 ) ) ( not ( = ?auto_170633 ?auto_170634 ) ) ( not ( = ?auto_170633 ?auto_170635 ) ) ( not ( = ?auto_170633 ?auto_170636 ) ) ( not ( = ?auto_170633 ?auto_170637 ) ) ( not ( = ?auto_170634 ?auto_170635 ) ) ( not ( = ?auto_170634 ?auto_170636 ) ) ( not ( = ?auto_170634 ?auto_170637 ) ) ( not ( = ?auto_170635 ?auto_170636 ) ) ( not ( = ?auto_170635 ?auto_170637 ) ) ( not ( = ?auto_170636 ?auto_170637 ) ) ( ON-TABLE ?auto_170637 ) ( ON ?auto_170636 ?auto_170637 ) ( ON ?auto_170635 ?auto_170636 ) ( CLEAR ?auto_170633 ) ( ON ?auto_170634 ?auto_170635 ) ( CLEAR ?auto_170634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170637 ?auto_170636 ?auto_170635 )
      ( MAKE-8PILE ?auto_170630 ?auto_170631 ?auto_170632 ?auto_170633 ?auto_170634 ?auto_170635 ?auto_170636 ?auto_170637 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170638 - BLOCK
      ?auto_170639 - BLOCK
      ?auto_170640 - BLOCK
      ?auto_170641 - BLOCK
      ?auto_170642 - BLOCK
      ?auto_170643 - BLOCK
      ?auto_170644 - BLOCK
      ?auto_170645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170638 ) ( ON ?auto_170639 ?auto_170638 ) ( ON ?auto_170640 ?auto_170639 ) ( not ( = ?auto_170638 ?auto_170639 ) ) ( not ( = ?auto_170638 ?auto_170640 ) ) ( not ( = ?auto_170638 ?auto_170641 ) ) ( not ( = ?auto_170638 ?auto_170642 ) ) ( not ( = ?auto_170638 ?auto_170643 ) ) ( not ( = ?auto_170638 ?auto_170644 ) ) ( not ( = ?auto_170638 ?auto_170645 ) ) ( not ( = ?auto_170639 ?auto_170640 ) ) ( not ( = ?auto_170639 ?auto_170641 ) ) ( not ( = ?auto_170639 ?auto_170642 ) ) ( not ( = ?auto_170639 ?auto_170643 ) ) ( not ( = ?auto_170639 ?auto_170644 ) ) ( not ( = ?auto_170639 ?auto_170645 ) ) ( not ( = ?auto_170640 ?auto_170641 ) ) ( not ( = ?auto_170640 ?auto_170642 ) ) ( not ( = ?auto_170640 ?auto_170643 ) ) ( not ( = ?auto_170640 ?auto_170644 ) ) ( not ( = ?auto_170640 ?auto_170645 ) ) ( not ( = ?auto_170641 ?auto_170642 ) ) ( not ( = ?auto_170641 ?auto_170643 ) ) ( not ( = ?auto_170641 ?auto_170644 ) ) ( not ( = ?auto_170641 ?auto_170645 ) ) ( not ( = ?auto_170642 ?auto_170643 ) ) ( not ( = ?auto_170642 ?auto_170644 ) ) ( not ( = ?auto_170642 ?auto_170645 ) ) ( not ( = ?auto_170643 ?auto_170644 ) ) ( not ( = ?auto_170643 ?auto_170645 ) ) ( not ( = ?auto_170644 ?auto_170645 ) ) ( ON-TABLE ?auto_170645 ) ( ON ?auto_170644 ?auto_170645 ) ( ON ?auto_170643 ?auto_170644 ) ( ON ?auto_170642 ?auto_170643 ) ( CLEAR ?auto_170642 ) ( HOLDING ?auto_170641 ) ( CLEAR ?auto_170640 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170638 ?auto_170639 ?auto_170640 ?auto_170641 )
      ( MAKE-8PILE ?auto_170638 ?auto_170639 ?auto_170640 ?auto_170641 ?auto_170642 ?auto_170643 ?auto_170644 ?auto_170645 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170646 - BLOCK
      ?auto_170647 - BLOCK
      ?auto_170648 - BLOCK
      ?auto_170649 - BLOCK
      ?auto_170650 - BLOCK
      ?auto_170651 - BLOCK
      ?auto_170652 - BLOCK
      ?auto_170653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170646 ) ( ON ?auto_170647 ?auto_170646 ) ( ON ?auto_170648 ?auto_170647 ) ( not ( = ?auto_170646 ?auto_170647 ) ) ( not ( = ?auto_170646 ?auto_170648 ) ) ( not ( = ?auto_170646 ?auto_170649 ) ) ( not ( = ?auto_170646 ?auto_170650 ) ) ( not ( = ?auto_170646 ?auto_170651 ) ) ( not ( = ?auto_170646 ?auto_170652 ) ) ( not ( = ?auto_170646 ?auto_170653 ) ) ( not ( = ?auto_170647 ?auto_170648 ) ) ( not ( = ?auto_170647 ?auto_170649 ) ) ( not ( = ?auto_170647 ?auto_170650 ) ) ( not ( = ?auto_170647 ?auto_170651 ) ) ( not ( = ?auto_170647 ?auto_170652 ) ) ( not ( = ?auto_170647 ?auto_170653 ) ) ( not ( = ?auto_170648 ?auto_170649 ) ) ( not ( = ?auto_170648 ?auto_170650 ) ) ( not ( = ?auto_170648 ?auto_170651 ) ) ( not ( = ?auto_170648 ?auto_170652 ) ) ( not ( = ?auto_170648 ?auto_170653 ) ) ( not ( = ?auto_170649 ?auto_170650 ) ) ( not ( = ?auto_170649 ?auto_170651 ) ) ( not ( = ?auto_170649 ?auto_170652 ) ) ( not ( = ?auto_170649 ?auto_170653 ) ) ( not ( = ?auto_170650 ?auto_170651 ) ) ( not ( = ?auto_170650 ?auto_170652 ) ) ( not ( = ?auto_170650 ?auto_170653 ) ) ( not ( = ?auto_170651 ?auto_170652 ) ) ( not ( = ?auto_170651 ?auto_170653 ) ) ( not ( = ?auto_170652 ?auto_170653 ) ) ( ON-TABLE ?auto_170653 ) ( ON ?auto_170652 ?auto_170653 ) ( ON ?auto_170651 ?auto_170652 ) ( ON ?auto_170650 ?auto_170651 ) ( CLEAR ?auto_170648 ) ( ON ?auto_170649 ?auto_170650 ) ( CLEAR ?auto_170649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170653 ?auto_170652 ?auto_170651 ?auto_170650 )
      ( MAKE-8PILE ?auto_170646 ?auto_170647 ?auto_170648 ?auto_170649 ?auto_170650 ?auto_170651 ?auto_170652 ?auto_170653 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170654 - BLOCK
      ?auto_170655 - BLOCK
      ?auto_170656 - BLOCK
      ?auto_170657 - BLOCK
      ?auto_170658 - BLOCK
      ?auto_170659 - BLOCK
      ?auto_170660 - BLOCK
      ?auto_170661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170654 ) ( ON ?auto_170655 ?auto_170654 ) ( not ( = ?auto_170654 ?auto_170655 ) ) ( not ( = ?auto_170654 ?auto_170656 ) ) ( not ( = ?auto_170654 ?auto_170657 ) ) ( not ( = ?auto_170654 ?auto_170658 ) ) ( not ( = ?auto_170654 ?auto_170659 ) ) ( not ( = ?auto_170654 ?auto_170660 ) ) ( not ( = ?auto_170654 ?auto_170661 ) ) ( not ( = ?auto_170655 ?auto_170656 ) ) ( not ( = ?auto_170655 ?auto_170657 ) ) ( not ( = ?auto_170655 ?auto_170658 ) ) ( not ( = ?auto_170655 ?auto_170659 ) ) ( not ( = ?auto_170655 ?auto_170660 ) ) ( not ( = ?auto_170655 ?auto_170661 ) ) ( not ( = ?auto_170656 ?auto_170657 ) ) ( not ( = ?auto_170656 ?auto_170658 ) ) ( not ( = ?auto_170656 ?auto_170659 ) ) ( not ( = ?auto_170656 ?auto_170660 ) ) ( not ( = ?auto_170656 ?auto_170661 ) ) ( not ( = ?auto_170657 ?auto_170658 ) ) ( not ( = ?auto_170657 ?auto_170659 ) ) ( not ( = ?auto_170657 ?auto_170660 ) ) ( not ( = ?auto_170657 ?auto_170661 ) ) ( not ( = ?auto_170658 ?auto_170659 ) ) ( not ( = ?auto_170658 ?auto_170660 ) ) ( not ( = ?auto_170658 ?auto_170661 ) ) ( not ( = ?auto_170659 ?auto_170660 ) ) ( not ( = ?auto_170659 ?auto_170661 ) ) ( not ( = ?auto_170660 ?auto_170661 ) ) ( ON-TABLE ?auto_170661 ) ( ON ?auto_170660 ?auto_170661 ) ( ON ?auto_170659 ?auto_170660 ) ( ON ?auto_170658 ?auto_170659 ) ( ON ?auto_170657 ?auto_170658 ) ( CLEAR ?auto_170657 ) ( HOLDING ?auto_170656 ) ( CLEAR ?auto_170655 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170654 ?auto_170655 ?auto_170656 )
      ( MAKE-8PILE ?auto_170654 ?auto_170655 ?auto_170656 ?auto_170657 ?auto_170658 ?auto_170659 ?auto_170660 ?auto_170661 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170662 - BLOCK
      ?auto_170663 - BLOCK
      ?auto_170664 - BLOCK
      ?auto_170665 - BLOCK
      ?auto_170666 - BLOCK
      ?auto_170667 - BLOCK
      ?auto_170668 - BLOCK
      ?auto_170669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170662 ) ( ON ?auto_170663 ?auto_170662 ) ( not ( = ?auto_170662 ?auto_170663 ) ) ( not ( = ?auto_170662 ?auto_170664 ) ) ( not ( = ?auto_170662 ?auto_170665 ) ) ( not ( = ?auto_170662 ?auto_170666 ) ) ( not ( = ?auto_170662 ?auto_170667 ) ) ( not ( = ?auto_170662 ?auto_170668 ) ) ( not ( = ?auto_170662 ?auto_170669 ) ) ( not ( = ?auto_170663 ?auto_170664 ) ) ( not ( = ?auto_170663 ?auto_170665 ) ) ( not ( = ?auto_170663 ?auto_170666 ) ) ( not ( = ?auto_170663 ?auto_170667 ) ) ( not ( = ?auto_170663 ?auto_170668 ) ) ( not ( = ?auto_170663 ?auto_170669 ) ) ( not ( = ?auto_170664 ?auto_170665 ) ) ( not ( = ?auto_170664 ?auto_170666 ) ) ( not ( = ?auto_170664 ?auto_170667 ) ) ( not ( = ?auto_170664 ?auto_170668 ) ) ( not ( = ?auto_170664 ?auto_170669 ) ) ( not ( = ?auto_170665 ?auto_170666 ) ) ( not ( = ?auto_170665 ?auto_170667 ) ) ( not ( = ?auto_170665 ?auto_170668 ) ) ( not ( = ?auto_170665 ?auto_170669 ) ) ( not ( = ?auto_170666 ?auto_170667 ) ) ( not ( = ?auto_170666 ?auto_170668 ) ) ( not ( = ?auto_170666 ?auto_170669 ) ) ( not ( = ?auto_170667 ?auto_170668 ) ) ( not ( = ?auto_170667 ?auto_170669 ) ) ( not ( = ?auto_170668 ?auto_170669 ) ) ( ON-TABLE ?auto_170669 ) ( ON ?auto_170668 ?auto_170669 ) ( ON ?auto_170667 ?auto_170668 ) ( ON ?auto_170666 ?auto_170667 ) ( ON ?auto_170665 ?auto_170666 ) ( CLEAR ?auto_170663 ) ( ON ?auto_170664 ?auto_170665 ) ( CLEAR ?auto_170664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170669 ?auto_170668 ?auto_170667 ?auto_170666 ?auto_170665 )
      ( MAKE-8PILE ?auto_170662 ?auto_170663 ?auto_170664 ?auto_170665 ?auto_170666 ?auto_170667 ?auto_170668 ?auto_170669 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170670 - BLOCK
      ?auto_170671 - BLOCK
      ?auto_170672 - BLOCK
      ?auto_170673 - BLOCK
      ?auto_170674 - BLOCK
      ?auto_170675 - BLOCK
      ?auto_170676 - BLOCK
      ?auto_170677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170670 ) ( not ( = ?auto_170670 ?auto_170671 ) ) ( not ( = ?auto_170670 ?auto_170672 ) ) ( not ( = ?auto_170670 ?auto_170673 ) ) ( not ( = ?auto_170670 ?auto_170674 ) ) ( not ( = ?auto_170670 ?auto_170675 ) ) ( not ( = ?auto_170670 ?auto_170676 ) ) ( not ( = ?auto_170670 ?auto_170677 ) ) ( not ( = ?auto_170671 ?auto_170672 ) ) ( not ( = ?auto_170671 ?auto_170673 ) ) ( not ( = ?auto_170671 ?auto_170674 ) ) ( not ( = ?auto_170671 ?auto_170675 ) ) ( not ( = ?auto_170671 ?auto_170676 ) ) ( not ( = ?auto_170671 ?auto_170677 ) ) ( not ( = ?auto_170672 ?auto_170673 ) ) ( not ( = ?auto_170672 ?auto_170674 ) ) ( not ( = ?auto_170672 ?auto_170675 ) ) ( not ( = ?auto_170672 ?auto_170676 ) ) ( not ( = ?auto_170672 ?auto_170677 ) ) ( not ( = ?auto_170673 ?auto_170674 ) ) ( not ( = ?auto_170673 ?auto_170675 ) ) ( not ( = ?auto_170673 ?auto_170676 ) ) ( not ( = ?auto_170673 ?auto_170677 ) ) ( not ( = ?auto_170674 ?auto_170675 ) ) ( not ( = ?auto_170674 ?auto_170676 ) ) ( not ( = ?auto_170674 ?auto_170677 ) ) ( not ( = ?auto_170675 ?auto_170676 ) ) ( not ( = ?auto_170675 ?auto_170677 ) ) ( not ( = ?auto_170676 ?auto_170677 ) ) ( ON-TABLE ?auto_170677 ) ( ON ?auto_170676 ?auto_170677 ) ( ON ?auto_170675 ?auto_170676 ) ( ON ?auto_170674 ?auto_170675 ) ( ON ?auto_170673 ?auto_170674 ) ( ON ?auto_170672 ?auto_170673 ) ( CLEAR ?auto_170672 ) ( HOLDING ?auto_170671 ) ( CLEAR ?auto_170670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170670 ?auto_170671 )
      ( MAKE-8PILE ?auto_170670 ?auto_170671 ?auto_170672 ?auto_170673 ?auto_170674 ?auto_170675 ?auto_170676 ?auto_170677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170678 - BLOCK
      ?auto_170679 - BLOCK
      ?auto_170680 - BLOCK
      ?auto_170681 - BLOCK
      ?auto_170682 - BLOCK
      ?auto_170683 - BLOCK
      ?auto_170684 - BLOCK
      ?auto_170685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170678 ) ( not ( = ?auto_170678 ?auto_170679 ) ) ( not ( = ?auto_170678 ?auto_170680 ) ) ( not ( = ?auto_170678 ?auto_170681 ) ) ( not ( = ?auto_170678 ?auto_170682 ) ) ( not ( = ?auto_170678 ?auto_170683 ) ) ( not ( = ?auto_170678 ?auto_170684 ) ) ( not ( = ?auto_170678 ?auto_170685 ) ) ( not ( = ?auto_170679 ?auto_170680 ) ) ( not ( = ?auto_170679 ?auto_170681 ) ) ( not ( = ?auto_170679 ?auto_170682 ) ) ( not ( = ?auto_170679 ?auto_170683 ) ) ( not ( = ?auto_170679 ?auto_170684 ) ) ( not ( = ?auto_170679 ?auto_170685 ) ) ( not ( = ?auto_170680 ?auto_170681 ) ) ( not ( = ?auto_170680 ?auto_170682 ) ) ( not ( = ?auto_170680 ?auto_170683 ) ) ( not ( = ?auto_170680 ?auto_170684 ) ) ( not ( = ?auto_170680 ?auto_170685 ) ) ( not ( = ?auto_170681 ?auto_170682 ) ) ( not ( = ?auto_170681 ?auto_170683 ) ) ( not ( = ?auto_170681 ?auto_170684 ) ) ( not ( = ?auto_170681 ?auto_170685 ) ) ( not ( = ?auto_170682 ?auto_170683 ) ) ( not ( = ?auto_170682 ?auto_170684 ) ) ( not ( = ?auto_170682 ?auto_170685 ) ) ( not ( = ?auto_170683 ?auto_170684 ) ) ( not ( = ?auto_170683 ?auto_170685 ) ) ( not ( = ?auto_170684 ?auto_170685 ) ) ( ON-TABLE ?auto_170685 ) ( ON ?auto_170684 ?auto_170685 ) ( ON ?auto_170683 ?auto_170684 ) ( ON ?auto_170682 ?auto_170683 ) ( ON ?auto_170681 ?auto_170682 ) ( ON ?auto_170680 ?auto_170681 ) ( CLEAR ?auto_170678 ) ( ON ?auto_170679 ?auto_170680 ) ( CLEAR ?auto_170679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170685 ?auto_170684 ?auto_170683 ?auto_170682 ?auto_170681 ?auto_170680 )
      ( MAKE-8PILE ?auto_170678 ?auto_170679 ?auto_170680 ?auto_170681 ?auto_170682 ?auto_170683 ?auto_170684 ?auto_170685 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170686 - BLOCK
      ?auto_170687 - BLOCK
      ?auto_170688 - BLOCK
      ?auto_170689 - BLOCK
      ?auto_170690 - BLOCK
      ?auto_170691 - BLOCK
      ?auto_170692 - BLOCK
      ?auto_170693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170686 ?auto_170687 ) ) ( not ( = ?auto_170686 ?auto_170688 ) ) ( not ( = ?auto_170686 ?auto_170689 ) ) ( not ( = ?auto_170686 ?auto_170690 ) ) ( not ( = ?auto_170686 ?auto_170691 ) ) ( not ( = ?auto_170686 ?auto_170692 ) ) ( not ( = ?auto_170686 ?auto_170693 ) ) ( not ( = ?auto_170687 ?auto_170688 ) ) ( not ( = ?auto_170687 ?auto_170689 ) ) ( not ( = ?auto_170687 ?auto_170690 ) ) ( not ( = ?auto_170687 ?auto_170691 ) ) ( not ( = ?auto_170687 ?auto_170692 ) ) ( not ( = ?auto_170687 ?auto_170693 ) ) ( not ( = ?auto_170688 ?auto_170689 ) ) ( not ( = ?auto_170688 ?auto_170690 ) ) ( not ( = ?auto_170688 ?auto_170691 ) ) ( not ( = ?auto_170688 ?auto_170692 ) ) ( not ( = ?auto_170688 ?auto_170693 ) ) ( not ( = ?auto_170689 ?auto_170690 ) ) ( not ( = ?auto_170689 ?auto_170691 ) ) ( not ( = ?auto_170689 ?auto_170692 ) ) ( not ( = ?auto_170689 ?auto_170693 ) ) ( not ( = ?auto_170690 ?auto_170691 ) ) ( not ( = ?auto_170690 ?auto_170692 ) ) ( not ( = ?auto_170690 ?auto_170693 ) ) ( not ( = ?auto_170691 ?auto_170692 ) ) ( not ( = ?auto_170691 ?auto_170693 ) ) ( not ( = ?auto_170692 ?auto_170693 ) ) ( ON-TABLE ?auto_170693 ) ( ON ?auto_170692 ?auto_170693 ) ( ON ?auto_170691 ?auto_170692 ) ( ON ?auto_170690 ?auto_170691 ) ( ON ?auto_170689 ?auto_170690 ) ( ON ?auto_170688 ?auto_170689 ) ( ON ?auto_170687 ?auto_170688 ) ( CLEAR ?auto_170687 ) ( HOLDING ?auto_170686 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170686 )
      ( MAKE-8PILE ?auto_170686 ?auto_170687 ?auto_170688 ?auto_170689 ?auto_170690 ?auto_170691 ?auto_170692 ?auto_170693 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170694 - BLOCK
      ?auto_170695 - BLOCK
      ?auto_170696 - BLOCK
      ?auto_170697 - BLOCK
      ?auto_170698 - BLOCK
      ?auto_170699 - BLOCK
      ?auto_170700 - BLOCK
      ?auto_170701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170694 ?auto_170695 ) ) ( not ( = ?auto_170694 ?auto_170696 ) ) ( not ( = ?auto_170694 ?auto_170697 ) ) ( not ( = ?auto_170694 ?auto_170698 ) ) ( not ( = ?auto_170694 ?auto_170699 ) ) ( not ( = ?auto_170694 ?auto_170700 ) ) ( not ( = ?auto_170694 ?auto_170701 ) ) ( not ( = ?auto_170695 ?auto_170696 ) ) ( not ( = ?auto_170695 ?auto_170697 ) ) ( not ( = ?auto_170695 ?auto_170698 ) ) ( not ( = ?auto_170695 ?auto_170699 ) ) ( not ( = ?auto_170695 ?auto_170700 ) ) ( not ( = ?auto_170695 ?auto_170701 ) ) ( not ( = ?auto_170696 ?auto_170697 ) ) ( not ( = ?auto_170696 ?auto_170698 ) ) ( not ( = ?auto_170696 ?auto_170699 ) ) ( not ( = ?auto_170696 ?auto_170700 ) ) ( not ( = ?auto_170696 ?auto_170701 ) ) ( not ( = ?auto_170697 ?auto_170698 ) ) ( not ( = ?auto_170697 ?auto_170699 ) ) ( not ( = ?auto_170697 ?auto_170700 ) ) ( not ( = ?auto_170697 ?auto_170701 ) ) ( not ( = ?auto_170698 ?auto_170699 ) ) ( not ( = ?auto_170698 ?auto_170700 ) ) ( not ( = ?auto_170698 ?auto_170701 ) ) ( not ( = ?auto_170699 ?auto_170700 ) ) ( not ( = ?auto_170699 ?auto_170701 ) ) ( not ( = ?auto_170700 ?auto_170701 ) ) ( ON-TABLE ?auto_170701 ) ( ON ?auto_170700 ?auto_170701 ) ( ON ?auto_170699 ?auto_170700 ) ( ON ?auto_170698 ?auto_170699 ) ( ON ?auto_170697 ?auto_170698 ) ( ON ?auto_170696 ?auto_170697 ) ( ON ?auto_170695 ?auto_170696 ) ( ON ?auto_170694 ?auto_170695 ) ( CLEAR ?auto_170694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170701 ?auto_170700 ?auto_170699 ?auto_170698 ?auto_170697 ?auto_170696 ?auto_170695 )
      ( MAKE-8PILE ?auto_170694 ?auto_170695 ?auto_170696 ?auto_170697 ?auto_170698 ?auto_170699 ?auto_170700 ?auto_170701 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170702 - BLOCK
      ?auto_170703 - BLOCK
      ?auto_170704 - BLOCK
      ?auto_170705 - BLOCK
      ?auto_170706 - BLOCK
      ?auto_170707 - BLOCK
      ?auto_170708 - BLOCK
      ?auto_170709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170702 ?auto_170703 ) ) ( not ( = ?auto_170702 ?auto_170704 ) ) ( not ( = ?auto_170702 ?auto_170705 ) ) ( not ( = ?auto_170702 ?auto_170706 ) ) ( not ( = ?auto_170702 ?auto_170707 ) ) ( not ( = ?auto_170702 ?auto_170708 ) ) ( not ( = ?auto_170702 ?auto_170709 ) ) ( not ( = ?auto_170703 ?auto_170704 ) ) ( not ( = ?auto_170703 ?auto_170705 ) ) ( not ( = ?auto_170703 ?auto_170706 ) ) ( not ( = ?auto_170703 ?auto_170707 ) ) ( not ( = ?auto_170703 ?auto_170708 ) ) ( not ( = ?auto_170703 ?auto_170709 ) ) ( not ( = ?auto_170704 ?auto_170705 ) ) ( not ( = ?auto_170704 ?auto_170706 ) ) ( not ( = ?auto_170704 ?auto_170707 ) ) ( not ( = ?auto_170704 ?auto_170708 ) ) ( not ( = ?auto_170704 ?auto_170709 ) ) ( not ( = ?auto_170705 ?auto_170706 ) ) ( not ( = ?auto_170705 ?auto_170707 ) ) ( not ( = ?auto_170705 ?auto_170708 ) ) ( not ( = ?auto_170705 ?auto_170709 ) ) ( not ( = ?auto_170706 ?auto_170707 ) ) ( not ( = ?auto_170706 ?auto_170708 ) ) ( not ( = ?auto_170706 ?auto_170709 ) ) ( not ( = ?auto_170707 ?auto_170708 ) ) ( not ( = ?auto_170707 ?auto_170709 ) ) ( not ( = ?auto_170708 ?auto_170709 ) ) ( ON-TABLE ?auto_170709 ) ( ON ?auto_170708 ?auto_170709 ) ( ON ?auto_170707 ?auto_170708 ) ( ON ?auto_170706 ?auto_170707 ) ( ON ?auto_170705 ?auto_170706 ) ( ON ?auto_170704 ?auto_170705 ) ( ON ?auto_170703 ?auto_170704 ) ( HOLDING ?auto_170702 ) ( CLEAR ?auto_170703 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170709 ?auto_170708 ?auto_170707 ?auto_170706 ?auto_170705 ?auto_170704 ?auto_170703 ?auto_170702 )
      ( MAKE-8PILE ?auto_170702 ?auto_170703 ?auto_170704 ?auto_170705 ?auto_170706 ?auto_170707 ?auto_170708 ?auto_170709 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170710 - BLOCK
      ?auto_170711 - BLOCK
      ?auto_170712 - BLOCK
      ?auto_170713 - BLOCK
      ?auto_170714 - BLOCK
      ?auto_170715 - BLOCK
      ?auto_170716 - BLOCK
      ?auto_170717 - BLOCK
    )
    :vars
    (
      ?auto_170718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170710 ?auto_170711 ) ) ( not ( = ?auto_170710 ?auto_170712 ) ) ( not ( = ?auto_170710 ?auto_170713 ) ) ( not ( = ?auto_170710 ?auto_170714 ) ) ( not ( = ?auto_170710 ?auto_170715 ) ) ( not ( = ?auto_170710 ?auto_170716 ) ) ( not ( = ?auto_170710 ?auto_170717 ) ) ( not ( = ?auto_170711 ?auto_170712 ) ) ( not ( = ?auto_170711 ?auto_170713 ) ) ( not ( = ?auto_170711 ?auto_170714 ) ) ( not ( = ?auto_170711 ?auto_170715 ) ) ( not ( = ?auto_170711 ?auto_170716 ) ) ( not ( = ?auto_170711 ?auto_170717 ) ) ( not ( = ?auto_170712 ?auto_170713 ) ) ( not ( = ?auto_170712 ?auto_170714 ) ) ( not ( = ?auto_170712 ?auto_170715 ) ) ( not ( = ?auto_170712 ?auto_170716 ) ) ( not ( = ?auto_170712 ?auto_170717 ) ) ( not ( = ?auto_170713 ?auto_170714 ) ) ( not ( = ?auto_170713 ?auto_170715 ) ) ( not ( = ?auto_170713 ?auto_170716 ) ) ( not ( = ?auto_170713 ?auto_170717 ) ) ( not ( = ?auto_170714 ?auto_170715 ) ) ( not ( = ?auto_170714 ?auto_170716 ) ) ( not ( = ?auto_170714 ?auto_170717 ) ) ( not ( = ?auto_170715 ?auto_170716 ) ) ( not ( = ?auto_170715 ?auto_170717 ) ) ( not ( = ?auto_170716 ?auto_170717 ) ) ( ON-TABLE ?auto_170717 ) ( ON ?auto_170716 ?auto_170717 ) ( ON ?auto_170715 ?auto_170716 ) ( ON ?auto_170714 ?auto_170715 ) ( ON ?auto_170713 ?auto_170714 ) ( ON ?auto_170712 ?auto_170713 ) ( ON ?auto_170711 ?auto_170712 ) ( CLEAR ?auto_170711 ) ( ON ?auto_170710 ?auto_170718 ) ( CLEAR ?auto_170710 ) ( HAND-EMPTY ) ( not ( = ?auto_170710 ?auto_170718 ) ) ( not ( = ?auto_170711 ?auto_170718 ) ) ( not ( = ?auto_170712 ?auto_170718 ) ) ( not ( = ?auto_170713 ?auto_170718 ) ) ( not ( = ?auto_170714 ?auto_170718 ) ) ( not ( = ?auto_170715 ?auto_170718 ) ) ( not ( = ?auto_170716 ?auto_170718 ) ) ( not ( = ?auto_170717 ?auto_170718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170710 ?auto_170718 )
      ( MAKE-8PILE ?auto_170710 ?auto_170711 ?auto_170712 ?auto_170713 ?auto_170714 ?auto_170715 ?auto_170716 ?auto_170717 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170719 - BLOCK
      ?auto_170720 - BLOCK
      ?auto_170721 - BLOCK
      ?auto_170722 - BLOCK
      ?auto_170723 - BLOCK
      ?auto_170724 - BLOCK
      ?auto_170725 - BLOCK
      ?auto_170726 - BLOCK
    )
    :vars
    (
      ?auto_170727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170719 ?auto_170720 ) ) ( not ( = ?auto_170719 ?auto_170721 ) ) ( not ( = ?auto_170719 ?auto_170722 ) ) ( not ( = ?auto_170719 ?auto_170723 ) ) ( not ( = ?auto_170719 ?auto_170724 ) ) ( not ( = ?auto_170719 ?auto_170725 ) ) ( not ( = ?auto_170719 ?auto_170726 ) ) ( not ( = ?auto_170720 ?auto_170721 ) ) ( not ( = ?auto_170720 ?auto_170722 ) ) ( not ( = ?auto_170720 ?auto_170723 ) ) ( not ( = ?auto_170720 ?auto_170724 ) ) ( not ( = ?auto_170720 ?auto_170725 ) ) ( not ( = ?auto_170720 ?auto_170726 ) ) ( not ( = ?auto_170721 ?auto_170722 ) ) ( not ( = ?auto_170721 ?auto_170723 ) ) ( not ( = ?auto_170721 ?auto_170724 ) ) ( not ( = ?auto_170721 ?auto_170725 ) ) ( not ( = ?auto_170721 ?auto_170726 ) ) ( not ( = ?auto_170722 ?auto_170723 ) ) ( not ( = ?auto_170722 ?auto_170724 ) ) ( not ( = ?auto_170722 ?auto_170725 ) ) ( not ( = ?auto_170722 ?auto_170726 ) ) ( not ( = ?auto_170723 ?auto_170724 ) ) ( not ( = ?auto_170723 ?auto_170725 ) ) ( not ( = ?auto_170723 ?auto_170726 ) ) ( not ( = ?auto_170724 ?auto_170725 ) ) ( not ( = ?auto_170724 ?auto_170726 ) ) ( not ( = ?auto_170725 ?auto_170726 ) ) ( ON-TABLE ?auto_170726 ) ( ON ?auto_170725 ?auto_170726 ) ( ON ?auto_170724 ?auto_170725 ) ( ON ?auto_170723 ?auto_170724 ) ( ON ?auto_170722 ?auto_170723 ) ( ON ?auto_170721 ?auto_170722 ) ( ON ?auto_170719 ?auto_170727 ) ( CLEAR ?auto_170719 ) ( not ( = ?auto_170719 ?auto_170727 ) ) ( not ( = ?auto_170720 ?auto_170727 ) ) ( not ( = ?auto_170721 ?auto_170727 ) ) ( not ( = ?auto_170722 ?auto_170727 ) ) ( not ( = ?auto_170723 ?auto_170727 ) ) ( not ( = ?auto_170724 ?auto_170727 ) ) ( not ( = ?auto_170725 ?auto_170727 ) ) ( not ( = ?auto_170726 ?auto_170727 ) ) ( HOLDING ?auto_170720 ) ( CLEAR ?auto_170721 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170726 ?auto_170725 ?auto_170724 ?auto_170723 ?auto_170722 ?auto_170721 ?auto_170720 )
      ( MAKE-8PILE ?auto_170719 ?auto_170720 ?auto_170721 ?auto_170722 ?auto_170723 ?auto_170724 ?auto_170725 ?auto_170726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170728 - BLOCK
      ?auto_170729 - BLOCK
      ?auto_170730 - BLOCK
      ?auto_170731 - BLOCK
      ?auto_170732 - BLOCK
      ?auto_170733 - BLOCK
      ?auto_170734 - BLOCK
      ?auto_170735 - BLOCK
    )
    :vars
    (
      ?auto_170736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170728 ?auto_170729 ) ) ( not ( = ?auto_170728 ?auto_170730 ) ) ( not ( = ?auto_170728 ?auto_170731 ) ) ( not ( = ?auto_170728 ?auto_170732 ) ) ( not ( = ?auto_170728 ?auto_170733 ) ) ( not ( = ?auto_170728 ?auto_170734 ) ) ( not ( = ?auto_170728 ?auto_170735 ) ) ( not ( = ?auto_170729 ?auto_170730 ) ) ( not ( = ?auto_170729 ?auto_170731 ) ) ( not ( = ?auto_170729 ?auto_170732 ) ) ( not ( = ?auto_170729 ?auto_170733 ) ) ( not ( = ?auto_170729 ?auto_170734 ) ) ( not ( = ?auto_170729 ?auto_170735 ) ) ( not ( = ?auto_170730 ?auto_170731 ) ) ( not ( = ?auto_170730 ?auto_170732 ) ) ( not ( = ?auto_170730 ?auto_170733 ) ) ( not ( = ?auto_170730 ?auto_170734 ) ) ( not ( = ?auto_170730 ?auto_170735 ) ) ( not ( = ?auto_170731 ?auto_170732 ) ) ( not ( = ?auto_170731 ?auto_170733 ) ) ( not ( = ?auto_170731 ?auto_170734 ) ) ( not ( = ?auto_170731 ?auto_170735 ) ) ( not ( = ?auto_170732 ?auto_170733 ) ) ( not ( = ?auto_170732 ?auto_170734 ) ) ( not ( = ?auto_170732 ?auto_170735 ) ) ( not ( = ?auto_170733 ?auto_170734 ) ) ( not ( = ?auto_170733 ?auto_170735 ) ) ( not ( = ?auto_170734 ?auto_170735 ) ) ( ON-TABLE ?auto_170735 ) ( ON ?auto_170734 ?auto_170735 ) ( ON ?auto_170733 ?auto_170734 ) ( ON ?auto_170732 ?auto_170733 ) ( ON ?auto_170731 ?auto_170732 ) ( ON ?auto_170730 ?auto_170731 ) ( ON ?auto_170728 ?auto_170736 ) ( not ( = ?auto_170728 ?auto_170736 ) ) ( not ( = ?auto_170729 ?auto_170736 ) ) ( not ( = ?auto_170730 ?auto_170736 ) ) ( not ( = ?auto_170731 ?auto_170736 ) ) ( not ( = ?auto_170732 ?auto_170736 ) ) ( not ( = ?auto_170733 ?auto_170736 ) ) ( not ( = ?auto_170734 ?auto_170736 ) ) ( not ( = ?auto_170735 ?auto_170736 ) ) ( CLEAR ?auto_170730 ) ( ON ?auto_170729 ?auto_170728 ) ( CLEAR ?auto_170729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170736 ?auto_170728 )
      ( MAKE-8PILE ?auto_170728 ?auto_170729 ?auto_170730 ?auto_170731 ?auto_170732 ?auto_170733 ?auto_170734 ?auto_170735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170737 - BLOCK
      ?auto_170738 - BLOCK
      ?auto_170739 - BLOCK
      ?auto_170740 - BLOCK
      ?auto_170741 - BLOCK
      ?auto_170742 - BLOCK
      ?auto_170743 - BLOCK
      ?auto_170744 - BLOCK
    )
    :vars
    (
      ?auto_170745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170737 ?auto_170738 ) ) ( not ( = ?auto_170737 ?auto_170739 ) ) ( not ( = ?auto_170737 ?auto_170740 ) ) ( not ( = ?auto_170737 ?auto_170741 ) ) ( not ( = ?auto_170737 ?auto_170742 ) ) ( not ( = ?auto_170737 ?auto_170743 ) ) ( not ( = ?auto_170737 ?auto_170744 ) ) ( not ( = ?auto_170738 ?auto_170739 ) ) ( not ( = ?auto_170738 ?auto_170740 ) ) ( not ( = ?auto_170738 ?auto_170741 ) ) ( not ( = ?auto_170738 ?auto_170742 ) ) ( not ( = ?auto_170738 ?auto_170743 ) ) ( not ( = ?auto_170738 ?auto_170744 ) ) ( not ( = ?auto_170739 ?auto_170740 ) ) ( not ( = ?auto_170739 ?auto_170741 ) ) ( not ( = ?auto_170739 ?auto_170742 ) ) ( not ( = ?auto_170739 ?auto_170743 ) ) ( not ( = ?auto_170739 ?auto_170744 ) ) ( not ( = ?auto_170740 ?auto_170741 ) ) ( not ( = ?auto_170740 ?auto_170742 ) ) ( not ( = ?auto_170740 ?auto_170743 ) ) ( not ( = ?auto_170740 ?auto_170744 ) ) ( not ( = ?auto_170741 ?auto_170742 ) ) ( not ( = ?auto_170741 ?auto_170743 ) ) ( not ( = ?auto_170741 ?auto_170744 ) ) ( not ( = ?auto_170742 ?auto_170743 ) ) ( not ( = ?auto_170742 ?auto_170744 ) ) ( not ( = ?auto_170743 ?auto_170744 ) ) ( ON-TABLE ?auto_170744 ) ( ON ?auto_170743 ?auto_170744 ) ( ON ?auto_170742 ?auto_170743 ) ( ON ?auto_170741 ?auto_170742 ) ( ON ?auto_170740 ?auto_170741 ) ( ON ?auto_170737 ?auto_170745 ) ( not ( = ?auto_170737 ?auto_170745 ) ) ( not ( = ?auto_170738 ?auto_170745 ) ) ( not ( = ?auto_170739 ?auto_170745 ) ) ( not ( = ?auto_170740 ?auto_170745 ) ) ( not ( = ?auto_170741 ?auto_170745 ) ) ( not ( = ?auto_170742 ?auto_170745 ) ) ( not ( = ?auto_170743 ?auto_170745 ) ) ( not ( = ?auto_170744 ?auto_170745 ) ) ( ON ?auto_170738 ?auto_170737 ) ( CLEAR ?auto_170738 ) ( ON-TABLE ?auto_170745 ) ( HOLDING ?auto_170739 ) ( CLEAR ?auto_170740 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170744 ?auto_170743 ?auto_170742 ?auto_170741 ?auto_170740 ?auto_170739 )
      ( MAKE-8PILE ?auto_170737 ?auto_170738 ?auto_170739 ?auto_170740 ?auto_170741 ?auto_170742 ?auto_170743 ?auto_170744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170746 - BLOCK
      ?auto_170747 - BLOCK
      ?auto_170748 - BLOCK
      ?auto_170749 - BLOCK
      ?auto_170750 - BLOCK
      ?auto_170751 - BLOCK
      ?auto_170752 - BLOCK
      ?auto_170753 - BLOCK
    )
    :vars
    (
      ?auto_170754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170746 ?auto_170747 ) ) ( not ( = ?auto_170746 ?auto_170748 ) ) ( not ( = ?auto_170746 ?auto_170749 ) ) ( not ( = ?auto_170746 ?auto_170750 ) ) ( not ( = ?auto_170746 ?auto_170751 ) ) ( not ( = ?auto_170746 ?auto_170752 ) ) ( not ( = ?auto_170746 ?auto_170753 ) ) ( not ( = ?auto_170747 ?auto_170748 ) ) ( not ( = ?auto_170747 ?auto_170749 ) ) ( not ( = ?auto_170747 ?auto_170750 ) ) ( not ( = ?auto_170747 ?auto_170751 ) ) ( not ( = ?auto_170747 ?auto_170752 ) ) ( not ( = ?auto_170747 ?auto_170753 ) ) ( not ( = ?auto_170748 ?auto_170749 ) ) ( not ( = ?auto_170748 ?auto_170750 ) ) ( not ( = ?auto_170748 ?auto_170751 ) ) ( not ( = ?auto_170748 ?auto_170752 ) ) ( not ( = ?auto_170748 ?auto_170753 ) ) ( not ( = ?auto_170749 ?auto_170750 ) ) ( not ( = ?auto_170749 ?auto_170751 ) ) ( not ( = ?auto_170749 ?auto_170752 ) ) ( not ( = ?auto_170749 ?auto_170753 ) ) ( not ( = ?auto_170750 ?auto_170751 ) ) ( not ( = ?auto_170750 ?auto_170752 ) ) ( not ( = ?auto_170750 ?auto_170753 ) ) ( not ( = ?auto_170751 ?auto_170752 ) ) ( not ( = ?auto_170751 ?auto_170753 ) ) ( not ( = ?auto_170752 ?auto_170753 ) ) ( ON-TABLE ?auto_170753 ) ( ON ?auto_170752 ?auto_170753 ) ( ON ?auto_170751 ?auto_170752 ) ( ON ?auto_170750 ?auto_170751 ) ( ON ?auto_170749 ?auto_170750 ) ( ON ?auto_170746 ?auto_170754 ) ( not ( = ?auto_170746 ?auto_170754 ) ) ( not ( = ?auto_170747 ?auto_170754 ) ) ( not ( = ?auto_170748 ?auto_170754 ) ) ( not ( = ?auto_170749 ?auto_170754 ) ) ( not ( = ?auto_170750 ?auto_170754 ) ) ( not ( = ?auto_170751 ?auto_170754 ) ) ( not ( = ?auto_170752 ?auto_170754 ) ) ( not ( = ?auto_170753 ?auto_170754 ) ) ( ON ?auto_170747 ?auto_170746 ) ( ON-TABLE ?auto_170754 ) ( CLEAR ?auto_170749 ) ( ON ?auto_170748 ?auto_170747 ) ( CLEAR ?auto_170748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170754 ?auto_170746 ?auto_170747 )
      ( MAKE-8PILE ?auto_170746 ?auto_170747 ?auto_170748 ?auto_170749 ?auto_170750 ?auto_170751 ?auto_170752 ?auto_170753 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170755 - BLOCK
      ?auto_170756 - BLOCK
      ?auto_170757 - BLOCK
      ?auto_170758 - BLOCK
      ?auto_170759 - BLOCK
      ?auto_170760 - BLOCK
      ?auto_170761 - BLOCK
      ?auto_170762 - BLOCK
    )
    :vars
    (
      ?auto_170763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170755 ?auto_170756 ) ) ( not ( = ?auto_170755 ?auto_170757 ) ) ( not ( = ?auto_170755 ?auto_170758 ) ) ( not ( = ?auto_170755 ?auto_170759 ) ) ( not ( = ?auto_170755 ?auto_170760 ) ) ( not ( = ?auto_170755 ?auto_170761 ) ) ( not ( = ?auto_170755 ?auto_170762 ) ) ( not ( = ?auto_170756 ?auto_170757 ) ) ( not ( = ?auto_170756 ?auto_170758 ) ) ( not ( = ?auto_170756 ?auto_170759 ) ) ( not ( = ?auto_170756 ?auto_170760 ) ) ( not ( = ?auto_170756 ?auto_170761 ) ) ( not ( = ?auto_170756 ?auto_170762 ) ) ( not ( = ?auto_170757 ?auto_170758 ) ) ( not ( = ?auto_170757 ?auto_170759 ) ) ( not ( = ?auto_170757 ?auto_170760 ) ) ( not ( = ?auto_170757 ?auto_170761 ) ) ( not ( = ?auto_170757 ?auto_170762 ) ) ( not ( = ?auto_170758 ?auto_170759 ) ) ( not ( = ?auto_170758 ?auto_170760 ) ) ( not ( = ?auto_170758 ?auto_170761 ) ) ( not ( = ?auto_170758 ?auto_170762 ) ) ( not ( = ?auto_170759 ?auto_170760 ) ) ( not ( = ?auto_170759 ?auto_170761 ) ) ( not ( = ?auto_170759 ?auto_170762 ) ) ( not ( = ?auto_170760 ?auto_170761 ) ) ( not ( = ?auto_170760 ?auto_170762 ) ) ( not ( = ?auto_170761 ?auto_170762 ) ) ( ON-TABLE ?auto_170762 ) ( ON ?auto_170761 ?auto_170762 ) ( ON ?auto_170760 ?auto_170761 ) ( ON ?auto_170759 ?auto_170760 ) ( ON ?auto_170755 ?auto_170763 ) ( not ( = ?auto_170755 ?auto_170763 ) ) ( not ( = ?auto_170756 ?auto_170763 ) ) ( not ( = ?auto_170757 ?auto_170763 ) ) ( not ( = ?auto_170758 ?auto_170763 ) ) ( not ( = ?auto_170759 ?auto_170763 ) ) ( not ( = ?auto_170760 ?auto_170763 ) ) ( not ( = ?auto_170761 ?auto_170763 ) ) ( not ( = ?auto_170762 ?auto_170763 ) ) ( ON ?auto_170756 ?auto_170755 ) ( ON-TABLE ?auto_170763 ) ( ON ?auto_170757 ?auto_170756 ) ( CLEAR ?auto_170757 ) ( HOLDING ?auto_170758 ) ( CLEAR ?auto_170759 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170762 ?auto_170761 ?auto_170760 ?auto_170759 ?auto_170758 )
      ( MAKE-8PILE ?auto_170755 ?auto_170756 ?auto_170757 ?auto_170758 ?auto_170759 ?auto_170760 ?auto_170761 ?auto_170762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170764 - BLOCK
      ?auto_170765 - BLOCK
      ?auto_170766 - BLOCK
      ?auto_170767 - BLOCK
      ?auto_170768 - BLOCK
      ?auto_170769 - BLOCK
      ?auto_170770 - BLOCK
      ?auto_170771 - BLOCK
    )
    :vars
    (
      ?auto_170772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170764 ?auto_170765 ) ) ( not ( = ?auto_170764 ?auto_170766 ) ) ( not ( = ?auto_170764 ?auto_170767 ) ) ( not ( = ?auto_170764 ?auto_170768 ) ) ( not ( = ?auto_170764 ?auto_170769 ) ) ( not ( = ?auto_170764 ?auto_170770 ) ) ( not ( = ?auto_170764 ?auto_170771 ) ) ( not ( = ?auto_170765 ?auto_170766 ) ) ( not ( = ?auto_170765 ?auto_170767 ) ) ( not ( = ?auto_170765 ?auto_170768 ) ) ( not ( = ?auto_170765 ?auto_170769 ) ) ( not ( = ?auto_170765 ?auto_170770 ) ) ( not ( = ?auto_170765 ?auto_170771 ) ) ( not ( = ?auto_170766 ?auto_170767 ) ) ( not ( = ?auto_170766 ?auto_170768 ) ) ( not ( = ?auto_170766 ?auto_170769 ) ) ( not ( = ?auto_170766 ?auto_170770 ) ) ( not ( = ?auto_170766 ?auto_170771 ) ) ( not ( = ?auto_170767 ?auto_170768 ) ) ( not ( = ?auto_170767 ?auto_170769 ) ) ( not ( = ?auto_170767 ?auto_170770 ) ) ( not ( = ?auto_170767 ?auto_170771 ) ) ( not ( = ?auto_170768 ?auto_170769 ) ) ( not ( = ?auto_170768 ?auto_170770 ) ) ( not ( = ?auto_170768 ?auto_170771 ) ) ( not ( = ?auto_170769 ?auto_170770 ) ) ( not ( = ?auto_170769 ?auto_170771 ) ) ( not ( = ?auto_170770 ?auto_170771 ) ) ( ON-TABLE ?auto_170771 ) ( ON ?auto_170770 ?auto_170771 ) ( ON ?auto_170769 ?auto_170770 ) ( ON ?auto_170768 ?auto_170769 ) ( ON ?auto_170764 ?auto_170772 ) ( not ( = ?auto_170764 ?auto_170772 ) ) ( not ( = ?auto_170765 ?auto_170772 ) ) ( not ( = ?auto_170766 ?auto_170772 ) ) ( not ( = ?auto_170767 ?auto_170772 ) ) ( not ( = ?auto_170768 ?auto_170772 ) ) ( not ( = ?auto_170769 ?auto_170772 ) ) ( not ( = ?auto_170770 ?auto_170772 ) ) ( not ( = ?auto_170771 ?auto_170772 ) ) ( ON ?auto_170765 ?auto_170764 ) ( ON-TABLE ?auto_170772 ) ( ON ?auto_170766 ?auto_170765 ) ( CLEAR ?auto_170768 ) ( ON ?auto_170767 ?auto_170766 ) ( CLEAR ?auto_170767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170772 ?auto_170764 ?auto_170765 ?auto_170766 )
      ( MAKE-8PILE ?auto_170764 ?auto_170765 ?auto_170766 ?auto_170767 ?auto_170768 ?auto_170769 ?auto_170770 ?auto_170771 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170773 - BLOCK
      ?auto_170774 - BLOCK
      ?auto_170775 - BLOCK
      ?auto_170776 - BLOCK
      ?auto_170777 - BLOCK
      ?auto_170778 - BLOCK
      ?auto_170779 - BLOCK
      ?auto_170780 - BLOCK
    )
    :vars
    (
      ?auto_170781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170773 ?auto_170774 ) ) ( not ( = ?auto_170773 ?auto_170775 ) ) ( not ( = ?auto_170773 ?auto_170776 ) ) ( not ( = ?auto_170773 ?auto_170777 ) ) ( not ( = ?auto_170773 ?auto_170778 ) ) ( not ( = ?auto_170773 ?auto_170779 ) ) ( not ( = ?auto_170773 ?auto_170780 ) ) ( not ( = ?auto_170774 ?auto_170775 ) ) ( not ( = ?auto_170774 ?auto_170776 ) ) ( not ( = ?auto_170774 ?auto_170777 ) ) ( not ( = ?auto_170774 ?auto_170778 ) ) ( not ( = ?auto_170774 ?auto_170779 ) ) ( not ( = ?auto_170774 ?auto_170780 ) ) ( not ( = ?auto_170775 ?auto_170776 ) ) ( not ( = ?auto_170775 ?auto_170777 ) ) ( not ( = ?auto_170775 ?auto_170778 ) ) ( not ( = ?auto_170775 ?auto_170779 ) ) ( not ( = ?auto_170775 ?auto_170780 ) ) ( not ( = ?auto_170776 ?auto_170777 ) ) ( not ( = ?auto_170776 ?auto_170778 ) ) ( not ( = ?auto_170776 ?auto_170779 ) ) ( not ( = ?auto_170776 ?auto_170780 ) ) ( not ( = ?auto_170777 ?auto_170778 ) ) ( not ( = ?auto_170777 ?auto_170779 ) ) ( not ( = ?auto_170777 ?auto_170780 ) ) ( not ( = ?auto_170778 ?auto_170779 ) ) ( not ( = ?auto_170778 ?auto_170780 ) ) ( not ( = ?auto_170779 ?auto_170780 ) ) ( ON-TABLE ?auto_170780 ) ( ON ?auto_170779 ?auto_170780 ) ( ON ?auto_170778 ?auto_170779 ) ( ON ?auto_170773 ?auto_170781 ) ( not ( = ?auto_170773 ?auto_170781 ) ) ( not ( = ?auto_170774 ?auto_170781 ) ) ( not ( = ?auto_170775 ?auto_170781 ) ) ( not ( = ?auto_170776 ?auto_170781 ) ) ( not ( = ?auto_170777 ?auto_170781 ) ) ( not ( = ?auto_170778 ?auto_170781 ) ) ( not ( = ?auto_170779 ?auto_170781 ) ) ( not ( = ?auto_170780 ?auto_170781 ) ) ( ON ?auto_170774 ?auto_170773 ) ( ON-TABLE ?auto_170781 ) ( ON ?auto_170775 ?auto_170774 ) ( ON ?auto_170776 ?auto_170775 ) ( CLEAR ?auto_170776 ) ( HOLDING ?auto_170777 ) ( CLEAR ?auto_170778 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170780 ?auto_170779 ?auto_170778 ?auto_170777 )
      ( MAKE-8PILE ?auto_170773 ?auto_170774 ?auto_170775 ?auto_170776 ?auto_170777 ?auto_170778 ?auto_170779 ?auto_170780 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170782 - BLOCK
      ?auto_170783 - BLOCK
      ?auto_170784 - BLOCK
      ?auto_170785 - BLOCK
      ?auto_170786 - BLOCK
      ?auto_170787 - BLOCK
      ?auto_170788 - BLOCK
      ?auto_170789 - BLOCK
    )
    :vars
    (
      ?auto_170790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170782 ?auto_170783 ) ) ( not ( = ?auto_170782 ?auto_170784 ) ) ( not ( = ?auto_170782 ?auto_170785 ) ) ( not ( = ?auto_170782 ?auto_170786 ) ) ( not ( = ?auto_170782 ?auto_170787 ) ) ( not ( = ?auto_170782 ?auto_170788 ) ) ( not ( = ?auto_170782 ?auto_170789 ) ) ( not ( = ?auto_170783 ?auto_170784 ) ) ( not ( = ?auto_170783 ?auto_170785 ) ) ( not ( = ?auto_170783 ?auto_170786 ) ) ( not ( = ?auto_170783 ?auto_170787 ) ) ( not ( = ?auto_170783 ?auto_170788 ) ) ( not ( = ?auto_170783 ?auto_170789 ) ) ( not ( = ?auto_170784 ?auto_170785 ) ) ( not ( = ?auto_170784 ?auto_170786 ) ) ( not ( = ?auto_170784 ?auto_170787 ) ) ( not ( = ?auto_170784 ?auto_170788 ) ) ( not ( = ?auto_170784 ?auto_170789 ) ) ( not ( = ?auto_170785 ?auto_170786 ) ) ( not ( = ?auto_170785 ?auto_170787 ) ) ( not ( = ?auto_170785 ?auto_170788 ) ) ( not ( = ?auto_170785 ?auto_170789 ) ) ( not ( = ?auto_170786 ?auto_170787 ) ) ( not ( = ?auto_170786 ?auto_170788 ) ) ( not ( = ?auto_170786 ?auto_170789 ) ) ( not ( = ?auto_170787 ?auto_170788 ) ) ( not ( = ?auto_170787 ?auto_170789 ) ) ( not ( = ?auto_170788 ?auto_170789 ) ) ( ON-TABLE ?auto_170789 ) ( ON ?auto_170788 ?auto_170789 ) ( ON ?auto_170787 ?auto_170788 ) ( ON ?auto_170782 ?auto_170790 ) ( not ( = ?auto_170782 ?auto_170790 ) ) ( not ( = ?auto_170783 ?auto_170790 ) ) ( not ( = ?auto_170784 ?auto_170790 ) ) ( not ( = ?auto_170785 ?auto_170790 ) ) ( not ( = ?auto_170786 ?auto_170790 ) ) ( not ( = ?auto_170787 ?auto_170790 ) ) ( not ( = ?auto_170788 ?auto_170790 ) ) ( not ( = ?auto_170789 ?auto_170790 ) ) ( ON ?auto_170783 ?auto_170782 ) ( ON-TABLE ?auto_170790 ) ( ON ?auto_170784 ?auto_170783 ) ( ON ?auto_170785 ?auto_170784 ) ( CLEAR ?auto_170787 ) ( ON ?auto_170786 ?auto_170785 ) ( CLEAR ?auto_170786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170790 ?auto_170782 ?auto_170783 ?auto_170784 ?auto_170785 )
      ( MAKE-8PILE ?auto_170782 ?auto_170783 ?auto_170784 ?auto_170785 ?auto_170786 ?auto_170787 ?auto_170788 ?auto_170789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170791 - BLOCK
      ?auto_170792 - BLOCK
      ?auto_170793 - BLOCK
      ?auto_170794 - BLOCK
      ?auto_170795 - BLOCK
      ?auto_170796 - BLOCK
      ?auto_170797 - BLOCK
      ?auto_170798 - BLOCK
    )
    :vars
    (
      ?auto_170799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170791 ?auto_170792 ) ) ( not ( = ?auto_170791 ?auto_170793 ) ) ( not ( = ?auto_170791 ?auto_170794 ) ) ( not ( = ?auto_170791 ?auto_170795 ) ) ( not ( = ?auto_170791 ?auto_170796 ) ) ( not ( = ?auto_170791 ?auto_170797 ) ) ( not ( = ?auto_170791 ?auto_170798 ) ) ( not ( = ?auto_170792 ?auto_170793 ) ) ( not ( = ?auto_170792 ?auto_170794 ) ) ( not ( = ?auto_170792 ?auto_170795 ) ) ( not ( = ?auto_170792 ?auto_170796 ) ) ( not ( = ?auto_170792 ?auto_170797 ) ) ( not ( = ?auto_170792 ?auto_170798 ) ) ( not ( = ?auto_170793 ?auto_170794 ) ) ( not ( = ?auto_170793 ?auto_170795 ) ) ( not ( = ?auto_170793 ?auto_170796 ) ) ( not ( = ?auto_170793 ?auto_170797 ) ) ( not ( = ?auto_170793 ?auto_170798 ) ) ( not ( = ?auto_170794 ?auto_170795 ) ) ( not ( = ?auto_170794 ?auto_170796 ) ) ( not ( = ?auto_170794 ?auto_170797 ) ) ( not ( = ?auto_170794 ?auto_170798 ) ) ( not ( = ?auto_170795 ?auto_170796 ) ) ( not ( = ?auto_170795 ?auto_170797 ) ) ( not ( = ?auto_170795 ?auto_170798 ) ) ( not ( = ?auto_170796 ?auto_170797 ) ) ( not ( = ?auto_170796 ?auto_170798 ) ) ( not ( = ?auto_170797 ?auto_170798 ) ) ( ON-TABLE ?auto_170798 ) ( ON ?auto_170797 ?auto_170798 ) ( ON ?auto_170791 ?auto_170799 ) ( not ( = ?auto_170791 ?auto_170799 ) ) ( not ( = ?auto_170792 ?auto_170799 ) ) ( not ( = ?auto_170793 ?auto_170799 ) ) ( not ( = ?auto_170794 ?auto_170799 ) ) ( not ( = ?auto_170795 ?auto_170799 ) ) ( not ( = ?auto_170796 ?auto_170799 ) ) ( not ( = ?auto_170797 ?auto_170799 ) ) ( not ( = ?auto_170798 ?auto_170799 ) ) ( ON ?auto_170792 ?auto_170791 ) ( ON-TABLE ?auto_170799 ) ( ON ?auto_170793 ?auto_170792 ) ( ON ?auto_170794 ?auto_170793 ) ( ON ?auto_170795 ?auto_170794 ) ( CLEAR ?auto_170795 ) ( HOLDING ?auto_170796 ) ( CLEAR ?auto_170797 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170798 ?auto_170797 ?auto_170796 )
      ( MAKE-8PILE ?auto_170791 ?auto_170792 ?auto_170793 ?auto_170794 ?auto_170795 ?auto_170796 ?auto_170797 ?auto_170798 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170800 - BLOCK
      ?auto_170801 - BLOCK
      ?auto_170802 - BLOCK
      ?auto_170803 - BLOCK
      ?auto_170804 - BLOCK
      ?auto_170805 - BLOCK
      ?auto_170806 - BLOCK
      ?auto_170807 - BLOCK
    )
    :vars
    (
      ?auto_170808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170800 ?auto_170801 ) ) ( not ( = ?auto_170800 ?auto_170802 ) ) ( not ( = ?auto_170800 ?auto_170803 ) ) ( not ( = ?auto_170800 ?auto_170804 ) ) ( not ( = ?auto_170800 ?auto_170805 ) ) ( not ( = ?auto_170800 ?auto_170806 ) ) ( not ( = ?auto_170800 ?auto_170807 ) ) ( not ( = ?auto_170801 ?auto_170802 ) ) ( not ( = ?auto_170801 ?auto_170803 ) ) ( not ( = ?auto_170801 ?auto_170804 ) ) ( not ( = ?auto_170801 ?auto_170805 ) ) ( not ( = ?auto_170801 ?auto_170806 ) ) ( not ( = ?auto_170801 ?auto_170807 ) ) ( not ( = ?auto_170802 ?auto_170803 ) ) ( not ( = ?auto_170802 ?auto_170804 ) ) ( not ( = ?auto_170802 ?auto_170805 ) ) ( not ( = ?auto_170802 ?auto_170806 ) ) ( not ( = ?auto_170802 ?auto_170807 ) ) ( not ( = ?auto_170803 ?auto_170804 ) ) ( not ( = ?auto_170803 ?auto_170805 ) ) ( not ( = ?auto_170803 ?auto_170806 ) ) ( not ( = ?auto_170803 ?auto_170807 ) ) ( not ( = ?auto_170804 ?auto_170805 ) ) ( not ( = ?auto_170804 ?auto_170806 ) ) ( not ( = ?auto_170804 ?auto_170807 ) ) ( not ( = ?auto_170805 ?auto_170806 ) ) ( not ( = ?auto_170805 ?auto_170807 ) ) ( not ( = ?auto_170806 ?auto_170807 ) ) ( ON-TABLE ?auto_170807 ) ( ON ?auto_170806 ?auto_170807 ) ( ON ?auto_170800 ?auto_170808 ) ( not ( = ?auto_170800 ?auto_170808 ) ) ( not ( = ?auto_170801 ?auto_170808 ) ) ( not ( = ?auto_170802 ?auto_170808 ) ) ( not ( = ?auto_170803 ?auto_170808 ) ) ( not ( = ?auto_170804 ?auto_170808 ) ) ( not ( = ?auto_170805 ?auto_170808 ) ) ( not ( = ?auto_170806 ?auto_170808 ) ) ( not ( = ?auto_170807 ?auto_170808 ) ) ( ON ?auto_170801 ?auto_170800 ) ( ON-TABLE ?auto_170808 ) ( ON ?auto_170802 ?auto_170801 ) ( ON ?auto_170803 ?auto_170802 ) ( ON ?auto_170804 ?auto_170803 ) ( CLEAR ?auto_170806 ) ( ON ?auto_170805 ?auto_170804 ) ( CLEAR ?auto_170805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170808 ?auto_170800 ?auto_170801 ?auto_170802 ?auto_170803 ?auto_170804 )
      ( MAKE-8PILE ?auto_170800 ?auto_170801 ?auto_170802 ?auto_170803 ?auto_170804 ?auto_170805 ?auto_170806 ?auto_170807 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170809 - BLOCK
      ?auto_170810 - BLOCK
      ?auto_170811 - BLOCK
      ?auto_170812 - BLOCK
      ?auto_170813 - BLOCK
      ?auto_170814 - BLOCK
      ?auto_170815 - BLOCK
      ?auto_170816 - BLOCK
    )
    :vars
    (
      ?auto_170817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170809 ?auto_170810 ) ) ( not ( = ?auto_170809 ?auto_170811 ) ) ( not ( = ?auto_170809 ?auto_170812 ) ) ( not ( = ?auto_170809 ?auto_170813 ) ) ( not ( = ?auto_170809 ?auto_170814 ) ) ( not ( = ?auto_170809 ?auto_170815 ) ) ( not ( = ?auto_170809 ?auto_170816 ) ) ( not ( = ?auto_170810 ?auto_170811 ) ) ( not ( = ?auto_170810 ?auto_170812 ) ) ( not ( = ?auto_170810 ?auto_170813 ) ) ( not ( = ?auto_170810 ?auto_170814 ) ) ( not ( = ?auto_170810 ?auto_170815 ) ) ( not ( = ?auto_170810 ?auto_170816 ) ) ( not ( = ?auto_170811 ?auto_170812 ) ) ( not ( = ?auto_170811 ?auto_170813 ) ) ( not ( = ?auto_170811 ?auto_170814 ) ) ( not ( = ?auto_170811 ?auto_170815 ) ) ( not ( = ?auto_170811 ?auto_170816 ) ) ( not ( = ?auto_170812 ?auto_170813 ) ) ( not ( = ?auto_170812 ?auto_170814 ) ) ( not ( = ?auto_170812 ?auto_170815 ) ) ( not ( = ?auto_170812 ?auto_170816 ) ) ( not ( = ?auto_170813 ?auto_170814 ) ) ( not ( = ?auto_170813 ?auto_170815 ) ) ( not ( = ?auto_170813 ?auto_170816 ) ) ( not ( = ?auto_170814 ?auto_170815 ) ) ( not ( = ?auto_170814 ?auto_170816 ) ) ( not ( = ?auto_170815 ?auto_170816 ) ) ( ON-TABLE ?auto_170816 ) ( ON ?auto_170809 ?auto_170817 ) ( not ( = ?auto_170809 ?auto_170817 ) ) ( not ( = ?auto_170810 ?auto_170817 ) ) ( not ( = ?auto_170811 ?auto_170817 ) ) ( not ( = ?auto_170812 ?auto_170817 ) ) ( not ( = ?auto_170813 ?auto_170817 ) ) ( not ( = ?auto_170814 ?auto_170817 ) ) ( not ( = ?auto_170815 ?auto_170817 ) ) ( not ( = ?auto_170816 ?auto_170817 ) ) ( ON ?auto_170810 ?auto_170809 ) ( ON-TABLE ?auto_170817 ) ( ON ?auto_170811 ?auto_170810 ) ( ON ?auto_170812 ?auto_170811 ) ( ON ?auto_170813 ?auto_170812 ) ( ON ?auto_170814 ?auto_170813 ) ( CLEAR ?auto_170814 ) ( HOLDING ?auto_170815 ) ( CLEAR ?auto_170816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170816 ?auto_170815 )
      ( MAKE-8PILE ?auto_170809 ?auto_170810 ?auto_170811 ?auto_170812 ?auto_170813 ?auto_170814 ?auto_170815 ?auto_170816 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170818 - BLOCK
      ?auto_170819 - BLOCK
      ?auto_170820 - BLOCK
      ?auto_170821 - BLOCK
      ?auto_170822 - BLOCK
      ?auto_170823 - BLOCK
      ?auto_170824 - BLOCK
      ?auto_170825 - BLOCK
    )
    :vars
    (
      ?auto_170826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170818 ?auto_170819 ) ) ( not ( = ?auto_170818 ?auto_170820 ) ) ( not ( = ?auto_170818 ?auto_170821 ) ) ( not ( = ?auto_170818 ?auto_170822 ) ) ( not ( = ?auto_170818 ?auto_170823 ) ) ( not ( = ?auto_170818 ?auto_170824 ) ) ( not ( = ?auto_170818 ?auto_170825 ) ) ( not ( = ?auto_170819 ?auto_170820 ) ) ( not ( = ?auto_170819 ?auto_170821 ) ) ( not ( = ?auto_170819 ?auto_170822 ) ) ( not ( = ?auto_170819 ?auto_170823 ) ) ( not ( = ?auto_170819 ?auto_170824 ) ) ( not ( = ?auto_170819 ?auto_170825 ) ) ( not ( = ?auto_170820 ?auto_170821 ) ) ( not ( = ?auto_170820 ?auto_170822 ) ) ( not ( = ?auto_170820 ?auto_170823 ) ) ( not ( = ?auto_170820 ?auto_170824 ) ) ( not ( = ?auto_170820 ?auto_170825 ) ) ( not ( = ?auto_170821 ?auto_170822 ) ) ( not ( = ?auto_170821 ?auto_170823 ) ) ( not ( = ?auto_170821 ?auto_170824 ) ) ( not ( = ?auto_170821 ?auto_170825 ) ) ( not ( = ?auto_170822 ?auto_170823 ) ) ( not ( = ?auto_170822 ?auto_170824 ) ) ( not ( = ?auto_170822 ?auto_170825 ) ) ( not ( = ?auto_170823 ?auto_170824 ) ) ( not ( = ?auto_170823 ?auto_170825 ) ) ( not ( = ?auto_170824 ?auto_170825 ) ) ( ON-TABLE ?auto_170825 ) ( ON ?auto_170818 ?auto_170826 ) ( not ( = ?auto_170818 ?auto_170826 ) ) ( not ( = ?auto_170819 ?auto_170826 ) ) ( not ( = ?auto_170820 ?auto_170826 ) ) ( not ( = ?auto_170821 ?auto_170826 ) ) ( not ( = ?auto_170822 ?auto_170826 ) ) ( not ( = ?auto_170823 ?auto_170826 ) ) ( not ( = ?auto_170824 ?auto_170826 ) ) ( not ( = ?auto_170825 ?auto_170826 ) ) ( ON ?auto_170819 ?auto_170818 ) ( ON-TABLE ?auto_170826 ) ( ON ?auto_170820 ?auto_170819 ) ( ON ?auto_170821 ?auto_170820 ) ( ON ?auto_170822 ?auto_170821 ) ( ON ?auto_170823 ?auto_170822 ) ( CLEAR ?auto_170825 ) ( ON ?auto_170824 ?auto_170823 ) ( CLEAR ?auto_170824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170826 ?auto_170818 ?auto_170819 ?auto_170820 ?auto_170821 ?auto_170822 ?auto_170823 )
      ( MAKE-8PILE ?auto_170818 ?auto_170819 ?auto_170820 ?auto_170821 ?auto_170822 ?auto_170823 ?auto_170824 ?auto_170825 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170827 - BLOCK
      ?auto_170828 - BLOCK
      ?auto_170829 - BLOCK
      ?auto_170830 - BLOCK
      ?auto_170831 - BLOCK
      ?auto_170832 - BLOCK
      ?auto_170833 - BLOCK
      ?auto_170834 - BLOCK
    )
    :vars
    (
      ?auto_170835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170827 ?auto_170828 ) ) ( not ( = ?auto_170827 ?auto_170829 ) ) ( not ( = ?auto_170827 ?auto_170830 ) ) ( not ( = ?auto_170827 ?auto_170831 ) ) ( not ( = ?auto_170827 ?auto_170832 ) ) ( not ( = ?auto_170827 ?auto_170833 ) ) ( not ( = ?auto_170827 ?auto_170834 ) ) ( not ( = ?auto_170828 ?auto_170829 ) ) ( not ( = ?auto_170828 ?auto_170830 ) ) ( not ( = ?auto_170828 ?auto_170831 ) ) ( not ( = ?auto_170828 ?auto_170832 ) ) ( not ( = ?auto_170828 ?auto_170833 ) ) ( not ( = ?auto_170828 ?auto_170834 ) ) ( not ( = ?auto_170829 ?auto_170830 ) ) ( not ( = ?auto_170829 ?auto_170831 ) ) ( not ( = ?auto_170829 ?auto_170832 ) ) ( not ( = ?auto_170829 ?auto_170833 ) ) ( not ( = ?auto_170829 ?auto_170834 ) ) ( not ( = ?auto_170830 ?auto_170831 ) ) ( not ( = ?auto_170830 ?auto_170832 ) ) ( not ( = ?auto_170830 ?auto_170833 ) ) ( not ( = ?auto_170830 ?auto_170834 ) ) ( not ( = ?auto_170831 ?auto_170832 ) ) ( not ( = ?auto_170831 ?auto_170833 ) ) ( not ( = ?auto_170831 ?auto_170834 ) ) ( not ( = ?auto_170832 ?auto_170833 ) ) ( not ( = ?auto_170832 ?auto_170834 ) ) ( not ( = ?auto_170833 ?auto_170834 ) ) ( ON ?auto_170827 ?auto_170835 ) ( not ( = ?auto_170827 ?auto_170835 ) ) ( not ( = ?auto_170828 ?auto_170835 ) ) ( not ( = ?auto_170829 ?auto_170835 ) ) ( not ( = ?auto_170830 ?auto_170835 ) ) ( not ( = ?auto_170831 ?auto_170835 ) ) ( not ( = ?auto_170832 ?auto_170835 ) ) ( not ( = ?auto_170833 ?auto_170835 ) ) ( not ( = ?auto_170834 ?auto_170835 ) ) ( ON ?auto_170828 ?auto_170827 ) ( ON-TABLE ?auto_170835 ) ( ON ?auto_170829 ?auto_170828 ) ( ON ?auto_170830 ?auto_170829 ) ( ON ?auto_170831 ?auto_170830 ) ( ON ?auto_170832 ?auto_170831 ) ( ON ?auto_170833 ?auto_170832 ) ( CLEAR ?auto_170833 ) ( HOLDING ?auto_170834 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170834 )
      ( MAKE-8PILE ?auto_170827 ?auto_170828 ?auto_170829 ?auto_170830 ?auto_170831 ?auto_170832 ?auto_170833 ?auto_170834 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170836 - BLOCK
      ?auto_170837 - BLOCK
      ?auto_170838 - BLOCK
      ?auto_170839 - BLOCK
      ?auto_170840 - BLOCK
      ?auto_170841 - BLOCK
      ?auto_170842 - BLOCK
      ?auto_170843 - BLOCK
    )
    :vars
    (
      ?auto_170844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170836 ?auto_170837 ) ) ( not ( = ?auto_170836 ?auto_170838 ) ) ( not ( = ?auto_170836 ?auto_170839 ) ) ( not ( = ?auto_170836 ?auto_170840 ) ) ( not ( = ?auto_170836 ?auto_170841 ) ) ( not ( = ?auto_170836 ?auto_170842 ) ) ( not ( = ?auto_170836 ?auto_170843 ) ) ( not ( = ?auto_170837 ?auto_170838 ) ) ( not ( = ?auto_170837 ?auto_170839 ) ) ( not ( = ?auto_170837 ?auto_170840 ) ) ( not ( = ?auto_170837 ?auto_170841 ) ) ( not ( = ?auto_170837 ?auto_170842 ) ) ( not ( = ?auto_170837 ?auto_170843 ) ) ( not ( = ?auto_170838 ?auto_170839 ) ) ( not ( = ?auto_170838 ?auto_170840 ) ) ( not ( = ?auto_170838 ?auto_170841 ) ) ( not ( = ?auto_170838 ?auto_170842 ) ) ( not ( = ?auto_170838 ?auto_170843 ) ) ( not ( = ?auto_170839 ?auto_170840 ) ) ( not ( = ?auto_170839 ?auto_170841 ) ) ( not ( = ?auto_170839 ?auto_170842 ) ) ( not ( = ?auto_170839 ?auto_170843 ) ) ( not ( = ?auto_170840 ?auto_170841 ) ) ( not ( = ?auto_170840 ?auto_170842 ) ) ( not ( = ?auto_170840 ?auto_170843 ) ) ( not ( = ?auto_170841 ?auto_170842 ) ) ( not ( = ?auto_170841 ?auto_170843 ) ) ( not ( = ?auto_170842 ?auto_170843 ) ) ( ON ?auto_170836 ?auto_170844 ) ( not ( = ?auto_170836 ?auto_170844 ) ) ( not ( = ?auto_170837 ?auto_170844 ) ) ( not ( = ?auto_170838 ?auto_170844 ) ) ( not ( = ?auto_170839 ?auto_170844 ) ) ( not ( = ?auto_170840 ?auto_170844 ) ) ( not ( = ?auto_170841 ?auto_170844 ) ) ( not ( = ?auto_170842 ?auto_170844 ) ) ( not ( = ?auto_170843 ?auto_170844 ) ) ( ON ?auto_170837 ?auto_170836 ) ( ON-TABLE ?auto_170844 ) ( ON ?auto_170838 ?auto_170837 ) ( ON ?auto_170839 ?auto_170838 ) ( ON ?auto_170840 ?auto_170839 ) ( ON ?auto_170841 ?auto_170840 ) ( ON ?auto_170842 ?auto_170841 ) ( ON ?auto_170843 ?auto_170842 ) ( CLEAR ?auto_170843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170844 ?auto_170836 ?auto_170837 ?auto_170838 ?auto_170839 ?auto_170840 ?auto_170841 ?auto_170842 )
      ( MAKE-8PILE ?auto_170836 ?auto_170837 ?auto_170838 ?auto_170839 ?auto_170840 ?auto_170841 ?auto_170842 ?auto_170843 ) )
  )

)

