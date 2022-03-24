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
      ?auto_742 - BLOCK
      ?auto_743 - BLOCK
    )
    :vars
    (
      ?auto_744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_744 ?auto_743 ) ( CLEAR ?auto_744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_742 ) ( ON ?auto_743 ?auto_742 ) ( not ( = ?auto_742 ?auto_743 ) ) ( not ( = ?auto_742 ?auto_744 ) ) ( not ( = ?auto_743 ?auto_744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_744 ?auto_743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_746 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_747 - BLOCK
    )
    :vars
    (
      ?auto_748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_747 ?auto_748 ) ( CLEAR ?auto_747 ) ( HAND-EMPTY ) ( not ( = ?auto_747 ?auto_748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_747 ?auto_748 )
      ( MAKE-1PILE ?auto_747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_750 - BLOCK
    )
    :vars
    (
      ?auto_751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_751 ?auto_750 ) ( CLEAR ?auto_751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_750 ) ( not ( = ?auto_750 ?auto_751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_751 ?auto_750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_752 - BLOCK
    )
    :vars
    (
      ?auto_753 - BLOCK
      ?auto_754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_753 ?auto_752 ) ( CLEAR ?auto_753 ) ( ON-TABLE ?auto_752 ) ( not ( = ?auto_752 ?auto_753 ) ) ( HOLDING ?auto_754 ) ( not ( = ?auto_752 ?auto_754 ) ) ( not ( = ?auto_753 ?auto_754 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_754 )
      ( MAKE-1PILE ?auto_752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_755 - BLOCK
    )
    :vars
    (
      ?auto_756 - BLOCK
      ?auto_757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_756 ?auto_755 ) ( ON-TABLE ?auto_755 ) ( not ( = ?auto_755 ?auto_756 ) ) ( not ( = ?auto_755 ?auto_757 ) ) ( not ( = ?auto_756 ?auto_757 ) ) ( ON ?auto_757 ?auto_756 ) ( CLEAR ?auto_757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_755 ?auto_756 )
      ( MAKE-1PILE ?auto_755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_760 - BLOCK
      ?auto_761 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_761 ) ( CLEAR ?auto_760 ) ( ON-TABLE ?auto_760 ) ( not ( = ?auto_760 ?auto_761 ) ) )
    :subtasks
    ( ( !STACK ?auto_761 ?auto_760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_762 - BLOCK
      ?auto_763 - BLOCK
    )
    :vars
    (
      ?auto_764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_762 ) ( ON-TABLE ?auto_762 ) ( not ( = ?auto_762 ?auto_763 ) ) ( ON ?auto_763 ?auto_764 ) ( CLEAR ?auto_763 ) ( HAND-EMPTY ) ( not ( = ?auto_762 ?auto_764 ) ) ( not ( = ?auto_763 ?auto_764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_763 ?auto_764 )
      ( MAKE-2PILE ?auto_762 ?auto_763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_765 - BLOCK
      ?auto_766 - BLOCK
    )
    :vars
    (
      ?auto_767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_765 ?auto_766 ) ) ( ON ?auto_766 ?auto_767 ) ( CLEAR ?auto_766 ) ( not ( = ?auto_765 ?auto_767 ) ) ( not ( = ?auto_766 ?auto_767 ) ) ( HOLDING ?auto_765 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_765 )
      ( MAKE-2PILE ?auto_765 ?auto_766 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_768 - BLOCK
      ?auto_769 - BLOCK
    )
    :vars
    (
      ?auto_770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_768 ?auto_769 ) ) ( ON ?auto_769 ?auto_770 ) ( not ( = ?auto_768 ?auto_770 ) ) ( not ( = ?auto_769 ?auto_770 ) ) ( ON ?auto_768 ?auto_769 ) ( CLEAR ?auto_768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_770 ?auto_769 )
      ( MAKE-2PILE ?auto_768 ?auto_769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_787 - BLOCK
    )
    :vars
    (
      ?auto_788 - BLOCK
      ?auto_789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_787 ?auto_788 ) ( CLEAR ?auto_787 ) ( not ( = ?auto_787 ?auto_788 ) ) ( HOLDING ?auto_789 ) ( not ( = ?auto_787 ?auto_789 ) ) ( not ( = ?auto_788 ?auto_789 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_789 )
      ( MAKE-1PILE ?auto_787 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_790 - BLOCK
    )
    :vars
    (
      ?auto_791 - BLOCK
      ?auto_792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_790 ?auto_791 ) ( not ( = ?auto_790 ?auto_791 ) ) ( not ( = ?auto_790 ?auto_792 ) ) ( not ( = ?auto_791 ?auto_792 ) ) ( ON ?auto_792 ?auto_790 ) ( CLEAR ?auto_792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_791 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_791 ?auto_790 )
      ( MAKE-1PILE ?auto_790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_797 - BLOCK
      ?auto_798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_797 ) ( ON-TABLE ?auto_797 ) ( not ( = ?auto_797 ?auto_798 ) ) ( ON-TABLE ?auto_798 ) ( CLEAR ?auto_798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_798 )
      ( MAKE-2PILE ?auto_797 ?auto_798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_799 - BLOCK
      ?auto_800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_799 ?auto_800 ) ) ( ON-TABLE ?auto_800 ) ( CLEAR ?auto_800 ) ( HOLDING ?auto_799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_799 )
      ( MAKE-2PILE ?auto_799 ?auto_800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_801 - BLOCK
      ?auto_802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_801 ?auto_802 ) ) ( ON-TABLE ?auto_802 ) ( ON ?auto_801 ?auto_802 ) ( CLEAR ?auto_801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_802 )
      ( MAKE-2PILE ?auto_801 ?auto_802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_805 - BLOCK
      ?auto_806 - BLOCK
    )
    :vars
    (
      ?auto_807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_805 ?auto_806 ) ) ( ON-TABLE ?auto_806 ) ( CLEAR ?auto_806 ) ( ON ?auto_805 ?auto_807 ) ( CLEAR ?auto_805 ) ( HAND-EMPTY ) ( not ( = ?auto_805 ?auto_807 ) ) ( not ( = ?auto_806 ?auto_807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_805 ?auto_807 )
      ( MAKE-2PILE ?auto_805 ?auto_806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_808 - BLOCK
      ?auto_809 - BLOCK
    )
    :vars
    (
      ?auto_810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_808 ?auto_809 ) ) ( ON ?auto_808 ?auto_810 ) ( CLEAR ?auto_808 ) ( not ( = ?auto_808 ?auto_810 ) ) ( not ( = ?auto_809 ?auto_810 ) ) ( HOLDING ?auto_809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_809 )
      ( MAKE-2PILE ?auto_808 ?auto_809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_811 - BLOCK
      ?auto_812 - BLOCK
    )
    :vars
    (
      ?auto_813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_811 ?auto_812 ) ) ( ON ?auto_811 ?auto_813 ) ( not ( = ?auto_811 ?auto_813 ) ) ( not ( = ?auto_812 ?auto_813 ) ) ( ON ?auto_812 ?auto_811 ) ( CLEAR ?auto_812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_813 ?auto_811 )
      ( MAKE-2PILE ?auto_811 ?auto_812 ) )
  )

)

