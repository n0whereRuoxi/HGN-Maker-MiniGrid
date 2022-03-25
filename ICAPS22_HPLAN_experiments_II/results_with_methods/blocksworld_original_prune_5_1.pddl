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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16702 - BLOCK
      ?auto_16703 - BLOCK
      ?auto_16704 - BLOCK
      ?auto_16705 - BLOCK
      ?auto_16706 - BLOCK
    )
    :vars
    (
      ?auto_16707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16707 ?auto_16706 ) ( CLEAR ?auto_16707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16702 ) ( ON ?auto_16703 ?auto_16702 ) ( ON ?auto_16704 ?auto_16703 ) ( ON ?auto_16705 ?auto_16704 ) ( ON ?auto_16706 ?auto_16705 ) ( not ( = ?auto_16702 ?auto_16703 ) ) ( not ( = ?auto_16702 ?auto_16704 ) ) ( not ( = ?auto_16702 ?auto_16705 ) ) ( not ( = ?auto_16702 ?auto_16706 ) ) ( not ( = ?auto_16702 ?auto_16707 ) ) ( not ( = ?auto_16703 ?auto_16704 ) ) ( not ( = ?auto_16703 ?auto_16705 ) ) ( not ( = ?auto_16703 ?auto_16706 ) ) ( not ( = ?auto_16703 ?auto_16707 ) ) ( not ( = ?auto_16704 ?auto_16705 ) ) ( not ( = ?auto_16704 ?auto_16706 ) ) ( not ( = ?auto_16704 ?auto_16707 ) ) ( not ( = ?auto_16705 ?auto_16706 ) ) ( not ( = ?auto_16705 ?auto_16707 ) ) ( not ( = ?auto_16706 ?auto_16707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16707 ?auto_16706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16709 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16709 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16710 - BLOCK
    )
    :vars
    (
      ?auto_16711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16710 ?auto_16711 ) ( CLEAR ?auto_16710 ) ( HAND-EMPTY ) ( not ( = ?auto_16710 ?auto_16711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16710 ?auto_16711 )
      ( MAKE-1PILE ?auto_16710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16716 - BLOCK
      ?auto_16717 - BLOCK
      ?auto_16718 - BLOCK
      ?auto_16719 - BLOCK
    )
    :vars
    (
      ?auto_16720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16720 ?auto_16719 ) ( CLEAR ?auto_16720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16716 ) ( ON ?auto_16717 ?auto_16716 ) ( ON ?auto_16718 ?auto_16717 ) ( ON ?auto_16719 ?auto_16718 ) ( not ( = ?auto_16716 ?auto_16717 ) ) ( not ( = ?auto_16716 ?auto_16718 ) ) ( not ( = ?auto_16716 ?auto_16719 ) ) ( not ( = ?auto_16716 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16718 ) ) ( not ( = ?auto_16717 ?auto_16719 ) ) ( not ( = ?auto_16717 ?auto_16720 ) ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( not ( = ?auto_16718 ?auto_16720 ) ) ( not ( = ?auto_16719 ?auto_16720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16720 ?auto_16719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16721 - BLOCK
      ?auto_16722 - BLOCK
      ?auto_16723 - BLOCK
      ?auto_16724 - BLOCK
    )
    :vars
    (
      ?auto_16725 - BLOCK
      ?auto_16726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16725 ?auto_16724 ) ( CLEAR ?auto_16725 ) ( ON-TABLE ?auto_16721 ) ( ON ?auto_16722 ?auto_16721 ) ( ON ?auto_16723 ?auto_16722 ) ( ON ?auto_16724 ?auto_16723 ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( not ( = ?auto_16721 ?auto_16723 ) ) ( not ( = ?auto_16721 ?auto_16724 ) ) ( not ( = ?auto_16721 ?auto_16725 ) ) ( not ( = ?auto_16722 ?auto_16723 ) ) ( not ( = ?auto_16722 ?auto_16724 ) ) ( not ( = ?auto_16722 ?auto_16725 ) ) ( not ( = ?auto_16723 ?auto_16724 ) ) ( not ( = ?auto_16723 ?auto_16725 ) ) ( not ( = ?auto_16724 ?auto_16725 ) ) ( HOLDING ?auto_16726 ) ( not ( = ?auto_16721 ?auto_16726 ) ) ( not ( = ?auto_16722 ?auto_16726 ) ) ( not ( = ?auto_16723 ?auto_16726 ) ) ( not ( = ?auto_16724 ?auto_16726 ) ) ( not ( = ?auto_16725 ?auto_16726 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16726 )
      ( MAKE-4PILE ?auto_16721 ?auto_16722 ?auto_16723 ?auto_16724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16727 - BLOCK
      ?auto_16728 - BLOCK
      ?auto_16729 - BLOCK
      ?auto_16730 - BLOCK
    )
    :vars
    (
      ?auto_16732 - BLOCK
      ?auto_16731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16732 ?auto_16730 ) ( ON-TABLE ?auto_16727 ) ( ON ?auto_16728 ?auto_16727 ) ( ON ?auto_16729 ?auto_16728 ) ( ON ?auto_16730 ?auto_16729 ) ( not ( = ?auto_16727 ?auto_16728 ) ) ( not ( = ?auto_16727 ?auto_16729 ) ) ( not ( = ?auto_16727 ?auto_16730 ) ) ( not ( = ?auto_16727 ?auto_16732 ) ) ( not ( = ?auto_16728 ?auto_16729 ) ) ( not ( = ?auto_16728 ?auto_16730 ) ) ( not ( = ?auto_16728 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16730 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16730 ?auto_16732 ) ) ( not ( = ?auto_16727 ?auto_16731 ) ) ( not ( = ?auto_16728 ?auto_16731 ) ) ( not ( = ?auto_16729 ?auto_16731 ) ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16732 ?auto_16731 ) ) ( ON ?auto_16731 ?auto_16732 ) ( CLEAR ?auto_16731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16727 ?auto_16728 ?auto_16729 ?auto_16730 ?auto_16732 )
      ( MAKE-4PILE ?auto_16727 ?auto_16728 ?auto_16729 ?auto_16730 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16735 - BLOCK
      ?auto_16736 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16736 ) ( CLEAR ?auto_16735 ) ( ON-TABLE ?auto_16735 ) ( not ( = ?auto_16735 ?auto_16736 ) ) )
    :subtasks
    ( ( !STACK ?auto_16736 ?auto_16735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16737 - BLOCK
      ?auto_16738 - BLOCK
    )
    :vars
    (
      ?auto_16739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16737 ) ( ON-TABLE ?auto_16737 ) ( not ( = ?auto_16737 ?auto_16738 ) ) ( ON ?auto_16738 ?auto_16739 ) ( CLEAR ?auto_16738 ) ( HAND-EMPTY ) ( not ( = ?auto_16737 ?auto_16739 ) ) ( not ( = ?auto_16738 ?auto_16739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16738 ?auto_16739 )
      ( MAKE-2PILE ?auto_16737 ?auto_16738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16740 - BLOCK
      ?auto_16741 - BLOCK
    )
    :vars
    (
      ?auto_16742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16740 ?auto_16741 ) ) ( ON ?auto_16741 ?auto_16742 ) ( CLEAR ?auto_16741 ) ( not ( = ?auto_16740 ?auto_16742 ) ) ( not ( = ?auto_16741 ?auto_16742 ) ) ( HOLDING ?auto_16740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16740 )
      ( MAKE-2PILE ?auto_16740 ?auto_16741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16743 - BLOCK
      ?auto_16744 - BLOCK
    )
    :vars
    (
      ?auto_16745 - BLOCK
      ?auto_16748 - BLOCK
      ?auto_16746 - BLOCK
      ?auto_16747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16743 ?auto_16744 ) ) ( ON ?auto_16744 ?auto_16745 ) ( not ( = ?auto_16743 ?auto_16745 ) ) ( not ( = ?auto_16744 ?auto_16745 ) ) ( ON ?auto_16743 ?auto_16744 ) ( CLEAR ?auto_16743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16748 ) ( ON ?auto_16746 ?auto_16748 ) ( ON ?auto_16747 ?auto_16746 ) ( ON ?auto_16745 ?auto_16747 ) ( not ( = ?auto_16748 ?auto_16746 ) ) ( not ( = ?auto_16748 ?auto_16747 ) ) ( not ( = ?auto_16748 ?auto_16745 ) ) ( not ( = ?auto_16748 ?auto_16744 ) ) ( not ( = ?auto_16748 ?auto_16743 ) ) ( not ( = ?auto_16746 ?auto_16747 ) ) ( not ( = ?auto_16746 ?auto_16745 ) ) ( not ( = ?auto_16746 ?auto_16744 ) ) ( not ( = ?auto_16746 ?auto_16743 ) ) ( not ( = ?auto_16747 ?auto_16745 ) ) ( not ( = ?auto_16747 ?auto_16744 ) ) ( not ( = ?auto_16747 ?auto_16743 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16748 ?auto_16746 ?auto_16747 ?auto_16745 ?auto_16744 )
      ( MAKE-2PILE ?auto_16743 ?auto_16744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16752 - BLOCK
      ?auto_16753 - BLOCK
      ?auto_16754 - BLOCK
    )
    :vars
    (
      ?auto_16755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16755 ?auto_16754 ) ( CLEAR ?auto_16755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16752 ) ( ON ?auto_16753 ?auto_16752 ) ( ON ?auto_16754 ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16755 ) ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16754 ?auto_16755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16755 ?auto_16754 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16756 - BLOCK
      ?auto_16757 - BLOCK
      ?auto_16758 - BLOCK
    )
    :vars
    (
      ?auto_16759 - BLOCK
      ?auto_16760 - BLOCK
      ?auto_16761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16759 ?auto_16758 ) ( CLEAR ?auto_16759 ) ( ON-TABLE ?auto_16756 ) ( ON ?auto_16757 ?auto_16756 ) ( ON ?auto_16758 ?auto_16757 ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( HOLDING ?auto_16760 ) ( CLEAR ?auto_16761 ) ( not ( = ?auto_16756 ?auto_16760 ) ) ( not ( = ?auto_16756 ?auto_16761 ) ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16761 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16761 ) ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16761 ) ) ( not ( = ?auto_16760 ?auto_16761 ) ) )
    :subtasks
    ( ( !STACK ?auto_16760 ?auto_16761 )
      ( MAKE-3PILE ?auto_16756 ?auto_16757 ?auto_16758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17124 - BLOCK
      ?auto_17125 - BLOCK
      ?auto_17126 - BLOCK
    )
    :vars
    (
      ?auto_17127 - BLOCK
      ?auto_17128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17127 ?auto_17126 ) ( ON-TABLE ?auto_17124 ) ( ON ?auto_17125 ?auto_17124 ) ( ON ?auto_17126 ?auto_17125 ) ( not ( = ?auto_17124 ?auto_17125 ) ) ( not ( = ?auto_17124 ?auto_17126 ) ) ( not ( = ?auto_17124 ?auto_17127 ) ) ( not ( = ?auto_17125 ?auto_17126 ) ) ( not ( = ?auto_17125 ?auto_17127 ) ) ( not ( = ?auto_17126 ?auto_17127 ) ) ( not ( = ?auto_17124 ?auto_17128 ) ) ( not ( = ?auto_17125 ?auto_17128 ) ) ( not ( = ?auto_17126 ?auto_17128 ) ) ( not ( = ?auto_17127 ?auto_17128 ) ) ( ON ?auto_17128 ?auto_17127 ) ( CLEAR ?auto_17128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17124 ?auto_17125 ?auto_17126 ?auto_17127 )
      ( MAKE-3PILE ?auto_17124 ?auto_17125 ?auto_17126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16768 - BLOCK
      ?auto_16769 - BLOCK
      ?auto_16770 - BLOCK
    )
    :vars
    (
      ?auto_16773 - BLOCK
      ?auto_16771 - BLOCK
      ?auto_16772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16773 ?auto_16770 ) ( ON-TABLE ?auto_16768 ) ( ON ?auto_16769 ?auto_16768 ) ( ON ?auto_16770 ?auto_16769 ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16773 ) ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16773 ?auto_16771 ) ) ( not ( = ?auto_16773 ?auto_16772 ) ) ( not ( = ?auto_16771 ?auto_16772 ) ) ( ON ?auto_16771 ?auto_16773 ) ( CLEAR ?auto_16771 ) ( HOLDING ?auto_16772 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16772 )
      ( MAKE-3PILE ?auto_16768 ?auto_16769 ?auto_16770 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16774 - BLOCK
      ?auto_16775 - BLOCK
      ?auto_16776 - BLOCK
    )
    :vars
    (
      ?auto_16777 - BLOCK
      ?auto_16778 - BLOCK
      ?auto_16779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16777 ?auto_16776 ) ( ON-TABLE ?auto_16774 ) ( ON ?auto_16775 ?auto_16774 ) ( ON ?auto_16776 ?auto_16775 ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( not ( = ?auto_16774 ?auto_16777 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( not ( = ?auto_16774 ?auto_16778 ) ) ( not ( = ?auto_16774 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16778 ) ) ( not ( = ?auto_16775 ?auto_16779 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( not ( = ?auto_16776 ?auto_16779 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16779 ) ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( ON ?auto_16778 ?auto_16777 ) ( ON ?auto_16779 ?auto_16778 ) ( CLEAR ?auto_16779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16774 ?auto_16775 ?auto_16776 ?auto_16777 ?auto_16778 )
      ( MAKE-3PILE ?auto_16774 ?auto_16775 ?auto_16776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16783 - BLOCK
      ?auto_16784 - BLOCK
      ?auto_16785 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16785 ) ( CLEAR ?auto_16784 ) ( ON-TABLE ?auto_16783 ) ( ON ?auto_16784 ?auto_16783 ) ( not ( = ?auto_16783 ?auto_16784 ) ) ( not ( = ?auto_16783 ?auto_16785 ) ) ( not ( = ?auto_16784 ?auto_16785 ) ) )
    :subtasks
    ( ( !STACK ?auto_16785 ?auto_16784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16786 - BLOCK
      ?auto_16787 - BLOCK
      ?auto_16788 - BLOCK
    )
    :vars
    (
      ?auto_16789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16787 ) ( ON-TABLE ?auto_16786 ) ( ON ?auto_16787 ?auto_16786 ) ( not ( = ?auto_16786 ?auto_16787 ) ) ( not ( = ?auto_16786 ?auto_16788 ) ) ( not ( = ?auto_16787 ?auto_16788 ) ) ( ON ?auto_16788 ?auto_16789 ) ( CLEAR ?auto_16788 ) ( HAND-EMPTY ) ( not ( = ?auto_16786 ?auto_16789 ) ) ( not ( = ?auto_16787 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16788 ?auto_16789 )
      ( MAKE-3PILE ?auto_16786 ?auto_16787 ?auto_16788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16790 - BLOCK
      ?auto_16791 - BLOCK
      ?auto_16792 - BLOCK
    )
    :vars
    (
      ?auto_16793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16790 ) ( not ( = ?auto_16790 ?auto_16791 ) ) ( not ( = ?auto_16790 ?auto_16792 ) ) ( not ( = ?auto_16791 ?auto_16792 ) ) ( ON ?auto_16792 ?auto_16793 ) ( CLEAR ?auto_16792 ) ( not ( = ?auto_16790 ?auto_16793 ) ) ( not ( = ?auto_16791 ?auto_16793 ) ) ( not ( = ?auto_16792 ?auto_16793 ) ) ( HOLDING ?auto_16791 ) ( CLEAR ?auto_16790 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16790 ?auto_16791 )
      ( MAKE-3PILE ?auto_16790 ?auto_16791 ?auto_16792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16794 - BLOCK
      ?auto_16795 - BLOCK
      ?auto_16796 - BLOCK
    )
    :vars
    (
      ?auto_16797 - BLOCK
      ?auto_16799 - BLOCK
      ?auto_16798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16794 ) ( not ( = ?auto_16794 ?auto_16795 ) ) ( not ( = ?auto_16794 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( ON ?auto_16796 ?auto_16797 ) ( not ( = ?auto_16794 ?auto_16797 ) ) ( not ( = ?auto_16795 ?auto_16797 ) ) ( not ( = ?auto_16796 ?auto_16797 ) ) ( CLEAR ?auto_16794 ) ( ON ?auto_16795 ?auto_16796 ) ( CLEAR ?auto_16795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16799 ) ( ON ?auto_16798 ?auto_16799 ) ( ON ?auto_16797 ?auto_16798 ) ( not ( = ?auto_16799 ?auto_16798 ) ) ( not ( = ?auto_16799 ?auto_16797 ) ) ( not ( = ?auto_16799 ?auto_16796 ) ) ( not ( = ?auto_16799 ?auto_16795 ) ) ( not ( = ?auto_16798 ?auto_16797 ) ) ( not ( = ?auto_16798 ?auto_16796 ) ) ( not ( = ?auto_16798 ?auto_16795 ) ) ( not ( = ?auto_16794 ?auto_16799 ) ) ( not ( = ?auto_16794 ?auto_16798 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16799 ?auto_16798 ?auto_16797 ?auto_16796 )
      ( MAKE-3PILE ?auto_16794 ?auto_16795 ?auto_16796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16800 - BLOCK
      ?auto_16801 - BLOCK
      ?auto_16802 - BLOCK
    )
    :vars
    (
      ?auto_16805 - BLOCK
      ?auto_16803 - BLOCK
      ?auto_16804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16800 ?auto_16801 ) ) ( not ( = ?auto_16800 ?auto_16802 ) ) ( not ( = ?auto_16801 ?auto_16802 ) ) ( ON ?auto_16802 ?auto_16805 ) ( not ( = ?auto_16800 ?auto_16805 ) ) ( not ( = ?auto_16801 ?auto_16805 ) ) ( not ( = ?auto_16802 ?auto_16805 ) ) ( ON ?auto_16801 ?auto_16802 ) ( CLEAR ?auto_16801 ) ( ON-TABLE ?auto_16803 ) ( ON ?auto_16804 ?auto_16803 ) ( ON ?auto_16805 ?auto_16804 ) ( not ( = ?auto_16803 ?auto_16804 ) ) ( not ( = ?auto_16803 ?auto_16805 ) ) ( not ( = ?auto_16803 ?auto_16802 ) ) ( not ( = ?auto_16803 ?auto_16801 ) ) ( not ( = ?auto_16804 ?auto_16805 ) ) ( not ( = ?auto_16804 ?auto_16802 ) ) ( not ( = ?auto_16804 ?auto_16801 ) ) ( not ( = ?auto_16800 ?auto_16803 ) ) ( not ( = ?auto_16800 ?auto_16804 ) ) ( HOLDING ?auto_16800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16800 )
      ( MAKE-3PILE ?auto_16800 ?auto_16801 ?auto_16802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16806 - BLOCK
      ?auto_16807 - BLOCK
      ?auto_16808 - BLOCK
    )
    :vars
    (
      ?auto_16809 - BLOCK
      ?auto_16810 - BLOCK
      ?auto_16811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16806 ?auto_16807 ) ) ( not ( = ?auto_16806 ?auto_16808 ) ) ( not ( = ?auto_16807 ?auto_16808 ) ) ( ON ?auto_16808 ?auto_16809 ) ( not ( = ?auto_16806 ?auto_16809 ) ) ( not ( = ?auto_16807 ?auto_16809 ) ) ( not ( = ?auto_16808 ?auto_16809 ) ) ( ON ?auto_16807 ?auto_16808 ) ( ON-TABLE ?auto_16810 ) ( ON ?auto_16811 ?auto_16810 ) ( ON ?auto_16809 ?auto_16811 ) ( not ( = ?auto_16810 ?auto_16811 ) ) ( not ( = ?auto_16810 ?auto_16809 ) ) ( not ( = ?auto_16810 ?auto_16808 ) ) ( not ( = ?auto_16810 ?auto_16807 ) ) ( not ( = ?auto_16811 ?auto_16809 ) ) ( not ( = ?auto_16811 ?auto_16808 ) ) ( not ( = ?auto_16811 ?auto_16807 ) ) ( not ( = ?auto_16806 ?auto_16810 ) ) ( not ( = ?auto_16806 ?auto_16811 ) ) ( ON ?auto_16806 ?auto_16807 ) ( CLEAR ?auto_16806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16810 ?auto_16811 ?auto_16809 ?auto_16808 ?auto_16807 )
      ( MAKE-3PILE ?auto_16806 ?auto_16807 ?auto_16808 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16814 - BLOCK
      ?auto_16815 - BLOCK
    )
    :vars
    (
      ?auto_16816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16816 ?auto_16815 ) ( CLEAR ?auto_16816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16814 ) ( ON ?auto_16815 ?auto_16814 ) ( not ( = ?auto_16814 ?auto_16815 ) ) ( not ( = ?auto_16814 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16816 ?auto_16815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16817 - BLOCK
      ?auto_16818 - BLOCK
    )
    :vars
    (
      ?auto_16819 - BLOCK
      ?auto_16820 - BLOCK
      ?auto_16821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16819 ?auto_16818 ) ( CLEAR ?auto_16819 ) ( ON-TABLE ?auto_16817 ) ( ON ?auto_16818 ?auto_16817 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( HOLDING ?auto_16820 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16817 ?auto_16820 ) ) ( not ( = ?auto_16817 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16820 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( not ( = ?auto_16820 ?auto_16821 ) ) )
    :subtasks
    ( ( !STACK ?auto_16820 ?auto_16821 )
      ( MAKE-2PILE ?auto_16817 ?auto_16818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16822 - BLOCK
      ?auto_16823 - BLOCK
    )
    :vars
    (
      ?auto_16825 - BLOCK
      ?auto_16824 - BLOCK
      ?auto_16826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16825 ?auto_16823 ) ( ON-TABLE ?auto_16822 ) ( ON ?auto_16823 ?auto_16822 ) ( not ( = ?auto_16822 ?auto_16823 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16823 ?auto_16825 ) ) ( CLEAR ?auto_16824 ) ( not ( = ?auto_16822 ?auto_16826 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16824 ) ) ( not ( = ?auto_16826 ?auto_16824 ) ) ( ON ?auto_16826 ?auto_16825 ) ( CLEAR ?auto_16826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16822 ?auto_16823 ?auto_16825 )
      ( MAKE-2PILE ?auto_16822 ?auto_16823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16827 - BLOCK
      ?auto_16828 - BLOCK
    )
    :vars
    (
      ?auto_16831 - BLOCK
      ?auto_16830 - BLOCK
      ?auto_16829 - BLOCK
      ?auto_16832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16831 ?auto_16828 ) ( ON-TABLE ?auto_16827 ) ( ON ?auto_16828 ?auto_16827 ) ( not ( = ?auto_16827 ?auto_16828 ) ) ( not ( = ?auto_16827 ?auto_16831 ) ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16831 ?auto_16830 ) ) ( not ( = ?auto_16831 ?auto_16829 ) ) ( not ( = ?auto_16830 ?auto_16829 ) ) ( ON ?auto_16830 ?auto_16831 ) ( CLEAR ?auto_16830 ) ( HOLDING ?auto_16829 ) ( CLEAR ?auto_16832 ) ( ON-TABLE ?auto_16832 ) ( not ( = ?auto_16832 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16832 ) ) ( not ( = ?auto_16828 ?auto_16832 ) ) ( not ( = ?auto_16831 ?auto_16832 ) ) ( not ( = ?auto_16830 ?auto_16832 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16832 ?auto_16829 )
      ( MAKE-2PILE ?auto_16827 ?auto_16828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17251 - BLOCK
      ?auto_17252 - BLOCK
    )
    :vars
    (
      ?auto_17254 - BLOCK
      ?auto_17253 - BLOCK
      ?auto_17255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17254 ?auto_17252 ) ( ON-TABLE ?auto_17251 ) ( ON ?auto_17252 ?auto_17251 ) ( not ( = ?auto_17251 ?auto_17252 ) ) ( not ( = ?auto_17251 ?auto_17254 ) ) ( not ( = ?auto_17252 ?auto_17254 ) ) ( not ( = ?auto_17251 ?auto_17253 ) ) ( not ( = ?auto_17251 ?auto_17255 ) ) ( not ( = ?auto_17252 ?auto_17253 ) ) ( not ( = ?auto_17252 ?auto_17255 ) ) ( not ( = ?auto_17254 ?auto_17253 ) ) ( not ( = ?auto_17254 ?auto_17255 ) ) ( not ( = ?auto_17253 ?auto_17255 ) ) ( ON ?auto_17253 ?auto_17254 ) ( ON ?auto_17255 ?auto_17253 ) ( CLEAR ?auto_17255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17251 ?auto_17252 ?auto_17254 ?auto_17253 )
      ( MAKE-2PILE ?auto_17251 ?auto_17252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16839 - BLOCK
      ?auto_16840 - BLOCK
    )
    :vars
    (
      ?auto_16842 - BLOCK
      ?auto_16844 - BLOCK
      ?auto_16843 - BLOCK
      ?auto_16841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16842 ?auto_16840 ) ( ON-TABLE ?auto_16839 ) ( ON ?auto_16840 ?auto_16839 ) ( not ( = ?auto_16839 ?auto_16840 ) ) ( not ( = ?auto_16839 ?auto_16842 ) ) ( not ( = ?auto_16840 ?auto_16842 ) ) ( not ( = ?auto_16839 ?auto_16844 ) ) ( not ( = ?auto_16839 ?auto_16843 ) ) ( not ( = ?auto_16840 ?auto_16844 ) ) ( not ( = ?auto_16840 ?auto_16843 ) ) ( not ( = ?auto_16842 ?auto_16844 ) ) ( not ( = ?auto_16842 ?auto_16843 ) ) ( not ( = ?auto_16844 ?auto_16843 ) ) ( ON ?auto_16844 ?auto_16842 ) ( not ( = ?auto_16841 ?auto_16843 ) ) ( not ( = ?auto_16839 ?auto_16841 ) ) ( not ( = ?auto_16840 ?auto_16841 ) ) ( not ( = ?auto_16842 ?auto_16841 ) ) ( not ( = ?auto_16844 ?auto_16841 ) ) ( ON ?auto_16843 ?auto_16844 ) ( CLEAR ?auto_16843 ) ( HOLDING ?auto_16841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16841 )
      ( MAKE-2PILE ?auto_16839 ?auto_16840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16845 - BLOCK
      ?auto_16846 - BLOCK
    )
    :vars
    (
      ?auto_16849 - BLOCK
      ?auto_16848 - BLOCK
      ?auto_16847 - BLOCK
      ?auto_16850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16849 ?auto_16846 ) ( ON-TABLE ?auto_16845 ) ( ON ?auto_16846 ?auto_16845 ) ( not ( = ?auto_16845 ?auto_16846 ) ) ( not ( = ?auto_16845 ?auto_16849 ) ) ( not ( = ?auto_16846 ?auto_16849 ) ) ( not ( = ?auto_16845 ?auto_16848 ) ) ( not ( = ?auto_16845 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( not ( = ?auto_16849 ?auto_16848 ) ) ( not ( = ?auto_16849 ?auto_16847 ) ) ( not ( = ?auto_16848 ?auto_16847 ) ) ( ON ?auto_16848 ?auto_16849 ) ( not ( = ?auto_16850 ?auto_16847 ) ) ( not ( = ?auto_16845 ?auto_16850 ) ) ( not ( = ?auto_16846 ?auto_16850 ) ) ( not ( = ?auto_16849 ?auto_16850 ) ) ( not ( = ?auto_16848 ?auto_16850 ) ) ( ON ?auto_16847 ?auto_16848 ) ( ON ?auto_16850 ?auto_16847 ) ( CLEAR ?auto_16850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16845 ?auto_16846 ?auto_16849 ?auto_16848 ?auto_16847 )
      ( MAKE-2PILE ?auto_16845 ?auto_16846 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16855 - BLOCK
      ?auto_16856 - BLOCK
      ?auto_16857 - BLOCK
      ?auto_16858 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16858 ) ( CLEAR ?auto_16857 ) ( ON-TABLE ?auto_16855 ) ( ON ?auto_16856 ?auto_16855 ) ( ON ?auto_16857 ?auto_16856 ) ( not ( = ?auto_16855 ?auto_16856 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16857 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16857 ?auto_16858 ) ) )
    :subtasks
    ( ( !STACK ?auto_16858 ?auto_16857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16859 - BLOCK
      ?auto_16860 - BLOCK
      ?auto_16861 - BLOCK
      ?auto_16862 - BLOCK
    )
    :vars
    (
      ?auto_16863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16861 ) ( ON-TABLE ?auto_16859 ) ( ON ?auto_16860 ?auto_16859 ) ( ON ?auto_16861 ?auto_16860 ) ( not ( = ?auto_16859 ?auto_16860 ) ) ( not ( = ?auto_16859 ?auto_16861 ) ) ( not ( = ?auto_16859 ?auto_16862 ) ) ( not ( = ?auto_16860 ?auto_16861 ) ) ( not ( = ?auto_16860 ?auto_16862 ) ) ( not ( = ?auto_16861 ?auto_16862 ) ) ( ON ?auto_16862 ?auto_16863 ) ( CLEAR ?auto_16862 ) ( HAND-EMPTY ) ( not ( = ?auto_16859 ?auto_16863 ) ) ( not ( = ?auto_16860 ?auto_16863 ) ) ( not ( = ?auto_16861 ?auto_16863 ) ) ( not ( = ?auto_16862 ?auto_16863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16862 ?auto_16863 )
      ( MAKE-4PILE ?auto_16859 ?auto_16860 ?auto_16861 ?auto_16862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16864 - BLOCK
      ?auto_16865 - BLOCK
      ?auto_16866 - BLOCK
      ?auto_16867 - BLOCK
    )
    :vars
    (
      ?auto_16868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16864 ) ( ON ?auto_16865 ?auto_16864 ) ( not ( = ?auto_16864 ?auto_16865 ) ) ( not ( = ?auto_16864 ?auto_16866 ) ) ( not ( = ?auto_16864 ?auto_16867 ) ) ( not ( = ?auto_16865 ?auto_16866 ) ) ( not ( = ?auto_16865 ?auto_16867 ) ) ( not ( = ?auto_16866 ?auto_16867 ) ) ( ON ?auto_16867 ?auto_16868 ) ( CLEAR ?auto_16867 ) ( not ( = ?auto_16864 ?auto_16868 ) ) ( not ( = ?auto_16865 ?auto_16868 ) ) ( not ( = ?auto_16866 ?auto_16868 ) ) ( not ( = ?auto_16867 ?auto_16868 ) ) ( HOLDING ?auto_16866 ) ( CLEAR ?auto_16865 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16864 ?auto_16865 ?auto_16866 )
      ( MAKE-4PILE ?auto_16864 ?auto_16865 ?auto_16866 ?auto_16867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16869 - BLOCK
      ?auto_16870 - BLOCK
      ?auto_16871 - BLOCK
      ?auto_16872 - BLOCK
    )
    :vars
    (
      ?auto_16873 - BLOCK
      ?auto_16874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16869 ) ( ON ?auto_16870 ?auto_16869 ) ( not ( = ?auto_16869 ?auto_16870 ) ) ( not ( = ?auto_16869 ?auto_16871 ) ) ( not ( = ?auto_16869 ?auto_16872 ) ) ( not ( = ?auto_16870 ?auto_16871 ) ) ( not ( = ?auto_16870 ?auto_16872 ) ) ( not ( = ?auto_16871 ?auto_16872 ) ) ( ON ?auto_16872 ?auto_16873 ) ( not ( = ?auto_16869 ?auto_16873 ) ) ( not ( = ?auto_16870 ?auto_16873 ) ) ( not ( = ?auto_16871 ?auto_16873 ) ) ( not ( = ?auto_16872 ?auto_16873 ) ) ( CLEAR ?auto_16870 ) ( ON ?auto_16871 ?auto_16872 ) ( CLEAR ?auto_16871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16874 ) ( ON ?auto_16873 ?auto_16874 ) ( not ( = ?auto_16874 ?auto_16873 ) ) ( not ( = ?auto_16874 ?auto_16872 ) ) ( not ( = ?auto_16874 ?auto_16871 ) ) ( not ( = ?auto_16869 ?auto_16874 ) ) ( not ( = ?auto_16870 ?auto_16874 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16874 ?auto_16873 ?auto_16872 )
      ( MAKE-4PILE ?auto_16869 ?auto_16870 ?auto_16871 ?auto_16872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16875 - BLOCK
      ?auto_16876 - BLOCK
      ?auto_16877 - BLOCK
      ?auto_16878 - BLOCK
    )
    :vars
    (
      ?auto_16879 - BLOCK
      ?auto_16880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16875 ) ( not ( = ?auto_16875 ?auto_16876 ) ) ( not ( = ?auto_16875 ?auto_16877 ) ) ( not ( = ?auto_16875 ?auto_16878 ) ) ( not ( = ?auto_16876 ?auto_16877 ) ) ( not ( = ?auto_16876 ?auto_16878 ) ) ( not ( = ?auto_16877 ?auto_16878 ) ) ( ON ?auto_16878 ?auto_16879 ) ( not ( = ?auto_16875 ?auto_16879 ) ) ( not ( = ?auto_16876 ?auto_16879 ) ) ( not ( = ?auto_16877 ?auto_16879 ) ) ( not ( = ?auto_16878 ?auto_16879 ) ) ( ON ?auto_16877 ?auto_16878 ) ( CLEAR ?auto_16877 ) ( ON-TABLE ?auto_16880 ) ( ON ?auto_16879 ?auto_16880 ) ( not ( = ?auto_16880 ?auto_16879 ) ) ( not ( = ?auto_16880 ?auto_16878 ) ) ( not ( = ?auto_16880 ?auto_16877 ) ) ( not ( = ?auto_16875 ?auto_16880 ) ) ( not ( = ?auto_16876 ?auto_16880 ) ) ( HOLDING ?auto_16876 ) ( CLEAR ?auto_16875 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16875 ?auto_16876 )
      ( MAKE-4PILE ?auto_16875 ?auto_16876 ?auto_16877 ?auto_16878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16881 - BLOCK
      ?auto_16882 - BLOCK
      ?auto_16883 - BLOCK
      ?auto_16884 - BLOCK
    )
    :vars
    (
      ?auto_16885 - BLOCK
      ?auto_16886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16881 ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( not ( = ?auto_16881 ?auto_16883 ) ) ( not ( = ?auto_16881 ?auto_16884 ) ) ( not ( = ?auto_16882 ?auto_16883 ) ) ( not ( = ?auto_16882 ?auto_16884 ) ) ( not ( = ?auto_16883 ?auto_16884 ) ) ( ON ?auto_16884 ?auto_16885 ) ( not ( = ?auto_16881 ?auto_16885 ) ) ( not ( = ?auto_16882 ?auto_16885 ) ) ( not ( = ?auto_16883 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( ON ?auto_16883 ?auto_16884 ) ( ON-TABLE ?auto_16886 ) ( ON ?auto_16885 ?auto_16886 ) ( not ( = ?auto_16886 ?auto_16885 ) ) ( not ( = ?auto_16886 ?auto_16884 ) ) ( not ( = ?auto_16886 ?auto_16883 ) ) ( not ( = ?auto_16881 ?auto_16886 ) ) ( not ( = ?auto_16882 ?auto_16886 ) ) ( CLEAR ?auto_16881 ) ( ON ?auto_16882 ?auto_16883 ) ( CLEAR ?auto_16882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16886 ?auto_16885 ?auto_16884 ?auto_16883 )
      ( MAKE-4PILE ?auto_16881 ?auto_16882 ?auto_16883 ?auto_16884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16887 - BLOCK
      ?auto_16888 - BLOCK
      ?auto_16889 - BLOCK
      ?auto_16890 - BLOCK
    )
    :vars
    (
      ?auto_16891 - BLOCK
      ?auto_16892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( ON ?auto_16890 ?auto_16891 ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16888 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( ON ?auto_16889 ?auto_16890 ) ( ON-TABLE ?auto_16892 ) ( ON ?auto_16891 ?auto_16892 ) ( not ( = ?auto_16892 ?auto_16891 ) ) ( not ( = ?auto_16892 ?auto_16890 ) ) ( not ( = ?auto_16892 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16892 ) ) ( not ( = ?auto_16888 ?auto_16892 ) ) ( ON ?auto_16888 ?auto_16889 ) ( CLEAR ?auto_16888 ) ( HOLDING ?auto_16887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16887 )
      ( MAKE-4PILE ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16890 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16893 - BLOCK
      ?auto_16894 - BLOCK
      ?auto_16895 - BLOCK
      ?auto_16896 - BLOCK
    )
    :vars
    (
      ?auto_16898 - BLOCK
      ?auto_16897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( ON ?auto_16896 ?auto_16898 ) ( not ( = ?auto_16893 ?auto_16898 ) ) ( not ( = ?auto_16894 ?auto_16898 ) ) ( not ( = ?auto_16895 ?auto_16898 ) ) ( not ( = ?auto_16896 ?auto_16898 ) ) ( ON ?auto_16895 ?auto_16896 ) ( ON-TABLE ?auto_16897 ) ( ON ?auto_16898 ?auto_16897 ) ( not ( = ?auto_16897 ?auto_16898 ) ) ( not ( = ?auto_16897 ?auto_16896 ) ) ( not ( = ?auto_16897 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16897 ) ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( ON ?auto_16894 ?auto_16895 ) ( ON ?auto_16893 ?auto_16894 ) ( CLEAR ?auto_16893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16897 ?auto_16898 ?auto_16896 ?auto_16895 ?auto_16894 )
      ( MAKE-4PILE ?auto_16893 ?auto_16894 ?auto_16895 ?auto_16896 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16900 - BLOCK
    )
    :vars
    (
      ?auto_16901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16901 ?auto_16900 ) ( CLEAR ?auto_16901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16900 ) ( not ( = ?auto_16900 ?auto_16901 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16901 ?auto_16900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16902 - BLOCK
    )
    :vars
    (
      ?auto_16903 - BLOCK
      ?auto_16904 - BLOCK
      ?auto_16905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16903 ?auto_16902 ) ( CLEAR ?auto_16903 ) ( ON-TABLE ?auto_16902 ) ( not ( = ?auto_16902 ?auto_16903 ) ) ( HOLDING ?auto_16904 ) ( CLEAR ?auto_16905 ) ( not ( = ?auto_16902 ?auto_16904 ) ) ( not ( = ?auto_16902 ?auto_16905 ) ) ( not ( = ?auto_16903 ?auto_16904 ) ) ( not ( = ?auto_16903 ?auto_16905 ) ) ( not ( = ?auto_16904 ?auto_16905 ) ) )
    :subtasks
    ( ( !STACK ?auto_16904 ?auto_16905 )
      ( MAKE-1PILE ?auto_16902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16906 - BLOCK
    )
    :vars
    (
      ?auto_16907 - BLOCK
      ?auto_16908 - BLOCK
      ?auto_16909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16907 ?auto_16906 ) ( ON-TABLE ?auto_16906 ) ( not ( = ?auto_16906 ?auto_16907 ) ) ( CLEAR ?auto_16908 ) ( not ( = ?auto_16906 ?auto_16909 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16907 ?auto_16909 ) ) ( not ( = ?auto_16907 ?auto_16908 ) ) ( not ( = ?auto_16909 ?auto_16908 ) ) ( ON ?auto_16909 ?auto_16907 ) ( CLEAR ?auto_16909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16906 ?auto_16907 )
      ( MAKE-1PILE ?auto_16906 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16910 - BLOCK
    )
    :vars
    (
      ?auto_16912 - BLOCK
      ?auto_16911 - BLOCK
      ?auto_16913 - BLOCK
      ?auto_16914 - BLOCK
      ?auto_16915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16912 ?auto_16910 ) ( ON-TABLE ?auto_16910 ) ( not ( = ?auto_16910 ?auto_16912 ) ) ( not ( = ?auto_16910 ?auto_16911 ) ) ( not ( = ?auto_16910 ?auto_16913 ) ) ( not ( = ?auto_16912 ?auto_16911 ) ) ( not ( = ?auto_16912 ?auto_16913 ) ) ( not ( = ?auto_16911 ?auto_16913 ) ) ( ON ?auto_16911 ?auto_16912 ) ( CLEAR ?auto_16911 ) ( HOLDING ?auto_16913 ) ( CLEAR ?auto_16914 ) ( ON-TABLE ?auto_16915 ) ( ON ?auto_16914 ?auto_16915 ) ( not ( = ?auto_16915 ?auto_16914 ) ) ( not ( = ?auto_16915 ?auto_16913 ) ) ( not ( = ?auto_16914 ?auto_16913 ) ) ( not ( = ?auto_16910 ?auto_16914 ) ) ( not ( = ?auto_16910 ?auto_16915 ) ) ( not ( = ?auto_16912 ?auto_16914 ) ) ( not ( = ?auto_16912 ?auto_16915 ) ) ( not ( = ?auto_16911 ?auto_16914 ) ) ( not ( = ?auto_16911 ?auto_16915 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16915 ?auto_16914 ?auto_16913 )
      ( MAKE-1PILE ?auto_16910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16916 - BLOCK
    )
    :vars
    (
      ?auto_16919 - BLOCK
      ?auto_16917 - BLOCK
      ?auto_16920 - BLOCK
      ?auto_16918 - BLOCK
      ?auto_16921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16919 ?auto_16916 ) ( ON-TABLE ?auto_16916 ) ( not ( = ?auto_16916 ?auto_16919 ) ) ( not ( = ?auto_16916 ?auto_16917 ) ) ( not ( = ?auto_16916 ?auto_16920 ) ) ( not ( = ?auto_16919 ?auto_16917 ) ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( not ( = ?auto_16917 ?auto_16920 ) ) ( ON ?auto_16917 ?auto_16919 ) ( CLEAR ?auto_16918 ) ( ON-TABLE ?auto_16921 ) ( ON ?auto_16918 ?auto_16921 ) ( not ( = ?auto_16921 ?auto_16918 ) ) ( not ( = ?auto_16921 ?auto_16920 ) ) ( not ( = ?auto_16918 ?auto_16920 ) ) ( not ( = ?auto_16916 ?auto_16918 ) ) ( not ( = ?auto_16916 ?auto_16921 ) ) ( not ( = ?auto_16919 ?auto_16918 ) ) ( not ( = ?auto_16919 ?auto_16921 ) ) ( not ( = ?auto_16917 ?auto_16918 ) ) ( not ( = ?auto_16917 ?auto_16921 ) ) ( ON ?auto_16920 ?auto_16917 ) ( CLEAR ?auto_16920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16916 ?auto_16919 ?auto_16917 )
      ( MAKE-1PILE ?auto_16916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16922 - BLOCK
    )
    :vars
    (
      ?auto_16926 - BLOCK
      ?auto_16925 - BLOCK
      ?auto_16923 - BLOCK
      ?auto_16927 - BLOCK
      ?auto_16924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16926 ?auto_16922 ) ( ON-TABLE ?auto_16922 ) ( not ( = ?auto_16922 ?auto_16926 ) ) ( not ( = ?auto_16922 ?auto_16925 ) ) ( not ( = ?auto_16922 ?auto_16923 ) ) ( not ( = ?auto_16926 ?auto_16925 ) ) ( not ( = ?auto_16926 ?auto_16923 ) ) ( not ( = ?auto_16925 ?auto_16923 ) ) ( ON ?auto_16925 ?auto_16926 ) ( ON-TABLE ?auto_16927 ) ( not ( = ?auto_16927 ?auto_16924 ) ) ( not ( = ?auto_16927 ?auto_16923 ) ) ( not ( = ?auto_16924 ?auto_16923 ) ) ( not ( = ?auto_16922 ?auto_16924 ) ) ( not ( = ?auto_16922 ?auto_16927 ) ) ( not ( = ?auto_16926 ?auto_16924 ) ) ( not ( = ?auto_16926 ?auto_16927 ) ) ( not ( = ?auto_16925 ?auto_16924 ) ) ( not ( = ?auto_16925 ?auto_16927 ) ) ( ON ?auto_16923 ?auto_16925 ) ( CLEAR ?auto_16923 ) ( HOLDING ?auto_16924 ) ( CLEAR ?auto_16927 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16927 ?auto_16924 )
      ( MAKE-1PILE ?auto_16922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17391 - BLOCK
    )
    :vars
    (
      ?auto_17393 - BLOCK
      ?auto_17392 - BLOCK
      ?auto_17394 - BLOCK
      ?auto_17395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17393 ?auto_17391 ) ( ON-TABLE ?auto_17391 ) ( not ( = ?auto_17391 ?auto_17393 ) ) ( not ( = ?auto_17391 ?auto_17392 ) ) ( not ( = ?auto_17391 ?auto_17394 ) ) ( not ( = ?auto_17393 ?auto_17392 ) ) ( not ( = ?auto_17393 ?auto_17394 ) ) ( not ( = ?auto_17392 ?auto_17394 ) ) ( ON ?auto_17392 ?auto_17393 ) ( not ( = ?auto_17395 ?auto_17394 ) ) ( not ( = ?auto_17391 ?auto_17395 ) ) ( not ( = ?auto_17393 ?auto_17395 ) ) ( not ( = ?auto_17392 ?auto_17395 ) ) ( ON ?auto_17394 ?auto_17392 ) ( ON ?auto_17395 ?auto_17394 ) ( CLEAR ?auto_17395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17391 ?auto_17393 ?auto_17392 ?auto_17394 )
      ( MAKE-1PILE ?auto_17391 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16934 - BLOCK
    )
    :vars
    (
      ?auto_16937 - BLOCK
      ?auto_16936 - BLOCK
      ?auto_16935 - BLOCK
      ?auto_16938 - BLOCK
      ?auto_16939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16937 ?auto_16934 ) ( ON-TABLE ?auto_16934 ) ( not ( = ?auto_16934 ?auto_16937 ) ) ( not ( = ?auto_16934 ?auto_16936 ) ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( not ( = ?auto_16937 ?auto_16936 ) ) ( not ( = ?auto_16937 ?auto_16935 ) ) ( not ( = ?auto_16936 ?auto_16935 ) ) ( ON ?auto_16936 ?auto_16937 ) ( not ( = ?auto_16938 ?auto_16939 ) ) ( not ( = ?auto_16938 ?auto_16935 ) ) ( not ( = ?auto_16939 ?auto_16935 ) ) ( not ( = ?auto_16934 ?auto_16939 ) ) ( not ( = ?auto_16934 ?auto_16938 ) ) ( not ( = ?auto_16937 ?auto_16939 ) ) ( not ( = ?auto_16937 ?auto_16938 ) ) ( not ( = ?auto_16936 ?auto_16939 ) ) ( not ( = ?auto_16936 ?auto_16938 ) ) ( ON ?auto_16935 ?auto_16936 ) ( ON ?auto_16939 ?auto_16935 ) ( CLEAR ?auto_16939 ) ( HOLDING ?auto_16938 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16938 )
      ( MAKE-1PILE ?auto_16934 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16940 - BLOCK
    )
    :vars
    (
      ?auto_16942 - BLOCK
      ?auto_16945 - BLOCK
      ?auto_16943 - BLOCK
      ?auto_16944 - BLOCK
      ?auto_16941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16942 ?auto_16940 ) ( ON-TABLE ?auto_16940 ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16940 ?auto_16945 ) ) ( not ( = ?auto_16940 ?auto_16943 ) ) ( not ( = ?auto_16942 ?auto_16945 ) ) ( not ( = ?auto_16942 ?auto_16943 ) ) ( not ( = ?auto_16945 ?auto_16943 ) ) ( ON ?auto_16945 ?auto_16942 ) ( not ( = ?auto_16944 ?auto_16941 ) ) ( not ( = ?auto_16944 ?auto_16943 ) ) ( not ( = ?auto_16941 ?auto_16943 ) ) ( not ( = ?auto_16940 ?auto_16941 ) ) ( not ( = ?auto_16940 ?auto_16944 ) ) ( not ( = ?auto_16942 ?auto_16941 ) ) ( not ( = ?auto_16942 ?auto_16944 ) ) ( not ( = ?auto_16945 ?auto_16941 ) ) ( not ( = ?auto_16945 ?auto_16944 ) ) ( ON ?auto_16943 ?auto_16945 ) ( ON ?auto_16941 ?auto_16943 ) ( ON ?auto_16944 ?auto_16941 ) ( CLEAR ?auto_16944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16940 ?auto_16942 ?auto_16945 ?auto_16943 ?auto_16941 )
      ( MAKE-1PILE ?auto_16940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16951 - BLOCK
      ?auto_16952 - BLOCK
      ?auto_16953 - BLOCK
      ?auto_16954 - BLOCK
      ?auto_16955 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16955 ) ( CLEAR ?auto_16954 ) ( ON-TABLE ?auto_16951 ) ( ON ?auto_16952 ?auto_16951 ) ( ON ?auto_16953 ?auto_16952 ) ( ON ?auto_16954 ?auto_16953 ) ( not ( = ?auto_16951 ?auto_16952 ) ) ( not ( = ?auto_16951 ?auto_16953 ) ) ( not ( = ?auto_16951 ?auto_16954 ) ) ( not ( = ?auto_16951 ?auto_16955 ) ) ( not ( = ?auto_16952 ?auto_16953 ) ) ( not ( = ?auto_16952 ?auto_16954 ) ) ( not ( = ?auto_16952 ?auto_16955 ) ) ( not ( = ?auto_16953 ?auto_16954 ) ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16954 ?auto_16955 ) ) )
    :subtasks
    ( ( !STACK ?auto_16955 ?auto_16954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16956 - BLOCK
      ?auto_16957 - BLOCK
      ?auto_16958 - BLOCK
      ?auto_16959 - BLOCK
      ?auto_16960 - BLOCK
    )
    :vars
    (
      ?auto_16961 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16959 ) ( ON-TABLE ?auto_16956 ) ( ON ?auto_16957 ?auto_16956 ) ( ON ?auto_16958 ?auto_16957 ) ( ON ?auto_16959 ?auto_16958 ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( ON ?auto_16960 ?auto_16961 ) ( CLEAR ?auto_16960 ) ( HAND-EMPTY ) ( not ( = ?auto_16956 ?auto_16961 ) ) ( not ( = ?auto_16957 ?auto_16961 ) ) ( not ( = ?auto_16958 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16961 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16960 ?auto_16961 )
      ( MAKE-5PILE ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16962 - BLOCK
      ?auto_16963 - BLOCK
      ?auto_16964 - BLOCK
      ?auto_16965 - BLOCK
      ?auto_16966 - BLOCK
    )
    :vars
    (
      ?auto_16967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16962 ) ( ON ?auto_16963 ?auto_16962 ) ( ON ?auto_16964 ?auto_16963 ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( ON ?auto_16966 ?auto_16967 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( HOLDING ?auto_16965 ) ( CLEAR ?auto_16964 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 )
      ( MAKE-5PILE ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16968 - BLOCK
      ?auto_16969 - BLOCK
      ?auto_16970 - BLOCK
      ?auto_16971 - BLOCK
      ?auto_16972 - BLOCK
    )
    :vars
    (
      ?auto_16973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16968 ) ( ON ?auto_16969 ?auto_16968 ) ( ON ?auto_16970 ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16970 ) ) ( not ( = ?auto_16968 ?auto_16971 ) ) ( not ( = ?auto_16968 ?auto_16972 ) ) ( not ( = ?auto_16969 ?auto_16970 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_16972 ) ) ( not ( = ?auto_16970 ?auto_16971 ) ) ( not ( = ?auto_16970 ?auto_16972 ) ) ( not ( = ?auto_16971 ?auto_16972 ) ) ( ON ?auto_16972 ?auto_16973 ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16973 ) ) ( not ( = ?auto_16970 ?auto_16973 ) ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( not ( = ?auto_16972 ?auto_16973 ) ) ( CLEAR ?auto_16970 ) ( ON ?auto_16971 ?auto_16972 ) ( CLEAR ?auto_16971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16973 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16973 ?auto_16972 )
      ( MAKE-5PILE ?auto_16968 ?auto_16969 ?auto_16970 ?auto_16971 ?auto_16972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16974 - BLOCK
      ?auto_16975 - BLOCK
      ?auto_16976 - BLOCK
      ?auto_16977 - BLOCK
      ?auto_16978 - BLOCK
    )
    :vars
    (
      ?auto_16979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16974 ) ( ON ?auto_16975 ?auto_16974 ) ( not ( = ?auto_16974 ?auto_16975 ) ) ( not ( = ?auto_16974 ?auto_16976 ) ) ( not ( = ?auto_16974 ?auto_16977 ) ) ( not ( = ?auto_16974 ?auto_16978 ) ) ( not ( = ?auto_16975 ?auto_16976 ) ) ( not ( = ?auto_16975 ?auto_16977 ) ) ( not ( = ?auto_16975 ?auto_16978 ) ) ( not ( = ?auto_16976 ?auto_16977 ) ) ( not ( = ?auto_16976 ?auto_16978 ) ) ( not ( = ?auto_16977 ?auto_16978 ) ) ( ON ?auto_16978 ?auto_16979 ) ( not ( = ?auto_16974 ?auto_16979 ) ) ( not ( = ?auto_16975 ?auto_16979 ) ) ( not ( = ?auto_16976 ?auto_16979 ) ) ( not ( = ?auto_16977 ?auto_16979 ) ) ( not ( = ?auto_16978 ?auto_16979 ) ) ( ON ?auto_16977 ?auto_16978 ) ( CLEAR ?auto_16977 ) ( ON-TABLE ?auto_16979 ) ( HOLDING ?auto_16976 ) ( CLEAR ?auto_16975 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16974 ?auto_16975 ?auto_16976 )
      ( MAKE-5PILE ?auto_16974 ?auto_16975 ?auto_16976 ?auto_16977 ?auto_16978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16980 - BLOCK
      ?auto_16981 - BLOCK
      ?auto_16982 - BLOCK
      ?auto_16983 - BLOCK
      ?auto_16984 - BLOCK
    )
    :vars
    (
      ?auto_16985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16980 ) ( ON ?auto_16981 ?auto_16980 ) ( not ( = ?auto_16980 ?auto_16981 ) ) ( not ( = ?auto_16980 ?auto_16982 ) ) ( not ( = ?auto_16980 ?auto_16983 ) ) ( not ( = ?auto_16980 ?auto_16984 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16981 ?auto_16984 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_16984 ) ) ( not ( = ?auto_16983 ?auto_16984 ) ) ( ON ?auto_16984 ?auto_16985 ) ( not ( = ?auto_16980 ?auto_16985 ) ) ( not ( = ?auto_16981 ?auto_16985 ) ) ( not ( = ?auto_16982 ?auto_16985 ) ) ( not ( = ?auto_16983 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( ON ?auto_16983 ?auto_16984 ) ( ON-TABLE ?auto_16985 ) ( CLEAR ?auto_16981 ) ( ON ?auto_16982 ?auto_16983 ) ( CLEAR ?auto_16982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16985 ?auto_16984 ?auto_16983 )
      ( MAKE-5PILE ?auto_16980 ?auto_16981 ?auto_16982 ?auto_16983 ?auto_16984 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16986 - BLOCK
      ?auto_16987 - BLOCK
      ?auto_16988 - BLOCK
      ?auto_16989 - BLOCK
      ?auto_16990 - BLOCK
    )
    :vars
    (
      ?auto_16991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16986 ) ( not ( = ?auto_16986 ?auto_16987 ) ) ( not ( = ?auto_16986 ?auto_16988 ) ) ( not ( = ?auto_16986 ?auto_16989 ) ) ( not ( = ?auto_16986 ?auto_16990 ) ) ( not ( = ?auto_16987 ?auto_16988 ) ) ( not ( = ?auto_16987 ?auto_16989 ) ) ( not ( = ?auto_16987 ?auto_16990 ) ) ( not ( = ?auto_16988 ?auto_16989 ) ) ( not ( = ?auto_16988 ?auto_16990 ) ) ( not ( = ?auto_16989 ?auto_16990 ) ) ( ON ?auto_16990 ?auto_16991 ) ( not ( = ?auto_16986 ?auto_16991 ) ) ( not ( = ?auto_16987 ?auto_16991 ) ) ( not ( = ?auto_16988 ?auto_16991 ) ) ( not ( = ?auto_16989 ?auto_16991 ) ) ( not ( = ?auto_16990 ?auto_16991 ) ) ( ON ?auto_16989 ?auto_16990 ) ( ON-TABLE ?auto_16991 ) ( ON ?auto_16988 ?auto_16989 ) ( CLEAR ?auto_16988 ) ( HOLDING ?auto_16987 ) ( CLEAR ?auto_16986 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16986 ?auto_16987 )
      ( MAKE-5PILE ?auto_16986 ?auto_16987 ?auto_16988 ?auto_16989 ?auto_16990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16992 - BLOCK
      ?auto_16993 - BLOCK
      ?auto_16994 - BLOCK
      ?auto_16995 - BLOCK
      ?auto_16996 - BLOCK
    )
    :vars
    (
      ?auto_16997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16992 ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16992 ?auto_16994 ) ) ( not ( = ?auto_16992 ?auto_16995 ) ) ( not ( = ?auto_16992 ?auto_16996 ) ) ( not ( = ?auto_16993 ?auto_16994 ) ) ( not ( = ?auto_16993 ?auto_16995 ) ) ( not ( = ?auto_16993 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_16995 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16995 ?auto_16996 ) ) ( ON ?auto_16996 ?auto_16997 ) ( not ( = ?auto_16992 ?auto_16997 ) ) ( not ( = ?auto_16993 ?auto_16997 ) ) ( not ( = ?auto_16994 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_16997 ) ) ( not ( = ?auto_16996 ?auto_16997 ) ) ( ON ?auto_16995 ?auto_16996 ) ( ON-TABLE ?auto_16997 ) ( ON ?auto_16994 ?auto_16995 ) ( CLEAR ?auto_16992 ) ( ON ?auto_16993 ?auto_16994 ) ( CLEAR ?auto_16993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16997 ?auto_16996 ?auto_16995 ?auto_16994 )
      ( MAKE-5PILE ?auto_16992 ?auto_16993 ?auto_16994 ?auto_16995 ?auto_16996 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16998 - BLOCK
      ?auto_16999 - BLOCK
      ?auto_17000 - BLOCK
      ?auto_17001 - BLOCK
      ?auto_17002 - BLOCK
    )
    :vars
    (
      ?auto_17003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16998 ?auto_16999 ) ) ( not ( = ?auto_16998 ?auto_17000 ) ) ( not ( = ?auto_16998 ?auto_17001 ) ) ( not ( = ?auto_16998 ?auto_17002 ) ) ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_16999 ?auto_17001 ) ) ( not ( = ?auto_16999 ?auto_17002 ) ) ( not ( = ?auto_17000 ?auto_17001 ) ) ( not ( = ?auto_17000 ?auto_17002 ) ) ( not ( = ?auto_17001 ?auto_17002 ) ) ( ON ?auto_17002 ?auto_17003 ) ( not ( = ?auto_16998 ?auto_17003 ) ) ( not ( = ?auto_16999 ?auto_17003 ) ) ( not ( = ?auto_17000 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( not ( = ?auto_17002 ?auto_17003 ) ) ( ON ?auto_17001 ?auto_17002 ) ( ON-TABLE ?auto_17003 ) ( ON ?auto_17000 ?auto_17001 ) ( ON ?auto_16999 ?auto_17000 ) ( CLEAR ?auto_16999 ) ( HOLDING ?auto_16998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16998 )
      ( MAKE-5PILE ?auto_16998 ?auto_16999 ?auto_17000 ?auto_17001 ?auto_17002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17004 - BLOCK
      ?auto_17005 - BLOCK
      ?auto_17006 - BLOCK
      ?auto_17007 - BLOCK
      ?auto_17008 - BLOCK
    )
    :vars
    (
      ?auto_17009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17004 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_17006 ) ) ( not ( = ?auto_17004 ?auto_17007 ) ) ( not ( = ?auto_17004 ?auto_17008 ) ) ( not ( = ?auto_17005 ?auto_17006 ) ) ( not ( = ?auto_17005 ?auto_17007 ) ) ( not ( = ?auto_17005 ?auto_17008 ) ) ( not ( = ?auto_17006 ?auto_17007 ) ) ( not ( = ?auto_17006 ?auto_17008 ) ) ( not ( = ?auto_17007 ?auto_17008 ) ) ( ON ?auto_17008 ?auto_17009 ) ( not ( = ?auto_17004 ?auto_17009 ) ) ( not ( = ?auto_17005 ?auto_17009 ) ) ( not ( = ?auto_17006 ?auto_17009 ) ) ( not ( = ?auto_17007 ?auto_17009 ) ) ( not ( = ?auto_17008 ?auto_17009 ) ) ( ON ?auto_17007 ?auto_17008 ) ( ON-TABLE ?auto_17009 ) ( ON ?auto_17006 ?auto_17007 ) ( ON ?auto_17005 ?auto_17006 ) ( ON ?auto_17004 ?auto_17005 ) ( CLEAR ?auto_17004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17009 ?auto_17008 ?auto_17007 ?auto_17006 ?auto_17005 )
      ( MAKE-5PILE ?auto_17004 ?auto_17005 ?auto_17006 ?auto_17007 ?auto_17008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17068 - BLOCK
    )
    :vars
    (
      ?auto_17069 - BLOCK
      ?auto_17070 - BLOCK
      ?auto_17071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17068 ?auto_17069 ) ( CLEAR ?auto_17068 ) ( not ( = ?auto_17068 ?auto_17069 ) ) ( HOLDING ?auto_17070 ) ( CLEAR ?auto_17071 ) ( not ( = ?auto_17068 ?auto_17070 ) ) ( not ( = ?auto_17068 ?auto_17071 ) ) ( not ( = ?auto_17069 ?auto_17070 ) ) ( not ( = ?auto_17069 ?auto_17071 ) ) ( not ( = ?auto_17070 ?auto_17071 ) ) )
    :subtasks
    ( ( !STACK ?auto_17070 ?auto_17071 )
      ( MAKE-1PILE ?auto_17068 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17072 - BLOCK
    )
    :vars
    (
      ?auto_17073 - BLOCK
      ?auto_17075 - BLOCK
      ?auto_17074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17072 ?auto_17073 ) ( not ( = ?auto_17072 ?auto_17073 ) ) ( CLEAR ?auto_17075 ) ( not ( = ?auto_17072 ?auto_17074 ) ) ( not ( = ?auto_17072 ?auto_17075 ) ) ( not ( = ?auto_17073 ?auto_17074 ) ) ( not ( = ?auto_17073 ?auto_17075 ) ) ( not ( = ?auto_17074 ?auto_17075 ) ) ( ON ?auto_17074 ?auto_17072 ) ( CLEAR ?auto_17074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17073 ?auto_17072 )
      ( MAKE-1PILE ?auto_17072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17076 - BLOCK
    )
    :vars
    (
      ?auto_17077 - BLOCK
      ?auto_17079 - BLOCK
      ?auto_17078 - BLOCK
      ?auto_17080 - BLOCK
      ?auto_17081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17076 ?auto_17077 ) ( not ( = ?auto_17076 ?auto_17077 ) ) ( not ( = ?auto_17076 ?auto_17079 ) ) ( not ( = ?auto_17076 ?auto_17078 ) ) ( not ( = ?auto_17077 ?auto_17079 ) ) ( not ( = ?auto_17077 ?auto_17078 ) ) ( not ( = ?auto_17079 ?auto_17078 ) ) ( ON ?auto_17079 ?auto_17076 ) ( CLEAR ?auto_17079 ) ( ON-TABLE ?auto_17077 ) ( HOLDING ?auto_17078 ) ( CLEAR ?auto_17080 ) ( ON-TABLE ?auto_17081 ) ( ON ?auto_17080 ?auto_17081 ) ( not ( = ?auto_17081 ?auto_17080 ) ) ( not ( = ?auto_17081 ?auto_17078 ) ) ( not ( = ?auto_17080 ?auto_17078 ) ) ( not ( = ?auto_17076 ?auto_17080 ) ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17080 ) ) ( not ( = ?auto_17077 ?auto_17081 ) ) ( not ( = ?auto_17079 ?auto_17080 ) ) ( not ( = ?auto_17079 ?auto_17081 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17081 ?auto_17080 ?auto_17078 )
      ( MAKE-1PILE ?auto_17076 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17082 - BLOCK
    )
    :vars
    (
      ?auto_17085 - BLOCK
      ?auto_17084 - BLOCK
      ?auto_17086 - BLOCK
      ?auto_17087 - BLOCK
      ?auto_17083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17082 ?auto_17085 ) ( not ( = ?auto_17082 ?auto_17085 ) ) ( not ( = ?auto_17082 ?auto_17084 ) ) ( not ( = ?auto_17082 ?auto_17086 ) ) ( not ( = ?auto_17085 ?auto_17084 ) ) ( not ( = ?auto_17085 ?auto_17086 ) ) ( not ( = ?auto_17084 ?auto_17086 ) ) ( ON ?auto_17084 ?auto_17082 ) ( ON-TABLE ?auto_17085 ) ( CLEAR ?auto_17087 ) ( ON-TABLE ?auto_17083 ) ( ON ?auto_17087 ?auto_17083 ) ( not ( = ?auto_17083 ?auto_17087 ) ) ( not ( = ?auto_17083 ?auto_17086 ) ) ( not ( = ?auto_17087 ?auto_17086 ) ) ( not ( = ?auto_17082 ?auto_17087 ) ) ( not ( = ?auto_17082 ?auto_17083 ) ) ( not ( = ?auto_17085 ?auto_17087 ) ) ( not ( = ?auto_17085 ?auto_17083 ) ) ( not ( = ?auto_17084 ?auto_17087 ) ) ( not ( = ?auto_17084 ?auto_17083 ) ) ( ON ?auto_17086 ?auto_17084 ) ( CLEAR ?auto_17086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17085 ?auto_17082 ?auto_17084 )
      ( MAKE-1PILE ?auto_17082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17088 - BLOCK
    )
    :vars
    (
      ?auto_17090 - BLOCK
      ?auto_17089 - BLOCK
      ?auto_17093 - BLOCK
      ?auto_17091 - BLOCK
      ?auto_17092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17088 ?auto_17090 ) ( not ( = ?auto_17088 ?auto_17090 ) ) ( not ( = ?auto_17088 ?auto_17089 ) ) ( not ( = ?auto_17088 ?auto_17093 ) ) ( not ( = ?auto_17090 ?auto_17089 ) ) ( not ( = ?auto_17090 ?auto_17093 ) ) ( not ( = ?auto_17089 ?auto_17093 ) ) ( ON ?auto_17089 ?auto_17088 ) ( ON-TABLE ?auto_17090 ) ( ON-TABLE ?auto_17091 ) ( not ( = ?auto_17091 ?auto_17092 ) ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17092 ?auto_17093 ) ) ( not ( = ?auto_17088 ?auto_17092 ) ) ( not ( = ?auto_17088 ?auto_17091 ) ) ( not ( = ?auto_17090 ?auto_17092 ) ) ( not ( = ?auto_17090 ?auto_17091 ) ) ( not ( = ?auto_17089 ?auto_17092 ) ) ( not ( = ?auto_17089 ?auto_17091 ) ) ( ON ?auto_17093 ?auto_17089 ) ( CLEAR ?auto_17093 ) ( HOLDING ?auto_17092 ) ( CLEAR ?auto_17091 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17091 ?auto_17092 )
      ( MAKE-1PILE ?auto_17088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17094 - BLOCK
    )
    :vars
    (
      ?auto_17098 - BLOCK
      ?auto_17095 - BLOCK
      ?auto_17097 - BLOCK
      ?auto_17096 - BLOCK
      ?auto_17099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17094 ?auto_17098 ) ( not ( = ?auto_17094 ?auto_17098 ) ) ( not ( = ?auto_17094 ?auto_17095 ) ) ( not ( = ?auto_17094 ?auto_17097 ) ) ( not ( = ?auto_17098 ?auto_17095 ) ) ( not ( = ?auto_17098 ?auto_17097 ) ) ( not ( = ?auto_17095 ?auto_17097 ) ) ( ON ?auto_17095 ?auto_17094 ) ( ON-TABLE ?auto_17098 ) ( ON-TABLE ?auto_17096 ) ( not ( = ?auto_17096 ?auto_17099 ) ) ( not ( = ?auto_17096 ?auto_17097 ) ) ( not ( = ?auto_17099 ?auto_17097 ) ) ( not ( = ?auto_17094 ?auto_17099 ) ) ( not ( = ?auto_17094 ?auto_17096 ) ) ( not ( = ?auto_17098 ?auto_17099 ) ) ( not ( = ?auto_17098 ?auto_17096 ) ) ( not ( = ?auto_17095 ?auto_17099 ) ) ( not ( = ?auto_17095 ?auto_17096 ) ) ( ON ?auto_17097 ?auto_17095 ) ( CLEAR ?auto_17096 ) ( ON ?auto_17099 ?auto_17097 ) ( CLEAR ?auto_17099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17098 ?auto_17094 ?auto_17095 ?auto_17097 )
      ( MAKE-1PILE ?auto_17094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17100 - BLOCK
    )
    :vars
    (
      ?auto_17101 - BLOCK
      ?auto_17102 - BLOCK
      ?auto_17104 - BLOCK
      ?auto_17105 - BLOCK
      ?auto_17103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17100 ?auto_17101 ) ( not ( = ?auto_17100 ?auto_17101 ) ) ( not ( = ?auto_17100 ?auto_17102 ) ) ( not ( = ?auto_17100 ?auto_17104 ) ) ( not ( = ?auto_17101 ?auto_17102 ) ) ( not ( = ?auto_17101 ?auto_17104 ) ) ( not ( = ?auto_17102 ?auto_17104 ) ) ( ON ?auto_17102 ?auto_17100 ) ( ON-TABLE ?auto_17101 ) ( not ( = ?auto_17105 ?auto_17103 ) ) ( not ( = ?auto_17105 ?auto_17104 ) ) ( not ( = ?auto_17103 ?auto_17104 ) ) ( not ( = ?auto_17100 ?auto_17103 ) ) ( not ( = ?auto_17100 ?auto_17105 ) ) ( not ( = ?auto_17101 ?auto_17103 ) ) ( not ( = ?auto_17101 ?auto_17105 ) ) ( not ( = ?auto_17102 ?auto_17103 ) ) ( not ( = ?auto_17102 ?auto_17105 ) ) ( ON ?auto_17104 ?auto_17102 ) ( ON ?auto_17103 ?auto_17104 ) ( CLEAR ?auto_17103 ) ( HOLDING ?auto_17105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17105 )
      ( MAKE-1PILE ?auto_17100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17106 - BLOCK
    )
    :vars
    (
      ?auto_17111 - BLOCK
      ?auto_17108 - BLOCK
      ?auto_17107 - BLOCK
      ?auto_17109 - BLOCK
      ?auto_17110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17106 ?auto_17111 ) ( not ( = ?auto_17106 ?auto_17111 ) ) ( not ( = ?auto_17106 ?auto_17108 ) ) ( not ( = ?auto_17106 ?auto_17107 ) ) ( not ( = ?auto_17111 ?auto_17108 ) ) ( not ( = ?auto_17111 ?auto_17107 ) ) ( not ( = ?auto_17108 ?auto_17107 ) ) ( ON ?auto_17108 ?auto_17106 ) ( ON-TABLE ?auto_17111 ) ( not ( = ?auto_17109 ?auto_17110 ) ) ( not ( = ?auto_17109 ?auto_17107 ) ) ( not ( = ?auto_17110 ?auto_17107 ) ) ( not ( = ?auto_17106 ?auto_17110 ) ) ( not ( = ?auto_17106 ?auto_17109 ) ) ( not ( = ?auto_17111 ?auto_17110 ) ) ( not ( = ?auto_17111 ?auto_17109 ) ) ( not ( = ?auto_17108 ?auto_17110 ) ) ( not ( = ?auto_17108 ?auto_17109 ) ) ( ON ?auto_17107 ?auto_17108 ) ( ON ?auto_17110 ?auto_17107 ) ( ON ?auto_17109 ?auto_17110 ) ( CLEAR ?auto_17109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17111 ?auto_17106 ?auto_17108 ?auto_17107 ?auto_17110 )
      ( MAKE-1PILE ?auto_17106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17119 - BLOCK
      ?auto_17120 - BLOCK
      ?auto_17121 - BLOCK
    )
    :vars
    (
      ?auto_17122 - BLOCK
      ?auto_17123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17122 ?auto_17121 ) ( CLEAR ?auto_17122 ) ( ON-TABLE ?auto_17119 ) ( ON ?auto_17120 ?auto_17119 ) ( ON ?auto_17121 ?auto_17120 ) ( not ( = ?auto_17119 ?auto_17120 ) ) ( not ( = ?auto_17119 ?auto_17121 ) ) ( not ( = ?auto_17119 ?auto_17122 ) ) ( not ( = ?auto_17120 ?auto_17121 ) ) ( not ( = ?auto_17120 ?auto_17122 ) ) ( not ( = ?auto_17121 ?auto_17122 ) ) ( HOLDING ?auto_17123 ) ( not ( = ?auto_17119 ?auto_17123 ) ) ( not ( = ?auto_17120 ?auto_17123 ) ) ( not ( = ?auto_17121 ?auto_17123 ) ) ( not ( = ?auto_17122 ?auto_17123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17123 )
      ( MAKE-3PILE ?auto_17119 ?auto_17120 ?auto_17121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17172 - BLOCK
      ?auto_17173 - BLOCK
    )
    :vars
    (
      ?auto_17174 - BLOCK
      ?auto_17175 - BLOCK
      ?auto_17176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17172 ?auto_17173 ) ) ( ON ?auto_17173 ?auto_17174 ) ( not ( = ?auto_17172 ?auto_17174 ) ) ( not ( = ?auto_17173 ?auto_17174 ) ) ( ON ?auto_17172 ?auto_17173 ) ( CLEAR ?auto_17172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17175 ) ( ON ?auto_17176 ?auto_17175 ) ( ON ?auto_17174 ?auto_17176 ) ( not ( = ?auto_17175 ?auto_17176 ) ) ( not ( = ?auto_17175 ?auto_17174 ) ) ( not ( = ?auto_17175 ?auto_17173 ) ) ( not ( = ?auto_17175 ?auto_17172 ) ) ( not ( = ?auto_17176 ?auto_17174 ) ) ( not ( = ?auto_17176 ?auto_17173 ) ) ( not ( = ?auto_17176 ?auto_17172 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17175 ?auto_17176 ?auto_17174 ?auto_17173 )
      ( MAKE-2PILE ?auto_17172 ?auto_17173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17179 - BLOCK
      ?auto_17180 - BLOCK
    )
    :vars
    (
      ?auto_17181 - BLOCK
      ?auto_17182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17179 ?auto_17180 ) ) ( ON ?auto_17180 ?auto_17181 ) ( CLEAR ?auto_17180 ) ( not ( = ?auto_17179 ?auto_17181 ) ) ( not ( = ?auto_17180 ?auto_17181 ) ) ( ON ?auto_17179 ?auto_17182 ) ( CLEAR ?auto_17179 ) ( HAND-EMPTY ) ( not ( = ?auto_17179 ?auto_17182 ) ) ( not ( = ?auto_17180 ?auto_17182 ) ) ( not ( = ?auto_17181 ?auto_17182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17179 ?auto_17182 )
      ( MAKE-2PILE ?auto_17179 ?auto_17180 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17183 - BLOCK
      ?auto_17184 - BLOCK
    )
    :vars
    (
      ?auto_17185 - BLOCK
      ?auto_17186 - BLOCK
      ?auto_17187 - BLOCK
      ?auto_17188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17183 ?auto_17184 ) ) ( not ( = ?auto_17183 ?auto_17185 ) ) ( not ( = ?auto_17184 ?auto_17185 ) ) ( ON ?auto_17183 ?auto_17186 ) ( CLEAR ?auto_17183 ) ( not ( = ?auto_17183 ?auto_17186 ) ) ( not ( = ?auto_17184 ?auto_17186 ) ) ( not ( = ?auto_17185 ?auto_17186 ) ) ( HOLDING ?auto_17184 ) ( CLEAR ?auto_17185 ) ( ON-TABLE ?auto_17187 ) ( ON ?auto_17188 ?auto_17187 ) ( ON ?auto_17185 ?auto_17188 ) ( not ( = ?auto_17187 ?auto_17188 ) ) ( not ( = ?auto_17187 ?auto_17185 ) ) ( not ( = ?auto_17187 ?auto_17184 ) ) ( not ( = ?auto_17188 ?auto_17185 ) ) ( not ( = ?auto_17188 ?auto_17184 ) ) ( not ( = ?auto_17183 ?auto_17187 ) ) ( not ( = ?auto_17183 ?auto_17188 ) ) ( not ( = ?auto_17186 ?auto_17187 ) ) ( not ( = ?auto_17186 ?auto_17188 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17187 ?auto_17188 ?auto_17185 ?auto_17184 )
      ( MAKE-2PILE ?auto_17183 ?auto_17184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17189 - BLOCK
      ?auto_17190 - BLOCK
    )
    :vars
    (
      ?auto_17192 - BLOCK
      ?auto_17193 - BLOCK
      ?auto_17194 - BLOCK
      ?auto_17191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17189 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17192 ) ) ( not ( = ?auto_17190 ?auto_17192 ) ) ( ON ?auto_17189 ?auto_17193 ) ( not ( = ?auto_17189 ?auto_17193 ) ) ( not ( = ?auto_17190 ?auto_17193 ) ) ( not ( = ?auto_17192 ?auto_17193 ) ) ( CLEAR ?auto_17192 ) ( ON-TABLE ?auto_17194 ) ( ON ?auto_17191 ?auto_17194 ) ( ON ?auto_17192 ?auto_17191 ) ( not ( = ?auto_17194 ?auto_17191 ) ) ( not ( = ?auto_17194 ?auto_17192 ) ) ( not ( = ?auto_17194 ?auto_17190 ) ) ( not ( = ?auto_17191 ?auto_17192 ) ) ( not ( = ?auto_17191 ?auto_17190 ) ) ( not ( = ?auto_17189 ?auto_17194 ) ) ( not ( = ?auto_17189 ?auto_17191 ) ) ( not ( = ?auto_17193 ?auto_17194 ) ) ( not ( = ?auto_17193 ?auto_17191 ) ) ( ON ?auto_17190 ?auto_17189 ) ( CLEAR ?auto_17190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17193 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17193 ?auto_17189 )
      ( MAKE-2PILE ?auto_17189 ?auto_17190 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17195 - BLOCK
      ?auto_17196 - BLOCK
    )
    :vars
    (
      ?auto_17200 - BLOCK
      ?auto_17197 - BLOCK
      ?auto_17198 - BLOCK
      ?auto_17199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17195 ?auto_17196 ) ) ( not ( = ?auto_17195 ?auto_17200 ) ) ( not ( = ?auto_17196 ?auto_17200 ) ) ( ON ?auto_17195 ?auto_17197 ) ( not ( = ?auto_17195 ?auto_17197 ) ) ( not ( = ?auto_17196 ?auto_17197 ) ) ( not ( = ?auto_17200 ?auto_17197 ) ) ( ON-TABLE ?auto_17198 ) ( ON ?auto_17199 ?auto_17198 ) ( not ( = ?auto_17198 ?auto_17199 ) ) ( not ( = ?auto_17198 ?auto_17200 ) ) ( not ( = ?auto_17198 ?auto_17196 ) ) ( not ( = ?auto_17199 ?auto_17200 ) ) ( not ( = ?auto_17199 ?auto_17196 ) ) ( not ( = ?auto_17195 ?auto_17198 ) ) ( not ( = ?auto_17195 ?auto_17199 ) ) ( not ( = ?auto_17197 ?auto_17198 ) ) ( not ( = ?auto_17197 ?auto_17199 ) ) ( ON ?auto_17196 ?auto_17195 ) ( CLEAR ?auto_17196 ) ( ON-TABLE ?auto_17197 ) ( HOLDING ?auto_17200 ) ( CLEAR ?auto_17199 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17198 ?auto_17199 ?auto_17200 )
      ( MAKE-2PILE ?auto_17195 ?auto_17196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17201 - BLOCK
      ?auto_17202 - BLOCK
    )
    :vars
    (
      ?auto_17205 - BLOCK
      ?auto_17206 - BLOCK
      ?auto_17204 - BLOCK
      ?auto_17203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17201 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17205 ) ) ( not ( = ?auto_17202 ?auto_17205 ) ) ( ON ?auto_17201 ?auto_17206 ) ( not ( = ?auto_17201 ?auto_17206 ) ) ( not ( = ?auto_17202 ?auto_17206 ) ) ( not ( = ?auto_17205 ?auto_17206 ) ) ( ON-TABLE ?auto_17204 ) ( ON ?auto_17203 ?auto_17204 ) ( not ( = ?auto_17204 ?auto_17203 ) ) ( not ( = ?auto_17204 ?auto_17205 ) ) ( not ( = ?auto_17204 ?auto_17202 ) ) ( not ( = ?auto_17203 ?auto_17205 ) ) ( not ( = ?auto_17203 ?auto_17202 ) ) ( not ( = ?auto_17201 ?auto_17204 ) ) ( not ( = ?auto_17201 ?auto_17203 ) ) ( not ( = ?auto_17206 ?auto_17204 ) ) ( not ( = ?auto_17206 ?auto_17203 ) ) ( ON ?auto_17202 ?auto_17201 ) ( ON-TABLE ?auto_17206 ) ( CLEAR ?auto_17203 ) ( ON ?auto_17205 ?auto_17202 ) ( CLEAR ?auto_17205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17206 ?auto_17201 ?auto_17202 )
      ( MAKE-2PILE ?auto_17201 ?auto_17202 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17207 - BLOCK
      ?auto_17208 - BLOCK
    )
    :vars
    (
      ?auto_17211 - BLOCK
      ?auto_17212 - BLOCK
      ?auto_17210 - BLOCK
      ?auto_17209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17207 ?auto_17208 ) ) ( not ( = ?auto_17207 ?auto_17211 ) ) ( not ( = ?auto_17208 ?auto_17211 ) ) ( ON ?auto_17207 ?auto_17212 ) ( not ( = ?auto_17207 ?auto_17212 ) ) ( not ( = ?auto_17208 ?auto_17212 ) ) ( not ( = ?auto_17211 ?auto_17212 ) ) ( ON-TABLE ?auto_17210 ) ( not ( = ?auto_17210 ?auto_17209 ) ) ( not ( = ?auto_17210 ?auto_17211 ) ) ( not ( = ?auto_17210 ?auto_17208 ) ) ( not ( = ?auto_17209 ?auto_17211 ) ) ( not ( = ?auto_17209 ?auto_17208 ) ) ( not ( = ?auto_17207 ?auto_17210 ) ) ( not ( = ?auto_17207 ?auto_17209 ) ) ( not ( = ?auto_17212 ?auto_17210 ) ) ( not ( = ?auto_17212 ?auto_17209 ) ) ( ON ?auto_17208 ?auto_17207 ) ( ON-TABLE ?auto_17212 ) ( ON ?auto_17211 ?auto_17208 ) ( CLEAR ?auto_17211 ) ( HOLDING ?auto_17209 ) ( CLEAR ?auto_17210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17210 ?auto_17209 )
      ( MAKE-2PILE ?auto_17207 ?auto_17208 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17213 - BLOCK
      ?auto_17214 - BLOCK
    )
    :vars
    (
      ?auto_17215 - BLOCK
      ?auto_17218 - BLOCK
      ?auto_17217 - BLOCK
      ?auto_17216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17213 ?auto_17214 ) ) ( not ( = ?auto_17213 ?auto_17215 ) ) ( not ( = ?auto_17214 ?auto_17215 ) ) ( ON ?auto_17213 ?auto_17218 ) ( not ( = ?auto_17213 ?auto_17218 ) ) ( not ( = ?auto_17214 ?auto_17218 ) ) ( not ( = ?auto_17215 ?auto_17218 ) ) ( ON-TABLE ?auto_17217 ) ( not ( = ?auto_17217 ?auto_17216 ) ) ( not ( = ?auto_17217 ?auto_17215 ) ) ( not ( = ?auto_17217 ?auto_17214 ) ) ( not ( = ?auto_17216 ?auto_17215 ) ) ( not ( = ?auto_17216 ?auto_17214 ) ) ( not ( = ?auto_17213 ?auto_17217 ) ) ( not ( = ?auto_17213 ?auto_17216 ) ) ( not ( = ?auto_17218 ?auto_17217 ) ) ( not ( = ?auto_17218 ?auto_17216 ) ) ( ON ?auto_17214 ?auto_17213 ) ( ON-TABLE ?auto_17218 ) ( ON ?auto_17215 ?auto_17214 ) ( CLEAR ?auto_17217 ) ( ON ?auto_17216 ?auto_17215 ) ( CLEAR ?auto_17216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17218 ?auto_17213 ?auto_17214 ?auto_17215 )
      ( MAKE-2PILE ?auto_17213 ?auto_17214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17219 - BLOCK
      ?auto_17220 - BLOCK
    )
    :vars
    (
      ?auto_17221 - BLOCK
      ?auto_17223 - BLOCK
      ?auto_17224 - BLOCK
      ?auto_17222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17219 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17221 ) ) ( not ( = ?auto_17220 ?auto_17221 ) ) ( ON ?auto_17219 ?auto_17223 ) ( not ( = ?auto_17219 ?auto_17223 ) ) ( not ( = ?auto_17220 ?auto_17223 ) ) ( not ( = ?auto_17221 ?auto_17223 ) ) ( not ( = ?auto_17224 ?auto_17222 ) ) ( not ( = ?auto_17224 ?auto_17221 ) ) ( not ( = ?auto_17224 ?auto_17220 ) ) ( not ( = ?auto_17222 ?auto_17221 ) ) ( not ( = ?auto_17222 ?auto_17220 ) ) ( not ( = ?auto_17219 ?auto_17224 ) ) ( not ( = ?auto_17219 ?auto_17222 ) ) ( not ( = ?auto_17223 ?auto_17224 ) ) ( not ( = ?auto_17223 ?auto_17222 ) ) ( ON ?auto_17220 ?auto_17219 ) ( ON-TABLE ?auto_17223 ) ( ON ?auto_17221 ?auto_17220 ) ( ON ?auto_17222 ?auto_17221 ) ( CLEAR ?auto_17222 ) ( HOLDING ?auto_17224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17224 )
      ( MAKE-2PILE ?auto_17219 ?auto_17220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17225 - BLOCK
      ?auto_17226 - BLOCK
    )
    :vars
    (
      ?auto_17229 - BLOCK
      ?auto_17227 - BLOCK
      ?auto_17230 - BLOCK
      ?auto_17228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17225 ?auto_17226 ) ) ( not ( = ?auto_17225 ?auto_17229 ) ) ( not ( = ?auto_17226 ?auto_17229 ) ) ( ON ?auto_17225 ?auto_17227 ) ( not ( = ?auto_17225 ?auto_17227 ) ) ( not ( = ?auto_17226 ?auto_17227 ) ) ( not ( = ?auto_17229 ?auto_17227 ) ) ( not ( = ?auto_17230 ?auto_17228 ) ) ( not ( = ?auto_17230 ?auto_17229 ) ) ( not ( = ?auto_17230 ?auto_17226 ) ) ( not ( = ?auto_17228 ?auto_17229 ) ) ( not ( = ?auto_17228 ?auto_17226 ) ) ( not ( = ?auto_17225 ?auto_17230 ) ) ( not ( = ?auto_17225 ?auto_17228 ) ) ( not ( = ?auto_17227 ?auto_17230 ) ) ( not ( = ?auto_17227 ?auto_17228 ) ) ( ON ?auto_17226 ?auto_17225 ) ( ON-TABLE ?auto_17227 ) ( ON ?auto_17229 ?auto_17226 ) ( ON ?auto_17228 ?auto_17229 ) ( ON ?auto_17230 ?auto_17228 ) ( CLEAR ?auto_17230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17227 ?auto_17225 ?auto_17226 ?auto_17229 ?auto_17228 )
      ( MAKE-2PILE ?auto_17225 ?auto_17226 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17246 - BLOCK
      ?auto_17247 - BLOCK
    )
    :vars
    (
      ?auto_17248 - BLOCK
      ?auto_17249 - BLOCK
      ?auto_17250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17248 ?auto_17247 ) ( ON-TABLE ?auto_17246 ) ( ON ?auto_17247 ?auto_17246 ) ( not ( = ?auto_17246 ?auto_17247 ) ) ( not ( = ?auto_17246 ?auto_17248 ) ) ( not ( = ?auto_17247 ?auto_17248 ) ) ( not ( = ?auto_17246 ?auto_17249 ) ) ( not ( = ?auto_17246 ?auto_17250 ) ) ( not ( = ?auto_17247 ?auto_17249 ) ) ( not ( = ?auto_17247 ?auto_17250 ) ) ( not ( = ?auto_17248 ?auto_17249 ) ) ( not ( = ?auto_17248 ?auto_17250 ) ) ( not ( = ?auto_17249 ?auto_17250 ) ) ( ON ?auto_17249 ?auto_17248 ) ( CLEAR ?auto_17249 ) ( HOLDING ?auto_17250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17250 )
      ( MAKE-2PILE ?auto_17246 ?auto_17247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17293 - BLOCK
      ?auto_17294 - BLOCK
      ?auto_17295 - BLOCK
    )
    :vars
    (
      ?auto_17296 - BLOCK
      ?auto_17297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17293 ) ( not ( = ?auto_17293 ?auto_17294 ) ) ( not ( = ?auto_17293 ?auto_17295 ) ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( ON ?auto_17295 ?auto_17296 ) ( not ( = ?auto_17293 ?auto_17296 ) ) ( not ( = ?auto_17294 ?auto_17296 ) ) ( not ( = ?auto_17295 ?auto_17296 ) ) ( CLEAR ?auto_17293 ) ( ON ?auto_17294 ?auto_17295 ) ( CLEAR ?auto_17294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17297 ) ( ON ?auto_17296 ?auto_17297 ) ( not ( = ?auto_17297 ?auto_17296 ) ) ( not ( = ?auto_17297 ?auto_17295 ) ) ( not ( = ?auto_17297 ?auto_17294 ) ) ( not ( = ?auto_17293 ?auto_17297 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17297 ?auto_17296 ?auto_17295 )
      ( MAKE-3PILE ?auto_17293 ?auto_17294 ?auto_17295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17298 - BLOCK
      ?auto_17299 - BLOCK
      ?auto_17300 - BLOCK
    )
    :vars
    (
      ?auto_17301 - BLOCK
      ?auto_17302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17298 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17300 ) ) ( not ( = ?auto_17299 ?auto_17300 ) ) ( ON ?auto_17300 ?auto_17301 ) ( not ( = ?auto_17298 ?auto_17301 ) ) ( not ( = ?auto_17299 ?auto_17301 ) ) ( not ( = ?auto_17300 ?auto_17301 ) ) ( ON ?auto_17299 ?auto_17300 ) ( CLEAR ?auto_17299 ) ( ON-TABLE ?auto_17302 ) ( ON ?auto_17301 ?auto_17302 ) ( not ( = ?auto_17302 ?auto_17301 ) ) ( not ( = ?auto_17302 ?auto_17300 ) ) ( not ( = ?auto_17302 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17302 ) ) ( HOLDING ?auto_17298 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17298 )
      ( MAKE-3PILE ?auto_17298 ?auto_17299 ?auto_17300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17303 - BLOCK
      ?auto_17304 - BLOCK
      ?auto_17305 - BLOCK
    )
    :vars
    (
      ?auto_17307 - BLOCK
      ?auto_17306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17303 ?auto_17304 ) ) ( not ( = ?auto_17303 ?auto_17305 ) ) ( not ( = ?auto_17304 ?auto_17305 ) ) ( ON ?auto_17305 ?auto_17307 ) ( not ( = ?auto_17303 ?auto_17307 ) ) ( not ( = ?auto_17304 ?auto_17307 ) ) ( not ( = ?auto_17305 ?auto_17307 ) ) ( ON ?auto_17304 ?auto_17305 ) ( ON-TABLE ?auto_17306 ) ( ON ?auto_17307 ?auto_17306 ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( not ( = ?auto_17306 ?auto_17305 ) ) ( not ( = ?auto_17306 ?auto_17304 ) ) ( not ( = ?auto_17303 ?auto_17306 ) ) ( ON ?auto_17303 ?auto_17304 ) ( CLEAR ?auto_17303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17306 ?auto_17307 ?auto_17305 ?auto_17304 )
      ( MAKE-3PILE ?auto_17303 ?auto_17304 ?auto_17305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17311 - BLOCK
      ?auto_17312 - BLOCK
      ?auto_17313 - BLOCK
    )
    :vars
    (
      ?auto_17314 - BLOCK
      ?auto_17315 - BLOCK
      ?auto_17316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17311 ?auto_17312 ) ) ( not ( = ?auto_17311 ?auto_17313 ) ) ( not ( = ?auto_17312 ?auto_17313 ) ) ( ON ?auto_17313 ?auto_17314 ) ( not ( = ?auto_17311 ?auto_17314 ) ) ( not ( = ?auto_17312 ?auto_17314 ) ) ( not ( = ?auto_17313 ?auto_17314 ) ) ( ON ?auto_17312 ?auto_17313 ) ( CLEAR ?auto_17312 ) ( ON-TABLE ?auto_17315 ) ( ON ?auto_17314 ?auto_17315 ) ( not ( = ?auto_17315 ?auto_17314 ) ) ( not ( = ?auto_17315 ?auto_17313 ) ) ( not ( = ?auto_17315 ?auto_17312 ) ) ( not ( = ?auto_17311 ?auto_17315 ) ) ( ON ?auto_17311 ?auto_17316 ) ( CLEAR ?auto_17311 ) ( HAND-EMPTY ) ( not ( = ?auto_17311 ?auto_17316 ) ) ( not ( = ?auto_17312 ?auto_17316 ) ) ( not ( = ?auto_17313 ?auto_17316 ) ) ( not ( = ?auto_17314 ?auto_17316 ) ) ( not ( = ?auto_17315 ?auto_17316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17311 ?auto_17316 )
      ( MAKE-3PILE ?auto_17311 ?auto_17312 ?auto_17313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17317 - BLOCK
      ?auto_17318 - BLOCK
      ?auto_17319 - BLOCK
    )
    :vars
    (
      ?auto_17321 - BLOCK
      ?auto_17320 - BLOCK
      ?auto_17322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17317 ?auto_17318 ) ) ( not ( = ?auto_17317 ?auto_17319 ) ) ( not ( = ?auto_17318 ?auto_17319 ) ) ( ON ?auto_17319 ?auto_17321 ) ( not ( = ?auto_17317 ?auto_17321 ) ) ( not ( = ?auto_17318 ?auto_17321 ) ) ( not ( = ?auto_17319 ?auto_17321 ) ) ( ON-TABLE ?auto_17320 ) ( ON ?auto_17321 ?auto_17320 ) ( not ( = ?auto_17320 ?auto_17321 ) ) ( not ( = ?auto_17320 ?auto_17319 ) ) ( not ( = ?auto_17320 ?auto_17318 ) ) ( not ( = ?auto_17317 ?auto_17320 ) ) ( ON ?auto_17317 ?auto_17322 ) ( CLEAR ?auto_17317 ) ( not ( = ?auto_17317 ?auto_17322 ) ) ( not ( = ?auto_17318 ?auto_17322 ) ) ( not ( = ?auto_17319 ?auto_17322 ) ) ( not ( = ?auto_17321 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17322 ) ) ( HOLDING ?auto_17318 ) ( CLEAR ?auto_17319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17320 ?auto_17321 ?auto_17319 ?auto_17318 )
      ( MAKE-3PILE ?auto_17317 ?auto_17318 ?auto_17319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17323 - BLOCK
      ?auto_17324 - BLOCK
      ?auto_17325 - BLOCK
    )
    :vars
    (
      ?auto_17326 - BLOCK
      ?auto_17328 - BLOCK
      ?auto_17327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17323 ?auto_17324 ) ) ( not ( = ?auto_17323 ?auto_17325 ) ) ( not ( = ?auto_17324 ?auto_17325 ) ) ( ON ?auto_17325 ?auto_17326 ) ( not ( = ?auto_17323 ?auto_17326 ) ) ( not ( = ?auto_17324 ?auto_17326 ) ) ( not ( = ?auto_17325 ?auto_17326 ) ) ( ON-TABLE ?auto_17328 ) ( ON ?auto_17326 ?auto_17328 ) ( not ( = ?auto_17328 ?auto_17326 ) ) ( not ( = ?auto_17328 ?auto_17325 ) ) ( not ( = ?auto_17328 ?auto_17324 ) ) ( not ( = ?auto_17323 ?auto_17328 ) ) ( ON ?auto_17323 ?auto_17327 ) ( not ( = ?auto_17323 ?auto_17327 ) ) ( not ( = ?auto_17324 ?auto_17327 ) ) ( not ( = ?auto_17325 ?auto_17327 ) ) ( not ( = ?auto_17326 ?auto_17327 ) ) ( not ( = ?auto_17328 ?auto_17327 ) ) ( CLEAR ?auto_17325 ) ( ON ?auto_17324 ?auto_17323 ) ( CLEAR ?auto_17324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17327 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17327 ?auto_17323 )
      ( MAKE-3PILE ?auto_17323 ?auto_17324 ?auto_17325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17329 - BLOCK
      ?auto_17330 - BLOCK
      ?auto_17331 - BLOCK
    )
    :vars
    (
      ?auto_17333 - BLOCK
      ?auto_17334 - BLOCK
      ?auto_17332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17329 ?auto_17330 ) ) ( not ( = ?auto_17329 ?auto_17331 ) ) ( not ( = ?auto_17330 ?auto_17331 ) ) ( not ( = ?auto_17329 ?auto_17333 ) ) ( not ( = ?auto_17330 ?auto_17333 ) ) ( not ( = ?auto_17331 ?auto_17333 ) ) ( ON-TABLE ?auto_17334 ) ( ON ?auto_17333 ?auto_17334 ) ( not ( = ?auto_17334 ?auto_17333 ) ) ( not ( = ?auto_17334 ?auto_17331 ) ) ( not ( = ?auto_17334 ?auto_17330 ) ) ( not ( = ?auto_17329 ?auto_17334 ) ) ( ON ?auto_17329 ?auto_17332 ) ( not ( = ?auto_17329 ?auto_17332 ) ) ( not ( = ?auto_17330 ?auto_17332 ) ) ( not ( = ?auto_17331 ?auto_17332 ) ) ( not ( = ?auto_17333 ?auto_17332 ) ) ( not ( = ?auto_17334 ?auto_17332 ) ) ( ON ?auto_17330 ?auto_17329 ) ( CLEAR ?auto_17330 ) ( ON-TABLE ?auto_17332 ) ( HOLDING ?auto_17331 ) ( CLEAR ?auto_17333 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17334 ?auto_17333 ?auto_17331 )
      ( MAKE-3PILE ?auto_17329 ?auto_17330 ?auto_17331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17335 - BLOCK
      ?auto_17336 - BLOCK
      ?auto_17337 - BLOCK
    )
    :vars
    (
      ?auto_17339 - BLOCK
      ?auto_17340 - BLOCK
      ?auto_17338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17335 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17337 ) ) ( not ( = ?auto_17336 ?auto_17337 ) ) ( not ( = ?auto_17335 ?auto_17339 ) ) ( not ( = ?auto_17336 ?auto_17339 ) ) ( not ( = ?auto_17337 ?auto_17339 ) ) ( ON-TABLE ?auto_17340 ) ( ON ?auto_17339 ?auto_17340 ) ( not ( = ?auto_17340 ?auto_17339 ) ) ( not ( = ?auto_17340 ?auto_17337 ) ) ( not ( = ?auto_17340 ?auto_17336 ) ) ( not ( = ?auto_17335 ?auto_17340 ) ) ( ON ?auto_17335 ?auto_17338 ) ( not ( = ?auto_17335 ?auto_17338 ) ) ( not ( = ?auto_17336 ?auto_17338 ) ) ( not ( = ?auto_17337 ?auto_17338 ) ) ( not ( = ?auto_17339 ?auto_17338 ) ) ( not ( = ?auto_17340 ?auto_17338 ) ) ( ON ?auto_17336 ?auto_17335 ) ( ON-TABLE ?auto_17338 ) ( CLEAR ?auto_17339 ) ( ON ?auto_17337 ?auto_17336 ) ( CLEAR ?auto_17337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17338 ?auto_17335 ?auto_17336 )
      ( MAKE-3PILE ?auto_17335 ?auto_17336 ?auto_17337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17341 - BLOCK
      ?auto_17342 - BLOCK
      ?auto_17343 - BLOCK
    )
    :vars
    (
      ?auto_17346 - BLOCK
      ?auto_17344 - BLOCK
      ?auto_17345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17341 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17343 ) ) ( not ( = ?auto_17342 ?auto_17343 ) ) ( not ( = ?auto_17341 ?auto_17346 ) ) ( not ( = ?auto_17342 ?auto_17346 ) ) ( not ( = ?auto_17343 ?auto_17346 ) ) ( ON-TABLE ?auto_17344 ) ( not ( = ?auto_17344 ?auto_17346 ) ) ( not ( = ?auto_17344 ?auto_17343 ) ) ( not ( = ?auto_17344 ?auto_17342 ) ) ( not ( = ?auto_17341 ?auto_17344 ) ) ( ON ?auto_17341 ?auto_17345 ) ( not ( = ?auto_17341 ?auto_17345 ) ) ( not ( = ?auto_17342 ?auto_17345 ) ) ( not ( = ?auto_17343 ?auto_17345 ) ) ( not ( = ?auto_17346 ?auto_17345 ) ) ( not ( = ?auto_17344 ?auto_17345 ) ) ( ON ?auto_17342 ?auto_17341 ) ( ON-TABLE ?auto_17345 ) ( ON ?auto_17343 ?auto_17342 ) ( CLEAR ?auto_17343 ) ( HOLDING ?auto_17346 ) ( CLEAR ?auto_17344 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17344 ?auto_17346 )
      ( MAKE-3PILE ?auto_17341 ?auto_17342 ?auto_17343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17347 - BLOCK
      ?auto_17348 - BLOCK
      ?auto_17349 - BLOCK
    )
    :vars
    (
      ?auto_17350 - BLOCK
      ?auto_17351 - BLOCK
      ?auto_17352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17347 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17349 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( not ( = ?auto_17348 ?auto_17350 ) ) ( not ( = ?auto_17349 ?auto_17350 ) ) ( ON-TABLE ?auto_17351 ) ( not ( = ?auto_17351 ?auto_17350 ) ) ( not ( = ?auto_17351 ?auto_17349 ) ) ( not ( = ?auto_17351 ?auto_17348 ) ) ( not ( = ?auto_17347 ?auto_17351 ) ) ( ON ?auto_17347 ?auto_17352 ) ( not ( = ?auto_17347 ?auto_17352 ) ) ( not ( = ?auto_17348 ?auto_17352 ) ) ( not ( = ?auto_17349 ?auto_17352 ) ) ( not ( = ?auto_17350 ?auto_17352 ) ) ( not ( = ?auto_17351 ?auto_17352 ) ) ( ON ?auto_17348 ?auto_17347 ) ( ON-TABLE ?auto_17352 ) ( ON ?auto_17349 ?auto_17348 ) ( CLEAR ?auto_17351 ) ( ON ?auto_17350 ?auto_17349 ) ( CLEAR ?auto_17350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17352 ?auto_17347 ?auto_17348 ?auto_17349 )
      ( MAKE-3PILE ?auto_17347 ?auto_17348 ?auto_17349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17353 - BLOCK
      ?auto_17354 - BLOCK
      ?auto_17355 - BLOCK
    )
    :vars
    (
      ?auto_17358 - BLOCK
      ?auto_17356 - BLOCK
      ?auto_17357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17353 ?auto_17354 ) ) ( not ( = ?auto_17353 ?auto_17355 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17353 ?auto_17358 ) ) ( not ( = ?auto_17354 ?auto_17358 ) ) ( not ( = ?auto_17355 ?auto_17358 ) ) ( not ( = ?auto_17356 ?auto_17358 ) ) ( not ( = ?auto_17356 ?auto_17355 ) ) ( not ( = ?auto_17356 ?auto_17354 ) ) ( not ( = ?auto_17353 ?auto_17356 ) ) ( ON ?auto_17353 ?auto_17357 ) ( not ( = ?auto_17353 ?auto_17357 ) ) ( not ( = ?auto_17354 ?auto_17357 ) ) ( not ( = ?auto_17355 ?auto_17357 ) ) ( not ( = ?auto_17358 ?auto_17357 ) ) ( not ( = ?auto_17356 ?auto_17357 ) ) ( ON ?auto_17354 ?auto_17353 ) ( ON-TABLE ?auto_17357 ) ( ON ?auto_17355 ?auto_17354 ) ( ON ?auto_17358 ?auto_17355 ) ( CLEAR ?auto_17358 ) ( HOLDING ?auto_17356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17356 )
      ( MAKE-3PILE ?auto_17353 ?auto_17354 ?auto_17355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17359 - BLOCK
      ?auto_17360 - BLOCK
      ?auto_17361 - BLOCK
    )
    :vars
    (
      ?auto_17362 - BLOCK
      ?auto_17363 - BLOCK
      ?auto_17364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17359 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17361 ) ) ( not ( = ?auto_17360 ?auto_17361 ) ) ( not ( = ?auto_17359 ?auto_17362 ) ) ( not ( = ?auto_17360 ?auto_17362 ) ) ( not ( = ?auto_17361 ?auto_17362 ) ) ( not ( = ?auto_17363 ?auto_17362 ) ) ( not ( = ?auto_17363 ?auto_17361 ) ) ( not ( = ?auto_17363 ?auto_17360 ) ) ( not ( = ?auto_17359 ?auto_17363 ) ) ( ON ?auto_17359 ?auto_17364 ) ( not ( = ?auto_17359 ?auto_17364 ) ) ( not ( = ?auto_17360 ?auto_17364 ) ) ( not ( = ?auto_17361 ?auto_17364 ) ) ( not ( = ?auto_17362 ?auto_17364 ) ) ( not ( = ?auto_17363 ?auto_17364 ) ) ( ON ?auto_17360 ?auto_17359 ) ( ON-TABLE ?auto_17364 ) ( ON ?auto_17361 ?auto_17360 ) ( ON ?auto_17362 ?auto_17361 ) ( ON ?auto_17363 ?auto_17362 ) ( CLEAR ?auto_17363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17364 ?auto_17359 ?auto_17360 ?auto_17361 ?auto_17362 )
      ( MAKE-3PILE ?auto_17359 ?auto_17360 ?auto_17361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17376 - BLOCK
    )
    :vars
    (
      ?auto_17379 - BLOCK
      ?auto_17378 - BLOCK
      ?auto_17377 - BLOCK
      ?auto_17380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17379 ?auto_17376 ) ( ON-TABLE ?auto_17376 ) ( not ( = ?auto_17376 ?auto_17379 ) ) ( not ( = ?auto_17376 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17377 ) ) ( not ( = ?auto_17379 ?auto_17378 ) ) ( not ( = ?auto_17379 ?auto_17377 ) ) ( not ( = ?auto_17378 ?auto_17377 ) ) ( ON ?auto_17378 ?auto_17379 ) ( CLEAR ?auto_17378 ) ( HOLDING ?auto_17377 ) ( CLEAR ?auto_17380 ) ( ON-TABLE ?auto_17380 ) ( not ( = ?auto_17380 ?auto_17377 ) ) ( not ( = ?auto_17376 ?auto_17380 ) ) ( not ( = ?auto_17379 ?auto_17380 ) ) ( not ( = ?auto_17378 ?auto_17380 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17380 ?auto_17377 )
      ( MAKE-1PILE ?auto_17376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17381 - BLOCK
    )
    :vars
    (
      ?auto_17384 - BLOCK
      ?auto_17383 - BLOCK
      ?auto_17385 - BLOCK
      ?auto_17382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17384 ?auto_17381 ) ( ON-TABLE ?auto_17381 ) ( not ( = ?auto_17381 ?auto_17384 ) ) ( not ( = ?auto_17381 ?auto_17383 ) ) ( not ( = ?auto_17381 ?auto_17385 ) ) ( not ( = ?auto_17384 ?auto_17383 ) ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17383 ?auto_17385 ) ) ( ON ?auto_17383 ?auto_17384 ) ( CLEAR ?auto_17382 ) ( ON-TABLE ?auto_17382 ) ( not ( = ?auto_17382 ?auto_17385 ) ) ( not ( = ?auto_17381 ?auto_17382 ) ) ( not ( = ?auto_17384 ?auto_17382 ) ) ( not ( = ?auto_17383 ?auto_17382 ) ) ( ON ?auto_17385 ?auto_17383 ) ( CLEAR ?auto_17385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17381 ?auto_17384 ?auto_17383 )
      ( MAKE-1PILE ?auto_17381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17386 - BLOCK
    )
    :vars
    (
      ?auto_17387 - BLOCK
      ?auto_17389 - BLOCK
      ?auto_17390 - BLOCK
      ?auto_17388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17387 ?auto_17386 ) ( ON-TABLE ?auto_17386 ) ( not ( = ?auto_17386 ?auto_17387 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17389 ) ) ( not ( = ?auto_17387 ?auto_17390 ) ) ( not ( = ?auto_17389 ?auto_17390 ) ) ( ON ?auto_17389 ?auto_17387 ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17387 ?auto_17388 ) ) ( not ( = ?auto_17389 ?auto_17388 ) ) ( ON ?auto_17390 ?auto_17389 ) ( CLEAR ?auto_17390 ) ( HOLDING ?auto_17388 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17388 )
      ( MAKE-1PILE ?auto_17386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17397 - BLOCK
    )
    :vars
    (
      ?auto_17399 - BLOCK
      ?auto_17398 - BLOCK
      ?auto_17401 - BLOCK
      ?auto_17400 - BLOCK
      ?auto_17402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17399 ?auto_17397 ) ( ON-TABLE ?auto_17397 ) ( not ( = ?auto_17397 ?auto_17399 ) ) ( not ( = ?auto_17397 ?auto_17398 ) ) ( not ( = ?auto_17397 ?auto_17401 ) ) ( not ( = ?auto_17399 ?auto_17398 ) ) ( not ( = ?auto_17399 ?auto_17401 ) ) ( not ( = ?auto_17398 ?auto_17401 ) ) ( ON ?auto_17398 ?auto_17399 ) ( not ( = ?auto_17400 ?auto_17401 ) ) ( not ( = ?auto_17397 ?auto_17400 ) ) ( not ( = ?auto_17399 ?auto_17400 ) ) ( not ( = ?auto_17398 ?auto_17400 ) ) ( ON ?auto_17401 ?auto_17398 ) ( CLEAR ?auto_17401 ) ( ON ?auto_17400 ?auto_17402 ) ( CLEAR ?auto_17400 ) ( HAND-EMPTY ) ( not ( = ?auto_17397 ?auto_17402 ) ) ( not ( = ?auto_17399 ?auto_17402 ) ) ( not ( = ?auto_17398 ?auto_17402 ) ) ( not ( = ?auto_17401 ?auto_17402 ) ) ( not ( = ?auto_17400 ?auto_17402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17400 ?auto_17402 )
      ( MAKE-1PILE ?auto_17397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_17403 - BLOCK
    )
    :vars
    (
      ?auto_17406 - BLOCK
      ?auto_17404 - BLOCK
      ?auto_17405 - BLOCK
      ?auto_17407 - BLOCK
      ?auto_17408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17406 ?auto_17403 ) ( ON-TABLE ?auto_17403 ) ( not ( = ?auto_17403 ?auto_17406 ) ) ( not ( = ?auto_17403 ?auto_17404 ) ) ( not ( = ?auto_17403 ?auto_17405 ) ) ( not ( = ?auto_17406 ?auto_17404 ) ) ( not ( = ?auto_17406 ?auto_17405 ) ) ( not ( = ?auto_17404 ?auto_17405 ) ) ( ON ?auto_17404 ?auto_17406 ) ( not ( = ?auto_17407 ?auto_17405 ) ) ( not ( = ?auto_17403 ?auto_17407 ) ) ( not ( = ?auto_17406 ?auto_17407 ) ) ( not ( = ?auto_17404 ?auto_17407 ) ) ( ON ?auto_17407 ?auto_17408 ) ( CLEAR ?auto_17407 ) ( not ( = ?auto_17403 ?auto_17408 ) ) ( not ( = ?auto_17406 ?auto_17408 ) ) ( not ( = ?auto_17404 ?auto_17408 ) ) ( not ( = ?auto_17405 ?auto_17408 ) ) ( not ( = ?auto_17407 ?auto_17408 ) ) ( HOLDING ?auto_17405 ) ( CLEAR ?auto_17404 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17403 ?auto_17406 ?auto_17404 ?auto_17405 )
      ( MAKE-1PILE ?auto_17403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17437 - BLOCK
      ?auto_17438 - BLOCK
      ?auto_17439 - BLOCK
      ?auto_17440 - BLOCK
    )
    :vars
    (
      ?auto_17441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17437 ) ( ON ?auto_17438 ?auto_17437 ) ( not ( = ?auto_17437 ?auto_17438 ) ) ( not ( = ?auto_17437 ?auto_17439 ) ) ( not ( = ?auto_17437 ?auto_17440 ) ) ( not ( = ?auto_17438 ?auto_17439 ) ) ( not ( = ?auto_17438 ?auto_17440 ) ) ( not ( = ?auto_17439 ?auto_17440 ) ) ( ON ?auto_17440 ?auto_17441 ) ( not ( = ?auto_17437 ?auto_17441 ) ) ( not ( = ?auto_17438 ?auto_17441 ) ) ( not ( = ?auto_17439 ?auto_17441 ) ) ( not ( = ?auto_17440 ?auto_17441 ) ) ( CLEAR ?auto_17438 ) ( ON ?auto_17439 ?auto_17440 ) ( CLEAR ?auto_17439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17441 ?auto_17440 )
      ( MAKE-4PILE ?auto_17437 ?auto_17438 ?auto_17439 ?auto_17440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17442 - BLOCK
      ?auto_17443 - BLOCK
      ?auto_17444 - BLOCK
      ?auto_17445 - BLOCK
    )
    :vars
    (
      ?auto_17446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17442 ) ( not ( = ?auto_17442 ?auto_17443 ) ) ( not ( = ?auto_17442 ?auto_17444 ) ) ( not ( = ?auto_17442 ?auto_17445 ) ) ( not ( = ?auto_17443 ?auto_17444 ) ) ( not ( = ?auto_17443 ?auto_17445 ) ) ( not ( = ?auto_17444 ?auto_17445 ) ) ( ON ?auto_17445 ?auto_17446 ) ( not ( = ?auto_17442 ?auto_17446 ) ) ( not ( = ?auto_17443 ?auto_17446 ) ) ( not ( = ?auto_17444 ?auto_17446 ) ) ( not ( = ?auto_17445 ?auto_17446 ) ) ( ON ?auto_17444 ?auto_17445 ) ( CLEAR ?auto_17444 ) ( ON-TABLE ?auto_17446 ) ( HOLDING ?auto_17443 ) ( CLEAR ?auto_17442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17442 ?auto_17443 )
      ( MAKE-4PILE ?auto_17442 ?auto_17443 ?auto_17444 ?auto_17445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17447 - BLOCK
      ?auto_17448 - BLOCK
      ?auto_17449 - BLOCK
      ?auto_17450 - BLOCK
    )
    :vars
    (
      ?auto_17451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17447 ) ( not ( = ?auto_17447 ?auto_17448 ) ) ( not ( = ?auto_17447 ?auto_17449 ) ) ( not ( = ?auto_17447 ?auto_17450 ) ) ( not ( = ?auto_17448 ?auto_17449 ) ) ( not ( = ?auto_17448 ?auto_17450 ) ) ( not ( = ?auto_17449 ?auto_17450 ) ) ( ON ?auto_17450 ?auto_17451 ) ( not ( = ?auto_17447 ?auto_17451 ) ) ( not ( = ?auto_17448 ?auto_17451 ) ) ( not ( = ?auto_17449 ?auto_17451 ) ) ( not ( = ?auto_17450 ?auto_17451 ) ) ( ON ?auto_17449 ?auto_17450 ) ( ON-TABLE ?auto_17451 ) ( CLEAR ?auto_17447 ) ( ON ?auto_17448 ?auto_17449 ) ( CLEAR ?auto_17448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17451 ?auto_17450 ?auto_17449 )
      ( MAKE-4PILE ?auto_17447 ?auto_17448 ?auto_17449 ?auto_17450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17452 - BLOCK
      ?auto_17453 - BLOCK
      ?auto_17454 - BLOCK
      ?auto_17455 - BLOCK
    )
    :vars
    (
      ?auto_17456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17452 ?auto_17453 ) ) ( not ( = ?auto_17452 ?auto_17454 ) ) ( not ( = ?auto_17452 ?auto_17455 ) ) ( not ( = ?auto_17453 ?auto_17454 ) ) ( not ( = ?auto_17453 ?auto_17455 ) ) ( not ( = ?auto_17454 ?auto_17455 ) ) ( ON ?auto_17455 ?auto_17456 ) ( not ( = ?auto_17452 ?auto_17456 ) ) ( not ( = ?auto_17453 ?auto_17456 ) ) ( not ( = ?auto_17454 ?auto_17456 ) ) ( not ( = ?auto_17455 ?auto_17456 ) ) ( ON ?auto_17454 ?auto_17455 ) ( ON-TABLE ?auto_17456 ) ( ON ?auto_17453 ?auto_17454 ) ( CLEAR ?auto_17453 ) ( HOLDING ?auto_17452 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17452 )
      ( MAKE-4PILE ?auto_17452 ?auto_17453 ?auto_17454 ?auto_17455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17457 - BLOCK
      ?auto_17458 - BLOCK
      ?auto_17459 - BLOCK
      ?auto_17460 - BLOCK
    )
    :vars
    (
      ?auto_17461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17457 ?auto_17458 ) ) ( not ( = ?auto_17457 ?auto_17459 ) ) ( not ( = ?auto_17457 ?auto_17460 ) ) ( not ( = ?auto_17458 ?auto_17459 ) ) ( not ( = ?auto_17458 ?auto_17460 ) ) ( not ( = ?auto_17459 ?auto_17460 ) ) ( ON ?auto_17460 ?auto_17461 ) ( not ( = ?auto_17457 ?auto_17461 ) ) ( not ( = ?auto_17458 ?auto_17461 ) ) ( not ( = ?auto_17459 ?auto_17461 ) ) ( not ( = ?auto_17460 ?auto_17461 ) ) ( ON ?auto_17459 ?auto_17460 ) ( ON-TABLE ?auto_17461 ) ( ON ?auto_17458 ?auto_17459 ) ( ON ?auto_17457 ?auto_17458 ) ( CLEAR ?auto_17457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17461 ?auto_17460 ?auto_17459 ?auto_17458 )
      ( MAKE-4PILE ?auto_17457 ?auto_17458 ?auto_17459 ?auto_17460 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17466 - BLOCK
      ?auto_17467 - BLOCK
      ?auto_17468 - BLOCK
      ?auto_17469 - BLOCK
    )
    :vars
    (
      ?auto_17470 - BLOCK
      ?auto_17471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17466 ?auto_17467 ) ) ( not ( = ?auto_17466 ?auto_17468 ) ) ( not ( = ?auto_17466 ?auto_17469 ) ) ( not ( = ?auto_17467 ?auto_17468 ) ) ( not ( = ?auto_17467 ?auto_17469 ) ) ( not ( = ?auto_17468 ?auto_17469 ) ) ( ON ?auto_17469 ?auto_17470 ) ( not ( = ?auto_17466 ?auto_17470 ) ) ( not ( = ?auto_17467 ?auto_17470 ) ) ( not ( = ?auto_17468 ?auto_17470 ) ) ( not ( = ?auto_17469 ?auto_17470 ) ) ( ON ?auto_17468 ?auto_17469 ) ( ON-TABLE ?auto_17470 ) ( ON ?auto_17467 ?auto_17468 ) ( CLEAR ?auto_17467 ) ( ON ?auto_17466 ?auto_17471 ) ( CLEAR ?auto_17466 ) ( HAND-EMPTY ) ( not ( = ?auto_17466 ?auto_17471 ) ) ( not ( = ?auto_17467 ?auto_17471 ) ) ( not ( = ?auto_17468 ?auto_17471 ) ) ( not ( = ?auto_17469 ?auto_17471 ) ) ( not ( = ?auto_17470 ?auto_17471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17466 ?auto_17471 )
      ( MAKE-4PILE ?auto_17466 ?auto_17467 ?auto_17468 ?auto_17469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17472 - BLOCK
      ?auto_17473 - BLOCK
      ?auto_17474 - BLOCK
      ?auto_17475 - BLOCK
    )
    :vars
    (
      ?auto_17476 - BLOCK
      ?auto_17477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17472 ?auto_17473 ) ) ( not ( = ?auto_17472 ?auto_17474 ) ) ( not ( = ?auto_17472 ?auto_17475 ) ) ( not ( = ?auto_17473 ?auto_17474 ) ) ( not ( = ?auto_17473 ?auto_17475 ) ) ( not ( = ?auto_17474 ?auto_17475 ) ) ( ON ?auto_17475 ?auto_17476 ) ( not ( = ?auto_17472 ?auto_17476 ) ) ( not ( = ?auto_17473 ?auto_17476 ) ) ( not ( = ?auto_17474 ?auto_17476 ) ) ( not ( = ?auto_17475 ?auto_17476 ) ) ( ON ?auto_17474 ?auto_17475 ) ( ON-TABLE ?auto_17476 ) ( ON ?auto_17472 ?auto_17477 ) ( CLEAR ?auto_17472 ) ( not ( = ?auto_17472 ?auto_17477 ) ) ( not ( = ?auto_17473 ?auto_17477 ) ) ( not ( = ?auto_17474 ?auto_17477 ) ) ( not ( = ?auto_17475 ?auto_17477 ) ) ( not ( = ?auto_17476 ?auto_17477 ) ) ( HOLDING ?auto_17473 ) ( CLEAR ?auto_17474 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17476 ?auto_17475 ?auto_17474 ?auto_17473 )
      ( MAKE-4PILE ?auto_17472 ?auto_17473 ?auto_17474 ?auto_17475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17478 - BLOCK
      ?auto_17479 - BLOCK
      ?auto_17480 - BLOCK
      ?auto_17481 - BLOCK
    )
    :vars
    (
      ?auto_17483 - BLOCK
      ?auto_17482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17478 ?auto_17479 ) ) ( not ( = ?auto_17478 ?auto_17480 ) ) ( not ( = ?auto_17478 ?auto_17481 ) ) ( not ( = ?auto_17479 ?auto_17480 ) ) ( not ( = ?auto_17479 ?auto_17481 ) ) ( not ( = ?auto_17480 ?auto_17481 ) ) ( ON ?auto_17481 ?auto_17483 ) ( not ( = ?auto_17478 ?auto_17483 ) ) ( not ( = ?auto_17479 ?auto_17483 ) ) ( not ( = ?auto_17480 ?auto_17483 ) ) ( not ( = ?auto_17481 ?auto_17483 ) ) ( ON ?auto_17480 ?auto_17481 ) ( ON-TABLE ?auto_17483 ) ( ON ?auto_17478 ?auto_17482 ) ( not ( = ?auto_17478 ?auto_17482 ) ) ( not ( = ?auto_17479 ?auto_17482 ) ) ( not ( = ?auto_17480 ?auto_17482 ) ) ( not ( = ?auto_17481 ?auto_17482 ) ) ( not ( = ?auto_17483 ?auto_17482 ) ) ( CLEAR ?auto_17480 ) ( ON ?auto_17479 ?auto_17478 ) ( CLEAR ?auto_17479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17482 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17482 ?auto_17478 )
      ( MAKE-4PILE ?auto_17478 ?auto_17479 ?auto_17480 ?auto_17481 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17484 - BLOCK
      ?auto_17485 - BLOCK
      ?auto_17486 - BLOCK
      ?auto_17487 - BLOCK
    )
    :vars
    (
      ?auto_17489 - BLOCK
      ?auto_17488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17484 ?auto_17485 ) ) ( not ( = ?auto_17484 ?auto_17486 ) ) ( not ( = ?auto_17484 ?auto_17487 ) ) ( not ( = ?auto_17485 ?auto_17486 ) ) ( not ( = ?auto_17485 ?auto_17487 ) ) ( not ( = ?auto_17486 ?auto_17487 ) ) ( ON ?auto_17487 ?auto_17489 ) ( not ( = ?auto_17484 ?auto_17489 ) ) ( not ( = ?auto_17485 ?auto_17489 ) ) ( not ( = ?auto_17486 ?auto_17489 ) ) ( not ( = ?auto_17487 ?auto_17489 ) ) ( ON-TABLE ?auto_17489 ) ( ON ?auto_17484 ?auto_17488 ) ( not ( = ?auto_17484 ?auto_17488 ) ) ( not ( = ?auto_17485 ?auto_17488 ) ) ( not ( = ?auto_17486 ?auto_17488 ) ) ( not ( = ?auto_17487 ?auto_17488 ) ) ( not ( = ?auto_17489 ?auto_17488 ) ) ( ON ?auto_17485 ?auto_17484 ) ( CLEAR ?auto_17485 ) ( ON-TABLE ?auto_17488 ) ( HOLDING ?auto_17486 ) ( CLEAR ?auto_17487 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17489 ?auto_17487 ?auto_17486 )
      ( MAKE-4PILE ?auto_17484 ?auto_17485 ?auto_17486 ?auto_17487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17490 - BLOCK
      ?auto_17491 - BLOCK
      ?auto_17492 - BLOCK
      ?auto_17493 - BLOCK
    )
    :vars
    (
      ?auto_17494 - BLOCK
      ?auto_17495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17490 ?auto_17491 ) ) ( not ( = ?auto_17490 ?auto_17492 ) ) ( not ( = ?auto_17490 ?auto_17493 ) ) ( not ( = ?auto_17491 ?auto_17492 ) ) ( not ( = ?auto_17491 ?auto_17493 ) ) ( not ( = ?auto_17492 ?auto_17493 ) ) ( ON ?auto_17493 ?auto_17494 ) ( not ( = ?auto_17490 ?auto_17494 ) ) ( not ( = ?auto_17491 ?auto_17494 ) ) ( not ( = ?auto_17492 ?auto_17494 ) ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( ON-TABLE ?auto_17494 ) ( ON ?auto_17490 ?auto_17495 ) ( not ( = ?auto_17490 ?auto_17495 ) ) ( not ( = ?auto_17491 ?auto_17495 ) ) ( not ( = ?auto_17492 ?auto_17495 ) ) ( not ( = ?auto_17493 ?auto_17495 ) ) ( not ( = ?auto_17494 ?auto_17495 ) ) ( ON ?auto_17491 ?auto_17490 ) ( ON-TABLE ?auto_17495 ) ( CLEAR ?auto_17493 ) ( ON ?auto_17492 ?auto_17491 ) ( CLEAR ?auto_17492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17495 ?auto_17490 ?auto_17491 )
      ( MAKE-4PILE ?auto_17490 ?auto_17491 ?auto_17492 ?auto_17493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17496 - BLOCK
      ?auto_17497 - BLOCK
      ?auto_17498 - BLOCK
      ?auto_17499 - BLOCK
    )
    :vars
    (
      ?auto_17500 - BLOCK
      ?auto_17501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17496 ?auto_17497 ) ) ( not ( = ?auto_17496 ?auto_17498 ) ) ( not ( = ?auto_17496 ?auto_17499 ) ) ( not ( = ?auto_17497 ?auto_17498 ) ) ( not ( = ?auto_17497 ?auto_17499 ) ) ( not ( = ?auto_17498 ?auto_17499 ) ) ( not ( = ?auto_17496 ?auto_17500 ) ) ( not ( = ?auto_17497 ?auto_17500 ) ) ( not ( = ?auto_17498 ?auto_17500 ) ) ( not ( = ?auto_17499 ?auto_17500 ) ) ( ON-TABLE ?auto_17500 ) ( ON ?auto_17496 ?auto_17501 ) ( not ( = ?auto_17496 ?auto_17501 ) ) ( not ( = ?auto_17497 ?auto_17501 ) ) ( not ( = ?auto_17498 ?auto_17501 ) ) ( not ( = ?auto_17499 ?auto_17501 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( ON ?auto_17497 ?auto_17496 ) ( ON-TABLE ?auto_17501 ) ( ON ?auto_17498 ?auto_17497 ) ( CLEAR ?auto_17498 ) ( HOLDING ?auto_17499 ) ( CLEAR ?auto_17500 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17500 ?auto_17499 )
      ( MAKE-4PILE ?auto_17496 ?auto_17497 ?auto_17498 ?auto_17499 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17502 - BLOCK
      ?auto_17503 - BLOCK
      ?auto_17504 - BLOCK
      ?auto_17505 - BLOCK
    )
    :vars
    (
      ?auto_17506 - BLOCK
      ?auto_17507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17502 ?auto_17503 ) ) ( not ( = ?auto_17502 ?auto_17504 ) ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( not ( = ?auto_17503 ?auto_17504 ) ) ( not ( = ?auto_17503 ?auto_17505 ) ) ( not ( = ?auto_17504 ?auto_17505 ) ) ( not ( = ?auto_17502 ?auto_17506 ) ) ( not ( = ?auto_17503 ?auto_17506 ) ) ( not ( = ?auto_17504 ?auto_17506 ) ) ( not ( = ?auto_17505 ?auto_17506 ) ) ( ON-TABLE ?auto_17506 ) ( ON ?auto_17502 ?auto_17507 ) ( not ( = ?auto_17502 ?auto_17507 ) ) ( not ( = ?auto_17503 ?auto_17507 ) ) ( not ( = ?auto_17504 ?auto_17507 ) ) ( not ( = ?auto_17505 ?auto_17507 ) ) ( not ( = ?auto_17506 ?auto_17507 ) ) ( ON ?auto_17503 ?auto_17502 ) ( ON-TABLE ?auto_17507 ) ( ON ?auto_17504 ?auto_17503 ) ( CLEAR ?auto_17506 ) ( ON ?auto_17505 ?auto_17504 ) ( CLEAR ?auto_17505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17507 ?auto_17502 ?auto_17503 ?auto_17504 )
      ( MAKE-4PILE ?auto_17502 ?auto_17503 ?auto_17504 ?auto_17505 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17508 - BLOCK
      ?auto_17509 - BLOCK
      ?auto_17510 - BLOCK
      ?auto_17511 - BLOCK
    )
    :vars
    (
      ?auto_17512 - BLOCK
      ?auto_17513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17508 ?auto_17509 ) ) ( not ( = ?auto_17508 ?auto_17510 ) ) ( not ( = ?auto_17508 ?auto_17511 ) ) ( not ( = ?auto_17509 ?auto_17510 ) ) ( not ( = ?auto_17509 ?auto_17511 ) ) ( not ( = ?auto_17510 ?auto_17511 ) ) ( not ( = ?auto_17508 ?auto_17512 ) ) ( not ( = ?auto_17509 ?auto_17512 ) ) ( not ( = ?auto_17510 ?auto_17512 ) ) ( not ( = ?auto_17511 ?auto_17512 ) ) ( ON ?auto_17508 ?auto_17513 ) ( not ( = ?auto_17508 ?auto_17513 ) ) ( not ( = ?auto_17509 ?auto_17513 ) ) ( not ( = ?auto_17510 ?auto_17513 ) ) ( not ( = ?auto_17511 ?auto_17513 ) ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( ON ?auto_17509 ?auto_17508 ) ( ON-TABLE ?auto_17513 ) ( ON ?auto_17510 ?auto_17509 ) ( ON ?auto_17511 ?auto_17510 ) ( CLEAR ?auto_17511 ) ( HOLDING ?auto_17512 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17512 )
      ( MAKE-4PILE ?auto_17508 ?auto_17509 ?auto_17510 ?auto_17511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17514 - BLOCK
      ?auto_17515 - BLOCK
      ?auto_17516 - BLOCK
      ?auto_17517 - BLOCK
    )
    :vars
    (
      ?auto_17518 - BLOCK
      ?auto_17519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17514 ?auto_17515 ) ) ( not ( = ?auto_17514 ?auto_17516 ) ) ( not ( = ?auto_17514 ?auto_17517 ) ) ( not ( = ?auto_17515 ?auto_17516 ) ) ( not ( = ?auto_17515 ?auto_17517 ) ) ( not ( = ?auto_17516 ?auto_17517 ) ) ( not ( = ?auto_17514 ?auto_17518 ) ) ( not ( = ?auto_17515 ?auto_17518 ) ) ( not ( = ?auto_17516 ?auto_17518 ) ) ( not ( = ?auto_17517 ?auto_17518 ) ) ( ON ?auto_17514 ?auto_17519 ) ( not ( = ?auto_17514 ?auto_17519 ) ) ( not ( = ?auto_17515 ?auto_17519 ) ) ( not ( = ?auto_17516 ?auto_17519 ) ) ( not ( = ?auto_17517 ?auto_17519 ) ) ( not ( = ?auto_17518 ?auto_17519 ) ) ( ON ?auto_17515 ?auto_17514 ) ( ON-TABLE ?auto_17519 ) ( ON ?auto_17516 ?auto_17515 ) ( ON ?auto_17517 ?auto_17516 ) ( ON ?auto_17518 ?auto_17517 ) ( CLEAR ?auto_17518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17519 ?auto_17514 ?auto_17515 ?auto_17516 ?auto_17517 )
      ( MAKE-4PILE ?auto_17514 ?auto_17515 ?auto_17516 ?auto_17517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17530 - BLOCK
      ?auto_17531 - BLOCK
      ?auto_17532 - BLOCK
      ?auto_17533 - BLOCK
      ?auto_17534 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17533 ) ( ON-TABLE ?auto_17530 ) ( ON ?auto_17531 ?auto_17530 ) ( ON ?auto_17532 ?auto_17531 ) ( ON ?auto_17533 ?auto_17532 ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17532 ) ) ( not ( = ?auto_17530 ?auto_17533 ) ) ( not ( = ?auto_17530 ?auto_17534 ) ) ( not ( = ?auto_17531 ?auto_17532 ) ) ( not ( = ?auto_17531 ?auto_17533 ) ) ( not ( = ?auto_17531 ?auto_17534 ) ) ( not ( = ?auto_17532 ?auto_17533 ) ) ( not ( = ?auto_17532 ?auto_17534 ) ) ( not ( = ?auto_17533 ?auto_17534 ) ) ( ON-TABLE ?auto_17534 ) ( CLEAR ?auto_17534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_17534 )
      ( MAKE-5PILE ?auto_17530 ?auto_17531 ?auto_17532 ?auto_17533 ?auto_17534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17535 - BLOCK
      ?auto_17536 - BLOCK
      ?auto_17537 - BLOCK
      ?auto_17538 - BLOCK
      ?auto_17539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17535 ) ( ON ?auto_17536 ?auto_17535 ) ( ON ?auto_17537 ?auto_17536 ) ( not ( = ?auto_17535 ?auto_17536 ) ) ( not ( = ?auto_17535 ?auto_17537 ) ) ( not ( = ?auto_17535 ?auto_17538 ) ) ( not ( = ?auto_17535 ?auto_17539 ) ) ( not ( = ?auto_17536 ?auto_17537 ) ) ( not ( = ?auto_17536 ?auto_17538 ) ) ( not ( = ?auto_17536 ?auto_17539 ) ) ( not ( = ?auto_17537 ?auto_17538 ) ) ( not ( = ?auto_17537 ?auto_17539 ) ) ( not ( = ?auto_17538 ?auto_17539 ) ) ( ON-TABLE ?auto_17539 ) ( CLEAR ?auto_17539 ) ( HOLDING ?auto_17538 ) ( CLEAR ?auto_17537 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17535 ?auto_17536 ?auto_17537 ?auto_17538 )
      ( MAKE-5PILE ?auto_17535 ?auto_17536 ?auto_17537 ?auto_17538 ?auto_17539 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17540 - BLOCK
      ?auto_17541 - BLOCK
      ?auto_17542 - BLOCK
      ?auto_17543 - BLOCK
      ?auto_17544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17540 ) ( ON ?auto_17541 ?auto_17540 ) ( ON ?auto_17542 ?auto_17541 ) ( not ( = ?auto_17540 ?auto_17541 ) ) ( not ( = ?auto_17540 ?auto_17542 ) ) ( not ( = ?auto_17540 ?auto_17543 ) ) ( not ( = ?auto_17540 ?auto_17544 ) ) ( not ( = ?auto_17541 ?auto_17542 ) ) ( not ( = ?auto_17541 ?auto_17543 ) ) ( not ( = ?auto_17541 ?auto_17544 ) ) ( not ( = ?auto_17542 ?auto_17543 ) ) ( not ( = ?auto_17542 ?auto_17544 ) ) ( not ( = ?auto_17543 ?auto_17544 ) ) ( ON-TABLE ?auto_17544 ) ( CLEAR ?auto_17542 ) ( ON ?auto_17543 ?auto_17544 ) ( CLEAR ?auto_17543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17544 )
      ( MAKE-5PILE ?auto_17540 ?auto_17541 ?auto_17542 ?auto_17543 ?auto_17544 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17545 - BLOCK
      ?auto_17546 - BLOCK
      ?auto_17547 - BLOCK
      ?auto_17548 - BLOCK
      ?auto_17549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17545 ) ( ON ?auto_17546 ?auto_17545 ) ( not ( = ?auto_17545 ?auto_17546 ) ) ( not ( = ?auto_17545 ?auto_17547 ) ) ( not ( = ?auto_17545 ?auto_17548 ) ) ( not ( = ?auto_17545 ?auto_17549 ) ) ( not ( = ?auto_17546 ?auto_17547 ) ) ( not ( = ?auto_17546 ?auto_17548 ) ) ( not ( = ?auto_17546 ?auto_17549 ) ) ( not ( = ?auto_17547 ?auto_17548 ) ) ( not ( = ?auto_17547 ?auto_17549 ) ) ( not ( = ?auto_17548 ?auto_17549 ) ) ( ON-TABLE ?auto_17549 ) ( ON ?auto_17548 ?auto_17549 ) ( CLEAR ?auto_17548 ) ( HOLDING ?auto_17547 ) ( CLEAR ?auto_17546 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17545 ?auto_17546 ?auto_17547 )
      ( MAKE-5PILE ?auto_17545 ?auto_17546 ?auto_17547 ?auto_17548 ?auto_17549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17550 - BLOCK
      ?auto_17551 - BLOCK
      ?auto_17552 - BLOCK
      ?auto_17553 - BLOCK
      ?auto_17554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17550 ) ( ON ?auto_17551 ?auto_17550 ) ( not ( = ?auto_17550 ?auto_17551 ) ) ( not ( = ?auto_17550 ?auto_17552 ) ) ( not ( = ?auto_17550 ?auto_17553 ) ) ( not ( = ?auto_17550 ?auto_17554 ) ) ( not ( = ?auto_17551 ?auto_17552 ) ) ( not ( = ?auto_17551 ?auto_17553 ) ) ( not ( = ?auto_17551 ?auto_17554 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17554 ) ) ( not ( = ?auto_17553 ?auto_17554 ) ) ( ON-TABLE ?auto_17554 ) ( ON ?auto_17553 ?auto_17554 ) ( CLEAR ?auto_17551 ) ( ON ?auto_17552 ?auto_17553 ) ( CLEAR ?auto_17552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17554 ?auto_17553 )
      ( MAKE-5PILE ?auto_17550 ?auto_17551 ?auto_17552 ?auto_17553 ?auto_17554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17555 - BLOCK
      ?auto_17556 - BLOCK
      ?auto_17557 - BLOCK
      ?auto_17558 - BLOCK
      ?auto_17559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17555 ) ( not ( = ?auto_17555 ?auto_17556 ) ) ( not ( = ?auto_17555 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17558 ) ) ( not ( = ?auto_17555 ?auto_17559 ) ) ( not ( = ?auto_17556 ?auto_17557 ) ) ( not ( = ?auto_17556 ?auto_17558 ) ) ( not ( = ?auto_17556 ?auto_17559 ) ) ( not ( = ?auto_17557 ?auto_17558 ) ) ( not ( = ?auto_17557 ?auto_17559 ) ) ( not ( = ?auto_17558 ?auto_17559 ) ) ( ON-TABLE ?auto_17559 ) ( ON ?auto_17558 ?auto_17559 ) ( ON ?auto_17557 ?auto_17558 ) ( CLEAR ?auto_17557 ) ( HOLDING ?auto_17556 ) ( CLEAR ?auto_17555 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17555 ?auto_17556 )
      ( MAKE-5PILE ?auto_17555 ?auto_17556 ?auto_17557 ?auto_17558 ?auto_17559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17560 - BLOCK
      ?auto_17561 - BLOCK
      ?auto_17562 - BLOCK
      ?auto_17563 - BLOCK
      ?auto_17564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17560 ) ( not ( = ?auto_17560 ?auto_17561 ) ) ( not ( = ?auto_17560 ?auto_17562 ) ) ( not ( = ?auto_17560 ?auto_17563 ) ) ( not ( = ?auto_17560 ?auto_17564 ) ) ( not ( = ?auto_17561 ?auto_17562 ) ) ( not ( = ?auto_17561 ?auto_17563 ) ) ( not ( = ?auto_17561 ?auto_17564 ) ) ( not ( = ?auto_17562 ?auto_17563 ) ) ( not ( = ?auto_17562 ?auto_17564 ) ) ( not ( = ?auto_17563 ?auto_17564 ) ) ( ON-TABLE ?auto_17564 ) ( ON ?auto_17563 ?auto_17564 ) ( ON ?auto_17562 ?auto_17563 ) ( CLEAR ?auto_17560 ) ( ON ?auto_17561 ?auto_17562 ) ( CLEAR ?auto_17561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17564 ?auto_17563 ?auto_17562 )
      ( MAKE-5PILE ?auto_17560 ?auto_17561 ?auto_17562 ?auto_17563 ?auto_17564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17565 - BLOCK
      ?auto_17566 - BLOCK
      ?auto_17567 - BLOCK
      ?auto_17568 - BLOCK
      ?auto_17569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17565 ?auto_17566 ) ) ( not ( = ?auto_17565 ?auto_17567 ) ) ( not ( = ?auto_17565 ?auto_17568 ) ) ( not ( = ?auto_17565 ?auto_17569 ) ) ( not ( = ?auto_17566 ?auto_17567 ) ) ( not ( = ?auto_17566 ?auto_17568 ) ) ( not ( = ?auto_17566 ?auto_17569 ) ) ( not ( = ?auto_17567 ?auto_17568 ) ) ( not ( = ?auto_17567 ?auto_17569 ) ) ( not ( = ?auto_17568 ?auto_17569 ) ) ( ON-TABLE ?auto_17569 ) ( ON ?auto_17568 ?auto_17569 ) ( ON ?auto_17567 ?auto_17568 ) ( ON ?auto_17566 ?auto_17567 ) ( CLEAR ?auto_17566 ) ( HOLDING ?auto_17565 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17565 )
      ( MAKE-5PILE ?auto_17565 ?auto_17566 ?auto_17567 ?auto_17568 ?auto_17569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17570 - BLOCK
      ?auto_17571 - BLOCK
      ?auto_17572 - BLOCK
      ?auto_17573 - BLOCK
      ?auto_17574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17570 ?auto_17571 ) ) ( not ( = ?auto_17570 ?auto_17572 ) ) ( not ( = ?auto_17570 ?auto_17573 ) ) ( not ( = ?auto_17570 ?auto_17574 ) ) ( not ( = ?auto_17571 ?auto_17572 ) ) ( not ( = ?auto_17571 ?auto_17573 ) ) ( not ( = ?auto_17571 ?auto_17574 ) ) ( not ( = ?auto_17572 ?auto_17573 ) ) ( not ( = ?auto_17572 ?auto_17574 ) ) ( not ( = ?auto_17573 ?auto_17574 ) ) ( ON-TABLE ?auto_17574 ) ( ON ?auto_17573 ?auto_17574 ) ( ON ?auto_17572 ?auto_17573 ) ( ON ?auto_17571 ?auto_17572 ) ( ON ?auto_17570 ?auto_17571 ) ( CLEAR ?auto_17570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17574 ?auto_17573 ?auto_17572 ?auto_17571 )
      ( MAKE-5PILE ?auto_17570 ?auto_17571 ?auto_17572 ?auto_17573 ?auto_17574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17580 - BLOCK
      ?auto_17581 - BLOCK
      ?auto_17582 - BLOCK
      ?auto_17583 - BLOCK
      ?auto_17584 - BLOCK
    )
    :vars
    (
      ?auto_17585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17580 ?auto_17581 ) ) ( not ( = ?auto_17580 ?auto_17582 ) ) ( not ( = ?auto_17580 ?auto_17583 ) ) ( not ( = ?auto_17580 ?auto_17584 ) ) ( not ( = ?auto_17581 ?auto_17582 ) ) ( not ( = ?auto_17581 ?auto_17583 ) ) ( not ( = ?auto_17581 ?auto_17584 ) ) ( not ( = ?auto_17582 ?auto_17583 ) ) ( not ( = ?auto_17582 ?auto_17584 ) ) ( not ( = ?auto_17583 ?auto_17584 ) ) ( ON-TABLE ?auto_17584 ) ( ON ?auto_17583 ?auto_17584 ) ( ON ?auto_17582 ?auto_17583 ) ( ON ?auto_17581 ?auto_17582 ) ( CLEAR ?auto_17581 ) ( ON ?auto_17580 ?auto_17585 ) ( CLEAR ?auto_17580 ) ( HAND-EMPTY ) ( not ( = ?auto_17580 ?auto_17585 ) ) ( not ( = ?auto_17581 ?auto_17585 ) ) ( not ( = ?auto_17582 ?auto_17585 ) ) ( not ( = ?auto_17583 ?auto_17585 ) ) ( not ( = ?auto_17584 ?auto_17585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17580 ?auto_17585 )
      ( MAKE-5PILE ?auto_17580 ?auto_17581 ?auto_17582 ?auto_17583 ?auto_17584 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17586 - BLOCK
      ?auto_17587 - BLOCK
      ?auto_17588 - BLOCK
      ?auto_17589 - BLOCK
      ?auto_17590 - BLOCK
    )
    :vars
    (
      ?auto_17591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17586 ?auto_17587 ) ) ( not ( = ?auto_17586 ?auto_17588 ) ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17586 ?auto_17590 ) ) ( not ( = ?auto_17587 ?auto_17588 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17590 ) ) ( not ( = ?auto_17588 ?auto_17589 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17589 ?auto_17590 ) ) ( ON-TABLE ?auto_17590 ) ( ON ?auto_17589 ?auto_17590 ) ( ON ?auto_17588 ?auto_17589 ) ( ON ?auto_17586 ?auto_17591 ) ( CLEAR ?auto_17586 ) ( not ( = ?auto_17586 ?auto_17591 ) ) ( not ( = ?auto_17587 ?auto_17591 ) ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( not ( = ?auto_17589 ?auto_17591 ) ) ( not ( = ?auto_17590 ?auto_17591 ) ) ( HOLDING ?auto_17587 ) ( CLEAR ?auto_17588 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17590 ?auto_17589 ?auto_17588 ?auto_17587 )
      ( MAKE-5PILE ?auto_17586 ?auto_17587 ?auto_17588 ?auto_17589 ?auto_17590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17592 - BLOCK
      ?auto_17593 - BLOCK
      ?auto_17594 - BLOCK
      ?auto_17595 - BLOCK
      ?auto_17596 - BLOCK
    )
    :vars
    (
      ?auto_17597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17592 ?auto_17593 ) ) ( not ( = ?auto_17592 ?auto_17594 ) ) ( not ( = ?auto_17592 ?auto_17595 ) ) ( not ( = ?auto_17592 ?auto_17596 ) ) ( not ( = ?auto_17593 ?auto_17594 ) ) ( not ( = ?auto_17593 ?auto_17595 ) ) ( not ( = ?auto_17593 ?auto_17596 ) ) ( not ( = ?auto_17594 ?auto_17595 ) ) ( not ( = ?auto_17594 ?auto_17596 ) ) ( not ( = ?auto_17595 ?auto_17596 ) ) ( ON-TABLE ?auto_17596 ) ( ON ?auto_17595 ?auto_17596 ) ( ON ?auto_17594 ?auto_17595 ) ( ON ?auto_17592 ?auto_17597 ) ( not ( = ?auto_17592 ?auto_17597 ) ) ( not ( = ?auto_17593 ?auto_17597 ) ) ( not ( = ?auto_17594 ?auto_17597 ) ) ( not ( = ?auto_17595 ?auto_17597 ) ) ( not ( = ?auto_17596 ?auto_17597 ) ) ( CLEAR ?auto_17594 ) ( ON ?auto_17593 ?auto_17592 ) ( CLEAR ?auto_17593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17597 ?auto_17592 )
      ( MAKE-5PILE ?auto_17592 ?auto_17593 ?auto_17594 ?auto_17595 ?auto_17596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17598 - BLOCK
      ?auto_17599 - BLOCK
      ?auto_17600 - BLOCK
      ?auto_17601 - BLOCK
      ?auto_17602 - BLOCK
    )
    :vars
    (
      ?auto_17603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17598 ?auto_17599 ) ) ( not ( = ?auto_17598 ?auto_17600 ) ) ( not ( = ?auto_17598 ?auto_17601 ) ) ( not ( = ?auto_17598 ?auto_17602 ) ) ( not ( = ?auto_17599 ?auto_17600 ) ) ( not ( = ?auto_17599 ?auto_17601 ) ) ( not ( = ?auto_17599 ?auto_17602 ) ) ( not ( = ?auto_17600 ?auto_17601 ) ) ( not ( = ?auto_17600 ?auto_17602 ) ) ( not ( = ?auto_17601 ?auto_17602 ) ) ( ON-TABLE ?auto_17602 ) ( ON ?auto_17601 ?auto_17602 ) ( ON ?auto_17598 ?auto_17603 ) ( not ( = ?auto_17598 ?auto_17603 ) ) ( not ( = ?auto_17599 ?auto_17603 ) ) ( not ( = ?auto_17600 ?auto_17603 ) ) ( not ( = ?auto_17601 ?auto_17603 ) ) ( not ( = ?auto_17602 ?auto_17603 ) ) ( ON ?auto_17599 ?auto_17598 ) ( CLEAR ?auto_17599 ) ( ON-TABLE ?auto_17603 ) ( HOLDING ?auto_17600 ) ( CLEAR ?auto_17601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17602 ?auto_17601 ?auto_17600 )
      ( MAKE-5PILE ?auto_17598 ?auto_17599 ?auto_17600 ?auto_17601 ?auto_17602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17604 - BLOCK
      ?auto_17605 - BLOCK
      ?auto_17606 - BLOCK
      ?auto_17607 - BLOCK
      ?auto_17608 - BLOCK
    )
    :vars
    (
      ?auto_17609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17604 ?auto_17605 ) ) ( not ( = ?auto_17604 ?auto_17606 ) ) ( not ( = ?auto_17604 ?auto_17607 ) ) ( not ( = ?auto_17604 ?auto_17608 ) ) ( not ( = ?auto_17605 ?auto_17606 ) ) ( not ( = ?auto_17605 ?auto_17607 ) ) ( not ( = ?auto_17605 ?auto_17608 ) ) ( not ( = ?auto_17606 ?auto_17607 ) ) ( not ( = ?auto_17606 ?auto_17608 ) ) ( not ( = ?auto_17607 ?auto_17608 ) ) ( ON-TABLE ?auto_17608 ) ( ON ?auto_17607 ?auto_17608 ) ( ON ?auto_17604 ?auto_17609 ) ( not ( = ?auto_17604 ?auto_17609 ) ) ( not ( = ?auto_17605 ?auto_17609 ) ) ( not ( = ?auto_17606 ?auto_17609 ) ) ( not ( = ?auto_17607 ?auto_17609 ) ) ( not ( = ?auto_17608 ?auto_17609 ) ) ( ON ?auto_17605 ?auto_17604 ) ( ON-TABLE ?auto_17609 ) ( CLEAR ?auto_17607 ) ( ON ?auto_17606 ?auto_17605 ) ( CLEAR ?auto_17606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17609 ?auto_17604 ?auto_17605 )
      ( MAKE-5PILE ?auto_17604 ?auto_17605 ?auto_17606 ?auto_17607 ?auto_17608 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17610 - BLOCK
      ?auto_17611 - BLOCK
      ?auto_17612 - BLOCK
      ?auto_17613 - BLOCK
      ?auto_17614 - BLOCK
    )
    :vars
    (
      ?auto_17615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17610 ?auto_17611 ) ) ( not ( = ?auto_17610 ?auto_17612 ) ) ( not ( = ?auto_17610 ?auto_17613 ) ) ( not ( = ?auto_17610 ?auto_17614 ) ) ( not ( = ?auto_17611 ?auto_17612 ) ) ( not ( = ?auto_17611 ?auto_17613 ) ) ( not ( = ?auto_17611 ?auto_17614 ) ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( not ( = ?auto_17612 ?auto_17614 ) ) ( not ( = ?auto_17613 ?auto_17614 ) ) ( ON-TABLE ?auto_17614 ) ( ON ?auto_17610 ?auto_17615 ) ( not ( = ?auto_17610 ?auto_17615 ) ) ( not ( = ?auto_17611 ?auto_17615 ) ) ( not ( = ?auto_17612 ?auto_17615 ) ) ( not ( = ?auto_17613 ?auto_17615 ) ) ( not ( = ?auto_17614 ?auto_17615 ) ) ( ON ?auto_17611 ?auto_17610 ) ( ON-TABLE ?auto_17615 ) ( ON ?auto_17612 ?auto_17611 ) ( CLEAR ?auto_17612 ) ( HOLDING ?auto_17613 ) ( CLEAR ?auto_17614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17614 ?auto_17613 )
      ( MAKE-5PILE ?auto_17610 ?auto_17611 ?auto_17612 ?auto_17613 ?auto_17614 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17616 - BLOCK
      ?auto_17617 - BLOCK
      ?auto_17618 - BLOCK
      ?auto_17619 - BLOCK
      ?auto_17620 - BLOCK
    )
    :vars
    (
      ?auto_17621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17616 ?auto_17617 ) ) ( not ( = ?auto_17616 ?auto_17618 ) ) ( not ( = ?auto_17616 ?auto_17619 ) ) ( not ( = ?auto_17616 ?auto_17620 ) ) ( not ( = ?auto_17617 ?auto_17618 ) ) ( not ( = ?auto_17617 ?auto_17619 ) ) ( not ( = ?auto_17617 ?auto_17620 ) ) ( not ( = ?auto_17618 ?auto_17619 ) ) ( not ( = ?auto_17618 ?auto_17620 ) ) ( not ( = ?auto_17619 ?auto_17620 ) ) ( ON-TABLE ?auto_17620 ) ( ON ?auto_17616 ?auto_17621 ) ( not ( = ?auto_17616 ?auto_17621 ) ) ( not ( = ?auto_17617 ?auto_17621 ) ) ( not ( = ?auto_17618 ?auto_17621 ) ) ( not ( = ?auto_17619 ?auto_17621 ) ) ( not ( = ?auto_17620 ?auto_17621 ) ) ( ON ?auto_17617 ?auto_17616 ) ( ON-TABLE ?auto_17621 ) ( ON ?auto_17618 ?auto_17617 ) ( CLEAR ?auto_17620 ) ( ON ?auto_17619 ?auto_17618 ) ( CLEAR ?auto_17619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_17621 ?auto_17616 ?auto_17617 ?auto_17618 )
      ( MAKE-5PILE ?auto_17616 ?auto_17617 ?auto_17618 ?auto_17619 ?auto_17620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17622 - BLOCK
      ?auto_17623 - BLOCK
      ?auto_17624 - BLOCK
      ?auto_17625 - BLOCK
      ?auto_17626 - BLOCK
    )
    :vars
    (
      ?auto_17627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17622 ?auto_17623 ) ) ( not ( = ?auto_17622 ?auto_17624 ) ) ( not ( = ?auto_17622 ?auto_17625 ) ) ( not ( = ?auto_17622 ?auto_17626 ) ) ( not ( = ?auto_17623 ?auto_17624 ) ) ( not ( = ?auto_17623 ?auto_17625 ) ) ( not ( = ?auto_17623 ?auto_17626 ) ) ( not ( = ?auto_17624 ?auto_17625 ) ) ( not ( = ?auto_17624 ?auto_17626 ) ) ( not ( = ?auto_17625 ?auto_17626 ) ) ( ON ?auto_17622 ?auto_17627 ) ( not ( = ?auto_17622 ?auto_17627 ) ) ( not ( = ?auto_17623 ?auto_17627 ) ) ( not ( = ?auto_17624 ?auto_17627 ) ) ( not ( = ?auto_17625 ?auto_17627 ) ) ( not ( = ?auto_17626 ?auto_17627 ) ) ( ON ?auto_17623 ?auto_17622 ) ( ON-TABLE ?auto_17627 ) ( ON ?auto_17624 ?auto_17623 ) ( ON ?auto_17625 ?auto_17624 ) ( CLEAR ?auto_17625 ) ( HOLDING ?auto_17626 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17626 )
      ( MAKE-5PILE ?auto_17622 ?auto_17623 ?auto_17624 ?auto_17625 ?auto_17626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_17628 - BLOCK
      ?auto_17629 - BLOCK
      ?auto_17630 - BLOCK
      ?auto_17631 - BLOCK
      ?auto_17632 - BLOCK
    )
    :vars
    (
      ?auto_17633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17628 ?auto_17629 ) ) ( not ( = ?auto_17628 ?auto_17630 ) ) ( not ( = ?auto_17628 ?auto_17631 ) ) ( not ( = ?auto_17628 ?auto_17632 ) ) ( not ( = ?auto_17629 ?auto_17630 ) ) ( not ( = ?auto_17629 ?auto_17631 ) ) ( not ( = ?auto_17629 ?auto_17632 ) ) ( not ( = ?auto_17630 ?auto_17631 ) ) ( not ( = ?auto_17630 ?auto_17632 ) ) ( not ( = ?auto_17631 ?auto_17632 ) ) ( ON ?auto_17628 ?auto_17633 ) ( not ( = ?auto_17628 ?auto_17633 ) ) ( not ( = ?auto_17629 ?auto_17633 ) ) ( not ( = ?auto_17630 ?auto_17633 ) ) ( not ( = ?auto_17631 ?auto_17633 ) ) ( not ( = ?auto_17632 ?auto_17633 ) ) ( ON ?auto_17629 ?auto_17628 ) ( ON-TABLE ?auto_17633 ) ( ON ?auto_17630 ?auto_17629 ) ( ON ?auto_17631 ?auto_17630 ) ( ON ?auto_17632 ?auto_17631 ) ( CLEAR ?auto_17632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_17633 ?auto_17628 ?auto_17629 ?auto_17630 ?auto_17631 )
      ( MAKE-5PILE ?auto_17628 ?auto_17629 ?auto_17630 ?auto_17631 ?auto_17632 ) )
  )

)

