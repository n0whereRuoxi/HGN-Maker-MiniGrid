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
      ?auto_731 - BLOCK
      ?auto_732 - BLOCK
    )
    :vars
    (
      ?auto_733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_733 ?auto_732 ) ( CLEAR ?auto_733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_731 ) ( ON ?auto_732 ?auto_731 ) ( not ( = ?auto_731 ?auto_732 ) ) ( not ( = ?auto_731 ?auto_733 ) ) ( not ( = ?auto_732 ?auto_733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_733 ?auto_732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_735 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_735 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_736 - BLOCK
    )
    :vars
    (
      ?auto_737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_736 ?auto_737 ) ( CLEAR ?auto_736 ) ( HAND-EMPTY ) ( not ( = ?auto_736 ?auto_737 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_736 ?auto_737 )
      ( MAKE-1PILE ?auto_736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_739 - BLOCK
    )
    :vars
    (
      ?auto_740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_740 ?auto_739 ) ( CLEAR ?auto_740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_739 ) ( not ( = ?auto_739 ?auto_740 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_740 ?auto_739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_741 - BLOCK
    )
    :vars
    (
      ?auto_742 - BLOCK
      ?auto_743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_742 ?auto_741 ) ( CLEAR ?auto_742 ) ( ON-TABLE ?auto_741 ) ( not ( = ?auto_741 ?auto_742 ) ) ( HOLDING ?auto_743 ) ( not ( = ?auto_741 ?auto_743 ) ) ( not ( = ?auto_742 ?auto_743 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_743 )
      ( MAKE-1PILE ?auto_741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_744 - BLOCK
    )
    :vars
    (
      ?auto_746 - BLOCK
      ?auto_745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_746 ?auto_744 ) ( ON-TABLE ?auto_744 ) ( not ( = ?auto_744 ?auto_746 ) ) ( not ( = ?auto_744 ?auto_745 ) ) ( not ( = ?auto_746 ?auto_745 ) ) ( ON ?auto_745 ?auto_746 ) ( CLEAR ?auto_745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_744 ?auto_746 )
      ( MAKE-1PILE ?auto_744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_749 - BLOCK
      ?auto_750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_750 ) ( CLEAR ?auto_749 ) ( ON-TABLE ?auto_749 ) ( not ( = ?auto_749 ?auto_750 ) ) )
    :subtasks
    ( ( !STACK ?auto_750 ?auto_749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_751 - BLOCK
      ?auto_752 - BLOCK
    )
    :vars
    (
      ?auto_753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_751 ) ( ON-TABLE ?auto_751 ) ( not ( = ?auto_751 ?auto_752 ) ) ( ON ?auto_752 ?auto_753 ) ( CLEAR ?auto_752 ) ( HAND-EMPTY ) ( not ( = ?auto_751 ?auto_753 ) ) ( not ( = ?auto_752 ?auto_753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_752 ?auto_753 )
      ( MAKE-2PILE ?auto_751 ?auto_752 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_754 - BLOCK
      ?auto_755 - BLOCK
    )
    :vars
    (
      ?auto_756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_754 ?auto_755 ) ) ( ON ?auto_755 ?auto_756 ) ( CLEAR ?auto_755 ) ( not ( = ?auto_754 ?auto_756 ) ) ( not ( = ?auto_755 ?auto_756 ) ) ( HOLDING ?auto_754 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_754 )
      ( MAKE-2PILE ?auto_754 ?auto_755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_757 - BLOCK
      ?auto_758 - BLOCK
    )
    :vars
    (
      ?auto_759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_757 ?auto_758 ) ) ( ON ?auto_758 ?auto_759 ) ( not ( = ?auto_757 ?auto_759 ) ) ( not ( = ?auto_758 ?auto_759 ) ) ( ON ?auto_757 ?auto_758 ) ( CLEAR ?auto_757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_759 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_759 ?auto_758 )
      ( MAKE-2PILE ?auto_757 ?auto_758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_761 - BLOCK
    )
    :vars
    (
      ?auto_762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762 ?auto_761 ) ( CLEAR ?auto_762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_761 ) ( not ( = ?auto_761 ?auto_762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_762 ?auto_761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_768 - BLOCK
    )
    :vars
    (
      ?auto_769 - BLOCK
      ?auto_770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_768 ?auto_769 ) ) ( ON ?auto_769 ?auto_770 ) ( CLEAR ?auto_769 ) ( not ( = ?auto_768 ?auto_770 ) ) ( not ( = ?auto_769 ?auto_770 ) ) ( HOLDING ?auto_768 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_768 ?auto_769 )
      ( MAKE-1PILE ?auto_768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_771 - BLOCK
    )
    :vars
    (
      ?auto_772 - BLOCK
      ?auto_773 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_771 ?auto_772 ) ) ( ON ?auto_772 ?auto_773 ) ( not ( = ?auto_771 ?auto_773 ) ) ( not ( = ?auto_772 ?auto_773 ) ) ( ON ?auto_771 ?auto_772 ) ( CLEAR ?auto_771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_773 ?auto_772 )
      ( MAKE-1PILE ?auto_771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_775 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_775 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_776 - BLOCK
    )
    :vars
    (
      ?auto_777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_776 ?auto_777 ) ( CLEAR ?auto_776 ) ( HAND-EMPTY ) ( not ( = ?auto_776 ?auto_777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_776 ?auto_777 )
      ( MAKE-1PILE ?auto_776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_778 - BLOCK
    )
    :vars
    (
      ?auto_779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_778 ?auto_779 ) ) ( HOLDING ?auto_778 ) ( CLEAR ?auto_779 ) ( ON-TABLE ?auto_779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_779 ?auto_778 )
      ( MAKE-1PILE ?auto_778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_780 - BLOCK
    )
    :vars
    (
      ?auto_781 - BLOCK
      ?auto_782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_780 ?auto_781 ) ) ( CLEAR ?auto_781 ) ( ON-TABLE ?auto_781 ) ( ON ?auto_780 ?auto_782 ) ( CLEAR ?auto_780 ) ( HAND-EMPTY ) ( not ( = ?auto_780 ?auto_782 ) ) ( not ( = ?auto_781 ?auto_782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_780 ?auto_782 )
      ( MAKE-1PILE ?auto_780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_783 - BLOCK
    )
    :vars
    (
      ?auto_784 - BLOCK
      ?auto_785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_783 ?auto_784 ) ) ( ON ?auto_783 ?auto_785 ) ( CLEAR ?auto_783 ) ( not ( = ?auto_783 ?auto_785 ) ) ( not ( = ?auto_784 ?auto_785 ) ) ( HOLDING ?auto_784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_784 )
      ( MAKE-1PILE ?auto_783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_786 - BLOCK
    )
    :vars
    (
      ?auto_788 - BLOCK
      ?auto_787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_786 ?auto_788 ) ) ( ON ?auto_786 ?auto_787 ) ( not ( = ?auto_786 ?auto_787 ) ) ( not ( = ?auto_788 ?auto_787 ) ) ( ON ?auto_788 ?auto_786 ) ( CLEAR ?auto_788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_787 ?auto_786 )
      ( MAKE-1PILE ?auto_786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_791 - BLOCK
      ?auto_792 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_792 ) ( CLEAR ?auto_791 ) ( ON-TABLE ?auto_791 ) ( not ( = ?auto_791 ?auto_792 ) ) )
    :subtasks
    ( ( !STACK ?auto_792 ?auto_791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_793 - BLOCK
      ?auto_794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_793 ) ( ON-TABLE ?auto_793 ) ( not ( = ?auto_793 ?auto_794 ) ) ( ON-TABLE ?auto_794 ) ( CLEAR ?auto_794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_794 )
      ( MAKE-2PILE ?auto_793 ?auto_794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_795 - BLOCK
      ?auto_796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_795 ?auto_796 ) ) ( ON-TABLE ?auto_796 ) ( CLEAR ?auto_796 ) ( HOLDING ?auto_795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_795 )
      ( MAKE-2PILE ?auto_795 ?auto_796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_797 - BLOCK
      ?auto_798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_797 ?auto_798 ) ) ( ON-TABLE ?auto_798 ) ( ON ?auto_797 ?auto_798 ) ( CLEAR ?auto_797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_798 )
      ( MAKE-2PILE ?auto_797 ?auto_798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_799 - BLOCK
      ?auto_800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_799 ?auto_800 ) ) ( ON-TABLE ?auto_800 ) ( HOLDING ?auto_799 ) ( CLEAR ?auto_800 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_800 ?auto_799 )
      ( MAKE-2PILE ?auto_799 ?auto_800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_801 - BLOCK
      ?auto_802 - BLOCK
    )
    :vars
    (
      ?auto_803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_801 ?auto_802 ) ) ( ON-TABLE ?auto_802 ) ( CLEAR ?auto_802 ) ( ON ?auto_801 ?auto_803 ) ( CLEAR ?auto_801 ) ( HAND-EMPTY ) ( not ( = ?auto_801 ?auto_803 ) ) ( not ( = ?auto_802 ?auto_803 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_801 ?auto_803 )
      ( MAKE-2PILE ?auto_801 ?auto_802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_804 - BLOCK
      ?auto_805 - BLOCK
    )
    :vars
    (
      ?auto_806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_804 ?auto_805 ) ) ( ON ?auto_804 ?auto_806 ) ( CLEAR ?auto_804 ) ( not ( = ?auto_804 ?auto_806 ) ) ( not ( = ?auto_805 ?auto_806 ) ) ( HOLDING ?auto_805 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_805 )
      ( MAKE-2PILE ?auto_804 ?auto_805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_807 - BLOCK
      ?auto_808 - BLOCK
    )
    :vars
    (
      ?auto_809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_807 ?auto_808 ) ) ( ON ?auto_807 ?auto_809 ) ( not ( = ?auto_807 ?auto_809 ) ) ( not ( = ?auto_808 ?auto_809 ) ) ( ON ?auto_808 ?auto_807 ) ( CLEAR ?auto_808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_809 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_809 ?auto_807 )
      ( MAKE-2PILE ?auto_807 ?auto_808 ) )
  )

)

