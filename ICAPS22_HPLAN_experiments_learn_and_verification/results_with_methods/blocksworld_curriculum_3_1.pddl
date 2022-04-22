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
      ?auto_653 - BLOCK
    )
    :vars
    (
      ?auto_654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_653 ?auto_654 ) ( CLEAR ?auto_653 ) ( HAND-EMPTY ) ( not ( = ?auto_653 ?auto_654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_653 ?auto_654 )
      ( !PUTDOWN ?auto_653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_656 - BLOCK
    )
    :vars
    (
      ?auto_657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_656 ?auto_657 ) ( CLEAR ?auto_656 ) ( HAND-EMPTY ) ( not ( = ?auto_656 ?auto_657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_656 ?auto_657 )
      ( !PUTDOWN ?auto_656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_660 - BLOCK
      ?auto_661 - BLOCK
    )
    :vars
    (
      ?auto_662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_660 ) ( ON ?auto_661 ?auto_662 ) ( CLEAR ?auto_661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_660 ) ( not ( = ?auto_660 ?auto_661 ) ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_661 ?auto_662 )
      ( !STACK ?auto_661 ?auto_660 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_665 - BLOCK
      ?auto_666 - BLOCK
    )
    :vars
    (
      ?auto_667 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665 ) ( ON ?auto_666 ?auto_667 ) ( CLEAR ?auto_666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665 ) ( not ( = ?auto_665 ?auto_666 ) ) ( not ( = ?auto_665 ?auto_667 ) ) ( not ( = ?auto_666 ?auto_667 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_666 ?auto_667 )
      ( !STACK ?auto_666 ?auto_665 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_670 - BLOCK
      ?auto_671 - BLOCK
    )
    :vars
    (
      ?auto_672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671 ?auto_672 ) ( not ( = ?auto_670 ?auto_671 ) ) ( not ( = ?auto_670 ?auto_672 ) ) ( not ( = ?auto_671 ?auto_672 ) ) ( ON ?auto_670 ?auto_671 ) ( CLEAR ?auto_670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_670 )
      ( MAKE-2PILE ?auto_670 ?auto_671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_675 - BLOCK
      ?auto_676 - BLOCK
    )
    :vars
    (
      ?auto_677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_676 ?auto_677 ) ( not ( = ?auto_675 ?auto_676 ) ) ( not ( = ?auto_675 ?auto_677 ) ) ( not ( = ?auto_676 ?auto_677 ) ) ( ON ?auto_675 ?auto_676 ) ( CLEAR ?auto_675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_675 )
      ( MAKE-2PILE ?auto_675 ?auto_676 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_681 - BLOCK
      ?auto_682 - BLOCK
      ?auto_683 - BLOCK
    )
    :vars
    (
      ?auto_684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_682 ) ( ON ?auto_683 ?auto_684 ) ( CLEAR ?auto_683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_681 ) ( ON ?auto_682 ?auto_681 ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_681 ?auto_683 ) ) ( not ( = ?auto_681 ?auto_684 ) ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_682 ?auto_684 ) ) ( not ( = ?auto_683 ?auto_684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_683 ?auto_684 )
      ( !STACK ?auto_683 ?auto_682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_688 - BLOCK
      ?auto_689 - BLOCK
      ?auto_690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_689 ) ( ON-TABLE ?auto_690 ) ( CLEAR ?auto_690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_688 ) ( ON ?auto_689 ?auto_688 ) ( not ( = ?auto_688 ?auto_689 ) ) ( not ( = ?auto_688 ?auto_690 ) ) ( not ( = ?auto_689 ?auto_690 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_690 )
      ( !STACK ?auto_690 ?auto_689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_694 - BLOCK
      ?auto_695 - BLOCK
      ?auto_696 - BLOCK
    )
    :vars
    (
      ?auto_697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_696 ?auto_697 ) ( ON-TABLE ?auto_694 ) ( not ( = ?auto_694 ?auto_695 ) ) ( not ( = ?auto_694 ?auto_696 ) ) ( not ( = ?auto_694 ?auto_697 ) ) ( not ( = ?auto_695 ?auto_696 ) ) ( not ( = ?auto_695 ?auto_697 ) ) ( not ( = ?auto_696 ?auto_697 ) ) ( CLEAR ?auto_694 ) ( ON ?auto_695 ?auto_696 ) ( CLEAR ?auto_695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_694 ?auto_695 )
      ( MAKE-3PILE ?auto_694 ?auto_695 ?auto_696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_701 - BLOCK
      ?auto_702 - BLOCK
      ?auto_703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_703 ) ( ON-TABLE ?auto_701 ) ( not ( = ?auto_701 ?auto_702 ) ) ( not ( = ?auto_701 ?auto_703 ) ) ( not ( = ?auto_702 ?auto_703 ) ) ( CLEAR ?auto_701 ) ( ON ?auto_702 ?auto_703 ) ( CLEAR ?auto_702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_701 ?auto_702 )
      ( MAKE-3PILE ?auto_701 ?auto_702 ?auto_703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_707 - BLOCK
      ?auto_708 - BLOCK
      ?auto_709 - BLOCK
    )
    :vars
    (
      ?auto_710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709 ?auto_710 ) ( not ( = ?auto_707 ?auto_708 ) ) ( not ( = ?auto_707 ?auto_709 ) ) ( not ( = ?auto_707 ?auto_710 ) ) ( not ( = ?auto_708 ?auto_709 ) ) ( not ( = ?auto_708 ?auto_710 ) ) ( not ( = ?auto_709 ?auto_710 ) ) ( ON ?auto_708 ?auto_709 ) ( ON ?auto_707 ?auto_708 ) ( CLEAR ?auto_707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_707 )
      ( MAKE-3PILE ?auto_707 ?auto_708 ?auto_709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_714 - BLOCK
      ?auto_715 - BLOCK
      ?auto_716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716 ) ( not ( = ?auto_714 ?auto_715 ) ) ( not ( = ?auto_714 ?auto_716 ) ) ( not ( = ?auto_715 ?auto_716 ) ) ( ON ?auto_715 ?auto_716 ) ( ON ?auto_714 ?auto_715 ) ( CLEAR ?auto_714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_714 )
      ( MAKE-3PILE ?auto_714 ?auto_715 ?auto_716 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_720 - BLOCK
      ?auto_721 - BLOCK
      ?auto_722 - BLOCK
    )
    :vars
    (
      ?auto_723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_720 ?auto_721 ) ) ( not ( = ?auto_720 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_722 ) ) ( ON ?auto_720 ?auto_723 ) ( not ( = ?auto_722 ?auto_723 ) ) ( not ( = ?auto_721 ?auto_723 ) ) ( not ( = ?auto_720 ?auto_723 ) ) ( ON ?auto_721 ?auto_720 ) ( ON ?auto_722 ?auto_721 ) ( CLEAR ?auto_722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_722 ?auto_721 ?auto_720 )
      ( MAKE-3PILE ?auto_720 ?auto_721 ?auto_722 ) )
  )

)

