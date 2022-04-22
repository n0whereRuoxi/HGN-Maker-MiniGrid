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
      ?auto_300631 - BLOCK
    )
    :vars
    (
      ?auto_300632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300631 ?auto_300632 ) ( CLEAR ?auto_300631 ) ( HAND-EMPTY ) ( not ( = ?auto_300631 ?auto_300632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300631 ?auto_300632 )
      ( !PUTDOWN ?auto_300631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_300638 - BLOCK
      ?auto_300639 - BLOCK
    )
    :vars
    (
      ?auto_300640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_300638 ) ( ON ?auto_300639 ?auto_300640 ) ( CLEAR ?auto_300639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_300638 ) ( not ( = ?auto_300638 ?auto_300639 ) ) ( not ( = ?auto_300638 ?auto_300640 ) ) ( not ( = ?auto_300639 ?auto_300640 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300639 ?auto_300640 )
      ( !STACK ?auto_300639 ?auto_300638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_300648 - BLOCK
      ?auto_300649 - BLOCK
    )
    :vars
    (
      ?auto_300650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300649 ?auto_300650 ) ( not ( = ?auto_300648 ?auto_300649 ) ) ( not ( = ?auto_300648 ?auto_300650 ) ) ( not ( = ?auto_300649 ?auto_300650 ) ) ( ON ?auto_300648 ?auto_300649 ) ( CLEAR ?auto_300648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300648 )
      ( MAKE-2PILE ?auto_300648 ?auto_300649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_300659 - BLOCK
      ?auto_300660 - BLOCK
      ?auto_300661 - BLOCK
    )
    :vars
    (
      ?auto_300662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_300660 ) ( ON ?auto_300661 ?auto_300662 ) ( CLEAR ?auto_300661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_300659 ) ( ON ?auto_300660 ?auto_300659 ) ( not ( = ?auto_300659 ?auto_300660 ) ) ( not ( = ?auto_300659 ?auto_300661 ) ) ( not ( = ?auto_300659 ?auto_300662 ) ) ( not ( = ?auto_300660 ?auto_300661 ) ) ( not ( = ?auto_300660 ?auto_300662 ) ) ( not ( = ?auto_300661 ?auto_300662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300661 ?auto_300662 )
      ( !STACK ?auto_300661 ?auto_300660 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_300673 - BLOCK
      ?auto_300674 - BLOCK
      ?auto_300675 - BLOCK
    )
    :vars
    (
      ?auto_300676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300675 ?auto_300676 ) ( ON-TABLE ?auto_300673 ) ( not ( = ?auto_300673 ?auto_300674 ) ) ( not ( = ?auto_300673 ?auto_300675 ) ) ( not ( = ?auto_300673 ?auto_300676 ) ) ( not ( = ?auto_300674 ?auto_300675 ) ) ( not ( = ?auto_300674 ?auto_300676 ) ) ( not ( = ?auto_300675 ?auto_300676 ) ) ( CLEAR ?auto_300673 ) ( ON ?auto_300674 ?auto_300675 ) ( CLEAR ?auto_300674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300673 ?auto_300674 )
      ( MAKE-3PILE ?auto_300673 ?auto_300674 ?auto_300675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_300687 - BLOCK
      ?auto_300688 - BLOCK
      ?auto_300689 - BLOCK
    )
    :vars
    (
      ?auto_300690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300689 ?auto_300690 ) ( not ( = ?auto_300687 ?auto_300688 ) ) ( not ( = ?auto_300687 ?auto_300689 ) ) ( not ( = ?auto_300687 ?auto_300690 ) ) ( not ( = ?auto_300688 ?auto_300689 ) ) ( not ( = ?auto_300688 ?auto_300690 ) ) ( not ( = ?auto_300689 ?auto_300690 ) ) ( ON ?auto_300688 ?auto_300689 ) ( ON ?auto_300687 ?auto_300688 ) ( CLEAR ?auto_300687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300687 )
      ( MAKE-3PILE ?auto_300687 ?auto_300688 ?auto_300689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_300702 - BLOCK
      ?auto_300703 - BLOCK
      ?auto_300704 - BLOCK
      ?auto_300705 - BLOCK
    )
    :vars
    (
      ?auto_300706 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_300704 ) ( ON ?auto_300705 ?auto_300706 ) ( CLEAR ?auto_300705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_300702 ) ( ON ?auto_300703 ?auto_300702 ) ( ON ?auto_300704 ?auto_300703 ) ( not ( = ?auto_300702 ?auto_300703 ) ) ( not ( = ?auto_300702 ?auto_300704 ) ) ( not ( = ?auto_300702 ?auto_300705 ) ) ( not ( = ?auto_300702 ?auto_300706 ) ) ( not ( = ?auto_300703 ?auto_300704 ) ) ( not ( = ?auto_300703 ?auto_300705 ) ) ( not ( = ?auto_300703 ?auto_300706 ) ) ( not ( = ?auto_300704 ?auto_300705 ) ) ( not ( = ?auto_300704 ?auto_300706 ) ) ( not ( = ?auto_300705 ?auto_300706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300705 ?auto_300706 )
      ( !STACK ?auto_300705 ?auto_300704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_300720 - BLOCK
      ?auto_300721 - BLOCK
      ?auto_300722 - BLOCK
      ?auto_300723 - BLOCK
    )
    :vars
    (
      ?auto_300724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300723 ?auto_300724 ) ( ON-TABLE ?auto_300720 ) ( ON ?auto_300721 ?auto_300720 ) ( not ( = ?auto_300720 ?auto_300721 ) ) ( not ( = ?auto_300720 ?auto_300722 ) ) ( not ( = ?auto_300720 ?auto_300723 ) ) ( not ( = ?auto_300720 ?auto_300724 ) ) ( not ( = ?auto_300721 ?auto_300722 ) ) ( not ( = ?auto_300721 ?auto_300723 ) ) ( not ( = ?auto_300721 ?auto_300724 ) ) ( not ( = ?auto_300722 ?auto_300723 ) ) ( not ( = ?auto_300722 ?auto_300724 ) ) ( not ( = ?auto_300723 ?auto_300724 ) ) ( CLEAR ?auto_300721 ) ( ON ?auto_300722 ?auto_300723 ) ( CLEAR ?auto_300722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_300720 ?auto_300721 ?auto_300722 )
      ( MAKE-4PILE ?auto_300720 ?auto_300721 ?auto_300722 ?auto_300723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_300738 - BLOCK
      ?auto_300739 - BLOCK
      ?auto_300740 - BLOCK
      ?auto_300741 - BLOCK
    )
    :vars
    (
      ?auto_300742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300741 ?auto_300742 ) ( ON-TABLE ?auto_300738 ) ( not ( = ?auto_300738 ?auto_300739 ) ) ( not ( = ?auto_300738 ?auto_300740 ) ) ( not ( = ?auto_300738 ?auto_300741 ) ) ( not ( = ?auto_300738 ?auto_300742 ) ) ( not ( = ?auto_300739 ?auto_300740 ) ) ( not ( = ?auto_300739 ?auto_300741 ) ) ( not ( = ?auto_300739 ?auto_300742 ) ) ( not ( = ?auto_300740 ?auto_300741 ) ) ( not ( = ?auto_300740 ?auto_300742 ) ) ( not ( = ?auto_300741 ?auto_300742 ) ) ( ON ?auto_300740 ?auto_300741 ) ( CLEAR ?auto_300738 ) ( ON ?auto_300739 ?auto_300740 ) ( CLEAR ?auto_300739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300738 ?auto_300739 )
      ( MAKE-4PILE ?auto_300738 ?auto_300739 ?auto_300740 ?auto_300741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_300756 - BLOCK
      ?auto_300757 - BLOCK
      ?auto_300758 - BLOCK
      ?auto_300759 - BLOCK
    )
    :vars
    (
      ?auto_300760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300759 ?auto_300760 ) ( not ( = ?auto_300756 ?auto_300757 ) ) ( not ( = ?auto_300756 ?auto_300758 ) ) ( not ( = ?auto_300756 ?auto_300759 ) ) ( not ( = ?auto_300756 ?auto_300760 ) ) ( not ( = ?auto_300757 ?auto_300758 ) ) ( not ( = ?auto_300757 ?auto_300759 ) ) ( not ( = ?auto_300757 ?auto_300760 ) ) ( not ( = ?auto_300758 ?auto_300759 ) ) ( not ( = ?auto_300758 ?auto_300760 ) ) ( not ( = ?auto_300759 ?auto_300760 ) ) ( ON ?auto_300758 ?auto_300759 ) ( ON ?auto_300757 ?auto_300758 ) ( ON ?auto_300756 ?auto_300757 ) ( CLEAR ?auto_300756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300756 )
      ( MAKE-4PILE ?auto_300756 ?auto_300757 ?auto_300758 ?auto_300759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_300775 - BLOCK
      ?auto_300776 - BLOCK
      ?auto_300777 - BLOCK
      ?auto_300778 - BLOCK
      ?auto_300779 - BLOCK
    )
    :vars
    (
      ?auto_300780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_300778 ) ( ON ?auto_300779 ?auto_300780 ) ( CLEAR ?auto_300779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_300775 ) ( ON ?auto_300776 ?auto_300775 ) ( ON ?auto_300777 ?auto_300776 ) ( ON ?auto_300778 ?auto_300777 ) ( not ( = ?auto_300775 ?auto_300776 ) ) ( not ( = ?auto_300775 ?auto_300777 ) ) ( not ( = ?auto_300775 ?auto_300778 ) ) ( not ( = ?auto_300775 ?auto_300779 ) ) ( not ( = ?auto_300775 ?auto_300780 ) ) ( not ( = ?auto_300776 ?auto_300777 ) ) ( not ( = ?auto_300776 ?auto_300778 ) ) ( not ( = ?auto_300776 ?auto_300779 ) ) ( not ( = ?auto_300776 ?auto_300780 ) ) ( not ( = ?auto_300777 ?auto_300778 ) ) ( not ( = ?auto_300777 ?auto_300779 ) ) ( not ( = ?auto_300777 ?auto_300780 ) ) ( not ( = ?auto_300778 ?auto_300779 ) ) ( not ( = ?auto_300778 ?auto_300780 ) ) ( not ( = ?auto_300779 ?auto_300780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300779 ?auto_300780 )
      ( !STACK ?auto_300779 ?auto_300778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_300797 - BLOCK
      ?auto_300798 - BLOCK
      ?auto_300799 - BLOCK
      ?auto_300800 - BLOCK
      ?auto_300801 - BLOCK
    )
    :vars
    (
      ?auto_300802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300801 ?auto_300802 ) ( ON-TABLE ?auto_300797 ) ( ON ?auto_300798 ?auto_300797 ) ( ON ?auto_300799 ?auto_300798 ) ( not ( = ?auto_300797 ?auto_300798 ) ) ( not ( = ?auto_300797 ?auto_300799 ) ) ( not ( = ?auto_300797 ?auto_300800 ) ) ( not ( = ?auto_300797 ?auto_300801 ) ) ( not ( = ?auto_300797 ?auto_300802 ) ) ( not ( = ?auto_300798 ?auto_300799 ) ) ( not ( = ?auto_300798 ?auto_300800 ) ) ( not ( = ?auto_300798 ?auto_300801 ) ) ( not ( = ?auto_300798 ?auto_300802 ) ) ( not ( = ?auto_300799 ?auto_300800 ) ) ( not ( = ?auto_300799 ?auto_300801 ) ) ( not ( = ?auto_300799 ?auto_300802 ) ) ( not ( = ?auto_300800 ?auto_300801 ) ) ( not ( = ?auto_300800 ?auto_300802 ) ) ( not ( = ?auto_300801 ?auto_300802 ) ) ( CLEAR ?auto_300799 ) ( ON ?auto_300800 ?auto_300801 ) ( CLEAR ?auto_300800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_300797 ?auto_300798 ?auto_300799 ?auto_300800 )
      ( MAKE-5PILE ?auto_300797 ?auto_300798 ?auto_300799 ?auto_300800 ?auto_300801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_300819 - BLOCK
      ?auto_300820 - BLOCK
      ?auto_300821 - BLOCK
      ?auto_300822 - BLOCK
      ?auto_300823 - BLOCK
    )
    :vars
    (
      ?auto_300824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300823 ?auto_300824 ) ( ON-TABLE ?auto_300819 ) ( ON ?auto_300820 ?auto_300819 ) ( not ( = ?auto_300819 ?auto_300820 ) ) ( not ( = ?auto_300819 ?auto_300821 ) ) ( not ( = ?auto_300819 ?auto_300822 ) ) ( not ( = ?auto_300819 ?auto_300823 ) ) ( not ( = ?auto_300819 ?auto_300824 ) ) ( not ( = ?auto_300820 ?auto_300821 ) ) ( not ( = ?auto_300820 ?auto_300822 ) ) ( not ( = ?auto_300820 ?auto_300823 ) ) ( not ( = ?auto_300820 ?auto_300824 ) ) ( not ( = ?auto_300821 ?auto_300822 ) ) ( not ( = ?auto_300821 ?auto_300823 ) ) ( not ( = ?auto_300821 ?auto_300824 ) ) ( not ( = ?auto_300822 ?auto_300823 ) ) ( not ( = ?auto_300822 ?auto_300824 ) ) ( not ( = ?auto_300823 ?auto_300824 ) ) ( ON ?auto_300822 ?auto_300823 ) ( CLEAR ?auto_300820 ) ( ON ?auto_300821 ?auto_300822 ) ( CLEAR ?auto_300821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_300819 ?auto_300820 ?auto_300821 )
      ( MAKE-5PILE ?auto_300819 ?auto_300820 ?auto_300821 ?auto_300822 ?auto_300823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_300841 - BLOCK
      ?auto_300842 - BLOCK
      ?auto_300843 - BLOCK
      ?auto_300844 - BLOCK
      ?auto_300845 - BLOCK
    )
    :vars
    (
      ?auto_300846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300845 ?auto_300846 ) ( ON-TABLE ?auto_300841 ) ( not ( = ?auto_300841 ?auto_300842 ) ) ( not ( = ?auto_300841 ?auto_300843 ) ) ( not ( = ?auto_300841 ?auto_300844 ) ) ( not ( = ?auto_300841 ?auto_300845 ) ) ( not ( = ?auto_300841 ?auto_300846 ) ) ( not ( = ?auto_300842 ?auto_300843 ) ) ( not ( = ?auto_300842 ?auto_300844 ) ) ( not ( = ?auto_300842 ?auto_300845 ) ) ( not ( = ?auto_300842 ?auto_300846 ) ) ( not ( = ?auto_300843 ?auto_300844 ) ) ( not ( = ?auto_300843 ?auto_300845 ) ) ( not ( = ?auto_300843 ?auto_300846 ) ) ( not ( = ?auto_300844 ?auto_300845 ) ) ( not ( = ?auto_300844 ?auto_300846 ) ) ( not ( = ?auto_300845 ?auto_300846 ) ) ( ON ?auto_300844 ?auto_300845 ) ( ON ?auto_300843 ?auto_300844 ) ( CLEAR ?auto_300841 ) ( ON ?auto_300842 ?auto_300843 ) ( CLEAR ?auto_300842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300841 ?auto_300842 )
      ( MAKE-5PILE ?auto_300841 ?auto_300842 ?auto_300843 ?auto_300844 ?auto_300845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_300863 - BLOCK
      ?auto_300864 - BLOCK
      ?auto_300865 - BLOCK
      ?auto_300866 - BLOCK
      ?auto_300867 - BLOCK
    )
    :vars
    (
      ?auto_300868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300867 ?auto_300868 ) ( not ( = ?auto_300863 ?auto_300864 ) ) ( not ( = ?auto_300863 ?auto_300865 ) ) ( not ( = ?auto_300863 ?auto_300866 ) ) ( not ( = ?auto_300863 ?auto_300867 ) ) ( not ( = ?auto_300863 ?auto_300868 ) ) ( not ( = ?auto_300864 ?auto_300865 ) ) ( not ( = ?auto_300864 ?auto_300866 ) ) ( not ( = ?auto_300864 ?auto_300867 ) ) ( not ( = ?auto_300864 ?auto_300868 ) ) ( not ( = ?auto_300865 ?auto_300866 ) ) ( not ( = ?auto_300865 ?auto_300867 ) ) ( not ( = ?auto_300865 ?auto_300868 ) ) ( not ( = ?auto_300866 ?auto_300867 ) ) ( not ( = ?auto_300866 ?auto_300868 ) ) ( not ( = ?auto_300867 ?auto_300868 ) ) ( ON ?auto_300866 ?auto_300867 ) ( ON ?auto_300865 ?auto_300866 ) ( ON ?auto_300864 ?auto_300865 ) ( ON ?auto_300863 ?auto_300864 ) ( CLEAR ?auto_300863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_300863 )
      ( MAKE-5PILE ?auto_300863 ?auto_300864 ?auto_300865 ?auto_300866 ?auto_300867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_300886 - BLOCK
      ?auto_300887 - BLOCK
      ?auto_300888 - BLOCK
      ?auto_300889 - BLOCK
      ?auto_300890 - BLOCK
      ?auto_300891 - BLOCK
    )
    :vars
    (
      ?auto_300892 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_300890 ) ( ON ?auto_300891 ?auto_300892 ) ( CLEAR ?auto_300891 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_300886 ) ( ON ?auto_300887 ?auto_300886 ) ( ON ?auto_300888 ?auto_300887 ) ( ON ?auto_300889 ?auto_300888 ) ( ON ?auto_300890 ?auto_300889 ) ( not ( = ?auto_300886 ?auto_300887 ) ) ( not ( = ?auto_300886 ?auto_300888 ) ) ( not ( = ?auto_300886 ?auto_300889 ) ) ( not ( = ?auto_300886 ?auto_300890 ) ) ( not ( = ?auto_300886 ?auto_300891 ) ) ( not ( = ?auto_300886 ?auto_300892 ) ) ( not ( = ?auto_300887 ?auto_300888 ) ) ( not ( = ?auto_300887 ?auto_300889 ) ) ( not ( = ?auto_300887 ?auto_300890 ) ) ( not ( = ?auto_300887 ?auto_300891 ) ) ( not ( = ?auto_300887 ?auto_300892 ) ) ( not ( = ?auto_300888 ?auto_300889 ) ) ( not ( = ?auto_300888 ?auto_300890 ) ) ( not ( = ?auto_300888 ?auto_300891 ) ) ( not ( = ?auto_300888 ?auto_300892 ) ) ( not ( = ?auto_300889 ?auto_300890 ) ) ( not ( = ?auto_300889 ?auto_300891 ) ) ( not ( = ?auto_300889 ?auto_300892 ) ) ( not ( = ?auto_300890 ?auto_300891 ) ) ( not ( = ?auto_300890 ?auto_300892 ) ) ( not ( = ?auto_300891 ?auto_300892 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300891 ?auto_300892 )
      ( !STACK ?auto_300891 ?auto_300890 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_300912 - BLOCK
      ?auto_300913 - BLOCK
      ?auto_300914 - BLOCK
      ?auto_300915 - BLOCK
      ?auto_300916 - BLOCK
      ?auto_300917 - BLOCK
    )
    :vars
    (
      ?auto_300918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300917 ?auto_300918 ) ( ON-TABLE ?auto_300912 ) ( ON ?auto_300913 ?auto_300912 ) ( ON ?auto_300914 ?auto_300913 ) ( ON ?auto_300915 ?auto_300914 ) ( not ( = ?auto_300912 ?auto_300913 ) ) ( not ( = ?auto_300912 ?auto_300914 ) ) ( not ( = ?auto_300912 ?auto_300915 ) ) ( not ( = ?auto_300912 ?auto_300916 ) ) ( not ( = ?auto_300912 ?auto_300917 ) ) ( not ( = ?auto_300912 ?auto_300918 ) ) ( not ( = ?auto_300913 ?auto_300914 ) ) ( not ( = ?auto_300913 ?auto_300915 ) ) ( not ( = ?auto_300913 ?auto_300916 ) ) ( not ( = ?auto_300913 ?auto_300917 ) ) ( not ( = ?auto_300913 ?auto_300918 ) ) ( not ( = ?auto_300914 ?auto_300915 ) ) ( not ( = ?auto_300914 ?auto_300916 ) ) ( not ( = ?auto_300914 ?auto_300917 ) ) ( not ( = ?auto_300914 ?auto_300918 ) ) ( not ( = ?auto_300915 ?auto_300916 ) ) ( not ( = ?auto_300915 ?auto_300917 ) ) ( not ( = ?auto_300915 ?auto_300918 ) ) ( not ( = ?auto_300916 ?auto_300917 ) ) ( not ( = ?auto_300916 ?auto_300918 ) ) ( not ( = ?auto_300917 ?auto_300918 ) ) ( CLEAR ?auto_300915 ) ( ON ?auto_300916 ?auto_300917 ) ( CLEAR ?auto_300916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_300912 ?auto_300913 ?auto_300914 ?auto_300915 ?auto_300916 )
      ( MAKE-6PILE ?auto_300912 ?auto_300913 ?auto_300914 ?auto_300915 ?auto_300916 ?auto_300917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_300938 - BLOCK
      ?auto_300939 - BLOCK
      ?auto_300940 - BLOCK
      ?auto_300941 - BLOCK
      ?auto_300942 - BLOCK
      ?auto_300943 - BLOCK
    )
    :vars
    (
      ?auto_300944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300943 ?auto_300944 ) ( ON-TABLE ?auto_300938 ) ( ON ?auto_300939 ?auto_300938 ) ( ON ?auto_300940 ?auto_300939 ) ( not ( = ?auto_300938 ?auto_300939 ) ) ( not ( = ?auto_300938 ?auto_300940 ) ) ( not ( = ?auto_300938 ?auto_300941 ) ) ( not ( = ?auto_300938 ?auto_300942 ) ) ( not ( = ?auto_300938 ?auto_300943 ) ) ( not ( = ?auto_300938 ?auto_300944 ) ) ( not ( = ?auto_300939 ?auto_300940 ) ) ( not ( = ?auto_300939 ?auto_300941 ) ) ( not ( = ?auto_300939 ?auto_300942 ) ) ( not ( = ?auto_300939 ?auto_300943 ) ) ( not ( = ?auto_300939 ?auto_300944 ) ) ( not ( = ?auto_300940 ?auto_300941 ) ) ( not ( = ?auto_300940 ?auto_300942 ) ) ( not ( = ?auto_300940 ?auto_300943 ) ) ( not ( = ?auto_300940 ?auto_300944 ) ) ( not ( = ?auto_300941 ?auto_300942 ) ) ( not ( = ?auto_300941 ?auto_300943 ) ) ( not ( = ?auto_300941 ?auto_300944 ) ) ( not ( = ?auto_300942 ?auto_300943 ) ) ( not ( = ?auto_300942 ?auto_300944 ) ) ( not ( = ?auto_300943 ?auto_300944 ) ) ( ON ?auto_300942 ?auto_300943 ) ( CLEAR ?auto_300940 ) ( ON ?auto_300941 ?auto_300942 ) ( CLEAR ?auto_300941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_300938 ?auto_300939 ?auto_300940 ?auto_300941 )
      ( MAKE-6PILE ?auto_300938 ?auto_300939 ?auto_300940 ?auto_300941 ?auto_300942 ?auto_300943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_300964 - BLOCK
      ?auto_300965 - BLOCK
      ?auto_300966 - BLOCK
      ?auto_300967 - BLOCK
      ?auto_300968 - BLOCK
      ?auto_300969 - BLOCK
    )
    :vars
    (
      ?auto_300970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300969 ?auto_300970 ) ( ON-TABLE ?auto_300964 ) ( ON ?auto_300965 ?auto_300964 ) ( not ( = ?auto_300964 ?auto_300965 ) ) ( not ( = ?auto_300964 ?auto_300966 ) ) ( not ( = ?auto_300964 ?auto_300967 ) ) ( not ( = ?auto_300964 ?auto_300968 ) ) ( not ( = ?auto_300964 ?auto_300969 ) ) ( not ( = ?auto_300964 ?auto_300970 ) ) ( not ( = ?auto_300965 ?auto_300966 ) ) ( not ( = ?auto_300965 ?auto_300967 ) ) ( not ( = ?auto_300965 ?auto_300968 ) ) ( not ( = ?auto_300965 ?auto_300969 ) ) ( not ( = ?auto_300965 ?auto_300970 ) ) ( not ( = ?auto_300966 ?auto_300967 ) ) ( not ( = ?auto_300966 ?auto_300968 ) ) ( not ( = ?auto_300966 ?auto_300969 ) ) ( not ( = ?auto_300966 ?auto_300970 ) ) ( not ( = ?auto_300967 ?auto_300968 ) ) ( not ( = ?auto_300967 ?auto_300969 ) ) ( not ( = ?auto_300967 ?auto_300970 ) ) ( not ( = ?auto_300968 ?auto_300969 ) ) ( not ( = ?auto_300968 ?auto_300970 ) ) ( not ( = ?auto_300969 ?auto_300970 ) ) ( ON ?auto_300968 ?auto_300969 ) ( ON ?auto_300967 ?auto_300968 ) ( CLEAR ?auto_300965 ) ( ON ?auto_300966 ?auto_300967 ) ( CLEAR ?auto_300966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_300964 ?auto_300965 ?auto_300966 )
      ( MAKE-6PILE ?auto_300964 ?auto_300965 ?auto_300966 ?auto_300967 ?auto_300968 ?auto_300969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_300990 - BLOCK
      ?auto_300991 - BLOCK
      ?auto_300992 - BLOCK
      ?auto_300993 - BLOCK
      ?auto_300994 - BLOCK
      ?auto_300995 - BLOCK
    )
    :vars
    (
      ?auto_300996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300995 ?auto_300996 ) ( ON-TABLE ?auto_300990 ) ( not ( = ?auto_300990 ?auto_300991 ) ) ( not ( = ?auto_300990 ?auto_300992 ) ) ( not ( = ?auto_300990 ?auto_300993 ) ) ( not ( = ?auto_300990 ?auto_300994 ) ) ( not ( = ?auto_300990 ?auto_300995 ) ) ( not ( = ?auto_300990 ?auto_300996 ) ) ( not ( = ?auto_300991 ?auto_300992 ) ) ( not ( = ?auto_300991 ?auto_300993 ) ) ( not ( = ?auto_300991 ?auto_300994 ) ) ( not ( = ?auto_300991 ?auto_300995 ) ) ( not ( = ?auto_300991 ?auto_300996 ) ) ( not ( = ?auto_300992 ?auto_300993 ) ) ( not ( = ?auto_300992 ?auto_300994 ) ) ( not ( = ?auto_300992 ?auto_300995 ) ) ( not ( = ?auto_300992 ?auto_300996 ) ) ( not ( = ?auto_300993 ?auto_300994 ) ) ( not ( = ?auto_300993 ?auto_300995 ) ) ( not ( = ?auto_300993 ?auto_300996 ) ) ( not ( = ?auto_300994 ?auto_300995 ) ) ( not ( = ?auto_300994 ?auto_300996 ) ) ( not ( = ?auto_300995 ?auto_300996 ) ) ( ON ?auto_300994 ?auto_300995 ) ( ON ?auto_300993 ?auto_300994 ) ( ON ?auto_300992 ?auto_300993 ) ( CLEAR ?auto_300990 ) ( ON ?auto_300991 ?auto_300992 ) ( CLEAR ?auto_300991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_300990 ?auto_300991 )
      ( MAKE-6PILE ?auto_300990 ?auto_300991 ?auto_300992 ?auto_300993 ?auto_300994 ?auto_300995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_301016 - BLOCK
      ?auto_301017 - BLOCK
      ?auto_301018 - BLOCK
      ?auto_301019 - BLOCK
      ?auto_301020 - BLOCK
      ?auto_301021 - BLOCK
    )
    :vars
    (
      ?auto_301022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301021 ?auto_301022 ) ( not ( = ?auto_301016 ?auto_301017 ) ) ( not ( = ?auto_301016 ?auto_301018 ) ) ( not ( = ?auto_301016 ?auto_301019 ) ) ( not ( = ?auto_301016 ?auto_301020 ) ) ( not ( = ?auto_301016 ?auto_301021 ) ) ( not ( = ?auto_301016 ?auto_301022 ) ) ( not ( = ?auto_301017 ?auto_301018 ) ) ( not ( = ?auto_301017 ?auto_301019 ) ) ( not ( = ?auto_301017 ?auto_301020 ) ) ( not ( = ?auto_301017 ?auto_301021 ) ) ( not ( = ?auto_301017 ?auto_301022 ) ) ( not ( = ?auto_301018 ?auto_301019 ) ) ( not ( = ?auto_301018 ?auto_301020 ) ) ( not ( = ?auto_301018 ?auto_301021 ) ) ( not ( = ?auto_301018 ?auto_301022 ) ) ( not ( = ?auto_301019 ?auto_301020 ) ) ( not ( = ?auto_301019 ?auto_301021 ) ) ( not ( = ?auto_301019 ?auto_301022 ) ) ( not ( = ?auto_301020 ?auto_301021 ) ) ( not ( = ?auto_301020 ?auto_301022 ) ) ( not ( = ?auto_301021 ?auto_301022 ) ) ( ON ?auto_301020 ?auto_301021 ) ( ON ?auto_301019 ?auto_301020 ) ( ON ?auto_301018 ?auto_301019 ) ( ON ?auto_301017 ?auto_301018 ) ( ON ?auto_301016 ?auto_301017 ) ( CLEAR ?auto_301016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_301016 )
      ( MAKE-6PILE ?auto_301016 ?auto_301017 ?auto_301018 ?auto_301019 ?auto_301020 ?auto_301021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301043 - BLOCK
      ?auto_301044 - BLOCK
      ?auto_301045 - BLOCK
      ?auto_301046 - BLOCK
      ?auto_301047 - BLOCK
      ?auto_301048 - BLOCK
      ?auto_301049 - BLOCK
    )
    :vars
    (
      ?auto_301050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_301048 ) ( ON ?auto_301049 ?auto_301050 ) ( CLEAR ?auto_301049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_301043 ) ( ON ?auto_301044 ?auto_301043 ) ( ON ?auto_301045 ?auto_301044 ) ( ON ?auto_301046 ?auto_301045 ) ( ON ?auto_301047 ?auto_301046 ) ( ON ?auto_301048 ?auto_301047 ) ( not ( = ?auto_301043 ?auto_301044 ) ) ( not ( = ?auto_301043 ?auto_301045 ) ) ( not ( = ?auto_301043 ?auto_301046 ) ) ( not ( = ?auto_301043 ?auto_301047 ) ) ( not ( = ?auto_301043 ?auto_301048 ) ) ( not ( = ?auto_301043 ?auto_301049 ) ) ( not ( = ?auto_301043 ?auto_301050 ) ) ( not ( = ?auto_301044 ?auto_301045 ) ) ( not ( = ?auto_301044 ?auto_301046 ) ) ( not ( = ?auto_301044 ?auto_301047 ) ) ( not ( = ?auto_301044 ?auto_301048 ) ) ( not ( = ?auto_301044 ?auto_301049 ) ) ( not ( = ?auto_301044 ?auto_301050 ) ) ( not ( = ?auto_301045 ?auto_301046 ) ) ( not ( = ?auto_301045 ?auto_301047 ) ) ( not ( = ?auto_301045 ?auto_301048 ) ) ( not ( = ?auto_301045 ?auto_301049 ) ) ( not ( = ?auto_301045 ?auto_301050 ) ) ( not ( = ?auto_301046 ?auto_301047 ) ) ( not ( = ?auto_301046 ?auto_301048 ) ) ( not ( = ?auto_301046 ?auto_301049 ) ) ( not ( = ?auto_301046 ?auto_301050 ) ) ( not ( = ?auto_301047 ?auto_301048 ) ) ( not ( = ?auto_301047 ?auto_301049 ) ) ( not ( = ?auto_301047 ?auto_301050 ) ) ( not ( = ?auto_301048 ?auto_301049 ) ) ( not ( = ?auto_301048 ?auto_301050 ) ) ( not ( = ?auto_301049 ?auto_301050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_301049 ?auto_301050 )
      ( !STACK ?auto_301049 ?auto_301048 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301073 - BLOCK
      ?auto_301074 - BLOCK
      ?auto_301075 - BLOCK
      ?auto_301076 - BLOCK
      ?auto_301077 - BLOCK
      ?auto_301078 - BLOCK
      ?auto_301079 - BLOCK
    )
    :vars
    (
      ?auto_301080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301079 ?auto_301080 ) ( ON-TABLE ?auto_301073 ) ( ON ?auto_301074 ?auto_301073 ) ( ON ?auto_301075 ?auto_301074 ) ( ON ?auto_301076 ?auto_301075 ) ( ON ?auto_301077 ?auto_301076 ) ( not ( = ?auto_301073 ?auto_301074 ) ) ( not ( = ?auto_301073 ?auto_301075 ) ) ( not ( = ?auto_301073 ?auto_301076 ) ) ( not ( = ?auto_301073 ?auto_301077 ) ) ( not ( = ?auto_301073 ?auto_301078 ) ) ( not ( = ?auto_301073 ?auto_301079 ) ) ( not ( = ?auto_301073 ?auto_301080 ) ) ( not ( = ?auto_301074 ?auto_301075 ) ) ( not ( = ?auto_301074 ?auto_301076 ) ) ( not ( = ?auto_301074 ?auto_301077 ) ) ( not ( = ?auto_301074 ?auto_301078 ) ) ( not ( = ?auto_301074 ?auto_301079 ) ) ( not ( = ?auto_301074 ?auto_301080 ) ) ( not ( = ?auto_301075 ?auto_301076 ) ) ( not ( = ?auto_301075 ?auto_301077 ) ) ( not ( = ?auto_301075 ?auto_301078 ) ) ( not ( = ?auto_301075 ?auto_301079 ) ) ( not ( = ?auto_301075 ?auto_301080 ) ) ( not ( = ?auto_301076 ?auto_301077 ) ) ( not ( = ?auto_301076 ?auto_301078 ) ) ( not ( = ?auto_301076 ?auto_301079 ) ) ( not ( = ?auto_301076 ?auto_301080 ) ) ( not ( = ?auto_301077 ?auto_301078 ) ) ( not ( = ?auto_301077 ?auto_301079 ) ) ( not ( = ?auto_301077 ?auto_301080 ) ) ( not ( = ?auto_301078 ?auto_301079 ) ) ( not ( = ?auto_301078 ?auto_301080 ) ) ( not ( = ?auto_301079 ?auto_301080 ) ) ( CLEAR ?auto_301077 ) ( ON ?auto_301078 ?auto_301079 ) ( CLEAR ?auto_301078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_301073 ?auto_301074 ?auto_301075 ?auto_301076 ?auto_301077 ?auto_301078 )
      ( MAKE-7PILE ?auto_301073 ?auto_301074 ?auto_301075 ?auto_301076 ?auto_301077 ?auto_301078 ?auto_301079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301103 - BLOCK
      ?auto_301104 - BLOCK
      ?auto_301105 - BLOCK
      ?auto_301106 - BLOCK
      ?auto_301107 - BLOCK
      ?auto_301108 - BLOCK
      ?auto_301109 - BLOCK
    )
    :vars
    (
      ?auto_301110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301109 ?auto_301110 ) ( ON-TABLE ?auto_301103 ) ( ON ?auto_301104 ?auto_301103 ) ( ON ?auto_301105 ?auto_301104 ) ( ON ?auto_301106 ?auto_301105 ) ( not ( = ?auto_301103 ?auto_301104 ) ) ( not ( = ?auto_301103 ?auto_301105 ) ) ( not ( = ?auto_301103 ?auto_301106 ) ) ( not ( = ?auto_301103 ?auto_301107 ) ) ( not ( = ?auto_301103 ?auto_301108 ) ) ( not ( = ?auto_301103 ?auto_301109 ) ) ( not ( = ?auto_301103 ?auto_301110 ) ) ( not ( = ?auto_301104 ?auto_301105 ) ) ( not ( = ?auto_301104 ?auto_301106 ) ) ( not ( = ?auto_301104 ?auto_301107 ) ) ( not ( = ?auto_301104 ?auto_301108 ) ) ( not ( = ?auto_301104 ?auto_301109 ) ) ( not ( = ?auto_301104 ?auto_301110 ) ) ( not ( = ?auto_301105 ?auto_301106 ) ) ( not ( = ?auto_301105 ?auto_301107 ) ) ( not ( = ?auto_301105 ?auto_301108 ) ) ( not ( = ?auto_301105 ?auto_301109 ) ) ( not ( = ?auto_301105 ?auto_301110 ) ) ( not ( = ?auto_301106 ?auto_301107 ) ) ( not ( = ?auto_301106 ?auto_301108 ) ) ( not ( = ?auto_301106 ?auto_301109 ) ) ( not ( = ?auto_301106 ?auto_301110 ) ) ( not ( = ?auto_301107 ?auto_301108 ) ) ( not ( = ?auto_301107 ?auto_301109 ) ) ( not ( = ?auto_301107 ?auto_301110 ) ) ( not ( = ?auto_301108 ?auto_301109 ) ) ( not ( = ?auto_301108 ?auto_301110 ) ) ( not ( = ?auto_301109 ?auto_301110 ) ) ( ON ?auto_301108 ?auto_301109 ) ( CLEAR ?auto_301106 ) ( ON ?auto_301107 ?auto_301108 ) ( CLEAR ?auto_301107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_301103 ?auto_301104 ?auto_301105 ?auto_301106 ?auto_301107 )
      ( MAKE-7PILE ?auto_301103 ?auto_301104 ?auto_301105 ?auto_301106 ?auto_301107 ?auto_301108 ?auto_301109 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301133 - BLOCK
      ?auto_301134 - BLOCK
      ?auto_301135 - BLOCK
      ?auto_301136 - BLOCK
      ?auto_301137 - BLOCK
      ?auto_301138 - BLOCK
      ?auto_301139 - BLOCK
    )
    :vars
    (
      ?auto_301140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301139 ?auto_301140 ) ( ON-TABLE ?auto_301133 ) ( ON ?auto_301134 ?auto_301133 ) ( ON ?auto_301135 ?auto_301134 ) ( not ( = ?auto_301133 ?auto_301134 ) ) ( not ( = ?auto_301133 ?auto_301135 ) ) ( not ( = ?auto_301133 ?auto_301136 ) ) ( not ( = ?auto_301133 ?auto_301137 ) ) ( not ( = ?auto_301133 ?auto_301138 ) ) ( not ( = ?auto_301133 ?auto_301139 ) ) ( not ( = ?auto_301133 ?auto_301140 ) ) ( not ( = ?auto_301134 ?auto_301135 ) ) ( not ( = ?auto_301134 ?auto_301136 ) ) ( not ( = ?auto_301134 ?auto_301137 ) ) ( not ( = ?auto_301134 ?auto_301138 ) ) ( not ( = ?auto_301134 ?auto_301139 ) ) ( not ( = ?auto_301134 ?auto_301140 ) ) ( not ( = ?auto_301135 ?auto_301136 ) ) ( not ( = ?auto_301135 ?auto_301137 ) ) ( not ( = ?auto_301135 ?auto_301138 ) ) ( not ( = ?auto_301135 ?auto_301139 ) ) ( not ( = ?auto_301135 ?auto_301140 ) ) ( not ( = ?auto_301136 ?auto_301137 ) ) ( not ( = ?auto_301136 ?auto_301138 ) ) ( not ( = ?auto_301136 ?auto_301139 ) ) ( not ( = ?auto_301136 ?auto_301140 ) ) ( not ( = ?auto_301137 ?auto_301138 ) ) ( not ( = ?auto_301137 ?auto_301139 ) ) ( not ( = ?auto_301137 ?auto_301140 ) ) ( not ( = ?auto_301138 ?auto_301139 ) ) ( not ( = ?auto_301138 ?auto_301140 ) ) ( not ( = ?auto_301139 ?auto_301140 ) ) ( ON ?auto_301138 ?auto_301139 ) ( ON ?auto_301137 ?auto_301138 ) ( CLEAR ?auto_301135 ) ( ON ?auto_301136 ?auto_301137 ) ( CLEAR ?auto_301136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_301133 ?auto_301134 ?auto_301135 ?auto_301136 )
      ( MAKE-7PILE ?auto_301133 ?auto_301134 ?auto_301135 ?auto_301136 ?auto_301137 ?auto_301138 ?auto_301139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301163 - BLOCK
      ?auto_301164 - BLOCK
      ?auto_301165 - BLOCK
      ?auto_301166 - BLOCK
      ?auto_301167 - BLOCK
      ?auto_301168 - BLOCK
      ?auto_301169 - BLOCK
    )
    :vars
    (
      ?auto_301170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301169 ?auto_301170 ) ( ON-TABLE ?auto_301163 ) ( ON ?auto_301164 ?auto_301163 ) ( not ( = ?auto_301163 ?auto_301164 ) ) ( not ( = ?auto_301163 ?auto_301165 ) ) ( not ( = ?auto_301163 ?auto_301166 ) ) ( not ( = ?auto_301163 ?auto_301167 ) ) ( not ( = ?auto_301163 ?auto_301168 ) ) ( not ( = ?auto_301163 ?auto_301169 ) ) ( not ( = ?auto_301163 ?auto_301170 ) ) ( not ( = ?auto_301164 ?auto_301165 ) ) ( not ( = ?auto_301164 ?auto_301166 ) ) ( not ( = ?auto_301164 ?auto_301167 ) ) ( not ( = ?auto_301164 ?auto_301168 ) ) ( not ( = ?auto_301164 ?auto_301169 ) ) ( not ( = ?auto_301164 ?auto_301170 ) ) ( not ( = ?auto_301165 ?auto_301166 ) ) ( not ( = ?auto_301165 ?auto_301167 ) ) ( not ( = ?auto_301165 ?auto_301168 ) ) ( not ( = ?auto_301165 ?auto_301169 ) ) ( not ( = ?auto_301165 ?auto_301170 ) ) ( not ( = ?auto_301166 ?auto_301167 ) ) ( not ( = ?auto_301166 ?auto_301168 ) ) ( not ( = ?auto_301166 ?auto_301169 ) ) ( not ( = ?auto_301166 ?auto_301170 ) ) ( not ( = ?auto_301167 ?auto_301168 ) ) ( not ( = ?auto_301167 ?auto_301169 ) ) ( not ( = ?auto_301167 ?auto_301170 ) ) ( not ( = ?auto_301168 ?auto_301169 ) ) ( not ( = ?auto_301168 ?auto_301170 ) ) ( not ( = ?auto_301169 ?auto_301170 ) ) ( ON ?auto_301168 ?auto_301169 ) ( ON ?auto_301167 ?auto_301168 ) ( ON ?auto_301166 ?auto_301167 ) ( CLEAR ?auto_301164 ) ( ON ?auto_301165 ?auto_301166 ) ( CLEAR ?auto_301165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_301163 ?auto_301164 ?auto_301165 )
      ( MAKE-7PILE ?auto_301163 ?auto_301164 ?auto_301165 ?auto_301166 ?auto_301167 ?auto_301168 ?auto_301169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301193 - BLOCK
      ?auto_301194 - BLOCK
      ?auto_301195 - BLOCK
      ?auto_301196 - BLOCK
      ?auto_301197 - BLOCK
      ?auto_301198 - BLOCK
      ?auto_301199 - BLOCK
    )
    :vars
    (
      ?auto_301200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301199 ?auto_301200 ) ( ON-TABLE ?auto_301193 ) ( not ( = ?auto_301193 ?auto_301194 ) ) ( not ( = ?auto_301193 ?auto_301195 ) ) ( not ( = ?auto_301193 ?auto_301196 ) ) ( not ( = ?auto_301193 ?auto_301197 ) ) ( not ( = ?auto_301193 ?auto_301198 ) ) ( not ( = ?auto_301193 ?auto_301199 ) ) ( not ( = ?auto_301193 ?auto_301200 ) ) ( not ( = ?auto_301194 ?auto_301195 ) ) ( not ( = ?auto_301194 ?auto_301196 ) ) ( not ( = ?auto_301194 ?auto_301197 ) ) ( not ( = ?auto_301194 ?auto_301198 ) ) ( not ( = ?auto_301194 ?auto_301199 ) ) ( not ( = ?auto_301194 ?auto_301200 ) ) ( not ( = ?auto_301195 ?auto_301196 ) ) ( not ( = ?auto_301195 ?auto_301197 ) ) ( not ( = ?auto_301195 ?auto_301198 ) ) ( not ( = ?auto_301195 ?auto_301199 ) ) ( not ( = ?auto_301195 ?auto_301200 ) ) ( not ( = ?auto_301196 ?auto_301197 ) ) ( not ( = ?auto_301196 ?auto_301198 ) ) ( not ( = ?auto_301196 ?auto_301199 ) ) ( not ( = ?auto_301196 ?auto_301200 ) ) ( not ( = ?auto_301197 ?auto_301198 ) ) ( not ( = ?auto_301197 ?auto_301199 ) ) ( not ( = ?auto_301197 ?auto_301200 ) ) ( not ( = ?auto_301198 ?auto_301199 ) ) ( not ( = ?auto_301198 ?auto_301200 ) ) ( not ( = ?auto_301199 ?auto_301200 ) ) ( ON ?auto_301198 ?auto_301199 ) ( ON ?auto_301197 ?auto_301198 ) ( ON ?auto_301196 ?auto_301197 ) ( ON ?auto_301195 ?auto_301196 ) ( CLEAR ?auto_301193 ) ( ON ?auto_301194 ?auto_301195 ) ( CLEAR ?auto_301194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_301193 ?auto_301194 )
      ( MAKE-7PILE ?auto_301193 ?auto_301194 ?auto_301195 ?auto_301196 ?auto_301197 ?auto_301198 ?auto_301199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_301223 - BLOCK
      ?auto_301224 - BLOCK
      ?auto_301225 - BLOCK
      ?auto_301226 - BLOCK
      ?auto_301227 - BLOCK
      ?auto_301228 - BLOCK
      ?auto_301229 - BLOCK
    )
    :vars
    (
      ?auto_301230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301229 ?auto_301230 ) ( not ( = ?auto_301223 ?auto_301224 ) ) ( not ( = ?auto_301223 ?auto_301225 ) ) ( not ( = ?auto_301223 ?auto_301226 ) ) ( not ( = ?auto_301223 ?auto_301227 ) ) ( not ( = ?auto_301223 ?auto_301228 ) ) ( not ( = ?auto_301223 ?auto_301229 ) ) ( not ( = ?auto_301223 ?auto_301230 ) ) ( not ( = ?auto_301224 ?auto_301225 ) ) ( not ( = ?auto_301224 ?auto_301226 ) ) ( not ( = ?auto_301224 ?auto_301227 ) ) ( not ( = ?auto_301224 ?auto_301228 ) ) ( not ( = ?auto_301224 ?auto_301229 ) ) ( not ( = ?auto_301224 ?auto_301230 ) ) ( not ( = ?auto_301225 ?auto_301226 ) ) ( not ( = ?auto_301225 ?auto_301227 ) ) ( not ( = ?auto_301225 ?auto_301228 ) ) ( not ( = ?auto_301225 ?auto_301229 ) ) ( not ( = ?auto_301225 ?auto_301230 ) ) ( not ( = ?auto_301226 ?auto_301227 ) ) ( not ( = ?auto_301226 ?auto_301228 ) ) ( not ( = ?auto_301226 ?auto_301229 ) ) ( not ( = ?auto_301226 ?auto_301230 ) ) ( not ( = ?auto_301227 ?auto_301228 ) ) ( not ( = ?auto_301227 ?auto_301229 ) ) ( not ( = ?auto_301227 ?auto_301230 ) ) ( not ( = ?auto_301228 ?auto_301229 ) ) ( not ( = ?auto_301228 ?auto_301230 ) ) ( not ( = ?auto_301229 ?auto_301230 ) ) ( ON ?auto_301228 ?auto_301229 ) ( ON ?auto_301227 ?auto_301228 ) ( ON ?auto_301226 ?auto_301227 ) ( ON ?auto_301225 ?auto_301226 ) ( ON ?auto_301224 ?auto_301225 ) ( ON ?auto_301223 ?auto_301224 ) ( CLEAR ?auto_301223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_301223 )
      ( MAKE-7PILE ?auto_301223 ?auto_301224 ?auto_301225 ?auto_301226 ?auto_301227 ?auto_301228 ?auto_301229 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301254 - BLOCK
      ?auto_301255 - BLOCK
      ?auto_301256 - BLOCK
      ?auto_301257 - BLOCK
      ?auto_301258 - BLOCK
      ?auto_301259 - BLOCK
      ?auto_301260 - BLOCK
      ?auto_301261 - BLOCK
    )
    :vars
    (
      ?auto_301262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_301260 ) ( ON ?auto_301261 ?auto_301262 ) ( CLEAR ?auto_301261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_301254 ) ( ON ?auto_301255 ?auto_301254 ) ( ON ?auto_301256 ?auto_301255 ) ( ON ?auto_301257 ?auto_301256 ) ( ON ?auto_301258 ?auto_301257 ) ( ON ?auto_301259 ?auto_301258 ) ( ON ?auto_301260 ?auto_301259 ) ( not ( = ?auto_301254 ?auto_301255 ) ) ( not ( = ?auto_301254 ?auto_301256 ) ) ( not ( = ?auto_301254 ?auto_301257 ) ) ( not ( = ?auto_301254 ?auto_301258 ) ) ( not ( = ?auto_301254 ?auto_301259 ) ) ( not ( = ?auto_301254 ?auto_301260 ) ) ( not ( = ?auto_301254 ?auto_301261 ) ) ( not ( = ?auto_301254 ?auto_301262 ) ) ( not ( = ?auto_301255 ?auto_301256 ) ) ( not ( = ?auto_301255 ?auto_301257 ) ) ( not ( = ?auto_301255 ?auto_301258 ) ) ( not ( = ?auto_301255 ?auto_301259 ) ) ( not ( = ?auto_301255 ?auto_301260 ) ) ( not ( = ?auto_301255 ?auto_301261 ) ) ( not ( = ?auto_301255 ?auto_301262 ) ) ( not ( = ?auto_301256 ?auto_301257 ) ) ( not ( = ?auto_301256 ?auto_301258 ) ) ( not ( = ?auto_301256 ?auto_301259 ) ) ( not ( = ?auto_301256 ?auto_301260 ) ) ( not ( = ?auto_301256 ?auto_301261 ) ) ( not ( = ?auto_301256 ?auto_301262 ) ) ( not ( = ?auto_301257 ?auto_301258 ) ) ( not ( = ?auto_301257 ?auto_301259 ) ) ( not ( = ?auto_301257 ?auto_301260 ) ) ( not ( = ?auto_301257 ?auto_301261 ) ) ( not ( = ?auto_301257 ?auto_301262 ) ) ( not ( = ?auto_301258 ?auto_301259 ) ) ( not ( = ?auto_301258 ?auto_301260 ) ) ( not ( = ?auto_301258 ?auto_301261 ) ) ( not ( = ?auto_301258 ?auto_301262 ) ) ( not ( = ?auto_301259 ?auto_301260 ) ) ( not ( = ?auto_301259 ?auto_301261 ) ) ( not ( = ?auto_301259 ?auto_301262 ) ) ( not ( = ?auto_301260 ?auto_301261 ) ) ( not ( = ?auto_301260 ?auto_301262 ) ) ( not ( = ?auto_301261 ?auto_301262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_301261 ?auto_301262 )
      ( !STACK ?auto_301261 ?auto_301260 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301288 - BLOCK
      ?auto_301289 - BLOCK
      ?auto_301290 - BLOCK
      ?auto_301291 - BLOCK
      ?auto_301292 - BLOCK
      ?auto_301293 - BLOCK
      ?auto_301294 - BLOCK
      ?auto_301295 - BLOCK
    )
    :vars
    (
      ?auto_301296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301295 ?auto_301296 ) ( ON-TABLE ?auto_301288 ) ( ON ?auto_301289 ?auto_301288 ) ( ON ?auto_301290 ?auto_301289 ) ( ON ?auto_301291 ?auto_301290 ) ( ON ?auto_301292 ?auto_301291 ) ( ON ?auto_301293 ?auto_301292 ) ( not ( = ?auto_301288 ?auto_301289 ) ) ( not ( = ?auto_301288 ?auto_301290 ) ) ( not ( = ?auto_301288 ?auto_301291 ) ) ( not ( = ?auto_301288 ?auto_301292 ) ) ( not ( = ?auto_301288 ?auto_301293 ) ) ( not ( = ?auto_301288 ?auto_301294 ) ) ( not ( = ?auto_301288 ?auto_301295 ) ) ( not ( = ?auto_301288 ?auto_301296 ) ) ( not ( = ?auto_301289 ?auto_301290 ) ) ( not ( = ?auto_301289 ?auto_301291 ) ) ( not ( = ?auto_301289 ?auto_301292 ) ) ( not ( = ?auto_301289 ?auto_301293 ) ) ( not ( = ?auto_301289 ?auto_301294 ) ) ( not ( = ?auto_301289 ?auto_301295 ) ) ( not ( = ?auto_301289 ?auto_301296 ) ) ( not ( = ?auto_301290 ?auto_301291 ) ) ( not ( = ?auto_301290 ?auto_301292 ) ) ( not ( = ?auto_301290 ?auto_301293 ) ) ( not ( = ?auto_301290 ?auto_301294 ) ) ( not ( = ?auto_301290 ?auto_301295 ) ) ( not ( = ?auto_301290 ?auto_301296 ) ) ( not ( = ?auto_301291 ?auto_301292 ) ) ( not ( = ?auto_301291 ?auto_301293 ) ) ( not ( = ?auto_301291 ?auto_301294 ) ) ( not ( = ?auto_301291 ?auto_301295 ) ) ( not ( = ?auto_301291 ?auto_301296 ) ) ( not ( = ?auto_301292 ?auto_301293 ) ) ( not ( = ?auto_301292 ?auto_301294 ) ) ( not ( = ?auto_301292 ?auto_301295 ) ) ( not ( = ?auto_301292 ?auto_301296 ) ) ( not ( = ?auto_301293 ?auto_301294 ) ) ( not ( = ?auto_301293 ?auto_301295 ) ) ( not ( = ?auto_301293 ?auto_301296 ) ) ( not ( = ?auto_301294 ?auto_301295 ) ) ( not ( = ?auto_301294 ?auto_301296 ) ) ( not ( = ?auto_301295 ?auto_301296 ) ) ( CLEAR ?auto_301293 ) ( ON ?auto_301294 ?auto_301295 ) ( CLEAR ?auto_301294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_301288 ?auto_301289 ?auto_301290 ?auto_301291 ?auto_301292 ?auto_301293 ?auto_301294 )
      ( MAKE-8PILE ?auto_301288 ?auto_301289 ?auto_301290 ?auto_301291 ?auto_301292 ?auto_301293 ?auto_301294 ?auto_301295 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301322 - BLOCK
      ?auto_301323 - BLOCK
      ?auto_301324 - BLOCK
      ?auto_301325 - BLOCK
      ?auto_301326 - BLOCK
      ?auto_301327 - BLOCK
      ?auto_301328 - BLOCK
      ?auto_301329 - BLOCK
    )
    :vars
    (
      ?auto_301330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301329 ?auto_301330 ) ( ON-TABLE ?auto_301322 ) ( ON ?auto_301323 ?auto_301322 ) ( ON ?auto_301324 ?auto_301323 ) ( ON ?auto_301325 ?auto_301324 ) ( ON ?auto_301326 ?auto_301325 ) ( not ( = ?auto_301322 ?auto_301323 ) ) ( not ( = ?auto_301322 ?auto_301324 ) ) ( not ( = ?auto_301322 ?auto_301325 ) ) ( not ( = ?auto_301322 ?auto_301326 ) ) ( not ( = ?auto_301322 ?auto_301327 ) ) ( not ( = ?auto_301322 ?auto_301328 ) ) ( not ( = ?auto_301322 ?auto_301329 ) ) ( not ( = ?auto_301322 ?auto_301330 ) ) ( not ( = ?auto_301323 ?auto_301324 ) ) ( not ( = ?auto_301323 ?auto_301325 ) ) ( not ( = ?auto_301323 ?auto_301326 ) ) ( not ( = ?auto_301323 ?auto_301327 ) ) ( not ( = ?auto_301323 ?auto_301328 ) ) ( not ( = ?auto_301323 ?auto_301329 ) ) ( not ( = ?auto_301323 ?auto_301330 ) ) ( not ( = ?auto_301324 ?auto_301325 ) ) ( not ( = ?auto_301324 ?auto_301326 ) ) ( not ( = ?auto_301324 ?auto_301327 ) ) ( not ( = ?auto_301324 ?auto_301328 ) ) ( not ( = ?auto_301324 ?auto_301329 ) ) ( not ( = ?auto_301324 ?auto_301330 ) ) ( not ( = ?auto_301325 ?auto_301326 ) ) ( not ( = ?auto_301325 ?auto_301327 ) ) ( not ( = ?auto_301325 ?auto_301328 ) ) ( not ( = ?auto_301325 ?auto_301329 ) ) ( not ( = ?auto_301325 ?auto_301330 ) ) ( not ( = ?auto_301326 ?auto_301327 ) ) ( not ( = ?auto_301326 ?auto_301328 ) ) ( not ( = ?auto_301326 ?auto_301329 ) ) ( not ( = ?auto_301326 ?auto_301330 ) ) ( not ( = ?auto_301327 ?auto_301328 ) ) ( not ( = ?auto_301327 ?auto_301329 ) ) ( not ( = ?auto_301327 ?auto_301330 ) ) ( not ( = ?auto_301328 ?auto_301329 ) ) ( not ( = ?auto_301328 ?auto_301330 ) ) ( not ( = ?auto_301329 ?auto_301330 ) ) ( ON ?auto_301328 ?auto_301329 ) ( CLEAR ?auto_301326 ) ( ON ?auto_301327 ?auto_301328 ) ( CLEAR ?auto_301327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_301322 ?auto_301323 ?auto_301324 ?auto_301325 ?auto_301326 ?auto_301327 )
      ( MAKE-8PILE ?auto_301322 ?auto_301323 ?auto_301324 ?auto_301325 ?auto_301326 ?auto_301327 ?auto_301328 ?auto_301329 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301356 - BLOCK
      ?auto_301357 - BLOCK
      ?auto_301358 - BLOCK
      ?auto_301359 - BLOCK
      ?auto_301360 - BLOCK
      ?auto_301361 - BLOCK
      ?auto_301362 - BLOCK
      ?auto_301363 - BLOCK
    )
    :vars
    (
      ?auto_301364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301363 ?auto_301364 ) ( ON-TABLE ?auto_301356 ) ( ON ?auto_301357 ?auto_301356 ) ( ON ?auto_301358 ?auto_301357 ) ( ON ?auto_301359 ?auto_301358 ) ( not ( = ?auto_301356 ?auto_301357 ) ) ( not ( = ?auto_301356 ?auto_301358 ) ) ( not ( = ?auto_301356 ?auto_301359 ) ) ( not ( = ?auto_301356 ?auto_301360 ) ) ( not ( = ?auto_301356 ?auto_301361 ) ) ( not ( = ?auto_301356 ?auto_301362 ) ) ( not ( = ?auto_301356 ?auto_301363 ) ) ( not ( = ?auto_301356 ?auto_301364 ) ) ( not ( = ?auto_301357 ?auto_301358 ) ) ( not ( = ?auto_301357 ?auto_301359 ) ) ( not ( = ?auto_301357 ?auto_301360 ) ) ( not ( = ?auto_301357 ?auto_301361 ) ) ( not ( = ?auto_301357 ?auto_301362 ) ) ( not ( = ?auto_301357 ?auto_301363 ) ) ( not ( = ?auto_301357 ?auto_301364 ) ) ( not ( = ?auto_301358 ?auto_301359 ) ) ( not ( = ?auto_301358 ?auto_301360 ) ) ( not ( = ?auto_301358 ?auto_301361 ) ) ( not ( = ?auto_301358 ?auto_301362 ) ) ( not ( = ?auto_301358 ?auto_301363 ) ) ( not ( = ?auto_301358 ?auto_301364 ) ) ( not ( = ?auto_301359 ?auto_301360 ) ) ( not ( = ?auto_301359 ?auto_301361 ) ) ( not ( = ?auto_301359 ?auto_301362 ) ) ( not ( = ?auto_301359 ?auto_301363 ) ) ( not ( = ?auto_301359 ?auto_301364 ) ) ( not ( = ?auto_301360 ?auto_301361 ) ) ( not ( = ?auto_301360 ?auto_301362 ) ) ( not ( = ?auto_301360 ?auto_301363 ) ) ( not ( = ?auto_301360 ?auto_301364 ) ) ( not ( = ?auto_301361 ?auto_301362 ) ) ( not ( = ?auto_301361 ?auto_301363 ) ) ( not ( = ?auto_301361 ?auto_301364 ) ) ( not ( = ?auto_301362 ?auto_301363 ) ) ( not ( = ?auto_301362 ?auto_301364 ) ) ( not ( = ?auto_301363 ?auto_301364 ) ) ( ON ?auto_301362 ?auto_301363 ) ( ON ?auto_301361 ?auto_301362 ) ( CLEAR ?auto_301359 ) ( ON ?auto_301360 ?auto_301361 ) ( CLEAR ?auto_301360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_301356 ?auto_301357 ?auto_301358 ?auto_301359 ?auto_301360 )
      ( MAKE-8PILE ?auto_301356 ?auto_301357 ?auto_301358 ?auto_301359 ?auto_301360 ?auto_301361 ?auto_301362 ?auto_301363 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301390 - BLOCK
      ?auto_301391 - BLOCK
      ?auto_301392 - BLOCK
      ?auto_301393 - BLOCK
      ?auto_301394 - BLOCK
      ?auto_301395 - BLOCK
      ?auto_301396 - BLOCK
      ?auto_301397 - BLOCK
    )
    :vars
    (
      ?auto_301398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301397 ?auto_301398 ) ( ON-TABLE ?auto_301390 ) ( ON ?auto_301391 ?auto_301390 ) ( ON ?auto_301392 ?auto_301391 ) ( not ( = ?auto_301390 ?auto_301391 ) ) ( not ( = ?auto_301390 ?auto_301392 ) ) ( not ( = ?auto_301390 ?auto_301393 ) ) ( not ( = ?auto_301390 ?auto_301394 ) ) ( not ( = ?auto_301390 ?auto_301395 ) ) ( not ( = ?auto_301390 ?auto_301396 ) ) ( not ( = ?auto_301390 ?auto_301397 ) ) ( not ( = ?auto_301390 ?auto_301398 ) ) ( not ( = ?auto_301391 ?auto_301392 ) ) ( not ( = ?auto_301391 ?auto_301393 ) ) ( not ( = ?auto_301391 ?auto_301394 ) ) ( not ( = ?auto_301391 ?auto_301395 ) ) ( not ( = ?auto_301391 ?auto_301396 ) ) ( not ( = ?auto_301391 ?auto_301397 ) ) ( not ( = ?auto_301391 ?auto_301398 ) ) ( not ( = ?auto_301392 ?auto_301393 ) ) ( not ( = ?auto_301392 ?auto_301394 ) ) ( not ( = ?auto_301392 ?auto_301395 ) ) ( not ( = ?auto_301392 ?auto_301396 ) ) ( not ( = ?auto_301392 ?auto_301397 ) ) ( not ( = ?auto_301392 ?auto_301398 ) ) ( not ( = ?auto_301393 ?auto_301394 ) ) ( not ( = ?auto_301393 ?auto_301395 ) ) ( not ( = ?auto_301393 ?auto_301396 ) ) ( not ( = ?auto_301393 ?auto_301397 ) ) ( not ( = ?auto_301393 ?auto_301398 ) ) ( not ( = ?auto_301394 ?auto_301395 ) ) ( not ( = ?auto_301394 ?auto_301396 ) ) ( not ( = ?auto_301394 ?auto_301397 ) ) ( not ( = ?auto_301394 ?auto_301398 ) ) ( not ( = ?auto_301395 ?auto_301396 ) ) ( not ( = ?auto_301395 ?auto_301397 ) ) ( not ( = ?auto_301395 ?auto_301398 ) ) ( not ( = ?auto_301396 ?auto_301397 ) ) ( not ( = ?auto_301396 ?auto_301398 ) ) ( not ( = ?auto_301397 ?auto_301398 ) ) ( ON ?auto_301396 ?auto_301397 ) ( ON ?auto_301395 ?auto_301396 ) ( ON ?auto_301394 ?auto_301395 ) ( CLEAR ?auto_301392 ) ( ON ?auto_301393 ?auto_301394 ) ( CLEAR ?auto_301393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_301390 ?auto_301391 ?auto_301392 ?auto_301393 )
      ( MAKE-8PILE ?auto_301390 ?auto_301391 ?auto_301392 ?auto_301393 ?auto_301394 ?auto_301395 ?auto_301396 ?auto_301397 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301424 - BLOCK
      ?auto_301425 - BLOCK
      ?auto_301426 - BLOCK
      ?auto_301427 - BLOCK
      ?auto_301428 - BLOCK
      ?auto_301429 - BLOCK
      ?auto_301430 - BLOCK
      ?auto_301431 - BLOCK
    )
    :vars
    (
      ?auto_301432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301431 ?auto_301432 ) ( ON-TABLE ?auto_301424 ) ( ON ?auto_301425 ?auto_301424 ) ( not ( = ?auto_301424 ?auto_301425 ) ) ( not ( = ?auto_301424 ?auto_301426 ) ) ( not ( = ?auto_301424 ?auto_301427 ) ) ( not ( = ?auto_301424 ?auto_301428 ) ) ( not ( = ?auto_301424 ?auto_301429 ) ) ( not ( = ?auto_301424 ?auto_301430 ) ) ( not ( = ?auto_301424 ?auto_301431 ) ) ( not ( = ?auto_301424 ?auto_301432 ) ) ( not ( = ?auto_301425 ?auto_301426 ) ) ( not ( = ?auto_301425 ?auto_301427 ) ) ( not ( = ?auto_301425 ?auto_301428 ) ) ( not ( = ?auto_301425 ?auto_301429 ) ) ( not ( = ?auto_301425 ?auto_301430 ) ) ( not ( = ?auto_301425 ?auto_301431 ) ) ( not ( = ?auto_301425 ?auto_301432 ) ) ( not ( = ?auto_301426 ?auto_301427 ) ) ( not ( = ?auto_301426 ?auto_301428 ) ) ( not ( = ?auto_301426 ?auto_301429 ) ) ( not ( = ?auto_301426 ?auto_301430 ) ) ( not ( = ?auto_301426 ?auto_301431 ) ) ( not ( = ?auto_301426 ?auto_301432 ) ) ( not ( = ?auto_301427 ?auto_301428 ) ) ( not ( = ?auto_301427 ?auto_301429 ) ) ( not ( = ?auto_301427 ?auto_301430 ) ) ( not ( = ?auto_301427 ?auto_301431 ) ) ( not ( = ?auto_301427 ?auto_301432 ) ) ( not ( = ?auto_301428 ?auto_301429 ) ) ( not ( = ?auto_301428 ?auto_301430 ) ) ( not ( = ?auto_301428 ?auto_301431 ) ) ( not ( = ?auto_301428 ?auto_301432 ) ) ( not ( = ?auto_301429 ?auto_301430 ) ) ( not ( = ?auto_301429 ?auto_301431 ) ) ( not ( = ?auto_301429 ?auto_301432 ) ) ( not ( = ?auto_301430 ?auto_301431 ) ) ( not ( = ?auto_301430 ?auto_301432 ) ) ( not ( = ?auto_301431 ?auto_301432 ) ) ( ON ?auto_301430 ?auto_301431 ) ( ON ?auto_301429 ?auto_301430 ) ( ON ?auto_301428 ?auto_301429 ) ( ON ?auto_301427 ?auto_301428 ) ( CLEAR ?auto_301425 ) ( ON ?auto_301426 ?auto_301427 ) ( CLEAR ?auto_301426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_301424 ?auto_301425 ?auto_301426 )
      ( MAKE-8PILE ?auto_301424 ?auto_301425 ?auto_301426 ?auto_301427 ?auto_301428 ?auto_301429 ?auto_301430 ?auto_301431 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301458 - BLOCK
      ?auto_301459 - BLOCK
      ?auto_301460 - BLOCK
      ?auto_301461 - BLOCK
      ?auto_301462 - BLOCK
      ?auto_301463 - BLOCK
      ?auto_301464 - BLOCK
      ?auto_301465 - BLOCK
    )
    :vars
    (
      ?auto_301466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301465 ?auto_301466 ) ( ON-TABLE ?auto_301458 ) ( not ( = ?auto_301458 ?auto_301459 ) ) ( not ( = ?auto_301458 ?auto_301460 ) ) ( not ( = ?auto_301458 ?auto_301461 ) ) ( not ( = ?auto_301458 ?auto_301462 ) ) ( not ( = ?auto_301458 ?auto_301463 ) ) ( not ( = ?auto_301458 ?auto_301464 ) ) ( not ( = ?auto_301458 ?auto_301465 ) ) ( not ( = ?auto_301458 ?auto_301466 ) ) ( not ( = ?auto_301459 ?auto_301460 ) ) ( not ( = ?auto_301459 ?auto_301461 ) ) ( not ( = ?auto_301459 ?auto_301462 ) ) ( not ( = ?auto_301459 ?auto_301463 ) ) ( not ( = ?auto_301459 ?auto_301464 ) ) ( not ( = ?auto_301459 ?auto_301465 ) ) ( not ( = ?auto_301459 ?auto_301466 ) ) ( not ( = ?auto_301460 ?auto_301461 ) ) ( not ( = ?auto_301460 ?auto_301462 ) ) ( not ( = ?auto_301460 ?auto_301463 ) ) ( not ( = ?auto_301460 ?auto_301464 ) ) ( not ( = ?auto_301460 ?auto_301465 ) ) ( not ( = ?auto_301460 ?auto_301466 ) ) ( not ( = ?auto_301461 ?auto_301462 ) ) ( not ( = ?auto_301461 ?auto_301463 ) ) ( not ( = ?auto_301461 ?auto_301464 ) ) ( not ( = ?auto_301461 ?auto_301465 ) ) ( not ( = ?auto_301461 ?auto_301466 ) ) ( not ( = ?auto_301462 ?auto_301463 ) ) ( not ( = ?auto_301462 ?auto_301464 ) ) ( not ( = ?auto_301462 ?auto_301465 ) ) ( not ( = ?auto_301462 ?auto_301466 ) ) ( not ( = ?auto_301463 ?auto_301464 ) ) ( not ( = ?auto_301463 ?auto_301465 ) ) ( not ( = ?auto_301463 ?auto_301466 ) ) ( not ( = ?auto_301464 ?auto_301465 ) ) ( not ( = ?auto_301464 ?auto_301466 ) ) ( not ( = ?auto_301465 ?auto_301466 ) ) ( ON ?auto_301464 ?auto_301465 ) ( ON ?auto_301463 ?auto_301464 ) ( ON ?auto_301462 ?auto_301463 ) ( ON ?auto_301461 ?auto_301462 ) ( ON ?auto_301460 ?auto_301461 ) ( CLEAR ?auto_301458 ) ( ON ?auto_301459 ?auto_301460 ) ( CLEAR ?auto_301459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_301458 ?auto_301459 )
      ( MAKE-8PILE ?auto_301458 ?auto_301459 ?auto_301460 ?auto_301461 ?auto_301462 ?auto_301463 ?auto_301464 ?auto_301465 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_301492 - BLOCK
      ?auto_301493 - BLOCK
      ?auto_301494 - BLOCK
      ?auto_301495 - BLOCK
      ?auto_301496 - BLOCK
      ?auto_301497 - BLOCK
      ?auto_301498 - BLOCK
      ?auto_301499 - BLOCK
    )
    :vars
    (
      ?auto_301500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301499 ?auto_301500 ) ( not ( = ?auto_301492 ?auto_301493 ) ) ( not ( = ?auto_301492 ?auto_301494 ) ) ( not ( = ?auto_301492 ?auto_301495 ) ) ( not ( = ?auto_301492 ?auto_301496 ) ) ( not ( = ?auto_301492 ?auto_301497 ) ) ( not ( = ?auto_301492 ?auto_301498 ) ) ( not ( = ?auto_301492 ?auto_301499 ) ) ( not ( = ?auto_301492 ?auto_301500 ) ) ( not ( = ?auto_301493 ?auto_301494 ) ) ( not ( = ?auto_301493 ?auto_301495 ) ) ( not ( = ?auto_301493 ?auto_301496 ) ) ( not ( = ?auto_301493 ?auto_301497 ) ) ( not ( = ?auto_301493 ?auto_301498 ) ) ( not ( = ?auto_301493 ?auto_301499 ) ) ( not ( = ?auto_301493 ?auto_301500 ) ) ( not ( = ?auto_301494 ?auto_301495 ) ) ( not ( = ?auto_301494 ?auto_301496 ) ) ( not ( = ?auto_301494 ?auto_301497 ) ) ( not ( = ?auto_301494 ?auto_301498 ) ) ( not ( = ?auto_301494 ?auto_301499 ) ) ( not ( = ?auto_301494 ?auto_301500 ) ) ( not ( = ?auto_301495 ?auto_301496 ) ) ( not ( = ?auto_301495 ?auto_301497 ) ) ( not ( = ?auto_301495 ?auto_301498 ) ) ( not ( = ?auto_301495 ?auto_301499 ) ) ( not ( = ?auto_301495 ?auto_301500 ) ) ( not ( = ?auto_301496 ?auto_301497 ) ) ( not ( = ?auto_301496 ?auto_301498 ) ) ( not ( = ?auto_301496 ?auto_301499 ) ) ( not ( = ?auto_301496 ?auto_301500 ) ) ( not ( = ?auto_301497 ?auto_301498 ) ) ( not ( = ?auto_301497 ?auto_301499 ) ) ( not ( = ?auto_301497 ?auto_301500 ) ) ( not ( = ?auto_301498 ?auto_301499 ) ) ( not ( = ?auto_301498 ?auto_301500 ) ) ( not ( = ?auto_301499 ?auto_301500 ) ) ( ON ?auto_301498 ?auto_301499 ) ( ON ?auto_301497 ?auto_301498 ) ( ON ?auto_301496 ?auto_301497 ) ( ON ?auto_301495 ?auto_301496 ) ( ON ?auto_301494 ?auto_301495 ) ( ON ?auto_301493 ?auto_301494 ) ( ON ?auto_301492 ?auto_301493 ) ( CLEAR ?auto_301492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_301492 )
      ( MAKE-8PILE ?auto_301492 ?auto_301493 ?auto_301494 ?auto_301495 ?auto_301496 ?auto_301497 ?auto_301498 ?auto_301499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301527 - BLOCK
      ?auto_301528 - BLOCK
      ?auto_301529 - BLOCK
      ?auto_301530 - BLOCK
      ?auto_301531 - BLOCK
      ?auto_301532 - BLOCK
      ?auto_301533 - BLOCK
      ?auto_301534 - BLOCK
      ?auto_301535 - BLOCK
    )
    :vars
    (
      ?auto_301536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_301534 ) ( ON ?auto_301535 ?auto_301536 ) ( CLEAR ?auto_301535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_301527 ) ( ON ?auto_301528 ?auto_301527 ) ( ON ?auto_301529 ?auto_301528 ) ( ON ?auto_301530 ?auto_301529 ) ( ON ?auto_301531 ?auto_301530 ) ( ON ?auto_301532 ?auto_301531 ) ( ON ?auto_301533 ?auto_301532 ) ( ON ?auto_301534 ?auto_301533 ) ( not ( = ?auto_301527 ?auto_301528 ) ) ( not ( = ?auto_301527 ?auto_301529 ) ) ( not ( = ?auto_301527 ?auto_301530 ) ) ( not ( = ?auto_301527 ?auto_301531 ) ) ( not ( = ?auto_301527 ?auto_301532 ) ) ( not ( = ?auto_301527 ?auto_301533 ) ) ( not ( = ?auto_301527 ?auto_301534 ) ) ( not ( = ?auto_301527 ?auto_301535 ) ) ( not ( = ?auto_301527 ?auto_301536 ) ) ( not ( = ?auto_301528 ?auto_301529 ) ) ( not ( = ?auto_301528 ?auto_301530 ) ) ( not ( = ?auto_301528 ?auto_301531 ) ) ( not ( = ?auto_301528 ?auto_301532 ) ) ( not ( = ?auto_301528 ?auto_301533 ) ) ( not ( = ?auto_301528 ?auto_301534 ) ) ( not ( = ?auto_301528 ?auto_301535 ) ) ( not ( = ?auto_301528 ?auto_301536 ) ) ( not ( = ?auto_301529 ?auto_301530 ) ) ( not ( = ?auto_301529 ?auto_301531 ) ) ( not ( = ?auto_301529 ?auto_301532 ) ) ( not ( = ?auto_301529 ?auto_301533 ) ) ( not ( = ?auto_301529 ?auto_301534 ) ) ( not ( = ?auto_301529 ?auto_301535 ) ) ( not ( = ?auto_301529 ?auto_301536 ) ) ( not ( = ?auto_301530 ?auto_301531 ) ) ( not ( = ?auto_301530 ?auto_301532 ) ) ( not ( = ?auto_301530 ?auto_301533 ) ) ( not ( = ?auto_301530 ?auto_301534 ) ) ( not ( = ?auto_301530 ?auto_301535 ) ) ( not ( = ?auto_301530 ?auto_301536 ) ) ( not ( = ?auto_301531 ?auto_301532 ) ) ( not ( = ?auto_301531 ?auto_301533 ) ) ( not ( = ?auto_301531 ?auto_301534 ) ) ( not ( = ?auto_301531 ?auto_301535 ) ) ( not ( = ?auto_301531 ?auto_301536 ) ) ( not ( = ?auto_301532 ?auto_301533 ) ) ( not ( = ?auto_301532 ?auto_301534 ) ) ( not ( = ?auto_301532 ?auto_301535 ) ) ( not ( = ?auto_301532 ?auto_301536 ) ) ( not ( = ?auto_301533 ?auto_301534 ) ) ( not ( = ?auto_301533 ?auto_301535 ) ) ( not ( = ?auto_301533 ?auto_301536 ) ) ( not ( = ?auto_301534 ?auto_301535 ) ) ( not ( = ?auto_301534 ?auto_301536 ) ) ( not ( = ?auto_301535 ?auto_301536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_301535 ?auto_301536 )
      ( !STACK ?auto_301535 ?auto_301534 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301565 - BLOCK
      ?auto_301566 - BLOCK
      ?auto_301567 - BLOCK
      ?auto_301568 - BLOCK
      ?auto_301569 - BLOCK
      ?auto_301570 - BLOCK
      ?auto_301571 - BLOCK
      ?auto_301572 - BLOCK
      ?auto_301573 - BLOCK
    )
    :vars
    (
      ?auto_301574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301573 ?auto_301574 ) ( ON-TABLE ?auto_301565 ) ( ON ?auto_301566 ?auto_301565 ) ( ON ?auto_301567 ?auto_301566 ) ( ON ?auto_301568 ?auto_301567 ) ( ON ?auto_301569 ?auto_301568 ) ( ON ?auto_301570 ?auto_301569 ) ( ON ?auto_301571 ?auto_301570 ) ( not ( = ?auto_301565 ?auto_301566 ) ) ( not ( = ?auto_301565 ?auto_301567 ) ) ( not ( = ?auto_301565 ?auto_301568 ) ) ( not ( = ?auto_301565 ?auto_301569 ) ) ( not ( = ?auto_301565 ?auto_301570 ) ) ( not ( = ?auto_301565 ?auto_301571 ) ) ( not ( = ?auto_301565 ?auto_301572 ) ) ( not ( = ?auto_301565 ?auto_301573 ) ) ( not ( = ?auto_301565 ?auto_301574 ) ) ( not ( = ?auto_301566 ?auto_301567 ) ) ( not ( = ?auto_301566 ?auto_301568 ) ) ( not ( = ?auto_301566 ?auto_301569 ) ) ( not ( = ?auto_301566 ?auto_301570 ) ) ( not ( = ?auto_301566 ?auto_301571 ) ) ( not ( = ?auto_301566 ?auto_301572 ) ) ( not ( = ?auto_301566 ?auto_301573 ) ) ( not ( = ?auto_301566 ?auto_301574 ) ) ( not ( = ?auto_301567 ?auto_301568 ) ) ( not ( = ?auto_301567 ?auto_301569 ) ) ( not ( = ?auto_301567 ?auto_301570 ) ) ( not ( = ?auto_301567 ?auto_301571 ) ) ( not ( = ?auto_301567 ?auto_301572 ) ) ( not ( = ?auto_301567 ?auto_301573 ) ) ( not ( = ?auto_301567 ?auto_301574 ) ) ( not ( = ?auto_301568 ?auto_301569 ) ) ( not ( = ?auto_301568 ?auto_301570 ) ) ( not ( = ?auto_301568 ?auto_301571 ) ) ( not ( = ?auto_301568 ?auto_301572 ) ) ( not ( = ?auto_301568 ?auto_301573 ) ) ( not ( = ?auto_301568 ?auto_301574 ) ) ( not ( = ?auto_301569 ?auto_301570 ) ) ( not ( = ?auto_301569 ?auto_301571 ) ) ( not ( = ?auto_301569 ?auto_301572 ) ) ( not ( = ?auto_301569 ?auto_301573 ) ) ( not ( = ?auto_301569 ?auto_301574 ) ) ( not ( = ?auto_301570 ?auto_301571 ) ) ( not ( = ?auto_301570 ?auto_301572 ) ) ( not ( = ?auto_301570 ?auto_301573 ) ) ( not ( = ?auto_301570 ?auto_301574 ) ) ( not ( = ?auto_301571 ?auto_301572 ) ) ( not ( = ?auto_301571 ?auto_301573 ) ) ( not ( = ?auto_301571 ?auto_301574 ) ) ( not ( = ?auto_301572 ?auto_301573 ) ) ( not ( = ?auto_301572 ?auto_301574 ) ) ( not ( = ?auto_301573 ?auto_301574 ) ) ( CLEAR ?auto_301571 ) ( ON ?auto_301572 ?auto_301573 ) ( CLEAR ?auto_301572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_301565 ?auto_301566 ?auto_301567 ?auto_301568 ?auto_301569 ?auto_301570 ?auto_301571 ?auto_301572 )
      ( MAKE-9PILE ?auto_301565 ?auto_301566 ?auto_301567 ?auto_301568 ?auto_301569 ?auto_301570 ?auto_301571 ?auto_301572 ?auto_301573 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301603 - BLOCK
      ?auto_301604 - BLOCK
      ?auto_301605 - BLOCK
      ?auto_301606 - BLOCK
      ?auto_301607 - BLOCK
      ?auto_301608 - BLOCK
      ?auto_301609 - BLOCK
      ?auto_301610 - BLOCK
      ?auto_301611 - BLOCK
    )
    :vars
    (
      ?auto_301612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301611 ?auto_301612 ) ( ON-TABLE ?auto_301603 ) ( ON ?auto_301604 ?auto_301603 ) ( ON ?auto_301605 ?auto_301604 ) ( ON ?auto_301606 ?auto_301605 ) ( ON ?auto_301607 ?auto_301606 ) ( ON ?auto_301608 ?auto_301607 ) ( not ( = ?auto_301603 ?auto_301604 ) ) ( not ( = ?auto_301603 ?auto_301605 ) ) ( not ( = ?auto_301603 ?auto_301606 ) ) ( not ( = ?auto_301603 ?auto_301607 ) ) ( not ( = ?auto_301603 ?auto_301608 ) ) ( not ( = ?auto_301603 ?auto_301609 ) ) ( not ( = ?auto_301603 ?auto_301610 ) ) ( not ( = ?auto_301603 ?auto_301611 ) ) ( not ( = ?auto_301603 ?auto_301612 ) ) ( not ( = ?auto_301604 ?auto_301605 ) ) ( not ( = ?auto_301604 ?auto_301606 ) ) ( not ( = ?auto_301604 ?auto_301607 ) ) ( not ( = ?auto_301604 ?auto_301608 ) ) ( not ( = ?auto_301604 ?auto_301609 ) ) ( not ( = ?auto_301604 ?auto_301610 ) ) ( not ( = ?auto_301604 ?auto_301611 ) ) ( not ( = ?auto_301604 ?auto_301612 ) ) ( not ( = ?auto_301605 ?auto_301606 ) ) ( not ( = ?auto_301605 ?auto_301607 ) ) ( not ( = ?auto_301605 ?auto_301608 ) ) ( not ( = ?auto_301605 ?auto_301609 ) ) ( not ( = ?auto_301605 ?auto_301610 ) ) ( not ( = ?auto_301605 ?auto_301611 ) ) ( not ( = ?auto_301605 ?auto_301612 ) ) ( not ( = ?auto_301606 ?auto_301607 ) ) ( not ( = ?auto_301606 ?auto_301608 ) ) ( not ( = ?auto_301606 ?auto_301609 ) ) ( not ( = ?auto_301606 ?auto_301610 ) ) ( not ( = ?auto_301606 ?auto_301611 ) ) ( not ( = ?auto_301606 ?auto_301612 ) ) ( not ( = ?auto_301607 ?auto_301608 ) ) ( not ( = ?auto_301607 ?auto_301609 ) ) ( not ( = ?auto_301607 ?auto_301610 ) ) ( not ( = ?auto_301607 ?auto_301611 ) ) ( not ( = ?auto_301607 ?auto_301612 ) ) ( not ( = ?auto_301608 ?auto_301609 ) ) ( not ( = ?auto_301608 ?auto_301610 ) ) ( not ( = ?auto_301608 ?auto_301611 ) ) ( not ( = ?auto_301608 ?auto_301612 ) ) ( not ( = ?auto_301609 ?auto_301610 ) ) ( not ( = ?auto_301609 ?auto_301611 ) ) ( not ( = ?auto_301609 ?auto_301612 ) ) ( not ( = ?auto_301610 ?auto_301611 ) ) ( not ( = ?auto_301610 ?auto_301612 ) ) ( not ( = ?auto_301611 ?auto_301612 ) ) ( ON ?auto_301610 ?auto_301611 ) ( CLEAR ?auto_301608 ) ( ON ?auto_301609 ?auto_301610 ) ( CLEAR ?auto_301609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_301603 ?auto_301604 ?auto_301605 ?auto_301606 ?auto_301607 ?auto_301608 ?auto_301609 )
      ( MAKE-9PILE ?auto_301603 ?auto_301604 ?auto_301605 ?auto_301606 ?auto_301607 ?auto_301608 ?auto_301609 ?auto_301610 ?auto_301611 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301641 - BLOCK
      ?auto_301642 - BLOCK
      ?auto_301643 - BLOCK
      ?auto_301644 - BLOCK
      ?auto_301645 - BLOCK
      ?auto_301646 - BLOCK
      ?auto_301647 - BLOCK
      ?auto_301648 - BLOCK
      ?auto_301649 - BLOCK
    )
    :vars
    (
      ?auto_301650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301649 ?auto_301650 ) ( ON-TABLE ?auto_301641 ) ( ON ?auto_301642 ?auto_301641 ) ( ON ?auto_301643 ?auto_301642 ) ( ON ?auto_301644 ?auto_301643 ) ( ON ?auto_301645 ?auto_301644 ) ( not ( = ?auto_301641 ?auto_301642 ) ) ( not ( = ?auto_301641 ?auto_301643 ) ) ( not ( = ?auto_301641 ?auto_301644 ) ) ( not ( = ?auto_301641 ?auto_301645 ) ) ( not ( = ?auto_301641 ?auto_301646 ) ) ( not ( = ?auto_301641 ?auto_301647 ) ) ( not ( = ?auto_301641 ?auto_301648 ) ) ( not ( = ?auto_301641 ?auto_301649 ) ) ( not ( = ?auto_301641 ?auto_301650 ) ) ( not ( = ?auto_301642 ?auto_301643 ) ) ( not ( = ?auto_301642 ?auto_301644 ) ) ( not ( = ?auto_301642 ?auto_301645 ) ) ( not ( = ?auto_301642 ?auto_301646 ) ) ( not ( = ?auto_301642 ?auto_301647 ) ) ( not ( = ?auto_301642 ?auto_301648 ) ) ( not ( = ?auto_301642 ?auto_301649 ) ) ( not ( = ?auto_301642 ?auto_301650 ) ) ( not ( = ?auto_301643 ?auto_301644 ) ) ( not ( = ?auto_301643 ?auto_301645 ) ) ( not ( = ?auto_301643 ?auto_301646 ) ) ( not ( = ?auto_301643 ?auto_301647 ) ) ( not ( = ?auto_301643 ?auto_301648 ) ) ( not ( = ?auto_301643 ?auto_301649 ) ) ( not ( = ?auto_301643 ?auto_301650 ) ) ( not ( = ?auto_301644 ?auto_301645 ) ) ( not ( = ?auto_301644 ?auto_301646 ) ) ( not ( = ?auto_301644 ?auto_301647 ) ) ( not ( = ?auto_301644 ?auto_301648 ) ) ( not ( = ?auto_301644 ?auto_301649 ) ) ( not ( = ?auto_301644 ?auto_301650 ) ) ( not ( = ?auto_301645 ?auto_301646 ) ) ( not ( = ?auto_301645 ?auto_301647 ) ) ( not ( = ?auto_301645 ?auto_301648 ) ) ( not ( = ?auto_301645 ?auto_301649 ) ) ( not ( = ?auto_301645 ?auto_301650 ) ) ( not ( = ?auto_301646 ?auto_301647 ) ) ( not ( = ?auto_301646 ?auto_301648 ) ) ( not ( = ?auto_301646 ?auto_301649 ) ) ( not ( = ?auto_301646 ?auto_301650 ) ) ( not ( = ?auto_301647 ?auto_301648 ) ) ( not ( = ?auto_301647 ?auto_301649 ) ) ( not ( = ?auto_301647 ?auto_301650 ) ) ( not ( = ?auto_301648 ?auto_301649 ) ) ( not ( = ?auto_301648 ?auto_301650 ) ) ( not ( = ?auto_301649 ?auto_301650 ) ) ( ON ?auto_301648 ?auto_301649 ) ( ON ?auto_301647 ?auto_301648 ) ( CLEAR ?auto_301645 ) ( ON ?auto_301646 ?auto_301647 ) ( CLEAR ?auto_301646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_301641 ?auto_301642 ?auto_301643 ?auto_301644 ?auto_301645 ?auto_301646 )
      ( MAKE-9PILE ?auto_301641 ?auto_301642 ?auto_301643 ?auto_301644 ?auto_301645 ?auto_301646 ?auto_301647 ?auto_301648 ?auto_301649 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301679 - BLOCK
      ?auto_301680 - BLOCK
      ?auto_301681 - BLOCK
      ?auto_301682 - BLOCK
      ?auto_301683 - BLOCK
      ?auto_301684 - BLOCK
      ?auto_301685 - BLOCK
      ?auto_301686 - BLOCK
      ?auto_301687 - BLOCK
    )
    :vars
    (
      ?auto_301688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301687 ?auto_301688 ) ( ON-TABLE ?auto_301679 ) ( ON ?auto_301680 ?auto_301679 ) ( ON ?auto_301681 ?auto_301680 ) ( ON ?auto_301682 ?auto_301681 ) ( not ( = ?auto_301679 ?auto_301680 ) ) ( not ( = ?auto_301679 ?auto_301681 ) ) ( not ( = ?auto_301679 ?auto_301682 ) ) ( not ( = ?auto_301679 ?auto_301683 ) ) ( not ( = ?auto_301679 ?auto_301684 ) ) ( not ( = ?auto_301679 ?auto_301685 ) ) ( not ( = ?auto_301679 ?auto_301686 ) ) ( not ( = ?auto_301679 ?auto_301687 ) ) ( not ( = ?auto_301679 ?auto_301688 ) ) ( not ( = ?auto_301680 ?auto_301681 ) ) ( not ( = ?auto_301680 ?auto_301682 ) ) ( not ( = ?auto_301680 ?auto_301683 ) ) ( not ( = ?auto_301680 ?auto_301684 ) ) ( not ( = ?auto_301680 ?auto_301685 ) ) ( not ( = ?auto_301680 ?auto_301686 ) ) ( not ( = ?auto_301680 ?auto_301687 ) ) ( not ( = ?auto_301680 ?auto_301688 ) ) ( not ( = ?auto_301681 ?auto_301682 ) ) ( not ( = ?auto_301681 ?auto_301683 ) ) ( not ( = ?auto_301681 ?auto_301684 ) ) ( not ( = ?auto_301681 ?auto_301685 ) ) ( not ( = ?auto_301681 ?auto_301686 ) ) ( not ( = ?auto_301681 ?auto_301687 ) ) ( not ( = ?auto_301681 ?auto_301688 ) ) ( not ( = ?auto_301682 ?auto_301683 ) ) ( not ( = ?auto_301682 ?auto_301684 ) ) ( not ( = ?auto_301682 ?auto_301685 ) ) ( not ( = ?auto_301682 ?auto_301686 ) ) ( not ( = ?auto_301682 ?auto_301687 ) ) ( not ( = ?auto_301682 ?auto_301688 ) ) ( not ( = ?auto_301683 ?auto_301684 ) ) ( not ( = ?auto_301683 ?auto_301685 ) ) ( not ( = ?auto_301683 ?auto_301686 ) ) ( not ( = ?auto_301683 ?auto_301687 ) ) ( not ( = ?auto_301683 ?auto_301688 ) ) ( not ( = ?auto_301684 ?auto_301685 ) ) ( not ( = ?auto_301684 ?auto_301686 ) ) ( not ( = ?auto_301684 ?auto_301687 ) ) ( not ( = ?auto_301684 ?auto_301688 ) ) ( not ( = ?auto_301685 ?auto_301686 ) ) ( not ( = ?auto_301685 ?auto_301687 ) ) ( not ( = ?auto_301685 ?auto_301688 ) ) ( not ( = ?auto_301686 ?auto_301687 ) ) ( not ( = ?auto_301686 ?auto_301688 ) ) ( not ( = ?auto_301687 ?auto_301688 ) ) ( ON ?auto_301686 ?auto_301687 ) ( ON ?auto_301685 ?auto_301686 ) ( ON ?auto_301684 ?auto_301685 ) ( CLEAR ?auto_301682 ) ( ON ?auto_301683 ?auto_301684 ) ( CLEAR ?auto_301683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_301679 ?auto_301680 ?auto_301681 ?auto_301682 ?auto_301683 )
      ( MAKE-9PILE ?auto_301679 ?auto_301680 ?auto_301681 ?auto_301682 ?auto_301683 ?auto_301684 ?auto_301685 ?auto_301686 ?auto_301687 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301717 - BLOCK
      ?auto_301718 - BLOCK
      ?auto_301719 - BLOCK
      ?auto_301720 - BLOCK
      ?auto_301721 - BLOCK
      ?auto_301722 - BLOCK
      ?auto_301723 - BLOCK
      ?auto_301724 - BLOCK
      ?auto_301725 - BLOCK
    )
    :vars
    (
      ?auto_301726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301725 ?auto_301726 ) ( ON-TABLE ?auto_301717 ) ( ON ?auto_301718 ?auto_301717 ) ( ON ?auto_301719 ?auto_301718 ) ( not ( = ?auto_301717 ?auto_301718 ) ) ( not ( = ?auto_301717 ?auto_301719 ) ) ( not ( = ?auto_301717 ?auto_301720 ) ) ( not ( = ?auto_301717 ?auto_301721 ) ) ( not ( = ?auto_301717 ?auto_301722 ) ) ( not ( = ?auto_301717 ?auto_301723 ) ) ( not ( = ?auto_301717 ?auto_301724 ) ) ( not ( = ?auto_301717 ?auto_301725 ) ) ( not ( = ?auto_301717 ?auto_301726 ) ) ( not ( = ?auto_301718 ?auto_301719 ) ) ( not ( = ?auto_301718 ?auto_301720 ) ) ( not ( = ?auto_301718 ?auto_301721 ) ) ( not ( = ?auto_301718 ?auto_301722 ) ) ( not ( = ?auto_301718 ?auto_301723 ) ) ( not ( = ?auto_301718 ?auto_301724 ) ) ( not ( = ?auto_301718 ?auto_301725 ) ) ( not ( = ?auto_301718 ?auto_301726 ) ) ( not ( = ?auto_301719 ?auto_301720 ) ) ( not ( = ?auto_301719 ?auto_301721 ) ) ( not ( = ?auto_301719 ?auto_301722 ) ) ( not ( = ?auto_301719 ?auto_301723 ) ) ( not ( = ?auto_301719 ?auto_301724 ) ) ( not ( = ?auto_301719 ?auto_301725 ) ) ( not ( = ?auto_301719 ?auto_301726 ) ) ( not ( = ?auto_301720 ?auto_301721 ) ) ( not ( = ?auto_301720 ?auto_301722 ) ) ( not ( = ?auto_301720 ?auto_301723 ) ) ( not ( = ?auto_301720 ?auto_301724 ) ) ( not ( = ?auto_301720 ?auto_301725 ) ) ( not ( = ?auto_301720 ?auto_301726 ) ) ( not ( = ?auto_301721 ?auto_301722 ) ) ( not ( = ?auto_301721 ?auto_301723 ) ) ( not ( = ?auto_301721 ?auto_301724 ) ) ( not ( = ?auto_301721 ?auto_301725 ) ) ( not ( = ?auto_301721 ?auto_301726 ) ) ( not ( = ?auto_301722 ?auto_301723 ) ) ( not ( = ?auto_301722 ?auto_301724 ) ) ( not ( = ?auto_301722 ?auto_301725 ) ) ( not ( = ?auto_301722 ?auto_301726 ) ) ( not ( = ?auto_301723 ?auto_301724 ) ) ( not ( = ?auto_301723 ?auto_301725 ) ) ( not ( = ?auto_301723 ?auto_301726 ) ) ( not ( = ?auto_301724 ?auto_301725 ) ) ( not ( = ?auto_301724 ?auto_301726 ) ) ( not ( = ?auto_301725 ?auto_301726 ) ) ( ON ?auto_301724 ?auto_301725 ) ( ON ?auto_301723 ?auto_301724 ) ( ON ?auto_301722 ?auto_301723 ) ( ON ?auto_301721 ?auto_301722 ) ( CLEAR ?auto_301719 ) ( ON ?auto_301720 ?auto_301721 ) ( CLEAR ?auto_301720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_301717 ?auto_301718 ?auto_301719 ?auto_301720 )
      ( MAKE-9PILE ?auto_301717 ?auto_301718 ?auto_301719 ?auto_301720 ?auto_301721 ?auto_301722 ?auto_301723 ?auto_301724 ?auto_301725 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301755 - BLOCK
      ?auto_301756 - BLOCK
      ?auto_301757 - BLOCK
      ?auto_301758 - BLOCK
      ?auto_301759 - BLOCK
      ?auto_301760 - BLOCK
      ?auto_301761 - BLOCK
      ?auto_301762 - BLOCK
      ?auto_301763 - BLOCK
    )
    :vars
    (
      ?auto_301764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301763 ?auto_301764 ) ( ON-TABLE ?auto_301755 ) ( ON ?auto_301756 ?auto_301755 ) ( not ( = ?auto_301755 ?auto_301756 ) ) ( not ( = ?auto_301755 ?auto_301757 ) ) ( not ( = ?auto_301755 ?auto_301758 ) ) ( not ( = ?auto_301755 ?auto_301759 ) ) ( not ( = ?auto_301755 ?auto_301760 ) ) ( not ( = ?auto_301755 ?auto_301761 ) ) ( not ( = ?auto_301755 ?auto_301762 ) ) ( not ( = ?auto_301755 ?auto_301763 ) ) ( not ( = ?auto_301755 ?auto_301764 ) ) ( not ( = ?auto_301756 ?auto_301757 ) ) ( not ( = ?auto_301756 ?auto_301758 ) ) ( not ( = ?auto_301756 ?auto_301759 ) ) ( not ( = ?auto_301756 ?auto_301760 ) ) ( not ( = ?auto_301756 ?auto_301761 ) ) ( not ( = ?auto_301756 ?auto_301762 ) ) ( not ( = ?auto_301756 ?auto_301763 ) ) ( not ( = ?auto_301756 ?auto_301764 ) ) ( not ( = ?auto_301757 ?auto_301758 ) ) ( not ( = ?auto_301757 ?auto_301759 ) ) ( not ( = ?auto_301757 ?auto_301760 ) ) ( not ( = ?auto_301757 ?auto_301761 ) ) ( not ( = ?auto_301757 ?auto_301762 ) ) ( not ( = ?auto_301757 ?auto_301763 ) ) ( not ( = ?auto_301757 ?auto_301764 ) ) ( not ( = ?auto_301758 ?auto_301759 ) ) ( not ( = ?auto_301758 ?auto_301760 ) ) ( not ( = ?auto_301758 ?auto_301761 ) ) ( not ( = ?auto_301758 ?auto_301762 ) ) ( not ( = ?auto_301758 ?auto_301763 ) ) ( not ( = ?auto_301758 ?auto_301764 ) ) ( not ( = ?auto_301759 ?auto_301760 ) ) ( not ( = ?auto_301759 ?auto_301761 ) ) ( not ( = ?auto_301759 ?auto_301762 ) ) ( not ( = ?auto_301759 ?auto_301763 ) ) ( not ( = ?auto_301759 ?auto_301764 ) ) ( not ( = ?auto_301760 ?auto_301761 ) ) ( not ( = ?auto_301760 ?auto_301762 ) ) ( not ( = ?auto_301760 ?auto_301763 ) ) ( not ( = ?auto_301760 ?auto_301764 ) ) ( not ( = ?auto_301761 ?auto_301762 ) ) ( not ( = ?auto_301761 ?auto_301763 ) ) ( not ( = ?auto_301761 ?auto_301764 ) ) ( not ( = ?auto_301762 ?auto_301763 ) ) ( not ( = ?auto_301762 ?auto_301764 ) ) ( not ( = ?auto_301763 ?auto_301764 ) ) ( ON ?auto_301762 ?auto_301763 ) ( ON ?auto_301761 ?auto_301762 ) ( ON ?auto_301760 ?auto_301761 ) ( ON ?auto_301759 ?auto_301760 ) ( ON ?auto_301758 ?auto_301759 ) ( CLEAR ?auto_301756 ) ( ON ?auto_301757 ?auto_301758 ) ( CLEAR ?auto_301757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_301755 ?auto_301756 ?auto_301757 )
      ( MAKE-9PILE ?auto_301755 ?auto_301756 ?auto_301757 ?auto_301758 ?auto_301759 ?auto_301760 ?auto_301761 ?auto_301762 ?auto_301763 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301793 - BLOCK
      ?auto_301794 - BLOCK
      ?auto_301795 - BLOCK
      ?auto_301796 - BLOCK
      ?auto_301797 - BLOCK
      ?auto_301798 - BLOCK
      ?auto_301799 - BLOCK
      ?auto_301800 - BLOCK
      ?auto_301801 - BLOCK
    )
    :vars
    (
      ?auto_301802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301801 ?auto_301802 ) ( ON-TABLE ?auto_301793 ) ( not ( = ?auto_301793 ?auto_301794 ) ) ( not ( = ?auto_301793 ?auto_301795 ) ) ( not ( = ?auto_301793 ?auto_301796 ) ) ( not ( = ?auto_301793 ?auto_301797 ) ) ( not ( = ?auto_301793 ?auto_301798 ) ) ( not ( = ?auto_301793 ?auto_301799 ) ) ( not ( = ?auto_301793 ?auto_301800 ) ) ( not ( = ?auto_301793 ?auto_301801 ) ) ( not ( = ?auto_301793 ?auto_301802 ) ) ( not ( = ?auto_301794 ?auto_301795 ) ) ( not ( = ?auto_301794 ?auto_301796 ) ) ( not ( = ?auto_301794 ?auto_301797 ) ) ( not ( = ?auto_301794 ?auto_301798 ) ) ( not ( = ?auto_301794 ?auto_301799 ) ) ( not ( = ?auto_301794 ?auto_301800 ) ) ( not ( = ?auto_301794 ?auto_301801 ) ) ( not ( = ?auto_301794 ?auto_301802 ) ) ( not ( = ?auto_301795 ?auto_301796 ) ) ( not ( = ?auto_301795 ?auto_301797 ) ) ( not ( = ?auto_301795 ?auto_301798 ) ) ( not ( = ?auto_301795 ?auto_301799 ) ) ( not ( = ?auto_301795 ?auto_301800 ) ) ( not ( = ?auto_301795 ?auto_301801 ) ) ( not ( = ?auto_301795 ?auto_301802 ) ) ( not ( = ?auto_301796 ?auto_301797 ) ) ( not ( = ?auto_301796 ?auto_301798 ) ) ( not ( = ?auto_301796 ?auto_301799 ) ) ( not ( = ?auto_301796 ?auto_301800 ) ) ( not ( = ?auto_301796 ?auto_301801 ) ) ( not ( = ?auto_301796 ?auto_301802 ) ) ( not ( = ?auto_301797 ?auto_301798 ) ) ( not ( = ?auto_301797 ?auto_301799 ) ) ( not ( = ?auto_301797 ?auto_301800 ) ) ( not ( = ?auto_301797 ?auto_301801 ) ) ( not ( = ?auto_301797 ?auto_301802 ) ) ( not ( = ?auto_301798 ?auto_301799 ) ) ( not ( = ?auto_301798 ?auto_301800 ) ) ( not ( = ?auto_301798 ?auto_301801 ) ) ( not ( = ?auto_301798 ?auto_301802 ) ) ( not ( = ?auto_301799 ?auto_301800 ) ) ( not ( = ?auto_301799 ?auto_301801 ) ) ( not ( = ?auto_301799 ?auto_301802 ) ) ( not ( = ?auto_301800 ?auto_301801 ) ) ( not ( = ?auto_301800 ?auto_301802 ) ) ( not ( = ?auto_301801 ?auto_301802 ) ) ( ON ?auto_301800 ?auto_301801 ) ( ON ?auto_301799 ?auto_301800 ) ( ON ?auto_301798 ?auto_301799 ) ( ON ?auto_301797 ?auto_301798 ) ( ON ?auto_301796 ?auto_301797 ) ( ON ?auto_301795 ?auto_301796 ) ( CLEAR ?auto_301793 ) ( ON ?auto_301794 ?auto_301795 ) ( CLEAR ?auto_301794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_301793 ?auto_301794 )
      ( MAKE-9PILE ?auto_301793 ?auto_301794 ?auto_301795 ?auto_301796 ?auto_301797 ?auto_301798 ?auto_301799 ?auto_301800 ?auto_301801 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_301831 - BLOCK
      ?auto_301832 - BLOCK
      ?auto_301833 - BLOCK
      ?auto_301834 - BLOCK
      ?auto_301835 - BLOCK
      ?auto_301836 - BLOCK
      ?auto_301837 - BLOCK
      ?auto_301838 - BLOCK
      ?auto_301839 - BLOCK
    )
    :vars
    (
      ?auto_301840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301839 ?auto_301840 ) ( not ( = ?auto_301831 ?auto_301832 ) ) ( not ( = ?auto_301831 ?auto_301833 ) ) ( not ( = ?auto_301831 ?auto_301834 ) ) ( not ( = ?auto_301831 ?auto_301835 ) ) ( not ( = ?auto_301831 ?auto_301836 ) ) ( not ( = ?auto_301831 ?auto_301837 ) ) ( not ( = ?auto_301831 ?auto_301838 ) ) ( not ( = ?auto_301831 ?auto_301839 ) ) ( not ( = ?auto_301831 ?auto_301840 ) ) ( not ( = ?auto_301832 ?auto_301833 ) ) ( not ( = ?auto_301832 ?auto_301834 ) ) ( not ( = ?auto_301832 ?auto_301835 ) ) ( not ( = ?auto_301832 ?auto_301836 ) ) ( not ( = ?auto_301832 ?auto_301837 ) ) ( not ( = ?auto_301832 ?auto_301838 ) ) ( not ( = ?auto_301832 ?auto_301839 ) ) ( not ( = ?auto_301832 ?auto_301840 ) ) ( not ( = ?auto_301833 ?auto_301834 ) ) ( not ( = ?auto_301833 ?auto_301835 ) ) ( not ( = ?auto_301833 ?auto_301836 ) ) ( not ( = ?auto_301833 ?auto_301837 ) ) ( not ( = ?auto_301833 ?auto_301838 ) ) ( not ( = ?auto_301833 ?auto_301839 ) ) ( not ( = ?auto_301833 ?auto_301840 ) ) ( not ( = ?auto_301834 ?auto_301835 ) ) ( not ( = ?auto_301834 ?auto_301836 ) ) ( not ( = ?auto_301834 ?auto_301837 ) ) ( not ( = ?auto_301834 ?auto_301838 ) ) ( not ( = ?auto_301834 ?auto_301839 ) ) ( not ( = ?auto_301834 ?auto_301840 ) ) ( not ( = ?auto_301835 ?auto_301836 ) ) ( not ( = ?auto_301835 ?auto_301837 ) ) ( not ( = ?auto_301835 ?auto_301838 ) ) ( not ( = ?auto_301835 ?auto_301839 ) ) ( not ( = ?auto_301835 ?auto_301840 ) ) ( not ( = ?auto_301836 ?auto_301837 ) ) ( not ( = ?auto_301836 ?auto_301838 ) ) ( not ( = ?auto_301836 ?auto_301839 ) ) ( not ( = ?auto_301836 ?auto_301840 ) ) ( not ( = ?auto_301837 ?auto_301838 ) ) ( not ( = ?auto_301837 ?auto_301839 ) ) ( not ( = ?auto_301837 ?auto_301840 ) ) ( not ( = ?auto_301838 ?auto_301839 ) ) ( not ( = ?auto_301838 ?auto_301840 ) ) ( not ( = ?auto_301839 ?auto_301840 ) ) ( ON ?auto_301838 ?auto_301839 ) ( ON ?auto_301837 ?auto_301838 ) ( ON ?auto_301836 ?auto_301837 ) ( ON ?auto_301835 ?auto_301836 ) ( ON ?auto_301834 ?auto_301835 ) ( ON ?auto_301833 ?auto_301834 ) ( ON ?auto_301832 ?auto_301833 ) ( ON ?auto_301831 ?auto_301832 ) ( CLEAR ?auto_301831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_301831 )
      ( MAKE-9PILE ?auto_301831 ?auto_301832 ?auto_301833 ?auto_301834 ?auto_301835 ?auto_301836 ?auto_301837 ?auto_301838 ?auto_301839 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_301870 - BLOCK
      ?auto_301871 - BLOCK
      ?auto_301872 - BLOCK
      ?auto_301873 - BLOCK
      ?auto_301874 - BLOCK
      ?auto_301875 - BLOCK
      ?auto_301876 - BLOCK
      ?auto_301877 - BLOCK
      ?auto_301878 - BLOCK
      ?auto_301879 - BLOCK
    )
    :vars
    (
      ?auto_301880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_301878 ) ( ON ?auto_301879 ?auto_301880 ) ( CLEAR ?auto_301879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_301870 ) ( ON ?auto_301871 ?auto_301870 ) ( ON ?auto_301872 ?auto_301871 ) ( ON ?auto_301873 ?auto_301872 ) ( ON ?auto_301874 ?auto_301873 ) ( ON ?auto_301875 ?auto_301874 ) ( ON ?auto_301876 ?auto_301875 ) ( ON ?auto_301877 ?auto_301876 ) ( ON ?auto_301878 ?auto_301877 ) ( not ( = ?auto_301870 ?auto_301871 ) ) ( not ( = ?auto_301870 ?auto_301872 ) ) ( not ( = ?auto_301870 ?auto_301873 ) ) ( not ( = ?auto_301870 ?auto_301874 ) ) ( not ( = ?auto_301870 ?auto_301875 ) ) ( not ( = ?auto_301870 ?auto_301876 ) ) ( not ( = ?auto_301870 ?auto_301877 ) ) ( not ( = ?auto_301870 ?auto_301878 ) ) ( not ( = ?auto_301870 ?auto_301879 ) ) ( not ( = ?auto_301870 ?auto_301880 ) ) ( not ( = ?auto_301871 ?auto_301872 ) ) ( not ( = ?auto_301871 ?auto_301873 ) ) ( not ( = ?auto_301871 ?auto_301874 ) ) ( not ( = ?auto_301871 ?auto_301875 ) ) ( not ( = ?auto_301871 ?auto_301876 ) ) ( not ( = ?auto_301871 ?auto_301877 ) ) ( not ( = ?auto_301871 ?auto_301878 ) ) ( not ( = ?auto_301871 ?auto_301879 ) ) ( not ( = ?auto_301871 ?auto_301880 ) ) ( not ( = ?auto_301872 ?auto_301873 ) ) ( not ( = ?auto_301872 ?auto_301874 ) ) ( not ( = ?auto_301872 ?auto_301875 ) ) ( not ( = ?auto_301872 ?auto_301876 ) ) ( not ( = ?auto_301872 ?auto_301877 ) ) ( not ( = ?auto_301872 ?auto_301878 ) ) ( not ( = ?auto_301872 ?auto_301879 ) ) ( not ( = ?auto_301872 ?auto_301880 ) ) ( not ( = ?auto_301873 ?auto_301874 ) ) ( not ( = ?auto_301873 ?auto_301875 ) ) ( not ( = ?auto_301873 ?auto_301876 ) ) ( not ( = ?auto_301873 ?auto_301877 ) ) ( not ( = ?auto_301873 ?auto_301878 ) ) ( not ( = ?auto_301873 ?auto_301879 ) ) ( not ( = ?auto_301873 ?auto_301880 ) ) ( not ( = ?auto_301874 ?auto_301875 ) ) ( not ( = ?auto_301874 ?auto_301876 ) ) ( not ( = ?auto_301874 ?auto_301877 ) ) ( not ( = ?auto_301874 ?auto_301878 ) ) ( not ( = ?auto_301874 ?auto_301879 ) ) ( not ( = ?auto_301874 ?auto_301880 ) ) ( not ( = ?auto_301875 ?auto_301876 ) ) ( not ( = ?auto_301875 ?auto_301877 ) ) ( not ( = ?auto_301875 ?auto_301878 ) ) ( not ( = ?auto_301875 ?auto_301879 ) ) ( not ( = ?auto_301875 ?auto_301880 ) ) ( not ( = ?auto_301876 ?auto_301877 ) ) ( not ( = ?auto_301876 ?auto_301878 ) ) ( not ( = ?auto_301876 ?auto_301879 ) ) ( not ( = ?auto_301876 ?auto_301880 ) ) ( not ( = ?auto_301877 ?auto_301878 ) ) ( not ( = ?auto_301877 ?auto_301879 ) ) ( not ( = ?auto_301877 ?auto_301880 ) ) ( not ( = ?auto_301878 ?auto_301879 ) ) ( not ( = ?auto_301878 ?auto_301880 ) ) ( not ( = ?auto_301879 ?auto_301880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_301879 ?auto_301880 )
      ( !STACK ?auto_301879 ?auto_301878 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_301912 - BLOCK
      ?auto_301913 - BLOCK
      ?auto_301914 - BLOCK
      ?auto_301915 - BLOCK
      ?auto_301916 - BLOCK
      ?auto_301917 - BLOCK
      ?auto_301918 - BLOCK
      ?auto_301919 - BLOCK
      ?auto_301920 - BLOCK
      ?auto_301921 - BLOCK
    )
    :vars
    (
      ?auto_301922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301921 ?auto_301922 ) ( ON-TABLE ?auto_301912 ) ( ON ?auto_301913 ?auto_301912 ) ( ON ?auto_301914 ?auto_301913 ) ( ON ?auto_301915 ?auto_301914 ) ( ON ?auto_301916 ?auto_301915 ) ( ON ?auto_301917 ?auto_301916 ) ( ON ?auto_301918 ?auto_301917 ) ( ON ?auto_301919 ?auto_301918 ) ( not ( = ?auto_301912 ?auto_301913 ) ) ( not ( = ?auto_301912 ?auto_301914 ) ) ( not ( = ?auto_301912 ?auto_301915 ) ) ( not ( = ?auto_301912 ?auto_301916 ) ) ( not ( = ?auto_301912 ?auto_301917 ) ) ( not ( = ?auto_301912 ?auto_301918 ) ) ( not ( = ?auto_301912 ?auto_301919 ) ) ( not ( = ?auto_301912 ?auto_301920 ) ) ( not ( = ?auto_301912 ?auto_301921 ) ) ( not ( = ?auto_301912 ?auto_301922 ) ) ( not ( = ?auto_301913 ?auto_301914 ) ) ( not ( = ?auto_301913 ?auto_301915 ) ) ( not ( = ?auto_301913 ?auto_301916 ) ) ( not ( = ?auto_301913 ?auto_301917 ) ) ( not ( = ?auto_301913 ?auto_301918 ) ) ( not ( = ?auto_301913 ?auto_301919 ) ) ( not ( = ?auto_301913 ?auto_301920 ) ) ( not ( = ?auto_301913 ?auto_301921 ) ) ( not ( = ?auto_301913 ?auto_301922 ) ) ( not ( = ?auto_301914 ?auto_301915 ) ) ( not ( = ?auto_301914 ?auto_301916 ) ) ( not ( = ?auto_301914 ?auto_301917 ) ) ( not ( = ?auto_301914 ?auto_301918 ) ) ( not ( = ?auto_301914 ?auto_301919 ) ) ( not ( = ?auto_301914 ?auto_301920 ) ) ( not ( = ?auto_301914 ?auto_301921 ) ) ( not ( = ?auto_301914 ?auto_301922 ) ) ( not ( = ?auto_301915 ?auto_301916 ) ) ( not ( = ?auto_301915 ?auto_301917 ) ) ( not ( = ?auto_301915 ?auto_301918 ) ) ( not ( = ?auto_301915 ?auto_301919 ) ) ( not ( = ?auto_301915 ?auto_301920 ) ) ( not ( = ?auto_301915 ?auto_301921 ) ) ( not ( = ?auto_301915 ?auto_301922 ) ) ( not ( = ?auto_301916 ?auto_301917 ) ) ( not ( = ?auto_301916 ?auto_301918 ) ) ( not ( = ?auto_301916 ?auto_301919 ) ) ( not ( = ?auto_301916 ?auto_301920 ) ) ( not ( = ?auto_301916 ?auto_301921 ) ) ( not ( = ?auto_301916 ?auto_301922 ) ) ( not ( = ?auto_301917 ?auto_301918 ) ) ( not ( = ?auto_301917 ?auto_301919 ) ) ( not ( = ?auto_301917 ?auto_301920 ) ) ( not ( = ?auto_301917 ?auto_301921 ) ) ( not ( = ?auto_301917 ?auto_301922 ) ) ( not ( = ?auto_301918 ?auto_301919 ) ) ( not ( = ?auto_301918 ?auto_301920 ) ) ( not ( = ?auto_301918 ?auto_301921 ) ) ( not ( = ?auto_301918 ?auto_301922 ) ) ( not ( = ?auto_301919 ?auto_301920 ) ) ( not ( = ?auto_301919 ?auto_301921 ) ) ( not ( = ?auto_301919 ?auto_301922 ) ) ( not ( = ?auto_301920 ?auto_301921 ) ) ( not ( = ?auto_301920 ?auto_301922 ) ) ( not ( = ?auto_301921 ?auto_301922 ) ) ( CLEAR ?auto_301919 ) ( ON ?auto_301920 ?auto_301921 ) ( CLEAR ?auto_301920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_301912 ?auto_301913 ?auto_301914 ?auto_301915 ?auto_301916 ?auto_301917 ?auto_301918 ?auto_301919 ?auto_301920 )
      ( MAKE-10PILE ?auto_301912 ?auto_301913 ?auto_301914 ?auto_301915 ?auto_301916 ?auto_301917 ?auto_301918 ?auto_301919 ?auto_301920 ?auto_301921 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_301954 - BLOCK
      ?auto_301955 - BLOCK
      ?auto_301956 - BLOCK
      ?auto_301957 - BLOCK
      ?auto_301958 - BLOCK
      ?auto_301959 - BLOCK
      ?auto_301960 - BLOCK
      ?auto_301961 - BLOCK
      ?auto_301962 - BLOCK
      ?auto_301963 - BLOCK
    )
    :vars
    (
      ?auto_301964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_301963 ?auto_301964 ) ( ON-TABLE ?auto_301954 ) ( ON ?auto_301955 ?auto_301954 ) ( ON ?auto_301956 ?auto_301955 ) ( ON ?auto_301957 ?auto_301956 ) ( ON ?auto_301958 ?auto_301957 ) ( ON ?auto_301959 ?auto_301958 ) ( ON ?auto_301960 ?auto_301959 ) ( not ( = ?auto_301954 ?auto_301955 ) ) ( not ( = ?auto_301954 ?auto_301956 ) ) ( not ( = ?auto_301954 ?auto_301957 ) ) ( not ( = ?auto_301954 ?auto_301958 ) ) ( not ( = ?auto_301954 ?auto_301959 ) ) ( not ( = ?auto_301954 ?auto_301960 ) ) ( not ( = ?auto_301954 ?auto_301961 ) ) ( not ( = ?auto_301954 ?auto_301962 ) ) ( not ( = ?auto_301954 ?auto_301963 ) ) ( not ( = ?auto_301954 ?auto_301964 ) ) ( not ( = ?auto_301955 ?auto_301956 ) ) ( not ( = ?auto_301955 ?auto_301957 ) ) ( not ( = ?auto_301955 ?auto_301958 ) ) ( not ( = ?auto_301955 ?auto_301959 ) ) ( not ( = ?auto_301955 ?auto_301960 ) ) ( not ( = ?auto_301955 ?auto_301961 ) ) ( not ( = ?auto_301955 ?auto_301962 ) ) ( not ( = ?auto_301955 ?auto_301963 ) ) ( not ( = ?auto_301955 ?auto_301964 ) ) ( not ( = ?auto_301956 ?auto_301957 ) ) ( not ( = ?auto_301956 ?auto_301958 ) ) ( not ( = ?auto_301956 ?auto_301959 ) ) ( not ( = ?auto_301956 ?auto_301960 ) ) ( not ( = ?auto_301956 ?auto_301961 ) ) ( not ( = ?auto_301956 ?auto_301962 ) ) ( not ( = ?auto_301956 ?auto_301963 ) ) ( not ( = ?auto_301956 ?auto_301964 ) ) ( not ( = ?auto_301957 ?auto_301958 ) ) ( not ( = ?auto_301957 ?auto_301959 ) ) ( not ( = ?auto_301957 ?auto_301960 ) ) ( not ( = ?auto_301957 ?auto_301961 ) ) ( not ( = ?auto_301957 ?auto_301962 ) ) ( not ( = ?auto_301957 ?auto_301963 ) ) ( not ( = ?auto_301957 ?auto_301964 ) ) ( not ( = ?auto_301958 ?auto_301959 ) ) ( not ( = ?auto_301958 ?auto_301960 ) ) ( not ( = ?auto_301958 ?auto_301961 ) ) ( not ( = ?auto_301958 ?auto_301962 ) ) ( not ( = ?auto_301958 ?auto_301963 ) ) ( not ( = ?auto_301958 ?auto_301964 ) ) ( not ( = ?auto_301959 ?auto_301960 ) ) ( not ( = ?auto_301959 ?auto_301961 ) ) ( not ( = ?auto_301959 ?auto_301962 ) ) ( not ( = ?auto_301959 ?auto_301963 ) ) ( not ( = ?auto_301959 ?auto_301964 ) ) ( not ( = ?auto_301960 ?auto_301961 ) ) ( not ( = ?auto_301960 ?auto_301962 ) ) ( not ( = ?auto_301960 ?auto_301963 ) ) ( not ( = ?auto_301960 ?auto_301964 ) ) ( not ( = ?auto_301961 ?auto_301962 ) ) ( not ( = ?auto_301961 ?auto_301963 ) ) ( not ( = ?auto_301961 ?auto_301964 ) ) ( not ( = ?auto_301962 ?auto_301963 ) ) ( not ( = ?auto_301962 ?auto_301964 ) ) ( not ( = ?auto_301963 ?auto_301964 ) ) ( ON ?auto_301962 ?auto_301963 ) ( CLEAR ?auto_301960 ) ( ON ?auto_301961 ?auto_301962 ) ( CLEAR ?auto_301961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_301954 ?auto_301955 ?auto_301956 ?auto_301957 ?auto_301958 ?auto_301959 ?auto_301960 ?auto_301961 )
      ( MAKE-10PILE ?auto_301954 ?auto_301955 ?auto_301956 ?auto_301957 ?auto_301958 ?auto_301959 ?auto_301960 ?auto_301961 ?auto_301962 ?auto_301963 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_301996 - BLOCK
      ?auto_301997 - BLOCK
      ?auto_301998 - BLOCK
      ?auto_301999 - BLOCK
      ?auto_302000 - BLOCK
      ?auto_302001 - BLOCK
      ?auto_302002 - BLOCK
      ?auto_302003 - BLOCK
      ?auto_302004 - BLOCK
      ?auto_302005 - BLOCK
    )
    :vars
    (
      ?auto_302006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302005 ?auto_302006 ) ( ON-TABLE ?auto_301996 ) ( ON ?auto_301997 ?auto_301996 ) ( ON ?auto_301998 ?auto_301997 ) ( ON ?auto_301999 ?auto_301998 ) ( ON ?auto_302000 ?auto_301999 ) ( ON ?auto_302001 ?auto_302000 ) ( not ( = ?auto_301996 ?auto_301997 ) ) ( not ( = ?auto_301996 ?auto_301998 ) ) ( not ( = ?auto_301996 ?auto_301999 ) ) ( not ( = ?auto_301996 ?auto_302000 ) ) ( not ( = ?auto_301996 ?auto_302001 ) ) ( not ( = ?auto_301996 ?auto_302002 ) ) ( not ( = ?auto_301996 ?auto_302003 ) ) ( not ( = ?auto_301996 ?auto_302004 ) ) ( not ( = ?auto_301996 ?auto_302005 ) ) ( not ( = ?auto_301996 ?auto_302006 ) ) ( not ( = ?auto_301997 ?auto_301998 ) ) ( not ( = ?auto_301997 ?auto_301999 ) ) ( not ( = ?auto_301997 ?auto_302000 ) ) ( not ( = ?auto_301997 ?auto_302001 ) ) ( not ( = ?auto_301997 ?auto_302002 ) ) ( not ( = ?auto_301997 ?auto_302003 ) ) ( not ( = ?auto_301997 ?auto_302004 ) ) ( not ( = ?auto_301997 ?auto_302005 ) ) ( not ( = ?auto_301997 ?auto_302006 ) ) ( not ( = ?auto_301998 ?auto_301999 ) ) ( not ( = ?auto_301998 ?auto_302000 ) ) ( not ( = ?auto_301998 ?auto_302001 ) ) ( not ( = ?auto_301998 ?auto_302002 ) ) ( not ( = ?auto_301998 ?auto_302003 ) ) ( not ( = ?auto_301998 ?auto_302004 ) ) ( not ( = ?auto_301998 ?auto_302005 ) ) ( not ( = ?auto_301998 ?auto_302006 ) ) ( not ( = ?auto_301999 ?auto_302000 ) ) ( not ( = ?auto_301999 ?auto_302001 ) ) ( not ( = ?auto_301999 ?auto_302002 ) ) ( not ( = ?auto_301999 ?auto_302003 ) ) ( not ( = ?auto_301999 ?auto_302004 ) ) ( not ( = ?auto_301999 ?auto_302005 ) ) ( not ( = ?auto_301999 ?auto_302006 ) ) ( not ( = ?auto_302000 ?auto_302001 ) ) ( not ( = ?auto_302000 ?auto_302002 ) ) ( not ( = ?auto_302000 ?auto_302003 ) ) ( not ( = ?auto_302000 ?auto_302004 ) ) ( not ( = ?auto_302000 ?auto_302005 ) ) ( not ( = ?auto_302000 ?auto_302006 ) ) ( not ( = ?auto_302001 ?auto_302002 ) ) ( not ( = ?auto_302001 ?auto_302003 ) ) ( not ( = ?auto_302001 ?auto_302004 ) ) ( not ( = ?auto_302001 ?auto_302005 ) ) ( not ( = ?auto_302001 ?auto_302006 ) ) ( not ( = ?auto_302002 ?auto_302003 ) ) ( not ( = ?auto_302002 ?auto_302004 ) ) ( not ( = ?auto_302002 ?auto_302005 ) ) ( not ( = ?auto_302002 ?auto_302006 ) ) ( not ( = ?auto_302003 ?auto_302004 ) ) ( not ( = ?auto_302003 ?auto_302005 ) ) ( not ( = ?auto_302003 ?auto_302006 ) ) ( not ( = ?auto_302004 ?auto_302005 ) ) ( not ( = ?auto_302004 ?auto_302006 ) ) ( not ( = ?auto_302005 ?auto_302006 ) ) ( ON ?auto_302004 ?auto_302005 ) ( ON ?auto_302003 ?auto_302004 ) ( CLEAR ?auto_302001 ) ( ON ?auto_302002 ?auto_302003 ) ( CLEAR ?auto_302002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_301996 ?auto_301997 ?auto_301998 ?auto_301999 ?auto_302000 ?auto_302001 ?auto_302002 )
      ( MAKE-10PILE ?auto_301996 ?auto_301997 ?auto_301998 ?auto_301999 ?auto_302000 ?auto_302001 ?auto_302002 ?auto_302003 ?auto_302004 ?auto_302005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302038 - BLOCK
      ?auto_302039 - BLOCK
      ?auto_302040 - BLOCK
      ?auto_302041 - BLOCK
      ?auto_302042 - BLOCK
      ?auto_302043 - BLOCK
      ?auto_302044 - BLOCK
      ?auto_302045 - BLOCK
      ?auto_302046 - BLOCK
      ?auto_302047 - BLOCK
    )
    :vars
    (
      ?auto_302048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302047 ?auto_302048 ) ( ON-TABLE ?auto_302038 ) ( ON ?auto_302039 ?auto_302038 ) ( ON ?auto_302040 ?auto_302039 ) ( ON ?auto_302041 ?auto_302040 ) ( ON ?auto_302042 ?auto_302041 ) ( not ( = ?auto_302038 ?auto_302039 ) ) ( not ( = ?auto_302038 ?auto_302040 ) ) ( not ( = ?auto_302038 ?auto_302041 ) ) ( not ( = ?auto_302038 ?auto_302042 ) ) ( not ( = ?auto_302038 ?auto_302043 ) ) ( not ( = ?auto_302038 ?auto_302044 ) ) ( not ( = ?auto_302038 ?auto_302045 ) ) ( not ( = ?auto_302038 ?auto_302046 ) ) ( not ( = ?auto_302038 ?auto_302047 ) ) ( not ( = ?auto_302038 ?auto_302048 ) ) ( not ( = ?auto_302039 ?auto_302040 ) ) ( not ( = ?auto_302039 ?auto_302041 ) ) ( not ( = ?auto_302039 ?auto_302042 ) ) ( not ( = ?auto_302039 ?auto_302043 ) ) ( not ( = ?auto_302039 ?auto_302044 ) ) ( not ( = ?auto_302039 ?auto_302045 ) ) ( not ( = ?auto_302039 ?auto_302046 ) ) ( not ( = ?auto_302039 ?auto_302047 ) ) ( not ( = ?auto_302039 ?auto_302048 ) ) ( not ( = ?auto_302040 ?auto_302041 ) ) ( not ( = ?auto_302040 ?auto_302042 ) ) ( not ( = ?auto_302040 ?auto_302043 ) ) ( not ( = ?auto_302040 ?auto_302044 ) ) ( not ( = ?auto_302040 ?auto_302045 ) ) ( not ( = ?auto_302040 ?auto_302046 ) ) ( not ( = ?auto_302040 ?auto_302047 ) ) ( not ( = ?auto_302040 ?auto_302048 ) ) ( not ( = ?auto_302041 ?auto_302042 ) ) ( not ( = ?auto_302041 ?auto_302043 ) ) ( not ( = ?auto_302041 ?auto_302044 ) ) ( not ( = ?auto_302041 ?auto_302045 ) ) ( not ( = ?auto_302041 ?auto_302046 ) ) ( not ( = ?auto_302041 ?auto_302047 ) ) ( not ( = ?auto_302041 ?auto_302048 ) ) ( not ( = ?auto_302042 ?auto_302043 ) ) ( not ( = ?auto_302042 ?auto_302044 ) ) ( not ( = ?auto_302042 ?auto_302045 ) ) ( not ( = ?auto_302042 ?auto_302046 ) ) ( not ( = ?auto_302042 ?auto_302047 ) ) ( not ( = ?auto_302042 ?auto_302048 ) ) ( not ( = ?auto_302043 ?auto_302044 ) ) ( not ( = ?auto_302043 ?auto_302045 ) ) ( not ( = ?auto_302043 ?auto_302046 ) ) ( not ( = ?auto_302043 ?auto_302047 ) ) ( not ( = ?auto_302043 ?auto_302048 ) ) ( not ( = ?auto_302044 ?auto_302045 ) ) ( not ( = ?auto_302044 ?auto_302046 ) ) ( not ( = ?auto_302044 ?auto_302047 ) ) ( not ( = ?auto_302044 ?auto_302048 ) ) ( not ( = ?auto_302045 ?auto_302046 ) ) ( not ( = ?auto_302045 ?auto_302047 ) ) ( not ( = ?auto_302045 ?auto_302048 ) ) ( not ( = ?auto_302046 ?auto_302047 ) ) ( not ( = ?auto_302046 ?auto_302048 ) ) ( not ( = ?auto_302047 ?auto_302048 ) ) ( ON ?auto_302046 ?auto_302047 ) ( ON ?auto_302045 ?auto_302046 ) ( ON ?auto_302044 ?auto_302045 ) ( CLEAR ?auto_302042 ) ( ON ?auto_302043 ?auto_302044 ) ( CLEAR ?auto_302043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_302038 ?auto_302039 ?auto_302040 ?auto_302041 ?auto_302042 ?auto_302043 )
      ( MAKE-10PILE ?auto_302038 ?auto_302039 ?auto_302040 ?auto_302041 ?auto_302042 ?auto_302043 ?auto_302044 ?auto_302045 ?auto_302046 ?auto_302047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302080 - BLOCK
      ?auto_302081 - BLOCK
      ?auto_302082 - BLOCK
      ?auto_302083 - BLOCK
      ?auto_302084 - BLOCK
      ?auto_302085 - BLOCK
      ?auto_302086 - BLOCK
      ?auto_302087 - BLOCK
      ?auto_302088 - BLOCK
      ?auto_302089 - BLOCK
    )
    :vars
    (
      ?auto_302090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302089 ?auto_302090 ) ( ON-TABLE ?auto_302080 ) ( ON ?auto_302081 ?auto_302080 ) ( ON ?auto_302082 ?auto_302081 ) ( ON ?auto_302083 ?auto_302082 ) ( not ( = ?auto_302080 ?auto_302081 ) ) ( not ( = ?auto_302080 ?auto_302082 ) ) ( not ( = ?auto_302080 ?auto_302083 ) ) ( not ( = ?auto_302080 ?auto_302084 ) ) ( not ( = ?auto_302080 ?auto_302085 ) ) ( not ( = ?auto_302080 ?auto_302086 ) ) ( not ( = ?auto_302080 ?auto_302087 ) ) ( not ( = ?auto_302080 ?auto_302088 ) ) ( not ( = ?auto_302080 ?auto_302089 ) ) ( not ( = ?auto_302080 ?auto_302090 ) ) ( not ( = ?auto_302081 ?auto_302082 ) ) ( not ( = ?auto_302081 ?auto_302083 ) ) ( not ( = ?auto_302081 ?auto_302084 ) ) ( not ( = ?auto_302081 ?auto_302085 ) ) ( not ( = ?auto_302081 ?auto_302086 ) ) ( not ( = ?auto_302081 ?auto_302087 ) ) ( not ( = ?auto_302081 ?auto_302088 ) ) ( not ( = ?auto_302081 ?auto_302089 ) ) ( not ( = ?auto_302081 ?auto_302090 ) ) ( not ( = ?auto_302082 ?auto_302083 ) ) ( not ( = ?auto_302082 ?auto_302084 ) ) ( not ( = ?auto_302082 ?auto_302085 ) ) ( not ( = ?auto_302082 ?auto_302086 ) ) ( not ( = ?auto_302082 ?auto_302087 ) ) ( not ( = ?auto_302082 ?auto_302088 ) ) ( not ( = ?auto_302082 ?auto_302089 ) ) ( not ( = ?auto_302082 ?auto_302090 ) ) ( not ( = ?auto_302083 ?auto_302084 ) ) ( not ( = ?auto_302083 ?auto_302085 ) ) ( not ( = ?auto_302083 ?auto_302086 ) ) ( not ( = ?auto_302083 ?auto_302087 ) ) ( not ( = ?auto_302083 ?auto_302088 ) ) ( not ( = ?auto_302083 ?auto_302089 ) ) ( not ( = ?auto_302083 ?auto_302090 ) ) ( not ( = ?auto_302084 ?auto_302085 ) ) ( not ( = ?auto_302084 ?auto_302086 ) ) ( not ( = ?auto_302084 ?auto_302087 ) ) ( not ( = ?auto_302084 ?auto_302088 ) ) ( not ( = ?auto_302084 ?auto_302089 ) ) ( not ( = ?auto_302084 ?auto_302090 ) ) ( not ( = ?auto_302085 ?auto_302086 ) ) ( not ( = ?auto_302085 ?auto_302087 ) ) ( not ( = ?auto_302085 ?auto_302088 ) ) ( not ( = ?auto_302085 ?auto_302089 ) ) ( not ( = ?auto_302085 ?auto_302090 ) ) ( not ( = ?auto_302086 ?auto_302087 ) ) ( not ( = ?auto_302086 ?auto_302088 ) ) ( not ( = ?auto_302086 ?auto_302089 ) ) ( not ( = ?auto_302086 ?auto_302090 ) ) ( not ( = ?auto_302087 ?auto_302088 ) ) ( not ( = ?auto_302087 ?auto_302089 ) ) ( not ( = ?auto_302087 ?auto_302090 ) ) ( not ( = ?auto_302088 ?auto_302089 ) ) ( not ( = ?auto_302088 ?auto_302090 ) ) ( not ( = ?auto_302089 ?auto_302090 ) ) ( ON ?auto_302088 ?auto_302089 ) ( ON ?auto_302087 ?auto_302088 ) ( ON ?auto_302086 ?auto_302087 ) ( ON ?auto_302085 ?auto_302086 ) ( CLEAR ?auto_302083 ) ( ON ?auto_302084 ?auto_302085 ) ( CLEAR ?auto_302084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_302080 ?auto_302081 ?auto_302082 ?auto_302083 ?auto_302084 )
      ( MAKE-10PILE ?auto_302080 ?auto_302081 ?auto_302082 ?auto_302083 ?auto_302084 ?auto_302085 ?auto_302086 ?auto_302087 ?auto_302088 ?auto_302089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302122 - BLOCK
      ?auto_302123 - BLOCK
      ?auto_302124 - BLOCK
      ?auto_302125 - BLOCK
      ?auto_302126 - BLOCK
      ?auto_302127 - BLOCK
      ?auto_302128 - BLOCK
      ?auto_302129 - BLOCK
      ?auto_302130 - BLOCK
      ?auto_302131 - BLOCK
    )
    :vars
    (
      ?auto_302132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302131 ?auto_302132 ) ( ON-TABLE ?auto_302122 ) ( ON ?auto_302123 ?auto_302122 ) ( ON ?auto_302124 ?auto_302123 ) ( not ( = ?auto_302122 ?auto_302123 ) ) ( not ( = ?auto_302122 ?auto_302124 ) ) ( not ( = ?auto_302122 ?auto_302125 ) ) ( not ( = ?auto_302122 ?auto_302126 ) ) ( not ( = ?auto_302122 ?auto_302127 ) ) ( not ( = ?auto_302122 ?auto_302128 ) ) ( not ( = ?auto_302122 ?auto_302129 ) ) ( not ( = ?auto_302122 ?auto_302130 ) ) ( not ( = ?auto_302122 ?auto_302131 ) ) ( not ( = ?auto_302122 ?auto_302132 ) ) ( not ( = ?auto_302123 ?auto_302124 ) ) ( not ( = ?auto_302123 ?auto_302125 ) ) ( not ( = ?auto_302123 ?auto_302126 ) ) ( not ( = ?auto_302123 ?auto_302127 ) ) ( not ( = ?auto_302123 ?auto_302128 ) ) ( not ( = ?auto_302123 ?auto_302129 ) ) ( not ( = ?auto_302123 ?auto_302130 ) ) ( not ( = ?auto_302123 ?auto_302131 ) ) ( not ( = ?auto_302123 ?auto_302132 ) ) ( not ( = ?auto_302124 ?auto_302125 ) ) ( not ( = ?auto_302124 ?auto_302126 ) ) ( not ( = ?auto_302124 ?auto_302127 ) ) ( not ( = ?auto_302124 ?auto_302128 ) ) ( not ( = ?auto_302124 ?auto_302129 ) ) ( not ( = ?auto_302124 ?auto_302130 ) ) ( not ( = ?auto_302124 ?auto_302131 ) ) ( not ( = ?auto_302124 ?auto_302132 ) ) ( not ( = ?auto_302125 ?auto_302126 ) ) ( not ( = ?auto_302125 ?auto_302127 ) ) ( not ( = ?auto_302125 ?auto_302128 ) ) ( not ( = ?auto_302125 ?auto_302129 ) ) ( not ( = ?auto_302125 ?auto_302130 ) ) ( not ( = ?auto_302125 ?auto_302131 ) ) ( not ( = ?auto_302125 ?auto_302132 ) ) ( not ( = ?auto_302126 ?auto_302127 ) ) ( not ( = ?auto_302126 ?auto_302128 ) ) ( not ( = ?auto_302126 ?auto_302129 ) ) ( not ( = ?auto_302126 ?auto_302130 ) ) ( not ( = ?auto_302126 ?auto_302131 ) ) ( not ( = ?auto_302126 ?auto_302132 ) ) ( not ( = ?auto_302127 ?auto_302128 ) ) ( not ( = ?auto_302127 ?auto_302129 ) ) ( not ( = ?auto_302127 ?auto_302130 ) ) ( not ( = ?auto_302127 ?auto_302131 ) ) ( not ( = ?auto_302127 ?auto_302132 ) ) ( not ( = ?auto_302128 ?auto_302129 ) ) ( not ( = ?auto_302128 ?auto_302130 ) ) ( not ( = ?auto_302128 ?auto_302131 ) ) ( not ( = ?auto_302128 ?auto_302132 ) ) ( not ( = ?auto_302129 ?auto_302130 ) ) ( not ( = ?auto_302129 ?auto_302131 ) ) ( not ( = ?auto_302129 ?auto_302132 ) ) ( not ( = ?auto_302130 ?auto_302131 ) ) ( not ( = ?auto_302130 ?auto_302132 ) ) ( not ( = ?auto_302131 ?auto_302132 ) ) ( ON ?auto_302130 ?auto_302131 ) ( ON ?auto_302129 ?auto_302130 ) ( ON ?auto_302128 ?auto_302129 ) ( ON ?auto_302127 ?auto_302128 ) ( ON ?auto_302126 ?auto_302127 ) ( CLEAR ?auto_302124 ) ( ON ?auto_302125 ?auto_302126 ) ( CLEAR ?auto_302125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_302122 ?auto_302123 ?auto_302124 ?auto_302125 )
      ( MAKE-10PILE ?auto_302122 ?auto_302123 ?auto_302124 ?auto_302125 ?auto_302126 ?auto_302127 ?auto_302128 ?auto_302129 ?auto_302130 ?auto_302131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302164 - BLOCK
      ?auto_302165 - BLOCK
      ?auto_302166 - BLOCK
      ?auto_302167 - BLOCK
      ?auto_302168 - BLOCK
      ?auto_302169 - BLOCK
      ?auto_302170 - BLOCK
      ?auto_302171 - BLOCK
      ?auto_302172 - BLOCK
      ?auto_302173 - BLOCK
    )
    :vars
    (
      ?auto_302174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302173 ?auto_302174 ) ( ON-TABLE ?auto_302164 ) ( ON ?auto_302165 ?auto_302164 ) ( not ( = ?auto_302164 ?auto_302165 ) ) ( not ( = ?auto_302164 ?auto_302166 ) ) ( not ( = ?auto_302164 ?auto_302167 ) ) ( not ( = ?auto_302164 ?auto_302168 ) ) ( not ( = ?auto_302164 ?auto_302169 ) ) ( not ( = ?auto_302164 ?auto_302170 ) ) ( not ( = ?auto_302164 ?auto_302171 ) ) ( not ( = ?auto_302164 ?auto_302172 ) ) ( not ( = ?auto_302164 ?auto_302173 ) ) ( not ( = ?auto_302164 ?auto_302174 ) ) ( not ( = ?auto_302165 ?auto_302166 ) ) ( not ( = ?auto_302165 ?auto_302167 ) ) ( not ( = ?auto_302165 ?auto_302168 ) ) ( not ( = ?auto_302165 ?auto_302169 ) ) ( not ( = ?auto_302165 ?auto_302170 ) ) ( not ( = ?auto_302165 ?auto_302171 ) ) ( not ( = ?auto_302165 ?auto_302172 ) ) ( not ( = ?auto_302165 ?auto_302173 ) ) ( not ( = ?auto_302165 ?auto_302174 ) ) ( not ( = ?auto_302166 ?auto_302167 ) ) ( not ( = ?auto_302166 ?auto_302168 ) ) ( not ( = ?auto_302166 ?auto_302169 ) ) ( not ( = ?auto_302166 ?auto_302170 ) ) ( not ( = ?auto_302166 ?auto_302171 ) ) ( not ( = ?auto_302166 ?auto_302172 ) ) ( not ( = ?auto_302166 ?auto_302173 ) ) ( not ( = ?auto_302166 ?auto_302174 ) ) ( not ( = ?auto_302167 ?auto_302168 ) ) ( not ( = ?auto_302167 ?auto_302169 ) ) ( not ( = ?auto_302167 ?auto_302170 ) ) ( not ( = ?auto_302167 ?auto_302171 ) ) ( not ( = ?auto_302167 ?auto_302172 ) ) ( not ( = ?auto_302167 ?auto_302173 ) ) ( not ( = ?auto_302167 ?auto_302174 ) ) ( not ( = ?auto_302168 ?auto_302169 ) ) ( not ( = ?auto_302168 ?auto_302170 ) ) ( not ( = ?auto_302168 ?auto_302171 ) ) ( not ( = ?auto_302168 ?auto_302172 ) ) ( not ( = ?auto_302168 ?auto_302173 ) ) ( not ( = ?auto_302168 ?auto_302174 ) ) ( not ( = ?auto_302169 ?auto_302170 ) ) ( not ( = ?auto_302169 ?auto_302171 ) ) ( not ( = ?auto_302169 ?auto_302172 ) ) ( not ( = ?auto_302169 ?auto_302173 ) ) ( not ( = ?auto_302169 ?auto_302174 ) ) ( not ( = ?auto_302170 ?auto_302171 ) ) ( not ( = ?auto_302170 ?auto_302172 ) ) ( not ( = ?auto_302170 ?auto_302173 ) ) ( not ( = ?auto_302170 ?auto_302174 ) ) ( not ( = ?auto_302171 ?auto_302172 ) ) ( not ( = ?auto_302171 ?auto_302173 ) ) ( not ( = ?auto_302171 ?auto_302174 ) ) ( not ( = ?auto_302172 ?auto_302173 ) ) ( not ( = ?auto_302172 ?auto_302174 ) ) ( not ( = ?auto_302173 ?auto_302174 ) ) ( ON ?auto_302172 ?auto_302173 ) ( ON ?auto_302171 ?auto_302172 ) ( ON ?auto_302170 ?auto_302171 ) ( ON ?auto_302169 ?auto_302170 ) ( ON ?auto_302168 ?auto_302169 ) ( ON ?auto_302167 ?auto_302168 ) ( CLEAR ?auto_302165 ) ( ON ?auto_302166 ?auto_302167 ) ( CLEAR ?auto_302166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_302164 ?auto_302165 ?auto_302166 )
      ( MAKE-10PILE ?auto_302164 ?auto_302165 ?auto_302166 ?auto_302167 ?auto_302168 ?auto_302169 ?auto_302170 ?auto_302171 ?auto_302172 ?auto_302173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302206 - BLOCK
      ?auto_302207 - BLOCK
      ?auto_302208 - BLOCK
      ?auto_302209 - BLOCK
      ?auto_302210 - BLOCK
      ?auto_302211 - BLOCK
      ?auto_302212 - BLOCK
      ?auto_302213 - BLOCK
      ?auto_302214 - BLOCK
      ?auto_302215 - BLOCK
    )
    :vars
    (
      ?auto_302216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302215 ?auto_302216 ) ( ON-TABLE ?auto_302206 ) ( not ( = ?auto_302206 ?auto_302207 ) ) ( not ( = ?auto_302206 ?auto_302208 ) ) ( not ( = ?auto_302206 ?auto_302209 ) ) ( not ( = ?auto_302206 ?auto_302210 ) ) ( not ( = ?auto_302206 ?auto_302211 ) ) ( not ( = ?auto_302206 ?auto_302212 ) ) ( not ( = ?auto_302206 ?auto_302213 ) ) ( not ( = ?auto_302206 ?auto_302214 ) ) ( not ( = ?auto_302206 ?auto_302215 ) ) ( not ( = ?auto_302206 ?auto_302216 ) ) ( not ( = ?auto_302207 ?auto_302208 ) ) ( not ( = ?auto_302207 ?auto_302209 ) ) ( not ( = ?auto_302207 ?auto_302210 ) ) ( not ( = ?auto_302207 ?auto_302211 ) ) ( not ( = ?auto_302207 ?auto_302212 ) ) ( not ( = ?auto_302207 ?auto_302213 ) ) ( not ( = ?auto_302207 ?auto_302214 ) ) ( not ( = ?auto_302207 ?auto_302215 ) ) ( not ( = ?auto_302207 ?auto_302216 ) ) ( not ( = ?auto_302208 ?auto_302209 ) ) ( not ( = ?auto_302208 ?auto_302210 ) ) ( not ( = ?auto_302208 ?auto_302211 ) ) ( not ( = ?auto_302208 ?auto_302212 ) ) ( not ( = ?auto_302208 ?auto_302213 ) ) ( not ( = ?auto_302208 ?auto_302214 ) ) ( not ( = ?auto_302208 ?auto_302215 ) ) ( not ( = ?auto_302208 ?auto_302216 ) ) ( not ( = ?auto_302209 ?auto_302210 ) ) ( not ( = ?auto_302209 ?auto_302211 ) ) ( not ( = ?auto_302209 ?auto_302212 ) ) ( not ( = ?auto_302209 ?auto_302213 ) ) ( not ( = ?auto_302209 ?auto_302214 ) ) ( not ( = ?auto_302209 ?auto_302215 ) ) ( not ( = ?auto_302209 ?auto_302216 ) ) ( not ( = ?auto_302210 ?auto_302211 ) ) ( not ( = ?auto_302210 ?auto_302212 ) ) ( not ( = ?auto_302210 ?auto_302213 ) ) ( not ( = ?auto_302210 ?auto_302214 ) ) ( not ( = ?auto_302210 ?auto_302215 ) ) ( not ( = ?auto_302210 ?auto_302216 ) ) ( not ( = ?auto_302211 ?auto_302212 ) ) ( not ( = ?auto_302211 ?auto_302213 ) ) ( not ( = ?auto_302211 ?auto_302214 ) ) ( not ( = ?auto_302211 ?auto_302215 ) ) ( not ( = ?auto_302211 ?auto_302216 ) ) ( not ( = ?auto_302212 ?auto_302213 ) ) ( not ( = ?auto_302212 ?auto_302214 ) ) ( not ( = ?auto_302212 ?auto_302215 ) ) ( not ( = ?auto_302212 ?auto_302216 ) ) ( not ( = ?auto_302213 ?auto_302214 ) ) ( not ( = ?auto_302213 ?auto_302215 ) ) ( not ( = ?auto_302213 ?auto_302216 ) ) ( not ( = ?auto_302214 ?auto_302215 ) ) ( not ( = ?auto_302214 ?auto_302216 ) ) ( not ( = ?auto_302215 ?auto_302216 ) ) ( ON ?auto_302214 ?auto_302215 ) ( ON ?auto_302213 ?auto_302214 ) ( ON ?auto_302212 ?auto_302213 ) ( ON ?auto_302211 ?auto_302212 ) ( ON ?auto_302210 ?auto_302211 ) ( ON ?auto_302209 ?auto_302210 ) ( ON ?auto_302208 ?auto_302209 ) ( CLEAR ?auto_302206 ) ( ON ?auto_302207 ?auto_302208 ) ( CLEAR ?auto_302207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_302206 ?auto_302207 )
      ( MAKE-10PILE ?auto_302206 ?auto_302207 ?auto_302208 ?auto_302209 ?auto_302210 ?auto_302211 ?auto_302212 ?auto_302213 ?auto_302214 ?auto_302215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_302248 - BLOCK
      ?auto_302249 - BLOCK
      ?auto_302250 - BLOCK
      ?auto_302251 - BLOCK
      ?auto_302252 - BLOCK
      ?auto_302253 - BLOCK
      ?auto_302254 - BLOCK
      ?auto_302255 - BLOCK
      ?auto_302256 - BLOCK
      ?auto_302257 - BLOCK
    )
    :vars
    (
      ?auto_302258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302257 ?auto_302258 ) ( not ( = ?auto_302248 ?auto_302249 ) ) ( not ( = ?auto_302248 ?auto_302250 ) ) ( not ( = ?auto_302248 ?auto_302251 ) ) ( not ( = ?auto_302248 ?auto_302252 ) ) ( not ( = ?auto_302248 ?auto_302253 ) ) ( not ( = ?auto_302248 ?auto_302254 ) ) ( not ( = ?auto_302248 ?auto_302255 ) ) ( not ( = ?auto_302248 ?auto_302256 ) ) ( not ( = ?auto_302248 ?auto_302257 ) ) ( not ( = ?auto_302248 ?auto_302258 ) ) ( not ( = ?auto_302249 ?auto_302250 ) ) ( not ( = ?auto_302249 ?auto_302251 ) ) ( not ( = ?auto_302249 ?auto_302252 ) ) ( not ( = ?auto_302249 ?auto_302253 ) ) ( not ( = ?auto_302249 ?auto_302254 ) ) ( not ( = ?auto_302249 ?auto_302255 ) ) ( not ( = ?auto_302249 ?auto_302256 ) ) ( not ( = ?auto_302249 ?auto_302257 ) ) ( not ( = ?auto_302249 ?auto_302258 ) ) ( not ( = ?auto_302250 ?auto_302251 ) ) ( not ( = ?auto_302250 ?auto_302252 ) ) ( not ( = ?auto_302250 ?auto_302253 ) ) ( not ( = ?auto_302250 ?auto_302254 ) ) ( not ( = ?auto_302250 ?auto_302255 ) ) ( not ( = ?auto_302250 ?auto_302256 ) ) ( not ( = ?auto_302250 ?auto_302257 ) ) ( not ( = ?auto_302250 ?auto_302258 ) ) ( not ( = ?auto_302251 ?auto_302252 ) ) ( not ( = ?auto_302251 ?auto_302253 ) ) ( not ( = ?auto_302251 ?auto_302254 ) ) ( not ( = ?auto_302251 ?auto_302255 ) ) ( not ( = ?auto_302251 ?auto_302256 ) ) ( not ( = ?auto_302251 ?auto_302257 ) ) ( not ( = ?auto_302251 ?auto_302258 ) ) ( not ( = ?auto_302252 ?auto_302253 ) ) ( not ( = ?auto_302252 ?auto_302254 ) ) ( not ( = ?auto_302252 ?auto_302255 ) ) ( not ( = ?auto_302252 ?auto_302256 ) ) ( not ( = ?auto_302252 ?auto_302257 ) ) ( not ( = ?auto_302252 ?auto_302258 ) ) ( not ( = ?auto_302253 ?auto_302254 ) ) ( not ( = ?auto_302253 ?auto_302255 ) ) ( not ( = ?auto_302253 ?auto_302256 ) ) ( not ( = ?auto_302253 ?auto_302257 ) ) ( not ( = ?auto_302253 ?auto_302258 ) ) ( not ( = ?auto_302254 ?auto_302255 ) ) ( not ( = ?auto_302254 ?auto_302256 ) ) ( not ( = ?auto_302254 ?auto_302257 ) ) ( not ( = ?auto_302254 ?auto_302258 ) ) ( not ( = ?auto_302255 ?auto_302256 ) ) ( not ( = ?auto_302255 ?auto_302257 ) ) ( not ( = ?auto_302255 ?auto_302258 ) ) ( not ( = ?auto_302256 ?auto_302257 ) ) ( not ( = ?auto_302256 ?auto_302258 ) ) ( not ( = ?auto_302257 ?auto_302258 ) ) ( ON ?auto_302256 ?auto_302257 ) ( ON ?auto_302255 ?auto_302256 ) ( ON ?auto_302254 ?auto_302255 ) ( ON ?auto_302253 ?auto_302254 ) ( ON ?auto_302252 ?auto_302253 ) ( ON ?auto_302251 ?auto_302252 ) ( ON ?auto_302250 ?auto_302251 ) ( ON ?auto_302249 ?auto_302250 ) ( ON ?auto_302248 ?auto_302249 ) ( CLEAR ?auto_302248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_302248 )
      ( MAKE-10PILE ?auto_302248 ?auto_302249 ?auto_302250 ?auto_302251 ?auto_302252 ?auto_302253 ?auto_302254 ?auto_302255 ?auto_302256 ?auto_302257 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302291 - BLOCK
      ?auto_302292 - BLOCK
      ?auto_302293 - BLOCK
      ?auto_302294 - BLOCK
      ?auto_302295 - BLOCK
      ?auto_302296 - BLOCK
      ?auto_302297 - BLOCK
      ?auto_302298 - BLOCK
      ?auto_302299 - BLOCK
      ?auto_302300 - BLOCK
      ?auto_302301 - BLOCK
    )
    :vars
    (
      ?auto_302302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_302300 ) ( ON ?auto_302301 ?auto_302302 ) ( CLEAR ?auto_302301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_302291 ) ( ON ?auto_302292 ?auto_302291 ) ( ON ?auto_302293 ?auto_302292 ) ( ON ?auto_302294 ?auto_302293 ) ( ON ?auto_302295 ?auto_302294 ) ( ON ?auto_302296 ?auto_302295 ) ( ON ?auto_302297 ?auto_302296 ) ( ON ?auto_302298 ?auto_302297 ) ( ON ?auto_302299 ?auto_302298 ) ( ON ?auto_302300 ?auto_302299 ) ( not ( = ?auto_302291 ?auto_302292 ) ) ( not ( = ?auto_302291 ?auto_302293 ) ) ( not ( = ?auto_302291 ?auto_302294 ) ) ( not ( = ?auto_302291 ?auto_302295 ) ) ( not ( = ?auto_302291 ?auto_302296 ) ) ( not ( = ?auto_302291 ?auto_302297 ) ) ( not ( = ?auto_302291 ?auto_302298 ) ) ( not ( = ?auto_302291 ?auto_302299 ) ) ( not ( = ?auto_302291 ?auto_302300 ) ) ( not ( = ?auto_302291 ?auto_302301 ) ) ( not ( = ?auto_302291 ?auto_302302 ) ) ( not ( = ?auto_302292 ?auto_302293 ) ) ( not ( = ?auto_302292 ?auto_302294 ) ) ( not ( = ?auto_302292 ?auto_302295 ) ) ( not ( = ?auto_302292 ?auto_302296 ) ) ( not ( = ?auto_302292 ?auto_302297 ) ) ( not ( = ?auto_302292 ?auto_302298 ) ) ( not ( = ?auto_302292 ?auto_302299 ) ) ( not ( = ?auto_302292 ?auto_302300 ) ) ( not ( = ?auto_302292 ?auto_302301 ) ) ( not ( = ?auto_302292 ?auto_302302 ) ) ( not ( = ?auto_302293 ?auto_302294 ) ) ( not ( = ?auto_302293 ?auto_302295 ) ) ( not ( = ?auto_302293 ?auto_302296 ) ) ( not ( = ?auto_302293 ?auto_302297 ) ) ( not ( = ?auto_302293 ?auto_302298 ) ) ( not ( = ?auto_302293 ?auto_302299 ) ) ( not ( = ?auto_302293 ?auto_302300 ) ) ( not ( = ?auto_302293 ?auto_302301 ) ) ( not ( = ?auto_302293 ?auto_302302 ) ) ( not ( = ?auto_302294 ?auto_302295 ) ) ( not ( = ?auto_302294 ?auto_302296 ) ) ( not ( = ?auto_302294 ?auto_302297 ) ) ( not ( = ?auto_302294 ?auto_302298 ) ) ( not ( = ?auto_302294 ?auto_302299 ) ) ( not ( = ?auto_302294 ?auto_302300 ) ) ( not ( = ?auto_302294 ?auto_302301 ) ) ( not ( = ?auto_302294 ?auto_302302 ) ) ( not ( = ?auto_302295 ?auto_302296 ) ) ( not ( = ?auto_302295 ?auto_302297 ) ) ( not ( = ?auto_302295 ?auto_302298 ) ) ( not ( = ?auto_302295 ?auto_302299 ) ) ( not ( = ?auto_302295 ?auto_302300 ) ) ( not ( = ?auto_302295 ?auto_302301 ) ) ( not ( = ?auto_302295 ?auto_302302 ) ) ( not ( = ?auto_302296 ?auto_302297 ) ) ( not ( = ?auto_302296 ?auto_302298 ) ) ( not ( = ?auto_302296 ?auto_302299 ) ) ( not ( = ?auto_302296 ?auto_302300 ) ) ( not ( = ?auto_302296 ?auto_302301 ) ) ( not ( = ?auto_302296 ?auto_302302 ) ) ( not ( = ?auto_302297 ?auto_302298 ) ) ( not ( = ?auto_302297 ?auto_302299 ) ) ( not ( = ?auto_302297 ?auto_302300 ) ) ( not ( = ?auto_302297 ?auto_302301 ) ) ( not ( = ?auto_302297 ?auto_302302 ) ) ( not ( = ?auto_302298 ?auto_302299 ) ) ( not ( = ?auto_302298 ?auto_302300 ) ) ( not ( = ?auto_302298 ?auto_302301 ) ) ( not ( = ?auto_302298 ?auto_302302 ) ) ( not ( = ?auto_302299 ?auto_302300 ) ) ( not ( = ?auto_302299 ?auto_302301 ) ) ( not ( = ?auto_302299 ?auto_302302 ) ) ( not ( = ?auto_302300 ?auto_302301 ) ) ( not ( = ?auto_302300 ?auto_302302 ) ) ( not ( = ?auto_302301 ?auto_302302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_302301 ?auto_302302 )
      ( !STACK ?auto_302301 ?auto_302300 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302337 - BLOCK
      ?auto_302338 - BLOCK
      ?auto_302339 - BLOCK
      ?auto_302340 - BLOCK
      ?auto_302341 - BLOCK
      ?auto_302342 - BLOCK
      ?auto_302343 - BLOCK
      ?auto_302344 - BLOCK
      ?auto_302345 - BLOCK
      ?auto_302346 - BLOCK
      ?auto_302347 - BLOCK
    )
    :vars
    (
      ?auto_302348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302347 ?auto_302348 ) ( ON-TABLE ?auto_302337 ) ( ON ?auto_302338 ?auto_302337 ) ( ON ?auto_302339 ?auto_302338 ) ( ON ?auto_302340 ?auto_302339 ) ( ON ?auto_302341 ?auto_302340 ) ( ON ?auto_302342 ?auto_302341 ) ( ON ?auto_302343 ?auto_302342 ) ( ON ?auto_302344 ?auto_302343 ) ( ON ?auto_302345 ?auto_302344 ) ( not ( = ?auto_302337 ?auto_302338 ) ) ( not ( = ?auto_302337 ?auto_302339 ) ) ( not ( = ?auto_302337 ?auto_302340 ) ) ( not ( = ?auto_302337 ?auto_302341 ) ) ( not ( = ?auto_302337 ?auto_302342 ) ) ( not ( = ?auto_302337 ?auto_302343 ) ) ( not ( = ?auto_302337 ?auto_302344 ) ) ( not ( = ?auto_302337 ?auto_302345 ) ) ( not ( = ?auto_302337 ?auto_302346 ) ) ( not ( = ?auto_302337 ?auto_302347 ) ) ( not ( = ?auto_302337 ?auto_302348 ) ) ( not ( = ?auto_302338 ?auto_302339 ) ) ( not ( = ?auto_302338 ?auto_302340 ) ) ( not ( = ?auto_302338 ?auto_302341 ) ) ( not ( = ?auto_302338 ?auto_302342 ) ) ( not ( = ?auto_302338 ?auto_302343 ) ) ( not ( = ?auto_302338 ?auto_302344 ) ) ( not ( = ?auto_302338 ?auto_302345 ) ) ( not ( = ?auto_302338 ?auto_302346 ) ) ( not ( = ?auto_302338 ?auto_302347 ) ) ( not ( = ?auto_302338 ?auto_302348 ) ) ( not ( = ?auto_302339 ?auto_302340 ) ) ( not ( = ?auto_302339 ?auto_302341 ) ) ( not ( = ?auto_302339 ?auto_302342 ) ) ( not ( = ?auto_302339 ?auto_302343 ) ) ( not ( = ?auto_302339 ?auto_302344 ) ) ( not ( = ?auto_302339 ?auto_302345 ) ) ( not ( = ?auto_302339 ?auto_302346 ) ) ( not ( = ?auto_302339 ?auto_302347 ) ) ( not ( = ?auto_302339 ?auto_302348 ) ) ( not ( = ?auto_302340 ?auto_302341 ) ) ( not ( = ?auto_302340 ?auto_302342 ) ) ( not ( = ?auto_302340 ?auto_302343 ) ) ( not ( = ?auto_302340 ?auto_302344 ) ) ( not ( = ?auto_302340 ?auto_302345 ) ) ( not ( = ?auto_302340 ?auto_302346 ) ) ( not ( = ?auto_302340 ?auto_302347 ) ) ( not ( = ?auto_302340 ?auto_302348 ) ) ( not ( = ?auto_302341 ?auto_302342 ) ) ( not ( = ?auto_302341 ?auto_302343 ) ) ( not ( = ?auto_302341 ?auto_302344 ) ) ( not ( = ?auto_302341 ?auto_302345 ) ) ( not ( = ?auto_302341 ?auto_302346 ) ) ( not ( = ?auto_302341 ?auto_302347 ) ) ( not ( = ?auto_302341 ?auto_302348 ) ) ( not ( = ?auto_302342 ?auto_302343 ) ) ( not ( = ?auto_302342 ?auto_302344 ) ) ( not ( = ?auto_302342 ?auto_302345 ) ) ( not ( = ?auto_302342 ?auto_302346 ) ) ( not ( = ?auto_302342 ?auto_302347 ) ) ( not ( = ?auto_302342 ?auto_302348 ) ) ( not ( = ?auto_302343 ?auto_302344 ) ) ( not ( = ?auto_302343 ?auto_302345 ) ) ( not ( = ?auto_302343 ?auto_302346 ) ) ( not ( = ?auto_302343 ?auto_302347 ) ) ( not ( = ?auto_302343 ?auto_302348 ) ) ( not ( = ?auto_302344 ?auto_302345 ) ) ( not ( = ?auto_302344 ?auto_302346 ) ) ( not ( = ?auto_302344 ?auto_302347 ) ) ( not ( = ?auto_302344 ?auto_302348 ) ) ( not ( = ?auto_302345 ?auto_302346 ) ) ( not ( = ?auto_302345 ?auto_302347 ) ) ( not ( = ?auto_302345 ?auto_302348 ) ) ( not ( = ?auto_302346 ?auto_302347 ) ) ( not ( = ?auto_302346 ?auto_302348 ) ) ( not ( = ?auto_302347 ?auto_302348 ) ) ( CLEAR ?auto_302345 ) ( ON ?auto_302346 ?auto_302347 ) ( CLEAR ?auto_302346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_302337 ?auto_302338 ?auto_302339 ?auto_302340 ?auto_302341 ?auto_302342 ?auto_302343 ?auto_302344 ?auto_302345 ?auto_302346 )
      ( MAKE-11PILE ?auto_302337 ?auto_302338 ?auto_302339 ?auto_302340 ?auto_302341 ?auto_302342 ?auto_302343 ?auto_302344 ?auto_302345 ?auto_302346 ?auto_302347 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302383 - BLOCK
      ?auto_302384 - BLOCK
      ?auto_302385 - BLOCK
      ?auto_302386 - BLOCK
      ?auto_302387 - BLOCK
      ?auto_302388 - BLOCK
      ?auto_302389 - BLOCK
      ?auto_302390 - BLOCK
      ?auto_302391 - BLOCK
      ?auto_302392 - BLOCK
      ?auto_302393 - BLOCK
    )
    :vars
    (
      ?auto_302394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302393 ?auto_302394 ) ( ON-TABLE ?auto_302383 ) ( ON ?auto_302384 ?auto_302383 ) ( ON ?auto_302385 ?auto_302384 ) ( ON ?auto_302386 ?auto_302385 ) ( ON ?auto_302387 ?auto_302386 ) ( ON ?auto_302388 ?auto_302387 ) ( ON ?auto_302389 ?auto_302388 ) ( ON ?auto_302390 ?auto_302389 ) ( not ( = ?auto_302383 ?auto_302384 ) ) ( not ( = ?auto_302383 ?auto_302385 ) ) ( not ( = ?auto_302383 ?auto_302386 ) ) ( not ( = ?auto_302383 ?auto_302387 ) ) ( not ( = ?auto_302383 ?auto_302388 ) ) ( not ( = ?auto_302383 ?auto_302389 ) ) ( not ( = ?auto_302383 ?auto_302390 ) ) ( not ( = ?auto_302383 ?auto_302391 ) ) ( not ( = ?auto_302383 ?auto_302392 ) ) ( not ( = ?auto_302383 ?auto_302393 ) ) ( not ( = ?auto_302383 ?auto_302394 ) ) ( not ( = ?auto_302384 ?auto_302385 ) ) ( not ( = ?auto_302384 ?auto_302386 ) ) ( not ( = ?auto_302384 ?auto_302387 ) ) ( not ( = ?auto_302384 ?auto_302388 ) ) ( not ( = ?auto_302384 ?auto_302389 ) ) ( not ( = ?auto_302384 ?auto_302390 ) ) ( not ( = ?auto_302384 ?auto_302391 ) ) ( not ( = ?auto_302384 ?auto_302392 ) ) ( not ( = ?auto_302384 ?auto_302393 ) ) ( not ( = ?auto_302384 ?auto_302394 ) ) ( not ( = ?auto_302385 ?auto_302386 ) ) ( not ( = ?auto_302385 ?auto_302387 ) ) ( not ( = ?auto_302385 ?auto_302388 ) ) ( not ( = ?auto_302385 ?auto_302389 ) ) ( not ( = ?auto_302385 ?auto_302390 ) ) ( not ( = ?auto_302385 ?auto_302391 ) ) ( not ( = ?auto_302385 ?auto_302392 ) ) ( not ( = ?auto_302385 ?auto_302393 ) ) ( not ( = ?auto_302385 ?auto_302394 ) ) ( not ( = ?auto_302386 ?auto_302387 ) ) ( not ( = ?auto_302386 ?auto_302388 ) ) ( not ( = ?auto_302386 ?auto_302389 ) ) ( not ( = ?auto_302386 ?auto_302390 ) ) ( not ( = ?auto_302386 ?auto_302391 ) ) ( not ( = ?auto_302386 ?auto_302392 ) ) ( not ( = ?auto_302386 ?auto_302393 ) ) ( not ( = ?auto_302386 ?auto_302394 ) ) ( not ( = ?auto_302387 ?auto_302388 ) ) ( not ( = ?auto_302387 ?auto_302389 ) ) ( not ( = ?auto_302387 ?auto_302390 ) ) ( not ( = ?auto_302387 ?auto_302391 ) ) ( not ( = ?auto_302387 ?auto_302392 ) ) ( not ( = ?auto_302387 ?auto_302393 ) ) ( not ( = ?auto_302387 ?auto_302394 ) ) ( not ( = ?auto_302388 ?auto_302389 ) ) ( not ( = ?auto_302388 ?auto_302390 ) ) ( not ( = ?auto_302388 ?auto_302391 ) ) ( not ( = ?auto_302388 ?auto_302392 ) ) ( not ( = ?auto_302388 ?auto_302393 ) ) ( not ( = ?auto_302388 ?auto_302394 ) ) ( not ( = ?auto_302389 ?auto_302390 ) ) ( not ( = ?auto_302389 ?auto_302391 ) ) ( not ( = ?auto_302389 ?auto_302392 ) ) ( not ( = ?auto_302389 ?auto_302393 ) ) ( not ( = ?auto_302389 ?auto_302394 ) ) ( not ( = ?auto_302390 ?auto_302391 ) ) ( not ( = ?auto_302390 ?auto_302392 ) ) ( not ( = ?auto_302390 ?auto_302393 ) ) ( not ( = ?auto_302390 ?auto_302394 ) ) ( not ( = ?auto_302391 ?auto_302392 ) ) ( not ( = ?auto_302391 ?auto_302393 ) ) ( not ( = ?auto_302391 ?auto_302394 ) ) ( not ( = ?auto_302392 ?auto_302393 ) ) ( not ( = ?auto_302392 ?auto_302394 ) ) ( not ( = ?auto_302393 ?auto_302394 ) ) ( ON ?auto_302392 ?auto_302393 ) ( CLEAR ?auto_302390 ) ( ON ?auto_302391 ?auto_302392 ) ( CLEAR ?auto_302391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_302383 ?auto_302384 ?auto_302385 ?auto_302386 ?auto_302387 ?auto_302388 ?auto_302389 ?auto_302390 ?auto_302391 )
      ( MAKE-11PILE ?auto_302383 ?auto_302384 ?auto_302385 ?auto_302386 ?auto_302387 ?auto_302388 ?auto_302389 ?auto_302390 ?auto_302391 ?auto_302392 ?auto_302393 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302429 - BLOCK
      ?auto_302430 - BLOCK
      ?auto_302431 - BLOCK
      ?auto_302432 - BLOCK
      ?auto_302433 - BLOCK
      ?auto_302434 - BLOCK
      ?auto_302435 - BLOCK
      ?auto_302436 - BLOCK
      ?auto_302437 - BLOCK
      ?auto_302438 - BLOCK
      ?auto_302439 - BLOCK
    )
    :vars
    (
      ?auto_302440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302439 ?auto_302440 ) ( ON-TABLE ?auto_302429 ) ( ON ?auto_302430 ?auto_302429 ) ( ON ?auto_302431 ?auto_302430 ) ( ON ?auto_302432 ?auto_302431 ) ( ON ?auto_302433 ?auto_302432 ) ( ON ?auto_302434 ?auto_302433 ) ( ON ?auto_302435 ?auto_302434 ) ( not ( = ?auto_302429 ?auto_302430 ) ) ( not ( = ?auto_302429 ?auto_302431 ) ) ( not ( = ?auto_302429 ?auto_302432 ) ) ( not ( = ?auto_302429 ?auto_302433 ) ) ( not ( = ?auto_302429 ?auto_302434 ) ) ( not ( = ?auto_302429 ?auto_302435 ) ) ( not ( = ?auto_302429 ?auto_302436 ) ) ( not ( = ?auto_302429 ?auto_302437 ) ) ( not ( = ?auto_302429 ?auto_302438 ) ) ( not ( = ?auto_302429 ?auto_302439 ) ) ( not ( = ?auto_302429 ?auto_302440 ) ) ( not ( = ?auto_302430 ?auto_302431 ) ) ( not ( = ?auto_302430 ?auto_302432 ) ) ( not ( = ?auto_302430 ?auto_302433 ) ) ( not ( = ?auto_302430 ?auto_302434 ) ) ( not ( = ?auto_302430 ?auto_302435 ) ) ( not ( = ?auto_302430 ?auto_302436 ) ) ( not ( = ?auto_302430 ?auto_302437 ) ) ( not ( = ?auto_302430 ?auto_302438 ) ) ( not ( = ?auto_302430 ?auto_302439 ) ) ( not ( = ?auto_302430 ?auto_302440 ) ) ( not ( = ?auto_302431 ?auto_302432 ) ) ( not ( = ?auto_302431 ?auto_302433 ) ) ( not ( = ?auto_302431 ?auto_302434 ) ) ( not ( = ?auto_302431 ?auto_302435 ) ) ( not ( = ?auto_302431 ?auto_302436 ) ) ( not ( = ?auto_302431 ?auto_302437 ) ) ( not ( = ?auto_302431 ?auto_302438 ) ) ( not ( = ?auto_302431 ?auto_302439 ) ) ( not ( = ?auto_302431 ?auto_302440 ) ) ( not ( = ?auto_302432 ?auto_302433 ) ) ( not ( = ?auto_302432 ?auto_302434 ) ) ( not ( = ?auto_302432 ?auto_302435 ) ) ( not ( = ?auto_302432 ?auto_302436 ) ) ( not ( = ?auto_302432 ?auto_302437 ) ) ( not ( = ?auto_302432 ?auto_302438 ) ) ( not ( = ?auto_302432 ?auto_302439 ) ) ( not ( = ?auto_302432 ?auto_302440 ) ) ( not ( = ?auto_302433 ?auto_302434 ) ) ( not ( = ?auto_302433 ?auto_302435 ) ) ( not ( = ?auto_302433 ?auto_302436 ) ) ( not ( = ?auto_302433 ?auto_302437 ) ) ( not ( = ?auto_302433 ?auto_302438 ) ) ( not ( = ?auto_302433 ?auto_302439 ) ) ( not ( = ?auto_302433 ?auto_302440 ) ) ( not ( = ?auto_302434 ?auto_302435 ) ) ( not ( = ?auto_302434 ?auto_302436 ) ) ( not ( = ?auto_302434 ?auto_302437 ) ) ( not ( = ?auto_302434 ?auto_302438 ) ) ( not ( = ?auto_302434 ?auto_302439 ) ) ( not ( = ?auto_302434 ?auto_302440 ) ) ( not ( = ?auto_302435 ?auto_302436 ) ) ( not ( = ?auto_302435 ?auto_302437 ) ) ( not ( = ?auto_302435 ?auto_302438 ) ) ( not ( = ?auto_302435 ?auto_302439 ) ) ( not ( = ?auto_302435 ?auto_302440 ) ) ( not ( = ?auto_302436 ?auto_302437 ) ) ( not ( = ?auto_302436 ?auto_302438 ) ) ( not ( = ?auto_302436 ?auto_302439 ) ) ( not ( = ?auto_302436 ?auto_302440 ) ) ( not ( = ?auto_302437 ?auto_302438 ) ) ( not ( = ?auto_302437 ?auto_302439 ) ) ( not ( = ?auto_302437 ?auto_302440 ) ) ( not ( = ?auto_302438 ?auto_302439 ) ) ( not ( = ?auto_302438 ?auto_302440 ) ) ( not ( = ?auto_302439 ?auto_302440 ) ) ( ON ?auto_302438 ?auto_302439 ) ( ON ?auto_302437 ?auto_302438 ) ( CLEAR ?auto_302435 ) ( ON ?auto_302436 ?auto_302437 ) ( CLEAR ?auto_302436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_302429 ?auto_302430 ?auto_302431 ?auto_302432 ?auto_302433 ?auto_302434 ?auto_302435 ?auto_302436 )
      ( MAKE-11PILE ?auto_302429 ?auto_302430 ?auto_302431 ?auto_302432 ?auto_302433 ?auto_302434 ?auto_302435 ?auto_302436 ?auto_302437 ?auto_302438 ?auto_302439 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302475 - BLOCK
      ?auto_302476 - BLOCK
      ?auto_302477 - BLOCK
      ?auto_302478 - BLOCK
      ?auto_302479 - BLOCK
      ?auto_302480 - BLOCK
      ?auto_302481 - BLOCK
      ?auto_302482 - BLOCK
      ?auto_302483 - BLOCK
      ?auto_302484 - BLOCK
      ?auto_302485 - BLOCK
    )
    :vars
    (
      ?auto_302486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302485 ?auto_302486 ) ( ON-TABLE ?auto_302475 ) ( ON ?auto_302476 ?auto_302475 ) ( ON ?auto_302477 ?auto_302476 ) ( ON ?auto_302478 ?auto_302477 ) ( ON ?auto_302479 ?auto_302478 ) ( ON ?auto_302480 ?auto_302479 ) ( not ( = ?auto_302475 ?auto_302476 ) ) ( not ( = ?auto_302475 ?auto_302477 ) ) ( not ( = ?auto_302475 ?auto_302478 ) ) ( not ( = ?auto_302475 ?auto_302479 ) ) ( not ( = ?auto_302475 ?auto_302480 ) ) ( not ( = ?auto_302475 ?auto_302481 ) ) ( not ( = ?auto_302475 ?auto_302482 ) ) ( not ( = ?auto_302475 ?auto_302483 ) ) ( not ( = ?auto_302475 ?auto_302484 ) ) ( not ( = ?auto_302475 ?auto_302485 ) ) ( not ( = ?auto_302475 ?auto_302486 ) ) ( not ( = ?auto_302476 ?auto_302477 ) ) ( not ( = ?auto_302476 ?auto_302478 ) ) ( not ( = ?auto_302476 ?auto_302479 ) ) ( not ( = ?auto_302476 ?auto_302480 ) ) ( not ( = ?auto_302476 ?auto_302481 ) ) ( not ( = ?auto_302476 ?auto_302482 ) ) ( not ( = ?auto_302476 ?auto_302483 ) ) ( not ( = ?auto_302476 ?auto_302484 ) ) ( not ( = ?auto_302476 ?auto_302485 ) ) ( not ( = ?auto_302476 ?auto_302486 ) ) ( not ( = ?auto_302477 ?auto_302478 ) ) ( not ( = ?auto_302477 ?auto_302479 ) ) ( not ( = ?auto_302477 ?auto_302480 ) ) ( not ( = ?auto_302477 ?auto_302481 ) ) ( not ( = ?auto_302477 ?auto_302482 ) ) ( not ( = ?auto_302477 ?auto_302483 ) ) ( not ( = ?auto_302477 ?auto_302484 ) ) ( not ( = ?auto_302477 ?auto_302485 ) ) ( not ( = ?auto_302477 ?auto_302486 ) ) ( not ( = ?auto_302478 ?auto_302479 ) ) ( not ( = ?auto_302478 ?auto_302480 ) ) ( not ( = ?auto_302478 ?auto_302481 ) ) ( not ( = ?auto_302478 ?auto_302482 ) ) ( not ( = ?auto_302478 ?auto_302483 ) ) ( not ( = ?auto_302478 ?auto_302484 ) ) ( not ( = ?auto_302478 ?auto_302485 ) ) ( not ( = ?auto_302478 ?auto_302486 ) ) ( not ( = ?auto_302479 ?auto_302480 ) ) ( not ( = ?auto_302479 ?auto_302481 ) ) ( not ( = ?auto_302479 ?auto_302482 ) ) ( not ( = ?auto_302479 ?auto_302483 ) ) ( not ( = ?auto_302479 ?auto_302484 ) ) ( not ( = ?auto_302479 ?auto_302485 ) ) ( not ( = ?auto_302479 ?auto_302486 ) ) ( not ( = ?auto_302480 ?auto_302481 ) ) ( not ( = ?auto_302480 ?auto_302482 ) ) ( not ( = ?auto_302480 ?auto_302483 ) ) ( not ( = ?auto_302480 ?auto_302484 ) ) ( not ( = ?auto_302480 ?auto_302485 ) ) ( not ( = ?auto_302480 ?auto_302486 ) ) ( not ( = ?auto_302481 ?auto_302482 ) ) ( not ( = ?auto_302481 ?auto_302483 ) ) ( not ( = ?auto_302481 ?auto_302484 ) ) ( not ( = ?auto_302481 ?auto_302485 ) ) ( not ( = ?auto_302481 ?auto_302486 ) ) ( not ( = ?auto_302482 ?auto_302483 ) ) ( not ( = ?auto_302482 ?auto_302484 ) ) ( not ( = ?auto_302482 ?auto_302485 ) ) ( not ( = ?auto_302482 ?auto_302486 ) ) ( not ( = ?auto_302483 ?auto_302484 ) ) ( not ( = ?auto_302483 ?auto_302485 ) ) ( not ( = ?auto_302483 ?auto_302486 ) ) ( not ( = ?auto_302484 ?auto_302485 ) ) ( not ( = ?auto_302484 ?auto_302486 ) ) ( not ( = ?auto_302485 ?auto_302486 ) ) ( ON ?auto_302484 ?auto_302485 ) ( ON ?auto_302483 ?auto_302484 ) ( ON ?auto_302482 ?auto_302483 ) ( CLEAR ?auto_302480 ) ( ON ?auto_302481 ?auto_302482 ) ( CLEAR ?auto_302481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_302475 ?auto_302476 ?auto_302477 ?auto_302478 ?auto_302479 ?auto_302480 ?auto_302481 )
      ( MAKE-11PILE ?auto_302475 ?auto_302476 ?auto_302477 ?auto_302478 ?auto_302479 ?auto_302480 ?auto_302481 ?auto_302482 ?auto_302483 ?auto_302484 ?auto_302485 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302521 - BLOCK
      ?auto_302522 - BLOCK
      ?auto_302523 - BLOCK
      ?auto_302524 - BLOCK
      ?auto_302525 - BLOCK
      ?auto_302526 - BLOCK
      ?auto_302527 - BLOCK
      ?auto_302528 - BLOCK
      ?auto_302529 - BLOCK
      ?auto_302530 - BLOCK
      ?auto_302531 - BLOCK
    )
    :vars
    (
      ?auto_302532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302531 ?auto_302532 ) ( ON-TABLE ?auto_302521 ) ( ON ?auto_302522 ?auto_302521 ) ( ON ?auto_302523 ?auto_302522 ) ( ON ?auto_302524 ?auto_302523 ) ( ON ?auto_302525 ?auto_302524 ) ( not ( = ?auto_302521 ?auto_302522 ) ) ( not ( = ?auto_302521 ?auto_302523 ) ) ( not ( = ?auto_302521 ?auto_302524 ) ) ( not ( = ?auto_302521 ?auto_302525 ) ) ( not ( = ?auto_302521 ?auto_302526 ) ) ( not ( = ?auto_302521 ?auto_302527 ) ) ( not ( = ?auto_302521 ?auto_302528 ) ) ( not ( = ?auto_302521 ?auto_302529 ) ) ( not ( = ?auto_302521 ?auto_302530 ) ) ( not ( = ?auto_302521 ?auto_302531 ) ) ( not ( = ?auto_302521 ?auto_302532 ) ) ( not ( = ?auto_302522 ?auto_302523 ) ) ( not ( = ?auto_302522 ?auto_302524 ) ) ( not ( = ?auto_302522 ?auto_302525 ) ) ( not ( = ?auto_302522 ?auto_302526 ) ) ( not ( = ?auto_302522 ?auto_302527 ) ) ( not ( = ?auto_302522 ?auto_302528 ) ) ( not ( = ?auto_302522 ?auto_302529 ) ) ( not ( = ?auto_302522 ?auto_302530 ) ) ( not ( = ?auto_302522 ?auto_302531 ) ) ( not ( = ?auto_302522 ?auto_302532 ) ) ( not ( = ?auto_302523 ?auto_302524 ) ) ( not ( = ?auto_302523 ?auto_302525 ) ) ( not ( = ?auto_302523 ?auto_302526 ) ) ( not ( = ?auto_302523 ?auto_302527 ) ) ( not ( = ?auto_302523 ?auto_302528 ) ) ( not ( = ?auto_302523 ?auto_302529 ) ) ( not ( = ?auto_302523 ?auto_302530 ) ) ( not ( = ?auto_302523 ?auto_302531 ) ) ( not ( = ?auto_302523 ?auto_302532 ) ) ( not ( = ?auto_302524 ?auto_302525 ) ) ( not ( = ?auto_302524 ?auto_302526 ) ) ( not ( = ?auto_302524 ?auto_302527 ) ) ( not ( = ?auto_302524 ?auto_302528 ) ) ( not ( = ?auto_302524 ?auto_302529 ) ) ( not ( = ?auto_302524 ?auto_302530 ) ) ( not ( = ?auto_302524 ?auto_302531 ) ) ( not ( = ?auto_302524 ?auto_302532 ) ) ( not ( = ?auto_302525 ?auto_302526 ) ) ( not ( = ?auto_302525 ?auto_302527 ) ) ( not ( = ?auto_302525 ?auto_302528 ) ) ( not ( = ?auto_302525 ?auto_302529 ) ) ( not ( = ?auto_302525 ?auto_302530 ) ) ( not ( = ?auto_302525 ?auto_302531 ) ) ( not ( = ?auto_302525 ?auto_302532 ) ) ( not ( = ?auto_302526 ?auto_302527 ) ) ( not ( = ?auto_302526 ?auto_302528 ) ) ( not ( = ?auto_302526 ?auto_302529 ) ) ( not ( = ?auto_302526 ?auto_302530 ) ) ( not ( = ?auto_302526 ?auto_302531 ) ) ( not ( = ?auto_302526 ?auto_302532 ) ) ( not ( = ?auto_302527 ?auto_302528 ) ) ( not ( = ?auto_302527 ?auto_302529 ) ) ( not ( = ?auto_302527 ?auto_302530 ) ) ( not ( = ?auto_302527 ?auto_302531 ) ) ( not ( = ?auto_302527 ?auto_302532 ) ) ( not ( = ?auto_302528 ?auto_302529 ) ) ( not ( = ?auto_302528 ?auto_302530 ) ) ( not ( = ?auto_302528 ?auto_302531 ) ) ( not ( = ?auto_302528 ?auto_302532 ) ) ( not ( = ?auto_302529 ?auto_302530 ) ) ( not ( = ?auto_302529 ?auto_302531 ) ) ( not ( = ?auto_302529 ?auto_302532 ) ) ( not ( = ?auto_302530 ?auto_302531 ) ) ( not ( = ?auto_302530 ?auto_302532 ) ) ( not ( = ?auto_302531 ?auto_302532 ) ) ( ON ?auto_302530 ?auto_302531 ) ( ON ?auto_302529 ?auto_302530 ) ( ON ?auto_302528 ?auto_302529 ) ( ON ?auto_302527 ?auto_302528 ) ( CLEAR ?auto_302525 ) ( ON ?auto_302526 ?auto_302527 ) ( CLEAR ?auto_302526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_302521 ?auto_302522 ?auto_302523 ?auto_302524 ?auto_302525 ?auto_302526 )
      ( MAKE-11PILE ?auto_302521 ?auto_302522 ?auto_302523 ?auto_302524 ?auto_302525 ?auto_302526 ?auto_302527 ?auto_302528 ?auto_302529 ?auto_302530 ?auto_302531 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302567 - BLOCK
      ?auto_302568 - BLOCK
      ?auto_302569 - BLOCK
      ?auto_302570 - BLOCK
      ?auto_302571 - BLOCK
      ?auto_302572 - BLOCK
      ?auto_302573 - BLOCK
      ?auto_302574 - BLOCK
      ?auto_302575 - BLOCK
      ?auto_302576 - BLOCK
      ?auto_302577 - BLOCK
    )
    :vars
    (
      ?auto_302578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302577 ?auto_302578 ) ( ON-TABLE ?auto_302567 ) ( ON ?auto_302568 ?auto_302567 ) ( ON ?auto_302569 ?auto_302568 ) ( ON ?auto_302570 ?auto_302569 ) ( not ( = ?auto_302567 ?auto_302568 ) ) ( not ( = ?auto_302567 ?auto_302569 ) ) ( not ( = ?auto_302567 ?auto_302570 ) ) ( not ( = ?auto_302567 ?auto_302571 ) ) ( not ( = ?auto_302567 ?auto_302572 ) ) ( not ( = ?auto_302567 ?auto_302573 ) ) ( not ( = ?auto_302567 ?auto_302574 ) ) ( not ( = ?auto_302567 ?auto_302575 ) ) ( not ( = ?auto_302567 ?auto_302576 ) ) ( not ( = ?auto_302567 ?auto_302577 ) ) ( not ( = ?auto_302567 ?auto_302578 ) ) ( not ( = ?auto_302568 ?auto_302569 ) ) ( not ( = ?auto_302568 ?auto_302570 ) ) ( not ( = ?auto_302568 ?auto_302571 ) ) ( not ( = ?auto_302568 ?auto_302572 ) ) ( not ( = ?auto_302568 ?auto_302573 ) ) ( not ( = ?auto_302568 ?auto_302574 ) ) ( not ( = ?auto_302568 ?auto_302575 ) ) ( not ( = ?auto_302568 ?auto_302576 ) ) ( not ( = ?auto_302568 ?auto_302577 ) ) ( not ( = ?auto_302568 ?auto_302578 ) ) ( not ( = ?auto_302569 ?auto_302570 ) ) ( not ( = ?auto_302569 ?auto_302571 ) ) ( not ( = ?auto_302569 ?auto_302572 ) ) ( not ( = ?auto_302569 ?auto_302573 ) ) ( not ( = ?auto_302569 ?auto_302574 ) ) ( not ( = ?auto_302569 ?auto_302575 ) ) ( not ( = ?auto_302569 ?auto_302576 ) ) ( not ( = ?auto_302569 ?auto_302577 ) ) ( not ( = ?auto_302569 ?auto_302578 ) ) ( not ( = ?auto_302570 ?auto_302571 ) ) ( not ( = ?auto_302570 ?auto_302572 ) ) ( not ( = ?auto_302570 ?auto_302573 ) ) ( not ( = ?auto_302570 ?auto_302574 ) ) ( not ( = ?auto_302570 ?auto_302575 ) ) ( not ( = ?auto_302570 ?auto_302576 ) ) ( not ( = ?auto_302570 ?auto_302577 ) ) ( not ( = ?auto_302570 ?auto_302578 ) ) ( not ( = ?auto_302571 ?auto_302572 ) ) ( not ( = ?auto_302571 ?auto_302573 ) ) ( not ( = ?auto_302571 ?auto_302574 ) ) ( not ( = ?auto_302571 ?auto_302575 ) ) ( not ( = ?auto_302571 ?auto_302576 ) ) ( not ( = ?auto_302571 ?auto_302577 ) ) ( not ( = ?auto_302571 ?auto_302578 ) ) ( not ( = ?auto_302572 ?auto_302573 ) ) ( not ( = ?auto_302572 ?auto_302574 ) ) ( not ( = ?auto_302572 ?auto_302575 ) ) ( not ( = ?auto_302572 ?auto_302576 ) ) ( not ( = ?auto_302572 ?auto_302577 ) ) ( not ( = ?auto_302572 ?auto_302578 ) ) ( not ( = ?auto_302573 ?auto_302574 ) ) ( not ( = ?auto_302573 ?auto_302575 ) ) ( not ( = ?auto_302573 ?auto_302576 ) ) ( not ( = ?auto_302573 ?auto_302577 ) ) ( not ( = ?auto_302573 ?auto_302578 ) ) ( not ( = ?auto_302574 ?auto_302575 ) ) ( not ( = ?auto_302574 ?auto_302576 ) ) ( not ( = ?auto_302574 ?auto_302577 ) ) ( not ( = ?auto_302574 ?auto_302578 ) ) ( not ( = ?auto_302575 ?auto_302576 ) ) ( not ( = ?auto_302575 ?auto_302577 ) ) ( not ( = ?auto_302575 ?auto_302578 ) ) ( not ( = ?auto_302576 ?auto_302577 ) ) ( not ( = ?auto_302576 ?auto_302578 ) ) ( not ( = ?auto_302577 ?auto_302578 ) ) ( ON ?auto_302576 ?auto_302577 ) ( ON ?auto_302575 ?auto_302576 ) ( ON ?auto_302574 ?auto_302575 ) ( ON ?auto_302573 ?auto_302574 ) ( ON ?auto_302572 ?auto_302573 ) ( CLEAR ?auto_302570 ) ( ON ?auto_302571 ?auto_302572 ) ( CLEAR ?auto_302571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_302567 ?auto_302568 ?auto_302569 ?auto_302570 ?auto_302571 )
      ( MAKE-11PILE ?auto_302567 ?auto_302568 ?auto_302569 ?auto_302570 ?auto_302571 ?auto_302572 ?auto_302573 ?auto_302574 ?auto_302575 ?auto_302576 ?auto_302577 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302613 - BLOCK
      ?auto_302614 - BLOCK
      ?auto_302615 - BLOCK
      ?auto_302616 - BLOCK
      ?auto_302617 - BLOCK
      ?auto_302618 - BLOCK
      ?auto_302619 - BLOCK
      ?auto_302620 - BLOCK
      ?auto_302621 - BLOCK
      ?auto_302622 - BLOCK
      ?auto_302623 - BLOCK
    )
    :vars
    (
      ?auto_302624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302623 ?auto_302624 ) ( ON-TABLE ?auto_302613 ) ( ON ?auto_302614 ?auto_302613 ) ( ON ?auto_302615 ?auto_302614 ) ( not ( = ?auto_302613 ?auto_302614 ) ) ( not ( = ?auto_302613 ?auto_302615 ) ) ( not ( = ?auto_302613 ?auto_302616 ) ) ( not ( = ?auto_302613 ?auto_302617 ) ) ( not ( = ?auto_302613 ?auto_302618 ) ) ( not ( = ?auto_302613 ?auto_302619 ) ) ( not ( = ?auto_302613 ?auto_302620 ) ) ( not ( = ?auto_302613 ?auto_302621 ) ) ( not ( = ?auto_302613 ?auto_302622 ) ) ( not ( = ?auto_302613 ?auto_302623 ) ) ( not ( = ?auto_302613 ?auto_302624 ) ) ( not ( = ?auto_302614 ?auto_302615 ) ) ( not ( = ?auto_302614 ?auto_302616 ) ) ( not ( = ?auto_302614 ?auto_302617 ) ) ( not ( = ?auto_302614 ?auto_302618 ) ) ( not ( = ?auto_302614 ?auto_302619 ) ) ( not ( = ?auto_302614 ?auto_302620 ) ) ( not ( = ?auto_302614 ?auto_302621 ) ) ( not ( = ?auto_302614 ?auto_302622 ) ) ( not ( = ?auto_302614 ?auto_302623 ) ) ( not ( = ?auto_302614 ?auto_302624 ) ) ( not ( = ?auto_302615 ?auto_302616 ) ) ( not ( = ?auto_302615 ?auto_302617 ) ) ( not ( = ?auto_302615 ?auto_302618 ) ) ( not ( = ?auto_302615 ?auto_302619 ) ) ( not ( = ?auto_302615 ?auto_302620 ) ) ( not ( = ?auto_302615 ?auto_302621 ) ) ( not ( = ?auto_302615 ?auto_302622 ) ) ( not ( = ?auto_302615 ?auto_302623 ) ) ( not ( = ?auto_302615 ?auto_302624 ) ) ( not ( = ?auto_302616 ?auto_302617 ) ) ( not ( = ?auto_302616 ?auto_302618 ) ) ( not ( = ?auto_302616 ?auto_302619 ) ) ( not ( = ?auto_302616 ?auto_302620 ) ) ( not ( = ?auto_302616 ?auto_302621 ) ) ( not ( = ?auto_302616 ?auto_302622 ) ) ( not ( = ?auto_302616 ?auto_302623 ) ) ( not ( = ?auto_302616 ?auto_302624 ) ) ( not ( = ?auto_302617 ?auto_302618 ) ) ( not ( = ?auto_302617 ?auto_302619 ) ) ( not ( = ?auto_302617 ?auto_302620 ) ) ( not ( = ?auto_302617 ?auto_302621 ) ) ( not ( = ?auto_302617 ?auto_302622 ) ) ( not ( = ?auto_302617 ?auto_302623 ) ) ( not ( = ?auto_302617 ?auto_302624 ) ) ( not ( = ?auto_302618 ?auto_302619 ) ) ( not ( = ?auto_302618 ?auto_302620 ) ) ( not ( = ?auto_302618 ?auto_302621 ) ) ( not ( = ?auto_302618 ?auto_302622 ) ) ( not ( = ?auto_302618 ?auto_302623 ) ) ( not ( = ?auto_302618 ?auto_302624 ) ) ( not ( = ?auto_302619 ?auto_302620 ) ) ( not ( = ?auto_302619 ?auto_302621 ) ) ( not ( = ?auto_302619 ?auto_302622 ) ) ( not ( = ?auto_302619 ?auto_302623 ) ) ( not ( = ?auto_302619 ?auto_302624 ) ) ( not ( = ?auto_302620 ?auto_302621 ) ) ( not ( = ?auto_302620 ?auto_302622 ) ) ( not ( = ?auto_302620 ?auto_302623 ) ) ( not ( = ?auto_302620 ?auto_302624 ) ) ( not ( = ?auto_302621 ?auto_302622 ) ) ( not ( = ?auto_302621 ?auto_302623 ) ) ( not ( = ?auto_302621 ?auto_302624 ) ) ( not ( = ?auto_302622 ?auto_302623 ) ) ( not ( = ?auto_302622 ?auto_302624 ) ) ( not ( = ?auto_302623 ?auto_302624 ) ) ( ON ?auto_302622 ?auto_302623 ) ( ON ?auto_302621 ?auto_302622 ) ( ON ?auto_302620 ?auto_302621 ) ( ON ?auto_302619 ?auto_302620 ) ( ON ?auto_302618 ?auto_302619 ) ( ON ?auto_302617 ?auto_302618 ) ( CLEAR ?auto_302615 ) ( ON ?auto_302616 ?auto_302617 ) ( CLEAR ?auto_302616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_302613 ?auto_302614 ?auto_302615 ?auto_302616 )
      ( MAKE-11PILE ?auto_302613 ?auto_302614 ?auto_302615 ?auto_302616 ?auto_302617 ?auto_302618 ?auto_302619 ?auto_302620 ?auto_302621 ?auto_302622 ?auto_302623 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302659 - BLOCK
      ?auto_302660 - BLOCK
      ?auto_302661 - BLOCK
      ?auto_302662 - BLOCK
      ?auto_302663 - BLOCK
      ?auto_302664 - BLOCK
      ?auto_302665 - BLOCK
      ?auto_302666 - BLOCK
      ?auto_302667 - BLOCK
      ?auto_302668 - BLOCK
      ?auto_302669 - BLOCK
    )
    :vars
    (
      ?auto_302670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302669 ?auto_302670 ) ( ON-TABLE ?auto_302659 ) ( ON ?auto_302660 ?auto_302659 ) ( not ( = ?auto_302659 ?auto_302660 ) ) ( not ( = ?auto_302659 ?auto_302661 ) ) ( not ( = ?auto_302659 ?auto_302662 ) ) ( not ( = ?auto_302659 ?auto_302663 ) ) ( not ( = ?auto_302659 ?auto_302664 ) ) ( not ( = ?auto_302659 ?auto_302665 ) ) ( not ( = ?auto_302659 ?auto_302666 ) ) ( not ( = ?auto_302659 ?auto_302667 ) ) ( not ( = ?auto_302659 ?auto_302668 ) ) ( not ( = ?auto_302659 ?auto_302669 ) ) ( not ( = ?auto_302659 ?auto_302670 ) ) ( not ( = ?auto_302660 ?auto_302661 ) ) ( not ( = ?auto_302660 ?auto_302662 ) ) ( not ( = ?auto_302660 ?auto_302663 ) ) ( not ( = ?auto_302660 ?auto_302664 ) ) ( not ( = ?auto_302660 ?auto_302665 ) ) ( not ( = ?auto_302660 ?auto_302666 ) ) ( not ( = ?auto_302660 ?auto_302667 ) ) ( not ( = ?auto_302660 ?auto_302668 ) ) ( not ( = ?auto_302660 ?auto_302669 ) ) ( not ( = ?auto_302660 ?auto_302670 ) ) ( not ( = ?auto_302661 ?auto_302662 ) ) ( not ( = ?auto_302661 ?auto_302663 ) ) ( not ( = ?auto_302661 ?auto_302664 ) ) ( not ( = ?auto_302661 ?auto_302665 ) ) ( not ( = ?auto_302661 ?auto_302666 ) ) ( not ( = ?auto_302661 ?auto_302667 ) ) ( not ( = ?auto_302661 ?auto_302668 ) ) ( not ( = ?auto_302661 ?auto_302669 ) ) ( not ( = ?auto_302661 ?auto_302670 ) ) ( not ( = ?auto_302662 ?auto_302663 ) ) ( not ( = ?auto_302662 ?auto_302664 ) ) ( not ( = ?auto_302662 ?auto_302665 ) ) ( not ( = ?auto_302662 ?auto_302666 ) ) ( not ( = ?auto_302662 ?auto_302667 ) ) ( not ( = ?auto_302662 ?auto_302668 ) ) ( not ( = ?auto_302662 ?auto_302669 ) ) ( not ( = ?auto_302662 ?auto_302670 ) ) ( not ( = ?auto_302663 ?auto_302664 ) ) ( not ( = ?auto_302663 ?auto_302665 ) ) ( not ( = ?auto_302663 ?auto_302666 ) ) ( not ( = ?auto_302663 ?auto_302667 ) ) ( not ( = ?auto_302663 ?auto_302668 ) ) ( not ( = ?auto_302663 ?auto_302669 ) ) ( not ( = ?auto_302663 ?auto_302670 ) ) ( not ( = ?auto_302664 ?auto_302665 ) ) ( not ( = ?auto_302664 ?auto_302666 ) ) ( not ( = ?auto_302664 ?auto_302667 ) ) ( not ( = ?auto_302664 ?auto_302668 ) ) ( not ( = ?auto_302664 ?auto_302669 ) ) ( not ( = ?auto_302664 ?auto_302670 ) ) ( not ( = ?auto_302665 ?auto_302666 ) ) ( not ( = ?auto_302665 ?auto_302667 ) ) ( not ( = ?auto_302665 ?auto_302668 ) ) ( not ( = ?auto_302665 ?auto_302669 ) ) ( not ( = ?auto_302665 ?auto_302670 ) ) ( not ( = ?auto_302666 ?auto_302667 ) ) ( not ( = ?auto_302666 ?auto_302668 ) ) ( not ( = ?auto_302666 ?auto_302669 ) ) ( not ( = ?auto_302666 ?auto_302670 ) ) ( not ( = ?auto_302667 ?auto_302668 ) ) ( not ( = ?auto_302667 ?auto_302669 ) ) ( not ( = ?auto_302667 ?auto_302670 ) ) ( not ( = ?auto_302668 ?auto_302669 ) ) ( not ( = ?auto_302668 ?auto_302670 ) ) ( not ( = ?auto_302669 ?auto_302670 ) ) ( ON ?auto_302668 ?auto_302669 ) ( ON ?auto_302667 ?auto_302668 ) ( ON ?auto_302666 ?auto_302667 ) ( ON ?auto_302665 ?auto_302666 ) ( ON ?auto_302664 ?auto_302665 ) ( ON ?auto_302663 ?auto_302664 ) ( ON ?auto_302662 ?auto_302663 ) ( CLEAR ?auto_302660 ) ( ON ?auto_302661 ?auto_302662 ) ( CLEAR ?auto_302661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_302659 ?auto_302660 ?auto_302661 )
      ( MAKE-11PILE ?auto_302659 ?auto_302660 ?auto_302661 ?auto_302662 ?auto_302663 ?auto_302664 ?auto_302665 ?auto_302666 ?auto_302667 ?auto_302668 ?auto_302669 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302705 - BLOCK
      ?auto_302706 - BLOCK
      ?auto_302707 - BLOCK
      ?auto_302708 - BLOCK
      ?auto_302709 - BLOCK
      ?auto_302710 - BLOCK
      ?auto_302711 - BLOCK
      ?auto_302712 - BLOCK
      ?auto_302713 - BLOCK
      ?auto_302714 - BLOCK
      ?auto_302715 - BLOCK
    )
    :vars
    (
      ?auto_302716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302715 ?auto_302716 ) ( ON-TABLE ?auto_302705 ) ( not ( = ?auto_302705 ?auto_302706 ) ) ( not ( = ?auto_302705 ?auto_302707 ) ) ( not ( = ?auto_302705 ?auto_302708 ) ) ( not ( = ?auto_302705 ?auto_302709 ) ) ( not ( = ?auto_302705 ?auto_302710 ) ) ( not ( = ?auto_302705 ?auto_302711 ) ) ( not ( = ?auto_302705 ?auto_302712 ) ) ( not ( = ?auto_302705 ?auto_302713 ) ) ( not ( = ?auto_302705 ?auto_302714 ) ) ( not ( = ?auto_302705 ?auto_302715 ) ) ( not ( = ?auto_302705 ?auto_302716 ) ) ( not ( = ?auto_302706 ?auto_302707 ) ) ( not ( = ?auto_302706 ?auto_302708 ) ) ( not ( = ?auto_302706 ?auto_302709 ) ) ( not ( = ?auto_302706 ?auto_302710 ) ) ( not ( = ?auto_302706 ?auto_302711 ) ) ( not ( = ?auto_302706 ?auto_302712 ) ) ( not ( = ?auto_302706 ?auto_302713 ) ) ( not ( = ?auto_302706 ?auto_302714 ) ) ( not ( = ?auto_302706 ?auto_302715 ) ) ( not ( = ?auto_302706 ?auto_302716 ) ) ( not ( = ?auto_302707 ?auto_302708 ) ) ( not ( = ?auto_302707 ?auto_302709 ) ) ( not ( = ?auto_302707 ?auto_302710 ) ) ( not ( = ?auto_302707 ?auto_302711 ) ) ( not ( = ?auto_302707 ?auto_302712 ) ) ( not ( = ?auto_302707 ?auto_302713 ) ) ( not ( = ?auto_302707 ?auto_302714 ) ) ( not ( = ?auto_302707 ?auto_302715 ) ) ( not ( = ?auto_302707 ?auto_302716 ) ) ( not ( = ?auto_302708 ?auto_302709 ) ) ( not ( = ?auto_302708 ?auto_302710 ) ) ( not ( = ?auto_302708 ?auto_302711 ) ) ( not ( = ?auto_302708 ?auto_302712 ) ) ( not ( = ?auto_302708 ?auto_302713 ) ) ( not ( = ?auto_302708 ?auto_302714 ) ) ( not ( = ?auto_302708 ?auto_302715 ) ) ( not ( = ?auto_302708 ?auto_302716 ) ) ( not ( = ?auto_302709 ?auto_302710 ) ) ( not ( = ?auto_302709 ?auto_302711 ) ) ( not ( = ?auto_302709 ?auto_302712 ) ) ( not ( = ?auto_302709 ?auto_302713 ) ) ( not ( = ?auto_302709 ?auto_302714 ) ) ( not ( = ?auto_302709 ?auto_302715 ) ) ( not ( = ?auto_302709 ?auto_302716 ) ) ( not ( = ?auto_302710 ?auto_302711 ) ) ( not ( = ?auto_302710 ?auto_302712 ) ) ( not ( = ?auto_302710 ?auto_302713 ) ) ( not ( = ?auto_302710 ?auto_302714 ) ) ( not ( = ?auto_302710 ?auto_302715 ) ) ( not ( = ?auto_302710 ?auto_302716 ) ) ( not ( = ?auto_302711 ?auto_302712 ) ) ( not ( = ?auto_302711 ?auto_302713 ) ) ( not ( = ?auto_302711 ?auto_302714 ) ) ( not ( = ?auto_302711 ?auto_302715 ) ) ( not ( = ?auto_302711 ?auto_302716 ) ) ( not ( = ?auto_302712 ?auto_302713 ) ) ( not ( = ?auto_302712 ?auto_302714 ) ) ( not ( = ?auto_302712 ?auto_302715 ) ) ( not ( = ?auto_302712 ?auto_302716 ) ) ( not ( = ?auto_302713 ?auto_302714 ) ) ( not ( = ?auto_302713 ?auto_302715 ) ) ( not ( = ?auto_302713 ?auto_302716 ) ) ( not ( = ?auto_302714 ?auto_302715 ) ) ( not ( = ?auto_302714 ?auto_302716 ) ) ( not ( = ?auto_302715 ?auto_302716 ) ) ( ON ?auto_302714 ?auto_302715 ) ( ON ?auto_302713 ?auto_302714 ) ( ON ?auto_302712 ?auto_302713 ) ( ON ?auto_302711 ?auto_302712 ) ( ON ?auto_302710 ?auto_302711 ) ( ON ?auto_302709 ?auto_302710 ) ( ON ?auto_302708 ?auto_302709 ) ( ON ?auto_302707 ?auto_302708 ) ( CLEAR ?auto_302705 ) ( ON ?auto_302706 ?auto_302707 ) ( CLEAR ?auto_302706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_302705 ?auto_302706 )
      ( MAKE-11PILE ?auto_302705 ?auto_302706 ?auto_302707 ?auto_302708 ?auto_302709 ?auto_302710 ?auto_302711 ?auto_302712 ?auto_302713 ?auto_302714 ?auto_302715 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_302751 - BLOCK
      ?auto_302752 - BLOCK
      ?auto_302753 - BLOCK
      ?auto_302754 - BLOCK
      ?auto_302755 - BLOCK
      ?auto_302756 - BLOCK
      ?auto_302757 - BLOCK
      ?auto_302758 - BLOCK
      ?auto_302759 - BLOCK
      ?auto_302760 - BLOCK
      ?auto_302761 - BLOCK
    )
    :vars
    (
      ?auto_302762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302761 ?auto_302762 ) ( not ( = ?auto_302751 ?auto_302752 ) ) ( not ( = ?auto_302751 ?auto_302753 ) ) ( not ( = ?auto_302751 ?auto_302754 ) ) ( not ( = ?auto_302751 ?auto_302755 ) ) ( not ( = ?auto_302751 ?auto_302756 ) ) ( not ( = ?auto_302751 ?auto_302757 ) ) ( not ( = ?auto_302751 ?auto_302758 ) ) ( not ( = ?auto_302751 ?auto_302759 ) ) ( not ( = ?auto_302751 ?auto_302760 ) ) ( not ( = ?auto_302751 ?auto_302761 ) ) ( not ( = ?auto_302751 ?auto_302762 ) ) ( not ( = ?auto_302752 ?auto_302753 ) ) ( not ( = ?auto_302752 ?auto_302754 ) ) ( not ( = ?auto_302752 ?auto_302755 ) ) ( not ( = ?auto_302752 ?auto_302756 ) ) ( not ( = ?auto_302752 ?auto_302757 ) ) ( not ( = ?auto_302752 ?auto_302758 ) ) ( not ( = ?auto_302752 ?auto_302759 ) ) ( not ( = ?auto_302752 ?auto_302760 ) ) ( not ( = ?auto_302752 ?auto_302761 ) ) ( not ( = ?auto_302752 ?auto_302762 ) ) ( not ( = ?auto_302753 ?auto_302754 ) ) ( not ( = ?auto_302753 ?auto_302755 ) ) ( not ( = ?auto_302753 ?auto_302756 ) ) ( not ( = ?auto_302753 ?auto_302757 ) ) ( not ( = ?auto_302753 ?auto_302758 ) ) ( not ( = ?auto_302753 ?auto_302759 ) ) ( not ( = ?auto_302753 ?auto_302760 ) ) ( not ( = ?auto_302753 ?auto_302761 ) ) ( not ( = ?auto_302753 ?auto_302762 ) ) ( not ( = ?auto_302754 ?auto_302755 ) ) ( not ( = ?auto_302754 ?auto_302756 ) ) ( not ( = ?auto_302754 ?auto_302757 ) ) ( not ( = ?auto_302754 ?auto_302758 ) ) ( not ( = ?auto_302754 ?auto_302759 ) ) ( not ( = ?auto_302754 ?auto_302760 ) ) ( not ( = ?auto_302754 ?auto_302761 ) ) ( not ( = ?auto_302754 ?auto_302762 ) ) ( not ( = ?auto_302755 ?auto_302756 ) ) ( not ( = ?auto_302755 ?auto_302757 ) ) ( not ( = ?auto_302755 ?auto_302758 ) ) ( not ( = ?auto_302755 ?auto_302759 ) ) ( not ( = ?auto_302755 ?auto_302760 ) ) ( not ( = ?auto_302755 ?auto_302761 ) ) ( not ( = ?auto_302755 ?auto_302762 ) ) ( not ( = ?auto_302756 ?auto_302757 ) ) ( not ( = ?auto_302756 ?auto_302758 ) ) ( not ( = ?auto_302756 ?auto_302759 ) ) ( not ( = ?auto_302756 ?auto_302760 ) ) ( not ( = ?auto_302756 ?auto_302761 ) ) ( not ( = ?auto_302756 ?auto_302762 ) ) ( not ( = ?auto_302757 ?auto_302758 ) ) ( not ( = ?auto_302757 ?auto_302759 ) ) ( not ( = ?auto_302757 ?auto_302760 ) ) ( not ( = ?auto_302757 ?auto_302761 ) ) ( not ( = ?auto_302757 ?auto_302762 ) ) ( not ( = ?auto_302758 ?auto_302759 ) ) ( not ( = ?auto_302758 ?auto_302760 ) ) ( not ( = ?auto_302758 ?auto_302761 ) ) ( not ( = ?auto_302758 ?auto_302762 ) ) ( not ( = ?auto_302759 ?auto_302760 ) ) ( not ( = ?auto_302759 ?auto_302761 ) ) ( not ( = ?auto_302759 ?auto_302762 ) ) ( not ( = ?auto_302760 ?auto_302761 ) ) ( not ( = ?auto_302760 ?auto_302762 ) ) ( not ( = ?auto_302761 ?auto_302762 ) ) ( ON ?auto_302760 ?auto_302761 ) ( ON ?auto_302759 ?auto_302760 ) ( ON ?auto_302758 ?auto_302759 ) ( ON ?auto_302757 ?auto_302758 ) ( ON ?auto_302756 ?auto_302757 ) ( ON ?auto_302755 ?auto_302756 ) ( ON ?auto_302754 ?auto_302755 ) ( ON ?auto_302753 ?auto_302754 ) ( ON ?auto_302752 ?auto_302753 ) ( ON ?auto_302751 ?auto_302752 ) ( CLEAR ?auto_302751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_302751 )
      ( MAKE-11PILE ?auto_302751 ?auto_302752 ?auto_302753 ?auto_302754 ?auto_302755 ?auto_302756 ?auto_302757 ?auto_302758 ?auto_302759 ?auto_302760 ?auto_302761 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_302798 - BLOCK
      ?auto_302799 - BLOCK
      ?auto_302800 - BLOCK
      ?auto_302801 - BLOCK
      ?auto_302802 - BLOCK
      ?auto_302803 - BLOCK
      ?auto_302804 - BLOCK
      ?auto_302805 - BLOCK
      ?auto_302806 - BLOCK
      ?auto_302807 - BLOCK
      ?auto_302808 - BLOCK
      ?auto_302809 - BLOCK
    )
    :vars
    (
      ?auto_302810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_302808 ) ( ON ?auto_302809 ?auto_302810 ) ( CLEAR ?auto_302809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_302798 ) ( ON ?auto_302799 ?auto_302798 ) ( ON ?auto_302800 ?auto_302799 ) ( ON ?auto_302801 ?auto_302800 ) ( ON ?auto_302802 ?auto_302801 ) ( ON ?auto_302803 ?auto_302802 ) ( ON ?auto_302804 ?auto_302803 ) ( ON ?auto_302805 ?auto_302804 ) ( ON ?auto_302806 ?auto_302805 ) ( ON ?auto_302807 ?auto_302806 ) ( ON ?auto_302808 ?auto_302807 ) ( not ( = ?auto_302798 ?auto_302799 ) ) ( not ( = ?auto_302798 ?auto_302800 ) ) ( not ( = ?auto_302798 ?auto_302801 ) ) ( not ( = ?auto_302798 ?auto_302802 ) ) ( not ( = ?auto_302798 ?auto_302803 ) ) ( not ( = ?auto_302798 ?auto_302804 ) ) ( not ( = ?auto_302798 ?auto_302805 ) ) ( not ( = ?auto_302798 ?auto_302806 ) ) ( not ( = ?auto_302798 ?auto_302807 ) ) ( not ( = ?auto_302798 ?auto_302808 ) ) ( not ( = ?auto_302798 ?auto_302809 ) ) ( not ( = ?auto_302798 ?auto_302810 ) ) ( not ( = ?auto_302799 ?auto_302800 ) ) ( not ( = ?auto_302799 ?auto_302801 ) ) ( not ( = ?auto_302799 ?auto_302802 ) ) ( not ( = ?auto_302799 ?auto_302803 ) ) ( not ( = ?auto_302799 ?auto_302804 ) ) ( not ( = ?auto_302799 ?auto_302805 ) ) ( not ( = ?auto_302799 ?auto_302806 ) ) ( not ( = ?auto_302799 ?auto_302807 ) ) ( not ( = ?auto_302799 ?auto_302808 ) ) ( not ( = ?auto_302799 ?auto_302809 ) ) ( not ( = ?auto_302799 ?auto_302810 ) ) ( not ( = ?auto_302800 ?auto_302801 ) ) ( not ( = ?auto_302800 ?auto_302802 ) ) ( not ( = ?auto_302800 ?auto_302803 ) ) ( not ( = ?auto_302800 ?auto_302804 ) ) ( not ( = ?auto_302800 ?auto_302805 ) ) ( not ( = ?auto_302800 ?auto_302806 ) ) ( not ( = ?auto_302800 ?auto_302807 ) ) ( not ( = ?auto_302800 ?auto_302808 ) ) ( not ( = ?auto_302800 ?auto_302809 ) ) ( not ( = ?auto_302800 ?auto_302810 ) ) ( not ( = ?auto_302801 ?auto_302802 ) ) ( not ( = ?auto_302801 ?auto_302803 ) ) ( not ( = ?auto_302801 ?auto_302804 ) ) ( not ( = ?auto_302801 ?auto_302805 ) ) ( not ( = ?auto_302801 ?auto_302806 ) ) ( not ( = ?auto_302801 ?auto_302807 ) ) ( not ( = ?auto_302801 ?auto_302808 ) ) ( not ( = ?auto_302801 ?auto_302809 ) ) ( not ( = ?auto_302801 ?auto_302810 ) ) ( not ( = ?auto_302802 ?auto_302803 ) ) ( not ( = ?auto_302802 ?auto_302804 ) ) ( not ( = ?auto_302802 ?auto_302805 ) ) ( not ( = ?auto_302802 ?auto_302806 ) ) ( not ( = ?auto_302802 ?auto_302807 ) ) ( not ( = ?auto_302802 ?auto_302808 ) ) ( not ( = ?auto_302802 ?auto_302809 ) ) ( not ( = ?auto_302802 ?auto_302810 ) ) ( not ( = ?auto_302803 ?auto_302804 ) ) ( not ( = ?auto_302803 ?auto_302805 ) ) ( not ( = ?auto_302803 ?auto_302806 ) ) ( not ( = ?auto_302803 ?auto_302807 ) ) ( not ( = ?auto_302803 ?auto_302808 ) ) ( not ( = ?auto_302803 ?auto_302809 ) ) ( not ( = ?auto_302803 ?auto_302810 ) ) ( not ( = ?auto_302804 ?auto_302805 ) ) ( not ( = ?auto_302804 ?auto_302806 ) ) ( not ( = ?auto_302804 ?auto_302807 ) ) ( not ( = ?auto_302804 ?auto_302808 ) ) ( not ( = ?auto_302804 ?auto_302809 ) ) ( not ( = ?auto_302804 ?auto_302810 ) ) ( not ( = ?auto_302805 ?auto_302806 ) ) ( not ( = ?auto_302805 ?auto_302807 ) ) ( not ( = ?auto_302805 ?auto_302808 ) ) ( not ( = ?auto_302805 ?auto_302809 ) ) ( not ( = ?auto_302805 ?auto_302810 ) ) ( not ( = ?auto_302806 ?auto_302807 ) ) ( not ( = ?auto_302806 ?auto_302808 ) ) ( not ( = ?auto_302806 ?auto_302809 ) ) ( not ( = ?auto_302806 ?auto_302810 ) ) ( not ( = ?auto_302807 ?auto_302808 ) ) ( not ( = ?auto_302807 ?auto_302809 ) ) ( not ( = ?auto_302807 ?auto_302810 ) ) ( not ( = ?auto_302808 ?auto_302809 ) ) ( not ( = ?auto_302808 ?auto_302810 ) ) ( not ( = ?auto_302809 ?auto_302810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_302809 ?auto_302810 )
      ( !STACK ?auto_302809 ?auto_302808 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_302848 - BLOCK
      ?auto_302849 - BLOCK
      ?auto_302850 - BLOCK
      ?auto_302851 - BLOCK
      ?auto_302852 - BLOCK
      ?auto_302853 - BLOCK
      ?auto_302854 - BLOCK
      ?auto_302855 - BLOCK
      ?auto_302856 - BLOCK
      ?auto_302857 - BLOCK
      ?auto_302858 - BLOCK
      ?auto_302859 - BLOCK
    )
    :vars
    (
      ?auto_302860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302859 ?auto_302860 ) ( ON-TABLE ?auto_302848 ) ( ON ?auto_302849 ?auto_302848 ) ( ON ?auto_302850 ?auto_302849 ) ( ON ?auto_302851 ?auto_302850 ) ( ON ?auto_302852 ?auto_302851 ) ( ON ?auto_302853 ?auto_302852 ) ( ON ?auto_302854 ?auto_302853 ) ( ON ?auto_302855 ?auto_302854 ) ( ON ?auto_302856 ?auto_302855 ) ( ON ?auto_302857 ?auto_302856 ) ( not ( = ?auto_302848 ?auto_302849 ) ) ( not ( = ?auto_302848 ?auto_302850 ) ) ( not ( = ?auto_302848 ?auto_302851 ) ) ( not ( = ?auto_302848 ?auto_302852 ) ) ( not ( = ?auto_302848 ?auto_302853 ) ) ( not ( = ?auto_302848 ?auto_302854 ) ) ( not ( = ?auto_302848 ?auto_302855 ) ) ( not ( = ?auto_302848 ?auto_302856 ) ) ( not ( = ?auto_302848 ?auto_302857 ) ) ( not ( = ?auto_302848 ?auto_302858 ) ) ( not ( = ?auto_302848 ?auto_302859 ) ) ( not ( = ?auto_302848 ?auto_302860 ) ) ( not ( = ?auto_302849 ?auto_302850 ) ) ( not ( = ?auto_302849 ?auto_302851 ) ) ( not ( = ?auto_302849 ?auto_302852 ) ) ( not ( = ?auto_302849 ?auto_302853 ) ) ( not ( = ?auto_302849 ?auto_302854 ) ) ( not ( = ?auto_302849 ?auto_302855 ) ) ( not ( = ?auto_302849 ?auto_302856 ) ) ( not ( = ?auto_302849 ?auto_302857 ) ) ( not ( = ?auto_302849 ?auto_302858 ) ) ( not ( = ?auto_302849 ?auto_302859 ) ) ( not ( = ?auto_302849 ?auto_302860 ) ) ( not ( = ?auto_302850 ?auto_302851 ) ) ( not ( = ?auto_302850 ?auto_302852 ) ) ( not ( = ?auto_302850 ?auto_302853 ) ) ( not ( = ?auto_302850 ?auto_302854 ) ) ( not ( = ?auto_302850 ?auto_302855 ) ) ( not ( = ?auto_302850 ?auto_302856 ) ) ( not ( = ?auto_302850 ?auto_302857 ) ) ( not ( = ?auto_302850 ?auto_302858 ) ) ( not ( = ?auto_302850 ?auto_302859 ) ) ( not ( = ?auto_302850 ?auto_302860 ) ) ( not ( = ?auto_302851 ?auto_302852 ) ) ( not ( = ?auto_302851 ?auto_302853 ) ) ( not ( = ?auto_302851 ?auto_302854 ) ) ( not ( = ?auto_302851 ?auto_302855 ) ) ( not ( = ?auto_302851 ?auto_302856 ) ) ( not ( = ?auto_302851 ?auto_302857 ) ) ( not ( = ?auto_302851 ?auto_302858 ) ) ( not ( = ?auto_302851 ?auto_302859 ) ) ( not ( = ?auto_302851 ?auto_302860 ) ) ( not ( = ?auto_302852 ?auto_302853 ) ) ( not ( = ?auto_302852 ?auto_302854 ) ) ( not ( = ?auto_302852 ?auto_302855 ) ) ( not ( = ?auto_302852 ?auto_302856 ) ) ( not ( = ?auto_302852 ?auto_302857 ) ) ( not ( = ?auto_302852 ?auto_302858 ) ) ( not ( = ?auto_302852 ?auto_302859 ) ) ( not ( = ?auto_302852 ?auto_302860 ) ) ( not ( = ?auto_302853 ?auto_302854 ) ) ( not ( = ?auto_302853 ?auto_302855 ) ) ( not ( = ?auto_302853 ?auto_302856 ) ) ( not ( = ?auto_302853 ?auto_302857 ) ) ( not ( = ?auto_302853 ?auto_302858 ) ) ( not ( = ?auto_302853 ?auto_302859 ) ) ( not ( = ?auto_302853 ?auto_302860 ) ) ( not ( = ?auto_302854 ?auto_302855 ) ) ( not ( = ?auto_302854 ?auto_302856 ) ) ( not ( = ?auto_302854 ?auto_302857 ) ) ( not ( = ?auto_302854 ?auto_302858 ) ) ( not ( = ?auto_302854 ?auto_302859 ) ) ( not ( = ?auto_302854 ?auto_302860 ) ) ( not ( = ?auto_302855 ?auto_302856 ) ) ( not ( = ?auto_302855 ?auto_302857 ) ) ( not ( = ?auto_302855 ?auto_302858 ) ) ( not ( = ?auto_302855 ?auto_302859 ) ) ( not ( = ?auto_302855 ?auto_302860 ) ) ( not ( = ?auto_302856 ?auto_302857 ) ) ( not ( = ?auto_302856 ?auto_302858 ) ) ( not ( = ?auto_302856 ?auto_302859 ) ) ( not ( = ?auto_302856 ?auto_302860 ) ) ( not ( = ?auto_302857 ?auto_302858 ) ) ( not ( = ?auto_302857 ?auto_302859 ) ) ( not ( = ?auto_302857 ?auto_302860 ) ) ( not ( = ?auto_302858 ?auto_302859 ) ) ( not ( = ?auto_302858 ?auto_302860 ) ) ( not ( = ?auto_302859 ?auto_302860 ) ) ( CLEAR ?auto_302857 ) ( ON ?auto_302858 ?auto_302859 ) ( CLEAR ?auto_302858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_302848 ?auto_302849 ?auto_302850 ?auto_302851 ?auto_302852 ?auto_302853 ?auto_302854 ?auto_302855 ?auto_302856 ?auto_302857 ?auto_302858 )
      ( MAKE-12PILE ?auto_302848 ?auto_302849 ?auto_302850 ?auto_302851 ?auto_302852 ?auto_302853 ?auto_302854 ?auto_302855 ?auto_302856 ?auto_302857 ?auto_302858 ?auto_302859 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_302898 - BLOCK
      ?auto_302899 - BLOCK
      ?auto_302900 - BLOCK
      ?auto_302901 - BLOCK
      ?auto_302902 - BLOCK
      ?auto_302903 - BLOCK
      ?auto_302904 - BLOCK
      ?auto_302905 - BLOCK
      ?auto_302906 - BLOCK
      ?auto_302907 - BLOCK
      ?auto_302908 - BLOCK
      ?auto_302909 - BLOCK
    )
    :vars
    (
      ?auto_302910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302909 ?auto_302910 ) ( ON-TABLE ?auto_302898 ) ( ON ?auto_302899 ?auto_302898 ) ( ON ?auto_302900 ?auto_302899 ) ( ON ?auto_302901 ?auto_302900 ) ( ON ?auto_302902 ?auto_302901 ) ( ON ?auto_302903 ?auto_302902 ) ( ON ?auto_302904 ?auto_302903 ) ( ON ?auto_302905 ?auto_302904 ) ( ON ?auto_302906 ?auto_302905 ) ( not ( = ?auto_302898 ?auto_302899 ) ) ( not ( = ?auto_302898 ?auto_302900 ) ) ( not ( = ?auto_302898 ?auto_302901 ) ) ( not ( = ?auto_302898 ?auto_302902 ) ) ( not ( = ?auto_302898 ?auto_302903 ) ) ( not ( = ?auto_302898 ?auto_302904 ) ) ( not ( = ?auto_302898 ?auto_302905 ) ) ( not ( = ?auto_302898 ?auto_302906 ) ) ( not ( = ?auto_302898 ?auto_302907 ) ) ( not ( = ?auto_302898 ?auto_302908 ) ) ( not ( = ?auto_302898 ?auto_302909 ) ) ( not ( = ?auto_302898 ?auto_302910 ) ) ( not ( = ?auto_302899 ?auto_302900 ) ) ( not ( = ?auto_302899 ?auto_302901 ) ) ( not ( = ?auto_302899 ?auto_302902 ) ) ( not ( = ?auto_302899 ?auto_302903 ) ) ( not ( = ?auto_302899 ?auto_302904 ) ) ( not ( = ?auto_302899 ?auto_302905 ) ) ( not ( = ?auto_302899 ?auto_302906 ) ) ( not ( = ?auto_302899 ?auto_302907 ) ) ( not ( = ?auto_302899 ?auto_302908 ) ) ( not ( = ?auto_302899 ?auto_302909 ) ) ( not ( = ?auto_302899 ?auto_302910 ) ) ( not ( = ?auto_302900 ?auto_302901 ) ) ( not ( = ?auto_302900 ?auto_302902 ) ) ( not ( = ?auto_302900 ?auto_302903 ) ) ( not ( = ?auto_302900 ?auto_302904 ) ) ( not ( = ?auto_302900 ?auto_302905 ) ) ( not ( = ?auto_302900 ?auto_302906 ) ) ( not ( = ?auto_302900 ?auto_302907 ) ) ( not ( = ?auto_302900 ?auto_302908 ) ) ( not ( = ?auto_302900 ?auto_302909 ) ) ( not ( = ?auto_302900 ?auto_302910 ) ) ( not ( = ?auto_302901 ?auto_302902 ) ) ( not ( = ?auto_302901 ?auto_302903 ) ) ( not ( = ?auto_302901 ?auto_302904 ) ) ( not ( = ?auto_302901 ?auto_302905 ) ) ( not ( = ?auto_302901 ?auto_302906 ) ) ( not ( = ?auto_302901 ?auto_302907 ) ) ( not ( = ?auto_302901 ?auto_302908 ) ) ( not ( = ?auto_302901 ?auto_302909 ) ) ( not ( = ?auto_302901 ?auto_302910 ) ) ( not ( = ?auto_302902 ?auto_302903 ) ) ( not ( = ?auto_302902 ?auto_302904 ) ) ( not ( = ?auto_302902 ?auto_302905 ) ) ( not ( = ?auto_302902 ?auto_302906 ) ) ( not ( = ?auto_302902 ?auto_302907 ) ) ( not ( = ?auto_302902 ?auto_302908 ) ) ( not ( = ?auto_302902 ?auto_302909 ) ) ( not ( = ?auto_302902 ?auto_302910 ) ) ( not ( = ?auto_302903 ?auto_302904 ) ) ( not ( = ?auto_302903 ?auto_302905 ) ) ( not ( = ?auto_302903 ?auto_302906 ) ) ( not ( = ?auto_302903 ?auto_302907 ) ) ( not ( = ?auto_302903 ?auto_302908 ) ) ( not ( = ?auto_302903 ?auto_302909 ) ) ( not ( = ?auto_302903 ?auto_302910 ) ) ( not ( = ?auto_302904 ?auto_302905 ) ) ( not ( = ?auto_302904 ?auto_302906 ) ) ( not ( = ?auto_302904 ?auto_302907 ) ) ( not ( = ?auto_302904 ?auto_302908 ) ) ( not ( = ?auto_302904 ?auto_302909 ) ) ( not ( = ?auto_302904 ?auto_302910 ) ) ( not ( = ?auto_302905 ?auto_302906 ) ) ( not ( = ?auto_302905 ?auto_302907 ) ) ( not ( = ?auto_302905 ?auto_302908 ) ) ( not ( = ?auto_302905 ?auto_302909 ) ) ( not ( = ?auto_302905 ?auto_302910 ) ) ( not ( = ?auto_302906 ?auto_302907 ) ) ( not ( = ?auto_302906 ?auto_302908 ) ) ( not ( = ?auto_302906 ?auto_302909 ) ) ( not ( = ?auto_302906 ?auto_302910 ) ) ( not ( = ?auto_302907 ?auto_302908 ) ) ( not ( = ?auto_302907 ?auto_302909 ) ) ( not ( = ?auto_302907 ?auto_302910 ) ) ( not ( = ?auto_302908 ?auto_302909 ) ) ( not ( = ?auto_302908 ?auto_302910 ) ) ( not ( = ?auto_302909 ?auto_302910 ) ) ( ON ?auto_302908 ?auto_302909 ) ( CLEAR ?auto_302906 ) ( ON ?auto_302907 ?auto_302908 ) ( CLEAR ?auto_302907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_302898 ?auto_302899 ?auto_302900 ?auto_302901 ?auto_302902 ?auto_302903 ?auto_302904 ?auto_302905 ?auto_302906 ?auto_302907 )
      ( MAKE-12PILE ?auto_302898 ?auto_302899 ?auto_302900 ?auto_302901 ?auto_302902 ?auto_302903 ?auto_302904 ?auto_302905 ?auto_302906 ?auto_302907 ?auto_302908 ?auto_302909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_302948 - BLOCK
      ?auto_302949 - BLOCK
      ?auto_302950 - BLOCK
      ?auto_302951 - BLOCK
      ?auto_302952 - BLOCK
      ?auto_302953 - BLOCK
      ?auto_302954 - BLOCK
      ?auto_302955 - BLOCK
      ?auto_302956 - BLOCK
      ?auto_302957 - BLOCK
      ?auto_302958 - BLOCK
      ?auto_302959 - BLOCK
    )
    :vars
    (
      ?auto_302960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_302959 ?auto_302960 ) ( ON-TABLE ?auto_302948 ) ( ON ?auto_302949 ?auto_302948 ) ( ON ?auto_302950 ?auto_302949 ) ( ON ?auto_302951 ?auto_302950 ) ( ON ?auto_302952 ?auto_302951 ) ( ON ?auto_302953 ?auto_302952 ) ( ON ?auto_302954 ?auto_302953 ) ( ON ?auto_302955 ?auto_302954 ) ( not ( = ?auto_302948 ?auto_302949 ) ) ( not ( = ?auto_302948 ?auto_302950 ) ) ( not ( = ?auto_302948 ?auto_302951 ) ) ( not ( = ?auto_302948 ?auto_302952 ) ) ( not ( = ?auto_302948 ?auto_302953 ) ) ( not ( = ?auto_302948 ?auto_302954 ) ) ( not ( = ?auto_302948 ?auto_302955 ) ) ( not ( = ?auto_302948 ?auto_302956 ) ) ( not ( = ?auto_302948 ?auto_302957 ) ) ( not ( = ?auto_302948 ?auto_302958 ) ) ( not ( = ?auto_302948 ?auto_302959 ) ) ( not ( = ?auto_302948 ?auto_302960 ) ) ( not ( = ?auto_302949 ?auto_302950 ) ) ( not ( = ?auto_302949 ?auto_302951 ) ) ( not ( = ?auto_302949 ?auto_302952 ) ) ( not ( = ?auto_302949 ?auto_302953 ) ) ( not ( = ?auto_302949 ?auto_302954 ) ) ( not ( = ?auto_302949 ?auto_302955 ) ) ( not ( = ?auto_302949 ?auto_302956 ) ) ( not ( = ?auto_302949 ?auto_302957 ) ) ( not ( = ?auto_302949 ?auto_302958 ) ) ( not ( = ?auto_302949 ?auto_302959 ) ) ( not ( = ?auto_302949 ?auto_302960 ) ) ( not ( = ?auto_302950 ?auto_302951 ) ) ( not ( = ?auto_302950 ?auto_302952 ) ) ( not ( = ?auto_302950 ?auto_302953 ) ) ( not ( = ?auto_302950 ?auto_302954 ) ) ( not ( = ?auto_302950 ?auto_302955 ) ) ( not ( = ?auto_302950 ?auto_302956 ) ) ( not ( = ?auto_302950 ?auto_302957 ) ) ( not ( = ?auto_302950 ?auto_302958 ) ) ( not ( = ?auto_302950 ?auto_302959 ) ) ( not ( = ?auto_302950 ?auto_302960 ) ) ( not ( = ?auto_302951 ?auto_302952 ) ) ( not ( = ?auto_302951 ?auto_302953 ) ) ( not ( = ?auto_302951 ?auto_302954 ) ) ( not ( = ?auto_302951 ?auto_302955 ) ) ( not ( = ?auto_302951 ?auto_302956 ) ) ( not ( = ?auto_302951 ?auto_302957 ) ) ( not ( = ?auto_302951 ?auto_302958 ) ) ( not ( = ?auto_302951 ?auto_302959 ) ) ( not ( = ?auto_302951 ?auto_302960 ) ) ( not ( = ?auto_302952 ?auto_302953 ) ) ( not ( = ?auto_302952 ?auto_302954 ) ) ( not ( = ?auto_302952 ?auto_302955 ) ) ( not ( = ?auto_302952 ?auto_302956 ) ) ( not ( = ?auto_302952 ?auto_302957 ) ) ( not ( = ?auto_302952 ?auto_302958 ) ) ( not ( = ?auto_302952 ?auto_302959 ) ) ( not ( = ?auto_302952 ?auto_302960 ) ) ( not ( = ?auto_302953 ?auto_302954 ) ) ( not ( = ?auto_302953 ?auto_302955 ) ) ( not ( = ?auto_302953 ?auto_302956 ) ) ( not ( = ?auto_302953 ?auto_302957 ) ) ( not ( = ?auto_302953 ?auto_302958 ) ) ( not ( = ?auto_302953 ?auto_302959 ) ) ( not ( = ?auto_302953 ?auto_302960 ) ) ( not ( = ?auto_302954 ?auto_302955 ) ) ( not ( = ?auto_302954 ?auto_302956 ) ) ( not ( = ?auto_302954 ?auto_302957 ) ) ( not ( = ?auto_302954 ?auto_302958 ) ) ( not ( = ?auto_302954 ?auto_302959 ) ) ( not ( = ?auto_302954 ?auto_302960 ) ) ( not ( = ?auto_302955 ?auto_302956 ) ) ( not ( = ?auto_302955 ?auto_302957 ) ) ( not ( = ?auto_302955 ?auto_302958 ) ) ( not ( = ?auto_302955 ?auto_302959 ) ) ( not ( = ?auto_302955 ?auto_302960 ) ) ( not ( = ?auto_302956 ?auto_302957 ) ) ( not ( = ?auto_302956 ?auto_302958 ) ) ( not ( = ?auto_302956 ?auto_302959 ) ) ( not ( = ?auto_302956 ?auto_302960 ) ) ( not ( = ?auto_302957 ?auto_302958 ) ) ( not ( = ?auto_302957 ?auto_302959 ) ) ( not ( = ?auto_302957 ?auto_302960 ) ) ( not ( = ?auto_302958 ?auto_302959 ) ) ( not ( = ?auto_302958 ?auto_302960 ) ) ( not ( = ?auto_302959 ?auto_302960 ) ) ( ON ?auto_302958 ?auto_302959 ) ( ON ?auto_302957 ?auto_302958 ) ( CLEAR ?auto_302955 ) ( ON ?auto_302956 ?auto_302957 ) ( CLEAR ?auto_302956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_302948 ?auto_302949 ?auto_302950 ?auto_302951 ?auto_302952 ?auto_302953 ?auto_302954 ?auto_302955 ?auto_302956 )
      ( MAKE-12PILE ?auto_302948 ?auto_302949 ?auto_302950 ?auto_302951 ?auto_302952 ?auto_302953 ?auto_302954 ?auto_302955 ?auto_302956 ?auto_302957 ?auto_302958 ?auto_302959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_302998 - BLOCK
      ?auto_302999 - BLOCK
      ?auto_303000 - BLOCK
      ?auto_303001 - BLOCK
      ?auto_303002 - BLOCK
      ?auto_303003 - BLOCK
      ?auto_303004 - BLOCK
      ?auto_303005 - BLOCK
      ?auto_303006 - BLOCK
      ?auto_303007 - BLOCK
      ?auto_303008 - BLOCK
      ?auto_303009 - BLOCK
    )
    :vars
    (
      ?auto_303010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303009 ?auto_303010 ) ( ON-TABLE ?auto_302998 ) ( ON ?auto_302999 ?auto_302998 ) ( ON ?auto_303000 ?auto_302999 ) ( ON ?auto_303001 ?auto_303000 ) ( ON ?auto_303002 ?auto_303001 ) ( ON ?auto_303003 ?auto_303002 ) ( ON ?auto_303004 ?auto_303003 ) ( not ( = ?auto_302998 ?auto_302999 ) ) ( not ( = ?auto_302998 ?auto_303000 ) ) ( not ( = ?auto_302998 ?auto_303001 ) ) ( not ( = ?auto_302998 ?auto_303002 ) ) ( not ( = ?auto_302998 ?auto_303003 ) ) ( not ( = ?auto_302998 ?auto_303004 ) ) ( not ( = ?auto_302998 ?auto_303005 ) ) ( not ( = ?auto_302998 ?auto_303006 ) ) ( not ( = ?auto_302998 ?auto_303007 ) ) ( not ( = ?auto_302998 ?auto_303008 ) ) ( not ( = ?auto_302998 ?auto_303009 ) ) ( not ( = ?auto_302998 ?auto_303010 ) ) ( not ( = ?auto_302999 ?auto_303000 ) ) ( not ( = ?auto_302999 ?auto_303001 ) ) ( not ( = ?auto_302999 ?auto_303002 ) ) ( not ( = ?auto_302999 ?auto_303003 ) ) ( not ( = ?auto_302999 ?auto_303004 ) ) ( not ( = ?auto_302999 ?auto_303005 ) ) ( not ( = ?auto_302999 ?auto_303006 ) ) ( not ( = ?auto_302999 ?auto_303007 ) ) ( not ( = ?auto_302999 ?auto_303008 ) ) ( not ( = ?auto_302999 ?auto_303009 ) ) ( not ( = ?auto_302999 ?auto_303010 ) ) ( not ( = ?auto_303000 ?auto_303001 ) ) ( not ( = ?auto_303000 ?auto_303002 ) ) ( not ( = ?auto_303000 ?auto_303003 ) ) ( not ( = ?auto_303000 ?auto_303004 ) ) ( not ( = ?auto_303000 ?auto_303005 ) ) ( not ( = ?auto_303000 ?auto_303006 ) ) ( not ( = ?auto_303000 ?auto_303007 ) ) ( not ( = ?auto_303000 ?auto_303008 ) ) ( not ( = ?auto_303000 ?auto_303009 ) ) ( not ( = ?auto_303000 ?auto_303010 ) ) ( not ( = ?auto_303001 ?auto_303002 ) ) ( not ( = ?auto_303001 ?auto_303003 ) ) ( not ( = ?auto_303001 ?auto_303004 ) ) ( not ( = ?auto_303001 ?auto_303005 ) ) ( not ( = ?auto_303001 ?auto_303006 ) ) ( not ( = ?auto_303001 ?auto_303007 ) ) ( not ( = ?auto_303001 ?auto_303008 ) ) ( not ( = ?auto_303001 ?auto_303009 ) ) ( not ( = ?auto_303001 ?auto_303010 ) ) ( not ( = ?auto_303002 ?auto_303003 ) ) ( not ( = ?auto_303002 ?auto_303004 ) ) ( not ( = ?auto_303002 ?auto_303005 ) ) ( not ( = ?auto_303002 ?auto_303006 ) ) ( not ( = ?auto_303002 ?auto_303007 ) ) ( not ( = ?auto_303002 ?auto_303008 ) ) ( not ( = ?auto_303002 ?auto_303009 ) ) ( not ( = ?auto_303002 ?auto_303010 ) ) ( not ( = ?auto_303003 ?auto_303004 ) ) ( not ( = ?auto_303003 ?auto_303005 ) ) ( not ( = ?auto_303003 ?auto_303006 ) ) ( not ( = ?auto_303003 ?auto_303007 ) ) ( not ( = ?auto_303003 ?auto_303008 ) ) ( not ( = ?auto_303003 ?auto_303009 ) ) ( not ( = ?auto_303003 ?auto_303010 ) ) ( not ( = ?auto_303004 ?auto_303005 ) ) ( not ( = ?auto_303004 ?auto_303006 ) ) ( not ( = ?auto_303004 ?auto_303007 ) ) ( not ( = ?auto_303004 ?auto_303008 ) ) ( not ( = ?auto_303004 ?auto_303009 ) ) ( not ( = ?auto_303004 ?auto_303010 ) ) ( not ( = ?auto_303005 ?auto_303006 ) ) ( not ( = ?auto_303005 ?auto_303007 ) ) ( not ( = ?auto_303005 ?auto_303008 ) ) ( not ( = ?auto_303005 ?auto_303009 ) ) ( not ( = ?auto_303005 ?auto_303010 ) ) ( not ( = ?auto_303006 ?auto_303007 ) ) ( not ( = ?auto_303006 ?auto_303008 ) ) ( not ( = ?auto_303006 ?auto_303009 ) ) ( not ( = ?auto_303006 ?auto_303010 ) ) ( not ( = ?auto_303007 ?auto_303008 ) ) ( not ( = ?auto_303007 ?auto_303009 ) ) ( not ( = ?auto_303007 ?auto_303010 ) ) ( not ( = ?auto_303008 ?auto_303009 ) ) ( not ( = ?auto_303008 ?auto_303010 ) ) ( not ( = ?auto_303009 ?auto_303010 ) ) ( ON ?auto_303008 ?auto_303009 ) ( ON ?auto_303007 ?auto_303008 ) ( ON ?auto_303006 ?auto_303007 ) ( CLEAR ?auto_303004 ) ( ON ?auto_303005 ?auto_303006 ) ( CLEAR ?auto_303005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_302998 ?auto_302999 ?auto_303000 ?auto_303001 ?auto_303002 ?auto_303003 ?auto_303004 ?auto_303005 )
      ( MAKE-12PILE ?auto_302998 ?auto_302999 ?auto_303000 ?auto_303001 ?auto_303002 ?auto_303003 ?auto_303004 ?auto_303005 ?auto_303006 ?auto_303007 ?auto_303008 ?auto_303009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303048 - BLOCK
      ?auto_303049 - BLOCK
      ?auto_303050 - BLOCK
      ?auto_303051 - BLOCK
      ?auto_303052 - BLOCK
      ?auto_303053 - BLOCK
      ?auto_303054 - BLOCK
      ?auto_303055 - BLOCK
      ?auto_303056 - BLOCK
      ?auto_303057 - BLOCK
      ?auto_303058 - BLOCK
      ?auto_303059 - BLOCK
    )
    :vars
    (
      ?auto_303060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303059 ?auto_303060 ) ( ON-TABLE ?auto_303048 ) ( ON ?auto_303049 ?auto_303048 ) ( ON ?auto_303050 ?auto_303049 ) ( ON ?auto_303051 ?auto_303050 ) ( ON ?auto_303052 ?auto_303051 ) ( ON ?auto_303053 ?auto_303052 ) ( not ( = ?auto_303048 ?auto_303049 ) ) ( not ( = ?auto_303048 ?auto_303050 ) ) ( not ( = ?auto_303048 ?auto_303051 ) ) ( not ( = ?auto_303048 ?auto_303052 ) ) ( not ( = ?auto_303048 ?auto_303053 ) ) ( not ( = ?auto_303048 ?auto_303054 ) ) ( not ( = ?auto_303048 ?auto_303055 ) ) ( not ( = ?auto_303048 ?auto_303056 ) ) ( not ( = ?auto_303048 ?auto_303057 ) ) ( not ( = ?auto_303048 ?auto_303058 ) ) ( not ( = ?auto_303048 ?auto_303059 ) ) ( not ( = ?auto_303048 ?auto_303060 ) ) ( not ( = ?auto_303049 ?auto_303050 ) ) ( not ( = ?auto_303049 ?auto_303051 ) ) ( not ( = ?auto_303049 ?auto_303052 ) ) ( not ( = ?auto_303049 ?auto_303053 ) ) ( not ( = ?auto_303049 ?auto_303054 ) ) ( not ( = ?auto_303049 ?auto_303055 ) ) ( not ( = ?auto_303049 ?auto_303056 ) ) ( not ( = ?auto_303049 ?auto_303057 ) ) ( not ( = ?auto_303049 ?auto_303058 ) ) ( not ( = ?auto_303049 ?auto_303059 ) ) ( not ( = ?auto_303049 ?auto_303060 ) ) ( not ( = ?auto_303050 ?auto_303051 ) ) ( not ( = ?auto_303050 ?auto_303052 ) ) ( not ( = ?auto_303050 ?auto_303053 ) ) ( not ( = ?auto_303050 ?auto_303054 ) ) ( not ( = ?auto_303050 ?auto_303055 ) ) ( not ( = ?auto_303050 ?auto_303056 ) ) ( not ( = ?auto_303050 ?auto_303057 ) ) ( not ( = ?auto_303050 ?auto_303058 ) ) ( not ( = ?auto_303050 ?auto_303059 ) ) ( not ( = ?auto_303050 ?auto_303060 ) ) ( not ( = ?auto_303051 ?auto_303052 ) ) ( not ( = ?auto_303051 ?auto_303053 ) ) ( not ( = ?auto_303051 ?auto_303054 ) ) ( not ( = ?auto_303051 ?auto_303055 ) ) ( not ( = ?auto_303051 ?auto_303056 ) ) ( not ( = ?auto_303051 ?auto_303057 ) ) ( not ( = ?auto_303051 ?auto_303058 ) ) ( not ( = ?auto_303051 ?auto_303059 ) ) ( not ( = ?auto_303051 ?auto_303060 ) ) ( not ( = ?auto_303052 ?auto_303053 ) ) ( not ( = ?auto_303052 ?auto_303054 ) ) ( not ( = ?auto_303052 ?auto_303055 ) ) ( not ( = ?auto_303052 ?auto_303056 ) ) ( not ( = ?auto_303052 ?auto_303057 ) ) ( not ( = ?auto_303052 ?auto_303058 ) ) ( not ( = ?auto_303052 ?auto_303059 ) ) ( not ( = ?auto_303052 ?auto_303060 ) ) ( not ( = ?auto_303053 ?auto_303054 ) ) ( not ( = ?auto_303053 ?auto_303055 ) ) ( not ( = ?auto_303053 ?auto_303056 ) ) ( not ( = ?auto_303053 ?auto_303057 ) ) ( not ( = ?auto_303053 ?auto_303058 ) ) ( not ( = ?auto_303053 ?auto_303059 ) ) ( not ( = ?auto_303053 ?auto_303060 ) ) ( not ( = ?auto_303054 ?auto_303055 ) ) ( not ( = ?auto_303054 ?auto_303056 ) ) ( not ( = ?auto_303054 ?auto_303057 ) ) ( not ( = ?auto_303054 ?auto_303058 ) ) ( not ( = ?auto_303054 ?auto_303059 ) ) ( not ( = ?auto_303054 ?auto_303060 ) ) ( not ( = ?auto_303055 ?auto_303056 ) ) ( not ( = ?auto_303055 ?auto_303057 ) ) ( not ( = ?auto_303055 ?auto_303058 ) ) ( not ( = ?auto_303055 ?auto_303059 ) ) ( not ( = ?auto_303055 ?auto_303060 ) ) ( not ( = ?auto_303056 ?auto_303057 ) ) ( not ( = ?auto_303056 ?auto_303058 ) ) ( not ( = ?auto_303056 ?auto_303059 ) ) ( not ( = ?auto_303056 ?auto_303060 ) ) ( not ( = ?auto_303057 ?auto_303058 ) ) ( not ( = ?auto_303057 ?auto_303059 ) ) ( not ( = ?auto_303057 ?auto_303060 ) ) ( not ( = ?auto_303058 ?auto_303059 ) ) ( not ( = ?auto_303058 ?auto_303060 ) ) ( not ( = ?auto_303059 ?auto_303060 ) ) ( ON ?auto_303058 ?auto_303059 ) ( ON ?auto_303057 ?auto_303058 ) ( ON ?auto_303056 ?auto_303057 ) ( ON ?auto_303055 ?auto_303056 ) ( CLEAR ?auto_303053 ) ( ON ?auto_303054 ?auto_303055 ) ( CLEAR ?auto_303054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_303048 ?auto_303049 ?auto_303050 ?auto_303051 ?auto_303052 ?auto_303053 ?auto_303054 )
      ( MAKE-12PILE ?auto_303048 ?auto_303049 ?auto_303050 ?auto_303051 ?auto_303052 ?auto_303053 ?auto_303054 ?auto_303055 ?auto_303056 ?auto_303057 ?auto_303058 ?auto_303059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303098 - BLOCK
      ?auto_303099 - BLOCK
      ?auto_303100 - BLOCK
      ?auto_303101 - BLOCK
      ?auto_303102 - BLOCK
      ?auto_303103 - BLOCK
      ?auto_303104 - BLOCK
      ?auto_303105 - BLOCK
      ?auto_303106 - BLOCK
      ?auto_303107 - BLOCK
      ?auto_303108 - BLOCK
      ?auto_303109 - BLOCK
    )
    :vars
    (
      ?auto_303110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303109 ?auto_303110 ) ( ON-TABLE ?auto_303098 ) ( ON ?auto_303099 ?auto_303098 ) ( ON ?auto_303100 ?auto_303099 ) ( ON ?auto_303101 ?auto_303100 ) ( ON ?auto_303102 ?auto_303101 ) ( not ( = ?auto_303098 ?auto_303099 ) ) ( not ( = ?auto_303098 ?auto_303100 ) ) ( not ( = ?auto_303098 ?auto_303101 ) ) ( not ( = ?auto_303098 ?auto_303102 ) ) ( not ( = ?auto_303098 ?auto_303103 ) ) ( not ( = ?auto_303098 ?auto_303104 ) ) ( not ( = ?auto_303098 ?auto_303105 ) ) ( not ( = ?auto_303098 ?auto_303106 ) ) ( not ( = ?auto_303098 ?auto_303107 ) ) ( not ( = ?auto_303098 ?auto_303108 ) ) ( not ( = ?auto_303098 ?auto_303109 ) ) ( not ( = ?auto_303098 ?auto_303110 ) ) ( not ( = ?auto_303099 ?auto_303100 ) ) ( not ( = ?auto_303099 ?auto_303101 ) ) ( not ( = ?auto_303099 ?auto_303102 ) ) ( not ( = ?auto_303099 ?auto_303103 ) ) ( not ( = ?auto_303099 ?auto_303104 ) ) ( not ( = ?auto_303099 ?auto_303105 ) ) ( not ( = ?auto_303099 ?auto_303106 ) ) ( not ( = ?auto_303099 ?auto_303107 ) ) ( not ( = ?auto_303099 ?auto_303108 ) ) ( not ( = ?auto_303099 ?auto_303109 ) ) ( not ( = ?auto_303099 ?auto_303110 ) ) ( not ( = ?auto_303100 ?auto_303101 ) ) ( not ( = ?auto_303100 ?auto_303102 ) ) ( not ( = ?auto_303100 ?auto_303103 ) ) ( not ( = ?auto_303100 ?auto_303104 ) ) ( not ( = ?auto_303100 ?auto_303105 ) ) ( not ( = ?auto_303100 ?auto_303106 ) ) ( not ( = ?auto_303100 ?auto_303107 ) ) ( not ( = ?auto_303100 ?auto_303108 ) ) ( not ( = ?auto_303100 ?auto_303109 ) ) ( not ( = ?auto_303100 ?auto_303110 ) ) ( not ( = ?auto_303101 ?auto_303102 ) ) ( not ( = ?auto_303101 ?auto_303103 ) ) ( not ( = ?auto_303101 ?auto_303104 ) ) ( not ( = ?auto_303101 ?auto_303105 ) ) ( not ( = ?auto_303101 ?auto_303106 ) ) ( not ( = ?auto_303101 ?auto_303107 ) ) ( not ( = ?auto_303101 ?auto_303108 ) ) ( not ( = ?auto_303101 ?auto_303109 ) ) ( not ( = ?auto_303101 ?auto_303110 ) ) ( not ( = ?auto_303102 ?auto_303103 ) ) ( not ( = ?auto_303102 ?auto_303104 ) ) ( not ( = ?auto_303102 ?auto_303105 ) ) ( not ( = ?auto_303102 ?auto_303106 ) ) ( not ( = ?auto_303102 ?auto_303107 ) ) ( not ( = ?auto_303102 ?auto_303108 ) ) ( not ( = ?auto_303102 ?auto_303109 ) ) ( not ( = ?auto_303102 ?auto_303110 ) ) ( not ( = ?auto_303103 ?auto_303104 ) ) ( not ( = ?auto_303103 ?auto_303105 ) ) ( not ( = ?auto_303103 ?auto_303106 ) ) ( not ( = ?auto_303103 ?auto_303107 ) ) ( not ( = ?auto_303103 ?auto_303108 ) ) ( not ( = ?auto_303103 ?auto_303109 ) ) ( not ( = ?auto_303103 ?auto_303110 ) ) ( not ( = ?auto_303104 ?auto_303105 ) ) ( not ( = ?auto_303104 ?auto_303106 ) ) ( not ( = ?auto_303104 ?auto_303107 ) ) ( not ( = ?auto_303104 ?auto_303108 ) ) ( not ( = ?auto_303104 ?auto_303109 ) ) ( not ( = ?auto_303104 ?auto_303110 ) ) ( not ( = ?auto_303105 ?auto_303106 ) ) ( not ( = ?auto_303105 ?auto_303107 ) ) ( not ( = ?auto_303105 ?auto_303108 ) ) ( not ( = ?auto_303105 ?auto_303109 ) ) ( not ( = ?auto_303105 ?auto_303110 ) ) ( not ( = ?auto_303106 ?auto_303107 ) ) ( not ( = ?auto_303106 ?auto_303108 ) ) ( not ( = ?auto_303106 ?auto_303109 ) ) ( not ( = ?auto_303106 ?auto_303110 ) ) ( not ( = ?auto_303107 ?auto_303108 ) ) ( not ( = ?auto_303107 ?auto_303109 ) ) ( not ( = ?auto_303107 ?auto_303110 ) ) ( not ( = ?auto_303108 ?auto_303109 ) ) ( not ( = ?auto_303108 ?auto_303110 ) ) ( not ( = ?auto_303109 ?auto_303110 ) ) ( ON ?auto_303108 ?auto_303109 ) ( ON ?auto_303107 ?auto_303108 ) ( ON ?auto_303106 ?auto_303107 ) ( ON ?auto_303105 ?auto_303106 ) ( ON ?auto_303104 ?auto_303105 ) ( CLEAR ?auto_303102 ) ( ON ?auto_303103 ?auto_303104 ) ( CLEAR ?auto_303103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_303098 ?auto_303099 ?auto_303100 ?auto_303101 ?auto_303102 ?auto_303103 )
      ( MAKE-12PILE ?auto_303098 ?auto_303099 ?auto_303100 ?auto_303101 ?auto_303102 ?auto_303103 ?auto_303104 ?auto_303105 ?auto_303106 ?auto_303107 ?auto_303108 ?auto_303109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303148 - BLOCK
      ?auto_303149 - BLOCK
      ?auto_303150 - BLOCK
      ?auto_303151 - BLOCK
      ?auto_303152 - BLOCK
      ?auto_303153 - BLOCK
      ?auto_303154 - BLOCK
      ?auto_303155 - BLOCK
      ?auto_303156 - BLOCK
      ?auto_303157 - BLOCK
      ?auto_303158 - BLOCK
      ?auto_303159 - BLOCK
    )
    :vars
    (
      ?auto_303160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303159 ?auto_303160 ) ( ON-TABLE ?auto_303148 ) ( ON ?auto_303149 ?auto_303148 ) ( ON ?auto_303150 ?auto_303149 ) ( ON ?auto_303151 ?auto_303150 ) ( not ( = ?auto_303148 ?auto_303149 ) ) ( not ( = ?auto_303148 ?auto_303150 ) ) ( not ( = ?auto_303148 ?auto_303151 ) ) ( not ( = ?auto_303148 ?auto_303152 ) ) ( not ( = ?auto_303148 ?auto_303153 ) ) ( not ( = ?auto_303148 ?auto_303154 ) ) ( not ( = ?auto_303148 ?auto_303155 ) ) ( not ( = ?auto_303148 ?auto_303156 ) ) ( not ( = ?auto_303148 ?auto_303157 ) ) ( not ( = ?auto_303148 ?auto_303158 ) ) ( not ( = ?auto_303148 ?auto_303159 ) ) ( not ( = ?auto_303148 ?auto_303160 ) ) ( not ( = ?auto_303149 ?auto_303150 ) ) ( not ( = ?auto_303149 ?auto_303151 ) ) ( not ( = ?auto_303149 ?auto_303152 ) ) ( not ( = ?auto_303149 ?auto_303153 ) ) ( not ( = ?auto_303149 ?auto_303154 ) ) ( not ( = ?auto_303149 ?auto_303155 ) ) ( not ( = ?auto_303149 ?auto_303156 ) ) ( not ( = ?auto_303149 ?auto_303157 ) ) ( not ( = ?auto_303149 ?auto_303158 ) ) ( not ( = ?auto_303149 ?auto_303159 ) ) ( not ( = ?auto_303149 ?auto_303160 ) ) ( not ( = ?auto_303150 ?auto_303151 ) ) ( not ( = ?auto_303150 ?auto_303152 ) ) ( not ( = ?auto_303150 ?auto_303153 ) ) ( not ( = ?auto_303150 ?auto_303154 ) ) ( not ( = ?auto_303150 ?auto_303155 ) ) ( not ( = ?auto_303150 ?auto_303156 ) ) ( not ( = ?auto_303150 ?auto_303157 ) ) ( not ( = ?auto_303150 ?auto_303158 ) ) ( not ( = ?auto_303150 ?auto_303159 ) ) ( not ( = ?auto_303150 ?auto_303160 ) ) ( not ( = ?auto_303151 ?auto_303152 ) ) ( not ( = ?auto_303151 ?auto_303153 ) ) ( not ( = ?auto_303151 ?auto_303154 ) ) ( not ( = ?auto_303151 ?auto_303155 ) ) ( not ( = ?auto_303151 ?auto_303156 ) ) ( not ( = ?auto_303151 ?auto_303157 ) ) ( not ( = ?auto_303151 ?auto_303158 ) ) ( not ( = ?auto_303151 ?auto_303159 ) ) ( not ( = ?auto_303151 ?auto_303160 ) ) ( not ( = ?auto_303152 ?auto_303153 ) ) ( not ( = ?auto_303152 ?auto_303154 ) ) ( not ( = ?auto_303152 ?auto_303155 ) ) ( not ( = ?auto_303152 ?auto_303156 ) ) ( not ( = ?auto_303152 ?auto_303157 ) ) ( not ( = ?auto_303152 ?auto_303158 ) ) ( not ( = ?auto_303152 ?auto_303159 ) ) ( not ( = ?auto_303152 ?auto_303160 ) ) ( not ( = ?auto_303153 ?auto_303154 ) ) ( not ( = ?auto_303153 ?auto_303155 ) ) ( not ( = ?auto_303153 ?auto_303156 ) ) ( not ( = ?auto_303153 ?auto_303157 ) ) ( not ( = ?auto_303153 ?auto_303158 ) ) ( not ( = ?auto_303153 ?auto_303159 ) ) ( not ( = ?auto_303153 ?auto_303160 ) ) ( not ( = ?auto_303154 ?auto_303155 ) ) ( not ( = ?auto_303154 ?auto_303156 ) ) ( not ( = ?auto_303154 ?auto_303157 ) ) ( not ( = ?auto_303154 ?auto_303158 ) ) ( not ( = ?auto_303154 ?auto_303159 ) ) ( not ( = ?auto_303154 ?auto_303160 ) ) ( not ( = ?auto_303155 ?auto_303156 ) ) ( not ( = ?auto_303155 ?auto_303157 ) ) ( not ( = ?auto_303155 ?auto_303158 ) ) ( not ( = ?auto_303155 ?auto_303159 ) ) ( not ( = ?auto_303155 ?auto_303160 ) ) ( not ( = ?auto_303156 ?auto_303157 ) ) ( not ( = ?auto_303156 ?auto_303158 ) ) ( not ( = ?auto_303156 ?auto_303159 ) ) ( not ( = ?auto_303156 ?auto_303160 ) ) ( not ( = ?auto_303157 ?auto_303158 ) ) ( not ( = ?auto_303157 ?auto_303159 ) ) ( not ( = ?auto_303157 ?auto_303160 ) ) ( not ( = ?auto_303158 ?auto_303159 ) ) ( not ( = ?auto_303158 ?auto_303160 ) ) ( not ( = ?auto_303159 ?auto_303160 ) ) ( ON ?auto_303158 ?auto_303159 ) ( ON ?auto_303157 ?auto_303158 ) ( ON ?auto_303156 ?auto_303157 ) ( ON ?auto_303155 ?auto_303156 ) ( ON ?auto_303154 ?auto_303155 ) ( ON ?auto_303153 ?auto_303154 ) ( CLEAR ?auto_303151 ) ( ON ?auto_303152 ?auto_303153 ) ( CLEAR ?auto_303152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_303148 ?auto_303149 ?auto_303150 ?auto_303151 ?auto_303152 )
      ( MAKE-12PILE ?auto_303148 ?auto_303149 ?auto_303150 ?auto_303151 ?auto_303152 ?auto_303153 ?auto_303154 ?auto_303155 ?auto_303156 ?auto_303157 ?auto_303158 ?auto_303159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303198 - BLOCK
      ?auto_303199 - BLOCK
      ?auto_303200 - BLOCK
      ?auto_303201 - BLOCK
      ?auto_303202 - BLOCK
      ?auto_303203 - BLOCK
      ?auto_303204 - BLOCK
      ?auto_303205 - BLOCK
      ?auto_303206 - BLOCK
      ?auto_303207 - BLOCK
      ?auto_303208 - BLOCK
      ?auto_303209 - BLOCK
    )
    :vars
    (
      ?auto_303210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303209 ?auto_303210 ) ( ON-TABLE ?auto_303198 ) ( ON ?auto_303199 ?auto_303198 ) ( ON ?auto_303200 ?auto_303199 ) ( not ( = ?auto_303198 ?auto_303199 ) ) ( not ( = ?auto_303198 ?auto_303200 ) ) ( not ( = ?auto_303198 ?auto_303201 ) ) ( not ( = ?auto_303198 ?auto_303202 ) ) ( not ( = ?auto_303198 ?auto_303203 ) ) ( not ( = ?auto_303198 ?auto_303204 ) ) ( not ( = ?auto_303198 ?auto_303205 ) ) ( not ( = ?auto_303198 ?auto_303206 ) ) ( not ( = ?auto_303198 ?auto_303207 ) ) ( not ( = ?auto_303198 ?auto_303208 ) ) ( not ( = ?auto_303198 ?auto_303209 ) ) ( not ( = ?auto_303198 ?auto_303210 ) ) ( not ( = ?auto_303199 ?auto_303200 ) ) ( not ( = ?auto_303199 ?auto_303201 ) ) ( not ( = ?auto_303199 ?auto_303202 ) ) ( not ( = ?auto_303199 ?auto_303203 ) ) ( not ( = ?auto_303199 ?auto_303204 ) ) ( not ( = ?auto_303199 ?auto_303205 ) ) ( not ( = ?auto_303199 ?auto_303206 ) ) ( not ( = ?auto_303199 ?auto_303207 ) ) ( not ( = ?auto_303199 ?auto_303208 ) ) ( not ( = ?auto_303199 ?auto_303209 ) ) ( not ( = ?auto_303199 ?auto_303210 ) ) ( not ( = ?auto_303200 ?auto_303201 ) ) ( not ( = ?auto_303200 ?auto_303202 ) ) ( not ( = ?auto_303200 ?auto_303203 ) ) ( not ( = ?auto_303200 ?auto_303204 ) ) ( not ( = ?auto_303200 ?auto_303205 ) ) ( not ( = ?auto_303200 ?auto_303206 ) ) ( not ( = ?auto_303200 ?auto_303207 ) ) ( not ( = ?auto_303200 ?auto_303208 ) ) ( not ( = ?auto_303200 ?auto_303209 ) ) ( not ( = ?auto_303200 ?auto_303210 ) ) ( not ( = ?auto_303201 ?auto_303202 ) ) ( not ( = ?auto_303201 ?auto_303203 ) ) ( not ( = ?auto_303201 ?auto_303204 ) ) ( not ( = ?auto_303201 ?auto_303205 ) ) ( not ( = ?auto_303201 ?auto_303206 ) ) ( not ( = ?auto_303201 ?auto_303207 ) ) ( not ( = ?auto_303201 ?auto_303208 ) ) ( not ( = ?auto_303201 ?auto_303209 ) ) ( not ( = ?auto_303201 ?auto_303210 ) ) ( not ( = ?auto_303202 ?auto_303203 ) ) ( not ( = ?auto_303202 ?auto_303204 ) ) ( not ( = ?auto_303202 ?auto_303205 ) ) ( not ( = ?auto_303202 ?auto_303206 ) ) ( not ( = ?auto_303202 ?auto_303207 ) ) ( not ( = ?auto_303202 ?auto_303208 ) ) ( not ( = ?auto_303202 ?auto_303209 ) ) ( not ( = ?auto_303202 ?auto_303210 ) ) ( not ( = ?auto_303203 ?auto_303204 ) ) ( not ( = ?auto_303203 ?auto_303205 ) ) ( not ( = ?auto_303203 ?auto_303206 ) ) ( not ( = ?auto_303203 ?auto_303207 ) ) ( not ( = ?auto_303203 ?auto_303208 ) ) ( not ( = ?auto_303203 ?auto_303209 ) ) ( not ( = ?auto_303203 ?auto_303210 ) ) ( not ( = ?auto_303204 ?auto_303205 ) ) ( not ( = ?auto_303204 ?auto_303206 ) ) ( not ( = ?auto_303204 ?auto_303207 ) ) ( not ( = ?auto_303204 ?auto_303208 ) ) ( not ( = ?auto_303204 ?auto_303209 ) ) ( not ( = ?auto_303204 ?auto_303210 ) ) ( not ( = ?auto_303205 ?auto_303206 ) ) ( not ( = ?auto_303205 ?auto_303207 ) ) ( not ( = ?auto_303205 ?auto_303208 ) ) ( not ( = ?auto_303205 ?auto_303209 ) ) ( not ( = ?auto_303205 ?auto_303210 ) ) ( not ( = ?auto_303206 ?auto_303207 ) ) ( not ( = ?auto_303206 ?auto_303208 ) ) ( not ( = ?auto_303206 ?auto_303209 ) ) ( not ( = ?auto_303206 ?auto_303210 ) ) ( not ( = ?auto_303207 ?auto_303208 ) ) ( not ( = ?auto_303207 ?auto_303209 ) ) ( not ( = ?auto_303207 ?auto_303210 ) ) ( not ( = ?auto_303208 ?auto_303209 ) ) ( not ( = ?auto_303208 ?auto_303210 ) ) ( not ( = ?auto_303209 ?auto_303210 ) ) ( ON ?auto_303208 ?auto_303209 ) ( ON ?auto_303207 ?auto_303208 ) ( ON ?auto_303206 ?auto_303207 ) ( ON ?auto_303205 ?auto_303206 ) ( ON ?auto_303204 ?auto_303205 ) ( ON ?auto_303203 ?auto_303204 ) ( ON ?auto_303202 ?auto_303203 ) ( CLEAR ?auto_303200 ) ( ON ?auto_303201 ?auto_303202 ) ( CLEAR ?auto_303201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_303198 ?auto_303199 ?auto_303200 ?auto_303201 )
      ( MAKE-12PILE ?auto_303198 ?auto_303199 ?auto_303200 ?auto_303201 ?auto_303202 ?auto_303203 ?auto_303204 ?auto_303205 ?auto_303206 ?auto_303207 ?auto_303208 ?auto_303209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303248 - BLOCK
      ?auto_303249 - BLOCK
      ?auto_303250 - BLOCK
      ?auto_303251 - BLOCK
      ?auto_303252 - BLOCK
      ?auto_303253 - BLOCK
      ?auto_303254 - BLOCK
      ?auto_303255 - BLOCK
      ?auto_303256 - BLOCK
      ?auto_303257 - BLOCK
      ?auto_303258 - BLOCK
      ?auto_303259 - BLOCK
    )
    :vars
    (
      ?auto_303260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303259 ?auto_303260 ) ( ON-TABLE ?auto_303248 ) ( ON ?auto_303249 ?auto_303248 ) ( not ( = ?auto_303248 ?auto_303249 ) ) ( not ( = ?auto_303248 ?auto_303250 ) ) ( not ( = ?auto_303248 ?auto_303251 ) ) ( not ( = ?auto_303248 ?auto_303252 ) ) ( not ( = ?auto_303248 ?auto_303253 ) ) ( not ( = ?auto_303248 ?auto_303254 ) ) ( not ( = ?auto_303248 ?auto_303255 ) ) ( not ( = ?auto_303248 ?auto_303256 ) ) ( not ( = ?auto_303248 ?auto_303257 ) ) ( not ( = ?auto_303248 ?auto_303258 ) ) ( not ( = ?auto_303248 ?auto_303259 ) ) ( not ( = ?auto_303248 ?auto_303260 ) ) ( not ( = ?auto_303249 ?auto_303250 ) ) ( not ( = ?auto_303249 ?auto_303251 ) ) ( not ( = ?auto_303249 ?auto_303252 ) ) ( not ( = ?auto_303249 ?auto_303253 ) ) ( not ( = ?auto_303249 ?auto_303254 ) ) ( not ( = ?auto_303249 ?auto_303255 ) ) ( not ( = ?auto_303249 ?auto_303256 ) ) ( not ( = ?auto_303249 ?auto_303257 ) ) ( not ( = ?auto_303249 ?auto_303258 ) ) ( not ( = ?auto_303249 ?auto_303259 ) ) ( not ( = ?auto_303249 ?auto_303260 ) ) ( not ( = ?auto_303250 ?auto_303251 ) ) ( not ( = ?auto_303250 ?auto_303252 ) ) ( not ( = ?auto_303250 ?auto_303253 ) ) ( not ( = ?auto_303250 ?auto_303254 ) ) ( not ( = ?auto_303250 ?auto_303255 ) ) ( not ( = ?auto_303250 ?auto_303256 ) ) ( not ( = ?auto_303250 ?auto_303257 ) ) ( not ( = ?auto_303250 ?auto_303258 ) ) ( not ( = ?auto_303250 ?auto_303259 ) ) ( not ( = ?auto_303250 ?auto_303260 ) ) ( not ( = ?auto_303251 ?auto_303252 ) ) ( not ( = ?auto_303251 ?auto_303253 ) ) ( not ( = ?auto_303251 ?auto_303254 ) ) ( not ( = ?auto_303251 ?auto_303255 ) ) ( not ( = ?auto_303251 ?auto_303256 ) ) ( not ( = ?auto_303251 ?auto_303257 ) ) ( not ( = ?auto_303251 ?auto_303258 ) ) ( not ( = ?auto_303251 ?auto_303259 ) ) ( not ( = ?auto_303251 ?auto_303260 ) ) ( not ( = ?auto_303252 ?auto_303253 ) ) ( not ( = ?auto_303252 ?auto_303254 ) ) ( not ( = ?auto_303252 ?auto_303255 ) ) ( not ( = ?auto_303252 ?auto_303256 ) ) ( not ( = ?auto_303252 ?auto_303257 ) ) ( not ( = ?auto_303252 ?auto_303258 ) ) ( not ( = ?auto_303252 ?auto_303259 ) ) ( not ( = ?auto_303252 ?auto_303260 ) ) ( not ( = ?auto_303253 ?auto_303254 ) ) ( not ( = ?auto_303253 ?auto_303255 ) ) ( not ( = ?auto_303253 ?auto_303256 ) ) ( not ( = ?auto_303253 ?auto_303257 ) ) ( not ( = ?auto_303253 ?auto_303258 ) ) ( not ( = ?auto_303253 ?auto_303259 ) ) ( not ( = ?auto_303253 ?auto_303260 ) ) ( not ( = ?auto_303254 ?auto_303255 ) ) ( not ( = ?auto_303254 ?auto_303256 ) ) ( not ( = ?auto_303254 ?auto_303257 ) ) ( not ( = ?auto_303254 ?auto_303258 ) ) ( not ( = ?auto_303254 ?auto_303259 ) ) ( not ( = ?auto_303254 ?auto_303260 ) ) ( not ( = ?auto_303255 ?auto_303256 ) ) ( not ( = ?auto_303255 ?auto_303257 ) ) ( not ( = ?auto_303255 ?auto_303258 ) ) ( not ( = ?auto_303255 ?auto_303259 ) ) ( not ( = ?auto_303255 ?auto_303260 ) ) ( not ( = ?auto_303256 ?auto_303257 ) ) ( not ( = ?auto_303256 ?auto_303258 ) ) ( not ( = ?auto_303256 ?auto_303259 ) ) ( not ( = ?auto_303256 ?auto_303260 ) ) ( not ( = ?auto_303257 ?auto_303258 ) ) ( not ( = ?auto_303257 ?auto_303259 ) ) ( not ( = ?auto_303257 ?auto_303260 ) ) ( not ( = ?auto_303258 ?auto_303259 ) ) ( not ( = ?auto_303258 ?auto_303260 ) ) ( not ( = ?auto_303259 ?auto_303260 ) ) ( ON ?auto_303258 ?auto_303259 ) ( ON ?auto_303257 ?auto_303258 ) ( ON ?auto_303256 ?auto_303257 ) ( ON ?auto_303255 ?auto_303256 ) ( ON ?auto_303254 ?auto_303255 ) ( ON ?auto_303253 ?auto_303254 ) ( ON ?auto_303252 ?auto_303253 ) ( ON ?auto_303251 ?auto_303252 ) ( CLEAR ?auto_303249 ) ( ON ?auto_303250 ?auto_303251 ) ( CLEAR ?auto_303250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_303248 ?auto_303249 ?auto_303250 )
      ( MAKE-12PILE ?auto_303248 ?auto_303249 ?auto_303250 ?auto_303251 ?auto_303252 ?auto_303253 ?auto_303254 ?auto_303255 ?auto_303256 ?auto_303257 ?auto_303258 ?auto_303259 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303298 - BLOCK
      ?auto_303299 - BLOCK
      ?auto_303300 - BLOCK
      ?auto_303301 - BLOCK
      ?auto_303302 - BLOCK
      ?auto_303303 - BLOCK
      ?auto_303304 - BLOCK
      ?auto_303305 - BLOCK
      ?auto_303306 - BLOCK
      ?auto_303307 - BLOCK
      ?auto_303308 - BLOCK
      ?auto_303309 - BLOCK
    )
    :vars
    (
      ?auto_303310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303309 ?auto_303310 ) ( ON-TABLE ?auto_303298 ) ( not ( = ?auto_303298 ?auto_303299 ) ) ( not ( = ?auto_303298 ?auto_303300 ) ) ( not ( = ?auto_303298 ?auto_303301 ) ) ( not ( = ?auto_303298 ?auto_303302 ) ) ( not ( = ?auto_303298 ?auto_303303 ) ) ( not ( = ?auto_303298 ?auto_303304 ) ) ( not ( = ?auto_303298 ?auto_303305 ) ) ( not ( = ?auto_303298 ?auto_303306 ) ) ( not ( = ?auto_303298 ?auto_303307 ) ) ( not ( = ?auto_303298 ?auto_303308 ) ) ( not ( = ?auto_303298 ?auto_303309 ) ) ( not ( = ?auto_303298 ?auto_303310 ) ) ( not ( = ?auto_303299 ?auto_303300 ) ) ( not ( = ?auto_303299 ?auto_303301 ) ) ( not ( = ?auto_303299 ?auto_303302 ) ) ( not ( = ?auto_303299 ?auto_303303 ) ) ( not ( = ?auto_303299 ?auto_303304 ) ) ( not ( = ?auto_303299 ?auto_303305 ) ) ( not ( = ?auto_303299 ?auto_303306 ) ) ( not ( = ?auto_303299 ?auto_303307 ) ) ( not ( = ?auto_303299 ?auto_303308 ) ) ( not ( = ?auto_303299 ?auto_303309 ) ) ( not ( = ?auto_303299 ?auto_303310 ) ) ( not ( = ?auto_303300 ?auto_303301 ) ) ( not ( = ?auto_303300 ?auto_303302 ) ) ( not ( = ?auto_303300 ?auto_303303 ) ) ( not ( = ?auto_303300 ?auto_303304 ) ) ( not ( = ?auto_303300 ?auto_303305 ) ) ( not ( = ?auto_303300 ?auto_303306 ) ) ( not ( = ?auto_303300 ?auto_303307 ) ) ( not ( = ?auto_303300 ?auto_303308 ) ) ( not ( = ?auto_303300 ?auto_303309 ) ) ( not ( = ?auto_303300 ?auto_303310 ) ) ( not ( = ?auto_303301 ?auto_303302 ) ) ( not ( = ?auto_303301 ?auto_303303 ) ) ( not ( = ?auto_303301 ?auto_303304 ) ) ( not ( = ?auto_303301 ?auto_303305 ) ) ( not ( = ?auto_303301 ?auto_303306 ) ) ( not ( = ?auto_303301 ?auto_303307 ) ) ( not ( = ?auto_303301 ?auto_303308 ) ) ( not ( = ?auto_303301 ?auto_303309 ) ) ( not ( = ?auto_303301 ?auto_303310 ) ) ( not ( = ?auto_303302 ?auto_303303 ) ) ( not ( = ?auto_303302 ?auto_303304 ) ) ( not ( = ?auto_303302 ?auto_303305 ) ) ( not ( = ?auto_303302 ?auto_303306 ) ) ( not ( = ?auto_303302 ?auto_303307 ) ) ( not ( = ?auto_303302 ?auto_303308 ) ) ( not ( = ?auto_303302 ?auto_303309 ) ) ( not ( = ?auto_303302 ?auto_303310 ) ) ( not ( = ?auto_303303 ?auto_303304 ) ) ( not ( = ?auto_303303 ?auto_303305 ) ) ( not ( = ?auto_303303 ?auto_303306 ) ) ( not ( = ?auto_303303 ?auto_303307 ) ) ( not ( = ?auto_303303 ?auto_303308 ) ) ( not ( = ?auto_303303 ?auto_303309 ) ) ( not ( = ?auto_303303 ?auto_303310 ) ) ( not ( = ?auto_303304 ?auto_303305 ) ) ( not ( = ?auto_303304 ?auto_303306 ) ) ( not ( = ?auto_303304 ?auto_303307 ) ) ( not ( = ?auto_303304 ?auto_303308 ) ) ( not ( = ?auto_303304 ?auto_303309 ) ) ( not ( = ?auto_303304 ?auto_303310 ) ) ( not ( = ?auto_303305 ?auto_303306 ) ) ( not ( = ?auto_303305 ?auto_303307 ) ) ( not ( = ?auto_303305 ?auto_303308 ) ) ( not ( = ?auto_303305 ?auto_303309 ) ) ( not ( = ?auto_303305 ?auto_303310 ) ) ( not ( = ?auto_303306 ?auto_303307 ) ) ( not ( = ?auto_303306 ?auto_303308 ) ) ( not ( = ?auto_303306 ?auto_303309 ) ) ( not ( = ?auto_303306 ?auto_303310 ) ) ( not ( = ?auto_303307 ?auto_303308 ) ) ( not ( = ?auto_303307 ?auto_303309 ) ) ( not ( = ?auto_303307 ?auto_303310 ) ) ( not ( = ?auto_303308 ?auto_303309 ) ) ( not ( = ?auto_303308 ?auto_303310 ) ) ( not ( = ?auto_303309 ?auto_303310 ) ) ( ON ?auto_303308 ?auto_303309 ) ( ON ?auto_303307 ?auto_303308 ) ( ON ?auto_303306 ?auto_303307 ) ( ON ?auto_303305 ?auto_303306 ) ( ON ?auto_303304 ?auto_303305 ) ( ON ?auto_303303 ?auto_303304 ) ( ON ?auto_303302 ?auto_303303 ) ( ON ?auto_303301 ?auto_303302 ) ( ON ?auto_303300 ?auto_303301 ) ( CLEAR ?auto_303298 ) ( ON ?auto_303299 ?auto_303300 ) ( CLEAR ?auto_303299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_303298 ?auto_303299 )
      ( MAKE-12PILE ?auto_303298 ?auto_303299 ?auto_303300 ?auto_303301 ?auto_303302 ?auto_303303 ?auto_303304 ?auto_303305 ?auto_303306 ?auto_303307 ?auto_303308 ?auto_303309 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_303348 - BLOCK
      ?auto_303349 - BLOCK
      ?auto_303350 - BLOCK
      ?auto_303351 - BLOCK
      ?auto_303352 - BLOCK
      ?auto_303353 - BLOCK
      ?auto_303354 - BLOCK
      ?auto_303355 - BLOCK
      ?auto_303356 - BLOCK
      ?auto_303357 - BLOCK
      ?auto_303358 - BLOCK
      ?auto_303359 - BLOCK
    )
    :vars
    (
      ?auto_303360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303359 ?auto_303360 ) ( not ( = ?auto_303348 ?auto_303349 ) ) ( not ( = ?auto_303348 ?auto_303350 ) ) ( not ( = ?auto_303348 ?auto_303351 ) ) ( not ( = ?auto_303348 ?auto_303352 ) ) ( not ( = ?auto_303348 ?auto_303353 ) ) ( not ( = ?auto_303348 ?auto_303354 ) ) ( not ( = ?auto_303348 ?auto_303355 ) ) ( not ( = ?auto_303348 ?auto_303356 ) ) ( not ( = ?auto_303348 ?auto_303357 ) ) ( not ( = ?auto_303348 ?auto_303358 ) ) ( not ( = ?auto_303348 ?auto_303359 ) ) ( not ( = ?auto_303348 ?auto_303360 ) ) ( not ( = ?auto_303349 ?auto_303350 ) ) ( not ( = ?auto_303349 ?auto_303351 ) ) ( not ( = ?auto_303349 ?auto_303352 ) ) ( not ( = ?auto_303349 ?auto_303353 ) ) ( not ( = ?auto_303349 ?auto_303354 ) ) ( not ( = ?auto_303349 ?auto_303355 ) ) ( not ( = ?auto_303349 ?auto_303356 ) ) ( not ( = ?auto_303349 ?auto_303357 ) ) ( not ( = ?auto_303349 ?auto_303358 ) ) ( not ( = ?auto_303349 ?auto_303359 ) ) ( not ( = ?auto_303349 ?auto_303360 ) ) ( not ( = ?auto_303350 ?auto_303351 ) ) ( not ( = ?auto_303350 ?auto_303352 ) ) ( not ( = ?auto_303350 ?auto_303353 ) ) ( not ( = ?auto_303350 ?auto_303354 ) ) ( not ( = ?auto_303350 ?auto_303355 ) ) ( not ( = ?auto_303350 ?auto_303356 ) ) ( not ( = ?auto_303350 ?auto_303357 ) ) ( not ( = ?auto_303350 ?auto_303358 ) ) ( not ( = ?auto_303350 ?auto_303359 ) ) ( not ( = ?auto_303350 ?auto_303360 ) ) ( not ( = ?auto_303351 ?auto_303352 ) ) ( not ( = ?auto_303351 ?auto_303353 ) ) ( not ( = ?auto_303351 ?auto_303354 ) ) ( not ( = ?auto_303351 ?auto_303355 ) ) ( not ( = ?auto_303351 ?auto_303356 ) ) ( not ( = ?auto_303351 ?auto_303357 ) ) ( not ( = ?auto_303351 ?auto_303358 ) ) ( not ( = ?auto_303351 ?auto_303359 ) ) ( not ( = ?auto_303351 ?auto_303360 ) ) ( not ( = ?auto_303352 ?auto_303353 ) ) ( not ( = ?auto_303352 ?auto_303354 ) ) ( not ( = ?auto_303352 ?auto_303355 ) ) ( not ( = ?auto_303352 ?auto_303356 ) ) ( not ( = ?auto_303352 ?auto_303357 ) ) ( not ( = ?auto_303352 ?auto_303358 ) ) ( not ( = ?auto_303352 ?auto_303359 ) ) ( not ( = ?auto_303352 ?auto_303360 ) ) ( not ( = ?auto_303353 ?auto_303354 ) ) ( not ( = ?auto_303353 ?auto_303355 ) ) ( not ( = ?auto_303353 ?auto_303356 ) ) ( not ( = ?auto_303353 ?auto_303357 ) ) ( not ( = ?auto_303353 ?auto_303358 ) ) ( not ( = ?auto_303353 ?auto_303359 ) ) ( not ( = ?auto_303353 ?auto_303360 ) ) ( not ( = ?auto_303354 ?auto_303355 ) ) ( not ( = ?auto_303354 ?auto_303356 ) ) ( not ( = ?auto_303354 ?auto_303357 ) ) ( not ( = ?auto_303354 ?auto_303358 ) ) ( not ( = ?auto_303354 ?auto_303359 ) ) ( not ( = ?auto_303354 ?auto_303360 ) ) ( not ( = ?auto_303355 ?auto_303356 ) ) ( not ( = ?auto_303355 ?auto_303357 ) ) ( not ( = ?auto_303355 ?auto_303358 ) ) ( not ( = ?auto_303355 ?auto_303359 ) ) ( not ( = ?auto_303355 ?auto_303360 ) ) ( not ( = ?auto_303356 ?auto_303357 ) ) ( not ( = ?auto_303356 ?auto_303358 ) ) ( not ( = ?auto_303356 ?auto_303359 ) ) ( not ( = ?auto_303356 ?auto_303360 ) ) ( not ( = ?auto_303357 ?auto_303358 ) ) ( not ( = ?auto_303357 ?auto_303359 ) ) ( not ( = ?auto_303357 ?auto_303360 ) ) ( not ( = ?auto_303358 ?auto_303359 ) ) ( not ( = ?auto_303358 ?auto_303360 ) ) ( not ( = ?auto_303359 ?auto_303360 ) ) ( ON ?auto_303358 ?auto_303359 ) ( ON ?auto_303357 ?auto_303358 ) ( ON ?auto_303356 ?auto_303357 ) ( ON ?auto_303355 ?auto_303356 ) ( ON ?auto_303354 ?auto_303355 ) ( ON ?auto_303353 ?auto_303354 ) ( ON ?auto_303352 ?auto_303353 ) ( ON ?auto_303351 ?auto_303352 ) ( ON ?auto_303350 ?auto_303351 ) ( ON ?auto_303349 ?auto_303350 ) ( ON ?auto_303348 ?auto_303349 ) ( CLEAR ?auto_303348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_303348 )
      ( MAKE-12PILE ?auto_303348 ?auto_303349 ?auto_303350 ?auto_303351 ?auto_303352 ?auto_303353 ?auto_303354 ?auto_303355 ?auto_303356 ?auto_303357 ?auto_303358 ?auto_303359 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303399 - BLOCK
      ?auto_303400 - BLOCK
      ?auto_303401 - BLOCK
      ?auto_303402 - BLOCK
      ?auto_303403 - BLOCK
      ?auto_303404 - BLOCK
      ?auto_303405 - BLOCK
      ?auto_303406 - BLOCK
      ?auto_303407 - BLOCK
      ?auto_303408 - BLOCK
      ?auto_303409 - BLOCK
      ?auto_303410 - BLOCK
      ?auto_303411 - BLOCK
    )
    :vars
    (
      ?auto_303412 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_303410 ) ( ON ?auto_303411 ?auto_303412 ) ( CLEAR ?auto_303411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_303399 ) ( ON ?auto_303400 ?auto_303399 ) ( ON ?auto_303401 ?auto_303400 ) ( ON ?auto_303402 ?auto_303401 ) ( ON ?auto_303403 ?auto_303402 ) ( ON ?auto_303404 ?auto_303403 ) ( ON ?auto_303405 ?auto_303404 ) ( ON ?auto_303406 ?auto_303405 ) ( ON ?auto_303407 ?auto_303406 ) ( ON ?auto_303408 ?auto_303407 ) ( ON ?auto_303409 ?auto_303408 ) ( ON ?auto_303410 ?auto_303409 ) ( not ( = ?auto_303399 ?auto_303400 ) ) ( not ( = ?auto_303399 ?auto_303401 ) ) ( not ( = ?auto_303399 ?auto_303402 ) ) ( not ( = ?auto_303399 ?auto_303403 ) ) ( not ( = ?auto_303399 ?auto_303404 ) ) ( not ( = ?auto_303399 ?auto_303405 ) ) ( not ( = ?auto_303399 ?auto_303406 ) ) ( not ( = ?auto_303399 ?auto_303407 ) ) ( not ( = ?auto_303399 ?auto_303408 ) ) ( not ( = ?auto_303399 ?auto_303409 ) ) ( not ( = ?auto_303399 ?auto_303410 ) ) ( not ( = ?auto_303399 ?auto_303411 ) ) ( not ( = ?auto_303399 ?auto_303412 ) ) ( not ( = ?auto_303400 ?auto_303401 ) ) ( not ( = ?auto_303400 ?auto_303402 ) ) ( not ( = ?auto_303400 ?auto_303403 ) ) ( not ( = ?auto_303400 ?auto_303404 ) ) ( not ( = ?auto_303400 ?auto_303405 ) ) ( not ( = ?auto_303400 ?auto_303406 ) ) ( not ( = ?auto_303400 ?auto_303407 ) ) ( not ( = ?auto_303400 ?auto_303408 ) ) ( not ( = ?auto_303400 ?auto_303409 ) ) ( not ( = ?auto_303400 ?auto_303410 ) ) ( not ( = ?auto_303400 ?auto_303411 ) ) ( not ( = ?auto_303400 ?auto_303412 ) ) ( not ( = ?auto_303401 ?auto_303402 ) ) ( not ( = ?auto_303401 ?auto_303403 ) ) ( not ( = ?auto_303401 ?auto_303404 ) ) ( not ( = ?auto_303401 ?auto_303405 ) ) ( not ( = ?auto_303401 ?auto_303406 ) ) ( not ( = ?auto_303401 ?auto_303407 ) ) ( not ( = ?auto_303401 ?auto_303408 ) ) ( not ( = ?auto_303401 ?auto_303409 ) ) ( not ( = ?auto_303401 ?auto_303410 ) ) ( not ( = ?auto_303401 ?auto_303411 ) ) ( not ( = ?auto_303401 ?auto_303412 ) ) ( not ( = ?auto_303402 ?auto_303403 ) ) ( not ( = ?auto_303402 ?auto_303404 ) ) ( not ( = ?auto_303402 ?auto_303405 ) ) ( not ( = ?auto_303402 ?auto_303406 ) ) ( not ( = ?auto_303402 ?auto_303407 ) ) ( not ( = ?auto_303402 ?auto_303408 ) ) ( not ( = ?auto_303402 ?auto_303409 ) ) ( not ( = ?auto_303402 ?auto_303410 ) ) ( not ( = ?auto_303402 ?auto_303411 ) ) ( not ( = ?auto_303402 ?auto_303412 ) ) ( not ( = ?auto_303403 ?auto_303404 ) ) ( not ( = ?auto_303403 ?auto_303405 ) ) ( not ( = ?auto_303403 ?auto_303406 ) ) ( not ( = ?auto_303403 ?auto_303407 ) ) ( not ( = ?auto_303403 ?auto_303408 ) ) ( not ( = ?auto_303403 ?auto_303409 ) ) ( not ( = ?auto_303403 ?auto_303410 ) ) ( not ( = ?auto_303403 ?auto_303411 ) ) ( not ( = ?auto_303403 ?auto_303412 ) ) ( not ( = ?auto_303404 ?auto_303405 ) ) ( not ( = ?auto_303404 ?auto_303406 ) ) ( not ( = ?auto_303404 ?auto_303407 ) ) ( not ( = ?auto_303404 ?auto_303408 ) ) ( not ( = ?auto_303404 ?auto_303409 ) ) ( not ( = ?auto_303404 ?auto_303410 ) ) ( not ( = ?auto_303404 ?auto_303411 ) ) ( not ( = ?auto_303404 ?auto_303412 ) ) ( not ( = ?auto_303405 ?auto_303406 ) ) ( not ( = ?auto_303405 ?auto_303407 ) ) ( not ( = ?auto_303405 ?auto_303408 ) ) ( not ( = ?auto_303405 ?auto_303409 ) ) ( not ( = ?auto_303405 ?auto_303410 ) ) ( not ( = ?auto_303405 ?auto_303411 ) ) ( not ( = ?auto_303405 ?auto_303412 ) ) ( not ( = ?auto_303406 ?auto_303407 ) ) ( not ( = ?auto_303406 ?auto_303408 ) ) ( not ( = ?auto_303406 ?auto_303409 ) ) ( not ( = ?auto_303406 ?auto_303410 ) ) ( not ( = ?auto_303406 ?auto_303411 ) ) ( not ( = ?auto_303406 ?auto_303412 ) ) ( not ( = ?auto_303407 ?auto_303408 ) ) ( not ( = ?auto_303407 ?auto_303409 ) ) ( not ( = ?auto_303407 ?auto_303410 ) ) ( not ( = ?auto_303407 ?auto_303411 ) ) ( not ( = ?auto_303407 ?auto_303412 ) ) ( not ( = ?auto_303408 ?auto_303409 ) ) ( not ( = ?auto_303408 ?auto_303410 ) ) ( not ( = ?auto_303408 ?auto_303411 ) ) ( not ( = ?auto_303408 ?auto_303412 ) ) ( not ( = ?auto_303409 ?auto_303410 ) ) ( not ( = ?auto_303409 ?auto_303411 ) ) ( not ( = ?auto_303409 ?auto_303412 ) ) ( not ( = ?auto_303410 ?auto_303411 ) ) ( not ( = ?auto_303410 ?auto_303412 ) ) ( not ( = ?auto_303411 ?auto_303412 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_303411 ?auto_303412 )
      ( !STACK ?auto_303411 ?auto_303410 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303453 - BLOCK
      ?auto_303454 - BLOCK
      ?auto_303455 - BLOCK
      ?auto_303456 - BLOCK
      ?auto_303457 - BLOCK
      ?auto_303458 - BLOCK
      ?auto_303459 - BLOCK
      ?auto_303460 - BLOCK
      ?auto_303461 - BLOCK
      ?auto_303462 - BLOCK
      ?auto_303463 - BLOCK
      ?auto_303464 - BLOCK
      ?auto_303465 - BLOCK
    )
    :vars
    (
      ?auto_303466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303465 ?auto_303466 ) ( ON-TABLE ?auto_303453 ) ( ON ?auto_303454 ?auto_303453 ) ( ON ?auto_303455 ?auto_303454 ) ( ON ?auto_303456 ?auto_303455 ) ( ON ?auto_303457 ?auto_303456 ) ( ON ?auto_303458 ?auto_303457 ) ( ON ?auto_303459 ?auto_303458 ) ( ON ?auto_303460 ?auto_303459 ) ( ON ?auto_303461 ?auto_303460 ) ( ON ?auto_303462 ?auto_303461 ) ( ON ?auto_303463 ?auto_303462 ) ( not ( = ?auto_303453 ?auto_303454 ) ) ( not ( = ?auto_303453 ?auto_303455 ) ) ( not ( = ?auto_303453 ?auto_303456 ) ) ( not ( = ?auto_303453 ?auto_303457 ) ) ( not ( = ?auto_303453 ?auto_303458 ) ) ( not ( = ?auto_303453 ?auto_303459 ) ) ( not ( = ?auto_303453 ?auto_303460 ) ) ( not ( = ?auto_303453 ?auto_303461 ) ) ( not ( = ?auto_303453 ?auto_303462 ) ) ( not ( = ?auto_303453 ?auto_303463 ) ) ( not ( = ?auto_303453 ?auto_303464 ) ) ( not ( = ?auto_303453 ?auto_303465 ) ) ( not ( = ?auto_303453 ?auto_303466 ) ) ( not ( = ?auto_303454 ?auto_303455 ) ) ( not ( = ?auto_303454 ?auto_303456 ) ) ( not ( = ?auto_303454 ?auto_303457 ) ) ( not ( = ?auto_303454 ?auto_303458 ) ) ( not ( = ?auto_303454 ?auto_303459 ) ) ( not ( = ?auto_303454 ?auto_303460 ) ) ( not ( = ?auto_303454 ?auto_303461 ) ) ( not ( = ?auto_303454 ?auto_303462 ) ) ( not ( = ?auto_303454 ?auto_303463 ) ) ( not ( = ?auto_303454 ?auto_303464 ) ) ( not ( = ?auto_303454 ?auto_303465 ) ) ( not ( = ?auto_303454 ?auto_303466 ) ) ( not ( = ?auto_303455 ?auto_303456 ) ) ( not ( = ?auto_303455 ?auto_303457 ) ) ( not ( = ?auto_303455 ?auto_303458 ) ) ( not ( = ?auto_303455 ?auto_303459 ) ) ( not ( = ?auto_303455 ?auto_303460 ) ) ( not ( = ?auto_303455 ?auto_303461 ) ) ( not ( = ?auto_303455 ?auto_303462 ) ) ( not ( = ?auto_303455 ?auto_303463 ) ) ( not ( = ?auto_303455 ?auto_303464 ) ) ( not ( = ?auto_303455 ?auto_303465 ) ) ( not ( = ?auto_303455 ?auto_303466 ) ) ( not ( = ?auto_303456 ?auto_303457 ) ) ( not ( = ?auto_303456 ?auto_303458 ) ) ( not ( = ?auto_303456 ?auto_303459 ) ) ( not ( = ?auto_303456 ?auto_303460 ) ) ( not ( = ?auto_303456 ?auto_303461 ) ) ( not ( = ?auto_303456 ?auto_303462 ) ) ( not ( = ?auto_303456 ?auto_303463 ) ) ( not ( = ?auto_303456 ?auto_303464 ) ) ( not ( = ?auto_303456 ?auto_303465 ) ) ( not ( = ?auto_303456 ?auto_303466 ) ) ( not ( = ?auto_303457 ?auto_303458 ) ) ( not ( = ?auto_303457 ?auto_303459 ) ) ( not ( = ?auto_303457 ?auto_303460 ) ) ( not ( = ?auto_303457 ?auto_303461 ) ) ( not ( = ?auto_303457 ?auto_303462 ) ) ( not ( = ?auto_303457 ?auto_303463 ) ) ( not ( = ?auto_303457 ?auto_303464 ) ) ( not ( = ?auto_303457 ?auto_303465 ) ) ( not ( = ?auto_303457 ?auto_303466 ) ) ( not ( = ?auto_303458 ?auto_303459 ) ) ( not ( = ?auto_303458 ?auto_303460 ) ) ( not ( = ?auto_303458 ?auto_303461 ) ) ( not ( = ?auto_303458 ?auto_303462 ) ) ( not ( = ?auto_303458 ?auto_303463 ) ) ( not ( = ?auto_303458 ?auto_303464 ) ) ( not ( = ?auto_303458 ?auto_303465 ) ) ( not ( = ?auto_303458 ?auto_303466 ) ) ( not ( = ?auto_303459 ?auto_303460 ) ) ( not ( = ?auto_303459 ?auto_303461 ) ) ( not ( = ?auto_303459 ?auto_303462 ) ) ( not ( = ?auto_303459 ?auto_303463 ) ) ( not ( = ?auto_303459 ?auto_303464 ) ) ( not ( = ?auto_303459 ?auto_303465 ) ) ( not ( = ?auto_303459 ?auto_303466 ) ) ( not ( = ?auto_303460 ?auto_303461 ) ) ( not ( = ?auto_303460 ?auto_303462 ) ) ( not ( = ?auto_303460 ?auto_303463 ) ) ( not ( = ?auto_303460 ?auto_303464 ) ) ( not ( = ?auto_303460 ?auto_303465 ) ) ( not ( = ?auto_303460 ?auto_303466 ) ) ( not ( = ?auto_303461 ?auto_303462 ) ) ( not ( = ?auto_303461 ?auto_303463 ) ) ( not ( = ?auto_303461 ?auto_303464 ) ) ( not ( = ?auto_303461 ?auto_303465 ) ) ( not ( = ?auto_303461 ?auto_303466 ) ) ( not ( = ?auto_303462 ?auto_303463 ) ) ( not ( = ?auto_303462 ?auto_303464 ) ) ( not ( = ?auto_303462 ?auto_303465 ) ) ( not ( = ?auto_303462 ?auto_303466 ) ) ( not ( = ?auto_303463 ?auto_303464 ) ) ( not ( = ?auto_303463 ?auto_303465 ) ) ( not ( = ?auto_303463 ?auto_303466 ) ) ( not ( = ?auto_303464 ?auto_303465 ) ) ( not ( = ?auto_303464 ?auto_303466 ) ) ( not ( = ?auto_303465 ?auto_303466 ) ) ( CLEAR ?auto_303463 ) ( ON ?auto_303464 ?auto_303465 ) ( CLEAR ?auto_303464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_303453 ?auto_303454 ?auto_303455 ?auto_303456 ?auto_303457 ?auto_303458 ?auto_303459 ?auto_303460 ?auto_303461 ?auto_303462 ?auto_303463 ?auto_303464 )
      ( MAKE-13PILE ?auto_303453 ?auto_303454 ?auto_303455 ?auto_303456 ?auto_303457 ?auto_303458 ?auto_303459 ?auto_303460 ?auto_303461 ?auto_303462 ?auto_303463 ?auto_303464 ?auto_303465 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303507 - BLOCK
      ?auto_303508 - BLOCK
      ?auto_303509 - BLOCK
      ?auto_303510 - BLOCK
      ?auto_303511 - BLOCK
      ?auto_303512 - BLOCK
      ?auto_303513 - BLOCK
      ?auto_303514 - BLOCK
      ?auto_303515 - BLOCK
      ?auto_303516 - BLOCK
      ?auto_303517 - BLOCK
      ?auto_303518 - BLOCK
      ?auto_303519 - BLOCK
    )
    :vars
    (
      ?auto_303520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303519 ?auto_303520 ) ( ON-TABLE ?auto_303507 ) ( ON ?auto_303508 ?auto_303507 ) ( ON ?auto_303509 ?auto_303508 ) ( ON ?auto_303510 ?auto_303509 ) ( ON ?auto_303511 ?auto_303510 ) ( ON ?auto_303512 ?auto_303511 ) ( ON ?auto_303513 ?auto_303512 ) ( ON ?auto_303514 ?auto_303513 ) ( ON ?auto_303515 ?auto_303514 ) ( ON ?auto_303516 ?auto_303515 ) ( not ( = ?auto_303507 ?auto_303508 ) ) ( not ( = ?auto_303507 ?auto_303509 ) ) ( not ( = ?auto_303507 ?auto_303510 ) ) ( not ( = ?auto_303507 ?auto_303511 ) ) ( not ( = ?auto_303507 ?auto_303512 ) ) ( not ( = ?auto_303507 ?auto_303513 ) ) ( not ( = ?auto_303507 ?auto_303514 ) ) ( not ( = ?auto_303507 ?auto_303515 ) ) ( not ( = ?auto_303507 ?auto_303516 ) ) ( not ( = ?auto_303507 ?auto_303517 ) ) ( not ( = ?auto_303507 ?auto_303518 ) ) ( not ( = ?auto_303507 ?auto_303519 ) ) ( not ( = ?auto_303507 ?auto_303520 ) ) ( not ( = ?auto_303508 ?auto_303509 ) ) ( not ( = ?auto_303508 ?auto_303510 ) ) ( not ( = ?auto_303508 ?auto_303511 ) ) ( not ( = ?auto_303508 ?auto_303512 ) ) ( not ( = ?auto_303508 ?auto_303513 ) ) ( not ( = ?auto_303508 ?auto_303514 ) ) ( not ( = ?auto_303508 ?auto_303515 ) ) ( not ( = ?auto_303508 ?auto_303516 ) ) ( not ( = ?auto_303508 ?auto_303517 ) ) ( not ( = ?auto_303508 ?auto_303518 ) ) ( not ( = ?auto_303508 ?auto_303519 ) ) ( not ( = ?auto_303508 ?auto_303520 ) ) ( not ( = ?auto_303509 ?auto_303510 ) ) ( not ( = ?auto_303509 ?auto_303511 ) ) ( not ( = ?auto_303509 ?auto_303512 ) ) ( not ( = ?auto_303509 ?auto_303513 ) ) ( not ( = ?auto_303509 ?auto_303514 ) ) ( not ( = ?auto_303509 ?auto_303515 ) ) ( not ( = ?auto_303509 ?auto_303516 ) ) ( not ( = ?auto_303509 ?auto_303517 ) ) ( not ( = ?auto_303509 ?auto_303518 ) ) ( not ( = ?auto_303509 ?auto_303519 ) ) ( not ( = ?auto_303509 ?auto_303520 ) ) ( not ( = ?auto_303510 ?auto_303511 ) ) ( not ( = ?auto_303510 ?auto_303512 ) ) ( not ( = ?auto_303510 ?auto_303513 ) ) ( not ( = ?auto_303510 ?auto_303514 ) ) ( not ( = ?auto_303510 ?auto_303515 ) ) ( not ( = ?auto_303510 ?auto_303516 ) ) ( not ( = ?auto_303510 ?auto_303517 ) ) ( not ( = ?auto_303510 ?auto_303518 ) ) ( not ( = ?auto_303510 ?auto_303519 ) ) ( not ( = ?auto_303510 ?auto_303520 ) ) ( not ( = ?auto_303511 ?auto_303512 ) ) ( not ( = ?auto_303511 ?auto_303513 ) ) ( not ( = ?auto_303511 ?auto_303514 ) ) ( not ( = ?auto_303511 ?auto_303515 ) ) ( not ( = ?auto_303511 ?auto_303516 ) ) ( not ( = ?auto_303511 ?auto_303517 ) ) ( not ( = ?auto_303511 ?auto_303518 ) ) ( not ( = ?auto_303511 ?auto_303519 ) ) ( not ( = ?auto_303511 ?auto_303520 ) ) ( not ( = ?auto_303512 ?auto_303513 ) ) ( not ( = ?auto_303512 ?auto_303514 ) ) ( not ( = ?auto_303512 ?auto_303515 ) ) ( not ( = ?auto_303512 ?auto_303516 ) ) ( not ( = ?auto_303512 ?auto_303517 ) ) ( not ( = ?auto_303512 ?auto_303518 ) ) ( not ( = ?auto_303512 ?auto_303519 ) ) ( not ( = ?auto_303512 ?auto_303520 ) ) ( not ( = ?auto_303513 ?auto_303514 ) ) ( not ( = ?auto_303513 ?auto_303515 ) ) ( not ( = ?auto_303513 ?auto_303516 ) ) ( not ( = ?auto_303513 ?auto_303517 ) ) ( not ( = ?auto_303513 ?auto_303518 ) ) ( not ( = ?auto_303513 ?auto_303519 ) ) ( not ( = ?auto_303513 ?auto_303520 ) ) ( not ( = ?auto_303514 ?auto_303515 ) ) ( not ( = ?auto_303514 ?auto_303516 ) ) ( not ( = ?auto_303514 ?auto_303517 ) ) ( not ( = ?auto_303514 ?auto_303518 ) ) ( not ( = ?auto_303514 ?auto_303519 ) ) ( not ( = ?auto_303514 ?auto_303520 ) ) ( not ( = ?auto_303515 ?auto_303516 ) ) ( not ( = ?auto_303515 ?auto_303517 ) ) ( not ( = ?auto_303515 ?auto_303518 ) ) ( not ( = ?auto_303515 ?auto_303519 ) ) ( not ( = ?auto_303515 ?auto_303520 ) ) ( not ( = ?auto_303516 ?auto_303517 ) ) ( not ( = ?auto_303516 ?auto_303518 ) ) ( not ( = ?auto_303516 ?auto_303519 ) ) ( not ( = ?auto_303516 ?auto_303520 ) ) ( not ( = ?auto_303517 ?auto_303518 ) ) ( not ( = ?auto_303517 ?auto_303519 ) ) ( not ( = ?auto_303517 ?auto_303520 ) ) ( not ( = ?auto_303518 ?auto_303519 ) ) ( not ( = ?auto_303518 ?auto_303520 ) ) ( not ( = ?auto_303519 ?auto_303520 ) ) ( ON ?auto_303518 ?auto_303519 ) ( CLEAR ?auto_303516 ) ( ON ?auto_303517 ?auto_303518 ) ( CLEAR ?auto_303517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_303507 ?auto_303508 ?auto_303509 ?auto_303510 ?auto_303511 ?auto_303512 ?auto_303513 ?auto_303514 ?auto_303515 ?auto_303516 ?auto_303517 )
      ( MAKE-13PILE ?auto_303507 ?auto_303508 ?auto_303509 ?auto_303510 ?auto_303511 ?auto_303512 ?auto_303513 ?auto_303514 ?auto_303515 ?auto_303516 ?auto_303517 ?auto_303518 ?auto_303519 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303561 - BLOCK
      ?auto_303562 - BLOCK
      ?auto_303563 - BLOCK
      ?auto_303564 - BLOCK
      ?auto_303565 - BLOCK
      ?auto_303566 - BLOCK
      ?auto_303567 - BLOCK
      ?auto_303568 - BLOCK
      ?auto_303569 - BLOCK
      ?auto_303570 - BLOCK
      ?auto_303571 - BLOCK
      ?auto_303572 - BLOCK
      ?auto_303573 - BLOCK
    )
    :vars
    (
      ?auto_303574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303573 ?auto_303574 ) ( ON-TABLE ?auto_303561 ) ( ON ?auto_303562 ?auto_303561 ) ( ON ?auto_303563 ?auto_303562 ) ( ON ?auto_303564 ?auto_303563 ) ( ON ?auto_303565 ?auto_303564 ) ( ON ?auto_303566 ?auto_303565 ) ( ON ?auto_303567 ?auto_303566 ) ( ON ?auto_303568 ?auto_303567 ) ( ON ?auto_303569 ?auto_303568 ) ( not ( = ?auto_303561 ?auto_303562 ) ) ( not ( = ?auto_303561 ?auto_303563 ) ) ( not ( = ?auto_303561 ?auto_303564 ) ) ( not ( = ?auto_303561 ?auto_303565 ) ) ( not ( = ?auto_303561 ?auto_303566 ) ) ( not ( = ?auto_303561 ?auto_303567 ) ) ( not ( = ?auto_303561 ?auto_303568 ) ) ( not ( = ?auto_303561 ?auto_303569 ) ) ( not ( = ?auto_303561 ?auto_303570 ) ) ( not ( = ?auto_303561 ?auto_303571 ) ) ( not ( = ?auto_303561 ?auto_303572 ) ) ( not ( = ?auto_303561 ?auto_303573 ) ) ( not ( = ?auto_303561 ?auto_303574 ) ) ( not ( = ?auto_303562 ?auto_303563 ) ) ( not ( = ?auto_303562 ?auto_303564 ) ) ( not ( = ?auto_303562 ?auto_303565 ) ) ( not ( = ?auto_303562 ?auto_303566 ) ) ( not ( = ?auto_303562 ?auto_303567 ) ) ( not ( = ?auto_303562 ?auto_303568 ) ) ( not ( = ?auto_303562 ?auto_303569 ) ) ( not ( = ?auto_303562 ?auto_303570 ) ) ( not ( = ?auto_303562 ?auto_303571 ) ) ( not ( = ?auto_303562 ?auto_303572 ) ) ( not ( = ?auto_303562 ?auto_303573 ) ) ( not ( = ?auto_303562 ?auto_303574 ) ) ( not ( = ?auto_303563 ?auto_303564 ) ) ( not ( = ?auto_303563 ?auto_303565 ) ) ( not ( = ?auto_303563 ?auto_303566 ) ) ( not ( = ?auto_303563 ?auto_303567 ) ) ( not ( = ?auto_303563 ?auto_303568 ) ) ( not ( = ?auto_303563 ?auto_303569 ) ) ( not ( = ?auto_303563 ?auto_303570 ) ) ( not ( = ?auto_303563 ?auto_303571 ) ) ( not ( = ?auto_303563 ?auto_303572 ) ) ( not ( = ?auto_303563 ?auto_303573 ) ) ( not ( = ?auto_303563 ?auto_303574 ) ) ( not ( = ?auto_303564 ?auto_303565 ) ) ( not ( = ?auto_303564 ?auto_303566 ) ) ( not ( = ?auto_303564 ?auto_303567 ) ) ( not ( = ?auto_303564 ?auto_303568 ) ) ( not ( = ?auto_303564 ?auto_303569 ) ) ( not ( = ?auto_303564 ?auto_303570 ) ) ( not ( = ?auto_303564 ?auto_303571 ) ) ( not ( = ?auto_303564 ?auto_303572 ) ) ( not ( = ?auto_303564 ?auto_303573 ) ) ( not ( = ?auto_303564 ?auto_303574 ) ) ( not ( = ?auto_303565 ?auto_303566 ) ) ( not ( = ?auto_303565 ?auto_303567 ) ) ( not ( = ?auto_303565 ?auto_303568 ) ) ( not ( = ?auto_303565 ?auto_303569 ) ) ( not ( = ?auto_303565 ?auto_303570 ) ) ( not ( = ?auto_303565 ?auto_303571 ) ) ( not ( = ?auto_303565 ?auto_303572 ) ) ( not ( = ?auto_303565 ?auto_303573 ) ) ( not ( = ?auto_303565 ?auto_303574 ) ) ( not ( = ?auto_303566 ?auto_303567 ) ) ( not ( = ?auto_303566 ?auto_303568 ) ) ( not ( = ?auto_303566 ?auto_303569 ) ) ( not ( = ?auto_303566 ?auto_303570 ) ) ( not ( = ?auto_303566 ?auto_303571 ) ) ( not ( = ?auto_303566 ?auto_303572 ) ) ( not ( = ?auto_303566 ?auto_303573 ) ) ( not ( = ?auto_303566 ?auto_303574 ) ) ( not ( = ?auto_303567 ?auto_303568 ) ) ( not ( = ?auto_303567 ?auto_303569 ) ) ( not ( = ?auto_303567 ?auto_303570 ) ) ( not ( = ?auto_303567 ?auto_303571 ) ) ( not ( = ?auto_303567 ?auto_303572 ) ) ( not ( = ?auto_303567 ?auto_303573 ) ) ( not ( = ?auto_303567 ?auto_303574 ) ) ( not ( = ?auto_303568 ?auto_303569 ) ) ( not ( = ?auto_303568 ?auto_303570 ) ) ( not ( = ?auto_303568 ?auto_303571 ) ) ( not ( = ?auto_303568 ?auto_303572 ) ) ( not ( = ?auto_303568 ?auto_303573 ) ) ( not ( = ?auto_303568 ?auto_303574 ) ) ( not ( = ?auto_303569 ?auto_303570 ) ) ( not ( = ?auto_303569 ?auto_303571 ) ) ( not ( = ?auto_303569 ?auto_303572 ) ) ( not ( = ?auto_303569 ?auto_303573 ) ) ( not ( = ?auto_303569 ?auto_303574 ) ) ( not ( = ?auto_303570 ?auto_303571 ) ) ( not ( = ?auto_303570 ?auto_303572 ) ) ( not ( = ?auto_303570 ?auto_303573 ) ) ( not ( = ?auto_303570 ?auto_303574 ) ) ( not ( = ?auto_303571 ?auto_303572 ) ) ( not ( = ?auto_303571 ?auto_303573 ) ) ( not ( = ?auto_303571 ?auto_303574 ) ) ( not ( = ?auto_303572 ?auto_303573 ) ) ( not ( = ?auto_303572 ?auto_303574 ) ) ( not ( = ?auto_303573 ?auto_303574 ) ) ( ON ?auto_303572 ?auto_303573 ) ( ON ?auto_303571 ?auto_303572 ) ( CLEAR ?auto_303569 ) ( ON ?auto_303570 ?auto_303571 ) ( CLEAR ?auto_303570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_303561 ?auto_303562 ?auto_303563 ?auto_303564 ?auto_303565 ?auto_303566 ?auto_303567 ?auto_303568 ?auto_303569 ?auto_303570 )
      ( MAKE-13PILE ?auto_303561 ?auto_303562 ?auto_303563 ?auto_303564 ?auto_303565 ?auto_303566 ?auto_303567 ?auto_303568 ?auto_303569 ?auto_303570 ?auto_303571 ?auto_303572 ?auto_303573 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303615 - BLOCK
      ?auto_303616 - BLOCK
      ?auto_303617 - BLOCK
      ?auto_303618 - BLOCK
      ?auto_303619 - BLOCK
      ?auto_303620 - BLOCK
      ?auto_303621 - BLOCK
      ?auto_303622 - BLOCK
      ?auto_303623 - BLOCK
      ?auto_303624 - BLOCK
      ?auto_303625 - BLOCK
      ?auto_303626 - BLOCK
      ?auto_303627 - BLOCK
    )
    :vars
    (
      ?auto_303628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303627 ?auto_303628 ) ( ON-TABLE ?auto_303615 ) ( ON ?auto_303616 ?auto_303615 ) ( ON ?auto_303617 ?auto_303616 ) ( ON ?auto_303618 ?auto_303617 ) ( ON ?auto_303619 ?auto_303618 ) ( ON ?auto_303620 ?auto_303619 ) ( ON ?auto_303621 ?auto_303620 ) ( ON ?auto_303622 ?auto_303621 ) ( not ( = ?auto_303615 ?auto_303616 ) ) ( not ( = ?auto_303615 ?auto_303617 ) ) ( not ( = ?auto_303615 ?auto_303618 ) ) ( not ( = ?auto_303615 ?auto_303619 ) ) ( not ( = ?auto_303615 ?auto_303620 ) ) ( not ( = ?auto_303615 ?auto_303621 ) ) ( not ( = ?auto_303615 ?auto_303622 ) ) ( not ( = ?auto_303615 ?auto_303623 ) ) ( not ( = ?auto_303615 ?auto_303624 ) ) ( not ( = ?auto_303615 ?auto_303625 ) ) ( not ( = ?auto_303615 ?auto_303626 ) ) ( not ( = ?auto_303615 ?auto_303627 ) ) ( not ( = ?auto_303615 ?auto_303628 ) ) ( not ( = ?auto_303616 ?auto_303617 ) ) ( not ( = ?auto_303616 ?auto_303618 ) ) ( not ( = ?auto_303616 ?auto_303619 ) ) ( not ( = ?auto_303616 ?auto_303620 ) ) ( not ( = ?auto_303616 ?auto_303621 ) ) ( not ( = ?auto_303616 ?auto_303622 ) ) ( not ( = ?auto_303616 ?auto_303623 ) ) ( not ( = ?auto_303616 ?auto_303624 ) ) ( not ( = ?auto_303616 ?auto_303625 ) ) ( not ( = ?auto_303616 ?auto_303626 ) ) ( not ( = ?auto_303616 ?auto_303627 ) ) ( not ( = ?auto_303616 ?auto_303628 ) ) ( not ( = ?auto_303617 ?auto_303618 ) ) ( not ( = ?auto_303617 ?auto_303619 ) ) ( not ( = ?auto_303617 ?auto_303620 ) ) ( not ( = ?auto_303617 ?auto_303621 ) ) ( not ( = ?auto_303617 ?auto_303622 ) ) ( not ( = ?auto_303617 ?auto_303623 ) ) ( not ( = ?auto_303617 ?auto_303624 ) ) ( not ( = ?auto_303617 ?auto_303625 ) ) ( not ( = ?auto_303617 ?auto_303626 ) ) ( not ( = ?auto_303617 ?auto_303627 ) ) ( not ( = ?auto_303617 ?auto_303628 ) ) ( not ( = ?auto_303618 ?auto_303619 ) ) ( not ( = ?auto_303618 ?auto_303620 ) ) ( not ( = ?auto_303618 ?auto_303621 ) ) ( not ( = ?auto_303618 ?auto_303622 ) ) ( not ( = ?auto_303618 ?auto_303623 ) ) ( not ( = ?auto_303618 ?auto_303624 ) ) ( not ( = ?auto_303618 ?auto_303625 ) ) ( not ( = ?auto_303618 ?auto_303626 ) ) ( not ( = ?auto_303618 ?auto_303627 ) ) ( not ( = ?auto_303618 ?auto_303628 ) ) ( not ( = ?auto_303619 ?auto_303620 ) ) ( not ( = ?auto_303619 ?auto_303621 ) ) ( not ( = ?auto_303619 ?auto_303622 ) ) ( not ( = ?auto_303619 ?auto_303623 ) ) ( not ( = ?auto_303619 ?auto_303624 ) ) ( not ( = ?auto_303619 ?auto_303625 ) ) ( not ( = ?auto_303619 ?auto_303626 ) ) ( not ( = ?auto_303619 ?auto_303627 ) ) ( not ( = ?auto_303619 ?auto_303628 ) ) ( not ( = ?auto_303620 ?auto_303621 ) ) ( not ( = ?auto_303620 ?auto_303622 ) ) ( not ( = ?auto_303620 ?auto_303623 ) ) ( not ( = ?auto_303620 ?auto_303624 ) ) ( not ( = ?auto_303620 ?auto_303625 ) ) ( not ( = ?auto_303620 ?auto_303626 ) ) ( not ( = ?auto_303620 ?auto_303627 ) ) ( not ( = ?auto_303620 ?auto_303628 ) ) ( not ( = ?auto_303621 ?auto_303622 ) ) ( not ( = ?auto_303621 ?auto_303623 ) ) ( not ( = ?auto_303621 ?auto_303624 ) ) ( not ( = ?auto_303621 ?auto_303625 ) ) ( not ( = ?auto_303621 ?auto_303626 ) ) ( not ( = ?auto_303621 ?auto_303627 ) ) ( not ( = ?auto_303621 ?auto_303628 ) ) ( not ( = ?auto_303622 ?auto_303623 ) ) ( not ( = ?auto_303622 ?auto_303624 ) ) ( not ( = ?auto_303622 ?auto_303625 ) ) ( not ( = ?auto_303622 ?auto_303626 ) ) ( not ( = ?auto_303622 ?auto_303627 ) ) ( not ( = ?auto_303622 ?auto_303628 ) ) ( not ( = ?auto_303623 ?auto_303624 ) ) ( not ( = ?auto_303623 ?auto_303625 ) ) ( not ( = ?auto_303623 ?auto_303626 ) ) ( not ( = ?auto_303623 ?auto_303627 ) ) ( not ( = ?auto_303623 ?auto_303628 ) ) ( not ( = ?auto_303624 ?auto_303625 ) ) ( not ( = ?auto_303624 ?auto_303626 ) ) ( not ( = ?auto_303624 ?auto_303627 ) ) ( not ( = ?auto_303624 ?auto_303628 ) ) ( not ( = ?auto_303625 ?auto_303626 ) ) ( not ( = ?auto_303625 ?auto_303627 ) ) ( not ( = ?auto_303625 ?auto_303628 ) ) ( not ( = ?auto_303626 ?auto_303627 ) ) ( not ( = ?auto_303626 ?auto_303628 ) ) ( not ( = ?auto_303627 ?auto_303628 ) ) ( ON ?auto_303626 ?auto_303627 ) ( ON ?auto_303625 ?auto_303626 ) ( ON ?auto_303624 ?auto_303625 ) ( CLEAR ?auto_303622 ) ( ON ?auto_303623 ?auto_303624 ) ( CLEAR ?auto_303623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_303615 ?auto_303616 ?auto_303617 ?auto_303618 ?auto_303619 ?auto_303620 ?auto_303621 ?auto_303622 ?auto_303623 )
      ( MAKE-13PILE ?auto_303615 ?auto_303616 ?auto_303617 ?auto_303618 ?auto_303619 ?auto_303620 ?auto_303621 ?auto_303622 ?auto_303623 ?auto_303624 ?auto_303625 ?auto_303626 ?auto_303627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303669 - BLOCK
      ?auto_303670 - BLOCK
      ?auto_303671 - BLOCK
      ?auto_303672 - BLOCK
      ?auto_303673 - BLOCK
      ?auto_303674 - BLOCK
      ?auto_303675 - BLOCK
      ?auto_303676 - BLOCK
      ?auto_303677 - BLOCK
      ?auto_303678 - BLOCK
      ?auto_303679 - BLOCK
      ?auto_303680 - BLOCK
      ?auto_303681 - BLOCK
    )
    :vars
    (
      ?auto_303682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303681 ?auto_303682 ) ( ON-TABLE ?auto_303669 ) ( ON ?auto_303670 ?auto_303669 ) ( ON ?auto_303671 ?auto_303670 ) ( ON ?auto_303672 ?auto_303671 ) ( ON ?auto_303673 ?auto_303672 ) ( ON ?auto_303674 ?auto_303673 ) ( ON ?auto_303675 ?auto_303674 ) ( not ( = ?auto_303669 ?auto_303670 ) ) ( not ( = ?auto_303669 ?auto_303671 ) ) ( not ( = ?auto_303669 ?auto_303672 ) ) ( not ( = ?auto_303669 ?auto_303673 ) ) ( not ( = ?auto_303669 ?auto_303674 ) ) ( not ( = ?auto_303669 ?auto_303675 ) ) ( not ( = ?auto_303669 ?auto_303676 ) ) ( not ( = ?auto_303669 ?auto_303677 ) ) ( not ( = ?auto_303669 ?auto_303678 ) ) ( not ( = ?auto_303669 ?auto_303679 ) ) ( not ( = ?auto_303669 ?auto_303680 ) ) ( not ( = ?auto_303669 ?auto_303681 ) ) ( not ( = ?auto_303669 ?auto_303682 ) ) ( not ( = ?auto_303670 ?auto_303671 ) ) ( not ( = ?auto_303670 ?auto_303672 ) ) ( not ( = ?auto_303670 ?auto_303673 ) ) ( not ( = ?auto_303670 ?auto_303674 ) ) ( not ( = ?auto_303670 ?auto_303675 ) ) ( not ( = ?auto_303670 ?auto_303676 ) ) ( not ( = ?auto_303670 ?auto_303677 ) ) ( not ( = ?auto_303670 ?auto_303678 ) ) ( not ( = ?auto_303670 ?auto_303679 ) ) ( not ( = ?auto_303670 ?auto_303680 ) ) ( not ( = ?auto_303670 ?auto_303681 ) ) ( not ( = ?auto_303670 ?auto_303682 ) ) ( not ( = ?auto_303671 ?auto_303672 ) ) ( not ( = ?auto_303671 ?auto_303673 ) ) ( not ( = ?auto_303671 ?auto_303674 ) ) ( not ( = ?auto_303671 ?auto_303675 ) ) ( not ( = ?auto_303671 ?auto_303676 ) ) ( not ( = ?auto_303671 ?auto_303677 ) ) ( not ( = ?auto_303671 ?auto_303678 ) ) ( not ( = ?auto_303671 ?auto_303679 ) ) ( not ( = ?auto_303671 ?auto_303680 ) ) ( not ( = ?auto_303671 ?auto_303681 ) ) ( not ( = ?auto_303671 ?auto_303682 ) ) ( not ( = ?auto_303672 ?auto_303673 ) ) ( not ( = ?auto_303672 ?auto_303674 ) ) ( not ( = ?auto_303672 ?auto_303675 ) ) ( not ( = ?auto_303672 ?auto_303676 ) ) ( not ( = ?auto_303672 ?auto_303677 ) ) ( not ( = ?auto_303672 ?auto_303678 ) ) ( not ( = ?auto_303672 ?auto_303679 ) ) ( not ( = ?auto_303672 ?auto_303680 ) ) ( not ( = ?auto_303672 ?auto_303681 ) ) ( not ( = ?auto_303672 ?auto_303682 ) ) ( not ( = ?auto_303673 ?auto_303674 ) ) ( not ( = ?auto_303673 ?auto_303675 ) ) ( not ( = ?auto_303673 ?auto_303676 ) ) ( not ( = ?auto_303673 ?auto_303677 ) ) ( not ( = ?auto_303673 ?auto_303678 ) ) ( not ( = ?auto_303673 ?auto_303679 ) ) ( not ( = ?auto_303673 ?auto_303680 ) ) ( not ( = ?auto_303673 ?auto_303681 ) ) ( not ( = ?auto_303673 ?auto_303682 ) ) ( not ( = ?auto_303674 ?auto_303675 ) ) ( not ( = ?auto_303674 ?auto_303676 ) ) ( not ( = ?auto_303674 ?auto_303677 ) ) ( not ( = ?auto_303674 ?auto_303678 ) ) ( not ( = ?auto_303674 ?auto_303679 ) ) ( not ( = ?auto_303674 ?auto_303680 ) ) ( not ( = ?auto_303674 ?auto_303681 ) ) ( not ( = ?auto_303674 ?auto_303682 ) ) ( not ( = ?auto_303675 ?auto_303676 ) ) ( not ( = ?auto_303675 ?auto_303677 ) ) ( not ( = ?auto_303675 ?auto_303678 ) ) ( not ( = ?auto_303675 ?auto_303679 ) ) ( not ( = ?auto_303675 ?auto_303680 ) ) ( not ( = ?auto_303675 ?auto_303681 ) ) ( not ( = ?auto_303675 ?auto_303682 ) ) ( not ( = ?auto_303676 ?auto_303677 ) ) ( not ( = ?auto_303676 ?auto_303678 ) ) ( not ( = ?auto_303676 ?auto_303679 ) ) ( not ( = ?auto_303676 ?auto_303680 ) ) ( not ( = ?auto_303676 ?auto_303681 ) ) ( not ( = ?auto_303676 ?auto_303682 ) ) ( not ( = ?auto_303677 ?auto_303678 ) ) ( not ( = ?auto_303677 ?auto_303679 ) ) ( not ( = ?auto_303677 ?auto_303680 ) ) ( not ( = ?auto_303677 ?auto_303681 ) ) ( not ( = ?auto_303677 ?auto_303682 ) ) ( not ( = ?auto_303678 ?auto_303679 ) ) ( not ( = ?auto_303678 ?auto_303680 ) ) ( not ( = ?auto_303678 ?auto_303681 ) ) ( not ( = ?auto_303678 ?auto_303682 ) ) ( not ( = ?auto_303679 ?auto_303680 ) ) ( not ( = ?auto_303679 ?auto_303681 ) ) ( not ( = ?auto_303679 ?auto_303682 ) ) ( not ( = ?auto_303680 ?auto_303681 ) ) ( not ( = ?auto_303680 ?auto_303682 ) ) ( not ( = ?auto_303681 ?auto_303682 ) ) ( ON ?auto_303680 ?auto_303681 ) ( ON ?auto_303679 ?auto_303680 ) ( ON ?auto_303678 ?auto_303679 ) ( ON ?auto_303677 ?auto_303678 ) ( CLEAR ?auto_303675 ) ( ON ?auto_303676 ?auto_303677 ) ( CLEAR ?auto_303676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_303669 ?auto_303670 ?auto_303671 ?auto_303672 ?auto_303673 ?auto_303674 ?auto_303675 ?auto_303676 )
      ( MAKE-13PILE ?auto_303669 ?auto_303670 ?auto_303671 ?auto_303672 ?auto_303673 ?auto_303674 ?auto_303675 ?auto_303676 ?auto_303677 ?auto_303678 ?auto_303679 ?auto_303680 ?auto_303681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303723 - BLOCK
      ?auto_303724 - BLOCK
      ?auto_303725 - BLOCK
      ?auto_303726 - BLOCK
      ?auto_303727 - BLOCK
      ?auto_303728 - BLOCK
      ?auto_303729 - BLOCK
      ?auto_303730 - BLOCK
      ?auto_303731 - BLOCK
      ?auto_303732 - BLOCK
      ?auto_303733 - BLOCK
      ?auto_303734 - BLOCK
      ?auto_303735 - BLOCK
    )
    :vars
    (
      ?auto_303736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303735 ?auto_303736 ) ( ON-TABLE ?auto_303723 ) ( ON ?auto_303724 ?auto_303723 ) ( ON ?auto_303725 ?auto_303724 ) ( ON ?auto_303726 ?auto_303725 ) ( ON ?auto_303727 ?auto_303726 ) ( ON ?auto_303728 ?auto_303727 ) ( not ( = ?auto_303723 ?auto_303724 ) ) ( not ( = ?auto_303723 ?auto_303725 ) ) ( not ( = ?auto_303723 ?auto_303726 ) ) ( not ( = ?auto_303723 ?auto_303727 ) ) ( not ( = ?auto_303723 ?auto_303728 ) ) ( not ( = ?auto_303723 ?auto_303729 ) ) ( not ( = ?auto_303723 ?auto_303730 ) ) ( not ( = ?auto_303723 ?auto_303731 ) ) ( not ( = ?auto_303723 ?auto_303732 ) ) ( not ( = ?auto_303723 ?auto_303733 ) ) ( not ( = ?auto_303723 ?auto_303734 ) ) ( not ( = ?auto_303723 ?auto_303735 ) ) ( not ( = ?auto_303723 ?auto_303736 ) ) ( not ( = ?auto_303724 ?auto_303725 ) ) ( not ( = ?auto_303724 ?auto_303726 ) ) ( not ( = ?auto_303724 ?auto_303727 ) ) ( not ( = ?auto_303724 ?auto_303728 ) ) ( not ( = ?auto_303724 ?auto_303729 ) ) ( not ( = ?auto_303724 ?auto_303730 ) ) ( not ( = ?auto_303724 ?auto_303731 ) ) ( not ( = ?auto_303724 ?auto_303732 ) ) ( not ( = ?auto_303724 ?auto_303733 ) ) ( not ( = ?auto_303724 ?auto_303734 ) ) ( not ( = ?auto_303724 ?auto_303735 ) ) ( not ( = ?auto_303724 ?auto_303736 ) ) ( not ( = ?auto_303725 ?auto_303726 ) ) ( not ( = ?auto_303725 ?auto_303727 ) ) ( not ( = ?auto_303725 ?auto_303728 ) ) ( not ( = ?auto_303725 ?auto_303729 ) ) ( not ( = ?auto_303725 ?auto_303730 ) ) ( not ( = ?auto_303725 ?auto_303731 ) ) ( not ( = ?auto_303725 ?auto_303732 ) ) ( not ( = ?auto_303725 ?auto_303733 ) ) ( not ( = ?auto_303725 ?auto_303734 ) ) ( not ( = ?auto_303725 ?auto_303735 ) ) ( not ( = ?auto_303725 ?auto_303736 ) ) ( not ( = ?auto_303726 ?auto_303727 ) ) ( not ( = ?auto_303726 ?auto_303728 ) ) ( not ( = ?auto_303726 ?auto_303729 ) ) ( not ( = ?auto_303726 ?auto_303730 ) ) ( not ( = ?auto_303726 ?auto_303731 ) ) ( not ( = ?auto_303726 ?auto_303732 ) ) ( not ( = ?auto_303726 ?auto_303733 ) ) ( not ( = ?auto_303726 ?auto_303734 ) ) ( not ( = ?auto_303726 ?auto_303735 ) ) ( not ( = ?auto_303726 ?auto_303736 ) ) ( not ( = ?auto_303727 ?auto_303728 ) ) ( not ( = ?auto_303727 ?auto_303729 ) ) ( not ( = ?auto_303727 ?auto_303730 ) ) ( not ( = ?auto_303727 ?auto_303731 ) ) ( not ( = ?auto_303727 ?auto_303732 ) ) ( not ( = ?auto_303727 ?auto_303733 ) ) ( not ( = ?auto_303727 ?auto_303734 ) ) ( not ( = ?auto_303727 ?auto_303735 ) ) ( not ( = ?auto_303727 ?auto_303736 ) ) ( not ( = ?auto_303728 ?auto_303729 ) ) ( not ( = ?auto_303728 ?auto_303730 ) ) ( not ( = ?auto_303728 ?auto_303731 ) ) ( not ( = ?auto_303728 ?auto_303732 ) ) ( not ( = ?auto_303728 ?auto_303733 ) ) ( not ( = ?auto_303728 ?auto_303734 ) ) ( not ( = ?auto_303728 ?auto_303735 ) ) ( not ( = ?auto_303728 ?auto_303736 ) ) ( not ( = ?auto_303729 ?auto_303730 ) ) ( not ( = ?auto_303729 ?auto_303731 ) ) ( not ( = ?auto_303729 ?auto_303732 ) ) ( not ( = ?auto_303729 ?auto_303733 ) ) ( not ( = ?auto_303729 ?auto_303734 ) ) ( not ( = ?auto_303729 ?auto_303735 ) ) ( not ( = ?auto_303729 ?auto_303736 ) ) ( not ( = ?auto_303730 ?auto_303731 ) ) ( not ( = ?auto_303730 ?auto_303732 ) ) ( not ( = ?auto_303730 ?auto_303733 ) ) ( not ( = ?auto_303730 ?auto_303734 ) ) ( not ( = ?auto_303730 ?auto_303735 ) ) ( not ( = ?auto_303730 ?auto_303736 ) ) ( not ( = ?auto_303731 ?auto_303732 ) ) ( not ( = ?auto_303731 ?auto_303733 ) ) ( not ( = ?auto_303731 ?auto_303734 ) ) ( not ( = ?auto_303731 ?auto_303735 ) ) ( not ( = ?auto_303731 ?auto_303736 ) ) ( not ( = ?auto_303732 ?auto_303733 ) ) ( not ( = ?auto_303732 ?auto_303734 ) ) ( not ( = ?auto_303732 ?auto_303735 ) ) ( not ( = ?auto_303732 ?auto_303736 ) ) ( not ( = ?auto_303733 ?auto_303734 ) ) ( not ( = ?auto_303733 ?auto_303735 ) ) ( not ( = ?auto_303733 ?auto_303736 ) ) ( not ( = ?auto_303734 ?auto_303735 ) ) ( not ( = ?auto_303734 ?auto_303736 ) ) ( not ( = ?auto_303735 ?auto_303736 ) ) ( ON ?auto_303734 ?auto_303735 ) ( ON ?auto_303733 ?auto_303734 ) ( ON ?auto_303732 ?auto_303733 ) ( ON ?auto_303731 ?auto_303732 ) ( ON ?auto_303730 ?auto_303731 ) ( CLEAR ?auto_303728 ) ( ON ?auto_303729 ?auto_303730 ) ( CLEAR ?auto_303729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_303723 ?auto_303724 ?auto_303725 ?auto_303726 ?auto_303727 ?auto_303728 ?auto_303729 )
      ( MAKE-13PILE ?auto_303723 ?auto_303724 ?auto_303725 ?auto_303726 ?auto_303727 ?auto_303728 ?auto_303729 ?auto_303730 ?auto_303731 ?auto_303732 ?auto_303733 ?auto_303734 ?auto_303735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303777 - BLOCK
      ?auto_303778 - BLOCK
      ?auto_303779 - BLOCK
      ?auto_303780 - BLOCK
      ?auto_303781 - BLOCK
      ?auto_303782 - BLOCK
      ?auto_303783 - BLOCK
      ?auto_303784 - BLOCK
      ?auto_303785 - BLOCK
      ?auto_303786 - BLOCK
      ?auto_303787 - BLOCK
      ?auto_303788 - BLOCK
      ?auto_303789 - BLOCK
    )
    :vars
    (
      ?auto_303790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303789 ?auto_303790 ) ( ON-TABLE ?auto_303777 ) ( ON ?auto_303778 ?auto_303777 ) ( ON ?auto_303779 ?auto_303778 ) ( ON ?auto_303780 ?auto_303779 ) ( ON ?auto_303781 ?auto_303780 ) ( not ( = ?auto_303777 ?auto_303778 ) ) ( not ( = ?auto_303777 ?auto_303779 ) ) ( not ( = ?auto_303777 ?auto_303780 ) ) ( not ( = ?auto_303777 ?auto_303781 ) ) ( not ( = ?auto_303777 ?auto_303782 ) ) ( not ( = ?auto_303777 ?auto_303783 ) ) ( not ( = ?auto_303777 ?auto_303784 ) ) ( not ( = ?auto_303777 ?auto_303785 ) ) ( not ( = ?auto_303777 ?auto_303786 ) ) ( not ( = ?auto_303777 ?auto_303787 ) ) ( not ( = ?auto_303777 ?auto_303788 ) ) ( not ( = ?auto_303777 ?auto_303789 ) ) ( not ( = ?auto_303777 ?auto_303790 ) ) ( not ( = ?auto_303778 ?auto_303779 ) ) ( not ( = ?auto_303778 ?auto_303780 ) ) ( not ( = ?auto_303778 ?auto_303781 ) ) ( not ( = ?auto_303778 ?auto_303782 ) ) ( not ( = ?auto_303778 ?auto_303783 ) ) ( not ( = ?auto_303778 ?auto_303784 ) ) ( not ( = ?auto_303778 ?auto_303785 ) ) ( not ( = ?auto_303778 ?auto_303786 ) ) ( not ( = ?auto_303778 ?auto_303787 ) ) ( not ( = ?auto_303778 ?auto_303788 ) ) ( not ( = ?auto_303778 ?auto_303789 ) ) ( not ( = ?auto_303778 ?auto_303790 ) ) ( not ( = ?auto_303779 ?auto_303780 ) ) ( not ( = ?auto_303779 ?auto_303781 ) ) ( not ( = ?auto_303779 ?auto_303782 ) ) ( not ( = ?auto_303779 ?auto_303783 ) ) ( not ( = ?auto_303779 ?auto_303784 ) ) ( not ( = ?auto_303779 ?auto_303785 ) ) ( not ( = ?auto_303779 ?auto_303786 ) ) ( not ( = ?auto_303779 ?auto_303787 ) ) ( not ( = ?auto_303779 ?auto_303788 ) ) ( not ( = ?auto_303779 ?auto_303789 ) ) ( not ( = ?auto_303779 ?auto_303790 ) ) ( not ( = ?auto_303780 ?auto_303781 ) ) ( not ( = ?auto_303780 ?auto_303782 ) ) ( not ( = ?auto_303780 ?auto_303783 ) ) ( not ( = ?auto_303780 ?auto_303784 ) ) ( not ( = ?auto_303780 ?auto_303785 ) ) ( not ( = ?auto_303780 ?auto_303786 ) ) ( not ( = ?auto_303780 ?auto_303787 ) ) ( not ( = ?auto_303780 ?auto_303788 ) ) ( not ( = ?auto_303780 ?auto_303789 ) ) ( not ( = ?auto_303780 ?auto_303790 ) ) ( not ( = ?auto_303781 ?auto_303782 ) ) ( not ( = ?auto_303781 ?auto_303783 ) ) ( not ( = ?auto_303781 ?auto_303784 ) ) ( not ( = ?auto_303781 ?auto_303785 ) ) ( not ( = ?auto_303781 ?auto_303786 ) ) ( not ( = ?auto_303781 ?auto_303787 ) ) ( not ( = ?auto_303781 ?auto_303788 ) ) ( not ( = ?auto_303781 ?auto_303789 ) ) ( not ( = ?auto_303781 ?auto_303790 ) ) ( not ( = ?auto_303782 ?auto_303783 ) ) ( not ( = ?auto_303782 ?auto_303784 ) ) ( not ( = ?auto_303782 ?auto_303785 ) ) ( not ( = ?auto_303782 ?auto_303786 ) ) ( not ( = ?auto_303782 ?auto_303787 ) ) ( not ( = ?auto_303782 ?auto_303788 ) ) ( not ( = ?auto_303782 ?auto_303789 ) ) ( not ( = ?auto_303782 ?auto_303790 ) ) ( not ( = ?auto_303783 ?auto_303784 ) ) ( not ( = ?auto_303783 ?auto_303785 ) ) ( not ( = ?auto_303783 ?auto_303786 ) ) ( not ( = ?auto_303783 ?auto_303787 ) ) ( not ( = ?auto_303783 ?auto_303788 ) ) ( not ( = ?auto_303783 ?auto_303789 ) ) ( not ( = ?auto_303783 ?auto_303790 ) ) ( not ( = ?auto_303784 ?auto_303785 ) ) ( not ( = ?auto_303784 ?auto_303786 ) ) ( not ( = ?auto_303784 ?auto_303787 ) ) ( not ( = ?auto_303784 ?auto_303788 ) ) ( not ( = ?auto_303784 ?auto_303789 ) ) ( not ( = ?auto_303784 ?auto_303790 ) ) ( not ( = ?auto_303785 ?auto_303786 ) ) ( not ( = ?auto_303785 ?auto_303787 ) ) ( not ( = ?auto_303785 ?auto_303788 ) ) ( not ( = ?auto_303785 ?auto_303789 ) ) ( not ( = ?auto_303785 ?auto_303790 ) ) ( not ( = ?auto_303786 ?auto_303787 ) ) ( not ( = ?auto_303786 ?auto_303788 ) ) ( not ( = ?auto_303786 ?auto_303789 ) ) ( not ( = ?auto_303786 ?auto_303790 ) ) ( not ( = ?auto_303787 ?auto_303788 ) ) ( not ( = ?auto_303787 ?auto_303789 ) ) ( not ( = ?auto_303787 ?auto_303790 ) ) ( not ( = ?auto_303788 ?auto_303789 ) ) ( not ( = ?auto_303788 ?auto_303790 ) ) ( not ( = ?auto_303789 ?auto_303790 ) ) ( ON ?auto_303788 ?auto_303789 ) ( ON ?auto_303787 ?auto_303788 ) ( ON ?auto_303786 ?auto_303787 ) ( ON ?auto_303785 ?auto_303786 ) ( ON ?auto_303784 ?auto_303785 ) ( ON ?auto_303783 ?auto_303784 ) ( CLEAR ?auto_303781 ) ( ON ?auto_303782 ?auto_303783 ) ( CLEAR ?auto_303782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_303777 ?auto_303778 ?auto_303779 ?auto_303780 ?auto_303781 ?auto_303782 )
      ( MAKE-13PILE ?auto_303777 ?auto_303778 ?auto_303779 ?auto_303780 ?auto_303781 ?auto_303782 ?auto_303783 ?auto_303784 ?auto_303785 ?auto_303786 ?auto_303787 ?auto_303788 ?auto_303789 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303831 - BLOCK
      ?auto_303832 - BLOCK
      ?auto_303833 - BLOCK
      ?auto_303834 - BLOCK
      ?auto_303835 - BLOCK
      ?auto_303836 - BLOCK
      ?auto_303837 - BLOCK
      ?auto_303838 - BLOCK
      ?auto_303839 - BLOCK
      ?auto_303840 - BLOCK
      ?auto_303841 - BLOCK
      ?auto_303842 - BLOCK
      ?auto_303843 - BLOCK
    )
    :vars
    (
      ?auto_303844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303843 ?auto_303844 ) ( ON-TABLE ?auto_303831 ) ( ON ?auto_303832 ?auto_303831 ) ( ON ?auto_303833 ?auto_303832 ) ( ON ?auto_303834 ?auto_303833 ) ( not ( = ?auto_303831 ?auto_303832 ) ) ( not ( = ?auto_303831 ?auto_303833 ) ) ( not ( = ?auto_303831 ?auto_303834 ) ) ( not ( = ?auto_303831 ?auto_303835 ) ) ( not ( = ?auto_303831 ?auto_303836 ) ) ( not ( = ?auto_303831 ?auto_303837 ) ) ( not ( = ?auto_303831 ?auto_303838 ) ) ( not ( = ?auto_303831 ?auto_303839 ) ) ( not ( = ?auto_303831 ?auto_303840 ) ) ( not ( = ?auto_303831 ?auto_303841 ) ) ( not ( = ?auto_303831 ?auto_303842 ) ) ( not ( = ?auto_303831 ?auto_303843 ) ) ( not ( = ?auto_303831 ?auto_303844 ) ) ( not ( = ?auto_303832 ?auto_303833 ) ) ( not ( = ?auto_303832 ?auto_303834 ) ) ( not ( = ?auto_303832 ?auto_303835 ) ) ( not ( = ?auto_303832 ?auto_303836 ) ) ( not ( = ?auto_303832 ?auto_303837 ) ) ( not ( = ?auto_303832 ?auto_303838 ) ) ( not ( = ?auto_303832 ?auto_303839 ) ) ( not ( = ?auto_303832 ?auto_303840 ) ) ( not ( = ?auto_303832 ?auto_303841 ) ) ( not ( = ?auto_303832 ?auto_303842 ) ) ( not ( = ?auto_303832 ?auto_303843 ) ) ( not ( = ?auto_303832 ?auto_303844 ) ) ( not ( = ?auto_303833 ?auto_303834 ) ) ( not ( = ?auto_303833 ?auto_303835 ) ) ( not ( = ?auto_303833 ?auto_303836 ) ) ( not ( = ?auto_303833 ?auto_303837 ) ) ( not ( = ?auto_303833 ?auto_303838 ) ) ( not ( = ?auto_303833 ?auto_303839 ) ) ( not ( = ?auto_303833 ?auto_303840 ) ) ( not ( = ?auto_303833 ?auto_303841 ) ) ( not ( = ?auto_303833 ?auto_303842 ) ) ( not ( = ?auto_303833 ?auto_303843 ) ) ( not ( = ?auto_303833 ?auto_303844 ) ) ( not ( = ?auto_303834 ?auto_303835 ) ) ( not ( = ?auto_303834 ?auto_303836 ) ) ( not ( = ?auto_303834 ?auto_303837 ) ) ( not ( = ?auto_303834 ?auto_303838 ) ) ( not ( = ?auto_303834 ?auto_303839 ) ) ( not ( = ?auto_303834 ?auto_303840 ) ) ( not ( = ?auto_303834 ?auto_303841 ) ) ( not ( = ?auto_303834 ?auto_303842 ) ) ( not ( = ?auto_303834 ?auto_303843 ) ) ( not ( = ?auto_303834 ?auto_303844 ) ) ( not ( = ?auto_303835 ?auto_303836 ) ) ( not ( = ?auto_303835 ?auto_303837 ) ) ( not ( = ?auto_303835 ?auto_303838 ) ) ( not ( = ?auto_303835 ?auto_303839 ) ) ( not ( = ?auto_303835 ?auto_303840 ) ) ( not ( = ?auto_303835 ?auto_303841 ) ) ( not ( = ?auto_303835 ?auto_303842 ) ) ( not ( = ?auto_303835 ?auto_303843 ) ) ( not ( = ?auto_303835 ?auto_303844 ) ) ( not ( = ?auto_303836 ?auto_303837 ) ) ( not ( = ?auto_303836 ?auto_303838 ) ) ( not ( = ?auto_303836 ?auto_303839 ) ) ( not ( = ?auto_303836 ?auto_303840 ) ) ( not ( = ?auto_303836 ?auto_303841 ) ) ( not ( = ?auto_303836 ?auto_303842 ) ) ( not ( = ?auto_303836 ?auto_303843 ) ) ( not ( = ?auto_303836 ?auto_303844 ) ) ( not ( = ?auto_303837 ?auto_303838 ) ) ( not ( = ?auto_303837 ?auto_303839 ) ) ( not ( = ?auto_303837 ?auto_303840 ) ) ( not ( = ?auto_303837 ?auto_303841 ) ) ( not ( = ?auto_303837 ?auto_303842 ) ) ( not ( = ?auto_303837 ?auto_303843 ) ) ( not ( = ?auto_303837 ?auto_303844 ) ) ( not ( = ?auto_303838 ?auto_303839 ) ) ( not ( = ?auto_303838 ?auto_303840 ) ) ( not ( = ?auto_303838 ?auto_303841 ) ) ( not ( = ?auto_303838 ?auto_303842 ) ) ( not ( = ?auto_303838 ?auto_303843 ) ) ( not ( = ?auto_303838 ?auto_303844 ) ) ( not ( = ?auto_303839 ?auto_303840 ) ) ( not ( = ?auto_303839 ?auto_303841 ) ) ( not ( = ?auto_303839 ?auto_303842 ) ) ( not ( = ?auto_303839 ?auto_303843 ) ) ( not ( = ?auto_303839 ?auto_303844 ) ) ( not ( = ?auto_303840 ?auto_303841 ) ) ( not ( = ?auto_303840 ?auto_303842 ) ) ( not ( = ?auto_303840 ?auto_303843 ) ) ( not ( = ?auto_303840 ?auto_303844 ) ) ( not ( = ?auto_303841 ?auto_303842 ) ) ( not ( = ?auto_303841 ?auto_303843 ) ) ( not ( = ?auto_303841 ?auto_303844 ) ) ( not ( = ?auto_303842 ?auto_303843 ) ) ( not ( = ?auto_303842 ?auto_303844 ) ) ( not ( = ?auto_303843 ?auto_303844 ) ) ( ON ?auto_303842 ?auto_303843 ) ( ON ?auto_303841 ?auto_303842 ) ( ON ?auto_303840 ?auto_303841 ) ( ON ?auto_303839 ?auto_303840 ) ( ON ?auto_303838 ?auto_303839 ) ( ON ?auto_303837 ?auto_303838 ) ( ON ?auto_303836 ?auto_303837 ) ( CLEAR ?auto_303834 ) ( ON ?auto_303835 ?auto_303836 ) ( CLEAR ?auto_303835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_303831 ?auto_303832 ?auto_303833 ?auto_303834 ?auto_303835 )
      ( MAKE-13PILE ?auto_303831 ?auto_303832 ?auto_303833 ?auto_303834 ?auto_303835 ?auto_303836 ?auto_303837 ?auto_303838 ?auto_303839 ?auto_303840 ?auto_303841 ?auto_303842 ?auto_303843 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303885 - BLOCK
      ?auto_303886 - BLOCK
      ?auto_303887 - BLOCK
      ?auto_303888 - BLOCK
      ?auto_303889 - BLOCK
      ?auto_303890 - BLOCK
      ?auto_303891 - BLOCK
      ?auto_303892 - BLOCK
      ?auto_303893 - BLOCK
      ?auto_303894 - BLOCK
      ?auto_303895 - BLOCK
      ?auto_303896 - BLOCK
      ?auto_303897 - BLOCK
    )
    :vars
    (
      ?auto_303898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303897 ?auto_303898 ) ( ON-TABLE ?auto_303885 ) ( ON ?auto_303886 ?auto_303885 ) ( ON ?auto_303887 ?auto_303886 ) ( not ( = ?auto_303885 ?auto_303886 ) ) ( not ( = ?auto_303885 ?auto_303887 ) ) ( not ( = ?auto_303885 ?auto_303888 ) ) ( not ( = ?auto_303885 ?auto_303889 ) ) ( not ( = ?auto_303885 ?auto_303890 ) ) ( not ( = ?auto_303885 ?auto_303891 ) ) ( not ( = ?auto_303885 ?auto_303892 ) ) ( not ( = ?auto_303885 ?auto_303893 ) ) ( not ( = ?auto_303885 ?auto_303894 ) ) ( not ( = ?auto_303885 ?auto_303895 ) ) ( not ( = ?auto_303885 ?auto_303896 ) ) ( not ( = ?auto_303885 ?auto_303897 ) ) ( not ( = ?auto_303885 ?auto_303898 ) ) ( not ( = ?auto_303886 ?auto_303887 ) ) ( not ( = ?auto_303886 ?auto_303888 ) ) ( not ( = ?auto_303886 ?auto_303889 ) ) ( not ( = ?auto_303886 ?auto_303890 ) ) ( not ( = ?auto_303886 ?auto_303891 ) ) ( not ( = ?auto_303886 ?auto_303892 ) ) ( not ( = ?auto_303886 ?auto_303893 ) ) ( not ( = ?auto_303886 ?auto_303894 ) ) ( not ( = ?auto_303886 ?auto_303895 ) ) ( not ( = ?auto_303886 ?auto_303896 ) ) ( not ( = ?auto_303886 ?auto_303897 ) ) ( not ( = ?auto_303886 ?auto_303898 ) ) ( not ( = ?auto_303887 ?auto_303888 ) ) ( not ( = ?auto_303887 ?auto_303889 ) ) ( not ( = ?auto_303887 ?auto_303890 ) ) ( not ( = ?auto_303887 ?auto_303891 ) ) ( not ( = ?auto_303887 ?auto_303892 ) ) ( not ( = ?auto_303887 ?auto_303893 ) ) ( not ( = ?auto_303887 ?auto_303894 ) ) ( not ( = ?auto_303887 ?auto_303895 ) ) ( not ( = ?auto_303887 ?auto_303896 ) ) ( not ( = ?auto_303887 ?auto_303897 ) ) ( not ( = ?auto_303887 ?auto_303898 ) ) ( not ( = ?auto_303888 ?auto_303889 ) ) ( not ( = ?auto_303888 ?auto_303890 ) ) ( not ( = ?auto_303888 ?auto_303891 ) ) ( not ( = ?auto_303888 ?auto_303892 ) ) ( not ( = ?auto_303888 ?auto_303893 ) ) ( not ( = ?auto_303888 ?auto_303894 ) ) ( not ( = ?auto_303888 ?auto_303895 ) ) ( not ( = ?auto_303888 ?auto_303896 ) ) ( not ( = ?auto_303888 ?auto_303897 ) ) ( not ( = ?auto_303888 ?auto_303898 ) ) ( not ( = ?auto_303889 ?auto_303890 ) ) ( not ( = ?auto_303889 ?auto_303891 ) ) ( not ( = ?auto_303889 ?auto_303892 ) ) ( not ( = ?auto_303889 ?auto_303893 ) ) ( not ( = ?auto_303889 ?auto_303894 ) ) ( not ( = ?auto_303889 ?auto_303895 ) ) ( not ( = ?auto_303889 ?auto_303896 ) ) ( not ( = ?auto_303889 ?auto_303897 ) ) ( not ( = ?auto_303889 ?auto_303898 ) ) ( not ( = ?auto_303890 ?auto_303891 ) ) ( not ( = ?auto_303890 ?auto_303892 ) ) ( not ( = ?auto_303890 ?auto_303893 ) ) ( not ( = ?auto_303890 ?auto_303894 ) ) ( not ( = ?auto_303890 ?auto_303895 ) ) ( not ( = ?auto_303890 ?auto_303896 ) ) ( not ( = ?auto_303890 ?auto_303897 ) ) ( not ( = ?auto_303890 ?auto_303898 ) ) ( not ( = ?auto_303891 ?auto_303892 ) ) ( not ( = ?auto_303891 ?auto_303893 ) ) ( not ( = ?auto_303891 ?auto_303894 ) ) ( not ( = ?auto_303891 ?auto_303895 ) ) ( not ( = ?auto_303891 ?auto_303896 ) ) ( not ( = ?auto_303891 ?auto_303897 ) ) ( not ( = ?auto_303891 ?auto_303898 ) ) ( not ( = ?auto_303892 ?auto_303893 ) ) ( not ( = ?auto_303892 ?auto_303894 ) ) ( not ( = ?auto_303892 ?auto_303895 ) ) ( not ( = ?auto_303892 ?auto_303896 ) ) ( not ( = ?auto_303892 ?auto_303897 ) ) ( not ( = ?auto_303892 ?auto_303898 ) ) ( not ( = ?auto_303893 ?auto_303894 ) ) ( not ( = ?auto_303893 ?auto_303895 ) ) ( not ( = ?auto_303893 ?auto_303896 ) ) ( not ( = ?auto_303893 ?auto_303897 ) ) ( not ( = ?auto_303893 ?auto_303898 ) ) ( not ( = ?auto_303894 ?auto_303895 ) ) ( not ( = ?auto_303894 ?auto_303896 ) ) ( not ( = ?auto_303894 ?auto_303897 ) ) ( not ( = ?auto_303894 ?auto_303898 ) ) ( not ( = ?auto_303895 ?auto_303896 ) ) ( not ( = ?auto_303895 ?auto_303897 ) ) ( not ( = ?auto_303895 ?auto_303898 ) ) ( not ( = ?auto_303896 ?auto_303897 ) ) ( not ( = ?auto_303896 ?auto_303898 ) ) ( not ( = ?auto_303897 ?auto_303898 ) ) ( ON ?auto_303896 ?auto_303897 ) ( ON ?auto_303895 ?auto_303896 ) ( ON ?auto_303894 ?auto_303895 ) ( ON ?auto_303893 ?auto_303894 ) ( ON ?auto_303892 ?auto_303893 ) ( ON ?auto_303891 ?auto_303892 ) ( ON ?auto_303890 ?auto_303891 ) ( ON ?auto_303889 ?auto_303890 ) ( CLEAR ?auto_303887 ) ( ON ?auto_303888 ?auto_303889 ) ( CLEAR ?auto_303888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_303885 ?auto_303886 ?auto_303887 ?auto_303888 )
      ( MAKE-13PILE ?auto_303885 ?auto_303886 ?auto_303887 ?auto_303888 ?auto_303889 ?auto_303890 ?auto_303891 ?auto_303892 ?auto_303893 ?auto_303894 ?auto_303895 ?auto_303896 ?auto_303897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303939 - BLOCK
      ?auto_303940 - BLOCK
      ?auto_303941 - BLOCK
      ?auto_303942 - BLOCK
      ?auto_303943 - BLOCK
      ?auto_303944 - BLOCK
      ?auto_303945 - BLOCK
      ?auto_303946 - BLOCK
      ?auto_303947 - BLOCK
      ?auto_303948 - BLOCK
      ?auto_303949 - BLOCK
      ?auto_303950 - BLOCK
      ?auto_303951 - BLOCK
    )
    :vars
    (
      ?auto_303952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303951 ?auto_303952 ) ( ON-TABLE ?auto_303939 ) ( ON ?auto_303940 ?auto_303939 ) ( not ( = ?auto_303939 ?auto_303940 ) ) ( not ( = ?auto_303939 ?auto_303941 ) ) ( not ( = ?auto_303939 ?auto_303942 ) ) ( not ( = ?auto_303939 ?auto_303943 ) ) ( not ( = ?auto_303939 ?auto_303944 ) ) ( not ( = ?auto_303939 ?auto_303945 ) ) ( not ( = ?auto_303939 ?auto_303946 ) ) ( not ( = ?auto_303939 ?auto_303947 ) ) ( not ( = ?auto_303939 ?auto_303948 ) ) ( not ( = ?auto_303939 ?auto_303949 ) ) ( not ( = ?auto_303939 ?auto_303950 ) ) ( not ( = ?auto_303939 ?auto_303951 ) ) ( not ( = ?auto_303939 ?auto_303952 ) ) ( not ( = ?auto_303940 ?auto_303941 ) ) ( not ( = ?auto_303940 ?auto_303942 ) ) ( not ( = ?auto_303940 ?auto_303943 ) ) ( not ( = ?auto_303940 ?auto_303944 ) ) ( not ( = ?auto_303940 ?auto_303945 ) ) ( not ( = ?auto_303940 ?auto_303946 ) ) ( not ( = ?auto_303940 ?auto_303947 ) ) ( not ( = ?auto_303940 ?auto_303948 ) ) ( not ( = ?auto_303940 ?auto_303949 ) ) ( not ( = ?auto_303940 ?auto_303950 ) ) ( not ( = ?auto_303940 ?auto_303951 ) ) ( not ( = ?auto_303940 ?auto_303952 ) ) ( not ( = ?auto_303941 ?auto_303942 ) ) ( not ( = ?auto_303941 ?auto_303943 ) ) ( not ( = ?auto_303941 ?auto_303944 ) ) ( not ( = ?auto_303941 ?auto_303945 ) ) ( not ( = ?auto_303941 ?auto_303946 ) ) ( not ( = ?auto_303941 ?auto_303947 ) ) ( not ( = ?auto_303941 ?auto_303948 ) ) ( not ( = ?auto_303941 ?auto_303949 ) ) ( not ( = ?auto_303941 ?auto_303950 ) ) ( not ( = ?auto_303941 ?auto_303951 ) ) ( not ( = ?auto_303941 ?auto_303952 ) ) ( not ( = ?auto_303942 ?auto_303943 ) ) ( not ( = ?auto_303942 ?auto_303944 ) ) ( not ( = ?auto_303942 ?auto_303945 ) ) ( not ( = ?auto_303942 ?auto_303946 ) ) ( not ( = ?auto_303942 ?auto_303947 ) ) ( not ( = ?auto_303942 ?auto_303948 ) ) ( not ( = ?auto_303942 ?auto_303949 ) ) ( not ( = ?auto_303942 ?auto_303950 ) ) ( not ( = ?auto_303942 ?auto_303951 ) ) ( not ( = ?auto_303942 ?auto_303952 ) ) ( not ( = ?auto_303943 ?auto_303944 ) ) ( not ( = ?auto_303943 ?auto_303945 ) ) ( not ( = ?auto_303943 ?auto_303946 ) ) ( not ( = ?auto_303943 ?auto_303947 ) ) ( not ( = ?auto_303943 ?auto_303948 ) ) ( not ( = ?auto_303943 ?auto_303949 ) ) ( not ( = ?auto_303943 ?auto_303950 ) ) ( not ( = ?auto_303943 ?auto_303951 ) ) ( not ( = ?auto_303943 ?auto_303952 ) ) ( not ( = ?auto_303944 ?auto_303945 ) ) ( not ( = ?auto_303944 ?auto_303946 ) ) ( not ( = ?auto_303944 ?auto_303947 ) ) ( not ( = ?auto_303944 ?auto_303948 ) ) ( not ( = ?auto_303944 ?auto_303949 ) ) ( not ( = ?auto_303944 ?auto_303950 ) ) ( not ( = ?auto_303944 ?auto_303951 ) ) ( not ( = ?auto_303944 ?auto_303952 ) ) ( not ( = ?auto_303945 ?auto_303946 ) ) ( not ( = ?auto_303945 ?auto_303947 ) ) ( not ( = ?auto_303945 ?auto_303948 ) ) ( not ( = ?auto_303945 ?auto_303949 ) ) ( not ( = ?auto_303945 ?auto_303950 ) ) ( not ( = ?auto_303945 ?auto_303951 ) ) ( not ( = ?auto_303945 ?auto_303952 ) ) ( not ( = ?auto_303946 ?auto_303947 ) ) ( not ( = ?auto_303946 ?auto_303948 ) ) ( not ( = ?auto_303946 ?auto_303949 ) ) ( not ( = ?auto_303946 ?auto_303950 ) ) ( not ( = ?auto_303946 ?auto_303951 ) ) ( not ( = ?auto_303946 ?auto_303952 ) ) ( not ( = ?auto_303947 ?auto_303948 ) ) ( not ( = ?auto_303947 ?auto_303949 ) ) ( not ( = ?auto_303947 ?auto_303950 ) ) ( not ( = ?auto_303947 ?auto_303951 ) ) ( not ( = ?auto_303947 ?auto_303952 ) ) ( not ( = ?auto_303948 ?auto_303949 ) ) ( not ( = ?auto_303948 ?auto_303950 ) ) ( not ( = ?auto_303948 ?auto_303951 ) ) ( not ( = ?auto_303948 ?auto_303952 ) ) ( not ( = ?auto_303949 ?auto_303950 ) ) ( not ( = ?auto_303949 ?auto_303951 ) ) ( not ( = ?auto_303949 ?auto_303952 ) ) ( not ( = ?auto_303950 ?auto_303951 ) ) ( not ( = ?auto_303950 ?auto_303952 ) ) ( not ( = ?auto_303951 ?auto_303952 ) ) ( ON ?auto_303950 ?auto_303951 ) ( ON ?auto_303949 ?auto_303950 ) ( ON ?auto_303948 ?auto_303949 ) ( ON ?auto_303947 ?auto_303948 ) ( ON ?auto_303946 ?auto_303947 ) ( ON ?auto_303945 ?auto_303946 ) ( ON ?auto_303944 ?auto_303945 ) ( ON ?auto_303943 ?auto_303944 ) ( ON ?auto_303942 ?auto_303943 ) ( CLEAR ?auto_303940 ) ( ON ?auto_303941 ?auto_303942 ) ( CLEAR ?auto_303941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_303939 ?auto_303940 ?auto_303941 )
      ( MAKE-13PILE ?auto_303939 ?auto_303940 ?auto_303941 ?auto_303942 ?auto_303943 ?auto_303944 ?auto_303945 ?auto_303946 ?auto_303947 ?auto_303948 ?auto_303949 ?auto_303950 ?auto_303951 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_303993 - BLOCK
      ?auto_303994 - BLOCK
      ?auto_303995 - BLOCK
      ?auto_303996 - BLOCK
      ?auto_303997 - BLOCK
      ?auto_303998 - BLOCK
      ?auto_303999 - BLOCK
      ?auto_304000 - BLOCK
      ?auto_304001 - BLOCK
      ?auto_304002 - BLOCK
      ?auto_304003 - BLOCK
      ?auto_304004 - BLOCK
      ?auto_304005 - BLOCK
    )
    :vars
    (
      ?auto_304006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304005 ?auto_304006 ) ( ON-TABLE ?auto_303993 ) ( not ( = ?auto_303993 ?auto_303994 ) ) ( not ( = ?auto_303993 ?auto_303995 ) ) ( not ( = ?auto_303993 ?auto_303996 ) ) ( not ( = ?auto_303993 ?auto_303997 ) ) ( not ( = ?auto_303993 ?auto_303998 ) ) ( not ( = ?auto_303993 ?auto_303999 ) ) ( not ( = ?auto_303993 ?auto_304000 ) ) ( not ( = ?auto_303993 ?auto_304001 ) ) ( not ( = ?auto_303993 ?auto_304002 ) ) ( not ( = ?auto_303993 ?auto_304003 ) ) ( not ( = ?auto_303993 ?auto_304004 ) ) ( not ( = ?auto_303993 ?auto_304005 ) ) ( not ( = ?auto_303993 ?auto_304006 ) ) ( not ( = ?auto_303994 ?auto_303995 ) ) ( not ( = ?auto_303994 ?auto_303996 ) ) ( not ( = ?auto_303994 ?auto_303997 ) ) ( not ( = ?auto_303994 ?auto_303998 ) ) ( not ( = ?auto_303994 ?auto_303999 ) ) ( not ( = ?auto_303994 ?auto_304000 ) ) ( not ( = ?auto_303994 ?auto_304001 ) ) ( not ( = ?auto_303994 ?auto_304002 ) ) ( not ( = ?auto_303994 ?auto_304003 ) ) ( not ( = ?auto_303994 ?auto_304004 ) ) ( not ( = ?auto_303994 ?auto_304005 ) ) ( not ( = ?auto_303994 ?auto_304006 ) ) ( not ( = ?auto_303995 ?auto_303996 ) ) ( not ( = ?auto_303995 ?auto_303997 ) ) ( not ( = ?auto_303995 ?auto_303998 ) ) ( not ( = ?auto_303995 ?auto_303999 ) ) ( not ( = ?auto_303995 ?auto_304000 ) ) ( not ( = ?auto_303995 ?auto_304001 ) ) ( not ( = ?auto_303995 ?auto_304002 ) ) ( not ( = ?auto_303995 ?auto_304003 ) ) ( not ( = ?auto_303995 ?auto_304004 ) ) ( not ( = ?auto_303995 ?auto_304005 ) ) ( not ( = ?auto_303995 ?auto_304006 ) ) ( not ( = ?auto_303996 ?auto_303997 ) ) ( not ( = ?auto_303996 ?auto_303998 ) ) ( not ( = ?auto_303996 ?auto_303999 ) ) ( not ( = ?auto_303996 ?auto_304000 ) ) ( not ( = ?auto_303996 ?auto_304001 ) ) ( not ( = ?auto_303996 ?auto_304002 ) ) ( not ( = ?auto_303996 ?auto_304003 ) ) ( not ( = ?auto_303996 ?auto_304004 ) ) ( not ( = ?auto_303996 ?auto_304005 ) ) ( not ( = ?auto_303996 ?auto_304006 ) ) ( not ( = ?auto_303997 ?auto_303998 ) ) ( not ( = ?auto_303997 ?auto_303999 ) ) ( not ( = ?auto_303997 ?auto_304000 ) ) ( not ( = ?auto_303997 ?auto_304001 ) ) ( not ( = ?auto_303997 ?auto_304002 ) ) ( not ( = ?auto_303997 ?auto_304003 ) ) ( not ( = ?auto_303997 ?auto_304004 ) ) ( not ( = ?auto_303997 ?auto_304005 ) ) ( not ( = ?auto_303997 ?auto_304006 ) ) ( not ( = ?auto_303998 ?auto_303999 ) ) ( not ( = ?auto_303998 ?auto_304000 ) ) ( not ( = ?auto_303998 ?auto_304001 ) ) ( not ( = ?auto_303998 ?auto_304002 ) ) ( not ( = ?auto_303998 ?auto_304003 ) ) ( not ( = ?auto_303998 ?auto_304004 ) ) ( not ( = ?auto_303998 ?auto_304005 ) ) ( not ( = ?auto_303998 ?auto_304006 ) ) ( not ( = ?auto_303999 ?auto_304000 ) ) ( not ( = ?auto_303999 ?auto_304001 ) ) ( not ( = ?auto_303999 ?auto_304002 ) ) ( not ( = ?auto_303999 ?auto_304003 ) ) ( not ( = ?auto_303999 ?auto_304004 ) ) ( not ( = ?auto_303999 ?auto_304005 ) ) ( not ( = ?auto_303999 ?auto_304006 ) ) ( not ( = ?auto_304000 ?auto_304001 ) ) ( not ( = ?auto_304000 ?auto_304002 ) ) ( not ( = ?auto_304000 ?auto_304003 ) ) ( not ( = ?auto_304000 ?auto_304004 ) ) ( not ( = ?auto_304000 ?auto_304005 ) ) ( not ( = ?auto_304000 ?auto_304006 ) ) ( not ( = ?auto_304001 ?auto_304002 ) ) ( not ( = ?auto_304001 ?auto_304003 ) ) ( not ( = ?auto_304001 ?auto_304004 ) ) ( not ( = ?auto_304001 ?auto_304005 ) ) ( not ( = ?auto_304001 ?auto_304006 ) ) ( not ( = ?auto_304002 ?auto_304003 ) ) ( not ( = ?auto_304002 ?auto_304004 ) ) ( not ( = ?auto_304002 ?auto_304005 ) ) ( not ( = ?auto_304002 ?auto_304006 ) ) ( not ( = ?auto_304003 ?auto_304004 ) ) ( not ( = ?auto_304003 ?auto_304005 ) ) ( not ( = ?auto_304003 ?auto_304006 ) ) ( not ( = ?auto_304004 ?auto_304005 ) ) ( not ( = ?auto_304004 ?auto_304006 ) ) ( not ( = ?auto_304005 ?auto_304006 ) ) ( ON ?auto_304004 ?auto_304005 ) ( ON ?auto_304003 ?auto_304004 ) ( ON ?auto_304002 ?auto_304003 ) ( ON ?auto_304001 ?auto_304002 ) ( ON ?auto_304000 ?auto_304001 ) ( ON ?auto_303999 ?auto_304000 ) ( ON ?auto_303998 ?auto_303999 ) ( ON ?auto_303997 ?auto_303998 ) ( ON ?auto_303996 ?auto_303997 ) ( ON ?auto_303995 ?auto_303996 ) ( CLEAR ?auto_303993 ) ( ON ?auto_303994 ?auto_303995 ) ( CLEAR ?auto_303994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_303993 ?auto_303994 )
      ( MAKE-13PILE ?auto_303993 ?auto_303994 ?auto_303995 ?auto_303996 ?auto_303997 ?auto_303998 ?auto_303999 ?auto_304000 ?auto_304001 ?auto_304002 ?auto_304003 ?auto_304004 ?auto_304005 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_304047 - BLOCK
      ?auto_304048 - BLOCK
      ?auto_304049 - BLOCK
      ?auto_304050 - BLOCK
      ?auto_304051 - BLOCK
      ?auto_304052 - BLOCK
      ?auto_304053 - BLOCK
      ?auto_304054 - BLOCK
      ?auto_304055 - BLOCK
      ?auto_304056 - BLOCK
      ?auto_304057 - BLOCK
      ?auto_304058 - BLOCK
      ?auto_304059 - BLOCK
    )
    :vars
    (
      ?auto_304060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304059 ?auto_304060 ) ( not ( = ?auto_304047 ?auto_304048 ) ) ( not ( = ?auto_304047 ?auto_304049 ) ) ( not ( = ?auto_304047 ?auto_304050 ) ) ( not ( = ?auto_304047 ?auto_304051 ) ) ( not ( = ?auto_304047 ?auto_304052 ) ) ( not ( = ?auto_304047 ?auto_304053 ) ) ( not ( = ?auto_304047 ?auto_304054 ) ) ( not ( = ?auto_304047 ?auto_304055 ) ) ( not ( = ?auto_304047 ?auto_304056 ) ) ( not ( = ?auto_304047 ?auto_304057 ) ) ( not ( = ?auto_304047 ?auto_304058 ) ) ( not ( = ?auto_304047 ?auto_304059 ) ) ( not ( = ?auto_304047 ?auto_304060 ) ) ( not ( = ?auto_304048 ?auto_304049 ) ) ( not ( = ?auto_304048 ?auto_304050 ) ) ( not ( = ?auto_304048 ?auto_304051 ) ) ( not ( = ?auto_304048 ?auto_304052 ) ) ( not ( = ?auto_304048 ?auto_304053 ) ) ( not ( = ?auto_304048 ?auto_304054 ) ) ( not ( = ?auto_304048 ?auto_304055 ) ) ( not ( = ?auto_304048 ?auto_304056 ) ) ( not ( = ?auto_304048 ?auto_304057 ) ) ( not ( = ?auto_304048 ?auto_304058 ) ) ( not ( = ?auto_304048 ?auto_304059 ) ) ( not ( = ?auto_304048 ?auto_304060 ) ) ( not ( = ?auto_304049 ?auto_304050 ) ) ( not ( = ?auto_304049 ?auto_304051 ) ) ( not ( = ?auto_304049 ?auto_304052 ) ) ( not ( = ?auto_304049 ?auto_304053 ) ) ( not ( = ?auto_304049 ?auto_304054 ) ) ( not ( = ?auto_304049 ?auto_304055 ) ) ( not ( = ?auto_304049 ?auto_304056 ) ) ( not ( = ?auto_304049 ?auto_304057 ) ) ( not ( = ?auto_304049 ?auto_304058 ) ) ( not ( = ?auto_304049 ?auto_304059 ) ) ( not ( = ?auto_304049 ?auto_304060 ) ) ( not ( = ?auto_304050 ?auto_304051 ) ) ( not ( = ?auto_304050 ?auto_304052 ) ) ( not ( = ?auto_304050 ?auto_304053 ) ) ( not ( = ?auto_304050 ?auto_304054 ) ) ( not ( = ?auto_304050 ?auto_304055 ) ) ( not ( = ?auto_304050 ?auto_304056 ) ) ( not ( = ?auto_304050 ?auto_304057 ) ) ( not ( = ?auto_304050 ?auto_304058 ) ) ( not ( = ?auto_304050 ?auto_304059 ) ) ( not ( = ?auto_304050 ?auto_304060 ) ) ( not ( = ?auto_304051 ?auto_304052 ) ) ( not ( = ?auto_304051 ?auto_304053 ) ) ( not ( = ?auto_304051 ?auto_304054 ) ) ( not ( = ?auto_304051 ?auto_304055 ) ) ( not ( = ?auto_304051 ?auto_304056 ) ) ( not ( = ?auto_304051 ?auto_304057 ) ) ( not ( = ?auto_304051 ?auto_304058 ) ) ( not ( = ?auto_304051 ?auto_304059 ) ) ( not ( = ?auto_304051 ?auto_304060 ) ) ( not ( = ?auto_304052 ?auto_304053 ) ) ( not ( = ?auto_304052 ?auto_304054 ) ) ( not ( = ?auto_304052 ?auto_304055 ) ) ( not ( = ?auto_304052 ?auto_304056 ) ) ( not ( = ?auto_304052 ?auto_304057 ) ) ( not ( = ?auto_304052 ?auto_304058 ) ) ( not ( = ?auto_304052 ?auto_304059 ) ) ( not ( = ?auto_304052 ?auto_304060 ) ) ( not ( = ?auto_304053 ?auto_304054 ) ) ( not ( = ?auto_304053 ?auto_304055 ) ) ( not ( = ?auto_304053 ?auto_304056 ) ) ( not ( = ?auto_304053 ?auto_304057 ) ) ( not ( = ?auto_304053 ?auto_304058 ) ) ( not ( = ?auto_304053 ?auto_304059 ) ) ( not ( = ?auto_304053 ?auto_304060 ) ) ( not ( = ?auto_304054 ?auto_304055 ) ) ( not ( = ?auto_304054 ?auto_304056 ) ) ( not ( = ?auto_304054 ?auto_304057 ) ) ( not ( = ?auto_304054 ?auto_304058 ) ) ( not ( = ?auto_304054 ?auto_304059 ) ) ( not ( = ?auto_304054 ?auto_304060 ) ) ( not ( = ?auto_304055 ?auto_304056 ) ) ( not ( = ?auto_304055 ?auto_304057 ) ) ( not ( = ?auto_304055 ?auto_304058 ) ) ( not ( = ?auto_304055 ?auto_304059 ) ) ( not ( = ?auto_304055 ?auto_304060 ) ) ( not ( = ?auto_304056 ?auto_304057 ) ) ( not ( = ?auto_304056 ?auto_304058 ) ) ( not ( = ?auto_304056 ?auto_304059 ) ) ( not ( = ?auto_304056 ?auto_304060 ) ) ( not ( = ?auto_304057 ?auto_304058 ) ) ( not ( = ?auto_304057 ?auto_304059 ) ) ( not ( = ?auto_304057 ?auto_304060 ) ) ( not ( = ?auto_304058 ?auto_304059 ) ) ( not ( = ?auto_304058 ?auto_304060 ) ) ( not ( = ?auto_304059 ?auto_304060 ) ) ( ON ?auto_304058 ?auto_304059 ) ( ON ?auto_304057 ?auto_304058 ) ( ON ?auto_304056 ?auto_304057 ) ( ON ?auto_304055 ?auto_304056 ) ( ON ?auto_304054 ?auto_304055 ) ( ON ?auto_304053 ?auto_304054 ) ( ON ?auto_304052 ?auto_304053 ) ( ON ?auto_304051 ?auto_304052 ) ( ON ?auto_304050 ?auto_304051 ) ( ON ?auto_304049 ?auto_304050 ) ( ON ?auto_304048 ?auto_304049 ) ( ON ?auto_304047 ?auto_304048 ) ( CLEAR ?auto_304047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304047 )
      ( MAKE-13PILE ?auto_304047 ?auto_304048 ?auto_304049 ?auto_304050 ?auto_304051 ?auto_304052 ?auto_304053 ?auto_304054 ?auto_304055 ?auto_304056 ?auto_304057 ?auto_304058 ?auto_304059 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304102 - BLOCK
      ?auto_304103 - BLOCK
      ?auto_304104 - BLOCK
      ?auto_304105 - BLOCK
      ?auto_304106 - BLOCK
      ?auto_304107 - BLOCK
      ?auto_304108 - BLOCK
      ?auto_304109 - BLOCK
      ?auto_304110 - BLOCK
      ?auto_304111 - BLOCK
      ?auto_304112 - BLOCK
      ?auto_304113 - BLOCK
      ?auto_304114 - BLOCK
      ?auto_304115 - BLOCK
    )
    :vars
    (
      ?auto_304116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304114 ) ( ON ?auto_304115 ?auto_304116 ) ( CLEAR ?auto_304115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304102 ) ( ON ?auto_304103 ?auto_304102 ) ( ON ?auto_304104 ?auto_304103 ) ( ON ?auto_304105 ?auto_304104 ) ( ON ?auto_304106 ?auto_304105 ) ( ON ?auto_304107 ?auto_304106 ) ( ON ?auto_304108 ?auto_304107 ) ( ON ?auto_304109 ?auto_304108 ) ( ON ?auto_304110 ?auto_304109 ) ( ON ?auto_304111 ?auto_304110 ) ( ON ?auto_304112 ?auto_304111 ) ( ON ?auto_304113 ?auto_304112 ) ( ON ?auto_304114 ?auto_304113 ) ( not ( = ?auto_304102 ?auto_304103 ) ) ( not ( = ?auto_304102 ?auto_304104 ) ) ( not ( = ?auto_304102 ?auto_304105 ) ) ( not ( = ?auto_304102 ?auto_304106 ) ) ( not ( = ?auto_304102 ?auto_304107 ) ) ( not ( = ?auto_304102 ?auto_304108 ) ) ( not ( = ?auto_304102 ?auto_304109 ) ) ( not ( = ?auto_304102 ?auto_304110 ) ) ( not ( = ?auto_304102 ?auto_304111 ) ) ( not ( = ?auto_304102 ?auto_304112 ) ) ( not ( = ?auto_304102 ?auto_304113 ) ) ( not ( = ?auto_304102 ?auto_304114 ) ) ( not ( = ?auto_304102 ?auto_304115 ) ) ( not ( = ?auto_304102 ?auto_304116 ) ) ( not ( = ?auto_304103 ?auto_304104 ) ) ( not ( = ?auto_304103 ?auto_304105 ) ) ( not ( = ?auto_304103 ?auto_304106 ) ) ( not ( = ?auto_304103 ?auto_304107 ) ) ( not ( = ?auto_304103 ?auto_304108 ) ) ( not ( = ?auto_304103 ?auto_304109 ) ) ( not ( = ?auto_304103 ?auto_304110 ) ) ( not ( = ?auto_304103 ?auto_304111 ) ) ( not ( = ?auto_304103 ?auto_304112 ) ) ( not ( = ?auto_304103 ?auto_304113 ) ) ( not ( = ?auto_304103 ?auto_304114 ) ) ( not ( = ?auto_304103 ?auto_304115 ) ) ( not ( = ?auto_304103 ?auto_304116 ) ) ( not ( = ?auto_304104 ?auto_304105 ) ) ( not ( = ?auto_304104 ?auto_304106 ) ) ( not ( = ?auto_304104 ?auto_304107 ) ) ( not ( = ?auto_304104 ?auto_304108 ) ) ( not ( = ?auto_304104 ?auto_304109 ) ) ( not ( = ?auto_304104 ?auto_304110 ) ) ( not ( = ?auto_304104 ?auto_304111 ) ) ( not ( = ?auto_304104 ?auto_304112 ) ) ( not ( = ?auto_304104 ?auto_304113 ) ) ( not ( = ?auto_304104 ?auto_304114 ) ) ( not ( = ?auto_304104 ?auto_304115 ) ) ( not ( = ?auto_304104 ?auto_304116 ) ) ( not ( = ?auto_304105 ?auto_304106 ) ) ( not ( = ?auto_304105 ?auto_304107 ) ) ( not ( = ?auto_304105 ?auto_304108 ) ) ( not ( = ?auto_304105 ?auto_304109 ) ) ( not ( = ?auto_304105 ?auto_304110 ) ) ( not ( = ?auto_304105 ?auto_304111 ) ) ( not ( = ?auto_304105 ?auto_304112 ) ) ( not ( = ?auto_304105 ?auto_304113 ) ) ( not ( = ?auto_304105 ?auto_304114 ) ) ( not ( = ?auto_304105 ?auto_304115 ) ) ( not ( = ?auto_304105 ?auto_304116 ) ) ( not ( = ?auto_304106 ?auto_304107 ) ) ( not ( = ?auto_304106 ?auto_304108 ) ) ( not ( = ?auto_304106 ?auto_304109 ) ) ( not ( = ?auto_304106 ?auto_304110 ) ) ( not ( = ?auto_304106 ?auto_304111 ) ) ( not ( = ?auto_304106 ?auto_304112 ) ) ( not ( = ?auto_304106 ?auto_304113 ) ) ( not ( = ?auto_304106 ?auto_304114 ) ) ( not ( = ?auto_304106 ?auto_304115 ) ) ( not ( = ?auto_304106 ?auto_304116 ) ) ( not ( = ?auto_304107 ?auto_304108 ) ) ( not ( = ?auto_304107 ?auto_304109 ) ) ( not ( = ?auto_304107 ?auto_304110 ) ) ( not ( = ?auto_304107 ?auto_304111 ) ) ( not ( = ?auto_304107 ?auto_304112 ) ) ( not ( = ?auto_304107 ?auto_304113 ) ) ( not ( = ?auto_304107 ?auto_304114 ) ) ( not ( = ?auto_304107 ?auto_304115 ) ) ( not ( = ?auto_304107 ?auto_304116 ) ) ( not ( = ?auto_304108 ?auto_304109 ) ) ( not ( = ?auto_304108 ?auto_304110 ) ) ( not ( = ?auto_304108 ?auto_304111 ) ) ( not ( = ?auto_304108 ?auto_304112 ) ) ( not ( = ?auto_304108 ?auto_304113 ) ) ( not ( = ?auto_304108 ?auto_304114 ) ) ( not ( = ?auto_304108 ?auto_304115 ) ) ( not ( = ?auto_304108 ?auto_304116 ) ) ( not ( = ?auto_304109 ?auto_304110 ) ) ( not ( = ?auto_304109 ?auto_304111 ) ) ( not ( = ?auto_304109 ?auto_304112 ) ) ( not ( = ?auto_304109 ?auto_304113 ) ) ( not ( = ?auto_304109 ?auto_304114 ) ) ( not ( = ?auto_304109 ?auto_304115 ) ) ( not ( = ?auto_304109 ?auto_304116 ) ) ( not ( = ?auto_304110 ?auto_304111 ) ) ( not ( = ?auto_304110 ?auto_304112 ) ) ( not ( = ?auto_304110 ?auto_304113 ) ) ( not ( = ?auto_304110 ?auto_304114 ) ) ( not ( = ?auto_304110 ?auto_304115 ) ) ( not ( = ?auto_304110 ?auto_304116 ) ) ( not ( = ?auto_304111 ?auto_304112 ) ) ( not ( = ?auto_304111 ?auto_304113 ) ) ( not ( = ?auto_304111 ?auto_304114 ) ) ( not ( = ?auto_304111 ?auto_304115 ) ) ( not ( = ?auto_304111 ?auto_304116 ) ) ( not ( = ?auto_304112 ?auto_304113 ) ) ( not ( = ?auto_304112 ?auto_304114 ) ) ( not ( = ?auto_304112 ?auto_304115 ) ) ( not ( = ?auto_304112 ?auto_304116 ) ) ( not ( = ?auto_304113 ?auto_304114 ) ) ( not ( = ?auto_304113 ?auto_304115 ) ) ( not ( = ?auto_304113 ?auto_304116 ) ) ( not ( = ?auto_304114 ?auto_304115 ) ) ( not ( = ?auto_304114 ?auto_304116 ) ) ( not ( = ?auto_304115 ?auto_304116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_304115 ?auto_304116 )
      ( !STACK ?auto_304115 ?auto_304114 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304131 - BLOCK
      ?auto_304132 - BLOCK
      ?auto_304133 - BLOCK
      ?auto_304134 - BLOCK
      ?auto_304135 - BLOCK
      ?auto_304136 - BLOCK
      ?auto_304137 - BLOCK
      ?auto_304138 - BLOCK
      ?auto_304139 - BLOCK
      ?auto_304140 - BLOCK
      ?auto_304141 - BLOCK
      ?auto_304142 - BLOCK
      ?auto_304143 - BLOCK
      ?auto_304144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_304143 ) ( ON-TABLE ?auto_304144 ) ( CLEAR ?auto_304144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_304131 ) ( ON ?auto_304132 ?auto_304131 ) ( ON ?auto_304133 ?auto_304132 ) ( ON ?auto_304134 ?auto_304133 ) ( ON ?auto_304135 ?auto_304134 ) ( ON ?auto_304136 ?auto_304135 ) ( ON ?auto_304137 ?auto_304136 ) ( ON ?auto_304138 ?auto_304137 ) ( ON ?auto_304139 ?auto_304138 ) ( ON ?auto_304140 ?auto_304139 ) ( ON ?auto_304141 ?auto_304140 ) ( ON ?auto_304142 ?auto_304141 ) ( ON ?auto_304143 ?auto_304142 ) ( not ( = ?auto_304131 ?auto_304132 ) ) ( not ( = ?auto_304131 ?auto_304133 ) ) ( not ( = ?auto_304131 ?auto_304134 ) ) ( not ( = ?auto_304131 ?auto_304135 ) ) ( not ( = ?auto_304131 ?auto_304136 ) ) ( not ( = ?auto_304131 ?auto_304137 ) ) ( not ( = ?auto_304131 ?auto_304138 ) ) ( not ( = ?auto_304131 ?auto_304139 ) ) ( not ( = ?auto_304131 ?auto_304140 ) ) ( not ( = ?auto_304131 ?auto_304141 ) ) ( not ( = ?auto_304131 ?auto_304142 ) ) ( not ( = ?auto_304131 ?auto_304143 ) ) ( not ( = ?auto_304131 ?auto_304144 ) ) ( not ( = ?auto_304132 ?auto_304133 ) ) ( not ( = ?auto_304132 ?auto_304134 ) ) ( not ( = ?auto_304132 ?auto_304135 ) ) ( not ( = ?auto_304132 ?auto_304136 ) ) ( not ( = ?auto_304132 ?auto_304137 ) ) ( not ( = ?auto_304132 ?auto_304138 ) ) ( not ( = ?auto_304132 ?auto_304139 ) ) ( not ( = ?auto_304132 ?auto_304140 ) ) ( not ( = ?auto_304132 ?auto_304141 ) ) ( not ( = ?auto_304132 ?auto_304142 ) ) ( not ( = ?auto_304132 ?auto_304143 ) ) ( not ( = ?auto_304132 ?auto_304144 ) ) ( not ( = ?auto_304133 ?auto_304134 ) ) ( not ( = ?auto_304133 ?auto_304135 ) ) ( not ( = ?auto_304133 ?auto_304136 ) ) ( not ( = ?auto_304133 ?auto_304137 ) ) ( not ( = ?auto_304133 ?auto_304138 ) ) ( not ( = ?auto_304133 ?auto_304139 ) ) ( not ( = ?auto_304133 ?auto_304140 ) ) ( not ( = ?auto_304133 ?auto_304141 ) ) ( not ( = ?auto_304133 ?auto_304142 ) ) ( not ( = ?auto_304133 ?auto_304143 ) ) ( not ( = ?auto_304133 ?auto_304144 ) ) ( not ( = ?auto_304134 ?auto_304135 ) ) ( not ( = ?auto_304134 ?auto_304136 ) ) ( not ( = ?auto_304134 ?auto_304137 ) ) ( not ( = ?auto_304134 ?auto_304138 ) ) ( not ( = ?auto_304134 ?auto_304139 ) ) ( not ( = ?auto_304134 ?auto_304140 ) ) ( not ( = ?auto_304134 ?auto_304141 ) ) ( not ( = ?auto_304134 ?auto_304142 ) ) ( not ( = ?auto_304134 ?auto_304143 ) ) ( not ( = ?auto_304134 ?auto_304144 ) ) ( not ( = ?auto_304135 ?auto_304136 ) ) ( not ( = ?auto_304135 ?auto_304137 ) ) ( not ( = ?auto_304135 ?auto_304138 ) ) ( not ( = ?auto_304135 ?auto_304139 ) ) ( not ( = ?auto_304135 ?auto_304140 ) ) ( not ( = ?auto_304135 ?auto_304141 ) ) ( not ( = ?auto_304135 ?auto_304142 ) ) ( not ( = ?auto_304135 ?auto_304143 ) ) ( not ( = ?auto_304135 ?auto_304144 ) ) ( not ( = ?auto_304136 ?auto_304137 ) ) ( not ( = ?auto_304136 ?auto_304138 ) ) ( not ( = ?auto_304136 ?auto_304139 ) ) ( not ( = ?auto_304136 ?auto_304140 ) ) ( not ( = ?auto_304136 ?auto_304141 ) ) ( not ( = ?auto_304136 ?auto_304142 ) ) ( not ( = ?auto_304136 ?auto_304143 ) ) ( not ( = ?auto_304136 ?auto_304144 ) ) ( not ( = ?auto_304137 ?auto_304138 ) ) ( not ( = ?auto_304137 ?auto_304139 ) ) ( not ( = ?auto_304137 ?auto_304140 ) ) ( not ( = ?auto_304137 ?auto_304141 ) ) ( not ( = ?auto_304137 ?auto_304142 ) ) ( not ( = ?auto_304137 ?auto_304143 ) ) ( not ( = ?auto_304137 ?auto_304144 ) ) ( not ( = ?auto_304138 ?auto_304139 ) ) ( not ( = ?auto_304138 ?auto_304140 ) ) ( not ( = ?auto_304138 ?auto_304141 ) ) ( not ( = ?auto_304138 ?auto_304142 ) ) ( not ( = ?auto_304138 ?auto_304143 ) ) ( not ( = ?auto_304138 ?auto_304144 ) ) ( not ( = ?auto_304139 ?auto_304140 ) ) ( not ( = ?auto_304139 ?auto_304141 ) ) ( not ( = ?auto_304139 ?auto_304142 ) ) ( not ( = ?auto_304139 ?auto_304143 ) ) ( not ( = ?auto_304139 ?auto_304144 ) ) ( not ( = ?auto_304140 ?auto_304141 ) ) ( not ( = ?auto_304140 ?auto_304142 ) ) ( not ( = ?auto_304140 ?auto_304143 ) ) ( not ( = ?auto_304140 ?auto_304144 ) ) ( not ( = ?auto_304141 ?auto_304142 ) ) ( not ( = ?auto_304141 ?auto_304143 ) ) ( not ( = ?auto_304141 ?auto_304144 ) ) ( not ( = ?auto_304142 ?auto_304143 ) ) ( not ( = ?auto_304142 ?auto_304144 ) ) ( not ( = ?auto_304143 ?auto_304144 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_304144 )
      ( !STACK ?auto_304144 ?auto_304143 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304159 - BLOCK
      ?auto_304160 - BLOCK
      ?auto_304161 - BLOCK
      ?auto_304162 - BLOCK
      ?auto_304163 - BLOCK
      ?auto_304164 - BLOCK
      ?auto_304165 - BLOCK
      ?auto_304166 - BLOCK
      ?auto_304167 - BLOCK
      ?auto_304168 - BLOCK
      ?auto_304169 - BLOCK
      ?auto_304170 - BLOCK
      ?auto_304171 - BLOCK
      ?auto_304172 - BLOCK
    )
    :vars
    (
      ?auto_304173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304172 ?auto_304173 ) ( ON-TABLE ?auto_304159 ) ( ON ?auto_304160 ?auto_304159 ) ( ON ?auto_304161 ?auto_304160 ) ( ON ?auto_304162 ?auto_304161 ) ( ON ?auto_304163 ?auto_304162 ) ( ON ?auto_304164 ?auto_304163 ) ( ON ?auto_304165 ?auto_304164 ) ( ON ?auto_304166 ?auto_304165 ) ( ON ?auto_304167 ?auto_304166 ) ( ON ?auto_304168 ?auto_304167 ) ( ON ?auto_304169 ?auto_304168 ) ( ON ?auto_304170 ?auto_304169 ) ( not ( = ?auto_304159 ?auto_304160 ) ) ( not ( = ?auto_304159 ?auto_304161 ) ) ( not ( = ?auto_304159 ?auto_304162 ) ) ( not ( = ?auto_304159 ?auto_304163 ) ) ( not ( = ?auto_304159 ?auto_304164 ) ) ( not ( = ?auto_304159 ?auto_304165 ) ) ( not ( = ?auto_304159 ?auto_304166 ) ) ( not ( = ?auto_304159 ?auto_304167 ) ) ( not ( = ?auto_304159 ?auto_304168 ) ) ( not ( = ?auto_304159 ?auto_304169 ) ) ( not ( = ?auto_304159 ?auto_304170 ) ) ( not ( = ?auto_304159 ?auto_304171 ) ) ( not ( = ?auto_304159 ?auto_304172 ) ) ( not ( = ?auto_304159 ?auto_304173 ) ) ( not ( = ?auto_304160 ?auto_304161 ) ) ( not ( = ?auto_304160 ?auto_304162 ) ) ( not ( = ?auto_304160 ?auto_304163 ) ) ( not ( = ?auto_304160 ?auto_304164 ) ) ( not ( = ?auto_304160 ?auto_304165 ) ) ( not ( = ?auto_304160 ?auto_304166 ) ) ( not ( = ?auto_304160 ?auto_304167 ) ) ( not ( = ?auto_304160 ?auto_304168 ) ) ( not ( = ?auto_304160 ?auto_304169 ) ) ( not ( = ?auto_304160 ?auto_304170 ) ) ( not ( = ?auto_304160 ?auto_304171 ) ) ( not ( = ?auto_304160 ?auto_304172 ) ) ( not ( = ?auto_304160 ?auto_304173 ) ) ( not ( = ?auto_304161 ?auto_304162 ) ) ( not ( = ?auto_304161 ?auto_304163 ) ) ( not ( = ?auto_304161 ?auto_304164 ) ) ( not ( = ?auto_304161 ?auto_304165 ) ) ( not ( = ?auto_304161 ?auto_304166 ) ) ( not ( = ?auto_304161 ?auto_304167 ) ) ( not ( = ?auto_304161 ?auto_304168 ) ) ( not ( = ?auto_304161 ?auto_304169 ) ) ( not ( = ?auto_304161 ?auto_304170 ) ) ( not ( = ?auto_304161 ?auto_304171 ) ) ( not ( = ?auto_304161 ?auto_304172 ) ) ( not ( = ?auto_304161 ?auto_304173 ) ) ( not ( = ?auto_304162 ?auto_304163 ) ) ( not ( = ?auto_304162 ?auto_304164 ) ) ( not ( = ?auto_304162 ?auto_304165 ) ) ( not ( = ?auto_304162 ?auto_304166 ) ) ( not ( = ?auto_304162 ?auto_304167 ) ) ( not ( = ?auto_304162 ?auto_304168 ) ) ( not ( = ?auto_304162 ?auto_304169 ) ) ( not ( = ?auto_304162 ?auto_304170 ) ) ( not ( = ?auto_304162 ?auto_304171 ) ) ( not ( = ?auto_304162 ?auto_304172 ) ) ( not ( = ?auto_304162 ?auto_304173 ) ) ( not ( = ?auto_304163 ?auto_304164 ) ) ( not ( = ?auto_304163 ?auto_304165 ) ) ( not ( = ?auto_304163 ?auto_304166 ) ) ( not ( = ?auto_304163 ?auto_304167 ) ) ( not ( = ?auto_304163 ?auto_304168 ) ) ( not ( = ?auto_304163 ?auto_304169 ) ) ( not ( = ?auto_304163 ?auto_304170 ) ) ( not ( = ?auto_304163 ?auto_304171 ) ) ( not ( = ?auto_304163 ?auto_304172 ) ) ( not ( = ?auto_304163 ?auto_304173 ) ) ( not ( = ?auto_304164 ?auto_304165 ) ) ( not ( = ?auto_304164 ?auto_304166 ) ) ( not ( = ?auto_304164 ?auto_304167 ) ) ( not ( = ?auto_304164 ?auto_304168 ) ) ( not ( = ?auto_304164 ?auto_304169 ) ) ( not ( = ?auto_304164 ?auto_304170 ) ) ( not ( = ?auto_304164 ?auto_304171 ) ) ( not ( = ?auto_304164 ?auto_304172 ) ) ( not ( = ?auto_304164 ?auto_304173 ) ) ( not ( = ?auto_304165 ?auto_304166 ) ) ( not ( = ?auto_304165 ?auto_304167 ) ) ( not ( = ?auto_304165 ?auto_304168 ) ) ( not ( = ?auto_304165 ?auto_304169 ) ) ( not ( = ?auto_304165 ?auto_304170 ) ) ( not ( = ?auto_304165 ?auto_304171 ) ) ( not ( = ?auto_304165 ?auto_304172 ) ) ( not ( = ?auto_304165 ?auto_304173 ) ) ( not ( = ?auto_304166 ?auto_304167 ) ) ( not ( = ?auto_304166 ?auto_304168 ) ) ( not ( = ?auto_304166 ?auto_304169 ) ) ( not ( = ?auto_304166 ?auto_304170 ) ) ( not ( = ?auto_304166 ?auto_304171 ) ) ( not ( = ?auto_304166 ?auto_304172 ) ) ( not ( = ?auto_304166 ?auto_304173 ) ) ( not ( = ?auto_304167 ?auto_304168 ) ) ( not ( = ?auto_304167 ?auto_304169 ) ) ( not ( = ?auto_304167 ?auto_304170 ) ) ( not ( = ?auto_304167 ?auto_304171 ) ) ( not ( = ?auto_304167 ?auto_304172 ) ) ( not ( = ?auto_304167 ?auto_304173 ) ) ( not ( = ?auto_304168 ?auto_304169 ) ) ( not ( = ?auto_304168 ?auto_304170 ) ) ( not ( = ?auto_304168 ?auto_304171 ) ) ( not ( = ?auto_304168 ?auto_304172 ) ) ( not ( = ?auto_304168 ?auto_304173 ) ) ( not ( = ?auto_304169 ?auto_304170 ) ) ( not ( = ?auto_304169 ?auto_304171 ) ) ( not ( = ?auto_304169 ?auto_304172 ) ) ( not ( = ?auto_304169 ?auto_304173 ) ) ( not ( = ?auto_304170 ?auto_304171 ) ) ( not ( = ?auto_304170 ?auto_304172 ) ) ( not ( = ?auto_304170 ?auto_304173 ) ) ( not ( = ?auto_304171 ?auto_304172 ) ) ( not ( = ?auto_304171 ?auto_304173 ) ) ( not ( = ?auto_304172 ?auto_304173 ) ) ( CLEAR ?auto_304170 ) ( ON ?auto_304171 ?auto_304172 ) ( CLEAR ?auto_304171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_304159 ?auto_304160 ?auto_304161 ?auto_304162 ?auto_304163 ?auto_304164 ?auto_304165 ?auto_304166 ?auto_304167 ?auto_304168 ?auto_304169 ?auto_304170 ?auto_304171 )
      ( MAKE-14PILE ?auto_304159 ?auto_304160 ?auto_304161 ?auto_304162 ?auto_304163 ?auto_304164 ?auto_304165 ?auto_304166 ?auto_304167 ?auto_304168 ?auto_304169 ?auto_304170 ?auto_304171 ?auto_304172 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304188 - BLOCK
      ?auto_304189 - BLOCK
      ?auto_304190 - BLOCK
      ?auto_304191 - BLOCK
      ?auto_304192 - BLOCK
      ?auto_304193 - BLOCK
      ?auto_304194 - BLOCK
      ?auto_304195 - BLOCK
      ?auto_304196 - BLOCK
      ?auto_304197 - BLOCK
      ?auto_304198 - BLOCK
      ?auto_304199 - BLOCK
      ?auto_304200 - BLOCK
      ?auto_304201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304201 ) ( ON-TABLE ?auto_304188 ) ( ON ?auto_304189 ?auto_304188 ) ( ON ?auto_304190 ?auto_304189 ) ( ON ?auto_304191 ?auto_304190 ) ( ON ?auto_304192 ?auto_304191 ) ( ON ?auto_304193 ?auto_304192 ) ( ON ?auto_304194 ?auto_304193 ) ( ON ?auto_304195 ?auto_304194 ) ( ON ?auto_304196 ?auto_304195 ) ( ON ?auto_304197 ?auto_304196 ) ( ON ?auto_304198 ?auto_304197 ) ( ON ?auto_304199 ?auto_304198 ) ( not ( = ?auto_304188 ?auto_304189 ) ) ( not ( = ?auto_304188 ?auto_304190 ) ) ( not ( = ?auto_304188 ?auto_304191 ) ) ( not ( = ?auto_304188 ?auto_304192 ) ) ( not ( = ?auto_304188 ?auto_304193 ) ) ( not ( = ?auto_304188 ?auto_304194 ) ) ( not ( = ?auto_304188 ?auto_304195 ) ) ( not ( = ?auto_304188 ?auto_304196 ) ) ( not ( = ?auto_304188 ?auto_304197 ) ) ( not ( = ?auto_304188 ?auto_304198 ) ) ( not ( = ?auto_304188 ?auto_304199 ) ) ( not ( = ?auto_304188 ?auto_304200 ) ) ( not ( = ?auto_304188 ?auto_304201 ) ) ( not ( = ?auto_304189 ?auto_304190 ) ) ( not ( = ?auto_304189 ?auto_304191 ) ) ( not ( = ?auto_304189 ?auto_304192 ) ) ( not ( = ?auto_304189 ?auto_304193 ) ) ( not ( = ?auto_304189 ?auto_304194 ) ) ( not ( = ?auto_304189 ?auto_304195 ) ) ( not ( = ?auto_304189 ?auto_304196 ) ) ( not ( = ?auto_304189 ?auto_304197 ) ) ( not ( = ?auto_304189 ?auto_304198 ) ) ( not ( = ?auto_304189 ?auto_304199 ) ) ( not ( = ?auto_304189 ?auto_304200 ) ) ( not ( = ?auto_304189 ?auto_304201 ) ) ( not ( = ?auto_304190 ?auto_304191 ) ) ( not ( = ?auto_304190 ?auto_304192 ) ) ( not ( = ?auto_304190 ?auto_304193 ) ) ( not ( = ?auto_304190 ?auto_304194 ) ) ( not ( = ?auto_304190 ?auto_304195 ) ) ( not ( = ?auto_304190 ?auto_304196 ) ) ( not ( = ?auto_304190 ?auto_304197 ) ) ( not ( = ?auto_304190 ?auto_304198 ) ) ( not ( = ?auto_304190 ?auto_304199 ) ) ( not ( = ?auto_304190 ?auto_304200 ) ) ( not ( = ?auto_304190 ?auto_304201 ) ) ( not ( = ?auto_304191 ?auto_304192 ) ) ( not ( = ?auto_304191 ?auto_304193 ) ) ( not ( = ?auto_304191 ?auto_304194 ) ) ( not ( = ?auto_304191 ?auto_304195 ) ) ( not ( = ?auto_304191 ?auto_304196 ) ) ( not ( = ?auto_304191 ?auto_304197 ) ) ( not ( = ?auto_304191 ?auto_304198 ) ) ( not ( = ?auto_304191 ?auto_304199 ) ) ( not ( = ?auto_304191 ?auto_304200 ) ) ( not ( = ?auto_304191 ?auto_304201 ) ) ( not ( = ?auto_304192 ?auto_304193 ) ) ( not ( = ?auto_304192 ?auto_304194 ) ) ( not ( = ?auto_304192 ?auto_304195 ) ) ( not ( = ?auto_304192 ?auto_304196 ) ) ( not ( = ?auto_304192 ?auto_304197 ) ) ( not ( = ?auto_304192 ?auto_304198 ) ) ( not ( = ?auto_304192 ?auto_304199 ) ) ( not ( = ?auto_304192 ?auto_304200 ) ) ( not ( = ?auto_304192 ?auto_304201 ) ) ( not ( = ?auto_304193 ?auto_304194 ) ) ( not ( = ?auto_304193 ?auto_304195 ) ) ( not ( = ?auto_304193 ?auto_304196 ) ) ( not ( = ?auto_304193 ?auto_304197 ) ) ( not ( = ?auto_304193 ?auto_304198 ) ) ( not ( = ?auto_304193 ?auto_304199 ) ) ( not ( = ?auto_304193 ?auto_304200 ) ) ( not ( = ?auto_304193 ?auto_304201 ) ) ( not ( = ?auto_304194 ?auto_304195 ) ) ( not ( = ?auto_304194 ?auto_304196 ) ) ( not ( = ?auto_304194 ?auto_304197 ) ) ( not ( = ?auto_304194 ?auto_304198 ) ) ( not ( = ?auto_304194 ?auto_304199 ) ) ( not ( = ?auto_304194 ?auto_304200 ) ) ( not ( = ?auto_304194 ?auto_304201 ) ) ( not ( = ?auto_304195 ?auto_304196 ) ) ( not ( = ?auto_304195 ?auto_304197 ) ) ( not ( = ?auto_304195 ?auto_304198 ) ) ( not ( = ?auto_304195 ?auto_304199 ) ) ( not ( = ?auto_304195 ?auto_304200 ) ) ( not ( = ?auto_304195 ?auto_304201 ) ) ( not ( = ?auto_304196 ?auto_304197 ) ) ( not ( = ?auto_304196 ?auto_304198 ) ) ( not ( = ?auto_304196 ?auto_304199 ) ) ( not ( = ?auto_304196 ?auto_304200 ) ) ( not ( = ?auto_304196 ?auto_304201 ) ) ( not ( = ?auto_304197 ?auto_304198 ) ) ( not ( = ?auto_304197 ?auto_304199 ) ) ( not ( = ?auto_304197 ?auto_304200 ) ) ( not ( = ?auto_304197 ?auto_304201 ) ) ( not ( = ?auto_304198 ?auto_304199 ) ) ( not ( = ?auto_304198 ?auto_304200 ) ) ( not ( = ?auto_304198 ?auto_304201 ) ) ( not ( = ?auto_304199 ?auto_304200 ) ) ( not ( = ?auto_304199 ?auto_304201 ) ) ( not ( = ?auto_304200 ?auto_304201 ) ) ( CLEAR ?auto_304199 ) ( ON ?auto_304200 ?auto_304201 ) ( CLEAR ?auto_304200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_304188 ?auto_304189 ?auto_304190 ?auto_304191 ?auto_304192 ?auto_304193 ?auto_304194 ?auto_304195 ?auto_304196 ?auto_304197 ?auto_304198 ?auto_304199 ?auto_304200 )
      ( MAKE-14PILE ?auto_304188 ?auto_304189 ?auto_304190 ?auto_304191 ?auto_304192 ?auto_304193 ?auto_304194 ?auto_304195 ?auto_304196 ?auto_304197 ?auto_304198 ?auto_304199 ?auto_304200 ?auto_304201 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304216 - BLOCK
      ?auto_304217 - BLOCK
      ?auto_304218 - BLOCK
      ?auto_304219 - BLOCK
      ?auto_304220 - BLOCK
      ?auto_304221 - BLOCK
      ?auto_304222 - BLOCK
      ?auto_304223 - BLOCK
      ?auto_304224 - BLOCK
      ?auto_304225 - BLOCK
      ?auto_304226 - BLOCK
      ?auto_304227 - BLOCK
      ?auto_304228 - BLOCK
      ?auto_304229 - BLOCK
    )
    :vars
    (
      ?auto_304230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304229 ?auto_304230 ) ( ON-TABLE ?auto_304216 ) ( ON ?auto_304217 ?auto_304216 ) ( ON ?auto_304218 ?auto_304217 ) ( ON ?auto_304219 ?auto_304218 ) ( ON ?auto_304220 ?auto_304219 ) ( ON ?auto_304221 ?auto_304220 ) ( ON ?auto_304222 ?auto_304221 ) ( ON ?auto_304223 ?auto_304222 ) ( ON ?auto_304224 ?auto_304223 ) ( ON ?auto_304225 ?auto_304224 ) ( ON ?auto_304226 ?auto_304225 ) ( not ( = ?auto_304216 ?auto_304217 ) ) ( not ( = ?auto_304216 ?auto_304218 ) ) ( not ( = ?auto_304216 ?auto_304219 ) ) ( not ( = ?auto_304216 ?auto_304220 ) ) ( not ( = ?auto_304216 ?auto_304221 ) ) ( not ( = ?auto_304216 ?auto_304222 ) ) ( not ( = ?auto_304216 ?auto_304223 ) ) ( not ( = ?auto_304216 ?auto_304224 ) ) ( not ( = ?auto_304216 ?auto_304225 ) ) ( not ( = ?auto_304216 ?auto_304226 ) ) ( not ( = ?auto_304216 ?auto_304227 ) ) ( not ( = ?auto_304216 ?auto_304228 ) ) ( not ( = ?auto_304216 ?auto_304229 ) ) ( not ( = ?auto_304216 ?auto_304230 ) ) ( not ( = ?auto_304217 ?auto_304218 ) ) ( not ( = ?auto_304217 ?auto_304219 ) ) ( not ( = ?auto_304217 ?auto_304220 ) ) ( not ( = ?auto_304217 ?auto_304221 ) ) ( not ( = ?auto_304217 ?auto_304222 ) ) ( not ( = ?auto_304217 ?auto_304223 ) ) ( not ( = ?auto_304217 ?auto_304224 ) ) ( not ( = ?auto_304217 ?auto_304225 ) ) ( not ( = ?auto_304217 ?auto_304226 ) ) ( not ( = ?auto_304217 ?auto_304227 ) ) ( not ( = ?auto_304217 ?auto_304228 ) ) ( not ( = ?auto_304217 ?auto_304229 ) ) ( not ( = ?auto_304217 ?auto_304230 ) ) ( not ( = ?auto_304218 ?auto_304219 ) ) ( not ( = ?auto_304218 ?auto_304220 ) ) ( not ( = ?auto_304218 ?auto_304221 ) ) ( not ( = ?auto_304218 ?auto_304222 ) ) ( not ( = ?auto_304218 ?auto_304223 ) ) ( not ( = ?auto_304218 ?auto_304224 ) ) ( not ( = ?auto_304218 ?auto_304225 ) ) ( not ( = ?auto_304218 ?auto_304226 ) ) ( not ( = ?auto_304218 ?auto_304227 ) ) ( not ( = ?auto_304218 ?auto_304228 ) ) ( not ( = ?auto_304218 ?auto_304229 ) ) ( not ( = ?auto_304218 ?auto_304230 ) ) ( not ( = ?auto_304219 ?auto_304220 ) ) ( not ( = ?auto_304219 ?auto_304221 ) ) ( not ( = ?auto_304219 ?auto_304222 ) ) ( not ( = ?auto_304219 ?auto_304223 ) ) ( not ( = ?auto_304219 ?auto_304224 ) ) ( not ( = ?auto_304219 ?auto_304225 ) ) ( not ( = ?auto_304219 ?auto_304226 ) ) ( not ( = ?auto_304219 ?auto_304227 ) ) ( not ( = ?auto_304219 ?auto_304228 ) ) ( not ( = ?auto_304219 ?auto_304229 ) ) ( not ( = ?auto_304219 ?auto_304230 ) ) ( not ( = ?auto_304220 ?auto_304221 ) ) ( not ( = ?auto_304220 ?auto_304222 ) ) ( not ( = ?auto_304220 ?auto_304223 ) ) ( not ( = ?auto_304220 ?auto_304224 ) ) ( not ( = ?auto_304220 ?auto_304225 ) ) ( not ( = ?auto_304220 ?auto_304226 ) ) ( not ( = ?auto_304220 ?auto_304227 ) ) ( not ( = ?auto_304220 ?auto_304228 ) ) ( not ( = ?auto_304220 ?auto_304229 ) ) ( not ( = ?auto_304220 ?auto_304230 ) ) ( not ( = ?auto_304221 ?auto_304222 ) ) ( not ( = ?auto_304221 ?auto_304223 ) ) ( not ( = ?auto_304221 ?auto_304224 ) ) ( not ( = ?auto_304221 ?auto_304225 ) ) ( not ( = ?auto_304221 ?auto_304226 ) ) ( not ( = ?auto_304221 ?auto_304227 ) ) ( not ( = ?auto_304221 ?auto_304228 ) ) ( not ( = ?auto_304221 ?auto_304229 ) ) ( not ( = ?auto_304221 ?auto_304230 ) ) ( not ( = ?auto_304222 ?auto_304223 ) ) ( not ( = ?auto_304222 ?auto_304224 ) ) ( not ( = ?auto_304222 ?auto_304225 ) ) ( not ( = ?auto_304222 ?auto_304226 ) ) ( not ( = ?auto_304222 ?auto_304227 ) ) ( not ( = ?auto_304222 ?auto_304228 ) ) ( not ( = ?auto_304222 ?auto_304229 ) ) ( not ( = ?auto_304222 ?auto_304230 ) ) ( not ( = ?auto_304223 ?auto_304224 ) ) ( not ( = ?auto_304223 ?auto_304225 ) ) ( not ( = ?auto_304223 ?auto_304226 ) ) ( not ( = ?auto_304223 ?auto_304227 ) ) ( not ( = ?auto_304223 ?auto_304228 ) ) ( not ( = ?auto_304223 ?auto_304229 ) ) ( not ( = ?auto_304223 ?auto_304230 ) ) ( not ( = ?auto_304224 ?auto_304225 ) ) ( not ( = ?auto_304224 ?auto_304226 ) ) ( not ( = ?auto_304224 ?auto_304227 ) ) ( not ( = ?auto_304224 ?auto_304228 ) ) ( not ( = ?auto_304224 ?auto_304229 ) ) ( not ( = ?auto_304224 ?auto_304230 ) ) ( not ( = ?auto_304225 ?auto_304226 ) ) ( not ( = ?auto_304225 ?auto_304227 ) ) ( not ( = ?auto_304225 ?auto_304228 ) ) ( not ( = ?auto_304225 ?auto_304229 ) ) ( not ( = ?auto_304225 ?auto_304230 ) ) ( not ( = ?auto_304226 ?auto_304227 ) ) ( not ( = ?auto_304226 ?auto_304228 ) ) ( not ( = ?auto_304226 ?auto_304229 ) ) ( not ( = ?auto_304226 ?auto_304230 ) ) ( not ( = ?auto_304227 ?auto_304228 ) ) ( not ( = ?auto_304227 ?auto_304229 ) ) ( not ( = ?auto_304227 ?auto_304230 ) ) ( not ( = ?auto_304228 ?auto_304229 ) ) ( not ( = ?auto_304228 ?auto_304230 ) ) ( not ( = ?auto_304229 ?auto_304230 ) ) ( ON ?auto_304228 ?auto_304229 ) ( CLEAR ?auto_304226 ) ( ON ?auto_304227 ?auto_304228 ) ( CLEAR ?auto_304227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_304216 ?auto_304217 ?auto_304218 ?auto_304219 ?auto_304220 ?auto_304221 ?auto_304222 ?auto_304223 ?auto_304224 ?auto_304225 ?auto_304226 ?auto_304227 )
      ( MAKE-14PILE ?auto_304216 ?auto_304217 ?auto_304218 ?auto_304219 ?auto_304220 ?auto_304221 ?auto_304222 ?auto_304223 ?auto_304224 ?auto_304225 ?auto_304226 ?auto_304227 ?auto_304228 ?auto_304229 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304245 - BLOCK
      ?auto_304246 - BLOCK
      ?auto_304247 - BLOCK
      ?auto_304248 - BLOCK
      ?auto_304249 - BLOCK
      ?auto_304250 - BLOCK
      ?auto_304251 - BLOCK
      ?auto_304252 - BLOCK
      ?auto_304253 - BLOCK
      ?auto_304254 - BLOCK
      ?auto_304255 - BLOCK
      ?auto_304256 - BLOCK
      ?auto_304257 - BLOCK
      ?auto_304258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304258 ) ( ON-TABLE ?auto_304245 ) ( ON ?auto_304246 ?auto_304245 ) ( ON ?auto_304247 ?auto_304246 ) ( ON ?auto_304248 ?auto_304247 ) ( ON ?auto_304249 ?auto_304248 ) ( ON ?auto_304250 ?auto_304249 ) ( ON ?auto_304251 ?auto_304250 ) ( ON ?auto_304252 ?auto_304251 ) ( ON ?auto_304253 ?auto_304252 ) ( ON ?auto_304254 ?auto_304253 ) ( ON ?auto_304255 ?auto_304254 ) ( not ( = ?auto_304245 ?auto_304246 ) ) ( not ( = ?auto_304245 ?auto_304247 ) ) ( not ( = ?auto_304245 ?auto_304248 ) ) ( not ( = ?auto_304245 ?auto_304249 ) ) ( not ( = ?auto_304245 ?auto_304250 ) ) ( not ( = ?auto_304245 ?auto_304251 ) ) ( not ( = ?auto_304245 ?auto_304252 ) ) ( not ( = ?auto_304245 ?auto_304253 ) ) ( not ( = ?auto_304245 ?auto_304254 ) ) ( not ( = ?auto_304245 ?auto_304255 ) ) ( not ( = ?auto_304245 ?auto_304256 ) ) ( not ( = ?auto_304245 ?auto_304257 ) ) ( not ( = ?auto_304245 ?auto_304258 ) ) ( not ( = ?auto_304246 ?auto_304247 ) ) ( not ( = ?auto_304246 ?auto_304248 ) ) ( not ( = ?auto_304246 ?auto_304249 ) ) ( not ( = ?auto_304246 ?auto_304250 ) ) ( not ( = ?auto_304246 ?auto_304251 ) ) ( not ( = ?auto_304246 ?auto_304252 ) ) ( not ( = ?auto_304246 ?auto_304253 ) ) ( not ( = ?auto_304246 ?auto_304254 ) ) ( not ( = ?auto_304246 ?auto_304255 ) ) ( not ( = ?auto_304246 ?auto_304256 ) ) ( not ( = ?auto_304246 ?auto_304257 ) ) ( not ( = ?auto_304246 ?auto_304258 ) ) ( not ( = ?auto_304247 ?auto_304248 ) ) ( not ( = ?auto_304247 ?auto_304249 ) ) ( not ( = ?auto_304247 ?auto_304250 ) ) ( not ( = ?auto_304247 ?auto_304251 ) ) ( not ( = ?auto_304247 ?auto_304252 ) ) ( not ( = ?auto_304247 ?auto_304253 ) ) ( not ( = ?auto_304247 ?auto_304254 ) ) ( not ( = ?auto_304247 ?auto_304255 ) ) ( not ( = ?auto_304247 ?auto_304256 ) ) ( not ( = ?auto_304247 ?auto_304257 ) ) ( not ( = ?auto_304247 ?auto_304258 ) ) ( not ( = ?auto_304248 ?auto_304249 ) ) ( not ( = ?auto_304248 ?auto_304250 ) ) ( not ( = ?auto_304248 ?auto_304251 ) ) ( not ( = ?auto_304248 ?auto_304252 ) ) ( not ( = ?auto_304248 ?auto_304253 ) ) ( not ( = ?auto_304248 ?auto_304254 ) ) ( not ( = ?auto_304248 ?auto_304255 ) ) ( not ( = ?auto_304248 ?auto_304256 ) ) ( not ( = ?auto_304248 ?auto_304257 ) ) ( not ( = ?auto_304248 ?auto_304258 ) ) ( not ( = ?auto_304249 ?auto_304250 ) ) ( not ( = ?auto_304249 ?auto_304251 ) ) ( not ( = ?auto_304249 ?auto_304252 ) ) ( not ( = ?auto_304249 ?auto_304253 ) ) ( not ( = ?auto_304249 ?auto_304254 ) ) ( not ( = ?auto_304249 ?auto_304255 ) ) ( not ( = ?auto_304249 ?auto_304256 ) ) ( not ( = ?auto_304249 ?auto_304257 ) ) ( not ( = ?auto_304249 ?auto_304258 ) ) ( not ( = ?auto_304250 ?auto_304251 ) ) ( not ( = ?auto_304250 ?auto_304252 ) ) ( not ( = ?auto_304250 ?auto_304253 ) ) ( not ( = ?auto_304250 ?auto_304254 ) ) ( not ( = ?auto_304250 ?auto_304255 ) ) ( not ( = ?auto_304250 ?auto_304256 ) ) ( not ( = ?auto_304250 ?auto_304257 ) ) ( not ( = ?auto_304250 ?auto_304258 ) ) ( not ( = ?auto_304251 ?auto_304252 ) ) ( not ( = ?auto_304251 ?auto_304253 ) ) ( not ( = ?auto_304251 ?auto_304254 ) ) ( not ( = ?auto_304251 ?auto_304255 ) ) ( not ( = ?auto_304251 ?auto_304256 ) ) ( not ( = ?auto_304251 ?auto_304257 ) ) ( not ( = ?auto_304251 ?auto_304258 ) ) ( not ( = ?auto_304252 ?auto_304253 ) ) ( not ( = ?auto_304252 ?auto_304254 ) ) ( not ( = ?auto_304252 ?auto_304255 ) ) ( not ( = ?auto_304252 ?auto_304256 ) ) ( not ( = ?auto_304252 ?auto_304257 ) ) ( not ( = ?auto_304252 ?auto_304258 ) ) ( not ( = ?auto_304253 ?auto_304254 ) ) ( not ( = ?auto_304253 ?auto_304255 ) ) ( not ( = ?auto_304253 ?auto_304256 ) ) ( not ( = ?auto_304253 ?auto_304257 ) ) ( not ( = ?auto_304253 ?auto_304258 ) ) ( not ( = ?auto_304254 ?auto_304255 ) ) ( not ( = ?auto_304254 ?auto_304256 ) ) ( not ( = ?auto_304254 ?auto_304257 ) ) ( not ( = ?auto_304254 ?auto_304258 ) ) ( not ( = ?auto_304255 ?auto_304256 ) ) ( not ( = ?auto_304255 ?auto_304257 ) ) ( not ( = ?auto_304255 ?auto_304258 ) ) ( not ( = ?auto_304256 ?auto_304257 ) ) ( not ( = ?auto_304256 ?auto_304258 ) ) ( not ( = ?auto_304257 ?auto_304258 ) ) ( ON ?auto_304257 ?auto_304258 ) ( CLEAR ?auto_304255 ) ( ON ?auto_304256 ?auto_304257 ) ( CLEAR ?auto_304256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_304245 ?auto_304246 ?auto_304247 ?auto_304248 ?auto_304249 ?auto_304250 ?auto_304251 ?auto_304252 ?auto_304253 ?auto_304254 ?auto_304255 ?auto_304256 )
      ( MAKE-14PILE ?auto_304245 ?auto_304246 ?auto_304247 ?auto_304248 ?auto_304249 ?auto_304250 ?auto_304251 ?auto_304252 ?auto_304253 ?auto_304254 ?auto_304255 ?auto_304256 ?auto_304257 ?auto_304258 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304273 - BLOCK
      ?auto_304274 - BLOCK
      ?auto_304275 - BLOCK
      ?auto_304276 - BLOCK
      ?auto_304277 - BLOCK
      ?auto_304278 - BLOCK
      ?auto_304279 - BLOCK
      ?auto_304280 - BLOCK
      ?auto_304281 - BLOCK
      ?auto_304282 - BLOCK
      ?auto_304283 - BLOCK
      ?auto_304284 - BLOCK
      ?auto_304285 - BLOCK
      ?auto_304286 - BLOCK
    )
    :vars
    (
      ?auto_304287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304286 ?auto_304287 ) ( ON-TABLE ?auto_304273 ) ( ON ?auto_304274 ?auto_304273 ) ( ON ?auto_304275 ?auto_304274 ) ( ON ?auto_304276 ?auto_304275 ) ( ON ?auto_304277 ?auto_304276 ) ( ON ?auto_304278 ?auto_304277 ) ( ON ?auto_304279 ?auto_304278 ) ( ON ?auto_304280 ?auto_304279 ) ( ON ?auto_304281 ?auto_304280 ) ( ON ?auto_304282 ?auto_304281 ) ( not ( = ?auto_304273 ?auto_304274 ) ) ( not ( = ?auto_304273 ?auto_304275 ) ) ( not ( = ?auto_304273 ?auto_304276 ) ) ( not ( = ?auto_304273 ?auto_304277 ) ) ( not ( = ?auto_304273 ?auto_304278 ) ) ( not ( = ?auto_304273 ?auto_304279 ) ) ( not ( = ?auto_304273 ?auto_304280 ) ) ( not ( = ?auto_304273 ?auto_304281 ) ) ( not ( = ?auto_304273 ?auto_304282 ) ) ( not ( = ?auto_304273 ?auto_304283 ) ) ( not ( = ?auto_304273 ?auto_304284 ) ) ( not ( = ?auto_304273 ?auto_304285 ) ) ( not ( = ?auto_304273 ?auto_304286 ) ) ( not ( = ?auto_304273 ?auto_304287 ) ) ( not ( = ?auto_304274 ?auto_304275 ) ) ( not ( = ?auto_304274 ?auto_304276 ) ) ( not ( = ?auto_304274 ?auto_304277 ) ) ( not ( = ?auto_304274 ?auto_304278 ) ) ( not ( = ?auto_304274 ?auto_304279 ) ) ( not ( = ?auto_304274 ?auto_304280 ) ) ( not ( = ?auto_304274 ?auto_304281 ) ) ( not ( = ?auto_304274 ?auto_304282 ) ) ( not ( = ?auto_304274 ?auto_304283 ) ) ( not ( = ?auto_304274 ?auto_304284 ) ) ( not ( = ?auto_304274 ?auto_304285 ) ) ( not ( = ?auto_304274 ?auto_304286 ) ) ( not ( = ?auto_304274 ?auto_304287 ) ) ( not ( = ?auto_304275 ?auto_304276 ) ) ( not ( = ?auto_304275 ?auto_304277 ) ) ( not ( = ?auto_304275 ?auto_304278 ) ) ( not ( = ?auto_304275 ?auto_304279 ) ) ( not ( = ?auto_304275 ?auto_304280 ) ) ( not ( = ?auto_304275 ?auto_304281 ) ) ( not ( = ?auto_304275 ?auto_304282 ) ) ( not ( = ?auto_304275 ?auto_304283 ) ) ( not ( = ?auto_304275 ?auto_304284 ) ) ( not ( = ?auto_304275 ?auto_304285 ) ) ( not ( = ?auto_304275 ?auto_304286 ) ) ( not ( = ?auto_304275 ?auto_304287 ) ) ( not ( = ?auto_304276 ?auto_304277 ) ) ( not ( = ?auto_304276 ?auto_304278 ) ) ( not ( = ?auto_304276 ?auto_304279 ) ) ( not ( = ?auto_304276 ?auto_304280 ) ) ( not ( = ?auto_304276 ?auto_304281 ) ) ( not ( = ?auto_304276 ?auto_304282 ) ) ( not ( = ?auto_304276 ?auto_304283 ) ) ( not ( = ?auto_304276 ?auto_304284 ) ) ( not ( = ?auto_304276 ?auto_304285 ) ) ( not ( = ?auto_304276 ?auto_304286 ) ) ( not ( = ?auto_304276 ?auto_304287 ) ) ( not ( = ?auto_304277 ?auto_304278 ) ) ( not ( = ?auto_304277 ?auto_304279 ) ) ( not ( = ?auto_304277 ?auto_304280 ) ) ( not ( = ?auto_304277 ?auto_304281 ) ) ( not ( = ?auto_304277 ?auto_304282 ) ) ( not ( = ?auto_304277 ?auto_304283 ) ) ( not ( = ?auto_304277 ?auto_304284 ) ) ( not ( = ?auto_304277 ?auto_304285 ) ) ( not ( = ?auto_304277 ?auto_304286 ) ) ( not ( = ?auto_304277 ?auto_304287 ) ) ( not ( = ?auto_304278 ?auto_304279 ) ) ( not ( = ?auto_304278 ?auto_304280 ) ) ( not ( = ?auto_304278 ?auto_304281 ) ) ( not ( = ?auto_304278 ?auto_304282 ) ) ( not ( = ?auto_304278 ?auto_304283 ) ) ( not ( = ?auto_304278 ?auto_304284 ) ) ( not ( = ?auto_304278 ?auto_304285 ) ) ( not ( = ?auto_304278 ?auto_304286 ) ) ( not ( = ?auto_304278 ?auto_304287 ) ) ( not ( = ?auto_304279 ?auto_304280 ) ) ( not ( = ?auto_304279 ?auto_304281 ) ) ( not ( = ?auto_304279 ?auto_304282 ) ) ( not ( = ?auto_304279 ?auto_304283 ) ) ( not ( = ?auto_304279 ?auto_304284 ) ) ( not ( = ?auto_304279 ?auto_304285 ) ) ( not ( = ?auto_304279 ?auto_304286 ) ) ( not ( = ?auto_304279 ?auto_304287 ) ) ( not ( = ?auto_304280 ?auto_304281 ) ) ( not ( = ?auto_304280 ?auto_304282 ) ) ( not ( = ?auto_304280 ?auto_304283 ) ) ( not ( = ?auto_304280 ?auto_304284 ) ) ( not ( = ?auto_304280 ?auto_304285 ) ) ( not ( = ?auto_304280 ?auto_304286 ) ) ( not ( = ?auto_304280 ?auto_304287 ) ) ( not ( = ?auto_304281 ?auto_304282 ) ) ( not ( = ?auto_304281 ?auto_304283 ) ) ( not ( = ?auto_304281 ?auto_304284 ) ) ( not ( = ?auto_304281 ?auto_304285 ) ) ( not ( = ?auto_304281 ?auto_304286 ) ) ( not ( = ?auto_304281 ?auto_304287 ) ) ( not ( = ?auto_304282 ?auto_304283 ) ) ( not ( = ?auto_304282 ?auto_304284 ) ) ( not ( = ?auto_304282 ?auto_304285 ) ) ( not ( = ?auto_304282 ?auto_304286 ) ) ( not ( = ?auto_304282 ?auto_304287 ) ) ( not ( = ?auto_304283 ?auto_304284 ) ) ( not ( = ?auto_304283 ?auto_304285 ) ) ( not ( = ?auto_304283 ?auto_304286 ) ) ( not ( = ?auto_304283 ?auto_304287 ) ) ( not ( = ?auto_304284 ?auto_304285 ) ) ( not ( = ?auto_304284 ?auto_304286 ) ) ( not ( = ?auto_304284 ?auto_304287 ) ) ( not ( = ?auto_304285 ?auto_304286 ) ) ( not ( = ?auto_304285 ?auto_304287 ) ) ( not ( = ?auto_304286 ?auto_304287 ) ) ( ON ?auto_304285 ?auto_304286 ) ( ON ?auto_304284 ?auto_304285 ) ( CLEAR ?auto_304282 ) ( ON ?auto_304283 ?auto_304284 ) ( CLEAR ?auto_304283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_304273 ?auto_304274 ?auto_304275 ?auto_304276 ?auto_304277 ?auto_304278 ?auto_304279 ?auto_304280 ?auto_304281 ?auto_304282 ?auto_304283 )
      ( MAKE-14PILE ?auto_304273 ?auto_304274 ?auto_304275 ?auto_304276 ?auto_304277 ?auto_304278 ?auto_304279 ?auto_304280 ?auto_304281 ?auto_304282 ?auto_304283 ?auto_304284 ?auto_304285 ?auto_304286 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304302 - BLOCK
      ?auto_304303 - BLOCK
      ?auto_304304 - BLOCK
      ?auto_304305 - BLOCK
      ?auto_304306 - BLOCK
      ?auto_304307 - BLOCK
      ?auto_304308 - BLOCK
      ?auto_304309 - BLOCK
      ?auto_304310 - BLOCK
      ?auto_304311 - BLOCK
      ?auto_304312 - BLOCK
      ?auto_304313 - BLOCK
      ?auto_304314 - BLOCK
      ?auto_304315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304315 ) ( ON-TABLE ?auto_304302 ) ( ON ?auto_304303 ?auto_304302 ) ( ON ?auto_304304 ?auto_304303 ) ( ON ?auto_304305 ?auto_304304 ) ( ON ?auto_304306 ?auto_304305 ) ( ON ?auto_304307 ?auto_304306 ) ( ON ?auto_304308 ?auto_304307 ) ( ON ?auto_304309 ?auto_304308 ) ( ON ?auto_304310 ?auto_304309 ) ( ON ?auto_304311 ?auto_304310 ) ( not ( = ?auto_304302 ?auto_304303 ) ) ( not ( = ?auto_304302 ?auto_304304 ) ) ( not ( = ?auto_304302 ?auto_304305 ) ) ( not ( = ?auto_304302 ?auto_304306 ) ) ( not ( = ?auto_304302 ?auto_304307 ) ) ( not ( = ?auto_304302 ?auto_304308 ) ) ( not ( = ?auto_304302 ?auto_304309 ) ) ( not ( = ?auto_304302 ?auto_304310 ) ) ( not ( = ?auto_304302 ?auto_304311 ) ) ( not ( = ?auto_304302 ?auto_304312 ) ) ( not ( = ?auto_304302 ?auto_304313 ) ) ( not ( = ?auto_304302 ?auto_304314 ) ) ( not ( = ?auto_304302 ?auto_304315 ) ) ( not ( = ?auto_304303 ?auto_304304 ) ) ( not ( = ?auto_304303 ?auto_304305 ) ) ( not ( = ?auto_304303 ?auto_304306 ) ) ( not ( = ?auto_304303 ?auto_304307 ) ) ( not ( = ?auto_304303 ?auto_304308 ) ) ( not ( = ?auto_304303 ?auto_304309 ) ) ( not ( = ?auto_304303 ?auto_304310 ) ) ( not ( = ?auto_304303 ?auto_304311 ) ) ( not ( = ?auto_304303 ?auto_304312 ) ) ( not ( = ?auto_304303 ?auto_304313 ) ) ( not ( = ?auto_304303 ?auto_304314 ) ) ( not ( = ?auto_304303 ?auto_304315 ) ) ( not ( = ?auto_304304 ?auto_304305 ) ) ( not ( = ?auto_304304 ?auto_304306 ) ) ( not ( = ?auto_304304 ?auto_304307 ) ) ( not ( = ?auto_304304 ?auto_304308 ) ) ( not ( = ?auto_304304 ?auto_304309 ) ) ( not ( = ?auto_304304 ?auto_304310 ) ) ( not ( = ?auto_304304 ?auto_304311 ) ) ( not ( = ?auto_304304 ?auto_304312 ) ) ( not ( = ?auto_304304 ?auto_304313 ) ) ( not ( = ?auto_304304 ?auto_304314 ) ) ( not ( = ?auto_304304 ?auto_304315 ) ) ( not ( = ?auto_304305 ?auto_304306 ) ) ( not ( = ?auto_304305 ?auto_304307 ) ) ( not ( = ?auto_304305 ?auto_304308 ) ) ( not ( = ?auto_304305 ?auto_304309 ) ) ( not ( = ?auto_304305 ?auto_304310 ) ) ( not ( = ?auto_304305 ?auto_304311 ) ) ( not ( = ?auto_304305 ?auto_304312 ) ) ( not ( = ?auto_304305 ?auto_304313 ) ) ( not ( = ?auto_304305 ?auto_304314 ) ) ( not ( = ?auto_304305 ?auto_304315 ) ) ( not ( = ?auto_304306 ?auto_304307 ) ) ( not ( = ?auto_304306 ?auto_304308 ) ) ( not ( = ?auto_304306 ?auto_304309 ) ) ( not ( = ?auto_304306 ?auto_304310 ) ) ( not ( = ?auto_304306 ?auto_304311 ) ) ( not ( = ?auto_304306 ?auto_304312 ) ) ( not ( = ?auto_304306 ?auto_304313 ) ) ( not ( = ?auto_304306 ?auto_304314 ) ) ( not ( = ?auto_304306 ?auto_304315 ) ) ( not ( = ?auto_304307 ?auto_304308 ) ) ( not ( = ?auto_304307 ?auto_304309 ) ) ( not ( = ?auto_304307 ?auto_304310 ) ) ( not ( = ?auto_304307 ?auto_304311 ) ) ( not ( = ?auto_304307 ?auto_304312 ) ) ( not ( = ?auto_304307 ?auto_304313 ) ) ( not ( = ?auto_304307 ?auto_304314 ) ) ( not ( = ?auto_304307 ?auto_304315 ) ) ( not ( = ?auto_304308 ?auto_304309 ) ) ( not ( = ?auto_304308 ?auto_304310 ) ) ( not ( = ?auto_304308 ?auto_304311 ) ) ( not ( = ?auto_304308 ?auto_304312 ) ) ( not ( = ?auto_304308 ?auto_304313 ) ) ( not ( = ?auto_304308 ?auto_304314 ) ) ( not ( = ?auto_304308 ?auto_304315 ) ) ( not ( = ?auto_304309 ?auto_304310 ) ) ( not ( = ?auto_304309 ?auto_304311 ) ) ( not ( = ?auto_304309 ?auto_304312 ) ) ( not ( = ?auto_304309 ?auto_304313 ) ) ( not ( = ?auto_304309 ?auto_304314 ) ) ( not ( = ?auto_304309 ?auto_304315 ) ) ( not ( = ?auto_304310 ?auto_304311 ) ) ( not ( = ?auto_304310 ?auto_304312 ) ) ( not ( = ?auto_304310 ?auto_304313 ) ) ( not ( = ?auto_304310 ?auto_304314 ) ) ( not ( = ?auto_304310 ?auto_304315 ) ) ( not ( = ?auto_304311 ?auto_304312 ) ) ( not ( = ?auto_304311 ?auto_304313 ) ) ( not ( = ?auto_304311 ?auto_304314 ) ) ( not ( = ?auto_304311 ?auto_304315 ) ) ( not ( = ?auto_304312 ?auto_304313 ) ) ( not ( = ?auto_304312 ?auto_304314 ) ) ( not ( = ?auto_304312 ?auto_304315 ) ) ( not ( = ?auto_304313 ?auto_304314 ) ) ( not ( = ?auto_304313 ?auto_304315 ) ) ( not ( = ?auto_304314 ?auto_304315 ) ) ( ON ?auto_304314 ?auto_304315 ) ( ON ?auto_304313 ?auto_304314 ) ( CLEAR ?auto_304311 ) ( ON ?auto_304312 ?auto_304313 ) ( CLEAR ?auto_304312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_304302 ?auto_304303 ?auto_304304 ?auto_304305 ?auto_304306 ?auto_304307 ?auto_304308 ?auto_304309 ?auto_304310 ?auto_304311 ?auto_304312 )
      ( MAKE-14PILE ?auto_304302 ?auto_304303 ?auto_304304 ?auto_304305 ?auto_304306 ?auto_304307 ?auto_304308 ?auto_304309 ?auto_304310 ?auto_304311 ?auto_304312 ?auto_304313 ?auto_304314 ?auto_304315 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304330 - BLOCK
      ?auto_304331 - BLOCK
      ?auto_304332 - BLOCK
      ?auto_304333 - BLOCK
      ?auto_304334 - BLOCK
      ?auto_304335 - BLOCK
      ?auto_304336 - BLOCK
      ?auto_304337 - BLOCK
      ?auto_304338 - BLOCK
      ?auto_304339 - BLOCK
      ?auto_304340 - BLOCK
      ?auto_304341 - BLOCK
      ?auto_304342 - BLOCK
      ?auto_304343 - BLOCK
    )
    :vars
    (
      ?auto_304344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304343 ?auto_304344 ) ( ON-TABLE ?auto_304330 ) ( ON ?auto_304331 ?auto_304330 ) ( ON ?auto_304332 ?auto_304331 ) ( ON ?auto_304333 ?auto_304332 ) ( ON ?auto_304334 ?auto_304333 ) ( ON ?auto_304335 ?auto_304334 ) ( ON ?auto_304336 ?auto_304335 ) ( ON ?auto_304337 ?auto_304336 ) ( ON ?auto_304338 ?auto_304337 ) ( not ( = ?auto_304330 ?auto_304331 ) ) ( not ( = ?auto_304330 ?auto_304332 ) ) ( not ( = ?auto_304330 ?auto_304333 ) ) ( not ( = ?auto_304330 ?auto_304334 ) ) ( not ( = ?auto_304330 ?auto_304335 ) ) ( not ( = ?auto_304330 ?auto_304336 ) ) ( not ( = ?auto_304330 ?auto_304337 ) ) ( not ( = ?auto_304330 ?auto_304338 ) ) ( not ( = ?auto_304330 ?auto_304339 ) ) ( not ( = ?auto_304330 ?auto_304340 ) ) ( not ( = ?auto_304330 ?auto_304341 ) ) ( not ( = ?auto_304330 ?auto_304342 ) ) ( not ( = ?auto_304330 ?auto_304343 ) ) ( not ( = ?auto_304330 ?auto_304344 ) ) ( not ( = ?auto_304331 ?auto_304332 ) ) ( not ( = ?auto_304331 ?auto_304333 ) ) ( not ( = ?auto_304331 ?auto_304334 ) ) ( not ( = ?auto_304331 ?auto_304335 ) ) ( not ( = ?auto_304331 ?auto_304336 ) ) ( not ( = ?auto_304331 ?auto_304337 ) ) ( not ( = ?auto_304331 ?auto_304338 ) ) ( not ( = ?auto_304331 ?auto_304339 ) ) ( not ( = ?auto_304331 ?auto_304340 ) ) ( not ( = ?auto_304331 ?auto_304341 ) ) ( not ( = ?auto_304331 ?auto_304342 ) ) ( not ( = ?auto_304331 ?auto_304343 ) ) ( not ( = ?auto_304331 ?auto_304344 ) ) ( not ( = ?auto_304332 ?auto_304333 ) ) ( not ( = ?auto_304332 ?auto_304334 ) ) ( not ( = ?auto_304332 ?auto_304335 ) ) ( not ( = ?auto_304332 ?auto_304336 ) ) ( not ( = ?auto_304332 ?auto_304337 ) ) ( not ( = ?auto_304332 ?auto_304338 ) ) ( not ( = ?auto_304332 ?auto_304339 ) ) ( not ( = ?auto_304332 ?auto_304340 ) ) ( not ( = ?auto_304332 ?auto_304341 ) ) ( not ( = ?auto_304332 ?auto_304342 ) ) ( not ( = ?auto_304332 ?auto_304343 ) ) ( not ( = ?auto_304332 ?auto_304344 ) ) ( not ( = ?auto_304333 ?auto_304334 ) ) ( not ( = ?auto_304333 ?auto_304335 ) ) ( not ( = ?auto_304333 ?auto_304336 ) ) ( not ( = ?auto_304333 ?auto_304337 ) ) ( not ( = ?auto_304333 ?auto_304338 ) ) ( not ( = ?auto_304333 ?auto_304339 ) ) ( not ( = ?auto_304333 ?auto_304340 ) ) ( not ( = ?auto_304333 ?auto_304341 ) ) ( not ( = ?auto_304333 ?auto_304342 ) ) ( not ( = ?auto_304333 ?auto_304343 ) ) ( not ( = ?auto_304333 ?auto_304344 ) ) ( not ( = ?auto_304334 ?auto_304335 ) ) ( not ( = ?auto_304334 ?auto_304336 ) ) ( not ( = ?auto_304334 ?auto_304337 ) ) ( not ( = ?auto_304334 ?auto_304338 ) ) ( not ( = ?auto_304334 ?auto_304339 ) ) ( not ( = ?auto_304334 ?auto_304340 ) ) ( not ( = ?auto_304334 ?auto_304341 ) ) ( not ( = ?auto_304334 ?auto_304342 ) ) ( not ( = ?auto_304334 ?auto_304343 ) ) ( not ( = ?auto_304334 ?auto_304344 ) ) ( not ( = ?auto_304335 ?auto_304336 ) ) ( not ( = ?auto_304335 ?auto_304337 ) ) ( not ( = ?auto_304335 ?auto_304338 ) ) ( not ( = ?auto_304335 ?auto_304339 ) ) ( not ( = ?auto_304335 ?auto_304340 ) ) ( not ( = ?auto_304335 ?auto_304341 ) ) ( not ( = ?auto_304335 ?auto_304342 ) ) ( not ( = ?auto_304335 ?auto_304343 ) ) ( not ( = ?auto_304335 ?auto_304344 ) ) ( not ( = ?auto_304336 ?auto_304337 ) ) ( not ( = ?auto_304336 ?auto_304338 ) ) ( not ( = ?auto_304336 ?auto_304339 ) ) ( not ( = ?auto_304336 ?auto_304340 ) ) ( not ( = ?auto_304336 ?auto_304341 ) ) ( not ( = ?auto_304336 ?auto_304342 ) ) ( not ( = ?auto_304336 ?auto_304343 ) ) ( not ( = ?auto_304336 ?auto_304344 ) ) ( not ( = ?auto_304337 ?auto_304338 ) ) ( not ( = ?auto_304337 ?auto_304339 ) ) ( not ( = ?auto_304337 ?auto_304340 ) ) ( not ( = ?auto_304337 ?auto_304341 ) ) ( not ( = ?auto_304337 ?auto_304342 ) ) ( not ( = ?auto_304337 ?auto_304343 ) ) ( not ( = ?auto_304337 ?auto_304344 ) ) ( not ( = ?auto_304338 ?auto_304339 ) ) ( not ( = ?auto_304338 ?auto_304340 ) ) ( not ( = ?auto_304338 ?auto_304341 ) ) ( not ( = ?auto_304338 ?auto_304342 ) ) ( not ( = ?auto_304338 ?auto_304343 ) ) ( not ( = ?auto_304338 ?auto_304344 ) ) ( not ( = ?auto_304339 ?auto_304340 ) ) ( not ( = ?auto_304339 ?auto_304341 ) ) ( not ( = ?auto_304339 ?auto_304342 ) ) ( not ( = ?auto_304339 ?auto_304343 ) ) ( not ( = ?auto_304339 ?auto_304344 ) ) ( not ( = ?auto_304340 ?auto_304341 ) ) ( not ( = ?auto_304340 ?auto_304342 ) ) ( not ( = ?auto_304340 ?auto_304343 ) ) ( not ( = ?auto_304340 ?auto_304344 ) ) ( not ( = ?auto_304341 ?auto_304342 ) ) ( not ( = ?auto_304341 ?auto_304343 ) ) ( not ( = ?auto_304341 ?auto_304344 ) ) ( not ( = ?auto_304342 ?auto_304343 ) ) ( not ( = ?auto_304342 ?auto_304344 ) ) ( not ( = ?auto_304343 ?auto_304344 ) ) ( ON ?auto_304342 ?auto_304343 ) ( ON ?auto_304341 ?auto_304342 ) ( ON ?auto_304340 ?auto_304341 ) ( CLEAR ?auto_304338 ) ( ON ?auto_304339 ?auto_304340 ) ( CLEAR ?auto_304339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_304330 ?auto_304331 ?auto_304332 ?auto_304333 ?auto_304334 ?auto_304335 ?auto_304336 ?auto_304337 ?auto_304338 ?auto_304339 )
      ( MAKE-14PILE ?auto_304330 ?auto_304331 ?auto_304332 ?auto_304333 ?auto_304334 ?auto_304335 ?auto_304336 ?auto_304337 ?auto_304338 ?auto_304339 ?auto_304340 ?auto_304341 ?auto_304342 ?auto_304343 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304359 - BLOCK
      ?auto_304360 - BLOCK
      ?auto_304361 - BLOCK
      ?auto_304362 - BLOCK
      ?auto_304363 - BLOCK
      ?auto_304364 - BLOCK
      ?auto_304365 - BLOCK
      ?auto_304366 - BLOCK
      ?auto_304367 - BLOCK
      ?auto_304368 - BLOCK
      ?auto_304369 - BLOCK
      ?auto_304370 - BLOCK
      ?auto_304371 - BLOCK
      ?auto_304372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304372 ) ( ON-TABLE ?auto_304359 ) ( ON ?auto_304360 ?auto_304359 ) ( ON ?auto_304361 ?auto_304360 ) ( ON ?auto_304362 ?auto_304361 ) ( ON ?auto_304363 ?auto_304362 ) ( ON ?auto_304364 ?auto_304363 ) ( ON ?auto_304365 ?auto_304364 ) ( ON ?auto_304366 ?auto_304365 ) ( ON ?auto_304367 ?auto_304366 ) ( not ( = ?auto_304359 ?auto_304360 ) ) ( not ( = ?auto_304359 ?auto_304361 ) ) ( not ( = ?auto_304359 ?auto_304362 ) ) ( not ( = ?auto_304359 ?auto_304363 ) ) ( not ( = ?auto_304359 ?auto_304364 ) ) ( not ( = ?auto_304359 ?auto_304365 ) ) ( not ( = ?auto_304359 ?auto_304366 ) ) ( not ( = ?auto_304359 ?auto_304367 ) ) ( not ( = ?auto_304359 ?auto_304368 ) ) ( not ( = ?auto_304359 ?auto_304369 ) ) ( not ( = ?auto_304359 ?auto_304370 ) ) ( not ( = ?auto_304359 ?auto_304371 ) ) ( not ( = ?auto_304359 ?auto_304372 ) ) ( not ( = ?auto_304360 ?auto_304361 ) ) ( not ( = ?auto_304360 ?auto_304362 ) ) ( not ( = ?auto_304360 ?auto_304363 ) ) ( not ( = ?auto_304360 ?auto_304364 ) ) ( not ( = ?auto_304360 ?auto_304365 ) ) ( not ( = ?auto_304360 ?auto_304366 ) ) ( not ( = ?auto_304360 ?auto_304367 ) ) ( not ( = ?auto_304360 ?auto_304368 ) ) ( not ( = ?auto_304360 ?auto_304369 ) ) ( not ( = ?auto_304360 ?auto_304370 ) ) ( not ( = ?auto_304360 ?auto_304371 ) ) ( not ( = ?auto_304360 ?auto_304372 ) ) ( not ( = ?auto_304361 ?auto_304362 ) ) ( not ( = ?auto_304361 ?auto_304363 ) ) ( not ( = ?auto_304361 ?auto_304364 ) ) ( not ( = ?auto_304361 ?auto_304365 ) ) ( not ( = ?auto_304361 ?auto_304366 ) ) ( not ( = ?auto_304361 ?auto_304367 ) ) ( not ( = ?auto_304361 ?auto_304368 ) ) ( not ( = ?auto_304361 ?auto_304369 ) ) ( not ( = ?auto_304361 ?auto_304370 ) ) ( not ( = ?auto_304361 ?auto_304371 ) ) ( not ( = ?auto_304361 ?auto_304372 ) ) ( not ( = ?auto_304362 ?auto_304363 ) ) ( not ( = ?auto_304362 ?auto_304364 ) ) ( not ( = ?auto_304362 ?auto_304365 ) ) ( not ( = ?auto_304362 ?auto_304366 ) ) ( not ( = ?auto_304362 ?auto_304367 ) ) ( not ( = ?auto_304362 ?auto_304368 ) ) ( not ( = ?auto_304362 ?auto_304369 ) ) ( not ( = ?auto_304362 ?auto_304370 ) ) ( not ( = ?auto_304362 ?auto_304371 ) ) ( not ( = ?auto_304362 ?auto_304372 ) ) ( not ( = ?auto_304363 ?auto_304364 ) ) ( not ( = ?auto_304363 ?auto_304365 ) ) ( not ( = ?auto_304363 ?auto_304366 ) ) ( not ( = ?auto_304363 ?auto_304367 ) ) ( not ( = ?auto_304363 ?auto_304368 ) ) ( not ( = ?auto_304363 ?auto_304369 ) ) ( not ( = ?auto_304363 ?auto_304370 ) ) ( not ( = ?auto_304363 ?auto_304371 ) ) ( not ( = ?auto_304363 ?auto_304372 ) ) ( not ( = ?auto_304364 ?auto_304365 ) ) ( not ( = ?auto_304364 ?auto_304366 ) ) ( not ( = ?auto_304364 ?auto_304367 ) ) ( not ( = ?auto_304364 ?auto_304368 ) ) ( not ( = ?auto_304364 ?auto_304369 ) ) ( not ( = ?auto_304364 ?auto_304370 ) ) ( not ( = ?auto_304364 ?auto_304371 ) ) ( not ( = ?auto_304364 ?auto_304372 ) ) ( not ( = ?auto_304365 ?auto_304366 ) ) ( not ( = ?auto_304365 ?auto_304367 ) ) ( not ( = ?auto_304365 ?auto_304368 ) ) ( not ( = ?auto_304365 ?auto_304369 ) ) ( not ( = ?auto_304365 ?auto_304370 ) ) ( not ( = ?auto_304365 ?auto_304371 ) ) ( not ( = ?auto_304365 ?auto_304372 ) ) ( not ( = ?auto_304366 ?auto_304367 ) ) ( not ( = ?auto_304366 ?auto_304368 ) ) ( not ( = ?auto_304366 ?auto_304369 ) ) ( not ( = ?auto_304366 ?auto_304370 ) ) ( not ( = ?auto_304366 ?auto_304371 ) ) ( not ( = ?auto_304366 ?auto_304372 ) ) ( not ( = ?auto_304367 ?auto_304368 ) ) ( not ( = ?auto_304367 ?auto_304369 ) ) ( not ( = ?auto_304367 ?auto_304370 ) ) ( not ( = ?auto_304367 ?auto_304371 ) ) ( not ( = ?auto_304367 ?auto_304372 ) ) ( not ( = ?auto_304368 ?auto_304369 ) ) ( not ( = ?auto_304368 ?auto_304370 ) ) ( not ( = ?auto_304368 ?auto_304371 ) ) ( not ( = ?auto_304368 ?auto_304372 ) ) ( not ( = ?auto_304369 ?auto_304370 ) ) ( not ( = ?auto_304369 ?auto_304371 ) ) ( not ( = ?auto_304369 ?auto_304372 ) ) ( not ( = ?auto_304370 ?auto_304371 ) ) ( not ( = ?auto_304370 ?auto_304372 ) ) ( not ( = ?auto_304371 ?auto_304372 ) ) ( ON ?auto_304371 ?auto_304372 ) ( ON ?auto_304370 ?auto_304371 ) ( ON ?auto_304369 ?auto_304370 ) ( CLEAR ?auto_304367 ) ( ON ?auto_304368 ?auto_304369 ) ( CLEAR ?auto_304368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_304359 ?auto_304360 ?auto_304361 ?auto_304362 ?auto_304363 ?auto_304364 ?auto_304365 ?auto_304366 ?auto_304367 ?auto_304368 )
      ( MAKE-14PILE ?auto_304359 ?auto_304360 ?auto_304361 ?auto_304362 ?auto_304363 ?auto_304364 ?auto_304365 ?auto_304366 ?auto_304367 ?auto_304368 ?auto_304369 ?auto_304370 ?auto_304371 ?auto_304372 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304387 - BLOCK
      ?auto_304388 - BLOCK
      ?auto_304389 - BLOCK
      ?auto_304390 - BLOCK
      ?auto_304391 - BLOCK
      ?auto_304392 - BLOCK
      ?auto_304393 - BLOCK
      ?auto_304394 - BLOCK
      ?auto_304395 - BLOCK
      ?auto_304396 - BLOCK
      ?auto_304397 - BLOCK
      ?auto_304398 - BLOCK
      ?auto_304399 - BLOCK
      ?auto_304400 - BLOCK
    )
    :vars
    (
      ?auto_304401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304400 ?auto_304401 ) ( ON-TABLE ?auto_304387 ) ( ON ?auto_304388 ?auto_304387 ) ( ON ?auto_304389 ?auto_304388 ) ( ON ?auto_304390 ?auto_304389 ) ( ON ?auto_304391 ?auto_304390 ) ( ON ?auto_304392 ?auto_304391 ) ( ON ?auto_304393 ?auto_304392 ) ( ON ?auto_304394 ?auto_304393 ) ( not ( = ?auto_304387 ?auto_304388 ) ) ( not ( = ?auto_304387 ?auto_304389 ) ) ( not ( = ?auto_304387 ?auto_304390 ) ) ( not ( = ?auto_304387 ?auto_304391 ) ) ( not ( = ?auto_304387 ?auto_304392 ) ) ( not ( = ?auto_304387 ?auto_304393 ) ) ( not ( = ?auto_304387 ?auto_304394 ) ) ( not ( = ?auto_304387 ?auto_304395 ) ) ( not ( = ?auto_304387 ?auto_304396 ) ) ( not ( = ?auto_304387 ?auto_304397 ) ) ( not ( = ?auto_304387 ?auto_304398 ) ) ( not ( = ?auto_304387 ?auto_304399 ) ) ( not ( = ?auto_304387 ?auto_304400 ) ) ( not ( = ?auto_304387 ?auto_304401 ) ) ( not ( = ?auto_304388 ?auto_304389 ) ) ( not ( = ?auto_304388 ?auto_304390 ) ) ( not ( = ?auto_304388 ?auto_304391 ) ) ( not ( = ?auto_304388 ?auto_304392 ) ) ( not ( = ?auto_304388 ?auto_304393 ) ) ( not ( = ?auto_304388 ?auto_304394 ) ) ( not ( = ?auto_304388 ?auto_304395 ) ) ( not ( = ?auto_304388 ?auto_304396 ) ) ( not ( = ?auto_304388 ?auto_304397 ) ) ( not ( = ?auto_304388 ?auto_304398 ) ) ( not ( = ?auto_304388 ?auto_304399 ) ) ( not ( = ?auto_304388 ?auto_304400 ) ) ( not ( = ?auto_304388 ?auto_304401 ) ) ( not ( = ?auto_304389 ?auto_304390 ) ) ( not ( = ?auto_304389 ?auto_304391 ) ) ( not ( = ?auto_304389 ?auto_304392 ) ) ( not ( = ?auto_304389 ?auto_304393 ) ) ( not ( = ?auto_304389 ?auto_304394 ) ) ( not ( = ?auto_304389 ?auto_304395 ) ) ( not ( = ?auto_304389 ?auto_304396 ) ) ( not ( = ?auto_304389 ?auto_304397 ) ) ( not ( = ?auto_304389 ?auto_304398 ) ) ( not ( = ?auto_304389 ?auto_304399 ) ) ( not ( = ?auto_304389 ?auto_304400 ) ) ( not ( = ?auto_304389 ?auto_304401 ) ) ( not ( = ?auto_304390 ?auto_304391 ) ) ( not ( = ?auto_304390 ?auto_304392 ) ) ( not ( = ?auto_304390 ?auto_304393 ) ) ( not ( = ?auto_304390 ?auto_304394 ) ) ( not ( = ?auto_304390 ?auto_304395 ) ) ( not ( = ?auto_304390 ?auto_304396 ) ) ( not ( = ?auto_304390 ?auto_304397 ) ) ( not ( = ?auto_304390 ?auto_304398 ) ) ( not ( = ?auto_304390 ?auto_304399 ) ) ( not ( = ?auto_304390 ?auto_304400 ) ) ( not ( = ?auto_304390 ?auto_304401 ) ) ( not ( = ?auto_304391 ?auto_304392 ) ) ( not ( = ?auto_304391 ?auto_304393 ) ) ( not ( = ?auto_304391 ?auto_304394 ) ) ( not ( = ?auto_304391 ?auto_304395 ) ) ( not ( = ?auto_304391 ?auto_304396 ) ) ( not ( = ?auto_304391 ?auto_304397 ) ) ( not ( = ?auto_304391 ?auto_304398 ) ) ( not ( = ?auto_304391 ?auto_304399 ) ) ( not ( = ?auto_304391 ?auto_304400 ) ) ( not ( = ?auto_304391 ?auto_304401 ) ) ( not ( = ?auto_304392 ?auto_304393 ) ) ( not ( = ?auto_304392 ?auto_304394 ) ) ( not ( = ?auto_304392 ?auto_304395 ) ) ( not ( = ?auto_304392 ?auto_304396 ) ) ( not ( = ?auto_304392 ?auto_304397 ) ) ( not ( = ?auto_304392 ?auto_304398 ) ) ( not ( = ?auto_304392 ?auto_304399 ) ) ( not ( = ?auto_304392 ?auto_304400 ) ) ( not ( = ?auto_304392 ?auto_304401 ) ) ( not ( = ?auto_304393 ?auto_304394 ) ) ( not ( = ?auto_304393 ?auto_304395 ) ) ( not ( = ?auto_304393 ?auto_304396 ) ) ( not ( = ?auto_304393 ?auto_304397 ) ) ( not ( = ?auto_304393 ?auto_304398 ) ) ( not ( = ?auto_304393 ?auto_304399 ) ) ( not ( = ?auto_304393 ?auto_304400 ) ) ( not ( = ?auto_304393 ?auto_304401 ) ) ( not ( = ?auto_304394 ?auto_304395 ) ) ( not ( = ?auto_304394 ?auto_304396 ) ) ( not ( = ?auto_304394 ?auto_304397 ) ) ( not ( = ?auto_304394 ?auto_304398 ) ) ( not ( = ?auto_304394 ?auto_304399 ) ) ( not ( = ?auto_304394 ?auto_304400 ) ) ( not ( = ?auto_304394 ?auto_304401 ) ) ( not ( = ?auto_304395 ?auto_304396 ) ) ( not ( = ?auto_304395 ?auto_304397 ) ) ( not ( = ?auto_304395 ?auto_304398 ) ) ( not ( = ?auto_304395 ?auto_304399 ) ) ( not ( = ?auto_304395 ?auto_304400 ) ) ( not ( = ?auto_304395 ?auto_304401 ) ) ( not ( = ?auto_304396 ?auto_304397 ) ) ( not ( = ?auto_304396 ?auto_304398 ) ) ( not ( = ?auto_304396 ?auto_304399 ) ) ( not ( = ?auto_304396 ?auto_304400 ) ) ( not ( = ?auto_304396 ?auto_304401 ) ) ( not ( = ?auto_304397 ?auto_304398 ) ) ( not ( = ?auto_304397 ?auto_304399 ) ) ( not ( = ?auto_304397 ?auto_304400 ) ) ( not ( = ?auto_304397 ?auto_304401 ) ) ( not ( = ?auto_304398 ?auto_304399 ) ) ( not ( = ?auto_304398 ?auto_304400 ) ) ( not ( = ?auto_304398 ?auto_304401 ) ) ( not ( = ?auto_304399 ?auto_304400 ) ) ( not ( = ?auto_304399 ?auto_304401 ) ) ( not ( = ?auto_304400 ?auto_304401 ) ) ( ON ?auto_304399 ?auto_304400 ) ( ON ?auto_304398 ?auto_304399 ) ( ON ?auto_304397 ?auto_304398 ) ( ON ?auto_304396 ?auto_304397 ) ( CLEAR ?auto_304394 ) ( ON ?auto_304395 ?auto_304396 ) ( CLEAR ?auto_304395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_304387 ?auto_304388 ?auto_304389 ?auto_304390 ?auto_304391 ?auto_304392 ?auto_304393 ?auto_304394 ?auto_304395 )
      ( MAKE-14PILE ?auto_304387 ?auto_304388 ?auto_304389 ?auto_304390 ?auto_304391 ?auto_304392 ?auto_304393 ?auto_304394 ?auto_304395 ?auto_304396 ?auto_304397 ?auto_304398 ?auto_304399 ?auto_304400 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304416 - BLOCK
      ?auto_304417 - BLOCK
      ?auto_304418 - BLOCK
      ?auto_304419 - BLOCK
      ?auto_304420 - BLOCK
      ?auto_304421 - BLOCK
      ?auto_304422 - BLOCK
      ?auto_304423 - BLOCK
      ?auto_304424 - BLOCK
      ?auto_304425 - BLOCK
      ?auto_304426 - BLOCK
      ?auto_304427 - BLOCK
      ?auto_304428 - BLOCK
      ?auto_304429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304429 ) ( ON-TABLE ?auto_304416 ) ( ON ?auto_304417 ?auto_304416 ) ( ON ?auto_304418 ?auto_304417 ) ( ON ?auto_304419 ?auto_304418 ) ( ON ?auto_304420 ?auto_304419 ) ( ON ?auto_304421 ?auto_304420 ) ( ON ?auto_304422 ?auto_304421 ) ( ON ?auto_304423 ?auto_304422 ) ( not ( = ?auto_304416 ?auto_304417 ) ) ( not ( = ?auto_304416 ?auto_304418 ) ) ( not ( = ?auto_304416 ?auto_304419 ) ) ( not ( = ?auto_304416 ?auto_304420 ) ) ( not ( = ?auto_304416 ?auto_304421 ) ) ( not ( = ?auto_304416 ?auto_304422 ) ) ( not ( = ?auto_304416 ?auto_304423 ) ) ( not ( = ?auto_304416 ?auto_304424 ) ) ( not ( = ?auto_304416 ?auto_304425 ) ) ( not ( = ?auto_304416 ?auto_304426 ) ) ( not ( = ?auto_304416 ?auto_304427 ) ) ( not ( = ?auto_304416 ?auto_304428 ) ) ( not ( = ?auto_304416 ?auto_304429 ) ) ( not ( = ?auto_304417 ?auto_304418 ) ) ( not ( = ?auto_304417 ?auto_304419 ) ) ( not ( = ?auto_304417 ?auto_304420 ) ) ( not ( = ?auto_304417 ?auto_304421 ) ) ( not ( = ?auto_304417 ?auto_304422 ) ) ( not ( = ?auto_304417 ?auto_304423 ) ) ( not ( = ?auto_304417 ?auto_304424 ) ) ( not ( = ?auto_304417 ?auto_304425 ) ) ( not ( = ?auto_304417 ?auto_304426 ) ) ( not ( = ?auto_304417 ?auto_304427 ) ) ( not ( = ?auto_304417 ?auto_304428 ) ) ( not ( = ?auto_304417 ?auto_304429 ) ) ( not ( = ?auto_304418 ?auto_304419 ) ) ( not ( = ?auto_304418 ?auto_304420 ) ) ( not ( = ?auto_304418 ?auto_304421 ) ) ( not ( = ?auto_304418 ?auto_304422 ) ) ( not ( = ?auto_304418 ?auto_304423 ) ) ( not ( = ?auto_304418 ?auto_304424 ) ) ( not ( = ?auto_304418 ?auto_304425 ) ) ( not ( = ?auto_304418 ?auto_304426 ) ) ( not ( = ?auto_304418 ?auto_304427 ) ) ( not ( = ?auto_304418 ?auto_304428 ) ) ( not ( = ?auto_304418 ?auto_304429 ) ) ( not ( = ?auto_304419 ?auto_304420 ) ) ( not ( = ?auto_304419 ?auto_304421 ) ) ( not ( = ?auto_304419 ?auto_304422 ) ) ( not ( = ?auto_304419 ?auto_304423 ) ) ( not ( = ?auto_304419 ?auto_304424 ) ) ( not ( = ?auto_304419 ?auto_304425 ) ) ( not ( = ?auto_304419 ?auto_304426 ) ) ( not ( = ?auto_304419 ?auto_304427 ) ) ( not ( = ?auto_304419 ?auto_304428 ) ) ( not ( = ?auto_304419 ?auto_304429 ) ) ( not ( = ?auto_304420 ?auto_304421 ) ) ( not ( = ?auto_304420 ?auto_304422 ) ) ( not ( = ?auto_304420 ?auto_304423 ) ) ( not ( = ?auto_304420 ?auto_304424 ) ) ( not ( = ?auto_304420 ?auto_304425 ) ) ( not ( = ?auto_304420 ?auto_304426 ) ) ( not ( = ?auto_304420 ?auto_304427 ) ) ( not ( = ?auto_304420 ?auto_304428 ) ) ( not ( = ?auto_304420 ?auto_304429 ) ) ( not ( = ?auto_304421 ?auto_304422 ) ) ( not ( = ?auto_304421 ?auto_304423 ) ) ( not ( = ?auto_304421 ?auto_304424 ) ) ( not ( = ?auto_304421 ?auto_304425 ) ) ( not ( = ?auto_304421 ?auto_304426 ) ) ( not ( = ?auto_304421 ?auto_304427 ) ) ( not ( = ?auto_304421 ?auto_304428 ) ) ( not ( = ?auto_304421 ?auto_304429 ) ) ( not ( = ?auto_304422 ?auto_304423 ) ) ( not ( = ?auto_304422 ?auto_304424 ) ) ( not ( = ?auto_304422 ?auto_304425 ) ) ( not ( = ?auto_304422 ?auto_304426 ) ) ( not ( = ?auto_304422 ?auto_304427 ) ) ( not ( = ?auto_304422 ?auto_304428 ) ) ( not ( = ?auto_304422 ?auto_304429 ) ) ( not ( = ?auto_304423 ?auto_304424 ) ) ( not ( = ?auto_304423 ?auto_304425 ) ) ( not ( = ?auto_304423 ?auto_304426 ) ) ( not ( = ?auto_304423 ?auto_304427 ) ) ( not ( = ?auto_304423 ?auto_304428 ) ) ( not ( = ?auto_304423 ?auto_304429 ) ) ( not ( = ?auto_304424 ?auto_304425 ) ) ( not ( = ?auto_304424 ?auto_304426 ) ) ( not ( = ?auto_304424 ?auto_304427 ) ) ( not ( = ?auto_304424 ?auto_304428 ) ) ( not ( = ?auto_304424 ?auto_304429 ) ) ( not ( = ?auto_304425 ?auto_304426 ) ) ( not ( = ?auto_304425 ?auto_304427 ) ) ( not ( = ?auto_304425 ?auto_304428 ) ) ( not ( = ?auto_304425 ?auto_304429 ) ) ( not ( = ?auto_304426 ?auto_304427 ) ) ( not ( = ?auto_304426 ?auto_304428 ) ) ( not ( = ?auto_304426 ?auto_304429 ) ) ( not ( = ?auto_304427 ?auto_304428 ) ) ( not ( = ?auto_304427 ?auto_304429 ) ) ( not ( = ?auto_304428 ?auto_304429 ) ) ( ON ?auto_304428 ?auto_304429 ) ( ON ?auto_304427 ?auto_304428 ) ( ON ?auto_304426 ?auto_304427 ) ( ON ?auto_304425 ?auto_304426 ) ( CLEAR ?auto_304423 ) ( ON ?auto_304424 ?auto_304425 ) ( CLEAR ?auto_304424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_304416 ?auto_304417 ?auto_304418 ?auto_304419 ?auto_304420 ?auto_304421 ?auto_304422 ?auto_304423 ?auto_304424 )
      ( MAKE-14PILE ?auto_304416 ?auto_304417 ?auto_304418 ?auto_304419 ?auto_304420 ?auto_304421 ?auto_304422 ?auto_304423 ?auto_304424 ?auto_304425 ?auto_304426 ?auto_304427 ?auto_304428 ?auto_304429 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304444 - BLOCK
      ?auto_304445 - BLOCK
      ?auto_304446 - BLOCK
      ?auto_304447 - BLOCK
      ?auto_304448 - BLOCK
      ?auto_304449 - BLOCK
      ?auto_304450 - BLOCK
      ?auto_304451 - BLOCK
      ?auto_304452 - BLOCK
      ?auto_304453 - BLOCK
      ?auto_304454 - BLOCK
      ?auto_304455 - BLOCK
      ?auto_304456 - BLOCK
      ?auto_304457 - BLOCK
    )
    :vars
    (
      ?auto_304458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304457 ?auto_304458 ) ( ON-TABLE ?auto_304444 ) ( ON ?auto_304445 ?auto_304444 ) ( ON ?auto_304446 ?auto_304445 ) ( ON ?auto_304447 ?auto_304446 ) ( ON ?auto_304448 ?auto_304447 ) ( ON ?auto_304449 ?auto_304448 ) ( ON ?auto_304450 ?auto_304449 ) ( not ( = ?auto_304444 ?auto_304445 ) ) ( not ( = ?auto_304444 ?auto_304446 ) ) ( not ( = ?auto_304444 ?auto_304447 ) ) ( not ( = ?auto_304444 ?auto_304448 ) ) ( not ( = ?auto_304444 ?auto_304449 ) ) ( not ( = ?auto_304444 ?auto_304450 ) ) ( not ( = ?auto_304444 ?auto_304451 ) ) ( not ( = ?auto_304444 ?auto_304452 ) ) ( not ( = ?auto_304444 ?auto_304453 ) ) ( not ( = ?auto_304444 ?auto_304454 ) ) ( not ( = ?auto_304444 ?auto_304455 ) ) ( not ( = ?auto_304444 ?auto_304456 ) ) ( not ( = ?auto_304444 ?auto_304457 ) ) ( not ( = ?auto_304444 ?auto_304458 ) ) ( not ( = ?auto_304445 ?auto_304446 ) ) ( not ( = ?auto_304445 ?auto_304447 ) ) ( not ( = ?auto_304445 ?auto_304448 ) ) ( not ( = ?auto_304445 ?auto_304449 ) ) ( not ( = ?auto_304445 ?auto_304450 ) ) ( not ( = ?auto_304445 ?auto_304451 ) ) ( not ( = ?auto_304445 ?auto_304452 ) ) ( not ( = ?auto_304445 ?auto_304453 ) ) ( not ( = ?auto_304445 ?auto_304454 ) ) ( not ( = ?auto_304445 ?auto_304455 ) ) ( not ( = ?auto_304445 ?auto_304456 ) ) ( not ( = ?auto_304445 ?auto_304457 ) ) ( not ( = ?auto_304445 ?auto_304458 ) ) ( not ( = ?auto_304446 ?auto_304447 ) ) ( not ( = ?auto_304446 ?auto_304448 ) ) ( not ( = ?auto_304446 ?auto_304449 ) ) ( not ( = ?auto_304446 ?auto_304450 ) ) ( not ( = ?auto_304446 ?auto_304451 ) ) ( not ( = ?auto_304446 ?auto_304452 ) ) ( not ( = ?auto_304446 ?auto_304453 ) ) ( not ( = ?auto_304446 ?auto_304454 ) ) ( not ( = ?auto_304446 ?auto_304455 ) ) ( not ( = ?auto_304446 ?auto_304456 ) ) ( not ( = ?auto_304446 ?auto_304457 ) ) ( not ( = ?auto_304446 ?auto_304458 ) ) ( not ( = ?auto_304447 ?auto_304448 ) ) ( not ( = ?auto_304447 ?auto_304449 ) ) ( not ( = ?auto_304447 ?auto_304450 ) ) ( not ( = ?auto_304447 ?auto_304451 ) ) ( not ( = ?auto_304447 ?auto_304452 ) ) ( not ( = ?auto_304447 ?auto_304453 ) ) ( not ( = ?auto_304447 ?auto_304454 ) ) ( not ( = ?auto_304447 ?auto_304455 ) ) ( not ( = ?auto_304447 ?auto_304456 ) ) ( not ( = ?auto_304447 ?auto_304457 ) ) ( not ( = ?auto_304447 ?auto_304458 ) ) ( not ( = ?auto_304448 ?auto_304449 ) ) ( not ( = ?auto_304448 ?auto_304450 ) ) ( not ( = ?auto_304448 ?auto_304451 ) ) ( not ( = ?auto_304448 ?auto_304452 ) ) ( not ( = ?auto_304448 ?auto_304453 ) ) ( not ( = ?auto_304448 ?auto_304454 ) ) ( not ( = ?auto_304448 ?auto_304455 ) ) ( not ( = ?auto_304448 ?auto_304456 ) ) ( not ( = ?auto_304448 ?auto_304457 ) ) ( not ( = ?auto_304448 ?auto_304458 ) ) ( not ( = ?auto_304449 ?auto_304450 ) ) ( not ( = ?auto_304449 ?auto_304451 ) ) ( not ( = ?auto_304449 ?auto_304452 ) ) ( not ( = ?auto_304449 ?auto_304453 ) ) ( not ( = ?auto_304449 ?auto_304454 ) ) ( not ( = ?auto_304449 ?auto_304455 ) ) ( not ( = ?auto_304449 ?auto_304456 ) ) ( not ( = ?auto_304449 ?auto_304457 ) ) ( not ( = ?auto_304449 ?auto_304458 ) ) ( not ( = ?auto_304450 ?auto_304451 ) ) ( not ( = ?auto_304450 ?auto_304452 ) ) ( not ( = ?auto_304450 ?auto_304453 ) ) ( not ( = ?auto_304450 ?auto_304454 ) ) ( not ( = ?auto_304450 ?auto_304455 ) ) ( not ( = ?auto_304450 ?auto_304456 ) ) ( not ( = ?auto_304450 ?auto_304457 ) ) ( not ( = ?auto_304450 ?auto_304458 ) ) ( not ( = ?auto_304451 ?auto_304452 ) ) ( not ( = ?auto_304451 ?auto_304453 ) ) ( not ( = ?auto_304451 ?auto_304454 ) ) ( not ( = ?auto_304451 ?auto_304455 ) ) ( not ( = ?auto_304451 ?auto_304456 ) ) ( not ( = ?auto_304451 ?auto_304457 ) ) ( not ( = ?auto_304451 ?auto_304458 ) ) ( not ( = ?auto_304452 ?auto_304453 ) ) ( not ( = ?auto_304452 ?auto_304454 ) ) ( not ( = ?auto_304452 ?auto_304455 ) ) ( not ( = ?auto_304452 ?auto_304456 ) ) ( not ( = ?auto_304452 ?auto_304457 ) ) ( not ( = ?auto_304452 ?auto_304458 ) ) ( not ( = ?auto_304453 ?auto_304454 ) ) ( not ( = ?auto_304453 ?auto_304455 ) ) ( not ( = ?auto_304453 ?auto_304456 ) ) ( not ( = ?auto_304453 ?auto_304457 ) ) ( not ( = ?auto_304453 ?auto_304458 ) ) ( not ( = ?auto_304454 ?auto_304455 ) ) ( not ( = ?auto_304454 ?auto_304456 ) ) ( not ( = ?auto_304454 ?auto_304457 ) ) ( not ( = ?auto_304454 ?auto_304458 ) ) ( not ( = ?auto_304455 ?auto_304456 ) ) ( not ( = ?auto_304455 ?auto_304457 ) ) ( not ( = ?auto_304455 ?auto_304458 ) ) ( not ( = ?auto_304456 ?auto_304457 ) ) ( not ( = ?auto_304456 ?auto_304458 ) ) ( not ( = ?auto_304457 ?auto_304458 ) ) ( ON ?auto_304456 ?auto_304457 ) ( ON ?auto_304455 ?auto_304456 ) ( ON ?auto_304454 ?auto_304455 ) ( ON ?auto_304453 ?auto_304454 ) ( ON ?auto_304452 ?auto_304453 ) ( CLEAR ?auto_304450 ) ( ON ?auto_304451 ?auto_304452 ) ( CLEAR ?auto_304451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_304444 ?auto_304445 ?auto_304446 ?auto_304447 ?auto_304448 ?auto_304449 ?auto_304450 ?auto_304451 )
      ( MAKE-14PILE ?auto_304444 ?auto_304445 ?auto_304446 ?auto_304447 ?auto_304448 ?auto_304449 ?auto_304450 ?auto_304451 ?auto_304452 ?auto_304453 ?auto_304454 ?auto_304455 ?auto_304456 ?auto_304457 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304473 - BLOCK
      ?auto_304474 - BLOCK
      ?auto_304475 - BLOCK
      ?auto_304476 - BLOCK
      ?auto_304477 - BLOCK
      ?auto_304478 - BLOCK
      ?auto_304479 - BLOCK
      ?auto_304480 - BLOCK
      ?auto_304481 - BLOCK
      ?auto_304482 - BLOCK
      ?auto_304483 - BLOCK
      ?auto_304484 - BLOCK
      ?auto_304485 - BLOCK
      ?auto_304486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304486 ) ( ON-TABLE ?auto_304473 ) ( ON ?auto_304474 ?auto_304473 ) ( ON ?auto_304475 ?auto_304474 ) ( ON ?auto_304476 ?auto_304475 ) ( ON ?auto_304477 ?auto_304476 ) ( ON ?auto_304478 ?auto_304477 ) ( ON ?auto_304479 ?auto_304478 ) ( not ( = ?auto_304473 ?auto_304474 ) ) ( not ( = ?auto_304473 ?auto_304475 ) ) ( not ( = ?auto_304473 ?auto_304476 ) ) ( not ( = ?auto_304473 ?auto_304477 ) ) ( not ( = ?auto_304473 ?auto_304478 ) ) ( not ( = ?auto_304473 ?auto_304479 ) ) ( not ( = ?auto_304473 ?auto_304480 ) ) ( not ( = ?auto_304473 ?auto_304481 ) ) ( not ( = ?auto_304473 ?auto_304482 ) ) ( not ( = ?auto_304473 ?auto_304483 ) ) ( not ( = ?auto_304473 ?auto_304484 ) ) ( not ( = ?auto_304473 ?auto_304485 ) ) ( not ( = ?auto_304473 ?auto_304486 ) ) ( not ( = ?auto_304474 ?auto_304475 ) ) ( not ( = ?auto_304474 ?auto_304476 ) ) ( not ( = ?auto_304474 ?auto_304477 ) ) ( not ( = ?auto_304474 ?auto_304478 ) ) ( not ( = ?auto_304474 ?auto_304479 ) ) ( not ( = ?auto_304474 ?auto_304480 ) ) ( not ( = ?auto_304474 ?auto_304481 ) ) ( not ( = ?auto_304474 ?auto_304482 ) ) ( not ( = ?auto_304474 ?auto_304483 ) ) ( not ( = ?auto_304474 ?auto_304484 ) ) ( not ( = ?auto_304474 ?auto_304485 ) ) ( not ( = ?auto_304474 ?auto_304486 ) ) ( not ( = ?auto_304475 ?auto_304476 ) ) ( not ( = ?auto_304475 ?auto_304477 ) ) ( not ( = ?auto_304475 ?auto_304478 ) ) ( not ( = ?auto_304475 ?auto_304479 ) ) ( not ( = ?auto_304475 ?auto_304480 ) ) ( not ( = ?auto_304475 ?auto_304481 ) ) ( not ( = ?auto_304475 ?auto_304482 ) ) ( not ( = ?auto_304475 ?auto_304483 ) ) ( not ( = ?auto_304475 ?auto_304484 ) ) ( not ( = ?auto_304475 ?auto_304485 ) ) ( not ( = ?auto_304475 ?auto_304486 ) ) ( not ( = ?auto_304476 ?auto_304477 ) ) ( not ( = ?auto_304476 ?auto_304478 ) ) ( not ( = ?auto_304476 ?auto_304479 ) ) ( not ( = ?auto_304476 ?auto_304480 ) ) ( not ( = ?auto_304476 ?auto_304481 ) ) ( not ( = ?auto_304476 ?auto_304482 ) ) ( not ( = ?auto_304476 ?auto_304483 ) ) ( not ( = ?auto_304476 ?auto_304484 ) ) ( not ( = ?auto_304476 ?auto_304485 ) ) ( not ( = ?auto_304476 ?auto_304486 ) ) ( not ( = ?auto_304477 ?auto_304478 ) ) ( not ( = ?auto_304477 ?auto_304479 ) ) ( not ( = ?auto_304477 ?auto_304480 ) ) ( not ( = ?auto_304477 ?auto_304481 ) ) ( not ( = ?auto_304477 ?auto_304482 ) ) ( not ( = ?auto_304477 ?auto_304483 ) ) ( not ( = ?auto_304477 ?auto_304484 ) ) ( not ( = ?auto_304477 ?auto_304485 ) ) ( not ( = ?auto_304477 ?auto_304486 ) ) ( not ( = ?auto_304478 ?auto_304479 ) ) ( not ( = ?auto_304478 ?auto_304480 ) ) ( not ( = ?auto_304478 ?auto_304481 ) ) ( not ( = ?auto_304478 ?auto_304482 ) ) ( not ( = ?auto_304478 ?auto_304483 ) ) ( not ( = ?auto_304478 ?auto_304484 ) ) ( not ( = ?auto_304478 ?auto_304485 ) ) ( not ( = ?auto_304478 ?auto_304486 ) ) ( not ( = ?auto_304479 ?auto_304480 ) ) ( not ( = ?auto_304479 ?auto_304481 ) ) ( not ( = ?auto_304479 ?auto_304482 ) ) ( not ( = ?auto_304479 ?auto_304483 ) ) ( not ( = ?auto_304479 ?auto_304484 ) ) ( not ( = ?auto_304479 ?auto_304485 ) ) ( not ( = ?auto_304479 ?auto_304486 ) ) ( not ( = ?auto_304480 ?auto_304481 ) ) ( not ( = ?auto_304480 ?auto_304482 ) ) ( not ( = ?auto_304480 ?auto_304483 ) ) ( not ( = ?auto_304480 ?auto_304484 ) ) ( not ( = ?auto_304480 ?auto_304485 ) ) ( not ( = ?auto_304480 ?auto_304486 ) ) ( not ( = ?auto_304481 ?auto_304482 ) ) ( not ( = ?auto_304481 ?auto_304483 ) ) ( not ( = ?auto_304481 ?auto_304484 ) ) ( not ( = ?auto_304481 ?auto_304485 ) ) ( not ( = ?auto_304481 ?auto_304486 ) ) ( not ( = ?auto_304482 ?auto_304483 ) ) ( not ( = ?auto_304482 ?auto_304484 ) ) ( not ( = ?auto_304482 ?auto_304485 ) ) ( not ( = ?auto_304482 ?auto_304486 ) ) ( not ( = ?auto_304483 ?auto_304484 ) ) ( not ( = ?auto_304483 ?auto_304485 ) ) ( not ( = ?auto_304483 ?auto_304486 ) ) ( not ( = ?auto_304484 ?auto_304485 ) ) ( not ( = ?auto_304484 ?auto_304486 ) ) ( not ( = ?auto_304485 ?auto_304486 ) ) ( ON ?auto_304485 ?auto_304486 ) ( ON ?auto_304484 ?auto_304485 ) ( ON ?auto_304483 ?auto_304484 ) ( ON ?auto_304482 ?auto_304483 ) ( ON ?auto_304481 ?auto_304482 ) ( CLEAR ?auto_304479 ) ( ON ?auto_304480 ?auto_304481 ) ( CLEAR ?auto_304480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_304473 ?auto_304474 ?auto_304475 ?auto_304476 ?auto_304477 ?auto_304478 ?auto_304479 ?auto_304480 )
      ( MAKE-14PILE ?auto_304473 ?auto_304474 ?auto_304475 ?auto_304476 ?auto_304477 ?auto_304478 ?auto_304479 ?auto_304480 ?auto_304481 ?auto_304482 ?auto_304483 ?auto_304484 ?auto_304485 ?auto_304486 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304501 - BLOCK
      ?auto_304502 - BLOCK
      ?auto_304503 - BLOCK
      ?auto_304504 - BLOCK
      ?auto_304505 - BLOCK
      ?auto_304506 - BLOCK
      ?auto_304507 - BLOCK
      ?auto_304508 - BLOCK
      ?auto_304509 - BLOCK
      ?auto_304510 - BLOCK
      ?auto_304511 - BLOCK
      ?auto_304512 - BLOCK
      ?auto_304513 - BLOCK
      ?auto_304514 - BLOCK
    )
    :vars
    (
      ?auto_304515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304514 ?auto_304515 ) ( ON-TABLE ?auto_304501 ) ( ON ?auto_304502 ?auto_304501 ) ( ON ?auto_304503 ?auto_304502 ) ( ON ?auto_304504 ?auto_304503 ) ( ON ?auto_304505 ?auto_304504 ) ( ON ?auto_304506 ?auto_304505 ) ( not ( = ?auto_304501 ?auto_304502 ) ) ( not ( = ?auto_304501 ?auto_304503 ) ) ( not ( = ?auto_304501 ?auto_304504 ) ) ( not ( = ?auto_304501 ?auto_304505 ) ) ( not ( = ?auto_304501 ?auto_304506 ) ) ( not ( = ?auto_304501 ?auto_304507 ) ) ( not ( = ?auto_304501 ?auto_304508 ) ) ( not ( = ?auto_304501 ?auto_304509 ) ) ( not ( = ?auto_304501 ?auto_304510 ) ) ( not ( = ?auto_304501 ?auto_304511 ) ) ( not ( = ?auto_304501 ?auto_304512 ) ) ( not ( = ?auto_304501 ?auto_304513 ) ) ( not ( = ?auto_304501 ?auto_304514 ) ) ( not ( = ?auto_304501 ?auto_304515 ) ) ( not ( = ?auto_304502 ?auto_304503 ) ) ( not ( = ?auto_304502 ?auto_304504 ) ) ( not ( = ?auto_304502 ?auto_304505 ) ) ( not ( = ?auto_304502 ?auto_304506 ) ) ( not ( = ?auto_304502 ?auto_304507 ) ) ( not ( = ?auto_304502 ?auto_304508 ) ) ( not ( = ?auto_304502 ?auto_304509 ) ) ( not ( = ?auto_304502 ?auto_304510 ) ) ( not ( = ?auto_304502 ?auto_304511 ) ) ( not ( = ?auto_304502 ?auto_304512 ) ) ( not ( = ?auto_304502 ?auto_304513 ) ) ( not ( = ?auto_304502 ?auto_304514 ) ) ( not ( = ?auto_304502 ?auto_304515 ) ) ( not ( = ?auto_304503 ?auto_304504 ) ) ( not ( = ?auto_304503 ?auto_304505 ) ) ( not ( = ?auto_304503 ?auto_304506 ) ) ( not ( = ?auto_304503 ?auto_304507 ) ) ( not ( = ?auto_304503 ?auto_304508 ) ) ( not ( = ?auto_304503 ?auto_304509 ) ) ( not ( = ?auto_304503 ?auto_304510 ) ) ( not ( = ?auto_304503 ?auto_304511 ) ) ( not ( = ?auto_304503 ?auto_304512 ) ) ( not ( = ?auto_304503 ?auto_304513 ) ) ( not ( = ?auto_304503 ?auto_304514 ) ) ( not ( = ?auto_304503 ?auto_304515 ) ) ( not ( = ?auto_304504 ?auto_304505 ) ) ( not ( = ?auto_304504 ?auto_304506 ) ) ( not ( = ?auto_304504 ?auto_304507 ) ) ( not ( = ?auto_304504 ?auto_304508 ) ) ( not ( = ?auto_304504 ?auto_304509 ) ) ( not ( = ?auto_304504 ?auto_304510 ) ) ( not ( = ?auto_304504 ?auto_304511 ) ) ( not ( = ?auto_304504 ?auto_304512 ) ) ( not ( = ?auto_304504 ?auto_304513 ) ) ( not ( = ?auto_304504 ?auto_304514 ) ) ( not ( = ?auto_304504 ?auto_304515 ) ) ( not ( = ?auto_304505 ?auto_304506 ) ) ( not ( = ?auto_304505 ?auto_304507 ) ) ( not ( = ?auto_304505 ?auto_304508 ) ) ( not ( = ?auto_304505 ?auto_304509 ) ) ( not ( = ?auto_304505 ?auto_304510 ) ) ( not ( = ?auto_304505 ?auto_304511 ) ) ( not ( = ?auto_304505 ?auto_304512 ) ) ( not ( = ?auto_304505 ?auto_304513 ) ) ( not ( = ?auto_304505 ?auto_304514 ) ) ( not ( = ?auto_304505 ?auto_304515 ) ) ( not ( = ?auto_304506 ?auto_304507 ) ) ( not ( = ?auto_304506 ?auto_304508 ) ) ( not ( = ?auto_304506 ?auto_304509 ) ) ( not ( = ?auto_304506 ?auto_304510 ) ) ( not ( = ?auto_304506 ?auto_304511 ) ) ( not ( = ?auto_304506 ?auto_304512 ) ) ( not ( = ?auto_304506 ?auto_304513 ) ) ( not ( = ?auto_304506 ?auto_304514 ) ) ( not ( = ?auto_304506 ?auto_304515 ) ) ( not ( = ?auto_304507 ?auto_304508 ) ) ( not ( = ?auto_304507 ?auto_304509 ) ) ( not ( = ?auto_304507 ?auto_304510 ) ) ( not ( = ?auto_304507 ?auto_304511 ) ) ( not ( = ?auto_304507 ?auto_304512 ) ) ( not ( = ?auto_304507 ?auto_304513 ) ) ( not ( = ?auto_304507 ?auto_304514 ) ) ( not ( = ?auto_304507 ?auto_304515 ) ) ( not ( = ?auto_304508 ?auto_304509 ) ) ( not ( = ?auto_304508 ?auto_304510 ) ) ( not ( = ?auto_304508 ?auto_304511 ) ) ( not ( = ?auto_304508 ?auto_304512 ) ) ( not ( = ?auto_304508 ?auto_304513 ) ) ( not ( = ?auto_304508 ?auto_304514 ) ) ( not ( = ?auto_304508 ?auto_304515 ) ) ( not ( = ?auto_304509 ?auto_304510 ) ) ( not ( = ?auto_304509 ?auto_304511 ) ) ( not ( = ?auto_304509 ?auto_304512 ) ) ( not ( = ?auto_304509 ?auto_304513 ) ) ( not ( = ?auto_304509 ?auto_304514 ) ) ( not ( = ?auto_304509 ?auto_304515 ) ) ( not ( = ?auto_304510 ?auto_304511 ) ) ( not ( = ?auto_304510 ?auto_304512 ) ) ( not ( = ?auto_304510 ?auto_304513 ) ) ( not ( = ?auto_304510 ?auto_304514 ) ) ( not ( = ?auto_304510 ?auto_304515 ) ) ( not ( = ?auto_304511 ?auto_304512 ) ) ( not ( = ?auto_304511 ?auto_304513 ) ) ( not ( = ?auto_304511 ?auto_304514 ) ) ( not ( = ?auto_304511 ?auto_304515 ) ) ( not ( = ?auto_304512 ?auto_304513 ) ) ( not ( = ?auto_304512 ?auto_304514 ) ) ( not ( = ?auto_304512 ?auto_304515 ) ) ( not ( = ?auto_304513 ?auto_304514 ) ) ( not ( = ?auto_304513 ?auto_304515 ) ) ( not ( = ?auto_304514 ?auto_304515 ) ) ( ON ?auto_304513 ?auto_304514 ) ( ON ?auto_304512 ?auto_304513 ) ( ON ?auto_304511 ?auto_304512 ) ( ON ?auto_304510 ?auto_304511 ) ( ON ?auto_304509 ?auto_304510 ) ( ON ?auto_304508 ?auto_304509 ) ( CLEAR ?auto_304506 ) ( ON ?auto_304507 ?auto_304508 ) ( CLEAR ?auto_304507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_304501 ?auto_304502 ?auto_304503 ?auto_304504 ?auto_304505 ?auto_304506 ?auto_304507 )
      ( MAKE-14PILE ?auto_304501 ?auto_304502 ?auto_304503 ?auto_304504 ?auto_304505 ?auto_304506 ?auto_304507 ?auto_304508 ?auto_304509 ?auto_304510 ?auto_304511 ?auto_304512 ?auto_304513 ?auto_304514 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304530 - BLOCK
      ?auto_304531 - BLOCK
      ?auto_304532 - BLOCK
      ?auto_304533 - BLOCK
      ?auto_304534 - BLOCK
      ?auto_304535 - BLOCK
      ?auto_304536 - BLOCK
      ?auto_304537 - BLOCK
      ?auto_304538 - BLOCK
      ?auto_304539 - BLOCK
      ?auto_304540 - BLOCK
      ?auto_304541 - BLOCK
      ?auto_304542 - BLOCK
      ?auto_304543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304543 ) ( ON-TABLE ?auto_304530 ) ( ON ?auto_304531 ?auto_304530 ) ( ON ?auto_304532 ?auto_304531 ) ( ON ?auto_304533 ?auto_304532 ) ( ON ?auto_304534 ?auto_304533 ) ( ON ?auto_304535 ?auto_304534 ) ( not ( = ?auto_304530 ?auto_304531 ) ) ( not ( = ?auto_304530 ?auto_304532 ) ) ( not ( = ?auto_304530 ?auto_304533 ) ) ( not ( = ?auto_304530 ?auto_304534 ) ) ( not ( = ?auto_304530 ?auto_304535 ) ) ( not ( = ?auto_304530 ?auto_304536 ) ) ( not ( = ?auto_304530 ?auto_304537 ) ) ( not ( = ?auto_304530 ?auto_304538 ) ) ( not ( = ?auto_304530 ?auto_304539 ) ) ( not ( = ?auto_304530 ?auto_304540 ) ) ( not ( = ?auto_304530 ?auto_304541 ) ) ( not ( = ?auto_304530 ?auto_304542 ) ) ( not ( = ?auto_304530 ?auto_304543 ) ) ( not ( = ?auto_304531 ?auto_304532 ) ) ( not ( = ?auto_304531 ?auto_304533 ) ) ( not ( = ?auto_304531 ?auto_304534 ) ) ( not ( = ?auto_304531 ?auto_304535 ) ) ( not ( = ?auto_304531 ?auto_304536 ) ) ( not ( = ?auto_304531 ?auto_304537 ) ) ( not ( = ?auto_304531 ?auto_304538 ) ) ( not ( = ?auto_304531 ?auto_304539 ) ) ( not ( = ?auto_304531 ?auto_304540 ) ) ( not ( = ?auto_304531 ?auto_304541 ) ) ( not ( = ?auto_304531 ?auto_304542 ) ) ( not ( = ?auto_304531 ?auto_304543 ) ) ( not ( = ?auto_304532 ?auto_304533 ) ) ( not ( = ?auto_304532 ?auto_304534 ) ) ( not ( = ?auto_304532 ?auto_304535 ) ) ( not ( = ?auto_304532 ?auto_304536 ) ) ( not ( = ?auto_304532 ?auto_304537 ) ) ( not ( = ?auto_304532 ?auto_304538 ) ) ( not ( = ?auto_304532 ?auto_304539 ) ) ( not ( = ?auto_304532 ?auto_304540 ) ) ( not ( = ?auto_304532 ?auto_304541 ) ) ( not ( = ?auto_304532 ?auto_304542 ) ) ( not ( = ?auto_304532 ?auto_304543 ) ) ( not ( = ?auto_304533 ?auto_304534 ) ) ( not ( = ?auto_304533 ?auto_304535 ) ) ( not ( = ?auto_304533 ?auto_304536 ) ) ( not ( = ?auto_304533 ?auto_304537 ) ) ( not ( = ?auto_304533 ?auto_304538 ) ) ( not ( = ?auto_304533 ?auto_304539 ) ) ( not ( = ?auto_304533 ?auto_304540 ) ) ( not ( = ?auto_304533 ?auto_304541 ) ) ( not ( = ?auto_304533 ?auto_304542 ) ) ( not ( = ?auto_304533 ?auto_304543 ) ) ( not ( = ?auto_304534 ?auto_304535 ) ) ( not ( = ?auto_304534 ?auto_304536 ) ) ( not ( = ?auto_304534 ?auto_304537 ) ) ( not ( = ?auto_304534 ?auto_304538 ) ) ( not ( = ?auto_304534 ?auto_304539 ) ) ( not ( = ?auto_304534 ?auto_304540 ) ) ( not ( = ?auto_304534 ?auto_304541 ) ) ( not ( = ?auto_304534 ?auto_304542 ) ) ( not ( = ?auto_304534 ?auto_304543 ) ) ( not ( = ?auto_304535 ?auto_304536 ) ) ( not ( = ?auto_304535 ?auto_304537 ) ) ( not ( = ?auto_304535 ?auto_304538 ) ) ( not ( = ?auto_304535 ?auto_304539 ) ) ( not ( = ?auto_304535 ?auto_304540 ) ) ( not ( = ?auto_304535 ?auto_304541 ) ) ( not ( = ?auto_304535 ?auto_304542 ) ) ( not ( = ?auto_304535 ?auto_304543 ) ) ( not ( = ?auto_304536 ?auto_304537 ) ) ( not ( = ?auto_304536 ?auto_304538 ) ) ( not ( = ?auto_304536 ?auto_304539 ) ) ( not ( = ?auto_304536 ?auto_304540 ) ) ( not ( = ?auto_304536 ?auto_304541 ) ) ( not ( = ?auto_304536 ?auto_304542 ) ) ( not ( = ?auto_304536 ?auto_304543 ) ) ( not ( = ?auto_304537 ?auto_304538 ) ) ( not ( = ?auto_304537 ?auto_304539 ) ) ( not ( = ?auto_304537 ?auto_304540 ) ) ( not ( = ?auto_304537 ?auto_304541 ) ) ( not ( = ?auto_304537 ?auto_304542 ) ) ( not ( = ?auto_304537 ?auto_304543 ) ) ( not ( = ?auto_304538 ?auto_304539 ) ) ( not ( = ?auto_304538 ?auto_304540 ) ) ( not ( = ?auto_304538 ?auto_304541 ) ) ( not ( = ?auto_304538 ?auto_304542 ) ) ( not ( = ?auto_304538 ?auto_304543 ) ) ( not ( = ?auto_304539 ?auto_304540 ) ) ( not ( = ?auto_304539 ?auto_304541 ) ) ( not ( = ?auto_304539 ?auto_304542 ) ) ( not ( = ?auto_304539 ?auto_304543 ) ) ( not ( = ?auto_304540 ?auto_304541 ) ) ( not ( = ?auto_304540 ?auto_304542 ) ) ( not ( = ?auto_304540 ?auto_304543 ) ) ( not ( = ?auto_304541 ?auto_304542 ) ) ( not ( = ?auto_304541 ?auto_304543 ) ) ( not ( = ?auto_304542 ?auto_304543 ) ) ( ON ?auto_304542 ?auto_304543 ) ( ON ?auto_304541 ?auto_304542 ) ( ON ?auto_304540 ?auto_304541 ) ( ON ?auto_304539 ?auto_304540 ) ( ON ?auto_304538 ?auto_304539 ) ( ON ?auto_304537 ?auto_304538 ) ( CLEAR ?auto_304535 ) ( ON ?auto_304536 ?auto_304537 ) ( CLEAR ?auto_304536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_304530 ?auto_304531 ?auto_304532 ?auto_304533 ?auto_304534 ?auto_304535 ?auto_304536 )
      ( MAKE-14PILE ?auto_304530 ?auto_304531 ?auto_304532 ?auto_304533 ?auto_304534 ?auto_304535 ?auto_304536 ?auto_304537 ?auto_304538 ?auto_304539 ?auto_304540 ?auto_304541 ?auto_304542 ?auto_304543 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304558 - BLOCK
      ?auto_304559 - BLOCK
      ?auto_304560 - BLOCK
      ?auto_304561 - BLOCK
      ?auto_304562 - BLOCK
      ?auto_304563 - BLOCK
      ?auto_304564 - BLOCK
      ?auto_304565 - BLOCK
      ?auto_304566 - BLOCK
      ?auto_304567 - BLOCK
      ?auto_304568 - BLOCK
      ?auto_304569 - BLOCK
      ?auto_304570 - BLOCK
      ?auto_304571 - BLOCK
    )
    :vars
    (
      ?auto_304572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304571 ?auto_304572 ) ( ON-TABLE ?auto_304558 ) ( ON ?auto_304559 ?auto_304558 ) ( ON ?auto_304560 ?auto_304559 ) ( ON ?auto_304561 ?auto_304560 ) ( ON ?auto_304562 ?auto_304561 ) ( not ( = ?auto_304558 ?auto_304559 ) ) ( not ( = ?auto_304558 ?auto_304560 ) ) ( not ( = ?auto_304558 ?auto_304561 ) ) ( not ( = ?auto_304558 ?auto_304562 ) ) ( not ( = ?auto_304558 ?auto_304563 ) ) ( not ( = ?auto_304558 ?auto_304564 ) ) ( not ( = ?auto_304558 ?auto_304565 ) ) ( not ( = ?auto_304558 ?auto_304566 ) ) ( not ( = ?auto_304558 ?auto_304567 ) ) ( not ( = ?auto_304558 ?auto_304568 ) ) ( not ( = ?auto_304558 ?auto_304569 ) ) ( not ( = ?auto_304558 ?auto_304570 ) ) ( not ( = ?auto_304558 ?auto_304571 ) ) ( not ( = ?auto_304558 ?auto_304572 ) ) ( not ( = ?auto_304559 ?auto_304560 ) ) ( not ( = ?auto_304559 ?auto_304561 ) ) ( not ( = ?auto_304559 ?auto_304562 ) ) ( not ( = ?auto_304559 ?auto_304563 ) ) ( not ( = ?auto_304559 ?auto_304564 ) ) ( not ( = ?auto_304559 ?auto_304565 ) ) ( not ( = ?auto_304559 ?auto_304566 ) ) ( not ( = ?auto_304559 ?auto_304567 ) ) ( not ( = ?auto_304559 ?auto_304568 ) ) ( not ( = ?auto_304559 ?auto_304569 ) ) ( not ( = ?auto_304559 ?auto_304570 ) ) ( not ( = ?auto_304559 ?auto_304571 ) ) ( not ( = ?auto_304559 ?auto_304572 ) ) ( not ( = ?auto_304560 ?auto_304561 ) ) ( not ( = ?auto_304560 ?auto_304562 ) ) ( not ( = ?auto_304560 ?auto_304563 ) ) ( not ( = ?auto_304560 ?auto_304564 ) ) ( not ( = ?auto_304560 ?auto_304565 ) ) ( not ( = ?auto_304560 ?auto_304566 ) ) ( not ( = ?auto_304560 ?auto_304567 ) ) ( not ( = ?auto_304560 ?auto_304568 ) ) ( not ( = ?auto_304560 ?auto_304569 ) ) ( not ( = ?auto_304560 ?auto_304570 ) ) ( not ( = ?auto_304560 ?auto_304571 ) ) ( not ( = ?auto_304560 ?auto_304572 ) ) ( not ( = ?auto_304561 ?auto_304562 ) ) ( not ( = ?auto_304561 ?auto_304563 ) ) ( not ( = ?auto_304561 ?auto_304564 ) ) ( not ( = ?auto_304561 ?auto_304565 ) ) ( not ( = ?auto_304561 ?auto_304566 ) ) ( not ( = ?auto_304561 ?auto_304567 ) ) ( not ( = ?auto_304561 ?auto_304568 ) ) ( not ( = ?auto_304561 ?auto_304569 ) ) ( not ( = ?auto_304561 ?auto_304570 ) ) ( not ( = ?auto_304561 ?auto_304571 ) ) ( not ( = ?auto_304561 ?auto_304572 ) ) ( not ( = ?auto_304562 ?auto_304563 ) ) ( not ( = ?auto_304562 ?auto_304564 ) ) ( not ( = ?auto_304562 ?auto_304565 ) ) ( not ( = ?auto_304562 ?auto_304566 ) ) ( not ( = ?auto_304562 ?auto_304567 ) ) ( not ( = ?auto_304562 ?auto_304568 ) ) ( not ( = ?auto_304562 ?auto_304569 ) ) ( not ( = ?auto_304562 ?auto_304570 ) ) ( not ( = ?auto_304562 ?auto_304571 ) ) ( not ( = ?auto_304562 ?auto_304572 ) ) ( not ( = ?auto_304563 ?auto_304564 ) ) ( not ( = ?auto_304563 ?auto_304565 ) ) ( not ( = ?auto_304563 ?auto_304566 ) ) ( not ( = ?auto_304563 ?auto_304567 ) ) ( not ( = ?auto_304563 ?auto_304568 ) ) ( not ( = ?auto_304563 ?auto_304569 ) ) ( not ( = ?auto_304563 ?auto_304570 ) ) ( not ( = ?auto_304563 ?auto_304571 ) ) ( not ( = ?auto_304563 ?auto_304572 ) ) ( not ( = ?auto_304564 ?auto_304565 ) ) ( not ( = ?auto_304564 ?auto_304566 ) ) ( not ( = ?auto_304564 ?auto_304567 ) ) ( not ( = ?auto_304564 ?auto_304568 ) ) ( not ( = ?auto_304564 ?auto_304569 ) ) ( not ( = ?auto_304564 ?auto_304570 ) ) ( not ( = ?auto_304564 ?auto_304571 ) ) ( not ( = ?auto_304564 ?auto_304572 ) ) ( not ( = ?auto_304565 ?auto_304566 ) ) ( not ( = ?auto_304565 ?auto_304567 ) ) ( not ( = ?auto_304565 ?auto_304568 ) ) ( not ( = ?auto_304565 ?auto_304569 ) ) ( not ( = ?auto_304565 ?auto_304570 ) ) ( not ( = ?auto_304565 ?auto_304571 ) ) ( not ( = ?auto_304565 ?auto_304572 ) ) ( not ( = ?auto_304566 ?auto_304567 ) ) ( not ( = ?auto_304566 ?auto_304568 ) ) ( not ( = ?auto_304566 ?auto_304569 ) ) ( not ( = ?auto_304566 ?auto_304570 ) ) ( not ( = ?auto_304566 ?auto_304571 ) ) ( not ( = ?auto_304566 ?auto_304572 ) ) ( not ( = ?auto_304567 ?auto_304568 ) ) ( not ( = ?auto_304567 ?auto_304569 ) ) ( not ( = ?auto_304567 ?auto_304570 ) ) ( not ( = ?auto_304567 ?auto_304571 ) ) ( not ( = ?auto_304567 ?auto_304572 ) ) ( not ( = ?auto_304568 ?auto_304569 ) ) ( not ( = ?auto_304568 ?auto_304570 ) ) ( not ( = ?auto_304568 ?auto_304571 ) ) ( not ( = ?auto_304568 ?auto_304572 ) ) ( not ( = ?auto_304569 ?auto_304570 ) ) ( not ( = ?auto_304569 ?auto_304571 ) ) ( not ( = ?auto_304569 ?auto_304572 ) ) ( not ( = ?auto_304570 ?auto_304571 ) ) ( not ( = ?auto_304570 ?auto_304572 ) ) ( not ( = ?auto_304571 ?auto_304572 ) ) ( ON ?auto_304570 ?auto_304571 ) ( ON ?auto_304569 ?auto_304570 ) ( ON ?auto_304568 ?auto_304569 ) ( ON ?auto_304567 ?auto_304568 ) ( ON ?auto_304566 ?auto_304567 ) ( ON ?auto_304565 ?auto_304566 ) ( ON ?auto_304564 ?auto_304565 ) ( CLEAR ?auto_304562 ) ( ON ?auto_304563 ?auto_304564 ) ( CLEAR ?auto_304563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_304558 ?auto_304559 ?auto_304560 ?auto_304561 ?auto_304562 ?auto_304563 )
      ( MAKE-14PILE ?auto_304558 ?auto_304559 ?auto_304560 ?auto_304561 ?auto_304562 ?auto_304563 ?auto_304564 ?auto_304565 ?auto_304566 ?auto_304567 ?auto_304568 ?auto_304569 ?auto_304570 ?auto_304571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304587 - BLOCK
      ?auto_304588 - BLOCK
      ?auto_304589 - BLOCK
      ?auto_304590 - BLOCK
      ?auto_304591 - BLOCK
      ?auto_304592 - BLOCK
      ?auto_304593 - BLOCK
      ?auto_304594 - BLOCK
      ?auto_304595 - BLOCK
      ?auto_304596 - BLOCK
      ?auto_304597 - BLOCK
      ?auto_304598 - BLOCK
      ?auto_304599 - BLOCK
      ?auto_304600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304600 ) ( ON-TABLE ?auto_304587 ) ( ON ?auto_304588 ?auto_304587 ) ( ON ?auto_304589 ?auto_304588 ) ( ON ?auto_304590 ?auto_304589 ) ( ON ?auto_304591 ?auto_304590 ) ( not ( = ?auto_304587 ?auto_304588 ) ) ( not ( = ?auto_304587 ?auto_304589 ) ) ( not ( = ?auto_304587 ?auto_304590 ) ) ( not ( = ?auto_304587 ?auto_304591 ) ) ( not ( = ?auto_304587 ?auto_304592 ) ) ( not ( = ?auto_304587 ?auto_304593 ) ) ( not ( = ?auto_304587 ?auto_304594 ) ) ( not ( = ?auto_304587 ?auto_304595 ) ) ( not ( = ?auto_304587 ?auto_304596 ) ) ( not ( = ?auto_304587 ?auto_304597 ) ) ( not ( = ?auto_304587 ?auto_304598 ) ) ( not ( = ?auto_304587 ?auto_304599 ) ) ( not ( = ?auto_304587 ?auto_304600 ) ) ( not ( = ?auto_304588 ?auto_304589 ) ) ( not ( = ?auto_304588 ?auto_304590 ) ) ( not ( = ?auto_304588 ?auto_304591 ) ) ( not ( = ?auto_304588 ?auto_304592 ) ) ( not ( = ?auto_304588 ?auto_304593 ) ) ( not ( = ?auto_304588 ?auto_304594 ) ) ( not ( = ?auto_304588 ?auto_304595 ) ) ( not ( = ?auto_304588 ?auto_304596 ) ) ( not ( = ?auto_304588 ?auto_304597 ) ) ( not ( = ?auto_304588 ?auto_304598 ) ) ( not ( = ?auto_304588 ?auto_304599 ) ) ( not ( = ?auto_304588 ?auto_304600 ) ) ( not ( = ?auto_304589 ?auto_304590 ) ) ( not ( = ?auto_304589 ?auto_304591 ) ) ( not ( = ?auto_304589 ?auto_304592 ) ) ( not ( = ?auto_304589 ?auto_304593 ) ) ( not ( = ?auto_304589 ?auto_304594 ) ) ( not ( = ?auto_304589 ?auto_304595 ) ) ( not ( = ?auto_304589 ?auto_304596 ) ) ( not ( = ?auto_304589 ?auto_304597 ) ) ( not ( = ?auto_304589 ?auto_304598 ) ) ( not ( = ?auto_304589 ?auto_304599 ) ) ( not ( = ?auto_304589 ?auto_304600 ) ) ( not ( = ?auto_304590 ?auto_304591 ) ) ( not ( = ?auto_304590 ?auto_304592 ) ) ( not ( = ?auto_304590 ?auto_304593 ) ) ( not ( = ?auto_304590 ?auto_304594 ) ) ( not ( = ?auto_304590 ?auto_304595 ) ) ( not ( = ?auto_304590 ?auto_304596 ) ) ( not ( = ?auto_304590 ?auto_304597 ) ) ( not ( = ?auto_304590 ?auto_304598 ) ) ( not ( = ?auto_304590 ?auto_304599 ) ) ( not ( = ?auto_304590 ?auto_304600 ) ) ( not ( = ?auto_304591 ?auto_304592 ) ) ( not ( = ?auto_304591 ?auto_304593 ) ) ( not ( = ?auto_304591 ?auto_304594 ) ) ( not ( = ?auto_304591 ?auto_304595 ) ) ( not ( = ?auto_304591 ?auto_304596 ) ) ( not ( = ?auto_304591 ?auto_304597 ) ) ( not ( = ?auto_304591 ?auto_304598 ) ) ( not ( = ?auto_304591 ?auto_304599 ) ) ( not ( = ?auto_304591 ?auto_304600 ) ) ( not ( = ?auto_304592 ?auto_304593 ) ) ( not ( = ?auto_304592 ?auto_304594 ) ) ( not ( = ?auto_304592 ?auto_304595 ) ) ( not ( = ?auto_304592 ?auto_304596 ) ) ( not ( = ?auto_304592 ?auto_304597 ) ) ( not ( = ?auto_304592 ?auto_304598 ) ) ( not ( = ?auto_304592 ?auto_304599 ) ) ( not ( = ?auto_304592 ?auto_304600 ) ) ( not ( = ?auto_304593 ?auto_304594 ) ) ( not ( = ?auto_304593 ?auto_304595 ) ) ( not ( = ?auto_304593 ?auto_304596 ) ) ( not ( = ?auto_304593 ?auto_304597 ) ) ( not ( = ?auto_304593 ?auto_304598 ) ) ( not ( = ?auto_304593 ?auto_304599 ) ) ( not ( = ?auto_304593 ?auto_304600 ) ) ( not ( = ?auto_304594 ?auto_304595 ) ) ( not ( = ?auto_304594 ?auto_304596 ) ) ( not ( = ?auto_304594 ?auto_304597 ) ) ( not ( = ?auto_304594 ?auto_304598 ) ) ( not ( = ?auto_304594 ?auto_304599 ) ) ( not ( = ?auto_304594 ?auto_304600 ) ) ( not ( = ?auto_304595 ?auto_304596 ) ) ( not ( = ?auto_304595 ?auto_304597 ) ) ( not ( = ?auto_304595 ?auto_304598 ) ) ( not ( = ?auto_304595 ?auto_304599 ) ) ( not ( = ?auto_304595 ?auto_304600 ) ) ( not ( = ?auto_304596 ?auto_304597 ) ) ( not ( = ?auto_304596 ?auto_304598 ) ) ( not ( = ?auto_304596 ?auto_304599 ) ) ( not ( = ?auto_304596 ?auto_304600 ) ) ( not ( = ?auto_304597 ?auto_304598 ) ) ( not ( = ?auto_304597 ?auto_304599 ) ) ( not ( = ?auto_304597 ?auto_304600 ) ) ( not ( = ?auto_304598 ?auto_304599 ) ) ( not ( = ?auto_304598 ?auto_304600 ) ) ( not ( = ?auto_304599 ?auto_304600 ) ) ( ON ?auto_304599 ?auto_304600 ) ( ON ?auto_304598 ?auto_304599 ) ( ON ?auto_304597 ?auto_304598 ) ( ON ?auto_304596 ?auto_304597 ) ( ON ?auto_304595 ?auto_304596 ) ( ON ?auto_304594 ?auto_304595 ) ( ON ?auto_304593 ?auto_304594 ) ( CLEAR ?auto_304591 ) ( ON ?auto_304592 ?auto_304593 ) ( CLEAR ?auto_304592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_304587 ?auto_304588 ?auto_304589 ?auto_304590 ?auto_304591 ?auto_304592 )
      ( MAKE-14PILE ?auto_304587 ?auto_304588 ?auto_304589 ?auto_304590 ?auto_304591 ?auto_304592 ?auto_304593 ?auto_304594 ?auto_304595 ?auto_304596 ?auto_304597 ?auto_304598 ?auto_304599 ?auto_304600 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304615 - BLOCK
      ?auto_304616 - BLOCK
      ?auto_304617 - BLOCK
      ?auto_304618 - BLOCK
      ?auto_304619 - BLOCK
      ?auto_304620 - BLOCK
      ?auto_304621 - BLOCK
      ?auto_304622 - BLOCK
      ?auto_304623 - BLOCK
      ?auto_304624 - BLOCK
      ?auto_304625 - BLOCK
      ?auto_304626 - BLOCK
      ?auto_304627 - BLOCK
      ?auto_304628 - BLOCK
    )
    :vars
    (
      ?auto_304629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304628 ?auto_304629 ) ( ON-TABLE ?auto_304615 ) ( ON ?auto_304616 ?auto_304615 ) ( ON ?auto_304617 ?auto_304616 ) ( ON ?auto_304618 ?auto_304617 ) ( not ( = ?auto_304615 ?auto_304616 ) ) ( not ( = ?auto_304615 ?auto_304617 ) ) ( not ( = ?auto_304615 ?auto_304618 ) ) ( not ( = ?auto_304615 ?auto_304619 ) ) ( not ( = ?auto_304615 ?auto_304620 ) ) ( not ( = ?auto_304615 ?auto_304621 ) ) ( not ( = ?auto_304615 ?auto_304622 ) ) ( not ( = ?auto_304615 ?auto_304623 ) ) ( not ( = ?auto_304615 ?auto_304624 ) ) ( not ( = ?auto_304615 ?auto_304625 ) ) ( not ( = ?auto_304615 ?auto_304626 ) ) ( not ( = ?auto_304615 ?auto_304627 ) ) ( not ( = ?auto_304615 ?auto_304628 ) ) ( not ( = ?auto_304615 ?auto_304629 ) ) ( not ( = ?auto_304616 ?auto_304617 ) ) ( not ( = ?auto_304616 ?auto_304618 ) ) ( not ( = ?auto_304616 ?auto_304619 ) ) ( not ( = ?auto_304616 ?auto_304620 ) ) ( not ( = ?auto_304616 ?auto_304621 ) ) ( not ( = ?auto_304616 ?auto_304622 ) ) ( not ( = ?auto_304616 ?auto_304623 ) ) ( not ( = ?auto_304616 ?auto_304624 ) ) ( not ( = ?auto_304616 ?auto_304625 ) ) ( not ( = ?auto_304616 ?auto_304626 ) ) ( not ( = ?auto_304616 ?auto_304627 ) ) ( not ( = ?auto_304616 ?auto_304628 ) ) ( not ( = ?auto_304616 ?auto_304629 ) ) ( not ( = ?auto_304617 ?auto_304618 ) ) ( not ( = ?auto_304617 ?auto_304619 ) ) ( not ( = ?auto_304617 ?auto_304620 ) ) ( not ( = ?auto_304617 ?auto_304621 ) ) ( not ( = ?auto_304617 ?auto_304622 ) ) ( not ( = ?auto_304617 ?auto_304623 ) ) ( not ( = ?auto_304617 ?auto_304624 ) ) ( not ( = ?auto_304617 ?auto_304625 ) ) ( not ( = ?auto_304617 ?auto_304626 ) ) ( not ( = ?auto_304617 ?auto_304627 ) ) ( not ( = ?auto_304617 ?auto_304628 ) ) ( not ( = ?auto_304617 ?auto_304629 ) ) ( not ( = ?auto_304618 ?auto_304619 ) ) ( not ( = ?auto_304618 ?auto_304620 ) ) ( not ( = ?auto_304618 ?auto_304621 ) ) ( not ( = ?auto_304618 ?auto_304622 ) ) ( not ( = ?auto_304618 ?auto_304623 ) ) ( not ( = ?auto_304618 ?auto_304624 ) ) ( not ( = ?auto_304618 ?auto_304625 ) ) ( not ( = ?auto_304618 ?auto_304626 ) ) ( not ( = ?auto_304618 ?auto_304627 ) ) ( not ( = ?auto_304618 ?auto_304628 ) ) ( not ( = ?auto_304618 ?auto_304629 ) ) ( not ( = ?auto_304619 ?auto_304620 ) ) ( not ( = ?auto_304619 ?auto_304621 ) ) ( not ( = ?auto_304619 ?auto_304622 ) ) ( not ( = ?auto_304619 ?auto_304623 ) ) ( not ( = ?auto_304619 ?auto_304624 ) ) ( not ( = ?auto_304619 ?auto_304625 ) ) ( not ( = ?auto_304619 ?auto_304626 ) ) ( not ( = ?auto_304619 ?auto_304627 ) ) ( not ( = ?auto_304619 ?auto_304628 ) ) ( not ( = ?auto_304619 ?auto_304629 ) ) ( not ( = ?auto_304620 ?auto_304621 ) ) ( not ( = ?auto_304620 ?auto_304622 ) ) ( not ( = ?auto_304620 ?auto_304623 ) ) ( not ( = ?auto_304620 ?auto_304624 ) ) ( not ( = ?auto_304620 ?auto_304625 ) ) ( not ( = ?auto_304620 ?auto_304626 ) ) ( not ( = ?auto_304620 ?auto_304627 ) ) ( not ( = ?auto_304620 ?auto_304628 ) ) ( not ( = ?auto_304620 ?auto_304629 ) ) ( not ( = ?auto_304621 ?auto_304622 ) ) ( not ( = ?auto_304621 ?auto_304623 ) ) ( not ( = ?auto_304621 ?auto_304624 ) ) ( not ( = ?auto_304621 ?auto_304625 ) ) ( not ( = ?auto_304621 ?auto_304626 ) ) ( not ( = ?auto_304621 ?auto_304627 ) ) ( not ( = ?auto_304621 ?auto_304628 ) ) ( not ( = ?auto_304621 ?auto_304629 ) ) ( not ( = ?auto_304622 ?auto_304623 ) ) ( not ( = ?auto_304622 ?auto_304624 ) ) ( not ( = ?auto_304622 ?auto_304625 ) ) ( not ( = ?auto_304622 ?auto_304626 ) ) ( not ( = ?auto_304622 ?auto_304627 ) ) ( not ( = ?auto_304622 ?auto_304628 ) ) ( not ( = ?auto_304622 ?auto_304629 ) ) ( not ( = ?auto_304623 ?auto_304624 ) ) ( not ( = ?auto_304623 ?auto_304625 ) ) ( not ( = ?auto_304623 ?auto_304626 ) ) ( not ( = ?auto_304623 ?auto_304627 ) ) ( not ( = ?auto_304623 ?auto_304628 ) ) ( not ( = ?auto_304623 ?auto_304629 ) ) ( not ( = ?auto_304624 ?auto_304625 ) ) ( not ( = ?auto_304624 ?auto_304626 ) ) ( not ( = ?auto_304624 ?auto_304627 ) ) ( not ( = ?auto_304624 ?auto_304628 ) ) ( not ( = ?auto_304624 ?auto_304629 ) ) ( not ( = ?auto_304625 ?auto_304626 ) ) ( not ( = ?auto_304625 ?auto_304627 ) ) ( not ( = ?auto_304625 ?auto_304628 ) ) ( not ( = ?auto_304625 ?auto_304629 ) ) ( not ( = ?auto_304626 ?auto_304627 ) ) ( not ( = ?auto_304626 ?auto_304628 ) ) ( not ( = ?auto_304626 ?auto_304629 ) ) ( not ( = ?auto_304627 ?auto_304628 ) ) ( not ( = ?auto_304627 ?auto_304629 ) ) ( not ( = ?auto_304628 ?auto_304629 ) ) ( ON ?auto_304627 ?auto_304628 ) ( ON ?auto_304626 ?auto_304627 ) ( ON ?auto_304625 ?auto_304626 ) ( ON ?auto_304624 ?auto_304625 ) ( ON ?auto_304623 ?auto_304624 ) ( ON ?auto_304622 ?auto_304623 ) ( ON ?auto_304621 ?auto_304622 ) ( ON ?auto_304620 ?auto_304621 ) ( CLEAR ?auto_304618 ) ( ON ?auto_304619 ?auto_304620 ) ( CLEAR ?auto_304619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_304615 ?auto_304616 ?auto_304617 ?auto_304618 ?auto_304619 )
      ( MAKE-14PILE ?auto_304615 ?auto_304616 ?auto_304617 ?auto_304618 ?auto_304619 ?auto_304620 ?auto_304621 ?auto_304622 ?auto_304623 ?auto_304624 ?auto_304625 ?auto_304626 ?auto_304627 ?auto_304628 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304644 - BLOCK
      ?auto_304645 - BLOCK
      ?auto_304646 - BLOCK
      ?auto_304647 - BLOCK
      ?auto_304648 - BLOCK
      ?auto_304649 - BLOCK
      ?auto_304650 - BLOCK
      ?auto_304651 - BLOCK
      ?auto_304652 - BLOCK
      ?auto_304653 - BLOCK
      ?auto_304654 - BLOCK
      ?auto_304655 - BLOCK
      ?auto_304656 - BLOCK
      ?auto_304657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304657 ) ( ON-TABLE ?auto_304644 ) ( ON ?auto_304645 ?auto_304644 ) ( ON ?auto_304646 ?auto_304645 ) ( ON ?auto_304647 ?auto_304646 ) ( not ( = ?auto_304644 ?auto_304645 ) ) ( not ( = ?auto_304644 ?auto_304646 ) ) ( not ( = ?auto_304644 ?auto_304647 ) ) ( not ( = ?auto_304644 ?auto_304648 ) ) ( not ( = ?auto_304644 ?auto_304649 ) ) ( not ( = ?auto_304644 ?auto_304650 ) ) ( not ( = ?auto_304644 ?auto_304651 ) ) ( not ( = ?auto_304644 ?auto_304652 ) ) ( not ( = ?auto_304644 ?auto_304653 ) ) ( not ( = ?auto_304644 ?auto_304654 ) ) ( not ( = ?auto_304644 ?auto_304655 ) ) ( not ( = ?auto_304644 ?auto_304656 ) ) ( not ( = ?auto_304644 ?auto_304657 ) ) ( not ( = ?auto_304645 ?auto_304646 ) ) ( not ( = ?auto_304645 ?auto_304647 ) ) ( not ( = ?auto_304645 ?auto_304648 ) ) ( not ( = ?auto_304645 ?auto_304649 ) ) ( not ( = ?auto_304645 ?auto_304650 ) ) ( not ( = ?auto_304645 ?auto_304651 ) ) ( not ( = ?auto_304645 ?auto_304652 ) ) ( not ( = ?auto_304645 ?auto_304653 ) ) ( not ( = ?auto_304645 ?auto_304654 ) ) ( not ( = ?auto_304645 ?auto_304655 ) ) ( not ( = ?auto_304645 ?auto_304656 ) ) ( not ( = ?auto_304645 ?auto_304657 ) ) ( not ( = ?auto_304646 ?auto_304647 ) ) ( not ( = ?auto_304646 ?auto_304648 ) ) ( not ( = ?auto_304646 ?auto_304649 ) ) ( not ( = ?auto_304646 ?auto_304650 ) ) ( not ( = ?auto_304646 ?auto_304651 ) ) ( not ( = ?auto_304646 ?auto_304652 ) ) ( not ( = ?auto_304646 ?auto_304653 ) ) ( not ( = ?auto_304646 ?auto_304654 ) ) ( not ( = ?auto_304646 ?auto_304655 ) ) ( not ( = ?auto_304646 ?auto_304656 ) ) ( not ( = ?auto_304646 ?auto_304657 ) ) ( not ( = ?auto_304647 ?auto_304648 ) ) ( not ( = ?auto_304647 ?auto_304649 ) ) ( not ( = ?auto_304647 ?auto_304650 ) ) ( not ( = ?auto_304647 ?auto_304651 ) ) ( not ( = ?auto_304647 ?auto_304652 ) ) ( not ( = ?auto_304647 ?auto_304653 ) ) ( not ( = ?auto_304647 ?auto_304654 ) ) ( not ( = ?auto_304647 ?auto_304655 ) ) ( not ( = ?auto_304647 ?auto_304656 ) ) ( not ( = ?auto_304647 ?auto_304657 ) ) ( not ( = ?auto_304648 ?auto_304649 ) ) ( not ( = ?auto_304648 ?auto_304650 ) ) ( not ( = ?auto_304648 ?auto_304651 ) ) ( not ( = ?auto_304648 ?auto_304652 ) ) ( not ( = ?auto_304648 ?auto_304653 ) ) ( not ( = ?auto_304648 ?auto_304654 ) ) ( not ( = ?auto_304648 ?auto_304655 ) ) ( not ( = ?auto_304648 ?auto_304656 ) ) ( not ( = ?auto_304648 ?auto_304657 ) ) ( not ( = ?auto_304649 ?auto_304650 ) ) ( not ( = ?auto_304649 ?auto_304651 ) ) ( not ( = ?auto_304649 ?auto_304652 ) ) ( not ( = ?auto_304649 ?auto_304653 ) ) ( not ( = ?auto_304649 ?auto_304654 ) ) ( not ( = ?auto_304649 ?auto_304655 ) ) ( not ( = ?auto_304649 ?auto_304656 ) ) ( not ( = ?auto_304649 ?auto_304657 ) ) ( not ( = ?auto_304650 ?auto_304651 ) ) ( not ( = ?auto_304650 ?auto_304652 ) ) ( not ( = ?auto_304650 ?auto_304653 ) ) ( not ( = ?auto_304650 ?auto_304654 ) ) ( not ( = ?auto_304650 ?auto_304655 ) ) ( not ( = ?auto_304650 ?auto_304656 ) ) ( not ( = ?auto_304650 ?auto_304657 ) ) ( not ( = ?auto_304651 ?auto_304652 ) ) ( not ( = ?auto_304651 ?auto_304653 ) ) ( not ( = ?auto_304651 ?auto_304654 ) ) ( not ( = ?auto_304651 ?auto_304655 ) ) ( not ( = ?auto_304651 ?auto_304656 ) ) ( not ( = ?auto_304651 ?auto_304657 ) ) ( not ( = ?auto_304652 ?auto_304653 ) ) ( not ( = ?auto_304652 ?auto_304654 ) ) ( not ( = ?auto_304652 ?auto_304655 ) ) ( not ( = ?auto_304652 ?auto_304656 ) ) ( not ( = ?auto_304652 ?auto_304657 ) ) ( not ( = ?auto_304653 ?auto_304654 ) ) ( not ( = ?auto_304653 ?auto_304655 ) ) ( not ( = ?auto_304653 ?auto_304656 ) ) ( not ( = ?auto_304653 ?auto_304657 ) ) ( not ( = ?auto_304654 ?auto_304655 ) ) ( not ( = ?auto_304654 ?auto_304656 ) ) ( not ( = ?auto_304654 ?auto_304657 ) ) ( not ( = ?auto_304655 ?auto_304656 ) ) ( not ( = ?auto_304655 ?auto_304657 ) ) ( not ( = ?auto_304656 ?auto_304657 ) ) ( ON ?auto_304656 ?auto_304657 ) ( ON ?auto_304655 ?auto_304656 ) ( ON ?auto_304654 ?auto_304655 ) ( ON ?auto_304653 ?auto_304654 ) ( ON ?auto_304652 ?auto_304653 ) ( ON ?auto_304651 ?auto_304652 ) ( ON ?auto_304650 ?auto_304651 ) ( ON ?auto_304649 ?auto_304650 ) ( CLEAR ?auto_304647 ) ( ON ?auto_304648 ?auto_304649 ) ( CLEAR ?auto_304648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_304644 ?auto_304645 ?auto_304646 ?auto_304647 ?auto_304648 )
      ( MAKE-14PILE ?auto_304644 ?auto_304645 ?auto_304646 ?auto_304647 ?auto_304648 ?auto_304649 ?auto_304650 ?auto_304651 ?auto_304652 ?auto_304653 ?auto_304654 ?auto_304655 ?auto_304656 ?auto_304657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304672 - BLOCK
      ?auto_304673 - BLOCK
      ?auto_304674 - BLOCK
      ?auto_304675 - BLOCK
      ?auto_304676 - BLOCK
      ?auto_304677 - BLOCK
      ?auto_304678 - BLOCK
      ?auto_304679 - BLOCK
      ?auto_304680 - BLOCK
      ?auto_304681 - BLOCK
      ?auto_304682 - BLOCK
      ?auto_304683 - BLOCK
      ?auto_304684 - BLOCK
      ?auto_304685 - BLOCK
    )
    :vars
    (
      ?auto_304686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304685 ?auto_304686 ) ( ON-TABLE ?auto_304672 ) ( ON ?auto_304673 ?auto_304672 ) ( ON ?auto_304674 ?auto_304673 ) ( not ( = ?auto_304672 ?auto_304673 ) ) ( not ( = ?auto_304672 ?auto_304674 ) ) ( not ( = ?auto_304672 ?auto_304675 ) ) ( not ( = ?auto_304672 ?auto_304676 ) ) ( not ( = ?auto_304672 ?auto_304677 ) ) ( not ( = ?auto_304672 ?auto_304678 ) ) ( not ( = ?auto_304672 ?auto_304679 ) ) ( not ( = ?auto_304672 ?auto_304680 ) ) ( not ( = ?auto_304672 ?auto_304681 ) ) ( not ( = ?auto_304672 ?auto_304682 ) ) ( not ( = ?auto_304672 ?auto_304683 ) ) ( not ( = ?auto_304672 ?auto_304684 ) ) ( not ( = ?auto_304672 ?auto_304685 ) ) ( not ( = ?auto_304672 ?auto_304686 ) ) ( not ( = ?auto_304673 ?auto_304674 ) ) ( not ( = ?auto_304673 ?auto_304675 ) ) ( not ( = ?auto_304673 ?auto_304676 ) ) ( not ( = ?auto_304673 ?auto_304677 ) ) ( not ( = ?auto_304673 ?auto_304678 ) ) ( not ( = ?auto_304673 ?auto_304679 ) ) ( not ( = ?auto_304673 ?auto_304680 ) ) ( not ( = ?auto_304673 ?auto_304681 ) ) ( not ( = ?auto_304673 ?auto_304682 ) ) ( not ( = ?auto_304673 ?auto_304683 ) ) ( not ( = ?auto_304673 ?auto_304684 ) ) ( not ( = ?auto_304673 ?auto_304685 ) ) ( not ( = ?auto_304673 ?auto_304686 ) ) ( not ( = ?auto_304674 ?auto_304675 ) ) ( not ( = ?auto_304674 ?auto_304676 ) ) ( not ( = ?auto_304674 ?auto_304677 ) ) ( not ( = ?auto_304674 ?auto_304678 ) ) ( not ( = ?auto_304674 ?auto_304679 ) ) ( not ( = ?auto_304674 ?auto_304680 ) ) ( not ( = ?auto_304674 ?auto_304681 ) ) ( not ( = ?auto_304674 ?auto_304682 ) ) ( not ( = ?auto_304674 ?auto_304683 ) ) ( not ( = ?auto_304674 ?auto_304684 ) ) ( not ( = ?auto_304674 ?auto_304685 ) ) ( not ( = ?auto_304674 ?auto_304686 ) ) ( not ( = ?auto_304675 ?auto_304676 ) ) ( not ( = ?auto_304675 ?auto_304677 ) ) ( not ( = ?auto_304675 ?auto_304678 ) ) ( not ( = ?auto_304675 ?auto_304679 ) ) ( not ( = ?auto_304675 ?auto_304680 ) ) ( not ( = ?auto_304675 ?auto_304681 ) ) ( not ( = ?auto_304675 ?auto_304682 ) ) ( not ( = ?auto_304675 ?auto_304683 ) ) ( not ( = ?auto_304675 ?auto_304684 ) ) ( not ( = ?auto_304675 ?auto_304685 ) ) ( not ( = ?auto_304675 ?auto_304686 ) ) ( not ( = ?auto_304676 ?auto_304677 ) ) ( not ( = ?auto_304676 ?auto_304678 ) ) ( not ( = ?auto_304676 ?auto_304679 ) ) ( not ( = ?auto_304676 ?auto_304680 ) ) ( not ( = ?auto_304676 ?auto_304681 ) ) ( not ( = ?auto_304676 ?auto_304682 ) ) ( not ( = ?auto_304676 ?auto_304683 ) ) ( not ( = ?auto_304676 ?auto_304684 ) ) ( not ( = ?auto_304676 ?auto_304685 ) ) ( not ( = ?auto_304676 ?auto_304686 ) ) ( not ( = ?auto_304677 ?auto_304678 ) ) ( not ( = ?auto_304677 ?auto_304679 ) ) ( not ( = ?auto_304677 ?auto_304680 ) ) ( not ( = ?auto_304677 ?auto_304681 ) ) ( not ( = ?auto_304677 ?auto_304682 ) ) ( not ( = ?auto_304677 ?auto_304683 ) ) ( not ( = ?auto_304677 ?auto_304684 ) ) ( not ( = ?auto_304677 ?auto_304685 ) ) ( not ( = ?auto_304677 ?auto_304686 ) ) ( not ( = ?auto_304678 ?auto_304679 ) ) ( not ( = ?auto_304678 ?auto_304680 ) ) ( not ( = ?auto_304678 ?auto_304681 ) ) ( not ( = ?auto_304678 ?auto_304682 ) ) ( not ( = ?auto_304678 ?auto_304683 ) ) ( not ( = ?auto_304678 ?auto_304684 ) ) ( not ( = ?auto_304678 ?auto_304685 ) ) ( not ( = ?auto_304678 ?auto_304686 ) ) ( not ( = ?auto_304679 ?auto_304680 ) ) ( not ( = ?auto_304679 ?auto_304681 ) ) ( not ( = ?auto_304679 ?auto_304682 ) ) ( not ( = ?auto_304679 ?auto_304683 ) ) ( not ( = ?auto_304679 ?auto_304684 ) ) ( not ( = ?auto_304679 ?auto_304685 ) ) ( not ( = ?auto_304679 ?auto_304686 ) ) ( not ( = ?auto_304680 ?auto_304681 ) ) ( not ( = ?auto_304680 ?auto_304682 ) ) ( not ( = ?auto_304680 ?auto_304683 ) ) ( not ( = ?auto_304680 ?auto_304684 ) ) ( not ( = ?auto_304680 ?auto_304685 ) ) ( not ( = ?auto_304680 ?auto_304686 ) ) ( not ( = ?auto_304681 ?auto_304682 ) ) ( not ( = ?auto_304681 ?auto_304683 ) ) ( not ( = ?auto_304681 ?auto_304684 ) ) ( not ( = ?auto_304681 ?auto_304685 ) ) ( not ( = ?auto_304681 ?auto_304686 ) ) ( not ( = ?auto_304682 ?auto_304683 ) ) ( not ( = ?auto_304682 ?auto_304684 ) ) ( not ( = ?auto_304682 ?auto_304685 ) ) ( not ( = ?auto_304682 ?auto_304686 ) ) ( not ( = ?auto_304683 ?auto_304684 ) ) ( not ( = ?auto_304683 ?auto_304685 ) ) ( not ( = ?auto_304683 ?auto_304686 ) ) ( not ( = ?auto_304684 ?auto_304685 ) ) ( not ( = ?auto_304684 ?auto_304686 ) ) ( not ( = ?auto_304685 ?auto_304686 ) ) ( ON ?auto_304684 ?auto_304685 ) ( ON ?auto_304683 ?auto_304684 ) ( ON ?auto_304682 ?auto_304683 ) ( ON ?auto_304681 ?auto_304682 ) ( ON ?auto_304680 ?auto_304681 ) ( ON ?auto_304679 ?auto_304680 ) ( ON ?auto_304678 ?auto_304679 ) ( ON ?auto_304677 ?auto_304678 ) ( ON ?auto_304676 ?auto_304677 ) ( CLEAR ?auto_304674 ) ( ON ?auto_304675 ?auto_304676 ) ( CLEAR ?auto_304675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_304672 ?auto_304673 ?auto_304674 ?auto_304675 )
      ( MAKE-14PILE ?auto_304672 ?auto_304673 ?auto_304674 ?auto_304675 ?auto_304676 ?auto_304677 ?auto_304678 ?auto_304679 ?auto_304680 ?auto_304681 ?auto_304682 ?auto_304683 ?auto_304684 ?auto_304685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304701 - BLOCK
      ?auto_304702 - BLOCK
      ?auto_304703 - BLOCK
      ?auto_304704 - BLOCK
      ?auto_304705 - BLOCK
      ?auto_304706 - BLOCK
      ?auto_304707 - BLOCK
      ?auto_304708 - BLOCK
      ?auto_304709 - BLOCK
      ?auto_304710 - BLOCK
      ?auto_304711 - BLOCK
      ?auto_304712 - BLOCK
      ?auto_304713 - BLOCK
      ?auto_304714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304714 ) ( ON-TABLE ?auto_304701 ) ( ON ?auto_304702 ?auto_304701 ) ( ON ?auto_304703 ?auto_304702 ) ( not ( = ?auto_304701 ?auto_304702 ) ) ( not ( = ?auto_304701 ?auto_304703 ) ) ( not ( = ?auto_304701 ?auto_304704 ) ) ( not ( = ?auto_304701 ?auto_304705 ) ) ( not ( = ?auto_304701 ?auto_304706 ) ) ( not ( = ?auto_304701 ?auto_304707 ) ) ( not ( = ?auto_304701 ?auto_304708 ) ) ( not ( = ?auto_304701 ?auto_304709 ) ) ( not ( = ?auto_304701 ?auto_304710 ) ) ( not ( = ?auto_304701 ?auto_304711 ) ) ( not ( = ?auto_304701 ?auto_304712 ) ) ( not ( = ?auto_304701 ?auto_304713 ) ) ( not ( = ?auto_304701 ?auto_304714 ) ) ( not ( = ?auto_304702 ?auto_304703 ) ) ( not ( = ?auto_304702 ?auto_304704 ) ) ( not ( = ?auto_304702 ?auto_304705 ) ) ( not ( = ?auto_304702 ?auto_304706 ) ) ( not ( = ?auto_304702 ?auto_304707 ) ) ( not ( = ?auto_304702 ?auto_304708 ) ) ( not ( = ?auto_304702 ?auto_304709 ) ) ( not ( = ?auto_304702 ?auto_304710 ) ) ( not ( = ?auto_304702 ?auto_304711 ) ) ( not ( = ?auto_304702 ?auto_304712 ) ) ( not ( = ?auto_304702 ?auto_304713 ) ) ( not ( = ?auto_304702 ?auto_304714 ) ) ( not ( = ?auto_304703 ?auto_304704 ) ) ( not ( = ?auto_304703 ?auto_304705 ) ) ( not ( = ?auto_304703 ?auto_304706 ) ) ( not ( = ?auto_304703 ?auto_304707 ) ) ( not ( = ?auto_304703 ?auto_304708 ) ) ( not ( = ?auto_304703 ?auto_304709 ) ) ( not ( = ?auto_304703 ?auto_304710 ) ) ( not ( = ?auto_304703 ?auto_304711 ) ) ( not ( = ?auto_304703 ?auto_304712 ) ) ( not ( = ?auto_304703 ?auto_304713 ) ) ( not ( = ?auto_304703 ?auto_304714 ) ) ( not ( = ?auto_304704 ?auto_304705 ) ) ( not ( = ?auto_304704 ?auto_304706 ) ) ( not ( = ?auto_304704 ?auto_304707 ) ) ( not ( = ?auto_304704 ?auto_304708 ) ) ( not ( = ?auto_304704 ?auto_304709 ) ) ( not ( = ?auto_304704 ?auto_304710 ) ) ( not ( = ?auto_304704 ?auto_304711 ) ) ( not ( = ?auto_304704 ?auto_304712 ) ) ( not ( = ?auto_304704 ?auto_304713 ) ) ( not ( = ?auto_304704 ?auto_304714 ) ) ( not ( = ?auto_304705 ?auto_304706 ) ) ( not ( = ?auto_304705 ?auto_304707 ) ) ( not ( = ?auto_304705 ?auto_304708 ) ) ( not ( = ?auto_304705 ?auto_304709 ) ) ( not ( = ?auto_304705 ?auto_304710 ) ) ( not ( = ?auto_304705 ?auto_304711 ) ) ( not ( = ?auto_304705 ?auto_304712 ) ) ( not ( = ?auto_304705 ?auto_304713 ) ) ( not ( = ?auto_304705 ?auto_304714 ) ) ( not ( = ?auto_304706 ?auto_304707 ) ) ( not ( = ?auto_304706 ?auto_304708 ) ) ( not ( = ?auto_304706 ?auto_304709 ) ) ( not ( = ?auto_304706 ?auto_304710 ) ) ( not ( = ?auto_304706 ?auto_304711 ) ) ( not ( = ?auto_304706 ?auto_304712 ) ) ( not ( = ?auto_304706 ?auto_304713 ) ) ( not ( = ?auto_304706 ?auto_304714 ) ) ( not ( = ?auto_304707 ?auto_304708 ) ) ( not ( = ?auto_304707 ?auto_304709 ) ) ( not ( = ?auto_304707 ?auto_304710 ) ) ( not ( = ?auto_304707 ?auto_304711 ) ) ( not ( = ?auto_304707 ?auto_304712 ) ) ( not ( = ?auto_304707 ?auto_304713 ) ) ( not ( = ?auto_304707 ?auto_304714 ) ) ( not ( = ?auto_304708 ?auto_304709 ) ) ( not ( = ?auto_304708 ?auto_304710 ) ) ( not ( = ?auto_304708 ?auto_304711 ) ) ( not ( = ?auto_304708 ?auto_304712 ) ) ( not ( = ?auto_304708 ?auto_304713 ) ) ( not ( = ?auto_304708 ?auto_304714 ) ) ( not ( = ?auto_304709 ?auto_304710 ) ) ( not ( = ?auto_304709 ?auto_304711 ) ) ( not ( = ?auto_304709 ?auto_304712 ) ) ( not ( = ?auto_304709 ?auto_304713 ) ) ( not ( = ?auto_304709 ?auto_304714 ) ) ( not ( = ?auto_304710 ?auto_304711 ) ) ( not ( = ?auto_304710 ?auto_304712 ) ) ( not ( = ?auto_304710 ?auto_304713 ) ) ( not ( = ?auto_304710 ?auto_304714 ) ) ( not ( = ?auto_304711 ?auto_304712 ) ) ( not ( = ?auto_304711 ?auto_304713 ) ) ( not ( = ?auto_304711 ?auto_304714 ) ) ( not ( = ?auto_304712 ?auto_304713 ) ) ( not ( = ?auto_304712 ?auto_304714 ) ) ( not ( = ?auto_304713 ?auto_304714 ) ) ( ON ?auto_304713 ?auto_304714 ) ( ON ?auto_304712 ?auto_304713 ) ( ON ?auto_304711 ?auto_304712 ) ( ON ?auto_304710 ?auto_304711 ) ( ON ?auto_304709 ?auto_304710 ) ( ON ?auto_304708 ?auto_304709 ) ( ON ?auto_304707 ?auto_304708 ) ( ON ?auto_304706 ?auto_304707 ) ( ON ?auto_304705 ?auto_304706 ) ( CLEAR ?auto_304703 ) ( ON ?auto_304704 ?auto_304705 ) ( CLEAR ?auto_304704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_304701 ?auto_304702 ?auto_304703 ?auto_304704 )
      ( MAKE-14PILE ?auto_304701 ?auto_304702 ?auto_304703 ?auto_304704 ?auto_304705 ?auto_304706 ?auto_304707 ?auto_304708 ?auto_304709 ?auto_304710 ?auto_304711 ?auto_304712 ?auto_304713 ?auto_304714 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304729 - BLOCK
      ?auto_304730 - BLOCK
      ?auto_304731 - BLOCK
      ?auto_304732 - BLOCK
      ?auto_304733 - BLOCK
      ?auto_304734 - BLOCK
      ?auto_304735 - BLOCK
      ?auto_304736 - BLOCK
      ?auto_304737 - BLOCK
      ?auto_304738 - BLOCK
      ?auto_304739 - BLOCK
      ?auto_304740 - BLOCK
      ?auto_304741 - BLOCK
      ?auto_304742 - BLOCK
    )
    :vars
    (
      ?auto_304743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304742 ?auto_304743 ) ( ON-TABLE ?auto_304729 ) ( ON ?auto_304730 ?auto_304729 ) ( not ( = ?auto_304729 ?auto_304730 ) ) ( not ( = ?auto_304729 ?auto_304731 ) ) ( not ( = ?auto_304729 ?auto_304732 ) ) ( not ( = ?auto_304729 ?auto_304733 ) ) ( not ( = ?auto_304729 ?auto_304734 ) ) ( not ( = ?auto_304729 ?auto_304735 ) ) ( not ( = ?auto_304729 ?auto_304736 ) ) ( not ( = ?auto_304729 ?auto_304737 ) ) ( not ( = ?auto_304729 ?auto_304738 ) ) ( not ( = ?auto_304729 ?auto_304739 ) ) ( not ( = ?auto_304729 ?auto_304740 ) ) ( not ( = ?auto_304729 ?auto_304741 ) ) ( not ( = ?auto_304729 ?auto_304742 ) ) ( not ( = ?auto_304729 ?auto_304743 ) ) ( not ( = ?auto_304730 ?auto_304731 ) ) ( not ( = ?auto_304730 ?auto_304732 ) ) ( not ( = ?auto_304730 ?auto_304733 ) ) ( not ( = ?auto_304730 ?auto_304734 ) ) ( not ( = ?auto_304730 ?auto_304735 ) ) ( not ( = ?auto_304730 ?auto_304736 ) ) ( not ( = ?auto_304730 ?auto_304737 ) ) ( not ( = ?auto_304730 ?auto_304738 ) ) ( not ( = ?auto_304730 ?auto_304739 ) ) ( not ( = ?auto_304730 ?auto_304740 ) ) ( not ( = ?auto_304730 ?auto_304741 ) ) ( not ( = ?auto_304730 ?auto_304742 ) ) ( not ( = ?auto_304730 ?auto_304743 ) ) ( not ( = ?auto_304731 ?auto_304732 ) ) ( not ( = ?auto_304731 ?auto_304733 ) ) ( not ( = ?auto_304731 ?auto_304734 ) ) ( not ( = ?auto_304731 ?auto_304735 ) ) ( not ( = ?auto_304731 ?auto_304736 ) ) ( not ( = ?auto_304731 ?auto_304737 ) ) ( not ( = ?auto_304731 ?auto_304738 ) ) ( not ( = ?auto_304731 ?auto_304739 ) ) ( not ( = ?auto_304731 ?auto_304740 ) ) ( not ( = ?auto_304731 ?auto_304741 ) ) ( not ( = ?auto_304731 ?auto_304742 ) ) ( not ( = ?auto_304731 ?auto_304743 ) ) ( not ( = ?auto_304732 ?auto_304733 ) ) ( not ( = ?auto_304732 ?auto_304734 ) ) ( not ( = ?auto_304732 ?auto_304735 ) ) ( not ( = ?auto_304732 ?auto_304736 ) ) ( not ( = ?auto_304732 ?auto_304737 ) ) ( not ( = ?auto_304732 ?auto_304738 ) ) ( not ( = ?auto_304732 ?auto_304739 ) ) ( not ( = ?auto_304732 ?auto_304740 ) ) ( not ( = ?auto_304732 ?auto_304741 ) ) ( not ( = ?auto_304732 ?auto_304742 ) ) ( not ( = ?auto_304732 ?auto_304743 ) ) ( not ( = ?auto_304733 ?auto_304734 ) ) ( not ( = ?auto_304733 ?auto_304735 ) ) ( not ( = ?auto_304733 ?auto_304736 ) ) ( not ( = ?auto_304733 ?auto_304737 ) ) ( not ( = ?auto_304733 ?auto_304738 ) ) ( not ( = ?auto_304733 ?auto_304739 ) ) ( not ( = ?auto_304733 ?auto_304740 ) ) ( not ( = ?auto_304733 ?auto_304741 ) ) ( not ( = ?auto_304733 ?auto_304742 ) ) ( not ( = ?auto_304733 ?auto_304743 ) ) ( not ( = ?auto_304734 ?auto_304735 ) ) ( not ( = ?auto_304734 ?auto_304736 ) ) ( not ( = ?auto_304734 ?auto_304737 ) ) ( not ( = ?auto_304734 ?auto_304738 ) ) ( not ( = ?auto_304734 ?auto_304739 ) ) ( not ( = ?auto_304734 ?auto_304740 ) ) ( not ( = ?auto_304734 ?auto_304741 ) ) ( not ( = ?auto_304734 ?auto_304742 ) ) ( not ( = ?auto_304734 ?auto_304743 ) ) ( not ( = ?auto_304735 ?auto_304736 ) ) ( not ( = ?auto_304735 ?auto_304737 ) ) ( not ( = ?auto_304735 ?auto_304738 ) ) ( not ( = ?auto_304735 ?auto_304739 ) ) ( not ( = ?auto_304735 ?auto_304740 ) ) ( not ( = ?auto_304735 ?auto_304741 ) ) ( not ( = ?auto_304735 ?auto_304742 ) ) ( not ( = ?auto_304735 ?auto_304743 ) ) ( not ( = ?auto_304736 ?auto_304737 ) ) ( not ( = ?auto_304736 ?auto_304738 ) ) ( not ( = ?auto_304736 ?auto_304739 ) ) ( not ( = ?auto_304736 ?auto_304740 ) ) ( not ( = ?auto_304736 ?auto_304741 ) ) ( not ( = ?auto_304736 ?auto_304742 ) ) ( not ( = ?auto_304736 ?auto_304743 ) ) ( not ( = ?auto_304737 ?auto_304738 ) ) ( not ( = ?auto_304737 ?auto_304739 ) ) ( not ( = ?auto_304737 ?auto_304740 ) ) ( not ( = ?auto_304737 ?auto_304741 ) ) ( not ( = ?auto_304737 ?auto_304742 ) ) ( not ( = ?auto_304737 ?auto_304743 ) ) ( not ( = ?auto_304738 ?auto_304739 ) ) ( not ( = ?auto_304738 ?auto_304740 ) ) ( not ( = ?auto_304738 ?auto_304741 ) ) ( not ( = ?auto_304738 ?auto_304742 ) ) ( not ( = ?auto_304738 ?auto_304743 ) ) ( not ( = ?auto_304739 ?auto_304740 ) ) ( not ( = ?auto_304739 ?auto_304741 ) ) ( not ( = ?auto_304739 ?auto_304742 ) ) ( not ( = ?auto_304739 ?auto_304743 ) ) ( not ( = ?auto_304740 ?auto_304741 ) ) ( not ( = ?auto_304740 ?auto_304742 ) ) ( not ( = ?auto_304740 ?auto_304743 ) ) ( not ( = ?auto_304741 ?auto_304742 ) ) ( not ( = ?auto_304741 ?auto_304743 ) ) ( not ( = ?auto_304742 ?auto_304743 ) ) ( ON ?auto_304741 ?auto_304742 ) ( ON ?auto_304740 ?auto_304741 ) ( ON ?auto_304739 ?auto_304740 ) ( ON ?auto_304738 ?auto_304739 ) ( ON ?auto_304737 ?auto_304738 ) ( ON ?auto_304736 ?auto_304737 ) ( ON ?auto_304735 ?auto_304736 ) ( ON ?auto_304734 ?auto_304735 ) ( ON ?auto_304733 ?auto_304734 ) ( ON ?auto_304732 ?auto_304733 ) ( CLEAR ?auto_304730 ) ( ON ?auto_304731 ?auto_304732 ) ( CLEAR ?auto_304731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_304729 ?auto_304730 ?auto_304731 )
      ( MAKE-14PILE ?auto_304729 ?auto_304730 ?auto_304731 ?auto_304732 ?auto_304733 ?auto_304734 ?auto_304735 ?auto_304736 ?auto_304737 ?auto_304738 ?auto_304739 ?auto_304740 ?auto_304741 ?auto_304742 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304758 - BLOCK
      ?auto_304759 - BLOCK
      ?auto_304760 - BLOCK
      ?auto_304761 - BLOCK
      ?auto_304762 - BLOCK
      ?auto_304763 - BLOCK
      ?auto_304764 - BLOCK
      ?auto_304765 - BLOCK
      ?auto_304766 - BLOCK
      ?auto_304767 - BLOCK
      ?auto_304768 - BLOCK
      ?auto_304769 - BLOCK
      ?auto_304770 - BLOCK
      ?auto_304771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304771 ) ( ON-TABLE ?auto_304758 ) ( ON ?auto_304759 ?auto_304758 ) ( not ( = ?auto_304758 ?auto_304759 ) ) ( not ( = ?auto_304758 ?auto_304760 ) ) ( not ( = ?auto_304758 ?auto_304761 ) ) ( not ( = ?auto_304758 ?auto_304762 ) ) ( not ( = ?auto_304758 ?auto_304763 ) ) ( not ( = ?auto_304758 ?auto_304764 ) ) ( not ( = ?auto_304758 ?auto_304765 ) ) ( not ( = ?auto_304758 ?auto_304766 ) ) ( not ( = ?auto_304758 ?auto_304767 ) ) ( not ( = ?auto_304758 ?auto_304768 ) ) ( not ( = ?auto_304758 ?auto_304769 ) ) ( not ( = ?auto_304758 ?auto_304770 ) ) ( not ( = ?auto_304758 ?auto_304771 ) ) ( not ( = ?auto_304759 ?auto_304760 ) ) ( not ( = ?auto_304759 ?auto_304761 ) ) ( not ( = ?auto_304759 ?auto_304762 ) ) ( not ( = ?auto_304759 ?auto_304763 ) ) ( not ( = ?auto_304759 ?auto_304764 ) ) ( not ( = ?auto_304759 ?auto_304765 ) ) ( not ( = ?auto_304759 ?auto_304766 ) ) ( not ( = ?auto_304759 ?auto_304767 ) ) ( not ( = ?auto_304759 ?auto_304768 ) ) ( not ( = ?auto_304759 ?auto_304769 ) ) ( not ( = ?auto_304759 ?auto_304770 ) ) ( not ( = ?auto_304759 ?auto_304771 ) ) ( not ( = ?auto_304760 ?auto_304761 ) ) ( not ( = ?auto_304760 ?auto_304762 ) ) ( not ( = ?auto_304760 ?auto_304763 ) ) ( not ( = ?auto_304760 ?auto_304764 ) ) ( not ( = ?auto_304760 ?auto_304765 ) ) ( not ( = ?auto_304760 ?auto_304766 ) ) ( not ( = ?auto_304760 ?auto_304767 ) ) ( not ( = ?auto_304760 ?auto_304768 ) ) ( not ( = ?auto_304760 ?auto_304769 ) ) ( not ( = ?auto_304760 ?auto_304770 ) ) ( not ( = ?auto_304760 ?auto_304771 ) ) ( not ( = ?auto_304761 ?auto_304762 ) ) ( not ( = ?auto_304761 ?auto_304763 ) ) ( not ( = ?auto_304761 ?auto_304764 ) ) ( not ( = ?auto_304761 ?auto_304765 ) ) ( not ( = ?auto_304761 ?auto_304766 ) ) ( not ( = ?auto_304761 ?auto_304767 ) ) ( not ( = ?auto_304761 ?auto_304768 ) ) ( not ( = ?auto_304761 ?auto_304769 ) ) ( not ( = ?auto_304761 ?auto_304770 ) ) ( not ( = ?auto_304761 ?auto_304771 ) ) ( not ( = ?auto_304762 ?auto_304763 ) ) ( not ( = ?auto_304762 ?auto_304764 ) ) ( not ( = ?auto_304762 ?auto_304765 ) ) ( not ( = ?auto_304762 ?auto_304766 ) ) ( not ( = ?auto_304762 ?auto_304767 ) ) ( not ( = ?auto_304762 ?auto_304768 ) ) ( not ( = ?auto_304762 ?auto_304769 ) ) ( not ( = ?auto_304762 ?auto_304770 ) ) ( not ( = ?auto_304762 ?auto_304771 ) ) ( not ( = ?auto_304763 ?auto_304764 ) ) ( not ( = ?auto_304763 ?auto_304765 ) ) ( not ( = ?auto_304763 ?auto_304766 ) ) ( not ( = ?auto_304763 ?auto_304767 ) ) ( not ( = ?auto_304763 ?auto_304768 ) ) ( not ( = ?auto_304763 ?auto_304769 ) ) ( not ( = ?auto_304763 ?auto_304770 ) ) ( not ( = ?auto_304763 ?auto_304771 ) ) ( not ( = ?auto_304764 ?auto_304765 ) ) ( not ( = ?auto_304764 ?auto_304766 ) ) ( not ( = ?auto_304764 ?auto_304767 ) ) ( not ( = ?auto_304764 ?auto_304768 ) ) ( not ( = ?auto_304764 ?auto_304769 ) ) ( not ( = ?auto_304764 ?auto_304770 ) ) ( not ( = ?auto_304764 ?auto_304771 ) ) ( not ( = ?auto_304765 ?auto_304766 ) ) ( not ( = ?auto_304765 ?auto_304767 ) ) ( not ( = ?auto_304765 ?auto_304768 ) ) ( not ( = ?auto_304765 ?auto_304769 ) ) ( not ( = ?auto_304765 ?auto_304770 ) ) ( not ( = ?auto_304765 ?auto_304771 ) ) ( not ( = ?auto_304766 ?auto_304767 ) ) ( not ( = ?auto_304766 ?auto_304768 ) ) ( not ( = ?auto_304766 ?auto_304769 ) ) ( not ( = ?auto_304766 ?auto_304770 ) ) ( not ( = ?auto_304766 ?auto_304771 ) ) ( not ( = ?auto_304767 ?auto_304768 ) ) ( not ( = ?auto_304767 ?auto_304769 ) ) ( not ( = ?auto_304767 ?auto_304770 ) ) ( not ( = ?auto_304767 ?auto_304771 ) ) ( not ( = ?auto_304768 ?auto_304769 ) ) ( not ( = ?auto_304768 ?auto_304770 ) ) ( not ( = ?auto_304768 ?auto_304771 ) ) ( not ( = ?auto_304769 ?auto_304770 ) ) ( not ( = ?auto_304769 ?auto_304771 ) ) ( not ( = ?auto_304770 ?auto_304771 ) ) ( ON ?auto_304770 ?auto_304771 ) ( ON ?auto_304769 ?auto_304770 ) ( ON ?auto_304768 ?auto_304769 ) ( ON ?auto_304767 ?auto_304768 ) ( ON ?auto_304766 ?auto_304767 ) ( ON ?auto_304765 ?auto_304766 ) ( ON ?auto_304764 ?auto_304765 ) ( ON ?auto_304763 ?auto_304764 ) ( ON ?auto_304762 ?auto_304763 ) ( ON ?auto_304761 ?auto_304762 ) ( CLEAR ?auto_304759 ) ( ON ?auto_304760 ?auto_304761 ) ( CLEAR ?auto_304760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_304758 ?auto_304759 ?auto_304760 )
      ( MAKE-14PILE ?auto_304758 ?auto_304759 ?auto_304760 ?auto_304761 ?auto_304762 ?auto_304763 ?auto_304764 ?auto_304765 ?auto_304766 ?auto_304767 ?auto_304768 ?auto_304769 ?auto_304770 ?auto_304771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304786 - BLOCK
      ?auto_304787 - BLOCK
      ?auto_304788 - BLOCK
      ?auto_304789 - BLOCK
      ?auto_304790 - BLOCK
      ?auto_304791 - BLOCK
      ?auto_304792 - BLOCK
      ?auto_304793 - BLOCK
      ?auto_304794 - BLOCK
      ?auto_304795 - BLOCK
      ?auto_304796 - BLOCK
      ?auto_304797 - BLOCK
      ?auto_304798 - BLOCK
      ?auto_304799 - BLOCK
    )
    :vars
    (
      ?auto_304800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304799 ?auto_304800 ) ( ON-TABLE ?auto_304786 ) ( not ( = ?auto_304786 ?auto_304787 ) ) ( not ( = ?auto_304786 ?auto_304788 ) ) ( not ( = ?auto_304786 ?auto_304789 ) ) ( not ( = ?auto_304786 ?auto_304790 ) ) ( not ( = ?auto_304786 ?auto_304791 ) ) ( not ( = ?auto_304786 ?auto_304792 ) ) ( not ( = ?auto_304786 ?auto_304793 ) ) ( not ( = ?auto_304786 ?auto_304794 ) ) ( not ( = ?auto_304786 ?auto_304795 ) ) ( not ( = ?auto_304786 ?auto_304796 ) ) ( not ( = ?auto_304786 ?auto_304797 ) ) ( not ( = ?auto_304786 ?auto_304798 ) ) ( not ( = ?auto_304786 ?auto_304799 ) ) ( not ( = ?auto_304786 ?auto_304800 ) ) ( not ( = ?auto_304787 ?auto_304788 ) ) ( not ( = ?auto_304787 ?auto_304789 ) ) ( not ( = ?auto_304787 ?auto_304790 ) ) ( not ( = ?auto_304787 ?auto_304791 ) ) ( not ( = ?auto_304787 ?auto_304792 ) ) ( not ( = ?auto_304787 ?auto_304793 ) ) ( not ( = ?auto_304787 ?auto_304794 ) ) ( not ( = ?auto_304787 ?auto_304795 ) ) ( not ( = ?auto_304787 ?auto_304796 ) ) ( not ( = ?auto_304787 ?auto_304797 ) ) ( not ( = ?auto_304787 ?auto_304798 ) ) ( not ( = ?auto_304787 ?auto_304799 ) ) ( not ( = ?auto_304787 ?auto_304800 ) ) ( not ( = ?auto_304788 ?auto_304789 ) ) ( not ( = ?auto_304788 ?auto_304790 ) ) ( not ( = ?auto_304788 ?auto_304791 ) ) ( not ( = ?auto_304788 ?auto_304792 ) ) ( not ( = ?auto_304788 ?auto_304793 ) ) ( not ( = ?auto_304788 ?auto_304794 ) ) ( not ( = ?auto_304788 ?auto_304795 ) ) ( not ( = ?auto_304788 ?auto_304796 ) ) ( not ( = ?auto_304788 ?auto_304797 ) ) ( not ( = ?auto_304788 ?auto_304798 ) ) ( not ( = ?auto_304788 ?auto_304799 ) ) ( not ( = ?auto_304788 ?auto_304800 ) ) ( not ( = ?auto_304789 ?auto_304790 ) ) ( not ( = ?auto_304789 ?auto_304791 ) ) ( not ( = ?auto_304789 ?auto_304792 ) ) ( not ( = ?auto_304789 ?auto_304793 ) ) ( not ( = ?auto_304789 ?auto_304794 ) ) ( not ( = ?auto_304789 ?auto_304795 ) ) ( not ( = ?auto_304789 ?auto_304796 ) ) ( not ( = ?auto_304789 ?auto_304797 ) ) ( not ( = ?auto_304789 ?auto_304798 ) ) ( not ( = ?auto_304789 ?auto_304799 ) ) ( not ( = ?auto_304789 ?auto_304800 ) ) ( not ( = ?auto_304790 ?auto_304791 ) ) ( not ( = ?auto_304790 ?auto_304792 ) ) ( not ( = ?auto_304790 ?auto_304793 ) ) ( not ( = ?auto_304790 ?auto_304794 ) ) ( not ( = ?auto_304790 ?auto_304795 ) ) ( not ( = ?auto_304790 ?auto_304796 ) ) ( not ( = ?auto_304790 ?auto_304797 ) ) ( not ( = ?auto_304790 ?auto_304798 ) ) ( not ( = ?auto_304790 ?auto_304799 ) ) ( not ( = ?auto_304790 ?auto_304800 ) ) ( not ( = ?auto_304791 ?auto_304792 ) ) ( not ( = ?auto_304791 ?auto_304793 ) ) ( not ( = ?auto_304791 ?auto_304794 ) ) ( not ( = ?auto_304791 ?auto_304795 ) ) ( not ( = ?auto_304791 ?auto_304796 ) ) ( not ( = ?auto_304791 ?auto_304797 ) ) ( not ( = ?auto_304791 ?auto_304798 ) ) ( not ( = ?auto_304791 ?auto_304799 ) ) ( not ( = ?auto_304791 ?auto_304800 ) ) ( not ( = ?auto_304792 ?auto_304793 ) ) ( not ( = ?auto_304792 ?auto_304794 ) ) ( not ( = ?auto_304792 ?auto_304795 ) ) ( not ( = ?auto_304792 ?auto_304796 ) ) ( not ( = ?auto_304792 ?auto_304797 ) ) ( not ( = ?auto_304792 ?auto_304798 ) ) ( not ( = ?auto_304792 ?auto_304799 ) ) ( not ( = ?auto_304792 ?auto_304800 ) ) ( not ( = ?auto_304793 ?auto_304794 ) ) ( not ( = ?auto_304793 ?auto_304795 ) ) ( not ( = ?auto_304793 ?auto_304796 ) ) ( not ( = ?auto_304793 ?auto_304797 ) ) ( not ( = ?auto_304793 ?auto_304798 ) ) ( not ( = ?auto_304793 ?auto_304799 ) ) ( not ( = ?auto_304793 ?auto_304800 ) ) ( not ( = ?auto_304794 ?auto_304795 ) ) ( not ( = ?auto_304794 ?auto_304796 ) ) ( not ( = ?auto_304794 ?auto_304797 ) ) ( not ( = ?auto_304794 ?auto_304798 ) ) ( not ( = ?auto_304794 ?auto_304799 ) ) ( not ( = ?auto_304794 ?auto_304800 ) ) ( not ( = ?auto_304795 ?auto_304796 ) ) ( not ( = ?auto_304795 ?auto_304797 ) ) ( not ( = ?auto_304795 ?auto_304798 ) ) ( not ( = ?auto_304795 ?auto_304799 ) ) ( not ( = ?auto_304795 ?auto_304800 ) ) ( not ( = ?auto_304796 ?auto_304797 ) ) ( not ( = ?auto_304796 ?auto_304798 ) ) ( not ( = ?auto_304796 ?auto_304799 ) ) ( not ( = ?auto_304796 ?auto_304800 ) ) ( not ( = ?auto_304797 ?auto_304798 ) ) ( not ( = ?auto_304797 ?auto_304799 ) ) ( not ( = ?auto_304797 ?auto_304800 ) ) ( not ( = ?auto_304798 ?auto_304799 ) ) ( not ( = ?auto_304798 ?auto_304800 ) ) ( not ( = ?auto_304799 ?auto_304800 ) ) ( ON ?auto_304798 ?auto_304799 ) ( ON ?auto_304797 ?auto_304798 ) ( ON ?auto_304796 ?auto_304797 ) ( ON ?auto_304795 ?auto_304796 ) ( ON ?auto_304794 ?auto_304795 ) ( ON ?auto_304793 ?auto_304794 ) ( ON ?auto_304792 ?auto_304793 ) ( ON ?auto_304791 ?auto_304792 ) ( ON ?auto_304790 ?auto_304791 ) ( ON ?auto_304789 ?auto_304790 ) ( ON ?auto_304788 ?auto_304789 ) ( CLEAR ?auto_304786 ) ( ON ?auto_304787 ?auto_304788 ) ( CLEAR ?auto_304787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_304786 ?auto_304787 )
      ( MAKE-14PILE ?auto_304786 ?auto_304787 ?auto_304788 ?auto_304789 ?auto_304790 ?auto_304791 ?auto_304792 ?auto_304793 ?auto_304794 ?auto_304795 ?auto_304796 ?auto_304797 ?auto_304798 ?auto_304799 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304815 - BLOCK
      ?auto_304816 - BLOCK
      ?auto_304817 - BLOCK
      ?auto_304818 - BLOCK
      ?auto_304819 - BLOCK
      ?auto_304820 - BLOCK
      ?auto_304821 - BLOCK
      ?auto_304822 - BLOCK
      ?auto_304823 - BLOCK
      ?auto_304824 - BLOCK
      ?auto_304825 - BLOCK
      ?auto_304826 - BLOCK
      ?auto_304827 - BLOCK
      ?auto_304828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304828 ) ( ON-TABLE ?auto_304815 ) ( not ( = ?auto_304815 ?auto_304816 ) ) ( not ( = ?auto_304815 ?auto_304817 ) ) ( not ( = ?auto_304815 ?auto_304818 ) ) ( not ( = ?auto_304815 ?auto_304819 ) ) ( not ( = ?auto_304815 ?auto_304820 ) ) ( not ( = ?auto_304815 ?auto_304821 ) ) ( not ( = ?auto_304815 ?auto_304822 ) ) ( not ( = ?auto_304815 ?auto_304823 ) ) ( not ( = ?auto_304815 ?auto_304824 ) ) ( not ( = ?auto_304815 ?auto_304825 ) ) ( not ( = ?auto_304815 ?auto_304826 ) ) ( not ( = ?auto_304815 ?auto_304827 ) ) ( not ( = ?auto_304815 ?auto_304828 ) ) ( not ( = ?auto_304816 ?auto_304817 ) ) ( not ( = ?auto_304816 ?auto_304818 ) ) ( not ( = ?auto_304816 ?auto_304819 ) ) ( not ( = ?auto_304816 ?auto_304820 ) ) ( not ( = ?auto_304816 ?auto_304821 ) ) ( not ( = ?auto_304816 ?auto_304822 ) ) ( not ( = ?auto_304816 ?auto_304823 ) ) ( not ( = ?auto_304816 ?auto_304824 ) ) ( not ( = ?auto_304816 ?auto_304825 ) ) ( not ( = ?auto_304816 ?auto_304826 ) ) ( not ( = ?auto_304816 ?auto_304827 ) ) ( not ( = ?auto_304816 ?auto_304828 ) ) ( not ( = ?auto_304817 ?auto_304818 ) ) ( not ( = ?auto_304817 ?auto_304819 ) ) ( not ( = ?auto_304817 ?auto_304820 ) ) ( not ( = ?auto_304817 ?auto_304821 ) ) ( not ( = ?auto_304817 ?auto_304822 ) ) ( not ( = ?auto_304817 ?auto_304823 ) ) ( not ( = ?auto_304817 ?auto_304824 ) ) ( not ( = ?auto_304817 ?auto_304825 ) ) ( not ( = ?auto_304817 ?auto_304826 ) ) ( not ( = ?auto_304817 ?auto_304827 ) ) ( not ( = ?auto_304817 ?auto_304828 ) ) ( not ( = ?auto_304818 ?auto_304819 ) ) ( not ( = ?auto_304818 ?auto_304820 ) ) ( not ( = ?auto_304818 ?auto_304821 ) ) ( not ( = ?auto_304818 ?auto_304822 ) ) ( not ( = ?auto_304818 ?auto_304823 ) ) ( not ( = ?auto_304818 ?auto_304824 ) ) ( not ( = ?auto_304818 ?auto_304825 ) ) ( not ( = ?auto_304818 ?auto_304826 ) ) ( not ( = ?auto_304818 ?auto_304827 ) ) ( not ( = ?auto_304818 ?auto_304828 ) ) ( not ( = ?auto_304819 ?auto_304820 ) ) ( not ( = ?auto_304819 ?auto_304821 ) ) ( not ( = ?auto_304819 ?auto_304822 ) ) ( not ( = ?auto_304819 ?auto_304823 ) ) ( not ( = ?auto_304819 ?auto_304824 ) ) ( not ( = ?auto_304819 ?auto_304825 ) ) ( not ( = ?auto_304819 ?auto_304826 ) ) ( not ( = ?auto_304819 ?auto_304827 ) ) ( not ( = ?auto_304819 ?auto_304828 ) ) ( not ( = ?auto_304820 ?auto_304821 ) ) ( not ( = ?auto_304820 ?auto_304822 ) ) ( not ( = ?auto_304820 ?auto_304823 ) ) ( not ( = ?auto_304820 ?auto_304824 ) ) ( not ( = ?auto_304820 ?auto_304825 ) ) ( not ( = ?auto_304820 ?auto_304826 ) ) ( not ( = ?auto_304820 ?auto_304827 ) ) ( not ( = ?auto_304820 ?auto_304828 ) ) ( not ( = ?auto_304821 ?auto_304822 ) ) ( not ( = ?auto_304821 ?auto_304823 ) ) ( not ( = ?auto_304821 ?auto_304824 ) ) ( not ( = ?auto_304821 ?auto_304825 ) ) ( not ( = ?auto_304821 ?auto_304826 ) ) ( not ( = ?auto_304821 ?auto_304827 ) ) ( not ( = ?auto_304821 ?auto_304828 ) ) ( not ( = ?auto_304822 ?auto_304823 ) ) ( not ( = ?auto_304822 ?auto_304824 ) ) ( not ( = ?auto_304822 ?auto_304825 ) ) ( not ( = ?auto_304822 ?auto_304826 ) ) ( not ( = ?auto_304822 ?auto_304827 ) ) ( not ( = ?auto_304822 ?auto_304828 ) ) ( not ( = ?auto_304823 ?auto_304824 ) ) ( not ( = ?auto_304823 ?auto_304825 ) ) ( not ( = ?auto_304823 ?auto_304826 ) ) ( not ( = ?auto_304823 ?auto_304827 ) ) ( not ( = ?auto_304823 ?auto_304828 ) ) ( not ( = ?auto_304824 ?auto_304825 ) ) ( not ( = ?auto_304824 ?auto_304826 ) ) ( not ( = ?auto_304824 ?auto_304827 ) ) ( not ( = ?auto_304824 ?auto_304828 ) ) ( not ( = ?auto_304825 ?auto_304826 ) ) ( not ( = ?auto_304825 ?auto_304827 ) ) ( not ( = ?auto_304825 ?auto_304828 ) ) ( not ( = ?auto_304826 ?auto_304827 ) ) ( not ( = ?auto_304826 ?auto_304828 ) ) ( not ( = ?auto_304827 ?auto_304828 ) ) ( ON ?auto_304827 ?auto_304828 ) ( ON ?auto_304826 ?auto_304827 ) ( ON ?auto_304825 ?auto_304826 ) ( ON ?auto_304824 ?auto_304825 ) ( ON ?auto_304823 ?auto_304824 ) ( ON ?auto_304822 ?auto_304823 ) ( ON ?auto_304821 ?auto_304822 ) ( ON ?auto_304820 ?auto_304821 ) ( ON ?auto_304819 ?auto_304820 ) ( ON ?auto_304818 ?auto_304819 ) ( ON ?auto_304817 ?auto_304818 ) ( CLEAR ?auto_304815 ) ( ON ?auto_304816 ?auto_304817 ) ( CLEAR ?auto_304816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_304815 ?auto_304816 )
      ( MAKE-14PILE ?auto_304815 ?auto_304816 ?auto_304817 ?auto_304818 ?auto_304819 ?auto_304820 ?auto_304821 ?auto_304822 ?auto_304823 ?auto_304824 ?auto_304825 ?auto_304826 ?auto_304827 ?auto_304828 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304843 - BLOCK
      ?auto_304844 - BLOCK
      ?auto_304845 - BLOCK
      ?auto_304846 - BLOCK
      ?auto_304847 - BLOCK
      ?auto_304848 - BLOCK
      ?auto_304849 - BLOCK
      ?auto_304850 - BLOCK
      ?auto_304851 - BLOCK
      ?auto_304852 - BLOCK
      ?auto_304853 - BLOCK
      ?auto_304854 - BLOCK
      ?auto_304855 - BLOCK
      ?auto_304856 - BLOCK
    )
    :vars
    (
      ?auto_304857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_304856 ?auto_304857 ) ( not ( = ?auto_304843 ?auto_304844 ) ) ( not ( = ?auto_304843 ?auto_304845 ) ) ( not ( = ?auto_304843 ?auto_304846 ) ) ( not ( = ?auto_304843 ?auto_304847 ) ) ( not ( = ?auto_304843 ?auto_304848 ) ) ( not ( = ?auto_304843 ?auto_304849 ) ) ( not ( = ?auto_304843 ?auto_304850 ) ) ( not ( = ?auto_304843 ?auto_304851 ) ) ( not ( = ?auto_304843 ?auto_304852 ) ) ( not ( = ?auto_304843 ?auto_304853 ) ) ( not ( = ?auto_304843 ?auto_304854 ) ) ( not ( = ?auto_304843 ?auto_304855 ) ) ( not ( = ?auto_304843 ?auto_304856 ) ) ( not ( = ?auto_304843 ?auto_304857 ) ) ( not ( = ?auto_304844 ?auto_304845 ) ) ( not ( = ?auto_304844 ?auto_304846 ) ) ( not ( = ?auto_304844 ?auto_304847 ) ) ( not ( = ?auto_304844 ?auto_304848 ) ) ( not ( = ?auto_304844 ?auto_304849 ) ) ( not ( = ?auto_304844 ?auto_304850 ) ) ( not ( = ?auto_304844 ?auto_304851 ) ) ( not ( = ?auto_304844 ?auto_304852 ) ) ( not ( = ?auto_304844 ?auto_304853 ) ) ( not ( = ?auto_304844 ?auto_304854 ) ) ( not ( = ?auto_304844 ?auto_304855 ) ) ( not ( = ?auto_304844 ?auto_304856 ) ) ( not ( = ?auto_304844 ?auto_304857 ) ) ( not ( = ?auto_304845 ?auto_304846 ) ) ( not ( = ?auto_304845 ?auto_304847 ) ) ( not ( = ?auto_304845 ?auto_304848 ) ) ( not ( = ?auto_304845 ?auto_304849 ) ) ( not ( = ?auto_304845 ?auto_304850 ) ) ( not ( = ?auto_304845 ?auto_304851 ) ) ( not ( = ?auto_304845 ?auto_304852 ) ) ( not ( = ?auto_304845 ?auto_304853 ) ) ( not ( = ?auto_304845 ?auto_304854 ) ) ( not ( = ?auto_304845 ?auto_304855 ) ) ( not ( = ?auto_304845 ?auto_304856 ) ) ( not ( = ?auto_304845 ?auto_304857 ) ) ( not ( = ?auto_304846 ?auto_304847 ) ) ( not ( = ?auto_304846 ?auto_304848 ) ) ( not ( = ?auto_304846 ?auto_304849 ) ) ( not ( = ?auto_304846 ?auto_304850 ) ) ( not ( = ?auto_304846 ?auto_304851 ) ) ( not ( = ?auto_304846 ?auto_304852 ) ) ( not ( = ?auto_304846 ?auto_304853 ) ) ( not ( = ?auto_304846 ?auto_304854 ) ) ( not ( = ?auto_304846 ?auto_304855 ) ) ( not ( = ?auto_304846 ?auto_304856 ) ) ( not ( = ?auto_304846 ?auto_304857 ) ) ( not ( = ?auto_304847 ?auto_304848 ) ) ( not ( = ?auto_304847 ?auto_304849 ) ) ( not ( = ?auto_304847 ?auto_304850 ) ) ( not ( = ?auto_304847 ?auto_304851 ) ) ( not ( = ?auto_304847 ?auto_304852 ) ) ( not ( = ?auto_304847 ?auto_304853 ) ) ( not ( = ?auto_304847 ?auto_304854 ) ) ( not ( = ?auto_304847 ?auto_304855 ) ) ( not ( = ?auto_304847 ?auto_304856 ) ) ( not ( = ?auto_304847 ?auto_304857 ) ) ( not ( = ?auto_304848 ?auto_304849 ) ) ( not ( = ?auto_304848 ?auto_304850 ) ) ( not ( = ?auto_304848 ?auto_304851 ) ) ( not ( = ?auto_304848 ?auto_304852 ) ) ( not ( = ?auto_304848 ?auto_304853 ) ) ( not ( = ?auto_304848 ?auto_304854 ) ) ( not ( = ?auto_304848 ?auto_304855 ) ) ( not ( = ?auto_304848 ?auto_304856 ) ) ( not ( = ?auto_304848 ?auto_304857 ) ) ( not ( = ?auto_304849 ?auto_304850 ) ) ( not ( = ?auto_304849 ?auto_304851 ) ) ( not ( = ?auto_304849 ?auto_304852 ) ) ( not ( = ?auto_304849 ?auto_304853 ) ) ( not ( = ?auto_304849 ?auto_304854 ) ) ( not ( = ?auto_304849 ?auto_304855 ) ) ( not ( = ?auto_304849 ?auto_304856 ) ) ( not ( = ?auto_304849 ?auto_304857 ) ) ( not ( = ?auto_304850 ?auto_304851 ) ) ( not ( = ?auto_304850 ?auto_304852 ) ) ( not ( = ?auto_304850 ?auto_304853 ) ) ( not ( = ?auto_304850 ?auto_304854 ) ) ( not ( = ?auto_304850 ?auto_304855 ) ) ( not ( = ?auto_304850 ?auto_304856 ) ) ( not ( = ?auto_304850 ?auto_304857 ) ) ( not ( = ?auto_304851 ?auto_304852 ) ) ( not ( = ?auto_304851 ?auto_304853 ) ) ( not ( = ?auto_304851 ?auto_304854 ) ) ( not ( = ?auto_304851 ?auto_304855 ) ) ( not ( = ?auto_304851 ?auto_304856 ) ) ( not ( = ?auto_304851 ?auto_304857 ) ) ( not ( = ?auto_304852 ?auto_304853 ) ) ( not ( = ?auto_304852 ?auto_304854 ) ) ( not ( = ?auto_304852 ?auto_304855 ) ) ( not ( = ?auto_304852 ?auto_304856 ) ) ( not ( = ?auto_304852 ?auto_304857 ) ) ( not ( = ?auto_304853 ?auto_304854 ) ) ( not ( = ?auto_304853 ?auto_304855 ) ) ( not ( = ?auto_304853 ?auto_304856 ) ) ( not ( = ?auto_304853 ?auto_304857 ) ) ( not ( = ?auto_304854 ?auto_304855 ) ) ( not ( = ?auto_304854 ?auto_304856 ) ) ( not ( = ?auto_304854 ?auto_304857 ) ) ( not ( = ?auto_304855 ?auto_304856 ) ) ( not ( = ?auto_304855 ?auto_304857 ) ) ( not ( = ?auto_304856 ?auto_304857 ) ) ( ON ?auto_304855 ?auto_304856 ) ( ON ?auto_304854 ?auto_304855 ) ( ON ?auto_304853 ?auto_304854 ) ( ON ?auto_304852 ?auto_304853 ) ( ON ?auto_304851 ?auto_304852 ) ( ON ?auto_304850 ?auto_304851 ) ( ON ?auto_304849 ?auto_304850 ) ( ON ?auto_304848 ?auto_304849 ) ( ON ?auto_304847 ?auto_304848 ) ( ON ?auto_304846 ?auto_304847 ) ( ON ?auto_304845 ?auto_304846 ) ( ON ?auto_304844 ?auto_304845 ) ( ON ?auto_304843 ?auto_304844 ) ( CLEAR ?auto_304843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304843 )
      ( MAKE-14PILE ?auto_304843 ?auto_304844 ?auto_304845 ?auto_304846 ?auto_304847 ?auto_304848 ?auto_304849 ?auto_304850 ?auto_304851 ?auto_304852 ?auto_304853 ?auto_304854 ?auto_304855 ?auto_304856 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304872 - BLOCK
      ?auto_304873 - BLOCK
      ?auto_304874 - BLOCK
      ?auto_304875 - BLOCK
      ?auto_304876 - BLOCK
      ?auto_304877 - BLOCK
      ?auto_304878 - BLOCK
      ?auto_304879 - BLOCK
      ?auto_304880 - BLOCK
      ?auto_304881 - BLOCK
      ?auto_304882 - BLOCK
      ?auto_304883 - BLOCK
      ?auto_304884 - BLOCK
      ?auto_304885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_304885 ) ( not ( = ?auto_304872 ?auto_304873 ) ) ( not ( = ?auto_304872 ?auto_304874 ) ) ( not ( = ?auto_304872 ?auto_304875 ) ) ( not ( = ?auto_304872 ?auto_304876 ) ) ( not ( = ?auto_304872 ?auto_304877 ) ) ( not ( = ?auto_304872 ?auto_304878 ) ) ( not ( = ?auto_304872 ?auto_304879 ) ) ( not ( = ?auto_304872 ?auto_304880 ) ) ( not ( = ?auto_304872 ?auto_304881 ) ) ( not ( = ?auto_304872 ?auto_304882 ) ) ( not ( = ?auto_304872 ?auto_304883 ) ) ( not ( = ?auto_304872 ?auto_304884 ) ) ( not ( = ?auto_304872 ?auto_304885 ) ) ( not ( = ?auto_304873 ?auto_304874 ) ) ( not ( = ?auto_304873 ?auto_304875 ) ) ( not ( = ?auto_304873 ?auto_304876 ) ) ( not ( = ?auto_304873 ?auto_304877 ) ) ( not ( = ?auto_304873 ?auto_304878 ) ) ( not ( = ?auto_304873 ?auto_304879 ) ) ( not ( = ?auto_304873 ?auto_304880 ) ) ( not ( = ?auto_304873 ?auto_304881 ) ) ( not ( = ?auto_304873 ?auto_304882 ) ) ( not ( = ?auto_304873 ?auto_304883 ) ) ( not ( = ?auto_304873 ?auto_304884 ) ) ( not ( = ?auto_304873 ?auto_304885 ) ) ( not ( = ?auto_304874 ?auto_304875 ) ) ( not ( = ?auto_304874 ?auto_304876 ) ) ( not ( = ?auto_304874 ?auto_304877 ) ) ( not ( = ?auto_304874 ?auto_304878 ) ) ( not ( = ?auto_304874 ?auto_304879 ) ) ( not ( = ?auto_304874 ?auto_304880 ) ) ( not ( = ?auto_304874 ?auto_304881 ) ) ( not ( = ?auto_304874 ?auto_304882 ) ) ( not ( = ?auto_304874 ?auto_304883 ) ) ( not ( = ?auto_304874 ?auto_304884 ) ) ( not ( = ?auto_304874 ?auto_304885 ) ) ( not ( = ?auto_304875 ?auto_304876 ) ) ( not ( = ?auto_304875 ?auto_304877 ) ) ( not ( = ?auto_304875 ?auto_304878 ) ) ( not ( = ?auto_304875 ?auto_304879 ) ) ( not ( = ?auto_304875 ?auto_304880 ) ) ( not ( = ?auto_304875 ?auto_304881 ) ) ( not ( = ?auto_304875 ?auto_304882 ) ) ( not ( = ?auto_304875 ?auto_304883 ) ) ( not ( = ?auto_304875 ?auto_304884 ) ) ( not ( = ?auto_304875 ?auto_304885 ) ) ( not ( = ?auto_304876 ?auto_304877 ) ) ( not ( = ?auto_304876 ?auto_304878 ) ) ( not ( = ?auto_304876 ?auto_304879 ) ) ( not ( = ?auto_304876 ?auto_304880 ) ) ( not ( = ?auto_304876 ?auto_304881 ) ) ( not ( = ?auto_304876 ?auto_304882 ) ) ( not ( = ?auto_304876 ?auto_304883 ) ) ( not ( = ?auto_304876 ?auto_304884 ) ) ( not ( = ?auto_304876 ?auto_304885 ) ) ( not ( = ?auto_304877 ?auto_304878 ) ) ( not ( = ?auto_304877 ?auto_304879 ) ) ( not ( = ?auto_304877 ?auto_304880 ) ) ( not ( = ?auto_304877 ?auto_304881 ) ) ( not ( = ?auto_304877 ?auto_304882 ) ) ( not ( = ?auto_304877 ?auto_304883 ) ) ( not ( = ?auto_304877 ?auto_304884 ) ) ( not ( = ?auto_304877 ?auto_304885 ) ) ( not ( = ?auto_304878 ?auto_304879 ) ) ( not ( = ?auto_304878 ?auto_304880 ) ) ( not ( = ?auto_304878 ?auto_304881 ) ) ( not ( = ?auto_304878 ?auto_304882 ) ) ( not ( = ?auto_304878 ?auto_304883 ) ) ( not ( = ?auto_304878 ?auto_304884 ) ) ( not ( = ?auto_304878 ?auto_304885 ) ) ( not ( = ?auto_304879 ?auto_304880 ) ) ( not ( = ?auto_304879 ?auto_304881 ) ) ( not ( = ?auto_304879 ?auto_304882 ) ) ( not ( = ?auto_304879 ?auto_304883 ) ) ( not ( = ?auto_304879 ?auto_304884 ) ) ( not ( = ?auto_304879 ?auto_304885 ) ) ( not ( = ?auto_304880 ?auto_304881 ) ) ( not ( = ?auto_304880 ?auto_304882 ) ) ( not ( = ?auto_304880 ?auto_304883 ) ) ( not ( = ?auto_304880 ?auto_304884 ) ) ( not ( = ?auto_304880 ?auto_304885 ) ) ( not ( = ?auto_304881 ?auto_304882 ) ) ( not ( = ?auto_304881 ?auto_304883 ) ) ( not ( = ?auto_304881 ?auto_304884 ) ) ( not ( = ?auto_304881 ?auto_304885 ) ) ( not ( = ?auto_304882 ?auto_304883 ) ) ( not ( = ?auto_304882 ?auto_304884 ) ) ( not ( = ?auto_304882 ?auto_304885 ) ) ( not ( = ?auto_304883 ?auto_304884 ) ) ( not ( = ?auto_304883 ?auto_304885 ) ) ( not ( = ?auto_304884 ?auto_304885 ) ) ( ON ?auto_304884 ?auto_304885 ) ( ON ?auto_304883 ?auto_304884 ) ( ON ?auto_304882 ?auto_304883 ) ( ON ?auto_304881 ?auto_304882 ) ( ON ?auto_304880 ?auto_304881 ) ( ON ?auto_304879 ?auto_304880 ) ( ON ?auto_304878 ?auto_304879 ) ( ON ?auto_304877 ?auto_304878 ) ( ON ?auto_304876 ?auto_304877 ) ( ON ?auto_304875 ?auto_304876 ) ( ON ?auto_304874 ?auto_304875 ) ( ON ?auto_304873 ?auto_304874 ) ( ON ?auto_304872 ?auto_304873 ) ( CLEAR ?auto_304872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_304872 )
      ( MAKE-14PILE ?auto_304872 ?auto_304873 ?auto_304874 ?auto_304875 ?auto_304876 ?auto_304877 ?auto_304878 ?auto_304879 ?auto_304880 ?auto_304881 ?auto_304882 ?auto_304883 ?auto_304884 ?auto_304885 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_304900 - BLOCK
      ?auto_304901 - BLOCK
      ?auto_304902 - BLOCK
      ?auto_304903 - BLOCK
      ?auto_304904 - BLOCK
      ?auto_304905 - BLOCK
      ?auto_304906 - BLOCK
      ?auto_304907 - BLOCK
      ?auto_304908 - BLOCK
      ?auto_304909 - BLOCK
      ?auto_304910 - BLOCK
      ?auto_304911 - BLOCK
      ?auto_304912 - BLOCK
      ?auto_304913 - BLOCK
    )
    :vars
    (
      ?auto_304914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_304900 ?auto_304901 ) ) ( not ( = ?auto_304900 ?auto_304902 ) ) ( not ( = ?auto_304900 ?auto_304903 ) ) ( not ( = ?auto_304900 ?auto_304904 ) ) ( not ( = ?auto_304900 ?auto_304905 ) ) ( not ( = ?auto_304900 ?auto_304906 ) ) ( not ( = ?auto_304900 ?auto_304907 ) ) ( not ( = ?auto_304900 ?auto_304908 ) ) ( not ( = ?auto_304900 ?auto_304909 ) ) ( not ( = ?auto_304900 ?auto_304910 ) ) ( not ( = ?auto_304900 ?auto_304911 ) ) ( not ( = ?auto_304900 ?auto_304912 ) ) ( not ( = ?auto_304900 ?auto_304913 ) ) ( not ( = ?auto_304901 ?auto_304902 ) ) ( not ( = ?auto_304901 ?auto_304903 ) ) ( not ( = ?auto_304901 ?auto_304904 ) ) ( not ( = ?auto_304901 ?auto_304905 ) ) ( not ( = ?auto_304901 ?auto_304906 ) ) ( not ( = ?auto_304901 ?auto_304907 ) ) ( not ( = ?auto_304901 ?auto_304908 ) ) ( not ( = ?auto_304901 ?auto_304909 ) ) ( not ( = ?auto_304901 ?auto_304910 ) ) ( not ( = ?auto_304901 ?auto_304911 ) ) ( not ( = ?auto_304901 ?auto_304912 ) ) ( not ( = ?auto_304901 ?auto_304913 ) ) ( not ( = ?auto_304902 ?auto_304903 ) ) ( not ( = ?auto_304902 ?auto_304904 ) ) ( not ( = ?auto_304902 ?auto_304905 ) ) ( not ( = ?auto_304902 ?auto_304906 ) ) ( not ( = ?auto_304902 ?auto_304907 ) ) ( not ( = ?auto_304902 ?auto_304908 ) ) ( not ( = ?auto_304902 ?auto_304909 ) ) ( not ( = ?auto_304902 ?auto_304910 ) ) ( not ( = ?auto_304902 ?auto_304911 ) ) ( not ( = ?auto_304902 ?auto_304912 ) ) ( not ( = ?auto_304902 ?auto_304913 ) ) ( not ( = ?auto_304903 ?auto_304904 ) ) ( not ( = ?auto_304903 ?auto_304905 ) ) ( not ( = ?auto_304903 ?auto_304906 ) ) ( not ( = ?auto_304903 ?auto_304907 ) ) ( not ( = ?auto_304903 ?auto_304908 ) ) ( not ( = ?auto_304903 ?auto_304909 ) ) ( not ( = ?auto_304903 ?auto_304910 ) ) ( not ( = ?auto_304903 ?auto_304911 ) ) ( not ( = ?auto_304903 ?auto_304912 ) ) ( not ( = ?auto_304903 ?auto_304913 ) ) ( not ( = ?auto_304904 ?auto_304905 ) ) ( not ( = ?auto_304904 ?auto_304906 ) ) ( not ( = ?auto_304904 ?auto_304907 ) ) ( not ( = ?auto_304904 ?auto_304908 ) ) ( not ( = ?auto_304904 ?auto_304909 ) ) ( not ( = ?auto_304904 ?auto_304910 ) ) ( not ( = ?auto_304904 ?auto_304911 ) ) ( not ( = ?auto_304904 ?auto_304912 ) ) ( not ( = ?auto_304904 ?auto_304913 ) ) ( not ( = ?auto_304905 ?auto_304906 ) ) ( not ( = ?auto_304905 ?auto_304907 ) ) ( not ( = ?auto_304905 ?auto_304908 ) ) ( not ( = ?auto_304905 ?auto_304909 ) ) ( not ( = ?auto_304905 ?auto_304910 ) ) ( not ( = ?auto_304905 ?auto_304911 ) ) ( not ( = ?auto_304905 ?auto_304912 ) ) ( not ( = ?auto_304905 ?auto_304913 ) ) ( not ( = ?auto_304906 ?auto_304907 ) ) ( not ( = ?auto_304906 ?auto_304908 ) ) ( not ( = ?auto_304906 ?auto_304909 ) ) ( not ( = ?auto_304906 ?auto_304910 ) ) ( not ( = ?auto_304906 ?auto_304911 ) ) ( not ( = ?auto_304906 ?auto_304912 ) ) ( not ( = ?auto_304906 ?auto_304913 ) ) ( not ( = ?auto_304907 ?auto_304908 ) ) ( not ( = ?auto_304907 ?auto_304909 ) ) ( not ( = ?auto_304907 ?auto_304910 ) ) ( not ( = ?auto_304907 ?auto_304911 ) ) ( not ( = ?auto_304907 ?auto_304912 ) ) ( not ( = ?auto_304907 ?auto_304913 ) ) ( not ( = ?auto_304908 ?auto_304909 ) ) ( not ( = ?auto_304908 ?auto_304910 ) ) ( not ( = ?auto_304908 ?auto_304911 ) ) ( not ( = ?auto_304908 ?auto_304912 ) ) ( not ( = ?auto_304908 ?auto_304913 ) ) ( not ( = ?auto_304909 ?auto_304910 ) ) ( not ( = ?auto_304909 ?auto_304911 ) ) ( not ( = ?auto_304909 ?auto_304912 ) ) ( not ( = ?auto_304909 ?auto_304913 ) ) ( not ( = ?auto_304910 ?auto_304911 ) ) ( not ( = ?auto_304910 ?auto_304912 ) ) ( not ( = ?auto_304910 ?auto_304913 ) ) ( not ( = ?auto_304911 ?auto_304912 ) ) ( not ( = ?auto_304911 ?auto_304913 ) ) ( not ( = ?auto_304912 ?auto_304913 ) ) ( ON ?auto_304900 ?auto_304914 ) ( not ( = ?auto_304913 ?auto_304914 ) ) ( not ( = ?auto_304912 ?auto_304914 ) ) ( not ( = ?auto_304911 ?auto_304914 ) ) ( not ( = ?auto_304910 ?auto_304914 ) ) ( not ( = ?auto_304909 ?auto_304914 ) ) ( not ( = ?auto_304908 ?auto_304914 ) ) ( not ( = ?auto_304907 ?auto_304914 ) ) ( not ( = ?auto_304906 ?auto_304914 ) ) ( not ( = ?auto_304905 ?auto_304914 ) ) ( not ( = ?auto_304904 ?auto_304914 ) ) ( not ( = ?auto_304903 ?auto_304914 ) ) ( not ( = ?auto_304902 ?auto_304914 ) ) ( not ( = ?auto_304901 ?auto_304914 ) ) ( not ( = ?auto_304900 ?auto_304914 ) ) ( ON ?auto_304901 ?auto_304900 ) ( ON ?auto_304902 ?auto_304901 ) ( ON ?auto_304903 ?auto_304902 ) ( ON ?auto_304904 ?auto_304903 ) ( ON ?auto_304905 ?auto_304904 ) ( ON ?auto_304906 ?auto_304905 ) ( ON ?auto_304907 ?auto_304906 ) ( ON ?auto_304908 ?auto_304907 ) ( ON ?auto_304909 ?auto_304908 ) ( ON ?auto_304910 ?auto_304909 ) ( ON ?auto_304911 ?auto_304910 ) ( ON ?auto_304912 ?auto_304911 ) ( ON ?auto_304913 ?auto_304912 ) ( CLEAR ?auto_304913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_304913 ?auto_304912 ?auto_304911 ?auto_304910 ?auto_304909 ?auto_304908 ?auto_304907 ?auto_304906 ?auto_304905 ?auto_304904 ?auto_304903 ?auto_304902 ?auto_304901 ?auto_304900 )
      ( MAKE-14PILE ?auto_304900 ?auto_304901 ?auto_304902 ?auto_304903 ?auto_304904 ?auto_304905 ?auto_304906 ?auto_304907 ?auto_304908 ?auto_304909 ?auto_304910 ?auto_304911 ?auto_304912 ?auto_304913 ) )
  )

)

