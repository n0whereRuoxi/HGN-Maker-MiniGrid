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
      ?auto_725 - BLOCK
    )
    :vars
    (
      ?auto_726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725 ?auto_726 ) ( CLEAR ?auto_725 ) ( HAND-EMPTY ) ( not ( = ?auto_725 ?auto_726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_725 ?auto_726 )
      ( !PUTDOWN ?auto_725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_732 - BLOCK
      ?auto_733 - BLOCK
    )
    :vars
    (
      ?auto_734 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_732 ) ( ON ?auto_733 ?auto_734 ) ( CLEAR ?auto_733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_732 ) ( not ( = ?auto_732 ?auto_733 ) ) ( not ( = ?auto_732 ?auto_734 ) ) ( not ( = ?auto_733 ?auto_734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_733 ?auto_734 )
      ( !STACK ?auto_733 ?auto_732 ) )
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
    ( and ( ON ?auto_743 ?auto_744 ) ( not ( = ?auto_742 ?auto_743 ) ) ( not ( = ?auto_742 ?auto_744 ) ) ( not ( = ?auto_743 ?auto_744 ) ) ( ON ?auto_742 ?auto_743 ) ( CLEAR ?auto_742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_742 )
      ( MAKE-2PILE ?auto_742 ?auto_743 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_753 - BLOCK
      ?auto_754 - BLOCK
      ?auto_755 - BLOCK
    )
    :vars
    (
      ?auto_756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_754 ) ( ON ?auto_755 ?auto_756 ) ( CLEAR ?auto_755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_753 ) ( ON ?auto_754 ?auto_753 ) ( not ( = ?auto_753 ?auto_754 ) ) ( not ( = ?auto_753 ?auto_755 ) ) ( not ( = ?auto_753 ?auto_756 ) ) ( not ( = ?auto_754 ?auto_755 ) ) ( not ( = ?auto_754 ?auto_756 ) ) ( not ( = ?auto_755 ?auto_756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_755 ?auto_756 )
      ( !STACK ?auto_755 ?auto_754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_760 - BLOCK
      ?auto_761 - BLOCK
      ?auto_762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_761 ) ( ON-TABLE ?auto_762 ) ( CLEAR ?auto_762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_760 ) ( ON ?auto_761 ?auto_760 ) ( not ( = ?auto_760 ?auto_761 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( not ( = ?auto_761 ?auto_762 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_762 )
      ( !STACK ?auto_762 ?auto_761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_766 - BLOCK
      ?auto_767 - BLOCK
      ?auto_768 - BLOCK
    )
    :vars
    (
      ?auto_769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768 ?auto_769 ) ( ON-TABLE ?auto_766 ) ( not ( = ?auto_766 ?auto_767 ) ) ( not ( = ?auto_766 ?auto_768 ) ) ( not ( = ?auto_766 ?auto_769 ) ) ( not ( = ?auto_767 ?auto_768 ) ) ( not ( = ?auto_767 ?auto_769 ) ) ( not ( = ?auto_768 ?auto_769 ) ) ( CLEAR ?auto_766 ) ( ON ?auto_767 ?auto_768 ) ( CLEAR ?auto_767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766 ?auto_767 )
      ( MAKE-3PILE ?auto_766 ?auto_767 ?auto_768 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_773 - BLOCK
      ?auto_774 - BLOCK
      ?auto_775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_775 ) ( ON-TABLE ?auto_773 ) ( not ( = ?auto_773 ?auto_774 ) ) ( not ( = ?auto_773 ?auto_775 ) ) ( not ( = ?auto_774 ?auto_775 ) ) ( CLEAR ?auto_773 ) ( ON ?auto_774 ?auto_775 ) ( CLEAR ?auto_774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_773 ?auto_774 )
      ( MAKE-3PILE ?auto_773 ?auto_774 ?auto_775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_779 - BLOCK
      ?auto_780 - BLOCK
      ?auto_781 - BLOCK
    )
    :vars
    (
      ?auto_782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_781 ?auto_782 ) ( not ( = ?auto_779 ?auto_780 ) ) ( not ( = ?auto_779 ?auto_781 ) ) ( not ( = ?auto_779 ?auto_782 ) ) ( not ( = ?auto_780 ?auto_781 ) ) ( not ( = ?auto_780 ?auto_782 ) ) ( not ( = ?auto_781 ?auto_782 ) ) ( ON ?auto_780 ?auto_781 ) ( ON ?auto_779 ?auto_780 ) ( CLEAR ?auto_779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_779 )
      ( MAKE-3PILE ?auto_779 ?auto_780 ?auto_781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_786 - BLOCK
      ?auto_787 - BLOCK
      ?auto_788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_788 ) ( not ( = ?auto_786 ?auto_787 ) ) ( not ( = ?auto_786 ?auto_788 ) ) ( not ( = ?auto_787 ?auto_788 ) ) ( ON ?auto_787 ?auto_788 ) ( ON ?auto_786 ?auto_787 ) ( CLEAR ?auto_786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_786 )
      ( MAKE-3PILE ?auto_786 ?auto_787 ?auto_788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_792 - BLOCK
      ?auto_793 - BLOCK
      ?auto_794 - BLOCK
    )
    :vars
    (
      ?auto_795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_792 ?auto_793 ) ) ( not ( = ?auto_792 ?auto_794 ) ) ( not ( = ?auto_793 ?auto_794 ) ) ( ON ?auto_792 ?auto_795 ) ( not ( = ?auto_794 ?auto_795 ) ) ( not ( = ?auto_793 ?auto_795 ) ) ( not ( = ?auto_792 ?auto_795 ) ) ( ON ?auto_793 ?auto_792 ) ( ON ?auto_794 ?auto_793 ) ( CLEAR ?auto_794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_794 ?auto_793 ?auto_792 )
      ( MAKE-3PILE ?auto_792 ?auto_793 ?auto_794 ) )
  )

)

