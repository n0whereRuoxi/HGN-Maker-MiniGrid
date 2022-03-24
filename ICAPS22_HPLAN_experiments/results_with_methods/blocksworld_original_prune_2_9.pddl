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
      ?auto_668 - BLOCK
      ?auto_669 - BLOCK
    )
    :vars
    (
      ?auto_670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670 ?auto_669 ) ( CLEAR ?auto_670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_668 ) ( ON ?auto_669 ?auto_668 ) ( not ( = ?auto_668 ?auto_669 ) ) ( not ( = ?auto_668 ?auto_670 ) ) ( not ( = ?auto_669 ?auto_670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_670 ?auto_669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_672 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_672 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_673 - BLOCK
    )
    :vars
    (
      ?auto_674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_673 ?auto_674 ) ( CLEAR ?auto_673 ) ( HAND-EMPTY ) ( not ( = ?auto_673 ?auto_674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_673 ?auto_674 )
      ( MAKE-1PILE ?auto_673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_676 - BLOCK
    )
    :vars
    (
      ?auto_677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_677 ?auto_676 ) ( CLEAR ?auto_677 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_676 ) ( not ( = ?auto_676 ?auto_677 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_677 ?auto_676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_678 - BLOCK
    )
    :vars
    (
      ?auto_679 - BLOCK
      ?auto_680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_679 ?auto_678 ) ( CLEAR ?auto_679 ) ( ON-TABLE ?auto_678 ) ( not ( = ?auto_678 ?auto_679 ) ) ( HOLDING ?auto_680 ) ( not ( = ?auto_678 ?auto_680 ) ) ( not ( = ?auto_679 ?auto_680 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_680 )
      ( MAKE-1PILE ?auto_678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_681 - BLOCK
    )
    :vars
    (
      ?auto_682 - BLOCK
      ?auto_683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_682 ?auto_681 ) ( ON-TABLE ?auto_681 ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_681 ?auto_683 ) ) ( not ( = ?auto_682 ?auto_683 ) ) ( ON ?auto_683 ?auto_682 ) ( CLEAR ?auto_683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_681 ?auto_682 )
      ( MAKE-1PILE ?auto_681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_686 - BLOCK
      ?auto_687 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_687 ) ( CLEAR ?auto_686 ) ( ON-TABLE ?auto_686 ) ( not ( = ?auto_686 ?auto_687 ) ) )
    :subtasks
    ( ( !STACK ?auto_687 ?auto_686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_688 - BLOCK
      ?auto_689 - BLOCK
    )
    :vars
    (
      ?auto_690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_688 ) ( ON-TABLE ?auto_688 ) ( not ( = ?auto_688 ?auto_689 ) ) ( ON ?auto_689 ?auto_690 ) ( CLEAR ?auto_689 ) ( HAND-EMPTY ) ( not ( = ?auto_688 ?auto_690 ) ) ( not ( = ?auto_689 ?auto_690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_689 ?auto_690 )
      ( MAKE-2PILE ?auto_688 ?auto_689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_691 - BLOCK
      ?auto_692 - BLOCK
    )
    :vars
    (
      ?auto_693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_691 ?auto_692 ) ) ( ON ?auto_692 ?auto_693 ) ( CLEAR ?auto_692 ) ( not ( = ?auto_691 ?auto_693 ) ) ( not ( = ?auto_692 ?auto_693 ) ) ( HOLDING ?auto_691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_691 )
      ( MAKE-2PILE ?auto_691 ?auto_692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_694 - BLOCK
      ?auto_695 - BLOCK
    )
    :vars
    (
      ?auto_696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_694 ?auto_695 ) ) ( ON ?auto_695 ?auto_696 ) ( not ( = ?auto_694 ?auto_696 ) ) ( not ( = ?auto_695 ?auto_696 ) ) ( ON ?auto_694 ?auto_695 ) ( CLEAR ?auto_694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_696 ?auto_695 )
      ( MAKE-2PILE ?auto_694 ?auto_695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_713 - BLOCK
    )
    :vars
    (
      ?auto_714 - BLOCK
      ?auto_715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713 ?auto_714 ) ( CLEAR ?auto_713 ) ( not ( = ?auto_713 ?auto_714 ) ) ( HOLDING ?auto_715 ) ( not ( = ?auto_713 ?auto_715 ) ) ( not ( = ?auto_714 ?auto_715 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_715 )
      ( MAKE-1PILE ?auto_713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_716 - BLOCK
    )
    :vars
    (
      ?auto_718 - BLOCK
      ?auto_717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716 ?auto_718 ) ( not ( = ?auto_716 ?auto_718 ) ) ( not ( = ?auto_716 ?auto_717 ) ) ( not ( = ?auto_718 ?auto_717 ) ) ( ON ?auto_717 ?auto_716 ) ( CLEAR ?auto_717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_718 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_718 ?auto_716 )
      ( MAKE-1PILE ?auto_716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_723 - BLOCK
      ?auto_724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_723 ) ( ON-TABLE ?auto_723 ) ( not ( = ?auto_723 ?auto_724 ) ) ( ON-TABLE ?auto_724 ) ( CLEAR ?auto_724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_724 )
      ( MAKE-2PILE ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_725 - BLOCK
      ?auto_726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_725 ?auto_726 ) ) ( ON-TABLE ?auto_726 ) ( CLEAR ?auto_726 ) ( HOLDING ?auto_725 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_725 )
      ( MAKE-2PILE ?auto_725 ?auto_726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_727 - BLOCK
      ?auto_728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_727 ?auto_728 ) ) ( ON-TABLE ?auto_728 ) ( ON ?auto_727 ?auto_728 ) ( CLEAR ?auto_727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_728 )
      ( MAKE-2PILE ?auto_727 ?auto_728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_731 - BLOCK
      ?auto_732 - BLOCK
    )
    :vars
    (
      ?auto_733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_731 ?auto_732 ) ) ( ON-TABLE ?auto_732 ) ( CLEAR ?auto_732 ) ( ON ?auto_731 ?auto_733 ) ( CLEAR ?auto_731 ) ( HAND-EMPTY ) ( not ( = ?auto_731 ?auto_733 ) ) ( not ( = ?auto_732 ?auto_733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_731 ?auto_733 )
      ( MAKE-2PILE ?auto_731 ?auto_732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_734 - BLOCK
      ?auto_735 - BLOCK
    )
    :vars
    (
      ?auto_736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_734 ?auto_735 ) ) ( ON ?auto_734 ?auto_736 ) ( CLEAR ?auto_734 ) ( not ( = ?auto_734 ?auto_736 ) ) ( not ( = ?auto_735 ?auto_736 ) ) ( HOLDING ?auto_735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_735 )
      ( MAKE-2PILE ?auto_734 ?auto_735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_737 - BLOCK
      ?auto_738 - BLOCK
    )
    :vars
    (
      ?auto_739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_737 ?auto_738 ) ) ( ON ?auto_737 ?auto_739 ) ( not ( = ?auto_737 ?auto_739 ) ) ( not ( = ?auto_738 ?auto_739 ) ) ( ON ?auto_738 ?auto_737 ) ( CLEAR ?auto_738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_739 ?auto_737 )
      ( MAKE-2PILE ?auto_737 ?auto_738 ) )
  )

)

