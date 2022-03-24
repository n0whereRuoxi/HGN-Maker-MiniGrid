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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_650 - BLOCK
      ?auto_651 - BLOCK
    )
    :vars
    (
      ?auto_652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_652 ?auto_651 ) ( CLEAR ?auto_652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_650 ) ( ON ?auto_651 ?auto_650 ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_650 ?auto_652 ) ) ( not ( = ?auto_651 ?auto_652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_652 ?auto_651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_654 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_654 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_655 - BLOCK
    )
    :vars
    (
      ?auto_656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_655 ?auto_656 ) ( CLEAR ?auto_655 ) ( HAND-EMPTY ) ( not ( = ?auto_655 ?auto_656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_655 ?auto_656 )
      ( MAKE-1PILE ?auto_655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_658 - BLOCK
    )
    :vars
    (
      ?auto_659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_659 ?auto_658 ) ( CLEAR ?auto_659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_658 ) ( not ( = ?auto_658 ?auto_659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_659 ?auto_658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_660 - BLOCK
    )
    :vars
    (
      ?auto_661 - BLOCK
      ?auto_662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_661 ?auto_660 ) ( CLEAR ?auto_661 ) ( ON-TABLE ?auto_660 ) ( not ( = ?auto_660 ?auto_661 ) ) ( HOLDING ?auto_662 ) ( not ( = ?auto_660 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_662 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_662 )
      ( MAKE-1PILE ?auto_660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_663 - BLOCK
    )
    :vars
    (
      ?auto_664 - BLOCK
      ?auto_665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_664 ?auto_663 ) ( ON-TABLE ?auto_663 ) ( not ( = ?auto_663 ?auto_664 ) ) ( not ( = ?auto_663 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_665 ) ) ( ON ?auto_665 ?auto_664 ) ( CLEAR ?auto_665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_663 ?auto_664 )
      ( MAKE-1PILE ?auto_663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_668 - BLOCK
      ?auto_669 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_669 ) ( CLEAR ?auto_668 ) ( ON-TABLE ?auto_668 ) ( not ( = ?auto_668 ?auto_669 ) ) )
    :subtasks
    ( ( !STACK ?auto_669 ?auto_668 ) )
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
    ( and ( CLEAR ?auto_670 ) ( ON-TABLE ?auto_670 ) ( not ( = ?auto_670 ?auto_671 ) ) ( ON ?auto_671 ?auto_672 ) ( CLEAR ?auto_671 ) ( HAND-EMPTY ) ( not ( = ?auto_670 ?auto_672 ) ) ( not ( = ?auto_671 ?auto_672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_671 ?auto_672 )
      ( MAKE-2PILE ?auto_670 ?auto_671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_673 - BLOCK
      ?auto_674 - BLOCK
    )
    :vars
    (
      ?auto_675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_673 ?auto_674 ) ) ( ON ?auto_674 ?auto_675 ) ( CLEAR ?auto_674 ) ( not ( = ?auto_673 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_675 ) ) ( HOLDING ?auto_673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_673 )
      ( MAKE-2PILE ?auto_673 ?auto_674 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_676 - BLOCK
      ?auto_677 - BLOCK
    )
    :vars
    (
      ?auto_678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_676 ?auto_677 ) ) ( ON ?auto_677 ?auto_678 ) ( not ( = ?auto_676 ?auto_678 ) ) ( not ( = ?auto_677 ?auto_678 ) ) ( ON ?auto_676 ?auto_677 ) ( CLEAR ?auto_676 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_678 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_678 ?auto_677 )
      ( MAKE-2PILE ?auto_676 ?auto_677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_680 - BLOCK
    )
    :vars
    (
      ?auto_681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_681 ?auto_680 ) ( CLEAR ?auto_681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_680 ) ( not ( = ?auto_680 ?auto_681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_681 ?auto_680 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_687 - BLOCK
    )
    :vars
    (
      ?auto_688 - BLOCK
      ?auto_689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_687 ?auto_688 ) ) ( ON ?auto_688 ?auto_689 ) ( CLEAR ?auto_688 ) ( not ( = ?auto_687 ?auto_689 ) ) ( not ( = ?auto_688 ?auto_689 ) ) ( HOLDING ?auto_687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_687 ?auto_688 )
      ( MAKE-1PILE ?auto_687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_690 - BLOCK
    )
    :vars
    (
      ?auto_692 - BLOCK
      ?auto_691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_690 ?auto_692 ) ) ( ON ?auto_692 ?auto_691 ) ( not ( = ?auto_690 ?auto_691 ) ) ( not ( = ?auto_692 ?auto_691 ) ) ( ON ?auto_690 ?auto_692 ) ( CLEAR ?auto_690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_691 ?auto_692 )
      ( MAKE-1PILE ?auto_690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_694 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_694 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_695 - BLOCK
    )
    :vars
    (
      ?auto_696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_695 ?auto_696 ) ( CLEAR ?auto_695 ) ( HAND-EMPTY ) ( not ( = ?auto_695 ?auto_696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_695 ?auto_696 )
      ( MAKE-1PILE ?auto_695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_697 - BLOCK
    )
    :vars
    (
      ?auto_698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_697 ?auto_698 ) ) ( HOLDING ?auto_697 ) ( CLEAR ?auto_698 ) ( ON-TABLE ?auto_698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_698 ?auto_697 )
      ( MAKE-1PILE ?auto_697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_699 - BLOCK
    )
    :vars
    (
      ?auto_700 - BLOCK
      ?auto_701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_699 ?auto_700 ) ) ( CLEAR ?auto_700 ) ( ON-TABLE ?auto_700 ) ( ON ?auto_699 ?auto_701 ) ( CLEAR ?auto_699 ) ( HAND-EMPTY ) ( not ( = ?auto_699 ?auto_701 ) ) ( not ( = ?auto_700 ?auto_701 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_699 ?auto_701 )
      ( MAKE-1PILE ?auto_699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_702 - BLOCK
    )
    :vars
    (
      ?auto_704 - BLOCK
      ?auto_703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_702 ?auto_704 ) ) ( ON ?auto_702 ?auto_703 ) ( CLEAR ?auto_702 ) ( not ( = ?auto_702 ?auto_703 ) ) ( not ( = ?auto_704 ?auto_703 ) ) ( HOLDING ?auto_704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_704 )
      ( MAKE-1PILE ?auto_702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_705 - BLOCK
    )
    :vars
    (
      ?auto_707 - BLOCK
      ?auto_706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_705 ?auto_707 ) ) ( ON ?auto_705 ?auto_706 ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_707 ?auto_706 ) ) ( ON ?auto_707 ?auto_705 ) ( CLEAR ?auto_707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_706 ?auto_705 )
      ( MAKE-1PILE ?auto_705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_710 - BLOCK
      ?auto_711 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_711 ) ( CLEAR ?auto_710 ) ( ON-TABLE ?auto_710 ) ( not ( = ?auto_710 ?auto_711 ) ) )
    :subtasks
    ( ( !STACK ?auto_711 ?auto_710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_712 - BLOCK
      ?auto_713 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_712 ) ( ON-TABLE ?auto_712 ) ( not ( = ?auto_712 ?auto_713 ) ) ( ON-TABLE ?auto_713 ) ( CLEAR ?auto_713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_713 )
      ( MAKE-2PILE ?auto_712 ?auto_713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_714 - BLOCK
      ?auto_715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_714 ?auto_715 ) ) ( ON-TABLE ?auto_715 ) ( CLEAR ?auto_715 ) ( HOLDING ?auto_714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_714 )
      ( MAKE-2PILE ?auto_714 ?auto_715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_716 - BLOCK
      ?auto_717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_716 ?auto_717 ) ) ( ON-TABLE ?auto_717 ) ( ON ?auto_716 ?auto_717 ) ( CLEAR ?auto_716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717 )
      ( MAKE-2PILE ?auto_716 ?auto_717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_718 - BLOCK
      ?auto_719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_718 ?auto_719 ) ) ( ON-TABLE ?auto_719 ) ( HOLDING ?auto_718 ) ( CLEAR ?auto_719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_719 ?auto_718 )
      ( MAKE-2PILE ?auto_718 ?auto_719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_720 - BLOCK
      ?auto_721 - BLOCK
    )
    :vars
    (
      ?auto_722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_720 ?auto_721 ) ) ( ON-TABLE ?auto_721 ) ( CLEAR ?auto_721 ) ( ON ?auto_720 ?auto_722 ) ( CLEAR ?auto_720 ) ( HAND-EMPTY ) ( not ( = ?auto_720 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_720 ?auto_722 )
      ( MAKE-2PILE ?auto_720 ?auto_721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_723 - BLOCK
      ?auto_724 - BLOCK
    )
    :vars
    (
      ?auto_725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_723 ?auto_724 ) ) ( ON ?auto_723 ?auto_725 ) ( CLEAR ?auto_723 ) ( not ( = ?auto_723 ?auto_725 ) ) ( not ( = ?auto_724 ?auto_725 ) ) ( HOLDING ?auto_724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724 )
      ( MAKE-2PILE ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_726 - BLOCK
      ?auto_727 - BLOCK
    )
    :vars
    (
      ?auto_728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_726 ?auto_727 ) ) ( ON ?auto_726 ?auto_728 ) ( not ( = ?auto_726 ?auto_728 ) ) ( not ( = ?auto_727 ?auto_728 ) ) ( ON ?auto_727 ?auto_726 ) ( CLEAR ?auto_727 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_728 ?auto_726 )
      ( MAKE-2PILE ?auto_726 ?auto_727 ) )
  )

)

