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
      ?auto_386701 - BLOCK
    )
    :vars
    (
      ?auto_386702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386701 ?auto_386702 ) ( CLEAR ?auto_386701 ) ( HAND-EMPTY ) ( not ( = ?auto_386701 ?auto_386702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386701 ?auto_386702 )
      ( !PUTDOWN ?auto_386701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_386704 - BLOCK
    )
    :vars
    (
      ?auto_386705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386704 ?auto_386705 ) ( CLEAR ?auto_386704 ) ( HAND-EMPTY ) ( not ( = ?auto_386704 ?auto_386705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386704 ?auto_386705 )
      ( !PUTDOWN ?auto_386704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386708 - BLOCK
      ?auto_386709 - BLOCK
    )
    :vars
    (
      ?auto_386710 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386708 ) ( ON ?auto_386709 ?auto_386710 ) ( CLEAR ?auto_386709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386708 ) ( not ( = ?auto_386708 ?auto_386709 ) ) ( not ( = ?auto_386708 ?auto_386710 ) ) ( not ( = ?auto_386709 ?auto_386710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386709 ?auto_386710 )
      ( !STACK ?auto_386709 ?auto_386708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386713 - BLOCK
      ?auto_386714 - BLOCK
    )
    :vars
    (
      ?auto_386715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386713 ) ( ON ?auto_386714 ?auto_386715 ) ( CLEAR ?auto_386714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386713 ) ( not ( = ?auto_386713 ?auto_386714 ) ) ( not ( = ?auto_386713 ?auto_386715 ) ) ( not ( = ?auto_386714 ?auto_386715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386714 ?auto_386715 )
      ( !STACK ?auto_386714 ?auto_386713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386718 - BLOCK
      ?auto_386719 - BLOCK
    )
    :vars
    (
      ?auto_386720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386719 ?auto_386720 ) ( not ( = ?auto_386718 ?auto_386719 ) ) ( not ( = ?auto_386718 ?auto_386720 ) ) ( not ( = ?auto_386719 ?auto_386720 ) ) ( ON ?auto_386718 ?auto_386719 ) ( CLEAR ?auto_386718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386718 )
      ( MAKE-2PILE ?auto_386718 ?auto_386719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_386723 - BLOCK
      ?auto_386724 - BLOCK
    )
    :vars
    (
      ?auto_386725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386724 ?auto_386725 ) ( not ( = ?auto_386723 ?auto_386724 ) ) ( not ( = ?auto_386723 ?auto_386725 ) ) ( not ( = ?auto_386724 ?auto_386725 ) ) ( ON ?auto_386723 ?auto_386724 ) ( CLEAR ?auto_386723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386723 )
      ( MAKE-2PILE ?auto_386723 ?auto_386724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386729 - BLOCK
      ?auto_386730 - BLOCK
      ?auto_386731 - BLOCK
    )
    :vars
    (
      ?auto_386732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386730 ) ( ON ?auto_386731 ?auto_386732 ) ( CLEAR ?auto_386731 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386729 ) ( ON ?auto_386730 ?auto_386729 ) ( not ( = ?auto_386729 ?auto_386730 ) ) ( not ( = ?auto_386729 ?auto_386731 ) ) ( not ( = ?auto_386729 ?auto_386732 ) ) ( not ( = ?auto_386730 ?auto_386731 ) ) ( not ( = ?auto_386730 ?auto_386732 ) ) ( not ( = ?auto_386731 ?auto_386732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386731 ?auto_386732 )
      ( !STACK ?auto_386731 ?auto_386730 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386736 - BLOCK
      ?auto_386737 - BLOCK
      ?auto_386738 - BLOCK
    )
    :vars
    (
      ?auto_386739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386737 ) ( ON ?auto_386738 ?auto_386739 ) ( CLEAR ?auto_386738 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386736 ) ( ON ?auto_386737 ?auto_386736 ) ( not ( = ?auto_386736 ?auto_386737 ) ) ( not ( = ?auto_386736 ?auto_386738 ) ) ( not ( = ?auto_386736 ?auto_386739 ) ) ( not ( = ?auto_386737 ?auto_386738 ) ) ( not ( = ?auto_386737 ?auto_386739 ) ) ( not ( = ?auto_386738 ?auto_386739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386738 ?auto_386739 )
      ( !STACK ?auto_386738 ?auto_386737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386743 - BLOCK
      ?auto_386744 - BLOCK
      ?auto_386745 - BLOCK
    )
    :vars
    (
      ?auto_386746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386745 ?auto_386746 ) ( ON-TABLE ?auto_386743 ) ( not ( = ?auto_386743 ?auto_386744 ) ) ( not ( = ?auto_386743 ?auto_386745 ) ) ( not ( = ?auto_386743 ?auto_386746 ) ) ( not ( = ?auto_386744 ?auto_386745 ) ) ( not ( = ?auto_386744 ?auto_386746 ) ) ( not ( = ?auto_386745 ?auto_386746 ) ) ( CLEAR ?auto_386743 ) ( ON ?auto_386744 ?auto_386745 ) ( CLEAR ?auto_386744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386743 ?auto_386744 )
      ( MAKE-3PILE ?auto_386743 ?auto_386744 ?auto_386745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386750 - BLOCK
      ?auto_386751 - BLOCK
      ?auto_386752 - BLOCK
    )
    :vars
    (
      ?auto_386753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386752 ?auto_386753 ) ( ON-TABLE ?auto_386750 ) ( not ( = ?auto_386750 ?auto_386751 ) ) ( not ( = ?auto_386750 ?auto_386752 ) ) ( not ( = ?auto_386750 ?auto_386753 ) ) ( not ( = ?auto_386751 ?auto_386752 ) ) ( not ( = ?auto_386751 ?auto_386753 ) ) ( not ( = ?auto_386752 ?auto_386753 ) ) ( CLEAR ?auto_386750 ) ( ON ?auto_386751 ?auto_386752 ) ( CLEAR ?auto_386751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386750 ?auto_386751 )
      ( MAKE-3PILE ?auto_386750 ?auto_386751 ?auto_386752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386757 - BLOCK
      ?auto_386758 - BLOCK
      ?auto_386759 - BLOCK
    )
    :vars
    (
      ?auto_386760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386759 ?auto_386760 ) ( not ( = ?auto_386757 ?auto_386758 ) ) ( not ( = ?auto_386757 ?auto_386759 ) ) ( not ( = ?auto_386757 ?auto_386760 ) ) ( not ( = ?auto_386758 ?auto_386759 ) ) ( not ( = ?auto_386758 ?auto_386760 ) ) ( not ( = ?auto_386759 ?auto_386760 ) ) ( ON ?auto_386758 ?auto_386759 ) ( ON ?auto_386757 ?auto_386758 ) ( CLEAR ?auto_386757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386757 )
      ( MAKE-3PILE ?auto_386757 ?auto_386758 ?auto_386759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_386764 - BLOCK
      ?auto_386765 - BLOCK
      ?auto_386766 - BLOCK
    )
    :vars
    (
      ?auto_386767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386766 ?auto_386767 ) ( not ( = ?auto_386764 ?auto_386765 ) ) ( not ( = ?auto_386764 ?auto_386766 ) ) ( not ( = ?auto_386764 ?auto_386767 ) ) ( not ( = ?auto_386765 ?auto_386766 ) ) ( not ( = ?auto_386765 ?auto_386767 ) ) ( not ( = ?auto_386766 ?auto_386767 ) ) ( ON ?auto_386765 ?auto_386766 ) ( ON ?auto_386764 ?auto_386765 ) ( CLEAR ?auto_386764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386764 )
      ( MAKE-3PILE ?auto_386764 ?auto_386765 ?auto_386766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386772 - BLOCK
      ?auto_386773 - BLOCK
      ?auto_386774 - BLOCK
      ?auto_386775 - BLOCK
    )
    :vars
    (
      ?auto_386776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386774 ) ( ON ?auto_386775 ?auto_386776 ) ( CLEAR ?auto_386775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386772 ) ( ON ?auto_386773 ?auto_386772 ) ( ON ?auto_386774 ?auto_386773 ) ( not ( = ?auto_386772 ?auto_386773 ) ) ( not ( = ?auto_386772 ?auto_386774 ) ) ( not ( = ?auto_386772 ?auto_386775 ) ) ( not ( = ?auto_386772 ?auto_386776 ) ) ( not ( = ?auto_386773 ?auto_386774 ) ) ( not ( = ?auto_386773 ?auto_386775 ) ) ( not ( = ?auto_386773 ?auto_386776 ) ) ( not ( = ?auto_386774 ?auto_386775 ) ) ( not ( = ?auto_386774 ?auto_386776 ) ) ( not ( = ?auto_386775 ?auto_386776 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386775 ?auto_386776 )
      ( !STACK ?auto_386775 ?auto_386774 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386781 - BLOCK
      ?auto_386782 - BLOCK
      ?auto_386783 - BLOCK
      ?auto_386784 - BLOCK
    )
    :vars
    (
      ?auto_386785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386783 ) ( ON ?auto_386784 ?auto_386785 ) ( CLEAR ?auto_386784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386781 ) ( ON ?auto_386782 ?auto_386781 ) ( ON ?auto_386783 ?auto_386782 ) ( not ( = ?auto_386781 ?auto_386782 ) ) ( not ( = ?auto_386781 ?auto_386783 ) ) ( not ( = ?auto_386781 ?auto_386784 ) ) ( not ( = ?auto_386781 ?auto_386785 ) ) ( not ( = ?auto_386782 ?auto_386783 ) ) ( not ( = ?auto_386782 ?auto_386784 ) ) ( not ( = ?auto_386782 ?auto_386785 ) ) ( not ( = ?auto_386783 ?auto_386784 ) ) ( not ( = ?auto_386783 ?auto_386785 ) ) ( not ( = ?auto_386784 ?auto_386785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386784 ?auto_386785 )
      ( !STACK ?auto_386784 ?auto_386783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386790 - BLOCK
      ?auto_386791 - BLOCK
      ?auto_386792 - BLOCK
      ?auto_386793 - BLOCK
    )
    :vars
    (
      ?auto_386794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386793 ?auto_386794 ) ( ON-TABLE ?auto_386790 ) ( ON ?auto_386791 ?auto_386790 ) ( not ( = ?auto_386790 ?auto_386791 ) ) ( not ( = ?auto_386790 ?auto_386792 ) ) ( not ( = ?auto_386790 ?auto_386793 ) ) ( not ( = ?auto_386790 ?auto_386794 ) ) ( not ( = ?auto_386791 ?auto_386792 ) ) ( not ( = ?auto_386791 ?auto_386793 ) ) ( not ( = ?auto_386791 ?auto_386794 ) ) ( not ( = ?auto_386792 ?auto_386793 ) ) ( not ( = ?auto_386792 ?auto_386794 ) ) ( not ( = ?auto_386793 ?auto_386794 ) ) ( CLEAR ?auto_386791 ) ( ON ?auto_386792 ?auto_386793 ) ( CLEAR ?auto_386792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386790 ?auto_386791 ?auto_386792 )
      ( MAKE-4PILE ?auto_386790 ?auto_386791 ?auto_386792 ?auto_386793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386799 - BLOCK
      ?auto_386800 - BLOCK
      ?auto_386801 - BLOCK
      ?auto_386802 - BLOCK
    )
    :vars
    (
      ?auto_386803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386802 ?auto_386803 ) ( ON-TABLE ?auto_386799 ) ( ON ?auto_386800 ?auto_386799 ) ( not ( = ?auto_386799 ?auto_386800 ) ) ( not ( = ?auto_386799 ?auto_386801 ) ) ( not ( = ?auto_386799 ?auto_386802 ) ) ( not ( = ?auto_386799 ?auto_386803 ) ) ( not ( = ?auto_386800 ?auto_386801 ) ) ( not ( = ?auto_386800 ?auto_386802 ) ) ( not ( = ?auto_386800 ?auto_386803 ) ) ( not ( = ?auto_386801 ?auto_386802 ) ) ( not ( = ?auto_386801 ?auto_386803 ) ) ( not ( = ?auto_386802 ?auto_386803 ) ) ( CLEAR ?auto_386800 ) ( ON ?auto_386801 ?auto_386802 ) ( CLEAR ?auto_386801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386799 ?auto_386800 ?auto_386801 )
      ( MAKE-4PILE ?auto_386799 ?auto_386800 ?auto_386801 ?auto_386802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386808 - BLOCK
      ?auto_386809 - BLOCK
      ?auto_386810 - BLOCK
      ?auto_386811 - BLOCK
    )
    :vars
    (
      ?auto_386812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386811 ?auto_386812 ) ( ON-TABLE ?auto_386808 ) ( not ( = ?auto_386808 ?auto_386809 ) ) ( not ( = ?auto_386808 ?auto_386810 ) ) ( not ( = ?auto_386808 ?auto_386811 ) ) ( not ( = ?auto_386808 ?auto_386812 ) ) ( not ( = ?auto_386809 ?auto_386810 ) ) ( not ( = ?auto_386809 ?auto_386811 ) ) ( not ( = ?auto_386809 ?auto_386812 ) ) ( not ( = ?auto_386810 ?auto_386811 ) ) ( not ( = ?auto_386810 ?auto_386812 ) ) ( not ( = ?auto_386811 ?auto_386812 ) ) ( ON ?auto_386810 ?auto_386811 ) ( CLEAR ?auto_386808 ) ( ON ?auto_386809 ?auto_386810 ) ( CLEAR ?auto_386809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386808 ?auto_386809 )
      ( MAKE-4PILE ?auto_386808 ?auto_386809 ?auto_386810 ?auto_386811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386817 - BLOCK
      ?auto_386818 - BLOCK
      ?auto_386819 - BLOCK
      ?auto_386820 - BLOCK
    )
    :vars
    (
      ?auto_386821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386820 ?auto_386821 ) ( ON-TABLE ?auto_386817 ) ( not ( = ?auto_386817 ?auto_386818 ) ) ( not ( = ?auto_386817 ?auto_386819 ) ) ( not ( = ?auto_386817 ?auto_386820 ) ) ( not ( = ?auto_386817 ?auto_386821 ) ) ( not ( = ?auto_386818 ?auto_386819 ) ) ( not ( = ?auto_386818 ?auto_386820 ) ) ( not ( = ?auto_386818 ?auto_386821 ) ) ( not ( = ?auto_386819 ?auto_386820 ) ) ( not ( = ?auto_386819 ?auto_386821 ) ) ( not ( = ?auto_386820 ?auto_386821 ) ) ( ON ?auto_386819 ?auto_386820 ) ( CLEAR ?auto_386817 ) ( ON ?auto_386818 ?auto_386819 ) ( CLEAR ?auto_386818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386817 ?auto_386818 )
      ( MAKE-4PILE ?auto_386817 ?auto_386818 ?auto_386819 ?auto_386820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386826 - BLOCK
      ?auto_386827 - BLOCK
      ?auto_386828 - BLOCK
      ?auto_386829 - BLOCK
    )
    :vars
    (
      ?auto_386830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386829 ?auto_386830 ) ( not ( = ?auto_386826 ?auto_386827 ) ) ( not ( = ?auto_386826 ?auto_386828 ) ) ( not ( = ?auto_386826 ?auto_386829 ) ) ( not ( = ?auto_386826 ?auto_386830 ) ) ( not ( = ?auto_386827 ?auto_386828 ) ) ( not ( = ?auto_386827 ?auto_386829 ) ) ( not ( = ?auto_386827 ?auto_386830 ) ) ( not ( = ?auto_386828 ?auto_386829 ) ) ( not ( = ?auto_386828 ?auto_386830 ) ) ( not ( = ?auto_386829 ?auto_386830 ) ) ( ON ?auto_386828 ?auto_386829 ) ( ON ?auto_386827 ?auto_386828 ) ( ON ?auto_386826 ?auto_386827 ) ( CLEAR ?auto_386826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386826 )
      ( MAKE-4PILE ?auto_386826 ?auto_386827 ?auto_386828 ?auto_386829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_386835 - BLOCK
      ?auto_386836 - BLOCK
      ?auto_386837 - BLOCK
      ?auto_386838 - BLOCK
    )
    :vars
    (
      ?auto_386839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386838 ?auto_386839 ) ( not ( = ?auto_386835 ?auto_386836 ) ) ( not ( = ?auto_386835 ?auto_386837 ) ) ( not ( = ?auto_386835 ?auto_386838 ) ) ( not ( = ?auto_386835 ?auto_386839 ) ) ( not ( = ?auto_386836 ?auto_386837 ) ) ( not ( = ?auto_386836 ?auto_386838 ) ) ( not ( = ?auto_386836 ?auto_386839 ) ) ( not ( = ?auto_386837 ?auto_386838 ) ) ( not ( = ?auto_386837 ?auto_386839 ) ) ( not ( = ?auto_386838 ?auto_386839 ) ) ( ON ?auto_386837 ?auto_386838 ) ( ON ?auto_386836 ?auto_386837 ) ( ON ?auto_386835 ?auto_386836 ) ( CLEAR ?auto_386835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386835 )
      ( MAKE-4PILE ?auto_386835 ?auto_386836 ?auto_386837 ?auto_386838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386845 - BLOCK
      ?auto_386846 - BLOCK
      ?auto_386847 - BLOCK
      ?auto_386848 - BLOCK
      ?auto_386849 - BLOCK
    )
    :vars
    (
      ?auto_386850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386848 ) ( ON ?auto_386849 ?auto_386850 ) ( CLEAR ?auto_386849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386845 ) ( ON ?auto_386846 ?auto_386845 ) ( ON ?auto_386847 ?auto_386846 ) ( ON ?auto_386848 ?auto_386847 ) ( not ( = ?auto_386845 ?auto_386846 ) ) ( not ( = ?auto_386845 ?auto_386847 ) ) ( not ( = ?auto_386845 ?auto_386848 ) ) ( not ( = ?auto_386845 ?auto_386849 ) ) ( not ( = ?auto_386845 ?auto_386850 ) ) ( not ( = ?auto_386846 ?auto_386847 ) ) ( not ( = ?auto_386846 ?auto_386848 ) ) ( not ( = ?auto_386846 ?auto_386849 ) ) ( not ( = ?auto_386846 ?auto_386850 ) ) ( not ( = ?auto_386847 ?auto_386848 ) ) ( not ( = ?auto_386847 ?auto_386849 ) ) ( not ( = ?auto_386847 ?auto_386850 ) ) ( not ( = ?auto_386848 ?auto_386849 ) ) ( not ( = ?auto_386848 ?auto_386850 ) ) ( not ( = ?auto_386849 ?auto_386850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386849 ?auto_386850 )
      ( !STACK ?auto_386849 ?auto_386848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386856 - BLOCK
      ?auto_386857 - BLOCK
      ?auto_386858 - BLOCK
      ?auto_386859 - BLOCK
      ?auto_386860 - BLOCK
    )
    :vars
    (
      ?auto_386861 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386859 ) ( ON ?auto_386860 ?auto_386861 ) ( CLEAR ?auto_386860 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386856 ) ( ON ?auto_386857 ?auto_386856 ) ( ON ?auto_386858 ?auto_386857 ) ( ON ?auto_386859 ?auto_386858 ) ( not ( = ?auto_386856 ?auto_386857 ) ) ( not ( = ?auto_386856 ?auto_386858 ) ) ( not ( = ?auto_386856 ?auto_386859 ) ) ( not ( = ?auto_386856 ?auto_386860 ) ) ( not ( = ?auto_386856 ?auto_386861 ) ) ( not ( = ?auto_386857 ?auto_386858 ) ) ( not ( = ?auto_386857 ?auto_386859 ) ) ( not ( = ?auto_386857 ?auto_386860 ) ) ( not ( = ?auto_386857 ?auto_386861 ) ) ( not ( = ?auto_386858 ?auto_386859 ) ) ( not ( = ?auto_386858 ?auto_386860 ) ) ( not ( = ?auto_386858 ?auto_386861 ) ) ( not ( = ?auto_386859 ?auto_386860 ) ) ( not ( = ?auto_386859 ?auto_386861 ) ) ( not ( = ?auto_386860 ?auto_386861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386860 ?auto_386861 )
      ( !STACK ?auto_386860 ?auto_386859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386867 - BLOCK
      ?auto_386868 - BLOCK
      ?auto_386869 - BLOCK
      ?auto_386870 - BLOCK
      ?auto_386871 - BLOCK
    )
    :vars
    (
      ?auto_386872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386871 ?auto_386872 ) ( ON-TABLE ?auto_386867 ) ( ON ?auto_386868 ?auto_386867 ) ( ON ?auto_386869 ?auto_386868 ) ( not ( = ?auto_386867 ?auto_386868 ) ) ( not ( = ?auto_386867 ?auto_386869 ) ) ( not ( = ?auto_386867 ?auto_386870 ) ) ( not ( = ?auto_386867 ?auto_386871 ) ) ( not ( = ?auto_386867 ?auto_386872 ) ) ( not ( = ?auto_386868 ?auto_386869 ) ) ( not ( = ?auto_386868 ?auto_386870 ) ) ( not ( = ?auto_386868 ?auto_386871 ) ) ( not ( = ?auto_386868 ?auto_386872 ) ) ( not ( = ?auto_386869 ?auto_386870 ) ) ( not ( = ?auto_386869 ?auto_386871 ) ) ( not ( = ?auto_386869 ?auto_386872 ) ) ( not ( = ?auto_386870 ?auto_386871 ) ) ( not ( = ?auto_386870 ?auto_386872 ) ) ( not ( = ?auto_386871 ?auto_386872 ) ) ( CLEAR ?auto_386869 ) ( ON ?auto_386870 ?auto_386871 ) ( CLEAR ?auto_386870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_386867 ?auto_386868 ?auto_386869 ?auto_386870 )
      ( MAKE-5PILE ?auto_386867 ?auto_386868 ?auto_386869 ?auto_386870 ?auto_386871 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386878 - BLOCK
      ?auto_386879 - BLOCK
      ?auto_386880 - BLOCK
      ?auto_386881 - BLOCK
      ?auto_386882 - BLOCK
    )
    :vars
    (
      ?auto_386883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386882 ?auto_386883 ) ( ON-TABLE ?auto_386878 ) ( ON ?auto_386879 ?auto_386878 ) ( ON ?auto_386880 ?auto_386879 ) ( not ( = ?auto_386878 ?auto_386879 ) ) ( not ( = ?auto_386878 ?auto_386880 ) ) ( not ( = ?auto_386878 ?auto_386881 ) ) ( not ( = ?auto_386878 ?auto_386882 ) ) ( not ( = ?auto_386878 ?auto_386883 ) ) ( not ( = ?auto_386879 ?auto_386880 ) ) ( not ( = ?auto_386879 ?auto_386881 ) ) ( not ( = ?auto_386879 ?auto_386882 ) ) ( not ( = ?auto_386879 ?auto_386883 ) ) ( not ( = ?auto_386880 ?auto_386881 ) ) ( not ( = ?auto_386880 ?auto_386882 ) ) ( not ( = ?auto_386880 ?auto_386883 ) ) ( not ( = ?auto_386881 ?auto_386882 ) ) ( not ( = ?auto_386881 ?auto_386883 ) ) ( not ( = ?auto_386882 ?auto_386883 ) ) ( CLEAR ?auto_386880 ) ( ON ?auto_386881 ?auto_386882 ) ( CLEAR ?auto_386881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_386878 ?auto_386879 ?auto_386880 ?auto_386881 )
      ( MAKE-5PILE ?auto_386878 ?auto_386879 ?auto_386880 ?auto_386881 ?auto_386882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386889 - BLOCK
      ?auto_386890 - BLOCK
      ?auto_386891 - BLOCK
      ?auto_386892 - BLOCK
      ?auto_386893 - BLOCK
    )
    :vars
    (
      ?auto_386894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386893 ?auto_386894 ) ( ON-TABLE ?auto_386889 ) ( ON ?auto_386890 ?auto_386889 ) ( not ( = ?auto_386889 ?auto_386890 ) ) ( not ( = ?auto_386889 ?auto_386891 ) ) ( not ( = ?auto_386889 ?auto_386892 ) ) ( not ( = ?auto_386889 ?auto_386893 ) ) ( not ( = ?auto_386889 ?auto_386894 ) ) ( not ( = ?auto_386890 ?auto_386891 ) ) ( not ( = ?auto_386890 ?auto_386892 ) ) ( not ( = ?auto_386890 ?auto_386893 ) ) ( not ( = ?auto_386890 ?auto_386894 ) ) ( not ( = ?auto_386891 ?auto_386892 ) ) ( not ( = ?auto_386891 ?auto_386893 ) ) ( not ( = ?auto_386891 ?auto_386894 ) ) ( not ( = ?auto_386892 ?auto_386893 ) ) ( not ( = ?auto_386892 ?auto_386894 ) ) ( not ( = ?auto_386893 ?auto_386894 ) ) ( ON ?auto_386892 ?auto_386893 ) ( CLEAR ?auto_386890 ) ( ON ?auto_386891 ?auto_386892 ) ( CLEAR ?auto_386891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386889 ?auto_386890 ?auto_386891 )
      ( MAKE-5PILE ?auto_386889 ?auto_386890 ?auto_386891 ?auto_386892 ?auto_386893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386900 - BLOCK
      ?auto_386901 - BLOCK
      ?auto_386902 - BLOCK
      ?auto_386903 - BLOCK
      ?auto_386904 - BLOCK
    )
    :vars
    (
      ?auto_386905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386904 ?auto_386905 ) ( ON-TABLE ?auto_386900 ) ( ON ?auto_386901 ?auto_386900 ) ( not ( = ?auto_386900 ?auto_386901 ) ) ( not ( = ?auto_386900 ?auto_386902 ) ) ( not ( = ?auto_386900 ?auto_386903 ) ) ( not ( = ?auto_386900 ?auto_386904 ) ) ( not ( = ?auto_386900 ?auto_386905 ) ) ( not ( = ?auto_386901 ?auto_386902 ) ) ( not ( = ?auto_386901 ?auto_386903 ) ) ( not ( = ?auto_386901 ?auto_386904 ) ) ( not ( = ?auto_386901 ?auto_386905 ) ) ( not ( = ?auto_386902 ?auto_386903 ) ) ( not ( = ?auto_386902 ?auto_386904 ) ) ( not ( = ?auto_386902 ?auto_386905 ) ) ( not ( = ?auto_386903 ?auto_386904 ) ) ( not ( = ?auto_386903 ?auto_386905 ) ) ( not ( = ?auto_386904 ?auto_386905 ) ) ( ON ?auto_386903 ?auto_386904 ) ( CLEAR ?auto_386901 ) ( ON ?auto_386902 ?auto_386903 ) ( CLEAR ?auto_386902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_386900 ?auto_386901 ?auto_386902 )
      ( MAKE-5PILE ?auto_386900 ?auto_386901 ?auto_386902 ?auto_386903 ?auto_386904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386911 - BLOCK
      ?auto_386912 - BLOCK
      ?auto_386913 - BLOCK
      ?auto_386914 - BLOCK
      ?auto_386915 - BLOCK
    )
    :vars
    (
      ?auto_386916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386915 ?auto_386916 ) ( ON-TABLE ?auto_386911 ) ( not ( = ?auto_386911 ?auto_386912 ) ) ( not ( = ?auto_386911 ?auto_386913 ) ) ( not ( = ?auto_386911 ?auto_386914 ) ) ( not ( = ?auto_386911 ?auto_386915 ) ) ( not ( = ?auto_386911 ?auto_386916 ) ) ( not ( = ?auto_386912 ?auto_386913 ) ) ( not ( = ?auto_386912 ?auto_386914 ) ) ( not ( = ?auto_386912 ?auto_386915 ) ) ( not ( = ?auto_386912 ?auto_386916 ) ) ( not ( = ?auto_386913 ?auto_386914 ) ) ( not ( = ?auto_386913 ?auto_386915 ) ) ( not ( = ?auto_386913 ?auto_386916 ) ) ( not ( = ?auto_386914 ?auto_386915 ) ) ( not ( = ?auto_386914 ?auto_386916 ) ) ( not ( = ?auto_386915 ?auto_386916 ) ) ( ON ?auto_386914 ?auto_386915 ) ( ON ?auto_386913 ?auto_386914 ) ( CLEAR ?auto_386911 ) ( ON ?auto_386912 ?auto_386913 ) ( CLEAR ?auto_386912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386911 ?auto_386912 )
      ( MAKE-5PILE ?auto_386911 ?auto_386912 ?auto_386913 ?auto_386914 ?auto_386915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386922 - BLOCK
      ?auto_386923 - BLOCK
      ?auto_386924 - BLOCK
      ?auto_386925 - BLOCK
      ?auto_386926 - BLOCK
    )
    :vars
    (
      ?auto_386927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386926 ?auto_386927 ) ( ON-TABLE ?auto_386922 ) ( not ( = ?auto_386922 ?auto_386923 ) ) ( not ( = ?auto_386922 ?auto_386924 ) ) ( not ( = ?auto_386922 ?auto_386925 ) ) ( not ( = ?auto_386922 ?auto_386926 ) ) ( not ( = ?auto_386922 ?auto_386927 ) ) ( not ( = ?auto_386923 ?auto_386924 ) ) ( not ( = ?auto_386923 ?auto_386925 ) ) ( not ( = ?auto_386923 ?auto_386926 ) ) ( not ( = ?auto_386923 ?auto_386927 ) ) ( not ( = ?auto_386924 ?auto_386925 ) ) ( not ( = ?auto_386924 ?auto_386926 ) ) ( not ( = ?auto_386924 ?auto_386927 ) ) ( not ( = ?auto_386925 ?auto_386926 ) ) ( not ( = ?auto_386925 ?auto_386927 ) ) ( not ( = ?auto_386926 ?auto_386927 ) ) ( ON ?auto_386925 ?auto_386926 ) ( ON ?auto_386924 ?auto_386925 ) ( CLEAR ?auto_386922 ) ( ON ?auto_386923 ?auto_386924 ) ( CLEAR ?auto_386923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_386922 ?auto_386923 )
      ( MAKE-5PILE ?auto_386922 ?auto_386923 ?auto_386924 ?auto_386925 ?auto_386926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386933 - BLOCK
      ?auto_386934 - BLOCK
      ?auto_386935 - BLOCK
      ?auto_386936 - BLOCK
      ?auto_386937 - BLOCK
    )
    :vars
    (
      ?auto_386938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386937 ?auto_386938 ) ( not ( = ?auto_386933 ?auto_386934 ) ) ( not ( = ?auto_386933 ?auto_386935 ) ) ( not ( = ?auto_386933 ?auto_386936 ) ) ( not ( = ?auto_386933 ?auto_386937 ) ) ( not ( = ?auto_386933 ?auto_386938 ) ) ( not ( = ?auto_386934 ?auto_386935 ) ) ( not ( = ?auto_386934 ?auto_386936 ) ) ( not ( = ?auto_386934 ?auto_386937 ) ) ( not ( = ?auto_386934 ?auto_386938 ) ) ( not ( = ?auto_386935 ?auto_386936 ) ) ( not ( = ?auto_386935 ?auto_386937 ) ) ( not ( = ?auto_386935 ?auto_386938 ) ) ( not ( = ?auto_386936 ?auto_386937 ) ) ( not ( = ?auto_386936 ?auto_386938 ) ) ( not ( = ?auto_386937 ?auto_386938 ) ) ( ON ?auto_386936 ?auto_386937 ) ( ON ?auto_386935 ?auto_386936 ) ( ON ?auto_386934 ?auto_386935 ) ( ON ?auto_386933 ?auto_386934 ) ( CLEAR ?auto_386933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386933 )
      ( MAKE-5PILE ?auto_386933 ?auto_386934 ?auto_386935 ?auto_386936 ?auto_386937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_386944 - BLOCK
      ?auto_386945 - BLOCK
      ?auto_386946 - BLOCK
      ?auto_386947 - BLOCK
      ?auto_386948 - BLOCK
    )
    :vars
    (
      ?auto_386949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386948 ?auto_386949 ) ( not ( = ?auto_386944 ?auto_386945 ) ) ( not ( = ?auto_386944 ?auto_386946 ) ) ( not ( = ?auto_386944 ?auto_386947 ) ) ( not ( = ?auto_386944 ?auto_386948 ) ) ( not ( = ?auto_386944 ?auto_386949 ) ) ( not ( = ?auto_386945 ?auto_386946 ) ) ( not ( = ?auto_386945 ?auto_386947 ) ) ( not ( = ?auto_386945 ?auto_386948 ) ) ( not ( = ?auto_386945 ?auto_386949 ) ) ( not ( = ?auto_386946 ?auto_386947 ) ) ( not ( = ?auto_386946 ?auto_386948 ) ) ( not ( = ?auto_386946 ?auto_386949 ) ) ( not ( = ?auto_386947 ?auto_386948 ) ) ( not ( = ?auto_386947 ?auto_386949 ) ) ( not ( = ?auto_386948 ?auto_386949 ) ) ( ON ?auto_386947 ?auto_386948 ) ( ON ?auto_386946 ?auto_386947 ) ( ON ?auto_386945 ?auto_386946 ) ( ON ?auto_386944 ?auto_386945 ) ( CLEAR ?auto_386944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_386944 )
      ( MAKE-5PILE ?auto_386944 ?auto_386945 ?auto_386946 ?auto_386947 ?auto_386948 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386956 - BLOCK
      ?auto_386957 - BLOCK
      ?auto_386958 - BLOCK
      ?auto_386959 - BLOCK
      ?auto_386960 - BLOCK
      ?auto_386961 - BLOCK
    )
    :vars
    (
      ?auto_386962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386960 ) ( ON ?auto_386961 ?auto_386962 ) ( CLEAR ?auto_386961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386956 ) ( ON ?auto_386957 ?auto_386956 ) ( ON ?auto_386958 ?auto_386957 ) ( ON ?auto_386959 ?auto_386958 ) ( ON ?auto_386960 ?auto_386959 ) ( not ( = ?auto_386956 ?auto_386957 ) ) ( not ( = ?auto_386956 ?auto_386958 ) ) ( not ( = ?auto_386956 ?auto_386959 ) ) ( not ( = ?auto_386956 ?auto_386960 ) ) ( not ( = ?auto_386956 ?auto_386961 ) ) ( not ( = ?auto_386956 ?auto_386962 ) ) ( not ( = ?auto_386957 ?auto_386958 ) ) ( not ( = ?auto_386957 ?auto_386959 ) ) ( not ( = ?auto_386957 ?auto_386960 ) ) ( not ( = ?auto_386957 ?auto_386961 ) ) ( not ( = ?auto_386957 ?auto_386962 ) ) ( not ( = ?auto_386958 ?auto_386959 ) ) ( not ( = ?auto_386958 ?auto_386960 ) ) ( not ( = ?auto_386958 ?auto_386961 ) ) ( not ( = ?auto_386958 ?auto_386962 ) ) ( not ( = ?auto_386959 ?auto_386960 ) ) ( not ( = ?auto_386959 ?auto_386961 ) ) ( not ( = ?auto_386959 ?auto_386962 ) ) ( not ( = ?auto_386960 ?auto_386961 ) ) ( not ( = ?auto_386960 ?auto_386962 ) ) ( not ( = ?auto_386961 ?auto_386962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386961 ?auto_386962 )
      ( !STACK ?auto_386961 ?auto_386960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386969 - BLOCK
      ?auto_386970 - BLOCK
      ?auto_386971 - BLOCK
      ?auto_386972 - BLOCK
      ?auto_386973 - BLOCK
      ?auto_386974 - BLOCK
    )
    :vars
    (
      ?auto_386975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_386973 ) ( ON ?auto_386974 ?auto_386975 ) ( CLEAR ?auto_386974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_386969 ) ( ON ?auto_386970 ?auto_386969 ) ( ON ?auto_386971 ?auto_386970 ) ( ON ?auto_386972 ?auto_386971 ) ( ON ?auto_386973 ?auto_386972 ) ( not ( = ?auto_386969 ?auto_386970 ) ) ( not ( = ?auto_386969 ?auto_386971 ) ) ( not ( = ?auto_386969 ?auto_386972 ) ) ( not ( = ?auto_386969 ?auto_386973 ) ) ( not ( = ?auto_386969 ?auto_386974 ) ) ( not ( = ?auto_386969 ?auto_386975 ) ) ( not ( = ?auto_386970 ?auto_386971 ) ) ( not ( = ?auto_386970 ?auto_386972 ) ) ( not ( = ?auto_386970 ?auto_386973 ) ) ( not ( = ?auto_386970 ?auto_386974 ) ) ( not ( = ?auto_386970 ?auto_386975 ) ) ( not ( = ?auto_386971 ?auto_386972 ) ) ( not ( = ?auto_386971 ?auto_386973 ) ) ( not ( = ?auto_386971 ?auto_386974 ) ) ( not ( = ?auto_386971 ?auto_386975 ) ) ( not ( = ?auto_386972 ?auto_386973 ) ) ( not ( = ?auto_386972 ?auto_386974 ) ) ( not ( = ?auto_386972 ?auto_386975 ) ) ( not ( = ?auto_386973 ?auto_386974 ) ) ( not ( = ?auto_386973 ?auto_386975 ) ) ( not ( = ?auto_386974 ?auto_386975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_386974 ?auto_386975 )
      ( !STACK ?auto_386974 ?auto_386973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386982 - BLOCK
      ?auto_386983 - BLOCK
      ?auto_386984 - BLOCK
      ?auto_386985 - BLOCK
      ?auto_386986 - BLOCK
      ?auto_386987 - BLOCK
    )
    :vars
    (
      ?auto_386988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_386987 ?auto_386988 ) ( ON-TABLE ?auto_386982 ) ( ON ?auto_386983 ?auto_386982 ) ( ON ?auto_386984 ?auto_386983 ) ( ON ?auto_386985 ?auto_386984 ) ( not ( = ?auto_386982 ?auto_386983 ) ) ( not ( = ?auto_386982 ?auto_386984 ) ) ( not ( = ?auto_386982 ?auto_386985 ) ) ( not ( = ?auto_386982 ?auto_386986 ) ) ( not ( = ?auto_386982 ?auto_386987 ) ) ( not ( = ?auto_386982 ?auto_386988 ) ) ( not ( = ?auto_386983 ?auto_386984 ) ) ( not ( = ?auto_386983 ?auto_386985 ) ) ( not ( = ?auto_386983 ?auto_386986 ) ) ( not ( = ?auto_386983 ?auto_386987 ) ) ( not ( = ?auto_386983 ?auto_386988 ) ) ( not ( = ?auto_386984 ?auto_386985 ) ) ( not ( = ?auto_386984 ?auto_386986 ) ) ( not ( = ?auto_386984 ?auto_386987 ) ) ( not ( = ?auto_386984 ?auto_386988 ) ) ( not ( = ?auto_386985 ?auto_386986 ) ) ( not ( = ?auto_386985 ?auto_386987 ) ) ( not ( = ?auto_386985 ?auto_386988 ) ) ( not ( = ?auto_386986 ?auto_386987 ) ) ( not ( = ?auto_386986 ?auto_386988 ) ) ( not ( = ?auto_386987 ?auto_386988 ) ) ( CLEAR ?auto_386985 ) ( ON ?auto_386986 ?auto_386987 ) ( CLEAR ?auto_386986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_386982 ?auto_386983 ?auto_386984 ?auto_386985 ?auto_386986 )
      ( MAKE-6PILE ?auto_386982 ?auto_386983 ?auto_386984 ?auto_386985 ?auto_386986 ?auto_386987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_386995 - BLOCK
      ?auto_386996 - BLOCK
      ?auto_386997 - BLOCK
      ?auto_386998 - BLOCK
      ?auto_386999 - BLOCK
      ?auto_387000 - BLOCK
    )
    :vars
    (
      ?auto_387001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387000 ?auto_387001 ) ( ON-TABLE ?auto_386995 ) ( ON ?auto_386996 ?auto_386995 ) ( ON ?auto_386997 ?auto_386996 ) ( ON ?auto_386998 ?auto_386997 ) ( not ( = ?auto_386995 ?auto_386996 ) ) ( not ( = ?auto_386995 ?auto_386997 ) ) ( not ( = ?auto_386995 ?auto_386998 ) ) ( not ( = ?auto_386995 ?auto_386999 ) ) ( not ( = ?auto_386995 ?auto_387000 ) ) ( not ( = ?auto_386995 ?auto_387001 ) ) ( not ( = ?auto_386996 ?auto_386997 ) ) ( not ( = ?auto_386996 ?auto_386998 ) ) ( not ( = ?auto_386996 ?auto_386999 ) ) ( not ( = ?auto_386996 ?auto_387000 ) ) ( not ( = ?auto_386996 ?auto_387001 ) ) ( not ( = ?auto_386997 ?auto_386998 ) ) ( not ( = ?auto_386997 ?auto_386999 ) ) ( not ( = ?auto_386997 ?auto_387000 ) ) ( not ( = ?auto_386997 ?auto_387001 ) ) ( not ( = ?auto_386998 ?auto_386999 ) ) ( not ( = ?auto_386998 ?auto_387000 ) ) ( not ( = ?auto_386998 ?auto_387001 ) ) ( not ( = ?auto_386999 ?auto_387000 ) ) ( not ( = ?auto_386999 ?auto_387001 ) ) ( not ( = ?auto_387000 ?auto_387001 ) ) ( CLEAR ?auto_386998 ) ( ON ?auto_386999 ?auto_387000 ) ( CLEAR ?auto_386999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_386995 ?auto_386996 ?auto_386997 ?auto_386998 ?auto_386999 )
      ( MAKE-6PILE ?auto_386995 ?auto_386996 ?auto_386997 ?auto_386998 ?auto_386999 ?auto_387000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387008 - BLOCK
      ?auto_387009 - BLOCK
      ?auto_387010 - BLOCK
      ?auto_387011 - BLOCK
      ?auto_387012 - BLOCK
      ?auto_387013 - BLOCK
    )
    :vars
    (
      ?auto_387014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387013 ?auto_387014 ) ( ON-TABLE ?auto_387008 ) ( ON ?auto_387009 ?auto_387008 ) ( ON ?auto_387010 ?auto_387009 ) ( not ( = ?auto_387008 ?auto_387009 ) ) ( not ( = ?auto_387008 ?auto_387010 ) ) ( not ( = ?auto_387008 ?auto_387011 ) ) ( not ( = ?auto_387008 ?auto_387012 ) ) ( not ( = ?auto_387008 ?auto_387013 ) ) ( not ( = ?auto_387008 ?auto_387014 ) ) ( not ( = ?auto_387009 ?auto_387010 ) ) ( not ( = ?auto_387009 ?auto_387011 ) ) ( not ( = ?auto_387009 ?auto_387012 ) ) ( not ( = ?auto_387009 ?auto_387013 ) ) ( not ( = ?auto_387009 ?auto_387014 ) ) ( not ( = ?auto_387010 ?auto_387011 ) ) ( not ( = ?auto_387010 ?auto_387012 ) ) ( not ( = ?auto_387010 ?auto_387013 ) ) ( not ( = ?auto_387010 ?auto_387014 ) ) ( not ( = ?auto_387011 ?auto_387012 ) ) ( not ( = ?auto_387011 ?auto_387013 ) ) ( not ( = ?auto_387011 ?auto_387014 ) ) ( not ( = ?auto_387012 ?auto_387013 ) ) ( not ( = ?auto_387012 ?auto_387014 ) ) ( not ( = ?auto_387013 ?auto_387014 ) ) ( ON ?auto_387012 ?auto_387013 ) ( CLEAR ?auto_387010 ) ( ON ?auto_387011 ?auto_387012 ) ( CLEAR ?auto_387011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387008 ?auto_387009 ?auto_387010 ?auto_387011 )
      ( MAKE-6PILE ?auto_387008 ?auto_387009 ?auto_387010 ?auto_387011 ?auto_387012 ?auto_387013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387021 - BLOCK
      ?auto_387022 - BLOCK
      ?auto_387023 - BLOCK
      ?auto_387024 - BLOCK
      ?auto_387025 - BLOCK
      ?auto_387026 - BLOCK
    )
    :vars
    (
      ?auto_387027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387026 ?auto_387027 ) ( ON-TABLE ?auto_387021 ) ( ON ?auto_387022 ?auto_387021 ) ( ON ?auto_387023 ?auto_387022 ) ( not ( = ?auto_387021 ?auto_387022 ) ) ( not ( = ?auto_387021 ?auto_387023 ) ) ( not ( = ?auto_387021 ?auto_387024 ) ) ( not ( = ?auto_387021 ?auto_387025 ) ) ( not ( = ?auto_387021 ?auto_387026 ) ) ( not ( = ?auto_387021 ?auto_387027 ) ) ( not ( = ?auto_387022 ?auto_387023 ) ) ( not ( = ?auto_387022 ?auto_387024 ) ) ( not ( = ?auto_387022 ?auto_387025 ) ) ( not ( = ?auto_387022 ?auto_387026 ) ) ( not ( = ?auto_387022 ?auto_387027 ) ) ( not ( = ?auto_387023 ?auto_387024 ) ) ( not ( = ?auto_387023 ?auto_387025 ) ) ( not ( = ?auto_387023 ?auto_387026 ) ) ( not ( = ?auto_387023 ?auto_387027 ) ) ( not ( = ?auto_387024 ?auto_387025 ) ) ( not ( = ?auto_387024 ?auto_387026 ) ) ( not ( = ?auto_387024 ?auto_387027 ) ) ( not ( = ?auto_387025 ?auto_387026 ) ) ( not ( = ?auto_387025 ?auto_387027 ) ) ( not ( = ?auto_387026 ?auto_387027 ) ) ( ON ?auto_387025 ?auto_387026 ) ( CLEAR ?auto_387023 ) ( ON ?auto_387024 ?auto_387025 ) ( CLEAR ?auto_387024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387021 ?auto_387022 ?auto_387023 ?auto_387024 )
      ( MAKE-6PILE ?auto_387021 ?auto_387022 ?auto_387023 ?auto_387024 ?auto_387025 ?auto_387026 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387034 - BLOCK
      ?auto_387035 - BLOCK
      ?auto_387036 - BLOCK
      ?auto_387037 - BLOCK
      ?auto_387038 - BLOCK
      ?auto_387039 - BLOCK
    )
    :vars
    (
      ?auto_387040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387039 ?auto_387040 ) ( ON-TABLE ?auto_387034 ) ( ON ?auto_387035 ?auto_387034 ) ( not ( = ?auto_387034 ?auto_387035 ) ) ( not ( = ?auto_387034 ?auto_387036 ) ) ( not ( = ?auto_387034 ?auto_387037 ) ) ( not ( = ?auto_387034 ?auto_387038 ) ) ( not ( = ?auto_387034 ?auto_387039 ) ) ( not ( = ?auto_387034 ?auto_387040 ) ) ( not ( = ?auto_387035 ?auto_387036 ) ) ( not ( = ?auto_387035 ?auto_387037 ) ) ( not ( = ?auto_387035 ?auto_387038 ) ) ( not ( = ?auto_387035 ?auto_387039 ) ) ( not ( = ?auto_387035 ?auto_387040 ) ) ( not ( = ?auto_387036 ?auto_387037 ) ) ( not ( = ?auto_387036 ?auto_387038 ) ) ( not ( = ?auto_387036 ?auto_387039 ) ) ( not ( = ?auto_387036 ?auto_387040 ) ) ( not ( = ?auto_387037 ?auto_387038 ) ) ( not ( = ?auto_387037 ?auto_387039 ) ) ( not ( = ?auto_387037 ?auto_387040 ) ) ( not ( = ?auto_387038 ?auto_387039 ) ) ( not ( = ?auto_387038 ?auto_387040 ) ) ( not ( = ?auto_387039 ?auto_387040 ) ) ( ON ?auto_387038 ?auto_387039 ) ( ON ?auto_387037 ?auto_387038 ) ( CLEAR ?auto_387035 ) ( ON ?auto_387036 ?auto_387037 ) ( CLEAR ?auto_387036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387034 ?auto_387035 ?auto_387036 )
      ( MAKE-6PILE ?auto_387034 ?auto_387035 ?auto_387036 ?auto_387037 ?auto_387038 ?auto_387039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387047 - BLOCK
      ?auto_387048 - BLOCK
      ?auto_387049 - BLOCK
      ?auto_387050 - BLOCK
      ?auto_387051 - BLOCK
      ?auto_387052 - BLOCK
    )
    :vars
    (
      ?auto_387053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387052 ?auto_387053 ) ( ON-TABLE ?auto_387047 ) ( ON ?auto_387048 ?auto_387047 ) ( not ( = ?auto_387047 ?auto_387048 ) ) ( not ( = ?auto_387047 ?auto_387049 ) ) ( not ( = ?auto_387047 ?auto_387050 ) ) ( not ( = ?auto_387047 ?auto_387051 ) ) ( not ( = ?auto_387047 ?auto_387052 ) ) ( not ( = ?auto_387047 ?auto_387053 ) ) ( not ( = ?auto_387048 ?auto_387049 ) ) ( not ( = ?auto_387048 ?auto_387050 ) ) ( not ( = ?auto_387048 ?auto_387051 ) ) ( not ( = ?auto_387048 ?auto_387052 ) ) ( not ( = ?auto_387048 ?auto_387053 ) ) ( not ( = ?auto_387049 ?auto_387050 ) ) ( not ( = ?auto_387049 ?auto_387051 ) ) ( not ( = ?auto_387049 ?auto_387052 ) ) ( not ( = ?auto_387049 ?auto_387053 ) ) ( not ( = ?auto_387050 ?auto_387051 ) ) ( not ( = ?auto_387050 ?auto_387052 ) ) ( not ( = ?auto_387050 ?auto_387053 ) ) ( not ( = ?auto_387051 ?auto_387052 ) ) ( not ( = ?auto_387051 ?auto_387053 ) ) ( not ( = ?auto_387052 ?auto_387053 ) ) ( ON ?auto_387051 ?auto_387052 ) ( ON ?auto_387050 ?auto_387051 ) ( CLEAR ?auto_387048 ) ( ON ?auto_387049 ?auto_387050 ) ( CLEAR ?auto_387049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387047 ?auto_387048 ?auto_387049 )
      ( MAKE-6PILE ?auto_387047 ?auto_387048 ?auto_387049 ?auto_387050 ?auto_387051 ?auto_387052 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387060 - BLOCK
      ?auto_387061 - BLOCK
      ?auto_387062 - BLOCK
      ?auto_387063 - BLOCK
      ?auto_387064 - BLOCK
      ?auto_387065 - BLOCK
    )
    :vars
    (
      ?auto_387066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387065 ?auto_387066 ) ( ON-TABLE ?auto_387060 ) ( not ( = ?auto_387060 ?auto_387061 ) ) ( not ( = ?auto_387060 ?auto_387062 ) ) ( not ( = ?auto_387060 ?auto_387063 ) ) ( not ( = ?auto_387060 ?auto_387064 ) ) ( not ( = ?auto_387060 ?auto_387065 ) ) ( not ( = ?auto_387060 ?auto_387066 ) ) ( not ( = ?auto_387061 ?auto_387062 ) ) ( not ( = ?auto_387061 ?auto_387063 ) ) ( not ( = ?auto_387061 ?auto_387064 ) ) ( not ( = ?auto_387061 ?auto_387065 ) ) ( not ( = ?auto_387061 ?auto_387066 ) ) ( not ( = ?auto_387062 ?auto_387063 ) ) ( not ( = ?auto_387062 ?auto_387064 ) ) ( not ( = ?auto_387062 ?auto_387065 ) ) ( not ( = ?auto_387062 ?auto_387066 ) ) ( not ( = ?auto_387063 ?auto_387064 ) ) ( not ( = ?auto_387063 ?auto_387065 ) ) ( not ( = ?auto_387063 ?auto_387066 ) ) ( not ( = ?auto_387064 ?auto_387065 ) ) ( not ( = ?auto_387064 ?auto_387066 ) ) ( not ( = ?auto_387065 ?auto_387066 ) ) ( ON ?auto_387064 ?auto_387065 ) ( ON ?auto_387063 ?auto_387064 ) ( ON ?auto_387062 ?auto_387063 ) ( CLEAR ?auto_387060 ) ( ON ?auto_387061 ?auto_387062 ) ( CLEAR ?auto_387061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387060 ?auto_387061 )
      ( MAKE-6PILE ?auto_387060 ?auto_387061 ?auto_387062 ?auto_387063 ?auto_387064 ?auto_387065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387073 - BLOCK
      ?auto_387074 - BLOCK
      ?auto_387075 - BLOCK
      ?auto_387076 - BLOCK
      ?auto_387077 - BLOCK
      ?auto_387078 - BLOCK
    )
    :vars
    (
      ?auto_387079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387078 ?auto_387079 ) ( ON-TABLE ?auto_387073 ) ( not ( = ?auto_387073 ?auto_387074 ) ) ( not ( = ?auto_387073 ?auto_387075 ) ) ( not ( = ?auto_387073 ?auto_387076 ) ) ( not ( = ?auto_387073 ?auto_387077 ) ) ( not ( = ?auto_387073 ?auto_387078 ) ) ( not ( = ?auto_387073 ?auto_387079 ) ) ( not ( = ?auto_387074 ?auto_387075 ) ) ( not ( = ?auto_387074 ?auto_387076 ) ) ( not ( = ?auto_387074 ?auto_387077 ) ) ( not ( = ?auto_387074 ?auto_387078 ) ) ( not ( = ?auto_387074 ?auto_387079 ) ) ( not ( = ?auto_387075 ?auto_387076 ) ) ( not ( = ?auto_387075 ?auto_387077 ) ) ( not ( = ?auto_387075 ?auto_387078 ) ) ( not ( = ?auto_387075 ?auto_387079 ) ) ( not ( = ?auto_387076 ?auto_387077 ) ) ( not ( = ?auto_387076 ?auto_387078 ) ) ( not ( = ?auto_387076 ?auto_387079 ) ) ( not ( = ?auto_387077 ?auto_387078 ) ) ( not ( = ?auto_387077 ?auto_387079 ) ) ( not ( = ?auto_387078 ?auto_387079 ) ) ( ON ?auto_387077 ?auto_387078 ) ( ON ?auto_387076 ?auto_387077 ) ( ON ?auto_387075 ?auto_387076 ) ( CLEAR ?auto_387073 ) ( ON ?auto_387074 ?auto_387075 ) ( CLEAR ?auto_387074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387073 ?auto_387074 )
      ( MAKE-6PILE ?auto_387073 ?auto_387074 ?auto_387075 ?auto_387076 ?auto_387077 ?auto_387078 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387086 - BLOCK
      ?auto_387087 - BLOCK
      ?auto_387088 - BLOCK
      ?auto_387089 - BLOCK
      ?auto_387090 - BLOCK
      ?auto_387091 - BLOCK
    )
    :vars
    (
      ?auto_387092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387091 ?auto_387092 ) ( not ( = ?auto_387086 ?auto_387087 ) ) ( not ( = ?auto_387086 ?auto_387088 ) ) ( not ( = ?auto_387086 ?auto_387089 ) ) ( not ( = ?auto_387086 ?auto_387090 ) ) ( not ( = ?auto_387086 ?auto_387091 ) ) ( not ( = ?auto_387086 ?auto_387092 ) ) ( not ( = ?auto_387087 ?auto_387088 ) ) ( not ( = ?auto_387087 ?auto_387089 ) ) ( not ( = ?auto_387087 ?auto_387090 ) ) ( not ( = ?auto_387087 ?auto_387091 ) ) ( not ( = ?auto_387087 ?auto_387092 ) ) ( not ( = ?auto_387088 ?auto_387089 ) ) ( not ( = ?auto_387088 ?auto_387090 ) ) ( not ( = ?auto_387088 ?auto_387091 ) ) ( not ( = ?auto_387088 ?auto_387092 ) ) ( not ( = ?auto_387089 ?auto_387090 ) ) ( not ( = ?auto_387089 ?auto_387091 ) ) ( not ( = ?auto_387089 ?auto_387092 ) ) ( not ( = ?auto_387090 ?auto_387091 ) ) ( not ( = ?auto_387090 ?auto_387092 ) ) ( not ( = ?auto_387091 ?auto_387092 ) ) ( ON ?auto_387090 ?auto_387091 ) ( ON ?auto_387089 ?auto_387090 ) ( ON ?auto_387088 ?auto_387089 ) ( ON ?auto_387087 ?auto_387088 ) ( ON ?auto_387086 ?auto_387087 ) ( CLEAR ?auto_387086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387086 )
      ( MAKE-6PILE ?auto_387086 ?auto_387087 ?auto_387088 ?auto_387089 ?auto_387090 ?auto_387091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_387099 - BLOCK
      ?auto_387100 - BLOCK
      ?auto_387101 - BLOCK
      ?auto_387102 - BLOCK
      ?auto_387103 - BLOCK
      ?auto_387104 - BLOCK
    )
    :vars
    (
      ?auto_387105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387104 ?auto_387105 ) ( not ( = ?auto_387099 ?auto_387100 ) ) ( not ( = ?auto_387099 ?auto_387101 ) ) ( not ( = ?auto_387099 ?auto_387102 ) ) ( not ( = ?auto_387099 ?auto_387103 ) ) ( not ( = ?auto_387099 ?auto_387104 ) ) ( not ( = ?auto_387099 ?auto_387105 ) ) ( not ( = ?auto_387100 ?auto_387101 ) ) ( not ( = ?auto_387100 ?auto_387102 ) ) ( not ( = ?auto_387100 ?auto_387103 ) ) ( not ( = ?auto_387100 ?auto_387104 ) ) ( not ( = ?auto_387100 ?auto_387105 ) ) ( not ( = ?auto_387101 ?auto_387102 ) ) ( not ( = ?auto_387101 ?auto_387103 ) ) ( not ( = ?auto_387101 ?auto_387104 ) ) ( not ( = ?auto_387101 ?auto_387105 ) ) ( not ( = ?auto_387102 ?auto_387103 ) ) ( not ( = ?auto_387102 ?auto_387104 ) ) ( not ( = ?auto_387102 ?auto_387105 ) ) ( not ( = ?auto_387103 ?auto_387104 ) ) ( not ( = ?auto_387103 ?auto_387105 ) ) ( not ( = ?auto_387104 ?auto_387105 ) ) ( ON ?auto_387103 ?auto_387104 ) ( ON ?auto_387102 ?auto_387103 ) ( ON ?auto_387101 ?auto_387102 ) ( ON ?auto_387100 ?auto_387101 ) ( ON ?auto_387099 ?auto_387100 ) ( CLEAR ?auto_387099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387099 )
      ( MAKE-6PILE ?auto_387099 ?auto_387100 ?auto_387101 ?auto_387102 ?auto_387103 ?auto_387104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387113 - BLOCK
      ?auto_387114 - BLOCK
      ?auto_387115 - BLOCK
      ?auto_387116 - BLOCK
      ?auto_387117 - BLOCK
      ?auto_387118 - BLOCK
      ?auto_387119 - BLOCK
    )
    :vars
    (
      ?auto_387120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387118 ) ( ON ?auto_387119 ?auto_387120 ) ( CLEAR ?auto_387119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387113 ) ( ON ?auto_387114 ?auto_387113 ) ( ON ?auto_387115 ?auto_387114 ) ( ON ?auto_387116 ?auto_387115 ) ( ON ?auto_387117 ?auto_387116 ) ( ON ?auto_387118 ?auto_387117 ) ( not ( = ?auto_387113 ?auto_387114 ) ) ( not ( = ?auto_387113 ?auto_387115 ) ) ( not ( = ?auto_387113 ?auto_387116 ) ) ( not ( = ?auto_387113 ?auto_387117 ) ) ( not ( = ?auto_387113 ?auto_387118 ) ) ( not ( = ?auto_387113 ?auto_387119 ) ) ( not ( = ?auto_387113 ?auto_387120 ) ) ( not ( = ?auto_387114 ?auto_387115 ) ) ( not ( = ?auto_387114 ?auto_387116 ) ) ( not ( = ?auto_387114 ?auto_387117 ) ) ( not ( = ?auto_387114 ?auto_387118 ) ) ( not ( = ?auto_387114 ?auto_387119 ) ) ( not ( = ?auto_387114 ?auto_387120 ) ) ( not ( = ?auto_387115 ?auto_387116 ) ) ( not ( = ?auto_387115 ?auto_387117 ) ) ( not ( = ?auto_387115 ?auto_387118 ) ) ( not ( = ?auto_387115 ?auto_387119 ) ) ( not ( = ?auto_387115 ?auto_387120 ) ) ( not ( = ?auto_387116 ?auto_387117 ) ) ( not ( = ?auto_387116 ?auto_387118 ) ) ( not ( = ?auto_387116 ?auto_387119 ) ) ( not ( = ?auto_387116 ?auto_387120 ) ) ( not ( = ?auto_387117 ?auto_387118 ) ) ( not ( = ?auto_387117 ?auto_387119 ) ) ( not ( = ?auto_387117 ?auto_387120 ) ) ( not ( = ?auto_387118 ?auto_387119 ) ) ( not ( = ?auto_387118 ?auto_387120 ) ) ( not ( = ?auto_387119 ?auto_387120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387119 ?auto_387120 )
      ( !STACK ?auto_387119 ?auto_387118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387128 - BLOCK
      ?auto_387129 - BLOCK
      ?auto_387130 - BLOCK
      ?auto_387131 - BLOCK
      ?auto_387132 - BLOCK
      ?auto_387133 - BLOCK
      ?auto_387134 - BLOCK
    )
    :vars
    (
      ?auto_387135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387133 ) ( ON ?auto_387134 ?auto_387135 ) ( CLEAR ?auto_387134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387128 ) ( ON ?auto_387129 ?auto_387128 ) ( ON ?auto_387130 ?auto_387129 ) ( ON ?auto_387131 ?auto_387130 ) ( ON ?auto_387132 ?auto_387131 ) ( ON ?auto_387133 ?auto_387132 ) ( not ( = ?auto_387128 ?auto_387129 ) ) ( not ( = ?auto_387128 ?auto_387130 ) ) ( not ( = ?auto_387128 ?auto_387131 ) ) ( not ( = ?auto_387128 ?auto_387132 ) ) ( not ( = ?auto_387128 ?auto_387133 ) ) ( not ( = ?auto_387128 ?auto_387134 ) ) ( not ( = ?auto_387128 ?auto_387135 ) ) ( not ( = ?auto_387129 ?auto_387130 ) ) ( not ( = ?auto_387129 ?auto_387131 ) ) ( not ( = ?auto_387129 ?auto_387132 ) ) ( not ( = ?auto_387129 ?auto_387133 ) ) ( not ( = ?auto_387129 ?auto_387134 ) ) ( not ( = ?auto_387129 ?auto_387135 ) ) ( not ( = ?auto_387130 ?auto_387131 ) ) ( not ( = ?auto_387130 ?auto_387132 ) ) ( not ( = ?auto_387130 ?auto_387133 ) ) ( not ( = ?auto_387130 ?auto_387134 ) ) ( not ( = ?auto_387130 ?auto_387135 ) ) ( not ( = ?auto_387131 ?auto_387132 ) ) ( not ( = ?auto_387131 ?auto_387133 ) ) ( not ( = ?auto_387131 ?auto_387134 ) ) ( not ( = ?auto_387131 ?auto_387135 ) ) ( not ( = ?auto_387132 ?auto_387133 ) ) ( not ( = ?auto_387132 ?auto_387134 ) ) ( not ( = ?auto_387132 ?auto_387135 ) ) ( not ( = ?auto_387133 ?auto_387134 ) ) ( not ( = ?auto_387133 ?auto_387135 ) ) ( not ( = ?auto_387134 ?auto_387135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387134 ?auto_387135 )
      ( !STACK ?auto_387134 ?auto_387133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387143 - BLOCK
      ?auto_387144 - BLOCK
      ?auto_387145 - BLOCK
      ?auto_387146 - BLOCK
      ?auto_387147 - BLOCK
      ?auto_387148 - BLOCK
      ?auto_387149 - BLOCK
    )
    :vars
    (
      ?auto_387150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387149 ?auto_387150 ) ( ON-TABLE ?auto_387143 ) ( ON ?auto_387144 ?auto_387143 ) ( ON ?auto_387145 ?auto_387144 ) ( ON ?auto_387146 ?auto_387145 ) ( ON ?auto_387147 ?auto_387146 ) ( not ( = ?auto_387143 ?auto_387144 ) ) ( not ( = ?auto_387143 ?auto_387145 ) ) ( not ( = ?auto_387143 ?auto_387146 ) ) ( not ( = ?auto_387143 ?auto_387147 ) ) ( not ( = ?auto_387143 ?auto_387148 ) ) ( not ( = ?auto_387143 ?auto_387149 ) ) ( not ( = ?auto_387143 ?auto_387150 ) ) ( not ( = ?auto_387144 ?auto_387145 ) ) ( not ( = ?auto_387144 ?auto_387146 ) ) ( not ( = ?auto_387144 ?auto_387147 ) ) ( not ( = ?auto_387144 ?auto_387148 ) ) ( not ( = ?auto_387144 ?auto_387149 ) ) ( not ( = ?auto_387144 ?auto_387150 ) ) ( not ( = ?auto_387145 ?auto_387146 ) ) ( not ( = ?auto_387145 ?auto_387147 ) ) ( not ( = ?auto_387145 ?auto_387148 ) ) ( not ( = ?auto_387145 ?auto_387149 ) ) ( not ( = ?auto_387145 ?auto_387150 ) ) ( not ( = ?auto_387146 ?auto_387147 ) ) ( not ( = ?auto_387146 ?auto_387148 ) ) ( not ( = ?auto_387146 ?auto_387149 ) ) ( not ( = ?auto_387146 ?auto_387150 ) ) ( not ( = ?auto_387147 ?auto_387148 ) ) ( not ( = ?auto_387147 ?auto_387149 ) ) ( not ( = ?auto_387147 ?auto_387150 ) ) ( not ( = ?auto_387148 ?auto_387149 ) ) ( not ( = ?auto_387148 ?auto_387150 ) ) ( not ( = ?auto_387149 ?auto_387150 ) ) ( CLEAR ?auto_387147 ) ( ON ?auto_387148 ?auto_387149 ) ( CLEAR ?auto_387148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387143 ?auto_387144 ?auto_387145 ?auto_387146 ?auto_387147 ?auto_387148 )
      ( MAKE-7PILE ?auto_387143 ?auto_387144 ?auto_387145 ?auto_387146 ?auto_387147 ?auto_387148 ?auto_387149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387158 - BLOCK
      ?auto_387159 - BLOCK
      ?auto_387160 - BLOCK
      ?auto_387161 - BLOCK
      ?auto_387162 - BLOCK
      ?auto_387163 - BLOCK
      ?auto_387164 - BLOCK
    )
    :vars
    (
      ?auto_387165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387164 ?auto_387165 ) ( ON-TABLE ?auto_387158 ) ( ON ?auto_387159 ?auto_387158 ) ( ON ?auto_387160 ?auto_387159 ) ( ON ?auto_387161 ?auto_387160 ) ( ON ?auto_387162 ?auto_387161 ) ( not ( = ?auto_387158 ?auto_387159 ) ) ( not ( = ?auto_387158 ?auto_387160 ) ) ( not ( = ?auto_387158 ?auto_387161 ) ) ( not ( = ?auto_387158 ?auto_387162 ) ) ( not ( = ?auto_387158 ?auto_387163 ) ) ( not ( = ?auto_387158 ?auto_387164 ) ) ( not ( = ?auto_387158 ?auto_387165 ) ) ( not ( = ?auto_387159 ?auto_387160 ) ) ( not ( = ?auto_387159 ?auto_387161 ) ) ( not ( = ?auto_387159 ?auto_387162 ) ) ( not ( = ?auto_387159 ?auto_387163 ) ) ( not ( = ?auto_387159 ?auto_387164 ) ) ( not ( = ?auto_387159 ?auto_387165 ) ) ( not ( = ?auto_387160 ?auto_387161 ) ) ( not ( = ?auto_387160 ?auto_387162 ) ) ( not ( = ?auto_387160 ?auto_387163 ) ) ( not ( = ?auto_387160 ?auto_387164 ) ) ( not ( = ?auto_387160 ?auto_387165 ) ) ( not ( = ?auto_387161 ?auto_387162 ) ) ( not ( = ?auto_387161 ?auto_387163 ) ) ( not ( = ?auto_387161 ?auto_387164 ) ) ( not ( = ?auto_387161 ?auto_387165 ) ) ( not ( = ?auto_387162 ?auto_387163 ) ) ( not ( = ?auto_387162 ?auto_387164 ) ) ( not ( = ?auto_387162 ?auto_387165 ) ) ( not ( = ?auto_387163 ?auto_387164 ) ) ( not ( = ?auto_387163 ?auto_387165 ) ) ( not ( = ?auto_387164 ?auto_387165 ) ) ( CLEAR ?auto_387162 ) ( ON ?auto_387163 ?auto_387164 ) ( CLEAR ?auto_387163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387158 ?auto_387159 ?auto_387160 ?auto_387161 ?auto_387162 ?auto_387163 )
      ( MAKE-7PILE ?auto_387158 ?auto_387159 ?auto_387160 ?auto_387161 ?auto_387162 ?auto_387163 ?auto_387164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387173 - BLOCK
      ?auto_387174 - BLOCK
      ?auto_387175 - BLOCK
      ?auto_387176 - BLOCK
      ?auto_387177 - BLOCK
      ?auto_387178 - BLOCK
      ?auto_387179 - BLOCK
    )
    :vars
    (
      ?auto_387180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387179 ?auto_387180 ) ( ON-TABLE ?auto_387173 ) ( ON ?auto_387174 ?auto_387173 ) ( ON ?auto_387175 ?auto_387174 ) ( ON ?auto_387176 ?auto_387175 ) ( not ( = ?auto_387173 ?auto_387174 ) ) ( not ( = ?auto_387173 ?auto_387175 ) ) ( not ( = ?auto_387173 ?auto_387176 ) ) ( not ( = ?auto_387173 ?auto_387177 ) ) ( not ( = ?auto_387173 ?auto_387178 ) ) ( not ( = ?auto_387173 ?auto_387179 ) ) ( not ( = ?auto_387173 ?auto_387180 ) ) ( not ( = ?auto_387174 ?auto_387175 ) ) ( not ( = ?auto_387174 ?auto_387176 ) ) ( not ( = ?auto_387174 ?auto_387177 ) ) ( not ( = ?auto_387174 ?auto_387178 ) ) ( not ( = ?auto_387174 ?auto_387179 ) ) ( not ( = ?auto_387174 ?auto_387180 ) ) ( not ( = ?auto_387175 ?auto_387176 ) ) ( not ( = ?auto_387175 ?auto_387177 ) ) ( not ( = ?auto_387175 ?auto_387178 ) ) ( not ( = ?auto_387175 ?auto_387179 ) ) ( not ( = ?auto_387175 ?auto_387180 ) ) ( not ( = ?auto_387176 ?auto_387177 ) ) ( not ( = ?auto_387176 ?auto_387178 ) ) ( not ( = ?auto_387176 ?auto_387179 ) ) ( not ( = ?auto_387176 ?auto_387180 ) ) ( not ( = ?auto_387177 ?auto_387178 ) ) ( not ( = ?auto_387177 ?auto_387179 ) ) ( not ( = ?auto_387177 ?auto_387180 ) ) ( not ( = ?auto_387178 ?auto_387179 ) ) ( not ( = ?auto_387178 ?auto_387180 ) ) ( not ( = ?auto_387179 ?auto_387180 ) ) ( ON ?auto_387178 ?auto_387179 ) ( CLEAR ?auto_387176 ) ( ON ?auto_387177 ?auto_387178 ) ( CLEAR ?auto_387177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387173 ?auto_387174 ?auto_387175 ?auto_387176 ?auto_387177 )
      ( MAKE-7PILE ?auto_387173 ?auto_387174 ?auto_387175 ?auto_387176 ?auto_387177 ?auto_387178 ?auto_387179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387188 - BLOCK
      ?auto_387189 - BLOCK
      ?auto_387190 - BLOCK
      ?auto_387191 - BLOCK
      ?auto_387192 - BLOCK
      ?auto_387193 - BLOCK
      ?auto_387194 - BLOCK
    )
    :vars
    (
      ?auto_387195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387194 ?auto_387195 ) ( ON-TABLE ?auto_387188 ) ( ON ?auto_387189 ?auto_387188 ) ( ON ?auto_387190 ?auto_387189 ) ( ON ?auto_387191 ?auto_387190 ) ( not ( = ?auto_387188 ?auto_387189 ) ) ( not ( = ?auto_387188 ?auto_387190 ) ) ( not ( = ?auto_387188 ?auto_387191 ) ) ( not ( = ?auto_387188 ?auto_387192 ) ) ( not ( = ?auto_387188 ?auto_387193 ) ) ( not ( = ?auto_387188 ?auto_387194 ) ) ( not ( = ?auto_387188 ?auto_387195 ) ) ( not ( = ?auto_387189 ?auto_387190 ) ) ( not ( = ?auto_387189 ?auto_387191 ) ) ( not ( = ?auto_387189 ?auto_387192 ) ) ( not ( = ?auto_387189 ?auto_387193 ) ) ( not ( = ?auto_387189 ?auto_387194 ) ) ( not ( = ?auto_387189 ?auto_387195 ) ) ( not ( = ?auto_387190 ?auto_387191 ) ) ( not ( = ?auto_387190 ?auto_387192 ) ) ( not ( = ?auto_387190 ?auto_387193 ) ) ( not ( = ?auto_387190 ?auto_387194 ) ) ( not ( = ?auto_387190 ?auto_387195 ) ) ( not ( = ?auto_387191 ?auto_387192 ) ) ( not ( = ?auto_387191 ?auto_387193 ) ) ( not ( = ?auto_387191 ?auto_387194 ) ) ( not ( = ?auto_387191 ?auto_387195 ) ) ( not ( = ?auto_387192 ?auto_387193 ) ) ( not ( = ?auto_387192 ?auto_387194 ) ) ( not ( = ?auto_387192 ?auto_387195 ) ) ( not ( = ?auto_387193 ?auto_387194 ) ) ( not ( = ?auto_387193 ?auto_387195 ) ) ( not ( = ?auto_387194 ?auto_387195 ) ) ( ON ?auto_387193 ?auto_387194 ) ( CLEAR ?auto_387191 ) ( ON ?auto_387192 ?auto_387193 ) ( CLEAR ?auto_387192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387188 ?auto_387189 ?auto_387190 ?auto_387191 ?auto_387192 )
      ( MAKE-7PILE ?auto_387188 ?auto_387189 ?auto_387190 ?auto_387191 ?auto_387192 ?auto_387193 ?auto_387194 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387203 - BLOCK
      ?auto_387204 - BLOCK
      ?auto_387205 - BLOCK
      ?auto_387206 - BLOCK
      ?auto_387207 - BLOCK
      ?auto_387208 - BLOCK
      ?auto_387209 - BLOCK
    )
    :vars
    (
      ?auto_387210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387209 ?auto_387210 ) ( ON-TABLE ?auto_387203 ) ( ON ?auto_387204 ?auto_387203 ) ( ON ?auto_387205 ?auto_387204 ) ( not ( = ?auto_387203 ?auto_387204 ) ) ( not ( = ?auto_387203 ?auto_387205 ) ) ( not ( = ?auto_387203 ?auto_387206 ) ) ( not ( = ?auto_387203 ?auto_387207 ) ) ( not ( = ?auto_387203 ?auto_387208 ) ) ( not ( = ?auto_387203 ?auto_387209 ) ) ( not ( = ?auto_387203 ?auto_387210 ) ) ( not ( = ?auto_387204 ?auto_387205 ) ) ( not ( = ?auto_387204 ?auto_387206 ) ) ( not ( = ?auto_387204 ?auto_387207 ) ) ( not ( = ?auto_387204 ?auto_387208 ) ) ( not ( = ?auto_387204 ?auto_387209 ) ) ( not ( = ?auto_387204 ?auto_387210 ) ) ( not ( = ?auto_387205 ?auto_387206 ) ) ( not ( = ?auto_387205 ?auto_387207 ) ) ( not ( = ?auto_387205 ?auto_387208 ) ) ( not ( = ?auto_387205 ?auto_387209 ) ) ( not ( = ?auto_387205 ?auto_387210 ) ) ( not ( = ?auto_387206 ?auto_387207 ) ) ( not ( = ?auto_387206 ?auto_387208 ) ) ( not ( = ?auto_387206 ?auto_387209 ) ) ( not ( = ?auto_387206 ?auto_387210 ) ) ( not ( = ?auto_387207 ?auto_387208 ) ) ( not ( = ?auto_387207 ?auto_387209 ) ) ( not ( = ?auto_387207 ?auto_387210 ) ) ( not ( = ?auto_387208 ?auto_387209 ) ) ( not ( = ?auto_387208 ?auto_387210 ) ) ( not ( = ?auto_387209 ?auto_387210 ) ) ( ON ?auto_387208 ?auto_387209 ) ( ON ?auto_387207 ?auto_387208 ) ( CLEAR ?auto_387205 ) ( ON ?auto_387206 ?auto_387207 ) ( CLEAR ?auto_387206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387203 ?auto_387204 ?auto_387205 ?auto_387206 )
      ( MAKE-7PILE ?auto_387203 ?auto_387204 ?auto_387205 ?auto_387206 ?auto_387207 ?auto_387208 ?auto_387209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387218 - BLOCK
      ?auto_387219 - BLOCK
      ?auto_387220 - BLOCK
      ?auto_387221 - BLOCK
      ?auto_387222 - BLOCK
      ?auto_387223 - BLOCK
      ?auto_387224 - BLOCK
    )
    :vars
    (
      ?auto_387225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387224 ?auto_387225 ) ( ON-TABLE ?auto_387218 ) ( ON ?auto_387219 ?auto_387218 ) ( ON ?auto_387220 ?auto_387219 ) ( not ( = ?auto_387218 ?auto_387219 ) ) ( not ( = ?auto_387218 ?auto_387220 ) ) ( not ( = ?auto_387218 ?auto_387221 ) ) ( not ( = ?auto_387218 ?auto_387222 ) ) ( not ( = ?auto_387218 ?auto_387223 ) ) ( not ( = ?auto_387218 ?auto_387224 ) ) ( not ( = ?auto_387218 ?auto_387225 ) ) ( not ( = ?auto_387219 ?auto_387220 ) ) ( not ( = ?auto_387219 ?auto_387221 ) ) ( not ( = ?auto_387219 ?auto_387222 ) ) ( not ( = ?auto_387219 ?auto_387223 ) ) ( not ( = ?auto_387219 ?auto_387224 ) ) ( not ( = ?auto_387219 ?auto_387225 ) ) ( not ( = ?auto_387220 ?auto_387221 ) ) ( not ( = ?auto_387220 ?auto_387222 ) ) ( not ( = ?auto_387220 ?auto_387223 ) ) ( not ( = ?auto_387220 ?auto_387224 ) ) ( not ( = ?auto_387220 ?auto_387225 ) ) ( not ( = ?auto_387221 ?auto_387222 ) ) ( not ( = ?auto_387221 ?auto_387223 ) ) ( not ( = ?auto_387221 ?auto_387224 ) ) ( not ( = ?auto_387221 ?auto_387225 ) ) ( not ( = ?auto_387222 ?auto_387223 ) ) ( not ( = ?auto_387222 ?auto_387224 ) ) ( not ( = ?auto_387222 ?auto_387225 ) ) ( not ( = ?auto_387223 ?auto_387224 ) ) ( not ( = ?auto_387223 ?auto_387225 ) ) ( not ( = ?auto_387224 ?auto_387225 ) ) ( ON ?auto_387223 ?auto_387224 ) ( ON ?auto_387222 ?auto_387223 ) ( CLEAR ?auto_387220 ) ( ON ?auto_387221 ?auto_387222 ) ( CLEAR ?auto_387221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387218 ?auto_387219 ?auto_387220 ?auto_387221 )
      ( MAKE-7PILE ?auto_387218 ?auto_387219 ?auto_387220 ?auto_387221 ?auto_387222 ?auto_387223 ?auto_387224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387233 - BLOCK
      ?auto_387234 - BLOCK
      ?auto_387235 - BLOCK
      ?auto_387236 - BLOCK
      ?auto_387237 - BLOCK
      ?auto_387238 - BLOCK
      ?auto_387239 - BLOCK
    )
    :vars
    (
      ?auto_387240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387239 ?auto_387240 ) ( ON-TABLE ?auto_387233 ) ( ON ?auto_387234 ?auto_387233 ) ( not ( = ?auto_387233 ?auto_387234 ) ) ( not ( = ?auto_387233 ?auto_387235 ) ) ( not ( = ?auto_387233 ?auto_387236 ) ) ( not ( = ?auto_387233 ?auto_387237 ) ) ( not ( = ?auto_387233 ?auto_387238 ) ) ( not ( = ?auto_387233 ?auto_387239 ) ) ( not ( = ?auto_387233 ?auto_387240 ) ) ( not ( = ?auto_387234 ?auto_387235 ) ) ( not ( = ?auto_387234 ?auto_387236 ) ) ( not ( = ?auto_387234 ?auto_387237 ) ) ( not ( = ?auto_387234 ?auto_387238 ) ) ( not ( = ?auto_387234 ?auto_387239 ) ) ( not ( = ?auto_387234 ?auto_387240 ) ) ( not ( = ?auto_387235 ?auto_387236 ) ) ( not ( = ?auto_387235 ?auto_387237 ) ) ( not ( = ?auto_387235 ?auto_387238 ) ) ( not ( = ?auto_387235 ?auto_387239 ) ) ( not ( = ?auto_387235 ?auto_387240 ) ) ( not ( = ?auto_387236 ?auto_387237 ) ) ( not ( = ?auto_387236 ?auto_387238 ) ) ( not ( = ?auto_387236 ?auto_387239 ) ) ( not ( = ?auto_387236 ?auto_387240 ) ) ( not ( = ?auto_387237 ?auto_387238 ) ) ( not ( = ?auto_387237 ?auto_387239 ) ) ( not ( = ?auto_387237 ?auto_387240 ) ) ( not ( = ?auto_387238 ?auto_387239 ) ) ( not ( = ?auto_387238 ?auto_387240 ) ) ( not ( = ?auto_387239 ?auto_387240 ) ) ( ON ?auto_387238 ?auto_387239 ) ( ON ?auto_387237 ?auto_387238 ) ( ON ?auto_387236 ?auto_387237 ) ( CLEAR ?auto_387234 ) ( ON ?auto_387235 ?auto_387236 ) ( CLEAR ?auto_387235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387233 ?auto_387234 ?auto_387235 )
      ( MAKE-7PILE ?auto_387233 ?auto_387234 ?auto_387235 ?auto_387236 ?auto_387237 ?auto_387238 ?auto_387239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387248 - BLOCK
      ?auto_387249 - BLOCK
      ?auto_387250 - BLOCK
      ?auto_387251 - BLOCK
      ?auto_387252 - BLOCK
      ?auto_387253 - BLOCK
      ?auto_387254 - BLOCK
    )
    :vars
    (
      ?auto_387255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387254 ?auto_387255 ) ( ON-TABLE ?auto_387248 ) ( ON ?auto_387249 ?auto_387248 ) ( not ( = ?auto_387248 ?auto_387249 ) ) ( not ( = ?auto_387248 ?auto_387250 ) ) ( not ( = ?auto_387248 ?auto_387251 ) ) ( not ( = ?auto_387248 ?auto_387252 ) ) ( not ( = ?auto_387248 ?auto_387253 ) ) ( not ( = ?auto_387248 ?auto_387254 ) ) ( not ( = ?auto_387248 ?auto_387255 ) ) ( not ( = ?auto_387249 ?auto_387250 ) ) ( not ( = ?auto_387249 ?auto_387251 ) ) ( not ( = ?auto_387249 ?auto_387252 ) ) ( not ( = ?auto_387249 ?auto_387253 ) ) ( not ( = ?auto_387249 ?auto_387254 ) ) ( not ( = ?auto_387249 ?auto_387255 ) ) ( not ( = ?auto_387250 ?auto_387251 ) ) ( not ( = ?auto_387250 ?auto_387252 ) ) ( not ( = ?auto_387250 ?auto_387253 ) ) ( not ( = ?auto_387250 ?auto_387254 ) ) ( not ( = ?auto_387250 ?auto_387255 ) ) ( not ( = ?auto_387251 ?auto_387252 ) ) ( not ( = ?auto_387251 ?auto_387253 ) ) ( not ( = ?auto_387251 ?auto_387254 ) ) ( not ( = ?auto_387251 ?auto_387255 ) ) ( not ( = ?auto_387252 ?auto_387253 ) ) ( not ( = ?auto_387252 ?auto_387254 ) ) ( not ( = ?auto_387252 ?auto_387255 ) ) ( not ( = ?auto_387253 ?auto_387254 ) ) ( not ( = ?auto_387253 ?auto_387255 ) ) ( not ( = ?auto_387254 ?auto_387255 ) ) ( ON ?auto_387253 ?auto_387254 ) ( ON ?auto_387252 ?auto_387253 ) ( ON ?auto_387251 ?auto_387252 ) ( CLEAR ?auto_387249 ) ( ON ?auto_387250 ?auto_387251 ) ( CLEAR ?auto_387250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387248 ?auto_387249 ?auto_387250 )
      ( MAKE-7PILE ?auto_387248 ?auto_387249 ?auto_387250 ?auto_387251 ?auto_387252 ?auto_387253 ?auto_387254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387263 - BLOCK
      ?auto_387264 - BLOCK
      ?auto_387265 - BLOCK
      ?auto_387266 - BLOCK
      ?auto_387267 - BLOCK
      ?auto_387268 - BLOCK
      ?auto_387269 - BLOCK
    )
    :vars
    (
      ?auto_387270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387269 ?auto_387270 ) ( ON-TABLE ?auto_387263 ) ( not ( = ?auto_387263 ?auto_387264 ) ) ( not ( = ?auto_387263 ?auto_387265 ) ) ( not ( = ?auto_387263 ?auto_387266 ) ) ( not ( = ?auto_387263 ?auto_387267 ) ) ( not ( = ?auto_387263 ?auto_387268 ) ) ( not ( = ?auto_387263 ?auto_387269 ) ) ( not ( = ?auto_387263 ?auto_387270 ) ) ( not ( = ?auto_387264 ?auto_387265 ) ) ( not ( = ?auto_387264 ?auto_387266 ) ) ( not ( = ?auto_387264 ?auto_387267 ) ) ( not ( = ?auto_387264 ?auto_387268 ) ) ( not ( = ?auto_387264 ?auto_387269 ) ) ( not ( = ?auto_387264 ?auto_387270 ) ) ( not ( = ?auto_387265 ?auto_387266 ) ) ( not ( = ?auto_387265 ?auto_387267 ) ) ( not ( = ?auto_387265 ?auto_387268 ) ) ( not ( = ?auto_387265 ?auto_387269 ) ) ( not ( = ?auto_387265 ?auto_387270 ) ) ( not ( = ?auto_387266 ?auto_387267 ) ) ( not ( = ?auto_387266 ?auto_387268 ) ) ( not ( = ?auto_387266 ?auto_387269 ) ) ( not ( = ?auto_387266 ?auto_387270 ) ) ( not ( = ?auto_387267 ?auto_387268 ) ) ( not ( = ?auto_387267 ?auto_387269 ) ) ( not ( = ?auto_387267 ?auto_387270 ) ) ( not ( = ?auto_387268 ?auto_387269 ) ) ( not ( = ?auto_387268 ?auto_387270 ) ) ( not ( = ?auto_387269 ?auto_387270 ) ) ( ON ?auto_387268 ?auto_387269 ) ( ON ?auto_387267 ?auto_387268 ) ( ON ?auto_387266 ?auto_387267 ) ( ON ?auto_387265 ?auto_387266 ) ( CLEAR ?auto_387263 ) ( ON ?auto_387264 ?auto_387265 ) ( CLEAR ?auto_387264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387263 ?auto_387264 )
      ( MAKE-7PILE ?auto_387263 ?auto_387264 ?auto_387265 ?auto_387266 ?auto_387267 ?auto_387268 ?auto_387269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387278 - BLOCK
      ?auto_387279 - BLOCK
      ?auto_387280 - BLOCK
      ?auto_387281 - BLOCK
      ?auto_387282 - BLOCK
      ?auto_387283 - BLOCK
      ?auto_387284 - BLOCK
    )
    :vars
    (
      ?auto_387285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387284 ?auto_387285 ) ( ON-TABLE ?auto_387278 ) ( not ( = ?auto_387278 ?auto_387279 ) ) ( not ( = ?auto_387278 ?auto_387280 ) ) ( not ( = ?auto_387278 ?auto_387281 ) ) ( not ( = ?auto_387278 ?auto_387282 ) ) ( not ( = ?auto_387278 ?auto_387283 ) ) ( not ( = ?auto_387278 ?auto_387284 ) ) ( not ( = ?auto_387278 ?auto_387285 ) ) ( not ( = ?auto_387279 ?auto_387280 ) ) ( not ( = ?auto_387279 ?auto_387281 ) ) ( not ( = ?auto_387279 ?auto_387282 ) ) ( not ( = ?auto_387279 ?auto_387283 ) ) ( not ( = ?auto_387279 ?auto_387284 ) ) ( not ( = ?auto_387279 ?auto_387285 ) ) ( not ( = ?auto_387280 ?auto_387281 ) ) ( not ( = ?auto_387280 ?auto_387282 ) ) ( not ( = ?auto_387280 ?auto_387283 ) ) ( not ( = ?auto_387280 ?auto_387284 ) ) ( not ( = ?auto_387280 ?auto_387285 ) ) ( not ( = ?auto_387281 ?auto_387282 ) ) ( not ( = ?auto_387281 ?auto_387283 ) ) ( not ( = ?auto_387281 ?auto_387284 ) ) ( not ( = ?auto_387281 ?auto_387285 ) ) ( not ( = ?auto_387282 ?auto_387283 ) ) ( not ( = ?auto_387282 ?auto_387284 ) ) ( not ( = ?auto_387282 ?auto_387285 ) ) ( not ( = ?auto_387283 ?auto_387284 ) ) ( not ( = ?auto_387283 ?auto_387285 ) ) ( not ( = ?auto_387284 ?auto_387285 ) ) ( ON ?auto_387283 ?auto_387284 ) ( ON ?auto_387282 ?auto_387283 ) ( ON ?auto_387281 ?auto_387282 ) ( ON ?auto_387280 ?auto_387281 ) ( CLEAR ?auto_387278 ) ( ON ?auto_387279 ?auto_387280 ) ( CLEAR ?auto_387279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387278 ?auto_387279 )
      ( MAKE-7PILE ?auto_387278 ?auto_387279 ?auto_387280 ?auto_387281 ?auto_387282 ?auto_387283 ?auto_387284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387293 - BLOCK
      ?auto_387294 - BLOCK
      ?auto_387295 - BLOCK
      ?auto_387296 - BLOCK
      ?auto_387297 - BLOCK
      ?auto_387298 - BLOCK
      ?auto_387299 - BLOCK
    )
    :vars
    (
      ?auto_387300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387299 ?auto_387300 ) ( not ( = ?auto_387293 ?auto_387294 ) ) ( not ( = ?auto_387293 ?auto_387295 ) ) ( not ( = ?auto_387293 ?auto_387296 ) ) ( not ( = ?auto_387293 ?auto_387297 ) ) ( not ( = ?auto_387293 ?auto_387298 ) ) ( not ( = ?auto_387293 ?auto_387299 ) ) ( not ( = ?auto_387293 ?auto_387300 ) ) ( not ( = ?auto_387294 ?auto_387295 ) ) ( not ( = ?auto_387294 ?auto_387296 ) ) ( not ( = ?auto_387294 ?auto_387297 ) ) ( not ( = ?auto_387294 ?auto_387298 ) ) ( not ( = ?auto_387294 ?auto_387299 ) ) ( not ( = ?auto_387294 ?auto_387300 ) ) ( not ( = ?auto_387295 ?auto_387296 ) ) ( not ( = ?auto_387295 ?auto_387297 ) ) ( not ( = ?auto_387295 ?auto_387298 ) ) ( not ( = ?auto_387295 ?auto_387299 ) ) ( not ( = ?auto_387295 ?auto_387300 ) ) ( not ( = ?auto_387296 ?auto_387297 ) ) ( not ( = ?auto_387296 ?auto_387298 ) ) ( not ( = ?auto_387296 ?auto_387299 ) ) ( not ( = ?auto_387296 ?auto_387300 ) ) ( not ( = ?auto_387297 ?auto_387298 ) ) ( not ( = ?auto_387297 ?auto_387299 ) ) ( not ( = ?auto_387297 ?auto_387300 ) ) ( not ( = ?auto_387298 ?auto_387299 ) ) ( not ( = ?auto_387298 ?auto_387300 ) ) ( not ( = ?auto_387299 ?auto_387300 ) ) ( ON ?auto_387298 ?auto_387299 ) ( ON ?auto_387297 ?auto_387298 ) ( ON ?auto_387296 ?auto_387297 ) ( ON ?auto_387295 ?auto_387296 ) ( ON ?auto_387294 ?auto_387295 ) ( ON ?auto_387293 ?auto_387294 ) ( CLEAR ?auto_387293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387293 )
      ( MAKE-7PILE ?auto_387293 ?auto_387294 ?auto_387295 ?auto_387296 ?auto_387297 ?auto_387298 ?auto_387299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_387308 - BLOCK
      ?auto_387309 - BLOCK
      ?auto_387310 - BLOCK
      ?auto_387311 - BLOCK
      ?auto_387312 - BLOCK
      ?auto_387313 - BLOCK
      ?auto_387314 - BLOCK
    )
    :vars
    (
      ?auto_387315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387314 ?auto_387315 ) ( not ( = ?auto_387308 ?auto_387309 ) ) ( not ( = ?auto_387308 ?auto_387310 ) ) ( not ( = ?auto_387308 ?auto_387311 ) ) ( not ( = ?auto_387308 ?auto_387312 ) ) ( not ( = ?auto_387308 ?auto_387313 ) ) ( not ( = ?auto_387308 ?auto_387314 ) ) ( not ( = ?auto_387308 ?auto_387315 ) ) ( not ( = ?auto_387309 ?auto_387310 ) ) ( not ( = ?auto_387309 ?auto_387311 ) ) ( not ( = ?auto_387309 ?auto_387312 ) ) ( not ( = ?auto_387309 ?auto_387313 ) ) ( not ( = ?auto_387309 ?auto_387314 ) ) ( not ( = ?auto_387309 ?auto_387315 ) ) ( not ( = ?auto_387310 ?auto_387311 ) ) ( not ( = ?auto_387310 ?auto_387312 ) ) ( not ( = ?auto_387310 ?auto_387313 ) ) ( not ( = ?auto_387310 ?auto_387314 ) ) ( not ( = ?auto_387310 ?auto_387315 ) ) ( not ( = ?auto_387311 ?auto_387312 ) ) ( not ( = ?auto_387311 ?auto_387313 ) ) ( not ( = ?auto_387311 ?auto_387314 ) ) ( not ( = ?auto_387311 ?auto_387315 ) ) ( not ( = ?auto_387312 ?auto_387313 ) ) ( not ( = ?auto_387312 ?auto_387314 ) ) ( not ( = ?auto_387312 ?auto_387315 ) ) ( not ( = ?auto_387313 ?auto_387314 ) ) ( not ( = ?auto_387313 ?auto_387315 ) ) ( not ( = ?auto_387314 ?auto_387315 ) ) ( ON ?auto_387313 ?auto_387314 ) ( ON ?auto_387312 ?auto_387313 ) ( ON ?auto_387311 ?auto_387312 ) ( ON ?auto_387310 ?auto_387311 ) ( ON ?auto_387309 ?auto_387310 ) ( ON ?auto_387308 ?auto_387309 ) ( CLEAR ?auto_387308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387308 )
      ( MAKE-7PILE ?auto_387308 ?auto_387309 ?auto_387310 ?auto_387311 ?auto_387312 ?auto_387313 ?auto_387314 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387324 - BLOCK
      ?auto_387325 - BLOCK
      ?auto_387326 - BLOCK
      ?auto_387327 - BLOCK
      ?auto_387328 - BLOCK
      ?auto_387329 - BLOCK
      ?auto_387330 - BLOCK
      ?auto_387331 - BLOCK
    )
    :vars
    (
      ?auto_387332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387330 ) ( ON ?auto_387331 ?auto_387332 ) ( CLEAR ?auto_387331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387324 ) ( ON ?auto_387325 ?auto_387324 ) ( ON ?auto_387326 ?auto_387325 ) ( ON ?auto_387327 ?auto_387326 ) ( ON ?auto_387328 ?auto_387327 ) ( ON ?auto_387329 ?auto_387328 ) ( ON ?auto_387330 ?auto_387329 ) ( not ( = ?auto_387324 ?auto_387325 ) ) ( not ( = ?auto_387324 ?auto_387326 ) ) ( not ( = ?auto_387324 ?auto_387327 ) ) ( not ( = ?auto_387324 ?auto_387328 ) ) ( not ( = ?auto_387324 ?auto_387329 ) ) ( not ( = ?auto_387324 ?auto_387330 ) ) ( not ( = ?auto_387324 ?auto_387331 ) ) ( not ( = ?auto_387324 ?auto_387332 ) ) ( not ( = ?auto_387325 ?auto_387326 ) ) ( not ( = ?auto_387325 ?auto_387327 ) ) ( not ( = ?auto_387325 ?auto_387328 ) ) ( not ( = ?auto_387325 ?auto_387329 ) ) ( not ( = ?auto_387325 ?auto_387330 ) ) ( not ( = ?auto_387325 ?auto_387331 ) ) ( not ( = ?auto_387325 ?auto_387332 ) ) ( not ( = ?auto_387326 ?auto_387327 ) ) ( not ( = ?auto_387326 ?auto_387328 ) ) ( not ( = ?auto_387326 ?auto_387329 ) ) ( not ( = ?auto_387326 ?auto_387330 ) ) ( not ( = ?auto_387326 ?auto_387331 ) ) ( not ( = ?auto_387326 ?auto_387332 ) ) ( not ( = ?auto_387327 ?auto_387328 ) ) ( not ( = ?auto_387327 ?auto_387329 ) ) ( not ( = ?auto_387327 ?auto_387330 ) ) ( not ( = ?auto_387327 ?auto_387331 ) ) ( not ( = ?auto_387327 ?auto_387332 ) ) ( not ( = ?auto_387328 ?auto_387329 ) ) ( not ( = ?auto_387328 ?auto_387330 ) ) ( not ( = ?auto_387328 ?auto_387331 ) ) ( not ( = ?auto_387328 ?auto_387332 ) ) ( not ( = ?auto_387329 ?auto_387330 ) ) ( not ( = ?auto_387329 ?auto_387331 ) ) ( not ( = ?auto_387329 ?auto_387332 ) ) ( not ( = ?auto_387330 ?auto_387331 ) ) ( not ( = ?auto_387330 ?auto_387332 ) ) ( not ( = ?auto_387331 ?auto_387332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387331 ?auto_387332 )
      ( !STACK ?auto_387331 ?auto_387330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387341 - BLOCK
      ?auto_387342 - BLOCK
      ?auto_387343 - BLOCK
      ?auto_387344 - BLOCK
      ?auto_387345 - BLOCK
      ?auto_387346 - BLOCK
      ?auto_387347 - BLOCK
      ?auto_387348 - BLOCK
    )
    :vars
    (
      ?auto_387349 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387347 ) ( ON ?auto_387348 ?auto_387349 ) ( CLEAR ?auto_387348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387341 ) ( ON ?auto_387342 ?auto_387341 ) ( ON ?auto_387343 ?auto_387342 ) ( ON ?auto_387344 ?auto_387343 ) ( ON ?auto_387345 ?auto_387344 ) ( ON ?auto_387346 ?auto_387345 ) ( ON ?auto_387347 ?auto_387346 ) ( not ( = ?auto_387341 ?auto_387342 ) ) ( not ( = ?auto_387341 ?auto_387343 ) ) ( not ( = ?auto_387341 ?auto_387344 ) ) ( not ( = ?auto_387341 ?auto_387345 ) ) ( not ( = ?auto_387341 ?auto_387346 ) ) ( not ( = ?auto_387341 ?auto_387347 ) ) ( not ( = ?auto_387341 ?auto_387348 ) ) ( not ( = ?auto_387341 ?auto_387349 ) ) ( not ( = ?auto_387342 ?auto_387343 ) ) ( not ( = ?auto_387342 ?auto_387344 ) ) ( not ( = ?auto_387342 ?auto_387345 ) ) ( not ( = ?auto_387342 ?auto_387346 ) ) ( not ( = ?auto_387342 ?auto_387347 ) ) ( not ( = ?auto_387342 ?auto_387348 ) ) ( not ( = ?auto_387342 ?auto_387349 ) ) ( not ( = ?auto_387343 ?auto_387344 ) ) ( not ( = ?auto_387343 ?auto_387345 ) ) ( not ( = ?auto_387343 ?auto_387346 ) ) ( not ( = ?auto_387343 ?auto_387347 ) ) ( not ( = ?auto_387343 ?auto_387348 ) ) ( not ( = ?auto_387343 ?auto_387349 ) ) ( not ( = ?auto_387344 ?auto_387345 ) ) ( not ( = ?auto_387344 ?auto_387346 ) ) ( not ( = ?auto_387344 ?auto_387347 ) ) ( not ( = ?auto_387344 ?auto_387348 ) ) ( not ( = ?auto_387344 ?auto_387349 ) ) ( not ( = ?auto_387345 ?auto_387346 ) ) ( not ( = ?auto_387345 ?auto_387347 ) ) ( not ( = ?auto_387345 ?auto_387348 ) ) ( not ( = ?auto_387345 ?auto_387349 ) ) ( not ( = ?auto_387346 ?auto_387347 ) ) ( not ( = ?auto_387346 ?auto_387348 ) ) ( not ( = ?auto_387346 ?auto_387349 ) ) ( not ( = ?auto_387347 ?auto_387348 ) ) ( not ( = ?auto_387347 ?auto_387349 ) ) ( not ( = ?auto_387348 ?auto_387349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387348 ?auto_387349 )
      ( !STACK ?auto_387348 ?auto_387347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387358 - BLOCK
      ?auto_387359 - BLOCK
      ?auto_387360 - BLOCK
      ?auto_387361 - BLOCK
      ?auto_387362 - BLOCK
      ?auto_387363 - BLOCK
      ?auto_387364 - BLOCK
      ?auto_387365 - BLOCK
    )
    :vars
    (
      ?auto_387366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387365 ?auto_387366 ) ( ON-TABLE ?auto_387358 ) ( ON ?auto_387359 ?auto_387358 ) ( ON ?auto_387360 ?auto_387359 ) ( ON ?auto_387361 ?auto_387360 ) ( ON ?auto_387362 ?auto_387361 ) ( ON ?auto_387363 ?auto_387362 ) ( not ( = ?auto_387358 ?auto_387359 ) ) ( not ( = ?auto_387358 ?auto_387360 ) ) ( not ( = ?auto_387358 ?auto_387361 ) ) ( not ( = ?auto_387358 ?auto_387362 ) ) ( not ( = ?auto_387358 ?auto_387363 ) ) ( not ( = ?auto_387358 ?auto_387364 ) ) ( not ( = ?auto_387358 ?auto_387365 ) ) ( not ( = ?auto_387358 ?auto_387366 ) ) ( not ( = ?auto_387359 ?auto_387360 ) ) ( not ( = ?auto_387359 ?auto_387361 ) ) ( not ( = ?auto_387359 ?auto_387362 ) ) ( not ( = ?auto_387359 ?auto_387363 ) ) ( not ( = ?auto_387359 ?auto_387364 ) ) ( not ( = ?auto_387359 ?auto_387365 ) ) ( not ( = ?auto_387359 ?auto_387366 ) ) ( not ( = ?auto_387360 ?auto_387361 ) ) ( not ( = ?auto_387360 ?auto_387362 ) ) ( not ( = ?auto_387360 ?auto_387363 ) ) ( not ( = ?auto_387360 ?auto_387364 ) ) ( not ( = ?auto_387360 ?auto_387365 ) ) ( not ( = ?auto_387360 ?auto_387366 ) ) ( not ( = ?auto_387361 ?auto_387362 ) ) ( not ( = ?auto_387361 ?auto_387363 ) ) ( not ( = ?auto_387361 ?auto_387364 ) ) ( not ( = ?auto_387361 ?auto_387365 ) ) ( not ( = ?auto_387361 ?auto_387366 ) ) ( not ( = ?auto_387362 ?auto_387363 ) ) ( not ( = ?auto_387362 ?auto_387364 ) ) ( not ( = ?auto_387362 ?auto_387365 ) ) ( not ( = ?auto_387362 ?auto_387366 ) ) ( not ( = ?auto_387363 ?auto_387364 ) ) ( not ( = ?auto_387363 ?auto_387365 ) ) ( not ( = ?auto_387363 ?auto_387366 ) ) ( not ( = ?auto_387364 ?auto_387365 ) ) ( not ( = ?auto_387364 ?auto_387366 ) ) ( not ( = ?auto_387365 ?auto_387366 ) ) ( CLEAR ?auto_387363 ) ( ON ?auto_387364 ?auto_387365 ) ( CLEAR ?auto_387364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387358 ?auto_387359 ?auto_387360 ?auto_387361 ?auto_387362 ?auto_387363 ?auto_387364 )
      ( MAKE-8PILE ?auto_387358 ?auto_387359 ?auto_387360 ?auto_387361 ?auto_387362 ?auto_387363 ?auto_387364 ?auto_387365 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387375 - BLOCK
      ?auto_387376 - BLOCK
      ?auto_387377 - BLOCK
      ?auto_387378 - BLOCK
      ?auto_387379 - BLOCK
      ?auto_387380 - BLOCK
      ?auto_387381 - BLOCK
      ?auto_387382 - BLOCK
    )
    :vars
    (
      ?auto_387383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387382 ?auto_387383 ) ( ON-TABLE ?auto_387375 ) ( ON ?auto_387376 ?auto_387375 ) ( ON ?auto_387377 ?auto_387376 ) ( ON ?auto_387378 ?auto_387377 ) ( ON ?auto_387379 ?auto_387378 ) ( ON ?auto_387380 ?auto_387379 ) ( not ( = ?auto_387375 ?auto_387376 ) ) ( not ( = ?auto_387375 ?auto_387377 ) ) ( not ( = ?auto_387375 ?auto_387378 ) ) ( not ( = ?auto_387375 ?auto_387379 ) ) ( not ( = ?auto_387375 ?auto_387380 ) ) ( not ( = ?auto_387375 ?auto_387381 ) ) ( not ( = ?auto_387375 ?auto_387382 ) ) ( not ( = ?auto_387375 ?auto_387383 ) ) ( not ( = ?auto_387376 ?auto_387377 ) ) ( not ( = ?auto_387376 ?auto_387378 ) ) ( not ( = ?auto_387376 ?auto_387379 ) ) ( not ( = ?auto_387376 ?auto_387380 ) ) ( not ( = ?auto_387376 ?auto_387381 ) ) ( not ( = ?auto_387376 ?auto_387382 ) ) ( not ( = ?auto_387376 ?auto_387383 ) ) ( not ( = ?auto_387377 ?auto_387378 ) ) ( not ( = ?auto_387377 ?auto_387379 ) ) ( not ( = ?auto_387377 ?auto_387380 ) ) ( not ( = ?auto_387377 ?auto_387381 ) ) ( not ( = ?auto_387377 ?auto_387382 ) ) ( not ( = ?auto_387377 ?auto_387383 ) ) ( not ( = ?auto_387378 ?auto_387379 ) ) ( not ( = ?auto_387378 ?auto_387380 ) ) ( not ( = ?auto_387378 ?auto_387381 ) ) ( not ( = ?auto_387378 ?auto_387382 ) ) ( not ( = ?auto_387378 ?auto_387383 ) ) ( not ( = ?auto_387379 ?auto_387380 ) ) ( not ( = ?auto_387379 ?auto_387381 ) ) ( not ( = ?auto_387379 ?auto_387382 ) ) ( not ( = ?auto_387379 ?auto_387383 ) ) ( not ( = ?auto_387380 ?auto_387381 ) ) ( not ( = ?auto_387380 ?auto_387382 ) ) ( not ( = ?auto_387380 ?auto_387383 ) ) ( not ( = ?auto_387381 ?auto_387382 ) ) ( not ( = ?auto_387381 ?auto_387383 ) ) ( not ( = ?auto_387382 ?auto_387383 ) ) ( CLEAR ?auto_387380 ) ( ON ?auto_387381 ?auto_387382 ) ( CLEAR ?auto_387381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387375 ?auto_387376 ?auto_387377 ?auto_387378 ?auto_387379 ?auto_387380 ?auto_387381 )
      ( MAKE-8PILE ?auto_387375 ?auto_387376 ?auto_387377 ?auto_387378 ?auto_387379 ?auto_387380 ?auto_387381 ?auto_387382 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387392 - BLOCK
      ?auto_387393 - BLOCK
      ?auto_387394 - BLOCK
      ?auto_387395 - BLOCK
      ?auto_387396 - BLOCK
      ?auto_387397 - BLOCK
      ?auto_387398 - BLOCK
      ?auto_387399 - BLOCK
    )
    :vars
    (
      ?auto_387400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387399 ?auto_387400 ) ( ON-TABLE ?auto_387392 ) ( ON ?auto_387393 ?auto_387392 ) ( ON ?auto_387394 ?auto_387393 ) ( ON ?auto_387395 ?auto_387394 ) ( ON ?auto_387396 ?auto_387395 ) ( not ( = ?auto_387392 ?auto_387393 ) ) ( not ( = ?auto_387392 ?auto_387394 ) ) ( not ( = ?auto_387392 ?auto_387395 ) ) ( not ( = ?auto_387392 ?auto_387396 ) ) ( not ( = ?auto_387392 ?auto_387397 ) ) ( not ( = ?auto_387392 ?auto_387398 ) ) ( not ( = ?auto_387392 ?auto_387399 ) ) ( not ( = ?auto_387392 ?auto_387400 ) ) ( not ( = ?auto_387393 ?auto_387394 ) ) ( not ( = ?auto_387393 ?auto_387395 ) ) ( not ( = ?auto_387393 ?auto_387396 ) ) ( not ( = ?auto_387393 ?auto_387397 ) ) ( not ( = ?auto_387393 ?auto_387398 ) ) ( not ( = ?auto_387393 ?auto_387399 ) ) ( not ( = ?auto_387393 ?auto_387400 ) ) ( not ( = ?auto_387394 ?auto_387395 ) ) ( not ( = ?auto_387394 ?auto_387396 ) ) ( not ( = ?auto_387394 ?auto_387397 ) ) ( not ( = ?auto_387394 ?auto_387398 ) ) ( not ( = ?auto_387394 ?auto_387399 ) ) ( not ( = ?auto_387394 ?auto_387400 ) ) ( not ( = ?auto_387395 ?auto_387396 ) ) ( not ( = ?auto_387395 ?auto_387397 ) ) ( not ( = ?auto_387395 ?auto_387398 ) ) ( not ( = ?auto_387395 ?auto_387399 ) ) ( not ( = ?auto_387395 ?auto_387400 ) ) ( not ( = ?auto_387396 ?auto_387397 ) ) ( not ( = ?auto_387396 ?auto_387398 ) ) ( not ( = ?auto_387396 ?auto_387399 ) ) ( not ( = ?auto_387396 ?auto_387400 ) ) ( not ( = ?auto_387397 ?auto_387398 ) ) ( not ( = ?auto_387397 ?auto_387399 ) ) ( not ( = ?auto_387397 ?auto_387400 ) ) ( not ( = ?auto_387398 ?auto_387399 ) ) ( not ( = ?auto_387398 ?auto_387400 ) ) ( not ( = ?auto_387399 ?auto_387400 ) ) ( ON ?auto_387398 ?auto_387399 ) ( CLEAR ?auto_387396 ) ( ON ?auto_387397 ?auto_387398 ) ( CLEAR ?auto_387397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387392 ?auto_387393 ?auto_387394 ?auto_387395 ?auto_387396 ?auto_387397 )
      ( MAKE-8PILE ?auto_387392 ?auto_387393 ?auto_387394 ?auto_387395 ?auto_387396 ?auto_387397 ?auto_387398 ?auto_387399 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387409 - BLOCK
      ?auto_387410 - BLOCK
      ?auto_387411 - BLOCK
      ?auto_387412 - BLOCK
      ?auto_387413 - BLOCK
      ?auto_387414 - BLOCK
      ?auto_387415 - BLOCK
      ?auto_387416 - BLOCK
    )
    :vars
    (
      ?auto_387417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387416 ?auto_387417 ) ( ON-TABLE ?auto_387409 ) ( ON ?auto_387410 ?auto_387409 ) ( ON ?auto_387411 ?auto_387410 ) ( ON ?auto_387412 ?auto_387411 ) ( ON ?auto_387413 ?auto_387412 ) ( not ( = ?auto_387409 ?auto_387410 ) ) ( not ( = ?auto_387409 ?auto_387411 ) ) ( not ( = ?auto_387409 ?auto_387412 ) ) ( not ( = ?auto_387409 ?auto_387413 ) ) ( not ( = ?auto_387409 ?auto_387414 ) ) ( not ( = ?auto_387409 ?auto_387415 ) ) ( not ( = ?auto_387409 ?auto_387416 ) ) ( not ( = ?auto_387409 ?auto_387417 ) ) ( not ( = ?auto_387410 ?auto_387411 ) ) ( not ( = ?auto_387410 ?auto_387412 ) ) ( not ( = ?auto_387410 ?auto_387413 ) ) ( not ( = ?auto_387410 ?auto_387414 ) ) ( not ( = ?auto_387410 ?auto_387415 ) ) ( not ( = ?auto_387410 ?auto_387416 ) ) ( not ( = ?auto_387410 ?auto_387417 ) ) ( not ( = ?auto_387411 ?auto_387412 ) ) ( not ( = ?auto_387411 ?auto_387413 ) ) ( not ( = ?auto_387411 ?auto_387414 ) ) ( not ( = ?auto_387411 ?auto_387415 ) ) ( not ( = ?auto_387411 ?auto_387416 ) ) ( not ( = ?auto_387411 ?auto_387417 ) ) ( not ( = ?auto_387412 ?auto_387413 ) ) ( not ( = ?auto_387412 ?auto_387414 ) ) ( not ( = ?auto_387412 ?auto_387415 ) ) ( not ( = ?auto_387412 ?auto_387416 ) ) ( not ( = ?auto_387412 ?auto_387417 ) ) ( not ( = ?auto_387413 ?auto_387414 ) ) ( not ( = ?auto_387413 ?auto_387415 ) ) ( not ( = ?auto_387413 ?auto_387416 ) ) ( not ( = ?auto_387413 ?auto_387417 ) ) ( not ( = ?auto_387414 ?auto_387415 ) ) ( not ( = ?auto_387414 ?auto_387416 ) ) ( not ( = ?auto_387414 ?auto_387417 ) ) ( not ( = ?auto_387415 ?auto_387416 ) ) ( not ( = ?auto_387415 ?auto_387417 ) ) ( not ( = ?auto_387416 ?auto_387417 ) ) ( ON ?auto_387415 ?auto_387416 ) ( CLEAR ?auto_387413 ) ( ON ?auto_387414 ?auto_387415 ) ( CLEAR ?auto_387414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387409 ?auto_387410 ?auto_387411 ?auto_387412 ?auto_387413 ?auto_387414 )
      ( MAKE-8PILE ?auto_387409 ?auto_387410 ?auto_387411 ?auto_387412 ?auto_387413 ?auto_387414 ?auto_387415 ?auto_387416 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387426 - BLOCK
      ?auto_387427 - BLOCK
      ?auto_387428 - BLOCK
      ?auto_387429 - BLOCK
      ?auto_387430 - BLOCK
      ?auto_387431 - BLOCK
      ?auto_387432 - BLOCK
      ?auto_387433 - BLOCK
    )
    :vars
    (
      ?auto_387434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387433 ?auto_387434 ) ( ON-TABLE ?auto_387426 ) ( ON ?auto_387427 ?auto_387426 ) ( ON ?auto_387428 ?auto_387427 ) ( ON ?auto_387429 ?auto_387428 ) ( not ( = ?auto_387426 ?auto_387427 ) ) ( not ( = ?auto_387426 ?auto_387428 ) ) ( not ( = ?auto_387426 ?auto_387429 ) ) ( not ( = ?auto_387426 ?auto_387430 ) ) ( not ( = ?auto_387426 ?auto_387431 ) ) ( not ( = ?auto_387426 ?auto_387432 ) ) ( not ( = ?auto_387426 ?auto_387433 ) ) ( not ( = ?auto_387426 ?auto_387434 ) ) ( not ( = ?auto_387427 ?auto_387428 ) ) ( not ( = ?auto_387427 ?auto_387429 ) ) ( not ( = ?auto_387427 ?auto_387430 ) ) ( not ( = ?auto_387427 ?auto_387431 ) ) ( not ( = ?auto_387427 ?auto_387432 ) ) ( not ( = ?auto_387427 ?auto_387433 ) ) ( not ( = ?auto_387427 ?auto_387434 ) ) ( not ( = ?auto_387428 ?auto_387429 ) ) ( not ( = ?auto_387428 ?auto_387430 ) ) ( not ( = ?auto_387428 ?auto_387431 ) ) ( not ( = ?auto_387428 ?auto_387432 ) ) ( not ( = ?auto_387428 ?auto_387433 ) ) ( not ( = ?auto_387428 ?auto_387434 ) ) ( not ( = ?auto_387429 ?auto_387430 ) ) ( not ( = ?auto_387429 ?auto_387431 ) ) ( not ( = ?auto_387429 ?auto_387432 ) ) ( not ( = ?auto_387429 ?auto_387433 ) ) ( not ( = ?auto_387429 ?auto_387434 ) ) ( not ( = ?auto_387430 ?auto_387431 ) ) ( not ( = ?auto_387430 ?auto_387432 ) ) ( not ( = ?auto_387430 ?auto_387433 ) ) ( not ( = ?auto_387430 ?auto_387434 ) ) ( not ( = ?auto_387431 ?auto_387432 ) ) ( not ( = ?auto_387431 ?auto_387433 ) ) ( not ( = ?auto_387431 ?auto_387434 ) ) ( not ( = ?auto_387432 ?auto_387433 ) ) ( not ( = ?auto_387432 ?auto_387434 ) ) ( not ( = ?auto_387433 ?auto_387434 ) ) ( ON ?auto_387432 ?auto_387433 ) ( ON ?auto_387431 ?auto_387432 ) ( CLEAR ?auto_387429 ) ( ON ?auto_387430 ?auto_387431 ) ( CLEAR ?auto_387430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387426 ?auto_387427 ?auto_387428 ?auto_387429 ?auto_387430 )
      ( MAKE-8PILE ?auto_387426 ?auto_387427 ?auto_387428 ?auto_387429 ?auto_387430 ?auto_387431 ?auto_387432 ?auto_387433 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387443 - BLOCK
      ?auto_387444 - BLOCK
      ?auto_387445 - BLOCK
      ?auto_387446 - BLOCK
      ?auto_387447 - BLOCK
      ?auto_387448 - BLOCK
      ?auto_387449 - BLOCK
      ?auto_387450 - BLOCK
    )
    :vars
    (
      ?auto_387451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387450 ?auto_387451 ) ( ON-TABLE ?auto_387443 ) ( ON ?auto_387444 ?auto_387443 ) ( ON ?auto_387445 ?auto_387444 ) ( ON ?auto_387446 ?auto_387445 ) ( not ( = ?auto_387443 ?auto_387444 ) ) ( not ( = ?auto_387443 ?auto_387445 ) ) ( not ( = ?auto_387443 ?auto_387446 ) ) ( not ( = ?auto_387443 ?auto_387447 ) ) ( not ( = ?auto_387443 ?auto_387448 ) ) ( not ( = ?auto_387443 ?auto_387449 ) ) ( not ( = ?auto_387443 ?auto_387450 ) ) ( not ( = ?auto_387443 ?auto_387451 ) ) ( not ( = ?auto_387444 ?auto_387445 ) ) ( not ( = ?auto_387444 ?auto_387446 ) ) ( not ( = ?auto_387444 ?auto_387447 ) ) ( not ( = ?auto_387444 ?auto_387448 ) ) ( not ( = ?auto_387444 ?auto_387449 ) ) ( not ( = ?auto_387444 ?auto_387450 ) ) ( not ( = ?auto_387444 ?auto_387451 ) ) ( not ( = ?auto_387445 ?auto_387446 ) ) ( not ( = ?auto_387445 ?auto_387447 ) ) ( not ( = ?auto_387445 ?auto_387448 ) ) ( not ( = ?auto_387445 ?auto_387449 ) ) ( not ( = ?auto_387445 ?auto_387450 ) ) ( not ( = ?auto_387445 ?auto_387451 ) ) ( not ( = ?auto_387446 ?auto_387447 ) ) ( not ( = ?auto_387446 ?auto_387448 ) ) ( not ( = ?auto_387446 ?auto_387449 ) ) ( not ( = ?auto_387446 ?auto_387450 ) ) ( not ( = ?auto_387446 ?auto_387451 ) ) ( not ( = ?auto_387447 ?auto_387448 ) ) ( not ( = ?auto_387447 ?auto_387449 ) ) ( not ( = ?auto_387447 ?auto_387450 ) ) ( not ( = ?auto_387447 ?auto_387451 ) ) ( not ( = ?auto_387448 ?auto_387449 ) ) ( not ( = ?auto_387448 ?auto_387450 ) ) ( not ( = ?auto_387448 ?auto_387451 ) ) ( not ( = ?auto_387449 ?auto_387450 ) ) ( not ( = ?auto_387449 ?auto_387451 ) ) ( not ( = ?auto_387450 ?auto_387451 ) ) ( ON ?auto_387449 ?auto_387450 ) ( ON ?auto_387448 ?auto_387449 ) ( CLEAR ?auto_387446 ) ( ON ?auto_387447 ?auto_387448 ) ( CLEAR ?auto_387447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387443 ?auto_387444 ?auto_387445 ?auto_387446 ?auto_387447 )
      ( MAKE-8PILE ?auto_387443 ?auto_387444 ?auto_387445 ?auto_387446 ?auto_387447 ?auto_387448 ?auto_387449 ?auto_387450 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387460 - BLOCK
      ?auto_387461 - BLOCK
      ?auto_387462 - BLOCK
      ?auto_387463 - BLOCK
      ?auto_387464 - BLOCK
      ?auto_387465 - BLOCK
      ?auto_387466 - BLOCK
      ?auto_387467 - BLOCK
    )
    :vars
    (
      ?auto_387468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387467 ?auto_387468 ) ( ON-TABLE ?auto_387460 ) ( ON ?auto_387461 ?auto_387460 ) ( ON ?auto_387462 ?auto_387461 ) ( not ( = ?auto_387460 ?auto_387461 ) ) ( not ( = ?auto_387460 ?auto_387462 ) ) ( not ( = ?auto_387460 ?auto_387463 ) ) ( not ( = ?auto_387460 ?auto_387464 ) ) ( not ( = ?auto_387460 ?auto_387465 ) ) ( not ( = ?auto_387460 ?auto_387466 ) ) ( not ( = ?auto_387460 ?auto_387467 ) ) ( not ( = ?auto_387460 ?auto_387468 ) ) ( not ( = ?auto_387461 ?auto_387462 ) ) ( not ( = ?auto_387461 ?auto_387463 ) ) ( not ( = ?auto_387461 ?auto_387464 ) ) ( not ( = ?auto_387461 ?auto_387465 ) ) ( not ( = ?auto_387461 ?auto_387466 ) ) ( not ( = ?auto_387461 ?auto_387467 ) ) ( not ( = ?auto_387461 ?auto_387468 ) ) ( not ( = ?auto_387462 ?auto_387463 ) ) ( not ( = ?auto_387462 ?auto_387464 ) ) ( not ( = ?auto_387462 ?auto_387465 ) ) ( not ( = ?auto_387462 ?auto_387466 ) ) ( not ( = ?auto_387462 ?auto_387467 ) ) ( not ( = ?auto_387462 ?auto_387468 ) ) ( not ( = ?auto_387463 ?auto_387464 ) ) ( not ( = ?auto_387463 ?auto_387465 ) ) ( not ( = ?auto_387463 ?auto_387466 ) ) ( not ( = ?auto_387463 ?auto_387467 ) ) ( not ( = ?auto_387463 ?auto_387468 ) ) ( not ( = ?auto_387464 ?auto_387465 ) ) ( not ( = ?auto_387464 ?auto_387466 ) ) ( not ( = ?auto_387464 ?auto_387467 ) ) ( not ( = ?auto_387464 ?auto_387468 ) ) ( not ( = ?auto_387465 ?auto_387466 ) ) ( not ( = ?auto_387465 ?auto_387467 ) ) ( not ( = ?auto_387465 ?auto_387468 ) ) ( not ( = ?auto_387466 ?auto_387467 ) ) ( not ( = ?auto_387466 ?auto_387468 ) ) ( not ( = ?auto_387467 ?auto_387468 ) ) ( ON ?auto_387466 ?auto_387467 ) ( ON ?auto_387465 ?auto_387466 ) ( ON ?auto_387464 ?auto_387465 ) ( CLEAR ?auto_387462 ) ( ON ?auto_387463 ?auto_387464 ) ( CLEAR ?auto_387463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387460 ?auto_387461 ?auto_387462 ?auto_387463 )
      ( MAKE-8PILE ?auto_387460 ?auto_387461 ?auto_387462 ?auto_387463 ?auto_387464 ?auto_387465 ?auto_387466 ?auto_387467 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387477 - BLOCK
      ?auto_387478 - BLOCK
      ?auto_387479 - BLOCK
      ?auto_387480 - BLOCK
      ?auto_387481 - BLOCK
      ?auto_387482 - BLOCK
      ?auto_387483 - BLOCK
      ?auto_387484 - BLOCK
    )
    :vars
    (
      ?auto_387485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387484 ?auto_387485 ) ( ON-TABLE ?auto_387477 ) ( ON ?auto_387478 ?auto_387477 ) ( ON ?auto_387479 ?auto_387478 ) ( not ( = ?auto_387477 ?auto_387478 ) ) ( not ( = ?auto_387477 ?auto_387479 ) ) ( not ( = ?auto_387477 ?auto_387480 ) ) ( not ( = ?auto_387477 ?auto_387481 ) ) ( not ( = ?auto_387477 ?auto_387482 ) ) ( not ( = ?auto_387477 ?auto_387483 ) ) ( not ( = ?auto_387477 ?auto_387484 ) ) ( not ( = ?auto_387477 ?auto_387485 ) ) ( not ( = ?auto_387478 ?auto_387479 ) ) ( not ( = ?auto_387478 ?auto_387480 ) ) ( not ( = ?auto_387478 ?auto_387481 ) ) ( not ( = ?auto_387478 ?auto_387482 ) ) ( not ( = ?auto_387478 ?auto_387483 ) ) ( not ( = ?auto_387478 ?auto_387484 ) ) ( not ( = ?auto_387478 ?auto_387485 ) ) ( not ( = ?auto_387479 ?auto_387480 ) ) ( not ( = ?auto_387479 ?auto_387481 ) ) ( not ( = ?auto_387479 ?auto_387482 ) ) ( not ( = ?auto_387479 ?auto_387483 ) ) ( not ( = ?auto_387479 ?auto_387484 ) ) ( not ( = ?auto_387479 ?auto_387485 ) ) ( not ( = ?auto_387480 ?auto_387481 ) ) ( not ( = ?auto_387480 ?auto_387482 ) ) ( not ( = ?auto_387480 ?auto_387483 ) ) ( not ( = ?auto_387480 ?auto_387484 ) ) ( not ( = ?auto_387480 ?auto_387485 ) ) ( not ( = ?auto_387481 ?auto_387482 ) ) ( not ( = ?auto_387481 ?auto_387483 ) ) ( not ( = ?auto_387481 ?auto_387484 ) ) ( not ( = ?auto_387481 ?auto_387485 ) ) ( not ( = ?auto_387482 ?auto_387483 ) ) ( not ( = ?auto_387482 ?auto_387484 ) ) ( not ( = ?auto_387482 ?auto_387485 ) ) ( not ( = ?auto_387483 ?auto_387484 ) ) ( not ( = ?auto_387483 ?auto_387485 ) ) ( not ( = ?auto_387484 ?auto_387485 ) ) ( ON ?auto_387483 ?auto_387484 ) ( ON ?auto_387482 ?auto_387483 ) ( ON ?auto_387481 ?auto_387482 ) ( CLEAR ?auto_387479 ) ( ON ?auto_387480 ?auto_387481 ) ( CLEAR ?auto_387480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387477 ?auto_387478 ?auto_387479 ?auto_387480 )
      ( MAKE-8PILE ?auto_387477 ?auto_387478 ?auto_387479 ?auto_387480 ?auto_387481 ?auto_387482 ?auto_387483 ?auto_387484 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387494 - BLOCK
      ?auto_387495 - BLOCK
      ?auto_387496 - BLOCK
      ?auto_387497 - BLOCK
      ?auto_387498 - BLOCK
      ?auto_387499 - BLOCK
      ?auto_387500 - BLOCK
      ?auto_387501 - BLOCK
    )
    :vars
    (
      ?auto_387502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387501 ?auto_387502 ) ( ON-TABLE ?auto_387494 ) ( ON ?auto_387495 ?auto_387494 ) ( not ( = ?auto_387494 ?auto_387495 ) ) ( not ( = ?auto_387494 ?auto_387496 ) ) ( not ( = ?auto_387494 ?auto_387497 ) ) ( not ( = ?auto_387494 ?auto_387498 ) ) ( not ( = ?auto_387494 ?auto_387499 ) ) ( not ( = ?auto_387494 ?auto_387500 ) ) ( not ( = ?auto_387494 ?auto_387501 ) ) ( not ( = ?auto_387494 ?auto_387502 ) ) ( not ( = ?auto_387495 ?auto_387496 ) ) ( not ( = ?auto_387495 ?auto_387497 ) ) ( not ( = ?auto_387495 ?auto_387498 ) ) ( not ( = ?auto_387495 ?auto_387499 ) ) ( not ( = ?auto_387495 ?auto_387500 ) ) ( not ( = ?auto_387495 ?auto_387501 ) ) ( not ( = ?auto_387495 ?auto_387502 ) ) ( not ( = ?auto_387496 ?auto_387497 ) ) ( not ( = ?auto_387496 ?auto_387498 ) ) ( not ( = ?auto_387496 ?auto_387499 ) ) ( not ( = ?auto_387496 ?auto_387500 ) ) ( not ( = ?auto_387496 ?auto_387501 ) ) ( not ( = ?auto_387496 ?auto_387502 ) ) ( not ( = ?auto_387497 ?auto_387498 ) ) ( not ( = ?auto_387497 ?auto_387499 ) ) ( not ( = ?auto_387497 ?auto_387500 ) ) ( not ( = ?auto_387497 ?auto_387501 ) ) ( not ( = ?auto_387497 ?auto_387502 ) ) ( not ( = ?auto_387498 ?auto_387499 ) ) ( not ( = ?auto_387498 ?auto_387500 ) ) ( not ( = ?auto_387498 ?auto_387501 ) ) ( not ( = ?auto_387498 ?auto_387502 ) ) ( not ( = ?auto_387499 ?auto_387500 ) ) ( not ( = ?auto_387499 ?auto_387501 ) ) ( not ( = ?auto_387499 ?auto_387502 ) ) ( not ( = ?auto_387500 ?auto_387501 ) ) ( not ( = ?auto_387500 ?auto_387502 ) ) ( not ( = ?auto_387501 ?auto_387502 ) ) ( ON ?auto_387500 ?auto_387501 ) ( ON ?auto_387499 ?auto_387500 ) ( ON ?auto_387498 ?auto_387499 ) ( ON ?auto_387497 ?auto_387498 ) ( CLEAR ?auto_387495 ) ( ON ?auto_387496 ?auto_387497 ) ( CLEAR ?auto_387496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387494 ?auto_387495 ?auto_387496 )
      ( MAKE-8PILE ?auto_387494 ?auto_387495 ?auto_387496 ?auto_387497 ?auto_387498 ?auto_387499 ?auto_387500 ?auto_387501 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387511 - BLOCK
      ?auto_387512 - BLOCK
      ?auto_387513 - BLOCK
      ?auto_387514 - BLOCK
      ?auto_387515 - BLOCK
      ?auto_387516 - BLOCK
      ?auto_387517 - BLOCK
      ?auto_387518 - BLOCK
    )
    :vars
    (
      ?auto_387519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387518 ?auto_387519 ) ( ON-TABLE ?auto_387511 ) ( ON ?auto_387512 ?auto_387511 ) ( not ( = ?auto_387511 ?auto_387512 ) ) ( not ( = ?auto_387511 ?auto_387513 ) ) ( not ( = ?auto_387511 ?auto_387514 ) ) ( not ( = ?auto_387511 ?auto_387515 ) ) ( not ( = ?auto_387511 ?auto_387516 ) ) ( not ( = ?auto_387511 ?auto_387517 ) ) ( not ( = ?auto_387511 ?auto_387518 ) ) ( not ( = ?auto_387511 ?auto_387519 ) ) ( not ( = ?auto_387512 ?auto_387513 ) ) ( not ( = ?auto_387512 ?auto_387514 ) ) ( not ( = ?auto_387512 ?auto_387515 ) ) ( not ( = ?auto_387512 ?auto_387516 ) ) ( not ( = ?auto_387512 ?auto_387517 ) ) ( not ( = ?auto_387512 ?auto_387518 ) ) ( not ( = ?auto_387512 ?auto_387519 ) ) ( not ( = ?auto_387513 ?auto_387514 ) ) ( not ( = ?auto_387513 ?auto_387515 ) ) ( not ( = ?auto_387513 ?auto_387516 ) ) ( not ( = ?auto_387513 ?auto_387517 ) ) ( not ( = ?auto_387513 ?auto_387518 ) ) ( not ( = ?auto_387513 ?auto_387519 ) ) ( not ( = ?auto_387514 ?auto_387515 ) ) ( not ( = ?auto_387514 ?auto_387516 ) ) ( not ( = ?auto_387514 ?auto_387517 ) ) ( not ( = ?auto_387514 ?auto_387518 ) ) ( not ( = ?auto_387514 ?auto_387519 ) ) ( not ( = ?auto_387515 ?auto_387516 ) ) ( not ( = ?auto_387515 ?auto_387517 ) ) ( not ( = ?auto_387515 ?auto_387518 ) ) ( not ( = ?auto_387515 ?auto_387519 ) ) ( not ( = ?auto_387516 ?auto_387517 ) ) ( not ( = ?auto_387516 ?auto_387518 ) ) ( not ( = ?auto_387516 ?auto_387519 ) ) ( not ( = ?auto_387517 ?auto_387518 ) ) ( not ( = ?auto_387517 ?auto_387519 ) ) ( not ( = ?auto_387518 ?auto_387519 ) ) ( ON ?auto_387517 ?auto_387518 ) ( ON ?auto_387516 ?auto_387517 ) ( ON ?auto_387515 ?auto_387516 ) ( ON ?auto_387514 ?auto_387515 ) ( CLEAR ?auto_387512 ) ( ON ?auto_387513 ?auto_387514 ) ( CLEAR ?auto_387513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387511 ?auto_387512 ?auto_387513 )
      ( MAKE-8PILE ?auto_387511 ?auto_387512 ?auto_387513 ?auto_387514 ?auto_387515 ?auto_387516 ?auto_387517 ?auto_387518 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387528 - BLOCK
      ?auto_387529 - BLOCK
      ?auto_387530 - BLOCK
      ?auto_387531 - BLOCK
      ?auto_387532 - BLOCK
      ?auto_387533 - BLOCK
      ?auto_387534 - BLOCK
      ?auto_387535 - BLOCK
    )
    :vars
    (
      ?auto_387536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387535 ?auto_387536 ) ( ON-TABLE ?auto_387528 ) ( not ( = ?auto_387528 ?auto_387529 ) ) ( not ( = ?auto_387528 ?auto_387530 ) ) ( not ( = ?auto_387528 ?auto_387531 ) ) ( not ( = ?auto_387528 ?auto_387532 ) ) ( not ( = ?auto_387528 ?auto_387533 ) ) ( not ( = ?auto_387528 ?auto_387534 ) ) ( not ( = ?auto_387528 ?auto_387535 ) ) ( not ( = ?auto_387528 ?auto_387536 ) ) ( not ( = ?auto_387529 ?auto_387530 ) ) ( not ( = ?auto_387529 ?auto_387531 ) ) ( not ( = ?auto_387529 ?auto_387532 ) ) ( not ( = ?auto_387529 ?auto_387533 ) ) ( not ( = ?auto_387529 ?auto_387534 ) ) ( not ( = ?auto_387529 ?auto_387535 ) ) ( not ( = ?auto_387529 ?auto_387536 ) ) ( not ( = ?auto_387530 ?auto_387531 ) ) ( not ( = ?auto_387530 ?auto_387532 ) ) ( not ( = ?auto_387530 ?auto_387533 ) ) ( not ( = ?auto_387530 ?auto_387534 ) ) ( not ( = ?auto_387530 ?auto_387535 ) ) ( not ( = ?auto_387530 ?auto_387536 ) ) ( not ( = ?auto_387531 ?auto_387532 ) ) ( not ( = ?auto_387531 ?auto_387533 ) ) ( not ( = ?auto_387531 ?auto_387534 ) ) ( not ( = ?auto_387531 ?auto_387535 ) ) ( not ( = ?auto_387531 ?auto_387536 ) ) ( not ( = ?auto_387532 ?auto_387533 ) ) ( not ( = ?auto_387532 ?auto_387534 ) ) ( not ( = ?auto_387532 ?auto_387535 ) ) ( not ( = ?auto_387532 ?auto_387536 ) ) ( not ( = ?auto_387533 ?auto_387534 ) ) ( not ( = ?auto_387533 ?auto_387535 ) ) ( not ( = ?auto_387533 ?auto_387536 ) ) ( not ( = ?auto_387534 ?auto_387535 ) ) ( not ( = ?auto_387534 ?auto_387536 ) ) ( not ( = ?auto_387535 ?auto_387536 ) ) ( ON ?auto_387534 ?auto_387535 ) ( ON ?auto_387533 ?auto_387534 ) ( ON ?auto_387532 ?auto_387533 ) ( ON ?auto_387531 ?auto_387532 ) ( ON ?auto_387530 ?auto_387531 ) ( CLEAR ?auto_387528 ) ( ON ?auto_387529 ?auto_387530 ) ( CLEAR ?auto_387529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387528 ?auto_387529 )
      ( MAKE-8PILE ?auto_387528 ?auto_387529 ?auto_387530 ?auto_387531 ?auto_387532 ?auto_387533 ?auto_387534 ?auto_387535 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387545 - BLOCK
      ?auto_387546 - BLOCK
      ?auto_387547 - BLOCK
      ?auto_387548 - BLOCK
      ?auto_387549 - BLOCK
      ?auto_387550 - BLOCK
      ?auto_387551 - BLOCK
      ?auto_387552 - BLOCK
    )
    :vars
    (
      ?auto_387553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387552 ?auto_387553 ) ( ON-TABLE ?auto_387545 ) ( not ( = ?auto_387545 ?auto_387546 ) ) ( not ( = ?auto_387545 ?auto_387547 ) ) ( not ( = ?auto_387545 ?auto_387548 ) ) ( not ( = ?auto_387545 ?auto_387549 ) ) ( not ( = ?auto_387545 ?auto_387550 ) ) ( not ( = ?auto_387545 ?auto_387551 ) ) ( not ( = ?auto_387545 ?auto_387552 ) ) ( not ( = ?auto_387545 ?auto_387553 ) ) ( not ( = ?auto_387546 ?auto_387547 ) ) ( not ( = ?auto_387546 ?auto_387548 ) ) ( not ( = ?auto_387546 ?auto_387549 ) ) ( not ( = ?auto_387546 ?auto_387550 ) ) ( not ( = ?auto_387546 ?auto_387551 ) ) ( not ( = ?auto_387546 ?auto_387552 ) ) ( not ( = ?auto_387546 ?auto_387553 ) ) ( not ( = ?auto_387547 ?auto_387548 ) ) ( not ( = ?auto_387547 ?auto_387549 ) ) ( not ( = ?auto_387547 ?auto_387550 ) ) ( not ( = ?auto_387547 ?auto_387551 ) ) ( not ( = ?auto_387547 ?auto_387552 ) ) ( not ( = ?auto_387547 ?auto_387553 ) ) ( not ( = ?auto_387548 ?auto_387549 ) ) ( not ( = ?auto_387548 ?auto_387550 ) ) ( not ( = ?auto_387548 ?auto_387551 ) ) ( not ( = ?auto_387548 ?auto_387552 ) ) ( not ( = ?auto_387548 ?auto_387553 ) ) ( not ( = ?auto_387549 ?auto_387550 ) ) ( not ( = ?auto_387549 ?auto_387551 ) ) ( not ( = ?auto_387549 ?auto_387552 ) ) ( not ( = ?auto_387549 ?auto_387553 ) ) ( not ( = ?auto_387550 ?auto_387551 ) ) ( not ( = ?auto_387550 ?auto_387552 ) ) ( not ( = ?auto_387550 ?auto_387553 ) ) ( not ( = ?auto_387551 ?auto_387552 ) ) ( not ( = ?auto_387551 ?auto_387553 ) ) ( not ( = ?auto_387552 ?auto_387553 ) ) ( ON ?auto_387551 ?auto_387552 ) ( ON ?auto_387550 ?auto_387551 ) ( ON ?auto_387549 ?auto_387550 ) ( ON ?auto_387548 ?auto_387549 ) ( ON ?auto_387547 ?auto_387548 ) ( CLEAR ?auto_387545 ) ( ON ?auto_387546 ?auto_387547 ) ( CLEAR ?auto_387546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387545 ?auto_387546 )
      ( MAKE-8PILE ?auto_387545 ?auto_387546 ?auto_387547 ?auto_387548 ?auto_387549 ?auto_387550 ?auto_387551 ?auto_387552 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387562 - BLOCK
      ?auto_387563 - BLOCK
      ?auto_387564 - BLOCK
      ?auto_387565 - BLOCK
      ?auto_387566 - BLOCK
      ?auto_387567 - BLOCK
      ?auto_387568 - BLOCK
      ?auto_387569 - BLOCK
    )
    :vars
    (
      ?auto_387570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387569 ?auto_387570 ) ( not ( = ?auto_387562 ?auto_387563 ) ) ( not ( = ?auto_387562 ?auto_387564 ) ) ( not ( = ?auto_387562 ?auto_387565 ) ) ( not ( = ?auto_387562 ?auto_387566 ) ) ( not ( = ?auto_387562 ?auto_387567 ) ) ( not ( = ?auto_387562 ?auto_387568 ) ) ( not ( = ?auto_387562 ?auto_387569 ) ) ( not ( = ?auto_387562 ?auto_387570 ) ) ( not ( = ?auto_387563 ?auto_387564 ) ) ( not ( = ?auto_387563 ?auto_387565 ) ) ( not ( = ?auto_387563 ?auto_387566 ) ) ( not ( = ?auto_387563 ?auto_387567 ) ) ( not ( = ?auto_387563 ?auto_387568 ) ) ( not ( = ?auto_387563 ?auto_387569 ) ) ( not ( = ?auto_387563 ?auto_387570 ) ) ( not ( = ?auto_387564 ?auto_387565 ) ) ( not ( = ?auto_387564 ?auto_387566 ) ) ( not ( = ?auto_387564 ?auto_387567 ) ) ( not ( = ?auto_387564 ?auto_387568 ) ) ( not ( = ?auto_387564 ?auto_387569 ) ) ( not ( = ?auto_387564 ?auto_387570 ) ) ( not ( = ?auto_387565 ?auto_387566 ) ) ( not ( = ?auto_387565 ?auto_387567 ) ) ( not ( = ?auto_387565 ?auto_387568 ) ) ( not ( = ?auto_387565 ?auto_387569 ) ) ( not ( = ?auto_387565 ?auto_387570 ) ) ( not ( = ?auto_387566 ?auto_387567 ) ) ( not ( = ?auto_387566 ?auto_387568 ) ) ( not ( = ?auto_387566 ?auto_387569 ) ) ( not ( = ?auto_387566 ?auto_387570 ) ) ( not ( = ?auto_387567 ?auto_387568 ) ) ( not ( = ?auto_387567 ?auto_387569 ) ) ( not ( = ?auto_387567 ?auto_387570 ) ) ( not ( = ?auto_387568 ?auto_387569 ) ) ( not ( = ?auto_387568 ?auto_387570 ) ) ( not ( = ?auto_387569 ?auto_387570 ) ) ( ON ?auto_387568 ?auto_387569 ) ( ON ?auto_387567 ?auto_387568 ) ( ON ?auto_387566 ?auto_387567 ) ( ON ?auto_387565 ?auto_387566 ) ( ON ?auto_387564 ?auto_387565 ) ( ON ?auto_387563 ?auto_387564 ) ( ON ?auto_387562 ?auto_387563 ) ( CLEAR ?auto_387562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387562 )
      ( MAKE-8PILE ?auto_387562 ?auto_387563 ?auto_387564 ?auto_387565 ?auto_387566 ?auto_387567 ?auto_387568 ?auto_387569 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_387579 - BLOCK
      ?auto_387580 - BLOCK
      ?auto_387581 - BLOCK
      ?auto_387582 - BLOCK
      ?auto_387583 - BLOCK
      ?auto_387584 - BLOCK
      ?auto_387585 - BLOCK
      ?auto_387586 - BLOCK
    )
    :vars
    (
      ?auto_387587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387586 ?auto_387587 ) ( not ( = ?auto_387579 ?auto_387580 ) ) ( not ( = ?auto_387579 ?auto_387581 ) ) ( not ( = ?auto_387579 ?auto_387582 ) ) ( not ( = ?auto_387579 ?auto_387583 ) ) ( not ( = ?auto_387579 ?auto_387584 ) ) ( not ( = ?auto_387579 ?auto_387585 ) ) ( not ( = ?auto_387579 ?auto_387586 ) ) ( not ( = ?auto_387579 ?auto_387587 ) ) ( not ( = ?auto_387580 ?auto_387581 ) ) ( not ( = ?auto_387580 ?auto_387582 ) ) ( not ( = ?auto_387580 ?auto_387583 ) ) ( not ( = ?auto_387580 ?auto_387584 ) ) ( not ( = ?auto_387580 ?auto_387585 ) ) ( not ( = ?auto_387580 ?auto_387586 ) ) ( not ( = ?auto_387580 ?auto_387587 ) ) ( not ( = ?auto_387581 ?auto_387582 ) ) ( not ( = ?auto_387581 ?auto_387583 ) ) ( not ( = ?auto_387581 ?auto_387584 ) ) ( not ( = ?auto_387581 ?auto_387585 ) ) ( not ( = ?auto_387581 ?auto_387586 ) ) ( not ( = ?auto_387581 ?auto_387587 ) ) ( not ( = ?auto_387582 ?auto_387583 ) ) ( not ( = ?auto_387582 ?auto_387584 ) ) ( not ( = ?auto_387582 ?auto_387585 ) ) ( not ( = ?auto_387582 ?auto_387586 ) ) ( not ( = ?auto_387582 ?auto_387587 ) ) ( not ( = ?auto_387583 ?auto_387584 ) ) ( not ( = ?auto_387583 ?auto_387585 ) ) ( not ( = ?auto_387583 ?auto_387586 ) ) ( not ( = ?auto_387583 ?auto_387587 ) ) ( not ( = ?auto_387584 ?auto_387585 ) ) ( not ( = ?auto_387584 ?auto_387586 ) ) ( not ( = ?auto_387584 ?auto_387587 ) ) ( not ( = ?auto_387585 ?auto_387586 ) ) ( not ( = ?auto_387585 ?auto_387587 ) ) ( not ( = ?auto_387586 ?auto_387587 ) ) ( ON ?auto_387585 ?auto_387586 ) ( ON ?auto_387584 ?auto_387585 ) ( ON ?auto_387583 ?auto_387584 ) ( ON ?auto_387582 ?auto_387583 ) ( ON ?auto_387581 ?auto_387582 ) ( ON ?auto_387580 ?auto_387581 ) ( ON ?auto_387579 ?auto_387580 ) ( CLEAR ?auto_387579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387579 )
      ( MAKE-8PILE ?auto_387579 ?auto_387580 ?auto_387581 ?auto_387582 ?auto_387583 ?auto_387584 ?auto_387585 ?auto_387586 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387597 - BLOCK
      ?auto_387598 - BLOCK
      ?auto_387599 - BLOCK
      ?auto_387600 - BLOCK
      ?auto_387601 - BLOCK
      ?auto_387602 - BLOCK
      ?auto_387603 - BLOCK
      ?auto_387604 - BLOCK
      ?auto_387605 - BLOCK
    )
    :vars
    (
      ?auto_387606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387604 ) ( ON ?auto_387605 ?auto_387606 ) ( CLEAR ?auto_387605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387597 ) ( ON ?auto_387598 ?auto_387597 ) ( ON ?auto_387599 ?auto_387598 ) ( ON ?auto_387600 ?auto_387599 ) ( ON ?auto_387601 ?auto_387600 ) ( ON ?auto_387602 ?auto_387601 ) ( ON ?auto_387603 ?auto_387602 ) ( ON ?auto_387604 ?auto_387603 ) ( not ( = ?auto_387597 ?auto_387598 ) ) ( not ( = ?auto_387597 ?auto_387599 ) ) ( not ( = ?auto_387597 ?auto_387600 ) ) ( not ( = ?auto_387597 ?auto_387601 ) ) ( not ( = ?auto_387597 ?auto_387602 ) ) ( not ( = ?auto_387597 ?auto_387603 ) ) ( not ( = ?auto_387597 ?auto_387604 ) ) ( not ( = ?auto_387597 ?auto_387605 ) ) ( not ( = ?auto_387597 ?auto_387606 ) ) ( not ( = ?auto_387598 ?auto_387599 ) ) ( not ( = ?auto_387598 ?auto_387600 ) ) ( not ( = ?auto_387598 ?auto_387601 ) ) ( not ( = ?auto_387598 ?auto_387602 ) ) ( not ( = ?auto_387598 ?auto_387603 ) ) ( not ( = ?auto_387598 ?auto_387604 ) ) ( not ( = ?auto_387598 ?auto_387605 ) ) ( not ( = ?auto_387598 ?auto_387606 ) ) ( not ( = ?auto_387599 ?auto_387600 ) ) ( not ( = ?auto_387599 ?auto_387601 ) ) ( not ( = ?auto_387599 ?auto_387602 ) ) ( not ( = ?auto_387599 ?auto_387603 ) ) ( not ( = ?auto_387599 ?auto_387604 ) ) ( not ( = ?auto_387599 ?auto_387605 ) ) ( not ( = ?auto_387599 ?auto_387606 ) ) ( not ( = ?auto_387600 ?auto_387601 ) ) ( not ( = ?auto_387600 ?auto_387602 ) ) ( not ( = ?auto_387600 ?auto_387603 ) ) ( not ( = ?auto_387600 ?auto_387604 ) ) ( not ( = ?auto_387600 ?auto_387605 ) ) ( not ( = ?auto_387600 ?auto_387606 ) ) ( not ( = ?auto_387601 ?auto_387602 ) ) ( not ( = ?auto_387601 ?auto_387603 ) ) ( not ( = ?auto_387601 ?auto_387604 ) ) ( not ( = ?auto_387601 ?auto_387605 ) ) ( not ( = ?auto_387601 ?auto_387606 ) ) ( not ( = ?auto_387602 ?auto_387603 ) ) ( not ( = ?auto_387602 ?auto_387604 ) ) ( not ( = ?auto_387602 ?auto_387605 ) ) ( not ( = ?auto_387602 ?auto_387606 ) ) ( not ( = ?auto_387603 ?auto_387604 ) ) ( not ( = ?auto_387603 ?auto_387605 ) ) ( not ( = ?auto_387603 ?auto_387606 ) ) ( not ( = ?auto_387604 ?auto_387605 ) ) ( not ( = ?auto_387604 ?auto_387606 ) ) ( not ( = ?auto_387605 ?auto_387606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387605 ?auto_387606 )
      ( !STACK ?auto_387605 ?auto_387604 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387616 - BLOCK
      ?auto_387617 - BLOCK
      ?auto_387618 - BLOCK
      ?auto_387619 - BLOCK
      ?auto_387620 - BLOCK
      ?auto_387621 - BLOCK
      ?auto_387622 - BLOCK
      ?auto_387623 - BLOCK
      ?auto_387624 - BLOCK
    )
    :vars
    (
      ?auto_387625 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387623 ) ( ON ?auto_387624 ?auto_387625 ) ( CLEAR ?auto_387624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387616 ) ( ON ?auto_387617 ?auto_387616 ) ( ON ?auto_387618 ?auto_387617 ) ( ON ?auto_387619 ?auto_387618 ) ( ON ?auto_387620 ?auto_387619 ) ( ON ?auto_387621 ?auto_387620 ) ( ON ?auto_387622 ?auto_387621 ) ( ON ?auto_387623 ?auto_387622 ) ( not ( = ?auto_387616 ?auto_387617 ) ) ( not ( = ?auto_387616 ?auto_387618 ) ) ( not ( = ?auto_387616 ?auto_387619 ) ) ( not ( = ?auto_387616 ?auto_387620 ) ) ( not ( = ?auto_387616 ?auto_387621 ) ) ( not ( = ?auto_387616 ?auto_387622 ) ) ( not ( = ?auto_387616 ?auto_387623 ) ) ( not ( = ?auto_387616 ?auto_387624 ) ) ( not ( = ?auto_387616 ?auto_387625 ) ) ( not ( = ?auto_387617 ?auto_387618 ) ) ( not ( = ?auto_387617 ?auto_387619 ) ) ( not ( = ?auto_387617 ?auto_387620 ) ) ( not ( = ?auto_387617 ?auto_387621 ) ) ( not ( = ?auto_387617 ?auto_387622 ) ) ( not ( = ?auto_387617 ?auto_387623 ) ) ( not ( = ?auto_387617 ?auto_387624 ) ) ( not ( = ?auto_387617 ?auto_387625 ) ) ( not ( = ?auto_387618 ?auto_387619 ) ) ( not ( = ?auto_387618 ?auto_387620 ) ) ( not ( = ?auto_387618 ?auto_387621 ) ) ( not ( = ?auto_387618 ?auto_387622 ) ) ( not ( = ?auto_387618 ?auto_387623 ) ) ( not ( = ?auto_387618 ?auto_387624 ) ) ( not ( = ?auto_387618 ?auto_387625 ) ) ( not ( = ?auto_387619 ?auto_387620 ) ) ( not ( = ?auto_387619 ?auto_387621 ) ) ( not ( = ?auto_387619 ?auto_387622 ) ) ( not ( = ?auto_387619 ?auto_387623 ) ) ( not ( = ?auto_387619 ?auto_387624 ) ) ( not ( = ?auto_387619 ?auto_387625 ) ) ( not ( = ?auto_387620 ?auto_387621 ) ) ( not ( = ?auto_387620 ?auto_387622 ) ) ( not ( = ?auto_387620 ?auto_387623 ) ) ( not ( = ?auto_387620 ?auto_387624 ) ) ( not ( = ?auto_387620 ?auto_387625 ) ) ( not ( = ?auto_387621 ?auto_387622 ) ) ( not ( = ?auto_387621 ?auto_387623 ) ) ( not ( = ?auto_387621 ?auto_387624 ) ) ( not ( = ?auto_387621 ?auto_387625 ) ) ( not ( = ?auto_387622 ?auto_387623 ) ) ( not ( = ?auto_387622 ?auto_387624 ) ) ( not ( = ?auto_387622 ?auto_387625 ) ) ( not ( = ?auto_387623 ?auto_387624 ) ) ( not ( = ?auto_387623 ?auto_387625 ) ) ( not ( = ?auto_387624 ?auto_387625 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387624 ?auto_387625 )
      ( !STACK ?auto_387624 ?auto_387623 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387635 - BLOCK
      ?auto_387636 - BLOCK
      ?auto_387637 - BLOCK
      ?auto_387638 - BLOCK
      ?auto_387639 - BLOCK
      ?auto_387640 - BLOCK
      ?auto_387641 - BLOCK
      ?auto_387642 - BLOCK
      ?auto_387643 - BLOCK
    )
    :vars
    (
      ?auto_387644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387643 ?auto_387644 ) ( ON-TABLE ?auto_387635 ) ( ON ?auto_387636 ?auto_387635 ) ( ON ?auto_387637 ?auto_387636 ) ( ON ?auto_387638 ?auto_387637 ) ( ON ?auto_387639 ?auto_387638 ) ( ON ?auto_387640 ?auto_387639 ) ( ON ?auto_387641 ?auto_387640 ) ( not ( = ?auto_387635 ?auto_387636 ) ) ( not ( = ?auto_387635 ?auto_387637 ) ) ( not ( = ?auto_387635 ?auto_387638 ) ) ( not ( = ?auto_387635 ?auto_387639 ) ) ( not ( = ?auto_387635 ?auto_387640 ) ) ( not ( = ?auto_387635 ?auto_387641 ) ) ( not ( = ?auto_387635 ?auto_387642 ) ) ( not ( = ?auto_387635 ?auto_387643 ) ) ( not ( = ?auto_387635 ?auto_387644 ) ) ( not ( = ?auto_387636 ?auto_387637 ) ) ( not ( = ?auto_387636 ?auto_387638 ) ) ( not ( = ?auto_387636 ?auto_387639 ) ) ( not ( = ?auto_387636 ?auto_387640 ) ) ( not ( = ?auto_387636 ?auto_387641 ) ) ( not ( = ?auto_387636 ?auto_387642 ) ) ( not ( = ?auto_387636 ?auto_387643 ) ) ( not ( = ?auto_387636 ?auto_387644 ) ) ( not ( = ?auto_387637 ?auto_387638 ) ) ( not ( = ?auto_387637 ?auto_387639 ) ) ( not ( = ?auto_387637 ?auto_387640 ) ) ( not ( = ?auto_387637 ?auto_387641 ) ) ( not ( = ?auto_387637 ?auto_387642 ) ) ( not ( = ?auto_387637 ?auto_387643 ) ) ( not ( = ?auto_387637 ?auto_387644 ) ) ( not ( = ?auto_387638 ?auto_387639 ) ) ( not ( = ?auto_387638 ?auto_387640 ) ) ( not ( = ?auto_387638 ?auto_387641 ) ) ( not ( = ?auto_387638 ?auto_387642 ) ) ( not ( = ?auto_387638 ?auto_387643 ) ) ( not ( = ?auto_387638 ?auto_387644 ) ) ( not ( = ?auto_387639 ?auto_387640 ) ) ( not ( = ?auto_387639 ?auto_387641 ) ) ( not ( = ?auto_387639 ?auto_387642 ) ) ( not ( = ?auto_387639 ?auto_387643 ) ) ( not ( = ?auto_387639 ?auto_387644 ) ) ( not ( = ?auto_387640 ?auto_387641 ) ) ( not ( = ?auto_387640 ?auto_387642 ) ) ( not ( = ?auto_387640 ?auto_387643 ) ) ( not ( = ?auto_387640 ?auto_387644 ) ) ( not ( = ?auto_387641 ?auto_387642 ) ) ( not ( = ?auto_387641 ?auto_387643 ) ) ( not ( = ?auto_387641 ?auto_387644 ) ) ( not ( = ?auto_387642 ?auto_387643 ) ) ( not ( = ?auto_387642 ?auto_387644 ) ) ( not ( = ?auto_387643 ?auto_387644 ) ) ( CLEAR ?auto_387641 ) ( ON ?auto_387642 ?auto_387643 ) ( CLEAR ?auto_387642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_387635 ?auto_387636 ?auto_387637 ?auto_387638 ?auto_387639 ?auto_387640 ?auto_387641 ?auto_387642 )
      ( MAKE-9PILE ?auto_387635 ?auto_387636 ?auto_387637 ?auto_387638 ?auto_387639 ?auto_387640 ?auto_387641 ?auto_387642 ?auto_387643 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387654 - BLOCK
      ?auto_387655 - BLOCK
      ?auto_387656 - BLOCK
      ?auto_387657 - BLOCK
      ?auto_387658 - BLOCK
      ?auto_387659 - BLOCK
      ?auto_387660 - BLOCK
      ?auto_387661 - BLOCK
      ?auto_387662 - BLOCK
    )
    :vars
    (
      ?auto_387663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387662 ?auto_387663 ) ( ON-TABLE ?auto_387654 ) ( ON ?auto_387655 ?auto_387654 ) ( ON ?auto_387656 ?auto_387655 ) ( ON ?auto_387657 ?auto_387656 ) ( ON ?auto_387658 ?auto_387657 ) ( ON ?auto_387659 ?auto_387658 ) ( ON ?auto_387660 ?auto_387659 ) ( not ( = ?auto_387654 ?auto_387655 ) ) ( not ( = ?auto_387654 ?auto_387656 ) ) ( not ( = ?auto_387654 ?auto_387657 ) ) ( not ( = ?auto_387654 ?auto_387658 ) ) ( not ( = ?auto_387654 ?auto_387659 ) ) ( not ( = ?auto_387654 ?auto_387660 ) ) ( not ( = ?auto_387654 ?auto_387661 ) ) ( not ( = ?auto_387654 ?auto_387662 ) ) ( not ( = ?auto_387654 ?auto_387663 ) ) ( not ( = ?auto_387655 ?auto_387656 ) ) ( not ( = ?auto_387655 ?auto_387657 ) ) ( not ( = ?auto_387655 ?auto_387658 ) ) ( not ( = ?auto_387655 ?auto_387659 ) ) ( not ( = ?auto_387655 ?auto_387660 ) ) ( not ( = ?auto_387655 ?auto_387661 ) ) ( not ( = ?auto_387655 ?auto_387662 ) ) ( not ( = ?auto_387655 ?auto_387663 ) ) ( not ( = ?auto_387656 ?auto_387657 ) ) ( not ( = ?auto_387656 ?auto_387658 ) ) ( not ( = ?auto_387656 ?auto_387659 ) ) ( not ( = ?auto_387656 ?auto_387660 ) ) ( not ( = ?auto_387656 ?auto_387661 ) ) ( not ( = ?auto_387656 ?auto_387662 ) ) ( not ( = ?auto_387656 ?auto_387663 ) ) ( not ( = ?auto_387657 ?auto_387658 ) ) ( not ( = ?auto_387657 ?auto_387659 ) ) ( not ( = ?auto_387657 ?auto_387660 ) ) ( not ( = ?auto_387657 ?auto_387661 ) ) ( not ( = ?auto_387657 ?auto_387662 ) ) ( not ( = ?auto_387657 ?auto_387663 ) ) ( not ( = ?auto_387658 ?auto_387659 ) ) ( not ( = ?auto_387658 ?auto_387660 ) ) ( not ( = ?auto_387658 ?auto_387661 ) ) ( not ( = ?auto_387658 ?auto_387662 ) ) ( not ( = ?auto_387658 ?auto_387663 ) ) ( not ( = ?auto_387659 ?auto_387660 ) ) ( not ( = ?auto_387659 ?auto_387661 ) ) ( not ( = ?auto_387659 ?auto_387662 ) ) ( not ( = ?auto_387659 ?auto_387663 ) ) ( not ( = ?auto_387660 ?auto_387661 ) ) ( not ( = ?auto_387660 ?auto_387662 ) ) ( not ( = ?auto_387660 ?auto_387663 ) ) ( not ( = ?auto_387661 ?auto_387662 ) ) ( not ( = ?auto_387661 ?auto_387663 ) ) ( not ( = ?auto_387662 ?auto_387663 ) ) ( CLEAR ?auto_387660 ) ( ON ?auto_387661 ?auto_387662 ) ( CLEAR ?auto_387661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_387654 ?auto_387655 ?auto_387656 ?auto_387657 ?auto_387658 ?auto_387659 ?auto_387660 ?auto_387661 )
      ( MAKE-9PILE ?auto_387654 ?auto_387655 ?auto_387656 ?auto_387657 ?auto_387658 ?auto_387659 ?auto_387660 ?auto_387661 ?auto_387662 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387673 - BLOCK
      ?auto_387674 - BLOCK
      ?auto_387675 - BLOCK
      ?auto_387676 - BLOCK
      ?auto_387677 - BLOCK
      ?auto_387678 - BLOCK
      ?auto_387679 - BLOCK
      ?auto_387680 - BLOCK
      ?auto_387681 - BLOCK
    )
    :vars
    (
      ?auto_387682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387681 ?auto_387682 ) ( ON-TABLE ?auto_387673 ) ( ON ?auto_387674 ?auto_387673 ) ( ON ?auto_387675 ?auto_387674 ) ( ON ?auto_387676 ?auto_387675 ) ( ON ?auto_387677 ?auto_387676 ) ( ON ?auto_387678 ?auto_387677 ) ( not ( = ?auto_387673 ?auto_387674 ) ) ( not ( = ?auto_387673 ?auto_387675 ) ) ( not ( = ?auto_387673 ?auto_387676 ) ) ( not ( = ?auto_387673 ?auto_387677 ) ) ( not ( = ?auto_387673 ?auto_387678 ) ) ( not ( = ?auto_387673 ?auto_387679 ) ) ( not ( = ?auto_387673 ?auto_387680 ) ) ( not ( = ?auto_387673 ?auto_387681 ) ) ( not ( = ?auto_387673 ?auto_387682 ) ) ( not ( = ?auto_387674 ?auto_387675 ) ) ( not ( = ?auto_387674 ?auto_387676 ) ) ( not ( = ?auto_387674 ?auto_387677 ) ) ( not ( = ?auto_387674 ?auto_387678 ) ) ( not ( = ?auto_387674 ?auto_387679 ) ) ( not ( = ?auto_387674 ?auto_387680 ) ) ( not ( = ?auto_387674 ?auto_387681 ) ) ( not ( = ?auto_387674 ?auto_387682 ) ) ( not ( = ?auto_387675 ?auto_387676 ) ) ( not ( = ?auto_387675 ?auto_387677 ) ) ( not ( = ?auto_387675 ?auto_387678 ) ) ( not ( = ?auto_387675 ?auto_387679 ) ) ( not ( = ?auto_387675 ?auto_387680 ) ) ( not ( = ?auto_387675 ?auto_387681 ) ) ( not ( = ?auto_387675 ?auto_387682 ) ) ( not ( = ?auto_387676 ?auto_387677 ) ) ( not ( = ?auto_387676 ?auto_387678 ) ) ( not ( = ?auto_387676 ?auto_387679 ) ) ( not ( = ?auto_387676 ?auto_387680 ) ) ( not ( = ?auto_387676 ?auto_387681 ) ) ( not ( = ?auto_387676 ?auto_387682 ) ) ( not ( = ?auto_387677 ?auto_387678 ) ) ( not ( = ?auto_387677 ?auto_387679 ) ) ( not ( = ?auto_387677 ?auto_387680 ) ) ( not ( = ?auto_387677 ?auto_387681 ) ) ( not ( = ?auto_387677 ?auto_387682 ) ) ( not ( = ?auto_387678 ?auto_387679 ) ) ( not ( = ?auto_387678 ?auto_387680 ) ) ( not ( = ?auto_387678 ?auto_387681 ) ) ( not ( = ?auto_387678 ?auto_387682 ) ) ( not ( = ?auto_387679 ?auto_387680 ) ) ( not ( = ?auto_387679 ?auto_387681 ) ) ( not ( = ?auto_387679 ?auto_387682 ) ) ( not ( = ?auto_387680 ?auto_387681 ) ) ( not ( = ?auto_387680 ?auto_387682 ) ) ( not ( = ?auto_387681 ?auto_387682 ) ) ( ON ?auto_387680 ?auto_387681 ) ( CLEAR ?auto_387678 ) ( ON ?auto_387679 ?auto_387680 ) ( CLEAR ?auto_387679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387673 ?auto_387674 ?auto_387675 ?auto_387676 ?auto_387677 ?auto_387678 ?auto_387679 )
      ( MAKE-9PILE ?auto_387673 ?auto_387674 ?auto_387675 ?auto_387676 ?auto_387677 ?auto_387678 ?auto_387679 ?auto_387680 ?auto_387681 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387692 - BLOCK
      ?auto_387693 - BLOCK
      ?auto_387694 - BLOCK
      ?auto_387695 - BLOCK
      ?auto_387696 - BLOCK
      ?auto_387697 - BLOCK
      ?auto_387698 - BLOCK
      ?auto_387699 - BLOCK
      ?auto_387700 - BLOCK
    )
    :vars
    (
      ?auto_387701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387700 ?auto_387701 ) ( ON-TABLE ?auto_387692 ) ( ON ?auto_387693 ?auto_387692 ) ( ON ?auto_387694 ?auto_387693 ) ( ON ?auto_387695 ?auto_387694 ) ( ON ?auto_387696 ?auto_387695 ) ( ON ?auto_387697 ?auto_387696 ) ( not ( = ?auto_387692 ?auto_387693 ) ) ( not ( = ?auto_387692 ?auto_387694 ) ) ( not ( = ?auto_387692 ?auto_387695 ) ) ( not ( = ?auto_387692 ?auto_387696 ) ) ( not ( = ?auto_387692 ?auto_387697 ) ) ( not ( = ?auto_387692 ?auto_387698 ) ) ( not ( = ?auto_387692 ?auto_387699 ) ) ( not ( = ?auto_387692 ?auto_387700 ) ) ( not ( = ?auto_387692 ?auto_387701 ) ) ( not ( = ?auto_387693 ?auto_387694 ) ) ( not ( = ?auto_387693 ?auto_387695 ) ) ( not ( = ?auto_387693 ?auto_387696 ) ) ( not ( = ?auto_387693 ?auto_387697 ) ) ( not ( = ?auto_387693 ?auto_387698 ) ) ( not ( = ?auto_387693 ?auto_387699 ) ) ( not ( = ?auto_387693 ?auto_387700 ) ) ( not ( = ?auto_387693 ?auto_387701 ) ) ( not ( = ?auto_387694 ?auto_387695 ) ) ( not ( = ?auto_387694 ?auto_387696 ) ) ( not ( = ?auto_387694 ?auto_387697 ) ) ( not ( = ?auto_387694 ?auto_387698 ) ) ( not ( = ?auto_387694 ?auto_387699 ) ) ( not ( = ?auto_387694 ?auto_387700 ) ) ( not ( = ?auto_387694 ?auto_387701 ) ) ( not ( = ?auto_387695 ?auto_387696 ) ) ( not ( = ?auto_387695 ?auto_387697 ) ) ( not ( = ?auto_387695 ?auto_387698 ) ) ( not ( = ?auto_387695 ?auto_387699 ) ) ( not ( = ?auto_387695 ?auto_387700 ) ) ( not ( = ?auto_387695 ?auto_387701 ) ) ( not ( = ?auto_387696 ?auto_387697 ) ) ( not ( = ?auto_387696 ?auto_387698 ) ) ( not ( = ?auto_387696 ?auto_387699 ) ) ( not ( = ?auto_387696 ?auto_387700 ) ) ( not ( = ?auto_387696 ?auto_387701 ) ) ( not ( = ?auto_387697 ?auto_387698 ) ) ( not ( = ?auto_387697 ?auto_387699 ) ) ( not ( = ?auto_387697 ?auto_387700 ) ) ( not ( = ?auto_387697 ?auto_387701 ) ) ( not ( = ?auto_387698 ?auto_387699 ) ) ( not ( = ?auto_387698 ?auto_387700 ) ) ( not ( = ?auto_387698 ?auto_387701 ) ) ( not ( = ?auto_387699 ?auto_387700 ) ) ( not ( = ?auto_387699 ?auto_387701 ) ) ( not ( = ?auto_387700 ?auto_387701 ) ) ( ON ?auto_387699 ?auto_387700 ) ( CLEAR ?auto_387697 ) ( ON ?auto_387698 ?auto_387699 ) ( CLEAR ?auto_387698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_387692 ?auto_387693 ?auto_387694 ?auto_387695 ?auto_387696 ?auto_387697 ?auto_387698 )
      ( MAKE-9PILE ?auto_387692 ?auto_387693 ?auto_387694 ?auto_387695 ?auto_387696 ?auto_387697 ?auto_387698 ?auto_387699 ?auto_387700 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387711 - BLOCK
      ?auto_387712 - BLOCK
      ?auto_387713 - BLOCK
      ?auto_387714 - BLOCK
      ?auto_387715 - BLOCK
      ?auto_387716 - BLOCK
      ?auto_387717 - BLOCK
      ?auto_387718 - BLOCK
      ?auto_387719 - BLOCK
    )
    :vars
    (
      ?auto_387720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387719 ?auto_387720 ) ( ON-TABLE ?auto_387711 ) ( ON ?auto_387712 ?auto_387711 ) ( ON ?auto_387713 ?auto_387712 ) ( ON ?auto_387714 ?auto_387713 ) ( ON ?auto_387715 ?auto_387714 ) ( not ( = ?auto_387711 ?auto_387712 ) ) ( not ( = ?auto_387711 ?auto_387713 ) ) ( not ( = ?auto_387711 ?auto_387714 ) ) ( not ( = ?auto_387711 ?auto_387715 ) ) ( not ( = ?auto_387711 ?auto_387716 ) ) ( not ( = ?auto_387711 ?auto_387717 ) ) ( not ( = ?auto_387711 ?auto_387718 ) ) ( not ( = ?auto_387711 ?auto_387719 ) ) ( not ( = ?auto_387711 ?auto_387720 ) ) ( not ( = ?auto_387712 ?auto_387713 ) ) ( not ( = ?auto_387712 ?auto_387714 ) ) ( not ( = ?auto_387712 ?auto_387715 ) ) ( not ( = ?auto_387712 ?auto_387716 ) ) ( not ( = ?auto_387712 ?auto_387717 ) ) ( not ( = ?auto_387712 ?auto_387718 ) ) ( not ( = ?auto_387712 ?auto_387719 ) ) ( not ( = ?auto_387712 ?auto_387720 ) ) ( not ( = ?auto_387713 ?auto_387714 ) ) ( not ( = ?auto_387713 ?auto_387715 ) ) ( not ( = ?auto_387713 ?auto_387716 ) ) ( not ( = ?auto_387713 ?auto_387717 ) ) ( not ( = ?auto_387713 ?auto_387718 ) ) ( not ( = ?auto_387713 ?auto_387719 ) ) ( not ( = ?auto_387713 ?auto_387720 ) ) ( not ( = ?auto_387714 ?auto_387715 ) ) ( not ( = ?auto_387714 ?auto_387716 ) ) ( not ( = ?auto_387714 ?auto_387717 ) ) ( not ( = ?auto_387714 ?auto_387718 ) ) ( not ( = ?auto_387714 ?auto_387719 ) ) ( not ( = ?auto_387714 ?auto_387720 ) ) ( not ( = ?auto_387715 ?auto_387716 ) ) ( not ( = ?auto_387715 ?auto_387717 ) ) ( not ( = ?auto_387715 ?auto_387718 ) ) ( not ( = ?auto_387715 ?auto_387719 ) ) ( not ( = ?auto_387715 ?auto_387720 ) ) ( not ( = ?auto_387716 ?auto_387717 ) ) ( not ( = ?auto_387716 ?auto_387718 ) ) ( not ( = ?auto_387716 ?auto_387719 ) ) ( not ( = ?auto_387716 ?auto_387720 ) ) ( not ( = ?auto_387717 ?auto_387718 ) ) ( not ( = ?auto_387717 ?auto_387719 ) ) ( not ( = ?auto_387717 ?auto_387720 ) ) ( not ( = ?auto_387718 ?auto_387719 ) ) ( not ( = ?auto_387718 ?auto_387720 ) ) ( not ( = ?auto_387719 ?auto_387720 ) ) ( ON ?auto_387718 ?auto_387719 ) ( ON ?auto_387717 ?auto_387718 ) ( CLEAR ?auto_387715 ) ( ON ?auto_387716 ?auto_387717 ) ( CLEAR ?auto_387716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387711 ?auto_387712 ?auto_387713 ?auto_387714 ?auto_387715 ?auto_387716 )
      ( MAKE-9PILE ?auto_387711 ?auto_387712 ?auto_387713 ?auto_387714 ?auto_387715 ?auto_387716 ?auto_387717 ?auto_387718 ?auto_387719 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387730 - BLOCK
      ?auto_387731 - BLOCK
      ?auto_387732 - BLOCK
      ?auto_387733 - BLOCK
      ?auto_387734 - BLOCK
      ?auto_387735 - BLOCK
      ?auto_387736 - BLOCK
      ?auto_387737 - BLOCK
      ?auto_387738 - BLOCK
    )
    :vars
    (
      ?auto_387739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387738 ?auto_387739 ) ( ON-TABLE ?auto_387730 ) ( ON ?auto_387731 ?auto_387730 ) ( ON ?auto_387732 ?auto_387731 ) ( ON ?auto_387733 ?auto_387732 ) ( ON ?auto_387734 ?auto_387733 ) ( not ( = ?auto_387730 ?auto_387731 ) ) ( not ( = ?auto_387730 ?auto_387732 ) ) ( not ( = ?auto_387730 ?auto_387733 ) ) ( not ( = ?auto_387730 ?auto_387734 ) ) ( not ( = ?auto_387730 ?auto_387735 ) ) ( not ( = ?auto_387730 ?auto_387736 ) ) ( not ( = ?auto_387730 ?auto_387737 ) ) ( not ( = ?auto_387730 ?auto_387738 ) ) ( not ( = ?auto_387730 ?auto_387739 ) ) ( not ( = ?auto_387731 ?auto_387732 ) ) ( not ( = ?auto_387731 ?auto_387733 ) ) ( not ( = ?auto_387731 ?auto_387734 ) ) ( not ( = ?auto_387731 ?auto_387735 ) ) ( not ( = ?auto_387731 ?auto_387736 ) ) ( not ( = ?auto_387731 ?auto_387737 ) ) ( not ( = ?auto_387731 ?auto_387738 ) ) ( not ( = ?auto_387731 ?auto_387739 ) ) ( not ( = ?auto_387732 ?auto_387733 ) ) ( not ( = ?auto_387732 ?auto_387734 ) ) ( not ( = ?auto_387732 ?auto_387735 ) ) ( not ( = ?auto_387732 ?auto_387736 ) ) ( not ( = ?auto_387732 ?auto_387737 ) ) ( not ( = ?auto_387732 ?auto_387738 ) ) ( not ( = ?auto_387732 ?auto_387739 ) ) ( not ( = ?auto_387733 ?auto_387734 ) ) ( not ( = ?auto_387733 ?auto_387735 ) ) ( not ( = ?auto_387733 ?auto_387736 ) ) ( not ( = ?auto_387733 ?auto_387737 ) ) ( not ( = ?auto_387733 ?auto_387738 ) ) ( not ( = ?auto_387733 ?auto_387739 ) ) ( not ( = ?auto_387734 ?auto_387735 ) ) ( not ( = ?auto_387734 ?auto_387736 ) ) ( not ( = ?auto_387734 ?auto_387737 ) ) ( not ( = ?auto_387734 ?auto_387738 ) ) ( not ( = ?auto_387734 ?auto_387739 ) ) ( not ( = ?auto_387735 ?auto_387736 ) ) ( not ( = ?auto_387735 ?auto_387737 ) ) ( not ( = ?auto_387735 ?auto_387738 ) ) ( not ( = ?auto_387735 ?auto_387739 ) ) ( not ( = ?auto_387736 ?auto_387737 ) ) ( not ( = ?auto_387736 ?auto_387738 ) ) ( not ( = ?auto_387736 ?auto_387739 ) ) ( not ( = ?auto_387737 ?auto_387738 ) ) ( not ( = ?auto_387737 ?auto_387739 ) ) ( not ( = ?auto_387738 ?auto_387739 ) ) ( ON ?auto_387737 ?auto_387738 ) ( ON ?auto_387736 ?auto_387737 ) ( CLEAR ?auto_387734 ) ( ON ?auto_387735 ?auto_387736 ) ( CLEAR ?auto_387735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_387730 ?auto_387731 ?auto_387732 ?auto_387733 ?auto_387734 ?auto_387735 )
      ( MAKE-9PILE ?auto_387730 ?auto_387731 ?auto_387732 ?auto_387733 ?auto_387734 ?auto_387735 ?auto_387736 ?auto_387737 ?auto_387738 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387749 - BLOCK
      ?auto_387750 - BLOCK
      ?auto_387751 - BLOCK
      ?auto_387752 - BLOCK
      ?auto_387753 - BLOCK
      ?auto_387754 - BLOCK
      ?auto_387755 - BLOCK
      ?auto_387756 - BLOCK
      ?auto_387757 - BLOCK
    )
    :vars
    (
      ?auto_387758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387757 ?auto_387758 ) ( ON-TABLE ?auto_387749 ) ( ON ?auto_387750 ?auto_387749 ) ( ON ?auto_387751 ?auto_387750 ) ( ON ?auto_387752 ?auto_387751 ) ( not ( = ?auto_387749 ?auto_387750 ) ) ( not ( = ?auto_387749 ?auto_387751 ) ) ( not ( = ?auto_387749 ?auto_387752 ) ) ( not ( = ?auto_387749 ?auto_387753 ) ) ( not ( = ?auto_387749 ?auto_387754 ) ) ( not ( = ?auto_387749 ?auto_387755 ) ) ( not ( = ?auto_387749 ?auto_387756 ) ) ( not ( = ?auto_387749 ?auto_387757 ) ) ( not ( = ?auto_387749 ?auto_387758 ) ) ( not ( = ?auto_387750 ?auto_387751 ) ) ( not ( = ?auto_387750 ?auto_387752 ) ) ( not ( = ?auto_387750 ?auto_387753 ) ) ( not ( = ?auto_387750 ?auto_387754 ) ) ( not ( = ?auto_387750 ?auto_387755 ) ) ( not ( = ?auto_387750 ?auto_387756 ) ) ( not ( = ?auto_387750 ?auto_387757 ) ) ( not ( = ?auto_387750 ?auto_387758 ) ) ( not ( = ?auto_387751 ?auto_387752 ) ) ( not ( = ?auto_387751 ?auto_387753 ) ) ( not ( = ?auto_387751 ?auto_387754 ) ) ( not ( = ?auto_387751 ?auto_387755 ) ) ( not ( = ?auto_387751 ?auto_387756 ) ) ( not ( = ?auto_387751 ?auto_387757 ) ) ( not ( = ?auto_387751 ?auto_387758 ) ) ( not ( = ?auto_387752 ?auto_387753 ) ) ( not ( = ?auto_387752 ?auto_387754 ) ) ( not ( = ?auto_387752 ?auto_387755 ) ) ( not ( = ?auto_387752 ?auto_387756 ) ) ( not ( = ?auto_387752 ?auto_387757 ) ) ( not ( = ?auto_387752 ?auto_387758 ) ) ( not ( = ?auto_387753 ?auto_387754 ) ) ( not ( = ?auto_387753 ?auto_387755 ) ) ( not ( = ?auto_387753 ?auto_387756 ) ) ( not ( = ?auto_387753 ?auto_387757 ) ) ( not ( = ?auto_387753 ?auto_387758 ) ) ( not ( = ?auto_387754 ?auto_387755 ) ) ( not ( = ?auto_387754 ?auto_387756 ) ) ( not ( = ?auto_387754 ?auto_387757 ) ) ( not ( = ?auto_387754 ?auto_387758 ) ) ( not ( = ?auto_387755 ?auto_387756 ) ) ( not ( = ?auto_387755 ?auto_387757 ) ) ( not ( = ?auto_387755 ?auto_387758 ) ) ( not ( = ?auto_387756 ?auto_387757 ) ) ( not ( = ?auto_387756 ?auto_387758 ) ) ( not ( = ?auto_387757 ?auto_387758 ) ) ( ON ?auto_387756 ?auto_387757 ) ( ON ?auto_387755 ?auto_387756 ) ( ON ?auto_387754 ?auto_387755 ) ( CLEAR ?auto_387752 ) ( ON ?auto_387753 ?auto_387754 ) ( CLEAR ?auto_387753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387749 ?auto_387750 ?auto_387751 ?auto_387752 ?auto_387753 )
      ( MAKE-9PILE ?auto_387749 ?auto_387750 ?auto_387751 ?auto_387752 ?auto_387753 ?auto_387754 ?auto_387755 ?auto_387756 ?auto_387757 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387768 - BLOCK
      ?auto_387769 - BLOCK
      ?auto_387770 - BLOCK
      ?auto_387771 - BLOCK
      ?auto_387772 - BLOCK
      ?auto_387773 - BLOCK
      ?auto_387774 - BLOCK
      ?auto_387775 - BLOCK
      ?auto_387776 - BLOCK
    )
    :vars
    (
      ?auto_387777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387776 ?auto_387777 ) ( ON-TABLE ?auto_387768 ) ( ON ?auto_387769 ?auto_387768 ) ( ON ?auto_387770 ?auto_387769 ) ( ON ?auto_387771 ?auto_387770 ) ( not ( = ?auto_387768 ?auto_387769 ) ) ( not ( = ?auto_387768 ?auto_387770 ) ) ( not ( = ?auto_387768 ?auto_387771 ) ) ( not ( = ?auto_387768 ?auto_387772 ) ) ( not ( = ?auto_387768 ?auto_387773 ) ) ( not ( = ?auto_387768 ?auto_387774 ) ) ( not ( = ?auto_387768 ?auto_387775 ) ) ( not ( = ?auto_387768 ?auto_387776 ) ) ( not ( = ?auto_387768 ?auto_387777 ) ) ( not ( = ?auto_387769 ?auto_387770 ) ) ( not ( = ?auto_387769 ?auto_387771 ) ) ( not ( = ?auto_387769 ?auto_387772 ) ) ( not ( = ?auto_387769 ?auto_387773 ) ) ( not ( = ?auto_387769 ?auto_387774 ) ) ( not ( = ?auto_387769 ?auto_387775 ) ) ( not ( = ?auto_387769 ?auto_387776 ) ) ( not ( = ?auto_387769 ?auto_387777 ) ) ( not ( = ?auto_387770 ?auto_387771 ) ) ( not ( = ?auto_387770 ?auto_387772 ) ) ( not ( = ?auto_387770 ?auto_387773 ) ) ( not ( = ?auto_387770 ?auto_387774 ) ) ( not ( = ?auto_387770 ?auto_387775 ) ) ( not ( = ?auto_387770 ?auto_387776 ) ) ( not ( = ?auto_387770 ?auto_387777 ) ) ( not ( = ?auto_387771 ?auto_387772 ) ) ( not ( = ?auto_387771 ?auto_387773 ) ) ( not ( = ?auto_387771 ?auto_387774 ) ) ( not ( = ?auto_387771 ?auto_387775 ) ) ( not ( = ?auto_387771 ?auto_387776 ) ) ( not ( = ?auto_387771 ?auto_387777 ) ) ( not ( = ?auto_387772 ?auto_387773 ) ) ( not ( = ?auto_387772 ?auto_387774 ) ) ( not ( = ?auto_387772 ?auto_387775 ) ) ( not ( = ?auto_387772 ?auto_387776 ) ) ( not ( = ?auto_387772 ?auto_387777 ) ) ( not ( = ?auto_387773 ?auto_387774 ) ) ( not ( = ?auto_387773 ?auto_387775 ) ) ( not ( = ?auto_387773 ?auto_387776 ) ) ( not ( = ?auto_387773 ?auto_387777 ) ) ( not ( = ?auto_387774 ?auto_387775 ) ) ( not ( = ?auto_387774 ?auto_387776 ) ) ( not ( = ?auto_387774 ?auto_387777 ) ) ( not ( = ?auto_387775 ?auto_387776 ) ) ( not ( = ?auto_387775 ?auto_387777 ) ) ( not ( = ?auto_387776 ?auto_387777 ) ) ( ON ?auto_387775 ?auto_387776 ) ( ON ?auto_387774 ?auto_387775 ) ( ON ?auto_387773 ?auto_387774 ) ( CLEAR ?auto_387771 ) ( ON ?auto_387772 ?auto_387773 ) ( CLEAR ?auto_387772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_387768 ?auto_387769 ?auto_387770 ?auto_387771 ?auto_387772 )
      ( MAKE-9PILE ?auto_387768 ?auto_387769 ?auto_387770 ?auto_387771 ?auto_387772 ?auto_387773 ?auto_387774 ?auto_387775 ?auto_387776 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387787 - BLOCK
      ?auto_387788 - BLOCK
      ?auto_387789 - BLOCK
      ?auto_387790 - BLOCK
      ?auto_387791 - BLOCK
      ?auto_387792 - BLOCK
      ?auto_387793 - BLOCK
      ?auto_387794 - BLOCK
      ?auto_387795 - BLOCK
    )
    :vars
    (
      ?auto_387796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387795 ?auto_387796 ) ( ON-TABLE ?auto_387787 ) ( ON ?auto_387788 ?auto_387787 ) ( ON ?auto_387789 ?auto_387788 ) ( not ( = ?auto_387787 ?auto_387788 ) ) ( not ( = ?auto_387787 ?auto_387789 ) ) ( not ( = ?auto_387787 ?auto_387790 ) ) ( not ( = ?auto_387787 ?auto_387791 ) ) ( not ( = ?auto_387787 ?auto_387792 ) ) ( not ( = ?auto_387787 ?auto_387793 ) ) ( not ( = ?auto_387787 ?auto_387794 ) ) ( not ( = ?auto_387787 ?auto_387795 ) ) ( not ( = ?auto_387787 ?auto_387796 ) ) ( not ( = ?auto_387788 ?auto_387789 ) ) ( not ( = ?auto_387788 ?auto_387790 ) ) ( not ( = ?auto_387788 ?auto_387791 ) ) ( not ( = ?auto_387788 ?auto_387792 ) ) ( not ( = ?auto_387788 ?auto_387793 ) ) ( not ( = ?auto_387788 ?auto_387794 ) ) ( not ( = ?auto_387788 ?auto_387795 ) ) ( not ( = ?auto_387788 ?auto_387796 ) ) ( not ( = ?auto_387789 ?auto_387790 ) ) ( not ( = ?auto_387789 ?auto_387791 ) ) ( not ( = ?auto_387789 ?auto_387792 ) ) ( not ( = ?auto_387789 ?auto_387793 ) ) ( not ( = ?auto_387789 ?auto_387794 ) ) ( not ( = ?auto_387789 ?auto_387795 ) ) ( not ( = ?auto_387789 ?auto_387796 ) ) ( not ( = ?auto_387790 ?auto_387791 ) ) ( not ( = ?auto_387790 ?auto_387792 ) ) ( not ( = ?auto_387790 ?auto_387793 ) ) ( not ( = ?auto_387790 ?auto_387794 ) ) ( not ( = ?auto_387790 ?auto_387795 ) ) ( not ( = ?auto_387790 ?auto_387796 ) ) ( not ( = ?auto_387791 ?auto_387792 ) ) ( not ( = ?auto_387791 ?auto_387793 ) ) ( not ( = ?auto_387791 ?auto_387794 ) ) ( not ( = ?auto_387791 ?auto_387795 ) ) ( not ( = ?auto_387791 ?auto_387796 ) ) ( not ( = ?auto_387792 ?auto_387793 ) ) ( not ( = ?auto_387792 ?auto_387794 ) ) ( not ( = ?auto_387792 ?auto_387795 ) ) ( not ( = ?auto_387792 ?auto_387796 ) ) ( not ( = ?auto_387793 ?auto_387794 ) ) ( not ( = ?auto_387793 ?auto_387795 ) ) ( not ( = ?auto_387793 ?auto_387796 ) ) ( not ( = ?auto_387794 ?auto_387795 ) ) ( not ( = ?auto_387794 ?auto_387796 ) ) ( not ( = ?auto_387795 ?auto_387796 ) ) ( ON ?auto_387794 ?auto_387795 ) ( ON ?auto_387793 ?auto_387794 ) ( ON ?auto_387792 ?auto_387793 ) ( ON ?auto_387791 ?auto_387792 ) ( CLEAR ?auto_387789 ) ( ON ?auto_387790 ?auto_387791 ) ( CLEAR ?auto_387790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387787 ?auto_387788 ?auto_387789 ?auto_387790 )
      ( MAKE-9PILE ?auto_387787 ?auto_387788 ?auto_387789 ?auto_387790 ?auto_387791 ?auto_387792 ?auto_387793 ?auto_387794 ?auto_387795 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387806 - BLOCK
      ?auto_387807 - BLOCK
      ?auto_387808 - BLOCK
      ?auto_387809 - BLOCK
      ?auto_387810 - BLOCK
      ?auto_387811 - BLOCK
      ?auto_387812 - BLOCK
      ?auto_387813 - BLOCK
      ?auto_387814 - BLOCK
    )
    :vars
    (
      ?auto_387815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387814 ?auto_387815 ) ( ON-TABLE ?auto_387806 ) ( ON ?auto_387807 ?auto_387806 ) ( ON ?auto_387808 ?auto_387807 ) ( not ( = ?auto_387806 ?auto_387807 ) ) ( not ( = ?auto_387806 ?auto_387808 ) ) ( not ( = ?auto_387806 ?auto_387809 ) ) ( not ( = ?auto_387806 ?auto_387810 ) ) ( not ( = ?auto_387806 ?auto_387811 ) ) ( not ( = ?auto_387806 ?auto_387812 ) ) ( not ( = ?auto_387806 ?auto_387813 ) ) ( not ( = ?auto_387806 ?auto_387814 ) ) ( not ( = ?auto_387806 ?auto_387815 ) ) ( not ( = ?auto_387807 ?auto_387808 ) ) ( not ( = ?auto_387807 ?auto_387809 ) ) ( not ( = ?auto_387807 ?auto_387810 ) ) ( not ( = ?auto_387807 ?auto_387811 ) ) ( not ( = ?auto_387807 ?auto_387812 ) ) ( not ( = ?auto_387807 ?auto_387813 ) ) ( not ( = ?auto_387807 ?auto_387814 ) ) ( not ( = ?auto_387807 ?auto_387815 ) ) ( not ( = ?auto_387808 ?auto_387809 ) ) ( not ( = ?auto_387808 ?auto_387810 ) ) ( not ( = ?auto_387808 ?auto_387811 ) ) ( not ( = ?auto_387808 ?auto_387812 ) ) ( not ( = ?auto_387808 ?auto_387813 ) ) ( not ( = ?auto_387808 ?auto_387814 ) ) ( not ( = ?auto_387808 ?auto_387815 ) ) ( not ( = ?auto_387809 ?auto_387810 ) ) ( not ( = ?auto_387809 ?auto_387811 ) ) ( not ( = ?auto_387809 ?auto_387812 ) ) ( not ( = ?auto_387809 ?auto_387813 ) ) ( not ( = ?auto_387809 ?auto_387814 ) ) ( not ( = ?auto_387809 ?auto_387815 ) ) ( not ( = ?auto_387810 ?auto_387811 ) ) ( not ( = ?auto_387810 ?auto_387812 ) ) ( not ( = ?auto_387810 ?auto_387813 ) ) ( not ( = ?auto_387810 ?auto_387814 ) ) ( not ( = ?auto_387810 ?auto_387815 ) ) ( not ( = ?auto_387811 ?auto_387812 ) ) ( not ( = ?auto_387811 ?auto_387813 ) ) ( not ( = ?auto_387811 ?auto_387814 ) ) ( not ( = ?auto_387811 ?auto_387815 ) ) ( not ( = ?auto_387812 ?auto_387813 ) ) ( not ( = ?auto_387812 ?auto_387814 ) ) ( not ( = ?auto_387812 ?auto_387815 ) ) ( not ( = ?auto_387813 ?auto_387814 ) ) ( not ( = ?auto_387813 ?auto_387815 ) ) ( not ( = ?auto_387814 ?auto_387815 ) ) ( ON ?auto_387813 ?auto_387814 ) ( ON ?auto_387812 ?auto_387813 ) ( ON ?auto_387811 ?auto_387812 ) ( ON ?auto_387810 ?auto_387811 ) ( CLEAR ?auto_387808 ) ( ON ?auto_387809 ?auto_387810 ) ( CLEAR ?auto_387809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_387806 ?auto_387807 ?auto_387808 ?auto_387809 )
      ( MAKE-9PILE ?auto_387806 ?auto_387807 ?auto_387808 ?auto_387809 ?auto_387810 ?auto_387811 ?auto_387812 ?auto_387813 ?auto_387814 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387825 - BLOCK
      ?auto_387826 - BLOCK
      ?auto_387827 - BLOCK
      ?auto_387828 - BLOCK
      ?auto_387829 - BLOCK
      ?auto_387830 - BLOCK
      ?auto_387831 - BLOCK
      ?auto_387832 - BLOCK
      ?auto_387833 - BLOCK
    )
    :vars
    (
      ?auto_387834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387833 ?auto_387834 ) ( ON-TABLE ?auto_387825 ) ( ON ?auto_387826 ?auto_387825 ) ( not ( = ?auto_387825 ?auto_387826 ) ) ( not ( = ?auto_387825 ?auto_387827 ) ) ( not ( = ?auto_387825 ?auto_387828 ) ) ( not ( = ?auto_387825 ?auto_387829 ) ) ( not ( = ?auto_387825 ?auto_387830 ) ) ( not ( = ?auto_387825 ?auto_387831 ) ) ( not ( = ?auto_387825 ?auto_387832 ) ) ( not ( = ?auto_387825 ?auto_387833 ) ) ( not ( = ?auto_387825 ?auto_387834 ) ) ( not ( = ?auto_387826 ?auto_387827 ) ) ( not ( = ?auto_387826 ?auto_387828 ) ) ( not ( = ?auto_387826 ?auto_387829 ) ) ( not ( = ?auto_387826 ?auto_387830 ) ) ( not ( = ?auto_387826 ?auto_387831 ) ) ( not ( = ?auto_387826 ?auto_387832 ) ) ( not ( = ?auto_387826 ?auto_387833 ) ) ( not ( = ?auto_387826 ?auto_387834 ) ) ( not ( = ?auto_387827 ?auto_387828 ) ) ( not ( = ?auto_387827 ?auto_387829 ) ) ( not ( = ?auto_387827 ?auto_387830 ) ) ( not ( = ?auto_387827 ?auto_387831 ) ) ( not ( = ?auto_387827 ?auto_387832 ) ) ( not ( = ?auto_387827 ?auto_387833 ) ) ( not ( = ?auto_387827 ?auto_387834 ) ) ( not ( = ?auto_387828 ?auto_387829 ) ) ( not ( = ?auto_387828 ?auto_387830 ) ) ( not ( = ?auto_387828 ?auto_387831 ) ) ( not ( = ?auto_387828 ?auto_387832 ) ) ( not ( = ?auto_387828 ?auto_387833 ) ) ( not ( = ?auto_387828 ?auto_387834 ) ) ( not ( = ?auto_387829 ?auto_387830 ) ) ( not ( = ?auto_387829 ?auto_387831 ) ) ( not ( = ?auto_387829 ?auto_387832 ) ) ( not ( = ?auto_387829 ?auto_387833 ) ) ( not ( = ?auto_387829 ?auto_387834 ) ) ( not ( = ?auto_387830 ?auto_387831 ) ) ( not ( = ?auto_387830 ?auto_387832 ) ) ( not ( = ?auto_387830 ?auto_387833 ) ) ( not ( = ?auto_387830 ?auto_387834 ) ) ( not ( = ?auto_387831 ?auto_387832 ) ) ( not ( = ?auto_387831 ?auto_387833 ) ) ( not ( = ?auto_387831 ?auto_387834 ) ) ( not ( = ?auto_387832 ?auto_387833 ) ) ( not ( = ?auto_387832 ?auto_387834 ) ) ( not ( = ?auto_387833 ?auto_387834 ) ) ( ON ?auto_387832 ?auto_387833 ) ( ON ?auto_387831 ?auto_387832 ) ( ON ?auto_387830 ?auto_387831 ) ( ON ?auto_387829 ?auto_387830 ) ( ON ?auto_387828 ?auto_387829 ) ( CLEAR ?auto_387826 ) ( ON ?auto_387827 ?auto_387828 ) ( CLEAR ?auto_387827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387825 ?auto_387826 ?auto_387827 )
      ( MAKE-9PILE ?auto_387825 ?auto_387826 ?auto_387827 ?auto_387828 ?auto_387829 ?auto_387830 ?auto_387831 ?auto_387832 ?auto_387833 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387844 - BLOCK
      ?auto_387845 - BLOCK
      ?auto_387846 - BLOCK
      ?auto_387847 - BLOCK
      ?auto_387848 - BLOCK
      ?auto_387849 - BLOCK
      ?auto_387850 - BLOCK
      ?auto_387851 - BLOCK
      ?auto_387852 - BLOCK
    )
    :vars
    (
      ?auto_387853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387852 ?auto_387853 ) ( ON-TABLE ?auto_387844 ) ( ON ?auto_387845 ?auto_387844 ) ( not ( = ?auto_387844 ?auto_387845 ) ) ( not ( = ?auto_387844 ?auto_387846 ) ) ( not ( = ?auto_387844 ?auto_387847 ) ) ( not ( = ?auto_387844 ?auto_387848 ) ) ( not ( = ?auto_387844 ?auto_387849 ) ) ( not ( = ?auto_387844 ?auto_387850 ) ) ( not ( = ?auto_387844 ?auto_387851 ) ) ( not ( = ?auto_387844 ?auto_387852 ) ) ( not ( = ?auto_387844 ?auto_387853 ) ) ( not ( = ?auto_387845 ?auto_387846 ) ) ( not ( = ?auto_387845 ?auto_387847 ) ) ( not ( = ?auto_387845 ?auto_387848 ) ) ( not ( = ?auto_387845 ?auto_387849 ) ) ( not ( = ?auto_387845 ?auto_387850 ) ) ( not ( = ?auto_387845 ?auto_387851 ) ) ( not ( = ?auto_387845 ?auto_387852 ) ) ( not ( = ?auto_387845 ?auto_387853 ) ) ( not ( = ?auto_387846 ?auto_387847 ) ) ( not ( = ?auto_387846 ?auto_387848 ) ) ( not ( = ?auto_387846 ?auto_387849 ) ) ( not ( = ?auto_387846 ?auto_387850 ) ) ( not ( = ?auto_387846 ?auto_387851 ) ) ( not ( = ?auto_387846 ?auto_387852 ) ) ( not ( = ?auto_387846 ?auto_387853 ) ) ( not ( = ?auto_387847 ?auto_387848 ) ) ( not ( = ?auto_387847 ?auto_387849 ) ) ( not ( = ?auto_387847 ?auto_387850 ) ) ( not ( = ?auto_387847 ?auto_387851 ) ) ( not ( = ?auto_387847 ?auto_387852 ) ) ( not ( = ?auto_387847 ?auto_387853 ) ) ( not ( = ?auto_387848 ?auto_387849 ) ) ( not ( = ?auto_387848 ?auto_387850 ) ) ( not ( = ?auto_387848 ?auto_387851 ) ) ( not ( = ?auto_387848 ?auto_387852 ) ) ( not ( = ?auto_387848 ?auto_387853 ) ) ( not ( = ?auto_387849 ?auto_387850 ) ) ( not ( = ?auto_387849 ?auto_387851 ) ) ( not ( = ?auto_387849 ?auto_387852 ) ) ( not ( = ?auto_387849 ?auto_387853 ) ) ( not ( = ?auto_387850 ?auto_387851 ) ) ( not ( = ?auto_387850 ?auto_387852 ) ) ( not ( = ?auto_387850 ?auto_387853 ) ) ( not ( = ?auto_387851 ?auto_387852 ) ) ( not ( = ?auto_387851 ?auto_387853 ) ) ( not ( = ?auto_387852 ?auto_387853 ) ) ( ON ?auto_387851 ?auto_387852 ) ( ON ?auto_387850 ?auto_387851 ) ( ON ?auto_387849 ?auto_387850 ) ( ON ?auto_387848 ?auto_387849 ) ( ON ?auto_387847 ?auto_387848 ) ( CLEAR ?auto_387845 ) ( ON ?auto_387846 ?auto_387847 ) ( CLEAR ?auto_387846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_387844 ?auto_387845 ?auto_387846 )
      ( MAKE-9PILE ?auto_387844 ?auto_387845 ?auto_387846 ?auto_387847 ?auto_387848 ?auto_387849 ?auto_387850 ?auto_387851 ?auto_387852 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387863 - BLOCK
      ?auto_387864 - BLOCK
      ?auto_387865 - BLOCK
      ?auto_387866 - BLOCK
      ?auto_387867 - BLOCK
      ?auto_387868 - BLOCK
      ?auto_387869 - BLOCK
      ?auto_387870 - BLOCK
      ?auto_387871 - BLOCK
    )
    :vars
    (
      ?auto_387872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387871 ?auto_387872 ) ( ON-TABLE ?auto_387863 ) ( not ( = ?auto_387863 ?auto_387864 ) ) ( not ( = ?auto_387863 ?auto_387865 ) ) ( not ( = ?auto_387863 ?auto_387866 ) ) ( not ( = ?auto_387863 ?auto_387867 ) ) ( not ( = ?auto_387863 ?auto_387868 ) ) ( not ( = ?auto_387863 ?auto_387869 ) ) ( not ( = ?auto_387863 ?auto_387870 ) ) ( not ( = ?auto_387863 ?auto_387871 ) ) ( not ( = ?auto_387863 ?auto_387872 ) ) ( not ( = ?auto_387864 ?auto_387865 ) ) ( not ( = ?auto_387864 ?auto_387866 ) ) ( not ( = ?auto_387864 ?auto_387867 ) ) ( not ( = ?auto_387864 ?auto_387868 ) ) ( not ( = ?auto_387864 ?auto_387869 ) ) ( not ( = ?auto_387864 ?auto_387870 ) ) ( not ( = ?auto_387864 ?auto_387871 ) ) ( not ( = ?auto_387864 ?auto_387872 ) ) ( not ( = ?auto_387865 ?auto_387866 ) ) ( not ( = ?auto_387865 ?auto_387867 ) ) ( not ( = ?auto_387865 ?auto_387868 ) ) ( not ( = ?auto_387865 ?auto_387869 ) ) ( not ( = ?auto_387865 ?auto_387870 ) ) ( not ( = ?auto_387865 ?auto_387871 ) ) ( not ( = ?auto_387865 ?auto_387872 ) ) ( not ( = ?auto_387866 ?auto_387867 ) ) ( not ( = ?auto_387866 ?auto_387868 ) ) ( not ( = ?auto_387866 ?auto_387869 ) ) ( not ( = ?auto_387866 ?auto_387870 ) ) ( not ( = ?auto_387866 ?auto_387871 ) ) ( not ( = ?auto_387866 ?auto_387872 ) ) ( not ( = ?auto_387867 ?auto_387868 ) ) ( not ( = ?auto_387867 ?auto_387869 ) ) ( not ( = ?auto_387867 ?auto_387870 ) ) ( not ( = ?auto_387867 ?auto_387871 ) ) ( not ( = ?auto_387867 ?auto_387872 ) ) ( not ( = ?auto_387868 ?auto_387869 ) ) ( not ( = ?auto_387868 ?auto_387870 ) ) ( not ( = ?auto_387868 ?auto_387871 ) ) ( not ( = ?auto_387868 ?auto_387872 ) ) ( not ( = ?auto_387869 ?auto_387870 ) ) ( not ( = ?auto_387869 ?auto_387871 ) ) ( not ( = ?auto_387869 ?auto_387872 ) ) ( not ( = ?auto_387870 ?auto_387871 ) ) ( not ( = ?auto_387870 ?auto_387872 ) ) ( not ( = ?auto_387871 ?auto_387872 ) ) ( ON ?auto_387870 ?auto_387871 ) ( ON ?auto_387869 ?auto_387870 ) ( ON ?auto_387868 ?auto_387869 ) ( ON ?auto_387867 ?auto_387868 ) ( ON ?auto_387866 ?auto_387867 ) ( ON ?auto_387865 ?auto_387866 ) ( CLEAR ?auto_387863 ) ( ON ?auto_387864 ?auto_387865 ) ( CLEAR ?auto_387864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387863 ?auto_387864 )
      ( MAKE-9PILE ?auto_387863 ?auto_387864 ?auto_387865 ?auto_387866 ?auto_387867 ?auto_387868 ?auto_387869 ?auto_387870 ?auto_387871 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387882 - BLOCK
      ?auto_387883 - BLOCK
      ?auto_387884 - BLOCK
      ?auto_387885 - BLOCK
      ?auto_387886 - BLOCK
      ?auto_387887 - BLOCK
      ?auto_387888 - BLOCK
      ?auto_387889 - BLOCK
      ?auto_387890 - BLOCK
    )
    :vars
    (
      ?auto_387891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387890 ?auto_387891 ) ( ON-TABLE ?auto_387882 ) ( not ( = ?auto_387882 ?auto_387883 ) ) ( not ( = ?auto_387882 ?auto_387884 ) ) ( not ( = ?auto_387882 ?auto_387885 ) ) ( not ( = ?auto_387882 ?auto_387886 ) ) ( not ( = ?auto_387882 ?auto_387887 ) ) ( not ( = ?auto_387882 ?auto_387888 ) ) ( not ( = ?auto_387882 ?auto_387889 ) ) ( not ( = ?auto_387882 ?auto_387890 ) ) ( not ( = ?auto_387882 ?auto_387891 ) ) ( not ( = ?auto_387883 ?auto_387884 ) ) ( not ( = ?auto_387883 ?auto_387885 ) ) ( not ( = ?auto_387883 ?auto_387886 ) ) ( not ( = ?auto_387883 ?auto_387887 ) ) ( not ( = ?auto_387883 ?auto_387888 ) ) ( not ( = ?auto_387883 ?auto_387889 ) ) ( not ( = ?auto_387883 ?auto_387890 ) ) ( not ( = ?auto_387883 ?auto_387891 ) ) ( not ( = ?auto_387884 ?auto_387885 ) ) ( not ( = ?auto_387884 ?auto_387886 ) ) ( not ( = ?auto_387884 ?auto_387887 ) ) ( not ( = ?auto_387884 ?auto_387888 ) ) ( not ( = ?auto_387884 ?auto_387889 ) ) ( not ( = ?auto_387884 ?auto_387890 ) ) ( not ( = ?auto_387884 ?auto_387891 ) ) ( not ( = ?auto_387885 ?auto_387886 ) ) ( not ( = ?auto_387885 ?auto_387887 ) ) ( not ( = ?auto_387885 ?auto_387888 ) ) ( not ( = ?auto_387885 ?auto_387889 ) ) ( not ( = ?auto_387885 ?auto_387890 ) ) ( not ( = ?auto_387885 ?auto_387891 ) ) ( not ( = ?auto_387886 ?auto_387887 ) ) ( not ( = ?auto_387886 ?auto_387888 ) ) ( not ( = ?auto_387886 ?auto_387889 ) ) ( not ( = ?auto_387886 ?auto_387890 ) ) ( not ( = ?auto_387886 ?auto_387891 ) ) ( not ( = ?auto_387887 ?auto_387888 ) ) ( not ( = ?auto_387887 ?auto_387889 ) ) ( not ( = ?auto_387887 ?auto_387890 ) ) ( not ( = ?auto_387887 ?auto_387891 ) ) ( not ( = ?auto_387888 ?auto_387889 ) ) ( not ( = ?auto_387888 ?auto_387890 ) ) ( not ( = ?auto_387888 ?auto_387891 ) ) ( not ( = ?auto_387889 ?auto_387890 ) ) ( not ( = ?auto_387889 ?auto_387891 ) ) ( not ( = ?auto_387890 ?auto_387891 ) ) ( ON ?auto_387889 ?auto_387890 ) ( ON ?auto_387888 ?auto_387889 ) ( ON ?auto_387887 ?auto_387888 ) ( ON ?auto_387886 ?auto_387887 ) ( ON ?auto_387885 ?auto_387886 ) ( ON ?auto_387884 ?auto_387885 ) ( CLEAR ?auto_387882 ) ( ON ?auto_387883 ?auto_387884 ) ( CLEAR ?auto_387883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_387882 ?auto_387883 )
      ( MAKE-9PILE ?auto_387882 ?auto_387883 ?auto_387884 ?auto_387885 ?auto_387886 ?auto_387887 ?auto_387888 ?auto_387889 ?auto_387890 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387901 - BLOCK
      ?auto_387902 - BLOCK
      ?auto_387903 - BLOCK
      ?auto_387904 - BLOCK
      ?auto_387905 - BLOCK
      ?auto_387906 - BLOCK
      ?auto_387907 - BLOCK
      ?auto_387908 - BLOCK
      ?auto_387909 - BLOCK
    )
    :vars
    (
      ?auto_387910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387909 ?auto_387910 ) ( not ( = ?auto_387901 ?auto_387902 ) ) ( not ( = ?auto_387901 ?auto_387903 ) ) ( not ( = ?auto_387901 ?auto_387904 ) ) ( not ( = ?auto_387901 ?auto_387905 ) ) ( not ( = ?auto_387901 ?auto_387906 ) ) ( not ( = ?auto_387901 ?auto_387907 ) ) ( not ( = ?auto_387901 ?auto_387908 ) ) ( not ( = ?auto_387901 ?auto_387909 ) ) ( not ( = ?auto_387901 ?auto_387910 ) ) ( not ( = ?auto_387902 ?auto_387903 ) ) ( not ( = ?auto_387902 ?auto_387904 ) ) ( not ( = ?auto_387902 ?auto_387905 ) ) ( not ( = ?auto_387902 ?auto_387906 ) ) ( not ( = ?auto_387902 ?auto_387907 ) ) ( not ( = ?auto_387902 ?auto_387908 ) ) ( not ( = ?auto_387902 ?auto_387909 ) ) ( not ( = ?auto_387902 ?auto_387910 ) ) ( not ( = ?auto_387903 ?auto_387904 ) ) ( not ( = ?auto_387903 ?auto_387905 ) ) ( not ( = ?auto_387903 ?auto_387906 ) ) ( not ( = ?auto_387903 ?auto_387907 ) ) ( not ( = ?auto_387903 ?auto_387908 ) ) ( not ( = ?auto_387903 ?auto_387909 ) ) ( not ( = ?auto_387903 ?auto_387910 ) ) ( not ( = ?auto_387904 ?auto_387905 ) ) ( not ( = ?auto_387904 ?auto_387906 ) ) ( not ( = ?auto_387904 ?auto_387907 ) ) ( not ( = ?auto_387904 ?auto_387908 ) ) ( not ( = ?auto_387904 ?auto_387909 ) ) ( not ( = ?auto_387904 ?auto_387910 ) ) ( not ( = ?auto_387905 ?auto_387906 ) ) ( not ( = ?auto_387905 ?auto_387907 ) ) ( not ( = ?auto_387905 ?auto_387908 ) ) ( not ( = ?auto_387905 ?auto_387909 ) ) ( not ( = ?auto_387905 ?auto_387910 ) ) ( not ( = ?auto_387906 ?auto_387907 ) ) ( not ( = ?auto_387906 ?auto_387908 ) ) ( not ( = ?auto_387906 ?auto_387909 ) ) ( not ( = ?auto_387906 ?auto_387910 ) ) ( not ( = ?auto_387907 ?auto_387908 ) ) ( not ( = ?auto_387907 ?auto_387909 ) ) ( not ( = ?auto_387907 ?auto_387910 ) ) ( not ( = ?auto_387908 ?auto_387909 ) ) ( not ( = ?auto_387908 ?auto_387910 ) ) ( not ( = ?auto_387909 ?auto_387910 ) ) ( ON ?auto_387908 ?auto_387909 ) ( ON ?auto_387907 ?auto_387908 ) ( ON ?auto_387906 ?auto_387907 ) ( ON ?auto_387905 ?auto_387906 ) ( ON ?auto_387904 ?auto_387905 ) ( ON ?auto_387903 ?auto_387904 ) ( ON ?auto_387902 ?auto_387903 ) ( ON ?auto_387901 ?auto_387902 ) ( CLEAR ?auto_387901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387901 )
      ( MAKE-9PILE ?auto_387901 ?auto_387902 ?auto_387903 ?auto_387904 ?auto_387905 ?auto_387906 ?auto_387907 ?auto_387908 ?auto_387909 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_387920 - BLOCK
      ?auto_387921 - BLOCK
      ?auto_387922 - BLOCK
      ?auto_387923 - BLOCK
      ?auto_387924 - BLOCK
      ?auto_387925 - BLOCK
      ?auto_387926 - BLOCK
      ?auto_387927 - BLOCK
      ?auto_387928 - BLOCK
    )
    :vars
    (
      ?auto_387929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387928 ?auto_387929 ) ( not ( = ?auto_387920 ?auto_387921 ) ) ( not ( = ?auto_387920 ?auto_387922 ) ) ( not ( = ?auto_387920 ?auto_387923 ) ) ( not ( = ?auto_387920 ?auto_387924 ) ) ( not ( = ?auto_387920 ?auto_387925 ) ) ( not ( = ?auto_387920 ?auto_387926 ) ) ( not ( = ?auto_387920 ?auto_387927 ) ) ( not ( = ?auto_387920 ?auto_387928 ) ) ( not ( = ?auto_387920 ?auto_387929 ) ) ( not ( = ?auto_387921 ?auto_387922 ) ) ( not ( = ?auto_387921 ?auto_387923 ) ) ( not ( = ?auto_387921 ?auto_387924 ) ) ( not ( = ?auto_387921 ?auto_387925 ) ) ( not ( = ?auto_387921 ?auto_387926 ) ) ( not ( = ?auto_387921 ?auto_387927 ) ) ( not ( = ?auto_387921 ?auto_387928 ) ) ( not ( = ?auto_387921 ?auto_387929 ) ) ( not ( = ?auto_387922 ?auto_387923 ) ) ( not ( = ?auto_387922 ?auto_387924 ) ) ( not ( = ?auto_387922 ?auto_387925 ) ) ( not ( = ?auto_387922 ?auto_387926 ) ) ( not ( = ?auto_387922 ?auto_387927 ) ) ( not ( = ?auto_387922 ?auto_387928 ) ) ( not ( = ?auto_387922 ?auto_387929 ) ) ( not ( = ?auto_387923 ?auto_387924 ) ) ( not ( = ?auto_387923 ?auto_387925 ) ) ( not ( = ?auto_387923 ?auto_387926 ) ) ( not ( = ?auto_387923 ?auto_387927 ) ) ( not ( = ?auto_387923 ?auto_387928 ) ) ( not ( = ?auto_387923 ?auto_387929 ) ) ( not ( = ?auto_387924 ?auto_387925 ) ) ( not ( = ?auto_387924 ?auto_387926 ) ) ( not ( = ?auto_387924 ?auto_387927 ) ) ( not ( = ?auto_387924 ?auto_387928 ) ) ( not ( = ?auto_387924 ?auto_387929 ) ) ( not ( = ?auto_387925 ?auto_387926 ) ) ( not ( = ?auto_387925 ?auto_387927 ) ) ( not ( = ?auto_387925 ?auto_387928 ) ) ( not ( = ?auto_387925 ?auto_387929 ) ) ( not ( = ?auto_387926 ?auto_387927 ) ) ( not ( = ?auto_387926 ?auto_387928 ) ) ( not ( = ?auto_387926 ?auto_387929 ) ) ( not ( = ?auto_387927 ?auto_387928 ) ) ( not ( = ?auto_387927 ?auto_387929 ) ) ( not ( = ?auto_387928 ?auto_387929 ) ) ( ON ?auto_387927 ?auto_387928 ) ( ON ?auto_387926 ?auto_387927 ) ( ON ?auto_387925 ?auto_387926 ) ( ON ?auto_387924 ?auto_387925 ) ( ON ?auto_387923 ?auto_387924 ) ( ON ?auto_387922 ?auto_387923 ) ( ON ?auto_387921 ?auto_387922 ) ( ON ?auto_387920 ?auto_387921 ) ( CLEAR ?auto_387920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_387920 )
      ( MAKE-9PILE ?auto_387920 ?auto_387921 ?auto_387922 ?auto_387923 ?auto_387924 ?auto_387925 ?auto_387926 ?auto_387927 ?auto_387928 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_387940 - BLOCK
      ?auto_387941 - BLOCK
      ?auto_387942 - BLOCK
      ?auto_387943 - BLOCK
      ?auto_387944 - BLOCK
      ?auto_387945 - BLOCK
      ?auto_387946 - BLOCK
      ?auto_387947 - BLOCK
      ?auto_387948 - BLOCK
      ?auto_387949 - BLOCK
    )
    :vars
    (
      ?auto_387950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387948 ) ( ON ?auto_387949 ?auto_387950 ) ( CLEAR ?auto_387949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387940 ) ( ON ?auto_387941 ?auto_387940 ) ( ON ?auto_387942 ?auto_387941 ) ( ON ?auto_387943 ?auto_387942 ) ( ON ?auto_387944 ?auto_387943 ) ( ON ?auto_387945 ?auto_387944 ) ( ON ?auto_387946 ?auto_387945 ) ( ON ?auto_387947 ?auto_387946 ) ( ON ?auto_387948 ?auto_387947 ) ( not ( = ?auto_387940 ?auto_387941 ) ) ( not ( = ?auto_387940 ?auto_387942 ) ) ( not ( = ?auto_387940 ?auto_387943 ) ) ( not ( = ?auto_387940 ?auto_387944 ) ) ( not ( = ?auto_387940 ?auto_387945 ) ) ( not ( = ?auto_387940 ?auto_387946 ) ) ( not ( = ?auto_387940 ?auto_387947 ) ) ( not ( = ?auto_387940 ?auto_387948 ) ) ( not ( = ?auto_387940 ?auto_387949 ) ) ( not ( = ?auto_387940 ?auto_387950 ) ) ( not ( = ?auto_387941 ?auto_387942 ) ) ( not ( = ?auto_387941 ?auto_387943 ) ) ( not ( = ?auto_387941 ?auto_387944 ) ) ( not ( = ?auto_387941 ?auto_387945 ) ) ( not ( = ?auto_387941 ?auto_387946 ) ) ( not ( = ?auto_387941 ?auto_387947 ) ) ( not ( = ?auto_387941 ?auto_387948 ) ) ( not ( = ?auto_387941 ?auto_387949 ) ) ( not ( = ?auto_387941 ?auto_387950 ) ) ( not ( = ?auto_387942 ?auto_387943 ) ) ( not ( = ?auto_387942 ?auto_387944 ) ) ( not ( = ?auto_387942 ?auto_387945 ) ) ( not ( = ?auto_387942 ?auto_387946 ) ) ( not ( = ?auto_387942 ?auto_387947 ) ) ( not ( = ?auto_387942 ?auto_387948 ) ) ( not ( = ?auto_387942 ?auto_387949 ) ) ( not ( = ?auto_387942 ?auto_387950 ) ) ( not ( = ?auto_387943 ?auto_387944 ) ) ( not ( = ?auto_387943 ?auto_387945 ) ) ( not ( = ?auto_387943 ?auto_387946 ) ) ( not ( = ?auto_387943 ?auto_387947 ) ) ( not ( = ?auto_387943 ?auto_387948 ) ) ( not ( = ?auto_387943 ?auto_387949 ) ) ( not ( = ?auto_387943 ?auto_387950 ) ) ( not ( = ?auto_387944 ?auto_387945 ) ) ( not ( = ?auto_387944 ?auto_387946 ) ) ( not ( = ?auto_387944 ?auto_387947 ) ) ( not ( = ?auto_387944 ?auto_387948 ) ) ( not ( = ?auto_387944 ?auto_387949 ) ) ( not ( = ?auto_387944 ?auto_387950 ) ) ( not ( = ?auto_387945 ?auto_387946 ) ) ( not ( = ?auto_387945 ?auto_387947 ) ) ( not ( = ?auto_387945 ?auto_387948 ) ) ( not ( = ?auto_387945 ?auto_387949 ) ) ( not ( = ?auto_387945 ?auto_387950 ) ) ( not ( = ?auto_387946 ?auto_387947 ) ) ( not ( = ?auto_387946 ?auto_387948 ) ) ( not ( = ?auto_387946 ?auto_387949 ) ) ( not ( = ?auto_387946 ?auto_387950 ) ) ( not ( = ?auto_387947 ?auto_387948 ) ) ( not ( = ?auto_387947 ?auto_387949 ) ) ( not ( = ?auto_387947 ?auto_387950 ) ) ( not ( = ?auto_387948 ?auto_387949 ) ) ( not ( = ?auto_387948 ?auto_387950 ) ) ( not ( = ?auto_387949 ?auto_387950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387949 ?auto_387950 )
      ( !STACK ?auto_387949 ?auto_387948 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_387961 - BLOCK
      ?auto_387962 - BLOCK
      ?auto_387963 - BLOCK
      ?auto_387964 - BLOCK
      ?auto_387965 - BLOCK
      ?auto_387966 - BLOCK
      ?auto_387967 - BLOCK
      ?auto_387968 - BLOCK
      ?auto_387969 - BLOCK
      ?auto_387970 - BLOCK
    )
    :vars
    (
      ?auto_387971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_387969 ) ( ON ?auto_387970 ?auto_387971 ) ( CLEAR ?auto_387970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_387961 ) ( ON ?auto_387962 ?auto_387961 ) ( ON ?auto_387963 ?auto_387962 ) ( ON ?auto_387964 ?auto_387963 ) ( ON ?auto_387965 ?auto_387964 ) ( ON ?auto_387966 ?auto_387965 ) ( ON ?auto_387967 ?auto_387966 ) ( ON ?auto_387968 ?auto_387967 ) ( ON ?auto_387969 ?auto_387968 ) ( not ( = ?auto_387961 ?auto_387962 ) ) ( not ( = ?auto_387961 ?auto_387963 ) ) ( not ( = ?auto_387961 ?auto_387964 ) ) ( not ( = ?auto_387961 ?auto_387965 ) ) ( not ( = ?auto_387961 ?auto_387966 ) ) ( not ( = ?auto_387961 ?auto_387967 ) ) ( not ( = ?auto_387961 ?auto_387968 ) ) ( not ( = ?auto_387961 ?auto_387969 ) ) ( not ( = ?auto_387961 ?auto_387970 ) ) ( not ( = ?auto_387961 ?auto_387971 ) ) ( not ( = ?auto_387962 ?auto_387963 ) ) ( not ( = ?auto_387962 ?auto_387964 ) ) ( not ( = ?auto_387962 ?auto_387965 ) ) ( not ( = ?auto_387962 ?auto_387966 ) ) ( not ( = ?auto_387962 ?auto_387967 ) ) ( not ( = ?auto_387962 ?auto_387968 ) ) ( not ( = ?auto_387962 ?auto_387969 ) ) ( not ( = ?auto_387962 ?auto_387970 ) ) ( not ( = ?auto_387962 ?auto_387971 ) ) ( not ( = ?auto_387963 ?auto_387964 ) ) ( not ( = ?auto_387963 ?auto_387965 ) ) ( not ( = ?auto_387963 ?auto_387966 ) ) ( not ( = ?auto_387963 ?auto_387967 ) ) ( not ( = ?auto_387963 ?auto_387968 ) ) ( not ( = ?auto_387963 ?auto_387969 ) ) ( not ( = ?auto_387963 ?auto_387970 ) ) ( not ( = ?auto_387963 ?auto_387971 ) ) ( not ( = ?auto_387964 ?auto_387965 ) ) ( not ( = ?auto_387964 ?auto_387966 ) ) ( not ( = ?auto_387964 ?auto_387967 ) ) ( not ( = ?auto_387964 ?auto_387968 ) ) ( not ( = ?auto_387964 ?auto_387969 ) ) ( not ( = ?auto_387964 ?auto_387970 ) ) ( not ( = ?auto_387964 ?auto_387971 ) ) ( not ( = ?auto_387965 ?auto_387966 ) ) ( not ( = ?auto_387965 ?auto_387967 ) ) ( not ( = ?auto_387965 ?auto_387968 ) ) ( not ( = ?auto_387965 ?auto_387969 ) ) ( not ( = ?auto_387965 ?auto_387970 ) ) ( not ( = ?auto_387965 ?auto_387971 ) ) ( not ( = ?auto_387966 ?auto_387967 ) ) ( not ( = ?auto_387966 ?auto_387968 ) ) ( not ( = ?auto_387966 ?auto_387969 ) ) ( not ( = ?auto_387966 ?auto_387970 ) ) ( not ( = ?auto_387966 ?auto_387971 ) ) ( not ( = ?auto_387967 ?auto_387968 ) ) ( not ( = ?auto_387967 ?auto_387969 ) ) ( not ( = ?auto_387967 ?auto_387970 ) ) ( not ( = ?auto_387967 ?auto_387971 ) ) ( not ( = ?auto_387968 ?auto_387969 ) ) ( not ( = ?auto_387968 ?auto_387970 ) ) ( not ( = ?auto_387968 ?auto_387971 ) ) ( not ( = ?auto_387969 ?auto_387970 ) ) ( not ( = ?auto_387969 ?auto_387971 ) ) ( not ( = ?auto_387970 ?auto_387971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_387970 ?auto_387971 )
      ( !STACK ?auto_387970 ?auto_387969 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_387982 - BLOCK
      ?auto_387983 - BLOCK
      ?auto_387984 - BLOCK
      ?auto_387985 - BLOCK
      ?auto_387986 - BLOCK
      ?auto_387987 - BLOCK
      ?auto_387988 - BLOCK
      ?auto_387989 - BLOCK
      ?auto_387990 - BLOCK
      ?auto_387991 - BLOCK
    )
    :vars
    (
      ?auto_387992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_387991 ?auto_387992 ) ( ON-TABLE ?auto_387982 ) ( ON ?auto_387983 ?auto_387982 ) ( ON ?auto_387984 ?auto_387983 ) ( ON ?auto_387985 ?auto_387984 ) ( ON ?auto_387986 ?auto_387985 ) ( ON ?auto_387987 ?auto_387986 ) ( ON ?auto_387988 ?auto_387987 ) ( ON ?auto_387989 ?auto_387988 ) ( not ( = ?auto_387982 ?auto_387983 ) ) ( not ( = ?auto_387982 ?auto_387984 ) ) ( not ( = ?auto_387982 ?auto_387985 ) ) ( not ( = ?auto_387982 ?auto_387986 ) ) ( not ( = ?auto_387982 ?auto_387987 ) ) ( not ( = ?auto_387982 ?auto_387988 ) ) ( not ( = ?auto_387982 ?auto_387989 ) ) ( not ( = ?auto_387982 ?auto_387990 ) ) ( not ( = ?auto_387982 ?auto_387991 ) ) ( not ( = ?auto_387982 ?auto_387992 ) ) ( not ( = ?auto_387983 ?auto_387984 ) ) ( not ( = ?auto_387983 ?auto_387985 ) ) ( not ( = ?auto_387983 ?auto_387986 ) ) ( not ( = ?auto_387983 ?auto_387987 ) ) ( not ( = ?auto_387983 ?auto_387988 ) ) ( not ( = ?auto_387983 ?auto_387989 ) ) ( not ( = ?auto_387983 ?auto_387990 ) ) ( not ( = ?auto_387983 ?auto_387991 ) ) ( not ( = ?auto_387983 ?auto_387992 ) ) ( not ( = ?auto_387984 ?auto_387985 ) ) ( not ( = ?auto_387984 ?auto_387986 ) ) ( not ( = ?auto_387984 ?auto_387987 ) ) ( not ( = ?auto_387984 ?auto_387988 ) ) ( not ( = ?auto_387984 ?auto_387989 ) ) ( not ( = ?auto_387984 ?auto_387990 ) ) ( not ( = ?auto_387984 ?auto_387991 ) ) ( not ( = ?auto_387984 ?auto_387992 ) ) ( not ( = ?auto_387985 ?auto_387986 ) ) ( not ( = ?auto_387985 ?auto_387987 ) ) ( not ( = ?auto_387985 ?auto_387988 ) ) ( not ( = ?auto_387985 ?auto_387989 ) ) ( not ( = ?auto_387985 ?auto_387990 ) ) ( not ( = ?auto_387985 ?auto_387991 ) ) ( not ( = ?auto_387985 ?auto_387992 ) ) ( not ( = ?auto_387986 ?auto_387987 ) ) ( not ( = ?auto_387986 ?auto_387988 ) ) ( not ( = ?auto_387986 ?auto_387989 ) ) ( not ( = ?auto_387986 ?auto_387990 ) ) ( not ( = ?auto_387986 ?auto_387991 ) ) ( not ( = ?auto_387986 ?auto_387992 ) ) ( not ( = ?auto_387987 ?auto_387988 ) ) ( not ( = ?auto_387987 ?auto_387989 ) ) ( not ( = ?auto_387987 ?auto_387990 ) ) ( not ( = ?auto_387987 ?auto_387991 ) ) ( not ( = ?auto_387987 ?auto_387992 ) ) ( not ( = ?auto_387988 ?auto_387989 ) ) ( not ( = ?auto_387988 ?auto_387990 ) ) ( not ( = ?auto_387988 ?auto_387991 ) ) ( not ( = ?auto_387988 ?auto_387992 ) ) ( not ( = ?auto_387989 ?auto_387990 ) ) ( not ( = ?auto_387989 ?auto_387991 ) ) ( not ( = ?auto_387989 ?auto_387992 ) ) ( not ( = ?auto_387990 ?auto_387991 ) ) ( not ( = ?auto_387990 ?auto_387992 ) ) ( not ( = ?auto_387991 ?auto_387992 ) ) ( CLEAR ?auto_387989 ) ( ON ?auto_387990 ?auto_387991 ) ( CLEAR ?auto_387990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_387982 ?auto_387983 ?auto_387984 ?auto_387985 ?auto_387986 ?auto_387987 ?auto_387988 ?auto_387989 ?auto_387990 )
      ( MAKE-10PILE ?auto_387982 ?auto_387983 ?auto_387984 ?auto_387985 ?auto_387986 ?auto_387987 ?auto_387988 ?auto_387989 ?auto_387990 ?auto_387991 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388003 - BLOCK
      ?auto_388004 - BLOCK
      ?auto_388005 - BLOCK
      ?auto_388006 - BLOCK
      ?auto_388007 - BLOCK
      ?auto_388008 - BLOCK
      ?auto_388009 - BLOCK
      ?auto_388010 - BLOCK
      ?auto_388011 - BLOCK
      ?auto_388012 - BLOCK
    )
    :vars
    (
      ?auto_388013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388012 ?auto_388013 ) ( ON-TABLE ?auto_388003 ) ( ON ?auto_388004 ?auto_388003 ) ( ON ?auto_388005 ?auto_388004 ) ( ON ?auto_388006 ?auto_388005 ) ( ON ?auto_388007 ?auto_388006 ) ( ON ?auto_388008 ?auto_388007 ) ( ON ?auto_388009 ?auto_388008 ) ( ON ?auto_388010 ?auto_388009 ) ( not ( = ?auto_388003 ?auto_388004 ) ) ( not ( = ?auto_388003 ?auto_388005 ) ) ( not ( = ?auto_388003 ?auto_388006 ) ) ( not ( = ?auto_388003 ?auto_388007 ) ) ( not ( = ?auto_388003 ?auto_388008 ) ) ( not ( = ?auto_388003 ?auto_388009 ) ) ( not ( = ?auto_388003 ?auto_388010 ) ) ( not ( = ?auto_388003 ?auto_388011 ) ) ( not ( = ?auto_388003 ?auto_388012 ) ) ( not ( = ?auto_388003 ?auto_388013 ) ) ( not ( = ?auto_388004 ?auto_388005 ) ) ( not ( = ?auto_388004 ?auto_388006 ) ) ( not ( = ?auto_388004 ?auto_388007 ) ) ( not ( = ?auto_388004 ?auto_388008 ) ) ( not ( = ?auto_388004 ?auto_388009 ) ) ( not ( = ?auto_388004 ?auto_388010 ) ) ( not ( = ?auto_388004 ?auto_388011 ) ) ( not ( = ?auto_388004 ?auto_388012 ) ) ( not ( = ?auto_388004 ?auto_388013 ) ) ( not ( = ?auto_388005 ?auto_388006 ) ) ( not ( = ?auto_388005 ?auto_388007 ) ) ( not ( = ?auto_388005 ?auto_388008 ) ) ( not ( = ?auto_388005 ?auto_388009 ) ) ( not ( = ?auto_388005 ?auto_388010 ) ) ( not ( = ?auto_388005 ?auto_388011 ) ) ( not ( = ?auto_388005 ?auto_388012 ) ) ( not ( = ?auto_388005 ?auto_388013 ) ) ( not ( = ?auto_388006 ?auto_388007 ) ) ( not ( = ?auto_388006 ?auto_388008 ) ) ( not ( = ?auto_388006 ?auto_388009 ) ) ( not ( = ?auto_388006 ?auto_388010 ) ) ( not ( = ?auto_388006 ?auto_388011 ) ) ( not ( = ?auto_388006 ?auto_388012 ) ) ( not ( = ?auto_388006 ?auto_388013 ) ) ( not ( = ?auto_388007 ?auto_388008 ) ) ( not ( = ?auto_388007 ?auto_388009 ) ) ( not ( = ?auto_388007 ?auto_388010 ) ) ( not ( = ?auto_388007 ?auto_388011 ) ) ( not ( = ?auto_388007 ?auto_388012 ) ) ( not ( = ?auto_388007 ?auto_388013 ) ) ( not ( = ?auto_388008 ?auto_388009 ) ) ( not ( = ?auto_388008 ?auto_388010 ) ) ( not ( = ?auto_388008 ?auto_388011 ) ) ( not ( = ?auto_388008 ?auto_388012 ) ) ( not ( = ?auto_388008 ?auto_388013 ) ) ( not ( = ?auto_388009 ?auto_388010 ) ) ( not ( = ?auto_388009 ?auto_388011 ) ) ( not ( = ?auto_388009 ?auto_388012 ) ) ( not ( = ?auto_388009 ?auto_388013 ) ) ( not ( = ?auto_388010 ?auto_388011 ) ) ( not ( = ?auto_388010 ?auto_388012 ) ) ( not ( = ?auto_388010 ?auto_388013 ) ) ( not ( = ?auto_388011 ?auto_388012 ) ) ( not ( = ?auto_388011 ?auto_388013 ) ) ( not ( = ?auto_388012 ?auto_388013 ) ) ( CLEAR ?auto_388010 ) ( ON ?auto_388011 ?auto_388012 ) ( CLEAR ?auto_388011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_388003 ?auto_388004 ?auto_388005 ?auto_388006 ?auto_388007 ?auto_388008 ?auto_388009 ?auto_388010 ?auto_388011 )
      ( MAKE-10PILE ?auto_388003 ?auto_388004 ?auto_388005 ?auto_388006 ?auto_388007 ?auto_388008 ?auto_388009 ?auto_388010 ?auto_388011 ?auto_388012 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388024 - BLOCK
      ?auto_388025 - BLOCK
      ?auto_388026 - BLOCK
      ?auto_388027 - BLOCK
      ?auto_388028 - BLOCK
      ?auto_388029 - BLOCK
      ?auto_388030 - BLOCK
      ?auto_388031 - BLOCK
      ?auto_388032 - BLOCK
      ?auto_388033 - BLOCK
    )
    :vars
    (
      ?auto_388034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388033 ?auto_388034 ) ( ON-TABLE ?auto_388024 ) ( ON ?auto_388025 ?auto_388024 ) ( ON ?auto_388026 ?auto_388025 ) ( ON ?auto_388027 ?auto_388026 ) ( ON ?auto_388028 ?auto_388027 ) ( ON ?auto_388029 ?auto_388028 ) ( ON ?auto_388030 ?auto_388029 ) ( not ( = ?auto_388024 ?auto_388025 ) ) ( not ( = ?auto_388024 ?auto_388026 ) ) ( not ( = ?auto_388024 ?auto_388027 ) ) ( not ( = ?auto_388024 ?auto_388028 ) ) ( not ( = ?auto_388024 ?auto_388029 ) ) ( not ( = ?auto_388024 ?auto_388030 ) ) ( not ( = ?auto_388024 ?auto_388031 ) ) ( not ( = ?auto_388024 ?auto_388032 ) ) ( not ( = ?auto_388024 ?auto_388033 ) ) ( not ( = ?auto_388024 ?auto_388034 ) ) ( not ( = ?auto_388025 ?auto_388026 ) ) ( not ( = ?auto_388025 ?auto_388027 ) ) ( not ( = ?auto_388025 ?auto_388028 ) ) ( not ( = ?auto_388025 ?auto_388029 ) ) ( not ( = ?auto_388025 ?auto_388030 ) ) ( not ( = ?auto_388025 ?auto_388031 ) ) ( not ( = ?auto_388025 ?auto_388032 ) ) ( not ( = ?auto_388025 ?auto_388033 ) ) ( not ( = ?auto_388025 ?auto_388034 ) ) ( not ( = ?auto_388026 ?auto_388027 ) ) ( not ( = ?auto_388026 ?auto_388028 ) ) ( not ( = ?auto_388026 ?auto_388029 ) ) ( not ( = ?auto_388026 ?auto_388030 ) ) ( not ( = ?auto_388026 ?auto_388031 ) ) ( not ( = ?auto_388026 ?auto_388032 ) ) ( not ( = ?auto_388026 ?auto_388033 ) ) ( not ( = ?auto_388026 ?auto_388034 ) ) ( not ( = ?auto_388027 ?auto_388028 ) ) ( not ( = ?auto_388027 ?auto_388029 ) ) ( not ( = ?auto_388027 ?auto_388030 ) ) ( not ( = ?auto_388027 ?auto_388031 ) ) ( not ( = ?auto_388027 ?auto_388032 ) ) ( not ( = ?auto_388027 ?auto_388033 ) ) ( not ( = ?auto_388027 ?auto_388034 ) ) ( not ( = ?auto_388028 ?auto_388029 ) ) ( not ( = ?auto_388028 ?auto_388030 ) ) ( not ( = ?auto_388028 ?auto_388031 ) ) ( not ( = ?auto_388028 ?auto_388032 ) ) ( not ( = ?auto_388028 ?auto_388033 ) ) ( not ( = ?auto_388028 ?auto_388034 ) ) ( not ( = ?auto_388029 ?auto_388030 ) ) ( not ( = ?auto_388029 ?auto_388031 ) ) ( not ( = ?auto_388029 ?auto_388032 ) ) ( not ( = ?auto_388029 ?auto_388033 ) ) ( not ( = ?auto_388029 ?auto_388034 ) ) ( not ( = ?auto_388030 ?auto_388031 ) ) ( not ( = ?auto_388030 ?auto_388032 ) ) ( not ( = ?auto_388030 ?auto_388033 ) ) ( not ( = ?auto_388030 ?auto_388034 ) ) ( not ( = ?auto_388031 ?auto_388032 ) ) ( not ( = ?auto_388031 ?auto_388033 ) ) ( not ( = ?auto_388031 ?auto_388034 ) ) ( not ( = ?auto_388032 ?auto_388033 ) ) ( not ( = ?auto_388032 ?auto_388034 ) ) ( not ( = ?auto_388033 ?auto_388034 ) ) ( ON ?auto_388032 ?auto_388033 ) ( CLEAR ?auto_388030 ) ( ON ?auto_388031 ?auto_388032 ) ( CLEAR ?auto_388031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388024 ?auto_388025 ?auto_388026 ?auto_388027 ?auto_388028 ?auto_388029 ?auto_388030 ?auto_388031 )
      ( MAKE-10PILE ?auto_388024 ?auto_388025 ?auto_388026 ?auto_388027 ?auto_388028 ?auto_388029 ?auto_388030 ?auto_388031 ?auto_388032 ?auto_388033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388045 - BLOCK
      ?auto_388046 - BLOCK
      ?auto_388047 - BLOCK
      ?auto_388048 - BLOCK
      ?auto_388049 - BLOCK
      ?auto_388050 - BLOCK
      ?auto_388051 - BLOCK
      ?auto_388052 - BLOCK
      ?auto_388053 - BLOCK
      ?auto_388054 - BLOCK
    )
    :vars
    (
      ?auto_388055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388054 ?auto_388055 ) ( ON-TABLE ?auto_388045 ) ( ON ?auto_388046 ?auto_388045 ) ( ON ?auto_388047 ?auto_388046 ) ( ON ?auto_388048 ?auto_388047 ) ( ON ?auto_388049 ?auto_388048 ) ( ON ?auto_388050 ?auto_388049 ) ( ON ?auto_388051 ?auto_388050 ) ( not ( = ?auto_388045 ?auto_388046 ) ) ( not ( = ?auto_388045 ?auto_388047 ) ) ( not ( = ?auto_388045 ?auto_388048 ) ) ( not ( = ?auto_388045 ?auto_388049 ) ) ( not ( = ?auto_388045 ?auto_388050 ) ) ( not ( = ?auto_388045 ?auto_388051 ) ) ( not ( = ?auto_388045 ?auto_388052 ) ) ( not ( = ?auto_388045 ?auto_388053 ) ) ( not ( = ?auto_388045 ?auto_388054 ) ) ( not ( = ?auto_388045 ?auto_388055 ) ) ( not ( = ?auto_388046 ?auto_388047 ) ) ( not ( = ?auto_388046 ?auto_388048 ) ) ( not ( = ?auto_388046 ?auto_388049 ) ) ( not ( = ?auto_388046 ?auto_388050 ) ) ( not ( = ?auto_388046 ?auto_388051 ) ) ( not ( = ?auto_388046 ?auto_388052 ) ) ( not ( = ?auto_388046 ?auto_388053 ) ) ( not ( = ?auto_388046 ?auto_388054 ) ) ( not ( = ?auto_388046 ?auto_388055 ) ) ( not ( = ?auto_388047 ?auto_388048 ) ) ( not ( = ?auto_388047 ?auto_388049 ) ) ( not ( = ?auto_388047 ?auto_388050 ) ) ( not ( = ?auto_388047 ?auto_388051 ) ) ( not ( = ?auto_388047 ?auto_388052 ) ) ( not ( = ?auto_388047 ?auto_388053 ) ) ( not ( = ?auto_388047 ?auto_388054 ) ) ( not ( = ?auto_388047 ?auto_388055 ) ) ( not ( = ?auto_388048 ?auto_388049 ) ) ( not ( = ?auto_388048 ?auto_388050 ) ) ( not ( = ?auto_388048 ?auto_388051 ) ) ( not ( = ?auto_388048 ?auto_388052 ) ) ( not ( = ?auto_388048 ?auto_388053 ) ) ( not ( = ?auto_388048 ?auto_388054 ) ) ( not ( = ?auto_388048 ?auto_388055 ) ) ( not ( = ?auto_388049 ?auto_388050 ) ) ( not ( = ?auto_388049 ?auto_388051 ) ) ( not ( = ?auto_388049 ?auto_388052 ) ) ( not ( = ?auto_388049 ?auto_388053 ) ) ( not ( = ?auto_388049 ?auto_388054 ) ) ( not ( = ?auto_388049 ?auto_388055 ) ) ( not ( = ?auto_388050 ?auto_388051 ) ) ( not ( = ?auto_388050 ?auto_388052 ) ) ( not ( = ?auto_388050 ?auto_388053 ) ) ( not ( = ?auto_388050 ?auto_388054 ) ) ( not ( = ?auto_388050 ?auto_388055 ) ) ( not ( = ?auto_388051 ?auto_388052 ) ) ( not ( = ?auto_388051 ?auto_388053 ) ) ( not ( = ?auto_388051 ?auto_388054 ) ) ( not ( = ?auto_388051 ?auto_388055 ) ) ( not ( = ?auto_388052 ?auto_388053 ) ) ( not ( = ?auto_388052 ?auto_388054 ) ) ( not ( = ?auto_388052 ?auto_388055 ) ) ( not ( = ?auto_388053 ?auto_388054 ) ) ( not ( = ?auto_388053 ?auto_388055 ) ) ( not ( = ?auto_388054 ?auto_388055 ) ) ( ON ?auto_388053 ?auto_388054 ) ( CLEAR ?auto_388051 ) ( ON ?auto_388052 ?auto_388053 ) ( CLEAR ?auto_388052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388045 ?auto_388046 ?auto_388047 ?auto_388048 ?auto_388049 ?auto_388050 ?auto_388051 ?auto_388052 )
      ( MAKE-10PILE ?auto_388045 ?auto_388046 ?auto_388047 ?auto_388048 ?auto_388049 ?auto_388050 ?auto_388051 ?auto_388052 ?auto_388053 ?auto_388054 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388066 - BLOCK
      ?auto_388067 - BLOCK
      ?auto_388068 - BLOCK
      ?auto_388069 - BLOCK
      ?auto_388070 - BLOCK
      ?auto_388071 - BLOCK
      ?auto_388072 - BLOCK
      ?auto_388073 - BLOCK
      ?auto_388074 - BLOCK
      ?auto_388075 - BLOCK
    )
    :vars
    (
      ?auto_388076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388075 ?auto_388076 ) ( ON-TABLE ?auto_388066 ) ( ON ?auto_388067 ?auto_388066 ) ( ON ?auto_388068 ?auto_388067 ) ( ON ?auto_388069 ?auto_388068 ) ( ON ?auto_388070 ?auto_388069 ) ( ON ?auto_388071 ?auto_388070 ) ( not ( = ?auto_388066 ?auto_388067 ) ) ( not ( = ?auto_388066 ?auto_388068 ) ) ( not ( = ?auto_388066 ?auto_388069 ) ) ( not ( = ?auto_388066 ?auto_388070 ) ) ( not ( = ?auto_388066 ?auto_388071 ) ) ( not ( = ?auto_388066 ?auto_388072 ) ) ( not ( = ?auto_388066 ?auto_388073 ) ) ( not ( = ?auto_388066 ?auto_388074 ) ) ( not ( = ?auto_388066 ?auto_388075 ) ) ( not ( = ?auto_388066 ?auto_388076 ) ) ( not ( = ?auto_388067 ?auto_388068 ) ) ( not ( = ?auto_388067 ?auto_388069 ) ) ( not ( = ?auto_388067 ?auto_388070 ) ) ( not ( = ?auto_388067 ?auto_388071 ) ) ( not ( = ?auto_388067 ?auto_388072 ) ) ( not ( = ?auto_388067 ?auto_388073 ) ) ( not ( = ?auto_388067 ?auto_388074 ) ) ( not ( = ?auto_388067 ?auto_388075 ) ) ( not ( = ?auto_388067 ?auto_388076 ) ) ( not ( = ?auto_388068 ?auto_388069 ) ) ( not ( = ?auto_388068 ?auto_388070 ) ) ( not ( = ?auto_388068 ?auto_388071 ) ) ( not ( = ?auto_388068 ?auto_388072 ) ) ( not ( = ?auto_388068 ?auto_388073 ) ) ( not ( = ?auto_388068 ?auto_388074 ) ) ( not ( = ?auto_388068 ?auto_388075 ) ) ( not ( = ?auto_388068 ?auto_388076 ) ) ( not ( = ?auto_388069 ?auto_388070 ) ) ( not ( = ?auto_388069 ?auto_388071 ) ) ( not ( = ?auto_388069 ?auto_388072 ) ) ( not ( = ?auto_388069 ?auto_388073 ) ) ( not ( = ?auto_388069 ?auto_388074 ) ) ( not ( = ?auto_388069 ?auto_388075 ) ) ( not ( = ?auto_388069 ?auto_388076 ) ) ( not ( = ?auto_388070 ?auto_388071 ) ) ( not ( = ?auto_388070 ?auto_388072 ) ) ( not ( = ?auto_388070 ?auto_388073 ) ) ( not ( = ?auto_388070 ?auto_388074 ) ) ( not ( = ?auto_388070 ?auto_388075 ) ) ( not ( = ?auto_388070 ?auto_388076 ) ) ( not ( = ?auto_388071 ?auto_388072 ) ) ( not ( = ?auto_388071 ?auto_388073 ) ) ( not ( = ?auto_388071 ?auto_388074 ) ) ( not ( = ?auto_388071 ?auto_388075 ) ) ( not ( = ?auto_388071 ?auto_388076 ) ) ( not ( = ?auto_388072 ?auto_388073 ) ) ( not ( = ?auto_388072 ?auto_388074 ) ) ( not ( = ?auto_388072 ?auto_388075 ) ) ( not ( = ?auto_388072 ?auto_388076 ) ) ( not ( = ?auto_388073 ?auto_388074 ) ) ( not ( = ?auto_388073 ?auto_388075 ) ) ( not ( = ?auto_388073 ?auto_388076 ) ) ( not ( = ?auto_388074 ?auto_388075 ) ) ( not ( = ?auto_388074 ?auto_388076 ) ) ( not ( = ?auto_388075 ?auto_388076 ) ) ( ON ?auto_388074 ?auto_388075 ) ( ON ?auto_388073 ?auto_388074 ) ( CLEAR ?auto_388071 ) ( ON ?auto_388072 ?auto_388073 ) ( CLEAR ?auto_388072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388066 ?auto_388067 ?auto_388068 ?auto_388069 ?auto_388070 ?auto_388071 ?auto_388072 )
      ( MAKE-10PILE ?auto_388066 ?auto_388067 ?auto_388068 ?auto_388069 ?auto_388070 ?auto_388071 ?auto_388072 ?auto_388073 ?auto_388074 ?auto_388075 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388087 - BLOCK
      ?auto_388088 - BLOCK
      ?auto_388089 - BLOCK
      ?auto_388090 - BLOCK
      ?auto_388091 - BLOCK
      ?auto_388092 - BLOCK
      ?auto_388093 - BLOCK
      ?auto_388094 - BLOCK
      ?auto_388095 - BLOCK
      ?auto_388096 - BLOCK
    )
    :vars
    (
      ?auto_388097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388096 ?auto_388097 ) ( ON-TABLE ?auto_388087 ) ( ON ?auto_388088 ?auto_388087 ) ( ON ?auto_388089 ?auto_388088 ) ( ON ?auto_388090 ?auto_388089 ) ( ON ?auto_388091 ?auto_388090 ) ( ON ?auto_388092 ?auto_388091 ) ( not ( = ?auto_388087 ?auto_388088 ) ) ( not ( = ?auto_388087 ?auto_388089 ) ) ( not ( = ?auto_388087 ?auto_388090 ) ) ( not ( = ?auto_388087 ?auto_388091 ) ) ( not ( = ?auto_388087 ?auto_388092 ) ) ( not ( = ?auto_388087 ?auto_388093 ) ) ( not ( = ?auto_388087 ?auto_388094 ) ) ( not ( = ?auto_388087 ?auto_388095 ) ) ( not ( = ?auto_388087 ?auto_388096 ) ) ( not ( = ?auto_388087 ?auto_388097 ) ) ( not ( = ?auto_388088 ?auto_388089 ) ) ( not ( = ?auto_388088 ?auto_388090 ) ) ( not ( = ?auto_388088 ?auto_388091 ) ) ( not ( = ?auto_388088 ?auto_388092 ) ) ( not ( = ?auto_388088 ?auto_388093 ) ) ( not ( = ?auto_388088 ?auto_388094 ) ) ( not ( = ?auto_388088 ?auto_388095 ) ) ( not ( = ?auto_388088 ?auto_388096 ) ) ( not ( = ?auto_388088 ?auto_388097 ) ) ( not ( = ?auto_388089 ?auto_388090 ) ) ( not ( = ?auto_388089 ?auto_388091 ) ) ( not ( = ?auto_388089 ?auto_388092 ) ) ( not ( = ?auto_388089 ?auto_388093 ) ) ( not ( = ?auto_388089 ?auto_388094 ) ) ( not ( = ?auto_388089 ?auto_388095 ) ) ( not ( = ?auto_388089 ?auto_388096 ) ) ( not ( = ?auto_388089 ?auto_388097 ) ) ( not ( = ?auto_388090 ?auto_388091 ) ) ( not ( = ?auto_388090 ?auto_388092 ) ) ( not ( = ?auto_388090 ?auto_388093 ) ) ( not ( = ?auto_388090 ?auto_388094 ) ) ( not ( = ?auto_388090 ?auto_388095 ) ) ( not ( = ?auto_388090 ?auto_388096 ) ) ( not ( = ?auto_388090 ?auto_388097 ) ) ( not ( = ?auto_388091 ?auto_388092 ) ) ( not ( = ?auto_388091 ?auto_388093 ) ) ( not ( = ?auto_388091 ?auto_388094 ) ) ( not ( = ?auto_388091 ?auto_388095 ) ) ( not ( = ?auto_388091 ?auto_388096 ) ) ( not ( = ?auto_388091 ?auto_388097 ) ) ( not ( = ?auto_388092 ?auto_388093 ) ) ( not ( = ?auto_388092 ?auto_388094 ) ) ( not ( = ?auto_388092 ?auto_388095 ) ) ( not ( = ?auto_388092 ?auto_388096 ) ) ( not ( = ?auto_388092 ?auto_388097 ) ) ( not ( = ?auto_388093 ?auto_388094 ) ) ( not ( = ?auto_388093 ?auto_388095 ) ) ( not ( = ?auto_388093 ?auto_388096 ) ) ( not ( = ?auto_388093 ?auto_388097 ) ) ( not ( = ?auto_388094 ?auto_388095 ) ) ( not ( = ?auto_388094 ?auto_388096 ) ) ( not ( = ?auto_388094 ?auto_388097 ) ) ( not ( = ?auto_388095 ?auto_388096 ) ) ( not ( = ?auto_388095 ?auto_388097 ) ) ( not ( = ?auto_388096 ?auto_388097 ) ) ( ON ?auto_388095 ?auto_388096 ) ( ON ?auto_388094 ?auto_388095 ) ( CLEAR ?auto_388092 ) ( ON ?auto_388093 ?auto_388094 ) ( CLEAR ?auto_388093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388087 ?auto_388088 ?auto_388089 ?auto_388090 ?auto_388091 ?auto_388092 ?auto_388093 )
      ( MAKE-10PILE ?auto_388087 ?auto_388088 ?auto_388089 ?auto_388090 ?auto_388091 ?auto_388092 ?auto_388093 ?auto_388094 ?auto_388095 ?auto_388096 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388108 - BLOCK
      ?auto_388109 - BLOCK
      ?auto_388110 - BLOCK
      ?auto_388111 - BLOCK
      ?auto_388112 - BLOCK
      ?auto_388113 - BLOCK
      ?auto_388114 - BLOCK
      ?auto_388115 - BLOCK
      ?auto_388116 - BLOCK
      ?auto_388117 - BLOCK
    )
    :vars
    (
      ?auto_388118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388117 ?auto_388118 ) ( ON-TABLE ?auto_388108 ) ( ON ?auto_388109 ?auto_388108 ) ( ON ?auto_388110 ?auto_388109 ) ( ON ?auto_388111 ?auto_388110 ) ( ON ?auto_388112 ?auto_388111 ) ( not ( = ?auto_388108 ?auto_388109 ) ) ( not ( = ?auto_388108 ?auto_388110 ) ) ( not ( = ?auto_388108 ?auto_388111 ) ) ( not ( = ?auto_388108 ?auto_388112 ) ) ( not ( = ?auto_388108 ?auto_388113 ) ) ( not ( = ?auto_388108 ?auto_388114 ) ) ( not ( = ?auto_388108 ?auto_388115 ) ) ( not ( = ?auto_388108 ?auto_388116 ) ) ( not ( = ?auto_388108 ?auto_388117 ) ) ( not ( = ?auto_388108 ?auto_388118 ) ) ( not ( = ?auto_388109 ?auto_388110 ) ) ( not ( = ?auto_388109 ?auto_388111 ) ) ( not ( = ?auto_388109 ?auto_388112 ) ) ( not ( = ?auto_388109 ?auto_388113 ) ) ( not ( = ?auto_388109 ?auto_388114 ) ) ( not ( = ?auto_388109 ?auto_388115 ) ) ( not ( = ?auto_388109 ?auto_388116 ) ) ( not ( = ?auto_388109 ?auto_388117 ) ) ( not ( = ?auto_388109 ?auto_388118 ) ) ( not ( = ?auto_388110 ?auto_388111 ) ) ( not ( = ?auto_388110 ?auto_388112 ) ) ( not ( = ?auto_388110 ?auto_388113 ) ) ( not ( = ?auto_388110 ?auto_388114 ) ) ( not ( = ?auto_388110 ?auto_388115 ) ) ( not ( = ?auto_388110 ?auto_388116 ) ) ( not ( = ?auto_388110 ?auto_388117 ) ) ( not ( = ?auto_388110 ?auto_388118 ) ) ( not ( = ?auto_388111 ?auto_388112 ) ) ( not ( = ?auto_388111 ?auto_388113 ) ) ( not ( = ?auto_388111 ?auto_388114 ) ) ( not ( = ?auto_388111 ?auto_388115 ) ) ( not ( = ?auto_388111 ?auto_388116 ) ) ( not ( = ?auto_388111 ?auto_388117 ) ) ( not ( = ?auto_388111 ?auto_388118 ) ) ( not ( = ?auto_388112 ?auto_388113 ) ) ( not ( = ?auto_388112 ?auto_388114 ) ) ( not ( = ?auto_388112 ?auto_388115 ) ) ( not ( = ?auto_388112 ?auto_388116 ) ) ( not ( = ?auto_388112 ?auto_388117 ) ) ( not ( = ?auto_388112 ?auto_388118 ) ) ( not ( = ?auto_388113 ?auto_388114 ) ) ( not ( = ?auto_388113 ?auto_388115 ) ) ( not ( = ?auto_388113 ?auto_388116 ) ) ( not ( = ?auto_388113 ?auto_388117 ) ) ( not ( = ?auto_388113 ?auto_388118 ) ) ( not ( = ?auto_388114 ?auto_388115 ) ) ( not ( = ?auto_388114 ?auto_388116 ) ) ( not ( = ?auto_388114 ?auto_388117 ) ) ( not ( = ?auto_388114 ?auto_388118 ) ) ( not ( = ?auto_388115 ?auto_388116 ) ) ( not ( = ?auto_388115 ?auto_388117 ) ) ( not ( = ?auto_388115 ?auto_388118 ) ) ( not ( = ?auto_388116 ?auto_388117 ) ) ( not ( = ?auto_388116 ?auto_388118 ) ) ( not ( = ?auto_388117 ?auto_388118 ) ) ( ON ?auto_388116 ?auto_388117 ) ( ON ?auto_388115 ?auto_388116 ) ( ON ?auto_388114 ?auto_388115 ) ( CLEAR ?auto_388112 ) ( ON ?auto_388113 ?auto_388114 ) ( CLEAR ?auto_388113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388108 ?auto_388109 ?auto_388110 ?auto_388111 ?auto_388112 ?auto_388113 )
      ( MAKE-10PILE ?auto_388108 ?auto_388109 ?auto_388110 ?auto_388111 ?auto_388112 ?auto_388113 ?auto_388114 ?auto_388115 ?auto_388116 ?auto_388117 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388129 - BLOCK
      ?auto_388130 - BLOCK
      ?auto_388131 - BLOCK
      ?auto_388132 - BLOCK
      ?auto_388133 - BLOCK
      ?auto_388134 - BLOCK
      ?auto_388135 - BLOCK
      ?auto_388136 - BLOCK
      ?auto_388137 - BLOCK
      ?auto_388138 - BLOCK
    )
    :vars
    (
      ?auto_388139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388138 ?auto_388139 ) ( ON-TABLE ?auto_388129 ) ( ON ?auto_388130 ?auto_388129 ) ( ON ?auto_388131 ?auto_388130 ) ( ON ?auto_388132 ?auto_388131 ) ( ON ?auto_388133 ?auto_388132 ) ( not ( = ?auto_388129 ?auto_388130 ) ) ( not ( = ?auto_388129 ?auto_388131 ) ) ( not ( = ?auto_388129 ?auto_388132 ) ) ( not ( = ?auto_388129 ?auto_388133 ) ) ( not ( = ?auto_388129 ?auto_388134 ) ) ( not ( = ?auto_388129 ?auto_388135 ) ) ( not ( = ?auto_388129 ?auto_388136 ) ) ( not ( = ?auto_388129 ?auto_388137 ) ) ( not ( = ?auto_388129 ?auto_388138 ) ) ( not ( = ?auto_388129 ?auto_388139 ) ) ( not ( = ?auto_388130 ?auto_388131 ) ) ( not ( = ?auto_388130 ?auto_388132 ) ) ( not ( = ?auto_388130 ?auto_388133 ) ) ( not ( = ?auto_388130 ?auto_388134 ) ) ( not ( = ?auto_388130 ?auto_388135 ) ) ( not ( = ?auto_388130 ?auto_388136 ) ) ( not ( = ?auto_388130 ?auto_388137 ) ) ( not ( = ?auto_388130 ?auto_388138 ) ) ( not ( = ?auto_388130 ?auto_388139 ) ) ( not ( = ?auto_388131 ?auto_388132 ) ) ( not ( = ?auto_388131 ?auto_388133 ) ) ( not ( = ?auto_388131 ?auto_388134 ) ) ( not ( = ?auto_388131 ?auto_388135 ) ) ( not ( = ?auto_388131 ?auto_388136 ) ) ( not ( = ?auto_388131 ?auto_388137 ) ) ( not ( = ?auto_388131 ?auto_388138 ) ) ( not ( = ?auto_388131 ?auto_388139 ) ) ( not ( = ?auto_388132 ?auto_388133 ) ) ( not ( = ?auto_388132 ?auto_388134 ) ) ( not ( = ?auto_388132 ?auto_388135 ) ) ( not ( = ?auto_388132 ?auto_388136 ) ) ( not ( = ?auto_388132 ?auto_388137 ) ) ( not ( = ?auto_388132 ?auto_388138 ) ) ( not ( = ?auto_388132 ?auto_388139 ) ) ( not ( = ?auto_388133 ?auto_388134 ) ) ( not ( = ?auto_388133 ?auto_388135 ) ) ( not ( = ?auto_388133 ?auto_388136 ) ) ( not ( = ?auto_388133 ?auto_388137 ) ) ( not ( = ?auto_388133 ?auto_388138 ) ) ( not ( = ?auto_388133 ?auto_388139 ) ) ( not ( = ?auto_388134 ?auto_388135 ) ) ( not ( = ?auto_388134 ?auto_388136 ) ) ( not ( = ?auto_388134 ?auto_388137 ) ) ( not ( = ?auto_388134 ?auto_388138 ) ) ( not ( = ?auto_388134 ?auto_388139 ) ) ( not ( = ?auto_388135 ?auto_388136 ) ) ( not ( = ?auto_388135 ?auto_388137 ) ) ( not ( = ?auto_388135 ?auto_388138 ) ) ( not ( = ?auto_388135 ?auto_388139 ) ) ( not ( = ?auto_388136 ?auto_388137 ) ) ( not ( = ?auto_388136 ?auto_388138 ) ) ( not ( = ?auto_388136 ?auto_388139 ) ) ( not ( = ?auto_388137 ?auto_388138 ) ) ( not ( = ?auto_388137 ?auto_388139 ) ) ( not ( = ?auto_388138 ?auto_388139 ) ) ( ON ?auto_388137 ?auto_388138 ) ( ON ?auto_388136 ?auto_388137 ) ( ON ?auto_388135 ?auto_388136 ) ( CLEAR ?auto_388133 ) ( ON ?auto_388134 ?auto_388135 ) ( CLEAR ?auto_388134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388129 ?auto_388130 ?auto_388131 ?auto_388132 ?auto_388133 ?auto_388134 )
      ( MAKE-10PILE ?auto_388129 ?auto_388130 ?auto_388131 ?auto_388132 ?auto_388133 ?auto_388134 ?auto_388135 ?auto_388136 ?auto_388137 ?auto_388138 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388150 - BLOCK
      ?auto_388151 - BLOCK
      ?auto_388152 - BLOCK
      ?auto_388153 - BLOCK
      ?auto_388154 - BLOCK
      ?auto_388155 - BLOCK
      ?auto_388156 - BLOCK
      ?auto_388157 - BLOCK
      ?auto_388158 - BLOCK
      ?auto_388159 - BLOCK
    )
    :vars
    (
      ?auto_388160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388159 ?auto_388160 ) ( ON-TABLE ?auto_388150 ) ( ON ?auto_388151 ?auto_388150 ) ( ON ?auto_388152 ?auto_388151 ) ( ON ?auto_388153 ?auto_388152 ) ( not ( = ?auto_388150 ?auto_388151 ) ) ( not ( = ?auto_388150 ?auto_388152 ) ) ( not ( = ?auto_388150 ?auto_388153 ) ) ( not ( = ?auto_388150 ?auto_388154 ) ) ( not ( = ?auto_388150 ?auto_388155 ) ) ( not ( = ?auto_388150 ?auto_388156 ) ) ( not ( = ?auto_388150 ?auto_388157 ) ) ( not ( = ?auto_388150 ?auto_388158 ) ) ( not ( = ?auto_388150 ?auto_388159 ) ) ( not ( = ?auto_388150 ?auto_388160 ) ) ( not ( = ?auto_388151 ?auto_388152 ) ) ( not ( = ?auto_388151 ?auto_388153 ) ) ( not ( = ?auto_388151 ?auto_388154 ) ) ( not ( = ?auto_388151 ?auto_388155 ) ) ( not ( = ?auto_388151 ?auto_388156 ) ) ( not ( = ?auto_388151 ?auto_388157 ) ) ( not ( = ?auto_388151 ?auto_388158 ) ) ( not ( = ?auto_388151 ?auto_388159 ) ) ( not ( = ?auto_388151 ?auto_388160 ) ) ( not ( = ?auto_388152 ?auto_388153 ) ) ( not ( = ?auto_388152 ?auto_388154 ) ) ( not ( = ?auto_388152 ?auto_388155 ) ) ( not ( = ?auto_388152 ?auto_388156 ) ) ( not ( = ?auto_388152 ?auto_388157 ) ) ( not ( = ?auto_388152 ?auto_388158 ) ) ( not ( = ?auto_388152 ?auto_388159 ) ) ( not ( = ?auto_388152 ?auto_388160 ) ) ( not ( = ?auto_388153 ?auto_388154 ) ) ( not ( = ?auto_388153 ?auto_388155 ) ) ( not ( = ?auto_388153 ?auto_388156 ) ) ( not ( = ?auto_388153 ?auto_388157 ) ) ( not ( = ?auto_388153 ?auto_388158 ) ) ( not ( = ?auto_388153 ?auto_388159 ) ) ( not ( = ?auto_388153 ?auto_388160 ) ) ( not ( = ?auto_388154 ?auto_388155 ) ) ( not ( = ?auto_388154 ?auto_388156 ) ) ( not ( = ?auto_388154 ?auto_388157 ) ) ( not ( = ?auto_388154 ?auto_388158 ) ) ( not ( = ?auto_388154 ?auto_388159 ) ) ( not ( = ?auto_388154 ?auto_388160 ) ) ( not ( = ?auto_388155 ?auto_388156 ) ) ( not ( = ?auto_388155 ?auto_388157 ) ) ( not ( = ?auto_388155 ?auto_388158 ) ) ( not ( = ?auto_388155 ?auto_388159 ) ) ( not ( = ?auto_388155 ?auto_388160 ) ) ( not ( = ?auto_388156 ?auto_388157 ) ) ( not ( = ?auto_388156 ?auto_388158 ) ) ( not ( = ?auto_388156 ?auto_388159 ) ) ( not ( = ?auto_388156 ?auto_388160 ) ) ( not ( = ?auto_388157 ?auto_388158 ) ) ( not ( = ?auto_388157 ?auto_388159 ) ) ( not ( = ?auto_388157 ?auto_388160 ) ) ( not ( = ?auto_388158 ?auto_388159 ) ) ( not ( = ?auto_388158 ?auto_388160 ) ) ( not ( = ?auto_388159 ?auto_388160 ) ) ( ON ?auto_388158 ?auto_388159 ) ( ON ?auto_388157 ?auto_388158 ) ( ON ?auto_388156 ?auto_388157 ) ( ON ?auto_388155 ?auto_388156 ) ( CLEAR ?auto_388153 ) ( ON ?auto_388154 ?auto_388155 ) ( CLEAR ?auto_388154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388150 ?auto_388151 ?auto_388152 ?auto_388153 ?auto_388154 )
      ( MAKE-10PILE ?auto_388150 ?auto_388151 ?auto_388152 ?auto_388153 ?auto_388154 ?auto_388155 ?auto_388156 ?auto_388157 ?auto_388158 ?auto_388159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388171 - BLOCK
      ?auto_388172 - BLOCK
      ?auto_388173 - BLOCK
      ?auto_388174 - BLOCK
      ?auto_388175 - BLOCK
      ?auto_388176 - BLOCK
      ?auto_388177 - BLOCK
      ?auto_388178 - BLOCK
      ?auto_388179 - BLOCK
      ?auto_388180 - BLOCK
    )
    :vars
    (
      ?auto_388181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388180 ?auto_388181 ) ( ON-TABLE ?auto_388171 ) ( ON ?auto_388172 ?auto_388171 ) ( ON ?auto_388173 ?auto_388172 ) ( ON ?auto_388174 ?auto_388173 ) ( not ( = ?auto_388171 ?auto_388172 ) ) ( not ( = ?auto_388171 ?auto_388173 ) ) ( not ( = ?auto_388171 ?auto_388174 ) ) ( not ( = ?auto_388171 ?auto_388175 ) ) ( not ( = ?auto_388171 ?auto_388176 ) ) ( not ( = ?auto_388171 ?auto_388177 ) ) ( not ( = ?auto_388171 ?auto_388178 ) ) ( not ( = ?auto_388171 ?auto_388179 ) ) ( not ( = ?auto_388171 ?auto_388180 ) ) ( not ( = ?auto_388171 ?auto_388181 ) ) ( not ( = ?auto_388172 ?auto_388173 ) ) ( not ( = ?auto_388172 ?auto_388174 ) ) ( not ( = ?auto_388172 ?auto_388175 ) ) ( not ( = ?auto_388172 ?auto_388176 ) ) ( not ( = ?auto_388172 ?auto_388177 ) ) ( not ( = ?auto_388172 ?auto_388178 ) ) ( not ( = ?auto_388172 ?auto_388179 ) ) ( not ( = ?auto_388172 ?auto_388180 ) ) ( not ( = ?auto_388172 ?auto_388181 ) ) ( not ( = ?auto_388173 ?auto_388174 ) ) ( not ( = ?auto_388173 ?auto_388175 ) ) ( not ( = ?auto_388173 ?auto_388176 ) ) ( not ( = ?auto_388173 ?auto_388177 ) ) ( not ( = ?auto_388173 ?auto_388178 ) ) ( not ( = ?auto_388173 ?auto_388179 ) ) ( not ( = ?auto_388173 ?auto_388180 ) ) ( not ( = ?auto_388173 ?auto_388181 ) ) ( not ( = ?auto_388174 ?auto_388175 ) ) ( not ( = ?auto_388174 ?auto_388176 ) ) ( not ( = ?auto_388174 ?auto_388177 ) ) ( not ( = ?auto_388174 ?auto_388178 ) ) ( not ( = ?auto_388174 ?auto_388179 ) ) ( not ( = ?auto_388174 ?auto_388180 ) ) ( not ( = ?auto_388174 ?auto_388181 ) ) ( not ( = ?auto_388175 ?auto_388176 ) ) ( not ( = ?auto_388175 ?auto_388177 ) ) ( not ( = ?auto_388175 ?auto_388178 ) ) ( not ( = ?auto_388175 ?auto_388179 ) ) ( not ( = ?auto_388175 ?auto_388180 ) ) ( not ( = ?auto_388175 ?auto_388181 ) ) ( not ( = ?auto_388176 ?auto_388177 ) ) ( not ( = ?auto_388176 ?auto_388178 ) ) ( not ( = ?auto_388176 ?auto_388179 ) ) ( not ( = ?auto_388176 ?auto_388180 ) ) ( not ( = ?auto_388176 ?auto_388181 ) ) ( not ( = ?auto_388177 ?auto_388178 ) ) ( not ( = ?auto_388177 ?auto_388179 ) ) ( not ( = ?auto_388177 ?auto_388180 ) ) ( not ( = ?auto_388177 ?auto_388181 ) ) ( not ( = ?auto_388178 ?auto_388179 ) ) ( not ( = ?auto_388178 ?auto_388180 ) ) ( not ( = ?auto_388178 ?auto_388181 ) ) ( not ( = ?auto_388179 ?auto_388180 ) ) ( not ( = ?auto_388179 ?auto_388181 ) ) ( not ( = ?auto_388180 ?auto_388181 ) ) ( ON ?auto_388179 ?auto_388180 ) ( ON ?auto_388178 ?auto_388179 ) ( ON ?auto_388177 ?auto_388178 ) ( ON ?auto_388176 ?auto_388177 ) ( CLEAR ?auto_388174 ) ( ON ?auto_388175 ?auto_388176 ) ( CLEAR ?auto_388175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388171 ?auto_388172 ?auto_388173 ?auto_388174 ?auto_388175 )
      ( MAKE-10PILE ?auto_388171 ?auto_388172 ?auto_388173 ?auto_388174 ?auto_388175 ?auto_388176 ?auto_388177 ?auto_388178 ?auto_388179 ?auto_388180 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388192 - BLOCK
      ?auto_388193 - BLOCK
      ?auto_388194 - BLOCK
      ?auto_388195 - BLOCK
      ?auto_388196 - BLOCK
      ?auto_388197 - BLOCK
      ?auto_388198 - BLOCK
      ?auto_388199 - BLOCK
      ?auto_388200 - BLOCK
      ?auto_388201 - BLOCK
    )
    :vars
    (
      ?auto_388202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388201 ?auto_388202 ) ( ON-TABLE ?auto_388192 ) ( ON ?auto_388193 ?auto_388192 ) ( ON ?auto_388194 ?auto_388193 ) ( not ( = ?auto_388192 ?auto_388193 ) ) ( not ( = ?auto_388192 ?auto_388194 ) ) ( not ( = ?auto_388192 ?auto_388195 ) ) ( not ( = ?auto_388192 ?auto_388196 ) ) ( not ( = ?auto_388192 ?auto_388197 ) ) ( not ( = ?auto_388192 ?auto_388198 ) ) ( not ( = ?auto_388192 ?auto_388199 ) ) ( not ( = ?auto_388192 ?auto_388200 ) ) ( not ( = ?auto_388192 ?auto_388201 ) ) ( not ( = ?auto_388192 ?auto_388202 ) ) ( not ( = ?auto_388193 ?auto_388194 ) ) ( not ( = ?auto_388193 ?auto_388195 ) ) ( not ( = ?auto_388193 ?auto_388196 ) ) ( not ( = ?auto_388193 ?auto_388197 ) ) ( not ( = ?auto_388193 ?auto_388198 ) ) ( not ( = ?auto_388193 ?auto_388199 ) ) ( not ( = ?auto_388193 ?auto_388200 ) ) ( not ( = ?auto_388193 ?auto_388201 ) ) ( not ( = ?auto_388193 ?auto_388202 ) ) ( not ( = ?auto_388194 ?auto_388195 ) ) ( not ( = ?auto_388194 ?auto_388196 ) ) ( not ( = ?auto_388194 ?auto_388197 ) ) ( not ( = ?auto_388194 ?auto_388198 ) ) ( not ( = ?auto_388194 ?auto_388199 ) ) ( not ( = ?auto_388194 ?auto_388200 ) ) ( not ( = ?auto_388194 ?auto_388201 ) ) ( not ( = ?auto_388194 ?auto_388202 ) ) ( not ( = ?auto_388195 ?auto_388196 ) ) ( not ( = ?auto_388195 ?auto_388197 ) ) ( not ( = ?auto_388195 ?auto_388198 ) ) ( not ( = ?auto_388195 ?auto_388199 ) ) ( not ( = ?auto_388195 ?auto_388200 ) ) ( not ( = ?auto_388195 ?auto_388201 ) ) ( not ( = ?auto_388195 ?auto_388202 ) ) ( not ( = ?auto_388196 ?auto_388197 ) ) ( not ( = ?auto_388196 ?auto_388198 ) ) ( not ( = ?auto_388196 ?auto_388199 ) ) ( not ( = ?auto_388196 ?auto_388200 ) ) ( not ( = ?auto_388196 ?auto_388201 ) ) ( not ( = ?auto_388196 ?auto_388202 ) ) ( not ( = ?auto_388197 ?auto_388198 ) ) ( not ( = ?auto_388197 ?auto_388199 ) ) ( not ( = ?auto_388197 ?auto_388200 ) ) ( not ( = ?auto_388197 ?auto_388201 ) ) ( not ( = ?auto_388197 ?auto_388202 ) ) ( not ( = ?auto_388198 ?auto_388199 ) ) ( not ( = ?auto_388198 ?auto_388200 ) ) ( not ( = ?auto_388198 ?auto_388201 ) ) ( not ( = ?auto_388198 ?auto_388202 ) ) ( not ( = ?auto_388199 ?auto_388200 ) ) ( not ( = ?auto_388199 ?auto_388201 ) ) ( not ( = ?auto_388199 ?auto_388202 ) ) ( not ( = ?auto_388200 ?auto_388201 ) ) ( not ( = ?auto_388200 ?auto_388202 ) ) ( not ( = ?auto_388201 ?auto_388202 ) ) ( ON ?auto_388200 ?auto_388201 ) ( ON ?auto_388199 ?auto_388200 ) ( ON ?auto_388198 ?auto_388199 ) ( ON ?auto_388197 ?auto_388198 ) ( ON ?auto_388196 ?auto_388197 ) ( CLEAR ?auto_388194 ) ( ON ?auto_388195 ?auto_388196 ) ( CLEAR ?auto_388195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388192 ?auto_388193 ?auto_388194 ?auto_388195 )
      ( MAKE-10PILE ?auto_388192 ?auto_388193 ?auto_388194 ?auto_388195 ?auto_388196 ?auto_388197 ?auto_388198 ?auto_388199 ?auto_388200 ?auto_388201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388213 - BLOCK
      ?auto_388214 - BLOCK
      ?auto_388215 - BLOCK
      ?auto_388216 - BLOCK
      ?auto_388217 - BLOCK
      ?auto_388218 - BLOCK
      ?auto_388219 - BLOCK
      ?auto_388220 - BLOCK
      ?auto_388221 - BLOCK
      ?auto_388222 - BLOCK
    )
    :vars
    (
      ?auto_388223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388222 ?auto_388223 ) ( ON-TABLE ?auto_388213 ) ( ON ?auto_388214 ?auto_388213 ) ( ON ?auto_388215 ?auto_388214 ) ( not ( = ?auto_388213 ?auto_388214 ) ) ( not ( = ?auto_388213 ?auto_388215 ) ) ( not ( = ?auto_388213 ?auto_388216 ) ) ( not ( = ?auto_388213 ?auto_388217 ) ) ( not ( = ?auto_388213 ?auto_388218 ) ) ( not ( = ?auto_388213 ?auto_388219 ) ) ( not ( = ?auto_388213 ?auto_388220 ) ) ( not ( = ?auto_388213 ?auto_388221 ) ) ( not ( = ?auto_388213 ?auto_388222 ) ) ( not ( = ?auto_388213 ?auto_388223 ) ) ( not ( = ?auto_388214 ?auto_388215 ) ) ( not ( = ?auto_388214 ?auto_388216 ) ) ( not ( = ?auto_388214 ?auto_388217 ) ) ( not ( = ?auto_388214 ?auto_388218 ) ) ( not ( = ?auto_388214 ?auto_388219 ) ) ( not ( = ?auto_388214 ?auto_388220 ) ) ( not ( = ?auto_388214 ?auto_388221 ) ) ( not ( = ?auto_388214 ?auto_388222 ) ) ( not ( = ?auto_388214 ?auto_388223 ) ) ( not ( = ?auto_388215 ?auto_388216 ) ) ( not ( = ?auto_388215 ?auto_388217 ) ) ( not ( = ?auto_388215 ?auto_388218 ) ) ( not ( = ?auto_388215 ?auto_388219 ) ) ( not ( = ?auto_388215 ?auto_388220 ) ) ( not ( = ?auto_388215 ?auto_388221 ) ) ( not ( = ?auto_388215 ?auto_388222 ) ) ( not ( = ?auto_388215 ?auto_388223 ) ) ( not ( = ?auto_388216 ?auto_388217 ) ) ( not ( = ?auto_388216 ?auto_388218 ) ) ( not ( = ?auto_388216 ?auto_388219 ) ) ( not ( = ?auto_388216 ?auto_388220 ) ) ( not ( = ?auto_388216 ?auto_388221 ) ) ( not ( = ?auto_388216 ?auto_388222 ) ) ( not ( = ?auto_388216 ?auto_388223 ) ) ( not ( = ?auto_388217 ?auto_388218 ) ) ( not ( = ?auto_388217 ?auto_388219 ) ) ( not ( = ?auto_388217 ?auto_388220 ) ) ( not ( = ?auto_388217 ?auto_388221 ) ) ( not ( = ?auto_388217 ?auto_388222 ) ) ( not ( = ?auto_388217 ?auto_388223 ) ) ( not ( = ?auto_388218 ?auto_388219 ) ) ( not ( = ?auto_388218 ?auto_388220 ) ) ( not ( = ?auto_388218 ?auto_388221 ) ) ( not ( = ?auto_388218 ?auto_388222 ) ) ( not ( = ?auto_388218 ?auto_388223 ) ) ( not ( = ?auto_388219 ?auto_388220 ) ) ( not ( = ?auto_388219 ?auto_388221 ) ) ( not ( = ?auto_388219 ?auto_388222 ) ) ( not ( = ?auto_388219 ?auto_388223 ) ) ( not ( = ?auto_388220 ?auto_388221 ) ) ( not ( = ?auto_388220 ?auto_388222 ) ) ( not ( = ?auto_388220 ?auto_388223 ) ) ( not ( = ?auto_388221 ?auto_388222 ) ) ( not ( = ?auto_388221 ?auto_388223 ) ) ( not ( = ?auto_388222 ?auto_388223 ) ) ( ON ?auto_388221 ?auto_388222 ) ( ON ?auto_388220 ?auto_388221 ) ( ON ?auto_388219 ?auto_388220 ) ( ON ?auto_388218 ?auto_388219 ) ( ON ?auto_388217 ?auto_388218 ) ( CLEAR ?auto_388215 ) ( ON ?auto_388216 ?auto_388217 ) ( CLEAR ?auto_388216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388213 ?auto_388214 ?auto_388215 ?auto_388216 )
      ( MAKE-10PILE ?auto_388213 ?auto_388214 ?auto_388215 ?auto_388216 ?auto_388217 ?auto_388218 ?auto_388219 ?auto_388220 ?auto_388221 ?auto_388222 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388234 - BLOCK
      ?auto_388235 - BLOCK
      ?auto_388236 - BLOCK
      ?auto_388237 - BLOCK
      ?auto_388238 - BLOCK
      ?auto_388239 - BLOCK
      ?auto_388240 - BLOCK
      ?auto_388241 - BLOCK
      ?auto_388242 - BLOCK
      ?auto_388243 - BLOCK
    )
    :vars
    (
      ?auto_388244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388243 ?auto_388244 ) ( ON-TABLE ?auto_388234 ) ( ON ?auto_388235 ?auto_388234 ) ( not ( = ?auto_388234 ?auto_388235 ) ) ( not ( = ?auto_388234 ?auto_388236 ) ) ( not ( = ?auto_388234 ?auto_388237 ) ) ( not ( = ?auto_388234 ?auto_388238 ) ) ( not ( = ?auto_388234 ?auto_388239 ) ) ( not ( = ?auto_388234 ?auto_388240 ) ) ( not ( = ?auto_388234 ?auto_388241 ) ) ( not ( = ?auto_388234 ?auto_388242 ) ) ( not ( = ?auto_388234 ?auto_388243 ) ) ( not ( = ?auto_388234 ?auto_388244 ) ) ( not ( = ?auto_388235 ?auto_388236 ) ) ( not ( = ?auto_388235 ?auto_388237 ) ) ( not ( = ?auto_388235 ?auto_388238 ) ) ( not ( = ?auto_388235 ?auto_388239 ) ) ( not ( = ?auto_388235 ?auto_388240 ) ) ( not ( = ?auto_388235 ?auto_388241 ) ) ( not ( = ?auto_388235 ?auto_388242 ) ) ( not ( = ?auto_388235 ?auto_388243 ) ) ( not ( = ?auto_388235 ?auto_388244 ) ) ( not ( = ?auto_388236 ?auto_388237 ) ) ( not ( = ?auto_388236 ?auto_388238 ) ) ( not ( = ?auto_388236 ?auto_388239 ) ) ( not ( = ?auto_388236 ?auto_388240 ) ) ( not ( = ?auto_388236 ?auto_388241 ) ) ( not ( = ?auto_388236 ?auto_388242 ) ) ( not ( = ?auto_388236 ?auto_388243 ) ) ( not ( = ?auto_388236 ?auto_388244 ) ) ( not ( = ?auto_388237 ?auto_388238 ) ) ( not ( = ?auto_388237 ?auto_388239 ) ) ( not ( = ?auto_388237 ?auto_388240 ) ) ( not ( = ?auto_388237 ?auto_388241 ) ) ( not ( = ?auto_388237 ?auto_388242 ) ) ( not ( = ?auto_388237 ?auto_388243 ) ) ( not ( = ?auto_388237 ?auto_388244 ) ) ( not ( = ?auto_388238 ?auto_388239 ) ) ( not ( = ?auto_388238 ?auto_388240 ) ) ( not ( = ?auto_388238 ?auto_388241 ) ) ( not ( = ?auto_388238 ?auto_388242 ) ) ( not ( = ?auto_388238 ?auto_388243 ) ) ( not ( = ?auto_388238 ?auto_388244 ) ) ( not ( = ?auto_388239 ?auto_388240 ) ) ( not ( = ?auto_388239 ?auto_388241 ) ) ( not ( = ?auto_388239 ?auto_388242 ) ) ( not ( = ?auto_388239 ?auto_388243 ) ) ( not ( = ?auto_388239 ?auto_388244 ) ) ( not ( = ?auto_388240 ?auto_388241 ) ) ( not ( = ?auto_388240 ?auto_388242 ) ) ( not ( = ?auto_388240 ?auto_388243 ) ) ( not ( = ?auto_388240 ?auto_388244 ) ) ( not ( = ?auto_388241 ?auto_388242 ) ) ( not ( = ?auto_388241 ?auto_388243 ) ) ( not ( = ?auto_388241 ?auto_388244 ) ) ( not ( = ?auto_388242 ?auto_388243 ) ) ( not ( = ?auto_388242 ?auto_388244 ) ) ( not ( = ?auto_388243 ?auto_388244 ) ) ( ON ?auto_388242 ?auto_388243 ) ( ON ?auto_388241 ?auto_388242 ) ( ON ?auto_388240 ?auto_388241 ) ( ON ?auto_388239 ?auto_388240 ) ( ON ?auto_388238 ?auto_388239 ) ( ON ?auto_388237 ?auto_388238 ) ( CLEAR ?auto_388235 ) ( ON ?auto_388236 ?auto_388237 ) ( CLEAR ?auto_388236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388234 ?auto_388235 ?auto_388236 )
      ( MAKE-10PILE ?auto_388234 ?auto_388235 ?auto_388236 ?auto_388237 ?auto_388238 ?auto_388239 ?auto_388240 ?auto_388241 ?auto_388242 ?auto_388243 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388255 - BLOCK
      ?auto_388256 - BLOCK
      ?auto_388257 - BLOCK
      ?auto_388258 - BLOCK
      ?auto_388259 - BLOCK
      ?auto_388260 - BLOCK
      ?auto_388261 - BLOCK
      ?auto_388262 - BLOCK
      ?auto_388263 - BLOCK
      ?auto_388264 - BLOCK
    )
    :vars
    (
      ?auto_388265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388264 ?auto_388265 ) ( ON-TABLE ?auto_388255 ) ( ON ?auto_388256 ?auto_388255 ) ( not ( = ?auto_388255 ?auto_388256 ) ) ( not ( = ?auto_388255 ?auto_388257 ) ) ( not ( = ?auto_388255 ?auto_388258 ) ) ( not ( = ?auto_388255 ?auto_388259 ) ) ( not ( = ?auto_388255 ?auto_388260 ) ) ( not ( = ?auto_388255 ?auto_388261 ) ) ( not ( = ?auto_388255 ?auto_388262 ) ) ( not ( = ?auto_388255 ?auto_388263 ) ) ( not ( = ?auto_388255 ?auto_388264 ) ) ( not ( = ?auto_388255 ?auto_388265 ) ) ( not ( = ?auto_388256 ?auto_388257 ) ) ( not ( = ?auto_388256 ?auto_388258 ) ) ( not ( = ?auto_388256 ?auto_388259 ) ) ( not ( = ?auto_388256 ?auto_388260 ) ) ( not ( = ?auto_388256 ?auto_388261 ) ) ( not ( = ?auto_388256 ?auto_388262 ) ) ( not ( = ?auto_388256 ?auto_388263 ) ) ( not ( = ?auto_388256 ?auto_388264 ) ) ( not ( = ?auto_388256 ?auto_388265 ) ) ( not ( = ?auto_388257 ?auto_388258 ) ) ( not ( = ?auto_388257 ?auto_388259 ) ) ( not ( = ?auto_388257 ?auto_388260 ) ) ( not ( = ?auto_388257 ?auto_388261 ) ) ( not ( = ?auto_388257 ?auto_388262 ) ) ( not ( = ?auto_388257 ?auto_388263 ) ) ( not ( = ?auto_388257 ?auto_388264 ) ) ( not ( = ?auto_388257 ?auto_388265 ) ) ( not ( = ?auto_388258 ?auto_388259 ) ) ( not ( = ?auto_388258 ?auto_388260 ) ) ( not ( = ?auto_388258 ?auto_388261 ) ) ( not ( = ?auto_388258 ?auto_388262 ) ) ( not ( = ?auto_388258 ?auto_388263 ) ) ( not ( = ?auto_388258 ?auto_388264 ) ) ( not ( = ?auto_388258 ?auto_388265 ) ) ( not ( = ?auto_388259 ?auto_388260 ) ) ( not ( = ?auto_388259 ?auto_388261 ) ) ( not ( = ?auto_388259 ?auto_388262 ) ) ( not ( = ?auto_388259 ?auto_388263 ) ) ( not ( = ?auto_388259 ?auto_388264 ) ) ( not ( = ?auto_388259 ?auto_388265 ) ) ( not ( = ?auto_388260 ?auto_388261 ) ) ( not ( = ?auto_388260 ?auto_388262 ) ) ( not ( = ?auto_388260 ?auto_388263 ) ) ( not ( = ?auto_388260 ?auto_388264 ) ) ( not ( = ?auto_388260 ?auto_388265 ) ) ( not ( = ?auto_388261 ?auto_388262 ) ) ( not ( = ?auto_388261 ?auto_388263 ) ) ( not ( = ?auto_388261 ?auto_388264 ) ) ( not ( = ?auto_388261 ?auto_388265 ) ) ( not ( = ?auto_388262 ?auto_388263 ) ) ( not ( = ?auto_388262 ?auto_388264 ) ) ( not ( = ?auto_388262 ?auto_388265 ) ) ( not ( = ?auto_388263 ?auto_388264 ) ) ( not ( = ?auto_388263 ?auto_388265 ) ) ( not ( = ?auto_388264 ?auto_388265 ) ) ( ON ?auto_388263 ?auto_388264 ) ( ON ?auto_388262 ?auto_388263 ) ( ON ?auto_388261 ?auto_388262 ) ( ON ?auto_388260 ?auto_388261 ) ( ON ?auto_388259 ?auto_388260 ) ( ON ?auto_388258 ?auto_388259 ) ( CLEAR ?auto_388256 ) ( ON ?auto_388257 ?auto_388258 ) ( CLEAR ?auto_388257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388255 ?auto_388256 ?auto_388257 )
      ( MAKE-10PILE ?auto_388255 ?auto_388256 ?auto_388257 ?auto_388258 ?auto_388259 ?auto_388260 ?auto_388261 ?auto_388262 ?auto_388263 ?auto_388264 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388276 - BLOCK
      ?auto_388277 - BLOCK
      ?auto_388278 - BLOCK
      ?auto_388279 - BLOCK
      ?auto_388280 - BLOCK
      ?auto_388281 - BLOCK
      ?auto_388282 - BLOCK
      ?auto_388283 - BLOCK
      ?auto_388284 - BLOCK
      ?auto_388285 - BLOCK
    )
    :vars
    (
      ?auto_388286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388285 ?auto_388286 ) ( ON-TABLE ?auto_388276 ) ( not ( = ?auto_388276 ?auto_388277 ) ) ( not ( = ?auto_388276 ?auto_388278 ) ) ( not ( = ?auto_388276 ?auto_388279 ) ) ( not ( = ?auto_388276 ?auto_388280 ) ) ( not ( = ?auto_388276 ?auto_388281 ) ) ( not ( = ?auto_388276 ?auto_388282 ) ) ( not ( = ?auto_388276 ?auto_388283 ) ) ( not ( = ?auto_388276 ?auto_388284 ) ) ( not ( = ?auto_388276 ?auto_388285 ) ) ( not ( = ?auto_388276 ?auto_388286 ) ) ( not ( = ?auto_388277 ?auto_388278 ) ) ( not ( = ?auto_388277 ?auto_388279 ) ) ( not ( = ?auto_388277 ?auto_388280 ) ) ( not ( = ?auto_388277 ?auto_388281 ) ) ( not ( = ?auto_388277 ?auto_388282 ) ) ( not ( = ?auto_388277 ?auto_388283 ) ) ( not ( = ?auto_388277 ?auto_388284 ) ) ( not ( = ?auto_388277 ?auto_388285 ) ) ( not ( = ?auto_388277 ?auto_388286 ) ) ( not ( = ?auto_388278 ?auto_388279 ) ) ( not ( = ?auto_388278 ?auto_388280 ) ) ( not ( = ?auto_388278 ?auto_388281 ) ) ( not ( = ?auto_388278 ?auto_388282 ) ) ( not ( = ?auto_388278 ?auto_388283 ) ) ( not ( = ?auto_388278 ?auto_388284 ) ) ( not ( = ?auto_388278 ?auto_388285 ) ) ( not ( = ?auto_388278 ?auto_388286 ) ) ( not ( = ?auto_388279 ?auto_388280 ) ) ( not ( = ?auto_388279 ?auto_388281 ) ) ( not ( = ?auto_388279 ?auto_388282 ) ) ( not ( = ?auto_388279 ?auto_388283 ) ) ( not ( = ?auto_388279 ?auto_388284 ) ) ( not ( = ?auto_388279 ?auto_388285 ) ) ( not ( = ?auto_388279 ?auto_388286 ) ) ( not ( = ?auto_388280 ?auto_388281 ) ) ( not ( = ?auto_388280 ?auto_388282 ) ) ( not ( = ?auto_388280 ?auto_388283 ) ) ( not ( = ?auto_388280 ?auto_388284 ) ) ( not ( = ?auto_388280 ?auto_388285 ) ) ( not ( = ?auto_388280 ?auto_388286 ) ) ( not ( = ?auto_388281 ?auto_388282 ) ) ( not ( = ?auto_388281 ?auto_388283 ) ) ( not ( = ?auto_388281 ?auto_388284 ) ) ( not ( = ?auto_388281 ?auto_388285 ) ) ( not ( = ?auto_388281 ?auto_388286 ) ) ( not ( = ?auto_388282 ?auto_388283 ) ) ( not ( = ?auto_388282 ?auto_388284 ) ) ( not ( = ?auto_388282 ?auto_388285 ) ) ( not ( = ?auto_388282 ?auto_388286 ) ) ( not ( = ?auto_388283 ?auto_388284 ) ) ( not ( = ?auto_388283 ?auto_388285 ) ) ( not ( = ?auto_388283 ?auto_388286 ) ) ( not ( = ?auto_388284 ?auto_388285 ) ) ( not ( = ?auto_388284 ?auto_388286 ) ) ( not ( = ?auto_388285 ?auto_388286 ) ) ( ON ?auto_388284 ?auto_388285 ) ( ON ?auto_388283 ?auto_388284 ) ( ON ?auto_388282 ?auto_388283 ) ( ON ?auto_388281 ?auto_388282 ) ( ON ?auto_388280 ?auto_388281 ) ( ON ?auto_388279 ?auto_388280 ) ( ON ?auto_388278 ?auto_388279 ) ( CLEAR ?auto_388276 ) ( ON ?auto_388277 ?auto_388278 ) ( CLEAR ?auto_388277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388276 ?auto_388277 )
      ( MAKE-10PILE ?auto_388276 ?auto_388277 ?auto_388278 ?auto_388279 ?auto_388280 ?auto_388281 ?auto_388282 ?auto_388283 ?auto_388284 ?auto_388285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388297 - BLOCK
      ?auto_388298 - BLOCK
      ?auto_388299 - BLOCK
      ?auto_388300 - BLOCK
      ?auto_388301 - BLOCK
      ?auto_388302 - BLOCK
      ?auto_388303 - BLOCK
      ?auto_388304 - BLOCK
      ?auto_388305 - BLOCK
      ?auto_388306 - BLOCK
    )
    :vars
    (
      ?auto_388307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388306 ?auto_388307 ) ( ON-TABLE ?auto_388297 ) ( not ( = ?auto_388297 ?auto_388298 ) ) ( not ( = ?auto_388297 ?auto_388299 ) ) ( not ( = ?auto_388297 ?auto_388300 ) ) ( not ( = ?auto_388297 ?auto_388301 ) ) ( not ( = ?auto_388297 ?auto_388302 ) ) ( not ( = ?auto_388297 ?auto_388303 ) ) ( not ( = ?auto_388297 ?auto_388304 ) ) ( not ( = ?auto_388297 ?auto_388305 ) ) ( not ( = ?auto_388297 ?auto_388306 ) ) ( not ( = ?auto_388297 ?auto_388307 ) ) ( not ( = ?auto_388298 ?auto_388299 ) ) ( not ( = ?auto_388298 ?auto_388300 ) ) ( not ( = ?auto_388298 ?auto_388301 ) ) ( not ( = ?auto_388298 ?auto_388302 ) ) ( not ( = ?auto_388298 ?auto_388303 ) ) ( not ( = ?auto_388298 ?auto_388304 ) ) ( not ( = ?auto_388298 ?auto_388305 ) ) ( not ( = ?auto_388298 ?auto_388306 ) ) ( not ( = ?auto_388298 ?auto_388307 ) ) ( not ( = ?auto_388299 ?auto_388300 ) ) ( not ( = ?auto_388299 ?auto_388301 ) ) ( not ( = ?auto_388299 ?auto_388302 ) ) ( not ( = ?auto_388299 ?auto_388303 ) ) ( not ( = ?auto_388299 ?auto_388304 ) ) ( not ( = ?auto_388299 ?auto_388305 ) ) ( not ( = ?auto_388299 ?auto_388306 ) ) ( not ( = ?auto_388299 ?auto_388307 ) ) ( not ( = ?auto_388300 ?auto_388301 ) ) ( not ( = ?auto_388300 ?auto_388302 ) ) ( not ( = ?auto_388300 ?auto_388303 ) ) ( not ( = ?auto_388300 ?auto_388304 ) ) ( not ( = ?auto_388300 ?auto_388305 ) ) ( not ( = ?auto_388300 ?auto_388306 ) ) ( not ( = ?auto_388300 ?auto_388307 ) ) ( not ( = ?auto_388301 ?auto_388302 ) ) ( not ( = ?auto_388301 ?auto_388303 ) ) ( not ( = ?auto_388301 ?auto_388304 ) ) ( not ( = ?auto_388301 ?auto_388305 ) ) ( not ( = ?auto_388301 ?auto_388306 ) ) ( not ( = ?auto_388301 ?auto_388307 ) ) ( not ( = ?auto_388302 ?auto_388303 ) ) ( not ( = ?auto_388302 ?auto_388304 ) ) ( not ( = ?auto_388302 ?auto_388305 ) ) ( not ( = ?auto_388302 ?auto_388306 ) ) ( not ( = ?auto_388302 ?auto_388307 ) ) ( not ( = ?auto_388303 ?auto_388304 ) ) ( not ( = ?auto_388303 ?auto_388305 ) ) ( not ( = ?auto_388303 ?auto_388306 ) ) ( not ( = ?auto_388303 ?auto_388307 ) ) ( not ( = ?auto_388304 ?auto_388305 ) ) ( not ( = ?auto_388304 ?auto_388306 ) ) ( not ( = ?auto_388304 ?auto_388307 ) ) ( not ( = ?auto_388305 ?auto_388306 ) ) ( not ( = ?auto_388305 ?auto_388307 ) ) ( not ( = ?auto_388306 ?auto_388307 ) ) ( ON ?auto_388305 ?auto_388306 ) ( ON ?auto_388304 ?auto_388305 ) ( ON ?auto_388303 ?auto_388304 ) ( ON ?auto_388302 ?auto_388303 ) ( ON ?auto_388301 ?auto_388302 ) ( ON ?auto_388300 ?auto_388301 ) ( ON ?auto_388299 ?auto_388300 ) ( CLEAR ?auto_388297 ) ( ON ?auto_388298 ?auto_388299 ) ( CLEAR ?auto_388298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388297 ?auto_388298 )
      ( MAKE-10PILE ?auto_388297 ?auto_388298 ?auto_388299 ?auto_388300 ?auto_388301 ?auto_388302 ?auto_388303 ?auto_388304 ?auto_388305 ?auto_388306 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388318 - BLOCK
      ?auto_388319 - BLOCK
      ?auto_388320 - BLOCK
      ?auto_388321 - BLOCK
      ?auto_388322 - BLOCK
      ?auto_388323 - BLOCK
      ?auto_388324 - BLOCK
      ?auto_388325 - BLOCK
      ?auto_388326 - BLOCK
      ?auto_388327 - BLOCK
    )
    :vars
    (
      ?auto_388328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388327 ?auto_388328 ) ( not ( = ?auto_388318 ?auto_388319 ) ) ( not ( = ?auto_388318 ?auto_388320 ) ) ( not ( = ?auto_388318 ?auto_388321 ) ) ( not ( = ?auto_388318 ?auto_388322 ) ) ( not ( = ?auto_388318 ?auto_388323 ) ) ( not ( = ?auto_388318 ?auto_388324 ) ) ( not ( = ?auto_388318 ?auto_388325 ) ) ( not ( = ?auto_388318 ?auto_388326 ) ) ( not ( = ?auto_388318 ?auto_388327 ) ) ( not ( = ?auto_388318 ?auto_388328 ) ) ( not ( = ?auto_388319 ?auto_388320 ) ) ( not ( = ?auto_388319 ?auto_388321 ) ) ( not ( = ?auto_388319 ?auto_388322 ) ) ( not ( = ?auto_388319 ?auto_388323 ) ) ( not ( = ?auto_388319 ?auto_388324 ) ) ( not ( = ?auto_388319 ?auto_388325 ) ) ( not ( = ?auto_388319 ?auto_388326 ) ) ( not ( = ?auto_388319 ?auto_388327 ) ) ( not ( = ?auto_388319 ?auto_388328 ) ) ( not ( = ?auto_388320 ?auto_388321 ) ) ( not ( = ?auto_388320 ?auto_388322 ) ) ( not ( = ?auto_388320 ?auto_388323 ) ) ( not ( = ?auto_388320 ?auto_388324 ) ) ( not ( = ?auto_388320 ?auto_388325 ) ) ( not ( = ?auto_388320 ?auto_388326 ) ) ( not ( = ?auto_388320 ?auto_388327 ) ) ( not ( = ?auto_388320 ?auto_388328 ) ) ( not ( = ?auto_388321 ?auto_388322 ) ) ( not ( = ?auto_388321 ?auto_388323 ) ) ( not ( = ?auto_388321 ?auto_388324 ) ) ( not ( = ?auto_388321 ?auto_388325 ) ) ( not ( = ?auto_388321 ?auto_388326 ) ) ( not ( = ?auto_388321 ?auto_388327 ) ) ( not ( = ?auto_388321 ?auto_388328 ) ) ( not ( = ?auto_388322 ?auto_388323 ) ) ( not ( = ?auto_388322 ?auto_388324 ) ) ( not ( = ?auto_388322 ?auto_388325 ) ) ( not ( = ?auto_388322 ?auto_388326 ) ) ( not ( = ?auto_388322 ?auto_388327 ) ) ( not ( = ?auto_388322 ?auto_388328 ) ) ( not ( = ?auto_388323 ?auto_388324 ) ) ( not ( = ?auto_388323 ?auto_388325 ) ) ( not ( = ?auto_388323 ?auto_388326 ) ) ( not ( = ?auto_388323 ?auto_388327 ) ) ( not ( = ?auto_388323 ?auto_388328 ) ) ( not ( = ?auto_388324 ?auto_388325 ) ) ( not ( = ?auto_388324 ?auto_388326 ) ) ( not ( = ?auto_388324 ?auto_388327 ) ) ( not ( = ?auto_388324 ?auto_388328 ) ) ( not ( = ?auto_388325 ?auto_388326 ) ) ( not ( = ?auto_388325 ?auto_388327 ) ) ( not ( = ?auto_388325 ?auto_388328 ) ) ( not ( = ?auto_388326 ?auto_388327 ) ) ( not ( = ?auto_388326 ?auto_388328 ) ) ( not ( = ?auto_388327 ?auto_388328 ) ) ( ON ?auto_388326 ?auto_388327 ) ( ON ?auto_388325 ?auto_388326 ) ( ON ?auto_388324 ?auto_388325 ) ( ON ?auto_388323 ?auto_388324 ) ( ON ?auto_388322 ?auto_388323 ) ( ON ?auto_388321 ?auto_388322 ) ( ON ?auto_388320 ?auto_388321 ) ( ON ?auto_388319 ?auto_388320 ) ( ON ?auto_388318 ?auto_388319 ) ( CLEAR ?auto_388318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388318 )
      ( MAKE-10PILE ?auto_388318 ?auto_388319 ?auto_388320 ?auto_388321 ?auto_388322 ?auto_388323 ?auto_388324 ?auto_388325 ?auto_388326 ?auto_388327 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_388339 - BLOCK
      ?auto_388340 - BLOCK
      ?auto_388341 - BLOCK
      ?auto_388342 - BLOCK
      ?auto_388343 - BLOCK
      ?auto_388344 - BLOCK
      ?auto_388345 - BLOCK
      ?auto_388346 - BLOCK
      ?auto_388347 - BLOCK
      ?auto_388348 - BLOCK
    )
    :vars
    (
      ?auto_388349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388348 ?auto_388349 ) ( not ( = ?auto_388339 ?auto_388340 ) ) ( not ( = ?auto_388339 ?auto_388341 ) ) ( not ( = ?auto_388339 ?auto_388342 ) ) ( not ( = ?auto_388339 ?auto_388343 ) ) ( not ( = ?auto_388339 ?auto_388344 ) ) ( not ( = ?auto_388339 ?auto_388345 ) ) ( not ( = ?auto_388339 ?auto_388346 ) ) ( not ( = ?auto_388339 ?auto_388347 ) ) ( not ( = ?auto_388339 ?auto_388348 ) ) ( not ( = ?auto_388339 ?auto_388349 ) ) ( not ( = ?auto_388340 ?auto_388341 ) ) ( not ( = ?auto_388340 ?auto_388342 ) ) ( not ( = ?auto_388340 ?auto_388343 ) ) ( not ( = ?auto_388340 ?auto_388344 ) ) ( not ( = ?auto_388340 ?auto_388345 ) ) ( not ( = ?auto_388340 ?auto_388346 ) ) ( not ( = ?auto_388340 ?auto_388347 ) ) ( not ( = ?auto_388340 ?auto_388348 ) ) ( not ( = ?auto_388340 ?auto_388349 ) ) ( not ( = ?auto_388341 ?auto_388342 ) ) ( not ( = ?auto_388341 ?auto_388343 ) ) ( not ( = ?auto_388341 ?auto_388344 ) ) ( not ( = ?auto_388341 ?auto_388345 ) ) ( not ( = ?auto_388341 ?auto_388346 ) ) ( not ( = ?auto_388341 ?auto_388347 ) ) ( not ( = ?auto_388341 ?auto_388348 ) ) ( not ( = ?auto_388341 ?auto_388349 ) ) ( not ( = ?auto_388342 ?auto_388343 ) ) ( not ( = ?auto_388342 ?auto_388344 ) ) ( not ( = ?auto_388342 ?auto_388345 ) ) ( not ( = ?auto_388342 ?auto_388346 ) ) ( not ( = ?auto_388342 ?auto_388347 ) ) ( not ( = ?auto_388342 ?auto_388348 ) ) ( not ( = ?auto_388342 ?auto_388349 ) ) ( not ( = ?auto_388343 ?auto_388344 ) ) ( not ( = ?auto_388343 ?auto_388345 ) ) ( not ( = ?auto_388343 ?auto_388346 ) ) ( not ( = ?auto_388343 ?auto_388347 ) ) ( not ( = ?auto_388343 ?auto_388348 ) ) ( not ( = ?auto_388343 ?auto_388349 ) ) ( not ( = ?auto_388344 ?auto_388345 ) ) ( not ( = ?auto_388344 ?auto_388346 ) ) ( not ( = ?auto_388344 ?auto_388347 ) ) ( not ( = ?auto_388344 ?auto_388348 ) ) ( not ( = ?auto_388344 ?auto_388349 ) ) ( not ( = ?auto_388345 ?auto_388346 ) ) ( not ( = ?auto_388345 ?auto_388347 ) ) ( not ( = ?auto_388345 ?auto_388348 ) ) ( not ( = ?auto_388345 ?auto_388349 ) ) ( not ( = ?auto_388346 ?auto_388347 ) ) ( not ( = ?auto_388346 ?auto_388348 ) ) ( not ( = ?auto_388346 ?auto_388349 ) ) ( not ( = ?auto_388347 ?auto_388348 ) ) ( not ( = ?auto_388347 ?auto_388349 ) ) ( not ( = ?auto_388348 ?auto_388349 ) ) ( ON ?auto_388347 ?auto_388348 ) ( ON ?auto_388346 ?auto_388347 ) ( ON ?auto_388345 ?auto_388346 ) ( ON ?auto_388344 ?auto_388345 ) ( ON ?auto_388343 ?auto_388344 ) ( ON ?auto_388342 ?auto_388343 ) ( ON ?auto_388341 ?auto_388342 ) ( ON ?auto_388340 ?auto_388341 ) ( ON ?auto_388339 ?auto_388340 ) ( CLEAR ?auto_388339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388339 )
      ( MAKE-10PILE ?auto_388339 ?auto_388340 ?auto_388341 ?auto_388342 ?auto_388343 ?auto_388344 ?auto_388345 ?auto_388346 ?auto_388347 ?auto_388348 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388361 - BLOCK
      ?auto_388362 - BLOCK
      ?auto_388363 - BLOCK
      ?auto_388364 - BLOCK
      ?auto_388365 - BLOCK
      ?auto_388366 - BLOCK
      ?auto_388367 - BLOCK
      ?auto_388368 - BLOCK
      ?auto_388369 - BLOCK
      ?auto_388370 - BLOCK
      ?auto_388371 - BLOCK
    )
    :vars
    (
      ?auto_388372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388370 ) ( ON ?auto_388371 ?auto_388372 ) ( CLEAR ?auto_388371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388361 ) ( ON ?auto_388362 ?auto_388361 ) ( ON ?auto_388363 ?auto_388362 ) ( ON ?auto_388364 ?auto_388363 ) ( ON ?auto_388365 ?auto_388364 ) ( ON ?auto_388366 ?auto_388365 ) ( ON ?auto_388367 ?auto_388366 ) ( ON ?auto_388368 ?auto_388367 ) ( ON ?auto_388369 ?auto_388368 ) ( ON ?auto_388370 ?auto_388369 ) ( not ( = ?auto_388361 ?auto_388362 ) ) ( not ( = ?auto_388361 ?auto_388363 ) ) ( not ( = ?auto_388361 ?auto_388364 ) ) ( not ( = ?auto_388361 ?auto_388365 ) ) ( not ( = ?auto_388361 ?auto_388366 ) ) ( not ( = ?auto_388361 ?auto_388367 ) ) ( not ( = ?auto_388361 ?auto_388368 ) ) ( not ( = ?auto_388361 ?auto_388369 ) ) ( not ( = ?auto_388361 ?auto_388370 ) ) ( not ( = ?auto_388361 ?auto_388371 ) ) ( not ( = ?auto_388361 ?auto_388372 ) ) ( not ( = ?auto_388362 ?auto_388363 ) ) ( not ( = ?auto_388362 ?auto_388364 ) ) ( not ( = ?auto_388362 ?auto_388365 ) ) ( not ( = ?auto_388362 ?auto_388366 ) ) ( not ( = ?auto_388362 ?auto_388367 ) ) ( not ( = ?auto_388362 ?auto_388368 ) ) ( not ( = ?auto_388362 ?auto_388369 ) ) ( not ( = ?auto_388362 ?auto_388370 ) ) ( not ( = ?auto_388362 ?auto_388371 ) ) ( not ( = ?auto_388362 ?auto_388372 ) ) ( not ( = ?auto_388363 ?auto_388364 ) ) ( not ( = ?auto_388363 ?auto_388365 ) ) ( not ( = ?auto_388363 ?auto_388366 ) ) ( not ( = ?auto_388363 ?auto_388367 ) ) ( not ( = ?auto_388363 ?auto_388368 ) ) ( not ( = ?auto_388363 ?auto_388369 ) ) ( not ( = ?auto_388363 ?auto_388370 ) ) ( not ( = ?auto_388363 ?auto_388371 ) ) ( not ( = ?auto_388363 ?auto_388372 ) ) ( not ( = ?auto_388364 ?auto_388365 ) ) ( not ( = ?auto_388364 ?auto_388366 ) ) ( not ( = ?auto_388364 ?auto_388367 ) ) ( not ( = ?auto_388364 ?auto_388368 ) ) ( not ( = ?auto_388364 ?auto_388369 ) ) ( not ( = ?auto_388364 ?auto_388370 ) ) ( not ( = ?auto_388364 ?auto_388371 ) ) ( not ( = ?auto_388364 ?auto_388372 ) ) ( not ( = ?auto_388365 ?auto_388366 ) ) ( not ( = ?auto_388365 ?auto_388367 ) ) ( not ( = ?auto_388365 ?auto_388368 ) ) ( not ( = ?auto_388365 ?auto_388369 ) ) ( not ( = ?auto_388365 ?auto_388370 ) ) ( not ( = ?auto_388365 ?auto_388371 ) ) ( not ( = ?auto_388365 ?auto_388372 ) ) ( not ( = ?auto_388366 ?auto_388367 ) ) ( not ( = ?auto_388366 ?auto_388368 ) ) ( not ( = ?auto_388366 ?auto_388369 ) ) ( not ( = ?auto_388366 ?auto_388370 ) ) ( not ( = ?auto_388366 ?auto_388371 ) ) ( not ( = ?auto_388366 ?auto_388372 ) ) ( not ( = ?auto_388367 ?auto_388368 ) ) ( not ( = ?auto_388367 ?auto_388369 ) ) ( not ( = ?auto_388367 ?auto_388370 ) ) ( not ( = ?auto_388367 ?auto_388371 ) ) ( not ( = ?auto_388367 ?auto_388372 ) ) ( not ( = ?auto_388368 ?auto_388369 ) ) ( not ( = ?auto_388368 ?auto_388370 ) ) ( not ( = ?auto_388368 ?auto_388371 ) ) ( not ( = ?auto_388368 ?auto_388372 ) ) ( not ( = ?auto_388369 ?auto_388370 ) ) ( not ( = ?auto_388369 ?auto_388371 ) ) ( not ( = ?auto_388369 ?auto_388372 ) ) ( not ( = ?auto_388370 ?auto_388371 ) ) ( not ( = ?auto_388370 ?auto_388372 ) ) ( not ( = ?auto_388371 ?auto_388372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388371 ?auto_388372 )
      ( !STACK ?auto_388371 ?auto_388370 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388384 - BLOCK
      ?auto_388385 - BLOCK
      ?auto_388386 - BLOCK
      ?auto_388387 - BLOCK
      ?auto_388388 - BLOCK
      ?auto_388389 - BLOCK
      ?auto_388390 - BLOCK
      ?auto_388391 - BLOCK
      ?auto_388392 - BLOCK
      ?auto_388393 - BLOCK
      ?auto_388394 - BLOCK
    )
    :vars
    (
      ?auto_388395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388393 ) ( ON ?auto_388394 ?auto_388395 ) ( CLEAR ?auto_388394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388384 ) ( ON ?auto_388385 ?auto_388384 ) ( ON ?auto_388386 ?auto_388385 ) ( ON ?auto_388387 ?auto_388386 ) ( ON ?auto_388388 ?auto_388387 ) ( ON ?auto_388389 ?auto_388388 ) ( ON ?auto_388390 ?auto_388389 ) ( ON ?auto_388391 ?auto_388390 ) ( ON ?auto_388392 ?auto_388391 ) ( ON ?auto_388393 ?auto_388392 ) ( not ( = ?auto_388384 ?auto_388385 ) ) ( not ( = ?auto_388384 ?auto_388386 ) ) ( not ( = ?auto_388384 ?auto_388387 ) ) ( not ( = ?auto_388384 ?auto_388388 ) ) ( not ( = ?auto_388384 ?auto_388389 ) ) ( not ( = ?auto_388384 ?auto_388390 ) ) ( not ( = ?auto_388384 ?auto_388391 ) ) ( not ( = ?auto_388384 ?auto_388392 ) ) ( not ( = ?auto_388384 ?auto_388393 ) ) ( not ( = ?auto_388384 ?auto_388394 ) ) ( not ( = ?auto_388384 ?auto_388395 ) ) ( not ( = ?auto_388385 ?auto_388386 ) ) ( not ( = ?auto_388385 ?auto_388387 ) ) ( not ( = ?auto_388385 ?auto_388388 ) ) ( not ( = ?auto_388385 ?auto_388389 ) ) ( not ( = ?auto_388385 ?auto_388390 ) ) ( not ( = ?auto_388385 ?auto_388391 ) ) ( not ( = ?auto_388385 ?auto_388392 ) ) ( not ( = ?auto_388385 ?auto_388393 ) ) ( not ( = ?auto_388385 ?auto_388394 ) ) ( not ( = ?auto_388385 ?auto_388395 ) ) ( not ( = ?auto_388386 ?auto_388387 ) ) ( not ( = ?auto_388386 ?auto_388388 ) ) ( not ( = ?auto_388386 ?auto_388389 ) ) ( not ( = ?auto_388386 ?auto_388390 ) ) ( not ( = ?auto_388386 ?auto_388391 ) ) ( not ( = ?auto_388386 ?auto_388392 ) ) ( not ( = ?auto_388386 ?auto_388393 ) ) ( not ( = ?auto_388386 ?auto_388394 ) ) ( not ( = ?auto_388386 ?auto_388395 ) ) ( not ( = ?auto_388387 ?auto_388388 ) ) ( not ( = ?auto_388387 ?auto_388389 ) ) ( not ( = ?auto_388387 ?auto_388390 ) ) ( not ( = ?auto_388387 ?auto_388391 ) ) ( not ( = ?auto_388387 ?auto_388392 ) ) ( not ( = ?auto_388387 ?auto_388393 ) ) ( not ( = ?auto_388387 ?auto_388394 ) ) ( not ( = ?auto_388387 ?auto_388395 ) ) ( not ( = ?auto_388388 ?auto_388389 ) ) ( not ( = ?auto_388388 ?auto_388390 ) ) ( not ( = ?auto_388388 ?auto_388391 ) ) ( not ( = ?auto_388388 ?auto_388392 ) ) ( not ( = ?auto_388388 ?auto_388393 ) ) ( not ( = ?auto_388388 ?auto_388394 ) ) ( not ( = ?auto_388388 ?auto_388395 ) ) ( not ( = ?auto_388389 ?auto_388390 ) ) ( not ( = ?auto_388389 ?auto_388391 ) ) ( not ( = ?auto_388389 ?auto_388392 ) ) ( not ( = ?auto_388389 ?auto_388393 ) ) ( not ( = ?auto_388389 ?auto_388394 ) ) ( not ( = ?auto_388389 ?auto_388395 ) ) ( not ( = ?auto_388390 ?auto_388391 ) ) ( not ( = ?auto_388390 ?auto_388392 ) ) ( not ( = ?auto_388390 ?auto_388393 ) ) ( not ( = ?auto_388390 ?auto_388394 ) ) ( not ( = ?auto_388390 ?auto_388395 ) ) ( not ( = ?auto_388391 ?auto_388392 ) ) ( not ( = ?auto_388391 ?auto_388393 ) ) ( not ( = ?auto_388391 ?auto_388394 ) ) ( not ( = ?auto_388391 ?auto_388395 ) ) ( not ( = ?auto_388392 ?auto_388393 ) ) ( not ( = ?auto_388392 ?auto_388394 ) ) ( not ( = ?auto_388392 ?auto_388395 ) ) ( not ( = ?auto_388393 ?auto_388394 ) ) ( not ( = ?auto_388393 ?auto_388395 ) ) ( not ( = ?auto_388394 ?auto_388395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388394 ?auto_388395 )
      ( !STACK ?auto_388394 ?auto_388393 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388407 - BLOCK
      ?auto_388408 - BLOCK
      ?auto_388409 - BLOCK
      ?auto_388410 - BLOCK
      ?auto_388411 - BLOCK
      ?auto_388412 - BLOCK
      ?auto_388413 - BLOCK
      ?auto_388414 - BLOCK
      ?auto_388415 - BLOCK
      ?auto_388416 - BLOCK
      ?auto_388417 - BLOCK
    )
    :vars
    (
      ?auto_388418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388417 ?auto_388418 ) ( ON-TABLE ?auto_388407 ) ( ON ?auto_388408 ?auto_388407 ) ( ON ?auto_388409 ?auto_388408 ) ( ON ?auto_388410 ?auto_388409 ) ( ON ?auto_388411 ?auto_388410 ) ( ON ?auto_388412 ?auto_388411 ) ( ON ?auto_388413 ?auto_388412 ) ( ON ?auto_388414 ?auto_388413 ) ( ON ?auto_388415 ?auto_388414 ) ( not ( = ?auto_388407 ?auto_388408 ) ) ( not ( = ?auto_388407 ?auto_388409 ) ) ( not ( = ?auto_388407 ?auto_388410 ) ) ( not ( = ?auto_388407 ?auto_388411 ) ) ( not ( = ?auto_388407 ?auto_388412 ) ) ( not ( = ?auto_388407 ?auto_388413 ) ) ( not ( = ?auto_388407 ?auto_388414 ) ) ( not ( = ?auto_388407 ?auto_388415 ) ) ( not ( = ?auto_388407 ?auto_388416 ) ) ( not ( = ?auto_388407 ?auto_388417 ) ) ( not ( = ?auto_388407 ?auto_388418 ) ) ( not ( = ?auto_388408 ?auto_388409 ) ) ( not ( = ?auto_388408 ?auto_388410 ) ) ( not ( = ?auto_388408 ?auto_388411 ) ) ( not ( = ?auto_388408 ?auto_388412 ) ) ( not ( = ?auto_388408 ?auto_388413 ) ) ( not ( = ?auto_388408 ?auto_388414 ) ) ( not ( = ?auto_388408 ?auto_388415 ) ) ( not ( = ?auto_388408 ?auto_388416 ) ) ( not ( = ?auto_388408 ?auto_388417 ) ) ( not ( = ?auto_388408 ?auto_388418 ) ) ( not ( = ?auto_388409 ?auto_388410 ) ) ( not ( = ?auto_388409 ?auto_388411 ) ) ( not ( = ?auto_388409 ?auto_388412 ) ) ( not ( = ?auto_388409 ?auto_388413 ) ) ( not ( = ?auto_388409 ?auto_388414 ) ) ( not ( = ?auto_388409 ?auto_388415 ) ) ( not ( = ?auto_388409 ?auto_388416 ) ) ( not ( = ?auto_388409 ?auto_388417 ) ) ( not ( = ?auto_388409 ?auto_388418 ) ) ( not ( = ?auto_388410 ?auto_388411 ) ) ( not ( = ?auto_388410 ?auto_388412 ) ) ( not ( = ?auto_388410 ?auto_388413 ) ) ( not ( = ?auto_388410 ?auto_388414 ) ) ( not ( = ?auto_388410 ?auto_388415 ) ) ( not ( = ?auto_388410 ?auto_388416 ) ) ( not ( = ?auto_388410 ?auto_388417 ) ) ( not ( = ?auto_388410 ?auto_388418 ) ) ( not ( = ?auto_388411 ?auto_388412 ) ) ( not ( = ?auto_388411 ?auto_388413 ) ) ( not ( = ?auto_388411 ?auto_388414 ) ) ( not ( = ?auto_388411 ?auto_388415 ) ) ( not ( = ?auto_388411 ?auto_388416 ) ) ( not ( = ?auto_388411 ?auto_388417 ) ) ( not ( = ?auto_388411 ?auto_388418 ) ) ( not ( = ?auto_388412 ?auto_388413 ) ) ( not ( = ?auto_388412 ?auto_388414 ) ) ( not ( = ?auto_388412 ?auto_388415 ) ) ( not ( = ?auto_388412 ?auto_388416 ) ) ( not ( = ?auto_388412 ?auto_388417 ) ) ( not ( = ?auto_388412 ?auto_388418 ) ) ( not ( = ?auto_388413 ?auto_388414 ) ) ( not ( = ?auto_388413 ?auto_388415 ) ) ( not ( = ?auto_388413 ?auto_388416 ) ) ( not ( = ?auto_388413 ?auto_388417 ) ) ( not ( = ?auto_388413 ?auto_388418 ) ) ( not ( = ?auto_388414 ?auto_388415 ) ) ( not ( = ?auto_388414 ?auto_388416 ) ) ( not ( = ?auto_388414 ?auto_388417 ) ) ( not ( = ?auto_388414 ?auto_388418 ) ) ( not ( = ?auto_388415 ?auto_388416 ) ) ( not ( = ?auto_388415 ?auto_388417 ) ) ( not ( = ?auto_388415 ?auto_388418 ) ) ( not ( = ?auto_388416 ?auto_388417 ) ) ( not ( = ?auto_388416 ?auto_388418 ) ) ( not ( = ?auto_388417 ?auto_388418 ) ) ( CLEAR ?auto_388415 ) ( ON ?auto_388416 ?auto_388417 ) ( CLEAR ?auto_388416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388407 ?auto_388408 ?auto_388409 ?auto_388410 ?auto_388411 ?auto_388412 ?auto_388413 ?auto_388414 ?auto_388415 ?auto_388416 )
      ( MAKE-11PILE ?auto_388407 ?auto_388408 ?auto_388409 ?auto_388410 ?auto_388411 ?auto_388412 ?auto_388413 ?auto_388414 ?auto_388415 ?auto_388416 ?auto_388417 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388430 - BLOCK
      ?auto_388431 - BLOCK
      ?auto_388432 - BLOCK
      ?auto_388433 - BLOCK
      ?auto_388434 - BLOCK
      ?auto_388435 - BLOCK
      ?auto_388436 - BLOCK
      ?auto_388437 - BLOCK
      ?auto_388438 - BLOCK
      ?auto_388439 - BLOCK
      ?auto_388440 - BLOCK
    )
    :vars
    (
      ?auto_388441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388440 ?auto_388441 ) ( ON-TABLE ?auto_388430 ) ( ON ?auto_388431 ?auto_388430 ) ( ON ?auto_388432 ?auto_388431 ) ( ON ?auto_388433 ?auto_388432 ) ( ON ?auto_388434 ?auto_388433 ) ( ON ?auto_388435 ?auto_388434 ) ( ON ?auto_388436 ?auto_388435 ) ( ON ?auto_388437 ?auto_388436 ) ( ON ?auto_388438 ?auto_388437 ) ( not ( = ?auto_388430 ?auto_388431 ) ) ( not ( = ?auto_388430 ?auto_388432 ) ) ( not ( = ?auto_388430 ?auto_388433 ) ) ( not ( = ?auto_388430 ?auto_388434 ) ) ( not ( = ?auto_388430 ?auto_388435 ) ) ( not ( = ?auto_388430 ?auto_388436 ) ) ( not ( = ?auto_388430 ?auto_388437 ) ) ( not ( = ?auto_388430 ?auto_388438 ) ) ( not ( = ?auto_388430 ?auto_388439 ) ) ( not ( = ?auto_388430 ?auto_388440 ) ) ( not ( = ?auto_388430 ?auto_388441 ) ) ( not ( = ?auto_388431 ?auto_388432 ) ) ( not ( = ?auto_388431 ?auto_388433 ) ) ( not ( = ?auto_388431 ?auto_388434 ) ) ( not ( = ?auto_388431 ?auto_388435 ) ) ( not ( = ?auto_388431 ?auto_388436 ) ) ( not ( = ?auto_388431 ?auto_388437 ) ) ( not ( = ?auto_388431 ?auto_388438 ) ) ( not ( = ?auto_388431 ?auto_388439 ) ) ( not ( = ?auto_388431 ?auto_388440 ) ) ( not ( = ?auto_388431 ?auto_388441 ) ) ( not ( = ?auto_388432 ?auto_388433 ) ) ( not ( = ?auto_388432 ?auto_388434 ) ) ( not ( = ?auto_388432 ?auto_388435 ) ) ( not ( = ?auto_388432 ?auto_388436 ) ) ( not ( = ?auto_388432 ?auto_388437 ) ) ( not ( = ?auto_388432 ?auto_388438 ) ) ( not ( = ?auto_388432 ?auto_388439 ) ) ( not ( = ?auto_388432 ?auto_388440 ) ) ( not ( = ?auto_388432 ?auto_388441 ) ) ( not ( = ?auto_388433 ?auto_388434 ) ) ( not ( = ?auto_388433 ?auto_388435 ) ) ( not ( = ?auto_388433 ?auto_388436 ) ) ( not ( = ?auto_388433 ?auto_388437 ) ) ( not ( = ?auto_388433 ?auto_388438 ) ) ( not ( = ?auto_388433 ?auto_388439 ) ) ( not ( = ?auto_388433 ?auto_388440 ) ) ( not ( = ?auto_388433 ?auto_388441 ) ) ( not ( = ?auto_388434 ?auto_388435 ) ) ( not ( = ?auto_388434 ?auto_388436 ) ) ( not ( = ?auto_388434 ?auto_388437 ) ) ( not ( = ?auto_388434 ?auto_388438 ) ) ( not ( = ?auto_388434 ?auto_388439 ) ) ( not ( = ?auto_388434 ?auto_388440 ) ) ( not ( = ?auto_388434 ?auto_388441 ) ) ( not ( = ?auto_388435 ?auto_388436 ) ) ( not ( = ?auto_388435 ?auto_388437 ) ) ( not ( = ?auto_388435 ?auto_388438 ) ) ( not ( = ?auto_388435 ?auto_388439 ) ) ( not ( = ?auto_388435 ?auto_388440 ) ) ( not ( = ?auto_388435 ?auto_388441 ) ) ( not ( = ?auto_388436 ?auto_388437 ) ) ( not ( = ?auto_388436 ?auto_388438 ) ) ( not ( = ?auto_388436 ?auto_388439 ) ) ( not ( = ?auto_388436 ?auto_388440 ) ) ( not ( = ?auto_388436 ?auto_388441 ) ) ( not ( = ?auto_388437 ?auto_388438 ) ) ( not ( = ?auto_388437 ?auto_388439 ) ) ( not ( = ?auto_388437 ?auto_388440 ) ) ( not ( = ?auto_388437 ?auto_388441 ) ) ( not ( = ?auto_388438 ?auto_388439 ) ) ( not ( = ?auto_388438 ?auto_388440 ) ) ( not ( = ?auto_388438 ?auto_388441 ) ) ( not ( = ?auto_388439 ?auto_388440 ) ) ( not ( = ?auto_388439 ?auto_388441 ) ) ( not ( = ?auto_388440 ?auto_388441 ) ) ( CLEAR ?auto_388438 ) ( ON ?auto_388439 ?auto_388440 ) ( CLEAR ?auto_388439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388430 ?auto_388431 ?auto_388432 ?auto_388433 ?auto_388434 ?auto_388435 ?auto_388436 ?auto_388437 ?auto_388438 ?auto_388439 )
      ( MAKE-11PILE ?auto_388430 ?auto_388431 ?auto_388432 ?auto_388433 ?auto_388434 ?auto_388435 ?auto_388436 ?auto_388437 ?auto_388438 ?auto_388439 ?auto_388440 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388453 - BLOCK
      ?auto_388454 - BLOCK
      ?auto_388455 - BLOCK
      ?auto_388456 - BLOCK
      ?auto_388457 - BLOCK
      ?auto_388458 - BLOCK
      ?auto_388459 - BLOCK
      ?auto_388460 - BLOCK
      ?auto_388461 - BLOCK
      ?auto_388462 - BLOCK
      ?auto_388463 - BLOCK
    )
    :vars
    (
      ?auto_388464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388463 ?auto_388464 ) ( ON-TABLE ?auto_388453 ) ( ON ?auto_388454 ?auto_388453 ) ( ON ?auto_388455 ?auto_388454 ) ( ON ?auto_388456 ?auto_388455 ) ( ON ?auto_388457 ?auto_388456 ) ( ON ?auto_388458 ?auto_388457 ) ( ON ?auto_388459 ?auto_388458 ) ( ON ?auto_388460 ?auto_388459 ) ( not ( = ?auto_388453 ?auto_388454 ) ) ( not ( = ?auto_388453 ?auto_388455 ) ) ( not ( = ?auto_388453 ?auto_388456 ) ) ( not ( = ?auto_388453 ?auto_388457 ) ) ( not ( = ?auto_388453 ?auto_388458 ) ) ( not ( = ?auto_388453 ?auto_388459 ) ) ( not ( = ?auto_388453 ?auto_388460 ) ) ( not ( = ?auto_388453 ?auto_388461 ) ) ( not ( = ?auto_388453 ?auto_388462 ) ) ( not ( = ?auto_388453 ?auto_388463 ) ) ( not ( = ?auto_388453 ?auto_388464 ) ) ( not ( = ?auto_388454 ?auto_388455 ) ) ( not ( = ?auto_388454 ?auto_388456 ) ) ( not ( = ?auto_388454 ?auto_388457 ) ) ( not ( = ?auto_388454 ?auto_388458 ) ) ( not ( = ?auto_388454 ?auto_388459 ) ) ( not ( = ?auto_388454 ?auto_388460 ) ) ( not ( = ?auto_388454 ?auto_388461 ) ) ( not ( = ?auto_388454 ?auto_388462 ) ) ( not ( = ?auto_388454 ?auto_388463 ) ) ( not ( = ?auto_388454 ?auto_388464 ) ) ( not ( = ?auto_388455 ?auto_388456 ) ) ( not ( = ?auto_388455 ?auto_388457 ) ) ( not ( = ?auto_388455 ?auto_388458 ) ) ( not ( = ?auto_388455 ?auto_388459 ) ) ( not ( = ?auto_388455 ?auto_388460 ) ) ( not ( = ?auto_388455 ?auto_388461 ) ) ( not ( = ?auto_388455 ?auto_388462 ) ) ( not ( = ?auto_388455 ?auto_388463 ) ) ( not ( = ?auto_388455 ?auto_388464 ) ) ( not ( = ?auto_388456 ?auto_388457 ) ) ( not ( = ?auto_388456 ?auto_388458 ) ) ( not ( = ?auto_388456 ?auto_388459 ) ) ( not ( = ?auto_388456 ?auto_388460 ) ) ( not ( = ?auto_388456 ?auto_388461 ) ) ( not ( = ?auto_388456 ?auto_388462 ) ) ( not ( = ?auto_388456 ?auto_388463 ) ) ( not ( = ?auto_388456 ?auto_388464 ) ) ( not ( = ?auto_388457 ?auto_388458 ) ) ( not ( = ?auto_388457 ?auto_388459 ) ) ( not ( = ?auto_388457 ?auto_388460 ) ) ( not ( = ?auto_388457 ?auto_388461 ) ) ( not ( = ?auto_388457 ?auto_388462 ) ) ( not ( = ?auto_388457 ?auto_388463 ) ) ( not ( = ?auto_388457 ?auto_388464 ) ) ( not ( = ?auto_388458 ?auto_388459 ) ) ( not ( = ?auto_388458 ?auto_388460 ) ) ( not ( = ?auto_388458 ?auto_388461 ) ) ( not ( = ?auto_388458 ?auto_388462 ) ) ( not ( = ?auto_388458 ?auto_388463 ) ) ( not ( = ?auto_388458 ?auto_388464 ) ) ( not ( = ?auto_388459 ?auto_388460 ) ) ( not ( = ?auto_388459 ?auto_388461 ) ) ( not ( = ?auto_388459 ?auto_388462 ) ) ( not ( = ?auto_388459 ?auto_388463 ) ) ( not ( = ?auto_388459 ?auto_388464 ) ) ( not ( = ?auto_388460 ?auto_388461 ) ) ( not ( = ?auto_388460 ?auto_388462 ) ) ( not ( = ?auto_388460 ?auto_388463 ) ) ( not ( = ?auto_388460 ?auto_388464 ) ) ( not ( = ?auto_388461 ?auto_388462 ) ) ( not ( = ?auto_388461 ?auto_388463 ) ) ( not ( = ?auto_388461 ?auto_388464 ) ) ( not ( = ?auto_388462 ?auto_388463 ) ) ( not ( = ?auto_388462 ?auto_388464 ) ) ( not ( = ?auto_388463 ?auto_388464 ) ) ( ON ?auto_388462 ?auto_388463 ) ( CLEAR ?auto_388460 ) ( ON ?auto_388461 ?auto_388462 ) ( CLEAR ?auto_388461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_388453 ?auto_388454 ?auto_388455 ?auto_388456 ?auto_388457 ?auto_388458 ?auto_388459 ?auto_388460 ?auto_388461 )
      ( MAKE-11PILE ?auto_388453 ?auto_388454 ?auto_388455 ?auto_388456 ?auto_388457 ?auto_388458 ?auto_388459 ?auto_388460 ?auto_388461 ?auto_388462 ?auto_388463 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388476 - BLOCK
      ?auto_388477 - BLOCK
      ?auto_388478 - BLOCK
      ?auto_388479 - BLOCK
      ?auto_388480 - BLOCK
      ?auto_388481 - BLOCK
      ?auto_388482 - BLOCK
      ?auto_388483 - BLOCK
      ?auto_388484 - BLOCK
      ?auto_388485 - BLOCK
      ?auto_388486 - BLOCK
    )
    :vars
    (
      ?auto_388487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388486 ?auto_388487 ) ( ON-TABLE ?auto_388476 ) ( ON ?auto_388477 ?auto_388476 ) ( ON ?auto_388478 ?auto_388477 ) ( ON ?auto_388479 ?auto_388478 ) ( ON ?auto_388480 ?auto_388479 ) ( ON ?auto_388481 ?auto_388480 ) ( ON ?auto_388482 ?auto_388481 ) ( ON ?auto_388483 ?auto_388482 ) ( not ( = ?auto_388476 ?auto_388477 ) ) ( not ( = ?auto_388476 ?auto_388478 ) ) ( not ( = ?auto_388476 ?auto_388479 ) ) ( not ( = ?auto_388476 ?auto_388480 ) ) ( not ( = ?auto_388476 ?auto_388481 ) ) ( not ( = ?auto_388476 ?auto_388482 ) ) ( not ( = ?auto_388476 ?auto_388483 ) ) ( not ( = ?auto_388476 ?auto_388484 ) ) ( not ( = ?auto_388476 ?auto_388485 ) ) ( not ( = ?auto_388476 ?auto_388486 ) ) ( not ( = ?auto_388476 ?auto_388487 ) ) ( not ( = ?auto_388477 ?auto_388478 ) ) ( not ( = ?auto_388477 ?auto_388479 ) ) ( not ( = ?auto_388477 ?auto_388480 ) ) ( not ( = ?auto_388477 ?auto_388481 ) ) ( not ( = ?auto_388477 ?auto_388482 ) ) ( not ( = ?auto_388477 ?auto_388483 ) ) ( not ( = ?auto_388477 ?auto_388484 ) ) ( not ( = ?auto_388477 ?auto_388485 ) ) ( not ( = ?auto_388477 ?auto_388486 ) ) ( not ( = ?auto_388477 ?auto_388487 ) ) ( not ( = ?auto_388478 ?auto_388479 ) ) ( not ( = ?auto_388478 ?auto_388480 ) ) ( not ( = ?auto_388478 ?auto_388481 ) ) ( not ( = ?auto_388478 ?auto_388482 ) ) ( not ( = ?auto_388478 ?auto_388483 ) ) ( not ( = ?auto_388478 ?auto_388484 ) ) ( not ( = ?auto_388478 ?auto_388485 ) ) ( not ( = ?auto_388478 ?auto_388486 ) ) ( not ( = ?auto_388478 ?auto_388487 ) ) ( not ( = ?auto_388479 ?auto_388480 ) ) ( not ( = ?auto_388479 ?auto_388481 ) ) ( not ( = ?auto_388479 ?auto_388482 ) ) ( not ( = ?auto_388479 ?auto_388483 ) ) ( not ( = ?auto_388479 ?auto_388484 ) ) ( not ( = ?auto_388479 ?auto_388485 ) ) ( not ( = ?auto_388479 ?auto_388486 ) ) ( not ( = ?auto_388479 ?auto_388487 ) ) ( not ( = ?auto_388480 ?auto_388481 ) ) ( not ( = ?auto_388480 ?auto_388482 ) ) ( not ( = ?auto_388480 ?auto_388483 ) ) ( not ( = ?auto_388480 ?auto_388484 ) ) ( not ( = ?auto_388480 ?auto_388485 ) ) ( not ( = ?auto_388480 ?auto_388486 ) ) ( not ( = ?auto_388480 ?auto_388487 ) ) ( not ( = ?auto_388481 ?auto_388482 ) ) ( not ( = ?auto_388481 ?auto_388483 ) ) ( not ( = ?auto_388481 ?auto_388484 ) ) ( not ( = ?auto_388481 ?auto_388485 ) ) ( not ( = ?auto_388481 ?auto_388486 ) ) ( not ( = ?auto_388481 ?auto_388487 ) ) ( not ( = ?auto_388482 ?auto_388483 ) ) ( not ( = ?auto_388482 ?auto_388484 ) ) ( not ( = ?auto_388482 ?auto_388485 ) ) ( not ( = ?auto_388482 ?auto_388486 ) ) ( not ( = ?auto_388482 ?auto_388487 ) ) ( not ( = ?auto_388483 ?auto_388484 ) ) ( not ( = ?auto_388483 ?auto_388485 ) ) ( not ( = ?auto_388483 ?auto_388486 ) ) ( not ( = ?auto_388483 ?auto_388487 ) ) ( not ( = ?auto_388484 ?auto_388485 ) ) ( not ( = ?auto_388484 ?auto_388486 ) ) ( not ( = ?auto_388484 ?auto_388487 ) ) ( not ( = ?auto_388485 ?auto_388486 ) ) ( not ( = ?auto_388485 ?auto_388487 ) ) ( not ( = ?auto_388486 ?auto_388487 ) ) ( ON ?auto_388485 ?auto_388486 ) ( CLEAR ?auto_388483 ) ( ON ?auto_388484 ?auto_388485 ) ( CLEAR ?auto_388484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_388476 ?auto_388477 ?auto_388478 ?auto_388479 ?auto_388480 ?auto_388481 ?auto_388482 ?auto_388483 ?auto_388484 )
      ( MAKE-11PILE ?auto_388476 ?auto_388477 ?auto_388478 ?auto_388479 ?auto_388480 ?auto_388481 ?auto_388482 ?auto_388483 ?auto_388484 ?auto_388485 ?auto_388486 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388499 - BLOCK
      ?auto_388500 - BLOCK
      ?auto_388501 - BLOCK
      ?auto_388502 - BLOCK
      ?auto_388503 - BLOCK
      ?auto_388504 - BLOCK
      ?auto_388505 - BLOCK
      ?auto_388506 - BLOCK
      ?auto_388507 - BLOCK
      ?auto_388508 - BLOCK
      ?auto_388509 - BLOCK
    )
    :vars
    (
      ?auto_388510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388509 ?auto_388510 ) ( ON-TABLE ?auto_388499 ) ( ON ?auto_388500 ?auto_388499 ) ( ON ?auto_388501 ?auto_388500 ) ( ON ?auto_388502 ?auto_388501 ) ( ON ?auto_388503 ?auto_388502 ) ( ON ?auto_388504 ?auto_388503 ) ( ON ?auto_388505 ?auto_388504 ) ( not ( = ?auto_388499 ?auto_388500 ) ) ( not ( = ?auto_388499 ?auto_388501 ) ) ( not ( = ?auto_388499 ?auto_388502 ) ) ( not ( = ?auto_388499 ?auto_388503 ) ) ( not ( = ?auto_388499 ?auto_388504 ) ) ( not ( = ?auto_388499 ?auto_388505 ) ) ( not ( = ?auto_388499 ?auto_388506 ) ) ( not ( = ?auto_388499 ?auto_388507 ) ) ( not ( = ?auto_388499 ?auto_388508 ) ) ( not ( = ?auto_388499 ?auto_388509 ) ) ( not ( = ?auto_388499 ?auto_388510 ) ) ( not ( = ?auto_388500 ?auto_388501 ) ) ( not ( = ?auto_388500 ?auto_388502 ) ) ( not ( = ?auto_388500 ?auto_388503 ) ) ( not ( = ?auto_388500 ?auto_388504 ) ) ( not ( = ?auto_388500 ?auto_388505 ) ) ( not ( = ?auto_388500 ?auto_388506 ) ) ( not ( = ?auto_388500 ?auto_388507 ) ) ( not ( = ?auto_388500 ?auto_388508 ) ) ( not ( = ?auto_388500 ?auto_388509 ) ) ( not ( = ?auto_388500 ?auto_388510 ) ) ( not ( = ?auto_388501 ?auto_388502 ) ) ( not ( = ?auto_388501 ?auto_388503 ) ) ( not ( = ?auto_388501 ?auto_388504 ) ) ( not ( = ?auto_388501 ?auto_388505 ) ) ( not ( = ?auto_388501 ?auto_388506 ) ) ( not ( = ?auto_388501 ?auto_388507 ) ) ( not ( = ?auto_388501 ?auto_388508 ) ) ( not ( = ?auto_388501 ?auto_388509 ) ) ( not ( = ?auto_388501 ?auto_388510 ) ) ( not ( = ?auto_388502 ?auto_388503 ) ) ( not ( = ?auto_388502 ?auto_388504 ) ) ( not ( = ?auto_388502 ?auto_388505 ) ) ( not ( = ?auto_388502 ?auto_388506 ) ) ( not ( = ?auto_388502 ?auto_388507 ) ) ( not ( = ?auto_388502 ?auto_388508 ) ) ( not ( = ?auto_388502 ?auto_388509 ) ) ( not ( = ?auto_388502 ?auto_388510 ) ) ( not ( = ?auto_388503 ?auto_388504 ) ) ( not ( = ?auto_388503 ?auto_388505 ) ) ( not ( = ?auto_388503 ?auto_388506 ) ) ( not ( = ?auto_388503 ?auto_388507 ) ) ( not ( = ?auto_388503 ?auto_388508 ) ) ( not ( = ?auto_388503 ?auto_388509 ) ) ( not ( = ?auto_388503 ?auto_388510 ) ) ( not ( = ?auto_388504 ?auto_388505 ) ) ( not ( = ?auto_388504 ?auto_388506 ) ) ( not ( = ?auto_388504 ?auto_388507 ) ) ( not ( = ?auto_388504 ?auto_388508 ) ) ( not ( = ?auto_388504 ?auto_388509 ) ) ( not ( = ?auto_388504 ?auto_388510 ) ) ( not ( = ?auto_388505 ?auto_388506 ) ) ( not ( = ?auto_388505 ?auto_388507 ) ) ( not ( = ?auto_388505 ?auto_388508 ) ) ( not ( = ?auto_388505 ?auto_388509 ) ) ( not ( = ?auto_388505 ?auto_388510 ) ) ( not ( = ?auto_388506 ?auto_388507 ) ) ( not ( = ?auto_388506 ?auto_388508 ) ) ( not ( = ?auto_388506 ?auto_388509 ) ) ( not ( = ?auto_388506 ?auto_388510 ) ) ( not ( = ?auto_388507 ?auto_388508 ) ) ( not ( = ?auto_388507 ?auto_388509 ) ) ( not ( = ?auto_388507 ?auto_388510 ) ) ( not ( = ?auto_388508 ?auto_388509 ) ) ( not ( = ?auto_388508 ?auto_388510 ) ) ( not ( = ?auto_388509 ?auto_388510 ) ) ( ON ?auto_388508 ?auto_388509 ) ( ON ?auto_388507 ?auto_388508 ) ( CLEAR ?auto_388505 ) ( ON ?auto_388506 ?auto_388507 ) ( CLEAR ?auto_388506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388499 ?auto_388500 ?auto_388501 ?auto_388502 ?auto_388503 ?auto_388504 ?auto_388505 ?auto_388506 )
      ( MAKE-11PILE ?auto_388499 ?auto_388500 ?auto_388501 ?auto_388502 ?auto_388503 ?auto_388504 ?auto_388505 ?auto_388506 ?auto_388507 ?auto_388508 ?auto_388509 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388522 - BLOCK
      ?auto_388523 - BLOCK
      ?auto_388524 - BLOCK
      ?auto_388525 - BLOCK
      ?auto_388526 - BLOCK
      ?auto_388527 - BLOCK
      ?auto_388528 - BLOCK
      ?auto_388529 - BLOCK
      ?auto_388530 - BLOCK
      ?auto_388531 - BLOCK
      ?auto_388532 - BLOCK
    )
    :vars
    (
      ?auto_388533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388532 ?auto_388533 ) ( ON-TABLE ?auto_388522 ) ( ON ?auto_388523 ?auto_388522 ) ( ON ?auto_388524 ?auto_388523 ) ( ON ?auto_388525 ?auto_388524 ) ( ON ?auto_388526 ?auto_388525 ) ( ON ?auto_388527 ?auto_388526 ) ( ON ?auto_388528 ?auto_388527 ) ( not ( = ?auto_388522 ?auto_388523 ) ) ( not ( = ?auto_388522 ?auto_388524 ) ) ( not ( = ?auto_388522 ?auto_388525 ) ) ( not ( = ?auto_388522 ?auto_388526 ) ) ( not ( = ?auto_388522 ?auto_388527 ) ) ( not ( = ?auto_388522 ?auto_388528 ) ) ( not ( = ?auto_388522 ?auto_388529 ) ) ( not ( = ?auto_388522 ?auto_388530 ) ) ( not ( = ?auto_388522 ?auto_388531 ) ) ( not ( = ?auto_388522 ?auto_388532 ) ) ( not ( = ?auto_388522 ?auto_388533 ) ) ( not ( = ?auto_388523 ?auto_388524 ) ) ( not ( = ?auto_388523 ?auto_388525 ) ) ( not ( = ?auto_388523 ?auto_388526 ) ) ( not ( = ?auto_388523 ?auto_388527 ) ) ( not ( = ?auto_388523 ?auto_388528 ) ) ( not ( = ?auto_388523 ?auto_388529 ) ) ( not ( = ?auto_388523 ?auto_388530 ) ) ( not ( = ?auto_388523 ?auto_388531 ) ) ( not ( = ?auto_388523 ?auto_388532 ) ) ( not ( = ?auto_388523 ?auto_388533 ) ) ( not ( = ?auto_388524 ?auto_388525 ) ) ( not ( = ?auto_388524 ?auto_388526 ) ) ( not ( = ?auto_388524 ?auto_388527 ) ) ( not ( = ?auto_388524 ?auto_388528 ) ) ( not ( = ?auto_388524 ?auto_388529 ) ) ( not ( = ?auto_388524 ?auto_388530 ) ) ( not ( = ?auto_388524 ?auto_388531 ) ) ( not ( = ?auto_388524 ?auto_388532 ) ) ( not ( = ?auto_388524 ?auto_388533 ) ) ( not ( = ?auto_388525 ?auto_388526 ) ) ( not ( = ?auto_388525 ?auto_388527 ) ) ( not ( = ?auto_388525 ?auto_388528 ) ) ( not ( = ?auto_388525 ?auto_388529 ) ) ( not ( = ?auto_388525 ?auto_388530 ) ) ( not ( = ?auto_388525 ?auto_388531 ) ) ( not ( = ?auto_388525 ?auto_388532 ) ) ( not ( = ?auto_388525 ?auto_388533 ) ) ( not ( = ?auto_388526 ?auto_388527 ) ) ( not ( = ?auto_388526 ?auto_388528 ) ) ( not ( = ?auto_388526 ?auto_388529 ) ) ( not ( = ?auto_388526 ?auto_388530 ) ) ( not ( = ?auto_388526 ?auto_388531 ) ) ( not ( = ?auto_388526 ?auto_388532 ) ) ( not ( = ?auto_388526 ?auto_388533 ) ) ( not ( = ?auto_388527 ?auto_388528 ) ) ( not ( = ?auto_388527 ?auto_388529 ) ) ( not ( = ?auto_388527 ?auto_388530 ) ) ( not ( = ?auto_388527 ?auto_388531 ) ) ( not ( = ?auto_388527 ?auto_388532 ) ) ( not ( = ?auto_388527 ?auto_388533 ) ) ( not ( = ?auto_388528 ?auto_388529 ) ) ( not ( = ?auto_388528 ?auto_388530 ) ) ( not ( = ?auto_388528 ?auto_388531 ) ) ( not ( = ?auto_388528 ?auto_388532 ) ) ( not ( = ?auto_388528 ?auto_388533 ) ) ( not ( = ?auto_388529 ?auto_388530 ) ) ( not ( = ?auto_388529 ?auto_388531 ) ) ( not ( = ?auto_388529 ?auto_388532 ) ) ( not ( = ?auto_388529 ?auto_388533 ) ) ( not ( = ?auto_388530 ?auto_388531 ) ) ( not ( = ?auto_388530 ?auto_388532 ) ) ( not ( = ?auto_388530 ?auto_388533 ) ) ( not ( = ?auto_388531 ?auto_388532 ) ) ( not ( = ?auto_388531 ?auto_388533 ) ) ( not ( = ?auto_388532 ?auto_388533 ) ) ( ON ?auto_388531 ?auto_388532 ) ( ON ?auto_388530 ?auto_388531 ) ( CLEAR ?auto_388528 ) ( ON ?auto_388529 ?auto_388530 ) ( CLEAR ?auto_388529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_388522 ?auto_388523 ?auto_388524 ?auto_388525 ?auto_388526 ?auto_388527 ?auto_388528 ?auto_388529 )
      ( MAKE-11PILE ?auto_388522 ?auto_388523 ?auto_388524 ?auto_388525 ?auto_388526 ?auto_388527 ?auto_388528 ?auto_388529 ?auto_388530 ?auto_388531 ?auto_388532 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388545 - BLOCK
      ?auto_388546 - BLOCK
      ?auto_388547 - BLOCK
      ?auto_388548 - BLOCK
      ?auto_388549 - BLOCK
      ?auto_388550 - BLOCK
      ?auto_388551 - BLOCK
      ?auto_388552 - BLOCK
      ?auto_388553 - BLOCK
      ?auto_388554 - BLOCK
      ?auto_388555 - BLOCK
    )
    :vars
    (
      ?auto_388556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388555 ?auto_388556 ) ( ON-TABLE ?auto_388545 ) ( ON ?auto_388546 ?auto_388545 ) ( ON ?auto_388547 ?auto_388546 ) ( ON ?auto_388548 ?auto_388547 ) ( ON ?auto_388549 ?auto_388548 ) ( ON ?auto_388550 ?auto_388549 ) ( not ( = ?auto_388545 ?auto_388546 ) ) ( not ( = ?auto_388545 ?auto_388547 ) ) ( not ( = ?auto_388545 ?auto_388548 ) ) ( not ( = ?auto_388545 ?auto_388549 ) ) ( not ( = ?auto_388545 ?auto_388550 ) ) ( not ( = ?auto_388545 ?auto_388551 ) ) ( not ( = ?auto_388545 ?auto_388552 ) ) ( not ( = ?auto_388545 ?auto_388553 ) ) ( not ( = ?auto_388545 ?auto_388554 ) ) ( not ( = ?auto_388545 ?auto_388555 ) ) ( not ( = ?auto_388545 ?auto_388556 ) ) ( not ( = ?auto_388546 ?auto_388547 ) ) ( not ( = ?auto_388546 ?auto_388548 ) ) ( not ( = ?auto_388546 ?auto_388549 ) ) ( not ( = ?auto_388546 ?auto_388550 ) ) ( not ( = ?auto_388546 ?auto_388551 ) ) ( not ( = ?auto_388546 ?auto_388552 ) ) ( not ( = ?auto_388546 ?auto_388553 ) ) ( not ( = ?auto_388546 ?auto_388554 ) ) ( not ( = ?auto_388546 ?auto_388555 ) ) ( not ( = ?auto_388546 ?auto_388556 ) ) ( not ( = ?auto_388547 ?auto_388548 ) ) ( not ( = ?auto_388547 ?auto_388549 ) ) ( not ( = ?auto_388547 ?auto_388550 ) ) ( not ( = ?auto_388547 ?auto_388551 ) ) ( not ( = ?auto_388547 ?auto_388552 ) ) ( not ( = ?auto_388547 ?auto_388553 ) ) ( not ( = ?auto_388547 ?auto_388554 ) ) ( not ( = ?auto_388547 ?auto_388555 ) ) ( not ( = ?auto_388547 ?auto_388556 ) ) ( not ( = ?auto_388548 ?auto_388549 ) ) ( not ( = ?auto_388548 ?auto_388550 ) ) ( not ( = ?auto_388548 ?auto_388551 ) ) ( not ( = ?auto_388548 ?auto_388552 ) ) ( not ( = ?auto_388548 ?auto_388553 ) ) ( not ( = ?auto_388548 ?auto_388554 ) ) ( not ( = ?auto_388548 ?auto_388555 ) ) ( not ( = ?auto_388548 ?auto_388556 ) ) ( not ( = ?auto_388549 ?auto_388550 ) ) ( not ( = ?auto_388549 ?auto_388551 ) ) ( not ( = ?auto_388549 ?auto_388552 ) ) ( not ( = ?auto_388549 ?auto_388553 ) ) ( not ( = ?auto_388549 ?auto_388554 ) ) ( not ( = ?auto_388549 ?auto_388555 ) ) ( not ( = ?auto_388549 ?auto_388556 ) ) ( not ( = ?auto_388550 ?auto_388551 ) ) ( not ( = ?auto_388550 ?auto_388552 ) ) ( not ( = ?auto_388550 ?auto_388553 ) ) ( not ( = ?auto_388550 ?auto_388554 ) ) ( not ( = ?auto_388550 ?auto_388555 ) ) ( not ( = ?auto_388550 ?auto_388556 ) ) ( not ( = ?auto_388551 ?auto_388552 ) ) ( not ( = ?auto_388551 ?auto_388553 ) ) ( not ( = ?auto_388551 ?auto_388554 ) ) ( not ( = ?auto_388551 ?auto_388555 ) ) ( not ( = ?auto_388551 ?auto_388556 ) ) ( not ( = ?auto_388552 ?auto_388553 ) ) ( not ( = ?auto_388552 ?auto_388554 ) ) ( not ( = ?auto_388552 ?auto_388555 ) ) ( not ( = ?auto_388552 ?auto_388556 ) ) ( not ( = ?auto_388553 ?auto_388554 ) ) ( not ( = ?auto_388553 ?auto_388555 ) ) ( not ( = ?auto_388553 ?auto_388556 ) ) ( not ( = ?auto_388554 ?auto_388555 ) ) ( not ( = ?auto_388554 ?auto_388556 ) ) ( not ( = ?auto_388555 ?auto_388556 ) ) ( ON ?auto_388554 ?auto_388555 ) ( ON ?auto_388553 ?auto_388554 ) ( ON ?auto_388552 ?auto_388553 ) ( CLEAR ?auto_388550 ) ( ON ?auto_388551 ?auto_388552 ) ( CLEAR ?auto_388551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388545 ?auto_388546 ?auto_388547 ?auto_388548 ?auto_388549 ?auto_388550 ?auto_388551 )
      ( MAKE-11PILE ?auto_388545 ?auto_388546 ?auto_388547 ?auto_388548 ?auto_388549 ?auto_388550 ?auto_388551 ?auto_388552 ?auto_388553 ?auto_388554 ?auto_388555 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388568 - BLOCK
      ?auto_388569 - BLOCK
      ?auto_388570 - BLOCK
      ?auto_388571 - BLOCK
      ?auto_388572 - BLOCK
      ?auto_388573 - BLOCK
      ?auto_388574 - BLOCK
      ?auto_388575 - BLOCK
      ?auto_388576 - BLOCK
      ?auto_388577 - BLOCK
      ?auto_388578 - BLOCK
    )
    :vars
    (
      ?auto_388579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388578 ?auto_388579 ) ( ON-TABLE ?auto_388568 ) ( ON ?auto_388569 ?auto_388568 ) ( ON ?auto_388570 ?auto_388569 ) ( ON ?auto_388571 ?auto_388570 ) ( ON ?auto_388572 ?auto_388571 ) ( ON ?auto_388573 ?auto_388572 ) ( not ( = ?auto_388568 ?auto_388569 ) ) ( not ( = ?auto_388568 ?auto_388570 ) ) ( not ( = ?auto_388568 ?auto_388571 ) ) ( not ( = ?auto_388568 ?auto_388572 ) ) ( not ( = ?auto_388568 ?auto_388573 ) ) ( not ( = ?auto_388568 ?auto_388574 ) ) ( not ( = ?auto_388568 ?auto_388575 ) ) ( not ( = ?auto_388568 ?auto_388576 ) ) ( not ( = ?auto_388568 ?auto_388577 ) ) ( not ( = ?auto_388568 ?auto_388578 ) ) ( not ( = ?auto_388568 ?auto_388579 ) ) ( not ( = ?auto_388569 ?auto_388570 ) ) ( not ( = ?auto_388569 ?auto_388571 ) ) ( not ( = ?auto_388569 ?auto_388572 ) ) ( not ( = ?auto_388569 ?auto_388573 ) ) ( not ( = ?auto_388569 ?auto_388574 ) ) ( not ( = ?auto_388569 ?auto_388575 ) ) ( not ( = ?auto_388569 ?auto_388576 ) ) ( not ( = ?auto_388569 ?auto_388577 ) ) ( not ( = ?auto_388569 ?auto_388578 ) ) ( not ( = ?auto_388569 ?auto_388579 ) ) ( not ( = ?auto_388570 ?auto_388571 ) ) ( not ( = ?auto_388570 ?auto_388572 ) ) ( not ( = ?auto_388570 ?auto_388573 ) ) ( not ( = ?auto_388570 ?auto_388574 ) ) ( not ( = ?auto_388570 ?auto_388575 ) ) ( not ( = ?auto_388570 ?auto_388576 ) ) ( not ( = ?auto_388570 ?auto_388577 ) ) ( not ( = ?auto_388570 ?auto_388578 ) ) ( not ( = ?auto_388570 ?auto_388579 ) ) ( not ( = ?auto_388571 ?auto_388572 ) ) ( not ( = ?auto_388571 ?auto_388573 ) ) ( not ( = ?auto_388571 ?auto_388574 ) ) ( not ( = ?auto_388571 ?auto_388575 ) ) ( not ( = ?auto_388571 ?auto_388576 ) ) ( not ( = ?auto_388571 ?auto_388577 ) ) ( not ( = ?auto_388571 ?auto_388578 ) ) ( not ( = ?auto_388571 ?auto_388579 ) ) ( not ( = ?auto_388572 ?auto_388573 ) ) ( not ( = ?auto_388572 ?auto_388574 ) ) ( not ( = ?auto_388572 ?auto_388575 ) ) ( not ( = ?auto_388572 ?auto_388576 ) ) ( not ( = ?auto_388572 ?auto_388577 ) ) ( not ( = ?auto_388572 ?auto_388578 ) ) ( not ( = ?auto_388572 ?auto_388579 ) ) ( not ( = ?auto_388573 ?auto_388574 ) ) ( not ( = ?auto_388573 ?auto_388575 ) ) ( not ( = ?auto_388573 ?auto_388576 ) ) ( not ( = ?auto_388573 ?auto_388577 ) ) ( not ( = ?auto_388573 ?auto_388578 ) ) ( not ( = ?auto_388573 ?auto_388579 ) ) ( not ( = ?auto_388574 ?auto_388575 ) ) ( not ( = ?auto_388574 ?auto_388576 ) ) ( not ( = ?auto_388574 ?auto_388577 ) ) ( not ( = ?auto_388574 ?auto_388578 ) ) ( not ( = ?auto_388574 ?auto_388579 ) ) ( not ( = ?auto_388575 ?auto_388576 ) ) ( not ( = ?auto_388575 ?auto_388577 ) ) ( not ( = ?auto_388575 ?auto_388578 ) ) ( not ( = ?auto_388575 ?auto_388579 ) ) ( not ( = ?auto_388576 ?auto_388577 ) ) ( not ( = ?auto_388576 ?auto_388578 ) ) ( not ( = ?auto_388576 ?auto_388579 ) ) ( not ( = ?auto_388577 ?auto_388578 ) ) ( not ( = ?auto_388577 ?auto_388579 ) ) ( not ( = ?auto_388578 ?auto_388579 ) ) ( ON ?auto_388577 ?auto_388578 ) ( ON ?auto_388576 ?auto_388577 ) ( ON ?auto_388575 ?auto_388576 ) ( CLEAR ?auto_388573 ) ( ON ?auto_388574 ?auto_388575 ) ( CLEAR ?auto_388574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_388568 ?auto_388569 ?auto_388570 ?auto_388571 ?auto_388572 ?auto_388573 ?auto_388574 )
      ( MAKE-11PILE ?auto_388568 ?auto_388569 ?auto_388570 ?auto_388571 ?auto_388572 ?auto_388573 ?auto_388574 ?auto_388575 ?auto_388576 ?auto_388577 ?auto_388578 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388591 - BLOCK
      ?auto_388592 - BLOCK
      ?auto_388593 - BLOCK
      ?auto_388594 - BLOCK
      ?auto_388595 - BLOCK
      ?auto_388596 - BLOCK
      ?auto_388597 - BLOCK
      ?auto_388598 - BLOCK
      ?auto_388599 - BLOCK
      ?auto_388600 - BLOCK
      ?auto_388601 - BLOCK
    )
    :vars
    (
      ?auto_388602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388601 ?auto_388602 ) ( ON-TABLE ?auto_388591 ) ( ON ?auto_388592 ?auto_388591 ) ( ON ?auto_388593 ?auto_388592 ) ( ON ?auto_388594 ?auto_388593 ) ( ON ?auto_388595 ?auto_388594 ) ( not ( = ?auto_388591 ?auto_388592 ) ) ( not ( = ?auto_388591 ?auto_388593 ) ) ( not ( = ?auto_388591 ?auto_388594 ) ) ( not ( = ?auto_388591 ?auto_388595 ) ) ( not ( = ?auto_388591 ?auto_388596 ) ) ( not ( = ?auto_388591 ?auto_388597 ) ) ( not ( = ?auto_388591 ?auto_388598 ) ) ( not ( = ?auto_388591 ?auto_388599 ) ) ( not ( = ?auto_388591 ?auto_388600 ) ) ( not ( = ?auto_388591 ?auto_388601 ) ) ( not ( = ?auto_388591 ?auto_388602 ) ) ( not ( = ?auto_388592 ?auto_388593 ) ) ( not ( = ?auto_388592 ?auto_388594 ) ) ( not ( = ?auto_388592 ?auto_388595 ) ) ( not ( = ?auto_388592 ?auto_388596 ) ) ( not ( = ?auto_388592 ?auto_388597 ) ) ( not ( = ?auto_388592 ?auto_388598 ) ) ( not ( = ?auto_388592 ?auto_388599 ) ) ( not ( = ?auto_388592 ?auto_388600 ) ) ( not ( = ?auto_388592 ?auto_388601 ) ) ( not ( = ?auto_388592 ?auto_388602 ) ) ( not ( = ?auto_388593 ?auto_388594 ) ) ( not ( = ?auto_388593 ?auto_388595 ) ) ( not ( = ?auto_388593 ?auto_388596 ) ) ( not ( = ?auto_388593 ?auto_388597 ) ) ( not ( = ?auto_388593 ?auto_388598 ) ) ( not ( = ?auto_388593 ?auto_388599 ) ) ( not ( = ?auto_388593 ?auto_388600 ) ) ( not ( = ?auto_388593 ?auto_388601 ) ) ( not ( = ?auto_388593 ?auto_388602 ) ) ( not ( = ?auto_388594 ?auto_388595 ) ) ( not ( = ?auto_388594 ?auto_388596 ) ) ( not ( = ?auto_388594 ?auto_388597 ) ) ( not ( = ?auto_388594 ?auto_388598 ) ) ( not ( = ?auto_388594 ?auto_388599 ) ) ( not ( = ?auto_388594 ?auto_388600 ) ) ( not ( = ?auto_388594 ?auto_388601 ) ) ( not ( = ?auto_388594 ?auto_388602 ) ) ( not ( = ?auto_388595 ?auto_388596 ) ) ( not ( = ?auto_388595 ?auto_388597 ) ) ( not ( = ?auto_388595 ?auto_388598 ) ) ( not ( = ?auto_388595 ?auto_388599 ) ) ( not ( = ?auto_388595 ?auto_388600 ) ) ( not ( = ?auto_388595 ?auto_388601 ) ) ( not ( = ?auto_388595 ?auto_388602 ) ) ( not ( = ?auto_388596 ?auto_388597 ) ) ( not ( = ?auto_388596 ?auto_388598 ) ) ( not ( = ?auto_388596 ?auto_388599 ) ) ( not ( = ?auto_388596 ?auto_388600 ) ) ( not ( = ?auto_388596 ?auto_388601 ) ) ( not ( = ?auto_388596 ?auto_388602 ) ) ( not ( = ?auto_388597 ?auto_388598 ) ) ( not ( = ?auto_388597 ?auto_388599 ) ) ( not ( = ?auto_388597 ?auto_388600 ) ) ( not ( = ?auto_388597 ?auto_388601 ) ) ( not ( = ?auto_388597 ?auto_388602 ) ) ( not ( = ?auto_388598 ?auto_388599 ) ) ( not ( = ?auto_388598 ?auto_388600 ) ) ( not ( = ?auto_388598 ?auto_388601 ) ) ( not ( = ?auto_388598 ?auto_388602 ) ) ( not ( = ?auto_388599 ?auto_388600 ) ) ( not ( = ?auto_388599 ?auto_388601 ) ) ( not ( = ?auto_388599 ?auto_388602 ) ) ( not ( = ?auto_388600 ?auto_388601 ) ) ( not ( = ?auto_388600 ?auto_388602 ) ) ( not ( = ?auto_388601 ?auto_388602 ) ) ( ON ?auto_388600 ?auto_388601 ) ( ON ?auto_388599 ?auto_388600 ) ( ON ?auto_388598 ?auto_388599 ) ( ON ?auto_388597 ?auto_388598 ) ( CLEAR ?auto_388595 ) ( ON ?auto_388596 ?auto_388597 ) ( CLEAR ?auto_388596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388591 ?auto_388592 ?auto_388593 ?auto_388594 ?auto_388595 ?auto_388596 )
      ( MAKE-11PILE ?auto_388591 ?auto_388592 ?auto_388593 ?auto_388594 ?auto_388595 ?auto_388596 ?auto_388597 ?auto_388598 ?auto_388599 ?auto_388600 ?auto_388601 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388614 - BLOCK
      ?auto_388615 - BLOCK
      ?auto_388616 - BLOCK
      ?auto_388617 - BLOCK
      ?auto_388618 - BLOCK
      ?auto_388619 - BLOCK
      ?auto_388620 - BLOCK
      ?auto_388621 - BLOCK
      ?auto_388622 - BLOCK
      ?auto_388623 - BLOCK
      ?auto_388624 - BLOCK
    )
    :vars
    (
      ?auto_388625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388624 ?auto_388625 ) ( ON-TABLE ?auto_388614 ) ( ON ?auto_388615 ?auto_388614 ) ( ON ?auto_388616 ?auto_388615 ) ( ON ?auto_388617 ?auto_388616 ) ( ON ?auto_388618 ?auto_388617 ) ( not ( = ?auto_388614 ?auto_388615 ) ) ( not ( = ?auto_388614 ?auto_388616 ) ) ( not ( = ?auto_388614 ?auto_388617 ) ) ( not ( = ?auto_388614 ?auto_388618 ) ) ( not ( = ?auto_388614 ?auto_388619 ) ) ( not ( = ?auto_388614 ?auto_388620 ) ) ( not ( = ?auto_388614 ?auto_388621 ) ) ( not ( = ?auto_388614 ?auto_388622 ) ) ( not ( = ?auto_388614 ?auto_388623 ) ) ( not ( = ?auto_388614 ?auto_388624 ) ) ( not ( = ?auto_388614 ?auto_388625 ) ) ( not ( = ?auto_388615 ?auto_388616 ) ) ( not ( = ?auto_388615 ?auto_388617 ) ) ( not ( = ?auto_388615 ?auto_388618 ) ) ( not ( = ?auto_388615 ?auto_388619 ) ) ( not ( = ?auto_388615 ?auto_388620 ) ) ( not ( = ?auto_388615 ?auto_388621 ) ) ( not ( = ?auto_388615 ?auto_388622 ) ) ( not ( = ?auto_388615 ?auto_388623 ) ) ( not ( = ?auto_388615 ?auto_388624 ) ) ( not ( = ?auto_388615 ?auto_388625 ) ) ( not ( = ?auto_388616 ?auto_388617 ) ) ( not ( = ?auto_388616 ?auto_388618 ) ) ( not ( = ?auto_388616 ?auto_388619 ) ) ( not ( = ?auto_388616 ?auto_388620 ) ) ( not ( = ?auto_388616 ?auto_388621 ) ) ( not ( = ?auto_388616 ?auto_388622 ) ) ( not ( = ?auto_388616 ?auto_388623 ) ) ( not ( = ?auto_388616 ?auto_388624 ) ) ( not ( = ?auto_388616 ?auto_388625 ) ) ( not ( = ?auto_388617 ?auto_388618 ) ) ( not ( = ?auto_388617 ?auto_388619 ) ) ( not ( = ?auto_388617 ?auto_388620 ) ) ( not ( = ?auto_388617 ?auto_388621 ) ) ( not ( = ?auto_388617 ?auto_388622 ) ) ( not ( = ?auto_388617 ?auto_388623 ) ) ( not ( = ?auto_388617 ?auto_388624 ) ) ( not ( = ?auto_388617 ?auto_388625 ) ) ( not ( = ?auto_388618 ?auto_388619 ) ) ( not ( = ?auto_388618 ?auto_388620 ) ) ( not ( = ?auto_388618 ?auto_388621 ) ) ( not ( = ?auto_388618 ?auto_388622 ) ) ( not ( = ?auto_388618 ?auto_388623 ) ) ( not ( = ?auto_388618 ?auto_388624 ) ) ( not ( = ?auto_388618 ?auto_388625 ) ) ( not ( = ?auto_388619 ?auto_388620 ) ) ( not ( = ?auto_388619 ?auto_388621 ) ) ( not ( = ?auto_388619 ?auto_388622 ) ) ( not ( = ?auto_388619 ?auto_388623 ) ) ( not ( = ?auto_388619 ?auto_388624 ) ) ( not ( = ?auto_388619 ?auto_388625 ) ) ( not ( = ?auto_388620 ?auto_388621 ) ) ( not ( = ?auto_388620 ?auto_388622 ) ) ( not ( = ?auto_388620 ?auto_388623 ) ) ( not ( = ?auto_388620 ?auto_388624 ) ) ( not ( = ?auto_388620 ?auto_388625 ) ) ( not ( = ?auto_388621 ?auto_388622 ) ) ( not ( = ?auto_388621 ?auto_388623 ) ) ( not ( = ?auto_388621 ?auto_388624 ) ) ( not ( = ?auto_388621 ?auto_388625 ) ) ( not ( = ?auto_388622 ?auto_388623 ) ) ( not ( = ?auto_388622 ?auto_388624 ) ) ( not ( = ?auto_388622 ?auto_388625 ) ) ( not ( = ?auto_388623 ?auto_388624 ) ) ( not ( = ?auto_388623 ?auto_388625 ) ) ( not ( = ?auto_388624 ?auto_388625 ) ) ( ON ?auto_388623 ?auto_388624 ) ( ON ?auto_388622 ?auto_388623 ) ( ON ?auto_388621 ?auto_388622 ) ( ON ?auto_388620 ?auto_388621 ) ( CLEAR ?auto_388618 ) ( ON ?auto_388619 ?auto_388620 ) ( CLEAR ?auto_388619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_388614 ?auto_388615 ?auto_388616 ?auto_388617 ?auto_388618 ?auto_388619 )
      ( MAKE-11PILE ?auto_388614 ?auto_388615 ?auto_388616 ?auto_388617 ?auto_388618 ?auto_388619 ?auto_388620 ?auto_388621 ?auto_388622 ?auto_388623 ?auto_388624 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388637 - BLOCK
      ?auto_388638 - BLOCK
      ?auto_388639 - BLOCK
      ?auto_388640 - BLOCK
      ?auto_388641 - BLOCK
      ?auto_388642 - BLOCK
      ?auto_388643 - BLOCK
      ?auto_388644 - BLOCK
      ?auto_388645 - BLOCK
      ?auto_388646 - BLOCK
      ?auto_388647 - BLOCK
    )
    :vars
    (
      ?auto_388648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388647 ?auto_388648 ) ( ON-TABLE ?auto_388637 ) ( ON ?auto_388638 ?auto_388637 ) ( ON ?auto_388639 ?auto_388638 ) ( ON ?auto_388640 ?auto_388639 ) ( not ( = ?auto_388637 ?auto_388638 ) ) ( not ( = ?auto_388637 ?auto_388639 ) ) ( not ( = ?auto_388637 ?auto_388640 ) ) ( not ( = ?auto_388637 ?auto_388641 ) ) ( not ( = ?auto_388637 ?auto_388642 ) ) ( not ( = ?auto_388637 ?auto_388643 ) ) ( not ( = ?auto_388637 ?auto_388644 ) ) ( not ( = ?auto_388637 ?auto_388645 ) ) ( not ( = ?auto_388637 ?auto_388646 ) ) ( not ( = ?auto_388637 ?auto_388647 ) ) ( not ( = ?auto_388637 ?auto_388648 ) ) ( not ( = ?auto_388638 ?auto_388639 ) ) ( not ( = ?auto_388638 ?auto_388640 ) ) ( not ( = ?auto_388638 ?auto_388641 ) ) ( not ( = ?auto_388638 ?auto_388642 ) ) ( not ( = ?auto_388638 ?auto_388643 ) ) ( not ( = ?auto_388638 ?auto_388644 ) ) ( not ( = ?auto_388638 ?auto_388645 ) ) ( not ( = ?auto_388638 ?auto_388646 ) ) ( not ( = ?auto_388638 ?auto_388647 ) ) ( not ( = ?auto_388638 ?auto_388648 ) ) ( not ( = ?auto_388639 ?auto_388640 ) ) ( not ( = ?auto_388639 ?auto_388641 ) ) ( not ( = ?auto_388639 ?auto_388642 ) ) ( not ( = ?auto_388639 ?auto_388643 ) ) ( not ( = ?auto_388639 ?auto_388644 ) ) ( not ( = ?auto_388639 ?auto_388645 ) ) ( not ( = ?auto_388639 ?auto_388646 ) ) ( not ( = ?auto_388639 ?auto_388647 ) ) ( not ( = ?auto_388639 ?auto_388648 ) ) ( not ( = ?auto_388640 ?auto_388641 ) ) ( not ( = ?auto_388640 ?auto_388642 ) ) ( not ( = ?auto_388640 ?auto_388643 ) ) ( not ( = ?auto_388640 ?auto_388644 ) ) ( not ( = ?auto_388640 ?auto_388645 ) ) ( not ( = ?auto_388640 ?auto_388646 ) ) ( not ( = ?auto_388640 ?auto_388647 ) ) ( not ( = ?auto_388640 ?auto_388648 ) ) ( not ( = ?auto_388641 ?auto_388642 ) ) ( not ( = ?auto_388641 ?auto_388643 ) ) ( not ( = ?auto_388641 ?auto_388644 ) ) ( not ( = ?auto_388641 ?auto_388645 ) ) ( not ( = ?auto_388641 ?auto_388646 ) ) ( not ( = ?auto_388641 ?auto_388647 ) ) ( not ( = ?auto_388641 ?auto_388648 ) ) ( not ( = ?auto_388642 ?auto_388643 ) ) ( not ( = ?auto_388642 ?auto_388644 ) ) ( not ( = ?auto_388642 ?auto_388645 ) ) ( not ( = ?auto_388642 ?auto_388646 ) ) ( not ( = ?auto_388642 ?auto_388647 ) ) ( not ( = ?auto_388642 ?auto_388648 ) ) ( not ( = ?auto_388643 ?auto_388644 ) ) ( not ( = ?auto_388643 ?auto_388645 ) ) ( not ( = ?auto_388643 ?auto_388646 ) ) ( not ( = ?auto_388643 ?auto_388647 ) ) ( not ( = ?auto_388643 ?auto_388648 ) ) ( not ( = ?auto_388644 ?auto_388645 ) ) ( not ( = ?auto_388644 ?auto_388646 ) ) ( not ( = ?auto_388644 ?auto_388647 ) ) ( not ( = ?auto_388644 ?auto_388648 ) ) ( not ( = ?auto_388645 ?auto_388646 ) ) ( not ( = ?auto_388645 ?auto_388647 ) ) ( not ( = ?auto_388645 ?auto_388648 ) ) ( not ( = ?auto_388646 ?auto_388647 ) ) ( not ( = ?auto_388646 ?auto_388648 ) ) ( not ( = ?auto_388647 ?auto_388648 ) ) ( ON ?auto_388646 ?auto_388647 ) ( ON ?auto_388645 ?auto_388646 ) ( ON ?auto_388644 ?auto_388645 ) ( ON ?auto_388643 ?auto_388644 ) ( ON ?auto_388642 ?auto_388643 ) ( CLEAR ?auto_388640 ) ( ON ?auto_388641 ?auto_388642 ) ( CLEAR ?auto_388641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388637 ?auto_388638 ?auto_388639 ?auto_388640 ?auto_388641 )
      ( MAKE-11PILE ?auto_388637 ?auto_388638 ?auto_388639 ?auto_388640 ?auto_388641 ?auto_388642 ?auto_388643 ?auto_388644 ?auto_388645 ?auto_388646 ?auto_388647 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388660 - BLOCK
      ?auto_388661 - BLOCK
      ?auto_388662 - BLOCK
      ?auto_388663 - BLOCK
      ?auto_388664 - BLOCK
      ?auto_388665 - BLOCK
      ?auto_388666 - BLOCK
      ?auto_388667 - BLOCK
      ?auto_388668 - BLOCK
      ?auto_388669 - BLOCK
      ?auto_388670 - BLOCK
    )
    :vars
    (
      ?auto_388671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388670 ?auto_388671 ) ( ON-TABLE ?auto_388660 ) ( ON ?auto_388661 ?auto_388660 ) ( ON ?auto_388662 ?auto_388661 ) ( ON ?auto_388663 ?auto_388662 ) ( not ( = ?auto_388660 ?auto_388661 ) ) ( not ( = ?auto_388660 ?auto_388662 ) ) ( not ( = ?auto_388660 ?auto_388663 ) ) ( not ( = ?auto_388660 ?auto_388664 ) ) ( not ( = ?auto_388660 ?auto_388665 ) ) ( not ( = ?auto_388660 ?auto_388666 ) ) ( not ( = ?auto_388660 ?auto_388667 ) ) ( not ( = ?auto_388660 ?auto_388668 ) ) ( not ( = ?auto_388660 ?auto_388669 ) ) ( not ( = ?auto_388660 ?auto_388670 ) ) ( not ( = ?auto_388660 ?auto_388671 ) ) ( not ( = ?auto_388661 ?auto_388662 ) ) ( not ( = ?auto_388661 ?auto_388663 ) ) ( not ( = ?auto_388661 ?auto_388664 ) ) ( not ( = ?auto_388661 ?auto_388665 ) ) ( not ( = ?auto_388661 ?auto_388666 ) ) ( not ( = ?auto_388661 ?auto_388667 ) ) ( not ( = ?auto_388661 ?auto_388668 ) ) ( not ( = ?auto_388661 ?auto_388669 ) ) ( not ( = ?auto_388661 ?auto_388670 ) ) ( not ( = ?auto_388661 ?auto_388671 ) ) ( not ( = ?auto_388662 ?auto_388663 ) ) ( not ( = ?auto_388662 ?auto_388664 ) ) ( not ( = ?auto_388662 ?auto_388665 ) ) ( not ( = ?auto_388662 ?auto_388666 ) ) ( not ( = ?auto_388662 ?auto_388667 ) ) ( not ( = ?auto_388662 ?auto_388668 ) ) ( not ( = ?auto_388662 ?auto_388669 ) ) ( not ( = ?auto_388662 ?auto_388670 ) ) ( not ( = ?auto_388662 ?auto_388671 ) ) ( not ( = ?auto_388663 ?auto_388664 ) ) ( not ( = ?auto_388663 ?auto_388665 ) ) ( not ( = ?auto_388663 ?auto_388666 ) ) ( not ( = ?auto_388663 ?auto_388667 ) ) ( not ( = ?auto_388663 ?auto_388668 ) ) ( not ( = ?auto_388663 ?auto_388669 ) ) ( not ( = ?auto_388663 ?auto_388670 ) ) ( not ( = ?auto_388663 ?auto_388671 ) ) ( not ( = ?auto_388664 ?auto_388665 ) ) ( not ( = ?auto_388664 ?auto_388666 ) ) ( not ( = ?auto_388664 ?auto_388667 ) ) ( not ( = ?auto_388664 ?auto_388668 ) ) ( not ( = ?auto_388664 ?auto_388669 ) ) ( not ( = ?auto_388664 ?auto_388670 ) ) ( not ( = ?auto_388664 ?auto_388671 ) ) ( not ( = ?auto_388665 ?auto_388666 ) ) ( not ( = ?auto_388665 ?auto_388667 ) ) ( not ( = ?auto_388665 ?auto_388668 ) ) ( not ( = ?auto_388665 ?auto_388669 ) ) ( not ( = ?auto_388665 ?auto_388670 ) ) ( not ( = ?auto_388665 ?auto_388671 ) ) ( not ( = ?auto_388666 ?auto_388667 ) ) ( not ( = ?auto_388666 ?auto_388668 ) ) ( not ( = ?auto_388666 ?auto_388669 ) ) ( not ( = ?auto_388666 ?auto_388670 ) ) ( not ( = ?auto_388666 ?auto_388671 ) ) ( not ( = ?auto_388667 ?auto_388668 ) ) ( not ( = ?auto_388667 ?auto_388669 ) ) ( not ( = ?auto_388667 ?auto_388670 ) ) ( not ( = ?auto_388667 ?auto_388671 ) ) ( not ( = ?auto_388668 ?auto_388669 ) ) ( not ( = ?auto_388668 ?auto_388670 ) ) ( not ( = ?auto_388668 ?auto_388671 ) ) ( not ( = ?auto_388669 ?auto_388670 ) ) ( not ( = ?auto_388669 ?auto_388671 ) ) ( not ( = ?auto_388670 ?auto_388671 ) ) ( ON ?auto_388669 ?auto_388670 ) ( ON ?auto_388668 ?auto_388669 ) ( ON ?auto_388667 ?auto_388668 ) ( ON ?auto_388666 ?auto_388667 ) ( ON ?auto_388665 ?auto_388666 ) ( CLEAR ?auto_388663 ) ( ON ?auto_388664 ?auto_388665 ) ( CLEAR ?auto_388664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_388660 ?auto_388661 ?auto_388662 ?auto_388663 ?auto_388664 )
      ( MAKE-11PILE ?auto_388660 ?auto_388661 ?auto_388662 ?auto_388663 ?auto_388664 ?auto_388665 ?auto_388666 ?auto_388667 ?auto_388668 ?auto_388669 ?auto_388670 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388683 - BLOCK
      ?auto_388684 - BLOCK
      ?auto_388685 - BLOCK
      ?auto_388686 - BLOCK
      ?auto_388687 - BLOCK
      ?auto_388688 - BLOCK
      ?auto_388689 - BLOCK
      ?auto_388690 - BLOCK
      ?auto_388691 - BLOCK
      ?auto_388692 - BLOCK
      ?auto_388693 - BLOCK
    )
    :vars
    (
      ?auto_388694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388693 ?auto_388694 ) ( ON-TABLE ?auto_388683 ) ( ON ?auto_388684 ?auto_388683 ) ( ON ?auto_388685 ?auto_388684 ) ( not ( = ?auto_388683 ?auto_388684 ) ) ( not ( = ?auto_388683 ?auto_388685 ) ) ( not ( = ?auto_388683 ?auto_388686 ) ) ( not ( = ?auto_388683 ?auto_388687 ) ) ( not ( = ?auto_388683 ?auto_388688 ) ) ( not ( = ?auto_388683 ?auto_388689 ) ) ( not ( = ?auto_388683 ?auto_388690 ) ) ( not ( = ?auto_388683 ?auto_388691 ) ) ( not ( = ?auto_388683 ?auto_388692 ) ) ( not ( = ?auto_388683 ?auto_388693 ) ) ( not ( = ?auto_388683 ?auto_388694 ) ) ( not ( = ?auto_388684 ?auto_388685 ) ) ( not ( = ?auto_388684 ?auto_388686 ) ) ( not ( = ?auto_388684 ?auto_388687 ) ) ( not ( = ?auto_388684 ?auto_388688 ) ) ( not ( = ?auto_388684 ?auto_388689 ) ) ( not ( = ?auto_388684 ?auto_388690 ) ) ( not ( = ?auto_388684 ?auto_388691 ) ) ( not ( = ?auto_388684 ?auto_388692 ) ) ( not ( = ?auto_388684 ?auto_388693 ) ) ( not ( = ?auto_388684 ?auto_388694 ) ) ( not ( = ?auto_388685 ?auto_388686 ) ) ( not ( = ?auto_388685 ?auto_388687 ) ) ( not ( = ?auto_388685 ?auto_388688 ) ) ( not ( = ?auto_388685 ?auto_388689 ) ) ( not ( = ?auto_388685 ?auto_388690 ) ) ( not ( = ?auto_388685 ?auto_388691 ) ) ( not ( = ?auto_388685 ?auto_388692 ) ) ( not ( = ?auto_388685 ?auto_388693 ) ) ( not ( = ?auto_388685 ?auto_388694 ) ) ( not ( = ?auto_388686 ?auto_388687 ) ) ( not ( = ?auto_388686 ?auto_388688 ) ) ( not ( = ?auto_388686 ?auto_388689 ) ) ( not ( = ?auto_388686 ?auto_388690 ) ) ( not ( = ?auto_388686 ?auto_388691 ) ) ( not ( = ?auto_388686 ?auto_388692 ) ) ( not ( = ?auto_388686 ?auto_388693 ) ) ( not ( = ?auto_388686 ?auto_388694 ) ) ( not ( = ?auto_388687 ?auto_388688 ) ) ( not ( = ?auto_388687 ?auto_388689 ) ) ( not ( = ?auto_388687 ?auto_388690 ) ) ( not ( = ?auto_388687 ?auto_388691 ) ) ( not ( = ?auto_388687 ?auto_388692 ) ) ( not ( = ?auto_388687 ?auto_388693 ) ) ( not ( = ?auto_388687 ?auto_388694 ) ) ( not ( = ?auto_388688 ?auto_388689 ) ) ( not ( = ?auto_388688 ?auto_388690 ) ) ( not ( = ?auto_388688 ?auto_388691 ) ) ( not ( = ?auto_388688 ?auto_388692 ) ) ( not ( = ?auto_388688 ?auto_388693 ) ) ( not ( = ?auto_388688 ?auto_388694 ) ) ( not ( = ?auto_388689 ?auto_388690 ) ) ( not ( = ?auto_388689 ?auto_388691 ) ) ( not ( = ?auto_388689 ?auto_388692 ) ) ( not ( = ?auto_388689 ?auto_388693 ) ) ( not ( = ?auto_388689 ?auto_388694 ) ) ( not ( = ?auto_388690 ?auto_388691 ) ) ( not ( = ?auto_388690 ?auto_388692 ) ) ( not ( = ?auto_388690 ?auto_388693 ) ) ( not ( = ?auto_388690 ?auto_388694 ) ) ( not ( = ?auto_388691 ?auto_388692 ) ) ( not ( = ?auto_388691 ?auto_388693 ) ) ( not ( = ?auto_388691 ?auto_388694 ) ) ( not ( = ?auto_388692 ?auto_388693 ) ) ( not ( = ?auto_388692 ?auto_388694 ) ) ( not ( = ?auto_388693 ?auto_388694 ) ) ( ON ?auto_388692 ?auto_388693 ) ( ON ?auto_388691 ?auto_388692 ) ( ON ?auto_388690 ?auto_388691 ) ( ON ?auto_388689 ?auto_388690 ) ( ON ?auto_388688 ?auto_388689 ) ( ON ?auto_388687 ?auto_388688 ) ( CLEAR ?auto_388685 ) ( ON ?auto_388686 ?auto_388687 ) ( CLEAR ?auto_388686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388683 ?auto_388684 ?auto_388685 ?auto_388686 )
      ( MAKE-11PILE ?auto_388683 ?auto_388684 ?auto_388685 ?auto_388686 ?auto_388687 ?auto_388688 ?auto_388689 ?auto_388690 ?auto_388691 ?auto_388692 ?auto_388693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388706 - BLOCK
      ?auto_388707 - BLOCK
      ?auto_388708 - BLOCK
      ?auto_388709 - BLOCK
      ?auto_388710 - BLOCK
      ?auto_388711 - BLOCK
      ?auto_388712 - BLOCK
      ?auto_388713 - BLOCK
      ?auto_388714 - BLOCK
      ?auto_388715 - BLOCK
      ?auto_388716 - BLOCK
    )
    :vars
    (
      ?auto_388717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388716 ?auto_388717 ) ( ON-TABLE ?auto_388706 ) ( ON ?auto_388707 ?auto_388706 ) ( ON ?auto_388708 ?auto_388707 ) ( not ( = ?auto_388706 ?auto_388707 ) ) ( not ( = ?auto_388706 ?auto_388708 ) ) ( not ( = ?auto_388706 ?auto_388709 ) ) ( not ( = ?auto_388706 ?auto_388710 ) ) ( not ( = ?auto_388706 ?auto_388711 ) ) ( not ( = ?auto_388706 ?auto_388712 ) ) ( not ( = ?auto_388706 ?auto_388713 ) ) ( not ( = ?auto_388706 ?auto_388714 ) ) ( not ( = ?auto_388706 ?auto_388715 ) ) ( not ( = ?auto_388706 ?auto_388716 ) ) ( not ( = ?auto_388706 ?auto_388717 ) ) ( not ( = ?auto_388707 ?auto_388708 ) ) ( not ( = ?auto_388707 ?auto_388709 ) ) ( not ( = ?auto_388707 ?auto_388710 ) ) ( not ( = ?auto_388707 ?auto_388711 ) ) ( not ( = ?auto_388707 ?auto_388712 ) ) ( not ( = ?auto_388707 ?auto_388713 ) ) ( not ( = ?auto_388707 ?auto_388714 ) ) ( not ( = ?auto_388707 ?auto_388715 ) ) ( not ( = ?auto_388707 ?auto_388716 ) ) ( not ( = ?auto_388707 ?auto_388717 ) ) ( not ( = ?auto_388708 ?auto_388709 ) ) ( not ( = ?auto_388708 ?auto_388710 ) ) ( not ( = ?auto_388708 ?auto_388711 ) ) ( not ( = ?auto_388708 ?auto_388712 ) ) ( not ( = ?auto_388708 ?auto_388713 ) ) ( not ( = ?auto_388708 ?auto_388714 ) ) ( not ( = ?auto_388708 ?auto_388715 ) ) ( not ( = ?auto_388708 ?auto_388716 ) ) ( not ( = ?auto_388708 ?auto_388717 ) ) ( not ( = ?auto_388709 ?auto_388710 ) ) ( not ( = ?auto_388709 ?auto_388711 ) ) ( not ( = ?auto_388709 ?auto_388712 ) ) ( not ( = ?auto_388709 ?auto_388713 ) ) ( not ( = ?auto_388709 ?auto_388714 ) ) ( not ( = ?auto_388709 ?auto_388715 ) ) ( not ( = ?auto_388709 ?auto_388716 ) ) ( not ( = ?auto_388709 ?auto_388717 ) ) ( not ( = ?auto_388710 ?auto_388711 ) ) ( not ( = ?auto_388710 ?auto_388712 ) ) ( not ( = ?auto_388710 ?auto_388713 ) ) ( not ( = ?auto_388710 ?auto_388714 ) ) ( not ( = ?auto_388710 ?auto_388715 ) ) ( not ( = ?auto_388710 ?auto_388716 ) ) ( not ( = ?auto_388710 ?auto_388717 ) ) ( not ( = ?auto_388711 ?auto_388712 ) ) ( not ( = ?auto_388711 ?auto_388713 ) ) ( not ( = ?auto_388711 ?auto_388714 ) ) ( not ( = ?auto_388711 ?auto_388715 ) ) ( not ( = ?auto_388711 ?auto_388716 ) ) ( not ( = ?auto_388711 ?auto_388717 ) ) ( not ( = ?auto_388712 ?auto_388713 ) ) ( not ( = ?auto_388712 ?auto_388714 ) ) ( not ( = ?auto_388712 ?auto_388715 ) ) ( not ( = ?auto_388712 ?auto_388716 ) ) ( not ( = ?auto_388712 ?auto_388717 ) ) ( not ( = ?auto_388713 ?auto_388714 ) ) ( not ( = ?auto_388713 ?auto_388715 ) ) ( not ( = ?auto_388713 ?auto_388716 ) ) ( not ( = ?auto_388713 ?auto_388717 ) ) ( not ( = ?auto_388714 ?auto_388715 ) ) ( not ( = ?auto_388714 ?auto_388716 ) ) ( not ( = ?auto_388714 ?auto_388717 ) ) ( not ( = ?auto_388715 ?auto_388716 ) ) ( not ( = ?auto_388715 ?auto_388717 ) ) ( not ( = ?auto_388716 ?auto_388717 ) ) ( ON ?auto_388715 ?auto_388716 ) ( ON ?auto_388714 ?auto_388715 ) ( ON ?auto_388713 ?auto_388714 ) ( ON ?auto_388712 ?auto_388713 ) ( ON ?auto_388711 ?auto_388712 ) ( ON ?auto_388710 ?auto_388711 ) ( CLEAR ?auto_388708 ) ( ON ?auto_388709 ?auto_388710 ) ( CLEAR ?auto_388709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_388706 ?auto_388707 ?auto_388708 ?auto_388709 )
      ( MAKE-11PILE ?auto_388706 ?auto_388707 ?auto_388708 ?auto_388709 ?auto_388710 ?auto_388711 ?auto_388712 ?auto_388713 ?auto_388714 ?auto_388715 ?auto_388716 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388729 - BLOCK
      ?auto_388730 - BLOCK
      ?auto_388731 - BLOCK
      ?auto_388732 - BLOCK
      ?auto_388733 - BLOCK
      ?auto_388734 - BLOCK
      ?auto_388735 - BLOCK
      ?auto_388736 - BLOCK
      ?auto_388737 - BLOCK
      ?auto_388738 - BLOCK
      ?auto_388739 - BLOCK
    )
    :vars
    (
      ?auto_388740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388739 ?auto_388740 ) ( ON-TABLE ?auto_388729 ) ( ON ?auto_388730 ?auto_388729 ) ( not ( = ?auto_388729 ?auto_388730 ) ) ( not ( = ?auto_388729 ?auto_388731 ) ) ( not ( = ?auto_388729 ?auto_388732 ) ) ( not ( = ?auto_388729 ?auto_388733 ) ) ( not ( = ?auto_388729 ?auto_388734 ) ) ( not ( = ?auto_388729 ?auto_388735 ) ) ( not ( = ?auto_388729 ?auto_388736 ) ) ( not ( = ?auto_388729 ?auto_388737 ) ) ( not ( = ?auto_388729 ?auto_388738 ) ) ( not ( = ?auto_388729 ?auto_388739 ) ) ( not ( = ?auto_388729 ?auto_388740 ) ) ( not ( = ?auto_388730 ?auto_388731 ) ) ( not ( = ?auto_388730 ?auto_388732 ) ) ( not ( = ?auto_388730 ?auto_388733 ) ) ( not ( = ?auto_388730 ?auto_388734 ) ) ( not ( = ?auto_388730 ?auto_388735 ) ) ( not ( = ?auto_388730 ?auto_388736 ) ) ( not ( = ?auto_388730 ?auto_388737 ) ) ( not ( = ?auto_388730 ?auto_388738 ) ) ( not ( = ?auto_388730 ?auto_388739 ) ) ( not ( = ?auto_388730 ?auto_388740 ) ) ( not ( = ?auto_388731 ?auto_388732 ) ) ( not ( = ?auto_388731 ?auto_388733 ) ) ( not ( = ?auto_388731 ?auto_388734 ) ) ( not ( = ?auto_388731 ?auto_388735 ) ) ( not ( = ?auto_388731 ?auto_388736 ) ) ( not ( = ?auto_388731 ?auto_388737 ) ) ( not ( = ?auto_388731 ?auto_388738 ) ) ( not ( = ?auto_388731 ?auto_388739 ) ) ( not ( = ?auto_388731 ?auto_388740 ) ) ( not ( = ?auto_388732 ?auto_388733 ) ) ( not ( = ?auto_388732 ?auto_388734 ) ) ( not ( = ?auto_388732 ?auto_388735 ) ) ( not ( = ?auto_388732 ?auto_388736 ) ) ( not ( = ?auto_388732 ?auto_388737 ) ) ( not ( = ?auto_388732 ?auto_388738 ) ) ( not ( = ?auto_388732 ?auto_388739 ) ) ( not ( = ?auto_388732 ?auto_388740 ) ) ( not ( = ?auto_388733 ?auto_388734 ) ) ( not ( = ?auto_388733 ?auto_388735 ) ) ( not ( = ?auto_388733 ?auto_388736 ) ) ( not ( = ?auto_388733 ?auto_388737 ) ) ( not ( = ?auto_388733 ?auto_388738 ) ) ( not ( = ?auto_388733 ?auto_388739 ) ) ( not ( = ?auto_388733 ?auto_388740 ) ) ( not ( = ?auto_388734 ?auto_388735 ) ) ( not ( = ?auto_388734 ?auto_388736 ) ) ( not ( = ?auto_388734 ?auto_388737 ) ) ( not ( = ?auto_388734 ?auto_388738 ) ) ( not ( = ?auto_388734 ?auto_388739 ) ) ( not ( = ?auto_388734 ?auto_388740 ) ) ( not ( = ?auto_388735 ?auto_388736 ) ) ( not ( = ?auto_388735 ?auto_388737 ) ) ( not ( = ?auto_388735 ?auto_388738 ) ) ( not ( = ?auto_388735 ?auto_388739 ) ) ( not ( = ?auto_388735 ?auto_388740 ) ) ( not ( = ?auto_388736 ?auto_388737 ) ) ( not ( = ?auto_388736 ?auto_388738 ) ) ( not ( = ?auto_388736 ?auto_388739 ) ) ( not ( = ?auto_388736 ?auto_388740 ) ) ( not ( = ?auto_388737 ?auto_388738 ) ) ( not ( = ?auto_388737 ?auto_388739 ) ) ( not ( = ?auto_388737 ?auto_388740 ) ) ( not ( = ?auto_388738 ?auto_388739 ) ) ( not ( = ?auto_388738 ?auto_388740 ) ) ( not ( = ?auto_388739 ?auto_388740 ) ) ( ON ?auto_388738 ?auto_388739 ) ( ON ?auto_388737 ?auto_388738 ) ( ON ?auto_388736 ?auto_388737 ) ( ON ?auto_388735 ?auto_388736 ) ( ON ?auto_388734 ?auto_388735 ) ( ON ?auto_388733 ?auto_388734 ) ( ON ?auto_388732 ?auto_388733 ) ( CLEAR ?auto_388730 ) ( ON ?auto_388731 ?auto_388732 ) ( CLEAR ?auto_388731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388729 ?auto_388730 ?auto_388731 )
      ( MAKE-11PILE ?auto_388729 ?auto_388730 ?auto_388731 ?auto_388732 ?auto_388733 ?auto_388734 ?auto_388735 ?auto_388736 ?auto_388737 ?auto_388738 ?auto_388739 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388752 - BLOCK
      ?auto_388753 - BLOCK
      ?auto_388754 - BLOCK
      ?auto_388755 - BLOCK
      ?auto_388756 - BLOCK
      ?auto_388757 - BLOCK
      ?auto_388758 - BLOCK
      ?auto_388759 - BLOCK
      ?auto_388760 - BLOCK
      ?auto_388761 - BLOCK
      ?auto_388762 - BLOCK
    )
    :vars
    (
      ?auto_388763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388762 ?auto_388763 ) ( ON-TABLE ?auto_388752 ) ( ON ?auto_388753 ?auto_388752 ) ( not ( = ?auto_388752 ?auto_388753 ) ) ( not ( = ?auto_388752 ?auto_388754 ) ) ( not ( = ?auto_388752 ?auto_388755 ) ) ( not ( = ?auto_388752 ?auto_388756 ) ) ( not ( = ?auto_388752 ?auto_388757 ) ) ( not ( = ?auto_388752 ?auto_388758 ) ) ( not ( = ?auto_388752 ?auto_388759 ) ) ( not ( = ?auto_388752 ?auto_388760 ) ) ( not ( = ?auto_388752 ?auto_388761 ) ) ( not ( = ?auto_388752 ?auto_388762 ) ) ( not ( = ?auto_388752 ?auto_388763 ) ) ( not ( = ?auto_388753 ?auto_388754 ) ) ( not ( = ?auto_388753 ?auto_388755 ) ) ( not ( = ?auto_388753 ?auto_388756 ) ) ( not ( = ?auto_388753 ?auto_388757 ) ) ( not ( = ?auto_388753 ?auto_388758 ) ) ( not ( = ?auto_388753 ?auto_388759 ) ) ( not ( = ?auto_388753 ?auto_388760 ) ) ( not ( = ?auto_388753 ?auto_388761 ) ) ( not ( = ?auto_388753 ?auto_388762 ) ) ( not ( = ?auto_388753 ?auto_388763 ) ) ( not ( = ?auto_388754 ?auto_388755 ) ) ( not ( = ?auto_388754 ?auto_388756 ) ) ( not ( = ?auto_388754 ?auto_388757 ) ) ( not ( = ?auto_388754 ?auto_388758 ) ) ( not ( = ?auto_388754 ?auto_388759 ) ) ( not ( = ?auto_388754 ?auto_388760 ) ) ( not ( = ?auto_388754 ?auto_388761 ) ) ( not ( = ?auto_388754 ?auto_388762 ) ) ( not ( = ?auto_388754 ?auto_388763 ) ) ( not ( = ?auto_388755 ?auto_388756 ) ) ( not ( = ?auto_388755 ?auto_388757 ) ) ( not ( = ?auto_388755 ?auto_388758 ) ) ( not ( = ?auto_388755 ?auto_388759 ) ) ( not ( = ?auto_388755 ?auto_388760 ) ) ( not ( = ?auto_388755 ?auto_388761 ) ) ( not ( = ?auto_388755 ?auto_388762 ) ) ( not ( = ?auto_388755 ?auto_388763 ) ) ( not ( = ?auto_388756 ?auto_388757 ) ) ( not ( = ?auto_388756 ?auto_388758 ) ) ( not ( = ?auto_388756 ?auto_388759 ) ) ( not ( = ?auto_388756 ?auto_388760 ) ) ( not ( = ?auto_388756 ?auto_388761 ) ) ( not ( = ?auto_388756 ?auto_388762 ) ) ( not ( = ?auto_388756 ?auto_388763 ) ) ( not ( = ?auto_388757 ?auto_388758 ) ) ( not ( = ?auto_388757 ?auto_388759 ) ) ( not ( = ?auto_388757 ?auto_388760 ) ) ( not ( = ?auto_388757 ?auto_388761 ) ) ( not ( = ?auto_388757 ?auto_388762 ) ) ( not ( = ?auto_388757 ?auto_388763 ) ) ( not ( = ?auto_388758 ?auto_388759 ) ) ( not ( = ?auto_388758 ?auto_388760 ) ) ( not ( = ?auto_388758 ?auto_388761 ) ) ( not ( = ?auto_388758 ?auto_388762 ) ) ( not ( = ?auto_388758 ?auto_388763 ) ) ( not ( = ?auto_388759 ?auto_388760 ) ) ( not ( = ?auto_388759 ?auto_388761 ) ) ( not ( = ?auto_388759 ?auto_388762 ) ) ( not ( = ?auto_388759 ?auto_388763 ) ) ( not ( = ?auto_388760 ?auto_388761 ) ) ( not ( = ?auto_388760 ?auto_388762 ) ) ( not ( = ?auto_388760 ?auto_388763 ) ) ( not ( = ?auto_388761 ?auto_388762 ) ) ( not ( = ?auto_388761 ?auto_388763 ) ) ( not ( = ?auto_388762 ?auto_388763 ) ) ( ON ?auto_388761 ?auto_388762 ) ( ON ?auto_388760 ?auto_388761 ) ( ON ?auto_388759 ?auto_388760 ) ( ON ?auto_388758 ?auto_388759 ) ( ON ?auto_388757 ?auto_388758 ) ( ON ?auto_388756 ?auto_388757 ) ( ON ?auto_388755 ?auto_388756 ) ( CLEAR ?auto_388753 ) ( ON ?auto_388754 ?auto_388755 ) ( CLEAR ?auto_388754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_388752 ?auto_388753 ?auto_388754 )
      ( MAKE-11PILE ?auto_388752 ?auto_388753 ?auto_388754 ?auto_388755 ?auto_388756 ?auto_388757 ?auto_388758 ?auto_388759 ?auto_388760 ?auto_388761 ?auto_388762 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388775 - BLOCK
      ?auto_388776 - BLOCK
      ?auto_388777 - BLOCK
      ?auto_388778 - BLOCK
      ?auto_388779 - BLOCK
      ?auto_388780 - BLOCK
      ?auto_388781 - BLOCK
      ?auto_388782 - BLOCK
      ?auto_388783 - BLOCK
      ?auto_388784 - BLOCK
      ?auto_388785 - BLOCK
    )
    :vars
    (
      ?auto_388786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388785 ?auto_388786 ) ( ON-TABLE ?auto_388775 ) ( not ( = ?auto_388775 ?auto_388776 ) ) ( not ( = ?auto_388775 ?auto_388777 ) ) ( not ( = ?auto_388775 ?auto_388778 ) ) ( not ( = ?auto_388775 ?auto_388779 ) ) ( not ( = ?auto_388775 ?auto_388780 ) ) ( not ( = ?auto_388775 ?auto_388781 ) ) ( not ( = ?auto_388775 ?auto_388782 ) ) ( not ( = ?auto_388775 ?auto_388783 ) ) ( not ( = ?auto_388775 ?auto_388784 ) ) ( not ( = ?auto_388775 ?auto_388785 ) ) ( not ( = ?auto_388775 ?auto_388786 ) ) ( not ( = ?auto_388776 ?auto_388777 ) ) ( not ( = ?auto_388776 ?auto_388778 ) ) ( not ( = ?auto_388776 ?auto_388779 ) ) ( not ( = ?auto_388776 ?auto_388780 ) ) ( not ( = ?auto_388776 ?auto_388781 ) ) ( not ( = ?auto_388776 ?auto_388782 ) ) ( not ( = ?auto_388776 ?auto_388783 ) ) ( not ( = ?auto_388776 ?auto_388784 ) ) ( not ( = ?auto_388776 ?auto_388785 ) ) ( not ( = ?auto_388776 ?auto_388786 ) ) ( not ( = ?auto_388777 ?auto_388778 ) ) ( not ( = ?auto_388777 ?auto_388779 ) ) ( not ( = ?auto_388777 ?auto_388780 ) ) ( not ( = ?auto_388777 ?auto_388781 ) ) ( not ( = ?auto_388777 ?auto_388782 ) ) ( not ( = ?auto_388777 ?auto_388783 ) ) ( not ( = ?auto_388777 ?auto_388784 ) ) ( not ( = ?auto_388777 ?auto_388785 ) ) ( not ( = ?auto_388777 ?auto_388786 ) ) ( not ( = ?auto_388778 ?auto_388779 ) ) ( not ( = ?auto_388778 ?auto_388780 ) ) ( not ( = ?auto_388778 ?auto_388781 ) ) ( not ( = ?auto_388778 ?auto_388782 ) ) ( not ( = ?auto_388778 ?auto_388783 ) ) ( not ( = ?auto_388778 ?auto_388784 ) ) ( not ( = ?auto_388778 ?auto_388785 ) ) ( not ( = ?auto_388778 ?auto_388786 ) ) ( not ( = ?auto_388779 ?auto_388780 ) ) ( not ( = ?auto_388779 ?auto_388781 ) ) ( not ( = ?auto_388779 ?auto_388782 ) ) ( not ( = ?auto_388779 ?auto_388783 ) ) ( not ( = ?auto_388779 ?auto_388784 ) ) ( not ( = ?auto_388779 ?auto_388785 ) ) ( not ( = ?auto_388779 ?auto_388786 ) ) ( not ( = ?auto_388780 ?auto_388781 ) ) ( not ( = ?auto_388780 ?auto_388782 ) ) ( not ( = ?auto_388780 ?auto_388783 ) ) ( not ( = ?auto_388780 ?auto_388784 ) ) ( not ( = ?auto_388780 ?auto_388785 ) ) ( not ( = ?auto_388780 ?auto_388786 ) ) ( not ( = ?auto_388781 ?auto_388782 ) ) ( not ( = ?auto_388781 ?auto_388783 ) ) ( not ( = ?auto_388781 ?auto_388784 ) ) ( not ( = ?auto_388781 ?auto_388785 ) ) ( not ( = ?auto_388781 ?auto_388786 ) ) ( not ( = ?auto_388782 ?auto_388783 ) ) ( not ( = ?auto_388782 ?auto_388784 ) ) ( not ( = ?auto_388782 ?auto_388785 ) ) ( not ( = ?auto_388782 ?auto_388786 ) ) ( not ( = ?auto_388783 ?auto_388784 ) ) ( not ( = ?auto_388783 ?auto_388785 ) ) ( not ( = ?auto_388783 ?auto_388786 ) ) ( not ( = ?auto_388784 ?auto_388785 ) ) ( not ( = ?auto_388784 ?auto_388786 ) ) ( not ( = ?auto_388785 ?auto_388786 ) ) ( ON ?auto_388784 ?auto_388785 ) ( ON ?auto_388783 ?auto_388784 ) ( ON ?auto_388782 ?auto_388783 ) ( ON ?auto_388781 ?auto_388782 ) ( ON ?auto_388780 ?auto_388781 ) ( ON ?auto_388779 ?auto_388780 ) ( ON ?auto_388778 ?auto_388779 ) ( ON ?auto_388777 ?auto_388778 ) ( CLEAR ?auto_388775 ) ( ON ?auto_388776 ?auto_388777 ) ( CLEAR ?auto_388776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388775 ?auto_388776 )
      ( MAKE-11PILE ?auto_388775 ?auto_388776 ?auto_388777 ?auto_388778 ?auto_388779 ?auto_388780 ?auto_388781 ?auto_388782 ?auto_388783 ?auto_388784 ?auto_388785 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388798 - BLOCK
      ?auto_388799 - BLOCK
      ?auto_388800 - BLOCK
      ?auto_388801 - BLOCK
      ?auto_388802 - BLOCK
      ?auto_388803 - BLOCK
      ?auto_388804 - BLOCK
      ?auto_388805 - BLOCK
      ?auto_388806 - BLOCK
      ?auto_388807 - BLOCK
      ?auto_388808 - BLOCK
    )
    :vars
    (
      ?auto_388809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388808 ?auto_388809 ) ( ON-TABLE ?auto_388798 ) ( not ( = ?auto_388798 ?auto_388799 ) ) ( not ( = ?auto_388798 ?auto_388800 ) ) ( not ( = ?auto_388798 ?auto_388801 ) ) ( not ( = ?auto_388798 ?auto_388802 ) ) ( not ( = ?auto_388798 ?auto_388803 ) ) ( not ( = ?auto_388798 ?auto_388804 ) ) ( not ( = ?auto_388798 ?auto_388805 ) ) ( not ( = ?auto_388798 ?auto_388806 ) ) ( not ( = ?auto_388798 ?auto_388807 ) ) ( not ( = ?auto_388798 ?auto_388808 ) ) ( not ( = ?auto_388798 ?auto_388809 ) ) ( not ( = ?auto_388799 ?auto_388800 ) ) ( not ( = ?auto_388799 ?auto_388801 ) ) ( not ( = ?auto_388799 ?auto_388802 ) ) ( not ( = ?auto_388799 ?auto_388803 ) ) ( not ( = ?auto_388799 ?auto_388804 ) ) ( not ( = ?auto_388799 ?auto_388805 ) ) ( not ( = ?auto_388799 ?auto_388806 ) ) ( not ( = ?auto_388799 ?auto_388807 ) ) ( not ( = ?auto_388799 ?auto_388808 ) ) ( not ( = ?auto_388799 ?auto_388809 ) ) ( not ( = ?auto_388800 ?auto_388801 ) ) ( not ( = ?auto_388800 ?auto_388802 ) ) ( not ( = ?auto_388800 ?auto_388803 ) ) ( not ( = ?auto_388800 ?auto_388804 ) ) ( not ( = ?auto_388800 ?auto_388805 ) ) ( not ( = ?auto_388800 ?auto_388806 ) ) ( not ( = ?auto_388800 ?auto_388807 ) ) ( not ( = ?auto_388800 ?auto_388808 ) ) ( not ( = ?auto_388800 ?auto_388809 ) ) ( not ( = ?auto_388801 ?auto_388802 ) ) ( not ( = ?auto_388801 ?auto_388803 ) ) ( not ( = ?auto_388801 ?auto_388804 ) ) ( not ( = ?auto_388801 ?auto_388805 ) ) ( not ( = ?auto_388801 ?auto_388806 ) ) ( not ( = ?auto_388801 ?auto_388807 ) ) ( not ( = ?auto_388801 ?auto_388808 ) ) ( not ( = ?auto_388801 ?auto_388809 ) ) ( not ( = ?auto_388802 ?auto_388803 ) ) ( not ( = ?auto_388802 ?auto_388804 ) ) ( not ( = ?auto_388802 ?auto_388805 ) ) ( not ( = ?auto_388802 ?auto_388806 ) ) ( not ( = ?auto_388802 ?auto_388807 ) ) ( not ( = ?auto_388802 ?auto_388808 ) ) ( not ( = ?auto_388802 ?auto_388809 ) ) ( not ( = ?auto_388803 ?auto_388804 ) ) ( not ( = ?auto_388803 ?auto_388805 ) ) ( not ( = ?auto_388803 ?auto_388806 ) ) ( not ( = ?auto_388803 ?auto_388807 ) ) ( not ( = ?auto_388803 ?auto_388808 ) ) ( not ( = ?auto_388803 ?auto_388809 ) ) ( not ( = ?auto_388804 ?auto_388805 ) ) ( not ( = ?auto_388804 ?auto_388806 ) ) ( not ( = ?auto_388804 ?auto_388807 ) ) ( not ( = ?auto_388804 ?auto_388808 ) ) ( not ( = ?auto_388804 ?auto_388809 ) ) ( not ( = ?auto_388805 ?auto_388806 ) ) ( not ( = ?auto_388805 ?auto_388807 ) ) ( not ( = ?auto_388805 ?auto_388808 ) ) ( not ( = ?auto_388805 ?auto_388809 ) ) ( not ( = ?auto_388806 ?auto_388807 ) ) ( not ( = ?auto_388806 ?auto_388808 ) ) ( not ( = ?auto_388806 ?auto_388809 ) ) ( not ( = ?auto_388807 ?auto_388808 ) ) ( not ( = ?auto_388807 ?auto_388809 ) ) ( not ( = ?auto_388808 ?auto_388809 ) ) ( ON ?auto_388807 ?auto_388808 ) ( ON ?auto_388806 ?auto_388807 ) ( ON ?auto_388805 ?auto_388806 ) ( ON ?auto_388804 ?auto_388805 ) ( ON ?auto_388803 ?auto_388804 ) ( ON ?auto_388802 ?auto_388803 ) ( ON ?auto_388801 ?auto_388802 ) ( ON ?auto_388800 ?auto_388801 ) ( CLEAR ?auto_388798 ) ( ON ?auto_388799 ?auto_388800 ) ( CLEAR ?auto_388799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_388798 ?auto_388799 )
      ( MAKE-11PILE ?auto_388798 ?auto_388799 ?auto_388800 ?auto_388801 ?auto_388802 ?auto_388803 ?auto_388804 ?auto_388805 ?auto_388806 ?auto_388807 ?auto_388808 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388821 - BLOCK
      ?auto_388822 - BLOCK
      ?auto_388823 - BLOCK
      ?auto_388824 - BLOCK
      ?auto_388825 - BLOCK
      ?auto_388826 - BLOCK
      ?auto_388827 - BLOCK
      ?auto_388828 - BLOCK
      ?auto_388829 - BLOCK
      ?auto_388830 - BLOCK
      ?auto_388831 - BLOCK
    )
    :vars
    (
      ?auto_388832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388831 ?auto_388832 ) ( not ( = ?auto_388821 ?auto_388822 ) ) ( not ( = ?auto_388821 ?auto_388823 ) ) ( not ( = ?auto_388821 ?auto_388824 ) ) ( not ( = ?auto_388821 ?auto_388825 ) ) ( not ( = ?auto_388821 ?auto_388826 ) ) ( not ( = ?auto_388821 ?auto_388827 ) ) ( not ( = ?auto_388821 ?auto_388828 ) ) ( not ( = ?auto_388821 ?auto_388829 ) ) ( not ( = ?auto_388821 ?auto_388830 ) ) ( not ( = ?auto_388821 ?auto_388831 ) ) ( not ( = ?auto_388821 ?auto_388832 ) ) ( not ( = ?auto_388822 ?auto_388823 ) ) ( not ( = ?auto_388822 ?auto_388824 ) ) ( not ( = ?auto_388822 ?auto_388825 ) ) ( not ( = ?auto_388822 ?auto_388826 ) ) ( not ( = ?auto_388822 ?auto_388827 ) ) ( not ( = ?auto_388822 ?auto_388828 ) ) ( not ( = ?auto_388822 ?auto_388829 ) ) ( not ( = ?auto_388822 ?auto_388830 ) ) ( not ( = ?auto_388822 ?auto_388831 ) ) ( not ( = ?auto_388822 ?auto_388832 ) ) ( not ( = ?auto_388823 ?auto_388824 ) ) ( not ( = ?auto_388823 ?auto_388825 ) ) ( not ( = ?auto_388823 ?auto_388826 ) ) ( not ( = ?auto_388823 ?auto_388827 ) ) ( not ( = ?auto_388823 ?auto_388828 ) ) ( not ( = ?auto_388823 ?auto_388829 ) ) ( not ( = ?auto_388823 ?auto_388830 ) ) ( not ( = ?auto_388823 ?auto_388831 ) ) ( not ( = ?auto_388823 ?auto_388832 ) ) ( not ( = ?auto_388824 ?auto_388825 ) ) ( not ( = ?auto_388824 ?auto_388826 ) ) ( not ( = ?auto_388824 ?auto_388827 ) ) ( not ( = ?auto_388824 ?auto_388828 ) ) ( not ( = ?auto_388824 ?auto_388829 ) ) ( not ( = ?auto_388824 ?auto_388830 ) ) ( not ( = ?auto_388824 ?auto_388831 ) ) ( not ( = ?auto_388824 ?auto_388832 ) ) ( not ( = ?auto_388825 ?auto_388826 ) ) ( not ( = ?auto_388825 ?auto_388827 ) ) ( not ( = ?auto_388825 ?auto_388828 ) ) ( not ( = ?auto_388825 ?auto_388829 ) ) ( not ( = ?auto_388825 ?auto_388830 ) ) ( not ( = ?auto_388825 ?auto_388831 ) ) ( not ( = ?auto_388825 ?auto_388832 ) ) ( not ( = ?auto_388826 ?auto_388827 ) ) ( not ( = ?auto_388826 ?auto_388828 ) ) ( not ( = ?auto_388826 ?auto_388829 ) ) ( not ( = ?auto_388826 ?auto_388830 ) ) ( not ( = ?auto_388826 ?auto_388831 ) ) ( not ( = ?auto_388826 ?auto_388832 ) ) ( not ( = ?auto_388827 ?auto_388828 ) ) ( not ( = ?auto_388827 ?auto_388829 ) ) ( not ( = ?auto_388827 ?auto_388830 ) ) ( not ( = ?auto_388827 ?auto_388831 ) ) ( not ( = ?auto_388827 ?auto_388832 ) ) ( not ( = ?auto_388828 ?auto_388829 ) ) ( not ( = ?auto_388828 ?auto_388830 ) ) ( not ( = ?auto_388828 ?auto_388831 ) ) ( not ( = ?auto_388828 ?auto_388832 ) ) ( not ( = ?auto_388829 ?auto_388830 ) ) ( not ( = ?auto_388829 ?auto_388831 ) ) ( not ( = ?auto_388829 ?auto_388832 ) ) ( not ( = ?auto_388830 ?auto_388831 ) ) ( not ( = ?auto_388830 ?auto_388832 ) ) ( not ( = ?auto_388831 ?auto_388832 ) ) ( ON ?auto_388830 ?auto_388831 ) ( ON ?auto_388829 ?auto_388830 ) ( ON ?auto_388828 ?auto_388829 ) ( ON ?auto_388827 ?auto_388828 ) ( ON ?auto_388826 ?auto_388827 ) ( ON ?auto_388825 ?auto_388826 ) ( ON ?auto_388824 ?auto_388825 ) ( ON ?auto_388823 ?auto_388824 ) ( ON ?auto_388822 ?auto_388823 ) ( ON ?auto_388821 ?auto_388822 ) ( CLEAR ?auto_388821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388821 )
      ( MAKE-11PILE ?auto_388821 ?auto_388822 ?auto_388823 ?auto_388824 ?auto_388825 ?auto_388826 ?auto_388827 ?auto_388828 ?auto_388829 ?auto_388830 ?auto_388831 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_388844 - BLOCK
      ?auto_388845 - BLOCK
      ?auto_388846 - BLOCK
      ?auto_388847 - BLOCK
      ?auto_388848 - BLOCK
      ?auto_388849 - BLOCK
      ?auto_388850 - BLOCK
      ?auto_388851 - BLOCK
      ?auto_388852 - BLOCK
      ?auto_388853 - BLOCK
      ?auto_388854 - BLOCK
    )
    :vars
    (
      ?auto_388855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388854 ?auto_388855 ) ( not ( = ?auto_388844 ?auto_388845 ) ) ( not ( = ?auto_388844 ?auto_388846 ) ) ( not ( = ?auto_388844 ?auto_388847 ) ) ( not ( = ?auto_388844 ?auto_388848 ) ) ( not ( = ?auto_388844 ?auto_388849 ) ) ( not ( = ?auto_388844 ?auto_388850 ) ) ( not ( = ?auto_388844 ?auto_388851 ) ) ( not ( = ?auto_388844 ?auto_388852 ) ) ( not ( = ?auto_388844 ?auto_388853 ) ) ( not ( = ?auto_388844 ?auto_388854 ) ) ( not ( = ?auto_388844 ?auto_388855 ) ) ( not ( = ?auto_388845 ?auto_388846 ) ) ( not ( = ?auto_388845 ?auto_388847 ) ) ( not ( = ?auto_388845 ?auto_388848 ) ) ( not ( = ?auto_388845 ?auto_388849 ) ) ( not ( = ?auto_388845 ?auto_388850 ) ) ( not ( = ?auto_388845 ?auto_388851 ) ) ( not ( = ?auto_388845 ?auto_388852 ) ) ( not ( = ?auto_388845 ?auto_388853 ) ) ( not ( = ?auto_388845 ?auto_388854 ) ) ( not ( = ?auto_388845 ?auto_388855 ) ) ( not ( = ?auto_388846 ?auto_388847 ) ) ( not ( = ?auto_388846 ?auto_388848 ) ) ( not ( = ?auto_388846 ?auto_388849 ) ) ( not ( = ?auto_388846 ?auto_388850 ) ) ( not ( = ?auto_388846 ?auto_388851 ) ) ( not ( = ?auto_388846 ?auto_388852 ) ) ( not ( = ?auto_388846 ?auto_388853 ) ) ( not ( = ?auto_388846 ?auto_388854 ) ) ( not ( = ?auto_388846 ?auto_388855 ) ) ( not ( = ?auto_388847 ?auto_388848 ) ) ( not ( = ?auto_388847 ?auto_388849 ) ) ( not ( = ?auto_388847 ?auto_388850 ) ) ( not ( = ?auto_388847 ?auto_388851 ) ) ( not ( = ?auto_388847 ?auto_388852 ) ) ( not ( = ?auto_388847 ?auto_388853 ) ) ( not ( = ?auto_388847 ?auto_388854 ) ) ( not ( = ?auto_388847 ?auto_388855 ) ) ( not ( = ?auto_388848 ?auto_388849 ) ) ( not ( = ?auto_388848 ?auto_388850 ) ) ( not ( = ?auto_388848 ?auto_388851 ) ) ( not ( = ?auto_388848 ?auto_388852 ) ) ( not ( = ?auto_388848 ?auto_388853 ) ) ( not ( = ?auto_388848 ?auto_388854 ) ) ( not ( = ?auto_388848 ?auto_388855 ) ) ( not ( = ?auto_388849 ?auto_388850 ) ) ( not ( = ?auto_388849 ?auto_388851 ) ) ( not ( = ?auto_388849 ?auto_388852 ) ) ( not ( = ?auto_388849 ?auto_388853 ) ) ( not ( = ?auto_388849 ?auto_388854 ) ) ( not ( = ?auto_388849 ?auto_388855 ) ) ( not ( = ?auto_388850 ?auto_388851 ) ) ( not ( = ?auto_388850 ?auto_388852 ) ) ( not ( = ?auto_388850 ?auto_388853 ) ) ( not ( = ?auto_388850 ?auto_388854 ) ) ( not ( = ?auto_388850 ?auto_388855 ) ) ( not ( = ?auto_388851 ?auto_388852 ) ) ( not ( = ?auto_388851 ?auto_388853 ) ) ( not ( = ?auto_388851 ?auto_388854 ) ) ( not ( = ?auto_388851 ?auto_388855 ) ) ( not ( = ?auto_388852 ?auto_388853 ) ) ( not ( = ?auto_388852 ?auto_388854 ) ) ( not ( = ?auto_388852 ?auto_388855 ) ) ( not ( = ?auto_388853 ?auto_388854 ) ) ( not ( = ?auto_388853 ?auto_388855 ) ) ( not ( = ?auto_388854 ?auto_388855 ) ) ( ON ?auto_388853 ?auto_388854 ) ( ON ?auto_388852 ?auto_388853 ) ( ON ?auto_388851 ?auto_388852 ) ( ON ?auto_388850 ?auto_388851 ) ( ON ?auto_388849 ?auto_388850 ) ( ON ?auto_388848 ?auto_388849 ) ( ON ?auto_388847 ?auto_388848 ) ( ON ?auto_388846 ?auto_388847 ) ( ON ?auto_388845 ?auto_388846 ) ( ON ?auto_388844 ?auto_388845 ) ( CLEAR ?auto_388844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_388844 )
      ( MAKE-11PILE ?auto_388844 ?auto_388845 ?auto_388846 ?auto_388847 ?auto_388848 ?auto_388849 ?auto_388850 ?auto_388851 ?auto_388852 ?auto_388853 ?auto_388854 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388868 - BLOCK
      ?auto_388869 - BLOCK
      ?auto_388870 - BLOCK
      ?auto_388871 - BLOCK
      ?auto_388872 - BLOCK
      ?auto_388873 - BLOCK
      ?auto_388874 - BLOCK
      ?auto_388875 - BLOCK
      ?auto_388876 - BLOCK
      ?auto_388877 - BLOCK
      ?auto_388878 - BLOCK
      ?auto_388879 - BLOCK
    )
    :vars
    (
      ?auto_388880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388878 ) ( ON ?auto_388879 ?auto_388880 ) ( CLEAR ?auto_388879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388868 ) ( ON ?auto_388869 ?auto_388868 ) ( ON ?auto_388870 ?auto_388869 ) ( ON ?auto_388871 ?auto_388870 ) ( ON ?auto_388872 ?auto_388871 ) ( ON ?auto_388873 ?auto_388872 ) ( ON ?auto_388874 ?auto_388873 ) ( ON ?auto_388875 ?auto_388874 ) ( ON ?auto_388876 ?auto_388875 ) ( ON ?auto_388877 ?auto_388876 ) ( ON ?auto_388878 ?auto_388877 ) ( not ( = ?auto_388868 ?auto_388869 ) ) ( not ( = ?auto_388868 ?auto_388870 ) ) ( not ( = ?auto_388868 ?auto_388871 ) ) ( not ( = ?auto_388868 ?auto_388872 ) ) ( not ( = ?auto_388868 ?auto_388873 ) ) ( not ( = ?auto_388868 ?auto_388874 ) ) ( not ( = ?auto_388868 ?auto_388875 ) ) ( not ( = ?auto_388868 ?auto_388876 ) ) ( not ( = ?auto_388868 ?auto_388877 ) ) ( not ( = ?auto_388868 ?auto_388878 ) ) ( not ( = ?auto_388868 ?auto_388879 ) ) ( not ( = ?auto_388868 ?auto_388880 ) ) ( not ( = ?auto_388869 ?auto_388870 ) ) ( not ( = ?auto_388869 ?auto_388871 ) ) ( not ( = ?auto_388869 ?auto_388872 ) ) ( not ( = ?auto_388869 ?auto_388873 ) ) ( not ( = ?auto_388869 ?auto_388874 ) ) ( not ( = ?auto_388869 ?auto_388875 ) ) ( not ( = ?auto_388869 ?auto_388876 ) ) ( not ( = ?auto_388869 ?auto_388877 ) ) ( not ( = ?auto_388869 ?auto_388878 ) ) ( not ( = ?auto_388869 ?auto_388879 ) ) ( not ( = ?auto_388869 ?auto_388880 ) ) ( not ( = ?auto_388870 ?auto_388871 ) ) ( not ( = ?auto_388870 ?auto_388872 ) ) ( not ( = ?auto_388870 ?auto_388873 ) ) ( not ( = ?auto_388870 ?auto_388874 ) ) ( not ( = ?auto_388870 ?auto_388875 ) ) ( not ( = ?auto_388870 ?auto_388876 ) ) ( not ( = ?auto_388870 ?auto_388877 ) ) ( not ( = ?auto_388870 ?auto_388878 ) ) ( not ( = ?auto_388870 ?auto_388879 ) ) ( not ( = ?auto_388870 ?auto_388880 ) ) ( not ( = ?auto_388871 ?auto_388872 ) ) ( not ( = ?auto_388871 ?auto_388873 ) ) ( not ( = ?auto_388871 ?auto_388874 ) ) ( not ( = ?auto_388871 ?auto_388875 ) ) ( not ( = ?auto_388871 ?auto_388876 ) ) ( not ( = ?auto_388871 ?auto_388877 ) ) ( not ( = ?auto_388871 ?auto_388878 ) ) ( not ( = ?auto_388871 ?auto_388879 ) ) ( not ( = ?auto_388871 ?auto_388880 ) ) ( not ( = ?auto_388872 ?auto_388873 ) ) ( not ( = ?auto_388872 ?auto_388874 ) ) ( not ( = ?auto_388872 ?auto_388875 ) ) ( not ( = ?auto_388872 ?auto_388876 ) ) ( not ( = ?auto_388872 ?auto_388877 ) ) ( not ( = ?auto_388872 ?auto_388878 ) ) ( not ( = ?auto_388872 ?auto_388879 ) ) ( not ( = ?auto_388872 ?auto_388880 ) ) ( not ( = ?auto_388873 ?auto_388874 ) ) ( not ( = ?auto_388873 ?auto_388875 ) ) ( not ( = ?auto_388873 ?auto_388876 ) ) ( not ( = ?auto_388873 ?auto_388877 ) ) ( not ( = ?auto_388873 ?auto_388878 ) ) ( not ( = ?auto_388873 ?auto_388879 ) ) ( not ( = ?auto_388873 ?auto_388880 ) ) ( not ( = ?auto_388874 ?auto_388875 ) ) ( not ( = ?auto_388874 ?auto_388876 ) ) ( not ( = ?auto_388874 ?auto_388877 ) ) ( not ( = ?auto_388874 ?auto_388878 ) ) ( not ( = ?auto_388874 ?auto_388879 ) ) ( not ( = ?auto_388874 ?auto_388880 ) ) ( not ( = ?auto_388875 ?auto_388876 ) ) ( not ( = ?auto_388875 ?auto_388877 ) ) ( not ( = ?auto_388875 ?auto_388878 ) ) ( not ( = ?auto_388875 ?auto_388879 ) ) ( not ( = ?auto_388875 ?auto_388880 ) ) ( not ( = ?auto_388876 ?auto_388877 ) ) ( not ( = ?auto_388876 ?auto_388878 ) ) ( not ( = ?auto_388876 ?auto_388879 ) ) ( not ( = ?auto_388876 ?auto_388880 ) ) ( not ( = ?auto_388877 ?auto_388878 ) ) ( not ( = ?auto_388877 ?auto_388879 ) ) ( not ( = ?auto_388877 ?auto_388880 ) ) ( not ( = ?auto_388878 ?auto_388879 ) ) ( not ( = ?auto_388878 ?auto_388880 ) ) ( not ( = ?auto_388879 ?auto_388880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388879 ?auto_388880 )
      ( !STACK ?auto_388879 ?auto_388878 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388893 - BLOCK
      ?auto_388894 - BLOCK
      ?auto_388895 - BLOCK
      ?auto_388896 - BLOCK
      ?auto_388897 - BLOCK
      ?auto_388898 - BLOCK
      ?auto_388899 - BLOCK
      ?auto_388900 - BLOCK
      ?auto_388901 - BLOCK
      ?auto_388902 - BLOCK
      ?auto_388903 - BLOCK
      ?auto_388904 - BLOCK
    )
    :vars
    (
      ?auto_388905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_388903 ) ( ON ?auto_388904 ?auto_388905 ) ( CLEAR ?auto_388904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_388893 ) ( ON ?auto_388894 ?auto_388893 ) ( ON ?auto_388895 ?auto_388894 ) ( ON ?auto_388896 ?auto_388895 ) ( ON ?auto_388897 ?auto_388896 ) ( ON ?auto_388898 ?auto_388897 ) ( ON ?auto_388899 ?auto_388898 ) ( ON ?auto_388900 ?auto_388899 ) ( ON ?auto_388901 ?auto_388900 ) ( ON ?auto_388902 ?auto_388901 ) ( ON ?auto_388903 ?auto_388902 ) ( not ( = ?auto_388893 ?auto_388894 ) ) ( not ( = ?auto_388893 ?auto_388895 ) ) ( not ( = ?auto_388893 ?auto_388896 ) ) ( not ( = ?auto_388893 ?auto_388897 ) ) ( not ( = ?auto_388893 ?auto_388898 ) ) ( not ( = ?auto_388893 ?auto_388899 ) ) ( not ( = ?auto_388893 ?auto_388900 ) ) ( not ( = ?auto_388893 ?auto_388901 ) ) ( not ( = ?auto_388893 ?auto_388902 ) ) ( not ( = ?auto_388893 ?auto_388903 ) ) ( not ( = ?auto_388893 ?auto_388904 ) ) ( not ( = ?auto_388893 ?auto_388905 ) ) ( not ( = ?auto_388894 ?auto_388895 ) ) ( not ( = ?auto_388894 ?auto_388896 ) ) ( not ( = ?auto_388894 ?auto_388897 ) ) ( not ( = ?auto_388894 ?auto_388898 ) ) ( not ( = ?auto_388894 ?auto_388899 ) ) ( not ( = ?auto_388894 ?auto_388900 ) ) ( not ( = ?auto_388894 ?auto_388901 ) ) ( not ( = ?auto_388894 ?auto_388902 ) ) ( not ( = ?auto_388894 ?auto_388903 ) ) ( not ( = ?auto_388894 ?auto_388904 ) ) ( not ( = ?auto_388894 ?auto_388905 ) ) ( not ( = ?auto_388895 ?auto_388896 ) ) ( not ( = ?auto_388895 ?auto_388897 ) ) ( not ( = ?auto_388895 ?auto_388898 ) ) ( not ( = ?auto_388895 ?auto_388899 ) ) ( not ( = ?auto_388895 ?auto_388900 ) ) ( not ( = ?auto_388895 ?auto_388901 ) ) ( not ( = ?auto_388895 ?auto_388902 ) ) ( not ( = ?auto_388895 ?auto_388903 ) ) ( not ( = ?auto_388895 ?auto_388904 ) ) ( not ( = ?auto_388895 ?auto_388905 ) ) ( not ( = ?auto_388896 ?auto_388897 ) ) ( not ( = ?auto_388896 ?auto_388898 ) ) ( not ( = ?auto_388896 ?auto_388899 ) ) ( not ( = ?auto_388896 ?auto_388900 ) ) ( not ( = ?auto_388896 ?auto_388901 ) ) ( not ( = ?auto_388896 ?auto_388902 ) ) ( not ( = ?auto_388896 ?auto_388903 ) ) ( not ( = ?auto_388896 ?auto_388904 ) ) ( not ( = ?auto_388896 ?auto_388905 ) ) ( not ( = ?auto_388897 ?auto_388898 ) ) ( not ( = ?auto_388897 ?auto_388899 ) ) ( not ( = ?auto_388897 ?auto_388900 ) ) ( not ( = ?auto_388897 ?auto_388901 ) ) ( not ( = ?auto_388897 ?auto_388902 ) ) ( not ( = ?auto_388897 ?auto_388903 ) ) ( not ( = ?auto_388897 ?auto_388904 ) ) ( not ( = ?auto_388897 ?auto_388905 ) ) ( not ( = ?auto_388898 ?auto_388899 ) ) ( not ( = ?auto_388898 ?auto_388900 ) ) ( not ( = ?auto_388898 ?auto_388901 ) ) ( not ( = ?auto_388898 ?auto_388902 ) ) ( not ( = ?auto_388898 ?auto_388903 ) ) ( not ( = ?auto_388898 ?auto_388904 ) ) ( not ( = ?auto_388898 ?auto_388905 ) ) ( not ( = ?auto_388899 ?auto_388900 ) ) ( not ( = ?auto_388899 ?auto_388901 ) ) ( not ( = ?auto_388899 ?auto_388902 ) ) ( not ( = ?auto_388899 ?auto_388903 ) ) ( not ( = ?auto_388899 ?auto_388904 ) ) ( not ( = ?auto_388899 ?auto_388905 ) ) ( not ( = ?auto_388900 ?auto_388901 ) ) ( not ( = ?auto_388900 ?auto_388902 ) ) ( not ( = ?auto_388900 ?auto_388903 ) ) ( not ( = ?auto_388900 ?auto_388904 ) ) ( not ( = ?auto_388900 ?auto_388905 ) ) ( not ( = ?auto_388901 ?auto_388902 ) ) ( not ( = ?auto_388901 ?auto_388903 ) ) ( not ( = ?auto_388901 ?auto_388904 ) ) ( not ( = ?auto_388901 ?auto_388905 ) ) ( not ( = ?auto_388902 ?auto_388903 ) ) ( not ( = ?auto_388902 ?auto_388904 ) ) ( not ( = ?auto_388902 ?auto_388905 ) ) ( not ( = ?auto_388903 ?auto_388904 ) ) ( not ( = ?auto_388903 ?auto_388905 ) ) ( not ( = ?auto_388904 ?auto_388905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_388904 ?auto_388905 )
      ( !STACK ?auto_388904 ?auto_388903 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388918 - BLOCK
      ?auto_388919 - BLOCK
      ?auto_388920 - BLOCK
      ?auto_388921 - BLOCK
      ?auto_388922 - BLOCK
      ?auto_388923 - BLOCK
      ?auto_388924 - BLOCK
      ?auto_388925 - BLOCK
      ?auto_388926 - BLOCK
      ?auto_388927 - BLOCK
      ?auto_388928 - BLOCK
      ?auto_388929 - BLOCK
    )
    :vars
    (
      ?auto_388930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388929 ?auto_388930 ) ( ON-TABLE ?auto_388918 ) ( ON ?auto_388919 ?auto_388918 ) ( ON ?auto_388920 ?auto_388919 ) ( ON ?auto_388921 ?auto_388920 ) ( ON ?auto_388922 ?auto_388921 ) ( ON ?auto_388923 ?auto_388922 ) ( ON ?auto_388924 ?auto_388923 ) ( ON ?auto_388925 ?auto_388924 ) ( ON ?auto_388926 ?auto_388925 ) ( ON ?auto_388927 ?auto_388926 ) ( not ( = ?auto_388918 ?auto_388919 ) ) ( not ( = ?auto_388918 ?auto_388920 ) ) ( not ( = ?auto_388918 ?auto_388921 ) ) ( not ( = ?auto_388918 ?auto_388922 ) ) ( not ( = ?auto_388918 ?auto_388923 ) ) ( not ( = ?auto_388918 ?auto_388924 ) ) ( not ( = ?auto_388918 ?auto_388925 ) ) ( not ( = ?auto_388918 ?auto_388926 ) ) ( not ( = ?auto_388918 ?auto_388927 ) ) ( not ( = ?auto_388918 ?auto_388928 ) ) ( not ( = ?auto_388918 ?auto_388929 ) ) ( not ( = ?auto_388918 ?auto_388930 ) ) ( not ( = ?auto_388919 ?auto_388920 ) ) ( not ( = ?auto_388919 ?auto_388921 ) ) ( not ( = ?auto_388919 ?auto_388922 ) ) ( not ( = ?auto_388919 ?auto_388923 ) ) ( not ( = ?auto_388919 ?auto_388924 ) ) ( not ( = ?auto_388919 ?auto_388925 ) ) ( not ( = ?auto_388919 ?auto_388926 ) ) ( not ( = ?auto_388919 ?auto_388927 ) ) ( not ( = ?auto_388919 ?auto_388928 ) ) ( not ( = ?auto_388919 ?auto_388929 ) ) ( not ( = ?auto_388919 ?auto_388930 ) ) ( not ( = ?auto_388920 ?auto_388921 ) ) ( not ( = ?auto_388920 ?auto_388922 ) ) ( not ( = ?auto_388920 ?auto_388923 ) ) ( not ( = ?auto_388920 ?auto_388924 ) ) ( not ( = ?auto_388920 ?auto_388925 ) ) ( not ( = ?auto_388920 ?auto_388926 ) ) ( not ( = ?auto_388920 ?auto_388927 ) ) ( not ( = ?auto_388920 ?auto_388928 ) ) ( not ( = ?auto_388920 ?auto_388929 ) ) ( not ( = ?auto_388920 ?auto_388930 ) ) ( not ( = ?auto_388921 ?auto_388922 ) ) ( not ( = ?auto_388921 ?auto_388923 ) ) ( not ( = ?auto_388921 ?auto_388924 ) ) ( not ( = ?auto_388921 ?auto_388925 ) ) ( not ( = ?auto_388921 ?auto_388926 ) ) ( not ( = ?auto_388921 ?auto_388927 ) ) ( not ( = ?auto_388921 ?auto_388928 ) ) ( not ( = ?auto_388921 ?auto_388929 ) ) ( not ( = ?auto_388921 ?auto_388930 ) ) ( not ( = ?auto_388922 ?auto_388923 ) ) ( not ( = ?auto_388922 ?auto_388924 ) ) ( not ( = ?auto_388922 ?auto_388925 ) ) ( not ( = ?auto_388922 ?auto_388926 ) ) ( not ( = ?auto_388922 ?auto_388927 ) ) ( not ( = ?auto_388922 ?auto_388928 ) ) ( not ( = ?auto_388922 ?auto_388929 ) ) ( not ( = ?auto_388922 ?auto_388930 ) ) ( not ( = ?auto_388923 ?auto_388924 ) ) ( not ( = ?auto_388923 ?auto_388925 ) ) ( not ( = ?auto_388923 ?auto_388926 ) ) ( not ( = ?auto_388923 ?auto_388927 ) ) ( not ( = ?auto_388923 ?auto_388928 ) ) ( not ( = ?auto_388923 ?auto_388929 ) ) ( not ( = ?auto_388923 ?auto_388930 ) ) ( not ( = ?auto_388924 ?auto_388925 ) ) ( not ( = ?auto_388924 ?auto_388926 ) ) ( not ( = ?auto_388924 ?auto_388927 ) ) ( not ( = ?auto_388924 ?auto_388928 ) ) ( not ( = ?auto_388924 ?auto_388929 ) ) ( not ( = ?auto_388924 ?auto_388930 ) ) ( not ( = ?auto_388925 ?auto_388926 ) ) ( not ( = ?auto_388925 ?auto_388927 ) ) ( not ( = ?auto_388925 ?auto_388928 ) ) ( not ( = ?auto_388925 ?auto_388929 ) ) ( not ( = ?auto_388925 ?auto_388930 ) ) ( not ( = ?auto_388926 ?auto_388927 ) ) ( not ( = ?auto_388926 ?auto_388928 ) ) ( not ( = ?auto_388926 ?auto_388929 ) ) ( not ( = ?auto_388926 ?auto_388930 ) ) ( not ( = ?auto_388927 ?auto_388928 ) ) ( not ( = ?auto_388927 ?auto_388929 ) ) ( not ( = ?auto_388927 ?auto_388930 ) ) ( not ( = ?auto_388928 ?auto_388929 ) ) ( not ( = ?auto_388928 ?auto_388930 ) ) ( not ( = ?auto_388929 ?auto_388930 ) ) ( CLEAR ?auto_388927 ) ( ON ?auto_388928 ?auto_388929 ) ( CLEAR ?auto_388928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_388918 ?auto_388919 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ?auto_388924 ?auto_388925 ?auto_388926 ?auto_388927 ?auto_388928 )
      ( MAKE-12PILE ?auto_388918 ?auto_388919 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ?auto_388924 ?auto_388925 ?auto_388926 ?auto_388927 ?auto_388928 ?auto_388929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388943 - BLOCK
      ?auto_388944 - BLOCK
      ?auto_388945 - BLOCK
      ?auto_388946 - BLOCK
      ?auto_388947 - BLOCK
      ?auto_388948 - BLOCK
      ?auto_388949 - BLOCK
      ?auto_388950 - BLOCK
      ?auto_388951 - BLOCK
      ?auto_388952 - BLOCK
      ?auto_388953 - BLOCK
      ?auto_388954 - BLOCK
    )
    :vars
    (
      ?auto_388955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388954 ?auto_388955 ) ( ON-TABLE ?auto_388943 ) ( ON ?auto_388944 ?auto_388943 ) ( ON ?auto_388945 ?auto_388944 ) ( ON ?auto_388946 ?auto_388945 ) ( ON ?auto_388947 ?auto_388946 ) ( ON ?auto_388948 ?auto_388947 ) ( ON ?auto_388949 ?auto_388948 ) ( ON ?auto_388950 ?auto_388949 ) ( ON ?auto_388951 ?auto_388950 ) ( ON ?auto_388952 ?auto_388951 ) ( not ( = ?auto_388943 ?auto_388944 ) ) ( not ( = ?auto_388943 ?auto_388945 ) ) ( not ( = ?auto_388943 ?auto_388946 ) ) ( not ( = ?auto_388943 ?auto_388947 ) ) ( not ( = ?auto_388943 ?auto_388948 ) ) ( not ( = ?auto_388943 ?auto_388949 ) ) ( not ( = ?auto_388943 ?auto_388950 ) ) ( not ( = ?auto_388943 ?auto_388951 ) ) ( not ( = ?auto_388943 ?auto_388952 ) ) ( not ( = ?auto_388943 ?auto_388953 ) ) ( not ( = ?auto_388943 ?auto_388954 ) ) ( not ( = ?auto_388943 ?auto_388955 ) ) ( not ( = ?auto_388944 ?auto_388945 ) ) ( not ( = ?auto_388944 ?auto_388946 ) ) ( not ( = ?auto_388944 ?auto_388947 ) ) ( not ( = ?auto_388944 ?auto_388948 ) ) ( not ( = ?auto_388944 ?auto_388949 ) ) ( not ( = ?auto_388944 ?auto_388950 ) ) ( not ( = ?auto_388944 ?auto_388951 ) ) ( not ( = ?auto_388944 ?auto_388952 ) ) ( not ( = ?auto_388944 ?auto_388953 ) ) ( not ( = ?auto_388944 ?auto_388954 ) ) ( not ( = ?auto_388944 ?auto_388955 ) ) ( not ( = ?auto_388945 ?auto_388946 ) ) ( not ( = ?auto_388945 ?auto_388947 ) ) ( not ( = ?auto_388945 ?auto_388948 ) ) ( not ( = ?auto_388945 ?auto_388949 ) ) ( not ( = ?auto_388945 ?auto_388950 ) ) ( not ( = ?auto_388945 ?auto_388951 ) ) ( not ( = ?auto_388945 ?auto_388952 ) ) ( not ( = ?auto_388945 ?auto_388953 ) ) ( not ( = ?auto_388945 ?auto_388954 ) ) ( not ( = ?auto_388945 ?auto_388955 ) ) ( not ( = ?auto_388946 ?auto_388947 ) ) ( not ( = ?auto_388946 ?auto_388948 ) ) ( not ( = ?auto_388946 ?auto_388949 ) ) ( not ( = ?auto_388946 ?auto_388950 ) ) ( not ( = ?auto_388946 ?auto_388951 ) ) ( not ( = ?auto_388946 ?auto_388952 ) ) ( not ( = ?auto_388946 ?auto_388953 ) ) ( not ( = ?auto_388946 ?auto_388954 ) ) ( not ( = ?auto_388946 ?auto_388955 ) ) ( not ( = ?auto_388947 ?auto_388948 ) ) ( not ( = ?auto_388947 ?auto_388949 ) ) ( not ( = ?auto_388947 ?auto_388950 ) ) ( not ( = ?auto_388947 ?auto_388951 ) ) ( not ( = ?auto_388947 ?auto_388952 ) ) ( not ( = ?auto_388947 ?auto_388953 ) ) ( not ( = ?auto_388947 ?auto_388954 ) ) ( not ( = ?auto_388947 ?auto_388955 ) ) ( not ( = ?auto_388948 ?auto_388949 ) ) ( not ( = ?auto_388948 ?auto_388950 ) ) ( not ( = ?auto_388948 ?auto_388951 ) ) ( not ( = ?auto_388948 ?auto_388952 ) ) ( not ( = ?auto_388948 ?auto_388953 ) ) ( not ( = ?auto_388948 ?auto_388954 ) ) ( not ( = ?auto_388948 ?auto_388955 ) ) ( not ( = ?auto_388949 ?auto_388950 ) ) ( not ( = ?auto_388949 ?auto_388951 ) ) ( not ( = ?auto_388949 ?auto_388952 ) ) ( not ( = ?auto_388949 ?auto_388953 ) ) ( not ( = ?auto_388949 ?auto_388954 ) ) ( not ( = ?auto_388949 ?auto_388955 ) ) ( not ( = ?auto_388950 ?auto_388951 ) ) ( not ( = ?auto_388950 ?auto_388952 ) ) ( not ( = ?auto_388950 ?auto_388953 ) ) ( not ( = ?auto_388950 ?auto_388954 ) ) ( not ( = ?auto_388950 ?auto_388955 ) ) ( not ( = ?auto_388951 ?auto_388952 ) ) ( not ( = ?auto_388951 ?auto_388953 ) ) ( not ( = ?auto_388951 ?auto_388954 ) ) ( not ( = ?auto_388951 ?auto_388955 ) ) ( not ( = ?auto_388952 ?auto_388953 ) ) ( not ( = ?auto_388952 ?auto_388954 ) ) ( not ( = ?auto_388952 ?auto_388955 ) ) ( not ( = ?auto_388953 ?auto_388954 ) ) ( not ( = ?auto_388953 ?auto_388955 ) ) ( not ( = ?auto_388954 ?auto_388955 ) ) ( CLEAR ?auto_388952 ) ( ON ?auto_388953 ?auto_388954 ) ( CLEAR ?auto_388953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_388943 ?auto_388944 ?auto_388945 ?auto_388946 ?auto_388947 ?auto_388948 ?auto_388949 ?auto_388950 ?auto_388951 ?auto_388952 ?auto_388953 )
      ( MAKE-12PILE ?auto_388943 ?auto_388944 ?auto_388945 ?auto_388946 ?auto_388947 ?auto_388948 ?auto_388949 ?auto_388950 ?auto_388951 ?auto_388952 ?auto_388953 ?auto_388954 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388968 - BLOCK
      ?auto_388969 - BLOCK
      ?auto_388970 - BLOCK
      ?auto_388971 - BLOCK
      ?auto_388972 - BLOCK
      ?auto_388973 - BLOCK
      ?auto_388974 - BLOCK
      ?auto_388975 - BLOCK
      ?auto_388976 - BLOCK
      ?auto_388977 - BLOCK
      ?auto_388978 - BLOCK
      ?auto_388979 - BLOCK
    )
    :vars
    (
      ?auto_388980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_388979 ?auto_388980 ) ( ON-TABLE ?auto_388968 ) ( ON ?auto_388969 ?auto_388968 ) ( ON ?auto_388970 ?auto_388969 ) ( ON ?auto_388971 ?auto_388970 ) ( ON ?auto_388972 ?auto_388971 ) ( ON ?auto_388973 ?auto_388972 ) ( ON ?auto_388974 ?auto_388973 ) ( ON ?auto_388975 ?auto_388974 ) ( ON ?auto_388976 ?auto_388975 ) ( not ( = ?auto_388968 ?auto_388969 ) ) ( not ( = ?auto_388968 ?auto_388970 ) ) ( not ( = ?auto_388968 ?auto_388971 ) ) ( not ( = ?auto_388968 ?auto_388972 ) ) ( not ( = ?auto_388968 ?auto_388973 ) ) ( not ( = ?auto_388968 ?auto_388974 ) ) ( not ( = ?auto_388968 ?auto_388975 ) ) ( not ( = ?auto_388968 ?auto_388976 ) ) ( not ( = ?auto_388968 ?auto_388977 ) ) ( not ( = ?auto_388968 ?auto_388978 ) ) ( not ( = ?auto_388968 ?auto_388979 ) ) ( not ( = ?auto_388968 ?auto_388980 ) ) ( not ( = ?auto_388969 ?auto_388970 ) ) ( not ( = ?auto_388969 ?auto_388971 ) ) ( not ( = ?auto_388969 ?auto_388972 ) ) ( not ( = ?auto_388969 ?auto_388973 ) ) ( not ( = ?auto_388969 ?auto_388974 ) ) ( not ( = ?auto_388969 ?auto_388975 ) ) ( not ( = ?auto_388969 ?auto_388976 ) ) ( not ( = ?auto_388969 ?auto_388977 ) ) ( not ( = ?auto_388969 ?auto_388978 ) ) ( not ( = ?auto_388969 ?auto_388979 ) ) ( not ( = ?auto_388969 ?auto_388980 ) ) ( not ( = ?auto_388970 ?auto_388971 ) ) ( not ( = ?auto_388970 ?auto_388972 ) ) ( not ( = ?auto_388970 ?auto_388973 ) ) ( not ( = ?auto_388970 ?auto_388974 ) ) ( not ( = ?auto_388970 ?auto_388975 ) ) ( not ( = ?auto_388970 ?auto_388976 ) ) ( not ( = ?auto_388970 ?auto_388977 ) ) ( not ( = ?auto_388970 ?auto_388978 ) ) ( not ( = ?auto_388970 ?auto_388979 ) ) ( not ( = ?auto_388970 ?auto_388980 ) ) ( not ( = ?auto_388971 ?auto_388972 ) ) ( not ( = ?auto_388971 ?auto_388973 ) ) ( not ( = ?auto_388971 ?auto_388974 ) ) ( not ( = ?auto_388971 ?auto_388975 ) ) ( not ( = ?auto_388971 ?auto_388976 ) ) ( not ( = ?auto_388971 ?auto_388977 ) ) ( not ( = ?auto_388971 ?auto_388978 ) ) ( not ( = ?auto_388971 ?auto_388979 ) ) ( not ( = ?auto_388971 ?auto_388980 ) ) ( not ( = ?auto_388972 ?auto_388973 ) ) ( not ( = ?auto_388972 ?auto_388974 ) ) ( not ( = ?auto_388972 ?auto_388975 ) ) ( not ( = ?auto_388972 ?auto_388976 ) ) ( not ( = ?auto_388972 ?auto_388977 ) ) ( not ( = ?auto_388972 ?auto_388978 ) ) ( not ( = ?auto_388972 ?auto_388979 ) ) ( not ( = ?auto_388972 ?auto_388980 ) ) ( not ( = ?auto_388973 ?auto_388974 ) ) ( not ( = ?auto_388973 ?auto_388975 ) ) ( not ( = ?auto_388973 ?auto_388976 ) ) ( not ( = ?auto_388973 ?auto_388977 ) ) ( not ( = ?auto_388973 ?auto_388978 ) ) ( not ( = ?auto_388973 ?auto_388979 ) ) ( not ( = ?auto_388973 ?auto_388980 ) ) ( not ( = ?auto_388974 ?auto_388975 ) ) ( not ( = ?auto_388974 ?auto_388976 ) ) ( not ( = ?auto_388974 ?auto_388977 ) ) ( not ( = ?auto_388974 ?auto_388978 ) ) ( not ( = ?auto_388974 ?auto_388979 ) ) ( not ( = ?auto_388974 ?auto_388980 ) ) ( not ( = ?auto_388975 ?auto_388976 ) ) ( not ( = ?auto_388975 ?auto_388977 ) ) ( not ( = ?auto_388975 ?auto_388978 ) ) ( not ( = ?auto_388975 ?auto_388979 ) ) ( not ( = ?auto_388975 ?auto_388980 ) ) ( not ( = ?auto_388976 ?auto_388977 ) ) ( not ( = ?auto_388976 ?auto_388978 ) ) ( not ( = ?auto_388976 ?auto_388979 ) ) ( not ( = ?auto_388976 ?auto_388980 ) ) ( not ( = ?auto_388977 ?auto_388978 ) ) ( not ( = ?auto_388977 ?auto_388979 ) ) ( not ( = ?auto_388977 ?auto_388980 ) ) ( not ( = ?auto_388978 ?auto_388979 ) ) ( not ( = ?auto_388978 ?auto_388980 ) ) ( not ( = ?auto_388979 ?auto_388980 ) ) ( ON ?auto_388978 ?auto_388979 ) ( CLEAR ?auto_388976 ) ( ON ?auto_388977 ?auto_388978 ) ( CLEAR ?auto_388977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388968 ?auto_388969 ?auto_388970 ?auto_388971 ?auto_388972 ?auto_388973 ?auto_388974 ?auto_388975 ?auto_388976 ?auto_388977 )
      ( MAKE-12PILE ?auto_388968 ?auto_388969 ?auto_388970 ?auto_388971 ?auto_388972 ?auto_388973 ?auto_388974 ?auto_388975 ?auto_388976 ?auto_388977 ?auto_388978 ?auto_388979 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_388993 - BLOCK
      ?auto_388994 - BLOCK
      ?auto_388995 - BLOCK
      ?auto_388996 - BLOCK
      ?auto_388997 - BLOCK
      ?auto_388998 - BLOCK
      ?auto_388999 - BLOCK
      ?auto_389000 - BLOCK
      ?auto_389001 - BLOCK
      ?auto_389002 - BLOCK
      ?auto_389003 - BLOCK
      ?auto_389004 - BLOCK
    )
    :vars
    (
      ?auto_389005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389004 ?auto_389005 ) ( ON-TABLE ?auto_388993 ) ( ON ?auto_388994 ?auto_388993 ) ( ON ?auto_388995 ?auto_388994 ) ( ON ?auto_388996 ?auto_388995 ) ( ON ?auto_388997 ?auto_388996 ) ( ON ?auto_388998 ?auto_388997 ) ( ON ?auto_388999 ?auto_388998 ) ( ON ?auto_389000 ?auto_388999 ) ( ON ?auto_389001 ?auto_389000 ) ( not ( = ?auto_388993 ?auto_388994 ) ) ( not ( = ?auto_388993 ?auto_388995 ) ) ( not ( = ?auto_388993 ?auto_388996 ) ) ( not ( = ?auto_388993 ?auto_388997 ) ) ( not ( = ?auto_388993 ?auto_388998 ) ) ( not ( = ?auto_388993 ?auto_388999 ) ) ( not ( = ?auto_388993 ?auto_389000 ) ) ( not ( = ?auto_388993 ?auto_389001 ) ) ( not ( = ?auto_388993 ?auto_389002 ) ) ( not ( = ?auto_388993 ?auto_389003 ) ) ( not ( = ?auto_388993 ?auto_389004 ) ) ( not ( = ?auto_388993 ?auto_389005 ) ) ( not ( = ?auto_388994 ?auto_388995 ) ) ( not ( = ?auto_388994 ?auto_388996 ) ) ( not ( = ?auto_388994 ?auto_388997 ) ) ( not ( = ?auto_388994 ?auto_388998 ) ) ( not ( = ?auto_388994 ?auto_388999 ) ) ( not ( = ?auto_388994 ?auto_389000 ) ) ( not ( = ?auto_388994 ?auto_389001 ) ) ( not ( = ?auto_388994 ?auto_389002 ) ) ( not ( = ?auto_388994 ?auto_389003 ) ) ( not ( = ?auto_388994 ?auto_389004 ) ) ( not ( = ?auto_388994 ?auto_389005 ) ) ( not ( = ?auto_388995 ?auto_388996 ) ) ( not ( = ?auto_388995 ?auto_388997 ) ) ( not ( = ?auto_388995 ?auto_388998 ) ) ( not ( = ?auto_388995 ?auto_388999 ) ) ( not ( = ?auto_388995 ?auto_389000 ) ) ( not ( = ?auto_388995 ?auto_389001 ) ) ( not ( = ?auto_388995 ?auto_389002 ) ) ( not ( = ?auto_388995 ?auto_389003 ) ) ( not ( = ?auto_388995 ?auto_389004 ) ) ( not ( = ?auto_388995 ?auto_389005 ) ) ( not ( = ?auto_388996 ?auto_388997 ) ) ( not ( = ?auto_388996 ?auto_388998 ) ) ( not ( = ?auto_388996 ?auto_388999 ) ) ( not ( = ?auto_388996 ?auto_389000 ) ) ( not ( = ?auto_388996 ?auto_389001 ) ) ( not ( = ?auto_388996 ?auto_389002 ) ) ( not ( = ?auto_388996 ?auto_389003 ) ) ( not ( = ?auto_388996 ?auto_389004 ) ) ( not ( = ?auto_388996 ?auto_389005 ) ) ( not ( = ?auto_388997 ?auto_388998 ) ) ( not ( = ?auto_388997 ?auto_388999 ) ) ( not ( = ?auto_388997 ?auto_389000 ) ) ( not ( = ?auto_388997 ?auto_389001 ) ) ( not ( = ?auto_388997 ?auto_389002 ) ) ( not ( = ?auto_388997 ?auto_389003 ) ) ( not ( = ?auto_388997 ?auto_389004 ) ) ( not ( = ?auto_388997 ?auto_389005 ) ) ( not ( = ?auto_388998 ?auto_388999 ) ) ( not ( = ?auto_388998 ?auto_389000 ) ) ( not ( = ?auto_388998 ?auto_389001 ) ) ( not ( = ?auto_388998 ?auto_389002 ) ) ( not ( = ?auto_388998 ?auto_389003 ) ) ( not ( = ?auto_388998 ?auto_389004 ) ) ( not ( = ?auto_388998 ?auto_389005 ) ) ( not ( = ?auto_388999 ?auto_389000 ) ) ( not ( = ?auto_388999 ?auto_389001 ) ) ( not ( = ?auto_388999 ?auto_389002 ) ) ( not ( = ?auto_388999 ?auto_389003 ) ) ( not ( = ?auto_388999 ?auto_389004 ) ) ( not ( = ?auto_388999 ?auto_389005 ) ) ( not ( = ?auto_389000 ?auto_389001 ) ) ( not ( = ?auto_389000 ?auto_389002 ) ) ( not ( = ?auto_389000 ?auto_389003 ) ) ( not ( = ?auto_389000 ?auto_389004 ) ) ( not ( = ?auto_389000 ?auto_389005 ) ) ( not ( = ?auto_389001 ?auto_389002 ) ) ( not ( = ?auto_389001 ?auto_389003 ) ) ( not ( = ?auto_389001 ?auto_389004 ) ) ( not ( = ?auto_389001 ?auto_389005 ) ) ( not ( = ?auto_389002 ?auto_389003 ) ) ( not ( = ?auto_389002 ?auto_389004 ) ) ( not ( = ?auto_389002 ?auto_389005 ) ) ( not ( = ?auto_389003 ?auto_389004 ) ) ( not ( = ?auto_389003 ?auto_389005 ) ) ( not ( = ?auto_389004 ?auto_389005 ) ) ( ON ?auto_389003 ?auto_389004 ) ( CLEAR ?auto_389001 ) ( ON ?auto_389002 ?auto_389003 ) ( CLEAR ?auto_389002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_388993 ?auto_388994 ?auto_388995 ?auto_388996 ?auto_388997 ?auto_388998 ?auto_388999 ?auto_389000 ?auto_389001 ?auto_389002 )
      ( MAKE-12PILE ?auto_388993 ?auto_388994 ?auto_388995 ?auto_388996 ?auto_388997 ?auto_388998 ?auto_388999 ?auto_389000 ?auto_389001 ?auto_389002 ?auto_389003 ?auto_389004 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389018 - BLOCK
      ?auto_389019 - BLOCK
      ?auto_389020 - BLOCK
      ?auto_389021 - BLOCK
      ?auto_389022 - BLOCK
      ?auto_389023 - BLOCK
      ?auto_389024 - BLOCK
      ?auto_389025 - BLOCK
      ?auto_389026 - BLOCK
      ?auto_389027 - BLOCK
      ?auto_389028 - BLOCK
      ?auto_389029 - BLOCK
    )
    :vars
    (
      ?auto_389030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389029 ?auto_389030 ) ( ON-TABLE ?auto_389018 ) ( ON ?auto_389019 ?auto_389018 ) ( ON ?auto_389020 ?auto_389019 ) ( ON ?auto_389021 ?auto_389020 ) ( ON ?auto_389022 ?auto_389021 ) ( ON ?auto_389023 ?auto_389022 ) ( ON ?auto_389024 ?auto_389023 ) ( ON ?auto_389025 ?auto_389024 ) ( not ( = ?auto_389018 ?auto_389019 ) ) ( not ( = ?auto_389018 ?auto_389020 ) ) ( not ( = ?auto_389018 ?auto_389021 ) ) ( not ( = ?auto_389018 ?auto_389022 ) ) ( not ( = ?auto_389018 ?auto_389023 ) ) ( not ( = ?auto_389018 ?auto_389024 ) ) ( not ( = ?auto_389018 ?auto_389025 ) ) ( not ( = ?auto_389018 ?auto_389026 ) ) ( not ( = ?auto_389018 ?auto_389027 ) ) ( not ( = ?auto_389018 ?auto_389028 ) ) ( not ( = ?auto_389018 ?auto_389029 ) ) ( not ( = ?auto_389018 ?auto_389030 ) ) ( not ( = ?auto_389019 ?auto_389020 ) ) ( not ( = ?auto_389019 ?auto_389021 ) ) ( not ( = ?auto_389019 ?auto_389022 ) ) ( not ( = ?auto_389019 ?auto_389023 ) ) ( not ( = ?auto_389019 ?auto_389024 ) ) ( not ( = ?auto_389019 ?auto_389025 ) ) ( not ( = ?auto_389019 ?auto_389026 ) ) ( not ( = ?auto_389019 ?auto_389027 ) ) ( not ( = ?auto_389019 ?auto_389028 ) ) ( not ( = ?auto_389019 ?auto_389029 ) ) ( not ( = ?auto_389019 ?auto_389030 ) ) ( not ( = ?auto_389020 ?auto_389021 ) ) ( not ( = ?auto_389020 ?auto_389022 ) ) ( not ( = ?auto_389020 ?auto_389023 ) ) ( not ( = ?auto_389020 ?auto_389024 ) ) ( not ( = ?auto_389020 ?auto_389025 ) ) ( not ( = ?auto_389020 ?auto_389026 ) ) ( not ( = ?auto_389020 ?auto_389027 ) ) ( not ( = ?auto_389020 ?auto_389028 ) ) ( not ( = ?auto_389020 ?auto_389029 ) ) ( not ( = ?auto_389020 ?auto_389030 ) ) ( not ( = ?auto_389021 ?auto_389022 ) ) ( not ( = ?auto_389021 ?auto_389023 ) ) ( not ( = ?auto_389021 ?auto_389024 ) ) ( not ( = ?auto_389021 ?auto_389025 ) ) ( not ( = ?auto_389021 ?auto_389026 ) ) ( not ( = ?auto_389021 ?auto_389027 ) ) ( not ( = ?auto_389021 ?auto_389028 ) ) ( not ( = ?auto_389021 ?auto_389029 ) ) ( not ( = ?auto_389021 ?auto_389030 ) ) ( not ( = ?auto_389022 ?auto_389023 ) ) ( not ( = ?auto_389022 ?auto_389024 ) ) ( not ( = ?auto_389022 ?auto_389025 ) ) ( not ( = ?auto_389022 ?auto_389026 ) ) ( not ( = ?auto_389022 ?auto_389027 ) ) ( not ( = ?auto_389022 ?auto_389028 ) ) ( not ( = ?auto_389022 ?auto_389029 ) ) ( not ( = ?auto_389022 ?auto_389030 ) ) ( not ( = ?auto_389023 ?auto_389024 ) ) ( not ( = ?auto_389023 ?auto_389025 ) ) ( not ( = ?auto_389023 ?auto_389026 ) ) ( not ( = ?auto_389023 ?auto_389027 ) ) ( not ( = ?auto_389023 ?auto_389028 ) ) ( not ( = ?auto_389023 ?auto_389029 ) ) ( not ( = ?auto_389023 ?auto_389030 ) ) ( not ( = ?auto_389024 ?auto_389025 ) ) ( not ( = ?auto_389024 ?auto_389026 ) ) ( not ( = ?auto_389024 ?auto_389027 ) ) ( not ( = ?auto_389024 ?auto_389028 ) ) ( not ( = ?auto_389024 ?auto_389029 ) ) ( not ( = ?auto_389024 ?auto_389030 ) ) ( not ( = ?auto_389025 ?auto_389026 ) ) ( not ( = ?auto_389025 ?auto_389027 ) ) ( not ( = ?auto_389025 ?auto_389028 ) ) ( not ( = ?auto_389025 ?auto_389029 ) ) ( not ( = ?auto_389025 ?auto_389030 ) ) ( not ( = ?auto_389026 ?auto_389027 ) ) ( not ( = ?auto_389026 ?auto_389028 ) ) ( not ( = ?auto_389026 ?auto_389029 ) ) ( not ( = ?auto_389026 ?auto_389030 ) ) ( not ( = ?auto_389027 ?auto_389028 ) ) ( not ( = ?auto_389027 ?auto_389029 ) ) ( not ( = ?auto_389027 ?auto_389030 ) ) ( not ( = ?auto_389028 ?auto_389029 ) ) ( not ( = ?auto_389028 ?auto_389030 ) ) ( not ( = ?auto_389029 ?auto_389030 ) ) ( ON ?auto_389028 ?auto_389029 ) ( ON ?auto_389027 ?auto_389028 ) ( CLEAR ?auto_389025 ) ( ON ?auto_389026 ?auto_389027 ) ( CLEAR ?auto_389026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389018 ?auto_389019 ?auto_389020 ?auto_389021 ?auto_389022 ?auto_389023 ?auto_389024 ?auto_389025 ?auto_389026 )
      ( MAKE-12PILE ?auto_389018 ?auto_389019 ?auto_389020 ?auto_389021 ?auto_389022 ?auto_389023 ?auto_389024 ?auto_389025 ?auto_389026 ?auto_389027 ?auto_389028 ?auto_389029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389043 - BLOCK
      ?auto_389044 - BLOCK
      ?auto_389045 - BLOCK
      ?auto_389046 - BLOCK
      ?auto_389047 - BLOCK
      ?auto_389048 - BLOCK
      ?auto_389049 - BLOCK
      ?auto_389050 - BLOCK
      ?auto_389051 - BLOCK
      ?auto_389052 - BLOCK
      ?auto_389053 - BLOCK
      ?auto_389054 - BLOCK
    )
    :vars
    (
      ?auto_389055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389054 ?auto_389055 ) ( ON-TABLE ?auto_389043 ) ( ON ?auto_389044 ?auto_389043 ) ( ON ?auto_389045 ?auto_389044 ) ( ON ?auto_389046 ?auto_389045 ) ( ON ?auto_389047 ?auto_389046 ) ( ON ?auto_389048 ?auto_389047 ) ( ON ?auto_389049 ?auto_389048 ) ( ON ?auto_389050 ?auto_389049 ) ( not ( = ?auto_389043 ?auto_389044 ) ) ( not ( = ?auto_389043 ?auto_389045 ) ) ( not ( = ?auto_389043 ?auto_389046 ) ) ( not ( = ?auto_389043 ?auto_389047 ) ) ( not ( = ?auto_389043 ?auto_389048 ) ) ( not ( = ?auto_389043 ?auto_389049 ) ) ( not ( = ?auto_389043 ?auto_389050 ) ) ( not ( = ?auto_389043 ?auto_389051 ) ) ( not ( = ?auto_389043 ?auto_389052 ) ) ( not ( = ?auto_389043 ?auto_389053 ) ) ( not ( = ?auto_389043 ?auto_389054 ) ) ( not ( = ?auto_389043 ?auto_389055 ) ) ( not ( = ?auto_389044 ?auto_389045 ) ) ( not ( = ?auto_389044 ?auto_389046 ) ) ( not ( = ?auto_389044 ?auto_389047 ) ) ( not ( = ?auto_389044 ?auto_389048 ) ) ( not ( = ?auto_389044 ?auto_389049 ) ) ( not ( = ?auto_389044 ?auto_389050 ) ) ( not ( = ?auto_389044 ?auto_389051 ) ) ( not ( = ?auto_389044 ?auto_389052 ) ) ( not ( = ?auto_389044 ?auto_389053 ) ) ( not ( = ?auto_389044 ?auto_389054 ) ) ( not ( = ?auto_389044 ?auto_389055 ) ) ( not ( = ?auto_389045 ?auto_389046 ) ) ( not ( = ?auto_389045 ?auto_389047 ) ) ( not ( = ?auto_389045 ?auto_389048 ) ) ( not ( = ?auto_389045 ?auto_389049 ) ) ( not ( = ?auto_389045 ?auto_389050 ) ) ( not ( = ?auto_389045 ?auto_389051 ) ) ( not ( = ?auto_389045 ?auto_389052 ) ) ( not ( = ?auto_389045 ?auto_389053 ) ) ( not ( = ?auto_389045 ?auto_389054 ) ) ( not ( = ?auto_389045 ?auto_389055 ) ) ( not ( = ?auto_389046 ?auto_389047 ) ) ( not ( = ?auto_389046 ?auto_389048 ) ) ( not ( = ?auto_389046 ?auto_389049 ) ) ( not ( = ?auto_389046 ?auto_389050 ) ) ( not ( = ?auto_389046 ?auto_389051 ) ) ( not ( = ?auto_389046 ?auto_389052 ) ) ( not ( = ?auto_389046 ?auto_389053 ) ) ( not ( = ?auto_389046 ?auto_389054 ) ) ( not ( = ?auto_389046 ?auto_389055 ) ) ( not ( = ?auto_389047 ?auto_389048 ) ) ( not ( = ?auto_389047 ?auto_389049 ) ) ( not ( = ?auto_389047 ?auto_389050 ) ) ( not ( = ?auto_389047 ?auto_389051 ) ) ( not ( = ?auto_389047 ?auto_389052 ) ) ( not ( = ?auto_389047 ?auto_389053 ) ) ( not ( = ?auto_389047 ?auto_389054 ) ) ( not ( = ?auto_389047 ?auto_389055 ) ) ( not ( = ?auto_389048 ?auto_389049 ) ) ( not ( = ?auto_389048 ?auto_389050 ) ) ( not ( = ?auto_389048 ?auto_389051 ) ) ( not ( = ?auto_389048 ?auto_389052 ) ) ( not ( = ?auto_389048 ?auto_389053 ) ) ( not ( = ?auto_389048 ?auto_389054 ) ) ( not ( = ?auto_389048 ?auto_389055 ) ) ( not ( = ?auto_389049 ?auto_389050 ) ) ( not ( = ?auto_389049 ?auto_389051 ) ) ( not ( = ?auto_389049 ?auto_389052 ) ) ( not ( = ?auto_389049 ?auto_389053 ) ) ( not ( = ?auto_389049 ?auto_389054 ) ) ( not ( = ?auto_389049 ?auto_389055 ) ) ( not ( = ?auto_389050 ?auto_389051 ) ) ( not ( = ?auto_389050 ?auto_389052 ) ) ( not ( = ?auto_389050 ?auto_389053 ) ) ( not ( = ?auto_389050 ?auto_389054 ) ) ( not ( = ?auto_389050 ?auto_389055 ) ) ( not ( = ?auto_389051 ?auto_389052 ) ) ( not ( = ?auto_389051 ?auto_389053 ) ) ( not ( = ?auto_389051 ?auto_389054 ) ) ( not ( = ?auto_389051 ?auto_389055 ) ) ( not ( = ?auto_389052 ?auto_389053 ) ) ( not ( = ?auto_389052 ?auto_389054 ) ) ( not ( = ?auto_389052 ?auto_389055 ) ) ( not ( = ?auto_389053 ?auto_389054 ) ) ( not ( = ?auto_389053 ?auto_389055 ) ) ( not ( = ?auto_389054 ?auto_389055 ) ) ( ON ?auto_389053 ?auto_389054 ) ( ON ?auto_389052 ?auto_389053 ) ( CLEAR ?auto_389050 ) ( ON ?auto_389051 ?auto_389052 ) ( CLEAR ?auto_389051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389043 ?auto_389044 ?auto_389045 ?auto_389046 ?auto_389047 ?auto_389048 ?auto_389049 ?auto_389050 ?auto_389051 )
      ( MAKE-12PILE ?auto_389043 ?auto_389044 ?auto_389045 ?auto_389046 ?auto_389047 ?auto_389048 ?auto_389049 ?auto_389050 ?auto_389051 ?auto_389052 ?auto_389053 ?auto_389054 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389068 - BLOCK
      ?auto_389069 - BLOCK
      ?auto_389070 - BLOCK
      ?auto_389071 - BLOCK
      ?auto_389072 - BLOCK
      ?auto_389073 - BLOCK
      ?auto_389074 - BLOCK
      ?auto_389075 - BLOCK
      ?auto_389076 - BLOCK
      ?auto_389077 - BLOCK
      ?auto_389078 - BLOCK
      ?auto_389079 - BLOCK
    )
    :vars
    (
      ?auto_389080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389079 ?auto_389080 ) ( ON-TABLE ?auto_389068 ) ( ON ?auto_389069 ?auto_389068 ) ( ON ?auto_389070 ?auto_389069 ) ( ON ?auto_389071 ?auto_389070 ) ( ON ?auto_389072 ?auto_389071 ) ( ON ?auto_389073 ?auto_389072 ) ( ON ?auto_389074 ?auto_389073 ) ( not ( = ?auto_389068 ?auto_389069 ) ) ( not ( = ?auto_389068 ?auto_389070 ) ) ( not ( = ?auto_389068 ?auto_389071 ) ) ( not ( = ?auto_389068 ?auto_389072 ) ) ( not ( = ?auto_389068 ?auto_389073 ) ) ( not ( = ?auto_389068 ?auto_389074 ) ) ( not ( = ?auto_389068 ?auto_389075 ) ) ( not ( = ?auto_389068 ?auto_389076 ) ) ( not ( = ?auto_389068 ?auto_389077 ) ) ( not ( = ?auto_389068 ?auto_389078 ) ) ( not ( = ?auto_389068 ?auto_389079 ) ) ( not ( = ?auto_389068 ?auto_389080 ) ) ( not ( = ?auto_389069 ?auto_389070 ) ) ( not ( = ?auto_389069 ?auto_389071 ) ) ( not ( = ?auto_389069 ?auto_389072 ) ) ( not ( = ?auto_389069 ?auto_389073 ) ) ( not ( = ?auto_389069 ?auto_389074 ) ) ( not ( = ?auto_389069 ?auto_389075 ) ) ( not ( = ?auto_389069 ?auto_389076 ) ) ( not ( = ?auto_389069 ?auto_389077 ) ) ( not ( = ?auto_389069 ?auto_389078 ) ) ( not ( = ?auto_389069 ?auto_389079 ) ) ( not ( = ?auto_389069 ?auto_389080 ) ) ( not ( = ?auto_389070 ?auto_389071 ) ) ( not ( = ?auto_389070 ?auto_389072 ) ) ( not ( = ?auto_389070 ?auto_389073 ) ) ( not ( = ?auto_389070 ?auto_389074 ) ) ( not ( = ?auto_389070 ?auto_389075 ) ) ( not ( = ?auto_389070 ?auto_389076 ) ) ( not ( = ?auto_389070 ?auto_389077 ) ) ( not ( = ?auto_389070 ?auto_389078 ) ) ( not ( = ?auto_389070 ?auto_389079 ) ) ( not ( = ?auto_389070 ?auto_389080 ) ) ( not ( = ?auto_389071 ?auto_389072 ) ) ( not ( = ?auto_389071 ?auto_389073 ) ) ( not ( = ?auto_389071 ?auto_389074 ) ) ( not ( = ?auto_389071 ?auto_389075 ) ) ( not ( = ?auto_389071 ?auto_389076 ) ) ( not ( = ?auto_389071 ?auto_389077 ) ) ( not ( = ?auto_389071 ?auto_389078 ) ) ( not ( = ?auto_389071 ?auto_389079 ) ) ( not ( = ?auto_389071 ?auto_389080 ) ) ( not ( = ?auto_389072 ?auto_389073 ) ) ( not ( = ?auto_389072 ?auto_389074 ) ) ( not ( = ?auto_389072 ?auto_389075 ) ) ( not ( = ?auto_389072 ?auto_389076 ) ) ( not ( = ?auto_389072 ?auto_389077 ) ) ( not ( = ?auto_389072 ?auto_389078 ) ) ( not ( = ?auto_389072 ?auto_389079 ) ) ( not ( = ?auto_389072 ?auto_389080 ) ) ( not ( = ?auto_389073 ?auto_389074 ) ) ( not ( = ?auto_389073 ?auto_389075 ) ) ( not ( = ?auto_389073 ?auto_389076 ) ) ( not ( = ?auto_389073 ?auto_389077 ) ) ( not ( = ?auto_389073 ?auto_389078 ) ) ( not ( = ?auto_389073 ?auto_389079 ) ) ( not ( = ?auto_389073 ?auto_389080 ) ) ( not ( = ?auto_389074 ?auto_389075 ) ) ( not ( = ?auto_389074 ?auto_389076 ) ) ( not ( = ?auto_389074 ?auto_389077 ) ) ( not ( = ?auto_389074 ?auto_389078 ) ) ( not ( = ?auto_389074 ?auto_389079 ) ) ( not ( = ?auto_389074 ?auto_389080 ) ) ( not ( = ?auto_389075 ?auto_389076 ) ) ( not ( = ?auto_389075 ?auto_389077 ) ) ( not ( = ?auto_389075 ?auto_389078 ) ) ( not ( = ?auto_389075 ?auto_389079 ) ) ( not ( = ?auto_389075 ?auto_389080 ) ) ( not ( = ?auto_389076 ?auto_389077 ) ) ( not ( = ?auto_389076 ?auto_389078 ) ) ( not ( = ?auto_389076 ?auto_389079 ) ) ( not ( = ?auto_389076 ?auto_389080 ) ) ( not ( = ?auto_389077 ?auto_389078 ) ) ( not ( = ?auto_389077 ?auto_389079 ) ) ( not ( = ?auto_389077 ?auto_389080 ) ) ( not ( = ?auto_389078 ?auto_389079 ) ) ( not ( = ?auto_389078 ?auto_389080 ) ) ( not ( = ?auto_389079 ?auto_389080 ) ) ( ON ?auto_389078 ?auto_389079 ) ( ON ?auto_389077 ?auto_389078 ) ( ON ?auto_389076 ?auto_389077 ) ( CLEAR ?auto_389074 ) ( ON ?auto_389075 ?auto_389076 ) ( CLEAR ?auto_389075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389068 ?auto_389069 ?auto_389070 ?auto_389071 ?auto_389072 ?auto_389073 ?auto_389074 ?auto_389075 )
      ( MAKE-12PILE ?auto_389068 ?auto_389069 ?auto_389070 ?auto_389071 ?auto_389072 ?auto_389073 ?auto_389074 ?auto_389075 ?auto_389076 ?auto_389077 ?auto_389078 ?auto_389079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389093 - BLOCK
      ?auto_389094 - BLOCK
      ?auto_389095 - BLOCK
      ?auto_389096 - BLOCK
      ?auto_389097 - BLOCK
      ?auto_389098 - BLOCK
      ?auto_389099 - BLOCK
      ?auto_389100 - BLOCK
      ?auto_389101 - BLOCK
      ?auto_389102 - BLOCK
      ?auto_389103 - BLOCK
      ?auto_389104 - BLOCK
    )
    :vars
    (
      ?auto_389105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389104 ?auto_389105 ) ( ON-TABLE ?auto_389093 ) ( ON ?auto_389094 ?auto_389093 ) ( ON ?auto_389095 ?auto_389094 ) ( ON ?auto_389096 ?auto_389095 ) ( ON ?auto_389097 ?auto_389096 ) ( ON ?auto_389098 ?auto_389097 ) ( ON ?auto_389099 ?auto_389098 ) ( not ( = ?auto_389093 ?auto_389094 ) ) ( not ( = ?auto_389093 ?auto_389095 ) ) ( not ( = ?auto_389093 ?auto_389096 ) ) ( not ( = ?auto_389093 ?auto_389097 ) ) ( not ( = ?auto_389093 ?auto_389098 ) ) ( not ( = ?auto_389093 ?auto_389099 ) ) ( not ( = ?auto_389093 ?auto_389100 ) ) ( not ( = ?auto_389093 ?auto_389101 ) ) ( not ( = ?auto_389093 ?auto_389102 ) ) ( not ( = ?auto_389093 ?auto_389103 ) ) ( not ( = ?auto_389093 ?auto_389104 ) ) ( not ( = ?auto_389093 ?auto_389105 ) ) ( not ( = ?auto_389094 ?auto_389095 ) ) ( not ( = ?auto_389094 ?auto_389096 ) ) ( not ( = ?auto_389094 ?auto_389097 ) ) ( not ( = ?auto_389094 ?auto_389098 ) ) ( not ( = ?auto_389094 ?auto_389099 ) ) ( not ( = ?auto_389094 ?auto_389100 ) ) ( not ( = ?auto_389094 ?auto_389101 ) ) ( not ( = ?auto_389094 ?auto_389102 ) ) ( not ( = ?auto_389094 ?auto_389103 ) ) ( not ( = ?auto_389094 ?auto_389104 ) ) ( not ( = ?auto_389094 ?auto_389105 ) ) ( not ( = ?auto_389095 ?auto_389096 ) ) ( not ( = ?auto_389095 ?auto_389097 ) ) ( not ( = ?auto_389095 ?auto_389098 ) ) ( not ( = ?auto_389095 ?auto_389099 ) ) ( not ( = ?auto_389095 ?auto_389100 ) ) ( not ( = ?auto_389095 ?auto_389101 ) ) ( not ( = ?auto_389095 ?auto_389102 ) ) ( not ( = ?auto_389095 ?auto_389103 ) ) ( not ( = ?auto_389095 ?auto_389104 ) ) ( not ( = ?auto_389095 ?auto_389105 ) ) ( not ( = ?auto_389096 ?auto_389097 ) ) ( not ( = ?auto_389096 ?auto_389098 ) ) ( not ( = ?auto_389096 ?auto_389099 ) ) ( not ( = ?auto_389096 ?auto_389100 ) ) ( not ( = ?auto_389096 ?auto_389101 ) ) ( not ( = ?auto_389096 ?auto_389102 ) ) ( not ( = ?auto_389096 ?auto_389103 ) ) ( not ( = ?auto_389096 ?auto_389104 ) ) ( not ( = ?auto_389096 ?auto_389105 ) ) ( not ( = ?auto_389097 ?auto_389098 ) ) ( not ( = ?auto_389097 ?auto_389099 ) ) ( not ( = ?auto_389097 ?auto_389100 ) ) ( not ( = ?auto_389097 ?auto_389101 ) ) ( not ( = ?auto_389097 ?auto_389102 ) ) ( not ( = ?auto_389097 ?auto_389103 ) ) ( not ( = ?auto_389097 ?auto_389104 ) ) ( not ( = ?auto_389097 ?auto_389105 ) ) ( not ( = ?auto_389098 ?auto_389099 ) ) ( not ( = ?auto_389098 ?auto_389100 ) ) ( not ( = ?auto_389098 ?auto_389101 ) ) ( not ( = ?auto_389098 ?auto_389102 ) ) ( not ( = ?auto_389098 ?auto_389103 ) ) ( not ( = ?auto_389098 ?auto_389104 ) ) ( not ( = ?auto_389098 ?auto_389105 ) ) ( not ( = ?auto_389099 ?auto_389100 ) ) ( not ( = ?auto_389099 ?auto_389101 ) ) ( not ( = ?auto_389099 ?auto_389102 ) ) ( not ( = ?auto_389099 ?auto_389103 ) ) ( not ( = ?auto_389099 ?auto_389104 ) ) ( not ( = ?auto_389099 ?auto_389105 ) ) ( not ( = ?auto_389100 ?auto_389101 ) ) ( not ( = ?auto_389100 ?auto_389102 ) ) ( not ( = ?auto_389100 ?auto_389103 ) ) ( not ( = ?auto_389100 ?auto_389104 ) ) ( not ( = ?auto_389100 ?auto_389105 ) ) ( not ( = ?auto_389101 ?auto_389102 ) ) ( not ( = ?auto_389101 ?auto_389103 ) ) ( not ( = ?auto_389101 ?auto_389104 ) ) ( not ( = ?auto_389101 ?auto_389105 ) ) ( not ( = ?auto_389102 ?auto_389103 ) ) ( not ( = ?auto_389102 ?auto_389104 ) ) ( not ( = ?auto_389102 ?auto_389105 ) ) ( not ( = ?auto_389103 ?auto_389104 ) ) ( not ( = ?auto_389103 ?auto_389105 ) ) ( not ( = ?auto_389104 ?auto_389105 ) ) ( ON ?auto_389103 ?auto_389104 ) ( ON ?auto_389102 ?auto_389103 ) ( ON ?auto_389101 ?auto_389102 ) ( CLEAR ?auto_389099 ) ( ON ?auto_389100 ?auto_389101 ) ( CLEAR ?auto_389100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389093 ?auto_389094 ?auto_389095 ?auto_389096 ?auto_389097 ?auto_389098 ?auto_389099 ?auto_389100 )
      ( MAKE-12PILE ?auto_389093 ?auto_389094 ?auto_389095 ?auto_389096 ?auto_389097 ?auto_389098 ?auto_389099 ?auto_389100 ?auto_389101 ?auto_389102 ?auto_389103 ?auto_389104 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389118 - BLOCK
      ?auto_389119 - BLOCK
      ?auto_389120 - BLOCK
      ?auto_389121 - BLOCK
      ?auto_389122 - BLOCK
      ?auto_389123 - BLOCK
      ?auto_389124 - BLOCK
      ?auto_389125 - BLOCK
      ?auto_389126 - BLOCK
      ?auto_389127 - BLOCK
      ?auto_389128 - BLOCK
      ?auto_389129 - BLOCK
    )
    :vars
    (
      ?auto_389130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389129 ?auto_389130 ) ( ON-TABLE ?auto_389118 ) ( ON ?auto_389119 ?auto_389118 ) ( ON ?auto_389120 ?auto_389119 ) ( ON ?auto_389121 ?auto_389120 ) ( ON ?auto_389122 ?auto_389121 ) ( ON ?auto_389123 ?auto_389122 ) ( not ( = ?auto_389118 ?auto_389119 ) ) ( not ( = ?auto_389118 ?auto_389120 ) ) ( not ( = ?auto_389118 ?auto_389121 ) ) ( not ( = ?auto_389118 ?auto_389122 ) ) ( not ( = ?auto_389118 ?auto_389123 ) ) ( not ( = ?auto_389118 ?auto_389124 ) ) ( not ( = ?auto_389118 ?auto_389125 ) ) ( not ( = ?auto_389118 ?auto_389126 ) ) ( not ( = ?auto_389118 ?auto_389127 ) ) ( not ( = ?auto_389118 ?auto_389128 ) ) ( not ( = ?auto_389118 ?auto_389129 ) ) ( not ( = ?auto_389118 ?auto_389130 ) ) ( not ( = ?auto_389119 ?auto_389120 ) ) ( not ( = ?auto_389119 ?auto_389121 ) ) ( not ( = ?auto_389119 ?auto_389122 ) ) ( not ( = ?auto_389119 ?auto_389123 ) ) ( not ( = ?auto_389119 ?auto_389124 ) ) ( not ( = ?auto_389119 ?auto_389125 ) ) ( not ( = ?auto_389119 ?auto_389126 ) ) ( not ( = ?auto_389119 ?auto_389127 ) ) ( not ( = ?auto_389119 ?auto_389128 ) ) ( not ( = ?auto_389119 ?auto_389129 ) ) ( not ( = ?auto_389119 ?auto_389130 ) ) ( not ( = ?auto_389120 ?auto_389121 ) ) ( not ( = ?auto_389120 ?auto_389122 ) ) ( not ( = ?auto_389120 ?auto_389123 ) ) ( not ( = ?auto_389120 ?auto_389124 ) ) ( not ( = ?auto_389120 ?auto_389125 ) ) ( not ( = ?auto_389120 ?auto_389126 ) ) ( not ( = ?auto_389120 ?auto_389127 ) ) ( not ( = ?auto_389120 ?auto_389128 ) ) ( not ( = ?auto_389120 ?auto_389129 ) ) ( not ( = ?auto_389120 ?auto_389130 ) ) ( not ( = ?auto_389121 ?auto_389122 ) ) ( not ( = ?auto_389121 ?auto_389123 ) ) ( not ( = ?auto_389121 ?auto_389124 ) ) ( not ( = ?auto_389121 ?auto_389125 ) ) ( not ( = ?auto_389121 ?auto_389126 ) ) ( not ( = ?auto_389121 ?auto_389127 ) ) ( not ( = ?auto_389121 ?auto_389128 ) ) ( not ( = ?auto_389121 ?auto_389129 ) ) ( not ( = ?auto_389121 ?auto_389130 ) ) ( not ( = ?auto_389122 ?auto_389123 ) ) ( not ( = ?auto_389122 ?auto_389124 ) ) ( not ( = ?auto_389122 ?auto_389125 ) ) ( not ( = ?auto_389122 ?auto_389126 ) ) ( not ( = ?auto_389122 ?auto_389127 ) ) ( not ( = ?auto_389122 ?auto_389128 ) ) ( not ( = ?auto_389122 ?auto_389129 ) ) ( not ( = ?auto_389122 ?auto_389130 ) ) ( not ( = ?auto_389123 ?auto_389124 ) ) ( not ( = ?auto_389123 ?auto_389125 ) ) ( not ( = ?auto_389123 ?auto_389126 ) ) ( not ( = ?auto_389123 ?auto_389127 ) ) ( not ( = ?auto_389123 ?auto_389128 ) ) ( not ( = ?auto_389123 ?auto_389129 ) ) ( not ( = ?auto_389123 ?auto_389130 ) ) ( not ( = ?auto_389124 ?auto_389125 ) ) ( not ( = ?auto_389124 ?auto_389126 ) ) ( not ( = ?auto_389124 ?auto_389127 ) ) ( not ( = ?auto_389124 ?auto_389128 ) ) ( not ( = ?auto_389124 ?auto_389129 ) ) ( not ( = ?auto_389124 ?auto_389130 ) ) ( not ( = ?auto_389125 ?auto_389126 ) ) ( not ( = ?auto_389125 ?auto_389127 ) ) ( not ( = ?auto_389125 ?auto_389128 ) ) ( not ( = ?auto_389125 ?auto_389129 ) ) ( not ( = ?auto_389125 ?auto_389130 ) ) ( not ( = ?auto_389126 ?auto_389127 ) ) ( not ( = ?auto_389126 ?auto_389128 ) ) ( not ( = ?auto_389126 ?auto_389129 ) ) ( not ( = ?auto_389126 ?auto_389130 ) ) ( not ( = ?auto_389127 ?auto_389128 ) ) ( not ( = ?auto_389127 ?auto_389129 ) ) ( not ( = ?auto_389127 ?auto_389130 ) ) ( not ( = ?auto_389128 ?auto_389129 ) ) ( not ( = ?auto_389128 ?auto_389130 ) ) ( not ( = ?auto_389129 ?auto_389130 ) ) ( ON ?auto_389128 ?auto_389129 ) ( ON ?auto_389127 ?auto_389128 ) ( ON ?auto_389126 ?auto_389127 ) ( ON ?auto_389125 ?auto_389126 ) ( CLEAR ?auto_389123 ) ( ON ?auto_389124 ?auto_389125 ) ( CLEAR ?auto_389124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389118 ?auto_389119 ?auto_389120 ?auto_389121 ?auto_389122 ?auto_389123 ?auto_389124 )
      ( MAKE-12PILE ?auto_389118 ?auto_389119 ?auto_389120 ?auto_389121 ?auto_389122 ?auto_389123 ?auto_389124 ?auto_389125 ?auto_389126 ?auto_389127 ?auto_389128 ?auto_389129 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389143 - BLOCK
      ?auto_389144 - BLOCK
      ?auto_389145 - BLOCK
      ?auto_389146 - BLOCK
      ?auto_389147 - BLOCK
      ?auto_389148 - BLOCK
      ?auto_389149 - BLOCK
      ?auto_389150 - BLOCK
      ?auto_389151 - BLOCK
      ?auto_389152 - BLOCK
      ?auto_389153 - BLOCK
      ?auto_389154 - BLOCK
    )
    :vars
    (
      ?auto_389155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389154 ?auto_389155 ) ( ON-TABLE ?auto_389143 ) ( ON ?auto_389144 ?auto_389143 ) ( ON ?auto_389145 ?auto_389144 ) ( ON ?auto_389146 ?auto_389145 ) ( ON ?auto_389147 ?auto_389146 ) ( ON ?auto_389148 ?auto_389147 ) ( not ( = ?auto_389143 ?auto_389144 ) ) ( not ( = ?auto_389143 ?auto_389145 ) ) ( not ( = ?auto_389143 ?auto_389146 ) ) ( not ( = ?auto_389143 ?auto_389147 ) ) ( not ( = ?auto_389143 ?auto_389148 ) ) ( not ( = ?auto_389143 ?auto_389149 ) ) ( not ( = ?auto_389143 ?auto_389150 ) ) ( not ( = ?auto_389143 ?auto_389151 ) ) ( not ( = ?auto_389143 ?auto_389152 ) ) ( not ( = ?auto_389143 ?auto_389153 ) ) ( not ( = ?auto_389143 ?auto_389154 ) ) ( not ( = ?auto_389143 ?auto_389155 ) ) ( not ( = ?auto_389144 ?auto_389145 ) ) ( not ( = ?auto_389144 ?auto_389146 ) ) ( not ( = ?auto_389144 ?auto_389147 ) ) ( not ( = ?auto_389144 ?auto_389148 ) ) ( not ( = ?auto_389144 ?auto_389149 ) ) ( not ( = ?auto_389144 ?auto_389150 ) ) ( not ( = ?auto_389144 ?auto_389151 ) ) ( not ( = ?auto_389144 ?auto_389152 ) ) ( not ( = ?auto_389144 ?auto_389153 ) ) ( not ( = ?auto_389144 ?auto_389154 ) ) ( not ( = ?auto_389144 ?auto_389155 ) ) ( not ( = ?auto_389145 ?auto_389146 ) ) ( not ( = ?auto_389145 ?auto_389147 ) ) ( not ( = ?auto_389145 ?auto_389148 ) ) ( not ( = ?auto_389145 ?auto_389149 ) ) ( not ( = ?auto_389145 ?auto_389150 ) ) ( not ( = ?auto_389145 ?auto_389151 ) ) ( not ( = ?auto_389145 ?auto_389152 ) ) ( not ( = ?auto_389145 ?auto_389153 ) ) ( not ( = ?auto_389145 ?auto_389154 ) ) ( not ( = ?auto_389145 ?auto_389155 ) ) ( not ( = ?auto_389146 ?auto_389147 ) ) ( not ( = ?auto_389146 ?auto_389148 ) ) ( not ( = ?auto_389146 ?auto_389149 ) ) ( not ( = ?auto_389146 ?auto_389150 ) ) ( not ( = ?auto_389146 ?auto_389151 ) ) ( not ( = ?auto_389146 ?auto_389152 ) ) ( not ( = ?auto_389146 ?auto_389153 ) ) ( not ( = ?auto_389146 ?auto_389154 ) ) ( not ( = ?auto_389146 ?auto_389155 ) ) ( not ( = ?auto_389147 ?auto_389148 ) ) ( not ( = ?auto_389147 ?auto_389149 ) ) ( not ( = ?auto_389147 ?auto_389150 ) ) ( not ( = ?auto_389147 ?auto_389151 ) ) ( not ( = ?auto_389147 ?auto_389152 ) ) ( not ( = ?auto_389147 ?auto_389153 ) ) ( not ( = ?auto_389147 ?auto_389154 ) ) ( not ( = ?auto_389147 ?auto_389155 ) ) ( not ( = ?auto_389148 ?auto_389149 ) ) ( not ( = ?auto_389148 ?auto_389150 ) ) ( not ( = ?auto_389148 ?auto_389151 ) ) ( not ( = ?auto_389148 ?auto_389152 ) ) ( not ( = ?auto_389148 ?auto_389153 ) ) ( not ( = ?auto_389148 ?auto_389154 ) ) ( not ( = ?auto_389148 ?auto_389155 ) ) ( not ( = ?auto_389149 ?auto_389150 ) ) ( not ( = ?auto_389149 ?auto_389151 ) ) ( not ( = ?auto_389149 ?auto_389152 ) ) ( not ( = ?auto_389149 ?auto_389153 ) ) ( not ( = ?auto_389149 ?auto_389154 ) ) ( not ( = ?auto_389149 ?auto_389155 ) ) ( not ( = ?auto_389150 ?auto_389151 ) ) ( not ( = ?auto_389150 ?auto_389152 ) ) ( not ( = ?auto_389150 ?auto_389153 ) ) ( not ( = ?auto_389150 ?auto_389154 ) ) ( not ( = ?auto_389150 ?auto_389155 ) ) ( not ( = ?auto_389151 ?auto_389152 ) ) ( not ( = ?auto_389151 ?auto_389153 ) ) ( not ( = ?auto_389151 ?auto_389154 ) ) ( not ( = ?auto_389151 ?auto_389155 ) ) ( not ( = ?auto_389152 ?auto_389153 ) ) ( not ( = ?auto_389152 ?auto_389154 ) ) ( not ( = ?auto_389152 ?auto_389155 ) ) ( not ( = ?auto_389153 ?auto_389154 ) ) ( not ( = ?auto_389153 ?auto_389155 ) ) ( not ( = ?auto_389154 ?auto_389155 ) ) ( ON ?auto_389153 ?auto_389154 ) ( ON ?auto_389152 ?auto_389153 ) ( ON ?auto_389151 ?auto_389152 ) ( ON ?auto_389150 ?auto_389151 ) ( CLEAR ?auto_389148 ) ( ON ?auto_389149 ?auto_389150 ) ( CLEAR ?auto_389149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389143 ?auto_389144 ?auto_389145 ?auto_389146 ?auto_389147 ?auto_389148 ?auto_389149 )
      ( MAKE-12PILE ?auto_389143 ?auto_389144 ?auto_389145 ?auto_389146 ?auto_389147 ?auto_389148 ?auto_389149 ?auto_389150 ?auto_389151 ?auto_389152 ?auto_389153 ?auto_389154 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389168 - BLOCK
      ?auto_389169 - BLOCK
      ?auto_389170 - BLOCK
      ?auto_389171 - BLOCK
      ?auto_389172 - BLOCK
      ?auto_389173 - BLOCK
      ?auto_389174 - BLOCK
      ?auto_389175 - BLOCK
      ?auto_389176 - BLOCK
      ?auto_389177 - BLOCK
      ?auto_389178 - BLOCK
      ?auto_389179 - BLOCK
    )
    :vars
    (
      ?auto_389180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389179 ?auto_389180 ) ( ON-TABLE ?auto_389168 ) ( ON ?auto_389169 ?auto_389168 ) ( ON ?auto_389170 ?auto_389169 ) ( ON ?auto_389171 ?auto_389170 ) ( ON ?auto_389172 ?auto_389171 ) ( not ( = ?auto_389168 ?auto_389169 ) ) ( not ( = ?auto_389168 ?auto_389170 ) ) ( not ( = ?auto_389168 ?auto_389171 ) ) ( not ( = ?auto_389168 ?auto_389172 ) ) ( not ( = ?auto_389168 ?auto_389173 ) ) ( not ( = ?auto_389168 ?auto_389174 ) ) ( not ( = ?auto_389168 ?auto_389175 ) ) ( not ( = ?auto_389168 ?auto_389176 ) ) ( not ( = ?auto_389168 ?auto_389177 ) ) ( not ( = ?auto_389168 ?auto_389178 ) ) ( not ( = ?auto_389168 ?auto_389179 ) ) ( not ( = ?auto_389168 ?auto_389180 ) ) ( not ( = ?auto_389169 ?auto_389170 ) ) ( not ( = ?auto_389169 ?auto_389171 ) ) ( not ( = ?auto_389169 ?auto_389172 ) ) ( not ( = ?auto_389169 ?auto_389173 ) ) ( not ( = ?auto_389169 ?auto_389174 ) ) ( not ( = ?auto_389169 ?auto_389175 ) ) ( not ( = ?auto_389169 ?auto_389176 ) ) ( not ( = ?auto_389169 ?auto_389177 ) ) ( not ( = ?auto_389169 ?auto_389178 ) ) ( not ( = ?auto_389169 ?auto_389179 ) ) ( not ( = ?auto_389169 ?auto_389180 ) ) ( not ( = ?auto_389170 ?auto_389171 ) ) ( not ( = ?auto_389170 ?auto_389172 ) ) ( not ( = ?auto_389170 ?auto_389173 ) ) ( not ( = ?auto_389170 ?auto_389174 ) ) ( not ( = ?auto_389170 ?auto_389175 ) ) ( not ( = ?auto_389170 ?auto_389176 ) ) ( not ( = ?auto_389170 ?auto_389177 ) ) ( not ( = ?auto_389170 ?auto_389178 ) ) ( not ( = ?auto_389170 ?auto_389179 ) ) ( not ( = ?auto_389170 ?auto_389180 ) ) ( not ( = ?auto_389171 ?auto_389172 ) ) ( not ( = ?auto_389171 ?auto_389173 ) ) ( not ( = ?auto_389171 ?auto_389174 ) ) ( not ( = ?auto_389171 ?auto_389175 ) ) ( not ( = ?auto_389171 ?auto_389176 ) ) ( not ( = ?auto_389171 ?auto_389177 ) ) ( not ( = ?auto_389171 ?auto_389178 ) ) ( not ( = ?auto_389171 ?auto_389179 ) ) ( not ( = ?auto_389171 ?auto_389180 ) ) ( not ( = ?auto_389172 ?auto_389173 ) ) ( not ( = ?auto_389172 ?auto_389174 ) ) ( not ( = ?auto_389172 ?auto_389175 ) ) ( not ( = ?auto_389172 ?auto_389176 ) ) ( not ( = ?auto_389172 ?auto_389177 ) ) ( not ( = ?auto_389172 ?auto_389178 ) ) ( not ( = ?auto_389172 ?auto_389179 ) ) ( not ( = ?auto_389172 ?auto_389180 ) ) ( not ( = ?auto_389173 ?auto_389174 ) ) ( not ( = ?auto_389173 ?auto_389175 ) ) ( not ( = ?auto_389173 ?auto_389176 ) ) ( not ( = ?auto_389173 ?auto_389177 ) ) ( not ( = ?auto_389173 ?auto_389178 ) ) ( not ( = ?auto_389173 ?auto_389179 ) ) ( not ( = ?auto_389173 ?auto_389180 ) ) ( not ( = ?auto_389174 ?auto_389175 ) ) ( not ( = ?auto_389174 ?auto_389176 ) ) ( not ( = ?auto_389174 ?auto_389177 ) ) ( not ( = ?auto_389174 ?auto_389178 ) ) ( not ( = ?auto_389174 ?auto_389179 ) ) ( not ( = ?auto_389174 ?auto_389180 ) ) ( not ( = ?auto_389175 ?auto_389176 ) ) ( not ( = ?auto_389175 ?auto_389177 ) ) ( not ( = ?auto_389175 ?auto_389178 ) ) ( not ( = ?auto_389175 ?auto_389179 ) ) ( not ( = ?auto_389175 ?auto_389180 ) ) ( not ( = ?auto_389176 ?auto_389177 ) ) ( not ( = ?auto_389176 ?auto_389178 ) ) ( not ( = ?auto_389176 ?auto_389179 ) ) ( not ( = ?auto_389176 ?auto_389180 ) ) ( not ( = ?auto_389177 ?auto_389178 ) ) ( not ( = ?auto_389177 ?auto_389179 ) ) ( not ( = ?auto_389177 ?auto_389180 ) ) ( not ( = ?auto_389178 ?auto_389179 ) ) ( not ( = ?auto_389178 ?auto_389180 ) ) ( not ( = ?auto_389179 ?auto_389180 ) ) ( ON ?auto_389178 ?auto_389179 ) ( ON ?auto_389177 ?auto_389178 ) ( ON ?auto_389176 ?auto_389177 ) ( ON ?auto_389175 ?auto_389176 ) ( ON ?auto_389174 ?auto_389175 ) ( CLEAR ?auto_389172 ) ( ON ?auto_389173 ?auto_389174 ) ( CLEAR ?auto_389173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389168 ?auto_389169 ?auto_389170 ?auto_389171 ?auto_389172 ?auto_389173 )
      ( MAKE-12PILE ?auto_389168 ?auto_389169 ?auto_389170 ?auto_389171 ?auto_389172 ?auto_389173 ?auto_389174 ?auto_389175 ?auto_389176 ?auto_389177 ?auto_389178 ?auto_389179 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389193 - BLOCK
      ?auto_389194 - BLOCK
      ?auto_389195 - BLOCK
      ?auto_389196 - BLOCK
      ?auto_389197 - BLOCK
      ?auto_389198 - BLOCK
      ?auto_389199 - BLOCK
      ?auto_389200 - BLOCK
      ?auto_389201 - BLOCK
      ?auto_389202 - BLOCK
      ?auto_389203 - BLOCK
      ?auto_389204 - BLOCK
    )
    :vars
    (
      ?auto_389205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389204 ?auto_389205 ) ( ON-TABLE ?auto_389193 ) ( ON ?auto_389194 ?auto_389193 ) ( ON ?auto_389195 ?auto_389194 ) ( ON ?auto_389196 ?auto_389195 ) ( ON ?auto_389197 ?auto_389196 ) ( not ( = ?auto_389193 ?auto_389194 ) ) ( not ( = ?auto_389193 ?auto_389195 ) ) ( not ( = ?auto_389193 ?auto_389196 ) ) ( not ( = ?auto_389193 ?auto_389197 ) ) ( not ( = ?auto_389193 ?auto_389198 ) ) ( not ( = ?auto_389193 ?auto_389199 ) ) ( not ( = ?auto_389193 ?auto_389200 ) ) ( not ( = ?auto_389193 ?auto_389201 ) ) ( not ( = ?auto_389193 ?auto_389202 ) ) ( not ( = ?auto_389193 ?auto_389203 ) ) ( not ( = ?auto_389193 ?auto_389204 ) ) ( not ( = ?auto_389193 ?auto_389205 ) ) ( not ( = ?auto_389194 ?auto_389195 ) ) ( not ( = ?auto_389194 ?auto_389196 ) ) ( not ( = ?auto_389194 ?auto_389197 ) ) ( not ( = ?auto_389194 ?auto_389198 ) ) ( not ( = ?auto_389194 ?auto_389199 ) ) ( not ( = ?auto_389194 ?auto_389200 ) ) ( not ( = ?auto_389194 ?auto_389201 ) ) ( not ( = ?auto_389194 ?auto_389202 ) ) ( not ( = ?auto_389194 ?auto_389203 ) ) ( not ( = ?auto_389194 ?auto_389204 ) ) ( not ( = ?auto_389194 ?auto_389205 ) ) ( not ( = ?auto_389195 ?auto_389196 ) ) ( not ( = ?auto_389195 ?auto_389197 ) ) ( not ( = ?auto_389195 ?auto_389198 ) ) ( not ( = ?auto_389195 ?auto_389199 ) ) ( not ( = ?auto_389195 ?auto_389200 ) ) ( not ( = ?auto_389195 ?auto_389201 ) ) ( not ( = ?auto_389195 ?auto_389202 ) ) ( not ( = ?auto_389195 ?auto_389203 ) ) ( not ( = ?auto_389195 ?auto_389204 ) ) ( not ( = ?auto_389195 ?auto_389205 ) ) ( not ( = ?auto_389196 ?auto_389197 ) ) ( not ( = ?auto_389196 ?auto_389198 ) ) ( not ( = ?auto_389196 ?auto_389199 ) ) ( not ( = ?auto_389196 ?auto_389200 ) ) ( not ( = ?auto_389196 ?auto_389201 ) ) ( not ( = ?auto_389196 ?auto_389202 ) ) ( not ( = ?auto_389196 ?auto_389203 ) ) ( not ( = ?auto_389196 ?auto_389204 ) ) ( not ( = ?auto_389196 ?auto_389205 ) ) ( not ( = ?auto_389197 ?auto_389198 ) ) ( not ( = ?auto_389197 ?auto_389199 ) ) ( not ( = ?auto_389197 ?auto_389200 ) ) ( not ( = ?auto_389197 ?auto_389201 ) ) ( not ( = ?auto_389197 ?auto_389202 ) ) ( not ( = ?auto_389197 ?auto_389203 ) ) ( not ( = ?auto_389197 ?auto_389204 ) ) ( not ( = ?auto_389197 ?auto_389205 ) ) ( not ( = ?auto_389198 ?auto_389199 ) ) ( not ( = ?auto_389198 ?auto_389200 ) ) ( not ( = ?auto_389198 ?auto_389201 ) ) ( not ( = ?auto_389198 ?auto_389202 ) ) ( not ( = ?auto_389198 ?auto_389203 ) ) ( not ( = ?auto_389198 ?auto_389204 ) ) ( not ( = ?auto_389198 ?auto_389205 ) ) ( not ( = ?auto_389199 ?auto_389200 ) ) ( not ( = ?auto_389199 ?auto_389201 ) ) ( not ( = ?auto_389199 ?auto_389202 ) ) ( not ( = ?auto_389199 ?auto_389203 ) ) ( not ( = ?auto_389199 ?auto_389204 ) ) ( not ( = ?auto_389199 ?auto_389205 ) ) ( not ( = ?auto_389200 ?auto_389201 ) ) ( not ( = ?auto_389200 ?auto_389202 ) ) ( not ( = ?auto_389200 ?auto_389203 ) ) ( not ( = ?auto_389200 ?auto_389204 ) ) ( not ( = ?auto_389200 ?auto_389205 ) ) ( not ( = ?auto_389201 ?auto_389202 ) ) ( not ( = ?auto_389201 ?auto_389203 ) ) ( not ( = ?auto_389201 ?auto_389204 ) ) ( not ( = ?auto_389201 ?auto_389205 ) ) ( not ( = ?auto_389202 ?auto_389203 ) ) ( not ( = ?auto_389202 ?auto_389204 ) ) ( not ( = ?auto_389202 ?auto_389205 ) ) ( not ( = ?auto_389203 ?auto_389204 ) ) ( not ( = ?auto_389203 ?auto_389205 ) ) ( not ( = ?auto_389204 ?auto_389205 ) ) ( ON ?auto_389203 ?auto_389204 ) ( ON ?auto_389202 ?auto_389203 ) ( ON ?auto_389201 ?auto_389202 ) ( ON ?auto_389200 ?auto_389201 ) ( ON ?auto_389199 ?auto_389200 ) ( CLEAR ?auto_389197 ) ( ON ?auto_389198 ?auto_389199 ) ( CLEAR ?auto_389198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389193 ?auto_389194 ?auto_389195 ?auto_389196 ?auto_389197 ?auto_389198 )
      ( MAKE-12PILE ?auto_389193 ?auto_389194 ?auto_389195 ?auto_389196 ?auto_389197 ?auto_389198 ?auto_389199 ?auto_389200 ?auto_389201 ?auto_389202 ?auto_389203 ?auto_389204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389218 - BLOCK
      ?auto_389219 - BLOCK
      ?auto_389220 - BLOCK
      ?auto_389221 - BLOCK
      ?auto_389222 - BLOCK
      ?auto_389223 - BLOCK
      ?auto_389224 - BLOCK
      ?auto_389225 - BLOCK
      ?auto_389226 - BLOCK
      ?auto_389227 - BLOCK
      ?auto_389228 - BLOCK
      ?auto_389229 - BLOCK
    )
    :vars
    (
      ?auto_389230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389229 ?auto_389230 ) ( ON-TABLE ?auto_389218 ) ( ON ?auto_389219 ?auto_389218 ) ( ON ?auto_389220 ?auto_389219 ) ( ON ?auto_389221 ?auto_389220 ) ( not ( = ?auto_389218 ?auto_389219 ) ) ( not ( = ?auto_389218 ?auto_389220 ) ) ( not ( = ?auto_389218 ?auto_389221 ) ) ( not ( = ?auto_389218 ?auto_389222 ) ) ( not ( = ?auto_389218 ?auto_389223 ) ) ( not ( = ?auto_389218 ?auto_389224 ) ) ( not ( = ?auto_389218 ?auto_389225 ) ) ( not ( = ?auto_389218 ?auto_389226 ) ) ( not ( = ?auto_389218 ?auto_389227 ) ) ( not ( = ?auto_389218 ?auto_389228 ) ) ( not ( = ?auto_389218 ?auto_389229 ) ) ( not ( = ?auto_389218 ?auto_389230 ) ) ( not ( = ?auto_389219 ?auto_389220 ) ) ( not ( = ?auto_389219 ?auto_389221 ) ) ( not ( = ?auto_389219 ?auto_389222 ) ) ( not ( = ?auto_389219 ?auto_389223 ) ) ( not ( = ?auto_389219 ?auto_389224 ) ) ( not ( = ?auto_389219 ?auto_389225 ) ) ( not ( = ?auto_389219 ?auto_389226 ) ) ( not ( = ?auto_389219 ?auto_389227 ) ) ( not ( = ?auto_389219 ?auto_389228 ) ) ( not ( = ?auto_389219 ?auto_389229 ) ) ( not ( = ?auto_389219 ?auto_389230 ) ) ( not ( = ?auto_389220 ?auto_389221 ) ) ( not ( = ?auto_389220 ?auto_389222 ) ) ( not ( = ?auto_389220 ?auto_389223 ) ) ( not ( = ?auto_389220 ?auto_389224 ) ) ( not ( = ?auto_389220 ?auto_389225 ) ) ( not ( = ?auto_389220 ?auto_389226 ) ) ( not ( = ?auto_389220 ?auto_389227 ) ) ( not ( = ?auto_389220 ?auto_389228 ) ) ( not ( = ?auto_389220 ?auto_389229 ) ) ( not ( = ?auto_389220 ?auto_389230 ) ) ( not ( = ?auto_389221 ?auto_389222 ) ) ( not ( = ?auto_389221 ?auto_389223 ) ) ( not ( = ?auto_389221 ?auto_389224 ) ) ( not ( = ?auto_389221 ?auto_389225 ) ) ( not ( = ?auto_389221 ?auto_389226 ) ) ( not ( = ?auto_389221 ?auto_389227 ) ) ( not ( = ?auto_389221 ?auto_389228 ) ) ( not ( = ?auto_389221 ?auto_389229 ) ) ( not ( = ?auto_389221 ?auto_389230 ) ) ( not ( = ?auto_389222 ?auto_389223 ) ) ( not ( = ?auto_389222 ?auto_389224 ) ) ( not ( = ?auto_389222 ?auto_389225 ) ) ( not ( = ?auto_389222 ?auto_389226 ) ) ( not ( = ?auto_389222 ?auto_389227 ) ) ( not ( = ?auto_389222 ?auto_389228 ) ) ( not ( = ?auto_389222 ?auto_389229 ) ) ( not ( = ?auto_389222 ?auto_389230 ) ) ( not ( = ?auto_389223 ?auto_389224 ) ) ( not ( = ?auto_389223 ?auto_389225 ) ) ( not ( = ?auto_389223 ?auto_389226 ) ) ( not ( = ?auto_389223 ?auto_389227 ) ) ( not ( = ?auto_389223 ?auto_389228 ) ) ( not ( = ?auto_389223 ?auto_389229 ) ) ( not ( = ?auto_389223 ?auto_389230 ) ) ( not ( = ?auto_389224 ?auto_389225 ) ) ( not ( = ?auto_389224 ?auto_389226 ) ) ( not ( = ?auto_389224 ?auto_389227 ) ) ( not ( = ?auto_389224 ?auto_389228 ) ) ( not ( = ?auto_389224 ?auto_389229 ) ) ( not ( = ?auto_389224 ?auto_389230 ) ) ( not ( = ?auto_389225 ?auto_389226 ) ) ( not ( = ?auto_389225 ?auto_389227 ) ) ( not ( = ?auto_389225 ?auto_389228 ) ) ( not ( = ?auto_389225 ?auto_389229 ) ) ( not ( = ?auto_389225 ?auto_389230 ) ) ( not ( = ?auto_389226 ?auto_389227 ) ) ( not ( = ?auto_389226 ?auto_389228 ) ) ( not ( = ?auto_389226 ?auto_389229 ) ) ( not ( = ?auto_389226 ?auto_389230 ) ) ( not ( = ?auto_389227 ?auto_389228 ) ) ( not ( = ?auto_389227 ?auto_389229 ) ) ( not ( = ?auto_389227 ?auto_389230 ) ) ( not ( = ?auto_389228 ?auto_389229 ) ) ( not ( = ?auto_389228 ?auto_389230 ) ) ( not ( = ?auto_389229 ?auto_389230 ) ) ( ON ?auto_389228 ?auto_389229 ) ( ON ?auto_389227 ?auto_389228 ) ( ON ?auto_389226 ?auto_389227 ) ( ON ?auto_389225 ?auto_389226 ) ( ON ?auto_389224 ?auto_389225 ) ( ON ?auto_389223 ?auto_389224 ) ( CLEAR ?auto_389221 ) ( ON ?auto_389222 ?auto_389223 ) ( CLEAR ?auto_389222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389218 ?auto_389219 ?auto_389220 ?auto_389221 ?auto_389222 )
      ( MAKE-12PILE ?auto_389218 ?auto_389219 ?auto_389220 ?auto_389221 ?auto_389222 ?auto_389223 ?auto_389224 ?auto_389225 ?auto_389226 ?auto_389227 ?auto_389228 ?auto_389229 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389243 - BLOCK
      ?auto_389244 - BLOCK
      ?auto_389245 - BLOCK
      ?auto_389246 - BLOCK
      ?auto_389247 - BLOCK
      ?auto_389248 - BLOCK
      ?auto_389249 - BLOCK
      ?auto_389250 - BLOCK
      ?auto_389251 - BLOCK
      ?auto_389252 - BLOCK
      ?auto_389253 - BLOCK
      ?auto_389254 - BLOCK
    )
    :vars
    (
      ?auto_389255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389254 ?auto_389255 ) ( ON-TABLE ?auto_389243 ) ( ON ?auto_389244 ?auto_389243 ) ( ON ?auto_389245 ?auto_389244 ) ( ON ?auto_389246 ?auto_389245 ) ( not ( = ?auto_389243 ?auto_389244 ) ) ( not ( = ?auto_389243 ?auto_389245 ) ) ( not ( = ?auto_389243 ?auto_389246 ) ) ( not ( = ?auto_389243 ?auto_389247 ) ) ( not ( = ?auto_389243 ?auto_389248 ) ) ( not ( = ?auto_389243 ?auto_389249 ) ) ( not ( = ?auto_389243 ?auto_389250 ) ) ( not ( = ?auto_389243 ?auto_389251 ) ) ( not ( = ?auto_389243 ?auto_389252 ) ) ( not ( = ?auto_389243 ?auto_389253 ) ) ( not ( = ?auto_389243 ?auto_389254 ) ) ( not ( = ?auto_389243 ?auto_389255 ) ) ( not ( = ?auto_389244 ?auto_389245 ) ) ( not ( = ?auto_389244 ?auto_389246 ) ) ( not ( = ?auto_389244 ?auto_389247 ) ) ( not ( = ?auto_389244 ?auto_389248 ) ) ( not ( = ?auto_389244 ?auto_389249 ) ) ( not ( = ?auto_389244 ?auto_389250 ) ) ( not ( = ?auto_389244 ?auto_389251 ) ) ( not ( = ?auto_389244 ?auto_389252 ) ) ( not ( = ?auto_389244 ?auto_389253 ) ) ( not ( = ?auto_389244 ?auto_389254 ) ) ( not ( = ?auto_389244 ?auto_389255 ) ) ( not ( = ?auto_389245 ?auto_389246 ) ) ( not ( = ?auto_389245 ?auto_389247 ) ) ( not ( = ?auto_389245 ?auto_389248 ) ) ( not ( = ?auto_389245 ?auto_389249 ) ) ( not ( = ?auto_389245 ?auto_389250 ) ) ( not ( = ?auto_389245 ?auto_389251 ) ) ( not ( = ?auto_389245 ?auto_389252 ) ) ( not ( = ?auto_389245 ?auto_389253 ) ) ( not ( = ?auto_389245 ?auto_389254 ) ) ( not ( = ?auto_389245 ?auto_389255 ) ) ( not ( = ?auto_389246 ?auto_389247 ) ) ( not ( = ?auto_389246 ?auto_389248 ) ) ( not ( = ?auto_389246 ?auto_389249 ) ) ( not ( = ?auto_389246 ?auto_389250 ) ) ( not ( = ?auto_389246 ?auto_389251 ) ) ( not ( = ?auto_389246 ?auto_389252 ) ) ( not ( = ?auto_389246 ?auto_389253 ) ) ( not ( = ?auto_389246 ?auto_389254 ) ) ( not ( = ?auto_389246 ?auto_389255 ) ) ( not ( = ?auto_389247 ?auto_389248 ) ) ( not ( = ?auto_389247 ?auto_389249 ) ) ( not ( = ?auto_389247 ?auto_389250 ) ) ( not ( = ?auto_389247 ?auto_389251 ) ) ( not ( = ?auto_389247 ?auto_389252 ) ) ( not ( = ?auto_389247 ?auto_389253 ) ) ( not ( = ?auto_389247 ?auto_389254 ) ) ( not ( = ?auto_389247 ?auto_389255 ) ) ( not ( = ?auto_389248 ?auto_389249 ) ) ( not ( = ?auto_389248 ?auto_389250 ) ) ( not ( = ?auto_389248 ?auto_389251 ) ) ( not ( = ?auto_389248 ?auto_389252 ) ) ( not ( = ?auto_389248 ?auto_389253 ) ) ( not ( = ?auto_389248 ?auto_389254 ) ) ( not ( = ?auto_389248 ?auto_389255 ) ) ( not ( = ?auto_389249 ?auto_389250 ) ) ( not ( = ?auto_389249 ?auto_389251 ) ) ( not ( = ?auto_389249 ?auto_389252 ) ) ( not ( = ?auto_389249 ?auto_389253 ) ) ( not ( = ?auto_389249 ?auto_389254 ) ) ( not ( = ?auto_389249 ?auto_389255 ) ) ( not ( = ?auto_389250 ?auto_389251 ) ) ( not ( = ?auto_389250 ?auto_389252 ) ) ( not ( = ?auto_389250 ?auto_389253 ) ) ( not ( = ?auto_389250 ?auto_389254 ) ) ( not ( = ?auto_389250 ?auto_389255 ) ) ( not ( = ?auto_389251 ?auto_389252 ) ) ( not ( = ?auto_389251 ?auto_389253 ) ) ( not ( = ?auto_389251 ?auto_389254 ) ) ( not ( = ?auto_389251 ?auto_389255 ) ) ( not ( = ?auto_389252 ?auto_389253 ) ) ( not ( = ?auto_389252 ?auto_389254 ) ) ( not ( = ?auto_389252 ?auto_389255 ) ) ( not ( = ?auto_389253 ?auto_389254 ) ) ( not ( = ?auto_389253 ?auto_389255 ) ) ( not ( = ?auto_389254 ?auto_389255 ) ) ( ON ?auto_389253 ?auto_389254 ) ( ON ?auto_389252 ?auto_389253 ) ( ON ?auto_389251 ?auto_389252 ) ( ON ?auto_389250 ?auto_389251 ) ( ON ?auto_389249 ?auto_389250 ) ( ON ?auto_389248 ?auto_389249 ) ( CLEAR ?auto_389246 ) ( ON ?auto_389247 ?auto_389248 ) ( CLEAR ?auto_389247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389243 ?auto_389244 ?auto_389245 ?auto_389246 ?auto_389247 )
      ( MAKE-12PILE ?auto_389243 ?auto_389244 ?auto_389245 ?auto_389246 ?auto_389247 ?auto_389248 ?auto_389249 ?auto_389250 ?auto_389251 ?auto_389252 ?auto_389253 ?auto_389254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389268 - BLOCK
      ?auto_389269 - BLOCK
      ?auto_389270 - BLOCK
      ?auto_389271 - BLOCK
      ?auto_389272 - BLOCK
      ?auto_389273 - BLOCK
      ?auto_389274 - BLOCK
      ?auto_389275 - BLOCK
      ?auto_389276 - BLOCK
      ?auto_389277 - BLOCK
      ?auto_389278 - BLOCK
      ?auto_389279 - BLOCK
    )
    :vars
    (
      ?auto_389280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389279 ?auto_389280 ) ( ON-TABLE ?auto_389268 ) ( ON ?auto_389269 ?auto_389268 ) ( ON ?auto_389270 ?auto_389269 ) ( not ( = ?auto_389268 ?auto_389269 ) ) ( not ( = ?auto_389268 ?auto_389270 ) ) ( not ( = ?auto_389268 ?auto_389271 ) ) ( not ( = ?auto_389268 ?auto_389272 ) ) ( not ( = ?auto_389268 ?auto_389273 ) ) ( not ( = ?auto_389268 ?auto_389274 ) ) ( not ( = ?auto_389268 ?auto_389275 ) ) ( not ( = ?auto_389268 ?auto_389276 ) ) ( not ( = ?auto_389268 ?auto_389277 ) ) ( not ( = ?auto_389268 ?auto_389278 ) ) ( not ( = ?auto_389268 ?auto_389279 ) ) ( not ( = ?auto_389268 ?auto_389280 ) ) ( not ( = ?auto_389269 ?auto_389270 ) ) ( not ( = ?auto_389269 ?auto_389271 ) ) ( not ( = ?auto_389269 ?auto_389272 ) ) ( not ( = ?auto_389269 ?auto_389273 ) ) ( not ( = ?auto_389269 ?auto_389274 ) ) ( not ( = ?auto_389269 ?auto_389275 ) ) ( not ( = ?auto_389269 ?auto_389276 ) ) ( not ( = ?auto_389269 ?auto_389277 ) ) ( not ( = ?auto_389269 ?auto_389278 ) ) ( not ( = ?auto_389269 ?auto_389279 ) ) ( not ( = ?auto_389269 ?auto_389280 ) ) ( not ( = ?auto_389270 ?auto_389271 ) ) ( not ( = ?auto_389270 ?auto_389272 ) ) ( not ( = ?auto_389270 ?auto_389273 ) ) ( not ( = ?auto_389270 ?auto_389274 ) ) ( not ( = ?auto_389270 ?auto_389275 ) ) ( not ( = ?auto_389270 ?auto_389276 ) ) ( not ( = ?auto_389270 ?auto_389277 ) ) ( not ( = ?auto_389270 ?auto_389278 ) ) ( not ( = ?auto_389270 ?auto_389279 ) ) ( not ( = ?auto_389270 ?auto_389280 ) ) ( not ( = ?auto_389271 ?auto_389272 ) ) ( not ( = ?auto_389271 ?auto_389273 ) ) ( not ( = ?auto_389271 ?auto_389274 ) ) ( not ( = ?auto_389271 ?auto_389275 ) ) ( not ( = ?auto_389271 ?auto_389276 ) ) ( not ( = ?auto_389271 ?auto_389277 ) ) ( not ( = ?auto_389271 ?auto_389278 ) ) ( not ( = ?auto_389271 ?auto_389279 ) ) ( not ( = ?auto_389271 ?auto_389280 ) ) ( not ( = ?auto_389272 ?auto_389273 ) ) ( not ( = ?auto_389272 ?auto_389274 ) ) ( not ( = ?auto_389272 ?auto_389275 ) ) ( not ( = ?auto_389272 ?auto_389276 ) ) ( not ( = ?auto_389272 ?auto_389277 ) ) ( not ( = ?auto_389272 ?auto_389278 ) ) ( not ( = ?auto_389272 ?auto_389279 ) ) ( not ( = ?auto_389272 ?auto_389280 ) ) ( not ( = ?auto_389273 ?auto_389274 ) ) ( not ( = ?auto_389273 ?auto_389275 ) ) ( not ( = ?auto_389273 ?auto_389276 ) ) ( not ( = ?auto_389273 ?auto_389277 ) ) ( not ( = ?auto_389273 ?auto_389278 ) ) ( not ( = ?auto_389273 ?auto_389279 ) ) ( not ( = ?auto_389273 ?auto_389280 ) ) ( not ( = ?auto_389274 ?auto_389275 ) ) ( not ( = ?auto_389274 ?auto_389276 ) ) ( not ( = ?auto_389274 ?auto_389277 ) ) ( not ( = ?auto_389274 ?auto_389278 ) ) ( not ( = ?auto_389274 ?auto_389279 ) ) ( not ( = ?auto_389274 ?auto_389280 ) ) ( not ( = ?auto_389275 ?auto_389276 ) ) ( not ( = ?auto_389275 ?auto_389277 ) ) ( not ( = ?auto_389275 ?auto_389278 ) ) ( not ( = ?auto_389275 ?auto_389279 ) ) ( not ( = ?auto_389275 ?auto_389280 ) ) ( not ( = ?auto_389276 ?auto_389277 ) ) ( not ( = ?auto_389276 ?auto_389278 ) ) ( not ( = ?auto_389276 ?auto_389279 ) ) ( not ( = ?auto_389276 ?auto_389280 ) ) ( not ( = ?auto_389277 ?auto_389278 ) ) ( not ( = ?auto_389277 ?auto_389279 ) ) ( not ( = ?auto_389277 ?auto_389280 ) ) ( not ( = ?auto_389278 ?auto_389279 ) ) ( not ( = ?auto_389278 ?auto_389280 ) ) ( not ( = ?auto_389279 ?auto_389280 ) ) ( ON ?auto_389278 ?auto_389279 ) ( ON ?auto_389277 ?auto_389278 ) ( ON ?auto_389276 ?auto_389277 ) ( ON ?auto_389275 ?auto_389276 ) ( ON ?auto_389274 ?auto_389275 ) ( ON ?auto_389273 ?auto_389274 ) ( ON ?auto_389272 ?auto_389273 ) ( CLEAR ?auto_389270 ) ( ON ?auto_389271 ?auto_389272 ) ( CLEAR ?auto_389271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389268 ?auto_389269 ?auto_389270 ?auto_389271 )
      ( MAKE-12PILE ?auto_389268 ?auto_389269 ?auto_389270 ?auto_389271 ?auto_389272 ?auto_389273 ?auto_389274 ?auto_389275 ?auto_389276 ?auto_389277 ?auto_389278 ?auto_389279 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389293 - BLOCK
      ?auto_389294 - BLOCK
      ?auto_389295 - BLOCK
      ?auto_389296 - BLOCK
      ?auto_389297 - BLOCK
      ?auto_389298 - BLOCK
      ?auto_389299 - BLOCK
      ?auto_389300 - BLOCK
      ?auto_389301 - BLOCK
      ?auto_389302 - BLOCK
      ?auto_389303 - BLOCK
      ?auto_389304 - BLOCK
    )
    :vars
    (
      ?auto_389305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389304 ?auto_389305 ) ( ON-TABLE ?auto_389293 ) ( ON ?auto_389294 ?auto_389293 ) ( ON ?auto_389295 ?auto_389294 ) ( not ( = ?auto_389293 ?auto_389294 ) ) ( not ( = ?auto_389293 ?auto_389295 ) ) ( not ( = ?auto_389293 ?auto_389296 ) ) ( not ( = ?auto_389293 ?auto_389297 ) ) ( not ( = ?auto_389293 ?auto_389298 ) ) ( not ( = ?auto_389293 ?auto_389299 ) ) ( not ( = ?auto_389293 ?auto_389300 ) ) ( not ( = ?auto_389293 ?auto_389301 ) ) ( not ( = ?auto_389293 ?auto_389302 ) ) ( not ( = ?auto_389293 ?auto_389303 ) ) ( not ( = ?auto_389293 ?auto_389304 ) ) ( not ( = ?auto_389293 ?auto_389305 ) ) ( not ( = ?auto_389294 ?auto_389295 ) ) ( not ( = ?auto_389294 ?auto_389296 ) ) ( not ( = ?auto_389294 ?auto_389297 ) ) ( not ( = ?auto_389294 ?auto_389298 ) ) ( not ( = ?auto_389294 ?auto_389299 ) ) ( not ( = ?auto_389294 ?auto_389300 ) ) ( not ( = ?auto_389294 ?auto_389301 ) ) ( not ( = ?auto_389294 ?auto_389302 ) ) ( not ( = ?auto_389294 ?auto_389303 ) ) ( not ( = ?auto_389294 ?auto_389304 ) ) ( not ( = ?auto_389294 ?auto_389305 ) ) ( not ( = ?auto_389295 ?auto_389296 ) ) ( not ( = ?auto_389295 ?auto_389297 ) ) ( not ( = ?auto_389295 ?auto_389298 ) ) ( not ( = ?auto_389295 ?auto_389299 ) ) ( not ( = ?auto_389295 ?auto_389300 ) ) ( not ( = ?auto_389295 ?auto_389301 ) ) ( not ( = ?auto_389295 ?auto_389302 ) ) ( not ( = ?auto_389295 ?auto_389303 ) ) ( not ( = ?auto_389295 ?auto_389304 ) ) ( not ( = ?auto_389295 ?auto_389305 ) ) ( not ( = ?auto_389296 ?auto_389297 ) ) ( not ( = ?auto_389296 ?auto_389298 ) ) ( not ( = ?auto_389296 ?auto_389299 ) ) ( not ( = ?auto_389296 ?auto_389300 ) ) ( not ( = ?auto_389296 ?auto_389301 ) ) ( not ( = ?auto_389296 ?auto_389302 ) ) ( not ( = ?auto_389296 ?auto_389303 ) ) ( not ( = ?auto_389296 ?auto_389304 ) ) ( not ( = ?auto_389296 ?auto_389305 ) ) ( not ( = ?auto_389297 ?auto_389298 ) ) ( not ( = ?auto_389297 ?auto_389299 ) ) ( not ( = ?auto_389297 ?auto_389300 ) ) ( not ( = ?auto_389297 ?auto_389301 ) ) ( not ( = ?auto_389297 ?auto_389302 ) ) ( not ( = ?auto_389297 ?auto_389303 ) ) ( not ( = ?auto_389297 ?auto_389304 ) ) ( not ( = ?auto_389297 ?auto_389305 ) ) ( not ( = ?auto_389298 ?auto_389299 ) ) ( not ( = ?auto_389298 ?auto_389300 ) ) ( not ( = ?auto_389298 ?auto_389301 ) ) ( not ( = ?auto_389298 ?auto_389302 ) ) ( not ( = ?auto_389298 ?auto_389303 ) ) ( not ( = ?auto_389298 ?auto_389304 ) ) ( not ( = ?auto_389298 ?auto_389305 ) ) ( not ( = ?auto_389299 ?auto_389300 ) ) ( not ( = ?auto_389299 ?auto_389301 ) ) ( not ( = ?auto_389299 ?auto_389302 ) ) ( not ( = ?auto_389299 ?auto_389303 ) ) ( not ( = ?auto_389299 ?auto_389304 ) ) ( not ( = ?auto_389299 ?auto_389305 ) ) ( not ( = ?auto_389300 ?auto_389301 ) ) ( not ( = ?auto_389300 ?auto_389302 ) ) ( not ( = ?auto_389300 ?auto_389303 ) ) ( not ( = ?auto_389300 ?auto_389304 ) ) ( not ( = ?auto_389300 ?auto_389305 ) ) ( not ( = ?auto_389301 ?auto_389302 ) ) ( not ( = ?auto_389301 ?auto_389303 ) ) ( not ( = ?auto_389301 ?auto_389304 ) ) ( not ( = ?auto_389301 ?auto_389305 ) ) ( not ( = ?auto_389302 ?auto_389303 ) ) ( not ( = ?auto_389302 ?auto_389304 ) ) ( not ( = ?auto_389302 ?auto_389305 ) ) ( not ( = ?auto_389303 ?auto_389304 ) ) ( not ( = ?auto_389303 ?auto_389305 ) ) ( not ( = ?auto_389304 ?auto_389305 ) ) ( ON ?auto_389303 ?auto_389304 ) ( ON ?auto_389302 ?auto_389303 ) ( ON ?auto_389301 ?auto_389302 ) ( ON ?auto_389300 ?auto_389301 ) ( ON ?auto_389299 ?auto_389300 ) ( ON ?auto_389298 ?auto_389299 ) ( ON ?auto_389297 ?auto_389298 ) ( CLEAR ?auto_389295 ) ( ON ?auto_389296 ?auto_389297 ) ( CLEAR ?auto_389296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389293 ?auto_389294 ?auto_389295 ?auto_389296 )
      ( MAKE-12PILE ?auto_389293 ?auto_389294 ?auto_389295 ?auto_389296 ?auto_389297 ?auto_389298 ?auto_389299 ?auto_389300 ?auto_389301 ?auto_389302 ?auto_389303 ?auto_389304 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389318 - BLOCK
      ?auto_389319 - BLOCK
      ?auto_389320 - BLOCK
      ?auto_389321 - BLOCK
      ?auto_389322 - BLOCK
      ?auto_389323 - BLOCK
      ?auto_389324 - BLOCK
      ?auto_389325 - BLOCK
      ?auto_389326 - BLOCK
      ?auto_389327 - BLOCK
      ?auto_389328 - BLOCK
      ?auto_389329 - BLOCK
    )
    :vars
    (
      ?auto_389330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389329 ?auto_389330 ) ( ON-TABLE ?auto_389318 ) ( ON ?auto_389319 ?auto_389318 ) ( not ( = ?auto_389318 ?auto_389319 ) ) ( not ( = ?auto_389318 ?auto_389320 ) ) ( not ( = ?auto_389318 ?auto_389321 ) ) ( not ( = ?auto_389318 ?auto_389322 ) ) ( not ( = ?auto_389318 ?auto_389323 ) ) ( not ( = ?auto_389318 ?auto_389324 ) ) ( not ( = ?auto_389318 ?auto_389325 ) ) ( not ( = ?auto_389318 ?auto_389326 ) ) ( not ( = ?auto_389318 ?auto_389327 ) ) ( not ( = ?auto_389318 ?auto_389328 ) ) ( not ( = ?auto_389318 ?auto_389329 ) ) ( not ( = ?auto_389318 ?auto_389330 ) ) ( not ( = ?auto_389319 ?auto_389320 ) ) ( not ( = ?auto_389319 ?auto_389321 ) ) ( not ( = ?auto_389319 ?auto_389322 ) ) ( not ( = ?auto_389319 ?auto_389323 ) ) ( not ( = ?auto_389319 ?auto_389324 ) ) ( not ( = ?auto_389319 ?auto_389325 ) ) ( not ( = ?auto_389319 ?auto_389326 ) ) ( not ( = ?auto_389319 ?auto_389327 ) ) ( not ( = ?auto_389319 ?auto_389328 ) ) ( not ( = ?auto_389319 ?auto_389329 ) ) ( not ( = ?auto_389319 ?auto_389330 ) ) ( not ( = ?auto_389320 ?auto_389321 ) ) ( not ( = ?auto_389320 ?auto_389322 ) ) ( not ( = ?auto_389320 ?auto_389323 ) ) ( not ( = ?auto_389320 ?auto_389324 ) ) ( not ( = ?auto_389320 ?auto_389325 ) ) ( not ( = ?auto_389320 ?auto_389326 ) ) ( not ( = ?auto_389320 ?auto_389327 ) ) ( not ( = ?auto_389320 ?auto_389328 ) ) ( not ( = ?auto_389320 ?auto_389329 ) ) ( not ( = ?auto_389320 ?auto_389330 ) ) ( not ( = ?auto_389321 ?auto_389322 ) ) ( not ( = ?auto_389321 ?auto_389323 ) ) ( not ( = ?auto_389321 ?auto_389324 ) ) ( not ( = ?auto_389321 ?auto_389325 ) ) ( not ( = ?auto_389321 ?auto_389326 ) ) ( not ( = ?auto_389321 ?auto_389327 ) ) ( not ( = ?auto_389321 ?auto_389328 ) ) ( not ( = ?auto_389321 ?auto_389329 ) ) ( not ( = ?auto_389321 ?auto_389330 ) ) ( not ( = ?auto_389322 ?auto_389323 ) ) ( not ( = ?auto_389322 ?auto_389324 ) ) ( not ( = ?auto_389322 ?auto_389325 ) ) ( not ( = ?auto_389322 ?auto_389326 ) ) ( not ( = ?auto_389322 ?auto_389327 ) ) ( not ( = ?auto_389322 ?auto_389328 ) ) ( not ( = ?auto_389322 ?auto_389329 ) ) ( not ( = ?auto_389322 ?auto_389330 ) ) ( not ( = ?auto_389323 ?auto_389324 ) ) ( not ( = ?auto_389323 ?auto_389325 ) ) ( not ( = ?auto_389323 ?auto_389326 ) ) ( not ( = ?auto_389323 ?auto_389327 ) ) ( not ( = ?auto_389323 ?auto_389328 ) ) ( not ( = ?auto_389323 ?auto_389329 ) ) ( not ( = ?auto_389323 ?auto_389330 ) ) ( not ( = ?auto_389324 ?auto_389325 ) ) ( not ( = ?auto_389324 ?auto_389326 ) ) ( not ( = ?auto_389324 ?auto_389327 ) ) ( not ( = ?auto_389324 ?auto_389328 ) ) ( not ( = ?auto_389324 ?auto_389329 ) ) ( not ( = ?auto_389324 ?auto_389330 ) ) ( not ( = ?auto_389325 ?auto_389326 ) ) ( not ( = ?auto_389325 ?auto_389327 ) ) ( not ( = ?auto_389325 ?auto_389328 ) ) ( not ( = ?auto_389325 ?auto_389329 ) ) ( not ( = ?auto_389325 ?auto_389330 ) ) ( not ( = ?auto_389326 ?auto_389327 ) ) ( not ( = ?auto_389326 ?auto_389328 ) ) ( not ( = ?auto_389326 ?auto_389329 ) ) ( not ( = ?auto_389326 ?auto_389330 ) ) ( not ( = ?auto_389327 ?auto_389328 ) ) ( not ( = ?auto_389327 ?auto_389329 ) ) ( not ( = ?auto_389327 ?auto_389330 ) ) ( not ( = ?auto_389328 ?auto_389329 ) ) ( not ( = ?auto_389328 ?auto_389330 ) ) ( not ( = ?auto_389329 ?auto_389330 ) ) ( ON ?auto_389328 ?auto_389329 ) ( ON ?auto_389327 ?auto_389328 ) ( ON ?auto_389326 ?auto_389327 ) ( ON ?auto_389325 ?auto_389326 ) ( ON ?auto_389324 ?auto_389325 ) ( ON ?auto_389323 ?auto_389324 ) ( ON ?auto_389322 ?auto_389323 ) ( ON ?auto_389321 ?auto_389322 ) ( CLEAR ?auto_389319 ) ( ON ?auto_389320 ?auto_389321 ) ( CLEAR ?auto_389320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_389318 ?auto_389319 ?auto_389320 )
      ( MAKE-12PILE ?auto_389318 ?auto_389319 ?auto_389320 ?auto_389321 ?auto_389322 ?auto_389323 ?auto_389324 ?auto_389325 ?auto_389326 ?auto_389327 ?auto_389328 ?auto_389329 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389343 - BLOCK
      ?auto_389344 - BLOCK
      ?auto_389345 - BLOCK
      ?auto_389346 - BLOCK
      ?auto_389347 - BLOCK
      ?auto_389348 - BLOCK
      ?auto_389349 - BLOCK
      ?auto_389350 - BLOCK
      ?auto_389351 - BLOCK
      ?auto_389352 - BLOCK
      ?auto_389353 - BLOCK
      ?auto_389354 - BLOCK
    )
    :vars
    (
      ?auto_389355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389354 ?auto_389355 ) ( ON-TABLE ?auto_389343 ) ( ON ?auto_389344 ?auto_389343 ) ( not ( = ?auto_389343 ?auto_389344 ) ) ( not ( = ?auto_389343 ?auto_389345 ) ) ( not ( = ?auto_389343 ?auto_389346 ) ) ( not ( = ?auto_389343 ?auto_389347 ) ) ( not ( = ?auto_389343 ?auto_389348 ) ) ( not ( = ?auto_389343 ?auto_389349 ) ) ( not ( = ?auto_389343 ?auto_389350 ) ) ( not ( = ?auto_389343 ?auto_389351 ) ) ( not ( = ?auto_389343 ?auto_389352 ) ) ( not ( = ?auto_389343 ?auto_389353 ) ) ( not ( = ?auto_389343 ?auto_389354 ) ) ( not ( = ?auto_389343 ?auto_389355 ) ) ( not ( = ?auto_389344 ?auto_389345 ) ) ( not ( = ?auto_389344 ?auto_389346 ) ) ( not ( = ?auto_389344 ?auto_389347 ) ) ( not ( = ?auto_389344 ?auto_389348 ) ) ( not ( = ?auto_389344 ?auto_389349 ) ) ( not ( = ?auto_389344 ?auto_389350 ) ) ( not ( = ?auto_389344 ?auto_389351 ) ) ( not ( = ?auto_389344 ?auto_389352 ) ) ( not ( = ?auto_389344 ?auto_389353 ) ) ( not ( = ?auto_389344 ?auto_389354 ) ) ( not ( = ?auto_389344 ?auto_389355 ) ) ( not ( = ?auto_389345 ?auto_389346 ) ) ( not ( = ?auto_389345 ?auto_389347 ) ) ( not ( = ?auto_389345 ?auto_389348 ) ) ( not ( = ?auto_389345 ?auto_389349 ) ) ( not ( = ?auto_389345 ?auto_389350 ) ) ( not ( = ?auto_389345 ?auto_389351 ) ) ( not ( = ?auto_389345 ?auto_389352 ) ) ( not ( = ?auto_389345 ?auto_389353 ) ) ( not ( = ?auto_389345 ?auto_389354 ) ) ( not ( = ?auto_389345 ?auto_389355 ) ) ( not ( = ?auto_389346 ?auto_389347 ) ) ( not ( = ?auto_389346 ?auto_389348 ) ) ( not ( = ?auto_389346 ?auto_389349 ) ) ( not ( = ?auto_389346 ?auto_389350 ) ) ( not ( = ?auto_389346 ?auto_389351 ) ) ( not ( = ?auto_389346 ?auto_389352 ) ) ( not ( = ?auto_389346 ?auto_389353 ) ) ( not ( = ?auto_389346 ?auto_389354 ) ) ( not ( = ?auto_389346 ?auto_389355 ) ) ( not ( = ?auto_389347 ?auto_389348 ) ) ( not ( = ?auto_389347 ?auto_389349 ) ) ( not ( = ?auto_389347 ?auto_389350 ) ) ( not ( = ?auto_389347 ?auto_389351 ) ) ( not ( = ?auto_389347 ?auto_389352 ) ) ( not ( = ?auto_389347 ?auto_389353 ) ) ( not ( = ?auto_389347 ?auto_389354 ) ) ( not ( = ?auto_389347 ?auto_389355 ) ) ( not ( = ?auto_389348 ?auto_389349 ) ) ( not ( = ?auto_389348 ?auto_389350 ) ) ( not ( = ?auto_389348 ?auto_389351 ) ) ( not ( = ?auto_389348 ?auto_389352 ) ) ( not ( = ?auto_389348 ?auto_389353 ) ) ( not ( = ?auto_389348 ?auto_389354 ) ) ( not ( = ?auto_389348 ?auto_389355 ) ) ( not ( = ?auto_389349 ?auto_389350 ) ) ( not ( = ?auto_389349 ?auto_389351 ) ) ( not ( = ?auto_389349 ?auto_389352 ) ) ( not ( = ?auto_389349 ?auto_389353 ) ) ( not ( = ?auto_389349 ?auto_389354 ) ) ( not ( = ?auto_389349 ?auto_389355 ) ) ( not ( = ?auto_389350 ?auto_389351 ) ) ( not ( = ?auto_389350 ?auto_389352 ) ) ( not ( = ?auto_389350 ?auto_389353 ) ) ( not ( = ?auto_389350 ?auto_389354 ) ) ( not ( = ?auto_389350 ?auto_389355 ) ) ( not ( = ?auto_389351 ?auto_389352 ) ) ( not ( = ?auto_389351 ?auto_389353 ) ) ( not ( = ?auto_389351 ?auto_389354 ) ) ( not ( = ?auto_389351 ?auto_389355 ) ) ( not ( = ?auto_389352 ?auto_389353 ) ) ( not ( = ?auto_389352 ?auto_389354 ) ) ( not ( = ?auto_389352 ?auto_389355 ) ) ( not ( = ?auto_389353 ?auto_389354 ) ) ( not ( = ?auto_389353 ?auto_389355 ) ) ( not ( = ?auto_389354 ?auto_389355 ) ) ( ON ?auto_389353 ?auto_389354 ) ( ON ?auto_389352 ?auto_389353 ) ( ON ?auto_389351 ?auto_389352 ) ( ON ?auto_389350 ?auto_389351 ) ( ON ?auto_389349 ?auto_389350 ) ( ON ?auto_389348 ?auto_389349 ) ( ON ?auto_389347 ?auto_389348 ) ( ON ?auto_389346 ?auto_389347 ) ( CLEAR ?auto_389344 ) ( ON ?auto_389345 ?auto_389346 ) ( CLEAR ?auto_389345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_389343 ?auto_389344 ?auto_389345 )
      ( MAKE-12PILE ?auto_389343 ?auto_389344 ?auto_389345 ?auto_389346 ?auto_389347 ?auto_389348 ?auto_389349 ?auto_389350 ?auto_389351 ?auto_389352 ?auto_389353 ?auto_389354 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389368 - BLOCK
      ?auto_389369 - BLOCK
      ?auto_389370 - BLOCK
      ?auto_389371 - BLOCK
      ?auto_389372 - BLOCK
      ?auto_389373 - BLOCK
      ?auto_389374 - BLOCK
      ?auto_389375 - BLOCK
      ?auto_389376 - BLOCK
      ?auto_389377 - BLOCK
      ?auto_389378 - BLOCK
      ?auto_389379 - BLOCK
    )
    :vars
    (
      ?auto_389380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389379 ?auto_389380 ) ( ON-TABLE ?auto_389368 ) ( not ( = ?auto_389368 ?auto_389369 ) ) ( not ( = ?auto_389368 ?auto_389370 ) ) ( not ( = ?auto_389368 ?auto_389371 ) ) ( not ( = ?auto_389368 ?auto_389372 ) ) ( not ( = ?auto_389368 ?auto_389373 ) ) ( not ( = ?auto_389368 ?auto_389374 ) ) ( not ( = ?auto_389368 ?auto_389375 ) ) ( not ( = ?auto_389368 ?auto_389376 ) ) ( not ( = ?auto_389368 ?auto_389377 ) ) ( not ( = ?auto_389368 ?auto_389378 ) ) ( not ( = ?auto_389368 ?auto_389379 ) ) ( not ( = ?auto_389368 ?auto_389380 ) ) ( not ( = ?auto_389369 ?auto_389370 ) ) ( not ( = ?auto_389369 ?auto_389371 ) ) ( not ( = ?auto_389369 ?auto_389372 ) ) ( not ( = ?auto_389369 ?auto_389373 ) ) ( not ( = ?auto_389369 ?auto_389374 ) ) ( not ( = ?auto_389369 ?auto_389375 ) ) ( not ( = ?auto_389369 ?auto_389376 ) ) ( not ( = ?auto_389369 ?auto_389377 ) ) ( not ( = ?auto_389369 ?auto_389378 ) ) ( not ( = ?auto_389369 ?auto_389379 ) ) ( not ( = ?auto_389369 ?auto_389380 ) ) ( not ( = ?auto_389370 ?auto_389371 ) ) ( not ( = ?auto_389370 ?auto_389372 ) ) ( not ( = ?auto_389370 ?auto_389373 ) ) ( not ( = ?auto_389370 ?auto_389374 ) ) ( not ( = ?auto_389370 ?auto_389375 ) ) ( not ( = ?auto_389370 ?auto_389376 ) ) ( not ( = ?auto_389370 ?auto_389377 ) ) ( not ( = ?auto_389370 ?auto_389378 ) ) ( not ( = ?auto_389370 ?auto_389379 ) ) ( not ( = ?auto_389370 ?auto_389380 ) ) ( not ( = ?auto_389371 ?auto_389372 ) ) ( not ( = ?auto_389371 ?auto_389373 ) ) ( not ( = ?auto_389371 ?auto_389374 ) ) ( not ( = ?auto_389371 ?auto_389375 ) ) ( not ( = ?auto_389371 ?auto_389376 ) ) ( not ( = ?auto_389371 ?auto_389377 ) ) ( not ( = ?auto_389371 ?auto_389378 ) ) ( not ( = ?auto_389371 ?auto_389379 ) ) ( not ( = ?auto_389371 ?auto_389380 ) ) ( not ( = ?auto_389372 ?auto_389373 ) ) ( not ( = ?auto_389372 ?auto_389374 ) ) ( not ( = ?auto_389372 ?auto_389375 ) ) ( not ( = ?auto_389372 ?auto_389376 ) ) ( not ( = ?auto_389372 ?auto_389377 ) ) ( not ( = ?auto_389372 ?auto_389378 ) ) ( not ( = ?auto_389372 ?auto_389379 ) ) ( not ( = ?auto_389372 ?auto_389380 ) ) ( not ( = ?auto_389373 ?auto_389374 ) ) ( not ( = ?auto_389373 ?auto_389375 ) ) ( not ( = ?auto_389373 ?auto_389376 ) ) ( not ( = ?auto_389373 ?auto_389377 ) ) ( not ( = ?auto_389373 ?auto_389378 ) ) ( not ( = ?auto_389373 ?auto_389379 ) ) ( not ( = ?auto_389373 ?auto_389380 ) ) ( not ( = ?auto_389374 ?auto_389375 ) ) ( not ( = ?auto_389374 ?auto_389376 ) ) ( not ( = ?auto_389374 ?auto_389377 ) ) ( not ( = ?auto_389374 ?auto_389378 ) ) ( not ( = ?auto_389374 ?auto_389379 ) ) ( not ( = ?auto_389374 ?auto_389380 ) ) ( not ( = ?auto_389375 ?auto_389376 ) ) ( not ( = ?auto_389375 ?auto_389377 ) ) ( not ( = ?auto_389375 ?auto_389378 ) ) ( not ( = ?auto_389375 ?auto_389379 ) ) ( not ( = ?auto_389375 ?auto_389380 ) ) ( not ( = ?auto_389376 ?auto_389377 ) ) ( not ( = ?auto_389376 ?auto_389378 ) ) ( not ( = ?auto_389376 ?auto_389379 ) ) ( not ( = ?auto_389376 ?auto_389380 ) ) ( not ( = ?auto_389377 ?auto_389378 ) ) ( not ( = ?auto_389377 ?auto_389379 ) ) ( not ( = ?auto_389377 ?auto_389380 ) ) ( not ( = ?auto_389378 ?auto_389379 ) ) ( not ( = ?auto_389378 ?auto_389380 ) ) ( not ( = ?auto_389379 ?auto_389380 ) ) ( ON ?auto_389378 ?auto_389379 ) ( ON ?auto_389377 ?auto_389378 ) ( ON ?auto_389376 ?auto_389377 ) ( ON ?auto_389375 ?auto_389376 ) ( ON ?auto_389374 ?auto_389375 ) ( ON ?auto_389373 ?auto_389374 ) ( ON ?auto_389372 ?auto_389373 ) ( ON ?auto_389371 ?auto_389372 ) ( ON ?auto_389370 ?auto_389371 ) ( CLEAR ?auto_389368 ) ( ON ?auto_389369 ?auto_389370 ) ( CLEAR ?auto_389369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_389368 ?auto_389369 )
      ( MAKE-12PILE ?auto_389368 ?auto_389369 ?auto_389370 ?auto_389371 ?auto_389372 ?auto_389373 ?auto_389374 ?auto_389375 ?auto_389376 ?auto_389377 ?auto_389378 ?auto_389379 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389393 - BLOCK
      ?auto_389394 - BLOCK
      ?auto_389395 - BLOCK
      ?auto_389396 - BLOCK
      ?auto_389397 - BLOCK
      ?auto_389398 - BLOCK
      ?auto_389399 - BLOCK
      ?auto_389400 - BLOCK
      ?auto_389401 - BLOCK
      ?auto_389402 - BLOCK
      ?auto_389403 - BLOCK
      ?auto_389404 - BLOCK
    )
    :vars
    (
      ?auto_389405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389404 ?auto_389405 ) ( ON-TABLE ?auto_389393 ) ( not ( = ?auto_389393 ?auto_389394 ) ) ( not ( = ?auto_389393 ?auto_389395 ) ) ( not ( = ?auto_389393 ?auto_389396 ) ) ( not ( = ?auto_389393 ?auto_389397 ) ) ( not ( = ?auto_389393 ?auto_389398 ) ) ( not ( = ?auto_389393 ?auto_389399 ) ) ( not ( = ?auto_389393 ?auto_389400 ) ) ( not ( = ?auto_389393 ?auto_389401 ) ) ( not ( = ?auto_389393 ?auto_389402 ) ) ( not ( = ?auto_389393 ?auto_389403 ) ) ( not ( = ?auto_389393 ?auto_389404 ) ) ( not ( = ?auto_389393 ?auto_389405 ) ) ( not ( = ?auto_389394 ?auto_389395 ) ) ( not ( = ?auto_389394 ?auto_389396 ) ) ( not ( = ?auto_389394 ?auto_389397 ) ) ( not ( = ?auto_389394 ?auto_389398 ) ) ( not ( = ?auto_389394 ?auto_389399 ) ) ( not ( = ?auto_389394 ?auto_389400 ) ) ( not ( = ?auto_389394 ?auto_389401 ) ) ( not ( = ?auto_389394 ?auto_389402 ) ) ( not ( = ?auto_389394 ?auto_389403 ) ) ( not ( = ?auto_389394 ?auto_389404 ) ) ( not ( = ?auto_389394 ?auto_389405 ) ) ( not ( = ?auto_389395 ?auto_389396 ) ) ( not ( = ?auto_389395 ?auto_389397 ) ) ( not ( = ?auto_389395 ?auto_389398 ) ) ( not ( = ?auto_389395 ?auto_389399 ) ) ( not ( = ?auto_389395 ?auto_389400 ) ) ( not ( = ?auto_389395 ?auto_389401 ) ) ( not ( = ?auto_389395 ?auto_389402 ) ) ( not ( = ?auto_389395 ?auto_389403 ) ) ( not ( = ?auto_389395 ?auto_389404 ) ) ( not ( = ?auto_389395 ?auto_389405 ) ) ( not ( = ?auto_389396 ?auto_389397 ) ) ( not ( = ?auto_389396 ?auto_389398 ) ) ( not ( = ?auto_389396 ?auto_389399 ) ) ( not ( = ?auto_389396 ?auto_389400 ) ) ( not ( = ?auto_389396 ?auto_389401 ) ) ( not ( = ?auto_389396 ?auto_389402 ) ) ( not ( = ?auto_389396 ?auto_389403 ) ) ( not ( = ?auto_389396 ?auto_389404 ) ) ( not ( = ?auto_389396 ?auto_389405 ) ) ( not ( = ?auto_389397 ?auto_389398 ) ) ( not ( = ?auto_389397 ?auto_389399 ) ) ( not ( = ?auto_389397 ?auto_389400 ) ) ( not ( = ?auto_389397 ?auto_389401 ) ) ( not ( = ?auto_389397 ?auto_389402 ) ) ( not ( = ?auto_389397 ?auto_389403 ) ) ( not ( = ?auto_389397 ?auto_389404 ) ) ( not ( = ?auto_389397 ?auto_389405 ) ) ( not ( = ?auto_389398 ?auto_389399 ) ) ( not ( = ?auto_389398 ?auto_389400 ) ) ( not ( = ?auto_389398 ?auto_389401 ) ) ( not ( = ?auto_389398 ?auto_389402 ) ) ( not ( = ?auto_389398 ?auto_389403 ) ) ( not ( = ?auto_389398 ?auto_389404 ) ) ( not ( = ?auto_389398 ?auto_389405 ) ) ( not ( = ?auto_389399 ?auto_389400 ) ) ( not ( = ?auto_389399 ?auto_389401 ) ) ( not ( = ?auto_389399 ?auto_389402 ) ) ( not ( = ?auto_389399 ?auto_389403 ) ) ( not ( = ?auto_389399 ?auto_389404 ) ) ( not ( = ?auto_389399 ?auto_389405 ) ) ( not ( = ?auto_389400 ?auto_389401 ) ) ( not ( = ?auto_389400 ?auto_389402 ) ) ( not ( = ?auto_389400 ?auto_389403 ) ) ( not ( = ?auto_389400 ?auto_389404 ) ) ( not ( = ?auto_389400 ?auto_389405 ) ) ( not ( = ?auto_389401 ?auto_389402 ) ) ( not ( = ?auto_389401 ?auto_389403 ) ) ( not ( = ?auto_389401 ?auto_389404 ) ) ( not ( = ?auto_389401 ?auto_389405 ) ) ( not ( = ?auto_389402 ?auto_389403 ) ) ( not ( = ?auto_389402 ?auto_389404 ) ) ( not ( = ?auto_389402 ?auto_389405 ) ) ( not ( = ?auto_389403 ?auto_389404 ) ) ( not ( = ?auto_389403 ?auto_389405 ) ) ( not ( = ?auto_389404 ?auto_389405 ) ) ( ON ?auto_389403 ?auto_389404 ) ( ON ?auto_389402 ?auto_389403 ) ( ON ?auto_389401 ?auto_389402 ) ( ON ?auto_389400 ?auto_389401 ) ( ON ?auto_389399 ?auto_389400 ) ( ON ?auto_389398 ?auto_389399 ) ( ON ?auto_389397 ?auto_389398 ) ( ON ?auto_389396 ?auto_389397 ) ( ON ?auto_389395 ?auto_389396 ) ( CLEAR ?auto_389393 ) ( ON ?auto_389394 ?auto_389395 ) ( CLEAR ?auto_389394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_389393 ?auto_389394 )
      ( MAKE-12PILE ?auto_389393 ?auto_389394 ?auto_389395 ?auto_389396 ?auto_389397 ?auto_389398 ?auto_389399 ?auto_389400 ?auto_389401 ?auto_389402 ?auto_389403 ?auto_389404 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389418 - BLOCK
      ?auto_389419 - BLOCK
      ?auto_389420 - BLOCK
      ?auto_389421 - BLOCK
      ?auto_389422 - BLOCK
      ?auto_389423 - BLOCK
      ?auto_389424 - BLOCK
      ?auto_389425 - BLOCK
      ?auto_389426 - BLOCK
      ?auto_389427 - BLOCK
      ?auto_389428 - BLOCK
      ?auto_389429 - BLOCK
    )
    :vars
    (
      ?auto_389430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389429 ?auto_389430 ) ( not ( = ?auto_389418 ?auto_389419 ) ) ( not ( = ?auto_389418 ?auto_389420 ) ) ( not ( = ?auto_389418 ?auto_389421 ) ) ( not ( = ?auto_389418 ?auto_389422 ) ) ( not ( = ?auto_389418 ?auto_389423 ) ) ( not ( = ?auto_389418 ?auto_389424 ) ) ( not ( = ?auto_389418 ?auto_389425 ) ) ( not ( = ?auto_389418 ?auto_389426 ) ) ( not ( = ?auto_389418 ?auto_389427 ) ) ( not ( = ?auto_389418 ?auto_389428 ) ) ( not ( = ?auto_389418 ?auto_389429 ) ) ( not ( = ?auto_389418 ?auto_389430 ) ) ( not ( = ?auto_389419 ?auto_389420 ) ) ( not ( = ?auto_389419 ?auto_389421 ) ) ( not ( = ?auto_389419 ?auto_389422 ) ) ( not ( = ?auto_389419 ?auto_389423 ) ) ( not ( = ?auto_389419 ?auto_389424 ) ) ( not ( = ?auto_389419 ?auto_389425 ) ) ( not ( = ?auto_389419 ?auto_389426 ) ) ( not ( = ?auto_389419 ?auto_389427 ) ) ( not ( = ?auto_389419 ?auto_389428 ) ) ( not ( = ?auto_389419 ?auto_389429 ) ) ( not ( = ?auto_389419 ?auto_389430 ) ) ( not ( = ?auto_389420 ?auto_389421 ) ) ( not ( = ?auto_389420 ?auto_389422 ) ) ( not ( = ?auto_389420 ?auto_389423 ) ) ( not ( = ?auto_389420 ?auto_389424 ) ) ( not ( = ?auto_389420 ?auto_389425 ) ) ( not ( = ?auto_389420 ?auto_389426 ) ) ( not ( = ?auto_389420 ?auto_389427 ) ) ( not ( = ?auto_389420 ?auto_389428 ) ) ( not ( = ?auto_389420 ?auto_389429 ) ) ( not ( = ?auto_389420 ?auto_389430 ) ) ( not ( = ?auto_389421 ?auto_389422 ) ) ( not ( = ?auto_389421 ?auto_389423 ) ) ( not ( = ?auto_389421 ?auto_389424 ) ) ( not ( = ?auto_389421 ?auto_389425 ) ) ( not ( = ?auto_389421 ?auto_389426 ) ) ( not ( = ?auto_389421 ?auto_389427 ) ) ( not ( = ?auto_389421 ?auto_389428 ) ) ( not ( = ?auto_389421 ?auto_389429 ) ) ( not ( = ?auto_389421 ?auto_389430 ) ) ( not ( = ?auto_389422 ?auto_389423 ) ) ( not ( = ?auto_389422 ?auto_389424 ) ) ( not ( = ?auto_389422 ?auto_389425 ) ) ( not ( = ?auto_389422 ?auto_389426 ) ) ( not ( = ?auto_389422 ?auto_389427 ) ) ( not ( = ?auto_389422 ?auto_389428 ) ) ( not ( = ?auto_389422 ?auto_389429 ) ) ( not ( = ?auto_389422 ?auto_389430 ) ) ( not ( = ?auto_389423 ?auto_389424 ) ) ( not ( = ?auto_389423 ?auto_389425 ) ) ( not ( = ?auto_389423 ?auto_389426 ) ) ( not ( = ?auto_389423 ?auto_389427 ) ) ( not ( = ?auto_389423 ?auto_389428 ) ) ( not ( = ?auto_389423 ?auto_389429 ) ) ( not ( = ?auto_389423 ?auto_389430 ) ) ( not ( = ?auto_389424 ?auto_389425 ) ) ( not ( = ?auto_389424 ?auto_389426 ) ) ( not ( = ?auto_389424 ?auto_389427 ) ) ( not ( = ?auto_389424 ?auto_389428 ) ) ( not ( = ?auto_389424 ?auto_389429 ) ) ( not ( = ?auto_389424 ?auto_389430 ) ) ( not ( = ?auto_389425 ?auto_389426 ) ) ( not ( = ?auto_389425 ?auto_389427 ) ) ( not ( = ?auto_389425 ?auto_389428 ) ) ( not ( = ?auto_389425 ?auto_389429 ) ) ( not ( = ?auto_389425 ?auto_389430 ) ) ( not ( = ?auto_389426 ?auto_389427 ) ) ( not ( = ?auto_389426 ?auto_389428 ) ) ( not ( = ?auto_389426 ?auto_389429 ) ) ( not ( = ?auto_389426 ?auto_389430 ) ) ( not ( = ?auto_389427 ?auto_389428 ) ) ( not ( = ?auto_389427 ?auto_389429 ) ) ( not ( = ?auto_389427 ?auto_389430 ) ) ( not ( = ?auto_389428 ?auto_389429 ) ) ( not ( = ?auto_389428 ?auto_389430 ) ) ( not ( = ?auto_389429 ?auto_389430 ) ) ( ON ?auto_389428 ?auto_389429 ) ( ON ?auto_389427 ?auto_389428 ) ( ON ?auto_389426 ?auto_389427 ) ( ON ?auto_389425 ?auto_389426 ) ( ON ?auto_389424 ?auto_389425 ) ( ON ?auto_389423 ?auto_389424 ) ( ON ?auto_389422 ?auto_389423 ) ( ON ?auto_389421 ?auto_389422 ) ( ON ?auto_389420 ?auto_389421 ) ( ON ?auto_389419 ?auto_389420 ) ( ON ?auto_389418 ?auto_389419 ) ( CLEAR ?auto_389418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_389418 )
      ( MAKE-12PILE ?auto_389418 ?auto_389419 ?auto_389420 ?auto_389421 ?auto_389422 ?auto_389423 ?auto_389424 ?auto_389425 ?auto_389426 ?auto_389427 ?auto_389428 ?auto_389429 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_389443 - BLOCK
      ?auto_389444 - BLOCK
      ?auto_389445 - BLOCK
      ?auto_389446 - BLOCK
      ?auto_389447 - BLOCK
      ?auto_389448 - BLOCK
      ?auto_389449 - BLOCK
      ?auto_389450 - BLOCK
      ?auto_389451 - BLOCK
      ?auto_389452 - BLOCK
      ?auto_389453 - BLOCK
      ?auto_389454 - BLOCK
    )
    :vars
    (
      ?auto_389455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389454 ?auto_389455 ) ( not ( = ?auto_389443 ?auto_389444 ) ) ( not ( = ?auto_389443 ?auto_389445 ) ) ( not ( = ?auto_389443 ?auto_389446 ) ) ( not ( = ?auto_389443 ?auto_389447 ) ) ( not ( = ?auto_389443 ?auto_389448 ) ) ( not ( = ?auto_389443 ?auto_389449 ) ) ( not ( = ?auto_389443 ?auto_389450 ) ) ( not ( = ?auto_389443 ?auto_389451 ) ) ( not ( = ?auto_389443 ?auto_389452 ) ) ( not ( = ?auto_389443 ?auto_389453 ) ) ( not ( = ?auto_389443 ?auto_389454 ) ) ( not ( = ?auto_389443 ?auto_389455 ) ) ( not ( = ?auto_389444 ?auto_389445 ) ) ( not ( = ?auto_389444 ?auto_389446 ) ) ( not ( = ?auto_389444 ?auto_389447 ) ) ( not ( = ?auto_389444 ?auto_389448 ) ) ( not ( = ?auto_389444 ?auto_389449 ) ) ( not ( = ?auto_389444 ?auto_389450 ) ) ( not ( = ?auto_389444 ?auto_389451 ) ) ( not ( = ?auto_389444 ?auto_389452 ) ) ( not ( = ?auto_389444 ?auto_389453 ) ) ( not ( = ?auto_389444 ?auto_389454 ) ) ( not ( = ?auto_389444 ?auto_389455 ) ) ( not ( = ?auto_389445 ?auto_389446 ) ) ( not ( = ?auto_389445 ?auto_389447 ) ) ( not ( = ?auto_389445 ?auto_389448 ) ) ( not ( = ?auto_389445 ?auto_389449 ) ) ( not ( = ?auto_389445 ?auto_389450 ) ) ( not ( = ?auto_389445 ?auto_389451 ) ) ( not ( = ?auto_389445 ?auto_389452 ) ) ( not ( = ?auto_389445 ?auto_389453 ) ) ( not ( = ?auto_389445 ?auto_389454 ) ) ( not ( = ?auto_389445 ?auto_389455 ) ) ( not ( = ?auto_389446 ?auto_389447 ) ) ( not ( = ?auto_389446 ?auto_389448 ) ) ( not ( = ?auto_389446 ?auto_389449 ) ) ( not ( = ?auto_389446 ?auto_389450 ) ) ( not ( = ?auto_389446 ?auto_389451 ) ) ( not ( = ?auto_389446 ?auto_389452 ) ) ( not ( = ?auto_389446 ?auto_389453 ) ) ( not ( = ?auto_389446 ?auto_389454 ) ) ( not ( = ?auto_389446 ?auto_389455 ) ) ( not ( = ?auto_389447 ?auto_389448 ) ) ( not ( = ?auto_389447 ?auto_389449 ) ) ( not ( = ?auto_389447 ?auto_389450 ) ) ( not ( = ?auto_389447 ?auto_389451 ) ) ( not ( = ?auto_389447 ?auto_389452 ) ) ( not ( = ?auto_389447 ?auto_389453 ) ) ( not ( = ?auto_389447 ?auto_389454 ) ) ( not ( = ?auto_389447 ?auto_389455 ) ) ( not ( = ?auto_389448 ?auto_389449 ) ) ( not ( = ?auto_389448 ?auto_389450 ) ) ( not ( = ?auto_389448 ?auto_389451 ) ) ( not ( = ?auto_389448 ?auto_389452 ) ) ( not ( = ?auto_389448 ?auto_389453 ) ) ( not ( = ?auto_389448 ?auto_389454 ) ) ( not ( = ?auto_389448 ?auto_389455 ) ) ( not ( = ?auto_389449 ?auto_389450 ) ) ( not ( = ?auto_389449 ?auto_389451 ) ) ( not ( = ?auto_389449 ?auto_389452 ) ) ( not ( = ?auto_389449 ?auto_389453 ) ) ( not ( = ?auto_389449 ?auto_389454 ) ) ( not ( = ?auto_389449 ?auto_389455 ) ) ( not ( = ?auto_389450 ?auto_389451 ) ) ( not ( = ?auto_389450 ?auto_389452 ) ) ( not ( = ?auto_389450 ?auto_389453 ) ) ( not ( = ?auto_389450 ?auto_389454 ) ) ( not ( = ?auto_389450 ?auto_389455 ) ) ( not ( = ?auto_389451 ?auto_389452 ) ) ( not ( = ?auto_389451 ?auto_389453 ) ) ( not ( = ?auto_389451 ?auto_389454 ) ) ( not ( = ?auto_389451 ?auto_389455 ) ) ( not ( = ?auto_389452 ?auto_389453 ) ) ( not ( = ?auto_389452 ?auto_389454 ) ) ( not ( = ?auto_389452 ?auto_389455 ) ) ( not ( = ?auto_389453 ?auto_389454 ) ) ( not ( = ?auto_389453 ?auto_389455 ) ) ( not ( = ?auto_389454 ?auto_389455 ) ) ( ON ?auto_389453 ?auto_389454 ) ( ON ?auto_389452 ?auto_389453 ) ( ON ?auto_389451 ?auto_389452 ) ( ON ?auto_389450 ?auto_389451 ) ( ON ?auto_389449 ?auto_389450 ) ( ON ?auto_389448 ?auto_389449 ) ( ON ?auto_389447 ?auto_389448 ) ( ON ?auto_389446 ?auto_389447 ) ( ON ?auto_389445 ?auto_389446 ) ( ON ?auto_389444 ?auto_389445 ) ( ON ?auto_389443 ?auto_389444 ) ( CLEAR ?auto_389443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_389443 )
      ( MAKE-12PILE ?auto_389443 ?auto_389444 ?auto_389445 ?auto_389446 ?auto_389447 ?auto_389448 ?auto_389449 ?auto_389450 ?auto_389451 ?auto_389452 ?auto_389453 ?auto_389454 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389469 - BLOCK
      ?auto_389470 - BLOCK
      ?auto_389471 - BLOCK
      ?auto_389472 - BLOCK
      ?auto_389473 - BLOCK
      ?auto_389474 - BLOCK
      ?auto_389475 - BLOCK
      ?auto_389476 - BLOCK
      ?auto_389477 - BLOCK
      ?auto_389478 - BLOCK
      ?auto_389479 - BLOCK
      ?auto_389480 - BLOCK
      ?auto_389481 - BLOCK
    )
    :vars
    (
      ?auto_389482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_389480 ) ( ON ?auto_389481 ?auto_389482 ) ( CLEAR ?auto_389481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_389469 ) ( ON ?auto_389470 ?auto_389469 ) ( ON ?auto_389471 ?auto_389470 ) ( ON ?auto_389472 ?auto_389471 ) ( ON ?auto_389473 ?auto_389472 ) ( ON ?auto_389474 ?auto_389473 ) ( ON ?auto_389475 ?auto_389474 ) ( ON ?auto_389476 ?auto_389475 ) ( ON ?auto_389477 ?auto_389476 ) ( ON ?auto_389478 ?auto_389477 ) ( ON ?auto_389479 ?auto_389478 ) ( ON ?auto_389480 ?auto_389479 ) ( not ( = ?auto_389469 ?auto_389470 ) ) ( not ( = ?auto_389469 ?auto_389471 ) ) ( not ( = ?auto_389469 ?auto_389472 ) ) ( not ( = ?auto_389469 ?auto_389473 ) ) ( not ( = ?auto_389469 ?auto_389474 ) ) ( not ( = ?auto_389469 ?auto_389475 ) ) ( not ( = ?auto_389469 ?auto_389476 ) ) ( not ( = ?auto_389469 ?auto_389477 ) ) ( not ( = ?auto_389469 ?auto_389478 ) ) ( not ( = ?auto_389469 ?auto_389479 ) ) ( not ( = ?auto_389469 ?auto_389480 ) ) ( not ( = ?auto_389469 ?auto_389481 ) ) ( not ( = ?auto_389469 ?auto_389482 ) ) ( not ( = ?auto_389470 ?auto_389471 ) ) ( not ( = ?auto_389470 ?auto_389472 ) ) ( not ( = ?auto_389470 ?auto_389473 ) ) ( not ( = ?auto_389470 ?auto_389474 ) ) ( not ( = ?auto_389470 ?auto_389475 ) ) ( not ( = ?auto_389470 ?auto_389476 ) ) ( not ( = ?auto_389470 ?auto_389477 ) ) ( not ( = ?auto_389470 ?auto_389478 ) ) ( not ( = ?auto_389470 ?auto_389479 ) ) ( not ( = ?auto_389470 ?auto_389480 ) ) ( not ( = ?auto_389470 ?auto_389481 ) ) ( not ( = ?auto_389470 ?auto_389482 ) ) ( not ( = ?auto_389471 ?auto_389472 ) ) ( not ( = ?auto_389471 ?auto_389473 ) ) ( not ( = ?auto_389471 ?auto_389474 ) ) ( not ( = ?auto_389471 ?auto_389475 ) ) ( not ( = ?auto_389471 ?auto_389476 ) ) ( not ( = ?auto_389471 ?auto_389477 ) ) ( not ( = ?auto_389471 ?auto_389478 ) ) ( not ( = ?auto_389471 ?auto_389479 ) ) ( not ( = ?auto_389471 ?auto_389480 ) ) ( not ( = ?auto_389471 ?auto_389481 ) ) ( not ( = ?auto_389471 ?auto_389482 ) ) ( not ( = ?auto_389472 ?auto_389473 ) ) ( not ( = ?auto_389472 ?auto_389474 ) ) ( not ( = ?auto_389472 ?auto_389475 ) ) ( not ( = ?auto_389472 ?auto_389476 ) ) ( not ( = ?auto_389472 ?auto_389477 ) ) ( not ( = ?auto_389472 ?auto_389478 ) ) ( not ( = ?auto_389472 ?auto_389479 ) ) ( not ( = ?auto_389472 ?auto_389480 ) ) ( not ( = ?auto_389472 ?auto_389481 ) ) ( not ( = ?auto_389472 ?auto_389482 ) ) ( not ( = ?auto_389473 ?auto_389474 ) ) ( not ( = ?auto_389473 ?auto_389475 ) ) ( not ( = ?auto_389473 ?auto_389476 ) ) ( not ( = ?auto_389473 ?auto_389477 ) ) ( not ( = ?auto_389473 ?auto_389478 ) ) ( not ( = ?auto_389473 ?auto_389479 ) ) ( not ( = ?auto_389473 ?auto_389480 ) ) ( not ( = ?auto_389473 ?auto_389481 ) ) ( not ( = ?auto_389473 ?auto_389482 ) ) ( not ( = ?auto_389474 ?auto_389475 ) ) ( not ( = ?auto_389474 ?auto_389476 ) ) ( not ( = ?auto_389474 ?auto_389477 ) ) ( not ( = ?auto_389474 ?auto_389478 ) ) ( not ( = ?auto_389474 ?auto_389479 ) ) ( not ( = ?auto_389474 ?auto_389480 ) ) ( not ( = ?auto_389474 ?auto_389481 ) ) ( not ( = ?auto_389474 ?auto_389482 ) ) ( not ( = ?auto_389475 ?auto_389476 ) ) ( not ( = ?auto_389475 ?auto_389477 ) ) ( not ( = ?auto_389475 ?auto_389478 ) ) ( not ( = ?auto_389475 ?auto_389479 ) ) ( not ( = ?auto_389475 ?auto_389480 ) ) ( not ( = ?auto_389475 ?auto_389481 ) ) ( not ( = ?auto_389475 ?auto_389482 ) ) ( not ( = ?auto_389476 ?auto_389477 ) ) ( not ( = ?auto_389476 ?auto_389478 ) ) ( not ( = ?auto_389476 ?auto_389479 ) ) ( not ( = ?auto_389476 ?auto_389480 ) ) ( not ( = ?auto_389476 ?auto_389481 ) ) ( not ( = ?auto_389476 ?auto_389482 ) ) ( not ( = ?auto_389477 ?auto_389478 ) ) ( not ( = ?auto_389477 ?auto_389479 ) ) ( not ( = ?auto_389477 ?auto_389480 ) ) ( not ( = ?auto_389477 ?auto_389481 ) ) ( not ( = ?auto_389477 ?auto_389482 ) ) ( not ( = ?auto_389478 ?auto_389479 ) ) ( not ( = ?auto_389478 ?auto_389480 ) ) ( not ( = ?auto_389478 ?auto_389481 ) ) ( not ( = ?auto_389478 ?auto_389482 ) ) ( not ( = ?auto_389479 ?auto_389480 ) ) ( not ( = ?auto_389479 ?auto_389481 ) ) ( not ( = ?auto_389479 ?auto_389482 ) ) ( not ( = ?auto_389480 ?auto_389481 ) ) ( not ( = ?auto_389480 ?auto_389482 ) ) ( not ( = ?auto_389481 ?auto_389482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_389481 ?auto_389482 )
      ( !STACK ?auto_389481 ?auto_389480 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389496 - BLOCK
      ?auto_389497 - BLOCK
      ?auto_389498 - BLOCK
      ?auto_389499 - BLOCK
      ?auto_389500 - BLOCK
      ?auto_389501 - BLOCK
      ?auto_389502 - BLOCK
      ?auto_389503 - BLOCK
      ?auto_389504 - BLOCK
      ?auto_389505 - BLOCK
      ?auto_389506 - BLOCK
      ?auto_389507 - BLOCK
      ?auto_389508 - BLOCK
    )
    :vars
    (
      ?auto_389509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_389507 ) ( ON ?auto_389508 ?auto_389509 ) ( CLEAR ?auto_389508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_389496 ) ( ON ?auto_389497 ?auto_389496 ) ( ON ?auto_389498 ?auto_389497 ) ( ON ?auto_389499 ?auto_389498 ) ( ON ?auto_389500 ?auto_389499 ) ( ON ?auto_389501 ?auto_389500 ) ( ON ?auto_389502 ?auto_389501 ) ( ON ?auto_389503 ?auto_389502 ) ( ON ?auto_389504 ?auto_389503 ) ( ON ?auto_389505 ?auto_389504 ) ( ON ?auto_389506 ?auto_389505 ) ( ON ?auto_389507 ?auto_389506 ) ( not ( = ?auto_389496 ?auto_389497 ) ) ( not ( = ?auto_389496 ?auto_389498 ) ) ( not ( = ?auto_389496 ?auto_389499 ) ) ( not ( = ?auto_389496 ?auto_389500 ) ) ( not ( = ?auto_389496 ?auto_389501 ) ) ( not ( = ?auto_389496 ?auto_389502 ) ) ( not ( = ?auto_389496 ?auto_389503 ) ) ( not ( = ?auto_389496 ?auto_389504 ) ) ( not ( = ?auto_389496 ?auto_389505 ) ) ( not ( = ?auto_389496 ?auto_389506 ) ) ( not ( = ?auto_389496 ?auto_389507 ) ) ( not ( = ?auto_389496 ?auto_389508 ) ) ( not ( = ?auto_389496 ?auto_389509 ) ) ( not ( = ?auto_389497 ?auto_389498 ) ) ( not ( = ?auto_389497 ?auto_389499 ) ) ( not ( = ?auto_389497 ?auto_389500 ) ) ( not ( = ?auto_389497 ?auto_389501 ) ) ( not ( = ?auto_389497 ?auto_389502 ) ) ( not ( = ?auto_389497 ?auto_389503 ) ) ( not ( = ?auto_389497 ?auto_389504 ) ) ( not ( = ?auto_389497 ?auto_389505 ) ) ( not ( = ?auto_389497 ?auto_389506 ) ) ( not ( = ?auto_389497 ?auto_389507 ) ) ( not ( = ?auto_389497 ?auto_389508 ) ) ( not ( = ?auto_389497 ?auto_389509 ) ) ( not ( = ?auto_389498 ?auto_389499 ) ) ( not ( = ?auto_389498 ?auto_389500 ) ) ( not ( = ?auto_389498 ?auto_389501 ) ) ( not ( = ?auto_389498 ?auto_389502 ) ) ( not ( = ?auto_389498 ?auto_389503 ) ) ( not ( = ?auto_389498 ?auto_389504 ) ) ( not ( = ?auto_389498 ?auto_389505 ) ) ( not ( = ?auto_389498 ?auto_389506 ) ) ( not ( = ?auto_389498 ?auto_389507 ) ) ( not ( = ?auto_389498 ?auto_389508 ) ) ( not ( = ?auto_389498 ?auto_389509 ) ) ( not ( = ?auto_389499 ?auto_389500 ) ) ( not ( = ?auto_389499 ?auto_389501 ) ) ( not ( = ?auto_389499 ?auto_389502 ) ) ( not ( = ?auto_389499 ?auto_389503 ) ) ( not ( = ?auto_389499 ?auto_389504 ) ) ( not ( = ?auto_389499 ?auto_389505 ) ) ( not ( = ?auto_389499 ?auto_389506 ) ) ( not ( = ?auto_389499 ?auto_389507 ) ) ( not ( = ?auto_389499 ?auto_389508 ) ) ( not ( = ?auto_389499 ?auto_389509 ) ) ( not ( = ?auto_389500 ?auto_389501 ) ) ( not ( = ?auto_389500 ?auto_389502 ) ) ( not ( = ?auto_389500 ?auto_389503 ) ) ( not ( = ?auto_389500 ?auto_389504 ) ) ( not ( = ?auto_389500 ?auto_389505 ) ) ( not ( = ?auto_389500 ?auto_389506 ) ) ( not ( = ?auto_389500 ?auto_389507 ) ) ( not ( = ?auto_389500 ?auto_389508 ) ) ( not ( = ?auto_389500 ?auto_389509 ) ) ( not ( = ?auto_389501 ?auto_389502 ) ) ( not ( = ?auto_389501 ?auto_389503 ) ) ( not ( = ?auto_389501 ?auto_389504 ) ) ( not ( = ?auto_389501 ?auto_389505 ) ) ( not ( = ?auto_389501 ?auto_389506 ) ) ( not ( = ?auto_389501 ?auto_389507 ) ) ( not ( = ?auto_389501 ?auto_389508 ) ) ( not ( = ?auto_389501 ?auto_389509 ) ) ( not ( = ?auto_389502 ?auto_389503 ) ) ( not ( = ?auto_389502 ?auto_389504 ) ) ( not ( = ?auto_389502 ?auto_389505 ) ) ( not ( = ?auto_389502 ?auto_389506 ) ) ( not ( = ?auto_389502 ?auto_389507 ) ) ( not ( = ?auto_389502 ?auto_389508 ) ) ( not ( = ?auto_389502 ?auto_389509 ) ) ( not ( = ?auto_389503 ?auto_389504 ) ) ( not ( = ?auto_389503 ?auto_389505 ) ) ( not ( = ?auto_389503 ?auto_389506 ) ) ( not ( = ?auto_389503 ?auto_389507 ) ) ( not ( = ?auto_389503 ?auto_389508 ) ) ( not ( = ?auto_389503 ?auto_389509 ) ) ( not ( = ?auto_389504 ?auto_389505 ) ) ( not ( = ?auto_389504 ?auto_389506 ) ) ( not ( = ?auto_389504 ?auto_389507 ) ) ( not ( = ?auto_389504 ?auto_389508 ) ) ( not ( = ?auto_389504 ?auto_389509 ) ) ( not ( = ?auto_389505 ?auto_389506 ) ) ( not ( = ?auto_389505 ?auto_389507 ) ) ( not ( = ?auto_389505 ?auto_389508 ) ) ( not ( = ?auto_389505 ?auto_389509 ) ) ( not ( = ?auto_389506 ?auto_389507 ) ) ( not ( = ?auto_389506 ?auto_389508 ) ) ( not ( = ?auto_389506 ?auto_389509 ) ) ( not ( = ?auto_389507 ?auto_389508 ) ) ( not ( = ?auto_389507 ?auto_389509 ) ) ( not ( = ?auto_389508 ?auto_389509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_389508 ?auto_389509 )
      ( !STACK ?auto_389508 ?auto_389507 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389523 - BLOCK
      ?auto_389524 - BLOCK
      ?auto_389525 - BLOCK
      ?auto_389526 - BLOCK
      ?auto_389527 - BLOCK
      ?auto_389528 - BLOCK
      ?auto_389529 - BLOCK
      ?auto_389530 - BLOCK
      ?auto_389531 - BLOCK
      ?auto_389532 - BLOCK
      ?auto_389533 - BLOCK
      ?auto_389534 - BLOCK
      ?auto_389535 - BLOCK
    )
    :vars
    (
      ?auto_389536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389535 ?auto_389536 ) ( ON-TABLE ?auto_389523 ) ( ON ?auto_389524 ?auto_389523 ) ( ON ?auto_389525 ?auto_389524 ) ( ON ?auto_389526 ?auto_389525 ) ( ON ?auto_389527 ?auto_389526 ) ( ON ?auto_389528 ?auto_389527 ) ( ON ?auto_389529 ?auto_389528 ) ( ON ?auto_389530 ?auto_389529 ) ( ON ?auto_389531 ?auto_389530 ) ( ON ?auto_389532 ?auto_389531 ) ( ON ?auto_389533 ?auto_389532 ) ( not ( = ?auto_389523 ?auto_389524 ) ) ( not ( = ?auto_389523 ?auto_389525 ) ) ( not ( = ?auto_389523 ?auto_389526 ) ) ( not ( = ?auto_389523 ?auto_389527 ) ) ( not ( = ?auto_389523 ?auto_389528 ) ) ( not ( = ?auto_389523 ?auto_389529 ) ) ( not ( = ?auto_389523 ?auto_389530 ) ) ( not ( = ?auto_389523 ?auto_389531 ) ) ( not ( = ?auto_389523 ?auto_389532 ) ) ( not ( = ?auto_389523 ?auto_389533 ) ) ( not ( = ?auto_389523 ?auto_389534 ) ) ( not ( = ?auto_389523 ?auto_389535 ) ) ( not ( = ?auto_389523 ?auto_389536 ) ) ( not ( = ?auto_389524 ?auto_389525 ) ) ( not ( = ?auto_389524 ?auto_389526 ) ) ( not ( = ?auto_389524 ?auto_389527 ) ) ( not ( = ?auto_389524 ?auto_389528 ) ) ( not ( = ?auto_389524 ?auto_389529 ) ) ( not ( = ?auto_389524 ?auto_389530 ) ) ( not ( = ?auto_389524 ?auto_389531 ) ) ( not ( = ?auto_389524 ?auto_389532 ) ) ( not ( = ?auto_389524 ?auto_389533 ) ) ( not ( = ?auto_389524 ?auto_389534 ) ) ( not ( = ?auto_389524 ?auto_389535 ) ) ( not ( = ?auto_389524 ?auto_389536 ) ) ( not ( = ?auto_389525 ?auto_389526 ) ) ( not ( = ?auto_389525 ?auto_389527 ) ) ( not ( = ?auto_389525 ?auto_389528 ) ) ( not ( = ?auto_389525 ?auto_389529 ) ) ( not ( = ?auto_389525 ?auto_389530 ) ) ( not ( = ?auto_389525 ?auto_389531 ) ) ( not ( = ?auto_389525 ?auto_389532 ) ) ( not ( = ?auto_389525 ?auto_389533 ) ) ( not ( = ?auto_389525 ?auto_389534 ) ) ( not ( = ?auto_389525 ?auto_389535 ) ) ( not ( = ?auto_389525 ?auto_389536 ) ) ( not ( = ?auto_389526 ?auto_389527 ) ) ( not ( = ?auto_389526 ?auto_389528 ) ) ( not ( = ?auto_389526 ?auto_389529 ) ) ( not ( = ?auto_389526 ?auto_389530 ) ) ( not ( = ?auto_389526 ?auto_389531 ) ) ( not ( = ?auto_389526 ?auto_389532 ) ) ( not ( = ?auto_389526 ?auto_389533 ) ) ( not ( = ?auto_389526 ?auto_389534 ) ) ( not ( = ?auto_389526 ?auto_389535 ) ) ( not ( = ?auto_389526 ?auto_389536 ) ) ( not ( = ?auto_389527 ?auto_389528 ) ) ( not ( = ?auto_389527 ?auto_389529 ) ) ( not ( = ?auto_389527 ?auto_389530 ) ) ( not ( = ?auto_389527 ?auto_389531 ) ) ( not ( = ?auto_389527 ?auto_389532 ) ) ( not ( = ?auto_389527 ?auto_389533 ) ) ( not ( = ?auto_389527 ?auto_389534 ) ) ( not ( = ?auto_389527 ?auto_389535 ) ) ( not ( = ?auto_389527 ?auto_389536 ) ) ( not ( = ?auto_389528 ?auto_389529 ) ) ( not ( = ?auto_389528 ?auto_389530 ) ) ( not ( = ?auto_389528 ?auto_389531 ) ) ( not ( = ?auto_389528 ?auto_389532 ) ) ( not ( = ?auto_389528 ?auto_389533 ) ) ( not ( = ?auto_389528 ?auto_389534 ) ) ( not ( = ?auto_389528 ?auto_389535 ) ) ( not ( = ?auto_389528 ?auto_389536 ) ) ( not ( = ?auto_389529 ?auto_389530 ) ) ( not ( = ?auto_389529 ?auto_389531 ) ) ( not ( = ?auto_389529 ?auto_389532 ) ) ( not ( = ?auto_389529 ?auto_389533 ) ) ( not ( = ?auto_389529 ?auto_389534 ) ) ( not ( = ?auto_389529 ?auto_389535 ) ) ( not ( = ?auto_389529 ?auto_389536 ) ) ( not ( = ?auto_389530 ?auto_389531 ) ) ( not ( = ?auto_389530 ?auto_389532 ) ) ( not ( = ?auto_389530 ?auto_389533 ) ) ( not ( = ?auto_389530 ?auto_389534 ) ) ( not ( = ?auto_389530 ?auto_389535 ) ) ( not ( = ?auto_389530 ?auto_389536 ) ) ( not ( = ?auto_389531 ?auto_389532 ) ) ( not ( = ?auto_389531 ?auto_389533 ) ) ( not ( = ?auto_389531 ?auto_389534 ) ) ( not ( = ?auto_389531 ?auto_389535 ) ) ( not ( = ?auto_389531 ?auto_389536 ) ) ( not ( = ?auto_389532 ?auto_389533 ) ) ( not ( = ?auto_389532 ?auto_389534 ) ) ( not ( = ?auto_389532 ?auto_389535 ) ) ( not ( = ?auto_389532 ?auto_389536 ) ) ( not ( = ?auto_389533 ?auto_389534 ) ) ( not ( = ?auto_389533 ?auto_389535 ) ) ( not ( = ?auto_389533 ?auto_389536 ) ) ( not ( = ?auto_389534 ?auto_389535 ) ) ( not ( = ?auto_389534 ?auto_389536 ) ) ( not ( = ?auto_389535 ?auto_389536 ) ) ( CLEAR ?auto_389533 ) ( ON ?auto_389534 ?auto_389535 ) ( CLEAR ?auto_389534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_389523 ?auto_389524 ?auto_389525 ?auto_389526 ?auto_389527 ?auto_389528 ?auto_389529 ?auto_389530 ?auto_389531 ?auto_389532 ?auto_389533 ?auto_389534 )
      ( MAKE-13PILE ?auto_389523 ?auto_389524 ?auto_389525 ?auto_389526 ?auto_389527 ?auto_389528 ?auto_389529 ?auto_389530 ?auto_389531 ?auto_389532 ?auto_389533 ?auto_389534 ?auto_389535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389550 - BLOCK
      ?auto_389551 - BLOCK
      ?auto_389552 - BLOCK
      ?auto_389553 - BLOCK
      ?auto_389554 - BLOCK
      ?auto_389555 - BLOCK
      ?auto_389556 - BLOCK
      ?auto_389557 - BLOCK
      ?auto_389558 - BLOCK
      ?auto_389559 - BLOCK
      ?auto_389560 - BLOCK
      ?auto_389561 - BLOCK
      ?auto_389562 - BLOCK
    )
    :vars
    (
      ?auto_389563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389562 ?auto_389563 ) ( ON-TABLE ?auto_389550 ) ( ON ?auto_389551 ?auto_389550 ) ( ON ?auto_389552 ?auto_389551 ) ( ON ?auto_389553 ?auto_389552 ) ( ON ?auto_389554 ?auto_389553 ) ( ON ?auto_389555 ?auto_389554 ) ( ON ?auto_389556 ?auto_389555 ) ( ON ?auto_389557 ?auto_389556 ) ( ON ?auto_389558 ?auto_389557 ) ( ON ?auto_389559 ?auto_389558 ) ( ON ?auto_389560 ?auto_389559 ) ( not ( = ?auto_389550 ?auto_389551 ) ) ( not ( = ?auto_389550 ?auto_389552 ) ) ( not ( = ?auto_389550 ?auto_389553 ) ) ( not ( = ?auto_389550 ?auto_389554 ) ) ( not ( = ?auto_389550 ?auto_389555 ) ) ( not ( = ?auto_389550 ?auto_389556 ) ) ( not ( = ?auto_389550 ?auto_389557 ) ) ( not ( = ?auto_389550 ?auto_389558 ) ) ( not ( = ?auto_389550 ?auto_389559 ) ) ( not ( = ?auto_389550 ?auto_389560 ) ) ( not ( = ?auto_389550 ?auto_389561 ) ) ( not ( = ?auto_389550 ?auto_389562 ) ) ( not ( = ?auto_389550 ?auto_389563 ) ) ( not ( = ?auto_389551 ?auto_389552 ) ) ( not ( = ?auto_389551 ?auto_389553 ) ) ( not ( = ?auto_389551 ?auto_389554 ) ) ( not ( = ?auto_389551 ?auto_389555 ) ) ( not ( = ?auto_389551 ?auto_389556 ) ) ( not ( = ?auto_389551 ?auto_389557 ) ) ( not ( = ?auto_389551 ?auto_389558 ) ) ( not ( = ?auto_389551 ?auto_389559 ) ) ( not ( = ?auto_389551 ?auto_389560 ) ) ( not ( = ?auto_389551 ?auto_389561 ) ) ( not ( = ?auto_389551 ?auto_389562 ) ) ( not ( = ?auto_389551 ?auto_389563 ) ) ( not ( = ?auto_389552 ?auto_389553 ) ) ( not ( = ?auto_389552 ?auto_389554 ) ) ( not ( = ?auto_389552 ?auto_389555 ) ) ( not ( = ?auto_389552 ?auto_389556 ) ) ( not ( = ?auto_389552 ?auto_389557 ) ) ( not ( = ?auto_389552 ?auto_389558 ) ) ( not ( = ?auto_389552 ?auto_389559 ) ) ( not ( = ?auto_389552 ?auto_389560 ) ) ( not ( = ?auto_389552 ?auto_389561 ) ) ( not ( = ?auto_389552 ?auto_389562 ) ) ( not ( = ?auto_389552 ?auto_389563 ) ) ( not ( = ?auto_389553 ?auto_389554 ) ) ( not ( = ?auto_389553 ?auto_389555 ) ) ( not ( = ?auto_389553 ?auto_389556 ) ) ( not ( = ?auto_389553 ?auto_389557 ) ) ( not ( = ?auto_389553 ?auto_389558 ) ) ( not ( = ?auto_389553 ?auto_389559 ) ) ( not ( = ?auto_389553 ?auto_389560 ) ) ( not ( = ?auto_389553 ?auto_389561 ) ) ( not ( = ?auto_389553 ?auto_389562 ) ) ( not ( = ?auto_389553 ?auto_389563 ) ) ( not ( = ?auto_389554 ?auto_389555 ) ) ( not ( = ?auto_389554 ?auto_389556 ) ) ( not ( = ?auto_389554 ?auto_389557 ) ) ( not ( = ?auto_389554 ?auto_389558 ) ) ( not ( = ?auto_389554 ?auto_389559 ) ) ( not ( = ?auto_389554 ?auto_389560 ) ) ( not ( = ?auto_389554 ?auto_389561 ) ) ( not ( = ?auto_389554 ?auto_389562 ) ) ( not ( = ?auto_389554 ?auto_389563 ) ) ( not ( = ?auto_389555 ?auto_389556 ) ) ( not ( = ?auto_389555 ?auto_389557 ) ) ( not ( = ?auto_389555 ?auto_389558 ) ) ( not ( = ?auto_389555 ?auto_389559 ) ) ( not ( = ?auto_389555 ?auto_389560 ) ) ( not ( = ?auto_389555 ?auto_389561 ) ) ( not ( = ?auto_389555 ?auto_389562 ) ) ( not ( = ?auto_389555 ?auto_389563 ) ) ( not ( = ?auto_389556 ?auto_389557 ) ) ( not ( = ?auto_389556 ?auto_389558 ) ) ( not ( = ?auto_389556 ?auto_389559 ) ) ( not ( = ?auto_389556 ?auto_389560 ) ) ( not ( = ?auto_389556 ?auto_389561 ) ) ( not ( = ?auto_389556 ?auto_389562 ) ) ( not ( = ?auto_389556 ?auto_389563 ) ) ( not ( = ?auto_389557 ?auto_389558 ) ) ( not ( = ?auto_389557 ?auto_389559 ) ) ( not ( = ?auto_389557 ?auto_389560 ) ) ( not ( = ?auto_389557 ?auto_389561 ) ) ( not ( = ?auto_389557 ?auto_389562 ) ) ( not ( = ?auto_389557 ?auto_389563 ) ) ( not ( = ?auto_389558 ?auto_389559 ) ) ( not ( = ?auto_389558 ?auto_389560 ) ) ( not ( = ?auto_389558 ?auto_389561 ) ) ( not ( = ?auto_389558 ?auto_389562 ) ) ( not ( = ?auto_389558 ?auto_389563 ) ) ( not ( = ?auto_389559 ?auto_389560 ) ) ( not ( = ?auto_389559 ?auto_389561 ) ) ( not ( = ?auto_389559 ?auto_389562 ) ) ( not ( = ?auto_389559 ?auto_389563 ) ) ( not ( = ?auto_389560 ?auto_389561 ) ) ( not ( = ?auto_389560 ?auto_389562 ) ) ( not ( = ?auto_389560 ?auto_389563 ) ) ( not ( = ?auto_389561 ?auto_389562 ) ) ( not ( = ?auto_389561 ?auto_389563 ) ) ( not ( = ?auto_389562 ?auto_389563 ) ) ( CLEAR ?auto_389560 ) ( ON ?auto_389561 ?auto_389562 ) ( CLEAR ?auto_389561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_389550 ?auto_389551 ?auto_389552 ?auto_389553 ?auto_389554 ?auto_389555 ?auto_389556 ?auto_389557 ?auto_389558 ?auto_389559 ?auto_389560 ?auto_389561 )
      ( MAKE-13PILE ?auto_389550 ?auto_389551 ?auto_389552 ?auto_389553 ?auto_389554 ?auto_389555 ?auto_389556 ?auto_389557 ?auto_389558 ?auto_389559 ?auto_389560 ?auto_389561 ?auto_389562 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389577 - BLOCK
      ?auto_389578 - BLOCK
      ?auto_389579 - BLOCK
      ?auto_389580 - BLOCK
      ?auto_389581 - BLOCK
      ?auto_389582 - BLOCK
      ?auto_389583 - BLOCK
      ?auto_389584 - BLOCK
      ?auto_389585 - BLOCK
      ?auto_389586 - BLOCK
      ?auto_389587 - BLOCK
      ?auto_389588 - BLOCK
      ?auto_389589 - BLOCK
    )
    :vars
    (
      ?auto_389590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389589 ?auto_389590 ) ( ON-TABLE ?auto_389577 ) ( ON ?auto_389578 ?auto_389577 ) ( ON ?auto_389579 ?auto_389578 ) ( ON ?auto_389580 ?auto_389579 ) ( ON ?auto_389581 ?auto_389580 ) ( ON ?auto_389582 ?auto_389581 ) ( ON ?auto_389583 ?auto_389582 ) ( ON ?auto_389584 ?auto_389583 ) ( ON ?auto_389585 ?auto_389584 ) ( ON ?auto_389586 ?auto_389585 ) ( not ( = ?auto_389577 ?auto_389578 ) ) ( not ( = ?auto_389577 ?auto_389579 ) ) ( not ( = ?auto_389577 ?auto_389580 ) ) ( not ( = ?auto_389577 ?auto_389581 ) ) ( not ( = ?auto_389577 ?auto_389582 ) ) ( not ( = ?auto_389577 ?auto_389583 ) ) ( not ( = ?auto_389577 ?auto_389584 ) ) ( not ( = ?auto_389577 ?auto_389585 ) ) ( not ( = ?auto_389577 ?auto_389586 ) ) ( not ( = ?auto_389577 ?auto_389587 ) ) ( not ( = ?auto_389577 ?auto_389588 ) ) ( not ( = ?auto_389577 ?auto_389589 ) ) ( not ( = ?auto_389577 ?auto_389590 ) ) ( not ( = ?auto_389578 ?auto_389579 ) ) ( not ( = ?auto_389578 ?auto_389580 ) ) ( not ( = ?auto_389578 ?auto_389581 ) ) ( not ( = ?auto_389578 ?auto_389582 ) ) ( not ( = ?auto_389578 ?auto_389583 ) ) ( not ( = ?auto_389578 ?auto_389584 ) ) ( not ( = ?auto_389578 ?auto_389585 ) ) ( not ( = ?auto_389578 ?auto_389586 ) ) ( not ( = ?auto_389578 ?auto_389587 ) ) ( not ( = ?auto_389578 ?auto_389588 ) ) ( not ( = ?auto_389578 ?auto_389589 ) ) ( not ( = ?auto_389578 ?auto_389590 ) ) ( not ( = ?auto_389579 ?auto_389580 ) ) ( not ( = ?auto_389579 ?auto_389581 ) ) ( not ( = ?auto_389579 ?auto_389582 ) ) ( not ( = ?auto_389579 ?auto_389583 ) ) ( not ( = ?auto_389579 ?auto_389584 ) ) ( not ( = ?auto_389579 ?auto_389585 ) ) ( not ( = ?auto_389579 ?auto_389586 ) ) ( not ( = ?auto_389579 ?auto_389587 ) ) ( not ( = ?auto_389579 ?auto_389588 ) ) ( not ( = ?auto_389579 ?auto_389589 ) ) ( not ( = ?auto_389579 ?auto_389590 ) ) ( not ( = ?auto_389580 ?auto_389581 ) ) ( not ( = ?auto_389580 ?auto_389582 ) ) ( not ( = ?auto_389580 ?auto_389583 ) ) ( not ( = ?auto_389580 ?auto_389584 ) ) ( not ( = ?auto_389580 ?auto_389585 ) ) ( not ( = ?auto_389580 ?auto_389586 ) ) ( not ( = ?auto_389580 ?auto_389587 ) ) ( not ( = ?auto_389580 ?auto_389588 ) ) ( not ( = ?auto_389580 ?auto_389589 ) ) ( not ( = ?auto_389580 ?auto_389590 ) ) ( not ( = ?auto_389581 ?auto_389582 ) ) ( not ( = ?auto_389581 ?auto_389583 ) ) ( not ( = ?auto_389581 ?auto_389584 ) ) ( not ( = ?auto_389581 ?auto_389585 ) ) ( not ( = ?auto_389581 ?auto_389586 ) ) ( not ( = ?auto_389581 ?auto_389587 ) ) ( not ( = ?auto_389581 ?auto_389588 ) ) ( not ( = ?auto_389581 ?auto_389589 ) ) ( not ( = ?auto_389581 ?auto_389590 ) ) ( not ( = ?auto_389582 ?auto_389583 ) ) ( not ( = ?auto_389582 ?auto_389584 ) ) ( not ( = ?auto_389582 ?auto_389585 ) ) ( not ( = ?auto_389582 ?auto_389586 ) ) ( not ( = ?auto_389582 ?auto_389587 ) ) ( not ( = ?auto_389582 ?auto_389588 ) ) ( not ( = ?auto_389582 ?auto_389589 ) ) ( not ( = ?auto_389582 ?auto_389590 ) ) ( not ( = ?auto_389583 ?auto_389584 ) ) ( not ( = ?auto_389583 ?auto_389585 ) ) ( not ( = ?auto_389583 ?auto_389586 ) ) ( not ( = ?auto_389583 ?auto_389587 ) ) ( not ( = ?auto_389583 ?auto_389588 ) ) ( not ( = ?auto_389583 ?auto_389589 ) ) ( not ( = ?auto_389583 ?auto_389590 ) ) ( not ( = ?auto_389584 ?auto_389585 ) ) ( not ( = ?auto_389584 ?auto_389586 ) ) ( not ( = ?auto_389584 ?auto_389587 ) ) ( not ( = ?auto_389584 ?auto_389588 ) ) ( not ( = ?auto_389584 ?auto_389589 ) ) ( not ( = ?auto_389584 ?auto_389590 ) ) ( not ( = ?auto_389585 ?auto_389586 ) ) ( not ( = ?auto_389585 ?auto_389587 ) ) ( not ( = ?auto_389585 ?auto_389588 ) ) ( not ( = ?auto_389585 ?auto_389589 ) ) ( not ( = ?auto_389585 ?auto_389590 ) ) ( not ( = ?auto_389586 ?auto_389587 ) ) ( not ( = ?auto_389586 ?auto_389588 ) ) ( not ( = ?auto_389586 ?auto_389589 ) ) ( not ( = ?auto_389586 ?auto_389590 ) ) ( not ( = ?auto_389587 ?auto_389588 ) ) ( not ( = ?auto_389587 ?auto_389589 ) ) ( not ( = ?auto_389587 ?auto_389590 ) ) ( not ( = ?auto_389588 ?auto_389589 ) ) ( not ( = ?auto_389588 ?auto_389590 ) ) ( not ( = ?auto_389589 ?auto_389590 ) ) ( ON ?auto_389588 ?auto_389589 ) ( CLEAR ?auto_389586 ) ( ON ?auto_389587 ?auto_389588 ) ( CLEAR ?auto_389587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_389577 ?auto_389578 ?auto_389579 ?auto_389580 ?auto_389581 ?auto_389582 ?auto_389583 ?auto_389584 ?auto_389585 ?auto_389586 ?auto_389587 )
      ( MAKE-13PILE ?auto_389577 ?auto_389578 ?auto_389579 ?auto_389580 ?auto_389581 ?auto_389582 ?auto_389583 ?auto_389584 ?auto_389585 ?auto_389586 ?auto_389587 ?auto_389588 ?auto_389589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389604 - BLOCK
      ?auto_389605 - BLOCK
      ?auto_389606 - BLOCK
      ?auto_389607 - BLOCK
      ?auto_389608 - BLOCK
      ?auto_389609 - BLOCK
      ?auto_389610 - BLOCK
      ?auto_389611 - BLOCK
      ?auto_389612 - BLOCK
      ?auto_389613 - BLOCK
      ?auto_389614 - BLOCK
      ?auto_389615 - BLOCK
      ?auto_389616 - BLOCK
    )
    :vars
    (
      ?auto_389617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389616 ?auto_389617 ) ( ON-TABLE ?auto_389604 ) ( ON ?auto_389605 ?auto_389604 ) ( ON ?auto_389606 ?auto_389605 ) ( ON ?auto_389607 ?auto_389606 ) ( ON ?auto_389608 ?auto_389607 ) ( ON ?auto_389609 ?auto_389608 ) ( ON ?auto_389610 ?auto_389609 ) ( ON ?auto_389611 ?auto_389610 ) ( ON ?auto_389612 ?auto_389611 ) ( ON ?auto_389613 ?auto_389612 ) ( not ( = ?auto_389604 ?auto_389605 ) ) ( not ( = ?auto_389604 ?auto_389606 ) ) ( not ( = ?auto_389604 ?auto_389607 ) ) ( not ( = ?auto_389604 ?auto_389608 ) ) ( not ( = ?auto_389604 ?auto_389609 ) ) ( not ( = ?auto_389604 ?auto_389610 ) ) ( not ( = ?auto_389604 ?auto_389611 ) ) ( not ( = ?auto_389604 ?auto_389612 ) ) ( not ( = ?auto_389604 ?auto_389613 ) ) ( not ( = ?auto_389604 ?auto_389614 ) ) ( not ( = ?auto_389604 ?auto_389615 ) ) ( not ( = ?auto_389604 ?auto_389616 ) ) ( not ( = ?auto_389604 ?auto_389617 ) ) ( not ( = ?auto_389605 ?auto_389606 ) ) ( not ( = ?auto_389605 ?auto_389607 ) ) ( not ( = ?auto_389605 ?auto_389608 ) ) ( not ( = ?auto_389605 ?auto_389609 ) ) ( not ( = ?auto_389605 ?auto_389610 ) ) ( not ( = ?auto_389605 ?auto_389611 ) ) ( not ( = ?auto_389605 ?auto_389612 ) ) ( not ( = ?auto_389605 ?auto_389613 ) ) ( not ( = ?auto_389605 ?auto_389614 ) ) ( not ( = ?auto_389605 ?auto_389615 ) ) ( not ( = ?auto_389605 ?auto_389616 ) ) ( not ( = ?auto_389605 ?auto_389617 ) ) ( not ( = ?auto_389606 ?auto_389607 ) ) ( not ( = ?auto_389606 ?auto_389608 ) ) ( not ( = ?auto_389606 ?auto_389609 ) ) ( not ( = ?auto_389606 ?auto_389610 ) ) ( not ( = ?auto_389606 ?auto_389611 ) ) ( not ( = ?auto_389606 ?auto_389612 ) ) ( not ( = ?auto_389606 ?auto_389613 ) ) ( not ( = ?auto_389606 ?auto_389614 ) ) ( not ( = ?auto_389606 ?auto_389615 ) ) ( not ( = ?auto_389606 ?auto_389616 ) ) ( not ( = ?auto_389606 ?auto_389617 ) ) ( not ( = ?auto_389607 ?auto_389608 ) ) ( not ( = ?auto_389607 ?auto_389609 ) ) ( not ( = ?auto_389607 ?auto_389610 ) ) ( not ( = ?auto_389607 ?auto_389611 ) ) ( not ( = ?auto_389607 ?auto_389612 ) ) ( not ( = ?auto_389607 ?auto_389613 ) ) ( not ( = ?auto_389607 ?auto_389614 ) ) ( not ( = ?auto_389607 ?auto_389615 ) ) ( not ( = ?auto_389607 ?auto_389616 ) ) ( not ( = ?auto_389607 ?auto_389617 ) ) ( not ( = ?auto_389608 ?auto_389609 ) ) ( not ( = ?auto_389608 ?auto_389610 ) ) ( not ( = ?auto_389608 ?auto_389611 ) ) ( not ( = ?auto_389608 ?auto_389612 ) ) ( not ( = ?auto_389608 ?auto_389613 ) ) ( not ( = ?auto_389608 ?auto_389614 ) ) ( not ( = ?auto_389608 ?auto_389615 ) ) ( not ( = ?auto_389608 ?auto_389616 ) ) ( not ( = ?auto_389608 ?auto_389617 ) ) ( not ( = ?auto_389609 ?auto_389610 ) ) ( not ( = ?auto_389609 ?auto_389611 ) ) ( not ( = ?auto_389609 ?auto_389612 ) ) ( not ( = ?auto_389609 ?auto_389613 ) ) ( not ( = ?auto_389609 ?auto_389614 ) ) ( not ( = ?auto_389609 ?auto_389615 ) ) ( not ( = ?auto_389609 ?auto_389616 ) ) ( not ( = ?auto_389609 ?auto_389617 ) ) ( not ( = ?auto_389610 ?auto_389611 ) ) ( not ( = ?auto_389610 ?auto_389612 ) ) ( not ( = ?auto_389610 ?auto_389613 ) ) ( not ( = ?auto_389610 ?auto_389614 ) ) ( not ( = ?auto_389610 ?auto_389615 ) ) ( not ( = ?auto_389610 ?auto_389616 ) ) ( not ( = ?auto_389610 ?auto_389617 ) ) ( not ( = ?auto_389611 ?auto_389612 ) ) ( not ( = ?auto_389611 ?auto_389613 ) ) ( not ( = ?auto_389611 ?auto_389614 ) ) ( not ( = ?auto_389611 ?auto_389615 ) ) ( not ( = ?auto_389611 ?auto_389616 ) ) ( not ( = ?auto_389611 ?auto_389617 ) ) ( not ( = ?auto_389612 ?auto_389613 ) ) ( not ( = ?auto_389612 ?auto_389614 ) ) ( not ( = ?auto_389612 ?auto_389615 ) ) ( not ( = ?auto_389612 ?auto_389616 ) ) ( not ( = ?auto_389612 ?auto_389617 ) ) ( not ( = ?auto_389613 ?auto_389614 ) ) ( not ( = ?auto_389613 ?auto_389615 ) ) ( not ( = ?auto_389613 ?auto_389616 ) ) ( not ( = ?auto_389613 ?auto_389617 ) ) ( not ( = ?auto_389614 ?auto_389615 ) ) ( not ( = ?auto_389614 ?auto_389616 ) ) ( not ( = ?auto_389614 ?auto_389617 ) ) ( not ( = ?auto_389615 ?auto_389616 ) ) ( not ( = ?auto_389615 ?auto_389617 ) ) ( not ( = ?auto_389616 ?auto_389617 ) ) ( ON ?auto_389615 ?auto_389616 ) ( CLEAR ?auto_389613 ) ( ON ?auto_389614 ?auto_389615 ) ( CLEAR ?auto_389614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_389604 ?auto_389605 ?auto_389606 ?auto_389607 ?auto_389608 ?auto_389609 ?auto_389610 ?auto_389611 ?auto_389612 ?auto_389613 ?auto_389614 )
      ( MAKE-13PILE ?auto_389604 ?auto_389605 ?auto_389606 ?auto_389607 ?auto_389608 ?auto_389609 ?auto_389610 ?auto_389611 ?auto_389612 ?auto_389613 ?auto_389614 ?auto_389615 ?auto_389616 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389631 - BLOCK
      ?auto_389632 - BLOCK
      ?auto_389633 - BLOCK
      ?auto_389634 - BLOCK
      ?auto_389635 - BLOCK
      ?auto_389636 - BLOCK
      ?auto_389637 - BLOCK
      ?auto_389638 - BLOCK
      ?auto_389639 - BLOCK
      ?auto_389640 - BLOCK
      ?auto_389641 - BLOCK
      ?auto_389642 - BLOCK
      ?auto_389643 - BLOCK
    )
    :vars
    (
      ?auto_389644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389643 ?auto_389644 ) ( ON-TABLE ?auto_389631 ) ( ON ?auto_389632 ?auto_389631 ) ( ON ?auto_389633 ?auto_389632 ) ( ON ?auto_389634 ?auto_389633 ) ( ON ?auto_389635 ?auto_389634 ) ( ON ?auto_389636 ?auto_389635 ) ( ON ?auto_389637 ?auto_389636 ) ( ON ?auto_389638 ?auto_389637 ) ( ON ?auto_389639 ?auto_389638 ) ( not ( = ?auto_389631 ?auto_389632 ) ) ( not ( = ?auto_389631 ?auto_389633 ) ) ( not ( = ?auto_389631 ?auto_389634 ) ) ( not ( = ?auto_389631 ?auto_389635 ) ) ( not ( = ?auto_389631 ?auto_389636 ) ) ( not ( = ?auto_389631 ?auto_389637 ) ) ( not ( = ?auto_389631 ?auto_389638 ) ) ( not ( = ?auto_389631 ?auto_389639 ) ) ( not ( = ?auto_389631 ?auto_389640 ) ) ( not ( = ?auto_389631 ?auto_389641 ) ) ( not ( = ?auto_389631 ?auto_389642 ) ) ( not ( = ?auto_389631 ?auto_389643 ) ) ( not ( = ?auto_389631 ?auto_389644 ) ) ( not ( = ?auto_389632 ?auto_389633 ) ) ( not ( = ?auto_389632 ?auto_389634 ) ) ( not ( = ?auto_389632 ?auto_389635 ) ) ( not ( = ?auto_389632 ?auto_389636 ) ) ( not ( = ?auto_389632 ?auto_389637 ) ) ( not ( = ?auto_389632 ?auto_389638 ) ) ( not ( = ?auto_389632 ?auto_389639 ) ) ( not ( = ?auto_389632 ?auto_389640 ) ) ( not ( = ?auto_389632 ?auto_389641 ) ) ( not ( = ?auto_389632 ?auto_389642 ) ) ( not ( = ?auto_389632 ?auto_389643 ) ) ( not ( = ?auto_389632 ?auto_389644 ) ) ( not ( = ?auto_389633 ?auto_389634 ) ) ( not ( = ?auto_389633 ?auto_389635 ) ) ( not ( = ?auto_389633 ?auto_389636 ) ) ( not ( = ?auto_389633 ?auto_389637 ) ) ( not ( = ?auto_389633 ?auto_389638 ) ) ( not ( = ?auto_389633 ?auto_389639 ) ) ( not ( = ?auto_389633 ?auto_389640 ) ) ( not ( = ?auto_389633 ?auto_389641 ) ) ( not ( = ?auto_389633 ?auto_389642 ) ) ( not ( = ?auto_389633 ?auto_389643 ) ) ( not ( = ?auto_389633 ?auto_389644 ) ) ( not ( = ?auto_389634 ?auto_389635 ) ) ( not ( = ?auto_389634 ?auto_389636 ) ) ( not ( = ?auto_389634 ?auto_389637 ) ) ( not ( = ?auto_389634 ?auto_389638 ) ) ( not ( = ?auto_389634 ?auto_389639 ) ) ( not ( = ?auto_389634 ?auto_389640 ) ) ( not ( = ?auto_389634 ?auto_389641 ) ) ( not ( = ?auto_389634 ?auto_389642 ) ) ( not ( = ?auto_389634 ?auto_389643 ) ) ( not ( = ?auto_389634 ?auto_389644 ) ) ( not ( = ?auto_389635 ?auto_389636 ) ) ( not ( = ?auto_389635 ?auto_389637 ) ) ( not ( = ?auto_389635 ?auto_389638 ) ) ( not ( = ?auto_389635 ?auto_389639 ) ) ( not ( = ?auto_389635 ?auto_389640 ) ) ( not ( = ?auto_389635 ?auto_389641 ) ) ( not ( = ?auto_389635 ?auto_389642 ) ) ( not ( = ?auto_389635 ?auto_389643 ) ) ( not ( = ?auto_389635 ?auto_389644 ) ) ( not ( = ?auto_389636 ?auto_389637 ) ) ( not ( = ?auto_389636 ?auto_389638 ) ) ( not ( = ?auto_389636 ?auto_389639 ) ) ( not ( = ?auto_389636 ?auto_389640 ) ) ( not ( = ?auto_389636 ?auto_389641 ) ) ( not ( = ?auto_389636 ?auto_389642 ) ) ( not ( = ?auto_389636 ?auto_389643 ) ) ( not ( = ?auto_389636 ?auto_389644 ) ) ( not ( = ?auto_389637 ?auto_389638 ) ) ( not ( = ?auto_389637 ?auto_389639 ) ) ( not ( = ?auto_389637 ?auto_389640 ) ) ( not ( = ?auto_389637 ?auto_389641 ) ) ( not ( = ?auto_389637 ?auto_389642 ) ) ( not ( = ?auto_389637 ?auto_389643 ) ) ( not ( = ?auto_389637 ?auto_389644 ) ) ( not ( = ?auto_389638 ?auto_389639 ) ) ( not ( = ?auto_389638 ?auto_389640 ) ) ( not ( = ?auto_389638 ?auto_389641 ) ) ( not ( = ?auto_389638 ?auto_389642 ) ) ( not ( = ?auto_389638 ?auto_389643 ) ) ( not ( = ?auto_389638 ?auto_389644 ) ) ( not ( = ?auto_389639 ?auto_389640 ) ) ( not ( = ?auto_389639 ?auto_389641 ) ) ( not ( = ?auto_389639 ?auto_389642 ) ) ( not ( = ?auto_389639 ?auto_389643 ) ) ( not ( = ?auto_389639 ?auto_389644 ) ) ( not ( = ?auto_389640 ?auto_389641 ) ) ( not ( = ?auto_389640 ?auto_389642 ) ) ( not ( = ?auto_389640 ?auto_389643 ) ) ( not ( = ?auto_389640 ?auto_389644 ) ) ( not ( = ?auto_389641 ?auto_389642 ) ) ( not ( = ?auto_389641 ?auto_389643 ) ) ( not ( = ?auto_389641 ?auto_389644 ) ) ( not ( = ?auto_389642 ?auto_389643 ) ) ( not ( = ?auto_389642 ?auto_389644 ) ) ( not ( = ?auto_389643 ?auto_389644 ) ) ( ON ?auto_389642 ?auto_389643 ) ( ON ?auto_389641 ?auto_389642 ) ( CLEAR ?auto_389639 ) ( ON ?auto_389640 ?auto_389641 ) ( CLEAR ?auto_389640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_389631 ?auto_389632 ?auto_389633 ?auto_389634 ?auto_389635 ?auto_389636 ?auto_389637 ?auto_389638 ?auto_389639 ?auto_389640 )
      ( MAKE-13PILE ?auto_389631 ?auto_389632 ?auto_389633 ?auto_389634 ?auto_389635 ?auto_389636 ?auto_389637 ?auto_389638 ?auto_389639 ?auto_389640 ?auto_389641 ?auto_389642 ?auto_389643 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389658 - BLOCK
      ?auto_389659 - BLOCK
      ?auto_389660 - BLOCK
      ?auto_389661 - BLOCK
      ?auto_389662 - BLOCK
      ?auto_389663 - BLOCK
      ?auto_389664 - BLOCK
      ?auto_389665 - BLOCK
      ?auto_389666 - BLOCK
      ?auto_389667 - BLOCK
      ?auto_389668 - BLOCK
      ?auto_389669 - BLOCK
      ?auto_389670 - BLOCK
    )
    :vars
    (
      ?auto_389671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389670 ?auto_389671 ) ( ON-TABLE ?auto_389658 ) ( ON ?auto_389659 ?auto_389658 ) ( ON ?auto_389660 ?auto_389659 ) ( ON ?auto_389661 ?auto_389660 ) ( ON ?auto_389662 ?auto_389661 ) ( ON ?auto_389663 ?auto_389662 ) ( ON ?auto_389664 ?auto_389663 ) ( ON ?auto_389665 ?auto_389664 ) ( ON ?auto_389666 ?auto_389665 ) ( not ( = ?auto_389658 ?auto_389659 ) ) ( not ( = ?auto_389658 ?auto_389660 ) ) ( not ( = ?auto_389658 ?auto_389661 ) ) ( not ( = ?auto_389658 ?auto_389662 ) ) ( not ( = ?auto_389658 ?auto_389663 ) ) ( not ( = ?auto_389658 ?auto_389664 ) ) ( not ( = ?auto_389658 ?auto_389665 ) ) ( not ( = ?auto_389658 ?auto_389666 ) ) ( not ( = ?auto_389658 ?auto_389667 ) ) ( not ( = ?auto_389658 ?auto_389668 ) ) ( not ( = ?auto_389658 ?auto_389669 ) ) ( not ( = ?auto_389658 ?auto_389670 ) ) ( not ( = ?auto_389658 ?auto_389671 ) ) ( not ( = ?auto_389659 ?auto_389660 ) ) ( not ( = ?auto_389659 ?auto_389661 ) ) ( not ( = ?auto_389659 ?auto_389662 ) ) ( not ( = ?auto_389659 ?auto_389663 ) ) ( not ( = ?auto_389659 ?auto_389664 ) ) ( not ( = ?auto_389659 ?auto_389665 ) ) ( not ( = ?auto_389659 ?auto_389666 ) ) ( not ( = ?auto_389659 ?auto_389667 ) ) ( not ( = ?auto_389659 ?auto_389668 ) ) ( not ( = ?auto_389659 ?auto_389669 ) ) ( not ( = ?auto_389659 ?auto_389670 ) ) ( not ( = ?auto_389659 ?auto_389671 ) ) ( not ( = ?auto_389660 ?auto_389661 ) ) ( not ( = ?auto_389660 ?auto_389662 ) ) ( not ( = ?auto_389660 ?auto_389663 ) ) ( not ( = ?auto_389660 ?auto_389664 ) ) ( not ( = ?auto_389660 ?auto_389665 ) ) ( not ( = ?auto_389660 ?auto_389666 ) ) ( not ( = ?auto_389660 ?auto_389667 ) ) ( not ( = ?auto_389660 ?auto_389668 ) ) ( not ( = ?auto_389660 ?auto_389669 ) ) ( not ( = ?auto_389660 ?auto_389670 ) ) ( not ( = ?auto_389660 ?auto_389671 ) ) ( not ( = ?auto_389661 ?auto_389662 ) ) ( not ( = ?auto_389661 ?auto_389663 ) ) ( not ( = ?auto_389661 ?auto_389664 ) ) ( not ( = ?auto_389661 ?auto_389665 ) ) ( not ( = ?auto_389661 ?auto_389666 ) ) ( not ( = ?auto_389661 ?auto_389667 ) ) ( not ( = ?auto_389661 ?auto_389668 ) ) ( not ( = ?auto_389661 ?auto_389669 ) ) ( not ( = ?auto_389661 ?auto_389670 ) ) ( not ( = ?auto_389661 ?auto_389671 ) ) ( not ( = ?auto_389662 ?auto_389663 ) ) ( not ( = ?auto_389662 ?auto_389664 ) ) ( not ( = ?auto_389662 ?auto_389665 ) ) ( not ( = ?auto_389662 ?auto_389666 ) ) ( not ( = ?auto_389662 ?auto_389667 ) ) ( not ( = ?auto_389662 ?auto_389668 ) ) ( not ( = ?auto_389662 ?auto_389669 ) ) ( not ( = ?auto_389662 ?auto_389670 ) ) ( not ( = ?auto_389662 ?auto_389671 ) ) ( not ( = ?auto_389663 ?auto_389664 ) ) ( not ( = ?auto_389663 ?auto_389665 ) ) ( not ( = ?auto_389663 ?auto_389666 ) ) ( not ( = ?auto_389663 ?auto_389667 ) ) ( not ( = ?auto_389663 ?auto_389668 ) ) ( not ( = ?auto_389663 ?auto_389669 ) ) ( not ( = ?auto_389663 ?auto_389670 ) ) ( not ( = ?auto_389663 ?auto_389671 ) ) ( not ( = ?auto_389664 ?auto_389665 ) ) ( not ( = ?auto_389664 ?auto_389666 ) ) ( not ( = ?auto_389664 ?auto_389667 ) ) ( not ( = ?auto_389664 ?auto_389668 ) ) ( not ( = ?auto_389664 ?auto_389669 ) ) ( not ( = ?auto_389664 ?auto_389670 ) ) ( not ( = ?auto_389664 ?auto_389671 ) ) ( not ( = ?auto_389665 ?auto_389666 ) ) ( not ( = ?auto_389665 ?auto_389667 ) ) ( not ( = ?auto_389665 ?auto_389668 ) ) ( not ( = ?auto_389665 ?auto_389669 ) ) ( not ( = ?auto_389665 ?auto_389670 ) ) ( not ( = ?auto_389665 ?auto_389671 ) ) ( not ( = ?auto_389666 ?auto_389667 ) ) ( not ( = ?auto_389666 ?auto_389668 ) ) ( not ( = ?auto_389666 ?auto_389669 ) ) ( not ( = ?auto_389666 ?auto_389670 ) ) ( not ( = ?auto_389666 ?auto_389671 ) ) ( not ( = ?auto_389667 ?auto_389668 ) ) ( not ( = ?auto_389667 ?auto_389669 ) ) ( not ( = ?auto_389667 ?auto_389670 ) ) ( not ( = ?auto_389667 ?auto_389671 ) ) ( not ( = ?auto_389668 ?auto_389669 ) ) ( not ( = ?auto_389668 ?auto_389670 ) ) ( not ( = ?auto_389668 ?auto_389671 ) ) ( not ( = ?auto_389669 ?auto_389670 ) ) ( not ( = ?auto_389669 ?auto_389671 ) ) ( not ( = ?auto_389670 ?auto_389671 ) ) ( ON ?auto_389669 ?auto_389670 ) ( ON ?auto_389668 ?auto_389669 ) ( CLEAR ?auto_389666 ) ( ON ?auto_389667 ?auto_389668 ) ( CLEAR ?auto_389667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_389658 ?auto_389659 ?auto_389660 ?auto_389661 ?auto_389662 ?auto_389663 ?auto_389664 ?auto_389665 ?auto_389666 ?auto_389667 )
      ( MAKE-13PILE ?auto_389658 ?auto_389659 ?auto_389660 ?auto_389661 ?auto_389662 ?auto_389663 ?auto_389664 ?auto_389665 ?auto_389666 ?auto_389667 ?auto_389668 ?auto_389669 ?auto_389670 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389685 - BLOCK
      ?auto_389686 - BLOCK
      ?auto_389687 - BLOCK
      ?auto_389688 - BLOCK
      ?auto_389689 - BLOCK
      ?auto_389690 - BLOCK
      ?auto_389691 - BLOCK
      ?auto_389692 - BLOCK
      ?auto_389693 - BLOCK
      ?auto_389694 - BLOCK
      ?auto_389695 - BLOCK
      ?auto_389696 - BLOCK
      ?auto_389697 - BLOCK
    )
    :vars
    (
      ?auto_389698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389697 ?auto_389698 ) ( ON-TABLE ?auto_389685 ) ( ON ?auto_389686 ?auto_389685 ) ( ON ?auto_389687 ?auto_389686 ) ( ON ?auto_389688 ?auto_389687 ) ( ON ?auto_389689 ?auto_389688 ) ( ON ?auto_389690 ?auto_389689 ) ( ON ?auto_389691 ?auto_389690 ) ( ON ?auto_389692 ?auto_389691 ) ( not ( = ?auto_389685 ?auto_389686 ) ) ( not ( = ?auto_389685 ?auto_389687 ) ) ( not ( = ?auto_389685 ?auto_389688 ) ) ( not ( = ?auto_389685 ?auto_389689 ) ) ( not ( = ?auto_389685 ?auto_389690 ) ) ( not ( = ?auto_389685 ?auto_389691 ) ) ( not ( = ?auto_389685 ?auto_389692 ) ) ( not ( = ?auto_389685 ?auto_389693 ) ) ( not ( = ?auto_389685 ?auto_389694 ) ) ( not ( = ?auto_389685 ?auto_389695 ) ) ( not ( = ?auto_389685 ?auto_389696 ) ) ( not ( = ?auto_389685 ?auto_389697 ) ) ( not ( = ?auto_389685 ?auto_389698 ) ) ( not ( = ?auto_389686 ?auto_389687 ) ) ( not ( = ?auto_389686 ?auto_389688 ) ) ( not ( = ?auto_389686 ?auto_389689 ) ) ( not ( = ?auto_389686 ?auto_389690 ) ) ( not ( = ?auto_389686 ?auto_389691 ) ) ( not ( = ?auto_389686 ?auto_389692 ) ) ( not ( = ?auto_389686 ?auto_389693 ) ) ( not ( = ?auto_389686 ?auto_389694 ) ) ( not ( = ?auto_389686 ?auto_389695 ) ) ( not ( = ?auto_389686 ?auto_389696 ) ) ( not ( = ?auto_389686 ?auto_389697 ) ) ( not ( = ?auto_389686 ?auto_389698 ) ) ( not ( = ?auto_389687 ?auto_389688 ) ) ( not ( = ?auto_389687 ?auto_389689 ) ) ( not ( = ?auto_389687 ?auto_389690 ) ) ( not ( = ?auto_389687 ?auto_389691 ) ) ( not ( = ?auto_389687 ?auto_389692 ) ) ( not ( = ?auto_389687 ?auto_389693 ) ) ( not ( = ?auto_389687 ?auto_389694 ) ) ( not ( = ?auto_389687 ?auto_389695 ) ) ( not ( = ?auto_389687 ?auto_389696 ) ) ( not ( = ?auto_389687 ?auto_389697 ) ) ( not ( = ?auto_389687 ?auto_389698 ) ) ( not ( = ?auto_389688 ?auto_389689 ) ) ( not ( = ?auto_389688 ?auto_389690 ) ) ( not ( = ?auto_389688 ?auto_389691 ) ) ( not ( = ?auto_389688 ?auto_389692 ) ) ( not ( = ?auto_389688 ?auto_389693 ) ) ( not ( = ?auto_389688 ?auto_389694 ) ) ( not ( = ?auto_389688 ?auto_389695 ) ) ( not ( = ?auto_389688 ?auto_389696 ) ) ( not ( = ?auto_389688 ?auto_389697 ) ) ( not ( = ?auto_389688 ?auto_389698 ) ) ( not ( = ?auto_389689 ?auto_389690 ) ) ( not ( = ?auto_389689 ?auto_389691 ) ) ( not ( = ?auto_389689 ?auto_389692 ) ) ( not ( = ?auto_389689 ?auto_389693 ) ) ( not ( = ?auto_389689 ?auto_389694 ) ) ( not ( = ?auto_389689 ?auto_389695 ) ) ( not ( = ?auto_389689 ?auto_389696 ) ) ( not ( = ?auto_389689 ?auto_389697 ) ) ( not ( = ?auto_389689 ?auto_389698 ) ) ( not ( = ?auto_389690 ?auto_389691 ) ) ( not ( = ?auto_389690 ?auto_389692 ) ) ( not ( = ?auto_389690 ?auto_389693 ) ) ( not ( = ?auto_389690 ?auto_389694 ) ) ( not ( = ?auto_389690 ?auto_389695 ) ) ( not ( = ?auto_389690 ?auto_389696 ) ) ( not ( = ?auto_389690 ?auto_389697 ) ) ( not ( = ?auto_389690 ?auto_389698 ) ) ( not ( = ?auto_389691 ?auto_389692 ) ) ( not ( = ?auto_389691 ?auto_389693 ) ) ( not ( = ?auto_389691 ?auto_389694 ) ) ( not ( = ?auto_389691 ?auto_389695 ) ) ( not ( = ?auto_389691 ?auto_389696 ) ) ( not ( = ?auto_389691 ?auto_389697 ) ) ( not ( = ?auto_389691 ?auto_389698 ) ) ( not ( = ?auto_389692 ?auto_389693 ) ) ( not ( = ?auto_389692 ?auto_389694 ) ) ( not ( = ?auto_389692 ?auto_389695 ) ) ( not ( = ?auto_389692 ?auto_389696 ) ) ( not ( = ?auto_389692 ?auto_389697 ) ) ( not ( = ?auto_389692 ?auto_389698 ) ) ( not ( = ?auto_389693 ?auto_389694 ) ) ( not ( = ?auto_389693 ?auto_389695 ) ) ( not ( = ?auto_389693 ?auto_389696 ) ) ( not ( = ?auto_389693 ?auto_389697 ) ) ( not ( = ?auto_389693 ?auto_389698 ) ) ( not ( = ?auto_389694 ?auto_389695 ) ) ( not ( = ?auto_389694 ?auto_389696 ) ) ( not ( = ?auto_389694 ?auto_389697 ) ) ( not ( = ?auto_389694 ?auto_389698 ) ) ( not ( = ?auto_389695 ?auto_389696 ) ) ( not ( = ?auto_389695 ?auto_389697 ) ) ( not ( = ?auto_389695 ?auto_389698 ) ) ( not ( = ?auto_389696 ?auto_389697 ) ) ( not ( = ?auto_389696 ?auto_389698 ) ) ( not ( = ?auto_389697 ?auto_389698 ) ) ( ON ?auto_389696 ?auto_389697 ) ( ON ?auto_389695 ?auto_389696 ) ( ON ?auto_389694 ?auto_389695 ) ( CLEAR ?auto_389692 ) ( ON ?auto_389693 ?auto_389694 ) ( CLEAR ?auto_389693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389685 ?auto_389686 ?auto_389687 ?auto_389688 ?auto_389689 ?auto_389690 ?auto_389691 ?auto_389692 ?auto_389693 )
      ( MAKE-13PILE ?auto_389685 ?auto_389686 ?auto_389687 ?auto_389688 ?auto_389689 ?auto_389690 ?auto_389691 ?auto_389692 ?auto_389693 ?auto_389694 ?auto_389695 ?auto_389696 ?auto_389697 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389712 - BLOCK
      ?auto_389713 - BLOCK
      ?auto_389714 - BLOCK
      ?auto_389715 - BLOCK
      ?auto_389716 - BLOCK
      ?auto_389717 - BLOCK
      ?auto_389718 - BLOCK
      ?auto_389719 - BLOCK
      ?auto_389720 - BLOCK
      ?auto_389721 - BLOCK
      ?auto_389722 - BLOCK
      ?auto_389723 - BLOCK
      ?auto_389724 - BLOCK
    )
    :vars
    (
      ?auto_389725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389724 ?auto_389725 ) ( ON-TABLE ?auto_389712 ) ( ON ?auto_389713 ?auto_389712 ) ( ON ?auto_389714 ?auto_389713 ) ( ON ?auto_389715 ?auto_389714 ) ( ON ?auto_389716 ?auto_389715 ) ( ON ?auto_389717 ?auto_389716 ) ( ON ?auto_389718 ?auto_389717 ) ( ON ?auto_389719 ?auto_389718 ) ( not ( = ?auto_389712 ?auto_389713 ) ) ( not ( = ?auto_389712 ?auto_389714 ) ) ( not ( = ?auto_389712 ?auto_389715 ) ) ( not ( = ?auto_389712 ?auto_389716 ) ) ( not ( = ?auto_389712 ?auto_389717 ) ) ( not ( = ?auto_389712 ?auto_389718 ) ) ( not ( = ?auto_389712 ?auto_389719 ) ) ( not ( = ?auto_389712 ?auto_389720 ) ) ( not ( = ?auto_389712 ?auto_389721 ) ) ( not ( = ?auto_389712 ?auto_389722 ) ) ( not ( = ?auto_389712 ?auto_389723 ) ) ( not ( = ?auto_389712 ?auto_389724 ) ) ( not ( = ?auto_389712 ?auto_389725 ) ) ( not ( = ?auto_389713 ?auto_389714 ) ) ( not ( = ?auto_389713 ?auto_389715 ) ) ( not ( = ?auto_389713 ?auto_389716 ) ) ( not ( = ?auto_389713 ?auto_389717 ) ) ( not ( = ?auto_389713 ?auto_389718 ) ) ( not ( = ?auto_389713 ?auto_389719 ) ) ( not ( = ?auto_389713 ?auto_389720 ) ) ( not ( = ?auto_389713 ?auto_389721 ) ) ( not ( = ?auto_389713 ?auto_389722 ) ) ( not ( = ?auto_389713 ?auto_389723 ) ) ( not ( = ?auto_389713 ?auto_389724 ) ) ( not ( = ?auto_389713 ?auto_389725 ) ) ( not ( = ?auto_389714 ?auto_389715 ) ) ( not ( = ?auto_389714 ?auto_389716 ) ) ( not ( = ?auto_389714 ?auto_389717 ) ) ( not ( = ?auto_389714 ?auto_389718 ) ) ( not ( = ?auto_389714 ?auto_389719 ) ) ( not ( = ?auto_389714 ?auto_389720 ) ) ( not ( = ?auto_389714 ?auto_389721 ) ) ( not ( = ?auto_389714 ?auto_389722 ) ) ( not ( = ?auto_389714 ?auto_389723 ) ) ( not ( = ?auto_389714 ?auto_389724 ) ) ( not ( = ?auto_389714 ?auto_389725 ) ) ( not ( = ?auto_389715 ?auto_389716 ) ) ( not ( = ?auto_389715 ?auto_389717 ) ) ( not ( = ?auto_389715 ?auto_389718 ) ) ( not ( = ?auto_389715 ?auto_389719 ) ) ( not ( = ?auto_389715 ?auto_389720 ) ) ( not ( = ?auto_389715 ?auto_389721 ) ) ( not ( = ?auto_389715 ?auto_389722 ) ) ( not ( = ?auto_389715 ?auto_389723 ) ) ( not ( = ?auto_389715 ?auto_389724 ) ) ( not ( = ?auto_389715 ?auto_389725 ) ) ( not ( = ?auto_389716 ?auto_389717 ) ) ( not ( = ?auto_389716 ?auto_389718 ) ) ( not ( = ?auto_389716 ?auto_389719 ) ) ( not ( = ?auto_389716 ?auto_389720 ) ) ( not ( = ?auto_389716 ?auto_389721 ) ) ( not ( = ?auto_389716 ?auto_389722 ) ) ( not ( = ?auto_389716 ?auto_389723 ) ) ( not ( = ?auto_389716 ?auto_389724 ) ) ( not ( = ?auto_389716 ?auto_389725 ) ) ( not ( = ?auto_389717 ?auto_389718 ) ) ( not ( = ?auto_389717 ?auto_389719 ) ) ( not ( = ?auto_389717 ?auto_389720 ) ) ( not ( = ?auto_389717 ?auto_389721 ) ) ( not ( = ?auto_389717 ?auto_389722 ) ) ( not ( = ?auto_389717 ?auto_389723 ) ) ( not ( = ?auto_389717 ?auto_389724 ) ) ( not ( = ?auto_389717 ?auto_389725 ) ) ( not ( = ?auto_389718 ?auto_389719 ) ) ( not ( = ?auto_389718 ?auto_389720 ) ) ( not ( = ?auto_389718 ?auto_389721 ) ) ( not ( = ?auto_389718 ?auto_389722 ) ) ( not ( = ?auto_389718 ?auto_389723 ) ) ( not ( = ?auto_389718 ?auto_389724 ) ) ( not ( = ?auto_389718 ?auto_389725 ) ) ( not ( = ?auto_389719 ?auto_389720 ) ) ( not ( = ?auto_389719 ?auto_389721 ) ) ( not ( = ?auto_389719 ?auto_389722 ) ) ( not ( = ?auto_389719 ?auto_389723 ) ) ( not ( = ?auto_389719 ?auto_389724 ) ) ( not ( = ?auto_389719 ?auto_389725 ) ) ( not ( = ?auto_389720 ?auto_389721 ) ) ( not ( = ?auto_389720 ?auto_389722 ) ) ( not ( = ?auto_389720 ?auto_389723 ) ) ( not ( = ?auto_389720 ?auto_389724 ) ) ( not ( = ?auto_389720 ?auto_389725 ) ) ( not ( = ?auto_389721 ?auto_389722 ) ) ( not ( = ?auto_389721 ?auto_389723 ) ) ( not ( = ?auto_389721 ?auto_389724 ) ) ( not ( = ?auto_389721 ?auto_389725 ) ) ( not ( = ?auto_389722 ?auto_389723 ) ) ( not ( = ?auto_389722 ?auto_389724 ) ) ( not ( = ?auto_389722 ?auto_389725 ) ) ( not ( = ?auto_389723 ?auto_389724 ) ) ( not ( = ?auto_389723 ?auto_389725 ) ) ( not ( = ?auto_389724 ?auto_389725 ) ) ( ON ?auto_389723 ?auto_389724 ) ( ON ?auto_389722 ?auto_389723 ) ( ON ?auto_389721 ?auto_389722 ) ( CLEAR ?auto_389719 ) ( ON ?auto_389720 ?auto_389721 ) ( CLEAR ?auto_389720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_389712 ?auto_389713 ?auto_389714 ?auto_389715 ?auto_389716 ?auto_389717 ?auto_389718 ?auto_389719 ?auto_389720 )
      ( MAKE-13PILE ?auto_389712 ?auto_389713 ?auto_389714 ?auto_389715 ?auto_389716 ?auto_389717 ?auto_389718 ?auto_389719 ?auto_389720 ?auto_389721 ?auto_389722 ?auto_389723 ?auto_389724 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389739 - BLOCK
      ?auto_389740 - BLOCK
      ?auto_389741 - BLOCK
      ?auto_389742 - BLOCK
      ?auto_389743 - BLOCK
      ?auto_389744 - BLOCK
      ?auto_389745 - BLOCK
      ?auto_389746 - BLOCK
      ?auto_389747 - BLOCK
      ?auto_389748 - BLOCK
      ?auto_389749 - BLOCK
      ?auto_389750 - BLOCK
      ?auto_389751 - BLOCK
    )
    :vars
    (
      ?auto_389752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389751 ?auto_389752 ) ( ON-TABLE ?auto_389739 ) ( ON ?auto_389740 ?auto_389739 ) ( ON ?auto_389741 ?auto_389740 ) ( ON ?auto_389742 ?auto_389741 ) ( ON ?auto_389743 ?auto_389742 ) ( ON ?auto_389744 ?auto_389743 ) ( ON ?auto_389745 ?auto_389744 ) ( not ( = ?auto_389739 ?auto_389740 ) ) ( not ( = ?auto_389739 ?auto_389741 ) ) ( not ( = ?auto_389739 ?auto_389742 ) ) ( not ( = ?auto_389739 ?auto_389743 ) ) ( not ( = ?auto_389739 ?auto_389744 ) ) ( not ( = ?auto_389739 ?auto_389745 ) ) ( not ( = ?auto_389739 ?auto_389746 ) ) ( not ( = ?auto_389739 ?auto_389747 ) ) ( not ( = ?auto_389739 ?auto_389748 ) ) ( not ( = ?auto_389739 ?auto_389749 ) ) ( not ( = ?auto_389739 ?auto_389750 ) ) ( not ( = ?auto_389739 ?auto_389751 ) ) ( not ( = ?auto_389739 ?auto_389752 ) ) ( not ( = ?auto_389740 ?auto_389741 ) ) ( not ( = ?auto_389740 ?auto_389742 ) ) ( not ( = ?auto_389740 ?auto_389743 ) ) ( not ( = ?auto_389740 ?auto_389744 ) ) ( not ( = ?auto_389740 ?auto_389745 ) ) ( not ( = ?auto_389740 ?auto_389746 ) ) ( not ( = ?auto_389740 ?auto_389747 ) ) ( not ( = ?auto_389740 ?auto_389748 ) ) ( not ( = ?auto_389740 ?auto_389749 ) ) ( not ( = ?auto_389740 ?auto_389750 ) ) ( not ( = ?auto_389740 ?auto_389751 ) ) ( not ( = ?auto_389740 ?auto_389752 ) ) ( not ( = ?auto_389741 ?auto_389742 ) ) ( not ( = ?auto_389741 ?auto_389743 ) ) ( not ( = ?auto_389741 ?auto_389744 ) ) ( not ( = ?auto_389741 ?auto_389745 ) ) ( not ( = ?auto_389741 ?auto_389746 ) ) ( not ( = ?auto_389741 ?auto_389747 ) ) ( not ( = ?auto_389741 ?auto_389748 ) ) ( not ( = ?auto_389741 ?auto_389749 ) ) ( not ( = ?auto_389741 ?auto_389750 ) ) ( not ( = ?auto_389741 ?auto_389751 ) ) ( not ( = ?auto_389741 ?auto_389752 ) ) ( not ( = ?auto_389742 ?auto_389743 ) ) ( not ( = ?auto_389742 ?auto_389744 ) ) ( not ( = ?auto_389742 ?auto_389745 ) ) ( not ( = ?auto_389742 ?auto_389746 ) ) ( not ( = ?auto_389742 ?auto_389747 ) ) ( not ( = ?auto_389742 ?auto_389748 ) ) ( not ( = ?auto_389742 ?auto_389749 ) ) ( not ( = ?auto_389742 ?auto_389750 ) ) ( not ( = ?auto_389742 ?auto_389751 ) ) ( not ( = ?auto_389742 ?auto_389752 ) ) ( not ( = ?auto_389743 ?auto_389744 ) ) ( not ( = ?auto_389743 ?auto_389745 ) ) ( not ( = ?auto_389743 ?auto_389746 ) ) ( not ( = ?auto_389743 ?auto_389747 ) ) ( not ( = ?auto_389743 ?auto_389748 ) ) ( not ( = ?auto_389743 ?auto_389749 ) ) ( not ( = ?auto_389743 ?auto_389750 ) ) ( not ( = ?auto_389743 ?auto_389751 ) ) ( not ( = ?auto_389743 ?auto_389752 ) ) ( not ( = ?auto_389744 ?auto_389745 ) ) ( not ( = ?auto_389744 ?auto_389746 ) ) ( not ( = ?auto_389744 ?auto_389747 ) ) ( not ( = ?auto_389744 ?auto_389748 ) ) ( not ( = ?auto_389744 ?auto_389749 ) ) ( not ( = ?auto_389744 ?auto_389750 ) ) ( not ( = ?auto_389744 ?auto_389751 ) ) ( not ( = ?auto_389744 ?auto_389752 ) ) ( not ( = ?auto_389745 ?auto_389746 ) ) ( not ( = ?auto_389745 ?auto_389747 ) ) ( not ( = ?auto_389745 ?auto_389748 ) ) ( not ( = ?auto_389745 ?auto_389749 ) ) ( not ( = ?auto_389745 ?auto_389750 ) ) ( not ( = ?auto_389745 ?auto_389751 ) ) ( not ( = ?auto_389745 ?auto_389752 ) ) ( not ( = ?auto_389746 ?auto_389747 ) ) ( not ( = ?auto_389746 ?auto_389748 ) ) ( not ( = ?auto_389746 ?auto_389749 ) ) ( not ( = ?auto_389746 ?auto_389750 ) ) ( not ( = ?auto_389746 ?auto_389751 ) ) ( not ( = ?auto_389746 ?auto_389752 ) ) ( not ( = ?auto_389747 ?auto_389748 ) ) ( not ( = ?auto_389747 ?auto_389749 ) ) ( not ( = ?auto_389747 ?auto_389750 ) ) ( not ( = ?auto_389747 ?auto_389751 ) ) ( not ( = ?auto_389747 ?auto_389752 ) ) ( not ( = ?auto_389748 ?auto_389749 ) ) ( not ( = ?auto_389748 ?auto_389750 ) ) ( not ( = ?auto_389748 ?auto_389751 ) ) ( not ( = ?auto_389748 ?auto_389752 ) ) ( not ( = ?auto_389749 ?auto_389750 ) ) ( not ( = ?auto_389749 ?auto_389751 ) ) ( not ( = ?auto_389749 ?auto_389752 ) ) ( not ( = ?auto_389750 ?auto_389751 ) ) ( not ( = ?auto_389750 ?auto_389752 ) ) ( not ( = ?auto_389751 ?auto_389752 ) ) ( ON ?auto_389750 ?auto_389751 ) ( ON ?auto_389749 ?auto_389750 ) ( ON ?auto_389748 ?auto_389749 ) ( ON ?auto_389747 ?auto_389748 ) ( CLEAR ?auto_389745 ) ( ON ?auto_389746 ?auto_389747 ) ( CLEAR ?auto_389746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389739 ?auto_389740 ?auto_389741 ?auto_389742 ?auto_389743 ?auto_389744 ?auto_389745 ?auto_389746 )
      ( MAKE-13PILE ?auto_389739 ?auto_389740 ?auto_389741 ?auto_389742 ?auto_389743 ?auto_389744 ?auto_389745 ?auto_389746 ?auto_389747 ?auto_389748 ?auto_389749 ?auto_389750 ?auto_389751 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389766 - BLOCK
      ?auto_389767 - BLOCK
      ?auto_389768 - BLOCK
      ?auto_389769 - BLOCK
      ?auto_389770 - BLOCK
      ?auto_389771 - BLOCK
      ?auto_389772 - BLOCK
      ?auto_389773 - BLOCK
      ?auto_389774 - BLOCK
      ?auto_389775 - BLOCK
      ?auto_389776 - BLOCK
      ?auto_389777 - BLOCK
      ?auto_389778 - BLOCK
    )
    :vars
    (
      ?auto_389779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389778 ?auto_389779 ) ( ON-TABLE ?auto_389766 ) ( ON ?auto_389767 ?auto_389766 ) ( ON ?auto_389768 ?auto_389767 ) ( ON ?auto_389769 ?auto_389768 ) ( ON ?auto_389770 ?auto_389769 ) ( ON ?auto_389771 ?auto_389770 ) ( ON ?auto_389772 ?auto_389771 ) ( not ( = ?auto_389766 ?auto_389767 ) ) ( not ( = ?auto_389766 ?auto_389768 ) ) ( not ( = ?auto_389766 ?auto_389769 ) ) ( not ( = ?auto_389766 ?auto_389770 ) ) ( not ( = ?auto_389766 ?auto_389771 ) ) ( not ( = ?auto_389766 ?auto_389772 ) ) ( not ( = ?auto_389766 ?auto_389773 ) ) ( not ( = ?auto_389766 ?auto_389774 ) ) ( not ( = ?auto_389766 ?auto_389775 ) ) ( not ( = ?auto_389766 ?auto_389776 ) ) ( not ( = ?auto_389766 ?auto_389777 ) ) ( not ( = ?auto_389766 ?auto_389778 ) ) ( not ( = ?auto_389766 ?auto_389779 ) ) ( not ( = ?auto_389767 ?auto_389768 ) ) ( not ( = ?auto_389767 ?auto_389769 ) ) ( not ( = ?auto_389767 ?auto_389770 ) ) ( not ( = ?auto_389767 ?auto_389771 ) ) ( not ( = ?auto_389767 ?auto_389772 ) ) ( not ( = ?auto_389767 ?auto_389773 ) ) ( not ( = ?auto_389767 ?auto_389774 ) ) ( not ( = ?auto_389767 ?auto_389775 ) ) ( not ( = ?auto_389767 ?auto_389776 ) ) ( not ( = ?auto_389767 ?auto_389777 ) ) ( not ( = ?auto_389767 ?auto_389778 ) ) ( not ( = ?auto_389767 ?auto_389779 ) ) ( not ( = ?auto_389768 ?auto_389769 ) ) ( not ( = ?auto_389768 ?auto_389770 ) ) ( not ( = ?auto_389768 ?auto_389771 ) ) ( not ( = ?auto_389768 ?auto_389772 ) ) ( not ( = ?auto_389768 ?auto_389773 ) ) ( not ( = ?auto_389768 ?auto_389774 ) ) ( not ( = ?auto_389768 ?auto_389775 ) ) ( not ( = ?auto_389768 ?auto_389776 ) ) ( not ( = ?auto_389768 ?auto_389777 ) ) ( not ( = ?auto_389768 ?auto_389778 ) ) ( not ( = ?auto_389768 ?auto_389779 ) ) ( not ( = ?auto_389769 ?auto_389770 ) ) ( not ( = ?auto_389769 ?auto_389771 ) ) ( not ( = ?auto_389769 ?auto_389772 ) ) ( not ( = ?auto_389769 ?auto_389773 ) ) ( not ( = ?auto_389769 ?auto_389774 ) ) ( not ( = ?auto_389769 ?auto_389775 ) ) ( not ( = ?auto_389769 ?auto_389776 ) ) ( not ( = ?auto_389769 ?auto_389777 ) ) ( not ( = ?auto_389769 ?auto_389778 ) ) ( not ( = ?auto_389769 ?auto_389779 ) ) ( not ( = ?auto_389770 ?auto_389771 ) ) ( not ( = ?auto_389770 ?auto_389772 ) ) ( not ( = ?auto_389770 ?auto_389773 ) ) ( not ( = ?auto_389770 ?auto_389774 ) ) ( not ( = ?auto_389770 ?auto_389775 ) ) ( not ( = ?auto_389770 ?auto_389776 ) ) ( not ( = ?auto_389770 ?auto_389777 ) ) ( not ( = ?auto_389770 ?auto_389778 ) ) ( not ( = ?auto_389770 ?auto_389779 ) ) ( not ( = ?auto_389771 ?auto_389772 ) ) ( not ( = ?auto_389771 ?auto_389773 ) ) ( not ( = ?auto_389771 ?auto_389774 ) ) ( not ( = ?auto_389771 ?auto_389775 ) ) ( not ( = ?auto_389771 ?auto_389776 ) ) ( not ( = ?auto_389771 ?auto_389777 ) ) ( not ( = ?auto_389771 ?auto_389778 ) ) ( not ( = ?auto_389771 ?auto_389779 ) ) ( not ( = ?auto_389772 ?auto_389773 ) ) ( not ( = ?auto_389772 ?auto_389774 ) ) ( not ( = ?auto_389772 ?auto_389775 ) ) ( not ( = ?auto_389772 ?auto_389776 ) ) ( not ( = ?auto_389772 ?auto_389777 ) ) ( not ( = ?auto_389772 ?auto_389778 ) ) ( not ( = ?auto_389772 ?auto_389779 ) ) ( not ( = ?auto_389773 ?auto_389774 ) ) ( not ( = ?auto_389773 ?auto_389775 ) ) ( not ( = ?auto_389773 ?auto_389776 ) ) ( not ( = ?auto_389773 ?auto_389777 ) ) ( not ( = ?auto_389773 ?auto_389778 ) ) ( not ( = ?auto_389773 ?auto_389779 ) ) ( not ( = ?auto_389774 ?auto_389775 ) ) ( not ( = ?auto_389774 ?auto_389776 ) ) ( not ( = ?auto_389774 ?auto_389777 ) ) ( not ( = ?auto_389774 ?auto_389778 ) ) ( not ( = ?auto_389774 ?auto_389779 ) ) ( not ( = ?auto_389775 ?auto_389776 ) ) ( not ( = ?auto_389775 ?auto_389777 ) ) ( not ( = ?auto_389775 ?auto_389778 ) ) ( not ( = ?auto_389775 ?auto_389779 ) ) ( not ( = ?auto_389776 ?auto_389777 ) ) ( not ( = ?auto_389776 ?auto_389778 ) ) ( not ( = ?auto_389776 ?auto_389779 ) ) ( not ( = ?auto_389777 ?auto_389778 ) ) ( not ( = ?auto_389777 ?auto_389779 ) ) ( not ( = ?auto_389778 ?auto_389779 ) ) ( ON ?auto_389777 ?auto_389778 ) ( ON ?auto_389776 ?auto_389777 ) ( ON ?auto_389775 ?auto_389776 ) ( ON ?auto_389774 ?auto_389775 ) ( CLEAR ?auto_389772 ) ( ON ?auto_389773 ?auto_389774 ) ( CLEAR ?auto_389773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_389766 ?auto_389767 ?auto_389768 ?auto_389769 ?auto_389770 ?auto_389771 ?auto_389772 ?auto_389773 )
      ( MAKE-13PILE ?auto_389766 ?auto_389767 ?auto_389768 ?auto_389769 ?auto_389770 ?auto_389771 ?auto_389772 ?auto_389773 ?auto_389774 ?auto_389775 ?auto_389776 ?auto_389777 ?auto_389778 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389793 - BLOCK
      ?auto_389794 - BLOCK
      ?auto_389795 - BLOCK
      ?auto_389796 - BLOCK
      ?auto_389797 - BLOCK
      ?auto_389798 - BLOCK
      ?auto_389799 - BLOCK
      ?auto_389800 - BLOCK
      ?auto_389801 - BLOCK
      ?auto_389802 - BLOCK
      ?auto_389803 - BLOCK
      ?auto_389804 - BLOCK
      ?auto_389805 - BLOCK
    )
    :vars
    (
      ?auto_389806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389805 ?auto_389806 ) ( ON-TABLE ?auto_389793 ) ( ON ?auto_389794 ?auto_389793 ) ( ON ?auto_389795 ?auto_389794 ) ( ON ?auto_389796 ?auto_389795 ) ( ON ?auto_389797 ?auto_389796 ) ( ON ?auto_389798 ?auto_389797 ) ( not ( = ?auto_389793 ?auto_389794 ) ) ( not ( = ?auto_389793 ?auto_389795 ) ) ( not ( = ?auto_389793 ?auto_389796 ) ) ( not ( = ?auto_389793 ?auto_389797 ) ) ( not ( = ?auto_389793 ?auto_389798 ) ) ( not ( = ?auto_389793 ?auto_389799 ) ) ( not ( = ?auto_389793 ?auto_389800 ) ) ( not ( = ?auto_389793 ?auto_389801 ) ) ( not ( = ?auto_389793 ?auto_389802 ) ) ( not ( = ?auto_389793 ?auto_389803 ) ) ( not ( = ?auto_389793 ?auto_389804 ) ) ( not ( = ?auto_389793 ?auto_389805 ) ) ( not ( = ?auto_389793 ?auto_389806 ) ) ( not ( = ?auto_389794 ?auto_389795 ) ) ( not ( = ?auto_389794 ?auto_389796 ) ) ( not ( = ?auto_389794 ?auto_389797 ) ) ( not ( = ?auto_389794 ?auto_389798 ) ) ( not ( = ?auto_389794 ?auto_389799 ) ) ( not ( = ?auto_389794 ?auto_389800 ) ) ( not ( = ?auto_389794 ?auto_389801 ) ) ( not ( = ?auto_389794 ?auto_389802 ) ) ( not ( = ?auto_389794 ?auto_389803 ) ) ( not ( = ?auto_389794 ?auto_389804 ) ) ( not ( = ?auto_389794 ?auto_389805 ) ) ( not ( = ?auto_389794 ?auto_389806 ) ) ( not ( = ?auto_389795 ?auto_389796 ) ) ( not ( = ?auto_389795 ?auto_389797 ) ) ( not ( = ?auto_389795 ?auto_389798 ) ) ( not ( = ?auto_389795 ?auto_389799 ) ) ( not ( = ?auto_389795 ?auto_389800 ) ) ( not ( = ?auto_389795 ?auto_389801 ) ) ( not ( = ?auto_389795 ?auto_389802 ) ) ( not ( = ?auto_389795 ?auto_389803 ) ) ( not ( = ?auto_389795 ?auto_389804 ) ) ( not ( = ?auto_389795 ?auto_389805 ) ) ( not ( = ?auto_389795 ?auto_389806 ) ) ( not ( = ?auto_389796 ?auto_389797 ) ) ( not ( = ?auto_389796 ?auto_389798 ) ) ( not ( = ?auto_389796 ?auto_389799 ) ) ( not ( = ?auto_389796 ?auto_389800 ) ) ( not ( = ?auto_389796 ?auto_389801 ) ) ( not ( = ?auto_389796 ?auto_389802 ) ) ( not ( = ?auto_389796 ?auto_389803 ) ) ( not ( = ?auto_389796 ?auto_389804 ) ) ( not ( = ?auto_389796 ?auto_389805 ) ) ( not ( = ?auto_389796 ?auto_389806 ) ) ( not ( = ?auto_389797 ?auto_389798 ) ) ( not ( = ?auto_389797 ?auto_389799 ) ) ( not ( = ?auto_389797 ?auto_389800 ) ) ( not ( = ?auto_389797 ?auto_389801 ) ) ( not ( = ?auto_389797 ?auto_389802 ) ) ( not ( = ?auto_389797 ?auto_389803 ) ) ( not ( = ?auto_389797 ?auto_389804 ) ) ( not ( = ?auto_389797 ?auto_389805 ) ) ( not ( = ?auto_389797 ?auto_389806 ) ) ( not ( = ?auto_389798 ?auto_389799 ) ) ( not ( = ?auto_389798 ?auto_389800 ) ) ( not ( = ?auto_389798 ?auto_389801 ) ) ( not ( = ?auto_389798 ?auto_389802 ) ) ( not ( = ?auto_389798 ?auto_389803 ) ) ( not ( = ?auto_389798 ?auto_389804 ) ) ( not ( = ?auto_389798 ?auto_389805 ) ) ( not ( = ?auto_389798 ?auto_389806 ) ) ( not ( = ?auto_389799 ?auto_389800 ) ) ( not ( = ?auto_389799 ?auto_389801 ) ) ( not ( = ?auto_389799 ?auto_389802 ) ) ( not ( = ?auto_389799 ?auto_389803 ) ) ( not ( = ?auto_389799 ?auto_389804 ) ) ( not ( = ?auto_389799 ?auto_389805 ) ) ( not ( = ?auto_389799 ?auto_389806 ) ) ( not ( = ?auto_389800 ?auto_389801 ) ) ( not ( = ?auto_389800 ?auto_389802 ) ) ( not ( = ?auto_389800 ?auto_389803 ) ) ( not ( = ?auto_389800 ?auto_389804 ) ) ( not ( = ?auto_389800 ?auto_389805 ) ) ( not ( = ?auto_389800 ?auto_389806 ) ) ( not ( = ?auto_389801 ?auto_389802 ) ) ( not ( = ?auto_389801 ?auto_389803 ) ) ( not ( = ?auto_389801 ?auto_389804 ) ) ( not ( = ?auto_389801 ?auto_389805 ) ) ( not ( = ?auto_389801 ?auto_389806 ) ) ( not ( = ?auto_389802 ?auto_389803 ) ) ( not ( = ?auto_389802 ?auto_389804 ) ) ( not ( = ?auto_389802 ?auto_389805 ) ) ( not ( = ?auto_389802 ?auto_389806 ) ) ( not ( = ?auto_389803 ?auto_389804 ) ) ( not ( = ?auto_389803 ?auto_389805 ) ) ( not ( = ?auto_389803 ?auto_389806 ) ) ( not ( = ?auto_389804 ?auto_389805 ) ) ( not ( = ?auto_389804 ?auto_389806 ) ) ( not ( = ?auto_389805 ?auto_389806 ) ) ( ON ?auto_389804 ?auto_389805 ) ( ON ?auto_389803 ?auto_389804 ) ( ON ?auto_389802 ?auto_389803 ) ( ON ?auto_389801 ?auto_389802 ) ( ON ?auto_389800 ?auto_389801 ) ( CLEAR ?auto_389798 ) ( ON ?auto_389799 ?auto_389800 ) ( CLEAR ?auto_389799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389793 ?auto_389794 ?auto_389795 ?auto_389796 ?auto_389797 ?auto_389798 ?auto_389799 )
      ( MAKE-13PILE ?auto_389793 ?auto_389794 ?auto_389795 ?auto_389796 ?auto_389797 ?auto_389798 ?auto_389799 ?auto_389800 ?auto_389801 ?auto_389802 ?auto_389803 ?auto_389804 ?auto_389805 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389820 - BLOCK
      ?auto_389821 - BLOCK
      ?auto_389822 - BLOCK
      ?auto_389823 - BLOCK
      ?auto_389824 - BLOCK
      ?auto_389825 - BLOCK
      ?auto_389826 - BLOCK
      ?auto_389827 - BLOCK
      ?auto_389828 - BLOCK
      ?auto_389829 - BLOCK
      ?auto_389830 - BLOCK
      ?auto_389831 - BLOCK
      ?auto_389832 - BLOCK
    )
    :vars
    (
      ?auto_389833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389832 ?auto_389833 ) ( ON-TABLE ?auto_389820 ) ( ON ?auto_389821 ?auto_389820 ) ( ON ?auto_389822 ?auto_389821 ) ( ON ?auto_389823 ?auto_389822 ) ( ON ?auto_389824 ?auto_389823 ) ( ON ?auto_389825 ?auto_389824 ) ( not ( = ?auto_389820 ?auto_389821 ) ) ( not ( = ?auto_389820 ?auto_389822 ) ) ( not ( = ?auto_389820 ?auto_389823 ) ) ( not ( = ?auto_389820 ?auto_389824 ) ) ( not ( = ?auto_389820 ?auto_389825 ) ) ( not ( = ?auto_389820 ?auto_389826 ) ) ( not ( = ?auto_389820 ?auto_389827 ) ) ( not ( = ?auto_389820 ?auto_389828 ) ) ( not ( = ?auto_389820 ?auto_389829 ) ) ( not ( = ?auto_389820 ?auto_389830 ) ) ( not ( = ?auto_389820 ?auto_389831 ) ) ( not ( = ?auto_389820 ?auto_389832 ) ) ( not ( = ?auto_389820 ?auto_389833 ) ) ( not ( = ?auto_389821 ?auto_389822 ) ) ( not ( = ?auto_389821 ?auto_389823 ) ) ( not ( = ?auto_389821 ?auto_389824 ) ) ( not ( = ?auto_389821 ?auto_389825 ) ) ( not ( = ?auto_389821 ?auto_389826 ) ) ( not ( = ?auto_389821 ?auto_389827 ) ) ( not ( = ?auto_389821 ?auto_389828 ) ) ( not ( = ?auto_389821 ?auto_389829 ) ) ( not ( = ?auto_389821 ?auto_389830 ) ) ( not ( = ?auto_389821 ?auto_389831 ) ) ( not ( = ?auto_389821 ?auto_389832 ) ) ( not ( = ?auto_389821 ?auto_389833 ) ) ( not ( = ?auto_389822 ?auto_389823 ) ) ( not ( = ?auto_389822 ?auto_389824 ) ) ( not ( = ?auto_389822 ?auto_389825 ) ) ( not ( = ?auto_389822 ?auto_389826 ) ) ( not ( = ?auto_389822 ?auto_389827 ) ) ( not ( = ?auto_389822 ?auto_389828 ) ) ( not ( = ?auto_389822 ?auto_389829 ) ) ( not ( = ?auto_389822 ?auto_389830 ) ) ( not ( = ?auto_389822 ?auto_389831 ) ) ( not ( = ?auto_389822 ?auto_389832 ) ) ( not ( = ?auto_389822 ?auto_389833 ) ) ( not ( = ?auto_389823 ?auto_389824 ) ) ( not ( = ?auto_389823 ?auto_389825 ) ) ( not ( = ?auto_389823 ?auto_389826 ) ) ( not ( = ?auto_389823 ?auto_389827 ) ) ( not ( = ?auto_389823 ?auto_389828 ) ) ( not ( = ?auto_389823 ?auto_389829 ) ) ( not ( = ?auto_389823 ?auto_389830 ) ) ( not ( = ?auto_389823 ?auto_389831 ) ) ( not ( = ?auto_389823 ?auto_389832 ) ) ( not ( = ?auto_389823 ?auto_389833 ) ) ( not ( = ?auto_389824 ?auto_389825 ) ) ( not ( = ?auto_389824 ?auto_389826 ) ) ( not ( = ?auto_389824 ?auto_389827 ) ) ( not ( = ?auto_389824 ?auto_389828 ) ) ( not ( = ?auto_389824 ?auto_389829 ) ) ( not ( = ?auto_389824 ?auto_389830 ) ) ( not ( = ?auto_389824 ?auto_389831 ) ) ( not ( = ?auto_389824 ?auto_389832 ) ) ( not ( = ?auto_389824 ?auto_389833 ) ) ( not ( = ?auto_389825 ?auto_389826 ) ) ( not ( = ?auto_389825 ?auto_389827 ) ) ( not ( = ?auto_389825 ?auto_389828 ) ) ( not ( = ?auto_389825 ?auto_389829 ) ) ( not ( = ?auto_389825 ?auto_389830 ) ) ( not ( = ?auto_389825 ?auto_389831 ) ) ( not ( = ?auto_389825 ?auto_389832 ) ) ( not ( = ?auto_389825 ?auto_389833 ) ) ( not ( = ?auto_389826 ?auto_389827 ) ) ( not ( = ?auto_389826 ?auto_389828 ) ) ( not ( = ?auto_389826 ?auto_389829 ) ) ( not ( = ?auto_389826 ?auto_389830 ) ) ( not ( = ?auto_389826 ?auto_389831 ) ) ( not ( = ?auto_389826 ?auto_389832 ) ) ( not ( = ?auto_389826 ?auto_389833 ) ) ( not ( = ?auto_389827 ?auto_389828 ) ) ( not ( = ?auto_389827 ?auto_389829 ) ) ( not ( = ?auto_389827 ?auto_389830 ) ) ( not ( = ?auto_389827 ?auto_389831 ) ) ( not ( = ?auto_389827 ?auto_389832 ) ) ( not ( = ?auto_389827 ?auto_389833 ) ) ( not ( = ?auto_389828 ?auto_389829 ) ) ( not ( = ?auto_389828 ?auto_389830 ) ) ( not ( = ?auto_389828 ?auto_389831 ) ) ( not ( = ?auto_389828 ?auto_389832 ) ) ( not ( = ?auto_389828 ?auto_389833 ) ) ( not ( = ?auto_389829 ?auto_389830 ) ) ( not ( = ?auto_389829 ?auto_389831 ) ) ( not ( = ?auto_389829 ?auto_389832 ) ) ( not ( = ?auto_389829 ?auto_389833 ) ) ( not ( = ?auto_389830 ?auto_389831 ) ) ( not ( = ?auto_389830 ?auto_389832 ) ) ( not ( = ?auto_389830 ?auto_389833 ) ) ( not ( = ?auto_389831 ?auto_389832 ) ) ( not ( = ?auto_389831 ?auto_389833 ) ) ( not ( = ?auto_389832 ?auto_389833 ) ) ( ON ?auto_389831 ?auto_389832 ) ( ON ?auto_389830 ?auto_389831 ) ( ON ?auto_389829 ?auto_389830 ) ( ON ?auto_389828 ?auto_389829 ) ( ON ?auto_389827 ?auto_389828 ) ( CLEAR ?auto_389825 ) ( ON ?auto_389826 ?auto_389827 ) ( CLEAR ?auto_389826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_389820 ?auto_389821 ?auto_389822 ?auto_389823 ?auto_389824 ?auto_389825 ?auto_389826 )
      ( MAKE-13PILE ?auto_389820 ?auto_389821 ?auto_389822 ?auto_389823 ?auto_389824 ?auto_389825 ?auto_389826 ?auto_389827 ?auto_389828 ?auto_389829 ?auto_389830 ?auto_389831 ?auto_389832 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389847 - BLOCK
      ?auto_389848 - BLOCK
      ?auto_389849 - BLOCK
      ?auto_389850 - BLOCK
      ?auto_389851 - BLOCK
      ?auto_389852 - BLOCK
      ?auto_389853 - BLOCK
      ?auto_389854 - BLOCK
      ?auto_389855 - BLOCK
      ?auto_389856 - BLOCK
      ?auto_389857 - BLOCK
      ?auto_389858 - BLOCK
      ?auto_389859 - BLOCK
    )
    :vars
    (
      ?auto_389860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389859 ?auto_389860 ) ( ON-TABLE ?auto_389847 ) ( ON ?auto_389848 ?auto_389847 ) ( ON ?auto_389849 ?auto_389848 ) ( ON ?auto_389850 ?auto_389849 ) ( ON ?auto_389851 ?auto_389850 ) ( not ( = ?auto_389847 ?auto_389848 ) ) ( not ( = ?auto_389847 ?auto_389849 ) ) ( not ( = ?auto_389847 ?auto_389850 ) ) ( not ( = ?auto_389847 ?auto_389851 ) ) ( not ( = ?auto_389847 ?auto_389852 ) ) ( not ( = ?auto_389847 ?auto_389853 ) ) ( not ( = ?auto_389847 ?auto_389854 ) ) ( not ( = ?auto_389847 ?auto_389855 ) ) ( not ( = ?auto_389847 ?auto_389856 ) ) ( not ( = ?auto_389847 ?auto_389857 ) ) ( not ( = ?auto_389847 ?auto_389858 ) ) ( not ( = ?auto_389847 ?auto_389859 ) ) ( not ( = ?auto_389847 ?auto_389860 ) ) ( not ( = ?auto_389848 ?auto_389849 ) ) ( not ( = ?auto_389848 ?auto_389850 ) ) ( not ( = ?auto_389848 ?auto_389851 ) ) ( not ( = ?auto_389848 ?auto_389852 ) ) ( not ( = ?auto_389848 ?auto_389853 ) ) ( not ( = ?auto_389848 ?auto_389854 ) ) ( not ( = ?auto_389848 ?auto_389855 ) ) ( not ( = ?auto_389848 ?auto_389856 ) ) ( not ( = ?auto_389848 ?auto_389857 ) ) ( not ( = ?auto_389848 ?auto_389858 ) ) ( not ( = ?auto_389848 ?auto_389859 ) ) ( not ( = ?auto_389848 ?auto_389860 ) ) ( not ( = ?auto_389849 ?auto_389850 ) ) ( not ( = ?auto_389849 ?auto_389851 ) ) ( not ( = ?auto_389849 ?auto_389852 ) ) ( not ( = ?auto_389849 ?auto_389853 ) ) ( not ( = ?auto_389849 ?auto_389854 ) ) ( not ( = ?auto_389849 ?auto_389855 ) ) ( not ( = ?auto_389849 ?auto_389856 ) ) ( not ( = ?auto_389849 ?auto_389857 ) ) ( not ( = ?auto_389849 ?auto_389858 ) ) ( not ( = ?auto_389849 ?auto_389859 ) ) ( not ( = ?auto_389849 ?auto_389860 ) ) ( not ( = ?auto_389850 ?auto_389851 ) ) ( not ( = ?auto_389850 ?auto_389852 ) ) ( not ( = ?auto_389850 ?auto_389853 ) ) ( not ( = ?auto_389850 ?auto_389854 ) ) ( not ( = ?auto_389850 ?auto_389855 ) ) ( not ( = ?auto_389850 ?auto_389856 ) ) ( not ( = ?auto_389850 ?auto_389857 ) ) ( not ( = ?auto_389850 ?auto_389858 ) ) ( not ( = ?auto_389850 ?auto_389859 ) ) ( not ( = ?auto_389850 ?auto_389860 ) ) ( not ( = ?auto_389851 ?auto_389852 ) ) ( not ( = ?auto_389851 ?auto_389853 ) ) ( not ( = ?auto_389851 ?auto_389854 ) ) ( not ( = ?auto_389851 ?auto_389855 ) ) ( not ( = ?auto_389851 ?auto_389856 ) ) ( not ( = ?auto_389851 ?auto_389857 ) ) ( not ( = ?auto_389851 ?auto_389858 ) ) ( not ( = ?auto_389851 ?auto_389859 ) ) ( not ( = ?auto_389851 ?auto_389860 ) ) ( not ( = ?auto_389852 ?auto_389853 ) ) ( not ( = ?auto_389852 ?auto_389854 ) ) ( not ( = ?auto_389852 ?auto_389855 ) ) ( not ( = ?auto_389852 ?auto_389856 ) ) ( not ( = ?auto_389852 ?auto_389857 ) ) ( not ( = ?auto_389852 ?auto_389858 ) ) ( not ( = ?auto_389852 ?auto_389859 ) ) ( not ( = ?auto_389852 ?auto_389860 ) ) ( not ( = ?auto_389853 ?auto_389854 ) ) ( not ( = ?auto_389853 ?auto_389855 ) ) ( not ( = ?auto_389853 ?auto_389856 ) ) ( not ( = ?auto_389853 ?auto_389857 ) ) ( not ( = ?auto_389853 ?auto_389858 ) ) ( not ( = ?auto_389853 ?auto_389859 ) ) ( not ( = ?auto_389853 ?auto_389860 ) ) ( not ( = ?auto_389854 ?auto_389855 ) ) ( not ( = ?auto_389854 ?auto_389856 ) ) ( not ( = ?auto_389854 ?auto_389857 ) ) ( not ( = ?auto_389854 ?auto_389858 ) ) ( not ( = ?auto_389854 ?auto_389859 ) ) ( not ( = ?auto_389854 ?auto_389860 ) ) ( not ( = ?auto_389855 ?auto_389856 ) ) ( not ( = ?auto_389855 ?auto_389857 ) ) ( not ( = ?auto_389855 ?auto_389858 ) ) ( not ( = ?auto_389855 ?auto_389859 ) ) ( not ( = ?auto_389855 ?auto_389860 ) ) ( not ( = ?auto_389856 ?auto_389857 ) ) ( not ( = ?auto_389856 ?auto_389858 ) ) ( not ( = ?auto_389856 ?auto_389859 ) ) ( not ( = ?auto_389856 ?auto_389860 ) ) ( not ( = ?auto_389857 ?auto_389858 ) ) ( not ( = ?auto_389857 ?auto_389859 ) ) ( not ( = ?auto_389857 ?auto_389860 ) ) ( not ( = ?auto_389858 ?auto_389859 ) ) ( not ( = ?auto_389858 ?auto_389860 ) ) ( not ( = ?auto_389859 ?auto_389860 ) ) ( ON ?auto_389858 ?auto_389859 ) ( ON ?auto_389857 ?auto_389858 ) ( ON ?auto_389856 ?auto_389857 ) ( ON ?auto_389855 ?auto_389856 ) ( ON ?auto_389854 ?auto_389855 ) ( ON ?auto_389853 ?auto_389854 ) ( CLEAR ?auto_389851 ) ( ON ?auto_389852 ?auto_389853 ) ( CLEAR ?auto_389852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389847 ?auto_389848 ?auto_389849 ?auto_389850 ?auto_389851 ?auto_389852 )
      ( MAKE-13PILE ?auto_389847 ?auto_389848 ?auto_389849 ?auto_389850 ?auto_389851 ?auto_389852 ?auto_389853 ?auto_389854 ?auto_389855 ?auto_389856 ?auto_389857 ?auto_389858 ?auto_389859 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389874 - BLOCK
      ?auto_389875 - BLOCK
      ?auto_389876 - BLOCK
      ?auto_389877 - BLOCK
      ?auto_389878 - BLOCK
      ?auto_389879 - BLOCK
      ?auto_389880 - BLOCK
      ?auto_389881 - BLOCK
      ?auto_389882 - BLOCK
      ?auto_389883 - BLOCK
      ?auto_389884 - BLOCK
      ?auto_389885 - BLOCK
      ?auto_389886 - BLOCK
    )
    :vars
    (
      ?auto_389887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389886 ?auto_389887 ) ( ON-TABLE ?auto_389874 ) ( ON ?auto_389875 ?auto_389874 ) ( ON ?auto_389876 ?auto_389875 ) ( ON ?auto_389877 ?auto_389876 ) ( ON ?auto_389878 ?auto_389877 ) ( not ( = ?auto_389874 ?auto_389875 ) ) ( not ( = ?auto_389874 ?auto_389876 ) ) ( not ( = ?auto_389874 ?auto_389877 ) ) ( not ( = ?auto_389874 ?auto_389878 ) ) ( not ( = ?auto_389874 ?auto_389879 ) ) ( not ( = ?auto_389874 ?auto_389880 ) ) ( not ( = ?auto_389874 ?auto_389881 ) ) ( not ( = ?auto_389874 ?auto_389882 ) ) ( not ( = ?auto_389874 ?auto_389883 ) ) ( not ( = ?auto_389874 ?auto_389884 ) ) ( not ( = ?auto_389874 ?auto_389885 ) ) ( not ( = ?auto_389874 ?auto_389886 ) ) ( not ( = ?auto_389874 ?auto_389887 ) ) ( not ( = ?auto_389875 ?auto_389876 ) ) ( not ( = ?auto_389875 ?auto_389877 ) ) ( not ( = ?auto_389875 ?auto_389878 ) ) ( not ( = ?auto_389875 ?auto_389879 ) ) ( not ( = ?auto_389875 ?auto_389880 ) ) ( not ( = ?auto_389875 ?auto_389881 ) ) ( not ( = ?auto_389875 ?auto_389882 ) ) ( not ( = ?auto_389875 ?auto_389883 ) ) ( not ( = ?auto_389875 ?auto_389884 ) ) ( not ( = ?auto_389875 ?auto_389885 ) ) ( not ( = ?auto_389875 ?auto_389886 ) ) ( not ( = ?auto_389875 ?auto_389887 ) ) ( not ( = ?auto_389876 ?auto_389877 ) ) ( not ( = ?auto_389876 ?auto_389878 ) ) ( not ( = ?auto_389876 ?auto_389879 ) ) ( not ( = ?auto_389876 ?auto_389880 ) ) ( not ( = ?auto_389876 ?auto_389881 ) ) ( not ( = ?auto_389876 ?auto_389882 ) ) ( not ( = ?auto_389876 ?auto_389883 ) ) ( not ( = ?auto_389876 ?auto_389884 ) ) ( not ( = ?auto_389876 ?auto_389885 ) ) ( not ( = ?auto_389876 ?auto_389886 ) ) ( not ( = ?auto_389876 ?auto_389887 ) ) ( not ( = ?auto_389877 ?auto_389878 ) ) ( not ( = ?auto_389877 ?auto_389879 ) ) ( not ( = ?auto_389877 ?auto_389880 ) ) ( not ( = ?auto_389877 ?auto_389881 ) ) ( not ( = ?auto_389877 ?auto_389882 ) ) ( not ( = ?auto_389877 ?auto_389883 ) ) ( not ( = ?auto_389877 ?auto_389884 ) ) ( not ( = ?auto_389877 ?auto_389885 ) ) ( not ( = ?auto_389877 ?auto_389886 ) ) ( not ( = ?auto_389877 ?auto_389887 ) ) ( not ( = ?auto_389878 ?auto_389879 ) ) ( not ( = ?auto_389878 ?auto_389880 ) ) ( not ( = ?auto_389878 ?auto_389881 ) ) ( not ( = ?auto_389878 ?auto_389882 ) ) ( not ( = ?auto_389878 ?auto_389883 ) ) ( not ( = ?auto_389878 ?auto_389884 ) ) ( not ( = ?auto_389878 ?auto_389885 ) ) ( not ( = ?auto_389878 ?auto_389886 ) ) ( not ( = ?auto_389878 ?auto_389887 ) ) ( not ( = ?auto_389879 ?auto_389880 ) ) ( not ( = ?auto_389879 ?auto_389881 ) ) ( not ( = ?auto_389879 ?auto_389882 ) ) ( not ( = ?auto_389879 ?auto_389883 ) ) ( not ( = ?auto_389879 ?auto_389884 ) ) ( not ( = ?auto_389879 ?auto_389885 ) ) ( not ( = ?auto_389879 ?auto_389886 ) ) ( not ( = ?auto_389879 ?auto_389887 ) ) ( not ( = ?auto_389880 ?auto_389881 ) ) ( not ( = ?auto_389880 ?auto_389882 ) ) ( not ( = ?auto_389880 ?auto_389883 ) ) ( not ( = ?auto_389880 ?auto_389884 ) ) ( not ( = ?auto_389880 ?auto_389885 ) ) ( not ( = ?auto_389880 ?auto_389886 ) ) ( not ( = ?auto_389880 ?auto_389887 ) ) ( not ( = ?auto_389881 ?auto_389882 ) ) ( not ( = ?auto_389881 ?auto_389883 ) ) ( not ( = ?auto_389881 ?auto_389884 ) ) ( not ( = ?auto_389881 ?auto_389885 ) ) ( not ( = ?auto_389881 ?auto_389886 ) ) ( not ( = ?auto_389881 ?auto_389887 ) ) ( not ( = ?auto_389882 ?auto_389883 ) ) ( not ( = ?auto_389882 ?auto_389884 ) ) ( not ( = ?auto_389882 ?auto_389885 ) ) ( not ( = ?auto_389882 ?auto_389886 ) ) ( not ( = ?auto_389882 ?auto_389887 ) ) ( not ( = ?auto_389883 ?auto_389884 ) ) ( not ( = ?auto_389883 ?auto_389885 ) ) ( not ( = ?auto_389883 ?auto_389886 ) ) ( not ( = ?auto_389883 ?auto_389887 ) ) ( not ( = ?auto_389884 ?auto_389885 ) ) ( not ( = ?auto_389884 ?auto_389886 ) ) ( not ( = ?auto_389884 ?auto_389887 ) ) ( not ( = ?auto_389885 ?auto_389886 ) ) ( not ( = ?auto_389885 ?auto_389887 ) ) ( not ( = ?auto_389886 ?auto_389887 ) ) ( ON ?auto_389885 ?auto_389886 ) ( ON ?auto_389884 ?auto_389885 ) ( ON ?auto_389883 ?auto_389884 ) ( ON ?auto_389882 ?auto_389883 ) ( ON ?auto_389881 ?auto_389882 ) ( ON ?auto_389880 ?auto_389881 ) ( CLEAR ?auto_389878 ) ( ON ?auto_389879 ?auto_389880 ) ( CLEAR ?auto_389879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_389874 ?auto_389875 ?auto_389876 ?auto_389877 ?auto_389878 ?auto_389879 )
      ( MAKE-13PILE ?auto_389874 ?auto_389875 ?auto_389876 ?auto_389877 ?auto_389878 ?auto_389879 ?auto_389880 ?auto_389881 ?auto_389882 ?auto_389883 ?auto_389884 ?auto_389885 ?auto_389886 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389901 - BLOCK
      ?auto_389902 - BLOCK
      ?auto_389903 - BLOCK
      ?auto_389904 - BLOCK
      ?auto_389905 - BLOCK
      ?auto_389906 - BLOCK
      ?auto_389907 - BLOCK
      ?auto_389908 - BLOCK
      ?auto_389909 - BLOCK
      ?auto_389910 - BLOCK
      ?auto_389911 - BLOCK
      ?auto_389912 - BLOCK
      ?auto_389913 - BLOCK
    )
    :vars
    (
      ?auto_389914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389913 ?auto_389914 ) ( ON-TABLE ?auto_389901 ) ( ON ?auto_389902 ?auto_389901 ) ( ON ?auto_389903 ?auto_389902 ) ( ON ?auto_389904 ?auto_389903 ) ( not ( = ?auto_389901 ?auto_389902 ) ) ( not ( = ?auto_389901 ?auto_389903 ) ) ( not ( = ?auto_389901 ?auto_389904 ) ) ( not ( = ?auto_389901 ?auto_389905 ) ) ( not ( = ?auto_389901 ?auto_389906 ) ) ( not ( = ?auto_389901 ?auto_389907 ) ) ( not ( = ?auto_389901 ?auto_389908 ) ) ( not ( = ?auto_389901 ?auto_389909 ) ) ( not ( = ?auto_389901 ?auto_389910 ) ) ( not ( = ?auto_389901 ?auto_389911 ) ) ( not ( = ?auto_389901 ?auto_389912 ) ) ( not ( = ?auto_389901 ?auto_389913 ) ) ( not ( = ?auto_389901 ?auto_389914 ) ) ( not ( = ?auto_389902 ?auto_389903 ) ) ( not ( = ?auto_389902 ?auto_389904 ) ) ( not ( = ?auto_389902 ?auto_389905 ) ) ( not ( = ?auto_389902 ?auto_389906 ) ) ( not ( = ?auto_389902 ?auto_389907 ) ) ( not ( = ?auto_389902 ?auto_389908 ) ) ( not ( = ?auto_389902 ?auto_389909 ) ) ( not ( = ?auto_389902 ?auto_389910 ) ) ( not ( = ?auto_389902 ?auto_389911 ) ) ( not ( = ?auto_389902 ?auto_389912 ) ) ( not ( = ?auto_389902 ?auto_389913 ) ) ( not ( = ?auto_389902 ?auto_389914 ) ) ( not ( = ?auto_389903 ?auto_389904 ) ) ( not ( = ?auto_389903 ?auto_389905 ) ) ( not ( = ?auto_389903 ?auto_389906 ) ) ( not ( = ?auto_389903 ?auto_389907 ) ) ( not ( = ?auto_389903 ?auto_389908 ) ) ( not ( = ?auto_389903 ?auto_389909 ) ) ( not ( = ?auto_389903 ?auto_389910 ) ) ( not ( = ?auto_389903 ?auto_389911 ) ) ( not ( = ?auto_389903 ?auto_389912 ) ) ( not ( = ?auto_389903 ?auto_389913 ) ) ( not ( = ?auto_389903 ?auto_389914 ) ) ( not ( = ?auto_389904 ?auto_389905 ) ) ( not ( = ?auto_389904 ?auto_389906 ) ) ( not ( = ?auto_389904 ?auto_389907 ) ) ( not ( = ?auto_389904 ?auto_389908 ) ) ( not ( = ?auto_389904 ?auto_389909 ) ) ( not ( = ?auto_389904 ?auto_389910 ) ) ( not ( = ?auto_389904 ?auto_389911 ) ) ( not ( = ?auto_389904 ?auto_389912 ) ) ( not ( = ?auto_389904 ?auto_389913 ) ) ( not ( = ?auto_389904 ?auto_389914 ) ) ( not ( = ?auto_389905 ?auto_389906 ) ) ( not ( = ?auto_389905 ?auto_389907 ) ) ( not ( = ?auto_389905 ?auto_389908 ) ) ( not ( = ?auto_389905 ?auto_389909 ) ) ( not ( = ?auto_389905 ?auto_389910 ) ) ( not ( = ?auto_389905 ?auto_389911 ) ) ( not ( = ?auto_389905 ?auto_389912 ) ) ( not ( = ?auto_389905 ?auto_389913 ) ) ( not ( = ?auto_389905 ?auto_389914 ) ) ( not ( = ?auto_389906 ?auto_389907 ) ) ( not ( = ?auto_389906 ?auto_389908 ) ) ( not ( = ?auto_389906 ?auto_389909 ) ) ( not ( = ?auto_389906 ?auto_389910 ) ) ( not ( = ?auto_389906 ?auto_389911 ) ) ( not ( = ?auto_389906 ?auto_389912 ) ) ( not ( = ?auto_389906 ?auto_389913 ) ) ( not ( = ?auto_389906 ?auto_389914 ) ) ( not ( = ?auto_389907 ?auto_389908 ) ) ( not ( = ?auto_389907 ?auto_389909 ) ) ( not ( = ?auto_389907 ?auto_389910 ) ) ( not ( = ?auto_389907 ?auto_389911 ) ) ( not ( = ?auto_389907 ?auto_389912 ) ) ( not ( = ?auto_389907 ?auto_389913 ) ) ( not ( = ?auto_389907 ?auto_389914 ) ) ( not ( = ?auto_389908 ?auto_389909 ) ) ( not ( = ?auto_389908 ?auto_389910 ) ) ( not ( = ?auto_389908 ?auto_389911 ) ) ( not ( = ?auto_389908 ?auto_389912 ) ) ( not ( = ?auto_389908 ?auto_389913 ) ) ( not ( = ?auto_389908 ?auto_389914 ) ) ( not ( = ?auto_389909 ?auto_389910 ) ) ( not ( = ?auto_389909 ?auto_389911 ) ) ( not ( = ?auto_389909 ?auto_389912 ) ) ( not ( = ?auto_389909 ?auto_389913 ) ) ( not ( = ?auto_389909 ?auto_389914 ) ) ( not ( = ?auto_389910 ?auto_389911 ) ) ( not ( = ?auto_389910 ?auto_389912 ) ) ( not ( = ?auto_389910 ?auto_389913 ) ) ( not ( = ?auto_389910 ?auto_389914 ) ) ( not ( = ?auto_389911 ?auto_389912 ) ) ( not ( = ?auto_389911 ?auto_389913 ) ) ( not ( = ?auto_389911 ?auto_389914 ) ) ( not ( = ?auto_389912 ?auto_389913 ) ) ( not ( = ?auto_389912 ?auto_389914 ) ) ( not ( = ?auto_389913 ?auto_389914 ) ) ( ON ?auto_389912 ?auto_389913 ) ( ON ?auto_389911 ?auto_389912 ) ( ON ?auto_389910 ?auto_389911 ) ( ON ?auto_389909 ?auto_389910 ) ( ON ?auto_389908 ?auto_389909 ) ( ON ?auto_389907 ?auto_389908 ) ( ON ?auto_389906 ?auto_389907 ) ( CLEAR ?auto_389904 ) ( ON ?auto_389905 ?auto_389906 ) ( CLEAR ?auto_389905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389901 ?auto_389902 ?auto_389903 ?auto_389904 ?auto_389905 )
      ( MAKE-13PILE ?auto_389901 ?auto_389902 ?auto_389903 ?auto_389904 ?auto_389905 ?auto_389906 ?auto_389907 ?auto_389908 ?auto_389909 ?auto_389910 ?auto_389911 ?auto_389912 ?auto_389913 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389928 - BLOCK
      ?auto_389929 - BLOCK
      ?auto_389930 - BLOCK
      ?auto_389931 - BLOCK
      ?auto_389932 - BLOCK
      ?auto_389933 - BLOCK
      ?auto_389934 - BLOCK
      ?auto_389935 - BLOCK
      ?auto_389936 - BLOCK
      ?auto_389937 - BLOCK
      ?auto_389938 - BLOCK
      ?auto_389939 - BLOCK
      ?auto_389940 - BLOCK
    )
    :vars
    (
      ?auto_389941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389940 ?auto_389941 ) ( ON-TABLE ?auto_389928 ) ( ON ?auto_389929 ?auto_389928 ) ( ON ?auto_389930 ?auto_389929 ) ( ON ?auto_389931 ?auto_389930 ) ( not ( = ?auto_389928 ?auto_389929 ) ) ( not ( = ?auto_389928 ?auto_389930 ) ) ( not ( = ?auto_389928 ?auto_389931 ) ) ( not ( = ?auto_389928 ?auto_389932 ) ) ( not ( = ?auto_389928 ?auto_389933 ) ) ( not ( = ?auto_389928 ?auto_389934 ) ) ( not ( = ?auto_389928 ?auto_389935 ) ) ( not ( = ?auto_389928 ?auto_389936 ) ) ( not ( = ?auto_389928 ?auto_389937 ) ) ( not ( = ?auto_389928 ?auto_389938 ) ) ( not ( = ?auto_389928 ?auto_389939 ) ) ( not ( = ?auto_389928 ?auto_389940 ) ) ( not ( = ?auto_389928 ?auto_389941 ) ) ( not ( = ?auto_389929 ?auto_389930 ) ) ( not ( = ?auto_389929 ?auto_389931 ) ) ( not ( = ?auto_389929 ?auto_389932 ) ) ( not ( = ?auto_389929 ?auto_389933 ) ) ( not ( = ?auto_389929 ?auto_389934 ) ) ( not ( = ?auto_389929 ?auto_389935 ) ) ( not ( = ?auto_389929 ?auto_389936 ) ) ( not ( = ?auto_389929 ?auto_389937 ) ) ( not ( = ?auto_389929 ?auto_389938 ) ) ( not ( = ?auto_389929 ?auto_389939 ) ) ( not ( = ?auto_389929 ?auto_389940 ) ) ( not ( = ?auto_389929 ?auto_389941 ) ) ( not ( = ?auto_389930 ?auto_389931 ) ) ( not ( = ?auto_389930 ?auto_389932 ) ) ( not ( = ?auto_389930 ?auto_389933 ) ) ( not ( = ?auto_389930 ?auto_389934 ) ) ( not ( = ?auto_389930 ?auto_389935 ) ) ( not ( = ?auto_389930 ?auto_389936 ) ) ( not ( = ?auto_389930 ?auto_389937 ) ) ( not ( = ?auto_389930 ?auto_389938 ) ) ( not ( = ?auto_389930 ?auto_389939 ) ) ( not ( = ?auto_389930 ?auto_389940 ) ) ( not ( = ?auto_389930 ?auto_389941 ) ) ( not ( = ?auto_389931 ?auto_389932 ) ) ( not ( = ?auto_389931 ?auto_389933 ) ) ( not ( = ?auto_389931 ?auto_389934 ) ) ( not ( = ?auto_389931 ?auto_389935 ) ) ( not ( = ?auto_389931 ?auto_389936 ) ) ( not ( = ?auto_389931 ?auto_389937 ) ) ( not ( = ?auto_389931 ?auto_389938 ) ) ( not ( = ?auto_389931 ?auto_389939 ) ) ( not ( = ?auto_389931 ?auto_389940 ) ) ( not ( = ?auto_389931 ?auto_389941 ) ) ( not ( = ?auto_389932 ?auto_389933 ) ) ( not ( = ?auto_389932 ?auto_389934 ) ) ( not ( = ?auto_389932 ?auto_389935 ) ) ( not ( = ?auto_389932 ?auto_389936 ) ) ( not ( = ?auto_389932 ?auto_389937 ) ) ( not ( = ?auto_389932 ?auto_389938 ) ) ( not ( = ?auto_389932 ?auto_389939 ) ) ( not ( = ?auto_389932 ?auto_389940 ) ) ( not ( = ?auto_389932 ?auto_389941 ) ) ( not ( = ?auto_389933 ?auto_389934 ) ) ( not ( = ?auto_389933 ?auto_389935 ) ) ( not ( = ?auto_389933 ?auto_389936 ) ) ( not ( = ?auto_389933 ?auto_389937 ) ) ( not ( = ?auto_389933 ?auto_389938 ) ) ( not ( = ?auto_389933 ?auto_389939 ) ) ( not ( = ?auto_389933 ?auto_389940 ) ) ( not ( = ?auto_389933 ?auto_389941 ) ) ( not ( = ?auto_389934 ?auto_389935 ) ) ( not ( = ?auto_389934 ?auto_389936 ) ) ( not ( = ?auto_389934 ?auto_389937 ) ) ( not ( = ?auto_389934 ?auto_389938 ) ) ( not ( = ?auto_389934 ?auto_389939 ) ) ( not ( = ?auto_389934 ?auto_389940 ) ) ( not ( = ?auto_389934 ?auto_389941 ) ) ( not ( = ?auto_389935 ?auto_389936 ) ) ( not ( = ?auto_389935 ?auto_389937 ) ) ( not ( = ?auto_389935 ?auto_389938 ) ) ( not ( = ?auto_389935 ?auto_389939 ) ) ( not ( = ?auto_389935 ?auto_389940 ) ) ( not ( = ?auto_389935 ?auto_389941 ) ) ( not ( = ?auto_389936 ?auto_389937 ) ) ( not ( = ?auto_389936 ?auto_389938 ) ) ( not ( = ?auto_389936 ?auto_389939 ) ) ( not ( = ?auto_389936 ?auto_389940 ) ) ( not ( = ?auto_389936 ?auto_389941 ) ) ( not ( = ?auto_389937 ?auto_389938 ) ) ( not ( = ?auto_389937 ?auto_389939 ) ) ( not ( = ?auto_389937 ?auto_389940 ) ) ( not ( = ?auto_389937 ?auto_389941 ) ) ( not ( = ?auto_389938 ?auto_389939 ) ) ( not ( = ?auto_389938 ?auto_389940 ) ) ( not ( = ?auto_389938 ?auto_389941 ) ) ( not ( = ?auto_389939 ?auto_389940 ) ) ( not ( = ?auto_389939 ?auto_389941 ) ) ( not ( = ?auto_389940 ?auto_389941 ) ) ( ON ?auto_389939 ?auto_389940 ) ( ON ?auto_389938 ?auto_389939 ) ( ON ?auto_389937 ?auto_389938 ) ( ON ?auto_389936 ?auto_389937 ) ( ON ?auto_389935 ?auto_389936 ) ( ON ?auto_389934 ?auto_389935 ) ( ON ?auto_389933 ?auto_389934 ) ( CLEAR ?auto_389931 ) ( ON ?auto_389932 ?auto_389933 ) ( CLEAR ?auto_389932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_389928 ?auto_389929 ?auto_389930 ?auto_389931 ?auto_389932 )
      ( MAKE-13PILE ?auto_389928 ?auto_389929 ?auto_389930 ?auto_389931 ?auto_389932 ?auto_389933 ?auto_389934 ?auto_389935 ?auto_389936 ?auto_389937 ?auto_389938 ?auto_389939 ?auto_389940 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389955 - BLOCK
      ?auto_389956 - BLOCK
      ?auto_389957 - BLOCK
      ?auto_389958 - BLOCK
      ?auto_389959 - BLOCK
      ?auto_389960 - BLOCK
      ?auto_389961 - BLOCK
      ?auto_389962 - BLOCK
      ?auto_389963 - BLOCK
      ?auto_389964 - BLOCK
      ?auto_389965 - BLOCK
      ?auto_389966 - BLOCK
      ?auto_389967 - BLOCK
    )
    :vars
    (
      ?auto_389968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389967 ?auto_389968 ) ( ON-TABLE ?auto_389955 ) ( ON ?auto_389956 ?auto_389955 ) ( ON ?auto_389957 ?auto_389956 ) ( not ( = ?auto_389955 ?auto_389956 ) ) ( not ( = ?auto_389955 ?auto_389957 ) ) ( not ( = ?auto_389955 ?auto_389958 ) ) ( not ( = ?auto_389955 ?auto_389959 ) ) ( not ( = ?auto_389955 ?auto_389960 ) ) ( not ( = ?auto_389955 ?auto_389961 ) ) ( not ( = ?auto_389955 ?auto_389962 ) ) ( not ( = ?auto_389955 ?auto_389963 ) ) ( not ( = ?auto_389955 ?auto_389964 ) ) ( not ( = ?auto_389955 ?auto_389965 ) ) ( not ( = ?auto_389955 ?auto_389966 ) ) ( not ( = ?auto_389955 ?auto_389967 ) ) ( not ( = ?auto_389955 ?auto_389968 ) ) ( not ( = ?auto_389956 ?auto_389957 ) ) ( not ( = ?auto_389956 ?auto_389958 ) ) ( not ( = ?auto_389956 ?auto_389959 ) ) ( not ( = ?auto_389956 ?auto_389960 ) ) ( not ( = ?auto_389956 ?auto_389961 ) ) ( not ( = ?auto_389956 ?auto_389962 ) ) ( not ( = ?auto_389956 ?auto_389963 ) ) ( not ( = ?auto_389956 ?auto_389964 ) ) ( not ( = ?auto_389956 ?auto_389965 ) ) ( not ( = ?auto_389956 ?auto_389966 ) ) ( not ( = ?auto_389956 ?auto_389967 ) ) ( not ( = ?auto_389956 ?auto_389968 ) ) ( not ( = ?auto_389957 ?auto_389958 ) ) ( not ( = ?auto_389957 ?auto_389959 ) ) ( not ( = ?auto_389957 ?auto_389960 ) ) ( not ( = ?auto_389957 ?auto_389961 ) ) ( not ( = ?auto_389957 ?auto_389962 ) ) ( not ( = ?auto_389957 ?auto_389963 ) ) ( not ( = ?auto_389957 ?auto_389964 ) ) ( not ( = ?auto_389957 ?auto_389965 ) ) ( not ( = ?auto_389957 ?auto_389966 ) ) ( not ( = ?auto_389957 ?auto_389967 ) ) ( not ( = ?auto_389957 ?auto_389968 ) ) ( not ( = ?auto_389958 ?auto_389959 ) ) ( not ( = ?auto_389958 ?auto_389960 ) ) ( not ( = ?auto_389958 ?auto_389961 ) ) ( not ( = ?auto_389958 ?auto_389962 ) ) ( not ( = ?auto_389958 ?auto_389963 ) ) ( not ( = ?auto_389958 ?auto_389964 ) ) ( not ( = ?auto_389958 ?auto_389965 ) ) ( not ( = ?auto_389958 ?auto_389966 ) ) ( not ( = ?auto_389958 ?auto_389967 ) ) ( not ( = ?auto_389958 ?auto_389968 ) ) ( not ( = ?auto_389959 ?auto_389960 ) ) ( not ( = ?auto_389959 ?auto_389961 ) ) ( not ( = ?auto_389959 ?auto_389962 ) ) ( not ( = ?auto_389959 ?auto_389963 ) ) ( not ( = ?auto_389959 ?auto_389964 ) ) ( not ( = ?auto_389959 ?auto_389965 ) ) ( not ( = ?auto_389959 ?auto_389966 ) ) ( not ( = ?auto_389959 ?auto_389967 ) ) ( not ( = ?auto_389959 ?auto_389968 ) ) ( not ( = ?auto_389960 ?auto_389961 ) ) ( not ( = ?auto_389960 ?auto_389962 ) ) ( not ( = ?auto_389960 ?auto_389963 ) ) ( not ( = ?auto_389960 ?auto_389964 ) ) ( not ( = ?auto_389960 ?auto_389965 ) ) ( not ( = ?auto_389960 ?auto_389966 ) ) ( not ( = ?auto_389960 ?auto_389967 ) ) ( not ( = ?auto_389960 ?auto_389968 ) ) ( not ( = ?auto_389961 ?auto_389962 ) ) ( not ( = ?auto_389961 ?auto_389963 ) ) ( not ( = ?auto_389961 ?auto_389964 ) ) ( not ( = ?auto_389961 ?auto_389965 ) ) ( not ( = ?auto_389961 ?auto_389966 ) ) ( not ( = ?auto_389961 ?auto_389967 ) ) ( not ( = ?auto_389961 ?auto_389968 ) ) ( not ( = ?auto_389962 ?auto_389963 ) ) ( not ( = ?auto_389962 ?auto_389964 ) ) ( not ( = ?auto_389962 ?auto_389965 ) ) ( not ( = ?auto_389962 ?auto_389966 ) ) ( not ( = ?auto_389962 ?auto_389967 ) ) ( not ( = ?auto_389962 ?auto_389968 ) ) ( not ( = ?auto_389963 ?auto_389964 ) ) ( not ( = ?auto_389963 ?auto_389965 ) ) ( not ( = ?auto_389963 ?auto_389966 ) ) ( not ( = ?auto_389963 ?auto_389967 ) ) ( not ( = ?auto_389963 ?auto_389968 ) ) ( not ( = ?auto_389964 ?auto_389965 ) ) ( not ( = ?auto_389964 ?auto_389966 ) ) ( not ( = ?auto_389964 ?auto_389967 ) ) ( not ( = ?auto_389964 ?auto_389968 ) ) ( not ( = ?auto_389965 ?auto_389966 ) ) ( not ( = ?auto_389965 ?auto_389967 ) ) ( not ( = ?auto_389965 ?auto_389968 ) ) ( not ( = ?auto_389966 ?auto_389967 ) ) ( not ( = ?auto_389966 ?auto_389968 ) ) ( not ( = ?auto_389967 ?auto_389968 ) ) ( ON ?auto_389966 ?auto_389967 ) ( ON ?auto_389965 ?auto_389966 ) ( ON ?auto_389964 ?auto_389965 ) ( ON ?auto_389963 ?auto_389964 ) ( ON ?auto_389962 ?auto_389963 ) ( ON ?auto_389961 ?auto_389962 ) ( ON ?auto_389960 ?auto_389961 ) ( ON ?auto_389959 ?auto_389960 ) ( CLEAR ?auto_389957 ) ( ON ?auto_389958 ?auto_389959 ) ( CLEAR ?auto_389958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389955 ?auto_389956 ?auto_389957 ?auto_389958 )
      ( MAKE-13PILE ?auto_389955 ?auto_389956 ?auto_389957 ?auto_389958 ?auto_389959 ?auto_389960 ?auto_389961 ?auto_389962 ?auto_389963 ?auto_389964 ?auto_389965 ?auto_389966 ?auto_389967 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_389982 - BLOCK
      ?auto_389983 - BLOCK
      ?auto_389984 - BLOCK
      ?auto_389985 - BLOCK
      ?auto_389986 - BLOCK
      ?auto_389987 - BLOCK
      ?auto_389988 - BLOCK
      ?auto_389989 - BLOCK
      ?auto_389990 - BLOCK
      ?auto_389991 - BLOCK
      ?auto_389992 - BLOCK
      ?auto_389993 - BLOCK
      ?auto_389994 - BLOCK
    )
    :vars
    (
      ?auto_389995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_389994 ?auto_389995 ) ( ON-TABLE ?auto_389982 ) ( ON ?auto_389983 ?auto_389982 ) ( ON ?auto_389984 ?auto_389983 ) ( not ( = ?auto_389982 ?auto_389983 ) ) ( not ( = ?auto_389982 ?auto_389984 ) ) ( not ( = ?auto_389982 ?auto_389985 ) ) ( not ( = ?auto_389982 ?auto_389986 ) ) ( not ( = ?auto_389982 ?auto_389987 ) ) ( not ( = ?auto_389982 ?auto_389988 ) ) ( not ( = ?auto_389982 ?auto_389989 ) ) ( not ( = ?auto_389982 ?auto_389990 ) ) ( not ( = ?auto_389982 ?auto_389991 ) ) ( not ( = ?auto_389982 ?auto_389992 ) ) ( not ( = ?auto_389982 ?auto_389993 ) ) ( not ( = ?auto_389982 ?auto_389994 ) ) ( not ( = ?auto_389982 ?auto_389995 ) ) ( not ( = ?auto_389983 ?auto_389984 ) ) ( not ( = ?auto_389983 ?auto_389985 ) ) ( not ( = ?auto_389983 ?auto_389986 ) ) ( not ( = ?auto_389983 ?auto_389987 ) ) ( not ( = ?auto_389983 ?auto_389988 ) ) ( not ( = ?auto_389983 ?auto_389989 ) ) ( not ( = ?auto_389983 ?auto_389990 ) ) ( not ( = ?auto_389983 ?auto_389991 ) ) ( not ( = ?auto_389983 ?auto_389992 ) ) ( not ( = ?auto_389983 ?auto_389993 ) ) ( not ( = ?auto_389983 ?auto_389994 ) ) ( not ( = ?auto_389983 ?auto_389995 ) ) ( not ( = ?auto_389984 ?auto_389985 ) ) ( not ( = ?auto_389984 ?auto_389986 ) ) ( not ( = ?auto_389984 ?auto_389987 ) ) ( not ( = ?auto_389984 ?auto_389988 ) ) ( not ( = ?auto_389984 ?auto_389989 ) ) ( not ( = ?auto_389984 ?auto_389990 ) ) ( not ( = ?auto_389984 ?auto_389991 ) ) ( not ( = ?auto_389984 ?auto_389992 ) ) ( not ( = ?auto_389984 ?auto_389993 ) ) ( not ( = ?auto_389984 ?auto_389994 ) ) ( not ( = ?auto_389984 ?auto_389995 ) ) ( not ( = ?auto_389985 ?auto_389986 ) ) ( not ( = ?auto_389985 ?auto_389987 ) ) ( not ( = ?auto_389985 ?auto_389988 ) ) ( not ( = ?auto_389985 ?auto_389989 ) ) ( not ( = ?auto_389985 ?auto_389990 ) ) ( not ( = ?auto_389985 ?auto_389991 ) ) ( not ( = ?auto_389985 ?auto_389992 ) ) ( not ( = ?auto_389985 ?auto_389993 ) ) ( not ( = ?auto_389985 ?auto_389994 ) ) ( not ( = ?auto_389985 ?auto_389995 ) ) ( not ( = ?auto_389986 ?auto_389987 ) ) ( not ( = ?auto_389986 ?auto_389988 ) ) ( not ( = ?auto_389986 ?auto_389989 ) ) ( not ( = ?auto_389986 ?auto_389990 ) ) ( not ( = ?auto_389986 ?auto_389991 ) ) ( not ( = ?auto_389986 ?auto_389992 ) ) ( not ( = ?auto_389986 ?auto_389993 ) ) ( not ( = ?auto_389986 ?auto_389994 ) ) ( not ( = ?auto_389986 ?auto_389995 ) ) ( not ( = ?auto_389987 ?auto_389988 ) ) ( not ( = ?auto_389987 ?auto_389989 ) ) ( not ( = ?auto_389987 ?auto_389990 ) ) ( not ( = ?auto_389987 ?auto_389991 ) ) ( not ( = ?auto_389987 ?auto_389992 ) ) ( not ( = ?auto_389987 ?auto_389993 ) ) ( not ( = ?auto_389987 ?auto_389994 ) ) ( not ( = ?auto_389987 ?auto_389995 ) ) ( not ( = ?auto_389988 ?auto_389989 ) ) ( not ( = ?auto_389988 ?auto_389990 ) ) ( not ( = ?auto_389988 ?auto_389991 ) ) ( not ( = ?auto_389988 ?auto_389992 ) ) ( not ( = ?auto_389988 ?auto_389993 ) ) ( not ( = ?auto_389988 ?auto_389994 ) ) ( not ( = ?auto_389988 ?auto_389995 ) ) ( not ( = ?auto_389989 ?auto_389990 ) ) ( not ( = ?auto_389989 ?auto_389991 ) ) ( not ( = ?auto_389989 ?auto_389992 ) ) ( not ( = ?auto_389989 ?auto_389993 ) ) ( not ( = ?auto_389989 ?auto_389994 ) ) ( not ( = ?auto_389989 ?auto_389995 ) ) ( not ( = ?auto_389990 ?auto_389991 ) ) ( not ( = ?auto_389990 ?auto_389992 ) ) ( not ( = ?auto_389990 ?auto_389993 ) ) ( not ( = ?auto_389990 ?auto_389994 ) ) ( not ( = ?auto_389990 ?auto_389995 ) ) ( not ( = ?auto_389991 ?auto_389992 ) ) ( not ( = ?auto_389991 ?auto_389993 ) ) ( not ( = ?auto_389991 ?auto_389994 ) ) ( not ( = ?auto_389991 ?auto_389995 ) ) ( not ( = ?auto_389992 ?auto_389993 ) ) ( not ( = ?auto_389992 ?auto_389994 ) ) ( not ( = ?auto_389992 ?auto_389995 ) ) ( not ( = ?auto_389993 ?auto_389994 ) ) ( not ( = ?auto_389993 ?auto_389995 ) ) ( not ( = ?auto_389994 ?auto_389995 ) ) ( ON ?auto_389993 ?auto_389994 ) ( ON ?auto_389992 ?auto_389993 ) ( ON ?auto_389991 ?auto_389992 ) ( ON ?auto_389990 ?auto_389991 ) ( ON ?auto_389989 ?auto_389990 ) ( ON ?auto_389988 ?auto_389989 ) ( ON ?auto_389987 ?auto_389988 ) ( ON ?auto_389986 ?auto_389987 ) ( CLEAR ?auto_389984 ) ( ON ?auto_389985 ?auto_389986 ) ( CLEAR ?auto_389985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_389982 ?auto_389983 ?auto_389984 ?auto_389985 )
      ( MAKE-13PILE ?auto_389982 ?auto_389983 ?auto_389984 ?auto_389985 ?auto_389986 ?auto_389987 ?auto_389988 ?auto_389989 ?auto_389990 ?auto_389991 ?auto_389992 ?auto_389993 ?auto_389994 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390009 - BLOCK
      ?auto_390010 - BLOCK
      ?auto_390011 - BLOCK
      ?auto_390012 - BLOCK
      ?auto_390013 - BLOCK
      ?auto_390014 - BLOCK
      ?auto_390015 - BLOCK
      ?auto_390016 - BLOCK
      ?auto_390017 - BLOCK
      ?auto_390018 - BLOCK
      ?auto_390019 - BLOCK
      ?auto_390020 - BLOCK
      ?auto_390021 - BLOCK
    )
    :vars
    (
      ?auto_390022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390021 ?auto_390022 ) ( ON-TABLE ?auto_390009 ) ( ON ?auto_390010 ?auto_390009 ) ( not ( = ?auto_390009 ?auto_390010 ) ) ( not ( = ?auto_390009 ?auto_390011 ) ) ( not ( = ?auto_390009 ?auto_390012 ) ) ( not ( = ?auto_390009 ?auto_390013 ) ) ( not ( = ?auto_390009 ?auto_390014 ) ) ( not ( = ?auto_390009 ?auto_390015 ) ) ( not ( = ?auto_390009 ?auto_390016 ) ) ( not ( = ?auto_390009 ?auto_390017 ) ) ( not ( = ?auto_390009 ?auto_390018 ) ) ( not ( = ?auto_390009 ?auto_390019 ) ) ( not ( = ?auto_390009 ?auto_390020 ) ) ( not ( = ?auto_390009 ?auto_390021 ) ) ( not ( = ?auto_390009 ?auto_390022 ) ) ( not ( = ?auto_390010 ?auto_390011 ) ) ( not ( = ?auto_390010 ?auto_390012 ) ) ( not ( = ?auto_390010 ?auto_390013 ) ) ( not ( = ?auto_390010 ?auto_390014 ) ) ( not ( = ?auto_390010 ?auto_390015 ) ) ( not ( = ?auto_390010 ?auto_390016 ) ) ( not ( = ?auto_390010 ?auto_390017 ) ) ( not ( = ?auto_390010 ?auto_390018 ) ) ( not ( = ?auto_390010 ?auto_390019 ) ) ( not ( = ?auto_390010 ?auto_390020 ) ) ( not ( = ?auto_390010 ?auto_390021 ) ) ( not ( = ?auto_390010 ?auto_390022 ) ) ( not ( = ?auto_390011 ?auto_390012 ) ) ( not ( = ?auto_390011 ?auto_390013 ) ) ( not ( = ?auto_390011 ?auto_390014 ) ) ( not ( = ?auto_390011 ?auto_390015 ) ) ( not ( = ?auto_390011 ?auto_390016 ) ) ( not ( = ?auto_390011 ?auto_390017 ) ) ( not ( = ?auto_390011 ?auto_390018 ) ) ( not ( = ?auto_390011 ?auto_390019 ) ) ( not ( = ?auto_390011 ?auto_390020 ) ) ( not ( = ?auto_390011 ?auto_390021 ) ) ( not ( = ?auto_390011 ?auto_390022 ) ) ( not ( = ?auto_390012 ?auto_390013 ) ) ( not ( = ?auto_390012 ?auto_390014 ) ) ( not ( = ?auto_390012 ?auto_390015 ) ) ( not ( = ?auto_390012 ?auto_390016 ) ) ( not ( = ?auto_390012 ?auto_390017 ) ) ( not ( = ?auto_390012 ?auto_390018 ) ) ( not ( = ?auto_390012 ?auto_390019 ) ) ( not ( = ?auto_390012 ?auto_390020 ) ) ( not ( = ?auto_390012 ?auto_390021 ) ) ( not ( = ?auto_390012 ?auto_390022 ) ) ( not ( = ?auto_390013 ?auto_390014 ) ) ( not ( = ?auto_390013 ?auto_390015 ) ) ( not ( = ?auto_390013 ?auto_390016 ) ) ( not ( = ?auto_390013 ?auto_390017 ) ) ( not ( = ?auto_390013 ?auto_390018 ) ) ( not ( = ?auto_390013 ?auto_390019 ) ) ( not ( = ?auto_390013 ?auto_390020 ) ) ( not ( = ?auto_390013 ?auto_390021 ) ) ( not ( = ?auto_390013 ?auto_390022 ) ) ( not ( = ?auto_390014 ?auto_390015 ) ) ( not ( = ?auto_390014 ?auto_390016 ) ) ( not ( = ?auto_390014 ?auto_390017 ) ) ( not ( = ?auto_390014 ?auto_390018 ) ) ( not ( = ?auto_390014 ?auto_390019 ) ) ( not ( = ?auto_390014 ?auto_390020 ) ) ( not ( = ?auto_390014 ?auto_390021 ) ) ( not ( = ?auto_390014 ?auto_390022 ) ) ( not ( = ?auto_390015 ?auto_390016 ) ) ( not ( = ?auto_390015 ?auto_390017 ) ) ( not ( = ?auto_390015 ?auto_390018 ) ) ( not ( = ?auto_390015 ?auto_390019 ) ) ( not ( = ?auto_390015 ?auto_390020 ) ) ( not ( = ?auto_390015 ?auto_390021 ) ) ( not ( = ?auto_390015 ?auto_390022 ) ) ( not ( = ?auto_390016 ?auto_390017 ) ) ( not ( = ?auto_390016 ?auto_390018 ) ) ( not ( = ?auto_390016 ?auto_390019 ) ) ( not ( = ?auto_390016 ?auto_390020 ) ) ( not ( = ?auto_390016 ?auto_390021 ) ) ( not ( = ?auto_390016 ?auto_390022 ) ) ( not ( = ?auto_390017 ?auto_390018 ) ) ( not ( = ?auto_390017 ?auto_390019 ) ) ( not ( = ?auto_390017 ?auto_390020 ) ) ( not ( = ?auto_390017 ?auto_390021 ) ) ( not ( = ?auto_390017 ?auto_390022 ) ) ( not ( = ?auto_390018 ?auto_390019 ) ) ( not ( = ?auto_390018 ?auto_390020 ) ) ( not ( = ?auto_390018 ?auto_390021 ) ) ( not ( = ?auto_390018 ?auto_390022 ) ) ( not ( = ?auto_390019 ?auto_390020 ) ) ( not ( = ?auto_390019 ?auto_390021 ) ) ( not ( = ?auto_390019 ?auto_390022 ) ) ( not ( = ?auto_390020 ?auto_390021 ) ) ( not ( = ?auto_390020 ?auto_390022 ) ) ( not ( = ?auto_390021 ?auto_390022 ) ) ( ON ?auto_390020 ?auto_390021 ) ( ON ?auto_390019 ?auto_390020 ) ( ON ?auto_390018 ?auto_390019 ) ( ON ?auto_390017 ?auto_390018 ) ( ON ?auto_390016 ?auto_390017 ) ( ON ?auto_390015 ?auto_390016 ) ( ON ?auto_390014 ?auto_390015 ) ( ON ?auto_390013 ?auto_390014 ) ( ON ?auto_390012 ?auto_390013 ) ( CLEAR ?auto_390010 ) ( ON ?auto_390011 ?auto_390012 ) ( CLEAR ?auto_390011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390009 ?auto_390010 ?auto_390011 )
      ( MAKE-13PILE ?auto_390009 ?auto_390010 ?auto_390011 ?auto_390012 ?auto_390013 ?auto_390014 ?auto_390015 ?auto_390016 ?auto_390017 ?auto_390018 ?auto_390019 ?auto_390020 ?auto_390021 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390036 - BLOCK
      ?auto_390037 - BLOCK
      ?auto_390038 - BLOCK
      ?auto_390039 - BLOCK
      ?auto_390040 - BLOCK
      ?auto_390041 - BLOCK
      ?auto_390042 - BLOCK
      ?auto_390043 - BLOCK
      ?auto_390044 - BLOCK
      ?auto_390045 - BLOCK
      ?auto_390046 - BLOCK
      ?auto_390047 - BLOCK
      ?auto_390048 - BLOCK
    )
    :vars
    (
      ?auto_390049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390048 ?auto_390049 ) ( ON-TABLE ?auto_390036 ) ( ON ?auto_390037 ?auto_390036 ) ( not ( = ?auto_390036 ?auto_390037 ) ) ( not ( = ?auto_390036 ?auto_390038 ) ) ( not ( = ?auto_390036 ?auto_390039 ) ) ( not ( = ?auto_390036 ?auto_390040 ) ) ( not ( = ?auto_390036 ?auto_390041 ) ) ( not ( = ?auto_390036 ?auto_390042 ) ) ( not ( = ?auto_390036 ?auto_390043 ) ) ( not ( = ?auto_390036 ?auto_390044 ) ) ( not ( = ?auto_390036 ?auto_390045 ) ) ( not ( = ?auto_390036 ?auto_390046 ) ) ( not ( = ?auto_390036 ?auto_390047 ) ) ( not ( = ?auto_390036 ?auto_390048 ) ) ( not ( = ?auto_390036 ?auto_390049 ) ) ( not ( = ?auto_390037 ?auto_390038 ) ) ( not ( = ?auto_390037 ?auto_390039 ) ) ( not ( = ?auto_390037 ?auto_390040 ) ) ( not ( = ?auto_390037 ?auto_390041 ) ) ( not ( = ?auto_390037 ?auto_390042 ) ) ( not ( = ?auto_390037 ?auto_390043 ) ) ( not ( = ?auto_390037 ?auto_390044 ) ) ( not ( = ?auto_390037 ?auto_390045 ) ) ( not ( = ?auto_390037 ?auto_390046 ) ) ( not ( = ?auto_390037 ?auto_390047 ) ) ( not ( = ?auto_390037 ?auto_390048 ) ) ( not ( = ?auto_390037 ?auto_390049 ) ) ( not ( = ?auto_390038 ?auto_390039 ) ) ( not ( = ?auto_390038 ?auto_390040 ) ) ( not ( = ?auto_390038 ?auto_390041 ) ) ( not ( = ?auto_390038 ?auto_390042 ) ) ( not ( = ?auto_390038 ?auto_390043 ) ) ( not ( = ?auto_390038 ?auto_390044 ) ) ( not ( = ?auto_390038 ?auto_390045 ) ) ( not ( = ?auto_390038 ?auto_390046 ) ) ( not ( = ?auto_390038 ?auto_390047 ) ) ( not ( = ?auto_390038 ?auto_390048 ) ) ( not ( = ?auto_390038 ?auto_390049 ) ) ( not ( = ?auto_390039 ?auto_390040 ) ) ( not ( = ?auto_390039 ?auto_390041 ) ) ( not ( = ?auto_390039 ?auto_390042 ) ) ( not ( = ?auto_390039 ?auto_390043 ) ) ( not ( = ?auto_390039 ?auto_390044 ) ) ( not ( = ?auto_390039 ?auto_390045 ) ) ( not ( = ?auto_390039 ?auto_390046 ) ) ( not ( = ?auto_390039 ?auto_390047 ) ) ( not ( = ?auto_390039 ?auto_390048 ) ) ( not ( = ?auto_390039 ?auto_390049 ) ) ( not ( = ?auto_390040 ?auto_390041 ) ) ( not ( = ?auto_390040 ?auto_390042 ) ) ( not ( = ?auto_390040 ?auto_390043 ) ) ( not ( = ?auto_390040 ?auto_390044 ) ) ( not ( = ?auto_390040 ?auto_390045 ) ) ( not ( = ?auto_390040 ?auto_390046 ) ) ( not ( = ?auto_390040 ?auto_390047 ) ) ( not ( = ?auto_390040 ?auto_390048 ) ) ( not ( = ?auto_390040 ?auto_390049 ) ) ( not ( = ?auto_390041 ?auto_390042 ) ) ( not ( = ?auto_390041 ?auto_390043 ) ) ( not ( = ?auto_390041 ?auto_390044 ) ) ( not ( = ?auto_390041 ?auto_390045 ) ) ( not ( = ?auto_390041 ?auto_390046 ) ) ( not ( = ?auto_390041 ?auto_390047 ) ) ( not ( = ?auto_390041 ?auto_390048 ) ) ( not ( = ?auto_390041 ?auto_390049 ) ) ( not ( = ?auto_390042 ?auto_390043 ) ) ( not ( = ?auto_390042 ?auto_390044 ) ) ( not ( = ?auto_390042 ?auto_390045 ) ) ( not ( = ?auto_390042 ?auto_390046 ) ) ( not ( = ?auto_390042 ?auto_390047 ) ) ( not ( = ?auto_390042 ?auto_390048 ) ) ( not ( = ?auto_390042 ?auto_390049 ) ) ( not ( = ?auto_390043 ?auto_390044 ) ) ( not ( = ?auto_390043 ?auto_390045 ) ) ( not ( = ?auto_390043 ?auto_390046 ) ) ( not ( = ?auto_390043 ?auto_390047 ) ) ( not ( = ?auto_390043 ?auto_390048 ) ) ( not ( = ?auto_390043 ?auto_390049 ) ) ( not ( = ?auto_390044 ?auto_390045 ) ) ( not ( = ?auto_390044 ?auto_390046 ) ) ( not ( = ?auto_390044 ?auto_390047 ) ) ( not ( = ?auto_390044 ?auto_390048 ) ) ( not ( = ?auto_390044 ?auto_390049 ) ) ( not ( = ?auto_390045 ?auto_390046 ) ) ( not ( = ?auto_390045 ?auto_390047 ) ) ( not ( = ?auto_390045 ?auto_390048 ) ) ( not ( = ?auto_390045 ?auto_390049 ) ) ( not ( = ?auto_390046 ?auto_390047 ) ) ( not ( = ?auto_390046 ?auto_390048 ) ) ( not ( = ?auto_390046 ?auto_390049 ) ) ( not ( = ?auto_390047 ?auto_390048 ) ) ( not ( = ?auto_390047 ?auto_390049 ) ) ( not ( = ?auto_390048 ?auto_390049 ) ) ( ON ?auto_390047 ?auto_390048 ) ( ON ?auto_390046 ?auto_390047 ) ( ON ?auto_390045 ?auto_390046 ) ( ON ?auto_390044 ?auto_390045 ) ( ON ?auto_390043 ?auto_390044 ) ( ON ?auto_390042 ?auto_390043 ) ( ON ?auto_390041 ?auto_390042 ) ( ON ?auto_390040 ?auto_390041 ) ( ON ?auto_390039 ?auto_390040 ) ( CLEAR ?auto_390037 ) ( ON ?auto_390038 ?auto_390039 ) ( CLEAR ?auto_390038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390036 ?auto_390037 ?auto_390038 )
      ( MAKE-13PILE ?auto_390036 ?auto_390037 ?auto_390038 ?auto_390039 ?auto_390040 ?auto_390041 ?auto_390042 ?auto_390043 ?auto_390044 ?auto_390045 ?auto_390046 ?auto_390047 ?auto_390048 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390063 - BLOCK
      ?auto_390064 - BLOCK
      ?auto_390065 - BLOCK
      ?auto_390066 - BLOCK
      ?auto_390067 - BLOCK
      ?auto_390068 - BLOCK
      ?auto_390069 - BLOCK
      ?auto_390070 - BLOCK
      ?auto_390071 - BLOCK
      ?auto_390072 - BLOCK
      ?auto_390073 - BLOCK
      ?auto_390074 - BLOCK
      ?auto_390075 - BLOCK
    )
    :vars
    (
      ?auto_390076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390075 ?auto_390076 ) ( ON-TABLE ?auto_390063 ) ( not ( = ?auto_390063 ?auto_390064 ) ) ( not ( = ?auto_390063 ?auto_390065 ) ) ( not ( = ?auto_390063 ?auto_390066 ) ) ( not ( = ?auto_390063 ?auto_390067 ) ) ( not ( = ?auto_390063 ?auto_390068 ) ) ( not ( = ?auto_390063 ?auto_390069 ) ) ( not ( = ?auto_390063 ?auto_390070 ) ) ( not ( = ?auto_390063 ?auto_390071 ) ) ( not ( = ?auto_390063 ?auto_390072 ) ) ( not ( = ?auto_390063 ?auto_390073 ) ) ( not ( = ?auto_390063 ?auto_390074 ) ) ( not ( = ?auto_390063 ?auto_390075 ) ) ( not ( = ?auto_390063 ?auto_390076 ) ) ( not ( = ?auto_390064 ?auto_390065 ) ) ( not ( = ?auto_390064 ?auto_390066 ) ) ( not ( = ?auto_390064 ?auto_390067 ) ) ( not ( = ?auto_390064 ?auto_390068 ) ) ( not ( = ?auto_390064 ?auto_390069 ) ) ( not ( = ?auto_390064 ?auto_390070 ) ) ( not ( = ?auto_390064 ?auto_390071 ) ) ( not ( = ?auto_390064 ?auto_390072 ) ) ( not ( = ?auto_390064 ?auto_390073 ) ) ( not ( = ?auto_390064 ?auto_390074 ) ) ( not ( = ?auto_390064 ?auto_390075 ) ) ( not ( = ?auto_390064 ?auto_390076 ) ) ( not ( = ?auto_390065 ?auto_390066 ) ) ( not ( = ?auto_390065 ?auto_390067 ) ) ( not ( = ?auto_390065 ?auto_390068 ) ) ( not ( = ?auto_390065 ?auto_390069 ) ) ( not ( = ?auto_390065 ?auto_390070 ) ) ( not ( = ?auto_390065 ?auto_390071 ) ) ( not ( = ?auto_390065 ?auto_390072 ) ) ( not ( = ?auto_390065 ?auto_390073 ) ) ( not ( = ?auto_390065 ?auto_390074 ) ) ( not ( = ?auto_390065 ?auto_390075 ) ) ( not ( = ?auto_390065 ?auto_390076 ) ) ( not ( = ?auto_390066 ?auto_390067 ) ) ( not ( = ?auto_390066 ?auto_390068 ) ) ( not ( = ?auto_390066 ?auto_390069 ) ) ( not ( = ?auto_390066 ?auto_390070 ) ) ( not ( = ?auto_390066 ?auto_390071 ) ) ( not ( = ?auto_390066 ?auto_390072 ) ) ( not ( = ?auto_390066 ?auto_390073 ) ) ( not ( = ?auto_390066 ?auto_390074 ) ) ( not ( = ?auto_390066 ?auto_390075 ) ) ( not ( = ?auto_390066 ?auto_390076 ) ) ( not ( = ?auto_390067 ?auto_390068 ) ) ( not ( = ?auto_390067 ?auto_390069 ) ) ( not ( = ?auto_390067 ?auto_390070 ) ) ( not ( = ?auto_390067 ?auto_390071 ) ) ( not ( = ?auto_390067 ?auto_390072 ) ) ( not ( = ?auto_390067 ?auto_390073 ) ) ( not ( = ?auto_390067 ?auto_390074 ) ) ( not ( = ?auto_390067 ?auto_390075 ) ) ( not ( = ?auto_390067 ?auto_390076 ) ) ( not ( = ?auto_390068 ?auto_390069 ) ) ( not ( = ?auto_390068 ?auto_390070 ) ) ( not ( = ?auto_390068 ?auto_390071 ) ) ( not ( = ?auto_390068 ?auto_390072 ) ) ( not ( = ?auto_390068 ?auto_390073 ) ) ( not ( = ?auto_390068 ?auto_390074 ) ) ( not ( = ?auto_390068 ?auto_390075 ) ) ( not ( = ?auto_390068 ?auto_390076 ) ) ( not ( = ?auto_390069 ?auto_390070 ) ) ( not ( = ?auto_390069 ?auto_390071 ) ) ( not ( = ?auto_390069 ?auto_390072 ) ) ( not ( = ?auto_390069 ?auto_390073 ) ) ( not ( = ?auto_390069 ?auto_390074 ) ) ( not ( = ?auto_390069 ?auto_390075 ) ) ( not ( = ?auto_390069 ?auto_390076 ) ) ( not ( = ?auto_390070 ?auto_390071 ) ) ( not ( = ?auto_390070 ?auto_390072 ) ) ( not ( = ?auto_390070 ?auto_390073 ) ) ( not ( = ?auto_390070 ?auto_390074 ) ) ( not ( = ?auto_390070 ?auto_390075 ) ) ( not ( = ?auto_390070 ?auto_390076 ) ) ( not ( = ?auto_390071 ?auto_390072 ) ) ( not ( = ?auto_390071 ?auto_390073 ) ) ( not ( = ?auto_390071 ?auto_390074 ) ) ( not ( = ?auto_390071 ?auto_390075 ) ) ( not ( = ?auto_390071 ?auto_390076 ) ) ( not ( = ?auto_390072 ?auto_390073 ) ) ( not ( = ?auto_390072 ?auto_390074 ) ) ( not ( = ?auto_390072 ?auto_390075 ) ) ( not ( = ?auto_390072 ?auto_390076 ) ) ( not ( = ?auto_390073 ?auto_390074 ) ) ( not ( = ?auto_390073 ?auto_390075 ) ) ( not ( = ?auto_390073 ?auto_390076 ) ) ( not ( = ?auto_390074 ?auto_390075 ) ) ( not ( = ?auto_390074 ?auto_390076 ) ) ( not ( = ?auto_390075 ?auto_390076 ) ) ( ON ?auto_390074 ?auto_390075 ) ( ON ?auto_390073 ?auto_390074 ) ( ON ?auto_390072 ?auto_390073 ) ( ON ?auto_390071 ?auto_390072 ) ( ON ?auto_390070 ?auto_390071 ) ( ON ?auto_390069 ?auto_390070 ) ( ON ?auto_390068 ?auto_390069 ) ( ON ?auto_390067 ?auto_390068 ) ( ON ?auto_390066 ?auto_390067 ) ( ON ?auto_390065 ?auto_390066 ) ( CLEAR ?auto_390063 ) ( ON ?auto_390064 ?auto_390065 ) ( CLEAR ?auto_390064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390063 ?auto_390064 )
      ( MAKE-13PILE ?auto_390063 ?auto_390064 ?auto_390065 ?auto_390066 ?auto_390067 ?auto_390068 ?auto_390069 ?auto_390070 ?auto_390071 ?auto_390072 ?auto_390073 ?auto_390074 ?auto_390075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390090 - BLOCK
      ?auto_390091 - BLOCK
      ?auto_390092 - BLOCK
      ?auto_390093 - BLOCK
      ?auto_390094 - BLOCK
      ?auto_390095 - BLOCK
      ?auto_390096 - BLOCK
      ?auto_390097 - BLOCK
      ?auto_390098 - BLOCK
      ?auto_390099 - BLOCK
      ?auto_390100 - BLOCK
      ?auto_390101 - BLOCK
      ?auto_390102 - BLOCK
    )
    :vars
    (
      ?auto_390103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390102 ?auto_390103 ) ( ON-TABLE ?auto_390090 ) ( not ( = ?auto_390090 ?auto_390091 ) ) ( not ( = ?auto_390090 ?auto_390092 ) ) ( not ( = ?auto_390090 ?auto_390093 ) ) ( not ( = ?auto_390090 ?auto_390094 ) ) ( not ( = ?auto_390090 ?auto_390095 ) ) ( not ( = ?auto_390090 ?auto_390096 ) ) ( not ( = ?auto_390090 ?auto_390097 ) ) ( not ( = ?auto_390090 ?auto_390098 ) ) ( not ( = ?auto_390090 ?auto_390099 ) ) ( not ( = ?auto_390090 ?auto_390100 ) ) ( not ( = ?auto_390090 ?auto_390101 ) ) ( not ( = ?auto_390090 ?auto_390102 ) ) ( not ( = ?auto_390090 ?auto_390103 ) ) ( not ( = ?auto_390091 ?auto_390092 ) ) ( not ( = ?auto_390091 ?auto_390093 ) ) ( not ( = ?auto_390091 ?auto_390094 ) ) ( not ( = ?auto_390091 ?auto_390095 ) ) ( not ( = ?auto_390091 ?auto_390096 ) ) ( not ( = ?auto_390091 ?auto_390097 ) ) ( not ( = ?auto_390091 ?auto_390098 ) ) ( not ( = ?auto_390091 ?auto_390099 ) ) ( not ( = ?auto_390091 ?auto_390100 ) ) ( not ( = ?auto_390091 ?auto_390101 ) ) ( not ( = ?auto_390091 ?auto_390102 ) ) ( not ( = ?auto_390091 ?auto_390103 ) ) ( not ( = ?auto_390092 ?auto_390093 ) ) ( not ( = ?auto_390092 ?auto_390094 ) ) ( not ( = ?auto_390092 ?auto_390095 ) ) ( not ( = ?auto_390092 ?auto_390096 ) ) ( not ( = ?auto_390092 ?auto_390097 ) ) ( not ( = ?auto_390092 ?auto_390098 ) ) ( not ( = ?auto_390092 ?auto_390099 ) ) ( not ( = ?auto_390092 ?auto_390100 ) ) ( not ( = ?auto_390092 ?auto_390101 ) ) ( not ( = ?auto_390092 ?auto_390102 ) ) ( not ( = ?auto_390092 ?auto_390103 ) ) ( not ( = ?auto_390093 ?auto_390094 ) ) ( not ( = ?auto_390093 ?auto_390095 ) ) ( not ( = ?auto_390093 ?auto_390096 ) ) ( not ( = ?auto_390093 ?auto_390097 ) ) ( not ( = ?auto_390093 ?auto_390098 ) ) ( not ( = ?auto_390093 ?auto_390099 ) ) ( not ( = ?auto_390093 ?auto_390100 ) ) ( not ( = ?auto_390093 ?auto_390101 ) ) ( not ( = ?auto_390093 ?auto_390102 ) ) ( not ( = ?auto_390093 ?auto_390103 ) ) ( not ( = ?auto_390094 ?auto_390095 ) ) ( not ( = ?auto_390094 ?auto_390096 ) ) ( not ( = ?auto_390094 ?auto_390097 ) ) ( not ( = ?auto_390094 ?auto_390098 ) ) ( not ( = ?auto_390094 ?auto_390099 ) ) ( not ( = ?auto_390094 ?auto_390100 ) ) ( not ( = ?auto_390094 ?auto_390101 ) ) ( not ( = ?auto_390094 ?auto_390102 ) ) ( not ( = ?auto_390094 ?auto_390103 ) ) ( not ( = ?auto_390095 ?auto_390096 ) ) ( not ( = ?auto_390095 ?auto_390097 ) ) ( not ( = ?auto_390095 ?auto_390098 ) ) ( not ( = ?auto_390095 ?auto_390099 ) ) ( not ( = ?auto_390095 ?auto_390100 ) ) ( not ( = ?auto_390095 ?auto_390101 ) ) ( not ( = ?auto_390095 ?auto_390102 ) ) ( not ( = ?auto_390095 ?auto_390103 ) ) ( not ( = ?auto_390096 ?auto_390097 ) ) ( not ( = ?auto_390096 ?auto_390098 ) ) ( not ( = ?auto_390096 ?auto_390099 ) ) ( not ( = ?auto_390096 ?auto_390100 ) ) ( not ( = ?auto_390096 ?auto_390101 ) ) ( not ( = ?auto_390096 ?auto_390102 ) ) ( not ( = ?auto_390096 ?auto_390103 ) ) ( not ( = ?auto_390097 ?auto_390098 ) ) ( not ( = ?auto_390097 ?auto_390099 ) ) ( not ( = ?auto_390097 ?auto_390100 ) ) ( not ( = ?auto_390097 ?auto_390101 ) ) ( not ( = ?auto_390097 ?auto_390102 ) ) ( not ( = ?auto_390097 ?auto_390103 ) ) ( not ( = ?auto_390098 ?auto_390099 ) ) ( not ( = ?auto_390098 ?auto_390100 ) ) ( not ( = ?auto_390098 ?auto_390101 ) ) ( not ( = ?auto_390098 ?auto_390102 ) ) ( not ( = ?auto_390098 ?auto_390103 ) ) ( not ( = ?auto_390099 ?auto_390100 ) ) ( not ( = ?auto_390099 ?auto_390101 ) ) ( not ( = ?auto_390099 ?auto_390102 ) ) ( not ( = ?auto_390099 ?auto_390103 ) ) ( not ( = ?auto_390100 ?auto_390101 ) ) ( not ( = ?auto_390100 ?auto_390102 ) ) ( not ( = ?auto_390100 ?auto_390103 ) ) ( not ( = ?auto_390101 ?auto_390102 ) ) ( not ( = ?auto_390101 ?auto_390103 ) ) ( not ( = ?auto_390102 ?auto_390103 ) ) ( ON ?auto_390101 ?auto_390102 ) ( ON ?auto_390100 ?auto_390101 ) ( ON ?auto_390099 ?auto_390100 ) ( ON ?auto_390098 ?auto_390099 ) ( ON ?auto_390097 ?auto_390098 ) ( ON ?auto_390096 ?auto_390097 ) ( ON ?auto_390095 ?auto_390096 ) ( ON ?auto_390094 ?auto_390095 ) ( ON ?auto_390093 ?auto_390094 ) ( ON ?auto_390092 ?auto_390093 ) ( CLEAR ?auto_390090 ) ( ON ?auto_390091 ?auto_390092 ) ( CLEAR ?auto_390091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390090 ?auto_390091 )
      ( MAKE-13PILE ?auto_390090 ?auto_390091 ?auto_390092 ?auto_390093 ?auto_390094 ?auto_390095 ?auto_390096 ?auto_390097 ?auto_390098 ?auto_390099 ?auto_390100 ?auto_390101 ?auto_390102 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390117 - BLOCK
      ?auto_390118 - BLOCK
      ?auto_390119 - BLOCK
      ?auto_390120 - BLOCK
      ?auto_390121 - BLOCK
      ?auto_390122 - BLOCK
      ?auto_390123 - BLOCK
      ?auto_390124 - BLOCK
      ?auto_390125 - BLOCK
      ?auto_390126 - BLOCK
      ?auto_390127 - BLOCK
      ?auto_390128 - BLOCK
      ?auto_390129 - BLOCK
    )
    :vars
    (
      ?auto_390130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390129 ?auto_390130 ) ( not ( = ?auto_390117 ?auto_390118 ) ) ( not ( = ?auto_390117 ?auto_390119 ) ) ( not ( = ?auto_390117 ?auto_390120 ) ) ( not ( = ?auto_390117 ?auto_390121 ) ) ( not ( = ?auto_390117 ?auto_390122 ) ) ( not ( = ?auto_390117 ?auto_390123 ) ) ( not ( = ?auto_390117 ?auto_390124 ) ) ( not ( = ?auto_390117 ?auto_390125 ) ) ( not ( = ?auto_390117 ?auto_390126 ) ) ( not ( = ?auto_390117 ?auto_390127 ) ) ( not ( = ?auto_390117 ?auto_390128 ) ) ( not ( = ?auto_390117 ?auto_390129 ) ) ( not ( = ?auto_390117 ?auto_390130 ) ) ( not ( = ?auto_390118 ?auto_390119 ) ) ( not ( = ?auto_390118 ?auto_390120 ) ) ( not ( = ?auto_390118 ?auto_390121 ) ) ( not ( = ?auto_390118 ?auto_390122 ) ) ( not ( = ?auto_390118 ?auto_390123 ) ) ( not ( = ?auto_390118 ?auto_390124 ) ) ( not ( = ?auto_390118 ?auto_390125 ) ) ( not ( = ?auto_390118 ?auto_390126 ) ) ( not ( = ?auto_390118 ?auto_390127 ) ) ( not ( = ?auto_390118 ?auto_390128 ) ) ( not ( = ?auto_390118 ?auto_390129 ) ) ( not ( = ?auto_390118 ?auto_390130 ) ) ( not ( = ?auto_390119 ?auto_390120 ) ) ( not ( = ?auto_390119 ?auto_390121 ) ) ( not ( = ?auto_390119 ?auto_390122 ) ) ( not ( = ?auto_390119 ?auto_390123 ) ) ( not ( = ?auto_390119 ?auto_390124 ) ) ( not ( = ?auto_390119 ?auto_390125 ) ) ( not ( = ?auto_390119 ?auto_390126 ) ) ( not ( = ?auto_390119 ?auto_390127 ) ) ( not ( = ?auto_390119 ?auto_390128 ) ) ( not ( = ?auto_390119 ?auto_390129 ) ) ( not ( = ?auto_390119 ?auto_390130 ) ) ( not ( = ?auto_390120 ?auto_390121 ) ) ( not ( = ?auto_390120 ?auto_390122 ) ) ( not ( = ?auto_390120 ?auto_390123 ) ) ( not ( = ?auto_390120 ?auto_390124 ) ) ( not ( = ?auto_390120 ?auto_390125 ) ) ( not ( = ?auto_390120 ?auto_390126 ) ) ( not ( = ?auto_390120 ?auto_390127 ) ) ( not ( = ?auto_390120 ?auto_390128 ) ) ( not ( = ?auto_390120 ?auto_390129 ) ) ( not ( = ?auto_390120 ?auto_390130 ) ) ( not ( = ?auto_390121 ?auto_390122 ) ) ( not ( = ?auto_390121 ?auto_390123 ) ) ( not ( = ?auto_390121 ?auto_390124 ) ) ( not ( = ?auto_390121 ?auto_390125 ) ) ( not ( = ?auto_390121 ?auto_390126 ) ) ( not ( = ?auto_390121 ?auto_390127 ) ) ( not ( = ?auto_390121 ?auto_390128 ) ) ( not ( = ?auto_390121 ?auto_390129 ) ) ( not ( = ?auto_390121 ?auto_390130 ) ) ( not ( = ?auto_390122 ?auto_390123 ) ) ( not ( = ?auto_390122 ?auto_390124 ) ) ( not ( = ?auto_390122 ?auto_390125 ) ) ( not ( = ?auto_390122 ?auto_390126 ) ) ( not ( = ?auto_390122 ?auto_390127 ) ) ( not ( = ?auto_390122 ?auto_390128 ) ) ( not ( = ?auto_390122 ?auto_390129 ) ) ( not ( = ?auto_390122 ?auto_390130 ) ) ( not ( = ?auto_390123 ?auto_390124 ) ) ( not ( = ?auto_390123 ?auto_390125 ) ) ( not ( = ?auto_390123 ?auto_390126 ) ) ( not ( = ?auto_390123 ?auto_390127 ) ) ( not ( = ?auto_390123 ?auto_390128 ) ) ( not ( = ?auto_390123 ?auto_390129 ) ) ( not ( = ?auto_390123 ?auto_390130 ) ) ( not ( = ?auto_390124 ?auto_390125 ) ) ( not ( = ?auto_390124 ?auto_390126 ) ) ( not ( = ?auto_390124 ?auto_390127 ) ) ( not ( = ?auto_390124 ?auto_390128 ) ) ( not ( = ?auto_390124 ?auto_390129 ) ) ( not ( = ?auto_390124 ?auto_390130 ) ) ( not ( = ?auto_390125 ?auto_390126 ) ) ( not ( = ?auto_390125 ?auto_390127 ) ) ( not ( = ?auto_390125 ?auto_390128 ) ) ( not ( = ?auto_390125 ?auto_390129 ) ) ( not ( = ?auto_390125 ?auto_390130 ) ) ( not ( = ?auto_390126 ?auto_390127 ) ) ( not ( = ?auto_390126 ?auto_390128 ) ) ( not ( = ?auto_390126 ?auto_390129 ) ) ( not ( = ?auto_390126 ?auto_390130 ) ) ( not ( = ?auto_390127 ?auto_390128 ) ) ( not ( = ?auto_390127 ?auto_390129 ) ) ( not ( = ?auto_390127 ?auto_390130 ) ) ( not ( = ?auto_390128 ?auto_390129 ) ) ( not ( = ?auto_390128 ?auto_390130 ) ) ( not ( = ?auto_390129 ?auto_390130 ) ) ( ON ?auto_390128 ?auto_390129 ) ( ON ?auto_390127 ?auto_390128 ) ( ON ?auto_390126 ?auto_390127 ) ( ON ?auto_390125 ?auto_390126 ) ( ON ?auto_390124 ?auto_390125 ) ( ON ?auto_390123 ?auto_390124 ) ( ON ?auto_390122 ?auto_390123 ) ( ON ?auto_390121 ?auto_390122 ) ( ON ?auto_390120 ?auto_390121 ) ( ON ?auto_390119 ?auto_390120 ) ( ON ?auto_390118 ?auto_390119 ) ( ON ?auto_390117 ?auto_390118 ) ( CLEAR ?auto_390117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390117 )
      ( MAKE-13PILE ?auto_390117 ?auto_390118 ?auto_390119 ?auto_390120 ?auto_390121 ?auto_390122 ?auto_390123 ?auto_390124 ?auto_390125 ?auto_390126 ?auto_390127 ?auto_390128 ?auto_390129 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_390144 - BLOCK
      ?auto_390145 - BLOCK
      ?auto_390146 - BLOCK
      ?auto_390147 - BLOCK
      ?auto_390148 - BLOCK
      ?auto_390149 - BLOCK
      ?auto_390150 - BLOCK
      ?auto_390151 - BLOCK
      ?auto_390152 - BLOCK
      ?auto_390153 - BLOCK
      ?auto_390154 - BLOCK
      ?auto_390155 - BLOCK
      ?auto_390156 - BLOCK
    )
    :vars
    (
      ?auto_390157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390156 ?auto_390157 ) ( not ( = ?auto_390144 ?auto_390145 ) ) ( not ( = ?auto_390144 ?auto_390146 ) ) ( not ( = ?auto_390144 ?auto_390147 ) ) ( not ( = ?auto_390144 ?auto_390148 ) ) ( not ( = ?auto_390144 ?auto_390149 ) ) ( not ( = ?auto_390144 ?auto_390150 ) ) ( not ( = ?auto_390144 ?auto_390151 ) ) ( not ( = ?auto_390144 ?auto_390152 ) ) ( not ( = ?auto_390144 ?auto_390153 ) ) ( not ( = ?auto_390144 ?auto_390154 ) ) ( not ( = ?auto_390144 ?auto_390155 ) ) ( not ( = ?auto_390144 ?auto_390156 ) ) ( not ( = ?auto_390144 ?auto_390157 ) ) ( not ( = ?auto_390145 ?auto_390146 ) ) ( not ( = ?auto_390145 ?auto_390147 ) ) ( not ( = ?auto_390145 ?auto_390148 ) ) ( not ( = ?auto_390145 ?auto_390149 ) ) ( not ( = ?auto_390145 ?auto_390150 ) ) ( not ( = ?auto_390145 ?auto_390151 ) ) ( not ( = ?auto_390145 ?auto_390152 ) ) ( not ( = ?auto_390145 ?auto_390153 ) ) ( not ( = ?auto_390145 ?auto_390154 ) ) ( not ( = ?auto_390145 ?auto_390155 ) ) ( not ( = ?auto_390145 ?auto_390156 ) ) ( not ( = ?auto_390145 ?auto_390157 ) ) ( not ( = ?auto_390146 ?auto_390147 ) ) ( not ( = ?auto_390146 ?auto_390148 ) ) ( not ( = ?auto_390146 ?auto_390149 ) ) ( not ( = ?auto_390146 ?auto_390150 ) ) ( not ( = ?auto_390146 ?auto_390151 ) ) ( not ( = ?auto_390146 ?auto_390152 ) ) ( not ( = ?auto_390146 ?auto_390153 ) ) ( not ( = ?auto_390146 ?auto_390154 ) ) ( not ( = ?auto_390146 ?auto_390155 ) ) ( not ( = ?auto_390146 ?auto_390156 ) ) ( not ( = ?auto_390146 ?auto_390157 ) ) ( not ( = ?auto_390147 ?auto_390148 ) ) ( not ( = ?auto_390147 ?auto_390149 ) ) ( not ( = ?auto_390147 ?auto_390150 ) ) ( not ( = ?auto_390147 ?auto_390151 ) ) ( not ( = ?auto_390147 ?auto_390152 ) ) ( not ( = ?auto_390147 ?auto_390153 ) ) ( not ( = ?auto_390147 ?auto_390154 ) ) ( not ( = ?auto_390147 ?auto_390155 ) ) ( not ( = ?auto_390147 ?auto_390156 ) ) ( not ( = ?auto_390147 ?auto_390157 ) ) ( not ( = ?auto_390148 ?auto_390149 ) ) ( not ( = ?auto_390148 ?auto_390150 ) ) ( not ( = ?auto_390148 ?auto_390151 ) ) ( not ( = ?auto_390148 ?auto_390152 ) ) ( not ( = ?auto_390148 ?auto_390153 ) ) ( not ( = ?auto_390148 ?auto_390154 ) ) ( not ( = ?auto_390148 ?auto_390155 ) ) ( not ( = ?auto_390148 ?auto_390156 ) ) ( not ( = ?auto_390148 ?auto_390157 ) ) ( not ( = ?auto_390149 ?auto_390150 ) ) ( not ( = ?auto_390149 ?auto_390151 ) ) ( not ( = ?auto_390149 ?auto_390152 ) ) ( not ( = ?auto_390149 ?auto_390153 ) ) ( not ( = ?auto_390149 ?auto_390154 ) ) ( not ( = ?auto_390149 ?auto_390155 ) ) ( not ( = ?auto_390149 ?auto_390156 ) ) ( not ( = ?auto_390149 ?auto_390157 ) ) ( not ( = ?auto_390150 ?auto_390151 ) ) ( not ( = ?auto_390150 ?auto_390152 ) ) ( not ( = ?auto_390150 ?auto_390153 ) ) ( not ( = ?auto_390150 ?auto_390154 ) ) ( not ( = ?auto_390150 ?auto_390155 ) ) ( not ( = ?auto_390150 ?auto_390156 ) ) ( not ( = ?auto_390150 ?auto_390157 ) ) ( not ( = ?auto_390151 ?auto_390152 ) ) ( not ( = ?auto_390151 ?auto_390153 ) ) ( not ( = ?auto_390151 ?auto_390154 ) ) ( not ( = ?auto_390151 ?auto_390155 ) ) ( not ( = ?auto_390151 ?auto_390156 ) ) ( not ( = ?auto_390151 ?auto_390157 ) ) ( not ( = ?auto_390152 ?auto_390153 ) ) ( not ( = ?auto_390152 ?auto_390154 ) ) ( not ( = ?auto_390152 ?auto_390155 ) ) ( not ( = ?auto_390152 ?auto_390156 ) ) ( not ( = ?auto_390152 ?auto_390157 ) ) ( not ( = ?auto_390153 ?auto_390154 ) ) ( not ( = ?auto_390153 ?auto_390155 ) ) ( not ( = ?auto_390153 ?auto_390156 ) ) ( not ( = ?auto_390153 ?auto_390157 ) ) ( not ( = ?auto_390154 ?auto_390155 ) ) ( not ( = ?auto_390154 ?auto_390156 ) ) ( not ( = ?auto_390154 ?auto_390157 ) ) ( not ( = ?auto_390155 ?auto_390156 ) ) ( not ( = ?auto_390155 ?auto_390157 ) ) ( not ( = ?auto_390156 ?auto_390157 ) ) ( ON ?auto_390155 ?auto_390156 ) ( ON ?auto_390154 ?auto_390155 ) ( ON ?auto_390153 ?auto_390154 ) ( ON ?auto_390152 ?auto_390153 ) ( ON ?auto_390151 ?auto_390152 ) ( ON ?auto_390150 ?auto_390151 ) ( ON ?auto_390149 ?auto_390150 ) ( ON ?auto_390148 ?auto_390149 ) ( ON ?auto_390147 ?auto_390148 ) ( ON ?auto_390146 ?auto_390147 ) ( ON ?auto_390145 ?auto_390146 ) ( ON ?auto_390144 ?auto_390145 ) ( CLEAR ?auto_390144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390144 )
      ( MAKE-13PILE ?auto_390144 ?auto_390145 ?auto_390146 ?auto_390147 ?auto_390148 ?auto_390149 ?auto_390150 ?auto_390151 ?auto_390152 ?auto_390153 ?auto_390154 ?auto_390155 ?auto_390156 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390172 - BLOCK
      ?auto_390173 - BLOCK
      ?auto_390174 - BLOCK
      ?auto_390175 - BLOCK
      ?auto_390176 - BLOCK
      ?auto_390177 - BLOCK
      ?auto_390178 - BLOCK
      ?auto_390179 - BLOCK
      ?auto_390180 - BLOCK
      ?auto_390181 - BLOCK
      ?auto_390182 - BLOCK
      ?auto_390183 - BLOCK
      ?auto_390184 - BLOCK
      ?auto_390185 - BLOCK
    )
    :vars
    (
      ?auto_390186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390184 ) ( ON ?auto_390185 ?auto_390186 ) ( CLEAR ?auto_390185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390172 ) ( ON ?auto_390173 ?auto_390172 ) ( ON ?auto_390174 ?auto_390173 ) ( ON ?auto_390175 ?auto_390174 ) ( ON ?auto_390176 ?auto_390175 ) ( ON ?auto_390177 ?auto_390176 ) ( ON ?auto_390178 ?auto_390177 ) ( ON ?auto_390179 ?auto_390178 ) ( ON ?auto_390180 ?auto_390179 ) ( ON ?auto_390181 ?auto_390180 ) ( ON ?auto_390182 ?auto_390181 ) ( ON ?auto_390183 ?auto_390182 ) ( ON ?auto_390184 ?auto_390183 ) ( not ( = ?auto_390172 ?auto_390173 ) ) ( not ( = ?auto_390172 ?auto_390174 ) ) ( not ( = ?auto_390172 ?auto_390175 ) ) ( not ( = ?auto_390172 ?auto_390176 ) ) ( not ( = ?auto_390172 ?auto_390177 ) ) ( not ( = ?auto_390172 ?auto_390178 ) ) ( not ( = ?auto_390172 ?auto_390179 ) ) ( not ( = ?auto_390172 ?auto_390180 ) ) ( not ( = ?auto_390172 ?auto_390181 ) ) ( not ( = ?auto_390172 ?auto_390182 ) ) ( not ( = ?auto_390172 ?auto_390183 ) ) ( not ( = ?auto_390172 ?auto_390184 ) ) ( not ( = ?auto_390172 ?auto_390185 ) ) ( not ( = ?auto_390172 ?auto_390186 ) ) ( not ( = ?auto_390173 ?auto_390174 ) ) ( not ( = ?auto_390173 ?auto_390175 ) ) ( not ( = ?auto_390173 ?auto_390176 ) ) ( not ( = ?auto_390173 ?auto_390177 ) ) ( not ( = ?auto_390173 ?auto_390178 ) ) ( not ( = ?auto_390173 ?auto_390179 ) ) ( not ( = ?auto_390173 ?auto_390180 ) ) ( not ( = ?auto_390173 ?auto_390181 ) ) ( not ( = ?auto_390173 ?auto_390182 ) ) ( not ( = ?auto_390173 ?auto_390183 ) ) ( not ( = ?auto_390173 ?auto_390184 ) ) ( not ( = ?auto_390173 ?auto_390185 ) ) ( not ( = ?auto_390173 ?auto_390186 ) ) ( not ( = ?auto_390174 ?auto_390175 ) ) ( not ( = ?auto_390174 ?auto_390176 ) ) ( not ( = ?auto_390174 ?auto_390177 ) ) ( not ( = ?auto_390174 ?auto_390178 ) ) ( not ( = ?auto_390174 ?auto_390179 ) ) ( not ( = ?auto_390174 ?auto_390180 ) ) ( not ( = ?auto_390174 ?auto_390181 ) ) ( not ( = ?auto_390174 ?auto_390182 ) ) ( not ( = ?auto_390174 ?auto_390183 ) ) ( not ( = ?auto_390174 ?auto_390184 ) ) ( not ( = ?auto_390174 ?auto_390185 ) ) ( not ( = ?auto_390174 ?auto_390186 ) ) ( not ( = ?auto_390175 ?auto_390176 ) ) ( not ( = ?auto_390175 ?auto_390177 ) ) ( not ( = ?auto_390175 ?auto_390178 ) ) ( not ( = ?auto_390175 ?auto_390179 ) ) ( not ( = ?auto_390175 ?auto_390180 ) ) ( not ( = ?auto_390175 ?auto_390181 ) ) ( not ( = ?auto_390175 ?auto_390182 ) ) ( not ( = ?auto_390175 ?auto_390183 ) ) ( not ( = ?auto_390175 ?auto_390184 ) ) ( not ( = ?auto_390175 ?auto_390185 ) ) ( not ( = ?auto_390175 ?auto_390186 ) ) ( not ( = ?auto_390176 ?auto_390177 ) ) ( not ( = ?auto_390176 ?auto_390178 ) ) ( not ( = ?auto_390176 ?auto_390179 ) ) ( not ( = ?auto_390176 ?auto_390180 ) ) ( not ( = ?auto_390176 ?auto_390181 ) ) ( not ( = ?auto_390176 ?auto_390182 ) ) ( not ( = ?auto_390176 ?auto_390183 ) ) ( not ( = ?auto_390176 ?auto_390184 ) ) ( not ( = ?auto_390176 ?auto_390185 ) ) ( not ( = ?auto_390176 ?auto_390186 ) ) ( not ( = ?auto_390177 ?auto_390178 ) ) ( not ( = ?auto_390177 ?auto_390179 ) ) ( not ( = ?auto_390177 ?auto_390180 ) ) ( not ( = ?auto_390177 ?auto_390181 ) ) ( not ( = ?auto_390177 ?auto_390182 ) ) ( not ( = ?auto_390177 ?auto_390183 ) ) ( not ( = ?auto_390177 ?auto_390184 ) ) ( not ( = ?auto_390177 ?auto_390185 ) ) ( not ( = ?auto_390177 ?auto_390186 ) ) ( not ( = ?auto_390178 ?auto_390179 ) ) ( not ( = ?auto_390178 ?auto_390180 ) ) ( not ( = ?auto_390178 ?auto_390181 ) ) ( not ( = ?auto_390178 ?auto_390182 ) ) ( not ( = ?auto_390178 ?auto_390183 ) ) ( not ( = ?auto_390178 ?auto_390184 ) ) ( not ( = ?auto_390178 ?auto_390185 ) ) ( not ( = ?auto_390178 ?auto_390186 ) ) ( not ( = ?auto_390179 ?auto_390180 ) ) ( not ( = ?auto_390179 ?auto_390181 ) ) ( not ( = ?auto_390179 ?auto_390182 ) ) ( not ( = ?auto_390179 ?auto_390183 ) ) ( not ( = ?auto_390179 ?auto_390184 ) ) ( not ( = ?auto_390179 ?auto_390185 ) ) ( not ( = ?auto_390179 ?auto_390186 ) ) ( not ( = ?auto_390180 ?auto_390181 ) ) ( not ( = ?auto_390180 ?auto_390182 ) ) ( not ( = ?auto_390180 ?auto_390183 ) ) ( not ( = ?auto_390180 ?auto_390184 ) ) ( not ( = ?auto_390180 ?auto_390185 ) ) ( not ( = ?auto_390180 ?auto_390186 ) ) ( not ( = ?auto_390181 ?auto_390182 ) ) ( not ( = ?auto_390181 ?auto_390183 ) ) ( not ( = ?auto_390181 ?auto_390184 ) ) ( not ( = ?auto_390181 ?auto_390185 ) ) ( not ( = ?auto_390181 ?auto_390186 ) ) ( not ( = ?auto_390182 ?auto_390183 ) ) ( not ( = ?auto_390182 ?auto_390184 ) ) ( not ( = ?auto_390182 ?auto_390185 ) ) ( not ( = ?auto_390182 ?auto_390186 ) ) ( not ( = ?auto_390183 ?auto_390184 ) ) ( not ( = ?auto_390183 ?auto_390185 ) ) ( not ( = ?auto_390183 ?auto_390186 ) ) ( not ( = ?auto_390184 ?auto_390185 ) ) ( not ( = ?auto_390184 ?auto_390186 ) ) ( not ( = ?auto_390185 ?auto_390186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_390185 ?auto_390186 )
      ( !STACK ?auto_390185 ?auto_390184 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390201 - BLOCK
      ?auto_390202 - BLOCK
      ?auto_390203 - BLOCK
      ?auto_390204 - BLOCK
      ?auto_390205 - BLOCK
      ?auto_390206 - BLOCK
      ?auto_390207 - BLOCK
      ?auto_390208 - BLOCK
      ?auto_390209 - BLOCK
      ?auto_390210 - BLOCK
      ?auto_390211 - BLOCK
      ?auto_390212 - BLOCK
      ?auto_390213 - BLOCK
      ?auto_390214 - BLOCK
    )
    :vars
    (
      ?auto_390215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390213 ) ( ON ?auto_390214 ?auto_390215 ) ( CLEAR ?auto_390214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390201 ) ( ON ?auto_390202 ?auto_390201 ) ( ON ?auto_390203 ?auto_390202 ) ( ON ?auto_390204 ?auto_390203 ) ( ON ?auto_390205 ?auto_390204 ) ( ON ?auto_390206 ?auto_390205 ) ( ON ?auto_390207 ?auto_390206 ) ( ON ?auto_390208 ?auto_390207 ) ( ON ?auto_390209 ?auto_390208 ) ( ON ?auto_390210 ?auto_390209 ) ( ON ?auto_390211 ?auto_390210 ) ( ON ?auto_390212 ?auto_390211 ) ( ON ?auto_390213 ?auto_390212 ) ( not ( = ?auto_390201 ?auto_390202 ) ) ( not ( = ?auto_390201 ?auto_390203 ) ) ( not ( = ?auto_390201 ?auto_390204 ) ) ( not ( = ?auto_390201 ?auto_390205 ) ) ( not ( = ?auto_390201 ?auto_390206 ) ) ( not ( = ?auto_390201 ?auto_390207 ) ) ( not ( = ?auto_390201 ?auto_390208 ) ) ( not ( = ?auto_390201 ?auto_390209 ) ) ( not ( = ?auto_390201 ?auto_390210 ) ) ( not ( = ?auto_390201 ?auto_390211 ) ) ( not ( = ?auto_390201 ?auto_390212 ) ) ( not ( = ?auto_390201 ?auto_390213 ) ) ( not ( = ?auto_390201 ?auto_390214 ) ) ( not ( = ?auto_390201 ?auto_390215 ) ) ( not ( = ?auto_390202 ?auto_390203 ) ) ( not ( = ?auto_390202 ?auto_390204 ) ) ( not ( = ?auto_390202 ?auto_390205 ) ) ( not ( = ?auto_390202 ?auto_390206 ) ) ( not ( = ?auto_390202 ?auto_390207 ) ) ( not ( = ?auto_390202 ?auto_390208 ) ) ( not ( = ?auto_390202 ?auto_390209 ) ) ( not ( = ?auto_390202 ?auto_390210 ) ) ( not ( = ?auto_390202 ?auto_390211 ) ) ( not ( = ?auto_390202 ?auto_390212 ) ) ( not ( = ?auto_390202 ?auto_390213 ) ) ( not ( = ?auto_390202 ?auto_390214 ) ) ( not ( = ?auto_390202 ?auto_390215 ) ) ( not ( = ?auto_390203 ?auto_390204 ) ) ( not ( = ?auto_390203 ?auto_390205 ) ) ( not ( = ?auto_390203 ?auto_390206 ) ) ( not ( = ?auto_390203 ?auto_390207 ) ) ( not ( = ?auto_390203 ?auto_390208 ) ) ( not ( = ?auto_390203 ?auto_390209 ) ) ( not ( = ?auto_390203 ?auto_390210 ) ) ( not ( = ?auto_390203 ?auto_390211 ) ) ( not ( = ?auto_390203 ?auto_390212 ) ) ( not ( = ?auto_390203 ?auto_390213 ) ) ( not ( = ?auto_390203 ?auto_390214 ) ) ( not ( = ?auto_390203 ?auto_390215 ) ) ( not ( = ?auto_390204 ?auto_390205 ) ) ( not ( = ?auto_390204 ?auto_390206 ) ) ( not ( = ?auto_390204 ?auto_390207 ) ) ( not ( = ?auto_390204 ?auto_390208 ) ) ( not ( = ?auto_390204 ?auto_390209 ) ) ( not ( = ?auto_390204 ?auto_390210 ) ) ( not ( = ?auto_390204 ?auto_390211 ) ) ( not ( = ?auto_390204 ?auto_390212 ) ) ( not ( = ?auto_390204 ?auto_390213 ) ) ( not ( = ?auto_390204 ?auto_390214 ) ) ( not ( = ?auto_390204 ?auto_390215 ) ) ( not ( = ?auto_390205 ?auto_390206 ) ) ( not ( = ?auto_390205 ?auto_390207 ) ) ( not ( = ?auto_390205 ?auto_390208 ) ) ( not ( = ?auto_390205 ?auto_390209 ) ) ( not ( = ?auto_390205 ?auto_390210 ) ) ( not ( = ?auto_390205 ?auto_390211 ) ) ( not ( = ?auto_390205 ?auto_390212 ) ) ( not ( = ?auto_390205 ?auto_390213 ) ) ( not ( = ?auto_390205 ?auto_390214 ) ) ( not ( = ?auto_390205 ?auto_390215 ) ) ( not ( = ?auto_390206 ?auto_390207 ) ) ( not ( = ?auto_390206 ?auto_390208 ) ) ( not ( = ?auto_390206 ?auto_390209 ) ) ( not ( = ?auto_390206 ?auto_390210 ) ) ( not ( = ?auto_390206 ?auto_390211 ) ) ( not ( = ?auto_390206 ?auto_390212 ) ) ( not ( = ?auto_390206 ?auto_390213 ) ) ( not ( = ?auto_390206 ?auto_390214 ) ) ( not ( = ?auto_390206 ?auto_390215 ) ) ( not ( = ?auto_390207 ?auto_390208 ) ) ( not ( = ?auto_390207 ?auto_390209 ) ) ( not ( = ?auto_390207 ?auto_390210 ) ) ( not ( = ?auto_390207 ?auto_390211 ) ) ( not ( = ?auto_390207 ?auto_390212 ) ) ( not ( = ?auto_390207 ?auto_390213 ) ) ( not ( = ?auto_390207 ?auto_390214 ) ) ( not ( = ?auto_390207 ?auto_390215 ) ) ( not ( = ?auto_390208 ?auto_390209 ) ) ( not ( = ?auto_390208 ?auto_390210 ) ) ( not ( = ?auto_390208 ?auto_390211 ) ) ( not ( = ?auto_390208 ?auto_390212 ) ) ( not ( = ?auto_390208 ?auto_390213 ) ) ( not ( = ?auto_390208 ?auto_390214 ) ) ( not ( = ?auto_390208 ?auto_390215 ) ) ( not ( = ?auto_390209 ?auto_390210 ) ) ( not ( = ?auto_390209 ?auto_390211 ) ) ( not ( = ?auto_390209 ?auto_390212 ) ) ( not ( = ?auto_390209 ?auto_390213 ) ) ( not ( = ?auto_390209 ?auto_390214 ) ) ( not ( = ?auto_390209 ?auto_390215 ) ) ( not ( = ?auto_390210 ?auto_390211 ) ) ( not ( = ?auto_390210 ?auto_390212 ) ) ( not ( = ?auto_390210 ?auto_390213 ) ) ( not ( = ?auto_390210 ?auto_390214 ) ) ( not ( = ?auto_390210 ?auto_390215 ) ) ( not ( = ?auto_390211 ?auto_390212 ) ) ( not ( = ?auto_390211 ?auto_390213 ) ) ( not ( = ?auto_390211 ?auto_390214 ) ) ( not ( = ?auto_390211 ?auto_390215 ) ) ( not ( = ?auto_390212 ?auto_390213 ) ) ( not ( = ?auto_390212 ?auto_390214 ) ) ( not ( = ?auto_390212 ?auto_390215 ) ) ( not ( = ?auto_390213 ?auto_390214 ) ) ( not ( = ?auto_390213 ?auto_390215 ) ) ( not ( = ?auto_390214 ?auto_390215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_390214 ?auto_390215 )
      ( !STACK ?auto_390214 ?auto_390213 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390230 - BLOCK
      ?auto_390231 - BLOCK
      ?auto_390232 - BLOCK
      ?auto_390233 - BLOCK
      ?auto_390234 - BLOCK
      ?auto_390235 - BLOCK
      ?auto_390236 - BLOCK
      ?auto_390237 - BLOCK
      ?auto_390238 - BLOCK
      ?auto_390239 - BLOCK
      ?auto_390240 - BLOCK
      ?auto_390241 - BLOCK
      ?auto_390242 - BLOCK
      ?auto_390243 - BLOCK
    )
    :vars
    (
      ?auto_390244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390243 ?auto_390244 ) ( ON-TABLE ?auto_390230 ) ( ON ?auto_390231 ?auto_390230 ) ( ON ?auto_390232 ?auto_390231 ) ( ON ?auto_390233 ?auto_390232 ) ( ON ?auto_390234 ?auto_390233 ) ( ON ?auto_390235 ?auto_390234 ) ( ON ?auto_390236 ?auto_390235 ) ( ON ?auto_390237 ?auto_390236 ) ( ON ?auto_390238 ?auto_390237 ) ( ON ?auto_390239 ?auto_390238 ) ( ON ?auto_390240 ?auto_390239 ) ( ON ?auto_390241 ?auto_390240 ) ( not ( = ?auto_390230 ?auto_390231 ) ) ( not ( = ?auto_390230 ?auto_390232 ) ) ( not ( = ?auto_390230 ?auto_390233 ) ) ( not ( = ?auto_390230 ?auto_390234 ) ) ( not ( = ?auto_390230 ?auto_390235 ) ) ( not ( = ?auto_390230 ?auto_390236 ) ) ( not ( = ?auto_390230 ?auto_390237 ) ) ( not ( = ?auto_390230 ?auto_390238 ) ) ( not ( = ?auto_390230 ?auto_390239 ) ) ( not ( = ?auto_390230 ?auto_390240 ) ) ( not ( = ?auto_390230 ?auto_390241 ) ) ( not ( = ?auto_390230 ?auto_390242 ) ) ( not ( = ?auto_390230 ?auto_390243 ) ) ( not ( = ?auto_390230 ?auto_390244 ) ) ( not ( = ?auto_390231 ?auto_390232 ) ) ( not ( = ?auto_390231 ?auto_390233 ) ) ( not ( = ?auto_390231 ?auto_390234 ) ) ( not ( = ?auto_390231 ?auto_390235 ) ) ( not ( = ?auto_390231 ?auto_390236 ) ) ( not ( = ?auto_390231 ?auto_390237 ) ) ( not ( = ?auto_390231 ?auto_390238 ) ) ( not ( = ?auto_390231 ?auto_390239 ) ) ( not ( = ?auto_390231 ?auto_390240 ) ) ( not ( = ?auto_390231 ?auto_390241 ) ) ( not ( = ?auto_390231 ?auto_390242 ) ) ( not ( = ?auto_390231 ?auto_390243 ) ) ( not ( = ?auto_390231 ?auto_390244 ) ) ( not ( = ?auto_390232 ?auto_390233 ) ) ( not ( = ?auto_390232 ?auto_390234 ) ) ( not ( = ?auto_390232 ?auto_390235 ) ) ( not ( = ?auto_390232 ?auto_390236 ) ) ( not ( = ?auto_390232 ?auto_390237 ) ) ( not ( = ?auto_390232 ?auto_390238 ) ) ( not ( = ?auto_390232 ?auto_390239 ) ) ( not ( = ?auto_390232 ?auto_390240 ) ) ( not ( = ?auto_390232 ?auto_390241 ) ) ( not ( = ?auto_390232 ?auto_390242 ) ) ( not ( = ?auto_390232 ?auto_390243 ) ) ( not ( = ?auto_390232 ?auto_390244 ) ) ( not ( = ?auto_390233 ?auto_390234 ) ) ( not ( = ?auto_390233 ?auto_390235 ) ) ( not ( = ?auto_390233 ?auto_390236 ) ) ( not ( = ?auto_390233 ?auto_390237 ) ) ( not ( = ?auto_390233 ?auto_390238 ) ) ( not ( = ?auto_390233 ?auto_390239 ) ) ( not ( = ?auto_390233 ?auto_390240 ) ) ( not ( = ?auto_390233 ?auto_390241 ) ) ( not ( = ?auto_390233 ?auto_390242 ) ) ( not ( = ?auto_390233 ?auto_390243 ) ) ( not ( = ?auto_390233 ?auto_390244 ) ) ( not ( = ?auto_390234 ?auto_390235 ) ) ( not ( = ?auto_390234 ?auto_390236 ) ) ( not ( = ?auto_390234 ?auto_390237 ) ) ( not ( = ?auto_390234 ?auto_390238 ) ) ( not ( = ?auto_390234 ?auto_390239 ) ) ( not ( = ?auto_390234 ?auto_390240 ) ) ( not ( = ?auto_390234 ?auto_390241 ) ) ( not ( = ?auto_390234 ?auto_390242 ) ) ( not ( = ?auto_390234 ?auto_390243 ) ) ( not ( = ?auto_390234 ?auto_390244 ) ) ( not ( = ?auto_390235 ?auto_390236 ) ) ( not ( = ?auto_390235 ?auto_390237 ) ) ( not ( = ?auto_390235 ?auto_390238 ) ) ( not ( = ?auto_390235 ?auto_390239 ) ) ( not ( = ?auto_390235 ?auto_390240 ) ) ( not ( = ?auto_390235 ?auto_390241 ) ) ( not ( = ?auto_390235 ?auto_390242 ) ) ( not ( = ?auto_390235 ?auto_390243 ) ) ( not ( = ?auto_390235 ?auto_390244 ) ) ( not ( = ?auto_390236 ?auto_390237 ) ) ( not ( = ?auto_390236 ?auto_390238 ) ) ( not ( = ?auto_390236 ?auto_390239 ) ) ( not ( = ?auto_390236 ?auto_390240 ) ) ( not ( = ?auto_390236 ?auto_390241 ) ) ( not ( = ?auto_390236 ?auto_390242 ) ) ( not ( = ?auto_390236 ?auto_390243 ) ) ( not ( = ?auto_390236 ?auto_390244 ) ) ( not ( = ?auto_390237 ?auto_390238 ) ) ( not ( = ?auto_390237 ?auto_390239 ) ) ( not ( = ?auto_390237 ?auto_390240 ) ) ( not ( = ?auto_390237 ?auto_390241 ) ) ( not ( = ?auto_390237 ?auto_390242 ) ) ( not ( = ?auto_390237 ?auto_390243 ) ) ( not ( = ?auto_390237 ?auto_390244 ) ) ( not ( = ?auto_390238 ?auto_390239 ) ) ( not ( = ?auto_390238 ?auto_390240 ) ) ( not ( = ?auto_390238 ?auto_390241 ) ) ( not ( = ?auto_390238 ?auto_390242 ) ) ( not ( = ?auto_390238 ?auto_390243 ) ) ( not ( = ?auto_390238 ?auto_390244 ) ) ( not ( = ?auto_390239 ?auto_390240 ) ) ( not ( = ?auto_390239 ?auto_390241 ) ) ( not ( = ?auto_390239 ?auto_390242 ) ) ( not ( = ?auto_390239 ?auto_390243 ) ) ( not ( = ?auto_390239 ?auto_390244 ) ) ( not ( = ?auto_390240 ?auto_390241 ) ) ( not ( = ?auto_390240 ?auto_390242 ) ) ( not ( = ?auto_390240 ?auto_390243 ) ) ( not ( = ?auto_390240 ?auto_390244 ) ) ( not ( = ?auto_390241 ?auto_390242 ) ) ( not ( = ?auto_390241 ?auto_390243 ) ) ( not ( = ?auto_390241 ?auto_390244 ) ) ( not ( = ?auto_390242 ?auto_390243 ) ) ( not ( = ?auto_390242 ?auto_390244 ) ) ( not ( = ?auto_390243 ?auto_390244 ) ) ( CLEAR ?auto_390241 ) ( ON ?auto_390242 ?auto_390243 ) ( CLEAR ?auto_390242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_390230 ?auto_390231 ?auto_390232 ?auto_390233 ?auto_390234 ?auto_390235 ?auto_390236 ?auto_390237 ?auto_390238 ?auto_390239 ?auto_390240 ?auto_390241 ?auto_390242 )
      ( MAKE-14PILE ?auto_390230 ?auto_390231 ?auto_390232 ?auto_390233 ?auto_390234 ?auto_390235 ?auto_390236 ?auto_390237 ?auto_390238 ?auto_390239 ?auto_390240 ?auto_390241 ?auto_390242 ?auto_390243 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390259 - BLOCK
      ?auto_390260 - BLOCK
      ?auto_390261 - BLOCK
      ?auto_390262 - BLOCK
      ?auto_390263 - BLOCK
      ?auto_390264 - BLOCK
      ?auto_390265 - BLOCK
      ?auto_390266 - BLOCK
      ?auto_390267 - BLOCK
      ?auto_390268 - BLOCK
      ?auto_390269 - BLOCK
      ?auto_390270 - BLOCK
      ?auto_390271 - BLOCK
      ?auto_390272 - BLOCK
    )
    :vars
    (
      ?auto_390273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390272 ?auto_390273 ) ( ON-TABLE ?auto_390259 ) ( ON ?auto_390260 ?auto_390259 ) ( ON ?auto_390261 ?auto_390260 ) ( ON ?auto_390262 ?auto_390261 ) ( ON ?auto_390263 ?auto_390262 ) ( ON ?auto_390264 ?auto_390263 ) ( ON ?auto_390265 ?auto_390264 ) ( ON ?auto_390266 ?auto_390265 ) ( ON ?auto_390267 ?auto_390266 ) ( ON ?auto_390268 ?auto_390267 ) ( ON ?auto_390269 ?auto_390268 ) ( ON ?auto_390270 ?auto_390269 ) ( not ( = ?auto_390259 ?auto_390260 ) ) ( not ( = ?auto_390259 ?auto_390261 ) ) ( not ( = ?auto_390259 ?auto_390262 ) ) ( not ( = ?auto_390259 ?auto_390263 ) ) ( not ( = ?auto_390259 ?auto_390264 ) ) ( not ( = ?auto_390259 ?auto_390265 ) ) ( not ( = ?auto_390259 ?auto_390266 ) ) ( not ( = ?auto_390259 ?auto_390267 ) ) ( not ( = ?auto_390259 ?auto_390268 ) ) ( not ( = ?auto_390259 ?auto_390269 ) ) ( not ( = ?auto_390259 ?auto_390270 ) ) ( not ( = ?auto_390259 ?auto_390271 ) ) ( not ( = ?auto_390259 ?auto_390272 ) ) ( not ( = ?auto_390259 ?auto_390273 ) ) ( not ( = ?auto_390260 ?auto_390261 ) ) ( not ( = ?auto_390260 ?auto_390262 ) ) ( not ( = ?auto_390260 ?auto_390263 ) ) ( not ( = ?auto_390260 ?auto_390264 ) ) ( not ( = ?auto_390260 ?auto_390265 ) ) ( not ( = ?auto_390260 ?auto_390266 ) ) ( not ( = ?auto_390260 ?auto_390267 ) ) ( not ( = ?auto_390260 ?auto_390268 ) ) ( not ( = ?auto_390260 ?auto_390269 ) ) ( not ( = ?auto_390260 ?auto_390270 ) ) ( not ( = ?auto_390260 ?auto_390271 ) ) ( not ( = ?auto_390260 ?auto_390272 ) ) ( not ( = ?auto_390260 ?auto_390273 ) ) ( not ( = ?auto_390261 ?auto_390262 ) ) ( not ( = ?auto_390261 ?auto_390263 ) ) ( not ( = ?auto_390261 ?auto_390264 ) ) ( not ( = ?auto_390261 ?auto_390265 ) ) ( not ( = ?auto_390261 ?auto_390266 ) ) ( not ( = ?auto_390261 ?auto_390267 ) ) ( not ( = ?auto_390261 ?auto_390268 ) ) ( not ( = ?auto_390261 ?auto_390269 ) ) ( not ( = ?auto_390261 ?auto_390270 ) ) ( not ( = ?auto_390261 ?auto_390271 ) ) ( not ( = ?auto_390261 ?auto_390272 ) ) ( not ( = ?auto_390261 ?auto_390273 ) ) ( not ( = ?auto_390262 ?auto_390263 ) ) ( not ( = ?auto_390262 ?auto_390264 ) ) ( not ( = ?auto_390262 ?auto_390265 ) ) ( not ( = ?auto_390262 ?auto_390266 ) ) ( not ( = ?auto_390262 ?auto_390267 ) ) ( not ( = ?auto_390262 ?auto_390268 ) ) ( not ( = ?auto_390262 ?auto_390269 ) ) ( not ( = ?auto_390262 ?auto_390270 ) ) ( not ( = ?auto_390262 ?auto_390271 ) ) ( not ( = ?auto_390262 ?auto_390272 ) ) ( not ( = ?auto_390262 ?auto_390273 ) ) ( not ( = ?auto_390263 ?auto_390264 ) ) ( not ( = ?auto_390263 ?auto_390265 ) ) ( not ( = ?auto_390263 ?auto_390266 ) ) ( not ( = ?auto_390263 ?auto_390267 ) ) ( not ( = ?auto_390263 ?auto_390268 ) ) ( not ( = ?auto_390263 ?auto_390269 ) ) ( not ( = ?auto_390263 ?auto_390270 ) ) ( not ( = ?auto_390263 ?auto_390271 ) ) ( not ( = ?auto_390263 ?auto_390272 ) ) ( not ( = ?auto_390263 ?auto_390273 ) ) ( not ( = ?auto_390264 ?auto_390265 ) ) ( not ( = ?auto_390264 ?auto_390266 ) ) ( not ( = ?auto_390264 ?auto_390267 ) ) ( not ( = ?auto_390264 ?auto_390268 ) ) ( not ( = ?auto_390264 ?auto_390269 ) ) ( not ( = ?auto_390264 ?auto_390270 ) ) ( not ( = ?auto_390264 ?auto_390271 ) ) ( not ( = ?auto_390264 ?auto_390272 ) ) ( not ( = ?auto_390264 ?auto_390273 ) ) ( not ( = ?auto_390265 ?auto_390266 ) ) ( not ( = ?auto_390265 ?auto_390267 ) ) ( not ( = ?auto_390265 ?auto_390268 ) ) ( not ( = ?auto_390265 ?auto_390269 ) ) ( not ( = ?auto_390265 ?auto_390270 ) ) ( not ( = ?auto_390265 ?auto_390271 ) ) ( not ( = ?auto_390265 ?auto_390272 ) ) ( not ( = ?auto_390265 ?auto_390273 ) ) ( not ( = ?auto_390266 ?auto_390267 ) ) ( not ( = ?auto_390266 ?auto_390268 ) ) ( not ( = ?auto_390266 ?auto_390269 ) ) ( not ( = ?auto_390266 ?auto_390270 ) ) ( not ( = ?auto_390266 ?auto_390271 ) ) ( not ( = ?auto_390266 ?auto_390272 ) ) ( not ( = ?auto_390266 ?auto_390273 ) ) ( not ( = ?auto_390267 ?auto_390268 ) ) ( not ( = ?auto_390267 ?auto_390269 ) ) ( not ( = ?auto_390267 ?auto_390270 ) ) ( not ( = ?auto_390267 ?auto_390271 ) ) ( not ( = ?auto_390267 ?auto_390272 ) ) ( not ( = ?auto_390267 ?auto_390273 ) ) ( not ( = ?auto_390268 ?auto_390269 ) ) ( not ( = ?auto_390268 ?auto_390270 ) ) ( not ( = ?auto_390268 ?auto_390271 ) ) ( not ( = ?auto_390268 ?auto_390272 ) ) ( not ( = ?auto_390268 ?auto_390273 ) ) ( not ( = ?auto_390269 ?auto_390270 ) ) ( not ( = ?auto_390269 ?auto_390271 ) ) ( not ( = ?auto_390269 ?auto_390272 ) ) ( not ( = ?auto_390269 ?auto_390273 ) ) ( not ( = ?auto_390270 ?auto_390271 ) ) ( not ( = ?auto_390270 ?auto_390272 ) ) ( not ( = ?auto_390270 ?auto_390273 ) ) ( not ( = ?auto_390271 ?auto_390272 ) ) ( not ( = ?auto_390271 ?auto_390273 ) ) ( not ( = ?auto_390272 ?auto_390273 ) ) ( CLEAR ?auto_390270 ) ( ON ?auto_390271 ?auto_390272 ) ( CLEAR ?auto_390271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_390259 ?auto_390260 ?auto_390261 ?auto_390262 ?auto_390263 ?auto_390264 ?auto_390265 ?auto_390266 ?auto_390267 ?auto_390268 ?auto_390269 ?auto_390270 ?auto_390271 )
      ( MAKE-14PILE ?auto_390259 ?auto_390260 ?auto_390261 ?auto_390262 ?auto_390263 ?auto_390264 ?auto_390265 ?auto_390266 ?auto_390267 ?auto_390268 ?auto_390269 ?auto_390270 ?auto_390271 ?auto_390272 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390288 - BLOCK
      ?auto_390289 - BLOCK
      ?auto_390290 - BLOCK
      ?auto_390291 - BLOCK
      ?auto_390292 - BLOCK
      ?auto_390293 - BLOCK
      ?auto_390294 - BLOCK
      ?auto_390295 - BLOCK
      ?auto_390296 - BLOCK
      ?auto_390297 - BLOCK
      ?auto_390298 - BLOCK
      ?auto_390299 - BLOCK
      ?auto_390300 - BLOCK
      ?auto_390301 - BLOCK
    )
    :vars
    (
      ?auto_390302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390301 ?auto_390302 ) ( ON-TABLE ?auto_390288 ) ( ON ?auto_390289 ?auto_390288 ) ( ON ?auto_390290 ?auto_390289 ) ( ON ?auto_390291 ?auto_390290 ) ( ON ?auto_390292 ?auto_390291 ) ( ON ?auto_390293 ?auto_390292 ) ( ON ?auto_390294 ?auto_390293 ) ( ON ?auto_390295 ?auto_390294 ) ( ON ?auto_390296 ?auto_390295 ) ( ON ?auto_390297 ?auto_390296 ) ( ON ?auto_390298 ?auto_390297 ) ( not ( = ?auto_390288 ?auto_390289 ) ) ( not ( = ?auto_390288 ?auto_390290 ) ) ( not ( = ?auto_390288 ?auto_390291 ) ) ( not ( = ?auto_390288 ?auto_390292 ) ) ( not ( = ?auto_390288 ?auto_390293 ) ) ( not ( = ?auto_390288 ?auto_390294 ) ) ( not ( = ?auto_390288 ?auto_390295 ) ) ( not ( = ?auto_390288 ?auto_390296 ) ) ( not ( = ?auto_390288 ?auto_390297 ) ) ( not ( = ?auto_390288 ?auto_390298 ) ) ( not ( = ?auto_390288 ?auto_390299 ) ) ( not ( = ?auto_390288 ?auto_390300 ) ) ( not ( = ?auto_390288 ?auto_390301 ) ) ( not ( = ?auto_390288 ?auto_390302 ) ) ( not ( = ?auto_390289 ?auto_390290 ) ) ( not ( = ?auto_390289 ?auto_390291 ) ) ( not ( = ?auto_390289 ?auto_390292 ) ) ( not ( = ?auto_390289 ?auto_390293 ) ) ( not ( = ?auto_390289 ?auto_390294 ) ) ( not ( = ?auto_390289 ?auto_390295 ) ) ( not ( = ?auto_390289 ?auto_390296 ) ) ( not ( = ?auto_390289 ?auto_390297 ) ) ( not ( = ?auto_390289 ?auto_390298 ) ) ( not ( = ?auto_390289 ?auto_390299 ) ) ( not ( = ?auto_390289 ?auto_390300 ) ) ( not ( = ?auto_390289 ?auto_390301 ) ) ( not ( = ?auto_390289 ?auto_390302 ) ) ( not ( = ?auto_390290 ?auto_390291 ) ) ( not ( = ?auto_390290 ?auto_390292 ) ) ( not ( = ?auto_390290 ?auto_390293 ) ) ( not ( = ?auto_390290 ?auto_390294 ) ) ( not ( = ?auto_390290 ?auto_390295 ) ) ( not ( = ?auto_390290 ?auto_390296 ) ) ( not ( = ?auto_390290 ?auto_390297 ) ) ( not ( = ?auto_390290 ?auto_390298 ) ) ( not ( = ?auto_390290 ?auto_390299 ) ) ( not ( = ?auto_390290 ?auto_390300 ) ) ( not ( = ?auto_390290 ?auto_390301 ) ) ( not ( = ?auto_390290 ?auto_390302 ) ) ( not ( = ?auto_390291 ?auto_390292 ) ) ( not ( = ?auto_390291 ?auto_390293 ) ) ( not ( = ?auto_390291 ?auto_390294 ) ) ( not ( = ?auto_390291 ?auto_390295 ) ) ( not ( = ?auto_390291 ?auto_390296 ) ) ( not ( = ?auto_390291 ?auto_390297 ) ) ( not ( = ?auto_390291 ?auto_390298 ) ) ( not ( = ?auto_390291 ?auto_390299 ) ) ( not ( = ?auto_390291 ?auto_390300 ) ) ( not ( = ?auto_390291 ?auto_390301 ) ) ( not ( = ?auto_390291 ?auto_390302 ) ) ( not ( = ?auto_390292 ?auto_390293 ) ) ( not ( = ?auto_390292 ?auto_390294 ) ) ( not ( = ?auto_390292 ?auto_390295 ) ) ( not ( = ?auto_390292 ?auto_390296 ) ) ( not ( = ?auto_390292 ?auto_390297 ) ) ( not ( = ?auto_390292 ?auto_390298 ) ) ( not ( = ?auto_390292 ?auto_390299 ) ) ( not ( = ?auto_390292 ?auto_390300 ) ) ( not ( = ?auto_390292 ?auto_390301 ) ) ( not ( = ?auto_390292 ?auto_390302 ) ) ( not ( = ?auto_390293 ?auto_390294 ) ) ( not ( = ?auto_390293 ?auto_390295 ) ) ( not ( = ?auto_390293 ?auto_390296 ) ) ( not ( = ?auto_390293 ?auto_390297 ) ) ( not ( = ?auto_390293 ?auto_390298 ) ) ( not ( = ?auto_390293 ?auto_390299 ) ) ( not ( = ?auto_390293 ?auto_390300 ) ) ( not ( = ?auto_390293 ?auto_390301 ) ) ( not ( = ?auto_390293 ?auto_390302 ) ) ( not ( = ?auto_390294 ?auto_390295 ) ) ( not ( = ?auto_390294 ?auto_390296 ) ) ( not ( = ?auto_390294 ?auto_390297 ) ) ( not ( = ?auto_390294 ?auto_390298 ) ) ( not ( = ?auto_390294 ?auto_390299 ) ) ( not ( = ?auto_390294 ?auto_390300 ) ) ( not ( = ?auto_390294 ?auto_390301 ) ) ( not ( = ?auto_390294 ?auto_390302 ) ) ( not ( = ?auto_390295 ?auto_390296 ) ) ( not ( = ?auto_390295 ?auto_390297 ) ) ( not ( = ?auto_390295 ?auto_390298 ) ) ( not ( = ?auto_390295 ?auto_390299 ) ) ( not ( = ?auto_390295 ?auto_390300 ) ) ( not ( = ?auto_390295 ?auto_390301 ) ) ( not ( = ?auto_390295 ?auto_390302 ) ) ( not ( = ?auto_390296 ?auto_390297 ) ) ( not ( = ?auto_390296 ?auto_390298 ) ) ( not ( = ?auto_390296 ?auto_390299 ) ) ( not ( = ?auto_390296 ?auto_390300 ) ) ( not ( = ?auto_390296 ?auto_390301 ) ) ( not ( = ?auto_390296 ?auto_390302 ) ) ( not ( = ?auto_390297 ?auto_390298 ) ) ( not ( = ?auto_390297 ?auto_390299 ) ) ( not ( = ?auto_390297 ?auto_390300 ) ) ( not ( = ?auto_390297 ?auto_390301 ) ) ( not ( = ?auto_390297 ?auto_390302 ) ) ( not ( = ?auto_390298 ?auto_390299 ) ) ( not ( = ?auto_390298 ?auto_390300 ) ) ( not ( = ?auto_390298 ?auto_390301 ) ) ( not ( = ?auto_390298 ?auto_390302 ) ) ( not ( = ?auto_390299 ?auto_390300 ) ) ( not ( = ?auto_390299 ?auto_390301 ) ) ( not ( = ?auto_390299 ?auto_390302 ) ) ( not ( = ?auto_390300 ?auto_390301 ) ) ( not ( = ?auto_390300 ?auto_390302 ) ) ( not ( = ?auto_390301 ?auto_390302 ) ) ( ON ?auto_390300 ?auto_390301 ) ( CLEAR ?auto_390298 ) ( ON ?auto_390299 ?auto_390300 ) ( CLEAR ?auto_390299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_390288 ?auto_390289 ?auto_390290 ?auto_390291 ?auto_390292 ?auto_390293 ?auto_390294 ?auto_390295 ?auto_390296 ?auto_390297 ?auto_390298 ?auto_390299 )
      ( MAKE-14PILE ?auto_390288 ?auto_390289 ?auto_390290 ?auto_390291 ?auto_390292 ?auto_390293 ?auto_390294 ?auto_390295 ?auto_390296 ?auto_390297 ?auto_390298 ?auto_390299 ?auto_390300 ?auto_390301 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390317 - BLOCK
      ?auto_390318 - BLOCK
      ?auto_390319 - BLOCK
      ?auto_390320 - BLOCK
      ?auto_390321 - BLOCK
      ?auto_390322 - BLOCK
      ?auto_390323 - BLOCK
      ?auto_390324 - BLOCK
      ?auto_390325 - BLOCK
      ?auto_390326 - BLOCK
      ?auto_390327 - BLOCK
      ?auto_390328 - BLOCK
      ?auto_390329 - BLOCK
      ?auto_390330 - BLOCK
    )
    :vars
    (
      ?auto_390331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390330 ?auto_390331 ) ( ON-TABLE ?auto_390317 ) ( ON ?auto_390318 ?auto_390317 ) ( ON ?auto_390319 ?auto_390318 ) ( ON ?auto_390320 ?auto_390319 ) ( ON ?auto_390321 ?auto_390320 ) ( ON ?auto_390322 ?auto_390321 ) ( ON ?auto_390323 ?auto_390322 ) ( ON ?auto_390324 ?auto_390323 ) ( ON ?auto_390325 ?auto_390324 ) ( ON ?auto_390326 ?auto_390325 ) ( ON ?auto_390327 ?auto_390326 ) ( not ( = ?auto_390317 ?auto_390318 ) ) ( not ( = ?auto_390317 ?auto_390319 ) ) ( not ( = ?auto_390317 ?auto_390320 ) ) ( not ( = ?auto_390317 ?auto_390321 ) ) ( not ( = ?auto_390317 ?auto_390322 ) ) ( not ( = ?auto_390317 ?auto_390323 ) ) ( not ( = ?auto_390317 ?auto_390324 ) ) ( not ( = ?auto_390317 ?auto_390325 ) ) ( not ( = ?auto_390317 ?auto_390326 ) ) ( not ( = ?auto_390317 ?auto_390327 ) ) ( not ( = ?auto_390317 ?auto_390328 ) ) ( not ( = ?auto_390317 ?auto_390329 ) ) ( not ( = ?auto_390317 ?auto_390330 ) ) ( not ( = ?auto_390317 ?auto_390331 ) ) ( not ( = ?auto_390318 ?auto_390319 ) ) ( not ( = ?auto_390318 ?auto_390320 ) ) ( not ( = ?auto_390318 ?auto_390321 ) ) ( not ( = ?auto_390318 ?auto_390322 ) ) ( not ( = ?auto_390318 ?auto_390323 ) ) ( not ( = ?auto_390318 ?auto_390324 ) ) ( not ( = ?auto_390318 ?auto_390325 ) ) ( not ( = ?auto_390318 ?auto_390326 ) ) ( not ( = ?auto_390318 ?auto_390327 ) ) ( not ( = ?auto_390318 ?auto_390328 ) ) ( not ( = ?auto_390318 ?auto_390329 ) ) ( not ( = ?auto_390318 ?auto_390330 ) ) ( not ( = ?auto_390318 ?auto_390331 ) ) ( not ( = ?auto_390319 ?auto_390320 ) ) ( not ( = ?auto_390319 ?auto_390321 ) ) ( not ( = ?auto_390319 ?auto_390322 ) ) ( not ( = ?auto_390319 ?auto_390323 ) ) ( not ( = ?auto_390319 ?auto_390324 ) ) ( not ( = ?auto_390319 ?auto_390325 ) ) ( not ( = ?auto_390319 ?auto_390326 ) ) ( not ( = ?auto_390319 ?auto_390327 ) ) ( not ( = ?auto_390319 ?auto_390328 ) ) ( not ( = ?auto_390319 ?auto_390329 ) ) ( not ( = ?auto_390319 ?auto_390330 ) ) ( not ( = ?auto_390319 ?auto_390331 ) ) ( not ( = ?auto_390320 ?auto_390321 ) ) ( not ( = ?auto_390320 ?auto_390322 ) ) ( not ( = ?auto_390320 ?auto_390323 ) ) ( not ( = ?auto_390320 ?auto_390324 ) ) ( not ( = ?auto_390320 ?auto_390325 ) ) ( not ( = ?auto_390320 ?auto_390326 ) ) ( not ( = ?auto_390320 ?auto_390327 ) ) ( not ( = ?auto_390320 ?auto_390328 ) ) ( not ( = ?auto_390320 ?auto_390329 ) ) ( not ( = ?auto_390320 ?auto_390330 ) ) ( not ( = ?auto_390320 ?auto_390331 ) ) ( not ( = ?auto_390321 ?auto_390322 ) ) ( not ( = ?auto_390321 ?auto_390323 ) ) ( not ( = ?auto_390321 ?auto_390324 ) ) ( not ( = ?auto_390321 ?auto_390325 ) ) ( not ( = ?auto_390321 ?auto_390326 ) ) ( not ( = ?auto_390321 ?auto_390327 ) ) ( not ( = ?auto_390321 ?auto_390328 ) ) ( not ( = ?auto_390321 ?auto_390329 ) ) ( not ( = ?auto_390321 ?auto_390330 ) ) ( not ( = ?auto_390321 ?auto_390331 ) ) ( not ( = ?auto_390322 ?auto_390323 ) ) ( not ( = ?auto_390322 ?auto_390324 ) ) ( not ( = ?auto_390322 ?auto_390325 ) ) ( not ( = ?auto_390322 ?auto_390326 ) ) ( not ( = ?auto_390322 ?auto_390327 ) ) ( not ( = ?auto_390322 ?auto_390328 ) ) ( not ( = ?auto_390322 ?auto_390329 ) ) ( not ( = ?auto_390322 ?auto_390330 ) ) ( not ( = ?auto_390322 ?auto_390331 ) ) ( not ( = ?auto_390323 ?auto_390324 ) ) ( not ( = ?auto_390323 ?auto_390325 ) ) ( not ( = ?auto_390323 ?auto_390326 ) ) ( not ( = ?auto_390323 ?auto_390327 ) ) ( not ( = ?auto_390323 ?auto_390328 ) ) ( not ( = ?auto_390323 ?auto_390329 ) ) ( not ( = ?auto_390323 ?auto_390330 ) ) ( not ( = ?auto_390323 ?auto_390331 ) ) ( not ( = ?auto_390324 ?auto_390325 ) ) ( not ( = ?auto_390324 ?auto_390326 ) ) ( not ( = ?auto_390324 ?auto_390327 ) ) ( not ( = ?auto_390324 ?auto_390328 ) ) ( not ( = ?auto_390324 ?auto_390329 ) ) ( not ( = ?auto_390324 ?auto_390330 ) ) ( not ( = ?auto_390324 ?auto_390331 ) ) ( not ( = ?auto_390325 ?auto_390326 ) ) ( not ( = ?auto_390325 ?auto_390327 ) ) ( not ( = ?auto_390325 ?auto_390328 ) ) ( not ( = ?auto_390325 ?auto_390329 ) ) ( not ( = ?auto_390325 ?auto_390330 ) ) ( not ( = ?auto_390325 ?auto_390331 ) ) ( not ( = ?auto_390326 ?auto_390327 ) ) ( not ( = ?auto_390326 ?auto_390328 ) ) ( not ( = ?auto_390326 ?auto_390329 ) ) ( not ( = ?auto_390326 ?auto_390330 ) ) ( not ( = ?auto_390326 ?auto_390331 ) ) ( not ( = ?auto_390327 ?auto_390328 ) ) ( not ( = ?auto_390327 ?auto_390329 ) ) ( not ( = ?auto_390327 ?auto_390330 ) ) ( not ( = ?auto_390327 ?auto_390331 ) ) ( not ( = ?auto_390328 ?auto_390329 ) ) ( not ( = ?auto_390328 ?auto_390330 ) ) ( not ( = ?auto_390328 ?auto_390331 ) ) ( not ( = ?auto_390329 ?auto_390330 ) ) ( not ( = ?auto_390329 ?auto_390331 ) ) ( not ( = ?auto_390330 ?auto_390331 ) ) ( ON ?auto_390329 ?auto_390330 ) ( CLEAR ?auto_390327 ) ( ON ?auto_390328 ?auto_390329 ) ( CLEAR ?auto_390328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_390317 ?auto_390318 ?auto_390319 ?auto_390320 ?auto_390321 ?auto_390322 ?auto_390323 ?auto_390324 ?auto_390325 ?auto_390326 ?auto_390327 ?auto_390328 )
      ( MAKE-14PILE ?auto_390317 ?auto_390318 ?auto_390319 ?auto_390320 ?auto_390321 ?auto_390322 ?auto_390323 ?auto_390324 ?auto_390325 ?auto_390326 ?auto_390327 ?auto_390328 ?auto_390329 ?auto_390330 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390346 - BLOCK
      ?auto_390347 - BLOCK
      ?auto_390348 - BLOCK
      ?auto_390349 - BLOCK
      ?auto_390350 - BLOCK
      ?auto_390351 - BLOCK
      ?auto_390352 - BLOCK
      ?auto_390353 - BLOCK
      ?auto_390354 - BLOCK
      ?auto_390355 - BLOCK
      ?auto_390356 - BLOCK
      ?auto_390357 - BLOCK
      ?auto_390358 - BLOCK
      ?auto_390359 - BLOCK
    )
    :vars
    (
      ?auto_390360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390359 ?auto_390360 ) ( ON-TABLE ?auto_390346 ) ( ON ?auto_390347 ?auto_390346 ) ( ON ?auto_390348 ?auto_390347 ) ( ON ?auto_390349 ?auto_390348 ) ( ON ?auto_390350 ?auto_390349 ) ( ON ?auto_390351 ?auto_390350 ) ( ON ?auto_390352 ?auto_390351 ) ( ON ?auto_390353 ?auto_390352 ) ( ON ?auto_390354 ?auto_390353 ) ( ON ?auto_390355 ?auto_390354 ) ( not ( = ?auto_390346 ?auto_390347 ) ) ( not ( = ?auto_390346 ?auto_390348 ) ) ( not ( = ?auto_390346 ?auto_390349 ) ) ( not ( = ?auto_390346 ?auto_390350 ) ) ( not ( = ?auto_390346 ?auto_390351 ) ) ( not ( = ?auto_390346 ?auto_390352 ) ) ( not ( = ?auto_390346 ?auto_390353 ) ) ( not ( = ?auto_390346 ?auto_390354 ) ) ( not ( = ?auto_390346 ?auto_390355 ) ) ( not ( = ?auto_390346 ?auto_390356 ) ) ( not ( = ?auto_390346 ?auto_390357 ) ) ( not ( = ?auto_390346 ?auto_390358 ) ) ( not ( = ?auto_390346 ?auto_390359 ) ) ( not ( = ?auto_390346 ?auto_390360 ) ) ( not ( = ?auto_390347 ?auto_390348 ) ) ( not ( = ?auto_390347 ?auto_390349 ) ) ( not ( = ?auto_390347 ?auto_390350 ) ) ( not ( = ?auto_390347 ?auto_390351 ) ) ( not ( = ?auto_390347 ?auto_390352 ) ) ( not ( = ?auto_390347 ?auto_390353 ) ) ( not ( = ?auto_390347 ?auto_390354 ) ) ( not ( = ?auto_390347 ?auto_390355 ) ) ( not ( = ?auto_390347 ?auto_390356 ) ) ( not ( = ?auto_390347 ?auto_390357 ) ) ( not ( = ?auto_390347 ?auto_390358 ) ) ( not ( = ?auto_390347 ?auto_390359 ) ) ( not ( = ?auto_390347 ?auto_390360 ) ) ( not ( = ?auto_390348 ?auto_390349 ) ) ( not ( = ?auto_390348 ?auto_390350 ) ) ( not ( = ?auto_390348 ?auto_390351 ) ) ( not ( = ?auto_390348 ?auto_390352 ) ) ( not ( = ?auto_390348 ?auto_390353 ) ) ( not ( = ?auto_390348 ?auto_390354 ) ) ( not ( = ?auto_390348 ?auto_390355 ) ) ( not ( = ?auto_390348 ?auto_390356 ) ) ( not ( = ?auto_390348 ?auto_390357 ) ) ( not ( = ?auto_390348 ?auto_390358 ) ) ( not ( = ?auto_390348 ?auto_390359 ) ) ( not ( = ?auto_390348 ?auto_390360 ) ) ( not ( = ?auto_390349 ?auto_390350 ) ) ( not ( = ?auto_390349 ?auto_390351 ) ) ( not ( = ?auto_390349 ?auto_390352 ) ) ( not ( = ?auto_390349 ?auto_390353 ) ) ( not ( = ?auto_390349 ?auto_390354 ) ) ( not ( = ?auto_390349 ?auto_390355 ) ) ( not ( = ?auto_390349 ?auto_390356 ) ) ( not ( = ?auto_390349 ?auto_390357 ) ) ( not ( = ?auto_390349 ?auto_390358 ) ) ( not ( = ?auto_390349 ?auto_390359 ) ) ( not ( = ?auto_390349 ?auto_390360 ) ) ( not ( = ?auto_390350 ?auto_390351 ) ) ( not ( = ?auto_390350 ?auto_390352 ) ) ( not ( = ?auto_390350 ?auto_390353 ) ) ( not ( = ?auto_390350 ?auto_390354 ) ) ( not ( = ?auto_390350 ?auto_390355 ) ) ( not ( = ?auto_390350 ?auto_390356 ) ) ( not ( = ?auto_390350 ?auto_390357 ) ) ( not ( = ?auto_390350 ?auto_390358 ) ) ( not ( = ?auto_390350 ?auto_390359 ) ) ( not ( = ?auto_390350 ?auto_390360 ) ) ( not ( = ?auto_390351 ?auto_390352 ) ) ( not ( = ?auto_390351 ?auto_390353 ) ) ( not ( = ?auto_390351 ?auto_390354 ) ) ( not ( = ?auto_390351 ?auto_390355 ) ) ( not ( = ?auto_390351 ?auto_390356 ) ) ( not ( = ?auto_390351 ?auto_390357 ) ) ( not ( = ?auto_390351 ?auto_390358 ) ) ( not ( = ?auto_390351 ?auto_390359 ) ) ( not ( = ?auto_390351 ?auto_390360 ) ) ( not ( = ?auto_390352 ?auto_390353 ) ) ( not ( = ?auto_390352 ?auto_390354 ) ) ( not ( = ?auto_390352 ?auto_390355 ) ) ( not ( = ?auto_390352 ?auto_390356 ) ) ( not ( = ?auto_390352 ?auto_390357 ) ) ( not ( = ?auto_390352 ?auto_390358 ) ) ( not ( = ?auto_390352 ?auto_390359 ) ) ( not ( = ?auto_390352 ?auto_390360 ) ) ( not ( = ?auto_390353 ?auto_390354 ) ) ( not ( = ?auto_390353 ?auto_390355 ) ) ( not ( = ?auto_390353 ?auto_390356 ) ) ( not ( = ?auto_390353 ?auto_390357 ) ) ( not ( = ?auto_390353 ?auto_390358 ) ) ( not ( = ?auto_390353 ?auto_390359 ) ) ( not ( = ?auto_390353 ?auto_390360 ) ) ( not ( = ?auto_390354 ?auto_390355 ) ) ( not ( = ?auto_390354 ?auto_390356 ) ) ( not ( = ?auto_390354 ?auto_390357 ) ) ( not ( = ?auto_390354 ?auto_390358 ) ) ( not ( = ?auto_390354 ?auto_390359 ) ) ( not ( = ?auto_390354 ?auto_390360 ) ) ( not ( = ?auto_390355 ?auto_390356 ) ) ( not ( = ?auto_390355 ?auto_390357 ) ) ( not ( = ?auto_390355 ?auto_390358 ) ) ( not ( = ?auto_390355 ?auto_390359 ) ) ( not ( = ?auto_390355 ?auto_390360 ) ) ( not ( = ?auto_390356 ?auto_390357 ) ) ( not ( = ?auto_390356 ?auto_390358 ) ) ( not ( = ?auto_390356 ?auto_390359 ) ) ( not ( = ?auto_390356 ?auto_390360 ) ) ( not ( = ?auto_390357 ?auto_390358 ) ) ( not ( = ?auto_390357 ?auto_390359 ) ) ( not ( = ?auto_390357 ?auto_390360 ) ) ( not ( = ?auto_390358 ?auto_390359 ) ) ( not ( = ?auto_390358 ?auto_390360 ) ) ( not ( = ?auto_390359 ?auto_390360 ) ) ( ON ?auto_390358 ?auto_390359 ) ( ON ?auto_390357 ?auto_390358 ) ( CLEAR ?auto_390355 ) ( ON ?auto_390356 ?auto_390357 ) ( CLEAR ?auto_390356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_390346 ?auto_390347 ?auto_390348 ?auto_390349 ?auto_390350 ?auto_390351 ?auto_390352 ?auto_390353 ?auto_390354 ?auto_390355 ?auto_390356 )
      ( MAKE-14PILE ?auto_390346 ?auto_390347 ?auto_390348 ?auto_390349 ?auto_390350 ?auto_390351 ?auto_390352 ?auto_390353 ?auto_390354 ?auto_390355 ?auto_390356 ?auto_390357 ?auto_390358 ?auto_390359 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390375 - BLOCK
      ?auto_390376 - BLOCK
      ?auto_390377 - BLOCK
      ?auto_390378 - BLOCK
      ?auto_390379 - BLOCK
      ?auto_390380 - BLOCK
      ?auto_390381 - BLOCK
      ?auto_390382 - BLOCK
      ?auto_390383 - BLOCK
      ?auto_390384 - BLOCK
      ?auto_390385 - BLOCK
      ?auto_390386 - BLOCK
      ?auto_390387 - BLOCK
      ?auto_390388 - BLOCK
    )
    :vars
    (
      ?auto_390389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390388 ?auto_390389 ) ( ON-TABLE ?auto_390375 ) ( ON ?auto_390376 ?auto_390375 ) ( ON ?auto_390377 ?auto_390376 ) ( ON ?auto_390378 ?auto_390377 ) ( ON ?auto_390379 ?auto_390378 ) ( ON ?auto_390380 ?auto_390379 ) ( ON ?auto_390381 ?auto_390380 ) ( ON ?auto_390382 ?auto_390381 ) ( ON ?auto_390383 ?auto_390382 ) ( ON ?auto_390384 ?auto_390383 ) ( not ( = ?auto_390375 ?auto_390376 ) ) ( not ( = ?auto_390375 ?auto_390377 ) ) ( not ( = ?auto_390375 ?auto_390378 ) ) ( not ( = ?auto_390375 ?auto_390379 ) ) ( not ( = ?auto_390375 ?auto_390380 ) ) ( not ( = ?auto_390375 ?auto_390381 ) ) ( not ( = ?auto_390375 ?auto_390382 ) ) ( not ( = ?auto_390375 ?auto_390383 ) ) ( not ( = ?auto_390375 ?auto_390384 ) ) ( not ( = ?auto_390375 ?auto_390385 ) ) ( not ( = ?auto_390375 ?auto_390386 ) ) ( not ( = ?auto_390375 ?auto_390387 ) ) ( not ( = ?auto_390375 ?auto_390388 ) ) ( not ( = ?auto_390375 ?auto_390389 ) ) ( not ( = ?auto_390376 ?auto_390377 ) ) ( not ( = ?auto_390376 ?auto_390378 ) ) ( not ( = ?auto_390376 ?auto_390379 ) ) ( not ( = ?auto_390376 ?auto_390380 ) ) ( not ( = ?auto_390376 ?auto_390381 ) ) ( not ( = ?auto_390376 ?auto_390382 ) ) ( not ( = ?auto_390376 ?auto_390383 ) ) ( not ( = ?auto_390376 ?auto_390384 ) ) ( not ( = ?auto_390376 ?auto_390385 ) ) ( not ( = ?auto_390376 ?auto_390386 ) ) ( not ( = ?auto_390376 ?auto_390387 ) ) ( not ( = ?auto_390376 ?auto_390388 ) ) ( not ( = ?auto_390376 ?auto_390389 ) ) ( not ( = ?auto_390377 ?auto_390378 ) ) ( not ( = ?auto_390377 ?auto_390379 ) ) ( not ( = ?auto_390377 ?auto_390380 ) ) ( not ( = ?auto_390377 ?auto_390381 ) ) ( not ( = ?auto_390377 ?auto_390382 ) ) ( not ( = ?auto_390377 ?auto_390383 ) ) ( not ( = ?auto_390377 ?auto_390384 ) ) ( not ( = ?auto_390377 ?auto_390385 ) ) ( not ( = ?auto_390377 ?auto_390386 ) ) ( not ( = ?auto_390377 ?auto_390387 ) ) ( not ( = ?auto_390377 ?auto_390388 ) ) ( not ( = ?auto_390377 ?auto_390389 ) ) ( not ( = ?auto_390378 ?auto_390379 ) ) ( not ( = ?auto_390378 ?auto_390380 ) ) ( not ( = ?auto_390378 ?auto_390381 ) ) ( not ( = ?auto_390378 ?auto_390382 ) ) ( not ( = ?auto_390378 ?auto_390383 ) ) ( not ( = ?auto_390378 ?auto_390384 ) ) ( not ( = ?auto_390378 ?auto_390385 ) ) ( not ( = ?auto_390378 ?auto_390386 ) ) ( not ( = ?auto_390378 ?auto_390387 ) ) ( not ( = ?auto_390378 ?auto_390388 ) ) ( not ( = ?auto_390378 ?auto_390389 ) ) ( not ( = ?auto_390379 ?auto_390380 ) ) ( not ( = ?auto_390379 ?auto_390381 ) ) ( not ( = ?auto_390379 ?auto_390382 ) ) ( not ( = ?auto_390379 ?auto_390383 ) ) ( not ( = ?auto_390379 ?auto_390384 ) ) ( not ( = ?auto_390379 ?auto_390385 ) ) ( not ( = ?auto_390379 ?auto_390386 ) ) ( not ( = ?auto_390379 ?auto_390387 ) ) ( not ( = ?auto_390379 ?auto_390388 ) ) ( not ( = ?auto_390379 ?auto_390389 ) ) ( not ( = ?auto_390380 ?auto_390381 ) ) ( not ( = ?auto_390380 ?auto_390382 ) ) ( not ( = ?auto_390380 ?auto_390383 ) ) ( not ( = ?auto_390380 ?auto_390384 ) ) ( not ( = ?auto_390380 ?auto_390385 ) ) ( not ( = ?auto_390380 ?auto_390386 ) ) ( not ( = ?auto_390380 ?auto_390387 ) ) ( not ( = ?auto_390380 ?auto_390388 ) ) ( not ( = ?auto_390380 ?auto_390389 ) ) ( not ( = ?auto_390381 ?auto_390382 ) ) ( not ( = ?auto_390381 ?auto_390383 ) ) ( not ( = ?auto_390381 ?auto_390384 ) ) ( not ( = ?auto_390381 ?auto_390385 ) ) ( not ( = ?auto_390381 ?auto_390386 ) ) ( not ( = ?auto_390381 ?auto_390387 ) ) ( not ( = ?auto_390381 ?auto_390388 ) ) ( not ( = ?auto_390381 ?auto_390389 ) ) ( not ( = ?auto_390382 ?auto_390383 ) ) ( not ( = ?auto_390382 ?auto_390384 ) ) ( not ( = ?auto_390382 ?auto_390385 ) ) ( not ( = ?auto_390382 ?auto_390386 ) ) ( not ( = ?auto_390382 ?auto_390387 ) ) ( not ( = ?auto_390382 ?auto_390388 ) ) ( not ( = ?auto_390382 ?auto_390389 ) ) ( not ( = ?auto_390383 ?auto_390384 ) ) ( not ( = ?auto_390383 ?auto_390385 ) ) ( not ( = ?auto_390383 ?auto_390386 ) ) ( not ( = ?auto_390383 ?auto_390387 ) ) ( not ( = ?auto_390383 ?auto_390388 ) ) ( not ( = ?auto_390383 ?auto_390389 ) ) ( not ( = ?auto_390384 ?auto_390385 ) ) ( not ( = ?auto_390384 ?auto_390386 ) ) ( not ( = ?auto_390384 ?auto_390387 ) ) ( not ( = ?auto_390384 ?auto_390388 ) ) ( not ( = ?auto_390384 ?auto_390389 ) ) ( not ( = ?auto_390385 ?auto_390386 ) ) ( not ( = ?auto_390385 ?auto_390387 ) ) ( not ( = ?auto_390385 ?auto_390388 ) ) ( not ( = ?auto_390385 ?auto_390389 ) ) ( not ( = ?auto_390386 ?auto_390387 ) ) ( not ( = ?auto_390386 ?auto_390388 ) ) ( not ( = ?auto_390386 ?auto_390389 ) ) ( not ( = ?auto_390387 ?auto_390388 ) ) ( not ( = ?auto_390387 ?auto_390389 ) ) ( not ( = ?auto_390388 ?auto_390389 ) ) ( ON ?auto_390387 ?auto_390388 ) ( ON ?auto_390386 ?auto_390387 ) ( CLEAR ?auto_390384 ) ( ON ?auto_390385 ?auto_390386 ) ( CLEAR ?auto_390385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_390375 ?auto_390376 ?auto_390377 ?auto_390378 ?auto_390379 ?auto_390380 ?auto_390381 ?auto_390382 ?auto_390383 ?auto_390384 ?auto_390385 )
      ( MAKE-14PILE ?auto_390375 ?auto_390376 ?auto_390377 ?auto_390378 ?auto_390379 ?auto_390380 ?auto_390381 ?auto_390382 ?auto_390383 ?auto_390384 ?auto_390385 ?auto_390386 ?auto_390387 ?auto_390388 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390404 - BLOCK
      ?auto_390405 - BLOCK
      ?auto_390406 - BLOCK
      ?auto_390407 - BLOCK
      ?auto_390408 - BLOCK
      ?auto_390409 - BLOCK
      ?auto_390410 - BLOCK
      ?auto_390411 - BLOCK
      ?auto_390412 - BLOCK
      ?auto_390413 - BLOCK
      ?auto_390414 - BLOCK
      ?auto_390415 - BLOCK
      ?auto_390416 - BLOCK
      ?auto_390417 - BLOCK
    )
    :vars
    (
      ?auto_390418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390417 ?auto_390418 ) ( ON-TABLE ?auto_390404 ) ( ON ?auto_390405 ?auto_390404 ) ( ON ?auto_390406 ?auto_390405 ) ( ON ?auto_390407 ?auto_390406 ) ( ON ?auto_390408 ?auto_390407 ) ( ON ?auto_390409 ?auto_390408 ) ( ON ?auto_390410 ?auto_390409 ) ( ON ?auto_390411 ?auto_390410 ) ( ON ?auto_390412 ?auto_390411 ) ( not ( = ?auto_390404 ?auto_390405 ) ) ( not ( = ?auto_390404 ?auto_390406 ) ) ( not ( = ?auto_390404 ?auto_390407 ) ) ( not ( = ?auto_390404 ?auto_390408 ) ) ( not ( = ?auto_390404 ?auto_390409 ) ) ( not ( = ?auto_390404 ?auto_390410 ) ) ( not ( = ?auto_390404 ?auto_390411 ) ) ( not ( = ?auto_390404 ?auto_390412 ) ) ( not ( = ?auto_390404 ?auto_390413 ) ) ( not ( = ?auto_390404 ?auto_390414 ) ) ( not ( = ?auto_390404 ?auto_390415 ) ) ( not ( = ?auto_390404 ?auto_390416 ) ) ( not ( = ?auto_390404 ?auto_390417 ) ) ( not ( = ?auto_390404 ?auto_390418 ) ) ( not ( = ?auto_390405 ?auto_390406 ) ) ( not ( = ?auto_390405 ?auto_390407 ) ) ( not ( = ?auto_390405 ?auto_390408 ) ) ( not ( = ?auto_390405 ?auto_390409 ) ) ( not ( = ?auto_390405 ?auto_390410 ) ) ( not ( = ?auto_390405 ?auto_390411 ) ) ( not ( = ?auto_390405 ?auto_390412 ) ) ( not ( = ?auto_390405 ?auto_390413 ) ) ( not ( = ?auto_390405 ?auto_390414 ) ) ( not ( = ?auto_390405 ?auto_390415 ) ) ( not ( = ?auto_390405 ?auto_390416 ) ) ( not ( = ?auto_390405 ?auto_390417 ) ) ( not ( = ?auto_390405 ?auto_390418 ) ) ( not ( = ?auto_390406 ?auto_390407 ) ) ( not ( = ?auto_390406 ?auto_390408 ) ) ( not ( = ?auto_390406 ?auto_390409 ) ) ( not ( = ?auto_390406 ?auto_390410 ) ) ( not ( = ?auto_390406 ?auto_390411 ) ) ( not ( = ?auto_390406 ?auto_390412 ) ) ( not ( = ?auto_390406 ?auto_390413 ) ) ( not ( = ?auto_390406 ?auto_390414 ) ) ( not ( = ?auto_390406 ?auto_390415 ) ) ( not ( = ?auto_390406 ?auto_390416 ) ) ( not ( = ?auto_390406 ?auto_390417 ) ) ( not ( = ?auto_390406 ?auto_390418 ) ) ( not ( = ?auto_390407 ?auto_390408 ) ) ( not ( = ?auto_390407 ?auto_390409 ) ) ( not ( = ?auto_390407 ?auto_390410 ) ) ( not ( = ?auto_390407 ?auto_390411 ) ) ( not ( = ?auto_390407 ?auto_390412 ) ) ( not ( = ?auto_390407 ?auto_390413 ) ) ( not ( = ?auto_390407 ?auto_390414 ) ) ( not ( = ?auto_390407 ?auto_390415 ) ) ( not ( = ?auto_390407 ?auto_390416 ) ) ( not ( = ?auto_390407 ?auto_390417 ) ) ( not ( = ?auto_390407 ?auto_390418 ) ) ( not ( = ?auto_390408 ?auto_390409 ) ) ( not ( = ?auto_390408 ?auto_390410 ) ) ( not ( = ?auto_390408 ?auto_390411 ) ) ( not ( = ?auto_390408 ?auto_390412 ) ) ( not ( = ?auto_390408 ?auto_390413 ) ) ( not ( = ?auto_390408 ?auto_390414 ) ) ( not ( = ?auto_390408 ?auto_390415 ) ) ( not ( = ?auto_390408 ?auto_390416 ) ) ( not ( = ?auto_390408 ?auto_390417 ) ) ( not ( = ?auto_390408 ?auto_390418 ) ) ( not ( = ?auto_390409 ?auto_390410 ) ) ( not ( = ?auto_390409 ?auto_390411 ) ) ( not ( = ?auto_390409 ?auto_390412 ) ) ( not ( = ?auto_390409 ?auto_390413 ) ) ( not ( = ?auto_390409 ?auto_390414 ) ) ( not ( = ?auto_390409 ?auto_390415 ) ) ( not ( = ?auto_390409 ?auto_390416 ) ) ( not ( = ?auto_390409 ?auto_390417 ) ) ( not ( = ?auto_390409 ?auto_390418 ) ) ( not ( = ?auto_390410 ?auto_390411 ) ) ( not ( = ?auto_390410 ?auto_390412 ) ) ( not ( = ?auto_390410 ?auto_390413 ) ) ( not ( = ?auto_390410 ?auto_390414 ) ) ( not ( = ?auto_390410 ?auto_390415 ) ) ( not ( = ?auto_390410 ?auto_390416 ) ) ( not ( = ?auto_390410 ?auto_390417 ) ) ( not ( = ?auto_390410 ?auto_390418 ) ) ( not ( = ?auto_390411 ?auto_390412 ) ) ( not ( = ?auto_390411 ?auto_390413 ) ) ( not ( = ?auto_390411 ?auto_390414 ) ) ( not ( = ?auto_390411 ?auto_390415 ) ) ( not ( = ?auto_390411 ?auto_390416 ) ) ( not ( = ?auto_390411 ?auto_390417 ) ) ( not ( = ?auto_390411 ?auto_390418 ) ) ( not ( = ?auto_390412 ?auto_390413 ) ) ( not ( = ?auto_390412 ?auto_390414 ) ) ( not ( = ?auto_390412 ?auto_390415 ) ) ( not ( = ?auto_390412 ?auto_390416 ) ) ( not ( = ?auto_390412 ?auto_390417 ) ) ( not ( = ?auto_390412 ?auto_390418 ) ) ( not ( = ?auto_390413 ?auto_390414 ) ) ( not ( = ?auto_390413 ?auto_390415 ) ) ( not ( = ?auto_390413 ?auto_390416 ) ) ( not ( = ?auto_390413 ?auto_390417 ) ) ( not ( = ?auto_390413 ?auto_390418 ) ) ( not ( = ?auto_390414 ?auto_390415 ) ) ( not ( = ?auto_390414 ?auto_390416 ) ) ( not ( = ?auto_390414 ?auto_390417 ) ) ( not ( = ?auto_390414 ?auto_390418 ) ) ( not ( = ?auto_390415 ?auto_390416 ) ) ( not ( = ?auto_390415 ?auto_390417 ) ) ( not ( = ?auto_390415 ?auto_390418 ) ) ( not ( = ?auto_390416 ?auto_390417 ) ) ( not ( = ?auto_390416 ?auto_390418 ) ) ( not ( = ?auto_390417 ?auto_390418 ) ) ( ON ?auto_390416 ?auto_390417 ) ( ON ?auto_390415 ?auto_390416 ) ( ON ?auto_390414 ?auto_390415 ) ( CLEAR ?auto_390412 ) ( ON ?auto_390413 ?auto_390414 ) ( CLEAR ?auto_390413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_390404 ?auto_390405 ?auto_390406 ?auto_390407 ?auto_390408 ?auto_390409 ?auto_390410 ?auto_390411 ?auto_390412 ?auto_390413 )
      ( MAKE-14PILE ?auto_390404 ?auto_390405 ?auto_390406 ?auto_390407 ?auto_390408 ?auto_390409 ?auto_390410 ?auto_390411 ?auto_390412 ?auto_390413 ?auto_390414 ?auto_390415 ?auto_390416 ?auto_390417 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390433 - BLOCK
      ?auto_390434 - BLOCK
      ?auto_390435 - BLOCK
      ?auto_390436 - BLOCK
      ?auto_390437 - BLOCK
      ?auto_390438 - BLOCK
      ?auto_390439 - BLOCK
      ?auto_390440 - BLOCK
      ?auto_390441 - BLOCK
      ?auto_390442 - BLOCK
      ?auto_390443 - BLOCK
      ?auto_390444 - BLOCK
      ?auto_390445 - BLOCK
      ?auto_390446 - BLOCK
    )
    :vars
    (
      ?auto_390447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390446 ?auto_390447 ) ( ON-TABLE ?auto_390433 ) ( ON ?auto_390434 ?auto_390433 ) ( ON ?auto_390435 ?auto_390434 ) ( ON ?auto_390436 ?auto_390435 ) ( ON ?auto_390437 ?auto_390436 ) ( ON ?auto_390438 ?auto_390437 ) ( ON ?auto_390439 ?auto_390438 ) ( ON ?auto_390440 ?auto_390439 ) ( ON ?auto_390441 ?auto_390440 ) ( not ( = ?auto_390433 ?auto_390434 ) ) ( not ( = ?auto_390433 ?auto_390435 ) ) ( not ( = ?auto_390433 ?auto_390436 ) ) ( not ( = ?auto_390433 ?auto_390437 ) ) ( not ( = ?auto_390433 ?auto_390438 ) ) ( not ( = ?auto_390433 ?auto_390439 ) ) ( not ( = ?auto_390433 ?auto_390440 ) ) ( not ( = ?auto_390433 ?auto_390441 ) ) ( not ( = ?auto_390433 ?auto_390442 ) ) ( not ( = ?auto_390433 ?auto_390443 ) ) ( not ( = ?auto_390433 ?auto_390444 ) ) ( not ( = ?auto_390433 ?auto_390445 ) ) ( not ( = ?auto_390433 ?auto_390446 ) ) ( not ( = ?auto_390433 ?auto_390447 ) ) ( not ( = ?auto_390434 ?auto_390435 ) ) ( not ( = ?auto_390434 ?auto_390436 ) ) ( not ( = ?auto_390434 ?auto_390437 ) ) ( not ( = ?auto_390434 ?auto_390438 ) ) ( not ( = ?auto_390434 ?auto_390439 ) ) ( not ( = ?auto_390434 ?auto_390440 ) ) ( not ( = ?auto_390434 ?auto_390441 ) ) ( not ( = ?auto_390434 ?auto_390442 ) ) ( not ( = ?auto_390434 ?auto_390443 ) ) ( not ( = ?auto_390434 ?auto_390444 ) ) ( not ( = ?auto_390434 ?auto_390445 ) ) ( not ( = ?auto_390434 ?auto_390446 ) ) ( not ( = ?auto_390434 ?auto_390447 ) ) ( not ( = ?auto_390435 ?auto_390436 ) ) ( not ( = ?auto_390435 ?auto_390437 ) ) ( not ( = ?auto_390435 ?auto_390438 ) ) ( not ( = ?auto_390435 ?auto_390439 ) ) ( not ( = ?auto_390435 ?auto_390440 ) ) ( not ( = ?auto_390435 ?auto_390441 ) ) ( not ( = ?auto_390435 ?auto_390442 ) ) ( not ( = ?auto_390435 ?auto_390443 ) ) ( not ( = ?auto_390435 ?auto_390444 ) ) ( not ( = ?auto_390435 ?auto_390445 ) ) ( not ( = ?auto_390435 ?auto_390446 ) ) ( not ( = ?auto_390435 ?auto_390447 ) ) ( not ( = ?auto_390436 ?auto_390437 ) ) ( not ( = ?auto_390436 ?auto_390438 ) ) ( not ( = ?auto_390436 ?auto_390439 ) ) ( not ( = ?auto_390436 ?auto_390440 ) ) ( not ( = ?auto_390436 ?auto_390441 ) ) ( not ( = ?auto_390436 ?auto_390442 ) ) ( not ( = ?auto_390436 ?auto_390443 ) ) ( not ( = ?auto_390436 ?auto_390444 ) ) ( not ( = ?auto_390436 ?auto_390445 ) ) ( not ( = ?auto_390436 ?auto_390446 ) ) ( not ( = ?auto_390436 ?auto_390447 ) ) ( not ( = ?auto_390437 ?auto_390438 ) ) ( not ( = ?auto_390437 ?auto_390439 ) ) ( not ( = ?auto_390437 ?auto_390440 ) ) ( not ( = ?auto_390437 ?auto_390441 ) ) ( not ( = ?auto_390437 ?auto_390442 ) ) ( not ( = ?auto_390437 ?auto_390443 ) ) ( not ( = ?auto_390437 ?auto_390444 ) ) ( not ( = ?auto_390437 ?auto_390445 ) ) ( not ( = ?auto_390437 ?auto_390446 ) ) ( not ( = ?auto_390437 ?auto_390447 ) ) ( not ( = ?auto_390438 ?auto_390439 ) ) ( not ( = ?auto_390438 ?auto_390440 ) ) ( not ( = ?auto_390438 ?auto_390441 ) ) ( not ( = ?auto_390438 ?auto_390442 ) ) ( not ( = ?auto_390438 ?auto_390443 ) ) ( not ( = ?auto_390438 ?auto_390444 ) ) ( not ( = ?auto_390438 ?auto_390445 ) ) ( not ( = ?auto_390438 ?auto_390446 ) ) ( not ( = ?auto_390438 ?auto_390447 ) ) ( not ( = ?auto_390439 ?auto_390440 ) ) ( not ( = ?auto_390439 ?auto_390441 ) ) ( not ( = ?auto_390439 ?auto_390442 ) ) ( not ( = ?auto_390439 ?auto_390443 ) ) ( not ( = ?auto_390439 ?auto_390444 ) ) ( not ( = ?auto_390439 ?auto_390445 ) ) ( not ( = ?auto_390439 ?auto_390446 ) ) ( not ( = ?auto_390439 ?auto_390447 ) ) ( not ( = ?auto_390440 ?auto_390441 ) ) ( not ( = ?auto_390440 ?auto_390442 ) ) ( not ( = ?auto_390440 ?auto_390443 ) ) ( not ( = ?auto_390440 ?auto_390444 ) ) ( not ( = ?auto_390440 ?auto_390445 ) ) ( not ( = ?auto_390440 ?auto_390446 ) ) ( not ( = ?auto_390440 ?auto_390447 ) ) ( not ( = ?auto_390441 ?auto_390442 ) ) ( not ( = ?auto_390441 ?auto_390443 ) ) ( not ( = ?auto_390441 ?auto_390444 ) ) ( not ( = ?auto_390441 ?auto_390445 ) ) ( not ( = ?auto_390441 ?auto_390446 ) ) ( not ( = ?auto_390441 ?auto_390447 ) ) ( not ( = ?auto_390442 ?auto_390443 ) ) ( not ( = ?auto_390442 ?auto_390444 ) ) ( not ( = ?auto_390442 ?auto_390445 ) ) ( not ( = ?auto_390442 ?auto_390446 ) ) ( not ( = ?auto_390442 ?auto_390447 ) ) ( not ( = ?auto_390443 ?auto_390444 ) ) ( not ( = ?auto_390443 ?auto_390445 ) ) ( not ( = ?auto_390443 ?auto_390446 ) ) ( not ( = ?auto_390443 ?auto_390447 ) ) ( not ( = ?auto_390444 ?auto_390445 ) ) ( not ( = ?auto_390444 ?auto_390446 ) ) ( not ( = ?auto_390444 ?auto_390447 ) ) ( not ( = ?auto_390445 ?auto_390446 ) ) ( not ( = ?auto_390445 ?auto_390447 ) ) ( not ( = ?auto_390446 ?auto_390447 ) ) ( ON ?auto_390445 ?auto_390446 ) ( ON ?auto_390444 ?auto_390445 ) ( ON ?auto_390443 ?auto_390444 ) ( CLEAR ?auto_390441 ) ( ON ?auto_390442 ?auto_390443 ) ( CLEAR ?auto_390442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_390433 ?auto_390434 ?auto_390435 ?auto_390436 ?auto_390437 ?auto_390438 ?auto_390439 ?auto_390440 ?auto_390441 ?auto_390442 )
      ( MAKE-14PILE ?auto_390433 ?auto_390434 ?auto_390435 ?auto_390436 ?auto_390437 ?auto_390438 ?auto_390439 ?auto_390440 ?auto_390441 ?auto_390442 ?auto_390443 ?auto_390444 ?auto_390445 ?auto_390446 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390462 - BLOCK
      ?auto_390463 - BLOCK
      ?auto_390464 - BLOCK
      ?auto_390465 - BLOCK
      ?auto_390466 - BLOCK
      ?auto_390467 - BLOCK
      ?auto_390468 - BLOCK
      ?auto_390469 - BLOCK
      ?auto_390470 - BLOCK
      ?auto_390471 - BLOCK
      ?auto_390472 - BLOCK
      ?auto_390473 - BLOCK
      ?auto_390474 - BLOCK
      ?auto_390475 - BLOCK
    )
    :vars
    (
      ?auto_390476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390475 ?auto_390476 ) ( ON-TABLE ?auto_390462 ) ( ON ?auto_390463 ?auto_390462 ) ( ON ?auto_390464 ?auto_390463 ) ( ON ?auto_390465 ?auto_390464 ) ( ON ?auto_390466 ?auto_390465 ) ( ON ?auto_390467 ?auto_390466 ) ( ON ?auto_390468 ?auto_390467 ) ( ON ?auto_390469 ?auto_390468 ) ( not ( = ?auto_390462 ?auto_390463 ) ) ( not ( = ?auto_390462 ?auto_390464 ) ) ( not ( = ?auto_390462 ?auto_390465 ) ) ( not ( = ?auto_390462 ?auto_390466 ) ) ( not ( = ?auto_390462 ?auto_390467 ) ) ( not ( = ?auto_390462 ?auto_390468 ) ) ( not ( = ?auto_390462 ?auto_390469 ) ) ( not ( = ?auto_390462 ?auto_390470 ) ) ( not ( = ?auto_390462 ?auto_390471 ) ) ( not ( = ?auto_390462 ?auto_390472 ) ) ( not ( = ?auto_390462 ?auto_390473 ) ) ( not ( = ?auto_390462 ?auto_390474 ) ) ( not ( = ?auto_390462 ?auto_390475 ) ) ( not ( = ?auto_390462 ?auto_390476 ) ) ( not ( = ?auto_390463 ?auto_390464 ) ) ( not ( = ?auto_390463 ?auto_390465 ) ) ( not ( = ?auto_390463 ?auto_390466 ) ) ( not ( = ?auto_390463 ?auto_390467 ) ) ( not ( = ?auto_390463 ?auto_390468 ) ) ( not ( = ?auto_390463 ?auto_390469 ) ) ( not ( = ?auto_390463 ?auto_390470 ) ) ( not ( = ?auto_390463 ?auto_390471 ) ) ( not ( = ?auto_390463 ?auto_390472 ) ) ( not ( = ?auto_390463 ?auto_390473 ) ) ( not ( = ?auto_390463 ?auto_390474 ) ) ( not ( = ?auto_390463 ?auto_390475 ) ) ( not ( = ?auto_390463 ?auto_390476 ) ) ( not ( = ?auto_390464 ?auto_390465 ) ) ( not ( = ?auto_390464 ?auto_390466 ) ) ( not ( = ?auto_390464 ?auto_390467 ) ) ( not ( = ?auto_390464 ?auto_390468 ) ) ( not ( = ?auto_390464 ?auto_390469 ) ) ( not ( = ?auto_390464 ?auto_390470 ) ) ( not ( = ?auto_390464 ?auto_390471 ) ) ( not ( = ?auto_390464 ?auto_390472 ) ) ( not ( = ?auto_390464 ?auto_390473 ) ) ( not ( = ?auto_390464 ?auto_390474 ) ) ( not ( = ?auto_390464 ?auto_390475 ) ) ( not ( = ?auto_390464 ?auto_390476 ) ) ( not ( = ?auto_390465 ?auto_390466 ) ) ( not ( = ?auto_390465 ?auto_390467 ) ) ( not ( = ?auto_390465 ?auto_390468 ) ) ( not ( = ?auto_390465 ?auto_390469 ) ) ( not ( = ?auto_390465 ?auto_390470 ) ) ( not ( = ?auto_390465 ?auto_390471 ) ) ( not ( = ?auto_390465 ?auto_390472 ) ) ( not ( = ?auto_390465 ?auto_390473 ) ) ( not ( = ?auto_390465 ?auto_390474 ) ) ( not ( = ?auto_390465 ?auto_390475 ) ) ( not ( = ?auto_390465 ?auto_390476 ) ) ( not ( = ?auto_390466 ?auto_390467 ) ) ( not ( = ?auto_390466 ?auto_390468 ) ) ( not ( = ?auto_390466 ?auto_390469 ) ) ( not ( = ?auto_390466 ?auto_390470 ) ) ( not ( = ?auto_390466 ?auto_390471 ) ) ( not ( = ?auto_390466 ?auto_390472 ) ) ( not ( = ?auto_390466 ?auto_390473 ) ) ( not ( = ?auto_390466 ?auto_390474 ) ) ( not ( = ?auto_390466 ?auto_390475 ) ) ( not ( = ?auto_390466 ?auto_390476 ) ) ( not ( = ?auto_390467 ?auto_390468 ) ) ( not ( = ?auto_390467 ?auto_390469 ) ) ( not ( = ?auto_390467 ?auto_390470 ) ) ( not ( = ?auto_390467 ?auto_390471 ) ) ( not ( = ?auto_390467 ?auto_390472 ) ) ( not ( = ?auto_390467 ?auto_390473 ) ) ( not ( = ?auto_390467 ?auto_390474 ) ) ( not ( = ?auto_390467 ?auto_390475 ) ) ( not ( = ?auto_390467 ?auto_390476 ) ) ( not ( = ?auto_390468 ?auto_390469 ) ) ( not ( = ?auto_390468 ?auto_390470 ) ) ( not ( = ?auto_390468 ?auto_390471 ) ) ( not ( = ?auto_390468 ?auto_390472 ) ) ( not ( = ?auto_390468 ?auto_390473 ) ) ( not ( = ?auto_390468 ?auto_390474 ) ) ( not ( = ?auto_390468 ?auto_390475 ) ) ( not ( = ?auto_390468 ?auto_390476 ) ) ( not ( = ?auto_390469 ?auto_390470 ) ) ( not ( = ?auto_390469 ?auto_390471 ) ) ( not ( = ?auto_390469 ?auto_390472 ) ) ( not ( = ?auto_390469 ?auto_390473 ) ) ( not ( = ?auto_390469 ?auto_390474 ) ) ( not ( = ?auto_390469 ?auto_390475 ) ) ( not ( = ?auto_390469 ?auto_390476 ) ) ( not ( = ?auto_390470 ?auto_390471 ) ) ( not ( = ?auto_390470 ?auto_390472 ) ) ( not ( = ?auto_390470 ?auto_390473 ) ) ( not ( = ?auto_390470 ?auto_390474 ) ) ( not ( = ?auto_390470 ?auto_390475 ) ) ( not ( = ?auto_390470 ?auto_390476 ) ) ( not ( = ?auto_390471 ?auto_390472 ) ) ( not ( = ?auto_390471 ?auto_390473 ) ) ( not ( = ?auto_390471 ?auto_390474 ) ) ( not ( = ?auto_390471 ?auto_390475 ) ) ( not ( = ?auto_390471 ?auto_390476 ) ) ( not ( = ?auto_390472 ?auto_390473 ) ) ( not ( = ?auto_390472 ?auto_390474 ) ) ( not ( = ?auto_390472 ?auto_390475 ) ) ( not ( = ?auto_390472 ?auto_390476 ) ) ( not ( = ?auto_390473 ?auto_390474 ) ) ( not ( = ?auto_390473 ?auto_390475 ) ) ( not ( = ?auto_390473 ?auto_390476 ) ) ( not ( = ?auto_390474 ?auto_390475 ) ) ( not ( = ?auto_390474 ?auto_390476 ) ) ( not ( = ?auto_390475 ?auto_390476 ) ) ( ON ?auto_390474 ?auto_390475 ) ( ON ?auto_390473 ?auto_390474 ) ( ON ?auto_390472 ?auto_390473 ) ( ON ?auto_390471 ?auto_390472 ) ( CLEAR ?auto_390469 ) ( ON ?auto_390470 ?auto_390471 ) ( CLEAR ?auto_390470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_390462 ?auto_390463 ?auto_390464 ?auto_390465 ?auto_390466 ?auto_390467 ?auto_390468 ?auto_390469 ?auto_390470 )
      ( MAKE-14PILE ?auto_390462 ?auto_390463 ?auto_390464 ?auto_390465 ?auto_390466 ?auto_390467 ?auto_390468 ?auto_390469 ?auto_390470 ?auto_390471 ?auto_390472 ?auto_390473 ?auto_390474 ?auto_390475 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390491 - BLOCK
      ?auto_390492 - BLOCK
      ?auto_390493 - BLOCK
      ?auto_390494 - BLOCK
      ?auto_390495 - BLOCK
      ?auto_390496 - BLOCK
      ?auto_390497 - BLOCK
      ?auto_390498 - BLOCK
      ?auto_390499 - BLOCK
      ?auto_390500 - BLOCK
      ?auto_390501 - BLOCK
      ?auto_390502 - BLOCK
      ?auto_390503 - BLOCK
      ?auto_390504 - BLOCK
    )
    :vars
    (
      ?auto_390505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390504 ?auto_390505 ) ( ON-TABLE ?auto_390491 ) ( ON ?auto_390492 ?auto_390491 ) ( ON ?auto_390493 ?auto_390492 ) ( ON ?auto_390494 ?auto_390493 ) ( ON ?auto_390495 ?auto_390494 ) ( ON ?auto_390496 ?auto_390495 ) ( ON ?auto_390497 ?auto_390496 ) ( ON ?auto_390498 ?auto_390497 ) ( not ( = ?auto_390491 ?auto_390492 ) ) ( not ( = ?auto_390491 ?auto_390493 ) ) ( not ( = ?auto_390491 ?auto_390494 ) ) ( not ( = ?auto_390491 ?auto_390495 ) ) ( not ( = ?auto_390491 ?auto_390496 ) ) ( not ( = ?auto_390491 ?auto_390497 ) ) ( not ( = ?auto_390491 ?auto_390498 ) ) ( not ( = ?auto_390491 ?auto_390499 ) ) ( not ( = ?auto_390491 ?auto_390500 ) ) ( not ( = ?auto_390491 ?auto_390501 ) ) ( not ( = ?auto_390491 ?auto_390502 ) ) ( not ( = ?auto_390491 ?auto_390503 ) ) ( not ( = ?auto_390491 ?auto_390504 ) ) ( not ( = ?auto_390491 ?auto_390505 ) ) ( not ( = ?auto_390492 ?auto_390493 ) ) ( not ( = ?auto_390492 ?auto_390494 ) ) ( not ( = ?auto_390492 ?auto_390495 ) ) ( not ( = ?auto_390492 ?auto_390496 ) ) ( not ( = ?auto_390492 ?auto_390497 ) ) ( not ( = ?auto_390492 ?auto_390498 ) ) ( not ( = ?auto_390492 ?auto_390499 ) ) ( not ( = ?auto_390492 ?auto_390500 ) ) ( not ( = ?auto_390492 ?auto_390501 ) ) ( not ( = ?auto_390492 ?auto_390502 ) ) ( not ( = ?auto_390492 ?auto_390503 ) ) ( not ( = ?auto_390492 ?auto_390504 ) ) ( not ( = ?auto_390492 ?auto_390505 ) ) ( not ( = ?auto_390493 ?auto_390494 ) ) ( not ( = ?auto_390493 ?auto_390495 ) ) ( not ( = ?auto_390493 ?auto_390496 ) ) ( not ( = ?auto_390493 ?auto_390497 ) ) ( not ( = ?auto_390493 ?auto_390498 ) ) ( not ( = ?auto_390493 ?auto_390499 ) ) ( not ( = ?auto_390493 ?auto_390500 ) ) ( not ( = ?auto_390493 ?auto_390501 ) ) ( not ( = ?auto_390493 ?auto_390502 ) ) ( not ( = ?auto_390493 ?auto_390503 ) ) ( not ( = ?auto_390493 ?auto_390504 ) ) ( not ( = ?auto_390493 ?auto_390505 ) ) ( not ( = ?auto_390494 ?auto_390495 ) ) ( not ( = ?auto_390494 ?auto_390496 ) ) ( not ( = ?auto_390494 ?auto_390497 ) ) ( not ( = ?auto_390494 ?auto_390498 ) ) ( not ( = ?auto_390494 ?auto_390499 ) ) ( not ( = ?auto_390494 ?auto_390500 ) ) ( not ( = ?auto_390494 ?auto_390501 ) ) ( not ( = ?auto_390494 ?auto_390502 ) ) ( not ( = ?auto_390494 ?auto_390503 ) ) ( not ( = ?auto_390494 ?auto_390504 ) ) ( not ( = ?auto_390494 ?auto_390505 ) ) ( not ( = ?auto_390495 ?auto_390496 ) ) ( not ( = ?auto_390495 ?auto_390497 ) ) ( not ( = ?auto_390495 ?auto_390498 ) ) ( not ( = ?auto_390495 ?auto_390499 ) ) ( not ( = ?auto_390495 ?auto_390500 ) ) ( not ( = ?auto_390495 ?auto_390501 ) ) ( not ( = ?auto_390495 ?auto_390502 ) ) ( not ( = ?auto_390495 ?auto_390503 ) ) ( not ( = ?auto_390495 ?auto_390504 ) ) ( not ( = ?auto_390495 ?auto_390505 ) ) ( not ( = ?auto_390496 ?auto_390497 ) ) ( not ( = ?auto_390496 ?auto_390498 ) ) ( not ( = ?auto_390496 ?auto_390499 ) ) ( not ( = ?auto_390496 ?auto_390500 ) ) ( not ( = ?auto_390496 ?auto_390501 ) ) ( not ( = ?auto_390496 ?auto_390502 ) ) ( not ( = ?auto_390496 ?auto_390503 ) ) ( not ( = ?auto_390496 ?auto_390504 ) ) ( not ( = ?auto_390496 ?auto_390505 ) ) ( not ( = ?auto_390497 ?auto_390498 ) ) ( not ( = ?auto_390497 ?auto_390499 ) ) ( not ( = ?auto_390497 ?auto_390500 ) ) ( not ( = ?auto_390497 ?auto_390501 ) ) ( not ( = ?auto_390497 ?auto_390502 ) ) ( not ( = ?auto_390497 ?auto_390503 ) ) ( not ( = ?auto_390497 ?auto_390504 ) ) ( not ( = ?auto_390497 ?auto_390505 ) ) ( not ( = ?auto_390498 ?auto_390499 ) ) ( not ( = ?auto_390498 ?auto_390500 ) ) ( not ( = ?auto_390498 ?auto_390501 ) ) ( not ( = ?auto_390498 ?auto_390502 ) ) ( not ( = ?auto_390498 ?auto_390503 ) ) ( not ( = ?auto_390498 ?auto_390504 ) ) ( not ( = ?auto_390498 ?auto_390505 ) ) ( not ( = ?auto_390499 ?auto_390500 ) ) ( not ( = ?auto_390499 ?auto_390501 ) ) ( not ( = ?auto_390499 ?auto_390502 ) ) ( not ( = ?auto_390499 ?auto_390503 ) ) ( not ( = ?auto_390499 ?auto_390504 ) ) ( not ( = ?auto_390499 ?auto_390505 ) ) ( not ( = ?auto_390500 ?auto_390501 ) ) ( not ( = ?auto_390500 ?auto_390502 ) ) ( not ( = ?auto_390500 ?auto_390503 ) ) ( not ( = ?auto_390500 ?auto_390504 ) ) ( not ( = ?auto_390500 ?auto_390505 ) ) ( not ( = ?auto_390501 ?auto_390502 ) ) ( not ( = ?auto_390501 ?auto_390503 ) ) ( not ( = ?auto_390501 ?auto_390504 ) ) ( not ( = ?auto_390501 ?auto_390505 ) ) ( not ( = ?auto_390502 ?auto_390503 ) ) ( not ( = ?auto_390502 ?auto_390504 ) ) ( not ( = ?auto_390502 ?auto_390505 ) ) ( not ( = ?auto_390503 ?auto_390504 ) ) ( not ( = ?auto_390503 ?auto_390505 ) ) ( not ( = ?auto_390504 ?auto_390505 ) ) ( ON ?auto_390503 ?auto_390504 ) ( ON ?auto_390502 ?auto_390503 ) ( ON ?auto_390501 ?auto_390502 ) ( ON ?auto_390500 ?auto_390501 ) ( CLEAR ?auto_390498 ) ( ON ?auto_390499 ?auto_390500 ) ( CLEAR ?auto_390499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_390491 ?auto_390492 ?auto_390493 ?auto_390494 ?auto_390495 ?auto_390496 ?auto_390497 ?auto_390498 ?auto_390499 )
      ( MAKE-14PILE ?auto_390491 ?auto_390492 ?auto_390493 ?auto_390494 ?auto_390495 ?auto_390496 ?auto_390497 ?auto_390498 ?auto_390499 ?auto_390500 ?auto_390501 ?auto_390502 ?auto_390503 ?auto_390504 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390520 - BLOCK
      ?auto_390521 - BLOCK
      ?auto_390522 - BLOCK
      ?auto_390523 - BLOCK
      ?auto_390524 - BLOCK
      ?auto_390525 - BLOCK
      ?auto_390526 - BLOCK
      ?auto_390527 - BLOCK
      ?auto_390528 - BLOCK
      ?auto_390529 - BLOCK
      ?auto_390530 - BLOCK
      ?auto_390531 - BLOCK
      ?auto_390532 - BLOCK
      ?auto_390533 - BLOCK
    )
    :vars
    (
      ?auto_390534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390533 ?auto_390534 ) ( ON-TABLE ?auto_390520 ) ( ON ?auto_390521 ?auto_390520 ) ( ON ?auto_390522 ?auto_390521 ) ( ON ?auto_390523 ?auto_390522 ) ( ON ?auto_390524 ?auto_390523 ) ( ON ?auto_390525 ?auto_390524 ) ( ON ?auto_390526 ?auto_390525 ) ( not ( = ?auto_390520 ?auto_390521 ) ) ( not ( = ?auto_390520 ?auto_390522 ) ) ( not ( = ?auto_390520 ?auto_390523 ) ) ( not ( = ?auto_390520 ?auto_390524 ) ) ( not ( = ?auto_390520 ?auto_390525 ) ) ( not ( = ?auto_390520 ?auto_390526 ) ) ( not ( = ?auto_390520 ?auto_390527 ) ) ( not ( = ?auto_390520 ?auto_390528 ) ) ( not ( = ?auto_390520 ?auto_390529 ) ) ( not ( = ?auto_390520 ?auto_390530 ) ) ( not ( = ?auto_390520 ?auto_390531 ) ) ( not ( = ?auto_390520 ?auto_390532 ) ) ( not ( = ?auto_390520 ?auto_390533 ) ) ( not ( = ?auto_390520 ?auto_390534 ) ) ( not ( = ?auto_390521 ?auto_390522 ) ) ( not ( = ?auto_390521 ?auto_390523 ) ) ( not ( = ?auto_390521 ?auto_390524 ) ) ( not ( = ?auto_390521 ?auto_390525 ) ) ( not ( = ?auto_390521 ?auto_390526 ) ) ( not ( = ?auto_390521 ?auto_390527 ) ) ( not ( = ?auto_390521 ?auto_390528 ) ) ( not ( = ?auto_390521 ?auto_390529 ) ) ( not ( = ?auto_390521 ?auto_390530 ) ) ( not ( = ?auto_390521 ?auto_390531 ) ) ( not ( = ?auto_390521 ?auto_390532 ) ) ( not ( = ?auto_390521 ?auto_390533 ) ) ( not ( = ?auto_390521 ?auto_390534 ) ) ( not ( = ?auto_390522 ?auto_390523 ) ) ( not ( = ?auto_390522 ?auto_390524 ) ) ( not ( = ?auto_390522 ?auto_390525 ) ) ( not ( = ?auto_390522 ?auto_390526 ) ) ( not ( = ?auto_390522 ?auto_390527 ) ) ( not ( = ?auto_390522 ?auto_390528 ) ) ( not ( = ?auto_390522 ?auto_390529 ) ) ( not ( = ?auto_390522 ?auto_390530 ) ) ( not ( = ?auto_390522 ?auto_390531 ) ) ( not ( = ?auto_390522 ?auto_390532 ) ) ( not ( = ?auto_390522 ?auto_390533 ) ) ( not ( = ?auto_390522 ?auto_390534 ) ) ( not ( = ?auto_390523 ?auto_390524 ) ) ( not ( = ?auto_390523 ?auto_390525 ) ) ( not ( = ?auto_390523 ?auto_390526 ) ) ( not ( = ?auto_390523 ?auto_390527 ) ) ( not ( = ?auto_390523 ?auto_390528 ) ) ( not ( = ?auto_390523 ?auto_390529 ) ) ( not ( = ?auto_390523 ?auto_390530 ) ) ( not ( = ?auto_390523 ?auto_390531 ) ) ( not ( = ?auto_390523 ?auto_390532 ) ) ( not ( = ?auto_390523 ?auto_390533 ) ) ( not ( = ?auto_390523 ?auto_390534 ) ) ( not ( = ?auto_390524 ?auto_390525 ) ) ( not ( = ?auto_390524 ?auto_390526 ) ) ( not ( = ?auto_390524 ?auto_390527 ) ) ( not ( = ?auto_390524 ?auto_390528 ) ) ( not ( = ?auto_390524 ?auto_390529 ) ) ( not ( = ?auto_390524 ?auto_390530 ) ) ( not ( = ?auto_390524 ?auto_390531 ) ) ( not ( = ?auto_390524 ?auto_390532 ) ) ( not ( = ?auto_390524 ?auto_390533 ) ) ( not ( = ?auto_390524 ?auto_390534 ) ) ( not ( = ?auto_390525 ?auto_390526 ) ) ( not ( = ?auto_390525 ?auto_390527 ) ) ( not ( = ?auto_390525 ?auto_390528 ) ) ( not ( = ?auto_390525 ?auto_390529 ) ) ( not ( = ?auto_390525 ?auto_390530 ) ) ( not ( = ?auto_390525 ?auto_390531 ) ) ( not ( = ?auto_390525 ?auto_390532 ) ) ( not ( = ?auto_390525 ?auto_390533 ) ) ( not ( = ?auto_390525 ?auto_390534 ) ) ( not ( = ?auto_390526 ?auto_390527 ) ) ( not ( = ?auto_390526 ?auto_390528 ) ) ( not ( = ?auto_390526 ?auto_390529 ) ) ( not ( = ?auto_390526 ?auto_390530 ) ) ( not ( = ?auto_390526 ?auto_390531 ) ) ( not ( = ?auto_390526 ?auto_390532 ) ) ( not ( = ?auto_390526 ?auto_390533 ) ) ( not ( = ?auto_390526 ?auto_390534 ) ) ( not ( = ?auto_390527 ?auto_390528 ) ) ( not ( = ?auto_390527 ?auto_390529 ) ) ( not ( = ?auto_390527 ?auto_390530 ) ) ( not ( = ?auto_390527 ?auto_390531 ) ) ( not ( = ?auto_390527 ?auto_390532 ) ) ( not ( = ?auto_390527 ?auto_390533 ) ) ( not ( = ?auto_390527 ?auto_390534 ) ) ( not ( = ?auto_390528 ?auto_390529 ) ) ( not ( = ?auto_390528 ?auto_390530 ) ) ( not ( = ?auto_390528 ?auto_390531 ) ) ( not ( = ?auto_390528 ?auto_390532 ) ) ( not ( = ?auto_390528 ?auto_390533 ) ) ( not ( = ?auto_390528 ?auto_390534 ) ) ( not ( = ?auto_390529 ?auto_390530 ) ) ( not ( = ?auto_390529 ?auto_390531 ) ) ( not ( = ?auto_390529 ?auto_390532 ) ) ( not ( = ?auto_390529 ?auto_390533 ) ) ( not ( = ?auto_390529 ?auto_390534 ) ) ( not ( = ?auto_390530 ?auto_390531 ) ) ( not ( = ?auto_390530 ?auto_390532 ) ) ( not ( = ?auto_390530 ?auto_390533 ) ) ( not ( = ?auto_390530 ?auto_390534 ) ) ( not ( = ?auto_390531 ?auto_390532 ) ) ( not ( = ?auto_390531 ?auto_390533 ) ) ( not ( = ?auto_390531 ?auto_390534 ) ) ( not ( = ?auto_390532 ?auto_390533 ) ) ( not ( = ?auto_390532 ?auto_390534 ) ) ( not ( = ?auto_390533 ?auto_390534 ) ) ( ON ?auto_390532 ?auto_390533 ) ( ON ?auto_390531 ?auto_390532 ) ( ON ?auto_390530 ?auto_390531 ) ( ON ?auto_390529 ?auto_390530 ) ( ON ?auto_390528 ?auto_390529 ) ( CLEAR ?auto_390526 ) ( ON ?auto_390527 ?auto_390528 ) ( CLEAR ?auto_390527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_390520 ?auto_390521 ?auto_390522 ?auto_390523 ?auto_390524 ?auto_390525 ?auto_390526 ?auto_390527 )
      ( MAKE-14PILE ?auto_390520 ?auto_390521 ?auto_390522 ?auto_390523 ?auto_390524 ?auto_390525 ?auto_390526 ?auto_390527 ?auto_390528 ?auto_390529 ?auto_390530 ?auto_390531 ?auto_390532 ?auto_390533 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390549 - BLOCK
      ?auto_390550 - BLOCK
      ?auto_390551 - BLOCK
      ?auto_390552 - BLOCK
      ?auto_390553 - BLOCK
      ?auto_390554 - BLOCK
      ?auto_390555 - BLOCK
      ?auto_390556 - BLOCK
      ?auto_390557 - BLOCK
      ?auto_390558 - BLOCK
      ?auto_390559 - BLOCK
      ?auto_390560 - BLOCK
      ?auto_390561 - BLOCK
      ?auto_390562 - BLOCK
    )
    :vars
    (
      ?auto_390563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390562 ?auto_390563 ) ( ON-TABLE ?auto_390549 ) ( ON ?auto_390550 ?auto_390549 ) ( ON ?auto_390551 ?auto_390550 ) ( ON ?auto_390552 ?auto_390551 ) ( ON ?auto_390553 ?auto_390552 ) ( ON ?auto_390554 ?auto_390553 ) ( ON ?auto_390555 ?auto_390554 ) ( not ( = ?auto_390549 ?auto_390550 ) ) ( not ( = ?auto_390549 ?auto_390551 ) ) ( not ( = ?auto_390549 ?auto_390552 ) ) ( not ( = ?auto_390549 ?auto_390553 ) ) ( not ( = ?auto_390549 ?auto_390554 ) ) ( not ( = ?auto_390549 ?auto_390555 ) ) ( not ( = ?auto_390549 ?auto_390556 ) ) ( not ( = ?auto_390549 ?auto_390557 ) ) ( not ( = ?auto_390549 ?auto_390558 ) ) ( not ( = ?auto_390549 ?auto_390559 ) ) ( not ( = ?auto_390549 ?auto_390560 ) ) ( not ( = ?auto_390549 ?auto_390561 ) ) ( not ( = ?auto_390549 ?auto_390562 ) ) ( not ( = ?auto_390549 ?auto_390563 ) ) ( not ( = ?auto_390550 ?auto_390551 ) ) ( not ( = ?auto_390550 ?auto_390552 ) ) ( not ( = ?auto_390550 ?auto_390553 ) ) ( not ( = ?auto_390550 ?auto_390554 ) ) ( not ( = ?auto_390550 ?auto_390555 ) ) ( not ( = ?auto_390550 ?auto_390556 ) ) ( not ( = ?auto_390550 ?auto_390557 ) ) ( not ( = ?auto_390550 ?auto_390558 ) ) ( not ( = ?auto_390550 ?auto_390559 ) ) ( not ( = ?auto_390550 ?auto_390560 ) ) ( not ( = ?auto_390550 ?auto_390561 ) ) ( not ( = ?auto_390550 ?auto_390562 ) ) ( not ( = ?auto_390550 ?auto_390563 ) ) ( not ( = ?auto_390551 ?auto_390552 ) ) ( not ( = ?auto_390551 ?auto_390553 ) ) ( not ( = ?auto_390551 ?auto_390554 ) ) ( not ( = ?auto_390551 ?auto_390555 ) ) ( not ( = ?auto_390551 ?auto_390556 ) ) ( not ( = ?auto_390551 ?auto_390557 ) ) ( not ( = ?auto_390551 ?auto_390558 ) ) ( not ( = ?auto_390551 ?auto_390559 ) ) ( not ( = ?auto_390551 ?auto_390560 ) ) ( not ( = ?auto_390551 ?auto_390561 ) ) ( not ( = ?auto_390551 ?auto_390562 ) ) ( not ( = ?auto_390551 ?auto_390563 ) ) ( not ( = ?auto_390552 ?auto_390553 ) ) ( not ( = ?auto_390552 ?auto_390554 ) ) ( not ( = ?auto_390552 ?auto_390555 ) ) ( not ( = ?auto_390552 ?auto_390556 ) ) ( not ( = ?auto_390552 ?auto_390557 ) ) ( not ( = ?auto_390552 ?auto_390558 ) ) ( not ( = ?auto_390552 ?auto_390559 ) ) ( not ( = ?auto_390552 ?auto_390560 ) ) ( not ( = ?auto_390552 ?auto_390561 ) ) ( not ( = ?auto_390552 ?auto_390562 ) ) ( not ( = ?auto_390552 ?auto_390563 ) ) ( not ( = ?auto_390553 ?auto_390554 ) ) ( not ( = ?auto_390553 ?auto_390555 ) ) ( not ( = ?auto_390553 ?auto_390556 ) ) ( not ( = ?auto_390553 ?auto_390557 ) ) ( not ( = ?auto_390553 ?auto_390558 ) ) ( not ( = ?auto_390553 ?auto_390559 ) ) ( not ( = ?auto_390553 ?auto_390560 ) ) ( not ( = ?auto_390553 ?auto_390561 ) ) ( not ( = ?auto_390553 ?auto_390562 ) ) ( not ( = ?auto_390553 ?auto_390563 ) ) ( not ( = ?auto_390554 ?auto_390555 ) ) ( not ( = ?auto_390554 ?auto_390556 ) ) ( not ( = ?auto_390554 ?auto_390557 ) ) ( not ( = ?auto_390554 ?auto_390558 ) ) ( not ( = ?auto_390554 ?auto_390559 ) ) ( not ( = ?auto_390554 ?auto_390560 ) ) ( not ( = ?auto_390554 ?auto_390561 ) ) ( not ( = ?auto_390554 ?auto_390562 ) ) ( not ( = ?auto_390554 ?auto_390563 ) ) ( not ( = ?auto_390555 ?auto_390556 ) ) ( not ( = ?auto_390555 ?auto_390557 ) ) ( not ( = ?auto_390555 ?auto_390558 ) ) ( not ( = ?auto_390555 ?auto_390559 ) ) ( not ( = ?auto_390555 ?auto_390560 ) ) ( not ( = ?auto_390555 ?auto_390561 ) ) ( not ( = ?auto_390555 ?auto_390562 ) ) ( not ( = ?auto_390555 ?auto_390563 ) ) ( not ( = ?auto_390556 ?auto_390557 ) ) ( not ( = ?auto_390556 ?auto_390558 ) ) ( not ( = ?auto_390556 ?auto_390559 ) ) ( not ( = ?auto_390556 ?auto_390560 ) ) ( not ( = ?auto_390556 ?auto_390561 ) ) ( not ( = ?auto_390556 ?auto_390562 ) ) ( not ( = ?auto_390556 ?auto_390563 ) ) ( not ( = ?auto_390557 ?auto_390558 ) ) ( not ( = ?auto_390557 ?auto_390559 ) ) ( not ( = ?auto_390557 ?auto_390560 ) ) ( not ( = ?auto_390557 ?auto_390561 ) ) ( not ( = ?auto_390557 ?auto_390562 ) ) ( not ( = ?auto_390557 ?auto_390563 ) ) ( not ( = ?auto_390558 ?auto_390559 ) ) ( not ( = ?auto_390558 ?auto_390560 ) ) ( not ( = ?auto_390558 ?auto_390561 ) ) ( not ( = ?auto_390558 ?auto_390562 ) ) ( not ( = ?auto_390558 ?auto_390563 ) ) ( not ( = ?auto_390559 ?auto_390560 ) ) ( not ( = ?auto_390559 ?auto_390561 ) ) ( not ( = ?auto_390559 ?auto_390562 ) ) ( not ( = ?auto_390559 ?auto_390563 ) ) ( not ( = ?auto_390560 ?auto_390561 ) ) ( not ( = ?auto_390560 ?auto_390562 ) ) ( not ( = ?auto_390560 ?auto_390563 ) ) ( not ( = ?auto_390561 ?auto_390562 ) ) ( not ( = ?auto_390561 ?auto_390563 ) ) ( not ( = ?auto_390562 ?auto_390563 ) ) ( ON ?auto_390561 ?auto_390562 ) ( ON ?auto_390560 ?auto_390561 ) ( ON ?auto_390559 ?auto_390560 ) ( ON ?auto_390558 ?auto_390559 ) ( ON ?auto_390557 ?auto_390558 ) ( CLEAR ?auto_390555 ) ( ON ?auto_390556 ?auto_390557 ) ( CLEAR ?auto_390556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_390549 ?auto_390550 ?auto_390551 ?auto_390552 ?auto_390553 ?auto_390554 ?auto_390555 ?auto_390556 )
      ( MAKE-14PILE ?auto_390549 ?auto_390550 ?auto_390551 ?auto_390552 ?auto_390553 ?auto_390554 ?auto_390555 ?auto_390556 ?auto_390557 ?auto_390558 ?auto_390559 ?auto_390560 ?auto_390561 ?auto_390562 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390578 - BLOCK
      ?auto_390579 - BLOCK
      ?auto_390580 - BLOCK
      ?auto_390581 - BLOCK
      ?auto_390582 - BLOCK
      ?auto_390583 - BLOCK
      ?auto_390584 - BLOCK
      ?auto_390585 - BLOCK
      ?auto_390586 - BLOCK
      ?auto_390587 - BLOCK
      ?auto_390588 - BLOCK
      ?auto_390589 - BLOCK
      ?auto_390590 - BLOCK
      ?auto_390591 - BLOCK
    )
    :vars
    (
      ?auto_390592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390591 ?auto_390592 ) ( ON-TABLE ?auto_390578 ) ( ON ?auto_390579 ?auto_390578 ) ( ON ?auto_390580 ?auto_390579 ) ( ON ?auto_390581 ?auto_390580 ) ( ON ?auto_390582 ?auto_390581 ) ( ON ?auto_390583 ?auto_390582 ) ( not ( = ?auto_390578 ?auto_390579 ) ) ( not ( = ?auto_390578 ?auto_390580 ) ) ( not ( = ?auto_390578 ?auto_390581 ) ) ( not ( = ?auto_390578 ?auto_390582 ) ) ( not ( = ?auto_390578 ?auto_390583 ) ) ( not ( = ?auto_390578 ?auto_390584 ) ) ( not ( = ?auto_390578 ?auto_390585 ) ) ( not ( = ?auto_390578 ?auto_390586 ) ) ( not ( = ?auto_390578 ?auto_390587 ) ) ( not ( = ?auto_390578 ?auto_390588 ) ) ( not ( = ?auto_390578 ?auto_390589 ) ) ( not ( = ?auto_390578 ?auto_390590 ) ) ( not ( = ?auto_390578 ?auto_390591 ) ) ( not ( = ?auto_390578 ?auto_390592 ) ) ( not ( = ?auto_390579 ?auto_390580 ) ) ( not ( = ?auto_390579 ?auto_390581 ) ) ( not ( = ?auto_390579 ?auto_390582 ) ) ( not ( = ?auto_390579 ?auto_390583 ) ) ( not ( = ?auto_390579 ?auto_390584 ) ) ( not ( = ?auto_390579 ?auto_390585 ) ) ( not ( = ?auto_390579 ?auto_390586 ) ) ( not ( = ?auto_390579 ?auto_390587 ) ) ( not ( = ?auto_390579 ?auto_390588 ) ) ( not ( = ?auto_390579 ?auto_390589 ) ) ( not ( = ?auto_390579 ?auto_390590 ) ) ( not ( = ?auto_390579 ?auto_390591 ) ) ( not ( = ?auto_390579 ?auto_390592 ) ) ( not ( = ?auto_390580 ?auto_390581 ) ) ( not ( = ?auto_390580 ?auto_390582 ) ) ( not ( = ?auto_390580 ?auto_390583 ) ) ( not ( = ?auto_390580 ?auto_390584 ) ) ( not ( = ?auto_390580 ?auto_390585 ) ) ( not ( = ?auto_390580 ?auto_390586 ) ) ( not ( = ?auto_390580 ?auto_390587 ) ) ( not ( = ?auto_390580 ?auto_390588 ) ) ( not ( = ?auto_390580 ?auto_390589 ) ) ( not ( = ?auto_390580 ?auto_390590 ) ) ( not ( = ?auto_390580 ?auto_390591 ) ) ( not ( = ?auto_390580 ?auto_390592 ) ) ( not ( = ?auto_390581 ?auto_390582 ) ) ( not ( = ?auto_390581 ?auto_390583 ) ) ( not ( = ?auto_390581 ?auto_390584 ) ) ( not ( = ?auto_390581 ?auto_390585 ) ) ( not ( = ?auto_390581 ?auto_390586 ) ) ( not ( = ?auto_390581 ?auto_390587 ) ) ( not ( = ?auto_390581 ?auto_390588 ) ) ( not ( = ?auto_390581 ?auto_390589 ) ) ( not ( = ?auto_390581 ?auto_390590 ) ) ( not ( = ?auto_390581 ?auto_390591 ) ) ( not ( = ?auto_390581 ?auto_390592 ) ) ( not ( = ?auto_390582 ?auto_390583 ) ) ( not ( = ?auto_390582 ?auto_390584 ) ) ( not ( = ?auto_390582 ?auto_390585 ) ) ( not ( = ?auto_390582 ?auto_390586 ) ) ( not ( = ?auto_390582 ?auto_390587 ) ) ( not ( = ?auto_390582 ?auto_390588 ) ) ( not ( = ?auto_390582 ?auto_390589 ) ) ( not ( = ?auto_390582 ?auto_390590 ) ) ( not ( = ?auto_390582 ?auto_390591 ) ) ( not ( = ?auto_390582 ?auto_390592 ) ) ( not ( = ?auto_390583 ?auto_390584 ) ) ( not ( = ?auto_390583 ?auto_390585 ) ) ( not ( = ?auto_390583 ?auto_390586 ) ) ( not ( = ?auto_390583 ?auto_390587 ) ) ( not ( = ?auto_390583 ?auto_390588 ) ) ( not ( = ?auto_390583 ?auto_390589 ) ) ( not ( = ?auto_390583 ?auto_390590 ) ) ( not ( = ?auto_390583 ?auto_390591 ) ) ( not ( = ?auto_390583 ?auto_390592 ) ) ( not ( = ?auto_390584 ?auto_390585 ) ) ( not ( = ?auto_390584 ?auto_390586 ) ) ( not ( = ?auto_390584 ?auto_390587 ) ) ( not ( = ?auto_390584 ?auto_390588 ) ) ( not ( = ?auto_390584 ?auto_390589 ) ) ( not ( = ?auto_390584 ?auto_390590 ) ) ( not ( = ?auto_390584 ?auto_390591 ) ) ( not ( = ?auto_390584 ?auto_390592 ) ) ( not ( = ?auto_390585 ?auto_390586 ) ) ( not ( = ?auto_390585 ?auto_390587 ) ) ( not ( = ?auto_390585 ?auto_390588 ) ) ( not ( = ?auto_390585 ?auto_390589 ) ) ( not ( = ?auto_390585 ?auto_390590 ) ) ( not ( = ?auto_390585 ?auto_390591 ) ) ( not ( = ?auto_390585 ?auto_390592 ) ) ( not ( = ?auto_390586 ?auto_390587 ) ) ( not ( = ?auto_390586 ?auto_390588 ) ) ( not ( = ?auto_390586 ?auto_390589 ) ) ( not ( = ?auto_390586 ?auto_390590 ) ) ( not ( = ?auto_390586 ?auto_390591 ) ) ( not ( = ?auto_390586 ?auto_390592 ) ) ( not ( = ?auto_390587 ?auto_390588 ) ) ( not ( = ?auto_390587 ?auto_390589 ) ) ( not ( = ?auto_390587 ?auto_390590 ) ) ( not ( = ?auto_390587 ?auto_390591 ) ) ( not ( = ?auto_390587 ?auto_390592 ) ) ( not ( = ?auto_390588 ?auto_390589 ) ) ( not ( = ?auto_390588 ?auto_390590 ) ) ( not ( = ?auto_390588 ?auto_390591 ) ) ( not ( = ?auto_390588 ?auto_390592 ) ) ( not ( = ?auto_390589 ?auto_390590 ) ) ( not ( = ?auto_390589 ?auto_390591 ) ) ( not ( = ?auto_390589 ?auto_390592 ) ) ( not ( = ?auto_390590 ?auto_390591 ) ) ( not ( = ?auto_390590 ?auto_390592 ) ) ( not ( = ?auto_390591 ?auto_390592 ) ) ( ON ?auto_390590 ?auto_390591 ) ( ON ?auto_390589 ?auto_390590 ) ( ON ?auto_390588 ?auto_390589 ) ( ON ?auto_390587 ?auto_390588 ) ( ON ?auto_390586 ?auto_390587 ) ( ON ?auto_390585 ?auto_390586 ) ( CLEAR ?auto_390583 ) ( ON ?auto_390584 ?auto_390585 ) ( CLEAR ?auto_390584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_390578 ?auto_390579 ?auto_390580 ?auto_390581 ?auto_390582 ?auto_390583 ?auto_390584 )
      ( MAKE-14PILE ?auto_390578 ?auto_390579 ?auto_390580 ?auto_390581 ?auto_390582 ?auto_390583 ?auto_390584 ?auto_390585 ?auto_390586 ?auto_390587 ?auto_390588 ?auto_390589 ?auto_390590 ?auto_390591 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390607 - BLOCK
      ?auto_390608 - BLOCK
      ?auto_390609 - BLOCK
      ?auto_390610 - BLOCK
      ?auto_390611 - BLOCK
      ?auto_390612 - BLOCK
      ?auto_390613 - BLOCK
      ?auto_390614 - BLOCK
      ?auto_390615 - BLOCK
      ?auto_390616 - BLOCK
      ?auto_390617 - BLOCK
      ?auto_390618 - BLOCK
      ?auto_390619 - BLOCK
      ?auto_390620 - BLOCK
    )
    :vars
    (
      ?auto_390621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390620 ?auto_390621 ) ( ON-TABLE ?auto_390607 ) ( ON ?auto_390608 ?auto_390607 ) ( ON ?auto_390609 ?auto_390608 ) ( ON ?auto_390610 ?auto_390609 ) ( ON ?auto_390611 ?auto_390610 ) ( ON ?auto_390612 ?auto_390611 ) ( not ( = ?auto_390607 ?auto_390608 ) ) ( not ( = ?auto_390607 ?auto_390609 ) ) ( not ( = ?auto_390607 ?auto_390610 ) ) ( not ( = ?auto_390607 ?auto_390611 ) ) ( not ( = ?auto_390607 ?auto_390612 ) ) ( not ( = ?auto_390607 ?auto_390613 ) ) ( not ( = ?auto_390607 ?auto_390614 ) ) ( not ( = ?auto_390607 ?auto_390615 ) ) ( not ( = ?auto_390607 ?auto_390616 ) ) ( not ( = ?auto_390607 ?auto_390617 ) ) ( not ( = ?auto_390607 ?auto_390618 ) ) ( not ( = ?auto_390607 ?auto_390619 ) ) ( not ( = ?auto_390607 ?auto_390620 ) ) ( not ( = ?auto_390607 ?auto_390621 ) ) ( not ( = ?auto_390608 ?auto_390609 ) ) ( not ( = ?auto_390608 ?auto_390610 ) ) ( not ( = ?auto_390608 ?auto_390611 ) ) ( not ( = ?auto_390608 ?auto_390612 ) ) ( not ( = ?auto_390608 ?auto_390613 ) ) ( not ( = ?auto_390608 ?auto_390614 ) ) ( not ( = ?auto_390608 ?auto_390615 ) ) ( not ( = ?auto_390608 ?auto_390616 ) ) ( not ( = ?auto_390608 ?auto_390617 ) ) ( not ( = ?auto_390608 ?auto_390618 ) ) ( not ( = ?auto_390608 ?auto_390619 ) ) ( not ( = ?auto_390608 ?auto_390620 ) ) ( not ( = ?auto_390608 ?auto_390621 ) ) ( not ( = ?auto_390609 ?auto_390610 ) ) ( not ( = ?auto_390609 ?auto_390611 ) ) ( not ( = ?auto_390609 ?auto_390612 ) ) ( not ( = ?auto_390609 ?auto_390613 ) ) ( not ( = ?auto_390609 ?auto_390614 ) ) ( not ( = ?auto_390609 ?auto_390615 ) ) ( not ( = ?auto_390609 ?auto_390616 ) ) ( not ( = ?auto_390609 ?auto_390617 ) ) ( not ( = ?auto_390609 ?auto_390618 ) ) ( not ( = ?auto_390609 ?auto_390619 ) ) ( not ( = ?auto_390609 ?auto_390620 ) ) ( not ( = ?auto_390609 ?auto_390621 ) ) ( not ( = ?auto_390610 ?auto_390611 ) ) ( not ( = ?auto_390610 ?auto_390612 ) ) ( not ( = ?auto_390610 ?auto_390613 ) ) ( not ( = ?auto_390610 ?auto_390614 ) ) ( not ( = ?auto_390610 ?auto_390615 ) ) ( not ( = ?auto_390610 ?auto_390616 ) ) ( not ( = ?auto_390610 ?auto_390617 ) ) ( not ( = ?auto_390610 ?auto_390618 ) ) ( not ( = ?auto_390610 ?auto_390619 ) ) ( not ( = ?auto_390610 ?auto_390620 ) ) ( not ( = ?auto_390610 ?auto_390621 ) ) ( not ( = ?auto_390611 ?auto_390612 ) ) ( not ( = ?auto_390611 ?auto_390613 ) ) ( not ( = ?auto_390611 ?auto_390614 ) ) ( not ( = ?auto_390611 ?auto_390615 ) ) ( not ( = ?auto_390611 ?auto_390616 ) ) ( not ( = ?auto_390611 ?auto_390617 ) ) ( not ( = ?auto_390611 ?auto_390618 ) ) ( not ( = ?auto_390611 ?auto_390619 ) ) ( not ( = ?auto_390611 ?auto_390620 ) ) ( not ( = ?auto_390611 ?auto_390621 ) ) ( not ( = ?auto_390612 ?auto_390613 ) ) ( not ( = ?auto_390612 ?auto_390614 ) ) ( not ( = ?auto_390612 ?auto_390615 ) ) ( not ( = ?auto_390612 ?auto_390616 ) ) ( not ( = ?auto_390612 ?auto_390617 ) ) ( not ( = ?auto_390612 ?auto_390618 ) ) ( not ( = ?auto_390612 ?auto_390619 ) ) ( not ( = ?auto_390612 ?auto_390620 ) ) ( not ( = ?auto_390612 ?auto_390621 ) ) ( not ( = ?auto_390613 ?auto_390614 ) ) ( not ( = ?auto_390613 ?auto_390615 ) ) ( not ( = ?auto_390613 ?auto_390616 ) ) ( not ( = ?auto_390613 ?auto_390617 ) ) ( not ( = ?auto_390613 ?auto_390618 ) ) ( not ( = ?auto_390613 ?auto_390619 ) ) ( not ( = ?auto_390613 ?auto_390620 ) ) ( not ( = ?auto_390613 ?auto_390621 ) ) ( not ( = ?auto_390614 ?auto_390615 ) ) ( not ( = ?auto_390614 ?auto_390616 ) ) ( not ( = ?auto_390614 ?auto_390617 ) ) ( not ( = ?auto_390614 ?auto_390618 ) ) ( not ( = ?auto_390614 ?auto_390619 ) ) ( not ( = ?auto_390614 ?auto_390620 ) ) ( not ( = ?auto_390614 ?auto_390621 ) ) ( not ( = ?auto_390615 ?auto_390616 ) ) ( not ( = ?auto_390615 ?auto_390617 ) ) ( not ( = ?auto_390615 ?auto_390618 ) ) ( not ( = ?auto_390615 ?auto_390619 ) ) ( not ( = ?auto_390615 ?auto_390620 ) ) ( not ( = ?auto_390615 ?auto_390621 ) ) ( not ( = ?auto_390616 ?auto_390617 ) ) ( not ( = ?auto_390616 ?auto_390618 ) ) ( not ( = ?auto_390616 ?auto_390619 ) ) ( not ( = ?auto_390616 ?auto_390620 ) ) ( not ( = ?auto_390616 ?auto_390621 ) ) ( not ( = ?auto_390617 ?auto_390618 ) ) ( not ( = ?auto_390617 ?auto_390619 ) ) ( not ( = ?auto_390617 ?auto_390620 ) ) ( not ( = ?auto_390617 ?auto_390621 ) ) ( not ( = ?auto_390618 ?auto_390619 ) ) ( not ( = ?auto_390618 ?auto_390620 ) ) ( not ( = ?auto_390618 ?auto_390621 ) ) ( not ( = ?auto_390619 ?auto_390620 ) ) ( not ( = ?auto_390619 ?auto_390621 ) ) ( not ( = ?auto_390620 ?auto_390621 ) ) ( ON ?auto_390619 ?auto_390620 ) ( ON ?auto_390618 ?auto_390619 ) ( ON ?auto_390617 ?auto_390618 ) ( ON ?auto_390616 ?auto_390617 ) ( ON ?auto_390615 ?auto_390616 ) ( ON ?auto_390614 ?auto_390615 ) ( CLEAR ?auto_390612 ) ( ON ?auto_390613 ?auto_390614 ) ( CLEAR ?auto_390613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_390607 ?auto_390608 ?auto_390609 ?auto_390610 ?auto_390611 ?auto_390612 ?auto_390613 )
      ( MAKE-14PILE ?auto_390607 ?auto_390608 ?auto_390609 ?auto_390610 ?auto_390611 ?auto_390612 ?auto_390613 ?auto_390614 ?auto_390615 ?auto_390616 ?auto_390617 ?auto_390618 ?auto_390619 ?auto_390620 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390636 - BLOCK
      ?auto_390637 - BLOCK
      ?auto_390638 - BLOCK
      ?auto_390639 - BLOCK
      ?auto_390640 - BLOCK
      ?auto_390641 - BLOCK
      ?auto_390642 - BLOCK
      ?auto_390643 - BLOCK
      ?auto_390644 - BLOCK
      ?auto_390645 - BLOCK
      ?auto_390646 - BLOCK
      ?auto_390647 - BLOCK
      ?auto_390648 - BLOCK
      ?auto_390649 - BLOCK
    )
    :vars
    (
      ?auto_390650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390649 ?auto_390650 ) ( ON-TABLE ?auto_390636 ) ( ON ?auto_390637 ?auto_390636 ) ( ON ?auto_390638 ?auto_390637 ) ( ON ?auto_390639 ?auto_390638 ) ( ON ?auto_390640 ?auto_390639 ) ( not ( = ?auto_390636 ?auto_390637 ) ) ( not ( = ?auto_390636 ?auto_390638 ) ) ( not ( = ?auto_390636 ?auto_390639 ) ) ( not ( = ?auto_390636 ?auto_390640 ) ) ( not ( = ?auto_390636 ?auto_390641 ) ) ( not ( = ?auto_390636 ?auto_390642 ) ) ( not ( = ?auto_390636 ?auto_390643 ) ) ( not ( = ?auto_390636 ?auto_390644 ) ) ( not ( = ?auto_390636 ?auto_390645 ) ) ( not ( = ?auto_390636 ?auto_390646 ) ) ( not ( = ?auto_390636 ?auto_390647 ) ) ( not ( = ?auto_390636 ?auto_390648 ) ) ( not ( = ?auto_390636 ?auto_390649 ) ) ( not ( = ?auto_390636 ?auto_390650 ) ) ( not ( = ?auto_390637 ?auto_390638 ) ) ( not ( = ?auto_390637 ?auto_390639 ) ) ( not ( = ?auto_390637 ?auto_390640 ) ) ( not ( = ?auto_390637 ?auto_390641 ) ) ( not ( = ?auto_390637 ?auto_390642 ) ) ( not ( = ?auto_390637 ?auto_390643 ) ) ( not ( = ?auto_390637 ?auto_390644 ) ) ( not ( = ?auto_390637 ?auto_390645 ) ) ( not ( = ?auto_390637 ?auto_390646 ) ) ( not ( = ?auto_390637 ?auto_390647 ) ) ( not ( = ?auto_390637 ?auto_390648 ) ) ( not ( = ?auto_390637 ?auto_390649 ) ) ( not ( = ?auto_390637 ?auto_390650 ) ) ( not ( = ?auto_390638 ?auto_390639 ) ) ( not ( = ?auto_390638 ?auto_390640 ) ) ( not ( = ?auto_390638 ?auto_390641 ) ) ( not ( = ?auto_390638 ?auto_390642 ) ) ( not ( = ?auto_390638 ?auto_390643 ) ) ( not ( = ?auto_390638 ?auto_390644 ) ) ( not ( = ?auto_390638 ?auto_390645 ) ) ( not ( = ?auto_390638 ?auto_390646 ) ) ( not ( = ?auto_390638 ?auto_390647 ) ) ( not ( = ?auto_390638 ?auto_390648 ) ) ( not ( = ?auto_390638 ?auto_390649 ) ) ( not ( = ?auto_390638 ?auto_390650 ) ) ( not ( = ?auto_390639 ?auto_390640 ) ) ( not ( = ?auto_390639 ?auto_390641 ) ) ( not ( = ?auto_390639 ?auto_390642 ) ) ( not ( = ?auto_390639 ?auto_390643 ) ) ( not ( = ?auto_390639 ?auto_390644 ) ) ( not ( = ?auto_390639 ?auto_390645 ) ) ( not ( = ?auto_390639 ?auto_390646 ) ) ( not ( = ?auto_390639 ?auto_390647 ) ) ( not ( = ?auto_390639 ?auto_390648 ) ) ( not ( = ?auto_390639 ?auto_390649 ) ) ( not ( = ?auto_390639 ?auto_390650 ) ) ( not ( = ?auto_390640 ?auto_390641 ) ) ( not ( = ?auto_390640 ?auto_390642 ) ) ( not ( = ?auto_390640 ?auto_390643 ) ) ( not ( = ?auto_390640 ?auto_390644 ) ) ( not ( = ?auto_390640 ?auto_390645 ) ) ( not ( = ?auto_390640 ?auto_390646 ) ) ( not ( = ?auto_390640 ?auto_390647 ) ) ( not ( = ?auto_390640 ?auto_390648 ) ) ( not ( = ?auto_390640 ?auto_390649 ) ) ( not ( = ?auto_390640 ?auto_390650 ) ) ( not ( = ?auto_390641 ?auto_390642 ) ) ( not ( = ?auto_390641 ?auto_390643 ) ) ( not ( = ?auto_390641 ?auto_390644 ) ) ( not ( = ?auto_390641 ?auto_390645 ) ) ( not ( = ?auto_390641 ?auto_390646 ) ) ( not ( = ?auto_390641 ?auto_390647 ) ) ( not ( = ?auto_390641 ?auto_390648 ) ) ( not ( = ?auto_390641 ?auto_390649 ) ) ( not ( = ?auto_390641 ?auto_390650 ) ) ( not ( = ?auto_390642 ?auto_390643 ) ) ( not ( = ?auto_390642 ?auto_390644 ) ) ( not ( = ?auto_390642 ?auto_390645 ) ) ( not ( = ?auto_390642 ?auto_390646 ) ) ( not ( = ?auto_390642 ?auto_390647 ) ) ( not ( = ?auto_390642 ?auto_390648 ) ) ( not ( = ?auto_390642 ?auto_390649 ) ) ( not ( = ?auto_390642 ?auto_390650 ) ) ( not ( = ?auto_390643 ?auto_390644 ) ) ( not ( = ?auto_390643 ?auto_390645 ) ) ( not ( = ?auto_390643 ?auto_390646 ) ) ( not ( = ?auto_390643 ?auto_390647 ) ) ( not ( = ?auto_390643 ?auto_390648 ) ) ( not ( = ?auto_390643 ?auto_390649 ) ) ( not ( = ?auto_390643 ?auto_390650 ) ) ( not ( = ?auto_390644 ?auto_390645 ) ) ( not ( = ?auto_390644 ?auto_390646 ) ) ( not ( = ?auto_390644 ?auto_390647 ) ) ( not ( = ?auto_390644 ?auto_390648 ) ) ( not ( = ?auto_390644 ?auto_390649 ) ) ( not ( = ?auto_390644 ?auto_390650 ) ) ( not ( = ?auto_390645 ?auto_390646 ) ) ( not ( = ?auto_390645 ?auto_390647 ) ) ( not ( = ?auto_390645 ?auto_390648 ) ) ( not ( = ?auto_390645 ?auto_390649 ) ) ( not ( = ?auto_390645 ?auto_390650 ) ) ( not ( = ?auto_390646 ?auto_390647 ) ) ( not ( = ?auto_390646 ?auto_390648 ) ) ( not ( = ?auto_390646 ?auto_390649 ) ) ( not ( = ?auto_390646 ?auto_390650 ) ) ( not ( = ?auto_390647 ?auto_390648 ) ) ( not ( = ?auto_390647 ?auto_390649 ) ) ( not ( = ?auto_390647 ?auto_390650 ) ) ( not ( = ?auto_390648 ?auto_390649 ) ) ( not ( = ?auto_390648 ?auto_390650 ) ) ( not ( = ?auto_390649 ?auto_390650 ) ) ( ON ?auto_390648 ?auto_390649 ) ( ON ?auto_390647 ?auto_390648 ) ( ON ?auto_390646 ?auto_390647 ) ( ON ?auto_390645 ?auto_390646 ) ( ON ?auto_390644 ?auto_390645 ) ( ON ?auto_390643 ?auto_390644 ) ( ON ?auto_390642 ?auto_390643 ) ( CLEAR ?auto_390640 ) ( ON ?auto_390641 ?auto_390642 ) ( CLEAR ?auto_390641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_390636 ?auto_390637 ?auto_390638 ?auto_390639 ?auto_390640 ?auto_390641 )
      ( MAKE-14PILE ?auto_390636 ?auto_390637 ?auto_390638 ?auto_390639 ?auto_390640 ?auto_390641 ?auto_390642 ?auto_390643 ?auto_390644 ?auto_390645 ?auto_390646 ?auto_390647 ?auto_390648 ?auto_390649 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390665 - BLOCK
      ?auto_390666 - BLOCK
      ?auto_390667 - BLOCK
      ?auto_390668 - BLOCK
      ?auto_390669 - BLOCK
      ?auto_390670 - BLOCK
      ?auto_390671 - BLOCK
      ?auto_390672 - BLOCK
      ?auto_390673 - BLOCK
      ?auto_390674 - BLOCK
      ?auto_390675 - BLOCK
      ?auto_390676 - BLOCK
      ?auto_390677 - BLOCK
      ?auto_390678 - BLOCK
    )
    :vars
    (
      ?auto_390679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390678 ?auto_390679 ) ( ON-TABLE ?auto_390665 ) ( ON ?auto_390666 ?auto_390665 ) ( ON ?auto_390667 ?auto_390666 ) ( ON ?auto_390668 ?auto_390667 ) ( ON ?auto_390669 ?auto_390668 ) ( not ( = ?auto_390665 ?auto_390666 ) ) ( not ( = ?auto_390665 ?auto_390667 ) ) ( not ( = ?auto_390665 ?auto_390668 ) ) ( not ( = ?auto_390665 ?auto_390669 ) ) ( not ( = ?auto_390665 ?auto_390670 ) ) ( not ( = ?auto_390665 ?auto_390671 ) ) ( not ( = ?auto_390665 ?auto_390672 ) ) ( not ( = ?auto_390665 ?auto_390673 ) ) ( not ( = ?auto_390665 ?auto_390674 ) ) ( not ( = ?auto_390665 ?auto_390675 ) ) ( not ( = ?auto_390665 ?auto_390676 ) ) ( not ( = ?auto_390665 ?auto_390677 ) ) ( not ( = ?auto_390665 ?auto_390678 ) ) ( not ( = ?auto_390665 ?auto_390679 ) ) ( not ( = ?auto_390666 ?auto_390667 ) ) ( not ( = ?auto_390666 ?auto_390668 ) ) ( not ( = ?auto_390666 ?auto_390669 ) ) ( not ( = ?auto_390666 ?auto_390670 ) ) ( not ( = ?auto_390666 ?auto_390671 ) ) ( not ( = ?auto_390666 ?auto_390672 ) ) ( not ( = ?auto_390666 ?auto_390673 ) ) ( not ( = ?auto_390666 ?auto_390674 ) ) ( not ( = ?auto_390666 ?auto_390675 ) ) ( not ( = ?auto_390666 ?auto_390676 ) ) ( not ( = ?auto_390666 ?auto_390677 ) ) ( not ( = ?auto_390666 ?auto_390678 ) ) ( not ( = ?auto_390666 ?auto_390679 ) ) ( not ( = ?auto_390667 ?auto_390668 ) ) ( not ( = ?auto_390667 ?auto_390669 ) ) ( not ( = ?auto_390667 ?auto_390670 ) ) ( not ( = ?auto_390667 ?auto_390671 ) ) ( not ( = ?auto_390667 ?auto_390672 ) ) ( not ( = ?auto_390667 ?auto_390673 ) ) ( not ( = ?auto_390667 ?auto_390674 ) ) ( not ( = ?auto_390667 ?auto_390675 ) ) ( not ( = ?auto_390667 ?auto_390676 ) ) ( not ( = ?auto_390667 ?auto_390677 ) ) ( not ( = ?auto_390667 ?auto_390678 ) ) ( not ( = ?auto_390667 ?auto_390679 ) ) ( not ( = ?auto_390668 ?auto_390669 ) ) ( not ( = ?auto_390668 ?auto_390670 ) ) ( not ( = ?auto_390668 ?auto_390671 ) ) ( not ( = ?auto_390668 ?auto_390672 ) ) ( not ( = ?auto_390668 ?auto_390673 ) ) ( not ( = ?auto_390668 ?auto_390674 ) ) ( not ( = ?auto_390668 ?auto_390675 ) ) ( not ( = ?auto_390668 ?auto_390676 ) ) ( not ( = ?auto_390668 ?auto_390677 ) ) ( not ( = ?auto_390668 ?auto_390678 ) ) ( not ( = ?auto_390668 ?auto_390679 ) ) ( not ( = ?auto_390669 ?auto_390670 ) ) ( not ( = ?auto_390669 ?auto_390671 ) ) ( not ( = ?auto_390669 ?auto_390672 ) ) ( not ( = ?auto_390669 ?auto_390673 ) ) ( not ( = ?auto_390669 ?auto_390674 ) ) ( not ( = ?auto_390669 ?auto_390675 ) ) ( not ( = ?auto_390669 ?auto_390676 ) ) ( not ( = ?auto_390669 ?auto_390677 ) ) ( not ( = ?auto_390669 ?auto_390678 ) ) ( not ( = ?auto_390669 ?auto_390679 ) ) ( not ( = ?auto_390670 ?auto_390671 ) ) ( not ( = ?auto_390670 ?auto_390672 ) ) ( not ( = ?auto_390670 ?auto_390673 ) ) ( not ( = ?auto_390670 ?auto_390674 ) ) ( not ( = ?auto_390670 ?auto_390675 ) ) ( not ( = ?auto_390670 ?auto_390676 ) ) ( not ( = ?auto_390670 ?auto_390677 ) ) ( not ( = ?auto_390670 ?auto_390678 ) ) ( not ( = ?auto_390670 ?auto_390679 ) ) ( not ( = ?auto_390671 ?auto_390672 ) ) ( not ( = ?auto_390671 ?auto_390673 ) ) ( not ( = ?auto_390671 ?auto_390674 ) ) ( not ( = ?auto_390671 ?auto_390675 ) ) ( not ( = ?auto_390671 ?auto_390676 ) ) ( not ( = ?auto_390671 ?auto_390677 ) ) ( not ( = ?auto_390671 ?auto_390678 ) ) ( not ( = ?auto_390671 ?auto_390679 ) ) ( not ( = ?auto_390672 ?auto_390673 ) ) ( not ( = ?auto_390672 ?auto_390674 ) ) ( not ( = ?auto_390672 ?auto_390675 ) ) ( not ( = ?auto_390672 ?auto_390676 ) ) ( not ( = ?auto_390672 ?auto_390677 ) ) ( not ( = ?auto_390672 ?auto_390678 ) ) ( not ( = ?auto_390672 ?auto_390679 ) ) ( not ( = ?auto_390673 ?auto_390674 ) ) ( not ( = ?auto_390673 ?auto_390675 ) ) ( not ( = ?auto_390673 ?auto_390676 ) ) ( not ( = ?auto_390673 ?auto_390677 ) ) ( not ( = ?auto_390673 ?auto_390678 ) ) ( not ( = ?auto_390673 ?auto_390679 ) ) ( not ( = ?auto_390674 ?auto_390675 ) ) ( not ( = ?auto_390674 ?auto_390676 ) ) ( not ( = ?auto_390674 ?auto_390677 ) ) ( not ( = ?auto_390674 ?auto_390678 ) ) ( not ( = ?auto_390674 ?auto_390679 ) ) ( not ( = ?auto_390675 ?auto_390676 ) ) ( not ( = ?auto_390675 ?auto_390677 ) ) ( not ( = ?auto_390675 ?auto_390678 ) ) ( not ( = ?auto_390675 ?auto_390679 ) ) ( not ( = ?auto_390676 ?auto_390677 ) ) ( not ( = ?auto_390676 ?auto_390678 ) ) ( not ( = ?auto_390676 ?auto_390679 ) ) ( not ( = ?auto_390677 ?auto_390678 ) ) ( not ( = ?auto_390677 ?auto_390679 ) ) ( not ( = ?auto_390678 ?auto_390679 ) ) ( ON ?auto_390677 ?auto_390678 ) ( ON ?auto_390676 ?auto_390677 ) ( ON ?auto_390675 ?auto_390676 ) ( ON ?auto_390674 ?auto_390675 ) ( ON ?auto_390673 ?auto_390674 ) ( ON ?auto_390672 ?auto_390673 ) ( ON ?auto_390671 ?auto_390672 ) ( CLEAR ?auto_390669 ) ( ON ?auto_390670 ?auto_390671 ) ( CLEAR ?auto_390670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_390665 ?auto_390666 ?auto_390667 ?auto_390668 ?auto_390669 ?auto_390670 )
      ( MAKE-14PILE ?auto_390665 ?auto_390666 ?auto_390667 ?auto_390668 ?auto_390669 ?auto_390670 ?auto_390671 ?auto_390672 ?auto_390673 ?auto_390674 ?auto_390675 ?auto_390676 ?auto_390677 ?auto_390678 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390694 - BLOCK
      ?auto_390695 - BLOCK
      ?auto_390696 - BLOCK
      ?auto_390697 - BLOCK
      ?auto_390698 - BLOCK
      ?auto_390699 - BLOCK
      ?auto_390700 - BLOCK
      ?auto_390701 - BLOCK
      ?auto_390702 - BLOCK
      ?auto_390703 - BLOCK
      ?auto_390704 - BLOCK
      ?auto_390705 - BLOCK
      ?auto_390706 - BLOCK
      ?auto_390707 - BLOCK
    )
    :vars
    (
      ?auto_390708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390707 ?auto_390708 ) ( ON-TABLE ?auto_390694 ) ( ON ?auto_390695 ?auto_390694 ) ( ON ?auto_390696 ?auto_390695 ) ( ON ?auto_390697 ?auto_390696 ) ( not ( = ?auto_390694 ?auto_390695 ) ) ( not ( = ?auto_390694 ?auto_390696 ) ) ( not ( = ?auto_390694 ?auto_390697 ) ) ( not ( = ?auto_390694 ?auto_390698 ) ) ( not ( = ?auto_390694 ?auto_390699 ) ) ( not ( = ?auto_390694 ?auto_390700 ) ) ( not ( = ?auto_390694 ?auto_390701 ) ) ( not ( = ?auto_390694 ?auto_390702 ) ) ( not ( = ?auto_390694 ?auto_390703 ) ) ( not ( = ?auto_390694 ?auto_390704 ) ) ( not ( = ?auto_390694 ?auto_390705 ) ) ( not ( = ?auto_390694 ?auto_390706 ) ) ( not ( = ?auto_390694 ?auto_390707 ) ) ( not ( = ?auto_390694 ?auto_390708 ) ) ( not ( = ?auto_390695 ?auto_390696 ) ) ( not ( = ?auto_390695 ?auto_390697 ) ) ( not ( = ?auto_390695 ?auto_390698 ) ) ( not ( = ?auto_390695 ?auto_390699 ) ) ( not ( = ?auto_390695 ?auto_390700 ) ) ( not ( = ?auto_390695 ?auto_390701 ) ) ( not ( = ?auto_390695 ?auto_390702 ) ) ( not ( = ?auto_390695 ?auto_390703 ) ) ( not ( = ?auto_390695 ?auto_390704 ) ) ( not ( = ?auto_390695 ?auto_390705 ) ) ( not ( = ?auto_390695 ?auto_390706 ) ) ( not ( = ?auto_390695 ?auto_390707 ) ) ( not ( = ?auto_390695 ?auto_390708 ) ) ( not ( = ?auto_390696 ?auto_390697 ) ) ( not ( = ?auto_390696 ?auto_390698 ) ) ( not ( = ?auto_390696 ?auto_390699 ) ) ( not ( = ?auto_390696 ?auto_390700 ) ) ( not ( = ?auto_390696 ?auto_390701 ) ) ( not ( = ?auto_390696 ?auto_390702 ) ) ( not ( = ?auto_390696 ?auto_390703 ) ) ( not ( = ?auto_390696 ?auto_390704 ) ) ( not ( = ?auto_390696 ?auto_390705 ) ) ( not ( = ?auto_390696 ?auto_390706 ) ) ( not ( = ?auto_390696 ?auto_390707 ) ) ( not ( = ?auto_390696 ?auto_390708 ) ) ( not ( = ?auto_390697 ?auto_390698 ) ) ( not ( = ?auto_390697 ?auto_390699 ) ) ( not ( = ?auto_390697 ?auto_390700 ) ) ( not ( = ?auto_390697 ?auto_390701 ) ) ( not ( = ?auto_390697 ?auto_390702 ) ) ( not ( = ?auto_390697 ?auto_390703 ) ) ( not ( = ?auto_390697 ?auto_390704 ) ) ( not ( = ?auto_390697 ?auto_390705 ) ) ( not ( = ?auto_390697 ?auto_390706 ) ) ( not ( = ?auto_390697 ?auto_390707 ) ) ( not ( = ?auto_390697 ?auto_390708 ) ) ( not ( = ?auto_390698 ?auto_390699 ) ) ( not ( = ?auto_390698 ?auto_390700 ) ) ( not ( = ?auto_390698 ?auto_390701 ) ) ( not ( = ?auto_390698 ?auto_390702 ) ) ( not ( = ?auto_390698 ?auto_390703 ) ) ( not ( = ?auto_390698 ?auto_390704 ) ) ( not ( = ?auto_390698 ?auto_390705 ) ) ( not ( = ?auto_390698 ?auto_390706 ) ) ( not ( = ?auto_390698 ?auto_390707 ) ) ( not ( = ?auto_390698 ?auto_390708 ) ) ( not ( = ?auto_390699 ?auto_390700 ) ) ( not ( = ?auto_390699 ?auto_390701 ) ) ( not ( = ?auto_390699 ?auto_390702 ) ) ( not ( = ?auto_390699 ?auto_390703 ) ) ( not ( = ?auto_390699 ?auto_390704 ) ) ( not ( = ?auto_390699 ?auto_390705 ) ) ( not ( = ?auto_390699 ?auto_390706 ) ) ( not ( = ?auto_390699 ?auto_390707 ) ) ( not ( = ?auto_390699 ?auto_390708 ) ) ( not ( = ?auto_390700 ?auto_390701 ) ) ( not ( = ?auto_390700 ?auto_390702 ) ) ( not ( = ?auto_390700 ?auto_390703 ) ) ( not ( = ?auto_390700 ?auto_390704 ) ) ( not ( = ?auto_390700 ?auto_390705 ) ) ( not ( = ?auto_390700 ?auto_390706 ) ) ( not ( = ?auto_390700 ?auto_390707 ) ) ( not ( = ?auto_390700 ?auto_390708 ) ) ( not ( = ?auto_390701 ?auto_390702 ) ) ( not ( = ?auto_390701 ?auto_390703 ) ) ( not ( = ?auto_390701 ?auto_390704 ) ) ( not ( = ?auto_390701 ?auto_390705 ) ) ( not ( = ?auto_390701 ?auto_390706 ) ) ( not ( = ?auto_390701 ?auto_390707 ) ) ( not ( = ?auto_390701 ?auto_390708 ) ) ( not ( = ?auto_390702 ?auto_390703 ) ) ( not ( = ?auto_390702 ?auto_390704 ) ) ( not ( = ?auto_390702 ?auto_390705 ) ) ( not ( = ?auto_390702 ?auto_390706 ) ) ( not ( = ?auto_390702 ?auto_390707 ) ) ( not ( = ?auto_390702 ?auto_390708 ) ) ( not ( = ?auto_390703 ?auto_390704 ) ) ( not ( = ?auto_390703 ?auto_390705 ) ) ( not ( = ?auto_390703 ?auto_390706 ) ) ( not ( = ?auto_390703 ?auto_390707 ) ) ( not ( = ?auto_390703 ?auto_390708 ) ) ( not ( = ?auto_390704 ?auto_390705 ) ) ( not ( = ?auto_390704 ?auto_390706 ) ) ( not ( = ?auto_390704 ?auto_390707 ) ) ( not ( = ?auto_390704 ?auto_390708 ) ) ( not ( = ?auto_390705 ?auto_390706 ) ) ( not ( = ?auto_390705 ?auto_390707 ) ) ( not ( = ?auto_390705 ?auto_390708 ) ) ( not ( = ?auto_390706 ?auto_390707 ) ) ( not ( = ?auto_390706 ?auto_390708 ) ) ( not ( = ?auto_390707 ?auto_390708 ) ) ( ON ?auto_390706 ?auto_390707 ) ( ON ?auto_390705 ?auto_390706 ) ( ON ?auto_390704 ?auto_390705 ) ( ON ?auto_390703 ?auto_390704 ) ( ON ?auto_390702 ?auto_390703 ) ( ON ?auto_390701 ?auto_390702 ) ( ON ?auto_390700 ?auto_390701 ) ( ON ?auto_390699 ?auto_390700 ) ( CLEAR ?auto_390697 ) ( ON ?auto_390698 ?auto_390699 ) ( CLEAR ?auto_390698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_390694 ?auto_390695 ?auto_390696 ?auto_390697 ?auto_390698 )
      ( MAKE-14PILE ?auto_390694 ?auto_390695 ?auto_390696 ?auto_390697 ?auto_390698 ?auto_390699 ?auto_390700 ?auto_390701 ?auto_390702 ?auto_390703 ?auto_390704 ?auto_390705 ?auto_390706 ?auto_390707 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390723 - BLOCK
      ?auto_390724 - BLOCK
      ?auto_390725 - BLOCK
      ?auto_390726 - BLOCK
      ?auto_390727 - BLOCK
      ?auto_390728 - BLOCK
      ?auto_390729 - BLOCK
      ?auto_390730 - BLOCK
      ?auto_390731 - BLOCK
      ?auto_390732 - BLOCK
      ?auto_390733 - BLOCK
      ?auto_390734 - BLOCK
      ?auto_390735 - BLOCK
      ?auto_390736 - BLOCK
    )
    :vars
    (
      ?auto_390737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390736 ?auto_390737 ) ( ON-TABLE ?auto_390723 ) ( ON ?auto_390724 ?auto_390723 ) ( ON ?auto_390725 ?auto_390724 ) ( ON ?auto_390726 ?auto_390725 ) ( not ( = ?auto_390723 ?auto_390724 ) ) ( not ( = ?auto_390723 ?auto_390725 ) ) ( not ( = ?auto_390723 ?auto_390726 ) ) ( not ( = ?auto_390723 ?auto_390727 ) ) ( not ( = ?auto_390723 ?auto_390728 ) ) ( not ( = ?auto_390723 ?auto_390729 ) ) ( not ( = ?auto_390723 ?auto_390730 ) ) ( not ( = ?auto_390723 ?auto_390731 ) ) ( not ( = ?auto_390723 ?auto_390732 ) ) ( not ( = ?auto_390723 ?auto_390733 ) ) ( not ( = ?auto_390723 ?auto_390734 ) ) ( not ( = ?auto_390723 ?auto_390735 ) ) ( not ( = ?auto_390723 ?auto_390736 ) ) ( not ( = ?auto_390723 ?auto_390737 ) ) ( not ( = ?auto_390724 ?auto_390725 ) ) ( not ( = ?auto_390724 ?auto_390726 ) ) ( not ( = ?auto_390724 ?auto_390727 ) ) ( not ( = ?auto_390724 ?auto_390728 ) ) ( not ( = ?auto_390724 ?auto_390729 ) ) ( not ( = ?auto_390724 ?auto_390730 ) ) ( not ( = ?auto_390724 ?auto_390731 ) ) ( not ( = ?auto_390724 ?auto_390732 ) ) ( not ( = ?auto_390724 ?auto_390733 ) ) ( not ( = ?auto_390724 ?auto_390734 ) ) ( not ( = ?auto_390724 ?auto_390735 ) ) ( not ( = ?auto_390724 ?auto_390736 ) ) ( not ( = ?auto_390724 ?auto_390737 ) ) ( not ( = ?auto_390725 ?auto_390726 ) ) ( not ( = ?auto_390725 ?auto_390727 ) ) ( not ( = ?auto_390725 ?auto_390728 ) ) ( not ( = ?auto_390725 ?auto_390729 ) ) ( not ( = ?auto_390725 ?auto_390730 ) ) ( not ( = ?auto_390725 ?auto_390731 ) ) ( not ( = ?auto_390725 ?auto_390732 ) ) ( not ( = ?auto_390725 ?auto_390733 ) ) ( not ( = ?auto_390725 ?auto_390734 ) ) ( not ( = ?auto_390725 ?auto_390735 ) ) ( not ( = ?auto_390725 ?auto_390736 ) ) ( not ( = ?auto_390725 ?auto_390737 ) ) ( not ( = ?auto_390726 ?auto_390727 ) ) ( not ( = ?auto_390726 ?auto_390728 ) ) ( not ( = ?auto_390726 ?auto_390729 ) ) ( not ( = ?auto_390726 ?auto_390730 ) ) ( not ( = ?auto_390726 ?auto_390731 ) ) ( not ( = ?auto_390726 ?auto_390732 ) ) ( not ( = ?auto_390726 ?auto_390733 ) ) ( not ( = ?auto_390726 ?auto_390734 ) ) ( not ( = ?auto_390726 ?auto_390735 ) ) ( not ( = ?auto_390726 ?auto_390736 ) ) ( not ( = ?auto_390726 ?auto_390737 ) ) ( not ( = ?auto_390727 ?auto_390728 ) ) ( not ( = ?auto_390727 ?auto_390729 ) ) ( not ( = ?auto_390727 ?auto_390730 ) ) ( not ( = ?auto_390727 ?auto_390731 ) ) ( not ( = ?auto_390727 ?auto_390732 ) ) ( not ( = ?auto_390727 ?auto_390733 ) ) ( not ( = ?auto_390727 ?auto_390734 ) ) ( not ( = ?auto_390727 ?auto_390735 ) ) ( not ( = ?auto_390727 ?auto_390736 ) ) ( not ( = ?auto_390727 ?auto_390737 ) ) ( not ( = ?auto_390728 ?auto_390729 ) ) ( not ( = ?auto_390728 ?auto_390730 ) ) ( not ( = ?auto_390728 ?auto_390731 ) ) ( not ( = ?auto_390728 ?auto_390732 ) ) ( not ( = ?auto_390728 ?auto_390733 ) ) ( not ( = ?auto_390728 ?auto_390734 ) ) ( not ( = ?auto_390728 ?auto_390735 ) ) ( not ( = ?auto_390728 ?auto_390736 ) ) ( not ( = ?auto_390728 ?auto_390737 ) ) ( not ( = ?auto_390729 ?auto_390730 ) ) ( not ( = ?auto_390729 ?auto_390731 ) ) ( not ( = ?auto_390729 ?auto_390732 ) ) ( not ( = ?auto_390729 ?auto_390733 ) ) ( not ( = ?auto_390729 ?auto_390734 ) ) ( not ( = ?auto_390729 ?auto_390735 ) ) ( not ( = ?auto_390729 ?auto_390736 ) ) ( not ( = ?auto_390729 ?auto_390737 ) ) ( not ( = ?auto_390730 ?auto_390731 ) ) ( not ( = ?auto_390730 ?auto_390732 ) ) ( not ( = ?auto_390730 ?auto_390733 ) ) ( not ( = ?auto_390730 ?auto_390734 ) ) ( not ( = ?auto_390730 ?auto_390735 ) ) ( not ( = ?auto_390730 ?auto_390736 ) ) ( not ( = ?auto_390730 ?auto_390737 ) ) ( not ( = ?auto_390731 ?auto_390732 ) ) ( not ( = ?auto_390731 ?auto_390733 ) ) ( not ( = ?auto_390731 ?auto_390734 ) ) ( not ( = ?auto_390731 ?auto_390735 ) ) ( not ( = ?auto_390731 ?auto_390736 ) ) ( not ( = ?auto_390731 ?auto_390737 ) ) ( not ( = ?auto_390732 ?auto_390733 ) ) ( not ( = ?auto_390732 ?auto_390734 ) ) ( not ( = ?auto_390732 ?auto_390735 ) ) ( not ( = ?auto_390732 ?auto_390736 ) ) ( not ( = ?auto_390732 ?auto_390737 ) ) ( not ( = ?auto_390733 ?auto_390734 ) ) ( not ( = ?auto_390733 ?auto_390735 ) ) ( not ( = ?auto_390733 ?auto_390736 ) ) ( not ( = ?auto_390733 ?auto_390737 ) ) ( not ( = ?auto_390734 ?auto_390735 ) ) ( not ( = ?auto_390734 ?auto_390736 ) ) ( not ( = ?auto_390734 ?auto_390737 ) ) ( not ( = ?auto_390735 ?auto_390736 ) ) ( not ( = ?auto_390735 ?auto_390737 ) ) ( not ( = ?auto_390736 ?auto_390737 ) ) ( ON ?auto_390735 ?auto_390736 ) ( ON ?auto_390734 ?auto_390735 ) ( ON ?auto_390733 ?auto_390734 ) ( ON ?auto_390732 ?auto_390733 ) ( ON ?auto_390731 ?auto_390732 ) ( ON ?auto_390730 ?auto_390731 ) ( ON ?auto_390729 ?auto_390730 ) ( ON ?auto_390728 ?auto_390729 ) ( CLEAR ?auto_390726 ) ( ON ?auto_390727 ?auto_390728 ) ( CLEAR ?auto_390727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_390723 ?auto_390724 ?auto_390725 ?auto_390726 ?auto_390727 )
      ( MAKE-14PILE ?auto_390723 ?auto_390724 ?auto_390725 ?auto_390726 ?auto_390727 ?auto_390728 ?auto_390729 ?auto_390730 ?auto_390731 ?auto_390732 ?auto_390733 ?auto_390734 ?auto_390735 ?auto_390736 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390752 - BLOCK
      ?auto_390753 - BLOCK
      ?auto_390754 - BLOCK
      ?auto_390755 - BLOCK
      ?auto_390756 - BLOCK
      ?auto_390757 - BLOCK
      ?auto_390758 - BLOCK
      ?auto_390759 - BLOCK
      ?auto_390760 - BLOCK
      ?auto_390761 - BLOCK
      ?auto_390762 - BLOCK
      ?auto_390763 - BLOCK
      ?auto_390764 - BLOCK
      ?auto_390765 - BLOCK
    )
    :vars
    (
      ?auto_390766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390765 ?auto_390766 ) ( ON-TABLE ?auto_390752 ) ( ON ?auto_390753 ?auto_390752 ) ( ON ?auto_390754 ?auto_390753 ) ( not ( = ?auto_390752 ?auto_390753 ) ) ( not ( = ?auto_390752 ?auto_390754 ) ) ( not ( = ?auto_390752 ?auto_390755 ) ) ( not ( = ?auto_390752 ?auto_390756 ) ) ( not ( = ?auto_390752 ?auto_390757 ) ) ( not ( = ?auto_390752 ?auto_390758 ) ) ( not ( = ?auto_390752 ?auto_390759 ) ) ( not ( = ?auto_390752 ?auto_390760 ) ) ( not ( = ?auto_390752 ?auto_390761 ) ) ( not ( = ?auto_390752 ?auto_390762 ) ) ( not ( = ?auto_390752 ?auto_390763 ) ) ( not ( = ?auto_390752 ?auto_390764 ) ) ( not ( = ?auto_390752 ?auto_390765 ) ) ( not ( = ?auto_390752 ?auto_390766 ) ) ( not ( = ?auto_390753 ?auto_390754 ) ) ( not ( = ?auto_390753 ?auto_390755 ) ) ( not ( = ?auto_390753 ?auto_390756 ) ) ( not ( = ?auto_390753 ?auto_390757 ) ) ( not ( = ?auto_390753 ?auto_390758 ) ) ( not ( = ?auto_390753 ?auto_390759 ) ) ( not ( = ?auto_390753 ?auto_390760 ) ) ( not ( = ?auto_390753 ?auto_390761 ) ) ( not ( = ?auto_390753 ?auto_390762 ) ) ( not ( = ?auto_390753 ?auto_390763 ) ) ( not ( = ?auto_390753 ?auto_390764 ) ) ( not ( = ?auto_390753 ?auto_390765 ) ) ( not ( = ?auto_390753 ?auto_390766 ) ) ( not ( = ?auto_390754 ?auto_390755 ) ) ( not ( = ?auto_390754 ?auto_390756 ) ) ( not ( = ?auto_390754 ?auto_390757 ) ) ( not ( = ?auto_390754 ?auto_390758 ) ) ( not ( = ?auto_390754 ?auto_390759 ) ) ( not ( = ?auto_390754 ?auto_390760 ) ) ( not ( = ?auto_390754 ?auto_390761 ) ) ( not ( = ?auto_390754 ?auto_390762 ) ) ( not ( = ?auto_390754 ?auto_390763 ) ) ( not ( = ?auto_390754 ?auto_390764 ) ) ( not ( = ?auto_390754 ?auto_390765 ) ) ( not ( = ?auto_390754 ?auto_390766 ) ) ( not ( = ?auto_390755 ?auto_390756 ) ) ( not ( = ?auto_390755 ?auto_390757 ) ) ( not ( = ?auto_390755 ?auto_390758 ) ) ( not ( = ?auto_390755 ?auto_390759 ) ) ( not ( = ?auto_390755 ?auto_390760 ) ) ( not ( = ?auto_390755 ?auto_390761 ) ) ( not ( = ?auto_390755 ?auto_390762 ) ) ( not ( = ?auto_390755 ?auto_390763 ) ) ( not ( = ?auto_390755 ?auto_390764 ) ) ( not ( = ?auto_390755 ?auto_390765 ) ) ( not ( = ?auto_390755 ?auto_390766 ) ) ( not ( = ?auto_390756 ?auto_390757 ) ) ( not ( = ?auto_390756 ?auto_390758 ) ) ( not ( = ?auto_390756 ?auto_390759 ) ) ( not ( = ?auto_390756 ?auto_390760 ) ) ( not ( = ?auto_390756 ?auto_390761 ) ) ( not ( = ?auto_390756 ?auto_390762 ) ) ( not ( = ?auto_390756 ?auto_390763 ) ) ( not ( = ?auto_390756 ?auto_390764 ) ) ( not ( = ?auto_390756 ?auto_390765 ) ) ( not ( = ?auto_390756 ?auto_390766 ) ) ( not ( = ?auto_390757 ?auto_390758 ) ) ( not ( = ?auto_390757 ?auto_390759 ) ) ( not ( = ?auto_390757 ?auto_390760 ) ) ( not ( = ?auto_390757 ?auto_390761 ) ) ( not ( = ?auto_390757 ?auto_390762 ) ) ( not ( = ?auto_390757 ?auto_390763 ) ) ( not ( = ?auto_390757 ?auto_390764 ) ) ( not ( = ?auto_390757 ?auto_390765 ) ) ( not ( = ?auto_390757 ?auto_390766 ) ) ( not ( = ?auto_390758 ?auto_390759 ) ) ( not ( = ?auto_390758 ?auto_390760 ) ) ( not ( = ?auto_390758 ?auto_390761 ) ) ( not ( = ?auto_390758 ?auto_390762 ) ) ( not ( = ?auto_390758 ?auto_390763 ) ) ( not ( = ?auto_390758 ?auto_390764 ) ) ( not ( = ?auto_390758 ?auto_390765 ) ) ( not ( = ?auto_390758 ?auto_390766 ) ) ( not ( = ?auto_390759 ?auto_390760 ) ) ( not ( = ?auto_390759 ?auto_390761 ) ) ( not ( = ?auto_390759 ?auto_390762 ) ) ( not ( = ?auto_390759 ?auto_390763 ) ) ( not ( = ?auto_390759 ?auto_390764 ) ) ( not ( = ?auto_390759 ?auto_390765 ) ) ( not ( = ?auto_390759 ?auto_390766 ) ) ( not ( = ?auto_390760 ?auto_390761 ) ) ( not ( = ?auto_390760 ?auto_390762 ) ) ( not ( = ?auto_390760 ?auto_390763 ) ) ( not ( = ?auto_390760 ?auto_390764 ) ) ( not ( = ?auto_390760 ?auto_390765 ) ) ( not ( = ?auto_390760 ?auto_390766 ) ) ( not ( = ?auto_390761 ?auto_390762 ) ) ( not ( = ?auto_390761 ?auto_390763 ) ) ( not ( = ?auto_390761 ?auto_390764 ) ) ( not ( = ?auto_390761 ?auto_390765 ) ) ( not ( = ?auto_390761 ?auto_390766 ) ) ( not ( = ?auto_390762 ?auto_390763 ) ) ( not ( = ?auto_390762 ?auto_390764 ) ) ( not ( = ?auto_390762 ?auto_390765 ) ) ( not ( = ?auto_390762 ?auto_390766 ) ) ( not ( = ?auto_390763 ?auto_390764 ) ) ( not ( = ?auto_390763 ?auto_390765 ) ) ( not ( = ?auto_390763 ?auto_390766 ) ) ( not ( = ?auto_390764 ?auto_390765 ) ) ( not ( = ?auto_390764 ?auto_390766 ) ) ( not ( = ?auto_390765 ?auto_390766 ) ) ( ON ?auto_390764 ?auto_390765 ) ( ON ?auto_390763 ?auto_390764 ) ( ON ?auto_390762 ?auto_390763 ) ( ON ?auto_390761 ?auto_390762 ) ( ON ?auto_390760 ?auto_390761 ) ( ON ?auto_390759 ?auto_390760 ) ( ON ?auto_390758 ?auto_390759 ) ( ON ?auto_390757 ?auto_390758 ) ( ON ?auto_390756 ?auto_390757 ) ( CLEAR ?auto_390754 ) ( ON ?auto_390755 ?auto_390756 ) ( CLEAR ?auto_390755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_390752 ?auto_390753 ?auto_390754 ?auto_390755 )
      ( MAKE-14PILE ?auto_390752 ?auto_390753 ?auto_390754 ?auto_390755 ?auto_390756 ?auto_390757 ?auto_390758 ?auto_390759 ?auto_390760 ?auto_390761 ?auto_390762 ?auto_390763 ?auto_390764 ?auto_390765 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390781 - BLOCK
      ?auto_390782 - BLOCK
      ?auto_390783 - BLOCK
      ?auto_390784 - BLOCK
      ?auto_390785 - BLOCK
      ?auto_390786 - BLOCK
      ?auto_390787 - BLOCK
      ?auto_390788 - BLOCK
      ?auto_390789 - BLOCK
      ?auto_390790 - BLOCK
      ?auto_390791 - BLOCK
      ?auto_390792 - BLOCK
      ?auto_390793 - BLOCK
      ?auto_390794 - BLOCK
    )
    :vars
    (
      ?auto_390795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390794 ?auto_390795 ) ( ON-TABLE ?auto_390781 ) ( ON ?auto_390782 ?auto_390781 ) ( ON ?auto_390783 ?auto_390782 ) ( not ( = ?auto_390781 ?auto_390782 ) ) ( not ( = ?auto_390781 ?auto_390783 ) ) ( not ( = ?auto_390781 ?auto_390784 ) ) ( not ( = ?auto_390781 ?auto_390785 ) ) ( not ( = ?auto_390781 ?auto_390786 ) ) ( not ( = ?auto_390781 ?auto_390787 ) ) ( not ( = ?auto_390781 ?auto_390788 ) ) ( not ( = ?auto_390781 ?auto_390789 ) ) ( not ( = ?auto_390781 ?auto_390790 ) ) ( not ( = ?auto_390781 ?auto_390791 ) ) ( not ( = ?auto_390781 ?auto_390792 ) ) ( not ( = ?auto_390781 ?auto_390793 ) ) ( not ( = ?auto_390781 ?auto_390794 ) ) ( not ( = ?auto_390781 ?auto_390795 ) ) ( not ( = ?auto_390782 ?auto_390783 ) ) ( not ( = ?auto_390782 ?auto_390784 ) ) ( not ( = ?auto_390782 ?auto_390785 ) ) ( not ( = ?auto_390782 ?auto_390786 ) ) ( not ( = ?auto_390782 ?auto_390787 ) ) ( not ( = ?auto_390782 ?auto_390788 ) ) ( not ( = ?auto_390782 ?auto_390789 ) ) ( not ( = ?auto_390782 ?auto_390790 ) ) ( not ( = ?auto_390782 ?auto_390791 ) ) ( not ( = ?auto_390782 ?auto_390792 ) ) ( not ( = ?auto_390782 ?auto_390793 ) ) ( not ( = ?auto_390782 ?auto_390794 ) ) ( not ( = ?auto_390782 ?auto_390795 ) ) ( not ( = ?auto_390783 ?auto_390784 ) ) ( not ( = ?auto_390783 ?auto_390785 ) ) ( not ( = ?auto_390783 ?auto_390786 ) ) ( not ( = ?auto_390783 ?auto_390787 ) ) ( not ( = ?auto_390783 ?auto_390788 ) ) ( not ( = ?auto_390783 ?auto_390789 ) ) ( not ( = ?auto_390783 ?auto_390790 ) ) ( not ( = ?auto_390783 ?auto_390791 ) ) ( not ( = ?auto_390783 ?auto_390792 ) ) ( not ( = ?auto_390783 ?auto_390793 ) ) ( not ( = ?auto_390783 ?auto_390794 ) ) ( not ( = ?auto_390783 ?auto_390795 ) ) ( not ( = ?auto_390784 ?auto_390785 ) ) ( not ( = ?auto_390784 ?auto_390786 ) ) ( not ( = ?auto_390784 ?auto_390787 ) ) ( not ( = ?auto_390784 ?auto_390788 ) ) ( not ( = ?auto_390784 ?auto_390789 ) ) ( not ( = ?auto_390784 ?auto_390790 ) ) ( not ( = ?auto_390784 ?auto_390791 ) ) ( not ( = ?auto_390784 ?auto_390792 ) ) ( not ( = ?auto_390784 ?auto_390793 ) ) ( not ( = ?auto_390784 ?auto_390794 ) ) ( not ( = ?auto_390784 ?auto_390795 ) ) ( not ( = ?auto_390785 ?auto_390786 ) ) ( not ( = ?auto_390785 ?auto_390787 ) ) ( not ( = ?auto_390785 ?auto_390788 ) ) ( not ( = ?auto_390785 ?auto_390789 ) ) ( not ( = ?auto_390785 ?auto_390790 ) ) ( not ( = ?auto_390785 ?auto_390791 ) ) ( not ( = ?auto_390785 ?auto_390792 ) ) ( not ( = ?auto_390785 ?auto_390793 ) ) ( not ( = ?auto_390785 ?auto_390794 ) ) ( not ( = ?auto_390785 ?auto_390795 ) ) ( not ( = ?auto_390786 ?auto_390787 ) ) ( not ( = ?auto_390786 ?auto_390788 ) ) ( not ( = ?auto_390786 ?auto_390789 ) ) ( not ( = ?auto_390786 ?auto_390790 ) ) ( not ( = ?auto_390786 ?auto_390791 ) ) ( not ( = ?auto_390786 ?auto_390792 ) ) ( not ( = ?auto_390786 ?auto_390793 ) ) ( not ( = ?auto_390786 ?auto_390794 ) ) ( not ( = ?auto_390786 ?auto_390795 ) ) ( not ( = ?auto_390787 ?auto_390788 ) ) ( not ( = ?auto_390787 ?auto_390789 ) ) ( not ( = ?auto_390787 ?auto_390790 ) ) ( not ( = ?auto_390787 ?auto_390791 ) ) ( not ( = ?auto_390787 ?auto_390792 ) ) ( not ( = ?auto_390787 ?auto_390793 ) ) ( not ( = ?auto_390787 ?auto_390794 ) ) ( not ( = ?auto_390787 ?auto_390795 ) ) ( not ( = ?auto_390788 ?auto_390789 ) ) ( not ( = ?auto_390788 ?auto_390790 ) ) ( not ( = ?auto_390788 ?auto_390791 ) ) ( not ( = ?auto_390788 ?auto_390792 ) ) ( not ( = ?auto_390788 ?auto_390793 ) ) ( not ( = ?auto_390788 ?auto_390794 ) ) ( not ( = ?auto_390788 ?auto_390795 ) ) ( not ( = ?auto_390789 ?auto_390790 ) ) ( not ( = ?auto_390789 ?auto_390791 ) ) ( not ( = ?auto_390789 ?auto_390792 ) ) ( not ( = ?auto_390789 ?auto_390793 ) ) ( not ( = ?auto_390789 ?auto_390794 ) ) ( not ( = ?auto_390789 ?auto_390795 ) ) ( not ( = ?auto_390790 ?auto_390791 ) ) ( not ( = ?auto_390790 ?auto_390792 ) ) ( not ( = ?auto_390790 ?auto_390793 ) ) ( not ( = ?auto_390790 ?auto_390794 ) ) ( not ( = ?auto_390790 ?auto_390795 ) ) ( not ( = ?auto_390791 ?auto_390792 ) ) ( not ( = ?auto_390791 ?auto_390793 ) ) ( not ( = ?auto_390791 ?auto_390794 ) ) ( not ( = ?auto_390791 ?auto_390795 ) ) ( not ( = ?auto_390792 ?auto_390793 ) ) ( not ( = ?auto_390792 ?auto_390794 ) ) ( not ( = ?auto_390792 ?auto_390795 ) ) ( not ( = ?auto_390793 ?auto_390794 ) ) ( not ( = ?auto_390793 ?auto_390795 ) ) ( not ( = ?auto_390794 ?auto_390795 ) ) ( ON ?auto_390793 ?auto_390794 ) ( ON ?auto_390792 ?auto_390793 ) ( ON ?auto_390791 ?auto_390792 ) ( ON ?auto_390790 ?auto_390791 ) ( ON ?auto_390789 ?auto_390790 ) ( ON ?auto_390788 ?auto_390789 ) ( ON ?auto_390787 ?auto_390788 ) ( ON ?auto_390786 ?auto_390787 ) ( ON ?auto_390785 ?auto_390786 ) ( CLEAR ?auto_390783 ) ( ON ?auto_390784 ?auto_390785 ) ( CLEAR ?auto_390784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_390781 ?auto_390782 ?auto_390783 ?auto_390784 )
      ( MAKE-14PILE ?auto_390781 ?auto_390782 ?auto_390783 ?auto_390784 ?auto_390785 ?auto_390786 ?auto_390787 ?auto_390788 ?auto_390789 ?auto_390790 ?auto_390791 ?auto_390792 ?auto_390793 ?auto_390794 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390810 - BLOCK
      ?auto_390811 - BLOCK
      ?auto_390812 - BLOCK
      ?auto_390813 - BLOCK
      ?auto_390814 - BLOCK
      ?auto_390815 - BLOCK
      ?auto_390816 - BLOCK
      ?auto_390817 - BLOCK
      ?auto_390818 - BLOCK
      ?auto_390819 - BLOCK
      ?auto_390820 - BLOCK
      ?auto_390821 - BLOCK
      ?auto_390822 - BLOCK
      ?auto_390823 - BLOCK
    )
    :vars
    (
      ?auto_390824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390823 ?auto_390824 ) ( ON-TABLE ?auto_390810 ) ( ON ?auto_390811 ?auto_390810 ) ( not ( = ?auto_390810 ?auto_390811 ) ) ( not ( = ?auto_390810 ?auto_390812 ) ) ( not ( = ?auto_390810 ?auto_390813 ) ) ( not ( = ?auto_390810 ?auto_390814 ) ) ( not ( = ?auto_390810 ?auto_390815 ) ) ( not ( = ?auto_390810 ?auto_390816 ) ) ( not ( = ?auto_390810 ?auto_390817 ) ) ( not ( = ?auto_390810 ?auto_390818 ) ) ( not ( = ?auto_390810 ?auto_390819 ) ) ( not ( = ?auto_390810 ?auto_390820 ) ) ( not ( = ?auto_390810 ?auto_390821 ) ) ( not ( = ?auto_390810 ?auto_390822 ) ) ( not ( = ?auto_390810 ?auto_390823 ) ) ( not ( = ?auto_390810 ?auto_390824 ) ) ( not ( = ?auto_390811 ?auto_390812 ) ) ( not ( = ?auto_390811 ?auto_390813 ) ) ( not ( = ?auto_390811 ?auto_390814 ) ) ( not ( = ?auto_390811 ?auto_390815 ) ) ( not ( = ?auto_390811 ?auto_390816 ) ) ( not ( = ?auto_390811 ?auto_390817 ) ) ( not ( = ?auto_390811 ?auto_390818 ) ) ( not ( = ?auto_390811 ?auto_390819 ) ) ( not ( = ?auto_390811 ?auto_390820 ) ) ( not ( = ?auto_390811 ?auto_390821 ) ) ( not ( = ?auto_390811 ?auto_390822 ) ) ( not ( = ?auto_390811 ?auto_390823 ) ) ( not ( = ?auto_390811 ?auto_390824 ) ) ( not ( = ?auto_390812 ?auto_390813 ) ) ( not ( = ?auto_390812 ?auto_390814 ) ) ( not ( = ?auto_390812 ?auto_390815 ) ) ( not ( = ?auto_390812 ?auto_390816 ) ) ( not ( = ?auto_390812 ?auto_390817 ) ) ( not ( = ?auto_390812 ?auto_390818 ) ) ( not ( = ?auto_390812 ?auto_390819 ) ) ( not ( = ?auto_390812 ?auto_390820 ) ) ( not ( = ?auto_390812 ?auto_390821 ) ) ( not ( = ?auto_390812 ?auto_390822 ) ) ( not ( = ?auto_390812 ?auto_390823 ) ) ( not ( = ?auto_390812 ?auto_390824 ) ) ( not ( = ?auto_390813 ?auto_390814 ) ) ( not ( = ?auto_390813 ?auto_390815 ) ) ( not ( = ?auto_390813 ?auto_390816 ) ) ( not ( = ?auto_390813 ?auto_390817 ) ) ( not ( = ?auto_390813 ?auto_390818 ) ) ( not ( = ?auto_390813 ?auto_390819 ) ) ( not ( = ?auto_390813 ?auto_390820 ) ) ( not ( = ?auto_390813 ?auto_390821 ) ) ( not ( = ?auto_390813 ?auto_390822 ) ) ( not ( = ?auto_390813 ?auto_390823 ) ) ( not ( = ?auto_390813 ?auto_390824 ) ) ( not ( = ?auto_390814 ?auto_390815 ) ) ( not ( = ?auto_390814 ?auto_390816 ) ) ( not ( = ?auto_390814 ?auto_390817 ) ) ( not ( = ?auto_390814 ?auto_390818 ) ) ( not ( = ?auto_390814 ?auto_390819 ) ) ( not ( = ?auto_390814 ?auto_390820 ) ) ( not ( = ?auto_390814 ?auto_390821 ) ) ( not ( = ?auto_390814 ?auto_390822 ) ) ( not ( = ?auto_390814 ?auto_390823 ) ) ( not ( = ?auto_390814 ?auto_390824 ) ) ( not ( = ?auto_390815 ?auto_390816 ) ) ( not ( = ?auto_390815 ?auto_390817 ) ) ( not ( = ?auto_390815 ?auto_390818 ) ) ( not ( = ?auto_390815 ?auto_390819 ) ) ( not ( = ?auto_390815 ?auto_390820 ) ) ( not ( = ?auto_390815 ?auto_390821 ) ) ( not ( = ?auto_390815 ?auto_390822 ) ) ( not ( = ?auto_390815 ?auto_390823 ) ) ( not ( = ?auto_390815 ?auto_390824 ) ) ( not ( = ?auto_390816 ?auto_390817 ) ) ( not ( = ?auto_390816 ?auto_390818 ) ) ( not ( = ?auto_390816 ?auto_390819 ) ) ( not ( = ?auto_390816 ?auto_390820 ) ) ( not ( = ?auto_390816 ?auto_390821 ) ) ( not ( = ?auto_390816 ?auto_390822 ) ) ( not ( = ?auto_390816 ?auto_390823 ) ) ( not ( = ?auto_390816 ?auto_390824 ) ) ( not ( = ?auto_390817 ?auto_390818 ) ) ( not ( = ?auto_390817 ?auto_390819 ) ) ( not ( = ?auto_390817 ?auto_390820 ) ) ( not ( = ?auto_390817 ?auto_390821 ) ) ( not ( = ?auto_390817 ?auto_390822 ) ) ( not ( = ?auto_390817 ?auto_390823 ) ) ( not ( = ?auto_390817 ?auto_390824 ) ) ( not ( = ?auto_390818 ?auto_390819 ) ) ( not ( = ?auto_390818 ?auto_390820 ) ) ( not ( = ?auto_390818 ?auto_390821 ) ) ( not ( = ?auto_390818 ?auto_390822 ) ) ( not ( = ?auto_390818 ?auto_390823 ) ) ( not ( = ?auto_390818 ?auto_390824 ) ) ( not ( = ?auto_390819 ?auto_390820 ) ) ( not ( = ?auto_390819 ?auto_390821 ) ) ( not ( = ?auto_390819 ?auto_390822 ) ) ( not ( = ?auto_390819 ?auto_390823 ) ) ( not ( = ?auto_390819 ?auto_390824 ) ) ( not ( = ?auto_390820 ?auto_390821 ) ) ( not ( = ?auto_390820 ?auto_390822 ) ) ( not ( = ?auto_390820 ?auto_390823 ) ) ( not ( = ?auto_390820 ?auto_390824 ) ) ( not ( = ?auto_390821 ?auto_390822 ) ) ( not ( = ?auto_390821 ?auto_390823 ) ) ( not ( = ?auto_390821 ?auto_390824 ) ) ( not ( = ?auto_390822 ?auto_390823 ) ) ( not ( = ?auto_390822 ?auto_390824 ) ) ( not ( = ?auto_390823 ?auto_390824 ) ) ( ON ?auto_390822 ?auto_390823 ) ( ON ?auto_390821 ?auto_390822 ) ( ON ?auto_390820 ?auto_390821 ) ( ON ?auto_390819 ?auto_390820 ) ( ON ?auto_390818 ?auto_390819 ) ( ON ?auto_390817 ?auto_390818 ) ( ON ?auto_390816 ?auto_390817 ) ( ON ?auto_390815 ?auto_390816 ) ( ON ?auto_390814 ?auto_390815 ) ( ON ?auto_390813 ?auto_390814 ) ( CLEAR ?auto_390811 ) ( ON ?auto_390812 ?auto_390813 ) ( CLEAR ?auto_390812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390810 ?auto_390811 ?auto_390812 )
      ( MAKE-14PILE ?auto_390810 ?auto_390811 ?auto_390812 ?auto_390813 ?auto_390814 ?auto_390815 ?auto_390816 ?auto_390817 ?auto_390818 ?auto_390819 ?auto_390820 ?auto_390821 ?auto_390822 ?auto_390823 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390839 - BLOCK
      ?auto_390840 - BLOCK
      ?auto_390841 - BLOCK
      ?auto_390842 - BLOCK
      ?auto_390843 - BLOCK
      ?auto_390844 - BLOCK
      ?auto_390845 - BLOCK
      ?auto_390846 - BLOCK
      ?auto_390847 - BLOCK
      ?auto_390848 - BLOCK
      ?auto_390849 - BLOCK
      ?auto_390850 - BLOCK
      ?auto_390851 - BLOCK
      ?auto_390852 - BLOCK
    )
    :vars
    (
      ?auto_390853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390852 ?auto_390853 ) ( ON-TABLE ?auto_390839 ) ( ON ?auto_390840 ?auto_390839 ) ( not ( = ?auto_390839 ?auto_390840 ) ) ( not ( = ?auto_390839 ?auto_390841 ) ) ( not ( = ?auto_390839 ?auto_390842 ) ) ( not ( = ?auto_390839 ?auto_390843 ) ) ( not ( = ?auto_390839 ?auto_390844 ) ) ( not ( = ?auto_390839 ?auto_390845 ) ) ( not ( = ?auto_390839 ?auto_390846 ) ) ( not ( = ?auto_390839 ?auto_390847 ) ) ( not ( = ?auto_390839 ?auto_390848 ) ) ( not ( = ?auto_390839 ?auto_390849 ) ) ( not ( = ?auto_390839 ?auto_390850 ) ) ( not ( = ?auto_390839 ?auto_390851 ) ) ( not ( = ?auto_390839 ?auto_390852 ) ) ( not ( = ?auto_390839 ?auto_390853 ) ) ( not ( = ?auto_390840 ?auto_390841 ) ) ( not ( = ?auto_390840 ?auto_390842 ) ) ( not ( = ?auto_390840 ?auto_390843 ) ) ( not ( = ?auto_390840 ?auto_390844 ) ) ( not ( = ?auto_390840 ?auto_390845 ) ) ( not ( = ?auto_390840 ?auto_390846 ) ) ( not ( = ?auto_390840 ?auto_390847 ) ) ( not ( = ?auto_390840 ?auto_390848 ) ) ( not ( = ?auto_390840 ?auto_390849 ) ) ( not ( = ?auto_390840 ?auto_390850 ) ) ( not ( = ?auto_390840 ?auto_390851 ) ) ( not ( = ?auto_390840 ?auto_390852 ) ) ( not ( = ?auto_390840 ?auto_390853 ) ) ( not ( = ?auto_390841 ?auto_390842 ) ) ( not ( = ?auto_390841 ?auto_390843 ) ) ( not ( = ?auto_390841 ?auto_390844 ) ) ( not ( = ?auto_390841 ?auto_390845 ) ) ( not ( = ?auto_390841 ?auto_390846 ) ) ( not ( = ?auto_390841 ?auto_390847 ) ) ( not ( = ?auto_390841 ?auto_390848 ) ) ( not ( = ?auto_390841 ?auto_390849 ) ) ( not ( = ?auto_390841 ?auto_390850 ) ) ( not ( = ?auto_390841 ?auto_390851 ) ) ( not ( = ?auto_390841 ?auto_390852 ) ) ( not ( = ?auto_390841 ?auto_390853 ) ) ( not ( = ?auto_390842 ?auto_390843 ) ) ( not ( = ?auto_390842 ?auto_390844 ) ) ( not ( = ?auto_390842 ?auto_390845 ) ) ( not ( = ?auto_390842 ?auto_390846 ) ) ( not ( = ?auto_390842 ?auto_390847 ) ) ( not ( = ?auto_390842 ?auto_390848 ) ) ( not ( = ?auto_390842 ?auto_390849 ) ) ( not ( = ?auto_390842 ?auto_390850 ) ) ( not ( = ?auto_390842 ?auto_390851 ) ) ( not ( = ?auto_390842 ?auto_390852 ) ) ( not ( = ?auto_390842 ?auto_390853 ) ) ( not ( = ?auto_390843 ?auto_390844 ) ) ( not ( = ?auto_390843 ?auto_390845 ) ) ( not ( = ?auto_390843 ?auto_390846 ) ) ( not ( = ?auto_390843 ?auto_390847 ) ) ( not ( = ?auto_390843 ?auto_390848 ) ) ( not ( = ?auto_390843 ?auto_390849 ) ) ( not ( = ?auto_390843 ?auto_390850 ) ) ( not ( = ?auto_390843 ?auto_390851 ) ) ( not ( = ?auto_390843 ?auto_390852 ) ) ( not ( = ?auto_390843 ?auto_390853 ) ) ( not ( = ?auto_390844 ?auto_390845 ) ) ( not ( = ?auto_390844 ?auto_390846 ) ) ( not ( = ?auto_390844 ?auto_390847 ) ) ( not ( = ?auto_390844 ?auto_390848 ) ) ( not ( = ?auto_390844 ?auto_390849 ) ) ( not ( = ?auto_390844 ?auto_390850 ) ) ( not ( = ?auto_390844 ?auto_390851 ) ) ( not ( = ?auto_390844 ?auto_390852 ) ) ( not ( = ?auto_390844 ?auto_390853 ) ) ( not ( = ?auto_390845 ?auto_390846 ) ) ( not ( = ?auto_390845 ?auto_390847 ) ) ( not ( = ?auto_390845 ?auto_390848 ) ) ( not ( = ?auto_390845 ?auto_390849 ) ) ( not ( = ?auto_390845 ?auto_390850 ) ) ( not ( = ?auto_390845 ?auto_390851 ) ) ( not ( = ?auto_390845 ?auto_390852 ) ) ( not ( = ?auto_390845 ?auto_390853 ) ) ( not ( = ?auto_390846 ?auto_390847 ) ) ( not ( = ?auto_390846 ?auto_390848 ) ) ( not ( = ?auto_390846 ?auto_390849 ) ) ( not ( = ?auto_390846 ?auto_390850 ) ) ( not ( = ?auto_390846 ?auto_390851 ) ) ( not ( = ?auto_390846 ?auto_390852 ) ) ( not ( = ?auto_390846 ?auto_390853 ) ) ( not ( = ?auto_390847 ?auto_390848 ) ) ( not ( = ?auto_390847 ?auto_390849 ) ) ( not ( = ?auto_390847 ?auto_390850 ) ) ( not ( = ?auto_390847 ?auto_390851 ) ) ( not ( = ?auto_390847 ?auto_390852 ) ) ( not ( = ?auto_390847 ?auto_390853 ) ) ( not ( = ?auto_390848 ?auto_390849 ) ) ( not ( = ?auto_390848 ?auto_390850 ) ) ( not ( = ?auto_390848 ?auto_390851 ) ) ( not ( = ?auto_390848 ?auto_390852 ) ) ( not ( = ?auto_390848 ?auto_390853 ) ) ( not ( = ?auto_390849 ?auto_390850 ) ) ( not ( = ?auto_390849 ?auto_390851 ) ) ( not ( = ?auto_390849 ?auto_390852 ) ) ( not ( = ?auto_390849 ?auto_390853 ) ) ( not ( = ?auto_390850 ?auto_390851 ) ) ( not ( = ?auto_390850 ?auto_390852 ) ) ( not ( = ?auto_390850 ?auto_390853 ) ) ( not ( = ?auto_390851 ?auto_390852 ) ) ( not ( = ?auto_390851 ?auto_390853 ) ) ( not ( = ?auto_390852 ?auto_390853 ) ) ( ON ?auto_390851 ?auto_390852 ) ( ON ?auto_390850 ?auto_390851 ) ( ON ?auto_390849 ?auto_390850 ) ( ON ?auto_390848 ?auto_390849 ) ( ON ?auto_390847 ?auto_390848 ) ( ON ?auto_390846 ?auto_390847 ) ( ON ?auto_390845 ?auto_390846 ) ( ON ?auto_390844 ?auto_390845 ) ( ON ?auto_390843 ?auto_390844 ) ( ON ?auto_390842 ?auto_390843 ) ( CLEAR ?auto_390840 ) ( ON ?auto_390841 ?auto_390842 ) ( CLEAR ?auto_390841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_390839 ?auto_390840 ?auto_390841 )
      ( MAKE-14PILE ?auto_390839 ?auto_390840 ?auto_390841 ?auto_390842 ?auto_390843 ?auto_390844 ?auto_390845 ?auto_390846 ?auto_390847 ?auto_390848 ?auto_390849 ?auto_390850 ?auto_390851 ?auto_390852 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390868 - BLOCK
      ?auto_390869 - BLOCK
      ?auto_390870 - BLOCK
      ?auto_390871 - BLOCK
      ?auto_390872 - BLOCK
      ?auto_390873 - BLOCK
      ?auto_390874 - BLOCK
      ?auto_390875 - BLOCK
      ?auto_390876 - BLOCK
      ?auto_390877 - BLOCK
      ?auto_390878 - BLOCK
      ?auto_390879 - BLOCK
      ?auto_390880 - BLOCK
      ?auto_390881 - BLOCK
    )
    :vars
    (
      ?auto_390882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390881 ?auto_390882 ) ( ON-TABLE ?auto_390868 ) ( not ( = ?auto_390868 ?auto_390869 ) ) ( not ( = ?auto_390868 ?auto_390870 ) ) ( not ( = ?auto_390868 ?auto_390871 ) ) ( not ( = ?auto_390868 ?auto_390872 ) ) ( not ( = ?auto_390868 ?auto_390873 ) ) ( not ( = ?auto_390868 ?auto_390874 ) ) ( not ( = ?auto_390868 ?auto_390875 ) ) ( not ( = ?auto_390868 ?auto_390876 ) ) ( not ( = ?auto_390868 ?auto_390877 ) ) ( not ( = ?auto_390868 ?auto_390878 ) ) ( not ( = ?auto_390868 ?auto_390879 ) ) ( not ( = ?auto_390868 ?auto_390880 ) ) ( not ( = ?auto_390868 ?auto_390881 ) ) ( not ( = ?auto_390868 ?auto_390882 ) ) ( not ( = ?auto_390869 ?auto_390870 ) ) ( not ( = ?auto_390869 ?auto_390871 ) ) ( not ( = ?auto_390869 ?auto_390872 ) ) ( not ( = ?auto_390869 ?auto_390873 ) ) ( not ( = ?auto_390869 ?auto_390874 ) ) ( not ( = ?auto_390869 ?auto_390875 ) ) ( not ( = ?auto_390869 ?auto_390876 ) ) ( not ( = ?auto_390869 ?auto_390877 ) ) ( not ( = ?auto_390869 ?auto_390878 ) ) ( not ( = ?auto_390869 ?auto_390879 ) ) ( not ( = ?auto_390869 ?auto_390880 ) ) ( not ( = ?auto_390869 ?auto_390881 ) ) ( not ( = ?auto_390869 ?auto_390882 ) ) ( not ( = ?auto_390870 ?auto_390871 ) ) ( not ( = ?auto_390870 ?auto_390872 ) ) ( not ( = ?auto_390870 ?auto_390873 ) ) ( not ( = ?auto_390870 ?auto_390874 ) ) ( not ( = ?auto_390870 ?auto_390875 ) ) ( not ( = ?auto_390870 ?auto_390876 ) ) ( not ( = ?auto_390870 ?auto_390877 ) ) ( not ( = ?auto_390870 ?auto_390878 ) ) ( not ( = ?auto_390870 ?auto_390879 ) ) ( not ( = ?auto_390870 ?auto_390880 ) ) ( not ( = ?auto_390870 ?auto_390881 ) ) ( not ( = ?auto_390870 ?auto_390882 ) ) ( not ( = ?auto_390871 ?auto_390872 ) ) ( not ( = ?auto_390871 ?auto_390873 ) ) ( not ( = ?auto_390871 ?auto_390874 ) ) ( not ( = ?auto_390871 ?auto_390875 ) ) ( not ( = ?auto_390871 ?auto_390876 ) ) ( not ( = ?auto_390871 ?auto_390877 ) ) ( not ( = ?auto_390871 ?auto_390878 ) ) ( not ( = ?auto_390871 ?auto_390879 ) ) ( not ( = ?auto_390871 ?auto_390880 ) ) ( not ( = ?auto_390871 ?auto_390881 ) ) ( not ( = ?auto_390871 ?auto_390882 ) ) ( not ( = ?auto_390872 ?auto_390873 ) ) ( not ( = ?auto_390872 ?auto_390874 ) ) ( not ( = ?auto_390872 ?auto_390875 ) ) ( not ( = ?auto_390872 ?auto_390876 ) ) ( not ( = ?auto_390872 ?auto_390877 ) ) ( not ( = ?auto_390872 ?auto_390878 ) ) ( not ( = ?auto_390872 ?auto_390879 ) ) ( not ( = ?auto_390872 ?auto_390880 ) ) ( not ( = ?auto_390872 ?auto_390881 ) ) ( not ( = ?auto_390872 ?auto_390882 ) ) ( not ( = ?auto_390873 ?auto_390874 ) ) ( not ( = ?auto_390873 ?auto_390875 ) ) ( not ( = ?auto_390873 ?auto_390876 ) ) ( not ( = ?auto_390873 ?auto_390877 ) ) ( not ( = ?auto_390873 ?auto_390878 ) ) ( not ( = ?auto_390873 ?auto_390879 ) ) ( not ( = ?auto_390873 ?auto_390880 ) ) ( not ( = ?auto_390873 ?auto_390881 ) ) ( not ( = ?auto_390873 ?auto_390882 ) ) ( not ( = ?auto_390874 ?auto_390875 ) ) ( not ( = ?auto_390874 ?auto_390876 ) ) ( not ( = ?auto_390874 ?auto_390877 ) ) ( not ( = ?auto_390874 ?auto_390878 ) ) ( not ( = ?auto_390874 ?auto_390879 ) ) ( not ( = ?auto_390874 ?auto_390880 ) ) ( not ( = ?auto_390874 ?auto_390881 ) ) ( not ( = ?auto_390874 ?auto_390882 ) ) ( not ( = ?auto_390875 ?auto_390876 ) ) ( not ( = ?auto_390875 ?auto_390877 ) ) ( not ( = ?auto_390875 ?auto_390878 ) ) ( not ( = ?auto_390875 ?auto_390879 ) ) ( not ( = ?auto_390875 ?auto_390880 ) ) ( not ( = ?auto_390875 ?auto_390881 ) ) ( not ( = ?auto_390875 ?auto_390882 ) ) ( not ( = ?auto_390876 ?auto_390877 ) ) ( not ( = ?auto_390876 ?auto_390878 ) ) ( not ( = ?auto_390876 ?auto_390879 ) ) ( not ( = ?auto_390876 ?auto_390880 ) ) ( not ( = ?auto_390876 ?auto_390881 ) ) ( not ( = ?auto_390876 ?auto_390882 ) ) ( not ( = ?auto_390877 ?auto_390878 ) ) ( not ( = ?auto_390877 ?auto_390879 ) ) ( not ( = ?auto_390877 ?auto_390880 ) ) ( not ( = ?auto_390877 ?auto_390881 ) ) ( not ( = ?auto_390877 ?auto_390882 ) ) ( not ( = ?auto_390878 ?auto_390879 ) ) ( not ( = ?auto_390878 ?auto_390880 ) ) ( not ( = ?auto_390878 ?auto_390881 ) ) ( not ( = ?auto_390878 ?auto_390882 ) ) ( not ( = ?auto_390879 ?auto_390880 ) ) ( not ( = ?auto_390879 ?auto_390881 ) ) ( not ( = ?auto_390879 ?auto_390882 ) ) ( not ( = ?auto_390880 ?auto_390881 ) ) ( not ( = ?auto_390880 ?auto_390882 ) ) ( not ( = ?auto_390881 ?auto_390882 ) ) ( ON ?auto_390880 ?auto_390881 ) ( ON ?auto_390879 ?auto_390880 ) ( ON ?auto_390878 ?auto_390879 ) ( ON ?auto_390877 ?auto_390878 ) ( ON ?auto_390876 ?auto_390877 ) ( ON ?auto_390875 ?auto_390876 ) ( ON ?auto_390874 ?auto_390875 ) ( ON ?auto_390873 ?auto_390874 ) ( ON ?auto_390872 ?auto_390873 ) ( ON ?auto_390871 ?auto_390872 ) ( ON ?auto_390870 ?auto_390871 ) ( CLEAR ?auto_390868 ) ( ON ?auto_390869 ?auto_390870 ) ( CLEAR ?auto_390869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390868 ?auto_390869 )
      ( MAKE-14PILE ?auto_390868 ?auto_390869 ?auto_390870 ?auto_390871 ?auto_390872 ?auto_390873 ?auto_390874 ?auto_390875 ?auto_390876 ?auto_390877 ?auto_390878 ?auto_390879 ?auto_390880 ?auto_390881 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390897 - BLOCK
      ?auto_390898 - BLOCK
      ?auto_390899 - BLOCK
      ?auto_390900 - BLOCK
      ?auto_390901 - BLOCK
      ?auto_390902 - BLOCK
      ?auto_390903 - BLOCK
      ?auto_390904 - BLOCK
      ?auto_390905 - BLOCK
      ?auto_390906 - BLOCK
      ?auto_390907 - BLOCK
      ?auto_390908 - BLOCK
      ?auto_390909 - BLOCK
      ?auto_390910 - BLOCK
    )
    :vars
    (
      ?auto_390911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390910 ?auto_390911 ) ( ON-TABLE ?auto_390897 ) ( not ( = ?auto_390897 ?auto_390898 ) ) ( not ( = ?auto_390897 ?auto_390899 ) ) ( not ( = ?auto_390897 ?auto_390900 ) ) ( not ( = ?auto_390897 ?auto_390901 ) ) ( not ( = ?auto_390897 ?auto_390902 ) ) ( not ( = ?auto_390897 ?auto_390903 ) ) ( not ( = ?auto_390897 ?auto_390904 ) ) ( not ( = ?auto_390897 ?auto_390905 ) ) ( not ( = ?auto_390897 ?auto_390906 ) ) ( not ( = ?auto_390897 ?auto_390907 ) ) ( not ( = ?auto_390897 ?auto_390908 ) ) ( not ( = ?auto_390897 ?auto_390909 ) ) ( not ( = ?auto_390897 ?auto_390910 ) ) ( not ( = ?auto_390897 ?auto_390911 ) ) ( not ( = ?auto_390898 ?auto_390899 ) ) ( not ( = ?auto_390898 ?auto_390900 ) ) ( not ( = ?auto_390898 ?auto_390901 ) ) ( not ( = ?auto_390898 ?auto_390902 ) ) ( not ( = ?auto_390898 ?auto_390903 ) ) ( not ( = ?auto_390898 ?auto_390904 ) ) ( not ( = ?auto_390898 ?auto_390905 ) ) ( not ( = ?auto_390898 ?auto_390906 ) ) ( not ( = ?auto_390898 ?auto_390907 ) ) ( not ( = ?auto_390898 ?auto_390908 ) ) ( not ( = ?auto_390898 ?auto_390909 ) ) ( not ( = ?auto_390898 ?auto_390910 ) ) ( not ( = ?auto_390898 ?auto_390911 ) ) ( not ( = ?auto_390899 ?auto_390900 ) ) ( not ( = ?auto_390899 ?auto_390901 ) ) ( not ( = ?auto_390899 ?auto_390902 ) ) ( not ( = ?auto_390899 ?auto_390903 ) ) ( not ( = ?auto_390899 ?auto_390904 ) ) ( not ( = ?auto_390899 ?auto_390905 ) ) ( not ( = ?auto_390899 ?auto_390906 ) ) ( not ( = ?auto_390899 ?auto_390907 ) ) ( not ( = ?auto_390899 ?auto_390908 ) ) ( not ( = ?auto_390899 ?auto_390909 ) ) ( not ( = ?auto_390899 ?auto_390910 ) ) ( not ( = ?auto_390899 ?auto_390911 ) ) ( not ( = ?auto_390900 ?auto_390901 ) ) ( not ( = ?auto_390900 ?auto_390902 ) ) ( not ( = ?auto_390900 ?auto_390903 ) ) ( not ( = ?auto_390900 ?auto_390904 ) ) ( not ( = ?auto_390900 ?auto_390905 ) ) ( not ( = ?auto_390900 ?auto_390906 ) ) ( not ( = ?auto_390900 ?auto_390907 ) ) ( not ( = ?auto_390900 ?auto_390908 ) ) ( not ( = ?auto_390900 ?auto_390909 ) ) ( not ( = ?auto_390900 ?auto_390910 ) ) ( not ( = ?auto_390900 ?auto_390911 ) ) ( not ( = ?auto_390901 ?auto_390902 ) ) ( not ( = ?auto_390901 ?auto_390903 ) ) ( not ( = ?auto_390901 ?auto_390904 ) ) ( not ( = ?auto_390901 ?auto_390905 ) ) ( not ( = ?auto_390901 ?auto_390906 ) ) ( not ( = ?auto_390901 ?auto_390907 ) ) ( not ( = ?auto_390901 ?auto_390908 ) ) ( not ( = ?auto_390901 ?auto_390909 ) ) ( not ( = ?auto_390901 ?auto_390910 ) ) ( not ( = ?auto_390901 ?auto_390911 ) ) ( not ( = ?auto_390902 ?auto_390903 ) ) ( not ( = ?auto_390902 ?auto_390904 ) ) ( not ( = ?auto_390902 ?auto_390905 ) ) ( not ( = ?auto_390902 ?auto_390906 ) ) ( not ( = ?auto_390902 ?auto_390907 ) ) ( not ( = ?auto_390902 ?auto_390908 ) ) ( not ( = ?auto_390902 ?auto_390909 ) ) ( not ( = ?auto_390902 ?auto_390910 ) ) ( not ( = ?auto_390902 ?auto_390911 ) ) ( not ( = ?auto_390903 ?auto_390904 ) ) ( not ( = ?auto_390903 ?auto_390905 ) ) ( not ( = ?auto_390903 ?auto_390906 ) ) ( not ( = ?auto_390903 ?auto_390907 ) ) ( not ( = ?auto_390903 ?auto_390908 ) ) ( not ( = ?auto_390903 ?auto_390909 ) ) ( not ( = ?auto_390903 ?auto_390910 ) ) ( not ( = ?auto_390903 ?auto_390911 ) ) ( not ( = ?auto_390904 ?auto_390905 ) ) ( not ( = ?auto_390904 ?auto_390906 ) ) ( not ( = ?auto_390904 ?auto_390907 ) ) ( not ( = ?auto_390904 ?auto_390908 ) ) ( not ( = ?auto_390904 ?auto_390909 ) ) ( not ( = ?auto_390904 ?auto_390910 ) ) ( not ( = ?auto_390904 ?auto_390911 ) ) ( not ( = ?auto_390905 ?auto_390906 ) ) ( not ( = ?auto_390905 ?auto_390907 ) ) ( not ( = ?auto_390905 ?auto_390908 ) ) ( not ( = ?auto_390905 ?auto_390909 ) ) ( not ( = ?auto_390905 ?auto_390910 ) ) ( not ( = ?auto_390905 ?auto_390911 ) ) ( not ( = ?auto_390906 ?auto_390907 ) ) ( not ( = ?auto_390906 ?auto_390908 ) ) ( not ( = ?auto_390906 ?auto_390909 ) ) ( not ( = ?auto_390906 ?auto_390910 ) ) ( not ( = ?auto_390906 ?auto_390911 ) ) ( not ( = ?auto_390907 ?auto_390908 ) ) ( not ( = ?auto_390907 ?auto_390909 ) ) ( not ( = ?auto_390907 ?auto_390910 ) ) ( not ( = ?auto_390907 ?auto_390911 ) ) ( not ( = ?auto_390908 ?auto_390909 ) ) ( not ( = ?auto_390908 ?auto_390910 ) ) ( not ( = ?auto_390908 ?auto_390911 ) ) ( not ( = ?auto_390909 ?auto_390910 ) ) ( not ( = ?auto_390909 ?auto_390911 ) ) ( not ( = ?auto_390910 ?auto_390911 ) ) ( ON ?auto_390909 ?auto_390910 ) ( ON ?auto_390908 ?auto_390909 ) ( ON ?auto_390907 ?auto_390908 ) ( ON ?auto_390906 ?auto_390907 ) ( ON ?auto_390905 ?auto_390906 ) ( ON ?auto_390904 ?auto_390905 ) ( ON ?auto_390903 ?auto_390904 ) ( ON ?auto_390902 ?auto_390903 ) ( ON ?auto_390901 ?auto_390902 ) ( ON ?auto_390900 ?auto_390901 ) ( ON ?auto_390899 ?auto_390900 ) ( CLEAR ?auto_390897 ) ( ON ?auto_390898 ?auto_390899 ) ( CLEAR ?auto_390898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_390897 ?auto_390898 )
      ( MAKE-14PILE ?auto_390897 ?auto_390898 ?auto_390899 ?auto_390900 ?auto_390901 ?auto_390902 ?auto_390903 ?auto_390904 ?auto_390905 ?auto_390906 ?auto_390907 ?auto_390908 ?auto_390909 ?auto_390910 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390926 - BLOCK
      ?auto_390927 - BLOCK
      ?auto_390928 - BLOCK
      ?auto_390929 - BLOCK
      ?auto_390930 - BLOCK
      ?auto_390931 - BLOCK
      ?auto_390932 - BLOCK
      ?auto_390933 - BLOCK
      ?auto_390934 - BLOCK
      ?auto_390935 - BLOCK
      ?auto_390936 - BLOCK
      ?auto_390937 - BLOCK
      ?auto_390938 - BLOCK
      ?auto_390939 - BLOCK
    )
    :vars
    (
      ?auto_390940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390939 ?auto_390940 ) ( not ( = ?auto_390926 ?auto_390927 ) ) ( not ( = ?auto_390926 ?auto_390928 ) ) ( not ( = ?auto_390926 ?auto_390929 ) ) ( not ( = ?auto_390926 ?auto_390930 ) ) ( not ( = ?auto_390926 ?auto_390931 ) ) ( not ( = ?auto_390926 ?auto_390932 ) ) ( not ( = ?auto_390926 ?auto_390933 ) ) ( not ( = ?auto_390926 ?auto_390934 ) ) ( not ( = ?auto_390926 ?auto_390935 ) ) ( not ( = ?auto_390926 ?auto_390936 ) ) ( not ( = ?auto_390926 ?auto_390937 ) ) ( not ( = ?auto_390926 ?auto_390938 ) ) ( not ( = ?auto_390926 ?auto_390939 ) ) ( not ( = ?auto_390926 ?auto_390940 ) ) ( not ( = ?auto_390927 ?auto_390928 ) ) ( not ( = ?auto_390927 ?auto_390929 ) ) ( not ( = ?auto_390927 ?auto_390930 ) ) ( not ( = ?auto_390927 ?auto_390931 ) ) ( not ( = ?auto_390927 ?auto_390932 ) ) ( not ( = ?auto_390927 ?auto_390933 ) ) ( not ( = ?auto_390927 ?auto_390934 ) ) ( not ( = ?auto_390927 ?auto_390935 ) ) ( not ( = ?auto_390927 ?auto_390936 ) ) ( not ( = ?auto_390927 ?auto_390937 ) ) ( not ( = ?auto_390927 ?auto_390938 ) ) ( not ( = ?auto_390927 ?auto_390939 ) ) ( not ( = ?auto_390927 ?auto_390940 ) ) ( not ( = ?auto_390928 ?auto_390929 ) ) ( not ( = ?auto_390928 ?auto_390930 ) ) ( not ( = ?auto_390928 ?auto_390931 ) ) ( not ( = ?auto_390928 ?auto_390932 ) ) ( not ( = ?auto_390928 ?auto_390933 ) ) ( not ( = ?auto_390928 ?auto_390934 ) ) ( not ( = ?auto_390928 ?auto_390935 ) ) ( not ( = ?auto_390928 ?auto_390936 ) ) ( not ( = ?auto_390928 ?auto_390937 ) ) ( not ( = ?auto_390928 ?auto_390938 ) ) ( not ( = ?auto_390928 ?auto_390939 ) ) ( not ( = ?auto_390928 ?auto_390940 ) ) ( not ( = ?auto_390929 ?auto_390930 ) ) ( not ( = ?auto_390929 ?auto_390931 ) ) ( not ( = ?auto_390929 ?auto_390932 ) ) ( not ( = ?auto_390929 ?auto_390933 ) ) ( not ( = ?auto_390929 ?auto_390934 ) ) ( not ( = ?auto_390929 ?auto_390935 ) ) ( not ( = ?auto_390929 ?auto_390936 ) ) ( not ( = ?auto_390929 ?auto_390937 ) ) ( not ( = ?auto_390929 ?auto_390938 ) ) ( not ( = ?auto_390929 ?auto_390939 ) ) ( not ( = ?auto_390929 ?auto_390940 ) ) ( not ( = ?auto_390930 ?auto_390931 ) ) ( not ( = ?auto_390930 ?auto_390932 ) ) ( not ( = ?auto_390930 ?auto_390933 ) ) ( not ( = ?auto_390930 ?auto_390934 ) ) ( not ( = ?auto_390930 ?auto_390935 ) ) ( not ( = ?auto_390930 ?auto_390936 ) ) ( not ( = ?auto_390930 ?auto_390937 ) ) ( not ( = ?auto_390930 ?auto_390938 ) ) ( not ( = ?auto_390930 ?auto_390939 ) ) ( not ( = ?auto_390930 ?auto_390940 ) ) ( not ( = ?auto_390931 ?auto_390932 ) ) ( not ( = ?auto_390931 ?auto_390933 ) ) ( not ( = ?auto_390931 ?auto_390934 ) ) ( not ( = ?auto_390931 ?auto_390935 ) ) ( not ( = ?auto_390931 ?auto_390936 ) ) ( not ( = ?auto_390931 ?auto_390937 ) ) ( not ( = ?auto_390931 ?auto_390938 ) ) ( not ( = ?auto_390931 ?auto_390939 ) ) ( not ( = ?auto_390931 ?auto_390940 ) ) ( not ( = ?auto_390932 ?auto_390933 ) ) ( not ( = ?auto_390932 ?auto_390934 ) ) ( not ( = ?auto_390932 ?auto_390935 ) ) ( not ( = ?auto_390932 ?auto_390936 ) ) ( not ( = ?auto_390932 ?auto_390937 ) ) ( not ( = ?auto_390932 ?auto_390938 ) ) ( not ( = ?auto_390932 ?auto_390939 ) ) ( not ( = ?auto_390932 ?auto_390940 ) ) ( not ( = ?auto_390933 ?auto_390934 ) ) ( not ( = ?auto_390933 ?auto_390935 ) ) ( not ( = ?auto_390933 ?auto_390936 ) ) ( not ( = ?auto_390933 ?auto_390937 ) ) ( not ( = ?auto_390933 ?auto_390938 ) ) ( not ( = ?auto_390933 ?auto_390939 ) ) ( not ( = ?auto_390933 ?auto_390940 ) ) ( not ( = ?auto_390934 ?auto_390935 ) ) ( not ( = ?auto_390934 ?auto_390936 ) ) ( not ( = ?auto_390934 ?auto_390937 ) ) ( not ( = ?auto_390934 ?auto_390938 ) ) ( not ( = ?auto_390934 ?auto_390939 ) ) ( not ( = ?auto_390934 ?auto_390940 ) ) ( not ( = ?auto_390935 ?auto_390936 ) ) ( not ( = ?auto_390935 ?auto_390937 ) ) ( not ( = ?auto_390935 ?auto_390938 ) ) ( not ( = ?auto_390935 ?auto_390939 ) ) ( not ( = ?auto_390935 ?auto_390940 ) ) ( not ( = ?auto_390936 ?auto_390937 ) ) ( not ( = ?auto_390936 ?auto_390938 ) ) ( not ( = ?auto_390936 ?auto_390939 ) ) ( not ( = ?auto_390936 ?auto_390940 ) ) ( not ( = ?auto_390937 ?auto_390938 ) ) ( not ( = ?auto_390937 ?auto_390939 ) ) ( not ( = ?auto_390937 ?auto_390940 ) ) ( not ( = ?auto_390938 ?auto_390939 ) ) ( not ( = ?auto_390938 ?auto_390940 ) ) ( not ( = ?auto_390939 ?auto_390940 ) ) ( ON ?auto_390938 ?auto_390939 ) ( ON ?auto_390937 ?auto_390938 ) ( ON ?auto_390936 ?auto_390937 ) ( ON ?auto_390935 ?auto_390936 ) ( ON ?auto_390934 ?auto_390935 ) ( ON ?auto_390933 ?auto_390934 ) ( ON ?auto_390932 ?auto_390933 ) ( ON ?auto_390931 ?auto_390932 ) ( ON ?auto_390930 ?auto_390931 ) ( ON ?auto_390929 ?auto_390930 ) ( ON ?auto_390928 ?auto_390929 ) ( ON ?auto_390927 ?auto_390928 ) ( ON ?auto_390926 ?auto_390927 ) ( CLEAR ?auto_390926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390926 )
      ( MAKE-14PILE ?auto_390926 ?auto_390927 ?auto_390928 ?auto_390929 ?auto_390930 ?auto_390931 ?auto_390932 ?auto_390933 ?auto_390934 ?auto_390935 ?auto_390936 ?auto_390937 ?auto_390938 ?auto_390939 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_390955 - BLOCK
      ?auto_390956 - BLOCK
      ?auto_390957 - BLOCK
      ?auto_390958 - BLOCK
      ?auto_390959 - BLOCK
      ?auto_390960 - BLOCK
      ?auto_390961 - BLOCK
      ?auto_390962 - BLOCK
      ?auto_390963 - BLOCK
      ?auto_390964 - BLOCK
      ?auto_390965 - BLOCK
      ?auto_390966 - BLOCK
      ?auto_390967 - BLOCK
      ?auto_390968 - BLOCK
    )
    :vars
    (
      ?auto_390969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_390968 ?auto_390969 ) ( not ( = ?auto_390955 ?auto_390956 ) ) ( not ( = ?auto_390955 ?auto_390957 ) ) ( not ( = ?auto_390955 ?auto_390958 ) ) ( not ( = ?auto_390955 ?auto_390959 ) ) ( not ( = ?auto_390955 ?auto_390960 ) ) ( not ( = ?auto_390955 ?auto_390961 ) ) ( not ( = ?auto_390955 ?auto_390962 ) ) ( not ( = ?auto_390955 ?auto_390963 ) ) ( not ( = ?auto_390955 ?auto_390964 ) ) ( not ( = ?auto_390955 ?auto_390965 ) ) ( not ( = ?auto_390955 ?auto_390966 ) ) ( not ( = ?auto_390955 ?auto_390967 ) ) ( not ( = ?auto_390955 ?auto_390968 ) ) ( not ( = ?auto_390955 ?auto_390969 ) ) ( not ( = ?auto_390956 ?auto_390957 ) ) ( not ( = ?auto_390956 ?auto_390958 ) ) ( not ( = ?auto_390956 ?auto_390959 ) ) ( not ( = ?auto_390956 ?auto_390960 ) ) ( not ( = ?auto_390956 ?auto_390961 ) ) ( not ( = ?auto_390956 ?auto_390962 ) ) ( not ( = ?auto_390956 ?auto_390963 ) ) ( not ( = ?auto_390956 ?auto_390964 ) ) ( not ( = ?auto_390956 ?auto_390965 ) ) ( not ( = ?auto_390956 ?auto_390966 ) ) ( not ( = ?auto_390956 ?auto_390967 ) ) ( not ( = ?auto_390956 ?auto_390968 ) ) ( not ( = ?auto_390956 ?auto_390969 ) ) ( not ( = ?auto_390957 ?auto_390958 ) ) ( not ( = ?auto_390957 ?auto_390959 ) ) ( not ( = ?auto_390957 ?auto_390960 ) ) ( not ( = ?auto_390957 ?auto_390961 ) ) ( not ( = ?auto_390957 ?auto_390962 ) ) ( not ( = ?auto_390957 ?auto_390963 ) ) ( not ( = ?auto_390957 ?auto_390964 ) ) ( not ( = ?auto_390957 ?auto_390965 ) ) ( not ( = ?auto_390957 ?auto_390966 ) ) ( not ( = ?auto_390957 ?auto_390967 ) ) ( not ( = ?auto_390957 ?auto_390968 ) ) ( not ( = ?auto_390957 ?auto_390969 ) ) ( not ( = ?auto_390958 ?auto_390959 ) ) ( not ( = ?auto_390958 ?auto_390960 ) ) ( not ( = ?auto_390958 ?auto_390961 ) ) ( not ( = ?auto_390958 ?auto_390962 ) ) ( not ( = ?auto_390958 ?auto_390963 ) ) ( not ( = ?auto_390958 ?auto_390964 ) ) ( not ( = ?auto_390958 ?auto_390965 ) ) ( not ( = ?auto_390958 ?auto_390966 ) ) ( not ( = ?auto_390958 ?auto_390967 ) ) ( not ( = ?auto_390958 ?auto_390968 ) ) ( not ( = ?auto_390958 ?auto_390969 ) ) ( not ( = ?auto_390959 ?auto_390960 ) ) ( not ( = ?auto_390959 ?auto_390961 ) ) ( not ( = ?auto_390959 ?auto_390962 ) ) ( not ( = ?auto_390959 ?auto_390963 ) ) ( not ( = ?auto_390959 ?auto_390964 ) ) ( not ( = ?auto_390959 ?auto_390965 ) ) ( not ( = ?auto_390959 ?auto_390966 ) ) ( not ( = ?auto_390959 ?auto_390967 ) ) ( not ( = ?auto_390959 ?auto_390968 ) ) ( not ( = ?auto_390959 ?auto_390969 ) ) ( not ( = ?auto_390960 ?auto_390961 ) ) ( not ( = ?auto_390960 ?auto_390962 ) ) ( not ( = ?auto_390960 ?auto_390963 ) ) ( not ( = ?auto_390960 ?auto_390964 ) ) ( not ( = ?auto_390960 ?auto_390965 ) ) ( not ( = ?auto_390960 ?auto_390966 ) ) ( not ( = ?auto_390960 ?auto_390967 ) ) ( not ( = ?auto_390960 ?auto_390968 ) ) ( not ( = ?auto_390960 ?auto_390969 ) ) ( not ( = ?auto_390961 ?auto_390962 ) ) ( not ( = ?auto_390961 ?auto_390963 ) ) ( not ( = ?auto_390961 ?auto_390964 ) ) ( not ( = ?auto_390961 ?auto_390965 ) ) ( not ( = ?auto_390961 ?auto_390966 ) ) ( not ( = ?auto_390961 ?auto_390967 ) ) ( not ( = ?auto_390961 ?auto_390968 ) ) ( not ( = ?auto_390961 ?auto_390969 ) ) ( not ( = ?auto_390962 ?auto_390963 ) ) ( not ( = ?auto_390962 ?auto_390964 ) ) ( not ( = ?auto_390962 ?auto_390965 ) ) ( not ( = ?auto_390962 ?auto_390966 ) ) ( not ( = ?auto_390962 ?auto_390967 ) ) ( not ( = ?auto_390962 ?auto_390968 ) ) ( not ( = ?auto_390962 ?auto_390969 ) ) ( not ( = ?auto_390963 ?auto_390964 ) ) ( not ( = ?auto_390963 ?auto_390965 ) ) ( not ( = ?auto_390963 ?auto_390966 ) ) ( not ( = ?auto_390963 ?auto_390967 ) ) ( not ( = ?auto_390963 ?auto_390968 ) ) ( not ( = ?auto_390963 ?auto_390969 ) ) ( not ( = ?auto_390964 ?auto_390965 ) ) ( not ( = ?auto_390964 ?auto_390966 ) ) ( not ( = ?auto_390964 ?auto_390967 ) ) ( not ( = ?auto_390964 ?auto_390968 ) ) ( not ( = ?auto_390964 ?auto_390969 ) ) ( not ( = ?auto_390965 ?auto_390966 ) ) ( not ( = ?auto_390965 ?auto_390967 ) ) ( not ( = ?auto_390965 ?auto_390968 ) ) ( not ( = ?auto_390965 ?auto_390969 ) ) ( not ( = ?auto_390966 ?auto_390967 ) ) ( not ( = ?auto_390966 ?auto_390968 ) ) ( not ( = ?auto_390966 ?auto_390969 ) ) ( not ( = ?auto_390967 ?auto_390968 ) ) ( not ( = ?auto_390967 ?auto_390969 ) ) ( not ( = ?auto_390968 ?auto_390969 ) ) ( ON ?auto_390967 ?auto_390968 ) ( ON ?auto_390966 ?auto_390967 ) ( ON ?auto_390965 ?auto_390966 ) ( ON ?auto_390964 ?auto_390965 ) ( ON ?auto_390963 ?auto_390964 ) ( ON ?auto_390962 ?auto_390963 ) ( ON ?auto_390961 ?auto_390962 ) ( ON ?auto_390960 ?auto_390961 ) ( ON ?auto_390959 ?auto_390960 ) ( ON ?auto_390958 ?auto_390959 ) ( ON ?auto_390957 ?auto_390958 ) ( ON ?auto_390956 ?auto_390957 ) ( ON ?auto_390955 ?auto_390956 ) ( CLEAR ?auto_390955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_390955 )
      ( MAKE-14PILE ?auto_390955 ?auto_390956 ?auto_390957 ?auto_390958 ?auto_390959 ?auto_390960 ?auto_390961 ?auto_390962 ?auto_390963 ?auto_390964 ?auto_390965 ?auto_390966 ?auto_390967 ?auto_390968 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_390985 - BLOCK
      ?auto_390986 - BLOCK
      ?auto_390987 - BLOCK
      ?auto_390988 - BLOCK
      ?auto_390989 - BLOCK
      ?auto_390990 - BLOCK
      ?auto_390991 - BLOCK
      ?auto_390992 - BLOCK
      ?auto_390993 - BLOCK
      ?auto_390994 - BLOCK
      ?auto_390995 - BLOCK
      ?auto_390996 - BLOCK
      ?auto_390997 - BLOCK
      ?auto_390998 - BLOCK
      ?auto_390999 - BLOCK
    )
    :vars
    (
      ?auto_391000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_390998 ) ( ON ?auto_390999 ?auto_391000 ) ( CLEAR ?auto_390999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_390985 ) ( ON ?auto_390986 ?auto_390985 ) ( ON ?auto_390987 ?auto_390986 ) ( ON ?auto_390988 ?auto_390987 ) ( ON ?auto_390989 ?auto_390988 ) ( ON ?auto_390990 ?auto_390989 ) ( ON ?auto_390991 ?auto_390990 ) ( ON ?auto_390992 ?auto_390991 ) ( ON ?auto_390993 ?auto_390992 ) ( ON ?auto_390994 ?auto_390993 ) ( ON ?auto_390995 ?auto_390994 ) ( ON ?auto_390996 ?auto_390995 ) ( ON ?auto_390997 ?auto_390996 ) ( ON ?auto_390998 ?auto_390997 ) ( not ( = ?auto_390985 ?auto_390986 ) ) ( not ( = ?auto_390985 ?auto_390987 ) ) ( not ( = ?auto_390985 ?auto_390988 ) ) ( not ( = ?auto_390985 ?auto_390989 ) ) ( not ( = ?auto_390985 ?auto_390990 ) ) ( not ( = ?auto_390985 ?auto_390991 ) ) ( not ( = ?auto_390985 ?auto_390992 ) ) ( not ( = ?auto_390985 ?auto_390993 ) ) ( not ( = ?auto_390985 ?auto_390994 ) ) ( not ( = ?auto_390985 ?auto_390995 ) ) ( not ( = ?auto_390985 ?auto_390996 ) ) ( not ( = ?auto_390985 ?auto_390997 ) ) ( not ( = ?auto_390985 ?auto_390998 ) ) ( not ( = ?auto_390985 ?auto_390999 ) ) ( not ( = ?auto_390985 ?auto_391000 ) ) ( not ( = ?auto_390986 ?auto_390987 ) ) ( not ( = ?auto_390986 ?auto_390988 ) ) ( not ( = ?auto_390986 ?auto_390989 ) ) ( not ( = ?auto_390986 ?auto_390990 ) ) ( not ( = ?auto_390986 ?auto_390991 ) ) ( not ( = ?auto_390986 ?auto_390992 ) ) ( not ( = ?auto_390986 ?auto_390993 ) ) ( not ( = ?auto_390986 ?auto_390994 ) ) ( not ( = ?auto_390986 ?auto_390995 ) ) ( not ( = ?auto_390986 ?auto_390996 ) ) ( not ( = ?auto_390986 ?auto_390997 ) ) ( not ( = ?auto_390986 ?auto_390998 ) ) ( not ( = ?auto_390986 ?auto_390999 ) ) ( not ( = ?auto_390986 ?auto_391000 ) ) ( not ( = ?auto_390987 ?auto_390988 ) ) ( not ( = ?auto_390987 ?auto_390989 ) ) ( not ( = ?auto_390987 ?auto_390990 ) ) ( not ( = ?auto_390987 ?auto_390991 ) ) ( not ( = ?auto_390987 ?auto_390992 ) ) ( not ( = ?auto_390987 ?auto_390993 ) ) ( not ( = ?auto_390987 ?auto_390994 ) ) ( not ( = ?auto_390987 ?auto_390995 ) ) ( not ( = ?auto_390987 ?auto_390996 ) ) ( not ( = ?auto_390987 ?auto_390997 ) ) ( not ( = ?auto_390987 ?auto_390998 ) ) ( not ( = ?auto_390987 ?auto_390999 ) ) ( not ( = ?auto_390987 ?auto_391000 ) ) ( not ( = ?auto_390988 ?auto_390989 ) ) ( not ( = ?auto_390988 ?auto_390990 ) ) ( not ( = ?auto_390988 ?auto_390991 ) ) ( not ( = ?auto_390988 ?auto_390992 ) ) ( not ( = ?auto_390988 ?auto_390993 ) ) ( not ( = ?auto_390988 ?auto_390994 ) ) ( not ( = ?auto_390988 ?auto_390995 ) ) ( not ( = ?auto_390988 ?auto_390996 ) ) ( not ( = ?auto_390988 ?auto_390997 ) ) ( not ( = ?auto_390988 ?auto_390998 ) ) ( not ( = ?auto_390988 ?auto_390999 ) ) ( not ( = ?auto_390988 ?auto_391000 ) ) ( not ( = ?auto_390989 ?auto_390990 ) ) ( not ( = ?auto_390989 ?auto_390991 ) ) ( not ( = ?auto_390989 ?auto_390992 ) ) ( not ( = ?auto_390989 ?auto_390993 ) ) ( not ( = ?auto_390989 ?auto_390994 ) ) ( not ( = ?auto_390989 ?auto_390995 ) ) ( not ( = ?auto_390989 ?auto_390996 ) ) ( not ( = ?auto_390989 ?auto_390997 ) ) ( not ( = ?auto_390989 ?auto_390998 ) ) ( not ( = ?auto_390989 ?auto_390999 ) ) ( not ( = ?auto_390989 ?auto_391000 ) ) ( not ( = ?auto_390990 ?auto_390991 ) ) ( not ( = ?auto_390990 ?auto_390992 ) ) ( not ( = ?auto_390990 ?auto_390993 ) ) ( not ( = ?auto_390990 ?auto_390994 ) ) ( not ( = ?auto_390990 ?auto_390995 ) ) ( not ( = ?auto_390990 ?auto_390996 ) ) ( not ( = ?auto_390990 ?auto_390997 ) ) ( not ( = ?auto_390990 ?auto_390998 ) ) ( not ( = ?auto_390990 ?auto_390999 ) ) ( not ( = ?auto_390990 ?auto_391000 ) ) ( not ( = ?auto_390991 ?auto_390992 ) ) ( not ( = ?auto_390991 ?auto_390993 ) ) ( not ( = ?auto_390991 ?auto_390994 ) ) ( not ( = ?auto_390991 ?auto_390995 ) ) ( not ( = ?auto_390991 ?auto_390996 ) ) ( not ( = ?auto_390991 ?auto_390997 ) ) ( not ( = ?auto_390991 ?auto_390998 ) ) ( not ( = ?auto_390991 ?auto_390999 ) ) ( not ( = ?auto_390991 ?auto_391000 ) ) ( not ( = ?auto_390992 ?auto_390993 ) ) ( not ( = ?auto_390992 ?auto_390994 ) ) ( not ( = ?auto_390992 ?auto_390995 ) ) ( not ( = ?auto_390992 ?auto_390996 ) ) ( not ( = ?auto_390992 ?auto_390997 ) ) ( not ( = ?auto_390992 ?auto_390998 ) ) ( not ( = ?auto_390992 ?auto_390999 ) ) ( not ( = ?auto_390992 ?auto_391000 ) ) ( not ( = ?auto_390993 ?auto_390994 ) ) ( not ( = ?auto_390993 ?auto_390995 ) ) ( not ( = ?auto_390993 ?auto_390996 ) ) ( not ( = ?auto_390993 ?auto_390997 ) ) ( not ( = ?auto_390993 ?auto_390998 ) ) ( not ( = ?auto_390993 ?auto_390999 ) ) ( not ( = ?auto_390993 ?auto_391000 ) ) ( not ( = ?auto_390994 ?auto_390995 ) ) ( not ( = ?auto_390994 ?auto_390996 ) ) ( not ( = ?auto_390994 ?auto_390997 ) ) ( not ( = ?auto_390994 ?auto_390998 ) ) ( not ( = ?auto_390994 ?auto_390999 ) ) ( not ( = ?auto_390994 ?auto_391000 ) ) ( not ( = ?auto_390995 ?auto_390996 ) ) ( not ( = ?auto_390995 ?auto_390997 ) ) ( not ( = ?auto_390995 ?auto_390998 ) ) ( not ( = ?auto_390995 ?auto_390999 ) ) ( not ( = ?auto_390995 ?auto_391000 ) ) ( not ( = ?auto_390996 ?auto_390997 ) ) ( not ( = ?auto_390996 ?auto_390998 ) ) ( not ( = ?auto_390996 ?auto_390999 ) ) ( not ( = ?auto_390996 ?auto_391000 ) ) ( not ( = ?auto_390997 ?auto_390998 ) ) ( not ( = ?auto_390997 ?auto_390999 ) ) ( not ( = ?auto_390997 ?auto_391000 ) ) ( not ( = ?auto_390998 ?auto_390999 ) ) ( not ( = ?auto_390998 ?auto_391000 ) ) ( not ( = ?auto_390999 ?auto_391000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_390999 ?auto_391000 )
      ( !STACK ?auto_390999 ?auto_390998 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391016 - BLOCK
      ?auto_391017 - BLOCK
      ?auto_391018 - BLOCK
      ?auto_391019 - BLOCK
      ?auto_391020 - BLOCK
      ?auto_391021 - BLOCK
      ?auto_391022 - BLOCK
      ?auto_391023 - BLOCK
      ?auto_391024 - BLOCK
      ?auto_391025 - BLOCK
      ?auto_391026 - BLOCK
      ?auto_391027 - BLOCK
      ?auto_391028 - BLOCK
      ?auto_391029 - BLOCK
      ?auto_391030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_391029 ) ( ON-TABLE ?auto_391030 ) ( CLEAR ?auto_391030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_391016 ) ( ON ?auto_391017 ?auto_391016 ) ( ON ?auto_391018 ?auto_391017 ) ( ON ?auto_391019 ?auto_391018 ) ( ON ?auto_391020 ?auto_391019 ) ( ON ?auto_391021 ?auto_391020 ) ( ON ?auto_391022 ?auto_391021 ) ( ON ?auto_391023 ?auto_391022 ) ( ON ?auto_391024 ?auto_391023 ) ( ON ?auto_391025 ?auto_391024 ) ( ON ?auto_391026 ?auto_391025 ) ( ON ?auto_391027 ?auto_391026 ) ( ON ?auto_391028 ?auto_391027 ) ( ON ?auto_391029 ?auto_391028 ) ( not ( = ?auto_391016 ?auto_391017 ) ) ( not ( = ?auto_391016 ?auto_391018 ) ) ( not ( = ?auto_391016 ?auto_391019 ) ) ( not ( = ?auto_391016 ?auto_391020 ) ) ( not ( = ?auto_391016 ?auto_391021 ) ) ( not ( = ?auto_391016 ?auto_391022 ) ) ( not ( = ?auto_391016 ?auto_391023 ) ) ( not ( = ?auto_391016 ?auto_391024 ) ) ( not ( = ?auto_391016 ?auto_391025 ) ) ( not ( = ?auto_391016 ?auto_391026 ) ) ( not ( = ?auto_391016 ?auto_391027 ) ) ( not ( = ?auto_391016 ?auto_391028 ) ) ( not ( = ?auto_391016 ?auto_391029 ) ) ( not ( = ?auto_391016 ?auto_391030 ) ) ( not ( = ?auto_391017 ?auto_391018 ) ) ( not ( = ?auto_391017 ?auto_391019 ) ) ( not ( = ?auto_391017 ?auto_391020 ) ) ( not ( = ?auto_391017 ?auto_391021 ) ) ( not ( = ?auto_391017 ?auto_391022 ) ) ( not ( = ?auto_391017 ?auto_391023 ) ) ( not ( = ?auto_391017 ?auto_391024 ) ) ( not ( = ?auto_391017 ?auto_391025 ) ) ( not ( = ?auto_391017 ?auto_391026 ) ) ( not ( = ?auto_391017 ?auto_391027 ) ) ( not ( = ?auto_391017 ?auto_391028 ) ) ( not ( = ?auto_391017 ?auto_391029 ) ) ( not ( = ?auto_391017 ?auto_391030 ) ) ( not ( = ?auto_391018 ?auto_391019 ) ) ( not ( = ?auto_391018 ?auto_391020 ) ) ( not ( = ?auto_391018 ?auto_391021 ) ) ( not ( = ?auto_391018 ?auto_391022 ) ) ( not ( = ?auto_391018 ?auto_391023 ) ) ( not ( = ?auto_391018 ?auto_391024 ) ) ( not ( = ?auto_391018 ?auto_391025 ) ) ( not ( = ?auto_391018 ?auto_391026 ) ) ( not ( = ?auto_391018 ?auto_391027 ) ) ( not ( = ?auto_391018 ?auto_391028 ) ) ( not ( = ?auto_391018 ?auto_391029 ) ) ( not ( = ?auto_391018 ?auto_391030 ) ) ( not ( = ?auto_391019 ?auto_391020 ) ) ( not ( = ?auto_391019 ?auto_391021 ) ) ( not ( = ?auto_391019 ?auto_391022 ) ) ( not ( = ?auto_391019 ?auto_391023 ) ) ( not ( = ?auto_391019 ?auto_391024 ) ) ( not ( = ?auto_391019 ?auto_391025 ) ) ( not ( = ?auto_391019 ?auto_391026 ) ) ( not ( = ?auto_391019 ?auto_391027 ) ) ( not ( = ?auto_391019 ?auto_391028 ) ) ( not ( = ?auto_391019 ?auto_391029 ) ) ( not ( = ?auto_391019 ?auto_391030 ) ) ( not ( = ?auto_391020 ?auto_391021 ) ) ( not ( = ?auto_391020 ?auto_391022 ) ) ( not ( = ?auto_391020 ?auto_391023 ) ) ( not ( = ?auto_391020 ?auto_391024 ) ) ( not ( = ?auto_391020 ?auto_391025 ) ) ( not ( = ?auto_391020 ?auto_391026 ) ) ( not ( = ?auto_391020 ?auto_391027 ) ) ( not ( = ?auto_391020 ?auto_391028 ) ) ( not ( = ?auto_391020 ?auto_391029 ) ) ( not ( = ?auto_391020 ?auto_391030 ) ) ( not ( = ?auto_391021 ?auto_391022 ) ) ( not ( = ?auto_391021 ?auto_391023 ) ) ( not ( = ?auto_391021 ?auto_391024 ) ) ( not ( = ?auto_391021 ?auto_391025 ) ) ( not ( = ?auto_391021 ?auto_391026 ) ) ( not ( = ?auto_391021 ?auto_391027 ) ) ( not ( = ?auto_391021 ?auto_391028 ) ) ( not ( = ?auto_391021 ?auto_391029 ) ) ( not ( = ?auto_391021 ?auto_391030 ) ) ( not ( = ?auto_391022 ?auto_391023 ) ) ( not ( = ?auto_391022 ?auto_391024 ) ) ( not ( = ?auto_391022 ?auto_391025 ) ) ( not ( = ?auto_391022 ?auto_391026 ) ) ( not ( = ?auto_391022 ?auto_391027 ) ) ( not ( = ?auto_391022 ?auto_391028 ) ) ( not ( = ?auto_391022 ?auto_391029 ) ) ( not ( = ?auto_391022 ?auto_391030 ) ) ( not ( = ?auto_391023 ?auto_391024 ) ) ( not ( = ?auto_391023 ?auto_391025 ) ) ( not ( = ?auto_391023 ?auto_391026 ) ) ( not ( = ?auto_391023 ?auto_391027 ) ) ( not ( = ?auto_391023 ?auto_391028 ) ) ( not ( = ?auto_391023 ?auto_391029 ) ) ( not ( = ?auto_391023 ?auto_391030 ) ) ( not ( = ?auto_391024 ?auto_391025 ) ) ( not ( = ?auto_391024 ?auto_391026 ) ) ( not ( = ?auto_391024 ?auto_391027 ) ) ( not ( = ?auto_391024 ?auto_391028 ) ) ( not ( = ?auto_391024 ?auto_391029 ) ) ( not ( = ?auto_391024 ?auto_391030 ) ) ( not ( = ?auto_391025 ?auto_391026 ) ) ( not ( = ?auto_391025 ?auto_391027 ) ) ( not ( = ?auto_391025 ?auto_391028 ) ) ( not ( = ?auto_391025 ?auto_391029 ) ) ( not ( = ?auto_391025 ?auto_391030 ) ) ( not ( = ?auto_391026 ?auto_391027 ) ) ( not ( = ?auto_391026 ?auto_391028 ) ) ( not ( = ?auto_391026 ?auto_391029 ) ) ( not ( = ?auto_391026 ?auto_391030 ) ) ( not ( = ?auto_391027 ?auto_391028 ) ) ( not ( = ?auto_391027 ?auto_391029 ) ) ( not ( = ?auto_391027 ?auto_391030 ) ) ( not ( = ?auto_391028 ?auto_391029 ) ) ( not ( = ?auto_391028 ?auto_391030 ) ) ( not ( = ?auto_391029 ?auto_391030 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_391030 )
      ( !STACK ?auto_391030 ?auto_391029 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391046 - BLOCK
      ?auto_391047 - BLOCK
      ?auto_391048 - BLOCK
      ?auto_391049 - BLOCK
      ?auto_391050 - BLOCK
      ?auto_391051 - BLOCK
      ?auto_391052 - BLOCK
      ?auto_391053 - BLOCK
      ?auto_391054 - BLOCK
      ?auto_391055 - BLOCK
      ?auto_391056 - BLOCK
      ?auto_391057 - BLOCK
      ?auto_391058 - BLOCK
      ?auto_391059 - BLOCK
      ?auto_391060 - BLOCK
    )
    :vars
    (
      ?auto_391061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391060 ?auto_391061 ) ( ON-TABLE ?auto_391046 ) ( ON ?auto_391047 ?auto_391046 ) ( ON ?auto_391048 ?auto_391047 ) ( ON ?auto_391049 ?auto_391048 ) ( ON ?auto_391050 ?auto_391049 ) ( ON ?auto_391051 ?auto_391050 ) ( ON ?auto_391052 ?auto_391051 ) ( ON ?auto_391053 ?auto_391052 ) ( ON ?auto_391054 ?auto_391053 ) ( ON ?auto_391055 ?auto_391054 ) ( ON ?auto_391056 ?auto_391055 ) ( ON ?auto_391057 ?auto_391056 ) ( ON ?auto_391058 ?auto_391057 ) ( not ( = ?auto_391046 ?auto_391047 ) ) ( not ( = ?auto_391046 ?auto_391048 ) ) ( not ( = ?auto_391046 ?auto_391049 ) ) ( not ( = ?auto_391046 ?auto_391050 ) ) ( not ( = ?auto_391046 ?auto_391051 ) ) ( not ( = ?auto_391046 ?auto_391052 ) ) ( not ( = ?auto_391046 ?auto_391053 ) ) ( not ( = ?auto_391046 ?auto_391054 ) ) ( not ( = ?auto_391046 ?auto_391055 ) ) ( not ( = ?auto_391046 ?auto_391056 ) ) ( not ( = ?auto_391046 ?auto_391057 ) ) ( not ( = ?auto_391046 ?auto_391058 ) ) ( not ( = ?auto_391046 ?auto_391059 ) ) ( not ( = ?auto_391046 ?auto_391060 ) ) ( not ( = ?auto_391046 ?auto_391061 ) ) ( not ( = ?auto_391047 ?auto_391048 ) ) ( not ( = ?auto_391047 ?auto_391049 ) ) ( not ( = ?auto_391047 ?auto_391050 ) ) ( not ( = ?auto_391047 ?auto_391051 ) ) ( not ( = ?auto_391047 ?auto_391052 ) ) ( not ( = ?auto_391047 ?auto_391053 ) ) ( not ( = ?auto_391047 ?auto_391054 ) ) ( not ( = ?auto_391047 ?auto_391055 ) ) ( not ( = ?auto_391047 ?auto_391056 ) ) ( not ( = ?auto_391047 ?auto_391057 ) ) ( not ( = ?auto_391047 ?auto_391058 ) ) ( not ( = ?auto_391047 ?auto_391059 ) ) ( not ( = ?auto_391047 ?auto_391060 ) ) ( not ( = ?auto_391047 ?auto_391061 ) ) ( not ( = ?auto_391048 ?auto_391049 ) ) ( not ( = ?auto_391048 ?auto_391050 ) ) ( not ( = ?auto_391048 ?auto_391051 ) ) ( not ( = ?auto_391048 ?auto_391052 ) ) ( not ( = ?auto_391048 ?auto_391053 ) ) ( not ( = ?auto_391048 ?auto_391054 ) ) ( not ( = ?auto_391048 ?auto_391055 ) ) ( not ( = ?auto_391048 ?auto_391056 ) ) ( not ( = ?auto_391048 ?auto_391057 ) ) ( not ( = ?auto_391048 ?auto_391058 ) ) ( not ( = ?auto_391048 ?auto_391059 ) ) ( not ( = ?auto_391048 ?auto_391060 ) ) ( not ( = ?auto_391048 ?auto_391061 ) ) ( not ( = ?auto_391049 ?auto_391050 ) ) ( not ( = ?auto_391049 ?auto_391051 ) ) ( not ( = ?auto_391049 ?auto_391052 ) ) ( not ( = ?auto_391049 ?auto_391053 ) ) ( not ( = ?auto_391049 ?auto_391054 ) ) ( not ( = ?auto_391049 ?auto_391055 ) ) ( not ( = ?auto_391049 ?auto_391056 ) ) ( not ( = ?auto_391049 ?auto_391057 ) ) ( not ( = ?auto_391049 ?auto_391058 ) ) ( not ( = ?auto_391049 ?auto_391059 ) ) ( not ( = ?auto_391049 ?auto_391060 ) ) ( not ( = ?auto_391049 ?auto_391061 ) ) ( not ( = ?auto_391050 ?auto_391051 ) ) ( not ( = ?auto_391050 ?auto_391052 ) ) ( not ( = ?auto_391050 ?auto_391053 ) ) ( not ( = ?auto_391050 ?auto_391054 ) ) ( not ( = ?auto_391050 ?auto_391055 ) ) ( not ( = ?auto_391050 ?auto_391056 ) ) ( not ( = ?auto_391050 ?auto_391057 ) ) ( not ( = ?auto_391050 ?auto_391058 ) ) ( not ( = ?auto_391050 ?auto_391059 ) ) ( not ( = ?auto_391050 ?auto_391060 ) ) ( not ( = ?auto_391050 ?auto_391061 ) ) ( not ( = ?auto_391051 ?auto_391052 ) ) ( not ( = ?auto_391051 ?auto_391053 ) ) ( not ( = ?auto_391051 ?auto_391054 ) ) ( not ( = ?auto_391051 ?auto_391055 ) ) ( not ( = ?auto_391051 ?auto_391056 ) ) ( not ( = ?auto_391051 ?auto_391057 ) ) ( not ( = ?auto_391051 ?auto_391058 ) ) ( not ( = ?auto_391051 ?auto_391059 ) ) ( not ( = ?auto_391051 ?auto_391060 ) ) ( not ( = ?auto_391051 ?auto_391061 ) ) ( not ( = ?auto_391052 ?auto_391053 ) ) ( not ( = ?auto_391052 ?auto_391054 ) ) ( not ( = ?auto_391052 ?auto_391055 ) ) ( not ( = ?auto_391052 ?auto_391056 ) ) ( not ( = ?auto_391052 ?auto_391057 ) ) ( not ( = ?auto_391052 ?auto_391058 ) ) ( not ( = ?auto_391052 ?auto_391059 ) ) ( not ( = ?auto_391052 ?auto_391060 ) ) ( not ( = ?auto_391052 ?auto_391061 ) ) ( not ( = ?auto_391053 ?auto_391054 ) ) ( not ( = ?auto_391053 ?auto_391055 ) ) ( not ( = ?auto_391053 ?auto_391056 ) ) ( not ( = ?auto_391053 ?auto_391057 ) ) ( not ( = ?auto_391053 ?auto_391058 ) ) ( not ( = ?auto_391053 ?auto_391059 ) ) ( not ( = ?auto_391053 ?auto_391060 ) ) ( not ( = ?auto_391053 ?auto_391061 ) ) ( not ( = ?auto_391054 ?auto_391055 ) ) ( not ( = ?auto_391054 ?auto_391056 ) ) ( not ( = ?auto_391054 ?auto_391057 ) ) ( not ( = ?auto_391054 ?auto_391058 ) ) ( not ( = ?auto_391054 ?auto_391059 ) ) ( not ( = ?auto_391054 ?auto_391060 ) ) ( not ( = ?auto_391054 ?auto_391061 ) ) ( not ( = ?auto_391055 ?auto_391056 ) ) ( not ( = ?auto_391055 ?auto_391057 ) ) ( not ( = ?auto_391055 ?auto_391058 ) ) ( not ( = ?auto_391055 ?auto_391059 ) ) ( not ( = ?auto_391055 ?auto_391060 ) ) ( not ( = ?auto_391055 ?auto_391061 ) ) ( not ( = ?auto_391056 ?auto_391057 ) ) ( not ( = ?auto_391056 ?auto_391058 ) ) ( not ( = ?auto_391056 ?auto_391059 ) ) ( not ( = ?auto_391056 ?auto_391060 ) ) ( not ( = ?auto_391056 ?auto_391061 ) ) ( not ( = ?auto_391057 ?auto_391058 ) ) ( not ( = ?auto_391057 ?auto_391059 ) ) ( not ( = ?auto_391057 ?auto_391060 ) ) ( not ( = ?auto_391057 ?auto_391061 ) ) ( not ( = ?auto_391058 ?auto_391059 ) ) ( not ( = ?auto_391058 ?auto_391060 ) ) ( not ( = ?auto_391058 ?auto_391061 ) ) ( not ( = ?auto_391059 ?auto_391060 ) ) ( not ( = ?auto_391059 ?auto_391061 ) ) ( not ( = ?auto_391060 ?auto_391061 ) ) ( CLEAR ?auto_391058 ) ( ON ?auto_391059 ?auto_391060 ) ( CLEAR ?auto_391059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_391046 ?auto_391047 ?auto_391048 ?auto_391049 ?auto_391050 ?auto_391051 ?auto_391052 ?auto_391053 ?auto_391054 ?auto_391055 ?auto_391056 ?auto_391057 ?auto_391058 ?auto_391059 )
      ( MAKE-15PILE ?auto_391046 ?auto_391047 ?auto_391048 ?auto_391049 ?auto_391050 ?auto_391051 ?auto_391052 ?auto_391053 ?auto_391054 ?auto_391055 ?auto_391056 ?auto_391057 ?auto_391058 ?auto_391059 ?auto_391060 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391077 - BLOCK
      ?auto_391078 - BLOCK
      ?auto_391079 - BLOCK
      ?auto_391080 - BLOCK
      ?auto_391081 - BLOCK
      ?auto_391082 - BLOCK
      ?auto_391083 - BLOCK
      ?auto_391084 - BLOCK
      ?auto_391085 - BLOCK
      ?auto_391086 - BLOCK
      ?auto_391087 - BLOCK
      ?auto_391088 - BLOCK
      ?auto_391089 - BLOCK
      ?auto_391090 - BLOCK
      ?auto_391091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391091 ) ( ON-TABLE ?auto_391077 ) ( ON ?auto_391078 ?auto_391077 ) ( ON ?auto_391079 ?auto_391078 ) ( ON ?auto_391080 ?auto_391079 ) ( ON ?auto_391081 ?auto_391080 ) ( ON ?auto_391082 ?auto_391081 ) ( ON ?auto_391083 ?auto_391082 ) ( ON ?auto_391084 ?auto_391083 ) ( ON ?auto_391085 ?auto_391084 ) ( ON ?auto_391086 ?auto_391085 ) ( ON ?auto_391087 ?auto_391086 ) ( ON ?auto_391088 ?auto_391087 ) ( ON ?auto_391089 ?auto_391088 ) ( not ( = ?auto_391077 ?auto_391078 ) ) ( not ( = ?auto_391077 ?auto_391079 ) ) ( not ( = ?auto_391077 ?auto_391080 ) ) ( not ( = ?auto_391077 ?auto_391081 ) ) ( not ( = ?auto_391077 ?auto_391082 ) ) ( not ( = ?auto_391077 ?auto_391083 ) ) ( not ( = ?auto_391077 ?auto_391084 ) ) ( not ( = ?auto_391077 ?auto_391085 ) ) ( not ( = ?auto_391077 ?auto_391086 ) ) ( not ( = ?auto_391077 ?auto_391087 ) ) ( not ( = ?auto_391077 ?auto_391088 ) ) ( not ( = ?auto_391077 ?auto_391089 ) ) ( not ( = ?auto_391077 ?auto_391090 ) ) ( not ( = ?auto_391077 ?auto_391091 ) ) ( not ( = ?auto_391078 ?auto_391079 ) ) ( not ( = ?auto_391078 ?auto_391080 ) ) ( not ( = ?auto_391078 ?auto_391081 ) ) ( not ( = ?auto_391078 ?auto_391082 ) ) ( not ( = ?auto_391078 ?auto_391083 ) ) ( not ( = ?auto_391078 ?auto_391084 ) ) ( not ( = ?auto_391078 ?auto_391085 ) ) ( not ( = ?auto_391078 ?auto_391086 ) ) ( not ( = ?auto_391078 ?auto_391087 ) ) ( not ( = ?auto_391078 ?auto_391088 ) ) ( not ( = ?auto_391078 ?auto_391089 ) ) ( not ( = ?auto_391078 ?auto_391090 ) ) ( not ( = ?auto_391078 ?auto_391091 ) ) ( not ( = ?auto_391079 ?auto_391080 ) ) ( not ( = ?auto_391079 ?auto_391081 ) ) ( not ( = ?auto_391079 ?auto_391082 ) ) ( not ( = ?auto_391079 ?auto_391083 ) ) ( not ( = ?auto_391079 ?auto_391084 ) ) ( not ( = ?auto_391079 ?auto_391085 ) ) ( not ( = ?auto_391079 ?auto_391086 ) ) ( not ( = ?auto_391079 ?auto_391087 ) ) ( not ( = ?auto_391079 ?auto_391088 ) ) ( not ( = ?auto_391079 ?auto_391089 ) ) ( not ( = ?auto_391079 ?auto_391090 ) ) ( not ( = ?auto_391079 ?auto_391091 ) ) ( not ( = ?auto_391080 ?auto_391081 ) ) ( not ( = ?auto_391080 ?auto_391082 ) ) ( not ( = ?auto_391080 ?auto_391083 ) ) ( not ( = ?auto_391080 ?auto_391084 ) ) ( not ( = ?auto_391080 ?auto_391085 ) ) ( not ( = ?auto_391080 ?auto_391086 ) ) ( not ( = ?auto_391080 ?auto_391087 ) ) ( not ( = ?auto_391080 ?auto_391088 ) ) ( not ( = ?auto_391080 ?auto_391089 ) ) ( not ( = ?auto_391080 ?auto_391090 ) ) ( not ( = ?auto_391080 ?auto_391091 ) ) ( not ( = ?auto_391081 ?auto_391082 ) ) ( not ( = ?auto_391081 ?auto_391083 ) ) ( not ( = ?auto_391081 ?auto_391084 ) ) ( not ( = ?auto_391081 ?auto_391085 ) ) ( not ( = ?auto_391081 ?auto_391086 ) ) ( not ( = ?auto_391081 ?auto_391087 ) ) ( not ( = ?auto_391081 ?auto_391088 ) ) ( not ( = ?auto_391081 ?auto_391089 ) ) ( not ( = ?auto_391081 ?auto_391090 ) ) ( not ( = ?auto_391081 ?auto_391091 ) ) ( not ( = ?auto_391082 ?auto_391083 ) ) ( not ( = ?auto_391082 ?auto_391084 ) ) ( not ( = ?auto_391082 ?auto_391085 ) ) ( not ( = ?auto_391082 ?auto_391086 ) ) ( not ( = ?auto_391082 ?auto_391087 ) ) ( not ( = ?auto_391082 ?auto_391088 ) ) ( not ( = ?auto_391082 ?auto_391089 ) ) ( not ( = ?auto_391082 ?auto_391090 ) ) ( not ( = ?auto_391082 ?auto_391091 ) ) ( not ( = ?auto_391083 ?auto_391084 ) ) ( not ( = ?auto_391083 ?auto_391085 ) ) ( not ( = ?auto_391083 ?auto_391086 ) ) ( not ( = ?auto_391083 ?auto_391087 ) ) ( not ( = ?auto_391083 ?auto_391088 ) ) ( not ( = ?auto_391083 ?auto_391089 ) ) ( not ( = ?auto_391083 ?auto_391090 ) ) ( not ( = ?auto_391083 ?auto_391091 ) ) ( not ( = ?auto_391084 ?auto_391085 ) ) ( not ( = ?auto_391084 ?auto_391086 ) ) ( not ( = ?auto_391084 ?auto_391087 ) ) ( not ( = ?auto_391084 ?auto_391088 ) ) ( not ( = ?auto_391084 ?auto_391089 ) ) ( not ( = ?auto_391084 ?auto_391090 ) ) ( not ( = ?auto_391084 ?auto_391091 ) ) ( not ( = ?auto_391085 ?auto_391086 ) ) ( not ( = ?auto_391085 ?auto_391087 ) ) ( not ( = ?auto_391085 ?auto_391088 ) ) ( not ( = ?auto_391085 ?auto_391089 ) ) ( not ( = ?auto_391085 ?auto_391090 ) ) ( not ( = ?auto_391085 ?auto_391091 ) ) ( not ( = ?auto_391086 ?auto_391087 ) ) ( not ( = ?auto_391086 ?auto_391088 ) ) ( not ( = ?auto_391086 ?auto_391089 ) ) ( not ( = ?auto_391086 ?auto_391090 ) ) ( not ( = ?auto_391086 ?auto_391091 ) ) ( not ( = ?auto_391087 ?auto_391088 ) ) ( not ( = ?auto_391087 ?auto_391089 ) ) ( not ( = ?auto_391087 ?auto_391090 ) ) ( not ( = ?auto_391087 ?auto_391091 ) ) ( not ( = ?auto_391088 ?auto_391089 ) ) ( not ( = ?auto_391088 ?auto_391090 ) ) ( not ( = ?auto_391088 ?auto_391091 ) ) ( not ( = ?auto_391089 ?auto_391090 ) ) ( not ( = ?auto_391089 ?auto_391091 ) ) ( not ( = ?auto_391090 ?auto_391091 ) ) ( CLEAR ?auto_391089 ) ( ON ?auto_391090 ?auto_391091 ) ( CLEAR ?auto_391090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_391077 ?auto_391078 ?auto_391079 ?auto_391080 ?auto_391081 ?auto_391082 ?auto_391083 ?auto_391084 ?auto_391085 ?auto_391086 ?auto_391087 ?auto_391088 ?auto_391089 ?auto_391090 )
      ( MAKE-15PILE ?auto_391077 ?auto_391078 ?auto_391079 ?auto_391080 ?auto_391081 ?auto_391082 ?auto_391083 ?auto_391084 ?auto_391085 ?auto_391086 ?auto_391087 ?auto_391088 ?auto_391089 ?auto_391090 ?auto_391091 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391107 - BLOCK
      ?auto_391108 - BLOCK
      ?auto_391109 - BLOCK
      ?auto_391110 - BLOCK
      ?auto_391111 - BLOCK
      ?auto_391112 - BLOCK
      ?auto_391113 - BLOCK
      ?auto_391114 - BLOCK
      ?auto_391115 - BLOCK
      ?auto_391116 - BLOCK
      ?auto_391117 - BLOCK
      ?auto_391118 - BLOCK
      ?auto_391119 - BLOCK
      ?auto_391120 - BLOCK
      ?auto_391121 - BLOCK
    )
    :vars
    (
      ?auto_391122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391121 ?auto_391122 ) ( ON-TABLE ?auto_391107 ) ( ON ?auto_391108 ?auto_391107 ) ( ON ?auto_391109 ?auto_391108 ) ( ON ?auto_391110 ?auto_391109 ) ( ON ?auto_391111 ?auto_391110 ) ( ON ?auto_391112 ?auto_391111 ) ( ON ?auto_391113 ?auto_391112 ) ( ON ?auto_391114 ?auto_391113 ) ( ON ?auto_391115 ?auto_391114 ) ( ON ?auto_391116 ?auto_391115 ) ( ON ?auto_391117 ?auto_391116 ) ( ON ?auto_391118 ?auto_391117 ) ( not ( = ?auto_391107 ?auto_391108 ) ) ( not ( = ?auto_391107 ?auto_391109 ) ) ( not ( = ?auto_391107 ?auto_391110 ) ) ( not ( = ?auto_391107 ?auto_391111 ) ) ( not ( = ?auto_391107 ?auto_391112 ) ) ( not ( = ?auto_391107 ?auto_391113 ) ) ( not ( = ?auto_391107 ?auto_391114 ) ) ( not ( = ?auto_391107 ?auto_391115 ) ) ( not ( = ?auto_391107 ?auto_391116 ) ) ( not ( = ?auto_391107 ?auto_391117 ) ) ( not ( = ?auto_391107 ?auto_391118 ) ) ( not ( = ?auto_391107 ?auto_391119 ) ) ( not ( = ?auto_391107 ?auto_391120 ) ) ( not ( = ?auto_391107 ?auto_391121 ) ) ( not ( = ?auto_391107 ?auto_391122 ) ) ( not ( = ?auto_391108 ?auto_391109 ) ) ( not ( = ?auto_391108 ?auto_391110 ) ) ( not ( = ?auto_391108 ?auto_391111 ) ) ( not ( = ?auto_391108 ?auto_391112 ) ) ( not ( = ?auto_391108 ?auto_391113 ) ) ( not ( = ?auto_391108 ?auto_391114 ) ) ( not ( = ?auto_391108 ?auto_391115 ) ) ( not ( = ?auto_391108 ?auto_391116 ) ) ( not ( = ?auto_391108 ?auto_391117 ) ) ( not ( = ?auto_391108 ?auto_391118 ) ) ( not ( = ?auto_391108 ?auto_391119 ) ) ( not ( = ?auto_391108 ?auto_391120 ) ) ( not ( = ?auto_391108 ?auto_391121 ) ) ( not ( = ?auto_391108 ?auto_391122 ) ) ( not ( = ?auto_391109 ?auto_391110 ) ) ( not ( = ?auto_391109 ?auto_391111 ) ) ( not ( = ?auto_391109 ?auto_391112 ) ) ( not ( = ?auto_391109 ?auto_391113 ) ) ( not ( = ?auto_391109 ?auto_391114 ) ) ( not ( = ?auto_391109 ?auto_391115 ) ) ( not ( = ?auto_391109 ?auto_391116 ) ) ( not ( = ?auto_391109 ?auto_391117 ) ) ( not ( = ?auto_391109 ?auto_391118 ) ) ( not ( = ?auto_391109 ?auto_391119 ) ) ( not ( = ?auto_391109 ?auto_391120 ) ) ( not ( = ?auto_391109 ?auto_391121 ) ) ( not ( = ?auto_391109 ?auto_391122 ) ) ( not ( = ?auto_391110 ?auto_391111 ) ) ( not ( = ?auto_391110 ?auto_391112 ) ) ( not ( = ?auto_391110 ?auto_391113 ) ) ( not ( = ?auto_391110 ?auto_391114 ) ) ( not ( = ?auto_391110 ?auto_391115 ) ) ( not ( = ?auto_391110 ?auto_391116 ) ) ( not ( = ?auto_391110 ?auto_391117 ) ) ( not ( = ?auto_391110 ?auto_391118 ) ) ( not ( = ?auto_391110 ?auto_391119 ) ) ( not ( = ?auto_391110 ?auto_391120 ) ) ( not ( = ?auto_391110 ?auto_391121 ) ) ( not ( = ?auto_391110 ?auto_391122 ) ) ( not ( = ?auto_391111 ?auto_391112 ) ) ( not ( = ?auto_391111 ?auto_391113 ) ) ( not ( = ?auto_391111 ?auto_391114 ) ) ( not ( = ?auto_391111 ?auto_391115 ) ) ( not ( = ?auto_391111 ?auto_391116 ) ) ( not ( = ?auto_391111 ?auto_391117 ) ) ( not ( = ?auto_391111 ?auto_391118 ) ) ( not ( = ?auto_391111 ?auto_391119 ) ) ( not ( = ?auto_391111 ?auto_391120 ) ) ( not ( = ?auto_391111 ?auto_391121 ) ) ( not ( = ?auto_391111 ?auto_391122 ) ) ( not ( = ?auto_391112 ?auto_391113 ) ) ( not ( = ?auto_391112 ?auto_391114 ) ) ( not ( = ?auto_391112 ?auto_391115 ) ) ( not ( = ?auto_391112 ?auto_391116 ) ) ( not ( = ?auto_391112 ?auto_391117 ) ) ( not ( = ?auto_391112 ?auto_391118 ) ) ( not ( = ?auto_391112 ?auto_391119 ) ) ( not ( = ?auto_391112 ?auto_391120 ) ) ( not ( = ?auto_391112 ?auto_391121 ) ) ( not ( = ?auto_391112 ?auto_391122 ) ) ( not ( = ?auto_391113 ?auto_391114 ) ) ( not ( = ?auto_391113 ?auto_391115 ) ) ( not ( = ?auto_391113 ?auto_391116 ) ) ( not ( = ?auto_391113 ?auto_391117 ) ) ( not ( = ?auto_391113 ?auto_391118 ) ) ( not ( = ?auto_391113 ?auto_391119 ) ) ( not ( = ?auto_391113 ?auto_391120 ) ) ( not ( = ?auto_391113 ?auto_391121 ) ) ( not ( = ?auto_391113 ?auto_391122 ) ) ( not ( = ?auto_391114 ?auto_391115 ) ) ( not ( = ?auto_391114 ?auto_391116 ) ) ( not ( = ?auto_391114 ?auto_391117 ) ) ( not ( = ?auto_391114 ?auto_391118 ) ) ( not ( = ?auto_391114 ?auto_391119 ) ) ( not ( = ?auto_391114 ?auto_391120 ) ) ( not ( = ?auto_391114 ?auto_391121 ) ) ( not ( = ?auto_391114 ?auto_391122 ) ) ( not ( = ?auto_391115 ?auto_391116 ) ) ( not ( = ?auto_391115 ?auto_391117 ) ) ( not ( = ?auto_391115 ?auto_391118 ) ) ( not ( = ?auto_391115 ?auto_391119 ) ) ( not ( = ?auto_391115 ?auto_391120 ) ) ( not ( = ?auto_391115 ?auto_391121 ) ) ( not ( = ?auto_391115 ?auto_391122 ) ) ( not ( = ?auto_391116 ?auto_391117 ) ) ( not ( = ?auto_391116 ?auto_391118 ) ) ( not ( = ?auto_391116 ?auto_391119 ) ) ( not ( = ?auto_391116 ?auto_391120 ) ) ( not ( = ?auto_391116 ?auto_391121 ) ) ( not ( = ?auto_391116 ?auto_391122 ) ) ( not ( = ?auto_391117 ?auto_391118 ) ) ( not ( = ?auto_391117 ?auto_391119 ) ) ( not ( = ?auto_391117 ?auto_391120 ) ) ( not ( = ?auto_391117 ?auto_391121 ) ) ( not ( = ?auto_391117 ?auto_391122 ) ) ( not ( = ?auto_391118 ?auto_391119 ) ) ( not ( = ?auto_391118 ?auto_391120 ) ) ( not ( = ?auto_391118 ?auto_391121 ) ) ( not ( = ?auto_391118 ?auto_391122 ) ) ( not ( = ?auto_391119 ?auto_391120 ) ) ( not ( = ?auto_391119 ?auto_391121 ) ) ( not ( = ?auto_391119 ?auto_391122 ) ) ( not ( = ?auto_391120 ?auto_391121 ) ) ( not ( = ?auto_391120 ?auto_391122 ) ) ( not ( = ?auto_391121 ?auto_391122 ) ) ( ON ?auto_391120 ?auto_391121 ) ( CLEAR ?auto_391118 ) ( ON ?auto_391119 ?auto_391120 ) ( CLEAR ?auto_391119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_391107 ?auto_391108 ?auto_391109 ?auto_391110 ?auto_391111 ?auto_391112 ?auto_391113 ?auto_391114 ?auto_391115 ?auto_391116 ?auto_391117 ?auto_391118 ?auto_391119 )
      ( MAKE-15PILE ?auto_391107 ?auto_391108 ?auto_391109 ?auto_391110 ?auto_391111 ?auto_391112 ?auto_391113 ?auto_391114 ?auto_391115 ?auto_391116 ?auto_391117 ?auto_391118 ?auto_391119 ?auto_391120 ?auto_391121 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391138 - BLOCK
      ?auto_391139 - BLOCK
      ?auto_391140 - BLOCK
      ?auto_391141 - BLOCK
      ?auto_391142 - BLOCK
      ?auto_391143 - BLOCK
      ?auto_391144 - BLOCK
      ?auto_391145 - BLOCK
      ?auto_391146 - BLOCK
      ?auto_391147 - BLOCK
      ?auto_391148 - BLOCK
      ?auto_391149 - BLOCK
      ?auto_391150 - BLOCK
      ?auto_391151 - BLOCK
      ?auto_391152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391152 ) ( ON-TABLE ?auto_391138 ) ( ON ?auto_391139 ?auto_391138 ) ( ON ?auto_391140 ?auto_391139 ) ( ON ?auto_391141 ?auto_391140 ) ( ON ?auto_391142 ?auto_391141 ) ( ON ?auto_391143 ?auto_391142 ) ( ON ?auto_391144 ?auto_391143 ) ( ON ?auto_391145 ?auto_391144 ) ( ON ?auto_391146 ?auto_391145 ) ( ON ?auto_391147 ?auto_391146 ) ( ON ?auto_391148 ?auto_391147 ) ( ON ?auto_391149 ?auto_391148 ) ( not ( = ?auto_391138 ?auto_391139 ) ) ( not ( = ?auto_391138 ?auto_391140 ) ) ( not ( = ?auto_391138 ?auto_391141 ) ) ( not ( = ?auto_391138 ?auto_391142 ) ) ( not ( = ?auto_391138 ?auto_391143 ) ) ( not ( = ?auto_391138 ?auto_391144 ) ) ( not ( = ?auto_391138 ?auto_391145 ) ) ( not ( = ?auto_391138 ?auto_391146 ) ) ( not ( = ?auto_391138 ?auto_391147 ) ) ( not ( = ?auto_391138 ?auto_391148 ) ) ( not ( = ?auto_391138 ?auto_391149 ) ) ( not ( = ?auto_391138 ?auto_391150 ) ) ( not ( = ?auto_391138 ?auto_391151 ) ) ( not ( = ?auto_391138 ?auto_391152 ) ) ( not ( = ?auto_391139 ?auto_391140 ) ) ( not ( = ?auto_391139 ?auto_391141 ) ) ( not ( = ?auto_391139 ?auto_391142 ) ) ( not ( = ?auto_391139 ?auto_391143 ) ) ( not ( = ?auto_391139 ?auto_391144 ) ) ( not ( = ?auto_391139 ?auto_391145 ) ) ( not ( = ?auto_391139 ?auto_391146 ) ) ( not ( = ?auto_391139 ?auto_391147 ) ) ( not ( = ?auto_391139 ?auto_391148 ) ) ( not ( = ?auto_391139 ?auto_391149 ) ) ( not ( = ?auto_391139 ?auto_391150 ) ) ( not ( = ?auto_391139 ?auto_391151 ) ) ( not ( = ?auto_391139 ?auto_391152 ) ) ( not ( = ?auto_391140 ?auto_391141 ) ) ( not ( = ?auto_391140 ?auto_391142 ) ) ( not ( = ?auto_391140 ?auto_391143 ) ) ( not ( = ?auto_391140 ?auto_391144 ) ) ( not ( = ?auto_391140 ?auto_391145 ) ) ( not ( = ?auto_391140 ?auto_391146 ) ) ( not ( = ?auto_391140 ?auto_391147 ) ) ( not ( = ?auto_391140 ?auto_391148 ) ) ( not ( = ?auto_391140 ?auto_391149 ) ) ( not ( = ?auto_391140 ?auto_391150 ) ) ( not ( = ?auto_391140 ?auto_391151 ) ) ( not ( = ?auto_391140 ?auto_391152 ) ) ( not ( = ?auto_391141 ?auto_391142 ) ) ( not ( = ?auto_391141 ?auto_391143 ) ) ( not ( = ?auto_391141 ?auto_391144 ) ) ( not ( = ?auto_391141 ?auto_391145 ) ) ( not ( = ?auto_391141 ?auto_391146 ) ) ( not ( = ?auto_391141 ?auto_391147 ) ) ( not ( = ?auto_391141 ?auto_391148 ) ) ( not ( = ?auto_391141 ?auto_391149 ) ) ( not ( = ?auto_391141 ?auto_391150 ) ) ( not ( = ?auto_391141 ?auto_391151 ) ) ( not ( = ?auto_391141 ?auto_391152 ) ) ( not ( = ?auto_391142 ?auto_391143 ) ) ( not ( = ?auto_391142 ?auto_391144 ) ) ( not ( = ?auto_391142 ?auto_391145 ) ) ( not ( = ?auto_391142 ?auto_391146 ) ) ( not ( = ?auto_391142 ?auto_391147 ) ) ( not ( = ?auto_391142 ?auto_391148 ) ) ( not ( = ?auto_391142 ?auto_391149 ) ) ( not ( = ?auto_391142 ?auto_391150 ) ) ( not ( = ?auto_391142 ?auto_391151 ) ) ( not ( = ?auto_391142 ?auto_391152 ) ) ( not ( = ?auto_391143 ?auto_391144 ) ) ( not ( = ?auto_391143 ?auto_391145 ) ) ( not ( = ?auto_391143 ?auto_391146 ) ) ( not ( = ?auto_391143 ?auto_391147 ) ) ( not ( = ?auto_391143 ?auto_391148 ) ) ( not ( = ?auto_391143 ?auto_391149 ) ) ( not ( = ?auto_391143 ?auto_391150 ) ) ( not ( = ?auto_391143 ?auto_391151 ) ) ( not ( = ?auto_391143 ?auto_391152 ) ) ( not ( = ?auto_391144 ?auto_391145 ) ) ( not ( = ?auto_391144 ?auto_391146 ) ) ( not ( = ?auto_391144 ?auto_391147 ) ) ( not ( = ?auto_391144 ?auto_391148 ) ) ( not ( = ?auto_391144 ?auto_391149 ) ) ( not ( = ?auto_391144 ?auto_391150 ) ) ( not ( = ?auto_391144 ?auto_391151 ) ) ( not ( = ?auto_391144 ?auto_391152 ) ) ( not ( = ?auto_391145 ?auto_391146 ) ) ( not ( = ?auto_391145 ?auto_391147 ) ) ( not ( = ?auto_391145 ?auto_391148 ) ) ( not ( = ?auto_391145 ?auto_391149 ) ) ( not ( = ?auto_391145 ?auto_391150 ) ) ( not ( = ?auto_391145 ?auto_391151 ) ) ( not ( = ?auto_391145 ?auto_391152 ) ) ( not ( = ?auto_391146 ?auto_391147 ) ) ( not ( = ?auto_391146 ?auto_391148 ) ) ( not ( = ?auto_391146 ?auto_391149 ) ) ( not ( = ?auto_391146 ?auto_391150 ) ) ( not ( = ?auto_391146 ?auto_391151 ) ) ( not ( = ?auto_391146 ?auto_391152 ) ) ( not ( = ?auto_391147 ?auto_391148 ) ) ( not ( = ?auto_391147 ?auto_391149 ) ) ( not ( = ?auto_391147 ?auto_391150 ) ) ( not ( = ?auto_391147 ?auto_391151 ) ) ( not ( = ?auto_391147 ?auto_391152 ) ) ( not ( = ?auto_391148 ?auto_391149 ) ) ( not ( = ?auto_391148 ?auto_391150 ) ) ( not ( = ?auto_391148 ?auto_391151 ) ) ( not ( = ?auto_391148 ?auto_391152 ) ) ( not ( = ?auto_391149 ?auto_391150 ) ) ( not ( = ?auto_391149 ?auto_391151 ) ) ( not ( = ?auto_391149 ?auto_391152 ) ) ( not ( = ?auto_391150 ?auto_391151 ) ) ( not ( = ?auto_391150 ?auto_391152 ) ) ( not ( = ?auto_391151 ?auto_391152 ) ) ( ON ?auto_391151 ?auto_391152 ) ( CLEAR ?auto_391149 ) ( ON ?auto_391150 ?auto_391151 ) ( CLEAR ?auto_391150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_391138 ?auto_391139 ?auto_391140 ?auto_391141 ?auto_391142 ?auto_391143 ?auto_391144 ?auto_391145 ?auto_391146 ?auto_391147 ?auto_391148 ?auto_391149 ?auto_391150 )
      ( MAKE-15PILE ?auto_391138 ?auto_391139 ?auto_391140 ?auto_391141 ?auto_391142 ?auto_391143 ?auto_391144 ?auto_391145 ?auto_391146 ?auto_391147 ?auto_391148 ?auto_391149 ?auto_391150 ?auto_391151 ?auto_391152 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391168 - BLOCK
      ?auto_391169 - BLOCK
      ?auto_391170 - BLOCK
      ?auto_391171 - BLOCK
      ?auto_391172 - BLOCK
      ?auto_391173 - BLOCK
      ?auto_391174 - BLOCK
      ?auto_391175 - BLOCK
      ?auto_391176 - BLOCK
      ?auto_391177 - BLOCK
      ?auto_391178 - BLOCK
      ?auto_391179 - BLOCK
      ?auto_391180 - BLOCK
      ?auto_391181 - BLOCK
      ?auto_391182 - BLOCK
    )
    :vars
    (
      ?auto_391183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391182 ?auto_391183 ) ( ON-TABLE ?auto_391168 ) ( ON ?auto_391169 ?auto_391168 ) ( ON ?auto_391170 ?auto_391169 ) ( ON ?auto_391171 ?auto_391170 ) ( ON ?auto_391172 ?auto_391171 ) ( ON ?auto_391173 ?auto_391172 ) ( ON ?auto_391174 ?auto_391173 ) ( ON ?auto_391175 ?auto_391174 ) ( ON ?auto_391176 ?auto_391175 ) ( ON ?auto_391177 ?auto_391176 ) ( ON ?auto_391178 ?auto_391177 ) ( not ( = ?auto_391168 ?auto_391169 ) ) ( not ( = ?auto_391168 ?auto_391170 ) ) ( not ( = ?auto_391168 ?auto_391171 ) ) ( not ( = ?auto_391168 ?auto_391172 ) ) ( not ( = ?auto_391168 ?auto_391173 ) ) ( not ( = ?auto_391168 ?auto_391174 ) ) ( not ( = ?auto_391168 ?auto_391175 ) ) ( not ( = ?auto_391168 ?auto_391176 ) ) ( not ( = ?auto_391168 ?auto_391177 ) ) ( not ( = ?auto_391168 ?auto_391178 ) ) ( not ( = ?auto_391168 ?auto_391179 ) ) ( not ( = ?auto_391168 ?auto_391180 ) ) ( not ( = ?auto_391168 ?auto_391181 ) ) ( not ( = ?auto_391168 ?auto_391182 ) ) ( not ( = ?auto_391168 ?auto_391183 ) ) ( not ( = ?auto_391169 ?auto_391170 ) ) ( not ( = ?auto_391169 ?auto_391171 ) ) ( not ( = ?auto_391169 ?auto_391172 ) ) ( not ( = ?auto_391169 ?auto_391173 ) ) ( not ( = ?auto_391169 ?auto_391174 ) ) ( not ( = ?auto_391169 ?auto_391175 ) ) ( not ( = ?auto_391169 ?auto_391176 ) ) ( not ( = ?auto_391169 ?auto_391177 ) ) ( not ( = ?auto_391169 ?auto_391178 ) ) ( not ( = ?auto_391169 ?auto_391179 ) ) ( not ( = ?auto_391169 ?auto_391180 ) ) ( not ( = ?auto_391169 ?auto_391181 ) ) ( not ( = ?auto_391169 ?auto_391182 ) ) ( not ( = ?auto_391169 ?auto_391183 ) ) ( not ( = ?auto_391170 ?auto_391171 ) ) ( not ( = ?auto_391170 ?auto_391172 ) ) ( not ( = ?auto_391170 ?auto_391173 ) ) ( not ( = ?auto_391170 ?auto_391174 ) ) ( not ( = ?auto_391170 ?auto_391175 ) ) ( not ( = ?auto_391170 ?auto_391176 ) ) ( not ( = ?auto_391170 ?auto_391177 ) ) ( not ( = ?auto_391170 ?auto_391178 ) ) ( not ( = ?auto_391170 ?auto_391179 ) ) ( not ( = ?auto_391170 ?auto_391180 ) ) ( not ( = ?auto_391170 ?auto_391181 ) ) ( not ( = ?auto_391170 ?auto_391182 ) ) ( not ( = ?auto_391170 ?auto_391183 ) ) ( not ( = ?auto_391171 ?auto_391172 ) ) ( not ( = ?auto_391171 ?auto_391173 ) ) ( not ( = ?auto_391171 ?auto_391174 ) ) ( not ( = ?auto_391171 ?auto_391175 ) ) ( not ( = ?auto_391171 ?auto_391176 ) ) ( not ( = ?auto_391171 ?auto_391177 ) ) ( not ( = ?auto_391171 ?auto_391178 ) ) ( not ( = ?auto_391171 ?auto_391179 ) ) ( not ( = ?auto_391171 ?auto_391180 ) ) ( not ( = ?auto_391171 ?auto_391181 ) ) ( not ( = ?auto_391171 ?auto_391182 ) ) ( not ( = ?auto_391171 ?auto_391183 ) ) ( not ( = ?auto_391172 ?auto_391173 ) ) ( not ( = ?auto_391172 ?auto_391174 ) ) ( not ( = ?auto_391172 ?auto_391175 ) ) ( not ( = ?auto_391172 ?auto_391176 ) ) ( not ( = ?auto_391172 ?auto_391177 ) ) ( not ( = ?auto_391172 ?auto_391178 ) ) ( not ( = ?auto_391172 ?auto_391179 ) ) ( not ( = ?auto_391172 ?auto_391180 ) ) ( not ( = ?auto_391172 ?auto_391181 ) ) ( not ( = ?auto_391172 ?auto_391182 ) ) ( not ( = ?auto_391172 ?auto_391183 ) ) ( not ( = ?auto_391173 ?auto_391174 ) ) ( not ( = ?auto_391173 ?auto_391175 ) ) ( not ( = ?auto_391173 ?auto_391176 ) ) ( not ( = ?auto_391173 ?auto_391177 ) ) ( not ( = ?auto_391173 ?auto_391178 ) ) ( not ( = ?auto_391173 ?auto_391179 ) ) ( not ( = ?auto_391173 ?auto_391180 ) ) ( not ( = ?auto_391173 ?auto_391181 ) ) ( not ( = ?auto_391173 ?auto_391182 ) ) ( not ( = ?auto_391173 ?auto_391183 ) ) ( not ( = ?auto_391174 ?auto_391175 ) ) ( not ( = ?auto_391174 ?auto_391176 ) ) ( not ( = ?auto_391174 ?auto_391177 ) ) ( not ( = ?auto_391174 ?auto_391178 ) ) ( not ( = ?auto_391174 ?auto_391179 ) ) ( not ( = ?auto_391174 ?auto_391180 ) ) ( not ( = ?auto_391174 ?auto_391181 ) ) ( not ( = ?auto_391174 ?auto_391182 ) ) ( not ( = ?auto_391174 ?auto_391183 ) ) ( not ( = ?auto_391175 ?auto_391176 ) ) ( not ( = ?auto_391175 ?auto_391177 ) ) ( not ( = ?auto_391175 ?auto_391178 ) ) ( not ( = ?auto_391175 ?auto_391179 ) ) ( not ( = ?auto_391175 ?auto_391180 ) ) ( not ( = ?auto_391175 ?auto_391181 ) ) ( not ( = ?auto_391175 ?auto_391182 ) ) ( not ( = ?auto_391175 ?auto_391183 ) ) ( not ( = ?auto_391176 ?auto_391177 ) ) ( not ( = ?auto_391176 ?auto_391178 ) ) ( not ( = ?auto_391176 ?auto_391179 ) ) ( not ( = ?auto_391176 ?auto_391180 ) ) ( not ( = ?auto_391176 ?auto_391181 ) ) ( not ( = ?auto_391176 ?auto_391182 ) ) ( not ( = ?auto_391176 ?auto_391183 ) ) ( not ( = ?auto_391177 ?auto_391178 ) ) ( not ( = ?auto_391177 ?auto_391179 ) ) ( not ( = ?auto_391177 ?auto_391180 ) ) ( not ( = ?auto_391177 ?auto_391181 ) ) ( not ( = ?auto_391177 ?auto_391182 ) ) ( not ( = ?auto_391177 ?auto_391183 ) ) ( not ( = ?auto_391178 ?auto_391179 ) ) ( not ( = ?auto_391178 ?auto_391180 ) ) ( not ( = ?auto_391178 ?auto_391181 ) ) ( not ( = ?auto_391178 ?auto_391182 ) ) ( not ( = ?auto_391178 ?auto_391183 ) ) ( not ( = ?auto_391179 ?auto_391180 ) ) ( not ( = ?auto_391179 ?auto_391181 ) ) ( not ( = ?auto_391179 ?auto_391182 ) ) ( not ( = ?auto_391179 ?auto_391183 ) ) ( not ( = ?auto_391180 ?auto_391181 ) ) ( not ( = ?auto_391180 ?auto_391182 ) ) ( not ( = ?auto_391180 ?auto_391183 ) ) ( not ( = ?auto_391181 ?auto_391182 ) ) ( not ( = ?auto_391181 ?auto_391183 ) ) ( not ( = ?auto_391182 ?auto_391183 ) ) ( ON ?auto_391181 ?auto_391182 ) ( ON ?auto_391180 ?auto_391181 ) ( CLEAR ?auto_391178 ) ( ON ?auto_391179 ?auto_391180 ) ( CLEAR ?auto_391179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_391168 ?auto_391169 ?auto_391170 ?auto_391171 ?auto_391172 ?auto_391173 ?auto_391174 ?auto_391175 ?auto_391176 ?auto_391177 ?auto_391178 ?auto_391179 )
      ( MAKE-15PILE ?auto_391168 ?auto_391169 ?auto_391170 ?auto_391171 ?auto_391172 ?auto_391173 ?auto_391174 ?auto_391175 ?auto_391176 ?auto_391177 ?auto_391178 ?auto_391179 ?auto_391180 ?auto_391181 ?auto_391182 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391199 - BLOCK
      ?auto_391200 - BLOCK
      ?auto_391201 - BLOCK
      ?auto_391202 - BLOCK
      ?auto_391203 - BLOCK
      ?auto_391204 - BLOCK
      ?auto_391205 - BLOCK
      ?auto_391206 - BLOCK
      ?auto_391207 - BLOCK
      ?auto_391208 - BLOCK
      ?auto_391209 - BLOCK
      ?auto_391210 - BLOCK
      ?auto_391211 - BLOCK
      ?auto_391212 - BLOCK
      ?auto_391213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391213 ) ( ON-TABLE ?auto_391199 ) ( ON ?auto_391200 ?auto_391199 ) ( ON ?auto_391201 ?auto_391200 ) ( ON ?auto_391202 ?auto_391201 ) ( ON ?auto_391203 ?auto_391202 ) ( ON ?auto_391204 ?auto_391203 ) ( ON ?auto_391205 ?auto_391204 ) ( ON ?auto_391206 ?auto_391205 ) ( ON ?auto_391207 ?auto_391206 ) ( ON ?auto_391208 ?auto_391207 ) ( ON ?auto_391209 ?auto_391208 ) ( not ( = ?auto_391199 ?auto_391200 ) ) ( not ( = ?auto_391199 ?auto_391201 ) ) ( not ( = ?auto_391199 ?auto_391202 ) ) ( not ( = ?auto_391199 ?auto_391203 ) ) ( not ( = ?auto_391199 ?auto_391204 ) ) ( not ( = ?auto_391199 ?auto_391205 ) ) ( not ( = ?auto_391199 ?auto_391206 ) ) ( not ( = ?auto_391199 ?auto_391207 ) ) ( not ( = ?auto_391199 ?auto_391208 ) ) ( not ( = ?auto_391199 ?auto_391209 ) ) ( not ( = ?auto_391199 ?auto_391210 ) ) ( not ( = ?auto_391199 ?auto_391211 ) ) ( not ( = ?auto_391199 ?auto_391212 ) ) ( not ( = ?auto_391199 ?auto_391213 ) ) ( not ( = ?auto_391200 ?auto_391201 ) ) ( not ( = ?auto_391200 ?auto_391202 ) ) ( not ( = ?auto_391200 ?auto_391203 ) ) ( not ( = ?auto_391200 ?auto_391204 ) ) ( not ( = ?auto_391200 ?auto_391205 ) ) ( not ( = ?auto_391200 ?auto_391206 ) ) ( not ( = ?auto_391200 ?auto_391207 ) ) ( not ( = ?auto_391200 ?auto_391208 ) ) ( not ( = ?auto_391200 ?auto_391209 ) ) ( not ( = ?auto_391200 ?auto_391210 ) ) ( not ( = ?auto_391200 ?auto_391211 ) ) ( not ( = ?auto_391200 ?auto_391212 ) ) ( not ( = ?auto_391200 ?auto_391213 ) ) ( not ( = ?auto_391201 ?auto_391202 ) ) ( not ( = ?auto_391201 ?auto_391203 ) ) ( not ( = ?auto_391201 ?auto_391204 ) ) ( not ( = ?auto_391201 ?auto_391205 ) ) ( not ( = ?auto_391201 ?auto_391206 ) ) ( not ( = ?auto_391201 ?auto_391207 ) ) ( not ( = ?auto_391201 ?auto_391208 ) ) ( not ( = ?auto_391201 ?auto_391209 ) ) ( not ( = ?auto_391201 ?auto_391210 ) ) ( not ( = ?auto_391201 ?auto_391211 ) ) ( not ( = ?auto_391201 ?auto_391212 ) ) ( not ( = ?auto_391201 ?auto_391213 ) ) ( not ( = ?auto_391202 ?auto_391203 ) ) ( not ( = ?auto_391202 ?auto_391204 ) ) ( not ( = ?auto_391202 ?auto_391205 ) ) ( not ( = ?auto_391202 ?auto_391206 ) ) ( not ( = ?auto_391202 ?auto_391207 ) ) ( not ( = ?auto_391202 ?auto_391208 ) ) ( not ( = ?auto_391202 ?auto_391209 ) ) ( not ( = ?auto_391202 ?auto_391210 ) ) ( not ( = ?auto_391202 ?auto_391211 ) ) ( not ( = ?auto_391202 ?auto_391212 ) ) ( not ( = ?auto_391202 ?auto_391213 ) ) ( not ( = ?auto_391203 ?auto_391204 ) ) ( not ( = ?auto_391203 ?auto_391205 ) ) ( not ( = ?auto_391203 ?auto_391206 ) ) ( not ( = ?auto_391203 ?auto_391207 ) ) ( not ( = ?auto_391203 ?auto_391208 ) ) ( not ( = ?auto_391203 ?auto_391209 ) ) ( not ( = ?auto_391203 ?auto_391210 ) ) ( not ( = ?auto_391203 ?auto_391211 ) ) ( not ( = ?auto_391203 ?auto_391212 ) ) ( not ( = ?auto_391203 ?auto_391213 ) ) ( not ( = ?auto_391204 ?auto_391205 ) ) ( not ( = ?auto_391204 ?auto_391206 ) ) ( not ( = ?auto_391204 ?auto_391207 ) ) ( not ( = ?auto_391204 ?auto_391208 ) ) ( not ( = ?auto_391204 ?auto_391209 ) ) ( not ( = ?auto_391204 ?auto_391210 ) ) ( not ( = ?auto_391204 ?auto_391211 ) ) ( not ( = ?auto_391204 ?auto_391212 ) ) ( not ( = ?auto_391204 ?auto_391213 ) ) ( not ( = ?auto_391205 ?auto_391206 ) ) ( not ( = ?auto_391205 ?auto_391207 ) ) ( not ( = ?auto_391205 ?auto_391208 ) ) ( not ( = ?auto_391205 ?auto_391209 ) ) ( not ( = ?auto_391205 ?auto_391210 ) ) ( not ( = ?auto_391205 ?auto_391211 ) ) ( not ( = ?auto_391205 ?auto_391212 ) ) ( not ( = ?auto_391205 ?auto_391213 ) ) ( not ( = ?auto_391206 ?auto_391207 ) ) ( not ( = ?auto_391206 ?auto_391208 ) ) ( not ( = ?auto_391206 ?auto_391209 ) ) ( not ( = ?auto_391206 ?auto_391210 ) ) ( not ( = ?auto_391206 ?auto_391211 ) ) ( not ( = ?auto_391206 ?auto_391212 ) ) ( not ( = ?auto_391206 ?auto_391213 ) ) ( not ( = ?auto_391207 ?auto_391208 ) ) ( not ( = ?auto_391207 ?auto_391209 ) ) ( not ( = ?auto_391207 ?auto_391210 ) ) ( not ( = ?auto_391207 ?auto_391211 ) ) ( not ( = ?auto_391207 ?auto_391212 ) ) ( not ( = ?auto_391207 ?auto_391213 ) ) ( not ( = ?auto_391208 ?auto_391209 ) ) ( not ( = ?auto_391208 ?auto_391210 ) ) ( not ( = ?auto_391208 ?auto_391211 ) ) ( not ( = ?auto_391208 ?auto_391212 ) ) ( not ( = ?auto_391208 ?auto_391213 ) ) ( not ( = ?auto_391209 ?auto_391210 ) ) ( not ( = ?auto_391209 ?auto_391211 ) ) ( not ( = ?auto_391209 ?auto_391212 ) ) ( not ( = ?auto_391209 ?auto_391213 ) ) ( not ( = ?auto_391210 ?auto_391211 ) ) ( not ( = ?auto_391210 ?auto_391212 ) ) ( not ( = ?auto_391210 ?auto_391213 ) ) ( not ( = ?auto_391211 ?auto_391212 ) ) ( not ( = ?auto_391211 ?auto_391213 ) ) ( not ( = ?auto_391212 ?auto_391213 ) ) ( ON ?auto_391212 ?auto_391213 ) ( ON ?auto_391211 ?auto_391212 ) ( CLEAR ?auto_391209 ) ( ON ?auto_391210 ?auto_391211 ) ( CLEAR ?auto_391210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_391199 ?auto_391200 ?auto_391201 ?auto_391202 ?auto_391203 ?auto_391204 ?auto_391205 ?auto_391206 ?auto_391207 ?auto_391208 ?auto_391209 ?auto_391210 )
      ( MAKE-15PILE ?auto_391199 ?auto_391200 ?auto_391201 ?auto_391202 ?auto_391203 ?auto_391204 ?auto_391205 ?auto_391206 ?auto_391207 ?auto_391208 ?auto_391209 ?auto_391210 ?auto_391211 ?auto_391212 ?auto_391213 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391229 - BLOCK
      ?auto_391230 - BLOCK
      ?auto_391231 - BLOCK
      ?auto_391232 - BLOCK
      ?auto_391233 - BLOCK
      ?auto_391234 - BLOCK
      ?auto_391235 - BLOCK
      ?auto_391236 - BLOCK
      ?auto_391237 - BLOCK
      ?auto_391238 - BLOCK
      ?auto_391239 - BLOCK
      ?auto_391240 - BLOCK
      ?auto_391241 - BLOCK
      ?auto_391242 - BLOCK
      ?auto_391243 - BLOCK
    )
    :vars
    (
      ?auto_391244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391243 ?auto_391244 ) ( ON-TABLE ?auto_391229 ) ( ON ?auto_391230 ?auto_391229 ) ( ON ?auto_391231 ?auto_391230 ) ( ON ?auto_391232 ?auto_391231 ) ( ON ?auto_391233 ?auto_391232 ) ( ON ?auto_391234 ?auto_391233 ) ( ON ?auto_391235 ?auto_391234 ) ( ON ?auto_391236 ?auto_391235 ) ( ON ?auto_391237 ?auto_391236 ) ( ON ?auto_391238 ?auto_391237 ) ( not ( = ?auto_391229 ?auto_391230 ) ) ( not ( = ?auto_391229 ?auto_391231 ) ) ( not ( = ?auto_391229 ?auto_391232 ) ) ( not ( = ?auto_391229 ?auto_391233 ) ) ( not ( = ?auto_391229 ?auto_391234 ) ) ( not ( = ?auto_391229 ?auto_391235 ) ) ( not ( = ?auto_391229 ?auto_391236 ) ) ( not ( = ?auto_391229 ?auto_391237 ) ) ( not ( = ?auto_391229 ?auto_391238 ) ) ( not ( = ?auto_391229 ?auto_391239 ) ) ( not ( = ?auto_391229 ?auto_391240 ) ) ( not ( = ?auto_391229 ?auto_391241 ) ) ( not ( = ?auto_391229 ?auto_391242 ) ) ( not ( = ?auto_391229 ?auto_391243 ) ) ( not ( = ?auto_391229 ?auto_391244 ) ) ( not ( = ?auto_391230 ?auto_391231 ) ) ( not ( = ?auto_391230 ?auto_391232 ) ) ( not ( = ?auto_391230 ?auto_391233 ) ) ( not ( = ?auto_391230 ?auto_391234 ) ) ( not ( = ?auto_391230 ?auto_391235 ) ) ( not ( = ?auto_391230 ?auto_391236 ) ) ( not ( = ?auto_391230 ?auto_391237 ) ) ( not ( = ?auto_391230 ?auto_391238 ) ) ( not ( = ?auto_391230 ?auto_391239 ) ) ( not ( = ?auto_391230 ?auto_391240 ) ) ( not ( = ?auto_391230 ?auto_391241 ) ) ( not ( = ?auto_391230 ?auto_391242 ) ) ( not ( = ?auto_391230 ?auto_391243 ) ) ( not ( = ?auto_391230 ?auto_391244 ) ) ( not ( = ?auto_391231 ?auto_391232 ) ) ( not ( = ?auto_391231 ?auto_391233 ) ) ( not ( = ?auto_391231 ?auto_391234 ) ) ( not ( = ?auto_391231 ?auto_391235 ) ) ( not ( = ?auto_391231 ?auto_391236 ) ) ( not ( = ?auto_391231 ?auto_391237 ) ) ( not ( = ?auto_391231 ?auto_391238 ) ) ( not ( = ?auto_391231 ?auto_391239 ) ) ( not ( = ?auto_391231 ?auto_391240 ) ) ( not ( = ?auto_391231 ?auto_391241 ) ) ( not ( = ?auto_391231 ?auto_391242 ) ) ( not ( = ?auto_391231 ?auto_391243 ) ) ( not ( = ?auto_391231 ?auto_391244 ) ) ( not ( = ?auto_391232 ?auto_391233 ) ) ( not ( = ?auto_391232 ?auto_391234 ) ) ( not ( = ?auto_391232 ?auto_391235 ) ) ( not ( = ?auto_391232 ?auto_391236 ) ) ( not ( = ?auto_391232 ?auto_391237 ) ) ( not ( = ?auto_391232 ?auto_391238 ) ) ( not ( = ?auto_391232 ?auto_391239 ) ) ( not ( = ?auto_391232 ?auto_391240 ) ) ( not ( = ?auto_391232 ?auto_391241 ) ) ( not ( = ?auto_391232 ?auto_391242 ) ) ( not ( = ?auto_391232 ?auto_391243 ) ) ( not ( = ?auto_391232 ?auto_391244 ) ) ( not ( = ?auto_391233 ?auto_391234 ) ) ( not ( = ?auto_391233 ?auto_391235 ) ) ( not ( = ?auto_391233 ?auto_391236 ) ) ( not ( = ?auto_391233 ?auto_391237 ) ) ( not ( = ?auto_391233 ?auto_391238 ) ) ( not ( = ?auto_391233 ?auto_391239 ) ) ( not ( = ?auto_391233 ?auto_391240 ) ) ( not ( = ?auto_391233 ?auto_391241 ) ) ( not ( = ?auto_391233 ?auto_391242 ) ) ( not ( = ?auto_391233 ?auto_391243 ) ) ( not ( = ?auto_391233 ?auto_391244 ) ) ( not ( = ?auto_391234 ?auto_391235 ) ) ( not ( = ?auto_391234 ?auto_391236 ) ) ( not ( = ?auto_391234 ?auto_391237 ) ) ( not ( = ?auto_391234 ?auto_391238 ) ) ( not ( = ?auto_391234 ?auto_391239 ) ) ( not ( = ?auto_391234 ?auto_391240 ) ) ( not ( = ?auto_391234 ?auto_391241 ) ) ( not ( = ?auto_391234 ?auto_391242 ) ) ( not ( = ?auto_391234 ?auto_391243 ) ) ( not ( = ?auto_391234 ?auto_391244 ) ) ( not ( = ?auto_391235 ?auto_391236 ) ) ( not ( = ?auto_391235 ?auto_391237 ) ) ( not ( = ?auto_391235 ?auto_391238 ) ) ( not ( = ?auto_391235 ?auto_391239 ) ) ( not ( = ?auto_391235 ?auto_391240 ) ) ( not ( = ?auto_391235 ?auto_391241 ) ) ( not ( = ?auto_391235 ?auto_391242 ) ) ( not ( = ?auto_391235 ?auto_391243 ) ) ( not ( = ?auto_391235 ?auto_391244 ) ) ( not ( = ?auto_391236 ?auto_391237 ) ) ( not ( = ?auto_391236 ?auto_391238 ) ) ( not ( = ?auto_391236 ?auto_391239 ) ) ( not ( = ?auto_391236 ?auto_391240 ) ) ( not ( = ?auto_391236 ?auto_391241 ) ) ( not ( = ?auto_391236 ?auto_391242 ) ) ( not ( = ?auto_391236 ?auto_391243 ) ) ( not ( = ?auto_391236 ?auto_391244 ) ) ( not ( = ?auto_391237 ?auto_391238 ) ) ( not ( = ?auto_391237 ?auto_391239 ) ) ( not ( = ?auto_391237 ?auto_391240 ) ) ( not ( = ?auto_391237 ?auto_391241 ) ) ( not ( = ?auto_391237 ?auto_391242 ) ) ( not ( = ?auto_391237 ?auto_391243 ) ) ( not ( = ?auto_391237 ?auto_391244 ) ) ( not ( = ?auto_391238 ?auto_391239 ) ) ( not ( = ?auto_391238 ?auto_391240 ) ) ( not ( = ?auto_391238 ?auto_391241 ) ) ( not ( = ?auto_391238 ?auto_391242 ) ) ( not ( = ?auto_391238 ?auto_391243 ) ) ( not ( = ?auto_391238 ?auto_391244 ) ) ( not ( = ?auto_391239 ?auto_391240 ) ) ( not ( = ?auto_391239 ?auto_391241 ) ) ( not ( = ?auto_391239 ?auto_391242 ) ) ( not ( = ?auto_391239 ?auto_391243 ) ) ( not ( = ?auto_391239 ?auto_391244 ) ) ( not ( = ?auto_391240 ?auto_391241 ) ) ( not ( = ?auto_391240 ?auto_391242 ) ) ( not ( = ?auto_391240 ?auto_391243 ) ) ( not ( = ?auto_391240 ?auto_391244 ) ) ( not ( = ?auto_391241 ?auto_391242 ) ) ( not ( = ?auto_391241 ?auto_391243 ) ) ( not ( = ?auto_391241 ?auto_391244 ) ) ( not ( = ?auto_391242 ?auto_391243 ) ) ( not ( = ?auto_391242 ?auto_391244 ) ) ( not ( = ?auto_391243 ?auto_391244 ) ) ( ON ?auto_391242 ?auto_391243 ) ( ON ?auto_391241 ?auto_391242 ) ( ON ?auto_391240 ?auto_391241 ) ( CLEAR ?auto_391238 ) ( ON ?auto_391239 ?auto_391240 ) ( CLEAR ?auto_391239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_391229 ?auto_391230 ?auto_391231 ?auto_391232 ?auto_391233 ?auto_391234 ?auto_391235 ?auto_391236 ?auto_391237 ?auto_391238 ?auto_391239 )
      ( MAKE-15PILE ?auto_391229 ?auto_391230 ?auto_391231 ?auto_391232 ?auto_391233 ?auto_391234 ?auto_391235 ?auto_391236 ?auto_391237 ?auto_391238 ?auto_391239 ?auto_391240 ?auto_391241 ?auto_391242 ?auto_391243 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391260 - BLOCK
      ?auto_391261 - BLOCK
      ?auto_391262 - BLOCK
      ?auto_391263 - BLOCK
      ?auto_391264 - BLOCK
      ?auto_391265 - BLOCK
      ?auto_391266 - BLOCK
      ?auto_391267 - BLOCK
      ?auto_391268 - BLOCK
      ?auto_391269 - BLOCK
      ?auto_391270 - BLOCK
      ?auto_391271 - BLOCK
      ?auto_391272 - BLOCK
      ?auto_391273 - BLOCK
      ?auto_391274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391274 ) ( ON-TABLE ?auto_391260 ) ( ON ?auto_391261 ?auto_391260 ) ( ON ?auto_391262 ?auto_391261 ) ( ON ?auto_391263 ?auto_391262 ) ( ON ?auto_391264 ?auto_391263 ) ( ON ?auto_391265 ?auto_391264 ) ( ON ?auto_391266 ?auto_391265 ) ( ON ?auto_391267 ?auto_391266 ) ( ON ?auto_391268 ?auto_391267 ) ( ON ?auto_391269 ?auto_391268 ) ( not ( = ?auto_391260 ?auto_391261 ) ) ( not ( = ?auto_391260 ?auto_391262 ) ) ( not ( = ?auto_391260 ?auto_391263 ) ) ( not ( = ?auto_391260 ?auto_391264 ) ) ( not ( = ?auto_391260 ?auto_391265 ) ) ( not ( = ?auto_391260 ?auto_391266 ) ) ( not ( = ?auto_391260 ?auto_391267 ) ) ( not ( = ?auto_391260 ?auto_391268 ) ) ( not ( = ?auto_391260 ?auto_391269 ) ) ( not ( = ?auto_391260 ?auto_391270 ) ) ( not ( = ?auto_391260 ?auto_391271 ) ) ( not ( = ?auto_391260 ?auto_391272 ) ) ( not ( = ?auto_391260 ?auto_391273 ) ) ( not ( = ?auto_391260 ?auto_391274 ) ) ( not ( = ?auto_391261 ?auto_391262 ) ) ( not ( = ?auto_391261 ?auto_391263 ) ) ( not ( = ?auto_391261 ?auto_391264 ) ) ( not ( = ?auto_391261 ?auto_391265 ) ) ( not ( = ?auto_391261 ?auto_391266 ) ) ( not ( = ?auto_391261 ?auto_391267 ) ) ( not ( = ?auto_391261 ?auto_391268 ) ) ( not ( = ?auto_391261 ?auto_391269 ) ) ( not ( = ?auto_391261 ?auto_391270 ) ) ( not ( = ?auto_391261 ?auto_391271 ) ) ( not ( = ?auto_391261 ?auto_391272 ) ) ( not ( = ?auto_391261 ?auto_391273 ) ) ( not ( = ?auto_391261 ?auto_391274 ) ) ( not ( = ?auto_391262 ?auto_391263 ) ) ( not ( = ?auto_391262 ?auto_391264 ) ) ( not ( = ?auto_391262 ?auto_391265 ) ) ( not ( = ?auto_391262 ?auto_391266 ) ) ( not ( = ?auto_391262 ?auto_391267 ) ) ( not ( = ?auto_391262 ?auto_391268 ) ) ( not ( = ?auto_391262 ?auto_391269 ) ) ( not ( = ?auto_391262 ?auto_391270 ) ) ( not ( = ?auto_391262 ?auto_391271 ) ) ( not ( = ?auto_391262 ?auto_391272 ) ) ( not ( = ?auto_391262 ?auto_391273 ) ) ( not ( = ?auto_391262 ?auto_391274 ) ) ( not ( = ?auto_391263 ?auto_391264 ) ) ( not ( = ?auto_391263 ?auto_391265 ) ) ( not ( = ?auto_391263 ?auto_391266 ) ) ( not ( = ?auto_391263 ?auto_391267 ) ) ( not ( = ?auto_391263 ?auto_391268 ) ) ( not ( = ?auto_391263 ?auto_391269 ) ) ( not ( = ?auto_391263 ?auto_391270 ) ) ( not ( = ?auto_391263 ?auto_391271 ) ) ( not ( = ?auto_391263 ?auto_391272 ) ) ( not ( = ?auto_391263 ?auto_391273 ) ) ( not ( = ?auto_391263 ?auto_391274 ) ) ( not ( = ?auto_391264 ?auto_391265 ) ) ( not ( = ?auto_391264 ?auto_391266 ) ) ( not ( = ?auto_391264 ?auto_391267 ) ) ( not ( = ?auto_391264 ?auto_391268 ) ) ( not ( = ?auto_391264 ?auto_391269 ) ) ( not ( = ?auto_391264 ?auto_391270 ) ) ( not ( = ?auto_391264 ?auto_391271 ) ) ( not ( = ?auto_391264 ?auto_391272 ) ) ( not ( = ?auto_391264 ?auto_391273 ) ) ( not ( = ?auto_391264 ?auto_391274 ) ) ( not ( = ?auto_391265 ?auto_391266 ) ) ( not ( = ?auto_391265 ?auto_391267 ) ) ( not ( = ?auto_391265 ?auto_391268 ) ) ( not ( = ?auto_391265 ?auto_391269 ) ) ( not ( = ?auto_391265 ?auto_391270 ) ) ( not ( = ?auto_391265 ?auto_391271 ) ) ( not ( = ?auto_391265 ?auto_391272 ) ) ( not ( = ?auto_391265 ?auto_391273 ) ) ( not ( = ?auto_391265 ?auto_391274 ) ) ( not ( = ?auto_391266 ?auto_391267 ) ) ( not ( = ?auto_391266 ?auto_391268 ) ) ( not ( = ?auto_391266 ?auto_391269 ) ) ( not ( = ?auto_391266 ?auto_391270 ) ) ( not ( = ?auto_391266 ?auto_391271 ) ) ( not ( = ?auto_391266 ?auto_391272 ) ) ( not ( = ?auto_391266 ?auto_391273 ) ) ( not ( = ?auto_391266 ?auto_391274 ) ) ( not ( = ?auto_391267 ?auto_391268 ) ) ( not ( = ?auto_391267 ?auto_391269 ) ) ( not ( = ?auto_391267 ?auto_391270 ) ) ( not ( = ?auto_391267 ?auto_391271 ) ) ( not ( = ?auto_391267 ?auto_391272 ) ) ( not ( = ?auto_391267 ?auto_391273 ) ) ( not ( = ?auto_391267 ?auto_391274 ) ) ( not ( = ?auto_391268 ?auto_391269 ) ) ( not ( = ?auto_391268 ?auto_391270 ) ) ( not ( = ?auto_391268 ?auto_391271 ) ) ( not ( = ?auto_391268 ?auto_391272 ) ) ( not ( = ?auto_391268 ?auto_391273 ) ) ( not ( = ?auto_391268 ?auto_391274 ) ) ( not ( = ?auto_391269 ?auto_391270 ) ) ( not ( = ?auto_391269 ?auto_391271 ) ) ( not ( = ?auto_391269 ?auto_391272 ) ) ( not ( = ?auto_391269 ?auto_391273 ) ) ( not ( = ?auto_391269 ?auto_391274 ) ) ( not ( = ?auto_391270 ?auto_391271 ) ) ( not ( = ?auto_391270 ?auto_391272 ) ) ( not ( = ?auto_391270 ?auto_391273 ) ) ( not ( = ?auto_391270 ?auto_391274 ) ) ( not ( = ?auto_391271 ?auto_391272 ) ) ( not ( = ?auto_391271 ?auto_391273 ) ) ( not ( = ?auto_391271 ?auto_391274 ) ) ( not ( = ?auto_391272 ?auto_391273 ) ) ( not ( = ?auto_391272 ?auto_391274 ) ) ( not ( = ?auto_391273 ?auto_391274 ) ) ( ON ?auto_391273 ?auto_391274 ) ( ON ?auto_391272 ?auto_391273 ) ( ON ?auto_391271 ?auto_391272 ) ( CLEAR ?auto_391269 ) ( ON ?auto_391270 ?auto_391271 ) ( CLEAR ?auto_391270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_391260 ?auto_391261 ?auto_391262 ?auto_391263 ?auto_391264 ?auto_391265 ?auto_391266 ?auto_391267 ?auto_391268 ?auto_391269 ?auto_391270 )
      ( MAKE-15PILE ?auto_391260 ?auto_391261 ?auto_391262 ?auto_391263 ?auto_391264 ?auto_391265 ?auto_391266 ?auto_391267 ?auto_391268 ?auto_391269 ?auto_391270 ?auto_391271 ?auto_391272 ?auto_391273 ?auto_391274 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391290 - BLOCK
      ?auto_391291 - BLOCK
      ?auto_391292 - BLOCK
      ?auto_391293 - BLOCK
      ?auto_391294 - BLOCK
      ?auto_391295 - BLOCK
      ?auto_391296 - BLOCK
      ?auto_391297 - BLOCK
      ?auto_391298 - BLOCK
      ?auto_391299 - BLOCK
      ?auto_391300 - BLOCK
      ?auto_391301 - BLOCK
      ?auto_391302 - BLOCK
      ?auto_391303 - BLOCK
      ?auto_391304 - BLOCK
    )
    :vars
    (
      ?auto_391305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391304 ?auto_391305 ) ( ON-TABLE ?auto_391290 ) ( ON ?auto_391291 ?auto_391290 ) ( ON ?auto_391292 ?auto_391291 ) ( ON ?auto_391293 ?auto_391292 ) ( ON ?auto_391294 ?auto_391293 ) ( ON ?auto_391295 ?auto_391294 ) ( ON ?auto_391296 ?auto_391295 ) ( ON ?auto_391297 ?auto_391296 ) ( ON ?auto_391298 ?auto_391297 ) ( not ( = ?auto_391290 ?auto_391291 ) ) ( not ( = ?auto_391290 ?auto_391292 ) ) ( not ( = ?auto_391290 ?auto_391293 ) ) ( not ( = ?auto_391290 ?auto_391294 ) ) ( not ( = ?auto_391290 ?auto_391295 ) ) ( not ( = ?auto_391290 ?auto_391296 ) ) ( not ( = ?auto_391290 ?auto_391297 ) ) ( not ( = ?auto_391290 ?auto_391298 ) ) ( not ( = ?auto_391290 ?auto_391299 ) ) ( not ( = ?auto_391290 ?auto_391300 ) ) ( not ( = ?auto_391290 ?auto_391301 ) ) ( not ( = ?auto_391290 ?auto_391302 ) ) ( not ( = ?auto_391290 ?auto_391303 ) ) ( not ( = ?auto_391290 ?auto_391304 ) ) ( not ( = ?auto_391290 ?auto_391305 ) ) ( not ( = ?auto_391291 ?auto_391292 ) ) ( not ( = ?auto_391291 ?auto_391293 ) ) ( not ( = ?auto_391291 ?auto_391294 ) ) ( not ( = ?auto_391291 ?auto_391295 ) ) ( not ( = ?auto_391291 ?auto_391296 ) ) ( not ( = ?auto_391291 ?auto_391297 ) ) ( not ( = ?auto_391291 ?auto_391298 ) ) ( not ( = ?auto_391291 ?auto_391299 ) ) ( not ( = ?auto_391291 ?auto_391300 ) ) ( not ( = ?auto_391291 ?auto_391301 ) ) ( not ( = ?auto_391291 ?auto_391302 ) ) ( not ( = ?auto_391291 ?auto_391303 ) ) ( not ( = ?auto_391291 ?auto_391304 ) ) ( not ( = ?auto_391291 ?auto_391305 ) ) ( not ( = ?auto_391292 ?auto_391293 ) ) ( not ( = ?auto_391292 ?auto_391294 ) ) ( not ( = ?auto_391292 ?auto_391295 ) ) ( not ( = ?auto_391292 ?auto_391296 ) ) ( not ( = ?auto_391292 ?auto_391297 ) ) ( not ( = ?auto_391292 ?auto_391298 ) ) ( not ( = ?auto_391292 ?auto_391299 ) ) ( not ( = ?auto_391292 ?auto_391300 ) ) ( not ( = ?auto_391292 ?auto_391301 ) ) ( not ( = ?auto_391292 ?auto_391302 ) ) ( not ( = ?auto_391292 ?auto_391303 ) ) ( not ( = ?auto_391292 ?auto_391304 ) ) ( not ( = ?auto_391292 ?auto_391305 ) ) ( not ( = ?auto_391293 ?auto_391294 ) ) ( not ( = ?auto_391293 ?auto_391295 ) ) ( not ( = ?auto_391293 ?auto_391296 ) ) ( not ( = ?auto_391293 ?auto_391297 ) ) ( not ( = ?auto_391293 ?auto_391298 ) ) ( not ( = ?auto_391293 ?auto_391299 ) ) ( not ( = ?auto_391293 ?auto_391300 ) ) ( not ( = ?auto_391293 ?auto_391301 ) ) ( not ( = ?auto_391293 ?auto_391302 ) ) ( not ( = ?auto_391293 ?auto_391303 ) ) ( not ( = ?auto_391293 ?auto_391304 ) ) ( not ( = ?auto_391293 ?auto_391305 ) ) ( not ( = ?auto_391294 ?auto_391295 ) ) ( not ( = ?auto_391294 ?auto_391296 ) ) ( not ( = ?auto_391294 ?auto_391297 ) ) ( not ( = ?auto_391294 ?auto_391298 ) ) ( not ( = ?auto_391294 ?auto_391299 ) ) ( not ( = ?auto_391294 ?auto_391300 ) ) ( not ( = ?auto_391294 ?auto_391301 ) ) ( not ( = ?auto_391294 ?auto_391302 ) ) ( not ( = ?auto_391294 ?auto_391303 ) ) ( not ( = ?auto_391294 ?auto_391304 ) ) ( not ( = ?auto_391294 ?auto_391305 ) ) ( not ( = ?auto_391295 ?auto_391296 ) ) ( not ( = ?auto_391295 ?auto_391297 ) ) ( not ( = ?auto_391295 ?auto_391298 ) ) ( not ( = ?auto_391295 ?auto_391299 ) ) ( not ( = ?auto_391295 ?auto_391300 ) ) ( not ( = ?auto_391295 ?auto_391301 ) ) ( not ( = ?auto_391295 ?auto_391302 ) ) ( not ( = ?auto_391295 ?auto_391303 ) ) ( not ( = ?auto_391295 ?auto_391304 ) ) ( not ( = ?auto_391295 ?auto_391305 ) ) ( not ( = ?auto_391296 ?auto_391297 ) ) ( not ( = ?auto_391296 ?auto_391298 ) ) ( not ( = ?auto_391296 ?auto_391299 ) ) ( not ( = ?auto_391296 ?auto_391300 ) ) ( not ( = ?auto_391296 ?auto_391301 ) ) ( not ( = ?auto_391296 ?auto_391302 ) ) ( not ( = ?auto_391296 ?auto_391303 ) ) ( not ( = ?auto_391296 ?auto_391304 ) ) ( not ( = ?auto_391296 ?auto_391305 ) ) ( not ( = ?auto_391297 ?auto_391298 ) ) ( not ( = ?auto_391297 ?auto_391299 ) ) ( not ( = ?auto_391297 ?auto_391300 ) ) ( not ( = ?auto_391297 ?auto_391301 ) ) ( not ( = ?auto_391297 ?auto_391302 ) ) ( not ( = ?auto_391297 ?auto_391303 ) ) ( not ( = ?auto_391297 ?auto_391304 ) ) ( not ( = ?auto_391297 ?auto_391305 ) ) ( not ( = ?auto_391298 ?auto_391299 ) ) ( not ( = ?auto_391298 ?auto_391300 ) ) ( not ( = ?auto_391298 ?auto_391301 ) ) ( not ( = ?auto_391298 ?auto_391302 ) ) ( not ( = ?auto_391298 ?auto_391303 ) ) ( not ( = ?auto_391298 ?auto_391304 ) ) ( not ( = ?auto_391298 ?auto_391305 ) ) ( not ( = ?auto_391299 ?auto_391300 ) ) ( not ( = ?auto_391299 ?auto_391301 ) ) ( not ( = ?auto_391299 ?auto_391302 ) ) ( not ( = ?auto_391299 ?auto_391303 ) ) ( not ( = ?auto_391299 ?auto_391304 ) ) ( not ( = ?auto_391299 ?auto_391305 ) ) ( not ( = ?auto_391300 ?auto_391301 ) ) ( not ( = ?auto_391300 ?auto_391302 ) ) ( not ( = ?auto_391300 ?auto_391303 ) ) ( not ( = ?auto_391300 ?auto_391304 ) ) ( not ( = ?auto_391300 ?auto_391305 ) ) ( not ( = ?auto_391301 ?auto_391302 ) ) ( not ( = ?auto_391301 ?auto_391303 ) ) ( not ( = ?auto_391301 ?auto_391304 ) ) ( not ( = ?auto_391301 ?auto_391305 ) ) ( not ( = ?auto_391302 ?auto_391303 ) ) ( not ( = ?auto_391302 ?auto_391304 ) ) ( not ( = ?auto_391302 ?auto_391305 ) ) ( not ( = ?auto_391303 ?auto_391304 ) ) ( not ( = ?auto_391303 ?auto_391305 ) ) ( not ( = ?auto_391304 ?auto_391305 ) ) ( ON ?auto_391303 ?auto_391304 ) ( ON ?auto_391302 ?auto_391303 ) ( ON ?auto_391301 ?auto_391302 ) ( ON ?auto_391300 ?auto_391301 ) ( CLEAR ?auto_391298 ) ( ON ?auto_391299 ?auto_391300 ) ( CLEAR ?auto_391299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_391290 ?auto_391291 ?auto_391292 ?auto_391293 ?auto_391294 ?auto_391295 ?auto_391296 ?auto_391297 ?auto_391298 ?auto_391299 )
      ( MAKE-15PILE ?auto_391290 ?auto_391291 ?auto_391292 ?auto_391293 ?auto_391294 ?auto_391295 ?auto_391296 ?auto_391297 ?auto_391298 ?auto_391299 ?auto_391300 ?auto_391301 ?auto_391302 ?auto_391303 ?auto_391304 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391321 - BLOCK
      ?auto_391322 - BLOCK
      ?auto_391323 - BLOCK
      ?auto_391324 - BLOCK
      ?auto_391325 - BLOCK
      ?auto_391326 - BLOCK
      ?auto_391327 - BLOCK
      ?auto_391328 - BLOCK
      ?auto_391329 - BLOCK
      ?auto_391330 - BLOCK
      ?auto_391331 - BLOCK
      ?auto_391332 - BLOCK
      ?auto_391333 - BLOCK
      ?auto_391334 - BLOCK
      ?auto_391335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391335 ) ( ON-TABLE ?auto_391321 ) ( ON ?auto_391322 ?auto_391321 ) ( ON ?auto_391323 ?auto_391322 ) ( ON ?auto_391324 ?auto_391323 ) ( ON ?auto_391325 ?auto_391324 ) ( ON ?auto_391326 ?auto_391325 ) ( ON ?auto_391327 ?auto_391326 ) ( ON ?auto_391328 ?auto_391327 ) ( ON ?auto_391329 ?auto_391328 ) ( not ( = ?auto_391321 ?auto_391322 ) ) ( not ( = ?auto_391321 ?auto_391323 ) ) ( not ( = ?auto_391321 ?auto_391324 ) ) ( not ( = ?auto_391321 ?auto_391325 ) ) ( not ( = ?auto_391321 ?auto_391326 ) ) ( not ( = ?auto_391321 ?auto_391327 ) ) ( not ( = ?auto_391321 ?auto_391328 ) ) ( not ( = ?auto_391321 ?auto_391329 ) ) ( not ( = ?auto_391321 ?auto_391330 ) ) ( not ( = ?auto_391321 ?auto_391331 ) ) ( not ( = ?auto_391321 ?auto_391332 ) ) ( not ( = ?auto_391321 ?auto_391333 ) ) ( not ( = ?auto_391321 ?auto_391334 ) ) ( not ( = ?auto_391321 ?auto_391335 ) ) ( not ( = ?auto_391322 ?auto_391323 ) ) ( not ( = ?auto_391322 ?auto_391324 ) ) ( not ( = ?auto_391322 ?auto_391325 ) ) ( not ( = ?auto_391322 ?auto_391326 ) ) ( not ( = ?auto_391322 ?auto_391327 ) ) ( not ( = ?auto_391322 ?auto_391328 ) ) ( not ( = ?auto_391322 ?auto_391329 ) ) ( not ( = ?auto_391322 ?auto_391330 ) ) ( not ( = ?auto_391322 ?auto_391331 ) ) ( not ( = ?auto_391322 ?auto_391332 ) ) ( not ( = ?auto_391322 ?auto_391333 ) ) ( not ( = ?auto_391322 ?auto_391334 ) ) ( not ( = ?auto_391322 ?auto_391335 ) ) ( not ( = ?auto_391323 ?auto_391324 ) ) ( not ( = ?auto_391323 ?auto_391325 ) ) ( not ( = ?auto_391323 ?auto_391326 ) ) ( not ( = ?auto_391323 ?auto_391327 ) ) ( not ( = ?auto_391323 ?auto_391328 ) ) ( not ( = ?auto_391323 ?auto_391329 ) ) ( not ( = ?auto_391323 ?auto_391330 ) ) ( not ( = ?auto_391323 ?auto_391331 ) ) ( not ( = ?auto_391323 ?auto_391332 ) ) ( not ( = ?auto_391323 ?auto_391333 ) ) ( not ( = ?auto_391323 ?auto_391334 ) ) ( not ( = ?auto_391323 ?auto_391335 ) ) ( not ( = ?auto_391324 ?auto_391325 ) ) ( not ( = ?auto_391324 ?auto_391326 ) ) ( not ( = ?auto_391324 ?auto_391327 ) ) ( not ( = ?auto_391324 ?auto_391328 ) ) ( not ( = ?auto_391324 ?auto_391329 ) ) ( not ( = ?auto_391324 ?auto_391330 ) ) ( not ( = ?auto_391324 ?auto_391331 ) ) ( not ( = ?auto_391324 ?auto_391332 ) ) ( not ( = ?auto_391324 ?auto_391333 ) ) ( not ( = ?auto_391324 ?auto_391334 ) ) ( not ( = ?auto_391324 ?auto_391335 ) ) ( not ( = ?auto_391325 ?auto_391326 ) ) ( not ( = ?auto_391325 ?auto_391327 ) ) ( not ( = ?auto_391325 ?auto_391328 ) ) ( not ( = ?auto_391325 ?auto_391329 ) ) ( not ( = ?auto_391325 ?auto_391330 ) ) ( not ( = ?auto_391325 ?auto_391331 ) ) ( not ( = ?auto_391325 ?auto_391332 ) ) ( not ( = ?auto_391325 ?auto_391333 ) ) ( not ( = ?auto_391325 ?auto_391334 ) ) ( not ( = ?auto_391325 ?auto_391335 ) ) ( not ( = ?auto_391326 ?auto_391327 ) ) ( not ( = ?auto_391326 ?auto_391328 ) ) ( not ( = ?auto_391326 ?auto_391329 ) ) ( not ( = ?auto_391326 ?auto_391330 ) ) ( not ( = ?auto_391326 ?auto_391331 ) ) ( not ( = ?auto_391326 ?auto_391332 ) ) ( not ( = ?auto_391326 ?auto_391333 ) ) ( not ( = ?auto_391326 ?auto_391334 ) ) ( not ( = ?auto_391326 ?auto_391335 ) ) ( not ( = ?auto_391327 ?auto_391328 ) ) ( not ( = ?auto_391327 ?auto_391329 ) ) ( not ( = ?auto_391327 ?auto_391330 ) ) ( not ( = ?auto_391327 ?auto_391331 ) ) ( not ( = ?auto_391327 ?auto_391332 ) ) ( not ( = ?auto_391327 ?auto_391333 ) ) ( not ( = ?auto_391327 ?auto_391334 ) ) ( not ( = ?auto_391327 ?auto_391335 ) ) ( not ( = ?auto_391328 ?auto_391329 ) ) ( not ( = ?auto_391328 ?auto_391330 ) ) ( not ( = ?auto_391328 ?auto_391331 ) ) ( not ( = ?auto_391328 ?auto_391332 ) ) ( not ( = ?auto_391328 ?auto_391333 ) ) ( not ( = ?auto_391328 ?auto_391334 ) ) ( not ( = ?auto_391328 ?auto_391335 ) ) ( not ( = ?auto_391329 ?auto_391330 ) ) ( not ( = ?auto_391329 ?auto_391331 ) ) ( not ( = ?auto_391329 ?auto_391332 ) ) ( not ( = ?auto_391329 ?auto_391333 ) ) ( not ( = ?auto_391329 ?auto_391334 ) ) ( not ( = ?auto_391329 ?auto_391335 ) ) ( not ( = ?auto_391330 ?auto_391331 ) ) ( not ( = ?auto_391330 ?auto_391332 ) ) ( not ( = ?auto_391330 ?auto_391333 ) ) ( not ( = ?auto_391330 ?auto_391334 ) ) ( not ( = ?auto_391330 ?auto_391335 ) ) ( not ( = ?auto_391331 ?auto_391332 ) ) ( not ( = ?auto_391331 ?auto_391333 ) ) ( not ( = ?auto_391331 ?auto_391334 ) ) ( not ( = ?auto_391331 ?auto_391335 ) ) ( not ( = ?auto_391332 ?auto_391333 ) ) ( not ( = ?auto_391332 ?auto_391334 ) ) ( not ( = ?auto_391332 ?auto_391335 ) ) ( not ( = ?auto_391333 ?auto_391334 ) ) ( not ( = ?auto_391333 ?auto_391335 ) ) ( not ( = ?auto_391334 ?auto_391335 ) ) ( ON ?auto_391334 ?auto_391335 ) ( ON ?auto_391333 ?auto_391334 ) ( ON ?auto_391332 ?auto_391333 ) ( ON ?auto_391331 ?auto_391332 ) ( CLEAR ?auto_391329 ) ( ON ?auto_391330 ?auto_391331 ) ( CLEAR ?auto_391330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_391321 ?auto_391322 ?auto_391323 ?auto_391324 ?auto_391325 ?auto_391326 ?auto_391327 ?auto_391328 ?auto_391329 ?auto_391330 )
      ( MAKE-15PILE ?auto_391321 ?auto_391322 ?auto_391323 ?auto_391324 ?auto_391325 ?auto_391326 ?auto_391327 ?auto_391328 ?auto_391329 ?auto_391330 ?auto_391331 ?auto_391332 ?auto_391333 ?auto_391334 ?auto_391335 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391351 - BLOCK
      ?auto_391352 - BLOCK
      ?auto_391353 - BLOCK
      ?auto_391354 - BLOCK
      ?auto_391355 - BLOCK
      ?auto_391356 - BLOCK
      ?auto_391357 - BLOCK
      ?auto_391358 - BLOCK
      ?auto_391359 - BLOCK
      ?auto_391360 - BLOCK
      ?auto_391361 - BLOCK
      ?auto_391362 - BLOCK
      ?auto_391363 - BLOCK
      ?auto_391364 - BLOCK
      ?auto_391365 - BLOCK
    )
    :vars
    (
      ?auto_391366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391365 ?auto_391366 ) ( ON-TABLE ?auto_391351 ) ( ON ?auto_391352 ?auto_391351 ) ( ON ?auto_391353 ?auto_391352 ) ( ON ?auto_391354 ?auto_391353 ) ( ON ?auto_391355 ?auto_391354 ) ( ON ?auto_391356 ?auto_391355 ) ( ON ?auto_391357 ?auto_391356 ) ( ON ?auto_391358 ?auto_391357 ) ( not ( = ?auto_391351 ?auto_391352 ) ) ( not ( = ?auto_391351 ?auto_391353 ) ) ( not ( = ?auto_391351 ?auto_391354 ) ) ( not ( = ?auto_391351 ?auto_391355 ) ) ( not ( = ?auto_391351 ?auto_391356 ) ) ( not ( = ?auto_391351 ?auto_391357 ) ) ( not ( = ?auto_391351 ?auto_391358 ) ) ( not ( = ?auto_391351 ?auto_391359 ) ) ( not ( = ?auto_391351 ?auto_391360 ) ) ( not ( = ?auto_391351 ?auto_391361 ) ) ( not ( = ?auto_391351 ?auto_391362 ) ) ( not ( = ?auto_391351 ?auto_391363 ) ) ( not ( = ?auto_391351 ?auto_391364 ) ) ( not ( = ?auto_391351 ?auto_391365 ) ) ( not ( = ?auto_391351 ?auto_391366 ) ) ( not ( = ?auto_391352 ?auto_391353 ) ) ( not ( = ?auto_391352 ?auto_391354 ) ) ( not ( = ?auto_391352 ?auto_391355 ) ) ( not ( = ?auto_391352 ?auto_391356 ) ) ( not ( = ?auto_391352 ?auto_391357 ) ) ( not ( = ?auto_391352 ?auto_391358 ) ) ( not ( = ?auto_391352 ?auto_391359 ) ) ( not ( = ?auto_391352 ?auto_391360 ) ) ( not ( = ?auto_391352 ?auto_391361 ) ) ( not ( = ?auto_391352 ?auto_391362 ) ) ( not ( = ?auto_391352 ?auto_391363 ) ) ( not ( = ?auto_391352 ?auto_391364 ) ) ( not ( = ?auto_391352 ?auto_391365 ) ) ( not ( = ?auto_391352 ?auto_391366 ) ) ( not ( = ?auto_391353 ?auto_391354 ) ) ( not ( = ?auto_391353 ?auto_391355 ) ) ( not ( = ?auto_391353 ?auto_391356 ) ) ( not ( = ?auto_391353 ?auto_391357 ) ) ( not ( = ?auto_391353 ?auto_391358 ) ) ( not ( = ?auto_391353 ?auto_391359 ) ) ( not ( = ?auto_391353 ?auto_391360 ) ) ( not ( = ?auto_391353 ?auto_391361 ) ) ( not ( = ?auto_391353 ?auto_391362 ) ) ( not ( = ?auto_391353 ?auto_391363 ) ) ( not ( = ?auto_391353 ?auto_391364 ) ) ( not ( = ?auto_391353 ?auto_391365 ) ) ( not ( = ?auto_391353 ?auto_391366 ) ) ( not ( = ?auto_391354 ?auto_391355 ) ) ( not ( = ?auto_391354 ?auto_391356 ) ) ( not ( = ?auto_391354 ?auto_391357 ) ) ( not ( = ?auto_391354 ?auto_391358 ) ) ( not ( = ?auto_391354 ?auto_391359 ) ) ( not ( = ?auto_391354 ?auto_391360 ) ) ( not ( = ?auto_391354 ?auto_391361 ) ) ( not ( = ?auto_391354 ?auto_391362 ) ) ( not ( = ?auto_391354 ?auto_391363 ) ) ( not ( = ?auto_391354 ?auto_391364 ) ) ( not ( = ?auto_391354 ?auto_391365 ) ) ( not ( = ?auto_391354 ?auto_391366 ) ) ( not ( = ?auto_391355 ?auto_391356 ) ) ( not ( = ?auto_391355 ?auto_391357 ) ) ( not ( = ?auto_391355 ?auto_391358 ) ) ( not ( = ?auto_391355 ?auto_391359 ) ) ( not ( = ?auto_391355 ?auto_391360 ) ) ( not ( = ?auto_391355 ?auto_391361 ) ) ( not ( = ?auto_391355 ?auto_391362 ) ) ( not ( = ?auto_391355 ?auto_391363 ) ) ( not ( = ?auto_391355 ?auto_391364 ) ) ( not ( = ?auto_391355 ?auto_391365 ) ) ( not ( = ?auto_391355 ?auto_391366 ) ) ( not ( = ?auto_391356 ?auto_391357 ) ) ( not ( = ?auto_391356 ?auto_391358 ) ) ( not ( = ?auto_391356 ?auto_391359 ) ) ( not ( = ?auto_391356 ?auto_391360 ) ) ( not ( = ?auto_391356 ?auto_391361 ) ) ( not ( = ?auto_391356 ?auto_391362 ) ) ( not ( = ?auto_391356 ?auto_391363 ) ) ( not ( = ?auto_391356 ?auto_391364 ) ) ( not ( = ?auto_391356 ?auto_391365 ) ) ( not ( = ?auto_391356 ?auto_391366 ) ) ( not ( = ?auto_391357 ?auto_391358 ) ) ( not ( = ?auto_391357 ?auto_391359 ) ) ( not ( = ?auto_391357 ?auto_391360 ) ) ( not ( = ?auto_391357 ?auto_391361 ) ) ( not ( = ?auto_391357 ?auto_391362 ) ) ( not ( = ?auto_391357 ?auto_391363 ) ) ( not ( = ?auto_391357 ?auto_391364 ) ) ( not ( = ?auto_391357 ?auto_391365 ) ) ( not ( = ?auto_391357 ?auto_391366 ) ) ( not ( = ?auto_391358 ?auto_391359 ) ) ( not ( = ?auto_391358 ?auto_391360 ) ) ( not ( = ?auto_391358 ?auto_391361 ) ) ( not ( = ?auto_391358 ?auto_391362 ) ) ( not ( = ?auto_391358 ?auto_391363 ) ) ( not ( = ?auto_391358 ?auto_391364 ) ) ( not ( = ?auto_391358 ?auto_391365 ) ) ( not ( = ?auto_391358 ?auto_391366 ) ) ( not ( = ?auto_391359 ?auto_391360 ) ) ( not ( = ?auto_391359 ?auto_391361 ) ) ( not ( = ?auto_391359 ?auto_391362 ) ) ( not ( = ?auto_391359 ?auto_391363 ) ) ( not ( = ?auto_391359 ?auto_391364 ) ) ( not ( = ?auto_391359 ?auto_391365 ) ) ( not ( = ?auto_391359 ?auto_391366 ) ) ( not ( = ?auto_391360 ?auto_391361 ) ) ( not ( = ?auto_391360 ?auto_391362 ) ) ( not ( = ?auto_391360 ?auto_391363 ) ) ( not ( = ?auto_391360 ?auto_391364 ) ) ( not ( = ?auto_391360 ?auto_391365 ) ) ( not ( = ?auto_391360 ?auto_391366 ) ) ( not ( = ?auto_391361 ?auto_391362 ) ) ( not ( = ?auto_391361 ?auto_391363 ) ) ( not ( = ?auto_391361 ?auto_391364 ) ) ( not ( = ?auto_391361 ?auto_391365 ) ) ( not ( = ?auto_391361 ?auto_391366 ) ) ( not ( = ?auto_391362 ?auto_391363 ) ) ( not ( = ?auto_391362 ?auto_391364 ) ) ( not ( = ?auto_391362 ?auto_391365 ) ) ( not ( = ?auto_391362 ?auto_391366 ) ) ( not ( = ?auto_391363 ?auto_391364 ) ) ( not ( = ?auto_391363 ?auto_391365 ) ) ( not ( = ?auto_391363 ?auto_391366 ) ) ( not ( = ?auto_391364 ?auto_391365 ) ) ( not ( = ?auto_391364 ?auto_391366 ) ) ( not ( = ?auto_391365 ?auto_391366 ) ) ( ON ?auto_391364 ?auto_391365 ) ( ON ?auto_391363 ?auto_391364 ) ( ON ?auto_391362 ?auto_391363 ) ( ON ?auto_391361 ?auto_391362 ) ( ON ?auto_391360 ?auto_391361 ) ( CLEAR ?auto_391358 ) ( ON ?auto_391359 ?auto_391360 ) ( CLEAR ?auto_391359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_391351 ?auto_391352 ?auto_391353 ?auto_391354 ?auto_391355 ?auto_391356 ?auto_391357 ?auto_391358 ?auto_391359 )
      ( MAKE-15PILE ?auto_391351 ?auto_391352 ?auto_391353 ?auto_391354 ?auto_391355 ?auto_391356 ?auto_391357 ?auto_391358 ?auto_391359 ?auto_391360 ?auto_391361 ?auto_391362 ?auto_391363 ?auto_391364 ?auto_391365 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391382 - BLOCK
      ?auto_391383 - BLOCK
      ?auto_391384 - BLOCK
      ?auto_391385 - BLOCK
      ?auto_391386 - BLOCK
      ?auto_391387 - BLOCK
      ?auto_391388 - BLOCK
      ?auto_391389 - BLOCK
      ?auto_391390 - BLOCK
      ?auto_391391 - BLOCK
      ?auto_391392 - BLOCK
      ?auto_391393 - BLOCK
      ?auto_391394 - BLOCK
      ?auto_391395 - BLOCK
      ?auto_391396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391396 ) ( ON-TABLE ?auto_391382 ) ( ON ?auto_391383 ?auto_391382 ) ( ON ?auto_391384 ?auto_391383 ) ( ON ?auto_391385 ?auto_391384 ) ( ON ?auto_391386 ?auto_391385 ) ( ON ?auto_391387 ?auto_391386 ) ( ON ?auto_391388 ?auto_391387 ) ( ON ?auto_391389 ?auto_391388 ) ( not ( = ?auto_391382 ?auto_391383 ) ) ( not ( = ?auto_391382 ?auto_391384 ) ) ( not ( = ?auto_391382 ?auto_391385 ) ) ( not ( = ?auto_391382 ?auto_391386 ) ) ( not ( = ?auto_391382 ?auto_391387 ) ) ( not ( = ?auto_391382 ?auto_391388 ) ) ( not ( = ?auto_391382 ?auto_391389 ) ) ( not ( = ?auto_391382 ?auto_391390 ) ) ( not ( = ?auto_391382 ?auto_391391 ) ) ( not ( = ?auto_391382 ?auto_391392 ) ) ( not ( = ?auto_391382 ?auto_391393 ) ) ( not ( = ?auto_391382 ?auto_391394 ) ) ( not ( = ?auto_391382 ?auto_391395 ) ) ( not ( = ?auto_391382 ?auto_391396 ) ) ( not ( = ?auto_391383 ?auto_391384 ) ) ( not ( = ?auto_391383 ?auto_391385 ) ) ( not ( = ?auto_391383 ?auto_391386 ) ) ( not ( = ?auto_391383 ?auto_391387 ) ) ( not ( = ?auto_391383 ?auto_391388 ) ) ( not ( = ?auto_391383 ?auto_391389 ) ) ( not ( = ?auto_391383 ?auto_391390 ) ) ( not ( = ?auto_391383 ?auto_391391 ) ) ( not ( = ?auto_391383 ?auto_391392 ) ) ( not ( = ?auto_391383 ?auto_391393 ) ) ( not ( = ?auto_391383 ?auto_391394 ) ) ( not ( = ?auto_391383 ?auto_391395 ) ) ( not ( = ?auto_391383 ?auto_391396 ) ) ( not ( = ?auto_391384 ?auto_391385 ) ) ( not ( = ?auto_391384 ?auto_391386 ) ) ( not ( = ?auto_391384 ?auto_391387 ) ) ( not ( = ?auto_391384 ?auto_391388 ) ) ( not ( = ?auto_391384 ?auto_391389 ) ) ( not ( = ?auto_391384 ?auto_391390 ) ) ( not ( = ?auto_391384 ?auto_391391 ) ) ( not ( = ?auto_391384 ?auto_391392 ) ) ( not ( = ?auto_391384 ?auto_391393 ) ) ( not ( = ?auto_391384 ?auto_391394 ) ) ( not ( = ?auto_391384 ?auto_391395 ) ) ( not ( = ?auto_391384 ?auto_391396 ) ) ( not ( = ?auto_391385 ?auto_391386 ) ) ( not ( = ?auto_391385 ?auto_391387 ) ) ( not ( = ?auto_391385 ?auto_391388 ) ) ( not ( = ?auto_391385 ?auto_391389 ) ) ( not ( = ?auto_391385 ?auto_391390 ) ) ( not ( = ?auto_391385 ?auto_391391 ) ) ( not ( = ?auto_391385 ?auto_391392 ) ) ( not ( = ?auto_391385 ?auto_391393 ) ) ( not ( = ?auto_391385 ?auto_391394 ) ) ( not ( = ?auto_391385 ?auto_391395 ) ) ( not ( = ?auto_391385 ?auto_391396 ) ) ( not ( = ?auto_391386 ?auto_391387 ) ) ( not ( = ?auto_391386 ?auto_391388 ) ) ( not ( = ?auto_391386 ?auto_391389 ) ) ( not ( = ?auto_391386 ?auto_391390 ) ) ( not ( = ?auto_391386 ?auto_391391 ) ) ( not ( = ?auto_391386 ?auto_391392 ) ) ( not ( = ?auto_391386 ?auto_391393 ) ) ( not ( = ?auto_391386 ?auto_391394 ) ) ( not ( = ?auto_391386 ?auto_391395 ) ) ( not ( = ?auto_391386 ?auto_391396 ) ) ( not ( = ?auto_391387 ?auto_391388 ) ) ( not ( = ?auto_391387 ?auto_391389 ) ) ( not ( = ?auto_391387 ?auto_391390 ) ) ( not ( = ?auto_391387 ?auto_391391 ) ) ( not ( = ?auto_391387 ?auto_391392 ) ) ( not ( = ?auto_391387 ?auto_391393 ) ) ( not ( = ?auto_391387 ?auto_391394 ) ) ( not ( = ?auto_391387 ?auto_391395 ) ) ( not ( = ?auto_391387 ?auto_391396 ) ) ( not ( = ?auto_391388 ?auto_391389 ) ) ( not ( = ?auto_391388 ?auto_391390 ) ) ( not ( = ?auto_391388 ?auto_391391 ) ) ( not ( = ?auto_391388 ?auto_391392 ) ) ( not ( = ?auto_391388 ?auto_391393 ) ) ( not ( = ?auto_391388 ?auto_391394 ) ) ( not ( = ?auto_391388 ?auto_391395 ) ) ( not ( = ?auto_391388 ?auto_391396 ) ) ( not ( = ?auto_391389 ?auto_391390 ) ) ( not ( = ?auto_391389 ?auto_391391 ) ) ( not ( = ?auto_391389 ?auto_391392 ) ) ( not ( = ?auto_391389 ?auto_391393 ) ) ( not ( = ?auto_391389 ?auto_391394 ) ) ( not ( = ?auto_391389 ?auto_391395 ) ) ( not ( = ?auto_391389 ?auto_391396 ) ) ( not ( = ?auto_391390 ?auto_391391 ) ) ( not ( = ?auto_391390 ?auto_391392 ) ) ( not ( = ?auto_391390 ?auto_391393 ) ) ( not ( = ?auto_391390 ?auto_391394 ) ) ( not ( = ?auto_391390 ?auto_391395 ) ) ( not ( = ?auto_391390 ?auto_391396 ) ) ( not ( = ?auto_391391 ?auto_391392 ) ) ( not ( = ?auto_391391 ?auto_391393 ) ) ( not ( = ?auto_391391 ?auto_391394 ) ) ( not ( = ?auto_391391 ?auto_391395 ) ) ( not ( = ?auto_391391 ?auto_391396 ) ) ( not ( = ?auto_391392 ?auto_391393 ) ) ( not ( = ?auto_391392 ?auto_391394 ) ) ( not ( = ?auto_391392 ?auto_391395 ) ) ( not ( = ?auto_391392 ?auto_391396 ) ) ( not ( = ?auto_391393 ?auto_391394 ) ) ( not ( = ?auto_391393 ?auto_391395 ) ) ( not ( = ?auto_391393 ?auto_391396 ) ) ( not ( = ?auto_391394 ?auto_391395 ) ) ( not ( = ?auto_391394 ?auto_391396 ) ) ( not ( = ?auto_391395 ?auto_391396 ) ) ( ON ?auto_391395 ?auto_391396 ) ( ON ?auto_391394 ?auto_391395 ) ( ON ?auto_391393 ?auto_391394 ) ( ON ?auto_391392 ?auto_391393 ) ( ON ?auto_391391 ?auto_391392 ) ( CLEAR ?auto_391389 ) ( ON ?auto_391390 ?auto_391391 ) ( CLEAR ?auto_391390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_391382 ?auto_391383 ?auto_391384 ?auto_391385 ?auto_391386 ?auto_391387 ?auto_391388 ?auto_391389 ?auto_391390 )
      ( MAKE-15PILE ?auto_391382 ?auto_391383 ?auto_391384 ?auto_391385 ?auto_391386 ?auto_391387 ?auto_391388 ?auto_391389 ?auto_391390 ?auto_391391 ?auto_391392 ?auto_391393 ?auto_391394 ?auto_391395 ?auto_391396 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391412 - BLOCK
      ?auto_391413 - BLOCK
      ?auto_391414 - BLOCK
      ?auto_391415 - BLOCK
      ?auto_391416 - BLOCK
      ?auto_391417 - BLOCK
      ?auto_391418 - BLOCK
      ?auto_391419 - BLOCK
      ?auto_391420 - BLOCK
      ?auto_391421 - BLOCK
      ?auto_391422 - BLOCK
      ?auto_391423 - BLOCK
      ?auto_391424 - BLOCK
      ?auto_391425 - BLOCK
      ?auto_391426 - BLOCK
    )
    :vars
    (
      ?auto_391427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391426 ?auto_391427 ) ( ON-TABLE ?auto_391412 ) ( ON ?auto_391413 ?auto_391412 ) ( ON ?auto_391414 ?auto_391413 ) ( ON ?auto_391415 ?auto_391414 ) ( ON ?auto_391416 ?auto_391415 ) ( ON ?auto_391417 ?auto_391416 ) ( ON ?auto_391418 ?auto_391417 ) ( not ( = ?auto_391412 ?auto_391413 ) ) ( not ( = ?auto_391412 ?auto_391414 ) ) ( not ( = ?auto_391412 ?auto_391415 ) ) ( not ( = ?auto_391412 ?auto_391416 ) ) ( not ( = ?auto_391412 ?auto_391417 ) ) ( not ( = ?auto_391412 ?auto_391418 ) ) ( not ( = ?auto_391412 ?auto_391419 ) ) ( not ( = ?auto_391412 ?auto_391420 ) ) ( not ( = ?auto_391412 ?auto_391421 ) ) ( not ( = ?auto_391412 ?auto_391422 ) ) ( not ( = ?auto_391412 ?auto_391423 ) ) ( not ( = ?auto_391412 ?auto_391424 ) ) ( not ( = ?auto_391412 ?auto_391425 ) ) ( not ( = ?auto_391412 ?auto_391426 ) ) ( not ( = ?auto_391412 ?auto_391427 ) ) ( not ( = ?auto_391413 ?auto_391414 ) ) ( not ( = ?auto_391413 ?auto_391415 ) ) ( not ( = ?auto_391413 ?auto_391416 ) ) ( not ( = ?auto_391413 ?auto_391417 ) ) ( not ( = ?auto_391413 ?auto_391418 ) ) ( not ( = ?auto_391413 ?auto_391419 ) ) ( not ( = ?auto_391413 ?auto_391420 ) ) ( not ( = ?auto_391413 ?auto_391421 ) ) ( not ( = ?auto_391413 ?auto_391422 ) ) ( not ( = ?auto_391413 ?auto_391423 ) ) ( not ( = ?auto_391413 ?auto_391424 ) ) ( not ( = ?auto_391413 ?auto_391425 ) ) ( not ( = ?auto_391413 ?auto_391426 ) ) ( not ( = ?auto_391413 ?auto_391427 ) ) ( not ( = ?auto_391414 ?auto_391415 ) ) ( not ( = ?auto_391414 ?auto_391416 ) ) ( not ( = ?auto_391414 ?auto_391417 ) ) ( not ( = ?auto_391414 ?auto_391418 ) ) ( not ( = ?auto_391414 ?auto_391419 ) ) ( not ( = ?auto_391414 ?auto_391420 ) ) ( not ( = ?auto_391414 ?auto_391421 ) ) ( not ( = ?auto_391414 ?auto_391422 ) ) ( not ( = ?auto_391414 ?auto_391423 ) ) ( not ( = ?auto_391414 ?auto_391424 ) ) ( not ( = ?auto_391414 ?auto_391425 ) ) ( not ( = ?auto_391414 ?auto_391426 ) ) ( not ( = ?auto_391414 ?auto_391427 ) ) ( not ( = ?auto_391415 ?auto_391416 ) ) ( not ( = ?auto_391415 ?auto_391417 ) ) ( not ( = ?auto_391415 ?auto_391418 ) ) ( not ( = ?auto_391415 ?auto_391419 ) ) ( not ( = ?auto_391415 ?auto_391420 ) ) ( not ( = ?auto_391415 ?auto_391421 ) ) ( not ( = ?auto_391415 ?auto_391422 ) ) ( not ( = ?auto_391415 ?auto_391423 ) ) ( not ( = ?auto_391415 ?auto_391424 ) ) ( not ( = ?auto_391415 ?auto_391425 ) ) ( not ( = ?auto_391415 ?auto_391426 ) ) ( not ( = ?auto_391415 ?auto_391427 ) ) ( not ( = ?auto_391416 ?auto_391417 ) ) ( not ( = ?auto_391416 ?auto_391418 ) ) ( not ( = ?auto_391416 ?auto_391419 ) ) ( not ( = ?auto_391416 ?auto_391420 ) ) ( not ( = ?auto_391416 ?auto_391421 ) ) ( not ( = ?auto_391416 ?auto_391422 ) ) ( not ( = ?auto_391416 ?auto_391423 ) ) ( not ( = ?auto_391416 ?auto_391424 ) ) ( not ( = ?auto_391416 ?auto_391425 ) ) ( not ( = ?auto_391416 ?auto_391426 ) ) ( not ( = ?auto_391416 ?auto_391427 ) ) ( not ( = ?auto_391417 ?auto_391418 ) ) ( not ( = ?auto_391417 ?auto_391419 ) ) ( not ( = ?auto_391417 ?auto_391420 ) ) ( not ( = ?auto_391417 ?auto_391421 ) ) ( not ( = ?auto_391417 ?auto_391422 ) ) ( not ( = ?auto_391417 ?auto_391423 ) ) ( not ( = ?auto_391417 ?auto_391424 ) ) ( not ( = ?auto_391417 ?auto_391425 ) ) ( not ( = ?auto_391417 ?auto_391426 ) ) ( not ( = ?auto_391417 ?auto_391427 ) ) ( not ( = ?auto_391418 ?auto_391419 ) ) ( not ( = ?auto_391418 ?auto_391420 ) ) ( not ( = ?auto_391418 ?auto_391421 ) ) ( not ( = ?auto_391418 ?auto_391422 ) ) ( not ( = ?auto_391418 ?auto_391423 ) ) ( not ( = ?auto_391418 ?auto_391424 ) ) ( not ( = ?auto_391418 ?auto_391425 ) ) ( not ( = ?auto_391418 ?auto_391426 ) ) ( not ( = ?auto_391418 ?auto_391427 ) ) ( not ( = ?auto_391419 ?auto_391420 ) ) ( not ( = ?auto_391419 ?auto_391421 ) ) ( not ( = ?auto_391419 ?auto_391422 ) ) ( not ( = ?auto_391419 ?auto_391423 ) ) ( not ( = ?auto_391419 ?auto_391424 ) ) ( not ( = ?auto_391419 ?auto_391425 ) ) ( not ( = ?auto_391419 ?auto_391426 ) ) ( not ( = ?auto_391419 ?auto_391427 ) ) ( not ( = ?auto_391420 ?auto_391421 ) ) ( not ( = ?auto_391420 ?auto_391422 ) ) ( not ( = ?auto_391420 ?auto_391423 ) ) ( not ( = ?auto_391420 ?auto_391424 ) ) ( not ( = ?auto_391420 ?auto_391425 ) ) ( not ( = ?auto_391420 ?auto_391426 ) ) ( not ( = ?auto_391420 ?auto_391427 ) ) ( not ( = ?auto_391421 ?auto_391422 ) ) ( not ( = ?auto_391421 ?auto_391423 ) ) ( not ( = ?auto_391421 ?auto_391424 ) ) ( not ( = ?auto_391421 ?auto_391425 ) ) ( not ( = ?auto_391421 ?auto_391426 ) ) ( not ( = ?auto_391421 ?auto_391427 ) ) ( not ( = ?auto_391422 ?auto_391423 ) ) ( not ( = ?auto_391422 ?auto_391424 ) ) ( not ( = ?auto_391422 ?auto_391425 ) ) ( not ( = ?auto_391422 ?auto_391426 ) ) ( not ( = ?auto_391422 ?auto_391427 ) ) ( not ( = ?auto_391423 ?auto_391424 ) ) ( not ( = ?auto_391423 ?auto_391425 ) ) ( not ( = ?auto_391423 ?auto_391426 ) ) ( not ( = ?auto_391423 ?auto_391427 ) ) ( not ( = ?auto_391424 ?auto_391425 ) ) ( not ( = ?auto_391424 ?auto_391426 ) ) ( not ( = ?auto_391424 ?auto_391427 ) ) ( not ( = ?auto_391425 ?auto_391426 ) ) ( not ( = ?auto_391425 ?auto_391427 ) ) ( not ( = ?auto_391426 ?auto_391427 ) ) ( ON ?auto_391425 ?auto_391426 ) ( ON ?auto_391424 ?auto_391425 ) ( ON ?auto_391423 ?auto_391424 ) ( ON ?auto_391422 ?auto_391423 ) ( ON ?auto_391421 ?auto_391422 ) ( ON ?auto_391420 ?auto_391421 ) ( CLEAR ?auto_391418 ) ( ON ?auto_391419 ?auto_391420 ) ( CLEAR ?auto_391419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_391412 ?auto_391413 ?auto_391414 ?auto_391415 ?auto_391416 ?auto_391417 ?auto_391418 ?auto_391419 )
      ( MAKE-15PILE ?auto_391412 ?auto_391413 ?auto_391414 ?auto_391415 ?auto_391416 ?auto_391417 ?auto_391418 ?auto_391419 ?auto_391420 ?auto_391421 ?auto_391422 ?auto_391423 ?auto_391424 ?auto_391425 ?auto_391426 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391443 - BLOCK
      ?auto_391444 - BLOCK
      ?auto_391445 - BLOCK
      ?auto_391446 - BLOCK
      ?auto_391447 - BLOCK
      ?auto_391448 - BLOCK
      ?auto_391449 - BLOCK
      ?auto_391450 - BLOCK
      ?auto_391451 - BLOCK
      ?auto_391452 - BLOCK
      ?auto_391453 - BLOCK
      ?auto_391454 - BLOCK
      ?auto_391455 - BLOCK
      ?auto_391456 - BLOCK
      ?auto_391457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391457 ) ( ON-TABLE ?auto_391443 ) ( ON ?auto_391444 ?auto_391443 ) ( ON ?auto_391445 ?auto_391444 ) ( ON ?auto_391446 ?auto_391445 ) ( ON ?auto_391447 ?auto_391446 ) ( ON ?auto_391448 ?auto_391447 ) ( ON ?auto_391449 ?auto_391448 ) ( not ( = ?auto_391443 ?auto_391444 ) ) ( not ( = ?auto_391443 ?auto_391445 ) ) ( not ( = ?auto_391443 ?auto_391446 ) ) ( not ( = ?auto_391443 ?auto_391447 ) ) ( not ( = ?auto_391443 ?auto_391448 ) ) ( not ( = ?auto_391443 ?auto_391449 ) ) ( not ( = ?auto_391443 ?auto_391450 ) ) ( not ( = ?auto_391443 ?auto_391451 ) ) ( not ( = ?auto_391443 ?auto_391452 ) ) ( not ( = ?auto_391443 ?auto_391453 ) ) ( not ( = ?auto_391443 ?auto_391454 ) ) ( not ( = ?auto_391443 ?auto_391455 ) ) ( not ( = ?auto_391443 ?auto_391456 ) ) ( not ( = ?auto_391443 ?auto_391457 ) ) ( not ( = ?auto_391444 ?auto_391445 ) ) ( not ( = ?auto_391444 ?auto_391446 ) ) ( not ( = ?auto_391444 ?auto_391447 ) ) ( not ( = ?auto_391444 ?auto_391448 ) ) ( not ( = ?auto_391444 ?auto_391449 ) ) ( not ( = ?auto_391444 ?auto_391450 ) ) ( not ( = ?auto_391444 ?auto_391451 ) ) ( not ( = ?auto_391444 ?auto_391452 ) ) ( not ( = ?auto_391444 ?auto_391453 ) ) ( not ( = ?auto_391444 ?auto_391454 ) ) ( not ( = ?auto_391444 ?auto_391455 ) ) ( not ( = ?auto_391444 ?auto_391456 ) ) ( not ( = ?auto_391444 ?auto_391457 ) ) ( not ( = ?auto_391445 ?auto_391446 ) ) ( not ( = ?auto_391445 ?auto_391447 ) ) ( not ( = ?auto_391445 ?auto_391448 ) ) ( not ( = ?auto_391445 ?auto_391449 ) ) ( not ( = ?auto_391445 ?auto_391450 ) ) ( not ( = ?auto_391445 ?auto_391451 ) ) ( not ( = ?auto_391445 ?auto_391452 ) ) ( not ( = ?auto_391445 ?auto_391453 ) ) ( not ( = ?auto_391445 ?auto_391454 ) ) ( not ( = ?auto_391445 ?auto_391455 ) ) ( not ( = ?auto_391445 ?auto_391456 ) ) ( not ( = ?auto_391445 ?auto_391457 ) ) ( not ( = ?auto_391446 ?auto_391447 ) ) ( not ( = ?auto_391446 ?auto_391448 ) ) ( not ( = ?auto_391446 ?auto_391449 ) ) ( not ( = ?auto_391446 ?auto_391450 ) ) ( not ( = ?auto_391446 ?auto_391451 ) ) ( not ( = ?auto_391446 ?auto_391452 ) ) ( not ( = ?auto_391446 ?auto_391453 ) ) ( not ( = ?auto_391446 ?auto_391454 ) ) ( not ( = ?auto_391446 ?auto_391455 ) ) ( not ( = ?auto_391446 ?auto_391456 ) ) ( not ( = ?auto_391446 ?auto_391457 ) ) ( not ( = ?auto_391447 ?auto_391448 ) ) ( not ( = ?auto_391447 ?auto_391449 ) ) ( not ( = ?auto_391447 ?auto_391450 ) ) ( not ( = ?auto_391447 ?auto_391451 ) ) ( not ( = ?auto_391447 ?auto_391452 ) ) ( not ( = ?auto_391447 ?auto_391453 ) ) ( not ( = ?auto_391447 ?auto_391454 ) ) ( not ( = ?auto_391447 ?auto_391455 ) ) ( not ( = ?auto_391447 ?auto_391456 ) ) ( not ( = ?auto_391447 ?auto_391457 ) ) ( not ( = ?auto_391448 ?auto_391449 ) ) ( not ( = ?auto_391448 ?auto_391450 ) ) ( not ( = ?auto_391448 ?auto_391451 ) ) ( not ( = ?auto_391448 ?auto_391452 ) ) ( not ( = ?auto_391448 ?auto_391453 ) ) ( not ( = ?auto_391448 ?auto_391454 ) ) ( not ( = ?auto_391448 ?auto_391455 ) ) ( not ( = ?auto_391448 ?auto_391456 ) ) ( not ( = ?auto_391448 ?auto_391457 ) ) ( not ( = ?auto_391449 ?auto_391450 ) ) ( not ( = ?auto_391449 ?auto_391451 ) ) ( not ( = ?auto_391449 ?auto_391452 ) ) ( not ( = ?auto_391449 ?auto_391453 ) ) ( not ( = ?auto_391449 ?auto_391454 ) ) ( not ( = ?auto_391449 ?auto_391455 ) ) ( not ( = ?auto_391449 ?auto_391456 ) ) ( not ( = ?auto_391449 ?auto_391457 ) ) ( not ( = ?auto_391450 ?auto_391451 ) ) ( not ( = ?auto_391450 ?auto_391452 ) ) ( not ( = ?auto_391450 ?auto_391453 ) ) ( not ( = ?auto_391450 ?auto_391454 ) ) ( not ( = ?auto_391450 ?auto_391455 ) ) ( not ( = ?auto_391450 ?auto_391456 ) ) ( not ( = ?auto_391450 ?auto_391457 ) ) ( not ( = ?auto_391451 ?auto_391452 ) ) ( not ( = ?auto_391451 ?auto_391453 ) ) ( not ( = ?auto_391451 ?auto_391454 ) ) ( not ( = ?auto_391451 ?auto_391455 ) ) ( not ( = ?auto_391451 ?auto_391456 ) ) ( not ( = ?auto_391451 ?auto_391457 ) ) ( not ( = ?auto_391452 ?auto_391453 ) ) ( not ( = ?auto_391452 ?auto_391454 ) ) ( not ( = ?auto_391452 ?auto_391455 ) ) ( not ( = ?auto_391452 ?auto_391456 ) ) ( not ( = ?auto_391452 ?auto_391457 ) ) ( not ( = ?auto_391453 ?auto_391454 ) ) ( not ( = ?auto_391453 ?auto_391455 ) ) ( not ( = ?auto_391453 ?auto_391456 ) ) ( not ( = ?auto_391453 ?auto_391457 ) ) ( not ( = ?auto_391454 ?auto_391455 ) ) ( not ( = ?auto_391454 ?auto_391456 ) ) ( not ( = ?auto_391454 ?auto_391457 ) ) ( not ( = ?auto_391455 ?auto_391456 ) ) ( not ( = ?auto_391455 ?auto_391457 ) ) ( not ( = ?auto_391456 ?auto_391457 ) ) ( ON ?auto_391456 ?auto_391457 ) ( ON ?auto_391455 ?auto_391456 ) ( ON ?auto_391454 ?auto_391455 ) ( ON ?auto_391453 ?auto_391454 ) ( ON ?auto_391452 ?auto_391453 ) ( ON ?auto_391451 ?auto_391452 ) ( CLEAR ?auto_391449 ) ( ON ?auto_391450 ?auto_391451 ) ( CLEAR ?auto_391450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_391443 ?auto_391444 ?auto_391445 ?auto_391446 ?auto_391447 ?auto_391448 ?auto_391449 ?auto_391450 )
      ( MAKE-15PILE ?auto_391443 ?auto_391444 ?auto_391445 ?auto_391446 ?auto_391447 ?auto_391448 ?auto_391449 ?auto_391450 ?auto_391451 ?auto_391452 ?auto_391453 ?auto_391454 ?auto_391455 ?auto_391456 ?auto_391457 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391473 - BLOCK
      ?auto_391474 - BLOCK
      ?auto_391475 - BLOCK
      ?auto_391476 - BLOCK
      ?auto_391477 - BLOCK
      ?auto_391478 - BLOCK
      ?auto_391479 - BLOCK
      ?auto_391480 - BLOCK
      ?auto_391481 - BLOCK
      ?auto_391482 - BLOCK
      ?auto_391483 - BLOCK
      ?auto_391484 - BLOCK
      ?auto_391485 - BLOCK
      ?auto_391486 - BLOCK
      ?auto_391487 - BLOCK
    )
    :vars
    (
      ?auto_391488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391487 ?auto_391488 ) ( ON-TABLE ?auto_391473 ) ( ON ?auto_391474 ?auto_391473 ) ( ON ?auto_391475 ?auto_391474 ) ( ON ?auto_391476 ?auto_391475 ) ( ON ?auto_391477 ?auto_391476 ) ( ON ?auto_391478 ?auto_391477 ) ( not ( = ?auto_391473 ?auto_391474 ) ) ( not ( = ?auto_391473 ?auto_391475 ) ) ( not ( = ?auto_391473 ?auto_391476 ) ) ( not ( = ?auto_391473 ?auto_391477 ) ) ( not ( = ?auto_391473 ?auto_391478 ) ) ( not ( = ?auto_391473 ?auto_391479 ) ) ( not ( = ?auto_391473 ?auto_391480 ) ) ( not ( = ?auto_391473 ?auto_391481 ) ) ( not ( = ?auto_391473 ?auto_391482 ) ) ( not ( = ?auto_391473 ?auto_391483 ) ) ( not ( = ?auto_391473 ?auto_391484 ) ) ( not ( = ?auto_391473 ?auto_391485 ) ) ( not ( = ?auto_391473 ?auto_391486 ) ) ( not ( = ?auto_391473 ?auto_391487 ) ) ( not ( = ?auto_391473 ?auto_391488 ) ) ( not ( = ?auto_391474 ?auto_391475 ) ) ( not ( = ?auto_391474 ?auto_391476 ) ) ( not ( = ?auto_391474 ?auto_391477 ) ) ( not ( = ?auto_391474 ?auto_391478 ) ) ( not ( = ?auto_391474 ?auto_391479 ) ) ( not ( = ?auto_391474 ?auto_391480 ) ) ( not ( = ?auto_391474 ?auto_391481 ) ) ( not ( = ?auto_391474 ?auto_391482 ) ) ( not ( = ?auto_391474 ?auto_391483 ) ) ( not ( = ?auto_391474 ?auto_391484 ) ) ( not ( = ?auto_391474 ?auto_391485 ) ) ( not ( = ?auto_391474 ?auto_391486 ) ) ( not ( = ?auto_391474 ?auto_391487 ) ) ( not ( = ?auto_391474 ?auto_391488 ) ) ( not ( = ?auto_391475 ?auto_391476 ) ) ( not ( = ?auto_391475 ?auto_391477 ) ) ( not ( = ?auto_391475 ?auto_391478 ) ) ( not ( = ?auto_391475 ?auto_391479 ) ) ( not ( = ?auto_391475 ?auto_391480 ) ) ( not ( = ?auto_391475 ?auto_391481 ) ) ( not ( = ?auto_391475 ?auto_391482 ) ) ( not ( = ?auto_391475 ?auto_391483 ) ) ( not ( = ?auto_391475 ?auto_391484 ) ) ( not ( = ?auto_391475 ?auto_391485 ) ) ( not ( = ?auto_391475 ?auto_391486 ) ) ( not ( = ?auto_391475 ?auto_391487 ) ) ( not ( = ?auto_391475 ?auto_391488 ) ) ( not ( = ?auto_391476 ?auto_391477 ) ) ( not ( = ?auto_391476 ?auto_391478 ) ) ( not ( = ?auto_391476 ?auto_391479 ) ) ( not ( = ?auto_391476 ?auto_391480 ) ) ( not ( = ?auto_391476 ?auto_391481 ) ) ( not ( = ?auto_391476 ?auto_391482 ) ) ( not ( = ?auto_391476 ?auto_391483 ) ) ( not ( = ?auto_391476 ?auto_391484 ) ) ( not ( = ?auto_391476 ?auto_391485 ) ) ( not ( = ?auto_391476 ?auto_391486 ) ) ( not ( = ?auto_391476 ?auto_391487 ) ) ( not ( = ?auto_391476 ?auto_391488 ) ) ( not ( = ?auto_391477 ?auto_391478 ) ) ( not ( = ?auto_391477 ?auto_391479 ) ) ( not ( = ?auto_391477 ?auto_391480 ) ) ( not ( = ?auto_391477 ?auto_391481 ) ) ( not ( = ?auto_391477 ?auto_391482 ) ) ( not ( = ?auto_391477 ?auto_391483 ) ) ( not ( = ?auto_391477 ?auto_391484 ) ) ( not ( = ?auto_391477 ?auto_391485 ) ) ( not ( = ?auto_391477 ?auto_391486 ) ) ( not ( = ?auto_391477 ?auto_391487 ) ) ( not ( = ?auto_391477 ?auto_391488 ) ) ( not ( = ?auto_391478 ?auto_391479 ) ) ( not ( = ?auto_391478 ?auto_391480 ) ) ( not ( = ?auto_391478 ?auto_391481 ) ) ( not ( = ?auto_391478 ?auto_391482 ) ) ( not ( = ?auto_391478 ?auto_391483 ) ) ( not ( = ?auto_391478 ?auto_391484 ) ) ( not ( = ?auto_391478 ?auto_391485 ) ) ( not ( = ?auto_391478 ?auto_391486 ) ) ( not ( = ?auto_391478 ?auto_391487 ) ) ( not ( = ?auto_391478 ?auto_391488 ) ) ( not ( = ?auto_391479 ?auto_391480 ) ) ( not ( = ?auto_391479 ?auto_391481 ) ) ( not ( = ?auto_391479 ?auto_391482 ) ) ( not ( = ?auto_391479 ?auto_391483 ) ) ( not ( = ?auto_391479 ?auto_391484 ) ) ( not ( = ?auto_391479 ?auto_391485 ) ) ( not ( = ?auto_391479 ?auto_391486 ) ) ( not ( = ?auto_391479 ?auto_391487 ) ) ( not ( = ?auto_391479 ?auto_391488 ) ) ( not ( = ?auto_391480 ?auto_391481 ) ) ( not ( = ?auto_391480 ?auto_391482 ) ) ( not ( = ?auto_391480 ?auto_391483 ) ) ( not ( = ?auto_391480 ?auto_391484 ) ) ( not ( = ?auto_391480 ?auto_391485 ) ) ( not ( = ?auto_391480 ?auto_391486 ) ) ( not ( = ?auto_391480 ?auto_391487 ) ) ( not ( = ?auto_391480 ?auto_391488 ) ) ( not ( = ?auto_391481 ?auto_391482 ) ) ( not ( = ?auto_391481 ?auto_391483 ) ) ( not ( = ?auto_391481 ?auto_391484 ) ) ( not ( = ?auto_391481 ?auto_391485 ) ) ( not ( = ?auto_391481 ?auto_391486 ) ) ( not ( = ?auto_391481 ?auto_391487 ) ) ( not ( = ?auto_391481 ?auto_391488 ) ) ( not ( = ?auto_391482 ?auto_391483 ) ) ( not ( = ?auto_391482 ?auto_391484 ) ) ( not ( = ?auto_391482 ?auto_391485 ) ) ( not ( = ?auto_391482 ?auto_391486 ) ) ( not ( = ?auto_391482 ?auto_391487 ) ) ( not ( = ?auto_391482 ?auto_391488 ) ) ( not ( = ?auto_391483 ?auto_391484 ) ) ( not ( = ?auto_391483 ?auto_391485 ) ) ( not ( = ?auto_391483 ?auto_391486 ) ) ( not ( = ?auto_391483 ?auto_391487 ) ) ( not ( = ?auto_391483 ?auto_391488 ) ) ( not ( = ?auto_391484 ?auto_391485 ) ) ( not ( = ?auto_391484 ?auto_391486 ) ) ( not ( = ?auto_391484 ?auto_391487 ) ) ( not ( = ?auto_391484 ?auto_391488 ) ) ( not ( = ?auto_391485 ?auto_391486 ) ) ( not ( = ?auto_391485 ?auto_391487 ) ) ( not ( = ?auto_391485 ?auto_391488 ) ) ( not ( = ?auto_391486 ?auto_391487 ) ) ( not ( = ?auto_391486 ?auto_391488 ) ) ( not ( = ?auto_391487 ?auto_391488 ) ) ( ON ?auto_391486 ?auto_391487 ) ( ON ?auto_391485 ?auto_391486 ) ( ON ?auto_391484 ?auto_391485 ) ( ON ?auto_391483 ?auto_391484 ) ( ON ?auto_391482 ?auto_391483 ) ( ON ?auto_391481 ?auto_391482 ) ( ON ?auto_391480 ?auto_391481 ) ( CLEAR ?auto_391478 ) ( ON ?auto_391479 ?auto_391480 ) ( CLEAR ?auto_391479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_391473 ?auto_391474 ?auto_391475 ?auto_391476 ?auto_391477 ?auto_391478 ?auto_391479 )
      ( MAKE-15PILE ?auto_391473 ?auto_391474 ?auto_391475 ?auto_391476 ?auto_391477 ?auto_391478 ?auto_391479 ?auto_391480 ?auto_391481 ?auto_391482 ?auto_391483 ?auto_391484 ?auto_391485 ?auto_391486 ?auto_391487 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391504 - BLOCK
      ?auto_391505 - BLOCK
      ?auto_391506 - BLOCK
      ?auto_391507 - BLOCK
      ?auto_391508 - BLOCK
      ?auto_391509 - BLOCK
      ?auto_391510 - BLOCK
      ?auto_391511 - BLOCK
      ?auto_391512 - BLOCK
      ?auto_391513 - BLOCK
      ?auto_391514 - BLOCK
      ?auto_391515 - BLOCK
      ?auto_391516 - BLOCK
      ?auto_391517 - BLOCK
      ?auto_391518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391518 ) ( ON-TABLE ?auto_391504 ) ( ON ?auto_391505 ?auto_391504 ) ( ON ?auto_391506 ?auto_391505 ) ( ON ?auto_391507 ?auto_391506 ) ( ON ?auto_391508 ?auto_391507 ) ( ON ?auto_391509 ?auto_391508 ) ( not ( = ?auto_391504 ?auto_391505 ) ) ( not ( = ?auto_391504 ?auto_391506 ) ) ( not ( = ?auto_391504 ?auto_391507 ) ) ( not ( = ?auto_391504 ?auto_391508 ) ) ( not ( = ?auto_391504 ?auto_391509 ) ) ( not ( = ?auto_391504 ?auto_391510 ) ) ( not ( = ?auto_391504 ?auto_391511 ) ) ( not ( = ?auto_391504 ?auto_391512 ) ) ( not ( = ?auto_391504 ?auto_391513 ) ) ( not ( = ?auto_391504 ?auto_391514 ) ) ( not ( = ?auto_391504 ?auto_391515 ) ) ( not ( = ?auto_391504 ?auto_391516 ) ) ( not ( = ?auto_391504 ?auto_391517 ) ) ( not ( = ?auto_391504 ?auto_391518 ) ) ( not ( = ?auto_391505 ?auto_391506 ) ) ( not ( = ?auto_391505 ?auto_391507 ) ) ( not ( = ?auto_391505 ?auto_391508 ) ) ( not ( = ?auto_391505 ?auto_391509 ) ) ( not ( = ?auto_391505 ?auto_391510 ) ) ( not ( = ?auto_391505 ?auto_391511 ) ) ( not ( = ?auto_391505 ?auto_391512 ) ) ( not ( = ?auto_391505 ?auto_391513 ) ) ( not ( = ?auto_391505 ?auto_391514 ) ) ( not ( = ?auto_391505 ?auto_391515 ) ) ( not ( = ?auto_391505 ?auto_391516 ) ) ( not ( = ?auto_391505 ?auto_391517 ) ) ( not ( = ?auto_391505 ?auto_391518 ) ) ( not ( = ?auto_391506 ?auto_391507 ) ) ( not ( = ?auto_391506 ?auto_391508 ) ) ( not ( = ?auto_391506 ?auto_391509 ) ) ( not ( = ?auto_391506 ?auto_391510 ) ) ( not ( = ?auto_391506 ?auto_391511 ) ) ( not ( = ?auto_391506 ?auto_391512 ) ) ( not ( = ?auto_391506 ?auto_391513 ) ) ( not ( = ?auto_391506 ?auto_391514 ) ) ( not ( = ?auto_391506 ?auto_391515 ) ) ( not ( = ?auto_391506 ?auto_391516 ) ) ( not ( = ?auto_391506 ?auto_391517 ) ) ( not ( = ?auto_391506 ?auto_391518 ) ) ( not ( = ?auto_391507 ?auto_391508 ) ) ( not ( = ?auto_391507 ?auto_391509 ) ) ( not ( = ?auto_391507 ?auto_391510 ) ) ( not ( = ?auto_391507 ?auto_391511 ) ) ( not ( = ?auto_391507 ?auto_391512 ) ) ( not ( = ?auto_391507 ?auto_391513 ) ) ( not ( = ?auto_391507 ?auto_391514 ) ) ( not ( = ?auto_391507 ?auto_391515 ) ) ( not ( = ?auto_391507 ?auto_391516 ) ) ( not ( = ?auto_391507 ?auto_391517 ) ) ( not ( = ?auto_391507 ?auto_391518 ) ) ( not ( = ?auto_391508 ?auto_391509 ) ) ( not ( = ?auto_391508 ?auto_391510 ) ) ( not ( = ?auto_391508 ?auto_391511 ) ) ( not ( = ?auto_391508 ?auto_391512 ) ) ( not ( = ?auto_391508 ?auto_391513 ) ) ( not ( = ?auto_391508 ?auto_391514 ) ) ( not ( = ?auto_391508 ?auto_391515 ) ) ( not ( = ?auto_391508 ?auto_391516 ) ) ( not ( = ?auto_391508 ?auto_391517 ) ) ( not ( = ?auto_391508 ?auto_391518 ) ) ( not ( = ?auto_391509 ?auto_391510 ) ) ( not ( = ?auto_391509 ?auto_391511 ) ) ( not ( = ?auto_391509 ?auto_391512 ) ) ( not ( = ?auto_391509 ?auto_391513 ) ) ( not ( = ?auto_391509 ?auto_391514 ) ) ( not ( = ?auto_391509 ?auto_391515 ) ) ( not ( = ?auto_391509 ?auto_391516 ) ) ( not ( = ?auto_391509 ?auto_391517 ) ) ( not ( = ?auto_391509 ?auto_391518 ) ) ( not ( = ?auto_391510 ?auto_391511 ) ) ( not ( = ?auto_391510 ?auto_391512 ) ) ( not ( = ?auto_391510 ?auto_391513 ) ) ( not ( = ?auto_391510 ?auto_391514 ) ) ( not ( = ?auto_391510 ?auto_391515 ) ) ( not ( = ?auto_391510 ?auto_391516 ) ) ( not ( = ?auto_391510 ?auto_391517 ) ) ( not ( = ?auto_391510 ?auto_391518 ) ) ( not ( = ?auto_391511 ?auto_391512 ) ) ( not ( = ?auto_391511 ?auto_391513 ) ) ( not ( = ?auto_391511 ?auto_391514 ) ) ( not ( = ?auto_391511 ?auto_391515 ) ) ( not ( = ?auto_391511 ?auto_391516 ) ) ( not ( = ?auto_391511 ?auto_391517 ) ) ( not ( = ?auto_391511 ?auto_391518 ) ) ( not ( = ?auto_391512 ?auto_391513 ) ) ( not ( = ?auto_391512 ?auto_391514 ) ) ( not ( = ?auto_391512 ?auto_391515 ) ) ( not ( = ?auto_391512 ?auto_391516 ) ) ( not ( = ?auto_391512 ?auto_391517 ) ) ( not ( = ?auto_391512 ?auto_391518 ) ) ( not ( = ?auto_391513 ?auto_391514 ) ) ( not ( = ?auto_391513 ?auto_391515 ) ) ( not ( = ?auto_391513 ?auto_391516 ) ) ( not ( = ?auto_391513 ?auto_391517 ) ) ( not ( = ?auto_391513 ?auto_391518 ) ) ( not ( = ?auto_391514 ?auto_391515 ) ) ( not ( = ?auto_391514 ?auto_391516 ) ) ( not ( = ?auto_391514 ?auto_391517 ) ) ( not ( = ?auto_391514 ?auto_391518 ) ) ( not ( = ?auto_391515 ?auto_391516 ) ) ( not ( = ?auto_391515 ?auto_391517 ) ) ( not ( = ?auto_391515 ?auto_391518 ) ) ( not ( = ?auto_391516 ?auto_391517 ) ) ( not ( = ?auto_391516 ?auto_391518 ) ) ( not ( = ?auto_391517 ?auto_391518 ) ) ( ON ?auto_391517 ?auto_391518 ) ( ON ?auto_391516 ?auto_391517 ) ( ON ?auto_391515 ?auto_391516 ) ( ON ?auto_391514 ?auto_391515 ) ( ON ?auto_391513 ?auto_391514 ) ( ON ?auto_391512 ?auto_391513 ) ( ON ?auto_391511 ?auto_391512 ) ( CLEAR ?auto_391509 ) ( ON ?auto_391510 ?auto_391511 ) ( CLEAR ?auto_391510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_391504 ?auto_391505 ?auto_391506 ?auto_391507 ?auto_391508 ?auto_391509 ?auto_391510 )
      ( MAKE-15PILE ?auto_391504 ?auto_391505 ?auto_391506 ?auto_391507 ?auto_391508 ?auto_391509 ?auto_391510 ?auto_391511 ?auto_391512 ?auto_391513 ?auto_391514 ?auto_391515 ?auto_391516 ?auto_391517 ?auto_391518 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391534 - BLOCK
      ?auto_391535 - BLOCK
      ?auto_391536 - BLOCK
      ?auto_391537 - BLOCK
      ?auto_391538 - BLOCK
      ?auto_391539 - BLOCK
      ?auto_391540 - BLOCK
      ?auto_391541 - BLOCK
      ?auto_391542 - BLOCK
      ?auto_391543 - BLOCK
      ?auto_391544 - BLOCK
      ?auto_391545 - BLOCK
      ?auto_391546 - BLOCK
      ?auto_391547 - BLOCK
      ?auto_391548 - BLOCK
    )
    :vars
    (
      ?auto_391549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391548 ?auto_391549 ) ( ON-TABLE ?auto_391534 ) ( ON ?auto_391535 ?auto_391534 ) ( ON ?auto_391536 ?auto_391535 ) ( ON ?auto_391537 ?auto_391536 ) ( ON ?auto_391538 ?auto_391537 ) ( not ( = ?auto_391534 ?auto_391535 ) ) ( not ( = ?auto_391534 ?auto_391536 ) ) ( not ( = ?auto_391534 ?auto_391537 ) ) ( not ( = ?auto_391534 ?auto_391538 ) ) ( not ( = ?auto_391534 ?auto_391539 ) ) ( not ( = ?auto_391534 ?auto_391540 ) ) ( not ( = ?auto_391534 ?auto_391541 ) ) ( not ( = ?auto_391534 ?auto_391542 ) ) ( not ( = ?auto_391534 ?auto_391543 ) ) ( not ( = ?auto_391534 ?auto_391544 ) ) ( not ( = ?auto_391534 ?auto_391545 ) ) ( not ( = ?auto_391534 ?auto_391546 ) ) ( not ( = ?auto_391534 ?auto_391547 ) ) ( not ( = ?auto_391534 ?auto_391548 ) ) ( not ( = ?auto_391534 ?auto_391549 ) ) ( not ( = ?auto_391535 ?auto_391536 ) ) ( not ( = ?auto_391535 ?auto_391537 ) ) ( not ( = ?auto_391535 ?auto_391538 ) ) ( not ( = ?auto_391535 ?auto_391539 ) ) ( not ( = ?auto_391535 ?auto_391540 ) ) ( not ( = ?auto_391535 ?auto_391541 ) ) ( not ( = ?auto_391535 ?auto_391542 ) ) ( not ( = ?auto_391535 ?auto_391543 ) ) ( not ( = ?auto_391535 ?auto_391544 ) ) ( not ( = ?auto_391535 ?auto_391545 ) ) ( not ( = ?auto_391535 ?auto_391546 ) ) ( not ( = ?auto_391535 ?auto_391547 ) ) ( not ( = ?auto_391535 ?auto_391548 ) ) ( not ( = ?auto_391535 ?auto_391549 ) ) ( not ( = ?auto_391536 ?auto_391537 ) ) ( not ( = ?auto_391536 ?auto_391538 ) ) ( not ( = ?auto_391536 ?auto_391539 ) ) ( not ( = ?auto_391536 ?auto_391540 ) ) ( not ( = ?auto_391536 ?auto_391541 ) ) ( not ( = ?auto_391536 ?auto_391542 ) ) ( not ( = ?auto_391536 ?auto_391543 ) ) ( not ( = ?auto_391536 ?auto_391544 ) ) ( not ( = ?auto_391536 ?auto_391545 ) ) ( not ( = ?auto_391536 ?auto_391546 ) ) ( not ( = ?auto_391536 ?auto_391547 ) ) ( not ( = ?auto_391536 ?auto_391548 ) ) ( not ( = ?auto_391536 ?auto_391549 ) ) ( not ( = ?auto_391537 ?auto_391538 ) ) ( not ( = ?auto_391537 ?auto_391539 ) ) ( not ( = ?auto_391537 ?auto_391540 ) ) ( not ( = ?auto_391537 ?auto_391541 ) ) ( not ( = ?auto_391537 ?auto_391542 ) ) ( not ( = ?auto_391537 ?auto_391543 ) ) ( not ( = ?auto_391537 ?auto_391544 ) ) ( not ( = ?auto_391537 ?auto_391545 ) ) ( not ( = ?auto_391537 ?auto_391546 ) ) ( not ( = ?auto_391537 ?auto_391547 ) ) ( not ( = ?auto_391537 ?auto_391548 ) ) ( not ( = ?auto_391537 ?auto_391549 ) ) ( not ( = ?auto_391538 ?auto_391539 ) ) ( not ( = ?auto_391538 ?auto_391540 ) ) ( not ( = ?auto_391538 ?auto_391541 ) ) ( not ( = ?auto_391538 ?auto_391542 ) ) ( not ( = ?auto_391538 ?auto_391543 ) ) ( not ( = ?auto_391538 ?auto_391544 ) ) ( not ( = ?auto_391538 ?auto_391545 ) ) ( not ( = ?auto_391538 ?auto_391546 ) ) ( not ( = ?auto_391538 ?auto_391547 ) ) ( not ( = ?auto_391538 ?auto_391548 ) ) ( not ( = ?auto_391538 ?auto_391549 ) ) ( not ( = ?auto_391539 ?auto_391540 ) ) ( not ( = ?auto_391539 ?auto_391541 ) ) ( not ( = ?auto_391539 ?auto_391542 ) ) ( not ( = ?auto_391539 ?auto_391543 ) ) ( not ( = ?auto_391539 ?auto_391544 ) ) ( not ( = ?auto_391539 ?auto_391545 ) ) ( not ( = ?auto_391539 ?auto_391546 ) ) ( not ( = ?auto_391539 ?auto_391547 ) ) ( not ( = ?auto_391539 ?auto_391548 ) ) ( not ( = ?auto_391539 ?auto_391549 ) ) ( not ( = ?auto_391540 ?auto_391541 ) ) ( not ( = ?auto_391540 ?auto_391542 ) ) ( not ( = ?auto_391540 ?auto_391543 ) ) ( not ( = ?auto_391540 ?auto_391544 ) ) ( not ( = ?auto_391540 ?auto_391545 ) ) ( not ( = ?auto_391540 ?auto_391546 ) ) ( not ( = ?auto_391540 ?auto_391547 ) ) ( not ( = ?auto_391540 ?auto_391548 ) ) ( not ( = ?auto_391540 ?auto_391549 ) ) ( not ( = ?auto_391541 ?auto_391542 ) ) ( not ( = ?auto_391541 ?auto_391543 ) ) ( not ( = ?auto_391541 ?auto_391544 ) ) ( not ( = ?auto_391541 ?auto_391545 ) ) ( not ( = ?auto_391541 ?auto_391546 ) ) ( not ( = ?auto_391541 ?auto_391547 ) ) ( not ( = ?auto_391541 ?auto_391548 ) ) ( not ( = ?auto_391541 ?auto_391549 ) ) ( not ( = ?auto_391542 ?auto_391543 ) ) ( not ( = ?auto_391542 ?auto_391544 ) ) ( not ( = ?auto_391542 ?auto_391545 ) ) ( not ( = ?auto_391542 ?auto_391546 ) ) ( not ( = ?auto_391542 ?auto_391547 ) ) ( not ( = ?auto_391542 ?auto_391548 ) ) ( not ( = ?auto_391542 ?auto_391549 ) ) ( not ( = ?auto_391543 ?auto_391544 ) ) ( not ( = ?auto_391543 ?auto_391545 ) ) ( not ( = ?auto_391543 ?auto_391546 ) ) ( not ( = ?auto_391543 ?auto_391547 ) ) ( not ( = ?auto_391543 ?auto_391548 ) ) ( not ( = ?auto_391543 ?auto_391549 ) ) ( not ( = ?auto_391544 ?auto_391545 ) ) ( not ( = ?auto_391544 ?auto_391546 ) ) ( not ( = ?auto_391544 ?auto_391547 ) ) ( not ( = ?auto_391544 ?auto_391548 ) ) ( not ( = ?auto_391544 ?auto_391549 ) ) ( not ( = ?auto_391545 ?auto_391546 ) ) ( not ( = ?auto_391545 ?auto_391547 ) ) ( not ( = ?auto_391545 ?auto_391548 ) ) ( not ( = ?auto_391545 ?auto_391549 ) ) ( not ( = ?auto_391546 ?auto_391547 ) ) ( not ( = ?auto_391546 ?auto_391548 ) ) ( not ( = ?auto_391546 ?auto_391549 ) ) ( not ( = ?auto_391547 ?auto_391548 ) ) ( not ( = ?auto_391547 ?auto_391549 ) ) ( not ( = ?auto_391548 ?auto_391549 ) ) ( ON ?auto_391547 ?auto_391548 ) ( ON ?auto_391546 ?auto_391547 ) ( ON ?auto_391545 ?auto_391546 ) ( ON ?auto_391544 ?auto_391545 ) ( ON ?auto_391543 ?auto_391544 ) ( ON ?auto_391542 ?auto_391543 ) ( ON ?auto_391541 ?auto_391542 ) ( ON ?auto_391540 ?auto_391541 ) ( CLEAR ?auto_391538 ) ( ON ?auto_391539 ?auto_391540 ) ( CLEAR ?auto_391539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_391534 ?auto_391535 ?auto_391536 ?auto_391537 ?auto_391538 ?auto_391539 )
      ( MAKE-15PILE ?auto_391534 ?auto_391535 ?auto_391536 ?auto_391537 ?auto_391538 ?auto_391539 ?auto_391540 ?auto_391541 ?auto_391542 ?auto_391543 ?auto_391544 ?auto_391545 ?auto_391546 ?auto_391547 ?auto_391548 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391565 - BLOCK
      ?auto_391566 - BLOCK
      ?auto_391567 - BLOCK
      ?auto_391568 - BLOCK
      ?auto_391569 - BLOCK
      ?auto_391570 - BLOCK
      ?auto_391571 - BLOCK
      ?auto_391572 - BLOCK
      ?auto_391573 - BLOCK
      ?auto_391574 - BLOCK
      ?auto_391575 - BLOCK
      ?auto_391576 - BLOCK
      ?auto_391577 - BLOCK
      ?auto_391578 - BLOCK
      ?auto_391579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391579 ) ( ON-TABLE ?auto_391565 ) ( ON ?auto_391566 ?auto_391565 ) ( ON ?auto_391567 ?auto_391566 ) ( ON ?auto_391568 ?auto_391567 ) ( ON ?auto_391569 ?auto_391568 ) ( not ( = ?auto_391565 ?auto_391566 ) ) ( not ( = ?auto_391565 ?auto_391567 ) ) ( not ( = ?auto_391565 ?auto_391568 ) ) ( not ( = ?auto_391565 ?auto_391569 ) ) ( not ( = ?auto_391565 ?auto_391570 ) ) ( not ( = ?auto_391565 ?auto_391571 ) ) ( not ( = ?auto_391565 ?auto_391572 ) ) ( not ( = ?auto_391565 ?auto_391573 ) ) ( not ( = ?auto_391565 ?auto_391574 ) ) ( not ( = ?auto_391565 ?auto_391575 ) ) ( not ( = ?auto_391565 ?auto_391576 ) ) ( not ( = ?auto_391565 ?auto_391577 ) ) ( not ( = ?auto_391565 ?auto_391578 ) ) ( not ( = ?auto_391565 ?auto_391579 ) ) ( not ( = ?auto_391566 ?auto_391567 ) ) ( not ( = ?auto_391566 ?auto_391568 ) ) ( not ( = ?auto_391566 ?auto_391569 ) ) ( not ( = ?auto_391566 ?auto_391570 ) ) ( not ( = ?auto_391566 ?auto_391571 ) ) ( not ( = ?auto_391566 ?auto_391572 ) ) ( not ( = ?auto_391566 ?auto_391573 ) ) ( not ( = ?auto_391566 ?auto_391574 ) ) ( not ( = ?auto_391566 ?auto_391575 ) ) ( not ( = ?auto_391566 ?auto_391576 ) ) ( not ( = ?auto_391566 ?auto_391577 ) ) ( not ( = ?auto_391566 ?auto_391578 ) ) ( not ( = ?auto_391566 ?auto_391579 ) ) ( not ( = ?auto_391567 ?auto_391568 ) ) ( not ( = ?auto_391567 ?auto_391569 ) ) ( not ( = ?auto_391567 ?auto_391570 ) ) ( not ( = ?auto_391567 ?auto_391571 ) ) ( not ( = ?auto_391567 ?auto_391572 ) ) ( not ( = ?auto_391567 ?auto_391573 ) ) ( not ( = ?auto_391567 ?auto_391574 ) ) ( not ( = ?auto_391567 ?auto_391575 ) ) ( not ( = ?auto_391567 ?auto_391576 ) ) ( not ( = ?auto_391567 ?auto_391577 ) ) ( not ( = ?auto_391567 ?auto_391578 ) ) ( not ( = ?auto_391567 ?auto_391579 ) ) ( not ( = ?auto_391568 ?auto_391569 ) ) ( not ( = ?auto_391568 ?auto_391570 ) ) ( not ( = ?auto_391568 ?auto_391571 ) ) ( not ( = ?auto_391568 ?auto_391572 ) ) ( not ( = ?auto_391568 ?auto_391573 ) ) ( not ( = ?auto_391568 ?auto_391574 ) ) ( not ( = ?auto_391568 ?auto_391575 ) ) ( not ( = ?auto_391568 ?auto_391576 ) ) ( not ( = ?auto_391568 ?auto_391577 ) ) ( not ( = ?auto_391568 ?auto_391578 ) ) ( not ( = ?auto_391568 ?auto_391579 ) ) ( not ( = ?auto_391569 ?auto_391570 ) ) ( not ( = ?auto_391569 ?auto_391571 ) ) ( not ( = ?auto_391569 ?auto_391572 ) ) ( not ( = ?auto_391569 ?auto_391573 ) ) ( not ( = ?auto_391569 ?auto_391574 ) ) ( not ( = ?auto_391569 ?auto_391575 ) ) ( not ( = ?auto_391569 ?auto_391576 ) ) ( not ( = ?auto_391569 ?auto_391577 ) ) ( not ( = ?auto_391569 ?auto_391578 ) ) ( not ( = ?auto_391569 ?auto_391579 ) ) ( not ( = ?auto_391570 ?auto_391571 ) ) ( not ( = ?auto_391570 ?auto_391572 ) ) ( not ( = ?auto_391570 ?auto_391573 ) ) ( not ( = ?auto_391570 ?auto_391574 ) ) ( not ( = ?auto_391570 ?auto_391575 ) ) ( not ( = ?auto_391570 ?auto_391576 ) ) ( not ( = ?auto_391570 ?auto_391577 ) ) ( not ( = ?auto_391570 ?auto_391578 ) ) ( not ( = ?auto_391570 ?auto_391579 ) ) ( not ( = ?auto_391571 ?auto_391572 ) ) ( not ( = ?auto_391571 ?auto_391573 ) ) ( not ( = ?auto_391571 ?auto_391574 ) ) ( not ( = ?auto_391571 ?auto_391575 ) ) ( not ( = ?auto_391571 ?auto_391576 ) ) ( not ( = ?auto_391571 ?auto_391577 ) ) ( not ( = ?auto_391571 ?auto_391578 ) ) ( not ( = ?auto_391571 ?auto_391579 ) ) ( not ( = ?auto_391572 ?auto_391573 ) ) ( not ( = ?auto_391572 ?auto_391574 ) ) ( not ( = ?auto_391572 ?auto_391575 ) ) ( not ( = ?auto_391572 ?auto_391576 ) ) ( not ( = ?auto_391572 ?auto_391577 ) ) ( not ( = ?auto_391572 ?auto_391578 ) ) ( not ( = ?auto_391572 ?auto_391579 ) ) ( not ( = ?auto_391573 ?auto_391574 ) ) ( not ( = ?auto_391573 ?auto_391575 ) ) ( not ( = ?auto_391573 ?auto_391576 ) ) ( not ( = ?auto_391573 ?auto_391577 ) ) ( not ( = ?auto_391573 ?auto_391578 ) ) ( not ( = ?auto_391573 ?auto_391579 ) ) ( not ( = ?auto_391574 ?auto_391575 ) ) ( not ( = ?auto_391574 ?auto_391576 ) ) ( not ( = ?auto_391574 ?auto_391577 ) ) ( not ( = ?auto_391574 ?auto_391578 ) ) ( not ( = ?auto_391574 ?auto_391579 ) ) ( not ( = ?auto_391575 ?auto_391576 ) ) ( not ( = ?auto_391575 ?auto_391577 ) ) ( not ( = ?auto_391575 ?auto_391578 ) ) ( not ( = ?auto_391575 ?auto_391579 ) ) ( not ( = ?auto_391576 ?auto_391577 ) ) ( not ( = ?auto_391576 ?auto_391578 ) ) ( not ( = ?auto_391576 ?auto_391579 ) ) ( not ( = ?auto_391577 ?auto_391578 ) ) ( not ( = ?auto_391577 ?auto_391579 ) ) ( not ( = ?auto_391578 ?auto_391579 ) ) ( ON ?auto_391578 ?auto_391579 ) ( ON ?auto_391577 ?auto_391578 ) ( ON ?auto_391576 ?auto_391577 ) ( ON ?auto_391575 ?auto_391576 ) ( ON ?auto_391574 ?auto_391575 ) ( ON ?auto_391573 ?auto_391574 ) ( ON ?auto_391572 ?auto_391573 ) ( ON ?auto_391571 ?auto_391572 ) ( CLEAR ?auto_391569 ) ( ON ?auto_391570 ?auto_391571 ) ( CLEAR ?auto_391570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_391565 ?auto_391566 ?auto_391567 ?auto_391568 ?auto_391569 ?auto_391570 )
      ( MAKE-15PILE ?auto_391565 ?auto_391566 ?auto_391567 ?auto_391568 ?auto_391569 ?auto_391570 ?auto_391571 ?auto_391572 ?auto_391573 ?auto_391574 ?auto_391575 ?auto_391576 ?auto_391577 ?auto_391578 ?auto_391579 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391595 - BLOCK
      ?auto_391596 - BLOCK
      ?auto_391597 - BLOCK
      ?auto_391598 - BLOCK
      ?auto_391599 - BLOCK
      ?auto_391600 - BLOCK
      ?auto_391601 - BLOCK
      ?auto_391602 - BLOCK
      ?auto_391603 - BLOCK
      ?auto_391604 - BLOCK
      ?auto_391605 - BLOCK
      ?auto_391606 - BLOCK
      ?auto_391607 - BLOCK
      ?auto_391608 - BLOCK
      ?auto_391609 - BLOCK
    )
    :vars
    (
      ?auto_391610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391609 ?auto_391610 ) ( ON-TABLE ?auto_391595 ) ( ON ?auto_391596 ?auto_391595 ) ( ON ?auto_391597 ?auto_391596 ) ( ON ?auto_391598 ?auto_391597 ) ( not ( = ?auto_391595 ?auto_391596 ) ) ( not ( = ?auto_391595 ?auto_391597 ) ) ( not ( = ?auto_391595 ?auto_391598 ) ) ( not ( = ?auto_391595 ?auto_391599 ) ) ( not ( = ?auto_391595 ?auto_391600 ) ) ( not ( = ?auto_391595 ?auto_391601 ) ) ( not ( = ?auto_391595 ?auto_391602 ) ) ( not ( = ?auto_391595 ?auto_391603 ) ) ( not ( = ?auto_391595 ?auto_391604 ) ) ( not ( = ?auto_391595 ?auto_391605 ) ) ( not ( = ?auto_391595 ?auto_391606 ) ) ( not ( = ?auto_391595 ?auto_391607 ) ) ( not ( = ?auto_391595 ?auto_391608 ) ) ( not ( = ?auto_391595 ?auto_391609 ) ) ( not ( = ?auto_391595 ?auto_391610 ) ) ( not ( = ?auto_391596 ?auto_391597 ) ) ( not ( = ?auto_391596 ?auto_391598 ) ) ( not ( = ?auto_391596 ?auto_391599 ) ) ( not ( = ?auto_391596 ?auto_391600 ) ) ( not ( = ?auto_391596 ?auto_391601 ) ) ( not ( = ?auto_391596 ?auto_391602 ) ) ( not ( = ?auto_391596 ?auto_391603 ) ) ( not ( = ?auto_391596 ?auto_391604 ) ) ( not ( = ?auto_391596 ?auto_391605 ) ) ( not ( = ?auto_391596 ?auto_391606 ) ) ( not ( = ?auto_391596 ?auto_391607 ) ) ( not ( = ?auto_391596 ?auto_391608 ) ) ( not ( = ?auto_391596 ?auto_391609 ) ) ( not ( = ?auto_391596 ?auto_391610 ) ) ( not ( = ?auto_391597 ?auto_391598 ) ) ( not ( = ?auto_391597 ?auto_391599 ) ) ( not ( = ?auto_391597 ?auto_391600 ) ) ( not ( = ?auto_391597 ?auto_391601 ) ) ( not ( = ?auto_391597 ?auto_391602 ) ) ( not ( = ?auto_391597 ?auto_391603 ) ) ( not ( = ?auto_391597 ?auto_391604 ) ) ( not ( = ?auto_391597 ?auto_391605 ) ) ( not ( = ?auto_391597 ?auto_391606 ) ) ( not ( = ?auto_391597 ?auto_391607 ) ) ( not ( = ?auto_391597 ?auto_391608 ) ) ( not ( = ?auto_391597 ?auto_391609 ) ) ( not ( = ?auto_391597 ?auto_391610 ) ) ( not ( = ?auto_391598 ?auto_391599 ) ) ( not ( = ?auto_391598 ?auto_391600 ) ) ( not ( = ?auto_391598 ?auto_391601 ) ) ( not ( = ?auto_391598 ?auto_391602 ) ) ( not ( = ?auto_391598 ?auto_391603 ) ) ( not ( = ?auto_391598 ?auto_391604 ) ) ( not ( = ?auto_391598 ?auto_391605 ) ) ( not ( = ?auto_391598 ?auto_391606 ) ) ( not ( = ?auto_391598 ?auto_391607 ) ) ( not ( = ?auto_391598 ?auto_391608 ) ) ( not ( = ?auto_391598 ?auto_391609 ) ) ( not ( = ?auto_391598 ?auto_391610 ) ) ( not ( = ?auto_391599 ?auto_391600 ) ) ( not ( = ?auto_391599 ?auto_391601 ) ) ( not ( = ?auto_391599 ?auto_391602 ) ) ( not ( = ?auto_391599 ?auto_391603 ) ) ( not ( = ?auto_391599 ?auto_391604 ) ) ( not ( = ?auto_391599 ?auto_391605 ) ) ( not ( = ?auto_391599 ?auto_391606 ) ) ( not ( = ?auto_391599 ?auto_391607 ) ) ( not ( = ?auto_391599 ?auto_391608 ) ) ( not ( = ?auto_391599 ?auto_391609 ) ) ( not ( = ?auto_391599 ?auto_391610 ) ) ( not ( = ?auto_391600 ?auto_391601 ) ) ( not ( = ?auto_391600 ?auto_391602 ) ) ( not ( = ?auto_391600 ?auto_391603 ) ) ( not ( = ?auto_391600 ?auto_391604 ) ) ( not ( = ?auto_391600 ?auto_391605 ) ) ( not ( = ?auto_391600 ?auto_391606 ) ) ( not ( = ?auto_391600 ?auto_391607 ) ) ( not ( = ?auto_391600 ?auto_391608 ) ) ( not ( = ?auto_391600 ?auto_391609 ) ) ( not ( = ?auto_391600 ?auto_391610 ) ) ( not ( = ?auto_391601 ?auto_391602 ) ) ( not ( = ?auto_391601 ?auto_391603 ) ) ( not ( = ?auto_391601 ?auto_391604 ) ) ( not ( = ?auto_391601 ?auto_391605 ) ) ( not ( = ?auto_391601 ?auto_391606 ) ) ( not ( = ?auto_391601 ?auto_391607 ) ) ( not ( = ?auto_391601 ?auto_391608 ) ) ( not ( = ?auto_391601 ?auto_391609 ) ) ( not ( = ?auto_391601 ?auto_391610 ) ) ( not ( = ?auto_391602 ?auto_391603 ) ) ( not ( = ?auto_391602 ?auto_391604 ) ) ( not ( = ?auto_391602 ?auto_391605 ) ) ( not ( = ?auto_391602 ?auto_391606 ) ) ( not ( = ?auto_391602 ?auto_391607 ) ) ( not ( = ?auto_391602 ?auto_391608 ) ) ( not ( = ?auto_391602 ?auto_391609 ) ) ( not ( = ?auto_391602 ?auto_391610 ) ) ( not ( = ?auto_391603 ?auto_391604 ) ) ( not ( = ?auto_391603 ?auto_391605 ) ) ( not ( = ?auto_391603 ?auto_391606 ) ) ( not ( = ?auto_391603 ?auto_391607 ) ) ( not ( = ?auto_391603 ?auto_391608 ) ) ( not ( = ?auto_391603 ?auto_391609 ) ) ( not ( = ?auto_391603 ?auto_391610 ) ) ( not ( = ?auto_391604 ?auto_391605 ) ) ( not ( = ?auto_391604 ?auto_391606 ) ) ( not ( = ?auto_391604 ?auto_391607 ) ) ( not ( = ?auto_391604 ?auto_391608 ) ) ( not ( = ?auto_391604 ?auto_391609 ) ) ( not ( = ?auto_391604 ?auto_391610 ) ) ( not ( = ?auto_391605 ?auto_391606 ) ) ( not ( = ?auto_391605 ?auto_391607 ) ) ( not ( = ?auto_391605 ?auto_391608 ) ) ( not ( = ?auto_391605 ?auto_391609 ) ) ( not ( = ?auto_391605 ?auto_391610 ) ) ( not ( = ?auto_391606 ?auto_391607 ) ) ( not ( = ?auto_391606 ?auto_391608 ) ) ( not ( = ?auto_391606 ?auto_391609 ) ) ( not ( = ?auto_391606 ?auto_391610 ) ) ( not ( = ?auto_391607 ?auto_391608 ) ) ( not ( = ?auto_391607 ?auto_391609 ) ) ( not ( = ?auto_391607 ?auto_391610 ) ) ( not ( = ?auto_391608 ?auto_391609 ) ) ( not ( = ?auto_391608 ?auto_391610 ) ) ( not ( = ?auto_391609 ?auto_391610 ) ) ( ON ?auto_391608 ?auto_391609 ) ( ON ?auto_391607 ?auto_391608 ) ( ON ?auto_391606 ?auto_391607 ) ( ON ?auto_391605 ?auto_391606 ) ( ON ?auto_391604 ?auto_391605 ) ( ON ?auto_391603 ?auto_391604 ) ( ON ?auto_391602 ?auto_391603 ) ( ON ?auto_391601 ?auto_391602 ) ( ON ?auto_391600 ?auto_391601 ) ( CLEAR ?auto_391598 ) ( ON ?auto_391599 ?auto_391600 ) ( CLEAR ?auto_391599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_391595 ?auto_391596 ?auto_391597 ?auto_391598 ?auto_391599 )
      ( MAKE-15PILE ?auto_391595 ?auto_391596 ?auto_391597 ?auto_391598 ?auto_391599 ?auto_391600 ?auto_391601 ?auto_391602 ?auto_391603 ?auto_391604 ?auto_391605 ?auto_391606 ?auto_391607 ?auto_391608 ?auto_391609 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391626 - BLOCK
      ?auto_391627 - BLOCK
      ?auto_391628 - BLOCK
      ?auto_391629 - BLOCK
      ?auto_391630 - BLOCK
      ?auto_391631 - BLOCK
      ?auto_391632 - BLOCK
      ?auto_391633 - BLOCK
      ?auto_391634 - BLOCK
      ?auto_391635 - BLOCK
      ?auto_391636 - BLOCK
      ?auto_391637 - BLOCK
      ?auto_391638 - BLOCK
      ?auto_391639 - BLOCK
      ?auto_391640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391640 ) ( ON-TABLE ?auto_391626 ) ( ON ?auto_391627 ?auto_391626 ) ( ON ?auto_391628 ?auto_391627 ) ( ON ?auto_391629 ?auto_391628 ) ( not ( = ?auto_391626 ?auto_391627 ) ) ( not ( = ?auto_391626 ?auto_391628 ) ) ( not ( = ?auto_391626 ?auto_391629 ) ) ( not ( = ?auto_391626 ?auto_391630 ) ) ( not ( = ?auto_391626 ?auto_391631 ) ) ( not ( = ?auto_391626 ?auto_391632 ) ) ( not ( = ?auto_391626 ?auto_391633 ) ) ( not ( = ?auto_391626 ?auto_391634 ) ) ( not ( = ?auto_391626 ?auto_391635 ) ) ( not ( = ?auto_391626 ?auto_391636 ) ) ( not ( = ?auto_391626 ?auto_391637 ) ) ( not ( = ?auto_391626 ?auto_391638 ) ) ( not ( = ?auto_391626 ?auto_391639 ) ) ( not ( = ?auto_391626 ?auto_391640 ) ) ( not ( = ?auto_391627 ?auto_391628 ) ) ( not ( = ?auto_391627 ?auto_391629 ) ) ( not ( = ?auto_391627 ?auto_391630 ) ) ( not ( = ?auto_391627 ?auto_391631 ) ) ( not ( = ?auto_391627 ?auto_391632 ) ) ( not ( = ?auto_391627 ?auto_391633 ) ) ( not ( = ?auto_391627 ?auto_391634 ) ) ( not ( = ?auto_391627 ?auto_391635 ) ) ( not ( = ?auto_391627 ?auto_391636 ) ) ( not ( = ?auto_391627 ?auto_391637 ) ) ( not ( = ?auto_391627 ?auto_391638 ) ) ( not ( = ?auto_391627 ?auto_391639 ) ) ( not ( = ?auto_391627 ?auto_391640 ) ) ( not ( = ?auto_391628 ?auto_391629 ) ) ( not ( = ?auto_391628 ?auto_391630 ) ) ( not ( = ?auto_391628 ?auto_391631 ) ) ( not ( = ?auto_391628 ?auto_391632 ) ) ( not ( = ?auto_391628 ?auto_391633 ) ) ( not ( = ?auto_391628 ?auto_391634 ) ) ( not ( = ?auto_391628 ?auto_391635 ) ) ( not ( = ?auto_391628 ?auto_391636 ) ) ( not ( = ?auto_391628 ?auto_391637 ) ) ( not ( = ?auto_391628 ?auto_391638 ) ) ( not ( = ?auto_391628 ?auto_391639 ) ) ( not ( = ?auto_391628 ?auto_391640 ) ) ( not ( = ?auto_391629 ?auto_391630 ) ) ( not ( = ?auto_391629 ?auto_391631 ) ) ( not ( = ?auto_391629 ?auto_391632 ) ) ( not ( = ?auto_391629 ?auto_391633 ) ) ( not ( = ?auto_391629 ?auto_391634 ) ) ( not ( = ?auto_391629 ?auto_391635 ) ) ( not ( = ?auto_391629 ?auto_391636 ) ) ( not ( = ?auto_391629 ?auto_391637 ) ) ( not ( = ?auto_391629 ?auto_391638 ) ) ( not ( = ?auto_391629 ?auto_391639 ) ) ( not ( = ?auto_391629 ?auto_391640 ) ) ( not ( = ?auto_391630 ?auto_391631 ) ) ( not ( = ?auto_391630 ?auto_391632 ) ) ( not ( = ?auto_391630 ?auto_391633 ) ) ( not ( = ?auto_391630 ?auto_391634 ) ) ( not ( = ?auto_391630 ?auto_391635 ) ) ( not ( = ?auto_391630 ?auto_391636 ) ) ( not ( = ?auto_391630 ?auto_391637 ) ) ( not ( = ?auto_391630 ?auto_391638 ) ) ( not ( = ?auto_391630 ?auto_391639 ) ) ( not ( = ?auto_391630 ?auto_391640 ) ) ( not ( = ?auto_391631 ?auto_391632 ) ) ( not ( = ?auto_391631 ?auto_391633 ) ) ( not ( = ?auto_391631 ?auto_391634 ) ) ( not ( = ?auto_391631 ?auto_391635 ) ) ( not ( = ?auto_391631 ?auto_391636 ) ) ( not ( = ?auto_391631 ?auto_391637 ) ) ( not ( = ?auto_391631 ?auto_391638 ) ) ( not ( = ?auto_391631 ?auto_391639 ) ) ( not ( = ?auto_391631 ?auto_391640 ) ) ( not ( = ?auto_391632 ?auto_391633 ) ) ( not ( = ?auto_391632 ?auto_391634 ) ) ( not ( = ?auto_391632 ?auto_391635 ) ) ( not ( = ?auto_391632 ?auto_391636 ) ) ( not ( = ?auto_391632 ?auto_391637 ) ) ( not ( = ?auto_391632 ?auto_391638 ) ) ( not ( = ?auto_391632 ?auto_391639 ) ) ( not ( = ?auto_391632 ?auto_391640 ) ) ( not ( = ?auto_391633 ?auto_391634 ) ) ( not ( = ?auto_391633 ?auto_391635 ) ) ( not ( = ?auto_391633 ?auto_391636 ) ) ( not ( = ?auto_391633 ?auto_391637 ) ) ( not ( = ?auto_391633 ?auto_391638 ) ) ( not ( = ?auto_391633 ?auto_391639 ) ) ( not ( = ?auto_391633 ?auto_391640 ) ) ( not ( = ?auto_391634 ?auto_391635 ) ) ( not ( = ?auto_391634 ?auto_391636 ) ) ( not ( = ?auto_391634 ?auto_391637 ) ) ( not ( = ?auto_391634 ?auto_391638 ) ) ( not ( = ?auto_391634 ?auto_391639 ) ) ( not ( = ?auto_391634 ?auto_391640 ) ) ( not ( = ?auto_391635 ?auto_391636 ) ) ( not ( = ?auto_391635 ?auto_391637 ) ) ( not ( = ?auto_391635 ?auto_391638 ) ) ( not ( = ?auto_391635 ?auto_391639 ) ) ( not ( = ?auto_391635 ?auto_391640 ) ) ( not ( = ?auto_391636 ?auto_391637 ) ) ( not ( = ?auto_391636 ?auto_391638 ) ) ( not ( = ?auto_391636 ?auto_391639 ) ) ( not ( = ?auto_391636 ?auto_391640 ) ) ( not ( = ?auto_391637 ?auto_391638 ) ) ( not ( = ?auto_391637 ?auto_391639 ) ) ( not ( = ?auto_391637 ?auto_391640 ) ) ( not ( = ?auto_391638 ?auto_391639 ) ) ( not ( = ?auto_391638 ?auto_391640 ) ) ( not ( = ?auto_391639 ?auto_391640 ) ) ( ON ?auto_391639 ?auto_391640 ) ( ON ?auto_391638 ?auto_391639 ) ( ON ?auto_391637 ?auto_391638 ) ( ON ?auto_391636 ?auto_391637 ) ( ON ?auto_391635 ?auto_391636 ) ( ON ?auto_391634 ?auto_391635 ) ( ON ?auto_391633 ?auto_391634 ) ( ON ?auto_391632 ?auto_391633 ) ( ON ?auto_391631 ?auto_391632 ) ( CLEAR ?auto_391629 ) ( ON ?auto_391630 ?auto_391631 ) ( CLEAR ?auto_391630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_391626 ?auto_391627 ?auto_391628 ?auto_391629 ?auto_391630 )
      ( MAKE-15PILE ?auto_391626 ?auto_391627 ?auto_391628 ?auto_391629 ?auto_391630 ?auto_391631 ?auto_391632 ?auto_391633 ?auto_391634 ?auto_391635 ?auto_391636 ?auto_391637 ?auto_391638 ?auto_391639 ?auto_391640 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391656 - BLOCK
      ?auto_391657 - BLOCK
      ?auto_391658 - BLOCK
      ?auto_391659 - BLOCK
      ?auto_391660 - BLOCK
      ?auto_391661 - BLOCK
      ?auto_391662 - BLOCK
      ?auto_391663 - BLOCK
      ?auto_391664 - BLOCK
      ?auto_391665 - BLOCK
      ?auto_391666 - BLOCK
      ?auto_391667 - BLOCK
      ?auto_391668 - BLOCK
      ?auto_391669 - BLOCK
      ?auto_391670 - BLOCK
    )
    :vars
    (
      ?auto_391671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391670 ?auto_391671 ) ( ON-TABLE ?auto_391656 ) ( ON ?auto_391657 ?auto_391656 ) ( ON ?auto_391658 ?auto_391657 ) ( not ( = ?auto_391656 ?auto_391657 ) ) ( not ( = ?auto_391656 ?auto_391658 ) ) ( not ( = ?auto_391656 ?auto_391659 ) ) ( not ( = ?auto_391656 ?auto_391660 ) ) ( not ( = ?auto_391656 ?auto_391661 ) ) ( not ( = ?auto_391656 ?auto_391662 ) ) ( not ( = ?auto_391656 ?auto_391663 ) ) ( not ( = ?auto_391656 ?auto_391664 ) ) ( not ( = ?auto_391656 ?auto_391665 ) ) ( not ( = ?auto_391656 ?auto_391666 ) ) ( not ( = ?auto_391656 ?auto_391667 ) ) ( not ( = ?auto_391656 ?auto_391668 ) ) ( not ( = ?auto_391656 ?auto_391669 ) ) ( not ( = ?auto_391656 ?auto_391670 ) ) ( not ( = ?auto_391656 ?auto_391671 ) ) ( not ( = ?auto_391657 ?auto_391658 ) ) ( not ( = ?auto_391657 ?auto_391659 ) ) ( not ( = ?auto_391657 ?auto_391660 ) ) ( not ( = ?auto_391657 ?auto_391661 ) ) ( not ( = ?auto_391657 ?auto_391662 ) ) ( not ( = ?auto_391657 ?auto_391663 ) ) ( not ( = ?auto_391657 ?auto_391664 ) ) ( not ( = ?auto_391657 ?auto_391665 ) ) ( not ( = ?auto_391657 ?auto_391666 ) ) ( not ( = ?auto_391657 ?auto_391667 ) ) ( not ( = ?auto_391657 ?auto_391668 ) ) ( not ( = ?auto_391657 ?auto_391669 ) ) ( not ( = ?auto_391657 ?auto_391670 ) ) ( not ( = ?auto_391657 ?auto_391671 ) ) ( not ( = ?auto_391658 ?auto_391659 ) ) ( not ( = ?auto_391658 ?auto_391660 ) ) ( not ( = ?auto_391658 ?auto_391661 ) ) ( not ( = ?auto_391658 ?auto_391662 ) ) ( not ( = ?auto_391658 ?auto_391663 ) ) ( not ( = ?auto_391658 ?auto_391664 ) ) ( not ( = ?auto_391658 ?auto_391665 ) ) ( not ( = ?auto_391658 ?auto_391666 ) ) ( not ( = ?auto_391658 ?auto_391667 ) ) ( not ( = ?auto_391658 ?auto_391668 ) ) ( not ( = ?auto_391658 ?auto_391669 ) ) ( not ( = ?auto_391658 ?auto_391670 ) ) ( not ( = ?auto_391658 ?auto_391671 ) ) ( not ( = ?auto_391659 ?auto_391660 ) ) ( not ( = ?auto_391659 ?auto_391661 ) ) ( not ( = ?auto_391659 ?auto_391662 ) ) ( not ( = ?auto_391659 ?auto_391663 ) ) ( not ( = ?auto_391659 ?auto_391664 ) ) ( not ( = ?auto_391659 ?auto_391665 ) ) ( not ( = ?auto_391659 ?auto_391666 ) ) ( not ( = ?auto_391659 ?auto_391667 ) ) ( not ( = ?auto_391659 ?auto_391668 ) ) ( not ( = ?auto_391659 ?auto_391669 ) ) ( not ( = ?auto_391659 ?auto_391670 ) ) ( not ( = ?auto_391659 ?auto_391671 ) ) ( not ( = ?auto_391660 ?auto_391661 ) ) ( not ( = ?auto_391660 ?auto_391662 ) ) ( not ( = ?auto_391660 ?auto_391663 ) ) ( not ( = ?auto_391660 ?auto_391664 ) ) ( not ( = ?auto_391660 ?auto_391665 ) ) ( not ( = ?auto_391660 ?auto_391666 ) ) ( not ( = ?auto_391660 ?auto_391667 ) ) ( not ( = ?auto_391660 ?auto_391668 ) ) ( not ( = ?auto_391660 ?auto_391669 ) ) ( not ( = ?auto_391660 ?auto_391670 ) ) ( not ( = ?auto_391660 ?auto_391671 ) ) ( not ( = ?auto_391661 ?auto_391662 ) ) ( not ( = ?auto_391661 ?auto_391663 ) ) ( not ( = ?auto_391661 ?auto_391664 ) ) ( not ( = ?auto_391661 ?auto_391665 ) ) ( not ( = ?auto_391661 ?auto_391666 ) ) ( not ( = ?auto_391661 ?auto_391667 ) ) ( not ( = ?auto_391661 ?auto_391668 ) ) ( not ( = ?auto_391661 ?auto_391669 ) ) ( not ( = ?auto_391661 ?auto_391670 ) ) ( not ( = ?auto_391661 ?auto_391671 ) ) ( not ( = ?auto_391662 ?auto_391663 ) ) ( not ( = ?auto_391662 ?auto_391664 ) ) ( not ( = ?auto_391662 ?auto_391665 ) ) ( not ( = ?auto_391662 ?auto_391666 ) ) ( not ( = ?auto_391662 ?auto_391667 ) ) ( not ( = ?auto_391662 ?auto_391668 ) ) ( not ( = ?auto_391662 ?auto_391669 ) ) ( not ( = ?auto_391662 ?auto_391670 ) ) ( not ( = ?auto_391662 ?auto_391671 ) ) ( not ( = ?auto_391663 ?auto_391664 ) ) ( not ( = ?auto_391663 ?auto_391665 ) ) ( not ( = ?auto_391663 ?auto_391666 ) ) ( not ( = ?auto_391663 ?auto_391667 ) ) ( not ( = ?auto_391663 ?auto_391668 ) ) ( not ( = ?auto_391663 ?auto_391669 ) ) ( not ( = ?auto_391663 ?auto_391670 ) ) ( not ( = ?auto_391663 ?auto_391671 ) ) ( not ( = ?auto_391664 ?auto_391665 ) ) ( not ( = ?auto_391664 ?auto_391666 ) ) ( not ( = ?auto_391664 ?auto_391667 ) ) ( not ( = ?auto_391664 ?auto_391668 ) ) ( not ( = ?auto_391664 ?auto_391669 ) ) ( not ( = ?auto_391664 ?auto_391670 ) ) ( not ( = ?auto_391664 ?auto_391671 ) ) ( not ( = ?auto_391665 ?auto_391666 ) ) ( not ( = ?auto_391665 ?auto_391667 ) ) ( not ( = ?auto_391665 ?auto_391668 ) ) ( not ( = ?auto_391665 ?auto_391669 ) ) ( not ( = ?auto_391665 ?auto_391670 ) ) ( not ( = ?auto_391665 ?auto_391671 ) ) ( not ( = ?auto_391666 ?auto_391667 ) ) ( not ( = ?auto_391666 ?auto_391668 ) ) ( not ( = ?auto_391666 ?auto_391669 ) ) ( not ( = ?auto_391666 ?auto_391670 ) ) ( not ( = ?auto_391666 ?auto_391671 ) ) ( not ( = ?auto_391667 ?auto_391668 ) ) ( not ( = ?auto_391667 ?auto_391669 ) ) ( not ( = ?auto_391667 ?auto_391670 ) ) ( not ( = ?auto_391667 ?auto_391671 ) ) ( not ( = ?auto_391668 ?auto_391669 ) ) ( not ( = ?auto_391668 ?auto_391670 ) ) ( not ( = ?auto_391668 ?auto_391671 ) ) ( not ( = ?auto_391669 ?auto_391670 ) ) ( not ( = ?auto_391669 ?auto_391671 ) ) ( not ( = ?auto_391670 ?auto_391671 ) ) ( ON ?auto_391669 ?auto_391670 ) ( ON ?auto_391668 ?auto_391669 ) ( ON ?auto_391667 ?auto_391668 ) ( ON ?auto_391666 ?auto_391667 ) ( ON ?auto_391665 ?auto_391666 ) ( ON ?auto_391664 ?auto_391665 ) ( ON ?auto_391663 ?auto_391664 ) ( ON ?auto_391662 ?auto_391663 ) ( ON ?auto_391661 ?auto_391662 ) ( ON ?auto_391660 ?auto_391661 ) ( CLEAR ?auto_391658 ) ( ON ?auto_391659 ?auto_391660 ) ( CLEAR ?auto_391659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_391656 ?auto_391657 ?auto_391658 ?auto_391659 )
      ( MAKE-15PILE ?auto_391656 ?auto_391657 ?auto_391658 ?auto_391659 ?auto_391660 ?auto_391661 ?auto_391662 ?auto_391663 ?auto_391664 ?auto_391665 ?auto_391666 ?auto_391667 ?auto_391668 ?auto_391669 ?auto_391670 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391687 - BLOCK
      ?auto_391688 - BLOCK
      ?auto_391689 - BLOCK
      ?auto_391690 - BLOCK
      ?auto_391691 - BLOCK
      ?auto_391692 - BLOCK
      ?auto_391693 - BLOCK
      ?auto_391694 - BLOCK
      ?auto_391695 - BLOCK
      ?auto_391696 - BLOCK
      ?auto_391697 - BLOCK
      ?auto_391698 - BLOCK
      ?auto_391699 - BLOCK
      ?auto_391700 - BLOCK
      ?auto_391701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391701 ) ( ON-TABLE ?auto_391687 ) ( ON ?auto_391688 ?auto_391687 ) ( ON ?auto_391689 ?auto_391688 ) ( not ( = ?auto_391687 ?auto_391688 ) ) ( not ( = ?auto_391687 ?auto_391689 ) ) ( not ( = ?auto_391687 ?auto_391690 ) ) ( not ( = ?auto_391687 ?auto_391691 ) ) ( not ( = ?auto_391687 ?auto_391692 ) ) ( not ( = ?auto_391687 ?auto_391693 ) ) ( not ( = ?auto_391687 ?auto_391694 ) ) ( not ( = ?auto_391687 ?auto_391695 ) ) ( not ( = ?auto_391687 ?auto_391696 ) ) ( not ( = ?auto_391687 ?auto_391697 ) ) ( not ( = ?auto_391687 ?auto_391698 ) ) ( not ( = ?auto_391687 ?auto_391699 ) ) ( not ( = ?auto_391687 ?auto_391700 ) ) ( not ( = ?auto_391687 ?auto_391701 ) ) ( not ( = ?auto_391688 ?auto_391689 ) ) ( not ( = ?auto_391688 ?auto_391690 ) ) ( not ( = ?auto_391688 ?auto_391691 ) ) ( not ( = ?auto_391688 ?auto_391692 ) ) ( not ( = ?auto_391688 ?auto_391693 ) ) ( not ( = ?auto_391688 ?auto_391694 ) ) ( not ( = ?auto_391688 ?auto_391695 ) ) ( not ( = ?auto_391688 ?auto_391696 ) ) ( not ( = ?auto_391688 ?auto_391697 ) ) ( not ( = ?auto_391688 ?auto_391698 ) ) ( not ( = ?auto_391688 ?auto_391699 ) ) ( not ( = ?auto_391688 ?auto_391700 ) ) ( not ( = ?auto_391688 ?auto_391701 ) ) ( not ( = ?auto_391689 ?auto_391690 ) ) ( not ( = ?auto_391689 ?auto_391691 ) ) ( not ( = ?auto_391689 ?auto_391692 ) ) ( not ( = ?auto_391689 ?auto_391693 ) ) ( not ( = ?auto_391689 ?auto_391694 ) ) ( not ( = ?auto_391689 ?auto_391695 ) ) ( not ( = ?auto_391689 ?auto_391696 ) ) ( not ( = ?auto_391689 ?auto_391697 ) ) ( not ( = ?auto_391689 ?auto_391698 ) ) ( not ( = ?auto_391689 ?auto_391699 ) ) ( not ( = ?auto_391689 ?auto_391700 ) ) ( not ( = ?auto_391689 ?auto_391701 ) ) ( not ( = ?auto_391690 ?auto_391691 ) ) ( not ( = ?auto_391690 ?auto_391692 ) ) ( not ( = ?auto_391690 ?auto_391693 ) ) ( not ( = ?auto_391690 ?auto_391694 ) ) ( not ( = ?auto_391690 ?auto_391695 ) ) ( not ( = ?auto_391690 ?auto_391696 ) ) ( not ( = ?auto_391690 ?auto_391697 ) ) ( not ( = ?auto_391690 ?auto_391698 ) ) ( not ( = ?auto_391690 ?auto_391699 ) ) ( not ( = ?auto_391690 ?auto_391700 ) ) ( not ( = ?auto_391690 ?auto_391701 ) ) ( not ( = ?auto_391691 ?auto_391692 ) ) ( not ( = ?auto_391691 ?auto_391693 ) ) ( not ( = ?auto_391691 ?auto_391694 ) ) ( not ( = ?auto_391691 ?auto_391695 ) ) ( not ( = ?auto_391691 ?auto_391696 ) ) ( not ( = ?auto_391691 ?auto_391697 ) ) ( not ( = ?auto_391691 ?auto_391698 ) ) ( not ( = ?auto_391691 ?auto_391699 ) ) ( not ( = ?auto_391691 ?auto_391700 ) ) ( not ( = ?auto_391691 ?auto_391701 ) ) ( not ( = ?auto_391692 ?auto_391693 ) ) ( not ( = ?auto_391692 ?auto_391694 ) ) ( not ( = ?auto_391692 ?auto_391695 ) ) ( not ( = ?auto_391692 ?auto_391696 ) ) ( not ( = ?auto_391692 ?auto_391697 ) ) ( not ( = ?auto_391692 ?auto_391698 ) ) ( not ( = ?auto_391692 ?auto_391699 ) ) ( not ( = ?auto_391692 ?auto_391700 ) ) ( not ( = ?auto_391692 ?auto_391701 ) ) ( not ( = ?auto_391693 ?auto_391694 ) ) ( not ( = ?auto_391693 ?auto_391695 ) ) ( not ( = ?auto_391693 ?auto_391696 ) ) ( not ( = ?auto_391693 ?auto_391697 ) ) ( not ( = ?auto_391693 ?auto_391698 ) ) ( not ( = ?auto_391693 ?auto_391699 ) ) ( not ( = ?auto_391693 ?auto_391700 ) ) ( not ( = ?auto_391693 ?auto_391701 ) ) ( not ( = ?auto_391694 ?auto_391695 ) ) ( not ( = ?auto_391694 ?auto_391696 ) ) ( not ( = ?auto_391694 ?auto_391697 ) ) ( not ( = ?auto_391694 ?auto_391698 ) ) ( not ( = ?auto_391694 ?auto_391699 ) ) ( not ( = ?auto_391694 ?auto_391700 ) ) ( not ( = ?auto_391694 ?auto_391701 ) ) ( not ( = ?auto_391695 ?auto_391696 ) ) ( not ( = ?auto_391695 ?auto_391697 ) ) ( not ( = ?auto_391695 ?auto_391698 ) ) ( not ( = ?auto_391695 ?auto_391699 ) ) ( not ( = ?auto_391695 ?auto_391700 ) ) ( not ( = ?auto_391695 ?auto_391701 ) ) ( not ( = ?auto_391696 ?auto_391697 ) ) ( not ( = ?auto_391696 ?auto_391698 ) ) ( not ( = ?auto_391696 ?auto_391699 ) ) ( not ( = ?auto_391696 ?auto_391700 ) ) ( not ( = ?auto_391696 ?auto_391701 ) ) ( not ( = ?auto_391697 ?auto_391698 ) ) ( not ( = ?auto_391697 ?auto_391699 ) ) ( not ( = ?auto_391697 ?auto_391700 ) ) ( not ( = ?auto_391697 ?auto_391701 ) ) ( not ( = ?auto_391698 ?auto_391699 ) ) ( not ( = ?auto_391698 ?auto_391700 ) ) ( not ( = ?auto_391698 ?auto_391701 ) ) ( not ( = ?auto_391699 ?auto_391700 ) ) ( not ( = ?auto_391699 ?auto_391701 ) ) ( not ( = ?auto_391700 ?auto_391701 ) ) ( ON ?auto_391700 ?auto_391701 ) ( ON ?auto_391699 ?auto_391700 ) ( ON ?auto_391698 ?auto_391699 ) ( ON ?auto_391697 ?auto_391698 ) ( ON ?auto_391696 ?auto_391697 ) ( ON ?auto_391695 ?auto_391696 ) ( ON ?auto_391694 ?auto_391695 ) ( ON ?auto_391693 ?auto_391694 ) ( ON ?auto_391692 ?auto_391693 ) ( ON ?auto_391691 ?auto_391692 ) ( CLEAR ?auto_391689 ) ( ON ?auto_391690 ?auto_391691 ) ( CLEAR ?auto_391690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_391687 ?auto_391688 ?auto_391689 ?auto_391690 )
      ( MAKE-15PILE ?auto_391687 ?auto_391688 ?auto_391689 ?auto_391690 ?auto_391691 ?auto_391692 ?auto_391693 ?auto_391694 ?auto_391695 ?auto_391696 ?auto_391697 ?auto_391698 ?auto_391699 ?auto_391700 ?auto_391701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391717 - BLOCK
      ?auto_391718 - BLOCK
      ?auto_391719 - BLOCK
      ?auto_391720 - BLOCK
      ?auto_391721 - BLOCK
      ?auto_391722 - BLOCK
      ?auto_391723 - BLOCK
      ?auto_391724 - BLOCK
      ?auto_391725 - BLOCK
      ?auto_391726 - BLOCK
      ?auto_391727 - BLOCK
      ?auto_391728 - BLOCK
      ?auto_391729 - BLOCK
      ?auto_391730 - BLOCK
      ?auto_391731 - BLOCK
    )
    :vars
    (
      ?auto_391732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391731 ?auto_391732 ) ( ON-TABLE ?auto_391717 ) ( ON ?auto_391718 ?auto_391717 ) ( not ( = ?auto_391717 ?auto_391718 ) ) ( not ( = ?auto_391717 ?auto_391719 ) ) ( not ( = ?auto_391717 ?auto_391720 ) ) ( not ( = ?auto_391717 ?auto_391721 ) ) ( not ( = ?auto_391717 ?auto_391722 ) ) ( not ( = ?auto_391717 ?auto_391723 ) ) ( not ( = ?auto_391717 ?auto_391724 ) ) ( not ( = ?auto_391717 ?auto_391725 ) ) ( not ( = ?auto_391717 ?auto_391726 ) ) ( not ( = ?auto_391717 ?auto_391727 ) ) ( not ( = ?auto_391717 ?auto_391728 ) ) ( not ( = ?auto_391717 ?auto_391729 ) ) ( not ( = ?auto_391717 ?auto_391730 ) ) ( not ( = ?auto_391717 ?auto_391731 ) ) ( not ( = ?auto_391717 ?auto_391732 ) ) ( not ( = ?auto_391718 ?auto_391719 ) ) ( not ( = ?auto_391718 ?auto_391720 ) ) ( not ( = ?auto_391718 ?auto_391721 ) ) ( not ( = ?auto_391718 ?auto_391722 ) ) ( not ( = ?auto_391718 ?auto_391723 ) ) ( not ( = ?auto_391718 ?auto_391724 ) ) ( not ( = ?auto_391718 ?auto_391725 ) ) ( not ( = ?auto_391718 ?auto_391726 ) ) ( not ( = ?auto_391718 ?auto_391727 ) ) ( not ( = ?auto_391718 ?auto_391728 ) ) ( not ( = ?auto_391718 ?auto_391729 ) ) ( not ( = ?auto_391718 ?auto_391730 ) ) ( not ( = ?auto_391718 ?auto_391731 ) ) ( not ( = ?auto_391718 ?auto_391732 ) ) ( not ( = ?auto_391719 ?auto_391720 ) ) ( not ( = ?auto_391719 ?auto_391721 ) ) ( not ( = ?auto_391719 ?auto_391722 ) ) ( not ( = ?auto_391719 ?auto_391723 ) ) ( not ( = ?auto_391719 ?auto_391724 ) ) ( not ( = ?auto_391719 ?auto_391725 ) ) ( not ( = ?auto_391719 ?auto_391726 ) ) ( not ( = ?auto_391719 ?auto_391727 ) ) ( not ( = ?auto_391719 ?auto_391728 ) ) ( not ( = ?auto_391719 ?auto_391729 ) ) ( not ( = ?auto_391719 ?auto_391730 ) ) ( not ( = ?auto_391719 ?auto_391731 ) ) ( not ( = ?auto_391719 ?auto_391732 ) ) ( not ( = ?auto_391720 ?auto_391721 ) ) ( not ( = ?auto_391720 ?auto_391722 ) ) ( not ( = ?auto_391720 ?auto_391723 ) ) ( not ( = ?auto_391720 ?auto_391724 ) ) ( not ( = ?auto_391720 ?auto_391725 ) ) ( not ( = ?auto_391720 ?auto_391726 ) ) ( not ( = ?auto_391720 ?auto_391727 ) ) ( not ( = ?auto_391720 ?auto_391728 ) ) ( not ( = ?auto_391720 ?auto_391729 ) ) ( not ( = ?auto_391720 ?auto_391730 ) ) ( not ( = ?auto_391720 ?auto_391731 ) ) ( not ( = ?auto_391720 ?auto_391732 ) ) ( not ( = ?auto_391721 ?auto_391722 ) ) ( not ( = ?auto_391721 ?auto_391723 ) ) ( not ( = ?auto_391721 ?auto_391724 ) ) ( not ( = ?auto_391721 ?auto_391725 ) ) ( not ( = ?auto_391721 ?auto_391726 ) ) ( not ( = ?auto_391721 ?auto_391727 ) ) ( not ( = ?auto_391721 ?auto_391728 ) ) ( not ( = ?auto_391721 ?auto_391729 ) ) ( not ( = ?auto_391721 ?auto_391730 ) ) ( not ( = ?auto_391721 ?auto_391731 ) ) ( not ( = ?auto_391721 ?auto_391732 ) ) ( not ( = ?auto_391722 ?auto_391723 ) ) ( not ( = ?auto_391722 ?auto_391724 ) ) ( not ( = ?auto_391722 ?auto_391725 ) ) ( not ( = ?auto_391722 ?auto_391726 ) ) ( not ( = ?auto_391722 ?auto_391727 ) ) ( not ( = ?auto_391722 ?auto_391728 ) ) ( not ( = ?auto_391722 ?auto_391729 ) ) ( not ( = ?auto_391722 ?auto_391730 ) ) ( not ( = ?auto_391722 ?auto_391731 ) ) ( not ( = ?auto_391722 ?auto_391732 ) ) ( not ( = ?auto_391723 ?auto_391724 ) ) ( not ( = ?auto_391723 ?auto_391725 ) ) ( not ( = ?auto_391723 ?auto_391726 ) ) ( not ( = ?auto_391723 ?auto_391727 ) ) ( not ( = ?auto_391723 ?auto_391728 ) ) ( not ( = ?auto_391723 ?auto_391729 ) ) ( not ( = ?auto_391723 ?auto_391730 ) ) ( not ( = ?auto_391723 ?auto_391731 ) ) ( not ( = ?auto_391723 ?auto_391732 ) ) ( not ( = ?auto_391724 ?auto_391725 ) ) ( not ( = ?auto_391724 ?auto_391726 ) ) ( not ( = ?auto_391724 ?auto_391727 ) ) ( not ( = ?auto_391724 ?auto_391728 ) ) ( not ( = ?auto_391724 ?auto_391729 ) ) ( not ( = ?auto_391724 ?auto_391730 ) ) ( not ( = ?auto_391724 ?auto_391731 ) ) ( not ( = ?auto_391724 ?auto_391732 ) ) ( not ( = ?auto_391725 ?auto_391726 ) ) ( not ( = ?auto_391725 ?auto_391727 ) ) ( not ( = ?auto_391725 ?auto_391728 ) ) ( not ( = ?auto_391725 ?auto_391729 ) ) ( not ( = ?auto_391725 ?auto_391730 ) ) ( not ( = ?auto_391725 ?auto_391731 ) ) ( not ( = ?auto_391725 ?auto_391732 ) ) ( not ( = ?auto_391726 ?auto_391727 ) ) ( not ( = ?auto_391726 ?auto_391728 ) ) ( not ( = ?auto_391726 ?auto_391729 ) ) ( not ( = ?auto_391726 ?auto_391730 ) ) ( not ( = ?auto_391726 ?auto_391731 ) ) ( not ( = ?auto_391726 ?auto_391732 ) ) ( not ( = ?auto_391727 ?auto_391728 ) ) ( not ( = ?auto_391727 ?auto_391729 ) ) ( not ( = ?auto_391727 ?auto_391730 ) ) ( not ( = ?auto_391727 ?auto_391731 ) ) ( not ( = ?auto_391727 ?auto_391732 ) ) ( not ( = ?auto_391728 ?auto_391729 ) ) ( not ( = ?auto_391728 ?auto_391730 ) ) ( not ( = ?auto_391728 ?auto_391731 ) ) ( not ( = ?auto_391728 ?auto_391732 ) ) ( not ( = ?auto_391729 ?auto_391730 ) ) ( not ( = ?auto_391729 ?auto_391731 ) ) ( not ( = ?auto_391729 ?auto_391732 ) ) ( not ( = ?auto_391730 ?auto_391731 ) ) ( not ( = ?auto_391730 ?auto_391732 ) ) ( not ( = ?auto_391731 ?auto_391732 ) ) ( ON ?auto_391730 ?auto_391731 ) ( ON ?auto_391729 ?auto_391730 ) ( ON ?auto_391728 ?auto_391729 ) ( ON ?auto_391727 ?auto_391728 ) ( ON ?auto_391726 ?auto_391727 ) ( ON ?auto_391725 ?auto_391726 ) ( ON ?auto_391724 ?auto_391725 ) ( ON ?auto_391723 ?auto_391724 ) ( ON ?auto_391722 ?auto_391723 ) ( ON ?auto_391721 ?auto_391722 ) ( ON ?auto_391720 ?auto_391721 ) ( CLEAR ?auto_391718 ) ( ON ?auto_391719 ?auto_391720 ) ( CLEAR ?auto_391719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_391717 ?auto_391718 ?auto_391719 )
      ( MAKE-15PILE ?auto_391717 ?auto_391718 ?auto_391719 ?auto_391720 ?auto_391721 ?auto_391722 ?auto_391723 ?auto_391724 ?auto_391725 ?auto_391726 ?auto_391727 ?auto_391728 ?auto_391729 ?auto_391730 ?auto_391731 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391748 - BLOCK
      ?auto_391749 - BLOCK
      ?auto_391750 - BLOCK
      ?auto_391751 - BLOCK
      ?auto_391752 - BLOCK
      ?auto_391753 - BLOCK
      ?auto_391754 - BLOCK
      ?auto_391755 - BLOCK
      ?auto_391756 - BLOCK
      ?auto_391757 - BLOCK
      ?auto_391758 - BLOCK
      ?auto_391759 - BLOCK
      ?auto_391760 - BLOCK
      ?auto_391761 - BLOCK
      ?auto_391762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391762 ) ( ON-TABLE ?auto_391748 ) ( ON ?auto_391749 ?auto_391748 ) ( not ( = ?auto_391748 ?auto_391749 ) ) ( not ( = ?auto_391748 ?auto_391750 ) ) ( not ( = ?auto_391748 ?auto_391751 ) ) ( not ( = ?auto_391748 ?auto_391752 ) ) ( not ( = ?auto_391748 ?auto_391753 ) ) ( not ( = ?auto_391748 ?auto_391754 ) ) ( not ( = ?auto_391748 ?auto_391755 ) ) ( not ( = ?auto_391748 ?auto_391756 ) ) ( not ( = ?auto_391748 ?auto_391757 ) ) ( not ( = ?auto_391748 ?auto_391758 ) ) ( not ( = ?auto_391748 ?auto_391759 ) ) ( not ( = ?auto_391748 ?auto_391760 ) ) ( not ( = ?auto_391748 ?auto_391761 ) ) ( not ( = ?auto_391748 ?auto_391762 ) ) ( not ( = ?auto_391749 ?auto_391750 ) ) ( not ( = ?auto_391749 ?auto_391751 ) ) ( not ( = ?auto_391749 ?auto_391752 ) ) ( not ( = ?auto_391749 ?auto_391753 ) ) ( not ( = ?auto_391749 ?auto_391754 ) ) ( not ( = ?auto_391749 ?auto_391755 ) ) ( not ( = ?auto_391749 ?auto_391756 ) ) ( not ( = ?auto_391749 ?auto_391757 ) ) ( not ( = ?auto_391749 ?auto_391758 ) ) ( not ( = ?auto_391749 ?auto_391759 ) ) ( not ( = ?auto_391749 ?auto_391760 ) ) ( not ( = ?auto_391749 ?auto_391761 ) ) ( not ( = ?auto_391749 ?auto_391762 ) ) ( not ( = ?auto_391750 ?auto_391751 ) ) ( not ( = ?auto_391750 ?auto_391752 ) ) ( not ( = ?auto_391750 ?auto_391753 ) ) ( not ( = ?auto_391750 ?auto_391754 ) ) ( not ( = ?auto_391750 ?auto_391755 ) ) ( not ( = ?auto_391750 ?auto_391756 ) ) ( not ( = ?auto_391750 ?auto_391757 ) ) ( not ( = ?auto_391750 ?auto_391758 ) ) ( not ( = ?auto_391750 ?auto_391759 ) ) ( not ( = ?auto_391750 ?auto_391760 ) ) ( not ( = ?auto_391750 ?auto_391761 ) ) ( not ( = ?auto_391750 ?auto_391762 ) ) ( not ( = ?auto_391751 ?auto_391752 ) ) ( not ( = ?auto_391751 ?auto_391753 ) ) ( not ( = ?auto_391751 ?auto_391754 ) ) ( not ( = ?auto_391751 ?auto_391755 ) ) ( not ( = ?auto_391751 ?auto_391756 ) ) ( not ( = ?auto_391751 ?auto_391757 ) ) ( not ( = ?auto_391751 ?auto_391758 ) ) ( not ( = ?auto_391751 ?auto_391759 ) ) ( not ( = ?auto_391751 ?auto_391760 ) ) ( not ( = ?auto_391751 ?auto_391761 ) ) ( not ( = ?auto_391751 ?auto_391762 ) ) ( not ( = ?auto_391752 ?auto_391753 ) ) ( not ( = ?auto_391752 ?auto_391754 ) ) ( not ( = ?auto_391752 ?auto_391755 ) ) ( not ( = ?auto_391752 ?auto_391756 ) ) ( not ( = ?auto_391752 ?auto_391757 ) ) ( not ( = ?auto_391752 ?auto_391758 ) ) ( not ( = ?auto_391752 ?auto_391759 ) ) ( not ( = ?auto_391752 ?auto_391760 ) ) ( not ( = ?auto_391752 ?auto_391761 ) ) ( not ( = ?auto_391752 ?auto_391762 ) ) ( not ( = ?auto_391753 ?auto_391754 ) ) ( not ( = ?auto_391753 ?auto_391755 ) ) ( not ( = ?auto_391753 ?auto_391756 ) ) ( not ( = ?auto_391753 ?auto_391757 ) ) ( not ( = ?auto_391753 ?auto_391758 ) ) ( not ( = ?auto_391753 ?auto_391759 ) ) ( not ( = ?auto_391753 ?auto_391760 ) ) ( not ( = ?auto_391753 ?auto_391761 ) ) ( not ( = ?auto_391753 ?auto_391762 ) ) ( not ( = ?auto_391754 ?auto_391755 ) ) ( not ( = ?auto_391754 ?auto_391756 ) ) ( not ( = ?auto_391754 ?auto_391757 ) ) ( not ( = ?auto_391754 ?auto_391758 ) ) ( not ( = ?auto_391754 ?auto_391759 ) ) ( not ( = ?auto_391754 ?auto_391760 ) ) ( not ( = ?auto_391754 ?auto_391761 ) ) ( not ( = ?auto_391754 ?auto_391762 ) ) ( not ( = ?auto_391755 ?auto_391756 ) ) ( not ( = ?auto_391755 ?auto_391757 ) ) ( not ( = ?auto_391755 ?auto_391758 ) ) ( not ( = ?auto_391755 ?auto_391759 ) ) ( not ( = ?auto_391755 ?auto_391760 ) ) ( not ( = ?auto_391755 ?auto_391761 ) ) ( not ( = ?auto_391755 ?auto_391762 ) ) ( not ( = ?auto_391756 ?auto_391757 ) ) ( not ( = ?auto_391756 ?auto_391758 ) ) ( not ( = ?auto_391756 ?auto_391759 ) ) ( not ( = ?auto_391756 ?auto_391760 ) ) ( not ( = ?auto_391756 ?auto_391761 ) ) ( not ( = ?auto_391756 ?auto_391762 ) ) ( not ( = ?auto_391757 ?auto_391758 ) ) ( not ( = ?auto_391757 ?auto_391759 ) ) ( not ( = ?auto_391757 ?auto_391760 ) ) ( not ( = ?auto_391757 ?auto_391761 ) ) ( not ( = ?auto_391757 ?auto_391762 ) ) ( not ( = ?auto_391758 ?auto_391759 ) ) ( not ( = ?auto_391758 ?auto_391760 ) ) ( not ( = ?auto_391758 ?auto_391761 ) ) ( not ( = ?auto_391758 ?auto_391762 ) ) ( not ( = ?auto_391759 ?auto_391760 ) ) ( not ( = ?auto_391759 ?auto_391761 ) ) ( not ( = ?auto_391759 ?auto_391762 ) ) ( not ( = ?auto_391760 ?auto_391761 ) ) ( not ( = ?auto_391760 ?auto_391762 ) ) ( not ( = ?auto_391761 ?auto_391762 ) ) ( ON ?auto_391761 ?auto_391762 ) ( ON ?auto_391760 ?auto_391761 ) ( ON ?auto_391759 ?auto_391760 ) ( ON ?auto_391758 ?auto_391759 ) ( ON ?auto_391757 ?auto_391758 ) ( ON ?auto_391756 ?auto_391757 ) ( ON ?auto_391755 ?auto_391756 ) ( ON ?auto_391754 ?auto_391755 ) ( ON ?auto_391753 ?auto_391754 ) ( ON ?auto_391752 ?auto_391753 ) ( ON ?auto_391751 ?auto_391752 ) ( CLEAR ?auto_391749 ) ( ON ?auto_391750 ?auto_391751 ) ( CLEAR ?auto_391750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_391748 ?auto_391749 ?auto_391750 )
      ( MAKE-15PILE ?auto_391748 ?auto_391749 ?auto_391750 ?auto_391751 ?auto_391752 ?auto_391753 ?auto_391754 ?auto_391755 ?auto_391756 ?auto_391757 ?auto_391758 ?auto_391759 ?auto_391760 ?auto_391761 ?auto_391762 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391778 - BLOCK
      ?auto_391779 - BLOCK
      ?auto_391780 - BLOCK
      ?auto_391781 - BLOCK
      ?auto_391782 - BLOCK
      ?auto_391783 - BLOCK
      ?auto_391784 - BLOCK
      ?auto_391785 - BLOCK
      ?auto_391786 - BLOCK
      ?auto_391787 - BLOCK
      ?auto_391788 - BLOCK
      ?auto_391789 - BLOCK
      ?auto_391790 - BLOCK
      ?auto_391791 - BLOCK
      ?auto_391792 - BLOCK
    )
    :vars
    (
      ?auto_391793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391792 ?auto_391793 ) ( ON-TABLE ?auto_391778 ) ( not ( = ?auto_391778 ?auto_391779 ) ) ( not ( = ?auto_391778 ?auto_391780 ) ) ( not ( = ?auto_391778 ?auto_391781 ) ) ( not ( = ?auto_391778 ?auto_391782 ) ) ( not ( = ?auto_391778 ?auto_391783 ) ) ( not ( = ?auto_391778 ?auto_391784 ) ) ( not ( = ?auto_391778 ?auto_391785 ) ) ( not ( = ?auto_391778 ?auto_391786 ) ) ( not ( = ?auto_391778 ?auto_391787 ) ) ( not ( = ?auto_391778 ?auto_391788 ) ) ( not ( = ?auto_391778 ?auto_391789 ) ) ( not ( = ?auto_391778 ?auto_391790 ) ) ( not ( = ?auto_391778 ?auto_391791 ) ) ( not ( = ?auto_391778 ?auto_391792 ) ) ( not ( = ?auto_391778 ?auto_391793 ) ) ( not ( = ?auto_391779 ?auto_391780 ) ) ( not ( = ?auto_391779 ?auto_391781 ) ) ( not ( = ?auto_391779 ?auto_391782 ) ) ( not ( = ?auto_391779 ?auto_391783 ) ) ( not ( = ?auto_391779 ?auto_391784 ) ) ( not ( = ?auto_391779 ?auto_391785 ) ) ( not ( = ?auto_391779 ?auto_391786 ) ) ( not ( = ?auto_391779 ?auto_391787 ) ) ( not ( = ?auto_391779 ?auto_391788 ) ) ( not ( = ?auto_391779 ?auto_391789 ) ) ( not ( = ?auto_391779 ?auto_391790 ) ) ( not ( = ?auto_391779 ?auto_391791 ) ) ( not ( = ?auto_391779 ?auto_391792 ) ) ( not ( = ?auto_391779 ?auto_391793 ) ) ( not ( = ?auto_391780 ?auto_391781 ) ) ( not ( = ?auto_391780 ?auto_391782 ) ) ( not ( = ?auto_391780 ?auto_391783 ) ) ( not ( = ?auto_391780 ?auto_391784 ) ) ( not ( = ?auto_391780 ?auto_391785 ) ) ( not ( = ?auto_391780 ?auto_391786 ) ) ( not ( = ?auto_391780 ?auto_391787 ) ) ( not ( = ?auto_391780 ?auto_391788 ) ) ( not ( = ?auto_391780 ?auto_391789 ) ) ( not ( = ?auto_391780 ?auto_391790 ) ) ( not ( = ?auto_391780 ?auto_391791 ) ) ( not ( = ?auto_391780 ?auto_391792 ) ) ( not ( = ?auto_391780 ?auto_391793 ) ) ( not ( = ?auto_391781 ?auto_391782 ) ) ( not ( = ?auto_391781 ?auto_391783 ) ) ( not ( = ?auto_391781 ?auto_391784 ) ) ( not ( = ?auto_391781 ?auto_391785 ) ) ( not ( = ?auto_391781 ?auto_391786 ) ) ( not ( = ?auto_391781 ?auto_391787 ) ) ( not ( = ?auto_391781 ?auto_391788 ) ) ( not ( = ?auto_391781 ?auto_391789 ) ) ( not ( = ?auto_391781 ?auto_391790 ) ) ( not ( = ?auto_391781 ?auto_391791 ) ) ( not ( = ?auto_391781 ?auto_391792 ) ) ( not ( = ?auto_391781 ?auto_391793 ) ) ( not ( = ?auto_391782 ?auto_391783 ) ) ( not ( = ?auto_391782 ?auto_391784 ) ) ( not ( = ?auto_391782 ?auto_391785 ) ) ( not ( = ?auto_391782 ?auto_391786 ) ) ( not ( = ?auto_391782 ?auto_391787 ) ) ( not ( = ?auto_391782 ?auto_391788 ) ) ( not ( = ?auto_391782 ?auto_391789 ) ) ( not ( = ?auto_391782 ?auto_391790 ) ) ( not ( = ?auto_391782 ?auto_391791 ) ) ( not ( = ?auto_391782 ?auto_391792 ) ) ( not ( = ?auto_391782 ?auto_391793 ) ) ( not ( = ?auto_391783 ?auto_391784 ) ) ( not ( = ?auto_391783 ?auto_391785 ) ) ( not ( = ?auto_391783 ?auto_391786 ) ) ( not ( = ?auto_391783 ?auto_391787 ) ) ( not ( = ?auto_391783 ?auto_391788 ) ) ( not ( = ?auto_391783 ?auto_391789 ) ) ( not ( = ?auto_391783 ?auto_391790 ) ) ( not ( = ?auto_391783 ?auto_391791 ) ) ( not ( = ?auto_391783 ?auto_391792 ) ) ( not ( = ?auto_391783 ?auto_391793 ) ) ( not ( = ?auto_391784 ?auto_391785 ) ) ( not ( = ?auto_391784 ?auto_391786 ) ) ( not ( = ?auto_391784 ?auto_391787 ) ) ( not ( = ?auto_391784 ?auto_391788 ) ) ( not ( = ?auto_391784 ?auto_391789 ) ) ( not ( = ?auto_391784 ?auto_391790 ) ) ( not ( = ?auto_391784 ?auto_391791 ) ) ( not ( = ?auto_391784 ?auto_391792 ) ) ( not ( = ?auto_391784 ?auto_391793 ) ) ( not ( = ?auto_391785 ?auto_391786 ) ) ( not ( = ?auto_391785 ?auto_391787 ) ) ( not ( = ?auto_391785 ?auto_391788 ) ) ( not ( = ?auto_391785 ?auto_391789 ) ) ( not ( = ?auto_391785 ?auto_391790 ) ) ( not ( = ?auto_391785 ?auto_391791 ) ) ( not ( = ?auto_391785 ?auto_391792 ) ) ( not ( = ?auto_391785 ?auto_391793 ) ) ( not ( = ?auto_391786 ?auto_391787 ) ) ( not ( = ?auto_391786 ?auto_391788 ) ) ( not ( = ?auto_391786 ?auto_391789 ) ) ( not ( = ?auto_391786 ?auto_391790 ) ) ( not ( = ?auto_391786 ?auto_391791 ) ) ( not ( = ?auto_391786 ?auto_391792 ) ) ( not ( = ?auto_391786 ?auto_391793 ) ) ( not ( = ?auto_391787 ?auto_391788 ) ) ( not ( = ?auto_391787 ?auto_391789 ) ) ( not ( = ?auto_391787 ?auto_391790 ) ) ( not ( = ?auto_391787 ?auto_391791 ) ) ( not ( = ?auto_391787 ?auto_391792 ) ) ( not ( = ?auto_391787 ?auto_391793 ) ) ( not ( = ?auto_391788 ?auto_391789 ) ) ( not ( = ?auto_391788 ?auto_391790 ) ) ( not ( = ?auto_391788 ?auto_391791 ) ) ( not ( = ?auto_391788 ?auto_391792 ) ) ( not ( = ?auto_391788 ?auto_391793 ) ) ( not ( = ?auto_391789 ?auto_391790 ) ) ( not ( = ?auto_391789 ?auto_391791 ) ) ( not ( = ?auto_391789 ?auto_391792 ) ) ( not ( = ?auto_391789 ?auto_391793 ) ) ( not ( = ?auto_391790 ?auto_391791 ) ) ( not ( = ?auto_391790 ?auto_391792 ) ) ( not ( = ?auto_391790 ?auto_391793 ) ) ( not ( = ?auto_391791 ?auto_391792 ) ) ( not ( = ?auto_391791 ?auto_391793 ) ) ( not ( = ?auto_391792 ?auto_391793 ) ) ( ON ?auto_391791 ?auto_391792 ) ( ON ?auto_391790 ?auto_391791 ) ( ON ?auto_391789 ?auto_391790 ) ( ON ?auto_391788 ?auto_391789 ) ( ON ?auto_391787 ?auto_391788 ) ( ON ?auto_391786 ?auto_391787 ) ( ON ?auto_391785 ?auto_391786 ) ( ON ?auto_391784 ?auto_391785 ) ( ON ?auto_391783 ?auto_391784 ) ( ON ?auto_391782 ?auto_391783 ) ( ON ?auto_391781 ?auto_391782 ) ( ON ?auto_391780 ?auto_391781 ) ( CLEAR ?auto_391778 ) ( ON ?auto_391779 ?auto_391780 ) ( CLEAR ?auto_391779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391778 ?auto_391779 )
      ( MAKE-15PILE ?auto_391778 ?auto_391779 ?auto_391780 ?auto_391781 ?auto_391782 ?auto_391783 ?auto_391784 ?auto_391785 ?auto_391786 ?auto_391787 ?auto_391788 ?auto_391789 ?auto_391790 ?auto_391791 ?auto_391792 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391809 - BLOCK
      ?auto_391810 - BLOCK
      ?auto_391811 - BLOCK
      ?auto_391812 - BLOCK
      ?auto_391813 - BLOCK
      ?auto_391814 - BLOCK
      ?auto_391815 - BLOCK
      ?auto_391816 - BLOCK
      ?auto_391817 - BLOCK
      ?auto_391818 - BLOCK
      ?auto_391819 - BLOCK
      ?auto_391820 - BLOCK
      ?auto_391821 - BLOCK
      ?auto_391822 - BLOCK
      ?auto_391823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391823 ) ( ON-TABLE ?auto_391809 ) ( not ( = ?auto_391809 ?auto_391810 ) ) ( not ( = ?auto_391809 ?auto_391811 ) ) ( not ( = ?auto_391809 ?auto_391812 ) ) ( not ( = ?auto_391809 ?auto_391813 ) ) ( not ( = ?auto_391809 ?auto_391814 ) ) ( not ( = ?auto_391809 ?auto_391815 ) ) ( not ( = ?auto_391809 ?auto_391816 ) ) ( not ( = ?auto_391809 ?auto_391817 ) ) ( not ( = ?auto_391809 ?auto_391818 ) ) ( not ( = ?auto_391809 ?auto_391819 ) ) ( not ( = ?auto_391809 ?auto_391820 ) ) ( not ( = ?auto_391809 ?auto_391821 ) ) ( not ( = ?auto_391809 ?auto_391822 ) ) ( not ( = ?auto_391809 ?auto_391823 ) ) ( not ( = ?auto_391810 ?auto_391811 ) ) ( not ( = ?auto_391810 ?auto_391812 ) ) ( not ( = ?auto_391810 ?auto_391813 ) ) ( not ( = ?auto_391810 ?auto_391814 ) ) ( not ( = ?auto_391810 ?auto_391815 ) ) ( not ( = ?auto_391810 ?auto_391816 ) ) ( not ( = ?auto_391810 ?auto_391817 ) ) ( not ( = ?auto_391810 ?auto_391818 ) ) ( not ( = ?auto_391810 ?auto_391819 ) ) ( not ( = ?auto_391810 ?auto_391820 ) ) ( not ( = ?auto_391810 ?auto_391821 ) ) ( not ( = ?auto_391810 ?auto_391822 ) ) ( not ( = ?auto_391810 ?auto_391823 ) ) ( not ( = ?auto_391811 ?auto_391812 ) ) ( not ( = ?auto_391811 ?auto_391813 ) ) ( not ( = ?auto_391811 ?auto_391814 ) ) ( not ( = ?auto_391811 ?auto_391815 ) ) ( not ( = ?auto_391811 ?auto_391816 ) ) ( not ( = ?auto_391811 ?auto_391817 ) ) ( not ( = ?auto_391811 ?auto_391818 ) ) ( not ( = ?auto_391811 ?auto_391819 ) ) ( not ( = ?auto_391811 ?auto_391820 ) ) ( not ( = ?auto_391811 ?auto_391821 ) ) ( not ( = ?auto_391811 ?auto_391822 ) ) ( not ( = ?auto_391811 ?auto_391823 ) ) ( not ( = ?auto_391812 ?auto_391813 ) ) ( not ( = ?auto_391812 ?auto_391814 ) ) ( not ( = ?auto_391812 ?auto_391815 ) ) ( not ( = ?auto_391812 ?auto_391816 ) ) ( not ( = ?auto_391812 ?auto_391817 ) ) ( not ( = ?auto_391812 ?auto_391818 ) ) ( not ( = ?auto_391812 ?auto_391819 ) ) ( not ( = ?auto_391812 ?auto_391820 ) ) ( not ( = ?auto_391812 ?auto_391821 ) ) ( not ( = ?auto_391812 ?auto_391822 ) ) ( not ( = ?auto_391812 ?auto_391823 ) ) ( not ( = ?auto_391813 ?auto_391814 ) ) ( not ( = ?auto_391813 ?auto_391815 ) ) ( not ( = ?auto_391813 ?auto_391816 ) ) ( not ( = ?auto_391813 ?auto_391817 ) ) ( not ( = ?auto_391813 ?auto_391818 ) ) ( not ( = ?auto_391813 ?auto_391819 ) ) ( not ( = ?auto_391813 ?auto_391820 ) ) ( not ( = ?auto_391813 ?auto_391821 ) ) ( not ( = ?auto_391813 ?auto_391822 ) ) ( not ( = ?auto_391813 ?auto_391823 ) ) ( not ( = ?auto_391814 ?auto_391815 ) ) ( not ( = ?auto_391814 ?auto_391816 ) ) ( not ( = ?auto_391814 ?auto_391817 ) ) ( not ( = ?auto_391814 ?auto_391818 ) ) ( not ( = ?auto_391814 ?auto_391819 ) ) ( not ( = ?auto_391814 ?auto_391820 ) ) ( not ( = ?auto_391814 ?auto_391821 ) ) ( not ( = ?auto_391814 ?auto_391822 ) ) ( not ( = ?auto_391814 ?auto_391823 ) ) ( not ( = ?auto_391815 ?auto_391816 ) ) ( not ( = ?auto_391815 ?auto_391817 ) ) ( not ( = ?auto_391815 ?auto_391818 ) ) ( not ( = ?auto_391815 ?auto_391819 ) ) ( not ( = ?auto_391815 ?auto_391820 ) ) ( not ( = ?auto_391815 ?auto_391821 ) ) ( not ( = ?auto_391815 ?auto_391822 ) ) ( not ( = ?auto_391815 ?auto_391823 ) ) ( not ( = ?auto_391816 ?auto_391817 ) ) ( not ( = ?auto_391816 ?auto_391818 ) ) ( not ( = ?auto_391816 ?auto_391819 ) ) ( not ( = ?auto_391816 ?auto_391820 ) ) ( not ( = ?auto_391816 ?auto_391821 ) ) ( not ( = ?auto_391816 ?auto_391822 ) ) ( not ( = ?auto_391816 ?auto_391823 ) ) ( not ( = ?auto_391817 ?auto_391818 ) ) ( not ( = ?auto_391817 ?auto_391819 ) ) ( not ( = ?auto_391817 ?auto_391820 ) ) ( not ( = ?auto_391817 ?auto_391821 ) ) ( not ( = ?auto_391817 ?auto_391822 ) ) ( not ( = ?auto_391817 ?auto_391823 ) ) ( not ( = ?auto_391818 ?auto_391819 ) ) ( not ( = ?auto_391818 ?auto_391820 ) ) ( not ( = ?auto_391818 ?auto_391821 ) ) ( not ( = ?auto_391818 ?auto_391822 ) ) ( not ( = ?auto_391818 ?auto_391823 ) ) ( not ( = ?auto_391819 ?auto_391820 ) ) ( not ( = ?auto_391819 ?auto_391821 ) ) ( not ( = ?auto_391819 ?auto_391822 ) ) ( not ( = ?auto_391819 ?auto_391823 ) ) ( not ( = ?auto_391820 ?auto_391821 ) ) ( not ( = ?auto_391820 ?auto_391822 ) ) ( not ( = ?auto_391820 ?auto_391823 ) ) ( not ( = ?auto_391821 ?auto_391822 ) ) ( not ( = ?auto_391821 ?auto_391823 ) ) ( not ( = ?auto_391822 ?auto_391823 ) ) ( ON ?auto_391822 ?auto_391823 ) ( ON ?auto_391821 ?auto_391822 ) ( ON ?auto_391820 ?auto_391821 ) ( ON ?auto_391819 ?auto_391820 ) ( ON ?auto_391818 ?auto_391819 ) ( ON ?auto_391817 ?auto_391818 ) ( ON ?auto_391816 ?auto_391817 ) ( ON ?auto_391815 ?auto_391816 ) ( ON ?auto_391814 ?auto_391815 ) ( ON ?auto_391813 ?auto_391814 ) ( ON ?auto_391812 ?auto_391813 ) ( ON ?auto_391811 ?auto_391812 ) ( CLEAR ?auto_391809 ) ( ON ?auto_391810 ?auto_391811 ) ( CLEAR ?auto_391810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_391809 ?auto_391810 )
      ( MAKE-15PILE ?auto_391809 ?auto_391810 ?auto_391811 ?auto_391812 ?auto_391813 ?auto_391814 ?auto_391815 ?auto_391816 ?auto_391817 ?auto_391818 ?auto_391819 ?auto_391820 ?auto_391821 ?auto_391822 ?auto_391823 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391839 - BLOCK
      ?auto_391840 - BLOCK
      ?auto_391841 - BLOCK
      ?auto_391842 - BLOCK
      ?auto_391843 - BLOCK
      ?auto_391844 - BLOCK
      ?auto_391845 - BLOCK
      ?auto_391846 - BLOCK
      ?auto_391847 - BLOCK
      ?auto_391848 - BLOCK
      ?auto_391849 - BLOCK
      ?auto_391850 - BLOCK
      ?auto_391851 - BLOCK
      ?auto_391852 - BLOCK
      ?auto_391853 - BLOCK
    )
    :vars
    (
      ?auto_391854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_391853 ?auto_391854 ) ( not ( = ?auto_391839 ?auto_391840 ) ) ( not ( = ?auto_391839 ?auto_391841 ) ) ( not ( = ?auto_391839 ?auto_391842 ) ) ( not ( = ?auto_391839 ?auto_391843 ) ) ( not ( = ?auto_391839 ?auto_391844 ) ) ( not ( = ?auto_391839 ?auto_391845 ) ) ( not ( = ?auto_391839 ?auto_391846 ) ) ( not ( = ?auto_391839 ?auto_391847 ) ) ( not ( = ?auto_391839 ?auto_391848 ) ) ( not ( = ?auto_391839 ?auto_391849 ) ) ( not ( = ?auto_391839 ?auto_391850 ) ) ( not ( = ?auto_391839 ?auto_391851 ) ) ( not ( = ?auto_391839 ?auto_391852 ) ) ( not ( = ?auto_391839 ?auto_391853 ) ) ( not ( = ?auto_391839 ?auto_391854 ) ) ( not ( = ?auto_391840 ?auto_391841 ) ) ( not ( = ?auto_391840 ?auto_391842 ) ) ( not ( = ?auto_391840 ?auto_391843 ) ) ( not ( = ?auto_391840 ?auto_391844 ) ) ( not ( = ?auto_391840 ?auto_391845 ) ) ( not ( = ?auto_391840 ?auto_391846 ) ) ( not ( = ?auto_391840 ?auto_391847 ) ) ( not ( = ?auto_391840 ?auto_391848 ) ) ( not ( = ?auto_391840 ?auto_391849 ) ) ( not ( = ?auto_391840 ?auto_391850 ) ) ( not ( = ?auto_391840 ?auto_391851 ) ) ( not ( = ?auto_391840 ?auto_391852 ) ) ( not ( = ?auto_391840 ?auto_391853 ) ) ( not ( = ?auto_391840 ?auto_391854 ) ) ( not ( = ?auto_391841 ?auto_391842 ) ) ( not ( = ?auto_391841 ?auto_391843 ) ) ( not ( = ?auto_391841 ?auto_391844 ) ) ( not ( = ?auto_391841 ?auto_391845 ) ) ( not ( = ?auto_391841 ?auto_391846 ) ) ( not ( = ?auto_391841 ?auto_391847 ) ) ( not ( = ?auto_391841 ?auto_391848 ) ) ( not ( = ?auto_391841 ?auto_391849 ) ) ( not ( = ?auto_391841 ?auto_391850 ) ) ( not ( = ?auto_391841 ?auto_391851 ) ) ( not ( = ?auto_391841 ?auto_391852 ) ) ( not ( = ?auto_391841 ?auto_391853 ) ) ( not ( = ?auto_391841 ?auto_391854 ) ) ( not ( = ?auto_391842 ?auto_391843 ) ) ( not ( = ?auto_391842 ?auto_391844 ) ) ( not ( = ?auto_391842 ?auto_391845 ) ) ( not ( = ?auto_391842 ?auto_391846 ) ) ( not ( = ?auto_391842 ?auto_391847 ) ) ( not ( = ?auto_391842 ?auto_391848 ) ) ( not ( = ?auto_391842 ?auto_391849 ) ) ( not ( = ?auto_391842 ?auto_391850 ) ) ( not ( = ?auto_391842 ?auto_391851 ) ) ( not ( = ?auto_391842 ?auto_391852 ) ) ( not ( = ?auto_391842 ?auto_391853 ) ) ( not ( = ?auto_391842 ?auto_391854 ) ) ( not ( = ?auto_391843 ?auto_391844 ) ) ( not ( = ?auto_391843 ?auto_391845 ) ) ( not ( = ?auto_391843 ?auto_391846 ) ) ( not ( = ?auto_391843 ?auto_391847 ) ) ( not ( = ?auto_391843 ?auto_391848 ) ) ( not ( = ?auto_391843 ?auto_391849 ) ) ( not ( = ?auto_391843 ?auto_391850 ) ) ( not ( = ?auto_391843 ?auto_391851 ) ) ( not ( = ?auto_391843 ?auto_391852 ) ) ( not ( = ?auto_391843 ?auto_391853 ) ) ( not ( = ?auto_391843 ?auto_391854 ) ) ( not ( = ?auto_391844 ?auto_391845 ) ) ( not ( = ?auto_391844 ?auto_391846 ) ) ( not ( = ?auto_391844 ?auto_391847 ) ) ( not ( = ?auto_391844 ?auto_391848 ) ) ( not ( = ?auto_391844 ?auto_391849 ) ) ( not ( = ?auto_391844 ?auto_391850 ) ) ( not ( = ?auto_391844 ?auto_391851 ) ) ( not ( = ?auto_391844 ?auto_391852 ) ) ( not ( = ?auto_391844 ?auto_391853 ) ) ( not ( = ?auto_391844 ?auto_391854 ) ) ( not ( = ?auto_391845 ?auto_391846 ) ) ( not ( = ?auto_391845 ?auto_391847 ) ) ( not ( = ?auto_391845 ?auto_391848 ) ) ( not ( = ?auto_391845 ?auto_391849 ) ) ( not ( = ?auto_391845 ?auto_391850 ) ) ( not ( = ?auto_391845 ?auto_391851 ) ) ( not ( = ?auto_391845 ?auto_391852 ) ) ( not ( = ?auto_391845 ?auto_391853 ) ) ( not ( = ?auto_391845 ?auto_391854 ) ) ( not ( = ?auto_391846 ?auto_391847 ) ) ( not ( = ?auto_391846 ?auto_391848 ) ) ( not ( = ?auto_391846 ?auto_391849 ) ) ( not ( = ?auto_391846 ?auto_391850 ) ) ( not ( = ?auto_391846 ?auto_391851 ) ) ( not ( = ?auto_391846 ?auto_391852 ) ) ( not ( = ?auto_391846 ?auto_391853 ) ) ( not ( = ?auto_391846 ?auto_391854 ) ) ( not ( = ?auto_391847 ?auto_391848 ) ) ( not ( = ?auto_391847 ?auto_391849 ) ) ( not ( = ?auto_391847 ?auto_391850 ) ) ( not ( = ?auto_391847 ?auto_391851 ) ) ( not ( = ?auto_391847 ?auto_391852 ) ) ( not ( = ?auto_391847 ?auto_391853 ) ) ( not ( = ?auto_391847 ?auto_391854 ) ) ( not ( = ?auto_391848 ?auto_391849 ) ) ( not ( = ?auto_391848 ?auto_391850 ) ) ( not ( = ?auto_391848 ?auto_391851 ) ) ( not ( = ?auto_391848 ?auto_391852 ) ) ( not ( = ?auto_391848 ?auto_391853 ) ) ( not ( = ?auto_391848 ?auto_391854 ) ) ( not ( = ?auto_391849 ?auto_391850 ) ) ( not ( = ?auto_391849 ?auto_391851 ) ) ( not ( = ?auto_391849 ?auto_391852 ) ) ( not ( = ?auto_391849 ?auto_391853 ) ) ( not ( = ?auto_391849 ?auto_391854 ) ) ( not ( = ?auto_391850 ?auto_391851 ) ) ( not ( = ?auto_391850 ?auto_391852 ) ) ( not ( = ?auto_391850 ?auto_391853 ) ) ( not ( = ?auto_391850 ?auto_391854 ) ) ( not ( = ?auto_391851 ?auto_391852 ) ) ( not ( = ?auto_391851 ?auto_391853 ) ) ( not ( = ?auto_391851 ?auto_391854 ) ) ( not ( = ?auto_391852 ?auto_391853 ) ) ( not ( = ?auto_391852 ?auto_391854 ) ) ( not ( = ?auto_391853 ?auto_391854 ) ) ( ON ?auto_391852 ?auto_391853 ) ( ON ?auto_391851 ?auto_391852 ) ( ON ?auto_391850 ?auto_391851 ) ( ON ?auto_391849 ?auto_391850 ) ( ON ?auto_391848 ?auto_391849 ) ( ON ?auto_391847 ?auto_391848 ) ( ON ?auto_391846 ?auto_391847 ) ( ON ?auto_391845 ?auto_391846 ) ( ON ?auto_391844 ?auto_391845 ) ( ON ?auto_391843 ?auto_391844 ) ( ON ?auto_391842 ?auto_391843 ) ( ON ?auto_391841 ?auto_391842 ) ( ON ?auto_391840 ?auto_391841 ) ( ON ?auto_391839 ?auto_391840 ) ( CLEAR ?auto_391839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391839 )
      ( MAKE-15PILE ?auto_391839 ?auto_391840 ?auto_391841 ?auto_391842 ?auto_391843 ?auto_391844 ?auto_391845 ?auto_391846 ?auto_391847 ?auto_391848 ?auto_391849 ?auto_391850 ?auto_391851 ?auto_391852 ?auto_391853 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391870 - BLOCK
      ?auto_391871 - BLOCK
      ?auto_391872 - BLOCK
      ?auto_391873 - BLOCK
      ?auto_391874 - BLOCK
      ?auto_391875 - BLOCK
      ?auto_391876 - BLOCK
      ?auto_391877 - BLOCK
      ?auto_391878 - BLOCK
      ?auto_391879 - BLOCK
      ?auto_391880 - BLOCK
      ?auto_391881 - BLOCK
      ?auto_391882 - BLOCK
      ?auto_391883 - BLOCK
      ?auto_391884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_391884 ) ( not ( = ?auto_391870 ?auto_391871 ) ) ( not ( = ?auto_391870 ?auto_391872 ) ) ( not ( = ?auto_391870 ?auto_391873 ) ) ( not ( = ?auto_391870 ?auto_391874 ) ) ( not ( = ?auto_391870 ?auto_391875 ) ) ( not ( = ?auto_391870 ?auto_391876 ) ) ( not ( = ?auto_391870 ?auto_391877 ) ) ( not ( = ?auto_391870 ?auto_391878 ) ) ( not ( = ?auto_391870 ?auto_391879 ) ) ( not ( = ?auto_391870 ?auto_391880 ) ) ( not ( = ?auto_391870 ?auto_391881 ) ) ( not ( = ?auto_391870 ?auto_391882 ) ) ( not ( = ?auto_391870 ?auto_391883 ) ) ( not ( = ?auto_391870 ?auto_391884 ) ) ( not ( = ?auto_391871 ?auto_391872 ) ) ( not ( = ?auto_391871 ?auto_391873 ) ) ( not ( = ?auto_391871 ?auto_391874 ) ) ( not ( = ?auto_391871 ?auto_391875 ) ) ( not ( = ?auto_391871 ?auto_391876 ) ) ( not ( = ?auto_391871 ?auto_391877 ) ) ( not ( = ?auto_391871 ?auto_391878 ) ) ( not ( = ?auto_391871 ?auto_391879 ) ) ( not ( = ?auto_391871 ?auto_391880 ) ) ( not ( = ?auto_391871 ?auto_391881 ) ) ( not ( = ?auto_391871 ?auto_391882 ) ) ( not ( = ?auto_391871 ?auto_391883 ) ) ( not ( = ?auto_391871 ?auto_391884 ) ) ( not ( = ?auto_391872 ?auto_391873 ) ) ( not ( = ?auto_391872 ?auto_391874 ) ) ( not ( = ?auto_391872 ?auto_391875 ) ) ( not ( = ?auto_391872 ?auto_391876 ) ) ( not ( = ?auto_391872 ?auto_391877 ) ) ( not ( = ?auto_391872 ?auto_391878 ) ) ( not ( = ?auto_391872 ?auto_391879 ) ) ( not ( = ?auto_391872 ?auto_391880 ) ) ( not ( = ?auto_391872 ?auto_391881 ) ) ( not ( = ?auto_391872 ?auto_391882 ) ) ( not ( = ?auto_391872 ?auto_391883 ) ) ( not ( = ?auto_391872 ?auto_391884 ) ) ( not ( = ?auto_391873 ?auto_391874 ) ) ( not ( = ?auto_391873 ?auto_391875 ) ) ( not ( = ?auto_391873 ?auto_391876 ) ) ( not ( = ?auto_391873 ?auto_391877 ) ) ( not ( = ?auto_391873 ?auto_391878 ) ) ( not ( = ?auto_391873 ?auto_391879 ) ) ( not ( = ?auto_391873 ?auto_391880 ) ) ( not ( = ?auto_391873 ?auto_391881 ) ) ( not ( = ?auto_391873 ?auto_391882 ) ) ( not ( = ?auto_391873 ?auto_391883 ) ) ( not ( = ?auto_391873 ?auto_391884 ) ) ( not ( = ?auto_391874 ?auto_391875 ) ) ( not ( = ?auto_391874 ?auto_391876 ) ) ( not ( = ?auto_391874 ?auto_391877 ) ) ( not ( = ?auto_391874 ?auto_391878 ) ) ( not ( = ?auto_391874 ?auto_391879 ) ) ( not ( = ?auto_391874 ?auto_391880 ) ) ( not ( = ?auto_391874 ?auto_391881 ) ) ( not ( = ?auto_391874 ?auto_391882 ) ) ( not ( = ?auto_391874 ?auto_391883 ) ) ( not ( = ?auto_391874 ?auto_391884 ) ) ( not ( = ?auto_391875 ?auto_391876 ) ) ( not ( = ?auto_391875 ?auto_391877 ) ) ( not ( = ?auto_391875 ?auto_391878 ) ) ( not ( = ?auto_391875 ?auto_391879 ) ) ( not ( = ?auto_391875 ?auto_391880 ) ) ( not ( = ?auto_391875 ?auto_391881 ) ) ( not ( = ?auto_391875 ?auto_391882 ) ) ( not ( = ?auto_391875 ?auto_391883 ) ) ( not ( = ?auto_391875 ?auto_391884 ) ) ( not ( = ?auto_391876 ?auto_391877 ) ) ( not ( = ?auto_391876 ?auto_391878 ) ) ( not ( = ?auto_391876 ?auto_391879 ) ) ( not ( = ?auto_391876 ?auto_391880 ) ) ( not ( = ?auto_391876 ?auto_391881 ) ) ( not ( = ?auto_391876 ?auto_391882 ) ) ( not ( = ?auto_391876 ?auto_391883 ) ) ( not ( = ?auto_391876 ?auto_391884 ) ) ( not ( = ?auto_391877 ?auto_391878 ) ) ( not ( = ?auto_391877 ?auto_391879 ) ) ( not ( = ?auto_391877 ?auto_391880 ) ) ( not ( = ?auto_391877 ?auto_391881 ) ) ( not ( = ?auto_391877 ?auto_391882 ) ) ( not ( = ?auto_391877 ?auto_391883 ) ) ( not ( = ?auto_391877 ?auto_391884 ) ) ( not ( = ?auto_391878 ?auto_391879 ) ) ( not ( = ?auto_391878 ?auto_391880 ) ) ( not ( = ?auto_391878 ?auto_391881 ) ) ( not ( = ?auto_391878 ?auto_391882 ) ) ( not ( = ?auto_391878 ?auto_391883 ) ) ( not ( = ?auto_391878 ?auto_391884 ) ) ( not ( = ?auto_391879 ?auto_391880 ) ) ( not ( = ?auto_391879 ?auto_391881 ) ) ( not ( = ?auto_391879 ?auto_391882 ) ) ( not ( = ?auto_391879 ?auto_391883 ) ) ( not ( = ?auto_391879 ?auto_391884 ) ) ( not ( = ?auto_391880 ?auto_391881 ) ) ( not ( = ?auto_391880 ?auto_391882 ) ) ( not ( = ?auto_391880 ?auto_391883 ) ) ( not ( = ?auto_391880 ?auto_391884 ) ) ( not ( = ?auto_391881 ?auto_391882 ) ) ( not ( = ?auto_391881 ?auto_391883 ) ) ( not ( = ?auto_391881 ?auto_391884 ) ) ( not ( = ?auto_391882 ?auto_391883 ) ) ( not ( = ?auto_391882 ?auto_391884 ) ) ( not ( = ?auto_391883 ?auto_391884 ) ) ( ON ?auto_391883 ?auto_391884 ) ( ON ?auto_391882 ?auto_391883 ) ( ON ?auto_391881 ?auto_391882 ) ( ON ?auto_391880 ?auto_391881 ) ( ON ?auto_391879 ?auto_391880 ) ( ON ?auto_391878 ?auto_391879 ) ( ON ?auto_391877 ?auto_391878 ) ( ON ?auto_391876 ?auto_391877 ) ( ON ?auto_391875 ?auto_391876 ) ( ON ?auto_391874 ?auto_391875 ) ( ON ?auto_391873 ?auto_391874 ) ( ON ?auto_391872 ?auto_391873 ) ( ON ?auto_391871 ?auto_391872 ) ( ON ?auto_391870 ?auto_391871 ) ( CLEAR ?auto_391870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_391870 )
      ( MAKE-15PILE ?auto_391870 ?auto_391871 ?auto_391872 ?auto_391873 ?auto_391874 ?auto_391875 ?auto_391876 ?auto_391877 ?auto_391878 ?auto_391879 ?auto_391880 ?auto_391881 ?auto_391882 ?auto_391883 ?auto_391884 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_391900 - BLOCK
      ?auto_391901 - BLOCK
      ?auto_391902 - BLOCK
      ?auto_391903 - BLOCK
      ?auto_391904 - BLOCK
      ?auto_391905 - BLOCK
      ?auto_391906 - BLOCK
      ?auto_391907 - BLOCK
      ?auto_391908 - BLOCK
      ?auto_391909 - BLOCK
      ?auto_391910 - BLOCK
      ?auto_391911 - BLOCK
      ?auto_391912 - BLOCK
      ?auto_391913 - BLOCK
      ?auto_391914 - BLOCK
    )
    :vars
    (
      ?auto_391915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_391900 ?auto_391901 ) ) ( not ( = ?auto_391900 ?auto_391902 ) ) ( not ( = ?auto_391900 ?auto_391903 ) ) ( not ( = ?auto_391900 ?auto_391904 ) ) ( not ( = ?auto_391900 ?auto_391905 ) ) ( not ( = ?auto_391900 ?auto_391906 ) ) ( not ( = ?auto_391900 ?auto_391907 ) ) ( not ( = ?auto_391900 ?auto_391908 ) ) ( not ( = ?auto_391900 ?auto_391909 ) ) ( not ( = ?auto_391900 ?auto_391910 ) ) ( not ( = ?auto_391900 ?auto_391911 ) ) ( not ( = ?auto_391900 ?auto_391912 ) ) ( not ( = ?auto_391900 ?auto_391913 ) ) ( not ( = ?auto_391900 ?auto_391914 ) ) ( not ( = ?auto_391901 ?auto_391902 ) ) ( not ( = ?auto_391901 ?auto_391903 ) ) ( not ( = ?auto_391901 ?auto_391904 ) ) ( not ( = ?auto_391901 ?auto_391905 ) ) ( not ( = ?auto_391901 ?auto_391906 ) ) ( not ( = ?auto_391901 ?auto_391907 ) ) ( not ( = ?auto_391901 ?auto_391908 ) ) ( not ( = ?auto_391901 ?auto_391909 ) ) ( not ( = ?auto_391901 ?auto_391910 ) ) ( not ( = ?auto_391901 ?auto_391911 ) ) ( not ( = ?auto_391901 ?auto_391912 ) ) ( not ( = ?auto_391901 ?auto_391913 ) ) ( not ( = ?auto_391901 ?auto_391914 ) ) ( not ( = ?auto_391902 ?auto_391903 ) ) ( not ( = ?auto_391902 ?auto_391904 ) ) ( not ( = ?auto_391902 ?auto_391905 ) ) ( not ( = ?auto_391902 ?auto_391906 ) ) ( not ( = ?auto_391902 ?auto_391907 ) ) ( not ( = ?auto_391902 ?auto_391908 ) ) ( not ( = ?auto_391902 ?auto_391909 ) ) ( not ( = ?auto_391902 ?auto_391910 ) ) ( not ( = ?auto_391902 ?auto_391911 ) ) ( not ( = ?auto_391902 ?auto_391912 ) ) ( not ( = ?auto_391902 ?auto_391913 ) ) ( not ( = ?auto_391902 ?auto_391914 ) ) ( not ( = ?auto_391903 ?auto_391904 ) ) ( not ( = ?auto_391903 ?auto_391905 ) ) ( not ( = ?auto_391903 ?auto_391906 ) ) ( not ( = ?auto_391903 ?auto_391907 ) ) ( not ( = ?auto_391903 ?auto_391908 ) ) ( not ( = ?auto_391903 ?auto_391909 ) ) ( not ( = ?auto_391903 ?auto_391910 ) ) ( not ( = ?auto_391903 ?auto_391911 ) ) ( not ( = ?auto_391903 ?auto_391912 ) ) ( not ( = ?auto_391903 ?auto_391913 ) ) ( not ( = ?auto_391903 ?auto_391914 ) ) ( not ( = ?auto_391904 ?auto_391905 ) ) ( not ( = ?auto_391904 ?auto_391906 ) ) ( not ( = ?auto_391904 ?auto_391907 ) ) ( not ( = ?auto_391904 ?auto_391908 ) ) ( not ( = ?auto_391904 ?auto_391909 ) ) ( not ( = ?auto_391904 ?auto_391910 ) ) ( not ( = ?auto_391904 ?auto_391911 ) ) ( not ( = ?auto_391904 ?auto_391912 ) ) ( not ( = ?auto_391904 ?auto_391913 ) ) ( not ( = ?auto_391904 ?auto_391914 ) ) ( not ( = ?auto_391905 ?auto_391906 ) ) ( not ( = ?auto_391905 ?auto_391907 ) ) ( not ( = ?auto_391905 ?auto_391908 ) ) ( not ( = ?auto_391905 ?auto_391909 ) ) ( not ( = ?auto_391905 ?auto_391910 ) ) ( not ( = ?auto_391905 ?auto_391911 ) ) ( not ( = ?auto_391905 ?auto_391912 ) ) ( not ( = ?auto_391905 ?auto_391913 ) ) ( not ( = ?auto_391905 ?auto_391914 ) ) ( not ( = ?auto_391906 ?auto_391907 ) ) ( not ( = ?auto_391906 ?auto_391908 ) ) ( not ( = ?auto_391906 ?auto_391909 ) ) ( not ( = ?auto_391906 ?auto_391910 ) ) ( not ( = ?auto_391906 ?auto_391911 ) ) ( not ( = ?auto_391906 ?auto_391912 ) ) ( not ( = ?auto_391906 ?auto_391913 ) ) ( not ( = ?auto_391906 ?auto_391914 ) ) ( not ( = ?auto_391907 ?auto_391908 ) ) ( not ( = ?auto_391907 ?auto_391909 ) ) ( not ( = ?auto_391907 ?auto_391910 ) ) ( not ( = ?auto_391907 ?auto_391911 ) ) ( not ( = ?auto_391907 ?auto_391912 ) ) ( not ( = ?auto_391907 ?auto_391913 ) ) ( not ( = ?auto_391907 ?auto_391914 ) ) ( not ( = ?auto_391908 ?auto_391909 ) ) ( not ( = ?auto_391908 ?auto_391910 ) ) ( not ( = ?auto_391908 ?auto_391911 ) ) ( not ( = ?auto_391908 ?auto_391912 ) ) ( not ( = ?auto_391908 ?auto_391913 ) ) ( not ( = ?auto_391908 ?auto_391914 ) ) ( not ( = ?auto_391909 ?auto_391910 ) ) ( not ( = ?auto_391909 ?auto_391911 ) ) ( not ( = ?auto_391909 ?auto_391912 ) ) ( not ( = ?auto_391909 ?auto_391913 ) ) ( not ( = ?auto_391909 ?auto_391914 ) ) ( not ( = ?auto_391910 ?auto_391911 ) ) ( not ( = ?auto_391910 ?auto_391912 ) ) ( not ( = ?auto_391910 ?auto_391913 ) ) ( not ( = ?auto_391910 ?auto_391914 ) ) ( not ( = ?auto_391911 ?auto_391912 ) ) ( not ( = ?auto_391911 ?auto_391913 ) ) ( not ( = ?auto_391911 ?auto_391914 ) ) ( not ( = ?auto_391912 ?auto_391913 ) ) ( not ( = ?auto_391912 ?auto_391914 ) ) ( not ( = ?auto_391913 ?auto_391914 ) ) ( ON ?auto_391900 ?auto_391915 ) ( not ( = ?auto_391914 ?auto_391915 ) ) ( not ( = ?auto_391913 ?auto_391915 ) ) ( not ( = ?auto_391912 ?auto_391915 ) ) ( not ( = ?auto_391911 ?auto_391915 ) ) ( not ( = ?auto_391910 ?auto_391915 ) ) ( not ( = ?auto_391909 ?auto_391915 ) ) ( not ( = ?auto_391908 ?auto_391915 ) ) ( not ( = ?auto_391907 ?auto_391915 ) ) ( not ( = ?auto_391906 ?auto_391915 ) ) ( not ( = ?auto_391905 ?auto_391915 ) ) ( not ( = ?auto_391904 ?auto_391915 ) ) ( not ( = ?auto_391903 ?auto_391915 ) ) ( not ( = ?auto_391902 ?auto_391915 ) ) ( not ( = ?auto_391901 ?auto_391915 ) ) ( not ( = ?auto_391900 ?auto_391915 ) ) ( ON ?auto_391901 ?auto_391900 ) ( ON ?auto_391902 ?auto_391901 ) ( ON ?auto_391903 ?auto_391902 ) ( ON ?auto_391904 ?auto_391903 ) ( ON ?auto_391905 ?auto_391904 ) ( ON ?auto_391906 ?auto_391905 ) ( ON ?auto_391907 ?auto_391906 ) ( ON ?auto_391908 ?auto_391907 ) ( ON ?auto_391909 ?auto_391908 ) ( ON ?auto_391910 ?auto_391909 ) ( ON ?auto_391911 ?auto_391910 ) ( ON ?auto_391912 ?auto_391911 ) ( ON ?auto_391913 ?auto_391912 ) ( ON ?auto_391914 ?auto_391913 ) ( CLEAR ?auto_391914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_391914 ?auto_391913 ?auto_391912 ?auto_391911 ?auto_391910 ?auto_391909 ?auto_391908 ?auto_391907 ?auto_391906 ?auto_391905 ?auto_391904 ?auto_391903 ?auto_391902 ?auto_391901 ?auto_391900 )
      ( MAKE-15PILE ?auto_391900 ?auto_391901 ?auto_391902 ?auto_391903 ?auto_391904 ?auto_391905 ?auto_391906 ?auto_391907 ?auto_391908 ?auto_391909 ?auto_391910 ?auto_391911 ?auto_391912 ?auto_391913 ?auto_391914 ) )
  )

)

