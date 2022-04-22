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
      ?auto_642649 - BLOCK
    )
    :vars
    (
      ?auto_642650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642649 ?auto_642650 ) ( CLEAR ?auto_642649 ) ( HAND-EMPTY ) ( not ( = ?auto_642649 ?auto_642650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642649 ?auto_642650 )
      ( !PUTDOWN ?auto_642649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_642656 - BLOCK
      ?auto_642657 - BLOCK
    )
    :vars
    (
      ?auto_642658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_642656 ) ( ON ?auto_642657 ?auto_642658 ) ( CLEAR ?auto_642657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_642656 ) ( not ( = ?auto_642656 ?auto_642657 ) ) ( not ( = ?auto_642656 ?auto_642658 ) ) ( not ( = ?auto_642657 ?auto_642658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642657 ?auto_642658 )
      ( !STACK ?auto_642657 ?auto_642656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_642666 - BLOCK
      ?auto_642667 - BLOCK
    )
    :vars
    (
      ?auto_642668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642667 ?auto_642668 ) ( not ( = ?auto_642666 ?auto_642667 ) ) ( not ( = ?auto_642666 ?auto_642668 ) ) ( not ( = ?auto_642667 ?auto_642668 ) ) ( ON ?auto_642666 ?auto_642667 ) ( CLEAR ?auto_642666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642666 )
      ( MAKE-2PILE ?auto_642666 ?auto_642667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_642677 - BLOCK
      ?auto_642678 - BLOCK
      ?auto_642679 - BLOCK
    )
    :vars
    (
      ?auto_642680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_642678 ) ( ON ?auto_642679 ?auto_642680 ) ( CLEAR ?auto_642679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_642677 ) ( ON ?auto_642678 ?auto_642677 ) ( not ( = ?auto_642677 ?auto_642678 ) ) ( not ( = ?auto_642677 ?auto_642679 ) ) ( not ( = ?auto_642677 ?auto_642680 ) ) ( not ( = ?auto_642678 ?auto_642679 ) ) ( not ( = ?auto_642678 ?auto_642680 ) ) ( not ( = ?auto_642679 ?auto_642680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642679 ?auto_642680 )
      ( !STACK ?auto_642679 ?auto_642678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_642691 - BLOCK
      ?auto_642692 - BLOCK
      ?auto_642693 - BLOCK
    )
    :vars
    (
      ?auto_642694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642693 ?auto_642694 ) ( ON-TABLE ?auto_642691 ) ( not ( = ?auto_642691 ?auto_642692 ) ) ( not ( = ?auto_642691 ?auto_642693 ) ) ( not ( = ?auto_642691 ?auto_642694 ) ) ( not ( = ?auto_642692 ?auto_642693 ) ) ( not ( = ?auto_642692 ?auto_642694 ) ) ( not ( = ?auto_642693 ?auto_642694 ) ) ( CLEAR ?auto_642691 ) ( ON ?auto_642692 ?auto_642693 ) ( CLEAR ?auto_642692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_642691 ?auto_642692 )
      ( MAKE-3PILE ?auto_642691 ?auto_642692 ?auto_642693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_642705 - BLOCK
      ?auto_642706 - BLOCK
      ?auto_642707 - BLOCK
    )
    :vars
    (
      ?auto_642708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642707 ?auto_642708 ) ( not ( = ?auto_642705 ?auto_642706 ) ) ( not ( = ?auto_642705 ?auto_642707 ) ) ( not ( = ?auto_642705 ?auto_642708 ) ) ( not ( = ?auto_642706 ?auto_642707 ) ) ( not ( = ?auto_642706 ?auto_642708 ) ) ( not ( = ?auto_642707 ?auto_642708 ) ) ( ON ?auto_642706 ?auto_642707 ) ( ON ?auto_642705 ?auto_642706 ) ( CLEAR ?auto_642705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642705 )
      ( MAKE-3PILE ?auto_642705 ?auto_642706 ?auto_642707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_642720 - BLOCK
      ?auto_642721 - BLOCK
      ?auto_642722 - BLOCK
      ?auto_642723 - BLOCK
    )
    :vars
    (
      ?auto_642724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_642722 ) ( ON ?auto_642723 ?auto_642724 ) ( CLEAR ?auto_642723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_642720 ) ( ON ?auto_642721 ?auto_642720 ) ( ON ?auto_642722 ?auto_642721 ) ( not ( = ?auto_642720 ?auto_642721 ) ) ( not ( = ?auto_642720 ?auto_642722 ) ) ( not ( = ?auto_642720 ?auto_642723 ) ) ( not ( = ?auto_642720 ?auto_642724 ) ) ( not ( = ?auto_642721 ?auto_642722 ) ) ( not ( = ?auto_642721 ?auto_642723 ) ) ( not ( = ?auto_642721 ?auto_642724 ) ) ( not ( = ?auto_642722 ?auto_642723 ) ) ( not ( = ?auto_642722 ?auto_642724 ) ) ( not ( = ?auto_642723 ?auto_642724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642723 ?auto_642724 )
      ( !STACK ?auto_642723 ?auto_642722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_642738 - BLOCK
      ?auto_642739 - BLOCK
      ?auto_642740 - BLOCK
      ?auto_642741 - BLOCK
    )
    :vars
    (
      ?auto_642742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642741 ?auto_642742 ) ( ON-TABLE ?auto_642738 ) ( ON ?auto_642739 ?auto_642738 ) ( not ( = ?auto_642738 ?auto_642739 ) ) ( not ( = ?auto_642738 ?auto_642740 ) ) ( not ( = ?auto_642738 ?auto_642741 ) ) ( not ( = ?auto_642738 ?auto_642742 ) ) ( not ( = ?auto_642739 ?auto_642740 ) ) ( not ( = ?auto_642739 ?auto_642741 ) ) ( not ( = ?auto_642739 ?auto_642742 ) ) ( not ( = ?auto_642740 ?auto_642741 ) ) ( not ( = ?auto_642740 ?auto_642742 ) ) ( not ( = ?auto_642741 ?auto_642742 ) ) ( CLEAR ?auto_642739 ) ( ON ?auto_642740 ?auto_642741 ) ( CLEAR ?auto_642740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_642738 ?auto_642739 ?auto_642740 )
      ( MAKE-4PILE ?auto_642738 ?auto_642739 ?auto_642740 ?auto_642741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_642756 - BLOCK
      ?auto_642757 - BLOCK
      ?auto_642758 - BLOCK
      ?auto_642759 - BLOCK
    )
    :vars
    (
      ?auto_642760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642759 ?auto_642760 ) ( ON-TABLE ?auto_642756 ) ( not ( = ?auto_642756 ?auto_642757 ) ) ( not ( = ?auto_642756 ?auto_642758 ) ) ( not ( = ?auto_642756 ?auto_642759 ) ) ( not ( = ?auto_642756 ?auto_642760 ) ) ( not ( = ?auto_642757 ?auto_642758 ) ) ( not ( = ?auto_642757 ?auto_642759 ) ) ( not ( = ?auto_642757 ?auto_642760 ) ) ( not ( = ?auto_642758 ?auto_642759 ) ) ( not ( = ?auto_642758 ?auto_642760 ) ) ( not ( = ?auto_642759 ?auto_642760 ) ) ( ON ?auto_642758 ?auto_642759 ) ( CLEAR ?auto_642756 ) ( ON ?auto_642757 ?auto_642758 ) ( CLEAR ?auto_642757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_642756 ?auto_642757 )
      ( MAKE-4PILE ?auto_642756 ?auto_642757 ?auto_642758 ?auto_642759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_642774 - BLOCK
      ?auto_642775 - BLOCK
      ?auto_642776 - BLOCK
      ?auto_642777 - BLOCK
    )
    :vars
    (
      ?auto_642778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642777 ?auto_642778 ) ( not ( = ?auto_642774 ?auto_642775 ) ) ( not ( = ?auto_642774 ?auto_642776 ) ) ( not ( = ?auto_642774 ?auto_642777 ) ) ( not ( = ?auto_642774 ?auto_642778 ) ) ( not ( = ?auto_642775 ?auto_642776 ) ) ( not ( = ?auto_642775 ?auto_642777 ) ) ( not ( = ?auto_642775 ?auto_642778 ) ) ( not ( = ?auto_642776 ?auto_642777 ) ) ( not ( = ?auto_642776 ?auto_642778 ) ) ( not ( = ?auto_642777 ?auto_642778 ) ) ( ON ?auto_642776 ?auto_642777 ) ( ON ?auto_642775 ?auto_642776 ) ( ON ?auto_642774 ?auto_642775 ) ( CLEAR ?auto_642774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642774 )
      ( MAKE-4PILE ?auto_642774 ?auto_642775 ?auto_642776 ?auto_642777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_642793 - BLOCK
      ?auto_642794 - BLOCK
      ?auto_642795 - BLOCK
      ?auto_642796 - BLOCK
      ?auto_642797 - BLOCK
    )
    :vars
    (
      ?auto_642798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_642796 ) ( ON ?auto_642797 ?auto_642798 ) ( CLEAR ?auto_642797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_642793 ) ( ON ?auto_642794 ?auto_642793 ) ( ON ?auto_642795 ?auto_642794 ) ( ON ?auto_642796 ?auto_642795 ) ( not ( = ?auto_642793 ?auto_642794 ) ) ( not ( = ?auto_642793 ?auto_642795 ) ) ( not ( = ?auto_642793 ?auto_642796 ) ) ( not ( = ?auto_642793 ?auto_642797 ) ) ( not ( = ?auto_642793 ?auto_642798 ) ) ( not ( = ?auto_642794 ?auto_642795 ) ) ( not ( = ?auto_642794 ?auto_642796 ) ) ( not ( = ?auto_642794 ?auto_642797 ) ) ( not ( = ?auto_642794 ?auto_642798 ) ) ( not ( = ?auto_642795 ?auto_642796 ) ) ( not ( = ?auto_642795 ?auto_642797 ) ) ( not ( = ?auto_642795 ?auto_642798 ) ) ( not ( = ?auto_642796 ?auto_642797 ) ) ( not ( = ?auto_642796 ?auto_642798 ) ) ( not ( = ?auto_642797 ?auto_642798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642797 ?auto_642798 )
      ( !STACK ?auto_642797 ?auto_642796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_642815 - BLOCK
      ?auto_642816 - BLOCK
      ?auto_642817 - BLOCK
      ?auto_642818 - BLOCK
      ?auto_642819 - BLOCK
    )
    :vars
    (
      ?auto_642820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642819 ?auto_642820 ) ( ON-TABLE ?auto_642815 ) ( ON ?auto_642816 ?auto_642815 ) ( ON ?auto_642817 ?auto_642816 ) ( not ( = ?auto_642815 ?auto_642816 ) ) ( not ( = ?auto_642815 ?auto_642817 ) ) ( not ( = ?auto_642815 ?auto_642818 ) ) ( not ( = ?auto_642815 ?auto_642819 ) ) ( not ( = ?auto_642815 ?auto_642820 ) ) ( not ( = ?auto_642816 ?auto_642817 ) ) ( not ( = ?auto_642816 ?auto_642818 ) ) ( not ( = ?auto_642816 ?auto_642819 ) ) ( not ( = ?auto_642816 ?auto_642820 ) ) ( not ( = ?auto_642817 ?auto_642818 ) ) ( not ( = ?auto_642817 ?auto_642819 ) ) ( not ( = ?auto_642817 ?auto_642820 ) ) ( not ( = ?auto_642818 ?auto_642819 ) ) ( not ( = ?auto_642818 ?auto_642820 ) ) ( not ( = ?auto_642819 ?auto_642820 ) ) ( CLEAR ?auto_642817 ) ( ON ?auto_642818 ?auto_642819 ) ( CLEAR ?auto_642818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_642815 ?auto_642816 ?auto_642817 ?auto_642818 )
      ( MAKE-5PILE ?auto_642815 ?auto_642816 ?auto_642817 ?auto_642818 ?auto_642819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_642837 - BLOCK
      ?auto_642838 - BLOCK
      ?auto_642839 - BLOCK
      ?auto_642840 - BLOCK
      ?auto_642841 - BLOCK
    )
    :vars
    (
      ?auto_642842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642841 ?auto_642842 ) ( ON-TABLE ?auto_642837 ) ( ON ?auto_642838 ?auto_642837 ) ( not ( = ?auto_642837 ?auto_642838 ) ) ( not ( = ?auto_642837 ?auto_642839 ) ) ( not ( = ?auto_642837 ?auto_642840 ) ) ( not ( = ?auto_642837 ?auto_642841 ) ) ( not ( = ?auto_642837 ?auto_642842 ) ) ( not ( = ?auto_642838 ?auto_642839 ) ) ( not ( = ?auto_642838 ?auto_642840 ) ) ( not ( = ?auto_642838 ?auto_642841 ) ) ( not ( = ?auto_642838 ?auto_642842 ) ) ( not ( = ?auto_642839 ?auto_642840 ) ) ( not ( = ?auto_642839 ?auto_642841 ) ) ( not ( = ?auto_642839 ?auto_642842 ) ) ( not ( = ?auto_642840 ?auto_642841 ) ) ( not ( = ?auto_642840 ?auto_642842 ) ) ( not ( = ?auto_642841 ?auto_642842 ) ) ( ON ?auto_642840 ?auto_642841 ) ( CLEAR ?auto_642838 ) ( ON ?auto_642839 ?auto_642840 ) ( CLEAR ?auto_642839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_642837 ?auto_642838 ?auto_642839 )
      ( MAKE-5PILE ?auto_642837 ?auto_642838 ?auto_642839 ?auto_642840 ?auto_642841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_642859 - BLOCK
      ?auto_642860 - BLOCK
      ?auto_642861 - BLOCK
      ?auto_642862 - BLOCK
      ?auto_642863 - BLOCK
    )
    :vars
    (
      ?auto_642864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642863 ?auto_642864 ) ( ON-TABLE ?auto_642859 ) ( not ( = ?auto_642859 ?auto_642860 ) ) ( not ( = ?auto_642859 ?auto_642861 ) ) ( not ( = ?auto_642859 ?auto_642862 ) ) ( not ( = ?auto_642859 ?auto_642863 ) ) ( not ( = ?auto_642859 ?auto_642864 ) ) ( not ( = ?auto_642860 ?auto_642861 ) ) ( not ( = ?auto_642860 ?auto_642862 ) ) ( not ( = ?auto_642860 ?auto_642863 ) ) ( not ( = ?auto_642860 ?auto_642864 ) ) ( not ( = ?auto_642861 ?auto_642862 ) ) ( not ( = ?auto_642861 ?auto_642863 ) ) ( not ( = ?auto_642861 ?auto_642864 ) ) ( not ( = ?auto_642862 ?auto_642863 ) ) ( not ( = ?auto_642862 ?auto_642864 ) ) ( not ( = ?auto_642863 ?auto_642864 ) ) ( ON ?auto_642862 ?auto_642863 ) ( ON ?auto_642861 ?auto_642862 ) ( CLEAR ?auto_642859 ) ( ON ?auto_642860 ?auto_642861 ) ( CLEAR ?auto_642860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_642859 ?auto_642860 )
      ( MAKE-5PILE ?auto_642859 ?auto_642860 ?auto_642861 ?auto_642862 ?auto_642863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_642881 - BLOCK
      ?auto_642882 - BLOCK
      ?auto_642883 - BLOCK
      ?auto_642884 - BLOCK
      ?auto_642885 - BLOCK
    )
    :vars
    (
      ?auto_642886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642885 ?auto_642886 ) ( not ( = ?auto_642881 ?auto_642882 ) ) ( not ( = ?auto_642881 ?auto_642883 ) ) ( not ( = ?auto_642881 ?auto_642884 ) ) ( not ( = ?auto_642881 ?auto_642885 ) ) ( not ( = ?auto_642881 ?auto_642886 ) ) ( not ( = ?auto_642882 ?auto_642883 ) ) ( not ( = ?auto_642882 ?auto_642884 ) ) ( not ( = ?auto_642882 ?auto_642885 ) ) ( not ( = ?auto_642882 ?auto_642886 ) ) ( not ( = ?auto_642883 ?auto_642884 ) ) ( not ( = ?auto_642883 ?auto_642885 ) ) ( not ( = ?auto_642883 ?auto_642886 ) ) ( not ( = ?auto_642884 ?auto_642885 ) ) ( not ( = ?auto_642884 ?auto_642886 ) ) ( not ( = ?auto_642885 ?auto_642886 ) ) ( ON ?auto_642884 ?auto_642885 ) ( ON ?auto_642883 ?auto_642884 ) ( ON ?auto_642882 ?auto_642883 ) ( ON ?auto_642881 ?auto_642882 ) ( CLEAR ?auto_642881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_642881 )
      ( MAKE-5PILE ?auto_642881 ?auto_642882 ?auto_642883 ?auto_642884 ?auto_642885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_642904 - BLOCK
      ?auto_642905 - BLOCK
      ?auto_642906 - BLOCK
      ?auto_642907 - BLOCK
      ?auto_642908 - BLOCK
      ?auto_642909 - BLOCK
    )
    :vars
    (
      ?auto_642910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_642908 ) ( ON ?auto_642909 ?auto_642910 ) ( CLEAR ?auto_642909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_642904 ) ( ON ?auto_642905 ?auto_642904 ) ( ON ?auto_642906 ?auto_642905 ) ( ON ?auto_642907 ?auto_642906 ) ( ON ?auto_642908 ?auto_642907 ) ( not ( = ?auto_642904 ?auto_642905 ) ) ( not ( = ?auto_642904 ?auto_642906 ) ) ( not ( = ?auto_642904 ?auto_642907 ) ) ( not ( = ?auto_642904 ?auto_642908 ) ) ( not ( = ?auto_642904 ?auto_642909 ) ) ( not ( = ?auto_642904 ?auto_642910 ) ) ( not ( = ?auto_642905 ?auto_642906 ) ) ( not ( = ?auto_642905 ?auto_642907 ) ) ( not ( = ?auto_642905 ?auto_642908 ) ) ( not ( = ?auto_642905 ?auto_642909 ) ) ( not ( = ?auto_642905 ?auto_642910 ) ) ( not ( = ?auto_642906 ?auto_642907 ) ) ( not ( = ?auto_642906 ?auto_642908 ) ) ( not ( = ?auto_642906 ?auto_642909 ) ) ( not ( = ?auto_642906 ?auto_642910 ) ) ( not ( = ?auto_642907 ?auto_642908 ) ) ( not ( = ?auto_642907 ?auto_642909 ) ) ( not ( = ?auto_642907 ?auto_642910 ) ) ( not ( = ?auto_642908 ?auto_642909 ) ) ( not ( = ?auto_642908 ?auto_642910 ) ) ( not ( = ?auto_642909 ?auto_642910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_642909 ?auto_642910 )
      ( !STACK ?auto_642909 ?auto_642908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_642930 - BLOCK
      ?auto_642931 - BLOCK
      ?auto_642932 - BLOCK
      ?auto_642933 - BLOCK
      ?auto_642934 - BLOCK
      ?auto_642935 - BLOCK
    )
    :vars
    (
      ?auto_642936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642935 ?auto_642936 ) ( ON-TABLE ?auto_642930 ) ( ON ?auto_642931 ?auto_642930 ) ( ON ?auto_642932 ?auto_642931 ) ( ON ?auto_642933 ?auto_642932 ) ( not ( = ?auto_642930 ?auto_642931 ) ) ( not ( = ?auto_642930 ?auto_642932 ) ) ( not ( = ?auto_642930 ?auto_642933 ) ) ( not ( = ?auto_642930 ?auto_642934 ) ) ( not ( = ?auto_642930 ?auto_642935 ) ) ( not ( = ?auto_642930 ?auto_642936 ) ) ( not ( = ?auto_642931 ?auto_642932 ) ) ( not ( = ?auto_642931 ?auto_642933 ) ) ( not ( = ?auto_642931 ?auto_642934 ) ) ( not ( = ?auto_642931 ?auto_642935 ) ) ( not ( = ?auto_642931 ?auto_642936 ) ) ( not ( = ?auto_642932 ?auto_642933 ) ) ( not ( = ?auto_642932 ?auto_642934 ) ) ( not ( = ?auto_642932 ?auto_642935 ) ) ( not ( = ?auto_642932 ?auto_642936 ) ) ( not ( = ?auto_642933 ?auto_642934 ) ) ( not ( = ?auto_642933 ?auto_642935 ) ) ( not ( = ?auto_642933 ?auto_642936 ) ) ( not ( = ?auto_642934 ?auto_642935 ) ) ( not ( = ?auto_642934 ?auto_642936 ) ) ( not ( = ?auto_642935 ?auto_642936 ) ) ( CLEAR ?auto_642933 ) ( ON ?auto_642934 ?auto_642935 ) ( CLEAR ?auto_642934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_642930 ?auto_642931 ?auto_642932 ?auto_642933 ?auto_642934 )
      ( MAKE-6PILE ?auto_642930 ?auto_642931 ?auto_642932 ?auto_642933 ?auto_642934 ?auto_642935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_642956 - BLOCK
      ?auto_642957 - BLOCK
      ?auto_642958 - BLOCK
      ?auto_642959 - BLOCK
      ?auto_642960 - BLOCK
      ?auto_642961 - BLOCK
    )
    :vars
    (
      ?auto_642962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642961 ?auto_642962 ) ( ON-TABLE ?auto_642956 ) ( ON ?auto_642957 ?auto_642956 ) ( ON ?auto_642958 ?auto_642957 ) ( not ( = ?auto_642956 ?auto_642957 ) ) ( not ( = ?auto_642956 ?auto_642958 ) ) ( not ( = ?auto_642956 ?auto_642959 ) ) ( not ( = ?auto_642956 ?auto_642960 ) ) ( not ( = ?auto_642956 ?auto_642961 ) ) ( not ( = ?auto_642956 ?auto_642962 ) ) ( not ( = ?auto_642957 ?auto_642958 ) ) ( not ( = ?auto_642957 ?auto_642959 ) ) ( not ( = ?auto_642957 ?auto_642960 ) ) ( not ( = ?auto_642957 ?auto_642961 ) ) ( not ( = ?auto_642957 ?auto_642962 ) ) ( not ( = ?auto_642958 ?auto_642959 ) ) ( not ( = ?auto_642958 ?auto_642960 ) ) ( not ( = ?auto_642958 ?auto_642961 ) ) ( not ( = ?auto_642958 ?auto_642962 ) ) ( not ( = ?auto_642959 ?auto_642960 ) ) ( not ( = ?auto_642959 ?auto_642961 ) ) ( not ( = ?auto_642959 ?auto_642962 ) ) ( not ( = ?auto_642960 ?auto_642961 ) ) ( not ( = ?auto_642960 ?auto_642962 ) ) ( not ( = ?auto_642961 ?auto_642962 ) ) ( ON ?auto_642960 ?auto_642961 ) ( CLEAR ?auto_642958 ) ( ON ?auto_642959 ?auto_642960 ) ( CLEAR ?auto_642959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_642956 ?auto_642957 ?auto_642958 ?auto_642959 )
      ( MAKE-6PILE ?auto_642956 ?auto_642957 ?auto_642958 ?auto_642959 ?auto_642960 ?auto_642961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_642982 - BLOCK
      ?auto_642983 - BLOCK
      ?auto_642984 - BLOCK
      ?auto_642985 - BLOCK
      ?auto_642986 - BLOCK
      ?auto_642987 - BLOCK
    )
    :vars
    (
      ?auto_642988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_642987 ?auto_642988 ) ( ON-TABLE ?auto_642982 ) ( ON ?auto_642983 ?auto_642982 ) ( not ( = ?auto_642982 ?auto_642983 ) ) ( not ( = ?auto_642982 ?auto_642984 ) ) ( not ( = ?auto_642982 ?auto_642985 ) ) ( not ( = ?auto_642982 ?auto_642986 ) ) ( not ( = ?auto_642982 ?auto_642987 ) ) ( not ( = ?auto_642982 ?auto_642988 ) ) ( not ( = ?auto_642983 ?auto_642984 ) ) ( not ( = ?auto_642983 ?auto_642985 ) ) ( not ( = ?auto_642983 ?auto_642986 ) ) ( not ( = ?auto_642983 ?auto_642987 ) ) ( not ( = ?auto_642983 ?auto_642988 ) ) ( not ( = ?auto_642984 ?auto_642985 ) ) ( not ( = ?auto_642984 ?auto_642986 ) ) ( not ( = ?auto_642984 ?auto_642987 ) ) ( not ( = ?auto_642984 ?auto_642988 ) ) ( not ( = ?auto_642985 ?auto_642986 ) ) ( not ( = ?auto_642985 ?auto_642987 ) ) ( not ( = ?auto_642985 ?auto_642988 ) ) ( not ( = ?auto_642986 ?auto_642987 ) ) ( not ( = ?auto_642986 ?auto_642988 ) ) ( not ( = ?auto_642987 ?auto_642988 ) ) ( ON ?auto_642986 ?auto_642987 ) ( ON ?auto_642985 ?auto_642986 ) ( CLEAR ?auto_642983 ) ( ON ?auto_642984 ?auto_642985 ) ( CLEAR ?auto_642984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_642982 ?auto_642983 ?auto_642984 )
      ( MAKE-6PILE ?auto_642982 ?auto_642983 ?auto_642984 ?auto_642985 ?auto_642986 ?auto_642987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_643008 - BLOCK
      ?auto_643009 - BLOCK
      ?auto_643010 - BLOCK
      ?auto_643011 - BLOCK
      ?auto_643012 - BLOCK
      ?auto_643013 - BLOCK
    )
    :vars
    (
      ?auto_643014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643013 ?auto_643014 ) ( ON-TABLE ?auto_643008 ) ( not ( = ?auto_643008 ?auto_643009 ) ) ( not ( = ?auto_643008 ?auto_643010 ) ) ( not ( = ?auto_643008 ?auto_643011 ) ) ( not ( = ?auto_643008 ?auto_643012 ) ) ( not ( = ?auto_643008 ?auto_643013 ) ) ( not ( = ?auto_643008 ?auto_643014 ) ) ( not ( = ?auto_643009 ?auto_643010 ) ) ( not ( = ?auto_643009 ?auto_643011 ) ) ( not ( = ?auto_643009 ?auto_643012 ) ) ( not ( = ?auto_643009 ?auto_643013 ) ) ( not ( = ?auto_643009 ?auto_643014 ) ) ( not ( = ?auto_643010 ?auto_643011 ) ) ( not ( = ?auto_643010 ?auto_643012 ) ) ( not ( = ?auto_643010 ?auto_643013 ) ) ( not ( = ?auto_643010 ?auto_643014 ) ) ( not ( = ?auto_643011 ?auto_643012 ) ) ( not ( = ?auto_643011 ?auto_643013 ) ) ( not ( = ?auto_643011 ?auto_643014 ) ) ( not ( = ?auto_643012 ?auto_643013 ) ) ( not ( = ?auto_643012 ?auto_643014 ) ) ( not ( = ?auto_643013 ?auto_643014 ) ) ( ON ?auto_643012 ?auto_643013 ) ( ON ?auto_643011 ?auto_643012 ) ( ON ?auto_643010 ?auto_643011 ) ( CLEAR ?auto_643008 ) ( ON ?auto_643009 ?auto_643010 ) ( CLEAR ?auto_643009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_643008 ?auto_643009 )
      ( MAKE-6PILE ?auto_643008 ?auto_643009 ?auto_643010 ?auto_643011 ?auto_643012 ?auto_643013 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_643034 - BLOCK
      ?auto_643035 - BLOCK
      ?auto_643036 - BLOCK
      ?auto_643037 - BLOCK
      ?auto_643038 - BLOCK
      ?auto_643039 - BLOCK
    )
    :vars
    (
      ?auto_643040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643039 ?auto_643040 ) ( not ( = ?auto_643034 ?auto_643035 ) ) ( not ( = ?auto_643034 ?auto_643036 ) ) ( not ( = ?auto_643034 ?auto_643037 ) ) ( not ( = ?auto_643034 ?auto_643038 ) ) ( not ( = ?auto_643034 ?auto_643039 ) ) ( not ( = ?auto_643034 ?auto_643040 ) ) ( not ( = ?auto_643035 ?auto_643036 ) ) ( not ( = ?auto_643035 ?auto_643037 ) ) ( not ( = ?auto_643035 ?auto_643038 ) ) ( not ( = ?auto_643035 ?auto_643039 ) ) ( not ( = ?auto_643035 ?auto_643040 ) ) ( not ( = ?auto_643036 ?auto_643037 ) ) ( not ( = ?auto_643036 ?auto_643038 ) ) ( not ( = ?auto_643036 ?auto_643039 ) ) ( not ( = ?auto_643036 ?auto_643040 ) ) ( not ( = ?auto_643037 ?auto_643038 ) ) ( not ( = ?auto_643037 ?auto_643039 ) ) ( not ( = ?auto_643037 ?auto_643040 ) ) ( not ( = ?auto_643038 ?auto_643039 ) ) ( not ( = ?auto_643038 ?auto_643040 ) ) ( not ( = ?auto_643039 ?auto_643040 ) ) ( ON ?auto_643038 ?auto_643039 ) ( ON ?auto_643037 ?auto_643038 ) ( ON ?auto_643036 ?auto_643037 ) ( ON ?auto_643035 ?auto_643036 ) ( ON ?auto_643034 ?auto_643035 ) ( CLEAR ?auto_643034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_643034 )
      ( MAKE-6PILE ?auto_643034 ?auto_643035 ?auto_643036 ?auto_643037 ?auto_643038 ?auto_643039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643061 - BLOCK
      ?auto_643062 - BLOCK
      ?auto_643063 - BLOCK
      ?auto_643064 - BLOCK
      ?auto_643065 - BLOCK
      ?auto_643066 - BLOCK
      ?auto_643067 - BLOCK
    )
    :vars
    (
      ?auto_643068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_643066 ) ( ON ?auto_643067 ?auto_643068 ) ( CLEAR ?auto_643067 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_643061 ) ( ON ?auto_643062 ?auto_643061 ) ( ON ?auto_643063 ?auto_643062 ) ( ON ?auto_643064 ?auto_643063 ) ( ON ?auto_643065 ?auto_643064 ) ( ON ?auto_643066 ?auto_643065 ) ( not ( = ?auto_643061 ?auto_643062 ) ) ( not ( = ?auto_643061 ?auto_643063 ) ) ( not ( = ?auto_643061 ?auto_643064 ) ) ( not ( = ?auto_643061 ?auto_643065 ) ) ( not ( = ?auto_643061 ?auto_643066 ) ) ( not ( = ?auto_643061 ?auto_643067 ) ) ( not ( = ?auto_643061 ?auto_643068 ) ) ( not ( = ?auto_643062 ?auto_643063 ) ) ( not ( = ?auto_643062 ?auto_643064 ) ) ( not ( = ?auto_643062 ?auto_643065 ) ) ( not ( = ?auto_643062 ?auto_643066 ) ) ( not ( = ?auto_643062 ?auto_643067 ) ) ( not ( = ?auto_643062 ?auto_643068 ) ) ( not ( = ?auto_643063 ?auto_643064 ) ) ( not ( = ?auto_643063 ?auto_643065 ) ) ( not ( = ?auto_643063 ?auto_643066 ) ) ( not ( = ?auto_643063 ?auto_643067 ) ) ( not ( = ?auto_643063 ?auto_643068 ) ) ( not ( = ?auto_643064 ?auto_643065 ) ) ( not ( = ?auto_643064 ?auto_643066 ) ) ( not ( = ?auto_643064 ?auto_643067 ) ) ( not ( = ?auto_643064 ?auto_643068 ) ) ( not ( = ?auto_643065 ?auto_643066 ) ) ( not ( = ?auto_643065 ?auto_643067 ) ) ( not ( = ?auto_643065 ?auto_643068 ) ) ( not ( = ?auto_643066 ?auto_643067 ) ) ( not ( = ?auto_643066 ?auto_643068 ) ) ( not ( = ?auto_643067 ?auto_643068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_643067 ?auto_643068 )
      ( !STACK ?auto_643067 ?auto_643066 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643091 - BLOCK
      ?auto_643092 - BLOCK
      ?auto_643093 - BLOCK
      ?auto_643094 - BLOCK
      ?auto_643095 - BLOCK
      ?auto_643096 - BLOCK
      ?auto_643097 - BLOCK
    )
    :vars
    (
      ?auto_643098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643097 ?auto_643098 ) ( ON-TABLE ?auto_643091 ) ( ON ?auto_643092 ?auto_643091 ) ( ON ?auto_643093 ?auto_643092 ) ( ON ?auto_643094 ?auto_643093 ) ( ON ?auto_643095 ?auto_643094 ) ( not ( = ?auto_643091 ?auto_643092 ) ) ( not ( = ?auto_643091 ?auto_643093 ) ) ( not ( = ?auto_643091 ?auto_643094 ) ) ( not ( = ?auto_643091 ?auto_643095 ) ) ( not ( = ?auto_643091 ?auto_643096 ) ) ( not ( = ?auto_643091 ?auto_643097 ) ) ( not ( = ?auto_643091 ?auto_643098 ) ) ( not ( = ?auto_643092 ?auto_643093 ) ) ( not ( = ?auto_643092 ?auto_643094 ) ) ( not ( = ?auto_643092 ?auto_643095 ) ) ( not ( = ?auto_643092 ?auto_643096 ) ) ( not ( = ?auto_643092 ?auto_643097 ) ) ( not ( = ?auto_643092 ?auto_643098 ) ) ( not ( = ?auto_643093 ?auto_643094 ) ) ( not ( = ?auto_643093 ?auto_643095 ) ) ( not ( = ?auto_643093 ?auto_643096 ) ) ( not ( = ?auto_643093 ?auto_643097 ) ) ( not ( = ?auto_643093 ?auto_643098 ) ) ( not ( = ?auto_643094 ?auto_643095 ) ) ( not ( = ?auto_643094 ?auto_643096 ) ) ( not ( = ?auto_643094 ?auto_643097 ) ) ( not ( = ?auto_643094 ?auto_643098 ) ) ( not ( = ?auto_643095 ?auto_643096 ) ) ( not ( = ?auto_643095 ?auto_643097 ) ) ( not ( = ?auto_643095 ?auto_643098 ) ) ( not ( = ?auto_643096 ?auto_643097 ) ) ( not ( = ?auto_643096 ?auto_643098 ) ) ( not ( = ?auto_643097 ?auto_643098 ) ) ( CLEAR ?auto_643095 ) ( ON ?auto_643096 ?auto_643097 ) ( CLEAR ?auto_643096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_643091 ?auto_643092 ?auto_643093 ?auto_643094 ?auto_643095 ?auto_643096 )
      ( MAKE-7PILE ?auto_643091 ?auto_643092 ?auto_643093 ?auto_643094 ?auto_643095 ?auto_643096 ?auto_643097 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643121 - BLOCK
      ?auto_643122 - BLOCK
      ?auto_643123 - BLOCK
      ?auto_643124 - BLOCK
      ?auto_643125 - BLOCK
      ?auto_643126 - BLOCK
      ?auto_643127 - BLOCK
    )
    :vars
    (
      ?auto_643128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643127 ?auto_643128 ) ( ON-TABLE ?auto_643121 ) ( ON ?auto_643122 ?auto_643121 ) ( ON ?auto_643123 ?auto_643122 ) ( ON ?auto_643124 ?auto_643123 ) ( not ( = ?auto_643121 ?auto_643122 ) ) ( not ( = ?auto_643121 ?auto_643123 ) ) ( not ( = ?auto_643121 ?auto_643124 ) ) ( not ( = ?auto_643121 ?auto_643125 ) ) ( not ( = ?auto_643121 ?auto_643126 ) ) ( not ( = ?auto_643121 ?auto_643127 ) ) ( not ( = ?auto_643121 ?auto_643128 ) ) ( not ( = ?auto_643122 ?auto_643123 ) ) ( not ( = ?auto_643122 ?auto_643124 ) ) ( not ( = ?auto_643122 ?auto_643125 ) ) ( not ( = ?auto_643122 ?auto_643126 ) ) ( not ( = ?auto_643122 ?auto_643127 ) ) ( not ( = ?auto_643122 ?auto_643128 ) ) ( not ( = ?auto_643123 ?auto_643124 ) ) ( not ( = ?auto_643123 ?auto_643125 ) ) ( not ( = ?auto_643123 ?auto_643126 ) ) ( not ( = ?auto_643123 ?auto_643127 ) ) ( not ( = ?auto_643123 ?auto_643128 ) ) ( not ( = ?auto_643124 ?auto_643125 ) ) ( not ( = ?auto_643124 ?auto_643126 ) ) ( not ( = ?auto_643124 ?auto_643127 ) ) ( not ( = ?auto_643124 ?auto_643128 ) ) ( not ( = ?auto_643125 ?auto_643126 ) ) ( not ( = ?auto_643125 ?auto_643127 ) ) ( not ( = ?auto_643125 ?auto_643128 ) ) ( not ( = ?auto_643126 ?auto_643127 ) ) ( not ( = ?auto_643126 ?auto_643128 ) ) ( not ( = ?auto_643127 ?auto_643128 ) ) ( ON ?auto_643126 ?auto_643127 ) ( CLEAR ?auto_643124 ) ( ON ?auto_643125 ?auto_643126 ) ( CLEAR ?auto_643125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_643121 ?auto_643122 ?auto_643123 ?auto_643124 ?auto_643125 )
      ( MAKE-7PILE ?auto_643121 ?auto_643122 ?auto_643123 ?auto_643124 ?auto_643125 ?auto_643126 ?auto_643127 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643151 - BLOCK
      ?auto_643152 - BLOCK
      ?auto_643153 - BLOCK
      ?auto_643154 - BLOCK
      ?auto_643155 - BLOCK
      ?auto_643156 - BLOCK
      ?auto_643157 - BLOCK
    )
    :vars
    (
      ?auto_643158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643157 ?auto_643158 ) ( ON-TABLE ?auto_643151 ) ( ON ?auto_643152 ?auto_643151 ) ( ON ?auto_643153 ?auto_643152 ) ( not ( = ?auto_643151 ?auto_643152 ) ) ( not ( = ?auto_643151 ?auto_643153 ) ) ( not ( = ?auto_643151 ?auto_643154 ) ) ( not ( = ?auto_643151 ?auto_643155 ) ) ( not ( = ?auto_643151 ?auto_643156 ) ) ( not ( = ?auto_643151 ?auto_643157 ) ) ( not ( = ?auto_643151 ?auto_643158 ) ) ( not ( = ?auto_643152 ?auto_643153 ) ) ( not ( = ?auto_643152 ?auto_643154 ) ) ( not ( = ?auto_643152 ?auto_643155 ) ) ( not ( = ?auto_643152 ?auto_643156 ) ) ( not ( = ?auto_643152 ?auto_643157 ) ) ( not ( = ?auto_643152 ?auto_643158 ) ) ( not ( = ?auto_643153 ?auto_643154 ) ) ( not ( = ?auto_643153 ?auto_643155 ) ) ( not ( = ?auto_643153 ?auto_643156 ) ) ( not ( = ?auto_643153 ?auto_643157 ) ) ( not ( = ?auto_643153 ?auto_643158 ) ) ( not ( = ?auto_643154 ?auto_643155 ) ) ( not ( = ?auto_643154 ?auto_643156 ) ) ( not ( = ?auto_643154 ?auto_643157 ) ) ( not ( = ?auto_643154 ?auto_643158 ) ) ( not ( = ?auto_643155 ?auto_643156 ) ) ( not ( = ?auto_643155 ?auto_643157 ) ) ( not ( = ?auto_643155 ?auto_643158 ) ) ( not ( = ?auto_643156 ?auto_643157 ) ) ( not ( = ?auto_643156 ?auto_643158 ) ) ( not ( = ?auto_643157 ?auto_643158 ) ) ( ON ?auto_643156 ?auto_643157 ) ( ON ?auto_643155 ?auto_643156 ) ( CLEAR ?auto_643153 ) ( ON ?auto_643154 ?auto_643155 ) ( CLEAR ?auto_643154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_643151 ?auto_643152 ?auto_643153 ?auto_643154 )
      ( MAKE-7PILE ?auto_643151 ?auto_643152 ?auto_643153 ?auto_643154 ?auto_643155 ?auto_643156 ?auto_643157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643181 - BLOCK
      ?auto_643182 - BLOCK
      ?auto_643183 - BLOCK
      ?auto_643184 - BLOCK
      ?auto_643185 - BLOCK
      ?auto_643186 - BLOCK
      ?auto_643187 - BLOCK
    )
    :vars
    (
      ?auto_643188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643187 ?auto_643188 ) ( ON-TABLE ?auto_643181 ) ( ON ?auto_643182 ?auto_643181 ) ( not ( = ?auto_643181 ?auto_643182 ) ) ( not ( = ?auto_643181 ?auto_643183 ) ) ( not ( = ?auto_643181 ?auto_643184 ) ) ( not ( = ?auto_643181 ?auto_643185 ) ) ( not ( = ?auto_643181 ?auto_643186 ) ) ( not ( = ?auto_643181 ?auto_643187 ) ) ( not ( = ?auto_643181 ?auto_643188 ) ) ( not ( = ?auto_643182 ?auto_643183 ) ) ( not ( = ?auto_643182 ?auto_643184 ) ) ( not ( = ?auto_643182 ?auto_643185 ) ) ( not ( = ?auto_643182 ?auto_643186 ) ) ( not ( = ?auto_643182 ?auto_643187 ) ) ( not ( = ?auto_643182 ?auto_643188 ) ) ( not ( = ?auto_643183 ?auto_643184 ) ) ( not ( = ?auto_643183 ?auto_643185 ) ) ( not ( = ?auto_643183 ?auto_643186 ) ) ( not ( = ?auto_643183 ?auto_643187 ) ) ( not ( = ?auto_643183 ?auto_643188 ) ) ( not ( = ?auto_643184 ?auto_643185 ) ) ( not ( = ?auto_643184 ?auto_643186 ) ) ( not ( = ?auto_643184 ?auto_643187 ) ) ( not ( = ?auto_643184 ?auto_643188 ) ) ( not ( = ?auto_643185 ?auto_643186 ) ) ( not ( = ?auto_643185 ?auto_643187 ) ) ( not ( = ?auto_643185 ?auto_643188 ) ) ( not ( = ?auto_643186 ?auto_643187 ) ) ( not ( = ?auto_643186 ?auto_643188 ) ) ( not ( = ?auto_643187 ?auto_643188 ) ) ( ON ?auto_643186 ?auto_643187 ) ( ON ?auto_643185 ?auto_643186 ) ( ON ?auto_643184 ?auto_643185 ) ( CLEAR ?auto_643182 ) ( ON ?auto_643183 ?auto_643184 ) ( CLEAR ?auto_643183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_643181 ?auto_643182 ?auto_643183 )
      ( MAKE-7PILE ?auto_643181 ?auto_643182 ?auto_643183 ?auto_643184 ?auto_643185 ?auto_643186 ?auto_643187 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643211 - BLOCK
      ?auto_643212 - BLOCK
      ?auto_643213 - BLOCK
      ?auto_643214 - BLOCK
      ?auto_643215 - BLOCK
      ?auto_643216 - BLOCK
      ?auto_643217 - BLOCK
    )
    :vars
    (
      ?auto_643218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643217 ?auto_643218 ) ( ON-TABLE ?auto_643211 ) ( not ( = ?auto_643211 ?auto_643212 ) ) ( not ( = ?auto_643211 ?auto_643213 ) ) ( not ( = ?auto_643211 ?auto_643214 ) ) ( not ( = ?auto_643211 ?auto_643215 ) ) ( not ( = ?auto_643211 ?auto_643216 ) ) ( not ( = ?auto_643211 ?auto_643217 ) ) ( not ( = ?auto_643211 ?auto_643218 ) ) ( not ( = ?auto_643212 ?auto_643213 ) ) ( not ( = ?auto_643212 ?auto_643214 ) ) ( not ( = ?auto_643212 ?auto_643215 ) ) ( not ( = ?auto_643212 ?auto_643216 ) ) ( not ( = ?auto_643212 ?auto_643217 ) ) ( not ( = ?auto_643212 ?auto_643218 ) ) ( not ( = ?auto_643213 ?auto_643214 ) ) ( not ( = ?auto_643213 ?auto_643215 ) ) ( not ( = ?auto_643213 ?auto_643216 ) ) ( not ( = ?auto_643213 ?auto_643217 ) ) ( not ( = ?auto_643213 ?auto_643218 ) ) ( not ( = ?auto_643214 ?auto_643215 ) ) ( not ( = ?auto_643214 ?auto_643216 ) ) ( not ( = ?auto_643214 ?auto_643217 ) ) ( not ( = ?auto_643214 ?auto_643218 ) ) ( not ( = ?auto_643215 ?auto_643216 ) ) ( not ( = ?auto_643215 ?auto_643217 ) ) ( not ( = ?auto_643215 ?auto_643218 ) ) ( not ( = ?auto_643216 ?auto_643217 ) ) ( not ( = ?auto_643216 ?auto_643218 ) ) ( not ( = ?auto_643217 ?auto_643218 ) ) ( ON ?auto_643216 ?auto_643217 ) ( ON ?auto_643215 ?auto_643216 ) ( ON ?auto_643214 ?auto_643215 ) ( ON ?auto_643213 ?auto_643214 ) ( CLEAR ?auto_643211 ) ( ON ?auto_643212 ?auto_643213 ) ( CLEAR ?auto_643212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_643211 ?auto_643212 )
      ( MAKE-7PILE ?auto_643211 ?auto_643212 ?auto_643213 ?auto_643214 ?auto_643215 ?auto_643216 ?auto_643217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_643241 - BLOCK
      ?auto_643242 - BLOCK
      ?auto_643243 - BLOCK
      ?auto_643244 - BLOCK
      ?auto_643245 - BLOCK
      ?auto_643246 - BLOCK
      ?auto_643247 - BLOCK
    )
    :vars
    (
      ?auto_643248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643247 ?auto_643248 ) ( not ( = ?auto_643241 ?auto_643242 ) ) ( not ( = ?auto_643241 ?auto_643243 ) ) ( not ( = ?auto_643241 ?auto_643244 ) ) ( not ( = ?auto_643241 ?auto_643245 ) ) ( not ( = ?auto_643241 ?auto_643246 ) ) ( not ( = ?auto_643241 ?auto_643247 ) ) ( not ( = ?auto_643241 ?auto_643248 ) ) ( not ( = ?auto_643242 ?auto_643243 ) ) ( not ( = ?auto_643242 ?auto_643244 ) ) ( not ( = ?auto_643242 ?auto_643245 ) ) ( not ( = ?auto_643242 ?auto_643246 ) ) ( not ( = ?auto_643242 ?auto_643247 ) ) ( not ( = ?auto_643242 ?auto_643248 ) ) ( not ( = ?auto_643243 ?auto_643244 ) ) ( not ( = ?auto_643243 ?auto_643245 ) ) ( not ( = ?auto_643243 ?auto_643246 ) ) ( not ( = ?auto_643243 ?auto_643247 ) ) ( not ( = ?auto_643243 ?auto_643248 ) ) ( not ( = ?auto_643244 ?auto_643245 ) ) ( not ( = ?auto_643244 ?auto_643246 ) ) ( not ( = ?auto_643244 ?auto_643247 ) ) ( not ( = ?auto_643244 ?auto_643248 ) ) ( not ( = ?auto_643245 ?auto_643246 ) ) ( not ( = ?auto_643245 ?auto_643247 ) ) ( not ( = ?auto_643245 ?auto_643248 ) ) ( not ( = ?auto_643246 ?auto_643247 ) ) ( not ( = ?auto_643246 ?auto_643248 ) ) ( not ( = ?auto_643247 ?auto_643248 ) ) ( ON ?auto_643246 ?auto_643247 ) ( ON ?auto_643245 ?auto_643246 ) ( ON ?auto_643244 ?auto_643245 ) ( ON ?auto_643243 ?auto_643244 ) ( ON ?auto_643242 ?auto_643243 ) ( ON ?auto_643241 ?auto_643242 ) ( CLEAR ?auto_643241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_643241 )
      ( MAKE-7PILE ?auto_643241 ?auto_643242 ?auto_643243 ?auto_643244 ?auto_643245 ?auto_643246 ?auto_643247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643272 - BLOCK
      ?auto_643273 - BLOCK
      ?auto_643274 - BLOCK
      ?auto_643275 - BLOCK
      ?auto_643276 - BLOCK
      ?auto_643277 - BLOCK
      ?auto_643278 - BLOCK
      ?auto_643279 - BLOCK
    )
    :vars
    (
      ?auto_643280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_643278 ) ( ON ?auto_643279 ?auto_643280 ) ( CLEAR ?auto_643279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_643272 ) ( ON ?auto_643273 ?auto_643272 ) ( ON ?auto_643274 ?auto_643273 ) ( ON ?auto_643275 ?auto_643274 ) ( ON ?auto_643276 ?auto_643275 ) ( ON ?auto_643277 ?auto_643276 ) ( ON ?auto_643278 ?auto_643277 ) ( not ( = ?auto_643272 ?auto_643273 ) ) ( not ( = ?auto_643272 ?auto_643274 ) ) ( not ( = ?auto_643272 ?auto_643275 ) ) ( not ( = ?auto_643272 ?auto_643276 ) ) ( not ( = ?auto_643272 ?auto_643277 ) ) ( not ( = ?auto_643272 ?auto_643278 ) ) ( not ( = ?auto_643272 ?auto_643279 ) ) ( not ( = ?auto_643272 ?auto_643280 ) ) ( not ( = ?auto_643273 ?auto_643274 ) ) ( not ( = ?auto_643273 ?auto_643275 ) ) ( not ( = ?auto_643273 ?auto_643276 ) ) ( not ( = ?auto_643273 ?auto_643277 ) ) ( not ( = ?auto_643273 ?auto_643278 ) ) ( not ( = ?auto_643273 ?auto_643279 ) ) ( not ( = ?auto_643273 ?auto_643280 ) ) ( not ( = ?auto_643274 ?auto_643275 ) ) ( not ( = ?auto_643274 ?auto_643276 ) ) ( not ( = ?auto_643274 ?auto_643277 ) ) ( not ( = ?auto_643274 ?auto_643278 ) ) ( not ( = ?auto_643274 ?auto_643279 ) ) ( not ( = ?auto_643274 ?auto_643280 ) ) ( not ( = ?auto_643275 ?auto_643276 ) ) ( not ( = ?auto_643275 ?auto_643277 ) ) ( not ( = ?auto_643275 ?auto_643278 ) ) ( not ( = ?auto_643275 ?auto_643279 ) ) ( not ( = ?auto_643275 ?auto_643280 ) ) ( not ( = ?auto_643276 ?auto_643277 ) ) ( not ( = ?auto_643276 ?auto_643278 ) ) ( not ( = ?auto_643276 ?auto_643279 ) ) ( not ( = ?auto_643276 ?auto_643280 ) ) ( not ( = ?auto_643277 ?auto_643278 ) ) ( not ( = ?auto_643277 ?auto_643279 ) ) ( not ( = ?auto_643277 ?auto_643280 ) ) ( not ( = ?auto_643278 ?auto_643279 ) ) ( not ( = ?auto_643278 ?auto_643280 ) ) ( not ( = ?auto_643279 ?auto_643280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_643279 ?auto_643280 )
      ( !STACK ?auto_643279 ?auto_643278 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643306 - BLOCK
      ?auto_643307 - BLOCK
      ?auto_643308 - BLOCK
      ?auto_643309 - BLOCK
      ?auto_643310 - BLOCK
      ?auto_643311 - BLOCK
      ?auto_643312 - BLOCK
      ?auto_643313 - BLOCK
    )
    :vars
    (
      ?auto_643314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643313 ?auto_643314 ) ( ON-TABLE ?auto_643306 ) ( ON ?auto_643307 ?auto_643306 ) ( ON ?auto_643308 ?auto_643307 ) ( ON ?auto_643309 ?auto_643308 ) ( ON ?auto_643310 ?auto_643309 ) ( ON ?auto_643311 ?auto_643310 ) ( not ( = ?auto_643306 ?auto_643307 ) ) ( not ( = ?auto_643306 ?auto_643308 ) ) ( not ( = ?auto_643306 ?auto_643309 ) ) ( not ( = ?auto_643306 ?auto_643310 ) ) ( not ( = ?auto_643306 ?auto_643311 ) ) ( not ( = ?auto_643306 ?auto_643312 ) ) ( not ( = ?auto_643306 ?auto_643313 ) ) ( not ( = ?auto_643306 ?auto_643314 ) ) ( not ( = ?auto_643307 ?auto_643308 ) ) ( not ( = ?auto_643307 ?auto_643309 ) ) ( not ( = ?auto_643307 ?auto_643310 ) ) ( not ( = ?auto_643307 ?auto_643311 ) ) ( not ( = ?auto_643307 ?auto_643312 ) ) ( not ( = ?auto_643307 ?auto_643313 ) ) ( not ( = ?auto_643307 ?auto_643314 ) ) ( not ( = ?auto_643308 ?auto_643309 ) ) ( not ( = ?auto_643308 ?auto_643310 ) ) ( not ( = ?auto_643308 ?auto_643311 ) ) ( not ( = ?auto_643308 ?auto_643312 ) ) ( not ( = ?auto_643308 ?auto_643313 ) ) ( not ( = ?auto_643308 ?auto_643314 ) ) ( not ( = ?auto_643309 ?auto_643310 ) ) ( not ( = ?auto_643309 ?auto_643311 ) ) ( not ( = ?auto_643309 ?auto_643312 ) ) ( not ( = ?auto_643309 ?auto_643313 ) ) ( not ( = ?auto_643309 ?auto_643314 ) ) ( not ( = ?auto_643310 ?auto_643311 ) ) ( not ( = ?auto_643310 ?auto_643312 ) ) ( not ( = ?auto_643310 ?auto_643313 ) ) ( not ( = ?auto_643310 ?auto_643314 ) ) ( not ( = ?auto_643311 ?auto_643312 ) ) ( not ( = ?auto_643311 ?auto_643313 ) ) ( not ( = ?auto_643311 ?auto_643314 ) ) ( not ( = ?auto_643312 ?auto_643313 ) ) ( not ( = ?auto_643312 ?auto_643314 ) ) ( not ( = ?auto_643313 ?auto_643314 ) ) ( CLEAR ?auto_643311 ) ( ON ?auto_643312 ?auto_643313 ) ( CLEAR ?auto_643312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_643306 ?auto_643307 ?auto_643308 ?auto_643309 ?auto_643310 ?auto_643311 ?auto_643312 )
      ( MAKE-8PILE ?auto_643306 ?auto_643307 ?auto_643308 ?auto_643309 ?auto_643310 ?auto_643311 ?auto_643312 ?auto_643313 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643340 - BLOCK
      ?auto_643341 - BLOCK
      ?auto_643342 - BLOCK
      ?auto_643343 - BLOCK
      ?auto_643344 - BLOCK
      ?auto_643345 - BLOCK
      ?auto_643346 - BLOCK
      ?auto_643347 - BLOCK
    )
    :vars
    (
      ?auto_643348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643347 ?auto_643348 ) ( ON-TABLE ?auto_643340 ) ( ON ?auto_643341 ?auto_643340 ) ( ON ?auto_643342 ?auto_643341 ) ( ON ?auto_643343 ?auto_643342 ) ( ON ?auto_643344 ?auto_643343 ) ( not ( = ?auto_643340 ?auto_643341 ) ) ( not ( = ?auto_643340 ?auto_643342 ) ) ( not ( = ?auto_643340 ?auto_643343 ) ) ( not ( = ?auto_643340 ?auto_643344 ) ) ( not ( = ?auto_643340 ?auto_643345 ) ) ( not ( = ?auto_643340 ?auto_643346 ) ) ( not ( = ?auto_643340 ?auto_643347 ) ) ( not ( = ?auto_643340 ?auto_643348 ) ) ( not ( = ?auto_643341 ?auto_643342 ) ) ( not ( = ?auto_643341 ?auto_643343 ) ) ( not ( = ?auto_643341 ?auto_643344 ) ) ( not ( = ?auto_643341 ?auto_643345 ) ) ( not ( = ?auto_643341 ?auto_643346 ) ) ( not ( = ?auto_643341 ?auto_643347 ) ) ( not ( = ?auto_643341 ?auto_643348 ) ) ( not ( = ?auto_643342 ?auto_643343 ) ) ( not ( = ?auto_643342 ?auto_643344 ) ) ( not ( = ?auto_643342 ?auto_643345 ) ) ( not ( = ?auto_643342 ?auto_643346 ) ) ( not ( = ?auto_643342 ?auto_643347 ) ) ( not ( = ?auto_643342 ?auto_643348 ) ) ( not ( = ?auto_643343 ?auto_643344 ) ) ( not ( = ?auto_643343 ?auto_643345 ) ) ( not ( = ?auto_643343 ?auto_643346 ) ) ( not ( = ?auto_643343 ?auto_643347 ) ) ( not ( = ?auto_643343 ?auto_643348 ) ) ( not ( = ?auto_643344 ?auto_643345 ) ) ( not ( = ?auto_643344 ?auto_643346 ) ) ( not ( = ?auto_643344 ?auto_643347 ) ) ( not ( = ?auto_643344 ?auto_643348 ) ) ( not ( = ?auto_643345 ?auto_643346 ) ) ( not ( = ?auto_643345 ?auto_643347 ) ) ( not ( = ?auto_643345 ?auto_643348 ) ) ( not ( = ?auto_643346 ?auto_643347 ) ) ( not ( = ?auto_643346 ?auto_643348 ) ) ( not ( = ?auto_643347 ?auto_643348 ) ) ( ON ?auto_643346 ?auto_643347 ) ( CLEAR ?auto_643344 ) ( ON ?auto_643345 ?auto_643346 ) ( CLEAR ?auto_643345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_643340 ?auto_643341 ?auto_643342 ?auto_643343 ?auto_643344 ?auto_643345 )
      ( MAKE-8PILE ?auto_643340 ?auto_643341 ?auto_643342 ?auto_643343 ?auto_643344 ?auto_643345 ?auto_643346 ?auto_643347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643374 - BLOCK
      ?auto_643375 - BLOCK
      ?auto_643376 - BLOCK
      ?auto_643377 - BLOCK
      ?auto_643378 - BLOCK
      ?auto_643379 - BLOCK
      ?auto_643380 - BLOCK
      ?auto_643381 - BLOCK
    )
    :vars
    (
      ?auto_643382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643381 ?auto_643382 ) ( ON-TABLE ?auto_643374 ) ( ON ?auto_643375 ?auto_643374 ) ( ON ?auto_643376 ?auto_643375 ) ( ON ?auto_643377 ?auto_643376 ) ( not ( = ?auto_643374 ?auto_643375 ) ) ( not ( = ?auto_643374 ?auto_643376 ) ) ( not ( = ?auto_643374 ?auto_643377 ) ) ( not ( = ?auto_643374 ?auto_643378 ) ) ( not ( = ?auto_643374 ?auto_643379 ) ) ( not ( = ?auto_643374 ?auto_643380 ) ) ( not ( = ?auto_643374 ?auto_643381 ) ) ( not ( = ?auto_643374 ?auto_643382 ) ) ( not ( = ?auto_643375 ?auto_643376 ) ) ( not ( = ?auto_643375 ?auto_643377 ) ) ( not ( = ?auto_643375 ?auto_643378 ) ) ( not ( = ?auto_643375 ?auto_643379 ) ) ( not ( = ?auto_643375 ?auto_643380 ) ) ( not ( = ?auto_643375 ?auto_643381 ) ) ( not ( = ?auto_643375 ?auto_643382 ) ) ( not ( = ?auto_643376 ?auto_643377 ) ) ( not ( = ?auto_643376 ?auto_643378 ) ) ( not ( = ?auto_643376 ?auto_643379 ) ) ( not ( = ?auto_643376 ?auto_643380 ) ) ( not ( = ?auto_643376 ?auto_643381 ) ) ( not ( = ?auto_643376 ?auto_643382 ) ) ( not ( = ?auto_643377 ?auto_643378 ) ) ( not ( = ?auto_643377 ?auto_643379 ) ) ( not ( = ?auto_643377 ?auto_643380 ) ) ( not ( = ?auto_643377 ?auto_643381 ) ) ( not ( = ?auto_643377 ?auto_643382 ) ) ( not ( = ?auto_643378 ?auto_643379 ) ) ( not ( = ?auto_643378 ?auto_643380 ) ) ( not ( = ?auto_643378 ?auto_643381 ) ) ( not ( = ?auto_643378 ?auto_643382 ) ) ( not ( = ?auto_643379 ?auto_643380 ) ) ( not ( = ?auto_643379 ?auto_643381 ) ) ( not ( = ?auto_643379 ?auto_643382 ) ) ( not ( = ?auto_643380 ?auto_643381 ) ) ( not ( = ?auto_643380 ?auto_643382 ) ) ( not ( = ?auto_643381 ?auto_643382 ) ) ( ON ?auto_643380 ?auto_643381 ) ( ON ?auto_643379 ?auto_643380 ) ( CLEAR ?auto_643377 ) ( ON ?auto_643378 ?auto_643379 ) ( CLEAR ?auto_643378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_643374 ?auto_643375 ?auto_643376 ?auto_643377 ?auto_643378 )
      ( MAKE-8PILE ?auto_643374 ?auto_643375 ?auto_643376 ?auto_643377 ?auto_643378 ?auto_643379 ?auto_643380 ?auto_643381 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643408 - BLOCK
      ?auto_643409 - BLOCK
      ?auto_643410 - BLOCK
      ?auto_643411 - BLOCK
      ?auto_643412 - BLOCK
      ?auto_643413 - BLOCK
      ?auto_643414 - BLOCK
      ?auto_643415 - BLOCK
    )
    :vars
    (
      ?auto_643416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643415 ?auto_643416 ) ( ON-TABLE ?auto_643408 ) ( ON ?auto_643409 ?auto_643408 ) ( ON ?auto_643410 ?auto_643409 ) ( not ( = ?auto_643408 ?auto_643409 ) ) ( not ( = ?auto_643408 ?auto_643410 ) ) ( not ( = ?auto_643408 ?auto_643411 ) ) ( not ( = ?auto_643408 ?auto_643412 ) ) ( not ( = ?auto_643408 ?auto_643413 ) ) ( not ( = ?auto_643408 ?auto_643414 ) ) ( not ( = ?auto_643408 ?auto_643415 ) ) ( not ( = ?auto_643408 ?auto_643416 ) ) ( not ( = ?auto_643409 ?auto_643410 ) ) ( not ( = ?auto_643409 ?auto_643411 ) ) ( not ( = ?auto_643409 ?auto_643412 ) ) ( not ( = ?auto_643409 ?auto_643413 ) ) ( not ( = ?auto_643409 ?auto_643414 ) ) ( not ( = ?auto_643409 ?auto_643415 ) ) ( not ( = ?auto_643409 ?auto_643416 ) ) ( not ( = ?auto_643410 ?auto_643411 ) ) ( not ( = ?auto_643410 ?auto_643412 ) ) ( not ( = ?auto_643410 ?auto_643413 ) ) ( not ( = ?auto_643410 ?auto_643414 ) ) ( not ( = ?auto_643410 ?auto_643415 ) ) ( not ( = ?auto_643410 ?auto_643416 ) ) ( not ( = ?auto_643411 ?auto_643412 ) ) ( not ( = ?auto_643411 ?auto_643413 ) ) ( not ( = ?auto_643411 ?auto_643414 ) ) ( not ( = ?auto_643411 ?auto_643415 ) ) ( not ( = ?auto_643411 ?auto_643416 ) ) ( not ( = ?auto_643412 ?auto_643413 ) ) ( not ( = ?auto_643412 ?auto_643414 ) ) ( not ( = ?auto_643412 ?auto_643415 ) ) ( not ( = ?auto_643412 ?auto_643416 ) ) ( not ( = ?auto_643413 ?auto_643414 ) ) ( not ( = ?auto_643413 ?auto_643415 ) ) ( not ( = ?auto_643413 ?auto_643416 ) ) ( not ( = ?auto_643414 ?auto_643415 ) ) ( not ( = ?auto_643414 ?auto_643416 ) ) ( not ( = ?auto_643415 ?auto_643416 ) ) ( ON ?auto_643414 ?auto_643415 ) ( ON ?auto_643413 ?auto_643414 ) ( ON ?auto_643412 ?auto_643413 ) ( CLEAR ?auto_643410 ) ( ON ?auto_643411 ?auto_643412 ) ( CLEAR ?auto_643411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_643408 ?auto_643409 ?auto_643410 ?auto_643411 )
      ( MAKE-8PILE ?auto_643408 ?auto_643409 ?auto_643410 ?auto_643411 ?auto_643412 ?auto_643413 ?auto_643414 ?auto_643415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643442 - BLOCK
      ?auto_643443 - BLOCK
      ?auto_643444 - BLOCK
      ?auto_643445 - BLOCK
      ?auto_643446 - BLOCK
      ?auto_643447 - BLOCK
      ?auto_643448 - BLOCK
      ?auto_643449 - BLOCK
    )
    :vars
    (
      ?auto_643450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643449 ?auto_643450 ) ( ON-TABLE ?auto_643442 ) ( ON ?auto_643443 ?auto_643442 ) ( not ( = ?auto_643442 ?auto_643443 ) ) ( not ( = ?auto_643442 ?auto_643444 ) ) ( not ( = ?auto_643442 ?auto_643445 ) ) ( not ( = ?auto_643442 ?auto_643446 ) ) ( not ( = ?auto_643442 ?auto_643447 ) ) ( not ( = ?auto_643442 ?auto_643448 ) ) ( not ( = ?auto_643442 ?auto_643449 ) ) ( not ( = ?auto_643442 ?auto_643450 ) ) ( not ( = ?auto_643443 ?auto_643444 ) ) ( not ( = ?auto_643443 ?auto_643445 ) ) ( not ( = ?auto_643443 ?auto_643446 ) ) ( not ( = ?auto_643443 ?auto_643447 ) ) ( not ( = ?auto_643443 ?auto_643448 ) ) ( not ( = ?auto_643443 ?auto_643449 ) ) ( not ( = ?auto_643443 ?auto_643450 ) ) ( not ( = ?auto_643444 ?auto_643445 ) ) ( not ( = ?auto_643444 ?auto_643446 ) ) ( not ( = ?auto_643444 ?auto_643447 ) ) ( not ( = ?auto_643444 ?auto_643448 ) ) ( not ( = ?auto_643444 ?auto_643449 ) ) ( not ( = ?auto_643444 ?auto_643450 ) ) ( not ( = ?auto_643445 ?auto_643446 ) ) ( not ( = ?auto_643445 ?auto_643447 ) ) ( not ( = ?auto_643445 ?auto_643448 ) ) ( not ( = ?auto_643445 ?auto_643449 ) ) ( not ( = ?auto_643445 ?auto_643450 ) ) ( not ( = ?auto_643446 ?auto_643447 ) ) ( not ( = ?auto_643446 ?auto_643448 ) ) ( not ( = ?auto_643446 ?auto_643449 ) ) ( not ( = ?auto_643446 ?auto_643450 ) ) ( not ( = ?auto_643447 ?auto_643448 ) ) ( not ( = ?auto_643447 ?auto_643449 ) ) ( not ( = ?auto_643447 ?auto_643450 ) ) ( not ( = ?auto_643448 ?auto_643449 ) ) ( not ( = ?auto_643448 ?auto_643450 ) ) ( not ( = ?auto_643449 ?auto_643450 ) ) ( ON ?auto_643448 ?auto_643449 ) ( ON ?auto_643447 ?auto_643448 ) ( ON ?auto_643446 ?auto_643447 ) ( ON ?auto_643445 ?auto_643446 ) ( CLEAR ?auto_643443 ) ( ON ?auto_643444 ?auto_643445 ) ( CLEAR ?auto_643444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_643442 ?auto_643443 ?auto_643444 )
      ( MAKE-8PILE ?auto_643442 ?auto_643443 ?auto_643444 ?auto_643445 ?auto_643446 ?auto_643447 ?auto_643448 ?auto_643449 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643476 - BLOCK
      ?auto_643477 - BLOCK
      ?auto_643478 - BLOCK
      ?auto_643479 - BLOCK
      ?auto_643480 - BLOCK
      ?auto_643481 - BLOCK
      ?auto_643482 - BLOCK
      ?auto_643483 - BLOCK
    )
    :vars
    (
      ?auto_643484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643483 ?auto_643484 ) ( ON-TABLE ?auto_643476 ) ( not ( = ?auto_643476 ?auto_643477 ) ) ( not ( = ?auto_643476 ?auto_643478 ) ) ( not ( = ?auto_643476 ?auto_643479 ) ) ( not ( = ?auto_643476 ?auto_643480 ) ) ( not ( = ?auto_643476 ?auto_643481 ) ) ( not ( = ?auto_643476 ?auto_643482 ) ) ( not ( = ?auto_643476 ?auto_643483 ) ) ( not ( = ?auto_643476 ?auto_643484 ) ) ( not ( = ?auto_643477 ?auto_643478 ) ) ( not ( = ?auto_643477 ?auto_643479 ) ) ( not ( = ?auto_643477 ?auto_643480 ) ) ( not ( = ?auto_643477 ?auto_643481 ) ) ( not ( = ?auto_643477 ?auto_643482 ) ) ( not ( = ?auto_643477 ?auto_643483 ) ) ( not ( = ?auto_643477 ?auto_643484 ) ) ( not ( = ?auto_643478 ?auto_643479 ) ) ( not ( = ?auto_643478 ?auto_643480 ) ) ( not ( = ?auto_643478 ?auto_643481 ) ) ( not ( = ?auto_643478 ?auto_643482 ) ) ( not ( = ?auto_643478 ?auto_643483 ) ) ( not ( = ?auto_643478 ?auto_643484 ) ) ( not ( = ?auto_643479 ?auto_643480 ) ) ( not ( = ?auto_643479 ?auto_643481 ) ) ( not ( = ?auto_643479 ?auto_643482 ) ) ( not ( = ?auto_643479 ?auto_643483 ) ) ( not ( = ?auto_643479 ?auto_643484 ) ) ( not ( = ?auto_643480 ?auto_643481 ) ) ( not ( = ?auto_643480 ?auto_643482 ) ) ( not ( = ?auto_643480 ?auto_643483 ) ) ( not ( = ?auto_643480 ?auto_643484 ) ) ( not ( = ?auto_643481 ?auto_643482 ) ) ( not ( = ?auto_643481 ?auto_643483 ) ) ( not ( = ?auto_643481 ?auto_643484 ) ) ( not ( = ?auto_643482 ?auto_643483 ) ) ( not ( = ?auto_643482 ?auto_643484 ) ) ( not ( = ?auto_643483 ?auto_643484 ) ) ( ON ?auto_643482 ?auto_643483 ) ( ON ?auto_643481 ?auto_643482 ) ( ON ?auto_643480 ?auto_643481 ) ( ON ?auto_643479 ?auto_643480 ) ( ON ?auto_643478 ?auto_643479 ) ( CLEAR ?auto_643476 ) ( ON ?auto_643477 ?auto_643478 ) ( CLEAR ?auto_643477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_643476 ?auto_643477 )
      ( MAKE-8PILE ?auto_643476 ?auto_643477 ?auto_643478 ?auto_643479 ?auto_643480 ?auto_643481 ?auto_643482 ?auto_643483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_643510 - BLOCK
      ?auto_643511 - BLOCK
      ?auto_643512 - BLOCK
      ?auto_643513 - BLOCK
      ?auto_643514 - BLOCK
      ?auto_643515 - BLOCK
      ?auto_643516 - BLOCK
      ?auto_643517 - BLOCK
    )
    :vars
    (
      ?auto_643518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643517 ?auto_643518 ) ( not ( = ?auto_643510 ?auto_643511 ) ) ( not ( = ?auto_643510 ?auto_643512 ) ) ( not ( = ?auto_643510 ?auto_643513 ) ) ( not ( = ?auto_643510 ?auto_643514 ) ) ( not ( = ?auto_643510 ?auto_643515 ) ) ( not ( = ?auto_643510 ?auto_643516 ) ) ( not ( = ?auto_643510 ?auto_643517 ) ) ( not ( = ?auto_643510 ?auto_643518 ) ) ( not ( = ?auto_643511 ?auto_643512 ) ) ( not ( = ?auto_643511 ?auto_643513 ) ) ( not ( = ?auto_643511 ?auto_643514 ) ) ( not ( = ?auto_643511 ?auto_643515 ) ) ( not ( = ?auto_643511 ?auto_643516 ) ) ( not ( = ?auto_643511 ?auto_643517 ) ) ( not ( = ?auto_643511 ?auto_643518 ) ) ( not ( = ?auto_643512 ?auto_643513 ) ) ( not ( = ?auto_643512 ?auto_643514 ) ) ( not ( = ?auto_643512 ?auto_643515 ) ) ( not ( = ?auto_643512 ?auto_643516 ) ) ( not ( = ?auto_643512 ?auto_643517 ) ) ( not ( = ?auto_643512 ?auto_643518 ) ) ( not ( = ?auto_643513 ?auto_643514 ) ) ( not ( = ?auto_643513 ?auto_643515 ) ) ( not ( = ?auto_643513 ?auto_643516 ) ) ( not ( = ?auto_643513 ?auto_643517 ) ) ( not ( = ?auto_643513 ?auto_643518 ) ) ( not ( = ?auto_643514 ?auto_643515 ) ) ( not ( = ?auto_643514 ?auto_643516 ) ) ( not ( = ?auto_643514 ?auto_643517 ) ) ( not ( = ?auto_643514 ?auto_643518 ) ) ( not ( = ?auto_643515 ?auto_643516 ) ) ( not ( = ?auto_643515 ?auto_643517 ) ) ( not ( = ?auto_643515 ?auto_643518 ) ) ( not ( = ?auto_643516 ?auto_643517 ) ) ( not ( = ?auto_643516 ?auto_643518 ) ) ( not ( = ?auto_643517 ?auto_643518 ) ) ( ON ?auto_643516 ?auto_643517 ) ( ON ?auto_643515 ?auto_643516 ) ( ON ?auto_643514 ?auto_643515 ) ( ON ?auto_643513 ?auto_643514 ) ( ON ?auto_643512 ?auto_643513 ) ( ON ?auto_643511 ?auto_643512 ) ( ON ?auto_643510 ?auto_643511 ) ( CLEAR ?auto_643510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_643510 )
      ( MAKE-8PILE ?auto_643510 ?auto_643511 ?auto_643512 ?auto_643513 ?auto_643514 ?auto_643515 ?auto_643516 ?auto_643517 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643545 - BLOCK
      ?auto_643546 - BLOCK
      ?auto_643547 - BLOCK
      ?auto_643548 - BLOCK
      ?auto_643549 - BLOCK
      ?auto_643550 - BLOCK
      ?auto_643551 - BLOCK
      ?auto_643552 - BLOCK
      ?auto_643553 - BLOCK
    )
    :vars
    (
      ?auto_643554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_643552 ) ( ON ?auto_643553 ?auto_643554 ) ( CLEAR ?auto_643553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_643545 ) ( ON ?auto_643546 ?auto_643545 ) ( ON ?auto_643547 ?auto_643546 ) ( ON ?auto_643548 ?auto_643547 ) ( ON ?auto_643549 ?auto_643548 ) ( ON ?auto_643550 ?auto_643549 ) ( ON ?auto_643551 ?auto_643550 ) ( ON ?auto_643552 ?auto_643551 ) ( not ( = ?auto_643545 ?auto_643546 ) ) ( not ( = ?auto_643545 ?auto_643547 ) ) ( not ( = ?auto_643545 ?auto_643548 ) ) ( not ( = ?auto_643545 ?auto_643549 ) ) ( not ( = ?auto_643545 ?auto_643550 ) ) ( not ( = ?auto_643545 ?auto_643551 ) ) ( not ( = ?auto_643545 ?auto_643552 ) ) ( not ( = ?auto_643545 ?auto_643553 ) ) ( not ( = ?auto_643545 ?auto_643554 ) ) ( not ( = ?auto_643546 ?auto_643547 ) ) ( not ( = ?auto_643546 ?auto_643548 ) ) ( not ( = ?auto_643546 ?auto_643549 ) ) ( not ( = ?auto_643546 ?auto_643550 ) ) ( not ( = ?auto_643546 ?auto_643551 ) ) ( not ( = ?auto_643546 ?auto_643552 ) ) ( not ( = ?auto_643546 ?auto_643553 ) ) ( not ( = ?auto_643546 ?auto_643554 ) ) ( not ( = ?auto_643547 ?auto_643548 ) ) ( not ( = ?auto_643547 ?auto_643549 ) ) ( not ( = ?auto_643547 ?auto_643550 ) ) ( not ( = ?auto_643547 ?auto_643551 ) ) ( not ( = ?auto_643547 ?auto_643552 ) ) ( not ( = ?auto_643547 ?auto_643553 ) ) ( not ( = ?auto_643547 ?auto_643554 ) ) ( not ( = ?auto_643548 ?auto_643549 ) ) ( not ( = ?auto_643548 ?auto_643550 ) ) ( not ( = ?auto_643548 ?auto_643551 ) ) ( not ( = ?auto_643548 ?auto_643552 ) ) ( not ( = ?auto_643548 ?auto_643553 ) ) ( not ( = ?auto_643548 ?auto_643554 ) ) ( not ( = ?auto_643549 ?auto_643550 ) ) ( not ( = ?auto_643549 ?auto_643551 ) ) ( not ( = ?auto_643549 ?auto_643552 ) ) ( not ( = ?auto_643549 ?auto_643553 ) ) ( not ( = ?auto_643549 ?auto_643554 ) ) ( not ( = ?auto_643550 ?auto_643551 ) ) ( not ( = ?auto_643550 ?auto_643552 ) ) ( not ( = ?auto_643550 ?auto_643553 ) ) ( not ( = ?auto_643550 ?auto_643554 ) ) ( not ( = ?auto_643551 ?auto_643552 ) ) ( not ( = ?auto_643551 ?auto_643553 ) ) ( not ( = ?auto_643551 ?auto_643554 ) ) ( not ( = ?auto_643552 ?auto_643553 ) ) ( not ( = ?auto_643552 ?auto_643554 ) ) ( not ( = ?auto_643553 ?auto_643554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_643553 ?auto_643554 )
      ( !STACK ?auto_643553 ?auto_643552 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643583 - BLOCK
      ?auto_643584 - BLOCK
      ?auto_643585 - BLOCK
      ?auto_643586 - BLOCK
      ?auto_643587 - BLOCK
      ?auto_643588 - BLOCK
      ?auto_643589 - BLOCK
      ?auto_643590 - BLOCK
      ?auto_643591 - BLOCK
    )
    :vars
    (
      ?auto_643592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643591 ?auto_643592 ) ( ON-TABLE ?auto_643583 ) ( ON ?auto_643584 ?auto_643583 ) ( ON ?auto_643585 ?auto_643584 ) ( ON ?auto_643586 ?auto_643585 ) ( ON ?auto_643587 ?auto_643586 ) ( ON ?auto_643588 ?auto_643587 ) ( ON ?auto_643589 ?auto_643588 ) ( not ( = ?auto_643583 ?auto_643584 ) ) ( not ( = ?auto_643583 ?auto_643585 ) ) ( not ( = ?auto_643583 ?auto_643586 ) ) ( not ( = ?auto_643583 ?auto_643587 ) ) ( not ( = ?auto_643583 ?auto_643588 ) ) ( not ( = ?auto_643583 ?auto_643589 ) ) ( not ( = ?auto_643583 ?auto_643590 ) ) ( not ( = ?auto_643583 ?auto_643591 ) ) ( not ( = ?auto_643583 ?auto_643592 ) ) ( not ( = ?auto_643584 ?auto_643585 ) ) ( not ( = ?auto_643584 ?auto_643586 ) ) ( not ( = ?auto_643584 ?auto_643587 ) ) ( not ( = ?auto_643584 ?auto_643588 ) ) ( not ( = ?auto_643584 ?auto_643589 ) ) ( not ( = ?auto_643584 ?auto_643590 ) ) ( not ( = ?auto_643584 ?auto_643591 ) ) ( not ( = ?auto_643584 ?auto_643592 ) ) ( not ( = ?auto_643585 ?auto_643586 ) ) ( not ( = ?auto_643585 ?auto_643587 ) ) ( not ( = ?auto_643585 ?auto_643588 ) ) ( not ( = ?auto_643585 ?auto_643589 ) ) ( not ( = ?auto_643585 ?auto_643590 ) ) ( not ( = ?auto_643585 ?auto_643591 ) ) ( not ( = ?auto_643585 ?auto_643592 ) ) ( not ( = ?auto_643586 ?auto_643587 ) ) ( not ( = ?auto_643586 ?auto_643588 ) ) ( not ( = ?auto_643586 ?auto_643589 ) ) ( not ( = ?auto_643586 ?auto_643590 ) ) ( not ( = ?auto_643586 ?auto_643591 ) ) ( not ( = ?auto_643586 ?auto_643592 ) ) ( not ( = ?auto_643587 ?auto_643588 ) ) ( not ( = ?auto_643587 ?auto_643589 ) ) ( not ( = ?auto_643587 ?auto_643590 ) ) ( not ( = ?auto_643587 ?auto_643591 ) ) ( not ( = ?auto_643587 ?auto_643592 ) ) ( not ( = ?auto_643588 ?auto_643589 ) ) ( not ( = ?auto_643588 ?auto_643590 ) ) ( not ( = ?auto_643588 ?auto_643591 ) ) ( not ( = ?auto_643588 ?auto_643592 ) ) ( not ( = ?auto_643589 ?auto_643590 ) ) ( not ( = ?auto_643589 ?auto_643591 ) ) ( not ( = ?auto_643589 ?auto_643592 ) ) ( not ( = ?auto_643590 ?auto_643591 ) ) ( not ( = ?auto_643590 ?auto_643592 ) ) ( not ( = ?auto_643591 ?auto_643592 ) ) ( CLEAR ?auto_643589 ) ( ON ?auto_643590 ?auto_643591 ) ( CLEAR ?auto_643590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_643583 ?auto_643584 ?auto_643585 ?auto_643586 ?auto_643587 ?auto_643588 ?auto_643589 ?auto_643590 )
      ( MAKE-9PILE ?auto_643583 ?auto_643584 ?auto_643585 ?auto_643586 ?auto_643587 ?auto_643588 ?auto_643589 ?auto_643590 ?auto_643591 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643621 - BLOCK
      ?auto_643622 - BLOCK
      ?auto_643623 - BLOCK
      ?auto_643624 - BLOCK
      ?auto_643625 - BLOCK
      ?auto_643626 - BLOCK
      ?auto_643627 - BLOCK
      ?auto_643628 - BLOCK
      ?auto_643629 - BLOCK
    )
    :vars
    (
      ?auto_643630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643629 ?auto_643630 ) ( ON-TABLE ?auto_643621 ) ( ON ?auto_643622 ?auto_643621 ) ( ON ?auto_643623 ?auto_643622 ) ( ON ?auto_643624 ?auto_643623 ) ( ON ?auto_643625 ?auto_643624 ) ( ON ?auto_643626 ?auto_643625 ) ( not ( = ?auto_643621 ?auto_643622 ) ) ( not ( = ?auto_643621 ?auto_643623 ) ) ( not ( = ?auto_643621 ?auto_643624 ) ) ( not ( = ?auto_643621 ?auto_643625 ) ) ( not ( = ?auto_643621 ?auto_643626 ) ) ( not ( = ?auto_643621 ?auto_643627 ) ) ( not ( = ?auto_643621 ?auto_643628 ) ) ( not ( = ?auto_643621 ?auto_643629 ) ) ( not ( = ?auto_643621 ?auto_643630 ) ) ( not ( = ?auto_643622 ?auto_643623 ) ) ( not ( = ?auto_643622 ?auto_643624 ) ) ( not ( = ?auto_643622 ?auto_643625 ) ) ( not ( = ?auto_643622 ?auto_643626 ) ) ( not ( = ?auto_643622 ?auto_643627 ) ) ( not ( = ?auto_643622 ?auto_643628 ) ) ( not ( = ?auto_643622 ?auto_643629 ) ) ( not ( = ?auto_643622 ?auto_643630 ) ) ( not ( = ?auto_643623 ?auto_643624 ) ) ( not ( = ?auto_643623 ?auto_643625 ) ) ( not ( = ?auto_643623 ?auto_643626 ) ) ( not ( = ?auto_643623 ?auto_643627 ) ) ( not ( = ?auto_643623 ?auto_643628 ) ) ( not ( = ?auto_643623 ?auto_643629 ) ) ( not ( = ?auto_643623 ?auto_643630 ) ) ( not ( = ?auto_643624 ?auto_643625 ) ) ( not ( = ?auto_643624 ?auto_643626 ) ) ( not ( = ?auto_643624 ?auto_643627 ) ) ( not ( = ?auto_643624 ?auto_643628 ) ) ( not ( = ?auto_643624 ?auto_643629 ) ) ( not ( = ?auto_643624 ?auto_643630 ) ) ( not ( = ?auto_643625 ?auto_643626 ) ) ( not ( = ?auto_643625 ?auto_643627 ) ) ( not ( = ?auto_643625 ?auto_643628 ) ) ( not ( = ?auto_643625 ?auto_643629 ) ) ( not ( = ?auto_643625 ?auto_643630 ) ) ( not ( = ?auto_643626 ?auto_643627 ) ) ( not ( = ?auto_643626 ?auto_643628 ) ) ( not ( = ?auto_643626 ?auto_643629 ) ) ( not ( = ?auto_643626 ?auto_643630 ) ) ( not ( = ?auto_643627 ?auto_643628 ) ) ( not ( = ?auto_643627 ?auto_643629 ) ) ( not ( = ?auto_643627 ?auto_643630 ) ) ( not ( = ?auto_643628 ?auto_643629 ) ) ( not ( = ?auto_643628 ?auto_643630 ) ) ( not ( = ?auto_643629 ?auto_643630 ) ) ( ON ?auto_643628 ?auto_643629 ) ( CLEAR ?auto_643626 ) ( ON ?auto_643627 ?auto_643628 ) ( CLEAR ?auto_643627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_643621 ?auto_643622 ?auto_643623 ?auto_643624 ?auto_643625 ?auto_643626 ?auto_643627 )
      ( MAKE-9PILE ?auto_643621 ?auto_643622 ?auto_643623 ?auto_643624 ?auto_643625 ?auto_643626 ?auto_643627 ?auto_643628 ?auto_643629 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643659 - BLOCK
      ?auto_643660 - BLOCK
      ?auto_643661 - BLOCK
      ?auto_643662 - BLOCK
      ?auto_643663 - BLOCK
      ?auto_643664 - BLOCK
      ?auto_643665 - BLOCK
      ?auto_643666 - BLOCK
      ?auto_643667 - BLOCK
    )
    :vars
    (
      ?auto_643668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643667 ?auto_643668 ) ( ON-TABLE ?auto_643659 ) ( ON ?auto_643660 ?auto_643659 ) ( ON ?auto_643661 ?auto_643660 ) ( ON ?auto_643662 ?auto_643661 ) ( ON ?auto_643663 ?auto_643662 ) ( not ( = ?auto_643659 ?auto_643660 ) ) ( not ( = ?auto_643659 ?auto_643661 ) ) ( not ( = ?auto_643659 ?auto_643662 ) ) ( not ( = ?auto_643659 ?auto_643663 ) ) ( not ( = ?auto_643659 ?auto_643664 ) ) ( not ( = ?auto_643659 ?auto_643665 ) ) ( not ( = ?auto_643659 ?auto_643666 ) ) ( not ( = ?auto_643659 ?auto_643667 ) ) ( not ( = ?auto_643659 ?auto_643668 ) ) ( not ( = ?auto_643660 ?auto_643661 ) ) ( not ( = ?auto_643660 ?auto_643662 ) ) ( not ( = ?auto_643660 ?auto_643663 ) ) ( not ( = ?auto_643660 ?auto_643664 ) ) ( not ( = ?auto_643660 ?auto_643665 ) ) ( not ( = ?auto_643660 ?auto_643666 ) ) ( not ( = ?auto_643660 ?auto_643667 ) ) ( not ( = ?auto_643660 ?auto_643668 ) ) ( not ( = ?auto_643661 ?auto_643662 ) ) ( not ( = ?auto_643661 ?auto_643663 ) ) ( not ( = ?auto_643661 ?auto_643664 ) ) ( not ( = ?auto_643661 ?auto_643665 ) ) ( not ( = ?auto_643661 ?auto_643666 ) ) ( not ( = ?auto_643661 ?auto_643667 ) ) ( not ( = ?auto_643661 ?auto_643668 ) ) ( not ( = ?auto_643662 ?auto_643663 ) ) ( not ( = ?auto_643662 ?auto_643664 ) ) ( not ( = ?auto_643662 ?auto_643665 ) ) ( not ( = ?auto_643662 ?auto_643666 ) ) ( not ( = ?auto_643662 ?auto_643667 ) ) ( not ( = ?auto_643662 ?auto_643668 ) ) ( not ( = ?auto_643663 ?auto_643664 ) ) ( not ( = ?auto_643663 ?auto_643665 ) ) ( not ( = ?auto_643663 ?auto_643666 ) ) ( not ( = ?auto_643663 ?auto_643667 ) ) ( not ( = ?auto_643663 ?auto_643668 ) ) ( not ( = ?auto_643664 ?auto_643665 ) ) ( not ( = ?auto_643664 ?auto_643666 ) ) ( not ( = ?auto_643664 ?auto_643667 ) ) ( not ( = ?auto_643664 ?auto_643668 ) ) ( not ( = ?auto_643665 ?auto_643666 ) ) ( not ( = ?auto_643665 ?auto_643667 ) ) ( not ( = ?auto_643665 ?auto_643668 ) ) ( not ( = ?auto_643666 ?auto_643667 ) ) ( not ( = ?auto_643666 ?auto_643668 ) ) ( not ( = ?auto_643667 ?auto_643668 ) ) ( ON ?auto_643666 ?auto_643667 ) ( ON ?auto_643665 ?auto_643666 ) ( CLEAR ?auto_643663 ) ( ON ?auto_643664 ?auto_643665 ) ( CLEAR ?auto_643664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_643659 ?auto_643660 ?auto_643661 ?auto_643662 ?auto_643663 ?auto_643664 )
      ( MAKE-9PILE ?auto_643659 ?auto_643660 ?auto_643661 ?auto_643662 ?auto_643663 ?auto_643664 ?auto_643665 ?auto_643666 ?auto_643667 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643697 - BLOCK
      ?auto_643698 - BLOCK
      ?auto_643699 - BLOCK
      ?auto_643700 - BLOCK
      ?auto_643701 - BLOCK
      ?auto_643702 - BLOCK
      ?auto_643703 - BLOCK
      ?auto_643704 - BLOCK
      ?auto_643705 - BLOCK
    )
    :vars
    (
      ?auto_643706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643705 ?auto_643706 ) ( ON-TABLE ?auto_643697 ) ( ON ?auto_643698 ?auto_643697 ) ( ON ?auto_643699 ?auto_643698 ) ( ON ?auto_643700 ?auto_643699 ) ( not ( = ?auto_643697 ?auto_643698 ) ) ( not ( = ?auto_643697 ?auto_643699 ) ) ( not ( = ?auto_643697 ?auto_643700 ) ) ( not ( = ?auto_643697 ?auto_643701 ) ) ( not ( = ?auto_643697 ?auto_643702 ) ) ( not ( = ?auto_643697 ?auto_643703 ) ) ( not ( = ?auto_643697 ?auto_643704 ) ) ( not ( = ?auto_643697 ?auto_643705 ) ) ( not ( = ?auto_643697 ?auto_643706 ) ) ( not ( = ?auto_643698 ?auto_643699 ) ) ( not ( = ?auto_643698 ?auto_643700 ) ) ( not ( = ?auto_643698 ?auto_643701 ) ) ( not ( = ?auto_643698 ?auto_643702 ) ) ( not ( = ?auto_643698 ?auto_643703 ) ) ( not ( = ?auto_643698 ?auto_643704 ) ) ( not ( = ?auto_643698 ?auto_643705 ) ) ( not ( = ?auto_643698 ?auto_643706 ) ) ( not ( = ?auto_643699 ?auto_643700 ) ) ( not ( = ?auto_643699 ?auto_643701 ) ) ( not ( = ?auto_643699 ?auto_643702 ) ) ( not ( = ?auto_643699 ?auto_643703 ) ) ( not ( = ?auto_643699 ?auto_643704 ) ) ( not ( = ?auto_643699 ?auto_643705 ) ) ( not ( = ?auto_643699 ?auto_643706 ) ) ( not ( = ?auto_643700 ?auto_643701 ) ) ( not ( = ?auto_643700 ?auto_643702 ) ) ( not ( = ?auto_643700 ?auto_643703 ) ) ( not ( = ?auto_643700 ?auto_643704 ) ) ( not ( = ?auto_643700 ?auto_643705 ) ) ( not ( = ?auto_643700 ?auto_643706 ) ) ( not ( = ?auto_643701 ?auto_643702 ) ) ( not ( = ?auto_643701 ?auto_643703 ) ) ( not ( = ?auto_643701 ?auto_643704 ) ) ( not ( = ?auto_643701 ?auto_643705 ) ) ( not ( = ?auto_643701 ?auto_643706 ) ) ( not ( = ?auto_643702 ?auto_643703 ) ) ( not ( = ?auto_643702 ?auto_643704 ) ) ( not ( = ?auto_643702 ?auto_643705 ) ) ( not ( = ?auto_643702 ?auto_643706 ) ) ( not ( = ?auto_643703 ?auto_643704 ) ) ( not ( = ?auto_643703 ?auto_643705 ) ) ( not ( = ?auto_643703 ?auto_643706 ) ) ( not ( = ?auto_643704 ?auto_643705 ) ) ( not ( = ?auto_643704 ?auto_643706 ) ) ( not ( = ?auto_643705 ?auto_643706 ) ) ( ON ?auto_643704 ?auto_643705 ) ( ON ?auto_643703 ?auto_643704 ) ( ON ?auto_643702 ?auto_643703 ) ( CLEAR ?auto_643700 ) ( ON ?auto_643701 ?auto_643702 ) ( CLEAR ?auto_643701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_643697 ?auto_643698 ?auto_643699 ?auto_643700 ?auto_643701 )
      ( MAKE-9PILE ?auto_643697 ?auto_643698 ?auto_643699 ?auto_643700 ?auto_643701 ?auto_643702 ?auto_643703 ?auto_643704 ?auto_643705 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643735 - BLOCK
      ?auto_643736 - BLOCK
      ?auto_643737 - BLOCK
      ?auto_643738 - BLOCK
      ?auto_643739 - BLOCK
      ?auto_643740 - BLOCK
      ?auto_643741 - BLOCK
      ?auto_643742 - BLOCK
      ?auto_643743 - BLOCK
    )
    :vars
    (
      ?auto_643744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643743 ?auto_643744 ) ( ON-TABLE ?auto_643735 ) ( ON ?auto_643736 ?auto_643735 ) ( ON ?auto_643737 ?auto_643736 ) ( not ( = ?auto_643735 ?auto_643736 ) ) ( not ( = ?auto_643735 ?auto_643737 ) ) ( not ( = ?auto_643735 ?auto_643738 ) ) ( not ( = ?auto_643735 ?auto_643739 ) ) ( not ( = ?auto_643735 ?auto_643740 ) ) ( not ( = ?auto_643735 ?auto_643741 ) ) ( not ( = ?auto_643735 ?auto_643742 ) ) ( not ( = ?auto_643735 ?auto_643743 ) ) ( not ( = ?auto_643735 ?auto_643744 ) ) ( not ( = ?auto_643736 ?auto_643737 ) ) ( not ( = ?auto_643736 ?auto_643738 ) ) ( not ( = ?auto_643736 ?auto_643739 ) ) ( not ( = ?auto_643736 ?auto_643740 ) ) ( not ( = ?auto_643736 ?auto_643741 ) ) ( not ( = ?auto_643736 ?auto_643742 ) ) ( not ( = ?auto_643736 ?auto_643743 ) ) ( not ( = ?auto_643736 ?auto_643744 ) ) ( not ( = ?auto_643737 ?auto_643738 ) ) ( not ( = ?auto_643737 ?auto_643739 ) ) ( not ( = ?auto_643737 ?auto_643740 ) ) ( not ( = ?auto_643737 ?auto_643741 ) ) ( not ( = ?auto_643737 ?auto_643742 ) ) ( not ( = ?auto_643737 ?auto_643743 ) ) ( not ( = ?auto_643737 ?auto_643744 ) ) ( not ( = ?auto_643738 ?auto_643739 ) ) ( not ( = ?auto_643738 ?auto_643740 ) ) ( not ( = ?auto_643738 ?auto_643741 ) ) ( not ( = ?auto_643738 ?auto_643742 ) ) ( not ( = ?auto_643738 ?auto_643743 ) ) ( not ( = ?auto_643738 ?auto_643744 ) ) ( not ( = ?auto_643739 ?auto_643740 ) ) ( not ( = ?auto_643739 ?auto_643741 ) ) ( not ( = ?auto_643739 ?auto_643742 ) ) ( not ( = ?auto_643739 ?auto_643743 ) ) ( not ( = ?auto_643739 ?auto_643744 ) ) ( not ( = ?auto_643740 ?auto_643741 ) ) ( not ( = ?auto_643740 ?auto_643742 ) ) ( not ( = ?auto_643740 ?auto_643743 ) ) ( not ( = ?auto_643740 ?auto_643744 ) ) ( not ( = ?auto_643741 ?auto_643742 ) ) ( not ( = ?auto_643741 ?auto_643743 ) ) ( not ( = ?auto_643741 ?auto_643744 ) ) ( not ( = ?auto_643742 ?auto_643743 ) ) ( not ( = ?auto_643742 ?auto_643744 ) ) ( not ( = ?auto_643743 ?auto_643744 ) ) ( ON ?auto_643742 ?auto_643743 ) ( ON ?auto_643741 ?auto_643742 ) ( ON ?auto_643740 ?auto_643741 ) ( ON ?auto_643739 ?auto_643740 ) ( CLEAR ?auto_643737 ) ( ON ?auto_643738 ?auto_643739 ) ( CLEAR ?auto_643738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_643735 ?auto_643736 ?auto_643737 ?auto_643738 )
      ( MAKE-9PILE ?auto_643735 ?auto_643736 ?auto_643737 ?auto_643738 ?auto_643739 ?auto_643740 ?auto_643741 ?auto_643742 ?auto_643743 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643773 - BLOCK
      ?auto_643774 - BLOCK
      ?auto_643775 - BLOCK
      ?auto_643776 - BLOCK
      ?auto_643777 - BLOCK
      ?auto_643778 - BLOCK
      ?auto_643779 - BLOCK
      ?auto_643780 - BLOCK
      ?auto_643781 - BLOCK
    )
    :vars
    (
      ?auto_643782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643781 ?auto_643782 ) ( ON-TABLE ?auto_643773 ) ( ON ?auto_643774 ?auto_643773 ) ( not ( = ?auto_643773 ?auto_643774 ) ) ( not ( = ?auto_643773 ?auto_643775 ) ) ( not ( = ?auto_643773 ?auto_643776 ) ) ( not ( = ?auto_643773 ?auto_643777 ) ) ( not ( = ?auto_643773 ?auto_643778 ) ) ( not ( = ?auto_643773 ?auto_643779 ) ) ( not ( = ?auto_643773 ?auto_643780 ) ) ( not ( = ?auto_643773 ?auto_643781 ) ) ( not ( = ?auto_643773 ?auto_643782 ) ) ( not ( = ?auto_643774 ?auto_643775 ) ) ( not ( = ?auto_643774 ?auto_643776 ) ) ( not ( = ?auto_643774 ?auto_643777 ) ) ( not ( = ?auto_643774 ?auto_643778 ) ) ( not ( = ?auto_643774 ?auto_643779 ) ) ( not ( = ?auto_643774 ?auto_643780 ) ) ( not ( = ?auto_643774 ?auto_643781 ) ) ( not ( = ?auto_643774 ?auto_643782 ) ) ( not ( = ?auto_643775 ?auto_643776 ) ) ( not ( = ?auto_643775 ?auto_643777 ) ) ( not ( = ?auto_643775 ?auto_643778 ) ) ( not ( = ?auto_643775 ?auto_643779 ) ) ( not ( = ?auto_643775 ?auto_643780 ) ) ( not ( = ?auto_643775 ?auto_643781 ) ) ( not ( = ?auto_643775 ?auto_643782 ) ) ( not ( = ?auto_643776 ?auto_643777 ) ) ( not ( = ?auto_643776 ?auto_643778 ) ) ( not ( = ?auto_643776 ?auto_643779 ) ) ( not ( = ?auto_643776 ?auto_643780 ) ) ( not ( = ?auto_643776 ?auto_643781 ) ) ( not ( = ?auto_643776 ?auto_643782 ) ) ( not ( = ?auto_643777 ?auto_643778 ) ) ( not ( = ?auto_643777 ?auto_643779 ) ) ( not ( = ?auto_643777 ?auto_643780 ) ) ( not ( = ?auto_643777 ?auto_643781 ) ) ( not ( = ?auto_643777 ?auto_643782 ) ) ( not ( = ?auto_643778 ?auto_643779 ) ) ( not ( = ?auto_643778 ?auto_643780 ) ) ( not ( = ?auto_643778 ?auto_643781 ) ) ( not ( = ?auto_643778 ?auto_643782 ) ) ( not ( = ?auto_643779 ?auto_643780 ) ) ( not ( = ?auto_643779 ?auto_643781 ) ) ( not ( = ?auto_643779 ?auto_643782 ) ) ( not ( = ?auto_643780 ?auto_643781 ) ) ( not ( = ?auto_643780 ?auto_643782 ) ) ( not ( = ?auto_643781 ?auto_643782 ) ) ( ON ?auto_643780 ?auto_643781 ) ( ON ?auto_643779 ?auto_643780 ) ( ON ?auto_643778 ?auto_643779 ) ( ON ?auto_643777 ?auto_643778 ) ( ON ?auto_643776 ?auto_643777 ) ( CLEAR ?auto_643774 ) ( ON ?auto_643775 ?auto_643776 ) ( CLEAR ?auto_643775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_643773 ?auto_643774 ?auto_643775 )
      ( MAKE-9PILE ?auto_643773 ?auto_643774 ?auto_643775 ?auto_643776 ?auto_643777 ?auto_643778 ?auto_643779 ?auto_643780 ?auto_643781 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643811 - BLOCK
      ?auto_643812 - BLOCK
      ?auto_643813 - BLOCK
      ?auto_643814 - BLOCK
      ?auto_643815 - BLOCK
      ?auto_643816 - BLOCK
      ?auto_643817 - BLOCK
      ?auto_643818 - BLOCK
      ?auto_643819 - BLOCK
    )
    :vars
    (
      ?auto_643820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643819 ?auto_643820 ) ( ON-TABLE ?auto_643811 ) ( not ( = ?auto_643811 ?auto_643812 ) ) ( not ( = ?auto_643811 ?auto_643813 ) ) ( not ( = ?auto_643811 ?auto_643814 ) ) ( not ( = ?auto_643811 ?auto_643815 ) ) ( not ( = ?auto_643811 ?auto_643816 ) ) ( not ( = ?auto_643811 ?auto_643817 ) ) ( not ( = ?auto_643811 ?auto_643818 ) ) ( not ( = ?auto_643811 ?auto_643819 ) ) ( not ( = ?auto_643811 ?auto_643820 ) ) ( not ( = ?auto_643812 ?auto_643813 ) ) ( not ( = ?auto_643812 ?auto_643814 ) ) ( not ( = ?auto_643812 ?auto_643815 ) ) ( not ( = ?auto_643812 ?auto_643816 ) ) ( not ( = ?auto_643812 ?auto_643817 ) ) ( not ( = ?auto_643812 ?auto_643818 ) ) ( not ( = ?auto_643812 ?auto_643819 ) ) ( not ( = ?auto_643812 ?auto_643820 ) ) ( not ( = ?auto_643813 ?auto_643814 ) ) ( not ( = ?auto_643813 ?auto_643815 ) ) ( not ( = ?auto_643813 ?auto_643816 ) ) ( not ( = ?auto_643813 ?auto_643817 ) ) ( not ( = ?auto_643813 ?auto_643818 ) ) ( not ( = ?auto_643813 ?auto_643819 ) ) ( not ( = ?auto_643813 ?auto_643820 ) ) ( not ( = ?auto_643814 ?auto_643815 ) ) ( not ( = ?auto_643814 ?auto_643816 ) ) ( not ( = ?auto_643814 ?auto_643817 ) ) ( not ( = ?auto_643814 ?auto_643818 ) ) ( not ( = ?auto_643814 ?auto_643819 ) ) ( not ( = ?auto_643814 ?auto_643820 ) ) ( not ( = ?auto_643815 ?auto_643816 ) ) ( not ( = ?auto_643815 ?auto_643817 ) ) ( not ( = ?auto_643815 ?auto_643818 ) ) ( not ( = ?auto_643815 ?auto_643819 ) ) ( not ( = ?auto_643815 ?auto_643820 ) ) ( not ( = ?auto_643816 ?auto_643817 ) ) ( not ( = ?auto_643816 ?auto_643818 ) ) ( not ( = ?auto_643816 ?auto_643819 ) ) ( not ( = ?auto_643816 ?auto_643820 ) ) ( not ( = ?auto_643817 ?auto_643818 ) ) ( not ( = ?auto_643817 ?auto_643819 ) ) ( not ( = ?auto_643817 ?auto_643820 ) ) ( not ( = ?auto_643818 ?auto_643819 ) ) ( not ( = ?auto_643818 ?auto_643820 ) ) ( not ( = ?auto_643819 ?auto_643820 ) ) ( ON ?auto_643818 ?auto_643819 ) ( ON ?auto_643817 ?auto_643818 ) ( ON ?auto_643816 ?auto_643817 ) ( ON ?auto_643815 ?auto_643816 ) ( ON ?auto_643814 ?auto_643815 ) ( ON ?auto_643813 ?auto_643814 ) ( CLEAR ?auto_643811 ) ( ON ?auto_643812 ?auto_643813 ) ( CLEAR ?auto_643812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_643811 ?auto_643812 )
      ( MAKE-9PILE ?auto_643811 ?auto_643812 ?auto_643813 ?auto_643814 ?auto_643815 ?auto_643816 ?auto_643817 ?auto_643818 ?auto_643819 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_643849 - BLOCK
      ?auto_643850 - BLOCK
      ?auto_643851 - BLOCK
      ?auto_643852 - BLOCK
      ?auto_643853 - BLOCK
      ?auto_643854 - BLOCK
      ?auto_643855 - BLOCK
      ?auto_643856 - BLOCK
      ?auto_643857 - BLOCK
    )
    :vars
    (
      ?auto_643858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643857 ?auto_643858 ) ( not ( = ?auto_643849 ?auto_643850 ) ) ( not ( = ?auto_643849 ?auto_643851 ) ) ( not ( = ?auto_643849 ?auto_643852 ) ) ( not ( = ?auto_643849 ?auto_643853 ) ) ( not ( = ?auto_643849 ?auto_643854 ) ) ( not ( = ?auto_643849 ?auto_643855 ) ) ( not ( = ?auto_643849 ?auto_643856 ) ) ( not ( = ?auto_643849 ?auto_643857 ) ) ( not ( = ?auto_643849 ?auto_643858 ) ) ( not ( = ?auto_643850 ?auto_643851 ) ) ( not ( = ?auto_643850 ?auto_643852 ) ) ( not ( = ?auto_643850 ?auto_643853 ) ) ( not ( = ?auto_643850 ?auto_643854 ) ) ( not ( = ?auto_643850 ?auto_643855 ) ) ( not ( = ?auto_643850 ?auto_643856 ) ) ( not ( = ?auto_643850 ?auto_643857 ) ) ( not ( = ?auto_643850 ?auto_643858 ) ) ( not ( = ?auto_643851 ?auto_643852 ) ) ( not ( = ?auto_643851 ?auto_643853 ) ) ( not ( = ?auto_643851 ?auto_643854 ) ) ( not ( = ?auto_643851 ?auto_643855 ) ) ( not ( = ?auto_643851 ?auto_643856 ) ) ( not ( = ?auto_643851 ?auto_643857 ) ) ( not ( = ?auto_643851 ?auto_643858 ) ) ( not ( = ?auto_643852 ?auto_643853 ) ) ( not ( = ?auto_643852 ?auto_643854 ) ) ( not ( = ?auto_643852 ?auto_643855 ) ) ( not ( = ?auto_643852 ?auto_643856 ) ) ( not ( = ?auto_643852 ?auto_643857 ) ) ( not ( = ?auto_643852 ?auto_643858 ) ) ( not ( = ?auto_643853 ?auto_643854 ) ) ( not ( = ?auto_643853 ?auto_643855 ) ) ( not ( = ?auto_643853 ?auto_643856 ) ) ( not ( = ?auto_643853 ?auto_643857 ) ) ( not ( = ?auto_643853 ?auto_643858 ) ) ( not ( = ?auto_643854 ?auto_643855 ) ) ( not ( = ?auto_643854 ?auto_643856 ) ) ( not ( = ?auto_643854 ?auto_643857 ) ) ( not ( = ?auto_643854 ?auto_643858 ) ) ( not ( = ?auto_643855 ?auto_643856 ) ) ( not ( = ?auto_643855 ?auto_643857 ) ) ( not ( = ?auto_643855 ?auto_643858 ) ) ( not ( = ?auto_643856 ?auto_643857 ) ) ( not ( = ?auto_643856 ?auto_643858 ) ) ( not ( = ?auto_643857 ?auto_643858 ) ) ( ON ?auto_643856 ?auto_643857 ) ( ON ?auto_643855 ?auto_643856 ) ( ON ?auto_643854 ?auto_643855 ) ( ON ?auto_643853 ?auto_643854 ) ( ON ?auto_643852 ?auto_643853 ) ( ON ?auto_643851 ?auto_643852 ) ( ON ?auto_643850 ?auto_643851 ) ( ON ?auto_643849 ?auto_643850 ) ( CLEAR ?auto_643849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_643849 )
      ( MAKE-9PILE ?auto_643849 ?auto_643850 ?auto_643851 ?auto_643852 ?auto_643853 ?auto_643854 ?auto_643855 ?auto_643856 ?auto_643857 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_643888 - BLOCK
      ?auto_643889 - BLOCK
      ?auto_643890 - BLOCK
      ?auto_643891 - BLOCK
      ?auto_643892 - BLOCK
      ?auto_643893 - BLOCK
      ?auto_643894 - BLOCK
      ?auto_643895 - BLOCK
      ?auto_643896 - BLOCK
      ?auto_643897 - BLOCK
    )
    :vars
    (
      ?auto_643898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_643896 ) ( ON ?auto_643897 ?auto_643898 ) ( CLEAR ?auto_643897 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_643888 ) ( ON ?auto_643889 ?auto_643888 ) ( ON ?auto_643890 ?auto_643889 ) ( ON ?auto_643891 ?auto_643890 ) ( ON ?auto_643892 ?auto_643891 ) ( ON ?auto_643893 ?auto_643892 ) ( ON ?auto_643894 ?auto_643893 ) ( ON ?auto_643895 ?auto_643894 ) ( ON ?auto_643896 ?auto_643895 ) ( not ( = ?auto_643888 ?auto_643889 ) ) ( not ( = ?auto_643888 ?auto_643890 ) ) ( not ( = ?auto_643888 ?auto_643891 ) ) ( not ( = ?auto_643888 ?auto_643892 ) ) ( not ( = ?auto_643888 ?auto_643893 ) ) ( not ( = ?auto_643888 ?auto_643894 ) ) ( not ( = ?auto_643888 ?auto_643895 ) ) ( not ( = ?auto_643888 ?auto_643896 ) ) ( not ( = ?auto_643888 ?auto_643897 ) ) ( not ( = ?auto_643888 ?auto_643898 ) ) ( not ( = ?auto_643889 ?auto_643890 ) ) ( not ( = ?auto_643889 ?auto_643891 ) ) ( not ( = ?auto_643889 ?auto_643892 ) ) ( not ( = ?auto_643889 ?auto_643893 ) ) ( not ( = ?auto_643889 ?auto_643894 ) ) ( not ( = ?auto_643889 ?auto_643895 ) ) ( not ( = ?auto_643889 ?auto_643896 ) ) ( not ( = ?auto_643889 ?auto_643897 ) ) ( not ( = ?auto_643889 ?auto_643898 ) ) ( not ( = ?auto_643890 ?auto_643891 ) ) ( not ( = ?auto_643890 ?auto_643892 ) ) ( not ( = ?auto_643890 ?auto_643893 ) ) ( not ( = ?auto_643890 ?auto_643894 ) ) ( not ( = ?auto_643890 ?auto_643895 ) ) ( not ( = ?auto_643890 ?auto_643896 ) ) ( not ( = ?auto_643890 ?auto_643897 ) ) ( not ( = ?auto_643890 ?auto_643898 ) ) ( not ( = ?auto_643891 ?auto_643892 ) ) ( not ( = ?auto_643891 ?auto_643893 ) ) ( not ( = ?auto_643891 ?auto_643894 ) ) ( not ( = ?auto_643891 ?auto_643895 ) ) ( not ( = ?auto_643891 ?auto_643896 ) ) ( not ( = ?auto_643891 ?auto_643897 ) ) ( not ( = ?auto_643891 ?auto_643898 ) ) ( not ( = ?auto_643892 ?auto_643893 ) ) ( not ( = ?auto_643892 ?auto_643894 ) ) ( not ( = ?auto_643892 ?auto_643895 ) ) ( not ( = ?auto_643892 ?auto_643896 ) ) ( not ( = ?auto_643892 ?auto_643897 ) ) ( not ( = ?auto_643892 ?auto_643898 ) ) ( not ( = ?auto_643893 ?auto_643894 ) ) ( not ( = ?auto_643893 ?auto_643895 ) ) ( not ( = ?auto_643893 ?auto_643896 ) ) ( not ( = ?auto_643893 ?auto_643897 ) ) ( not ( = ?auto_643893 ?auto_643898 ) ) ( not ( = ?auto_643894 ?auto_643895 ) ) ( not ( = ?auto_643894 ?auto_643896 ) ) ( not ( = ?auto_643894 ?auto_643897 ) ) ( not ( = ?auto_643894 ?auto_643898 ) ) ( not ( = ?auto_643895 ?auto_643896 ) ) ( not ( = ?auto_643895 ?auto_643897 ) ) ( not ( = ?auto_643895 ?auto_643898 ) ) ( not ( = ?auto_643896 ?auto_643897 ) ) ( not ( = ?auto_643896 ?auto_643898 ) ) ( not ( = ?auto_643897 ?auto_643898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_643897 ?auto_643898 )
      ( !STACK ?auto_643897 ?auto_643896 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_643930 - BLOCK
      ?auto_643931 - BLOCK
      ?auto_643932 - BLOCK
      ?auto_643933 - BLOCK
      ?auto_643934 - BLOCK
      ?auto_643935 - BLOCK
      ?auto_643936 - BLOCK
      ?auto_643937 - BLOCK
      ?auto_643938 - BLOCK
      ?auto_643939 - BLOCK
    )
    :vars
    (
      ?auto_643940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643939 ?auto_643940 ) ( ON-TABLE ?auto_643930 ) ( ON ?auto_643931 ?auto_643930 ) ( ON ?auto_643932 ?auto_643931 ) ( ON ?auto_643933 ?auto_643932 ) ( ON ?auto_643934 ?auto_643933 ) ( ON ?auto_643935 ?auto_643934 ) ( ON ?auto_643936 ?auto_643935 ) ( ON ?auto_643937 ?auto_643936 ) ( not ( = ?auto_643930 ?auto_643931 ) ) ( not ( = ?auto_643930 ?auto_643932 ) ) ( not ( = ?auto_643930 ?auto_643933 ) ) ( not ( = ?auto_643930 ?auto_643934 ) ) ( not ( = ?auto_643930 ?auto_643935 ) ) ( not ( = ?auto_643930 ?auto_643936 ) ) ( not ( = ?auto_643930 ?auto_643937 ) ) ( not ( = ?auto_643930 ?auto_643938 ) ) ( not ( = ?auto_643930 ?auto_643939 ) ) ( not ( = ?auto_643930 ?auto_643940 ) ) ( not ( = ?auto_643931 ?auto_643932 ) ) ( not ( = ?auto_643931 ?auto_643933 ) ) ( not ( = ?auto_643931 ?auto_643934 ) ) ( not ( = ?auto_643931 ?auto_643935 ) ) ( not ( = ?auto_643931 ?auto_643936 ) ) ( not ( = ?auto_643931 ?auto_643937 ) ) ( not ( = ?auto_643931 ?auto_643938 ) ) ( not ( = ?auto_643931 ?auto_643939 ) ) ( not ( = ?auto_643931 ?auto_643940 ) ) ( not ( = ?auto_643932 ?auto_643933 ) ) ( not ( = ?auto_643932 ?auto_643934 ) ) ( not ( = ?auto_643932 ?auto_643935 ) ) ( not ( = ?auto_643932 ?auto_643936 ) ) ( not ( = ?auto_643932 ?auto_643937 ) ) ( not ( = ?auto_643932 ?auto_643938 ) ) ( not ( = ?auto_643932 ?auto_643939 ) ) ( not ( = ?auto_643932 ?auto_643940 ) ) ( not ( = ?auto_643933 ?auto_643934 ) ) ( not ( = ?auto_643933 ?auto_643935 ) ) ( not ( = ?auto_643933 ?auto_643936 ) ) ( not ( = ?auto_643933 ?auto_643937 ) ) ( not ( = ?auto_643933 ?auto_643938 ) ) ( not ( = ?auto_643933 ?auto_643939 ) ) ( not ( = ?auto_643933 ?auto_643940 ) ) ( not ( = ?auto_643934 ?auto_643935 ) ) ( not ( = ?auto_643934 ?auto_643936 ) ) ( not ( = ?auto_643934 ?auto_643937 ) ) ( not ( = ?auto_643934 ?auto_643938 ) ) ( not ( = ?auto_643934 ?auto_643939 ) ) ( not ( = ?auto_643934 ?auto_643940 ) ) ( not ( = ?auto_643935 ?auto_643936 ) ) ( not ( = ?auto_643935 ?auto_643937 ) ) ( not ( = ?auto_643935 ?auto_643938 ) ) ( not ( = ?auto_643935 ?auto_643939 ) ) ( not ( = ?auto_643935 ?auto_643940 ) ) ( not ( = ?auto_643936 ?auto_643937 ) ) ( not ( = ?auto_643936 ?auto_643938 ) ) ( not ( = ?auto_643936 ?auto_643939 ) ) ( not ( = ?auto_643936 ?auto_643940 ) ) ( not ( = ?auto_643937 ?auto_643938 ) ) ( not ( = ?auto_643937 ?auto_643939 ) ) ( not ( = ?auto_643937 ?auto_643940 ) ) ( not ( = ?auto_643938 ?auto_643939 ) ) ( not ( = ?auto_643938 ?auto_643940 ) ) ( not ( = ?auto_643939 ?auto_643940 ) ) ( CLEAR ?auto_643937 ) ( ON ?auto_643938 ?auto_643939 ) ( CLEAR ?auto_643938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_643930 ?auto_643931 ?auto_643932 ?auto_643933 ?auto_643934 ?auto_643935 ?auto_643936 ?auto_643937 ?auto_643938 )
      ( MAKE-10PILE ?auto_643930 ?auto_643931 ?auto_643932 ?auto_643933 ?auto_643934 ?auto_643935 ?auto_643936 ?auto_643937 ?auto_643938 ?auto_643939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_643972 - BLOCK
      ?auto_643973 - BLOCK
      ?auto_643974 - BLOCK
      ?auto_643975 - BLOCK
      ?auto_643976 - BLOCK
      ?auto_643977 - BLOCK
      ?auto_643978 - BLOCK
      ?auto_643979 - BLOCK
      ?auto_643980 - BLOCK
      ?auto_643981 - BLOCK
    )
    :vars
    (
      ?auto_643982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_643981 ?auto_643982 ) ( ON-TABLE ?auto_643972 ) ( ON ?auto_643973 ?auto_643972 ) ( ON ?auto_643974 ?auto_643973 ) ( ON ?auto_643975 ?auto_643974 ) ( ON ?auto_643976 ?auto_643975 ) ( ON ?auto_643977 ?auto_643976 ) ( ON ?auto_643978 ?auto_643977 ) ( not ( = ?auto_643972 ?auto_643973 ) ) ( not ( = ?auto_643972 ?auto_643974 ) ) ( not ( = ?auto_643972 ?auto_643975 ) ) ( not ( = ?auto_643972 ?auto_643976 ) ) ( not ( = ?auto_643972 ?auto_643977 ) ) ( not ( = ?auto_643972 ?auto_643978 ) ) ( not ( = ?auto_643972 ?auto_643979 ) ) ( not ( = ?auto_643972 ?auto_643980 ) ) ( not ( = ?auto_643972 ?auto_643981 ) ) ( not ( = ?auto_643972 ?auto_643982 ) ) ( not ( = ?auto_643973 ?auto_643974 ) ) ( not ( = ?auto_643973 ?auto_643975 ) ) ( not ( = ?auto_643973 ?auto_643976 ) ) ( not ( = ?auto_643973 ?auto_643977 ) ) ( not ( = ?auto_643973 ?auto_643978 ) ) ( not ( = ?auto_643973 ?auto_643979 ) ) ( not ( = ?auto_643973 ?auto_643980 ) ) ( not ( = ?auto_643973 ?auto_643981 ) ) ( not ( = ?auto_643973 ?auto_643982 ) ) ( not ( = ?auto_643974 ?auto_643975 ) ) ( not ( = ?auto_643974 ?auto_643976 ) ) ( not ( = ?auto_643974 ?auto_643977 ) ) ( not ( = ?auto_643974 ?auto_643978 ) ) ( not ( = ?auto_643974 ?auto_643979 ) ) ( not ( = ?auto_643974 ?auto_643980 ) ) ( not ( = ?auto_643974 ?auto_643981 ) ) ( not ( = ?auto_643974 ?auto_643982 ) ) ( not ( = ?auto_643975 ?auto_643976 ) ) ( not ( = ?auto_643975 ?auto_643977 ) ) ( not ( = ?auto_643975 ?auto_643978 ) ) ( not ( = ?auto_643975 ?auto_643979 ) ) ( not ( = ?auto_643975 ?auto_643980 ) ) ( not ( = ?auto_643975 ?auto_643981 ) ) ( not ( = ?auto_643975 ?auto_643982 ) ) ( not ( = ?auto_643976 ?auto_643977 ) ) ( not ( = ?auto_643976 ?auto_643978 ) ) ( not ( = ?auto_643976 ?auto_643979 ) ) ( not ( = ?auto_643976 ?auto_643980 ) ) ( not ( = ?auto_643976 ?auto_643981 ) ) ( not ( = ?auto_643976 ?auto_643982 ) ) ( not ( = ?auto_643977 ?auto_643978 ) ) ( not ( = ?auto_643977 ?auto_643979 ) ) ( not ( = ?auto_643977 ?auto_643980 ) ) ( not ( = ?auto_643977 ?auto_643981 ) ) ( not ( = ?auto_643977 ?auto_643982 ) ) ( not ( = ?auto_643978 ?auto_643979 ) ) ( not ( = ?auto_643978 ?auto_643980 ) ) ( not ( = ?auto_643978 ?auto_643981 ) ) ( not ( = ?auto_643978 ?auto_643982 ) ) ( not ( = ?auto_643979 ?auto_643980 ) ) ( not ( = ?auto_643979 ?auto_643981 ) ) ( not ( = ?auto_643979 ?auto_643982 ) ) ( not ( = ?auto_643980 ?auto_643981 ) ) ( not ( = ?auto_643980 ?auto_643982 ) ) ( not ( = ?auto_643981 ?auto_643982 ) ) ( ON ?auto_643980 ?auto_643981 ) ( CLEAR ?auto_643978 ) ( ON ?auto_643979 ?auto_643980 ) ( CLEAR ?auto_643979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_643972 ?auto_643973 ?auto_643974 ?auto_643975 ?auto_643976 ?auto_643977 ?auto_643978 ?auto_643979 )
      ( MAKE-10PILE ?auto_643972 ?auto_643973 ?auto_643974 ?auto_643975 ?auto_643976 ?auto_643977 ?auto_643978 ?auto_643979 ?auto_643980 ?auto_643981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644014 - BLOCK
      ?auto_644015 - BLOCK
      ?auto_644016 - BLOCK
      ?auto_644017 - BLOCK
      ?auto_644018 - BLOCK
      ?auto_644019 - BLOCK
      ?auto_644020 - BLOCK
      ?auto_644021 - BLOCK
      ?auto_644022 - BLOCK
      ?auto_644023 - BLOCK
    )
    :vars
    (
      ?auto_644024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644023 ?auto_644024 ) ( ON-TABLE ?auto_644014 ) ( ON ?auto_644015 ?auto_644014 ) ( ON ?auto_644016 ?auto_644015 ) ( ON ?auto_644017 ?auto_644016 ) ( ON ?auto_644018 ?auto_644017 ) ( ON ?auto_644019 ?auto_644018 ) ( not ( = ?auto_644014 ?auto_644015 ) ) ( not ( = ?auto_644014 ?auto_644016 ) ) ( not ( = ?auto_644014 ?auto_644017 ) ) ( not ( = ?auto_644014 ?auto_644018 ) ) ( not ( = ?auto_644014 ?auto_644019 ) ) ( not ( = ?auto_644014 ?auto_644020 ) ) ( not ( = ?auto_644014 ?auto_644021 ) ) ( not ( = ?auto_644014 ?auto_644022 ) ) ( not ( = ?auto_644014 ?auto_644023 ) ) ( not ( = ?auto_644014 ?auto_644024 ) ) ( not ( = ?auto_644015 ?auto_644016 ) ) ( not ( = ?auto_644015 ?auto_644017 ) ) ( not ( = ?auto_644015 ?auto_644018 ) ) ( not ( = ?auto_644015 ?auto_644019 ) ) ( not ( = ?auto_644015 ?auto_644020 ) ) ( not ( = ?auto_644015 ?auto_644021 ) ) ( not ( = ?auto_644015 ?auto_644022 ) ) ( not ( = ?auto_644015 ?auto_644023 ) ) ( not ( = ?auto_644015 ?auto_644024 ) ) ( not ( = ?auto_644016 ?auto_644017 ) ) ( not ( = ?auto_644016 ?auto_644018 ) ) ( not ( = ?auto_644016 ?auto_644019 ) ) ( not ( = ?auto_644016 ?auto_644020 ) ) ( not ( = ?auto_644016 ?auto_644021 ) ) ( not ( = ?auto_644016 ?auto_644022 ) ) ( not ( = ?auto_644016 ?auto_644023 ) ) ( not ( = ?auto_644016 ?auto_644024 ) ) ( not ( = ?auto_644017 ?auto_644018 ) ) ( not ( = ?auto_644017 ?auto_644019 ) ) ( not ( = ?auto_644017 ?auto_644020 ) ) ( not ( = ?auto_644017 ?auto_644021 ) ) ( not ( = ?auto_644017 ?auto_644022 ) ) ( not ( = ?auto_644017 ?auto_644023 ) ) ( not ( = ?auto_644017 ?auto_644024 ) ) ( not ( = ?auto_644018 ?auto_644019 ) ) ( not ( = ?auto_644018 ?auto_644020 ) ) ( not ( = ?auto_644018 ?auto_644021 ) ) ( not ( = ?auto_644018 ?auto_644022 ) ) ( not ( = ?auto_644018 ?auto_644023 ) ) ( not ( = ?auto_644018 ?auto_644024 ) ) ( not ( = ?auto_644019 ?auto_644020 ) ) ( not ( = ?auto_644019 ?auto_644021 ) ) ( not ( = ?auto_644019 ?auto_644022 ) ) ( not ( = ?auto_644019 ?auto_644023 ) ) ( not ( = ?auto_644019 ?auto_644024 ) ) ( not ( = ?auto_644020 ?auto_644021 ) ) ( not ( = ?auto_644020 ?auto_644022 ) ) ( not ( = ?auto_644020 ?auto_644023 ) ) ( not ( = ?auto_644020 ?auto_644024 ) ) ( not ( = ?auto_644021 ?auto_644022 ) ) ( not ( = ?auto_644021 ?auto_644023 ) ) ( not ( = ?auto_644021 ?auto_644024 ) ) ( not ( = ?auto_644022 ?auto_644023 ) ) ( not ( = ?auto_644022 ?auto_644024 ) ) ( not ( = ?auto_644023 ?auto_644024 ) ) ( ON ?auto_644022 ?auto_644023 ) ( ON ?auto_644021 ?auto_644022 ) ( CLEAR ?auto_644019 ) ( ON ?auto_644020 ?auto_644021 ) ( CLEAR ?auto_644020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_644014 ?auto_644015 ?auto_644016 ?auto_644017 ?auto_644018 ?auto_644019 ?auto_644020 )
      ( MAKE-10PILE ?auto_644014 ?auto_644015 ?auto_644016 ?auto_644017 ?auto_644018 ?auto_644019 ?auto_644020 ?auto_644021 ?auto_644022 ?auto_644023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644056 - BLOCK
      ?auto_644057 - BLOCK
      ?auto_644058 - BLOCK
      ?auto_644059 - BLOCK
      ?auto_644060 - BLOCK
      ?auto_644061 - BLOCK
      ?auto_644062 - BLOCK
      ?auto_644063 - BLOCK
      ?auto_644064 - BLOCK
      ?auto_644065 - BLOCK
    )
    :vars
    (
      ?auto_644066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644065 ?auto_644066 ) ( ON-TABLE ?auto_644056 ) ( ON ?auto_644057 ?auto_644056 ) ( ON ?auto_644058 ?auto_644057 ) ( ON ?auto_644059 ?auto_644058 ) ( ON ?auto_644060 ?auto_644059 ) ( not ( = ?auto_644056 ?auto_644057 ) ) ( not ( = ?auto_644056 ?auto_644058 ) ) ( not ( = ?auto_644056 ?auto_644059 ) ) ( not ( = ?auto_644056 ?auto_644060 ) ) ( not ( = ?auto_644056 ?auto_644061 ) ) ( not ( = ?auto_644056 ?auto_644062 ) ) ( not ( = ?auto_644056 ?auto_644063 ) ) ( not ( = ?auto_644056 ?auto_644064 ) ) ( not ( = ?auto_644056 ?auto_644065 ) ) ( not ( = ?auto_644056 ?auto_644066 ) ) ( not ( = ?auto_644057 ?auto_644058 ) ) ( not ( = ?auto_644057 ?auto_644059 ) ) ( not ( = ?auto_644057 ?auto_644060 ) ) ( not ( = ?auto_644057 ?auto_644061 ) ) ( not ( = ?auto_644057 ?auto_644062 ) ) ( not ( = ?auto_644057 ?auto_644063 ) ) ( not ( = ?auto_644057 ?auto_644064 ) ) ( not ( = ?auto_644057 ?auto_644065 ) ) ( not ( = ?auto_644057 ?auto_644066 ) ) ( not ( = ?auto_644058 ?auto_644059 ) ) ( not ( = ?auto_644058 ?auto_644060 ) ) ( not ( = ?auto_644058 ?auto_644061 ) ) ( not ( = ?auto_644058 ?auto_644062 ) ) ( not ( = ?auto_644058 ?auto_644063 ) ) ( not ( = ?auto_644058 ?auto_644064 ) ) ( not ( = ?auto_644058 ?auto_644065 ) ) ( not ( = ?auto_644058 ?auto_644066 ) ) ( not ( = ?auto_644059 ?auto_644060 ) ) ( not ( = ?auto_644059 ?auto_644061 ) ) ( not ( = ?auto_644059 ?auto_644062 ) ) ( not ( = ?auto_644059 ?auto_644063 ) ) ( not ( = ?auto_644059 ?auto_644064 ) ) ( not ( = ?auto_644059 ?auto_644065 ) ) ( not ( = ?auto_644059 ?auto_644066 ) ) ( not ( = ?auto_644060 ?auto_644061 ) ) ( not ( = ?auto_644060 ?auto_644062 ) ) ( not ( = ?auto_644060 ?auto_644063 ) ) ( not ( = ?auto_644060 ?auto_644064 ) ) ( not ( = ?auto_644060 ?auto_644065 ) ) ( not ( = ?auto_644060 ?auto_644066 ) ) ( not ( = ?auto_644061 ?auto_644062 ) ) ( not ( = ?auto_644061 ?auto_644063 ) ) ( not ( = ?auto_644061 ?auto_644064 ) ) ( not ( = ?auto_644061 ?auto_644065 ) ) ( not ( = ?auto_644061 ?auto_644066 ) ) ( not ( = ?auto_644062 ?auto_644063 ) ) ( not ( = ?auto_644062 ?auto_644064 ) ) ( not ( = ?auto_644062 ?auto_644065 ) ) ( not ( = ?auto_644062 ?auto_644066 ) ) ( not ( = ?auto_644063 ?auto_644064 ) ) ( not ( = ?auto_644063 ?auto_644065 ) ) ( not ( = ?auto_644063 ?auto_644066 ) ) ( not ( = ?auto_644064 ?auto_644065 ) ) ( not ( = ?auto_644064 ?auto_644066 ) ) ( not ( = ?auto_644065 ?auto_644066 ) ) ( ON ?auto_644064 ?auto_644065 ) ( ON ?auto_644063 ?auto_644064 ) ( ON ?auto_644062 ?auto_644063 ) ( CLEAR ?auto_644060 ) ( ON ?auto_644061 ?auto_644062 ) ( CLEAR ?auto_644061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_644056 ?auto_644057 ?auto_644058 ?auto_644059 ?auto_644060 ?auto_644061 )
      ( MAKE-10PILE ?auto_644056 ?auto_644057 ?auto_644058 ?auto_644059 ?auto_644060 ?auto_644061 ?auto_644062 ?auto_644063 ?auto_644064 ?auto_644065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644098 - BLOCK
      ?auto_644099 - BLOCK
      ?auto_644100 - BLOCK
      ?auto_644101 - BLOCK
      ?auto_644102 - BLOCK
      ?auto_644103 - BLOCK
      ?auto_644104 - BLOCK
      ?auto_644105 - BLOCK
      ?auto_644106 - BLOCK
      ?auto_644107 - BLOCK
    )
    :vars
    (
      ?auto_644108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644107 ?auto_644108 ) ( ON-TABLE ?auto_644098 ) ( ON ?auto_644099 ?auto_644098 ) ( ON ?auto_644100 ?auto_644099 ) ( ON ?auto_644101 ?auto_644100 ) ( not ( = ?auto_644098 ?auto_644099 ) ) ( not ( = ?auto_644098 ?auto_644100 ) ) ( not ( = ?auto_644098 ?auto_644101 ) ) ( not ( = ?auto_644098 ?auto_644102 ) ) ( not ( = ?auto_644098 ?auto_644103 ) ) ( not ( = ?auto_644098 ?auto_644104 ) ) ( not ( = ?auto_644098 ?auto_644105 ) ) ( not ( = ?auto_644098 ?auto_644106 ) ) ( not ( = ?auto_644098 ?auto_644107 ) ) ( not ( = ?auto_644098 ?auto_644108 ) ) ( not ( = ?auto_644099 ?auto_644100 ) ) ( not ( = ?auto_644099 ?auto_644101 ) ) ( not ( = ?auto_644099 ?auto_644102 ) ) ( not ( = ?auto_644099 ?auto_644103 ) ) ( not ( = ?auto_644099 ?auto_644104 ) ) ( not ( = ?auto_644099 ?auto_644105 ) ) ( not ( = ?auto_644099 ?auto_644106 ) ) ( not ( = ?auto_644099 ?auto_644107 ) ) ( not ( = ?auto_644099 ?auto_644108 ) ) ( not ( = ?auto_644100 ?auto_644101 ) ) ( not ( = ?auto_644100 ?auto_644102 ) ) ( not ( = ?auto_644100 ?auto_644103 ) ) ( not ( = ?auto_644100 ?auto_644104 ) ) ( not ( = ?auto_644100 ?auto_644105 ) ) ( not ( = ?auto_644100 ?auto_644106 ) ) ( not ( = ?auto_644100 ?auto_644107 ) ) ( not ( = ?auto_644100 ?auto_644108 ) ) ( not ( = ?auto_644101 ?auto_644102 ) ) ( not ( = ?auto_644101 ?auto_644103 ) ) ( not ( = ?auto_644101 ?auto_644104 ) ) ( not ( = ?auto_644101 ?auto_644105 ) ) ( not ( = ?auto_644101 ?auto_644106 ) ) ( not ( = ?auto_644101 ?auto_644107 ) ) ( not ( = ?auto_644101 ?auto_644108 ) ) ( not ( = ?auto_644102 ?auto_644103 ) ) ( not ( = ?auto_644102 ?auto_644104 ) ) ( not ( = ?auto_644102 ?auto_644105 ) ) ( not ( = ?auto_644102 ?auto_644106 ) ) ( not ( = ?auto_644102 ?auto_644107 ) ) ( not ( = ?auto_644102 ?auto_644108 ) ) ( not ( = ?auto_644103 ?auto_644104 ) ) ( not ( = ?auto_644103 ?auto_644105 ) ) ( not ( = ?auto_644103 ?auto_644106 ) ) ( not ( = ?auto_644103 ?auto_644107 ) ) ( not ( = ?auto_644103 ?auto_644108 ) ) ( not ( = ?auto_644104 ?auto_644105 ) ) ( not ( = ?auto_644104 ?auto_644106 ) ) ( not ( = ?auto_644104 ?auto_644107 ) ) ( not ( = ?auto_644104 ?auto_644108 ) ) ( not ( = ?auto_644105 ?auto_644106 ) ) ( not ( = ?auto_644105 ?auto_644107 ) ) ( not ( = ?auto_644105 ?auto_644108 ) ) ( not ( = ?auto_644106 ?auto_644107 ) ) ( not ( = ?auto_644106 ?auto_644108 ) ) ( not ( = ?auto_644107 ?auto_644108 ) ) ( ON ?auto_644106 ?auto_644107 ) ( ON ?auto_644105 ?auto_644106 ) ( ON ?auto_644104 ?auto_644105 ) ( ON ?auto_644103 ?auto_644104 ) ( CLEAR ?auto_644101 ) ( ON ?auto_644102 ?auto_644103 ) ( CLEAR ?auto_644102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_644098 ?auto_644099 ?auto_644100 ?auto_644101 ?auto_644102 )
      ( MAKE-10PILE ?auto_644098 ?auto_644099 ?auto_644100 ?auto_644101 ?auto_644102 ?auto_644103 ?auto_644104 ?auto_644105 ?auto_644106 ?auto_644107 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644140 - BLOCK
      ?auto_644141 - BLOCK
      ?auto_644142 - BLOCK
      ?auto_644143 - BLOCK
      ?auto_644144 - BLOCK
      ?auto_644145 - BLOCK
      ?auto_644146 - BLOCK
      ?auto_644147 - BLOCK
      ?auto_644148 - BLOCK
      ?auto_644149 - BLOCK
    )
    :vars
    (
      ?auto_644150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644149 ?auto_644150 ) ( ON-TABLE ?auto_644140 ) ( ON ?auto_644141 ?auto_644140 ) ( ON ?auto_644142 ?auto_644141 ) ( not ( = ?auto_644140 ?auto_644141 ) ) ( not ( = ?auto_644140 ?auto_644142 ) ) ( not ( = ?auto_644140 ?auto_644143 ) ) ( not ( = ?auto_644140 ?auto_644144 ) ) ( not ( = ?auto_644140 ?auto_644145 ) ) ( not ( = ?auto_644140 ?auto_644146 ) ) ( not ( = ?auto_644140 ?auto_644147 ) ) ( not ( = ?auto_644140 ?auto_644148 ) ) ( not ( = ?auto_644140 ?auto_644149 ) ) ( not ( = ?auto_644140 ?auto_644150 ) ) ( not ( = ?auto_644141 ?auto_644142 ) ) ( not ( = ?auto_644141 ?auto_644143 ) ) ( not ( = ?auto_644141 ?auto_644144 ) ) ( not ( = ?auto_644141 ?auto_644145 ) ) ( not ( = ?auto_644141 ?auto_644146 ) ) ( not ( = ?auto_644141 ?auto_644147 ) ) ( not ( = ?auto_644141 ?auto_644148 ) ) ( not ( = ?auto_644141 ?auto_644149 ) ) ( not ( = ?auto_644141 ?auto_644150 ) ) ( not ( = ?auto_644142 ?auto_644143 ) ) ( not ( = ?auto_644142 ?auto_644144 ) ) ( not ( = ?auto_644142 ?auto_644145 ) ) ( not ( = ?auto_644142 ?auto_644146 ) ) ( not ( = ?auto_644142 ?auto_644147 ) ) ( not ( = ?auto_644142 ?auto_644148 ) ) ( not ( = ?auto_644142 ?auto_644149 ) ) ( not ( = ?auto_644142 ?auto_644150 ) ) ( not ( = ?auto_644143 ?auto_644144 ) ) ( not ( = ?auto_644143 ?auto_644145 ) ) ( not ( = ?auto_644143 ?auto_644146 ) ) ( not ( = ?auto_644143 ?auto_644147 ) ) ( not ( = ?auto_644143 ?auto_644148 ) ) ( not ( = ?auto_644143 ?auto_644149 ) ) ( not ( = ?auto_644143 ?auto_644150 ) ) ( not ( = ?auto_644144 ?auto_644145 ) ) ( not ( = ?auto_644144 ?auto_644146 ) ) ( not ( = ?auto_644144 ?auto_644147 ) ) ( not ( = ?auto_644144 ?auto_644148 ) ) ( not ( = ?auto_644144 ?auto_644149 ) ) ( not ( = ?auto_644144 ?auto_644150 ) ) ( not ( = ?auto_644145 ?auto_644146 ) ) ( not ( = ?auto_644145 ?auto_644147 ) ) ( not ( = ?auto_644145 ?auto_644148 ) ) ( not ( = ?auto_644145 ?auto_644149 ) ) ( not ( = ?auto_644145 ?auto_644150 ) ) ( not ( = ?auto_644146 ?auto_644147 ) ) ( not ( = ?auto_644146 ?auto_644148 ) ) ( not ( = ?auto_644146 ?auto_644149 ) ) ( not ( = ?auto_644146 ?auto_644150 ) ) ( not ( = ?auto_644147 ?auto_644148 ) ) ( not ( = ?auto_644147 ?auto_644149 ) ) ( not ( = ?auto_644147 ?auto_644150 ) ) ( not ( = ?auto_644148 ?auto_644149 ) ) ( not ( = ?auto_644148 ?auto_644150 ) ) ( not ( = ?auto_644149 ?auto_644150 ) ) ( ON ?auto_644148 ?auto_644149 ) ( ON ?auto_644147 ?auto_644148 ) ( ON ?auto_644146 ?auto_644147 ) ( ON ?auto_644145 ?auto_644146 ) ( ON ?auto_644144 ?auto_644145 ) ( CLEAR ?auto_644142 ) ( ON ?auto_644143 ?auto_644144 ) ( CLEAR ?auto_644143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_644140 ?auto_644141 ?auto_644142 ?auto_644143 )
      ( MAKE-10PILE ?auto_644140 ?auto_644141 ?auto_644142 ?auto_644143 ?auto_644144 ?auto_644145 ?auto_644146 ?auto_644147 ?auto_644148 ?auto_644149 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644182 - BLOCK
      ?auto_644183 - BLOCK
      ?auto_644184 - BLOCK
      ?auto_644185 - BLOCK
      ?auto_644186 - BLOCK
      ?auto_644187 - BLOCK
      ?auto_644188 - BLOCK
      ?auto_644189 - BLOCK
      ?auto_644190 - BLOCK
      ?auto_644191 - BLOCK
    )
    :vars
    (
      ?auto_644192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644191 ?auto_644192 ) ( ON-TABLE ?auto_644182 ) ( ON ?auto_644183 ?auto_644182 ) ( not ( = ?auto_644182 ?auto_644183 ) ) ( not ( = ?auto_644182 ?auto_644184 ) ) ( not ( = ?auto_644182 ?auto_644185 ) ) ( not ( = ?auto_644182 ?auto_644186 ) ) ( not ( = ?auto_644182 ?auto_644187 ) ) ( not ( = ?auto_644182 ?auto_644188 ) ) ( not ( = ?auto_644182 ?auto_644189 ) ) ( not ( = ?auto_644182 ?auto_644190 ) ) ( not ( = ?auto_644182 ?auto_644191 ) ) ( not ( = ?auto_644182 ?auto_644192 ) ) ( not ( = ?auto_644183 ?auto_644184 ) ) ( not ( = ?auto_644183 ?auto_644185 ) ) ( not ( = ?auto_644183 ?auto_644186 ) ) ( not ( = ?auto_644183 ?auto_644187 ) ) ( not ( = ?auto_644183 ?auto_644188 ) ) ( not ( = ?auto_644183 ?auto_644189 ) ) ( not ( = ?auto_644183 ?auto_644190 ) ) ( not ( = ?auto_644183 ?auto_644191 ) ) ( not ( = ?auto_644183 ?auto_644192 ) ) ( not ( = ?auto_644184 ?auto_644185 ) ) ( not ( = ?auto_644184 ?auto_644186 ) ) ( not ( = ?auto_644184 ?auto_644187 ) ) ( not ( = ?auto_644184 ?auto_644188 ) ) ( not ( = ?auto_644184 ?auto_644189 ) ) ( not ( = ?auto_644184 ?auto_644190 ) ) ( not ( = ?auto_644184 ?auto_644191 ) ) ( not ( = ?auto_644184 ?auto_644192 ) ) ( not ( = ?auto_644185 ?auto_644186 ) ) ( not ( = ?auto_644185 ?auto_644187 ) ) ( not ( = ?auto_644185 ?auto_644188 ) ) ( not ( = ?auto_644185 ?auto_644189 ) ) ( not ( = ?auto_644185 ?auto_644190 ) ) ( not ( = ?auto_644185 ?auto_644191 ) ) ( not ( = ?auto_644185 ?auto_644192 ) ) ( not ( = ?auto_644186 ?auto_644187 ) ) ( not ( = ?auto_644186 ?auto_644188 ) ) ( not ( = ?auto_644186 ?auto_644189 ) ) ( not ( = ?auto_644186 ?auto_644190 ) ) ( not ( = ?auto_644186 ?auto_644191 ) ) ( not ( = ?auto_644186 ?auto_644192 ) ) ( not ( = ?auto_644187 ?auto_644188 ) ) ( not ( = ?auto_644187 ?auto_644189 ) ) ( not ( = ?auto_644187 ?auto_644190 ) ) ( not ( = ?auto_644187 ?auto_644191 ) ) ( not ( = ?auto_644187 ?auto_644192 ) ) ( not ( = ?auto_644188 ?auto_644189 ) ) ( not ( = ?auto_644188 ?auto_644190 ) ) ( not ( = ?auto_644188 ?auto_644191 ) ) ( not ( = ?auto_644188 ?auto_644192 ) ) ( not ( = ?auto_644189 ?auto_644190 ) ) ( not ( = ?auto_644189 ?auto_644191 ) ) ( not ( = ?auto_644189 ?auto_644192 ) ) ( not ( = ?auto_644190 ?auto_644191 ) ) ( not ( = ?auto_644190 ?auto_644192 ) ) ( not ( = ?auto_644191 ?auto_644192 ) ) ( ON ?auto_644190 ?auto_644191 ) ( ON ?auto_644189 ?auto_644190 ) ( ON ?auto_644188 ?auto_644189 ) ( ON ?auto_644187 ?auto_644188 ) ( ON ?auto_644186 ?auto_644187 ) ( ON ?auto_644185 ?auto_644186 ) ( CLEAR ?auto_644183 ) ( ON ?auto_644184 ?auto_644185 ) ( CLEAR ?auto_644184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_644182 ?auto_644183 ?auto_644184 )
      ( MAKE-10PILE ?auto_644182 ?auto_644183 ?auto_644184 ?auto_644185 ?auto_644186 ?auto_644187 ?auto_644188 ?auto_644189 ?auto_644190 ?auto_644191 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644224 - BLOCK
      ?auto_644225 - BLOCK
      ?auto_644226 - BLOCK
      ?auto_644227 - BLOCK
      ?auto_644228 - BLOCK
      ?auto_644229 - BLOCK
      ?auto_644230 - BLOCK
      ?auto_644231 - BLOCK
      ?auto_644232 - BLOCK
      ?auto_644233 - BLOCK
    )
    :vars
    (
      ?auto_644234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644233 ?auto_644234 ) ( ON-TABLE ?auto_644224 ) ( not ( = ?auto_644224 ?auto_644225 ) ) ( not ( = ?auto_644224 ?auto_644226 ) ) ( not ( = ?auto_644224 ?auto_644227 ) ) ( not ( = ?auto_644224 ?auto_644228 ) ) ( not ( = ?auto_644224 ?auto_644229 ) ) ( not ( = ?auto_644224 ?auto_644230 ) ) ( not ( = ?auto_644224 ?auto_644231 ) ) ( not ( = ?auto_644224 ?auto_644232 ) ) ( not ( = ?auto_644224 ?auto_644233 ) ) ( not ( = ?auto_644224 ?auto_644234 ) ) ( not ( = ?auto_644225 ?auto_644226 ) ) ( not ( = ?auto_644225 ?auto_644227 ) ) ( not ( = ?auto_644225 ?auto_644228 ) ) ( not ( = ?auto_644225 ?auto_644229 ) ) ( not ( = ?auto_644225 ?auto_644230 ) ) ( not ( = ?auto_644225 ?auto_644231 ) ) ( not ( = ?auto_644225 ?auto_644232 ) ) ( not ( = ?auto_644225 ?auto_644233 ) ) ( not ( = ?auto_644225 ?auto_644234 ) ) ( not ( = ?auto_644226 ?auto_644227 ) ) ( not ( = ?auto_644226 ?auto_644228 ) ) ( not ( = ?auto_644226 ?auto_644229 ) ) ( not ( = ?auto_644226 ?auto_644230 ) ) ( not ( = ?auto_644226 ?auto_644231 ) ) ( not ( = ?auto_644226 ?auto_644232 ) ) ( not ( = ?auto_644226 ?auto_644233 ) ) ( not ( = ?auto_644226 ?auto_644234 ) ) ( not ( = ?auto_644227 ?auto_644228 ) ) ( not ( = ?auto_644227 ?auto_644229 ) ) ( not ( = ?auto_644227 ?auto_644230 ) ) ( not ( = ?auto_644227 ?auto_644231 ) ) ( not ( = ?auto_644227 ?auto_644232 ) ) ( not ( = ?auto_644227 ?auto_644233 ) ) ( not ( = ?auto_644227 ?auto_644234 ) ) ( not ( = ?auto_644228 ?auto_644229 ) ) ( not ( = ?auto_644228 ?auto_644230 ) ) ( not ( = ?auto_644228 ?auto_644231 ) ) ( not ( = ?auto_644228 ?auto_644232 ) ) ( not ( = ?auto_644228 ?auto_644233 ) ) ( not ( = ?auto_644228 ?auto_644234 ) ) ( not ( = ?auto_644229 ?auto_644230 ) ) ( not ( = ?auto_644229 ?auto_644231 ) ) ( not ( = ?auto_644229 ?auto_644232 ) ) ( not ( = ?auto_644229 ?auto_644233 ) ) ( not ( = ?auto_644229 ?auto_644234 ) ) ( not ( = ?auto_644230 ?auto_644231 ) ) ( not ( = ?auto_644230 ?auto_644232 ) ) ( not ( = ?auto_644230 ?auto_644233 ) ) ( not ( = ?auto_644230 ?auto_644234 ) ) ( not ( = ?auto_644231 ?auto_644232 ) ) ( not ( = ?auto_644231 ?auto_644233 ) ) ( not ( = ?auto_644231 ?auto_644234 ) ) ( not ( = ?auto_644232 ?auto_644233 ) ) ( not ( = ?auto_644232 ?auto_644234 ) ) ( not ( = ?auto_644233 ?auto_644234 ) ) ( ON ?auto_644232 ?auto_644233 ) ( ON ?auto_644231 ?auto_644232 ) ( ON ?auto_644230 ?auto_644231 ) ( ON ?auto_644229 ?auto_644230 ) ( ON ?auto_644228 ?auto_644229 ) ( ON ?auto_644227 ?auto_644228 ) ( ON ?auto_644226 ?auto_644227 ) ( CLEAR ?auto_644224 ) ( ON ?auto_644225 ?auto_644226 ) ( CLEAR ?auto_644225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_644224 ?auto_644225 )
      ( MAKE-10PILE ?auto_644224 ?auto_644225 ?auto_644226 ?auto_644227 ?auto_644228 ?auto_644229 ?auto_644230 ?auto_644231 ?auto_644232 ?auto_644233 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_644266 - BLOCK
      ?auto_644267 - BLOCK
      ?auto_644268 - BLOCK
      ?auto_644269 - BLOCK
      ?auto_644270 - BLOCK
      ?auto_644271 - BLOCK
      ?auto_644272 - BLOCK
      ?auto_644273 - BLOCK
      ?auto_644274 - BLOCK
      ?auto_644275 - BLOCK
    )
    :vars
    (
      ?auto_644276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644275 ?auto_644276 ) ( not ( = ?auto_644266 ?auto_644267 ) ) ( not ( = ?auto_644266 ?auto_644268 ) ) ( not ( = ?auto_644266 ?auto_644269 ) ) ( not ( = ?auto_644266 ?auto_644270 ) ) ( not ( = ?auto_644266 ?auto_644271 ) ) ( not ( = ?auto_644266 ?auto_644272 ) ) ( not ( = ?auto_644266 ?auto_644273 ) ) ( not ( = ?auto_644266 ?auto_644274 ) ) ( not ( = ?auto_644266 ?auto_644275 ) ) ( not ( = ?auto_644266 ?auto_644276 ) ) ( not ( = ?auto_644267 ?auto_644268 ) ) ( not ( = ?auto_644267 ?auto_644269 ) ) ( not ( = ?auto_644267 ?auto_644270 ) ) ( not ( = ?auto_644267 ?auto_644271 ) ) ( not ( = ?auto_644267 ?auto_644272 ) ) ( not ( = ?auto_644267 ?auto_644273 ) ) ( not ( = ?auto_644267 ?auto_644274 ) ) ( not ( = ?auto_644267 ?auto_644275 ) ) ( not ( = ?auto_644267 ?auto_644276 ) ) ( not ( = ?auto_644268 ?auto_644269 ) ) ( not ( = ?auto_644268 ?auto_644270 ) ) ( not ( = ?auto_644268 ?auto_644271 ) ) ( not ( = ?auto_644268 ?auto_644272 ) ) ( not ( = ?auto_644268 ?auto_644273 ) ) ( not ( = ?auto_644268 ?auto_644274 ) ) ( not ( = ?auto_644268 ?auto_644275 ) ) ( not ( = ?auto_644268 ?auto_644276 ) ) ( not ( = ?auto_644269 ?auto_644270 ) ) ( not ( = ?auto_644269 ?auto_644271 ) ) ( not ( = ?auto_644269 ?auto_644272 ) ) ( not ( = ?auto_644269 ?auto_644273 ) ) ( not ( = ?auto_644269 ?auto_644274 ) ) ( not ( = ?auto_644269 ?auto_644275 ) ) ( not ( = ?auto_644269 ?auto_644276 ) ) ( not ( = ?auto_644270 ?auto_644271 ) ) ( not ( = ?auto_644270 ?auto_644272 ) ) ( not ( = ?auto_644270 ?auto_644273 ) ) ( not ( = ?auto_644270 ?auto_644274 ) ) ( not ( = ?auto_644270 ?auto_644275 ) ) ( not ( = ?auto_644270 ?auto_644276 ) ) ( not ( = ?auto_644271 ?auto_644272 ) ) ( not ( = ?auto_644271 ?auto_644273 ) ) ( not ( = ?auto_644271 ?auto_644274 ) ) ( not ( = ?auto_644271 ?auto_644275 ) ) ( not ( = ?auto_644271 ?auto_644276 ) ) ( not ( = ?auto_644272 ?auto_644273 ) ) ( not ( = ?auto_644272 ?auto_644274 ) ) ( not ( = ?auto_644272 ?auto_644275 ) ) ( not ( = ?auto_644272 ?auto_644276 ) ) ( not ( = ?auto_644273 ?auto_644274 ) ) ( not ( = ?auto_644273 ?auto_644275 ) ) ( not ( = ?auto_644273 ?auto_644276 ) ) ( not ( = ?auto_644274 ?auto_644275 ) ) ( not ( = ?auto_644274 ?auto_644276 ) ) ( not ( = ?auto_644275 ?auto_644276 ) ) ( ON ?auto_644274 ?auto_644275 ) ( ON ?auto_644273 ?auto_644274 ) ( ON ?auto_644272 ?auto_644273 ) ( ON ?auto_644271 ?auto_644272 ) ( ON ?auto_644270 ?auto_644271 ) ( ON ?auto_644269 ?auto_644270 ) ( ON ?auto_644268 ?auto_644269 ) ( ON ?auto_644267 ?auto_644268 ) ( ON ?auto_644266 ?auto_644267 ) ( CLEAR ?auto_644266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_644266 )
      ( MAKE-10PILE ?auto_644266 ?auto_644267 ?auto_644268 ?auto_644269 ?auto_644270 ?auto_644271 ?auto_644272 ?auto_644273 ?auto_644274 ?auto_644275 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644309 - BLOCK
      ?auto_644310 - BLOCK
      ?auto_644311 - BLOCK
      ?auto_644312 - BLOCK
      ?auto_644313 - BLOCK
      ?auto_644314 - BLOCK
      ?auto_644315 - BLOCK
      ?auto_644316 - BLOCK
      ?auto_644317 - BLOCK
      ?auto_644318 - BLOCK
      ?auto_644319 - BLOCK
    )
    :vars
    (
      ?auto_644320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_644318 ) ( ON ?auto_644319 ?auto_644320 ) ( CLEAR ?auto_644319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_644309 ) ( ON ?auto_644310 ?auto_644309 ) ( ON ?auto_644311 ?auto_644310 ) ( ON ?auto_644312 ?auto_644311 ) ( ON ?auto_644313 ?auto_644312 ) ( ON ?auto_644314 ?auto_644313 ) ( ON ?auto_644315 ?auto_644314 ) ( ON ?auto_644316 ?auto_644315 ) ( ON ?auto_644317 ?auto_644316 ) ( ON ?auto_644318 ?auto_644317 ) ( not ( = ?auto_644309 ?auto_644310 ) ) ( not ( = ?auto_644309 ?auto_644311 ) ) ( not ( = ?auto_644309 ?auto_644312 ) ) ( not ( = ?auto_644309 ?auto_644313 ) ) ( not ( = ?auto_644309 ?auto_644314 ) ) ( not ( = ?auto_644309 ?auto_644315 ) ) ( not ( = ?auto_644309 ?auto_644316 ) ) ( not ( = ?auto_644309 ?auto_644317 ) ) ( not ( = ?auto_644309 ?auto_644318 ) ) ( not ( = ?auto_644309 ?auto_644319 ) ) ( not ( = ?auto_644309 ?auto_644320 ) ) ( not ( = ?auto_644310 ?auto_644311 ) ) ( not ( = ?auto_644310 ?auto_644312 ) ) ( not ( = ?auto_644310 ?auto_644313 ) ) ( not ( = ?auto_644310 ?auto_644314 ) ) ( not ( = ?auto_644310 ?auto_644315 ) ) ( not ( = ?auto_644310 ?auto_644316 ) ) ( not ( = ?auto_644310 ?auto_644317 ) ) ( not ( = ?auto_644310 ?auto_644318 ) ) ( not ( = ?auto_644310 ?auto_644319 ) ) ( not ( = ?auto_644310 ?auto_644320 ) ) ( not ( = ?auto_644311 ?auto_644312 ) ) ( not ( = ?auto_644311 ?auto_644313 ) ) ( not ( = ?auto_644311 ?auto_644314 ) ) ( not ( = ?auto_644311 ?auto_644315 ) ) ( not ( = ?auto_644311 ?auto_644316 ) ) ( not ( = ?auto_644311 ?auto_644317 ) ) ( not ( = ?auto_644311 ?auto_644318 ) ) ( not ( = ?auto_644311 ?auto_644319 ) ) ( not ( = ?auto_644311 ?auto_644320 ) ) ( not ( = ?auto_644312 ?auto_644313 ) ) ( not ( = ?auto_644312 ?auto_644314 ) ) ( not ( = ?auto_644312 ?auto_644315 ) ) ( not ( = ?auto_644312 ?auto_644316 ) ) ( not ( = ?auto_644312 ?auto_644317 ) ) ( not ( = ?auto_644312 ?auto_644318 ) ) ( not ( = ?auto_644312 ?auto_644319 ) ) ( not ( = ?auto_644312 ?auto_644320 ) ) ( not ( = ?auto_644313 ?auto_644314 ) ) ( not ( = ?auto_644313 ?auto_644315 ) ) ( not ( = ?auto_644313 ?auto_644316 ) ) ( not ( = ?auto_644313 ?auto_644317 ) ) ( not ( = ?auto_644313 ?auto_644318 ) ) ( not ( = ?auto_644313 ?auto_644319 ) ) ( not ( = ?auto_644313 ?auto_644320 ) ) ( not ( = ?auto_644314 ?auto_644315 ) ) ( not ( = ?auto_644314 ?auto_644316 ) ) ( not ( = ?auto_644314 ?auto_644317 ) ) ( not ( = ?auto_644314 ?auto_644318 ) ) ( not ( = ?auto_644314 ?auto_644319 ) ) ( not ( = ?auto_644314 ?auto_644320 ) ) ( not ( = ?auto_644315 ?auto_644316 ) ) ( not ( = ?auto_644315 ?auto_644317 ) ) ( not ( = ?auto_644315 ?auto_644318 ) ) ( not ( = ?auto_644315 ?auto_644319 ) ) ( not ( = ?auto_644315 ?auto_644320 ) ) ( not ( = ?auto_644316 ?auto_644317 ) ) ( not ( = ?auto_644316 ?auto_644318 ) ) ( not ( = ?auto_644316 ?auto_644319 ) ) ( not ( = ?auto_644316 ?auto_644320 ) ) ( not ( = ?auto_644317 ?auto_644318 ) ) ( not ( = ?auto_644317 ?auto_644319 ) ) ( not ( = ?auto_644317 ?auto_644320 ) ) ( not ( = ?auto_644318 ?auto_644319 ) ) ( not ( = ?auto_644318 ?auto_644320 ) ) ( not ( = ?auto_644319 ?auto_644320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_644319 ?auto_644320 )
      ( !STACK ?auto_644319 ?auto_644318 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644355 - BLOCK
      ?auto_644356 - BLOCK
      ?auto_644357 - BLOCK
      ?auto_644358 - BLOCK
      ?auto_644359 - BLOCK
      ?auto_644360 - BLOCK
      ?auto_644361 - BLOCK
      ?auto_644362 - BLOCK
      ?auto_644363 - BLOCK
      ?auto_644364 - BLOCK
      ?auto_644365 - BLOCK
    )
    :vars
    (
      ?auto_644366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644365 ?auto_644366 ) ( ON-TABLE ?auto_644355 ) ( ON ?auto_644356 ?auto_644355 ) ( ON ?auto_644357 ?auto_644356 ) ( ON ?auto_644358 ?auto_644357 ) ( ON ?auto_644359 ?auto_644358 ) ( ON ?auto_644360 ?auto_644359 ) ( ON ?auto_644361 ?auto_644360 ) ( ON ?auto_644362 ?auto_644361 ) ( ON ?auto_644363 ?auto_644362 ) ( not ( = ?auto_644355 ?auto_644356 ) ) ( not ( = ?auto_644355 ?auto_644357 ) ) ( not ( = ?auto_644355 ?auto_644358 ) ) ( not ( = ?auto_644355 ?auto_644359 ) ) ( not ( = ?auto_644355 ?auto_644360 ) ) ( not ( = ?auto_644355 ?auto_644361 ) ) ( not ( = ?auto_644355 ?auto_644362 ) ) ( not ( = ?auto_644355 ?auto_644363 ) ) ( not ( = ?auto_644355 ?auto_644364 ) ) ( not ( = ?auto_644355 ?auto_644365 ) ) ( not ( = ?auto_644355 ?auto_644366 ) ) ( not ( = ?auto_644356 ?auto_644357 ) ) ( not ( = ?auto_644356 ?auto_644358 ) ) ( not ( = ?auto_644356 ?auto_644359 ) ) ( not ( = ?auto_644356 ?auto_644360 ) ) ( not ( = ?auto_644356 ?auto_644361 ) ) ( not ( = ?auto_644356 ?auto_644362 ) ) ( not ( = ?auto_644356 ?auto_644363 ) ) ( not ( = ?auto_644356 ?auto_644364 ) ) ( not ( = ?auto_644356 ?auto_644365 ) ) ( not ( = ?auto_644356 ?auto_644366 ) ) ( not ( = ?auto_644357 ?auto_644358 ) ) ( not ( = ?auto_644357 ?auto_644359 ) ) ( not ( = ?auto_644357 ?auto_644360 ) ) ( not ( = ?auto_644357 ?auto_644361 ) ) ( not ( = ?auto_644357 ?auto_644362 ) ) ( not ( = ?auto_644357 ?auto_644363 ) ) ( not ( = ?auto_644357 ?auto_644364 ) ) ( not ( = ?auto_644357 ?auto_644365 ) ) ( not ( = ?auto_644357 ?auto_644366 ) ) ( not ( = ?auto_644358 ?auto_644359 ) ) ( not ( = ?auto_644358 ?auto_644360 ) ) ( not ( = ?auto_644358 ?auto_644361 ) ) ( not ( = ?auto_644358 ?auto_644362 ) ) ( not ( = ?auto_644358 ?auto_644363 ) ) ( not ( = ?auto_644358 ?auto_644364 ) ) ( not ( = ?auto_644358 ?auto_644365 ) ) ( not ( = ?auto_644358 ?auto_644366 ) ) ( not ( = ?auto_644359 ?auto_644360 ) ) ( not ( = ?auto_644359 ?auto_644361 ) ) ( not ( = ?auto_644359 ?auto_644362 ) ) ( not ( = ?auto_644359 ?auto_644363 ) ) ( not ( = ?auto_644359 ?auto_644364 ) ) ( not ( = ?auto_644359 ?auto_644365 ) ) ( not ( = ?auto_644359 ?auto_644366 ) ) ( not ( = ?auto_644360 ?auto_644361 ) ) ( not ( = ?auto_644360 ?auto_644362 ) ) ( not ( = ?auto_644360 ?auto_644363 ) ) ( not ( = ?auto_644360 ?auto_644364 ) ) ( not ( = ?auto_644360 ?auto_644365 ) ) ( not ( = ?auto_644360 ?auto_644366 ) ) ( not ( = ?auto_644361 ?auto_644362 ) ) ( not ( = ?auto_644361 ?auto_644363 ) ) ( not ( = ?auto_644361 ?auto_644364 ) ) ( not ( = ?auto_644361 ?auto_644365 ) ) ( not ( = ?auto_644361 ?auto_644366 ) ) ( not ( = ?auto_644362 ?auto_644363 ) ) ( not ( = ?auto_644362 ?auto_644364 ) ) ( not ( = ?auto_644362 ?auto_644365 ) ) ( not ( = ?auto_644362 ?auto_644366 ) ) ( not ( = ?auto_644363 ?auto_644364 ) ) ( not ( = ?auto_644363 ?auto_644365 ) ) ( not ( = ?auto_644363 ?auto_644366 ) ) ( not ( = ?auto_644364 ?auto_644365 ) ) ( not ( = ?auto_644364 ?auto_644366 ) ) ( not ( = ?auto_644365 ?auto_644366 ) ) ( CLEAR ?auto_644363 ) ( ON ?auto_644364 ?auto_644365 ) ( CLEAR ?auto_644364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_644355 ?auto_644356 ?auto_644357 ?auto_644358 ?auto_644359 ?auto_644360 ?auto_644361 ?auto_644362 ?auto_644363 ?auto_644364 )
      ( MAKE-11PILE ?auto_644355 ?auto_644356 ?auto_644357 ?auto_644358 ?auto_644359 ?auto_644360 ?auto_644361 ?auto_644362 ?auto_644363 ?auto_644364 ?auto_644365 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644401 - BLOCK
      ?auto_644402 - BLOCK
      ?auto_644403 - BLOCK
      ?auto_644404 - BLOCK
      ?auto_644405 - BLOCK
      ?auto_644406 - BLOCK
      ?auto_644407 - BLOCK
      ?auto_644408 - BLOCK
      ?auto_644409 - BLOCK
      ?auto_644410 - BLOCK
      ?auto_644411 - BLOCK
    )
    :vars
    (
      ?auto_644412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644411 ?auto_644412 ) ( ON-TABLE ?auto_644401 ) ( ON ?auto_644402 ?auto_644401 ) ( ON ?auto_644403 ?auto_644402 ) ( ON ?auto_644404 ?auto_644403 ) ( ON ?auto_644405 ?auto_644404 ) ( ON ?auto_644406 ?auto_644405 ) ( ON ?auto_644407 ?auto_644406 ) ( ON ?auto_644408 ?auto_644407 ) ( not ( = ?auto_644401 ?auto_644402 ) ) ( not ( = ?auto_644401 ?auto_644403 ) ) ( not ( = ?auto_644401 ?auto_644404 ) ) ( not ( = ?auto_644401 ?auto_644405 ) ) ( not ( = ?auto_644401 ?auto_644406 ) ) ( not ( = ?auto_644401 ?auto_644407 ) ) ( not ( = ?auto_644401 ?auto_644408 ) ) ( not ( = ?auto_644401 ?auto_644409 ) ) ( not ( = ?auto_644401 ?auto_644410 ) ) ( not ( = ?auto_644401 ?auto_644411 ) ) ( not ( = ?auto_644401 ?auto_644412 ) ) ( not ( = ?auto_644402 ?auto_644403 ) ) ( not ( = ?auto_644402 ?auto_644404 ) ) ( not ( = ?auto_644402 ?auto_644405 ) ) ( not ( = ?auto_644402 ?auto_644406 ) ) ( not ( = ?auto_644402 ?auto_644407 ) ) ( not ( = ?auto_644402 ?auto_644408 ) ) ( not ( = ?auto_644402 ?auto_644409 ) ) ( not ( = ?auto_644402 ?auto_644410 ) ) ( not ( = ?auto_644402 ?auto_644411 ) ) ( not ( = ?auto_644402 ?auto_644412 ) ) ( not ( = ?auto_644403 ?auto_644404 ) ) ( not ( = ?auto_644403 ?auto_644405 ) ) ( not ( = ?auto_644403 ?auto_644406 ) ) ( not ( = ?auto_644403 ?auto_644407 ) ) ( not ( = ?auto_644403 ?auto_644408 ) ) ( not ( = ?auto_644403 ?auto_644409 ) ) ( not ( = ?auto_644403 ?auto_644410 ) ) ( not ( = ?auto_644403 ?auto_644411 ) ) ( not ( = ?auto_644403 ?auto_644412 ) ) ( not ( = ?auto_644404 ?auto_644405 ) ) ( not ( = ?auto_644404 ?auto_644406 ) ) ( not ( = ?auto_644404 ?auto_644407 ) ) ( not ( = ?auto_644404 ?auto_644408 ) ) ( not ( = ?auto_644404 ?auto_644409 ) ) ( not ( = ?auto_644404 ?auto_644410 ) ) ( not ( = ?auto_644404 ?auto_644411 ) ) ( not ( = ?auto_644404 ?auto_644412 ) ) ( not ( = ?auto_644405 ?auto_644406 ) ) ( not ( = ?auto_644405 ?auto_644407 ) ) ( not ( = ?auto_644405 ?auto_644408 ) ) ( not ( = ?auto_644405 ?auto_644409 ) ) ( not ( = ?auto_644405 ?auto_644410 ) ) ( not ( = ?auto_644405 ?auto_644411 ) ) ( not ( = ?auto_644405 ?auto_644412 ) ) ( not ( = ?auto_644406 ?auto_644407 ) ) ( not ( = ?auto_644406 ?auto_644408 ) ) ( not ( = ?auto_644406 ?auto_644409 ) ) ( not ( = ?auto_644406 ?auto_644410 ) ) ( not ( = ?auto_644406 ?auto_644411 ) ) ( not ( = ?auto_644406 ?auto_644412 ) ) ( not ( = ?auto_644407 ?auto_644408 ) ) ( not ( = ?auto_644407 ?auto_644409 ) ) ( not ( = ?auto_644407 ?auto_644410 ) ) ( not ( = ?auto_644407 ?auto_644411 ) ) ( not ( = ?auto_644407 ?auto_644412 ) ) ( not ( = ?auto_644408 ?auto_644409 ) ) ( not ( = ?auto_644408 ?auto_644410 ) ) ( not ( = ?auto_644408 ?auto_644411 ) ) ( not ( = ?auto_644408 ?auto_644412 ) ) ( not ( = ?auto_644409 ?auto_644410 ) ) ( not ( = ?auto_644409 ?auto_644411 ) ) ( not ( = ?auto_644409 ?auto_644412 ) ) ( not ( = ?auto_644410 ?auto_644411 ) ) ( not ( = ?auto_644410 ?auto_644412 ) ) ( not ( = ?auto_644411 ?auto_644412 ) ) ( ON ?auto_644410 ?auto_644411 ) ( CLEAR ?auto_644408 ) ( ON ?auto_644409 ?auto_644410 ) ( CLEAR ?auto_644409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_644401 ?auto_644402 ?auto_644403 ?auto_644404 ?auto_644405 ?auto_644406 ?auto_644407 ?auto_644408 ?auto_644409 )
      ( MAKE-11PILE ?auto_644401 ?auto_644402 ?auto_644403 ?auto_644404 ?auto_644405 ?auto_644406 ?auto_644407 ?auto_644408 ?auto_644409 ?auto_644410 ?auto_644411 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644447 - BLOCK
      ?auto_644448 - BLOCK
      ?auto_644449 - BLOCK
      ?auto_644450 - BLOCK
      ?auto_644451 - BLOCK
      ?auto_644452 - BLOCK
      ?auto_644453 - BLOCK
      ?auto_644454 - BLOCK
      ?auto_644455 - BLOCK
      ?auto_644456 - BLOCK
      ?auto_644457 - BLOCK
    )
    :vars
    (
      ?auto_644458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644457 ?auto_644458 ) ( ON-TABLE ?auto_644447 ) ( ON ?auto_644448 ?auto_644447 ) ( ON ?auto_644449 ?auto_644448 ) ( ON ?auto_644450 ?auto_644449 ) ( ON ?auto_644451 ?auto_644450 ) ( ON ?auto_644452 ?auto_644451 ) ( ON ?auto_644453 ?auto_644452 ) ( not ( = ?auto_644447 ?auto_644448 ) ) ( not ( = ?auto_644447 ?auto_644449 ) ) ( not ( = ?auto_644447 ?auto_644450 ) ) ( not ( = ?auto_644447 ?auto_644451 ) ) ( not ( = ?auto_644447 ?auto_644452 ) ) ( not ( = ?auto_644447 ?auto_644453 ) ) ( not ( = ?auto_644447 ?auto_644454 ) ) ( not ( = ?auto_644447 ?auto_644455 ) ) ( not ( = ?auto_644447 ?auto_644456 ) ) ( not ( = ?auto_644447 ?auto_644457 ) ) ( not ( = ?auto_644447 ?auto_644458 ) ) ( not ( = ?auto_644448 ?auto_644449 ) ) ( not ( = ?auto_644448 ?auto_644450 ) ) ( not ( = ?auto_644448 ?auto_644451 ) ) ( not ( = ?auto_644448 ?auto_644452 ) ) ( not ( = ?auto_644448 ?auto_644453 ) ) ( not ( = ?auto_644448 ?auto_644454 ) ) ( not ( = ?auto_644448 ?auto_644455 ) ) ( not ( = ?auto_644448 ?auto_644456 ) ) ( not ( = ?auto_644448 ?auto_644457 ) ) ( not ( = ?auto_644448 ?auto_644458 ) ) ( not ( = ?auto_644449 ?auto_644450 ) ) ( not ( = ?auto_644449 ?auto_644451 ) ) ( not ( = ?auto_644449 ?auto_644452 ) ) ( not ( = ?auto_644449 ?auto_644453 ) ) ( not ( = ?auto_644449 ?auto_644454 ) ) ( not ( = ?auto_644449 ?auto_644455 ) ) ( not ( = ?auto_644449 ?auto_644456 ) ) ( not ( = ?auto_644449 ?auto_644457 ) ) ( not ( = ?auto_644449 ?auto_644458 ) ) ( not ( = ?auto_644450 ?auto_644451 ) ) ( not ( = ?auto_644450 ?auto_644452 ) ) ( not ( = ?auto_644450 ?auto_644453 ) ) ( not ( = ?auto_644450 ?auto_644454 ) ) ( not ( = ?auto_644450 ?auto_644455 ) ) ( not ( = ?auto_644450 ?auto_644456 ) ) ( not ( = ?auto_644450 ?auto_644457 ) ) ( not ( = ?auto_644450 ?auto_644458 ) ) ( not ( = ?auto_644451 ?auto_644452 ) ) ( not ( = ?auto_644451 ?auto_644453 ) ) ( not ( = ?auto_644451 ?auto_644454 ) ) ( not ( = ?auto_644451 ?auto_644455 ) ) ( not ( = ?auto_644451 ?auto_644456 ) ) ( not ( = ?auto_644451 ?auto_644457 ) ) ( not ( = ?auto_644451 ?auto_644458 ) ) ( not ( = ?auto_644452 ?auto_644453 ) ) ( not ( = ?auto_644452 ?auto_644454 ) ) ( not ( = ?auto_644452 ?auto_644455 ) ) ( not ( = ?auto_644452 ?auto_644456 ) ) ( not ( = ?auto_644452 ?auto_644457 ) ) ( not ( = ?auto_644452 ?auto_644458 ) ) ( not ( = ?auto_644453 ?auto_644454 ) ) ( not ( = ?auto_644453 ?auto_644455 ) ) ( not ( = ?auto_644453 ?auto_644456 ) ) ( not ( = ?auto_644453 ?auto_644457 ) ) ( not ( = ?auto_644453 ?auto_644458 ) ) ( not ( = ?auto_644454 ?auto_644455 ) ) ( not ( = ?auto_644454 ?auto_644456 ) ) ( not ( = ?auto_644454 ?auto_644457 ) ) ( not ( = ?auto_644454 ?auto_644458 ) ) ( not ( = ?auto_644455 ?auto_644456 ) ) ( not ( = ?auto_644455 ?auto_644457 ) ) ( not ( = ?auto_644455 ?auto_644458 ) ) ( not ( = ?auto_644456 ?auto_644457 ) ) ( not ( = ?auto_644456 ?auto_644458 ) ) ( not ( = ?auto_644457 ?auto_644458 ) ) ( ON ?auto_644456 ?auto_644457 ) ( ON ?auto_644455 ?auto_644456 ) ( CLEAR ?auto_644453 ) ( ON ?auto_644454 ?auto_644455 ) ( CLEAR ?auto_644454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_644447 ?auto_644448 ?auto_644449 ?auto_644450 ?auto_644451 ?auto_644452 ?auto_644453 ?auto_644454 )
      ( MAKE-11PILE ?auto_644447 ?auto_644448 ?auto_644449 ?auto_644450 ?auto_644451 ?auto_644452 ?auto_644453 ?auto_644454 ?auto_644455 ?auto_644456 ?auto_644457 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644493 - BLOCK
      ?auto_644494 - BLOCK
      ?auto_644495 - BLOCK
      ?auto_644496 - BLOCK
      ?auto_644497 - BLOCK
      ?auto_644498 - BLOCK
      ?auto_644499 - BLOCK
      ?auto_644500 - BLOCK
      ?auto_644501 - BLOCK
      ?auto_644502 - BLOCK
      ?auto_644503 - BLOCK
    )
    :vars
    (
      ?auto_644504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644503 ?auto_644504 ) ( ON-TABLE ?auto_644493 ) ( ON ?auto_644494 ?auto_644493 ) ( ON ?auto_644495 ?auto_644494 ) ( ON ?auto_644496 ?auto_644495 ) ( ON ?auto_644497 ?auto_644496 ) ( ON ?auto_644498 ?auto_644497 ) ( not ( = ?auto_644493 ?auto_644494 ) ) ( not ( = ?auto_644493 ?auto_644495 ) ) ( not ( = ?auto_644493 ?auto_644496 ) ) ( not ( = ?auto_644493 ?auto_644497 ) ) ( not ( = ?auto_644493 ?auto_644498 ) ) ( not ( = ?auto_644493 ?auto_644499 ) ) ( not ( = ?auto_644493 ?auto_644500 ) ) ( not ( = ?auto_644493 ?auto_644501 ) ) ( not ( = ?auto_644493 ?auto_644502 ) ) ( not ( = ?auto_644493 ?auto_644503 ) ) ( not ( = ?auto_644493 ?auto_644504 ) ) ( not ( = ?auto_644494 ?auto_644495 ) ) ( not ( = ?auto_644494 ?auto_644496 ) ) ( not ( = ?auto_644494 ?auto_644497 ) ) ( not ( = ?auto_644494 ?auto_644498 ) ) ( not ( = ?auto_644494 ?auto_644499 ) ) ( not ( = ?auto_644494 ?auto_644500 ) ) ( not ( = ?auto_644494 ?auto_644501 ) ) ( not ( = ?auto_644494 ?auto_644502 ) ) ( not ( = ?auto_644494 ?auto_644503 ) ) ( not ( = ?auto_644494 ?auto_644504 ) ) ( not ( = ?auto_644495 ?auto_644496 ) ) ( not ( = ?auto_644495 ?auto_644497 ) ) ( not ( = ?auto_644495 ?auto_644498 ) ) ( not ( = ?auto_644495 ?auto_644499 ) ) ( not ( = ?auto_644495 ?auto_644500 ) ) ( not ( = ?auto_644495 ?auto_644501 ) ) ( not ( = ?auto_644495 ?auto_644502 ) ) ( not ( = ?auto_644495 ?auto_644503 ) ) ( not ( = ?auto_644495 ?auto_644504 ) ) ( not ( = ?auto_644496 ?auto_644497 ) ) ( not ( = ?auto_644496 ?auto_644498 ) ) ( not ( = ?auto_644496 ?auto_644499 ) ) ( not ( = ?auto_644496 ?auto_644500 ) ) ( not ( = ?auto_644496 ?auto_644501 ) ) ( not ( = ?auto_644496 ?auto_644502 ) ) ( not ( = ?auto_644496 ?auto_644503 ) ) ( not ( = ?auto_644496 ?auto_644504 ) ) ( not ( = ?auto_644497 ?auto_644498 ) ) ( not ( = ?auto_644497 ?auto_644499 ) ) ( not ( = ?auto_644497 ?auto_644500 ) ) ( not ( = ?auto_644497 ?auto_644501 ) ) ( not ( = ?auto_644497 ?auto_644502 ) ) ( not ( = ?auto_644497 ?auto_644503 ) ) ( not ( = ?auto_644497 ?auto_644504 ) ) ( not ( = ?auto_644498 ?auto_644499 ) ) ( not ( = ?auto_644498 ?auto_644500 ) ) ( not ( = ?auto_644498 ?auto_644501 ) ) ( not ( = ?auto_644498 ?auto_644502 ) ) ( not ( = ?auto_644498 ?auto_644503 ) ) ( not ( = ?auto_644498 ?auto_644504 ) ) ( not ( = ?auto_644499 ?auto_644500 ) ) ( not ( = ?auto_644499 ?auto_644501 ) ) ( not ( = ?auto_644499 ?auto_644502 ) ) ( not ( = ?auto_644499 ?auto_644503 ) ) ( not ( = ?auto_644499 ?auto_644504 ) ) ( not ( = ?auto_644500 ?auto_644501 ) ) ( not ( = ?auto_644500 ?auto_644502 ) ) ( not ( = ?auto_644500 ?auto_644503 ) ) ( not ( = ?auto_644500 ?auto_644504 ) ) ( not ( = ?auto_644501 ?auto_644502 ) ) ( not ( = ?auto_644501 ?auto_644503 ) ) ( not ( = ?auto_644501 ?auto_644504 ) ) ( not ( = ?auto_644502 ?auto_644503 ) ) ( not ( = ?auto_644502 ?auto_644504 ) ) ( not ( = ?auto_644503 ?auto_644504 ) ) ( ON ?auto_644502 ?auto_644503 ) ( ON ?auto_644501 ?auto_644502 ) ( ON ?auto_644500 ?auto_644501 ) ( CLEAR ?auto_644498 ) ( ON ?auto_644499 ?auto_644500 ) ( CLEAR ?auto_644499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_644493 ?auto_644494 ?auto_644495 ?auto_644496 ?auto_644497 ?auto_644498 ?auto_644499 )
      ( MAKE-11PILE ?auto_644493 ?auto_644494 ?auto_644495 ?auto_644496 ?auto_644497 ?auto_644498 ?auto_644499 ?auto_644500 ?auto_644501 ?auto_644502 ?auto_644503 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644539 - BLOCK
      ?auto_644540 - BLOCK
      ?auto_644541 - BLOCK
      ?auto_644542 - BLOCK
      ?auto_644543 - BLOCK
      ?auto_644544 - BLOCK
      ?auto_644545 - BLOCK
      ?auto_644546 - BLOCK
      ?auto_644547 - BLOCK
      ?auto_644548 - BLOCK
      ?auto_644549 - BLOCK
    )
    :vars
    (
      ?auto_644550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644549 ?auto_644550 ) ( ON-TABLE ?auto_644539 ) ( ON ?auto_644540 ?auto_644539 ) ( ON ?auto_644541 ?auto_644540 ) ( ON ?auto_644542 ?auto_644541 ) ( ON ?auto_644543 ?auto_644542 ) ( not ( = ?auto_644539 ?auto_644540 ) ) ( not ( = ?auto_644539 ?auto_644541 ) ) ( not ( = ?auto_644539 ?auto_644542 ) ) ( not ( = ?auto_644539 ?auto_644543 ) ) ( not ( = ?auto_644539 ?auto_644544 ) ) ( not ( = ?auto_644539 ?auto_644545 ) ) ( not ( = ?auto_644539 ?auto_644546 ) ) ( not ( = ?auto_644539 ?auto_644547 ) ) ( not ( = ?auto_644539 ?auto_644548 ) ) ( not ( = ?auto_644539 ?auto_644549 ) ) ( not ( = ?auto_644539 ?auto_644550 ) ) ( not ( = ?auto_644540 ?auto_644541 ) ) ( not ( = ?auto_644540 ?auto_644542 ) ) ( not ( = ?auto_644540 ?auto_644543 ) ) ( not ( = ?auto_644540 ?auto_644544 ) ) ( not ( = ?auto_644540 ?auto_644545 ) ) ( not ( = ?auto_644540 ?auto_644546 ) ) ( not ( = ?auto_644540 ?auto_644547 ) ) ( not ( = ?auto_644540 ?auto_644548 ) ) ( not ( = ?auto_644540 ?auto_644549 ) ) ( not ( = ?auto_644540 ?auto_644550 ) ) ( not ( = ?auto_644541 ?auto_644542 ) ) ( not ( = ?auto_644541 ?auto_644543 ) ) ( not ( = ?auto_644541 ?auto_644544 ) ) ( not ( = ?auto_644541 ?auto_644545 ) ) ( not ( = ?auto_644541 ?auto_644546 ) ) ( not ( = ?auto_644541 ?auto_644547 ) ) ( not ( = ?auto_644541 ?auto_644548 ) ) ( not ( = ?auto_644541 ?auto_644549 ) ) ( not ( = ?auto_644541 ?auto_644550 ) ) ( not ( = ?auto_644542 ?auto_644543 ) ) ( not ( = ?auto_644542 ?auto_644544 ) ) ( not ( = ?auto_644542 ?auto_644545 ) ) ( not ( = ?auto_644542 ?auto_644546 ) ) ( not ( = ?auto_644542 ?auto_644547 ) ) ( not ( = ?auto_644542 ?auto_644548 ) ) ( not ( = ?auto_644542 ?auto_644549 ) ) ( not ( = ?auto_644542 ?auto_644550 ) ) ( not ( = ?auto_644543 ?auto_644544 ) ) ( not ( = ?auto_644543 ?auto_644545 ) ) ( not ( = ?auto_644543 ?auto_644546 ) ) ( not ( = ?auto_644543 ?auto_644547 ) ) ( not ( = ?auto_644543 ?auto_644548 ) ) ( not ( = ?auto_644543 ?auto_644549 ) ) ( not ( = ?auto_644543 ?auto_644550 ) ) ( not ( = ?auto_644544 ?auto_644545 ) ) ( not ( = ?auto_644544 ?auto_644546 ) ) ( not ( = ?auto_644544 ?auto_644547 ) ) ( not ( = ?auto_644544 ?auto_644548 ) ) ( not ( = ?auto_644544 ?auto_644549 ) ) ( not ( = ?auto_644544 ?auto_644550 ) ) ( not ( = ?auto_644545 ?auto_644546 ) ) ( not ( = ?auto_644545 ?auto_644547 ) ) ( not ( = ?auto_644545 ?auto_644548 ) ) ( not ( = ?auto_644545 ?auto_644549 ) ) ( not ( = ?auto_644545 ?auto_644550 ) ) ( not ( = ?auto_644546 ?auto_644547 ) ) ( not ( = ?auto_644546 ?auto_644548 ) ) ( not ( = ?auto_644546 ?auto_644549 ) ) ( not ( = ?auto_644546 ?auto_644550 ) ) ( not ( = ?auto_644547 ?auto_644548 ) ) ( not ( = ?auto_644547 ?auto_644549 ) ) ( not ( = ?auto_644547 ?auto_644550 ) ) ( not ( = ?auto_644548 ?auto_644549 ) ) ( not ( = ?auto_644548 ?auto_644550 ) ) ( not ( = ?auto_644549 ?auto_644550 ) ) ( ON ?auto_644548 ?auto_644549 ) ( ON ?auto_644547 ?auto_644548 ) ( ON ?auto_644546 ?auto_644547 ) ( ON ?auto_644545 ?auto_644546 ) ( CLEAR ?auto_644543 ) ( ON ?auto_644544 ?auto_644545 ) ( CLEAR ?auto_644544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_644539 ?auto_644540 ?auto_644541 ?auto_644542 ?auto_644543 ?auto_644544 )
      ( MAKE-11PILE ?auto_644539 ?auto_644540 ?auto_644541 ?auto_644542 ?auto_644543 ?auto_644544 ?auto_644545 ?auto_644546 ?auto_644547 ?auto_644548 ?auto_644549 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644585 - BLOCK
      ?auto_644586 - BLOCK
      ?auto_644587 - BLOCK
      ?auto_644588 - BLOCK
      ?auto_644589 - BLOCK
      ?auto_644590 - BLOCK
      ?auto_644591 - BLOCK
      ?auto_644592 - BLOCK
      ?auto_644593 - BLOCK
      ?auto_644594 - BLOCK
      ?auto_644595 - BLOCK
    )
    :vars
    (
      ?auto_644596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644595 ?auto_644596 ) ( ON-TABLE ?auto_644585 ) ( ON ?auto_644586 ?auto_644585 ) ( ON ?auto_644587 ?auto_644586 ) ( ON ?auto_644588 ?auto_644587 ) ( not ( = ?auto_644585 ?auto_644586 ) ) ( not ( = ?auto_644585 ?auto_644587 ) ) ( not ( = ?auto_644585 ?auto_644588 ) ) ( not ( = ?auto_644585 ?auto_644589 ) ) ( not ( = ?auto_644585 ?auto_644590 ) ) ( not ( = ?auto_644585 ?auto_644591 ) ) ( not ( = ?auto_644585 ?auto_644592 ) ) ( not ( = ?auto_644585 ?auto_644593 ) ) ( not ( = ?auto_644585 ?auto_644594 ) ) ( not ( = ?auto_644585 ?auto_644595 ) ) ( not ( = ?auto_644585 ?auto_644596 ) ) ( not ( = ?auto_644586 ?auto_644587 ) ) ( not ( = ?auto_644586 ?auto_644588 ) ) ( not ( = ?auto_644586 ?auto_644589 ) ) ( not ( = ?auto_644586 ?auto_644590 ) ) ( not ( = ?auto_644586 ?auto_644591 ) ) ( not ( = ?auto_644586 ?auto_644592 ) ) ( not ( = ?auto_644586 ?auto_644593 ) ) ( not ( = ?auto_644586 ?auto_644594 ) ) ( not ( = ?auto_644586 ?auto_644595 ) ) ( not ( = ?auto_644586 ?auto_644596 ) ) ( not ( = ?auto_644587 ?auto_644588 ) ) ( not ( = ?auto_644587 ?auto_644589 ) ) ( not ( = ?auto_644587 ?auto_644590 ) ) ( not ( = ?auto_644587 ?auto_644591 ) ) ( not ( = ?auto_644587 ?auto_644592 ) ) ( not ( = ?auto_644587 ?auto_644593 ) ) ( not ( = ?auto_644587 ?auto_644594 ) ) ( not ( = ?auto_644587 ?auto_644595 ) ) ( not ( = ?auto_644587 ?auto_644596 ) ) ( not ( = ?auto_644588 ?auto_644589 ) ) ( not ( = ?auto_644588 ?auto_644590 ) ) ( not ( = ?auto_644588 ?auto_644591 ) ) ( not ( = ?auto_644588 ?auto_644592 ) ) ( not ( = ?auto_644588 ?auto_644593 ) ) ( not ( = ?auto_644588 ?auto_644594 ) ) ( not ( = ?auto_644588 ?auto_644595 ) ) ( not ( = ?auto_644588 ?auto_644596 ) ) ( not ( = ?auto_644589 ?auto_644590 ) ) ( not ( = ?auto_644589 ?auto_644591 ) ) ( not ( = ?auto_644589 ?auto_644592 ) ) ( not ( = ?auto_644589 ?auto_644593 ) ) ( not ( = ?auto_644589 ?auto_644594 ) ) ( not ( = ?auto_644589 ?auto_644595 ) ) ( not ( = ?auto_644589 ?auto_644596 ) ) ( not ( = ?auto_644590 ?auto_644591 ) ) ( not ( = ?auto_644590 ?auto_644592 ) ) ( not ( = ?auto_644590 ?auto_644593 ) ) ( not ( = ?auto_644590 ?auto_644594 ) ) ( not ( = ?auto_644590 ?auto_644595 ) ) ( not ( = ?auto_644590 ?auto_644596 ) ) ( not ( = ?auto_644591 ?auto_644592 ) ) ( not ( = ?auto_644591 ?auto_644593 ) ) ( not ( = ?auto_644591 ?auto_644594 ) ) ( not ( = ?auto_644591 ?auto_644595 ) ) ( not ( = ?auto_644591 ?auto_644596 ) ) ( not ( = ?auto_644592 ?auto_644593 ) ) ( not ( = ?auto_644592 ?auto_644594 ) ) ( not ( = ?auto_644592 ?auto_644595 ) ) ( not ( = ?auto_644592 ?auto_644596 ) ) ( not ( = ?auto_644593 ?auto_644594 ) ) ( not ( = ?auto_644593 ?auto_644595 ) ) ( not ( = ?auto_644593 ?auto_644596 ) ) ( not ( = ?auto_644594 ?auto_644595 ) ) ( not ( = ?auto_644594 ?auto_644596 ) ) ( not ( = ?auto_644595 ?auto_644596 ) ) ( ON ?auto_644594 ?auto_644595 ) ( ON ?auto_644593 ?auto_644594 ) ( ON ?auto_644592 ?auto_644593 ) ( ON ?auto_644591 ?auto_644592 ) ( ON ?auto_644590 ?auto_644591 ) ( CLEAR ?auto_644588 ) ( ON ?auto_644589 ?auto_644590 ) ( CLEAR ?auto_644589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_644585 ?auto_644586 ?auto_644587 ?auto_644588 ?auto_644589 )
      ( MAKE-11PILE ?auto_644585 ?auto_644586 ?auto_644587 ?auto_644588 ?auto_644589 ?auto_644590 ?auto_644591 ?auto_644592 ?auto_644593 ?auto_644594 ?auto_644595 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644631 - BLOCK
      ?auto_644632 - BLOCK
      ?auto_644633 - BLOCK
      ?auto_644634 - BLOCK
      ?auto_644635 - BLOCK
      ?auto_644636 - BLOCK
      ?auto_644637 - BLOCK
      ?auto_644638 - BLOCK
      ?auto_644639 - BLOCK
      ?auto_644640 - BLOCK
      ?auto_644641 - BLOCK
    )
    :vars
    (
      ?auto_644642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644641 ?auto_644642 ) ( ON-TABLE ?auto_644631 ) ( ON ?auto_644632 ?auto_644631 ) ( ON ?auto_644633 ?auto_644632 ) ( not ( = ?auto_644631 ?auto_644632 ) ) ( not ( = ?auto_644631 ?auto_644633 ) ) ( not ( = ?auto_644631 ?auto_644634 ) ) ( not ( = ?auto_644631 ?auto_644635 ) ) ( not ( = ?auto_644631 ?auto_644636 ) ) ( not ( = ?auto_644631 ?auto_644637 ) ) ( not ( = ?auto_644631 ?auto_644638 ) ) ( not ( = ?auto_644631 ?auto_644639 ) ) ( not ( = ?auto_644631 ?auto_644640 ) ) ( not ( = ?auto_644631 ?auto_644641 ) ) ( not ( = ?auto_644631 ?auto_644642 ) ) ( not ( = ?auto_644632 ?auto_644633 ) ) ( not ( = ?auto_644632 ?auto_644634 ) ) ( not ( = ?auto_644632 ?auto_644635 ) ) ( not ( = ?auto_644632 ?auto_644636 ) ) ( not ( = ?auto_644632 ?auto_644637 ) ) ( not ( = ?auto_644632 ?auto_644638 ) ) ( not ( = ?auto_644632 ?auto_644639 ) ) ( not ( = ?auto_644632 ?auto_644640 ) ) ( not ( = ?auto_644632 ?auto_644641 ) ) ( not ( = ?auto_644632 ?auto_644642 ) ) ( not ( = ?auto_644633 ?auto_644634 ) ) ( not ( = ?auto_644633 ?auto_644635 ) ) ( not ( = ?auto_644633 ?auto_644636 ) ) ( not ( = ?auto_644633 ?auto_644637 ) ) ( not ( = ?auto_644633 ?auto_644638 ) ) ( not ( = ?auto_644633 ?auto_644639 ) ) ( not ( = ?auto_644633 ?auto_644640 ) ) ( not ( = ?auto_644633 ?auto_644641 ) ) ( not ( = ?auto_644633 ?auto_644642 ) ) ( not ( = ?auto_644634 ?auto_644635 ) ) ( not ( = ?auto_644634 ?auto_644636 ) ) ( not ( = ?auto_644634 ?auto_644637 ) ) ( not ( = ?auto_644634 ?auto_644638 ) ) ( not ( = ?auto_644634 ?auto_644639 ) ) ( not ( = ?auto_644634 ?auto_644640 ) ) ( not ( = ?auto_644634 ?auto_644641 ) ) ( not ( = ?auto_644634 ?auto_644642 ) ) ( not ( = ?auto_644635 ?auto_644636 ) ) ( not ( = ?auto_644635 ?auto_644637 ) ) ( not ( = ?auto_644635 ?auto_644638 ) ) ( not ( = ?auto_644635 ?auto_644639 ) ) ( not ( = ?auto_644635 ?auto_644640 ) ) ( not ( = ?auto_644635 ?auto_644641 ) ) ( not ( = ?auto_644635 ?auto_644642 ) ) ( not ( = ?auto_644636 ?auto_644637 ) ) ( not ( = ?auto_644636 ?auto_644638 ) ) ( not ( = ?auto_644636 ?auto_644639 ) ) ( not ( = ?auto_644636 ?auto_644640 ) ) ( not ( = ?auto_644636 ?auto_644641 ) ) ( not ( = ?auto_644636 ?auto_644642 ) ) ( not ( = ?auto_644637 ?auto_644638 ) ) ( not ( = ?auto_644637 ?auto_644639 ) ) ( not ( = ?auto_644637 ?auto_644640 ) ) ( not ( = ?auto_644637 ?auto_644641 ) ) ( not ( = ?auto_644637 ?auto_644642 ) ) ( not ( = ?auto_644638 ?auto_644639 ) ) ( not ( = ?auto_644638 ?auto_644640 ) ) ( not ( = ?auto_644638 ?auto_644641 ) ) ( not ( = ?auto_644638 ?auto_644642 ) ) ( not ( = ?auto_644639 ?auto_644640 ) ) ( not ( = ?auto_644639 ?auto_644641 ) ) ( not ( = ?auto_644639 ?auto_644642 ) ) ( not ( = ?auto_644640 ?auto_644641 ) ) ( not ( = ?auto_644640 ?auto_644642 ) ) ( not ( = ?auto_644641 ?auto_644642 ) ) ( ON ?auto_644640 ?auto_644641 ) ( ON ?auto_644639 ?auto_644640 ) ( ON ?auto_644638 ?auto_644639 ) ( ON ?auto_644637 ?auto_644638 ) ( ON ?auto_644636 ?auto_644637 ) ( ON ?auto_644635 ?auto_644636 ) ( CLEAR ?auto_644633 ) ( ON ?auto_644634 ?auto_644635 ) ( CLEAR ?auto_644634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_644631 ?auto_644632 ?auto_644633 ?auto_644634 )
      ( MAKE-11PILE ?auto_644631 ?auto_644632 ?auto_644633 ?auto_644634 ?auto_644635 ?auto_644636 ?auto_644637 ?auto_644638 ?auto_644639 ?auto_644640 ?auto_644641 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644677 - BLOCK
      ?auto_644678 - BLOCK
      ?auto_644679 - BLOCK
      ?auto_644680 - BLOCK
      ?auto_644681 - BLOCK
      ?auto_644682 - BLOCK
      ?auto_644683 - BLOCK
      ?auto_644684 - BLOCK
      ?auto_644685 - BLOCK
      ?auto_644686 - BLOCK
      ?auto_644687 - BLOCK
    )
    :vars
    (
      ?auto_644688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644687 ?auto_644688 ) ( ON-TABLE ?auto_644677 ) ( ON ?auto_644678 ?auto_644677 ) ( not ( = ?auto_644677 ?auto_644678 ) ) ( not ( = ?auto_644677 ?auto_644679 ) ) ( not ( = ?auto_644677 ?auto_644680 ) ) ( not ( = ?auto_644677 ?auto_644681 ) ) ( not ( = ?auto_644677 ?auto_644682 ) ) ( not ( = ?auto_644677 ?auto_644683 ) ) ( not ( = ?auto_644677 ?auto_644684 ) ) ( not ( = ?auto_644677 ?auto_644685 ) ) ( not ( = ?auto_644677 ?auto_644686 ) ) ( not ( = ?auto_644677 ?auto_644687 ) ) ( not ( = ?auto_644677 ?auto_644688 ) ) ( not ( = ?auto_644678 ?auto_644679 ) ) ( not ( = ?auto_644678 ?auto_644680 ) ) ( not ( = ?auto_644678 ?auto_644681 ) ) ( not ( = ?auto_644678 ?auto_644682 ) ) ( not ( = ?auto_644678 ?auto_644683 ) ) ( not ( = ?auto_644678 ?auto_644684 ) ) ( not ( = ?auto_644678 ?auto_644685 ) ) ( not ( = ?auto_644678 ?auto_644686 ) ) ( not ( = ?auto_644678 ?auto_644687 ) ) ( not ( = ?auto_644678 ?auto_644688 ) ) ( not ( = ?auto_644679 ?auto_644680 ) ) ( not ( = ?auto_644679 ?auto_644681 ) ) ( not ( = ?auto_644679 ?auto_644682 ) ) ( not ( = ?auto_644679 ?auto_644683 ) ) ( not ( = ?auto_644679 ?auto_644684 ) ) ( not ( = ?auto_644679 ?auto_644685 ) ) ( not ( = ?auto_644679 ?auto_644686 ) ) ( not ( = ?auto_644679 ?auto_644687 ) ) ( not ( = ?auto_644679 ?auto_644688 ) ) ( not ( = ?auto_644680 ?auto_644681 ) ) ( not ( = ?auto_644680 ?auto_644682 ) ) ( not ( = ?auto_644680 ?auto_644683 ) ) ( not ( = ?auto_644680 ?auto_644684 ) ) ( not ( = ?auto_644680 ?auto_644685 ) ) ( not ( = ?auto_644680 ?auto_644686 ) ) ( not ( = ?auto_644680 ?auto_644687 ) ) ( not ( = ?auto_644680 ?auto_644688 ) ) ( not ( = ?auto_644681 ?auto_644682 ) ) ( not ( = ?auto_644681 ?auto_644683 ) ) ( not ( = ?auto_644681 ?auto_644684 ) ) ( not ( = ?auto_644681 ?auto_644685 ) ) ( not ( = ?auto_644681 ?auto_644686 ) ) ( not ( = ?auto_644681 ?auto_644687 ) ) ( not ( = ?auto_644681 ?auto_644688 ) ) ( not ( = ?auto_644682 ?auto_644683 ) ) ( not ( = ?auto_644682 ?auto_644684 ) ) ( not ( = ?auto_644682 ?auto_644685 ) ) ( not ( = ?auto_644682 ?auto_644686 ) ) ( not ( = ?auto_644682 ?auto_644687 ) ) ( not ( = ?auto_644682 ?auto_644688 ) ) ( not ( = ?auto_644683 ?auto_644684 ) ) ( not ( = ?auto_644683 ?auto_644685 ) ) ( not ( = ?auto_644683 ?auto_644686 ) ) ( not ( = ?auto_644683 ?auto_644687 ) ) ( not ( = ?auto_644683 ?auto_644688 ) ) ( not ( = ?auto_644684 ?auto_644685 ) ) ( not ( = ?auto_644684 ?auto_644686 ) ) ( not ( = ?auto_644684 ?auto_644687 ) ) ( not ( = ?auto_644684 ?auto_644688 ) ) ( not ( = ?auto_644685 ?auto_644686 ) ) ( not ( = ?auto_644685 ?auto_644687 ) ) ( not ( = ?auto_644685 ?auto_644688 ) ) ( not ( = ?auto_644686 ?auto_644687 ) ) ( not ( = ?auto_644686 ?auto_644688 ) ) ( not ( = ?auto_644687 ?auto_644688 ) ) ( ON ?auto_644686 ?auto_644687 ) ( ON ?auto_644685 ?auto_644686 ) ( ON ?auto_644684 ?auto_644685 ) ( ON ?auto_644683 ?auto_644684 ) ( ON ?auto_644682 ?auto_644683 ) ( ON ?auto_644681 ?auto_644682 ) ( ON ?auto_644680 ?auto_644681 ) ( CLEAR ?auto_644678 ) ( ON ?auto_644679 ?auto_644680 ) ( CLEAR ?auto_644679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_644677 ?auto_644678 ?auto_644679 )
      ( MAKE-11PILE ?auto_644677 ?auto_644678 ?auto_644679 ?auto_644680 ?auto_644681 ?auto_644682 ?auto_644683 ?auto_644684 ?auto_644685 ?auto_644686 ?auto_644687 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644723 - BLOCK
      ?auto_644724 - BLOCK
      ?auto_644725 - BLOCK
      ?auto_644726 - BLOCK
      ?auto_644727 - BLOCK
      ?auto_644728 - BLOCK
      ?auto_644729 - BLOCK
      ?auto_644730 - BLOCK
      ?auto_644731 - BLOCK
      ?auto_644732 - BLOCK
      ?auto_644733 - BLOCK
    )
    :vars
    (
      ?auto_644734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644733 ?auto_644734 ) ( ON-TABLE ?auto_644723 ) ( not ( = ?auto_644723 ?auto_644724 ) ) ( not ( = ?auto_644723 ?auto_644725 ) ) ( not ( = ?auto_644723 ?auto_644726 ) ) ( not ( = ?auto_644723 ?auto_644727 ) ) ( not ( = ?auto_644723 ?auto_644728 ) ) ( not ( = ?auto_644723 ?auto_644729 ) ) ( not ( = ?auto_644723 ?auto_644730 ) ) ( not ( = ?auto_644723 ?auto_644731 ) ) ( not ( = ?auto_644723 ?auto_644732 ) ) ( not ( = ?auto_644723 ?auto_644733 ) ) ( not ( = ?auto_644723 ?auto_644734 ) ) ( not ( = ?auto_644724 ?auto_644725 ) ) ( not ( = ?auto_644724 ?auto_644726 ) ) ( not ( = ?auto_644724 ?auto_644727 ) ) ( not ( = ?auto_644724 ?auto_644728 ) ) ( not ( = ?auto_644724 ?auto_644729 ) ) ( not ( = ?auto_644724 ?auto_644730 ) ) ( not ( = ?auto_644724 ?auto_644731 ) ) ( not ( = ?auto_644724 ?auto_644732 ) ) ( not ( = ?auto_644724 ?auto_644733 ) ) ( not ( = ?auto_644724 ?auto_644734 ) ) ( not ( = ?auto_644725 ?auto_644726 ) ) ( not ( = ?auto_644725 ?auto_644727 ) ) ( not ( = ?auto_644725 ?auto_644728 ) ) ( not ( = ?auto_644725 ?auto_644729 ) ) ( not ( = ?auto_644725 ?auto_644730 ) ) ( not ( = ?auto_644725 ?auto_644731 ) ) ( not ( = ?auto_644725 ?auto_644732 ) ) ( not ( = ?auto_644725 ?auto_644733 ) ) ( not ( = ?auto_644725 ?auto_644734 ) ) ( not ( = ?auto_644726 ?auto_644727 ) ) ( not ( = ?auto_644726 ?auto_644728 ) ) ( not ( = ?auto_644726 ?auto_644729 ) ) ( not ( = ?auto_644726 ?auto_644730 ) ) ( not ( = ?auto_644726 ?auto_644731 ) ) ( not ( = ?auto_644726 ?auto_644732 ) ) ( not ( = ?auto_644726 ?auto_644733 ) ) ( not ( = ?auto_644726 ?auto_644734 ) ) ( not ( = ?auto_644727 ?auto_644728 ) ) ( not ( = ?auto_644727 ?auto_644729 ) ) ( not ( = ?auto_644727 ?auto_644730 ) ) ( not ( = ?auto_644727 ?auto_644731 ) ) ( not ( = ?auto_644727 ?auto_644732 ) ) ( not ( = ?auto_644727 ?auto_644733 ) ) ( not ( = ?auto_644727 ?auto_644734 ) ) ( not ( = ?auto_644728 ?auto_644729 ) ) ( not ( = ?auto_644728 ?auto_644730 ) ) ( not ( = ?auto_644728 ?auto_644731 ) ) ( not ( = ?auto_644728 ?auto_644732 ) ) ( not ( = ?auto_644728 ?auto_644733 ) ) ( not ( = ?auto_644728 ?auto_644734 ) ) ( not ( = ?auto_644729 ?auto_644730 ) ) ( not ( = ?auto_644729 ?auto_644731 ) ) ( not ( = ?auto_644729 ?auto_644732 ) ) ( not ( = ?auto_644729 ?auto_644733 ) ) ( not ( = ?auto_644729 ?auto_644734 ) ) ( not ( = ?auto_644730 ?auto_644731 ) ) ( not ( = ?auto_644730 ?auto_644732 ) ) ( not ( = ?auto_644730 ?auto_644733 ) ) ( not ( = ?auto_644730 ?auto_644734 ) ) ( not ( = ?auto_644731 ?auto_644732 ) ) ( not ( = ?auto_644731 ?auto_644733 ) ) ( not ( = ?auto_644731 ?auto_644734 ) ) ( not ( = ?auto_644732 ?auto_644733 ) ) ( not ( = ?auto_644732 ?auto_644734 ) ) ( not ( = ?auto_644733 ?auto_644734 ) ) ( ON ?auto_644732 ?auto_644733 ) ( ON ?auto_644731 ?auto_644732 ) ( ON ?auto_644730 ?auto_644731 ) ( ON ?auto_644729 ?auto_644730 ) ( ON ?auto_644728 ?auto_644729 ) ( ON ?auto_644727 ?auto_644728 ) ( ON ?auto_644726 ?auto_644727 ) ( ON ?auto_644725 ?auto_644726 ) ( CLEAR ?auto_644723 ) ( ON ?auto_644724 ?auto_644725 ) ( CLEAR ?auto_644724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_644723 ?auto_644724 )
      ( MAKE-11PILE ?auto_644723 ?auto_644724 ?auto_644725 ?auto_644726 ?auto_644727 ?auto_644728 ?auto_644729 ?auto_644730 ?auto_644731 ?auto_644732 ?auto_644733 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_644769 - BLOCK
      ?auto_644770 - BLOCK
      ?auto_644771 - BLOCK
      ?auto_644772 - BLOCK
      ?auto_644773 - BLOCK
      ?auto_644774 - BLOCK
      ?auto_644775 - BLOCK
      ?auto_644776 - BLOCK
      ?auto_644777 - BLOCK
      ?auto_644778 - BLOCK
      ?auto_644779 - BLOCK
    )
    :vars
    (
      ?auto_644780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644779 ?auto_644780 ) ( not ( = ?auto_644769 ?auto_644770 ) ) ( not ( = ?auto_644769 ?auto_644771 ) ) ( not ( = ?auto_644769 ?auto_644772 ) ) ( not ( = ?auto_644769 ?auto_644773 ) ) ( not ( = ?auto_644769 ?auto_644774 ) ) ( not ( = ?auto_644769 ?auto_644775 ) ) ( not ( = ?auto_644769 ?auto_644776 ) ) ( not ( = ?auto_644769 ?auto_644777 ) ) ( not ( = ?auto_644769 ?auto_644778 ) ) ( not ( = ?auto_644769 ?auto_644779 ) ) ( not ( = ?auto_644769 ?auto_644780 ) ) ( not ( = ?auto_644770 ?auto_644771 ) ) ( not ( = ?auto_644770 ?auto_644772 ) ) ( not ( = ?auto_644770 ?auto_644773 ) ) ( not ( = ?auto_644770 ?auto_644774 ) ) ( not ( = ?auto_644770 ?auto_644775 ) ) ( not ( = ?auto_644770 ?auto_644776 ) ) ( not ( = ?auto_644770 ?auto_644777 ) ) ( not ( = ?auto_644770 ?auto_644778 ) ) ( not ( = ?auto_644770 ?auto_644779 ) ) ( not ( = ?auto_644770 ?auto_644780 ) ) ( not ( = ?auto_644771 ?auto_644772 ) ) ( not ( = ?auto_644771 ?auto_644773 ) ) ( not ( = ?auto_644771 ?auto_644774 ) ) ( not ( = ?auto_644771 ?auto_644775 ) ) ( not ( = ?auto_644771 ?auto_644776 ) ) ( not ( = ?auto_644771 ?auto_644777 ) ) ( not ( = ?auto_644771 ?auto_644778 ) ) ( not ( = ?auto_644771 ?auto_644779 ) ) ( not ( = ?auto_644771 ?auto_644780 ) ) ( not ( = ?auto_644772 ?auto_644773 ) ) ( not ( = ?auto_644772 ?auto_644774 ) ) ( not ( = ?auto_644772 ?auto_644775 ) ) ( not ( = ?auto_644772 ?auto_644776 ) ) ( not ( = ?auto_644772 ?auto_644777 ) ) ( not ( = ?auto_644772 ?auto_644778 ) ) ( not ( = ?auto_644772 ?auto_644779 ) ) ( not ( = ?auto_644772 ?auto_644780 ) ) ( not ( = ?auto_644773 ?auto_644774 ) ) ( not ( = ?auto_644773 ?auto_644775 ) ) ( not ( = ?auto_644773 ?auto_644776 ) ) ( not ( = ?auto_644773 ?auto_644777 ) ) ( not ( = ?auto_644773 ?auto_644778 ) ) ( not ( = ?auto_644773 ?auto_644779 ) ) ( not ( = ?auto_644773 ?auto_644780 ) ) ( not ( = ?auto_644774 ?auto_644775 ) ) ( not ( = ?auto_644774 ?auto_644776 ) ) ( not ( = ?auto_644774 ?auto_644777 ) ) ( not ( = ?auto_644774 ?auto_644778 ) ) ( not ( = ?auto_644774 ?auto_644779 ) ) ( not ( = ?auto_644774 ?auto_644780 ) ) ( not ( = ?auto_644775 ?auto_644776 ) ) ( not ( = ?auto_644775 ?auto_644777 ) ) ( not ( = ?auto_644775 ?auto_644778 ) ) ( not ( = ?auto_644775 ?auto_644779 ) ) ( not ( = ?auto_644775 ?auto_644780 ) ) ( not ( = ?auto_644776 ?auto_644777 ) ) ( not ( = ?auto_644776 ?auto_644778 ) ) ( not ( = ?auto_644776 ?auto_644779 ) ) ( not ( = ?auto_644776 ?auto_644780 ) ) ( not ( = ?auto_644777 ?auto_644778 ) ) ( not ( = ?auto_644777 ?auto_644779 ) ) ( not ( = ?auto_644777 ?auto_644780 ) ) ( not ( = ?auto_644778 ?auto_644779 ) ) ( not ( = ?auto_644778 ?auto_644780 ) ) ( not ( = ?auto_644779 ?auto_644780 ) ) ( ON ?auto_644778 ?auto_644779 ) ( ON ?auto_644777 ?auto_644778 ) ( ON ?auto_644776 ?auto_644777 ) ( ON ?auto_644775 ?auto_644776 ) ( ON ?auto_644774 ?auto_644775 ) ( ON ?auto_644773 ?auto_644774 ) ( ON ?auto_644772 ?auto_644773 ) ( ON ?auto_644771 ?auto_644772 ) ( ON ?auto_644770 ?auto_644771 ) ( ON ?auto_644769 ?auto_644770 ) ( CLEAR ?auto_644769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_644769 )
      ( MAKE-11PILE ?auto_644769 ?auto_644770 ?auto_644771 ?auto_644772 ?auto_644773 ?auto_644774 ?auto_644775 ?auto_644776 ?auto_644777 ?auto_644778 ?auto_644779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_644816 - BLOCK
      ?auto_644817 - BLOCK
      ?auto_644818 - BLOCK
      ?auto_644819 - BLOCK
      ?auto_644820 - BLOCK
      ?auto_644821 - BLOCK
      ?auto_644822 - BLOCK
      ?auto_644823 - BLOCK
      ?auto_644824 - BLOCK
      ?auto_644825 - BLOCK
      ?auto_644826 - BLOCK
      ?auto_644827 - BLOCK
    )
    :vars
    (
      ?auto_644828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_644826 ) ( ON ?auto_644827 ?auto_644828 ) ( CLEAR ?auto_644827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_644816 ) ( ON ?auto_644817 ?auto_644816 ) ( ON ?auto_644818 ?auto_644817 ) ( ON ?auto_644819 ?auto_644818 ) ( ON ?auto_644820 ?auto_644819 ) ( ON ?auto_644821 ?auto_644820 ) ( ON ?auto_644822 ?auto_644821 ) ( ON ?auto_644823 ?auto_644822 ) ( ON ?auto_644824 ?auto_644823 ) ( ON ?auto_644825 ?auto_644824 ) ( ON ?auto_644826 ?auto_644825 ) ( not ( = ?auto_644816 ?auto_644817 ) ) ( not ( = ?auto_644816 ?auto_644818 ) ) ( not ( = ?auto_644816 ?auto_644819 ) ) ( not ( = ?auto_644816 ?auto_644820 ) ) ( not ( = ?auto_644816 ?auto_644821 ) ) ( not ( = ?auto_644816 ?auto_644822 ) ) ( not ( = ?auto_644816 ?auto_644823 ) ) ( not ( = ?auto_644816 ?auto_644824 ) ) ( not ( = ?auto_644816 ?auto_644825 ) ) ( not ( = ?auto_644816 ?auto_644826 ) ) ( not ( = ?auto_644816 ?auto_644827 ) ) ( not ( = ?auto_644816 ?auto_644828 ) ) ( not ( = ?auto_644817 ?auto_644818 ) ) ( not ( = ?auto_644817 ?auto_644819 ) ) ( not ( = ?auto_644817 ?auto_644820 ) ) ( not ( = ?auto_644817 ?auto_644821 ) ) ( not ( = ?auto_644817 ?auto_644822 ) ) ( not ( = ?auto_644817 ?auto_644823 ) ) ( not ( = ?auto_644817 ?auto_644824 ) ) ( not ( = ?auto_644817 ?auto_644825 ) ) ( not ( = ?auto_644817 ?auto_644826 ) ) ( not ( = ?auto_644817 ?auto_644827 ) ) ( not ( = ?auto_644817 ?auto_644828 ) ) ( not ( = ?auto_644818 ?auto_644819 ) ) ( not ( = ?auto_644818 ?auto_644820 ) ) ( not ( = ?auto_644818 ?auto_644821 ) ) ( not ( = ?auto_644818 ?auto_644822 ) ) ( not ( = ?auto_644818 ?auto_644823 ) ) ( not ( = ?auto_644818 ?auto_644824 ) ) ( not ( = ?auto_644818 ?auto_644825 ) ) ( not ( = ?auto_644818 ?auto_644826 ) ) ( not ( = ?auto_644818 ?auto_644827 ) ) ( not ( = ?auto_644818 ?auto_644828 ) ) ( not ( = ?auto_644819 ?auto_644820 ) ) ( not ( = ?auto_644819 ?auto_644821 ) ) ( not ( = ?auto_644819 ?auto_644822 ) ) ( not ( = ?auto_644819 ?auto_644823 ) ) ( not ( = ?auto_644819 ?auto_644824 ) ) ( not ( = ?auto_644819 ?auto_644825 ) ) ( not ( = ?auto_644819 ?auto_644826 ) ) ( not ( = ?auto_644819 ?auto_644827 ) ) ( not ( = ?auto_644819 ?auto_644828 ) ) ( not ( = ?auto_644820 ?auto_644821 ) ) ( not ( = ?auto_644820 ?auto_644822 ) ) ( not ( = ?auto_644820 ?auto_644823 ) ) ( not ( = ?auto_644820 ?auto_644824 ) ) ( not ( = ?auto_644820 ?auto_644825 ) ) ( not ( = ?auto_644820 ?auto_644826 ) ) ( not ( = ?auto_644820 ?auto_644827 ) ) ( not ( = ?auto_644820 ?auto_644828 ) ) ( not ( = ?auto_644821 ?auto_644822 ) ) ( not ( = ?auto_644821 ?auto_644823 ) ) ( not ( = ?auto_644821 ?auto_644824 ) ) ( not ( = ?auto_644821 ?auto_644825 ) ) ( not ( = ?auto_644821 ?auto_644826 ) ) ( not ( = ?auto_644821 ?auto_644827 ) ) ( not ( = ?auto_644821 ?auto_644828 ) ) ( not ( = ?auto_644822 ?auto_644823 ) ) ( not ( = ?auto_644822 ?auto_644824 ) ) ( not ( = ?auto_644822 ?auto_644825 ) ) ( not ( = ?auto_644822 ?auto_644826 ) ) ( not ( = ?auto_644822 ?auto_644827 ) ) ( not ( = ?auto_644822 ?auto_644828 ) ) ( not ( = ?auto_644823 ?auto_644824 ) ) ( not ( = ?auto_644823 ?auto_644825 ) ) ( not ( = ?auto_644823 ?auto_644826 ) ) ( not ( = ?auto_644823 ?auto_644827 ) ) ( not ( = ?auto_644823 ?auto_644828 ) ) ( not ( = ?auto_644824 ?auto_644825 ) ) ( not ( = ?auto_644824 ?auto_644826 ) ) ( not ( = ?auto_644824 ?auto_644827 ) ) ( not ( = ?auto_644824 ?auto_644828 ) ) ( not ( = ?auto_644825 ?auto_644826 ) ) ( not ( = ?auto_644825 ?auto_644827 ) ) ( not ( = ?auto_644825 ?auto_644828 ) ) ( not ( = ?auto_644826 ?auto_644827 ) ) ( not ( = ?auto_644826 ?auto_644828 ) ) ( not ( = ?auto_644827 ?auto_644828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_644827 ?auto_644828 )
      ( !STACK ?auto_644827 ?auto_644826 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_644866 - BLOCK
      ?auto_644867 - BLOCK
      ?auto_644868 - BLOCK
      ?auto_644869 - BLOCK
      ?auto_644870 - BLOCK
      ?auto_644871 - BLOCK
      ?auto_644872 - BLOCK
      ?auto_644873 - BLOCK
      ?auto_644874 - BLOCK
      ?auto_644875 - BLOCK
      ?auto_644876 - BLOCK
      ?auto_644877 - BLOCK
    )
    :vars
    (
      ?auto_644878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644877 ?auto_644878 ) ( ON-TABLE ?auto_644866 ) ( ON ?auto_644867 ?auto_644866 ) ( ON ?auto_644868 ?auto_644867 ) ( ON ?auto_644869 ?auto_644868 ) ( ON ?auto_644870 ?auto_644869 ) ( ON ?auto_644871 ?auto_644870 ) ( ON ?auto_644872 ?auto_644871 ) ( ON ?auto_644873 ?auto_644872 ) ( ON ?auto_644874 ?auto_644873 ) ( ON ?auto_644875 ?auto_644874 ) ( not ( = ?auto_644866 ?auto_644867 ) ) ( not ( = ?auto_644866 ?auto_644868 ) ) ( not ( = ?auto_644866 ?auto_644869 ) ) ( not ( = ?auto_644866 ?auto_644870 ) ) ( not ( = ?auto_644866 ?auto_644871 ) ) ( not ( = ?auto_644866 ?auto_644872 ) ) ( not ( = ?auto_644866 ?auto_644873 ) ) ( not ( = ?auto_644866 ?auto_644874 ) ) ( not ( = ?auto_644866 ?auto_644875 ) ) ( not ( = ?auto_644866 ?auto_644876 ) ) ( not ( = ?auto_644866 ?auto_644877 ) ) ( not ( = ?auto_644866 ?auto_644878 ) ) ( not ( = ?auto_644867 ?auto_644868 ) ) ( not ( = ?auto_644867 ?auto_644869 ) ) ( not ( = ?auto_644867 ?auto_644870 ) ) ( not ( = ?auto_644867 ?auto_644871 ) ) ( not ( = ?auto_644867 ?auto_644872 ) ) ( not ( = ?auto_644867 ?auto_644873 ) ) ( not ( = ?auto_644867 ?auto_644874 ) ) ( not ( = ?auto_644867 ?auto_644875 ) ) ( not ( = ?auto_644867 ?auto_644876 ) ) ( not ( = ?auto_644867 ?auto_644877 ) ) ( not ( = ?auto_644867 ?auto_644878 ) ) ( not ( = ?auto_644868 ?auto_644869 ) ) ( not ( = ?auto_644868 ?auto_644870 ) ) ( not ( = ?auto_644868 ?auto_644871 ) ) ( not ( = ?auto_644868 ?auto_644872 ) ) ( not ( = ?auto_644868 ?auto_644873 ) ) ( not ( = ?auto_644868 ?auto_644874 ) ) ( not ( = ?auto_644868 ?auto_644875 ) ) ( not ( = ?auto_644868 ?auto_644876 ) ) ( not ( = ?auto_644868 ?auto_644877 ) ) ( not ( = ?auto_644868 ?auto_644878 ) ) ( not ( = ?auto_644869 ?auto_644870 ) ) ( not ( = ?auto_644869 ?auto_644871 ) ) ( not ( = ?auto_644869 ?auto_644872 ) ) ( not ( = ?auto_644869 ?auto_644873 ) ) ( not ( = ?auto_644869 ?auto_644874 ) ) ( not ( = ?auto_644869 ?auto_644875 ) ) ( not ( = ?auto_644869 ?auto_644876 ) ) ( not ( = ?auto_644869 ?auto_644877 ) ) ( not ( = ?auto_644869 ?auto_644878 ) ) ( not ( = ?auto_644870 ?auto_644871 ) ) ( not ( = ?auto_644870 ?auto_644872 ) ) ( not ( = ?auto_644870 ?auto_644873 ) ) ( not ( = ?auto_644870 ?auto_644874 ) ) ( not ( = ?auto_644870 ?auto_644875 ) ) ( not ( = ?auto_644870 ?auto_644876 ) ) ( not ( = ?auto_644870 ?auto_644877 ) ) ( not ( = ?auto_644870 ?auto_644878 ) ) ( not ( = ?auto_644871 ?auto_644872 ) ) ( not ( = ?auto_644871 ?auto_644873 ) ) ( not ( = ?auto_644871 ?auto_644874 ) ) ( not ( = ?auto_644871 ?auto_644875 ) ) ( not ( = ?auto_644871 ?auto_644876 ) ) ( not ( = ?auto_644871 ?auto_644877 ) ) ( not ( = ?auto_644871 ?auto_644878 ) ) ( not ( = ?auto_644872 ?auto_644873 ) ) ( not ( = ?auto_644872 ?auto_644874 ) ) ( not ( = ?auto_644872 ?auto_644875 ) ) ( not ( = ?auto_644872 ?auto_644876 ) ) ( not ( = ?auto_644872 ?auto_644877 ) ) ( not ( = ?auto_644872 ?auto_644878 ) ) ( not ( = ?auto_644873 ?auto_644874 ) ) ( not ( = ?auto_644873 ?auto_644875 ) ) ( not ( = ?auto_644873 ?auto_644876 ) ) ( not ( = ?auto_644873 ?auto_644877 ) ) ( not ( = ?auto_644873 ?auto_644878 ) ) ( not ( = ?auto_644874 ?auto_644875 ) ) ( not ( = ?auto_644874 ?auto_644876 ) ) ( not ( = ?auto_644874 ?auto_644877 ) ) ( not ( = ?auto_644874 ?auto_644878 ) ) ( not ( = ?auto_644875 ?auto_644876 ) ) ( not ( = ?auto_644875 ?auto_644877 ) ) ( not ( = ?auto_644875 ?auto_644878 ) ) ( not ( = ?auto_644876 ?auto_644877 ) ) ( not ( = ?auto_644876 ?auto_644878 ) ) ( not ( = ?auto_644877 ?auto_644878 ) ) ( CLEAR ?auto_644875 ) ( ON ?auto_644876 ?auto_644877 ) ( CLEAR ?auto_644876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_644866 ?auto_644867 ?auto_644868 ?auto_644869 ?auto_644870 ?auto_644871 ?auto_644872 ?auto_644873 ?auto_644874 ?auto_644875 ?auto_644876 )
      ( MAKE-12PILE ?auto_644866 ?auto_644867 ?auto_644868 ?auto_644869 ?auto_644870 ?auto_644871 ?auto_644872 ?auto_644873 ?auto_644874 ?auto_644875 ?auto_644876 ?auto_644877 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_644916 - BLOCK
      ?auto_644917 - BLOCK
      ?auto_644918 - BLOCK
      ?auto_644919 - BLOCK
      ?auto_644920 - BLOCK
      ?auto_644921 - BLOCK
      ?auto_644922 - BLOCK
      ?auto_644923 - BLOCK
      ?auto_644924 - BLOCK
      ?auto_644925 - BLOCK
      ?auto_644926 - BLOCK
      ?auto_644927 - BLOCK
    )
    :vars
    (
      ?auto_644928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644927 ?auto_644928 ) ( ON-TABLE ?auto_644916 ) ( ON ?auto_644917 ?auto_644916 ) ( ON ?auto_644918 ?auto_644917 ) ( ON ?auto_644919 ?auto_644918 ) ( ON ?auto_644920 ?auto_644919 ) ( ON ?auto_644921 ?auto_644920 ) ( ON ?auto_644922 ?auto_644921 ) ( ON ?auto_644923 ?auto_644922 ) ( ON ?auto_644924 ?auto_644923 ) ( not ( = ?auto_644916 ?auto_644917 ) ) ( not ( = ?auto_644916 ?auto_644918 ) ) ( not ( = ?auto_644916 ?auto_644919 ) ) ( not ( = ?auto_644916 ?auto_644920 ) ) ( not ( = ?auto_644916 ?auto_644921 ) ) ( not ( = ?auto_644916 ?auto_644922 ) ) ( not ( = ?auto_644916 ?auto_644923 ) ) ( not ( = ?auto_644916 ?auto_644924 ) ) ( not ( = ?auto_644916 ?auto_644925 ) ) ( not ( = ?auto_644916 ?auto_644926 ) ) ( not ( = ?auto_644916 ?auto_644927 ) ) ( not ( = ?auto_644916 ?auto_644928 ) ) ( not ( = ?auto_644917 ?auto_644918 ) ) ( not ( = ?auto_644917 ?auto_644919 ) ) ( not ( = ?auto_644917 ?auto_644920 ) ) ( not ( = ?auto_644917 ?auto_644921 ) ) ( not ( = ?auto_644917 ?auto_644922 ) ) ( not ( = ?auto_644917 ?auto_644923 ) ) ( not ( = ?auto_644917 ?auto_644924 ) ) ( not ( = ?auto_644917 ?auto_644925 ) ) ( not ( = ?auto_644917 ?auto_644926 ) ) ( not ( = ?auto_644917 ?auto_644927 ) ) ( not ( = ?auto_644917 ?auto_644928 ) ) ( not ( = ?auto_644918 ?auto_644919 ) ) ( not ( = ?auto_644918 ?auto_644920 ) ) ( not ( = ?auto_644918 ?auto_644921 ) ) ( not ( = ?auto_644918 ?auto_644922 ) ) ( not ( = ?auto_644918 ?auto_644923 ) ) ( not ( = ?auto_644918 ?auto_644924 ) ) ( not ( = ?auto_644918 ?auto_644925 ) ) ( not ( = ?auto_644918 ?auto_644926 ) ) ( not ( = ?auto_644918 ?auto_644927 ) ) ( not ( = ?auto_644918 ?auto_644928 ) ) ( not ( = ?auto_644919 ?auto_644920 ) ) ( not ( = ?auto_644919 ?auto_644921 ) ) ( not ( = ?auto_644919 ?auto_644922 ) ) ( not ( = ?auto_644919 ?auto_644923 ) ) ( not ( = ?auto_644919 ?auto_644924 ) ) ( not ( = ?auto_644919 ?auto_644925 ) ) ( not ( = ?auto_644919 ?auto_644926 ) ) ( not ( = ?auto_644919 ?auto_644927 ) ) ( not ( = ?auto_644919 ?auto_644928 ) ) ( not ( = ?auto_644920 ?auto_644921 ) ) ( not ( = ?auto_644920 ?auto_644922 ) ) ( not ( = ?auto_644920 ?auto_644923 ) ) ( not ( = ?auto_644920 ?auto_644924 ) ) ( not ( = ?auto_644920 ?auto_644925 ) ) ( not ( = ?auto_644920 ?auto_644926 ) ) ( not ( = ?auto_644920 ?auto_644927 ) ) ( not ( = ?auto_644920 ?auto_644928 ) ) ( not ( = ?auto_644921 ?auto_644922 ) ) ( not ( = ?auto_644921 ?auto_644923 ) ) ( not ( = ?auto_644921 ?auto_644924 ) ) ( not ( = ?auto_644921 ?auto_644925 ) ) ( not ( = ?auto_644921 ?auto_644926 ) ) ( not ( = ?auto_644921 ?auto_644927 ) ) ( not ( = ?auto_644921 ?auto_644928 ) ) ( not ( = ?auto_644922 ?auto_644923 ) ) ( not ( = ?auto_644922 ?auto_644924 ) ) ( not ( = ?auto_644922 ?auto_644925 ) ) ( not ( = ?auto_644922 ?auto_644926 ) ) ( not ( = ?auto_644922 ?auto_644927 ) ) ( not ( = ?auto_644922 ?auto_644928 ) ) ( not ( = ?auto_644923 ?auto_644924 ) ) ( not ( = ?auto_644923 ?auto_644925 ) ) ( not ( = ?auto_644923 ?auto_644926 ) ) ( not ( = ?auto_644923 ?auto_644927 ) ) ( not ( = ?auto_644923 ?auto_644928 ) ) ( not ( = ?auto_644924 ?auto_644925 ) ) ( not ( = ?auto_644924 ?auto_644926 ) ) ( not ( = ?auto_644924 ?auto_644927 ) ) ( not ( = ?auto_644924 ?auto_644928 ) ) ( not ( = ?auto_644925 ?auto_644926 ) ) ( not ( = ?auto_644925 ?auto_644927 ) ) ( not ( = ?auto_644925 ?auto_644928 ) ) ( not ( = ?auto_644926 ?auto_644927 ) ) ( not ( = ?auto_644926 ?auto_644928 ) ) ( not ( = ?auto_644927 ?auto_644928 ) ) ( ON ?auto_644926 ?auto_644927 ) ( CLEAR ?auto_644924 ) ( ON ?auto_644925 ?auto_644926 ) ( CLEAR ?auto_644925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_644916 ?auto_644917 ?auto_644918 ?auto_644919 ?auto_644920 ?auto_644921 ?auto_644922 ?auto_644923 ?auto_644924 ?auto_644925 )
      ( MAKE-12PILE ?auto_644916 ?auto_644917 ?auto_644918 ?auto_644919 ?auto_644920 ?auto_644921 ?auto_644922 ?auto_644923 ?auto_644924 ?auto_644925 ?auto_644926 ?auto_644927 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_644966 - BLOCK
      ?auto_644967 - BLOCK
      ?auto_644968 - BLOCK
      ?auto_644969 - BLOCK
      ?auto_644970 - BLOCK
      ?auto_644971 - BLOCK
      ?auto_644972 - BLOCK
      ?auto_644973 - BLOCK
      ?auto_644974 - BLOCK
      ?auto_644975 - BLOCK
      ?auto_644976 - BLOCK
      ?auto_644977 - BLOCK
    )
    :vars
    (
      ?auto_644978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_644977 ?auto_644978 ) ( ON-TABLE ?auto_644966 ) ( ON ?auto_644967 ?auto_644966 ) ( ON ?auto_644968 ?auto_644967 ) ( ON ?auto_644969 ?auto_644968 ) ( ON ?auto_644970 ?auto_644969 ) ( ON ?auto_644971 ?auto_644970 ) ( ON ?auto_644972 ?auto_644971 ) ( ON ?auto_644973 ?auto_644972 ) ( not ( = ?auto_644966 ?auto_644967 ) ) ( not ( = ?auto_644966 ?auto_644968 ) ) ( not ( = ?auto_644966 ?auto_644969 ) ) ( not ( = ?auto_644966 ?auto_644970 ) ) ( not ( = ?auto_644966 ?auto_644971 ) ) ( not ( = ?auto_644966 ?auto_644972 ) ) ( not ( = ?auto_644966 ?auto_644973 ) ) ( not ( = ?auto_644966 ?auto_644974 ) ) ( not ( = ?auto_644966 ?auto_644975 ) ) ( not ( = ?auto_644966 ?auto_644976 ) ) ( not ( = ?auto_644966 ?auto_644977 ) ) ( not ( = ?auto_644966 ?auto_644978 ) ) ( not ( = ?auto_644967 ?auto_644968 ) ) ( not ( = ?auto_644967 ?auto_644969 ) ) ( not ( = ?auto_644967 ?auto_644970 ) ) ( not ( = ?auto_644967 ?auto_644971 ) ) ( not ( = ?auto_644967 ?auto_644972 ) ) ( not ( = ?auto_644967 ?auto_644973 ) ) ( not ( = ?auto_644967 ?auto_644974 ) ) ( not ( = ?auto_644967 ?auto_644975 ) ) ( not ( = ?auto_644967 ?auto_644976 ) ) ( not ( = ?auto_644967 ?auto_644977 ) ) ( not ( = ?auto_644967 ?auto_644978 ) ) ( not ( = ?auto_644968 ?auto_644969 ) ) ( not ( = ?auto_644968 ?auto_644970 ) ) ( not ( = ?auto_644968 ?auto_644971 ) ) ( not ( = ?auto_644968 ?auto_644972 ) ) ( not ( = ?auto_644968 ?auto_644973 ) ) ( not ( = ?auto_644968 ?auto_644974 ) ) ( not ( = ?auto_644968 ?auto_644975 ) ) ( not ( = ?auto_644968 ?auto_644976 ) ) ( not ( = ?auto_644968 ?auto_644977 ) ) ( not ( = ?auto_644968 ?auto_644978 ) ) ( not ( = ?auto_644969 ?auto_644970 ) ) ( not ( = ?auto_644969 ?auto_644971 ) ) ( not ( = ?auto_644969 ?auto_644972 ) ) ( not ( = ?auto_644969 ?auto_644973 ) ) ( not ( = ?auto_644969 ?auto_644974 ) ) ( not ( = ?auto_644969 ?auto_644975 ) ) ( not ( = ?auto_644969 ?auto_644976 ) ) ( not ( = ?auto_644969 ?auto_644977 ) ) ( not ( = ?auto_644969 ?auto_644978 ) ) ( not ( = ?auto_644970 ?auto_644971 ) ) ( not ( = ?auto_644970 ?auto_644972 ) ) ( not ( = ?auto_644970 ?auto_644973 ) ) ( not ( = ?auto_644970 ?auto_644974 ) ) ( not ( = ?auto_644970 ?auto_644975 ) ) ( not ( = ?auto_644970 ?auto_644976 ) ) ( not ( = ?auto_644970 ?auto_644977 ) ) ( not ( = ?auto_644970 ?auto_644978 ) ) ( not ( = ?auto_644971 ?auto_644972 ) ) ( not ( = ?auto_644971 ?auto_644973 ) ) ( not ( = ?auto_644971 ?auto_644974 ) ) ( not ( = ?auto_644971 ?auto_644975 ) ) ( not ( = ?auto_644971 ?auto_644976 ) ) ( not ( = ?auto_644971 ?auto_644977 ) ) ( not ( = ?auto_644971 ?auto_644978 ) ) ( not ( = ?auto_644972 ?auto_644973 ) ) ( not ( = ?auto_644972 ?auto_644974 ) ) ( not ( = ?auto_644972 ?auto_644975 ) ) ( not ( = ?auto_644972 ?auto_644976 ) ) ( not ( = ?auto_644972 ?auto_644977 ) ) ( not ( = ?auto_644972 ?auto_644978 ) ) ( not ( = ?auto_644973 ?auto_644974 ) ) ( not ( = ?auto_644973 ?auto_644975 ) ) ( not ( = ?auto_644973 ?auto_644976 ) ) ( not ( = ?auto_644973 ?auto_644977 ) ) ( not ( = ?auto_644973 ?auto_644978 ) ) ( not ( = ?auto_644974 ?auto_644975 ) ) ( not ( = ?auto_644974 ?auto_644976 ) ) ( not ( = ?auto_644974 ?auto_644977 ) ) ( not ( = ?auto_644974 ?auto_644978 ) ) ( not ( = ?auto_644975 ?auto_644976 ) ) ( not ( = ?auto_644975 ?auto_644977 ) ) ( not ( = ?auto_644975 ?auto_644978 ) ) ( not ( = ?auto_644976 ?auto_644977 ) ) ( not ( = ?auto_644976 ?auto_644978 ) ) ( not ( = ?auto_644977 ?auto_644978 ) ) ( ON ?auto_644976 ?auto_644977 ) ( ON ?auto_644975 ?auto_644976 ) ( CLEAR ?auto_644973 ) ( ON ?auto_644974 ?auto_644975 ) ( CLEAR ?auto_644974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_644966 ?auto_644967 ?auto_644968 ?auto_644969 ?auto_644970 ?auto_644971 ?auto_644972 ?auto_644973 ?auto_644974 )
      ( MAKE-12PILE ?auto_644966 ?auto_644967 ?auto_644968 ?auto_644969 ?auto_644970 ?auto_644971 ?auto_644972 ?auto_644973 ?auto_644974 ?auto_644975 ?auto_644976 ?auto_644977 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645016 - BLOCK
      ?auto_645017 - BLOCK
      ?auto_645018 - BLOCK
      ?auto_645019 - BLOCK
      ?auto_645020 - BLOCK
      ?auto_645021 - BLOCK
      ?auto_645022 - BLOCK
      ?auto_645023 - BLOCK
      ?auto_645024 - BLOCK
      ?auto_645025 - BLOCK
      ?auto_645026 - BLOCK
      ?auto_645027 - BLOCK
    )
    :vars
    (
      ?auto_645028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645027 ?auto_645028 ) ( ON-TABLE ?auto_645016 ) ( ON ?auto_645017 ?auto_645016 ) ( ON ?auto_645018 ?auto_645017 ) ( ON ?auto_645019 ?auto_645018 ) ( ON ?auto_645020 ?auto_645019 ) ( ON ?auto_645021 ?auto_645020 ) ( ON ?auto_645022 ?auto_645021 ) ( not ( = ?auto_645016 ?auto_645017 ) ) ( not ( = ?auto_645016 ?auto_645018 ) ) ( not ( = ?auto_645016 ?auto_645019 ) ) ( not ( = ?auto_645016 ?auto_645020 ) ) ( not ( = ?auto_645016 ?auto_645021 ) ) ( not ( = ?auto_645016 ?auto_645022 ) ) ( not ( = ?auto_645016 ?auto_645023 ) ) ( not ( = ?auto_645016 ?auto_645024 ) ) ( not ( = ?auto_645016 ?auto_645025 ) ) ( not ( = ?auto_645016 ?auto_645026 ) ) ( not ( = ?auto_645016 ?auto_645027 ) ) ( not ( = ?auto_645016 ?auto_645028 ) ) ( not ( = ?auto_645017 ?auto_645018 ) ) ( not ( = ?auto_645017 ?auto_645019 ) ) ( not ( = ?auto_645017 ?auto_645020 ) ) ( not ( = ?auto_645017 ?auto_645021 ) ) ( not ( = ?auto_645017 ?auto_645022 ) ) ( not ( = ?auto_645017 ?auto_645023 ) ) ( not ( = ?auto_645017 ?auto_645024 ) ) ( not ( = ?auto_645017 ?auto_645025 ) ) ( not ( = ?auto_645017 ?auto_645026 ) ) ( not ( = ?auto_645017 ?auto_645027 ) ) ( not ( = ?auto_645017 ?auto_645028 ) ) ( not ( = ?auto_645018 ?auto_645019 ) ) ( not ( = ?auto_645018 ?auto_645020 ) ) ( not ( = ?auto_645018 ?auto_645021 ) ) ( not ( = ?auto_645018 ?auto_645022 ) ) ( not ( = ?auto_645018 ?auto_645023 ) ) ( not ( = ?auto_645018 ?auto_645024 ) ) ( not ( = ?auto_645018 ?auto_645025 ) ) ( not ( = ?auto_645018 ?auto_645026 ) ) ( not ( = ?auto_645018 ?auto_645027 ) ) ( not ( = ?auto_645018 ?auto_645028 ) ) ( not ( = ?auto_645019 ?auto_645020 ) ) ( not ( = ?auto_645019 ?auto_645021 ) ) ( not ( = ?auto_645019 ?auto_645022 ) ) ( not ( = ?auto_645019 ?auto_645023 ) ) ( not ( = ?auto_645019 ?auto_645024 ) ) ( not ( = ?auto_645019 ?auto_645025 ) ) ( not ( = ?auto_645019 ?auto_645026 ) ) ( not ( = ?auto_645019 ?auto_645027 ) ) ( not ( = ?auto_645019 ?auto_645028 ) ) ( not ( = ?auto_645020 ?auto_645021 ) ) ( not ( = ?auto_645020 ?auto_645022 ) ) ( not ( = ?auto_645020 ?auto_645023 ) ) ( not ( = ?auto_645020 ?auto_645024 ) ) ( not ( = ?auto_645020 ?auto_645025 ) ) ( not ( = ?auto_645020 ?auto_645026 ) ) ( not ( = ?auto_645020 ?auto_645027 ) ) ( not ( = ?auto_645020 ?auto_645028 ) ) ( not ( = ?auto_645021 ?auto_645022 ) ) ( not ( = ?auto_645021 ?auto_645023 ) ) ( not ( = ?auto_645021 ?auto_645024 ) ) ( not ( = ?auto_645021 ?auto_645025 ) ) ( not ( = ?auto_645021 ?auto_645026 ) ) ( not ( = ?auto_645021 ?auto_645027 ) ) ( not ( = ?auto_645021 ?auto_645028 ) ) ( not ( = ?auto_645022 ?auto_645023 ) ) ( not ( = ?auto_645022 ?auto_645024 ) ) ( not ( = ?auto_645022 ?auto_645025 ) ) ( not ( = ?auto_645022 ?auto_645026 ) ) ( not ( = ?auto_645022 ?auto_645027 ) ) ( not ( = ?auto_645022 ?auto_645028 ) ) ( not ( = ?auto_645023 ?auto_645024 ) ) ( not ( = ?auto_645023 ?auto_645025 ) ) ( not ( = ?auto_645023 ?auto_645026 ) ) ( not ( = ?auto_645023 ?auto_645027 ) ) ( not ( = ?auto_645023 ?auto_645028 ) ) ( not ( = ?auto_645024 ?auto_645025 ) ) ( not ( = ?auto_645024 ?auto_645026 ) ) ( not ( = ?auto_645024 ?auto_645027 ) ) ( not ( = ?auto_645024 ?auto_645028 ) ) ( not ( = ?auto_645025 ?auto_645026 ) ) ( not ( = ?auto_645025 ?auto_645027 ) ) ( not ( = ?auto_645025 ?auto_645028 ) ) ( not ( = ?auto_645026 ?auto_645027 ) ) ( not ( = ?auto_645026 ?auto_645028 ) ) ( not ( = ?auto_645027 ?auto_645028 ) ) ( ON ?auto_645026 ?auto_645027 ) ( ON ?auto_645025 ?auto_645026 ) ( ON ?auto_645024 ?auto_645025 ) ( CLEAR ?auto_645022 ) ( ON ?auto_645023 ?auto_645024 ) ( CLEAR ?auto_645023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_645016 ?auto_645017 ?auto_645018 ?auto_645019 ?auto_645020 ?auto_645021 ?auto_645022 ?auto_645023 )
      ( MAKE-12PILE ?auto_645016 ?auto_645017 ?auto_645018 ?auto_645019 ?auto_645020 ?auto_645021 ?auto_645022 ?auto_645023 ?auto_645024 ?auto_645025 ?auto_645026 ?auto_645027 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645066 - BLOCK
      ?auto_645067 - BLOCK
      ?auto_645068 - BLOCK
      ?auto_645069 - BLOCK
      ?auto_645070 - BLOCK
      ?auto_645071 - BLOCK
      ?auto_645072 - BLOCK
      ?auto_645073 - BLOCK
      ?auto_645074 - BLOCK
      ?auto_645075 - BLOCK
      ?auto_645076 - BLOCK
      ?auto_645077 - BLOCK
    )
    :vars
    (
      ?auto_645078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645077 ?auto_645078 ) ( ON-TABLE ?auto_645066 ) ( ON ?auto_645067 ?auto_645066 ) ( ON ?auto_645068 ?auto_645067 ) ( ON ?auto_645069 ?auto_645068 ) ( ON ?auto_645070 ?auto_645069 ) ( ON ?auto_645071 ?auto_645070 ) ( not ( = ?auto_645066 ?auto_645067 ) ) ( not ( = ?auto_645066 ?auto_645068 ) ) ( not ( = ?auto_645066 ?auto_645069 ) ) ( not ( = ?auto_645066 ?auto_645070 ) ) ( not ( = ?auto_645066 ?auto_645071 ) ) ( not ( = ?auto_645066 ?auto_645072 ) ) ( not ( = ?auto_645066 ?auto_645073 ) ) ( not ( = ?auto_645066 ?auto_645074 ) ) ( not ( = ?auto_645066 ?auto_645075 ) ) ( not ( = ?auto_645066 ?auto_645076 ) ) ( not ( = ?auto_645066 ?auto_645077 ) ) ( not ( = ?auto_645066 ?auto_645078 ) ) ( not ( = ?auto_645067 ?auto_645068 ) ) ( not ( = ?auto_645067 ?auto_645069 ) ) ( not ( = ?auto_645067 ?auto_645070 ) ) ( not ( = ?auto_645067 ?auto_645071 ) ) ( not ( = ?auto_645067 ?auto_645072 ) ) ( not ( = ?auto_645067 ?auto_645073 ) ) ( not ( = ?auto_645067 ?auto_645074 ) ) ( not ( = ?auto_645067 ?auto_645075 ) ) ( not ( = ?auto_645067 ?auto_645076 ) ) ( not ( = ?auto_645067 ?auto_645077 ) ) ( not ( = ?auto_645067 ?auto_645078 ) ) ( not ( = ?auto_645068 ?auto_645069 ) ) ( not ( = ?auto_645068 ?auto_645070 ) ) ( not ( = ?auto_645068 ?auto_645071 ) ) ( not ( = ?auto_645068 ?auto_645072 ) ) ( not ( = ?auto_645068 ?auto_645073 ) ) ( not ( = ?auto_645068 ?auto_645074 ) ) ( not ( = ?auto_645068 ?auto_645075 ) ) ( not ( = ?auto_645068 ?auto_645076 ) ) ( not ( = ?auto_645068 ?auto_645077 ) ) ( not ( = ?auto_645068 ?auto_645078 ) ) ( not ( = ?auto_645069 ?auto_645070 ) ) ( not ( = ?auto_645069 ?auto_645071 ) ) ( not ( = ?auto_645069 ?auto_645072 ) ) ( not ( = ?auto_645069 ?auto_645073 ) ) ( not ( = ?auto_645069 ?auto_645074 ) ) ( not ( = ?auto_645069 ?auto_645075 ) ) ( not ( = ?auto_645069 ?auto_645076 ) ) ( not ( = ?auto_645069 ?auto_645077 ) ) ( not ( = ?auto_645069 ?auto_645078 ) ) ( not ( = ?auto_645070 ?auto_645071 ) ) ( not ( = ?auto_645070 ?auto_645072 ) ) ( not ( = ?auto_645070 ?auto_645073 ) ) ( not ( = ?auto_645070 ?auto_645074 ) ) ( not ( = ?auto_645070 ?auto_645075 ) ) ( not ( = ?auto_645070 ?auto_645076 ) ) ( not ( = ?auto_645070 ?auto_645077 ) ) ( not ( = ?auto_645070 ?auto_645078 ) ) ( not ( = ?auto_645071 ?auto_645072 ) ) ( not ( = ?auto_645071 ?auto_645073 ) ) ( not ( = ?auto_645071 ?auto_645074 ) ) ( not ( = ?auto_645071 ?auto_645075 ) ) ( not ( = ?auto_645071 ?auto_645076 ) ) ( not ( = ?auto_645071 ?auto_645077 ) ) ( not ( = ?auto_645071 ?auto_645078 ) ) ( not ( = ?auto_645072 ?auto_645073 ) ) ( not ( = ?auto_645072 ?auto_645074 ) ) ( not ( = ?auto_645072 ?auto_645075 ) ) ( not ( = ?auto_645072 ?auto_645076 ) ) ( not ( = ?auto_645072 ?auto_645077 ) ) ( not ( = ?auto_645072 ?auto_645078 ) ) ( not ( = ?auto_645073 ?auto_645074 ) ) ( not ( = ?auto_645073 ?auto_645075 ) ) ( not ( = ?auto_645073 ?auto_645076 ) ) ( not ( = ?auto_645073 ?auto_645077 ) ) ( not ( = ?auto_645073 ?auto_645078 ) ) ( not ( = ?auto_645074 ?auto_645075 ) ) ( not ( = ?auto_645074 ?auto_645076 ) ) ( not ( = ?auto_645074 ?auto_645077 ) ) ( not ( = ?auto_645074 ?auto_645078 ) ) ( not ( = ?auto_645075 ?auto_645076 ) ) ( not ( = ?auto_645075 ?auto_645077 ) ) ( not ( = ?auto_645075 ?auto_645078 ) ) ( not ( = ?auto_645076 ?auto_645077 ) ) ( not ( = ?auto_645076 ?auto_645078 ) ) ( not ( = ?auto_645077 ?auto_645078 ) ) ( ON ?auto_645076 ?auto_645077 ) ( ON ?auto_645075 ?auto_645076 ) ( ON ?auto_645074 ?auto_645075 ) ( ON ?auto_645073 ?auto_645074 ) ( CLEAR ?auto_645071 ) ( ON ?auto_645072 ?auto_645073 ) ( CLEAR ?auto_645072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_645066 ?auto_645067 ?auto_645068 ?auto_645069 ?auto_645070 ?auto_645071 ?auto_645072 )
      ( MAKE-12PILE ?auto_645066 ?auto_645067 ?auto_645068 ?auto_645069 ?auto_645070 ?auto_645071 ?auto_645072 ?auto_645073 ?auto_645074 ?auto_645075 ?auto_645076 ?auto_645077 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645116 - BLOCK
      ?auto_645117 - BLOCK
      ?auto_645118 - BLOCK
      ?auto_645119 - BLOCK
      ?auto_645120 - BLOCK
      ?auto_645121 - BLOCK
      ?auto_645122 - BLOCK
      ?auto_645123 - BLOCK
      ?auto_645124 - BLOCK
      ?auto_645125 - BLOCK
      ?auto_645126 - BLOCK
      ?auto_645127 - BLOCK
    )
    :vars
    (
      ?auto_645128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645127 ?auto_645128 ) ( ON-TABLE ?auto_645116 ) ( ON ?auto_645117 ?auto_645116 ) ( ON ?auto_645118 ?auto_645117 ) ( ON ?auto_645119 ?auto_645118 ) ( ON ?auto_645120 ?auto_645119 ) ( not ( = ?auto_645116 ?auto_645117 ) ) ( not ( = ?auto_645116 ?auto_645118 ) ) ( not ( = ?auto_645116 ?auto_645119 ) ) ( not ( = ?auto_645116 ?auto_645120 ) ) ( not ( = ?auto_645116 ?auto_645121 ) ) ( not ( = ?auto_645116 ?auto_645122 ) ) ( not ( = ?auto_645116 ?auto_645123 ) ) ( not ( = ?auto_645116 ?auto_645124 ) ) ( not ( = ?auto_645116 ?auto_645125 ) ) ( not ( = ?auto_645116 ?auto_645126 ) ) ( not ( = ?auto_645116 ?auto_645127 ) ) ( not ( = ?auto_645116 ?auto_645128 ) ) ( not ( = ?auto_645117 ?auto_645118 ) ) ( not ( = ?auto_645117 ?auto_645119 ) ) ( not ( = ?auto_645117 ?auto_645120 ) ) ( not ( = ?auto_645117 ?auto_645121 ) ) ( not ( = ?auto_645117 ?auto_645122 ) ) ( not ( = ?auto_645117 ?auto_645123 ) ) ( not ( = ?auto_645117 ?auto_645124 ) ) ( not ( = ?auto_645117 ?auto_645125 ) ) ( not ( = ?auto_645117 ?auto_645126 ) ) ( not ( = ?auto_645117 ?auto_645127 ) ) ( not ( = ?auto_645117 ?auto_645128 ) ) ( not ( = ?auto_645118 ?auto_645119 ) ) ( not ( = ?auto_645118 ?auto_645120 ) ) ( not ( = ?auto_645118 ?auto_645121 ) ) ( not ( = ?auto_645118 ?auto_645122 ) ) ( not ( = ?auto_645118 ?auto_645123 ) ) ( not ( = ?auto_645118 ?auto_645124 ) ) ( not ( = ?auto_645118 ?auto_645125 ) ) ( not ( = ?auto_645118 ?auto_645126 ) ) ( not ( = ?auto_645118 ?auto_645127 ) ) ( not ( = ?auto_645118 ?auto_645128 ) ) ( not ( = ?auto_645119 ?auto_645120 ) ) ( not ( = ?auto_645119 ?auto_645121 ) ) ( not ( = ?auto_645119 ?auto_645122 ) ) ( not ( = ?auto_645119 ?auto_645123 ) ) ( not ( = ?auto_645119 ?auto_645124 ) ) ( not ( = ?auto_645119 ?auto_645125 ) ) ( not ( = ?auto_645119 ?auto_645126 ) ) ( not ( = ?auto_645119 ?auto_645127 ) ) ( not ( = ?auto_645119 ?auto_645128 ) ) ( not ( = ?auto_645120 ?auto_645121 ) ) ( not ( = ?auto_645120 ?auto_645122 ) ) ( not ( = ?auto_645120 ?auto_645123 ) ) ( not ( = ?auto_645120 ?auto_645124 ) ) ( not ( = ?auto_645120 ?auto_645125 ) ) ( not ( = ?auto_645120 ?auto_645126 ) ) ( not ( = ?auto_645120 ?auto_645127 ) ) ( not ( = ?auto_645120 ?auto_645128 ) ) ( not ( = ?auto_645121 ?auto_645122 ) ) ( not ( = ?auto_645121 ?auto_645123 ) ) ( not ( = ?auto_645121 ?auto_645124 ) ) ( not ( = ?auto_645121 ?auto_645125 ) ) ( not ( = ?auto_645121 ?auto_645126 ) ) ( not ( = ?auto_645121 ?auto_645127 ) ) ( not ( = ?auto_645121 ?auto_645128 ) ) ( not ( = ?auto_645122 ?auto_645123 ) ) ( not ( = ?auto_645122 ?auto_645124 ) ) ( not ( = ?auto_645122 ?auto_645125 ) ) ( not ( = ?auto_645122 ?auto_645126 ) ) ( not ( = ?auto_645122 ?auto_645127 ) ) ( not ( = ?auto_645122 ?auto_645128 ) ) ( not ( = ?auto_645123 ?auto_645124 ) ) ( not ( = ?auto_645123 ?auto_645125 ) ) ( not ( = ?auto_645123 ?auto_645126 ) ) ( not ( = ?auto_645123 ?auto_645127 ) ) ( not ( = ?auto_645123 ?auto_645128 ) ) ( not ( = ?auto_645124 ?auto_645125 ) ) ( not ( = ?auto_645124 ?auto_645126 ) ) ( not ( = ?auto_645124 ?auto_645127 ) ) ( not ( = ?auto_645124 ?auto_645128 ) ) ( not ( = ?auto_645125 ?auto_645126 ) ) ( not ( = ?auto_645125 ?auto_645127 ) ) ( not ( = ?auto_645125 ?auto_645128 ) ) ( not ( = ?auto_645126 ?auto_645127 ) ) ( not ( = ?auto_645126 ?auto_645128 ) ) ( not ( = ?auto_645127 ?auto_645128 ) ) ( ON ?auto_645126 ?auto_645127 ) ( ON ?auto_645125 ?auto_645126 ) ( ON ?auto_645124 ?auto_645125 ) ( ON ?auto_645123 ?auto_645124 ) ( ON ?auto_645122 ?auto_645123 ) ( CLEAR ?auto_645120 ) ( ON ?auto_645121 ?auto_645122 ) ( CLEAR ?auto_645121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_645116 ?auto_645117 ?auto_645118 ?auto_645119 ?auto_645120 ?auto_645121 )
      ( MAKE-12PILE ?auto_645116 ?auto_645117 ?auto_645118 ?auto_645119 ?auto_645120 ?auto_645121 ?auto_645122 ?auto_645123 ?auto_645124 ?auto_645125 ?auto_645126 ?auto_645127 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645166 - BLOCK
      ?auto_645167 - BLOCK
      ?auto_645168 - BLOCK
      ?auto_645169 - BLOCK
      ?auto_645170 - BLOCK
      ?auto_645171 - BLOCK
      ?auto_645172 - BLOCK
      ?auto_645173 - BLOCK
      ?auto_645174 - BLOCK
      ?auto_645175 - BLOCK
      ?auto_645176 - BLOCK
      ?auto_645177 - BLOCK
    )
    :vars
    (
      ?auto_645178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645177 ?auto_645178 ) ( ON-TABLE ?auto_645166 ) ( ON ?auto_645167 ?auto_645166 ) ( ON ?auto_645168 ?auto_645167 ) ( ON ?auto_645169 ?auto_645168 ) ( not ( = ?auto_645166 ?auto_645167 ) ) ( not ( = ?auto_645166 ?auto_645168 ) ) ( not ( = ?auto_645166 ?auto_645169 ) ) ( not ( = ?auto_645166 ?auto_645170 ) ) ( not ( = ?auto_645166 ?auto_645171 ) ) ( not ( = ?auto_645166 ?auto_645172 ) ) ( not ( = ?auto_645166 ?auto_645173 ) ) ( not ( = ?auto_645166 ?auto_645174 ) ) ( not ( = ?auto_645166 ?auto_645175 ) ) ( not ( = ?auto_645166 ?auto_645176 ) ) ( not ( = ?auto_645166 ?auto_645177 ) ) ( not ( = ?auto_645166 ?auto_645178 ) ) ( not ( = ?auto_645167 ?auto_645168 ) ) ( not ( = ?auto_645167 ?auto_645169 ) ) ( not ( = ?auto_645167 ?auto_645170 ) ) ( not ( = ?auto_645167 ?auto_645171 ) ) ( not ( = ?auto_645167 ?auto_645172 ) ) ( not ( = ?auto_645167 ?auto_645173 ) ) ( not ( = ?auto_645167 ?auto_645174 ) ) ( not ( = ?auto_645167 ?auto_645175 ) ) ( not ( = ?auto_645167 ?auto_645176 ) ) ( not ( = ?auto_645167 ?auto_645177 ) ) ( not ( = ?auto_645167 ?auto_645178 ) ) ( not ( = ?auto_645168 ?auto_645169 ) ) ( not ( = ?auto_645168 ?auto_645170 ) ) ( not ( = ?auto_645168 ?auto_645171 ) ) ( not ( = ?auto_645168 ?auto_645172 ) ) ( not ( = ?auto_645168 ?auto_645173 ) ) ( not ( = ?auto_645168 ?auto_645174 ) ) ( not ( = ?auto_645168 ?auto_645175 ) ) ( not ( = ?auto_645168 ?auto_645176 ) ) ( not ( = ?auto_645168 ?auto_645177 ) ) ( not ( = ?auto_645168 ?auto_645178 ) ) ( not ( = ?auto_645169 ?auto_645170 ) ) ( not ( = ?auto_645169 ?auto_645171 ) ) ( not ( = ?auto_645169 ?auto_645172 ) ) ( not ( = ?auto_645169 ?auto_645173 ) ) ( not ( = ?auto_645169 ?auto_645174 ) ) ( not ( = ?auto_645169 ?auto_645175 ) ) ( not ( = ?auto_645169 ?auto_645176 ) ) ( not ( = ?auto_645169 ?auto_645177 ) ) ( not ( = ?auto_645169 ?auto_645178 ) ) ( not ( = ?auto_645170 ?auto_645171 ) ) ( not ( = ?auto_645170 ?auto_645172 ) ) ( not ( = ?auto_645170 ?auto_645173 ) ) ( not ( = ?auto_645170 ?auto_645174 ) ) ( not ( = ?auto_645170 ?auto_645175 ) ) ( not ( = ?auto_645170 ?auto_645176 ) ) ( not ( = ?auto_645170 ?auto_645177 ) ) ( not ( = ?auto_645170 ?auto_645178 ) ) ( not ( = ?auto_645171 ?auto_645172 ) ) ( not ( = ?auto_645171 ?auto_645173 ) ) ( not ( = ?auto_645171 ?auto_645174 ) ) ( not ( = ?auto_645171 ?auto_645175 ) ) ( not ( = ?auto_645171 ?auto_645176 ) ) ( not ( = ?auto_645171 ?auto_645177 ) ) ( not ( = ?auto_645171 ?auto_645178 ) ) ( not ( = ?auto_645172 ?auto_645173 ) ) ( not ( = ?auto_645172 ?auto_645174 ) ) ( not ( = ?auto_645172 ?auto_645175 ) ) ( not ( = ?auto_645172 ?auto_645176 ) ) ( not ( = ?auto_645172 ?auto_645177 ) ) ( not ( = ?auto_645172 ?auto_645178 ) ) ( not ( = ?auto_645173 ?auto_645174 ) ) ( not ( = ?auto_645173 ?auto_645175 ) ) ( not ( = ?auto_645173 ?auto_645176 ) ) ( not ( = ?auto_645173 ?auto_645177 ) ) ( not ( = ?auto_645173 ?auto_645178 ) ) ( not ( = ?auto_645174 ?auto_645175 ) ) ( not ( = ?auto_645174 ?auto_645176 ) ) ( not ( = ?auto_645174 ?auto_645177 ) ) ( not ( = ?auto_645174 ?auto_645178 ) ) ( not ( = ?auto_645175 ?auto_645176 ) ) ( not ( = ?auto_645175 ?auto_645177 ) ) ( not ( = ?auto_645175 ?auto_645178 ) ) ( not ( = ?auto_645176 ?auto_645177 ) ) ( not ( = ?auto_645176 ?auto_645178 ) ) ( not ( = ?auto_645177 ?auto_645178 ) ) ( ON ?auto_645176 ?auto_645177 ) ( ON ?auto_645175 ?auto_645176 ) ( ON ?auto_645174 ?auto_645175 ) ( ON ?auto_645173 ?auto_645174 ) ( ON ?auto_645172 ?auto_645173 ) ( ON ?auto_645171 ?auto_645172 ) ( CLEAR ?auto_645169 ) ( ON ?auto_645170 ?auto_645171 ) ( CLEAR ?auto_645170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_645166 ?auto_645167 ?auto_645168 ?auto_645169 ?auto_645170 )
      ( MAKE-12PILE ?auto_645166 ?auto_645167 ?auto_645168 ?auto_645169 ?auto_645170 ?auto_645171 ?auto_645172 ?auto_645173 ?auto_645174 ?auto_645175 ?auto_645176 ?auto_645177 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645216 - BLOCK
      ?auto_645217 - BLOCK
      ?auto_645218 - BLOCK
      ?auto_645219 - BLOCK
      ?auto_645220 - BLOCK
      ?auto_645221 - BLOCK
      ?auto_645222 - BLOCK
      ?auto_645223 - BLOCK
      ?auto_645224 - BLOCK
      ?auto_645225 - BLOCK
      ?auto_645226 - BLOCK
      ?auto_645227 - BLOCK
    )
    :vars
    (
      ?auto_645228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645227 ?auto_645228 ) ( ON-TABLE ?auto_645216 ) ( ON ?auto_645217 ?auto_645216 ) ( ON ?auto_645218 ?auto_645217 ) ( not ( = ?auto_645216 ?auto_645217 ) ) ( not ( = ?auto_645216 ?auto_645218 ) ) ( not ( = ?auto_645216 ?auto_645219 ) ) ( not ( = ?auto_645216 ?auto_645220 ) ) ( not ( = ?auto_645216 ?auto_645221 ) ) ( not ( = ?auto_645216 ?auto_645222 ) ) ( not ( = ?auto_645216 ?auto_645223 ) ) ( not ( = ?auto_645216 ?auto_645224 ) ) ( not ( = ?auto_645216 ?auto_645225 ) ) ( not ( = ?auto_645216 ?auto_645226 ) ) ( not ( = ?auto_645216 ?auto_645227 ) ) ( not ( = ?auto_645216 ?auto_645228 ) ) ( not ( = ?auto_645217 ?auto_645218 ) ) ( not ( = ?auto_645217 ?auto_645219 ) ) ( not ( = ?auto_645217 ?auto_645220 ) ) ( not ( = ?auto_645217 ?auto_645221 ) ) ( not ( = ?auto_645217 ?auto_645222 ) ) ( not ( = ?auto_645217 ?auto_645223 ) ) ( not ( = ?auto_645217 ?auto_645224 ) ) ( not ( = ?auto_645217 ?auto_645225 ) ) ( not ( = ?auto_645217 ?auto_645226 ) ) ( not ( = ?auto_645217 ?auto_645227 ) ) ( not ( = ?auto_645217 ?auto_645228 ) ) ( not ( = ?auto_645218 ?auto_645219 ) ) ( not ( = ?auto_645218 ?auto_645220 ) ) ( not ( = ?auto_645218 ?auto_645221 ) ) ( not ( = ?auto_645218 ?auto_645222 ) ) ( not ( = ?auto_645218 ?auto_645223 ) ) ( not ( = ?auto_645218 ?auto_645224 ) ) ( not ( = ?auto_645218 ?auto_645225 ) ) ( not ( = ?auto_645218 ?auto_645226 ) ) ( not ( = ?auto_645218 ?auto_645227 ) ) ( not ( = ?auto_645218 ?auto_645228 ) ) ( not ( = ?auto_645219 ?auto_645220 ) ) ( not ( = ?auto_645219 ?auto_645221 ) ) ( not ( = ?auto_645219 ?auto_645222 ) ) ( not ( = ?auto_645219 ?auto_645223 ) ) ( not ( = ?auto_645219 ?auto_645224 ) ) ( not ( = ?auto_645219 ?auto_645225 ) ) ( not ( = ?auto_645219 ?auto_645226 ) ) ( not ( = ?auto_645219 ?auto_645227 ) ) ( not ( = ?auto_645219 ?auto_645228 ) ) ( not ( = ?auto_645220 ?auto_645221 ) ) ( not ( = ?auto_645220 ?auto_645222 ) ) ( not ( = ?auto_645220 ?auto_645223 ) ) ( not ( = ?auto_645220 ?auto_645224 ) ) ( not ( = ?auto_645220 ?auto_645225 ) ) ( not ( = ?auto_645220 ?auto_645226 ) ) ( not ( = ?auto_645220 ?auto_645227 ) ) ( not ( = ?auto_645220 ?auto_645228 ) ) ( not ( = ?auto_645221 ?auto_645222 ) ) ( not ( = ?auto_645221 ?auto_645223 ) ) ( not ( = ?auto_645221 ?auto_645224 ) ) ( not ( = ?auto_645221 ?auto_645225 ) ) ( not ( = ?auto_645221 ?auto_645226 ) ) ( not ( = ?auto_645221 ?auto_645227 ) ) ( not ( = ?auto_645221 ?auto_645228 ) ) ( not ( = ?auto_645222 ?auto_645223 ) ) ( not ( = ?auto_645222 ?auto_645224 ) ) ( not ( = ?auto_645222 ?auto_645225 ) ) ( not ( = ?auto_645222 ?auto_645226 ) ) ( not ( = ?auto_645222 ?auto_645227 ) ) ( not ( = ?auto_645222 ?auto_645228 ) ) ( not ( = ?auto_645223 ?auto_645224 ) ) ( not ( = ?auto_645223 ?auto_645225 ) ) ( not ( = ?auto_645223 ?auto_645226 ) ) ( not ( = ?auto_645223 ?auto_645227 ) ) ( not ( = ?auto_645223 ?auto_645228 ) ) ( not ( = ?auto_645224 ?auto_645225 ) ) ( not ( = ?auto_645224 ?auto_645226 ) ) ( not ( = ?auto_645224 ?auto_645227 ) ) ( not ( = ?auto_645224 ?auto_645228 ) ) ( not ( = ?auto_645225 ?auto_645226 ) ) ( not ( = ?auto_645225 ?auto_645227 ) ) ( not ( = ?auto_645225 ?auto_645228 ) ) ( not ( = ?auto_645226 ?auto_645227 ) ) ( not ( = ?auto_645226 ?auto_645228 ) ) ( not ( = ?auto_645227 ?auto_645228 ) ) ( ON ?auto_645226 ?auto_645227 ) ( ON ?auto_645225 ?auto_645226 ) ( ON ?auto_645224 ?auto_645225 ) ( ON ?auto_645223 ?auto_645224 ) ( ON ?auto_645222 ?auto_645223 ) ( ON ?auto_645221 ?auto_645222 ) ( ON ?auto_645220 ?auto_645221 ) ( CLEAR ?auto_645218 ) ( ON ?auto_645219 ?auto_645220 ) ( CLEAR ?auto_645219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_645216 ?auto_645217 ?auto_645218 ?auto_645219 )
      ( MAKE-12PILE ?auto_645216 ?auto_645217 ?auto_645218 ?auto_645219 ?auto_645220 ?auto_645221 ?auto_645222 ?auto_645223 ?auto_645224 ?auto_645225 ?auto_645226 ?auto_645227 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645266 - BLOCK
      ?auto_645267 - BLOCK
      ?auto_645268 - BLOCK
      ?auto_645269 - BLOCK
      ?auto_645270 - BLOCK
      ?auto_645271 - BLOCK
      ?auto_645272 - BLOCK
      ?auto_645273 - BLOCK
      ?auto_645274 - BLOCK
      ?auto_645275 - BLOCK
      ?auto_645276 - BLOCK
      ?auto_645277 - BLOCK
    )
    :vars
    (
      ?auto_645278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645277 ?auto_645278 ) ( ON-TABLE ?auto_645266 ) ( ON ?auto_645267 ?auto_645266 ) ( not ( = ?auto_645266 ?auto_645267 ) ) ( not ( = ?auto_645266 ?auto_645268 ) ) ( not ( = ?auto_645266 ?auto_645269 ) ) ( not ( = ?auto_645266 ?auto_645270 ) ) ( not ( = ?auto_645266 ?auto_645271 ) ) ( not ( = ?auto_645266 ?auto_645272 ) ) ( not ( = ?auto_645266 ?auto_645273 ) ) ( not ( = ?auto_645266 ?auto_645274 ) ) ( not ( = ?auto_645266 ?auto_645275 ) ) ( not ( = ?auto_645266 ?auto_645276 ) ) ( not ( = ?auto_645266 ?auto_645277 ) ) ( not ( = ?auto_645266 ?auto_645278 ) ) ( not ( = ?auto_645267 ?auto_645268 ) ) ( not ( = ?auto_645267 ?auto_645269 ) ) ( not ( = ?auto_645267 ?auto_645270 ) ) ( not ( = ?auto_645267 ?auto_645271 ) ) ( not ( = ?auto_645267 ?auto_645272 ) ) ( not ( = ?auto_645267 ?auto_645273 ) ) ( not ( = ?auto_645267 ?auto_645274 ) ) ( not ( = ?auto_645267 ?auto_645275 ) ) ( not ( = ?auto_645267 ?auto_645276 ) ) ( not ( = ?auto_645267 ?auto_645277 ) ) ( not ( = ?auto_645267 ?auto_645278 ) ) ( not ( = ?auto_645268 ?auto_645269 ) ) ( not ( = ?auto_645268 ?auto_645270 ) ) ( not ( = ?auto_645268 ?auto_645271 ) ) ( not ( = ?auto_645268 ?auto_645272 ) ) ( not ( = ?auto_645268 ?auto_645273 ) ) ( not ( = ?auto_645268 ?auto_645274 ) ) ( not ( = ?auto_645268 ?auto_645275 ) ) ( not ( = ?auto_645268 ?auto_645276 ) ) ( not ( = ?auto_645268 ?auto_645277 ) ) ( not ( = ?auto_645268 ?auto_645278 ) ) ( not ( = ?auto_645269 ?auto_645270 ) ) ( not ( = ?auto_645269 ?auto_645271 ) ) ( not ( = ?auto_645269 ?auto_645272 ) ) ( not ( = ?auto_645269 ?auto_645273 ) ) ( not ( = ?auto_645269 ?auto_645274 ) ) ( not ( = ?auto_645269 ?auto_645275 ) ) ( not ( = ?auto_645269 ?auto_645276 ) ) ( not ( = ?auto_645269 ?auto_645277 ) ) ( not ( = ?auto_645269 ?auto_645278 ) ) ( not ( = ?auto_645270 ?auto_645271 ) ) ( not ( = ?auto_645270 ?auto_645272 ) ) ( not ( = ?auto_645270 ?auto_645273 ) ) ( not ( = ?auto_645270 ?auto_645274 ) ) ( not ( = ?auto_645270 ?auto_645275 ) ) ( not ( = ?auto_645270 ?auto_645276 ) ) ( not ( = ?auto_645270 ?auto_645277 ) ) ( not ( = ?auto_645270 ?auto_645278 ) ) ( not ( = ?auto_645271 ?auto_645272 ) ) ( not ( = ?auto_645271 ?auto_645273 ) ) ( not ( = ?auto_645271 ?auto_645274 ) ) ( not ( = ?auto_645271 ?auto_645275 ) ) ( not ( = ?auto_645271 ?auto_645276 ) ) ( not ( = ?auto_645271 ?auto_645277 ) ) ( not ( = ?auto_645271 ?auto_645278 ) ) ( not ( = ?auto_645272 ?auto_645273 ) ) ( not ( = ?auto_645272 ?auto_645274 ) ) ( not ( = ?auto_645272 ?auto_645275 ) ) ( not ( = ?auto_645272 ?auto_645276 ) ) ( not ( = ?auto_645272 ?auto_645277 ) ) ( not ( = ?auto_645272 ?auto_645278 ) ) ( not ( = ?auto_645273 ?auto_645274 ) ) ( not ( = ?auto_645273 ?auto_645275 ) ) ( not ( = ?auto_645273 ?auto_645276 ) ) ( not ( = ?auto_645273 ?auto_645277 ) ) ( not ( = ?auto_645273 ?auto_645278 ) ) ( not ( = ?auto_645274 ?auto_645275 ) ) ( not ( = ?auto_645274 ?auto_645276 ) ) ( not ( = ?auto_645274 ?auto_645277 ) ) ( not ( = ?auto_645274 ?auto_645278 ) ) ( not ( = ?auto_645275 ?auto_645276 ) ) ( not ( = ?auto_645275 ?auto_645277 ) ) ( not ( = ?auto_645275 ?auto_645278 ) ) ( not ( = ?auto_645276 ?auto_645277 ) ) ( not ( = ?auto_645276 ?auto_645278 ) ) ( not ( = ?auto_645277 ?auto_645278 ) ) ( ON ?auto_645276 ?auto_645277 ) ( ON ?auto_645275 ?auto_645276 ) ( ON ?auto_645274 ?auto_645275 ) ( ON ?auto_645273 ?auto_645274 ) ( ON ?auto_645272 ?auto_645273 ) ( ON ?auto_645271 ?auto_645272 ) ( ON ?auto_645270 ?auto_645271 ) ( ON ?auto_645269 ?auto_645270 ) ( CLEAR ?auto_645267 ) ( ON ?auto_645268 ?auto_645269 ) ( CLEAR ?auto_645268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_645266 ?auto_645267 ?auto_645268 )
      ( MAKE-12PILE ?auto_645266 ?auto_645267 ?auto_645268 ?auto_645269 ?auto_645270 ?auto_645271 ?auto_645272 ?auto_645273 ?auto_645274 ?auto_645275 ?auto_645276 ?auto_645277 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645316 - BLOCK
      ?auto_645317 - BLOCK
      ?auto_645318 - BLOCK
      ?auto_645319 - BLOCK
      ?auto_645320 - BLOCK
      ?auto_645321 - BLOCK
      ?auto_645322 - BLOCK
      ?auto_645323 - BLOCK
      ?auto_645324 - BLOCK
      ?auto_645325 - BLOCK
      ?auto_645326 - BLOCK
      ?auto_645327 - BLOCK
    )
    :vars
    (
      ?auto_645328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645327 ?auto_645328 ) ( ON-TABLE ?auto_645316 ) ( not ( = ?auto_645316 ?auto_645317 ) ) ( not ( = ?auto_645316 ?auto_645318 ) ) ( not ( = ?auto_645316 ?auto_645319 ) ) ( not ( = ?auto_645316 ?auto_645320 ) ) ( not ( = ?auto_645316 ?auto_645321 ) ) ( not ( = ?auto_645316 ?auto_645322 ) ) ( not ( = ?auto_645316 ?auto_645323 ) ) ( not ( = ?auto_645316 ?auto_645324 ) ) ( not ( = ?auto_645316 ?auto_645325 ) ) ( not ( = ?auto_645316 ?auto_645326 ) ) ( not ( = ?auto_645316 ?auto_645327 ) ) ( not ( = ?auto_645316 ?auto_645328 ) ) ( not ( = ?auto_645317 ?auto_645318 ) ) ( not ( = ?auto_645317 ?auto_645319 ) ) ( not ( = ?auto_645317 ?auto_645320 ) ) ( not ( = ?auto_645317 ?auto_645321 ) ) ( not ( = ?auto_645317 ?auto_645322 ) ) ( not ( = ?auto_645317 ?auto_645323 ) ) ( not ( = ?auto_645317 ?auto_645324 ) ) ( not ( = ?auto_645317 ?auto_645325 ) ) ( not ( = ?auto_645317 ?auto_645326 ) ) ( not ( = ?auto_645317 ?auto_645327 ) ) ( not ( = ?auto_645317 ?auto_645328 ) ) ( not ( = ?auto_645318 ?auto_645319 ) ) ( not ( = ?auto_645318 ?auto_645320 ) ) ( not ( = ?auto_645318 ?auto_645321 ) ) ( not ( = ?auto_645318 ?auto_645322 ) ) ( not ( = ?auto_645318 ?auto_645323 ) ) ( not ( = ?auto_645318 ?auto_645324 ) ) ( not ( = ?auto_645318 ?auto_645325 ) ) ( not ( = ?auto_645318 ?auto_645326 ) ) ( not ( = ?auto_645318 ?auto_645327 ) ) ( not ( = ?auto_645318 ?auto_645328 ) ) ( not ( = ?auto_645319 ?auto_645320 ) ) ( not ( = ?auto_645319 ?auto_645321 ) ) ( not ( = ?auto_645319 ?auto_645322 ) ) ( not ( = ?auto_645319 ?auto_645323 ) ) ( not ( = ?auto_645319 ?auto_645324 ) ) ( not ( = ?auto_645319 ?auto_645325 ) ) ( not ( = ?auto_645319 ?auto_645326 ) ) ( not ( = ?auto_645319 ?auto_645327 ) ) ( not ( = ?auto_645319 ?auto_645328 ) ) ( not ( = ?auto_645320 ?auto_645321 ) ) ( not ( = ?auto_645320 ?auto_645322 ) ) ( not ( = ?auto_645320 ?auto_645323 ) ) ( not ( = ?auto_645320 ?auto_645324 ) ) ( not ( = ?auto_645320 ?auto_645325 ) ) ( not ( = ?auto_645320 ?auto_645326 ) ) ( not ( = ?auto_645320 ?auto_645327 ) ) ( not ( = ?auto_645320 ?auto_645328 ) ) ( not ( = ?auto_645321 ?auto_645322 ) ) ( not ( = ?auto_645321 ?auto_645323 ) ) ( not ( = ?auto_645321 ?auto_645324 ) ) ( not ( = ?auto_645321 ?auto_645325 ) ) ( not ( = ?auto_645321 ?auto_645326 ) ) ( not ( = ?auto_645321 ?auto_645327 ) ) ( not ( = ?auto_645321 ?auto_645328 ) ) ( not ( = ?auto_645322 ?auto_645323 ) ) ( not ( = ?auto_645322 ?auto_645324 ) ) ( not ( = ?auto_645322 ?auto_645325 ) ) ( not ( = ?auto_645322 ?auto_645326 ) ) ( not ( = ?auto_645322 ?auto_645327 ) ) ( not ( = ?auto_645322 ?auto_645328 ) ) ( not ( = ?auto_645323 ?auto_645324 ) ) ( not ( = ?auto_645323 ?auto_645325 ) ) ( not ( = ?auto_645323 ?auto_645326 ) ) ( not ( = ?auto_645323 ?auto_645327 ) ) ( not ( = ?auto_645323 ?auto_645328 ) ) ( not ( = ?auto_645324 ?auto_645325 ) ) ( not ( = ?auto_645324 ?auto_645326 ) ) ( not ( = ?auto_645324 ?auto_645327 ) ) ( not ( = ?auto_645324 ?auto_645328 ) ) ( not ( = ?auto_645325 ?auto_645326 ) ) ( not ( = ?auto_645325 ?auto_645327 ) ) ( not ( = ?auto_645325 ?auto_645328 ) ) ( not ( = ?auto_645326 ?auto_645327 ) ) ( not ( = ?auto_645326 ?auto_645328 ) ) ( not ( = ?auto_645327 ?auto_645328 ) ) ( ON ?auto_645326 ?auto_645327 ) ( ON ?auto_645325 ?auto_645326 ) ( ON ?auto_645324 ?auto_645325 ) ( ON ?auto_645323 ?auto_645324 ) ( ON ?auto_645322 ?auto_645323 ) ( ON ?auto_645321 ?auto_645322 ) ( ON ?auto_645320 ?auto_645321 ) ( ON ?auto_645319 ?auto_645320 ) ( ON ?auto_645318 ?auto_645319 ) ( CLEAR ?auto_645316 ) ( ON ?auto_645317 ?auto_645318 ) ( CLEAR ?auto_645317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_645316 ?auto_645317 )
      ( MAKE-12PILE ?auto_645316 ?auto_645317 ?auto_645318 ?auto_645319 ?auto_645320 ?auto_645321 ?auto_645322 ?auto_645323 ?auto_645324 ?auto_645325 ?auto_645326 ?auto_645327 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_645366 - BLOCK
      ?auto_645367 - BLOCK
      ?auto_645368 - BLOCK
      ?auto_645369 - BLOCK
      ?auto_645370 - BLOCK
      ?auto_645371 - BLOCK
      ?auto_645372 - BLOCK
      ?auto_645373 - BLOCK
      ?auto_645374 - BLOCK
      ?auto_645375 - BLOCK
      ?auto_645376 - BLOCK
      ?auto_645377 - BLOCK
    )
    :vars
    (
      ?auto_645378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645377 ?auto_645378 ) ( not ( = ?auto_645366 ?auto_645367 ) ) ( not ( = ?auto_645366 ?auto_645368 ) ) ( not ( = ?auto_645366 ?auto_645369 ) ) ( not ( = ?auto_645366 ?auto_645370 ) ) ( not ( = ?auto_645366 ?auto_645371 ) ) ( not ( = ?auto_645366 ?auto_645372 ) ) ( not ( = ?auto_645366 ?auto_645373 ) ) ( not ( = ?auto_645366 ?auto_645374 ) ) ( not ( = ?auto_645366 ?auto_645375 ) ) ( not ( = ?auto_645366 ?auto_645376 ) ) ( not ( = ?auto_645366 ?auto_645377 ) ) ( not ( = ?auto_645366 ?auto_645378 ) ) ( not ( = ?auto_645367 ?auto_645368 ) ) ( not ( = ?auto_645367 ?auto_645369 ) ) ( not ( = ?auto_645367 ?auto_645370 ) ) ( not ( = ?auto_645367 ?auto_645371 ) ) ( not ( = ?auto_645367 ?auto_645372 ) ) ( not ( = ?auto_645367 ?auto_645373 ) ) ( not ( = ?auto_645367 ?auto_645374 ) ) ( not ( = ?auto_645367 ?auto_645375 ) ) ( not ( = ?auto_645367 ?auto_645376 ) ) ( not ( = ?auto_645367 ?auto_645377 ) ) ( not ( = ?auto_645367 ?auto_645378 ) ) ( not ( = ?auto_645368 ?auto_645369 ) ) ( not ( = ?auto_645368 ?auto_645370 ) ) ( not ( = ?auto_645368 ?auto_645371 ) ) ( not ( = ?auto_645368 ?auto_645372 ) ) ( not ( = ?auto_645368 ?auto_645373 ) ) ( not ( = ?auto_645368 ?auto_645374 ) ) ( not ( = ?auto_645368 ?auto_645375 ) ) ( not ( = ?auto_645368 ?auto_645376 ) ) ( not ( = ?auto_645368 ?auto_645377 ) ) ( not ( = ?auto_645368 ?auto_645378 ) ) ( not ( = ?auto_645369 ?auto_645370 ) ) ( not ( = ?auto_645369 ?auto_645371 ) ) ( not ( = ?auto_645369 ?auto_645372 ) ) ( not ( = ?auto_645369 ?auto_645373 ) ) ( not ( = ?auto_645369 ?auto_645374 ) ) ( not ( = ?auto_645369 ?auto_645375 ) ) ( not ( = ?auto_645369 ?auto_645376 ) ) ( not ( = ?auto_645369 ?auto_645377 ) ) ( not ( = ?auto_645369 ?auto_645378 ) ) ( not ( = ?auto_645370 ?auto_645371 ) ) ( not ( = ?auto_645370 ?auto_645372 ) ) ( not ( = ?auto_645370 ?auto_645373 ) ) ( not ( = ?auto_645370 ?auto_645374 ) ) ( not ( = ?auto_645370 ?auto_645375 ) ) ( not ( = ?auto_645370 ?auto_645376 ) ) ( not ( = ?auto_645370 ?auto_645377 ) ) ( not ( = ?auto_645370 ?auto_645378 ) ) ( not ( = ?auto_645371 ?auto_645372 ) ) ( not ( = ?auto_645371 ?auto_645373 ) ) ( not ( = ?auto_645371 ?auto_645374 ) ) ( not ( = ?auto_645371 ?auto_645375 ) ) ( not ( = ?auto_645371 ?auto_645376 ) ) ( not ( = ?auto_645371 ?auto_645377 ) ) ( not ( = ?auto_645371 ?auto_645378 ) ) ( not ( = ?auto_645372 ?auto_645373 ) ) ( not ( = ?auto_645372 ?auto_645374 ) ) ( not ( = ?auto_645372 ?auto_645375 ) ) ( not ( = ?auto_645372 ?auto_645376 ) ) ( not ( = ?auto_645372 ?auto_645377 ) ) ( not ( = ?auto_645372 ?auto_645378 ) ) ( not ( = ?auto_645373 ?auto_645374 ) ) ( not ( = ?auto_645373 ?auto_645375 ) ) ( not ( = ?auto_645373 ?auto_645376 ) ) ( not ( = ?auto_645373 ?auto_645377 ) ) ( not ( = ?auto_645373 ?auto_645378 ) ) ( not ( = ?auto_645374 ?auto_645375 ) ) ( not ( = ?auto_645374 ?auto_645376 ) ) ( not ( = ?auto_645374 ?auto_645377 ) ) ( not ( = ?auto_645374 ?auto_645378 ) ) ( not ( = ?auto_645375 ?auto_645376 ) ) ( not ( = ?auto_645375 ?auto_645377 ) ) ( not ( = ?auto_645375 ?auto_645378 ) ) ( not ( = ?auto_645376 ?auto_645377 ) ) ( not ( = ?auto_645376 ?auto_645378 ) ) ( not ( = ?auto_645377 ?auto_645378 ) ) ( ON ?auto_645376 ?auto_645377 ) ( ON ?auto_645375 ?auto_645376 ) ( ON ?auto_645374 ?auto_645375 ) ( ON ?auto_645373 ?auto_645374 ) ( ON ?auto_645372 ?auto_645373 ) ( ON ?auto_645371 ?auto_645372 ) ( ON ?auto_645370 ?auto_645371 ) ( ON ?auto_645369 ?auto_645370 ) ( ON ?auto_645368 ?auto_645369 ) ( ON ?auto_645367 ?auto_645368 ) ( ON ?auto_645366 ?auto_645367 ) ( CLEAR ?auto_645366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_645366 )
      ( MAKE-12PILE ?auto_645366 ?auto_645367 ?auto_645368 ?auto_645369 ?auto_645370 ?auto_645371 ?auto_645372 ?auto_645373 ?auto_645374 ?auto_645375 ?auto_645376 ?auto_645377 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645417 - BLOCK
      ?auto_645418 - BLOCK
      ?auto_645419 - BLOCK
      ?auto_645420 - BLOCK
      ?auto_645421 - BLOCK
      ?auto_645422 - BLOCK
      ?auto_645423 - BLOCK
      ?auto_645424 - BLOCK
      ?auto_645425 - BLOCK
      ?auto_645426 - BLOCK
      ?auto_645427 - BLOCK
      ?auto_645428 - BLOCK
      ?auto_645429 - BLOCK
    )
    :vars
    (
      ?auto_645430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_645428 ) ( ON ?auto_645429 ?auto_645430 ) ( CLEAR ?auto_645429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_645417 ) ( ON ?auto_645418 ?auto_645417 ) ( ON ?auto_645419 ?auto_645418 ) ( ON ?auto_645420 ?auto_645419 ) ( ON ?auto_645421 ?auto_645420 ) ( ON ?auto_645422 ?auto_645421 ) ( ON ?auto_645423 ?auto_645422 ) ( ON ?auto_645424 ?auto_645423 ) ( ON ?auto_645425 ?auto_645424 ) ( ON ?auto_645426 ?auto_645425 ) ( ON ?auto_645427 ?auto_645426 ) ( ON ?auto_645428 ?auto_645427 ) ( not ( = ?auto_645417 ?auto_645418 ) ) ( not ( = ?auto_645417 ?auto_645419 ) ) ( not ( = ?auto_645417 ?auto_645420 ) ) ( not ( = ?auto_645417 ?auto_645421 ) ) ( not ( = ?auto_645417 ?auto_645422 ) ) ( not ( = ?auto_645417 ?auto_645423 ) ) ( not ( = ?auto_645417 ?auto_645424 ) ) ( not ( = ?auto_645417 ?auto_645425 ) ) ( not ( = ?auto_645417 ?auto_645426 ) ) ( not ( = ?auto_645417 ?auto_645427 ) ) ( not ( = ?auto_645417 ?auto_645428 ) ) ( not ( = ?auto_645417 ?auto_645429 ) ) ( not ( = ?auto_645417 ?auto_645430 ) ) ( not ( = ?auto_645418 ?auto_645419 ) ) ( not ( = ?auto_645418 ?auto_645420 ) ) ( not ( = ?auto_645418 ?auto_645421 ) ) ( not ( = ?auto_645418 ?auto_645422 ) ) ( not ( = ?auto_645418 ?auto_645423 ) ) ( not ( = ?auto_645418 ?auto_645424 ) ) ( not ( = ?auto_645418 ?auto_645425 ) ) ( not ( = ?auto_645418 ?auto_645426 ) ) ( not ( = ?auto_645418 ?auto_645427 ) ) ( not ( = ?auto_645418 ?auto_645428 ) ) ( not ( = ?auto_645418 ?auto_645429 ) ) ( not ( = ?auto_645418 ?auto_645430 ) ) ( not ( = ?auto_645419 ?auto_645420 ) ) ( not ( = ?auto_645419 ?auto_645421 ) ) ( not ( = ?auto_645419 ?auto_645422 ) ) ( not ( = ?auto_645419 ?auto_645423 ) ) ( not ( = ?auto_645419 ?auto_645424 ) ) ( not ( = ?auto_645419 ?auto_645425 ) ) ( not ( = ?auto_645419 ?auto_645426 ) ) ( not ( = ?auto_645419 ?auto_645427 ) ) ( not ( = ?auto_645419 ?auto_645428 ) ) ( not ( = ?auto_645419 ?auto_645429 ) ) ( not ( = ?auto_645419 ?auto_645430 ) ) ( not ( = ?auto_645420 ?auto_645421 ) ) ( not ( = ?auto_645420 ?auto_645422 ) ) ( not ( = ?auto_645420 ?auto_645423 ) ) ( not ( = ?auto_645420 ?auto_645424 ) ) ( not ( = ?auto_645420 ?auto_645425 ) ) ( not ( = ?auto_645420 ?auto_645426 ) ) ( not ( = ?auto_645420 ?auto_645427 ) ) ( not ( = ?auto_645420 ?auto_645428 ) ) ( not ( = ?auto_645420 ?auto_645429 ) ) ( not ( = ?auto_645420 ?auto_645430 ) ) ( not ( = ?auto_645421 ?auto_645422 ) ) ( not ( = ?auto_645421 ?auto_645423 ) ) ( not ( = ?auto_645421 ?auto_645424 ) ) ( not ( = ?auto_645421 ?auto_645425 ) ) ( not ( = ?auto_645421 ?auto_645426 ) ) ( not ( = ?auto_645421 ?auto_645427 ) ) ( not ( = ?auto_645421 ?auto_645428 ) ) ( not ( = ?auto_645421 ?auto_645429 ) ) ( not ( = ?auto_645421 ?auto_645430 ) ) ( not ( = ?auto_645422 ?auto_645423 ) ) ( not ( = ?auto_645422 ?auto_645424 ) ) ( not ( = ?auto_645422 ?auto_645425 ) ) ( not ( = ?auto_645422 ?auto_645426 ) ) ( not ( = ?auto_645422 ?auto_645427 ) ) ( not ( = ?auto_645422 ?auto_645428 ) ) ( not ( = ?auto_645422 ?auto_645429 ) ) ( not ( = ?auto_645422 ?auto_645430 ) ) ( not ( = ?auto_645423 ?auto_645424 ) ) ( not ( = ?auto_645423 ?auto_645425 ) ) ( not ( = ?auto_645423 ?auto_645426 ) ) ( not ( = ?auto_645423 ?auto_645427 ) ) ( not ( = ?auto_645423 ?auto_645428 ) ) ( not ( = ?auto_645423 ?auto_645429 ) ) ( not ( = ?auto_645423 ?auto_645430 ) ) ( not ( = ?auto_645424 ?auto_645425 ) ) ( not ( = ?auto_645424 ?auto_645426 ) ) ( not ( = ?auto_645424 ?auto_645427 ) ) ( not ( = ?auto_645424 ?auto_645428 ) ) ( not ( = ?auto_645424 ?auto_645429 ) ) ( not ( = ?auto_645424 ?auto_645430 ) ) ( not ( = ?auto_645425 ?auto_645426 ) ) ( not ( = ?auto_645425 ?auto_645427 ) ) ( not ( = ?auto_645425 ?auto_645428 ) ) ( not ( = ?auto_645425 ?auto_645429 ) ) ( not ( = ?auto_645425 ?auto_645430 ) ) ( not ( = ?auto_645426 ?auto_645427 ) ) ( not ( = ?auto_645426 ?auto_645428 ) ) ( not ( = ?auto_645426 ?auto_645429 ) ) ( not ( = ?auto_645426 ?auto_645430 ) ) ( not ( = ?auto_645427 ?auto_645428 ) ) ( not ( = ?auto_645427 ?auto_645429 ) ) ( not ( = ?auto_645427 ?auto_645430 ) ) ( not ( = ?auto_645428 ?auto_645429 ) ) ( not ( = ?auto_645428 ?auto_645430 ) ) ( not ( = ?auto_645429 ?auto_645430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_645429 ?auto_645430 )
      ( !STACK ?auto_645429 ?auto_645428 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645471 - BLOCK
      ?auto_645472 - BLOCK
      ?auto_645473 - BLOCK
      ?auto_645474 - BLOCK
      ?auto_645475 - BLOCK
      ?auto_645476 - BLOCK
      ?auto_645477 - BLOCK
      ?auto_645478 - BLOCK
      ?auto_645479 - BLOCK
      ?auto_645480 - BLOCK
      ?auto_645481 - BLOCK
      ?auto_645482 - BLOCK
      ?auto_645483 - BLOCK
    )
    :vars
    (
      ?auto_645484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645483 ?auto_645484 ) ( ON-TABLE ?auto_645471 ) ( ON ?auto_645472 ?auto_645471 ) ( ON ?auto_645473 ?auto_645472 ) ( ON ?auto_645474 ?auto_645473 ) ( ON ?auto_645475 ?auto_645474 ) ( ON ?auto_645476 ?auto_645475 ) ( ON ?auto_645477 ?auto_645476 ) ( ON ?auto_645478 ?auto_645477 ) ( ON ?auto_645479 ?auto_645478 ) ( ON ?auto_645480 ?auto_645479 ) ( ON ?auto_645481 ?auto_645480 ) ( not ( = ?auto_645471 ?auto_645472 ) ) ( not ( = ?auto_645471 ?auto_645473 ) ) ( not ( = ?auto_645471 ?auto_645474 ) ) ( not ( = ?auto_645471 ?auto_645475 ) ) ( not ( = ?auto_645471 ?auto_645476 ) ) ( not ( = ?auto_645471 ?auto_645477 ) ) ( not ( = ?auto_645471 ?auto_645478 ) ) ( not ( = ?auto_645471 ?auto_645479 ) ) ( not ( = ?auto_645471 ?auto_645480 ) ) ( not ( = ?auto_645471 ?auto_645481 ) ) ( not ( = ?auto_645471 ?auto_645482 ) ) ( not ( = ?auto_645471 ?auto_645483 ) ) ( not ( = ?auto_645471 ?auto_645484 ) ) ( not ( = ?auto_645472 ?auto_645473 ) ) ( not ( = ?auto_645472 ?auto_645474 ) ) ( not ( = ?auto_645472 ?auto_645475 ) ) ( not ( = ?auto_645472 ?auto_645476 ) ) ( not ( = ?auto_645472 ?auto_645477 ) ) ( not ( = ?auto_645472 ?auto_645478 ) ) ( not ( = ?auto_645472 ?auto_645479 ) ) ( not ( = ?auto_645472 ?auto_645480 ) ) ( not ( = ?auto_645472 ?auto_645481 ) ) ( not ( = ?auto_645472 ?auto_645482 ) ) ( not ( = ?auto_645472 ?auto_645483 ) ) ( not ( = ?auto_645472 ?auto_645484 ) ) ( not ( = ?auto_645473 ?auto_645474 ) ) ( not ( = ?auto_645473 ?auto_645475 ) ) ( not ( = ?auto_645473 ?auto_645476 ) ) ( not ( = ?auto_645473 ?auto_645477 ) ) ( not ( = ?auto_645473 ?auto_645478 ) ) ( not ( = ?auto_645473 ?auto_645479 ) ) ( not ( = ?auto_645473 ?auto_645480 ) ) ( not ( = ?auto_645473 ?auto_645481 ) ) ( not ( = ?auto_645473 ?auto_645482 ) ) ( not ( = ?auto_645473 ?auto_645483 ) ) ( not ( = ?auto_645473 ?auto_645484 ) ) ( not ( = ?auto_645474 ?auto_645475 ) ) ( not ( = ?auto_645474 ?auto_645476 ) ) ( not ( = ?auto_645474 ?auto_645477 ) ) ( not ( = ?auto_645474 ?auto_645478 ) ) ( not ( = ?auto_645474 ?auto_645479 ) ) ( not ( = ?auto_645474 ?auto_645480 ) ) ( not ( = ?auto_645474 ?auto_645481 ) ) ( not ( = ?auto_645474 ?auto_645482 ) ) ( not ( = ?auto_645474 ?auto_645483 ) ) ( not ( = ?auto_645474 ?auto_645484 ) ) ( not ( = ?auto_645475 ?auto_645476 ) ) ( not ( = ?auto_645475 ?auto_645477 ) ) ( not ( = ?auto_645475 ?auto_645478 ) ) ( not ( = ?auto_645475 ?auto_645479 ) ) ( not ( = ?auto_645475 ?auto_645480 ) ) ( not ( = ?auto_645475 ?auto_645481 ) ) ( not ( = ?auto_645475 ?auto_645482 ) ) ( not ( = ?auto_645475 ?auto_645483 ) ) ( not ( = ?auto_645475 ?auto_645484 ) ) ( not ( = ?auto_645476 ?auto_645477 ) ) ( not ( = ?auto_645476 ?auto_645478 ) ) ( not ( = ?auto_645476 ?auto_645479 ) ) ( not ( = ?auto_645476 ?auto_645480 ) ) ( not ( = ?auto_645476 ?auto_645481 ) ) ( not ( = ?auto_645476 ?auto_645482 ) ) ( not ( = ?auto_645476 ?auto_645483 ) ) ( not ( = ?auto_645476 ?auto_645484 ) ) ( not ( = ?auto_645477 ?auto_645478 ) ) ( not ( = ?auto_645477 ?auto_645479 ) ) ( not ( = ?auto_645477 ?auto_645480 ) ) ( not ( = ?auto_645477 ?auto_645481 ) ) ( not ( = ?auto_645477 ?auto_645482 ) ) ( not ( = ?auto_645477 ?auto_645483 ) ) ( not ( = ?auto_645477 ?auto_645484 ) ) ( not ( = ?auto_645478 ?auto_645479 ) ) ( not ( = ?auto_645478 ?auto_645480 ) ) ( not ( = ?auto_645478 ?auto_645481 ) ) ( not ( = ?auto_645478 ?auto_645482 ) ) ( not ( = ?auto_645478 ?auto_645483 ) ) ( not ( = ?auto_645478 ?auto_645484 ) ) ( not ( = ?auto_645479 ?auto_645480 ) ) ( not ( = ?auto_645479 ?auto_645481 ) ) ( not ( = ?auto_645479 ?auto_645482 ) ) ( not ( = ?auto_645479 ?auto_645483 ) ) ( not ( = ?auto_645479 ?auto_645484 ) ) ( not ( = ?auto_645480 ?auto_645481 ) ) ( not ( = ?auto_645480 ?auto_645482 ) ) ( not ( = ?auto_645480 ?auto_645483 ) ) ( not ( = ?auto_645480 ?auto_645484 ) ) ( not ( = ?auto_645481 ?auto_645482 ) ) ( not ( = ?auto_645481 ?auto_645483 ) ) ( not ( = ?auto_645481 ?auto_645484 ) ) ( not ( = ?auto_645482 ?auto_645483 ) ) ( not ( = ?auto_645482 ?auto_645484 ) ) ( not ( = ?auto_645483 ?auto_645484 ) ) ( CLEAR ?auto_645481 ) ( ON ?auto_645482 ?auto_645483 ) ( CLEAR ?auto_645482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_645471 ?auto_645472 ?auto_645473 ?auto_645474 ?auto_645475 ?auto_645476 ?auto_645477 ?auto_645478 ?auto_645479 ?auto_645480 ?auto_645481 ?auto_645482 )
      ( MAKE-13PILE ?auto_645471 ?auto_645472 ?auto_645473 ?auto_645474 ?auto_645475 ?auto_645476 ?auto_645477 ?auto_645478 ?auto_645479 ?auto_645480 ?auto_645481 ?auto_645482 ?auto_645483 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645525 - BLOCK
      ?auto_645526 - BLOCK
      ?auto_645527 - BLOCK
      ?auto_645528 - BLOCK
      ?auto_645529 - BLOCK
      ?auto_645530 - BLOCK
      ?auto_645531 - BLOCK
      ?auto_645532 - BLOCK
      ?auto_645533 - BLOCK
      ?auto_645534 - BLOCK
      ?auto_645535 - BLOCK
      ?auto_645536 - BLOCK
      ?auto_645537 - BLOCK
    )
    :vars
    (
      ?auto_645538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645537 ?auto_645538 ) ( ON-TABLE ?auto_645525 ) ( ON ?auto_645526 ?auto_645525 ) ( ON ?auto_645527 ?auto_645526 ) ( ON ?auto_645528 ?auto_645527 ) ( ON ?auto_645529 ?auto_645528 ) ( ON ?auto_645530 ?auto_645529 ) ( ON ?auto_645531 ?auto_645530 ) ( ON ?auto_645532 ?auto_645531 ) ( ON ?auto_645533 ?auto_645532 ) ( ON ?auto_645534 ?auto_645533 ) ( not ( = ?auto_645525 ?auto_645526 ) ) ( not ( = ?auto_645525 ?auto_645527 ) ) ( not ( = ?auto_645525 ?auto_645528 ) ) ( not ( = ?auto_645525 ?auto_645529 ) ) ( not ( = ?auto_645525 ?auto_645530 ) ) ( not ( = ?auto_645525 ?auto_645531 ) ) ( not ( = ?auto_645525 ?auto_645532 ) ) ( not ( = ?auto_645525 ?auto_645533 ) ) ( not ( = ?auto_645525 ?auto_645534 ) ) ( not ( = ?auto_645525 ?auto_645535 ) ) ( not ( = ?auto_645525 ?auto_645536 ) ) ( not ( = ?auto_645525 ?auto_645537 ) ) ( not ( = ?auto_645525 ?auto_645538 ) ) ( not ( = ?auto_645526 ?auto_645527 ) ) ( not ( = ?auto_645526 ?auto_645528 ) ) ( not ( = ?auto_645526 ?auto_645529 ) ) ( not ( = ?auto_645526 ?auto_645530 ) ) ( not ( = ?auto_645526 ?auto_645531 ) ) ( not ( = ?auto_645526 ?auto_645532 ) ) ( not ( = ?auto_645526 ?auto_645533 ) ) ( not ( = ?auto_645526 ?auto_645534 ) ) ( not ( = ?auto_645526 ?auto_645535 ) ) ( not ( = ?auto_645526 ?auto_645536 ) ) ( not ( = ?auto_645526 ?auto_645537 ) ) ( not ( = ?auto_645526 ?auto_645538 ) ) ( not ( = ?auto_645527 ?auto_645528 ) ) ( not ( = ?auto_645527 ?auto_645529 ) ) ( not ( = ?auto_645527 ?auto_645530 ) ) ( not ( = ?auto_645527 ?auto_645531 ) ) ( not ( = ?auto_645527 ?auto_645532 ) ) ( not ( = ?auto_645527 ?auto_645533 ) ) ( not ( = ?auto_645527 ?auto_645534 ) ) ( not ( = ?auto_645527 ?auto_645535 ) ) ( not ( = ?auto_645527 ?auto_645536 ) ) ( not ( = ?auto_645527 ?auto_645537 ) ) ( not ( = ?auto_645527 ?auto_645538 ) ) ( not ( = ?auto_645528 ?auto_645529 ) ) ( not ( = ?auto_645528 ?auto_645530 ) ) ( not ( = ?auto_645528 ?auto_645531 ) ) ( not ( = ?auto_645528 ?auto_645532 ) ) ( not ( = ?auto_645528 ?auto_645533 ) ) ( not ( = ?auto_645528 ?auto_645534 ) ) ( not ( = ?auto_645528 ?auto_645535 ) ) ( not ( = ?auto_645528 ?auto_645536 ) ) ( not ( = ?auto_645528 ?auto_645537 ) ) ( not ( = ?auto_645528 ?auto_645538 ) ) ( not ( = ?auto_645529 ?auto_645530 ) ) ( not ( = ?auto_645529 ?auto_645531 ) ) ( not ( = ?auto_645529 ?auto_645532 ) ) ( not ( = ?auto_645529 ?auto_645533 ) ) ( not ( = ?auto_645529 ?auto_645534 ) ) ( not ( = ?auto_645529 ?auto_645535 ) ) ( not ( = ?auto_645529 ?auto_645536 ) ) ( not ( = ?auto_645529 ?auto_645537 ) ) ( not ( = ?auto_645529 ?auto_645538 ) ) ( not ( = ?auto_645530 ?auto_645531 ) ) ( not ( = ?auto_645530 ?auto_645532 ) ) ( not ( = ?auto_645530 ?auto_645533 ) ) ( not ( = ?auto_645530 ?auto_645534 ) ) ( not ( = ?auto_645530 ?auto_645535 ) ) ( not ( = ?auto_645530 ?auto_645536 ) ) ( not ( = ?auto_645530 ?auto_645537 ) ) ( not ( = ?auto_645530 ?auto_645538 ) ) ( not ( = ?auto_645531 ?auto_645532 ) ) ( not ( = ?auto_645531 ?auto_645533 ) ) ( not ( = ?auto_645531 ?auto_645534 ) ) ( not ( = ?auto_645531 ?auto_645535 ) ) ( not ( = ?auto_645531 ?auto_645536 ) ) ( not ( = ?auto_645531 ?auto_645537 ) ) ( not ( = ?auto_645531 ?auto_645538 ) ) ( not ( = ?auto_645532 ?auto_645533 ) ) ( not ( = ?auto_645532 ?auto_645534 ) ) ( not ( = ?auto_645532 ?auto_645535 ) ) ( not ( = ?auto_645532 ?auto_645536 ) ) ( not ( = ?auto_645532 ?auto_645537 ) ) ( not ( = ?auto_645532 ?auto_645538 ) ) ( not ( = ?auto_645533 ?auto_645534 ) ) ( not ( = ?auto_645533 ?auto_645535 ) ) ( not ( = ?auto_645533 ?auto_645536 ) ) ( not ( = ?auto_645533 ?auto_645537 ) ) ( not ( = ?auto_645533 ?auto_645538 ) ) ( not ( = ?auto_645534 ?auto_645535 ) ) ( not ( = ?auto_645534 ?auto_645536 ) ) ( not ( = ?auto_645534 ?auto_645537 ) ) ( not ( = ?auto_645534 ?auto_645538 ) ) ( not ( = ?auto_645535 ?auto_645536 ) ) ( not ( = ?auto_645535 ?auto_645537 ) ) ( not ( = ?auto_645535 ?auto_645538 ) ) ( not ( = ?auto_645536 ?auto_645537 ) ) ( not ( = ?auto_645536 ?auto_645538 ) ) ( not ( = ?auto_645537 ?auto_645538 ) ) ( ON ?auto_645536 ?auto_645537 ) ( CLEAR ?auto_645534 ) ( ON ?auto_645535 ?auto_645536 ) ( CLEAR ?auto_645535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_645525 ?auto_645526 ?auto_645527 ?auto_645528 ?auto_645529 ?auto_645530 ?auto_645531 ?auto_645532 ?auto_645533 ?auto_645534 ?auto_645535 )
      ( MAKE-13PILE ?auto_645525 ?auto_645526 ?auto_645527 ?auto_645528 ?auto_645529 ?auto_645530 ?auto_645531 ?auto_645532 ?auto_645533 ?auto_645534 ?auto_645535 ?auto_645536 ?auto_645537 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645579 - BLOCK
      ?auto_645580 - BLOCK
      ?auto_645581 - BLOCK
      ?auto_645582 - BLOCK
      ?auto_645583 - BLOCK
      ?auto_645584 - BLOCK
      ?auto_645585 - BLOCK
      ?auto_645586 - BLOCK
      ?auto_645587 - BLOCK
      ?auto_645588 - BLOCK
      ?auto_645589 - BLOCK
      ?auto_645590 - BLOCK
      ?auto_645591 - BLOCK
    )
    :vars
    (
      ?auto_645592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645591 ?auto_645592 ) ( ON-TABLE ?auto_645579 ) ( ON ?auto_645580 ?auto_645579 ) ( ON ?auto_645581 ?auto_645580 ) ( ON ?auto_645582 ?auto_645581 ) ( ON ?auto_645583 ?auto_645582 ) ( ON ?auto_645584 ?auto_645583 ) ( ON ?auto_645585 ?auto_645584 ) ( ON ?auto_645586 ?auto_645585 ) ( ON ?auto_645587 ?auto_645586 ) ( not ( = ?auto_645579 ?auto_645580 ) ) ( not ( = ?auto_645579 ?auto_645581 ) ) ( not ( = ?auto_645579 ?auto_645582 ) ) ( not ( = ?auto_645579 ?auto_645583 ) ) ( not ( = ?auto_645579 ?auto_645584 ) ) ( not ( = ?auto_645579 ?auto_645585 ) ) ( not ( = ?auto_645579 ?auto_645586 ) ) ( not ( = ?auto_645579 ?auto_645587 ) ) ( not ( = ?auto_645579 ?auto_645588 ) ) ( not ( = ?auto_645579 ?auto_645589 ) ) ( not ( = ?auto_645579 ?auto_645590 ) ) ( not ( = ?auto_645579 ?auto_645591 ) ) ( not ( = ?auto_645579 ?auto_645592 ) ) ( not ( = ?auto_645580 ?auto_645581 ) ) ( not ( = ?auto_645580 ?auto_645582 ) ) ( not ( = ?auto_645580 ?auto_645583 ) ) ( not ( = ?auto_645580 ?auto_645584 ) ) ( not ( = ?auto_645580 ?auto_645585 ) ) ( not ( = ?auto_645580 ?auto_645586 ) ) ( not ( = ?auto_645580 ?auto_645587 ) ) ( not ( = ?auto_645580 ?auto_645588 ) ) ( not ( = ?auto_645580 ?auto_645589 ) ) ( not ( = ?auto_645580 ?auto_645590 ) ) ( not ( = ?auto_645580 ?auto_645591 ) ) ( not ( = ?auto_645580 ?auto_645592 ) ) ( not ( = ?auto_645581 ?auto_645582 ) ) ( not ( = ?auto_645581 ?auto_645583 ) ) ( not ( = ?auto_645581 ?auto_645584 ) ) ( not ( = ?auto_645581 ?auto_645585 ) ) ( not ( = ?auto_645581 ?auto_645586 ) ) ( not ( = ?auto_645581 ?auto_645587 ) ) ( not ( = ?auto_645581 ?auto_645588 ) ) ( not ( = ?auto_645581 ?auto_645589 ) ) ( not ( = ?auto_645581 ?auto_645590 ) ) ( not ( = ?auto_645581 ?auto_645591 ) ) ( not ( = ?auto_645581 ?auto_645592 ) ) ( not ( = ?auto_645582 ?auto_645583 ) ) ( not ( = ?auto_645582 ?auto_645584 ) ) ( not ( = ?auto_645582 ?auto_645585 ) ) ( not ( = ?auto_645582 ?auto_645586 ) ) ( not ( = ?auto_645582 ?auto_645587 ) ) ( not ( = ?auto_645582 ?auto_645588 ) ) ( not ( = ?auto_645582 ?auto_645589 ) ) ( not ( = ?auto_645582 ?auto_645590 ) ) ( not ( = ?auto_645582 ?auto_645591 ) ) ( not ( = ?auto_645582 ?auto_645592 ) ) ( not ( = ?auto_645583 ?auto_645584 ) ) ( not ( = ?auto_645583 ?auto_645585 ) ) ( not ( = ?auto_645583 ?auto_645586 ) ) ( not ( = ?auto_645583 ?auto_645587 ) ) ( not ( = ?auto_645583 ?auto_645588 ) ) ( not ( = ?auto_645583 ?auto_645589 ) ) ( not ( = ?auto_645583 ?auto_645590 ) ) ( not ( = ?auto_645583 ?auto_645591 ) ) ( not ( = ?auto_645583 ?auto_645592 ) ) ( not ( = ?auto_645584 ?auto_645585 ) ) ( not ( = ?auto_645584 ?auto_645586 ) ) ( not ( = ?auto_645584 ?auto_645587 ) ) ( not ( = ?auto_645584 ?auto_645588 ) ) ( not ( = ?auto_645584 ?auto_645589 ) ) ( not ( = ?auto_645584 ?auto_645590 ) ) ( not ( = ?auto_645584 ?auto_645591 ) ) ( not ( = ?auto_645584 ?auto_645592 ) ) ( not ( = ?auto_645585 ?auto_645586 ) ) ( not ( = ?auto_645585 ?auto_645587 ) ) ( not ( = ?auto_645585 ?auto_645588 ) ) ( not ( = ?auto_645585 ?auto_645589 ) ) ( not ( = ?auto_645585 ?auto_645590 ) ) ( not ( = ?auto_645585 ?auto_645591 ) ) ( not ( = ?auto_645585 ?auto_645592 ) ) ( not ( = ?auto_645586 ?auto_645587 ) ) ( not ( = ?auto_645586 ?auto_645588 ) ) ( not ( = ?auto_645586 ?auto_645589 ) ) ( not ( = ?auto_645586 ?auto_645590 ) ) ( not ( = ?auto_645586 ?auto_645591 ) ) ( not ( = ?auto_645586 ?auto_645592 ) ) ( not ( = ?auto_645587 ?auto_645588 ) ) ( not ( = ?auto_645587 ?auto_645589 ) ) ( not ( = ?auto_645587 ?auto_645590 ) ) ( not ( = ?auto_645587 ?auto_645591 ) ) ( not ( = ?auto_645587 ?auto_645592 ) ) ( not ( = ?auto_645588 ?auto_645589 ) ) ( not ( = ?auto_645588 ?auto_645590 ) ) ( not ( = ?auto_645588 ?auto_645591 ) ) ( not ( = ?auto_645588 ?auto_645592 ) ) ( not ( = ?auto_645589 ?auto_645590 ) ) ( not ( = ?auto_645589 ?auto_645591 ) ) ( not ( = ?auto_645589 ?auto_645592 ) ) ( not ( = ?auto_645590 ?auto_645591 ) ) ( not ( = ?auto_645590 ?auto_645592 ) ) ( not ( = ?auto_645591 ?auto_645592 ) ) ( ON ?auto_645590 ?auto_645591 ) ( ON ?auto_645589 ?auto_645590 ) ( CLEAR ?auto_645587 ) ( ON ?auto_645588 ?auto_645589 ) ( CLEAR ?auto_645588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_645579 ?auto_645580 ?auto_645581 ?auto_645582 ?auto_645583 ?auto_645584 ?auto_645585 ?auto_645586 ?auto_645587 ?auto_645588 )
      ( MAKE-13PILE ?auto_645579 ?auto_645580 ?auto_645581 ?auto_645582 ?auto_645583 ?auto_645584 ?auto_645585 ?auto_645586 ?auto_645587 ?auto_645588 ?auto_645589 ?auto_645590 ?auto_645591 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645633 - BLOCK
      ?auto_645634 - BLOCK
      ?auto_645635 - BLOCK
      ?auto_645636 - BLOCK
      ?auto_645637 - BLOCK
      ?auto_645638 - BLOCK
      ?auto_645639 - BLOCK
      ?auto_645640 - BLOCK
      ?auto_645641 - BLOCK
      ?auto_645642 - BLOCK
      ?auto_645643 - BLOCK
      ?auto_645644 - BLOCK
      ?auto_645645 - BLOCK
    )
    :vars
    (
      ?auto_645646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645645 ?auto_645646 ) ( ON-TABLE ?auto_645633 ) ( ON ?auto_645634 ?auto_645633 ) ( ON ?auto_645635 ?auto_645634 ) ( ON ?auto_645636 ?auto_645635 ) ( ON ?auto_645637 ?auto_645636 ) ( ON ?auto_645638 ?auto_645637 ) ( ON ?auto_645639 ?auto_645638 ) ( ON ?auto_645640 ?auto_645639 ) ( not ( = ?auto_645633 ?auto_645634 ) ) ( not ( = ?auto_645633 ?auto_645635 ) ) ( not ( = ?auto_645633 ?auto_645636 ) ) ( not ( = ?auto_645633 ?auto_645637 ) ) ( not ( = ?auto_645633 ?auto_645638 ) ) ( not ( = ?auto_645633 ?auto_645639 ) ) ( not ( = ?auto_645633 ?auto_645640 ) ) ( not ( = ?auto_645633 ?auto_645641 ) ) ( not ( = ?auto_645633 ?auto_645642 ) ) ( not ( = ?auto_645633 ?auto_645643 ) ) ( not ( = ?auto_645633 ?auto_645644 ) ) ( not ( = ?auto_645633 ?auto_645645 ) ) ( not ( = ?auto_645633 ?auto_645646 ) ) ( not ( = ?auto_645634 ?auto_645635 ) ) ( not ( = ?auto_645634 ?auto_645636 ) ) ( not ( = ?auto_645634 ?auto_645637 ) ) ( not ( = ?auto_645634 ?auto_645638 ) ) ( not ( = ?auto_645634 ?auto_645639 ) ) ( not ( = ?auto_645634 ?auto_645640 ) ) ( not ( = ?auto_645634 ?auto_645641 ) ) ( not ( = ?auto_645634 ?auto_645642 ) ) ( not ( = ?auto_645634 ?auto_645643 ) ) ( not ( = ?auto_645634 ?auto_645644 ) ) ( not ( = ?auto_645634 ?auto_645645 ) ) ( not ( = ?auto_645634 ?auto_645646 ) ) ( not ( = ?auto_645635 ?auto_645636 ) ) ( not ( = ?auto_645635 ?auto_645637 ) ) ( not ( = ?auto_645635 ?auto_645638 ) ) ( not ( = ?auto_645635 ?auto_645639 ) ) ( not ( = ?auto_645635 ?auto_645640 ) ) ( not ( = ?auto_645635 ?auto_645641 ) ) ( not ( = ?auto_645635 ?auto_645642 ) ) ( not ( = ?auto_645635 ?auto_645643 ) ) ( not ( = ?auto_645635 ?auto_645644 ) ) ( not ( = ?auto_645635 ?auto_645645 ) ) ( not ( = ?auto_645635 ?auto_645646 ) ) ( not ( = ?auto_645636 ?auto_645637 ) ) ( not ( = ?auto_645636 ?auto_645638 ) ) ( not ( = ?auto_645636 ?auto_645639 ) ) ( not ( = ?auto_645636 ?auto_645640 ) ) ( not ( = ?auto_645636 ?auto_645641 ) ) ( not ( = ?auto_645636 ?auto_645642 ) ) ( not ( = ?auto_645636 ?auto_645643 ) ) ( not ( = ?auto_645636 ?auto_645644 ) ) ( not ( = ?auto_645636 ?auto_645645 ) ) ( not ( = ?auto_645636 ?auto_645646 ) ) ( not ( = ?auto_645637 ?auto_645638 ) ) ( not ( = ?auto_645637 ?auto_645639 ) ) ( not ( = ?auto_645637 ?auto_645640 ) ) ( not ( = ?auto_645637 ?auto_645641 ) ) ( not ( = ?auto_645637 ?auto_645642 ) ) ( not ( = ?auto_645637 ?auto_645643 ) ) ( not ( = ?auto_645637 ?auto_645644 ) ) ( not ( = ?auto_645637 ?auto_645645 ) ) ( not ( = ?auto_645637 ?auto_645646 ) ) ( not ( = ?auto_645638 ?auto_645639 ) ) ( not ( = ?auto_645638 ?auto_645640 ) ) ( not ( = ?auto_645638 ?auto_645641 ) ) ( not ( = ?auto_645638 ?auto_645642 ) ) ( not ( = ?auto_645638 ?auto_645643 ) ) ( not ( = ?auto_645638 ?auto_645644 ) ) ( not ( = ?auto_645638 ?auto_645645 ) ) ( not ( = ?auto_645638 ?auto_645646 ) ) ( not ( = ?auto_645639 ?auto_645640 ) ) ( not ( = ?auto_645639 ?auto_645641 ) ) ( not ( = ?auto_645639 ?auto_645642 ) ) ( not ( = ?auto_645639 ?auto_645643 ) ) ( not ( = ?auto_645639 ?auto_645644 ) ) ( not ( = ?auto_645639 ?auto_645645 ) ) ( not ( = ?auto_645639 ?auto_645646 ) ) ( not ( = ?auto_645640 ?auto_645641 ) ) ( not ( = ?auto_645640 ?auto_645642 ) ) ( not ( = ?auto_645640 ?auto_645643 ) ) ( not ( = ?auto_645640 ?auto_645644 ) ) ( not ( = ?auto_645640 ?auto_645645 ) ) ( not ( = ?auto_645640 ?auto_645646 ) ) ( not ( = ?auto_645641 ?auto_645642 ) ) ( not ( = ?auto_645641 ?auto_645643 ) ) ( not ( = ?auto_645641 ?auto_645644 ) ) ( not ( = ?auto_645641 ?auto_645645 ) ) ( not ( = ?auto_645641 ?auto_645646 ) ) ( not ( = ?auto_645642 ?auto_645643 ) ) ( not ( = ?auto_645642 ?auto_645644 ) ) ( not ( = ?auto_645642 ?auto_645645 ) ) ( not ( = ?auto_645642 ?auto_645646 ) ) ( not ( = ?auto_645643 ?auto_645644 ) ) ( not ( = ?auto_645643 ?auto_645645 ) ) ( not ( = ?auto_645643 ?auto_645646 ) ) ( not ( = ?auto_645644 ?auto_645645 ) ) ( not ( = ?auto_645644 ?auto_645646 ) ) ( not ( = ?auto_645645 ?auto_645646 ) ) ( ON ?auto_645644 ?auto_645645 ) ( ON ?auto_645643 ?auto_645644 ) ( ON ?auto_645642 ?auto_645643 ) ( CLEAR ?auto_645640 ) ( ON ?auto_645641 ?auto_645642 ) ( CLEAR ?auto_645641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_645633 ?auto_645634 ?auto_645635 ?auto_645636 ?auto_645637 ?auto_645638 ?auto_645639 ?auto_645640 ?auto_645641 )
      ( MAKE-13PILE ?auto_645633 ?auto_645634 ?auto_645635 ?auto_645636 ?auto_645637 ?auto_645638 ?auto_645639 ?auto_645640 ?auto_645641 ?auto_645642 ?auto_645643 ?auto_645644 ?auto_645645 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645687 - BLOCK
      ?auto_645688 - BLOCK
      ?auto_645689 - BLOCK
      ?auto_645690 - BLOCK
      ?auto_645691 - BLOCK
      ?auto_645692 - BLOCK
      ?auto_645693 - BLOCK
      ?auto_645694 - BLOCK
      ?auto_645695 - BLOCK
      ?auto_645696 - BLOCK
      ?auto_645697 - BLOCK
      ?auto_645698 - BLOCK
      ?auto_645699 - BLOCK
    )
    :vars
    (
      ?auto_645700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645699 ?auto_645700 ) ( ON-TABLE ?auto_645687 ) ( ON ?auto_645688 ?auto_645687 ) ( ON ?auto_645689 ?auto_645688 ) ( ON ?auto_645690 ?auto_645689 ) ( ON ?auto_645691 ?auto_645690 ) ( ON ?auto_645692 ?auto_645691 ) ( ON ?auto_645693 ?auto_645692 ) ( not ( = ?auto_645687 ?auto_645688 ) ) ( not ( = ?auto_645687 ?auto_645689 ) ) ( not ( = ?auto_645687 ?auto_645690 ) ) ( not ( = ?auto_645687 ?auto_645691 ) ) ( not ( = ?auto_645687 ?auto_645692 ) ) ( not ( = ?auto_645687 ?auto_645693 ) ) ( not ( = ?auto_645687 ?auto_645694 ) ) ( not ( = ?auto_645687 ?auto_645695 ) ) ( not ( = ?auto_645687 ?auto_645696 ) ) ( not ( = ?auto_645687 ?auto_645697 ) ) ( not ( = ?auto_645687 ?auto_645698 ) ) ( not ( = ?auto_645687 ?auto_645699 ) ) ( not ( = ?auto_645687 ?auto_645700 ) ) ( not ( = ?auto_645688 ?auto_645689 ) ) ( not ( = ?auto_645688 ?auto_645690 ) ) ( not ( = ?auto_645688 ?auto_645691 ) ) ( not ( = ?auto_645688 ?auto_645692 ) ) ( not ( = ?auto_645688 ?auto_645693 ) ) ( not ( = ?auto_645688 ?auto_645694 ) ) ( not ( = ?auto_645688 ?auto_645695 ) ) ( not ( = ?auto_645688 ?auto_645696 ) ) ( not ( = ?auto_645688 ?auto_645697 ) ) ( not ( = ?auto_645688 ?auto_645698 ) ) ( not ( = ?auto_645688 ?auto_645699 ) ) ( not ( = ?auto_645688 ?auto_645700 ) ) ( not ( = ?auto_645689 ?auto_645690 ) ) ( not ( = ?auto_645689 ?auto_645691 ) ) ( not ( = ?auto_645689 ?auto_645692 ) ) ( not ( = ?auto_645689 ?auto_645693 ) ) ( not ( = ?auto_645689 ?auto_645694 ) ) ( not ( = ?auto_645689 ?auto_645695 ) ) ( not ( = ?auto_645689 ?auto_645696 ) ) ( not ( = ?auto_645689 ?auto_645697 ) ) ( not ( = ?auto_645689 ?auto_645698 ) ) ( not ( = ?auto_645689 ?auto_645699 ) ) ( not ( = ?auto_645689 ?auto_645700 ) ) ( not ( = ?auto_645690 ?auto_645691 ) ) ( not ( = ?auto_645690 ?auto_645692 ) ) ( not ( = ?auto_645690 ?auto_645693 ) ) ( not ( = ?auto_645690 ?auto_645694 ) ) ( not ( = ?auto_645690 ?auto_645695 ) ) ( not ( = ?auto_645690 ?auto_645696 ) ) ( not ( = ?auto_645690 ?auto_645697 ) ) ( not ( = ?auto_645690 ?auto_645698 ) ) ( not ( = ?auto_645690 ?auto_645699 ) ) ( not ( = ?auto_645690 ?auto_645700 ) ) ( not ( = ?auto_645691 ?auto_645692 ) ) ( not ( = ?auto_645691 ?auto_645693 ) ) ( not ( = ?auto_645691 ?auto_645694 ) ) ( not ( = ?auto_645691 ?auto_645695 ) ) ( not ( = ?auto_645691 ?auto_645696 ) ) ( not ( = ?auto_645691 ?auto_645697 ) ) ( not ( = ?auto_645691 ?auto_645698 ) ) ( not ( = ?auto_645691 ?auto_645699 ) ) ( not ( = ?auto_645691 ?auto_645700 ) ) ( not ( = ?auto_645692 ?auto_645693 ) ) ( not ( = ?auto_645692 ?auto_645694 ) ) ( not ( = ?auto_645692 ?auto_645695 ) ) ( not ( = ?auto_645692 ?auto_645696 ) ) ( not ( = ?auto_645692 ?auto_645697 ) ) ( not ( = ?auto_645692 ?auto_645698 ) ) ( not ( = ?auto_645692 ?auto_645699 ) ) ( not ( = ?auto_645692 ?auto_645700 ) ) ( not ( = ?auto_645693 ?auto_645694 ) ) ( not ( = ?auto_645693 ?auto_645695 ) ) ( not ( = ?auto_645693 ?auto_645696 ) ) ( not ( = ?auto_645693 ?auto_645697 ) ) ( not ( = ?auto_645693 ?auto_645698 ) ) ( not ( = ?auto_645693 ?auto_645699 ) ) ( not ( = ?auto_645693 ?auto_645700 ) ) ( not ( = ?auto_645694 ?auto_645695 ) ) ( not ( = ?auto_645694 ?auto_645696 ) ) ( not ( = ?auto_645694 ?auto_645697 ) ) ( not ( = ?auto_645694 ?auto_645698 ) ) ( not ( = ?auto_645694 ?auto_645699 ) ) ( not ( = ?auto_645694 ?auto_645700 ) ) ( not ( = ?auto_645695 ?auto_645696 ) ) ( not ( = ?auto_645695 ?auto_645697 ) ) ( not ( = ?auto_645695 ?auto_645698 ) ) ( not ( = ?auto_645695 ?auto_645699 ) ) ( not ( = ?auto_645695 ?auto_645700 ) ) ( not ( = ?auto_645696 ?auto_645697 ) ) ( not ( = ?auto_645696 ?auto_645698 ) ) ( not ( = ?auto_645696 ?auto_645699 ) ) ( not ( = ?auto_645696 ?auto_645700 ) ) ( not ( = ?auto_645697 ?auto_645698 ) ) ( not ( = ?auto_645697 ?auto_645699 ) ) ( not ( = ?auto_645697 ?auto_645700 ) ) ( not ( = ?auto_645698 ?auto_645699 ) ) ( not ( = ?auto_645698 ?auto_645700 ) ) ( not ( = ?auto_645699 ?auto_645700 ) ) ( ON ?auto_645698 ?auto_645699 ) ( ON ?auto_645697 ?auto_645698 ) ( ON ?auto_645696 ?auto_645697 ) ( ON ?auto_645695 ?auto_645696 ) ( CLEAR ?auto_645693 ) ( ON ?auto_645694 ?auto_645695 ) ( CLEAR ?auto_645694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_645687 ?auto_645688 ?auto_645689 ?auto_645690 ?auto_645691 ?auto_645692 ?auto_645693 ?auto_645694 )
      ( MAKE-13PILE ?auto_645687 ?auto_645688 ?auto_645689 ?auto_645690 ?auto_645691 ?auto_645692 ?auto_645693 ?auto_645694 ?auto_645695 ?auto_645696 ?auto_645697 ?auto_645698 ?auto_645699 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645741 - BLOCK
      ?auto_645742 - BLOCK
      ?auto_645743 - BLOCK
      ?auto_645744 - BLOCK
      ?auto_645745 - BLOCK
      ?auto_645746 - BLOCK
      ?auto_645747 - BLOCK
      ?auto_645748 - BLOCK
      ?auto_645749 - BLOCK
      ?auto_645750 - BLOCK
      ?auto_645751 - BLOCK
      ?auto_645752 - BLOCK
      ?auto_645753 - BLOCK
    )
    :vars
    (
      ?auto_645754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645753 ?auto_645754 ) ( ON-TABLE ?auto_645741 ) ( ON ?auto_645742 ?auto_645741 ) ( ON ?auto_645743 ?auto_645742 ) ( ON ?auto_645744 ?auto_645743 ) ( ON ?auto_645745 ?auto_645744 ) ( ON ?auto_645746 ?auto_645745 ) ( not ( = ?auto_645741 ?auto_645742 ) ) ( not ( = ?auto_645741 ?auto_645743 ) ) ( not ( = ?auto_645741 ?auto_645744 ) ) ( not ( = ?auto_645741 ?auto_645745 ) ) ( not ( = ?auto_645741 ?auto_645746 ) ) ( not ( = ?auto_645741 ?auto_645747 ) ) ( not ( = ?auto_645741 ?auto_645748 ) ) ( not ( = ?auto_645741 ?auto_645749 ) ) ( not ( = ?auto_645741 ?auto_645750 ) ) ( not ( = ?auto_645741 ?auto_645751 ) ) ( not ( = ?auto_645741 ?auto_645752 ) ) ( not ( = ?auto_645741 ?auto_645753 ) ) ( not ( = ?auto_645741 ?auto_645754 ) ) ( not ( = ?auto_645742 ?auto_645743 ) ) ( not ( = ?auto_645742 ?auto_645744 ) ) ( not ( = ?auto_645742 ?auto_645745 ) ) ( not ( = ?auto_645742 ?auto_645746 ) ) ( not ( = ?auto_645742 ?auto_645747 ) ) ( not ( = ?auto_645742 ?auto_645748 ) ) ( not ( = ?auto_645742 ?auto_645749 ) ) ( not ( = ?auto_645742 ?auto_645750 ) ) ( not ( = ?auto_645742 ?auto_645751 ) ) ( not ( = ?auto_645742 ?auto_645752 ) ) ( not ( = ?auto_645742 ?auto_645753 ) ) ( not ( = ?auto_645742 ?auto_645754 ) ) ( not ( = ?auto_645743 ?auto_645744 ) ) ( not ( = ?auto_645743 ?auto_645745 ) ) ( not ( = ?auto_645743 ?auto_645746 ) ) ( not ( = ?auto_645743 ?auto_645747 ) ) ( not ( = ?auto_645743 ?auto_645748 ) ) ( not ( = ?auto_645743 ?auto_645749 ) ) ( not ( = ?auto_645743 ?auto_645750 ) ) ( not ( = ?auto_645743 ?auto_645751 ) ) ( not ( = ?auto_645743 ?auto_645752 ) ) ( not ( = ?auto_645743 ?auto_645753 ) ) ( not ( = ?auto_645743 ?auto_645754 ) ) ( not ( = ?auto_645744 ?auto_645745 ) ) ( not ( = ?auto_645744 ?auto_645746 ) ) ( not ( = ?auto_645744 ?auto_645747 ) ) ( not ( = ?auto_645744 ?auto_645748 ) ) ( not ( = ?auto_645744 ?auto_645749 ) ) ( not ( = ?auto_645744 ?auto_645750 ) ) ( not ( = ?auto_645744 ?auto_645751 ) ) ( not ( = ?auto_645744 ?auto_645752 ) ) ( not ( = ?auto_645744 ?auto_645753 ) ) ( not ( = ?auto_645744 ?auto_645754 ) ) ( not ( = ?auto_645745 ?auto_645746 ) ) ( not ( = ?auto_645745 ?auto_645747 ) ) ( not ( = ?auto_645745 ?auto_645748 ) ) ( not ( = ?auto_645745 ?auto_645749 ) ) ( not ( = ?auto_645745 ?auto_645750 ) ) ( not ( = ?auto_645745 ?auto_645751 ) ) ( not ( = ?auto_645745 ?auto_645752 ) ) ( not ( = ?auto_645745 ?auto_645753 ) ) ( not ( = ?auto_645745 ?auto_645754 ) ) ( not ( = ?auto_645746 ?auto_645747 ) ) ( not ( = ?auto_645746 ?auto_645748 ) ) ( not ( = ?auto_645746 ?auto_645749 ) ) ( not ( = ?auto_645746 ?auto_645750 ) ) ( not ( = ?auto_645746 ?auto_645751 ) ) ( not ( = ?auto_645746 ?auto_645752 ) ) ( not ( = ?auto_645746 ?auto_645753 ) ) ( not ( = ?auto_645746 ?auto_645754 ) ) ( not ( = ?auto_645747 ?auto_645748 ) ) ( not ( = ?auto_645747 ?auto_645749 ) ) ( not ( = ?auto_645747 ?auto_645750 ) ) ( not ( = ?auto_645747 ?auto_645751 ) ) ( not ( = ?auto_645747 ?auto_645752 ) ) ( not ( = ?auto_645747 ?auto_645753 ) ) ( not ( = ?auto_645747 ?auto_645754 ) ) ( not ( = ?auto_645748 ?auto_645749 ) ) ( not ( = ?auto_645748 ?auto_645750 ) ) ( not ( = ?auto_645748 ?auto_645751 ) ) ( not ( = ?auto_645748 ?auto_645752 ) ) ( not ( = ?auto_645748 ?auto_645753 ) ) ( not ( = ?auto_645748 ?auto_645754 ) ) ( not ( = ?auto_645749 ?auto_645750 ) ) ( not ( = ?auto_645749 ?auto_645751 ) ) ( not ( = ?auto_645749 ?auto_645752 ) ) ( not ( = ?auto_645749 ?auto_645753 ) ) ( not ( = ?auto_645749 ?auto_645754 ) ) ( not ( = ?auto_645750 ?auto_645751 ) ) ( not ( = ?auto_645750 ?auto_645752 ) ) ( not ( = ?auto_645750 ?auto_645753 ) ) ( not ( = ?auto_645750 ?auto_645754 ) ) ( not ( = ?auto_645751 ?auto_645752 ) ) ( not ( = ?auto_645751 ?auto_645753 ) ) ( not ( = ?auto_645751 ?auto_645754 ) ) ( not ( = ?auto_645752 ?auto_645753 ) ) ( not ( = ?auto_645752 ?auto_645754 ) ) ( not ( = ?auto_645753 ?auto_645754 ) ) ( ON ?auto_645752 ?auto_645753 ) ( ON ?auto_645751 ?auto_645752 ) ( ON ?auto_645750 ?auto_645751 ) ( ON ?auto_645749 ?auto_645750 ) ( ON ?auto_645748 ?auto_645749 ) ( CLEAR ?auto_645746 ) ( ON ?auto_645747 ?auto_645748 ) ( CLEAR ?auto_645747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_645741 ?auto_645742 ?auto_645743 ?auto_645744 ?auto_645745 ?auto_645746 ?auto_645747 )
      ( MAKE-13PILE ?auto_645741 ?auto_645742 ?auto_645743 ?auto_645744 ?auto_645745 ?auto_645746 ?auto_645747 ?auto_645748 ?auto_645749 ?auto_645750 ?auto_645751 ?auto_645752 ?auto_645753 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645795 - BLOCK
      ?auto_645796 - BLOCK
      ?auto_645797 - BLOCK
      ?auto_645798 - BLOCK
      ?auto_645799 - BLOCK
      ?auto_645800 - BLOCK
      ?auto_645801 - BLOCK
      ?auto_645802 - BLOCK
      ?auto_645803 - BLOCK
      ?auto_645804 - BLOCK
      ?auto_645805 - BLOCK
      ?auto_645806 - BLOCK
      ?auto_645807 - BLOCK
    )
    :vars
    (
      ?auto_645808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645807 ?auto_645808 ) ( ON-TABLE ?auto_645795 ) ( ON ?auto_645796 ?auto_645795 ) ( ON ?auto_645797 ?auto_645796 ) ( ON ?auto_645798 ?auto_645797 ) ( ON ?auto_645799 ?auto_645798 ) ( not ( = ?auto_645795 ?auto_645796 ) ) ( not ( = ?auto_645795 ?auto_645797 ) ) ( not ( = ?auto_645795 ?auto_645798 ) ) ( not ( = ?auto_645795 ?auto_645799 ) ) ( not ( = ?auto_645795 ?auto_645800 ) ) ( not ( = ?auto_645795 ?auto_645801 ) ) ( not ( = ?auto_645795 ?auto_645802 ) ) ( not ( = ?auto_645795 ?auto_645803 ) ) ( not ( = ?auto_645795 ?auto_645804 ) ) ( not ( = ?auto_645795 ?auto_645805 ) ) ( not ( = ?auto_645795 ?auto_645806 ) ) ( not ( = ?auto_645795 ?auto_645807 ) ) ( not ( = ?auto_645795 ?auto_645808 ) ) ( not ( = ?auto_645796 ?auto_645797 ) ) ( not ( = ?auto_645796 ?auto_645798 ) ) ( not ( = ?auto_645796 ?auto_645799 ) ) ( not ( = ?auto_645796 ?auto_645800 ) ) ( not ( = ?auto_645796 ?auto_645801 ) ) ( not ( = ?auto_645796 ?auto_645802 ) ) ( not ( = ?auto_645796 ?auto_645803 ) ) ( not ( = ?auto_645796 ?auto_645804 ) ) ( not ( = ?auto_645796 ?auto_645805 ) ) ( not ( = ?auto_645796 ?auto_645806 ) ) ( not ( = ?auto_645796 ?auto_645807 ) ) ( not ( = ?auto_645796 ?auto_645808 ) ) ( not ( = ?auto_645797 ?auto_645798 ) ) ( not ( = ?auto_645797 ?auto_645799 ) ) ( not ( = ?auto_645797 ?auto_645800 ) ) ( not ( = ?auto_645797 ?auto_645801 ) ) ( not ( = ?auto_645797 ?auto_645802 ) ) ( not ( = ?auto_645797 ?auto_645803 ) ) ( not ( = ?auto_645797 ?auto_645804 ) ) ( not ( = ?auto_645797 ?auto_645805 ) ) ( not ( = ?auto_645797 ?auto_645806 ) ) ( not ( = ?auto_645797 ?auto_645807 ) ) ( not ( = ?auto_645797 ?auto_645808 ) ) ( not ( = ?auto_645798 ?auto_645799 ) ) ( not ( = ?auto_645798 ?auto_645800 ) ) ( not ( = ?auto_645798 ?auto_645801 ) ) ( not ( = ?auto_645798 ?auto_645802 ) ) ( not ( = ?auto_645798 ?auto_645803 ) ) ( not ( = ?auto_645798 ?auto_645804 ) ) ( not ( = ?auto_645798 ?auto_645805 ) ) ( not ( = ?auto_645798 ?auto_645806 ) ) ( not ( = ?auto_645798 ?auto_645807 ) ) ( not ( = ?auto_645798 ?auto_645808 ) ) ( not ( = ?auto_645799 ?auto_645800 ) ) ( not ( = ?auto_645799 ?auto_645801 ) ) ( not ( = ?auto_645799 ?auto_645802 ) ) ( not ( = ?auto_645799 ?auto_645803 ) ) ( not ( = ?auto_645799 ?auto_645804 ) ) ( not ( = ?auto_645799 ?auto_645805 ) ) ( not ( = ?auto_645799 ?auto_645806 ) ) ( not ( = ?auto_645799 ?auto_645807 ) ) ( not ( = ?auto_645799 ?auto_645808 ) ) ( not ( = ?auto_645800 ?auto_645801 ) ) ( not ( = ?auto_645800 ?auto_645802 ) ) ( not ( = ?auto_645800 ?auto_645803 ) ) ( not ( = ?auto_645800 ?auto_645804 ) ) ( not ( = ?auto_645800 ?auto_645805 ) ) ( not ( = ?auto_645800 ?auto_645806 ) ) ( not ( = ?auto_645800 ?auto_645807 ) ) ( not ( = ?auto_645800 ?auto_645808 ) ) ( not ( = ?auto_645801 ?auto_645802 ) ) ( not ( = ?auto_645801 ?auto_645803 ) ) ( not ( = ?auto_645801 ?auto_645804 ) ) ( not ( = ?auto_645801 ?auto_645805 ) ) ( not ( = ?auto_645801 ?auto_645806 ) ) ( not ( = ?auto_645801 ?auto_645807 ) ) ( not ( = ?auto_645801 ?auto_645808 ) ) ( not ( = ?auto_645802 ?auto_645803 ) ) ( not ( = ?auto_645802 ?auto_645804 ) ) ( not ( = ?auto_645802 ?auto_645805 ) ) ( not ( = ?auto_645802 ?auto_645806 ) ) ( not ( = ?auto_645802 ?auto_645807 ) ) ( not ( = ?auto_645802 ?auto_645808 ) ) ( not ( = ?auto_645803 ?auto_645804 ) ) ( not ( = ?auto_645803 ?auto_645805 ) ) ( not ( = ?auto_645803 ?auto_645806 ) ) ( not ( = ?auto_645803 ?auto_645807 ) ) ( not ( = ?auto_645803 ?auto_645808 ) ) ( not ( = ?auto_645804 ?auto_645805 ) ) ( not ( = ?auto_645804 ?auto_645806 ) ) ( not ( = ?auto_645804 ?auto_645807 ) ) ( not ( = ?auto_645804 ?auto_645808 ) ) ( not ( = ?auto_645805 ?auto_645806 ) ) ( not ( = ?auto_645805 ?auto_645807 ) ) ( not ( = ?auto_645805 ?auto_645808 ) ) ( not ( = ?auto_645806 ?auto_645807 ) ) ( not ( = ?auto_645806 ?auto_645808 ) ) ( not ( = ?auto_645807 ?auto_645808 ) ) ( ON ?auto_645806 ?auto_645807 ) ( ON ?auto_645805 ?auto_645806 ) ( ON ?auto_645804 ?auto_645805 ) ( ON ?auto_645803 ?auto_645804 ) ( ON ?auto_645802 ?auto_645803 ) ( ON ?auto_645801 ?auto_645802 ) ( CLEAR ?auto_645799 ) ( ON ?auto_645800 ?auto_645801 ) ( CLEAR ?auto_645800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_645795 ?auto_645796 ?auto_645797 ?auto_645798 ?auto_645799 ?auto_645800 )
      ( MAKE-13PILE ?auto_645795 ?auto_645796 ?auto_645797 ?auto_645798 ?auto_645799 ?auto_645800 ?auto_645801 ?auto_645802 ?auto_645803 ?auto_645804 ?auto_645805 ?auto_645806 ?auto_645807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645849 - BLOCK
      ?auto_645850 - BLOCK
      ?auto_645851 - BLOCK
      ?auto_645852 - BLOCK
      ?auto_645853 - BLOCK
      ?auto_645854 - BLOCK
      ?auto_645855 - BLOCK
      ?auto_645856 - BLOCK
      ?auto_645857 - BLOCK
      ?auto_645858 - BLOCK
      ?auto_645859 - BLOCK
      ?auto_645860 - BLOCK
      ?auto_645861 - BLOCK
    )
    :vars
    (
      ?auto_645862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645861 ?auto_645862 ) ( ON-TABLE ?auto_645849 ) ( ON ?auto_645850 ?auto_645849 ) ( ON ?auto_645851 ?auto_645850 ) ( ON ?auto_645852 ?auto_645851 ) ( not ( = ?auto_645849 ?auto_645850 ) ) ( not ( = ?auto_645849 ?auto_645851 ) ) ( not ( = ?auto_645849 ?auto_645852 ) ) ( not ( = ?auto_645849 ?auto_645853 ) ) ( not ( = ?auto_645849 ?auto_645854 ) ) ( not ( = ?auto_645849 ?auto_645855 ) ) ( not ( = ?auto_645849 ?auto_645856 ) ) ( not ( = ?auto_645849 ?auto_645857 ) ) ( not ( = ?auto_645849 ?auto_645858 ) ) ( not ( = ?auto_645849 ?auto_645859 ) ) ( not ( = ?auto_645849 ?auto_645860 ) ) ( not ( = ?auto_645849 ?auto_645861 ) ) ( not ( = ?auto_645849 ?auto_645862 ) ) ( not ( = ?auto_645850 ?auto_645851 ) ) ( not ( = ?auto_645850 ?auto_645852 ) ) ( not ( = ?auto_645850 ?auto_645853 ) ) ( not ( = ?auto_645850 ?auto_645854 ) ) ( not ( = ?auto_645850 ?auto_645855 ) ) ( not ( = ?auto_645850 ?auto_645856 ) ) ( not ( = ?auto_645850 ?auto_645857 ) ) ( not ( = ?auto_645850 ?auto_645858 ) ) ( not ( = ?auto_645850 ?auto_645859 ) ) ( not ( = ?auto_645850 ?auto_645860 ) ) ( not ( = ?auto_645850 ?auto_645861 ) ) ( not ( = ?auto_645850 ?auto_645862 ) ) ( not ( = ?auto_645851 ?auto_645852 ) ) ( not ( = ?auto_645851 ?auto_645853 ) ) ( not ( = ?auto_645851 ?auto_645854 ) ) ( not ( = ?auto_645851 ?auto_645855 ) ) ( not ( = ?auto_645851 ?auto_645856 ) ) ( not ( = ?auto_645851 ?auto_645857 ) ) ( not ( = ?auto_645851 ?auto_645858 ) ) ( not ( = ?auto_645851 ?auto_645859 ) ) ( not ( = ?auto_645851 ?auto_645860 ) ) ( not ( = ?auto_645851 ?auto_645861 ) ) ( not ( = ?auto_645851 ?auto_645862 ) ) ( not ( = ?auto_645852 ?auto_645853 ) ) ( not ( = ?auto_645852 ?auto_645854 ) ) ( not ( = ?auto_645852 ?auto_645855 ) ) ( not ( = ?auto_645852 ?auto_645856 ) ) ( not ( = ?auto_645852 ?auto_645857 ) ) ( not ( = ?auto_645852 ?auto_645858 ) ) ( not ( = ?auto_645852 ?auto_645859 ) ) ( not ( = ?auto_645852 ?auto_645860 ) ) ( not ( = ?auto_645852 ?auto_645861 ) ) ( not ( = ?auto_645852 ?auto_645862 ) ) ( not ( = ?auto_645853 ?auto_645854 ) ) ( not ( = ?auto_645853 ?auto_645855 ) ) ( not ( = ?auto_645853 ?auto_645856 ) ) ( not ( = ?auto_645853 ?auto_645857 ) ) ( not ( = ?auto_645853 ?auto_645858 ) ) ( not ( = ?auto_645853 ?auto_645859 ) ) ( not ( = ?auto_645853 ?auto_645860 ) ) ( not ( = ?auto_645853 ?auto_645861 ) ) ( not ( = ?auto_645853 ?auto_645862 ) ) ( not ( = ?auto_645854 ?auto_645855 ) ) ( not ( = ?auto_645854 ?auto_645856 ) ) ( not ( = ?auto_645854 ?auto_645857 ) ) ( not ( = ?auto_645854 ?auto_645858 ) ) ( not ( = ?auto_645854 ?auto_645859 ) ) ( not ( = ?auto_645854 ?auto_645860 ) ) ( not ( = ?auto_645854 ?auto_645861 ) ) ( not ( = ?auto_645854 ?auto_645862 ) ) ( not ( = ?auto_645855 ?auto_645856 ) ) ( not ( = ?auto_645855 ?auto_645857 ) ) ( not ( = ?auto_645855 ?auto_645858 ) ) ( not ( = ?auto_645855 ?auto_645859 ) ) ( not ( = ?auto_645855 ?auto_645860 ) ) ( not ( = ?auto_645855 ?auto_645861 ) ) ( not ( = ?auto_645855 ?auto_645862 ) ) ( not ( = ?auto_645856 ?auto_645857 ) ) ( not ( = ?auto_645856 ?auto_645858 ) ) ( not ( = ?auto_645856 ?auto_645859 ) ) ( not ( = ?auto_645856 ?auto_645860 ) ) ( not ( = ?auto_645856 ?auto_645861 ) ) ( not ( = ?auto_645856 ?auto_645862 ) ) ( not ( = ?auto_645857 ?auto_645858 ) ) ( not ( = ?auto_645857 ?auto_645859 ) ) ( not ( = ?auto_645857 ?auto_645860 ) ) ( not ( = ?auto_645857 ?auto_645861 ) ) ( not ( = ?auto_645857 ?auto_645862 ) ) ( not ( = ?auto_645858 ?auto_645859 ) ) ( not ( = ?auto_645858 ?auto_645860 ) ) ( not ( = ?auto_645858 ?auto_645861 ) ) ( not ( = ?auto_645858 ?auto_645862 ) ) ( not ( = ?auto_645859 ?auto_645860 ) ) ( not ( = ?auto_645859 ?auto_645861 ) ) ( not ( = ?auto_645859 ?auto_645862 ) ) ( not ( = ?auto_645860 ?auto_645861 ) ) ( not ( = ?auto_645860 ?auto_645862 ) ) ( not ( = ?auto_645861 ?auto_645862 ) ) ( ON ?auto_645860 ?auto_645861 ) ( ON ?auto_645859 ?auto_645860 ) ( ON ?auto_645858 ?auto_645859 ) ( ON ?auto_645857 ?auto_645858 ) ( ON ?auto_645856 ?auto_645857 ) ( ON ?auto_645855 ?auto_645856 ) ( ON ?auto_645854 ?auto_645855 ) ( CLEAR ?auto_645852 ) ( ON ?auto_645853 ?auto_645854 ) ( CLEAR ?auto_645853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_645849 ?auto_645850 ?auto_645851 ?auto_645852 ?auto_645853 )
      ( MAKE-13PILE ?auto_645849 ?auto_645850 ?auto_645851 ?auto_645852 ?auto_645853 ?auto_645854 ?auto_645855 ?auto_645856 ?auto_645857 ?auto_645858 ?auto_645859 ?auto_645860 ?auto_645861 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645903 - BLOCK
      ?auto_645904 - BLOCK
      ?auto_645905 - BLOCK
      ?auto_645906 - BLOCK
      ?auto_645907 - BLOCK
      ?auto_645908 - BLOCK
      ?auto_645909 - BLOCK
      ?auto_645910 - BLOCK
      ?auto_645911 - BLOCK
      ?auto_645912 - BLOCK
      ?auto_645913 - BLOCK
      ?auto_645914 - BLOCK
      ?auto_645915 - BLOCK
    )
    :vars
    (
      ?auto_645916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645915 ?auto_645916 ) ( ON-TABLE ?auto_645903 ) ( ON ?auto_645904 ?auto_645903 ) ( ON ?auto_645905 ?auto_645904 ) ( not ( = ?auto_645903 ?auto_645904 ) ) ( not ( = ?auto_645903 ?auto_645905 ) ) ( not ( = ?auto_645903 ?auto_645906 ) ) ( not ( = ?auto_645903 ?auto_645907 ) ) ( not ( = ?auto_645903 ?auto_645908 ) ) ( not ( = ?auto_645903 ?auto_645909 ) ) ( not ( = ?auto_645903 ?auto_645910 ) ) ( not ( = ?auto_645903 ?auto_645911 ) ) ( not ( = ?auto_645903 ?auto_645912 ) ) ( not ( = ?auto_645903 ?auto_645913 ) ) ( not ( = ?auto_645903 ?auto_645914 ) ) ( not ( = ?auto_645903 ?auto_645915 ) ) ( not ( = ?auto_645903 ?auto_645916 ) ) ( not ( = ?auto_645904 ?auto_645905 ) ) ( not ( = ?auto_645904 ?auto_645906 ) ) ( not ( = ?auto_645904 ?auto_645907 ) ) ( not ( = ?auto_645904 ?auto_645908 ) ) ( not ( = ?auto_645904 ?auto_645909 ) ) ( not ( = ?auto_645904 ?auto_645910 ) ) ( not ( = ?auto_645904 ?auto_645911 ) ) ( not ( = ?auto_645904 ?auto_645912 ) ) ( not ( = ?auto_645904 ?auto_645913 ) ) ( not ( = ?auto_645904 ?auto_645914 ) ) ( not ( = ?auto_645904 ?auto_645915 ) ) ( not ( = ?auto_645904 ?auto_645916 ) ) ( not ( = ?auto_645905 ?auto_645906 ) ) ( not ( = ?auto_645905 ?auto_645907 ) ) ( not ( = ?auto_645905 ?auto_645908 ) ) ( not ( = ?auto_645905 ?auto_645909 ) ) ( not ( = ?auto_645905 ?auto_645910 ) ) ( not ( = ?auto_645905 ?auto_645911 ) ) ( not ( = ?auto_645905 ?auto_645912 ) ) ( not ( = ?auto_645905 ?auto_645913 ) ) ( not ( = ?auto_645905 ?auto_645914 ) ) ( not ( = ?auto_645905 ?auto_645915 ) ) ( not ( = ?auto_645905 ?auto_645916 ) ) ( not ( = ?auto_645906 ?auto_645907 ) ) ( not ( = ?auto_645906 ?auto_645908 ) ) ( not ( = ?auto_645906 ?auto_645909 ) ) ( not ( = ?auto_645906 ?auto_645910 ) ) ( not ( = ?auto_645906 ?auto_645911 ) ) ( not ( = ?auto_645906 ?auto_645912 ) ) ( not ( = ?auto_645906 ?auto_645913 ) ) ( not ( = ?auto_645906 ?auto_645914 ) ) ( not ( = ?auto_645906 ?auto_645915 ) ) ( not ( = ?auto_645906 ?auto_645916 ) ) ( not ( = ?auto_645907 ?auto_645908 ) ) ( not ( = ?auto_645907 ?auto_645909 ) ) ( not ( = ?auto_645907 ?auto_645910 ) ) ( not ( = ?auto_645907 ?auto_645911 ) ) ( not ( = ?auto_645907 ?auto_645912 ) ) ( not ( = ?auto_645907 ?auto_645913 ) ) ( not ( = ?auto_645907 ?auto_645914 ) ) ( not ( = ?auto_645907 ?auto_645915 ) ) ( not ( = ?auto_645907 ?auto_645916 ) ) ( not ( = ?auto_645908 ?auto_645909 ) ) ( not ( = ?auto_645908 ?auto_645910 ) ) ( not ( = ?auto_645908 ?auto_645911 ) ) ( not ( = ?auto_645908 ?auto_645912 ) ) ( not ( = ?auto_645908 ?auto_645913 ) ) ( not ( = ?auto_645908 ?auto_645914 ) ) ( not ( = ?auto_645908 ?auto_645915 ) ) ( not ( = ?auto_645908 ?auto_645916 ) ) ( not ( = ?auto_645909 ?auto_645910 ) ) ( not ( = ?auto_645909 ?auto_645911 ) ) ( not ( = ?auto_645909 ?auto_645912 ) ) ( not ( = ?auto_645909 ?auto_645913 ) ) ( not ( = ?auto_645909 ?auto_645914 ) ) ( not ( = ?auto_645909 ?auto_645915 ) ) ( not ( = ?auto_645909 ?auto_645916 ) ) ( not ( = ?auto_645910 ?auto_645911 ) ) ( not ( = ?auto_645910 ?auto_645912 ) ) ( not ( = ?auto_645910 ?auto_645913 ) ) ( not ( = ?auto_645910 ?auto_645914 ) ) ( not ( = ?auto_645910 ?auto_645915 ) ) ( not ( = ?auto_645910 ?auto_645916 ) ) ( not ( = ?auto_645911 ?auto_645912 ) ) ( not ( = ?auto_645911 ?auto_645913 ) ) ( not ( = ?auto_645911 ?auto_645914 ) ) ( not ( = ?auto_645911 ?auto_645915 ) ) ( not ( = ?auto_645911 ?auto_645916 ) ) ( not ( = ?auto_645912 ?auto_645913 ) ) ( not ( = ?auto_645912 ?auto_645914 ) ) ( not ( = ?auto_645912 ?auto_645915 ) ) ( not ( = ?auto_645912 ?auto_645916 ) ) ( not ( = ?auto_645913 ?auto_645914 ) ) ( not ( = ?auto_645913 ?auto_645915 ) ) ( not ( = ?auto_645913 ?auto_645916 ) ) ( not ( = ?auto_645914 ?auto_645915 ) ) ( not ( = ?auto_645914 ?auto_645916 ) ) ( not ( = ?auto_645915 ?auto_645916 ) ) ( ON ?auto_645914 ?auto_645915 ) ( ON ?auto_645913 ?auto_645914 ) ( ON ?auto_645912 ?auto_645913 ) ( ON ?auto_645911 ?auto_645912 ) ( ON ?auto_645910 ?auto_645911 ) ( ON ?auto_645909 ?auto_645910 ) ( ON ?auto_645908 ?auto_645909 ) ( ON ?auto_645907 ?auto_645908 ) ( CLEAR ?auto_645905 ) ( ON ?auto_645906 ?auto_645907 ) ( CLEAR ?auto_645906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_645903 ?auto_645904 ?auto_645905 ?auto_645906 )
      ( MAKE-13PILE ?auto_645903 ?auto_645904 ?auto_645905 ?auto_645906 ?auto_645907 ?auto_645908 ?auto_645909 ?auto_645910 ?auto_645911 ?auto_645912 ?auto_645913 ?auto_645914 ?auto_645915 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_645957 - BLOCK
      ?auto_645958 - BLOCK
      ?auto_645959 - BLOCK
      ?auto_645960 - BLOCK
      ?auto_645961 - BLOCK
      ?auto_645962 - BLOCK
      ?auto_645963 - BLOCK
      ?auto_645964 - BLOCK
      ?auto_645965 - BLOCK
      ?auto_645966 - BLOCK
      ?auto_645967 - BLOCK
      ?auto_645968 - BLOCK
      ?auto_645969 - BLOCK
    )
    :vars
    (
      ?auto_645970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_645969 ?auto_645970 ) ( ON-TABLE ?auto_645957 ) ( ON ?auto_645958 ?auto_645957 ) ( not ( = ?auto_645957 ?auto_645958 ) ) ( not ( = ?auto_645957 ?auto_645959 ) ) ( not ( = ?auto_645957 ?auto_645960 ) ) ( not ( = ?auto_645957 ?auto_645961 ) ) ( not ( = ?auto_645957 ?auto_645962 ) ) ( not ( = ?auto_645957 ?auto_645963 ) ) ( not ( = ?auto_645957 ?auto_645964 ) ) ( not ( = ?auto_645957 ?auto_645965 ) ) ( not ( = ?auto_645957 ?auto_645966 ) ) ( not ( = ?auto_645957 ?auto_645967 ) ) ( not ( = ?auto_645957 ?auto_645968 ) ) ( not ( = ?auto_645957 ?auto_645969 ) ) ( not ( = ?auto_645957 ?auto_645970 ) ) ( not ( = ?auto_645958 ?auto_645959 ) ) ( not ( = ?auto_645958 ?auto_645960 ) ) ( not ( = ?auto_645958 ?auto_645961 ) ) ( not ( = ?auto_645958 ?auto_645962 ) ) ( not ( = ?auto_645958 ?auto_645963 ) ) ( not ( = ?auto_645958 ?auto_645964 ) ) ( not ( = ?auto_645958 ?auto_645965 ) ) ( not ( = ?auto_645958 ?auto_645966 ) ) ( not ( = ?auto_645958 ?auto_645967 ) ) ( not ( = ?auto_645958 ?auto_645968 ) ) ( not ( = ?auto_645958 ?auto_645969 ) ) ( not ( = ?auto_645958 ?auto_645970 ) ) ( not ( = ?auto_645959 ?auto_645960 ) ) ( not ( = ?auto_645959 ?auto_645961 ) ) ( not ( = ?auto_645959 ?auto_645962 ) ) ( not ( = ?auto_645959 ?auto_645963 ) ) ( not ( = ?auto_645959 ?auto_645964 ) ) ( not ( = ?auto_645959 ?auto_645965 ) ) ( not ( = ?auto_645959 ?auto_645966 ) ) ( not ( = ?auto_645959 ?auto_645967 ) ) ( not ( = ?auto_645959 ?auto_645968 ) ) ( not ( = ?auto_645959 ?auto_645969 ) ) ( not ( = ?auto_645959 ?auto_645970 ) ) ( not ( = ?auto_645960 ?auto_645961 ) ) ( not ( = ?auto_645960 ?auto_645962 ) ) ( not ( = ?auto_645960 ?auto_645963 ) ) ( not ( = ?auto_645960 ?auto_645964 ) ) ( not ( = ?auto_645960 ?auto_645965 ) ) ( not ( = ?auto_645960 ?auto_645966 ) ) ( not ( = ?auto_645960 ?auto_645967 ) ) ( not ( = ?auto_645960 ?auto_645968 ) ) ( not ( = ?auto_645960 ?auto_645969 ) ) ( not ( = ?auto_645960 ?auto_645970 ) ) ( not ( = ?auto_645961 ?auto_645962 ) ) ( not ( = ?auto_645961 ?auto_645963 ) ) ( not ( = ?auto_645961 ?auto_645964 ) ) ( not ( = ?auto_645961 ?auto_645965 ) ) ( not ( = ?auto_645961 ?auto_645966 ) ) ( not ( = ?auto_645961 ?auto_645967 ) ) ( not ( = ?auto_645961 ?auto_645968 ) ) ( not ( = ?auto_645961 ?auto_645969 ) ) ( not ( = ?auto_645961 ?auto_645970 ) ) ( not ( = ?auto_645962 ?auto_645963 ) ) ( not ( = ?auto_645962 ?auto_645964 ) ) ( not ( = ?auto_645962 ?auto_645965 ) ) ( not ( = ?auto_645962 ?auto_645966 ) ) ( not ( = ?auto_645962 ?auto_645967 ) ) ( not ( = ?auto_645962 ?auto_645968 ) ) ( not ( = ?auto_645962 ?auto_645969 ) ) ( not ( = ?auto_645962 ?auto_645970 ) ) ( not ( = ?auto_645963 ?auto_645964 ) ) ( not ( = ?auto_645963 ?auto_645965 ) ) ( not ( = ?auto_645963 ?auto_645966 ) ) ( not ( = ?auto_645963 ?auto_645967 ) ) ( not ( = ?auto_645963 ?auto_645968 ) ) ( not ( = ?auto_645963 ?auto_645969 ) ) ( not ( = ?auto_645963 ?auto_645970 ) ) ( not ( = ?auto_645964 ?auto_645965 ) ) ( not ( = ?auto_645964 ?auto_645966 ) ) ( not ( = ?auto_645964 ?auto_645967 ) ) ( not ( = ?auto_645964 ?auto_645968 ) ) ( not ( = ?auto_645964 ?auto_645969 ) ) ( not ( = ?auto_645964 ?auto_645970 ) ) ( not ( = ?auto_645965 ?auto_645966 ) ) ( not ( = ?auto_645965 ?auto_645967 ) ) ( not ( = ?auto_645965 ?auto_645968 ) ) ( not ( = ?auto_645965 ?auto_645969 ) ) ( not ( = ?auto_645965 ?auto_645970 ) ) ( not ( = ?auto_645966 ?auto_645967 ) ) ( not ( = ?auto_645966 ?auto_645968 ) ) ( not ( = ?auto_645966 ?auto_645969 ) ) ( not ( = ?auto_645966 ?auto_645970 ) ) ( not ( = ?auto_645967 ?auto_645968 ) ) ( not ( = ?auto_645967 ?auto_645969 ) ) ( not ( = ?auto_645967 ?auto_645970 ) ) ( not ( = ?auto_645968 ?auto_645969 ) ) ( not ( = ?auto_645968 ?auto_645970 ) ) ( not ( = ?auto_645969 ?auto_645970 ) ) ( ON ?auto_645968 ?auto_645969 ) ( ON ?auto_645967 ?auto_645968 ) ( ON ?auto_645966 ?auto_645967 ) ( ON ?auto_645965 ?auto_645966 ) ( ON ?auto_645964 ?auto_645965 ) ( ON ?auto_645963 ?auto_645964 ) ( ON ?auto_645962 ?auto_645963 ) ( ON ?auto_645961 ?auto_645962 ) ( ON ?auto_645960 ?auto_645961 ) ( CLEAR ?auto_645958 ) ( ON ?auto_645959 ?auto_645960 ) ( CLEAR ?auto_645959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_645957 ?auto_645958 ?auto_645959 )
      ( MAKE-13PILE ?auto_645957 ?auto_645958 ?auto_645959 ?auto_645960 ?auto_645961 ?auto_645962 ?auto_645963 ?auto_645964 ?auto_645965 ?auto_645966 ?auto_645967 ?auto_645968 ?auto_645969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_646011 - BLOCK
      ?auto_646012 - BLOCK
      ?auto_646013 - BLOCK
      ?auto_646014 - BLOCK
      ?auto_646015 - BLOCK
      ?auto_646016 - BLOCK
      ?auto_646017 - BLOCK
      ?auto_646018 - BLOCK
      ?auto_646019 - BLOCK
      ?auto_646020 - BLOCK
      ?auto_646021 - BLOCK
      ?auto_646022 - BLOCK
      ?auto_646023 - BLOCK
    )
    :vars
    (
      ?auto_646024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646023 ?auto_646024 ) ( ON-TABLE ?auto_646011 ) ( not ( = ?auto_646011 ?auto_646012 ) ) ( not ( = ?auto_646011 ?auto_646013 ) ) ( not ( = ?auto_646011 ?auto_646014 ) ) ( not ( = ?auto_646011 ?auto_646015 ) ) ( not ( = ?auto_646011 ?auto_646016 ) ) ( not ( = ?auto_646011 ?auto_646017 ) ) ( not ( = ?auto_646011 ?auto_646018 ) ) ( not ( = ?auto_646011 ?auto_646019 ) ) ( not ( = ?auto_646011 ?auto_646020 ) ) ( not ( = ?auto_646011 ?auto_646021 ) ) ( not ( = ?auto_646011 ?auto_646022 ) ) ( not ( = ?auto_646011 ?auto_646023 ) ) ( not ( = ?auto_646011 ?auto_646024 ) ) ( not ( = ?auto_646012 ?auto_646013 ) ) ( not ( = ?auto_646012 ?auto_646014 ) ) ( not ( = ?auto_646012 ?auto_646015 ) ) ( not ( = ?auto_646012 ?auto_646016 ) ) ( not ( = ?auto_646012 ?auto_646017 ) ) ( not ( = ?auto_646012 ?auto_646018 ) ) ( not ( = ?auto_646012 ?auto_646019 ) ) ( not ( = ?auto_646012 ?auto_646020 ) ) ( not ( = ?auto_646012 ?auto_646021 ) ) ( not ( = ?auto_646012 ?auto_646022 ) ) ( not ( = ?auto_646012 ?auto_646023 ) ) ( not ( = ?auto_646012 ?auto_646024 ) ) ( not ( = ?auto_646013 ?auto_646014 ) ) ( not ( = ?auto_646013 ?auto_646015 ) ) ( not ( = ?auto_646013 ?auto_646016 ) ) ( not ( = ?auto_646013 ?auto_646017 ) ) ( not ( = ?auto_646013 ?auto_646018 ) ) ( not ( = ?auto_646013 ?auto_646019 ) ) ( not ( = ?auto_646013 ?auto_646020 ) ) ( not ( = ?auto_646013 ?auto_646021 ) ) ( not ( = ?auto_646013 ?auto_646022 ) ) ( not ( = ?auto_646013 ?auto_646023 ) ) ( not ( = ?auto_646013 ?auto_646024 ) ) ( not ( = ?auto_646014 ?auto_646015 ) ) ( not ( = ?auto_646014 ?auto_646016 ) ) ( not ( = ?auto_646014 ?auto_646017 ) ) ( not ( = ?auto_646014 ?auto_646018 ) ) ( not ( = ?auto_646014 ?auto_646019 ) ) ( not ( = ?auto_646014 ?auto_646020 ) ) ( not ( = ?auto_646014 ?auto_646021 ) ) ( not ( = ?auto_646014 ?auto_646022 ) ) ( not ( = ?auto_646014 ?auto_646023 ) ) ( not ( = ?auto_646014 ?auto_646024 ) ) ( not ( = ?auto_646015 ?auto_646016 ) ) ( not ( = ?auto_646015 ?auto_646017 ) ) ( not ( = ?auto_646015 ?auto_646018 ) ) ( not ( = ?auto_646015 ?auto_646019 ) ) ( not ( = ?auto_646015 ?auto_646020 ) ) ( not ( = ?auto_646015 ?auto_646021 ) ) ( not ( = ?auto_646015 ?auto_646022 ) ) ( not ( = ?auto_646015 ?auto_646023 ) ) ( not ( = ?auto_646015 ?auto_646024 ) ) ( not ( = ?auto_646016 ?auto_646017 ) ) ( not ( = ?auto_646016 ?auto_646018 ) ) ( not ( = ?auto_646016 ?auto_646019 ) ) ( not ( = ?auto_646016 ?auto_646020 ) ) ( not ( = ?auto_646016 ?auto_646021 ) ) ( not ( = ?auto_646016 ?auto_646022 ) ) ( not ( = ?auto_646016 ?auto_646023 ) ) ( not ( = ?auto_646016 ?auto_646024 ) ) ( not ( = ?auto_646017 ?auto_646018 ) ) ( not ( = ?auto_646017 ?auto_646019 ) ) ( not ( = ?auto_646017 ?auto_646020 ) ) ( not ( = ?auto_646017 ?auto_646021 ) ) ( not ( = ?auto_646017 ?auto_646022 ) ) ( not ( = ?auto_646017 ?auto_646023 ) ) ( not ( = ?auto_646017 ?auto_646024 ) ) ( not ( = ?auto_646018 ?auto_646019 ) ) ( not ( = ?auto_646018 ?auto_646020 ) ) ( not ( = ?auto_646018 ?auto_646021 ) ) ( not ( = ?auto_646018 ?auto_646022 ) ) ( not ( = ?auto_646018 ?auto_646023 ) ) ( not ( = ?auto_646018 ?auto_646024 ) ) ( not ( = ?auto_646019 ?auto_646020 ) ) ( not ( = ?auto_646019 ?auto_646021 ) ) ( not ( = ?auto_646019 ?auto_646022 ) ) ( not ( = ?auto_646019 ?auto_646023 ) ) ( not ( = ?auto_646019 ?auto_646024 ) ) ( not ( = ?auto_646020 ?auto_646021 ) ) ( not ( = ?auto_646020 ?auto_646022 ) ) ( not ( = ?auto_646020 ?auto_646023 ) ) ( not ( = ?auto_646020 ?auto_646024 ) ) ( not ( = ?auto_646021 ?auto_646022 ) ) ( not ( = ?auto_646021 ?auto_646023 ) ) ( not ( = ?auto_646021 ?auto_646024 ) ) ( not ( = ?auto_646022 ?auto_646023 ) ) ( not ( = ?auto_646022 ?auto_646024 ) ) ( not ( = ?auto_646023 ?auto_646024 ) ) ( ON ?auto_646022 ?auto_646023 ) ( ON ?auto_646021 ?auto_646022 ) ( ON ?auto_646020 ?auto_646021 ) ( ON ?auto_646019 ?auto_646020 ) ( ON ?auto_646018 ?auto_646019 ) ( ON ?auto_646017 ?auto_646018 ) ( ON ?auto_646016 ?auto_646017 ) ( ON ?auto_646015 ?auto_646016 ) ( ON ?auto_646014 ?auto_646015 ) ( ON ?auto_646013 ?auto_646014 ) ( CLEAR ?auto_646011 ) ( ON ?auto_646012 ?auto_646013 ) ( CLEAR ?auto_646012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_646011 ?auto_646012 )
      ( MAKE-13PILE ?auto_646011 ?auto_646012 ?auto_646013 ?auto_646014 ?auto_646015 ?auto_646016 ?auto_646017 ?auto_646018 ?auto_646019 ?auto_646020 ?auto_646021 ?auto_646022 ?auto_646023 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_646065 - BLOCK
      ?auto_646066 - BLOCK
      ?auto_646067 - BLOCK
      ?auto_646068 - BLOCK
      ?auto_646069 - BLOCK
      ?auto_646070 - BLOCK
      ?auto_646071 - BLOCK
      ?auto_646072 - BLOCK
      ?auto_646073 - BLOCK
      ?auto_646074 - BLOCK
      ?auto_646075 - BLOCK
      ?auto_646076 - BLOCK
      ?auto_646077 - BLOCK
    )
    :vars
    (
      ?auto_646078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646077 ?auto_646078 ) ( not ( = ?auto_646065 ?auto_646066 ) ) ( not ( = ?auto_646065 ?auto_646067 ) ) ( not ( = ?auto_646065 ?auto_646068 ) ) ( not ( = ?auto_646065 ?auto_646069 ) ) ( not ( = ?auto_646065 ?auto_646070 ) ) ( not ( = ?auto_646065 ?auto_646071 ) ) ( not ( = ?auto_646065 ?auto_646072 ) ) ( not ( = ?auto_646065 ?auto_646073 ) ) ( not ( = ?auto_646065 ?auto_646074 ) ) ( not ( = ?auto_646065 ?auto_646075 ) ) ( not ( = ?auto_646065 ?auto_646076 ) ) ( not ( = ?auto_646065 ?auto_646077 ) ) ( not ( = ?auto_646065 ?auto_646078 ) ) ( not ( = ?auto_646066 ?auto_646067 ) ) ( not ( = ?auto_646066 ?auto_646068 ) ) ( not ( = ?auto_646066 ?auto_646069 ) ) ( not ( = ?auto_646066 ?auto_646070 ) ) ( not ( = ?auto_646066 ?auto_646071 ) ) ( not ( = ?auto_646066 ?auto_646072 ) ) ( not ( = ?auto_646066 ?auto_646073 ) ) ( not ( = ?auto_646066 ?auto_646074 ) ) ( not ( = ?auto_646066 ?auto_646075 ) ) ( not ( = ?auto_646066 ?auto_646076 ) ) ( not ( = ?auto_646066 ?auto_646077 ) ) ( not ( = ?auto_646066 ?auto_646078 ) ) ( not ( = ?auto_646067 ?auto_646068 ) ) ( not ( = ?auto_646067 ?auto_646069 ) ) ( not ( = ?auto_646067 ?auto_646070 ) ) ( not ( = ?auto_646067 ?auto_646071 ) ) ( not ( = ?auto_646067 ?auto_646072 ) ) ( not ( = ?auto_646067 ?auto_646073 ) ) ( not ( = ?auto_646067 ?auto_646074 ) ) ( not ( = ?auto_646067 ?auto_646075 ) ) ( not ( = ?auto_646067 ?auto_646076 ) ) ( not ( = ?auto_646067 ?auto_646077 ) ) ( not ( = ?auto_646067 ?auto_646078 ) ) ( not ( = ?auto_646068 ?auto_646069 ) ) ( not ( = ?auto_646068 ?auto_646070 ) ) ( not ( = ?auto_646068 ?auto_646071 ) ) ( not ( = ?auto_646068 ?auto_646072 ) ) ( not ( = ?auto_646068 ?auto_646073 ) ) ( not ( = ?auto_646068 ?auto_646074 ) ) ( not ( = ?auto_646068 ?auto_646075 ) ) ( not ( = ?auto_646068 ?auto_646076 ) ) ( not ( = ?auto_646068 ?auto_646077 ) ) ( not ( = ?auto_646068 ?auto_646078 ) ) ( not ( = ?auto_646069 ?auto_646070 ) ) ( not ( = ?auto_646069 ?auto_646071 ) ) ( not ( = ?auto_646069 ?auto_646072 ) ) ( not ( = ?auto_646069 ?auto_646073 ) ) ( not ( = ?auto_646069 ?auto_646074 ) ) ( not ( = ?auto_646069 ?auto_646075 ) ) ( not ( = ?auto_646069 ?auto_646076 ) ) ( not ( = ?auto_646069 ?auto_646077 ) ) ( not ( = ?auto_646069 ?auto_646078 ) ) ( not ( = ?auto_646070 ?auto_646071 ) ) ( not ( = ?auto_646070 ?auto_646072 ) ) ( not ( = ?auto_646070 ?auto_646073 ) ) ( not ( = ?auto_646070 ?auto_646074 ) ) ( not ( = ?auto_646070 ?auto_646075 ) ) ( not ( = ?auto_646070 ?auto_646076 ) ) ( not ( = ?auto_646070 ?auto_646077 ) ) ( not ( = ?auto_646070 ?auto_646078 ) ) ( not ( = ?auto_646071 ?auto_646072 ) ) ( not ( = ?auto_646071 ?auto_646073 ) ) ( not ( = ?auto_646071 ?auto_646074 ) ) ( not ( = ?auto_646071 ?auto_646075 ) ) ( not ( = ?auto_646071 ?auto_646076 ) ) ( not ( = ?auto_646071 ?auto_646077 ) ) ( not ( = ?auto_646071 ?auto_646078 ) ) ( not ( = ?auto_646072 ?auto_646073 ) ) ( not ( = ?auto_646072 ?auto_646074 ) ) ( not ( = ?auto_646072 ?auto_646075 ) ) ( not ( = ?auto_646072 ?auto_646076 ) ) ( not ( = ?auto_646072 ?auto_646077 ) ) ( not ( = ?auto_646072 ?auto_646078 ) ) ( not ( = ?auto_646073 ?auto_646074 ) ) ( not ( = ?auto_646073 ?auto_646075 ) ) ( not ( = ?auto_646073 ?auto_646076 ) ) ( not ( = ?auto_646073 ?auto_646077 ) ) ( not ( = ?auto_646073 ?auto_646078 ) ) ( not ( = ?auto_646074 ?auto_646075 ) ) ( not ( = ?auto_646074 ?auto_646076 ) ) ( not ( = ?auto_646074 ?auto_646077 ) ) ( not ( = ?auto_646074 ?auto_646078 ) ) ( not ( = ?auto_646075 ?auto_646076 ) ) ( not ( = ?auto_646075 ?auto_646077 ) ) ( not ( = ?auto_646075 ?auto_646078 ) ) ( not ( = ?auto_646076 ?auto_646077 ) ) ( not ( = ?auto_646076 ?auto_646078 ) ) ( not ( = ?auto_646077 ?auto_646078 ) ) ( ON ?auto_646076 ?auto_646077 ) ( ON ?auto_646075 ?auto_646076 ) ( ON ?auto_646074 ?auto_646075 ) ( ON ?auto_646073 ?auto_646074 ) ( ON ?auto_646072 ?auto_646073 ) ( ON ?auto_646071 ?auto_646072 ) ( ON ?auto_646070 ?auto_646071 ) ( ON ?auto_646069 ?auto_646070 ) ( ON ?auto_646068 ?auto_646069 ) ( ON ?auto_646067 ?auto_646068 ) ( ON ?auto_646066 ?auto_646067 ) ( ON ?auto_646065 ?auto_646066 ) ( CLEAR ?auto_646065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_646065 )
      ( MAKE-13PILE ?auto_646065 ?auto_646066 ?auto_646067 ?auto_646068 ?auto_646069 ?auto_646070 ?auto_646071 ?auto_646072 ?auto_646073 ?auto_646074 ?auto_646075 ?auto_646076 ?auto_646077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646120 - BLOCK
      ?auto_646121 - BLOCK
      ?auto_646122 - BLOCK
      ?auto_646123 - BLOCK
      ?auto_646124 - BLOCK
      ?auto_646125 - BLOCK
      ?auto_646126 - BLOCK
      ?auto_646127 - BLOCK
      ?auto_646128 - BLOCK
      ?auto_646129 - BLOCK
      ?auto_646130 - BLOCK
      ?auto_646131 - BLOCK
      ?auto_646132 - BLOCK
      ?auto_646133 - BLOCK
    )
    :vars
    (
      ?auto_646134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_646132 ) ( ON ?auto_646133 ?auto_646134 ) ( CLEAR ?auto_646133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_646120 ) ( ON ?auto_646121 ?auto_646120 ) ( ON ?auto_646122 ?auto_646121 ) ( ON ?auto_646123 ?auto_646122 ) ( ON ?auto_646124 ?auto_646123 ) ( ON ?auto_646125 ?auto_646124 ) ( ON ?auto_646126 ?auto_646125 ) ( ON ?auto_646127 ?auto_646126 ) ( ON ?auto_646128 ?auto_646127 ) ( ON ?auto_646129 ?auto_646128 ) ( ON ?auto_646130 ?auto_646129 ) ( ON ?auto_646131 ?auto_646130 ) ( ON ?auto_646132 ?auto_646131 ) ( not ( = ?auto_646120 ?auto_646121 ) ) ( not ( = ?auto_646120 ?auto_646122 ) ) ( not ( = ?auto_646120 ?auto_646123 ) ) ( not ( = ?auto_646120 ?auto_646124 ) ) ( not ( = ?auto_646120 ?auto_646125 ) ) ( not ( = ?auto_646120 ?auto_646126 ) ) ( not ( = ?auto_646120 ?auto_646127 ) ) ( not ( = ?auto_646120 ?auto_646128 ) ) ( not ( = ?auto_646120 ?auto_646129 ) ) ( not ( = ?auto_646120 ?auto_646130 ) ) ( not ( = ?auto_646120 ?auto_646131 ) ) ( not ( = ?auto_646120 ?auto_646132 ) ) ( not ( = ?auto_646120 ?auto_646133 ) ) ( not ( = ?auto_646120 ?auto_646134 ) ) ( not ( = ?auto_646121 ?auto_646122 ) ) ( not ( = ?auto_646121 ?auto_646123 ) ) ( not ( = ?auto_646121 ?auto_646124 ) ) ( not ( = ?auto_646121 ?auto_646125 ) ) ( not ( = ?auto_646121 ?auto_646126 ) ) ( not ( = ?auto_646121 ?auto_646127 ) ) ( not ( = ?auto_646121 ?auto_646128 ) ) ( not ( = ?auto_646121 ?auto_646129 ) ) ( not ( = ?auto_646121 ?auto_646130 ) ) ( not ( = ?auto_646121 ?auto_646131 ) ) ( not ( = ?auto_646121 ?auto_646132 ) ) ( not ( = ?auto_646121 ?auto_646133 ) ) ( not ( = ?auto_646121 ?auto_646134 ) ) ( not ( = ?auto_646122 ?auto_646123 ) ) ( not ( = ?auto_646122 ?auto_646124 ) ) ( not ( = ?auto_646122 ?auto_646125 ) ) ( not ( = ?auto_646122 ?auto_646126 ) ) ( not ( = ?auto_646122 ?auto_646127 ) ) ( not ( = ?auto_646122 ?auto_646128 ) ) ( not ( = ?auto_646122 ?auto_646129 ) ) ( not ( = ?auto_646122 ?auto_646130 ) ) ( not ( = ?auto_646122 ?auto_646131 ) ) ( not ( = ?auto_646122 ?auto_646132 ) ) ( not ( = ?auto_646122 ?auto_646133 ) ) ( not ( = ?auto_646122 ?auto_646134 ) ) ( not ( = ?auto_646123 ?auto_646124 ) ) ( not ( = ?auto_646123 ?auto_646125 ) ) ( not ( = ?auto_646123 ?auto_646126 ) ) ( not ( = ?auto_646123 ?auto_646127 ) ) ( not ( = ?auto_646123 ?auto_646128 ) ) ( not ( = ?auto_646123 ?auto_646129 ) ) ( not ( = ?auto_646123 ?auto_646130 ) ) ( not ( = ?auto_646123 ?auto_646131 ) ) ( not ( = ?auto_646123 ?auto_646132 ) ) ( not ( = ?auto_646123 ?auto_646133 ) ) ( not ( = ?auto_646123 ?auto_646134 ) ) ( not ( = ?auto_646124 ?auto_646125 ) ) ( not ( = ?auto_646124 ?auto_646126 ) ) ( not ( = ?auto_646124 ?auto_646127 ) ) ( not ( = ?auto_646124 ?auto_646128 ) ) ( not ( = ?auto_646124 ?auto_646129 ) ) ( not ( = ?auto_646124 ?auto_646130 ) ) ( not ( = ?auto_646124 ?auto_646131 ) ) ( not ( = ?auto_646124 ?auto_646132 ) ) ( not ( = ?auto_646124 ?auto_646133 ) ) ( not ( = ?auto_646124 ?auto_646134 ) ) ( not ( = ?auto_646125 ?auto_646126 ) ) ( not ( = ?auto_646125 ?auto_646127 ) ) ( not ( = ?auto_646125 ?auto_646128 ) ) ( not ( = ?auto_646125 ?auto_646129 ) ) ( not ( = ?auto_646125 ?auto_646130 ) ) ( not ( = ?auto_646125 ?auto_646131 ) ) ( not ( = ?auto_646125 ?auto_646132 ) ) ( not ( = ?auto_646125 ?auto_646133 ) ) ( not ( = ?auto_646125 ?auto_646134 ) ) ( not ( = ?auto_646126 ?auto_646127 ) ) ( not ( = ?auto_646126 ?auto_646128 ) ) ( not ( = ?auto_646126 ?auto_646129 ) ) ( not ( = ?auto_646126 ?auto_646130 ) ) ( not ( = ?auto_646126 ?auto_646131 ) ) ( not ( = ?auto_646126 ?auto_646132 ) ) ( not ( = ?auto_646126 ?auto_646133 ) ) ( not ( = ?auto_646126 ?auto_646134 ) ) ( not ( = ?auto_646127 ?auto_646128 ) ) ( not ( = ?auto_646127 ?auto_646129 ) ) ( not ( = ?auto_646127 ?auto_646130 ) ) ( not ( = ?auto_646127 ?auto_646131 ) ) ( not ( = ?auto_646127 ?auto_646132 ) ) ( not ( = ?auto_646127 ?auto_646133 ) ) ( not ( = ?auto_646127 ?auto_646134 ) ) ( not ( = ?auto_646128 ?auto_646129 ) ) ( not ( = ?auto_646128 ?auto_646130 ) ) ( not ( = ?auto_646128 ?auto_646131 ) ) ( not ( = ?auto_646128 ?auto_646132 ) ) ( not ( = ?auto_646128 ?auto_646133 ) ) ( not ( = ?auto_646128 ?auto_646134 ) ) ( not ( = ?auto_646129 ?auto_646130 ) ) ( not ( = ?auto_646129 ?auto_646131 ) ) ( not ( = ?auto_646129 ?auto_646132 ) ) ( not ( = ?auto_646129 ?auto_646133 ) ) ( not ( = ?auto_646129 ?auto_646134 ) ) ( not ( = ?auto_646130 ?auto_646131 ) ) ( not ( = ?auto_646130 ?auto_646132 ) ) ( not ( = ?auto_646130 ?auto_646133 ) ) ( not ( = ?auto_646130 ?auto_646134 ) ) ( not ( = ?auto_646131 ?auto_646132 ) ) ( not ( = ?auto_646131 ?auto_646133 ) ) ( not ( = ?auto_646131 ?auto_646134 ) ) ( not ( = ?auto_646132 ?auto_646133 ) ) ( not ( = ?auto_646132 ?auto_646134 ) ) ( not ( = ?auto_646133 ?auto_646134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_646133 ?auto_646134 )
      ( !STACK ?auto_646133 ?auto_646132 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646178 - BLOCK
      ?auto_646179 - BLOCK
      ?auto_646180 - BLOCK
      ?auto_646181 - BLOCK
      ?auto_646182 - BLOCK
      ?auto_646183 - BLOCK
      ?auto_646184 - BLOCK
      ?auto_646185 - BLOCK
      ?auto_646186 - BLOCK
      ?auto_646187 - BLOCK
      ?auto_646188 - BLOCK
      ?auto_646189 - BLOCK
      ?auto_646190 - BLOCK
      ?auto_646191 - BLOCK
    )
    :vars
    (
      ?auto_646192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646191 ?auto_646192 ) ( ON-TABLE ?auto_646178 ) ( ON ?auto_646179 ?auto_646178 ) ( ON ?auto_646180 ?auto_646179 ) ( ON ?auto_646181 ?auto_646180 ) ( ON ?auto_646182 ?auto_646181 ) ( ON ?auto_646183 ?auto_646182 ) ( ON ?auto_646184 ?auto_646183 ) ( ON ?auto_646185 ?auto_646184 ) ( ON ?auto_646186 ?auto_646185 ) ( ON ?auto_646187 ?auto_646186 ) ( ON ?auto_646188 ?auto_646187 ) ( ON ?auto_646189 ?auto_646188 ) ( not ( = ?auto_646178 ?auto_646179 ) ) ( not ( = ?auto_646178 ?auto_646180 ) ) ( not ( = ?auto_646178 ?auto_646181 ) ) ( not ( = ?auto_646178 ?auto_646182 ) ) ( not ( = ?auto_646178 ?auto_646183 ) ) ( not ( = ?auto_646178 ?auto_646184 ) ) ( not ( = ?auto_646178 ?auto_646185 ) ) ( not ( = ?auto_646178 ?auto_646186 ) ) ( not ( = ?auto_646178 ?auto_646187 ) ) ( not ( = ?auto_646178 ?auto_646188 ) ) ( not ( = ?auto_646178 ?auto_646189 ) ) ( not ( = ?auto_646178 ?auto_646190 ) ) ( not ( = ?auto_646178 ?auto_646191 ) ) ( not ( = ?auto_646178 ?auto_646192 ) ) ( not ( = ?auto_646179 ?auto_646180 ) ) ( not ( = ?auto_646179 ?auto_646181 ) ) ( not ( = ?auto_646179 ?auto_646182 ) ) ( not ( = ?auto_646179 ?auto_646183 ) ) ( not ( = ?auto_646179 ?auto_646184 ) ) ( not ( = ?auto_646179 ?auto_646185 ) ) ( not ( = ?auto_646179 ?auto_646186 ) ) ( not ( = ?auto_646179 ?auto_646187 ) ) ( not ( = ?auto_646179 ?auto_646188 ) ) ( not ( = ?auto_646179 ?auto_646189 ) ) ( not ( = ?auto_646179 ?auto_646190 ) ) ( not ( = ?auto_646179 ?auto_646191 ) ) ( not ( = ?auto_646179 ?auto_646192 ) ) ( not ( = ?auto_646180 ?auto_646181 ) ) ( not ( = ?auto_646180 ?auto_646182 ) ) ( not ( = ?auto_646180 ?auto_646183 ) ) ( not ( = ?auto_646180 ?auto_646184 ) ) ( not ( = ?auto_646180 ?auto_646185 ) ) ( not ( = ?auto_646180 ?auto_646186 ) ) ( not ( = ?auto_646180 ?auto_646187 ) ) ( not ( = ?auto_646180 ?auto_646188 ) ) ( not ( = ?auto_646180 ?auto_646189 ) ) ( not ( = ?auto_646180 ?auto_646190 ) ) ( not ( = ?auto_646180 ?auto_646191 ) ) ( not ( = ?auto_646180 ?auto_646192 ) ) ( not ( = ?auto_646181 ?auto_646182 ) ) ( not ( = ?auto_646181 ?auto_646183 ) ) ( not ( = ?auto_646181 ?auto_646184 ) ) ( not ( = ?auto_646181 ?auto_646185 ) ) ( not ( = ?auto_646181 ?auto_646186 ) ) ( not ( = ?auto_646181 ?auto_646187 ) ) ( not ( = ?auto_646181 ?auto_646188 ) ) ( not ( = ?auto_646181 ?auto_646189 ) ) ( not ( = ?auto_646181 ?auto_646190 ) ) ( not ( = ?auto_646181 ?auto_646191 ) ) ( not ( = ?auto_646181 ?auto_646192 ) ) ( not ( = ?auto_646182 ?auto_646183 ) ) ( not ( = ?auto_646182 ?auto_646184 ) ) ( not ( = ?auto_646182 ?auto_646185 ) ) ( not ( = ?auto_646182 ?auto_646186 ) ) ( not ( = ?auto_646182 ?auto_646187 ) ) ( not ( = ?auto_646182 ?auto_646188 ) ) ( not ( = ?auto_646182 ?auto_646189 ) ) ( not ( = ?auto_646182 ?auto_646190 ) ) ( not ( = ?auto_646182 ?auto_646191 ) ) ( not ( = ?auto_646182 ?auto_646192 ) ) ( not ( = ?auto_646183 ?auto_646184 ) ) ( not ( = ?auto_646183 ?auto_646185 ) ) ( not ( = ?auto_646183 ?auto_646186 ) ) ( not ( = ?auto_646183 ?auto_646187 ) ) ( not ( = ?auto_646183 ?auto_646188 ) ) ( not ( = ?auto_646183 ?auto_646189 ) ) ( not ( = ?auto_646183 ?auto_646190 ) ) ( not ( = ?auto_646183 ?auto_646191 ) ) ( not ( = ?auto_646183 ?auto_646192 ) ) ( not ( = ?auto_646184 ?auto_646185 ) ) ( not ( = ?auto_646184 ?auto_646186 ) ) ( not ( = ?auto_646184 ?auto_646187 ) ) ( not ( = ?auto_646184 ?auto_646188 ) ) ( not ( = ?auto_646184 ?auto_646189 ) ) ( not ( = ?auto_646184 ?auto_646190 ) ) ( not ( = ?auto_646184 ?auto_646191 ) ) ( not ( = ?auto_646184 ?auto_646192 ) ) ( not ( = ?auto_646185 ?auto_646186 ) ) ( not ( = ?auto_646185 ?auto_646187 ) ) ( not ( = ?auto_646185 ?auto_646188 ) ) ( not ( = ?auto_646185 ?auto_646189 ) ) ( not ( = ?auto_646185 ?auto_646190 ) ) ( not ( = ?auto_646185 ?auto_646191 ) ) ( not ( = ?auto_646185 ?auto_646192 ) ) ( not ( = ?auto_646186 ?auto_646187 ) ) ( not ( = ?auto_646186 ?auto_646188 ) ) ( not ( = ?auto_646186 ?auto_646189 ) ) ( not ( = ?auto_646186 ?auto_646190 ) ) ( not ( = ?auto_646186 ?auto_646191 ) ) ( not ( = ?auto_646186 ?auto_646192 ) ) ( not ( = ?auto_646187 ?auto_646188 ) ) ( not ( = ?auto_646187 ?auto_646189 ) ) ( not ( = ?auto_646187 ?auto_646190 ) ) ( not ( = ?auto_646187 ?auto_646191 ) ) ( not ( = ?auto_646187 ?auto_646192 ) ) ( not ( = ?auto_646188 ?auto_646189 ) ) ( not ( = ?auto_646188 ?auto_646190 ) ) ( not ( = ?auto_646188 ?auto_646191 ) ) ( not ( = ?auto_646188 ?auto_646192 ) ) ( not ( = ?auto_646189 ?auto_646190 ) ) ( not ( = ?auto_646189 ?auto_646191 ) ) ( not ( = ?auto_646189 ?auto_646192 ) ) ( not ( = ?auto_646190 ?auto_646191 ) ) ( not ( = ?auto_646190 ?auto_646192 ) ) ( not ( = ?auto_646191 ?auto_646192 ) ) ( CLEAR ?auto_646189 ) ( ON ?auto_646190 ?auto_646191 ) ( CLEAR ?auto_646190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_646178 ?auto_646179 ?auto_646180 ?auto_646181 ?auto_646182 ?auto_646183 ?auto_646184 ?auto_646185 ?auto_646186 ?auto_646187 ?auto_646188 ?auto_646189 ?auto_646190 )
      ( MAKE-14PILE ?auto_646178 ?auto_646179 ?auto_646180 ?auto_646181 ?auto_646182 ?auto_646183 ?auto_646184 ?auto_646185 ?auto_646186 ?auto_646187 ?auto_646188 ?auto_646189 ?auto_646190 ?auto_646191 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646236 - BLOCK
      ?auto_646237 - BLOCK
      ?auto_646238 - BLOCK
      ?auto_646239 - BLOCK
      ?auto_646240 - BLOCK
      ?auto_646241 - BLOCK
      ?auto_646242 - BLOCK
      ?auto_646243 - BLOCK
      ?auto_646244 - BLOCK
      ?auto_646245 - BLOCK
      ?auto_646246 - BLOCK
      ?auto_646247 - BLOCK
      ?auto_646248 - BLOCK
      ?auto_646249 - BLOCK
    )
    :vars
    (
      ?auto_646250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646249 ?auto_646250 ) ( ON-TABLE ?auto_646236 ) ( ON ?auto_646237 ?auto_646236 ) ( ON ?auto_646238 ?auto_646237 ) ( ON ?auto_646239 ?auto_646238 ) ( ON ?auto_646240 ?auto_646239 ) ( ON ?auto_646241 ?auto_646240 ) ( ON ?auto_646242 ?auto_646241 ) ( ON ?auto_646243 ?auto_646242 ) ( ON ?auto_646244 ?auto_646243 ) ( ON ?auto_646245 ?auto_646244 ) ( ON ?auto_646246 ?auto_646245 ) ( not ( = ?auto_646236 ?auto_646237 ) ) ( not ( = ?auto_646236 ?auto_646238 ) ) ( not ( = ?auto_646236 ?auto_646239 ) ) ( not ( = ?auto_646236 ?auto_646240 ) ) ( not ( = ?auto_646236 ?auto_646241 ) ) ( not ( = ?auto_646236 ?auto_646242 ) ) ( not ( = ?auto_646236 ?auto_646243 ) ) ( not ( = ?auto_646236 ?auto_646244 ) ) ( not ( = ?auto_646236 ?auto_646245 ) ) ( not ( = ?auto_646236 ?auto_646246 ) ) ( not ( = ?auto_646236 ?auto_646247 ) ) ( not ( = ?auto_646236 ?auto_646248 ) ) ( not ( = ?auto_646236 ?auto_646249 ) ) ( not ( = ?auto_646236 ?auto_646250 ) ) ( not ( = ?auto_646237 ?auto_646238 ) ) ( not ( = ?auto_646237 ?auto_646239 ) ) ( not ( = ?auto_646237 ?auto_646240 ) ) ( not ( = ?auto_646237 ?auto_646241 ) ) ( not ( = ?auto_646237 ?auto_646242 ) ) ( not ( = ?auto_646237 ?auto_646243 ) ) ( not ( = ?auto_646237 ?auto_646244 ) ) ( not ( = ?auto_646237 ?auto_646245 ) ) ( not ( = ?auto_646237 ?auto_646246 ) ) ( not ( = ?auto_646237 ?auto_646247 ) ) ( not ( = ?auto_646237 ?auto_646248 ) ) ( not ( = ?auto_646237 ?auto_646249 ) ) ( not ( = ?auto_646237 ?auto_646250 ) ) ( not ( = ?auto_646238 ?auto_646239 ) ) ( not ( = ?auto_646238 ?auto_646240 ) ) ( not ( = ?auto_646238 ?auto_646241 ) ) ( not ( = ?auto_646238 ?auto_646242 ) ) ( not ( = ?auto_646238 ?auto_646243 ) ) ( not ( = ?auto_646238 ?auto_646244 ) ) ( not ( = ?auto_646238 ?auto_646245 ) ) ( not ( = ?auto_646238 ?auto_646246 ) ) ( not ( = ?auto_646238 ?auto_646247 ) ) ( not ( = ?auto_646238 ?auto_646248 ) ) ( not ( = ?auto_646238 ?auto_646249 ) ) ( not ( = ?auto_646238 ?auto_646250 ) ) ( not ( = ?auto_646239 ?auto_646240 ) ) ( not ( = ?auto_646239 ?auto_646241 ) ) ( not ( = ?auto_646239 ?auto_646242 ) ) ( not ( = ?auto_646239 ?auto_646243 ) ) ( not ( = ?auto_646239 ?auto_646244 ) ) ( not ( = ?auto_646239 ?auto_646245 ) ) ( not ( = ?auto_646239 ?auto_646246 ) ) ( not ( = ?auto_646239 ?auto_646247 ) ) ( not ( = ?auto_646239 ?auto_646248 ) ) ( not ( = ?auto_646239 ?auto_646249 ) ) ( not ( = ?auto_646239 ?auto_646250 ) ) ( not ( = ?auto_646240 ?auto_646241 ) ) ( not ( = ?auto_646240 ?auto_646242 ) ) ( not ( = ?auto_646240 ?auto_646243 ) ) ( not ( = ?auto_646240 ?auto_646244 ) ) ( not ( = ?auto_646240 ?auto_646245 ) ) ( not ( = ?auto_646240 ?auto_646246 ) ) ( not ( = ?auto_646240 ?auto_646247 ) ) ( not ( = ?auto_646240 ?auto_646248 ) ) ( not ( = ?auto_646240 ?auto_646249 ) ) ( not ( = ?auto_646240 ?auto_646250 ) ) ( not ( = ?auto_646241 ?auto_646242 ) ) ( not ( = ?auto_646241 ?auto_646243 ) ) ( not ( = ?auto_646241 ?auto_646244 ) ) ( not ( = ?auto_646241 ?auto_646245 ) ) ( not ( = ?auto_646241 ?auto_646246 ) ) ( not ( = ?auto_646241 ?auto_646247 ) ) ( not ( = ?auto_646241 ?auto_646248 ) ) ( not ( = ?auto_646241 ?auto_646249 ) ) ( not ( = ?auto_646241 ?auto_646250 ) ) ( not ( = ?auto_646242 ?auto_646243 ) ) ( not ( = ?auto_646242 ?auto_646244 ) ) ( not ( = ?auto_646242 ?auto_646245 ) ) ( not ( = ?auto_646242 ?auto_646246 ) ) ( not ( = ?auto_646242 ?auto_646247 ) ) ( not ( = ?auto_646242 ?auto_646248 ) ) ( not ( = ?auto_646242 ?auto_646249 ) ) ( not ( = ?auto_646242 ?auto_646250 ) ) ( not ( = ?auto_646243 ?auto_646244 ) ) ( not ( = ?auto_646243 ?auto_646245 ) ) ( not ( = ?auto_646243 ?auto_646246 ) ) ( not ( = ?auto_646243 ?auto_646247 ) ) ( not ( = ?auto_646243 ?auto_646248 ) ) ( not ( = ?auto_646243 ?auto_646249 ) ) ( not ( = ?auto_646243 ?auto_646250 ) ) ( not ( = ?auto_646244 ?auto_646245 ) ) ( not ( = ?auto_646244 ?auto_646246 ) ) ( not ( = ?auto_646244 ?auto_646247 ) ) ( not ( = ?auto_646244 ?auto_646248 ) ) ( not ( = ?auto_646244 ?auto_646249 ) ) ( not ( = ?auto_646244 ?auto_646250 ) ) ( not ( = ?auto_646245 ?auto_646246 ) ) ( not ( = ?auto_646245 ?auto_646247 ) ) ( not ( = ?auto_646245 ?auto_646248 ) ) ( not ( = ?auto_646245 ?auto_646249 ) ) ( not ( = ?auto_646245 ?auto_646250 ) ) ( not ( = ?auto_646246 ?auto_646247 ) ) ( not ( = ?auto_646246 ?auto_646248 ) ) ( not ( = ?auto_646246 ?auto_646249 ) ) ( not ( = ?auto_646246 ?auto_646250 ) ) ( not ( = ?auto_646247 ?auto_646248 ) ) ( not ( = ?auto_646247 ?auto_646249 ) ) ( not ( = ?auto_646247 ?auto_646250 ) ) ( not ( = ?auto_646248 ?auto_646249 ) ) ( not ( = ?auto_646248 ?auto_646250 ) ) ( not ( = ?auto_646249 ?auto_646250 ) ) ( ON ?auto_646248 ?auto_646249 ) ( CLEAR ?auto_646246 ) ( ON ?auto_646247 ?auto_646248 ) ( CLEAR ?auto_646247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_646236 ?auto_646237 ?auto_646238 ?auto_646239 ?auto_646240 ?auto_646241 ?auto_646242 ?auto_646243 ?auto_646244 ?auto_646245 ?auto_646246 ?auto_646247 )
      ( MAKE-14PILE ?auto_646236 ?auto_646237 ?auto_646238 ?auto_646239 ?auto_646240 ?auto_646241 ?auto_646242 ?auto_646243 ?auto_646244 ?auto_646245 ?auto_646246 ?auto_646247 ?auto_646248 ?auto_646249 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646294 - BLOCK
      ?auto_646295 - BLOCK
      ?auto_646296 - BLOCK
      ?auto_646297 - BLOCK
      ?auto_646298 - BLOCK
      ?auto_646299 - BLOCK
      ?auto_646300 - BLOCK
      ?auto_646301 - BLOCK
      ?auto_646302 - BLOCK
      ?auto_646303 - BLOCK
      ?auto_646304 - BLOCK
      ?auto_646305 - BLOCK
      ?auto_646306 - BLOCK
      ?auto_646307 - BLOCK
    )
    :vars
    (
      ?auto_646308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646307 ?auto_646308 ) ( ON-TABLE ?auto_646294 ) ( ON ?auto_646295 ?auto_646294 ) ( ON ?auto_646296 ?auto_646295 ) ( ON ?auto_646297 ?auto_646296 ) ( ON ?auto_646298 ?auto_646297 ) ( ON ?auto_646299 ?auto_646298 ) ( ON ?auto_646300 ?auto_646299 ) ( ON ?auto_646301 ?auto_646300 ) ( ON ?auto_646302 ?auto_646301 ) ( ON ?auto_646303 ?auto_646302 ) ( not ( = ?auto_646294 ?auto_646295 ) ) ( not ( = ?auto_646294 ?auto_646296 ) ) ( not ( = ?auto_646294 ?auto_646297 ) ) ( not ( = ?auto_646294 ?auto_646298 ) ) ( not ( = ?auto_646294 ?auto_646299 ) ) ( not ( = ?auto_646294 ?auto_646300 ) ) ( not ( = ?auto_646294 ?auto_646301 ) ) ( not ( = ?auto_646294 ?auto_646302 ) ) ( not ( = ?auto_646294 ?auto_646303 ) ) ( not ( = ?auto_646294 ?auto_646304 ) ) ( not ( = ?auto_646294 ?auto_646305 ) ) ( not ( = ?auto_646294 ?auto_646306 ) ) ( not ( = ?auto_646294 ?auto_646307 ) ) ( not ( = ?auto_646294 ?auto_646308 ) ) ( not ( = ?auto_646295 ?auto_646296 ) ) ( not ( = ?auto_646295 ?auto_646297 ) ) ( not ( = ?auto_646295 ?auto_646298 ) ) ( not ( = ?auto_646295 ?auto_646299 ) ) ( not ( = ?auto_646295 ?auto_646300 ) ) ( not ( = ?auto_646295 ?auto_646301 ) ) ( not ( = ?auto_646295 ?auto_646302 ) ) ( not ( = ?auto_646295 ?auto_646303 ) ) ( not ( = ?auto_646295 ?auto_646304 ) ) ( not ( = ?auto_646295 ?auto_646305 ) ) ( not ( = ?auto_646295 ?auto_646306 ) ) ( not ( = ?auto_646295 ?auto_646307 ) ) ( not ( = ?auto_646295 ?auto_646308 ) ) ( not ( = ?auto_646296 ?auto_646297 ) ) ( not ( = ?auto_646296 ?auto_646298 ) ) ( not ( = ?auto_646296 ?auto_646299 ) ) ( not ( = ?auto_646296 ?auto_646300 ) ) ( not ( = ?auto_646296 ?auto_646301 ) ) ( not ( = ?auto_646296 ?auto_646302 ) ) ( not ( = ?auto_646296 ?auto_646303 ) ) ( not ( = ?auto_646296 ?auto_646304 ) ) ( not ( = ?auto_646296 ?auto_646305 ) ) ( not ( = ?auto_646296 ?auto_646306 ) ) ( not ( = ?auto_646296 ?auto_646307 ) ) ( not ( = ?auto_646296 ?auto_646308 ) ) ( not ( = ?auto_646297 ?auto_646298 ) ) ( not ( = ?auto_646297 ?auto_646299 ) ) ( not ( = ?auto_646297 ?auto_646300 ) ) ( not ( = ?auto_646297 ?auto_646301 ) ) ( not ( = ?auto_646297 ?auto_646302 ) ) ( not ( = ?auto_646297 ?auto_646303 ) ) ( not ( = ?auto_646297 ?auto_646304 ) ) ( not ( = ?auto_646297 ?auto_646305 ) ) ( not ( = ?auto_646297 ?auto_646306 ) ) ( not ( = ?auto_646297 ?auto_646307 ) ) ( not ( = ?auto_646297 ?auto_646308 ) ) ( not ( = ?auto_646298 ?auto_646299 ) ) ( not ( = ?auto_646298 ?auto_646300 ) ) ( not ( = ?auto_646298 ?auto_646301 ) ) ( not ( = ?auto_646298 ?auto_646302 ) ) ( not ( = ?auto_646298 ?auto_646303 ) ) ( not ( = ?auto_646298 ?auto_646304 ) ) ( not ( = ?auto_646298 ?auto_646305 ) ) ( not ( = ?auto_646298 ?auto_646306 ) ) ( not ( = ?auto_646298 ?auto_646307 ) ) ( not ( = ?auto_646298 ?auto_646308 ) ) ( not ( = ?auto_646299 ?auto_646300 ) ) ( not ( = ?auto_646299 ?auto_646301 ) ) ( not ( = ?auto_646299 ?auto_646302 ) ) ( not ( = ?auto_646299 ?auto_646303 ) ) ( not ( = ?auto_646299 ?auto_646304 ) ) ( not ( = ?auto_646299 ?auto_646305 ) ) ( not ( = ?auto_646299 ?auto_646306 ) ) ( not ( = ?auto_646299 ?auto_646307 ) ) ( not ( = ?auto_646299 ?auto_646308 ) ) ( not ( = ?auto_646300 ?auto_646301 ) ) ( not ( = ?auto_646300 ?auto_646302 ) ) ( not ( = ?auto_646300 ?auto_646303 ) ) ( not ( = ?auto_646300 ?auto_646304 ) ) ( not ( = ?auto_646300 ?auto_646305 ) ) ( not ( = ?auto_646300 ?auto_646306 ) ) ( not ( = ?auto_646300 ?auto_646307 ) ) ( not ( = ?auto_646300 ?auto_646308 ) ) ( not ( = ?auto_646301 ?auto_646302 ) ) ( not ( = ?auto_646301 ?auto_646303 ) ) ( not ( = ?auto_646301 ?auto_646304 ) ) ( not ( = ?auto_646301 ?auto_646305 ) ) ( not ( = ?auto_646301 ?auto_646306 ) ) ( not ( = ?auto_646301 ?auto_646307 ) ) ( not ( = ?auto_646301 ?auto_646308 ) ) ( not ( = ?auto_646302 ?auto_646303 ) ) ( not ( = ?auto_646302 ?auto_646304 ) ) ( not ( = ?auto_646302 ?auto_646305 ) ) ( not ( = ?auto_646302 ?auto_646306 ) ) ( not ( = ?auto_646302 ?auto_646307 ) ) ( not ( = ?auto_646302 ?auto_646308 ) ) ( not ( = ?auto_646303 ?auto_646304 ) ) ( not ( = ?auto_646303 ?auto_646305 ) ) ( not ( = ?auto_646303 ?auto_646306 ) ) ( not ( = ?auto_646303 ?auto_646307 ) ) ( not ( = ?auto_646303 ?auto_646308 ) ) ( not ( = ?auto_646304 ?auto_646305 ) ) ( not ( = ?auto_646304 ?auto_646306 ) ) ( not ( = ?auto_646304 ?auto_646307 ) ) ( not ( = ?auto_646304 ?auto_646308 ) ) ( not ( = ?auto_646305 ?auto_646306 ) ) ( not ( = ?auto_646305 ?auto_646307 ) ) ( not ( = ?auto_646305 ?auto_646308 ) ) ( not ( = ?auto_646306 ?auto_646307 ) ) ( not ( = ?auto_646306 ?auto_646308 ) ) ( not ( = ?auto_646307 ?auto_646308 ) ) ( ON ?auto_646306 ?auto_646307 ) ( ON ?auto_646305 ?auto_646306 ) ( CLEAR ?auto_646303 ) ( ON ?auto_646304 ?auto_646305 ) ( CLEAR ?auto_646304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_646294 ?auto_646295 ?auto_646296 ?auto_646297 ?auto_646298 ?auto_646299 ?auto_646300 ?auto_646301 ?auto_646302 ?auto_646303 ?auto_646304 )
      ( MAKE-14PILE ?auto_646294 ?auto_646295 ?auto_646296 ?auto_646297 ?auto_646298 ?auto_646299 ?auto_646300 ?auto_646301 ?auto_646302 ?auto_646303 ?auto_646304 ?auto_646305 ?auto_646306 ?auto_646307 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646352 - BLOCK
      ?auto_646353 - BLOCK
      ?auto_646354 - BLOCK
      ?auto_646355 - BLOCK
      ?auto_646356 - BLOCK
      ?auto_646357 - BLOCK
      ?auto_646358 - BLOCK
      ?auto_646359 - BLOCK
      ?auto_646360 - BLOCK
      ?auto_646361 - BLOCK
      ?auto_646362 - BLOCK
      ?auto_646363 - BLOCK
      ?auto_646364 - BLOCK
      ?auto_646365 - BLOCK
    )
    :vars
    (
      ?auto_646366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646365 ?auto_646366 ) ( ON-TABLE ?auto_646352 ) ( ON ?auto_646353 ?auto_646352 ) ( ON ?auto_646354 ?auto_646353 ) ( ON ?auto_646355 ?auto_646354 ) ( ON ?auto_646356 ?auto_646355 ) ( ON ?auto_646357 ?auto_646356 ) ( ON ?auto_646358 ?auto_646357 ) ( ON ?auto_646359 ?auto_646358 ) ( ON ?auto_646360 ?auto_646359 ) ( not ( = ?auto_646352 ?auto_646353 ) ) ( not ( = ?auto_646352 ?auto_646354 ) ) ( not ( = ?auto_646352 ?auto_646355 ) ) ( not ( = ?auto_646352 ?auto_646356 ) ) ( not ( = ?auto_646352 ?auto_646357 ) ) ( not ( = ?auto_646352 ?auto_646358 ) ) ( not ( = ?auto_646352 ?auto_646359 ) ) ( not ( = ?auto_646352 ?auto_646360 ) ) ( not ( = ?auto_646352 ?auto_646361 ) ) ( not ( = ?auto_646352 ?auto_646362 ) ) ( not ( = ?auto_646352 ?auto_646363 ) ) ( not ( = ?auto_646352 ?auto_646364 ) ) ( not ( = ?auto_646352 ?auto_646365 ) ) ( not ( = ?auto_646352 ?auto_646366 ) ) ( not ( = ?auto_646353 ?auto_646354 ) ) ( not ( = ?auto_646353 ?auto_646355 ) ) ( not ( = ?auto_646353 ?auto_646356 ) ) ( not ( = ?auto_646353 ?auto_646357 ) ) ( not ( = ?auto_646353 ?auto_646358 ) ) ( not ( = ?auto_646353 ?auto_646359 ) ) ( not ( = ?auto_646353 ?auto_646360 ) ) ( not ( = ?auto_646353 ?auto_646361 ) ) ( not ( = ?auto_646353 ?auto_646362 ) ) ( not ( = ?auto_646353 ?auto_646363 ) ) ( not ( = ?auto_646353 ?auto_646364 ) ) ( not ( = ?auto_646353 ?auto_646365 ) ) ( not ( = ?auto_646353 ?auto_646366 ) ) ( not ( = ?auto_646354 ?auto_646355 ) ) ( not ( = ?auto_646354 ?auto_646356 ) ) ( not ( = ?auto_646354 ?auto_646357 ) ) ( not ( = ?auto_646354 ?auto_646358 ) ) ( not ( = ?auto_646354 ?auto_646359 ) ) ( not ( = ?auto_646354 ?auto_646360 ) ) ( not ( = ?auto_646354 ?auto_646361 ) ) ( not ( = ?auto_646354 ?auto_646362 ) ) ( not ( = ?auto_646354 ?auto_646363 ) ) ( not ( = ?auto_646354 ?auto_646364 ) ) ( not ( = ?auto_646354 ?auto_646365 ) ) ( not ( = ?auto_646354 ?auto_646366 ) ) ( not ( = ?auto_646355 ?auto_646356 ) ) ( not ( = ?auto_646355 ?auto_646357 ) ) ( not ( = ?auto_646355 ?auto_646358 ) ) ( not ( = ?auto_646355 ?auto_646359 ) ) ( not ( = ?auto_646355 ?auto_646360 ) ) ( not ( = ?auto_646355 ?auto_646361 ) ) ( not ( = ?auto_646355 ?auto_646362 ) ) ( not ( = ?auto_646355 ?auto_646363 ) ) ( not ( = ?auto_646355 ?auto_646364 ) ) ( not ( = ?auto_646355 ?auto_646365 ) ) ( not ( = ?auto_646355 ?auto_646366 ) ) ( not ( = ?auto_646356 ?auto_646357 ) ) ( not ( = ?auto_646356 ?auto_646358 ) ) ( not ( = ?auto_646356 ?auto_646359 ) ) ( not ( = ?auto_646356 ?auto_646360 ) ) ( not ( = ?auto_646356 ?auto_646361 ) ) ( not ( = ?auto_646356 ?auto_646362 ) ) ( not ( = ?auto_646356 ?auto_646363 ) ) ( not ( = ?auto_646356 ?auto_646364 ) ) ( not ( = ?auto_646356 ?auto_646365 ) ) ( not ( = ?auto_646356 ?auto_646366 ) ) ( not ( = ?auto_646357 ?auto_646358 ) ) ( not ( = ?auto_646357 ?auto_646359 ) ) ( not ( = ?auto_646357 ?auto_646360 ) ) ( not ( = ?auto_646357 ?auto_646361 ) ) ( not ( = ?auto_646357 ?auto_646362 ) ) ( not ( = ?auto_646357 ?auto_646363 ) ) ( not ( = ?auto_646357 ?auto_646364 ) ) ( not ( = ?auto_646357 ?auto_646365 ) ) ( not ( = ?auto_646357 ?auto_646366 ) ) ( not ( = ?auto_646358 ?auto_646359 ) ) ( not ( = ?auto_646358 ?auto_646360 ) ) ( not ( = ?auto_646358 ?auto_646361 ) ) ( not ( = ?auto_646358 ?auto_646362 ) ) ( not ( = ?auto_646358 ?auto_646363 ) ) ( not ( = ?auto_646358 ?auto_646364 ) ) ( not ( = ?auto_646358 ?auto_646365 ) ) ( not ( = ?auto_646358 ?auto_646366 ) ) ( not ( = ?auto_646359 ?auto_646360 ) ) ( not ( = ?auto_646359 ?auto_646361 ) ) ( not ( = ?auto_646359 ?auto_646362 ) ) ( not ( = ?auto_646359 ?auto_646363 ) ) ( not ( = ?auto_646359 ?auto_646364 ) ) ( not ( = ?auto_646359 ?auto_646365 ) ) ( not ( = ?auto_646359 ?auto_646366 ) ) ( not ( = ?auto_646360 ?auto_646361 ) ) ( not ( = ?auto_646360 ?auto_646362 ) ) ( not ( = ?auto_646360 ?auto_646363 ) ) ( not ( = ?auto_646360 ?auto_646364 ) ) ( not ( = ?auto_646360 ?auto_646365 ) ) ( not ( = ?auto_646360 ?auto_646366 ) ) ( not ( = ?auto_646361 ?auto_646362 ) ) ( not ( = ?auto_646361 ?auto_646363 ) ) ( not ( = ?auto_646361 ?auto_646364 ) ) ( not ( = ?auto_646361 ?auto_646365 ) ) ( not ( = ?auto_646361 ?auto_646366 ) ) ( not ( = ?auto_646362 ?auto_646363 ) ) ( not ( = ?auto_646362 ?auto_646364 ) ) ( not ( = ?auto_646362 ?auto_646365 ) ) ( not ( = ?auto_646362 ?auto_646366 ) ) ( not ( = ?auto_646363 ?auto_646364 ) ) ( not ( = ?auto_646363 ?auto_646365 ) ) ( not ( = ?auto_646363 ?auto_646366 ) ) ( not ( = ?auto_646364 ?auto_646365 ) ) ( not ( = ?auto_646364 ?auto_646366 ) ) ( not ( = ?auto_646365 ?auto_646366 ) ) ( ON ?auto_646364 ?auto_646365 ) ( ON ?auto_646363 ?auto_646364 ) ( ON ?auto_646362 ?auto_646363 ) ( CLEAR ?auto_646360 ) ( ON ?auto_646361 ?auto_646362 ) ( CLEAR ?auto_646361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_646352 ?auto_646353 ?auto_646354 ?auto_646355 ?auto_646356 ?auto_646357 ?auto_646358 ?auto_646359 ?auto_646360 ?auto_646361 )
      ( MAKE-14PILE ?auto_646352 ?auto_646353 ?auto_646354 ?auto_646355 ?auto_646356 ?auto_646357 ?auto_646358 ?auto_646359 ?auto_646360 ?auto_646361 ?auto_646362 ?auto_646363 ?auto_646364 ?auto_646365 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646410 - BLOCK
      ?auto_646411 - BLOCK
      ?auto_646412 - BLOCK
      ?auto_646413 - BLOCK
      ?auto_646414 - BLOCK
      ?auto_646415 - BLOCK
      ?auto_646416 - BLOCK
      ?auto_646417 - BLOCK
      ?auto_646418 - BLOCK
      ?auto_646419 - BLOCK
      ?auto_646420 - BLOCK
      ?auto_646421 - BLOCK
      ?auto_646422 - BLOCK
      ?auto_646423 - BLOCK
    )
    :vars
    (
      ?auto_646424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646423 ?auto_646424 ) ( ON-TABLE ?auto_646410 ) ( ON ?auto_646411 ?auto_646410 ) ( ON ?auto_646412 ?auto_646411 ) ( ON ?auto_646413 ?auto_646412 ) ( ON ?auto_646414 ?auto_646413 ) ( ON ?auto_646415 ?auto_646414 ) ( ON ?auto_646416 ?auto_646415 ) ( ON ?auto_646417 ?auto_646416 ) ( not ( = ?auto_646410 ?auto_646411 ) ) ( not ( = ?auto_646410 ?auto_646412 ) ) ( not ( = ?auto_646410 ?auto_646413 ) ) ( not ( = ?auto_646410 ?auto_646414 ) ) ( not ( = ?auto_646410 ?auto_646415 ) ) ( not ( = ?auto_646410 ?auto_646416 ) ) ( not ( = ?auto_646410 ?auto_646417 ) ) ( not ( = ?auto_646410 ?auto_646418 ) ) ( not ( = ?auto_646410 ?auto_646419 ) ) ( not ( = ?auto_646410 ?auto_646420 ) ) ( not ( = ?auto_646410 ?auto_646421 ) ) ( not ( = ?auto_646410 ?auto_646422 ) ) ( not ( = ?auto_646410 ?auto_646423 ) ) ( not ( = ?auto_646410 ?auto_646424 ) ) ( not ( = ?auto_646411 ?auto_646412 ) ) ( not ( = ?auto_646411 ?auto_646413 ) ) ( not ( = ?auto_646411 ?auto_646414 ) ) ( not ( = ?auto_646411 ?auto_646415 ) ) ( not ( = ?auto_646411 ?auto_646416 ) ) ( not ( = ?auto_646411 ?auto_646417 ) ) ( not ( = ?auto_646411 ?auto_646418 ) ) ( not ( = ?auto_646411 ?auto_646419 ) ) ( not ( = ?auto_646411 ?auto_646420 ) ) ( not ( = ?auto_646411 ?auto_646421 ) ) ( not ( = ?auto_646411 ?auto_646422 ) ) ( not ( = ?auto_646411 ?auto_646423 ) ) ( not ( = ?auto_646411 ?auto_646424 ) ) ( not ( = ?auto_646412 ?auto_646413 ) ) ( not ( = ?auto_646412 ?auto_646414 ) ) ( not ( = ?auto_646412 ?auto_646415 ) ) ( not ( = ?auto_646412 ?auto_646416 ) ) ( not ( = ?auto_646412 ?auto_646417 ) ) ( not ( = ?auto_646412 ?auto_646418 ) ) ( not ( = ?auto_646412 ?auto_646419 ) ) ( not ( = ?auto_646412 ?auto_646420 ) ) ( not ( = ?auto_646412 ?auto_646421 ) ) ( not ( = ?auto_646412 ?auto_646422 ) ) ( not ( = ?auto_646412 ?auto_646423 ) ) ( not ( = ?auto_646412 ?auto_646424 ) ) ( not ( = ?auto_646413 ?auto_646414 ) ) ( not ( = ?auto_646413 ?auto_646415 ) ) ( not ( = ?auto_646413 ?auto_646416 ) ) ( not ( = ?auto_646413 ?auto_646417 ) ) ( not ( = ?auto_646413 ?auto_646418 ) ) ( not ( = ?auto_646413 ?auto_646419 ) ) ( not ( = ?auto_646413 ?auto_646420 ) ) ( not ( = ?auto_646413 ?auto_646421 ) ) ( not ( = ?auto_646413 ?auto_646422 ) ) ( not ( = ?auto_646413 ?auto_646423 ) ) ( not ( = ?auto_646413 ?auto_646424 ) ) ( not ( = ?auto_646414 ?auto_646415 ) ) ( not ( = ?auto_646414 ?auto_646416 ) ) ( not ( = ?auto_646414 ?auto_646417 ) ) ( not ( = ?auto_646414 ?auto_646418 ) ) ( not ( = ?auto_646414 ?auto_646419 ) ) ( not ( = ?auto_646414 ?auto_646420 ) ) ( not ( = ?auto_646414 ?auto_646421 ) ) ( not ( = ?auto_646414 ?auto_646422 ) ) ( not ( = ?auto_646414 ?auto_646423 ) ) ( not ( = ?auto_646414 ?auto_646424 ) ) ( not ( = ?auto_646415 ?auto_646416 ) ) ( not ( = ?auto_646415 ?auto_646417 ) ) ( not ( = ?auto_646415 ?auto_646418 ) ) ( not ( = ?auto_646415 ?auto_646419 ) ) ( not ( = ?auto_646415 ?auto_646420 ) ) ( not ( = ?auto_646415 ?auto_646421 ) ) ( not ( = ?auto_646415 ?auto_646422 ) ) ( not ( = ?auto_646415 ?auto_646423 ) ) ( not ( = ?auto_646415 ?auto_646424 ) ) ( not ( = ?auto_646416 ?auto_646417 ) ) ( not ( = ?auto_646416 ?auto_646418 ) ) ( not ( = ?auto_646416 ?auto_646419 ) ) ( not ( = ?auto_646416 ?auto_646420 ) ) ( not ( = ?auto_646416 ?auto_646421 ) ) ( not ( = ?auto_646416 ?auto_646422 ) ) ( not ( = ?auto_646416 ?auto_646423 ) ) ( not ( = ?auto_646416 ?auto_646424 ) ) ( not ( = ?auto_646417 ?auto_646418 ) ) ( not ( = ?auto_646417 ?auto_646419 ) ) ( not ( = ?auto_646417 ?auto_646420 ) ) ( not ( = ?auto_646417 ?auto_646421 ) ) ( not ( = ?auto_646417 ?auto_646422 ) ) ( not ( = ?auto_646417 ?auto_646423 ) ) ( not ( = ?auto_646417 ?auto_646424 ) ) ( not ( = ?auto_646418 ?auto_646419 ) ) ( not ( = ?auto_646418 ?auto_646420 ) ) ( not ( = ?auto_646418 ?auto_646421 ) ) ( not ( = ?auto_646418 ?auto_646422 ) ) ( not ( = ?auto_646418 ?auto_646423 ) ) ( not ( = ?auto_646418 ?auto_646424 ) ) ( not ( = ?auto_646419 ?auto_646420 ) ) ( not ( = ?auto_646419 ?auto_646421 ) ) ( not ( = ?auto_646419 ?auto_646422 ) ) ( not ( = ?auto_646419 ?auto_646423 ) ) ( not ( = ?auto_646419 ?auto_646424 ) ) ( not ( = ?auto_646420 ?auto_646421 ) ) ( not ( = ?auto_646420 ?auto_646422 ) ) ( not ( = ?auto_646420 ?auto_646423 ) ) ( not ( = ?auto_646420 ?auto_646424 ) ) ( not ( = ?auto_646421 ?auto_646422 ) ) ( not ( = ?auto_646421 ?auto_646423 ) ) ( not ( = ?auto_646421 ?auto_646424 ) ) ( not ( = ?auto_646422 ?auto_646423 ) ) ( not ( = ?auto_646422 ?auto_646424 ) ) ( not ( = ?auto_646423 ?auto_646424 ) ) ( ON ?auto_646422 ?auto_646423 ) ( ON ?auto_646421 ?auto_646422 ) ( ON ?auto_646420 ?auto_646421 ) ( ON ?auto_646419 ?auto_646420 ) ( CLEAR ?auto_646417 ) ( ON ?auto_646418 ?auto_646419 ) ( CLEAR ?auto_646418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_646410 ?auto_646411 ?auto_646412 ?auto_646413 ?auto_646414 ?auto_646415 ?auto_646416 ?auto_646417 ?auto_646418 )
      ( MAKE-14PILE ?auto_646410 ?auto_646411 ?auto_646412 ?auto_646413 ?auto_646414 ?auto_646415 ?auto_646416 ?auto_646417 ?auto_646418 ?auto_646419 ?auto_646420 ?auto_646421 ?auto_646422 ?auto_646423 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646468 - BLOCK
      ?auto_646469 - BLOCK
      ?auto_646470 - BLOCK
      ?auto_646471 - BLOCK
      ?auto_646472 - BLOCK
      ?auto_646473 - BLOCK
      ?auto_646474 - BLOCK
      ?auto_646475 - BLOCK
      ?auto_646476 - BLOCK
      ?auto_646477 - BLOCK
      ?auto_646478 - BLOCK
      ?auto_646479 - BLOCK
      ?auto_646480 - BLOCK
      ?auto_646481 - BLOCK
    )
    :vars
    (
      ?auto_646482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646481 ?auto_646482 ) ( ON-TABLE ?auto_646468 ) ( ON ?auto_646469 ?auto_646468 ) ( ON ?auto_646470 ?auto_646469 ) ( ON ?auto_646471 ?auto_646470 ) ( ON ?auto_646472 ?auto_646471 ) ( ON ?auto_646473 ?auto_646472 ) ( ON ?auto_646474 ?auto_646473 ) ( not ( = ?auto_646468 ?auto_646469 ) ) ( not ( = ?auto_646468 ?auto_646470 ) ) ( not ( = ?auto_646468 ?auto_646471 ) ) ( not ( = ?auto_646468 ?auto_646472 ) ) ( not ( = ?auto_646468 ?auto_646473 ) ) ( not ( = ?auto_646468 ?auto_646474 ) ) ( not ( = ?auto_646468 ?auto_646475 ) ) ( not ( = ?auto_646468 ?auto_646476 ) ) ( not ( = ?auto_646468 ?auto_646477 ) ) ( not ( = ?auto_646468 ?auto_646478 ) ) ( not ( = ?auto_646468 ?auto_646479 ) ) ( not ( = ?auto_646468 ?auto_646480 ) ) ( not ( = ?auto_646468 ?auto_646481 ) ) ( not ( = ?auto_646468 ?auto_646482 ) ) ( not ( = ?auto_646469 ?auto_646470 ) ) ( not ( = ?auto_646469 ?auto_646471 ) ) ( not ( = ?auto_646469 ?auto_646472 ) ) ( not ( = ?auto_646469 ?auto_646473 ) ) ( not ( = ?auto_646469 ?auto_646474 ) ) ( not ( = ?auto_646469 ?auto_646475 ) ) ( not ( = ?auto_646469 ?auto_646476 ) ) ( not ( = ?auto_646469 ?auto_646477 ) ) ( not ( = ?auto_646469 ?auto_646478 ) ) ( not ( = ?auto_646469 ?auto_646479 ) ) ( not ( = ?auto_646469 ?auto_646480 ) ) ( not ( = ?auto_646469 ?auto_646481 ) ) ( not ( = ?auto_646469 ?auto_646482 ) ) ( not ( = ?auto_646470 ?auto_646471 ) ) ( not ( = ?auto_646470 ?auto_646472 ) ) ( not ( = ?auto_646470 ?auto_646473 ) ) ( not ( = ?auto_646470 ?auto_646474 ) ) ( not ( = ?auto_646470 ?auto_646475 ) ) ( not ( = ?auto_646470 ?auto_646476 ) ) ( not ( = ?auto_646470 ?auto_646477 ) ) ( not ( = ?auto_646470 ?auto_646478 ) ) ( not ( = ?auto_646470 ?auto_646479 ) ) ( not ( = ?auto_646470 ?auto_646480 ) ) ( not ( = ?auto_646470 ?auto_646481 ) ) ( not ( = ?auto_646470 ?auto_646482 ) ) ( not ( = ?auto_646471 ?auto_646472 ) ) ( not ( = ?auto_646471 ?auto_646473 ) ) ( not ( = ?auto_646471 ?auto_646474 ) ) ( not ( = ?auto_646471 ?auto_646475 ) ) ( not ( = ?auto_646471 ?auto_646476 ) ) ( not ( = ?auto_646471 ?auto_646477 ) ) ( not ( = ?auto_646471 ?auto_646478 ) ) ( not ( = ?auto_646471 ?auto_646479 ) ) ( not ( = ?auto_646471 ?auto_646480 ) ) ( not ( = ?auto_646471 ?auto_646481 ) ) ( not ( = ?auto_646471 ?auto_646482 ) ) ( not ( = ?auto_646472 ?auto_646473 ) ) ( not ( = ?auto_646472 ?auto_646474 ) ) ( not ( = ?auto_646472 ?auto_646475 ) ) ( not ( = ?auto_646472 ?auto_646476 ) ) ( not ( = ?auto_646472 ?auto_646477 ) ) ( not ( = ?auto_646472 ?auto_646478 ) ) ( not ( = ?auto_646472 ?auto_646479 ) ) ( not ( = ?auto_646472 ?auto_646480 ) ) ( not ( = ?auto_646472 ?auto_646481 ) ) ( not ( = ?auto_646472 ?auto_646482 ) ) ( not ( = ?auto_646473 ?auto_646474 ) ) ( not ( = ?auto_646473 ?auto_646475 ) ) ( not ( = ?auto_646473 ?auto_646476 ) ) ( not ( = ?auto_646473 ?auto_646477 ) ) ( not ( = ?auto_646473 ?auto_646478 ) ) ( not ( = ?auto_646473 ?auto_646479 ) ) ( not ( = ?auto_646473 ?auto_646480 ) ) ( not ( = ?auto_646473 ?auto_646481 ) ) ( not ( = ?auto_646473 ?auto_646482 ) ) ( not ( = ?auto_646474 ?auto_646475 ) ) ( not ( = ?auto_646474 ?auto_646476 ) ) ( not ( = ?auto_646474 ?auto_646477 ) ) ( not ( = ?auto_646474 ?auto_646478 ) ) ( not ( = ?auto_646474 ?auto_646479 ) ) ( not ( = ?auto_646474 ?auto_646480 ) ) ( not ( = ?auto_646474 ?auto_646481 ) ) ( not ( = ?auto_646474 ?auto_646482 ) ) ( not ( = ?auto_646475 ?auto_646476 ) ) ( not ( = ?auto_646475 ?auto_646477 ) ) ( not ( = ?auto_646475 ?auto_646478 ) ) ( not ( = ?auto_646475 ?auto_646479 ) ) ( not ( = ?auto_646475 ?auto_646480 ) ) ( not ( = ?auto_646475 ?auto_646481 ) ) ( not ( = ?auto_646475 ?auto_646482 ) ) ( not ( = ?auto_646476 ?auto_646477 ) ) ( not ( = ?auto_646476 ?auto_646478 ) ) ( not ( = ?auto_646476 ?auto_646479 ) ) ( not ( = ?auto_646476 ?auto_646480 ) ) ( not ( = ?auto_646476 ?auto_646481 ) ) ( not ( = ?auto_646476 ?auto_646482 ) ) ( not ( = ?auto_646477 ?auto_646478 ) ) ( not ( = ?auto_646477 ?auto_646479 ) ) ( not ( = ?auto_646477 ?auto_646480 ) ) ( not ( = ?auto_646477 ?auto_646481 ) ) ( not ( = ?auto_646477 ?auto_646482 ) ) ( not ( = ?auto_646478 ?auto_646479 ) ) ( not ( = ?auto_646478 ?auto_646480 ) ) ( not ( = ?auto_646478 ?auto_646481 ) ) ( not ( = ?auto_646478 ?auto_646482 ) ) ( not ( = ?auto_646479 ?auto_646480 ) ) ( not ( = ?auto_646479 ?auto_646481 ) ) ( not ( = ?auto_646479 ?auto_646482 ) ) ( not ( = ?auto_646480 ?auto_646481 ) ) ( not ( = ?auto_646480 ?auto_646482 ) ) ( not ( = ?auto_646481 ?auto_646482 ) ) ( ON ?auto_646480 ?auto_646481 ) ( ON ?auto_646479 ?auto_646480 ) ( ON ?auto_646478 ?auto_646479 ) ( ON ?auto_646477 ?auto_646478 ) ( ON ?auto_646476 ?auto_646477 ) ( CLEAR ?auto_646474 ) ( ON ?auto_646475 ?auto_646476 ) ( CLEAR ?auto_646475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_646468 ?auto_646469 ?auto_646470 ?auto_646471 ?auto_646472 ?auto_646473 ?auto_646474 ?auto_646475 )
      ( MAKE-14PILE ?auto_646468 ?auto_646469 ?auto_646470 ?auto_646471 ?auto_646472 ?auto_646473 ?auto_646474 ?auto_646475 ?auto_646476 ?auto_646477 ?auto_646478 ?auto_646479 ?auto_646480 ?auto_646481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646526 - BLOCK
      ?auto_646527 - BLOCK
      ?auto_646528 - BLOCK
      ?auto_646529 - BLOCK
      ?auto_646530 - BLOCK
      ?auto_646531 - BLOCK
      ?auto_646532 - BLOCK
      ?auto_646533 - BLOCK
      ?auto_646534 - BLOCK
      ?auto_646535 - BLOCK
      ?auto_646536 - BLOCK
      ?auto_646537 - BLOCK
      ?auto_646538 - BLOCK
      ?auto_646539 - BLOCK
    )
    :vars
    (
      ?auto_646540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646539 ?auto_646540 ) ( ON-TABLE ?auto_646526 ) ( ON ?auto_646527 ?auto_646526 ) ( ON ?auto_646528 ?auto_646527 ) ( ON ?auto_646529 ?auto_646528 ) ( ON ?auto_646530 ?auto_646529 ) ( ON ?auto_646531 ?auto_646530 ) ( not ( = ?auto_646526 ?auto_646527 ) ) ( not ( = ?auto_646526 ?auto_646528 ) ) ( not ( = ?auto_646526 ?auto_646529 ) ) ( not ( = ?auto_646526 ?auto_646530 ) ) ( not ( = ?auto_646526 ?auto_646531 ) ) ( not ( = ?auto_646526 ?auto_646532 ) ) ( not ( = ?auto_646526 ?auto_646533 ) ) ( not ( = ?auto_646526 ?auto_646534 ) ) ( not ( = ?auto_646526 ?auto_646535 ) ) ( not ( = ?auto_646526 ?auto_646536 ) ) ( not ( = ?auto_646526 ?auto_646537 ) ) ( not ( = ?auto_646526 ?auto_646538 ) ) ( not ( = ?auto_646526 ?auto_646539 ) ) ( not ( = ?auto_646526 ?auto_646540 ) ) ( not ( = ?auto_646527 ?auto_646528 ) ) ( not ( = ?auto_646527 ?auto_646529 ) ) ( not ( = ?auto_646527 ?auto_646530 ) ) ( not ( = ?auto_646527 ?auto_646531 ) ) ( not ( = ?auto_646527 ?auto_646532 ) ) ( not ( = ?auto_646527 ?auto_646533 ) ) ( not ( = ?auto_646527 ?auto_646534 ) ) ( not ( = ?auto_646527 ?auto_646535 ) ) ( not ( = ?auto_646527 ?auto_646536 ) ) ( not ( = ?auto_646527 ?auto_646537 ) ) ( not ( = ?auto_646527 ?auto_646538 ) ) ( not ( = ?auto_646527 ?auto_646539 ) ) ( not ( = ?auto_646527 ?auto_646540 ) ) ( not ( = ?auto_646528 ?auto_646529 ) ) ( not ( = ?auto_646528 ?auto_646530 ) ) ( not ( = ?auto_646528 ?auto_646531 ) ) ( not ( = ?auto_646528 ?auto_646532 ) ) ( not ( = ?auto_646528 ?auto_646533 ) ) ( not ( = ?auto_646528 ?auto_646534 ) ) ( not ( = ?auto_646528 ?auto_646535 ) ) ( not ( = ?auto_646528 ?auto_646536 ) ) ( not ( = ?auto_646528 ?auto_646537 ) ) ( not ( = ?auto_646528 ?auto_646538 ) ) ( not ( = ?auto_646528 ?auto_646539 ) ) ( not ( = ?auto_646528 ?auto_646540 ) ) ( not ( = ?auto_646529 ?auto_646530 ) ) ( not ( = ?auto_646529 ?auto_646531 ) ) ( not ( = ?auto_646529 ?auto_646532 ) ) ( not ( = ?auto_646529 ?auto_646533 ) ) ( not ( = ?auto_646529 ?auto_646534 ) ) ( not ( = ?auto_646529 ?auto_646535 ) ) ( not ( = ?auto_646529 ?auto_646536 ) ) ( not ( = ?auto_646529 ?auto_646537 ) ) ( not ( = ?auto_646529 ?auto_646538 ) ) ( not ( = ?auto_646529 ?auto_646539 ) ) ( not ( = ?auto_646529 ?auto_646540 ) ) ( not ( = ?auto_646530 ?auto_646531 ) ) ( not ( = ?auto_646530 ?auto_646532 ) ) ( not ( = ?auto_646530 ?auto_646533 ) ) ( not ( = ?auto_646530 ?auto_646534 ) ) ( not ( = ?auto_646530 ?auto_646535 ) ) ( not ( = ?auto_646530 ?auto_646536 ) ) ( not ( = ?auto_646530 ?auto_646537 ) ) ( not ( = ?auto_646530 ?auto_646538 ) ) ( not ( = ?auto_646530 ?auto_646539 ) ) ( not ( = ?auto_646530 ?auto_646540 ) ) ( not ( = ?auto_646531 ?auto_646532 ) ) ( not ( = ?auto_646531 ?auto_646533 ) ) ( not ( = ?auto_646531 ?auto_646534 ) ) ( not ( = ?auto_646531 ?auto_646535 ) ) ( not ( = ?auto_646531 ?auto_646536 ) ) ( not ( = ?auto_646531 ?auto_646537 ) ) ( not ( = ?auto_646531 ?auto_646538 ) ) ( not ( = ?auto_646531 ?auto_646539 ) ) ( not ( = ?auto_646531 ?auto_646540 ) ) ( not ( = ?auto_646532 ?auto_646533 ) ) ( not ( = ?auto_646532 ?auto_646534 ) ) ( not ( = ?auto_646532 ?auto_646535 ) ) ( not ( = ?auto_646532 ?auto_646536 ) ) ( not ( = ?auto_646532 ?auto_646537 ) ) ( not ( = ?auto_646532 ?auto_646538 ) ) ( not ( = ?auto_646532 ?auto_646539 ) ) ( not ( = ?auto_646532 ?auto_646540 ) ) ( not ( = ?auto_646533 ?auto_646534 ) ) ( not ( = ?auto_646533 ?auto_646535 ) ) ( not ( = ?auto_646533 ?auto_646536 ) ) ( not ( = ?auto_646533 ?auto_646537 ) ) ( not ( = ?auto_646533 ?auto_646538 ) ) ( not ( = ?auto_646533 ?auto_646539 ) ) ( not ( = ?auto_646533 ?auto_646540 ) ) ( not ( = ?auto_646534 ?auto_646535 ) ) ( not ( = ?auto_646534 ?auto_646536 ) ) ( not ( = ?auto_646534 ?auto_646537 ) ) ( not ( = ?auto_646534 ?auto_646538 ) ) ( not ( = ?auto_646534 ?auto_646539 ) ) ( not ( = ?auto_646534 ?auto_646540 ) ) ( not ( = ?auto_646535 ?auto_646536 ) ) ( not ( = ?auto_646535 ?auto_646537 ) ) ( not ( = ?auto_646535 ?auto_646538 ) ) ( not ( = ?auto_646535 ?auto_646539 ) ) ( not ( = ?auto_646535 ?auto_646540 ) ) ( not ( = ?auto_646536 ?auto_646537 ) ) ( not ( = ?auto_646536 ?auto_646538 ) ) ( not ( = ?auto_646536 ?auto_646539 ) ) ( not ( = ?auto_646536 ?auto_646540 ) ) ( not ( = ?auto_646537 ?auto_646538 ) ) ( not ( = ?auto_646537 ?auto_646539 ) ) ( not ( = ?auto_646537 ?auto_646540 ) ) ( not ( = ?auto_646538 ?auto_646539 ) ) ( not ( = ?auto_646538 ?auto_646540 ) ) ( not ( = ?auto_646539 ?auto_646540 ) ) ( ON ?auto_646538 ?auto_646539 ) ( ON ?auto_646537 ?auto_646538 ) ( ON ?auto_646536 ?auto_646537 ) ( ON ?auto_646535 ?auto_646536 ) ( ON ?auto_646534 ?auto_646535 ) ( ON ?auto_646533 ?auto_646534 ) ( CLEAR ?auto_646531 ) ( ON ?auto_646532 ?auto_646533 ) ( CLEAR ?auto_646532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_646526 ?auto_646527 ?auto_646528 ?auto_646529 ?auto_646530 ?auto_646531 ?auto_646532 )
      ( MAKE-14PILE ?auto_646526 ?auto_646527 ?auto_646528 ?auto_646529 ?auto_646530 ?auto_646531 ?auto_646532 ?auto_646533 ?auto_646534 ?auto_646535 ?auto_646536 ?auto_646537 ?auto_646538 ?auto_646539 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646584 - BLOCK
      ?auto_646585 - BLOCK
      ?auto_646586 - BLOCK
      ?auto_646587 - BLOCK
      ?auto_646588 - BLOCK
      ?auto_646589 - BLOCK
      ?auto_646590 - BLOCK
      ?auto_646591 - BLOCK
      ?auto_646592 - BLOCK
      ?auto_646593 - BLOCK
      ?auto_646594 - BLOCK
      ?auto_646595 - BLOCK
      ?auto_646596 - BLOCK
      ?auto_646597 - BLOCK
    )
    :vars
    (
      ?auto_646598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646597 ?auto_646598 ) ( ON-TABLE ?auto_646584 ) ( ON ?auto_646585 ?auto_646584 ) ( ON ?auto_646586 ?auto_646585 ) ( ON ?auto_646587 ?auto_646586 ) ( ON ?auto_646588 ?auto_646587 ) ( not ( = ?auto_646584 ?auto_646585 ) ) ( not ( = ?auto_646584 ?auto_646586 ) ) ( not ( = ?auto_646584 ?auto_646587 ) ) ( not ( = ?auto_646584 ?auto_646588 ) ) ( not ( = ?auto_646584 ?auto_646589 ) ) ( not ( = ?auto_646584 ?auto_646590 ) ) ( not ( = ?auto_646584 ?auto_646591 ) ) ( not ( = ?auto_646584 ?auto_646592 ) ) ( not ( = ?auto_646584 ?auto_646593 ) ) ( not ( = ?auto_646584 ?auto_646594 ) ) ( not ( = ?auto_646584 ?auto_646595 ) ) ( not ( = ?auto_646584 ?auto_646596 ) ) ( not ( = ?auto_646584 ?auto_646597 ) ) ( not ( = ?auto_646584 ?auto_646598 ) ) ( not ( = ?auto_646585 ?auto_646586 ) ) ( not ( = ?auto_646585 ?auto_646587 ) ) ( not ( = ?auto_646585 ?auto_646588 ) ) ( not ( = ?auto_646585 ?auto_646589 ) ) ( not ( = ?auto_646585 ?auto_646590 ) ) ( not ( = ?auto_646585 ?auto_646591 ) ) ( not ( = ?auto_646585 ?auto_646592 ) ) ( not ( = ?auto_646585 ?auto_646593 ) ) ( not ( = ?auto_646585 ?auto_646594 ) ) ( not ( = ?auto_646585 ?auto_646595 ) ) ( not ( = ?auto_646585 ?auto_646596 ) ) ( not ( = ?auto_646585 ?auto_646597 ) ) ( not ( = ?auto_646585 ?auto_646598 ) ) ( not ( = ?auto_646586 ?auto_646587 ) ) ( not ( = ?auto_646586 ?auto_646588 ) ) ( not ( = ?auto_646586 ?auto_646589 ) ) ( not ( = ?auto_646586 ?auto_646590 ) ) ( not ( = ?auto_646586 ?auto_646591 ) ) ( not ( = ?auto_646586 ?auto_646592 ) ) ( not ( = ?auto_646586 ?auto_646593 ) ) ( not ( = ?auto_646586 ?auto_646594 ) ) ( not ( = ?auto_646586 ?auto_646595 ) ) ( not ( = ?auto_646586 ?auto_646596 ) ) ( not ( = ?auto_646586 ?auto_646597 ) ) ( not ( = ?auto_646586 ?auto_646598 ) ) ( not ( = ?auto_646587 ?auto_646588 ) ) ( not ( = ?auto_646587 ?auto_646589 ) ) ( not ( = ?auto_646587 ?auto_646590 ) ) ( not ( = ?auto_646587 ?auto_646591 ) ) ( not ( = ?auto_646587 ?auto_646592 ) ) ( not ( = ?auto_646587 ?auto_646593 ) ) ( not ( = ?auto_646587 ?auto_646594 ) ) ( not ( = ?auto_646587 ?auto_646595 ) ) ( not ( = ?auto_646587 ?auto_646596 ) ) ( not ( = ?auto_646587 ?auto_646597 ) ) ( not ( = ?auto_646587 ?auto_646598 ) ) ( not ( = ?auto_646588 ?auto_646589 ) ) ( not ( = ?auto_646588 ?auto_646590 ) ) ( not ( = ?auto_646588 ?auto_646591 ) ) ( not ( = ?auto_646588 ?auto_646592 ) ) ( not ( = ?auto_646588 ?auto_646593 ) ) ( not ( = ?auto_646588 ?auto_646594 ) ) ( not ( = ?auto_646588 ?auto_646595 ) ) ( not ( = ?auto_646588 ?auto_646596 ) ) ( not ( = ?auto_646588 ?auto_646597 ) ) ( not ( = ?auto_646588 ?auto_646598 ) ) ( not ( = ?auto_646589 ?auto_646590 ) ) ( not ( = ?auto_646589 ?auto_646591 ) ) ( not ( = ?auto_646589 ?auto_646592 ) ) ( not ( = ?auto_646589 ?auto_646593 ) ) ( not ( = ?auto_646589 ?auto_646594 ) ) ( not ( = ?auto_646589 ?auto_646595 ) ) ( not ( = ?auto_646589 ?auto_646596 ) ) ( not ( = ?auto_646589 ?auto_646597 ) ) ( not ( = ?auto_646589 ?auto_646598 ) ) ( not ( = ?auto_646590 ?auto_646591 ) ) ( not ( = ?auto_646590 ?auto_646592 ) ) ( not ( = ?auto_646590 ?auto_646593 ) ) ( not ( = ?auto_646590 ?auto_646594 ) ) ( not ( = ?auto_646590 ?auto_646595 ) ) ( not ( = ?auto_646590 ?auto_646596 ) ) ( not ( = ?auto_646590 ?auto_646597 ) ) ( not ( = ?auto_646590 ?auto_646598 ) ) ( not ( = ?auto_646591 ?auto_646592 ) ) ( not ( = ?auto_646591 ?auto_646593 ) ) ( not ( = ?auto_646591 ?auto_646594 ) ) ( not ( = ?auto_646591 ?auto_646595 ) ) ( not ( = ?auto_646591 ?auto_646596 ) ) ( not ( = ?auto_646591 ?auto_646597 ) ) ( not ( = ?auto_646591 ?auto_646598 ) ) ( not ( = ?auto_646592 ?auto_646593 ) ) ( not ( = ?auto_646592 ?auto_646594 ) ) ( not ( = ?auto_646592 ?auto_646595 ) ) ( not ( = ?auto_646592 ?auto_646596 ) ) ( not ( = ?auto_646592 ?auto_646597 ) ) ( not ( = ?auto_646592 ?auto_646598 ) ) ( not ( = ?auto_646593 ?auto_646594 ) ) ( not ( = ?auto_646593 ?auto_646595 ) ) ( not ( = ?auto_646593 ?auto_646596 ) ) ( not ( = ?auto_646593 ?auto_646597 ) ) ( not ( = ?auto_646593 ?auto_646598 ) ) ( not ( = ?auto_646594 ?auto_646595 ) ) ( not ( = ?auto_646594 ?auto_646596 ) ) ( not ( = ?auto_646594 ?auto_646597 ) ) ( not ( = ?auto_646594 ?auto_646598 ) ) ( not ( = ?auto_646595 ?auto_646596 ) ) ( not ( = ?auto_646595 ?auto_646597 ) ) ( not ( = ?auto_646595 ?auto_646598 ) ) ( not ( = ?auto_646596 ?auto_646597 ) ) ( not ( = ?auto_646596 ?auto_646598 ) ) ( not ( = ?auto_646597 ?auto_646598 ) ) ( ON ?auto_646596 ?auto_646597 ) ( ON ?auto_646595 ?auto_646596 ) ( ON ?auto_646594 ?auto_646595 ) ( ON ?auto_646593 ?auto_646594 ) ( ON ?auto_646592 ?auto_646593 ) ( ON ?auto_646591 ?auto_646592 ) ( ON ?auto_646590 ?auto_646591 ) ( CLEAR ?auto_646588 ) ( ON ?auto_646589 ?auto_646590 ) ( CLEAR ?auto_646589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_646584 ?auto_646585 ?auto_646586 ?auto_646587 ?auto_646588 ?auto_646589 )
      ( MAKE-14PILE ?auto_646584 ?auto_646585 ?auto_646586 ?auto_646587 ?auto_646588 ?auto_646589 ?auto_646590 ?auto_646591 ?auto_646592 ?auto_646593 ?auto_646594 ?auto_646595 ?auto_646596 ?auto_646597 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646642 - BLOCK
      ?auto_646643 - BLOCK
      ?auto_646644 - BLOCK
      ?auto_646645 - BLOCK
      ?auto_646646 - BLOCK
      ?auto_646647 - BLOCK
      ?auto_646648 - BLOCK
      ?auto_646649 - BLOCK
      ?auto_646650 - BLOCK
      ?auto_646651 - BLOCK
      ?auto_646652 - BLOCK
      ?auto_646653 - BLOCK
      ?auto_646654 - BLOCK
      ?auto_646655 - BLOCK
    )
    :vars
    (
      ?auto_646656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646655 ?auto_646656 ) ( ON-TABLE ?auto_646642 ) ( ON ?auto_646643 ?auto_646642 ) ( ON ?auto_646644 ?auto_646643 ) ( ON ?auto_646645 ?auto_646644 ) ( not ( = ?auto_646642 ?auto_646643 ) ) ( not ( = ?auto_646642 ?auto_646644 ) ) ( not ( = ?auto_646642 ?auto_646645 ) ) ( not ( = ?auto_646642 ?auto_646646 ) ) ( not ( = ?auto_646642 ?auto_646647 ) ) ( not ( = ?auto_646642 ?auto_646648 ) ) ( not ( = ?auto_646642 ?auto_646649 ) ) ( not ( = ?auto_646642 ?auto_646650 ) ) ( not ( = ?auto_646642 ?auto_646651 ) ) ( not ( = ?auto_646642 ?auto_646652 ) ) ( not ( = ?auto_646642 ?auto_646653 ) ) ( not ( = ?auto_646642 ?auto_646654 ) ) ( not ( = ?auto_646642 ?auto_646655 ) ) ( not ( = ?auto_646642 ?auto_646656 ) ) ( not ( = ?auto_646643 ?auto_646644 ) ) ( not ( = ?auto_646643 ?auto_646645 ) ) ( not ( = ?auto_646643 ?auto_646646 ) ) ( not ( = ?auto_646643 ?auto_646647 ) ) ( not ( = ?auto_646643 ?auto_646648 ) ) ( not ( = ?auto_646643 ?auto_646649 ) ) ( not ( = ?auto_646643 ?auto_646650 ) ) ( not ( = ?auto_646643 ?auto_646651 ) ) ( not ( = ?auto_646643 ?auto_646652 ) ) ( not ( = ?auto_646643 ?auto_646653 ) ) ( not ( = ?auto_646643 ?auto_646654 ) ) ( not ( = ?auto_646643 ?auto_646655 ) ) ( not ( = ?auto_646643 ?auto_646656 ) ) ( not ( = ?auto_646644 ?auto_646645 ) ) ( not ( = ?auto_646644 ?auto_646646 ) ) ( not ( = ?auto_646644 ?auto_646647 ) ) ( not ( = ?auto_646644 ?auto_646648 ) ) ( not ( = ?auto_646644 ?auto_646649 ) ) ( not ( = ?auto_646644 ?auto_646650 ) ) ( not ( = ?auto_646644 ?auto_646651 ) ) ( not ( = ?auto_646644 ?auto_646652 ) ) ( not ( = ?auto_646644 ?auto_646653 ) ) ( not ( = ?auto_646644 ?auto_646654 ) ) ( not ( = ?auto_646644 ?auto_646655 ) ) ( not ( = ?auto_646644 ?auto_646656 ) ) ( not ( = ?auto_646645 ?auto_646646 ) ) ( not ( = ?auto_646645 ?auto_646647 ) ) ( not ( = ?auto_646645 ?auto_646648 ) ) ( not ( = ?auto_646645 ?auto_646649 ) ) ( not ( = ?auto_646645 ?auto_646650 ) ) ( not ( = ?auto_646645 ?auto_646651 ) ) ( not ( = ?auto_646645 ?auto_646652 ) ) ( not ( = ?auto_646645 ?auto_646653 ) ) ( not ( = ?auto_646645 ?auto_646654 ) ) ( not ( = ?auto_646645 ?auto_646655 ) ) ( not ( = ?auto_646645 ?auto_646656 ) ) ( not ( = ?auto_646646 ?auto_646647 ) ) ( not ( = ?auto_646646 ?auto_646648 ) ) ( not ( = ?auto_646646 ?auto_646649 ) ) ( not ( = ?auto_646646 ?auto_646650 ) ) ( not ( = ?auto_646646 ?auto_646651 ) ) ( not ( = ?auto_646646 ?auto_646652 ) ) ( not ( = ?auto_646646 ?auto_646653 ) ) ( not ( = ?auto_646646 ?auto_646654 ) ) ( not ( = ?auto_646646 ?auto_646655 ) ) ( not ( = ?auto_646646 ?auto_646656 ) ) ( not ( = ?auto_646647 ?auto_646648 ) ) ( not ( = ?auto_646647 ?auto_646649 ) ) ( not ( = ?auto_646647 ?auto_646650 ) ) ( not ( = ?auto_646647 ?auto_646651 ) ) ( not ( = ?auto_646647 ?auto_646652 ) ) ( not ( = ?auto_646647 ?auto_646653 ) ) ( not ( = ?auto_646647 ?auto_646654 ) ) ( not ( = ?auto_646647 ?auto_646655 ) ) ( not ( = ?auto_646647 ?auto_646656 ) ) ( not ( = ?auto_646648 ?auto_646649 ) ) ( not ( = ?auto_646648 ?auto_646650 ) ) ( not ( = ?auto_646648 ?auto_646651 ) ) ( not ( = ?auto_646648 ?auto_646652 ) ) ( not ( = ?auto_646648 ?auto_646653 ) ) ( not ( = ?auto_646648 ?auto_646654 ) ) ( not ( = ?auto_646648 ?auto_646655 ) ) ( not ( = ?auto_646648 ?auto_646656 ) ) ( not ( = ?auto_646649 ?auto_646650 ) ) ( not ( = ?auto_646649 ?auto_646651 ) ) ( not ( = ?auto_646649 ?auto_646652 ) ) ( not ( = ?auto_646649 ?auto_646653 ) ) ( not ( = ?auto_646649 ?auto_646654 ) ) ( not ( = ?auto_646649 ?auto_646655 ) ) ( not ( = ?auto_646649 ?auto_646656 ) ) ( not ( = ?auto_646650 ?auto_646651 ) ) ( not ( = ?auto_646650 ?auto_646652 ) ) ( not ( = ?auto_646650 ?auto_646653 ) ) ( not ( = ?auto_646650 ?auto_646654 ) ) ( not ( = ?auto_646650 ?auto_646655 ) ) ( not ( = ?auto_646650 ?auto_646656 ) ) ( not ( = ?auto_646651 ?auto_646652 ) ) ( not ( = ?auto_646651 ?auto_646653 ) ) ( not ( = ?auto_646651 ?auto_646654 ) ) ( not ( = ?auto_646651 ?auto_646655 ) ) ( not ( = ?auto_646651 ?auto_646656 ) ) ( not ( = ?auto_646652 ?auto_646653 ) ) ( not ( = ?auto_646652 ?auto_646654 ) ) ( not ( = ?auto_646652 ?auto_646655 ) ) ( not ( = ?auto_646652 ?auto_646656 ) ) ( not ( = ?auto_646653 ?auto_646654 ) ) ( not ( = ?auto_646653 ?auto_646655 ) ) ( not ( = ?auto_646653 ?auto_646656 ) ) ( not ( = ?auto_646654 ?auto_646655 ) ) ( not ( = ?auto_646654 ?auto_646656 ) ) ( not ( = ?auto_646655 ?auto_646656 ) ) ( ON ?auto_646654 ?auto_646655 ) ( ON ?auto_646653 ?auto_646654 ) ( ON ?auto_646652 ?auto_646653 ) ( ON ?auto_646651 ?auto_646652 ) ( ON ?auto_646650 ?auto_646651 ) ( ON ?auto_646649 ?auto_646650 ) ( ON ?auto_646648 ?auto_646649 ) ( ON ?auto_646647 ?auto_646648 ) ( CLEAR ?auto_646645 ) ( ON ?auto_646646 ?auto_646647 ) ( CLEAR ?auto_646646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_646642 ?auto_646643 ?auto_646644 ?auto_646645 ?auto_646646 )
      ( MAKE-14PILE ?auto_646642 ?auto_646643 ?auto_646644 ?auto_646645 ?auto_646646 ?auto_646647 ?auto_646648 ?auto_646649 ?auto_646650 ?auto_646651 ?auto_646652 ?auto_646653 ?auto_646654 ?auto_646655 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646700 - BLOCK
      ?auto_646701 - BLOCK
      ?auto_646702 - BLOCK
      ?auto_646703 - BLOCK
      ?auto_646704 - BLOCK
      ?auto_646705 - BLOCK
      ?auto_646706 - BLOCK
      ?auto_646707 - BLOCK
      ?auto_646708 - BLOCK
      ?auto_646709 - BLOCK
      ?auto_646710 - BLOCK
      ?auto_646711 - BLOCK
      ?auto_646712 - BLOCK
      ?auto_646713 - BLOCK
    )
    :vars
    (
      ?auto_646714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646713 ?auto_646714 ) ( ON-TABLE ?auto_646700 ) ( ON ?auto_646701 ?auto_646700 ) ( ON ?auto_646702 ?auto_646701 ) ( not ( = ?auto_646700 ?auto_646701 ) ) ( not ( = ?auto_646700 ?auto_646702 ) ) ( not ( = ?auto_646700 ?auto_646703 ) ) ( not ( = ?auto_646700 ?auto_646704 ) ) ( not ( = ?auto_646700 ?auto_646705 ) ) ( not ( = ?auto_646700 ?auto_646706 ) ) ( not ( = ?auto_646700 ?auto_646707 ) ) ( not ( = ?auto_646700 ?auto_646708 ) ) ( not ( = ?auto_646700 ?auto_646709 ) ) ( not ( = ?auto_646700 ?auto_646710 ) ) ( not ( = ?auto_646700 ?auto_646711 ) ) ( not ( = ?auto_646700 ?auto_646712 ) ) ( not ( = ?auto_646700 ?auto_646713 ) ) ( not ( = ?auto_646700 ?auto_646714 ) ) ( not ( = ?auto_646701 ?auto_646702 ) ) ( not ( = ?auto_646701 ?auto_646703 ) ) ( not ( = ?auto_646701 ?auto_646704 ) ) ( not ( = ?auto_646701 ?auto_646705 ) ) ( not ( = ?auto_646701 ?auto_646706 ) ) ( not ( = ?auto_646701 ?auto_646707 ) ) ( not ( = ?auto_646701 ?auto_646708 ) ) ( not ( = ?auto_646701 ?auto_646709 ) ) ( not ( = ?auto_646701 ?auto_646710 ) ) ( not ( = ?auto_646701 ?auto_646711 ) ) ( not ( = ?auto_646701 ?auto_646712 ) ) ( not ( = ?auto_646701 ?auto_646713 ) ) ( not ( = ?auto_646701 ?auto_646714 ) ) ( not ( = ?auto_646702 ?auto_646703 ) ) ( not ( = ?auto_646702 ?auto_646704 ) ) ( not ( = ?auto_646702 ?auto_646705 ) ) ( not ( = ?auto_646702 ?auto_646706 ) ) ( not ( = ?auto_646702 ?auto_646707 ) ) ( not ( = ?auto_646702 ?auto_646708 ) ) ( not ( = ?auto_646702 ?auto_646709 ) ) ( not ( = ?auto_646702 ?auto_646710 ) ) ( not ( = ?auto_646702 ?auto_646711 ) ) ( not ( = ?auto_646702 ?auto_646712 ) ) ( not ( = ?auto_646702 ?auto_646713 ) ) ( not ( = ?auto_646702 ?auto_646714 ) ) ( not ( = ?auto_646703 ?auto_646704 ) ) ( not ( = ?auto_646703 ?auto_646705 ) ) ( not ( = ?auto_646703 ?auto_646706 ) ) ( not ( = ?auto_646703 ?auto_646707 ) ) ( not ( = ?auto_646703 ?auto_646708 ) ) ( not ( = ?auto_646703 ?auto_646709 ) ) ( not ( = ?auto_646703 ?auto_646710 ) ) ( not ( = ?auto_646703 ?auto_646711 ) ) ( not ( = ?auto_646703 ?auto_646712 ) ) ( not ( = ?auto_646703 ?auto_646713 ) ) ( not ( = ?auto_646703 ?auto_646714 ) ) ( not ( = ?auto_646704 ?auto_646705 ) ) ( not ( = ?auto_646704 ?auto_646706 ) ) ( not ( = ?auto_646704 ?auto_646707 ) ) ( not ( = ?auto_646704 ?auto_646708 ) ) ( not ( = ?auto_646704 ?auto_646709 ) ) ( not ( = ?auto_646704 ?auto_646710 ) ) ( not ( = ?auto_646704 ?auto_646711 ) ) ( not ( = ?auto_646704 ?auto_646712 ) ) ( not ( = ?auto_646704 ?auto_646713 ) ) ( not ( = ?auto_646704 ?auto_646714 ) ) ( not ( = ?auto_646705 ?auto_646706 ) ) ( not ( = ?auto_646705 ?auto_646707 ) ) ( not ( = ?auto_646705 ?auto_646708 ) ) ( not ( = ?auto_646705 ?auto_646709 ) ) ( not ( = ?auto_646705 ?auto_646710 ) ) ( not ( = ?auto_646705 ?auto_646711 ) ) ( not ( = ?auto_646705 ?auto_646712 ) ) ( not ( = ?auto_646705 ?auto_646713 ) ) ( not ( = ?auto_646705 ?auto_646714 ) ) ( not ( = ?auto_646706 ?auto_646707 ) ) ( not ( = ?auto_646706 ?auto_646708 ) ) ( not ( = ?auto_646706 ?auto_646709 ) ) ( not ( = ?auto_646706 ?auto_646710 ) ) ( not ( = ?auto_646706 ?auto_646711 ) ) ( not ( = ?auto_646706 ?auto_646712 ) ) ( not ( = ?auto_646706 ?auto_646713 ) ) ( not ( = ?auto_646706 ?auto_646714 ) ) ( not ( = ?auto_646707 ?auto_646708 ) ) ( not ( = ?auto_646707 ?auto_646709 ) ) ( not ( = ?auto_646707 ?auto_646710 ) ) ( not ( = ?auto_646707 ?auto_646711 ) ) ( not ( = ?auto_646707 ?auto_646712 ) ) ( not ( = ?auto_646707 ?auto_646713 ) ) ( not ( = ?auto_646707 ?auto_646714 ) ) ( not ( = ?auto_646708 ?auto_646709 ) ) ( not ( = ?auto_646708 ?auto_646710 ) ) ( not ( = ?auto_646708 ?auto_646711 ) ) ( not ( = ?auto_646708 ?auto_646712 ) ) ( not ( = ?auto_646708 ?auto_646713 ) ) ( not ( = ?auto_646708 ?auto_646714 ) ) ( not ( = ?auto_646709 ?auto_646710 ) ) ( not ( = ?auto_646709 ?auto_646711 ) ) ( not ( = ?auto_646709 ?auto_646712 ) ) ( not ( = ?auto_646709 ?auto_646713 ) ) ( not ( = ?auto_646709 ?auto_646714 ) ) ( not ( = ?auto_646710 ?auto_646711 ) ) ( not ( = ?auto_646710 ?auto_646712 ) ) ( not ( = ?auto_646710 ?auto_646713 ) ) ( not ( = ?auto_646710 ?auto_646714 ) ) ( not ( = ?auto_646711 ?auto_646712 ) ) ( not ( = ?auto_646711 ?auto_646713 ) ) ( not ( = ?auto_646711 ?auto_646714 ) ) ( not ( = ?auto_646712 ?auto_646713 ) ) ( not ( = ?auto_646712 ?auto_646714 ) ) ( not ( = ?auto_646713 ?auto_646714 ) ) ( ON ?auto_646712 ?auto_646713 ) ( ON ?auto_646711 ?auto_646712 ) ( ON ?auto_646710 ?auto_646711 ) ( ON ?auto_646709 ?auto_646710 ) ( ON ?auto_646708 ?auto_646709 ) ( ON ?auto_646707 ?auto_646708 ) ( ON ?auto_646706 ?auto_646707 ) ( ON ?auto_646705 ?auto_646706 ) ( ON ?auto_646704 ?auto_646705 ) ( CLEAR ?auto_646702 ) ( ON ?auto_646703 ?auto_646704 ) ( CLEAR ?auto_646703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_646700 ?auto_646701 ?auto_646702 ?auto_646703 )
      ( MAKE-14PILE ?auto_646700 ?auto_646701 ?auto_646702 ?auto_646703 ?auto_646704 ?auto_646705 ?auto_646706 ?auto_646707 ?auto_646708 ?auto_646709 ?auto_646710 ?auto_646711 ?auto_646712 ?auto_646713 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646758 - BLOCK
      ?auto_646759 - BLOCK
      ?auto_646760 - BLOCK
      ?auto_646761 - BLOCK
      ?auto_646762 - BLOCK
      ?auto_646763 - BLOCK
      ?auto_646764 - BLOCK
      ?auto_646765 - BLOCK
      ?auto_646766 - BLOCK
      ?auto_646767 - BLOCK
      ?auto_646768 - BLOCK
      ?auto_646769 - BLOCK
      ?auto_646770 - BLOCK
      ?auto_646771 - BLOCK
    )
    :vars
    (
      ?auto_646772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646771 ?auto_646772 ) ( ON-TABLE ?auto_646758 ) ( ON ?auto_646759 ?auto_646758 ) ( not ( = ?auto_646758 ?auto_646759 ) ) ( not ( = ?auto_646758 ?auto_646760 ) ) ( not ( = ?auto_646758 ?auto_646761 ) ) ( not ( = ?auto_646758 ?auto_646762 ) ) ( not ( = ?auto_646758 ?auto_646763 ) ) ( not ( = ?auto_646758 ?auto_646764 ) ) ( not ( = ?auto_646758 ?auto_646765 ) ) ( not ( = ?auto_646758 ?auto_646766 ) ) ( not ( = ?auto_646758 ?auto_646767 ) ) ( not ( = ?auto_646758 ?auto_646768 ) ) ( not ( = ?auto_646758 ?auto_646769 ) ) ( not ( = ?auto_646758 ?auto_646770 ) ) ( not ( = ?auto_646758 ?auto_646771 ) ) ( not ( = ?auto_646758 ?auto_646772 ) ) ( not ( = ?auto_646759 ?auto_646760 ) ) ( not ( = ?auto_646759 ?auto_646761 ) ) ( not ( = ?auto_646759 ?auto_646762 ) ) ( not ( = ?auto_646759 ?auto_646763 ) ) ( not ( = ?auto_646759 ?auto_646764 ) ) ( not ( = ?auto_646759 ?auto_646765 ) ) ( not ( = ?auto_646759 ?auto_646766 ) ) ( not ( = ?auto_646759 ?auto_646767 ) ) ( not ( = ?auto_646759 ?auto_646768 ) ) ( not ( = ?auto_646759 ?auto_646769 ) ) ( not ( = ?auto_646759 ?auto_646770 ) ) ( not ( = ?auto_646759 ?auto_646771 ) ) ( not ( = ?auto_646759 ?auto_646772 ) ) ( not ( = ?auto_646760 ?auto_646761 ) ) ( not ( = ?auto_646760 ?auto_646762 ) ) ( not ( = ?auto_646760 ?auto_646763 ) ) ( not ( = ?auto_646760 ?auto_646764 ) ) ( not ( = ?auto_646760 ?auto_646765 ) ) ( not ( = ?auto_646760 ?auto_646766 ) ) ( not ( = ?auto_646760 ?auto_646767 ) ) ( not ( = ?auto_646760 ?auto_646768 ) ) ( not ( = ?auto_646760 ?auto_646769 ) ) ( not ( = ?auto_646760 ?auto_646770 ) ) ( not ( = ?auto_646760 ?auto_646771 ) ) ( not ( = ?auto_646760 ?auto_646772 ) ) ( not ( = ?auto_646761 ?auto_646762 ) ) ( not ( = ?auto_646761 ?auto_646763 ) ) ( not ( = ?auto_646761 ?auto_646764 ) ) ( not ( = ?auto_646761 ?auto_646765 ) ) ( not ( = ?auto_646761 ?auto_646766 ) ) ( not ( = ?auto_646761 ?auto_646767 ) ) ( not ( = ?auto_646761 ?auto_646768 ) ) ( not ( = ?auto_646761 ?auto_646769 ) ) ( not ( = ?auto_646761 ?auto_646770 ) ) ( not ( = ?auto_646761 ?auto_646771 ) ) ( not ( = ?auto_646761 ?auto_646772 ) ) ( not ( = ?auto_646762 ?auto_646763 ) ) ( not ( = ?auto_646762 ?auto_646764 ) ) ( not ( = ?auto_646762 ?auto_646765 ) ) ( not ( = ?auto_646762 ?auto_646766 ) ) ( not ( = ?auto_646762 ?auto_646767 ) ) ( not ( = ?auto_646762 ?auto_646768 ) ) ( not ( = ?auto_646762 ?auto_646769 ) ) ( not ( = ?auto_646762 ?auto_646770 ) ) ( not ( = ?auto_646762 ?auto_646771 ) ) ( not ( = ?auto_646762 ?auto_646772 ) ) ( not ( = ?auto_646763 ?auto_646764 ) ) ( not ( = ?auto_646763 ?auto_646765 ) ) ( not ( = ?auto_646763 ?auto_646766 ) ) ( not ( = ?auto_646763 ?auto_646767 ) ) ( not ( = ?auto_646763 ?auto_646768 ) ) ( not ( = ?auto_646763 ?auto_646769 ) ) ( not ( = ?auto_646763 ?auto_646770 ) ) ( not ( = ?auto_646763 ?auto_646771 ) ) ( not ( = ?auto_646763 ?auto_646772 ) ) ( not ( = ?auto_646764 ?auto_646765 ) ) ( not ( = ?auto_646764 ?auto_646766 ) ) ( not ( = ?auto_646764 ?auto_646767 ) ) ( not ( = ?auto_646764 ?auto_646768 ) ) ( not ( = ?auto_646764 ?auto_646769 ) ) ( not ( = ?auto_646764 ?auto_646770 ) ) ( not ( = ?auto_646764 ?auto_646771 ) ) ( not ( = ?auto_646764 ?auto_646772 ) ) ( not ( = ?auto_646765 ?auto_646766 ) ) ( not ( = ?auto_646765 ?auto_646767 ) ) ( not ( = ?auto_646765 ?auto_646768 ) ) ( not ( = ?auto_646765 ?auto_646769 ) ) ( not ( = ?auto_646765 ?auto_646770 ) ) ( not ( = ?auto_646765 ?auto_646771 ) ) ( not ( = ?auto_646765 ?auto_646772 ) ) ( not ( = ?auto_646766 ?auto_646767 ) ) ( not ( = ?auto_646766 ?auto_646768 ) ) ( not ( = ?auto_646766 ?auto_646769 ) ) ( not ( = ?auto_646766 ?auto_646770 ) ) ( not ( = ?auto_646766 ?auto_646771 ) ) ( not ( = ?auto_646766 ?auto_646772 ) ) ( not ( = ?auto_646767 ?auto_646768 ) ) ( not ( = ?auto_646767 ?auto_646769 ) ) ( not ( = ?auto_646767 ?auto_646770 ) ) ( not ( = ?auto_646767 ?auto_646771 ) ) ( not ( = ?auto_646767 ?auto_646772 ) ) ( not ( = ?auto_646768 ?auto_646769 ) ) ( not ( = ?auto_646768 ?auto_646770 ) ) ( not ( = ?auto_646768 ?auto_646771 ) ) ( not ( = ?auto_646768 ?auto_646772 ) ) ( not ( = ?auto_646769 ?auto_646770 ) ) ( not ( = ?auto_646769 ?auto_646771 ) ) ( not ( = ?auto_646769 ?auto_646772 ) ) ( not ( = ?auto_646770 ?auto_646771 ) ) ( not ( = ?auto_646770 ?auto_646772 ) ) ( not ( = ?auto_646771 ?auto_646772 ) ) ( ON ?auto_646770 ?auto_646771 ) ( ON ?auto_646769 ?auto_646770 ) ( ON ?auto_646768 ?auto_646769 ) ( ON ?auto_646767 ?auto_646768 ) ( ON ?auto_646766 ?auto_646767 ) ( ON ?auto_646765 ?auto_646766 ) ( ON ?auto_646764 ?auto_646765 ) ( ON ?auto_646763 ?auto_646764 ) ( ON ?auto_646762 ?auto_646763 ) ( ON ?auto_646761 ?auto_646762 ) ( CLEAR ?auto_646759 ) ( ON ?auto_646760 ?auto_646761 ) ( CLEAR ?auto_646760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_646758 ?auto_646759 ?auto_646760 )
      ( MAKE-14PILE ?auto_646758 ?auto_646759 ?auto_646760 ?auto_646761 ?auto_646762 ?auto_646763 ?auto_646764 ?auto_646765 ?auto_646766 ?auto_646767 ?auto_646768 ?auto_646769 ?auto_646770 ?auto_646771 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646816 - BLOCK
      ?auto_646817 - BLOCK
      ?auto_646818 - BLOCK
      ?auto_646819 - BLOCK
      ?auto_646820 - BLOCK
      ?auto_646821 - BLOCK
      ?auto_646822 - BLOCK
      ?auto_646823 - BLOCK
      ?auto_646824 - BLOCK
      ?auto_646825 - BLOCK
      ?auto_646826 - BLOCK
      ?auto_646827 - BLOCK
      ?auto_646828 - BLOCK
      ?auto_646829 - BLOCK
    )
    :vars
    (
      ?auto_646830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646829 ?auto_646830 ) ( ON-TABLE ?auto_646816 ) ( not ( = ?auto_646816 ?auto_646817 ) ) ( not ( = ?auto_646816 ?auto_646818 ) ) ( not ( = ?auto_646816 ?auto_646819 ) ) ( not ( = ?auto_646816 ?auto_646820 ) ) ( not ( = ?auto_646816 ?auto_646821 ) ) ( not ( = ?auto_646816 ?auto_646822 ) ) ( not ( = ?auto_646816 ?auto_646823 ) ) ( not ( = ?auto_646816 ?auto_646824 ) ) ( not ( = ?auto_646816 ?auto_646825 ) ) ( not ( = ?auto_646816 ?auto_646826 ) ) ( not ( = ?auto_646816 ?auto_646827 ) ) ( not ( = ?auto_646816 ?auto_646828 ) ) ( not ( = ?auto_646816 ?auto_646829 ) ) ( not ( = ?auto_646816 ?auto_646830 ) ) ( not ( = ?auto_646817 ?auto_646818 ) ) ( not ( = ?auto_646817 ?auto_646819 ) ) ( not ( = ?auto_646817 ?auto_646820 ) ) ( not ( = ?auto_646817 ?auto_646821 ) ) ( not ( = ?auto_646817 ?auto_646822 ) ) ( not ( = ?auto_646817 ?auto_646823 ) ) ( not ( = ?auto_646817 ?auto_646824 ) ) ( not ( = ?auto_646817 ?auto_646825 ) ) ( not ( = ?auto_646817 ?auto_646826 ) ) ( not ( = ?auto_646817 ?auto_646827 ) ) ( not ( = ?auto_646817 ?auto_646828 ) ) ( not ( = ?auto_646817 ?auto_646829 ) ) ( not ( = ?auto_646817 ?auto_646830 ) ) ( not ( = ?auto_646818 ?auto_646819 ) ) ( not ( = ?auto_646818 ?auto_646820 ) ) ( not ( = ?auto_646818 ?auto_646821 ) ) ( not ( = ?auto_646818 ?auto_646822 ) ) ( not ( = ?auto_646818 ?auto_646823 ) ) ( not ( = ?auto_646818 ?auto_646824 ) ) ( not ( = ?auto_646818 ?auto_646825 ) ) ( not ( = ?auto_646818 ?auto_646826 ) ) ( not ( = ?auto_646818 ?auto_646827 ) ) ( not ( = ?auto_646818 ?auto_646828 ) ) ( not ( = ?auto_646818 ?auto_646829 ) ) ( not ( = ?auto_646818 ?auto_646830 ) ) ( not ( = ?auto_646819 ?auto_646820 ) ) ( not ( = ?auto_646819 ?auto_646821 ) ) ( not ( = ?auto_646819 ?auto_646822 ) ) ( not ( = ?auto_646819 ?auto_646823 ) ) ( not ( = ?auto_646819 ?auto_646824 ) ) ( not ( = ?auto_646819 ?auto_646825 ) ) ( not ( = ?auto_646819 ?auto_646826 ) ) ( not ( = ?auto_646819 ?auto_646827 ) ) ( not ( = ?auto_646819 ?auto_646828 ) ) ( not ( = ?auto_646819 ?auto_646829 ) ) ( not ( = ?auto_646819 ?auto_646830 ) ) ( not ( = ?auto_646820 ?auto_646821 ) ) ( not ( = ?auto_646820 ?auto_646822 ) ) ( not ( = ?auto_646820 ?auto_646823 ) ) ( not ( = ?auto_646820 ?auto_646824 ) ) ( not ( = ?auto_646820 ?auto_646825 ) ) ( not ( = ?auto_646820 ?auto_646826 ) ) ( not ( = ?auto_646820 ?auto_646827 ) ) ( not ( = ?auto_646820 ?auto_646828 ) ) ( not ( = ?auto_646820 ?auto_646829 ) ) ( not ( = ?auto_646820 ?auto_646830 ) ) ( not ( = ?auto_646821 ?auto_646822 ) ) ( not ( = ?auto_646821 ?auto_646823 ) ) ( not ( = ?auto_646821 ?auto_646824 ) ) ( not ( = ?auto_646821 ?auto_646825 ) ) ( not ( = ?auto_646821 ?auto_646826 ) ) ( not ( = ?auto_646821 ?auto_646827 ) ) ( not ( = ?auto_646821 ?auto_646828 ) ) ( not ( = ?auto_646821 ?auto_646829 ) ) ( not ( = ?auto_646821 ?auto_646830 ) ) ( not ( = ?auto_646822 ?auto_646823 ) ) ( not ( = ?auto_646822 ?auto_646824 ) ) ( not ( = ?auto_646822 ?auto_646825 ) ) ( not ( = ?auto_646822 ?auto_646826 ) ) ( not ( = ?auto_646822 ?auto_646827 ) ) ( not ( = ?auto_646822 ?auto_646828 ) ) ( not ( = ?auto_646822 ?auto_646829 ) ) ( not ( = ?auto_646822 ?auto_646830 ) ) ( not ( = ?auto_646823 ?auto_646824 ) ) ( not ( = ?auto_646823 ?auto_646825 ) ) ( not ( = ?auto_646823 ?auto_646826 ) ) ( not ( = ?auto_646823 ?auto_646827 ) ) ( not ( = ?auto_646823 ?auto_646828 ) ) ( not ( = ?auto_646823 ?auto_646829 ) ) ( not ( = ?auto_646823 ?auto_646830 ) ) ( not ( = ?auto_646824 ?auto_646825 ) ) ( not ( = ?auto_646824 ?auto_646826 ) ) ( not ( = ?auto_646824 ?auto_646827 ) ) ( not ( = ?auto_646824 ?auto_646828 ) ) ( not ( = ?auto_646824 ?auto_646829 ) ) ( not ( = ?auto_646824 ?auto_646830 ) ) ( not ( = ?auto_646825 ?auto_646826 ) ) ( not ( = ?auto_646825 ?auto_646827 ) ) ( not ( = ?auto_646825 ?auto_646828 ) ) ( not ( = ?auto_646825 ?auto_646829 ) ) ( not ( = ?auto_646825 ?auto_646830 ) ) ( not ( = ?auto_646826 ?auto_646827 ) ) ( not ( = ?auto_646826 ?auto_646828 ) ) ( not ( = ?auto_646826 ?auto_646829 ) ) ( not ( = ?auto_646826 ?auto_646830 ) ) ( not ( = ?auto_646827 ?auto_646828 ) ) ( not ( = ?auto_646827 ?auto_646829 ) ) ( not ( = ?auto_646827 ?auto_646830 ) ) ( not ( = ?auto_646828 ?auto_646829 ) ) ( not ( = ?auto_646828 ?auto_646830 ) ) ( not ( = ?auto_646829 ?auto_646830 ) ) ( ON ?auto_646828 ?auto_646829 ) ( ON ?auto_646827 ?auto_646828 ) ( ON ?auto_646826 ?auto_646827 ) ( ON ?auto_646825 ?auto_646826 ) ( ON ?auto_646824 ?auto_646825 ) ( ON ?auto_646823 ?auto_646824 ) ( ON ?auto_646822 ?auto_646823 ) ( ON ?auto_646821 ?auto_646822 ) ( ON ?auto_646820 ?auto_646821 ) ( ON ?auto_646819 ?auto_646820 ) ( ON ?auto_646818 ?auto_646819 ) ( CLEAR ?auto_646816 ) ( ON ?auto_646817 ?auto_646818 ) ( CLEAR ?auto_646817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_646816 ?auto_646817 )
      ( MAKE-14PILE ?auto_646816 ?auto_646817 ?auto_646818 ?auto_646819 ?auto_646820 ?auto_646821 ?auto_646822 ?auto_646823 ?auto_646824 ?auto_646825 ?auto_646826 ?auto_646827 ?auto_646828 ?auto_646829 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_646874 - BLOCK
      ?auto_646875 - BLOCK
      ?auto_646876 - BLOCK
      ?auto_646877 - BLOCK
      ?auto_646878 - BLOCK
      ?auto_646879 - BLOCK
      ?auto_646880 - BLOCK
      ?auto_646881 - BLOCK
      ?auto_646882 - BLOCK
      ?auto_646883 - BLOCK
      ?auto_646884 - BLOCK
      ?auto_646885 - BLOCK
      ?auto_646886 - BLOCK
      ?auto_646887 - BLOCK
    )
    :vars
    (
      ?auto_646888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_646887 ?auto_646888 ) ( not ( = ?auto_646874 ?auto_646875 ) ) ( not ( = ?auto_646874 ?auto_646876 ) ) ( not ( = ?auto_646874 ?auto_646877 ) ) ( not ( = ?auto_646874 ?auto_646878 ) ) ( not ( = ?auto_646874 ?auto_646879 ) ) ( not ( = ?auto_646874 ?auto_646880 ) ) ( not ( = ?auto_646874 ?auto_646881 ) ) ( not ( = ?auto_646874 ?auto_646882 ) ) ( not ( = ?auto_646874 ?auto_646883 ) ) ( not ( = ?auto_646874 ?auto_646884 ) ) ( not ( = ?auto_646874 ?auto_646885 ) ) ( not ( = ?auto_646874 ?auto_646886 ) ) ( not ( = ?auto_646874 ?auto_646887 ) ) ( not ( = ?auto_646874 ?auto_646888 ) ) ( not ( = ?auto_646875 ?auto_646876 ) ) ( not ( = ?auto_646875 ?auto_646877 ) ) ( not ( = ?auto_646875 ?auto_646878 ) ) ( not ( = ?auto_646875 ?auto_646879 ) ) ( not ( = ?auto_646875 ?auto_646880 ) ) ( not ( = ?auto_646875 ?auto_646881 ) ) ( not ( = ?auto_646875 ?auto_646882 ) ) ( not ( = ?auto_646875 ?auto_646883 ) ) ( not ( = ?auto_646875 ?auto_646884 ) ) ( not ( = ?auto_646875 ?auto_646885 ) ) ( not ( = ?auto_646875 ?auto_646886 ) ) ( not ( = ?auto_646875 ?auto_646887 ) ) ( not ( = ?auto_646875 ?auto_646888 ) ) ( not ( = ?auto_646876 ?auto_646877 ) ) ( not ( = ?auto_646876 ?auto_646878 ) ) ( not ( = ?auto_646876 ?auto_646879 ) ) ( not ( = ?auto_646876 ?auto_646880 ) ) ( not ( = ?auto_646876 ?auto_646881 ) ) ( not ( = ?auto_646876 ?auto_646882 ) ) ( not ( = ?auto_646876 ?auto_646883 ) ) ( not ( = ?auto_646876 ?auto_646884 ) ) ( not ( = ?auto_646876 ?auto_646885 ) ) ( not ( = ?auto_646876 ?auto_646886 ) ) ( not ( = ?auto_646876 ?auto_646887 ) ) ( not ( = ?auto_646876 ?auto_646888 ) ) ( not ( = ?auto_646877 ?auto_646878 ) ) ( not ( = ?auto_646877 ?auto_646879 ) ) ( not ( = ?auto_646877 ?auto_646880 ) ) ( not ( = ?auto_646877 ?auto_646881 ) ) ( not ( = ?auto_646877 ?auto_646882 ) ) ( not ( = ?auto_646877 ?auto_646883 ) ) ( not ( = ?auto_646877 ?auto_646884 ) ) ( not ( = ?auto_646877 ?auto_646885 ) ) ( not ( = ?auto_646877 ?auto_646886 ) ) ( not ( = ?auto_646877 ?auto_646887 ) ) ( not ( = ?auto_646877 ?auto_646888 ) ) ( not ( = ?auto_646878 ?auto_646879 ) ) ( not ( = ?auto_646878 ?auto_646880 ) ) ( not ( = ?auto_646878 ?auto_646881 ) ) ( not ( = ?auto_646878 ?auto_646882 ) ) ( not ( = ?auto_646878 ?auto_646883 ) ) ( not ( = ?auto_646878 ?auto_646884 ) ) ( not ( = ?auto_646878 ?auto_646885 ) ) ( not ( = ?auto_646878 ?auto_646886 ) ) ( not ( = ?auto_646878 ?auto_646887 ) ) ( not ( = ?auto_646878 ?auto_646888 ) ) ( not ( = ?auto_646879 ?auto_646880 ) ) ( not ( = ?auto_646879 ?auto_646881 ) ) ( not ( = ?auto_646879 ?auto_646882 ) ) ( not ( = ?auto_646879 ?auto_646883 ) ) ( not ( = ?auto_646879 ?auto_646884 ) ) ( not ( = ?auto_646879 ?auto_646885 ) ) ( not ( = ?auto_646879 ?auto_646886 ) ) ( not ( = ?auto_646879 ?auto_646887 ) ) ( not ( = ?auto_646879 ?auto_646888 ) ) ( not ( = ?auto_646880 ?auto_646881 ) ) ( not ( = ?auto_646880 ?auto_646882 ) ) ( not ( = ?auto_646880 ?auto_646883 ) ) ( not ( = ?auto_646880 ?auto_646884 ) ) ( not ( = ?auto_646880 ?auto_646885 ) ) ( not ( = ?auto_646880 ?auto_646886 ) ) ( not ( = ?auto_646880 ?auto_646887 ) ) ( not ( = ?auto_646880 ?auto_646888 ) ) ( not ( = ?auto_646881 ?auto_646882 ) ) ( not ( = ?auto_646881 ?auto_646883 ) ) ( not ( = ?auto_646881 ?auto_646884 ) ) ( not ( = ?auto_646881 ?auto_646885 ) ) ( not ( = ?auto_646881 ?auto_646886 ) ) ( not ( = ?auto_646881 ?auto_646887 ) ) ( not ( = ?auto_646881 ?auto_646888 ) ) ( not ( = ?auto_646882 ?auto_646883 ) ) ( not ( = ?auto_646882 ?auto_646884 ) ) ( not ( = ?auto_646882 ?auto_646885 ) ) ( not ( = ?auto_646882 ?auto_646886 ) ) ( not ( = ?auto_646882 ?auto_646887 ) ) ( not ( = ?auto_646882 ?auto_646888 ) ) ( not ( = ?auto_646883 ?auto_646884 ) ) ( not ( = ?auto_646883 ?auto_646885 ) ) ( not ( = ?auto_646883 ?auto_646886 ) ) ( not ( = ?auto_646883 ?auto_646887 ) ) ( not ( = ?auto_646883 ?auto_646888 ) ) ( not ( = ?auto_646884 ?auto_646885 ) ) ( not ( = ?auto_646884 ?auto_646886 ) ) ( not ( = ?auto_646884 ?auto_646887 ) ) ( not ( = ?auto_646884 ?auto_646888 ) ) ( not ( = ?auto_646885 ?auto_646886 ) ) ( not ( = ?auto_646885 ?auto_646887 ) ) ( not ( = ?auto_646885 ?auto_646888 ) ) ( not ( = ?auto_646886 ?auto_646887 ) ) ( not ( = ?auto_646886 ?auto_646888 ) ) ( not ( = ?auto_646887 ?auto_646888 ) ) ( ON ?auto_646886 ?auto_646887 ) ( ON ?auto_646885 ?auto_646886 ) ( ON ?auto_646884 ?auto_646885 ) ( ON ?auto_646883 ?auto_646884 ) ( ON ?auto_646882 ?auto_646883 ) ( ON ?auto_646881 ?auto_646882 ) ( ON ?auto_646880 ?auto_646881 ) ( ON ?auto_646879 ?auto_646880 ) ( ON ?auto_646878 ?auto_646879 ) ( ON ?auto_646877 ?auto_646878 ) ( ON ?auto_646876 ?auto_646877 ) ( ON ?auto_646875 ?auto_646876 ) ( ON ?auto_646874 ?auto_646875 ) ( CLEAR ?auto_646874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_646874 )
      ( MAKE-14PILE ?auto_646874 ?auto_646875 ?auto_646876 ?auto_646877 ?auto_646878 ?auto_646879 ?auto_646880 ?auto_646881 ?auto_646882 ?auto_646883 ?auto_646884 ?auto_646885 ?auto_646886 ?auto_646887 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_646933 - BLOCK
      ?auto_646934 - BLOCK
      ?auto_646935 - BLOCK
      ?auto_646936 - BLOCK
      ?auto_646937 - BLOCK
      ?auto_646938 - BLOCK
      ?auto_646939 - BLOCK
      ?auto_646940 - BLOCK
      ?auto_646941 - BLOCK
      ?auto_646942 - BLOCK
      ?auto_646943 - BLOCK
      ?auto_646944 - BLOCK
      ?auto_646945 - BLOCK
      ?auto_646946 - BLOCK
      ?auto_646947 - BLOCK
    )
    :vars
    (
      ?auto_646948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_646946 ) ( ON ?auto_646947 ?auto_646948 ) ( CLEAR ?auto_646947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_646933 ) ( ON ?auto_646934 ?auto_646933 ) ( ON ?auto_646935 ?auto_646934 ) ( ON ?auto_646936 ?auto_646935 ) ( ON ?auto_646937 ?auto_646936 ) ( ON ?auto_646938 ?auto_646937 ) ( ON ?auto_646939 ?auto_646938 ) ( ON ?auto_646940 ?auto_646939 ) ( ON ?auto_646941 ?auto_646940 ) ( ON ?auto_646942 ?auto_646941 ) ( ON ?auto_646943 ?auto_646942 ) ( ON ?auto_646944 ?auto_646943 ) ( ON ?auto_646945 ?auto_646944 ) ( ON ?auto_646946 ?auto_646945 ) ( not ( = ?auto_646933 ?auto_646934 ) ) ( not ( = ?auto_646933 ?auto_646935 ) ) ( not ( = ?auto_646933 ?auto_646936 ) ) ( not ( = ?auto_646933 ?auto_646937 ) ) ( not ( = ?auto_646933 ?auto_646938 ) ) ( not ( = ?auto_646933 ?auto_646939 ) ) ( not ( = ?auto_646933 ?auto_646940 ) ) ( not ( = ?auto_646933 ?auto_646941 ) ) ( not ( = ?auto_646933 ?auto_646942 ) ) ( not ( = ?auto_646933 ?auto_646943 ) ) ( not ( = ?auto_646933 ?auto_646944 ) ) ( not ( = ?auto_646933 ?auto_646945 ) ) ( not ( = ?auto_646933 ?auto_646946 ) ) ( not ( = ?auto_646933 ?auto_646947 ) ) ( not ( = ?auto_646933 ?auto_646948 ) ) ( not ( = ?auto_646934 ?auto_646935 ) ) ( not ( = ?auto_646934 ?auto_646936 ) ) ( not ( = ?auto_646934 ?auto_646937 ) ) ( not ( = ?auto_646934 ?auto_646938 ) ) ( not ( = ?auto_646934 ?auto_646939 ) ) ( not ( = ?auto_646934 ?auto_646940 ) ) ( not ( = ?auto_646934 ?auto_646941 ) ) ( not ( = ?auto_646934 ?auto_646942 ) ) ( not ( = ?auto_646934 ?auto_646943 ) ) ( not ( = ?auto_646934 ?auto_646944 ) ) ( not ( = ?auto_646934 ?auto_646945 ) ) ( not ( = ?auto_646934 ?auto_646946 ) ) ( not ( = ?auto_646934 ?auto_646947 ) ) ( not ( = ?auto_646934 ?auto_646948 ) ) ( not ( = ?auto_646935 ?auto_646936 ) ) ( not ( = ?auto_646935 ?auto_646937 ) ) ( not ( = ?auto_646935 ?auto_646938 ) ) ( not ( = ?auto_646935 ?auto_646939 ) ) ( not ( = ?auto_646935 ?auto_646940 ) ) ( not ( = ?auto_646935 ?auto_646941 ) ) ( not ( = ?auto_646935 ?auto_646942 ) ) ( not ( = ?auto_646935 ?auto_646943 ) ) ( not ( = ?auto_646935 ?auto_646944 ) ) ( not ( = ?auto_646935 ?auto_646945 ) ) ( not ( = ?auto_646935 ?auto_646946 ) ) ( not ( = ?auto_646935 ?auto_646947 ) ) ( not ( = ?auto_646935 ?auto_646948 ) ) ( not ( = ?auto_646936 ?auto_646937 ) ) ( not ( = ?auto_646936 ?auto_646938 ) ) ( not ( = ?auto_646936 ?auto_646939 ) ) ( not ( = ?auto_646936 ?auto_646940 ) ) ( not ( = ?auto_646936 ?auto_646941 ) ) ( not ( = ?auto_646936 ?auto_646942 ) ) ( not ( = ?auto_646936 ?auto_646943 ) ) ( not ( = ?auto_646936 ?auto_646944 ) ) ( not ( = ?auto_646936 ?auto_646945 ) ) ( not ( = ?auto_646936 ?auto_646946 ) ) ( not ( = ?auto_646936 ?auto_646947 ) ) ( not ( = ?auto_646936 ?auto_646948 ) ) ( not ( = ?auto_646937 ?auto_646938 ) ) ( not ( = ?auto_646937 ?auto_646939 ) ) ( not ( = ?auto_646937 ?auto_646940 ) ) ( not ( = ?auto_646937 ?auto_646941 ) ) ( not ( = ?auto_646937 ?auto_646942 ) ) ( not ( = ?auto_646937 ?auto_646943 ) ) ( not ( = ?auto_646937 ?auto_646944 ) ) ( not ( = ?auto_646937 ?auto_646945 ) ) ( not ( = ?auto_646937 ?auto_646946 ) ) ( not ( = ?auto_646937 ?auto_646947 ) ) ( not ( = ?auto_646937 ?auto_646948 ) ) ( not ( = ?auto_646938 ?auto_646939 ) ) ( not ( = ?auto_646938 ?auto_646940 ) ) ( not ( = ?auto_646938 ?auto_646941 ) ) ( not ( = ?auto_646938 ?auto_646942 ) ) ( not ( = ?auto_646938 ?auto_646943 ) ) ( not ( = ?auto_646938 ?auto_646944 ) ) ( not ( = ?auto_646938 ?auto_646945 ) ) ( not ( = ?auto_646938 ?auto_646946 ) ) ( not ( = ?auto_646938 ?auto_646947 ) ) ( not ( = ?auto_646938 ?auto_646948 ) ) ( not ( = ?auto_646939 ?auto_646940 ) ) ( not ( = ?auto_646939 ?auto_646941 ) ) ( not ( = ?auto_646939 ?auto_646942 ) ) ( not ( = ?auto_646939 ?auto_646943 ) ) ( not ( = ?auto_646939 ?auto_646944 ) ) ( not ( = ?auto_646939 ?auto_646945 ) ) ( not ( = ?auto_646939 ?auto_646946 ) ) ( not ( = ?auto_646939 ?auto_646947 ) ) ( not ( = ?auto_646939 ?auto_646948 ) ) ( not ( = ?auto_646940 ?auto_646941 ) ) ( not ( = ?auto_646940 ?auto_646942 ) ) ( not ( = ?auto_646940 ?auto_646943 ) ) ( not ( = ?auto_646940 ?auto_646944 ) ) ( not ( = ?auto_646940 ?auto_646945 ) ) ( not ( = ?auto_646940 ?auto_646946 ) ) ( not ( = ?auto_646940 ?auto_646947 ) ) ( not ( = ?auto_646940 ?auto_646948 ) ) ( not ( = ?auto_646941 ?auto_646942 ) ) ( not ( = ?auto_646941 ?auto_646943 ) ) ( not ( = ?auto_646941 ?auto_646944 ) ) ( not ( = ?auto_646941 ?auto_646945 ) ) ( not ( = ?auto_646941 ?auto_646946 ) ) ( not ( = ?auto_646941 ?auto_646947 ) ) ( not ( = ?auto_646941 ?auto_646948 ) ) ( not ( = ?auto_646942 ?auto_646943 ) ) ( not ( = ?auto_646942 ?auto_646944 ) ) ( not ( = ?auto_646942 ?auto_646945 ) ) ( not ( = ?auto_646942 ?auto_646946 ) ) ( not ( = ?auto_646942 ?auto_646947 ) ) ( not ( = ?auto_646942 ?auto_646948 ) ) ( not ( = ?auto_646943 ?auto_646944 ) ) ( not ( = ?auto_646943 ?auto_646945 ) ) ( not ( = ?auto_646943 ?auto_646946 ) ) ( not ( = ?auto_646943 ?auto_646947 ) ) ( not ( = ?auto_646943 ?auto_646948 ) ) ( not ( = ?auto_646944 ?auto_646945 ) ) ( not ( = ?auto_646944 ?auto_646946 ) ) ( not ( = ?auto_646944 ?auto_646947 ) ) ( not ( = ?auto_646944 ?auto_646948 ) ) ( not ( = ?auto_646945 ?auto_646946 ) ) ( not ( = ?auto_646945 ?auto_646947 ) ) ( not ( = ?auto_646945 ?auto_646948 ) ) ( not ( = ?auto_646946 ?auto_646947 ) ) ( not ( = ?auto_646946 ?auto_646948 ) ) ( not ( = ?auto_646947 ?auto_646948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_646947 ?auto_646948 )
      ( !STACK ?auto_646947 ?auto_646946 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_646995 - BLOCK
      ?auto_646996 - BLOCK
      ?auto_646997 - BLOCK
      ?auto_646998 - BLOCK
      ?auto_646999 - BLOCK
      ?auto_647000 - BLOCK
      ?auto_647001 - BLOCK
      ?auto_647002 - BLOCK
      ?auto_647003 - BLOCK
      ?auto_647004 - BLOCK
      ?auto_647005 - BLOCK
      ?auto_647006 - BLOCK
      ?auto_647007 - BLOCK
      ?auto_647008 - BLOCK
      ?auto_647009 - BLOCK
    )
    :vars
    (
      ?auto_647010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647009 ?auto_647010 ) ( ON-TABLE ?auto_646995 ) ( ON ?auto_646996 ?auto_646995 ) ( ON ?auto_646997 ?auto_646996 ) ( ON ?auto_646998 ?auto_646997 ) ( ON ?auto_646999 ?auto_646998 ) ( ON ?auto_647000 ?auto_646999 ) ( ON ?auto_647001 ?auto_647000 ) ( ON ?auto_647002 ?auto_647001 ) ( ON ?auto_647003 ?auto_647002 ) ( ON ?auto_647004 ?auto_647003 ) ( ON ?auto_647005 ?auto_647004 ) ( ON ?auto_647006 ?auto_647005 ) ( ON ?auto_647007 ?auto_647006 ) ( not ( = ?auto_646995 ?auto_646996 ) ) ( not ( = ?auto_646995 ?auto_646997 ) ) ( not ( = ?auto_646995 ?auto_646998 ) ) ( not ( = ?auto_646995 ?auto_646999 ) ) ( not ( = ?auto_646995 ?auto_647000 ) ) ( not ( = ?auto_646995 ?auto_647001 ) ) ( not ( = ?auto_646995 ?auto_647002 ) ) ( not ( = ?auto_646995 ?auto_647003 ) ) ( not ( = ?auto_646995 ?auto_647004 ) ) ( not ( = ?auto_646995 ?auto_647005 ) ) ( not ( = ?auto_646995 ?auto_647006 ) ) ( not ( = ?auto_646995 ?auto_647007 ) ) ( not ( = ?auto_646995 ?auto_647008 ) ) ( not ( = ?auto_646995 ?auto_647009 ) ) ( not ( = ?auto_646995 ?auto_647010 ) ) ( not ( = ?auto_646996 ?auto_646997 ) ) ( not ( = ?auto_646996 ?auto_646998 ) ) ( not ( = ?auto_646996 ?auto_646999 ) ) ( not ( = ?auto_646996 ?auto_647000 ) ) ( not ( = ?auto_646996 ?auto_647001 ) ) ( not ( = ?auto_646996 ?auto_647002 ) ) ( not ( = ?auto_646996 ?auto_647003 ) ) ( not ( = ?auto_646996 ?auto_647004 ) ) ( not ( = ?auto_646996 ?auto_647005 ) ) ( not ( = ?auto_646996 ?auto_647006 ) ) ( not ( = ?auto_646996 ?auto_647007 ) ) ( not ( = ?auto_646996 ?auto_647008 ) ) ( not ( = ?auto_646996 ?auto_647009 ) ) ( not ( = ?auto_646996 ?auto_647010 ) ) ( not ( = ?auto_646997 ?auto_646998 ) ) ( not ( = ?auto_646997 ?auto_646999 ) ) ( not ( = ?auto_646997 ?auto_647000 ) ) ( not ( = ?auto_646997 ?auto_647001 ) ) ( not ( = ?auto_646997 ?auto_647002 ) ) ( not ( = ?auto_646997 ?auto_647003 ) ) ( not ( = ?auto_646997 ?auto_647004 ) ) ( not ( = ?auto_646997 ?auto_647005 ) ) ( not ( = ?auto_646997 ?auto_647006 ) ) ( not ( = ?auto_646997 ?auto_647007 ) ) ( not ( = ?auto_646997 ?auto_647008 ) ) ( not ( = ?auto_646997 ?auto_647009 ) ) ( not ( = ?auto_646997 ?auto_647010 ) ) ( not ( = ?auto_646998 ?auto_646999 ) ) ( not ( = ?auto_646998 ?auto_647000 ) ) ( not ( = ?auto_646998 ?auto_647001 ) ) ( not ( = ?auto_646998 ?auto_647002 ) ) ( not ( = ?auto_646998 ?auto_647003 ) ) ( not ( = ?auto_646998 ?auto_647004 ) ) ( not ( = ?auto_646998 ?auto_647005 ) ) ( not ( = ?auto_646998 ?auto_647006 ) ) ( not ( = ?auto_646998 ?auto_647007 ) ) ( not ( = ?auto_646998 ?auto_647008 ) ) ( not ( = ?auto_646998 ?auto_647009 ) ) ( not ( = ?auto_646998 ?auto_647010 ) ) ( not ( = ?auto_646999 ?auto_647000 ) ) ( not ( = ?auto_646999 ?auto_647001 ) ) ( not ( = ?auto_646999 ?auto_647002 ) ) ( not ( = ?auto_646999 ?auto_647003 ) ) ( not ( = ?auto_646999 ?auto_647004 ) ) ( not ( = ?auto_646999 ?auto_647005 ) ) ( not ( = ?auto_646999 ?auto_647006 ) ) ( not ( = ?auto_646999 ?auto_647007 ) ) ( not ( = ?auto_646999 ?auto_647008 ) ) ( not ( = ?auto_646999 ?auto_647009 ) ) ( not ( = ?auto_646999 ?auto_647010 ) ) ( not ( = ?auto_647000 ?auto_647001 ) ) ( not ( = ?auto_647000 ?auto_647002 ) ) ( not ( = ?auto_647000 ?auto_647003 ) ) ( not ( = ?auto_647000 ?auto_647004 ) ) ( not ( = ?auto_647000 ?auto_647005 ) ) ( not ( = ?auto_647000 ?auto_647006 ) ) ( not ( = ?auto_647000 ?auto_647007 ) ) ( not ( = ?auto_647000 ?auto_647008 ) ) ( not ( = ?auto_647000 ?auto_647009 ) ) ( not ( = ?auto_647000 ?auto_647010 ) ) ( not ( = ?auto_647001 ?auto_647002 ) ) ( not ( = ?auto_647001 ?auto_647003 ) ) ( not ( = ?auto_647001 ?auto_647004 ) ) ( not ( = ?auto_647001 ?auto_647005 ) ) ( not ( = ?auto_647001 ?auto_647006 ) ) ( not ( = ?auto_647001 ?auto_647007 ) ) ( not ( = ?auto_647001 ?auto_647008 ) ) ( not ( = ?auto_647001 ?auto_647009 ) ) ( not ( = ?auto_647001 ?auto_647010 ) ) ( not ( = ?auto_647002 ?auto_647003 ) ) ( not ( = ?auto_647002 ?auto_647004 ) ) ( not ( = ?auto_647002 ?auto_647005 ) ) ( not ( = ?auto_647002 ?auto_647006 ) ) ( not ( = ?auto_647002 ?auto_647007 ) ) ( not ( = ?auto_647002 ?auto_647008 ) ) ( not ( = ?auto_647002 ?auto_647009 ) ) ( not ( = ?auto_647002 ?auto_647010 ) ) ( not ( = ?auto_647003 ?auto_647004 ) ) ( not ( = ?auto_647003 ?auto_647005 ) ) ( not ( = ?auto_647003 ?auto_647006 ) ) ( not ( = ?auto_647003 ?auto_647007 ) ) ( not ( = ?auto_647003 ?auto_647008 ) ) ( not ( = ?auto_647003 ?auto_647009 ) ) ( not ( = ?auto_647003 ?auto_647010 ) ) ( not ( = ?auto_647004 ?auto_647005 ) ) ( not ( = ?auto_647004 ?auto_647006 ) ) ( not ( = ?auto_647004 ?auto_647007 ) ) ( not ( = ?auto_647004 ?auto_647008 ) ) ( not ( = ?auto_647004 ?auto_647009 ) ) ( not ( = ?auto_647004 ?auto_647010 ) ) ( not ( = ?auto_647005 ?auto_647006 ) ) ( not ( = ?auto_647005 ?auto_647007 ) ) ( not ( = ?auto_647005 ?auto_647008 ) ) ( not ( = ?auto_647005 ?auto_647009 ) ) ( not ( = ?auto_647005 ?auto_647010 ) ) ( not ( = ?auto_647006 ?auto_647007 ) ) ( not ( = ?auto_647006 ?auto_647008 ) ) ( not ( = ?auto_647006 ?auto_647009 ) ) ( not ( = ?auto_647006 ?auto_647010 ) ) ( not ( = ?auto_647007 ?auto_647008 ) ) ( not ( = ?auto_647007 ?auto_647009 ) ) ( not ( = ?auto_647007 ?auto_647010 ) ) ( not ( = ?auto_647008 ?auto_647009 ) ) ( not ( = ?auto_647008 ?auto_647010 ) ) ( not ( = ?auto_647009 ?auto_647010 ) ) ( CLEAR ?auto_647007 ) ( ON ?auto_647008 ?auto_647009 ) ( CLEAR ?auto_647008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_646995 ?auto_646996 ?auto_646997 ?auto_646998 ?auto_646999 ?auto_647000 ?auto_647001 ?auto_647002 ?auto_647003 ?auto_647004 ?auto_647005 ?auto_647006 ?auto_647007 ?auto_647008 )
      ( MAKE-15PILE ?auto_646995 ?auto_646996 ?auto_646997 ?auto_646998 ?auto_646999 ?auto_647000 ?auto_647001 ?auto_647002 ?auto_647003 ?auto_647004 ?auto_647005 ?auto_647006 ?auto_647007 ?auto_647008 ?auto_647009 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647057 - BLOCK
      ?auto_647058 - BLOCK
      ?auto_647059 - BLOCK
      ?auto_647060 - BLOCK
      ?auto_647061 - BLOCK
      ?auto_647062 - BLOCK
      ?auto_647063 - BLOCK
      ?auto_647064 - BLOCK
      ?auto_647065 - BLOCK
      ?auto_647066 - BLOCK
      ?auto_647067 - BLOCK
      ?auto_647068 - BLOCK
      ?auto_647069 - BLOCK
      ?auto_647070 - BLOCK
      ?auto_647071 - BLOCK
    )
    :vars
    (
      ?auto_647072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647071 ?auto_647072 ) ( ON-TABLE ?auto_647057 ) ( ON ?auto_647058 ?auto_647057 ) ( ON ?auto_647059 ?auto_647058 ) ( ON ?auto_647060 ?auto_647059 ) ( ON ?auto_647061 ?auto_647060 ) ( ON ?auto_647062 ?auto_647061 ) ( ON ?auto_647063 ?auto_647062 ) ( ON ?auto_647064 ?auto_647063 ) ( ON ?auto_647065 ?auto_647064 ) ( ON ?auto_647066 ?auto_647065 ) ( ON ?auto_647067 ?auto_647066 ) ( ON ?auto_647068 ?auto_647067 ) ( not ( = ?auto_647057 ?auto_647058 ) ) ( not ( = ?auto_647057 ?auto_647059 ) ) ( not ( = ?auto_647057 ?auto_647060 ) ) ( not ( = ?auto_647057 ?auto_647061 ) ) ( not ( = ?auto_647057 ?auto_647062 ) ) ( not ( = ?auto_647057 ?auto_647063 ) ) ( not ( = ?auto_647057 ?auto_647064 ) ) ( not ( = ?auto_647057 ?auto_647065 ) ) ( not ( = ?auto_647057 ?auto_647066 ) ) ( not ( = ?auto_647057 ?auto_647067 ) ) ( not ( = ?auto_647057 ?auto_647068 ) ) ( not ( = ?auto_647057 ?auto_647069 ) ) ( not ( = ?auto_647057 ?auto_647070 ) ) ( not ( = ?auto_647057 ?auto_647071 ) ) ( not ( = ?auto_647057 ?auto_647072 ) ) ( not ( = ?auto_647058 ?auto_647059 ) ) ( not ( = ?auto_647058 ?auto_647060 ) ) ( not ( = ?auto_647058 ?auto_647061 ) ) ( not ( = ?auto_647058 ?auto_647062 ) ) ( not ( = ?auto_647058 ?auto_647063 ) ) ( not ( = ?auto_647058 ?auto_647064 ) ) ( not ( = ?auto_647058 ?auto_647065 ) ) ( not ( = ?auto_647058 ?auto_647066 ) ) ( not ( = ?auto_647058 ?auto_647067 ) ) ( not ( = ?auto_647058 ?auto_647068 ) ) ( not ( = ?auto_647058 ?auto_647069 ) ) ( not ( = ?auto_647058 ?auto_647070 ) ) ( not ( = ?auto_647058 ?auto_647071 ) ) ( not ( = ?auto_647058 ?auto_647072 ) ) ( not ( = ?auto_647059 ?auto_647060 ) ) ( not ( = ?auto_647059 ?auto_647061 ) ) ( not ( = ?auto_647059 ?auto_647062 ) ) ( not ( = ?auto_647059 ?auto_647063 ) ) ( not ( = ?auto_647059 ?auto_647064 ) ) ( not ( = ?auto_647059 ?auto_647065 ) ) ( not ( = ?auto_647059 ?auto_647066 ) ) ( not ( = ?auto_647059 ?auto_647067 ) ) ( not ( = ?auto_647059 ?auto_647068 ) ) ( not ( = ?auto_647059 ?auto_647069 ) ) ( not ( = ?auto_647059 ?auto_647070 ) ) ( not ( = ?auto_647059 ?auto_647071 ) ) ( not ( = ?auto_647059 ?auto_647072 ) ) ( not ( = ?auto_647060 ?auto_647061 ) ) ( not ( = ?auto_647060 ?auto_647062 ) ) ( not ( = ?auto_647060 ?auto_647063 ) ) ( not ( = ?auto_647060 ?auto_647064 ) ) ( not ( = ?auto_647060 ?auto_647065 ) ) ( not ( = ?auto_647060 ?auto_647066 ) ) ( not ( = ?auto_647060 ?auto_647067 ) ) ( not ( = ?auto_647060 ?auto_647068 ) ) ( not ( = ?auto_647060 ?auto_647069 ) ) ( not ( = ?auto_647060 ?auto_647070 ) ) ( not ( = ?auto_647060 ?auto_647071 ) ) ( not ( = ?auto_647060 ?auto_647072 ) ) ( not ( = ?auto_647061 ?auto_647062 ) ) ( not ( = ?auto_647061 ?auto_647063 ) ) ( not ( = ?auto_647061 ?auto_647064 ) ) ( not ( = ?auto_647061 ?auto_647065 ) ) ( not ( = ?auto_647061 ?auto_647066 ) ) ( not ( = ?auto_647061 ?auto_647067 ) ) ( not ( = ?auto_647061 ?auto_647068 ) ) ( not ( = ?auto_647061 ?auto_647069 ) ) ( not ( = ?auto_647061 ?auto_647070 ) ) ( not ( = ?auto_647061 ?auto_647071 ) ) ( not ( = ?auto_647061 ?auto_647072 ) ) ( not ( = ?auto_647062 ?auto_647063 ) ) ( not ( = ?auto_647062 ?auto_647064 ) ) ( not ( = ?auto_647062 ?auto_647065 ) ) ( not ( = ?auto_647062 ?auto_647066 ) ) ( not ( = ?auto_647062 ?auto_647067 ) ) ( not ( = ?auto_647062 ?auto_647068 ) ) ( not ( = ?auto_647062 ?auto_647069 ) ) ( not ( = ?auto_647062 ?auto_647070 ) ) ( not ( = ?auto_647062 ?auto_647071 ) ) ( not ( = ?auto_647062 ?auto_647072 ) ) ( not ( = ?auto_647063 ?auto_647064 ) ) ( not ( = ?auto_647063 ?auto_647065 ) ) ( not ( = ?auto_647063 ?auto_647066 ) ) ( not ( = ?auto_647063 ?auto_647067 ) ) ( not ( = ?auto_647063 ?auto_647068 ) ) ( not ( = ?auto_647063 ?auto_647069 ) ) ( not ( = ?auto_647063 ?auto_647070 ) ) ( not ( = ?auto_647063 ?auto_647071 ) ) ( not ( = ?auto_647063 ?auto_647072 ) ) ( not ( = ?auto_647064 ?auto_647065 ) ) ( not ( = ?auto_647064 ?auto_647066 ) ) ( not ( = ?auto_647064 ?auto_647067 ) ) ( not ( = ?auto_647064 ?auto_647068 ) ) ( not ( = ?auto_647064 ?auto_647069 ) ) ( not ( = ?auto_647064 ?auto_647070 ) ) ( not ( = ?auto_647064 ?auto_647071 ) ) ( not ( = ?auto_647064 ?auto_647072 ) ) ( not ( = ?auto_647065 ?auto_647066 ) ) ( not ( = ?auto_647065 ?auto_647067 ) ) ( not ( = ?auto_647065 ?auto_647068 ) ) ( not ( = ?auto_647065 ?auto_647069 ) ) ( not ( = ?auto_647065 ?auto_647070 ) ) ( not ( = ?auto_647065 ?auto_647071 ) ) ( not ( = ?auto_647065 ?auto_647072 ) ) ( not ( = ?auto_647066 ?auto_647067 ) ) ( not ( = ?auto_647066 ?auto_647068 ) ) ( not ( = ?auto_647066 ?auto_647069 ) ) ( not ( = ?auto_647066 ?auto_647070 ) ) ( not ( = ?auto_647066 ?auto_647071 ) ) ( not ( = ?auto_647066 ?auto_647072 ) ) ( not ( = ?auto_647067 ?auto_647068 ) ) ( not ( = ?auto_647067 ?auto_647069 ) ) ( not ( = ?auto_647067 ?auto_647070 ) ) ( not ( = ?auto_647067 ?auto_647071 ) ) ( not ( = ?auto_647067 ?auto_647072 ) ) ( not ( = ?auto_647068 ?auto_647069 ) ) ( not ( = ?auto_647068 ?auto_647070 ) ) ( not ( = ?auto_647068 ?auto_647071 ) ) ( not ( = ?auto_647068 ?auto_647072 ) ) ( not ( = ?auto_647069 ?auto_647070 ) ) ( not ( = ?auto_647069 ?auto_647071 ) ) ( not ( = ?auto_647069 ?auto_647072 ) ) ( not ( = ?auto_647070 ?auto_647071 ) ) ( not ( = ?auto_647070 ?auto_647072 ) ) ( not ( = ?auto_647071 ?auto_647072 ) ) ( ON ?auto_647070 ?auto_647071 ) ( CLEAR ?auto_647068 ) ( ON ?auto_647069 ?auto_647070 ) ( CLEAR ?auto_647069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_647057 ?auto_647058 ?auto_647059 ?auto_647060 ?auto_647061 ?auto_647062 ?auto_647063 ?auto_647064 ?auto_647065 ?auto_647066 ?auto_647067 ?auto_647068 ?auto_647069 )
      ( MAKE-15PILE ?auto_647057 ?auto_647058 ?auto_647059 ?auto_647060 ?auto_647061 ?auto_647062 ?auto_647063 ?auto_647064 ?auto_647065 ?auto_647066 ?auto_647067 ?auto_647068 ?auto_647069 ?auto_647070 ?auto_647071 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647119 - BLOCK
      ?auto_647120 - BLOCK
      ?auto_647121 - BLOCK
      ?auto_647122 - BLOCK
      ?auto_647123 - BLOCK
      ?auto_647124 - BLOCK
      ?auto_647125 - BLOCK
      ?auto_647126 - BLOCK
      ?auto_647127 - BLOCK
      ?auto_647128 - BLOCK
      ?auto_647129 - BLOCK
      ?auto_647130 - BLOCK
      ?auto_647131 - BLOCK
      ?auto_647132 - BLOCK
      ?auto_647133 - BLOCK
    )
    :vars
    (
      ?auto_647134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647133 ?auto_647134 ) ( ON-TABLE ?auto_647119 ) ( ON ?auto_647120 ?auto_647119 ) ( ON ?auto_647121 ?auto_647120 ) ( ON ?auto_647122 ?auto_647121 ) ( ON ?auto_647123 ?auto_647122 ) ( ON ?auto_647124 ?auto_647123 ) ( ON ?auto_647125 ?auto_647124 ) ( ON ?auto_647126 ?auto_647125 ) ( ON ?auto_647127 ?auto_647126 ) ( ON ?auto_647128 ?auto_647127 ) ( ON ?auto_647129 ?auto_647128 ) ( not ( = ?auto_647119 ?auto_647120 ) ) ( not ( = ?auto_647119 ?auto_647121 ) ) ( not ( = ?auto_647119 ?auto_647122 ) ) ( not ( = ?auto_647119 ?auto_647123 ) ) ( not ( = ?auto_647119 ?auto_647124 ) ) ( not ( = ?auto_647119 ?auto_647125 ) ) ( not ( = ?auto_647119 ?auto_647126 ) ) ( not ( = ?auto_647119 ?auto_647127 ) ) ( not ( = ?auto_647119 ?auto_647128 ) ) ( not ( = ?auto_647119 ?auto_647129 ) ) ( not ( = ?auto_647119 ?auto_647130 ) ) ( not ( = ?auto_647119 ?auto_647131 ) ) ( not ( = ?auto_647119 ?auto_647132 ) ) ( not ( = ?auto_647119 ?auto_647133 ) ) ( not ( = ?auto_647119 ?auto_647134 ) ) ( not ( = ?auto_647120 ?auto_647121 ) ) ( not ( = ?auto_647120 ?auto_647122 ) ) ( not ( = ?auto_647120 ?auto_647123 ) ) ( not ( = ?auto_647120 ?auto_647124 ) ) ( not ( = ?auto_647120 ?auto_647125 ) ) ( not ( = ?auto_647120 ?auto_647126 ) ) ( not ( = ?auto_647120 ?auto_647127 ) ) ( not ( = ?auto_647120 ?auto_647128 ) ) ( not ( = ?auto_647120 ?auto_647129 ) ) ( not ( = ?auto_647120 ?auto_647130 ) ) ( not ( = ?auto_647120 ?auto_647131 ) ) ( not ( = ?auto_647120 ?auto_647132 ) ) ( not ( = ?auto_647120 ?auto_647133 ) ) ( not ( = ?auto_647120 ?auto_647134 ) ) ( not ( = ?auto_647121 ?auto_647122 ) ) ( not ( = ?auto_647121 ?auto_647123 ) ) ( not ( = ?auto_647121 ?auto_647124 ) ) ( not ( = ?auto_647121 ?auto_647125 ) ) ( not ( = ?auto_647121 ?auto_647126 ) ) ( not ( = ?auto_647121 ?auto_647127 ) ) ( not ( = ?auto_647121 ?auto_647128 ) ) ( not ( = ?auto_647121 ?auto_647129 ) ) ( not ( = ?auto_647121 ?auto_647130 ) ) ( not ( = ?auto_647121 ?auto_647131 ) ) ( not ( = ?auto_647121 ?auto_647132 ) ) ( not ( = ?auto_647121 ?auto_647133 ) ) ( not ( = ?auto_647121 ?auto_647134 ) ) ( not ( = ?auto_647122 ?auto_647123 ) ) ( not ( = ?auto_647122 ?auto_647124 ) ) ( not ( = ?auto_647122 ?auto_647125 ) ) ( not ( = ?auto_647122 ?auto_647126 ) ) ( not ( = ?auto_647122 ?auto_647127 ) ) ( not ( = ?auto_647122 ?auto_647128 ) ) ( not ( = ?auto_647122 ?auto_647129 ) ) ( not ( = ?auto_647122 ?auto_647130 ) ) ( not ( = ?auto_647122 ?auto_647131 ) ) ( not ( = ?auto_647122 ?auto_647132 ) ) ( not ( = ?auto_647122 ?auto_647133 ) ) ( not ( = ?auto_647122 ?auto_647134 ) ) ( not ( = ?auto_647123 ?auto_647124 ) ) ( not ( = ?auto_647123 ?auto_647125 ) ) ( not ( = ?auto_647123 ?auto_647126 ) ) ( not ( = ?auto_647123 ?auto_647127 ) ) ( not ( = ?auto_647123 ?auto_647128 ) ) ( not ( = ?auto_647123 ?auto_647129 ) ) ( not ( = ?auto_647123 ?auto_647130 ) ) ( not ( = ?auto_647123 ?auto_647131 ) ) ( not ( = ?auto_647123 ?auto_647132 ) ) ( not ( = ?auto_647123 ?auto_647133 ) ) ( not ( = ?auto_647123 ?auto_647134 ) ) ( not ( = ?auto_647124 ?auto_647125 ) ) ( not ( = ?auto_647124 ?auto_647126 ) ) ( not ( = ?auto_647124 ?auto_647127 ) ) ( not ( = ?auto_647124 ?auto_647128 ) ) ( not ( = ?auto_647124 ?auto_647129 ) ) ( not ( = ?auto_647124 ?auto_647130 ) ) ( not ( = ?auto_647124 ?auto_647131 ) ) ( not ( = ?auto_647124 ?auto_647132 ) ) ( not ( = ?auto_647124 ?auto_647133 ) ) ( not ( = ?auto_647124 ?auto_647134 ) ) ( not ( = ?auto_647125 ?auto_647126 ) ) ( not ( = ?auto_647125 ?auto_647127 ) ) ( not ( = ?auto_647125 ?auto_647128 ) ) ( not ( = ?auto_647125 ?auto_647129 ) ) ( not ( = ?auto_647125 ?auto_647130 ) ) ( not ( = ?auto_647125 ?auto_647131 ) ) ( not ( = ?auto_647125 ?auto_647132 ) ) ( not ( = ?auto_647125 ?auto_647133 ) ) ( not ( = ?auto_647125 ?auto_647134 ) ) ( not ( = ?auto_647126 ?auto_647127 ) ) ( not ( = ?auto_647126 ?auto_647128 ) ) ( not ( = ?auto_647126 ?auto_647129 ) ) ( not ( = ?auto_647126 ?auto_647130 ) ) ( not ( = ?auto_647126 ?auto_647131 ) ) ( not ( = ?auto_647126 ?auto_647132 ) ) ( not ( = ?auto_647126 ?auto_647133 ) ) ( not ( = ?auto_647126 ?auto_647134 ) ) ( not ( = ?auto_647127 ?auto_647128 ) ) ( not ( = ?auto_647127 ?auto_647129 ) ) ( not ( = ?auto_647127 ?auto_647130 ) ) ( not ( = ?auto_647127 ?auto_647131 ) ) ( not ( = ?auto_647127 ?auto_647132 ) ) ( not ( = ?auto_647127 ?auto_647133 ) ) ( not ( = ?auto_647127 ?auto_647134 ) ) ( not ( = ?auto_647128 ?auto_647129 ) ) ( not ( = ?auto_647128 ?auto_647130 ) ) ( not ( = ?auto_647128 ?auto_647131 ) ) ( not ( = ?auto_647128 ?auto_647132 ) ) ( not ( = ?auto_647128 ?auto_647133 ) ) ( not ( = ?auto_647128 ?auto_647134 ) ) ( not ( = ?auto_647129 ?auto_647130 ) ) ( not ( = ?auto_647129 ?auto_647131 ) ) ( not ( = ?auto_647129 ?auto_647132 ) ) ( not ( = ?auto_647129 ?auto_647133 ) ) ( not ( = ?auto_647129 ?auto_647134 ) ) ( not ( = ?auto_647130 ?auto_647131 ) ) ( not ( = ?auto_647130 ?auto_647132 ) ) ( not ( = ?auto_647130 ?auto_647133 ) ) ( not ( = ?auto_647130 ?auto_647134 ) ) ( not ( = ?auto_647131 ?auto_647132 ) ) ( not ( = ?auto_647131 ?auto_647133 ) ) ( not ( = ?auto_647131 ?auto_647134 ) ) ( not ( = ?auto_647132 ?auto_647133 ) ) ( not ( = ?auto_647132 ?auto_647134 ) ) ( not ( = ?auto_647133 ?auto_647134 ) ) ( ON ?auto_647132 ?auto_647133 ) ( ON ?auto_647131 ?auto_647132 ) ( CLEAR ?auto_647129 ) ( ON ?auto_647130 ?auto_647131 ) ( CLEAR ?auto_647130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_647119 ?auto_647120 ?auto_647121 ?auto_647122 ?auto_647123 ?auto_647124 ?auto_647125 ?auto_647126 ?auto_647127 ?auto_647128 ?auto_647129 ?auto_647130 )
      ( MAKE-15PILE ?auto_647119 ?auto_647120 ?auto_647121 ?auto_647122 ?auto_647123 ?auto_647124 ?auto_647125 ?auto_647126 ?auto_647127 ?auto_647128 ?auto_647129 ?auto_647130 ?auto_647131 ?auto_647132 ?auto_647133 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647181 - BLOCK
      ?auto_647182 - BLOCK
      ?auto_647183 - BLOCK
      ?auto_647184 - BLOCK
      ?auto_647185 - BLOCK
      ?auto_647186 - BLOCK
      ?auto_647187 - BLOCK
      ?auto_647188 - BLOCK
      ?auto_647189 - BLOCK
      ?auto_647190 - BLOCK
      ?auto_647191 - BLOCK
      ?auto_647192 - BLOCK
      ?auto_647193 - BLOCK
      ?auto_647194 - BLOCK
      ?auto_647195 - BLOCK
    )
    :vars
    (
      ?auto_647196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647195 ?auto_647196 ) ( ON-TABLE ?auto_647181 ) ( ON ?auto_647182 ?auto_647181 ) ( ON ?auto_647183 ?auto_647182 ) ( ON ?auto_647184 ?auto_647183 ) ( ON ?auto_647185 ?auto_647184 ) ( ON ?auto_647186 ?auto_647185 ) ( ON ?auto_647187 ?auto_647186 ) ( ON ?auto_647188 ?auto_647187 ) ( ON ?auto_647189 ?auto_647188 ) ( ON ?auto_647190 ?auto_647189 ) ( not ( = ?auto_647181 ?auto_647182 ) ) ( not ( = ?auto_647181 ?auto_647183 ) ) ( not ( = ?auto_647181 ?auto_647184 ) ) ( not ( = ?auto_647181 ?auto_647185 ) ) ( not ( = ?auto_647181 ?auto_647186 ) ) ( not ( = ?auto_647181 ?auto_647187 ) ) ( not ( = ?auto_647181 ?auto_647188 ) ) ( not ( = ?auto_647181 ?auto_647189 ) ) ( not ( = ?auto_647181 ?auto_647190 ) ) ( not ( = ?auto_647181 ?auto_647191 ) ) ( not ( = ?auto_647181 ?auto_647192 ) ) ( not ( = ?auto_647181 ?auto_647193 ) ) ( not ( = ?auto_647181 ?auto_647194 ) ) ( not ( = ?auto_647181 ?auto_647195 ) ) ( not ( = ?auto_647181 ?auto_647196 ) ) ( not ( = ?auto_647182 ?auto_647183 ) ) ( not ( = ?auto_647182 ?auto_647184 ) ) ( not ( = ?auto_647182 ?auto_647185 ) ) ( not ( = ?auto_647182 ?auto_647186 ) ) ( not ( = ?auto_647182 ?auto_647187 ) ) ( not ( = ?auto_647182 ?auto_647188 ) ) ( not ( = ?auto_647182 ?auto_647189 ) ) ( not ( = ?auto_647182 ?auto_647190 ) ) ( not ( = ?auto_647182 ?auto_647191 ) ) ( not ( = ?auto_647182 ?auto_647192 ) ) ( not ( = ?auto_647182 ?auto_647193 ) ) ( not ( = ?auto_647182 ?auto_647194 ) ) ( not ( = ?auto_647182 ?auto_647195 ) ) ( not ( = ?auto_647182 ?auto_647196 ) ) ( not ( = ?auto_647183 ?auto_647184 ) ) ( not ( = ?auto_647183 ?auto_647185 ) ) ( not ( = ?auto_647183 ?auto_647186 ) ) ( not ( = ?auto_647183 ?auto_647187 ) ) ( not ( = ?auto_647183 ?auto_647188 ) ) ( not ( = ?auto_647183 ?auto_647189 ) ) ( not ( = ?auto_647183 ?auto_647190 ) ) ( not ( = ?auto_647183 ?auto_647191 ) ) ( not ( = ?auto_647183 ?auto_647192 ) ) ( not ( = ?auto_647183 ?auto_647193 ) ) ( not ( = ?auto_647183 ?auto_647194 ) ) ( not ( = ?auto_647183 ?auto_647195 ) ) ( not ( = ?auto_647183 ?auto_647196 ) ) ( not ( = ?auto_647184 ?auto_647185 ) ) ( not ( = ?auto_647184 ?auto_647186 ) ) ( not ( = ?auto_647184 ?auto_647187 ) ) ( not ( = ?auto_647184 ?auto_647188 ) ) ( not ( = ?auto_647184 ?auto_647189 ) ) ( not ( = ?auto_647184 ?auto_647190 ) ) ( not ( = ?auto_647184 ?auto_647191 ) ) ( not ( = ?auto_647184 ?auto_647192 ) ) ( not ( = ?auto_647184 ?auto_647193 ) ) ( not ( = ?auto_647184 ?auto_647194 ) ) ( not ( = ?auto_647184 ?auto_647195 ) ) ( not ( = ?auto_647184 ?auto_647196 ) ) ( not ( = ?auto_647185 ?auto_647186 ) ) ( not ( = ?auto_647185 ?auto_647187 ) ) ( not ( = ?auto_647185 ?auto_647188 ) ) ( not ( = ?auto_647185 ?auto_647189 ) ) ( not ( = ?auto_647185 ?auto_647190 ) ) ( not ( = ?auto_647185 ?auto_647191 ) ) ( not ( = ?auto_647185 ?auto_647192 ) ) ( not ( = ?auto_647185 ?auto_647193 ) ) ( not ( = ?auto_647185 ?auto_647194 ) ) ( not ( = ?auto_647185 ?auto_647195 ) ) ( not ( = ?auto_647185 ?auto_647196 ) ) ( not ( = ?auto_647186 ?auto_647187 ) ) ( not ( = ?auto_647186 ?auto_647188 ) ) ( not ( = ?auto_647186 ?auto_647189 ) ) ( not ( = ?auto_647186 ?auto_647190 ) ) ( not ( = ?auto_647186 ?auto_647191 ) ) ( not ( = ?auto_647186 ?auto_647192 ) ) ( not ( = ?auto_647186 ?auto_647193 ) ) ( not ( = ?auto_647186 ?auto_647194 ) ) ( not ( = ?auto_647186 ?auto_647195 ) ) ( not ( = ?auto_647186 ?auto_647196 ) ) ( not ( = ?auto_647187 ?auto_647188 ) ) ( not ( = ?auto_647187 ?auto_647189 ) ) ( not ( = ?auto_647187 ?auto_647190 ) ) ( not ( = ?auto_647187 ?auto_647191 ) ) ( not ( = ?auto_647187 ?auto_647192 ) ) ( not ( = ?auto_647187 ?auto_647193 ) ) ( not ( = ?auto_647187 ?auto_647194 ) ) ( not ( = ?auto_647187 ?auto_647195 ) ) ( not ( = ?auto_647187 ?auto_647196 ) ) ( not ( = ?auto_647188 ?auto_647189 ) ) ( not ( = ?auto_647188 ?auto_647190 ) ) ( not ( = ?auto_647188 ?auto_647191 ) ) ( not ( = ?auto_647188 ?auto_647192 ) ) ( not ( = ?auto_647188 ?auto_647193 ) ) ( not ( = ?auto_647188 ?auto_647194 ) ) ( not ( = ?auto_647188 ?auto_647195 ) ) ( not ( = ?auto_647188 ?auto_647196 ) ) ( not ( = ?auto_647189 ?auto_647190 ) ) ( not ( = ?auto_647189 ?auto_647191 ) ) ( not ( = ?auto_647189 ?auto_647192 ) ) ( not ( = ?auto_647189 ?auto_647193 ) ) ( not ( = ?auto_647189 ?auto_647194 ) ) ( not ( = ?auto_647189 ?auto_647195 ) ) ( not ( = ?auto_647189 ?auto_647196 ) ) ( not ( = ?auto_647190 ?auto_647191 ) ) ( not ( = ?auto_647190 ?auto_647192 ) ) ( not ( = ?auto_647190 ?auto_647193 ) ) ( not ( = ?auto_647190 ?auto_647194 ) ) ( not ( = ?auto_647190 ?auto_647195 ) ) ( not ( = ?auto_647190 ?auto_647196 ) ) ( not ( = ?auto_647191 ?auto_647192 ) ) ( not ( = ?auto_647191 ?auto_647193 ) ) ( not ( = ?auto_647191 ?auto_647194 ) ) ( not ( = ?auto_647191 ?auto_647195 ) ) ( not ( = ?auto_647191 ?auto_647196 ) ) ( not ( = ?auto_647192 ?auto_647193 ) ) ( not ( = ?auto_647192 ?auto_647194 ) ) ( not ( = ?auto_647192 ?auto_647195 ) ) ( not ( = ?auto_647192 ?auto_647196 ) ) ( not ( = ?auto_647193 ?auto_647194 ) ) ( not ( = ?auto_647193 ?auto_647195 ) ) ( not ( = ?auto_647193 ?auto_647196 ) ) ( not ( = ?auto_647194 ?auto_647195 ) ) ( not ( = ?auto_647194 ?auto_647196 ) ) ( not ( = ?auto_647195 ?auto_647196 ) ) ( ON ?auto_647194 ?auto_647195 ) ( ON ?auto_647193 ?auto_647194 ) ( ON ?auto_647192 ?auto_647193 ) ( CLEAR ?auto_647190 ) ( ON ?auto_647191 ?auto_647192 ) ( CLEAR ?auto_647191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_647181 ?auto_647182 ?auto_647183 ?auto_647184 ?auto_647185 ?auto_647186 ?auto_647187 ?auto_647188 ?auto_647189 ?auto_647190 ?auto_647191 )
      ( MAKE-15PILE ?auto_647181 ?auto_647182 ?auto_647183 ?auto_647184 ?auto_647185 ?auto_647186 ?auto_647187 ?auto_647188 ?auto_647189 ?auto_647190 ?auto_647191 ?auto_647192 ?auto_647193 ?auto_647194 ?auto_647195 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647243 - BLOCK
      ?auto_647244 - BLOCK
      ?auto_647245 - BLOCK
      ?auto_647246 - BLOCK
      ?auto_647247 - BLOCK
      ?auto_647248 - BLOCK
      ?auto_647249 - BLOCK
      ?auto_647250 - BLOCK
      ?auto_647251 - BLOCK
      ?auto_647252 - BLOCK
      ?auto_647253 - BLOCK
      ?auto_647254 - BLOCK
      ?auto_647255 - BLOCK
      ?auto_647256 - BLOCK
      ?auto_647257 - BLOCK
    )
    :vars
    (
      ?auto_647258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647257 ?auto_647258 ) ( ON-TABLE ?auto_647243 ) ( ON ?auto_647244 ?auto_647243 ) ( ON ?auto_647245 ?auto_647244 ) ( ON ?auto_647246 ?auto_647245 ) ( ON ?auto_647247 ?auto_647246 ) ( ON ?auto_647248 ?auto_647247 ) ( ON ?auto_647249 ?auto_647248 ) ( ON ?auto_647250 ?auto_647249 ) ( ON ?auto_647251 ?auto_647250 ) ( not ( = ?auto_647243 ?auto_647244 ) ) ( not ( = ?auto_647243 ?auto_647245 ) ) ( not ( = ?auto_647243 ?auto_647246 ) ) ( not ( = ?auto_647243 ?auto_647247 ) ) ( not ( = ?auto_647243 ?auto_647248 ) ) ( not ( = ?auto_647243 ?auto_647249 ) ) ( not ( = ?auto_647243 ?auto_647250 ) ) ( not ( = ?auto_647243 ?auto_647251 ) ) ( not ( = ?auto_647243 ?auto_647252 ) ) ( not ( = ?auto_647243 ?auto_647253 ) ) ( not ( = ?auto_647243 ?auto_647254 ) ) ( not ( = ?auto_647243 ?auto_647255 ) ) ( not ( = ?auto_647243 ?auto_647256 ) ) ( not ( = ?auto_647243 ?auto_647257 ) ) ( not ( = ?auto_647243 ?auto_647258 ) ) ( not ( = ?auto_647244 ?auto_647245 ) ) ( not ( = ?auto_647244 ?auto_647246 ) ) ( not ( = ?auto_647244 ?auto_647247 ) ) ( not ( = ?auto_647244 ?auto_647248 ) ) ( not ( = ?auto_647244 ?auto_647249 ) ) ( not ( = ?auto_647244 ?auto_647250 ) ) ( not ( = ?auto_647244 ?auto_647251 ) ) ( not ( = ?auto_647244 ?auto_647252 ) ) ( not ( = ?auto_647244 ?auto_647253 ) ) ( not ( = ?auto_647244 ?auto_647254 ) ) ( not ( = ?auto_647244 ?auto_647255 ) ) ( not ( = ?auto_647244 ?auto_647256 ) ) ( not ( = ?auto_647244 ?auto_647257 ) ) ( not ( = ?auto_647244 ?auto_647258 ) ) ( not ( = ?auto_647245 ?auto_647246 ) ) ( not ( = ?auto_647245 ?auto_647247 ) ) ( not ( = ?auto_647245 ?auto_647248 ) ) ( not ( = ?auto_647245 ?auto_647249 ) ) ( not ( = ?auto_647245 ?auto_647250 ) ) ( not ( = ?auto_647245 ?auto_647251 ) ) ( not ( = ?auto_647245 ?auto_647252 ) ) ( not ( = ?auto_647245 ?auto_647253 ) ) ( not ( = ?auto_647245 ?auto_647254 ) ) ( not ( = ?auto_647245 ?auto_647255 ) ) ( not ( = ?auto_647245 ?auto_647256 ) ) ( not ( = ?auto_647245 ?auto_647257 ) ) ( not ( = ?auto_647245 ?auto_647258 ) ) ( not ( = ?auto_647246 ?auto_647247 ) ) ( not ( = ?auto_647246 ?auto_647248 ) ) ( not ( = ?auto_647246 ?auto_647249 ) ) ( not ( = ?auto_647246 ?auto_647250 ) ) ( not ( = ?auto_647246 ?auto_647251 ) ) ( not ( = ?auto_647246 ?auto_647252 ) ) ( not ( = ?auto_647246 ?auto_647253 ) ) ( not ( = ?auto_647246 ?auto_647254 ) ) ( not ( = ?auto_647246 ?auto_647255 ) ) ( not ( = ?auto_647246 ?auto_647256 ) ) ( not ( = ?auto_647246 ?auto_647257 ) ) ( not ( = ?auto_647246 ?auto_647258 ) ) ( not ( = ?auto_647247 ?auto_647248 ) ) ( not ( = ?auto_647247 ?auto_647249 ) ) ( not ( = ?auto_647247 ?auto_647250 ) ) ( not ( = ?auto_647247 ?auto_647251 ) ) ( not ( = ?auto_647247 ?auto_647252 ) ) ( not ( = ?auto_647247 ?auto_647253 ) ) ( not ( = ?auto_647247 ?auto_647254 ) ) ( not ( = ?auto_647247 ?auto_647255 ) ) ( not ( = ?auto_647247 ?auto_647256 ) ) ( not ( = ?auto_647247 ?auto_647257 ) ) ( not ( = ?auto_647247 ?auto_647258 ) ) ( not ( = ?auto_647248 ?auto_647249 ) ) ( not ( = ?auto_647248 ?auto_647250 ) ) ( not ( = ?auto_647248 ?auto_647251 ) ) ( not ( = ?auto_647248 ?auto_647252 ) ) ( not ( = ?auto_647248 ?auto_647253 ) ) ( not ( = ?auto_647248 ?auto_647254 ) ) ( not ( = ?auto_647248 ?auto_647255 ) ) ( not ( = ?auto_647248 ?auto_647256 ) ) ( not ( = ?auto_647248 ?auto_647257 ) ) ( not ( = ?auto_647248 ?auto_647258 ) ) ( not ( = ?auto_647249 ?auto_647250 ) ) ( not ( = ?auto_647249 ?auto_647251 ) ) ( not ( = ?auto_647249 ?auto_647252 ) ) ( not ( = ?auto_647249 ?auto_647253 ) ) ( not ( = ?auto_647249 ?auto_647254 ) ) ( not ( = ?auto_647249 ?auto_647255 ) ) ( not ( = ?auto_647249 ?auto_647256 ) ) ( not ( = ?auto_647249 ?auto_647257 ) ) ( not ( = ?auto_647249 ?auto_647258 ) ) ( not ( = ?auto_647250 ?auto_647251 ) ) ( not ( = ?auto_647250 ?auto_647252 ) ) ( not ( = ?auto_647250 ?auto_647253 ) ) ( not ( = ?auto_647250 ?auto_647254 ) ) ( not ( = ?auto_647250 ?auto_647255 ) ) ( not ( = ?auto_647250 ?auto_647256 ) ) ( not ( = ?auto_647250 ?auto_647257 ) ) ( not ( = ?auto_647250 ?auto_647258 ) ) ( not ( = ?auto_647251 ?auto_647252 ) ) ( not ( = ?auto_647251 ?auto_647253 ) ) ( not ( = ?auto_647251 ?auto_647254 ) ) ( not ( = ?auto_647251 ?auto_647255 ) ) ( not ( = ?auto_647251 ?auto_647256 ) ) ( not ( = ?auto_647251 ?auto_647257 ) ) ( not ( = ?auto_647251 ?auto_647258 ) ) ( not ( = ?auto_647252 ?auto_647253 ) ) ( not ( = ?auto_647252 ?auto_647254 ) ) ( not ( = ?auto_647252 ?auto_647255 ) ) ( not ( = ?auto_647252 ?auto_647256 ) ) ( not ( = ?auto_647252 ?auto_647257 ) ) ( not ( = ?auto_647252 ?auto_647258 ) ) ( not ( = ?auto_647253 ?auto_647254 ) ) ( not ( = ?auto_647253 ?auto_647255 ) ) ( not ( = ?auto_647253 ?auto_647256 ) ) ( not ( = ?auto_647253 ?auto_647257 ) ) ( not ( = ?auto_647253 ?auto_647258 ) ) ( not ( = ?auto_647254 ?auto_647255 ) ) ( not ( = ?auto_647254 ?auto_647256 ) ) ( not ( = ?auto_647254 ?auto_647257 ) ) ( not ( = ?auto_647254 ?auto_647258 ) ) ( not ( = ?auto_647255 ?auto_647256 ) ) ( not ( = ?auto_647255 ?auto_647257 ) ) ( not ( = ?auto_647255 ?auto_647258 ) ) ( not ( = ?auto_647256 ?auto_647257 ) ) ( not ( = ?auto_647256 ?auto_647258 ) ) ( not ( = ?auto_647257 ?auto_647258 ) ) ( ON ?auto_647256 ?auto_647257 ) ( ON ?auto_647255 ?auto_647256 ) ( ON ?auto_647254 ?auto_647255 ) ( ON ?auto_647253 ?auto_647254 ) ( CLEAR ?auto_647251 ) ( ON ?auto_647252 ?auto_647253 ) ( CLEAR ?auto_647252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_647243 ?auto_647244 ?auto_647245 ?auto_647246 ?auto_647247 ?auto_647248 ?auto_647249 ?auto_647250 ?auto_647251 ?auto_647252 )
      ( MAKE-15PILE ?auto_647243 ?auto_647244 ?auto_647245 ?auto_647246 ?auto_647247 ?auto_647248 ?auto_647249 ?auto_647250 ?auto_647251 ?auto_647252 ?auto_647253 ?auto_647254 ?auto_647255 ?auto_647256 ?auto_647257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647305 - BLOCK
      ?auto_647306 - BLOCK
      ?auto_647307 - BLOCK
      ?auto_647308 - BLOCK
      ?auto_647309 - BLOCK
      ?auto_647310 - BLOCK
      ?auto_647311 - BLOCK
      ?auto_647312 - BLOCK
      ?auto_647313 - BLOCK
      ?auto_647314 - BLOCK
      ?auto_647315 - BLOCK
      ?auto_647316 - BLOCK
      ?auto_647317 - BLOCK
      ?auto_647318 - BLOCK
      ?auto_647319 - BLOCK
    )
    :vars
    (
      ?auto_647320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647319 ?auto_647320 ) ( ON-TABLE ?auto_647305 ) ( ON ?auto_647306 ?auto_647305 ) ( ON ?auto_647307 ?auto_647306 ) ( ON ?auto_647308 ?auto_647307 ) ( ON ?auto_647309 ?auto_647308 ) ( ON ?auto_647310 ?auto_647309 ) ( ON ?auto_647311 ?auto_647310 ) ( ON ?auto_647312 ?auto_647311 ) ( not ( = ?auto_647305 ?auto_647306 ) ) ( not ( = ?auto_647305 ?auto_647307 ) ) ( not ( = ?auto_647305 ?auto_647308 ) ) ( not ( = ?auto_647305 ?auto_647309 ) ) ( not ( = ?auto_647305 ?auto_647310 ) ) ( not ( = ?auto_647305 ?auto_647311 ) ) ( not ( = ?auto_647305 ?auto_647312 ) ) ( not ( = ?auto_647305 ?auto_647313 ) ) ( not ( = ?auto_647305 ?auto_647314 ) ) ( not ( = ?auto_647305 ?auto_647315 ) ) ( not ( = ?auto_647305 ?auto_647316 ) ) ( not ( = ?auto_647305 ?auto_647317 ) ) ( not ( = ?auto_647305 ?auto_647318 ) ) ( not ( = ?auto_647305 ?auto_647319 ) ) ( not ( = ?auto_647305 ?auto_647320 ) ) ( not ( = ?auto_647306 ?auto_647307 ) ) ( not ( = ?auto_647306 ?auto_647308 ) ) ( not ( = ?auto_647306 ?auto_647309 ) ) ( not ( = ?auto_647306 ?auto_647310 ) ) ( not ( = ?auto_647306 ?auto_647311 ) ) ( not ( = ?auto_647306 ?auto_647312 ) ) ( not ( = ?auto_647306 ?auto_647313 ) ) ( not ( = ?auto_647306 ?auto_647314 ) ) ( not ( = ?auto_647306 ?auto_647315 ) ) ( not ( = ?auto_647306 ?auto_647316 ) ) ( not ( = ?auto_647306 ?auto_647317 ) ) ( not ( = ?auto_647306 ?auto_647318 ) ) ( not ( = ?auto_647306 ?auto_647319 ) ) ( not ( = ?auto_647306 ?auto_647320 ) ) ( not ( = ?auto_647307 ?auto_647308 ) ) ( not ( = ?auto_647307 ?auto_647309 ) ) ( not ( = ?auto_647307 ?auto_647310 ) ) ( not ( = ?auto_647307 ?auto_647311 ) ) ( not ( = ?auto_647307 ?auto_647312 ) ) ( not ( = ?auto_647307 ?auto_647313 ) ) ( not ( = ?auto_647307 ?auto_647314 ) ) ( not ( = ?auto_647307 ?auto_647315 ) ) ( not ( = ?auto_647307 ?auto_647316 ) ) ( not ( = ?auto_647307 ?auto_647317 ) ) ( not ( = ?auto_647307 ?auto_647318 ) ) ( not ( = ?auto_647307 ?auto_647319 ) ) ( not ( = ?auto_647307 ?auto_647320 ) ) ( not ( = ?auto_647308 ?auto_647309 ) ) ( not ( = ?auto_647308 ?auto_647310 ) ) ( not ( = ?auto_647308 ?auto_647311 ) ) ( not ( = ?auto_647308 ?auto_647312 ) ) ( not ( = ?auto_647308 ?auto_647313 ) ) ( not ( = ?auto_647308 ?auto_647314 ) ) ( not ( = ?auto_647308 ?auto_647315 ) ) ( not ( = ?auto_647308 ?auto_647316 ) ) ( not ( = ?auto_647308 ?auto_647317 ) ) ( not ( = ?auto_647308 ?auto_647318 ) ) ( not ( = ?auto_647308 ?auto_647319 ) ) ( not ( = ?auto_647308 ?auto_647320 ) ) ( not ( = ?auto_647309 ?auto_647310 ) ) ( not ( = ?auto_647309 ?auto_647311 ) ) ( not ( = ?auto_647309 ?auto_647312 ) ) ( not ( = ?auto_647309 ?auto_647313 ) ) ( not ( = ?auto_647309 ?auto_647314 ) ) ( not ( = ?auto_647309 ?auto_647315 ) ) ( not ( = ?auto_647309 ?auto_647316 ) ) ( not ( = ?auto_647309 ?auto_647317 ) ) ( not ( = ?auto_647309 ?auto_647318 ) ) ( not ( = ?auto_647309 ?auto_647319 ) ) ( not ( = ?auto_647309 ?auto_647320 ) ) ( not ( = ?auto_647310 ?auto_647311 ) ) ( not ( = ?auto_647310 ?auto_647312 ) ) ( not ( = ?auto_647310 ?auto_647313 ) ) ( not ( = ?auto_647310 ?auto_647314 ) ) ( not ( = ?auto_647310 ?auto_647315 ) ) ( not ( = ?auto_647310 ?auto_647316 ) ) ( not ( = ?auto_647310 ?auto_647317 ) ) ( not ( = ?auto_647310 ?auto_647318 ) ) ( not ( = ?auto_647310 ?auto_647319 ) ) ( not ( = ?auto_647310 ?auto_647320 ) ) ( not ( = ?auto_647311 ?auto_647312 ) ) ( not ( = ?auto_647311 ?auto_647313 ) ) ( not ( = ?auto_647311 ?auto_647314 ) ) ( not ( = ?auto_647311 ?auto_647315 ) ) ( not ( = ?auto_647311 ?auto_647316 ) ) ( not ( = ?auto_647311 ?auto_647317 ) ) ( not ( = ?auto_647311 ?auto_647318 ) ) ( not ( = ?auto_647311 ?auto_647319 ) ) ( not ( = ?auto_647311 ?auto_647320 ) ) ( not ( = ?auto_647312 ?auto_647313 ) ) ( not ( = ?auto_647312 ?auto_647314 ) ) ( not ( = ?auto_647312 ?auto_647315 ) ) ( not ( = ?auto_647312 ?auto_647316 ) ) ( not ( = ?auto_647312 ?auto_647317 ) ) ( not ( = ?auto_647312 ?auto_647318 ) ) ( not ( = ?auto_647312 ?auto_647319 ) ) ( not ( = ?auto_647312 ?auto_647320 ) ) ( not ( = ?auto_647313 ?auto_647314 ) ) ( not ( = ?auto_647313 ?auto_647315 ) ) ( not ( = ?auto_647313 ?auto_647316 ) ) ( not ( = ?auto_647313 ?auto_647317 ) ) ( not ( = ?auto_647313 ?auto_647318 ) ) ( not ( = ?auto_647313 ?auto_647319 ) ) ( not ( = ?auto_647313 ?auto_647320 ) ) ( not ( = ?auto_647314 ?auto_647315 ) ) ( not ( = ?auto_647314 ?auto_647316 ) ) ( not ( = ?auto_647314 ?auto_647317 ) ) ( not ( = ?auto_647314 ?auto_647318 ) ) ( not ( = ?auto_647314 ?auto_647319 ) ) ( not ( = ?auto_647314 ?auto_647320 ) ) ( not ( = ?auto_647315 ?auto_647316 ) ) ( not ( = ?auto_647315 ?auto_647317 ) ) ( not ( = ?auto_647315 ?auto_647318 ) ) ( not ( = ?auto_647315 ?auto_647319 ) ) ( not ( = ?auto_647315 ?auto_647320 ) ) ( not ( = ?auto_647316 ?auto_647317 ) ) ( not ( = ?auto_647316 ?auto_647318 ) ) ( not ( = ?auto_647316 ?auto_647319 ) ) ( not ( = ?auto_647316 ?auto_647320 ) ) ( not ( = ?auto_647317 ?auto_647318 ) ) ( not ( = ?auto_647317 ?auto_647319 ) ) ( not ( = ?auto_647317 ?auto_647320 ) ) ( not ( = ?auto_647318 ?auto_647319 ) ) ( not ( = ?auto_647318 ?auto_647320 ) ) ( not ( = ?auto_647319 ?auto_647320 ) ) ( ON ?auto_647318 ?auto_647319 ) ( ON ?auto_647317 ?auto_647318 ) ( ON ?auto_647316 ?auto_647317 ) ( ON ?auto_647315 ?auto_647316 ) ( ON ?auto_647314 ?auto_647315 ) ( CLEAR ?auto_647312 ) ( ON ?auto_647313 ?auto_647314 ) ( CLEAR ?auto_647313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_647305 ?auto_647306 ?auto_647307 ?auto_647308 ?auto_647309 ?auto_647310 ?auto_647311 ?auto_647312 ?auto_647313 )
      ( MAKE-15PILE ?auto_647305 ?auto_647306 ?auto_647307 ?auto_647308 ?auto_647309 ?auto_647310 ?auto_647311 ?auto_647312 ?auto_647313 ?auto_647314 ?auto_647315 ?auto_647316 ?auto_647317 ?auto_647318 ?auto_647319 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647367 - BLOCK
      ?auto_647368 - BLOCK
      ?auto_647369 - BLOCK
      ?auto_647370 - BLOCK
      ?auto_647371 - BLOCK
      ?auto_647372 - BLOCK
      ?auto_647373 - BLOCK
      ?auto_647374 - BLOCK
      ?auto_647375 - BLOCK
      ?auto_647376 - BLOCK
      ?auto_647377 - BLOCK
      ?auto_647378 - BLOCK
      ?auto_647379 - BLOCK
      ?auto_647380 - BLOCK
      ?auto_647381 - BLOCK
    )
    :vars
    (
      ?auto_647382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647381 ?auto_647382 ) ( ON-TABLE ?auto_647367 ) ( ON ?auto_647368 ?auto_647367 ) ( ON ?auto_647369 ?auto_647368 ) ( ON ?auto_647370 ?auto_647369 ) ( ON ?auto_647371 ?auto_647370 ) ( ON ?auto_647372 ?auto_647371 ) ( ON ?auto_647373 ?auto_647372 ) ( not ( = ?auto_647367 ?auto_647368 ) ) ( not ( = ?auto_647367 ?auto_647369 ) ) ( not ( = ?auto_647367 ?auto_647370 ) ) ( not ( = ?auto_647367 ?auto_647371 ) ) ( not ( = ?auto_647367 ?auto_647372 ) ) ( not ( = ?auto_647367 ?auto_647373 ) ) ( not ( = ?auto_647367 ?auto_647374 ) ) ( not ( = ?auto_647367 ?auto_647375 ) ) ( not ( = ?auto_647367 ?auto_647376 ) ) ( not ( = ?auto_647367 ?auto_647377 ) ) ( not ( = ?auto_647367 ?auto_647378 ) ) ( not ( = ?auto_647367 ?auto_647379 ) ) ( not ( = ?auto_647367 ?auto_647380 ) ) ( not ( = ?auto_647367 ?auto_647381 ) ) ( not ( = ?auto_647367 ?auto_647382 ) ) ( not ( = ?auto_647368 ?auto_647369 ) ) ( not ( = ?auto_647368 ?auto_647370 ) ) ( not ( = ?auto_647368 ?auto_647371 ) ) ( not ( = ?auto_647368 ?auto_647372 ) ) ( not ( = ?auto_647368 ?auto_647373 ) ) ( not ( = ?auto_647368 ?auto_647374 ) ) ( not ( = ?auto_647368 ?auto_647375 ) ) ( not ( = ?auto_647368 ?auto_647376 ) ) ( not ( = ?auto_647368 ?auto_647377 ) ) ( not ( = ?auto_647368 ?auto_647378 ) ) ( not ( = ?auto_647368 ?auto_647379 ) ) ( not ( = ?auto_647368 ?auto_647380 ) ) ( not ( = ?auto_647368 ?auto_647381 ) ) ( not ( = ?auto_647368 ?auto_647382 ) ) ( not ( = ?auto_647369 ?auto_647370 ) ) ( not ( = ?auto_647369 ?auto_647371 ) ) ( not ( = ?auto_647369 ?auto_647372 ) ) ( not ( = ?auto_647369 ?auto_647373 ) ) ( not ( = ?auto_647369 ?auto_647374 ) ) ( not ( = ?auto_647369 ?auto_647375 ) ) ( not ( = ?auto_647369 ?auto_647376 ) ) ( not ( = ?auto_647369 ?auto_647377 ) ) ( not ( = ?auto_647369 ?auto_647378 ) ) ( not ( = ?auto_647369 ?auto_647379 ) ) ( not ( = ?auto_647369 ?auto_647380 ) ) ( not ( = ?auto_647369 ?auto_647381 ) ) ( not ( = ?auto_647369 ?auto_647382 ) ) ( not ( = ?auto_647370 ?auto_647371 ) ) ( not ( = ?auto_647370 ?auto_647372 ) ) ( not ( = ?auto_647370 ?auto_647373 ) ) ( not ( = ?auto_647370 ?auto_647374 ) ) ( not ( = ?auto_647370 ?auto_647375 ) ) ( not ( = ?auto_647370 ?auto_647376 ) ) ( not ( = ?auto_647370 ?auto_647377 ) ) ( not ( = ?auto_647370 ?auto_647378 ) ) ( not ( = ?auto_647370 ?auto_647379 ) ) ( not ( = ?auto_647370 ?auto_647380 ) ) ( not ( = ?auto_647370 ?auto_647381 ) ) ( not ( = ?auto_647370 ?auto_647382 ) ) ( not ( = ?auto_647371 ?auto_647372 ) ) ( not ( = ?auto_647371 ?auto_647373 ) ) ( not ( = ?auto_647371 ?auto_647374 ) ) ( not ( = ?auto_647371 ?auto_647375 ) ) ( not ( = ?auto_647371 ?auto_647376 ) ) ( not ( = ?auto_647371 ?auto_647377 ) ) ( not ( = ?auto_647371 ?auto_647378 ) ) ( not ( = ?auto_647371 ?auto_647379 ) ) ( not ( = ?auto_647371 ?auto_647380 ) ) ( not ( = ?auto_647371 ?auto_647381 ) ) ( not ( = ?auto_647371 ?auto_647382 ) ) ( not ( = ?auto_647372 ?auto_647373 ) ) ( not ( = ?auto_647372 ?auto_647374 ) ) ( not ( = ?auto_647372 ?auto_647375 ) ) ( not ( = ?auto_647372 ?auto_647376 ) ) ( not ( = ?auto_647372 ?auto_647377 ) ) ( not ( = ?auto_647372 ?auto_647378 ) ) ( not ( = ?auto_647372 ?auto_647379 ) ) ( not ( = ?auto_647372 ?auto_647380 ) ) ( not ( = ?auto_647372 ?auto_647381 ) ) ( not ( = ?auto_647372 ?auto_647382 ) ) ( not ( = ?auto_647373 ?auto_647374 ) ) ( not ( = ?auto_647373 ?auto_647375 ) ) ( not ( = ?auto_647373 ?auto_647376 ) ) ( not ( = ?auto_647373 ?auto_647377 ) ) ( not ( = ?auto_647373 ?auto_647378 ) ) ( not ( = ?auto_647373 ?auto_647379 ) ) ( not ( = ?auto_647373 ?auto_647380 ) ) ( not ( = ?auto_647373 ?auto_647381 ) ) ( not ( = ?auto_647373 ?auto_647382 ) ) ( not ( = ?auto_647374 ?auto_647375 ) ) ( not ( = ?auto_647374 ?auto_647376 ) ) ( not ( = ?auto_647374 ?auto_647377 ) ) ( not ( = ?auto_647374 ?auto_647378 ) ) ( not ( = ?auto_647374 ?auto_647379 ) ) ( not ( = ?auto_647374 ?auto_647380 ) ) ( not ( = ?auto_647374 ?auto_647381 ) ) ( not ( = ?auto_647374 ?auto_647382 ) ) ( not ( = ?auto_647375 ?auto_647376 ) ) ( not ( = ?auto_647375 ?auto_647377 ) ) ( not ( = ?auto_647375 ?auto_647378 ) ) ( not ( = ?auto_647375 ?auto_647379 ) ) ( not ( = ?auto_647375 ?auto_647380 ) ) ( not ( = ?auto_647375 ?auto_647381 ) ) ( not ( = ?auto_647375 ?auto_647382 ) ) ( not ( = ?auto_647376 ?auto_647377 ) ) ( not ( = ?auto_647376 ?auto_647378 ) ) ( not ( = ?auto_647376 ?auto_647379 ) ) ( not ( = ?auto_647376 ?auto_647380 ) ) ( not ( = ?auto_647376 ?auto_647381 ) ) ( not ( = ?auto_647376 ?auto_647382 ) ) ( not ( = ?auto_647377 ?auto_647378 ) ) ( not ( = ?auto_647377 ?auto_647379 ) ) ( not ( = ?auto_647377 ?auto_647380 ) ) ( not ( = ?auto_647377 ?auto_647381 ) ) ( not ( = ?auto_647377 ?auto_647382 ) ) ( not ( = ?auto_647378 ?auto_647379 ) ) ( not ( = ?auto_647378 ?auto_647380 ) ) ( not ( = ?auto_647378 ?auto_647381 ) ) ( not ( = ?auto_647378 ?auto_647382 ) ) ( not ( = ?auto_647379 ?auto_647380 ) ) ( not ( = ?auto_647379 ?auto_647381 ) ) ( not ( = ?auto_647379 ?auto_647382 ) ) ( not ( = ?auto_647380 ?auto_647381 ) ) ( not ( = ?auto_647380 ?auto_647382 ) ) ( not ( = ?auto_647381 ?auto_647382 ) ) ( ON ?auto_647380 ?auto_647381 ) ( ON ?auto_647379 ?auto_647380 ) ( ON ?auto_647378 ?auto_647379 ) ( ON ?auto_647377 ?auto_647378 ) ( ON ?auto_647376 ?auto_647377 ) ( ON ?auto_647375 ?auto_647376 ) ( CLEAR ?auto_647373 ) ( ON ?auto_647374 ?auto_647375 ) ( CLEAR ?auto_647374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_647367 ?auto_647368 ?auto_647369 ?auto_647370 ?auto_647371 ?auto_647372 ?auto_647373 ?auto_647374 )
      ( MAKE-15PILE ?auto_647367 ?auto_647368 ?auto_647369 ?auto_647370 ?auto_647371 ?auto_647372 ?auto_647373 ?auto_647374 ?auto_647375 ?auto_647376 ?auto_647377 ?auto_647378 ?auto_647379 ?auto_647380 ?auto_647381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647429 - BLOCK
      ?auto_647430 - BLOCK
      ?auto_647431 - BLOCK
      ?auto_647432 - BLOCK
      ?auto_647433 - BLOCK
      ?auto_647434 - BLOCK
      ?auto_647435 - BLOCK
      ?auto_647436 - BLOCK
      ?auto_647437 - BLOCK
      ?auto_647438 - BLOCK
      ?auto_647439 - BLOCK
      ?auto_647440 - BLOCK
      ?auto_647441 - BLOCK
      ?auto_647442 - BLOCK
      ?auto_647443 - BLOCK
    )
    :vars
    (
      ?auto_647444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647443 ?auto_647444 ) ( ON-TABLE ?auto_647429 ) ( ON ?auto_647430 ?auto_647429 ) ( ON ?auto_647431 ?auto_647430 ) ( ON ?auto_647432 ?auto_647431 ) ( ON ?auto_647433 ?auto_647432 ) ( ON ?auto_647434 ?auto_647433 ) ( not ( = ?auto_647429 ?auto_647430 ) ) ( not ( = ?auto_647429 ?auto_647431 ) ) ( not ( = ?auto_647429 ?auto_647432 ) ) ( not ( = ?auto_647429 ?auto_647433 ) ) ( not ( = ?auto_647429 ?auto_647434 ) ) ( not ( = ?auto_647429 ?auto_647435 ) ) ( not ( = ?auto_647429 ?auto_647436 ) ) ( not ( = ?auto_647429 ?auto_647437 ) ) ( not ( = ?auto_647429 ?auto_647438 ) ) ( not ( = ?auto_647429 ?auto_647439 ) ) ( not ( = ?auto_647429 ?auto_647440 ) ) ( not ( = ?auto_647429 ?auto_647441 ) ) ( not ( = ?auto_647429 ?auto_647442 ) ) ( not ( = ?auto_647429 ?auto_647443 ) ) ( not ( = ?auto_647429 ?auto_647444 ) ) ( not ( = ?auto_647430 ?auto_647431 ) ) ( not ( = ?auto_647430 ?auto_647432 ) ) ( not ( = ?auto_647430 ?auto_647433 ) ) ( not ( = ?auto_647430 ?auto_647434 ) ) ( not ( = ?auto_647430 ?auto_647435 ) ) ( not ( = ?auto_647430 ?auto_647436 ) ) ( not ( = ?auto_647430 ?auto_647437 ) ) ( not ( = ?auto_647430 ?auto_647438 ) ) ( not ( = ?auto_647430 ?auto_647439 ) ) ( not ( = ?auto_647430 ?auto_647440 ) ) ( not ( = ?auto_647430 ?auto_647441 ) ) ( not ( = ?auto_647430 ?auto_647442 ) ) ( not ( = ?auto_647430 ?auto_647443 ) ) ( not ( = ?auto_647430 ?auto_647444 ) ) ( not ( = ?auto_647431 ?auto_647432 ) ) ( not ( = ?auto_647431 ?auto_647433 ) ) ( not ( = ?auto_647431 ?auto_647434 ) ) ( not ( = ?auto_647431 ?auto_647435 ) ) ( not ( = ?auto_647431 ?auto_647436 ) ) ( not ( = ?auto_647431 ?auto_647437 ) ) ( not ( = ?auto_647431 ?auto_647438 ) ) ( not ( = ?auto_647431 ?auto_647439 ) ) ( not ( = ?auto_647431 ?auto_647440 ) ) ( not ( = ?auto_647431 ?auto_647441 ) ) ( not ( = ?auto_647431 ?auto_647442 ) ) ( not ( = ?auto_647431 ?auto_647443 ) ) ( not ( = ?auto_647431 ?auto_647444 ) ) ( not ( = ?auto_647432 ?auto_647433 ) ) ( not ( = ?auto_647432 ?auto_647434 ) ) ( not ( = ?auto_647432 ?auto_647435 ) ) ( not ( = ?auto_647432 ?auto_647436 ) ) ( not ( = ?auto_647432 ?auto_647437 ) ) ( not ( = ?auto_647432 ?auto_647438 ) ) ( not ( = ?auto_647432 ?auto_647439 ) ) ( not ( = ?auto_647432 ?auto_647440 ) ) ( not ( = ?auto_647432 ?auto_647441 ) ) ( not ( = ?auto_647432 ?auto_647442 ) ) ( not ( = ?auto_647432 ?auto_647443 ) ) ( not ( = ?auto_647432 ?auto_647444 ) ) ( not ( = ?auto_647433 ?auto_647434 ) ) ( not ( = ?auto_647433 ?auto_647435 ) ) ( not ( = ?auto_647433 ?auto_647436 ) ) ( not ( = ?auto_647433 ?auto_647437 ) ) ( not ( = ?auto_647433 ?auto_647438 ) ) ( not ( = ?auto_647433 ?auto_647439 ) ) ( not ( = ?auto_647433 ?auto_647440 ) ) ( not ( = ?auto_647433 ?auto_647441 ) ) ( not ( = ?auto_647433 ?auto_647442 ) ) ( not ( = ?auto_647433 ?auto_647443 ) ) ( not ( = ?auto_647433 ?auto_647444 ) ) ( not ( = ?auto_647434 ?auto_647435 ) ) ( not ( = ?auto_647434 ?auto_647436 ) ) ( not ( = ?auto_647434 ?auto_647437 ) ) ( not ( = ?auto_647434 ?auto_647438 ) ) ( not ( = ?auto_647434 ?auto_647439 ) ) ( not ( = ?auto_647434 ?auto_647440 ) ) ( not ( = ?auto_647434 ?auto_647441 ) ) ( not ( = ?auto_647434 ?auto_647442 ) ) ( not ( = ?auto_647434 ?auto_647443 ) ) ( not ( = ?auto_647434 ?auto_647444 ) ) ( not ( = ?auto_647435 ?auto_647436 ) ) ( not ( = ?auto_647435 ?auto_647437 ) ) ( not ( = ?auto_647435 ?auto_647438 ) ) ( not ( = ?auto_647435 ?auto_647439 ) ) ( not ( = ?auto_647435 ?auto_647440 ) ) ( not ( = ?auto_647435 ?auto_647441 ) ) ( not ( = ?auto_647435 ?auto_647442 ) ) ( not ( = ?auto_647435 ?auto_647443 ) ) ( not ( = ?auto_647435 ?auto_647444 ) ) ( not ( = ?auto_647436 ?auto_647437 ) ) ( not ( = ?auto_647436 ?auto_647438 ) ) ( not ( = ?auto_647436 ?auto_647439 ) ) ( not ( = ?auto_647436 ?auto_647440 ) ) ( not ( = ?auto_647436 ?auto_647441 ) ) ( not ( = ?auto_647436 ?auto_647442 ) ) ( not ( = ?auto_647436 ?auto_647443 ) ) ( not ( = ?auto_647436 ?auto_647444 ) ) ( not ( = ?auto_647437 ?auto_647438 ) ) ( not ( = ?auto_647437 ?auto_647439 ) ) ( not ( = ?auto_647437 ?auto_647440 ) ) ( not ( = ?auto_647437 ?auto_647441 ) ) ( not ( = ?auto_647437 ?auto_647442 ) ) ( not ( = ?auto_647437 ?auto_647443 ) ) ( not ( = ?auto_647437 ?auto_647444 ) ) ( not ( = ?auto_647438 ?auto_647439 ) ) ( not ( = ?auto_647438 ?auto_647440 ) ) ( not ( = ?auto_647438 ?auto_647441 ) ) ( not ( = ?auto_647438 ?auto_647442 ) ) ( not ( = ?auto_647438 ?auto_647443 ) ) ( not ( = ?auto_647438 ?auto_647444 ) ) ( not ( = ?auto_647439 ?auto_647440 ) ) ( not ( = ?auto_647439 ?auto_647441 ) ) ( not ( = ?auto_647439 ?auto_647442 ) ) ( not ( = ?auto_647439 ?auto_647443 ) ) ( not ( = ?auto_647439 ?auto_647444 ) ) ( not ( = ?auto_647440 ?auto_647441 ) ) ( not ( = ?auto_647440 ?auto_647442 ) ) ( not ( = ?auto_647440 ?auto_647443 ) ) ( not ( = ?auto_647440 ?auto_647444 ) ) ( not ( = ?auto_647441 ?auto_647442 ) ) ( not ( = ?auto_647441 ?auto_647443 ) ) ( not ( = ?auto_647441 ?auto_647444 ) ) ( not ( = ?auto_647442 ?auto_647443 ) ) ( not ( = ?auto_647442 ?auto_647444 ) ) ( not ( = ?auto_647443 ?auto_647444 ) ) ( ON ?auto_647442 ?auto_647443 ) ( ON ?auto_647441 ?auto_647442 ) ( ON ?auto_647440 ?auto_647441 ) ( ON ?auto_647439 ?auto_647440 ) ( ON ?auto_647438 ?auto_647439 ) ( ON ?auto_647437 ?auto_647438 ) ( ON ?auto_647436 ?auto_647437 ) ( CLEAR ?auto_647434 ) ( ON ?auto_647435 ?auto_647436 ) ( CLEAR ?auto_647435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_647429 ?auto_647430 ?auto_647431 ?auto_647432 ?auto_647433 ?auto_647434 ?auto_647435 )
      ( MAKE-15PILE ?auto_647429 ?auto_647430 ?auto_647431 ?auto_647432 ?auto_647433 ?auto_647434 ?auto_647435 ?auto_647436 ?auto_647437 ?auto_647438 ?auto_647439 ?auto_647440 ?auto_647441 ?auto_647442 ?auto_647443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647491 - BLOCK
      ?auto_647492 - BLOCK
      ?auto_647493 - BLOCK
      ?auto_647494 - BLOCK
      ?auto_647495 - BLOCK
      ?auto_647496 - BLOCK
      ?auto_647497 - BLOCK
      ?auto_647498 - BLOCK
      ?auto_647499 - BLOCK
      ?auto_647500 - BLOCK
      ?auto_647501 - BLOCK
      ?auto_647502 - BLOCK
      ?auto_647503 - BLOCK
      ?auto_647504 - BLOCK
      ?auto_647505 - BLOCK
    )
    :vars
    (
      ?auto_647506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647505 ?auto_647506 ) ( ON-TABLE ?auto_647491 ) ( ON ?auto_647492 ?auto_647491 ) ( ON ?auto_647493 ?auto_647492 ) ( ON ?auto_647494 ?auto_647493 ) ( ON ?auto_647495 ?auto_647494 ) ( not ( = ?auto_647491 ?auto_647492 ) ) ( not ( = ?auto_647491 ?auto_647493 ) ) ( not ( = ?auto_647491 ?auto_647494 ) ) ( not ( = ?auto_647491 ?auto_647495 ) ) ( not ( = ?auto_647491 ?auto_647496 ) ) ( not ( = ?auto_647491 ?auto_647497 ) ) ( not ( = ?auto_647491 ?auto_647498 ) ) ( not ( = ?auto_647491 ?auto_647499 ) ) ( not ( = ?auto_647491 ?auto_647500 ) ) ( not ( = ?auto_647491 ?auto_647501 ) ) ( not ( = ?auto_647491 ?auto_647502 ) ) ( not ( = ?auto_647491 ?auto_647503 ) ) ( not ( = ?auto_647491 ?auto_647504 ) ) ( not ( = ?auto_647491 ?auto_647505 ) ) ( not ( = ?auto_647491 ?auto_647506 ) ) ( not ( = ?auto_647492 ?auto_647493 ) ) ( not ( = ?auto_647492 ?auto_647494 ) ) ( not ( = ?auto_647492 ?auto_647495 ) ) ( not ( = ?auto_647492 ?auto_647496 ) ) ( not ( = ?auto_647492 ?auto_647497 ) ) ( not ( = ?auto_647492 ?auto_647498 ) ) ( not ( = ?auto_647492 ?auto_647499 ) ) ( not ( = ?auto_647492 ?auto_647500 ) ) ( not ( = ?auto_647492 ?auto_647501 ) ) ( not ( = ?auto_647492 ?auto_647502 ) ) ( not ( = ?auto_647492 ?auto_647503 ) ) ( not ( = ?auto_647492 ?auto_647504 ) ) ( not ( = ?auto_647492 ?auto_647505 ) ) ( not ( = ?auto_647492 ?auto_647506 ) ) ( not ( = ?auto_647493 ?auto_647494 ) ) ( not ( = ?auto_647493 ?auto_647495 ) ) ( not ( = ?auto_647493 ?auto_647496 ) ) ( not ( = ?auto_647493 ?auto_647497 ) ) ( not ( = ?auto_647493 ?auto_647498 ) ) ( not ( = ?auto_647493 ?auto_647499 ) ) ( not ( = ?auto_647493 ?auto_647500 ) ) ( not ( = ?auto_647493 ?auto_647501 ) ) ( not ( = ?auto_647493 ?auto_647502 ) ) ( not ( = ?auto_647493 ?auto_647503 ) ) ( not ( = ?auto_647493 ?auto_647504 ) ) ( not ( = ?auto_647493 ?auto_647505 ) ) ( not ( = ?auto_647493 ?auto_647506 ) ) ( not ( = ?auto_647494 ?auto_647495 ) ) ( not ( = ?auto_647494 ?auto_647496 ) ) ( not ( = ?auto_647494 ?auto_647497 ) ) ( not ( = ?auto_647494 ?auto_647498 ) ) ( not ( = ?auto_647494 ?auto_647499 ) ) ( not ( = ?auto_647494 ?auto_647500 ) ) ( not ( = ?auto_647494 ?auto_647501 ) ) ( not ( = ?auto_647494 ?auto_647502 ) ) ( not ( = ?auto_647494 ?auto_647503 ) ) ( not ( = ?auto_647494 ?auto_647504 ) ) ( not ( = ?auto_647494 ?auto_647505 ) ) ( not ( = ?auto_647494 ?auto_647506 ) ) ( not ( = ?auto_647495 ?auto_647496 ) ) ( not ( = ?auto_647495 ?auto_647497 ) ) ( not ( = ?auto_647495 ?auto_647498 ) ) ( not ( = ?auto_647495 ?auto_647499 ) ) ( not ( = ?auto_647495 ?auto_647500 ) ) ( not ( = ?auto_647495 ?auto_647501 ) ) ( not ( = ?auto_647495 ?auto_647502 ) ) ( not ( = ?auto_647495 ?auto_647503 ) ) ( not ( = ?auto_647495 ?auto_647504 ) ) ( not ( = ?auto_647495 ?auto_647505 ) ) ( not ( = ?auto_647495 ?auto_647506 ) ) ( not ( = ?auto_647496 ?auto_647497 ) ) ( not ( = ?auto_647496 ?auto_647498 ) ) ( not ( = ?auto_647496 ?auto_647499 ) ) ( not ( = ?auto_647496 ?auto_647500 ) ) ( not ( = ?auto_647496 ?auto_647501 ) ) ( not ( = ?auto_647496 ?auto_647502 ) ) ( not ( = ?auto_647496 ?auto_647503 ) ) ( not ( = ?auto_647496 ?auto_647504 ) ) ( not ( = ?auto_647496 ?auto_647505 ) ) ( not ( = ?auto_647496 ?auto_647506 ) ) ( not ( = ?auto_647497 ?auto_647498 ) ) ( not ( = ?auto_647497 ?auto_647499 ) ) ( not ( = ?auto_647497 ?auto_647500 ) ) ( not ( = ?auto_647497 ?auto_647501 ) ) ( not ( = ?auto_647497 ?auto_647502 ) ) ( not ( = ?auto_647497 ?auto_647503 ) ) ( not ( = ?auto_647497 ?auto_647504 ) ) ( not ( = ?auto_647497 ?auto_647505 ) ) ( not ( = ?auto_647497 ?auto_647506 ) ) ( not ( = ?auto_647498 ?auto_647499 ) ) ( not ( = ?auto_647498 ?auto_647500 ) ) ( not ( = ?auto_647498 ?auto_647501 ) ) ( not ( = ?auto_647498 ?auto_647502 ) ) ( not ( = ?auto_647498 ?auto_647503 ) ) ( not ( = ?auto_647498 ?auto_647504 ) ) ( not ( = ?auto_647498 ?auto_647505 ) ) ( not ( = ?auto_647498 ?auto_647506 ) ) ( not ( = ?auto_647499 ?auto_647500 ) ) ( not ( = ?auto_647499 ?auto_647501 ) ) ( not ( = ?auto_647499 ?auto_647502 ) ) ( not ( = ?auto_647499 ?auto_647503 ) ) ( not ( = ?auto_647499 ?auto_647504 ) ) ( not ( = ?auto_647499 ?auto_647505 ) ) ( not ( = ?auto_647499 ?auto_647506 ) ) ( not ( = ?auto_647500 ?auto_647501 ) ) ( not ( = ?auto_647500 ?auto_647502 ) ) ( not ( = ?auto_647500 ?auto_647503 ) ) ( not ( = ?auto_647500 ?auto_647504 ) ) ( not ( = ?auto_647500 ?auto_647505 ) ) ( not ( = ?auto_647500 ?auto_647506 ) ) ( not ( = ?auto_647501 ?auto_647502 ) ) ( not ( = ?auto_647501 ?auto_647503 ) ) ( not ( = ?auto_647501 ?auto_647504 ) ) ( not ( = ?auto_647501 ?auto_647505 ) ) ( not ( = ?auto_647501 ?auto_647506 ) ) ( not ( = ?auto_647502 ?auto_647503 ) ) ( not ( = ?auto_647502 ?auto_647504 ) ) ( not ( = ?auto_647502 ?auto_647505 ) ) ( not ( = ?auto_647502 ?auto_647506 ) ) ( not ( = ?auto_647503 ?auto_647504 ) ) ( not ( = ?auto_647503 ?auto_647505 ) ) ( not ( = ?auto_647503 ?auto_647506 ) ) ( not ( = ?auto_647504 ?auto_647505 ) ) ( not ( = ?auto_647504 ?auto_647506 ) ) ( not ( = ?auto_647505 ?auto_647506 ) ) ( ON ?auto_647504 ?auto_647505 ) ( ON ?auto_647503 ?auto_647504 ) ( ON ?auto_647502 ?auto_647503 ) ( ON ?auto_647501 ?auto_647502 ) ( ON ?auto_647500 ?auto_647501 ) ( ON ?auto_647499 ?auto_647500 ) ( ON ?auto_647498 ?auto_647499 ) ( ON ?auto_647497 ?auto_647498 ) ( CLEAR ?auto_647495 ) ( ON ?auto_647496 ?auto_647497 ) ( CLEAR ?auto_647496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_647491 ?auto_647492 ?auto_647493 ?auto_647494 ?auto_647495 ?auto_647496 )
      ( MAKE-15PILE ?auto_647491 ?auto_647492 ?auto_647493 ?auto_647494 ?auto_647495 ?auto_647496 ?auto_647497 ?auto_647498 ?auto_647499 ?auto_647500 ?auto_647501 ?auto_647502 ?auto_647503 ?auto_647504 ?auto_647505 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647553 - BLOCK
      ?auto_647554 - BLOCK
      ?auto_647555 - BLOCK
      ?auto_647556 - BLOCK
      ?auto_647557 - BLOCK
      ?auto_647558 - BLOCK
      ?auto_647559 - BLOCK
      ?auto_647560 - BLOCK
      ?auto_647561 - BLOCK
      ?auto_647562 - BLOCK
      ?auto_647563 - BLOCK
      ?auto_647564 - BLOCK
      ?auto_647565 - BLOCK
      ?auto_647566 - BLOCK
      ?auto_647567 - BLOCK
    )
    :vars
    (
      ?auto_647568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647567 ?auto_647568 ) ( ON-TABLE ?auto_647553 ) ( ON ?auto_647554 ?auto_647553 ) ( ON ?auto_647555 ?auto_647554 ) ( ON ?auto_647556 ?auto_647555 ) ( not ( = ?auto_647553 ?auto_647554 ) ) ( not ( = ?auto_647553 ?auto_647555 ) ) ( not ( = ?auto_647553 ?auto_647556 ) ) ( not ( = ?auto_647553 ?auto_647557 ) ) ( not ( = ?auto_647553 ?auto_647558 ) ) ( not ( = ?auto_647553 ?auto_647559 ) ) ( not ( = ?auto_647553 ?auto_647560 ) ) ( not ( = ?auto_647553 ?auto_647561 ) ) ( not ( = ?auto_647553 ?auto_647562 ) ) ( not ( = ?auto_647553 ?auto_647563 ) ) ( not ( = ?auto_647553 ?auto_647564 ) ) ( not ( = ?auto_647553 ?auto_647565 ) ) ( not ( = ?auto_647553 ?auto_647566 ) ) ( not ( = ?auto_647553 ?auto_647567 ) ) ( not ( = ?auto_647553 ?auto_647568 ) ) ( not ( = ?auto_647554 ?auto_647555 ) ) ( not ( = ?auto_647554 ?auto_647556 ) ) ( not ( = ?auto_647554 ?auto_647557 ) ) ( not ( = ?auto_647554 ?auto_647558 ) ) ( not ( = ?auto_647554 ?auto_647559 ) ) ( not ( = ?auto_647554 ?auto_647560 ) ) ( not ( = ?auto_647554 ?auto_647561 ) ) ( not ( = ?auto_647554 ?auto_647562 ) ) ( not ( = ?auto_647554 ?auto_647563 ) ) ( not ( = ?auto_647554 ?auto_647564 ) ) ( not ( = ?auto_647554 ?auto_647565 ) ) ( not ( = ?auto_647554 ?auto_647566 ) ) ( not ( = ?auto_647554 ?auto_647567 ) ) ( not ( = ?auto_647554 ?auto_647568 ) ) ( not ( = ?auto_647555 ?auto_647556 ) ) ( not ( = ?auto_647555 ?auto_647557 ) ) ( not ( = ?auto_647555 ?auto_647558 ) ) ( not ( = ?auto_647555 ?auto_647559 ) ) ( not ( = ?auto_647555 ?auto_647560 ) ) ( not ( = ?auto_647555 ?auto_647561 ) ) ( not ( = ?auto_647555 ?auto_647562 ) ) ( not ( = ?auto_647555 ?auto_647563 ) ) ( not ( = ?auto_647555 ?auto_647564 ) ) ( not ( = ?auto_647555 ?auto_647565 ) ) ( not ( = ?auto_647555 ?auto_647566 ) ) ( not ( = ?auto_647555 ?auto_647567 ) ) ( not ( = ?auto_647555 ?auto_647568 ) ) ( not ( = ?auto_647556 ?auto_647557 ) ) ( not ( = ?auto_647556 ?auto_647558 ) ) ( not ( = ?auto_647556 ?auto_647559 ) ) ( not ( = ?auto_647556 ?auto_647560 ) ) ( not ( = ?auto_647556 ?auto_647561 ) ) ( not ( = ?auto_647556 ?auto_647562 ) ) ( not ( = ?auto_647556 ?auto_647563 ) ) ( not ( = ?auto_647556 ?auto_647564 ) ) ( not ( = ?auto_647556 ?auto_647565 ) ) ( not ( = ?auto_647556 ?auto_647566 ) ) ( not ( = ?auto_647556 ?auto_647567 ) ) ( not ( = ?auto_647556 ?auto_647568 ) ) ( not ( = ?auto_647557 ?auto_647558 ) ) ( not ( = ?auto_647557 ?auto_647559 ) ) ( not ( = ?auto_647557 ?auto_647560 ) ) ( not ( = ?auto_647557 ?auto_647561 ) ) ( not ( = ?auto_647557 ?auto_647562 ) ) ( not ( = ?auto_647557 ?auto_647563 ) ) ( not ( = ?auto_647557 ?auto_647564 ) ) ( not ( = ?auto_647557 ?auto_647565 ) ) ( not ( = ?auto_647557 ?auto_647566 ) ) ( not ( = ?auto_647557 ?auto_647567 ) ) ( not ( = ?auto_647557 ?auto_647568 ) ) ( not ( = ?auto_647558 ?auto_647559 ) ) ( not ( = ?auto_647558 ?auto_647560 ) ) ( not ( = ?auto_647558 ?auto_647561 ) ) ( not ( = ?auto_647558 ?auto_647562 ) ) ( not ( = ?auto_647558 ?auto_647563 ) ) ( not ( = ?auto_647558 ?auto_647564 ) ) ( not ( = ?auto_647558 ?auto_647565 ) ) ( not ( = ?auto_647558 ?auto_647566 ) ) ( not ( = ?auto_647558 ?auto_647567 ) ) ( not ( = ?auto_647558 ?auto_647568 ) ) ( not ( = ?auto_647559 ?auto_647560 ) ) ( not ( = ?auto_647559 ?auto_647561 ) ) ( not ( = ?auto_647559 ?auto_647562 ) ) ( not ( = ?auto_647559 ?auto_647563 ) ) ( not ( = ?auto_647559 ?auto_647564 ) ) ( not ( = ?auto_647559 ?auto_647565 ) ) ( not ( = ?auto_647559 ?auto_647566 ) ) ( not ( = ?auto_647559 ?auto_647567 ) ) ( not ( = ?auto_647559 ?auto_647568 ) ) ( not ( = ?auto_647560 ?auto_647561 ) ) ( not ( = ?auto_647560 ?auto_647562 ) ) ( not ( = ?auto_647560 ?auto_647563 ) ) ( not ( = ?auto_647560 ?auto_647564 ) ) ( not ( = ?auto_647560 ?auto_647565 ) ) ( not ( = ?auto_647560 ?auto_647566 ) ) ( not ( = ?auto_647560 ?auto_647567 ) ) ( not ( = ?auto_647560 ?auto_647568 ) ) ( not ( = ?auto_647561 ?auto_647562 ) ) ( not ( = ?auto_647561 ?auto_647563 ) ) ( not ( = ?auto_647561 ?auto_647564 ) ) ( not ( = ?auto_647561 ?auto_647565 ) ) ( not ( = ?auto_647561 ?auto_647566 ) ) ( not ( = ?auto_647561 ?auto_647567 ) ) ( not ( = ?auto_647561 ?auto_647568 ) ) ( not ( = ?auto_647562 ?auto_647563 ) ) ( not ( = ?auto_647562 ?auto_647564 ) ) ( not ( = ?auto_647562 ?auto_647565 ) ) ( not ( = ?auto_647562 ?auto_647566 ) ) ( not ( = ?auto_647562 ?auto_647567 ) ) ( not ( = ?auto_647562 ?auto_647568 ) ) ( not ( = ?auto_647563 ?auto_647564 ) ) ( not ( = ?auto_647563 ?auto_647565 ) ) ( not ( = ?auto_647563 ?auto_647566 ) ) ( not ( = ?auto_647563 ?auto_647567 ) ) ( not ( = ?auto_647563 ?auto_647568 ) ) ( not ( = ?auto_647564 ?auto_647565 ) ) ( not ( = ?auto_647564 ?auto_647566 ) ) ( not ( = ?auto_647564 ?auto_647567 ) ) ( not ( = ?auto_647564 ?auto_647568 ) ) ( not ( = ?auto_647565 ?auto_647566 ) ) ( not ( = ?auto_647565 ?auto_647567 ) ) ( not ( = ?auto_647565 ?auto_647568 ) ) ( not ( = ?auto_647566 ?auto_647567 ) ) ( not ( = ?auto_647566 ?auto_647568 ) ) ( not ( = ?auto_647567 ?auto_647568 ) ) ( ON ?auto_647566 ?auto_647567 ) ( ON ?auto_647565 ?auto_647566 ) ( ON ?auto_647564 ?auto_647565 ) ( ON ?auto_647563 ?auto_647564 ) ( ON ?auto_647562 ?auto_647563 ) ( ON ?auto_647561 ?auto_647562 ) ( ON ?auto_647560 ?auto_647561 ) ( ON ?auto_647559 ?auto_647560 ) ( ON ?auto_647558 ?auto_647559 ) ( CLEAR ?auto_647556 ) ( ON ?auto_647557 ?auto_647558 ) ( CLEAR ?auto_647557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_647553 ?auto_647554 ?auto_647555 ?auto_647556 ?auto_647557 )
      ( MAKE-15PILE ?auto_647553 ?auto_647554 ?auto_647555 ?auto_647556 ?auto_647557 ?auto_647558 ?auto_647559 ?auto_647560 ?auto_647561 ?auto_647562 ?auto_647563 ?auto_647564 ?auto_647565 ?auto_647566 ?auto_647567 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647615 - BLOCK
      ?auto_647616 - BLOCK
      ?auto_647617 - BLOCK
      ?auto_647618 - BLOCK
      ?auto_647619 - BLOCK
      ?auto_647620 - BLOCK
      ?auto_647621 - BLOCK
      ?auto_647622 - BLOCK
      ?auto_647623 - BLOCK
      ?auto_647624 - BLOCK
      ?auto_647625 - BLOCK
      ?auto_647626 - BLOCK
      ?auto_647627 - BLOCK
      ?auto_647628 - BLOCK
      ?auto_647629 - BLOCK
    )
    :vars
    (
      ?auto_647630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647629 ?auto_647630 ) ( ON-TABLE ?auto_647615 ) ( ON ?auto_647616 ?auto_647615 ) ( ON ?auto_647617 ?auto_647616 ) ( not ( = ?auto_647615 ?auto_647616 ) ) ( not ( = ?auto_647615 ?auto_647617 ) ) ( not ( = ?auto_647615 ?auto_647618 ) ) ( not ( = ?auto_647615 ?auto_647619 ) ) ( not ( = ?auto_647615 ?auto_647620 ) ) ( not ( = ?auto_647615 ?auto_647621 ) ) ( not ( = ?auto_647615 ?auto_647622 ) ) ( not ( = ?auto_647615 ?auto_647623 ) ) ( not ( = ?auto_647615 ?auto_647624 ) ) ( not ( = ?auto_647615 ?auto_647625 ) ) ( not ( = ?auto_647615 ?auto_647626 ) ) ( not ( = ?auto_647615 ?auto_647627 ) ) ( not ( = ?auto_647615 ?auto_647628 ) ) ( not ( = ?auto_647615 ?auto_647629 ) ) ( not ( = ?auto_647615 ?auto_647630 ) ) ( not ( = ?auto_647616 ?auto_647617 ) ) ( not ( = ?auto_647616 ?auto_647618 ) ) ( not ( = ?auto_647616 ?auto_647619 ) ) ( not ( = ?auto_647616 ?auto_647620 ) ) ( not ( = ?auto_647616 ?auto_647621 ) ) ( not ( = ?auto_647616 ?auto_647622 ) ) ( not ( = ?auto_647616 ?auto_647623 ) ) ( not ( = ?auto_647616 ?auto_647624 ) ) ( not ( = ?auto_647616 ?auto_647625 ) ) ( not ( = ?auto_647616 ?auto_647626 ) ) ( not ( = ?auto_647616 ?auto_647627 ) ) ( not ( = ?auto_647616 ?auto_647628 ) ) ( not ( = ?auto_647616 ?auto_647629 ) ) ( not ( = ?auto_647616 ?auto_647630 ) ) ( not ( = ?auto_647617 ?auto_647618 ) ) ( not ( = ?auto_647617 ?auto_647619 ) ) ( not ( = ?auto_647617 ?auto_647620 ) ) ( not ( = ?auto_647617 ?auto_647621 ) ) ( not ( = ?auto_647617 ?auto_647622 ) ) ( not ( = ?auto_647617 ?auto_647623 ) ) ( not ( = ?auto_647617 ?auto_647624 ) ) ( not ( = ?auto_647617 ?auto_647625 ) ) ( not ( = ?auto_647617 ?auto_647626 ) ) ( not ( = ?auto_647617 ?auto_647627 ) ) ( not ( = ?auto_647617 ?auto_647628 ) ) ( not ( = ?auto_647617 ?auto_647629 ) ) ( not ( = ?auto_647617 ?auto_647630 ) ) ( not ( = ?auto_647618 ?auto_647619 ) ) ( not ( = ?auto_647618 ?auto_647620 ) ) ( not ( = ?auto_647618 ?auto_647621 ) ) ( not ( = ?auto_647618 ?auto_647622 ) ) ( not ( = ?auto_647618 ?auto_647623 ) ) ( not ( = ?auto_647618 ?auto_647624 ) ) ( not ( = ?auto_647618 ?auto_647625 ) ) ( not ( = ?auto_647618 ?auto_647626 ) ) ( not ( = ?auto_647618 ?auto_647627 ) ) ( not ( = ?auto_647618 ?auto_647628 ) ) ( not ( = ?auto_647618 ?auto_647629 ) ) ( not ( = ?auto_647618 ?auto_647630 ) ) ( not ( = ?auto_647619 ?auto_647620 ) ) ( not ( = ?auto_647619 ?auto_647621 ) ) ( not ( = ?auto_647619 ?auto_647622 ) ) ( not ( = ?auto_647619 ?auto_647623 ) ) ( not ( = ?auto_647619 ?auto_647624 ) ) ( not ( = ?auto_647619 ?auto_647625 ) ) ( not ( = ?auto_647619 ?auto_647626 ) ) ( not ( = ?auto_647619 ?auto_647627 ) ) ( not ( = ?auto_647619 ?auto_647628 ) ) ( not ( = ?auto_647619 ?auto_647629 ) ) ( not ( = ?auto_647619 ?auto_647630 ) ) ( not ( = ?auto_647620 ?auto_647621 ) ) ( not ( = ?auto_647620 ?auto_647622 ) ) ( not ( = ?auto_647620 ?auto_647623 ) ) ( not ( = ?auto_647620 ?auto_647624 ) ) ( not ( = ?auto_647620 ?auto_647625 ) ) ( not ( = ?auto_647620 ?auto_647626 ) ) ( not ( = ?auto_647620 ?auto_647627 ) ) ( not ( = ?auto_647620 ?auto_647628 ) ) ( not ( = ?auto_647620 ?auto_647629 ) ) ( not ( = ?auto_647620 ?auto_647630 ) ) ( not ( = ?auto_647621 ?auto_647622 ) ) ( not ( = ?auto_647621 ?auto_647623 ) ) ( not ( = ?auto_647621 ?auto_647624 ) ) ( not ( = ?auto_647621 ?auto_647625 ) ) ( not ( = ?auto_647621 ?auto_647626 ) ) ( not ( = ?auto_647621 ?auto_647627 ) ) ( not ( = ?auto_647621 ?auto_647628 ) ) ( not ( = ?auto_647621 ?auto_647629 ) ) ( not ( = ?auto_647621 ?auto_647630 ) ) ( not ( = ?auto_647622 ?auto_647623 ) ) ( not ( = ?auto_647622 ?auto_647624 ) ) ( not ( = ?auto_647622 ?auto_647625 ) ) ( not ( = ?auto_647622 ?auto_647626 ) ) ( not ( = ?auto_647622 ?auto_647627 ) ) ( not ( = ?auto_647622 ?auto_647628 ) ) ( not ( = ?auto_647622 ?auto_647629 ) ) ( not ( = ?auto_647622 ?auto_647630 ) ) ( not ( = ?auto_647623 ?auto_647624 ) ) ( not ( = ?auto_647623 ?auto_647625 ) ) ( not ( = ?auto_647623 ?auto_647626 ) ) ( not ( = ?auto_647623 ?auto_647627 ) ) ( not ( = ?auto_647623 ?auto_647628 ) ) ( not ( = ?auto_647623 ?auto_647629 ) ) ( not ( = ?auto_647623 ?auto_647630 ) ) ( not ( = ?auto_647624 ?auto_647625 ) ) ( not ( = ?auto_647624 ?auto_647626 ) ) ( not ( = ?auto_647624 ?auto_647627 ) ) ( not ( = ?auto_647624 ?auto_647628 ) ) ( not ( = ?auto_647624 ?auto_647629 ) ) ( not ( = ?auto_647624 ?auto_647630 ) ) ( not ( = ?auto_647625 ?auto_647626 ) ) ( not ( = ?auto_647625 ?auto_647627 ) ) ( not ( = ?auto_647625 ?auto_647628 ) ) ( not ( = ?auto_647625 ?auto_647629 ) ) ( not ( = ?auto_647625 ?auto_647630 ) ) ( not ( = ?auto_647626 ?auto_647627 ) ) ( not ( = ?auto_647626 ?auto_647628 ) ) ( not ( = ?auto_647626 ?auto_647629 ) ) ( not ( = ?auto_647626 ?auto_647630 ) ) ( not ( = ?auto_647627 ?auto_647628 ) ) ( not ( = ?auto_647627 ?auto_647629 ) ) ( not ( = ?auto_647627 ?auto_647630 ) ) ( not ( = ?auto_647628 ?auto_647629 ) ) ( not ( = ?auto_647628 ?auto_647630 ) ) ( not ( = ?auto_647629 ?auto_647630 ) ) ( ON ?auto_647628 ?auto_647629 ) ( ON ?auto_647627 ?auto_647628 ) ( ON ?auto_647626 ?auto_647627 ) ( ON ?auto_647625 ?auto_647626 ) ( ON ?auto_647624 ?auto_647625 ) ( ON ?auto_647623 ?auto_647624 ) ( ON ?auto_647622 ?auto_647623 ) ( ON ?auto_647621 ?auto_647622 ) ( ON ?auto_647620 ?auto_647621 ) ( ON ?auto_647619 ?auto_647620 ) ( CLEAR ?auto_647617 ) ( ON ?auto_647618 ?auto_647619 ) ( CLEAR ?auto_647618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_647615 ?auto_647616 ?auto_647617 ?auto_647618 )
      ( MAKE-15PILE ?auto_647615 ?auto_647616 ?auto_647617 ?auto_647618 ?auto_647619 ?auto_647620 ?auto_647621 ?auto_647622 ?auto_647623 ?auto_647624 ?auto_647625 ?auto_647626 ?auto_647627 ?auto_647628 ?auto_647629 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647677 - BLOCK
      ?auto_647678 - BLOCK
      ?auto_647679 - BLOCK
      ?auto_647680 - BLOCK
      ?auto_647681 - BLOCK
      ?auto_647682 - BLOCK
      ?auto_647683 - BLOCK
      ?auto_647684 - BLOCK
      ?auto_647685 - BLOCK
      ?auto_647686 - BLOCK
      ?auto_647687 - BLOCK
      ?auto_647688 - BLOCK
      ?auto_647689 - BLOCK
      ?auto_647690 - BLOCK
      ?auto_647691 - BLOCK
    )
    :vars
    (
      ?auto_647692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647691 ?auto_647692 ) ( ON-TABLE ?auto_647677 ) ( ON ?auto_647678 ?auto_647677 ) ( not ( = ?auto_647677 ?auto_647678 ) ) ( not ( = ?auto_647677 ?auto_647679 ) ) ( not ( = ?auto_647677 ?auto_647680 ) ) ( not ( = ?auto_647677 ?auto_647681 ) ) ( not ( = ?auto_647677 ?auto_647682 ) ) ( not ( = ?auto_647677 ?auto_647683 ) ) ( not ( = ?auto_647677 ?auto_647684 ) ) ( not ( = ?auto_647677 ?auto_647685 ) ) ( not ( = ?auto_647677 ?auto_647686 ) ) ( not ( = ?auto_647677 ?auto_647687 ) ) ( not ( = ?auto_647677 ?auto_647688 ) ) ( not ( = ?auto_647677 ?auto_647689 ) ) ( not ( = ?auto_647677 ?auto_647690 ) ) ( not ( = ?auto_647677 ?auto_647691 ) ) ( not ( = ?auto_647677 ?auto_647692 ) ) ( not ( = ?auto_647678 ?auto_647679 ) ) ( not ( = ?auto_647678 ?auto_647680 ) ) ( not ( = ?auto_647678 ?auto_647681 ) ) ( not ( = ?auto_647678 ?auto_647682 ) ) ( not ( = ?auto_647678 ?auto_647683 ) ) ( not ( = ?auto_647678 ?auto_647684 ) ) ( not ( = ?auto_647678 ?auto_647685 ) ) ( not ( = ?auto_647678 ?auto_647686 ) ) ( not ( = ?auto_647678 ?auto_647687 ) ) ( not ( = ?auto_647678 ?auto_647688 ) ) ( not ( = ?auto_647678 ?auto_647689 ) ) ( not ( = ?auto_647678 ?auto_647690 ) ) ( not ( = ?auto_647678 ?auto_647691 ) ) ( not ( = ?auto_647678 ?auto_647692 ) ) ( not ( = ?auto_647679 ?auto_647680 ) ) ( not ( = ?auto_647679 ?auto_647681 ) ) ( not ( = ?auto_647679 ?auto_647682 ) ) ( not ( = ?auto_647679 ?auto_647683 ) ) ( not ( = ?auto_647679 ?auto_647684 ) ) ( not ( = ?auto_647679 ?auto_647685 ) ) ( not ( = ?auto_647679 ?auto_647686 ) ) ( not ( = ?auto_647679 ?auto_647687 ) ) ( not ( = ?auto_647679 ?auto_647688 ) ) ( not ( = ?auto_647679 ?auto_647689 ) ) ( not ( = ?auto_647679 ?auto_647690 ) ) ( not ( = ?auto_647679 ?auto_647691 ) ) ( not ( = ?auto_647679 ?auto_647692 ) ) ( not ( = ?auto_647680 ?auto_647681 ) ) ( not ( = ?auto_647680 ?auto_647682 ) ) ( not ( = ?auto_647680 ?auto_647683 ) ) ( not ( = ?auto_647680 ?auto_647684 ) ) ( not ( = ?auto_647680 ?auto_647685 ) ) ( not ( = ?auto_647680 ?auto_647686 ) ) ( not ( = ?auto_647680 ?auto_647687 ) ) ( not ( = ?auto_647680 ?auto_647688 ) ) ( not ( = ?auto_647680 ?auto_647689 ) ) ( not ( = ?auto_647680 ?auto_647690 ) ) ( not ( = ?auto_647680 ?auto_647691 ) ) ( not ( = ?auto_647680 ?auto_647692 ) ) ( not ( = ?auto_647681 ?auto_647682 ) ) ( not ( = ?auto_647681 ?auto_647683 ) ) ( not ( = ?auto_647681 ?auto_647684 ) ) ( not ( = ?auto_647681 ?auto_647685 ) ) ( not ( = ?auto_647681 ?auto_647686 ) ) ( not ( = ?auto_647681 ?auto_647687 ) ) ( not ( = ?auto_647681 ?auto_647688 ) ) ( not ( = ?auto_647681 ?auto_647689 ) ) ( not ( = ?auto_647681 ?auto_647690 ) ) ( not ( = ?auto_647681 ?auto_647691 ) ) ( not ( = ?auto_647681 ?auto_647692 ) ) ( not ( = ?auto_647682 ?auto_647683 ) ) ( not ( = ?auto_647682 ?auto_647684 ) ) ( not ( = ?auto_647682 ?auto_647685 ) ) ( not ( = ?auto_647682 ?auto_647686 ) ) ( not ( = ?auto_647682 ?auto_647687 ) ) ( not ( = ?auto_647682 ?auto_647688 ) ) ( not ( = ?auto_647682 ?auto_647689 ) ) ( not ( = ?auto_647682 ?auto_647690 ) ) ( not ( = ?auto_647682 ?auto_647691 ) ) ( not ( = ?auto_647682 ?auto_647692 ) ) ( not ( = ?auto_647683 ?auto_647684 ) ) ( not ( = ?auto_647683 ?auto_647685 ) ) ( not ( = ?auto_647683 ?auto_647686 ) ) ( not ( = ?auto_647683 ?auto_647687 ) ) ( not ( = ?auto_647683 ?auto_647688 ) ) ( not ( = ?auto_647683 ?auto_647689 ) ) ( not ( = ?auto_647683 ?auto_647690 ) ) ( not ( = ?auto_647683 ?auto_647691 ) ) ( not ( = ?auto_647683 ?auto_647692 ) ) ( not ( = ?auto_647684 ?auto_647685 ) ) ( not ( = ?auto_647684 ?auto_647686 ) ) ( not ( = ?auto_647684 ?auto_647687 ) ) ( not ( = ?auto_647684 ?auto_647688 ) ) ( not ( = ?auto_647684 ?auto_647689 ) ) ( not ( = ?auto_647684 ?auto_647690 ) ) ( not ( = ?auto_647684 ?auto_647691 ) ) ( not ( = ?auto_647684 ?auto_647692 ) ) ( not ( = ?auto_647685 ?auto_647686 ) ) ( not ( = ?auto_647685 ?auto_647687 ) ) ( not ( = ?auto_647685 ?auto_647688 ) ) ( not ( = ?auto_647685 ?auto_647689 ) ) ( not ( = ?auto_647685 ?auto_647690 ) ) ( not ( = ?auto_647685 ?auto_647691 ) ) ( not ( = ?auto_647685 ?auto_647692 ) ) ( not ( = ?auto_647686 ?auto_647687 ) ) ( not ( = ?auto_647686 ?auto_647688 ) ) ( not ( = ?auto_647686 ?auto_647689 ) ) ( not ( = ?auto_647686 ?auto_647690 ) ) ( not ( = ?auto_647686 ?auto_647691 ) ) ( not ( = ?auto_647686 ?auto_647692 ) ) ( not ( = ?auto_647687 ?auto_647688 ) ) ( not ( = ?auto_647687 ?auto_647689 ) ) ( not ( = ?auto_647687 ?auto_647690 ) ) ( not ( = ?auto_647687 ?auto_647691 ) ) ( not ( = ?auto_647687 ?auto_647692 ) ) ( not ( = ?auto_647688 ?auto_647689 ) ) ( not ( = ?auto_647688 ?auto_647690 ) ) ( not ( = ?auto_647688 ?auto_647691 ) ) ( not ( = ?auto_647688 ?auto_647692 ) ) ( not ( = ?auto_647689 ?auto_647690 ) ) ( not ( = ?auto_647689 ?auto_647691 ) ) ( not ( = ?auto_647689 ?auto_647692 ) ) ( not ( = ?auto_647690 ?auto_647691 ) ) ( not ( = ?auto_647690 ?auto_647692 ) ) ( not ( = ?auto_647691 ?auto_647692 ) ) ( ON ?auto_647690 ?auto_647691 ) ( ON ?auto_647689 ?auto_647690 ) ( ON ?auto_647688 ?auto_647689 ) ( ON ?auto_647687 ?auto_647688 ) ( ON ?auto_647686 ?auto_647687 ) ( ON ?auto_647685 ?auto_647686 ) ( ON ?auto_647684 ?auto_647685 ) ( ON ?auto_647683 ?auto_647684 ) ( ON ?auto_647682 ?auto_647683 ) ( ON ?auto_647681 ?auto_647682 ) ( ON ?auto_647680 ?auto_647681 ) ( CLEAR ?auto_647678 ) ( ON ?auto_647679 ?auto_647680 ) ( CLEAR ?auto_647679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_647677 ?auto_647678 ?auto_647679 )
      ( MAKE-15PILE ?auto_647677 ?auto_647678 ?auto_647679 ?auto_647680 ?auto_647681 ?auto_647682 ?auto_647683 ?auto_647684 ?auto_647685 ?auto_647686 ?auto_647687 ?auto_647688 ?auto_647689 ?auto_647690 ?auto_647691 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647739 - BLOCK
      ?auto_647740 - BLOCK
      ?auto_647741 - BLOCK
      ?auto_647742 - BLOCK
      ?auto_647743 - BLOCK
      ?auto_647744 - BLOCK
      ?auto_647745 - BLOCK
      ?auto_647746 - BLOCK
      ?auto_647747 - BLOCK
      ?auto_647748 - BLOCK
      ?auto_647749 - BLOCK
      ?auto_647750 - BLOCK
      ?auto_647751 - BLOCK
      ?auto_647752 - BLOCK
      ?auto_647753 - BLOCK
    )
    :vars
    (
      ?auto_647754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647753 ?auto_647754 ) ( ON-TABLE ?auto_647739 ) ( not ( = ?auto_647739 ?auto_647740 ) ) ( not ( = ?auto_647739 ?auto_647741 ) ) ( not ( = ?auto_647739 ?auto_647742 ) ) ( not ( = ?auto_647739 ?auto_647743 ) ) ( not ( = ?auto_647739 ?auto_647744 ) ) ( not ( = ?auto_647739 ?auto_647745 ) ) ( not ( = ?auto_647739 ?auto_647746 ) ) ( not ( = ?auto_647739 ?auto_647747 ) ) ( not ( = ?auto_647739 ?auto_647748 ) ) ( not ( = ?auto_647739 ?auto_647749 ) ) ( not ( = ?auto_647739 ?auto_647750 ) ) ( not ( = ?auto_647739 ?auto_647751 ) ) ( not ( = ?auto_647739 ?auto_647752 ) ) ( not ( = ?auto_647739 ?auto_647753 ) ) ( not ( = ?auto_647739 ?auto_647754 ) ) ( not ( = ?auto_647740 ?auto_647741 ) ) ( not ( = ?auto_647740 ?auto_647742 ) ) ( not ( = ?auto_647740 ?auto_647743 ) ) ( not ( = ?auto_647740 ?auto_647744 ) ) ( not ( = ?auto_647740 ?auto_647745 ) ) ( not ( = ?auto_647740 ?auto_647746 ) ) ( not ( = ?auto_647740 ?auto_647747 ) ) ( not ( = ?auto_647740 ?auto_647748 ) ) ( not ( = ?auto_647740 ?auto_647749 ) ) ( not ( = ?auto_647740 ?auto_647750 ) ) ( not ( = ?auto_647740 ?auto_647751 ) ) ( not ( = ?auto_647740 ?auto_647752 ) ) ( not ( = ?auto_647740 ?auto_647753 ) ) ( not ( = ?auto_647740 ?auto_647754 ) ) ( not ( = ?auto_647741 ?auto_647742 ) ) ( not ( = ?auto_647741 ?auto_647743 ) ) ( not ( = ?auto_647741 ?auto_647744 ) ) ( not ( = ?auto_647741 ?auto_647745 ) ) ( not ( = ?auto_647741 ?auto_647746 ) ) ( not ( = ?auto_647741 ?auto_647747 ) ) ( not ( = ?auto_647741 ?auto_647748 ) ) ( not ( = ?auto_647741 ?auto_647749 ) ) ( not ( = ?auto_647741 ?auto_647750 ) ) ( not ( = ?auto_647741 ?auto_647751 ) ) ( not ( = ?auto_647741 ?auto_647752 ) ) ( not ( = ?auto_647741 ?auto_647753 ) ) ( not ( = ?auto_647741 ?auto_647754 ) ) ( not ( = ?auto_647742 ?auto_647743 ) ) ( not ( = ?auto_647742 ?auto_647744 ) ) ( not ( = ?auto_647742 ?auto_647745 ) ) ( not ( = ?auto_647742 ?auto_647746 ) ) ( not ( = ?auto_647742 ?auto_647747 ) ) ( not ( = ?auto_647742 ?auto_647748 ) ) ( not ( = ?auto_647742 ?auto_647749 ) ) ( not ( = ?auto_647742 ?auto_647750 ) ) ( not ( = ?auto_647742 ?auto_647751 ) ) ( not ( = ?auto_647742 ?auto_647752 ) ) ( not ( = ?auto_647742 ?auto_647753 ) ) ( not ( = ?auto_647742 ?auto_647754 ) ) ( not ( = ?auto_647743 ?auto_647744 ) ) ( not ( = ?auto_647743 ?auto_647745 ) ) ( not ( = ?auto_647743 ?auto_647746 ) ) ( not ( = ?auto_647743 ?auto_647747 ) ) ( not ( = ?auto_647743 ?auto_647748 ) ) ( not ( = ?auto_647743 ?auto_647749 ) ) ( not ( = ?auto_647743 ?auto_647750 ) ) ( not ( = ?auto_647743 ?auto_647751 ) ) ( not ( = ?auto_647743 ?auto_647752 ) ) ( not ( = ?auto_647743 ?auto_647753 ) ) ( not ( = ?auto_647743 ?auto_647754 ) ) ( not ( = ?auto_647744 ?auto_647745 ) ) ( not ( = ?auto_647744 ?auto_647746 ) ) ( not ( = ?auto_647744 ?auto_647747 ) ) ( not ( = ?auto_647744 ?auto_647748 ) ) ( not ( = ?auto_647744 ?auto_647749 ) ) ( not ( = ?auto_647744 ?auto_647750 ) ) ( not ( = ?auto_647744 ?auto_647751 ) ) ( not ( = ?auto_647744 ?auto_647752 ) ) ( not ( = ?auto_647744 ?auto_647753 ) ) ( not ( = ?auto_647744 ?auto_647754 ) ) ( not ( = ?auto_647745 ?auto_647746 ) ) ( not ( = ?auto_647745 ?auto_647747 ) ) ( not ( = ?auto_647745 ?auto_647748 ) ) ( not ( = ?auto_647745 ?auto_647749 ) ) ( not ( = ?auto_647745 ?auto_647750 ) ) ( not ( = ?auto_647745 ?auto_647751 ) ) ( not ( = ?auto_647745 ?auto_647752 ) ) ( not ( = ?auto_647745 ?auto_647753 ) ) ( not ( = ?auto_647745 ?auto_647754 ) ) ( not ( = ?auto_647746 ?auto_647747 ) ) ( not ( = ?auto_647746 ?auto_647748 ) ) ( not ( = ?auto_647746 ?auto_647749 ) ) ( not ( = ?auto_647746 ?auto_647750 ) ) ( not ( = ?auto_647746 ?auto_647751 ) ) ( not ( = ?auto_647746 ?auto_647752 ) ) ( not ( = ?auto_647746 ?auto_647753 ) ) ( not ( = ?auto_647746 ?auto_647754 ) ) ( not ( = ?auto_647747 ?auto_647748 ) ) ( not ( = ?auto_647747 ?auto_647749 ) ) ( not ( = ?auto_647747 ?auto_647750 ) ) ( not ( = ?auto_647747 ?auto_647751 ) ) ( not ( = ?auto_647747 ?auto_647752 ) ) ( not ( = ?auto_647747 ?auto_647753 ) ) ( not ( = ?auto_647747 ?auto_647754 ) ) ( not ( = ?auto_647748 ?auto_647749 ) ) ( not ( = ?auto_647748 ?auto_647750 ) ) ( not ( = ?auto_647748 ?auto_647751 ) ) ( not ( = ?auto_647748 ?auto_647752 ) ) ( not ( = ?auto_647748 ?auto_647753 ) ) ( not ( = ?auto_647748 ?auto_647754 ) ) ( not ( = ?auto_647749 ?auto_647750 ) ) ( not ( = ?auto_647749 ?auto_647751 ) ) ( not ( = ?auto_647749 ?auto_647752 ) ) ( not ( = ?auto_647749 ?auto_647753 ) ) ( not ( = ?auto_647749 ?auto_647754 ) ) ( not ( = ?auto_647750 ?auto_647751 ) ) ( not ( = ?auto_647750 ?auto_647752 ) ) ( not ( = ?auto_647750 ?auto_647753 ) ) ( not ( = ?auto_647750 ?auto_647754 ) ) ( not ( = ?auto_647751 ?auto_647752 ) ) ( not ( = ?auto_647751 ?auto_647753 ) ) ( not ( = ?auto_647751 ?auto_647754 ) ) ( not ( = ?auto_647752 ?auto_647753 ) ) ( not ( = ?auto_647752 ?auto_647754 ) ) ( not ( = ?auto_647753 ?auto_647754 ) ) ( ON ?auto_647752 ?auto_647753 ) ( ON ?auto_647751 ?auto_647752 ) ( ON ?auto_647750 ?auto_647751 ) ( ON ?auto_647749 ?auto_647750 ) ( ON ?auto_647748 ?auto_647749 ) ( ON ?auto_647747 ?auto_647748 ) ( ON ?auto_647746 ?auto_647747 ) ( ON ?auto_647745 ?auto_647746 ) ( ON ?auto_647744 ?auto_647745 ) ( ON ?auto_647743 ?auto_647744 ) ( ON ?auto_647742 ?auto_647743 ) ( ON ?auto_647741 ?auto_647742 ) ( CLEAR ?auto_647739 ) ( ON ?auto_647740 ?auto_647741 ) ( CLEAR ?auto_647740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_647739 ?auto_647740 )
      ( MAKE-15PILE ?auto_647739 ?auto_647740 ?auto_647741 ?auto_647742 ?auto_647743 ?auto_647744 ?auto_647745 ?auto_647746 ?auto_647747 ?auto_647748 ?auto_647749 ?auto_647750 ?auto_647751 ?auto_647752 ?auto_647753 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_647801 - BLOCK
      ?auto_647802 - BLOCK
      ?auto_647803 - BLOCK
      ?auto_647804 - BLOCK
      ?auto_647805 - BLOCK
      ?auto_647806 - BLOCK
      ?auto_647807 - BLOCK
      ?auto_647808 - BLOCK
      ?auto_647809 - BLOCK
      ?auto_647810 - BLOCK
      ?auto_647811 - BLOCK
      ?auto_647812 - BLOCK
      ?auto_647813 - BLOCK
      ?auto_647814 - BLOCK
      ?auto_647815 - BLOCK
    )
    :vars
    (
      ?auto_647816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647815 ?auto_647816 ) ( not ( = ?auto_647801 ?auto_647802 ) ) ( not ( = ?auto_647801 ?auto_647803 ) ) ( not ( = ?auto_647801 ?auto_647804 ) ) ( not ( = ?auto_647801 ?auto_647805 ) ) ( not ( = ?auto_647801 ?auto_647806 ) ) ( not ( = ?auto_647801 ?auto_647807 ) ) ( not ( = ?auto_647801 ?auto_647808 ) ) ( not ( = ?auto_647801 ?auto_647809 ) ) ( not ( = ?auto_647801 ?auto_647810 ) ) ( not ( = ?auto_647801 ?auto_647811 ) ) ( not ( = ?auto_647801 ?auto_647812 ) ) ( not ( = ?auto_647801 ?auto_647813 ) ) ( not ( = ?auto_647801 ?auto_647814 ) ) ( not ( = ?auto_647801 ?auto_647815 ) ) ( not ( = ?auto_647801 ?auto_647816 ) ) ( not ( = ?auto_647802 ?auto_647803 ) ) ( not ( = ?auto_647802 ?auto_647804 ) ) ( not ( = ?auto_647802 ?auto_647805 ) ) ( not ( = ?auto_647802 ?auto_647806 ) ) ( not ( = ?auto_647802 ?auto_647807 ) ) ( not ( = ?auto_647802 ?auto_647808 ) ) ( not ( = ?auto_647802 ?auto_647809 ) ) ( not ( = ?auto_647802 ?auto_647810 ) ) ( not ( = ?auto_647802 ?auto_647811 ) ) ( not ( = ?auto_647802 ?auto_647812 ) ) ( not ( = ?auto_647802 ?auto_647813 ) ) ( not ( = ?auto_647802 ?auto_647814 ) ) ( not ( = ?auto_647802 ?auto_647815 ) ) ( not ( = ?auto_647802 ?auto_647816 ) ) ( not ( = ?auto_647803 ?auto_647804 ) ) ( not ( = ?auto_647803 ?auto_647805 ) ) ( not ( = ?auto_647803 ?auto_647806 ) ) ( not ( = ?auto_647803 ?auto_647807 ) ) ( not ( = ?auto_647803 ?auto_647808 ) ) ( not ( = ?auto_647803 ?auto_647809 ) ) ( not ( = ?auto_647803 ?auto_647810 ) ) ( not ( = ?auto_647803 ?auto_647811 ) ) ( not ( = ?auto_647803 ?auto_647812 ) ) ( not ( = ?auto_647803 ?auto_647813 ) ) ( not ( = ?auto_647803 ?auto_647814 ) ) ( not ( = ?auto_647803 ?auto_647815 ) ) ( not ( = ?auto_647803 ?auto_647816 ) ) ( not ( = ?auto_647804 ?auto_647805 ) ) ( not ( = ?auto_647804 ?auto_647806 ) ) ( not ( = ?auto_647804 ?auto_647807 ) ) ( not ( = ?auto_647804 ?auto_647808 ) ) ( not ( = ?auto_647804 ?auto_647809 ) ) ( not ( = ?auto_647804 ?auto_647810 ) ) ( not ( = ?auto_647804 ?auto_647811 ) ) ( not ( = ?auto_647804 ?auto_647812 ) ) ( not ( = ?auto_647804 ?auto_647813 ) ) ( not ( = ?auto_647804 ?auto_647814 ) ) ( not ( = ?auto_647804 ?auto_647815 ) ) ( not ( = ?auto_647804 ?auto_647816 ) ) ( not ( = ?auto_647805 ?auto_647806 ) ) ( not ( = ?auto_647805 ?auto_647807 ) ) ( not ( = ?auto_647805 ?auto_647808 ) ) ( not ( = ?auto_647805 ?auto_647809 ) ) ( not ( = ?auto_647805 ?auto_647810 ) ) ( not ( = ?auto_647805 ?auto_647811 ) ) ( not ( = ?auto_647805 ?auto_647812 ) ) ( not ( = ?auto_647805 ?auto_647813 ) ) ( not ( = ?auto_647805 ?auto_647814 ) ) ( not ( = ?auto_647805 ?auto_647815 ) ) ( not ( = ?auto_647805 ?auto_647816 ) ) ( not ( = ?auto_647806 ?auto_647807 ) ) ( not ( = ?auto_647806 ?auto_647808 ) ) ( not ( = ?auto_647806 ?auto_647809 ) ) ( not ( = ?auto_647806 ?auto_647810 ) ) ( not ( = ?auto_647806 ?auto_647811 ) ) ( not ( = ?auto_647806 ?auto_647812 ) ) ( not ( = ?auto_647806 ?auto_647813 ) ) ( not ( = ?auto_647806 ?auto_647814 ) ) ( not ( = ?auto_647806 ?auto_647815 ) ) ( not ( = ?auto_647806 ?auto_647816 ) ) ( not ( = ?auto_647807 ?auto_647808 ) ) ( not ( = ?auto_647807 ?auto_647809 ) ) ( not ( = ?auto_647807 ?auto_647810 ) ) ( not ( = ?auto_647807 ?auto_647811 ) ) ( not ( = ?auto_647807 ?auto_647812 ) ) ( not ( = ?auto_647807 ?auto_647813 ) ) ( not ( = ?auto_647807 ?auto_647814 ) ) ( not ( = ?auto_647807 ?auto_647815 ) ) ( not ( = ?auto_647807 ?auto_647816 ) ) ( not ( = ?auto_647808 ?auto_647809 ) ) ( not ( = ?auto_647808 ?auto_647810 ) ) ( not ( = ?auto_647808 ?auto_647811 ) ) ( not ( = ?auto_647808 ?auto_647812 ) ) ( not ( = ?auto_647808 ?auto_647813 ) ) ( not ( = ?auto_647808 ?auto_647814 ) ) ( not ( = ?auto_647808 ?auto_647815 ) ) ( not ( = ?auto_647808 ?auto_647816 ) ) ( not ( = ?auto_647809 ?auto_647810 ) ) ( not ( = ?auto_647809 ?auto_647811 ) ) ( not ( = ?auto_647809 ?auto_647812 ) ) ( not ( = ?auto_647809 ?auto_647813 ) ) ( not ( = ?auto_647809 ?auto_647814 ) ) ( not ( = ?auto_647809 ?auto_647815 ) ) ( not ( = ?auto_647809 ?auto_647816 ) ) ( not ( = ?auto_647810 ?auto_647811 ) ) ( not ( = ?auto_647810 ?auto_647812 ) ) ( not ( = ?auto_647810 ?auto_647813 ) ) ( not ( = ?auto_647810 ?auto_647814 ) ) ( not ( = ?auto_647810 ?auto_647815 ) ) ( not ( = ?auto_647810 ?auto_647816 ) ) ( not ( = ?auto_647811 ?auto_647812 ) ) ( not ( = ?auto_647811 ?auto_647813 ) ) ( not ( = ?auto_647811 ?auto_647814 ) ) ( not ( = ?auto_647811 ?auto_647815 ) ) ( not ( = ?auto_647811 ?auto_647816 ) ) ( not ( = ?auto_647812 ?auto_647813 ) ) ( not ( = ?auto_647812 ?auto_647814 ) ) ( not ( = ?auto_647812 ?auto_647815 ) ) ( not ( = ?auto_647812 ?auto_647816 ) ) ( not ( = ?auto_647813 ?auto_647814 ) ) ( not ( = ?auto_647813 ?auto_647815 ) ) ( not ( = ?auto_647813 ?auto_647816 ) ) ( not ( = ?auto_647814 ?auto_647815 ) ) ( not ( = ?auto_647814 ?auto_647816 ) ) ( not ( = ?auto_647815 ?auto_647816 ) ) ( ON ?auto_647814 ?auto_647815 ) ( ON ?auto_647813 ?auto_647814 ) ( ON ?auto_647812 ?auto_647813 ) ( ON ?auto_647811 ?auto_647812 ) ( ON ?auto_647810 ?auto_647811 ) ( ON ?auto_647809 ?auto_647810 ) ( ON ?auto_647808 ?auto_647809 ) ( ON ?auto_647807 ?auto_647808 ) ( ON ?auto_647806 ?auto_647807 ) ( ON ?auto_647805 ?auto_647806 ) ( ON ?auto_647804 ?auto_647805 ) ( ON ?auto_647803 ?auto_647804 ) ( ON ?auto_647802 ?auto_647803 ) ( ON ?auto_647801 ?auto_647802 ) ( CLEAR ?auto_647801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_647801 )
      ( MAKE-15PILE ?auto_647801 ?auto_647802 ?auto_647803 ?auto_647804 ?auto_647805 ?auto_647806 ?auto_647807 ?auto_647808 ?auto_647809 ?auto_647810 ?auto_647811 ?auto_647812 ?auto_647813 ?auto_647814 ?auto_647815 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_647864 - BLOCK
      ?auto_647865 - BLOCK
      ?auto_647866 - BLOCK
      ?auto_647867 - BLOCK
      ?auto_647868 - BLOCK
      ?auto_647869 - BLOCK
      ?auto_647870 - BLOCK
      ?auto_647871 - BLOCK
      ?auto_647872 - BLOCK
      ?auto_647873 - BLOCK
      ?auto_647874 - BLOCK
      ?auto_647875 - BLOCK
      ?auto_647876 - BLOCK
      ?auto_647877 - BLOCK
      ?auto_647878 - BLOCK
      ?auto_647879 - BLOCK
    )
    :vars
    (
      ?auto_647880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_647878 ) ( ON ?auto_647879 ?auto_647880 ) ( CLEAR ?auto_647879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_647864 ) ( ON ?auto_647865 ?auto_647864 ) ( ON ?auto_647866 ?auto_647865 ) ( ON ?auto_647867 ?auto_647866 ) ( ON ?auto_647868 ?auto_647867 ) ( ON ?auto_647869 ?auto_647868 ) ( ON ?auto_647870 ?auto_647869 ) ( ON ?auto_647871 ?auto_647870 ) ( ON ?auto_647872 ?auto_647871 ) ( ON ?auto_647873 ?auto_647872 ) ( ON ?auto_647874 ?auto_647873 ) ( ON ?auto_647875 ?auto_647874 ) ( ON ?auto_647876 ?auto_647875 ) ( ON ?auto_647877 ?auto_647876 ) ( ON ?auto_647878 ?auto_647877 ) ( not ( = ?auto_647864 ?auto_647865 ) ) ( not ( = ?auto_647864 ?auto_647866 ) ) ( not ( = ?auto_647864 ?auto_647867 ) ) ( not ( = ?auto_647864 ?auto_647868 ) ) ( not ( = ?auto_647864 ?auto_647869 ) ) ( not ( = ?auto_647864 ?auto_647870 ) ) ( not ( = ?auto_647864 ?auto_647871 ) ) ( not ( = ?auto_647864 ?auto_647872 ) ) ( not ( = ?auto_647864 ?auto_647873 ) ) ( not ( = ?auto_647864 ?auto_647874 ) ) ( not ( = ?auto_647864 ?auto_647875 ) ) ( not ( = ?auto_647864 ?auto_647876 ) ) ( not ( = ?auto_647864 ?auto_647877 ) ) ( not ( = ?auto_647864 ?auto_647878 ) ) ( not ( = ?auto_647864 ?auto_647879 ) ) ( not ( = ?auto_647864 ?auto_647880 ) ) ( not ( = ?auto_647865 ?auto_647866 ) ) ( not ( = ?auto_647865 ?auto_647867 ) ) ( not ( = ?auto_647865 ?auto_647868 ) ) ( not ( = ?auto_647865 ?auto_647869 ) ) ( not ( = ?auto_647865 ?auto_647870 ) ) ( not ( = ?auto_647865 ?auto_647871 ) ) ( not ( = ?auto_647865 ?auto_647872 ) ) ( not ( = ?auto_647865 ?auto_647873 ) ) ( not ( = ?auto_647865 ?auto_647874 ) ) ( not ( = ?auto_647865 ?auto_647875 ) ) ( not ( = ?auto_647865 ?auto_647876 ) ) ( not ( = ?auto_647865 ?auto_647877 ) ) ( not ( = ?auto_647865 ?auto_647878 ) ) ( not ( = ?auto_647865 ?auto_647879 ) ) ( not ( = ?auto_647865 ?auto_647880 ) ) ( not ( = ?auto_647866 ?auto_647867 ) ) ( not ( = ?auto_647866 ?auto_647868 ) ) ( not ( = ?auto_647866 ?auto_647869 ) ) ( not ( = ?auto_647866 ?auto_647870 ) ) ( not ( = ?auto_647866 ?auto_647871 ) ) ( not ( = ?auto_647866 ?auto_647872 ) ) ( not ( = ?auto_647866 ?auto_647873 ) ) ( not ( = ?auto_647866 ?auto_647874 ) ) ( not ( = ?auto_647866 ?auto_647875 ) ) ( not ( = ?auto_647866 ?auto_647876 ) ) ( not ( = ?auto_647866 ?auto_647877 ) ) ( not ( = ?auto_647866 ?auto_647878 ) ) ( not ( = ?auto_647866 ?auto_647879 ) ) ( not ( = ?auto_647866 ?auto_647880 ) ) ( not ( = ?auto_647867 ?auto_647868 ) ) ( not ( = ?auto_647867 ?auto_647869 ) ) ( not ( = ?auto_647867 ?auto_647870 ) ) ( not ( = ?auto_647867 ?auto_647871 ) ) ( not ( = ?auto_647867 ?auto_647872 ) ) ( not ( = ?auto_647867 ?auto_647873 ) ) ( not ( = ?auto_647867 ?auto_647874 ) ) ( not ( = ?auto_647867 ?auto_647875 ) ) ( not ( = ?auto_647867 ?auto_647876 ) ) ( not ( = ?auto_647867 ?auto_647877 ) ) ( not ( = ?auto_647867 ?auto_647878 ) ) ( not ( = ?auto_647867 ?auto_647879 ) ) ( not ( = ?auto_647867 ?auto_647880 ) ) ( not ( = ?auto_647868 ?auto_647869 ) ) ( not ( = ?auto_647868 ?auto_647870 ) ) ( not ( = ?auto_647868 ?auto_647871 ) ) ( not ( = ?auto_647868 ?auto_647872 ) ) ( not ( = ?auto_647868 ?auto_647873 ) ) ( not ( = ?auto_647868 ?auto_647874 ) ) ( not ( = ?auto_647868 ?auto_647875 ) ) ( not ( = ?auto_647868 ?auto_647876 ) ) ( not ( = ?auto_647868 ?auto_647877 ) ) ( not ( = ?auto_647868 ?auto_647878 ) ) ( not ( = ?auto_647868 ?auto_647879 ) ) ( not ( = ?auto_647868 ?auto_647880 ) ) ( not ( = ?auto_647869 ?auto_647870 ) ) ( not ( = ?auto_647869 ?auto_647871 ) ) ( not ( = ?auto_647869 ?auto_647872 ) ) ( not ( = ?auto_647869 ?auto_647873 ) ) ( not ( = ?auto_647869 ?auto_647874 ) ) ( not ( = ?auto_647869 ?auto_647875 ) ) ( not ( = ?auto_647869 ?auto_647876 ) ) ( not ( = ?auto_647869 ?auto_647877 ) ) ( not ( = ?auto_647869 ?auto_647878 ) ) ( not ( = ?auto_647869 ?auto_647879 ) ) ( not ( = ?auto_647869 ?auto_647880 ) ) ( not ( = ?auto_647870 ?auto_647871 ) ) ( not ( = ?auto_647870 ?auto_647872 ) ) ( not ( = ?auto_647870 ?auto_647873 ) ) ( not ( = ?auto_647870 ?auto_647874 ) ) ( not ( = ?auto_647870 ?auto_647875 ) ) ( not ( = ?auto_647870 ?auto_647876 ) ) ( not ( = ?auto_647870 ?auto_647877 ) ) ( not ( = ?auto_647870 ?auto_647878 ) ) ( not ( = ?auto_647870 ?auto_647879 ) ) ( not ( = ?auto_647870 ?auto_647880 ) ) ( not ( = ?auto_647871 ?auto_647872 ) ) ( not ( = ?auto_647871 ?auto_647873 ) ) ( not ( = ?auto_647871 ?auto_647874 ) ) ( not ( = ?auto_647871 ?auto_647875 ) ) ( not ( = ?auto_647871 ?auto_647876 ) ) ( not ( = ?auto_647871 ?auto_647877 ) ) ( not ( = ?auto_647871 ?auto_647878 ) ) ( not ( = ?auto_647871 ?auto_647879 ) ) ( not ( = ?auto_647871 ?auto_647880 ) ) ( not ( = ?auto_647872 ?auto_647873 ) ) ( not ( = ?auto_647872 ?auto_647874 ) ) ( not ( = ?auto_647872 ?auto_647875 ) ) ( not ( = ?auto_647872 ?auto_647876 ) ) ( not ( = ?auto_647872 ?auto_647877 ) ) ( not ( = ?auto_647872 ?auto_647878 ) ) ( not ( = ?auto_647872 ?auto_647879 ) ) ( not ( = ?auto_647872 ?auto_647880 ) ) ( not ( = ?auto_647873 ?auto_647874 ) ) ( not ( = ?auto_647873 ?auto_647875 ) ) ( not ( = ?auto_647873 ?auto_647876 ) ) ( not ( = ?auto_647873 ?auto_647877 ) ) ( not ( = ?auto_647873 ?auto_647878 ) ) ( not ( = ?auto_647873 ?auto_647879 ) ) ( not ( = ?auto_647873 ?auto_647880 ) ) ( not ( = ?auto_647874 ?auto_647875 ) ) ( not ( = ?auto_647874 ?auto_647876 ) ) ( not ( = ?auto_647874 ?auto_647877 ) ) ( not ( = ?auto_647874 ?auto_647878 ) ) ( not ( = ?auto_647874 ?auto_647879 ) ) ( not ( = ?auto_647874 ?auto_647880 ) ) ( not ( = ?auto_647875 ?auto_647876 ) ) ( not ( = ?auto_647875 ?auto_647877 ) ) ( not ( = ?auto_647875 ?auto_647878 ) ) ( not ( = ?auto_647875 ?auto_647879 ) ) ( not ( = ?auto_647875 ?auto_647880 ) ) ( not ( = ?auto_647876 ?auto_647877 ) ) ( not ( = ?auto_647876 ?auto_647878 ) ) ( not ( = ?auto_647876 ?auto_647879 ) ) ( not ( = ?auto_647876 ?auto_647880 ) ) ( not ( = ?auto_647877 ?auto_647878 ) ) ( not ( = ?auto_647877 ?auto_647879 ) ) ( not ( = ?auto_647877 ?auto_647880 ) ) ( not ( = ?auto_647878 ?auto_647879 ) ) ( not ( = ?auto_647878 ?auto_647880 ) ) ( not ( = ?auto_647879 ?auto_647880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_647879 ?auto_647880 )
      ( !STACK ?auto_647879 ?auto_647878 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_647930 - BLOCK
      ?auto_647931 - BLOCK
      ?auto_647932 - BLOCK
      ?auto_647933 - BLOCK
      ?auto_647934 - BLOCK
      ?auto_647935 - BLOCK
      ?auto_647936 - BLOCK
      ?auto_647937 - BLOCK
      ?auto_647938 - BLOCK
      ?auto_647939 - BLOCK
      ?auto_647940 - BLOCK
      ?auto_647941 - BLOCK
      ?auto_647942 - BLOCK
      ?auto_647943 - BLOCK
      ?auto_647944 - BLOCK
      ?auto_647945 - BLOCK
    )
    :vars
    (
      ?auto_647946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_647945 ?auto_647946 ) ( ON-TABLE ?auto_647930 ) ( ON ?auto_647931 ?auto_647930 ) ( ON ?auto_647932 ?auto_647931 ) ( ON ?auto_647933 ?auto_647932 ) ( ON ?auto_647934 ?auto_647933 ) ( ON ?auto_647935 ?auto_647934 ) ( ON ?auto_647936 ?auto_647935 ) ( ON ?auto_647937 ?auto_647936 ) ( ON ?auto_647938 ?auto_647937 ) ( ON ?auto_647939 ?auto_647938 ) ( ON ?auto_647940 ?auto_647939 ) ( ON ?auto_647941 ?auto_647940 ) ( ON ?auto_647942 ?auto_647941 ) ( ON ?auto_647943 ?auto_647942 ) ( not ( = ?auto_647930 ?auto_647931 ) ) ( not ( = ?auto_647930 ?auto_647932 ) ) ( not ( = ?auto_647930 ?auto_647933 ) ) ( not ( = ?auto_647930 ?auto_647934 ) ) ( not ( = ?auto_647930 ?auto_647935 ) ) ( not ( = ?auto_647930 ?auto_647936 ) ) ( not ( = ?auto_647930 ?auto_647937 ) ) ( not ( = ?auto_647930 ?auto_647938 ) ) ( not ( = ?auto_647930 ?auto_647939 ) ) ( not ( = ?auto_647930 ?auto_647940 ) ) ( not ( = ?auto_647930 ?auto_647941 ) ) ( not ( = ?auto_647930 ?auto_647942 ) ) ( not ( = ?auto_647930 ?auto_647943 ) ) ( not ( = ?auto_647930 ?auto_647944 ) ) ( not ( = ?auto_647930 ?auto_647945 ) ) ( not ( = ?auto_647930 ?auto_647946 ) ) ( not ( = ?auto_647931 ?auto_647932 ) ) ( not ( = ?auto_647931 ?auto_647933 ) ) ( not ( = ?auto_647931 ?auto_647934 ) ) ( not ( = ?auto_647931 ?auto_647935 ) ) ( not ( = ?auto_647931 ?auto_647936 ) ) ( not ( = ?auto_647931 ?auto_647937 ) ) ( not ( = ?auto_647931 ?auto_647938 ) ) ( not ( = ?auto_647931 ?auto_647939 ) ) ( not ( = ?auto_647931 ?auto_647940 ) ) ( not ( = ?auto_647931 ?auto_647941 ) ) ( not ( = ?auto_647931 ?auto_647942 ) ) ( not ( = ?auto_647931 ?auto_647943 ) ) ( not ( = ?auto_647931 ?auto_647944 ) ) ( not ( = ?auto_647931 ?auto_647945 ) ) ( not ( = ?auto_647931 ?auto_647946 ) ) ( not ( = ?auto_647932 ?auto_647933 ) ) ( not ( = ?auto_647932 ?auto_647934 ) ) ( not ( = ?auto_647932 ?auto_647935 ) ) ( not ( = ?auto_647932 ?auto_647936 ) ) ( not ( = ?auto_647932 ?auto_647937 ) ) ( not ( = ?auto_647932 ?auto_647938 ) ) ( not ( = ?auto_647932 ?auto_647939 ) ) ( not ( = ?auto_647932 ?auto_647940 ) ) ( not ( = ?auto_647932 ?auto_647941 ) ) ( not ( = ?auto_647932 ?auto_647942 ) ) ( not ( = ?auto_647932 ?auto_647943 ) ) ( not ( = ?auto_647932 ?auto_647944 ) ) ( not ( = ?auto_647932 ?auto_647945 ) ) ( not ( = ?auto_647932 ?auto_647946 ) ) ( not ( = ?auto_647933 ?auto_647934 ) ) ( not ( = ?auto_647933 ?auto_647935 ) ) ( not ( = ?auto_647933 ?auto_647936 ) ) ( not ( = ?auto_647933 ?auto_647937 ) ) ( not ( = ?auto_647933 ?auto_647938 ) ) ( not ( = ?auto_647933 ?auto_647939 ) ) ( not ( = ?auto_647933 ?auto_647940 ) ) ( not ( = ?auto_647933 ?auto_647941 ) ) ( not ( = ?auto_647933 ?auto_647942 ) ) ( not ( = ?auto_647933 ?auto_647943 ) ) ( not ( = ?auto_647933 ?auto_647944 ) ) ( not ( = ?auto_647933 ?auto_647945 ) ) ( not ( = ?auto_647933 ?auto_647946 ) ) ( not ( = ?auto_647934 ?auto_647935 ) ) ( not ( = ?auto_647934 ?auto_647936 ) ) ( not ( = ?auto_647934 ?auto_647937 ) ) ( not ( = ?auto_647934 ?auto_647938 ) ) ( not ( = ?auto_647934 ?auto_647939 ) ) ( not ( = ?auto_647934 ?auto_647940 ) ) ( not ( = ?auto_647934 ?auto_647941 ) ) ( not ( = ?auto_647934 ?auto_647942 ) ) ( not ( = ?auto_647934 ?auto_647943 ) ) ( not ( = ?auto_647934 ?auto_647944 ) ) ( not ( = ?auto_647934 ?auto_647945 ) ) ( not ( = ?auto_647934 ?auto_647946 ) ) ( not ( = ?auto_647935 ?auto_647936 ) ) ( not ( = ?auto_647935 ?auto_647937 ) ) ( not ( = ?auto_647935 ?auto_647938 ) ) ( not ( = ?auto_647935 ?auto_647939 ) ) ( not ( = ?auto_647935 ?auto_647940 ) ) ( not ( = ?auto_647935 ?auto_647941 ) ) ( not ( = ?auto_647935 ?auto_647942 ) ) ( not ( = ?auto_647935 ?auto_647943 ) ) ( not ( = ?auto_647935 ?auto_647944 ) ) ( not ( = ?auto_647935 ?auto_647945 ) ) ( not ( = ?auto_647935 ?auto_647946 ) ) ( not ( = ?auto_647936 ?auto_647937 ) ) ( not ( = ?auto_647936 ?auto_647938 ) ) ( not ( = ?auto_647936 ?auto_647939 ) ) ( not ( = ?auto_647936 ?auto_647940 ) ) ( not ( = ?auto_647936 ?auto_647941 ) ) ( not ( = ?auto_647936 ?auto_647942 ) ) ( not ( = ?auto_647936 ?auto_647943 ) ) ( not ( = ?auto_647936 ?auto_647944 ) ) ( not ( = ?auto_647936 ?auto_647945 ) ) ( not ( = ?auto_647936 ?auto_647946 ) ) ( not ( = ?auto_647937 ?auto_647938 ) ) ( not ( = ?auto_647937 ?auto_647939 ) ) ( not ( = ?auto_647937 ?auto_647940 ) ) ( not ( = ?auto_647937 ?auto_647941 ) ) ( not ( = ?auto_647937 ?auto_647942 ) ) ( not ( = ?auto_647937 ?auto_647943 ) ) ( not ( = ?auto_647937 ?auto_647944 ) ) ( not ( = ?auto_647937 ?auto_647945 ) ) ( not ( = ?auto_647937 ?auto_647946 ) ) ( not ( = ?auto_647938 ?auto_647939 ) ) ( not ( = ?auto_647938 ?auto_647940 ) ) ( not ( = ?auto_647938 ?auto_647941 ) ) ( not ( = ?auto_647938 ?auto_647942 ) ) ( not ( = ?auto_647938 ?auto_647943 ) ) ( not ( = ?auto_647938 ?auto_647944 ) ) ( not ( = ?auto_647938 ?auto_647945 ) ) ( not ( = ?auto_647938 ?auto_647946 ) ) ( not ( = ?auto_647939 ?auto_647940 ) ) ( not ( = ?auto_647939 ?auto_647941 ) ) ( not ( = ?auto_647939 ?auto_647942 ) ) ( not ( = ?auto_647939 ?auto_647943 ) ) ( not ( = ?auto_647939 ?auto_647944 ) ) ( not ( = ?auto_647939 ?auto_647945 ) ) ( not ( = ?auto_647939 ?auto_647946 ) ) ( not ( = ?auto_647940 ?auto_647941 ) ) ( not ( = ?auto_647940 ?auto_647942 ) ) ( not ( = ?auto_647940 ?auto_647943 ) ) ( not ( = ?auto_647940 ?auto_647944 ) ) ( not ( = ?auto_647940 ?auto_647945 ) ) ( not ( = ?auto_647940 ?auto_647946 ) ) ( not ( = ?auto_647941 ?auto_647942 ) ) ( not ( = ?auto_647941 ?auto_647943 ) ) ( not ( = ?auto_647941 ?auto_647944 ) ) ( not ( = ?auto_647941 ?auto_647945 ) ) ( not ( = ?auto_647941 ?auto_647946 ) ) ( not ( = ?auto_647942 ?auto_647943 ) ) ( not ( = ?auto_647942 ?auto_647944 ) ) ( not ( = ?auto_647942 ?auto_647945 ) ) ( not ( = ?auto_647942 ?auto_647946 ) ) ( not ( = ?auto_647943 ?auto_647944 ) ) ( not ( = ?auto_647943 ?auto_647945 ) ) ( not ( = ?auto_647943 ?auto_647946 ) ) ( not ( = ?auto_647944 ?auto_647945 ) ) ( not ( = ?auto_647944 ?auto_647946 ) ) ( not ( = ?auto_647945 ?auto_647946 ) ) ( CLEAR ?auto_647943 ) ( ON ?auto_647944 ?auto_647945 ) ( CLEAR ?auto_647944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_647930 ?auto_647931 ?auto_647932 ?auto_647933 ?auto_647934 ?auto_647935 ?auto_647936 ?auto_647937 ?auto_647938 ?auto_647939 ?auto_647940 ?auto_647941 ?auto_647942 ?auto_647943 ?auto_647944 )
      ( MAKE-16PILE ?auto_647930 ?auto_647931 ?auto_647932 ?auto_647933 ?auto_647934 ?auto_647935 ?auto_647936 ?auto_647937 ?auto_647938 ?auto_647939 ?auto_647940 ?auto_647941 ?auto_647942 ?auto_647943 ?auto_647944 ?auto_647945 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_647996 - BLOCK
      ?auto_647997 - BLOCK
      ?auto_647998 - BLOCK
      ?auto_647999 - BLOCK
      ?auto_648000 - BLOCK
      ?auto_648001 - BLOCK
      ?auto_648002 - BLOCK
      ?auto_648003 - BLOCK
      ?auto_648004 - BLOCK
      ?auto_648005 - BLOCK
      ?auto_648006 - BLOCK
      ?auto_648007 - BLOCK
      ?auto_648008 - BLOCK
      ?auto_648009 - BLOCK
      ?auto_648010 - BLOCK
      ?auto_648011 - BLOCK
    )
    :vars
    (
      ?auto_648012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648011 ?auto_648012 ) ( ON-TABLE ?auto_647996 ) ( ON ?auto_647997 ?auto_647996 ) ( ON ?auto_647998 ?auto_647997 ) ( ON ?auto_647999 ?auto_647998 ) ( ON ?auto_648000 ?auto_647999 ) ( ON ?auto_648001 ?auto_648000 ) ( ON ?auto_648002 ?auto_648001 ) ( ON ?auto_648003 ?auto_648002 ) ( ON ?auto_648004 ?auto_648003 ) ( ON ?auto_648005 ?auto_648004 ) ( ON ?auto_648006 ?auto_648005 ) ( ON ?auto_648007 ?auto_648006 ) ( ON ?auto_648008 ?auto_648007 ) ( not ( = ?auto_647996 ?auto_647997 ) ) ( not ( = ?auto_647996 ?auto_647998 ) ) ( not ( = ?auto_647996 ?auto_647999 ) ) ( not ( = ?auto_647996 ?auto_648000 ) ) ( not ( = ?auto_647996 ?auto_648001 ) ) ( not ( = ?auto_647996 ?auto_648002 ) ) ( not ( = ?auto_647996 ?auto_648003 ) ) ( not ( = ?auto_647996 ?auto_648004 ) ) ( not ( = ?auto_647996 ?auto_648005 ) ) ( not ( = ?auto_647996 ?auto_648006 ) ) ( not ( = ?auto_647996 ?auto_648007 ) ) ( not ( = ?auto_647996 ?auto_648008 ) ) ( not ( = ?auto_647996 ?auto_648009 ) ) ( not ( = ?auto_647996 ?auto_648010 ) ) ( not ( = ?auto_647996 ?auto_648011 ) ) ( not ( = ?auto_647996 ?auto_648012 ) ) ( not ( = ?auto_647997 ?auto_647998 ) ) ( not ( = ?auto_647997 ?auto_647999 ) ) ( not ( = ?auto_647997 ?auto_648000 ) ) ( not ( = ?auto_647997 ?auto_648001 ) ) ( not ( = ?auto_647997 ?auto_648002 ) ) ( not ( = ?auto_647997 ?auto_648003 ) ) ( not ( = ?auto_647997 ?auto_648004 ) ) ( not ( = ?auto_647997 ?auto_648005 ) ) ( not ( = ?auto_647997 ?auto_648006 ) ) ( not ( = ?auto_647997 ?auto_648007 ) ) ( not ( = ?auto_647997 ?auto_648008 ) ) ( not ( = ?auto_647997 ?auto_648009 ) ) ( not ( = ?auto_647997 ?auto_648010 ) ) ( not ( = ?auto_647997 ?auto_648011 ) ) ( not ( = ?auto_647997 ?auto_648012 ) ) ( not ( = ?auto_647998 ?auto_647999 ) ) ( not ( = ?auto_647998 ?auto_648000 ) ) ( not ( = ?auto_647998 ?auto_648001 ) ) ( not ( = ?auto_647998 ?auto_648002 ) ) ( not ( = ?auto_647998 ?auto_648003 ) ) ( not ( = ?auto_647998 ?auto_648004 ) ) ( not ( = ?auto_647998 ?auto_648005 ) ) ( not ( = ?auto_647998 ?auto_648006 ) ) ( not ( = ?auto_647998 ?auto_648007 ) ) ( not ( = ?auto_647998 ?auto_648008 ) ) ( not ( = ?auto_647998 ?auto_648009 ) ) ( not ( = ?auto_647998 ?auto_648010 ) ) ( not ( = ?auto_647998 ?auto_648011 ) ) ( not ( = ?auto_647998 ?auto_648012 ) ) ( not ( = ?auto_647999 ?auto_648000 ) ) ( not ( = ?auto_647999 ?auto_648001 ) ) ( not ( = ?auto_647999 ?auto_648002 ) ) ( not ( = ?auto_647999 ?auto_648003 ) ) ( not ( = ?auto_647999 ?auto_648004 ) ) ( not ( = ?auto_647999 ?auto_648005 ) ) ( not ( = ?auto_647999 ?auto_648006 ) ) ( not ( = ?auto_647999 ?auto_648007 ) ) ( not ( = ?auto_647999 ?auto_648008 ) ) ( not ( = ?auto_647999 ?auto_648009 ) ) ( not ( = ?auto_647999 ?auto_648010 ) ) ( not ( = ?auto_647999 ?auto_648011 ) ) ( not ( = ?auto_647999 ?auto_648012 ) ) ( not ( = ?auto_648000 ?auto_648001 ) ) ( not ( = ?auto_648000 ?auto_648002 ) ) ( not ( = ?auto_648000 ?auto_648003 ) ) ( not ( = ?auto_648000 ?auto_648004 ) ) ( not ( = ?auto_648000 ?auto_648005 ) ) ( not ( = ?auto_648000 ?auto_648006 ) ) ( not ( = ?auto_648000 ?auto_648007 ) ) ( not ( = ?auto_648000 ?auto_648008 ) ) ( not ( = ?auto_648000 ?auto_648009 ) ) ( not ( = ?auto_648000 ?auto_648010 ) ) ( not ( = ?auto_648000 ?auto_648011 ) ) ( not ( = ?auto_648000 ?auto_648012 ) ) ( not ( = ?auto_648001 ?auto_648002 ) ) ( not ( = ?auto_648001 ?auto_648003 ) ) ( not ( = ?auto_648001 ?auto_648004 ) ) ( not ( = ?auto_648001 ?auto_648005 ) ) ( not ( = ?auto_648001 ?auto_648006 ) ) ( not ( = ?auto_648001 ?auto_648007 ) ) ( not ( = ?auto_648001 ?auto_648008 ) ) ( not ( = ?auto_648001 ?auto_648009 ) ) ( not ( = ?auto_648001 ?auto_648010 ) ) ( not ( = ?auto_648001 ?auto_648011 ) ) ( not ( = ?auto_648001 ?auto_648012 ) ) ( not ( = ?auto_648002 ?auto_648003 ) ) ( not ( = ?auto_648002 ?auto_648004 ) ) ( not ( = ?auto_648002 ?auto_648005 ) ) ( not ( = ?auto_648002 ?auto_648006 ) ) ( not ( = ?auto_648002 ?auto_648007 ) ) ( not ( = ?auto_648002 ?auto_648008 ) ) ( not ( = ?auto_648002 ?auto_648009 ) ) ( not ( = ?auto_648002 ?auto_648010 ) ) ( not ( = ?auto_648002 ?auto_648011 ) ) ( not ( = ?auto_648002 ?auto_648012 ) ) ( not ( = ?auto_648003 ?auto_648004 ) ) ( not ( = ?auto_648003 ?auto_648005 ) ) ( not ( = ?auto_648003 ?auto_648006 ) ) ( not ( = ?auto_648003 ?auto_648007 ) ) ( not ( = ?auto_648003 ?auto_648008 ) ) ( not ( = ?auto_648003 ?auto_648009 ) ) ( not ( = ?auto_648003 ?auto_648010 ) ) ( not ( = ?auto_648003 ?auto_648011 ) ) ( not ( = ?auto_648003 ?auto_648012 ) ) ( not ( = ?auto_648004 ?auto_648005 ) ) ( not ( = ?auto_648004 ?auto_648006 ) ) ( not ( = ?auto_648004 ?auto_648007 ) ) ( not ( = ?auto_648004 ?auto_648008 ) ) ( not ( = ?auto_648004 ?auto_648009 ) ) ( not ( = ?auto_648004 ?auto_648010 ) ) ( not ( = ?auto_648004 ?auto_648011 ) ) ( not ( = ?auto_648004 ?auto_648012 ) ) ( not ( = ?auto_648005 ?auto_648006 ) ) ( not ( = ?auto_648005 ?auto_648007 ) ) ( not ( = ?auto_648005 ?auto_648008 ) ) ( not ( = ?auto_648005 ?auto_648009 ) ) ( not ( = ?auto_648005 ?auto_648010 ) ) ( not ( = ?auto_648005 ?auto_648011 ) ) ( not ( = ?auto_648005 ?auto_648012 ) ) ( not ( = ?auto_648006 ?auto_648007 ) ) ( not ( = ?auto_648006 ?auto_648008 ) ) ( not ( = ?auto_648006 ?auto_648009 ) ) ( not ( = ?auto_648006 ?auto_648010 ) ) ( not ( = ?auto_648006 ?auto_648011 ) ) ( not ( = ?auto_648006 ?auto_648012 ) ) ( not ( = ?auto_648007 ?auto_648008 ) ) ( not ( = ?auto_648007 ?auto_648009 ) ) ( not ( = ?auto_648007 ?auto_648010 ) ) ( not ( = ?auto_648007 ?auto_648011 ) ) ( not ( = ?auto_648007 ?auto_648012 ) ) ( not ( = ?auto_648008 ?auto_648009 ) ) ( not ( = ?auto_648008 ?auto_648010 ) ) ( not ( = ?auto_648008 ?auto_648011 ) ) ( not ( = ?auto_648008 ?auto_648012 ) ) ( not ( = ?auto_648009 ?auto_648010 ) ) ( not ( = ?auto_648009 ?auto_648011 ) ) ( not ( = ?auto_648009 ?auto_648012 ) ) ( not ( = ?auto_648010 ?auto_648011 ) ) ( not ( = ?auto_648010 ?auto_648012 ) ) ( not ( = ?auto_648011 ?auto_648012 ) ) ( ON ?auto_648010 ?auto_648011 ) ( CLEAR ?auto_648008 ) ( ON ?auto_648009 ?auto_648010 ) ( CLEAR ?auto_648009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_647996 ?auto_647997 ?auto_647998 ?auto_647999 ?auto_648000 ?auto_648001 ?auto_648002 ?auto_648003 ?auto_648004 ?auto_648005 ?auto_648006 ?auto_648007 ?auto_648008 ?auto_648009 )
      ( MAKE-16PILE ?auto_647996 ?auto_647997 ?auto_647998 ?auto_647999 ?auto_648000 ?auto_648001 ?auto_648002 ?auto_648003 ?auto_648004 ?auto_648005 ?auto_648006 ?auto_648007 ?auto_648008 ?auto_648009 ?auto_648010 ?auto_648011 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648062 - BLOCK
      ?auto_648063 - BLOCK
      ?auto_648064 - BLOCK
      ?auto_648065 - BLOCK
      ?auto_648066 - BLOCK
      ?auto_648067 - BLOCK
      ?auto_648068 - BLOCK
      ?auto_648069 - BLOCK
      ?auto_648070 - BLOCK
      ?auto_648071 - BLOCK
      ?auto_648072 - BLOCK
      ?auto_648073 - BLOCK
      ?auto_648074 - BLOCK
      ?auto_648075 - BLOCK
      ?auto_648076 - BLOCK
      ?auto_648077 - BLOCK
    )
    :vars
    (
      ?auto_648078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648077 ?auto_648078 ) ( ON-TABLE ?auto_648062 ) ( ON ?auto_648063 ?auto_648062 ) ( ON ?auto_648064 ?auto_648063 ) ( ON ?auto_648065 ?auto_648064 ) ( ON ?auto_648066 ?auto_648065 ) ( ON ?auto_648067 ?auto_648066 ) ( ON ?auto_648068 ?auto_648067 ) ( ON ?auto_648069 ?auto_648068 ) ( ON ?auto_648070 ?auto_648069 ) ( ON ?auto_648071 ?auto_648070 ) ( ON ?auto_648072 ?auto_648071 ) ( ON ?auto_648073 ?auto_648072 ) ( not ( = ?auto_648062 ?auto_648063 ) ) ( not ( = ?auto_648062 ?auto_648064 ) ) ( not ( = ?auto_648062 ?auto_648065 ) ) ( not ( = ?auto_648062 ?auto_648066 ) ) ( not ( = ?auto_648062 ?auto_648067 ) ) ( not ( = ?auto_648062 ?auto_648068 ) ) ( not ( = ?auto_648062 ?auto_648069 ) ) ( not ( = ?auto_648062 ?auto_648070 ) ) ( not ( = ?auto_648062 ?auto_648071 ) ) ( not ( = ?auto_648062 ?auto_648072 ) ) ( not ( = ?auto_648062 ?auto_648073 ) ) ( not ( = ?auto_648062 ?auto_648074 ) ) ( not ( = ?auto_648062 ?auto_648075 ) ) ( not ( = ?auto_648062 ?auto_648076 ) ) ( not ( = ?auto_648062 ?auto_648077 ) ) ( not ( = ?auto_648062 ?auto_648078 ) ) ( not ( = ?auto_648063 ?auto_648064 ) ) ( not ( = ?auto_648063 ?auto_648065 ) ) ( not ( = ?auto_648063 ?auto_648066 ) ) ( not ( = ?auto_648063 ?auto_648067 ) ) ( not ( = ?auto_648063 ?auto_648068 ) ) ( not ( = ?auto_648063 ?auto_648069 ) ) ( not ( = ?auto_648063 ?auto_648070 ) ) ( not ( = ?auto_648063 ?auto_648071 ) ) ( not ( = ?auto_648063 ?auto_648072 ) ) ( not ( = ?auto_648063 ?auto_648073 ) ) ( not ( = ?auto_648063 ?auto_648074 ) ) ( not ( = ?auto_648063 ?auto_648075 ) ) ( not ( = ?auto_648063 ?auto_648076 ) ) ( not ( = ?auto_648063 ?auto_648077 ) ) ( not ( = ?auto_648063 ?auto_648078 ) ) ( not ( = ?auto_648064 ?auto_648065 ) ) ( not ( = ?auto_648064 ?auto_648066 ) ) ( not ( = ?auto_648064 ?auto_648067 ) ) ( not ( = ?auto_648064 ?auto_648068 ) ) ( not ( = ?auto_648064 ?auto_648069 ) ) ( not ( = ?auto_648064 ?auto_648070 ) ) ( not ( = ?auto_648064 ?auto_648071 ) ) ( not ( = ?auto_648064 ?auto_648072 ) ) ( not ( = ?auto_648064 ?auto_648073 ) ) ( not ( = ?auto_648064 ?auto_648074 ) ) ( not ( = ?auto_648064 ?auto_648075 ) ) ( not ( = ?auto_648064 ?auto_648076 ) ) ( not ( = ?auto_648064 ?auto_648077 ) ) ( not ( = ?auto_648064 ?auto_648078 ) ) ( not ( = ?auto_648065 ?auto_648066 ) ) ( not ( = ?auto_648065 ?auto_648067 ) ) ( not ( = ?auto_648065 ?auto_648068 ) ) ( not ( = ?auto_648065 ?auto_648069 ) ) ( not ( = ?auto_648065 ?auto_648070 ) ) ( not ( = ?auto_648065 ?auto_648071 ) ) ( not ( = ?auto_648065 ?auto_648072 ) ) ( not ( = ?auto_648065 ?auto_648073 ) ) ( not ( = ?auto_648065 ?auto_648074 ) ) ( not ( = ?auto_648065 ?auto_648075 ) ) ( not ( = ?auto_648065 ?auto_648076 ) ) ( not ( = ?auto_648065 ?auto_648077 ) ) ( not ( = ?auto_648065 ?auto_648078 ) ) ( not ( = ?auto_648066 ?auto_648067 ) ) ( not ( = ?auto_648066 ?auto_648068 ) ) ( not ( = ?auto_648066 ?auto_648069 ) ) ( not ( = ?auto_648066 ?auto_648070 ) ) ( not ( = ?auto_648066 ?auto_648071 ) ) ( not ( = ?auto_648066 ?auto_648072 ) ) ( not ( = ?auto_648066 ?auto_648073 ) ) ( not ( = ?auto_648066 ?auto_648074 ) ) ( not ( = ?auto_648066 ?auto_648075 ) ) ( not ( = ?auto_648066 ?auto_648076 ) ) ( not ( = ?auto_648066 ?auto_648077 ) ) ( not ( = ?auto_648066 ?auto_648078 ) ) ( not ( = ?auto_648067 ?auto_648068 ) ) ( not ( = ?auto_648067 ?auto_648069 ) ) ( not ( = ?auto_648067 ?auto_648070 ) ) ( not ( = ?auto_648067 ?auto_648071 ) ) ( not ( = ?auto_648067 ?auto_648072 ) ) ( not ( = ?auto_648067 ?auto_648073 ) ) ( not ( = ?auto_648067 ?auto_648074 ) ) ( not ( = ?auto_648067 ?auto_648075 ) ) ( not ( = ?auto_648067 ?auto_648076 ) ) ( not ( = ?auto_648067 ?auto_648077 ) ) ( not ( = ?auto_648067 ?auto_648078 ) ) ( not ( = ?auto_648068 ?auto_648069 ) ) ( not ( = ?auto_648068 ?auto_648070 ) ) ( not ( = ?auto_648068 ?auto_648071 ) ) ( not ( = ?auto_648068 ?auto_648072 ) ) ( not ( = ?auto_648068 ?auto_648073 ) ) ( not ( = ?auto_648068 ?auto_648074 ) ) ( not ( = ?auto_648068 ?auto_648075 ) ) ( not ( = ?auto_648068 ?auto_648076 ) ) ( not ( = ?auto_648068 ?auto_648077 ) ) ( not ( = ?auto_648068 ?auto_648078 ) ) ( not ( = ?auto_648069 ?auto_648070 ) ) ( not ( = ?auto_648069 ?auto_648071 ) ) ( not ( = ?auto_648069 ?auto_648072 ) ) ( not ( = ?auto_648069 ?auto_648073 ) ) ( not ( = ?auto_648069 ?auto_648074 ) ) ( not ( = ?auto_648069 ?auto_648075 ) ) ( not ( = ?auto_648069 ?auto_648076 ) ) ( not ( = ?auto_648069 ?auto_648077 ) ) ( not ( = ?auto_648069 ?auto_648078 ) ) ( not ( = ?auto_648070 ?auto_648071 ) ) ( not ( = ?auto_648070 ?auto_648072 ) ) ( not ( = ?auto_648070 ?auto_648073 ) ) ( not ( = ?auto_648070 ?auto_648074 ) ) ( not ( = ?auto_648070 ?auto_648075 ) ) ( not ( = ?auto_648070 ?auto_648076 ) ) ( not ( = ?auto_648070 ?auto_648077 ) ) ( not ( = ?auto_648070 ?auto_648078 ) ) ( not ( = ?auto_648071 ?auto_648072 ) ) ( not ( = ?auto_648071 ?auto_648073 ) ) ( not ( = ?auto_648071 ?auto_648074 ) ) ( not ( = ?auto_648071 ?auto_648075 ) ) ( not ( = ?auto_648071 ?auto_648076 ) ) ( not ( = ?auto_648071 ?auto_648077 ) ) ( not ( = ?auto_648071 ?auto_648078 ) ) ( not ( = ?auto_648072 ?auto_648073 ) ) ( not ( = ?auto_648072 ?auto_648074 ) ) ( not ( = ?auto_648072 ?auto_648075 ) ) ( not ( = ?auto_648072 ?auto_648076 ) ) ( not ( = ?auto_648072 ?auto_648077 ) ) ( not ( = ?auto_648072 ?auto_648078 ) ) ( not ( = ?auto_648073 ?auto_648074 ) ) ( not ( = ?auto_648073 ?auto_648075 ) ) ( not ( = ?auto_648073 ?auto_648076 ) ) ( not ( = ?auto_648073 ?auto_648077 ) ) ( not ( = ?auto_648073 ?auto_648078 ) ) ( not ( = ?auto_648074 ?auto_648075 ) ) ( not ( = ?auto_648074 ?auto_648076 ) ) ( not ( = ?auto_648074 ?auto_648077 ) ) ( not ( = ?auto_648074 ?auto_648078 ) ) ( not ( = ?auto_648075 ?auto_648076 ) ) ( not ( = ?auto_648075 ?auto_648077 ) ) ( not ( = ?auto_648075 ?auto_648078 ) ) ( not ( = ?auto_648076 ?auto_648077 ) ) ( not ( = ?auto_648076 ?auto_648078 ) ) ( not ( = ?auto_648077 ?auto_648078 ) ) ( ON ?auto_648076 ?auto_648077 ) ( ON ?auto_648075 ?auto_648076 ) ( CLEAR ?auto_648073 ) ( ON ?auto_648074 ?auto_648075 ) ( CLEAR ?auto_648074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_648062 ?auto_648063 ?auto_648064 ?auto_648065 ?auto_648066 ?auto_648067 ?auto_648068 ?auto_648069 ?auto_648070 ?auto_648071 ?auto_648072 ?auto_648073 ?auto_648074 )
      ( MAKE-16PILE ?auto_648062 ?auto_648063 ?auto_648064 ?auto_648065 ?auto_648066 ?auto_648067 ?auto_648068 ?auto_648069 ?auto_648070 ?auto_648071 ?auto_648072 ?auto_648073 ?auto_648074 ?auto_648075 ?auto_648076 ?auto_648077 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648128 - BLOCK
      ?auto_648129 - BLOCK
      ?auto_648130 - BLOCK
      ?auto_648131 - BLOCK
      ?auto_648132 - BLOCK
      ?auto_648133 - BLOCK
      ?auto_648134 - BLOCK
      ?auto_648135 - BLOCK
      ?auto_648136 - BLOCK
      ?auto_648137 - BLOCK
      ?auto_648138 - BLOCK
      ?auto_648139 - BLOCK
      ?auto_648140 - BLOCK
      ?auto_648141 - BLOCK
      ?auto_648142 - BLOCK
      ?auto_648143 - BLOCK
    )
    :vars
    (
      ?auto_648144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648143 ?auto_648144 ) ( ON-TABLE ?auto_648128 ) ( ON ?auto_648129 ?auto_648128 ) ( ON ?auto_648130 ?auto_648129 ) ( ON ?auto_648131 ?auto_648130 ) ( ON ?auto_648132 ?auto_648131 ) ( ON ?auto_648133 ?auto_648132 ) ( ON ?auto_648134 ?auto_648133 ) ( ON ?auto_648135 ?auto_648134 ) ( ON ?auto_648136 ?auto_648135 ) ( ON ?auto_648137 ?auto_648136 ) ( ON ?auto_648138 ?auto_648137 ) ( not ( = ?auto_648128 ?auto_648129 ) ) ( not ( = ?auto_648128 ?auto_648130 ) ) ( not ( = ?auto_648128 ?auto_648131 ) ) ( not ( = ?auto_648128 ?auto_648132 ) ) ( not ( = ?auto_648128 ?auto_648133 ) ) ( not ( = ?auto_648128 ?auto_648134 ) ) ( not ( = ?auto_648128 ?auto_648135 ) ) ( not ( = ?auto_648128 ?auto_648136 ) ) ( not ( = ?auto_648128 ?auto_648137 ) ) ( not ( = ?auto_648128 ?auto_648138 ) ) ( not ( = ?auto_648128 ?auto_648139 ) ) ( not ( = ?auto_648128 ?auto_648140 ) ) ( not ( = ?auto_648128 ?auto_648141 ) ) ( not ( = ?auto_648128 ?auto_648142 ) ) ( not ( = ?auto_648128 ?auto_648143 ) ) ( not ( = ?auto_648128 ?auto_648144 ) ) ( not ( = ?auto_648129 ?auto_648130 ) ) ( not ( = ?auto_648129 ?auto_648131 ) ) ( not ( = ?auto_648129 ?auto_648132 ) ) ( not ( = ?auto_648129 ?auto_648133 ) ) ( not ( = ?auto_648129 ?auto_648134 ) ) ( not ( = ?auto_648129 ?auto_648135 ) ) ( not ( = ?auto_648129 ?auto_648136 ) ) ( not ( = ?auto_648129 ?auto_648137 ) ) ( not ( = ?auto_648129 ?auto_648138 ) ) ( not ( = ?auto_648129 ?auto_648139 ) ) ( not ( = ?auto_648129 ?auto_648140 ) ) ( not ( = ?auto_648129 ?auto_648141 ) ) ( not ( = ?auto_648129 ?auto_648142 ) ) ( not ( = ?auto_648129 ?auto_648143 ) ) ( not ( = ?auto_648129 ?auto_648144 ) ) ( not ( = ?auto_648130 ?auto_648131 ) ) ( not ( = ?auto_648130 ?auto_648132 ) ) ( not ( = ?auto_648130 ?auto_648133 ) ) ( not ( = ?auto_648130 ?auto_648134 ) ) ( not ( = ?auto_648130 ?auto_648135 ) ) ( not ( = ?auto_648130 ?auto_648136 ) ) ( not ( = ?auto_648130 ?auto_648137 ) ) ( not ( = ?auto_648130 ?auto_648138 ) ) ( not ( = ?auto_648130 ?auto_648139 ) ) ( not ( = ?auto_648130 ?auto_648140 ) ) ( not ( = ?auto_648130 ?auto_648141 ) ) ( not ( = ?auto_648130 ?auto_648142 ) ) ( not ( = ?auto_648130 ?auto_648143 ) ) ( not ( = ?auto_648130 ?auto_648144 ) ) ( not ( = ?auto_648131 ?auto_648132 ) ) ( not ( = ?auto_648131 ?auto_648133 ) ) ( not ( = ?auto_648131 ?auto_648134 ) ) ( not ( = ?auto_648131 ?auto_648135 ) ) ( not ( = ?auto_648131 ?auto_648136 ) ) ( not ( = ?auto_648131 ?auto_648137 ) ) ( not ( = ?auto_648131 ?auto_648138 ) ) ( not ( = ?auto_648131 ?auto_648139 ) ) ( not ( = ?auto_648131 ?auto_648140 ) ) ( not ( = ?auto_648131 ?auto_648141 ) ) ( not ( = ?auto_648131 ?auto_648142 ) ) ( not ( = ?auto_648131 ?auto_648143 ) ) ( not ( = ?auto_648131 ?auto_648144 ) ) ( not ( = ?auto_648132 ?auto_648133 ) ) ( not ( = ?auto_648132 ?auto_648134 ) ) ( not ( = ?auto_648132 ?auto_648135 ) ) ( not ( = ?auto_648132 ?auto_648136 ) ) ( not ( = ?auto_648132 ?auto_648137 ) ) ( not ( = ?auto_648132 ?auto_648138 ) ) ( not ( = ?auto_648132 ?auto_648139 ) ) ( not ( = ?auto_648132 ?auto_648140 ) ) ( not ( = ?auto_648132 ?auto_648141 ) ) ( not ( = ?auto_648132 ?auto_648142 ) ) ( not ( = ?auto_648132 ?auto_648143 ) ) ( not ( = ?auto_648132 ?auto_648144 ) ) ( not ( = ?auto_648133 ?auto_648134 ) ) ( not ( = ?auto_648133 ?auto_648135 ) ) ( not ( = ?auto_648133 ?auto_648136 ) ) ( not ( = ?auto_648133 ?auto_648137 ) ) ( not ( = ?auto_648133 ?auto_648138 ) ) ( not ( = ?auto_648133 ?auto_648139 ) ) ( not ( = ?auto_648133 ?auto_648140 ) ) ( not ( = ?auto_648133 ?auto_648141 ) ) ( not ( = ?auto_648133 ?auto_648142 ) ) ( not ( = ?auto_648133 ?auto_648143 ) ) ( not ( = ?auto_648133 ?auto_648144 ) ) ( not ( = ?auto_648134 ?auto_648135 ) ) ( not ( = ?auto_648134 ?auto_648136 ) ) ( not ( = ?auto_648134 ?auto_648137 ) ) ( not ( = ?auto_648134 ?auto_648138 ) ) ( not ( = ?auto_648134 ?auto_648139 ) ) ( not ( = ?auto_648134 ?auto_648140 ) ) ( not ( = ?auto_648134 ?auto_648141 ) ) ( not ( = ?auto_648134 ?auto_648142 ) ) ( not ( = ?auto_648134 ?auto_648143 ) ) ( not ( = ?auto_648134 ?auto_648144 ) ) ( not ( = ?auto_648135 ?auto_648136 ) ) ( not ( = ?auto_648135 ?auto_648137 ) ) ( not ( = ?auto_648135 ?auto_648138 ) ) ( not ( = ?auto_648135 ?auto_648139 ) ) ( not ( = ?auto_648135 ?auto_648140 ) ) ( not ( = ?auto_648135 ?auto_648141 ) ) ( not ( = ?auto_648135 ?auto_648142 ) ) ( not ( = ?auto_648135 ?auto_648143 ) ) ( not ( = ?auto_648135 ?auto_648144 ) ) ( not ( = ?auto_648136 ?auto_648137 ) ) ( not ( = ?auto_648136 ?auto_648138 ) ) ( not ( = ?auto_648136 ?auto_648139 ) ) ( not ( = ?auto_648136 ?auto_648140 ) ) ( not ( = ?auto_648136 ?auto_648141 ) ) ( not ( = ?auto_648136 ?auto_648142 ) ) ( not ( = ?auto_648136 ?auto_648143 ) ) ( not ( = ?auto_648136 ?auto_648144 ) ) ( not ( = ?auto_648137 ?auto_648138 ) ) ( not ( = ?auto_648137 ?auto_648139 ) ) ( not ( = ?auto_648137 ?auto_648140 ) ) ( not ( = ?auto_648137 ?auto_648141 ) ) ( not ( = ?auto_648137 ?auto_648142 ) ) ( not ( = ?auto_648137 ?auto_648143 ) ) ( not ( = ?auto_648137 ?auto_648144 ) ) ( not ( = ?auto_648138 ?auto_648139 ) ) ( not ( = ?auto_648138 ?auto_648140 ) ) ( not ( = ?auto_648138 ?auto_648141 ) ) ( not ( = ?auto_648138 ?auto_648142 ) ) ( not ( = ?auto_648138 ?auto_648143 ) ) ( not ( = ?auto_648138 ?auto_648144 ) ) ( not ( = ?auto_648139 ?auto_648140 ) ) ( not ( = ?auto_648139 ?auto_648141 ) ) ( not ( = ?auto_648139 ?auto_648142 ) ) ( not ( = ?auto_648139 ?auto_648143 ) ) ( not ( = ?auto_648139 ?auto_648144 ) ) ( not ( = ?auto_648140 ?auto_648141 ) ) ( not ( = ?auto_648140 ?auto_648142 ) ) ( not ( = ?auto_648140 ?auto_648143 ) ) ( not ( = ?auto_648140 ?auto_648144 ) ) ( not ( = ?auto_648141 ?auto_648142 ) ) ( not ( = ?auto_648141 ?auto_648143 ) ) ( not ( = ?auto_648141 ?auto_648144 ) ) ( not ( = ?auto_648142 ?auto_648143 ) ) ( not ( = ?auto_648142 ?auto_648144 ) ) ( not ( = ?auto_648143 ?auto_648144 ) ) ( ON ?auto_648142 ?auto_648143 ) ( ON ?auto_648141 ?auto_648142 ) ( ON ?auto_648140 ?auto_648141 ) ( CLEAR ?auto_648138 ) ( ON ?auto_648139 ?auto_648140 ) ( CLEAR ?auto_648139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_648128 ?auto_648129 ?auto_648130 ?auto_648131 ?auto_648132 ?auto_648133 ?auto_648134 ?auto_648135 ?auto_648136 ?auto_648137 ?auto_648138 ?auto_648139 )
      ( MAKE-16PILE ?auto_648128 ?auto_648129 ?auto_648130 ?auto_648131 ?auto_648132 ?auto_648133 ?auto_648134 ?auto_648135 ?auto_648136 ?auto_648137 ?auto_648138 ?auto_648139 ?auto_648140 ?auto_648141 ?auto_648142 ?auto_648143 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648194 - BLOCK
      ?auto_648195 - BLOCK
      ?auto_648196 - BLOCK
      ?auto_648197 - BLOCK
      ?auto_648198 - BLOCK
      ?auto_648199 - BLOCK
      ?auto_648200 - BLOCK
      ?auto_648201 - BLOCK
      ?auto_648202 - BLOCK
      ?auto_648203 - BLOCK
      ?auto_648204 - BLOCK
      ?auto_648205 - BLOCK
      ?auto_648206 - BLOCK
      ?auto_648207 - BLOCK
      ?auto_648208 - BLOCK
      ?auto_648209 - BLOCK
    )
    :vars
    (
      ?auto_648210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648209 ?auto_648210 ) ( ON-TABLE ?auto_648194 ) ( ON ?auto_648195 ?auto_648194 ) ( ON ?auto_648196 ?auto_648195 ) ( ON ?auto_648197 ?auto_648196 ) ( ON ?auto_648198 ?auto_648197 ) ( ON ?auto_648199 ?auto_648198 ) ( ON ?auto_648200 ?auto_648199 ) ( ON ?auto_648201 ?auto_648200 ) ( ON ?auto_648202 ?auto_648201 ) ( ON ?auto_648203 ?auto_648202 ) ( not ( = ?auto_648194 ?auto_648195 ) ) ( not ( = ?auto_648194 ?auto_648196 ) ) ( not ( = ?auto_648194 ?auto_648197 ) ) ( not ( = ?auto_648194 ?auto_648198 ) ) ( not ( = ?auto_648194 ?auto_648199 ) ) ( not ( = ?auto_648194 ?auto_648200 ) ) ( not ( = ?auto_648194 ?auto_648201 ) ) ( not ( = ?auto_648194 ?auto_648202 ) ) ( not ( = ?auto_648194 ?auto_648203 ) ) ( not ( = ?auto_648194 ?auto_648204 ) ) ( not ( = ?auto_648194 ?auto_648205 ) ) ( not ( = ?auto_648194 ?auto_648206 ) ) ( not ( = ?auto_648194 ?auto_648207 ) ) ( not ( = ?auto_648194 ?auto_648208 ) ) ( not ( = ?auto_648194 ?auto_648209 ) ) ( not ( = ?auto_648194 ?auto_648210 ) ) ( not ( = ?auto_648195 ?auto_648196 ) ) ( not ( = ?auto_648195 ?auto_648197 ) ) ( not ( = ?auto_648195 ?auto_648198 ) ) ( not ( = ?auto_648195 ?auto_648199 ) ) ( not ( = ?auto_648195 ?auto_648200 ) ) ( not ( = ?auto_648195 ?auto_648201 ) ) ( not ( = ?auto_648195 ?auto_648202 ) ) ( not ( = ?auto_648195 ?auto_648203 ) ) ( not ( = ?auto_648195 ?auto_648204 ) ) ( not ( = ?auto_648195 ?auto_648205 ) ) ( not ( = ?auto_648195 ?auto_648206 ) ) ( not ( = ?auto_648195 ?auto_648207 ) ) ( not ( = ?auto_648195 ?auto_648208 ) ) ( not ( = ?auto_648195 ?auto_648209 ) ) ( not ( = ?auto_648195 ?auto_648210 ) ) ( not ( = ?auto_648196 ?auto_648197 ) ) ( not ( = ?auto_648196 ?auto_648198 ) ) ( not ( = ?auto_648196 ?auto_648199 ) ) ( not ( = ?auto_648196 ?auto_648200 ) ) ( not ( = ?auto_648196 ?auto_648201 ) ) ( not ( = ?auto_648196 ?auto_648202 ) ) ( not ( = ?auto_648196 ?auto_648203 ) ) ( not ( = ?auto_648196 ?auto_648204 ) ) ( not ( = ?auto_648196 ?auto_648205 ) ) ( not ( = ?auto_648196 ?auto_648206 ) ) ( not ( = ?auto_648196 ?auto_648207 ) ) ( not ( = ?auto_648196 ?auto_648208 ) ) ( not ( = ?auto_648196 ?auto_648209 ) ) ( not ( = ?auto_648196 ?auto_648210 ) ) ( not ( = ?auto_648197 ?auto_648198 ) ) ( not ( = ?auto_648197 ?auto_648199 ) ) ( not ( = ?auto_648197 ?auto_648200 ) ) ( not ( = ?auto_648197 ?auto_648201 ) ) ( not ( = ?auto_648197 ?auto_648202 ) ) ( not ( = ?auto_648197 ?auto_648203 ) ) ( not ( = ?auto_648197 ?auto_648204 ) ) ( not ( = ?auto_648197 ?auto_648205 ) ) ( not ( = ?auto_648197 ?auto_648206 ) ) ( not ( = ?auto_648197 ?auto_648207 ) ) ( not ( = ?auto_648197 ?auto_648208 ) ) ( not ( = ?auto_648197 ?auto_648209 ) ) ( not ( = ?auto_648197 ?auto_648210 ) ) ( not ( = ?auto_648198 ?auto_648199 ) ) ( not ( = ?auto_648198 ?auto_648200 ) ) ( not ( = ?auto_648198 ?auto_648201 ) ) ( not ( = ?auto_648198 ?auto_648202 ) ) ( not ( = ?auto_648198 ?auto_648203 ) ) ( not ( = ?auto_648198 ?auto_648204 ) ) ( not ( = ?auto_648198 ?auto_648205 ) ) ( not ( = ?auto_648198 ?auto_648206 ) ) ( not ( = ?auto_648198 ?auto_648207 ) ) ( not ( = ?auto_648198 ?auto_648208 ) ) ( not ( = ?auto_648198 ?auto_648209 ) ) ( not ( = ?auto_648198 ?auto_648210 ) ) ( not ( = ?auto_648199 ?auto_648200 ) ) ( not ( = ?auto_648199 ?auto_648201 ) ) ( not ( = ?auto_648199 ?auto_648202 ) ) ( not ( = ?auto_648199 ?auto_648203 ) ) ( not ( = ?auto_648199 ?auto_648204 ) ) ( not ( = ?auto_648199 ?auto_648205 ) ) ( not ( = ?auto_648199 ?auto_648206 ) ) ( not ( = ?auto_648199 ?auto_648207 ) ) ( not ( = ?auto_648199 ?auto_648208 ) ) ( not ( = ?auto_648199 ?auto_648209 ) ) ( not ( = ?auto_648199 ?auto_648210 ) ) ( not ( = ?auto_648200 ?auto_648201 ) ) ( not ( = ?auto_648200 ?auto_648202 ) ) ( not ( = ?auto_648200 ?auto_648203 ) ) ( not ( = ?auto_648200 ?auto_648204 ) ) ( not ( = ?auto_648200 ?auto_648205 ) ) ( not ( = ?auto_648200 ?auto_648206 ) ) ( not ( = ?auto_648200 ?auto_648207 ) ) ( not ( = ?auto_648200 ?auto_648208 ) ) ( not ( = ?auto_648200 ?auto_648209 ) ) ( not ( = ?auto_648200 ?auto_648210 ) ) ( not ( = ?auto_648201 ?auto_648202 ) ) ( not ( = ?auto_648201 ?auto_648203 ) ) ( not ( = ?auto_648201 ?auto_648204 ) ) ( not ( = ?auto_648201 ?auto_648205 ) ) ( not ( = ?auto_648201 ?auto_648206 ) ) ( not ( = ?auto_648201 ?auto_648207 ) ) ( not ( = ?auto_648201 ?auto_648208 ) ) ( not ( = ?auto_648201 ?auto_648209 ) ) ( not ( = ?auto_648201 ?auto_648210 ) ) ( not ( = ?auto_648202 ?auto_648203 ) ) ( not ( = ?auto_648202 ?auto_648204 ) ) ( not ( = ?auto_648202 ?auto_648205 ) ) ( not ( = ?auto_648202 ?auto_648206 ) ) ( not ( = ?auto_648202 ?auto_648207 ) ) ( not ( = ?auto_648202 ?auto_648208 ) ) ( not ( = ?auto_648202 ?auto_648209 ) ) ( not ( = ?auto_648202 ?auto_648210 ) ) ( not ( = ?auto_648203 ?auto_648204 ) ) ( not ( = ?auto_648203 ?auto_648205 ) ) ( not ( = ?auto_648203 ?auto_648206 ) ) ( not ( = ?auto_648203 ?auto_648207 ) ) ( not ( = ?auto_648203 ?auto_648208 ) ) ( not ( = ?auto_648203 ?auto_648209 ) ) ( not ( = ?auto_648203 ?auto_648210 ) ) ( not ( = ?auto_648204 ?auto_648205 ) ) ( not ( = ?auto_648204 ?auto_648206 ) ) ( not ( = ?auto_648204 ?auto_648207 ) ) ( not ( = ?auto_648204 ?auto_648208 ) ) ( not ( = ?auto_648204 ?auto_648209 ) ) ( not ( = ?auto_648204 ?auto_648210 ) ) ( not ( = ?auto_648205 ?auto_648206 ) ) ( not ( = ?auto_648205 ?auto_648207 ) ) ( not ( = ?auto_648205 ?auto_648208 ) ) ( not ( = ?auto_648205 ?auto_648209 ) ) ( not ( = ?auto_648205 ?auto_648210 ) ) ( not ( = ?auto_648206 ?auto_648207 ) ) ( not ( = ?auto_648206 ?auto_648208 ) ) ( not ( = ?auto_648206 ?auto_648209 ) ) ( not ( = ?auto_648206 ?auto_648210 ) ) ( not ( = ?auto_648207 ?auto_648208 ) ) ( not ( = ?auto_648207 ?auto_648209 ) ) ( not ( = ?auto_648207 ?auto_648210 ) ) ( not ( = ?auto_648208 ?auto_648209 ) ) ( not ( = ?auto_648208 ?auto_648210 ) ) ( not ( = ?auto_648209 ?auto_648210 ) ) ( ON ?auto_648208 ?auto_648209 ) ( ON ?auto_648207 ?auto_648208 ) ( ON ?auto_648206 ?auto_648207 ) ( ON ?auto_648205 ?auto_648206 ) ( CLEAR ?auto_648203 ) ( ON ?auto_648204 ?auto_648205 ) ( CLEAR ?auto_648204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_648194 ?auto_648195 ?auto_648196 ?auto_648197 ?auto_648198 ?auto_648199 ?auto_648200 ?auto_648201 ?auto_648202 ?auto_648203 ?auto_648204 )
      ( MAKE-16PILE ?auto_648194 ?auto_648195 ?auto_648196 ?auto_648197 ?auto_648198 ?auto_648199 ?auto_648200 ?auto_648201 ?auto_648202 ?auto_648203 ?auto_648204 ?auto_648205 ?auto_648206 ?auto_648207 ?auto_648208 ?auto_648209 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648260 - BLOCK
      ?auto_648261 - BLOCK
      ?auto_648262 - BLOCK
      ?auto_648263 - BLOCK
      ?auto_648264 - BLOCK
      ?auto_648265 - BLOCK
      ?auto_648266 - BLOCK
      ?auto_648267 - BLOCK
      ?auto_648268 - BLOCK
      ?auto_648269 - BLOCK
      ?auto_648270 - BLOCK
      ?auto_648271 - BLOCK
      ?auto_648272 - BLOCK
      ?auto_648273 - BLOCK
      ?auto_648274 - BLOCK
      ?auto_648275 - BLOCK
    )
    :vars
    (
      ?auto_648276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648275 ?auto_648276 ) ( ON-TABLE ?auto_648260 ) ( ON ?auto_648261 ?auto_648260 ) ( ON ?auto_648262 ?auto_648261 ) ( ON ?auto_648263 ?auto_648262 ) ( ON ?auto_648264 ?auto_648263 ) ( ON ?auto_648265 ?auto_648264 ) ( ON ?auto_648266 ?auto_648265 ) ( ON ?auto_648267 ?auto_648266 ) ( ON ?auto_648268 ?auto_648267 ) ( not ( = ?auto_648260 ?auto_648261 ) ) ( not ( = ?auto_648260 ?auto_648262 ) ) ( not ( = ?auto_648260 ?auto_648263 ) ) ( not ( = ?auto_648260 ?auto_648264 ) ) ( not ( = ?auto_648260 ?auto_648265 ) ) ( not ( = ?auto_648260 ?auto_648266 ) ) ( not ( = ?auto_648260 ?auto_648267 ) ) ( not ( = ?auto_648260 ?auto_648268 ) ) ( not ( = ?auto_648260 ?auto_648269 ) ) ( not ( = ?auto_648260 ?auto_648270 ) ) ( not ( = ?auto_648260 ?auto_648271 ) ) ( not ( = ?auto_648260 ?auto_648272 ) ) ( not ( = ?auto_648260 ?auto_648273 ) ) ( not ( = ?auto_648260 ?auto_648274 ) ) ( not ( = ?auto_648260 ?auto_648275 ) ) ( not ( = ?auto_648260 ?auto_648276 ) ) ( not ( = ?auto_648261 ?auto_648262 ) ) ( not ( = ?auto_648261 ?auto_648263 ) ) ( not ( = ?auto_648261 ?auto_648264 ) ) ( not ( = ?auto_648261 ?auto_648265 ) ) ( not ( = ?auto_648261 ?auto_648266 ) ) ( not ( = ?auto_648261 ?auto_648267 ) ) ( not ( = ?auto_648261 ?auto_648268 ) ) ( not ( = ?auto_648261 ?auto_648269 ) ) ( not ( = ?auto_648261 ?auto_648270 ) ) ( not ( = ?auto_648261 ?auto_648271 ) ) ( not ( = ?auto_648261 ?auto_648272 ) ) ( not ( = ?auto_648261 ?auto_648273 ) ) ( not ( = ?auto_648261 ?auto_648274 ) ) ( not ( = ?auto_648261 ?auto_648275 ) ) ( not ( = ?auto_648261 ?auto_648276 ) ) ( not ( = ?auto_648262 ?auto_648263 ) ) ( not ( = ?auto_648262 ?auto_648264 ) ) ( not ( = ?auto_648262 ?auto_648265 ) ) ( not ( = ?auto_648262 ?auto_648266 ) ) ( not ( = ?auto_648262 ?auto_648267 ) ) ( not ( = ?auto_648262 ?auto_648268 ) ) ( not ( = ?auto_648262 ?auto_648269 ) ) ( not ( = ?auto_648262 ?auto_648270 ) ) ( not ( = ?auto_648262 ?auto_648271 ) ) ( not ( = ?auto_648262 ?auto_648272 ) ) ( not ( = ?auto_648262 ?auto_648273 ) ) ( not ( = ?auto_648262 ?auto_648274 ) ) ( not ( = ?auto_648262 ?auto_648275 ) ) ( not ( = ?auto_648262 ?auto_648276 ) ) ( not ( = ?auto_648263 ?auto_648264 ) ) ( not ( = ?auto_648263 ?auto_648265 ) ) ( not ( = ?auto_648263 ?auto_648266 ) ) ( not ( = ?auto_648263 ?auto_648267 ) ) ( not ( = ?auto_648263 ?auto_648268 ) ) ( not ( = ?auto_648263 ?auto_648269 ) ) ( not ( = ?auto_648263 ?auto_648270 ) ) ( not ( = ?auto_648263 ?auto_648271 ) ) ( not ( = ?auto_648263 ?auto_648272 ) ) ( not ( = ?auto_648263 ?auto_648273 ) ) ( not ( = ?auto_648263 ?auto_648274 ) ) ( not ( = ?auto_648263 ?auto_648275 ) ) ( not ( = ?auto_648263 ?auto_648276 ) ) ( not ( = ?auto_648264 ?auto_648265 ) ) ( not ( = ?auto_648264 ?auto_648266 ) ) ( not ( = ?auto_648264 ?auto_648267 ) ) ( not ( = ?auto_648264 ?auto_648268 ) ) ( not ( = ?auto_648264 ?auto_648269 ) ) ( not ( = ?auto_648264 ?auto_648270 ) ) ( not ( = ?auto_648264 ?auto_648271 ) ) ( not ( = ?auto_648264 ?auto_648272 ) ) ( not ( = ?auto_648264 ?auto_648273 ) ) ( not ( = ?auto_648264 ?auto_648274 ) ) ( not ( = ?auto_648264 ?auto_648275 ) ) ( not ( = ?auto_648264 ?auto_648276 ) ) ( not ( = ?auto_648265 ?auto_648266 ) ) ( not ( = ?auto_648265 ?auto_648267 ) ) ( not ( = ?auto_648265 ?auto_648268 ) ) ( not ( = ?auto_648265 ?auto_648269 ) ) ( not ( = ?auto_648265 ?auto_648270 ) ) ( not ( = ?auto_648265 ?auto_648271 ) ) ( not ( = ?auto_648265 ?auto_648272 ) ) ( not ( = ?auto_648265 ?auto_648273 ) ) ( not ( = ?auto_648265 ?auto_648274 ) ) ( not ( = ?auto_648265 ?auto_648275 ) ) ( not ( = ?auto_648265 ?auto_648276 ) ) ( not ( = ?auto_648266 ?auto_648267 ) ) ( not ( = ?auto_648266 ?auto_648268 ) ) ( not ( = ?auto_648266 ?auto_648269 ) ) ( not ( = ?auto_648266 ?auto_648270 ) ) ( not ( = ?auto_648266 ?auto_648271 ) ) ( not ( = ?auto_648266 ?auto_648272 ) ) ( not ( = ?auto_648266 ?auto_648273 ) ) ( not ( = ?auto_648266 ?auto_648274 ) ) ( not ( = ?auto_648266 ?auto_648275 ) ) ( not ( = ?auto_648266 ?auto_648276 ) ) ( not ( = ?auto_648267 ?auto_648268 ) ) ( not ( = ?auto_648267 ?auto_648269 ) ) ( not ( = ?auto_648267 ?auto_648270 ) ) ( not ( = ?auto_648267 ?auto_648271 ) ) ( not ( = ?auto_648267 ?auto_648272 ) ) ( not ( = ?auto_648267 ?auto_648273 ) ) ( not ( = ?auto_648267 ?auto_648274 ) ) ( not ( = ?auto_648267 ?auto_648275 ) ) ( not ( = ?auto_648267 ?auto_648276 ) ) ( not ( = ?auto_648268 ?auto_648269 ) ) ( not ( = ?auto_648268 ?auto_648270 ) ) ( not ( = ?auto_648268 ?auto_648271 ) ) ( not ( = ?auto_648268 ?auto_648272 ) ) ( not ( = ?auto_648268 ?auto_648273 ) ) ( not ( = ?auto_648268 ?auto_648274 ) ) ( not ( = ?auto_648268 ?auto_648275 ) ) ( not ( = ?auto_648268 ?auto_648276 ) ) ( not ( = ?auto_648269 ?auto_648270 ) ) ( not ( = ?auto_648269 ?auto_648271 ) ) ( not ( = ?auto_648269 ?auto_648272 ) ) ( not ( = ?auto_648269 ?auto_648273 ) ) ( not ( = ?auto_648269 ?auto_648274 ) ) ( not ( = ?auto_648269 ?auto_648275 ) ) ( not ( = ?auto_648269 ?auto_648276 ) ) ( not ( = ?auto_648270 ?auto_648271 ) ) ( not ( = ?auto_648270 ?auto_648272 ) ) ( not ( = ?auto_648270 ?auto_648273 ) ) ( not ( = ?auto_648270 ?auto_648274 ) ) ( not ( = ?auto_648270 ?auto_648275 ) ) ( not ( = ?auto_648270 ?auto_648276 ) ) ( not ( = ?auto_648271 ?auto_648272 ) ) ( not ( = ?auto_648271 ?auto_648273 ) ) ( not ( = ?auto_648271 ?auto_648274 ) ) ( not ( = ?auto_648271 ?auto_648275 ) ) ( not ( = ?auto_648271 ?auto_648276 ) ) ( not ( = ?auto_648272 ?auto_648273 ) ) ( not ( = ?auto_648272 ?auto_648274 ) ) ( not ( = ?auto_648272 ?auto_648275 ) ) ( not ( = ?auto_648272 ?auto_648276 ) ) ( not ( = ?auto_648273 ?auto_648274 ) ) ( not ( = ?auto_648273 ?auto_648275 ) ) ( not ( = ?auto_648273 ?auto_648276 ) ) ( not ( = ?auto_648274 ?auto_648275 ) ) ( not ( = ?auto_648274 ?auto_648276 ) ) ( not ( = ?auto_648275 ?auto_648276 ) ) ( ON ?auto_648274 ?auto_648275 ) ( ON ?auto_648273 ?auto_648274 ) ( ON ?auto_648272 ?auto_648273 ) ( ON ?auto_648271 ?auto_648272 ) ( ON ?auto_648270 ?auto_648271 ) ( CLEAR ?auto_648268 ) ( ON ?auto_648269 ?auto_648270 ) ( CLEAR ?auto_648269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_648260 ?auto_648261 ?auto_648262 ?auto_648263 ?auto_648264 ?auto_648265 ?auto_648266 ?auto_648267 ?auto_648268 ?auto_648269 )
      ( MAKE-16PILE ?auto_648260 ?auto_648261 ?auto_648262 ?auto_648263 ?auto_648264 ?auto_648265 ?auto_648266 ?auto_648267 ?auto_648268 ?auto_648269 ?auto_648270 ?auto_648271 ?auto_648272 ?auto_648273 ?auto_648274 ?auto_648275 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648326 - BLOCK
      ?auto_648327 - BLOCK
      ?auto_648328 - BLOCK
      ?auto_648329 - BLOCK
      ?auto_648330 - BLOCK
      ?auto_648331 - BLOCK
      ?auto_648332 - BLOCK
      ?auto_648333 - BLOCK
      ?auto_648334 - BLOCK
      ?auto_648335 - BLOCK
      ?auto_648336 - BLOCK
      ?auto_648337 - BLOCK
      ?auto_648338 - BLOCK
      ?auto_648339 - BLOCK
      ?auto_648340 - BLOCK
      ?auto_648341 - BLOCK
    )
    :vars
    (
      ?auto_648342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648341 ?auto_648342 ) ( ON-TABLE ?auto_648326 ) ( ON ?auto_648327 ?auto_648326 ) ( ON ?auto_648328 ?auto_648327 ) ( ON ?auto_648329 ?auto_648328 ) ( ON ?auto_648330 ?auto_648329 ) ( ON ?auto_648331 ?auto_648330 ) ( ON ?auto_648332 ?auto_648331 ) ( ON ?auto_648333 ?auto_648332 ) ( not ( = ?auto_648326 ?auto_648327 ) ) ( not ( = ?auto_648326 ?auto_648328 ) ) ( not ( = ?auto_648326 ?auto_648329 ) ) ( not ( = ?auto_648326 ?auto_648330 ) ) ( not ( = ?auto_648326 ?auto_648331 ) ) ( not ( = ?auto_648326 ?auto_648332 ) ) ( not ( = ?auto_648326 ?auto_648333 ) ) ( not ( = ?auto_648326 ?auto_648334 ) ) ( not ( = ?auto_648326 ?auto_648335 ) ) ( not ( = ?auto_648326 ?auto_648336 ) ) ( not ( = ?auto_648326 ?auto_648337 ) ) ( not ( = ?auto_648326 ?auto_648338 ) ) ( not ( = ?auto_648326 ?auto_648339 ) ) ( not ( = ?auto_648326 ?auto_648340 ) ) ( not ( = ?auto_648326 ?auto_648341 ) ) ( not ( = ?auto_648326 ?auto_648342 ) ) ( not ( = ?auto_648327 ?auto_648328 ) ) ( not ( = ?auto_648327 ?auto_648329 ) ) ( not ( = ?auto_648327 ?auto_648330 ) ) ( not ( = ?auto_648327 ?auto_648331 ) ) ( not ( = ?auto_648327 ?auto_648332 ) ) ( not ( = ?auto_648327 ?auto_648333 ) ) ( not ( = ?auto_648327 ?auto_648334 ) ) ( not ( = ?auto_648327 ?auto_648335 ) ) ( not ( = ?auto_648327 ?auto_648336 ) ) ( not ( = ?auto_648327 ?auto_648337 ) ) ( not ( = ?auto_648327 ?auto_648338 ) ) ( not ( = ?auto_648327 ?auto_648339 ) ) ( not ( = ?auto_648327 ?auto_648340 ) ) ( not ( = ?auto_648327 ?auto_648341 ) ) ( not ( = ?auto_648327 ?auto_648342 ) ) ( not ( = ?auto_648328 ?auto_648329 ) ) ( not ( = ?auto_648328 ?auto_648330 ) ) ( not ( = ?auto_648328 ?auto_648331 ) ) ( not ( = ?auto_648328 ?auto_648332 ) ) ( not ( = ?auto_648328 ?auto_648333 ) ) ( not ( = ?auto_648328 ?auto_648334 ) ) ( not ( = ?auto_648328 ?auto_648335 ) ) ( not ( = ?auto_648328 ?auto_648336 ) ) ( not ( = ?auto_648328 ?auto_648337 ) ) ( not ( = ?auto_648328 ?auto_648338 ) ) ( not ( = ?auto_648328 ?auto_648339 ) ) ( not ( = ?auto_648328 ?auto_648340 ) ) ( not ( = ?auto_648328 ?auto_648341 ) ) ( not ( = ?auto_648328 ?auto_648342 ) ) ( not ( = ?auto_648329 ?auto_648330 ) ) ( not ( = ?auto_648329 ?auto_648331 ) ) ( not ( = ?auto_648329 ?auto_648332 ) ) ( not ( = ?auto_648329 ?auto_648333 ) ) ( not ( = ?auto_648329 ?auto_648334 ) ) ( not ( = ?auto_648329 ?auto_648335 ) ) ( not ( = ?auto_648329 ?auto_648336 ) ) ( not ( = ?auto_648329 ?auto_648337 ) ) ( not ( = ?auto_648329 ?auto_648338 ) ) ( not ( = ?auto_648329 ?auto_648339 ) ) ( not ( = ?auto_648329 ?auto_648340 ) ) ( not ( = ?auto_648329 ?auto_648341 ) ) ( not ( = ?auto_648329 ?auto_648342 ) ) ( not ( = ?auto_648330 ?auto_648331 ) ) ( not ( = ?auto_648330 ?auto_648332 ) ) ( not ( = ?auto_648330 ?auto_648333 ) ) ( not ( = ?auto_648330 ?auto_648334 ) ) ( not ( = ?auto_648330 ?auto_648335 ) ) ( not ( = ?auto_648330 ?auto_648336 ) ) ( not ( = ?auto_648330 ?auto_648337 ) ) ( not ( = ?auto_648330 ?auto_648338 ) ) ( not ( = ?auto_648330 ?auto_648339 ) ) ( not ( = ?auto_648330 ?auto_648340 ) ) ( not ( = ?auto_648330 ?auto_648341 ) ) ( not ( = ?auto_648330 ?auto_648342 ) ) ( not ( = ?auto_648331 ?auto_648332 ) ) ( not ( = ?auto_648331 ?auto_648333 ) ) ( not ( = ?auto_648331 ?auto_648334 ) ) ( not ( = ?auto_648331 ?auto_648335 ) ) ( not ( = ?auto_648331 ?auto_648336 ) ) ( not ( = ?auto_648331 ?auto_648337 ) ) ( not ( = ?auto_648331 ?auto_648338 ) ) ( not ( = ?auto_648331 ?auto_648339 ) ) ( not ( = ?auto_648331 ?auto_648340 ) ) ( not ( = ?auto_648331 ?auto_648341 ) ) ( not ( = ?auto_648331 ?auto_648342 ) ) ( not ( = ?auto_648332 ?auto_648333 ) ) ( not ( = ?auto_648332 ?auto_648334 ) ) ( not ( = ?auto_648332 ?auto_648335 ) ) ( not ( = ?auto_648332 ?auto_648336 ) ) ( not ( = ?auto_648332 ?auto_648337 ) ) ( not ( = ?auto_648332 ?auto_648338 ) ) ( not ( = ?auto_648332 ?auto_648339 ) ) ( not ( = ?auto_648332 ?auto_648340 ) ) ( not ( = ?auto_648332 ?auto_648341 ) ) ( not ( = ?auto_648332 ?auto_648342 ) ) ( not ( = ?auto_648333 ?auto_648334 ) ) ( not ( = ?auto_648333 ?auto_648335 ) ) ( not ( = ?auto_648333 ?auto_648336 ) ) ( not ( = ?auto_648333 ?auto_648337 ) ) ( not ( = ?auto_648333 ?auto_648338 ) ) ( not ( = ?auto_648333 ?auto_648339 ) ) ( not ( = ?auto_648333 ?auto_648340 ) ) ( not ( = ?auto_648333 ?auto_648341 ) ) ( not ( = ?auto_648333 ?auto_648342 ) ) ( not ( = ?auto_648334 ?auto_648335 ) ) ( not ( = ?auto_648334 ?auto_648336 ) ) ( not ( = ?auto_648334 ?auto_648337 ) ) ( not ( = ?auto_648334 ?auto_648338 ) ) ( not ( = ?auto_648334 ?auto_648339 ) ) ( not ( = ?auto_648334 ?auto_648340 ) ) ( not ( = ?auto_648334 ?auto_648341 ) ) ( not ( = ?auto_648334 ?auto_648342 ) ) ( not ( = ?auto_648335 ?auto_648336 ) ) ( not ( = ?auto_648335 ?auto_648337 ) ) ( not ( = ?auto_648335 ?auto_648338 ) ) ( not ( = ?auto_648335 ?auto_648339 ) ) ( not ( = ?auto_648335 ?auto_648340 ) ) ( not ( = ?auto_648335 ?auto_648341 ) ) ( not ( = ?auto_648335 ?auto_648342 ) ) ( not ( = ?auto_648336 ?auto_648337 ) ) ( not ( = ?auto_648336 ?auto_648338 ) ) ( not ( = ?auto_648336 ?auto_648339 ) ) ( not ( = ?auto_648336 ?auto_648340 ) ) ( not ( = ?auto_648336 ?auto_648341 ) ) ( not ( = ?auto_648336 ?auto_648342 ) ) ( not ( = ?auto_648337 ?auto_648338 ) ) ( not ( = ?auto_648337 ?auto_648339 ) ) ( not ( = ?auto_648337 ?auto_648340 ) ) ( not ( = ?auto_648337 ?auto_648341 ) ) ( not ( = ?auto_648337 ?auto_648342 ) ) ( not ( = ?auto_648338 ?auto_648339 ) ) ( not ( = ?auto_648338 ?auto_648340 ) ) ( not ( = ?auto_648338 ?auto_648341 ) ) ( not ( = ?auto_648338 ?auto_648342 ) ) ( not ( = ?auto_648339 ?auto_648340 ) ) ( not ( = ?auto_648339 ?auto_648341 ) ) ( not ( = ?auto_648339 ?auto_648342 ) ) ( not ( = ?auto_648340 ?auto_648341 ) ) ( not ( = ?auto_648340 ?auto_648342 ) ) ( not ( = ?auto_648341 ?auto_648342 ) ) ( ON ?auto_648340 ?auto_648341 ) ( ON ?auto_648339 ?auto_648340 ) ( ON ?auto_648338 ?auto_648339 ) ( ON ?auto_648337 ?auto_648338 ) ( ON ?auto_648336 ?auto_648337 ) ( ON ?auto_648335 ?auto_648336 ) ( CLEAR ?auto_648333 ) ( ON ?auto_648334 ?auto_648335 ) ( CLEAR ?auto_648334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_648326 ?auto_648327 ?auto_648328 ?auto_648329 ?auto_648330 ?auto_648331 ?auto_648332 ?auto_648333 ?auto_648334 )
      ( MAKE-16PILE ?auto_648326 ?auto_648327 ?auto_648328 ?auto_648329 ?auto_648330 ?auto_648331 ?auto_648332 ?auto_648333 ?auto_648334 ?auto_648335 ?auto_648336 ?auto_648337 ?auto_648338 ?auto_648339 ?auto_648340 ?auto_648341 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648392 - BLOCK
      ?auto_648393 - BLOCK
      ?auto_648394 - BLOCK
      ?auto_648395 - BLOCK
      ?auto_648396 - BLOCK
      ?auto_648397 - BLOCK
      ?auto_648398 - BLOCK
      ?auto_648399 - BLOCK
      ?auto_648400 - BLOCK
      ?auto_648401 - BLOCK
      ?auto_648402 - BLOCK
      ?auto_648403 - BLOCK
      ?auto_648404 - BLOCK
      ?auto_648405 - BLOCK
      ?auto_648406 - BLOCK
      ?auto_648407 - BLOCK
    )
    :vars
    (
      ?auto_648408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648407 ?auto_648408 ) ( ON-TABLE ?auto_648392 ) ( ON ?auto_648393 ?auto_648392 ) ( ON ?auto_648394 ?auto_648393 ) ( ON ?auto_648395 ?auto_648394 ) ( ON ?auto_648396 ?auto_648395 ) ( ON ?auto_648397 ?auto_648396 ) ( ON ?auto_648398 ?auto_648397 ) ( not ( = ?auto_648392 ?auto_648393 ) ) ( not ( = ?auto_648392 ?auto_648394 ) ) ( not ( = ?auto_648392 ?auto_648395 ) ) ( not ( = ?auto_648392 ?auto_648396 ) ) ( not ( = ?auto_648392 ?auto_648397 ) ) ( not ( = ?auto_648392 ?auto_648398 ) ) ( not ( = ?auto_648392 ?auto_648399 ) ) ( not ( = ?auto_648392 ?auto_648400 ) ) ( not ( = ?auto_648392 ?auto_648401 ) ) ( not ( = ?auto_648392 ?auto_648402 ) ) ( not ( = ?auto_648392 ?auto_648403 ) ) ( not ( = ?auto_648392 ?auto_648404 ) ) ( not ( = ?auto_648392 ?auto_648405 ) ) ( not ( = ?auto_648392 ?auto_648406 ) ) ( not ( = ?auto_648392 ?auto_648407 ) ) ( not ( = ?auto_648392 ?auto_648408 ) ) ( not ( = ?auto_648393 ?auto_648394 ) ) ( not ( = ?auto_648393 ?auto_648395 ) ) ( not ( = ?auto_648393 ?auto_648396 ) ) ( not ( = ?auto_648393 ?auto_648397 ) ) ( not ( = ?auto_648393 ?auto_648398 ) ) ( not ( = ?auto_648393 ?auto_648399 ) ) ( not ( = ?auto_648393 ?auto_648400 ) ) ( not ( = ?auto_648393 ?auto_648401 ) ) ( not ( = ?auto_648393 ?auto_648402 ) ) ( not ( = ?auto_648393 ?auto_648403 ) ) ( not ( = ?auto_648393 ?auto_648404 ) ) ( not ( = ?auto_648393 ?auto_648405 ) ) ( not ( = ?auto_648393 ?auto_648406 ) ) ( not ( = ?auto_648393 ?auto_648407 ) ) ( not ( = ?auto_648393 ?auto_648408 ) ) ( not ( = ?auto_648394 ?auto_648395 ) ) ( not ( = ?auto_648394 ?auto_648396 ) ) ( not ( = ?auto_648394 ?auto_648397 ) ) ( not ( = ?auto_648394 ?auto_648398 ) ) ( not ( = ?auto_648394 ?auto_648399 ) ) ( not ( = ?auto_648394 ?auto_648400 ) ) ( not ( = ?auto_648394 ?auto_648401 ) ) ( not ( = ?auto_648394 ?auto_648402 ) ) ( not ( = ?auto_648394 ?auto_648403 ) ) ( not ( = ?auto_648394 ?auto_648404 ) ) ( not ( = ?auto_648394 ?auto_648405 ) ) ( not ( = ?auto_648394 ?auto_648406 ) ) ( not ( = ?auto_648394 ?auto_648407 ) ) ( not ( = ?auto_648394 ?auto_648408 ) ) ( not ( = ?auto_648395 ?auto_648396 ) ) ( not ( = ?auto_648395 ?auto_648397 ) ) ( not ( = ?auto_648395 ?auto_648398 ) ) ( not ( = ?auto_648395 ?auto_648399 ) ) ( not ( = ?auto_648395 ?auto_648400 ) ) ( not ( = ?auto_648395 ?auto_648401 ) ) ( not ( = ?auto_648395 ?auto_648402 ) ) ( not ( = ?auto_648395 ?auto_648403 ) ) ( not ( = ?auto_648395 ?auto_648404 ) ) ( not ( = ?auto_648395 ?auto_648405 ) ) ( not ( = ?auto_648395 ?auto_648406 ) ) ( not ( = ?auto_648395 ?auto_648407 ) ) ( not ( = ?auto_648395 ?auto_648408 ) ) ( not ( = ?auto_648396 ?auto_648397 ) ) ( not ( = ?auto_648396 ?auto_648398 ) ) ( not ( = ?auto_648396 ?auto_648399 ) ) ( not ( = ?auto_648396 ?auto_648400 ) ) ( not ( = ?auto_648396 ?auto_648401 ) ) ( not ( = ?auto_648396 ?auto_648402 ) ) ( not ( = ?auto_648396 ?auto_648403 ) ) ( not ( = ?auto_648396 ?auto_648404 ) ) ( not ( = ?auto_648396 ?auto_648405 ) ) ( not ( = ?auto_648396 ?auto_648406 ) ) ( not ( = ?auto_648396 ?auto_648407 ) ) ( not ( = ?auto_648396 ?auto_648408 ) ) ( not ( = ?auto_648397 ?auto_648398 ) ) ( not ( = ?auto_648397 ?auto_648399 ) ) ( not ( = ?auto_648397 ?auto_648400 ) ) ( not ( = ?auto_648397 ?auto_648401 ) ) ( not ( = ?auto_648397 ?auto_648402 ) ) ( not ( = ?auto_648397 ?auto_648403 ) ) ( not ( = ?auto_648397 ?auto_648404 ) ) ( not ( = ?auto_648397 ?auto_648405 ) ) ( not ( = ?auto_648397 ?auto_648406 ) ) ( not ( = ?auto_648397 ?auto_648407 ) ) ( not ( = ?auto_648397 ?auto_648408 ) ) ( not ( = ?auto_648398 ?auto_648399 ) ) ( not ( = ?auto_648398 ?auto_648400 ) ) ( not ( = ?auto_648398 ?auto_648401 ) ) ( not ( = ?auto_648398 ?auto_648402 ) ) ( not ( = ?auto_648398 ?auto_648403 ) ) ( not ( = ?auto_648398 ?auto_648404 ) ) ( not ( = ?auto_648398 ?auto_648405 ) ) ( not ( = ?auto_648398 ?auto_648406 ) ) ( not ( = ?auto_648398 ?auto_648407 ) ) ( not ( = ?auto_648398 ?auto_648408 ) ) ( not ( = ?auto_648399 ?auto_648400 ) ) ( not ( = ?auto_648399 ?auto_648401 ) ) ( not ( = ?auto_648399 ?auto_648402 ) ) ( not ( = ?auto_648399 ?auto_648403 ) ) ( not ( = ?auto_648399 ?auto_648404 ) ) ( not ( = ?auto_648399 ?auto_648405 ) ) ( not ( = ?auto_648399 ?auto_648406 ) ) ( not ( = ?auto_648399 ?auto_648407 ) ) ( not ( = ?auto_648399 ?auto_648408 ) ) ( not ( = ?auto_648400 ?auto_648401 ) ) ( not ( = ?auto_648400 ?auto_648402 ) ) ( not ( = ?auto_648400 ?auto_648403 ) ) ( not ( = ?auto_648400 ?auto_648404 ) ) ( not ( = ?auto_648400 ?auto_648405 ) ) ( not ( = ?auto_648400 ?auto_648406 ) ) ( not ( = ?auto_648400 ?auto_648407 ) ) ( not ( = ?auto_648400 ?auto_648408 ) ) ( not ( = ?auto_648401 ?auto_648402 ) ) ( not ( = ?auto_648401 ?auto_648403 ) ) ( not ( = ?auto_648401 ?auto_648404 ) ) ( not ( = ?auto_648401 ?auto_648405 ) ) ( not ( = ?auto_648401 ?auto_648406 ) ) ( not ( = ?auto_648401 ?auto_648407 ) ) ( not ( = ?auto_648401 ?auto_648408 ) ) ( not ( = ?auto_648402 ?auto_648403 ) ) ( not ( = ?auto_648402 ?auto_648404 ) ) ( not ( = ?auto_648402 ?auto_648405 ) ) ( not ( = ?auto_648402 ?auto_648406 ) ) ( not ( = ?auto_648402 ?auto_648407 ) ) ( not ( = ?auto_648402 ?auto_648408 ) ) ( not ( = ?auto_648403 ?auto_648404 ) ) ( not ( = ?auto_648403 ?auto_648405 ) ) ( not ( = ?auto_648403 ?auto_648406 ) ) ( not ( = ?auto_648403 ?auto_648407 ) ) ( not ( = ?auto_648403 ?auto_648408 ) ) ( not ( = ?auto_648404 ?auto_648405 ) ) ( not ( = ?auto_648404 ?auto_648406 ) ) ( not ( = ?auto_648404 ?auto_648407 ) ) ( not ( = ?auto_648404 ?auto_648408 ) ) ( not ( = ?auto_648405 ?auto_648406 ) ) ( not ( = ?auto_648405 ?auto_648407 ) ) ( not ( = ?auto_648405 ?auto_648408 ) ) ( not ( = ?auto_648406 ?auto_648407 ) ) ( not ( = ?auto_648406 ?auto_648408 ) ) ( not ( = ?auto_648407 ?auto_648408 ) ) ( ON ?auto_648406 ?auto_648407 ) ( ON ?auto_648405 ?auto_648406 ) ( ON ?auto_648404 ?auto_648405 ) ( ON ?auto_648403 ?auto_648404 ) ( ON ?auto_648402 ?auto_648403 ) ( ON ?auto_648401 ?auto_648402 ) ( ON ?auto_648400 ?auto_648401 ) ( CLEAR ?auto_648398 ) ( ON ?auto_648399 ?auto_648400 ) ( CLEAR ?auto_648399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_648392 ?auto_648393 ?auto_648394 ?auto_648395 ?auto_648396 ?auto_648397 ?auto_648398 ?auto_648399 )
      ( MAKE-16PILE ?auto_648392 ?auto_648393 ?auto_648394 ?auto_648395 ?auto_648396 ?auto_648397 ?auto_648398 ?auto_648399 ?auto_648400 ?auto_648401 ?auto_648402 ?auto_648403 ?auto_648404 ?auto_648405 ?auto_648406 ?auto_648407 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648458 - BLOCK
      ?auto_648459 - BLOCK
      ?auto_648460 - BLOCK
      ?auto_648461 - BLOCK
      ?auto_648462 - BLOCK
      ?auto_648463 - BLOCK
      ?auto_648464 - BLOCK
      ?auto_648465 - BLOCK
      ?auto_648466 - BLOCK
      ?auto_648467 - BLOCK
      ?auto_648468 - BLOCK
      ?auto_648469 - BLOCK
      ?auto_648470 - BLOCK
      ?auto_648471 - BLOCK
      ?auto_648472 - BLOCK
      ?auto_648473 - BLOCK
    )
    :vars
    (
      ?auto_648474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648473 ?auto_648474 ) ( ON-TABLE ?auto_648458 ) ( ON ?auto_648459 ?auto_648458 ) ( ON ?auto_648460 ?auto_648459 ) ( ON ?auto_648461 ?auto_648460 ) ( ON ?auto_648462 ?auto_648461 ) ( ON ?auto_648463 ?auto_648462 ) ( not ( = ?auto_648458 ?auto_648459 ) ) ( not ( = ?auto_648458 ?auto_648460 ) ) ( not ( = ?auto_648458 ?auto_648461 ) ) ( not ( = ?auto_648458 ?auto_648462 ) ) ( not ( = ?auto_648458 ?auto_648463 ) ) ( not ( = ?auto_648458 ?auto_648464 ) ) ( not ( = ?auto_648458 ?auto_648465 ) ) ( not ( = ?auto_648458 ?auto_648466 ) ) ( not ( = ?auto_648458 ?auto_648467 ) ) ( not ( = ?auto_648458 ?auto_648468 ) ) ( not ( = ?auto_648458 ?auto_648469 ) ) ( not ( = ?auto_648458 ?auto_648470 ) ) ( not ( = ?auto_648458 ?auto_648471 ) ) ( not ( = ?auto_648458 ?auto_648472 ) ) ( not ( = ?auto_648458 ?auto_648473 ) ) ( not ( = ?auto_648458 ?auto_648474 ) ) ( not ( = ?auto_648459 ?auto_648460 ) ) ( not ( = ?auto_648459 ?auto_648461 ) ) ( not ( = ?auto_648459 ?auto_648462 ) ) ( not ( = ?auto_648459 ?auto_648463 ) ) ( not ( = ?auto_648459 ?auto_648464 ) ) ( not ( = ?auto_648459 ?auto_648465 ) ) ( not ( = ?auto_648459 ?auto_648466 ) ) ( not ( = ?auto_648459 ?auto_648467 ) ) ( not ( = ?auto_648459 ?auto_648468 ) ) ( not ( = ?auto_648459 ?auto_648469 ) ) ( not ( = ?auto_648459 ?auto_648470 ) ) ( not ( = ?auto_648459 ?auto_648471 ) ) ( not ( = ?auto_648459 ?auto_648472 ) ) ( not ( = ?auto_648459 ?auto_648473 ) ) ( not ( = ?auto_648459 ?auto_648474 ) ) ( not ( = ?auto_648460 ?auto_648461 ) ) ( not ( = ?auto_648460 ?auto_648462 ) ) ( not ( = ?auto_648460 ?auto_648463 ) ) ( not ( = ?auto_648460 ?auto_648464 ) ) ( not ( = ?auto_648460 ?auto_648465 ) ) ( not ( = ?auto_648460 ?auto_648466 ) ) ( not ( = ?auto_648460 ?auto_648467 ) ) ( not ( = ?auto_648460 ?auto_648468 ) ) ( not ( = ?auto_648460 ?auto_648469 ) ) ( not ( = ?auto_648460 ?auto_648470 ) ) ( not ( = ?auto_648460 ?auto_648471 ) ) ( not ( = ?auto_648460 ?auto_648472 ) ) ( not ( = ?auto_648460 ?auto_648473 ) ) ( not ( = ?auto_648460 ?auto_648474 ) ) ( not ( = ?auto_648461 ?auto_648462 ) ) ( not ( = ?auto_648461 ?auto_648463 ) ) ( not ( = ?auto_648461 ?auto_648464 ) ) ( not ( = ?auto_648461 ?auto_648465 ) ) ( not ( = ?auto_648461 ?auto_648466 ) ) ( not ( = ?auto_648461 ?auto_648467 ) ) ( not ( = ?auto_648461 ?auto_648468 ) ) ( not ( = ?auto_648461 ?auto_648469 ) ) ( not ( = ?auto_648461 ?auto_648470 ) ) ( not ( = ?auto_648461 ?auto_648471 ) ) ( not ( = ?auto_648461 ?auto_648472 ) ) ( not ( = ?auto_648461 ?auto_648473 ) ) ( not ( = ?auto_648461 ?auto_648474 ) ) ( not ( = ?auto_648462 ?auto_648463 ) ) ( not ( = ?auto_648462 ?auto_648464 ) ) ( not ( = ?auto_648462 ?auto_648465 ) ) ( not ( = ?auto_648462 ?auto_648466 ) ) ( not ( = ?auto_648462 ?auto_648467 ) ) ( not ( = ?auto_648462 ?auto_648468 ) ) ( not ( = ?auto_648462 ?auto_648469 ) ) ( not ( = ?auto_648462 ?auto_648470 ) ) ( not ( = ?auto_648462 ?auto_648471 ) ) ( not ( = ?auto_648462 ?auto_648472 ) ) ( not ( = ?auto_648462 ?auto_648473 ) ) ( not ( = ?auto_648462 ?auto_648474 ) ) ( not ( = ?auto_648463 ?auto_648464 ) ) ( not ( = ?auto_648463 ?auto_648465 ) ) ( not ( = ?auto_648463 ?auto_648466 ) ) ( not ( = ?auto_648463 ?auto_648467 ) ) ( not ( = ?auto_648463 ?auto_648468 ) ) ( not ( = ?auto_648463 ?auto_648469 ) ) ( not ( = ?auto_648463 ?auto_648470 ) ) ( not ( = ?auto_648463 ?auto_648471 ) ) ( not ( = ?auto_648463 ?auto_648472 ) ) ( not ( = ?auto_648463 ?auto_648473 ) ) ( not ( = ?auto_648463 ?auto_648474 ) ) ( not ( = ?auto_648464 ?auto_648465 ) ) ( not ( = ?auto_648464 ?auto_648466 ) ) ( not ( = ?auto_648464 ?auto_648467 ) ) ( not ( = ?auto_648464 ?auto_648468 ) ) ( not ( = ?auto_648464 ?auto_648469 ) ) ( not ( = ?auto_648464 ?auto_648470 ) ) ( not ( = ?auto_648464 ?auto_648471 ) ) ( not ( = ?auto_648464 ?auto_648472 ) ) ( not ( = ?auto_648464 ?auto_648473 ) ) ( not ( = ?auto_648464 ?auto_648474 ) ) ( not ( = ?auto_648465 ?auto_648466 ) ) ( not ( = ?auto_648465 ?auto_648467 ) ) ( not ( = ?auto_648465 ?auto_648468 ) ) ( not ( = ?auto_648465 ?auto_648469 ) ) ( not ( = ?auto_648465 ?auto_648470 ) ) ( not ( = ?auto_648465 ?auto_648471 ) ) ( not ( = ?auto_648465 ?auto_648472 ) ) ( not ( = ?auto_648465 ?auto_648473 ) ) ( not ( = ?auto_648465 ?auto_648474 ) ) ( not ( = ?auto_648466 ?auto_648467 ) ) ( not ( = ?auto_648466 ?auto_648468 ) ) ( not ( = ?auto_648466 ?auto_648469 ) ) ( not ( = ?auto_648466 ?auto_648470 ) ) ( not ( = ?auto_648466 ?auto_648471 ) ) ( not ( = ?auto_648466 ?auto_648472 ) ) ( not ( = ?auto_648466 ?auto_648473 ) ) ( not ( = ?auto_648466 ?auto_648474 ) ) ( not ( = ?auto_648467 ?auto_648468 ) ) ( not ( = ?auto_648467 ?auto_648469 ) ) ( not ( = ?auto_648467 ?auto_648470 ) ) ( not ( = ?auto_648467 ?auto_648471 ) ) ( not ( = ?auto_648467 ?auto_648472 ) ) ( not ( = ?auto_648467 ?auto_648473 ) ) ( not ( = ?auto_648467 ?auto_648474 ) ) ( not ( = ?auto_648468 ?auto_648469 ) ) ( not ( = ?auto_648468 ?auto_648470 ) ) ( not ( = ?auto_648468 ?auto_648471 ) ) ( not ( = ?auto_648468 ?auto_648472 ) ) ( not ( = ?auto_648468 ?auto_648473 ) ) ( not ( = ?auto_648468 ?auto_648474 ) ) ( not ( = ?auto_648469 ?auto_648470 ) ) ( not ( = ?auto_648469 ?auto_648471 ) ) ( not ( = ?auto_648469 ?auto_648472 ) ) ( not ( = ?auto_648469 ?auto_648473 ) ) ( not ( = ?auto_648469 ?auto_648474 ) ) ( not ( = ?auto_648470 ?auto_648471 ) ) ( not ( = ?auto_648470 ?auto_648472 ) ) ( not ( = ?auto_648470 ?auto_648473 ) ) ( not ( = ?auto_648470 ?auto_648474 ) ) ( not ( = ?auto_648471 ?auto_648472 ) ) ( not ( = ?auto_648471 ?auto_648473 ) ) ( not ( = ?auto_648471 ?auto_648474 ) ) ( not ( = ?auto_648472 ?auto_648473 ) ) ( not ( = ?auto_648472 ?auto_648474 ) ) ( not ( = ?auto_648473 ?auto_648474 ) ) ( ON ?auto_648472 ?auto_648473 ) ( ON ?auto_648471 ?auto_648472 ) ( ON ?auto_648470 ?auto_648471 ) ( ON ?auto_648469 ?auto_648470 ) ( ON ?auto_648468 ?auto_648469 ) ( ON ?auto_648467 ?auto_648468 ) ( ON ?auto_648466 ?auto_648467 ) ( ON ?auto_648465 ?auto_648466 ) ( CLEAR ?auto_648463 ) ( ON ?auto_648464 ?auto_648465 ) ( CLEAR ?auto_648464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_648458 ?auto_648459 ?auto_648460 ?auto_648461 ?auto_648462 ?auto_648463 ?auto_648464 )
      ( MAKE-16PILE ?auto_648458 ?auto_648459 ?auto_648460 ?auto_648461 ?auto_648462 ?auto_648463 ?auto_648464 ?auto_648465 ?auto_648466 ?auto_648467 ?auto_648468 ?auto_648469 ?auto_648470 ?auto_648471 ?auto_648472 ?auto_648473 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648524 - BLOCK
      ?auto_648525 - BLOCK
      ?auto_648526 - BLOCK
      ?auto_648527 - BLOCK
      ?auto_648528 - BLOCK
      ?auto_648529 - BLOCK
      ?auto_648530 - BLOCK
      ?auto_648531 - BLOCK
      ?auto_648532 - BLOCK
      ?auto_648533 - BLOCK
      ?auto_648534 - BLOCK
      ?auto_648535 - BLOCK
      ?auto_648536 - BLOCK
      ?auto_648537 - BLOCK
      ?auto_648538 - BLOCK
      ?auto_648539 - BLOCK
    )
    :vars
    (
      ?auto_648540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648539 ?auto_648540 ) ( ON-TABLE ?auto_648524 ) ( ON ?auto_648525 ?auto_648524 ) ( ON ?auto_648526 ?auto_648525 ) ( ON ?auto_648527 ?auto_648526 ) ( ON ?auto_648528 ?auto_648527 ) ( not ( = ?auto_648524 ?auto_648525 ) ) ( not ( = ?auto_648524 ?auto_648526 ) ) ( not ( = ?auto_648524 ?auto_648527 ) ) ( not ( = ?auto_648524 ?auto_648528 ) ) ( not ( = ?auto_648524 ?auto_648529 ) ) ( not ( = ?auto_648524 ?auto_648530 ) ) ( not ( = ?auto_648524 ?auto_648531 ) ) ( not ( = ?auto_648524 ?auto_648532 ) ) ( not ( = ?auto_648524 ?auto_648533 ) ) ( not ( = ?auto_648524 ?auto_648534 ) ) ( not ( = ?auto_648524 ?auto_648535 ) ) ( not ( = ?auto_648524 ?auto_648536 ) ) ( not ( = ?auto_648524 ?auto_648537 ) ) ( not ( = ?auto_648524 ?auto_648538 ) ) ( not ( = ?auto_648524 ?auto_648539 ) ) ( not ( = ?auto_648524 ?auto_648540 ) ) ( not ( = ?auto_648525 ?auto_648526 ) ) ( not ( = ?auto_648525 ?auto_648527 ) ) ( not ( = ?auto_648525 ?auto_648528 ) ) ( not ( = ?auto_648525 ?auto_648529 ) ) ( not ( = ?auto_648525 ?auto_648530 ) ) ( not ( = ?auto_648525 ?auto_648531 ) ) ( not ( = ?auto_648525 ?auto_648532 ) ) ( not ( = ?auto_648525 ?auto_648533 ) ) ( not ( = ?auto_648525 ?auto_648534 ) ) ( not ( = ?auto_648525 ?auto_648535 ) ) ( not ( = ?auto_648525 ?auto_648536 ) ) ( not ( = ?auto_648525 ?auto_648537 ) ) ( not ( = ?auto_648525 ?auto_648538 ) ) ( not ( = ?auto_648525 ?auto_648539 ) ) ( not ( = ?auto_648525 ?auto_648540 ) ) ( not ( = ?auto_648526 ?auto_648527 ) ) ( not ( = ?auto_648526 ?auto_648528 ) ) ( not ( = ?auto_648526 ?auto_648529 ) ) ( not ( = ?auto_648526 ?auto_648530 ) ) ( not ( = ?auto_648526 ?auto_648531 ) ) ( not ( = ?auto_648526 ?auto_648532 ) ) ( not ( = ?auto_648526 ?auto_648533 ) ) ( not ( = ?auto_648526 ?auto_648534 ) ) ( not ( = ?auto_648526 ?auto_648535 ) ) ( not ( = ?auto_648526 ?auto_648536 ) ) ( not ( = ?auto_648526 ?auto_648537 ) ) ( not ( = ?auto_648526 ?auto_648538 ) ) ( not ( = ?auto_648526 ?auto_648539 ) ) ( not ( = ?auto_648526 ?auto_648540 ) ) ( not ( = ?auto_648527 ?auto_648528 ) ) ( not ( = ?auto_648527 ?auto_648529 ) ) ( not ( = ?auto_648527 ?auto_648530 ) ) ( not ( = ?auto_648527 ?auto_648531 ) ) ( not ( = ?auto_648527 ?auto_648532 ) ) ( not ( = ?auto_648527 ?auto_648533 ) ) ( not ( = ?auto_648527 ?auto_648534 ) ) ( not ( = ?auto_648527 ?auto_648535 ) ) ( not ( = ?auto_648527 ?auto_648536 ) ) ( not ( = ?auto_648527 ?auto_648537 ) ) ( not ( = ?auto_648527 ?auto_648538 ) ) ( not ( = ?auto_648527 ?auto_648539 ) ) ( not ( = ?auto_648527 ?auto_648540 ) ) ( not ( = ?auto_648528 ?auto_648529 ) ) ( not ( = ?auto_648528 ?auto_648530 ) ) ( not ( = ?auto_648528 ?auto_648531 ) ) ( not ( = ?auto_648528 ?auto_648532 ) ) ( not ( = ?auto_648528 ?auto_648533 ) ) ( not ( = ?auto_648528 ?auto_648534 ) ) ( not ( = ?auto_648528 ?auto_648535 ) ) ( not ( = ?auto_648528 ?auto_648536 ) ) ( not ( = ?auto_648528 ?auto_648537 ) ) ( not ( = ?auto_648528 ?auto_648538 ) ) ( not ( = ?auto_648528 ?auto_648539 ) ) ( not ( = ?auto_648528 ?auto_648540 ) ) ( not ( = ?auto_648529 ?auto_648530 ) ) ( not ( = ?auto_648529 ?auto_648531 ) ) ( not ( = ?auto_648529 ?auto_648532 ) ) ( not ( = ?auto_648529 ?auto_648533 ) ) ( not ( = ?auto_648529 ?auto_648534 ) ) ( not ( = ?auto_648529 ?auto_648535 ) ) ( not ( = ?auto_648529 ?auto_648536 ) ) ( not ( = ?auto_648529 ?auto_648537 ) ) ( not ( = ?auto_648529 ?auto_648538 ) ) ( not ( = ?auto_648529 ?auto_648539 ) ) ( not ( = ?auto_648529 ?auto_648540 ) ) ( not ( = ?auto_648530 ?auto_648531 ) ) ( not ( = ?auto_648530 ?auto_648532 ) ) ( not ( = ?auto_648530 ?auto_648533 ) ) ( not ( = ?auto_648530 ?auto_648534 ) ) ( not ( = ?auto_648530 ?auto_648535 ) ) ( not ( = ?auto_648530 ?auto_648536 ) ) ( not ( = ?auto_648530 ?auto_648537 ) ) ( not ( = ?auto_648530 ?auto_648538 ) ) ( not ( = ?auto_648530 ?auto_648539 ) ) ( not ( = ?auto_648530 ?auto_648540 ) ) ( not ( = ?auto_648531 ?auto_648532 ) ) ( not ( = ?auto_648531 ?auto_648533 ) ) ( not ( = ?auto_648531 ?auto_648534 ) ) ( not ( = ?auto_648531 ?auto_648535 ) ) ( not ( = ?auto_648531 ?auto_648536 ) ) ( not ( = ?auto_648531 ?auto_648537 ) ) ( not ( = ?auto_648531 ?auto_648538 ) ) ( not ( = ?auto_648531 ?auto_648539 ) ) ( not ( = ?auto_648531 ?auto_648540 ) ) ( not ( = ?auto_648532 ?auto_648533 ) ) ( not ( = ?auto_648532 ?auto_648534 ) ) ( not ( = ?auto_648532 ?auto_648535 ) ) ( not ( = ?auto_648532 ?auto_648536 ) ) ( not ( = ?auto_648532 ?auto_648537 ) ) ( not ( = ?auto_648532 ?auto_648538 ) ) ( not ( = ?auto_648532 ?auto_648539 ) ) ( not ( = ?auto_648532 ?auto_648540 ) ) ( not ( = ?auto_648533 ?auto_648534 ) ) ( not ( = ?auto_648533 ?auto_648535 ) ) ( not ( = ?auto_648533 ?auto_648536 ) ) ( not ( = ?auto_648533 ?auto_648537 ) ) ( not ( = ?auto_648533 ?auto_648538 ) ) ( not ( = ?auto_648533 ?auto_648539 ) ) ( not ( = ?auto_648533 ?auto_648540 ) ) ( not ( = ?auto_648534 ?auto_648535 ) ) ( not ( = ?auto_648534 ?auto_648536 ) ) ( not ( = ?auto_648534 ?auto_648537 ) ) ( not ( = ?auto_648534 ?auto_648538 ) ) ( not ( = ?auto_648534 ?auto_648539 ) ) ( not ( = ?auto_648534 ?auto_648540 ) ) ( not ( = ?auto_648535 ?auto_648536 ) ) ( not ( = ?auto_648535 ?auto_648537 ) ) ( not ( = ?auto_648535 ?auto_648538 ) ) ( not ( = ?auto_648535 ?auto_648539 ) ) ( not ( = ?auto_648535 ?auto_648540 ) ) ( not ( = ?auto_648536 ?auto_648537 ) ) ( not ( = ?auto_648536 ?auto_648538 ) ) ( not ( = ?auto_648536 ?auto_648539 ) ) ( not ( = ?auto_648536 ?auto_648540 ) ) ( not ( = ?auto_648537 ?auto_648538 ) ) ( not ( = ?auto_648537 ?auto_648539 ) ) ( not ( = ?auto_648537 ?auto_648540 ) ) ( not ( = ?auto_648538 ?auto_648539 ) ) ( not ( = ?auto_648538 ?auto_648540 ) ) ( not ( = ?auto_648539 ?auto_648540 ) ) ( ON ?auto_648538 ?auto_648539 ) ( ON ?auto_648537 ?auto_648538 ) ( ON ?auto_648536 ?auto_648537 ) ( ON ?auto_648535 ?auto_648536 ) ( ON ?auto_648534 ?auto_648535 ) ( ON ?auto_648533 ?auto_648534 ) ( ON ?auto_648532 ?auto_648533 ) ( ON ?auto_648531 ?auto_648532 ) ( ON ?auto_648530 ?auto_648531 ) ( CLEAR ?auto_648528 ) ( ON ?auto_648529 ?auto_648530 ) ( CLEAR ?auto_648529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_648524 ?auto_648525 ?auto_648526 ?auto_648527 ?auto_648528 ?auto_648529 )
      ( MAKE-16PILE ?auto_648524 ?auto_648525 ?auto_648526 ?auto_648527 ?auto_648528 ?auto_648529 ?auto_648530 ?auto_648531 ?auto_648532 ?auto_648533 ?auto_648534 ?auto_648535 ?auto_648536 ?auto_648537 ?auto_648538 ?auto_648539 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648590 - BLOCK
      ?auto_648591 - BLOCK
      ?auto_648592 - BLOCK
      ?auto_648593 - BLOCK
      ?auto_648594 - BLOCK
      ?auto_648595 - BLOCK
      ?auto_648596 - BLOCK
      ?auto_648597 - BLOCK
      ?auto_648598 - BLOCK
      ?auto_648599 - BLOCK
      ?auto_648600 - BLOCK
      ?auto_648601 - BLOCK
      ?auto_648602 - BLOCK
      ?auto_648603 - BLOCK
      ?auto_648604 - BLOCK
      ?auto_648605 - BLOCK
    )
    :vars
    (
      ?auto_648606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648605 ?auto_648606 ) ( ON-TABLE ?auto_648590 ) ( ON ?auto_648591 ?auto_648590 ) ( ON ?auto_648592 ?auto_648591 ) ( ON ?auto_648593 ?auto_648592 ) ( not ( = ?auto_648590 ?auto_648591 ) ) ( not ( = ?auto_648590 ?auto_648592 ) ) ( not ( = ?auto_648590 ?auto_648593 ) ) ( not ( = ?auto_648590 ?auto_648594 ) ) ( not ( = ?auto_648590 ?auto_648595 ) ) ( not ( = ?auto_648590 ?auto_648596 ) ) ( not ( = ?auto_648590 ?auto_648597 ) ) ( not ( = ?auto_648590 ?auto_648598 ) ) ( not ( = ?auto_648590 ?auto_648599 ) ) ( not ( = ?auto_648590 ?auto_648600 ) ) ( not ( = ?auto_648590 ?auto_648601 ) ) ( not ( = ?auto_648590 ?auto_648602 ) ) ( not ( = ?auto_648590 ?auto_648603 ) ) ( not ( = ?auto_648590 ?auto_648604 ) ) ( not ( = ?auto_648590 ?auto_648605 ) ) ( not ( = ?auto_648590 ?auto_648606 ) ) ( not ( = ?auto_648591 ?auto_648592 ) ) ( not ( = ?auto_648591 ?auto_648593 ) ) ( not ( = ?auto_648591 ?auto_648594 ) ) ( not ( = ?auto_648591 ?auto_648595 ) ) ( not ( = ?auto_648591 ?auto_648596 ) ) ( not ( = ?auto_648591 ?auto_648597 ) ) ( not ( = ?auto_648591 ?auto_648598 ) ) ( not ( = ?auto_648591 ?auto_648599 ) ) ( not ( = ?auto_648591 ?auto_648600 ) ) ( not ( = ?auto_648591 ?auto_648601 ) ) ( not ( = ?auto_648591 ?auto_648602 ) ) ( not ( = ?auto_648591 ?auto_648603 ) ) ( not ( = ?auto_648591 ?auto_648604 ) ) ( not ( = ?auto_648591 ?auto_648605 ) ) ( not ( = ?auto_648591 ?auto_648606 ) ) ( not ( = ?auto_648592 ?auto_648593 ) ) ( not ( = ?auto_648592 ?auto_648594 ) ) ( not ( = ?auto_648592 ?auto_648595 ) ) ( not ( = ?auto_648592 ?auto_648596 ) ) ( not ( = ?auto_648592 ?auto_648597 ) ) ( not ( = ?auto_648592 ?auto_648598 ) ) ( not ( = ?auto_648592 ?auto_648599 ) ) ( not ( = ?auto_648592 ?auto_648600 ) ) ( not ( = ?auto_648592 ?auto_648601 ) ) ( not ( = ?auto_648592 ?auto_648602 ) ) ( not ( = ?auto_648592 ?auto_648603 ) ) ( not ( = ?auto_648592 ?auto_648604 ) ) ( not ( = ?auto_648592 ?auto_648605 ) ) ( not ( = ?auto_648592 ?auto_648606 ) ) ( not ( = ?auto_648593 ?auto_648594 ) ) ( not ( = ?auto_648593 ?auto_648595 ) ) ( not ( = ?auto_648593 ?auto_648596 ) ) ( not ( = ?auto_648593 ?auto_648597 ) ) ( not ( = ?auto_648593 ?auto_648598 ) ) ( not ( = ?auto_648593 ?auto_648599 ) ) ( not ( = ?auto_648593 ?auto_648600 ) ) ( not ( = ?auto_648593 ?auto_648601 ) ) ( not ( = ?auto_648593 ?auto_648602 ) ) ( not ( = ?auto_648593 ?auto_648603 ) ) ( not ( = ?auto_648593 ?auto_648604 ) ) ( not ( = ?auto_648593 ?auto_648605 ) ) ( not ( = ?auto_648593 ?auto_648606 ) ) ( not ( = ?auto_648594 ?auto_648595 ) ) ( not ( = ?auto_648594 ?auto_648596 ) ) ( not ( = ?auto_648594 ?auto_648597 ) ) ( not ( = ?auto_648594 ?auto_648598 ) ) ( not ( = ?auto_648594 ?auto_648599 ) ) ( not ( = ?auto_648594 ?auto_648600 ) ) ( not ( = ?auto_648594 ?auto_648601 ) ) ( not ( = ?auto_648594 ?auto_648602 ) ) ( not ( = ?auto_648594 ?auto_648603 ) ) ( not ( = ?auto_648594 ?auto_648604 ) ) ( not ( = ?auto_648594 ?auto_648605 ) ) ( not ( = ?auto_648594 ?auto_648606 ) ) ( not ( = ?auto_648595 ?auto_648596 ) ) ( not ( = ?auto_648595 ?auto_648597 ) ) ( not ( = ?auto_648595 ?auto_648598 ) ) ( not ( = ?auto_648595 ?auto_648599 ) ) ( not ( = ?auto_648595 ?auto_648600 ) ) ( not ( = ?auto_648595 ?auto_648601 ) ) ( not ( = ?auto_648595 ?auto_648602 ) ) ( not ( = ?auto_648595 ?auto_648603 ) ) ( not ( = ?auto_648595 ?auto_648604 ) ) ( not ( = ?auto_648595 ?auto_648605 ) ) ( not ( = ?auto_648595 ?auto_648606 ) ) ( not ( = ?auto_648596 ?auto_648597 ) ) ( not ( = ?auto_648596 ?auto_648598 ) ) ( not ( = ?auto_648596 ?auto_648599 ) ) ( not ( = ?auto_648596 ?auto_648600 ) ) ( not ( = ?auto_648596 ?auto_648601 ) ) ( not ( = ?auto_648596 ?auto_648602 ) ) ( not ( = ?auto_648596 ?auto_648603 ) ) ( not ( = ?auto_648596 ?auto_648604 ) ) ( not ( = ?auto_648596 ?auto_648605 ) ) ( not ( = ?auto_648596 ?auto_648606 ) ) ( not ( = ?auto_648597 ?auto_648598 ) ) ( not ( = ?auto_648597 ?auto_648599 ) ) ( not ( = ?auto_648597 ?auto_648600 ) ) ( not ( = ?auto_648597 ?auto_648601 ) ) ( not ( = ?auto_648597 ?auto_648602 ) ) ( not ( = ?auto_648597 ?auto_648603 ) ) ( not ( = ?auto_648597 ?auto_648604 ) ) ( not ( = ?auto_648597 ?auto_648605 ) ) ( not ( = ?auto_648597 ?auto_648606 ) ) ( not ( = ?auto_648598 ?auto_648599 ) ) ( not ( = ?auto_648598 ?auto_648600 ) ) ( not ( = ?auto_648598 ?auto_648601 ) ) ( not ( = ?auto_648598 ?auto_648602 ) ) ( not ( = ?auto_648598 ?auto_648603 ) ) ( not ( = ?auto_648598 ?auto_648604 ) ) ( not ( = ?auto_648598 ?auto_648605 ) ) ( not ( = ?auto_648598 ?auto_648606 ) ) ( not ( = ?auto_648599 ?auto_648600 ) ) ( not ( = ?auto_648599 ?auto_648601 ) ) ( not ( = ?auto_648599 ?auto_648602 ) ) ( not ( = ?auto_648599 ?auto_648603 ) ) ( not ( = ?auto_648599 ?auto_648604 ) ) ( not ( = ?auto_648599 ?auto_648605 ) ) ( not ( = ?auto_648599 ?auto_648606 ) ) ( not ( = ?auto_648600 ?auto_648601 ) ) ( not ( = ?auto_648600 ?auto_648602 ) ) ( not ( = ?auto_648600 ?auto_648603 ) ) ( not ( = ?auto_648600 ?auto_648604 ) ) ( not ( = ?auto_648600 ?auto_648605 ) ) ( not ( = ?auto_648600 ?auto_648606 ) ) ( not ( = ?auto_648601 ?auto_648602 ) ) ( not ( = ?auto_648601 ?auto_648603 ) ) ( not ( = ?auto_648601 ?auto_648604 ) ) ( not ( = ?auto_648601 ?auto_648605 ) ) ( not ( = ?auto_648601 ?auto_648606 ) ) ( not ( = ?auto_648602 ?auto_648603 ) ) ( not ( = ?auto_648602 ?auto_648604 ) ) ( not ( = ?auto_648602 ?auto_648605 ) ) ( not ( = ?auto_648602 ?auto_648606 ) ) ( not ( = ?auto_648603 ?auto_648604 ) ) ( not ( = ?auto_648603 ?auto_648605 ) ) ( not ( = ?auto_648603 ?auto_648606 ) ) ( not ( = ?auto_648604 ?auto_648605 ) ) ( not ( = ?auto_648604 ?auto_648606 ) ) ( not ( = ?auto_648605 ?auto_648606 ) ) ( ON ?auto_648604 ?auto_648605 ) ( ON ?auto_648603 ?auto_648604 ) ( ON ?auto_648602 ?auto_648603 ) ( ON ?auto_648601 ?auto_648602 ) ( ON ?auto_648600 ?auto_648601 ) ( ON ?auto_648599 ?auto_648600 ) ( ON ?auto_648598 ?auto_648599 ) ( ON ?auto_648597 ?auto_648598 ) ( ON ?auto_648596 ?auto_648597 ) ( ON ?auto_648595 ?auto_648596 ) ( CLEAR ?auto_648593 ) ( ON ?auto_648594 ?auto_648595 ) ( CLEAR ?auto_648594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_648590 ?auto_648591 ?auto_648592 ?auto_648593 ?auto_648594 )
      ( MAKE-16PILE ?auto_648590 ?auto_648591 ?auto_648592 ?auto_648593 ?auto_648594 ?auto_648595 ?auto_648596 ?auto_648597 ?auto_648598 ?auto_648599 ?auto_648600 ?auto_648601 ?auto_648602 ?auto_648603 ?auto_648604 ?auto_648605 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648656 - BLOCK
      ?auto_648657 - BLOCK
      ?auto_648658 - BLOCK
      ?auto_648659 - BLOCK
      ?auto_648660 - BLOCK
      ?auto_648661 - BLOCK
      ?auto_648662 - BLOCK
      ?auto_648663 - BLOCK
      ?auto_648664 - BLOCK
      ?auto_648665 - BLOCK
      ?auto_648666 - BLOCK
      ?auto_648667 - BLOCK
      ?auto_648668 - BLOCK
      ?auto_648669 - BLOCK
      ?auto_648670 - BLOCK
      ?auto_648671 - BLOCK
    )
    :vars
    (
      ?auto_648672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648671 ?auto_648672 ) ( ON-TABLE ?auto_648656 ) ( ON ?auto_648657 ?auto_648656 ) ( ON ?auto_648658 ?auto_648657 ) ( not ( = ?auto_648656 ?auto_648657 ) ) ( not ( = ?auto_648656 ?auto_648658 ) ) ( not ( = ?auto_648656 ?auto_648659 ) ) ( not ( = ?auto_648656 ?auto_648660 ) ) ( not ( = ?auto_648656 ?auto_648661 ) ) ( not ( = ?auto_648656 ?auto_648662 ) ) ( not ( = ?auto_648656 ?auto_648663 ) ) ( not ( = ?auto_648656 ?auto_648664 ) ) ( not ( = ?auto_648656 ?auto_648665 ) ) ( not ( = ?auto_648656 ?auto_648666 ) ) ( not ( = ?auto_648656 ?auto_648667 ) ) ( not ( = ?auto_648656 ?auto_648668 ) ) ( not ( = ?auto_648656 ?auto_648669 ) ) ( not ( = ?auto_648656 ?auto_648670 ) ) ( not ( = ?auto_648656 ?auto_648671 ) ) ( not ( = ?auto_648656 ?auto_648672 ) ) ( not ( = ?auto_648657 ?auto_648658 ) ) ( not ( = ?auto_648657 ?auto_648659 ) ) ( not ( = ?auto_648657 ?auto_648660 ) ) ( not ( = ?auto_648657 ?auto_648661 ) ) ( not ( = ?auto_648657 ?auto_648662 ) ) ( not ( = ?auto_648657 ?auto_648663 ) ) ( not ( = ?auto_648657 ?auto_648664 ) ) ( not ( = ?auto_648657 ?auto_648665 ) ) ( not ( = ?auto_648657 ?auto_648666 ) ) ( not ( = ?auto_648657 ?auto_648667 ) ) ( not ( = ?auto_648657 ?auto_648668 ) ) ( not ( = ?auto_648657 ?auto_648669 ) ) ( not ( = ?auto_648657 ?auto_648670 ) ) ( not ( = ?auto_648657 ?auto_648671 ) ) ( not ( = ?auto_648657 ?auto_648672 ) ) ( not ( = ?auto_648658 ?auto_648659 ) ) ( not ( = ?auto_648658 ?auto_648660 ) ) ( not ( = ?auto_648658 ?auto_648661 ) ) ( not ( = ?auto_648658 ?auto_648662 ) ) ( not ( = ?auto_648658 ?auto_648663 ) ) ( not ( = ?auto_648658 ?auto_648664 ) ) ( not ( = ?auto_648658 ?auto_648665 ) ) ( not ( = ?auto_648658 ?auto_648666 ) ) ( not ( = ?auto_648658 ?auto_648667 ) ) ( not ( = ?auto_648658 ?auto_648668 ) ) ( not ( = ?auto_648658 ?auto_648669 ) ) ( not ( = ?auto_648658 ?auto_648670 ) ) ( not ( = ?auto_648658 ?auto_648671 ) ) ( not ( = ?auto_648658 ?auto_648672 ) ) ( not ( = ?auto_648659 ?auto_648660 ) ) ( not ( = ?auto_648659 ?auto_648661 ) ) ( not ( = ?auto_648659 ?auto_648662 ) ) ( not ( = ?auto_648659 ?auto_648663 ) ) ( not ( = ?auto_648659 ?auto_648664 ) ) ( not ( = ?auto_648659 ?auto_648665 ) ) ( not ( = ?auto_648659 ?auto_648666 ) ) ( not ( = ?auto_648659 ?auto_648667 ) ) ( not ( = ?auto_648659 ?auto_648668 ) ) ( not ( = ?auto_648659 ?auto_648669 ) ) ( not ( = ?auto_648659 ?auto_648670 ) ) ( not ( = ?auto_648659 ?auto_648671 ) ) ( not ( = ?auto_648659 ?auto_648672 ) ) ( not ( = ?auto_648660 ?auto_648661 ) ) ( not ( = ?auto_648660 ?auto_648662 ) ) ( not ( = ?auto_648660 ?auto_648663 ) ) ( not ( = ?auto_648660 ?auto_648664 ) ) ( not ( = ?auto_648660 ?auto_648665 ) ) ( not ( = ?auto_648660 ?auto_648666 ) ) ( not ( = ?auto_648660 ?auto_648667 ) ) ( not ( = ?auto_648660 ?auto_648668 ) ) ( not ( = ?auto_648660 ?auto_648669 ) ) ( not ( = ?auto_648660 ?auto_648670 ) ) ( not ( = ?auto_648660 ?auto_648671 ) ) ( not ( = ?auto_648660 ?auto_648672 ) ) ( not ( = ?auto_648661 ?auto_648662 ) ) ( not ( = ?auto_648661 ?auto_648663 ) ) ( not ( = ?auto_648661 ?auto_648664 ) ) ( not ( = ?auto_648661 ?auto_648665 ) ) ( not ( = ?auto_648661 ?auto_648666 ) ) ( not ( = ?auto_648661 ?auto_648667 ) ) ( not ( = ?auto_648661 ?auto_648668 ) ) ( not ( = ?auto_648661 ?auto_648669 ) ) ( not ( = ?auto_648661 ?auto_648670 ) ) ( not ( = ?auto_648661 ?auto_648671 ) ) ( not ( = ?auto_648661 ?auto_648672 ) ) ( not ( = ?auto_648662 ?auto_648663 ) ) ( not ( = ?auto_648662 ?auto_648664 ) ) ( not ( = ?auto_648662 ?auto_648665 ) ) ( not ( = ?auto_648662 ?auto_648666 ) ) ( not ( = ?auto_648662 ?auto_648667 ) ) ( not ( = ?auto_648662 ?auto_648668 ) ) ( not ( = ?auto_648662 ?auto_648669 ) ) ( not ( = ?auto_648662 ?auto_648670 ) ) ( not ( = ?auto_648662 ?auto_648671 ) ) ( not ( = ?auto_648662 ?auto_648672 ) ) ( not ( = ?auto_648663 ?auto_648664 ) ) ( not ( = ?auto_648663 ?auto_648665 ) ) ( not ( = ?auto_648663 ?auto_648666 ) ) ( not ( = ?auto_648663 ?auto_648667 ) ) ( not ( = ?auto_648663 ?auto_648668 ) ) ( not ( = ?auto_648663 ?auto_648669 ) ) ( not ( = ?auto_648663 ?auto_648670 ) ) ( not ( = ?auto_648663 ?auto_648671 ) ) ( not ( = ?auto_648663 ?auto_648672 ) ) ( not ( = ?auto_648664 ?auto_648665 ) ) ( not ( = ?auto_648664 ?auto_648666 ) ) ( not ( = ?auto_648664 ?auto_648667 ) ) ( not ( = ?auto_648664 ?auto_648668 ) ) ( not ( = ?auto_648664 ?auto_648669 ) ) ( not ( = ?auto_648664 ?auto_648670 ) ) ( not ( = ?auto_648664 ?auto_648671 ) ) ( not ( = ?auto_648664 ?auto_648672 ) ) ( not ( = ?auto_648665 ?auto_648666 ) ) ( not ( = ?auto_648665 ?auto_648667 ) ) ( not ( = ?auto_648665 ?auto_648668 ) ) ( not ( = ?auto_648665 ?auto_648669 ) ) ( not ( = ?auto_648665 ?auto_648670 ) ) ( not ( = ?auto_648665 ?auto_648671 ) ) ( not ( = ?auto_648665 ?auto_648672 ) ) ( not ( = ?auto_648666 ?auto_648667 ) ) ( not ( = ?auto_648666 ?auto_648668 ) ) ( not ( = ?auto_648666 ?auto_648669 ) ) ( not ( = ?auto_648666 ?auto_648670 ) ) ( not ( = ?auto_648666 ?auto_648671 ) ) ( not ( = ?auto_648666 ?auto_648672 ) ) ( not ( = ?auto_648667 ?auto_648668 ) ) ( not ( = ?auto_648667 ?auto_648669 ) ) ( not ( = ?auto_648667 ?auto_648670 ) ) ( not ( = ?auto_648667 ?auto_648671 ) ) ( not ( = ?auto_648667 ?auto_648672 ) ) ( not ( = ?auto_648668 ?auto_648669 ) ) ( not ( = ?auto_648668 ?auto_648670 ) ) ( not ( = ?auto_648668 ?auto_648671 ) ) ( not ( = ?auto_648668 ?auto_648672 ) ) ( not ( = ?auto_648669 ?auto_648670 ) ) ( not ( = ?auto_648669 ?auto_648671 ) ) ( not ( = ?auto_648669 ?auto_648672 ) ) ( not ( = ?auto_648670 ?auto_648671 ) ) ( not ( = ?auto_648670 ?auto_648672 ) ) ( not ( = ?auto_648671 ?auto_648672 ) ) ( ON ?auto_648670 ?auto_648671 ) ( ON ?auto_648669 ?auto_648670 ) ( ON ?auto_648668 ?auto_648669 ) ( ON ?auto_648667 ?auto_648668 ) ( ON ?auto_648666 ?auto_648667 ) ( ON ?auto_648665 ?auto_648666 ) ( ON ?auto_648664 ?auto_648665 ) ( ON ?auto_648663 ?auto_648664 ) ( ON ?auto_648662 ?auto_648663 ) ( ON ?auto_648661 ?auto_648662 ) ( ON ?auto_648660 ?auto_648661 ) ( CLEAR ?auto_648658 ) ( ON ?auto_648659 ?auto_648660 ) ( CLEAR ?auto_648659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_648656 ?auto_648657 ?auto_648658 ?auto_648659 )
      ( MAKE-16PILE ?auto_648656 ?auto_648657 ?auto_648658 ?auto_648659 ?auto_648660 ?auto_648661 ?auto_648662 ?auto_648663 ?auto_648664 ?auto_648665 ?auto_648666 ?auto_648667 ?auto_648668 ?auto_648669 ?auto_648670 ?auto_648671 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648722 - BLOCK
      ?auto_648723 - BLOCK
      ?auto_648724 - BLOCK
      ?auto_648725 - BLOCK
      ?auto_648726 - BLOCK
      ?auto_648727 - BLOCK
      ?auto_648728 - BLOCK
      ?auto_648729 - BLOCK
      ?auto_648730 - BLOCK
      ?auto_648731 - BLOCK
      ?auto_648732 - BLOCK
      ?auto_648733 - BLOCK
      ?auto_648734 - BLOCK
      ?auto_648735 - BLOCK
      ?auto_648736 - BLOCK
      ?auto_648737 - BLOCK
    )
    :vars
    (
      ?auto_648738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648737 ?auto_648738 ) ( ON-TABLE ?auto_648722 ) ( ON ?auto_648723 ?auto_648722 ) ( not ( = ?auto_648722 ?auto_648723 ) ) ( not ( = ?auto_648722 ?auto_648724 ) ) ( not ( = ?auto_648722 ?auto_648725 ) ) ( not ( = ?auto_648722 ?auto_648726 ) ) ( not ( = ?auto_648722 ?auto_648727 ) ) ( not ( = ?auto_648722 ?auto_648728 ) ) ( not ( = ?auto_648722 ?auto_648729 ) ) ( not ( = ?auto_648722 ?auto_648730 ) ) ( not ( = ?auto_648722 ?auto_648731 ) ) ( not ( = ?auto_648722 ?auto_648732 ) ) ( not ( = ?auto_648722 ?auto_648733 ) ) ( not ( = ?auto_648722 ?auto_648734 ) ) ( not ( = ?auto_648722 ?auto_648735 ) ) ( not ( = ?auto_648722 ?auto_648736 ) ) ( not ( = ?auto_648722 ?auto_648737 ) ) ( not ( = ?auto_648722 ?auto_648738 ) ) ( not ( = ?auto_648723 ?auto_648724 ) ) ( not ( = ?auto_648723 ?auto_648725 ) ) ( not ( = ?auto_648723 ?auto_648726 ) ) ( not ( = ?auto_648723 ?auto_648727 ) ) ( not ( = ?auto_648723 ?auto_648728 ) ) ( not ( = ?auto_648723 ?auto_648729 ) ) ( not ( = ?auto_648723 ?auto_648730 ) ) ( not ( = ?auto_648723 ?auto_648731 ) ) ( not ( = ?auto_648723 ?auto_648732 ) ) ( not ( = ?auto_648723 ?auto_648733 ) ) ( not ( = ?auto_648723 ?auto_648734 ) ) ( not ( = ?auto_648723 ?auto_648735 ) ) ( not ( = ?auto_648723 ?auto_648736 ) ) ( not ( = ?auto_648723 ?auto_648737 ) ) ( not ( = ?auto_648723 ?auto_648738 ) ) ( not ( = ?auto_648724 ?auto_648725 ) ) ( not ( = ?auto_648724 ?auto_648726 ) ) ( not ( = ?auto_648724 ?auto_648727 ) ) ( not ( = ?auto_648724 ?auto_648728 ) ) ( not ( = ?auto_648724 ?auto_648729 ) ) ( not ( = ?auto_648724 ?auto_648730 ) ) ( not ( = ?auto_648724 ?auto_648731 ) ) ( not ( = ?auto_648724 ?auto_648732 ) ) ( not ( = ?auto_648724 ?auto_648733 ) ) ( not ( = ?auto_648724 ?auto_648734 ) ) ( not ( = ?auto_648724 ?auto_648735 ) ) ( not ( = ?auto_648724 ?auto_648736 ) ) ( not ( = ?auto_648724 ?auto_648737 ) ) ( not ( = ?auto_648724 ?auto_648738 ) ) ( not ( = ?auto_648725 ?auto_648726 ) ) ( not ( = ?auto_648725 ?auto_648727 ) ) ( not ( = ?auto_648725 ?auto_648728 ) ) ( not ( = ?auto_648725 ?auto_648729 ) ) ( not ( = ?auto_648725 ?auto_648730 ) ) ( not ( = ?auto_648725 ?auto_648731 ) ) ( not ( = ?auto_648725 ?auto_648732 ) ) ( not ( = ?auto_648725 ?auto_648733 ) ) ( not ( = ?auto_648725 ?auto_648734 ) ) ( not ( = ?auto_648725 ?auto_648735 ) ) ( not ( = ?auto_648725 ?auto_648736 ) ) ( not ( = ?auto_648725 ?auto_648737 ) ) ( not ( = ?auto_648725 ?auto_648738 ) ) ( not ( = ?auto_648726 ?auto_648727 ) ) ( not ( = ?auto_648726 ?auto_648728 ) ) ( not ( = ?auto_648726 ?auto_648729 ) ) ( not ( = ?auto_648726 ?auto_648730 ) ) ( not ( = ?auto_648726 ?auto_648731 ) ) ( not ( = ?auto_648726 ?auto_648732 ) ) ( not ( = ?auto_648726 ?auto_648733 ) ) ( not ( = ?auto_648726 ?auto_648734 ) ) ( not ( = ?auto_648726 ?auto_648735 ) ) ( not ( = ?auto_648726 ?auto_648736 ) ) ( not ( = ?auto_648726 ?auto_648737 ) ) ( not ( = ?auto_648726 ?auto_648738 ) ) ( not ( = ?auto_648727 ?auto_648728 ) ) ( not ( = ?auto_648727 ?auto_648729 ) ) ( not ( = ?auto_648727 ?auto_648730 ) ) ( not ( = ?auto_648727 ?auto_648731 ) ) ( not ( = ?auto_648727 ?auto_648732 ) ) ( not ( = ?auto_648727 ?auto_648733 ) ) ( not ( = ?auto_648727 ?auto_648734 ) ) ( not ( = ?auto_648727 ?auto_648735 ) ) ( not ( = ?auto_648727 ?auto_648736 ) ) ( not ( = ?auto_648727 ?auto_648737 ) ) ( not ( = ?auto_648727 ?auto_648738 ) ) ( not ( = ?auto_648728 ?auto_648729 ) ) ( not ( = ?auto_648728 ?auto_648730 ) ) ( not ( = ?auto_648728 ?auto_648731 ) ) ( not ( = ?auto_648728 ?auto_648732 ) ) ( not ( = ?auto_648728 ?auto_648733 ) ) ( not ( = ?auto_648728 ?auto_648734 ) ) ( not ( = ?auto_648728 ?auto_648735 ) ) ( not ( = ?auto_648728 ?auto_648736 ) ) ( not ( = ?auto_648728 ?auto_648737 ) ) ( not ( = ?auto_648728 ?auto_648738 ) ) ( not ( = ?auto_648729 ?auto_648730 ) ) ( not ( = ?auto_648729 ?auto_648731 ) ) ( not ( = ?auto_648729 ?auto_648732 ) ) ( not ( = ?auto_648729 ?auto_648733 ) ) ( not ( = ?auto_648729 ?auto_648734 ) ) ( not ( = ?auto_648729 ?auto_648735 ) ) ( not ( = ?auto_648729 ?auto_648736 ) ) ( not ( = ?auto_648729 ?auto_648737 ) ) ( not ( = ?auto_648729 ?auto_648738 ) ) ( not ( = ?auto_648730 ?auto_648731 ) ) ( not ( = ?auto_648730 ?auto_648732 ) ) ( not ( = ?auto_648730 ?auto_648733 ) ) ( not ( = ?auto_648730 ?auto_648734 ) ) ( not ( = ?auto_648730 ?auto_648735 ) ) ( not ( = ?auto_648730 ?auto_648736 ) ) ( not ( = ?auto_648730 ?auto_648737 ) ) ( not ( = ?auto_648730 ?auto_648738 ) ) ( not ( = ?auto_648731 ?auto_648732 ) ) ( not ( = ?auto_648731 ?auto_648733 ) ) ( not ( = ?auto_648731 ?auto_648734 ) ) ( not ( = ?auto_648731 ?auto_648735 ) ) ( not ( = ?auto_648731 ?auto_648736 ) ) ( not ( = ?auto_648731 ?auto_648737 ) ) ( not ( = ?auto_648731 ?auto_648738 ) ) ( not ( = ?auto_648732 ?auto_648733 ) ) ( not ( = ?auto_648732 ?auto_648734 ) ) ( not ( = ?auto_648732 ?auto_648735 ) ) ( not ( = ?auto_648732 ?auto_648736 ) ) ( not ( = ?auto_648732 ?auto_648737 ) ) ( not ( = ?auto_648732 ?auto_648738 ) ) ( not ( = ?auto_648733 ?auto_648734 ) ) ( not ( = ?auto_648733 ?auto_648735 ) ) ( not ( = ?auto_648733 ?auto_648736 ) ) ( not ( = ?auto_648733 ?auto_648737 ) ) ( not ( = ?auto_648733 ?auto_648738 ) ) ( not ( = ?auto_648734 ?auto_648735 ) ) ( not ( = ?auto_648734 ?auto_648736 ) ) ( not ( = ?auto_648734 ?auto_648737 ) ) ( not ( = ?auto_648734 ?auto_648738 ) ) ( not ( = ?auto_648735 ?auto_648736 ) ) ( not ( = ?auto_648735 ?auto_648737 ) ) ( not ( = ?auto_648735 ?auto_648738 ) ) ( not ( = ?auto_648736 ?auto_648737 ) ) ( not ( = ?auto_648736 ?auto_648738 ) ) ( not ( = ?auto_648737 ?auto_648738 ) ) ( ON ?auto_648736 ?auto_648737 ) ( ON ?auto_648735 ?auto_648736 ) ( ON ?auto_648734 ?auto_648735 ) ( ON ?auto_648733 ?auto_648734 ) ( ON ?auto_648732 ?auto_648733 ) ( ON ?auto_648731 ?auto_648732 ) ( ON ?auto_648730 ?auto_648731 ) ( ON ?auto_648729 ?auto_648730 ) ( ON ?auto_648728 ?auto_648729 ) ( ON ?auto_648727 ?auto_648728 ) ( ON ?auto_648726 ?auto_648727 ) ( ON ?auto_648725 ?auto_648726 ) ( CLEAR ?auto_648723 ) ( ON ?auto_648724 ?auto_648725 ) ( CLEAR ?auto_648724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_648722 ?auto_648723 ?auto_648724 )
      ( MAKE-16PILE ?auto_648722 ?auto_648723 ?auto_648724 ?auto_648725 ?auto_648726 ?auto_648727 ?auto_648728 ?auto_648729 ?auto_648730 ?auto_648731 ?auto_648732 ?auto_648733 ?auto_648734 ?auto_648735 ?auto_648736 ?auto_648737 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648788 - BLOCK
      ?auto_648789 - BLOCK
      ?auto_648790 - BLOCK
      ?auto_648791 - BLOCK
      ?auto_648792 - BLOCK
      ?auto_648793 - BLOCK
      ?auto_648794 - BLOCK
      ?auto_648795 - BLOCK
      ?auto_648796 - BLOCK
      ?auto_648797 - BLOCK
      ?auto_648798 - BLOCK
      ?auto_648799 - BLOCK
      ?auto_648800 - BLOCK
      ?auto_648801 - BLOCK
      ?auto_648802 - BLOCK
      ?auto_648803 - BLOCK
    )
    :vars
    (
      ?auto_648804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648803 ?auto_648804 ) ( ON-TABLE ?auto_648788 ) ( not ( = ?auto_648788 ?auto_648789 ) ) ( not ( = ?auto_648788 ?auto_648790 ) ) ( not ( = ?auto_648788 ?auto_648791 ) ) ( not ( = ?auto_648788 ?auto_648792 ) ) ( not ( = ?auto_648788 ?auto_648793 ) ) ( not ( = ?auto_648788 ?auto_648794 ) ) ( not ( = ?auto_648788 ?auto_648795 ) ) ( not ( = ?auto_648788 ?auto_648796 ) ) ( not ( = ?auto_648788 ?auto_648797 ) ) ( not ( = ?auto_648788 ?auto_648798 ) ) ( not ( = ?auto_648788 ?auto_648799 ) ) ( not ( = ?auto_648788 ?auto_648800 ) ) ( not ( = ?auto_648788 ?auto_648801 ) ) ( not ( = ?auto_648788 ?auto_648802 ) ) ( not ( = ?auto_648788 ?auto_648803 ) ) ( not ( = ?auto_648788 ?auto_648804 ) ) ( not ( = ?auto_648789 ?auto_648790 ) ) ( not ( = ?auto_648789 ?auto_648791 ) ) ( not ( = ?auto_648789 ?auto_648792 ) ) ( not ( = ?auto_648789 ?auto_648793 ) ) ( not ( = ?auto_648789 ?auto_648794 ) ) ( not ( = ?auto_648789 ?auto_648795 ) ) ( not ( = ?auto_648789 ?auto_648796 ) ) ( not ( = ?auto_648789 ?auto_648797 ) ) ( not ( = ?auto_648789 ?auto_648798 ) ) ( not ( = ?auto_648789 ?auto_648799 ) ) ( not ( = ?auto_648789 ?auto_648800 ) ) ( not ( = ?auto_648789 ?auto_648801 ) ) ( not ( = ?auto_648789 ?auto_648802 ) ) ( not ( = ?auto_648789 ?auto_648803 ) ) ( not ( = ?auto_648789 ?auto_648804 ) ) ( not ( = ?auto_648790 ?auto_648791 ) ) ( not ( = ?auto_648790 ?auto_648792 ) ) ( not ( = ?auto_648790 ?auto_648793 ) ) ( not ( = ?auto_648790 ?auto_648794 ) ) ( not ( = ?auto_648790 ?auto_648795 ) ) ( not ( = ?auto_648790 ?auto_648796 ) ) ( not ( = ?auto_648790 ?auto_648797 ) ) ( not ( = ?auto_648790 ?auto_648798 ) ) ( not ( = ?auto_648790 ?auto_648799 ) ) ( not ( = ?auto_648790 ?auto_648800 ) ) ( not ( = ?auto_648790 ?auto_648801 ) ) ( not ( = ?auto_648790 ?auto_648802 ) ) ( not ( = ?auto_648790 ?auto_648803 ) ) ( not ( = ?auto_648790 ?auto_648804 ) ) ( not ( = ?auto_648791 ?auto_648792 ) ) ( not ( = ?auto_648791 ?auto_648793 ) ) ( not ( = ?auto_648791 ?auto_648794 ) ) ( not ( = ?auto_648791 ?auto_648795 ) ) ( not ( = ?auto_648791 ?auto_648796 ) ) ( not ( = ?auto_648791 ?auto_648797 ) ) ( not ( = ?auto_648791 ?auto_648798 ) ) ( not ( = ?auto_648791 ?auto_648799 ) ) ( not ( = ?auto_648791 ?auto_648800 ) ) ( not ( = ?auto_648791 ?auto_648801 ) ) ( not ( = ?auto_648791 ?auto_648802 ) ) ( not ( = ?auto_648791 ?auto_648803 ) ) ( not ( = ?auto_648791 ?auto_648804 ) ) ( not ( = ?auto_648792 ?auto_648793 ) ) ( not ( = ?auto_648792 ?auto_648794 ) ) ( not ( = ?auto_648792 ?auto_648795 ) ) ( not ( = ?auto_648792 ?auto_648796 ) ) ( not ( = ?auto_648792 ?auto_648797 ) ) ( not ( = ?auto_648792 ?auto_648798 ) ) ( not ( = ?auto_648792 ?auto_648799 ) ) ( not ( = ?auto_648792 ?auto_648800 ) ) ( not ( = ?auto_648792 ?auto_648801 ) ) ( not ( = ?auto_648792 ?auto_648802 ) ) ( not ( = ?auto_648792 ?auto_648803 ) ) ( not ( = ?auto_648792 ?auto_648804 ) ) ( not ( = ?auto_648793 ?auto_648794 ) ) ( not ( = ?auto_648793 ?auto_648795 ) ) ( not ( = ?auto_648793 ?auto_648796 ) ) ( not ( = ?auto_648793 ?auto_648797 ) ) ( not ( = ?auto_648793 ?auto_648798 ) ) ( not ( = ?auto_648793 ?auto_648799 ) ) ( not ( = ?auto_648793 ?auto_648800 ) ) ( not ( = ?auto_648793 ?auto_648801 ) ) ( not ( = ?auto_648793 ?auto_648802 ) ) ( not ( = ?auto_648793 ?auto_648803 ) ) ( not ( = ?auto_648793 ?auto_648804 ) ) ( not ( = ?auto_648794 ?auto_648795 ) ) ( not ( = ?auto_648794 ?auto_648796 ) ) ( not ( = ?auto_648794 ?auto_648797 ) ) ( not ( = ?auto_648794 ?auto_648798 ) ) ( not ( = ?auto_648794 ?auto_648799 ) ) ( not ( = ?auto_648794 ?auto_648800 ) ) ( not ( = ?auto_648794 ?auto_648801 ) ) ( not ( = ?auto_648794 ?auto_648802 ) ) ( not ( = ?auto_648794 ?auto_648803 ) ) ( not ( = ?auto_648794 ?auto_648804 ) ) ( not ( = ?auto_648795 ?auto_648796 ) ) ( not ( = ?auto_648795 ?auto_648797 ) ) ( not ( = ?auto_648795 ?auto_648798 ) ) ( not ( = ?auto_648795 ?auto_648799 ) ) ( not ( = ?auto_648795 ?auto_648800 ) ) ( not ( = ?auto_648795 ?auto_648801 ) ) ( not ( = ?auto_648795 ?auto_648802 ) ) ( not ( = ?auto_648795 ?auto_648803 ) ) ( not ( = ?auto_648795 ?auto_648804 ) ) ( not ( = ?auto_648796 ?auto_648797 ) ) ( not ( = ?auto_648796 ?auto_648798 ) ) ( not ( = ?auto_648796 ?auto_648799 ) ) ( not ( = ?auto_648796 ?auto_648800 ) ) ( not ( = ?auto_648796 ?auto_648801 ) ) ( not ( = ?auto_648796 ?auto_648802 ) ) ( not ( = ?auto_648796 ?auto_648803 ) ) ( not ( = ?auto_648796 ?auto_648804 ) ) ( not ( = ?auto_648797 ?auto_648798 ) ) ( not ( = ?auto_648797 ?auto_648799 ) ) ( not ( = ?auto_648797 ?auto_648800 ) ) ( not ( = ?auto_648797 ?auto_648801 ) ) ( not ( = ?auto_648797 ?auto_648802 ) ) ( not ( = ?auto_648797 ?auto_648803 ) ) ( not ( = ?auto_648797 ?auto_648804 ) ) ( not ( = ?auto_648798 ?auto_648799 ) ) ( not ( = ?auto_648798 ?auto_648800 ) ) ( not ( = ?auto_648798 ?auto_648801 ) ) ( not ( = ?auto_648798 ?auto_648802 ) ) ( not ( = ?auto_648798 ?auto_648803 ) ) ( not ( = ?auto_648798 ?auto_648804 ) ) ( not ( = ?auto_648799 ?auto_648800 ) ) ( not ( = ?auto_648799 ?auto_648801 ) ) ( not ( = ?auto_648799 ?auto_648802 ) ) ( not ( = ?auto_648799 ?auto_648803 ) ) ( not ( = ?auto_648799 ?auto_648804 ) ) ( not ( = ?auto_648800 ?auto_648801 ) ) ( not ( = ?auto_648800 ?auto_648802 ) ) ( not ( = ?auto_648800 ?auto_648803 ) ) ( not ( = ?auto_648800 ?auto_648804 ) ) ( not ( = ?auto_648801 ?auto_648802 ) ) ( not ( = ?auto_648801 ?auto_648803 ) ) ( not ( = ?auto_648801 ?auto_648804 ) ) ( not ( = ?auto_648802 ?auto_648803 ) ) ( not ( = ?auto_648802 ?auto_648804 ) ) ( not ( = ?auto_648803 ?auto_648804 ) ) ( ON ?auto_648802 ?auto_648803 ) ( ON ?auto_648801 ?auto_648802 ) ( ON ?auto_648800 ?auto_648801 ) ( ON ?auto_648799 ?auto_648800 ) ( ON ?auto_648798 ?auto_648799 ) ( ON ?auto_648797 ?auto_648798 ) ( ON ?auto_648796 ?auto_648797 ) ( ON ?auto_648795 ?auto_648796 ) ( ON ?auto_648794 ?auto_648795 ) ( ON ?auto_648793 ?auto_648794 ) ( ON ?auto_648792 ?auto_648793 ) ( ON ?auto_648791 ?auto_648792 ) ( ON ?auto_648790 ?auto_648791 ) ( CLEAR ?auto_648788 ) ( ON ?auto_648789 ?auto_648790 ) ( CLEAR ?auto_648789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_648788 ?auto_648789 )
      ( MAKE-16PILE ?auto_648788 ?auto_648789 ?auto_648790 ?auto_648791 ?auto_648792 ?auto_648793 ?auto_648794 ?auto_648795 ?auto_648796 ?auto_648797 ?auto_648798 ?auto_648799 ?auto_648800 ?auto_648801 ?auto_648802 ?auto_648803 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_648854 - BLOCK
      ?auto_648855 - BLOCK
      ?auto_648856 - BLOCK
      ?auto_648857 - BLOCK
      ?auto_648858 - BLOCK
      ?auto_648859 - BLOCK
      ?auto_648860 - BLOCK
      ?auto_648861 - BLOCK
      ?auto_648862 - BLOCK
      ?auto_648863 - BLOCK
      ?auto_648864 - BLOCK
      ?auto_648865 - BLOCK
      ?auto_648866 - BLOCK
      ?auto_648867 - BLOCK
      ?auto_648868 - BLOCK
      ?auto_648869 - BLOCK
    )
    :vars
    (
      ?auto_648870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_648869 ?auto_648870 ) ( not ( = ?auto_648854 ?auto_648855 ) ) ( not ( = ?auto_648854 ?auto_648856 ) ) ( not ( = ?auto_648854 ?auto_648857 ) ) ( not ( = ?auto_648854 ?auto_648858 ) ) ( not ( = ?auto_648854 ?auto_648859 ) ) ( not ( = ?auto_648854 ?auto_648860 ) ) ( not ( = ?auto_648854 ?auto_648861 ) ) ( not ( = ?auto_648854 ?auto_648862 ) ) ( not ( = ?auto_648854 ?auto_648863 ) ) ( not ( = ?auto_648854 ?auto_648864 ) ) ( not ( = ?auto_648854 ?auto_648865 ) ) ( not ( = ?auto_648854 ?auto_648866 ) ) ( not ( = ?auto_648854 ?auto_648867 ) ) ( not ( = ?auto_648854 ?auto_648868 ) ) ( not ( = ?auto_648854 ?auto_648869 ) ) ( not ( = ?auto_648854 ?auto_648870 ) ) ( not ( = ?auto_648855 ?auto_648856 ) ) ( not ( = ?auto_648855 ?auto_648857 ) ) ( not ( = ?auto_648855 ?auto_648858 ) ) ( not ( = ?auto_648855 ?auto_648859 ) ) ( not ( = ?auto_648855 ?auto_648860 ) ) ( not ( = ?auto_648855 ?auto_648861 ) ) ( not ( = ?auto_648855 ?auto_648862 ) ) ( not ( = ?auto_648855 ?auto_648863 ) ) ( not ( = ?auto_648855 ?auto_648864 ) ) ( not ( = ?auto_648855 ?auto_648865 ) ) ( not ( = ?auto_648855 ?auto_648866 ) ) ( not ( = ?auto_648855 ?auto_648867 ) ) ( not ( = ?auto_648855 ?auto_648868 ) ) ( not ( = ?auto_648855 ?auto_648869 ) ) ( not ( = ?auto_648855 ?auto_648870 ) ) ( not ( = ?auto_648856 ?auto_648857 ) ) ( not ( = ?auto_648856 ?auto_648858 ) ) ( not ( = ?auto_648856 ?auto_648859 ) ) ( not ( = ?auto_648856 ?auto_648860 ) ) ( not ( = ?auto_648856 ?auto_648861 ) ) ( not ( = ?auto_648856 ?auto_648862 ) ) ( not ( = ?auto_648856 ?auto_648863 ) ) ( not ( = ?auto_648856 ?auto_648864 ) ) ( not ( = ?auto_648856 ?auto_648865 ) ) ( not ( = ?auto_648856 ?auto_648866 ) ) ( not ( = ?auto_648856 ?auto_648867 ) ) ( not ( = ?auto_648856 ?auto_648868 ) ) ( not ( = ?auto_648856 ?auto_648869 ) ) ( not ( = ?auto_648856 ?auto_648870 ) ) ( not ( = ?auto_648857 ?auto_648858 ) ) ( not ( = ?auto_648857 ?auto_648859 ) ) ( not ( = ?auto_648857 ?auto_648860 ) ) ( not ( = ?auto_648857 ?auto_648861 ) ) ( not ( = ?auto_648857 ?auto_648862 ) ) ( not ( = ?auto_648857 ?auto_648863 ) ) ( not ( = ?auto_648857 ?auto_648864 ) ) ( not ( = ?auto_648857 ?auto_648865 ) ) ( not ( = ?auto_648857 ?auto_648866 ) ) ( not ( = ?auto_648857 ?auto_648867 ) ) ( not ( = ?auto_648857 ?auto_648868 ) ) ( not ( = ?auto_648857 ?auto_648869 ) ) ( not ( = ?auto_648857 ?auto_648870 ) ) ( not ( = ?auto_648858 ?auto_648859 ) ) ( not ( = ?auto_648858 ?auto_648860 ) ) ( not ( = ?auto_648858 ?auto_648861 ) ) ( not ( = ?auto_648858 ?auto_648862 ) ) ( not ( = ?auto_648858 ?auto_648863 ) ) ( not ( = ?auto_648858 ?auto_648864 ) ) ( not ( = ?auto_648858 ?auto_648865 ) ) ( not ( = ?auto_648858 ?auto_648866 ) ) ( not ( = ?auto_648858 ?auto_648867 ) ) ( not ( = ?auto_648858 ?auto_648868 ) ) ( not ( = ?auto_648858 ?auto_648869 ) ) ( not ( = ?auto_648858 ?auto_648870 ) ) ( not ( = ?auto_648859 ?auto_648860 ) ) ( not ( = ?auto_648859 ?auto_648861 ) ) ( not ( = ?auto_648859 ?auto_648862 ) ) ( not ( = ?auto_648859 ?auto_648863 ) ) ( not ( = ?auto_648859 ?auto_648864 ) ) ( not ( = ?auto_648859 ?auto_648865 ) ) ( not ( = ?auto_648859 ?auto_648866 ) ) ( not ( = ?auto_648859 ?auto_648867 ) ) ( not ( = ?auto_648859 ?auto_648868 ) ) ( not ( = ?auto_648859 ?auto_648869 ) ) ( not ( = ?auto_648859 ?auto_648870 ) ) ( not ( = ?auto_648860 ?auto_648861 ) ) ( not ( = ?auto_648860 ?auto_648862 ) ) ( not ( = ?auto_648860 ?auto_648863 ) ) ( not ( = ?auto_648860 ?auto_648864 ) ) ( not ( = ?auto_648860 ?auto_648865 ) ) ( not ( = ?auto_648860 ?auto_648866 ) ) ( not ( = ?auto_648860 ?auto_648867 ) ) ( not ( = ?auto_648860 ?auto_648868 ) ) ( not ( = ?auto_648860 ?auto_648869 ) ) ( not ( = ?auto_648860 ?auto_648870 ) ) ( not ( = ?auto_648861 ?auto_648862 ) ) ( not ( = ?auto_648861 ?auto_648863 ) ) ( not ( = ?auto_648861 ?auto_648864 ) ) ( not ( = ?auto_648861 ?auto_648865 ) ) ( not ( = ?auto_648861 ?auto_648866 ) ) ( not ( = ?auto_648861 ?auto_648867 ) ) ( not ( = ?auto_648861 ?auto_648868 ) ) ( not ( = ?auto_648861 ?auto_648869 ) ) ( not ( = ?auto_648861 ?auto_648870 ) ) ( not ( = ?auto_648862 ?auto_648863 ) ) ( not ( = ?auto_648862 ?auto_648864 ) ) ( not ( = ?auto_648862 ?auto_648865 ) ) ( not ( = ?auto_648862 ?auto_648866 ) ) ( not ( = ?auto_648862 ?auto_648867 ) ) ( not ( = ?auto_648862 ?auto_648868 ) ) ( not ( = ?auto_648862 ?auto_648869 ) ) ( not ( = ?auto_648862 ?auto_648870 ) ) ( not ( = ?auto_648863 ?auto_648864 ) ) ( not ( = ?auto_648863 ?auto_648865 ) ) ( not ( = ?auto_648863 ?auto_648866 ) ) ( not ( = ?auto_648863 ?auto_648867 ) ) ( not ( = ?auto_648863 ?auto_648868 ) ) ( not ( = ?auto_648863 ?auto_648869 ) ) ( not ( = ?auto_648863 ?auto_648870 ) ) ( not ( = ?auto_648864 ?auto_648865 ) ) ( not ( = ?auto_648864 ?auto_648866 ) ) ( not ( = ?auto_648864 ?auto_648867 ) ) ( not ( = ?auto_648864 ?auto_648868 ) ) ( not ( = ?auto_648864 ?auto_648869 ) ) ( not ( = ?auto_648864 ?auto_648870 ) ) ( not ( = ?auto_648865 ?auto_648866 ) ) ( not ( = ?auto_648865 ?auto_648867 ) ) ( not ( = ?auto_648865 ?auto_648868 ) ) ( not ( = ?auto_648865 ?auto_648869 ) ) ( not ( = ?auto_648865 ?auto_648870 ) ) ( not ( = ?auto_648866 ?auto_648867 ) ) ( not ( = ?auto_648866 ?auto_648868 ) ) ( not ( = ?auto_648866 ?auto_648869 ) ) ( not ( = ?auto_648866 ?auto_648870 ) ) ( not ( = ?auto_648867 ?auto_648868 ) ) ( not ( = ?auto_648867 ?auto_648869 ) ) ( not ( = ?auto_648867 ?auto_648870 ) ) ( not ( = ?auto_648868 ?auto_648869 ) ) ( not ( = ?auto_648868 ?auto_648870 ) ) ( not ( = ?auto_648869 ?auto_648870 ) ) ( ON ?auto_648868 ?auto_648869 ) ( ON ?auto_648867 ?auto_648868 ) ( ON ?auto_648866 ?auto_648867 ) ( ON ?auto_648865 ?auto_648866 ) ( ON ?auto_648864 ?auto_648865 ) ( ON ?auto_648863 ?auto_648864 ) ( ON ?auto_648862 ?auto_648863 ) ( ON ?auto_648861 ?auto_648862 ) ( ON ?auto_648860 ?auto_648861 ) ( ON ?auto_648859 ?auto_648860 ) ( ON ?auto_648858 ?auto_648859 ) ( ON ?auto_648857 ?auto_648858 ) ( ON ?auto_648856 ?auto_648857 ) ( ON ?auto_648855 ?auto_648856 ) ( ON ?auto_648854 ?auto_648855 ) ( CLEAR ?auto_648854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_648854 )
      ( MAKE-16PILE ?auto_648854 ?auto_648855 ?auto_648856 ?auto_648857 ?auto_648858 ?auto_648859 ?auto_648860 ?auto_648861 ?auto_648862 ?auto_648863 ?auto_648864 ?auto_648865 ?auto_648866 ?auto_648867 ?auto_648868 ?auto_648869 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_648921 - BLOCK
      ?auto_648922 - BLOCK
      ?auto_648923 - BLOCK
      ?auto_648924 - BLOCK
      ?auto_648925 - BLOCK
      ?auto_648926 - BLOCK
      ?auto_648927 - BLOCK
      ?auto_648928 - BLOCK
      ?auto_648929 - BLOCK
      ?auto_648930 - BLOCK
      ?auto_648931 - BLOCK
      ?auto_648932 - BLOCK
      ?auto_648933 - BLOCK
      ?auto_648934 - BLOCK
      ?auto_648935 - BLOCK
      ?auto_648936 - BLOCK
      ?auto_648937 - BLOCK
    )
    :vars
    (
      ?auto_648938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_648936 ) ( ON ?auto_648937 ?auto_648938 ) ( CLEAR ?auto_648937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_648921 ) ( ON ?auto_648922 ?auto_648921 ) ( ON ?auto_648923 ?auto_648922 ) ( ON ?auto_648924 ?auto_648923 ) ( ON ?auto_648925 ?auto_648924 ) ( ON ?auto_648926 ?auto_648925 ) ( ON ?auto_648927 ?auto_648926 ) ( ON ?auto_648928 ?auto_648927 ) ( ON ?auto_648929 ?auto_648928 ) ( ON ?auto_648930 ?auto_648929 ) ( ON ?auto_648931 ?auto_648930 ) ( ON ?auto_648932 ?auto_648931 ) ( ON ?auto_648933 ?auto_648932 ) ( ON ?auto_648934 ?auto_648933 ) ( ON ?auto_648935 ?auto_648934 ) ( ON ?auto_648936 ?auto_648935 ) ( not ( = ?auto_648921 ?auto_648922 ) ) ( not ( = ?auto_648921 ?auto_648923 ) ) ( not ( = ?auto_648921 ?auto_648924 ) ) ( not ( = ?auto_648921 ?auto_648925 ) ) ( not ( = ?auto_648921 ?auto_648926 ) ) ( not ( = ?auto_648921 ?auto_648927 ) ) ( not ( = ?auto_648921 ?auto_648928 ) ) ( not ( = ?auto_648921 ?auto_648929 ) ) ( not ( = ?auto_648921 ?auto_648930 ) ) ( not ( = ?auto_648921 ?auto_648931 ) ) ( not ( = ?auto_648921 ?auto_648932 ) ) ( not ( = ?auto_648921 ?auto_648933 ) ) ( not ( = ?auto_648921 ?auto_648934 ) ) ( not ( = ?auto_648921 ?auto_648935 ) ) ( not ( = ?auto_648921 ?auto_648936 ) ) ( not ( = ?auto_648921 ?auto_648937 ) ) ( not ( = ?auto_648921 ?auto_648938 ) ) ( not ( = ?auto_648922 ?auto_648923 ) ) ( not ( = ?auto_648922 ?auto_648924 ) ) ( not ( = ?auto_648922 ?auto_648925 ) ) ( not ( = ?auto_648922 ?auto_648926 ) ) ( not ( = ?auto_648922 ?auto_648927 ) ) ( not ( = ?auto_648922 ?auto_648928 ) ) ( not ( = ?auto_648922 ?auto_648929 ) ) ( not ( = ?auto_648922 ?auto_648930 ) ) ( not ( = ?auto_648922 ?auto_648931 ) ) ( not ( = ?auto_648922 ?auto_648932 ) ) ( not ( = ?auto_648922 ?auto_648933 ) ) ( not ( = ?auto_648922 ?auto_648934 ) ) ( not ( = ?auto_648922 ?auto_648935 ) ) ( not ( = ?auto_648922 ?auto_648936 ) ) ( not ( = ?auto_648922 ?auto_648937 ) ) ( not ( = ?auto_648922 ?auto_648938 ) ) ( not ( = ?auto_648923 ?auto_648924 ) ) ( not ( = ?auto_648923 ?auto_648925 ) ) ( not ( = ?auto_648923 ?auto_648926 ) ) ( not ( = ?auto_648923 ?auto_648927 ) ) ( not ( = ?auto_648923 ?auto_648928 ) ) ( not ( = ?auto_648923 ?auto_648929 ) ) ( not ( = ?auto_648923 ?auto_648930 ) ) ( not ( = ?auto_648923 ?auto_648931 ) ) ( not ( = ?auto_648923 ?auto_648932 ) ) ( not ( = ?auto_648923 ?auto_648933 ) ) ( not ( = ?auto_648923 ?auto_648934 ) ) ( not ( = ?auto_648923 ?auto_648935 ) ) ( not ( = ?auto_648923 ?auto_648936 ) ) ( not ( = ?auto_648923 ?auto_648937 ) ) ( not ( = ?auto_648923 ?auto_648938 ) ) ( not ( = ?auto_648924 ?auto_648925 ) ) ( not ( = ?auto_648924 ?auto_648926 ) ) ( not ( = ?auto_648924 ?auto_648927 ) ) ( not ( = ?auto_648924 ?auto_648928 ) ) ( not ( = ?auto_648924 ?auto_648929 ) ) ( not ( = ?auto_648924 ?auto_648930 ) ) ( not ( = ?auto_648924 ?auto_648931 ) ) ( not ( = ?auto_648924 ?auto_648932 ) ) ( not ( = ?auto_648924 ?auto_648933 ) ) ( not ( = ?auto_648924 ?auto_648934 ) ) ( not ( = ?auto_648924 ?auto_648935 ) ) ( not ( = ?auto_648924 ?auto_648936 ) ) ( not ( = ?auto_648924 ?auto_648937 ) ) ( not ( = ?auto_648924 ?auto_648938 ) ) ( not ( = ?auto_648925 ?auto_648926 ) ) ( not ( = ?auto_648925 ?auto_648927 ) ) ( not ( = ?auto_648925 ?auto_648928 ) ) ( not ( = ?auto_648925 ?auto_648929 ) ) ( not ( = ?auto_648925 ?auto_648930 ) ) ( not ( = ?auto_648925 ?auto_648931 ) ) ( not ( = ?auto_648925 ?auto_648932 ) ) ( not ( = ?auto_648925 ?auto_648933 ) ) ( not ( = ?auto_648925 ?auto_648934 ) ) ( not ( = ?auto_648925 ?auto_648935 ) ) ( not ( = ?auto_648925 ?auto_648936 ) ) ( not ( = ?auto_648925 ?auto_648937 ) ) ( not ( = ?auto_648925 ?auto_648938 ) ) ( not ( = ?auto_648926 ?auto_648927 ) ) ( not ( = ?auto_648926 ?auto_648928 ) ) ( not ( = ?auto_648926 ?auto_648929 ) ) ( not ( = ?auto_648926 ?auto_648930 ) ) ( not ( = ?auto_648926 ?auto_648931 ) ) ( not ( = ?auto_648926 ?auto_648932 ) ) ( not ( = ?auto_648926 ?auto_648933 ) ) ( not ( = ?auto_648926 ?auto_648934 ) ) ( not ( = ?auto_648926 ?auto_648935 ) ) ( not ( = ?auto_648926 ?auto_648936 ) ) ( not ( = ?auto_648926 ?auto_648937 ) ) ( not ( = ?auto_648926 ?auto_648938 ) ) ( not ( = ?auto_648927 ?auto_648928 ) ) ( not ( = ?auto_648927 ?auto_648929 ) ) ( not ( = ?auto_648927 ?auto_648930 ) ) ( not ( = ?auto_648927 ?auto_648931 ) ) ( not ( = ?auto_648927 ?auto_648932 ) ) ( not ( = ?auto_648927 ?auto_648933 ) ) ( not ( = ?auto_648927 ?auto_648934 ) ) ( not ( = ?auto_648927 ?auto_648935 ) ) ( not ( = ?auto_648927 ?auto_648936 ) ) ( not ( = ?auto_648927 ?auto_648937 ) ) ( not ( = ?auto_648927 ?auto_648938 ) ) ( not ( = ?auto_648928 ?auto_648929 ) ) ( not ( = ?auto_648928 ?auto_648930 ) ) ( not ( = ?auto_648928 ?auto_648931 ) ) ( not ( = ?auto_648928 ?auto_648932 ) ) ( not ( = ?auto_648928 ?auto_648933 ) ) ( not ( = ?auto_648928 ?auto_648934 ) ) ( not ( = ?auto_648928 ?auto_648935 ) ) ( not ( = ?auto_648928 ?auto_648936 ) ) ( not ( = ?auto_648928 ?auto_648937 ) ) ( not ( = ?auto_648928 ?auto_648938 ) ) ( not ( = ?auto_648929 ?auto_648930 ) ) ( not ( = ?auto_648929 ?auto_648931 ) ) ( not ( = ?auto_648929 ?auto_648932 ) ) ( not ( = ?auto_648929 ?auto_648933 ) ) ( not ( = ?auto_648929 ?auto_648934 ) ) ( not ( = ?auto_648929 ?auto_648935 ) ) ( not ( = ?auto_648929 ?auto_648936 ) ) ( not ( = ?auto_648929 ?auto_648937 ) ) ( not ( = ?auto_648929 ?auto_648938 ) ) ( not ( = ?auto_648930 ?auto_648931 ) ) ( not ( = ?auto_648930 ?auto_648932 ) ) ( not ( = ?auto_648930 ?auto_648933 ) ) ( not ( = ?auto_648930 ?auto_648934 ) ) ( not ( = ?auto_648930 ?auto_648935 ) ) ( not ( = ?auto_648930 ?auto_648936 ) ) ( not ( = ?auto_648930 ?auto_648937 ) ) ( not ( = ?auto_648930 ?auto_648938 ) ) ( not ( = ?auto_648931 ?auto_648932 ) ) ( not ( = ?auto_648931 ?auto_648933 ) ) ( not ( = ?auto_648931 ?auto_648934 ) ) ( not ( = ?auto_648931 ?auto_648935 ) ) ( not ( = ?auto_648931 ?auto_648936 ) ) ( not ( = ?auto_648931 ?auto_648937 ) ) ( not ( = ?auto_648931 ?auto_648938 ) ) ( not ( = ?auto_648932 ?auto_648933 ) ) ( not ( = ?auto_648932 ?auto_648934 ) ) ( not ( = ?auto_648932 ?auto_648935 ) ) ( not ( = ?auto_648932 ?auto_648936 ) ) ( not ( = ?auto_648932 ?auto_648937 ) ) ( not ( = ?auto_648932 ?auto_648938 ) ) ( not ( = ?auto_648933 ?auto_648934 ) ) ( not ( = ?auto_648933 ?auto_648935 ) ) ( not ( = ?auto_648933 ?auto_648936 ) ) ( not ( = ?auto_648933 ?auto_648937 ) ) ( not ( = ?auto_648933 ?auto_648938 ) ) ( not ( = ?auto_648934 ?auto_648935 ) ) ( not ( = ?auto_648934 ?auto_648936 ) ) ( not ( = ?auto_648934 ?auto_648937 ) ) ( not ( = ?auto_648934 ?auto_648938 ) ) ( not ( = ?auto_648935 ?auto_648936 ) ) ( not ( = ?auto_648935 ?auto_648937 ) ) ( not ( = ?auto_648935 ?auto_648938 ) ) ( not ( = ?auto_648936 ?auto_648937 ) ) ( not ( = ?auto_648936 ?auto_648938 ) ) ( not ( = ?auto_648937 ?auto_648938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_648937 ?auto_648938 )
      ( !STACK ?auto_648937 ?auto_648936 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_648956 - BLOCK
      ?auto_648957 - BLOCK
      ?auto_648958 - BLOCK
      ?auto_648959 - BLOCK
      ?auto_648960 - BLOCK
      ?auto_648961 - BLOCK
      ?auto_648962 - BLOCK
      ?auto_648963 - BLOCK
      ?auto_648964 - BLOCK
      ?auto_648965 - BLOCK
      ?auto_648966 - BLOCK
      ?auto_648967 - BLOCK
      ?auto_648968 - BLOCK
      ?auto_648969 - BLOCK
      ?auto_648970 - BLOCK
      ?auto_648971 - BLOCK
      ?auto_648972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_648971 ) ( ON-TABLE ?auto_648972 ) ( CLEAR ?auto_648972 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_648956 ) ( ON ?auto_648957 ?auto_648956 ) ( ON ?auto_648958 ?auto_648957 ) ( ON ?auto_648959 ?auto_648958 ) ( ON ?auto_648960 ?auto_648959 ) ( ON ?auto_648961 ?auto_648960 ) ( ON ?auto_648962 ?auto_648961 ) ( ON ?auto_648963 ?auto_648962 ) ( ON ?auto_648964 ?auto_648963 ) ( ON ?auto_648965 ?auto_648964 ) ( ON ?auto_648966 ?auto_648965 ) ( ON ?auto_648967 ?auto_648966 ) ( ON ?auto_648968 ?auto_648967 ) ( ON ?auto_648969 ?auto_648968 ) ( ON ?auto_648970 ?auto_648969 ) ( ON ?auto_648971 ?auto_648970 ) ( not ( = ?auto_648956 ?auto_648957 ) ) ( not ( = ?auto_648956 ?auto_648958 ) ) ( not ( = ?auto_648956 ?auto_648959 ) ) ( not ( = ?auto_648956 ?auto_648960 ) ) ( not ( = ?auto_648956 ?auto_648961 ) ) ( not ( = ?auto_648956 ?auto_648962 ) ) ( not ( = ?auto_648956 ?auto_648963 ) ) ( not ( = ?auto_648956 ?auto_648964 ) ) ( not ( = ?auto_648956 ?auto_648965 ) ) ( not ( = ?auto_648956 ?auto_648966 ) ) ( not ( = ?auto_648956 ?auto_648967 ) ) ( not ( = ?auto_648956 ?auto_648968 ) ) ( not ( = ?auto_648956 ?auto_648969 ) ) ( not ( = ?auto_648956 ?auto_648970 ) ) ( not ( = ?auto_648956 ?auto_648971 ) ) ( not ( = ?auto_648956 ?auto_648972 ) ) ( not ( = ?auto_648957 ?auto_648958 ) ) ( not ( = ?auto_648957 ?auto_648959 ) ) ( not ( = ?auto_648957 ?auto_648960 ) ) ( not ( = ?auto_648957 ?auto_648961 ) ) ( not ( = ?auto_648957 ?auto_648962 ) ) ( not ( = ?auto_648957 ?auto_648963 ) ) ( not ( = ?auto_648957 ?auto_648964 ) ) ( not ( = ?auto_648957 ?auto_648965 ) ) ( not ( = ?auto_648957 ?auto_648966 ) ) ( not ( = ?auto_648957 ?auto_648967 ) ) ( not ( = ?auto_648957 ?auto_648968 ) ) ( not ( = ?auto_648957 ?auto_648969 ) ) ( not ( = ?auto_648957 ?auto_648970 ) ) ( not ( = ?auto_648957 ?auto_648971 ) ) ( not ( = ?auto_648957 ?auto_648972 ) ) ( not ( = ?auto_648958 ?auto_648959 ) ) ( not ( = ?auto_648958 ?auto_648960 ) ) ( not ( = ?auto_648958 ?auto_648961 ) ) ( not ( = ?auto_648958 ?auto_648962 ) ) ( not ( = ?auto_648958 ?auto_648963 ) ) ( not ( = ?auto_648958 ?auto_648964 ) ) ( not ( = ?auto_648958 ?auto_648965 ) ) ( not ( = ?auto_648958 ?auto_648966 ) ) ( not ( = ?auto_648958 ?auto_648967 ) ) ( not ( = ?auto_648958 ?auto_648968 ) ) ( not ( = ?auto_648958 ?auto_648969 ) ) ( not ( = ?auto_648958 ?auto_648970 ) ) ( not ( = ?auto_648958 ?auto_648971 ) ) ( not ( = ?auto_648958 ?auto_648972 ) ) ( not ( = ?auto_648959 ?auto_648960 ) ) ( not ( = ?auto_648959 ?auto_648961 ) ) ( not ( = ?auto_648959 ?auto_648962 ) ) ( not ( = ?auto_648959 ?auto_648963 ) ) ( not ( = ?auto_648959 ?auto_648964 ) ) ( not ( = ?auto_648959 ?auto_648965 ) ) ( not ( = ?auto_648959 ?auto_648966 ) ) ( not ( = ?auto_648959 ?auto_648967 ) ) ( not ( = ?auto_648959 ?auto_648968 ) ) ( not ( = ?auto_648959 ?auto_648969 ) ) ( not ( = ?auto_648959 ?auto_648970 ) ) ( not ( = ?auto_648959 ?auto_648971 ) ) ( not ( = ?auto_648959 ?auto_648972 ) ) ( not ( = ?auto_648960 ?auto_648961 ) ) ( not ( = ?auto_648960 ?auto_648962 ) ) ( not ( = ?auto_648960 ?auto_648963 ) ) ( not ( = ?auto_648960 ?auto_648964 ) ) ( not ( = ?auto_648960 ?auto_648965 ) ) ( not ( = ?auto_648960 ?auto_648966 ) ) ( not ( = ?auto_648960 ?auto_648967 ) ) ( not ( = ?auto_648960 ?auto_648968 ) ) ( not ( = ?auto_648960 ?auto_648969 ) ) ( not ( = ?auto_648960 ?auto_648970 ) ) ( not ( = ?auto_648960 ?auto_648971 ) ) ( not ( = ?auto_648960 ?auto_648972 ) ) ( not ( = ?auto_648961 ?auto_648962 ) ) ( not ( = ?auto_648961 ?auto_648963 ) ) ( not ( = ?auto_648961 ?auto_648964 ) ) ( not ( = ?auto_648961 ?auto_648965 ) ) ( not ( = ?auto_648961 ?auto_648966 ) ) ( not ( = ?auto_648961 ?auto_648967 ) ) ( not ( = ?auto_648961 ?auto_648968 ) ) ( not ( = ?auto_648961 ?auto_648969 ) ) ( not ( = ?auto_648961 ?auto_648970 ) ) ( not ( = ?auto_648961 ?auto_648971 ) ) ( not ( = ?auto_648961 ?auto_648972 ) ) ( not ( = ?auto_648962 ?auto_648963 ) ) ( not ( = ?auto_648962 ?auto_648964 ) ) ( not ( = ?auto_648962 ?auto_648965 ) ) ( not ( = ?auto_648962 ?auto_648966 ) ) ( not ( = ?auto_648962 ?auto_648967 ) ) ( not ( = ?auto_648962 ?auto_648968 ) ) ( not ( = ?auto_648962 ?auto_648969 ) ) ( not ( = ?auto_648962 ?auto_648970 ) ) ( not ( = ?auto_648962 ?auto_648971 ) ) ( not ( = ?auto_648962 ?auto_648972 ) ) ( not ( = ?auto_648963 ?auto_648964 ) ) ( not ( = ?auto_648963 ?auto_648965 ) ) ( not ( = ?auto_648963 ?auto_648966 ) ) ( not ( = ?auto_648963 ?auto_648967 ) ) ( not ( = ?auto_648963 ?auto_648968 ) ) ( not ( = ?auto_648963 ?auto_648969 ) ) ( not ( = ?auto_648963 ?auto_648970 ) ) ( not ( = ?auto_648963 ?auto_648971 ) ) ( not ( = ?auto_648963 ?auto_648972 ) ) ( not ( = ?auto_648964 ?auto_648965 ) ) ( not ( = ?auto_648964 ?auto_648966 ) ) ( not ( = ?auto_648964 ?auto_648967 ) ) ( not ( = ?auto_648964 ?auto_648968 ) ) ( not ( = ?auto_648964 ?auto_648969 ) ) ( not ( = ?auto_648964 ?auto_648970 ) ) ( not ( = ?auto_648964 ?auto_648971 ) ) ( not ( = ?auto_648964 ?auto_648972 ) ) ( not ( = ?auto_648965 ?auto_648966 ) ) ( not ( = ?auto_648965 ?auto_648967 ) ) ( not ( = ?auto_648965 ?auto_648968 ) ) ( not ( = ?auto_648965 ?auto_648969 ) ) ( not ( = ?auto_648965 ?auto_648970 ) ) ( not ( = ?auto_648965 ?auto_648971 ) ) ( not ( = ?auto_648965 ?auto_648972 ) ) ( not ( = ?auto_648966 ?auto_648967 ) ) ( not ( = ?auto_648966 ?auto_648968 ) ) ( not ( = ?auto_648966 ?auto_648969 ) ) ( not ( = ?auto_648966 ?auto_648970 ) ) ( not ( = ?auto_648966 ?auto_648971 ) ) ( not ( = ?auto_648966 ?auto_648972 ) ) ( not ( = ?auto_648967 ?auto_648968 ) ) ( not ( = ?auto_648967 ?auto_648969 ) ) ( not ( = ?auto_648967 ?auto_648970 ) ) ( not ( = ?auto_648967 ?auto_648971 ) ) ( not ( = ?auto_648967 ?auto_648972 ) ) ( not ( = ?auto_648968 ?auto_648969 ) ) ( not ( = ?auto_648968 ?auto_648970 ) ) ( not ( = ?auto_648968 ?auto_648971 ) ) ( not ( = ?auto_648968 ?auto_648972 ) ) ( not ( = ?auto_648969 ?auto_648970 ) ) ( not ( = ?auto_648969 ?auto_648971 ) ) ( not ( = ?auto_648969 ?auto_648972 ) ) ( not ( = ?auto_648970 ?auto_648971 ) ) ( not ( = ?auto_648970 ?auto_648972 ) ) ( not ( = ?auto_648971 ?auto_648972 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_648972 )
      ( !STACK ?auto_648972 ?auto_648971 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_648990 - BLOCK
      ?auto_648991 - BLOCK
      ?auto_648992 - BLOCK
      ?auto_648993 - BLOCK
      ?auto_648994 - BLOCK
      ?auto_648995 - BLOCK
      ?auto_648996 - BLOCK
      ?auto_648997 - BLOCK
      ?auto_648998 - BLOCK
      ?auto_648999 - BLOCK
      ?auto_649000 - BLOCK
      ?auto_649001 - BLOCK
      ?auto_649002 - BLOCK
      ?auto_649003 - BLOCK
      ?auto_649004 - BLOCK
      ?auto_649005 - BLOCK
      ?auto_649006 - BLOCK
    )
    :vars
    (
      ?auto_649007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649006 ?auto_649007 ) ( ON-TABLE ?auto_648990 ) ( ON ?auto_648991 ?auto_648990 ) ( ON ?auto_648992 ?auto_648991 ) ( ON ?auto_648993 ?auto_648992 ) ( ON ?auto_648994 ?auto_648993 ) ( ON ?auto_648995 ?auto_648994 ) ( ON ?auto_648996 ?auto_648995 ) ( ON ?auto_648997 ?auto_648996 ) ( ON ?auto_648998 ?auto_648997 ) ( ON ?auto_648999 ?auto_648998 ) ( ON ?auto_649000 ?auto_648999 ) ( ON ?auto_649001 ?auto_649000 ) ( ON ?auto_649002 ?auto_649001 ) ( ON ?auto_649003 ?auto_649002 ) ( ON ?auto_649004 ?auto_649003 ) ( not ( = ?auto_648990 ?auto_648991 ) ) ( not ( = ?auto_648990 ?auto_648992 ) ) ( not ( = ?auto_648990 ?auto_648993 ) ) ( not ( = ?auto_648990 ?auto_648994 ) ) ( not ( = ?auto_648990 ?auto_648995 ) ) ( not ( = ?auto_648990 ?auto_648996 ) ) ( not ( = ?auto_648990 ?auto_648997 ) ) ( not ( = ?auto_648990 ?auto_648998 ) ) ( not ( = ?auto_648990 ?auto_648999 ) ) ( not ( = ?auto_648990 ?auto_649000 ) ) ( not ( = ?auto_648990 ?auto_649001 ) ) ( not ( = ?auto_648990 ?auto_649002 ) ) ( not ( = ?auto_648990 ?auto_649003 ) ) ( not ( = ?auto_648990 ?auto_649004 ) ) ( not ( = ?auto_648990 ?auto_649005 ) ) ( not ( = ?auto_648990 ?auto_649006 ) ) ( not ( = ?auto_648990 ?auto_649007 ) ) ( not ( = ?auto_648991 ?auto_648992 ) ) ( not ( = ?auto_648991 ?auto_648993 ) ) ( not ( = ?auto_648991 ?auto_648994 ) ) ( not ( = ?auto_648991 ?auto_648995 ) ) ( not ( = ?auto_648991 ?auto_648996 ) ) ( not ( = ?auto_648991 ?auto_648997 ) ) ( not ( = ?auto_648991 ?auto_648998 ) ) ( not ( = ?auto_648991 ?auto_648999 ) ) ( not ( = ?auto_648991 ?auto_649000 ) ) ( not ( = ?auto_648991 ?auto_649001 ) ) ( not ( = ?auto_648991 ?auto_649002 ) ) ( not ( = ?auto_648991 ?auto_649003 ) ) ( not ( = ?auto_648991 ?auto_649004 ) ) ( not ( = ?auto_648991 ?auto_649005 ) ) ( not ( = ?auto_648991 ?auto_649006 ) ) ( not ( = ?auto_648991 ?auto_649007 ) ) ( not ( = ?auto_648992 ?auto_648993 ) ) ( not ( = ?auto_648992 ?auto_648994 ) ) ( not ( = ?auto_648992 ?auto_648995 ) ) ( not ( = ?auto_648992 ?auto_648996 ) ) ( not ( = ?auto_648992 ?auto_648997 ) ) ( not ( = ?auto_648992 ?auto_648998 ) ) ( not ( = ?auto_648992 ?auto_648999 ) ) ( not ( = ?auto_648992 ?auto_649000 ) ) ( not ( = ?auto_648992 ?auto_649001 ) ) ( not ( = ?auto_648992 ?auto_649002 ) ) ( not ( = ?auto_648992 ?auto_649003 ) ) ( not ( = ?auto_648992 ?auto_649004 ) ) ( not ( = ?auto_648992 ?auto_649005 ) ) ( not ( = ?auto_648992 ?auto_649006 ) ) ( not ( = ?auto_648992 ?auto_649007 ) ) ( not ( = ?auto_648993 ?auto_648994 ) ) ( not ( = ?auto_648993 ?auto_648995 ) ) ( not ( = ?auto_648993 ?auto_648996 ) ) ( not ( = ?auto_648993 ?auto_648997 ) ) ( not ( = ?auto_648993 ?auto_648998 ) ) ( not ( = ?auto_648993 ?auto_648999 ) ) ( not ( = ?auto_648993 ?auto_649000 ) ) ( not ( = ?auto_648993 ?auto_649001 ) ) ( not ( = ?auto_648993 ?auto_649002 ) ) ( not ( = ?auto_648993 ?auto_649003 ) ) ( not ( = ?auto_648993 ?auto_649004 ) ) ( not ( = ?auto_648993 ?auto_649005 ) ) ( not ( = ?auto_648993 ?auto_649006 ) ) ( not ( = ?auto_648993 ?auto_649007 ) ) ( not ( = ?auto_648994 ?auto_648995 ) ) ( not ( = ?auto_648994 ?auto_648996 ) ) ( not ( = ?auto_648994 ?auto_648997 ) ) ( not ( = ?auto_648994 ?auto_648998 ) ) ( not ( = ?auto_648994 ?auto_648999 ) ) ( not ( = ?auto_648994 ?auto_649000 ) ) ( not ( = ?auto_648994 ?auto_649001 ) ) ( not ( = ?auto_648994 ?auto_649002 ) ) ( not ( = ?auto_648994 ?auto_649003 ) ) ( not ( = ?auto_648994 ?auto_649004 ) ) ( not ( = ?auto_648994 ?auto_649005 ) ) ( not ( = ?auto_648994 ?auto_649006 ) ) ( not ( = ?auto_648994 ?auto_649007 ) ) ( not ( = ?auto_648995 ?auto_648996 ) ) ( not ( = ?auto_648995 ?auto_648997 ) ) ( not ( = ?auto_648995 ?auto_648998 ) ) ( not ( = ?auto_648995 ?auto_648999 ) ) ( not ( = ?auto_648995 ?auto_649000 ) ) ( not ( = ?auto_648995 ?auto_649001 ) ) ( not ( = ?auto_648995 ?auto_649002 ) ) ( not ( = ?auto_648995 ?auto_649003 ) ) ( not ( = ?auto_648995 ?auto_649004 ) ) ( not ( = ?auto_648995 ?auto_649005 ) ) ( not ( = ?auto_648995 ?auto_649006 ) ) ( not ( = ?auto_648995 ?auto_649007 ) ) ( not ( = ?auto_648996 ?auto_648997 ) ) ( not ( = ?auto_648996 ?auto_648998 ) ) ( not ( = ?auto_648996 ?auto_648999 ) ) ( not ( = ?auto_648996 ?auto_649000 ) ) ( not ( = ?auto_648996 ?auto_649001 ) ) ( not ( = ?auto_648996 ?auto_649002 ) ) ( not ( = ?auto_648996 ?auto_649003 ) ) ( not ( = ?auto_648996 ?auto_649004 ) ) ( not ( = ?auto_648996 ?auto_649005 ) ) ( not ( = ?auto_648996 ?auto_649006 ) ) ( not ( = ?auto_648996 ?auto_649007 ) ) ( not ( = ?auto_648997 ?auto_648998 ) ) ( not ( = ?auto_648997 ?auto_648999 ) ) ( not ( = ?auto_648997 ?auto_649000 ) ) ( not ( = ?auto_648997 ?auto_649001 ) ) ( not ( = ?auto_648997 ?auto_649002 ) ) ( not ( = ?auto_648997 ?auto_649003 ) ) ( not ( = ?auto_648997 ?auto_649004 ) ) ( not ( = ?auto_648997 ?auto_649005 ) ) ( not ( = ?auto_648997 ?auto_649006 ) ) ( not ( = ?auto_648997 ?auto_649007 ) ) ( not ( = ?auto_648998 ?auto_648999 ) ) ( not ( = ?auto_648998 ?auto_649000 ) ) ( not ( = ?auto_648998 ?auto_649001 ) ) ( not ( = ?auto_648998 ?auto_649002 ) ) ( not ( = ?auto_648998 ?auto_649003 ) ) ( not ( = ?auto_648998 ?auto_649004 ) ) ( not ( = ?auto_648998 ?auto_649005 ) ) ( not ( = ?auto_648998 ?auto_649006 ) ) ( not ( = ?auto_648998 ?auto_649007 ) ) ( not ( = ?auto_648999 ?auto_649000 ) ) ( not ( = ?auto_648999 ?auto_649001 ) ) ( not ( = ?auto_648999 ?auto_649002 ) ) ( not ( = ?auto_648999 ?auto_649003 ) ) ( not ( = ?auto_648999 ?auto_649004 ) ) ( not ( = ?auto_648999 ?auto_649005 ) ) ( not ( = ?auto_648999 ?auto_649006 ) ) ( not ( = ?auto_648999 ?auto_649007 ) ) ( not ( = ?auto_649000 ?auto_649001 ) ) ( not ( = ?auto_649000 ?auto_649002 ) ) ( not ( = ?auto_649000 ?auto_649003 ) ) ( not ( = ?auto_649000 ?auto_649004 ) ) ( not ( = ?auto_649000 ?auto_649005 ) ) ( not ( = ?auto_649000 ?auto_649006 ) ) ( not ( = ?auto_649000 ?auto_649007 ) ) ( not ( = ?auto_649001 ?auto_649002 ) ) ( not ( = ?auto_649001 ?auto_649003 ) ) ( not ( = ?auto_649001 ?auto_649004 ) ) ( not ( = ?auto_649001 ?auto_649005 ) ) ( not ( = ?auto_649001 ?auto_649006 ) ) ( not ( = ?auto_649001 ?auto_649007 ) ) ( not ( = ?auto_649002 ?auto_649003 ) ) ( not ( = ?auto_649002 ?auto_649004 ) ) ( not ( = ?auto_649002 ?auto_649005 ) ) ( not ( = ?auto_649002 ?auto_649006 ) ) ( not ( = ?auto_649002 ?auto_649007 ) ) ( not ( = ?auto_649003 ?auto_649004 ) ) ( not ( = ?auto_649003 ?auto_649005 ) ) ( not ( = ?auto_649003 ?auto_649006 ) ) ( not ( = ?auto_649003 ?auto_649007 ) ) ( not ( = ?auto_649004 ?auto_649005 ) ) ( not ( = ?auto_649004 ?auto_649006 ) ) ( not ( = ?auto_649004 ?auto_649007 ) ) ( not ( = ?auto_649005 ?auto_649006 ) ) ( not ( = ?auto_649005 ?auto_649007 ) ) ( not ( = ?auto_649006 ?auto_649007 ) ) ( CLEAR ?auto_649004 ) ( ON ?auto_649005 ?auto_649006 ) ( CLEAR ?auto_649005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_648990 ?auto_648991 ?auto_648992 ?auto_648993 ?auto_648994 ?auto_648995 ?auto_648996 ?auto_648997 ?auto_648998 ?auto_648999 ?auto_649000 ?auto_649001 ?auto_649002 ?auto_649003 ?auto_649004 ?auto_649005 )
      ( MAKE-17PILE ?auto_648990 ?auto_648991 ?auto_648992 ?auto_648993 ?auto_648994 ?auto_648995 ?auto_648996 ?auto_648997 ?auto_648998 ?auto_648999 ?auto_649000 ?auto_649001 ?auto_649002 ?auto_649003 ?auto_649004 ?auto_649005 ?auto_649006 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649025 - BLOCK
      ?auto_649026 - BLOCK
      ?auto_649027 - BLOCK
      ?auto_649028 - BLOCK
      ?auto_649029 - BLOCK
      ?auto_649030 - BLOCK
      ?auto_649031 - BLOCK
      ?auto_649032 - BLOCK
      ?auto_649033 - BLOCK
      ?auto_649034 - BLOCK
      ?auto_649035 - BLOCK
      ?auto_649036 - BLOCK
      ?auto_649037 - BLOCK
      ?auto_649038 - BLOCK
      ?auto_649039 - BLOCK
      ?auto_649040 - BLOCK
      ?auto_649041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649041 ) ( ON-TABLE ?auto_649025 ) ( ON ?auto_649026 ?auto_649025 ) ( ON ?auto_649027 ?auto_649026 ) ( ON ?auto_649028 ?auto_649027 ) ( ON ?auto_649029 ?auto_649028 ) ( ON ?auto_649030 ?auto_649029 ) ( ON ?auto_649031 ?auto_649030 ) ( ON ?auto_649032 ?auto_649031 ) ( ON ?auto_649033 ?auto_649032 ) ( ON ?auto_649034 ?auto_649033 ) ( ON ?auto_649035 ?auto_649034 ) ( ON ?auto_649036 ?auto_649035 ) ( ON ?auto_649037 ?auto_649036 ) ( ON ?auto_649038 ?auto_649037 ) ( ON ?auto_649039 ?auto_649038 ) ( not ( = ?auto_649025 ?auto_649026 ) ) ( not ( = ?auto_649025 ?auto_649027 ) ) ( not ( = ?auto_649025 ?auto_649028 ) ) ( not ( = ?auto_649025 ?auto_649029 ) ) ( not ( = ?auto_649025 ?auto_649030 ) ) ( not ( = ?auto_649025 ?auto_649031 ) ) ( not ( = ?auto_649025 ?auto_649032 ) ) ( not ( = ?auto_649025 ?auto_649033 ) ) ( not ( = ?auto_649025 ?auto_649034 ) ) ( not ( = ?auto_649025 ?auto_649035 ) ) ( not ( = ?auto_649025 ?auto_649036 ) ) ( not ( = ?auto_649025 ?auto_649037 ) ) ( not ( = ?auto_649025 ?auto_649038 ) ) ( not ( = ?auto_649025 ?auto_649039 ) ) ( not ( = ?auto_649025 ?auto_649040 ) ) ( not ( = ?auto_649025 ?auto_649041 ) ) ( not ( = ?auto_649026 ?auto_649027 ) ) ( not ( = ?auto_649026 ?auto_649028 ) ) ( not ( = ?auto_649026 ?auto_649029 ) ) ( not ( = ?auto_649026 ?auto_649030 ) ) ( not ( = ?auto_649026 ?auto_649031 ) ) ( not ( = ?auto_649026 ?auto_649032 ) ) ( not ( = ?auto_649026 ?auto_649033 ) ) ( not ( = ?auto_649026 ?auto_649034 ) ) ( not ( = ?auto_649026 ?auto_649035 ) ) ( not ( = ?auto_649026 ?auto_649036 ) ) ( not ( = ?auto_649026 ?auto_649037 ) ) ( not ( = ?auto_649026 ?auto_649038 ) ) ( not ( = ?auto_649026 ?auto_649039 ) ) ( not ( = ?auto_649026 ?auto_649040 ) ) ( not ( = ?auto_649026 ?auto_649041 ) ) ( not ( = ?auto_649027 ?auto_649028 ) ) ( not ( = ?auto_649027 ?auto_649029 ) ) ( not ( = ?auto_649027 ?auto_649030 ) ) ( not ( = ?auto_649027 ?auto_649031 ) ) ( not ( = ?auto_649027 ?auto_649032 ) ) ( not ( = ?auto_649027 ?auto_649033 ) ) ( not ( = ?auto_649027 ?auto_649034 ) ) ( not ( = ?auto_649027 ?auto_649035 ) ) ( not ( = ?auto_649027 ?auto_649036 ) ) ( not ( = ?auto_649027 ?auto_649037 ) ) ( not ( = ?auto_649027 ?auto_649038 ) ) ( not ( = ?auto_649027 ?auto_649039 ) ) ( not ( = ?auto_649027 ?auto_649040 ) ) ( not ( = ?auto_649027 ?auto_649041 ) ) ( not ( = ?auto_649028 ?auto_649029 ) ) ( not ( = ?auto_649028 ?auto_649030 ) ) ( not ( = ?auto_649028 ?auto_649031 ) ) ( not ( = ?auto_649028 ?auto_649032 ) ) ( not ( = ?auto_649028 ?auto_649033 ) ) ( not ( = ?auto_649028 ?auto_649034 ) ) ( not ( = ?auto_649028 ?auto_649035 ) ) ( not ( = ?auto_649028 ?auto_649036 ) ) ( not ( = ?auto_649028 ?auto_649037 ) ) ( not ( = ?auto_649028 ?auto_649038 ) ) ( not ( = ?auto_649028 ?auto_649039 ) ) ( not ( = ?auto_649028 ?auto_649040 ) ) ( not ( = ?auto_649028 ?auto_649041 ) ) ( not ( = ?auto_649029 ?auto_649030 ) ) ( not ( = ?auto_649029 ?auto_649031 ) ) ( not ( = ?auto_649029 ?auto_649032 ) ) ( not ( = ?auto_649029 ?auto_649033 ) ) ( not ( = ?auto_649029 ?auto_649034 ) ) ( not ( = ?auto_649029 ?auto_649035 ) ) ( not ( = ?auto_649029 ?auto_649036 ) ) ( not ( = ?auto_649029 ?auto_649037 ) ) ( not ( = ?auto_649029 ?auto_649038 ) ) ( not ( = ?auto_649029 ?auto_649039 ) ) ( not ( = ?auto_649029 ?auto_649040 ) ) ( not ( = ?auto_649029 ?auto_649041 ) ) ( not ( = ?auto_649030 ?auto_649031 ) ) ( not ( = ?auto_649030 ?auto_649032 ) ) ( not ( = ?auto_649030 ?auto_649033 ) ) ( not ( = ?auto_649030 ?auto_649034 ) ) ( not ( = ?auto_649030 ?auto_649035 ) ) ( not ( = ?auto_649030 ?auto_649036 ) ) ( not ( = ?auto_649030 ?auto_649037 ) ) ( not ( = ?auto_649030 ?auto_649038 ) ) ( not ( = ?auto_649030 ?auto_649039 ) ) ( not ( = ?auto_649030 ?auto_649040 ) ) ( not ( = ?auto_649030 ?auto_649041 ) ) ( not ( = ?auto_649031 ?auto_649032 ) ) ( not ( = ?auto_649031 ?auto_649033 ) ) ( not ( = ?auto_649031 ?auto_649034 ) ) ( not ( = ?auto_649031 ?auto_649035 ) ) ( not ( = ?auto_649031 ?auto_649036 ) ) ( not ( = ?auto_649031 ?auto_649037 ) ) ( not ( = ?auto_649031 ?auto_649038 ) ) ( not ( = ?auto_649031 ?auto_649039 ) ) ( not ( = ?auto_649031 ?auto_649040 ) ) ( not ( = ?auto_649031 ?auto_649041 ) ) ( not ( = ?auto_649032 ?auto_649033 ) ) ( not ( = ?auto_649032 ?auto_649034 ) ) ( not ( = ?auto_649032 ?auto_649035 ) ) ( not ( = ?auto_649032 ?auto_649036 ) ) ( not ( = ?auto_649032 ?auto_649037 ) ) ( not ( = ?auto_649032 ?auto_649038 ) ) ( not ( = ?auto_649032 ?auto_649039 ) ) ( not ( = ?auto_649032 ?auto_649040 ) ) ( not ( = ?auto_649032 ?auto_649041 ) ) ( not ( = ?auto_649033 ?auto_649034 ) ) ( not ( = ?auto_649033 ?auto_649035 ) ) ( not ( = ?auto_649033 ?auto_649036 ) ) ( not ( = ?auto_649033 ?auto_649037 ) ) ( not ( = ?auto_649033 ?auto_649038 ) ) ( not ( = ?auto_649033 ?auto_649039 ) ) ( not ( = ?auto_649033 ?auto_649040 ) ) ( not ( = ?auto_649033 ?auto_649041 ) ) ( not ( = ?auto_649034 ?auto_649035 ) ) ( not ( = ?auto_649034 ?auto_649036 ) ) ( not ( = ?auto_649034 ?auto_649037 ) ) ( not ( = ?auto_649034 ?auto_649038 ) ) ( not ( = ?auto_649034 ?auto_649039 ) ) ( not ( = ?auto_649034 ?auto_649040 ) ) ( not ( = ?auto_649034 ?auto_649041 ) ) ( not ( = ?auto_649035 ?auto_649036 ) ) ( not ( = ?auto_649035 ?auto_649037 ) ) ( not ( = ?auto_649035 ?auto_649038 ) ) ( not ( = ?auto_649035 ?auto_649039 ) ) ( not ( = ?auto_649035 ?auto_649040 ) ) ( not ( = ?auto_649035 ?auto_649041 ) ) ( not ( = ?auto_649036 ?auto_649037 ) ) ( not ( = ?auto_649036 ?auto_649038 ) ) ( not ( = ?auto_649036 ?auto_649039 ) ) ( not ( = ?auto_649036 ?auto_649040 ) ) ( not ( = ?auto_649036 ?auto_649041 ) ) ( not ( = ?auto_649037 ?auto_649038 ) ) ( not ( = ?auto_649037 ?auto_649039 ) ) ( not ( = ?auto_649037 ?auto_649040 ) ) ( not ( = ?auto_649037 ?auto_649041 ) ) ( not ( = ?auto_649038 ?auto_649039 ) ) ( not ( = ?auto_649038 ?auto_649040 ) ) ( not ( = ?auto_649038 ?auto_649041 ) ) ( not ( = ?auto_649039 ?auto_649040 ) ) ( not ( = ?auto_649039 ?auto_649041 ) ) ( not ( = ?auto_649040 ?auto_649041 ) ) ( CLEAR ?auto_649039 ) ( ON ?auto_649040 ?auto_649041 ) ( CLEAR ?auto_649040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_649025 ?auto_649026 ?auto_649027 ?auto_649028 ?auto_649029 ?auto_649030 ?auto_649031 ?auto_649032 ?auto_649033 ?auto_649034 ?auto_649035 ?auto_649036 ?auto_649037 ?auto_649038 ?auto_649039 ?auto_649040 )
      ( MAKE-17PILE ?auto_649025 ?auto_649026 ?auto_649027 ?auto_649028 ?auto_649029 ?auto_649030 ?auto_649031 ?auto_649032 ?auto_649033 ?auto_649034 ?auto_649035 ?auto_649036 ?auto_649037 ?auto_649038 ?auto_649039 ?auto_649040 ?auto_649041 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649059 - BLOCK
      ?auto_649060 - BLOCK
      ?auto_649061 - BLOCK
      ?auto_649062 - BLOCK
      ?auto_649063 - BLOCK
      ?auto_649064 - BLOCK
      ?auto_649065 - BLOCK
      ?auto_649066 - BLOCK
      ?auto_649067 - BLOCK
      ?auto_649068 - BLOCK
      ?auto_649069 - BLOCK
      ?auto_649070 - BLOCK
      ?auto_649071 - BLOCK
      ?auto_649072 - BLOCK
      ?auto_649073 - BLOCK
      ?auto_649074 - BLOCK
      ?auto_649075 - BLOCK
    )
    :vars
    (
      ?auto_649076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649075 ?auto_649076 ) ( ON-TABLE ?auto_649059 ) ( ON ?auto_649060 ?auto_649059 ) ( ON ?auto_649061 ?auto_649060 ) ( ON ?auto_649062 ?auto_649061 ) ( ON ?auto_649063 ?auto_649062 ) ( ON ?auto_649064 ?auto_649063 ) ( ON ?auto_649065 ?auto_649064 ) ( ON ?auto_649066 ?auto_649065 ) ( ON ?auto_649067 ?auto_649066 ) ( ON ?auto_649068 ?auto_649067 ) ( ON ?auto_649069 ?auto_649068 ) ( ON ?auto_649070 ?auto_649069 ) ( ON ?auto_649071 ?auto_649070 ) ( ON ?auto_649072 ?auto_649071 ) ( not ( = ?auto_649059 ?auto_649060 ) ) ( not ( = ?auto_649059 ?auto_649061 ) ) ( not ( = ?auto_649059 ?auto_649062 ) ) ( not ( = ?auto_649059 ?auto_649063 ) ) ( not ( = ?auto_649059 ?auto_649064 ) ) ( not ( = ?auto_649059 ?auto_649065 ) ) ( not ( = ?auto_649059 ?auto_649066 ) ) ( not ( = ?auto_649059 ?auto_649067 ) ) ( not ( = ?auto_649059 ?auto_649068 ) ) ( not ( = ?auto_649059 ?auto_649069 ) ) ( not ( = ?auto_649059 ?auto_649070 ) ) ( not ( = ?auto_649059 ?auto_649071 ) ) ( not ( = ?auto_649059 ?auto_649072 ) ) ( not ( = ?auto_649059 ?auto_649073 ) ) ( not ( = ?auto_649059 ?auto_649074 ) ) ( not ( = ?auto_649059 ?auto_649075 ) ) ( not ( = ?auto_649059 ?auto_649076 ) ) ( not ( = ?auto_649060 ?auto_649061 ) ) ( not ( = ?auto_649060 ?auto_649062 ) ) ( not ( = ?auto_649060 ?auto_649063 ) ) ( not ( = ?auto_649060 ?auto_649064 ) ) ( not ( = ?auto_649060 ?auto_649065 ) ) ( not ( = ?auto_649060 ?auto_649066 ) ) ( not ( = ?auto_649060 ?auto_649067 ) ) ( not ( = ?auto_649060 ?auto_649068 ) ) ( not ( = ?auto_649060 ?auto_649069 ) ) ( not ( = ?auto_649060 ?auto_649070 ) ) ( not ( = ?auto_649060 ?auto_649071 ) ) ( not ( = ?auto_649060 ?auto_649072 ) ) ( not ( = ?auto_649060 ?auto_649073 ) ) ( not ( = ?auto_649060 ?auto_649074 ) ) ( not ( = ?auto_649060 ?auto_649075 ) ) ( not ( = ?auto_649060 ?auto_649076 ) ) ( not ( = ?auto_649061 ?auto_649062 ) ) ( not ( = ?auto_649061 ?auto_649063 ) ) ( not ( = ?auto_649061 ?auto_649064 ) ) ( not ( = ?auto_649061 ?auto_649065 ) ) ( not ( = ?auto_649061 ?auto_649066 ) ) ( not ( = ?auto_649061 ?auto_649067 ) ) ( not ( = ?auto_649061 ?auto_649068 ) ) ( not ( = ?auto_649061 ?auto_649069 ) ) ( not ( = ?auto_649061 ?auto_649070 ) ) ( not ( = ?auto_649061 ?auto_649071 ) ) ( not ( = ?auto_649061 ?auto_649072 ) ) ( not ( = ?auto_649061 ?auto_649073 ) ) ( not ( = ?auto_649061 ?auto_649074 ) ) ( not ( = ?auto_649061 ?auto_649075 ) ) ( not ( = ?auto_649061 ?auto_649076 ) ) ( not ( = ?auto_649062 ?auto_649063 ) ) ( not ( = ?auto_649062 ?auto_649064 ) ) ( not ( = ?auto_649062 ?auto_649065 ) ) ( not ( = ?auto_649062 ?auto_649066 ) ) ( not ( = ?auto_649062 ?auto_649067 ) ) ( not ( = ?auto_649062 ?auto_649068 ) ) ( not ( = ?auto_649062 ?auto_649069 ) ) ( not ( = ?auto_649062 ?auto_649070 ) ) ( not ( = ?auto_649062 ?auto_649071 ) ) ( not ( = ?auto_649062 ?auto_649072 ) ) ( not ( = ?auto_649062 ?auto_649073 ) ) ( not ( = ?auto_649062 ?auto_649074 ) ) ( not ( = ?auto_649062 ?auto_649075 ) ) ( not ( = ?auto_649062 ?auto_649076 ) ) ( not ( = ?auto_649063 ?auto_649064 ) ) ( not ( = ?auto_649063 ?auto_649065 ) ) ( not ( = ?auto_649063 ?auto_649066 ) ) ( not ( = ?auto_649063 ?auto_649067 ) ) ( not ( = ?auto_649063 ?auto_649068 ) ) ( not ( = ?auto_649063 ?auto_649069 ) ) ( not ( = ?auto_649063 ?auto_649070 ) ) ( not ( = ?auto_649063 ?auto_649071 ) ) ( not ( = ?auto_649063 ?auto_649072 ) ) ( not ( = ?auto_649063 ?auto_649073 ) ) ( not ( = ?auto_649063 ?auto_649074 ) ) ( not ( = ?auto_649063 ?auto_649075 ) ) ( not ( = ?auto_649063 ?auto_649076 ) ) ( not ( = ?auto_649064 ?auto_649065 ) ) ( not ( = ?auto_649064 ?auto_649066 ) ) ( not ( = ?auto_649064 ?auto_649067 ) ) ( not ( = ?auto_649064 ?auto_649068 ) ) ( not ( = ?auto_649064 ?auto_649069 ) ) ( not ( = ?auto_649064 ?auto_649070 ) ) ( not ( = ?auto_649064 ?auto_649071 ) ) ( not ( = ?auto_649064 ?auto_649072 ) ) ( not ( = ?auto_649064 ?auto_649073 ) ) ( not ( = ?auto_649064 ?auto_649074 ) ) ( not ( = ?auto_649064 ?auto_649075 ) ) ( not ( = ?auto_649064 ?auto_649076 ) ) ( not ( = ?auto_649065 ?auto_649066 ) ) ( not ( = ?auto_649065 ?auto_649067 ) ) ( not ( = ?auto_649065 ?auto_649068 ) ) ( not ( = ?auto_649065 ?auto_649069 ) ) ( not ( = ?auto_649065 ?auto_649070 ) ) ( not ( = ?auto_649065 ?auto_649071 ) ) ( not ( = ?auto_649065 ?auto_649072 ) ) ( not ( = ?auto_649065 ?auto_649073 ) ) ( not ( = ?auto_649065 ?auto_649074 ) ) ( not ( = ?auto_649065 ?auto_649075 ) ) ( not ( = ?auto_649065 ?auto_649076 ) ) ( not ( = ?auto_649066 ?auto_649067 ) ) ( not ( = ?auto_649066 ?auto_649068 ) ) ( not ( = ?auto_649066 ?auto_649069 ) ) ( not ( = ?auto_649066 ?auto_649070 ) ) ( not ( = ?auto_649066 ?auto_649071 ) ) ( not ( = ?auto_649066 ?auto_649072 ) ) ( not ( = ?auto_649066 ?auto_649073 ) ) ( not ( = ?auto_649066 ?auto_649074 ) ) ( not ( = ?auto_649066 ?auto_649075 ) ) ( not ( = ?auto_649066 ?auto_649076 ) ) ( not ( = ?auto_649067 ?auto_649068 ) ) ( not ( = ?auto_649067 ?auto_649069 ) ) ( not ( = ?auto_649067 ?auto_649070 ) ) ( not ( = ?auto_649067 ?auto_649071 ) ) ( not ( = ?auto_649067 ?auto_649072 ) ) ( not ( = ?auto_649067 ?auto_649073 ) ) ( not ( = ?auto_649067 ?auto_649074 ) ) ( not ( = ?auto_649067 ?auto_649075 ) ) ( not ( = ?auto_649067 ?auto_649076 ) ) ( not ( = ?auto_649068 ?auto_649069 ) ) ( not ( = ?auto_649068 ?auto_649070 ) ) ( not ( = ?auto_649068 ?auto_649071 ) ) ( not ( = ?auto_649068 ?auto_649072 ) ) ( not ( = ?auto_649068 ?auto_649073 ) ) ( not ( = ?auto_649068 ?auto_649074 ) ) ( not ( = ?auto_649068 ?auto_649075 ) ) ( not ( = ?auto_649068 ?auto_649076 ) ) ( not ( = ?auto_649069 ?auto_649070 ) ) ( not ( = ?auto_649069 ?auto_649071 ) ) ( not ( = ?auto_649069 ?auto_649072 ) ) ( not ( = ?auto_649069 ?auto_649073 ) ) ( not ( = ?auto_649069 ?auto_649074 ) ) ( not ( = ?auto_649069 ?auto_649075 ) ) ( not ( = ?auto_649069 ?auto_649076 ) ) ( not ( = ?auto_649070 ?auto_649071 ) ) ( not ( = ?auto_649070 ?auto_649072 ) ) ( not ( = ?auto_649070 ?auto_649073 ) ) ( not ( = ?auto_649070 ?auto_649074 ) ) ( not ( = ?auto_649070 ?auto_649075 ) ) ( not ( = ?auto_649070 ?auto_649076 ) ) ( not ( = ?auto_649071 ?auto_649072 ) ) ( not ( = ?auto_649071 ?auto_649073 ) ) ( not ( = ?auto_649071 ?auto_649074 ) ) ( not ( = ?auto_649071 ?auto_649075 ) ) ( not ( = ?auto_649071 ?auto_649076 ) ) ( not ( = ?auto_649072 ?auto_649073 ) ) ( not ( = ?auto_649072 ?auto_649074 ) ) ( not ( = ?auto_649072 ?auto_649075 ) ) ( not ( = ?auto_649072 ?auto_649076 ) ) ( not ( = ?auto_649073 ?auto_649074 ) ) ( not ( = ?auto_649073 ?auto_649075 ) ) ( not ( = ?auto_649073 ?auto_649076 ) ) ( not ( = ?auto_649074 ?auto_649075 ) ) ( not ( = ?auto_649074 ?auto_649076 ) ) ( not ( = ?auto_649075 ?auto_649076 ) ) ( ON ?auto_649074 ?auto_649075 ) ( CLEAR ?auto_649072 ) ( ON ?auto_649073 ?auto_649074 ) ( CLEAR ?auto_649073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_649059 ?auto_649060 ?auto_649061 ?auto_649062 ?auto_649063 ?auto_649064 ?auto_649065 ?auto_649066 ?auto_649067 ?auto_649068 ?auto_649069 ?auto_649070 ?auto_649071 ?auto_649072 ?auto_649073 )
      ( MAKE-17PILE ?auto_649059 ?auto_649060 ?auto_649061 ?auto_649062 ?auto_649063 ?auto_649064 ?auto_649065 ?auto_649066 ?auto_649067 ?auto_649068 ?auto_649069 ?auto_649070 ?auto_649071 ?auto_649072 ?auto_649073 ?auto_649074 ?auto_649075 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649094 - BLOCK
      ?auto_649095 - BLOCK
      ?auto_649096 - BLOCK
      ?auto_649097 - BLOCK
      ?auto_649098 - BLOCK
      ?auto_649099 - BLOCK
      ?auto_649100 - BLOCK
      ?auto_649101 - BLOCK
      ?auto_649102 - BLOCK
      ?auto_649103 - BLOCK
      ?auto_649104 - BLOCK
      ?auto_649105 - BLOCK
      ?auto_649106 - BLOCK
      ?auto_649107 - BLOCK
      ?auto_649108 - BLOCK
      ?auto_649109 - BLOCK
      ?auto_649110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649110 ) ( ON-TABLE ?auto_649094 ) ( ON ?auto_649095 ?auto_649094 ) ( ON ?auto_649096 ?auto_649095 ) ( ON ?auto_649097 ?auto_649096 ) ( ON ?auto_649098 ?auto_649097 ) ( ON ?auto_649099 ?auto_649098 ) ( ON ?auto_649100 ?auto_649099 ) ( ON ?auto_649101 ?auto_649100 ) ( ON ?auto_649102 ?auto_649101 ) ( ON ?auto_649103 ?auto_649102 ) ( ON ?auto_649104 ?auto_649103 ) ( ON ?auto_649105 ?auto_649104 ) ( ON ?auto_649106 ?auto_649105 ) ( ON ?auto_649107 ?auto_649106 ) ( not ( = ?auto_649094 ?auto_649095 ) ) ( not ( = ?auto_649094 ?auto_649096 ) ) ( not ( = ?auto_649094 ?auto_649097 ) ) ( not ( = ?auto_649094 ?auto_649098 ) ) ( not ( = ?auto_649094 ?auto_649099 ) ) ( not ( = ?auto_649094 ?auto_649100 ) ) ( not ( = ?auto_649094 ?auto_649101 ) ) ( not ( = ?auto_649094 ?auto_649102 ) ) ( not ( = ?auto_649094 ?auto_649103 ) ) ( not ( = ?auto_649094 ?auto_649104 ) ) ( not ( = ?auto_649094 ?auto_649105 ) ) ( not ( = ?auto_649094 ?auto_649106 ) ) ( not ( = ?auto_649094 ?auto_649107 ) ) ( not ( = ?auto_649094 ?auto_649108 ) ) ( not ( = ?auto_649094 ?auto_649109 ) ) ( not ( = ?auto_649094 ?auto_649110 ) ) ( not ( = ?auto_649095 ?auto_649096 ) ) ( not ( = ?auto_649095 ?auto_649097 ) ) ( not ( = ?auto_649095 ?auto_649098 ) ) ( not ( = ?auto_649095 ?auto_649099 ) ) ( not ( = ?auto_649095 ?auto_649100 ) ) ( not ( = ?auto_649095 ?auto_649101 ) ) ( not ( = ?auto_649095 ?auto_649102 ) ) ( not ( = ?auto_649095 ?auto_649103 ) ) ( not ( = ?auto_649095 ?auto_649104 ) ) ( not ( = ?auto_649095 ?auto_649105 ) ) ( not ( = ?auto_649095 ?auto_649106 ) ) ( not ( = ?auto_649095 ?auto_649107 ) ) ( not ( = ?auto_649095 ?auto_649108 ) ) ( not ( = ?auto_649095 ?auto_649109 ) ) ( not ( = ?auto_649095 ?auto_649110 ) ) ( not ( = ?auto_649096 ?auto_649097 ) ) ( not ( = ?auto_649096 ?auto_649098 ) ) ( not ( = ?auto_649096 ?auto_649099 ) ) ( not ( = ?auto_649096 ?auto_649100 ) ) ( not ( = ?auto_649096 ?auto_649101 ) ) ( not ( = ?auto_649096 ?auto_649102 ) ) ( not ( = ?auto_649096 ?auto_649103 ) ) ( not ( = ?auto_649096 ?auto_649104 ) ) ( not ( = ?auto_649096 ?auto_649105 ) ) ( not ( = ?auto_649096 ?auto_649106 ) ) ( not ( = ?auto_649096 ?auto_649107 ) ) ( not ( = ?auto_649096 ?auto_649108 ) ) ( not ( = ?auto_649096 ?auto_649109 ) ) ( not ( = ?auto_649096 ?auto_649110 ) ) ( not ( = ?auto_649097 ?auto_649098 ) ) ( not ( = ?auto_649097 ?auto_649099 ) ) ( not ( = ?auto_649097 ?auto_649100 ) ) ( not ( = ?auto_649097 ?auto_649101 ) ) ( not ( = ?auto_649097 ?auto_649102 ) ) ( not ( = ?auto_649097 ?auto_649103 ) ) ( not ( = ?auto_649097 ?auto_649104 ) ) ( not ( = ?auto_649097 ?auto_649105 ) ) ( not ( = ?auto_649097 ?auto_649106 ) ) ( not ( = ?auto_649097 ?auto_649107 ) ) ( not ( = ?auto_649097 ?auto_649108 ) ) ( not ( = ?auto_649097 ?auto_649109 ) ) ( not ( = ?auto_649097 ?auto_649110 ) ) ( not ( = ?auto_649098 ?auto_649099 ) ) ( not ( = ?auto_649098 ?auto_649100 ) ) ( not ( = ?auto_649098 ?auto_649101 ) ) ( not ( = ?auto_649098 ?auto_649102 ) ) ( not ( = ?auto_649098 ?auto_649103 ) ) ( not ( = ?auto_649098 ?auto_649104 ) ) ( not ( = ?auto_649098 ?auto_649105 ) ) ( not ( = ?auto_649098 ?auto_649106 ) ) ( not ( = ?auto_649098 ?auto_649107 ) ) ( not ( = ?auto_649098 ?auto_649108 ) ) ( not ( = ?auto_649098 ?auto_649109 ) ) ( not ( = ?auto_649098 ?auto_649110 ) ) ( not ( = ?auto_649099 ?auto_649100 ) ) ( not ( = ?auto_649099 ?auto_649101 ) ) ( not ( = ?auto_649099 ?auto_649102 ) ) ( not ( = ?auto_649099 ?auto_649103 ) ) ( not ( = ?auto_649099 ?auto_649104 ) ) ( not ( = ?auto_649099 ?auto_649105 ) ) ( not ( = ?auto_649099 ?auto_649106 ) ) ( not ( = ?auto_649099 ?auto_649107 ) ) ( not ( = ?auto_649099 ?auto_649108 ) ) ( not ( = ?auto_649099 ?auto_649109 ) ) ( not ( = ?auto_649099 ?auto_649110 ) ) ( not ( = ?auto_649100 ?auto_649101 ) ) ( not ( = ?auto_649100 ?auto_649102 ) ) ( not ( = ?auto_649100 ?auto_649103 ) ) ( not ( = ?auto_649100 ?auto_649104 ) ) ( not ( = ?auto_649100 ?auto_649105 ) ) ( not ( = ?auto_649100 ?auto_649106 ) ) ( not ( = ?auto_649100 ?auto_649107 ) ) ( not ( = ?auto_649100 ?auto_649108 ) ) ( not ( = ?auto_649100 ?auto_649109 ) ) ( not ( = ?auto_649100 ?auto_649110 ) ) ( not ( = ?auto_649101 ?auto_649102 ) ) ( not ( = ?auto_649101 ?auto_649103 ) ) ( not ( = ?auto_649101 ?auto_649104 ) ) ( not ( = ?auto_649101 ?auto_649105 ) ) ( not ( = ?auto_649101 ?auto_649106 ) ) ( not ( = ?auto_649101 ?auto_649107 ) ) ( not ( = ?auto_649101 ?auto_649108 ) ) ( not ( = ?auto_649101 ?auto_649109 ) ) ( not ( = ?auto_649101 ?auto_649110 ) ) ( not ( = ?auto_649102 ?auto_649103 ) ) ( not ( = ?auto_649102 ?auto_649104 ) ) ( not ( = ?auto_649102 ?auto_649105 ) ) ( not ( = ?auto_649102 ?auto_649106 ) ) ( not ( = ?auto_649102 ?auto_649107 ) ) ( not ( = ?auto_649102 ?auto_649108 ) ) ( not ( = ?auto_649102 ?auto_649109 ) ) ( not ( = ?auto_649102 ?auto_649110 ) ) ( not ( = ?auto_649103 ?auto_649104 ) ) ( not ( = ?auto_649103 ?auto_649105 ) ) ( not ( = ?auto_649103 ?auto_649106 ) ) ( not ( = ?auto_649103 ?auto_649107 ) ) ( not ( = ?auto_649103 ?auto_649108 ) ) ( not ( = ?auto_649103 ?auto_649109 ) ) ( not ( = ?auto_649103 ?auto_649110 ) ) ( not ( = ?auto_649104 ?auto_649105 ) ) ( not ( = ?auto_649104 ?auto_649106 ) ) ( not ( = ?auto_649104 ?auto_649107 ) ) ( not ( = ?auto_649104 ?auto_649108 ) ) ( not ( = ?auto_649104 ?auto_649109 ) ) ( not ( = ?auto_649104 ?auto_649110 ) ) ( not ( = ?auto_649105 ?auto_649106 ) ) ( not ( = ?auto_649105 ?auto_649107 ) ) ( not ( = ?auto_649105 ?auto_649108 ) ) ( not ( = ?auto_649105 ?auto_649109 ) ) ( not ( = ?auto_649105 ?auto_649110 ) ) ( not ( = ?auto_649106 ?auto_649107 ) ) ( not ( = ?auto_649106 ?auto_649108 ) ) ( not ( = ?auto_649106 ?auto_649109 ) ) ( not ( = ?auto_649106 ?auto_649110 ) ) ( not ( = ?auto_649107 ?auto_649108 ) ) ( not ( = ?auto_649107 ?auto_649109 ) ) ( not ( = ?auto_649107 ?auto_649110 ) ) ( not ( = ?auto_649108 ?auto_649109 ) ) ( not ( = ?auto_649108 ?auto_649110 ) ) ( not ( = ?auto_649109 ?auto_649110 ) ) ( ON ?auto_649109 ?auto_649110 ) ( CLEAR ?auto_649107 ) ( ON ?auto_649108 ?auto_649109 ) ( CLEAR ?auto_649108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_649094 ?auto_649095 ?auto_649096 ?auto_649097 ?auto_649098 ?auto_649099 ?auto_649100 ?auto_649101 ?auto_649102 ?auto_649103 ?auto_649104 ?auto_649105 ?auto_649106 ?auto_649107 ?auto_649108 )
      ( MAKE-17PILE ?auto_649094 ?auto_649095 ?auto_649096 ?auto_649097 ?auto_649098 ?auto_649099 ?auto_649100 ?auto_649101 ?auto_649102 ?auto_649103 ?auto_649104 ?auto_649105 ?auto_649106 ?auto_649107 ?auto_649108 ?auto_649109 ?auto_649110 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649128 - BLOCK
      ?auto_649129 - BLOCK
      ?auto_649130 - BLOCK
      ?auto_649131 - BLOCK
      ?auto_649132 - BLOCK
      ?auto_649133 - BLOCK
      ?auto_649134 - BLOCK
      ?auto_649135 - BLOCK
      ?auto_649136 - BLOCK
      ?auto_649137 - BLOCK
      ?auto_649138 - BLOCK
      ?auto_649139 - BLOCK
      ?auto_649140 - BLOCK
      ?auto_649141 - BLOCK
      ?auto_649142 - BLOCK
      ?auto_649143 - BLOCK
      ?auto_649144 - BLOCK
    )
    :vars
    (
      ?auto_649145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649144 ?auto_649145 ) ( ON-TABLE ?auto_649128 ) ( ON ?auto_649129 ?auto_649128 ) ( ON ?auto_649130 ?auto_649129 ) ( ON ?auto_649131 ?auto_649130 ) ( ON ?auto_649132 ?auto_649131 ) ( ON ?auto_649133 ?auto_649132 ) ( ON ?auto_649134 ?auto_649133 ) ( ON ?auto_649135 ?auto_649134 ) ( ON ?auto_649136 ?auto_649135 ) ( ON ?auto_649137 ?auto_649136 ) ( ON ?auto_649138 ?auto_649137 ) ( ON ?auto_649139 ?auto_649138 ) ( ON ?auto_649140 ?auto_649139 ) ( not ( = ?auto_649128 ?auto_649129 ) ) ( not ( = ?auto_649128 ?auto_649130 ) ) ( not ( = ?auto_649128 ?auto_649131 ) ) ( not ( = ?auto_649128 ?auto_649132 ) ) ( not ( = ?auto_649128 ?auto_649133 ) ) ( not ( = ?auto_649128 ?auto_649134 ) ) ( not ( = ?auto_649128 ?auto_649135 ) ) ( not ( = ?auto_649128 ?auto_649136 ) ) ( not ( = ?auto_649128 ?auto_649137 ) ) ( not ( = ?auto_649128 ?auto_649138 ) ) ( not ( = ?auto_649128 ?auto_649139 ) ) ( not ( = ?auto_649128 ?auto_649140 ) ) ( not ( = ?auto_649128 ?auto_649141 ) ) ( not ( = ?auto_649128 ?auto_649142 ) ) ( not ( = ?auto_649128 ?auto_649143 ) ) ( not ( = ?auto_649128 ?auto_649144 ) ) ( not ( = ?auto_649128 ?auto_649145 ) ) ( not ( = ?auto_649129 ?auto_649130 ) ) ( not ( = ?auto_649129 ?auto_649131 ) ) ( not ( = ?auto_649129 ?auto_649132 ) ) ( not ( = ?auto_649129 ?auto_649133 ) ) ( not ( = ?auto_649129 ?auto_649134 ) ) ( not ( = ?auto_649129 ?auto_649135 ) ) ( not ( = ?auto_649129 ?auto_649136 ) ) ( not ( = ?auto_649129 ?auto_649137 ) ) ( not ( = ?auto_649129 ?auto_649138 ) ) ( not ( = ?auto_649129 ?auto_649139 ) ) ( not ( = ?auto_649129 ?auto_649140 ) ) ( not ( = ?auto_649129 ?auto_649141 ) ) ( not ( = ?auto_649129 ?auto_649142 ) ) ( not ( = ?auto_649129 ?auto_649143 ) ) ( not ( = ?auto_649129 ?auto_649144 ) ) ( not ( = ?auto_649129 ?auto_649145 ) ) ( not ( = ?auto_649130 ?auto_649131 ) ) ( not ( = ?auto_649130 ?auto_649132 ) ) ( not ( = ?auto_649130 ?auto_649133 ) ) ( not ( = ?auto_649130 ?auto_649134 ) ) ( not ( = ?auto_649130 ?auto_649135 ) ) ( not ( = ?auto_649130 ?auto_649136 ) ) ( not ( = ?auto_649130 ?auto_649137 ) ) ( not ( = ?auto_649130 ?auto_649138 ) ) ( not ( = ?auto_649130 ?auto_649139 ) ) ( not ( = ?auto_649130 ?auto_649140 ) ) ( not ( = ?auto_649130 ?auto_649141 ) ) ( not ( = ?auto_649130 ?auto_649142 ) ) ( not ( = ?auto_649130 ?auto_649143 ) ) ( not ( = ?auto_649130 ?auto_649144 ) ) ( not ( = ?auto_649130 ?auto_649145 ) ) ( not ( = ?auto_649131 ?auto_649132 ) ) ( not ( = ?auto_649131 ?auto_649133 ) ) ( not ( = ?auto_649131 ?auto_649134 ) ) ( not ( = ?auto_649131 ?auto_649135 ) ) ( not ( = ?auto_649131 ?auto_649136 ) ) ( not ( = ?auto_649131 ?auto_649137 ) ) ( not ( = ?auto_649131 ?auto_649138 ) ) ( not ( = ?auto_649131 ?auto_649139 ) ) ( not ( = ?auto_649131 ?auto_649140 ) ) ( not ( = ?auto_649131 ?auto_649141 ) ) ( not ( = ?auto_649131 ?auto_649142 ) ) ( not ( = ?auto_649131 ?auto_649143 ) ) ( not ( = ?auto_649131 ?auto_649144 ) ) ( not ( = ?auto_649131 ?auto_649145 ) ) ( not ( = ?auto_649132 ?auto_649133 ) ) ( not ( = ?auto_649132 ?auto_649134 ) ) ( not ( = ?auto_649132 ?auto_649135 ) ) ( not ( = ?auto_649132 ?auto_649136 ) ) ( not ( = ?auto_649132 ?auto_649137 ) ) ( not ( = ?auto_649132 ?auto_649138 ) ) ( not ( = ?auto_649132 ?auto_649139 ) ) ( not ( = ?auto_649132 ?auto_649140 ) ) ( not ( = ?auto_649132 ?auto_649141 ) ) ( not ( = ?auto_649132 ?auto_649142 ) ) ( not ( = ?auto_649132 ?auto_649143 ) ) ( not ( = ?auto_649132 ?auto_649144 ) ) ( not ( = ?auto_649132 ?auto_649145 ) ) ( not ( = ?auto_649133 ?auto_649134 ) ) ( not ( = ?auto_649133 ?auto_649135 ) ) ( not ( = ?auto_649133 ?auto_649136 ) ) ( not ( = ?auto_649133 ?auto_649137 ) ) ( not ( = ?auto_649133 ?auto_649138 ) ) ( not ( = ?auto_649133 ?auto_649139 ) ) ( not ( = ?auto_649133 ?auto_649140 ) ) ( not ( = ?auto_649133 ?auto_649141 ) ) ( not ( = ?auto_649133 ?auto_649142 ) ) ( not ( = ?auto_649133 ?auto_649143 ) ) ( not ( = ?auto_649133 ?auto_649144 ) ) ( not ( = ?auto_649133 ?auto_649145 ) ) ( not ( = ?auto_649134 ?auto_649135 ) ) ( not ( = ?auto_649134 ?auto_649136 ) ) ( not ( = ?auto_649134 ?auto_649137 ) ) ( not ( = ?auto_649134 ?auto_649138 ) ) ( not ( = ?auto_649134 ?auto_649139 ) ) ( not ( = ?auto_649134 ?auto_649140 ) ) ( not ( = ?auto_649134 ?auto_649141 ) ) ( not ( = ?auto_649134 ?auto_649142 ) ) ( not ( = ?auto_649134 ?auto_649143 ) ) ( not ( = ?auto_649134 ?auto_649144 ) ) ( not ( = ?auto_649134 ?auto_649145 ) ) ( not ( = ?auto_649135 ?auto_649136 ) ) ( not ( = ?auto_649135 ?auto_649137 ) ) ( not ( = ?auto_649135 ?auto_649138 ) ) ( not ( = ?auto_649135 ?auto_649139 ) ) ( not ( = ?auto_649135 ?auto_649140 ) ) ( not ( = ?auto_649135 ?auto_649141 ) ) ( not ( = ?auto_649135 ?auto_649142 ) ) ( not ( = ?auto_649135 ?auto_649143 ) ) ( not ( = ?auto_649135 ?auto_649144 ) ) ( not ( = ?auto_649135 ?auto_649145 ) ) ( not ( = ?auto_649136 ?auto_649137 ) ) ( not ( = ?auto_649136 ?auto_649138 ) ) ( not ( = ?auto_649136 ?auto_649139 ) ) ( not ( = ?auto_649136 ?auto_649140 ) ) ( not ( = ?auto_649136 ?auto_649141 ) ) ( not ( = ?auto_649136 ?auto_649142 ) ) ( not ( = ?auto_649136 ?auto_649143 ) ) ( not ( = ?auto_649136 ?auto_649144 ) ) ( not ( = ?auto_649136 ?auto_649145 ) ) ( not ( = ?auto_649137 ?auto_649138 ) ) ( not ( = ?auto_649137 ?auto_649139 ) ) ( not ( = ?auto_649137 ?auto_649140 ) ) ( not ( = ?auto_649137 ?auto_649141 ) ) ( not ( = ?auto_649137 ?auto_649142 ) ) ( not ( = ?auto_649137 ?auto_649143 ) ) ( not ( = ?auto_649137 ?auto_649144 ) ) ( not ( = ?auto_649137 ?auto_649145 ) ) ( not ( = ?auto_649138 ?auto_649139 ) ) ( not ( = ?auto_649138 ?auto_649140 ) ) ( not ( = ?auto_649138 ?auto_649141 ) ) ( not ( = ?auto_649138 ?auto_649142 ) ) ( not ( = ?auto_649138 ?auto_649143 ) ) ( not ( = ?auto_649138 ?auto_649144 ) ) ( not ( = ?auto_649138 ?auto_649145 ) ) ( not ( = ?auto_649139 ?auto_649140 ) ) ( not ( = ?auto_649139 ?auto_649141 ) ) ( not ( = ?auto_649139 ?auto_649142 ) ) ( not ( = ?auto_649139 ?auto_649143 ) ) ( not ( = ?auto_649139 ?auto_649144 ) ) ( not ( = ?auto_649139 ?auto_649145 ) ) ( not ( = ?auto_649140 ?auto_649141 ) ) ( not ( = ?auto_649140 ?auto_649142 ) ) ( not ( = ?auto_649140 ?auto_649143 ) ) ( not ( = ?auto_649140 ?auto_649144 ) ) ( not ( = ?auto_649140 ?auto_649145 ) ) ( not ( = ?auto_649141 ?auto_649142 ) ) ( not ( = ?auto_649141 ?auto_649143 ) ) ( not ( = ?auto_649141 ?auto_649144 ) ) ( not ( = ?auto_649141 ?auto_649145 ) ) ( not ( = ?auto_649142 ?auto_649143 ) ) ( not ( = ?auto_649142 ?auto_649144 ) ) ( not ( = ?auto_649142 ?auto_649145 ) ) ( not ( = ?auto_649143 ?auto_649144 ) ) ( not ( = ?auto_649143 ?auto_649145 ) ) ( not ( = ?auto_649144 ?auto_649145 ) ) ( ON ?auto_649143 ?auto_649144 ) ( ON ?auto_649142 ?auto_649143 ) ( CLEAR ?auto_649140 ) ( ON ?auto_649141 ?auto_649142 ) ( CLEAR ?auto_649141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_649128 ?auto_649129 ?auto_649130 ?auto_649131 ?auto_649132 ?auto_649133 ?auto_649134 ?auto_649135 ?auto_649136 ?auto_649137 ?auto_649138 ?auto_649139 ?auto_649140 ?auto_649141 )
      ( MAKE-17PILE ?auto_649128 ?auto_649129 ?auto_649130 ?auto_649131 ?auto_649132 ?auto_649133 ?auto_649134 ?auto_649135 ?auto_649136 ?auto_649137 ?auto_649138 ?auto_649139 ?auto_649140 ?auto_649141 ?auto_649142 ?auto_649143 ?auto_649144 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649163 - BLOCK
      ?auto_649164 - BLOCK
      ?auto_649165 - BLOCK
      ?auto_649166 - BLOCK
      ?auto_649167 - BLOCK
      ?auto_649168 - BLOCK
      ?auto_649169 - BLOCK
      ?auto_649170 - BLOCK
      ?auto_649171 - BLOCK
      ?auto_649172 - BLOCK
      ?auto_649173 - BLOCK
      ?auto_649174 - BLOCK
      ?auto_649175 - BLOCK
      ?auto_649176 - BLOCK
      ?auto_649177 - BLOCK
      ?auto_649178 - BLOCK
      ?auto_649179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649179 ) ( ON-TABLE ?auto_649163 ) ( ON ?auto_649164 ?auto_649163 ) ( ON ?auto_649165 ?auto_649164 ) ( ON ?auto_649166 ?auto_649165 ) ( ON ?auto_649167 ?auto_649166 ) ( ON ?auto_649168 ?auto_649167 ) ( ON ?auto_649169 ?auto_649168 ) ( ON ?auto_649170 ?auto_649169 ) ( ON ?auto_649171 ?auto_649170 ) ( ON ?auto_649172 ?auto_649171 ) ( ON ?auto_649173 ?auto_649172 ) ( ON ?auto_649174 ?auto_649173 ) ( ON ?auto_649175 ?auto_649174 ) ( not ( = ?auto_649163 ?auto_649164 ) ) ( not ( = ?auto_649163 ?auto_649165 ) ) ( not ( = ?auto_649163 ?auto_649166 ) ) ( not ( = ?auto_649163 ?auto_649167 ) ) ( not ( = ?auto_649163 ?auto_649168 ) ) ( not ( = ?auto_649163 ?auto_649169 ) ) ( not ( = ?auto_649163 ?auto_649170 ) ) ( not ( = ?auto_649163 ?auto_649171 ) ) ( not ( = ?auto_649163 ?auto_649172 ) ) ( not ( = ?auto_649163 ?auto_649173 ) ) ( not ( = ?auto_649163 ?auto_649174 ) ) ( not ( = ?auto_649163 ?auto_649175 ) ) ( not ( = ?auto_649163 ?auto_649176 ) ) ( not ( = ?auto_649163 ?auto_649177 ) ) ( not ( = ?auto_649163 ?auto_649178 ) ) ( not ( = ?auto_649163 ?auto_649179 ) ) ( not ( = ?auto_649164 ?auto_649165 ) ) ( not ( = ?auto_649164 ?auto_649166 ) ) ( not ( = ?auto_649164 ?auto_649167 ) ) ( not ( = ?auto_649164 ?auto_649168 ) ) ( not ( = ?auto_649164 ?auto_649169 ) ) ( not ( = ?auto_649164 ?auto_649170 ) ) ( not ( = ?auto_649164 ?auto_649171 ) ) ( not ( = ?auto_649164 ?auto_649172 ) ) ( not ( = ?auto_649164 ?auto_649173 ) ) ( not ( = ?auto_649164 ?auto_649174 ) ) ( not ( = ?auto_649164 ?auto_649175 ) ) ( not ( = ?auto_649164 ?auto_649176 ) ) ( not ( = ?auto_649164 ?auto_649177 ) ) ( not ( = ?auto_649164 ?auto_649178 ) ) ( not ( = ?auto_649164 ?auto_649179 ) ) ( not ( = ?auto_649165 ?auto_649166 ) ) ( not ( = ?auto_649165 ?auto_649167 ) ) ( not ( = ?auto_649165 ?auto_649168 ) ) ( not ( = ?auto_649165 ?auto_649169 ) ) ( not ( = ?auto_649165 ?auto_649170 ) ) ( not ( = ?auto_649165 ?auto_649171 ) ) ( not ( = ?auto_649165 ?auto_649172 ) ) ( not ( = ?auto_649165 ?auto_649173 ) ) ( not ( = ?auto_649165 ?auto_649174 ) ) ( not ( = ?auto_649165 ?auto_649175 ) ) ( not ( = ?auto_649165 ?auto_649176 ) ) ( not ( = ?auto_649165 ?auto_649177 ) ) ( not ( = ?auto_649165 ?auto_649178 ) ) ( not ( = ?auto_649165 ?auto_649179 ) ) ( not ( = ?auto_649166 ?auto_649167 ) ) ( not ( = ?auto_649166 ?auto_649168 ) ) ( not ( = ?auto_649166 ?auto_649169 ) ) ( not ( = ?auto_649166 ?auto_649170 ) ) ( not ( = ?auto_649166 ?auto_649171 ) ) ( not ( = ?auto_649166 ?auto_649172 ) ) ( not ( = ?auto_649166 ?auto_649173 ) ) ( not ( = ?auto_649166 ?auto_649174 ) ) ( not ( = ?auto_649166 ?auto_649175 ) ) ( not ( = ?auto_649166 ?auto_649176 ) ) ( not ( = ?auto_649166 ?auto_649177 ) ) ( not ( = ?auto_649166 ?auto_649178 ) ) ( not ( = ?auto_649166 ?auto_649179 ) ) ( not ( = ?auto_649167 ?auto_649168 ) ) ( not ( = ?auto_649167 ?auto_649169 ) ) ( not ( = ?auto_649167 ?auto_649170 ) ) ( not ( = ?auto_649167 ?auto_649171 ) ) ( not ( = ?auto_649167 ?auto_649172 ) ) ( not ( = ?auto_649167 ?auto_649173 ) ) ( not ( = ?auto_649167 ?auto_649174 ) ) ( not ( = ?auto_649167 ?auto_649175 ) ) ( not ( = ?auto_649167 ?auto_649176 ) ) ( not ( = ?auto_649167 ?auto_649177 ) ) ( not ( = ?auto_649167 ?auto_649178 ) ) ( not ( = ?auto_649167 ?auto_649179 ) ) ( not ( = ?auto_649168 ?auto_649169 ) ) ( not ( = ?auto_649168 ?auto_649170 ) ) ( not ( = ?auto_649168 ?auto_649171 ) ) ( not ( = ?auto_649168 ?auto_649172 ) ) ( not ( = ?auto_649168 ?auto_649173 ) ) ( not ( = ?auto_649168 ?auto_649174 ) ) ( not ( = ?auto_649168 ?auto_649175 ) ) ( not ( = ?auto_649168 ?auto_649176 ) ) ( not ( = ?auto_649168 ?auto_649177 ) ) ( not ( = ?auto_649168 ?auto_649178 ) ) ( not ( = ?auto_649168 ?auto_649179 ) ) ( not ( = ?auto_649169 ?auto_649170 ) ) ( not ( = ?auto_649169 ?auto_649171 ) ) ( not ( = ?auto_649169 ?auto_649172 ) ) ( not ( = ?auto_649169 ?auto_649173 ) ) ( not ( = ?auto_649169 ?auto_649174 ) ) ( not ( = ?auto_649169 ?auto_649175 ) ) ( not ( = ?auto_649169 ?auto_649176 ) ) ( not ( = ?auto_649169 ?auto_649177 ) ) ( not ( = ?auto_649169 ?auto_649178 ) ) ( not ( = ?auto_649169 ?auto_649179 ) ) ( not ( = ?auto_649170 ?auto_649171 ) ) ( not ( = ?auto_649170 ?auto_649172 ) ) ( not ( = ?auto_649170 ?auto_649173 ) ) ( not ( = ?auto_649170 ?auto_649174 ) ) ( not ( = ?auto_649170 ?auto_649175 ) ) ( not ( = ?auto_649170 ?auto_649176 ) ) ( not ( = ?auto_649170 ?auto_649177 ) ) ( not ( = ?auto_649170 ?auto_649178 ) ) ( not ( = ?auto_649170 ?auto_649179 ) ) ( not ( = ?auto_649171 ?auto_649172 ) ) ( not ( = ?auto_649171 ?auto_649173 ) ) ( not ( = ?auto_649171 ?auto_649174 ) ) ( not ( = ?auto_649171 ?auto_649175 ) ) ( not ( = ?auto_649171 ?auto_649176 ) ) ( not ( = ?auto_649171 ?auto_649177 ) ) ( not ( = ?auto_649171 ?auto_649178 ) ) ( not ( = ?auto_649171 ?auto_649179 ) ) ( not ( = ?auto_649172 ?auto_649173 ) ) ( not ( = ?auto_649172 ?auto_649174 ) ) ( not ( = ?auto_649172 ?auto_649175 ) ) ( not ( = ?auto_649172 ?auto_649176 ) ) ( not ( = ?auto_649172 ?auto_649177 ) ) ( not ( = ?auto_649172 ?auto_649178 ) ) ( not ( = ?auto_649172 ?auto_649179 ) ) ( not ( = ?auto_649173 ?auto_649174 ) ) ( not ( = ?auto_649173 ?auto_649175 ) ) ( not ( = ?auto_649173 ?auto_649176 ) ) ( not ( = ?auto_649173 ?auto_649177 ) ) ( not ( = ?auto_649173 ?auto_649178 ) ) ( not ( = ?auto_649173 ?auto_649179 ) ) ( not ( = ?auto_649174 ?auto_649175 ) ) ( not ( = ?auto_649174 ?auto_649176 ) ) ( not ( = ?auto_649174 ?auto_649177 ) ) ( not ( = ?auto_649174 ?auto_649178 ) ) ( not ( = ?auto_649174 ?auto_649179 ) ) ( not ( = ?auto_649175 ?auto_649176 ) ) ( not ( = ?auto_649175 ?auto_649177 ) ) ( not ( = ?auto_649175 ?auto_649178 ) ) ( not ( = ?auto_649175 ?auto_649179 ) ) ( not ( = ?auto_649176 ?auto_649177 ) ) ( not ( = ?auto_649176 ?auto_649178 ) ) ( not ( = ?auto_649176 ?auto_649179 ) ) ( not ( = ?auto_649177 ?auto_649178 ) ) ( not ( = ?auto_649177 ?auto_649179 ) ) ( not ( = ?auto_649178 ?auto_649179 ) ) ( ON ?auto_649178 ?auto_649179 ) ( ON ?auto_649177 ?auto_649178 ) ( CLEAR ?auto_649175 ) ( ON ?auto_649176 ?auto_649177 ) ( CLEAR ?auto_649176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_649163 ?auto_649164 ?auto_649165 ?auto_649166 ?auto_649167 ?auto_649168 ?auto_649169 ?auto_649170 ?auto_649171 ?auto_649172 ?auto_649173 ?auto_649174 ?auto_649175 ?auto_649176 )
      ( MAKE-17PILE ?auto_649163 ?auto_649164 ?auto_649165 ?auto_649166 ?auto_649167 ?auto_649168 ?auto_649169 ?auto_649170 ?auto_649171 ?auto_649172 ?auto_649173 ?auto_649174 ?auto_649175 ?auto_649176 ?auto_649177 ?auto_649178 ?auto_649179 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649197 - BLOCK
      ?auto_649198 - BLOCK
      ?auto_649199 - BLOCK
      ?auto_649200 - BLOCK
      ?auto_649201 - BLOCK
      ?auto_649202 - BLOCK
      ?auto_649203 - BLOCK
      ?auto_649204 - BLOCK
      ?auto_649205 - BLOCK
      ?auto_649206 - BLOCK
      ?auto_649207 - BLOCK
      ?auto_649208 - BLOCK
      ?auto_649209 - BLOCK
      ?auto_649210 - BLOCK
      ?auto_649211 - BLOCK
      ?auto_649212 - BLOCK
      ?auto_649213 - BLOCK
    )
    :vars
    (
      ?auto_649214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649213 ?auto_649214 ) ( ON-TABLE ?auto_649197 ) ( ON ?auto_649198 ?auto_649197 ) ( ON ?auto_649199 ?auto_649198 ) ( ON ?auto_649200 ?auto_649199 ) ( ON ?auto_649201 ?auto_649200 ) ( ON ?auto_649202 ?auto_649201 ) ( ON ?auto_649203 ?auto_649202 ) ( ON ?auto_649204 ?auto_649203 ) ( ON ?auto_649205 ?auto_649204 ) ( ON ?auto_649206 ?auto_649205 ) ( ON ?auto_649207 ?auto_649206 ) ( ON ?auto_649208 ?auto_649207 ) ( not ( = ?auto_649197 ?auto_649198 ) ) ( not ( = ?auto_649197 ?auto_649199 ) ) ( not ( = ?auto_649197 ?auto_649200 ) ) ( not ( = ?auto_649197 ?auto_649201 ) ) ( not ( = ?auto_649197 ?auto_649202 ) ) ( not ( = ?auto_649197 ?auto_649203 ) ) ( not ( = ?auto_649197 ?auto_649204 ) ) ( not ( = ?auto_649197 ?auto_649205 ) ) ( not ( = ?auto_649197 ?auto_649206 ) ) ( not ( = ?auto_649197 ?auto_649207 ) ) ( not ( = ?auto_649197 ?auto_649208 ) ) ( not ( = ?auto_649197 ?auto_649209 ) ) ( not ( = ?auto_649197 ?auto_649210 ) ) ( not ( = ?auto_649197 ?auto_649211 ) ) ( not ( = ?auto_649197 ?auto_649212 ) ) ( not ( = ?auto_649197 ?auto_649213 ) ) ( not ( = ?auto_649197 ?auto_649214 ) ) ( not ( = ?auto_649198 ?auto_649199 ) ) ( not ( = ?auto_649198 ?auto_649200 ) ) ( not ( = ?auto_649198 ?auto_649201 ) ) ( not ( = ?auto_649198 ?auto_649202 ) ) ( not ( = ?auto_649198 ?auto_649203 ) ) ( not ( = ?auto_649198 ?auto_649204 ) ) ( not ( = ?auto_649198 ?auto_649205 ) ) ( not ( = ?auto_649198 ?auto_649206 ) ) ( not ( = ?auto_649198 ?auto_649207 ) ) ( not ( = ?auto_649198 ?auto_649208 ) ) ( not ( = ?auto_649198 ?auto_649209 ) ) ( not ( = ?auto_649198 ?auto_649210 ) ) ( not ( = ?auto_649198 ?auto_649211 ) ) ( not ( = ?auto_649198 ?auto_649212 ) ) ( not ( = ?auto_649198 ?auto_649213 ) ) ( not ( = ?auto_649198 ?auto_649214 ) ) ( not ( = ?auto_649199 ?auto_649200 ) ) ( not ( = ?auto_649199 ?auto_649201 ) ) ( not ( = ?auto_649199 ?auto_649202 ) ) ( not ( = ?auto_649199 ?auto_649203 ) ) ( not ( = ?auto_649199 ?auto_649204 ) ) ( not ( = ?auto_649199 ?auto_649205 ) ) ( not ( = ?auto_649199 ?auto_649206 ) ) ( not ( = ?auto_649199 ?auto_649207 ) ) ( not ( = ?auto_649199 ?auto_649208 ) ) ( not ( = ?auto_649199 ?auto_649209 ) ) ( not ( = ?auto_649199 ?auto_649210 ) ) ( not ( = ?auto_649199 ?auto_649211 ) ) ( not ( = ?auto_649199 ?auto_649212 ) ) ( not ( = ?auto_649199 ?auto_649213 ) ) ( not ( = ?auto_649199 ?auto_649214 ) ) ( not ( = ?auto_649200 ?auto_649201 ) ) ( not ( = ?auto_649200 ?auto_649202 ) ) ( not ( = ?auto_649200 ?auto_649203 ) ) ( not ( = ?auto_649200 ?auto_649204 ) ) ( not ( = ?auto_649200 ?auto_649205 ) ) ( not ( = ?auto_649200 ?auto_649206 ) ) ( not ( = ?auto_649200 ?auto_649207 ) ) ( not ( = ?auto_649200 ?auto_649208 ) ) ( not ( = ?auto_649200 ?auto_649209 ) ) ( not ( = ?auto_649200 ?auto_649210 ) ) ( not ( = ?auto_649200 ?auto_649211 ) ) ( not ( = ?auto_649200 ?auto_649212 ) ) ( not ( = ?auto_649200 ?auto_649213 ) ) ( not ( = ?auto_649200 ?auto_649214 ) ) ( not ( = ?auto_649201 ?auto_649202 ) ) ( not ( = ?auto_649201 ?auto_649203 ) ) ( not ( = ?auto_649201 ?auto_649204 ) ) ( not ( = ?auto_649201 ?auto_649205 ) ) ( not ( = ?auto_649201 ?auto_649206 ) ) ( not ( = ?auto_649201 ?auto_649207 ) ) ( not ( = ?auto_649201 ?auto_649208 ) ) ( not ( = ?auto_649201 ?auto_649209 ) ) ( not ( = ?auto_649201 ?auto_649210 ) ) ( not ( = ?auto_649201 ?auto_649211 ) ) ( not ( = ?auto_649201 ?auto_649212 ) ) ( not ( = ?auto_649201 ?auto_649213 ) ) ( not ( = ?auto_649201 ?auto_649214 ) ) ( not ( = ?auto_649202 ?auto_649203 ) ) ( not ( = ?auto_649202 ?auto_649204 ) ) ( not ( = ?auto_649202 ?auto_649205 ) ) ( not ( = ?auto_649202 ?auto_649206 ) ) ( not ( = ?auto_649202 ?auto_649207 ) ) ( not ( = ?auto_649202 ?auto_649208 ) ) ( not ( = ?auto_649202 ?auto_649209 ) ) ( not ( = ?auto_649202 ?auto_649210 ) ) ( not ( = ?auto_649202 ?auto_649211 ) ) ( not ( = ?auto_649202 ?auto_649212 ) ) ( not ( = ?auto_649202 ?auto_649213 ) ) ( not ( = ?auto_649202 ?auto_649214 ) ) ( not ( = ?auto_649203 ?auto_649204 ) ) ( not ( = ?auto_649203 ?auto_649205 ) ) ( not ( = ?auto_649203 ?auto_649206 ) ) ( not ( = ?auto_649203 ?auto_649207 ) ) ( not ( = ?auto_649203 ?auto_649208 ) ) ( not ( = ?auto_649203 ?auto_649209 ) ) ( not ( = ?auto_649203 ?auto_649210 ) ) ( not ( = ?auto_649203 ?auto_649211 ) ) ( not ( = ?auto_649203 ?auto_649212 ) ) ( not ( = ?auto_649203 ?auto_649213 ) ) ( not ( = ?auto_649203 ?auto_649214 ) ) ( not ( = ?auto_649204 ?auto_649205 ) ) ( not ( = ?auto_649204 ?auto_649206 ) ) ( not ( = ?auto_649204 ?auto_649207 ) ) ( not ( = ?auto_649204 ?auto_649208 ) ) ( not ( = ?auto_649204 ?auto_649209 ) ) ( not ( = ?auto_649204 ?auto_649210 ) ) ( not ( = ?auto_649204 ?auto_649211 ) ) ( not ( = ?auto_649204 ?auto_649212 ) ) ( not ( = ?auto_649204 ?auto_649213 ) ) ( not ( = ?auto_649204 ?auto_649214 ) ) ( not ( = ?auto_649205 ?auto_649206 ) ) ( not ( = ?auto_649205 ?auto_649207 ) ) ( not ( = ?auto_649205 ?auto_649208 ) ) ( not ( = ?auto_649205 ?auto_649209 ) ) ( not ( = ?auto_649205 ?auto_649210 ) ) ( not ( = ?auto_649205 ?auto_649211 ) ) ( not ( = ?auto_649205 ?auto_649212 ) ) ( not ( = ?auto_649205 ?auto_649213 ) ) ( not ( = ?auto_649205 ?auto_649214 ) ) ( not ( = ?auto_649206 ?auto_649207 ) ) ( not ( = ?auto_649206 ?auto_649208 ) ) ( not ( = ?auto_649206 ?auto_649209 ) ) ( not ( = ?auto_649206 ?auto_649210 ) ) ( not ( = ?auto_649206 ?auto_649211 ) ) ( not ( = ?auto_649206 ?auto_649212 ) ) ( not ( = ?auto_649206 ?auto_649213 ) ) ( not ( = ?auto_649206 ?auto_649214 ) ) ( not ( = ?auto_649207 ?auto_649208 ) ) ( not ( = ?auto_649207 ?auto_649209 ) ) ( not ( = ?auto_649207 ?auto_649210 ) ) ( not ( = ?auto_649207 ?auto_649211 ) ) ( not ( = ?auto_649207 ?auto_649212 ) ) ( not ( = ?auto_649207 ?auto_649213 ) ) ( not ( = ?auto_649207 ?auto_649214 ) ) ( not ( = ?auto_649208 ?auto_649209 ) ) ( not ( = ?auto_649208 ?auto_649210 ) ) ( not ( = ?auto_649208 ?auto_649211 ) ) ( not ( = ?auto_649208 ?auto_649212 ) ) ( not ( = ?auto_649208 ?auto_649213 ) ) ( not ( = ?auto_649208 ?auto_649214 ) ) ( not ( = ?auto_649209 ?auto_649210 ) ) ( not ( = ?auto_649209 ?auto_649211 ) ) ( not ( = ?auto_649209 ?auto_649212 ) ) ( not ( = ?auto_649209 ?auto_649213 ) ) ( not ( = ?auto_649209 ?auto_649214 ) ) ( not ( = ?auto_649210 ?auto_649211 ) ) ( not ( = ?auto_649210 ?auto_649212 ) ) ( not ( = ?auto_649210 ?auto_649213 ) ) ( not ( = ?auto_649210 ?auto_649214 ) ) ( not ( = ?auto_649211 ?auto_649212 ) ) ( not ( = ?auto_649211 ?auto_649213 ) ) ( not ( = ?auto_649211 ?auto_649214 ) ) ( not ( = ?auto_649212 ?auto_649213 ) ) ( not ( = ?auto_649212 ?auto_649214 ) ) ( not ( = ?auto_649213 ?auto_649214 ) ) ( ON ?auto_649212 ?auto_649213 ) ( ON ?auto_649211 ?auto_649212 ) ( ON ?auto_649210 ?auto_649211 ) ( CLEAR ?auto_649208 ) ( ON ?auto_649209 ?auto_649210 ) ( CLEAR ?auto_649209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_649197 ?auto_649198 ?auto_649199 ?auto_649200 ?auto_649201 ?auto_649202 ?auto_649203 ?auto_649204 ?auto_649205 ?auto_649206 ?auto_649207 ?auto_649208 ?auto_649209 )
      ( MAKE-17PILE ?auto_649197 ?auto_649198 ?auto_649199 ?auto_649200 ?auto_649201 ?auto_649202 ?auto_649203 ?auto_649204 ?auto_649205 ?auto_649206 ?auto_649207 ?auto_649208 ?auto_649209 ?auto_649210 ?auto_649211 ?auto_649212 ?auto_649213 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649232 - BLOCK
      ?auto_649233 - BLOCK
      ?auto_649234 - BLOCK
      ?auto_649235 - BLOCK
      ?auto_649236 - BLOCK
      ?auto_649237 - BLOCK
      ?auto_649238 - BLOCK
      ?auto_649239 - BLOCK
      ?auto_649240 - BLOCK
      ?auto_649241 - BLOCK
      ?auto_649242 - BLOCK
      ?auto_649243 - BLOCK
      ?auto_649244 - BLOCK
      ?auto_649245 - BLOCK
      ?auto_649246 - BLOCK
      ?auto_649247 - BLOCK
      ?auto_649248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649248 ) ( ON-TABLE ?auto_649232 ) ( ON ?auto_649233 ?auto_649232 ) ( ON ?auto_649234 ?auto_649233 ) ( ON ?auto_649235 ?auto_649234 ) ( ON ?auto_649236 ?auto_649235 ) ( ON ?auto_649237 ?auto_649236 ) ( ON ?auto_649238 ?auto_649237 ) ( ON ?auto_649239 ?auto_649238 ) ( ON ?auto_649240 ?auto_649239 ) ( ON ?auto_649241 ?auto_649240 ) ( ON ?auto_649242 ?auto_649241 ) ( ON ?auto_649243 ?auto_649242 ) ( not ( = ?auto_649232 ?auto_649233 ) ) ( not ( = ?auto_649232 ?auto_649234 ) ) ( not ( = ?auto_649232 ?auto_649235 ) ) ( not ( = ?auto_649232 ?auto_649236 ) ) ( not ( = ?auto_649232 ?auto_649237 ) ) ( not ( = ?auto_649232 ?auto_649238 ) ) ( not ( = ?auto_649232 ?auto_649239 ) ) ( not ( = ?auto_649232 ?auto_649240 ) ) ( not ( = ?auto_649232 ?auto_649241 ) ) ( not ( = ?auto_649232 ?auto_649242 ) ) ( not ( = ?auto_649232 ?auto_649243 ) ) ( not ( = ?auto_649232 ?auto_649244 ) ) ( not ( = ?auto_649232 ?auto_649245 ) ) ( not ( = ?auto_649232 ?auto_649246 ) ) ( not ( = ?auto_649232 ?auto_649247 ) ) ( not ( = ?auto_649232 ?auto_649248 ) ) ( not ( = ?auto_649233 ?auto_649234 ) ) ( not ( = ?auto_649233 ?auto_649235 ) ) ( not ( = ?auto_649233 ?auto_649236 ) ) ( not ( = ?auto_649233 ?auto_649237 ) ) ( not ( = ?auto_649233 ?auto_649238 ) ) ( not ( = ?auto_649233 ?auto_649239 ) ) ( not ( = ?auto_649233 ?auto_649240 ) ) ( not ( = ?auto_649233 ?auto_649241 ) ) ( not ( = ?auto_649233 ?auto_649242 ) ) ( not ( = ?auto_649233 ?auto_649243 ) ) ( not ( = ?auto_649233 ?auto_649244 ) ) ( not ( = ?auto_649233 ?auto_649245 ) ) ( not ( = ?auto_649233 ?auto_649246 ) ) ( not ( = ?auto_649233 ?auto_649247 ) ) ( not ( = ?auto_649233 ?auto_649248 ) ) ( not ( = ?auto_649234 ?auto_649235 ) ) ( not ( = ?auto_649234 ?auto_649236 ) ) ( not ( = ?auto_649234 ?auto_649237 ) ) ( not ( = ?auto_649234 ?auto_649238 ) ) ( not ( = ?auto_649234 ?auto_649239 ) ) ( not ( = ?auto_649234 ?auto_649240 ) ) ( not ( = ?auto_649234 ?auto_649241 ) ) ( not ( = ?auto_649234 ?auto_649242 ) ) ( not ( = ?auto_649234 ?auto_649243 ) ) ( not ( = ?auto_649234 ?auto_649244 ) ) ( not ( = ?auto_649234 ?auto_649245 ) ) ( not ( = ?auto_649234 ?auto_649246 ) ) ( not ( = ?auto_649234 ?auto_649247 ) ) ( not ( = ?auto_649234 ?auto_649248 ) ) ( not ( = ?auto_649235 ?auto_649236 ) ) ( not ( = ?auto_649235 ?auto_649237 ) ) ( not ( = ?auto_649235 ?auto_649238 ) ) ( not ( = ?auto_649235 ?auto_649239 ) ) ( not ( = ?auto_649235 ?auto_649240 ) ) ( not ( = ?auto_649235 ?auto_649241 ) ) ( not ( = ?auto_649235 ?auto_649242 ) ) ( not ( = ?auto_649235 ?auto_649243 ) ) ( not ( = ?auto_649235 ?auto_649244 ) ) ( not ( = ?auto_649235 ?auto_649245 ) ) ( not ( = ?auto_649235 ?auto_649246 ) ) ( not ( = ?auto_649235 ?auto_649247 ) ) ( not ( = ?auto_649235 ?auto_649248 ) ) ( not ( = ?auto_649236 ?auto_649237 ) ) ( not ( = ?auto_649236 ?auto_649238 ) ) ( not ( = ?auto_649236 ?auto_649239 ) ) ( not ( = ?auto_649236 ?auto_649240 ) ) ( not ( = ?auto_649236 ?auto_649241 ) ) ( not ( = ?auto_649236 ?auto_649242 ) ) ( not ( = ?auto_649236 ?auto_649243 ) ) ( not ( = ?auto_649236 ?auto_649244 ) ) ( not ( = ?auto_649236 ?auto_649245 ) ) ( not ( = ?auto_649236 ?auto_649246 ) ) ( not ( = ?auto_649236 ?auto_649247 ) ) ( not ( = ?auto_649236 ?auto_649248 ) ) ( not ( = ?auto_649237 ?auto_649238 ) ) ( not ( = ?auto_649237 ?auto_649239 ) ) ( not ( = ?auto_649237 ?auto_649240 ) ) ( not ( = ?auto_649237 ?auto_649241 ) ) ( not ( = ?auto_649237 ?auto_649242 ) ) ( not ( = ?auto_649237 ?auto_649243 ) ) ( not ( = ?auto_649237 ?auto_649244 ) ) ( not ( = ?auto_649237 ?auto_649245 ) ) ( not ( = ?auto_649237 ?auto_649246 ) ) ( not ( = ?auto_649237 ?auto_649247 ) ) ( not ( = ?auto_649237 ?auto_649248 ) ) ( not ( = ?auto_649238 ?auto_649239 ) ) ( not ( = ?auto_649238 ?auto_649240 ) ) ( not ( = ?auto_649238 ?auto_649241 ) ) ( not ( = ?auto_649238 ?auto_649242 ) ) ( not ( = ?auto_649238 ?auto_649243 ) ) ( not ( = ?auto_649238 ?auto_649244 ) ) ( not ( = ?auto_649238 ?auto_649245 ) ) ( not ( = ?auto_649238 ?auto_649246 ) ) ( not ( = ?auto_649238 ?auto_649247 ) ) ( not ( = ?auto_649238 ?auto_649248 ) ) ( not ( = ?auto_649239 ?auto_649240 ) ) ( not ( = ?auto_649239 ?auto_649241 ) ) ( not ( = ?auto_649239 ?auto_649242 ) ) ( not ( = ?auto_649239 ?auto_649243 ) ) ( not ( = ?auto_649239 ?auto_649244 ) ) ( not ( = ?auto_649239 ?auto_649245 ) ) ( not ( = ?auto_649239 ?auto_649246 ) ) ( not ( = ?auto_649239 ?auto_649247 ) ) ( not ( = ?auto_649239 ?auto_649248 ) ) ( not ( = ?auto_649240 ?auto_649241 ) ) ( not ( = ?auto_649240 ?auto_649242 ) ) ( not ( = ?auto_649240 ?auto_649243 ) ) ( not ( = ?auto_649240 ?auto_649244 ) ) ( not ( = ?auto_649240 ?auto_649245 ) ) ( not ( = ?auto_649240 ?auto_649246 ) ) ( not ( = ?auto_649240 ?auto_649247 ) ) ( not ( = ?auto_649240 ?auto_649248 ) ) ( not ( = ?auto_649241 ?auto_649242 ) ) ( not ( = ?auto_649241 ?auto_649243 ) ) ( not ( = ?auto_649241 ?auto_649244 ) ) ( not ( = ?auto_649241 ?auto_649245 ) ) ( not ( = ?auto_649241 ?auto_649246 ) ) ( not ( = ?auto_649241 ?auto_649247 ) ) ( not ( = ?auto_649241 ?auto_649248 ) ) ( not ( = ?auto_649242 ?auto_649243 ) ) ( not ( = ?auto_649242 ?auto_649244 ) ) ( not ( = ?auto_649242 ?auto_649245 ) ) ( not ( = ?auto_649242 ?auto_649246 ) ) ( not ( = ?auto_649242 ?auto_649247 ) ) ( not ( = ?auto_649242 ?auto_649248 ) ) ( not ( = ?auto_649243 ?auto_649244 ) ) ( not ( = ?auto_649243 ?auto_649245 ) ) ( not ( = ?auto_649243 ?auto_649246 ) ) ( not ( = ?auto_649243 ?auto_649247 ) ) ( not ( = ?auto_649243 ?auto_649248 ) ) ( not ( = ?auto_649244 ?auto_649245 ) ) ( not ( = ?auto_649244 ?auto_649246 ) ) ( not ( = ?auto_649244 ?auto_649247 ) ) ( not ( = ?auto_649244 ?auto_649248 ) ) ( not ( = ?auto_649245 ?auto_649246 ) ) ( not ( = ?auto_649245 ?auto_649247 ) ) ( not ( = ?auto_649245 ?auto_649248 ) ) ( not ( = ?auto_649246 ?auto_649247 ) ) ( not ( = ?auto_649246 ?auto_649248 ) ) ( not ( = ?auto_649247 ?auto_649248 ) ) ( ON ?auto_649247 ?auto_649248 ) ( ON ?auto_649246 ?auto_649247 ) ( ON ?auto_649245 ?auto_649246 ) ( CLEAR ?auto_649243 ) ( ON ?auto_649244 ?auto_649245 ) ( CLEAR ?auto_649244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_649232 ?auto_649233 ?auto_649234 ?auto_649235 ?auto_649236 ?auto_649237 ?auto_649238 ?auto_649239 ?auto_649240 ?auto_649241 ?auto_649242 ?auto_649243 ?auto_649244 )
      ( MAKE-17PILE ?auto_649232 ?auto_649233 ?auto_649234 ?auto_649235 ?auto_649236 ?auto_649237 ?auto_649238 ?auto_649239 ?auto_649240 ?auto_649241 ?auto_649242 ?auto_649243 ?auto_649244 ?auto_649245 ?auto_649246 ?auto_649247 ?auto_649248 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649266 - BLOCK
      ?auto_649267 - BLOCK
      ?auto_649268 - BLOCK
      ?auto_649269 - BLOCK
      ?auto_649270 - BLOCK
      ?auto_649271 - BLOCK
      ?auto_649272 - BLOCK
      ?auto_649273 - BLOCK
      ?auto_649274 - BLOCK
      ?auto_649275 - BLOCK
      ?auto_649276 - BLOCK
      ?auto_649277 - BLOCK
      ?auto_649278 - BLOCK
      ?auto_649279 - BLOCK
      ?auto_649280 - BLOCK
      ?auto_649281 - BLOCK
      ?auto_649282 - BLOCK
    )
    :vars
    (
      ?auto_649283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649282 ?auto_649283 ) ( ON-TABLE ?auto_649266 ) ( ON ?auto_649267 ?auto_649266 ) ( ON ?auto_649268 ?auto_649267 ) ( ON ?auto_649269 ?auto_649268 ) ( ON ?auto_649270 ?auto_649269 ) ( ON ?auto_649271 ?auto_649270 ) ( ON ?auto_649272 ?auto_649271 ) ( ON ?auto_649273 ?auto_649272 ) ( ON ?auto_649274 ?auto_649273 ) ( ON ?auto_649275 ?auto_649274 ) ( ON ?auto_649276 ?auto_649275 ) ( not ( = ?auto_649266 ?auto_649267 ) ) ( not ( = ?auto_649266 ?auto_649268 ) ) ( not ( = ?auto_649266 ?auto_649269 ) ) ( not ( = ?auto_649266 ?auto_649270 ) ) ( not ( = ?auto_649266 ?auto_649271 ) ) ( not ( = ?auto_649266 ?auto_649272 ) ) ( not ( = ?auto_649266 ?auto_649273 ) ) ( not ( = ?auto_649266 ?auto_649274 ) ) ( not ( = ?auto_649266 ?auto_649275 ) ) ( not ( = ?auto_649266 ?auto_649276 ) ) ( not ( = ?auto_649266 ?auto_649277 ) ) ( not ( = ?auto_649266 ?auto_649278 ) ) ( not ( = ?auto_649266 ?auto_649279 ) ) ( not ( = ?auto_649266 ?auto_649280 ) ) ( not ( = ?auto_649266 ?auto_649281 ) ) ( not ( = ?auto_649266 ?auto_649282 ) ) ( not ( = ?auto_649266 ?auto_649283 ) ) ( not ( = ?auto_649267 ?auto_649268 ) ) ( not ( = ?auto_649267 ?auto_649269 ) ) ( not ( = ?auto_649267 ?auto_649270 ) ) ( not ( = ?auto_649267 ?auto_649271 ) ) ( not ( = ?auto_649267 ?auto_649272 ) ) ( not ( = ?auto_649267 ?auto_649273 ) ) ( not ( = ?auto_649267 ?auto_649274 ) ) ( not ( = ?auto_649267 ?auto_649275 ) ) ( not ( = ?auto_649267 ?auto_649276 ) ) ( not ( = ?auto_649267 ?auto_649277 ) ) ( not ( = ?auto_649267 ?auto_649278 ) ) ( not ( = ?auto_649267 ?auto_649279 ) ) ( not ( = ?auto_649267 ?auto_649280 ) ) ( not ( = ?auto_649267 ?auto_649281 ) ) ( not ( = ?auto_649267 ?auto_649282 ) ) ( not ( = ?auto_649267 ?auto_649283 ) ) ( not ( = ?auto_649268 ?auto_649269 ) ) ( not ( = ?auto_649268 ?auto_649270 ) ) ( not ( = ?auto_649268 ?auto_649271 ) ) ( not ( = ?auto_649268 ?auto_649272 ) ) ( not ( = ?auto_649268 ?auto_649273 ) ) ( not ( = ?auto_649268 ?auto_649274 ) ) ( not ( = ?auto_649268 ?auto_649275 ) ) ( not ( = ?auto_649268 ?auto_649276 ) ) ( not ( = ?auto_649268 ?auto_649277 ) ) ( not ( = ?auto_649268 ?auto_649278 ) ) ( not ( = ?auto_649268 ?auto_649279 ) ) ( not ( = ?auto_649268 ?auto_649280 ) ) ( not ( = ?auto_649268 ?auto_649281 ) ) ( not ( = ?auto_649268 ?auto_649282 ) ) ( not ( = ?auto_649268 ?auto_649283 ) ) ( not ( = ?auto_649269 ?auto_649270 ) ) ( not ( = ?auto_649269 ?auto_649271 ) ) ( not ( = ?auto_649269 ?auto_649272 ) ) ( not ( = ?auto_649269 ?auto_649273 ) ) ( not ( = ?auto_649269 ?auto_649274 ) ) ( not ( = ?auto_649269 ?auto_649275 ) ) ( not ( = ?auto_649269 ?auto_649276 ) ) ( not ( = ?auto_649269 ?auto_649277 ) ) ( not ( = ?auto_649269 ?auto_649278 ) ) ( not ( = ?auto_649269 ?auto_649279 ) ) ( not ( = ?auto_649269 ?auto_649280 ) ) ( not ( = ?auto_649269 ?auto_649281 ) ) ( not ( = ?auto_649269 ?auto_649282 ) ) ( not ( = ?auto_649269 ?auto_649283 ) ) ( not ( = ?auto_649270 ?auto_649271 ) ) ( not ( = ?auto_649270 ?auto_649272 ) ) ( not ( = ?auto_649270 ?auto_649273 ) ) ( not ( = ?auto_649270 ?auto_649274 ) ) ( not ( = ?auto_649270 ?auto_649275 ) ) ( not ( = ?auto_649270 ?auto_649276 ) ) ( not ( = ?auto_649270 ?auto_649277 ) ) ( not ( = ?auto_649270 ?auto_649278 ) ) ( not ( = ?auto_649270 ?auto_649279 ) ) ( not ( = ?auto_649270 ?auto_649280 ) ) ( not ( = ?auto_649270 ?auto_649281 ) ) ( not ( = ?auto_649270 ?auto_649282 ) ) ( not ( = ?auto_649270 ?auto_649283 ) ) ( not ( = ?auto_649271 ?auto_649272 ) ) ( not ( = ?auto_649271 ?auto_649273 ) ) ( not ( = ?auto_649271 ?auto_649274 ) ) ( not ( = ?auto_649271 ?auto_649275 ) ) ( not ( = ?auto_649271 ?auto_649276 ) ) ( not ( = ?auto_649271 ?auto_649277 ) ) ( not ( = ?auto_649271 ?auto_649278 ) ) ( not ( = ?auto_649271 ?auto_649279 ) ) ( not ( = ?auto_649271 ?auto_649280 ) ) ( not ( = ?auto_649271 ?auto_649281 ) ) ( not ( = ?auto_649271 ?auto_649282 ) ) ( not ( = ?auto_649271 ?auto_649283 ) ) ( not ( = ?auto_649272 ?auto_649273 ) ) ( not ( = ?auto_649272 ?auto_649274 ) ) ( not ( = ?auto_649272 ?auto_649275 ) ) ( not ( = ?auto_649272 ?auto_649276 ) ) ( not ( = ?auto_649272 ?auto_649277 ) ) ( not ( = ?auto_649272 ?auto_649278 ) ) ( not ( = ?auto_649272 ?auto_649279 ) ) ( not ( = ?auto_649272 ?auto_649280 ) ) ( not ( = ?auto_649272 ?auto_649281 ) ) ( not ( = ?auto_649272 ?auto_649282 ) ) ( not ( = ?auto_649272 ?auto_649283 ) ) ( not ( = ?auto_649273 ?auto_649274 ) ) ( not ( = ?auto_649273 ?auto_649275 ) ) ( not ( = ?auto_649273 ?auto_649276 ) ) ( not ( = ?auto_649273 ?auto_649277 ) ) ( not ( = ?auto_649273 ?auto_649278 ) ) ( not ( = ?auto_649273 ?auto_649279 ) ) ( not ( = ?auto_649273 ?auto_649280 ) ) ( not ( = ?auto_649273 ?auto_649281 ) ) ( not ( = ?auto_649273 ?auto_649282 ) ) ( not ( = ?auto_649273 ?auto_649283 ) ) ( not ( = ?auto_649274 ?auto_649275 ) ) ( not ( = ?auto_649274 ?auto_649276 ) ) ( not ( = ?auto_649274 ?auto_649277 ) ) ( not ( = ?auto_649274 ?auto_649278 ) ) ( not ( = ?auto_649274 ?auto_649279 ) ) ( not ( = ?auto_649274 ?auto_649280 ) ) ( not ( = ?auto_649274 ?auto_649281 ) ) ( not ( = ?auto_649274 ?auto_649282 ) ) ( not ( = ?auto_649274 ?auto_649283 ) ) ( not ( = ?auto_649275 ?auto_649276 ) ) ( not ( = ?auto_649275 ?auto_649277 ) ) ( not ( = ?auto_649275 ?auto_649278 ) ) ( not ( = ?auto_649275 ?auto_649279 ) ) ( not ( = ?auto_649275 ?auto_649280 ) ) ( not ( = ?auto_649275 ?auto_649281 ) ) ( not ( = ?auto_649275 ?auto_649282 ) ) ( not ( = ?auto_649275 ?auto_649283 ) ) ( not ( = ?auto_649276 ?auto_649277 ) ) ( not ( = ?auto_649276 ?auto_649278 ) ) ( not ( = ?auto_649276 ?auto_649279 ) ) ( not ( = ?auto_649276 ?auto_649280 ) ) ( not ( = ?auto_649276 ?auto_649281 ) ) ( not ( = ?auto_649276 ?auto_649282 ) ) ( not ( = ?auto_649276 ?auto_649283 ) ) ( not ( = ?auto_649277 ?auto_649278 ) ) ( not ( = ?auto_649277 ?auto_649279 ) ) ( not ( = ?auto_649277 ?auto_649280 ) ) ( not ( = ?auto_649277 ?auto_649281 ) ) ( not ( = ?auto_649277 ?auto_649282 ) ) ( not ( = ?auto_649277 ?auto_649283 ) ) ( not ( = ?auto_649278 ?auto_649279 ) ) ( not ( = ?auto_649278 ?auto_649280 ) ) ( not ( = ?auto_649278 ?auto_649281 ) ) ( not ( = ?auto_649278 ?auto_649282 ) ) ( not ( = ?auto_649278 ?auto_649283 ) ) ( not ( = ?auto_649279 ?auto_649280 ) ) ( not ( = ?auto_649279 ?auto_649281 ) ) ( not ( = ?auto_649279 ?auto_649282 ) ) ( not ( = ?auto_649279 ?auto_649283 ) ) ( not ( = ?auto_649280 ?auto_649281 ) ) ( not ( = ?auto_649280 ?auto_649282 ) ) ( not ( = ?auto_649280 ?auto_649283 ) ) ( not ( = ?auto_649281 ?auto_649282 ) ) ( not ( = ?auto_649281 ?auto_649283 ) ) ( not ( = ?auto_649282 ?auto_649283 ) ) ( ON ?auto_649281 ?auto_649282 ) ( ON ?auto_649280 ?auto_649281 ) ( ON ?auto_649279 ?auto_649280 ) ( ON ?auto_649278 ?auto_649279 ) ( CLEAR ?auto_649276 ) ( ON ?auto_649277 ?auto_649278 ) ( CLEAR ?auto_649277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_649266 ?auto_649267 ?auto_649268 ?auto_649269 ?auto_649270 ?auto_649271 ?auto_649272 ?auto_649273 ?auto_649274 ?auto_649275 ?auto_649276 ?auto_649277 )
      ( MAKE-17PILE ?auto_649266 ?auto_649267 ?auto_649268 ?auto_649269 ?auto_649270 ?auto_649271 ?auto_649272 ?auto_649273 ?auto_649274 ?auto_649275 ?auto_649276 ?auto_649277 ?auto_649278 ?auto_649279 ?auto_649280 ?auto_649281 ?auto_649282 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649301 - BLOCK
      ?auto_649302 - BLOCK
      ?auto_649303 - BLOCK
      ?auto_649304 - BLOCK
      ?auto_649305 - BLOCK
      ?auto_649306 - BLOCK
      ?auto_649307 - BLOCK
      ?auto_649308 - BLOCK
      ?auto_649309 - BLOCK
      ?auto_649310 - BLOCK
      ?auto_649311 - BLOCK
      ?auto_649312 - BLOCK
      ?auto_649313 - BLOCK
      ?auto_649314 - BLOCK
      ?auto_649315 - BLOCK
      ?auto_649316 - BLOCK
      ?auto_649317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649317 ) ( ON-TABLE ?auto_649301 ) ( ON ?auto_649302 ?auto_649301 ) ( ON ?auto_649303 ?auto_649302 ) ( ON ?auto_649304 ?auto_649303 ) ( ON ?auto_649305 ?auto_649304 ) ( ON ?auto_649306 ?auto_649305 ) ( ON ?auto_649307 ?auto_649306 ) ( ON ?auto_649308 ?auto_649307 ) ( ON ?auto_649309 ?auto_649308 ) ( ON ?auto_649310 ?auto_649309 ) ( ON ?auto_649311 ?auto_649310 ) ( not ( = ?auto_649301 ?auto_649302 ) ) ( not ( = ?auto_649301 ?auto_649303 ) ) ( not ( = ?auto_649301 ?auto_649304 ) ) ( not ( = ?auto_649301 ?auto_649305 ) ) ( not ( = ?auto_649301 ?auto_649306 ) ) ( not ( = ?auto_649301 ?auto_649307 ) ) ( not ( = ?auto_649301 ?auto_649308 ) ) ( not ( = ?auto_649301 ?auto_649309 ) ) ( not ( = ?auto_649301 ?auto_649310 ) ) ( not ( = ?auto_649301 ?auto_649311 ) ) ( not ( = ?auto_649301 ?auto_649312 ) ) ( not ( = ?auto_649301 ?auto_649313 ) ) ( not ( = ?auto_649301 ?auto_649314 ) ) ( not ( = ?auto_649301 ?auto_649315 ) ) ( not ( = ?auto_649301 ?auto_649316 ) ) ( not ( = ?auto_649301 ?auto_649317 ) ) ( not ( = ?auto_649302 ?auto_649303 ) ) ( not ( = ?auto_649302 ?auto_649304 ) ) ( not ( = ?auto_649302 ?auto_649305 ) ) ( not ( = ?auto_649302 ?auto_649306 ) ) ( not ( = ?auto_649302 ?auto_649307 ) ) ( not ( = ?auto_649302 ?auto_649308 ) ) ( not ( = ?auto_649302 ?auto_649309 ) ) ( not ( = ?auto_649302 ?auto_649310 ) ) ( not ( = ?auto_649302 ?auto_649311 ) ) ( not ( = ?auto_649302 ?auto_649312 ) ) ( not ( = ?auto_649302 ?auto_649313 ) ) ( not ( = ?auto_649302 ?auto_649314 ) ) ( not ( = ?auto_649302 ?auto_649315 ) ) ( not ( = ?auto_649302 ?auto_649316 ) ) ( not ( = ?auto_649302 ?auto_649317 ) ) ( not ( = ?auto_649303 ?auto_649304 ) ) ( not ( = ?auto_649303 ?auto_649305 ) ) ( not ( = ?auto_649303 ?auto_649306 ) ) ( not ( = ?auto_649303 ?auto_649307 ) ) ( not ( = ?auto_649303 ?auto_649308 ) ) ( not ( = ?auto_649303 ?auto_649309 ) ) ( not ( = ?auto_649303 ?auto_649310 ) ) ( not ( = ?auto_649303 ?auto_649311 ) ) ( not ( = ?auto_649303 ?auto_649312 ) ) ( not ( = ?auto_649303 ?auto_649313 ) ) ( not ( = ?auto_649303 ?auto_649314 ) ) ( not ( = ?auto_649303 ?auto_649315 ) ) ( not ( = ?auto_649303 ?auto_649316 ) ) ( not ( = ?auto_649303 ?auto_649317 ) ) ( not ( = ?auto_649304 ?auto_649305 ) ) ( not ( = ?auto_649304 ?auto_649306 ) ) ( not ( = ?auto_649304 ?auto_649307 ) ) ( not ( = ?auto_649304 ?auto_649308 ) ) ( not ( = ?auto_649304 ?auto_649309 ) ) ( not ( = ?auto_649304 ?auto_649310 ) ) ( not ( = ?auto_649304 ?auto_649311 ) ) ( not ( = ?auto_649304 ?auto_649312 ) ) ( not ( = ?auto_649304 ?auto_649313 ) ) ( not ( = ?auto_649304 ?auto_649314 ) ) ( not ( = ?auto_649304 ?auto_649315 ) ) ( not ( = ?auto_649304 ?auto_649316 ) ) ( not ( = ?auto_649304 ?auto_649317 ) ) ( not ( = ?auto_649305 ?auto_649306 ) ) ( not ( = ?auto_649305 ?auto_649307 ) ) ( not ( = ?auto_649305 ?auto_649308 ) ) ( not ( = ?auto_649305 ?auto_649309 ) ) ( not ( = ?auto_649305 ?auto_649310 ) ) ( not ( = ?auto_649305 ?auto_649311 ) ) ( not ( = ?auto_649305 ?auto_649312 ) ) ( not ( = ?auto_649305 ?auto_649313 ) ) ( not ( = ?auto_649305 ?auto_649314 ) ) ( not ( = ?auto_649305 ?auto_649315 ) ) ( not ( = ?auto_649305 ?auto_649316 ) ) ( not ( = ?auto_649305 ?auto_649317 ) ) ( not ( = ?auto_649306 ?auto_649307 ) ) ( not ( = ?auto_649306 ?auto_649308 ) ) ( not ( = ?auto_649306 ?auto_649309 ) ) ( not ( = ?auto_649306 ?auto_649310 ) ) ( not ( = ?auto_649306 ?auto_649311 ) ) ( not ( = ?auto_649306 ?auto_649312 ) ) ( not ( = ?auto_649306 ?auto_649313 ) ) ( not ( = ?auto_649306 ?auto_649314 ) ) ( not ( = ?auto_649306 ?auto_649315 ) ) ( not ( = ?auto_649306 ?auto_649316 ) ) ( not ( = ?auto_649306 ?auto_649317 ) ) ( not ( = ?auto_649307 ?auto_649308 ) ) ( not ( = ?auto_649307 ?auto_649309 ) ) ( not ( = ?auto_649307 ?auto_649310 ) ) ( not ( = ?auto_649307 ?auto_649311 ) ) ( not ( = ?auto_649307 ?auto_649312 ) ) ( not ( = ?auto_649307 ?auto_649313 ) ) ( not ( = ?auto_649307 ?auto_649314 ) ) ( not ( = ?auto_649307 ?auto_649315 ) ) ( not ( = ?auto_649307 ?auto_649316 ) ) ( not ( = ?auto_649307 ?auto_649317 ) ) ( not ( = ?auto_649308 ?auto_649309 ) ) ( not ( = ?auto_649308 ?auto_649310 ) ) ( not ( = ?auto_649308 ?auto_649311 ) ) ( not ( = ?auto_649308 ?auto_649312 ) ) ( not ( = ?auto_649308 ?auto_649313 ) ) ( not ( = ?auto_649308 ?auto_649314 ) ) ( not ( = ?auto_649308 ?auto_649315 ) ) ( not ( = ?auto_649308 ?auto_649316 ) ) ( not ( = ?auto_649308 ?auto_649317 ) ) ( not ( = ?auto_649309 ?auto_649310 ) ) ( not ( = ?auto_649309 ?auto_649311 ) ) ( not ( = ?auto_649309 ?auto_649312 ) ) ( not ( = ?auto_649309 ?auto_649313 ) ) ( not ( = ?auto_649309 ?auto_649314 ) ) ( not ( = ?auto_649309 ?auto_649315 ) ) ( not ( = ?auto_649309 ?auto_649316 ) ) ( not ( = ?auto_649309 ?auto_649317 ) ) ( not ( = ?auto_649310 ?auto_649311 ) ) ( not ( = ?auto_649310 ?auto_649312 ) ) ( not ( = ?auto_649310 ?auto_649313 ) ) ( not ( = ?auto_649310 ?auto_649314 ) ) ( not ( = ?auto_649310 ?auto_649315 ) ) ( not ( = ?auto_649310 ?auto_649316 ) ) ( not ( = ?auto_649310 ?auto_649317 ) ) ( not ( = ?auto_649311 ?auto_649312 ) ) ( not ( = ?auto_649311 ?auto_649313 ) ) ( not ( = ?auto_649311 ?auto_649314 ) ) ( not ( = ?auto_649311 ?auto_649315 ) ) ( not ( = ?auto_649311 ?auto_649316 ) ) ( not ( = ?auto_649311 ?auto_649317 ) ) ( not ( = ?auto_649312 ?auto_649313 ) ) ( not ( = ?auto_649312 ?auto_649314 ) ) ( not ( = ?auto_649312 ?auto_649315 ) ) ( not ( = ?auto_649312 ?auto_649316 ) ) ( not ( = ?auto_649312 ?auto_649317 ) ) ( not ( = ?auto_649313 ?auto_649314 ) ) ( not ( = ?auto_649313 ?auto_649315 ) ) ( not ( = ?auto_649313 ?auto_649316 ) ) ( not ( = ?auto_649313 ?auto_649317 ) ) ( not ( = ?auto_649314 ?auto_649315 ) ) ( not ( = ?auto_649314 ?auto_649316 ) ) ( not ( = ?auto_649314 ?auto_649317 ) ) ( not ( = ?auto_649315 ?auto_649316 ) ) ( not ( = ?auto_649315 ?auto_649317 ) ) ( not ( = ?auto_649316 ?auto_649317 ) ) ( ON ?auto_649316 ?auto_649317 ) ( ON ?auto_649315 ?auto_649316 ) ( ON ?auto_649314 ?auto_649315 ) ( ON ?auto_649313 ?auto_649314 ) ( CLEAR ?auto_649311 ) ( ON ?auto_649312 ?auto_649313 ) ( CLEAR ?auto_649312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_649301 ?auto_649302 ?auto_649303 ?auto_649304 ?auto_649305 ?auto_649306 ?auto_649307 ?auto_649308 ?auto_649309 ?auto_649310 ?auto_649311 ?auto_649312 )
      ( MAKE-17PILE ?auto_649301 ?auto_649302 ?auto_649303 ?auto_649304 ?auto_649305 ?auto_649306 ?auto_649307 ?auto_649308 ?auto_649309 ?auto_649310 ?auto_649311 ?auto_649312 ?auto_649313 ?auto_649314 ?auto_649315 ?auto_649316 ?auto_649317 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649335 - BLOCK
      ?auto_649336 - BLOCK
      ?auto_649337 - BLOCK
      ?auto_649338 - BLOCK
      ?auto_649339 - BLOCK
      ?auto_649340 - BLOCK
      ?auto_649341 - BLOCK
      ?auto_649342 - BLOCK
      ?auto_649343 - BLOCK
      ?auto_649344 - BLOCK
      ?auto_649345 - BLOCK
      ?auto_649346 - BLOCK
      ?auto_649347 - BLOCK
      ?auto_649348 - BLOCK
      ?auto_649349 - BLOCK
      ?auto_649350 - BLOCK
      ?auto_649351 - BLOCK
    )
    :vars
    (
      ?auto_649352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649351 ?auto_649352 ) ( ON-TABLE ?auto_649335 ) ( ON ?auto_649336 ?auto_649335 ) ( ON ?auto_649337 ?auto_649336 ) ( ON ?auto_649338 ?auto_649337 ) ( ON ?auto_649339 ?auto_649338 ) ( ON ?auto_649340 ?auto_649339 ) ( ON ?auto_649341 ?auto_649340 ) ( ON ?auto_649342 ?auto_649341 ) ( ON ?auto_649343 ?auto_649342 ) ( ON ?auto_649344 ?auto_649343 ) ( not ( = ?auto_649335 ?auto_649336 ) ) ( not ( = ?auto_649335 ?auto_649337 ) ) ( not ( = ?auto_649335 ?auto_649338 ) ) ( not ( = ?auto_649335 ?auto_649339 ) ) ( not ( = ?auto_649335 ?auto_649340 ) ) ( not ( = ?auto_649335 ?auto_649341 ) ) ( not ( = ?auto_649335 ?auto_649342 ) ) ( not ( = ?auto_649335 ?auto_649343 ) ) ( not ( = ?auto_649335 ?auto_649344 ) ) ( not ( = ?auto_649335 ?auto_649345 ) ) ( not ( = ?auto_649335 ?auto_649346 ) ) ( not ( = ?auto_649335 ?auto_649347 ) ) ( not ( = ?auto_649335 ?auto_649348 ) ) ( not ( = ?auto_649335 ?auto_649349 ) ) ( not ( = ?auto_649335 ?auto_649350 ) ) ( not ( = ?auto_649335 ?auto_649351 ) ) ( not ( = ?auto_649335 ?auto_649352 ) ) ( not ( = ?auto_649336 ?auto_649337 ) ) ( not ( = ?auto_649336 ?auto_649338 ) ) ( not ( = ?auto_649336 ?auto_649339 ) ) ( not ( = ?auto_649336 ?auto_649340 ) ) ( not ( = ?auto_649336 ?auto_649341 ) ) ( not ( = ?auto_649336 ?auto_649342 ) ) ( not ( = ?auto_649336 ?auto_649343 ) ) ( not ( = ?auto_649336 ?auto_649344 ) ) ( not ( = ?auto_649336 ?auto_649345 ) ) ( not ( = ?auto_649336 ?auto_649346 ) ) ( not ( = ?auto_649336 ?auto_649347 ) ) ( not ( = ?auto_649336 ?auto_649348 ) ) ( not ( = ?auto_649336 ?auto_649349 ) ) ( not ( = ?auto_649336 ?auto_649350 ) ) ( not ( = ?auto_649336 ?auto_649351 ) ) ( not ( = ?auto_649336 ?auto_649352 ) ) ( not ( = ?auto_649337 ?auto_649338 ) ) ( not ( = ?auto_649337 ?auto_649339 ) ) ( not ( = ?auto_649337 ?auto_649340 ) ) ( not ( = ?auto_649337 ?auto_649341 ) ) ( not ( = ?auto_649337 ?auto_649342 ) ) ( not ( = ?auto_649337 ?auto_649343 ) ) ( not ( = ?auto_649337 ?auto_649344 ) ) ( not ( = ?auto_649337 ?auto_649345 ) ) ( not ( = ?auto_649337 ?auto_649346 ) ) ( not ( = ?auto_649337 ?auto_649347 ) ) ( not ( = ?auto_649337 ?auto_649348 ) ) ( not ( = ?auto_649337 ?auto_649349 ) ) ( not ( = ?auto_649337 ?auto_649350 ) ) ( not ( = ?auto_649337 ?auto_649351 ) ) ( not ( = ?auto_649337 ?auto_649352 ) ) ( not ( = ?auto_649338 ?auto_649339 ) ) ( not ( = ?auto_649338 ?auto_649340 ) ) ( not ( = ?auto_649338 ?auto_649341 ) ) ( not ( = ?auto_649338 ?auto_649342 ) ) ( not ( = ?auto_649338 ?auto_649343 ) ) ( not ( = ?auto_649338 ?auto_649344 ) ) ( not ( = ?auto_649338 ?auto_649345 ) ) ( not ( = ?auto_649338 ?auto_649346 ) ) ( not ( = ?auto_649338 ?auto_649347 ) ) ( not ( = ?auto_649338 ?auto_649348 ) ) ( not ( = ?auto_649338 ?auto_649349 ) ) ( not ( = ?auto_649338 ?auto_649350 ) ) ( not ( = ?auto_649338 ?auto_649351 ) ) ( not ( = ?auto_649338 ?auto_649352 ) ) ( not ( = ?auto_649339 ?auto_649340 ) ) ( not ( = ?auto_649339 ?auto_649341 ) ) ( not ( = ?auto_649339 ?auto_649342 ) ) ( not ( = ?auto_649339 ?auto_649343 ) ) ( not ( = ?auto_649339 ?auto_649344 ) ) ( not ( = ?auto_649339 ?auto_649345 ) ) ( not ( = ?auto_649339 ?auto_649346 ) ) ( not ( = ?auto_649339 ?auto_649347 ) ) ( not ( = ?auto_649339 ?auto_649348 ) ) ( not ( = ?auto_649339 ?auto_649349 ) ) ( not ( = ?auto_649339 ?auto_649350 ) ) ( not ( = ?auto_649339 ?auto_649351 ) ) ( not ( = ?auto_649339 ?auto_649352 ) ) ( not ( = ?auto_649340 ?auto_649341 ) ) ( not ( = ?auto_649340 ?auto_649342 ) ) ( not ( = ?auto_649340 ?auto_649343 ) ) ( not ( = ?auto_649340 ?auto_649344 ) ) ( not ( = ?auto_649340 ?auto_649345 ) ) ( not ( = ?auto_649340 ?auto_649346 ) ) ( not ( = ?auto_649340 ?auto_649347 ) ) ( not ( = ?auto_649340 ?auto_649348 ) ) ( not ( = ?auto_649340 ?auto_649349 ) ) ( not ( = ?auto_649340 ?auto_649350 ) ) ( not ( = ?auto_649340 ?auto_649351 ) ) ( not ( = ?auto_649340 ?auto_649352 ) ) ( not ( = ?auto_649341 ?auto_649342 ) ) ( not ( = ?auto_649341 ?auto_649343 ) ) ( not ( = ?auto_649341 ?auto_649344 ) ) ( not ( = ?auto_649341 ?auto_649345 ) ) ( not ( = ?auto_649341 ?auto_649346 ) ) ( not ( = ?auto_649341 ?auto_649347 ) ) ( not ( = ?auto_649341 ?auto_649348 ) ) ( not ( = ?auto_649341 ?auto_649349 ) ) ( not ( = ?auto_649341 ?auto_649350 ) ) ( not ( = ?auto_649341 ?auto_649351 ) ) ( not ( = ?auto_649341 ?auto_649352 ) ) ( not ( = ?auto_649342 ?auto_649343 ) ) ( not ( = ?auto_649342 ?auto_649344 ) ) ( not ( = ?auto_649342 ?auto_649345 ) ) ( not ( = ?auto_649342 ?auto_649346 ) ) ( not ( = ?auto_649342 ?auto_649347 ) ) ( not ( = ?auto_649342 ?auto_649348 ) ) ( not ( = ?auto_649342 ?auto_649349 ) ) ( not ( = ?auto_649342 ?auto_649350 ) ) ( not ( = ?auto_649342 ?auto_649351 ) ) ( not ( = ?auto_649342 ?auto_649352 ) ) ( not ( = ?auto_649343 ?auto_649344 ) ) ( not ( = ?auto_649343 ?auto_649345 ) ) ( not ( = ?auto_649343 ?auto_649346 ) ) ( not ( = ?auto_649343 ?auto_649347 ) ) ( not ( = ?auto_649343 ?auto_649348 ) ) ( not ( = ?auto_649343 ?auto_649349 ) ) ( not ( = ?auto_649343 ?auto_649350 ) ) ( not ( = ?auto_649343 ?auto_649351 ) ) ( not ( = ?auto_649343 ?auto_649352 ) ) ( not ( = ?auto_649344 ?auto_649345 ) ) ( not ( = ?auto_649344 ?auto_649346 ) ) ( not ( = ?auto_649344 ?auto_649347 ) ) ( not ( = ?auto_649344 ?auto_649348 ) ) ( not ( = ?auto_649344 ?auto_649349 ) ) ( not ( = ?auto_649344 ?auto_649350 ) ) ( not ( = ?auto_649344 ?auto_649351 ) ) ( not ( = ?auto_649344 ?auto_649352 ) ) ( not ( = ?auto_649345 ?auto_649346 ) ) ( not ( = ?auto_649345 ?auto_649347 ) ) ( not ( = ?auto_649345 ?auto_649348 ) ) ( not ( = ?auto_649345 ?auto_649349 ) ) ( not ( = ?auto_649345 ?auto_649350 ) ) ( not ( = ?auto_649345 ?auto_649351 ) ) ( not ( = ?auto_649345 ?auto_649352 ) ) ( not ( = ?auto_649346 ?auto_649347 ) ) ( not ( = ?auto_649346 ?auto_649348 ) ) ( not ( = ?auto_649346 ?auto_649349 ) ) ( not ( = ?auto_649346 ?auto_649350 ) ) ( not ( = ?auto_649346 ?auto_649351 ) ) ( not ( = ?auto_649346 ?auto_649352 ) ) ( not ( = ?auto_649347 ?auto_649348 ) ) ( not ( = ?auto_649347 ?auto_649349 ) ) ( not ( = ?auto_649347 ?auto_649350 ) ) ( not ( = ?auto_649347 ?auto_649351 ) ) ( not ( = ?auto_649347 ?auto_649352 ) ) ( not ( = ?auto_649348 ?auto_649349 ) ) ( not ( = ?auto_649348 ?auto_649350 ) ) ( not ( = ?auto_649348 ?auto_649351 ) ) ( not ( = ?auto_649348 ?auto_649352 ) ) ( not ( = ?auto_649349 ?auto_649350 ) ) ( not ( = ?auto_649349 ?auto_649351 ) ) ( not ( = ?auto_649349 ?auto_649352 ) ) ( not ( = ?auto_649350 ?auto_649351 ) ) ( not ( = ?auto_649350 ?auto_649352 ) ) ( not ( = ?auto_649351 ?auto_649352 ) ) ( ON ?auto_649350 ?auto_649351 ) ( ON ?auto_649349 ?auto_649350 ) ( ON ?auto_649348 ?auto_649349 ) ( ON ?auto_649347 ?auto_649348 ) ( ON ?auto_649346 ?auto_649347 ) ( CLEAR ?auto_649344 ) ( ON ?auto_649345 ?auto_649346 ) ( CLEAR ?auto_649345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_649335 ?auto_649336 ?auto_649337 ?auto_649338 ?auto_649339 ?auto_649340 ?auto_649341 ?auto_649342 ?auto_649343 ?auto_649344 ?auto_649345 )
      ( MAKE-17PILE ?auto_649335 ?auto_649336 ?auto_649337 ?auto_649338 ?auto_649339 ?auto_649340 ?auto_649341 ?auto_649342 ?auto_649343 ?auto_649344 ?auto_649345 ?auto_649346 ?auto_649347 ?auto_649348 ?auto_649349 ?auto_649350 ?auto_649351 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649370 - BLOCK
      ?auto_649371 - BLOCK
      ?auto_649372 - BLOCK
      ?auto_649373 - BLOCK
      ?auto_649374 - BLOCK
      ?auto_649375 - BLOCK
      ?auto_649376 - BLOCK
      ?auto_649377 - BLOCK
      ?auto_649378 - BLOCK
      ?auto_649379 - BLOCK
      ?auto_649380 - BLOCK
      ?auto_649381 - BLOCK
      ?auto_649382 - BLOCK
      ?auto_649383 - BLOCK
      ?auto_649384 - BLOCK
      ?auto_649385 - BLOCK
      ?auto_649386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649386 ) ( ON-TABLE ?auto_649370 ) ( ON ?auto_649371 ?auto_649370 ) ( ON ?auto_649372 ?auto_649371 ) ( ON ?auto_649373 ?auto_649372 ) ( ON ?auto_649374 ?auto_649373 ) ( ON ?auto_649375 ?auto_649374 ) ( ON ?auto_649376 ?auto_649375 ) ( ON ?auto_649377 ?auto_649376 ) ( ON ?auto_649378 ?auto_649377 ) ( ON ?auto_649379 ?auto_649378 ) ( not ( = ?auto_649370 ?auto_649371 ) ) ( not ( = ?auto_649370 ?auto_649372 ) ) ( not ( = ?auto_649370 ?auto_649373 ) ) ( not ( = ?auto_649370 ?auto_649374 ) ) ( not ( = ?auto_649370 ?auto_649375 ) ) ( not ( = ?auto_649370 ?auto_649376 ) ) ( not ( = ?auto_649370 ?auto_649377 ) ) ( not ( = ?auto_649370 ?auto_649378 ) ) ( not ( = ?auto_649370 ?auto_649379 ) ) ( not ( = ?auto_649370 ?auto_649380 ) ) ( not ( = ?auto_649370 ?auto_649381 ) ) ( not ( = ?auto_649370 ?auto_649382 ) ) ( not ( = ?auto_649370 ?auto_649383 ) ) ( not ( = ?auto_649370 ?auto_649384 ) ) ( not ( = ?auto_649370 ?auto_649385 ) ) ( not ( = ?auto_649370 ?auto_649386 ) ) ( not ( = ?auto_649371 ?auto_649372 ) ) ( not ( = ?auto_649371 ?auto_649373 ) ) ( not ( = ?auto_649371 ?auto_649374 ) ) ( not ( = ?auto_649371 ?auto_649375 ) ) ( not ( = ?auto_649371 ?auto_649376 ) ) ( not ( = ?auto_649371 ?auto_649377 ) ) ( not ( = ?auto_649371 ?auto_649378 ) ) ( not ( = ?auto_649371 ?auto_649379 ) ) ( not ( = ?auto_649371 ?auto_649380 ) ) ( not ( = ?auto_649371 ?auto_649381 ) ) ( not ( = ?auto_649371 ?auto_649382 ) ) ( not ( = ?auto_649371 ?auto_649383 ) ) ( not ( = ?auto_649371 ?auto_649384 ) ) ( not ( = ?auto_649371 ?auto_649385 ) ) ( not ( = ?auto_649371 ?auto_649386 ) ) ( not ( = ?auto_649372 ?auto_649373 ) ) ( not ( = ?auto_649372 ?auto_649374 ) ) ( not ( = ?auto_649372 ?auto_649375 ) ) ( not ( = ?auto_649372 ?auto_649376 ) ) ( not ( = ?auto_649372 ?auto_649377 ) ) ( not ( = ?auto_649372 ?auto_649378 ) ) ( not ( = ?auto_649372 ?auto_649379 ) ) ( not ( = ?auto_649372 ?auto_649380 ) ) ( not ( = ?auto_649372 ?auto_649381 ) ) ( not ( = ?auto_649372 ?auto_649382 ) ) ( not ( = ?auto_649372 ?auto_649383 ) ) ( not ( = ?auto_649372 ?auto_649384 ) ) ( not ( = ?auto_649372 ?auto_649385 ) ) ( not ( = ?auto_649372 ?auto_649386 ) ) ( not ( = ?auto_649373 ?auto_649374 ) ) ( not ( = ?auto_649373 ?auto_649375 ) ) ( not ( = ?auto_649373 ?auto_649376 ) ) ( not ( = ?auto_649373 ?auto_649377 ) ) ( not ( = ?auto_649373 ?auto_649378 ) ) ( not ( = ?auto_649373 ?auto_649379 ) ) ( not ( = ?auto_649373 ?auto_649380 ) ) ( not ( = ?auto_649373 ?auto_649381 ) ) ( not ( = ?auto_649373 ?auto_649382 ) ) ( not ( = ?auto_649373 ?auto_649383 ) ) ( not ( = ?auto_649373 ?auto_649384 ) ) ( not ( = ?auto_649373 ?auto_649385 ) ) ( not ( = ?auto_649373 ?auto_649386 ) ) ( not ( = ?auto_649374 ?auto_649375 ) ) ( not ( = ?auto_649374 ?auto_649376 ) ) ( not ( = ?auto_649374 ?auto_649377 ) ) ( not ( = ?auto_649374 ?auto_649378 ) ) ( not ( = ?auto_649374 ?auto_649379 ) ) ( not ( = ?auto_649374 ?auto_649380 ) ) ( not ( = ?auto_649374 ?auto_649381 ) ) ( not ( = ?auto_649374 ?auto_649382 ) ) ( not ( = ?auto_649374 ?auto_649383 ) ) ( not ( = ?auto_649374 ?auto_649384 ) ) ( not ( = ?auto_649374 ?auto_649385 ) ) ( not ( = ?auto_649374 ?auto_649386 ) ) ( not ( = ?auto_649375 ?auto_649376 ) ) ( not ( = ?auto_649375 ?auto_649377 ) ) ( not ( = ?auto_649375 ?auto_649378 ) ) ( not ( = ?auto_649375 ?auto_649379 ) ) ( not ( = ?auto_649375 ?auto_649380 ) ) ( not ( = ?auto_649375 ?auto_649381 ) ) ( not ( = ?auto_649375 ?auto_649382 ) ) ( not ( = ?auto_649375 ?auto_649383 ) ) ( not ( = ?auto_649375 ?auto_649384 ) ) ( not ( = ?auto_649375 ?auto_649385 ) ) ( not ( = ?auto_649375 ?auto_649386 ) ) ( not ( = ?auto_649376 ?auto_649377 ) ) ( not ( = ?auto_649376 ?auto_649378 ) ) ( not ( = ?auto_649376 ?auto_649379 ) ) ( not ( = ?auto_649376 ?auto_649380 ) ) ( not ( = ?auto_649376 ?auto_649381 ) ) ( not ( = ?auto_649376 ?auto_649382 ) ) ( not ( = ?auto_649376 ?auto_649383 ) ) ( not ( = ?auto_649376 ?auto_649384 ) ) ( not ( = ?auto_649376 ?auto_649385 ) ) ( not ( = ?auto_649376 ?auto_649386 ) ) ( not ( = ?auto_649377 ?auto_649378 ) ) ( not ( = ?auto_649377 ?auto_649379 ) ) ( not ( = ?auto_649377 ?auto_649380 ) ) ( not ( = ?auto_649377 ?auto_649381 ) ) ( not ( = ?auto_649377 ?auto_649382 ) ) ( not ( = ?auto_649377 ?auto_649383 ) ) ( not ( = ?auto_649377 ?auto_649384 ) ) ( not ( = ?auto_649377 ?auto_649385 ) ) ( not ( = ?auto_649377 ?auto_649386 ) ) ( not ( = ?auto_649378 ?auto_649379 ) ) ( not ( = ?auto_649378 ?auto_649380 ) ) ( not ( = ?auto_649378 ?auto_649381 ) ) ( not ( = ?auto_649378 ?auto_649382 ) ) ( not ( = ?auto_649378 ?auto_649383 ) ) ( not ( = ?auto_649378 ?auto_649384 ) ) ( not ( = ?auto_649378 ?auto_649385 ) ) ( not ( = ?auto_649378 ?auto_649386 ) ) ( not ( = ?auto_649379 ?auto_649380 ) ) ( not ( = ?auto_649379 ?auto_649381 ) ) ( not ( = ?auto_649379 ?auto_649382 ) ) ( not ( = ?auto_649379 ?auto_649383 ) ) ( not ( = ?auto_649379 ?auto_649384 ) ) ( not ( = ?auto_649379 ?auto_649385 ) ) ( not ( = ?auto_649379 ?auto_649386 ) ) ( not ( = ?auto_649380 ?auto_649381 ) ) ( not ( = ?auto_649380 ?auto_649382 ) ) ( not ( = ?auto_649380 ?auto_649383 ) ) ( not ( = ?auto_649380 ?auto_649384 ) ) ( not ( = ?auto_649380 ?auto_649385 ) ) ( not ( = ?auto_649380 ?auto_649386 ) ) ( not ( = ?auto_649381 ?auto_649382 ) ) ( not ( = ?auto_649381 ?auto_649383 ) ) ( not ( = ?auto_649381 ?auto_649384 ) ) ( not ( = ?auto_649381 ?auto_649385 ) ) ( not ( = ?auto_649381 ?auto_649386 ) ) ( not ( = ?auto_649382 ?auto_649383 ) ) ( not ( = ?auto_649382 ?auto_649384 ) ) ( not ( = ?auto_649382 ?auto_649385 ) ) ( not ( = ?auto_649382 ?auto_649386 ) ) ( not ( = ?auto_649383 ?auto_649384 ) ) ( not ( = ?auto_649383 ?auto_649385 ) ) ( not ( = ?auto_649383 ?auto_649386 ) ) ( not ( = ?auto_649384 ?auto_649385 ) ) ( not ( = ?auto_649384 ?auto_649386 ) ) ( not ( = ?auto_649385 ?auto_649386 ) ) ( ON ?auto_649385 ?auto_649386 ) ( ON ?auto_649384 ?auto_649385 ) ( ON ?auto_649383 ?auto_649384 ) ( ON ?auto_649382 ?auto_649383 ) ( ON ?auto_649381 ?auto_649382 ) ( CLEAR ?auto_649379 ) ( ON ?auto_649380 ?auto_649381 ) ( CLEAR ?auto_649380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_649370 ?auto_649371 ?auto_649372 ?auto_649373 ?auto_649374 ?auto_649375 ?auto_649376 ?auto_649377 ?auto_649378 ?auto_649379 ?auto_649380 )
      ( MAKE-17PILE ?auto_649370 ?auto_649371 ?auto_649372 ?auto_649373 ?auto_649374 ?auto_649375 ?auto_649376 ?auto_649377 ?auto_649378 ?auto_649379 ?auto_649380 ?auto_649381 ?auto_649382 ?auto_649383 ?auto_649384 ?auto_649385 ?auto_649386 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649404 - BLOCK
      ?auto_649405 - BLOCK
      ?auto_649406 - BLOCK
      ?auto_649407 - BLOCK
      ?auto_649408 - BLOCK
      ?auto_649409 - BLOCK
      ?auto_649410 - BLOCK
      ?auto_649411 - BLOCK
      ?auto_649412 - BLOCK
      ?auto_649413 - BLOCK
      ?auto_649414 - BLOCK
      ?auto_649415 - BLOCK
      ?auto_649416 - BLOCK
      ?auto_649417 - BLOCK
      ?auto_649418 - BLOCK
      ?auto_649419 - BLOCK
      ?auto_649420 - BLOCK
    )
    :vars
    (
      ?auto_649421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649420 ?auto_649421 ) ( ON-TABLE ?auto_649404 ) ( ON ?auto_649405 ?auto_649404 ) ( ON ?auto_649406 ?auto_649405 ) ( ON ?auto_649407 ?auto_649406 ) ( ON ?auto_649408 ?auto_649407 ) ( ON ?auto_649409 ?auto_649408 ) ( ON ?auto_649410 ?auto_649409 ) ( ON ?auto_649411 ?auto_649410 ) ( ON ?auto_649412 ?auto_649411 ) ( not ( = ?auto_649404 ?auto_649405 ) ) ( not ( = ?auto_649404 ?auto_649406 ) ) ( not ( = ?auto_649404 ?auto_649407 ) ) ( not ( = ?auto_649404 ?auto_649408 ) ) ( not ( = ?auto_649404 ?auto_649409 ) ) ( not ( = ?auto_649404 ?auto_649410 ) ) ( not ( = ?auto_649404 ?auto_649411 ) ) ( not ( = ?auto_649404 ?auto_649412 ) ) ( not ( = ?auto_649404 ?auto_649413 ) ) ( not ( = ?auto_649404 ?auto_649414 ) ) ( not ( = ?auto_649404 ?auto_649415 ) ) ( not ( = ?auto_649404 ?auto_649416 ) ) ( not ( = ?auto_649404 ?auto_649417 ) ) ( not ( = ?auto_649404 ?auto_649418 ) ) ( not ( = ?auto_649404 ?auto_649419 ) ) ( not ( = ?auto_649404 ?auto_649420 ) ) ( not ( = ?auto_649404 ?auto_649421 ) ) ( not ( = ?auto_649405 ?auto_649406 ) ) ( not ( = ?auto_649405 ?auto_649407 ) ) ( not ( = ?auto_649405 ?auto_649408 ) ) ( not ( = ?auto_649405 ?auto_649409 ) ) ( not ( = ?auto_649405 ?auto_649410 ) ) ( not ( = ?auto_649405 ?auto_649411 ) ) ( not ( = ?auto_649405 ?auto_649412 ) ) ( not ( = ?auto_649405 ?auto_649413 ) ) ( not ( = ?auto_649405 ?auto_649414 ) ) ( not ( = ?auto_649405 ?auto_649415 ) ) ( not ( = ?auto_649405 ?auto_649416 ) ) ( not ( = ?auto_649405 ?auto_649417 ) ) ( not ( = ?auto_649405 ?auto_649418 ) ) ( not ( = ?auto_649405 ?auto_649419 ) ) ( not ( = ?auto_649405 ?auto_649420 ) ) ( not ( = ?auto_649405 ?auto_649421 ) ) ( not ( = ?auto_649406 ?auto_649407 ) ) ( not ( = ?auto_649406 ?auto_649408 ) ) ( not ( = ?auto_649406 ?auto_649409 ) ) ( not ( = ?auto_649406 ?auto_649410 ) ) ( not ( = ?auto_649406 ?auto_649411 ) ) ( not ( = ?auto_649406 ?auto_649412 ) ) ( not ( = ?auto_649406 ?auto_649413 ) ) ( not ( = ?auto_649406 ?auto_649414 ) ) ( not ( = ?auto_649406 ?auto_649415 ) ) ( not ( = ?auto_649406 ?auto_649416 ) ) ( not ( = ?auto_649406 ?auto_649417 ) ) ( not ( = ?auto_649406 ?auto_649418 ) ) ( not ( = ?auto_649406 ?auto_649419 ) ) ( not ( = ?auto_649406 ?auto_649420 ) ) ( not ( = ?auto_649406 ?auto_649421 ) ) ( not ( = ?auto_649407 ?auto_649408 ) ) ( not ( = ?auto_649407 ?auto_649409 ) ) ( not ( = ?auto_649407 ?auto_649410 ) ) ( not ( = ?auto_649407 ?auto_649411 ) ) ( not ( = ?auto_649407 ?auto_649412 ) ) ( not ( = ?auto_649407 ?auto_649413 ) ) ( not ( = ?auto_649407 ?auto_649414 ) ) ( not ( = ?auto_649407 ?auto_649415 ) ) ( not ( = ?auto_649407 ?auto_649416 ) ) ( not ( = ?auto_649407 ?auto_649417 ) ) ( not ( = ?auto_649407 ?auto_649418 ) ) ( not ( = ?auto_649407 ?auto_649419 ) ) ( not ( = ?auto_649407 ?auto_649420 ) ) ( not ( = ?auto_649407 ?auto_649421 ) ) ( not ( = ?auto_649408 ?auto_649409 ) ) ( not ( = ?auto_649408 ?auto_649410 ) ) ( not ( = ?auto_649408 ?auto_649411 ) ) ( not ( = ?auto_649408 ?auto_649412 ) ) ( not ( = ?auto_649408 ?auto_649413 ) ) ( not ( = ?auto_649408 ?auto_649414 ) ) ( not ( = ?auto_649408 ?auto_649415 ) ) ( not ( = ?auto_649408 ?auto_649416 ) ) ( not ( = ?auto_649408 ?auto_649417 ) ) ( not ( = ?auto_649408 ?auto_649418 ) ) ( not ( = ?auto_649408 ?auto_649419 ) ) ( not ( = ?auto_649408 ?auto_649420 ) ) ( not ( = ?auto_649408 ?auto_649421 ) ) ( not ( = ?auto_649409 ?auto_649410 ) ) ( not ( = ?auto_649409 ?auto_649411 ) ) ( not ( = ?auto_649409 ?auto_649412 ) ) ( not ( = ?auto_649409 ?auto_649413 ) ) ( not ( = ?auto_649409 ?auto_649414 ) ) ( not ( = ?auto_649409 ?auto_649415 ) ) ( not ( = ?auto_649409 ?auto_649416 ) ) ( not ( = ?auto_649409 ?auto_649417 ) ) ( not ( = ?auto_649409 ?auto_649418 ) ) ( not ( = ?auto_649409 ?auto_649419 ) ) ( not ( = ?auto_649409 ?auto_649420 ) ) ( not ( = ?auto_649409 ?auto_649421 ) ) ( not ( = ?auto_649410 ?auto_649411 ) ) ( not ( = ?auto_649410 ?auto_649412 ) ) ( not ( = ?auto_649410 ?auto_649413 ) ) ( not ( = ?auto_649410 ?auto_649414 ) ) ( not ( = ?auto_649410 ?auto_649415 ) ) ( not ( = ?auto_649410 ?auto_649416 ) ) ( not ( = ?auto_649410 ?auto_649417 ) ) ( not ( = ?auto_649410 ?auto_649418 ) ) ( not ( = ?auto_649410 ?auto_649419 ) ) ( not ( = ?auto_649410 ?auto_649420 ) ) ( not ( = ?auto_649410 ?auto_649421 ) ) ( not ( = ?auto_649411 ?auto_649412 ) ) ( not ( = ?auto_649411 ?auto_649413 ) ) ( not ( = ?auto_649411 ?auto_649414 ) ) ( not ( = ?auto_649411 ?auto_649415 ) ) ( not ( = ?auto_649411 ?auto_649416 ) ) ( not ( = ?auto_649411 ?auto_649417 ) ) ( not ( = ?auto_649411 ?auto_649418 ) ) ( not ( = ?auto_649411 ?auto_649419 ) ) ( not ( = ?auto_649411 ?auto_649420 ) ) ( not ( = ?auto_649411 ?auto_649421 ) ) ( not ( = ?auto_649412 ?auto_649413 ) ) ( not ( = ?auto_649412 ?auto_649414 ) ) ( not ( = ?auto_649412 ?auto_649415 ) ) ( not ( = ?auto_649412 ?auto_649416 ) ) ( not ( = ?auto_649412 ?auto_649417 ) ) ( not ( = ?auto_649412 ?auto_649418 ) ) ( not ( = ?auto_649412 ?auto_649419 ) ) ( not ( = ?auto_649412 ?auto_649420 ) ) ( not ( = ?auto_649412 ?auto_649421 ) ) ( not ( = ?auto_649413 ?auto_649414 ) ) ( not ( = ?auto_649413 ?auto_649415 ) ) ( not ( = ?auto_649413 ?auto_649416 ) ) ( not ( = ?auto_649413 ?auto_649417 ) ) ( not ( = ?auto_649413 ?auto_649418 ) ) ( not ( = ?auto_649413 ?auto_649419 ) ) ( not ( = ?auto_649413 ?auto_649420 ) ) ( not ( = ?auto_649413 ?auto_649421 ) ) ( not ( = ?auto_649414 ?auto_649415 ) ) ( not ( = ?auto_649414 ?auto_649416 ) ) ( not ( = ?auto_649414 ?auto_649417 ) ) ( not ( = ?auto_649414 ?auto_649418 ) ) ( not ( = ?auto_649414 ?auto_649419 ) ) ( not ( = ?auto_649414 ?auto_649420 ) ) ( not ( = ?auto_649414 ?auto_649421 ) ) ( not ( = ?auto_649415 ?auto_649416 ) ) ( not ( = ?auto_649415 ?auto_649417 ) ) ( not ( = ?auto_649415 ?auto_649418 ) ) ( not ( = ?auto_649415 ?auto_649419 ) ) ( not ( = ?auto_649415 ?auto_649420 ) ) ( not ( = ?auto_649415 ?auto_649421 ) ) ( not ( = ?auto_649416 ?auto_649417 ) ) ( not ( = ?auto_649416 ?auto_649418 ) ) ( not ( = ?auto_649416 ?auto_649419 ) ) ( not ( = ?auto_649416 ?auto_649420 ) ) ( not ( = ?auto_649416 ?auto_649421 ) ) ( not ( = ?auto_649417 ?auto_649418 ) ) ( not ( = ?auto_649417 ?auto_649419 ) ) ( not ( = ?auto_649417 ?auto_649420 ) ) ( not ( = ?auto_649417 ?auto_649421 ) ) ( not ( = ?auto_649418 ?auto_649419 ) ) ( not ( = ?auto_649418 ?auto_649420 ) ) ( not ( = ?auto_649418 ?auto_649421 ) ) ( not ( = ?auto_649419 ?auto_649420 ) ) ( not ( = ?auto_649419 ?auto_649421 ) ) ( not ( = ?auto_649420 ?auto_649421 ) ) ( ON ?auto_649419 ?auto_649420 ) ( ON ?auto_649418 ?auto_649419 ) ( ON ?auto_649417 ?auto_649418 ) ( ON ?auto_649416 ?auto_649417 ) ( ON ?auto_649415 ?auto_649416 ) ( ON ?auto_649414 ?auto_649415 ) ( CLEAR ?auto_649412 ) ( ON ?auto_649413 ?auto_649414 ) ( CLEAR ?auto_649413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_649404 ?auto_649405 ?auto_649406 ?auto_649407 ?auto_649408 ?auto_649409 ?auto_649410 ?auto_649411 ?auto_649412 ?auto_649413 )
      ( MAKE-17PILE ?auto_649404 ?auto_649405 ?auto_649406 ?auto_649407 ?auto_649408 ?auto_649409 ?auto_649410 ?auto_649411 ?auto_649412 ?auto_649413 ?auto_649414 ?auto_649415 ?auto_649416 ?auto_649417 ?auto_649418 ?auto_649419 ?auto_649420 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649439 - BLOCK
      ?auto_649440 - BLOCK
      ?auto_649441 - BLOCK
      ?auto_649442 - BLOCK
      ?auto_649443 - BLOCK
      ?auto_649444 - BLOCK
      ?auto_649445 - BLOCK
      ?auto_649446 - BLOCK
      ?auto_649447 - BLOCK
      ?auto_649448 - BLOCK
      ?auto_649449 - BLOCK
      ?auto_649450 - BLOCK
      ?auto_649451 - BLOCK
      ?auto_649452 - BLOCK
      ?auto_649453 - BLOCK
      ?auto_649454 - BLOCK
      ?auto_649455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649455 ) ( ON-TABLE ?auto_649439 ) ( ON ?auto_649440 ?auto_649439 ) ( ON ?auto_649441 ?auto_649440 ) ( ON ?auto_649442 ?auto_649441 ) ( ON ?auto_649443 ?auto_649442 ) ( ON ?auto_649444 ?auto_649443 ) ( ON ?auto_649445 ?auto_649444 ) ( ON ?auto_649446 ?auto_649445 ) ( ON ?auto_649447 ?auto_649446 ) ( not ( = ?auto_649439 ?auto_649440 ) ) ( not ( = ?auto_649439 ?auto_649441 ) ) ( not ( = ?auto_649439 ?auto_649442 ) ) ( not ( = ?auto_649439 ?auto_649443 ) ) ( not ( = ?auto_649439 ?auto_649444 ) ) ( not ( = ?auto_649439 ?auto_649445 ) ) ( not ( = ?auto_649439 ?auto_649446 ) ) ( not ( = ?auto_649439 ?auto_649447 ) ) ( not ( = ?auto_649439 ?auto_649448 ) ) ( not ( = ?auto_649439 ?auto_649449 ) ) ( not ( = ?auto_649439 ?auto_649450 ) ) ( not ( = ?auto_649439 ?auto_649451 ) ) ( not ( = ?auto_649439 ?auto_649452 ) ) ( not ( = ?auto_649439 ?auto_649453 ) ) ( not ( = ?auto_649439 ?auto_649454 ) ) ( not ( = ?auto_649439 ?auto_649455 ) ) ( not ( = ?auto_649440 ?auto_649441 ) ) ( not ( = ?auto_649440 ?auto_649442 ) ) ( not ( = ?auto_649440 ?auto_649443 ) ) ( not ( = ?auto_649440 ?auto_649444 ) ) ( not ( = ?auto_649440 ?auto_649445 ) ) ( not ( = ?auto_649440 ?auto_649446 ) ) ( not ( = ?auto_649440 ?auto_649447 ) ) ( not ( = ?auto_649440 ?auto_649448 ) ) ( not ( = ?auto_649440 ?auto_649449 ) ) ( not ( = ?auto_649440 ?auto_649450 ) ) ( not ( = ?auto_649440 ?auto_649451 ) ) ( not ( = ?auto_649440 ?auto_649452 ) ) ( not ( = ?auto_649440 ?auto_649453 ) ) ( not ( = ?auto_649440 ?auto_649454 ) ) ( not ( = ?auto_649440 ?auto_649455 ) ) ( not ( = ?auto_649441 ?auto_649442 ) ) ( not ( = ?auto_649441 ?auto_649443 ) ) ( not ( = ?auto_649441 ?auto_649444 ) ) ( not ( = ?auto_649441 ?auto_649445 ) ) ( not ( = ?auto_649441 ?auto_649446 ) ) ( not ( = ?auto_649441 ?auto_649447 ) ) ( not ( = ?auto_649441 ?auto_649448 ) ) ( not ( = ?auto_649441 ?auto_649449 ) ) ( not ( = ?auto_649441 ?auto_649450 ) ) ( not ( = ?auto_649441 ?auto_649451 ) ) ( not ( = ?auto_649441 ?auto_649452 ) ) ( not ( = ?auto_649441 ?auto_649453 ) ) ( not ( = ?auto_649441 ?auto_649454 ) ) ( not ( = ?auto_649441 ?auto_649455 ) ) ( not ( = ?auto_649442 ?auto_649443 ) ) ( not ( = ?auto_649442 ?auto_649444 ) ) ( not ( = ?auto_649442 ?auto_649445 ) ) ( not ( = ?auto_649442 ?auto_649446 ) ) ( not ( = ?auto_649442 ?auto_649447 ) ) ( not ( = ?auto_649442 ?auto_649448 ) ) ( not ( = ?auto_649442 ?auto_649449 ) ) ( not ( = ?auto_649442 ?auto_649450 ) ) ( not ( = ?auto_649442 ?auto_649451 ) ) ( not ( = ?auto_649442 ?auto_649452 ) ) ( not ( = ?auto_649442 ?auto_649453 ) ) ( not ( = ?auto_649442 ?auto_649454 ) ) ( not ( = ?auto_649442 ?auto_649455 ) ) ( not ( = ?auto_649443 ?auto_649444 ) ) ( not ( = ?auto_649443 ?auto_649445 ) ) ( not ( = ?auto_649443 ?auto_649446 ) ) ( not ( = ?auto_649443 ?auto_649447 ) ) ( not ( = ?auto_649443 ?auto_649448 ) ) ( not ( = ?auto_649443 ?auto_649449 ) ) ( not ( = ?auto_649443 ?auto_649450 ) ) ( not ( = ?auto_649443 ?auto_649451 ) ) ( not ( = ?auto_649443 ?auto_649452 ) ) ( not ( = ?auto_649443 ?auto_649453 ) ) ( not ( = ?auto_649443 ?auto_649454 ) ) ( not ( = ?auto_649443 ?auto_649455 ) ) ( not ( = ?auto_649444 ?auto_649445 ) ) ( not ( = ?auto_649444 ?auto_649446 ) ) ( not ( = ?auto_649444 ?auto_649447 ) ) ( not ( = ?auto_649444 ?auto_649448 ) ) ( not ( = ?auto_649444 ?auto_649449 ) ) ( not ( = ?auto_649444 ?auto_649450 ) ) ( not ( = ?auto_649444 ?auto_649451 ) ) ( not ( = ?auto_649444 ?auto_649452 ) ) ( not ( = ?auto_649444 ?auto_649453 ) ) ( not ( = ?auto_649444 ?auto_649454 ) ) ( not ( = ?auto_649444 ?auto_649455 ) ) ( not ( = ?auto_649445 ?auto_649446 ) ) ( not ( = ?auto_649445 ?auto_649447 ) ) ( not ( = ?auto_649445 ?auto_649448 ) ) ( not ( = ?auto_649445 ?auto_649449 ) ) ( not ( = ?auto_649445 ?auto_649450 ) ) ( not ( = ?auto_649445 ?auto_649451 ) ) ( not ( = ?auto_649445 ?auto_649452 ) ) ( not ( = ?auto_649445 ?auto_649453 ) ) ( not ( = ?auto_649445 ?auto_649454 ) ) ( not ( = ?auto_649445 ?auto_649455 ) ) ( not ( = ?auto_649446 ?auto_649447 ) ) ( not ( = ?auto_649446 ?auto_649448 ) ) ( not ( = ?auto_649446 ?auto_649449 ) ) ( not ( = ?auto_649446 ?auto_649450 ) ) ( not ( = ?auto_649446 ?auto_649451 ) ) ( not ( = ?auto_649446 ?auto_649452 ) ) ( not ( = ?auto_649446 ?auto_649453 ) ) ( not ( = ?auto_649446 ?auto_649454 ) ) ( not ( = ?auto_649446 ?auto_649455 ) ) ( not ( = ?auto_649447 ?auto_649448 ) ) ( not ( = ?auto_649447 ?auto_649449 ) ) ( not ( = ?auto_649447 ?auto_649450 ) ) ( not ( = ?auto_649447 ?auto_649451 ) ) ( not ( = ?auto_649447 ?auto_649452 ) ) ( not ( = ?auto_649447 ?auto_649453 ) ) ( not ( = ?auto_649447 ?auto_649454 ) ) ( not ( = ?auto_649447 ?auto_649455 ) ) ( not ( = ?auto_649448 ?auto_649449 ) ) ( not ( = ?auto_649448 ?auto_649450 ) ) ( not ( = ?auto_649448 ?auto_649451 ) ) ( not ( = ?auto_649448 ?auto_649452 ) ) ( not ( = ?auto_649448 ?auto_649453 ) ) ( not ( = ?auto_649448 ?auto_649454 ) ) ( not ( = ?auto_649448 ?auto_649455 ) ) ( not ( = ?auto_649449 ?auto_649450 ) ) ( not ( = ?auto_649449 ?auto_649451 ) ) ( not ( = ?auto_649449 ?auto_649452 ) ) ( not ( = ?auto_649449 ?auto_649453 ) ) ( not ( = ?auto_649449 ?auto_649454 ) ) ( not ( = ?auto_649449 ?auto_649455 ) ) ( not ( = ?auto_649450 ?auto_649451 ) ) ( not ( = ?auto_649450 ?auto_649452 ) ) ( not ( = ?auto_649450 ?auto_649453 ) ) ( not ( = ?auto_649450 ?auto_649454 ) ) ( not ( = ?auto_649450 ?auto_649455 ) ) ( not ( = ?auto_649451 ?auto_649452 ) ) ( not ( = ?auto_649451 ?auto_649453 ) ) ( not ( = ?auto_649451 ?auto_649454 ) ) ( not ( = ?auto_649451 ?auto_649455 ) ) ( not ( = ?auto_649452 ?auto_649453 ) ) ( not ( = ?auto_649452 ?auto_649454 ) ) ( not ( = ?auto_649452 ?auto_649455 ) ) ( not ( = ?auto_649453 ?auto_649454 ) ) ( not ( = ?auto_649453 ?auto_649455 ) ) ( not ( = ?auto_649454 ?auto_649455 ) ) ( ON ?auto_649454 ?auto_649455 ) ( ON ?auto_649453 ?auto_649454 ) ( ON ?auto_649452 ?auto_649453 ) ( ON ?auto_649451 ?auto_649452 ) ( ON ?auto_649450 ?auto_649451 ) ( ON ?auto_649449 ?auto_649450 ) ( CLEAR ?auto_649447 ) ( ON ?auto_649448 ?auto_649449 ) ( CLEAR ?auto_649448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_649439 ?auto_649440 ?auto_649441 ?auto_649442 ?auto_649443 ?auto_649444 ?auto_649445 ?auto_649446 ?auto_649447 ?auto_649448 )
      ( MAKE-17PILE ?auto_649439 ?auto_649440 ?auto_649441 ?auto_649442 ?auto_649443 ?auto_649444 ?auto_649445 ?auto_649446 ?auto_649447 ?auto_649448 ?auto_649449 ?auto_649450 ?auto_649451 ?auto_649452 ?auto_649453 ?auto_649454 ?auto_649455 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649473 - BLOCK
      ?auto_649474 - BLOCK
      ?auto_649475 - BLOCK
      ?auto_649476 - BLOCK
      ?auto_649477 - BLOCK
      ?auto_649478 - BLOCK
      ?auto_649479 - BLOCK
      ?auto_649480 - BLOCK
      ?auto_649481 - BLOCK
      ?auto_649482 - BLOCK
      ?auto_649483 - BLOCK
      ?auto_649484 - BLOCK
      ?auto_649485 - BLOCK
      ?auto_649486 - BLOCK
      ?auto_649487 - BLOCK
      ?auto_649488 - BLOCK
      ?auto_649489 - BLOCK
    )
    :vars
    (
      ?auto_649490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649489 ?auto_649490 ) ( ON-TABLE ?auto_649473 ) ( ON ?auto_649474 ?auto_649473 ) ( ON ?auto_649475 ?auto_649474 ) ( ON ?auto_649476 ?auto_649475 ) ( ON ?auto_649477 ?auto_649476 ) ( ON ?auto_649478 ?auto_649477 ) ( ON ?auto_649479 ?auto_649478 ) ( ON ?auto_649480 ?auto_649479 ) ( not ( = ?auto_649473 ?auto_649474 ) ) ( not ( = ?auto_649473 ?auto_649475 ) ) ( not ( = ?auto_649473 ?auto_649476 ) ) ( not ( = ?auto_649473 ?auto_649477 ) ) ( not ( = ?auto_649473 ?auto_649478 ) ) ( not ( = ?auto_649473 ?auto_649479 ) ) ( not ( = ?auto_649473 ?auto_649480 ) ) ( not ( = ?auto_649473 ?auto_649481 ) ) ( not ( = ?auto_649473 ?auto_649482 ) ) ( not ( = ?auto_649473 ?auto_649483 ) ) ( not ( = ?auto_649473 ?auto_649484 ) ) ( not ( = ?auto_649473 ?auto_649485 ) ) ( not ( = ?auto_649473 ?auto_649486 ) ) ( not ( = ?auto_649473 ?auto_649487 ) ) ( not ( = ?auto_649473 ?auto_649488 ) ) ( not ( = ?auto_649473 ?auto_649489 ) ) ( not ( = ?auto_649473 ?auto_649490 ) ) ( not ( = ?auto_649474 ?auto_649475 ) ) ( not ( = ?auto_649474 ?auto_649476 ) ) ( not ( = ?auto_649474 ?auto_649477 ) ) ( not ( = ?auto_649474 ?auto_649478 ) ) ( not ( = ?auto_649474 ?auto_649479 ) ) ( not ( = ?auto_649474 ?auto_649480 ) ) ( not ( = ?auto_649474 ?auto_649481 ) ) ( not ( = ?auto_649474 ?auto_649482 ) ) ( not ( = ?auto_649474 ?auto_649483 ) ) ( not ( = ?auto_649474 ?auto_649484 ) ) ( not ( = ?auto_649474 ?auto_649485 ) ) ( not ( = ?auto_649474 ?auto_649486 ) ) ( not ( = ?auto_649474 ?auto_649487 ) ) ( not ( = ?auto_649474 ?auto_649488 ) ) ( not ( = ?auto_649474 ?auto_649489 ) ) ( not ( = ?auto_649474 ?auto_649490 ) ) ( not ( = ?auto_649475 ?auto_649476 ) ) ( not ( = ?auto_649475 ?auto_649477 ) ) ( not ( = ?auto_649475 ?auto_649478 ) ) ( not ( = ?auto_649475 ?auto_649479 ) ) ( not ( = ?auto_649475 ?auto_649480 ) ) ( not ( = ?auto_649475 ?auto_649481 ) ) ( not ( = ?auto_649475 ?auto_649482 ) ) ( not ( = ?auto_649475 ?auto_649483 ) ) ( not ( = ?auto_649475 ?auto_649484 ) ) ( not ( = ?auto_649475 ?auto_649485 ) ) ( not ( = ?auto_649475 ?auto_649486 ) ) ( not ( = ?auto_649475 ?auto_649487 ) ) ( not ( = ?auto_649475 ?auto_649488 ) ) ( not ( = ?auto_649475 ?auto_649489 ) ) ( not ( = ?auto_649475 ?auto_649490 ) ) ( not ( = ?auto_649476 ?auto_649477 ) ) ( not ( = ?auto_649476 ?auto_649478 ) ) ( not ( = ?auto_649476 ?auto_649479 ) ) ( not ( = ?auto_649476 ?auto_649480 ) ) ( not ( = ?auto_649476 ?auto_649481 ) ) ( not ( = ?auto_649476 ?auto_649482 ) ) ( not ( = ?auto_649476 ?auto_649483 ) ) ( not ( = ?auto_649476 ?auto_649484 ) ) ( not ( = ?auto_649476 ?auto_649485 ) ) ( not ( = ?auto_649476 ?auto_649486 ) ) ( not ( = ?auto_649476 ?auto_649487 ) ) ( not ( = ?auto_649476 ?auto_649488 ) ) ( not ( = ?auto_649476 ?auto_649489 ) ) ( not ( = ?auto_649476 ?auto_649490 ) ) ( not ( = ?auto_649477 ?auto_649478 ) ) ( not ( = ?auto_649477 ?auto_649479 ) ) ( not ( = ?auto_649477 ?auto_649480 ) ) ( not ( = ?auto_649477 ?auto_649481 ) ) ( not ( = ?auto_649477 ?auto_649482 ) ) ( not ( = ?auto_649477 ?auto_649483 ) ) ( not ( = ?auto_649477 ?auto_649484 ) ) ( not ( = ?auto_649477 ?auto_649485 ) ) ( not ( = ?auto_649477 ?auto_649486 ) ) ( not ( = ?auto_649477 ?auto_649487 ) ) ( not ( = ?auto_649477 ?auto_649488 ) ) ( not ( = ?auto_649477 ?auto_649489 ) ) ( not ( = ?auto_649477 ?auto_649490 ) ) ( not ( = ?auto_649478 ?auto_649479 ) ) ( not ( = ?auto_649478 ?auto_649480 ) ) ( not ( = ?auto_649478 ?auto_649481 ) ) ( not ( = ?auto_649478 ?auto_649482 ) ) ( not ( = ?auto_649478 ?auto_649483 ) ) ( not ( = ?auto_649478 ?auto_649484 ) ) ( not ( = ?auto_649478 ?auto_649485 ) ) ( not ( = ?auto_649478 ?auto_649486 ) ) ( not ( = ?auto_649478 ?auto_649487 ) ) ( not ( = ?auto_649478 ?auto_649488 ) ) ( not ( = ?auto_649478 ?auto_649489 ) ) ( not ( = ?auto_649478 ?auto_649490 ) ) ( not ( = ?auto_649479 ?auto_649480 ) ) ( not ( = ?auto_649479 ?auto_649481 ) ) ( not ( = ?auto_649479 ?auto_649482 ) ) ( not ( = ?auto_649479 ?auto_649483 ) ) ( not ( = ?auto_649479 ?auto_649484 ) ) ( not ( = ?auto_649479 ?auto_649485 ) ) ( not ( = ?auto_649479 ?auto_649486 ) ) ( not ( = ?auto_649479 ?auto_649487 ) ) ( not ( = ?auto_649479 ?auto_649488 ) ) ( not ( = ?auto_649479 ?auto_649489 ) ) ( not ( = ?auto_649479 ?auto_649490 ) ) ( not ( = ?auto_649480 ?auto_649481 ) ) ( not ( = ?auto_649480 ?auto_649482 ) ) ( not ( = ?auto_649480 ?auto_649483 ) ) ( not ( = ?auto_649480 ?auto_649484 ) ) ( not ( = ?auto_649480 ?auto_649485 ) ) ( not ( = ?auto_649480 ?auto_649486 ) ) ( not ( = ?auto_649480 ?auto_649487 ) ) ( not ( = ?auto_649480 ?auto_649488 ) ) ( not ( = ?auto_649480 ?auto_649489 ) ) ( not ( = ?auto_649480 ?auto_649490 ) ) ( not ( = ?auto_649481 ?auto_649482 ) ) ( not ( = ?auto_649481 ?auto_649483 ) ) ( not ( = ?auto_649481 ?auto_649484 ) ) ( not ( = ?auto_649481 ?auto_649485 ) ) ( not ( = ?auto_649481 ?auto_649486 ) ) ( not ( = ?auto_649481 ?auto_649487 ) ) ( not ( = ?auto_649481 ?auto_649488 ) ) ( not ( = ?auto_649481 ?auto_649489 ) ) ( not ( = ?auto_649481 ?auto_649490 ) ) ( not ( = ?auto_649482 ?auto_649483 ) ) ( not ( = ?auto_649482 ?auto_649484 ) ) ( not ( = ?auto_649482 ?auto_649485 ) ) ( not ( = ?auto_649482 ?auto_649486 ) ) ( not ( = ?auto_649482 ?auto_649487 ) ) ( not ( = ?auto_649482 ?auto_649488 ) ) ( not ( = ?auto_649482 ?auto_649489 ) ) ( not ( = ?auto_649482 ?auto_649490 ) ) ( not ( = ?auto_649483 ?auto_649484 ) ) ( not ( = ?auto_649483 ?auto_649485 ) ) ( not ( = ?auto_649483 ?auto_649486 ) ) ( not ( = ?auto_649483 ?auto_649487 ) ) ( not ( = ?auto_649483 ?auto_649488 ) ) ( not ( = ?auto_649483 ?auto_649489 ) ) ( not ( = ?auto_649483 ?auto_649490 ) ) ( not ( = ?auto_649484 ?auto_649485 ) ) ( not ( = ?auto_649484 ?auto_649486 ) ) ( not ( = ?auto_649484 ?auto_649487 ) ) ( not ( = ?auto_649484 ?auto_649488 ) ) ( not ( = ?auto_649484 ?auto_649489 ) ) ( not ( = ?auto_649484 ?auto_649490 ) ) ( not ( = ?auto_649485 ?auto_649486 ) ) ( not ( = ?auto_649485 ?auto_649487 ) ) ( not ( = ?auto_649485 ?auto_649488 ) ) ( not ( = ?auto_649485 ?auto_649489 ) ) ( not ( = ?auto_649485 ?auto_649490 ) ) ( not ( = ?auto_649486 ?auto_649487 ) ) ( not ( = ?auto_649486 ?auto_649488 ) ) ( not ( = ?auto_649486 ?auto_649489 ) ) ( not ( = ?auto_649486 ?auto_649490 ) ) ( not ( = ?auto_649487 ?auto_649488 ) ) ( not ( = ?auto_649487 ?auto_649489 ) ) ( not ( = ?auto_649487 ?auto_649490 ) ) ( not ( = ?auto_649488 ?auto_649489 ) ) ( not ( = ?auto_649488 ?auto_649490 ) ) ( not ( = ?auto_649489 ?auto_649490 ) ) ( ON ?auto_649488 ?auto_649489 ) ( ON ?auto_649487 ?auto_649488 ) ( ON ?auto_649486 ?auto_649487 ) ( ON ?auto_649485 ?auto_649486 ) ( ON ?auto_649484 ?auto_649485 ) ( ON ?auto_649483 ?auto_649484 ) ( ON ?auto_649482 ?auto_649483 ) ( CLEAR ?auto_649480 ) ( ON ?auto_649481 ?auto_649482 ) ( CLEAR ?auto_649481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_649473 ?auto_649474 ?auto_649475 ?auto_649476 ?auto_649477 ?auto_649478 ?auto_649479 ?auto_649480 ?auto_649481 )
      ( MAKE-17PILE ?auto_649473 ?auto_649474 ?auto_649475 ?auto_649476 ?auto_649477 ?auto_649478 ?auto_649479 ?auto_649480 ?auto_649481 ?auto_649482 ?auto_649483 ?auto_649484 ?auto_649485 ?auto_649486 ?auto_649487 ?auto_649488 ?auto_649489 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649508 - BLOCK
      ?auto_649509 - BLOCK
      ?auto_649510 - BLOCK
      ?auto_649511 - BLOCK
      ?auto_649512 - BLOCK
      ?auto_649513 - BLOCK
      ?auto_649514 - BLOCK
      ?auto_649515 - BLOCK
      ?auto_649516 - BLOCK
      ?auto_649517 - BLOCK
      ?auto_649518 - BLOCK
      ?auto_649519 - BLOCK
      ?auto_649520 - BLOCK
      ?auto_649521 - BLOCK
      ?auto_649522 - BLOCK
      ?auto_649523 - BLOCK
      ?auto_649524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649524 ) ( ON-TABLE ?auto_649508 ) ( ON ?auto_649509 ?auto_649508 ) ( ON ?auto_649510 ?auto_649509 ) ( ON ?auto_649511 ?auto_649510 ) ( ON ?auto_649512 ?auto_649511 ) ( ON ?auto_649513 ?auto_649512 ) ( ON ?auto_649514 ?auto_649513 ) ( ON ?auto_649515 ?auto_649514 ) ( not ( = ?auto_649508 ?auto_649509 ) ) ( not ( = ?auto_649508 ?auto_649510 ) ) ( not ( = ?auto_649508 ?auto_649511 ) ) ( not ( = ?auto_649508 ?auto_649512 ) ) ( not ( = ?auto_649508 ?auto_649513 ) ) ( not ( = ?auto_649508 ?auto_649514 ) ) ( not ( = ?auto_649508 ?auto_649515 ) ) ( not ( = ?auto_649508 ?auto_649516 ) ) ( not ( = ?auto_649508 ?auto_649517 ) ) ( not ( = ?auto_649508 ?auto_649518 ) ) ( not ( = ?auto_649508 ?auto_649519 ) ) ( not ( = ?auto_649508 ?auto_649520 ) ) ( not ( = ?auto_649508 ?auto_649521 ) ) ( not ( = ?auto_649508 ?auto_649522 ) ) ( not ( = ?auto_649508 ?auto_649523 ) ) ( not ( = ?auto_649508 ?auto_649524 ) ) ( not ( = ?auto_649509 ?auto_649510 ) ) ( not ( = ?auto_649509 ?auto_649511 ) ) ( not ( = ?auto_649509 ?auto_649512 ) ) ( not ( = ?auto_649509 ?auto_649513 ) ) ( not ( = ?auto_649509 ?auto_649514 ) ) ( not ( = ?auto_649509 ?auto_649515 ) ) ( not ( = ?auto_649509 ?auto_649516 ) ) ( not ( = ?auto_649509 ?auto_649517 ) ) ( not ( = ?auto_649509 ?auto_649518 ) ) ( not ( = ?auto_649509 ?auto_649519 ) ) ( not ( = ?auto_649509 ?auto_649520 ) ) ( not ( = ?auto_649509 ?auto_649521 ) ) ( not ( = ?auto_649509 ?auto_649522 ) ) ( not ( = ?auto_649509 ?auto_649523 ) ) ( not ( = ?auto_649509 ?auto_649524 ) ) ( not ( = ?auto_649510 ?auto_649511 ) ) ( not ( = ?auto_649510 ?auto_649512 ) ) ( not ( = ?auto_649510 ?auto_649513 ) ) ( not ( = ?auto_649510 ?auto_649514 ) ) ( not ( = ?auto_649510 ?auto_649515 ) ) ( not ( = ?auto_649510 ?auto_649516 ) ) ( not ( = ?auto_649510 ?auto_649517 ) ) ( not ( = ?auto_649510 ?auto_649518 ) ) ( not ( = ?auto_649510 ?auto_649519 ) ) ( not ( = ?auto_649510 ?auto_649520 ) ) ( not ( = ?auto_649510 ?auto_649521 ) ) ( not ( = ?auto_649510 ?auto_649522 ) ) ( not ( = ?auto_649510 ?auto_649523 ) ) ( not ( = ?auto_649510 ?auto_649524 ) ) ( not ( = ?auto_649511 ?auto_649512 ) ) ( not ( = ?auto_649511 ?auto_649513 ) ) ( not ( = ?auto_649511 ?auto_649514 ) ) ( not ( = ?auto_649511 ?auto_649515 ) ) ( not ( = ?auto_649511 ?auto_649516 ) ) ( not ( = ?auto_649511 ?auto_649517 ) ) ( not ( = ?auto_649511 ?auto_649518 ) ) ( not ( = ?auto_649511 ?auto_649519 ) ) ( not ( = ?auto_649511 ?auto_649520 ) ) ( not ( = ?auto_649511 ?auto_649521 ) ) ( not ( = ?auto_649511 ?auto_649522 ) ) ( not ( = ?auto_649511 ?auto_649523 ) ) ( not ( = ?auto_649511 ?auto_649524 ) ) ( not ( = ?auto_649512 ?auto_649513 ) ) ( not ( = ?auto_649512 ?auto_649514 ) ) ( not ( = ?auto_649512 ?auto_649515 ) ) ( not ( = ?auto_649512 ?auto_649516 ) ) ( not ( = ?auto_649512 ?auto_649517 ) ) ( not ( = ?auto_649512 ?auto_649518 ) ) ( not ( = ?auto_649512 ?auto_649519 ) ) ( not ( = ?auto_649512 ?auto_649520 ) ) ( not ( = ?auto_649512 ?auto_649521 ) ) ( not ( = ?auto_649512 ?auto_649522 ) ) ( not ( = ?auto_649512 ?auto_649523 ) ) ( not ( = ?auto_649512 ?auto_649524 ) ) ( not ( = ?auto_649513 ?auto_649514 ) ) ( not ( = ?auto_649513 ?auto_649515 ) ) ( not ( = ?auto_649513 ?auto_649516 ) ) ( not ( = ?auto_649513 ?auto_649517 ) ) ( not ( = ?auto_649513 ?auto_649518 ) ) ( not ( = ?auto_649513 ?auto_649519 ) ) ( not ( = ?auto_649513 ?auto_649520 ) ) ( not ( = ?auto_649513 ?auto_649521 ) ) ( not ( = ?auto_649513 ?auto_649522 ) ) ( not ( = ?auto_649513 ?auto_649523 ) ) ( not ( = ?auto_649513 ?auto_649524 ) ) ( not ( = ?auto_649514 ?auto_649515 ) ) ( not ( = ?auto_649514 ?auto_649516 ) ) ( not ( = ?auto_649514 ?auto_649517 ) ) ( not ( = ?auto_649514 ?auto_649518 ) ) ( not ( = ?auto_649514 ?auto_649519 ) ) ( not ( = ?auto_649514 ?auto_649520 ) ) ( not ( = ?auto_649514 ?auto_649521 ) ) ( not ( = ?auto_649514 ?auto_649522 ) ) ( not ( = ?auto_649514 ?auto_649523 ) ) ( not ( = ?auto_649514 ?auto_649524 ) ) ( not ( = ?auto_649515 ?auto_649516 ) ) ( not ( = ?auto_649515 ?auto_649517 ) ) ( not ( = ?auto_649515 ?auto_649518 ) ) ( not ( = ?auto_649515 ?auto_649519 ) ) ( not ( = ?auto_649515 ?auto_649520 ) ) ( not ( = ?auto_649515 ?auto_649521 ) ) ( not ( = ?auto_649515 ?auto_649522 ) ) ( not ( = ?auto_649515 ?auto_649523 ) ) ( not ( = ?auto_649515 ?auto_649524 ) ) ( not ( = ?auto_649516 ?auto_649517 ) ) ( not ( = ?auto_649516 ?auto_649518 ) ) ( not ( = ?auto_649516 ?auto_649519 ) ) ( not ( = ?auto_649516 ?auto_649520 ) ) ( not ( = ?auto_649516 ?auto_649521 ) ) ( not ( = ?auto_649516 ?auto_649522 ) ) ( not ( = ?auto_649516 ?auto_649523 ) ) ( not ( = ?auto_649516 ?auto_649524 ) ) ( not ( = ?auto_649517 ?auto_649518 ) ) ( not ( = ?auto_649517 ?auto_649519 ) ) ( not ( = ?auto_649517 ?auto_649520 ) ) ( not ( = ?auto_649517 ?auto_649521 ) ) ( not ( = ?auto_649517 ?auto_649522 ) ) ( not ( = ?auto_649517 ?auto_649523 ) ) ( not ( = ?auto_649517 ?auto_649524 ) ) ( not ( = ?auto_649518 ?auto_649519 ) ) ( not ( = ?auto_649518 ?auto_649520 ) ) ( not ( = ?auto_649518 ?auto_649521 ) ) ( not ( = ?auto_649518 ?auto_649522 ) ) ( not ( = ?auto_649518 ?auto_649523 ) ) ( not ( = ?auto_649518 ?auto_649524 ) ) ( not ( = ?auto_649519 ?auto_649520 ) ) ( not ( = ?auto_649519 ?auto_649521 ) ) ( not ( = ?auto_649519 ?auto_649522 ) ) ( not ( = ?auto_649519 ?auto_649523 ) ) ( not ( = ?auto_649519 ?auto_649524 ) ) ( not ( = ?auto_649520 ?auto_649521 ) ) ( not ( = ?auto_649520 ?auto_649522 ) ) ( not ( = ?auto_649520 ?auto_649523 ) ) ( not ( = ?auto_649520 ?auto_649524 ) ) ( not ( = ?auto_649521 ?auto_649522 ) ) ( not ( = ?auto_649521 ?auto_649523 ) ) ( not ( = ?auto_649521 ?auto_649524 ) ) ( not ( = ?auto_649522 ?auto_649523 ) ) ( not ( = ?auto_649522 ?auto_649524 ) ) ( not ( = ?auto_649523 ?auto_649524 ) ) ( ON ?auto_649523 ?auto_649524 ) ( ON ?auto_649522 ?auto_649523 ) ( ON ?auto_649521 ?auto_649522 ) ( ON ?auto_649520 ?auto_649521 ) ( ON ?auto_649519 ?auto_649520 ) ( ON ?auto_649518 ?auto_649519 ) ( ON ?auto_649517 ?auto_649518 ) ( CLEAR ?auto_649515 ) ( ON ?auto_649516 ?auto_649517 ) ( CLEAR ?auto_649516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_649508 ?auto_649509 ?auto_649510 ?auto_649511 ?auto_649512 ?auto_649513 ?auto_649514 ?auto_649515 ?auto_649516 )
      ( MAKE-17PILE ?auto_649508 ?auto_649509 ?auto_649510 ?auto_649511 ?auto_649512 ?auto_649513 ?auto_649514 ?auto_649515 ?auto_649516 ?auto_649517 ?auto_649518 ?auto_649519 ?auto_649520 ?auto_649521 ?auto_649522 ?auto_649523 ?auto_649524 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649542 - BLOCK
      ?auto_649543 - BLOCK
      ?auto_649544 - BLOCK
      ?auto_649545 - BLOCK
      ?auto_649546 - BLOCK
      ?auto_649547 - BLOCK
      ?auto_649548 - BLOCK
      ?auto_649549 - BLOCK
      ?auto_649550 - BLOCK
      ?auto_649551 - BLOCK
      ?auto_649552 - BLOCK
      ?auto_649553 - BLOCK
      ?auto_649554 - BLOCK
      ?auto_649555 - BLOCK
      ?auto_649556 - BLOCK
      ?auto_649557 - BLOCK
      ?auto_649558 - BLOCK
    )
    :vars
    (
      ?auto_649559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649558 ?auto_649559 ) ( ON-TABLE ?auto_649542 ) ( ON ?auto_649543 ?auto_649542 ) ( ON ?auto_649544 ?auto_649543 ) ( ON ?auto_649545 ?auto_649544 ) ( ON ?auto_649546 ?auto_649545 ) ( ON ?auto_649547 ?auto_649546 ) ( ON ?auto_649548 ?auto_649547 ) ( not ( = ?auto_649542 ?auto_649543 ) ) ( not ( = ?auto_649542 ?auto_649544 ) ) ( not ( = ?auto_649542 ?auto_649545 ) ) ( not ( = ?auto_649542 ?auto_649546 ) ) ( not ( = ?auto_649542 ?auto_649547 ) ) ( not ( = ?auto_649542 ?auto_649548 ) ) ( not ( = ?auto_649542 ?auto_649549 ) ) ( not ( = ?auto_649542 ?auto_649550 ) ) ( not ( = ?auto_649542 ?auto_649551 ) ) ( not ( = ?auto_649542 ?auto_649552 ) ) ( not ( = ?auto_649542 ?auto_649553 ) ) ( not ( = ?auto_649542 ?auto_649554 ) ) ( not ( = ?auto_649542 ?auto_649555 ) ) ( not ( = ?auto_649542 ?auto_649556 ) ) ( not ( = ?auto_649542 ?auto_649557 ) ) ( not ( = ?auto_649542 ?auto_649558 ) ) ( not ( = ?auto_649542 ?auto_649559 ) ) ( not ( = ?auto_649543 ?auto_649544 ) ) ( not ( = ?auto_649543 ?auto_649545 ) ) ( not ( = ?auto_649543 ?auto_649546 ) ) ( not ( = ?auto_649543 ?auto_649547 ) ) ( not ( = ?auto_649543 ?auto_649548 ) ) ( not ( = ?auto_649543 ?auto_649549 ) ) ( not ( = ?auto_649543 ?auto_649550 ) ) ( not ( = ?auto_649543 ?auto_649551 ) ) ( not ( = ?auto_649543 ?auto_649552 ) ) ( not ( = ?auto_649543 ?auto_649553 ) ) ( not ( = ?auto_649543 ?auto_649554 ) ) ( not ( = ?auto_649543 ?auto_649555 ) ) ( not ( = ?auto_649543 ?auto_649556 ) ) ( not ( = ?auto_649543 ?auto_649557 ) ) ( not ( = ?auto_649543 ?auto_649558 ) ) ( not ( = ?auto_649543 ?auto_649559 ) ) ( not ( = ?auto_649544 ?auto_649545 ) ) ( not ( = ?auto_649544 ?auto_649546 ) ) ( not ( = ?auto_649544 ?auto_649547 ) ) ( not ( = ?auto_649544 ?auto_649548 ) ) ( not ( = ?auto_649544 ?auto_649549 ) ) ( not ( = ?auto_649544 ?auto_649550 ) ) ( not ( = ?auto_649544 ?auto_649551 ) ) ( not ( = ?auto_649544 ?auto_649552 ) ) ( not ( = ?auto_649544 ?auto_649553 ) ) ( not ( = ?auto_649544 ?auto_649554 ) ) ( not ( = ?auto_649544 ?auto_649555 ) ) ( not ( = ?auto_649544 ?auto_649556 ) ) ( not ( = ?auto_649544 ?auto_649557 ) ) ( not ( = ?auto_649544 ?auto_649558 ) ) ( not ( = ?auto_649544 ?auto_649559 ) ) ( not ( = ?auto_649545 ?auto_649546 ) ) ( not ( = ?auto_649545 ?auto_649547 ) ) ( not ( = ?auto_649545 ?auto_649548 ) ) ( not ( = ?auto_649545 ?auto_649549 ) ) ( not ( = ?auto_649545 ?auto_649550 ) ) ( not ( = ?auto_649545 ?auto_649551 ) ) ( not ( = ?auto_649545 ?auto_649552 ) ) ( not ( = ?auto_649545 ?auto_649553 ) ) ( not ( = ?auto_649545 ?auto_649554 ) ) ( not ( = ?auto_649545 ?auto_649555 ) ) ( not ( = ?auto_649545 ?auto_649556 ) ) ( not ( = ?auto_649545 ?auto_649557 ) ) ( not ( = ?auto_649545 ?auto_649558 ) ) ( not ( = ?auto_649545 ?auto_649559 ) ) ( not ( = ?auto_649546 ?auto_649547 ) ) ( not ( = ?auto_649546 ?auto_649548 ) ) ( not ( = ?auto_649546 ?auto_649549 ) ) ( not ( = ?auto_649546 ?auto_649550 ) ) ( not ( = ?auto_649546 ?auto_649551 ) ) ( not ( = ?auto_649546 ?auto_649552 ) ) ( not ( = ?auto_649546 ?auto_649553 ) ) ( not ( = ?auto_649546 ?auto_649554 ) ) ( not ( = ?auto_649546 ?auto_649555 ) ) ( not ( = ?auto_649546 ?auto_649556 ) ) ( not ( = ?auto_649546 ?auto_649557 ) ) ( not ( = ?auto_649546 ?auto_649558 ) ) ( not ( = ?auto_649546 ?auto_649559 ) ) ( not ( = ?auto_649547 ?auto_649548 ) ) ( not ( = ?auto_649547 ?auto_649549 ) ) ( not ( = ?auto_649547 ?auto_649550 ) ) ( not ( = ?auto_649547 ?auto_649551 ) ) ( not ( = ?auto_649547 ?auto_649552 ) ) ( not ( = ?auto_649547 ?auto_649553 ) ) ( not ( = ?auto_649547 ?auto_649554 ) ) ( not ( = ?auto_649547 ?auto_649555 ) ) ( not ( = ?auto_649547 ?auto_649556 ) ) ( not ( = ?auto_649547 ?auto_649557 ) ) ( not ( = ?auto_649547 ?auto_649558 ) ) ( not ( = ?auto_649547 ?auto_649559 ) ) ( not ( = ?auto_649548 ?auto_649549 ) ) ( not ( = ?auto_649548 ?auto_649550 ) ) ( not ( = ?auto_649548 ?auto_649551 ) ) ( not ( = ?auto_649548 ?auto_649552 ) ) ( not ( = ?auto_649548 ?auto_649553 ) ) ( not ( = ?auto_649548 ?auto_649554 ) ) ( not ( = ?auto_649548 ?auto_649555 ) ) ( not ( = ?auto_649548 ?auto_649556 ) ) ( not ( = ?auto_649548 ?auto_649557 ) ) ( not ( = ?auto_649548 ?auto_649558 ) ) ( not ( = ?auto_649548 ?auto_649559 ) ) ( not ( = ?auto_649549 ?auto_649550 ) ) ( not ( = ?auto_649549 ?auto_649551 ) ) ( not ( = ?auto_649549 ?auto_649552 ) ) ( not ( = ?auto_649549 ?auto_649553 ) ) ( not ( = ?auto_649549 ?auto_649554 ) ) ( not ( = ?auto_649549 ?auto_649555 ) ) ( not ( = ?auto_649549 ?auto_649556 ) ) ( not ( = ?auto_649549 ?auto_649557 ) ) ( not ( = ?auto_649549 ?auto_649558 ) ) ( not ( = ?auto_649549 ?auto_649559 ) ) ( not ( = ?auto_649550 ?auto_649551 ) ) ( not ( = ?auto_649550 ?auto_649552 ) ) ( not ( = ?auto_649550 ?auto_649553 ) ) ( not ( = ?auto_649550 ?auto_649554 ) ) ( not ( = ?auto_649550 ?auto_649555 ) ) ( not ( = ?auto_649550 ?auto_649556 ) ) ( not ( = ?auto_649550 ?auto_649557 ) ) ( not ( = ?auto_649550 ?auto_649558 ) ) ( not ( = ?auto_649550 ?auto_649559 ) ) ( not ( = ?auto_649551 ?auto_649552 ) ) ( not ( = ?auto_649551 ?auto_649553 ) ) ( not ( = ?auto_649551 ?auto_649554 ) ) ( not ( = ?auto_649551 ?auto_649555 ) ) ( not ( = ?auto_649551 ?auto_649556 ) ) ( not ( = ?auto_649551 ?auto_649557 ) ) ( not ( = ?auto_649551 ?auto_649558 ) ) ( not ( = ?auto_649551 ?auto_649559 ) ) ( not ( = ?auto_649552 ?auto_649553 ) ) ( not ( = ?auto_649552 ?auto_649554 ) ) ( not ( = ?auto_649552 ?auto_649555 ) ) ( not ( = ?auto_649552 ?auto_649556 ) ) ( not ( = ?auto_649552 ?auto_649557 ) ) ( not ( = ?auto_649552 ?auto_649558 ) ) ( not ( = ?auto_649552 ?auto_649559 ) ) ( not ( = ?auto_649553 ?auto_649554 ) ) ( not ( = ?auto_649553 ?auto_649555 ) ) ( not ( = ?auto_649553 ?auto_649556 ) ) ( not ( = ?auto_649553 ?auto_649557 ) ) ( not ( = ?auto_649553 ?auto_649558 ) ) ( not ( = ?auto_649553 ?auto_649559 ) ) ( not ( = ?auto_649554 ?auto_649555 ) ) ( not ( = ?auto_649554 ?auto_649556 ) ) ( not ( = ?auto_649554 ?auto_649557 ) ) ( not ( = ?auto_649554 ?auto_649558 ) ) ( not ( = ?auto_649554 ?auto_649559 ) ) ( not ( = ?auto_649555 ?auto_649556 ) ) ( not ( = ?auto_649555 ?auto_649557 ) ) ( not ( = ?auto_649555 ?auto_649558 ) ) ( not ( = ?auto_649555 ?auto_649559 ) ) ( not ( = ?auto_649556 ?auto_649557 ) ) ( not ( = ?auto_649556 ?auto_649558 ) ) ( not ( = ?auto_649556 ?auto_649559 ) ) ( not ( = ?auto_649557 ?auto_649558 ) ) ( not ( = ?auto_649557 ?auto_649559 ) ) ( not ( = ?auto_649558 ?auto_649559 ) ) ( ON ?auto_649557 ?auto_649558 ) ( ON ?auto_649556 ?auto_649557 ) ( ON ?auto_649555 ?auto_649556 ) ( ON ?auto_649554 ?auto_649555 ) ( ON ?auto_649553 ?auto_649554 ) ( ON ?auto_649552 ?auto_649553 ) ( ON ?auto_649551 ?auto_649552 ) ( ON ?auto_649550 ?auto_649551 ) ( CLEAR ?auto_649548 ) ( ON ?auto_649549 ?auto_649550 ) ( CLEAR ?auto_649549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_649542 ?auto_649543 ?auto_649544 ?auto_649545 ?auto_649546 ?auto_649547 ?auto_649548 ?auto_649549 )
      ( MAKE-17PILE ?auto_649542 ?auto_649543 ?auto_649544 ?auto_649545 ?auto_649546 ?auto_649547 ?auto_649548 ?auto_649549 ?auto_649550 ?auto_649551 ?auto_649552 ?auto_649553 ?auto_649554 ?auto_649555 ?auto_649556 ?auto_649557 ?auto_649558 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649577 - BLOCK
      ?auto_649578 - BLOCK
      ?auto_649579 - BLOCK
      ?auto_649580 - BLOCK
      ?auto_649581 - BLOCK
      ?auto_649582 - BLOCK
      ?auto_649583 - BLOCK
      ?auto_649584 - BLOCK
      ?auto_649585 - BLOCK
      ?auto_649586 - BLOCK
      ?auto_649587 - BLOCK
      ?auto_649588 - BLOCK
      ?auto_649589 - BLOCK
      ?auto_649590 - BLOCK
      ?auto_649591 - BLOCK
      ?auto_649592 - BLOCK
      ?auto_649593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649593 ) ( ON-TABLE ?auto_649577 ) ( ON ?auto_649578 ?auto_649577 ) ( ON ?auto_649579 ?auto_649578 ) ( ON ?auto_649580 ?auto_649579 ) ( ON ?auto_649581 ?auto_649580 ) ( ON ?auto_649582 ?auto_649581 ) ( ON ?auto_649583 ?auto_649582 ) ( not ( = ?auto_649577 ?auto_649578 ) ) ( not ( = ?auto_649577 ?auto_649579 ) ) ( not ( = ?auto_649577 ?auto_649580 ) ) ( not ( = ?auto_649577 ?auto_649581 ) ) ( not ( = ?auto_649577 ?auto_649582 ) ) ( not ( = ?auto_649577 ?auto_649583 ) ) ( not ( = ?auto_649577 ?auto_649584 ) ) ( not ( = ?auto_649577 ?auto_649585 ) ) ( not ( = ?auto_649577 ?auto_649586 ) ) ( not ( = ?auto_649577 ?auto_649587 ) ) ( not ( = ?auto_649577 ?auto_649588 ) ) ( not ( = ?auto_649577 ?auto_649589 ) ) ( not ( = ?auto_649577 ?auto_649590 ) ) ( not ( = ?auto_649577 ?auto_649591 ) ) ( not ( = ?auto_649577 ?auto_649592 ) ) ( not ( = ?auto_649577 ?auto_649593 ) ) ( not ( = ?auto_649578 ?auto_649579 ) ) ( not ( = ?auto_649578 ?auto_649580 ) ) ( not ( = ?auto_649578 ?auto_649581 ) ) ( not ( = ?auto_649578 ?auto_649582 ) ) ( not ( = ?auto_649578 ?auto_649583 ) ) ( not ( = ?auto_649578 ?auto_649584 ) ) ( not ( = ?auto_649578 ?auto_649585 ) ) ( not ( = ?auto_649578 ?auto_649586 ) ) ( not ( = ?auto_649578 ?auto_649587 ) ) ( not ( = ?auto_649578 ?auto_649588 ) ) ( not ( = ?auto_649578 ?auto_649589 ) ) ( not ( = ?auto_649578 ?auto_649590 ) ) ( not ( = ?auto_649578 ?auto_649591 ) ) ( not ( = ?auto_649578 ?auto_649592 ) ) ( not ( = ?auto_649578 ?auto_649593 ) ) ( not ( = ?auto_649579 ?auto_649580 ) ) ( not ( = ?auto_649579 ?auto_649581 ) ) ( not ( = ?auto_649579 ?auto_649582 ) ) ( not ( = ?auto_649579 ?auto_649583 ) ) ( not ( = ?auto_649579 ?auto_649584 ) ) ( not ( = ?auto_649579 ?auto_649585 ) ) ( not ( = ?auto_649579 ?auto_649586 ) ) ( not ( = ?auto_649579 ?auto_649587 ) ) ( not ( = ?auto_649579 ?auto_649588 ) ) ( not ( = ?auto_649579 ?auto_649589 ) ) ( not ( = ?auto_649579 ?auto_649590 ) ) ( not ( = ?auto_649579 ?auto_649591 ) ) ( not ( = ?auto_649579 ?auto_649592 ) ) ( not ( = ?auto_649579 ?auto_649593 ) ) ( not ( = ?auto_649580 ?auto_649581 ) ) ( not ( = ?auto_649580 ?auto_649582 ) ) ( not ( = ?auto_649580 ?auto_649583 ) ) ( not ( = ?auto_649580 ?auto_649584 ) ) ( not ( = ?auto_649580 ?auto_649585 ) ) ( not ( = ?auto_649580 ?auto_649586 ) ) ( not ( = ?auto_649580 ?auto_649587 ) ) ( not ( = ?auto_649580 ?auto_649588 ) ) ( not ( = ?auto_649580 ?auto_649589 ) ) ( not ( = ?auto_649580 ?auto_649590 ) ) ( not ( = ?auto_649580 ?auto_649591 ) ) ( not ( = ?auto_649580 ?auto_649592 ) ) ( not ( = ?auto_649580 ?auto_649593 ) ) ( not ( = ?auto_649581 ?auto_649582 ) ) ( not ( = ?auto_649581 ?auto_649583 ) ) ( not ( = ?auto_649581 ?auto_649584 ) ) ( not ( = ?auto_649581 ?auto_649585 ) ) ( not ( = ?auto_649581 ?auto_649586 ) ) ( not ( = ?auto_649581 ?auto_649587 ) ) ( not ( = ?auto_649581 ?auto_649588 ) ) ( not ( = ?auto_649581 ?auto_649589 ) ) ( not ( = ?auto_649581 ?auto_649590 ) ) ( not ( = ?auto_649581 ?auto_649591 ) ) ( not ( = ?auto_649581 ?auto_649592 ) ) ( not ( = ?auto_649581 ?auto_649593 ) ) ( not ( = ?auto_649582 ?auto_649583 ) ) ( not ( = ?auto_649582 ?auto_649584 ) ) ( not ( = ?auto_649582 ?auto_649585 ) ) ( not ( = ?auto_649582 ?auto_649586 ) ) ( not ( = ?auto_649582 ?auto_649587 ) ) ( not ( = ?auto_649582 ?auto_649588 ) ) ( not ( = ?auto_649582 ?auto_649589 ) ) ( not ( = ?auto_649582 ?auto_649590 ) ) ( not ( = ?auto_649582 ?auto_649591 ) ) ( not ( = ?auto_649582 ?auto_649592 ) ) ( not ( = ?auto_649582 ?auto_649593 ) ) ( not ( = ?auto_649583 ?auto_649584 ) ) ( not ( = ?auto_649583 ?auto_649585 ) ) ( not ( = ?auto_649583 ?auto_649586 ) ) ( not ( = ?auto_649583 ?auto_649587 ) ) ( not ( = ?auto_649583 ?auto_649588 ) ) ( not ( = ?auto_649583 ?auto_649589 ) ) ( not ( = ?auto_649583 ?auto_649590 ) ) ( not ( = ?auto_649583 ?auto_649591 ) ) ( not ( = ?auto_649583 ?auto_649592 ) ) ( not ( = ?auto_649583 ?auto_649593 ) ) ( not ( = ?auto_649584 ?auto_649585 ) ) ( not ( = ?auto_649584 ?auto_649586 ) ) ( not ( = ?auto_649584 ?auto_649587 ) ) ( not ( = ?auto_649584 ?auto_649588 ) ) ( not ( = ?auto_649584 ?auto_649589 ) ) ( not ( = ?auto_649584 ?auto_649590 ) ) ( not ( = ?auto_649584 ?auto_649591 ) ) ( not ( = ?auto_649584 ?auto_649592 ) ) ( not ( = ?auto_649584 ?auto_649593 ) ) ( not ( = ?auto_649585 ?auto_649586 ) ) ( not ( = ?auto_649585 ?auto_649587 ) ) ( not ( = ?auto_649585 ?auto_649588 ) ) ( not ( = ?auto_649585 ?auto_649589 ) ) ( not ( = ?auto_649585 ?auto_649590 ) ) ( not ( = ?auto_649585 ?auto_649591 ) ) ( not ( = ?auto_649585 ?auto_649592 ) ) ( not ( = ?auto_649585 ?auto_649593 ) ) ( not ( = ?auto_649586 ?auto_649587 ) ) ( not ( = ?auto_649586 ?auto_649588 ) ) ( not ( = ?auto_649586 ?auto_649589 ) ) ( not ( = ?auto_649586 ?auto_649590 ) ) ( not ( = ?auto_649586 ?auto_649591 ) ) ( not ( = ?auto_649586 ?auto_649592 ) ) ( not ( = ?auto_649586 ?auto_649593 ) ) ( not ( = ?auto_649587 ?auto_649588 ) ) ( not ( = ?auto_649587 ?auto_649589 ) ) ( not ( = ?auto_649587 ?auto_649590 ) ) ( not ( = ?auto_649587 ?auto_649591 ) ) ( not ( = ?auto_649587 ?auto_649592 ) ) ( not ( = ?auto_649587 ?auto_649593 ) ) ( not ( = ?auto_649588 ?auto_649589 ) ) ( not ( = ?auto_649588 ?auto_649590 ) ) ( not ( = ?auto_649588 ?auto_649591 ) ) ( not ( = ?auto_649588 ?auto_649592 ) ) ( not ( = ?auto_649588 ?auto_649593 ) ) ( not ( = ?auto_649589 ?auto_649590 ) ) ( not ( = ?auto_649589 ?auto_649591 ) ) ( not ( = ?auto_649589 ?auto_649592 ) ) ( not ( = ?auto_649589 ?auto_649593 ) ) ( not ( = ?auto_649590 ?auto_649591 ) ) ( not ( = ?auto_649590 ?auto_649592 ) ) ( not ( = ?auto_649590 ?auto_649593 ) ) ( not ( = ?auto_649591 ?auto_649592 ) ) ( not ( = ?auto_649591 ?auto_649593 ) ) ( not ( = ?auto_649592 ?auto_649593 ) ) ( ON ?auto_649592 ?auto_649593 ) ( ON ?auto_649591 ?auto_649592 ) ( ON ?auto_649590 ?auto_649591 ) ( ON ?auto_649589 ?auto_649590 ) ( ON ?auto_649588 ?auto_649589 ) ( ON ?auto_649587 ?auto_649588 ) ( ON ?auto_649586 ?auto_649587 ) ( ON ?auto_649585 ?auto_649586 ) ( CLEAR ?auto_649583 ) ( ON ?auto_649584 ?auto_649585 ) ( CLEAR ?auto_649584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_649577 ?auto_649578 ?auto_649579 ?auto_649580 ?auto_649581 ?auto_649582 ?auto_649583 ?auto_649584 )
      ( MAKE-17PILE ?auto_649577 ?auto_649578 ?auto_649579 ?auto_649580 ?auto_649581 ?auto_649582 ?auto_649583 ?auto_649584 ?auto_649585 ?auto_649586 ?auto_649587 ?auto_649588 ?auto_649589 ?auto_649590 ?auto_649591 ?auto_649592 ?auto_649593 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649611 - BLOCK
      ?auto_649612 - BLOCK
      ?auto_649613 - BLOCK
      ?auto_649614 - BLOCK
      ?auto_649615 - BLOCK
      ?auto_649616 - BLOCK
      ?auto_649617 - BLOCK
      ?auto_649618 - BLOCK
      ?auto_649619 - BLOCK
      ?auto_649620 - BLOCK
      ?auto_649621 - BLOCK
      ?auto_649622 - BLOCK
      ?auto_649623 - BLOCK
      ?auto_649624 - BLOCK
      ?auto_649625 - BLOCK
      ?auto_649626 - BLOCK
      ?auto_649627 - BLOCK
    )
    :vars
    (
      ?auto_649628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649627 ?auto_649628 ) ( ON-TABLE ?auto_649611 ) ( ON ?auto_649612 ?auto_649611 ) ( ON ?auto_649613 ?auto_649612 ) ( ON ?auto_649614 ?auto_649613 ) ( ON ?auto_649615 ?auto_649614 ) ( ON ?auto_649616 ?auto_649615 ) ( not ( = ?auto_649611 ?auto_649612 ) ) ( not ( = ?auto_649611 ?auto_649613 ) ) ( not ( = ?auto_649611 ?auto_649614 ) ) ( not ( = ?auto_649611 ?auto_649615 ) ) ( not ( = ?auto_649611 ?auto_649616 ) ) ( not ( = ?auto_649611 ?auto_649617 ) ) ( not ( = ?auto_649611 ?auto_649618 ) ) ( not ( = ?auto_649611 ?auto_649619 ) ) ( not ( = ?auto_649611 ?auto_649620 ) ) ( not ( = ?auto_649611 ?auto_649621 ) ) ( not ( = ?auto_649611 ?auto_649622 ) ) ( not ( = ?auto_649611 ?auto_649623 ) ) ( not ( = ?auto_649611 ?auto_649624 ) ) ( not ( = ?auto_649611 ?auto_649625 ) ) ( not ( = ?auto_649611 ?auto_649626 ) ) ( not ( = ?auto_649611 ?auto_649627 ) ) ( not ( = ?auto_649611 ?auto_649628 ) ) ( not ( = ?auto_649612 ?auto_649613 ) ) ( not ( = ?auto_649612 ?auto_649614 ) ) ( not ( = ?auto_649612 ?auto_649615 ) ) ( not ( = ?auto_649612 ?auto_649616 ) ) ( not ( = ?auto_649612 ?auto_649617 ) ) ( not ( = ?auto_649612 ?auto_649618 ) ) ( not ( = ?auto_649612 ?auto_649619 ) ) ( not ( = ?auto_649612 ?auto_649620 ) ) ( not ( = ?auto_649612 ?auto_649621 ) ) ( not ( = ?auto_649612 ?auto_649622 ) ) ( not ( = ?auto_649612 ?auto_649623 ) ) ( not ( = ?auto_649612 ?auto_649624 ) ) ( not ( = ?auto_649612 ?auto_649625 ) ) ( not ( = ?auto_649612 ?auto_649626 ) ) ( not ( = ?auto_649612 ?auto_649627 ) ) ( not ( = ?auto_649612 ?auto_649628 ) ) ( not ( = ?auto_649613 ?auto_649614 ) ) ( not ( = ?auto_649613 ?auto_649615 ) ) ( not ( = ?auto_649613 ?auto_649616 ) ) ( not ( = ?auto_649613 ?auto_649617 ) ) ( not ( = ?auto_649613 ?auto_649618 ) ) ( not ( = ?auto_649613 ?auto_649619 ) ) ( not ( = ?auto_649613 ?auto_649620 ) ) ( not ( = ?auto_649613 ?auto_649621 ) ) ( not ( = ?auto_649613 ?auto_649622 ) ) ( not ( = ?auto_649613 ?auto_649623 ) ) ( not ( = ?auto_649613 ?auto_649624 ) ) ( not ( = ?auto_649613 ?auto_649625 ) ) ( not ( = ?auto_649613 ?auto_649626 ) ) ( not ( = ?auto_649613 ?auto_649627 ) ) ( not ( = ?auto_649613 ?auto_649628 ) ) ( not ( = ?auto_649614 ?auto_649615 ) ) ( not ( = ?auto_649614 ?auto_649616 ) ) ( not ( = ?auto_649614 ?auto_649617 ) ) ( not ( = ?auto_649614 ?auto_649618 ) ) ( not ( = ?auto_649614 ?auto_649619 ) ) ( not ( = ?auto_649614 ?auto_649620 ) ) ( not ( = ?auto_649614 ?auto_649621 ) ) ( not ( = ?auto_649614 ?auto_649622 ) ) ( not ( = ?auto_649614 ?auto_649623 ) ) ( not ( = ?auto_649614 ?auto_649624 ) ) ( not ( = ?auto_649614 ?auto_649625 ) ) ( not ( = ?auto_649614 ?auto_649626 ) ) ( not ( = ?auto_649614 ?auto_649627 ) ) ( not ( = ?auto_649614 ?auto_649628 ) ) ( not ( = ?auto_649615 ?auto_649616 ) ) ( not ( = ?auto_649615 ?auto_649617 ) ) ( not ( = ?auto_649615 ?auto_649618 ) ) ( not ( = ?auto_649615 ?auto_649619 ) ) ( not ( = ?auto_649615 ?auto_649620 ) ) ( not ( = ?auto_649615 ?auto_649621 ) ) ( not ( = ?auto_649615 ?auto_649622 ) ) ( not ( = ?auto_649615 ?auto_649623 ) ) ( not ( = ?auto_649615 ?auto_649624 ) ) ( not ( = ?auto_649615 ?auto_649625 ) ) ( not ( = ?auto_649615 ?auto_649626 ) ) ( not ( = ?auto_649615 ?auto_649627 ) ) ( not ( = ?auto_649615 ?auto_649628 ) ) ( not ( = ?auto_649616 ?auto_649617 ) ) ( not ( = ?auto_649616 ?auto_649618 ) ) ( not ( = ?auto_649616 ?auto_649619 ) ) ( not ( = ?auto_649616 ?auto_649620 ) ) ( not ( = ?auto_649616 ?auto_649621 ) ) ( not ( = ?auto_649616 ?auto_649622 ) ) ( not ( = ?auto_649616 ?auto_649623 ) ) ( not ( = ?auto_649616 ?auto_649624 ) ) ( not ( = ?auto_649616 ?auto_649625 ) ) ( not ( = ?auto_649616 ?auto_649626 ) ) ( not ( = ?auto_649616 ?auto_649627 ) ) ( not ( = ?auto_649616 ?auto_649628 ) ) ( not ( = ?auto_649617 ?auto_649618 ) ) ( not ( = ?auto_649617 ?auto_649619 ) ) ( not ( = ?auto_649617 ?auto_649620 ) ) ( not ( = ?auto_649617 ?auto_649621 ) ) ( not ( = ?auto_649617 ?auto_649622 ) ) ( not ( = ?auto_649617 ?auto_649623 ) ) ( not ( = ?auto_649617 ?auto_649624 ) ) ( not ( = ?auto_649617 ?auto_649625 ) ) ( not ( = ?auto_649617 ?auto_649626 ) ) ( not ( = ?auto_649617 ?auto_649627 ) ) ( not ( = ?auto_649617 ?auto_649628 ) ) ( not ( = ?auto_649618 ?auto_649619 ) ) ( not ( = ?auto_649618 ?auto_649620 ) ) ( not ( = ?auto_649618 ?auto_649621 ) ) ( not ( = ?auto_649618 ?auto_649622 ) ) ( not ( = ?auto_649618 ?auto_649623 ) ) ( not ( = ?auto_649618 ?auto_649624 ) ) ( not ( = ?auto_649618 ?auto_649625 ) ) ( not ( = ?auto_649618 ?auto_649626 ) ) ( not ( = ?auto_649618 ?auto_649627 ) ) ( not ( = ?auto_649618 ?auto_649628 ) ) ( not ( = ?auto_649619 ?auto_649620 ) ) ( not ( = ?auto_649619 ?auto_649621 ) ) ( not ( = ?auto_649619 ?auto_649622 ) ) ( not ( = ?auto_649619 ?auto_649623 ) ) ( not ( = ?auto_649619 ?auto_649624 ) ) ( not ( = ?auto_649619 ?auto_649625 ) ) ( not ( = ?auto_649619 ?auto_649626 ) ) ( not ( = ?auto_649619 ?auto_649627 ) ) ( not ( = ?auto_649619 ?auto_649628 ) ) ( not ( = ?auto_649620 ?auto_649621 ) ) ( not ( = ?auto_649620 ?auto_649622 ) ) ( not ( = ?auto_649620 ?auto_649623 ) ) ( not ( = ?auto_649620 ?auto_649624 ) ) ( not ( = ?auto_649620 ?auto_649625 ) ) ( not ( = ?auto_649620 ?auto_649626 ) ) ( not ( = ?auto_649620 ?auto_649627 ) ) ( not ( = ?auto_649620 ?auto_649628 ) ) ( not ( = ?auto_649621 ?auto_649622 ) ) ( not ( = ?auto_649621 ?auto_649623 ) ) ( not ( = ?auto_649621 ?auto_649624 ) ) ( not ( = ?auto_649621 ?auto_649625 ) ) ( not ( = ?auto_649621 ?auto_649626 ) ) ( not ( = ?auto_649621 ?auto_649627 ) ) ( not ( = ?auto_649621 ?auto_649628 ) ) ( not ( = ?auto_649622 ?auto_649623 ) ) ( not ( = ?auto_649622 ?auto_649624 ) ) ( not ( = ?auto_649622 ?auto_649625 ) ) ( not ( = ?auto_649622 ?auto_649626 ) ) ( not ( = ?auto_649622 ?auto_649627 ) ) ( not ( = ?auto_649622 ?auto_649628 ) ) ( not ( = ?auto_649623 ?auto_649624 ) ) ( not ( = ?auto_649623 ?auto_649625 ) ) ( not ( = ?auto_649623 ?auto_649626 ) ) ( not ( = ?auto_649623 ?auto_649627 ) ) ( not ( = ?auto_649623 ?auto_649628 ) ) ( not ( = ?auto_649624 ?auto_649625 ) ) ( not ( = ?auto_649624 ?auto_649626 ) ) ( not ( = ?auto_649624 ?auto_649627 ) ) ( not ( = ?auto_649624 ?auto_649628 ) ) ( not ( = ?auto_649625 ?auto_649626 ) ) ( not ( = ?auto_649625 ?auto_649627 ) ) ( not ( = ?auto_649625 ?auto_649628 ) ) ( not ( = ?auto_649626 ?auto_649627 ) ) ( not ( = ?auto_649626 ?auto_649628 ) ) ( not ( = ?auto_649627 ?auto_649628 ) ) ( ON ?auto_649626 ?auto_649627 ) ( ON ?auto_649625 ?auto_649626 ) ( ON ?auto_649624 ?auto_649625 ) ( ON ?auto_649623 ?auto_649624 ) ( ON ?auto_649622 ?auto_649623 ) ( ON ?auto_649621 ?auto_649622 ) ( ON ?auto_649620 ?auto_649621 ) ( ON ?auto_649619 ?auto_649620 ) ( ON ?auto_649618 ?auto_649619 ) ( CLEAR ?auto_649616 ) ( ON ?auto_649617 ?auto_649618 ) ( CLEAR ?auto_649617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_649611 ?auto_649612 ?auto_649613 ?auto_649614 ?auto_649615 ?auto_649616 ?auto_649617 )
      ( MAKE-17PILE ?auto_649611 ?auto_649612 ?auto_649613 ?auto_649614 ?auto_649615 ?auto_649616 ?auto_649617 ?auto_649618 ?auto_649619 ?auto_649620 ?auto_649621 ?auto_649622 ?auto_649623 ?auto_649624 ?auto_649625 ?auto_649626 ?auto_649627 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649646 - BLOCK
      ?auto_649647 - BLOCK
      ?auto_649648 - BLOCK
      ?auto_649649 - BLOCK
      ?auto_649650 - BLOCK
      ?auto_649651 - BLOCK
      ?auto_649652 - BLOCK
      ?auto_649653 - BLOCK
      ?auto_649654 - BLOCK
      ?auto_649655 - BLOCK
      ?auto_649656 - BLOCK
      ?auto_649657 - BLOCK
      ?auto_649658 - BLOCK
      ?auto_649659 - BLOCK
      ?auto_649660 - BLOCK
      ?auto_649661 - BLOCK
      ?auto_649662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649662 ) ( ON-TABLE ?auto_649646 ) ( ON ?auto_649647 ?auto_649646 ) ( ON ?auto_649648 ?auto_649647 ) ( ON ?auto_649649 ?auto_649648 ) ( ON ?auto_649650 ?auto_649649 ) ( ON ?auto_649651 ?auto_649650 ) ( not ( = ?auto_649646 ?auto_649647 ) ) ( not ( = ?auto_649646 ?auto_649648 ) ) ( not ( = ?auto_649646 ?auto_649649 ) ) ( not ( = ?auto_649646 ?auto_649650 ) ) ( not ( = ?auto_649646 ?auto_649651 ) ) ( not ( = ?auto_649646 ?auto_649652 ) ) ( not ( = ?auto_649646 ?auto_649653 ) ) ( not ( = ?auto_649646 ?auto_649654 ) ) ( not ( = ?auto_649646 ?auto_649655 ) ) ( not ( = ?auto_649646 ?auto_649656 ) ) ( not ( = ?auto_649646 ?auto_649657 ) ) ( not ( = ?auto_649646 ?auto_649658 ) ) ( not ( = ?auto_649646 ?auto_649659 ) ) ( not ( = ?auto_649646 ?auto_649660 ) ) ( not ( = ?auto_649646 ?auto_649661 ) ) ( not ( = ?auto_649646 ?auto_649662 ) ) ( not ( = ?auto_649647 ?auto_649648 ) ) ( not ( = ?auto_649647 ?auto_649649 ) ) ( not ( = ?auto_649647 ?auto_649650 ) ) ( not ( = ?auto_649647 ?auto_649651 ) ) ( not ( = ?auto_649647 ?auto_649652 ) ) ( not ( = ?auto_649647 ?auto_649653 ) ) ( not ( = ?auto_649647 ?auto_649654 ) ) ( not ( = ?auto_649647 ?auto_649655 ) ) ( not ( = ?auto_649647 ?auto_649656 ) ) ( not ( = ?auto_649647 ?auto_649657 ) ) ( not ( = ?auto_649647 ?auto_649658 ) ) ( not ( = ?auto_649647 ?auto_649659 ) ) ( not ( = ?auto_649647 ?auto_649660 ) ) ( not ( = ?auto_649647 ?auto_649661 ) ) ( not ( = ?auto_649647 ?auto_649662 ) ) ( not ( = ?auto_649648 ?auto_649649 ) ) ( not ( = ?auto_649648 ?auto_649650 ) ) ( not ( = ?auto_649648 ?auto_649651 ) ) ( not ( = ?auto_649648 ?auto_649652 ) ) ( not ( = ?auto_649648 ?auto_649653 ) ) ( not ( = ?auto_649648 ?auto_649654 ) ) ( not ( = ?auto_649648 ?auto_649655 ) ) ( not ( = ?auto_649648 ?auto_649656 ) ) ( not ( = ?auto_649648 ?auto_649657 ) ) ( not ( = ?auto_649648 ?auto_649658 ) ) ( not ( = ?auto_649648 ?auto_649659 ) ) ( not ( = ?auto_649648 ?auto_649660 ) ) ( not ( = ?auto_649648 ?auto_649661 ) ) ( not ( = ?auto_649648 ?auto_649662 ) ) ( not ( = ?auto_649649 ?auto_649650 ) ) ( not ( = ?auto_649649 ?auto_649651 ) ) ( not ( = ?auto_649649 ?auto_649652 ) ) ( not ( = ?auto_649649 ?auto_649653 ) ) ( not ( = ?auto_649649 ?auto_649654 ) ) ( not ( = ?auto_649649 ?auto_649655 ) ) ( not ( = ?auto_649649 ?auto_649656 ) ) ( not ( = ?auto_649649 ?auto_649657 ) ) ( not ( = ?auto_649649 ?auto_649658 ) ) ( not ( = ?auto_649649 ?auto_649659 ) ) ( not ( = ?auto_649649 ?auto_649660 ) ) ( not ( = ?auto_649649 ?auto_649661 ) ) ( not ( = ?auto_649649 ?auto_649662 ) ) ( not ( = ?auto_649650 ?auto_649651 ) ) ( not ( = ?auto_649650 ?auto_649652 ) ) ( not ( = ?auto_649650 ?auto_649653 ) ) ( not ( = ?auto_649650 ?auto_649654 ) ) ( not ( = ?auto_649650 ?auto_649655 ) ) ( not ( = ?auto_649650 ?auto_649656 ) ) ( not ( = ?auto_649650 ?auto_649657 ) ) ( not ( = ?auto_649650 ?auto_649658 ) ) ( not ( = ?auto_649650 ?auto_649659 ) ) ( not ( = ?auto_649650 ?auto_649660 ) ) ( not ( = ?auto_649650 ?auto_649661 ) ) ( not ( = ?auto_649650 ?auto_649662 ) ) ( not ( = ?auto_649651 ?auto_649652 ) ) ( not ( = ?auto_649651 ?auto_649653 ) ) ( not ( = ?auto_649651 ?auto_649654 ) ) ( not ( = ?auto_649651 ?auto_649655 ) ) ( not ( = ?auto_649651 ?auto_649656 ) ) ( not ( = ?auto_649651 ?auto_649657 ) ) ( not ( = ?auto_649651 ?auto_649658 ) ) ( not ( = ?auto_649651 ?auto_649659 ) ) ( not ( = ?auto_649651 ?auto_649660 ) ) ( not ( = ?auto_649651 ?auto_649661 ) ) ( not ( = ?auto_649651 ?auto_649662 ) ) ( not ( = ?auto_649652 ?auto_649653 ) ) ( not ( = ?auto_649652 ?auto_649654 ) ) ( not ( = ?auto_649652 ?auto_649655 ) ) ( not ( = ?auto_649652 ?auto_649656 ) ) ( not ( = ?auto_649652 ?auto_649657 ) ) ( not ( = ?auto_649652 ?auto_649658 ) ) ( not ( = ?auto_649652 ?auto_649659 ) ) ( not ( = ?auto_649652 ?auto_649660 ) ) ( not ( = ?auto_649652 ?auto_649661 ) ) ( not ( = ?auto_649652 ?auto_649662 ) ) ( not ( = ?auto_649653 ?auto_649654 ) ) ( not ( = ?auto_649653 ?auto_649655 ) ) ( not ( = ?auto_649653 ?auto_649656 ) ) ( not ( = ?auto_649653 ?auto_649657 ) ) ( not ( = ?auto_649653 ?auto_649658 ) ) ( not ( = ?auto_649653 ?auto_649659 ) ) ( not ( = ?auto_649653 ?auto_649660 ) ) ( not ( = ?auto_649653 ?auto_649661 ) ) ( not ( = ?auto_649653 ?auto_649662 ) ) ( not ( = ?auto_649654 ?auto_649655 ) ) ( not ( = ?auto_649654 ?auto_649656 ) ) ( not ( = ?auto_649654 ?auto_649657 ) ) ( not ( = ?auto_649654 ?auto_649658 ) ) ( not ( = ?auto_649654 ?auto_649659 ) ) ( not ( = ?auto_649654 ?auto_649660 ) ) ( not ( = ?auto_649654 ?auto_649661 ) ) ( not ( = ?auto_649654 ?auto_649662 ) ) ( not ( = ?auto_649655 ?auto_649656 ) ) ( not ( = ?auto_649655 ?auto_649657 ) ) ( not ( = ?auto_649655 ?auto_649658 ) ) ( not ( = ?auto_649655 ?auto_649659 ) ) ( not ( = ?auto_649655 ?auto_649660 ) ) ( not ( = ?auto_649655 ?auto_649661 ) ) ( not ( = ?auto_649655 ?auto_649662 ) ) ( not ( = ?auto_649656 ?auto_649657 ) ) ( not ( = ?auto_649656 ?auto_649658 ) ) ( not ( = ?auto_649656 ?auto_649659 ) ) ( not ( = ?auto_649656 ?auto_649660 ) ) ( not ( = ?auto_649656 ?auto_649661 ) ) ( not ( = ?auto_649656 ?auto_649662 ) ) ( not ( = ?auto_649657 ?auto_649658 ) ) ( not ( = ?auto_649657 ?auto_649659 ) ) ( not ( = ?auto_649657 ?auto_649660 ) ) ( not ( = ?auto_649657 ?auto_649661 ) ) ( not ( = ?auto_649657 ?auto_649662 ) ) ( not ( = ?auto_649658 ?auto_649659 ) ) ( not ( = ?auto_649658 ?auto_649660 ) ) ( not ( = ?auto_649658 ?auto_649661 ) ) ( not ( = ?auto_649658 ?auto_649662 ) ) ( not ( = ?auto_649659 ?auto_649660 ) ) ( not ( = ?auto_649659 ?auto_649661 ) ) ( not ( = ?auto_649659 ?auto_649662 ) ) ( not ( = ?auto_649660 ?auto_649661 ) ) ( not ( = ?auto_649660 ?auto_649662 ) ) ( not ( = ?auto_649661 ?auto_649662 ) ) ( ON ?auto_649661 ?auto_649662 ) ( ON ?auto_649660 ?auto_649661 ) ( ON ?auto_649659 ?auto_649660 ) ( ON ?auto_649658 ?auto_649659 ) ( ON ?auto_649657 ?auto_649658 ) ( ON ?auto_649656 ?auto_649657 ) ( ON ?auto_649655 ?auto_649656 ) ( ON ?auto_649654 ?auto_649655 ) ( ON ?auto_649653 ?auto_649654 ) ( CLEAR ?auto_649651 ) ( ON ?auto_649652 ?auto_649653 ) ( CLEAR ?auto_649652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_649646 ?auto_649647 ?auto_649648 ?auto_649649 ?auto_649650 ?auto_649651 ?auto_649652 )
      ( MAKE-17PILE ?auto_649646 ?auto_649647 ?auto_649648 ?auto_649649 ?auto_649650 ?auto_649651 ?auto_649652 ?auto_649653 ?auto_649654 ?auto_649655 ?auto_649656 ?auto_649657 ?auto_649658 ?auto_649659 ?auto_649660 ?auto_649661 ?auto_649662 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649680 - BLOCK
      ?auto_649681 - BLOCK
      ?auto_649682 - BLOCK
      ?auto_649683 - BLOCK
      ?auto_649684 - BLOCK
      ?auto_649685 - BLOCK
      ?auto_649686 - BLOCK
      ?auto_649687 - BLOCK
      ?auto_649688 - BLOCK
      ?auto_649689 - BLOCK
      ?auto_649690 - BLOCK
      ?auto_649691 - BLOCK
      ?auto_649692 - BLOCK
      ?auto_649693 - BLOCK
      ?auto_649694 - BLOCK
      ?auto_649695 - BLOCK
      ?auto_649696 - BLOCK
    )
    :vars
    (
      ?auto_649697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649696 ?auto_649697 ) ( ON-TABLE ?auto_649680 ) ( ON ?auto_649681 ?auto_649680 ) ( ON ?auto_649682 ?auto_649681 ) ( ON ?auto_649683 ?auto_649682 ) ( ON ?auto_649684 ?auto_649683 ) ( not ( = ?auto_649680 ?auto_649681 ) ) ( not ( = ?auto_649680 ?auto_649682 ) ) ( not ( = ?auto_649680 ?auto_649683 ) ) ( not ( = ?auto_649680 ?auto_649684 ) ) ( not ( = ?auto_649680 ?auto_649685 ) ) ( not ( = ?auto_649680 ?auto_649686 ) ) ( not ( = ?auto_649680 ?auto_649687 ) ) ( not ( = ?auto_649680 ?auto_649688 ) ) ( not ( = ?auto_649680 ?auto_649689 ) ) ( not ( = ?auto_649680 ?auto_649690 ) ) ( not ( = ?auto_649680 ?auto_649691 ) ) ( not ( = ?auto_649680 ?auto_649692 ) ) ( not ( = ?auto_649680 ?auto_649693 ) ) ( not ( = ?auto_649680 ?auto_649694 ) ) ( not ( = ?auto_649680 ?auto_649695 ) ) ( not ( = ?auto_649680 ?auto_649696 ) ) ( not ( = ?auto_649680 ?auto_649697 ) ) ( not ( = ?auto_649681 ?auto_649682 ) ) ( not ( = ?auto_649681 ?auto_649683 ) ) ( not ( = ?auto_649681 ?auto_649684 ) ) ( not ( = ?auto_649681 ?auto_649685 ) ) ( not ( = ?auto_649681 ?auto_649686 ) ) ( not ( = ?auto_649681 ?auto_649687 ) ) ( not ( = ?auto_649681 ?auto_649688 ) ) ( not ( = ?auto_649681 ?auto_649689 ) ) ( not ( = ?auto_649681 ?auto_649690 ) ) ( not ( = ?auto_649681 ?auto_649691 ) ) ( not ( = ?auto_649681 ?auto_649692 ) ) ( not ( = ?auto_649681 ?auto_649693 ) ) ( not ( = ?auto_649681 ?auto_649694 ) ) ( not ( = ?auto_649681 ?auto_649695 ) ) ( not ( = ?auto_649681 ?auto_649696 ) ) ( not ( = ?auto_649681 ?auto_649697 ) ) ( not ( = ?auto_649682 ?auto_649683 ) ) ( not ( = ?auto_649682 ?auto_649684 ) ) ( not ( = ?auto_649682 ?auto_649685 ) ) ( not ( = ?auto_649682 ?auto_649686 ) ) ( not ( = ?auto_649682 ?auto_649687 ) ) ( not ( = ?auto_649682 ?auto_649688 ) ) ( not ( = ?auto_649682 ?auto_649689 ) ) ( not ( = ?auto_649682 ?auto_649690 ) ) ( not ( = ?auto_649682 ?auto_649691 ) ) ( not ( = ?auto_649682 ?auto_649692 ) ) ( not ( = ?auto_649682 ?auto_649693 ) ) ( not ( = ?auto_649682 ?auto_649694 ) ) ( not ( = ?auto_649682 ?auto_649695 ) ) ( not ( = ?auto_649682 ?auto_649696 ) ) ( not ( = ?auto_649682 ?auto_649697 ) ) ( not ( = ?auto_649683 ?auto_649684 ) ) ( not ( = ?auto_649683 ?auto_649685 ) ) ( not ( = ?auto_649683 ?auto_649686 ) ) ( not ( = ?auto_649683 ?auto_649687 ) ) ( not ( = ?auto_649683 ?auto_649688 ) ) ( not ( = ?auto_649683 ?auto_649689 ) ) ( not ( = ?auto_649683 ?auto_649690 ) ) ( not ( = ?auto_649683 ?auto_649691 ) ) ( not ( = ?auto_649683 ?auto_649692 ) ) ( not ( = ?auto_649683 ?auto_649693 ) ) ( not ( = ?auto_649683 ?auto_649694 ) ) ( not ( = ?auto_649683 ?auto_649695 ) ) ( not ( = ?auto_649683 ?auto_649696 ) ) ( not ( = ?auto_649683 ?auto_649697 ) ) ( not ( = ?auto_649684 ?auto_649685 ) ) ( not ( = ?auto_649684 ?auto_649686 ) ) ( not ( = ?auto_649684 ?auto_649687 ) ) ( not ( = ?auto_649684 ?auto_649688 ) ) ( not ( = ?auto_649684 ?auto_649689 ) ) ( not ( = ?auto_649684 ?auto_649690 ) ) ( not ( = ?auto_649684 ?auto_649691 ) ) ( not ( = ?auto_649684 ?auto_649692 ) ) ( not ( = ?auto_649684 ?auto_649693 ) ) ( not ( = ?auto_649684 ?auto_649694 ) ) ( not ( = ?auto_649684 ?auto_649695 ) ) ( not ( = ?auto_649684 ?auto_649696 ) ) ( not ( = ?auto_649684 ?auto_649697 ) ) ( not ( = ?auto_649685 ?auto_649686 ) ) ( not ( = ?auto_649685 ?auto_649687 ) ) ( not ( = ?auto_649685 ?auto_649688 ) ) ( not ( = ?auto_649685 ?auto_649689 ) ) ( not ( = ?auto_649685 ?auto_649690 ) ) ( not ( = ?auto_649685 ?auto_649691 ) ) ( not ( = ?auto_649685 ?auto_649692 ) ) ( not ( = ?auto_649685 ?auto_649693 ) ) ( not ( = ?auto_649685 ?auto_649694 ) ) ( not ( = ?auto_649685 ?auto_649695 ) ) ( not ( = ?auto_649685 ?auto_649696 ) ) ( not ( = ?auto_649685 ?auto_649697 ) ) ( not ( = ?auto_649686 ?auto_649687 ) ) ( not ( = ?auto_649686 ?auto_649688 ) ) ( not ( = ?auto_649686 ?auto_649689 ) ) ( not ( = ?auto_649686 ?auto_649690 ) ) ( not ( = ?auto_649686 ?auto_649691 ) ) ( not ( = ?auto_649686 ?auto_649692 ) ) ( not ( = ?auto_649686 ?auto_649693 ) ) ( not ( = ?auto_649686 ?auto_649694 ) ) ( not ( = ?auto_649686 ?auto_649695 ) ) ( not ( = ?auto_649686 ?auto_649696 ) ) ( not ( = ?auto_649686 ?auto_649697 ) ) ( not ( = ?auto_649687 ?auto_649688 ) ) ( not ( = ?auto_649687 ?auto_649689 ) ) ( not ( = ?auto_649687 ?auto_649690 ) ) ( not ( = ?auto_649687 ?auto_649691 ) ) ( not ( = ?auto_649687 ?auto_649692 ) ) ( not ( = ?auto_649687 ?auto_649693 ) ) ( not ( = ?auto_649687 ?auto_649694 ) ) ( not ( = ?auto_649687 ?auto_649695 ) ) ( not ( = ?auto_649687 ?auto_649696 ) ) ( not ( = ?auto_649687 ?auto_649697 ) ) ( not ( = ?auto_649688 ?auto_649689 ) ) ( not ( = ?auto_649688 ?auto_649690 ) ) ( not ( = ?auto_649688 ?auto_649691 ) ) ( not ( = ?auto_649688 ?auto_649692 ) ) ( not ( = ?auto_649688 ?auto_649693 ) ) ( not ( = ?auto_649688 ?auto_649694 ) ) ( not ( = ?auto_649688 ?auto_649695 ) ) ( not ( = ?auto_649688 ?auto_649696 ) ) ( not ( = ?auto_649688 ?auto_649697 ) ) ( not ( = ?auto_649689 ?auto_649690 ) ) ( not ( = ?auto_649689 ?auto_649691 ) ) ( not ( = ?auto_649689 ?auto_649692 ) ) ( not ( = ?auto_649689 ?auto_649693 ) ) ( not ( = ?auto_649689 ?auto_649694 ) ) ( not ( = ?auto_649689 ?auto_649695 ) ) ( not ( = ?auto_649689 ?auto_649696 ) ) ( not ( = ?auto_649689 ?auto_649697 ) ) ( not ( = ?auto_649690 ?auto_649691 ) ) ( not ( = ?auto_649690 ?auto_649692 ) ) ( not ( = ?auto_649690 ?auto_649693 ) ) ( not ( = ?auto_649690 ?auto_649694 ) ) ( not ( = ?auto_649690 ?auto_649695 ) ) ( not ( = ?auto_649690 ?auto_649696 ) ) ( not ( = ?auto_649690 ?auto_649697 ) ) ( not ( = ?auto_649691 ?auto_649692 ) ) ( not ( = ?auto_649691 ?auto_649693 ) ) ( not ( = ?auto_649691 ?auto_649694 ) ) ( not ( = ?auto_649691 ?auto_649695 ) ) ( not ( = ?auto_649691 ?auto_649696 ) ) ( not ( = ?auto_649691 ?auto_649697 ) ) ( not ( = ?auto_649692 ?auto_649693 ) ) ( not ( = ?auto_649692 ?auto_649694 ) ) ( not ( = ?auto_649692 ?auto_649695 ) ) ( not ( = ?auto_649692 ?auto_649696 ) ) ( not ( = ?auto_649692 ?auto_649697 ) ) ( not ( = ?auto_649693 ?auto_649694 ) ) ( not ( = ?auto_649693 ?auto_649695 ) ) ( not ( = ?auto_649693 ?auto_649696 ) ) ( not ( = ?auto_649693 ?auto_649697 ) ) ( not ( = ?auto_649694 ?auto_649695 ) ) ( not ( = ?auto_649694 ?auto_649696 ) ) ( not ( = ?auto_649694 ?auto_649697 ) ) ( not ( = ?auto_649695 ?auto_649696 ) ) ( not ( = ?auto_649695 ?auto_649697 ) ) ( not ( = ?auto_649696 ?auto_649697 ) ) ( ON ?auto_649695 ?auto_649696 ) ( ON ?auto_649694 ?auto_649695 ) ( ON ?auto_649693 ?auto_649694 ) ( ON ?auto_649692 ?auto_649693 ) ( ON ?auto_649691 ?auto_649692 ) ( ON ?auto_649690 ?auto_649691 ) ( ON ?auto_649689 ?auto_649690 ) ( ON ?auto_649688 ?auto_649689 ) ( ON ?auto_649687 ?auto_649688 ) ( ON ?auto_649686 ?auto_649687 ) ( CLEAR ?auto_649684 ) ( ON ?auto_649685 ?auto_649686 ) ( CLEAR ?auto_649685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_649680 ?auto_649681 ?auto_649682 ?auto_649683 ?auto_649684 ?auto_649685 )
      ( MAKE-17PILE ?auto_649680 ?auto_649681 ?auto_649682 ?auto_649683 ?auto_649684 ?auto_649685 ?auto_649686 ?auto_649687 ?auto_649688 ?auto_649689 ?auto_649690 ?auto_649691 ?auto_649692 ?auto_649693 ?auto_649694 ?auto_649695 ?auto_649696 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649715 - BLOCK
      ?auto_649716 - BLOCK
      ?auto_649717 - BLOCK
      ?auto_649718 - BLOCK
      ?auto_649719 - BLOCK
      ?auto_649720 - BLOCK
      ?auto_649721 - BLOCK
      ?auto_649722 - BLOCK
      ?auto_649723 - BLOCK
      ?auto_649724 - BLOCK
      ?auto_649725 - BLOCK
      ?auto_649726 - BLOCK
      ?auto_649727 - BLOCK
      ?auto_649728 - BLOCK
      ?auto_649729 - BLOCK
      ?auto_649730 - BLOCK
      ?auto_649731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649731 ) ( ON-TABLE ?auto_649715 ) ( ON ?auto_649716 ?auto_649715 ) ( ON ?auto_649717 ?auto_649716 ) ( ON ?auto_649718 ?auto_649717 ) ( ON ?auto_649719 ?auto_649718 ) ( not ( = ?auto_649715 ?auto_649716 ) ) ( not ( = ?auto_649715 ?auto_649717 ) ) ( not ( = ?auto_649715 ?auto_649718 ) ) ( not ( = ?auto_649715 ?auto_649719 ) ) ( not ( = ?auto_649715 ?auto_649720 ) ) ( not ( = ?auto_649715 ?auto_649721 ) ) ( not ( = ?auto_649715 ?auto_649722 ) ) ( not ( = ?auto_649715 ?auto_649723 ) ) ( not ( = ?auto_649715 ?auto_649724 ) ) ( not ( = ?auto_649715 ?auto_649725 ) ) ( not ( = ?auto_649715 ?auto_649726 ) ) ( not ( = ?auto_649715 ?auto_649727 ) ) ( not ( = ?auto_649715 ?auto_649728 ) ) ( not ( = ?auto_649715 ?auto_649729 ) ) ( not ( = ?auto_649715 ?auto_649730 ) ) ( not ( = ?auto_649715 ?auto_649731 ) ) ( not ( = ?auto_649716 ?auto_649717 ) ) ( not ( = ?auto_649716 ?auto_649718 ) ) ( not ( = ?auto_649716 ?auto_649719 ) ) ( not ( = ?auto_649716 ?auto_649720 ) ) ( not ( = ?auto_649716 ?auto_649721 ) ) ( not ( = ?auto_649716 ?auto_649722 ) ) ( not ( = ?auto_649716 ?auto_649723 ) ) ( not ( = ?auto_649716 ?auto_649724 ) ) ( not ( = ?auto_649716 ?auto_649725 ) ) ( not ( = ?auto_649716 ?auto_649726 ) ) ( not ( = ?auto_649716 ?auto_649727 ) ) ( not ( = ?auto_649716 ?auto_649728 ) ) ( not ( = ?auto_649716 ?auto_649729 ) ) ( not ( = ?auto_649716 ?auto_649730 ) ) ( not ( = ?auto_649716 ?auto_649731 ) ) ( not ( = ?auto_649717 ?auto_649718 ) ) ( not ( = ?auto_649717 ?auto_649719 ) ) ( not ( = ?auto_649717 ?auto_649720 ) ) ( not ( = ?auto_649717 ?auto_649721 ) ) ( not ( = ?auto_649717 ?auto_649722 ) ) ( not ( = ?auto_649717 ?auto_649723 ) ) ( not ( = ?auto_649717 ?auto_649724 ) ) ( not ( = ?auto_649717 ?auto_649725 ) ) ( not ( = ?auto_649717 ?auto_649726 ) ) ( not ( = ?auto_649717 ?auto_649727 ) ) ( not ( = ?auto_649717 ?auto_649728 ) ) ( not ( = ?auto_649717 ?auto_649729 ) ) ( not ( = ?auto_649717 ?auto_649730 ) ) ( not ( = ?auto_649717 ?auto_649731 ) ) ( not ( = ?auto_649718 ?auto_649719 ) ) ( not ( = ?auto_649718 ?auto_649720 ) ) ( not ( = ?auto_649718 ?auto_649721 ) ) ( not ( = ?auto_649718 ?auto_649722 ) ) ( not ( = ?auto_649718 ?auto_649723 ) ) ( not ( = ?auto_649718 ?auto_649724 ) ) ( not ( = ?auto_649718 ?auto_649725 ) ) ( not ( = ?auto_649718 ?auto_649726 ) ) ( not ( = ?auto_649718 ?auto_649727 ) ) ( not ( = ?auto_649718 ?auto_649728 ) ) ( not ( = ?auto_649718 ?auto_649729 ) ) ( not ( = ?auto_649718 ?auto_649730 ) ) ( not ( = ?auto_649718 ?auto_649731 ) ) ( not ( = ?auto_649719 ?auto_649720 ) ) ( not ( = ?auto_649719 ?auto_649721 ) ) ( not ( = ?auto_649719 ?auto_649722 ) ) ( not ( = ?auto_649719 ?auto_649723 ) ) ( not ( = ?auto_649719 ?auto_649724 ) ) ( not ( = ?auto_649719 ?auto_649725 ) ) ( not ( = ?auto_649719 ?auto_649726 ) ) ( not ( = ?auto_649719 ?auto_649727 ) ) ( not ( = ?auto_649719 ?auto_649728 ) ) ( not ( = ?auto_649719 ?auto_649729 ) ) ( not ( = ?auto_649719 ?auto_649730 ) ) ( not ( = ?auto_649719 ?auto_649731 ) ) ( not ( = ?auto_649720 ?auto_649721 ) ) ( not ( = ?auto_649720 ?auto_649722 ) ) ( not ( = ?auto_649720 ?auto_649723 ) ) ( not ( = ?auto_649720 ?auto_649724 ) ) ( not ( = ?auto_649720 ?auto_649725 ) ) ( not ( = ?auto_649720 ?auto_649726 ) ) ( not ( = ?auto_649720 ?auto_649727 ) ) ( not ( = ?auto_649720 ?auto_649728 ) ) ( not ( = ?auto_649720 ?auto_649729 ) ) ( not ( = ?auto_649720 ?auto_649730 ) ) ( not ( = ?auto_649720 ?auto_649731 ) ) ( not ( = ?auto_649721 ?auto_649722 ) ) ( not ( = ?auto_649721 ?auto_649723 ) ) ( not ( = ?auto_649721 ?auto_649724 ) ) ( not ( = ?auto_649721 ?auto_649725 ) ) ( not ( = ?auto_649721 ?auto_649726 ) ) ( not ( = ?auto_649721 ?auto_649727 ) ) ( not ( = ?auto_649721 ?auto_649728 ) ) ( not ( = ?auto_649721 ?auto_649729 ) ) ( not ( = ?auto_649721 ?auto_649730 ) ) ( not ( = ?auto_649721 ?auto_649731 ) ) ( not ( = ?auto_649722 ?auto_649723 ) ) ( not ( = ?auto_649722 ?auto_649724 ) ) ( not ( = ?auto_649722 ?auto_649725 ) ) ( not ( = ?auto_649722 ?auto_649726 ) ) ( not ( = ?auto_649722 ?auto_649727 ) ) ( not ( = ?auto_649722 ?auto_649728 ) ) ( not ( = ?auto_649722 ?auto_649729 ) ) ( not ( = ?auto_649722 ?auto_649730 ) ) ( not ( = ?auto_649722 ?auto_649731 ) ) ( not ( = ?auto_649723 ?auto_649724 ) ) ( not ( = ?auto_649723 ?auto_649725 ) ) ( not ( = ?auto_649723 ?auto_649726 ) ) ( not ( = ?auto_649723 ?auto_649727 ) ) ( not ( = ?auto_649723 ?auto_649728 ) ) ( not ( = ?auto_649723 ?auto_649729 ) ) ( not ( = ?auto_649723 ?auto_649730 ) ) ( not ( = ?auto_649723 ?auto_649731 ) ) ( not ( = ?auto_649724 ?auto_649725 ) ) ( not ( = ?auto_649724 ?auto_649726 ) ) ( not ( = ?auto_649724 ?auto_649727 ) ) ( not ( = ?auto_649724 ?auto_649728 ) ) ( not ( = ?auto_649724 ?auto_649729 ) ) ( not ( = ?auto_649724 ?auto_649730 ) ) ( not ( = ?auto_649724 ?auto_649731 ) ) ( not ( = ?auto_649725 ?auto_649726 ) ) ( not ( = ?auto_649725 ?auto_649727 ) ) ( not ( = ?auto_649725 ?auto_649728 ) ) ( not ( = ?auto_649725 ?auto_649729 ) ) ( not ( = ?auto_649725 ?auto_649730 ) ) ( not ( = ?auto_649725 ?auto_649731 ) ) ( not ( = ?auto_649726 ?auto_649727 ) ) ( not ( = ?auto_649726 ?auto_649728 ) ) ( not ( = ?auto_649726 ?auto_649729 ) ) ( not ( = ?auto_649726 ?auto_649730 ) ) ( not ( = ?auto_649726 ?auto_649731 ) ) ( not ( = ?auto_649727 ?auto_649728 ) ) ( not ( = ?auto_649727 ?auto_649729 ) ) ( not ( = ?auto_649727 ?auto_649730 ) ) ( not ( = ?auto_649727 ?auto_649731 ) ) ( not ( = ?auto_649728 ?auto_649729 ) ) ( not ( = ?auto_649728 ?auto_649730 ) ) ( not ( = ?auto_649728 ?auto_649731 ) ) ( not ( = ?auto_649729 ?auto_649730 ) ) ( not ( = ?auto_649729 ?auto_649731 ) ) ( not ( = ?auto_649730 ?auto_649731 ) ) ( ON ?auto_649730 ?auto_649731 ) ( ON ?auto_649729 ?auto_649730 ) ( ON ?auto_649728 ?auto_649729 ) ( ON ?auto_649727 ?auto_649728 ) ( ON ?auto_649726 ?auto_649727 ) ( ON ?auto_649725 ?auto_649726 ) ( ON ?auto_649724 ?auto_649725 ) ( ON ?auto_649723 ?auto_649724 ) ( ON ?auto_649722 ?auto_649723 ) ( ON ?auto_649721 ?auto_649722 ) ( CLEAR ?auto_649719 ) ( ON ?auto_649720 ?auto_649721 ) ( CLEAR ?auto_649720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_649715 ?auto_649716 ?auto_649717 ?auto_649718 ?auto_649719 ?auto_649720 )
      ( MAKE-17PILE ?auto_649715 ?auto_649716 ?auto_649717 ?auto_649718 ?auto_649719 ?auto_649720 ?auto_649721 ?auto_649722 ?auto_649723 ?auto_649724 ?auto_649725 ?auto_649726 ?auto_649727 ?auto_649728 ?auto_649729 ?auto_649730 ?auto_649731 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649749 - BLOCK
      ?auto_649750 - BLOCK
      ?auto_649751 - BLOCK
      ?auto_649752 - BLOCK
      ?auto_649753 - BLOCK
      ?auto_649754 - BLOCK
      ?auto_649755 - BLOCK
      ?auto_649756 - BLOCK
      ?auto_649757 - BLOCK
      ?auto_649758 - BLOCK
      ?auto_649759 - BLOCK
      ?auto_649760 - BLOCK
      ?auto_649761 - BLOCK
      ?auto_649762 - BLOCK
      ?auto_649763 - BLOCK
      ?auto_649764 - BLOCK
      ?auto_649765 - BLOCK
    )
    :vars
    (
      ?auto_649766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649765 ?auto_649766 ) ( ON-TABLE ?auto_649749 ) ( ON ?auto_649750 ?auto_649749 ) ( ON ?auto_649751 ?auto_649750 ) ( ON ?auto_649752 ?auto_649751 ) ( not ( = ?auto_649749 ?auto_649750 ) ) ( not ( = ?auto_649749 ?auto_649751 ) ) ( not ( = ?auto_649749 ?auto_649752 ) ) ( not ( = ?auto_649749 ?auto_649753 ) ) ( not ( = ?auto_649749 ?auto_649754 ) ) ( not ( = ?auto_649749 ?auto_649755 ) ) ( not ( = ?auto_649749 ?auto_649756 ) ) ( not ( = ?auto_649749 ?auto_649757 ) ) ( not ( = ?auto_649749 ?auto_649758 ) ) ( not ( = ?auto_649749 ?auto_649759 ) ) ( not ( = ?auto_649749 ?auto_649760 ) ) ( not ( = ?auto_649749 ?auto_649761 ) ) ( not ( = ?auto_649749 ?auto_649762 ) ) ( not ( = ?auto_649749 ?auto_649763 ) ) ( not ( = ?auto_649749 ?auto_649764 ) ) ( not ( = ?auto_649749 ?auto_649765 ) ) ( not ( = ?auto_649749 ?auto_649766 ) ) ( not ( = ?auto_649750 ?auto_649751 ) ) ( not ( = ?auto_649750 ?auto_649752 ) ) ( not ( = ?auto_649750 ?auto_649753 ) ) ( not ( = ?auto_649750 ?auto_649754 ) ) ( not ( = ?auto_649750 ?auto_649755 ) ) ( not ( = ?auto_649750 ?auto_649756 ) ) ( not ( = ?auto_649750 ?auto_649757 ) ) ( not ( = ?auto_649750 ?auto_649758 ) ) ( not ( = ?auto_649750 ?auto_649759 ) ) ( not ( = ?auto_649750 ?auto_649760 ) ) ( not ( = ?auto_649750 ?auto_649761 ) ) ( not ( = ?auto_649750 ?auto_649762 ) ) ( not ( = ?auto_649750 ?auto_649763 ) ) ( not ( = ?auto_649750 ?auto_649764 ) ) ( not ( = ?auto_649750 ?auto_649765 ) ) ( not ( = ?auto_649750 ?auto_649766 ) ) ( not ( = ?auto_649751 ?auto_649752 ) ) ( not ( = ?auto_649751 ?auto_649753 ) ) ( not ( = ?auto_649751 ?auto_649754 ) ) ( not ( = ?auto_649751 ?auto_649755 ) ) ( not ( = ?auto_649751 ?auto_649756 ) ) ( not ( = ?auto_649751 ?auto_649757 ) ) ( not ( = ?auto_649751 ?auto_649758 ) ) ( not ( = ?auto_649751 ?auto_649759 ) ) ( not ( = ?auto_649751 ?auto_649760 ) ) ( not ( = ?auto_649751 ?auto_649761 ) ) ( not ( = ?auto_649751 ?auto_649762 ) ) ( not ( = ?auto_649751 ?auto_649763 ) ) ( not ( = ?auto_649751 ?auto_649764 ) ) ( not ( = ?auto_649751 ?auto_649765 ) ) ( not ( = ?auto_649751 ?auto_649766 ) ) ( not ( = ?auto_649752 ?auto_649753 ) ) ( not ( = ?auto_649752 ?auto_649754 ) ) ( not ( = ?auto_649752 ?auto_649755 ) ) ( not ( = ?auto_649752 ?auto_649756 ) ) ( not ( = ?auto_649752 ?auto_649757 ) ) ( not ( = ?auto_649752 ?auto_649758 ) ) ( not ( = ?auto_649752 ?auto_649759 ) ) ( not ( = ?auto_649752 ?auto_649760 ) ) ( not ( = ?auto_649752 ?auto_649761 ) ) ( not ( = ?auto_649752 ?auto_649762 ) ) ( not ( = ?auto_649752 ?auto_649763 ) ) ( not ( = ?auto_649752 ?auto_649764 ) ) ( not ( = ?auto_649752 ?auto_649765 ) ) ( not ( = ?auto_649752 ?auto_649766 ) ) ( not ( = ?auto_649753 ?auto_649754 ) ) ( not ( = ?auto_649753 ?auto_649755 ) ) ( not ( = ?auto_649753 ?auto_649756 ) ) ( not ( = ?auto_649753 ?auto_649757 ) ) ( not ( = ?auto_649753 ?auto_649758 ) ) ( not ( = ?auto_649753 ?auto_649759 ) ) ( not ( = ?auto_649753 ?auto_649760 ) ) ( not ( = ?auto_649753 ?auto_649761 ) ) ( not ( = ?auto_649753 ?auto_649762 ) ) ( not ( = ?auto_649753 ?auto_649763 ) ) ( not ( = ?auto_649753 ?auto_649764 ) ) ( not ( = ?auto_649753 ?auto_649765 ) ) ( not ( = ?auto_649753 ?auto_649766 ) ) ( not ( = ?auto_649754 ?auto_649755 ) ) ( not ( = ?auto_649754 ?auto_649756 ) ) ( not ( = ?auto_649754 ?auto_649757 ) ) ( not ( = ?auto_649754 ?auto_649758 ) ) ( not ( = ?auto_649754 ?auto_649759 ) ) ( not ( = ?auto_649754 ?auto_649760 ) ) ( not ( = ?auto_649754 ?auto_649761 ) ) ( not ( = ?auto_649754 ?auto_649762 ) ) ( not ( = ?auto_649754 ?auto_649763 ) ) ( not ( = ?auto_649754 ?auto_649764 ) ) ( not ( = ?auto_649754 ?auto_649765 ) ) ( not ( = ?auto_649754 ?auto_649766 ) ) ( not ( = ?auto_649755 ?auto_649756 ) ) ( not ( = ?auto_649755 ?auto_649757 ) ) ( not ( = ?auto_649755 ?auto_649758 ) ) ( not ( = ?auto_649755 ?auto_649759 ) ) ( not ( = ?auto_649755 ?auto_649760 ) ) ( not ( = ?auto_649755 ?auto_649761 ) ) ( not ( = ?auto_649755 ?auto_649762 ) ) ( not ( = ?auto_649755 ?auto_649763 ) ) ( not ( = ?auto_649755 ?auto_649764 ) ) ( not ( = ?auto_649755 ?auto_649765 ) ) ( not ( = ?auto_649755 ?auto_649766 ) ) ( not ( = ?auto_649756 ?auto_649757 ) ) ( not ( = ?auto_649756 ?auto_649758 ) ) ( not ( = ?auto_649756 ?auto_649759 ) ) ( not ( = ?auto_649756 ?auto_649760 ) ) ( not ( = ?auto_649756 ?auto_649761 ) ) ( not ( = ?auto_649756 ?auto_649762 ) ) ( not ( = ?auto_649756 ?auto_649763 ) ) ( not ( = ?auto_649756 ?auto_649764 ) ) ( not ( = ?auto_649756 ?auto_649765 ) ) ( not ( = ?auto_649756 ?auto_649766 ) ) ( not ( = ?auto_649757 ?auto_649758 ) ) ( not ( = ?auto_649757 ?auto_649759 ) ) ( not ( = ?auto_649757 ?auto_649760 ) ) ( not ( = ?auto_649757 ?auto_649761 ) ) ( not ( = ?auto_649757 ?auto_649762 ) ) ( not ( = ?auto_649757 ?auto_649763 ) ) ( not ( = ?auto_649757 ?auto_649764 ) ) ( not ( = ?auto_649757 ?auto_649765 ) ) ( not ( = ?auto_649757 ?auto_649766 ) ) ( not ( = ?auto_649758 ?auto_649759 ) ) ( not ( = ?auto_649758 ?auto_649760 ) ) ( not ( = ?auto_649758 ?auto_649761 ) ) ( not ( = ?auto_649758 ?auto_649762 ) ) ( not ( = ?auto_649758 ?auto_649763 ) ) ( not ( = ?auto_649758 ?auto_649764 ) ) ( not ( = ?auto_649758 ?auto_649765 ) ) ( not ( = ?auto_649758 ?auto_649766 ) ) ( not ( = ?auto_649759 ?auto_649760 ) ) ( not ( = ?auto_649759 ?auto_649761 ) ) ( not ( = ?auto_649759 ?auto_649762 ) ) ( not ( = ?auto_649759 ?auto_649763 ) ) ( not ( = ?auto_649759 ?auto_649764 ) ) ( not ( = ?auto_649759 ?auto_649765 ) ) ( not ( = ?auto_649759 ?auto_649766 ) ) ( not ( = ?auto_649760 ?auto_649761 ) ) ( not ( = ?auto_649760 ?auto_649762 ) ) ( not ( = ?auto_649760 ?auto_649763 ) ) ( not ( = ?auto_649760 ?auto_649764 ) ) ( not ( = ?auto_649760 ?auto_649765 ) ) ( not ( = ?auto_649760 ?auto_649766 ) ) ( not ( = ?auto_649761 ?auto_649762 ) ) ( not ( = ?auto_649761 ?auto_649763 ) ) ( not ( = ?auto_649761 ?auto_649764 ) ) ( not ( = ?auto_649761 ?auto_649765 ) ) ( not ( = ?auto_649761 ?auto_649766 ) ) ( not ( = ?auto_649762 ?auto_649763 ) ) ( not ( = ?auto_649762 ?auto_649764 ) ) ( not ( = ?auto_649762 ?auto_649765 ) ) ( not ( = ?auto_649762 ?auto_649766 ) ) ( not ( = ?auto_649763 ?auto_649764 ) ) ( not ( = ?auto_649763 ?auto_649765 ) ) ( not ( = ?auto_649763 ?auto_649766 ) ) ( not ( = ?auto_649764 ?auto_649765 ) ) ( not ( = ?auto_649764 ?auto_649766 ) ) ( not ( = ?auto_649765 ?auto_649766 ) ) ( ON ?auto_649764 ?auto_649765 ) ( ON ?auto_649763 ?auto_649764 ) ( ON ?auto_649762 ?auto_649763 ) ( ON ?auto_649761 ?auto_649762 ) ( ON ?auto_649760 ?auto_649761 ) ( ON ?auto_649759 ?auto_649760 ) ( ON ?auto_649758 ?auto_649759 ) ( ON ?auto_649757 ?auto_649758 ) ( ON ?auto_649756 ?auto_649757 ) ( ON ?auto_649755 ?auto_649756 ) ( ON ?auto_649754 ?auto_649755 ) ( CLEAR ?auto_649752 ) ( ON ?auto_649753 ?auto_649754 ) ( CLEAR ?auto_649753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_649749 ?auto_649750 ?auto_649751 ?auto_649752 ?auto_649753 )
      ( MAKE-17PILE ?auto_649749 ?auto_649750 ?auto_649751 ?auto_649752 ?auto_649753 ?auto_649754 ?auto_649755 ?auto_649756 ?auto_649757 ?auto_649758 ?auto_649759 ?auto_649760 ?auto_649761 ?auto_649762 ?auto_649763 ?auto_649764 ?auto_649765 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649784 - BLOCK
      ?auto_649785 - BLOCK
      ?auto_649786 - BLOCK
      ?auto_649787 - BLOCK
      ?auto_649788 - BLOCK
      ?auto_649789 - BLOCK
      ?auto_649790 - BLOCK
      ?auto_649791 - BLOCK
      ?auto_649792 - BLOCK
      ?auto_649793 - BLOCK
      ?auto_649794 - BLOCK
      ?auto_649795 - BLOCK
      ?auto_649796 - BLOCK
      ?auto_649797 - BLOCK
      ?auto_649798 - BLOCK
      ?auto_649799 - BLOCK
      ?auto_649800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649800 ) ( ON-TABLE ?auto_649784 ) ( ON ?auto_649785 ?auto_649784 ) ( ON ?auto_649786 ?auto_649785 ) ( ON ?auto_649787 ?auto_649786 ) ( not ( = ?auto_649784 ?auto_649785 ) ) ( not ( = ?auto_649784 ?auto_649786 ) ) ( not ( = ?auto_649784 ?auto_649787 ) ) ( not ( = ?auto_649784 ?auto_649788 ) ) ( not ( = ?auto_649784 ?auto_649789 ) ) ( not ( = ?auto_649784 ?auto_649790 ) ) ( not ( = ?auto_649784 ?auto_649791 ) ) ( not ( = ?auto_649784 ?auto_649792 ) ) ( not ( = ?auto_649784 ?auto_649793 ) ) ( not ( = ?auto_649784 ?auto_649794 ) ) ( not ( = ?auto_649784 ?auto_649795 ) ) ( not ( = ?auto_649784 ?auto_649796 ) ) ( not ( = ?auto_649784 ?auto_649797 ) ) ( not ( = ?auto_649784 ?auto_649798 ) ) ( not ( = ?auto_649784 ?auto_649799 ) ) ( not ( = ?auto_649784 ?auto_649800 ) ) ( not ( = ?auto_649785 ?auto_649786 ) ) ( not ( = ?auto_649785 ?auto_649787 ) ) ( not ( = ?auto_649785 ?auto_649788 ) ) ( not ( = ?auto_649785 ?auto_649789 ) ) ( not ( = ?auto_649785 ?auto_649790 ) ) ( not ( = ?auto_649785 ?auto_649791 ) ) ( not ( = ?auto_649785 ?auto_649792 ) ) ( not ( = ?auto_649785 ?auto_649793 ) ) ( not ( = ?auto_649785 ?auto_649794 ) ) ( not ( = ?auto_649785 ?auto_649795 ) ) ( not ( = ?auto_649785 ?auto_649796 ) ) ( not ( = ?auto_649785 ?auto_649797 ) ) ( not ( = ?auto_649785 ?auto_649798 ) ) ( not ( = ?auto_649785 ?auto_649799 ) ) ( not ( = ?auto_649785 ?auto_649800 ) ) ( not ( = ?auto_649786 ?auto_649787 ) ) ( not ( = ?auto_649786 ?auto_649788 ) ) ( not ( = ?auto_649786 ?auto_649789 ) ) ( not ( = ?auto_649786 ?auto_649790 ) ) ( not ( = ?auto_649786 ?auto_649791 ) ) ( not ( = ?auto_649786 ?auto_649792 ) ) ( not ( = ?auto_649786 ?auto_649793 ) ) ( not ( = ?auto_649786 ?auto_649794 ) ) ( not ( = ?auto_649786 ?auto_649795 ) ) ( not ( = ?auto_649786 ?auto_649796 ) ) ( not ( = ?auto_649786 ?auto_649797 ) ) ( not ( = ?auto_649786 ?auto_649798 ) ) ( not ( = ?auto_649786 ?auto_649799 ) ) ( not ( = ?auto_649786 ?auto_649800 ) ) ( not ( = ?auto_649787 ?auto_649788 ) ) ( not ( = ?auto_649787 ?auto_649789 ) ) ( not ( = ?auto_649787 ?auto_649790 ) ) ( not ( = ?auto_649787 ?auto_649791 ) ) ( not ( = ?auto_649787 ?auto_649792 ) ) ( not ( = ?auto_649787 ?auto_649793 ) ) ( not ( = ?auto_649787 ?auto_649794 ) ) ( not ( = ?auto_649787 ?auto_649795 ) ) ( not ( = ?auto_649787 ?auto_649796 ) ) ( not ( = ?auto_649787 ?auto_649797 ) ) ( not ( = ?auto_649787 ?auto_649798 ) ) ( not ( = ?auto_649787 ?auto_649799 ) ) ( not ( = ?auto_649787 ?auto_649800 ) ) ( not ( = ?auto_649788 ?auto_649789 ) ) ( not ( = ?auto_649788 ?auto_649790 ) ) ( not ( = ?auto_649788 ?auto_649791 ) ) ( not ( = ?auto_649788 ?auto_649792 ) ) ( not ( = ?auto_649788 ?auto_649793 ) ) ( not ( = ?auto_649788 ?auto_649794 ) ) ( not ( = ?auto_649788 ?auto_649795 ) ) ( not ( = ?auto_649788 ?auto_649796 ) ) ( not ( = ?auto_649788 ?auto_649797 ) ) ( not ( = ?auto_649788 ?auto_649798 ) ) ( not ( = ?auto_649788 ?auto_649799 ) ) ( not ( = ?auto_649788 ?auto_649800 ) ) ( not ( = ?auto_649789 ?auto_649790 ) ) ( not ( = ?auto_649789 ?auto_649791 ) ) ( not ( = ?auto_649789 ?auto_649792 ) ) ( not ( = ?auto_649789 ?auto_649793 ) ) ( not ( = ?auto_649789 ?auto_649794 ) ) ( not ( = ?auto_649789 ?auto_649795 ) ) ( not ( = ?auto_649789 ?auto_649796 ) ) ( not ( = ?auto_649789 ?auto_649797 ) ) ( not ( = ?auto_649789 ?auto_649798 ) ) ( not ( = ?auto_649789 ?auto_649799 ) ) ( not ( = ?auto_649789 ?auto_649800 ) ) ( not ( = ?auto_649790 ?auto_649791 ) ) ( not ( = ?auto_649790 ?auto_649792 ) ) ( not ( = ?auto_649790 ?auto_649793 ) ) ( not ( = ?auto_649790 ?auto_649794 ) ) ( not ( = ?auto_649790 ?auto_649795 ) ) ( not ( = ?auto_649790 ?auto_649796 ) ) ( not ( = ?auto_649790 ?auto_649797 ) ) ( not ( = ?auto_649790 ?auto_649798 ) ) ( not ( = ?auto_649790 ?auto_649799 ) ) ( not ( = ?auto_649790 ?auto_649800 ) ) ( not ( = ?auto_649791 ?auto_649792 ) ) ( not ( = ?auto_649791 ?auto_649793 ) ) ( not ( = ?auto_649791 ?auto_649794 ) ) ( not ( = ?auto_649791 ?auto_649795 ) ) ( not ( = ?auto_649791 ?auto_649796 ) ) ( not ( = ?auto_649791 ?auto_649797 ) ) ( not ( = ?auto_649791 ?auto_649798 ) ) ( not ( = ?auto_649791 ?auto_649799 ) ) ( not ( = ?auto_649791 ?auto_649800 ) ) ( not ( = ?auto_649792 ?auto_649793 ) ) ( not ( = ?auto_649792 ?auto_649794 ) ) ( not ( = ?auto_649792 ?auto_649795 ) ) ( not ( = ?auto_649792 ?auto_649796 ) ) ( not ( = ?auto_649792 ?auto_649797 ) ) ( not ( = ?auto_649792 ?auto_649798 ) ) ( not ( = ?auto_649792 ?auto_649799 ) ) ( not ( = ?auto_649792 ?auto_649800 ) ) ( not ( = ?auto_649793 ?auto_649794 ) ) ( not ( = ?auto_649793 ?auto_649795 ) ) ( not ( = ?auto_649793 ?auto_649796 ) ) ( not ( = ?auto_649793 ?auto_649797 ) ) ( not ( = ?auto_649793 ?auto_649798 ) ) ( not ( = ?auto_649793 ?auto_649799 ) ) ( not ( = ?auto_649793 ?auto_649800 ) ) ( not ( = ?auto_649794 ?auto_649795 ) ) ( not ( = ?auto_649794 ?auto_649796 ) ) ( not ( = ?auto_649794 ?auto_649797 ) ) ( not ( = ?auto_649794 ?auto_649798 ) ) ( not ( = ?auto_649794 ?auto_649799 ) ) ( not ( = ?auto_649794 ?auto_649800 ) ) ( not ( = ?auto_649795 ?auto_649796 ) ) ( not ( = ?auto_649795 ?auto_649797 ) ) ( not ( = ?auto_649795 ?auto_649798 ) ) ( not ( = ?auto_649795 ?auto_649799 ) ) ( not ( = ?auto_649795 ?auto_649800 ) ) ( not ( = ?auto_649796 ?auto_649797 ) ) ( not ( = ?auto_649796 ?auto_649798 ) ) ( not ( = ?auto_649796 ?auto_649799 ) ) ( not ( = ?auto_649796 ?auto_649800 ) ) ( not ( = ?auto_649797 ?auto_649798 ) ) ( not ( = ?auto_649797 ?auto_649799 ) ) ( not ( = ?auto_649797 ?auto_649800 ) ) ( not ( = ?auto_649798 ?auto_649799 ) ) ( not ( = ?auto_649798 ?auto_649800 ) ) ( not ( = ?auto_649799 ?auto_649800 ) ) ( ON ?auto_649799 ?auto_649800 ) ( ON ?auto_649798 ?auto_649799 ) ( ON ?auto_649797 ?auto_649798 ) ( ON ?auto_649796 ?auto_649797 ) ( ON ?auto_649795 ?auto_649796 ) ( ON ?auto_649794 ?auto_649795 ) ( ON ?auto_649793 ?auto_649794 ) ( ON ?auto_649792 ?auto_649793 ) ( ON ?auto_649791 ?auto_649792 ) ( ON ?auto_649790 ?auto_649791 ) ( ON ?auto_649789 ?auto_649790 ) ( CLEAR ?auto_649787 ) ( ON ?auto_649788 ?auto_649789 ) ( CLEAR ?auto_649788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_649784 ?auto_649785 ?auto_649786 ?auto_649787 ?auto_649788 )
      ( MAKE-17PILE ?auto_649784 ?auto_649785 ?auto_649786 ?auto_649787 ?auto_649788 ?auto_649789 ?auto_649790 ?auto_649791 ?auto_649792 ?auto_649793 ?auto_649794 ?auto_649795 ?auto_649796 ?auto_649797 ?auto_649798 ?auto_649799 ?auto_649800 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649818 - BLOCK
      ?auto_649819 - BLOCK
      ?auto_649820 - BLOCK
      ?auto_649821 - BLOCK
      ?auto_649822 - BLOCK
      ?auto_649823 - BLOCK
      ?auto_649824 - BLOCK
      ?auto_649825 - BLOCK
      ?auto_649826 - BLOCK
      ?auto_649827 - BLOCK
      ?auto_649828 - BLOCK
      ?auto_649829 - BLOCK
      ?auto_649830 - BLOCK
      ?auto_649831 - BLOCK
      ?auto_649832 - BLOCK
      ?auto_649833 - BLOCK
      ?auto_649834 - BLOCK
    )
    :vars
    (
      ?auto_649835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649834 ?auto_649835 ) ( ON-TABLE ?auto_649818 ) ( ON ?auto_649819 ?auto_649818 ) ( ON ?auto_649820 ?auto_649819 ) ( not ( = ?auto_649818 ?auto_649819 ) ) ( not ( = ?auto_649818 ?auto_649820 ) ) ( not ( = ?auto_649818 ?auto_649821 ) ) ( not ( = ?auto_649818 ?auto_649822 ) ) ( not ( = ?auto_649818 ?auto_649823 ) ) ( not ( = ?auto_649818 ?auto_649824 ) ) ( not ( = ?auto_649818 ?auto_649825 ) ) ( not ( = ?auto_649818 ?auto_649826 ) ) ( not ( = ?auto_649818 ?auto_649827 ) ) ( not ( = ?auto_649818 ?auto_649828 ) ) ( not ( = ?auto_649818 ?auto_649829 ) ) ( not ( = ?auto_649818 ?auto_649830 ) ) ( not ( = ?auto_649818 ?auto_649831 ) ) ( not ( = ?auto_649818 ?auto_649832 ) ) ( not ( = ?auto_649818 ?auto_649833 ) ) ( not ( = ?auto_649818 ?auto_649834 ) ) ( not ( = ?auto_649818 ?auto_649835 ) ) ( not ( = ?auto_649819 ?auto_649820 ) ) ( not ( = ?auto_649819 ?auto_649821 ) ) ( not ( = ?auto_649819 ?auto_649822 ) ) ( not ( = ?auto_649819 ?auto_649823 ) ) ( not ( = ?auto_649819 ?auto_649824 ) ) ( not ( = ?auto_649819 ?auto_649825 ) ) ( not ( = ?auto_649819 ?auto_649826 ) ) ( not ( = ?auto_649819 ?auto_649827 ) ) ( not ( = ?auto_649819 ?auto_649828 ) ) ( not ( = ?auto_649819 ?auto_649829 ) ) ( not ( = ?auto_649819 ?auto_649830 ) ) ( not ( = ?auto_649819 ?auto_649831 ) ) ( not ( = ?auto_649819 ?auto_649832 ) ) ( not ( = ?auto_649819 ?auto_649833 ) ) ( not ( = ?auto_649819 ?auto_649834 ) ) ( not ( = ?auto_649819 ?auto_649835 ) ) ( not ( = ?auto_649820 ?auto_649821 ) ) ( not ( = ?auto_649820 ?auto_649822 ) ) ( not ( = ?auto_649820 ?auto_649823 ) ) ( not ( = ?auto_649820 ?auto_649824 ) ) ( not ( = ?auto_649820 ?auto_649825 ) ) ( not ( = ?auto_649820 ?auto_649826 ) ) ( not ( = ?auto_649820 ?auto_649827 ) ) ( not ( = ?auto_649820 ?auto_649828 ) ) ( not ( = ?auto_649820 ?auto_649829 ) ) ( not ( = ?auto_649820 ?auto_649830 ) ) ( not ( = ?auto_649820 ?auto_649831 ) ) ( not ( = ?auto_649820 ?auto_649832 ) ) ( not ( = ?auto_649820 ?auto_649833 ) ) ( not ( = ?auto_649820 ?auto_649834 ) ) ( not ( = ?auto_649820 ?auto_649835 ) ) ( not ( = ?auto_649821 ?auto_649822 ) ) ( not ( = ?auto_649821 ?auto_649823 ) ) ( not ( = ?auto_649821 ?auto_649824 ) ) ( not ( = ?auto_649821 ?auto_649825 ) ) ( not ( = ?auto_649821 ?auto_649826 ) ) ( not ( = ?auto_649821 ?auto_649827 ) ) ( not ( = ?auto_649821 ?auto_649828 ) ) ( not ( = ?auto_649821 ?auto_649829 ) ) ( not ( = ?auto_649821 ?auto_649830 ) ) ( not ( = ?auto_649821 ?auto_649831 ) ) ( not ( = ?auto_649821 ?auto_649832 ) ) ( not ( = ?auto_649821 ?auto_649833 ) ) ( not ( = ?auto_649821 ?auto_649834 ) ) ( not ( = ?auto_649821 ?auto_649835 ) ) ( not ( = ?auto_649822 ?auto_649823 ) ) ( not ( = ?auto_649822 ?auto_649824 ) ) ( not ( = ?auto_649822 ?auto_649825 ) ) ( not ( = ?auto_649822 ?auto_649826 ) ) ( not ( = ?auto_649822 ?auto_649827 ) ) ( not ( = ?auto_649822 ?auto_649828 ) ) ( not ( = ?auto_649822 ?auto_649829 ) ) ( not ( = ?auto_649822 ?auto_649830 ) ) ( not ( = ?auto_649822 ?auto_649831 ) ) ( not ( = ?auto_649822 ?auto_649832 ) ) ( not ( = ?auto_649822 ?auto_649833 ) ) ( not ( = ?auto_649822 ?auto_649834 ) ) ( not ( = ?auto_649822 ?auto_649835 ) ) ( not ( = ?auto_649823 ?auto_649824 ) ) ( not ( = ?auto_649823 ?auto_649825 ) ) ( not ( = ?auto_649823 ?auto_649826 ) ) ( not ( = ?auto_649823 ?auto_649827 ) ) ( not ( = ?auto_649823 ?auto_649828 ) ) ( not ( = ?auto_649823 ?auto_649829 ) ) ( not ( = ?auto_649823 ?auto_649830 ) ) ( not ( = ?auto_649823 ?auto_649831 ) ) ( not ( = ?auto_649823 ?auto_649832 ) ) ( not ( = ?auto_649823 ?auto_649833 ) ) ( not ( = ?auto_649823 ?auto_649834 ) ) ( not ( = ?auto_649823 ?auto_649835 ) ) ( not ( = ?auto_649824 ?auto_649825 ) ) ( not ( = ?auto_649824 ?auto_649826 ) ) ( not ( = ?auto_649824 ?auto_649827 ) ) ( not ( = ?auto_649824 ?auto_649828 ) ) ( not ( = ?auto_649824 ?auto_649829 ) ) ( not ( = ?auto_649824 ?auto_649830 ) ) ( not ( = ?auto_649824 ?auto_649831 ) ) ( not ( = ?auto_649824 ?auto_649832 ) ) ( not ( = ?auto_649824 ?auto_649833 ) ) ( not ( = ?auto_649824 ?auto_649834 ) ) ( not ( = ?auto_649824 ?auto_649835 ) ) ( not ( = ?auto_649825 ?auto_649826 ) ) ( not ( = ?auto_649825 ?auto_649827 ) ) ( not ( = ?auto_649825 ?auto_649828 ) ) ( not ( = ?auto_649825 ?auto_649829 ) ) ( not ( = ?auto_649825 ?auto_649830 ) ) ( not ( = ?auto_649825 ?auto_649831 ) ) ( not ( = ?auto_649825 ?auto_649832 ) ) ( not ( = ?auto_649825 ?auto_649833 ) ) ( not ( = ?auto_649825 ?auto_649834 ) ) ( not ( = ?auto_649825 ?auto_649835 ) ) ( not ( = ?auto_649826 ?auto_649827 ) ) ( not ( = ?auto_649826 ?auto_649828 ) ) ( not ( = ?auto_649826 ?auto_649829 ) ) ( not ( = ?auto_649826 ?auto_649830 ) ) ( not ( = ?auto_649826 ?auto_649831 ) ) ( not ( = ?auto_649826 ?auto_649832 ) ) ( not ( = ?auto_649826 ?auto_649833 ) ) ( not ( = ?auto_649826 ?auto_649834 ) ) ( not ( = ?auto_649826 ?auto_649835 ) ) ( not ( = ?auto_649827 ?auto_649828 ) ) ( not ( = ?auto_649827 ?auto_649829 ) ) ( not ( = ?auto_649827 ?auto_649830 ) ) ( not ( = ?auto_649827 ?auto_649831 ) ) ( not ( = ?auto_649827 ?auto_649832 ) ) ( not ( = ?auto_649827 ?auto_649833 ) ) ( not ( = ?auto_649827 ?auto_649834 ) ) ( not ( = ?auto_649827 ?auto_649835 ) ) ( not ( = ?auto_649828 ?auto_649829 ) ) ( not ( = ?auto_649828 ?auto_649830 ) ) ( not ( = ?auto_649828 ?auto_649831 ) ) ( not ( = ?auto_649828 ?auto_649832 ) ) ( not ( = ?auto_649828 ?auto_649833 ) ) ( not ( = ?auto_649828 ?auto_649834 ) ) ( not ( = ?auto_649828 ?auto_649835 ) ) ( not ( = ?auto_649829 ?auto_649830 ) ) ( not ( = ?auto_649829 ?auto_649831 ) ) ( not ( = ?auto_649829 ?auto_649832 ) ) ( not ( = ?auto_649829 ?auto_649833 ) ) ( not ( = ?auto_649829 ?auto_649834 ) ) ( not ( = ?auto_649829 ?auto_649835 ) ) ( not ( = ?auto_649830 ?auto_649831 ) ) ( not ( = ?auto_649830 ?auto_649832 ) ) ( not ( = ?auto_649830 ?auto_649833 ) ) ( not ( = ?auto_649830 ?auto_649834 ) ) ( not ( = ?auto_649830 ?auto_649835 ) ) ( not ( = ?auto_649831 ?auto_649832 ) ) ( not ( = ?auto_649831 ?auto_649833 ) ) ( not ( = ?auto_649831 ?auto_649834 ) ) ( not ( = ?auto_649831 ?auto_649835 ) ) ( not ( = ?auto_649832 ?auto_649833 ) ) ( not ( = ?auto_649832 ?auto_649834 ) ) ( not ( = ?auto_649832 ?auto_649835 ) ) ( not ( = ?auto_649833 ?auto_649834 ) ) ( not ( = ?auto_649833 ?auto_649835 ) ) ( not ( = ?auto_649834 ?auto_649835 ) ) ( ON ?auto_649833 ?auto_649834 ) ( ON ?auto_649832 ?auto_649833 ) ( ON ?auto_649831 ?auto_649832 ) ( ON ?auto_649830 ?auto_649831 ) ( ON ?auto_649829 ?auto_649830 ) ( ON ?auto_649828 ?auto_649829 ) ( ON ?auto_649827 ?auto_649828 ) ( ON ?auto_649826 ?auto_649827 ) ( ON ?auto_649825 ?auto_649826 ) ( ON ?auto_649824 ?auto_649825 ) ( ON ?auto_649823 ?auto_649824 ) ( ON ?auto_649822 ?auto_649823 ) ( CLEAR ?auto_649820 ) ( ON ?auto_649821 ?auto_649822 ) ( CLEAR ?auto_649821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_649818 ?auto_649819 ?auto_649820 ?auto_649821 )
      ( MAKE-17PILE ?auto_649818 ?auto_649819 ?auto_649820 ?auto_649821 ?auto_649822 ?auto_649823 ?auto_649824 ?auto_649825 ?auto_649826 ?auto_649827 ?auto_649828 ?auto_649829 ?auto_649830 ?auto_649831 ?auto_649832 ?auto_649833 ?auto_649834 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649853 - BLOCK
      ?auto_649854 - BLOCK
      ?auto_649855 - BLOCK
      ?auto_649856 - BLOCK
      ?auto_649857 - BLOCK
      ?auto_649858 - BLOCK
      ?auto_649859 - BLOCK
      ?auto_649860 - BLOCK
      ?auto_649861 - BLOCK
      ?auto_649862 - BLOCK
      ?auto_649863 - BLOCK
      ?auto_649864 - BLOCK
      ?auto_649865 - BLOCK
      ?auto_649866 - BLOCK
      ?auto_649867 - BLOCK
      ?auto_649868 - BLOCK
      ?auto_649869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649869 ) ( ON-TABLE ?auto_649853 ) ( ON ?auto_649854 ?auto_649853 ) ( ON ?auto_649855 ?auto_649854 ) ( not ( = ?auto_649853 ?auto_649854 ) ) ( not ( = ?auto_649853 ?auto_649855 ) ) ( not ( = ?auto_649853 ?auto_649856 ) ) ( not ( = ?auto_649853 ?auto_649857 ) ) ( not ( = ?auto_649853 ?auto_649858 ) ) ( not ( = ?auto_649853 ?auto_649859 ) ) ( not ( = ?auto_649853 ?auto_649860 ) ) ( not ( = ?auto_649853 ?auto_649861 ) ) ( not ( = ?auto_649853 ?auto_649862 ) ) ( not ( = ?auto_649853 ?auto_649863 ) ) ( not ( = ?auto_649853 ?auto_649864 ) ) ( not ( = ?auto_649853 ?auto_649865 ) ) ( not ( = ?auto_649853 ?auto_649866 ) ) ( not ( = ?auto_649853 ?auto_649867 ) ) ( not ( = ?auto_649853 ?auto_649868 ) ) ( not ( = ?auto_649853 ?auto_649869 ) ) ( not ( = ?auto_649854 ?auto_649855 ) ) ( not ( = ?auto_649854 ?auto_649856 ) ) ( not ( = ?auto_649854 ?auto_649857 ) ) ( not ( = ?auto_649854 ?auto_649858 ) ) ( not ( = ?auto_649854 ?auto_649859 ) ) ( not ( = ?auto_649854 ?auto_649860 ) ) ( not ( = ?auto_649854 ?auto_649861 ) ) ( not ( = ?auto_649854 ?auto_649862 ) ) ( not ( = ?auto_649854 ?auto_649863 ) ) ( not ( = ?auto_649854 ?auto_649864 ) ) ( not ( = ?auto_649854 ?auto_649865 ) ) ( not ( = ?auto_649854 ?auto_649866 ) ) ( not ( = ?auto_649854 ?auto_649867 ) ) ( not ( = ?auto_649854 ?auto_649868 ) ) ( not ( = ?auto_649854 ?auto_649869 ) ) ( not ( = ?auto_649855 ?auto_649856 ) ) ( not ( = ?auto_649855 ?auto_649857 ) ) ( not ( = ?auto_649855 ?auto_649858 ) ) ( not ( = ?auto_649855 ?auto_649859 ) ) ( not ( = ?auto_649855 ?auto_649860 ) ) ( not ( = ?auto_649855 ?auto_649861 ) ) ( not ( = ?auto_649855 ?auto_649862 ) ) ( not ( = ?auto_649855 ?auto_649863 ) ) ( not ( = ?auto_649855 ?auto_649864 ) ) ( not ( = ?auto_649855 ?auto_649865 ) ) ( not ( = ?auto_649855 ?auto_649866 ) ) ( not ( = ?auto_649855 ?auto_649867 ) ) ( not ( = ?auto_649855 ?auto_649868 ) ) ( not ( = ?auto_649855 ?auto_649869 ) ) ( not ( = ?auto_649856 ?auto_649857 ) ) ( not ( = ?auto_649856 ?auto_649858 ) ) ( not ( = ?auto_649856 ?auto_649859 ) ) ( not ( = ?auto_649856 ?auto_649860 ) ) ( not ( = ?auto_649856 ?auto_649861 ) ) ( not ( = ?auto_649856 ?auto_649862 ) ) ( not ( = ?auto_649856 ?auto_649863 ) ) ( not ( = ?auto_649856 ?auto_649864 ) ) ( not ( = ?auto_649856 ?auto_649865 ) ) ( not ( = ?auto_649856 ?auto_649866 ) ) ( not ( = ?auto_649856 ?auto_649867 ) ) ( not ( = ?auto_649856 ?auto_649868 ) ) ( not ( = ?auto_649856 ?auto_649869 ) ) ( not ( = ?auto_649857 ?auto_649858 ) ) ( not ( = ?auto_649857 ?auto_649859 ) ) ( not ( = ?auto_649857 ?auto_649860 ) ) ( not ( = ?auto_649857 ?auto_649861 ) ) ( not ( = ?auto_649857 ?auto_649862 ) ) ( not ( = ?auto_649857 ?auto_649863 ) ) ( not ( = ?auto_649857 ?auto_649864 ) ) ( not ( = ?auto_649857 ?auto_649865 ) ) ( not ( = ?auto_649857 ?auto_649866 ) ) ( not ( = ?auto_649857 ?auto_649867 ) ) ( not ( = ?auto_649857 ?auto_649868 ) ) ( not ( = ?auto_649857 ?auto_649869 ) ) ( not ( = ?auto_649858 ?auto_649859 ) ) ( not ( = ?auto_649858 ?auto_649860 ) ) ( not ( = ?auto_649858 ?auto_649861 ) ) ( not ( = ?auto_649858 ?auto_649862 ) ) ( not ( = ?auto_649858 ?auto_649863 ) ) ( not ( = ?auto_649858 ?auto_649864 ) ) ( not ( = ?auto_649858 ?auto_649865 ) ) ( not ( = ?auto_649858 ?auto_649866 ) ) ( not ( = ?auto_649858 ?auto_649867 ) ) ( not ( = ?auto_649858 ?auto_649868 ) ) ( not ( = ?auto_649858 ?auto_649869 ) ) ( not ( = ?auto_649859 ?auto_649860 ) ) ( not ( = ?auto_649859 ?auto_649861 ) ) ( not ( = ?auto_649859 ?auto_649862 ) ) ( not ( = ?auto_649859 ?auto_649863 ) ) ( not ( = ?auto_649859 ?auto_649864 ) ) ( not ( = ?auto_649859 ?auto_649865 ) ) ( not ( = ?auto_649859 ?auto_649866 ) ) ( not ( = ?auto_649859 ?auto_649867 ) ) ( not ( = ?auto_649859 ?auto_649868 ) ) ( not ( = ?auto_649859 ?auto_649869 ) ) ( not ( = ?auto_649860 ?auto_649861 ) ) ( not ( = ?auto_649860 ?auto_649862 ) ) ( not ( = ?auto_649860 ?auto_649863 ) ) ( not ( = ?auto_649860 ?auto_649864 ) ) ( not ( = ?auto_649860 ?auto_649865 ) ) ( not ( = ?auto_649860 ?auto_649866 ) ) ( not ( = ?auto_649860 ?auto_649867 ) ) ( not ( = ?auto_649860 ?auto_649868 ) ) ( not ( = ?auto_649860 ?auto_649869 ) ) ( not ( = ?auto_649861 ?auto_649862 ) ) ( not ( = ?auto_649861 ?auto_649863 ) ) ( not ( = ?auto_649861 ?auto_649864 ) ) ( not ( = ?auto_649861 ?auto_649865 ) ) ( not ( = ?auto_649861 ?auto_649866 ) ) ( not ( = ?auto_649861 ?auto_649867 ) ) ( not ( = ?auto_649861 ?auto_649868 ) ) ( not ( = ?auto_649861 ?auto_649869 ) ) ( not ( = ?auto_649862 ?auto_649863 ) ) ( not ( = ?auto_649862 ?auto_649864 ) ) ( not ( = ?auto_649862 ?auto_649865 ) ) ( not ( = ?auto_649862 ?auto_649866 ) ) ( not ( = ?auto_649862 ?auto_649867 ) ) ( not ( = ?auto_649862 ?auto_649868 ) ) ( not ( = ?auto_649862 ?auto_649869 ) ) ( not ( = ?auto_649863 ?auto_649864 ) ) ( not ( = ?auto_649863 ?auto_649865 ) ) ( not ( = ?auto_649863 ?auto_649866 ) ) ( not ( = ?auto_649863 ?auto_649867 ) ) ( not ( = ?auto_649863 ?auto_649868 ) ) ( not ( = ?auto_649863 ?auto_649869 ) ) ( not ( = ?auto_649864 ?auto_649865 ) ) ( not ( = ?auto_649864 ?auto_649866 ) ) ( not ( = ?auto_649864 ?auto_649867 ) ) ( not ( = ?auto_649864 ?auto_649868 ) ) ( not ( = ?auto_649864 ?auto_649869 ) ) ( not ( = ?auto_649865 ?auto_649866 ) ) ( not ( = ?auto_649865 ?auto_649867 ) ) ( not ( = ?auto_649865 ?auto_649868 ) ) ( not ( = ?auto_649865 ?auto_649869 ) ) ( not ( = ?auto_649866 ?auto_649867 ) ) ( not ( = ?auto_649866 ?auto_649868 ) ) ( not ( = ?auto_649866 ?auto_649869 ) ) ( not ( = ?auto_649867 ?auto_649868 ) ) ( not ( = ?auto_649867 ?auto_649869 ) ) ( not ( = ?auto_649868 ?auto_649869 ) ) ( ON ?auto_649868 ?auto_649869 ) ( ON ?auto_649867 ?auto_649868 ) ( ON ?auto_649866 ?auto_649867 ) ( ON ?auto_649865 ?auto_649866 ) ( ON ?auto_649864 ?auto_649865 ) ( ON ?auto_649863 ?auto_649864 ) ( ON ?auto_649862 ?auto_649863 ) ( ON ?auto_649861 ?auto_649862 ) ( ON ?auto_649860 ?auto_649861 ) ( ON ?auto_649859 ?auto_649860 ) ( ON ?auto_649858 ?auto_649859 ) ( ON ?auto_649857 ?auto_649858 ) ( CLEAR ?auto_649855 ) ( ON ?auto_649856 ?auto_649857 ) ( CLEAR ?auto_649856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_649853 ?auto_649854 ?auto_649855 ?auto_649856 )
      ( MAKE-17PILE ?auto_649853 ?auto_649854 ?auto_649855 ?auto_649856 ?auto_649857 ?auto_649858 ?auto_649859 ?auto_649860 ?auto_649861 ?auto_649862 ?auto_649863 ?auto_649864 ?auto_649865 ?auto_649866 ?auto_649867 ?auto_649868 ?auto_649869 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649887 - BLOCK
      ?auto_649888 - BLOCK
      ?auto_649889 - BLOCK
      ?auto_649890 - BLOCK
      ?auto_649891 - BLOCK
      ?auto_649892 - BLOCK
      ?auto_649893 - BLOCK
      ?auto_649894 - BLOCK
      ?auto_649895 - BLOCK
      ?auto_649896 - BLOCK
      ?auto_649897 - BLOCK
      ?auto_649898 - BLOCK
      ?auto_649899 - BLOCK
      ?auto_649900 - BLOCK
      ?auto_649901 - BLOCK
      ?auto_649902 - BLOCK
      ?auto_649903 - BLOCK
    )
    :vars
    (
      ?auto_649904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649903 ?auto_649904 ) ( ON-TABLE ?auto_649887 ) ( ON ?auto_649888 ?auto_649887 ) ( not ( = ?auto_649887 ?auto_649888 ) ) ( not ( = ?auto_649887 ?auto_649889 ) ) ( not ( = ?auto_649887 ?auto_649890 ) ) ( not ( = ?auto_649887 ?auto_649891 ) ) ( not ( = ?auto_649887 ?auto_649892 ) ) ( not ( = ?auto_649887 ?auto_649893 ) ) ( not ( = ?auto_649887 ?auto_649894 ) ) ( not ( = ?auto_649887 ?auto_649895 ) ) ( not ( = ?auto_649887 ?auto_649896 ) ) ( not ( = ?auto_649887 ?auto_649897 ) ) ( not ( = ?auto_649887 ?auto_649898 ) ) ( not ( = ?auto_649887 ?auto_649899 ) ) ( not ( = ?auto_649887 ?auto_649900 ) ) ( not ( = ?auto_649887 ?auto_649901 ) ) ( not ( = ?auto_649887 ?auto_649902 ) ) ( not ( = ?auto_649887 ?auto_649903 ) ) ( not ( = ?auto_649887 ?auto_649904 ) ) ( not ( = ?auto_649888 ?auto_649889 ) ) ( not ( = ?auto_649888 ?auto_649890 ) ) ( not ( = ?auto_649888 ?auto_649891 ) ) ( not ( = ?auto_649888 ?auto_649892 ) ) ( not ( = ?auto_649888 ?auto_649893 ) ) ( not ( = ?auto_649888 ?auto_649894 ) ) ( not ( = ?auto_649888 ?auto_649895 ) ) ( not ( = ?auto_649888 ?auto_649896 ) ) ( not ( = ?auto_649888 ?auto_649897 ) ) ( not ( = ?auto_649888 ?auto_649898 ) ) ( not ( = ?auto_649888 ?auto_649899 ) ) ( not ( = ?auto_649888 ?auto_649900 ) ) ( not ( = ?auto_649888 ?auto_649901 ) ) ( not ( = ?auto_649888 ?auto_649902 ) ) ( not ( = ?auto_649888 ?auto_649903 ) ) ( not ( = ?auto_649888 ?auto_649904 ) ) ( not ( = ?auto_649889 ?auto_649890 ) ) ( not ( = ?auto_649889 ?auto_649891 ) ) ( not ( = ?auto_649889 ?auto_649892 ) ) ( not ( = ?auto_649889 ?auto_649893 ) ) ( not ( = ?auto_649889 ?auto_649894 ) ) ( not ( = ?auto_649889 ?auto_649895 ) ) ( not ( = ?auto_649889 ?auto_649896 ) ) ( not ( = ?auto_649889 ?auto_649897 ) ) ( not ( = ?auto_649889 ?auto_649898 ) ) ( not ( = ?auto_649889 ?auto_649899 ) ) ( not ( = ?auto_649889 ?auto_649900 ) ) ( not ( = ?auto_649889 ?auto_649901 ) ) ( not ( = ?auto_649889 ?auto_649902 ) ) ( not ( = ?auto_649889 ?auto_649903 ) ) ( not ( = ?auto_649889 ?auto_649904 ) ) ( not ( = ?auto_649890 ?auto_649891 ) ) ( not ( = ?auto_649890 ?auto_649892 ) ) ( not ( = ?auto_649890 ?auto_649893 ) ) ( not ( = ?auto_649890 ?auto_649894 ) ) ( not ( = ?auto_649890 ?auto_649895 ) ) ( not ( = ?auto_649890 ?auto_649896 ) ) ( not ( = ?auto_649890 ?auto_649897 ) ) ( not ( = ?auto_649890 ?auto_649898 ) ) ( not ( = ?auto_649890 ?auto_649899 ) ) ( not ( = ?auto_649890 ?auto_649900 ) ) ( not ( = ?auto_649890 ?auto_649901 ) ) ( not ( = ?auto_649890 ?auto_649902 ) ) ( not ( = ?auto_649890 ?auto_649903 ) ) ( not ( = ?auto_649890 ?auto_649904 ) ) ( not ( = ?auto_649891 ?auto_649892 ) ) ( not ( = ?auto_649891 ?auto_649893 ) ) ( not ( = ?auto_649891 ?auto_649894 ) ) ( not ( = ?auto_649891 ?auto_649895 ) ) ( not ( = ?auto_649891 ?auto_649896 ) ) ( not ( = ?auto_649891 ?auto_649897 ) ) ( not ( = ?auto_649891 ?auto_649898 ) ) ( not ( = ?auto_649891 ?auto_649899 ) ) ( not ( = ?auto_649891 ?auto_649900 ) ) ( not ( = ?auto_649891 ?auto_649901 ) ) ( not ( = ?auto_649891 ?auto_649902 ) ) ( not ( = ?auto_649891 ?auto_649903 ) ) ( not ( = ?auto_649891 ?auto_649904 ) ) ( not ( = ?auto_649892 ?auto_649893 ) ) ( not ( = ?auto_649892 ?auto_649894 ) ) ( not ( = ?auto_649892 ?auto_649895 ) ) ( not ( = ?auto_649892 ?auto_649896 ) ) ( not ( = ?auto_649892 ?auto_649897 ) ) ( not ( = ?auto_649892 ?auto_649898 ) ) ( not ( = ?auto_649892 ?auto_649899 ) ) ( not ( = ?auto_649892 ?auto_649900 ) ) ( not ( = ?auto_649892 ?auto_649901 ) ) ( not ( = ?auto_649892 ?auto_649902 ) ) ( not ( = ?auto_649892 ?auto_649903 ) ) ( not ( = ?auto_649892 ?auto_649904 ) ) ( not ( = ?auto_649893 ?auto_649894 ) ) ( not ( = ?auto_649893 ?auto_649895 ) ) ( not ( = ?auto_649893 ?auto_649896 ) ) ( not ( = ?auto_649893 ?auto_649897 ) ) ( not ( = ?auto_649893 ?auto_649898 ) ) ( not ( = ?auto_649893 ?auto_649899 ) ) ( not ( = ?auto_649893 ?auto_649900 ) ) ( not ( = ?auto_649893 ?auto_649901 ) ) ( not ( = ?auto_649893 ?auto_649902 ) ) ( not ( = ?auto_649893 ?auto_649903 ) ) ( not ( = ?auto_649893 ?auto_649904 ) ) ( not ( = ?auto_649894 ?auto_649895 ) ) ( not ( = ?auto_649894 ?auto_649896 ) ) ( not ( = ?auto_649894 ?auto_649897 ) ) ( not ( = ?auto_649894 ?auto_649898 ) ) ( not ( = ?auto_649894 ?auto_649899 ) ) ( not ( = ?auto_649894 ?auto_649900 ) ) ( not ( = ?auto_649894 ?auto_649901 ) ) ( not ( = ?auto_649894 ?auto_649902 ) ) ( not ( = ?auto_649894 ?auto_649903 ) ) ( not ( = ?auto_649894 ?auto_649904 ) ) ( not ( = ?auto_649895 ?auto_649896 ) ) ( not ( = ?auto_649895 ?auto_649897 ) ) ( not ( = ?auto_649895 ?auto_649898 ) ) ( not ( = ?auto_649895 ?auto_649899 ) ) ( not ( = ?auto_649895 ?auto_649900 ) ) ( not ( = ?auto_649895 ?auto_649901 ) ) ( not ( = ?auto_649895 ?auto_649902 ) ) ( not ( = ?auto_649895 ?auto_649903 ) ) ( not ( = ?auto_649895 ?auto_649904 ) ) ( not ( = ?auto_649896 ?auto_649897 ) ) ( not ( = ?auto_649896 ?auto_649898 ) ) ( not ( = ?auto_649896 ?auto_649899 ) ) ( not ( = ?auto_649896 ?auto_649900 ) ) ( not ( = ?auto_649896 ?auto_649901 ) ) ( not ( = ?auto_649896 ?auto_649902 ) ) ( not ( = ?auto_649896 ?auto_649903 ) ) ( not ( = ?auto_649896 ?auto_649904 ) ) ( not ( = ?auto_649897 ?auto_649898 ) ) ( not ( = ?auto_649897 ?auto_649899 ) ) ( not ( = ?auto_649897 ?auto_649900 ) ) ( not ( = ?auto_649897 ?auto_649901 ) ) ( not ( = ?auto_649897 ?auto_649902 ) ) ( not ( = ?auto_649897 ?auto_649903 ) ) ( not ( = ?auto_649897 ?auto_649904 ) ) ( not ( = ?auto_649898 ?auto_649899 ) ) ( not ( = ?auto_649898 ?auto_649900 ) ) ( not ( = ?auto_649898 ?auto_649901 ) ) ( not ( = ?auto_649898 ?auto_649902 ) ) ( not ( = ?auto_649898 ?auto_649903 ) ) ( not ( = ?auto_649898 ?auto_649904 ) ) ( not ( = ?auto_649899 ?auto_649900 ) ) ( not ( = ?auto_649899 ?auto_649901 ) ) ( not ( = ?auto_649899 ?auto_649902 ) ) ( not ( = ?auto_649899 ?auto_649903 ) ) ( not ( = ?auto_649899 ?auto_649904 ) ) ( not ( = ?auto_649900 ?auto_649901 ) ) ( not ( = ?auto_649900 ?auto_649902 ) ) ( not ( = ?auto_649900 ?auto_649903 ) ) ( not ( = ?auto_649900 ?auto_649904 ) ) ( not ( = ?auto_649901 ?auto_649902 ) ) ( not ( = ?auto_649901 ?auto_649903 ) ) ( not ( = ?auto_649901 ?auto_649904 ) ) ( not ( = ?auto_649902 ?auto_649903 ) ) ( not ( = ?auto_649902 ?auto_649904 ) ) ( not ( = ?auto_649903 ?auto_649904 ) ) ( ON ?auto_649902 ?auto_649903 ) ( ON ?auto_649901 ?auto_649902 ) ( ON ?auto_649900 ?auto_649901 ) ( ON ?auto_649899 ?auto_649900 ) ( ON ?auto_649898 ?auto_649899 ) ( ON ?auto_649897 ?auto_649898 ) ( ON ?auto_649896 ?auto_649897 ) ( ON ?auto_649895 ?auto_649896 ) ( ON ?auto_649894 ?auto_649895 ) ( ON ?auto_649893 ?auto_649894 ) ( ON ?auto_649892 ?auto_649893 ) ( ON ?auto_649891 ?auto_649892 ) ( ON ?auto_649890 ?auto_649891 ) ( CLEAR ?auto_649888 ) ( ON ?auto_649889 ?auto_649890 ) ( CLEAR ?auto_649889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_649887 ?auto_649888 ?auto_649889 )
      ( MAKE-17PILE ?auto_649887 ?auto_649888 ?auto_649889 ?auto_649890 ?auto_649891 ?auto_649892 ?auto_649893 ?auto_649894 ?auto_649895 ?auto_649896 ?auto_649897 ?auto_649898 ?auto_649899 ?auto_649900 ?auto_649901 ?auto_649902 ?auto_649903 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649922 - BLOCK
      ?auto_649923 - BLOCK
      ?auto_649924 - BLOCK
      ?auto_649925 - BLOCK
      ?auto_649926 - BLOCK
      ?auto_649927 - BLOCK
      ?auto_649928 - BLOCK
      ?auto_649929 - BLOCK
      ?auto_649930 - BLOCK
      ?auto_649931 - BLOCK
      ?auto_649932 - BLOCK
      ?auto_649933 - BLOCK
      ?auto_649934 - BLOCK
      ?auto_649935 - BLOCK
      ?auto_649936 - BLOCK
      ?auto_649937 - BLOCK
      ?auto_649938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_649938 ) ( ON-TABLE ?auto_649922 ) ( ON ?auto_649923 ?auto_649922 ) ( not ( = ?auto_649922 ?auto_649923 ) ) ( not ( = ?auto_649922 ?auto_649924 ) ) ( not ( = ?auto_649922 ?auto_649925 ) ) ( not ( = ?auto_649922 ?auto_649926 ) ) ( not ( = ?auto_649922 ?auto_649927 ) ) ( not ( = ?auto_649922 ?auto_649928 ) ) ( not ( = ?auto_649922 ?auto_649929 ) ) ( not ( = ?auto_649922 ?auto_649930 ) ) ( not ( = ?auto_649922 ?auto_649931 ) ) ( not ( = ?auto_649922 ?auto_649932 ) ) ( not ( = ?auto_649922 ?auto_649933 ) ) ( not ( = ?auto_649922 ?auto_649934 ) ) ( not ( = ?auto_649922 ?auto_649935 ) ) ( not ( = ?auto_649922 ?auto_649936 ) ) ( not ( = ?auto_649922 ?auto_649937 ) ) ( not ( = ?auto_649922 ?auto_649938 ) ) ( not ( = ?auto_649923 ?auto_649924 ) ) ( not ( = ?auto_649923 ?auto_649925 ) ) ( not ( = ?auto_649923 ?auto_649926 ) ) ( not ( = ?auto_649923 ?auto_649927 ) ) ( not ( = ?auto_649923 ?auto_649928 ) ) ( not ( = ?auto_649923 ?auto_649929 ) ) ( not ( = ?auto_649923 ?auto_649930 ) ) ( not ( = ?auto_649923 ?auto_649931 ) ) ( not ( = ?auto_649923 ?auto_649932 ) ) ( not ( = ?auto_649923 ?auto_649933 ) ) ( not ( = ?auto_649923 ?auto_649934 ) ) ( not ( = ?auto_649923 ?auto_649935 ) ) ( not ( = ?auto_649923 ?auto_649936 ) ) ( not ( = ?auto_649923 ?auto_649937 ) ) ( not ( = ?auto_649923 ?auto_649938 ) ) ( not ( = ?auto_649924 ?auto_649925 ) ) ( not ( = ?auto_649924 ?auto_649926 ) ) ( not ( = ?auto_649924 ?auto_649927 ) ) ( not ( = ?auto_649924 ?auto_649928 ) ) ( not ( = ?auto_649924 ?auto_649929 ) ) ( not ( = ?auto_649924 ?auto_649930 ) ) ( not ( = ?auto_649924 ?auto_649931 ) ) ( not ( = ?auto_649924 ?auto_649932 ) ) ( not ( = ?auto_649924 ?auto_649933 ) ) ( not ( = ?auto_649924 ?auto_649934 ) ) ( not ( = ?auto_649924 ?auto_649935 ) ) ( not ( = ?auto_649924 ?auto_649936 ) ) ( not ( = ?auto_649924 ?auto_649937 ) ) ( not ( = ?auto_649924 ?auto_649938 ) ) ( not ( = ?auto_649925 ?auto_649926 ) ) ( not ( = ?auto_649925 ?auto_649927 ) ) ( not ( = ?auto_649925 ?auto_649928 ) ) ( not ( = ?auto_649925 ?auto_649929 ) ) ( not ( = ?auto_649925 ?auto_649930 ) ) ( not ( = ?auto_649925 ?auto_649931 ) ) ( not ( = ?auto_649925 ?auto_649932 ) ) ( not ( = ?auto_649925 ?auto_649933 ) ) ( not ( = ?auto_649925 ?auto_649934 ) ) ( not ( = ?auto_649925 ?auto_649935 ) ) ( not ( = ?auto_649925 ?auto_649936 ) ) ( not ( = ?auto_649925 ?auto_649937 ) ) ( not ( = ?auto_649925 ?auto_649938 ) ) ( not ( = ?auto_649926 ?auto_649927 ) ) ( not ( = ?auto_649926 ?auto_649928 ) ) ( not ( = ?auto_649926 ?auto_649929 ) ) ( not ( = ?auto_649926 ?auto_649930 ) ) ( not ( = ?auto_649926 ?auto_649931 ) ) ( not ( = ?auto_649926 ?auto_649932 ) ) ( not ( = ?auto_649926 ?auto_649933 ) ) ( not ( = ?auto_649926 ?auto_649934 ) ) ( not ( = ?auto_649926 ?auto_649935 ) ) ( not ( = ?auto_649926 ?auto_649936 ) ) ( not ( = ?auto_649926 ?auto_649937 ) ) ( not ( = ?auto_649926 ?auto_649938 ) ) ( not ( = ?auto_649927 ?auto_649928 ) ) ( not ( = ?auto_649927 ?auto_649929 ) ) ( not ( = ?auto_649927 ?auto_649930 ) ) ( not ( = ?auto_649927 ?auto_649931 ) ) ( not ( = ?auto_649927 ?auto_649932 ) ) ( not ( = ?auto_649927 ?auto_649933 ) ) ( not ( = ?auto_649927 ?auto_649934 ) ) ( not ( = ?auto_649927 ?auto_649935 ) ) ( not ( = ?auto_649927 ?auto_649936 ) ) ( not ( = ?auto_649927 ?auto_649937 ) ) ( not ( = ?auto_649927 ?auto_649938 ) ) ( not ( = ?auto_649928 ?auto_649929 ) ) ( not ( = ?auto_649928 ?auto_649930 ) ) ( not ( = ?auto_649928 ?auto_649931 ) ) ( not ( = ?auto_649928 ?auto_649932 ) ) ( not ( = ?auto_649928 ?auto_649933 ) ) ( not ( = ?auto_649928 ?auto_649934 ) ) ( not ( = ?auto_649928 ?auto_649935 ) ) ( not ( = ?auto_649928 ?auto_649936 ) ) ( not ( = ?auto_649928 ?auto_649937 ) ) ( not ( = ?auto_649928 ?auto_649938 ) ) ( not ( = ?auto_649929 ?auto_649930 ) ) ( not ( = ?auto_649929 ?auto_649931 ) ) ( not ( = ?auto_649929 ?auto_649932 ) ) ( not ( = ?auto_649929 ?auto_649933 ) ) ( not ( = ?auto_649929 ?auto_649934 ) ) ( not ( = ?auto_649929 ?auto_649935 ) ) ( not ( = ?auto_649929 ?auto_649936 ) ) ( not ( = ?auto_649929 ?auto_649937 ) ) ( not ( = ?auto_649929 ?auto_649938 ) ) ( not ( = ?auto_649930 ?auto_649931 ) ) ( not ( = ?auto_649930 ?auto_649932 ) ) ( not ( = ?auto_649930 ?auto_649933 ) ) ( not ( = ?auto_649930 ?auto_649934 ) ) ( not ( = ?auto_649930 ?auto_649935 ) ) ( not ( = ?auto_649930 ?auto_649936 ) ) ( not ( = ?auto_649930 ?auto_649937 ) ) ( not ( = ?auto_649930 ?auto_649938 ) ) ( not ( = ?auto_649931 ?auto_649932 ) ) ( not ( = ?auto_649931 ?auto_649933 ) ) ( not ( = ?auto_649931 ?auto_649934 ) ) ( not ( = ?auto_649931 ?auto_649935 ) ) ( not ( = ?auto_649931 ?auto_649936 ) ) ( not ( = ?auto_649931 ?auto_649937 ) ) ( not ( = ?auto_649931 ?auto_649938 ) ) ( not ( = ?auto_649932 ?auto_649933 ) ) ( not ( = ?auto_649932 ?auto_649934 ) ) ( not ( = ?auto_649932 ?auto_649935 ) ) ( not ( = ?auto_649932 ?auto_649936 ) ) ( not ( = ?auto_649932 ?auto_649937 ) ) ( not ( = ?auto_649932 ?auto_649938 ) ) ( not ( = ?auto_649933 ?auto_649934 ) ) ( not ( = ?auto_649933 ?auto_649935 ) ) ( not ( = ?auto_649933 ?auto_649936 ) ) ( not ( = ?auto_649933 ?auto_649937 ) ) ( not ( = ?auto_649933 ?auto_649938 ) ) ( not ( = ?auto_649934 ?auto_649935 ) ) ( not ( = ?auto_649934 ?auto_649936 ) ) ( not ( = ?auto_649934 ?auto_649937 ) ) ( not ( = ?auto_649934 ?auto_649938 ) ) ( not ( = ?auto_649935 ?auto_649936 ) ) ( not ( = ?auto_649935 ?auto_649937 ) ) ( not ( = ?auto_649935 ?auto_649938 ) ) ( not ( = ?auto_649936 ?auto_649937 ) ) ( not ( = ?auto_649936 ?auto_649938 ) ) ( not ( = ?auto_649937 ?auto_649938 ) ) ( ON ?auto_649937 ?auto_649938 ) ( ON ?auto_649936 ?auto_649937 ) ( ON ?auto_649935 ?auto_649936 ) ( ON ?auto_649934 ?auto_649935 ) ( ON ?auto_649933 ?auto_649934 ) ( ON ?auto_649932 ?auto_649933 ) ( ON ?auto_649931 ?auto_649932 ) ( ON ?auto_649930 ?auto_649931 ) ( ON ?auto_649929 ?auto_649930 ) ( ON ?auto_649928 ?auto_649929 ) ( ON ?auto_649927 ?auto_649928 ) ( ON ?auto_649926 ?auto_649927 ) ( ON ?auto_649925 ?auto_649926 ) ( CLEAR ?auto_649923 ) ( ON ?auto_649924 ?auto_649925 ) ( CLEAR ?auto_649924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_649922 ?auto_649923 ?auto_649924 )
      ( MAKE-17PILE ?auto_649922 ?auto_649923 ?auto_649924 ?auto_649925 ?auto_649926 ?auto_649927 ?auto_649928 ?auto_649929 ?auto_649930 ?auto_649931 ?auto_649932 ?auto_649933 ?auto_649934 ?auto_649935 ?auto_649936 ?auto_649937 ?auto_649938 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649956 - BLOCK
      ?auto_649957 - BLOCK
      ?auto_649958 - BLOCK
      ?auto_649959 - BLOCK
      ?auto_649960 - BLOCK
      ?auto_649961 - BLOCK
      ?auto_649962 - BLOCK
      ?auto_649963 - BLOCK
      ?auto_649964 - BLOCK
      ?auto_649965 - BLOCK
      ?auto_649966 - BLOCK
      ?auto_649967 - BLOCK
      ?auto_649968 - BLOCK
      ?auto_649969 - BLOCK
      ?auto_649970 - BLOCK
      ?auto_649971 - BLOCK
      ?auto_649972 - BLOCK
    )
    :vars
    (
      ?auto_649973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_649972 ?auto_649973 ) ( ON-TABLE ?auto_649956 ) ( not ( = ?auto_649956 ?auto_649957 ) ) ( not ( = ?auto_649956 ?auto_649958 ) ) ( not ( = ?auto_649956 ?auto_649959 ) ) ( not ( = ?auto_649956 ?auto_649960 ) ) ( not ( = ?auto_649956 ?auto_649961 ) ) ( not ( = ?auto_649956 ?auto_649962 ) ) ( not ( = ?auto_649956 ?auto_649963 ) ) ( not ( = ?auto_649956 ?auto_649964 ) ) ( not ( = ?auto_649956 ?auto_649965 ) ) ( not ( = ?auto_649956 ?auto_649966 ) ) ( not ( = ?auto_649956 ?auto_649967 ) ) ( not ( = ?auto_649956 ?auto_649968 ) ) ( not ( = ?auto_649956 ?auto_649969 ) ) ( not ( = ?auto_649956 ?auto_649970 ) ) ( not ( = ?auto_649956 ?auto_649971 ) ) ( not ( = ?auto_649956 ?auto_649972 ) ) ( not ( = ?auto_649956 ?auto_649973 ) ) ( not ( = ?auto_649957 ?auto_649958 ) ) ( not ( = ?auto_649957 ?auto_649959 ) ) ( not ( = ?auto_649957 ?auto_649960 ) ) ( not ( = ?auto_649957 ?auto_649961 ) ) ( not ( = ?auto_649957 ?auto_649962 ) ) ( not ( = ?auto_649957 ?auto_649963 ) ) ( not ( = ?auto_649957 ?auto_649964 ) ) ( not ( = ?auto_649957 ?auto_649965 ) ) ( not ( = ?auto_649957 ?auto_649966 ) ) ( not ( = ?auto_649957 ?auto_649967 ) ) ( not ( = ?auto_649957 ?auto_649968 ) ) ( not ( = ?auto_649957 ?auto_649969 ) ) ( not ( = ?auto_649957 ?auto_649970 ) ) ( not ( = ?auto_649957 ?auto_649971 ) ) ( not ( = ?auto_649957 ?auto_649972 ) ) ( not ( = ?auto_649957 ?auto_649973 ) ) ( not ( = ?auto_649958 ?auto_649959 ) ) ( not ( = ?auto_649958 ?auto_649960 ) ) ( not ( = ?auto_649958 ?auto_649961 ) ) ( not ( = ?auto_649958 ?auto_649962 ) ) ( not ( = ?auto_649958 ?auto_649963 ) ) ( not ( = ?auto_649958 ?auto_649964 ) ) ( not ( = ?auto_649958 ?auto_649965 ) ) ( not ( = ?auto_649958 ?auto_649966 ) ) ( not ( = ?auto_649958 ?auto_649967 ) ) ( not ( = ?auto_649958 ?auto_649968 ) ) ( not ( = ?auto_649958 ?auto_649969 ) ) ( not ( = ?auto_649958 ?auto_649970 ) ) ( not ( = ?auto_649958 ?auto_649971 ) ) ( not ( = ?auto_649958 ?auto_649972 ) ) ( not ( = ?auto_649958 ?auto_649973 ) ) ( not ( = ?auto_649959 ?auto_649960 ) ) ( not ( = ?auto_649959 ?auto_649961 ) ) ( not ( = ?auto_649959 ?auto_649962 ) ) ( not ( = ?auto_649959 ?auto_649963 ) ) ( not ( = ?auto_649959 ?auto_649964 ) ) ( not ( = ?auto_649959 ?auto_649965 ) ) ( not ( = ?auto_649959 ?auto_649966 ) ) ( not ( = ?auto_649959 ?auto_649967 ) ) ( not ( = ?auto_649959 ?auto_649968 ) ) ( not ( = ?auto_649959 ?auto_649969 ) ) ( not ( = ?auto_649959 ?auto_649970 ) ) ( not ( = ?auto_649959 ?auto_649971 ) ) ( not ( = ?auto_649959 ?auto_649972 ) ) ( not ( = ?auto_649959 ?auto_649973 ) ) ( not ( = ?auto_649960 ?auto_649961 ) ) ( not ( = ?auto_649960 ?auto_649962 ) ) ( not ( = ?auto_649960 ?auto_649963 ) ) ( not ( = ?auto_649960 ?auto_649964 ) ) ( not ( = ?auto_649960 ?auto_649965 ) ) ( not ( = ?auto_649960 ?auto_649966 ) ) ( not ( = ?auto_649960 ?auto_649967 ) ) ( not ( = ?auto_649960 ?auto_649968 ) ) ( not ( = ?auto_649960 ?auto_649969 ) ) ( not ( = ?auto_649960 ?auto_649970 ) ) ( not ( = ?auto_649960 ?auto_649971 ) ) ( not ( = ?auto_649960 ?auto_649972 ) ) ( not ( = ?auto_649960 ?auto_649973 ) ) ( not ( = ?auto_649961 ?auto_649962 ) ) ( not ( = ?auto_649961 ?auto_649963 ) ) ( not ( = ?auto_649961 ?auto_649964 ) ) ( not ( = ?auto_649961 ?auto_649965 ) ) ( not ( = ?auto_649961 ?auto_649966 ) ) ( not ( = ?auto_649961 ?auto_649967 ) ) ( not ( = ?auto_649961 ?auto_649968 ) ) ( not ( = ?auto_649961 ?auto_649969 ) ) ( not ( = ?auto_649961 ?auto_649970 ) ) ( not ( = ?auto_649961 ?auto_649971 ) ) ( not ( = ?auto_649961 ?auto_649972 ) ) ( not ( = ?auto_649961 ?auto_649973 ) ) ( not ( = ?auto_649962 ?auto_649963 ) ) ( not ( = ?auto_649962 ?auto_649964 ) ) ( not ( = ?auto_649962 ?auto_649965 ) ) ( not ( = ?auto_649962 ?auto_649966 ) ) ( not ( = ?auto_649962 ?auto_649967 ) ) ( not ( = ?auto_649962 ?auto_649968 ) ) ( not ( = ?auto_649962 ?auto_649969 ) ) ( not ( = ?auto_649962 ?auto_649970 ) ) ( not ( = ?auto_649962 ?auto_649971 ) ) ( not ( = ?auto_649962 ?auto_649972 ) ) ( not ( = ?auto_649962 ?auto_649973 ) ) ( not ( = ?auto_649963 ?auto_649964 ) ) ( not ( = ?auto_649963 ?auto_649965 ) ) ( not ( = ?auto_649963 ?auto_649966 ) ) ( not ( = ?auto_649963 ?auto_649967 ) ) ( not ( = ?auto_649963 ?auto_649968 ) ) ( not ( = ?auto_649963 ?auto_649969 ) ) ( not ( = ?auto_649963 ?auto_649970 ) ) ( not ( = ?auto_649963 ?auto_649971 ) ) ( not ( = ?auto_649963 ?auto_649972 ) ) ( not ( = ?auto_649963 ?auto_649973 ) ) ( not ( = ?auto_649964 ?auto_649965 ) ) ( not ( = ?auto_649964 ?auto_649966 ) ) ( not ( = ?auto_649964 ?auto_649967 ) ) ( not ( = ?auto_649964 ?auto_649968 ) ) ( not ( = ?auto_649964 ?auto_649969 ) ) ( not ( = ?auto_649964 ?auto_649970 ) ) ( not ( = ?auto_649964 ?auto_649971 ) ) ( not ( = ?auto_649964 ?auto_649972 ) ) ( not ( = ?auto_649964 ?auto_649973 ) ) ( not ( = ?auto_649965 ?auto_649966 ) ) ( not ( = ?auto_649965 ?auto_649967 ) ) ( not ( = ?auto_649965 ?auto_649968 ) ) ( not ( = ?auto_649965 ?auto_649969 ) ) ( not ( = ?auto_649965 ?auto_649970 ) ) ( not ( = ?auto_649965 ?auto_649971 ) ) ( not ( = ?auto_649965 ?auto_649972 ) ) ( not ( = ?auto_649965 ?auto_649973 ) ) ( not ( = ?auto_649966 ?auto_649967 ) ) ( not ( = ?auto_649966 ?auto_649968 ) ) ( not ( = ?auto_649966 ?auto_649969 ) ) ( not ( = ?auto_649966 ?auto_649970 ) ) ( not ( = ?auto_649966 ?auto_649971 ) ) ( not ( = ?auto_649966 ?auto_649972 ) ) ( not ( = ?auto_649966 ?auto_649973 ) ) ( not ( = ?auto_649967 ?auto_649968 ) ) ( not ( = ?auto_649967 ?auto_649969 ) ) ( not ( = ?auto_649967 ?auto_649970 ) ) ( not ( = ?auto_649967 ?auto_649971 ) ) ( not ( = ?auto_649967 ?auto_649972 ) ) ( not ( = ?auto_649967 ?auto_649973 ) ) ( not ( = ?auto_649968 ?auto_649969 ) ) ( not ( = ?auto_649968 ?auto_649970 ) ) ( not ( = ?auto_649968 ?auto_649971 ) ) ( not ( = ?auto_649968 ?auto_649972 ) ) ( not ( = ?auto_649968 ?auto_649973 ) ) ( not ( = ?auto_649969 ?auto_649970 ) ) ( not ( = ?auto_649969 ?auto_649971 ) ) ( not ( = ?auto_649969 ?auto_649972 ) ) ( not ( = ?auto_649969 ?auto_649973 ) ) ( not ( = ?auto_649970 ?auto_649971 ) ) ( not ( = ?auto_649970 ?auto_649972 ) ) ( not ( = ?auto_649970 ?auto_649973 ) ) ( not ( = ?auto_649971 ?auto_649972 ) ) ( not ( = ?auto_649971 ?auto_649973 ) ) ( not ( = ?auto_649972 ?auto_649973 ) ) ( ON ?auto_649971 ?auto_649972 ) ( ON ?auto_649970 ?auto_649971 ) ( ON ?auto_649969 ?auto_649970 ) ( ON ?auto_649968 ?auto_649969 ) ( ON ?auto_649967 ?auto_649968 ) ( ON ?auto_649966 ?auto_649967 ) ( ON ?auto_649965 ?auto_649966 ) ( ON ?auto_649964 ?auto_649965 ) ( ON ?auto_649963 ?auto_649964 ) ( ON ?auto_649962 ?auto_649963 ) ( ON ?auto_649961 ?auto_649962 ) ( ON ?auto_649960 ?auto_649961 ) ( ON ?auto_649959 ?auto_649960 ) ( ON ?auto_649958 ?auto_649959 ) ( CLEAR ?auto_649956 ) ( ON ?auto_649957 ?auto_649958 ) ( CLEAR ?auto_649957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_649956 ?auto_649957 )
      ( MAKE-17PILE ?auto_649956 ?auto_649957 ?auto_649958 ?auto_649959 ?auto_649960 ?auto_649961 ?auto_649962 ?auto_649963 ?auto_649964 ?auto_649965 ?auto_649966 ?auto_649967 ?auto_649968 ?auto_649969 ?auto_649970 ?auto_649971 ?auto_649972 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_649991 - BLOCK
      ?auto_649992 - BLOCK
      ?auto_649993 - BLOCK
      ?auto_649994 - BLOCK
      ?auto_649995 - BLOCK
      ?auto_649996 - BLOCK
      ?auto_649997 - BLOCK
      ?auto_649998 - BLOCK
      ?auto_649999 - BLOCK
      ?auto_650000 - BLOCK
      ?auto_650001 - BLOCK
      ?auto_650002 - BLOCK
      ?auto_650003 - BLOCK
      ?auto_650004 - BLOCK
      ?auto_650005 - BLOCK
      ?auto_650006 - BLOCK
      ?auto_650007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_650007 ) ( ON-TABLE ?auto_649991 ) ( not ( = ?auto_649991 ?auto_649992 ) ) ( not ( = ?auto_649991 ?auto_649993 ) ) ( not ( = ?auto_649991 ?auto_649994 ) ) ( not ( = ?auto_649991 ?auto_649995 ) ) ( not ( = ?auto_649991 ?auto_649996 ) ) ( not ( = ?auto_649991 ?auto_649997 ) ) ( not ( = ?auto_649991 ?auto_649998 ) ) ( not ( = ?auto_649991 ?auto_649999 ) ) ( not ( = ?auto_649991 ?auto_650000 ) ) ( not ( = ?auto_649991 ?auto_650001 ) ) ( not ( = ?auto_649991 ?auto_650002 ) ) ( not ( = ?auto_649991 ?auto_650003 ) ) ( not ( = ?auto_649991 ?auto_650004 ) ) ( not ( = ?auto_649991 ?auto_650005 ) ) ( not ( = ?auto_649991 ?auto_650006 ) ) ( not ( = ?auto_649991 ?auto_650007 ) ) ( not ( = ?auto_649992 ?auto_649993 ) ) ( not ( = ?auto_649992 ?auto_649994 ) ) ( not ( = ?auto_649992 ?auto_649995 ) ) ( not ( = ?auto_649992 ?auto_649996 ) ) ( not ( = ?auto_649992 ?auto_649997 ) ) ( not ( = ?auto_649992 ?auto_649998 ) ) ( not ( = ?auto_649992 ?auto_649999 ) ) ( not ( = ?auto_649992 ?auto_650000 ) ) ( not ( = ?auto_649992 ?auto_650001 ) ) ( not ( = ?auto_649992 ?auto_650002 ) ) ( not ( = ?auto_649992 ?auto_650003 ) ) ( not ( = ?auto_649992 ?auto_650004 ) ) ( not ( = ?auto_649992 ?auto_650005 ) ) ( not ( = ?auto_649992 ?auto_650006 ) ) ( not ( = ?auto_649992 ?auto_650007 ) ) ( not ( = ?auto_649993 ?auto_649994 ) ) ( not ( = ?auto_649993 ?auto_649995 ) ) ( not ( = ?auto_649993 ?auto_649996 ) ) ( not ( = ?auto_649993 ?auto_649997 ) ) ( not ( = ?auto_649993 ?auto_649998 ) ) ( not ( = ?auto_649993 ?auto_649999 ) ) ( not ( = ?auto_649993 ?auto_650000 ) ) ( not ( = ?auto_649993 ?auto_650001 ) ) ( not ( = ?auto_649993 ?auto_650002 ) ) ( not ( = ?auto_649993 ?auto_650003 ) ) ( not ( = ?auto_649993 ?auto_650004 ) ) ( not ( = ?auto_649993 ?auto_650005 ) ) ( not ( = ?auto_649993 ?auto_650006 ) ) ( not ( = ?auto_649993 ?auto_650007 ) ) ( not ( = ?auto_649994 ?auto_649995 ) ) ( not ( = ?auto_649994 ?auto_649996 ) ) ( not ( = ?auto_649994 ?auto_649997 ) ) ( not ( = ?auto_649994 ?auto_649998 ) ) ( not ( = ?auto_649994 ?auto_649999 ) ) ( not ( = ?auto_649994 ?auto_650000 ) ) ( not ( = ?auto_649994 ?auto_650001 ) ) ( not ( = ?auto_649994 ?auto_650002 ) ) ( not ( = ?auto_649994 ?auto_650003 ) ) ( not ( = ?auto_649994 ?auto_650004 ) ) ( not ( = ?auto_649994 ?auto_650005 ) ) ( not ( = ?auto_649994 ?auto_650006 ) ) ( not ( = ?auto_649994 ?auto_650007 ) ) ( not ( = ?auto_649995 ?auto_649996 ) ) ( not ( = ?auto_649995 ?auto_649997 ) ) ( not ( = ?auto_649995 ?auto_649998 ) ) ( not ( = ?auto_649995 ?auto_649999 ) ) ( not ( = ?auto_649995 ?auto_650000 ) ) ( not ( = ?auto_649995 ?auto_650001 ) ) ( not ( = ?auto_649995 ?auto_650002 ) ) ( not ( = ?auto_649995 ?auto_650003 ) ) ( not ( = ?auto_649995 ?auto_650004 ) ) ( not ( = ?auto_649995 ?auto_650005 ) ) ( not ( = ?auto_649995 ?auto_650006 ) ) ( not ( = ?auto_649995 ?auto_650007 ) ) ( not ( = ?auto_649996 ?auto_649997 ) ) ( not ( = ?auto_649996 ?auto_649998 ) ) ( not ( = ?auto_649996 ?auto_649999 ) ) ( not ( = ?auto_649996 ?auto_650000 ) ) ( not ( = ?auto_649996 ?auto_650001 ) ) ( not ( = ?auto_649996 ?auto_650002 ) ) ( not ( = ?auto_649996 ?auto_650003 ) ) ( not ( = ?auto_649996 ?auto_650004 ) ) ( not ( = ?auto_649996 ?auto_650005 ) ) ( not ( = ?auto_649996 ?auto_650006 ) ) ( not ( = ?auto_649996 ?auto_650007 ) ) ( not ( = ?auto_649997 ?auto_649998 ) ) ( not ( = ?auto_649997 ?auto_649999 ) ) ( not ( = ?auto_649997 ?auto_650000 ) ) ( not ( = ?auto_649997 ?auto_650001 ) ) ( not ( = ?auto_649997 ?auto_650002 ) ) ( not ( = ?auto_649997 ?auto_650003 ) ) ( not ( = ?auto_649997 ?auto_650004 ) ) ( not ( = ?auto_649997 ?auto_650005 ) ) ( not ( = ?auto_649997 ?auto_650006 ) ) ( not ( = ?auto_649997 ?auto_650007 ) ) ( not ( = ?auto_649998 ?auto_649999 ) ) ( not ( = ?auto_649998 ?auto_650000 ) ) ( not ( = ?auto_649998 ?auto_650001 ) ) ( not ( = ?auto_649998 ?auto_650002 ) ) ( not ( = ?auto_649998 ?auto_650003 ) ) ( not ( = ?auto_649998 ?auto_650004 ) ) ( not ( = ?auto_649998 ?auto_650005 ) ) ( not ( = ?auto_649998 ?auto_650006 ) ) ( not ( = ?auto_649998 ?auto_650007 ) ) ( not ( = ?auto_649999 ?auto_650000 ) ) ( not ( = ?auto_649999 ?auto_650001 ) ) ( not ( = ?auto_649999 ?auto_650002 ) ) ( not ( = ?auto_649999 ?auto_650003 ) ) ( not ( = ?auto_649999 ?auto_650004 ) ) ( not ( = ?auto_649999 ?auto_650005 ) ) ( not ( = ?auto_649999 ?auto_650006 ) ) ( not ( = ?auto_649999 ?auto_650007 ) ) ( not ( = ?auto_650000 ?auto_650001 ) ) ( not ( = ?auto_650000 ?auto_650002 ) ) ( not ( = ?auto_650000 ?auto_650003 ) ) ( not ( = ?auto_650000 ?auto_650004 ) ) ( not ( = ?auto_650000 ?auto_650005 ) ) ( not ( = ?auto_650000 ?auto_650006 ) ) ( not ( = ?auto_650000 ?auto_650007 ) ) ( not ( = ?auto_650001 ?auto_650002 ) ) ( not ( = ?auto_650001 ?auto_650003 ) ) ( not ( = ?auto_650001 ?auto_650004 ) ) ( not ( = ?auto_650001 ?auto_650005 ) ) ( not ( = ?auto_650001 ?auto_650006 ) ) ( not ( = ?auto_650001 ?auto_650007 ) ) ( not ( = ?auto_650002 ?auto_650003 ) ) ( not ( = ?auto_650002 ?auto_650004 ) ) ( not ( = ?auto_650002 ?auto_650005 ) ) ( not ( = ?auto_650002 ?auto_650006 ) ) ( not ( = ?auto_650002 ?auto_650007 ) ) ( not ( = ?auto_650003 ?auto_650004 ) ) ( not ( = ?auto_650003 ?auto_650005 ) ) ( not ( = ?auto_650003 ?auto_650006 ) ) ( not ( = ?auto_650003 ?auto_650007 ) ) ( not ( = ?auto_650004 ?auto_650005 ) ) ( not ( = ?auto_650004 ?auto_650006 ) ) ( not ( = ?auto_650004 ?auto_650007 ) ) ( not ( = ?auto_650005 ?auto_650006 ) ) ( not ( = ?auto_650005 ?auto_650007 ) ) ( not ( = ?auto_650006 ?auto_650007 ) ) ( ON ?auto_650006 ?auto_650007 ) ( ON ?auto_650005 ?auto_650006 ) ( ON ?auto_650004 ?auto_650005 ) ( ON ?auto_650003 ?auto_650004 ) ( ON ?auto_650002 ?auto_650003 ) ( ON ?auto_650001 ?auto_650002 ) ( ON ?auto_650000 ?auto_650001 ) ( ON ?auto_649999 ?auto_650000 ) ( ON ?auto_649998 ?auto_649999 ) ( ON ?auto_649997 ?auto_649998 ) ( ON ?auto_649996 ?auto_649997 ) ( ON ?auto_649995 ?auto_649996 ) ( ON ?auto_649994 ?auto_649995 ) ( ON ?auto_649993 ?auto_649994 ) ( CLEAR ?auto_649991 ) ( ON ?auto_649992 ?auto_649993 ) ( CLEAR ?auto_649992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_649991 ?auto_649992 )
      ( MAKE-17PILE ?auto_649991 ?auto_649992 ?auto_649993 ?auto_649994 ?auto_649995 ?auto_649996 ?auto_649997 ?auto_649998 ?auto_649999 ?auto_650000 ?auto_650001 ?auto_650002 ?auto_650003 ?auto_650004 ?auto_650005 ?auto_650006 ?auto_650007 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_650025 - BLOCK
      ?auto_650026 - BLOCK
      ?auto_650027 - BLOCK
      ?auto_650028 - BLOCK
      ?auto_650029 - BLOCK
      ?auto_650030 - BLOCK
      ?auto_650031 - BLOCK
      ?auto_650032 - BLOCK
      ?auto_650033 - BLOCK
      ?auto_650034 - BLOCK
      ?auto_650035 - BLOCK
      ?auto_650036 - BLOCK
      ?auto_650037 - BLOCK
      ?auto_650038 - BLOCK
      ?auto_650039 - BLOCK
      ?auto_650040 - BLOCK
      ?auto_650041 - BLOCK
    )
    :vars
    (
      ?auto_650042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_650041 ?auto_650042 ) ( not ( = ?auto_650025 ?auto_650026 ) ) ( not ( = ?auto_650025 ?auto_650027 ) ) ( not ( = ?auto_650025 ?auto_650028 ) ) ( not ( = ?auto_650025 ?auto_650029 ) ) ( not ( = ?auto_650025 ?auto_650030 ) ) ( not ( = ?auto_650025 ?auto_650031 ) ) ( not ( = ?auto_650025 ?auto_650032 ) ) ( not ( = ?auto_650025 ?auto_650033 ) ) ( not ( = ?auto_650025 ?auto_650034 ) ) ( not ( = ?auto_650025 ?auto_650035 ) ) ( not ( = ?auto_650025 ?auto_650036 ) ) ( not ( = ?auto_650025 ?auto_650037 ) ) ( not ( = ?auto_650025 ?auto_650038 ) ) ( not ( = ?auto_650025 ?auto_650039 ) ) ( not ( = ?auto_650025 ?auto_650040 ) ) ( not ( = ?auto_650025 ?auto_650041 ) ) ( not ( = ?auto_650025 ?auto_650042 ) ) ( not ( = ?auto_650026 ?auto_650027 ) ) ( not ( = ?auto_650026 ?auto_650028 ) ) ( not ( = ?auto_650026 ?auto_650029 ) ) ( not ( = ?auto_650026 ?auto_650030 ) ) ( not ( = ?auto_650026 ?auto_650031 ) ) ( not ( = ?auto_650026 ?auto_650032 ) ) ( not ( = ?auto_650026 ?auto_650033 ) ) ( not ( = ?auto_650026 ?auto_650034 ) ) ( not ( = ?auto_650026 ?auto_650035 ) ) ( not ( = ?auto_650026 ?auto_650036 ) ) ( not ( = ?auto_650026 ?auto_650037 ) ) ( not ( = ?auto_650026 ?auto_650038 ) ) ( not ( = ?auto_650026 ?auto_650039 ) ) ( not ( = ?auto_650026 ?auto_650040 ) ) ( not ( = ?auto_650026 ?auto_650041 ) ) ( not ( = ?auto_650026 ?auto_650042 ) ) ( not ( = ?auto_650027 ?auto_650028 ) ) ( not ( = ?auto_650027 ?auto_650029 ) ) ( not ( = ?auto_650027 ?auto_650030 ) ) ( not ( = ?auto_650027 ?auto_650031 ) ) ( not ( = ?auto_650027 ?auto_650032 ) ) ( not ( = ?auto_650027 ?auto_650033 ) ) ( not ( = ?auto_650027 ?auto_650034 ) ) ( not ( = ?auto_650027 ?auto_650035 ) ) ( not ( = ?auto_650027 ?auto_650036 ) ) ( not ( = ?auto_650027 ?auto_650037 ) ) ( not ( = ?auto_650027 ?auto_650038 ) ) ( not ( = ?auto_650027 ?auto_650039 ) ) ( not ( = ?auto_650027 ?auto_650040 ) ) ( not ( = ?auto_650027 ?auto_650041 ) ) ( not ( = ?auto_650027 ?auto_650042 ) ) ( not ( = ?auto_650028 ?auto_650029 ) ) ( not ( = ?auto_650028 ?auto_650030 ) ) ( not ( = ?auto_650028 ?auto_650031 ) ) ( not ( = ?auto_650028 ?auto_650032 ) ) ( not ( = ?auto_650028 ?auto_650033 ) ) ( not ( = ?auto_650028 ?auto_650034 ) ) ( not ( = ?auto_650028 ?auto_650035 ) ) ( not ( = ?auto_650028 ?auto_650036 ) ) ( not ( = ?auto_650028 ?auto_650037 ) ) ( not ( = ?auto_650028 ?auto_650038 ) ) ( not ( = ?auto_650028 ?auto_650039 ) ) ( not ( = ?auto_650028 ?auto_650040 ) ) ( not ( = ?auto_650028 ?auto_650041 ) ) ( not ( = ?auto_650028 ?auto_650042 ) ) ( not ( = ?auto_650029 ?auto_650030 ) ) ( not ( = ?auto_650029 ?auto_650031 ) ) ( not ( = ?auto_650029 ?auto_650032 ) ) ( not ( = ?auto_650029 ?auto_650033 ) ) ( not ( = ?auto_650029 ?auto_650034 ) ) ( not ( = ?auto_650029 ?auto_650035 ) ) ( not ( = ?auto_650029 ?auto_650036 ) ) ( not ( = ?auto_650029 ?auto_650037 ) ) ( not ( = ?auto_650029 ?auto_650038 ) ) ( not ( = ?auto_650029 ?auto_650039 ) ) ( not ( = ?auto_650029 ?auto_650040 ) ) ( not ( = ?auto_650029 ?auto_650041 ) ) ( not ( = ?auto_650029 ?auto_650042 ) ) ( not ( = ?auto_650030 ?auto_650031 ) ) ( not ( = ?auto_650030 ?auto_650032 ) ) ( not ( = ?auto_650030 ?auto_650033 ) ) ( not ( = ?auto_650030 ?auto_650034 ) ) ( not ( = ?auto_650030 ?auto_650035 ) ) ( not ( = ?auto_650030 ?auto_650036 ) ) ( not ( = ?auto_650030 ?auto_650037 ) ) ( not ( = ?auto_650030 ?auto_650038 ) ) ( not ( = ?auto_650030 ?auto_650039 ) ) ( not ( = ?auto_650030 ?auto_650040 ) ) ( not ( = ?auto_650030 ?auto_650041 ) ) ( not ( = ?auto_650030 ?auto_650042 ) ) ( not ( = ?auto_650031 ?auto_650032 ) ) ( not ( = ?auto_650031 ?auto_650033 ) ) ( not ( = ?auto_650031 ?auto_650034 ) ) ( not ( = ?auto_650031 ?auto_650035 ) ) ( not ( = ?auto_650031 ?auto_650036 ) ) ( not ( = ?auto_650031 ?auto_650037 ) ) ( not ( = ?auto_650031 ?auto_650038 ) ) ( not ( = ?auto_650031 ?auto_650039 ) ) ( not ( = ?auto_650031 ?auto_650040 ) ) ( not ( = ?auto_650031 ?auto_650041 ) ) ( not ( = ?auto_650031 ?auto_650042 ) ) ( not ( = ?auto_650032 ?auto_650033 ) ) ( not ( = ?auto_650032 ?auto_650034 ) ) ( not ( = ?auto_650032 ?auto_650035 ) ) ( not ( = ?auto_650032 ?auto_650036 ) ) ( not ( = ?auto_650032 ?auto_650037 ) ) ( not ( = ?auto_650032 ?auto_650038 ) ) ( not ( = ?auto_650032 ?auto_650039 ) ) ( not ( = ?auto_650032 ?auto_650040 ) ) ( not ( = ?auto_650032 ?auto_650041 ) ) ( not ( = ?auto_650032 ?auto_650042 ) ) ( not ( = ?auto_650033 ?auto_650034 ) ) ( not ( = ?auto_650033 ?auto_650035 ) ) ( not ( = ?auto_650033 ?auto_650036 ) ) ( not ( = ?auto_650033 ?auto_650037 ) ) ( not ( = ?auto_650033 ?auto_650038 ) ) ( not ( = ?auto_650033 ?auto_650039 ) ) ( not ( = ?auto_650033 ?auto_650040 ) ) ( not ( = ?auto_650033 ?auto_650041 ) ) ( not ( = ?auto_650033 ?auto_650042 ) ) ( not ( = ?auto_650034 ?auto_650035 ) ) ( not ( = ?auto_650034 ?auto_650036 ) ) ( not ( = ?auto_650034 ?auto_650037 ) ) ( not ( = ?auto_650034 ?auto_650038 ) ) ( not ( = ?auto_650034 ?auto_650039 ) ) ( not ( = ?auto_650034 ?auto_650040 ) ) ( not ( = ?auto_650034 ?auto_650041 ) ) ( not ( = ?auto_650034 ?auto_650042 ) ) ( not ( = ?auto_650035 ?auto_650036 ) ) ( not ( = ?auto_650035 ?auto_650037 ) ) ( not ( = ?auto_650035 ?auto_650038 ) ) ( not ( = ?auto_650035 ?auto_650039 ) ) ( not ( = ?auto_650035 ?auto_650040 ) ) ( not ( = ?auto_650035 ?auto_650041 ) ) ( not ( = ?auto_650035 ?auto_650042 ) ) ( not ( = ?auto_650036 ?auto_650037 ) ) ( not ( = ?auto_650036 ?auto_650038 ) ) ( not ( = ?auto_650036 ?auto_650039 ) ) ( not ( = ?auto_650036 ?auto_650040 ) ) ( not ( = ?auto_650036 ?auto_650041 ) ) ( not ( = ?auto_650036 ?auto_650042 ) ) ( not ( = ?auto_650037 ?auto_650038 ) ) ( not ( = ?auto_650037 ?auto_650039 ) ) ( not ( = ?auto_650037 ?auto_650040 ) ) ( not ( = ?auto_650037 ?auto_650041 ) ) ( not ( = ?auto_650037 ?auto_650042 ) ) ( not ( = ?auto_650038 ?auto_650039 ) ) ( not ( = ?auto_650038 ?auto_650040 ) ) ( not ( = ?auto_650038 ?auto_650041 ) ) ( not ( = ?auto_650038 ?auto_650042 ) ) ( not ( = ?auto_650039 ?auto_650040 ) ) ( not ( = ?auto_650039 ?auto_650041 ) ) ( not ( = ?auto_650039 ?auto_650042 ) ) ( not ( = ?auto_650040 ?auto_650041 ) ) ( not ( = ?auto_650040 ?auto_650042 ) ) ( not ( = ?auto_650041 ?auto_650042 ) ) ( ON ?auto_650040 ?auto_650041 ) ( ON ?auto_650039 ?auto_650040 ) ( ON ?auto_650038 ?auto_650039 ) ( ON ?auto_650037 ?auto_650038 ) ( ON ?auto_650036 ?auto_650037 ) ( ON ?auto_650035 ?auto_650036 ) ( ON ?auto_650034 ?auto_650035 ) ( ON ?auto_650033 ?auto_650034 ) ( ON ?auto_650032 ?auto_650033 ) ( ON ?auto_650031 ?auto_650032 ) ( ON ?auto_650030 ?auto_650031 ) ( ON ?auto_650029 ?auto_650030 ) ( ON ?auto_650028 ?auto_650029 ) ( ON ?auto_650027 ?auto_650028 ) ( ON ?auto_650026 ?auto_650027 ) ( ON ?auto_650025 ?auto_650026 ) ( CLEAR ?auto_650025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650025 )
      ( MAKE-17PILE ?auto_650025 ?auto_650026 ?auto_650027 ?auto_650028 ?auto_650029 ?auto_650030 ?auto_650031 ?auto_650032 ?auto_650033 ?auto_650034 ?auto_650035 ?auto_650036 ?auto_650037 ?auto_650038 ?auto_650039 ?auto_650040 ?auto_650041 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_650060 - BLOCK
      ?auto_650061 - BLOCK
      ?auto_650062 - BLOCK
      ?auto_650063 - BLOCK
      ?auto_650064 - BLOCK
      ?auto_650065 - BLOCK
      ?auto_650066 - BLOCK
      ?auto_650067 - BLOCK
      ?auto_650068 - BLOCK
      ?auto_650069 - BLOCK
      ?auto_650070 - BLOCK
      ?auto_650071 - BLOCK
      ?auto_650072 - BLOCK
      ?auto_650073 - BLOCK
      ?auto_650074 - BLOCK
      ?auto_650075 - BLOCK
      ?auto_650076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_650076 ) ( not ( = ?auto_650060 ?auto_650061 ) ) ( not ( = ?auto_650060 ?auto_650062 ) ) ( not ( = ?auto_650060 ?auto_650063 ) ) ( not ( = ?auto_650060 ?auto_650064 ) ) ( not ( = ?auto_650060 ?auto_650065 ) ) ( not ( = ?auto_650060 ?auto_650066 ) ) ( not ( = ?auto_650060 ?auto_650067 ) ) ( not ( = ?auto_650060 ?auto_650068 ) ) ( not ( = ?auto_650060 ?auto_650069 ) ) ( not ( = ?auto_650060 ?auto_650070 ) ) ( not ( = ?auto_650060 ?auto_650071 ) ) ( not ( = ?auto_650060 ?auto_650072 ) ) ( not ( = ?auto_650060 ?auto_650073 ) ) ( not ( = ?auto_650060 ?auto_650074 ) ) ( not ( = ?auto_650060 ?auto_650075 ) ) ( not ( = ?auto_650060 ?auto_650076 ) ) ( not ( = ?auto_650061 ?auto_650062 ) ) ( not ( = ?auto_650061 ?auto_650063 ) ) ( not ( = ?auto_650061 ?auto_650064 ) ) ( not ( = ?auto_650061 ?auto_650065 ) ) ( not ( = ?auto_650061 ?auto_650066 ) ) ( not ( = ?auto_650061 ?auto_650067 ) ) ( not ( = ?auto_650061 ?auto_650068 ) ) ( not ( = ?auto_650061 ?auto_650069 ) ) ( not ( = ?auto_650061 ?auto_650070 ) ) ( not ( = ?auto_650061 ?auto_650071 ) ) ( not ( = ?auto_650061 ?auto_650072 ) ) ( not ( = ?auto_650061 ?auto_650073 ) ) ( not ( = ?auto_650061 ?auto_650074 ) ) ( not ( = ?auto_650061 ?auto_650075 ) ) ( not ( = ?auto_650061 ?auto_650076 ) ) ( not ( = ?auto_650062 ?auto_650063 ) ) ( not ( = ?auto_650062 ?auto_650064 ) ) ( not ( = ?auto_650062 ?auto_650065 ) ) ( not ( = ?auto_650062 ?auto_650066 ) ) ( not ( = ?auto_650062 ?auto_650067 ) ) ( not ( = ?auto_650062 ?auto_650068 ) ) ( not ( = ?auto_650062 ?auto_650069 ) ) ( not ( = ?auto_650062 ?auto_650070 ) ) ( not ( = ?auto_650062 ?auto_650071 ) ) ( not ( = ?auto_650062 ?auto_650072 ) ) ( not ( = ?auto_650062 ?auto_650073 ) ) ( not ( = ?auto_650062 ?auto_650074 ) ) ( not ( = ?auto_650062 ?auto_650075 ) ) ( not ( = ?auto_650062 ?auto_650076 ) ) ( not ( = ?auto_650063 ?auto_650064 ) ) ( not ( = ?auto_650063 ?auto_650065 ) ) ( not ( = ?auto_650063 ?auto_650066 ) ) ( not ( = ?auto_650063 ?auto_650067 ) ) ( not ( = ?auto_650063 ?auto_650068 ) ) ( not ( = ?auto_650063 ?auto_650069 ) ) ( not ( = ?auto_650063 ?auto_650070 ) ) ( not ( = ?auto_650063 ?auto_650071 ) ) ( not ( = ?auto_650063 ?auto_650072 ) ) ( not ( = ?auto_650063 ?auto_650073 ) ) ( not ( = ?auto_650063 ?auto_650074 ) ) ( not ( = ?auto_650063 ?auto_650075 ) ) ( not ( = ?auto_650063 ?auto_650076 ) ) ( not ( = ?auto_650064 ?auto_650065 ) ) ( not ( = ?auto_650064 ?auto_650066 ) ) ( not ( = ?auto_650064 ?auto_650067 ) ) ( not ( = ?auto_650064 ?auto_650068 ) ) ( not ( = ?auto_650064 ?auto_650069 ) ) ( not ( = ?auto_650064 ?auto_650070 ) ) ( not ( = ?auto_650064 ?auto_650071 ) ) ( not ( = ?auto_650064 ?auto_650072 ) ) ( not ( = ?auto_650064 ?auto_650073 ) ) ( not ( = ?auto_650064 ?auto_650074 ) ) ( not ( = ?auto_650064 ?auto_650075 ) ) ( not ( = ?auto_650064 ?auto_650076 ) ) ( not ( = ?auto_650065 ?auto_650066 ) ) ( not ( = ?auto_650065 ?auto_650067 ) ) ( not ( = ?auto_650065 ?auto_650068 ) ) ( not ( = ?auto_650065 ?auto_650069 ) ) ( not ( = ?auto_650065 ?auto_650070 ) ) ( not ( = ?auto_650065 ?auto_650071 ) ) ( not ( = ?auto_650065 ?auto_650072 ) ) ( not ( = ?auto_650065 ?auto_650073 ) ) ( not ( = ?auto_650065 ?auto_650074 ) ) ( not ( = ?auto_650065 ?auto_650075 ) ) ( not ( = ?auto_650065 ?auto_650076 ) ) ( not ( = ?auto_650066 ?auto_650067 ) ) ( not ( = ?auto_650066 ?auto_650068 ) ) ( not ( = ?auto_650066 ?auto_650069 ) ) ( not ( = ?auto_650066 ?auto_650070 ) ) ( not ( = ?auto_650066 ?auto_650071 ) ) ( not ( = ?auto_650066 ?auto_650072 ) ) ( not ( = ?auto_650066 ?auto_650073 ) ) ( not ( = ?auto_650066 ?auto_650074 ) ) ( not ( = ?auto_650066 ?auto_650075 ) ) ( not ( = ?auto_650066 ?auto_650076 ) ) ( not ( = ?auto_650067 ?auto_650068 ) ) ( not ( = ?auto_650067 ?auto_650069 ) ) ( not ( = ?auto_650067 ?auto_650070 ) ) ( not ( = ?auto_650067 ?auto_650071 ) ) ( not ( = ?auto_650067 ?auto_650072 ) ) ( not ( = ?auto_650067 ?auto_650073 ) ) ( not ( = ?auto_650067 ?auto_650074 ) ) ( not ( = ?auto_650067 ?auto_650075 ) ) ( not ( = ?auto_650067 ?auto_650076 ) ) ( not ( = ?auto_650068 ?auto_650069 ) ) ( not ( = ?auto_650068 ?auto_650070 ) ) ( not ( = ?auto_650068 ?auto_650071 ) ) ( not ( = ?auto_650068 ?auto_650072 ) ) ( not ( = ?auto_650068 ?auto_650073 ) ) ( not ( = ?auto_650068 ?auto_650074 ) ) ( not ( = ?auto_650068 ?auto_650075 ) ) ( not ( = ?auto_650068 ?auto_650076 ) ) ( not ( = ?auto_650069 ?auto_650070 ) ) ( not ( = ?auto_650069 ?auto_650071 ) ) ( not ( = ?auto_650069 ?auto_650072 ) ) ( not ( = ?auto_650069 ?auto_650073 ) ) ( not ( = ?auto_650069 ?auto_650074 ) ) ( not ( = ?auto_650069 ?auto_650075 ) ) ( not ( = ?auto_650069 ?auto_650076 ) ) ( not ( = ?auto_650070 ?auto_650071 ) ) ( not ( = ?auto_650070 ?auto_650072 ) ) ( not ( = ?auto_650070 ?auto_650073 ) ) ( not ( = ?auto_650070 ?auto_650074 ) ) ( not ( = ?auto_650070 ?auto_650075 ) ) ( not ( = ?auto_650070 ?auto_650076 ) ) ( not ( = ?auto_650071 ?auto_650072 ) ) ( not ( = ?auto_650071 ?auto_650073 ) ) ( not ( = ?auto_650071 ?auto_650074 ) ) ( not ( = ?auto_650071 ?auto_650075 ) ) ( not ( = ?auto_650071 ?auto_650076 ) ) ( not ( = ?auto_650072 ?auto_650073 ) ) ( not ( = ?auto_650072 ?auto_650074 ) ) ( not ( = ?auto_650072 ?auto_650075 ) ) ( not ( = ?auto_650072 ?auto_650076 ) ) ( not ( = ?auto_650073 ?auto_650074 ) ) ( not ( = ?auto_650073 ?auto_650075 ) ) ( not ( = ?auto_650073 ?auto_650076 ) ) ( not ( = ?auto_650074 ?auto_650075 ) ) ( not ( = ?auto_650074 ?auto_650076 ) ) ( not ( = ?auto_650075 ?auto_650076 ) ) ( ON ?auto_650075 ?auto_650076 ) ( ON ?auto_650074 ?auto_650075 ) ( ON ?auto_650073 ?auto_650074 ) ( ON ?auto_650072 ?auto_650073 ) ( ON ?auto_650071 ?auto_650072 ) ( ON ?auto_650070 ?auto_650071 ) ( ON ?auto_650069 ?auto_650070 ) ( ON ?auto_650068 ?auto_650069 ) ( ON ?auto_650067 ?auto_650068 ) ( ON ?auto_650066 ?auto_650067 ) ( ON ?auto_650065 ?auto_650066 ) ( ON ?auto_650064 ?auto_650065 ) ( ON ?auto_650063 ?auto_650064 ) ( ON ?auto_650062 ?auto_650063 ) ( ON ?auto_650061 ?auto_650062 ) ( ON ?auto_650060 ?auto_650061 ) ( CLEAR ?auto_650060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_650060 )
      ( MAKE-17PILE ?auto_650060 ?auto_650061 ?auto_650062 ?auto_650063 ?auto_650064 ?auto_650065 ?auto_650066 ?auto_650067 ?auto_650068 ?auto_650069 ?auto_650070 ?auto_650071 ?auto_650072 ?auto_650073 ?auto_650074 ?auto_650075 ?auto_650076 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_650094 - BLOCK
      ?auto_650095 - BLOCK
      ?auto_650096 - BLOCK
      ?auto_650097 - BLOCK
      ?auto_650098 - BLOCK
      ?auto_650099 - BLOCK
      ?auto_650100 - BLOCK
      ?auto_650101 - BLOCK
      ?auto_650102 - BLOCK
      ?auto_650103 - BLOCK
      ?auto_650104 - BLOCK
      ?auto_650105 - BLOCK
      ?auto_650106 - BLOCK
      ?auto_650107 - BLOCK
      ?auto_650108 - BLOCK
      ?auto_650109 - BLOCK
      ?auto_650110 - BLOCK
    )
    :vars
    (
      ?auto_650111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_650094 ?auto_650095 ) ) ( not ( = ?auto_650094 ?auto_650096 ) ) ( not ( = ?auto_650094 ?auto_650097 ) ) ( not ( = ?auto_650094 ?auto_650098 ) ) ( not ( = ?auto_650094 ?auto_650099 ) ) ( not ( = ?auto_650094 ?auto_650100 ) ) ( not ( = ?auto_650094 ?auto_650101 ) ) ( not ( = ?auto_650094 ?auto_650102 ) ) ( not ( = ?auto_650094 ?auto_650103 ) ) ( not ( = ?auto_650094 ?auto_650104 ) ) ( not ( = ?auto_650094 ?auto_650105 ) ) ( not ( = ?auto_650094 ?auto_650106 ) ) ( not ( = ?auto_650094 ?auto_650107 ) ) ( not ( = ?auto_650094 ?auto_650108 ) ) ( not ( = ?auto_650094 ?auto_650109 ) ) ( not ( = ?auto_650094 ?auto_650110 ) ) ( not ( = ?auto_650095 ?auto_650096 ) ) ( not ( = ?auto_650095 ?auto_650097 ) ) ( not ( = ?auto_650095 ?auto_650098 ) ) ( not ( = ?auto_650095 ?auto_650099 ) ) ( not ( = ?auto_650095 ?auto_650100 ) ) ( not ( = ?auto_650095 ?auto_650101 ) ) ( not ( = ?auto_650095 ?auto_650102 ) ) ( not ( = ?auto_650095 ?auto_650103 ) ) ( not ( = ?auto_650095 ?auto_650104 ) ) ( not ( = ?auto_650095 ?auto_650105 ) ) ( not ( = ?auto_650095 ?auto_650106 ) ) ( not ( = ?auto_650095 ?auto_650107 ) ) ( not ( = ?auto_650095 ?auto_650108 ) ) ( not ( = ?auto_650095 ?auto_650109 ) ) ( not ( = ?auto_650095 ?auto_650110 ) ) ( not ( = ?auto_650096 ?auto_650097 ) ) ( not ( = ?auto_650096 ?auto_650098 ) ) ( not ( = ?auto_650096 ?auto_650099 ) ) ( not ( = ?auto_650096 ?auto_650100 ) ) ( not ( = ?auto_650096 ?auto_650101 ) ) ( not ( = ?auto_650096 ?auto_650102 ) ) ( not ( = ?auto_650096 ?auto_650103 ) ) ( not ( = ?auto_650096 ?auto_650104 ) ) ( not ( = ?auto_650096 ?auto_650105 ) ) ( not ( = ?auto_650096 ?auto_650106 ) ) ( not ( = ?auto_650096 ?auto_650107 ) ) ( not ( = ?auto_650096 ?auto_650108 ) ) ( not ( = ?auto_650096 ?auto_650109 ) ) ( not ( = ?auto_650096 ?auto_650110 ) ) ( not ( = ?auto_650097 ?auto_650098 ) ) ( not ( = ?auto_650097 ?auto_650099 ) ) ( not ( = ?auto_650097 ?auto_650100 ) ) ( not ( = ?auto_650097 ?auto_650101 ) ) ( not ( = ?auto_650097 ?auto_650102 ) ) ( not ( = ?auto_650097 ?auto_650103 ) ) ( not ( = ?auto_650097 ?auto_650104 ) ) ( not ( = ?auto_650097 ?auto_650105 ) ) ( not ( = ?auto_650097 ?auto_650106 ) ) ( not ( = ?auto_650097 ?auto_650107 ) ) ( not ( = ?auto_650097 ?auto_650108 ) ) ( not ( = ?auto_650097 ?auto_650109 ) ) ( not ( = ?auto_650097 ?auto_650110 ) ) ( not ( = ?auto_650098 ?auto_650099 ) ) ( not ( = ?auto_650098 ?auto_650100 ) ) ( not ( = ?auto_650098 ?auto_650101 ) ) ( not ( = ?auto_650098 ?auto_650102 ) ) ( not ( = ?auto_650098 ?auto_650103 ) ) ( not ( = ?auto_650098 ?auto_650104 ) ) ( not ( = ?auto_650098 ?auto_650105 ) ) ( not ( = ?auto_650098 ?auto_650106 ) ) ( not ( = ?auto_650098 ?auto_650107 ) ) ( not ( = ?auto_650098 ?auto_650108 ) ) ( not ( = ?auto_650098 ?auto_650109 ) ) ( not ( = ?auto_650098 ?auto_650110 ) ) ( not ( = ?auto_650099 ?auto_650100 ) ) ( not ( = ?auto_650099 ?auto_650101 ) ) ( not ( = ?auto_650099 ?auto_650102 ) ) ( not ( = ?auto_650099 ?auto_650103 ) ) ( not ( = ?auto_650099 ?auto_650104 ) ) ( not ( = ?auto_650099 ?auto_650105 ) ) ( not ( = ?auto_650099 ?auto_650106 ) ) ( not ( = ?auto_650099 ?auto_650107 ) ) ( not ( = ?auto_650099 ?auto_650108 ) ) ( not ( = ?auto_650099 ?auto_650109 ) ) ( not ( = ?auto_650099 ?auto_650110 ) ) ( not ( = ?auto_650100 ?auto_650101 ) ) ( not ( = ?auto_650100 ?auto_650102 ) ) ( not ( = ?auto_650100 ?auto_650103 ) ) ( not ( = ?auto_650100 ?auto_650104 ) ) ( not ( = ?auto_650100 ?auto_650105 ) ) ( not ( = ?auto_650100 ?auto_650106 ) ) ( not ( = ?auto_650100 ?auto_650107 ) ) ( not ( = ?auto_650100 ?auto_650108 ) ) ( not ( = ?auto_650100 ?auto_650109 ) ) ( not ( = ?auto_650100 ?auto_650110 ) ) ( not ( = ?auto_650101 ?auto_650102 ) ) ( not ( = ?auto_650101 ?auto_650103 ) ) ( not ( = ?auto_650101 ?auto_650104 ) ) ( not ( = ?auto_650101 ?auto_650105 ) ) ( not ( = ?auto_650101 ?auto_650106 ) ) ( not ( = ?auto_650101 ?auto_650107 ) ) ( not ( = ?auto_650101 ?auto_650108 ) ) ( not ( = ?auto_650101 ?auto_650109 ) ) ( not ( = ?auto_650101 ?auto_650110 ) ) ( not ( = ?auto_650102 ?auto_650103 ) ) ( not ( = ?auto_650102 ?auto_650104 ) ) ( not ( = ?auto_650102 ?auto_650105 ) ) ( not ( = ?auto_650102 ?auto_650106 ) ) ( not ( = ?auto_650102 ?auto_650107 ) ) ( not ( = ?auto_650102 ?auto_650108 ) ) ( not ( = ?auto_650102 ?auto_650109 ) ) ( not ( = ?auto_650102 ?auto_650110 ) ) ( not ( = ?auto_650103 ?auto_650104 ) ) ( not ( = ?auto_650103 ?auto_650105 ) ) ( not ( = ?auto_650103 ?auto_650106 ) ) ( not ( = ?auto_650103 ?auto_650107 ) ) ( not ( = ?auto_650103 ?auto_650108 ) ) ( not ( = ?auto_650103 ?auto_650109 ) ) ( not ( = ?auto_650103 ?auto_650110 ) ) ( not ( = ?auto_650104 ?auto_650105 ) ) ( not ( = ?auto_650104 ?auto_650106 ) ) ( not ( = ?auto_650104 ?auto_650107 ) ) ( not ( = ?auto_650104 ?auto_650108 ) ) ( not ( = ?auto_650104 ?auto_650109 ) ) ( not ( = ?auto_650104 ?auto_650110 ) ) ( not ( = ?auto_650105 ?auto_650106 ) ) ( not ( = ?auto_650105 ?auto_650107 ) ) ( not ( = ?auto_650105 ?auto_650108 ) ) ( not ( = ?auto_650105 ?auto_650109 ) ) ( not ( = ?auto_650105 ?auto_650110 ) ) ( not ( = ?auto_650106 ?auto_650107 ) ) ( not ( = ?auto_650106 ?auto_650108 ) ) ( not ( = ?auto_650106 ?auto_650109 ) ) ( not ( = ?auto_650106 ?auto_650110 ) ) ( not ( = ?auto_650107 ?auto_650108 ) ) ( not ( = ?auto_650107 ?auto_650109 ) ) ( not ( = ?auto_650107 ?auto_650110 ) ) ( not ( = ?auto_650108 ?auto_650109 ) ) ( not ( = ?auto_650108 ?auto_650110 ) ) ( not ( = ?auto_650109 ?auto_650110 ) ) ( ON ?auto_650094 ?auto_650111 ) ( not ( = ?auto_650110 ?auto_650111 ) ) ( not ( = ?auto_650109 ?auto_650111 ) ) ( not ( = ?auto_650108 ?auto_650111 ) ) ( not ( = ?auto_650107 ?auto_650111 ) ) ( not ( = ?auto_650106 ?auto_650111 ) ) ( not ( = ?auto_650105 ?auto_650111 ) ) ( not ( = ?auto_650104 ?auto_650111 ) ) ( not ( = ?auto_650103 ?auto_650111 ) ) ( not ( = ?auto_650102 ?auto_650111 ) ) ( not ( = ?auto_650101 ?auto_650111 ) ) ( not ( = ?auto_650100 ?auto_650111 ) ) ( not ( = ?auto_650099 ?auto_650111 ) ) ( not ( = ?auto_650098 ?auto_650111 ) ) ( not ( = ?auto_650097 ?auto_650111 ) ) ( not ( = ?auto_650096 ?auto_650111 ) ) ( not ( = ?auto_650095 ?auto_650111 ) ) ( not ( = ?auto_650094 ?auto_650111 ) ) ( ON ?auto_650095 ?auto_650094 ) ( ON ?auto_650096 ?auto_650095 ) ( ON ?auto_650097 ?auto_650096 ) ( ON ?auto_650098 ?auto_650097 ) ( ON ?auto_650099 ?auto_650098 ) ( ON ?auto_650100 ?auto_650099 ) ( ON ?auto_650101 ?auto_650100 ) ( ON ?auto_650102 ?auto_650101 ) ( ON ?auto_650103 ?auto_650102 ) ( ON ?auto_650104 ?auto_650103 ) ( ON ?auto_650105 ?auto_650104 ) ( ON ?auto_650106 ?auto_650105 ) ( ON ?auto_650107 ?auto_650106 ) ( ON ?auto_650108 ?auto_650107 ) ( ON ?auto_650109 ?auto_650108 ) ( ON ?auto_650110 ?auto_650109 ) ( CLEAR ?auto_650110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_650110 ?auto_650109 ?auto_650108 ?auto_650107 ?auto_650106 ?auto_650105 ?auto_650104 ?auto_650103 ?auto_650102 ?auto_650101 ?auto_650100 ?auto_650099 ?auto_650098 ?auto_650097 ?auto_650096 ?auto_650095 ?auto_650094 )
      ( MAKE-17PILE ?auto_650094 ?auto_650095 ?auto_650096 ?auto_650097 ?auto_650098 ?auto_650099 ?auto_650100 ?auto_650101 ?auto_650102 ?auto_650103 ?auto_650104 ?auto_650105 ?auto_650106 ?auto_650107 ?auto_650108 ?auto_650109 ?auto_650110 ) )
  )

)

