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
      ?auto_527671 - BLOCK
    )
    :vars
    (
      ?auto_527672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527671 ?auto_527672 ) ( CLEAR ?auto_527671 ) ( HAND-EMPTY ) ( not ( = ?auto_527671 ?auto_527672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527671 ?auto_527672 )
      ( !PUTDOWN ?auto_527671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_527678 - BLOCK
      ?auto_527679 - BLOCK
    )
    :vars
    (
      ?auto_527680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_527678 ) ( ON ?auto_527679 ?auto_527680 ) ( CLEAR ?auto_527679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_527678 ) ( not ( = ?auto_527678 ?auto_527679 ) ) ( not ( = ?auto_527678 ?auto_527680 ) ) ( not ( = ?auto_527679 ?auto_527680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527679 ?auto_527680 )
      ( !STACK ?auto_527679 ?auto_527678 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_527688 - BLOCK
      ?auto_527689 - BLOCK
    )
    :vars
    (
      ?auto_527690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527689 ?auto_527690 ) ( not ( = ?auto_527688 ?auto_527689 ) ) ( not ( = ?auto_527688 ?auto_527690 ) ) ( not ( = ?auto_527689 ?auto_527690 ) ) ( ON ?auto_527688 ?auto_527689 ) ( CLEAR ?auto_527688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527688 )
      ( MAKE-2PILE ?auto_527688 ?auto_527689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_527699 - BLOCK
      ?auto_527700 - BLOCK
      ?auto_527701 - BLOCK
    )
    :vars
    (
      ?auto_527702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_527700 ) ( ON ?auto_527701 ?auto_527702 ) ( CLEAR ?auto_527701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_527699 ) ( ON ?auto_527700 ?auto_527699 ) ( not ( = ?auto_527699 ?auto_527700 ) ) ( not ( = ?auto_527699 ?auto_527701 ) ) ( not ( = ?auto_527699 ?auto_527702 ) ) ( not ( = ?auto_527700 ?auto_527701 ) ) ( not ( = ?auto_527700 ?auto_527702 ) ) ( not ( = ?auto_527701 ?auto_527702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527701 ?auto_527702 )
      ( !STACK ?auto_527701 ?auto_527700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_527713 - BLOCK
      ?auto_527714 - BLOCK
      ?auto_527715 - BLOCK
    )
    :vars
    (
      ?auto_527716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527715 ?auto_527716 ) ( ON-TABLE ?auto_527713 ) ( not ( = ?auto_527713 ?auto_527714 ) ) ( not ( = ?auto_527713 ?auto_527715 ) ) ( not ( = ?auto_527713 ?auto_527716 ) ) ( not ( = ?auto_527714 ?auto_527715 ) ) ( not ( = ?auto_527714 ?auto_527716 ) ) ( not ( = ?auto_527715 ?auto_527716 ) ) ( CLEAR ?auto_527713 ) ( ON ?auto_527714 ?auto_527715 ) ( CLEAR ?auto_527714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_527713 ?auto_527714 )
      ( MAKE-3PILE ?auto_527713 ?auto_527714 ?auto_527715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_527727 - BLOCK
      ?auto_527728 - BLOCK
      ?auto_527729 - BLOCK
    )
    :vars
    (
      ?auto_527730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527729 ?auto_527730 ) ( not ( = ?auto_527727 ?auto_527728 ) ) ( not ( = ?auto_527727 ?auto_527729 ) ) ( not ( = ?auto_527727 ?auto_527730 ) ) ( not ( = ?auto_527728 ?auto_527729 ) ) ( not ( = ?auto_527728 ?auto_527730 ) ) ( not ( = ?auto_527729 ?auto_527730 ) ) ( ON ?auto_527728 ?auto_527729 ) ( ON ?auto_527727 ?auto_527728 ) ( CLEAR ?auto_527727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527727 )
      ( MAKE-3PILE ?auto_527727 ?auto_527728 ?auto_527729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_527742 - BLOCK
      ?auto_527743 - BLOCK
      ?auto_527744 - BLOCK
      ?auto_527745 - BLOCK
    )
    :vars
    (
      ?auto_527746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_527744 ) ( ON ?auto_527745 ?auto_527746 ) ( CLEAR ?auto_527745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_527742 ) ( ON ?auto_527743 ?auto_527742 ) ( ON ?auto_527744 ?auto_527743 ) ( not ( = ?auto_527742 ?auto_527743 ) ) ( not ( = ?auto_527742 ?auto_527744 ) ) ( not ( = ?auto_527742 ?auto_527745 ) ) ( not ( = ?auto_527742 ?auto_527746 ) ) ( not ( = ?auto_527743 ?auto_527744 ) ) ( not ( = ?auto_527743 ?auto_527745 ) ) ( not ( = ?auto_527743 ?auto_527746 ) ) ( not ( = ?auto_527744 ?auto_527745 ) ) ( not ( = ?auto_527744 ?auto_527746 ) ) ( not ( = ?auto_527745 ?auto_527746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527745 ?auto_527746 )
      ( !STACK ?auto_527745 ?auto_527744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_527760 - BLOCK
      ?auto_527761 - BLOCK
      ?auto_527762 - BLOCK
      ?auto_527763 - BLOCK
    )
    :vars
    (
      ?auto_527764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527763 ?auto_527764 ) ( ON-TABLE ?auto_527760 ) ( ON ?auto_527761 ?auto_527760 ) ( not ( = ?auto_527760 ?auto_527761 ) ) ( not ( = ?auto_527760 ?auto_527762 ) ) ( not ( = ?auto_527760 ?auto_527763 ) ) ( not ( = ?auto_527760 ?auto_527764 ) ) ( not ( = ?auto_527761 ?auto_527762 ) ) ( not ( = ?auto_527761 ?auto_527763 ) ) ( not ( = ?auto_527761 ?auto_527764 ) ) ( not ( = ?auto_527762 ?auto_527763 ) ) ( not ( = ?auto_527762 ?auto_527764 ) ) ( not ( = ?auto_527763 ?auto_527764 ) ) ( CLEAR ?auto_527761 ) ( ON ?auto_527762 ?auto_527763 ) ( CLEAR ?auto_527762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_527760 ?auto_527761 ?auto_527762 )
      ( MAKE-4PILE ?auto_527760 ?auto_527761 ?auto_527762 ?auto_527763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_527778 - BLOCK
      ?auto_527779 - BLOCK
      ?auto_527780 - BLOCK
      ?auto_527781 - BLOCK
    )
    :vars
    (
      ?auto_527782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527781 ?auto_527782 ) ( ON-TABLE ?auto_527778 ) ( not ( = ?auto_527778 ?auto_527779 ) ) ( not ( = ?auto_527778 ?auto_527780 ) ) ( not ( = ?auto_527778 ?auto_527781 ) ) ( not ( = ?auto_527778 ?auto_527782 ) ) ( not ( = ?auto_527779 ?auto_527780 ) ) ( not ( = ?auto_527779 ?auto_527781 ) ) ( not ( = ?auto_527779 ?auto_527782 ) ) ( not ( = ?auto_527780 ?auto_527781 ) ) ( not ( = ?auto_527780 ?auto_527782 ) ) ( not ( = ?auto_527781 ?auto_527782 ) ) ( ON ?auto_527780 ?auto_527781 ) ( CLEAR ?auto_527778 ) ( ON ?auto_527779 ?auto_527780 ) ( CLEAR ?auto_527779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_527778 ?auto_527779 )
      ( MAKE-4PILE ?auto_527778 ?auto_527779 ?auto_527780 ?auto_527781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_527796 - BLOCK
      ?auto_527797 - BLOCK
      ?auto_527798 - BLOCK
      ?auto_527799 - BLOCK
    )
    :vars
    (
      ?auto_527800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527799 ?auto_527800 ) ( not ( = ?auto_527796 ?auto_527797 ) ) ( not ( = ?auto_527796 ?auto_527798 ) ) ( not ( = ?auto_527796 ?auto_527799 ) ) ( not ( = ?auto_527796 ?auto_527800 ) ) ( not ( = ?auto_527797 ?auto_527798 ) ) ( not ( = ?auto_527797 ?auto_527799 ) ) ( not ( = ?auto_527797 ?auto_527800 ) ) ( not ( = ?auto_527798 ?auto_527799 ) ) ( not ( = ?auto_527798 ?auto_527800 ) ) ( not ( = ?auto_527799 ?auto_527800 ) ) ( ON ?auto_527798 ?auto_527799 ) ( ON ?auto_527797 ?auto_527798 ) ( ON ?auto_527796 ?auto_527797 ) ( CLEAR ?auto_527796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527796 )
      ( MAKE-4PILE ?auto_527796 ?auto_527797 ?auto_527798 ?auto_527799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_527815 - BLOCK
      ?auto_527816 - BLOCK
      ?auto_527817 - BLOCK
      ?auto_527818 - BLOCK
      ?auto_527819 - BLOCK
    )
    :vars
    (
      ?auto_527820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_527818 ) ( ON ?auto_527819 ?auto_527820 ) ( CLEAR ?auto_527819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_527815 ) ( ON ?auto_527816 ?auto_527815 ) ( ON ?auto_527817 ?auto_527816 ) ( ON ?auto_527818 ?auto_527817 ) ( not ( = ?auto_527815 ?auto_527816 ) ) ( not ( = ?auto_527815 ?auto_527817 ) ) ( not ( = ?auto_527815 ?auto_527818 ) ) ( not ( = ?auto_527815 ?auto_527819 ) ) ( not ( = ?auto_527815 ?auto_527820 ) ) ( not ( = ?auto_527816 ?auto_527817 ) ) ( not ( = ?auto_527816 ?auto_527818 ) ) ( not ( = ?auto_527816 ?auto_527819 ) ) ( not ( = ?auto_527816 ?auto_527820 ) ) ( not ( = ?auto_527817 ?auto_527818 ) ) ( not ( = ?auto_527817 ?auto_527819 ) ) ( not ( = ?auto_527817 ?auto_527820 ) ) ( not ( = ?auto_527818 ?auto_527819 ) ) ( not ( = ?auto_527818 ?auto_527820 ) ) ( not ( = ?auto_527819 ?auto_527820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527819 ?auto_527820 )
      ( !STACK ?auto_527819 ?auto_527818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_527837 - BLOCK
      ?auto_527838 - BLOCK
      ?auto_527839 - BLOCK
      ?auto_527840 - BLOCK
      ?auto_527841 - BLOCK
    )
    :vars
    (
      ?auto_527842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527841 ?auto_527842 ) ( ON-TABLE ?auto_527837 ) ( ON ?auto_527838 ?auto_527837 ) ( ON ?auto_527839 ?auto_527838 ) ( not ( = ?auto_527837 ?auto_527838 ) ) ( not ( = ?auto_527837 ?auto_527839 ) ) ( not ( = ?auto_527837 ?auto_527840 ) ) ( not ( = ?auto_527837 ?auto_527841 ) ) ( not ( = ?auto_527837 ?auto_527842 ) ) ( not ( = ?auto_527838 ?auto_527839 ) ) ( not ( = ?auto_527838 ?auto_527840 ) ) ( not ( = ?auto_527838 ?auto_527841 ) ) ( not ( = ?auto_527838 ?auto_527842 ) ) ( not ( = ?auto_527839 ?auto_527840 ) ) ( not ( = ?auto_527839 ?auto_527841 ) ) ( not ( = ?auto_527839 ?auto_527842 ) ) ( not ( = ?auto_527840 ?auto_527841 ) ) ( not ( = ?auto_527840 ?auto_527842 ) ) ( not ( = ?auto_527841 ?auto_527842 ) ) ( CLEAR ?auto_527839 ) ( ON ?auto_527840 ?auto_527841 ) ( CLEAR ?auto_527840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_527837 ?auto_527838 ?auto_527839 ?auto_527840 )
      ( MAKE-5PILE ?auto_527837 ?auto_527838 ?auto_527839 ?auto_527840 ?auto_527841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_527859 - BLOCK
      ?auto_527860 - BLOCK
      ?auto_527861 - BLOCK
      ?auto_527862 - BLOCK
      ?auto_527863 - BLOCK
    )
    :vars
    (
      ?auto_527864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527863 ?auto_527864 ) ( ON-TABLE ?auto_527859 ) ( ON ?auto_527860 ?auto_527859 ) ( not ( = ?auto_527859 ?auto_527860 ) ) ( not ( = ?auto_527859 ?auto_527861 ) ) ( not ( = ?auto_527859 ?auto_527862 ) ) ( not ( = ?auto_527859 ?auto_527863 ) ) ( not ( = ?auto_527859 ?auto_527864 ) ) ( not ( = ?auto_527860 ?auto_527861 ) ) ( not ( = ?auto_527860 ?auto_527862 ) ) ( not ( = ?auto_527860 ?auto_527863 ) ) ( not ( = ?auto_527860 ?auto_527864 ) ) ( not ( = ?auto_527861 ?auto_527862 ) ) ( not ( = ?auto_527861 ?auto_527863 ) ) ( not ( = ?auto_527861 ?auto_527864 ) ) ( not ( = ?auto_527862 ?auto_527863 ) ) ( not ( = ?auto_527862 ?auto_527864 ) ) ( not ( = ?auto_527863 ?auto_527864 ) ) ( ON ?auto_527862 ?auto_527863 ) ( CLEAR ?auto_527860 ) ( ON ?auto_527861 ?auto_527862 ) ( CLEAR ?auto_527861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_527859 ?auto_527860 ?auto_527861 )
      ( MAKE-5PILE ?auto_527859 ?auto_527860 ?auto_527861 ?auto_527862 ?auto_527863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_527881 - BLOCK
      ?auto_527882 - BLOCK
      ?auto_527883 - BLOCK
      ?auto_527884 - BLOCK
      ?auto_527885 - BLOCK
    )
    :vars
    (
      ?auto_527886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527885 ?auto_527886 ) ( ON-TABLE ?auto_527881 ) ( not ( = ?auto_527881 ?auto_527882 ) ) ( not ( = ?auto_527881 ?auto_527883 ) ) ( not ( = ?auto_527881 ?auto_527884 ) ) ( not ( = ?auto_527881 ?auto_527885 ) ) ( not ( = ?auto_527881 ?auto_527886 ) ) ( not ( = ?auto_527882 ?auto_527883 ) ) ( not ( = ?auto_527882 ?auto_527884 ) ) ( not ( = ?auto_527882 ?auto_527885 ) ) ( not ( = ?auto_527882 ?auto_527886 ) ) ( not ( = ?auto_527883 ?auto_527884 ) ) ( not ( = ?auto_527883 ?auto_527885 ) ) ( not ( = ?auto_527883 ?auto_527886 ) ) ( not ( = ?auto_527884 ?auto_527885 ) ) ( not ( = ?auto_527884 ?auto_527886 ) ) ( not ( = ?auto_527885 ?auto_527886 ) ) ( ON ?auto_527884 ?auto_527885 ) ( ON ?auto_527883 ?auto_527884 ) ( CLEAR ?auto_527881 ) ( ON ?auto_527882 ?auto_527883 ) ( CLEAR ?auto_527882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_527881 ?auto_527882 )
      ( MAKE-5PILE ?auto_527881 ?auto_527882 ?auto_527883 ?auto_527884 ?auto_527885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_527903 - BLOCK
      ?auto_527904 - BLOCK
      ?auto_527905 - BLOCK
      ?auto_527906 - BLOCK
      ?auto_527907 - BLOCK
    )
    :vars
    (
      ?auto_527908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527907 ?auto_527908 ) ( not ( = ?auto_527903 ?auto_527904 ) ) ( not ( = ?auto_527903 ?auto_527905 ) ) ( not ( = ?auto_527903 ?auto_527906 ) ) ( not ( = ?auto_527903 ?auto_527907 ) ) ( not ( = ?auto_527903 ?auto_527908 ) ) ( not ( = ?auto_527904 ?auto_527905 ) ) ( not ( = ?auto_527904 ?auto_527906 ) ) ( not ( = ?auto_527904 ?auto_527907 ) ) ( not ( = ?auto_527904 ?auto_527908 ) ) ( not ( = ?auto_527905 ?auto_527906 ) ) ( not ( = ?auto_527905 ?auto_527907 ) ) ( not ( = ?auto_527905 ?auto_527908 ) ) ( not ( = ?auto_527906 ?auto_527907 ) ) ( not ( = ?auto_527906 ?auto_527908 ) ) ( not ( = ?auto_527907 ?auto_527908 ) ) ( ON ?auto_527906 ?auto_527907 ) ( ON ?auto_527905 ?auto_527906 ) ( ON ?auto_527904 ?auto_527905 ) ( ON ?auto_527903 ?auto_527904 ) ( CLEAR ?auto_527903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_527903 )
      ( MAKE-5PILE ?auto_527903 ?auto_527904 ?auto_527905 ?auto_527906 ?auto_527907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_527926 - BLOCK
      ?auto_527927 - BLOCK
      ?auto_527928 - BLOCK
      ?auto_527929 - BLOCK
      ?auto_527930 - BLOCK
      ?auto_527931 - BLOCK
    )
    :vars
    (
      ?auto_527932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_527930 ) ( ON ?auto_527931 ?auto_527932 ) ( CLEAR ?auto_527931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_527926 ) ( ON ?auto_527927 ?auto_527926 ) ( ON ?auto_527928 ?auto_527927 ) ( ON ?auto_527929 ?auto_527928 ) ( ON ?auto_527930 ?auto_527929 ) ( not ( = ?auto_527926 ?auto_527927 ) ) ( not ( = ?auto_527926 ?auto_527928 ) ) ( not ( = ?auto_527926 ?auto_527929 ) ) ( not ( = ?auto_527926 ?auto_527930 ) ) ( not ( = ?auto_527926 ?auto_527931 ) ) ( not ( = ?auto_527926 ?auto_527932 ) ) ( not ( = ?auto_527927 ?auto_527928 ) ) ( not ( = ?auto_527927 ?auto_527929 ) ) ( not ( = ?auto_527927 ?auto_527930 ) ) ( not ( = ?auto_527927 ?auto_527931 ) ) ( not ( = ?auto_527927 ?auto_527932 ) ) ( not ( = ?auto_527928 ?auto_527929 ) ) ( not ( = ?auto_527928 ?auto_527930 ) ) ( not ( = ?auto_527928 ?auto_527931 ) ) ( not ( = ?auto_527928 ?auto_527932 ) ) ( not ( = ?auto_527929 ?auto_527930 ) ) ( not ( = ?auto_527929 ?auto_527931 ) ) ( not ( = ?auto_527929 ?auto_527932 ) ) ( not ( = ?auto_527930 ?auto_527931 ) ) ( not ( = ?auto_527930 ?auto_527932 ) ) ( not ( = ?auto_527931 ?auto_527932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_527931 ?auto_527932 )
      ( !STACK ?auto_527931 ?auto_527930 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_527952 - BLOCK
      ?auto_527953 - BLOCK
      ?auto_527954 - BLOCK
      ?auto_527955 - BLOCK
      ?auto_527956 - BLOCK
      ?auto_527957 - BLOCK
    )
    :vars
    (
      ?auto_527958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527957 ?auto_527958 ) ( ON-TABLE ?auto_527952 ) ( ON ?auto_527953 ?auto_527952 ) ( ON ?auto_527954 ?auto_527953 ) ( ON ?auto_527955 ?auto_527954 ) ( not ( = ?auto_527952 ?auto_527953 ) ) ( not ( = ?auto_527952 ?auto_527954 ) ) ( not ( = ?auto_527952 ?auto_527955 ) ) ( not ( = ?auto_527952 ?auto_527956 ) ) ( not ( = ?auto_527952 ?auto_527957 ) ) ( not ( = ?auto_527952 ?auto_527958 ) ) ( not ( = ?auto_527953 ?auto_527954 ) ) ( not ( = ?auto_527953 ?auto_527955 ) ) ( not ( = ?auto_527953 ?auto_527956 ) ) ( not ( = ?auto_527953 ?auto_527957 ) ) ( not ( = ?auto_527953 ?auto_527958 ) ) ( not ( = ?auto_527954 ?auto_527955 ) ) ( not ( = ?auto_527954 ?auto_527956 ) ) ( not ( = ?auto_527954 ?auto_527957 ) ) ( not ( = ?auto_527954 ?auto_527958 ) ) ( not ( = ?auto_527955 ?auto_527956 ) ) ( not ( = ?auto_527955 ?auto_527957 ) ) ( not ( = ?auto_527955 ?auto_527958 ) ) ( not ( = ?auto_527956 ?auto_527957 ) ) ( not ( = ?auto_527956 ?auto_527958 ) ) ( not ( = ?auto_527957 ?auto_527958 ) ) ( CLEAR ?auto_527955 ) ( ON ?auto_527956 ?auto_527957 ) ( CLEAR ?auto_527956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_527952 ?auto_527953 ?auto_527954 ?auto_527955 ?auto_527956 )
      ( MAKE-6PILE ?auto_527952 ?auto_527953 ?auto_527954 ?auto_527955 ?auto_527956 ?auto_527957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_527978 - BLOCK
      ?auto_527979 - BLOCK
      ?auto_527980 - BLOCK
      ?auto_527981 - BLOCK
      ?auto_527982 - BLOCK
      ?auto_527983 - BLOCK
    )
    :vars
    (
      ?auto_527984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_527983 ?auto_527984 ) ( ON-TABLE ?auto_527978 ) ( ON ?auto_527979 ?auto_527978 ) ( ON ?auto_527980 ?auto_527979 ) ( not ( = ?auto_527978 ?auto_527979 ) ) ( not ( = ?auto_527978 ?auto_527980 ) ) ( not ( = ?auto_527978 ?auto_527981 ) ) ( not ( = ?auto_527978 ?auto_527982 ) ) ( not ( = ?auto_527978 ?auto_527983 ) ) ( not ( = ?auto_527978 ?auto_527984 ) ) ( not ( = ?auto_527979 ?auto_527980 ) ) ( not ( = ?auto_527979 ?auto_527981 ) ) ( not ( = ?auto_527979 ?auto_527982 ) ) ( not ( = ?auto_527979 ?auto_527983 ) ) ( not ( = ?auto_527979 ?auto_527984 ) ) ( not ( = ?auto_527980 ?auto_527981 ) ) ( not ( = ?auto_527980 ?auto_527982 ) ) ( not ( = ?auto_527980 ?auto_527983 ) ) ( not ( = ?auto_527980 ?auto_527984 ) ) ( not ( = ?auto_527981 ?auto_527982 ) ) ( not ( = ?auto_527981 ?auto_527983 ) ) ( not ( = ?auto_527981 ?auto_527984 ) ) ( not ( = ?auto_527982 ?auto_527983 ) ) ( not ( = ?auto_527982 ?auto_527984 ) ) ( not ( = ?auto_527983 ?auto_527984 ) ) ( ON ?auto_527982 ?auto_527983 ) ( CLEAR ?auto_527980 ) ( ON ?auto_527981 ?auto_527982 ) ( CLEAR ?auto_527981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_527978 ?auto_527979 ?auto_527980 ?auto_527981 )
      ( MAKE-6PILE ?auto_527978 ?auto_527979 ?auto_527980 ?auto_527981 ?auto_527982 ?auto_527983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_528004 - BLOCK
      ?auto_528005 - BLOCK
      ?auto_528006 - BLOCK
      ?auto_528007 - BLOCK
      ?auto_528008 - BLOCK
      ?auto_528009 - BLOCK
    )
    :vars
    (
      ?auto_528010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528009 ?auto_528010 ) ( ON-TABLE ?auto_528004 ) ( ON ?auto_528005 ?auto_528004 ) ( not ( = ?auto_528004 ?auto_528005 ) ) ( not ( = ?auto_528004 ?auto_528006 ) ) ( not ( = ?auto_528004 ?auto_528007 ) ) ( not ( = ?auto_528004 ?auto_528008 ) ) ( not ( = ?auto_528004 ?auto_528009 ) ) ( not ( = ?auto_528004 ?auto_528010 ) ) ( not ( = ?auto_528005 ?auto_528006 ) ) ( not ( = ?auto_528005 ?auto_528007 ) ) ( not ( = ?auto_528005 ?auto_528008 ) ) ( not ( = ?auto_528005 ?auto_528009 ) ) ( not ( = ?auto_528005 ?auto_528010 ) ) ( not ( = ?auto_528006 ?auto_528007 ) ) ( not ( = ?auto_528006 ?auto_528008 ) ) ( not ( = ?auto_528006 ?auto_528009 ) ) ( not ( = ?auto_528006 ?auto_528010 ) ) ( not ( = ?auto_528007 ?auto_528008 ) ) ( not ( = ?auto_528007 ?auto_528009 ) ) ( not ( = ?auto_528007 ?auto_528010 ) ) ( not ( = ?auto_528008 ?auto_528009 ) ) ( not ( = ?auto_528008 ?auto_528010 ) ) ( not ( = ?auto_528009 ?auto_528010 ) ) ( ON ?auto_528008 ?auto_528009 ) ( ON ?auto_528007 ?auto_528008 ) ( CLEAR ?auto_528005 ) ( ON ?auto_528006 ?auto_528007 ) ( CLEAR ?auto_528006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_528004 ?auto_528005 ?auto_528006 )
      ( MAKE-6PILE ?auto_528004 ?auto_528005 ?auto_528006 ?auto_528007 ?auto_528008 ?auto_528009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_528030 - BLOCK
      ?auto_528031 - BLOCK
      ?auto_528032 - BLOCK
      ?auto_528033 - BLOCK
      ?auto_528034 - BLOCK
      ?auto_528035 - BLOCK
    )
    :vars
    (
      ?auto_528036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528035 ?auto_528036 ) ( ON-TABLE ?auto_528030 ) ( not ( = ?auto_528030 ?auto_528031 ) ) ( not ( = ?auto_528030 ?auto_528032 ) ) ( not ( = ?auto_528030 ?auto_528033 ) ) ( not ( = ?auto_528030 ?auto_528034 ) ) ( not ( = ?auto_528030 ?auto_528035 ) ) ( not ( = ?auto_528030 ?auto_528036 ) ) ( not ( = ?auto_528031 ?auto_528032 ) ) ( not ( = ?auto_528031 ?auto_528033 ) ) ( not ( = ?auto_528031 ?auto_528034 ) ) ( not ( = ?auto_528031 ?auto_528035 ) ) ( not ( = ?auto_528031 ?auto_528036 ) ) ( not ( = ?auto_528032 ?auto_528033 ) ) ( not ( = ?auto_528032 ?auto_528034 ) ) ( not ( = ?auto_528032 ?auto_528035 ) ) ( not ( = ?auto_528032 ?auto_528036 ) ) ( not ( = ?auto_528033 ?auto_528034 ) ) ( not ( = ?auto_528033 ?auto_528035 ) ) ( not ( = ?auto_528033 ?auto_528036 ) ) ( not ( = ?auto_528034 ?auto_528035 ) ) ( not ( = ?auto_528034 ?auto_528036 ) ) ( not ( = ?auto_528035 ?auto_528036 ) ) ( ON ?auto_528034 ?auto_528035 ) ( ON ?auto_528033 ?auto_528034 ) ( ON ?auto_528032 ?auto_528033 ) ( CLEAR ?auto_528030 ) ( ON ?auto_528031 ?auto_528032 ) ( CLEAR ?auto_528031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_528030 ?auto_528031 )
      ( MAKE-6PILE ?auto_528030 ?auto_528031 ?auto_528032 ?auto_528033 ?auto_528034 ?auto_528035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_528056 - BLOCK
      ?auto_528057 - BLOCK
      ?auto_528058 - BLOCK
      ?auto_528059 - BLOCK
      ?auto_528060 - BLOCK
      ?auto_528061 - BLOCK
    )
    :vars
    (
      ?auto_528062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528061 ?auto_528062 ) ( not ( = ?auto_528056 ?auto_528057 ) ) ( not ( = ?auto_528056 ?auto_528058 ) ) ( not ( = ?auto_528056 ?auto_528059 ) ) ( not ( = ?auto_528056 ?auto_528060 ) ) ( not ( = ?auto_528056 ?auto_528061 ) ) ( not ( = ?auto_528056 ?auto_528062 ) ) ( not ( = ?auto_528057 ?auto_528058 ) ) ( not ( = ?auto_528057 ?auto_528059 ) ) ( not ( = ?auto_528057 ?auto_528060 ) ) ( not ( = ?auto_528057 ?auto_528061 ) ) ( not ( = ?auto_528057 ?auto_528062 ) ) ( not ( = ?auto_528058 ?auto_528059 ) ) ( not ( = ?auto_528058 ?auto_528060 ) ) ( not ( = ?auto_528058 ?auto_528061 ) ) ( not ( = ?auto_528058 ?auto_528062 ) ) ( not ( = ?auto_528059 ?auto_528060 ) ) ( not ( = ?auto_528059 ?auto_528061 ) ) ( not ( = ?auto_528059 ?auto_528062 ) ) ( not ( = ?auto_528060 ?auto_528061 ) ) ( not ( = ?auto_528060 ?auto_528062 ) ) ( not ( = ?auto_528061 ?auto_528062 ) ) ( ON ?auto_528060 ?auto_528061 ) ( ON ?auto_528059 ?auto_528060 ) ( ON ?auto_528058 ?auto_528059 ) ( ON ?auto_528057 ?auto_528058 ) ( ON ?auto_528056 ?auto_528057 ) ( CLEAR ?auto_528056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_528056 )
      ( MAKE-6PILE ?auto_528056 ?auto_528057 ?auto_528058 ?auto_528059 ?auto_528060 ?auto_528061 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528083 - BLOCK
      ?auto_528084 - BLOCK
      ?auto_528085 - BLOCK
      ?auto_528086 - BLOCK
      ?auto_528087 - BLOCK
      ?auto_528088 - BLOCK
      ?auto_528089 - BLOCK
    )
    :vars
    (
      ?auto_528090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_528088 ) ( ON ?auto_528089 ?auto_528090 ) ( CLEAR ?auto_528089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_528083 ) ( ON ?auto_528084 ?auto_528083 ) ( ON ?auto_528085 ?auto_528084 ) ( ON ?auto_528086 ?auto_528085 ) ( ON ?auto_528087 ?auto_528086 ) ( ON ?auto_528088 ?auto_528087 ) ( not ( = ?auto_528083 ?auto_528084 ) ) ( not ( = ?auto_528083 ?auto_528085 ) ) ( not ( = ?auto_528083 ?auto_528086 ) ) ( not ( = ?auto_528083 ?auto_528087 ) ) ( not ( = ?auto_528083 ?auto_528088 ) ) ( not ( = ?auto_528083 ?auto_528089 ) ) ( not ( = ?auto_528083 ?auto_528090 ) ) ( not ( = ?auto_528084 ?auto_528085 ) ) ( not ( = ?auto_528084 ?auto_528086 ) ) ( not ( = ?auto_528084 ?auto_528087 ) ) ( not ( = ?auto_528084 ?auto_528088 ) ) ( not ( = ?auto_528084 ?auto_528089 ) ) ( not ( = ?auto_528084 ?auto_528090 ) ) ( not ( = ?auto_528085 ?auto_528086 ) ) ( not ( = ?auto_528085 ?auto_528087 ) ) ( not ( = ?auto_528085 ?auto_528088 ) ) ( not ( = ?auto_528085 ?auto_528089 ) ) ( not ( = ?auto_528085 ?auto_528090 ) ) ( not ( = ?auto_528086 ?auto_528087 ) ) ( not ( = ?auto_528086 ?auto_528088 ) ) ( not ( = ?auto_528086 ?auto_528089 ) ) ( not ( = ?auto_528086 ?auto_528090 ) ) ( not ( = ?auto_528087 ?auto_528088 ) ) ( not ( = ?auto_528087 ?auto_528089 ) ) ( not ( = ?auto_528087 ?auto_528090 ) ) ( not ( = ?auto_528088 ?auto_528089 ) ) ( not ( = ?auto_528088 ?auto_528090 ) ) ( not ( = ?auto_528089 ?auto_528090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_528089 ?auto_528090 )
      ( !STACK ?auto_528089 ?auto_528088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528113 - BLOCK
      ?auto_528114 - BLOCK
      ?auto_528115 - BLOCK
      ?auto_528116 - BLOCK
      ?auto_528117 - BLOCK
      ?auto_528118 - BLOCK
      ?auto_528119 - BLOCK
    )
    :vars
    (
      ?auto_528120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528119 ?auto_528120 ) ( ON-TABLE ?auto_528113 ) ( ON ?auto_528114 ?auto_528113 ) ( ON ?auto_528115 ?auto_528114 ) ( ON ?auto_528116 ?auto_528115 ) ( ON ?auto_528117 ?auto_528116 ) ( not ( = ?auto_528113 ?auto_528114 ) ) ( not ( = ?auto_528113 ?auto_528115 ) ) ( not ( = ?auto_528113 ?auto_528116 ) ) ( not ( = ?auto_528113 ?auto_528117 ) ) ( not ( = ?auto_528113 ?auto_528118 ) ) ( not ( = ?auto_528113 ?auto_528119 ) ) ( not ( = ?auto_528113 ?auto_528120 ) ) ( not ( = ?auto_528114 ?auto_528115 ) ) ( not ( = ?auto_528114 ?auto_528116 ) ) ( not ( = ?auto_528114 ?auto_528117 ) ) ( not ( = ?auto_528114 ?auto_528118 ) ) ( not ( = ?auto_528114 ?auto_528119 ) ) ( not ( = ?auto_528114 ?auto_528120 ) ) ( not ( = ?auto_528115 ?auto_528116 ) ) ( not ( = ?auto_528115 ?auto_528117 ) ) ( not ( = ?auto_528115 ?auto_528118 ) ) ( not ( = ?auto_528115 ?auto_528119 ) ) ( not ( = ?auto_528115 ?auto_528120 ) ) ( not ( = ?auto_528116 ?auto_528117 ) ) ( not ( = ?auto_528116 ?auto_528118 ) ) ( not ( = ?auto_528116 ?auto_528119 ) ) ( not ( = ?auto_528116 ?auto_528120 ) ) ( not ( = ?auto_528117 ?auto_528118 ) ) ( not ( = ?auto_528117 ?auto_528119 ) ) ( not ( = ?auto_528117 ?auto_528120 ) ) ( not ( = ?auto_528118 ?auto_528119 ) ) ( not ( = ?auto_528118 ?auto_528120 ) ) ( not ( = ?auto_528119 ?auto_528120 ) ) ( CLEAR ?auto_528117 ) ( ON ?auto_528118 ?auto_528119 ) ( CLEAR ?auto_528118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_528113 ?auto_528114 ?auto_528115 ?auto_528116 ?auto_528117 ?auto_528118 )
      ( MAKE-7PILE ?auto_528113 ?auto_528114 ?auto_528115 ?auto_528116 ?auto_528117 ?auto_528118 ?auto_528119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528143 - BLOCK
      ?auto_528144 - BLOCK
      ?auto_528145 - BLOCK
      ?auto_528146 - BLOCK
      ?auto_528147 - BLOCK
      ?auto_528148 - BLOCK
      ?auto_528149 - BLOCK
    )
    :vars
    (
      ?auto_528150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528149 ?auto_528150 ) ( ON-TABLE ?auto_528143 ) ( ON ?auto_528144 ?auto_528143 ) ( ON ?auto_528145 ?auto_528144 ) ( ON ?auto_528146 ?auto_528145 ) ( not ( = ?auto_528143 ?auto_528144 ) ) ( not ( = ?auto_528143 ?auto_528145 ) ) ( not ( = ?auto_528143 ?auto_528146 ) ) ( not ( = ?auto_528143 ?auto_528147 ) ) ( not ( = ?auto_528143 ?auto_528148 ) ) ( not ( = ?auto_528143 ?auto_528149 ) ) ( not ( = ?auto_528143 ?auto_528150 ) ) ( not ( = ?auto_528144 ?auto_528145 ) ) ( not ( = ?auto_528144 ?auto_528146 ) ) ( not ( = ?auto_528144 ?auto_528147 ) ) ( not ( = ?auto_528144 ?auto_528148 ) ) ( not ( = ?auto_528144 ?auto_528149 ) ) ( not ( = ?auto_528144 ?auto_528150 ) ) ( not ( = ?auto_528145 ?auto_528146 ) ) ( not ( = ?auto_528145 ?auto_528147 ) ) ( not ( = ?auto_528145 ?auto_528148 ) ) ( not ( = ?auto_528145 ?auto_528149 ) ) ( not ( = ?auto_528145 ?auto_528150 ) ) ( not ( = ?auto_528146 ?auto_528147 ) ) ( not ( = ?auto_528146 ?auto_528148 ) ) ( not ( = ?auto_528146 ?auto_528149 ) ) ( not ( = ?auto_528146 ?auto_528150 ) ) ( not ( = ?auto_528147 ?auto_528148 ) ) ( not ( = ?auto_528147 ?auto_528149 ) ) ( not ( = ?auto_528147 ?auto_528150 ) ) ( not ( = ?auto_528148 ?auto_528149 ) ) ( not ( = ?auto_528148 ?auto_528150 ) ) ( not ( = ?auto_528149 ?auto_528150 ) ) ( ON ?auto_528148 ?auto_528149 ) ( CLEAR ?auto_528146 ) ( ON ?auto_528147 ?auto_528148 ) ( CLEAR ?auto_528147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_528143 ?auto_528144 ?auto_528145 ?auto_528146 ?auto_528147 )
      ( MAKE-7PILE ?auto_528143 ?auto_528144 ?auto_528145 ?auto_528146 ?auto_528147 ?auto_528148 ?auto_528149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528173 - BLOCK
      ?auto_528174 - BLOCK
      ?auto_528175 - BLOCK
      ?auto_528176 - BLOCK
      ?auto_528177 - BLOCK
      ?auto_528178 - BLOCK
      ?auto_528179 - BLOCK
    )
    :vars
    (
      ?auto_528180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528179 ?auto_528180 ) ( ON-TABLE ?auto_528173 ) ( ON ?auto_528174 ?auto_528173 ) ( ON ?auto_528175 ?auto_528174 ) ( not ( = ?auto_528173 ?auto_528174 ) ) ( not ( = ?auto_528173 ?auto_528175 ) ) ( not ( = ?auto_528173 ?auto_528176 ) ) ( not ( = ?auto_528173 ?auto_528177 ) ) ( not ( = ?auto_528173 ?auto_528178 ) ) ( not ( = ?auto_528173 ?auto_528179 ) ) ( not ( = ?auto_528173 ?auto_528180 ) ) ( not ( = ?auto_528174 ?auto_528175 ) ) ( not ( = ?auto_528174 ?auto_528176 ) ) ( not ( = ?auto_528174 ?auto_528177 ) ) ( not ( = ?auto_528174 ?auto_528178 ) ) ( not ( = ?auto_528174 ?auto_528179 ) ) ( not ( = ?auto_528174 ?auto_528180 ) ) ( not ( = ?auto_528175 ?auto_528176 ) ) ( not ( = ?auto_528175 ?auto_528177 ) ) ( not ( = ?auto_528175 ?auto_528178 ) ) ( not ( = ?auto_528175 ?auto_528179 ) ) ( not ( = ?auto_528175 ?auto_528180 ) ) ( not ( = ?auto_528176 ?auto_528177 ) ) ( not ( = ?auto_528176 ?auto_528178 ) ) ( not ( = ?auto_528176 ?auto_528179 ) ) ( not ( = ?auto_528176 ?auto_528180 ) ) ( not ( = ?auto_528177 ?auto_528178 ) ) ( not ( = ?auto_528177 ?auto_528179 ) ) ( not ( = ?auto_528177 ?auto_528180 ) ) ( not ( = ?auto_528178 ?auto_528179 ) ) ( not ( = ?auto_528178 ?auto_528180 ) ) ( not ( = ?auto_528179 ?auto_528180 ) ) ( ON ?auto_528178 ?auto_528179 ) ( ON ?auto_528177 ?auto_528178 ) ( CLEAR ?auto_528175 ) ( ON ?auto_528176 ?auto_528177 ) ( CLEAR ?auto_528176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_528173 ?auto_528174 ?auto_528175 ?auto_528176 )
      ( MAKE-7PILE ?auto_528173 ?auto_528174 ?auto_528175 ?auto_528176 ?auto_528177 ?auto_528178 ?auto_528179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528203 - BLOCK
      ?auto_528204 - BLOCK
      ?auto_528205 - BLOCK
      ?auto_528206 - BLOCK
      ?auto_528207 - BLOCK
      ?auto_528208 - BLOCK
      ?auto_528209 - BLOCK
    )
    :vars
    (
      ?auto_528210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528209 ?auto_528210 ) ( ON-TABLE ?auto_528203 ) ( ON ?auto_528204 ?auto_528203 ) ( not ( = ?auto_528203 ?auto_528204 ) ) ( not ( = ?auto_528203 ?auto_528205 ) ) ( not ( = ?auto_528203 ?auto_528206 ) ) ( not ( = ?auto_528203 ?auto_528207 ) ) ( not ( = ?auto_528203 ?auto_528208 ) ) ( not ( = ?auto_528203 ?auto_528209 ) ) ( not ( = ?auto_528203 ?auto_528210 ) ) ( not ( = ?auto_528204 ?auto_528205 ) ) ( not ( = ?auto_528204 ?auto_528206 ) ) ( not ( = ?auto_528204 ?auto_528207 ) ) ( not ( = ?auto_528204 ?auto_528208 ) ) ( not ( = ?auto_528204 ?auto_528209 ) ) ( not ( = ?auto_528204 ?auto_528210 ) ) ( not ( = ?auto_528205 ?auto_528206 ) ) ( not ( = ?auto_528205 ?auto_528207 ) ) ( not ( = ?auto_528205 ?auto_528208 ) ) ( not ( = ?auto_528205 ?auto_528209 ) ) ( not ( = ?auto_528205 ?auto_528210 ) ) ( not ( = ?auto_528206 ?auto_528207 ) ) ( not ( = ?auto_528206 ?auto_528208 ) ) ( not ( = ?auto_528206 ?auto_528209 ) ) ( not ( = ?auto_528206 ?auto_528210 ) ) ( not ( = ?auto_528207 ?auto_528208 ) ) ( not ( = ?auto_528207 ?auto_528209 ) ) ( not ( = ?auto_528207 ?auto_528210 ) ) ( not ( = ?auto_528208 ?auto_528209 ) ) ( not ( = ?auto_528208 ?auto_528210 ) ) ( not ( = ?auto_528209 ?auto_528210 ) ) ( ON ?auto_528208 ?auto_528209 ) ( ON ?auto_528207 ?auto_528208 ) ( ON ?auto_528206 ?auto_528207 ) ( CLEAR ?auto_528204 ) ( ON ?auto_528205 ?auto_528206 ) ( CLEAR ?auto_528205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_528203 ?auto_528204 ?auto_528205 )
      ( MAKE-7PILE ?auto_528203 ?auto_528204 ?auto_528205 ?auto_528206 ?auto_528207 ?auto_528208 ?auto_528209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528233 - BLOCK
      ?auto_528234 - BLOCK
      ?auto_528235 - BLOCK
      ?auto_528236 - BLOCK
      ?auto_528237 - BLOCK
      ?auto_528238 - BLOCK
      ?auto_528239 - BLOCK
    )
    :vars
    (
      ?auto_528240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528239 ?auto_528240 ) ( ON-TABLE ?auto_528233 ) ( not ( = ?auto_528233 ?auto_528234 ) ) ( not ( = ?auto_528233 ?auto_528235 ) ) ( not ( = ?auto_528233 ?auto_528236 ) ) ( not ( = ?auto_528233 ?auto_528237 ) ) ( not ( = ?auto_528233 ?auto_528238 ) ) ( not ( = ?auto_528233 ?auto_528239 ) ) ( not ( = ?auto_528233 ?auto_528240 ) ) ( not ( = ?auto_528234 ?auto_528235 ) ) ( not ( = ?auto_528234 ?auto_528236 ) ) ( not ( = ?auto_528234 ?auto_528237 ) ) ( not ( = ?auto_528234 ?auto_528238 ) ) ( not ( = ?auto_528234 ?auto_528239 ) ) ( not ( = ?auto_528234 ?auto_528240 ) ) ( not ( = ?auto_528235 ?auto_528236 ) ) ( not ( = ?auto_528235 ?auto_528237 ) ) ( not ( = ?auto_528235 ?auto_528238 ) ) ( not ( = ?auto_528235 ?auto_528239 ) ) ( not ( = ?auto_528235 ?auto_528240 ) ) ( not ( = ?auto_528236 ?auto_528237 ) ) ( not ( = ?auto_528236 ?auto_528238 ) ) ( not ( = ?auto_528236 ?auto_528239 ) ) ( not ( = ?auto_528236 ?auto_528240 ) ) ( not ( = ?auto_528237 ?auto_528238 ) ) ( not ( = ?auto_528237 ?auto_528239 ) ) ( not ( = ?auto_528237 ?auto_528240 ) ) ( not ( = ?auto_528238 ?auto_528239 ) ) ( not ( = ?auto_528238 ?auto_528240 ) ) ( not ( = ?auto_528239 ?auto_528240 ) ) ( ON ?auto_528238 ?auto_528239 ) ( ON ?auto_528237 ?auto_528238 ) ( ON ?auto_528236 ?auto_528237 ) ( ON ?auto_528235 ?auto_528236 ) ( CLEAR ?auto_528233 ) ( ON ?auto_528234 ?auto_528235 ) ( CLEAR ?auto_528234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_528233 ?auto_528234 )
      ( MAKE-7PILE ?auto_528233 ?auto_528234 ?auto_528235 ?auto_528236 ?auto_528237 ?auto_528238 ?auto_528239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_528263 - BLOCK
      ?auto_528264 - BLOCK
      ?auto_528265 - BLOCK
      ?auto_528266 - BLOCK
      ?auto_528267 - BLOCK
      ?auto_528268 - BLOCK
      ?auto_528269 - BLOCK
    )
    :vars
    (
      ?auto_528270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528269 ?auto_528270 ) ( not ( = ?auto_528263 ?auto_528264 ) ) ( not ( = ?auto_528263 ?auto_528265 ) ) ( not ( = ?auto_528263 ?auto_528266 ) ) ( not ( = ?auto_528263 ?auto_528267 ) ) ( not ( = ?auto_528263 ?auto_528268 ) ) ( not ( = ?auto_528263 ?auto_528269 ) ) ( not ( = ?auto_528263 ?auto_528270 ) ) ( not ( = ?auto_528264 ?auto_528265 ) ) ( not ( = ?auto_528264 ?auto_528266 ) ) ( not ( = ?auto_528264 ?auto_528267 ) ) ( not ( = ?auto_528264 ?auto_528268 ) ) ( not ( = ?auto_528264 ?auto_528269 ) ) ( not ( = ?auto_528264 ?auto_528270 ) ) ( not ( = ?auto_528265 ?auto_528266 ) ) ( not ( = ?auto_528265 ?auto_528267 ) ) ( not ( = ?auto_528265 ?auto_528268 ) ) ( not ( = ?auto_528265 ?auto_528269 ) ) ( not ( = ?auto_528265 ?auto_528270 ) ) ( not ( = ?auto_528266 ?auto_528267 ) ) ( not ( = ?auto_528266 ?auto_528268 ) ) ( not ( = ?auto_528266 ?auto_528269 ) ) ( not ( = ?auto_528266 ?auto_528270 ) ) ( not ( = ?auto_528267 ?auto_528268 ) ) ( not ( = ?auto_528267 ?auto_528269 ) ) ( not ( = ?auto_528267 ?auto_528270 ) ) ( not ( = ?auto_528268 ?auto_528269 ) ) ( not ( = ?auto_528268 ?auto_528270 ) ) ( not ( = ?auto_528269 ?auto_528270 ) ) ( ON ?auto_528268 ?auto_528269 ) ( ON ?auto_528267 ?auto_528268 ) ( ON ?auto_528266 ?auto_528267 ) ( ON ?auto_528265 ?auto_528266 ) ( ON ?auto_528264 ?auto_528265 ) ( ON ?auto_528263 ?auto_528264 ) ( CLEAR ?auto_528263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_528263 )
      ( MAKE-7PILE ?auto_528263 ?auto_528264 ?auto_528265 ?auto_528266 ?auto_528267 ?auto_528268 ?auto_528269 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528294 - BLOCK
      ?auto_528295 - BLOCK
      ?auto_528296 - BLOCK
      ?auto_528297 - BLOCK
      ?auto_528298 - BLOCK
      ?auto_528299 - BLOCK
      ?auto_528300 - BLOCK
      ?auto_528301 - BLOCK
    )
    :vars
    (
      ?auto_528302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_528300 ) ( ON ?auto_528301 ?auto_528302 ) ( CLEAR ?auto_528301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_528294 ) ( ON ?auto_528295 ?auto_528294 ) ( ON ?auto_528296 ?auto_528295 ) ( ON ?auto_528297 ?auto_528296 ) ( ON ?auto_528298 ?auto_528297 ) ( ON ?auto_528299 ?auto_528298 ) ( ON ?auto_528300 ?auto_528299 ) ( not ( = ?auto_528294 ?auto_528295 ) ) ( not ( = ?auto_528294 ?auto_528296 ) ) ( not ( = ?auto_528294 ?auto_528297 ) ) ( not ( = ?auto_528294 ?auto_528298 ) ) ( not ( = ?auto_528294 ?auto_528299 ) ) ( not ( = ?auto_528294 ?auto_528300 ) ) ( not ( = ?auto_528294 ?auto_528301 ) ) ( not ( = ?auto_528294 ?auto_528302 ) ) ( not ( = ?auto_528295 ?auto_528296 ) ) ( not ( = ?auto_528295 ?auto_528297 ) ) ( not ( = ?auto_528295 ?auto_528298 ) ) ( not ( = ?auto_528295 ?auto_528299 ) ) ( not ( = ?auto_528295 ?auto_528300 ) ) ( not ( = ?auto_528295 ?auto_528301 ) ) ( not ( = ?auto_528295 ?auto_528302 ) ) ( not ( = ?auto_528296 ?auto_528297 ) ) ( not ( = ?auto_528296 ?auto_528298 ) ) ( not ( = ?auto_528296 ?auto_528299 ) ) ( not ( = ?auto_528296 ?auto_528300 ) ) ( not ( = ?auto_528296 ?auto_528301 ) ) ( not ( = ?auto_528296 ?auto_528302 ) ) ( not ( = ?auto_528297 ?auto_528298 ) ) ( not ( = ?auto_528297 ?auto_528299 ) ) ( not ( = ?auto_528297 ?auto_528300 ) ) ( not ( = ?auto_528297 ?auto_528301 ) ) ( not ( = ?auto_528297 ?auto_528302 ) ) ( not ( = ?auto_528298 ?auto_528299 ) ) ( not ( = ?auto_528298 ?auto_528300 ) ) ( not ( = ?auto_528298 ?auto_528301 ) ) ( not ( = ?auto_528298 ?auto_528302 ) ) ( not ( = ?auto_528299 ?auto_528300 ) ) ( not ( = ?auto_528299 ?auto_528301 ) ) ( not ( = ?auto_528299 ?auto_528302 ) ) ( not ( = ?auto_528300 ?auto_528301 ) ) ( not ( = ?auto_528300 ?auto_528302 ) ) ( not ( = ?auto_528301 ?auto_528302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_528301 ?auto_528302 )
      ( !STACK ?auto_528301 ?auto_528300 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528328 - BLOCK
      ?auto_528329 - BLOCK
      ?auto_528330 - BLOCK
      ?auto_528331 - BLOCK
      ?auto_528332 - BLOCK
      ?auto_528333 - BLOCK
      ?auto_528334 - BLOCK
      ?auto_528335 - BLOCK
    )
    :vars
    (
      ?auto_528336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528335 ?auto_528336 ) ( ON-TABLE ?auto_528328 ) ( ON ?auto_528329 ?auto_528328 ) ( ON ?auto_528330 ?auto_528329 ) ( ON ?auto_528331 ?auto_528330 ) ( ON ?auto_528332 ?auto_528331 ) ( ON ?auto_528333 ?auto_528332 ) ( not ( = ?auto_528328 ?auto_528329 ) ) ( not ( = ?auto_528328 ?auto_528330 ) ) ( not ( = ?auto_528328 ?auto_528331 ) ) ( not ( = ?auto_528328 ?auto_528332 ) ) ( not ( = ?auto_528328 ?auto_528333 ) ) ( not ( = ?auto_528328 ?auto_528334 ) ) ( not ( = ?auto_528328 ?auto_528335 ) ) ( not ( = ?auto_528328 ?auto_528336 ) ) ( not ( = ?auto_528329 ?auto_528330 ) ) ( not ( = ?auto_528329 ?auto_528331 ) ) ( not ( = ?auto_528329 ?auto_528332 ) ) ( not ( = ?auto_528329 ?auto_528333 ) ) ( not ( = ?auto_528329 ?auto_528334 ) ) ( not ( = ?auto_528329 ?auto_528335 ) ) ( not ( = ?auto_528329 ?auto_528336 ) ) ( not ( = ?auto_528330 ?auto_528331 ) ) ( not ( = ?auto_528330 ?auto_528332 ) ) ( not ( = ?auto_528330 ?auto_528333 ) ) ( not ( = ?auto_528330 ?auto_528334 ) ) ( not ( = ?auto_528330 ?auto_528335 ) ) ( not ( = ?auto_528330 ?auto_528336 ) ) ( not ( = ?auto_528331 ?auto_528332 ) ) ( not ( = ?auto_528331 ?auto_528333 ) ) ( not ( = ?auto_528331 ?auto_528334 ) ) ( not ( = ?auto_528331 ?auto_528335 ) ) ( not ( = ?auto_528331 ?auto_528336 ) ) ( not ( = ?auto_528332 ?auto_528333 ) ) ( not ( = ?auto_528332 ?auto_528334 ) ) ( not ( = ?auto_528332 ?auto_528335 ) ) ( not ( = ?auto_528332 ?auto_528336 ) ) ( not ( = ?auto_528333 ?auto_528334 ) ) ( not ( = ?auto_528333 ?auto_528335 ) ) ( not ( = ?auto_528333 ?auto_528336 ) ) ( not ( = ?auto_528334 ?auto_528335 ) ) ( not ( = ?auto_528334 ?auto_528336 ) ) ( not ( = ?auto_528335 ?auto_528336 ) ) ( CLEAR ?auto_528333 ) ( ON ?auto_528334 ?auto_528335 ) ( CLEAR ?auto_528334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_528328 ?auto_528329 ?auto_528330 ?auto_528331 ?auto_528332 ?auto_528333 ?auto_528334 )
      ( MAKE-8PILE ?auto_528328 ?auto_528329 ?auto_528330 ?auto_528331 ?auto_528332 ?auto_528333 ?auto_528334 ?auto_528335 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528362 - BLOCK
      ?auto_528363 - BLOCK
      ?auto_528364 - BLOCK
      ?auto_528365 - BLOCK
      ?auto_528366 - BLOCK
      ?auto_528367 - BLOCK
      ?auto_528368 - BLOCK
      ?auto_528369 - BLOCK
    )
    :vars
    (
      ?auto_528370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528369 ?auto_528370 ) ( ON-TABLE ?auto_528362 ) ( ON ?auto_528363 ?auto_528362 ) ( ON ?auto_528364 ?auto_528363 ) ( ON ?auto_528365 ?auto_528364 ) ( ON ?auto_528366 ?auto_528365 ) ( not ( = ?auto_528362 ?auto_528363 ) ) ( not ( = ?auto_528362 ?auto_528364 ) ) ( not ( = ?auto_528362 ?auto_528365 ) ) ( not ( = ?auto_528362 ?auto_528366 ) ) ( not ( = ?auto_528362 ?auto_528367 ) ) ( not ( = ?auto_528362 ?auto_528368 ) ) ( not ( = ?auto_528362 ?auto_528369 ) ) ( not ( = ?auto_528362 ?auto_528370 ) ) ( not ( = ?auto_528363 ?auto_528364 ) ) ( not ( = ?auto_528363 ?auto_528365 ) ) ( not ( = ?auto_528363 ?auto_528366 ) ) ( not ( = ?auto_528363 ?auto_528367 ) ) ( not ( = ?auto_528363 ?auto_528368 ) ) ( not ( = ?auto_528363 ?auto_528369 ) ) ( not ( = ?auto_528363 ?auto_528370 ) ) ( not ( = ?auto_528364 ?auto_528365 ) ) ( not ( = ?auto_528364 ?auto_528366 ) ) ( not ( = ?auto_528364 ?auto_528367 ) ) ( not ( = ?auto_528364 ?auto_528368 ) ) ( not ( = ?auto_528364 ?auto_528369 ) ) ( not ( = ?auto_528364 ?auto_528370 ) ) ( not ( = ?auto_528365 ?auto_528366 ) ) ( not ( = ?auto_528365 ?auto_528367 ) ) ( not ( = ?auto_528365 ?auto_528368 ) ) ( not ( = ?auto_528365 ?auto_528369 ) ) ( not ( = ?auto_528365 ?auto_528370 ) ) ( not ( = ?auto_528366 ?auto_528367 ) ) ( not ( = ?auto_528366 ?auto_528368 ) ) ( not ( = ?auto_528366 ?auto_528369 ) ) ( not ( = ?auto_528366 ?auto_528370 ) ) ( not ( = ?auto_528367 ?auto_528368 ) ) ( not ( = ?auto_528367 ?auto_528369 ) ) ( not ( = ?auto_528367 ?auto_528370 ) ) ( not ( = ?auto_528368 ?auto_528369 ) ) ( not ( = ?auto_528368 ?auto_528370 ) ) ( not ( = ?auto_528369 ?auto_528370 ) ) ( ON ?auto_528368 ?auto_528369 ) ( CLEAR ?auto_528366 ) ( ON ?auto_528367 ?auto_528368 ) ( CLEAR ?auto_528367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_528362 ?auto_528363 ?auto_528364 ?auto_528365 ?auto_528366 ?auto_528367 )
      ( MAKE-8PILE ?auto_528362 ?auto_528363 ?auto_528364 ?auto_528365 ?auto_528366 ?auto_528367 ?auto_528368 ?auto_528369 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528396 - BLOCK
      ?auto_528397 - BLOCK
      ?auto_528398 - BLOCK
      ?auto_528399 - BLOCK
      ?auto_528400 - BLOCK
      ?auto_528401 - BLOCK
      ?auto_528402 - BLOCK
      ?auto_528403 - BLOCK
    )
    :vars
    (
      ?auto_528404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528403 ?auto_528404 ) ( ON-TABLE ?auto_528396 ) ( ON ?auto_528397 ?auto_528396 ) ( ON ?auto_528398 ?auto_528397 ) ( ON ?auto_528399 ?auto_528398 ) ( not ( = ?auto_528396 ?auto_528397 ) ) ( not ( = ?auto_528396 ?auto_528398 ) ) ( not ( = ?auto_528396 ?auto_528399 ) ) ( not ( = ?auto_528396 ?auto_528400 ) ) ( not ( = ?auto_528396 ?auto_528401 ) ) ( not ( = ?auto_528396 ?auto_528402 ) ) ( not ( = ?auto_528396 ?auto_528403 ) ) ( not ( = ?auto_528396 ?auto_528404 ) ) ( not ( = ?auto_528397 ?auto_528398 ) ) ( not ( = ?auto_528397 ?auto_528399 ) ) ( not ( = ?auto_528397 ?auto_528400 ) ) ( not ( = ?auto_528397 ?auto_528401 ) ) ( not ( = ?auto_528397 ?auto_528402 ) ) ( not ( = ?auto_528397 ?auto_528403 ) ) ( not ( = ?auto_528397 ?auto_528404 ) ) ( not ( = ?auto_528398 ?auto_528399 ) ) ( not ( = ?auto_528398 ?auto_528400 ) ) ( not ( = ?auto_528398 ?auto_528401 ) ) ( not ( = ?auto_528398 ?auto_528402 ) ) ( not ( = ?auto_528398 ?auto_528403 ) ) ( not ( = ?auto_528398 ?auto_528404 ) ) ( not ( = ?auto_528399 ?auto_528400 ) ) ( not ( = ?auto_528399 ?auto_528401 ) ) ( not ( = ?auto_528399 ?auto_528402 ) ) ( not ( = ?auto_528399 ?auto_528403 ) ) ( not ( = ?auto_528399 ?auto_528404 ) ) ( not ( = ?auto_528400 ?auto_528401 ) ) ( not ( = ?auto_528400 ?auto_528402 ) ) ( not ( = ?auto_528400 ?auto_528403 ) ) ( not ( = ?auto_528400 ?auto_528404 ) ) ( not ( = ?auto_528401 ?auto_528402 ) ) ( not ( = ?auto_528401 ?auto_528403 ) ) ( not ( = ?auto_528401 ?auto_528404 ) ) ( not ( = ?auto_528402 ?auto_528403 ) ) ( not ( = ?auto_528402 ?auto_528404 ) ) ( not ( = ?auto_528403 ?auto_528404 ) ) ( ON ?auto_528402 ?auto_528403 ) ( ON ?auto_528401 ?auto_528402 ) ( CLEAR ?auto_528399 ) ( ON ?auto_528400 ?auto_528401 ) ( CLEAR ?auto_528400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_528396 ?auto_528397 ?auto_528398 ?auto_528399 ?auto_528400 )
      ( MAKE-8PILE ?auto_528396 ?auto_528397 ?auto_528398 ?auto_528399 ?auto_528400 ?auto_528401 ?auto_528402 ?auto_528403 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528430 - BLOCK
      ?auto_528431 - BLOCK
      ?auto_528432 - BLOCK
      ?auto_528433 - BLOCK
      ?auto_528434 - BLOCK
      ?auto_528435 - BLOCK
      ?auto_528436 - BLOCK
      ?auto_528437 - BLOCK
    )
    :vars
    (
      ?auto_528438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528437 ?auto_528438 ) ( ON-TABLE ?auto_528430 ) ( ON ?auto_528431 ?auto_528430 ) ( ON ?auto_528432 ?auto_528431 ) ( not ( = ?auto_528430 ?auto_528431 ) ) ( not ( = ?auto_528430 ?auto_528432 ) ) ( not ( = ?auto_528430 ?auto_528433 ) ) ( not ( = ?auto_528430 ?auto_528434 ) ) ( not ( = ?auto_528430 ?auto_528435 ) ) ( not ( = ?auto_528430 ?auto_528436 ) ) ( not ( = ?auto_528430 ?auto_528437 ) ) ( not ( = ?auto_528430 ?auto_528438 ) ) ( not ( = ?auto_528431 ?auto_528432 ) ) ( not ( = ?auto_528431 ?auto_528433 ) ) ( not ( = ?auto_528431 ?auto_528434 ) ) ( not ( = ?auto_528431 ?auto_528435 ) ) ( not ( = ?auto_528431 ?auto_528436 ) ) ( not ( = ?auto_528431 ?auto_528437 ) ) ( not ( = ?auto_528431 ?auto_528438 ) ) ( not ( = ?auto_528432 ?auto_528433 ) ) ( not ( = ?auto_528432 ?auto_528434 ) ) ( not ( = ?auto_528432 ?auto_528435 ) ) ( not ( = ?auto_528432 ?auto_528436 ) ) ( not ( = ?auto_528432 ?auto_528437 ) ) ( not ( = ?auto_528432 ?auto_528438 ) ) ( not ( = ?auto_528433 ?auto_528434 ) ) ( not ( = ?auto_528433 ?auto_528435 ) ) ( not ( = ?auto_528433 ?auto_528436 ) ) ( not ( = ?auto_528433 ?auto_528437 ) ) ( not ( = ?auto_528433 ?auto_528438 ) ) ( not ( = ?auto_528434 ?auto_528435 ) ) ( not ( = ?auto_528434 ?auto_528436 ) ) ( not ( = ?auto_528434 ?auto_528437 ) ) ( not ( = ?auto_528434 ?auto_528438 ) ) ( not ( = ?auto_528435 ?auto_528436 ) ) ( not ( = ?auto_528435 ?auto_528437 ) ) ( not ( = ?auto_528435 ?auto_528438 ) ) ( not ( = ?auto_528436 ?auto_528437 ) ) ( not ( = ?auto_528436 ?auto_528438 ) ) ( not ( = ?auto_528437 ?auto_528438 ) ) ( ON ?auto_528436 ?auto_528437 ) ( ON ?auto_528435 ?auto_528436 ) ( ON ?auto_528434 ?auto_528435 ) ( CLEAR ?auto_528432 ) ( ON ?auto_528433 ?auto_528434 ) ( CLEAR ?auto_528433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_528430 ?auto_528431 ?auto_528432 ?auto_528433 )
      ( MAKE-8PILE ?auto_528430 ?auto_528431 ?auto_528432 ?auto_528433 ?auto_528434 ?auto_528435 ?auto_528436 ?auto_528437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528464 - BLOCK
      ?auto_528465 - BLOCK
      ?auto_528466 - BLOCK
      ?auto_528467 - BLOCK
      ?auto_528468 - BLOCK
      ?auto_528469 - BLOCK
      ?auto_528470 - BLOCK
      ?auto_528471 - BLOCK
    )
    :vars
    (
      ?auto_528472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528471 ?auto_528472 ) ( ON-TABLE ?auto_528464 ) ( ON ?auto_528465 ?auto_528464 ) ( not ( = ?auto_528464 ?auto_528465 ) ) ( not ( = ?auto_528464 ?auto_528466 ) ) ( not ( = ?auto_528464 ?auto_528467 ) ) ( not ( = ?auto_528464 ?auto_528468 ) ) ( not ( = ?auto_528464 ?auto_528469 ) ) ( not ( = ?auto_528464 ?auto_528470 ) ) ( not ( = ?auto_528464 ?auto_528471 ) ) ( not ( = ?auto_528464 ?auto_528472 ) ) ( not ( = ?auto_528465 ?auto_528466 ) ) ( not ( = ?auto_528465 ?auto_528467 ) ) ( not ( = ?auto_528465 ?auto_528468 ) ) ( not ( = ?auto_528465 ?auto_528469 ) ) ( not ( = ?auto_528465 ?auto_528470 ) ) ( not ( = ?auto_528465 ?auto_528471 ) ) ( not ( = ?auto_528465 ?auto_528472 ) ) ( not ( = ?auto_528466 ?auto_528467 ) ) ( not ( = ?auto_528466 ?auto_528468 ) ) ( not ( = ?auto_528466 ?auto_528469 ) ) ( not ( = ?auto_528466 ?auto_528470 ) ) ( not ( = ?auto_528466 ?auto_528471 ) ) ( not ( = ?auto_528466 ?auto_528472 ) ) ( not ( = ?auto_528467 ?auto_528468 ) ) ( not ( = ?auto_528467 ?auto_528469 ) ) ( not ( = ?auto_528467 ?auto_528470 ) ) ( not ( = ?auto_528467 ?auto_528471 ) ) ( not ( = ?auto_528467 ?auto_528472 ) ) ( not ( = ?auto_528468 ?auto_528469 ) ) ( not ( = ?auto_528468 ?auto_528470 ) ) ( not ( = ?auto_528468 ?auto_528471 ) ) ( not ( = ?auto_528468 ?auto_528472 ) ) ( not ( = ?auto_528469 ?auto_528470 ) ) ( not ( = ?auto_528469 ?auto_528471 ) ) ( not ( = ?auto_528469 ?auto_528472 ) ) ( not ( = ?auto_528470 ?auto_528471 ) ) ( not ( = ?auto_528470 ?auto_528472 ) ) ( not ( = ?auto_528471 ?auto_528472 ) ) ( ON ?auto_528470 ?auto_528471 ) ( ON ?auto_528469 ?auto_528470 ) ( ON ?auto_528468 ?auto_528469 ) ( ON ?auto_528467 ?auto_528468 ) ( CLEAR ?auto_528465 ) ( ON ?auto_528466 ?auto_528467 ) ( CLEAR ?auto_528466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_528464 ?auto_528465 ?auto_528466 )
      ( MAKE-8PILE ?auto_528464 ?auto_528465 ?auto_528466 ?auto_528467 ?auto_528468 ?auto_528469 ?auto_528470 ?auto_528471 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528498 - BLOCK
      ?auto_528499 - BLOCK
      ?auto_528500 - BLOCK
      ?auto_528501 - BLOCK
      ?auto_528502 - BLOCK
      ?auto_528503 - BLOCK
      ?auto_528504 - BLOCK
      ?auto_528505 - BLOCK
    )
    :vars
    (
      ?auto_528506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528505 ?auto_528506 ) ( ON-TABLE ?auto_528498 ) ( not ( = ?auto_528498 ?auto_528499 ) ) ( not ( = ?auto_528498 ?auto_528500 ) ) ( not ( = ?auto_528498 ?auto_528501 ) ) ( not ( = ?auto_528498 ?auto_528502 ) ) ( not ( = ?auto_528498 ?auto_528503 ) ) ( not ( = ?auto_528498 ?auto_528504 ) ) ( not ( = ?auto_528498 ?auto_528505 ) ) ( not ( = ?auto_528498 ?auto_528506 ) ) ( not ( = ?auto_528499 ?auto_528500 ) ) ( not ( = ?auto_528499 ?auto_528501 ) ) ( not ( = ?auto_528499 ?auto_528502 ) ) ( not ( = ?auto_528499 ?auto_528503 ) ) ( not ( = ?auto_528499 ?auto_528504 ) ) ( not ( = ?auto_528499 ?auto_528505 ) ) ( not ( = ?auto_528499 ?auto_528506 ) ) ( not ( = ?auto_528500 ?auto_528501 ) ) ( not ( = ?auto_528500 ?auto_528502 ) ) ( not ( = ?auto_528500 ?auto_528503 ) ) ( not ( = ?auto_528500 ?auto_528504 ) ) ( not ( = ?auto_528500 ?auto_528505 ) ) ( not ( = ?auto_528500 ?auto_528506 ) ) ( not ( = ?auto_528501 ?auto_528502 ) ) ( not ( = ?auto_528501 ?auto_528503 ) ) ( not ( = ?auto_528501 ?auto_528504 ) ) ( not ( = ?auto_528501 ?auto_528505 ) ) ( not ( = ?auto_528501 ?auto_528506 ) ) ( not ( = ?auto_528502 ?auto_528503 ) ) ( not ( = ?auto_528502 ?auto_528504 ) ) ( not ( = ?auto_528502 ?auto_528505 ) ) ( not ( = ?auto_528502 ?auto_528506 ) ) ( not ( = ?auto_528503 ?auto_528504 ) ) ( not ( = ?auto_528503 ?auto_528505 ) ) ( not ( = ?auto_528503 ?auto_528506 ) ) ( not ( = ?auto_528504 ?auto_528505 ) ) ( not ( = ?auto_528504 ?auto_528506 ) ) ( not ( = ?auto_528505 ?auto_528506 ) ) ( ON ?auto_528504 ?auto_528505 ) ( ON ?auto_528503 ?auto_528504 ) ( ON ?auto_528502 ?auto_528503 ) ( ON ?auto_528501 ?auto_528502 ) ( ON ?auto_528500 ?auto_528501 ) ( CLEAR ?auto_528498 ) ( ON ?auto_528499 ?auto_528500 ) ( CLEAR ?auto_528499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_528498 ?auto_528499 )
      ( MAKE-8PILE ?auto_528498 ?auto_528499 ?auto_528500 ?auto_528501 ?auto_528502 ?auto_528503 ?auto_528504 ?auto_528505 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_528532 - BLOCK
      ?auto_528533 - BLOCK
      ?auto_528534 - BLOCK
      ?auto_528535 - BLOCK
      ?auto_528536 - BLOCK
      ?auto_528537 - BLOCK
      ?auto_528538 - BLOCK
      ?auto_528539 - BLOCK
    )
    :vars
    (
      ?auto_528540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528539 ?auto_528540 ) ( not ( = ?auto_528532 ?auto_528533 ) ) ( not ( = ?auto_528532 ?auto_528534 ) ) ( not ( = ?auto_528532 ?auto_528535 ) ) ( not ( = ?auto_528532 ?auto_528536 ) ) ( not ( = ?auto_528532 ?auto_528537 ) ) ( not ( = ?auto_528532 ?auto_528538 ) ) ( not ( = ?auto_528532 ?auto_528539 ) ) ( not ( = ?auto_528532 ?auto_528540 ) ) ( not ( = ?auto_528533 ?auto_528534 ) ) ( not ( = ?auto_528533 ?auto_528535 ) ) ( not ( = ?auto_528533 ?auto_528536 ) ) ( not ( = ?auto_528533 ?auto_528537 ) ) ( not ( = ?auto_528533 ?auto_528538 ) ) ( not ( = ?auto_528533 ?auto_528539 ) ) ( not ( = ?auto_528533 ?auto_528540 ) ) ( not ( = ?auto_528534 ?auto_528535 ) ) ( not ( = ?auto_528534 ?auto_528536 ) ) ( not ( = ?auto_528534 ?auto_528537 ) ) ( not ( = ?auto_528534 ?auto_528538 ) ) ( not ( = ?auto_528534 ?auto_528539 ) ) ( not ( = ?auto_528534 ?auto_528540 ) ) ( not ( = ?auto_528535 ?auto_528536 ) ) ( not ( = ?auto_528535 ?auto_528537 ) ) ( not ( = ?auto_528535 ?auto_528538 ) ) ( not ( = ?auto_528535 ?auto_528539 ) ) ( not ( = ?auto_528535 ?auto_528540 ) ) ( not ( = ?auto_528536 ?auto_528537 ) ) ( not ( = ?auto_528536 ?auto_528538 ) ) ( not ( = ?auto_528536 ?auto_528539 ) ) ( not ( = ?auto_528536 ?auto_528540 ) ) ( not ( = ?auto_528537 ?auto_528538 ) ) ( not ( = ?auto_528537 ?auto_528539 ) ) ( not ( = ?auto_528537 ?auto_528540 ) ) ( not ( = ?auto_528538 ?auto_528539 ) ) ( not ( = ?auto_528538 ?auto_528540 ) ) ( not ( = ?auto_528539 ?auto_528540 ) ) ( ON ?auto_528538 ?auto_528539 ) ( ON ?auto_528537 ?auto_528538 ) ( ON ?auto_528536 ?auto_528537 ) ( ON ?auto_528535 ?auto_528536 ) ( ON ?auto_528534 ?auto_528535 ) ( ON ?auto_528533 ?auto_528534 ) ( ON ?auto_528532 ?auto_528533 ) ( CLEAR ?auto_528532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_528532 )
      ( MAKE-8PILE ?auto_528532 ?auto_528533 ?auto_528534 ?auto_528535 ?auto_528536 ?auto_528537 ?auto_528538 ?auto_528539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528567 - BLOCK
      ?auto_528568 - BLOCK
      ?auto_528569 - BLOCK
      ?auto_528570 - BLOCK
      ?auto_528571 - BLOCK
      ?auto_528572 - BLOCK
      ?auto_528573 - BLOCK
      ?auto_528574 - BLOCK
      ?auto_528575 - BLOCK
    )
    :vars
    (
      ?auto_528576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_528574 ) ( ON ?auto_528575 ?auto_528576 ) ( CLEAR ?auto_528575 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_528567 ) ( ON ?auto_528568 ?auto_528567 ) ( ON ?auto_528569 ?auto_528568 ) ( ON ?auto_528570 ?auto_528569 ) ( ON ?auto_528571 ?auto_528570 ) ( ON ?auto_528572 ?auto_528571 ) ( ON ?auto_528573 ?auto_528572 ) ( ON ?auto_528574 ?auto_528573 ) ( not ( = ?auto_528567 ?auto_528568 ) ) ( not ( = ?auto_528567 ?auto_528569 ) ) ( not ( = ?auto_528567 ?auto_528570 ) ) ( not ( = ?auto_528567 ?auto_528571 ) ) ( not ( = ?auto_528567 ?auto_528572 ) ) ( not ( = ?auto_528567 ?auto_528573 ) ) ( not ( = ?auto_528567 ?auto_528574 ) ) ( not ( = ?auto_528567 ?auto_528575 ) ) ( not ( = ?auto_528567 ?auto_528576 ) ) ( not ( = ?auto_528568 ?auto_528569 ) ) ( not ( = ?auto_528568 ?auto_528570 ) ) ( not ( = ?auto_528568 ?auto_528571 ) ) ( not ( = ?auto_528568 ?auto_528572 ) ) ( not ( = ?auto_528568 ?auto_528573 ) ) ( not ( = ?auto_528568 ?auto_528574 ) ) ( not ( = ?auto_528568 ?auto_528575 ) ) ( not ( = ?auto_528568 ?auto_528576 ) ) ( not ( = ?auto_528569 ?auto_528570 ) ) ( not ( = ?auto_528569 ?auto_528571 ) ) ( not ( = ?auto_528569 ?auto_528572 ) ) ( not ( = ?auto_528569 ?auto_528573 ) ) ( not ( = ?auto_528569 ?auto_528574 ) ) ( not ( = ?auto_528569 ?auto_528575 ) ) ( not ( = ?auto_528569 ?auto_528576 ) ) ( not ( = ?auto_528570 ?auto_528571 ) ) ( not ( = ?auto_528570 ?auto_528572 ) ) ( not ( = ?auto_528570 ?auto_528573 ) ) ( not ( = ?auto_528570 ?auto_528574 ) ) ( not ( = ?auto_528570 ?auto_528575 ) ) ( not ( = ?auto_528570 ?auto_528576 ) ) ( not ( = ?auto_528571 ?auto_528572 ) ) ( not ( = ?auto_528571 ?auto_528573 ) ) ( not ( = ?auto_528571 ?auto_528574 ) ) ( not ( = ?auto_528571 ?auto_528575 ) ) ( not ( = ?auto_528571 ?auto_528576 ) ) ( not ( = ?auto_528572 ?auto_528573 ) ) ( not ( = ?auto_528572 ?auto_528574 ) ) ( not ( = ?auto_528572 ?auto_528575 ) ) ( not ( = ?auto_528572 ?auto_528576 ) ) ( not ( = ?auto_528573 ?auto_528574 ) ) ( not ( = ?auto_528573 ?auto_528575 ) ) ( not ( = ?auto_528573 ?auto_528576 ) ) ( not ( = ?auto_528574 ?auto_528575 ) ) ( not ( = ?auto_528574 ?auto_528576 ) ) ( not ( = ?auto_528575 ?auto_528576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_528575 ?auto_528576 )
      ( !STACK ?auto_528575 ?auto_528574 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528605 - BLOCK
      ?auto_528606 - BLOCK
      ?auto_528607 - BLOCK
      ?auto_528608 - BLOCK
      ?auto_528609 - BLOCK
      ?auto_528610 - BLOCK
      ?auto_528611 - BLOCK
      ?auto_528612 - BLOCK
      ?auto_528613 - BLOCK
    )
    :vars
    (
      ?auto_528614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528613 ?auto_528614 ) ( ON-TABLE ?auto_528605 ) ( ON ?auto_528606 ?auto_528605 ) ( ON ?auto_528607 ?auto_528606 ) ( ON ?auto_528608 ?auto_528607 ) ( ON ?auto_528609 ?auto_528608 ) ( ON ?auto_528610 ?auto_528609 ) ( ON ?auto_528611 ?auto_528610 ) ( not ( = ?auto_528605 ?auto_528606 ) ) ( not ( = ?auto_528605 ?auto_528607 ) ) ( not ( = ?auto_528605 ?auto_528608 ) ) ( not ( = ?auto_528605 ?auto_528609 ) ) ( not ( = ?auto_528605 ?auto_528610 ) ) ( not ( = ?auto_528605 ?auto_528611 ) ) ( not ( = ?auto_528605 ?auto_528612 ) ) ( not ( = ?auto_528605 ?auto_528613 ) ) ( not ( = ?auto_528605 ?auto_528614 ) ) ( not ( = ?auto_528606 ?auto_528607 ) ) ( not ( = ?auto_528606 ?auto_528608 ) ) ( not ( = ?auto_528606 ?auto_528609 ) ) ( not ( = ?auto_528606 ?auto_528610 ) ) ( not ( = ?auto_528606 ?auto_528611 ) ) ( not ( = ?auto_528606 ?auto_528612 ) ) ( not ( = ?auto_528606 ?auto_528613 ) ) ( not ( = ?auto_528606 ?auto_528614 ) ) ( not ( = ?auto_528607 ?auto_528608 ) ) ( not ( = ?auto_528607 ?auto_528609 ) ) ( not ( = ?auto_528607 ?auto_528610 ) ) ( not ( = ?auto_528607 ?auto_528611 ) ) ( not ( = ?auto_528607 ?auto_528612 ) ) ( not ( = ?auto_528607 ?auto_528613 ) ) ( not ( = ?auto_528607 ?auto_528614 ) ) ( not ( = ?auto_528608 ?auto_528609 ) ) ( not ( = ?auto_528608 ?auto_528610 ) ) ( not ( = ?auto_528608 ?auto_528611 ) ) ( not ( = ?auto_528608 ?auto_528612 ) ) ( not ( = ?auto_528608 ?auto_528613 ) ) ( not ( = ?auto_528608 ?auto_528614 ) ) ( not ( = ?auto_528609 ?auto_528610 ) ) ( not ( = ?auto_528609 ?auto_528611 ) ) ( not ( = ?auto_528609 ?auto_528612 ) ) ( not ( = ?auto_528609 ?auto_528613 ) ) ( not ( = ?auto_528609 ?auto_528614 ) ) ( not ( = ?auto_528610 ?auto_528611 ) ) ( not ( = ?auto_528610 ?auto_528612 ) ) ( not ( = ?auto_528610 ?auto_528613 ) ) ( not ( = ?auto_528610 ?auto_528614 ) ) ( not ( = ?auto_528611 ?auto_528612 ) ) ( not ( = ?auto_528611 ?auto_528613 ) ) ( not ( = ?auto_528611 ?auto_528614 ) ) ( not ( = ?auto_528612 ?auto_528613 ) ) ( not ( = ?auto_528612 ?auto_528614 ) ) ( not ( = ?auto_528613 ?auto_528614 ) ) ( CLEAR ?auto_528611 ) ( ON ?auto_528612 ?auto_528613 ) ( CLEAR ?auto_528612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_528605 ?auto_528606 ?auto_528607 ?auto_528608 ?auto_528609 ?auto_528610 ?auto_528611 ?auto_528612 )
      ( MAKE-9PILE ?auto_528605 ?auto_528606 ?auto_528607 ?auto_528608 ?auto_528609 ?auto_528610 ?auto_528611 ?auto_528612 ?auto_528613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528643 - BLOCK
      ?auto_528644 - BLOCK
      ?auto_528645 - BLOCK
      ?auto_528646 - BLOCK
      ?auto_528647 - BLOCK
      ?auto_528648 - BLOCK
      ?auto_528649 - BLOCK
      ?auto_528650 - BLOCK
      ?auto_528651 - BLOCK
    )
    :vars
    (
      ?auto_528652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528651 ?auto_528652 ) ( ON-TABLE ?auto_528643 ) ( ON ?auto_528644 ?auto_528643 ) ( ON ?auto_528645 ?auto_528644 ) ( ON ?auto_528646 ?auto_528645 ) ( ON ?auto_528647 ?auto_528646 ) ( ON ?auto_528648 ?auto_528647 ) ( not ( = ?auto_528643 ?auto_528644 ) ) ( not ( = ?auto_528643 ?auto_528645 ) ) ( not ( = ?auto_528643 ?auto_528646 ) ) ( not ( = ?auto_528643 ?auto_528647 ) ) ( not ( = ?auto_528643 ?auto_528648 ) ) ( not ( = ?auto_528643 ?auto_528649 ) ) ( not ( = ?auto_528643 ?auto_528650 ) ) ( not ( = ?auto_528643 ?auto_528651 ) ) ( not ( = ?auto_528643 ?auto_528652 ) ) ( not ( = ?auto_528644 ?auto_528645 ) ) ( not ( = ?auto_528644 ?auto_528646 ) ) ( not ( = ?auto_528644 ?auto_528647 ) ) ( not ( = ?auto_528644 ?auto_528648 ) ) ( not ( = ?auto_528644 ?auto_528649 ) ) ( not ( = ?auto_528644 ?auto_528650 ) ) ( not ( = ?auto_528644 ?auto_528651 ) ) ( not ( = ?auto_528644 ?auto_528652 ) ) ( not ( = ?auto_528645 ?auto_528646 ) ) ( not ( = ?auto_528645 ?auto_528647 ) ) ( not ( = ?auto_528645 ?auto_528648 ) ) ( not ( = ?auto_528645 ?auto_528649 ) ) ( not ( = ?auto_528645 ?auto_528650 ) ) ( not ( = ?auto_528645 ?auto_528651 ) ) ( not ( = ?auto_528645 ?auto_528652 ) ) ( not ( = ?auto_528646 ?auto_528647 ) ) ( not ( = ?auto_528646 ?auto_528648 ) ) ( not ( = ?auto_528646 ?auto_528649 ) ) ( not ( = ?auto_528646 ?auto_528650 ) ) ( not ( = ?auto_528646 ?auto_528651 ) ) ( not ( = ?auto_528646 ?auto_528652 ) ) ( not ( = ?auto_528647 ?auto_528648 ) ) ( not ( = ?auto_528647 ?auto_528649 ) ) ( not ( = ?auto_528647 ?auto_528650 ) ) ( not ( = ?auto_528647 ?auto_528651 ) ) ( not ( = ?auto_528647 ?auto_528652 ) ) ( not ( = ?auto_528648 ?auto_528649 ) ) ( not ( = ?auto_528648 ?auto_528650 ) ) ( not ( = ?auto_528648 ?auto_528651 ) ) ( not ( = ?auto_528648 ?auto_528652 ) ) ( not ( = ?auto_528649 ?auto_528650 ) ) ( not ( = ?auto_528649 ?auto_528651 ) ) ( not ( = ?auto_528649 ?auto_528652 ) ) ( not ( = ?auto_528650 ?auto_528651 ) ) ( not ( = ?auto_528650 ?auto_528652 ) ) ( not ( = ?auto_528651 ?auto_528652 ) ) ( ON ?auto_528650 ?auto_528651 ) ( CLEAR ?auto_528648 ) ( ON ?auto_528649 ?auto_528650 ) ( CLEAR ?auto_528649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_528643 ?auto_528644 ?auto_528645 ?auto_528646 ?auto_528647 ?auto_528648 ?auto_528649 )
      ( MAKE-9PILE ?auto_528643 ?auto_528644 ?auto_528645 ?auto_528646 ?auto_528647 ?auto_528648 ?auto_528649 ?auto_528650 ?auto_528651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528681 - BLOCK
      ?auto_528682 - BLOCK
      ?auto_528683 - BLOCK
      ?auto_528684 - BLOCK
      ?auto_528685 - BLOCK
      ?auto_528686 - BLOCK
      ?auto_528687 - BLOCK
      ?auto_528688 - BLOCK
      ?auto_528689 - BLOCK
    )
    :vars
    (
      ?auto_528690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528689 ?auto_528690 ) ( ON-TABLE ?auto_528681 ) ( ON ?auto_528682 ?auto_528681 ) ( ON ?auto_528683 ?auto_528682 ) ( ON ?auto_528684 ?auto_528683 ) ( ON ?auto_528685 ?auto_528684 ) ( not ( = ?auto_528681 ?auto_528682 ) ) ( not ( = ?auto_528681 ?auto_528683 ) ) ( not ( = ?auto_528681 ?auto_528684 ) ) ( not ( = ?auto_528681 ?auto_528685 ) ) ( not ( = ?auto_528681 ?auto_528686 ) ) ( not ( = ?auto_528681 ?auto_528687 ) ) ( not ( = ?auto_528681 ?auto_528688 ) ) ( not ( = ?auto_528681 ?auto_528689 ) ) ( not ( = ?auto_528681 ?auto_528690 ) ) ( not ( = ?auto_528682 ?auto_528683 ) ) ( not ( = ?auto_528682 ?auto_528684 ) ) ( not ( = ?auto_528682 ?auto_528685 ) ) ( not ( = ?auto_528682 ?auto_528686 ) ) ( not ( = ?auto_528682 ?auto_528687 ) ) ( not ( = ?auto_528682 ?auto_528688 ) ) ( not ( = ?auto_528682 ?auto_528689 ) ) ( not ( = ?auto_528682 ?auto_528690 ) ) ( not ( = ?auto_528683 ?auto_528684 ) ) ( not ( = ?auto_528683 ?auto_528685 ) ) ( not ( = ?auto_528683 ?auto_528686 ) ) ( not ( = ?auto_528683 ?auto_528687 ) ) ( not ( = ?auto_528683 ?auto_528688 ) ) ( not ( = ?auto_528683 ?auto_528689 ) ) ( not ( = ?auto_528683 ?auto_528690 ) ) ( not ( = ?auto_528684 ?auto_528685 ) ) ( not ( = ?auto_528684 ?auto_528686 ) ) ( not ( = ?auto_528684 ?auto_528687 ) ) ( not ( = ?auto_528684 ?auto_528688 ) ) ( not ( = ?auto_528684 ?auto_528689 ) ) ( not ( = ?auto_528684 ?auto_528690 ) ) ( not ( = ?auto_528685 ?auto_528686 ) ) ( not ( = ?auto_528685 ?auto_528687 ) ) ( not ( = ?auto_528685 ?auto_528688 ) ) ( not ( = ?auto_528685 ?auto_528689 ) ) ( not ( = ?auto_528685 ?auto_528690 ) ) ( not ( = ?auto_528686 ?auto_528687 ) ) ( not ( = ?auto_528686 ?auto_528688 ) ) ( not ( = ?auto_528686 ?auto_528689 ) ) ( not ( = ?auto_528686 ?auto_528690 ) ) ( not ( = ?auto_528687 ?auto_528688 ) ) ( not ( = ?auto_528687 ?auto_528689 ) ) ( not ( = ?auto_528687 ?auto_528690 ) ) ( not ( = ?auto_528688 ?auto_528689 ) ) ( not ( = ?auto_528688 ?auto_528690 ) ) ( not ( = ?auto_528689 ?auto_528690 ) ) ( ON ?auto_528688 ?auto_528689 ) ( ON ?auto_528687 ?auto_528688 ) ( CLEAR ?auto_528685 ) ( ON ?auto_528686 ?auto_528687 ) ( CLEAR ?auto_528686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_528681 ?auto_528682 ?auto_528683 ?auto_528684 ?auto_528685 ?auto_528686 )
      ( MAKE-9PILE ?auto_528681 ?auto_528682 ?auto_528683 ?auto_528684 ?auto_528685 ?auto_528686 ?auto_528687 ?auto_528688 ?auto_528689 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528719 - BLOCK
      ?auto_528720 - BLOCK
      ?auto_528721 - BLOCK
      ?auto_528722 - BLOCK
      ?auto_528723 - BLOCK
      ?auto_528724 - BLOCK
      ?auto_528725 - BLOCK
      ?auto_528726 - BLOCK
      ?auto_528727 - BLOCK
    )
    :vars
    (
      ?auto_528728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528727 ?auto_528728 ) ( ON-TABLE ?auto_528719 ) ( ON ?auto_528720 ?auto_528719 ) ( ON ?auto_528721 ?auto_528720 ) ( ON ?auto_528722 ?auto_528721 ) ( not ( = ?auto_528719 ?auto_528720 ) ) ( not ( = ?auto_528719 ?auto_528721 ) ) ( not ( = ?auto_528719 ?auto_528722 ) ) ( not ( = ?auto_528719 ?auto_528723 ) ) ( not ( = ?auto_528719 ?auto_528724 ) ) ( not ( = ?auto_528719 ?auto_528725 ) ) ( not ( = ?auto_528719 ?auto_528726 ) ) ( not ( = ?auto_528719 ?auto_528727 ) ) ( not ( = ?auto_528719 ?auto_528728 ) ) ( not ( = ?auto_528720 ?auto_528721 ) ) ( not ( = ?auto_528720 ?auto_528722 ) ) ( not ( = ?auto_528720 ?auto_528723 ) ) ( not ( = ?auto_528720 ?auto_528724 ) ) ( not ( = ?auto_528720 ?auto_528725 ) ) ( not ( = ?auto_528720 ?auto_528726 ) ) ( not ( = ?auto_528720 ?auto_528727 ) ) ( not ( = ?auto_528720 ?auto_528728 ) ) ( not ( = ?auto_528721 ?auto_528722 ) ) ( not ( = ?auto_528721 ?auto_528723 ) ) ( not ( = ?auto_528721 ?auto_528724 ) ) ( not ( = ?auto_528721 ?auto_528725 ) ) ( not ( = ?auto_528721 ?auto_528726 ) ) ( not ( = ?auto_528721 ?auto_528727 ) ) ( not ( = ?auto_528721 ?auto_528728 ) ) ( not ( = ?auto_528722 ?auto_528723 ) ) ( not ( = ?auto_528722 ?auto_528724 ) ) ( not ( = ?auto_528722 ?auto_528725 ) ) ( not ( = ?auto_528722 ?auto_528726 ) ) ( not ( = ?auto_528722 ?auto_528727 ) ) ( not ( = ?auto_528722 ?auto_528728 ) ) ( not ( = ?auto_528723 ?auto_528724 ) ) ( not ( = ?auto_528723 ?auto_528725 ) ) ( not ( = ?auto_528723 ?auto_528726 ) ) ( not ( = ?auto_528723 ?auto_528727 ) ) ( not ( = ?auto_528723 ?auto_528728 ) ) ( not ( = ?auto_528724 ?auto_528725 ) ) ( not ( = ?auto_528724 ?auto_528726 ) ) ( not ( = ?auto_528724 ?auto_528727 ) ) ( not ( = ?auto_528724 ?auto_528728 ) ) ( not ( = ?auto_528725 ?auto_528726 ) ) ( not ( = ?auto_528725 ?auto_528727 ) ) ( not ( = ?auto_528725 ?auto_528728 ) ) ( not ( = ?auto_528726 ?auto_528727 ) ) ( not ( = ?auto_528726 ?auto_528728 ) ) ( not ( = ?auto_528727 ?auto_528728 ) ) ( ON ?auto_528726 ?auto_528727 ) ( ON ?auto_528725 ?auto_528726 ) ( ON ?auto_528724 ?auto_528725 ) ( CLEAR ?auto_528722 ) ( ON ?auto_528723 ?auto_528724 ) ( CLEAR ?auto_528723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_528719 ?auto_528720 ?auto_528721 ?auto_528722 ?auto_528723 )
      ( MAKE-9PILE ?auto_528719 ?auto_528720 ?auto_528721 ?auto_528722 ?auto_528723 ?auto_528724 ?auto_528725 ?auto_528726 ?auto_528727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528757 - BLOCK
      ?auto_528758 - BLOCK
      ?auto_528759 - BLOCK
      ?auto_528760 - BLOCK
      ?auto_528761 - BLOCK
      ?auto_528762 - BLOCK
      ?auto_528763 - BLOCK
      ?auto_528764 - BLOCK
      ?auto_528765 - BLOCK
    )
    :vars
    (
      ?auto_528766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528765 ?auto_528766 ) ( ON-TABLE ?auto_528757 ) ( ON ?auto_528758 ?auto_528757 ) ( ON ?auto_528759 ?auto_528758 ) ( not ( = ?auto_528757 ?auto_528758 ) ) ( not ( = ?auto_528757 ?auto_528759 ) ) ( not ( = ?auto_528757 ?auto_528760 ) ) ( not ( = ?auto_528757 ?auto_528761 ) ) ( not ( = ?auto_528757 ?auto_528762 ) ) ( not ( = ?auto_528757 ?auto_528763 ) ) ( not ( = ?auto_528757 ?auto_528764 ) ) ( not ( = ?auto_528757 ?auto_528765 ) ) ( not ( = ?auto_528757 ?auto_528766 ) ) ( not ( = ?auto_528758 ?auto_528759 ) ) ( not ( = ?auto_528758 ?auto_528760 ) ) ( not ( = ?auto_528758 ?auto_528761 ) ) ( not ( = ?auto_528758 ?auto_528762 ) ) ( not ( = ?auto_528758 ?auto_528763 ) ) ( not ( = ?auto_528758 ?auto_528764 ) ) ( not ( = ?auto_528758 ?auto_528765 ) ) ( not ( = ?auto_528758 ?auto_528766 ) ) ( not ( = ?auto_528759 ?auto_528760 ) ) ( not ( = ?auto_528759 ?auto_528761 ) ) ( not ( = ?auto_528759 ?auto_528762 ) ) ( not ( = ?auto_528759 ?auto_528763 ) ) ( not ( = ?auto_528759 ?auto_528764 ) ) ( not ( = ?auto_528759 ?auto_528765 ) ) ( not ( = ?auto_528759 ?auto_528766 ) ) ( not ( = ?auto_528760 ?auto_528761 ) ) ( not ( = ?auto_528760 ?auto_528762 ) ) ( not ( = ?auto_528760 ?auto_528763 ) ) ( not ( = ?auto_528760 ?auto_528764 ) ) ( not ( = ?auto_528760 ?auto_528765 ) ) ( not ( = ?auto_528760 ?auto_528766 ) ) ( not ( = ?auto_528761 ?auto_528762 ) ) ( not ( = ?auto_528761 ?auto_528763 ) ) ( not ( = ?auto_528761 ?auto_528764 ) ) ( not ( = ?auto_528761 ?auto_528765 ) ) ( not ( = ?auto_528761 ?auto_528766 ) ) ( not ( = ?auto_528762 ?auto_528763 ) ) ( not ( = ?auto_528762 ?auto_528764 ) ) ( not ( = ?auto_528762 ?auto_528765 ) ) ( not ( = ?auto_528762 ?auto_528766 ) ) ( not ( = ?auto_528763 ?auto_528764 ) ) ( not ( = ?auto_528763 ?auto_528765 ) ) ( not ( = ?auto_528763 ?auto_528766 ) ) ( not ( = ?auto_528764 ?auto_528765 ) ) ( not ( = ?auto_528764 ?auto_528766 ) ) ( not ( = ?auto_528765 ?auto_528766 ) ) ( ON ?auto_528764 ?auto_528765 ) ( ON ?auto_528763 ?auto_528764 ) ( ON ?auto_528762 ?auto_528763 ) ( ON ?auto_528761 ?auto_528762 ) ( CLEAR ?auto_528759 ) ( ON ?auto_528760 ?auto_528761 ) ( CLEAR ?auto_528760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_528757 ?auto_528758 ?auto_528759 ?auto_528760 )
      ( MAKE-9PILE ?auto_528757 ?auto_528758 ?auto_528759 ?auto_528760 ?auto_528761 ?auto_528762 ?auto_528763 ?auto_528764 ?auto_528765 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528795 - BLOCK
      ?auto_528796 - BLOCK
      ?auto_528797 - BLOCK
      ?auto_528798 - BLOCK
      ?auto_528799 - BLOCK
      ?auto_528800 - BLOCK
      ?auto_528801 - BLOCK
      ?auto_528802 - BLOCK
      ?auto_528803 - BLOCK
    )
    :vars
    (
      ?auto_528804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528803 ?auto_528804 ) ( ON-TABLE ?auto_528795 ) ( ON ?auto_528796 ?auto_528795 ) ( not ( = ?auto_528795 ?auto_528796 ) ) ( not ( = ?auto_528795 ?auto_528797 ) ) ( not ( = ?auto_528795 ?auto_528798 ) ) ( not ( = ?auto_528795 ?auto_528799 ) ) ( not ( = ?auto_528795 ?auto_528800 ) ) ( not ( = ?auto_528795 ?auto_528801 ) ) ( not ( = ?auto_528795 ?auto_528802 ) ) ( not ( = ?auto_528795 ?auto_528803 ) ) ( not ( = ?auto_528795 ?auto_528804 ) ) ( not ( = ?auto_528796 ?auto_528797 ) ) ( not ( = ?auto_528796 ?auto_528798 ) ) ( not ( = ?auto_528796 ?auto_528799 ) ) ( not ( = ?auto_528796 ?auto_528800 ) ) ( not ( = ?auto_528796 ?auto_528801 ) ) ( not ( = ?auto_528796 ?auto_528802 ) ) ( not ( = ?auto_528796 ?auto_528803 ) ) ( not ( = ?auto_528796 ?auto_528804 ) ) ( not ( = ?auto_528797 ?auto_528798 ) ) ( not ( = ?auto_528797 ?auto_528799 ) ) ( not ( = ?auto_528797 ?auto_528800 ) ) ( not ( = ?auto_528797 ?auto_528801 ) ) ( not ( = ?auto_528797 ?auto_528802 ) ) ( not ( = ?auto_528797 ?auto_528803 ) ) ( not ( = ?auto_528797 ?auto_528804 ) ) ( not ( = ?auto_528798 ?auto_528799 ) ) ( not ( = ?auto_528798 ?auto_528800 ) ) ( not ( = ?auto_528798 ?auto_528801 ) ) ( not ( = ?auto_528798 ?auto_528802 ) ) ( not ( = ?auto_528798 ?auto_528803 ) ) ( not ( = ?auto_528798 ?auto_528804 ) ) ( not ( = ?auto_528799 ?auto_528800 ) ) ( not ( = ?auto_528799 ?auto_528801 ) ) ( not ( = ?auto_528799 ?auto_528802 ) ) ( not ( = ?auto_528799 ?auto_528803 ) ) ( not ( = ?auto_528799 ?auto_528804 ) ) ( not ( = ?auto_528800 ?auto_528801 ) ) ( not ( = ?auto_528800 ?auto_528802 ) ) ( not ( = ?auto_528800 ?auto_528803 ) ) ( not ( = ?auto_528800 ?auto_528804 ) ) ( not ( = ?auto_528801 ?auto_528802 ) ) ( not ( = ?auto_528801 ?auto_528803 ) ) ( not ( = ?auto_528801 ?auto_528804 ) ) ( not ( = ?auto_528802 ?auto_528803 ) ) ( not ( = ?auto_528802 ?auto_528804 ) ) ( not ( = ?auto_528803 ?auto_528804 ) ) ( ON ?auto_528802 ?auto_528803 ) ( ON ?auto_528801 ?auto_528802 ) ( ON ?auto_528800 ?auto_528801 ) ( ON ?auto_528799 ?auto_528800 ) ( ON ?auto_528798 ?auto_528799 ) ( CLEAR ?auto_528796 ) ( ON ?auto_528797 ?auto_528798 ) ( CLEAR ?auto_528797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_528795 ?auto_528796 ?auto_528797 )
      ( MAKE-9PILE ?auto_528795 ?auto_528796 ?auto_528797 ?auto_528798 ?auto_528799 ?auto_528800 ?auto_528801 ?auto_528802 ?auto_528803 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528833 - BLOCK
      ?auto_528834 - BLOCK
      ?auto_528835 - BLOCK
      ?auto_528836 - BLOCK
      ?auto_528837 - BLOCK
      ?auto_528838 - BLOCK
      ?auto_528839 - BLOCK
      ?auto_528840 - BLOCK
      ?auto_528841 - BLOCK
    )
    :vars
    (
      ?auto_528842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528841 ?auto_528842 ) ( ON-TABLE ?auto_528833 ) ( not ( = ?auto_528833 ?auto_528834 ) ) ( not ( = ?auto_528833 ?auto_528835 ) ) ( not ( = ?auto_528833 ?auto_528836 ) ) ( not ( = ?auto_528833 ?auto_528837 ) ) ( not ( = ?auto_528833 ?auto_528838 ) ) ( not ( = ?auto_528833 ?auto_528839 ) ) ( not ( = ?auto_528833 ?auto_528840 ) ) ( not ( = ?auto_528833 ?auto_528841 ) ) ( not ( = ?auto_528833 ?auto_528842 ) ) ( not ( = ?auto_528834 ?auto_528835 ) ) ( not ( = ?auto_528834 ?auto_528836 ) ) ( not ( = ?auto_528834 ?auto_528837 ) ) ( not ( = ?auto_528834 ?auto_528838 ) ) ( not ( = ?auto_528834 ?auto_528839 ) ) ( not ( = ?auto_528834 ?auto_528840 ) ) ( not ( = ?auto_528834 ?auto_528841 ) ) ( not ( = ?auto_528834 ?auto_528842 ) ) ( not ( = ?auto_528835 ?auto_528836 ) ) ( not ( = ?auto_528835 ?auto_528837 ) ) ( not ( = ?auto_528835 ?auto_528838 ) ) ( not ( = ?auto_528835 ?auto_528839 ) ) ( not ( = ?auto_528835 ?auto_528840 ) ) ( not ( = ?auto_528835 ?auto_528841 ) ) ( not ( = ?auto_528835 ?auto_528842 ) ) ( not ( = ?auto_528836 ?auto_528837 ) ) ( not ( = ?auto_528836 ?auto_528838 ) ) ( not ( = ?auto_528836 ?auto_528839 ) ) ( not ( = ?auto_528836 ?auto_528840 ) ) ( not ( = ?auto_528836 ?auto_528841 ) ) ( not ( = ?auto_528836 ?auto_528842 ) ) ( not ( = ?auto_528837 ?auto_528838 ) ) ( not ( = ?auto_528837 ?auto_528839 ) ) ( not ( = ?auto_528837 ?auto_528840 ) ) ( not ( = ?auto_528837 ?auto_528841 ) ) ( not ( = ?auto_528837 ?auto_528842 ) ) ( not ( = ?auto_528838 ?auto_528839 ) ) ( not ( = ?auto_528838 ?auto_528840 ) ) ( not ( = ?auto_528838 ?auto_528841 ) ) ( not ( = ?auto_528838 ?auto_528842 ) ) ( not ( = ?auto_528839 ?auto_528840 ) ) ( not ( = ?auto_528839 ?auto_528841 ) ) ( not ( = ?auto_528839 ?auto_528842 ) ) ( not ( = ?auto_528840 ?auto_528841 ) ) ( not ( = ?auto_528840 ?auto_528842 ) ) ( not ( = ?auto_528841 ?auto_528842 ) ) ( ON ?auto_528840 ?auto_528841 ) ( ON ?auto_528839 ?auto_528840 ) ( ON ?auto_528838 ?auto_528839 ) ( ON ?auto_528837 ?auto_528838 ) ( ON ?auto_528836 ?auto_528837 ) ( ON ?auto_528835 ?auto_528836 ) ( CLEAR ?auto_528833 ) ( ON ?auto_528834 ?auto_528835 ) ( CLEAR ?auto_528834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_528833 ?auto_528834 )
      ( MAKE-9PILE ?auto_528833 ?auto_528834 ?auto_528835 ?auto_528836 ?auto_528837 ?auto_528838 ?auto_528839 ?auto_528840 ?auto_528841 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_528871 - BLOCK
      ?auto_528872 - BLOCK
      ?auto_528873 - BLOCK
      ?auto_528874 - BLOCK
      ?auto_528875 - BLOCK
      ?auto_528876 - BLOCK
      ?auto_528877 - BLOCK
      ?auto_528878 - BLOCK
      ?auto_528879 - BLOCK
    )
    :vars
    (
      ?auto_528880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528879 ?auto_528880 ) ( not ( = ?auto_528871 ?auto_528872 ) ) ( not ( = ?auto_528871 ?auto_528873 ) ) ( not ( = ?auto_528871 ?auto_528874 ) ) ( not ( = ?auto_528871 ?auto_528875 ) ) ( not ( = ?auto_528871 ?auto_528876 ) ) ( not ( = ?auto_528871 ?auto_528877 ) ) ( not ( = ?auto_528871 ?auto_528878 ) ) ( not ( = ?auto_528871 ?auto_528879 ) ) ( not ( = ?auto_528871 ?auto_528880 ) ) ( not ( = ?auto_528872 ?auto_528873 ) ) ( not ( = ?auto_528872 ?auto_528874 ) ) ( not ( = ?auto_528872 ?auto_528875 ) ) ( not ( = ?auto_528872 ?auto_528876 ) ) ( not ( = ?auto_528872 ?auto_528877 ) ) ( not ( = ?auto_528872 ?auto_528878 ) ) ( not ( = ?auto_528872 ?auto_528879 ) ) ( not ( = ?auto_528872 ?auto_528880 ) ) ( not ( = ?auto_528873 ?auto_528874 ) ) ( not ( = ?auto_528873 ?auto_528875 ) ) ( not ( = ?auto_528873 ?auto_528876 ) ) ( not ( = ?auto_528873 ?auto_528877 ) ) ( not ( = ?auto_528873 ?auto_528878 ) ) ( not ( = ?auto_528873 ?auto_528879 ) ) ( not ( = ?auto_528873 ?auto_528880 ) ) ( not ( = ?auto_528874 ?auto_528875 ) ) ( not ( = ?auto_528874 ?auto_528876 ) ) ( not ( = ?auto_528874 ?auto_528877 ) ) ( not ( = ?auto_528874 ?auto_528878 ) ) ( not ( = ?auto_528874 ?auto_528879 ) ) ( not ( = ?auto_528874 ?auto_528880 ) ) ( not ( = ?auto_528875 ?auto_528876 ) ) ( not ( = ?auto_528875 ?auto_528877 ) ) ( not ( = ?auto_528875 ?auto_528878 ) ) ( not ( = ?auto_528875 ?auto_528879 ) ) ( not ( = ?auto_528875 ?auto_528880 ) ) ( not ( = ?auto_528876 ?auto_528877 ) ) ( not ( = ?auto_528876 ?auto_528878 ) ) ( not ( = ?auto_528876 ?auto_528879 ) ) ( not ( = ?auto_528876 ?auto_528880 ) ) ( not ( = ?auto_528877 ?auto_528878 ) ) ( not ( = ?auto_528877 ?auto_528879 ) ) ( not ( = ?auto_528877 ?auto_528880 ) ) ( not ( = ?auto_528878 ?auto_528879 ) ) ( not ( = ?auto_528878 ?auto_528880 ) ) ( not ( = ?auto_528879 ?auto_528880 ) ) ( ON ?auto_528878 ?auto_528879 ) ( ON ?auto_528877 ?auto_528878 ) ( ON ?auto_528876 ?auto_528877 ) ( ON ?auto_528875 ?auto_528876 ) ( ON ?auto_528874 ?auto_528875 ) ( ON ?auto_528873 ?auto_528874 ) ( ON ?auto_528872 ?auto_528873 ) ( ON ?auto_528871 ?auto_528872 ) ( CLEAR ?auto_528871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_528871 )
      ( MAKE-9PILE ?auto_528871 ?auto_528872 ?auto_528873 ?auto_528874 ?auto_528875 ?auto_528876 ?auto_528877 ?auto_528878 ?auto_528879 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_528910 - BLOCK
      ?auto_528911 - BLOCK
      ?auto_528912 - BLOCK
      ?auto_528913 - BLOCK
      ?auto_528914 - BLOCK
      ?auto_528915 - BLOCK
      ?auto_528916 - BLOCK
      ?auto_528917 - BLOCK
      ?auto_528918 - BLOCK
      ?auto_528919 - BLOCK
    )
    :vars
    (
      ?auto_528920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_528918 ) ( ON ?auto_528919 ?auto_528920 ) ( CLEAR ?auto_528919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_528910 ) ( ON ?auto_528911 ?auto_528910 ) ( ON ?auto_528912 ?auto_528911 ) ( ON ?auto_528913 ?auto_528912 ) ( ON ?auto_528914 ?auto_528913 ) ( ON ?auto_528915 ?auto_528914 ) ( ON ?auto_528916 ?auto_528915 ) ( ON ?auto_528917 ?auto_528916 ) ( ON ?auto_528918 ?auto_528917 ) ( not ( = ?auto_528910 ?auto_528911 ) ) ( not ( = ?auto_528910 ?auto_528912 ) ) ( not ( = ?auto_528910 ?auto_528913 ) ) ( not ( = ?auto_528910 ?auto_528914 ) ) ( not ( = ?auto_528910 ?auto_528915 ) ) ( not ( = ?auto_528910 ?auto_528916 ) ) ( not ( = ?auto_528910 ?auto_528917 ) ) ( not ( = ?auto_528910 ?auto_528918 ) ) ( not ( = ?auto_528910 ?auto_528919 ) ) ( not ( = ?auto_528910 ?auto_528920 ) ) ( not ( = ?auto_528911 ?auto_528912 ) ) ( not ( = ?auto_528911 ?auto_528913 ) ) ( not ( = ?auto_528911 ?auto_528914 ) ) ( not ( = ?auto_528911 ?auto_528915 ) ) ( not ( = ?auto_528911 ?auto_528916 ) ) ( not ( = ?auto_528911 ?auto_528917 ) ) ( not ( = ?auto_528911 ?auto_528918 ) ) ( not ( = ?auto_528911 ?auto_528919 ) ) ( not ( = ?auto_528911 ?auto_528920 ) ) ( not ( = ?auto_528912 ?auto_528913 ) ) ( not ( = ?auto_528912 ?auto_528914 ) ) ( not ( = ?auto_528912 ?auto_528915 ) ) ( not ( = ?auto_528912 ?auto_528916 ) ) ( not ( = ?auto_528912 ?auto_528917 ) ) ( not ( = ?auto_528912 ?auto_528918 ) ) ( not ( = ?auto_528912 ?auto_528919 ) ) ( not ( = ?auto_528912 ?auto_528920 ) ) ( not ( = ?auto_528913 ?auto_528914 ) ) ( not ( = ?auto_528913 ?auto_528915 ) ) ( not ( = ?auto_528913 ?auto_528916 ) ) ( not ( = ?auto_528913 ?auto_528917 ) ) ( not ( = ?auto_528913 ?auto_528918 ) ) ( not ( = ?auto_528913 ?auto_528919 ) ) ( not ( = ?auto_528913 ?auto_528920 ) ) ( not ( = ?auto_528914 ?auto_528915 ) ) ( not ( = ?auto_528914 ?auto_528916 ) ) ( not ( = ?auto_528914 ?auto_528917 ) ) ( not ( = ?auto_528914 ?auto_528918 ) ) ( not ( = ?auto_528914 ?auto_528919 ) ) ( not ( = ?auto_528914 ?auto_528920 ) ) ( not ( = ?auto_528915 ?auto_528916 ) ) ( not ( = ?auto_528915 ?auto_528917 ) ) ( not ( = ?auto_528915 ?auto_528918 ) ) ( not ( = ?auto_528915 ?auto_528919 ) ) ( not ( = ?auto_528915 ?auto_528920 ) ) ( not ( = ?auto_528916 ?auto_528917 ) ) ( not ( = ?auto_528916 ?auto_528918 ) ) ( not ( = ?auto_528916 ?auto_528919 ) ) ( not ( = ?auto_528916 ?auto_528920 ) ) ( not ( = ?auto_528917 ?auto_528918 ) ) ( not ( = ?auto_528917 ?auto_528919 ) ) ( not ( = ?auto_528917 ?auto_528920 ) ) ( not ( = ?auto_528918 ?auto_528919 ) ) ( not ( = ?auto_528918 ?auto_528920 ) ) ( not ( = ?auto_528919 ?auto_528920 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_528919 ?auto_528920 )
      ( !STACK ?auto_528919 ?auto_528918 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_528952 - BLOCK
      ?auto_528953 - BLOCK
      ?auto_528954 - BLOCK
      ?auto_528955 - BLOCK
      ?auto_528956 - BLOCK
      ?auto_528957 - BLOCK
      ?auto_528958 - BLOCK
      ?auto_528959 - BLOCK
      ?auto_528960 - BLOCK
      ?auto_528961 - BLOCK
    )
    :vars
    (
      ?auto_528962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_528961 ?auto_528962 ) ( ON-TABLE ?auto_528952 ) ( ON ?auto_528953 ?auto_528952 ) ( ON ?auto_528954 ?auto_528953 ) ( ON ?auto_528955 ?auto_528954 ) ( ON ?auto_528956 ?auto_528955 ) ( ON ?auto_528957 ?auto_528956 ) ( ON ?auto_528958 ?auto_528957 ) ( ON ?auto_528959 ?auto_528958 ) ( not ( = ?auto_528952 ?auto_528953 ) ) ( not ( = ?auto_528952 ?auto_528954 ) ) ( not ( = ?auto_528952 ?auto_528955 ) ) ( not ( = ?auto_528952 ?auto_528956 ) ) ( not ( = ?auto_528952 ?auto_528957 ) ) ( not ( = ?auto_528952 ?auto_528958 ) ) ( not ( = ?auto_528952 ?auto_528959 ) ) ( not ( = ?auto_528952 ?auto_528960 ) ) ( not ( = ?auto_528952 ?auto_528961 ) ) ( not ( = ?auto_528952 ?auto_528962 ) ) ( not ( = ?auto_528953 ?auto_528954 ) ) ( not ( = ?auto_528953 ?auto_528955 ) ) ( not ( = ?auto_528953 ?auto_528956 ) ) ( not ( = ?auto_528953 ?auto_528957 ) ) ( not ( = ?auto_528953 ?auto_528958 ) ) ( not ( = ?auto_528953 ?auto_528959 ) ) ( not ( = ?auto_528953 ?auto_528960 ) ) ( not ( = ?auto_528953 ?auto_528961 ) ) ( not ( = ?auto_528953 ?auto_528962 ) ) ( not ( = ?auto_528954 ?auto_528955 ) ) ( not ( = ?auto_528954 ?auto_528956 ) ) ( not ( = ?auto_528954 ?auto_528957 ) ) ( not ( = ?auto_528954 ?auto_528958 ) ) ( not ( = ?auto_528954 ?auto_528959 ) ) ( not ( = ?auto_528954 ?auto_528960 ) ) ( not ( = ?auto_528954 ?auto_528961 ) ) ( not ( = ?auto_528954 ?auto_528962 ) ) ( not ( = ?auto_528955 ?auto_528956 ) ) ( not ( = ?auto_528955 ?auto_528957 ) ) ( not ( = ?auto_528955 ?auto_528958 ) ) ( not ( = ?auto_528955 ?auto_528959 ) ) ( not ( = ?auto_528955 ?auto_528960 ) ) ( not ( = ?auto_528955 ?auto_528961 ) ) ( not ( = ?auto_528955 ?auto_528962 ) ) ( not ( = ?auto_528956 ?auto_528957 ) ) ( not ( = ?auto_528956 ?auto_528958 ) ) ( not ( = ?auto_528956 ?auto_528959 ) ) ( not ( = ?auto_528956 ?auto_528960 ) ) ( not ( = ?auto_528956 ?auto_528961 ) ) ( not ( = ?auto_528956 ?auto_528962 ) ) ( not ( = ?auto_528957 ?auto_528958 ) ) ( not ( = ?auto_528957 ?auto_528959 ) ) ( not ( = ?auto_528957 ?auto_528960 ) ) ( not ( = ?auto_528957 ?auto_528961 ) ) ( not ( = ?auto_528957 ?auto_528962 ) ) ( not ( = ?auto_528958 ?auto_528959 ) ) ( not ( = ?auto_528958 ?auto_528960 ) ) ( not ( = ?auto_528958 ?auto_528961 ) ) ( not ( = ?auto_528958 ?auto_528962 ) ) ( not ( = ?auto_528959 ?auto_528960 ) ) ( not ( = ?auto_528959 ?auto_528961 ) ) ( not ( = ?auto_528959 ?auto_528962 ) ) ( not ( = ?auto_528960 ?auto_528961 ) ) ( not ( = ?auto_528960 ?auto_528962 ) ) ( not ( = ?auto_528961 ?auto_528962 ) ) ( CLEAR ?auto_528959 ) ( ON ?auto_528960 ?auto_528961 ) ( CLEAR ?auto_528960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_528952 ?auto_528953 ?auto_528954 ?auto_528955 ?auto_528956 ?auto_528957 ?auto_528958 ?auto_528959 ?auto_528960 )
      ( MAKE-10PILE ?auto_528952 ?auto_528953 ?auto_528954 ?auto_528955 ?auto_528956 ?auto_528957 ?auto_528958 ?auto_528959 ?auto_528960 ?auto_528961 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_528994 - BLOCK
      ?auto_528995 - BLOCK
      ?auto_528996 - BLOCK
      ?auto_528997 - BLOCK
      ?auto_528998 - BLOCK
      ?auto_528999 - BLOCK
      ?auto_529000 - BLOCK
      ?auto_529001 - BLOCK
      ?auto_529002 - BLOCK
      ?auto_529003 - BLOCK
    )
    :vars
    (
      ?auto_529004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529003 ?auto_529004 ) ( ON-TABLE ?auto_528994 ) ( ON ?auto_528995 ?auto_528994 ) ( ON ?auto_528996 ?auto_528995 ) ( ON ?auto_528997 ?auto_528996 ) ( ON ?auto_528998 ?auto_528997 ) ( ON ?auto_528999 ?auto_528998 ) ( ON ?auto_529000 ?auto_528999 ) ( not ( = ?auto_528994 ?auto_528995 ) ) ( not ( = ?auto_528994 ?auto_528996 ) ) ( not ( = ?auto_528994 ?auto_528997 ) ) ( not ( = ?auto_528994 ?auto_528998 ) ) ( not ( = ?auto_528994 ?auto_528999 ) ) ( not ( = ?auto_528994 ?auto_529000 ) ) ( not ( = ?auto_528994 ?auto_529001 ) ) ( not ( = ?auto_528994 ?auto_529002 ) ) ( not ( = ?auto_528994 ?auto_529003 ) ) ( not ( = ?auto_528994 ?auto_529004 ) ) ( not ( = ?auto_528995 ?auto_528996 ) ) ( not ( = ?auto_528995 ?auto_528997 ) ) ( not ( = ?auto_528995 ?auto_528998 ) ) ( not ( = ?auto_528995 ?auto_528999 ) ) ( not ( = ?auto_528995 ?auto_529000 ) ) ( not ( = ?auto_528995 ?auto_529001 ) ) ( not ( = ?auto_528995 ?auto_529002 ) ) ( not ( = ?auto_528995 ?auto_529003 ) ) ( not ( = ?auto_528995 ?auto_529004 ) ) ( not ( = ?auto_528996 ?auto_528997 ) ) ( not ( = ?auto_528996 ?auto_528998 ) ) ( not ( = ?auto_528996 ?auto_528999 ) ) ( not ( = ?auto_528996 ?auto_529000 ) ) ( not ( = ?auto_528996 ?auto_529001 ) ) ( not ( = ?auto_528996 ?auto_529002 ) ) ( not ( = ?auto_528996 ?auto_529003 ) ) ( not ( = ?auto_528996 ?auto_529004 ) ) ( not ( = ?auto_528997 ?auto_528998 ) ) ( not ( = ?auto_528997 ?auto_528999 ) ) ( not ( = ?auto_528997 ?auto_529000 ) ) ( not ( = ?auto_528997 ?auto_529001 ) ) ( not ( = ?auto_528997 ?auto_529002 ) ) ( not ( = ?auto_528997 ?auto_529003 ) ) ( not ( = ?auto_528997 ?auto_529004 ) ) ( not ( = ?auto_528998 ?auto_528999 ) ) ( not ( = ?auto_528998 ?auto_529000 ) ) ( not ( = ?auto_528998 ?auto_529001 ) ) ( not ( = ?auto_528998 ?auto_529002 ) ) ( not ( = ?auto_528998 ?auto_529003 ) ) ( not ( = ?auto_528998 ?auto_529004 ) ) ( not ( = ?auto_528999 ?auto_529000 ) ) ( not ( = ?auto_528999 ?auto_529001 ) ) ( not ( = ?auto_528999 ?auto_529002 ) ) ( not ( = ?auto_528999 ?auto_529003 ) ) ( not ( = ?auto_528999 ?auto_529004 ) ) ( not ( = ?auto_529000 ?auto_529001 ) ) ( not ( = ?auto_529000 ?auto_529002 ) ) ( not ( = ?auto_529000 ?auto_529003 ) ) ( not ( = ?auto_529000 ?auto_529004 ) ) ( not ( = ?auto_529001 ?auto_529002 ) ) ( not ( = ?auto_529001 ?auto_529003 ) ) ( not ( = ?auto_529001 ?auto_529004 ) ) ( not ( = ?auto_529002 ?auto_529003 ) ) ( not ( = ?auto_529002 ?auto_529004 ) ) ( not ( = ?auto_529003 ?auto_529004 ) ) ( ON ?auto_529002 ?auto_529003 ) ( CLEAR ?auto_529000 ) ( ON ?auto_529001 ?auto_529002 ) ( CLEAR ?auto_529001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_528994 ?auto_528995 ?auto_528996 ?auto_528997 ?auto_528998 ?auto_528999 ?auto_529000 ?auto_529001 )
      ( MAKE-10PILE ?auto_528994 ?auto_528995 ?auto_528996 ?auto_528997 ?auto_528998 ?auto_528999 ?auto_529000 ?auto_529001 ?auto_529002 ?auto_529003 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529036 - BLOCK
      ?auto_529037 - BLOCK
      ?auto_529038 - BLOCK
      ?auto_529039 - BLOCK
      ?auto_529040 - BLOCK
      ?auto_529041 - BLOCK
      ?auto_529042 - BLOCK
      ?auto_529043 - BLOCK
      ?auto_529044 - BLOCK
      ?auto_529045 - BLOCK
    )
    :vars
    (
      ?auto_529046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529045 ?auto_529046 ) ( ON-TABLE ?auto_529036 ) ( ON ?auto_529037 ?auto_529036 ) ( ON ?auto_529038 ?auto_529037 ) ( ON ?auto_529039 ?auto_529038 ) ( ON ?auto_529040 ?auto_529039 ) ( ON ?auto_529041 ?auto_529040 ) ( not ( = ?auto_529036 ?auto_529037 ) ) ( not ( = ?auto_529036 ?auto_529038 ) ) ( not ( = ?auto_529036 ?auto_529039 ) ) ( not ( = ?auto_529036 ?auto_529040 ) ) ( not ( = ?auto_529036 ?auto_529041 ) ) ( not ( = ?auto_529036 ?auto_529042 ) ) ( not ( = ?auto_529036 ?auto_529043 ) ) ( not ( = ?auto_529036 ?auto_529044 ) ) ( not ( = ?auto_529036 ?auto_529045 ) ) ( not ( = ?auto_529036 ?auto_529046 ) ) ( not ( = ?auto_529037 ?auto_529038 ) ) ( not ( = ?auto_529037 ?auto_529039 ) ) ( not ( = ?auto_529037 ?auto_529040 ) ) ( not ( = ?auto_529037 ?auto_529041 ) ) ( not ( = ?auto_529037 ?auto_529042 ) ) ( not ( = ?auto_529037 ?auto_529043 ) ) ( not ( = ?auto_529037 ?auto_529044 ) ) ( not ( = ?auto_529037 ?auto_529045 ) ) ( not ( = ?auto_529037 ?auto_529046 ) ) ( not ( = ?auto_529038 ?auto_529039 ) ) ( not ( = ?auto_529038 ?auto_529040 ) ) ( not ( = ?auto_529038 ?auto_529041 ) ) ( not ( = ?auto_529038 ?auto_529042 ) ) ( not ( = ?auto_529038 ?auto_529043 ) ) ( not ( = ?auto_529038 ?auto_529044 ) ) ( not ( = ?auto_529038 ?auto_529045 ) ) ( not ( = ?auto_529038 ?auto_529046 ) ) ( not ( = ?auto_529039 ?auto_529040 ) ) ( not ( = ?auto_529039 ?auto_529041 ) ) ( not ( = ?auto_529039 ?auto_529042 ) ) ( not ( = ?auto_529039 ?auto_529043 ) ) ( not ( = ?auto_529039 ?auto_529044 ) ) ( not ( = ?auto_529039 ?auto_529045 ) ) ( not ( = ?auto_529039 ?auto_529046 ) ) ( not ( = ?auto_529040 ?auto_529041 ) ) ( not ( = ?auto_529040 ?auto_529042 ) ) ( not ( = ?auto_529040 ?auto_529043 ) ) ( not ( = ?auto_529040 ?auto_529044 ) ) ( not ( = ?auto_529040 ?auto_529045 ) ) ( not ( = ?auto_529040 ?auto_529046 ) ) ( not ( = ?auto_529041 ?auto_529042 ) ) ( not ( = ?auto_529041 ?auto_529043 ) ) ( not ( = ?auto_529041 ?auto_529044 ) ) ( not ( = ?auto_529041 ?auto_529045 ) ) ( not ( = ?auto_529041 ?auto_529046 ) ) ( not ( = ?auto_529042 ?auto_529043 ) ) ( not ( = ?auto_529042 ?auto_529044 ) ) ( not ( = ?auto_529042 ?auto_529045 ) ) ( not ( = ?auto_529042 ?auto_529046 ) ) ( not ( = ?auto_529043 ?auto_529044 ) ) ( not ( = ?auto_529043 ?auto_529045 ) ) ( not ( = ?auto_529043 ?auto_529046 ) ) ( not ( = ?auto_529044 ?auto_529045 ) ) ( not ( = ?auto_529044 ?auto_529046 ) ) ( not ( = ?auto_529045 ?auto_529046 ) ) ( ON ?auto_529044 ?auto_529045 ) ( ON ?auto_529043 ?auto_529044 ) ( CLEAR ?auto_529041 ) ( ON ?auto_529042 ?auto_529043 ) ( CLEAR ?auto_529042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_529036 ?auto_529037 ?auto_529038 ?auto_529039 ?auto_529040 ?auto_529041 ?auto_529042 )
      ( MAKE-10PILE ?auto_529036 ?auto_529037 ?auto_529038 ?auto_529039 ?auto_529040 ?auto_529041 ?auto_529042 ?auto_529043 ?auto_529044 ?auto_529045 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529078 - BLOCK
      ?auto_529079 - BLOCK
      ?auto_529080 - BLOCK
      ?auto_529081 - BLOCK
      ?auto_529082 - BLOCK
      ?auto_529083 - BLOCK
      ?auto_529084 - BLOCK
      ?auto_529085 - BLOCK
      ?auto_529086 - BLOCK
      ?auto_529087 - BLOCK
    )
    :vars
    (
      ?auto_529088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529087 ?auto_529088 ) ( ON-TABLE ?auto_529078 ) ( ON ?auto_529079 ?auto_529078 ) ( ON ?auto_529080 ?auto_529079 ) ( ON ?auto_529081 ?auto_529080 ) ( ON ?auto_529082 ?auto_529081 ) ( not ( = ?auto_529078 ?auto_529079 ) ) ( not ( = ?auto_529078 ?auto_529080 ) ) ( not ( = ?auto_529078 ?auto_529081 ) ) ( not ( = ?auto_529078 ?auto_529082 ) ) ( not ( = ?auto_529078 ?auto_529083 ) ) ( not ( = ?auto_529078 ?auto_529084 ) ) ( not ( = ?auto_529078 ?auto_529085 ) ) ( not ( = ?auto_529078 ?auto_529086 ) ) ( not ( = ?auto_529078 ?auto_529087 ) ) ( not ( = ?auto_529078 ?auto_529088 ) ) ( not ( = ?auto_529079 ?auto_529080 ) ) ( not ( = ?auto_529079 ?auto_529081 ) ) ( not ( = ?auto_529079 ?auto_529082 ) ) ( not ( = ?auto_529079 ?auto_529083 ) ) ( not ( = ?auto_529079 ?auto_529084 ) ) ( not ( = ?auto_529079 ?auto_529085 ) ) ( not ( = ?auto_529079 ?auto_529086 ) ) ( not ( = ?auto_529079 ?auto_529087 ) ) ( not ( = ?auto_529079 ?auto_529088 ) ) ( not ( = ?auto_529080 ?auto_529081 ) ) ( not ( = ?auto_529080 ?auto_529082 ) ) ( not ( = ?auto_529080 ?auto_529083 ) ) ( not ( = ?auto_529080 ?auto_529084 ) ) ( not ( = ?auto_529080 ?auto_529085 ) ) ( not ( = ?auto_529080 ?auto_529086 ) ) ( not ( = ?auto_529080 ?auto_529087 ) ) ( not ( = ?auto_529080 ?auto_529088 ) ) ( not ( = ?auto_529081 ?auto_529082 ) ) ( not ( = ?auto_529081 ?auto_529083 ) ) ( not ( = ?auto_529081 ?auto_529084 ) ) ( not ( = ?auto_529081 ?auto_529085 ) ) ( not ( = ?auto_529081 ?auto_529086 ) ) ( not ( = ?auto_529081 ?auto_529087 ) ) ( not ( = ?auto_529081 ?auto_529088 ) ) ( not ( = ?auto_529082 ?auto_529083 ) ) ( not ( = ?auto_529082 ?auto_529084 ) ) ( not ( = ?auto_529082 ?auto_529085 ) ) ( not ( = ?auto_529082 ?auto_529086 ) ) ( not ( = ?auto_529082 ?auto_529087 ) ) ( not ( = ?auto_529082 ?auto_529088 ) ) ( not ( = ?auto_529083 ?auto_529084 ) ) ( not ( = ?auto_529083 ?auto_529085 ) ) ( not ( = ?auto_529083 ?auto_529086 ) ) ( not ( = ?auto_529083 ?auto_529087 ) ) ( not ( = ?auto_529083 ?auto_529088 ) ) ( not ( = ?auto_529084 ?auto_529085 ) ) ( not ( = ?auto_529084 ?auto_529086 ) ) ( not ( = ?auto_529084 ?auto_529087 ) ) ( not ( = ?auto_529084 ?auto_529088 ) ) ( not ( = ?auto_529085 ?auto_529086 ) ) ( not ( = ?auto_529085 ?auto_529087 ) ) ( not ( = ?auto_529085 ?auto_529088 ) ) ( not ( = ?auto_529086 ?auto_529087 ) ) ( not ( = ?auto_529086 ?auto_529088 ) ) ( not ( = ?auto_529087 ?auto_529088 ) ) ( ON ?auto_529086 ?auto_529087 ) ( ON ?auto_529085 ?auto_529086 ) ( ON ?auto_529084 ?auto_529085 ) ( CLEAR ?auto_529082 ) ( ON ?auto_529083 ?auto_529084 ) ( CLEAR ?auto_529083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_529078 ?auto_529079 ?auto_529080 ?auto_529081 ?auto_529082 ?auto_529083 )
      ( MAKE-10PILE ?auto_529078 ?auto_529079 ?auto_529080 ?auto_529081 ?auto_529082 ?auto_529083 ?auto_529084 ?auto_529085 ?auto_529086 ?auto_529087 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529120 - BLOCK
      ?auto_529121 - BLOCK
      ?auto_529122 - BLOCK
      ?auto_529123 - BLOCK
      ?auto_529124 - BLOCK
      ?auto_529125 - BLOCK
      ?auto_529126 - BLOCK
      ?auto_529127 - BLOCK
      ?auto_529128 - BLOCK
      ?auto_529129 - BLOCK
    )
    :vars
    (
      ?auto_529130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529129 ?auto_529130 ) ( ON-TABLE ?auto_529120 ) ( ON ?auto_529121 ?auto_529120 ) ( ON ?auto_529122 ?auto_529121 ) ( ON ?auto_529123 ?auto_529122 ) ( not ( = ?auto_529120 ?auto_529121 ) ) ( not ( = ?auto_529120 ?auto_529122 ) ) ( not ( = ?auto_529120 ?auto_529123 ) ) ( not ( = ?auto_529120 ?auto_529124 ) ) ( not ( = ?auto_529120 ?auto_529125 ) ) ( not ( = ?auto_529120 ?auto_529126 ) ) ( not ( = ?auto_529120 ?auto_529127 ) ) ( not ( = ?auto_529120 ?auto_529128 ) ) ( not ( = ?auto_529120 ?auto_529129 ) ) ( not ( = ?auto_529120 ?auto_529130 ) ) ( not ( = ?auto_529121 ?auto_529122 ) ) ( not ( = ?auto_529121 ?auto_529123 ) ) ( not ( = ?auto_529121 ?auto_529124 ) ) ( not ( = ?auto_529121 ?auto_529125 ) ) ( not ( = ?auto_529121 ?auto_529126 ) ) ( not ( = ?auto_529121 ?auto_529127 ) ) ( not ( = ?auto_529121 ?auto_529128 ) ) ( not ( = ?auto_529121 ?auto_529129 ) ) ( not ( = ?auto_529121 ?auto_529130 ) ) ( not ( = ?auto_529122 ?auto_529123 ) ) ( not ( = ?auto_529122 ?auto_529124 ) ) ( not ( = ?auto_529122 ?auto_529125 ) ) ( not ( = ?auto_529122 ?auto_529126 ) ) ( not ( = ?auto_529122 ?auto_529127 ) ) ( not ( = ?auto_529122 ?auto_529128 ) ) ( not ( = ?auto_529122 ?auto_529129 ) ) ( not ( = ?auto_529122 ?auto_529130 ) ) ( not ( = ?auto_529123 ?auto_529124 ) ) ( not ( = ?auto_529123 ?auto_529125 ) ) ( not ( = ?auto_529123 ?auto_529126 ) ) ( not ( = ?auto_529123 ?auto_529127 ) ) ( not ( = ?auto_529123 ?auto_529128 ) ) ( not ( = ?auto_529123 ?auto_529129 ) ) ( not ( = ?auto_529123 ?auto_529130 ) ) ( not ( = ?auto_529124 ?auto_529125 ) ) ( not ( = ?auto_529124 ?auto_529126 ) ) ( not ( = ?auto_529124 ?auto_529127 ) ) ( not ( = ?auto_529124 ?auto_529128 ) ) ( not ( = ?auto_529124 ?auto_529129 ) ) ( not ( = ?auto_529124 ?auto_529130 ) ) ( not ( = ?auto_529125 ?auto_529126 ) ) ( not ( = ?auto_529125 ?auto_529127 ) ) ( not ( = ?auto_529125 ?auto_529128 ) ) ( not ( = ?auto_529125 ?auto_529129 ) ) ( not ( = ?auto_529125 ?auto_529130 ) ) ( not ( = ?auto_529126 ?auto_529127 ) ) ( not ( = ?auto_529126 ?auto_529128 ) ) ( not ( = ?auto_529126 ?auto_529129 ) ) ( not ( = ?auto_529126 ?auto_529130 ) ) ( not ( = ?auto_529127 ?auto_529128 ) ) ( not ( = ?auto_529127 ?auto_529129 ) ) ( not ( = ?auto_529127 ?auto_529130 ) ) ( not ( = ?auto_529128 ?auto_529129 ) ) ( not ( = ?auto_529128 ?auto_529130 ) ) ( not ( = ?auto_529129 ?auto_529130 ) ) ( ON ?auto_529128 ?auto_529129 ) ( ON ?auto_529127 ?auto_529128 ) ( ON ?auto_529126 ?auto_529127 ) ( ON ?auto_529125 ?auto_529126 ) ( CLEAR ?auto_529123 ) ( ON ?auto_529124 ?auto_529125 ) ( CLEAR ?auto_529124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_529120 ?auto_529121 ?auto_529122 ?auto_529123 ?auto_529124 )
      ( MAKE-10PILE ?auto_529120 ?auto_529121 ?auto_529122 ?auto_529123 ?auto_529124 ?auto_529125 ?auto_529126 ?auto_529127 ?auto_529128 ?auto_529129 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529162 - BLOCK
      ?auto_529163 - BLOCK
      ?auto_529164 - BLOCK
      ?auto_529165 - BLOCK
      ?auto_529166 - BLOCK
      ?auto_529167 - BLOCK
      ?auto_529168 - BLOCK
      ?auto_529169 - BLOCK
      ?auto_529170 - BLOCK
      ?auto_529171 - BLOCK
    )
    :vars
    (
      ?auto_529172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529171 ?auto_529172 ) ( ON-TABLE ?auto_529162 ) ( ON ?auto_529163 ?auto_529162 ) ( ON ?auto_529164 ?auto_529163 ) ( not ( = ?auto_529162 ?auto_529163 ) ) ( not ( = ?auto_529162 ?auto_529164 ) ) ( not ( = ?auto_529162 ?auto_529165 ) ) ( not ( = ?auto_529162 ?auto_529166 ) ) ( not ( = ?auto_529162 ?auto_529167 ) ) ( not ( = ?auto_529162 ?auto_529168 ) ) ( not ( = ?auto_529162 ?auto_529169 ) ) ( not ( = ?auto_529162 ?auto_529170 ) ) ( not ( = ?auto_529162 ?auto_529171 ) ) ( not ( = ?auto_529162 ?auto_529172 ) ) ( not ( = ?auto_529163 ?auto_529164 ) ) ( not ( = ?auto_529163 ?auto_529165 ) ) ( not ( = ?auto_529163 ?auto_529166 ) ) ( not ( = ?auto_529163 ?auto_529167 ) ) ( not ( = ?auto_529163 ?auto_529168 ) ) ( not ( = ?auto_529163 ?auto_529169 ) ) ( not ( = ?auto_529163 ?auto_529170 ) ) ( not ( = ?auto_529163 ?auto_529171 ) ) ( not ( = ?auto_529163 ?auto_529172 ) ) ( not ( = ?auto_529164 ?auto_529165 ) ) ( not ( = ?auto_529164 ?auto_529166 ) ) ( not ( = ?auto_529164 ?auto_529167 ) ) ( not ( = ?auto_529164 ?auto_529168 ) ) ( not ( = ?auto_529164 ?auto_529169 ) ) ( not ( = ?auto_529164 ?auto_529170 ) ) ( not ( = ?auto_529164 ?auto_529171 ) ) ( not ( = ?auto_529164 ?auto_529172 ) ) ( not ( = ?auto_529165 ?auto_529166 ) ) ( not ( = ?auto_529165 ?auto_529167 ) ) ( not ( = ?auto_529165 ?auto_529168 ) ) ( not ( = ?auto_529165 ?auto_529169 ) ) ( not ( = ?auto_529165 ?auto_529170 ) ) ( not ( = ?auto_529165 ?auto_529171 ) ) ( not ( = ?auto_529165 ?auto_529172 ) ) ( not ( = ?auto_529166 ?auto_529167 ) ) ( not ( = ?auto_529166 ?auto_529168 ) ) ( not ( = ?auto_529166 ?auto_529169 ) ) ( not ( = ?auto_529166 ?auto_529170 ) ) ( not ( = ?auto_529166 ?auto_529171 ) ) ( not ( = ?auto_529166 ?auto_529172 ) ) ( not ( = ?auto_529167 ?auto_529168 ) ) ( not ( = ?auto_529167 ?auto_529169 ) ) ( not ( = ?auto_529167 ?auto_529170 ) ) ( not ( = ?auto_529167 ?auto_529171 ) ) ( not ( = ?auto_529167 ?auto_529172 ) ) ( not ( = ?auto_529168 ?auto_529169 ) ) ( not ( = ?auto_529168 ?auto_529170 ) ) ( not ( = ?auto_529168 ?auto_529171 ) ) ( not ( = ?auto_529168 ?auto_529172 ) ) ( not ( = ?auto_529169 ?auto_529170 ) ) ( not ( = ?auto_529169 ?auto_529171 ) ) ( not ( = ?auto_529169 ?auto_529172 ) ) ( not ( = ?auto_529170 ?auto_529171 ) ) ( not ( = ?auto_529170 ?auto_529172 ) ) ( not ( = ?auto_529171 ?auto_529172 ) ) ( ON ?auto_529170 ?auto_529171 ) ( ON ?auto_529169 ?auto_529170 ) ( ON ?auto_529168 ?auto_529169 ) ( ON ?auto_529167 ?auto_529168 ) ( ON ?auto_529166 ?auto_529167 ) ( CLEAR ?auto_529164 ) ( ON ?auto_529165 ?auto_529166 ) ( CLEAR ?auto_529165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_529162 ?auto_529163 ?auto_529164 ?auto_529165 )
      ( MAKE-10PILE ?auto_529162 ?auto_529163 ?auto_529164 ?auto_529165 ?auto_529166 ?auto_529167 ?auto_529168 ?auto_529169 ?auto_529170 ?auto_529171 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529204 - BLOCK
      ?auto_529205 - BLOCK
      ?auto_529206 - BLOCK
      ?auto_529207 - BLOCK
      ?auto_529208 - BLOCK
      ?auto_529209 - BLOCK
      ?auto_529210 - BLOCK
      ?auto_529211 - BLOCK
      ?auto_529212 - BLOCK
      ?auto_529213 - BLOCK
    )
    :vars
    (
      ?auto_529214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529213 ?auto_529214 ) ( ON-TABLE ?auto_529204 ) ( ON ?auto_529205 ?auto_529204 ) ( not ( = ?auto_529204 ?auto_529205 ) ) ( not ( = ?auto_529204 ?auto_529206 ) ) ( not ( = ?auto_529204 ?auto_529207 ) ) ( not ( = ?auto_529204 ?auto_529208 ) ) ( not ( = ?auto_529204 ?auto_529209 ) ) ( not ( = ?auto_529204 ?auto_529210 ) ) ( not ( = ?auto_529204 ?auto_529211 ) ) ( not ( = ?auto_529204 ?auto_529212 ) ) ( not ( = ?auto_529204 ?auto_529213 ) ) ( not ( = ?auto_529204 ?auto_529214 ) ) ( not ( = ?auto_529205 ?auto_529206 ) ) ( not ( = ?auto_529205 ?auto_529207 ) ) ( not ( = ?auto_529205 ?auto_529208 ) ) ( not ( = ?auto_529205 ?auto_529209 ) ) ( not ( = ?auto_529205 ?auto_529210 ) ) ( not ( = ?auto_529205 ?auto_529211 ) ) ( not ( = ?auto_529205 ?auto_529212 ) ) ( not ( = ?auto_529205 ?auto_529213 ) ) ( not ( = ?auto_529205 ?auto_529214 ) ) ( not ( = ?auto_529206 ?auto_529207 ) ) ( not ( = ?auto_529206 ?auto_529208 ) ) ( not ( = ?auto_529206 ?auto_529209 ) ) ( not ( = ?auto_529206 ?auto_529210 ) ) ( not ( = ?auto_529206 ?auto_529211 ) ) ( not ( = ?auto_529206 ?auto_529212 ) ) ( not ( = ?auto_529206 ?auto_529213 ) ) ( not ( = ?auto_529206 ?auto_529214 ) ) ( not ( = ?auto_529207 ?auto_529208 ) ) ( not ( = ?auto_529207 ?auto_529209 ) ) ( not ( = ?auto_529207 ?auto_529210 ) ) ( not ( = ?auto_529207 ?auto_529211 ) ) ( not ( = ?auto_529207 ?auto_529212 ) ) ( not ( = ?auto_529207 ?auto_529213 ) ) ( not ( = ?auto_529207 ?auto_529214 ) ) ( not ( = ?auto_529208 ?auto_529209 ) ) ( not ( = ?auto_529208 ?auto_529210 ) ) ( not ( = ?auto_529208 ?auto_529211 ) ) ( not ( = ?auto_529208 ?auto_529212 ) ) ( not ( = ?auto_529208 ?auto_529213 ) ) ( not ( = ?auto_529208 ?auto_529214 ) ) ( not ( = ?auto_529209 ?auto_529210 ) ) ( not ( = ?auto_529209 ?auto_529211 ) ) ( not ( = ?auto_529209 ?auto_529212 ) ) ( not ( = ?auto_529209 ?auto_529213 ) ) ( not ( = ?auto_529209 ?auto_529214 ) ) ( not ( = ?auto_529210 ?auto_529211 ) ) ( not ( = ?auto_529210 ?auto_529212 ) ) ( not ( = ?auto_529210 ?auto_529213 ) ) ( not ( = ?auto_529210 ?auto_529214 ) ) ( not ( = ?auto_529211 ?auto_529212 ) ) ( not ( = ?auto_529211 ?auto_529213 ) ) ( not ( = ?auto_529211 ?auto_529214 ) ) ( not ( = ?auto_529212 ?auto_529213 ) ) ( not ( = ?auto_529212 ?auto_529214 ) ) ( not ( = ?auto_529213 ?auto_529214 ) ) ( ON ?auto_529212 ?auto_529213 ) ( ON ?auto_529211 ?auto_529212 ) ( ON ?auto_529210 ?auto_529211 ) ( ON ?auto_529209 ?auto_529210 ) ( ON ?auto_529208 ?auto_529209 ) ( ON ?auto_529207 ?auto_529208 ) ( CLEAR ?auto_529205 ) ( ON ?auto_529206 ?auto_529207 ) ( CLEAR ?auto_529206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_529204 ?auto_529205 ?auto_529206 )
      ( MAKE-10PILE ?auto_529204 ?auto_529205 ?auto_529206 ?auto_529207 ?auto_529208 ?auto_529209 ?auto_529210 ?auto_529211 ?auto_529212 ?auto_529213 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529246 - BLOCK
      ?auto_529247 - BLOCK
      ?auto_529248 - BLOCK
      ?auto_529249 - BLOCK
      ?auto_529250 - BLOCK
      ?auto_529251 - BLOCK
      ?auto_529252 - BLOCK
      ?auto_529253 - BLOCK
      ?auto_529254 - BLOCK
      ?auto_529255 - BLOCK
    )
    :vars
    (
      ?auto_529256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529255 ?auto_529256 ) ( ON-TABLE ?auto_529246 ) ( not ( = ?auto_529246 ?auto_529247 ) ) ( not ( = ?auto_529246 ?auto_529248 ) ) ( not ( = ?auto_529246 ?auto_529249 ) ) ( not ( = ?auto_529246 ?auto_529250 ) ) ( not ( = ?auto_529246 ?auto_529251 ) ) ( not ( = ?auto_529246 ?auto_529252 ) ) ( not ( = ?auto_529246 ?auto_529253 ) ) ( not ( = ?auto_529246 ?auto_529254 ) ) ( not ( = ?auto_529246 ?auto_529255 ) ) ( not ( = ?auto_529246 ?auto_529256 ) ) ( not ( = ?auto_529247 ?auto_529248 ) ) ( not ( = ?auto_529247 ?auto_529249 ) ) ( not ( = ?auto_529247 ?auto_529250 ) ) ( not ( = ?auto_529247 ?auto_529251 ) ) ( not ( = ?auto_529247 ?auto_529252 ) ) ( not ( = ?auto_529247 ?auto_529253 ) ) ( not ( = ?auto_529247 ?auto_529254 ) ) ( not ( = ?auto_529247 ?auto_529255 ) ) ( not ( = ?auto_529247 ?auto_529256 ) ) ( not ( = ?auto_529248 ?auto_529249 ) ) ( not ( = ?auto_529248 ?auto_529250 ) ) ( not ( = ?auto_529248 ?auto_529251 ) ) ( not ( = ?auto_529248 ?auto_529252 ) ) ( not ( = ?auto_529248 ?auto_529253 ) ) ( not ( = ?auto_529248 ?auto_529254 ) ) ( not ( = ?auto_529248 ?auto_529255 ) ) ( not ( = ?auto_529248 ?auto_529256 ) ) ( not ( = ?auto_529249 ?auto_529250 ) ) ( not ( = ?auto_529249 ?auto_529251 ) ) ( not ( = ?auto_529249 ?auto_529252 ) ) ( not ( = ?auto_529249 ?auto_529253 ) ) ( not ( = ?auto_529249 ?auto_529254 ) ) ( not ( = ?auto_529249 ?auto_529255 ) ) ( not ( = ?auto_529249 ?auto_529256 ) ) ( not ( = ?auto_529250 ?auto_529251 ) ) ( not ( = ?auto_529250 ?auto_529252 ) ) ( not ( = ?auto_529250 ?auto_529253 ) ) ( not ( = ?auto_529250 ?auto_529254 ) ) ( not ( = ?auto_529250 ?auto_529255 ) ) ( not ( = ?auto_529250 ?auto_529256 ) ) ( not ( = ?auto_529251 ?auto_529252 ) ) ( not ( = ?auto_529251 ?auto_529253 ) ) ( not ( = ?auto_529251 ?auto_529254 ) ) ( not ( = ?auto_529251 ?auto_529255 ) ) ( not ( = ?auto_529251 ?auto_529256 ) ) ( not ( = ?auto_529252 ?auto_529253 ) ) ( not ( = ?auto_529252 ?auto_529254 ) ) ( not ( = ?auto_529252 ?auto_529255 ) ) ( not ( = ?auto_529252 ?auto_529256 ) ) ( not ( = ?auto_529253 ?auto_529254 ) ) ( not ( = ?auto_529253 ?auto_529255 ) ) ( not ( = ?auto_529253 ?auto_529256 ) ) ( not ( = ?auto_529254 ?auto_529255 ) ) ( not ( = ?auto_529254 ?auto_529256 ) ) ( not ( = ?auto_529255 ?auto_529256 ) ) ( ON ?auto_529254 ?auto_529255 ) ( ON ?auto_529253 ?auto_529254 ) ( ON ?auto_529252 ?auto_529253 ) ( ON ?auto_529251 ?auto_529252 ) ( ON ?auto_529250 ?auto_529251 ) ( ON ?auto_529249 ?auto_529250 ) ( ON ?auto_529248 ?auto_529249 ) ( CLEAR ?auto_529246 ) ( ON ?auto_529247 ?auto_529248 ) ( CLEAR ?auto_529247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_529246 ?auto_529247 )
      ( MAKE-10PILE ?auto_529246 ?auto_529247 ?auto_529248 ?auto_529249 ?auto_529250 ?auto_529251 ?auto_529252 ?auto_529253 ?auto_529254 ?auto_529255 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_529288 - BLOCK
      ?auto_529289 - BLOCK
      ?auto_529290 - BLOCK
      ?auto_529291 - BLOCK
      ?auto_529292 - BLOCK
      ?auto_529293 - BLOCK
      ?auto_529294 - BLOCK
      ?auto_529295 - BLOCK
      ?auto_529296 - BLOCK
      ?auto_529297 - BLOCK
    )
    :vars
    (
      ?auto_529298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529297 ?auto_529298 ) ( not ( = ?auto_529288 ?auto_529289 ) ) ( not ( = ?auto_529288 ?auto_529290 ) ) ( not ( = ?auto_529288 ?auto_529291 ) ) ( not ( = ?auto_529288 ?auto_529292 ) ) ( not ( = ?auto_529288 ?auto_529293 ) ) ( not ( = ?auto_529288 ?auto_529294 ) ) ( not ( = ?auto_529288 ?auto_529295 ) ) ( not ( = ?auto_529288 ?auto_529296 ) ) ( not ( = ?auto_529288 ?auto_529297 ) ) ( not ( = ?auto_529288 ?auto_529298 ) ) ( not ( = ?auto_529289 ?auto_529290 ) ) ( not ( = ?auto_529289 ?auto_529291 ) ) ( not ( = ?auto_529289 ?auto_529292 ) ) ( not ( = ?auto_529289 ?auto_529293 ) ) ( not ( = ?auto_529289 ?auto_529294 ) ) ( not ( = ?auto_529289 ?auto_529295 ) ) ( not ( = ?auto_529289 ?auto_529296 ) ) ( not ( = ?auto_529289 ?auto_529297 ) ) ( not ( = ?auto_529289 ?auto_529298 ) ) ( not ( = ?auto_529290 ?auto_529291 ) ) ( not ( = ?auto_529290 ?auto_529292 ) ) ( not ( = ?auto_529290 ?auto_529293 ) ) ( not ( = ?auto_529290 ?auto_529294 ) ) ( not ( = ?auto_529290 ?auto_529295 ) ) ( not ( = ?auto_529290 ?auto_529296 ) ) ( not ( = ?auto_529290 ?auto_529297 ) ) ( not ( = ?auto_529290 ?auto_529298 ) ) ( not ( = ?auto_529291 ?auto_529292 ) ) ( not ( = ?auto_529291 ?auto_529293 ) ) ( not ( = ?auto_529291 ?auto_529294 ) ) ( not ( = ?auto_529291 ?auto_529295 ) ) ( not ( = ?auto_529291 ?auto_529296 ) ) ( not ( = ?auto_529291 ?auto_529297 ) ) ( not ( = ?auto_529291 ?auto_529298 ) ) ( not ( = ?auto_529292 ?auto_529293 ) ) ( not ( = ?auto_529292 ?auto_529294 ) ) ( not ( = ?auto_529292 ?auto_529295 ) ) ( not ( = ?auto_529292 ?auto_529296 ) ) ( not ( = ?auto_529292 ?auto_529297 ) ) ( not ( = ?auto_529292 ?auto_529298 ) ) ( not ( = ?auto_529293 ?auto_529294 ) ) ( not ( = ?auto_529293 ?auto_529295 ) ) ( not ( = ?auto_529293 ?auto_529296 ) ) ( not ( = ?auto_529293 ?auto_529297 ) ) ( not ( = ?auto_529293 ?auto_529298 ) ) ( not ( = ?auto_529294 ?auto_529295 ) ) ( not ( = ?auto_529294 ?auto_529296 ) ) ( not ( = ?auto_529294 ?auto_529297 ) ) ( not ( = ?auto_529294 ?auto_529298 ) ) ( not ( = ?auto_529295 ?auto_529296 ) ) ( not ( = ?auto_529295 ?auto_529297 ) ) ( not ( = ?auto_529295 ?auto_529298 ) ) ( not ( = ?auto_529296 ?auto_529297 ) ) ( not ( = ?auto_529296 ?auto_529298 ) ) ( not ( = ?auto_529297 ?auto_529298 ) ) ( ON ?auto_529296 ?auto_529297 ) ( ON ?auto_529295 ?auto_529296 ) ( ON ?auto_529294 ?auto_529295 ) ( ON ?auto_529293 ?auto_529294 ) ( ON ?auto_529292 ?auto_529293 ) ( ON ?auto_529291 ?auto_529292 ) ( ON ?auto_529290 ?auto_529291 ) ( ON ?auto_529289 ?auto_529290 ) ( ON ?auto_529288 ?auto_529289 ) ( CLEAR ?auto_529288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_529288 )
      ( MAKE-10PILE ?auto_529288 ?auto_529289 ?auto_529290 ?auto_529291 ?auto_529292 ?auto_529293 ?auto_529294 ?auto_529295 ?auto_529296 ?auto_529297 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529331 - BLOCK
      ?auto_529332 - BLOCK
      ?auto_529333 - BLOCK
      ?auto_529334 - BLOCK
      ?auto_529335 - BLOCK
      ?auto_529336 - BLOCK
      ?auto_529337 - BLOCK
      ?auto_529338 - BLOCK
      ?auto_529339 - BLOCK
      ?auto_529340 - BLOCK
      ?auto_529341 - BLOCK
    )
    :vars
    (
      ?auto_529342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_529340 ) ( ON ?auto_529341 ?auto_529342 ) ( CLEAR ?auto_529341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_529331 ) ( ON ?auto_529332 ?auto_529331 ) ( ON ?auto_529333 ?auto_529332 ) ( ON ?auto_529334 ?auto_529333 ) ( ON ?auto_529335 ?auto_529334 ) ( ON ?auto_529336 ?auto_529335 ) ( ON ?auto_529337 ?auto_529336 ) ( ON ?auto_529338 ?auto_529337 ) ( ON ?auto_529339 ?auto_529338 ) ( ON ?auto_529340 ?auto_529339 ) ( not ( = ?auto_529331 ?auto_529332 ) ) ( not ( = ?auto_529331 ?auto_529333 ) ) ( not ( = ?auto_529331 ?auto_529334 ) ) ( not ( = ?auto_529331 ?auto_529335 ) ) ( not ( = ?auto_529331 ?auto_529336 ) ) ( not ( = ?auto_529331 ?auto_529337 ) ) ( not ( = ?auto_529331 ?auto_529338 ) ) ( not ( = ?auto_529331 ?auto_529339 ) ) ( not ( = ?auto_529331 ?auto_529340 ) ) ( not ( = ?auto_529331 ?auto_529341 ) ) ( not ( = ?auto_529331 ?auto_529342 ) ) ( not ( = ?auto_529332 ?auto_529333 ) ) ( not ( = ?auto_529332 ?auto_529334 ) ) ( not ( = ?auto_529332 ?auto_529335 ) ) ( not ( = ?auto_529332 ?auto_529336 ) ) ( not ( = ?auto_529332 ?auto_529337 ) ) ( not ( = ?auto_529332 ?auto_529338 ) ) ( not ( = ?auto_529332 ?auto_529339 ) ) ( not ( = ?auto_529332 ?auto_529340 ) ) ( not ( = ?auto_529332 ?auto_529341 ) ) ( not ( = ?auto_529332 ?auto_529342 ) ) ( not ( = ?auto_529333 ?auto_529334 ) ) ( not ( = ?auto_529333 ?auto_529335 ) ) ( not ( = ?auto_529333 ?auto_529336 ) ) ( not ( = ?auto_529333 ?auto_529337 ) ) ( not ( = ?auto_529333 ?auto_529338 ) ) ( not ( = ?auto_529333 ?auto_529339 ) ) ( not ( = ?auto_529333 ?auto_529340 ) ) ( not ( = ?auto_529333 ?auto_529341 ) ) ( not ( = ?auto_529333 ?auto_529342 ) ) ( not ( = ?auto_529334 ?auto_529335 ) ) ( not ( = ?auto_529334 ?auto_529336 ) ) ( not ( = ?auto_529334 ?auto_529337 ) ) ( not ( = ?auto_529334 ?auto_529338 ) ) ( not ( = ?auto_529334 ?auto_529339 ) ) ( not ( = ?auto_529334 ?auto_529340 ) ) ( not ( = ?auto_529334 ?auto_529341 ) ) ( not ( = ?auto_529334 ?auto_529342 ) ) ( not ( = ?auto_529335 ?auto_529336 ) ) ( not ( = ?auto_529335 ?auto_529337 ) ) ( not ( = ?auto_529335 ?auto_529338 ) ) ( not ( = ?auto_529335 ?auto_529339 ) ) ( not ( = ?auto_529335 ?auto_529340 ) ) ( not ( = ?auto_529335 ?auto_529341 ) ) ( not ( = ?auto_529335 ?auto_529342 ) ) ( not ( = ?auto_529336 ?auto_529337 ) ) ( not ( = ?auto_529336 ?auto_529338 ) ) ( not ( = ?auto_529336 ?auto_529339 ) ) ( not ( = ?auto_529336 ?auto_529340 ) ) ( not ( = ?auto_529336 ?auto_529341 ) ) ( not ( = ?auto_529336 ?auto_529342 ) ) ( not ( = ?auto_529337 ?auto_529338 ) ) ( not ( = ?auto_529337 ?auto_529339 ) ) ( not ( = ?auto_529337 ?auto_529340 ) ) ( not ( = ?auto_529337 ?auto_529341 ) ) ( not ( = ?auto_529337 ?auto_529342 ) ) ( not ( = ?auto_529338 ?auto_529339 ) ) ( not ( = ?auto_529338 ?auto_529340 ) ) ( not ( = ?auto_529338 ?auto_529341 ) ) ( not ( = ?auto_529338 ?auto_529342 ) ) ( not ( = ?auto_529339 ?auto_529340 ) ) ( not ( = ?auto_529339 ?auto_529341 ) ) ( not ( = ?auto_529339 ?auto_529342 ) ) ( not ( = ?auto_529340 ?auto_529341 ) ) ( not ( = ?auto_529340 ?auto_529342 ) ) ( not ( = ?auto_529341 ?auto_529342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_529341 ?auto_529342 )
      ( !STACK ?auto_529341 ?auto_529340 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529377 - BLOCK
      ?auto_529378 - BLOCK
      ?auto_529379 - BLOCK
      ?auto_529380 - BLOCK
      ?auto_529381 - BLOCK
      ?auto_529382 - BLOCK
      ?auto_529383 - BLOCK
      ?auto_529384 - BLOCK
      ?auto_529385 - BLOCK
      ?auto_529386 - BLOCK
      ?auto_529387 - BLOCK
    )
    :vars
    (
      ?auto_529388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529387 ?auto_529388 ) ( ON-TABLE ?auto_529377 ) ( ON ?auto_529378 ?auto_529377 ) ( ON ?auto_529379 ?auto_529378 ) ( ON ?auto_529380 ?auto_529379 ) ( ON ?auto_529381 ?auto_529380 ) ( ON ?auto_529382 ?auto_529381 ) ( ON ?auto_529383 ?auto_529382 ) ( ON ?auto_529384 ?auto_529383 ) ( ON ?auto_529385 ?auto_529384 ) ( not ( = ?auto_529377 ?auto_529378 ) ) ( not ( = ?auto_529377 ?auto_529379 ) ) ( not ( = ?auto_529377 ?auto_529380 ) ) ( not ( = ?auto_529377 ?auto_529381 ) ) ( not ( = ?auto_529377 ?auto_529382 ) ) ( not ( = ?auto_529377 ?auto_529383 ) ) ( not ( = ?auto_529377 ?auto_529384 ) ) ( not ( = ?auto_529377 ?auto_529385 ) ) ( not ( = ?auto_529377 ?auto_529386 ) ) ( not ( = ?auto_529377 ?auto_529387 ) ) ( not ( = ?auto_529377 ?auto_529388 ) ) ( not ( = ?auto_529378 ?auto_529379 ) ) ( not ( = ?auto_529378 ?auto_529380 ) ) ( not ( = ?auto_529378 ?auto_529381 ) ) ( not ( = ?auto_529378 ?auto_529382 ) ) ( not ( = ?auto_529378 ?auto_529383 ) ) ( not ( = ?auto_529378 ?auto_529384 ) ) ( not ( = ?auto_529378 ?auto_529385 ) ) ( not ( = ?auto_529378 ?auto_529386 ) ) ( not ( = ?auto_529378 ?auto_529387 ) ) ( not ( = ?auto_529378 ?auto_529388 ) ) ( not ( = ?auto_529379 ?auto_529380 ) ) ( not ( = ?auto_529379 ?auto_529381 ) ) ( not ( = ?auto_529379 ?auto_529382 ) ) ( not ( = ?auto_529379 ?auto_529383 ) ) ( not ( = ?auto_529379 ?auto_529384 ) ) ( not ( = ?auto_529379 ?auto_529385 ) ) ( not ( = ?auto_529379 ?auto_529386 ) ) ( not ( = ?auto_529379 ?auto_529387 ) ) ( not ( = ?auto_529379 ?auto_529388 ) ) ( not ( = ?auto_529380 ?auto_529381 ) ) ( not ( = ?auto_529380 ?auto_529382 ) ) ( not ( = ?auto_529380 ?auto_529383 ) ) ( not ( = ?auto_529380 ?auto_529384 ) ) ( not ( = ?auto_529380 ?auto_529385 ) ) ( not ( = ?auto_529380 ?auto_529386 ) ) ( not ( = ?auto_529380 ?auto_529387 ) ) ( not ( = ?auto_529380 ?auto_529388 ) ) ( not ( = ?auto_529381 ?auto_529382 ) ) ( not ( = ?auto_529381 ?auto_529383 ) ) ( not ( = ?auto_529381 ?auto_529384 ) ) ( not ( = ?auto_529381 ?auto_529385 ) ) ( not ( = ?auto_529381 ?auto_529386 ) ) ( not ( = ?auto_529381 ?auto_529387 ) ) ( not ( = ?auto_529381 ?auto_529388 ) ) ( not ( = ?auto_529382 ?auto_529383 ) ) ( not ( = ?auto_529382 ?auto_529384 ) ) ( not ( = ?auto_529382 ?auto_529385 ) ) ( not ( = ?auto_529382 ?auto_529386 ) ) ( not ( = ?auto_529382 ?auto_529387 ) ) ( not ( = ?auto_529382 ?auto_529388 ) ) ( not ( = ?auto_529383 ?auto_529384 ) ) ( not ( = ?auto_529383 ?auto_529385 ) ) ( not ( = ?auto_529383 ?auto_529386 ) ) ( not ( = ?auto_529383 ?auto_529387 ) ) ( not ( = ?auto_529383 ?auto_529388 ) ) ( not ( = ?auto_529384 ?auto_529385 ) ) ( not ( = ?auto_529384 ?auto_529386 ) ) ( not ( = ?auto_529384 ?auto_529387 ) ) ( not ( = ?auto_529384 ?auto_529388 ) ) ( not ( = ?auto_529385 ?auto_529386 ) ) ( not ( = ?auto_529385 ?auto_529387 ) ) ( not ( = ?auto_529385 ?auto_529388 ) ) ( not ( = ?auto_529386 ?auto_529387 ) ) ( not ( = ?auto_529386 ?auto_529388 ) ) ( not ( = ?auto_529387 ?auto_529388 ) ) ( CLEAR ?auto_529385 ) ( ON ?auto_529386 ?auto_529387 ) ( CLEAR ?auto_529386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_529377 ?auto_529378 ?auto_529379 ?auto_529380 ?auto_529381 ?auto_529382 ?auto_529383 ?auto_529384 ?auto_529385 ?auto_529386 )
      ( MAKE-11PILE ?auto_529377 ?auto_529378 ?auto_529379 ?auto_529380 ?auto_529381 ?auto_529382 ?auto_529383 ?auto_529384 ?auto_529385 ?auto_529386 ?auto_529387 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529423 - BLOCK
      ?auto_529424 - BLOCK
      ?auto_529425 - BLOCK
      ?auto_529426 - BLOCK
      ?auto_529427 - BLOCK
      ?auto_529428 - BLOCK
      ?auto_529429 - BLOCK
      ?auto_529430 - BLOCK
      ?auto_529431 - BLOCK
      ?auto_529432 - BLOCK
      ?auto_529433 - BLOCK
    )
    :vars
    (
      ?auto_529434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529433 ?auto_529434 ) ( ON-TABLE ?auto_529423 ) ( ON ?auto_529424 ?auto_529423 ) ( ON ?auto_529425 ?auto_529424 ) ( ON ?auto_529426 ?auto_529425 ) ( ON ?auto_529427 ?auto_529426 ) ( ON ?auto_529428 ?auto_529427 ) ( ON ?auto_529429 ?auto_529428 ) ( ON ?auto_529430 ?auto_529429 ) ( not ( = ?auto_529423 ?auto_529424 ) ) ( not ( = ?auto_529423 ?auto_529425 ) ) ( not ( = ?auto_529423 ?auto_529426 ) ) ( not ( = ?auto_529423 ?auto_529427 ) ) ( not ( = ?auto_529423 ?auto_529428 ) ) ( not ( = ?auto_529423 ?auto_529429 ) ) ( not ( = ?auto_529423 ?auto_529430 ) ) ( not ( = ?auto_529423 ?auto_529431 ) ) ( not ( = ?auto_529423 ?auto_529432 ) ) ( not ( = ?auto_529423 ?auto_529433 ) ) ( not ( = ?auto_529423 ?auto_529434 ) ) ( not ( = ?auto_529424 ?auto_529425 ) ) ( not ( = ?auto_529424 ?auto_529426 ) ) ( not ( = ?auto_529424 ?auto_529427 ) ) ( not ( = ?auto_529424 ?auto_529428 ) ) ( not ( = ?auto_529424 ?auto_529429 ) ) ( not ( = ?auto_529424 ?auto_529430 ) ) ( not ( = ?auto_529424 ?auto_529431 ) ) ( not ( = ?auto_529424 ?auto_529432 ) ) ( not ( = ?auto_529424 ?auto_529433 ) ) ( not ( = ?auto_529424 ?auto_529434 ) ) ( not ( = ?auto_529425 ?auto_529426 ) ) ( not ( = ?auto_529425 ?auto_529427 ) ) ( not ( = ?auto_529425 ?auto_529428 ) ) ( not ( = ?auto_529425 ?auto_529429 ) ) ( not ( = ?auto_529425 ?auto_529430 ) ) ( not ( = ?auto_529425 ?auto_529431 ) ) ( not ( = ?auto_529425 ?auto_529432 ) ) ( not ( = ?auto_529425 ?auto_529433 ) ) ( not ( = ?auto_529425 ?auto_529434 ) ) ( not ( = ?auto_529426 ?auto_529427 ) ) ( not ( = ?auto_529426 ?auto_529428 ) ) ( not ( = ?auto_529426 ?auto_529429 ) ) ( not ( = ?auto_529426 ?auto_529430 ) ) ( not ( = ?auto_529426 ?auto_529431 ) ) ( not ( = ?auto_529426 ?auto_529432 ) ) ( not ( = ?auto_529426 ?auto_529433 ) ) ( not ( = ?auto_529426 ?auto_529434 ) ) ( not ( = ?auto_529427 ?auto_529428 ) ) ( not ( = ?auto_529427 ?auto_529429 ) ) ( not ( = ?auto_529427 ?auto_529430 ) ) ( not ( = ?auto_529427 ?auto_529431 ) ) ( not ( = ?auto_529427 ?auto_529432 ) ) ( not ( = ?auto_529427 ?auto_529433 ) ) ( not ( = ?auto_529427 ?auto_529434 ) ) ( not ( = ?auto_529428 ?auto_529429 ) ) ( not ( = ?auto_529428 ?auto_529430 ) ) ( not ( = ?auto_529428 ?auto_529431 ) ) ( not ( = ?auto_529428 ?auto_529432 ) ) ( not ( = ?auto_529428 ?auto_529433 ) ) ( not ( = ?auto_529428 ?auto_529434 ) ) ( not ( = ?auto_529429 ?auto_529430 ) ) ( not ( = ?auto_529429 ?auto_529431 ) ) ( not ( = ?auto_529429 ?auto_529432 ) ) ( not ( = ?auto_529429 ?auto_529433 ) ) ( not ( = ?auto_529429 ?auto_529434 ) ) ( not ( = ?auto_529430 ?auto_529431 ) ) ( not ( = ?auto_529430 ?auto_529432 ) ) ( not ( = ?auto_529430 ?auto_529433 ) ) ( not ( = ?auto_529430 ?auto_529434 ) ) ( not ( = ?auto_529431 ?auto_529432 ) ) ( not ( = ?auto_529431 ?auto_529433 ) ) ( not ( = ?auto_529431 ?auto_529434 ) ) ( not ( = ?auto_529432 ?auto_529433 ) ) ( not ( = ?auto_529432 ?auto_529434 ) ) ( not ( = ?auto_529433 ?auto_529434 ) ) ( ON ?auto_529432 ?auto_529433 ) ( CLEAR ?auto_529430 ) ( ON ?auto_529431 ?auto_529432 ) ( CLEAR ?auto_529431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_529423 ?auto_529424 ?auto_529425 ?auto_529426 ?auto_529427 ?auto_529428 ?auto_529429 ?auto_529430 ?auto_529431 )
      ( MAKE-11PILE ?auto_529423 ?auto_529424 ?auto_529425 ?auto_529426 ?auto_529427 ?auto_529428 ?auto_529429 ?auto_529430 ?auto_529431 ?auto_529432 ?auto_529433 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529469 - BLOCK
      ?auto_529470 - BLOCK
      ?auto_529471 - BLOCK
      ?auto_529472 - BLOCK
      ?auto_529473 - BLOCK
      ?auto_529474 - BLOCK
      ?auto_529475 - BLOCK
      ?auto_529476 - BLOCK
      ?auto_529477 - BLOCK
      ?auto_529478 - BLOCK
      ?auto_529479 - BLOCK
    )
    :vars
    (
      ?auto_529480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529479 ?auto_529480 ) ( ON-TABLE ?auto_529469 ) ( ON ?auto_529470 ?auto_529469 ) ( ON ?auto_529471 ?auto_529470 ) ( ON ?auto_529472 ?auto_529471 ) ( ON ?auto_529473 ?auto_529472 ) ( ON ?auto_529474 ?auto_529473 ) ( ON ?auto_529475 ?auto_529474 ) ( not ( = ?auto_529469 ?auto_529470 ) ) ( not ( = ?auto_529469 ?auto_529471 ) ) ( not ( = ?auto_529469 ?auto_529472 ) ) ( not ( = ?auto_529469 ?auto_529473 ) ) ( not ( = ?auto_529469 ?auto_529474 ) ) ( not ( = ?auto_529469 ?auto_529475 ) ) ( not ( = ?auto_529469 ?auto_529476 ) ) ( not ( = ?auto_529469 ?auto_529477 ) ) ( not ( = ?auto_529469 ?auto_529478 ) ) ( not ( = ?auto_529469 ?auto_529479 ) ) ( not ( = ?auto_529469 ?auto_529480 ) ) ( not ( = ?auto_529470 ?auto_529471 ) ) ( not ( = ?auto_529470 ?auto_529472 ) ) ( not ( = ?auto_529470 ?auto_529473 ) ) ( not ( = ?auto_529470 ?auto_529474 ) ) ( not ( = ?auto_529470 ?auto_529475 ) ) ( not ( = ?auto_529470 ?auto_529476 ) ) ( not ( = ?auto_529470 ?auto_529477 ) ) ( not ( = ?auto_529470 ?auto_529478 ) ) ( not ( = ?auto_529470 ?auto_529479 ) ) ( not ( = ?auto_529470 ?auto_529480 ) ) ( not ( = ?auto_529471 ?auto_529472 ) ) ( not ( = ?auto_529471 ?auto_529473 ) ) ( not ( = ?auto_529471 ?auto_529474 ) ) ( not ( = ?auto_529471 ?auto_529475 ) ) ( not ( = ?auto_529471 ?auto_529476 ) ) ( not ( = ?auto_529471 ?auto_529477 ) ) ( not ( = ?auto_529471 ?auto_529478 ) ) ( not ( = ?auto_529471 ?auto_529479 ) ) ( not ( = ?auto_529471 ?auto_529480 ) ) ( not ( = ?auto_529472 ?auto_529473 ) ) ( not ( = ?auto_529472 ?auto_529474 ) ) ( not ( = ?auto_529472 ?auto_529475 ) ) ( not ( = ?auto_529472 ?auto_529476 ) ) ( not ( = ?auto_529472 ?auto_529477 ) ) ( not ( = ?auto_529472 ?auto_529478 ) ) ( not ( = ?auto_529472 ?auto_529479 ) ) ( not ( = ?auto_529472 ?auto_529480 ) ) ( not ( = ?auto_529473 ?auto_529474 ) ) ( not ( = ?auto_529473 ?auto_529475 ) ) ( not ( = ?auto_529473 ?auto_529476 ) ) ( not ( = ?auto_529473 ?auto_529477 ) ) ( not ( = ?auto_529473 ?auto_529478 ) ) ( not ( = ?auto_529473 ?auto_529479 ) ) ( not ( = ?auto_529473 ?auto_529480 ) ) ( not ( = ?auto_529474 ?auto_529475 ) ) ( not ( = ?auto_529474 ?auto_529476 ) ) ( not ( = ?auto_529474 ?auto_529477 ) ) ( not ( = ?auto_529474 ?auto_529478 ) ) ( not ( = ?auto_529474 ?auto_529479 ) ) ( not ( = ?auto_529474 ?auto_529480 ) ) ( not ( = ?auto_529475 ?auto_529476 ) ) ( not ( = ?auto_529475 ?auto_529477 ) ) ( not ( = ?auto_529475 ?auto_529478 ) ) ( not ( = ?auto_529475 ?auto_529479 ) ) ( not ( = ?auto_529475 ?auto_529480 ) ) ( not ( = ?auto_529476 ?auto_529477 ) ) ( not ( = ?auto_529476 ?auto_529478 ) ) ( not ( = ?auto_529476 ?auto_529479 ) ) ( not ( = ?auto_529476 ?auto_529480 ) ) ( not ( = ?auto_529477 ?auto_529478 ) ) ( not ( = ?auto_529477 ?auto_529479 ) ) ( not ( = ?auto_529477 ?auto_529480 ) ) ( not ( = ?auto_529478 ?auto_529479 ) ) ( not ( = ?auto_529478 ?auto_529480 ) ) ( not ( = ?auto_529479 ?auto_529480 ) ) ( ON ?auto_529478 ?auto_529479 ) ( ON ?auto_529477 ?auto_529478 ) ( CLEAR ?auto_529475 ) ( ON ?auto_529476 ?auto_529477 ) ( CLEAR ?auto_529476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_529469 ?auto_529470 ?auto_529471 ?auto_529472 ?auto_529473 ?auto_529474 ?auto_529475 ?auto_529476 )
      ( MAKE-11PILE ?auto_529469 ?auto_529470 ?auto_529471 ?auto_529472 ?auto_529473 ?auto_529474 ?auto_529475 ?auto_529476 ?auto_529477 ?auto_529478 ?auto_529479 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529515 - BLOCK
      ?auto_529516 - BLOCK
      ?auto_529517 - BLOCK
      ?auto_529518 - BLOCK
      ?auto_529519 - BLOCK
      ?auto_529520 - BLOCK
      ?auto_529521 - BLOCK
      ?auto_529522 - BLOCK
      ?auto_529523 - BLOCK
      ?auto_529524 - BLOCK
      ?auto_529525 - BLOCK
    )
    :vars
    (
      ?auto_529526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529525 ?auto_529526 ) ( ON-TABLE ?auto_529515 ) ( ON ?auto_529516 ?auto_529515 ) ( ON ?auto_529517 ?auto_529516 ) ( ON ?auto_529518 ?auto_529517 ) ( ON ?auto_529519 ?auto_529518 ) ( ON ?auto_529520 ?auto_529519 ) ( not ( = ?auto_529515 ?auto_529516 ) ) ( not ( = ?auto_529515 ?auto_529517 ) ) ( not ( = ?auto_529515 ?auto_529518 ) ) ( not ( = ?auto_529515 ?auto_529519 ) ) ( not ( = ?auto_529515 ?auto_529520 ) ) ( not ( = ?auto_529515 ?auto_529521 ) ) ( not ( = ?auto_529515 ?auto_529522 ) ) ( not ( = ?auto_529515 ?auto_529523 ) ) ( not ( = ?auto_529515 ?auto_529524 ) ) ( not ( = ?auto_529515 ?auto_529525 ) ) ( not ( = ?auto_529515 ?auto_529526 ) ) ( not ( = ?auto_529516 ?auto_529517 ) ) ( not ( = ?auto_529516 ?auto_529518 ) ) ( not ( = ?auto_529516 ?auto_529519 ) ) ( not ( = ?auto_529516 ?auto_529520 ) ) ( not ( = ?auto_529516 ?auto_529521 ) ) ( not ( = ?auto_529516 ?auto_529522 ) ) ( not ( = ?auto_529516 ?auto_529523 ) ) ( not ( = ?auto_529516 ?auto_529524 ) ) ( not ( = ?auto_529516 ?auto_529525 ) ) ( not ( = ?auto_529516 ?auto_529526 ) ) ( not ( = ?auto_529517 ?auto_529518 ) ) ( not ( = ?auto_529517 ?auto_529519 ) ) ( not ( = ?auto_529517 ?auto_529520 ) ) ( not ( = ?auto_529517 ?auto_529521 ) ) ( not ( = ?auto_529517 ?auto_529522 ) ) ( not ( = ?auto_529517 ?auto_529523 ) ) ( not ( = ?auto_529517 ?auto_529524 ) ) ( not ( = ?auto_529517 ?auto_529525 ) ) ( not ( = ?auto_529517 ?auto_529526 ) ) ( not ( = ?auto_529518 ?auto_529519 ) ) ( not ( = ?auto_529518 ?auto_529520 ) ) ( not ( = ?auto_529518 ?auto_529521 ) ) ( not ( = ?auto_529518 ?auto_529522 ) ) ( not ( = ?auto_529518 ?auto_529523 ) ) ( not ( = ?auto_529518 ?auto_529524 ) ) ( not ( = ?auto_529518 ?auto_529525 ) ) ( not ( = ?auto_529518 ?auto_529526 ) ) ( not ( = ?auto_529519 ?auto_529520 ) ) ( not ( = ?auto_529519 ?auto_529521 ) ) ( not ( = ?auto_529519 ?auto_529522 ) ) ( not ( = ?auto_529519 ?auto_529523 ) ) ( not ( = ?auto_529519 ?auto_529524 ) ) ( not ( = ?auto_529519 ?auto_529525 ) ) ( not ( = ?auto_529519 ?auto_529526 ) ) ( not ( = ?auto_529520 ?auto_529521 ) ) ( not ( = ?auto_529520 ?auto_529522 ) ) ( not ( = ?auto_529520 ?auto_529523 ) ) ( not ( = ?auto_529520 ?auto_529524 ) ) ( not ( = ?auto_529520 ?auto_529525 ) ) ( not ( = ?auto_529520 ?auto_529526 ) ) ( not ( = ?auto_529521 ?auto_529522 ) ) ( not ( = ?auto_529521 ?auto_529523 ) ) ( not ( = ?auto_529521 ?auto_529524 ) ) ( not ( = ?auto_529521 ?auto_529525 ) ) ( not ( = ?auto_529521 ?auto_529526 ) ) ( not ( = ?auto_529522 ?auto_529523 ) ) ( not ( = ?auto_529522 ?auto_529524 ) ) ( not ( = ?auto_529522 ?auto_529525 ) ) ( not ( = ?auto_529522 ?auto_529526 ) ) ( not ( = ?auto_529523 ?auto_529524 ) ) ( not ( = ?auto_529523 ?auto_529525 ) ) ( not ( = ?auto_529523 ?auto_529526 ) ) ( not ( = ?auto_529524 ?auto_529525 ) ) ( not ( = ?auto_529524 ?auto_529526 ) ) ( not ( = ?auto_529525 ?auto_529526 ) ) ( ON ?auto_529524 ?auto_529525 ) ( ON ?auto_529523 ?auto_529524 ) ( ON ?auto_529522 ?auto_529523 ) ( CLEAR ?auto_529520 ) ( ON ?auto_529521 ?auto_529522 ) ( CLEAR ?auto_529521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_529515 ?auto_529516 ?auto_529517 ?auto_529518 ?auto_529519 ?auto_529520 ?auto_529521 )
      ( MAKE-11PILE ?auto_529515 ?auto_529516 ?auto_529517 ?auto_529518 ?auto_529519 ?auto_529520 ?auto_529521 ?auto_529522 ?auto_529523 ?auto_529524 ?auto_529525 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529561 - BLOCK
      ?auto_529562 - BLOCK
      ?auto_529563 - BLOCK
      ?auto_529564 - BLOCK
      ?auto_529565 - BLOCK
      ?auto_529566 - BLOCK
      ?auto_529567 - BLOCK
      ?auto_529568 - BLOCK
      ?auto_529569 - BLOCK
      ?auto_529570 - BLOCK
      ?auto_529571 - BLOCK
    )
    :vars
    (
      ?auto_529572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529571 ?auto_529572 ) ( ON-TABLE ?auto_529561 ) ( ON ?auto_529562 ?auto_529561 ) ( ON ?auto_529563 ?auto_529562 ) ( ON ?auto_529564 ?auto_529563 ) ( ON ?auto_529565 ?auto_529564 ) ( not ( = ?auto_529561 ?auto_529562 ) ) ( not ( = ?auto_529561 ?auto_529563 ) ) ( not ( = ?auto_529561 ?auto_529564 ) ) ( not ( = ?auto_529561 ?auto_529565 ) ) ( not ( = ?auto_529561 ?auto_529566 ) ) ( not ( = ?auto_529561 ?auto_529567 ) ) ( not ( = ?auto_529561 ?auto_529568 ) ) ( not ( = ?auto_529561 ?auto_529569 ) ) ( not ( = ?auto_529561 ?auto_529570 ) ) ( not ( = ?auto_529561 ?auto_529571 ) ) ( not ( = ?auto_529561 ?auto_529572 ) ) ( not ( = ?auto_529562 ?auto_529563 ) ) ( not ( = ?auto_529562 ?auto_529564 ) ) ( not ( = ?auto_529562 ?auto_529565 ) ) ( not ( = ?auto_529562 ?auto_529566 ) ) ( not ( = ?auto_529562 ?auto_529567 ) ) ( not ( = ?auto_529562 ?auto_529568 ) ) ( not ( = ?auto_529562 ?auto_529569 ) ) ( not ( = ?auto_529562 ?auto_529570 ) ) ( not ( = ?auto_529562 ?auto_529571 ) ) ( not ( = ?auto_529562 ?auto_529572 ) ) ( not ( = ?auto_529563 ?auto_529564 ) ) ( not ( = ?auto_529563 ?auto_529565 ) ) ( not ( = ?auto_529563 ?auto_529566 ) ) ( not ( = ?auto_529563 ?auto_529567 ) ) ( not ( = ?auto_529563 ?auto_529568 ) ) ( not ( = ?auto_529563 ?auto_529569 ) ) ( not ( = ?auto_529563 ?auto_529570 ) ) ( not ( = ?auto_529563 ?auto_529571 ) ) ( not ( = ?auto_529563 ?auto_529572 ) ) ( not ( = ?auto_529564 ?auto_529565 ) ) ( not ( = ?auto_529564 ?auto_529566 ) ) ( not ( = ?auto_529564 ?auto_529567 ) ) ( not ( = ?auto_529564 ?auto_529568 ) ) ( not ( = ?auto_529564 ?auto_529569 ) ) ( not ( = ?auto_529564 ?auto_529570 ) ) ( not ( = ?auto_529564 ?auto_529571 ) ) ( not ( = ?auto_529564 ?auto_529572 ) ) ( not ( = ?auto_529565 ?auto_529566 ) ) ( not ( = ?auto_529565 ?auto_529567 ) ) ( not ( = ?auto_529565 ?auto_529568 ) ) ( not ( = ?auto_529565 ?auto_529569 ) ) ( not ( = ?auto_529565 ?auto_529570 ) ) ( not ( = ?auto_529565 ?auto_529571 ) ) ( not ( = ?auto_529565 ?auto_529572 ) ) ( not ( = ?auto_529566 ?auto_529567 ) ) ( not ( = ?auto_529566 ?auto_529568 ) ) ( not ( = ?auto_529566 ?auto_529569 ) ) ( not ( = ?auto_529566 ?auto_529570 ) ) ( not ( = ?auto_529566 ?auto_529571 ) ) ( not ( = ?auto_529566 ?auto_529572 ) ) ( not ( = ?auto_529567 ?auto_529568 ) ) ( not ( = ?auto_529567 ?auto_529569 ) ) ( not ( = ?auto_529567 ?auto_529570 ) ) ( not ( = ?auto_529567 ?auto_529571 ) ) ( not ( = ?auto_529567 ?auto_529572 ) ) ( not ( = ?auto_529568 ?auto_529569 ) ) ( not ( = ?auto_529568 ?auto_529570 ) ) ( not ( = ?auto_529568 ?auto_529571 ) ) ( not ( = ?auto_529568 ?auto_529572 ) ) ( not ( = ?auto_529569 ?auto_529570 ) ) ( not ( = ?auto_529569 ?auto_529571 ) ) ( not ( = ?auto_529569 ?auto_529572 ) ) ( not ( = ?auto_529570 ?auto_529571 ) ) ( not ( = ?auto_529570 ?auto_529572 ) ) ( not ( = ?auto_529571 ?auto_529572 ) ) ( ON ?auto_529570 ?auto_529571 ) ( ON ?auto_529569 ?auto_529570 ) ( ON ?auto_529568 ?auto_529569 ) ( ON ?auto_529567 ?auto_529568 ) ( CLEAR ?auto_529565 ) ( ON ?auto_529566 ?auto_529567 ) ( CLEAR ?auto_529566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_529561 ?auto_529562 ?auto_529563 ?auto_529564 ?auto_529565 ?auto_529566 )
      ( MAKE-11PILE ?auto_529561 ?auto_529562 ?auto_529563 ?auto_529564 ?auto_529565 ?auto_529566 ?auto_529567 ?auto_529568 ?auto_529569 ?auto_529570 ?auto_529571 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529607 - BLOCK
      ?auto_529608 - BLOCK
      ?auto_529609 - BLOCK
      ?auto_529610 - BLOCK
      ?auto_529611 - BLOCK
      ?auto_529612 - BLOCK
      ?auto_529613 - BLOCK
      ?auto_529614 - BLOCK
      ?auto_529615 - BLOCK
      ?auto_529616 - BLOCK
      ?auto_529617 - BLOCK
    )
    :vars
    (
      ?auto_529618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529617 ?auto_529618 ) ( ON-TABLE ?auto_529607 ) ( ON ?auto_529608 ?auto_529607 ) ( ON ?auto_529609 ?auto_529608 ) ( ON ?auto_529610 ?auto_529609 ) ( not ( = ?auto_529607 ?auto_529608 ) ) ( not ( = ?auto_529607 ?auto_529609 ) ) ( not ( = ?auto_529607 ?auto_529610 ) ) ( not ( = ?auto_529607 ?auto_529611 ) ) ( not ( = ?auto_529607 ?auto_529612 ) ) ( not ( = ?auto_529607 ?auto_529613 ) ) ( not ( = ?auto_529607 ?auto_529614 ) ) ( not ( = ?auto_529607 ?auto_529615 ) ) ( not ( = ?auto_529607 ?auto_529616 ) ) ( not ( = ?auto_529607 ?auto_529617 ) ) ( not ( = ?auto_529607 ?auto_529618 ) ) ( not ( = ?auto_529608 ?auto_529609 ) ) ( not ( = ?auto_529608 ?auto_529610 ) ) ( not ( = ?auto_529608 ?auto_529611 ) ) ( not ( = ?auto_529608 ?auto_529612 ) ) ( not ( = ?auto_529608 ?auto_529613 ) ) ( not ( = ?auto_529608 ?auto_529614 ) ) ( not ( = ?auto_529608 ?auto_529615 ) ) ( not ( = ?auto_529608 ?auto_529616 ) ) ( not ( = ?auto_529608 ?auto_529617 ) ) ( not ( = ?auto_529608 ?auto_529618 ) ) ( not ( = ?auto_529609 ?auto_529610 ) ) ( not ( = ?auto_529609 ?auto_529611 ) ) ( not ( = ?auto_529609 ?auto_529612 ) ) ( not ( = ?auto_529609 ?auto_529613 ) ) ( not ( = ?auto_529609 ?auto_529614 ) ) ( not ( = ?auto_529609 ?auto_529615 ) ) ( not ( = ?auto_529609 ?auto_529616 ) ) ( not ( = ?auto_529609 ?auto_529617 ) ) ( not ( = ?auto_529609 ?auto_529618 ) ) ( not ( = ?auto_529610 ?auto_529611 ) ) ( not ( = ?auto_529610 ?auto_529612 ) ) ( not ( = ?auto_529610 ?auto_529613 ) ) ( not ( = ?auto_529610 ?auto_529614 ) ) ( not ( = ?auto_529610 ?auto_529615 ) ) ( not ( = ?auto_529610 ?auto_529616 ) ) ( not ( = ?auto_529610 ?auto_529617 ) ) ( not ( = ?auto_529610 ?auto_529618 ) ) ( not ( = ?auto_529611 ?auto_529612 ) ) ( not ( = ?auto_529611 ?auto_529613 ) ) ( not ( = ?auto_529611 ?auto_529614 ) ) ( not ( = ?auto_529611 ?auto_529615 ) ) ( not ( = ?auto_529611 ?auto_529616 ) ) ( not ( = ?auto_529611 ?auto_529617 ) ) ( not ( = ?auto_529611 ?auto_529618 ) ) ( not ( = ?auto_529612 ?auto_529613 ) ) ( not ( = ?auto_529612 ?auto_529614 ) ) ( not ( = ?auto_529612 ?auto_529615 ) ) ( not ( = ?auto_529612 ?auto_529616 ) ) ( not ( = ?auto_529612 ?auto_529617 ) ) ( not ( = ?auto_529612 ?auto_529618 ) ) ( not ( = ?auto_529613 ?auto_529614 ) ) ( not ( = ?auto_529613 ?auto_529615 ) ) ( not ( = ?auto_529613 ?auto_529616 ) ) ( not ( = ?auto_529613 ?auto_529617 ) ) ( not ( = ?auto_529613 ?auto_529618 ) ) ( not ( = ?auto_529614 ?auto_529615 ) ) ( not ( = ?auto_529614 ?auto_529616 ) ) ( not ( = ?auto_529614 ?auto_529617 ) ) ( not ( = ?auto_529614 ?auto_529618 ) ) ( not ( = ?auto_529615 ?auto_529616 ) ) ( not ( = ?auto_529615 ?auto_529617 ) ) ( not ( = ?auto_529615 ?auto_529618 ) ) ( not ( = ?auto_529616 ?auto_529617 ) ) ( not ( = ?auto_529616 ?auto_529618 ) ) ( not ( = ?auto_529617 ?auto_529618 ) ) ( ON ?auto_529616 ?auto_529617 ) ( ON ?auto_529615 ?auto_529616 ) ( ON ?auto_529614 ?auto_529615 ) ( ON ?auto_529613 ?auto_529614 ) ( ON ?auto_529612 ?auto_529613 ) ( CLEAR ?auto_529610 ) ( ON ?auto_529611 ?auto_529612 ) ( CLEAR ?auto_529611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_529607 ?auto_529608 ?auto_529609 ?auto_529610 ?auto_529611 )
      ( MAKE-11PILE ?auto_529607 ?auto_529608 ?auto_529609 ?auto_529610 ?auto_529611 ?auto_529612 ?auto_529613 ?auto_529614 ?auto_529615 ?auto_529616 ?auto_529617 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529653 - BLOCK
      ?auto_529654 - BLOCK
      ?auto_529655 - BLOCK
      ?auto_529656 - BLOCK
      ?auto_529657 - BLOCK
      ?auto_529658 - BLOCK
      ?auto_529659 - BLOCK
      ?auto_529660 - BLOCK
      ?auto_529661 - BLOCK
      ?auto_529662 - BLOCK
      ?auto_529663 - BLOCK
    )
    :vars
    (
      ?auto_529664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529663 ?auto_529664 ) ( ON-TABLE ?auto_529653 ) ( ON ?auto_529654 ?auto_529653 ) ( ON ?auto_529655 ?auto_529654 ) ( not ( = ?auto_529653 ?auto_529654 ) ) ( not ( = ?auto_529653 ?auto_529655 ) ) ( not ( = ?auto_529653 ?auto_529656 ) ) ( not ( = ?auto_529653 ?auto_529657 ) ) ( not ( = ?auto_529653 ?auto_529658 ) ) ( not ( = ?auto_529653 ?auto_529659 ) ) ( not ( = ?auto_529653 ?auto_529660 ) ) ( not ( = ?auto_529653 ?auto_529661 ) ) ( not ( = ?auto_529653 ?auto_529662 ) ) ( not ( = ?auto_529653 ?auto_529663 ) ) ( not ( = ?auto_529653 ?auto_529664 ) ) ( not ( = ?auto_529654 ?auto_529655 ) ) ( not ( = ?auto_529654 ?auto_529656 ) ) ( not ( = ?auto_529654 ?auto_529657 ) ) ( not ( = ?auto_529654 ?auto_529658 ) ) ( not ( = ?auto_529654 ?auto_529659 ) ) ( not ( = ?auto_529654 ?auto_529660 ) ) ( not ( = ?auto_529654 ?auto_529661 ) ) ( not ( = ?auto_529654 ?auto_529662 ) ) ( not ( = ?auto_529654 ?auto_529663 ) ) ( not ( = ?auto_529654 ?auto_529664 ) ) ( not ( = ?auto_529655 ?auto_529656 ) ) ( not ( = ?auto_529655 ?auto_529657 ) ) ( not ( = ?auto_529655 ?auto_529658 ) ) ( not ( = ?auto_529655 ?auto_529659 ) ) ( not ( = ?auto_529655 ?auto_529660 ) ) ( not ( = ?auto_529655 ?auto_529661 ) ) ( not ( = ?auto_529655 ?auto_529662 ) ) ( not ( = ?auto_529655 ?auto_529663 ) ) ( not ( = ?auto_529655 ?auto_529664 ) ) ( not ( = ?auto_529656 ?auto_529657 ) ) ( not ( = ?auto_529656 ?auto_529658 ) ) ( not ( = ?auto_529656 ?auto_529659 ) ) ( not ( = ?auto_529656 ?auto_529660 ) ) ( not ( = ?auto_529656 ?auto_529661 ) ) ( not ( = ?auto_529656 ?auto_529662 ) ) ( not ( = ?auto_529656 ?auto_529663 ) ) ( not ( = ?auto_529656 ?auto_529664 ) ) ( not ( = ?auto_529657 ?auto_529658 ) ) ( not ( = ?auto_529657 ?auto_529659 ) ) ( not ( = ?auto_529657 ?auto_529660 ) ) ( not ( = ?auto_529657 ?auto_529661 ) ) ( not ( = ?auto_529657 ?auto_529662 ) ) ( not ( = ?auto_529657 ?auto_529663 ) ) ( not ( = ?auto_529657 ?auto_529664 ) ) ( not ( = ?auto_529658 ?auto_529659 ) ) ( not ( = ?auto_529658 ?auto_529660 ) ) ( not ( = ?auto_529658 ?auto_529661 ) ) ( not ( = ?auto_529658 ?auto_529662 ) ) ( not ( = ?auto_529658 ?auto_529663 ) ) ( not ( = ?auto_529658 ?auto_529664 ) ) ( not ( = ?auto_529659 ?auto_529660 ) ) ( not ( = ?auto_529659 ?auto_529661 ) ) ( not ( = ?auto_529659 ?auto_529662 ) ) ( not ( = ?auto_529659 ?auto_529663 ) ) ( not ( = ?auto_529659 ?auto_529664 ) ) ( not ( = ?auto_529660 ?auto_529661 ) ) ( not ( = ?auto_529660 ?auto_529662 ) ) ( not ( = ?auto_529660 ?auto_529663 ) ) ( not ( = ?auto_529660 ?auto_529664 ) ) ( not ( = ?auto_529661 ?auto_529662 ) ) ( not ( = ?auto_529661 ?auto_529663 ) ) ( not ( = ?auto_529661 ?auto_529664 ) ) ( not ( = ?auto_529662 ?auto_529663 ) ) ( not ( = ?auto_529662 ?auto_529664 ) ) ( not ( = ?auto_529663 ?auto_529664 ) ) ( ON ?auto_529662 ?auto_529663 ) ( ON ?auto_529661 ?auto_529662 ) ( ON ?auto_529660 ?auto_529661 ) ( ON ?auto_529659 ?auto_529660 ) ( ON ?auto_529658 ?auto_529659 ) ( ON ?auto_529657 ?auto_529658 ) ( CLEAR ?auto_529655 ) ( ON ?auto_529656 ?auto_529657 ) ( CLEAR ?auto_529656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_529653 ?auto_529654 ?auto_529655 ?auto_529656 )
      ( MAKE-11PILE ?auto_529653 ?auto_529654 ?auto_529655 ?auto_529656 ?auto_529657 ?auto_529658 ?auto_529659 ?auto_529660 ?auto_529661 ?auto_529662 ?auto_529663 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529699 - BLOCK
      ?auto_529700 - BLOCK
      ?auto_529701 - BLOCK
      ?auto_529702 - BLOCK
      ?auto_529703 - BLOCK
      ?auto_529704 - BLOCK
      ?auto_529705 - BLOCK
      ?auto_529706 - BLOCK
      ?auto_529707 - BLOCK
      ?auto_529708 - BLOCK
      ?auto_529709 - BLOCK
    )
    :vars
    (
      ?auto_529710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529709 ?auto_529710 ) ( ON-TABLE ?auto_529699 ) ( ON ?auto_529700 ?auto_529699 ) ( not ( = ?auto_529699 ?auto_529700 ) ) ( not ( = ?auto_529699 ?auto_529701 ) ) ( not ( = ?auto_529699 ?auto_529702 ) ) ( not ( = ?auto_529699 ?auto_529703 ) ) ( not ( = ?auto_529699 ?auto_529704 ) ) ( not ( = ?auto_529699 ?auto_529705 ) ) ( not ( = ?auto_529699 ?auto_529706 ) ) ( not ( = ?auto_529699 ?auto_529707 ) ) ( not ( = ?auto_529699 ?auto_529708 ) ) ( not ( = ?auto_529699 ?auto_529709 ) ) ( not ( = ?auto_529699 ?auto_529710 ) ) ( not ( = ?auto_529700 ?auto_529701 ) ) ( not ( = ?auto_529700 ?auto_529702 ) ) ( not ( = ?auto_529700 ?auto_529703 ) ) ( not ( = ?auto_529700 ?auto_529704 ) ) ( not ( = ?auto_529700 ?auto_529705 ) ) ( not ( = ?auto_529700 ?auto_529706 ) ) ( not ( = ?auto_529700 ?auto_529707 ) ) ( not ( = ?auto_529700 ?auto_529708 ) ) ( not ( = ?auto_529700 ?auto_529709 ) ) ( not ( = ?auto_529700 ?auto_529710 ) ) ( not ( = ?auto_529701 ?auto_529702 ) ) ( not ( = ?auto_529701 ?auto_529703 ) ) ( not ( = ?auto_529701 ?auto_529704 ) ) ( not ( = ?auto_529701 ?auto_529705 ) ) ( not ( = ?auto_529701 ?auto_529706 ) ) ( not ( = ?auto_529701 ?auto_529707 ) ) ( not ( = ?auto_529701 ?auto_529708 ) ) ( not ( = ?auto_529701 ?auto_529709 ) ) ( not ( = ?auto_529701 ?auto_529710 ) ) ( not ( = ?auto_529702 ?auto_529703 ) ) ( not ( = ?auto_529702 ?auto_529704 ) ) ( not ( = ?auto_529702 ?auto_529705 ) ) ( not ( = ?auto_529702 ?auto_529706 ) ) ( not ( = ?auto_529702 ?auto_529707 ) ) ( not ( = ?auto_529702 ?auto_529708 ) ) ( not ( = ?auto_529702 ?auto_529709 ) ) ( not ( = ?auto_529702 ?auto_529710 ) ) ( not ( = ?auto_529703 ?auto_529704 ) ) ( not ( = ?auto_529703 ?auto_529705 ) ) ( not ( = ?auto_529703 ?auto_529706 ) ) ( not ( = ?auto_529703 ?auto_529707 ) ) ( not ( = ?auto_529703 ?auto_529708 ) ) ( not ( = ?auto_529703 ?auto_529709 ) ) ( not ( = ?auto_529703 ?auto_529710 ) ) ( not ( = ?auto_529704 ?auto_529705 ) ) ( not ( = ?auto_529704 ?auto_529706 ) ) ( not ( = ?auto_529704 ?auto_529707 ) ) ( not ( = ?auto_529704 ?auto_529708 ) ) ( not ( = ?auto_529704 ?auto_529709 ) ) ( not ( = ?auto_529704 ?auto_529710 ) ) ( not ( = ?auto_529705 ?auto_529706 ) ) ( not ( = ?auto_529705 ?auto_529707 ) ) ( not ( = ?auto_529705 ?auto_529708 ) ) ( not ( = ?auto_529705 ?auto_529709 ) ) ( not ( = ?auto_529705 ?auto_529710 ) ) ( not ( = ?auto_529706 ?auto_529707 ) ) ( not ( = ?auto_529706 ?auto_529708 ) ) ( not ( = ?auto_529706 ?auto_529709 ) ) ( not ( = ?auto_529706 ?auto_529710 ) ) ( not ( = ?auto_529707 ?auto_529708 ) ) ( not ( = ?auto_529707 ?auto_529709 ) ) ( not ( = ?auto_529707 ?auto_529710 ) ) ( not ( = ?auto_529708 ?auto_529709 ) ) ( not ( = ?auto_529708 ?auto_529710 ) ) ( not ( = ?auto_529709 ?auto_529710 ) ) ( ON ?auto_529708 ?auto_529709 ) ( ON ?auto_529707 ?auto_529708 ) ( ON ?auto_529706 ?auto_529707 ) ( ON ?auto_529705 ?auto_529706 ) ( ON ?auto_529704 ?auto_529705 ) ( ON ?auto_529703 ?auto_529704 ) ( ON ?auto_529702 ?auto_529703 ) ( CLEAR ?auto_529700 ) ( ON ?auto_529701 ?auto_529702 ) ( CLEAR ?auto_529701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_529699 ?auto_529700 ?auto_529701 )
      ( MAKE-11PILE ?auto_529699 ?auto_529700 ?auto_529701 ?auto_529702 ?auto_529703 ?auto_529704 ?auto_529705 ?auto_529706 ?auto_529707 ?auto_529708 ?auto_529709 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529745 - BLOCK
      ?auto_529746 - BLOCK
      ?auto_529747 - BLOCK
      ?auto_529748 - BLOCK
      ?auto_529749 - BLOCK
      ?auto_529750 - BLOCK
      ?auto_529751 - BLOCK
      ?auto_529752 - BLOCK
      ?auto_529753 - BLOCK
      ?auto_529754 - BLOCK
      ?auto_529755 - BLOCK
    )
    :vars
    (
      ?auto_529756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529755 ?auto_529756 ) ( ON-TABLE ?auto_529745 ) ( not ( = ?auto_529745 ?auto_529746 ) ) ( not ( = ?auto_529745 ?auto_529747 ) ) ( not ( = ?auto_529745 ?auto_529748 ) ) ( not ( = ?auto_529745 ?auto_529749 ) ) ( not ( = ?auto_529745 ?auto_529750 ) ) ( not ( = ?auto_529745 ?auto_529751 ) ) ( not ( = ?auto_529745 ?auto_529752 ) ) ( not ( = ?auto_529745 ?auto_529753 ) ) ( not ( = ?auto_529745 ?auto_529754 ) ) ( not ( = ?auto_529745 ?auto_529755 ) ) ( not ( = ?auto_529745 ?auto_529756 ) ) ( not ( = ?auto_529746 ?auto_529747 ) ) ( not ( = ?auto_529746 ?auto_529748 ) ) ( not ( = ?auto_529746 ?auto_529749 ) ) ( not ( = ?auto_529746 ?auto_529750 ) ) ( not ( = ?auto_529746 ?auto_529751 ) ) ( not ( = ?auto_529746 ?auto_529752 ) ) ( not ( = ?auto_529746 ?auto_529753 ) ) ( not ( = ?auto_529746 ?auto_529754 ) ) ( not ( = ?auto_529746 ?auto_529755 ) ) ( not ( = ?auto_529746 ?auto_529756 ) ) ( not ( = ?auto_529747 ?auto_529748 ) ) ( not ( = ?auto_529747 ?auto_529749 ) ) ( not ( = ?auto_529747 ?auto_529750 ) ) ( not ( = ?auto_529747 ?auto_529751 ) ) ( not ( = ?auto_529747 ?auto_529752 ) ) ( not ( = ?auto_529747 ?auto_529753 ) ) ( not ( = ?auto_529747 ?auto_529754 ) ) ( not ( = ?auto_529747 ?auto_529755 ) ) ( not ( = ?auto_529747 ?auto_529756 ) ) ( not ( = ?auto_529748 ?auto_529749 ) ) ( not ( = ?auto_529748 ?auto_529750 ) ) ( not ( = ?auto_529748 ?auto_529751 ) ) ( not ( = ?auto_529748 ?auto_529752 ) ) ( not ( = ?auto_529748 ?auto_529753 ) ) ( not ( = ?auto_529748 ?auto_529754 ) ) ( not ( = ?auto_529748 ?auto_529755 ) ) ( not ( = ?auto_529748 ?auto_529756 ) ) ( not ( = ?auto_529749 ?auto_529750 ) ) ( not ( = ?auto_529749 ?auto_529751 ) ) ( not ( = ?auto_529749 ?auto_529752 ) ) ( not ( = ?auto_529749 ?auto_529753 ) ) ( not ( = ?auto_529749 ?auto_529754 ) ) ( not ( = ?auto_529749 ?auto_529755 ) ) ( not ( = ?auto_529749 ?auto_529756 ) ) ( not ( = ?auto_529750 ?auto_529751 ) ) ( not ( = ?auto_529750 ?auto_529752 ) ) ( not ( = ?auto_529750 ?auto_529753 ) ) ( not ( = ?auto_529750 ?auto_529754 ) ) ( not ( = ?auto_529750 ?auto_529755 ) ) ( not ( = ?auto_529750 ?auto_529756 ) ) ( not ( = ?auto_529751 ?auto_529752 ) ) ( not ( = ?auto_529751 ?auto_529753 ) ) ( not ( = ?auto_529751 ?auto_529754 ) ) ( not ( = ?auto_529751 ?auto_529755 ) ) ( not ( = ?auto_529751 ?auto_529756 ) ) ( not ( = ?auto_529752 ?auto_529753 ) ) ( not ( = ?auto_529752 ?auto_529754 ) ) ( not ( = ?auto_529752 ?auto_529755 ) ) ( not ( = ?auto_529752 ?auto_529756 ) ) ( not ( = ?auto_529753 ?auto_529754 ) ) ( not ( = ?auto_529753 ?auto_529755 ) ) ( not ( = ?auto_529753 ?auto_529756 ) ) ( not ( = ?auto_529754 ?auto_529755 ) ) ( not ( = ?auto_529754 ?auto_529756 ) ) ( not ( = ?auto_529755 ?auto_529756 ) ) ( ON ?auto_529754 ?auto_529755 ) ( ON ?auto_529753 ?auto_529754 ) ( ON ?auto_529752 ?auto_529753 ) ( ON ?auto_529751 ?auto_529752 ) ( ON ?auto_529750 ?auto_529751 ) ( ON ?auto_529749 ?auto_529750 ) ( ON ?auto_529748 ?auto_529749 ) ( ON ?auto_529747 ?auto_529748 ) ( CLEAR ?auto_529745 ) ( ON ?auto_529746 ?auto_529747 ) ( CLEAR ?auto_529746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_529745 ?auto_529746 )
      ( MAKE-11PILE ?auto_529745 ?auto_529746 ?auto_529747 ?auto_529748 ?auto_529749 ?auto_529750 ?auto_529751 ?auto_529752 ?auto_529753 ?auto_529754 ?auto_529755 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_529791 - BLOCK
      ?auto_529792 - BLOCK
      ?auto_529793 - BLOCK
      ?auto_529794 - BLOCK
      ?auto_529795 - BLOCK
      ?auto_529796 - BLOCK
      ?auto_529797 - BLOCK
      ?auto_529798 - BLOCK
      ?auto_529799 - BLOCK
      ?auto_529800 - BLOCK
      ?auto_529801 - BLOCK
    )
    :vars
    (
      ?auto_529802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529801 ?auto_529802 ) ( not ( = ?auto_529791 ?auto_529792 ) ) ( not ( = ?auto_529791 ?auto_529793 ) ) ( not ( = ?auto_529791 ?auto_529794 ) ) ( not ( = ?auto_529791 ?auto_529795 ) ) ( not ( = ?auto_529791 ?auto_529796 ) ) ( not ( = ?auto_529791 ?auto_529797 ) ) ( not ( = ?auto_529791 ?auto_529798 ) ) ( not ( = ?auto_529791 ?auto_529799 ) ) ( not ( = ?auto_529791 ?auto_529800 ) ) ( not ( = ?auto_529791 ?auto_529801 ) ) ( not ( = ?auto_529791 ?auto_529802 ) ) ( not ( = ?auto_529792 ?auto_529793 ) ) ( not ( = ?auto_529792 ?auto_529794 ) ) ( not ( = ?auto_529792 ?auto_529795 ) ) ( not ( = ?auto_529792 ?auto_529796 ) ) ( not ( = ?auto_529792 ?auto_529797 ) ) ( not ( = ?auto_529792 ?auto_529798 ) ) ( not ( = ?auto_529792 ?auto_529799 ) ) ( not ( = ?auto_529792 ?auto_529800 ) ) ( not ( = ?auto_529792 ?auto_529801 ) ) ( not ( = ?auto_529792 ?auto_529802 ) ) ( not ( = ?auto_529793 ?auto_529794 ) ) ( not ( = ?auto_529793 ?auto_529795 ) ) ( not ( = ?auto_529793 ?auto_529796 ) ) ( not ( = ?auto_529793 ?auto_529797 ) ) ( not ( = ?auto_529793 ?auto_529798 ) ) ( not ( = ?auto_529793 ?auto_529799 ) ) ( not ( = ?auto_529793 ?auto_529800 ) ) ( not ( = ?auto_529793 ?auto_529801 ) ) ( not ( = ?auto_529793 ?auto_529802 ) ) ( not ( = ?auto_529794 ?auto_529795 ) ) ( not ( = ?auto_529794 ?auto_529796 ) ) ( not ( = ?auto_529794 ?auto_529797 ) ) ( not ( = ?auto_529794 ?auto_529798 ) ) ( not ( = ?auto_529794 ?auto_529799 ) ) ( not ( = ?auto_529794 ?auto_529800 ) ) ( not ( = ?auto_529794 ?auto_529801 ) ) ( not ( = ?auto_529794 ?auto_529802 ) ) ( not ( = ?auto_529795 ?auto_529796 ) ) ( not ( = ?auto_529795 ?auto_529797 ) ) ( not ( = ?auto_529795 ?auto_529798 ) ) ( not ( = ?auto_529795 ?auto_529799 ) ) ( not ( = ?auto_529795 ?auto_529800 ) ) ( not ( = ?auto_529795 ?auto_529801 ) ) ( not ( = ?auto_529795 ?auto_529802 ) ) ( not ( = ?auto_529796 ?auto_529797 ) ) ( not ( = ?auto_529796 ?auto_529798 ) ) ( not ( = ?auto_529796 ?auto_529799 ) ) ( not ( = ?auto_529796 ?auto_529800 ) ) ( not ( = ?auto_529796 ?auto_529801 ) ) ( not ( = ?auto_529796 ?auto_529802 ) ) ( not ( = ?auto_529797 ?auto_529798 ) ) ( not ( = ?auto_529797 ?auto_529799 ) ) ( not ( = ?auto_529797 ?auto_529800 ) ) ( not ( = ?auto_529797 ?auto_529801 ) ) ( not ( = ?auto_529797 ?auto_529802 ) ) ( not ( = ?auto_529798 ?auto_529799 ) ) ( not ( = ?auto_529798 ?auto_529800 ) ) ( not ( = ?auto_529798 ?auto_529801 ) ) ( not ( = ?auto_529798 ?auto_529802 ) ) ( not ( = ?auto_529799 ?auto_529800 ) ) ( not ( = ?auto_529799 ?auto_529801 ) ) ( not ( = ?auto_529799 ?auto_529802 ) ) ( not ( = ?auto_529800 ?auto_529801 ) ) ( not ( = ?auto_529800 ?auto_529802 ) ) ( not ( = ?auto_529801 ?auto_529802 ) ) ( ON ?auto_529800 ?auto_529801 ) ( ON ?auto_529799 ?auto_529800 ) ( ON ?auto_529798 ?auto_529799 ) ( ON ?auto_529797 ?auto_529798 ) ( ON ?auto_529796 ?auto_529797 ) ( ON ?auto_529795 ?auto_529796 ) ( ON ?auto_529794 ?auto_529795 ) ( ON ?auto_529793 ?auto_529794 ) ( ON ?auto_529792 ?auto_529793 ) ( ON ?auto_529791 ?auto_529792 ) ( CLEAR ?auto_529791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_529791 )
      ( MAKE-11PILE ?auto_529791 ?auto_529792 ?auto_529793 ?auto_529794 ?auto_529795 ?auto_529796 ?auto_529797 ?auto_529798 ?auto_529799 ?auto_529800 ?auto_529801 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_529838 - BLOCK
      ?auto_529839 - BLOCK
      ?auto_529840 - BLOCK
      ?auto_529841 - BLOCK
      ?auto_529842 - BLOCK
      ?auto_529843 - BLOCK
      ?auto_529844 - BLOCK
      ?auto_529845 - BLOCK
      ?auto_529846 - BLOCK
      ?auto_529847 - BLOCK
      ?auto_529848 - BLOCK
      ?auto_529849 - BLOCK
    )
    :vars
    (
      ?auto_529850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_529848 ) ( ON ?auto_529849 ?auto_529850 ) ( CLEAR ?auto_529849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_529838 ) ( ON ?auto_529839 ?auto_529838 ) ( ON ?auto_529840 ?auto_529839 ) ( ON ?auto_529841 ?auto_529840 ) ( ON ?auto_529842 ?auto_529841 ) ( ON ?auto_529843 ?auto_529842 ) ( ON ?auto_529844 ?auto_529843 ) ( ON ?auto_529845 ?auto_529844 ) ( ON ?auto_529846 ?auto_529845 ) ( ON ?auto_529847 ?auto_529846 ) ( ON ?auto_529848 ?auto_529847 ) ( not ( = ?auto_529838 ?auto_529839 ) ) ( not ( = ?auto_529838 ?auto_529840 ) ) ( not ( = ?auto_529838 ?auto_529841 ) ) ( not ( = ?auto_529838 ?auto_529842 ) ) ( not ( = ?auto_529838 ?auto_529843 ) ) ( not ( = ?auto_529838 ?auto_529844 ) ) ( not ( = ?auto_529838 ?auto_529845 ) ) ( not ( = ?auto_529838 ?auto_529846 ) ) ( not ( = ?auto_529838 ?auto_529847 ) ) ( not ( = ?auto_529838 ?auto_529848 ) ) ( not ( = ?auto_529838 ?auto_529849 ) ) ( not ( = ?auto_529838 ?auto_529850 ) ) ( not ( = ?auto_529839 ?auto_529840 ) ) ( not ( = ?auto_529839 ?auto_529841 ) ) ( not ( = ?auto_529839 ?auto_529842 ) ) ( not ( = ?auto_529839 ?auto_529843 ) ) ( not ( = ?auto_529839 ?auto_529844 ) ) ( not ( = ?auto_529839 ?auto_529845 ) ) ( not ( = ?auto_529839 ?auto_529846 ) ) ( not ( = ?auto_529839 ?auto_529847 ) ) ( not ( = ?auto_529839 ?auto_529848 ) ) ( not ( = ?auto_529839 ?auto_529849 ) ) ( not ( = ?auto_529839 ?auto_529850 ) ) ( not ( = ?auto_529840 ?auto_529841 ) ) ( not ( = ?auto_529840 ?auto_529842 ) ) ( not ( = ?auto_529840 ?auto_529843 ) ) ( not ( = ?auto_529840 ?auto_529844 ) ) ( not ( = ?auto_529840 ?auto_529845 ) ) ( not ( = ?auto_529840 ?auto_529846 ) ) ( not ( = ?auto_529840 ?auto_529847 ) ) ( not ( = ?auto_529840 ?auto_529848 ) ) ( not ( = ?auto_529840 ?auto_529849 ) ) ( not ( = ?auto_529840 ?auto_529850 ) ) ( not ( = ?auto_529841 ?auto_529842 ) ) ( not ( = ?auto_529841 ?auto_529843 ) ) ( not ( = ?auto_529841 ?auto_529844 ) ) ( not ( = ?auto_529841 ?auto_529845 ) ) ( not ( = ?auto_529841 ?auto_529846 ) ) ( not ( = ?auto_529841 ?auto_529847 ) ) ( not ( = ?auto_529841 ?auto_529848 ) ) ( not ( = ?auto_529841 ?auto_529849 ) ) ( not ( = ?auto_529841 ?auto_529850 ) ) ( not ( = ?auto_529842 ?auto_529843 ) ) ( not ( = ?auto_529842 ?auto_529844 ) ) ( not ( = ?auto_529842 ?auto_529845 ) ) ( not ( = ?auto_529842 ?auto_529846 ) ) ( not ( = ?auto_529842 ?auto_529847 ) ) ( not ( = ?auto_529842 ?auto_529848 ) ) ( not ( = ?auto_529842 ?auto_529849 ) ) ( not ( = ?auto_529842 ?auto_529850 ) ) ( not ( = ?auto_529843 ?auto_529844 ) ) ( not ( = ?auto_529843 ?auto_529845 ) ) ( not ( = ?auto_529843 ?auto_529846 ) ) ( not ( = ?auto_529843 ?auto_529847 ) ) ( not ( = ?auto_529843 ?auto_529848 ) ) ( not ( = ?auto_529843 ?auto_529849 ) ) ( not ( = ?auto_529843 ?auto_529850 ) ) ( not ( = ?auto_529844 ?auto_529845 ) ) ( not ( = ?auto_529844 ?auto_529846 ) ) ( not ( = ?auto_529844 ?auto_529847 ) ) ( not ( = ?auto_529844 ?auto_529848 ) ) ( not ( = ?auto_529844 ?auto_529849 ) ) ( not ( = ?auto_529844 ?auto_529850 ) ) ( not ( = ?auto_529845 ?auto_529846 ) ) ( not ( = ?auto_529845 ?auto_529847 ) ) ( not ( = ?auto_529845 ?auto_529848 ) ) ( not ( = ?auto_529845 ?auto_529849 ) ) ( not ( = ?auto_529845 ?auto_529850 ) ) ( not ( = ?auto_529846 ?auto_529847 ) ) ( not ( = ?auto_529846 ?auto_529848 ) ) ( not ( = ?auto_529846 ?auto_529849 ) ) ( not ( = ?auto_529846 ?auto_529850 ) ) ( not ( = ?auto_529847 ?auto_529848 ) ) ( not ( = ?auto_529847 ?auto_529849 ) ) ( not ( = ?auto_529847 ?auto_529850 ) ) ( not ( = ?auto_529848 ?auto_529849 ) ) ( not ( = ?auto_529848 ?auto_529850 ) ) ( not ( = ?auto_529849 ?auto_529850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_529849 ?auto_529850 )
      ( !STACK ?auto_529849 ?auto_529848 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_529888 - BLOCK
      ?auto_529889 - BLOCK
      ?auto_529890 - BLOCK
      ?auto_529891 - BLOCK
      ?auto_529892 - BLOCK
      ?auto_529893 - BLOCK
      ?auto_529894 - BLOCK
      ?auto_529895 - BLOCK
      ?auto_529896 - BLOCK
      ?auto_529897 - BLOCK
      ?auto_529898 - BLOCK
      ?auto_529899 - BLOCK
    )
    :vars
    (
      ?auto_529900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529899 ?auto_529900 ) ( ON-TABLE ?auto_529888 ) ( ON ?auto_529889 ?auto_529888 ) ( ON ?auto_529890 ?auto_529889 ) ( ON ?auto_529891 ?auto_529890 ) ( ON ?auto_529892 ?auto_529891 ) ( ON ?auto_529893 ?auto_529892 ) ( ON ?auto_529894 ?auto_529893 ) ( ON ?auto_529895 ?auto_529894 ) ( ON ?auto_529896 ?auto_529895 ) ( ON ?auto_529897 ?auto_529896 ) ( not ( = ?auto_529888 ?auto_529889 ) ) ( not ( = ?auto_529888 ?auto_529890 ) ) ( not ( = ?auto_529888 ?auto_529891 ) ) ( not ( = ?auto_529888 ?auto_529892 ) ) ( not ( = ?auto_529888 ?auto_529893 ) ) ( not ( = ?auto_529888 ?auto_529894 ) ) ( not ( = ?auto_529888 ?auto_529895 ) ) ( not ( = ?auto_529888 ?auto_529896 ) ) ( not ( = ?auto_529888 ?auto_529897 ) ) ( not ( = ?auto_529888 ?auto_529898 ) ) ( not ( = ?auto_529888 ?auto_529899 ) ) ( not ( = ?auto_529888 ?auto_529900 ) ) ( not ( = ?auto_529889 ?auto_529890 ) ) ( not ( = ?auto_529889 ?auto_529891 ) ) ( not ( = ?auto_529889 ?auto_529892 ) ) ( not ( = ?auto_529889 ?auto_529893 ) ) ( not ( = ?auto_529889 ?auto_529894 ) ) ( not ( = ?auto_529889 ?auto_529895 ) ) ( not ( = ?auto_529889 ?auto_529896 ) ) ( not ( = ?auto_529889 ?auto_529897 ) ) ( not ( = ?auto_529889 ?auto_529898 ) ) ( not ( = ?auto_529889 ?auto_529899 ) ) ( not ( = ?auto_529889 ?auto_529900 ) ) ( not ( = ?auto_529890 ?auto_529891 ) ) ( not ( = ?auto_529890 ?auto_529892 ) ) ( not ( = ?auto_529890 ?auto_529893 ) ) ( not ( = ?auto_529890 ?auto_529894 ) ) ( not ( = ?auto_529890 ?auto_529895 ) ) ( not ( = ?auto_529890 ?auto_529896 ) ) ( not ( = ?auto_529890 ?auto_529897 ) ) ( not ( = ?auto_529890 ?auto_529898 ) ) ( not ( = ?auto_529890 ?auto_529899 ) ) ( not ( = ?auto_529890 ?auto_529900 ) ) ( not ( = ?auto_529891 ?auto_529892 ) ) ( not ( = ?auto_529891 ?auto_529893 ) ) ( not ( = ?auto_529891 ?auto_529894 ) ) ( not ( = ?auto_529891 ?auto_529895 ) ) ( not ( = ?auto_529891 ?auto_529896 ) ) ( not ( = ?auto_529891 ?auto_529897 ) ) ( not ( = ?auto_529891 ?auto_529898 ) ) ( not ( = ?auto_529891 ?auto_529899 ) ) ( not ( = ?auto_529891 ?auto_529900 ) ) ( not ( = ?auto_529892 ?auto_529893 ) ) ( not ( = ?auto_529892 ?auto_529894 ) ) ( not ( = ?auto_529892 ?auto_529895 ) ) ( not ( = ?auto_529892 ?auto_529896 ) ) ( not ( = ?auto_529892 ?auto_529897 ) ) ( not ( = ?auto_529892 ?auto_529898 ) ) ( not ( = ?auto_529892 ?auto_529899 ) ) ( not ( = ?auto_529892 ?auto_529900 ) ) ( not ( = ?auto_529893 ?auto_529894 ) ) ( not ( = ?auto_529893 ?auto_529895 ) ) ( not ( = ?auto_529893 ?auto_529896 ) ) ( not ( = ?auto_529893 ?auto_529897 ) ) ( not ( = ?auto_529893 ?auto_529898 ) ) ( not ( = ?auto_529893 ?auto_529899 ) ) ( not ( = ?auto_529893 ?auto_529900 ) ) ( not ( = ?auto_529894 ?auto_529895 ) ) ( not ( = ?auto_529894 ?auto_529896 ) ) ( not ( = ?auto_529894 ?auto_529897 ) ) ( not ( = ?auto_529894 ?auto_529898 ) ) ( not ( = ?auto_529894 ?auto_529899 ) ) ( not ( = ?auto_529894 ?auto_529900 ) ) ( not ( = ?auto_529895 ?auto_529896 ) ) ( not ( = ?auto_529895 ?auto_529897 ) ) ( not ( = ?auto_529895 ?auto_529898 ) ) ( not ( = ?auto_529895 ?auto_529899 ) ) ( not ( = ?auto_529895 ?auto_529900 ) ) ( not ( = ?auto_529896 ?auto_529897 ) ) ( not ( = ?auto_529896 ?auto_529898 ) ) ( not ( = ?auto_529896 ?auto_529899 ) ) ( not ( = ?auto_529896 ?auto_529900 ) ) ( not ( = ?auto_529897 ?auto_529898 ) ) ( not ( = ?auto_529897 ?auto_529899 ) ) ( not ( = ?auto_529897 ?auto_529900 ) ) ( not ( = ?auto_529898 ?auto_529899 ) ) ( not ( = ?auto_529898 ?auto_529900 ) ) ( not ( = ?auto_529899 ?auto_529900 ) ) ( CLEAR ?auto_529897 ) ( ON ?auto_529898 ?auto_529899 ) ( CLEAR ?auto_529898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_529888 ?auto_529889 ?auto_529890 ?auto_529891 ?auto_529892 ?auto_529893 ?auto_529894 ?auto_529895 ?auto_529896 ?auto_529897 ?auto_529898 )
      ( MAKE-12PILE ?auto_529888 ?auto_529889 ?auto_529890 ?auto_529891 ?auto_529892 ?auto_529893 ?auto_529894 ?auto_529895 ?auto_529896 ?auto_529897 ?auto_529898 ?auto_529899 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_529938 - BLOCK
      ?auto_529939 - BLOCK
      ?auto_529940 - BLOCK
      ?auto_529941 - BLOCK
      ?auto_529942 - BLOCK
      ?auto_529943 - BLOCK
      ?auto_529944 - BLOCK
      ?auto_529945 - BLOCK
      ?auto_529946 - BLOCK
      ?auto_529947 - BLOCK
      ?auto_529948 - BLOCK
      ?auto_529949 - BLOCK
    )
    :vars
    (
      ?auto_529950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529949 ?auto_529950 ) ( ON-TABLE ?auto_529938 ) ( ON ?auto_529939 ?auto_529938 ) ( ON ?auto_529940 ?auto_529939 ) ( ON ?auto_529941 ?auto_529940 ) ( ON ?auto_529942 ?auto_529941 ) ( ON ?auto_529943 ?auto_529942 ) ( ON ?auto_529944 ?auto_529943 ) ( ON ?auto_529945 ?auto_529944 ) ( ON ?auto_529946 ?auto_529945 ) ( not ( = ?auto_529938 ?auto_529939 ) ) ( not ( = ?auto_529938 ?auto_529940 ) ) ( not ( = ?auto_529938 ?auto_529941 ) ) ( not ( = ?auto_529938 ?auto_529942 ) ) ( not ( = ?auto_529938 ?auto_529943 ) ) ( not ( = ?auto_529938 ?auto_529944 ) ) ( not ( = ?auto_529938 ?auto_529945 ) ) ( not ( = ?auto_529938 ?auto_529946 ) ) ( not ( = ?auto_529938 ?auto_529947 ) ) ( not ( = ?auto_529938 ?auto_529948 ) ) ( not ( = ?auto_529938 ?auto_529949 ) ) ( not ( = ?auto_529938 ?auto_529950 ) ) ( not ( = ?auto_529939 ?auto_529940 ) ) ( not ( = ?auto_529939 ?auto_529941 ) ) ( not ( = ?auto_529939 ?auto_529942 ) ) ( not ( = ?auto_529939 ?auto_529943 ) ) ( not ( = ?auto_529939 ?auto_529944 ) ) ( not ( = ?auto_529939 ?auto_529945 ) ) ( not ( = ?auto_529939 ?auto_529946 ) ) ( not ( = ?auto_529939 ?auto_529947 ) ) ( not ( = ?auto_529939 ?auto_529948 ) ) ( not ( = ?auto_529939 ?auto_529949 ) ) ( not ( = ?auto_529939 ?auto_529950 ) ) ( not ( = ?auto_529940 ?auto_529941 ) ) ( not ( = ?auto_529940 ?auto_529942 ) ) ( not ( = ?auto_529940 ?auto_529943 ) ) ( not ( = ?auto_529940 ?auto_529944 ) ) ( not ( = ?auto_529940 ?auto_529945 ) ) ( not ( = ?auto_529940 ?auto_529946 ) ) ( not ( = ?auto_529940 ?auto_529947 ) ) ( not ( = ?auto_529940 ?auto_529948 ) ) ( not ( = ?auto_529940 ?auto_529949 ) ) ( not ( = ?auto_529940 ?auto_529950 ) ) ( not ( = ?auto_529941 ?auto_529942 ) ) ( not ( = ?auto_529941 ?auto_529943 ) ) ( not ( = ?auto_529941 ?auto_529944 ) ) ( not ( = ?auto_529941 ?auto_529945 ) ) ( not ( = ?auto_529941 ?auto_529946 ) ) ( not ( = ?auto_529941 ?auto_529947 ) ) ( not ( = ?auto_529941 ?auto_529948 ) ) ( not ( = ?auto_529941 ?auto_529949 ) ) ( not ( = ?auto_529941 ?auto_529950 ) ) ( not ( = ?auto_529942 ?auto_529943 ) ) ( not ( = ?auto_529942 ?auto_529944 ) ) ( not ( = ?auto_529942 ?auto_529945 ) ) ( not ( = ?auto_529942 ?auto_529946 ) ) ( not ( = ?auto_529942 ?auto_529947 ) ) ( not ( = ?auto_529942 ?auto_529948 ) ) ( not ( = ?auto_529942 ?auto_529949 ) ) ( not ( = ?auto_529942 ?auto_529950 ) ) ( not ( = ?auto_529943 ?auto_529944 ) ) ( not ( = ?auto_529943 ?auto_529945 ) ) ( not ( = ?auto_529943 ?auto_529946 ) ) ( not ( = ?auto_529943 ?auto_529947 ) ) ( not ( = ?auto_529943 ?auto_529948 ) ) ( not ( = ?auto_529943 ?auto_529949 ) ) ( not ( = ?auto_529943 ?auto_529950 ) ) ( not ( = ?auto_529944 ?auto_529945 ) ) ( not ( = ?auto_529944 ?auto_529946 ) ) ( not ( = ?auto_529944 ?auto_529947 ) ) ( not ( = ?auto_529944 ?auto_529948 ) ) ( not ( = ?auto_529944 ?auto_529949 ) ) ( not ( = ?auto_529944 ?auto_529950 ) ) ( not ( = ?auto_529945 ?auto_529946 ) ) ( not ( = ?auto_529945 ?auto_529947 ) ) ( not ( = ?auto_529945 ?auto_529948 ) ) ( not ( = ?auto_529945 ?auto_529949 ) ) ( not ( = ?auto_529945 ?auto_529950 ) ) ( not ( = ?auto_529946 ?auto_529947 ) ) ( not ( = ?auto_529946 ?auto_529948 ) ) ( not ( = ?auto_529946 ?auto_529949 ) ) ( not ( = ?auto_529946 ?auto_529950 ) ) ( not ( = ?auto_529947 ?auto_529948 ) ) ( not ( = ?auto_529947 ?auto_529949 ) ) ( not ( = ?auto_529947 ?auto_529950 ) ) ( not ( = ?auto_529948 ?auto_529949 ) ) ( not ( = ?auto_529948 ?auto_529950 ) ) ( not ( = ?auto_529949 ?auto_529950 ) ) ( ON ?auto_529948 ?auto_529949 ) ( CLEAR ?auto_529946 ) ( ON ?auto_529947 ?auto_529948 ) ( CLEAR ?auto_529947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_529938 ?auto_529939 ?auto_529940 ?auto_529941 ?auto_529942 ?auto_529943 ?auto_529944 ?auto_529945 ?auto_529946 ?auto_529947 )
      ( MAKE-12PILE ?auto_529938 ?auto_529939 ?auto_529940 ?auto_529941 ?auto_529942 ?auto_529943 ?auto_529944 ?auto_529945 ?auto_529946 ?auto_529947 ?auto_529948 ?auto_529949 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_529988 - BLOCK
      ?auto_529989 - BLOCK
      ?auto_529990 - BLOCK
      ?auto_529991 - BLOCK
      ?auto_529992 - BLOCK
      ?auto_529993 - BLOCK
      ?auto_529994 - BLOCK
      ?auto_529995 - BLOCK
      ?auto_529996 - BLOCK
      ?auto_529997 - BLOCK
      ?auto_529998 - BLOCK
      ?auto_529999 - BLOCK
    )
    :vars
    (
      ?auto_530000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_529999 ?auto_530000 ) ( ON-TABLE ?auto_529988 ) ( ON ?auto_529989 ?auto_529988 ) ( ON ?auto_529990 ?auto_529989 ) ( ON ?auto_529991 ?auto_529990 ) ( ON ?auto_529992 ?auto_529991 ) ( ON ?auto_529993 ?auto_529992 ) ( ON ?auto_529994 ?auto_529993 ) ( ON ?auto_529995 ?auto_529994 ) ( not ( = ?auto_529988 ?auto_529989 ) ) ( not ( = ?auto_529988 ?auto_529990 ) ) ( not ( = ?auto_529988 ?auto_529991 ) ) ( not ( = ?auto_529988 ?auto_529992 ) ) ( not ( = ?auto_529988 ?auto_529993 ) ) ( not ( = ?auto_529988 ?auto_529994 ) ) ( not ( = ?auto_529988 ?auto_529995 ) ) ( not ( = ?auto_529988 ?auto_529996 ) ) ( not ( = ?auto_529988 ?auto_529997 ) ) ( not ( = ?auto_529988 ?auto_529998 ) ) ( not ( = ?auto_529988 ?auto_529999 ) ) ( not ( = ?auto_529988 ?auto_530000 ) ) ( not ( = ?auto_529989 ?auto_529990 ) ) ( not ( = ?auto_529989 ?auto_529991 ) ) ( not ( = ?auto_529989 ?auto_529992 ) ) ( not ( = ?auto_529989 ?auto_529993 ) ) ( not ( = ?auto_529989 ?auto_529994 ) ) ( not ( = ?auto_529989 ?auto_529995 ) ) ( not ( = ?auto_529989 ?auto_529996 ) ) ( not ( = ?auto_529989 ?auto_529997 ) ) ( not ( = ?auto_529989 ?auto_529998 ) ) ( not ( = ?auto_529989 ?auto_529999 ) ) ( not ( = ?auto_529989 ?auto_530000 ) ) ( not ( = ?auto_529990 ?auto_529991 ) ) ( not ( = ?auto_529990 ?auto_529992 ) ) ( not ( = ?auto_529990 ?auto_529993 ) ) ( not ( = ?auto_529990 ?auto_529994 ) ) ( not ( = ?auto_529990 ?auto_529995 ) ) ( not ( = ?auto_529990 ?auto_529996 ) ) ( not ( = ?auto_529990 ?auto_529997 ) ) ( not ( = ?auto_529990 ?auto_529998 ) ) ( not ( = ?auto_529990 ?auto_529999 ) ) ( not ( = ?auto_529990 ?auto_530000 ) ) ( not ( = ?auto_529991 ?auto_529992 ) ) ( not ( = ?auto_529991 ?auto_529993 ) ) ( not ( = ?auto_529991 ?auto_529994 ) ) ( not ( = ?auto_529991 ?auto_529995 ) ) ( not ( = ?auto_529991 ?auto_529996 ) ) ( not ( = ?auto_529991 ?auto_529997 ) ) ( not ( = ?auto_529991 ?auto_529998 ) ) ( not ( = ?auto_529991 ?auto_529999 ) ) ( not ( = ?auto_529991 ?auto_530000 ) ) ( not ( = ?auto_529992 ?auto_529993 ) ) ( not ( = ?auto_529992 ?auto_529994 ) ) ( not ( = ?auto_529992 ?auto_529995 ) ) ( not ( = ?auto_529992 ?auto_529996 ) ) ( not ( = ?auto_529992 ?auto_529997 ) ) ( not ( = ?auto_529992 ?auto_529998 ) ) ( not ( = ?auto_529992 ?auto_529999 ) ) ( not ( = ?auto_529992 ?auto_530000 ) ) ( not ( = ?auto_529993 ?auto_529994 ) ) ( not ( = ?auto_529993 ?auto_529995 ) ) ( not ( = ?auto_529993 ?auto_529996 ) ) ( not ( = ?auto_529993 ?auto_529997 ) ) ( not ( = ?auto_529993 ?auto_529998 ) ) ( not ( = ?auto_529993 ?auto_529999 ) ) ( not ( = ?auto_529993 ?auto_530000 ) ) ( not ( = ?auto_529994 ?auto_529995 ) ) ( not ( = ?auto_529994 ?auto_529996 ) ) ( not ( = ?auto_529994 ?auto_529997 ) ) ( not ( = ?auto_529994 ?auto_529998 ) ) ( not ( = ?auto_529994 ?auto_529999 ) ) ( not ( = ?auto_529994 ?auto_530000 ) ) ( not ( = ?auto_529995 ?auto_529996 ) ) ( not ( = ?auto_529995 ?auto_529997 ) ) ( not ( = ?auto_529995 ?auto_529998 ) ) ( not ( = ?auto_529995 ?auto_529999 ) ) ( not ( = ?auto_529995 ?auto_530000 ) ) ( not ( = ?auto_529996 ?auto_529997 ) ) ( not ( = ?auto_529996 ?auto_529998 ) ) ( not ( = ?auto_529996 ?auto_529999 ) ) ( not ( = ?auto_529996 ?auto_530000 ) ) ( not ( = ?auto_529997 ?auto_529998 ) ) ( not ( = ?auto_529997 ?auto_529999 ) ) ( not ( = ?auto_529997 ?auto_530000 ) ) ( not ( = ?auto_529998 ?auto_529999 ) ) ( not ( = ?auto_529998 ?auto_530000 ) ) ( not ( = ?auto_529999 ?auto_530000 ) ) ( ON ?auto_529998 ?auto_529999 ) ( ON ?auto_529997 ?auto_529998 ) ( CLEAR ?auto_529995 ) ( ON ?auto_529996 ?auto_529997 ) ( CLEAR ?auto_529996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_529988 ?auto_529989 ?auto_529990 ?auto_529991 ?auto_529992 ?auto_529993 ?auto_529994 ?auto_529995 ?auto_529996 )
      ( MAKE-12PILE ?auto_529988 ?auto_529989 ?auto_529990 ?auto_529991 ?auto_529992 ?auto_529993 ?auto_529994 ?auto_529995 ?auto_529996 ?auto_529997 ?auto_529998 ?auto_529999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530038 - BLOCK
      ?auto_530039 - BLOCK
      ?auto_530040 - BLOCK
      ?auto_530041 - BLOCK
      ?auto_530042 - BLOCK
      ?auto_530043 - BLOCK
      ?auto_530044 - BLOCK
      ?auto_530045 - BLOCK
      ?auto_530046 - BLOCK
      ?auto_530047 - BLOCK
      ?auto_530048 - BLOCK
      ?auto_530049 - BLOCK
    )
    :vars
    (
      ?auto_530050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530049 ?auto_530050 ) ( ON-TABLE ?auto_530038 ) ( ON ?auto_530039 ?auto_530038 ) ( ON ?auto_530040 ?auto_530039 ) ( ON ?auto_530041 ?auto_530040 ) ( ON ?auto_530042 ?auto_530041 ) ( ON ?auto_530043 ?auto_530042 ) ( ON ?auto_530044 ?auto_530043 ) ( not ( = ?auto_530038 ?auto_530039 ) ) ( not ( = ?auto_530038 ?auto_530040 ) ) ( not ( = ?auto_530038 ?auto_530041 ) ) ( not ( = ?auto_530038 ?auto_530042 ) ) ( not ( = ?auto_530038 ?auto_530043 ) ) ( not ( = ?auto_530038 ?auto_530044 ) ) ( not ( = ?auto_530038 ?auto_530045 ) ) ( not ( = ?auto_530038 ?auto_530046 ) ) ( not ( = ?auto_530038 ?auto_530047 ) ) ( not ( = ?auto_530038 ?auto_530048 ) ) ( not ( = ?auto_530038 ?auto_530049 ) ) ( not ( = ?auto_530038 ?auto_530050 ) ) ( not ( = ?auto_530039 ?auto_530040 ) ) ( not ( = ?auto_530039 ?auto_530041 ) ) ( not ( = ?auto_530039 ?auto_530042 ) ) ( not ( = ?auto_530039 ?auto_530043 ) ) ( not ( = ?auto_530039 ?auto_530044 ) ) ( not ( = ?auto_530039 ?auto_530045 ) ) ( not ( = ?auto_530039 ?auto_530046 ) ) ( not ( = ?auto_530039 ?auto_530047 ) ) ( not ( = ?auto_530039 ?auto_530048 ) ) ( not ( = ?auto_530039 ?auto_530049 ) ) ( not ( = ?auto_530039 ?auto_530050 ) ) ( not ( = ?auto_530040 ?auto_530041 ) ) ( not ( = ?auto_530040 ?auto_530042 ) ) ( not ( = ?auto_530040 ?auto_530043 ) ) ( not ( = ?auto_530040 ?auto_530044 ) ) ( not ( = ?auto_530040 ?auto_530045 ) ) ( not ( = ?auto_530040 ?auto_530046 ) ) ( not ( = ?auto_530040 ?auto_530047 ) ) ( not ( = ?auto_530040 ?auto_530048 ) ) ( not ( = ?auto_530040 ?auto_530049 ) ) ( not ( = ?auto_530040 ?auto_530050 ) ) ( not ( = ?auto_530041 ?auto_530042 ) ) ( not ( = ?auto_530041 ?auto_530043 ) ) ( not ( = ?auto_530041 ?auto_530044 ) ) ( not ( = ?auto_530041 ?auto_530045 ) ) ( not ( = ?auto_530041 ?auto_530046 ) ) ( not ( = ?auto_530041 ?auto_530047 ) ) ( not ( = ?auto_530041 ?auto_530048 ) ) ( not ( = ?auto_530041 ?auto_530049 ) ) ( not ( = ?auto_530041 ?auto_530050 ) ) ( not ( = ?auto_530042 ?auto_530043 ) ) ( not ( = ?auto_530042 ?auto_530044 ) ) ( not ( = ?auto_530042 ?auto_530045 ) ) ( not ( = ?auto_530042 ?auto_530046 ) ) ( not ( = ?auto_530042 ?auto_530047 ) ) ( not ( = ?auto_530042 ?auto_530048 ) ) ( not ( = ?auto_530042 ?auto_530049 ) ) ( not ( = ?auto_530042 ?auto_530050 ) ) ( not ( = ?auto_530043 ?auto_530044 ) ) ( not ( = ?auto_530043 ?auto_530045 ) ) ( not ( = ?auto_530043 ?auto_530046 ) ) ( not ( = ?auto_530043 ?auto_530047 ) ) ( not ( = ?auto_530043 ?auto_530048 ) ) ( not ( = ?auto_530043 ?auto_530049 ) ) ( not ( = ?auto_530043 ?auto_530050 ) ) ( not ( = ?auto_530044 ?auto_530045 ) ) ( not ( = ?auto_530044 ?auto_530046 ) ) ( not ( = ?auto_530044 ?auto_530047 ) ) ( not ( = ?auto_530044 ?auto_530048 ) ) ( not ( = ?auto_530044 ?auto_530049 ) ) ( not ( = ?auto_530044 ?auto_530050 ) ) ( not ( = ?auto_530045 ?auto_530046 ) ) ( not ( = ?auto_530045 ?auto_530047 ) ) ( not ( = ?auto_530045 ?auto_530048 ) ) ( not ( = ?auto_530045 ?auto_530049 ) ) ( not ( = ?auto_530045 ?auto_530050 ) ) ( not ( = ?auto_530046 ?auto_530047 ) ) ( not ( = ?auto_530046 ?auto_530048 ) ) ( not ( = ?auto_530046 ?auto_530049 ) ) ( not ( = ?auto_530046 ?auto_530050 ) ) ( not ( = ?auto_530047 ?auto_530048 ) ) ( not ( = ?auto_530047 ?auto_530049 ) ) ( not ( = ?auto_530047 ?auto_530050 ) ) ( not ( = ?auto_530048 ?auto_530049 ) ) ( not ( = ?auto_530048 ?auto_530050 ) ) ( not ( = ?auto_530049 ?auto_530050 ) ) ( ON ?auto_530048 ?auto_530049 ) ( ON ?auto_530047 ?auto_530048 ) ( ON ?auto_530046 ?auto_530047 ) ( CLEAR ?auto_530044 ) ( ON ?auto_530045 ?auto_530046 ) ( CLEAR ?auto_530045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_530038 ?auto_530039 ?auto_530040 ?auto_530041 ?auto_530042 ?auto_530043 ?auto_530044 ?auto_530045 )
      ( MAKE-12PILE ?auto_530038 ?auto_530039 ?auto_530040 ?auto_530041 ?auto_530042 ?auto_530043 ?auto_530044 ?auto_530045 ?auto_530046 ?auto_530047 ?auto_530048 ?auto_530049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530088 - BLOCK
      ?auto_530089 - BLOCK
      ?auto_530090 - BLOCK
      ?auto_530091 - BLOCK
      ?auto_530092 - BLOCK
      ?auto_530093 - BLOCK
      ?auto_530094 - BLOCK
      ?auto_530095 - BLOCK
      ?auto_530096 - BLOCK
      ?auto_530097 - BLOCK
      ?auto_530098 - BLOCK
      ?auto_530099 - BLOCK
    )
    :vars
    (
      ?auto_530100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530099 ?auto_530100 ) ( ON-TABLE ?auto_530088 ) ( ON ?auto_530089 ?auto_530088 ) ( ON ?auto_530090 ?auto_530089 ) ( ON ?auto_530091 ?auto_530090 ) ( ON ?auto_530092 ?auto_530091 ) ( ON ?auto_530093 ?auto_530092 ) ( not ( = ?auto_530088 ?auto_530089 ) ) ( not ( = ?auto_530088 ?auto_530090 ) ) ( not ( = ?auto_530088 ?auto_530091 ) ) ( not ( = ?auto_530088 ?auto_530092 ) ) ( not ( = ?auto_530088 ?auto_530093 ) ) ( not ( = ?auto_530088 ?auto_530094 ) ) ( not ( = ?auto_530088 ?auto_530095 ) ) ( not ( = ?auto_530088 ?auto_530096 ) ) ( not ( = ?auto_530088 ?auto_530097 ) ) ( not ( = ?auto_530088 ?auto_530098 ) ) ( not ( = ?auto_530088 ?auto_530099 ) ) ( not ( = ?auto_530088 ?auto_530100 ) ) ( not ( = ?auto_530089 ?auto_530090 ) ) ( not ( = ?auto_530089 ?auto_530091 ) ) ( not ( = ?auto_530089 ?auto_530092 ) ) ( not ( = ?auto_530089 ?auto_530093 ) ) ( not ( = ?auto_530089 ?auto_530094 ) ) ( not ( = ?auto_530089 ?auto_530095 ) ) ( not ( = ?auto_530089 ?auto_530096 ) ) ( not ( = ?auto_530089 ?auto_530097 ) ) ( not ( = ?auto_530089 ?auto_530098 ) ) ( not ( = ?auto_530089 ?auto_530099 ) ) ( not ( = ?auto_530089 ?auto_530100 ) ) ( not ( = ?auto_530090 ?auto_530091 ) ) ( not ( = ?auto_530090 ?auto_530092 ) ) ( not ( = ?auto_530090 ?auto_530093 ) ) ( not ( = ?auto_530090 ?auto_530094 ) ) ( not ( = ?auto_530090 ?auto_530095 ) ) ( not ( = ?auto_530090 ?auto_530096 ) ) ( not ( = ?auto_530090 ?auto_530097 ) ) ( not ( = ?auto_530090 ?auto_530098 ) ) ( not ( = ?auto_530090 ?auto_530099 ) ) ( not ( = ?auto_530090 ?auto_530100 ) ) ( not ( = ?auto_530091 ?auto_530092 ) ) ( not ( = ?auto_530091 ?auto_530093 ) ) ( not ( = ?auto_530091 ?auto_530094 ) ) ( not ( = ?auto_530091 ?auto_530095 ) ) ( not ( = ?auto_530091 ?auto_530096 ) ) ( not ( = ?auto_530091 ?auto_530097 ) ) ( not ( = ?auto_530091 ?auto_530098 ) ) ( not ( = ?auto_530091 ?auto_530099 ) ) ( not ( = ?auto_530091 ?auto_530100 ) ) ( not ( = ?auto_530092 ?auto_530093 ) ) ( not ( = ?auto_530092 ?auto_530094 ) ) ( not ( = ?auto_530092 ?auto_530095 ) ) ( not ( = ?auto_530092 ?auto_530096 ) ) ( not ( = ?auto_530092 ?auto_530097 ) ) ( not ( = ?auto_530092 ?auto_530098 ) ) ( not ( = ?auto_530092 ?auto_530099 ) ) ( not ( = ?auto_530092 ?auto_530100 ) ) ( not ( = ?auto_530093 ?auto_530094 ) ) ( not ( = ?auto_530093 ?auto_530095 ) ) ( not ( = ?auto_530093 ?auto_530096 ) ) ( not ( = ?auto_530093 ?auto_530097 ) ) ( not ( = ?auto_530093 ?auto_530098 ) ) ( not ( = ?auto_530093 ?auto_530099 ) ) ( not ( = ?auto_530093 ?auto_530100 ) ) ( not ( = ?auto_530094 ?auto_530095 ) ) ( not ( = ?auto_530094 ?auto_530096 ) ) ( not ( = ?auto_530094 ?auto_530097 ) ) ( not ( = ?auto_530094 ?auto_530098 ) ) ( not ( = ?auto_530094 ?auto_530099 ) ) ( not ( = ?auto_530094 ?auto_530100 ) ) ( not ( = ?auto_530095 ?auto_530096 ) ) ( not ( = ?auto_530095 ?auto_530097 ) ) ( not ( = ?auto_530095 ?auto_530098 ) ) ( not ( = ?auto_530095 ?auto_530099 ) ) ( not ( = ?auto_530095 ?auto_530100 ) ) ( not ( = ?auto_530096 ?auto_530097 ) ) ( not ( = ?auto_530096 ?auto_530098 ) ) ( not ( = ?auto_530096 ?auto_530099 ) ) ( not ( = ?auto_530096 ?auto_530100 ) ) ( not ( = ?auto_530097 ?auto_530098 ) ) ( not ( = ?auto_530097 ?auto_530099 ) ) ( not ( = ?auto_530097 ?auto_530100 ) ) ( not ( = ?auto_530098 ?auto_530099 ) ) ( not ( = ?auto_530098 ?auto_530100 ) ) ( not ( = ?auto_530099 ?auto_530100 ) ) ( ON ?auto_530098 ?auto_530099 ) ( ON ?auto_530097 ?auto_530098 ) ( ON ?auto_530096 ?auto_530097 ) ( ON ?auto_530095 ?auto_530096 ) ( CLEAR ?auto_530093 ) ( ON ?auto_530094 ?auto_530095 ) ( CLEAR ?auto_530094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_530088 ?auto_530089 ?auto_530090 ?auto_530091 ?auto_530092 ?auto_530093 ?auto_530094 )
      ( MAKE-12PILE ?auto_530088 ?auto_530089 ?auto_530090 ?auto_530091 ?auto_530092 ?auto_530093 ?auto_530094 ?auto_530095 ?auto_530096 ?auto_530097 ?auto_530098 ?auto_530099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530138 - BLOCK
      ?auto_530139 - BLOCK
      ?auto_530140 - BLOCK
      ?auto_530141 - BLOCK
      ?auto_530142 - BLOCK
      ?auto_530143 - BLOCK
      ?auto_530144 - BLOCK
      ?auto_530145 - BLOCK
      ?auto_530146 - BLOCK
      ?auto_530147 - BLOCK
      ?auto_530148 - BLOCK
      ?auto_530149 - BLOCK
    )
    :vars
    (
      ?auto_530150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530149 ?auto_530150 ) ( ON-TABLE ?auto_530138 ) ( ON ?auto_530139 ?auto_530138 ) ( ON ?auto_530140 ?auto_530139 ) ( ON ?auto_530141 ?auto_530140 ) ( ON ?auto_530142 ?auto_530141 ) ( not ( = ?auto_530138 ?auto_530139 ) ) ( not ( = ?auto_530138 ?auto_530140 ) ) ( not ( = ?auto_530138 ?auto_530141 ) ) ( not ( = ?auto_530138 ?auto_530142 ) ) ( not ( = ?auto_530138 ?auto_530143 ) ) ( not ( = ?auto_530138 ?auto_530144 ) ) ( not ( = ?auto_530138 ?auto_530145 ) ) ( not ( = ?auto_530138 ?auto_530146 ) ) ( not ( = ?auto_530138 ?auto_530147 ) ) ( not ( = ?auto_530138 ?auto_530148 ) ) ( not ( = ?auto_530138 ?auto_530149 ) ) ( not ( = ?auto_530138 ?auto_530150 ) ) ( not ( = ?auto_530139 ?auto_530140 ) ) ( not ( = ?auto_530139 ?auto_530141 ) ) ( not ( = ?auto_530139 ?auto_530142 ) ) ( not ( = ?auto_530139 ?auto_530143 ) ) ( not ( = ?auto_530139 ?auto_530144 ) ) ( not ( = ?auto_530139 ?auto_530145 ) ) ( not ( = ?auto_530139 ?auto_530146 ) ) ( not ( = ?auto_530139 ?auto_530147 ) ) ( not ( = ?auto_530139 ?auto_530148 ) ) ( not ( = ?auto_530139 ?auto_530149 ) ) ( not ( = ?auto_530139 ?auto_530150 ) ) ( not ( = ?auto_530140 ?auto_530141 ) ) ( not ( = ?auto_530140 ?auto_530142 ) ) ( not ( = ?auto_530140 ?auto_530143 ) ) ( not ( = ?auto_530140 ?auto_530144 ) ) ( not ( = ?auto_530140 ?auto_530145 ) ) ( not ( = ?auto_530140 ?auto_530146 ) ) ( not ( = ?auto_530140 ?auto_530147 ) ) ( not ( = ?auto_530140 ?auto_530148 ) ) ( not ( = ?auto_530140 ?auto_530149 ) ) ( not ( = ?auto_530140 ?auto_530150 ) ) ( not ( = ?auto_530141 ?auto_530142 ) ) ( not ( = ?auto_530141 ?auto_530143 ) ) ( not ( = ?auto_530141 ?auto_530144 ) ) ( not ( = ?auto_530141 ?auto_530145 ) ) ( not ( = ?auto_530141 ?auto_530146 ) ) ( not ( = ?auto_530141 ?auto_530147 ) ) ( not ( = ?auto_530141 ?auto_530148 ) ) ( not ( = ?auto_530141 ?auto_530149 ) ) ( not ( = ?auto_530141 ?auto_530150 ) ) ( not ( = ?auto_530142 ?auto_530143 ) ) ( not ( = ?auto_530142 ?auto_530144 ) ) ( not ( = ?auto_530142 ?auto_530145 ) ) ( not ( = ?auto_530142 ?auto_530146 ) ) ( not ( = ?auto_530142 ?auto_530147 ) ) ( not ( = ?auto_530142 ?auto_530148 ) ) ( not ( = ?auto_530142 ?auto_530149 ) ) ( not ( = ?auto_530142 ?auto_530150 ) ) ( not ( = ?auto_530143 ?auto_530144 ) ) ( not ( = ?auto_530143 ?auto_530145 ) ) ( not ( = ?auto_530143 ?auto_530146 ) ) ( not ( = ?auto_530143 ?auto_530147 ) ) ( not ( = ?auto_530143 ?auto_530148 ) ) ( not ( = ?auto_530143 ?auto_530149 ) ) ( not ( = ?auto_530143 ?auto_530150 ) ) ( not ( = ?auto_530144 ?auto_530145 ) ) ( not ( = ?auto_530144 ?auto_530146 ) ) ( not ( = ?auto_530144 ?auto_530147 ) ) ( not ( = ?auto_530144 ?auto_530148 ) ) ( not ( = ?auto_530144 ?auto_530149 ) ) ( not ( = ?auto_530144 ?auto_530150 ) ) ( not ( = ?auto_530145 ?auto_530146 ) ) ( not ( = ?auto_530145 ?auto_530147 ) ) ( not ( = ?auto_530145 ?auto_530148 ) ) ( not ( = ?auto_530145 ?auto_530149 ) ) ( not ( = ?auto_530145 ?auto_530150 ) ) ( not ( = ?auto_530146 ?auto_530147 ) ) ( not ( = ?auto_530146 ?auto_530148 ) ) ( not ( = ?auto_530146 ?auto_530149 ) ) ( not ( = ?auto_530146 ?auto_530150 ) ) ( not ( = ?auto_530147 ?auto_530148 ) ) ( not ( = ?auto_530147 ?auto_530149 ) ) ( not ( = ?auto_530147 ?auto_530150 ) ) ( not ( = ?auto_530148 ?auto_530149 ) ) ( not ( = ?auto_530148 ?auto_530150 ) ) ( not ( = ?auto_530149 ?auto_530150 ) ) ( ON ?auto_530148 ?auto_530149 ) ( ON ?auto_530147 ?auto_530148 ) ( ON ?auto_530146 ?auto_530147 ) ( ON ?auto_530145 ?auto_530146 ) ( ON ?auto_530144 ?auto_530145 ) ( CLEAR ?auto_530142 ) ( ON ?auto_530143 ?auto_530144 ) ( CLEAR ?auto_530143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_530138 ?auto_530139 ?auto_530140 ?auto_530141 ?auto_530142 ?auto_530143 )
      ( MAKE-12PILE ?auto_530138 ?auto_530139 ?auto_530140 ?auto_530141 ?auto_530142 ?auto_530143 ?auto_530144 ?auto_530145 ?auto_530146 ?auto_530147 ?auto_530148 ?auto_530149 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530188 - BLOCK
      ?auto_530189 - BLOCK
      ?auto_530190 - BLOCK
      ?auto_530191 - BLOCK
      ?auto_530192 - BLOCK
      ?auto_530193 - BLOCK
      ?auto_530194 - BLOCK
      ?auto_530195 - BLOCK
      ?auto_530196 - BLOCK
      ?auto_530197 - BLOCK
      ?auto_530198 - BLOCK
      ?auto_530199 - BLOCK
    )
    :vars
    (
      ?auto_530200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530199 ?auto_530200 ) ( ON-TABLE ?auto_530188 ) ( ON ?auto_530189 ?auto_530188 ) ( ON ?auto_530190 ?auto_530189 ) ( ON ?auto_530191 ?auto_530190 ) ( not ( = ?auto_530188 ?auto_530189 ) ) ( not ( = ?auto_530188 ?auto_530190 ) ) ( not ( = ?auto_530188 ?auto_530191 ) ) ( not ( = ?auto_530188 ?auto_530192 ) ) ( not ( = ?auto_530188 ?auto_530193 ) ) ( not ( = ?auto_530188 ?auto_530194 ) ) ( not ( = ?auto_530188 ?auto_530195 ) ) ( not ( = ?auto_530188 ?auto_530196 ) ) ( not ( = ?auto_530188 ?auto_530197 ) ) ( not ( = ?auto_530188 ?auto_530198 ) ) ( not ( = ?auto_530188 ?auto_530199 ) ) ( not ( = ?auto_530188 ?auto_530200 ) ) ( not ( = ?auto_530189 ?auto_530190 ) ) ( not ( = ?auto_530189 ?auto_530191 ) ) ( not ( = ?auto_530189 ?auto_530192 ) ) ( not ( = ?auto_530189 ?auto_530193 ) ) ( not ( = ?auto_530189 ?auto_530194 ) ) ( not ( = ?auto_530189 ?auto_530195 ) ) ( not ( = ?auto_530189 ?auto_530196 ) ) ( not ( = ?auto_530189 ?auto_530197 ) ) ( not ( = ?auto_530189 ?auto_530198 ) ) ( not ( = ?auto_530189 ?auto_530199 ) ) ( not ( = ?auto_530189 ?auto_530200 ) ) ( not ( = ?auto_530190 ?auto_530191 ) ) ( not ( = ?auto_530190 ?auto_530192 ) ) ( not ( = ?auto_530190 ?auto_530193 ) ) ( not ( = ?auto_530190 ?auto_530194 ) ) ( not ( = ?auto_530190 ?auto_530195 ) ) ( not ( = ?auto_530190 ?auto_530196 ) ) ( not ( = ?auto_530190 ?auto_530197 ) ) ( not ( = ?auto_530190 ?auto_530198 ) ) ( not ( = ?auto_530190 ?auto_530199 ) ) ( not ( = ?auto_530190 ?auto_530200 ) ) ( not ( = ?auto_530191 ?auto_530192 ) ) ( not ( = ?auto_530191 ?auto_530193 ) ) ( not ( = ?auto_530191 ?auto_530194 ) ) ( not ( = ?auto_530191 ?auto_530195 ) ) ( not ( = ?auto_530191 ?auto_530196 ) ) ( not ( = ?auto_530191 ?auto_530197 ) ) ( not ( = ?auto_530191 ?auto_530198 ) ) ( not ( = ?auto_530191 ?auto_530199 ) ) ( not ( = ?auto_530191 ?auto_530200 ) ) ( not ( = ?auto_530192 ?auto_530193 ) ) ( not ( = ?auto_530192 ?auto_530194 ) ) ( not ( = ?auto_530192 ?auto_530195 ) ) ( not ( = ?auto_530192 ?auto_530196 ) ) ( not ( = ?auto_530192 ?auto_530197 ) ) ( not ( = ?auto_530192 ?auto_530198 ) ) ( not ( = ?auto_530192 ?auto_530199 ) ) ( not ( = ?auto_530192 ?auto_530200 ) ) ( not ( = ?auto_530193 ?auto_530194 ) ) ( not ( = ?auto_530193 ?auto_530195 ) ) ( not ( = ?auto_530193 ?auto_530196 ) ) ( not ( = ?auto_530193 ?auto_530197 ) ) ( not ( = ?auto_530193 ?auto_530198 ) ) ( not ( = ?auto_530193 ?auto_530199 ) ) ( not ( = ?auto_530193 ?auto_530200 ) ) ( not ( = ?auto_530194 ?auto_530195 ) ) ( not ( = ?auto_530194 ?auto_530196 ) ) ( not ( = ?auto_530194 ?auto_530197 ) ) ( not ( = ?auto_530194 ?auto_530198 ) ) ( not ( = ?auto_530194 ?auto_530199 ) ) ( not ( = ?auto_530194 ?auto_530200 ) ) ( not ( = ?auto_530195 ?auto_530196 ) ) ( not ( = ?auto_530195 ?auto_530197 ) ) ( not ( = ?auto_530195 ?auto_530198 ) ) ( not ( = ?auto_530195 ?auto_530199 ) ) ( not ( = ?auto_530195 ?auto_530200 ) ) ( not ( = ?auto_530196 ?auto_530197 ) ) ( not ( = ?auto_530196 ?auto_530198 ) ) ( not ( = ?auto_530196 ?auto_530199 ) ) ( not ( = ?auto_530196 ?auto_530200 ) ) ( not ( = ?auto_530197 ?auto_530198 ) ) ( not ( = ?auto_530197 ?auto_530199 ) ) ( not ( = ?auto_530197 ?auto_530200 ) ) ( not ( = ?auto_530198 ?auto_530199 ) ) ( not ( = ?auto_530198 ?auto_530200 ) ) ( not ( = ?auto_530199 ?auto_530200 ) ) ( ON ?auto_530198 ?auto_530199 ) ( ON ?auto_530197 ?auto_530198 ) ( ON ?auto_530196 ?auto_530197 ) ( ON ?auto_530195 ?auto_530196 ) ( ON ?auto_530194 ?auto_530195 ) ( ON ?auto_530193 ?auto_530194 ) ( CLEAR ?auto_530191 ) ( ON ?auto_530192 ?auto_530193 ) ( CLEAR ?auto_530192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_530188 ?auto_530189 ?auto_530190 ?auto_530191 ?auto_530192 )
      ( MAKE-12PILE ?auto_530188 ?auto_530189 ?auto_530190 ?auto_530191 ?auto_530192 ?auto_530193 ?auto_530194 ?auto_530195 ?auto_530196 ?auto_530197 ?auto_530198 ?auto_530199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530238 - BLOCK
      ?auto_530239 - BLOCK
      ?auto_530240 - BLOCK
      ?auto_530241 - BLOCK
      ?auto_530242 - BLOCK
      ?auto_530243 - BLOCK
      ?auto_530244 - BLOCK
      ?auto_530245 - BLOCK
      ?auto_530246 - BLOCK
      ?auto_530247 - BLOCK
      ?auto_530248 - BLOCK
      ?auto_530249 - BLOCK
    )
    :vars
    (
      ?auto_530250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530249 ?auto_530250 ) ( ON-TABLE ?auto_530238 ) ( ON ?auto_530239 ?auto_530238 ) ( ON ?auto_530240 ?auto_530239 ) ( not ( = ?auto_530238 ?auto_530239 ) ) ( not ( = ?auto_530238 ?auto_530240 ) ) ( not ( = ?auto_530238 ?auto_530241 ) ) ( not ( = ?auto_530238 ?auto_530242 ) ) ( not ( = ?auto_530238 ?auto_530243 ) ) ( not ( = ?auto_530238 ?auto_530244 ) ) ( not ( = ?auto_530238 ?auto_530245 ) ) ( not ( = ?auto_530238 ?auto_530246 ) ) ( not ( = ?auto_530238 ?auto_530247 ) ) ( not ( = ?auto_530238 ?auto_530248 ) ) ( not ( = ?auto_530238 ?auto_530249 ) ) ( not ( = ?auto_530238 ?auto_530250 ) ) ( not ( = ?auto_530239 ?auto_530240 ) ) ( not ( = ?auto_530239 ?auto_530241 ) ) ( not ( = ?auto_530239 ?auto_530242 ) ) ( not ( = ?auto_530239 ?auto_530243 ) ) ( not ( = ?auto_530239 ?auto_530244 ) ) ( not ( = ?auto_530239 ?auto_530245 ) ) ( not ( = ?auto_530239 ?auto_530246 ) ) ( not ( = ?auto_530239 ?auto_530247 ) ) ( not ( = ?auto_530239 ?auto_530248 ) ) ( not ( = ?auto_530239 ?auto_530249 ) ) ( not ( = ?auto_530239 ?auto_530250 ) ) ( not ( = ?auto_530240 ?auto_530241 ) ) ( not ( = ?auto_530240 ?auto_530242 ) ) ( not ( = ?auto_530240 ?auto_530243 ) ) ( not ( = ?auto_530240 ?auto_530244 ) ) ( not ( = ?auto_530240 ?auto_530245 ) ) ( not ( = ?auto_530240 ?auto_530246 ) ) ( not ( = ?auto_530240 ?auto_530247 ) ) ( not ( = ?auto_530240 ?auto_530248 ) ) ( not ( = ?auto_530240 ?auto_530249 ) ) ( not ( = ?auto_530240 ?auto_530250 ) ) ( not ( = ?auto_530241 ?auto_530242 ) ) ( not ( = ?auto_530241 ?auto_530243 ) ) ( not ( = ?auto_530241 ?auto_530244 ) ) ( not ( = ?auto_530241 ?auto_530245 ) ) ( not ( = ?auto_530241 ?auto_530246 ) ) ( not ( = ?auto_530241 ?auto_530247 ) ) ( not ( = ?auto_530241 ?auto_530248 ) ) ( not ( = ?auto_530241 ?auto_530249 ) ) ( not ( = ?auto_530241 ?auto_530250 ) ) ( not ( = ?auto_530242 ?auto_530243 ) ) ( not ( = ?auto_530242 ?auto_530244 ) ) ( not ( = ?auto_530242 ?auto_530245 ) ) ( not ( = ?auto_530242 ?auto_530246 ) ) ( not ( = ?auto_530242 ?auto_530247 ) ) ( not ( = ?auto_530242 ?auto_530248 ) ) ( not ( = ?auto_530242 ?auto_530249 ) ) ( not ( = ?auto_530242 ?auto_530250 ) ) ( not ( = ?auto_530243 ?auto_530244 ) ) ( not ( = ?auto_530243 ?auto_530245 ) ) ( not ( = ?auto_530243 ?auto_530246 ) ) ( not ( = ?auto_530243 ?auto_530247 ) ) ( not ( = ?auto_530243 ?auto_530248 ) ) ( not ( = ?auto_530243 ?auto_530249 ) ) ( not ( = ?auto_530243 ?auto_530250 ) ) ( not ( = ?auto_530244 ?auto_530245 ) ) ( not ( = ?auto_530244 ?auto_530246 ) ) ( not ( = ?auto_530244 ?auto_530247 ) ) ( not ( = ?auto_530244 ?auto_530248 ) ) ( not ( = ?auto_530244 ?auto_530249 ) ) ( not ( = ?auto_530244 ?auto_530250 ) ) ( not ( = ?auto_530245 ?auto_530246 ) ) ( not ( = ?auto_530245 ?auto_530247 ) ) ( not ( = ?auto_530245 ?auto_530248 ) ) ( not ( = ?auto_530245 ?auto_530249 ) ) ( not ( = ?auto_530245 ?auto_530250 ) ) ( not ( = ?auto_530246 ?auto_530247 ) ) ( not ( = ?auto_530246 ?auto_530248 ) ) ( not ( = ?auto_530246 ?auto_530249 ) ) ( not ( = ?auto_530246 ?auto_530250 ) ) ( not ( = ?auto_530247 ?auto_530248 ) ) ( not ( = ?auto_530247 ?auto_530249 ) ) ( not ( = ?auto_530247 ?auto_530250 ) ) ( not ( = ?auto_530248 ?auto_530249 ) ) ( not ( = ?auto_530248 ?auto_530250 ) ) ( not ( = ?auto_530249 ?auto_530250 ) ) ( ON ?auto_530248 ?auto_530249 ) ( ON ?auto_530247 ?auto_530248 ) ( ON ?auto_530246 ?auto_530247 ) ( ON ?auto_530245 ?auto_530246 ) ( ON ?auto_530244 ?auto_530245 ) ( ON ?auto_530243 ?auto_530244 ) ( ON ?auto_530242 ?auto_530243 ) ( CLEAR ?auto_530240 ) ( ON ?auto_530241 ?auto_530242 ) ( CLEAR ?auto_530241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_530238 ?auto_530239 ?auto_530240 ?auto_530241 )
      ( MAKE-12PILE ?auto_530238 ?auto_530239 ?auto_530240 ?auto_530241 ?auto_530242 ?auto_530243 ?auto_530244 ?auto_530245 ?auto_530246 ?auto_530247 ?auto_530248 ?auto_530249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530288 - BLOCK
      ?auto_530289 - BLOCK
      ?auto_530290 - BLOCK
      ?auto_530291 - BLOCK
      ?auto_530292 - BLOCK
      ?auto_530293 - BLOCK
      ?auto_530294 - BLOCK
      ?auto_530295 - BLOCK
      ?auto_530296 - BLOCK
      ?auto_530297 - BLOCK
      ?auto_530298 - BLOCK
      ?auto_530299 - BLOCK
    )
    :vars
    (
      ?auto_530300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530299 ?auto_530300 ) ( ON-TABLE ?auto_530288 ) ( ON ?auto_530289 ?auto_530288 ) ( not ( = ?auto_530288 ?auto_530289 ) ) ( not ( = ?auto_530288 ?auto_530290 ) ) ( not ( = ?auto_530288 ?auto_530291 ) ) ( not ( = ?auto_530288 ?auto_530292 ) ) ( not ( = ?auto_530288 ?auto_530293 ) ) ( not ( = ?auto_530288 ?auto_530294 ) ) ( not ( = ?auto_530288 ?auto_530295 ) ) ( not ( = ?auto_530288 ?auto_530296 ) ) ( not ( = ?auto_530288 ?auto_530297 ) ) ( not ( = ?auto_530288 ?auto_530298 ) ) ( not ( = ?auto_530288 ?auto_530299 ) ) ( not ( = ?auto_530288 ?auto_530300 ) ) ( not ( = ?auto_530289 ?auto_530290 ) ) ( not ( = ?auto_530289 ?auto_530291 ) ) ( not ( = ?auto_530289 ?auto_530292 ) ) ( not ( = ?auto_530289 ?auto_530293 ) ) ( not ( = ?auto_530289 ?auto_530294 ) ) ( not ( = ?auto_530289 ?auto_530295 ) ) ( not ( = ?auto_530289 ?auto_530296 ) ) ( not ( = ?auto_530289 ?auto_530297 ) ) ( not ( = ?auto_530289 ?auto_530298 ) ) ( not ( = ?auto_530289 ?auto_530299 ) ) ( not ( = ?auto_530289 ?auto_530300 ) ) ( not ( = ?auto_530290 ?auto_530291 ) ) ( not ( = ?auto_530290 ?auto_530292 ) ) ( not ( = ?auto_530290 ?auto_530293 ) ) ( not ( = ?auto_530290 ?auto_530294 ) ) ( not ( = ?auto_530290 ?auto_530295 ) ) ( not ( = ?auto_530290 ?auto_530296 ) ) ( not ( = ?auto_530290 ?auto_530297 ) ) ( not ( = ?auto_530290 ?auto_530298 ) ) ( not ( = ?auto_530290 ?auto_530299 ) ) ( not ( = ?auto_530290 ?auto_530300 ) ) ( not ( = ?auto_530291 ?auto_530292 ) ) ( not ( = ?auto_530291 ?auto_530293 ) ) ( not ( = ?auto_530291 ?auto_530294 ) ) ( not ( = ?auto_530291 ?auto_530295 ) ) ( not ( = ?auto_530291 ?auto_530296 ) ) ( not ( = ?auto_530291 ?auto_530297 ) ) ( not ( = ?auto_530291 ?auto_530298 ) ) ( not ( = ?auto_530291 ?auto_530299 ) ) ( not ( = ?auto_530291 ?auto_530300 ) ) ( not ( = ?auto_530292 ?auto_530293 ) ) ( not ( = ?auto_530292 ?auto_530294 ) ) ( not ( = ?auto_530292 ?auto_530295 ) ) ( not ( = ?auto_530292 ?auto_530296 ) ) ( not ( = ?auto_530292 ?auto_530297 ) ) ( not ( = ?auto_530292 ?auto_530298 ) ) ( not ( = ?auto_530292 ?auto_530299 ) ) ( not ( = ?auto_530292 ?auto_530300 ) ) ( not ( = ?auto_530293 ?auto_530294 ) ) ( not ( = ?auto_530293 ?auto_530295 ) ) ( not ( = ?auto_530293 ?auto_530296 ) ) ( not ( = ?auto_530293 ?auto_530297 ) ) ( not ( = ?auto_530293 ?auto_530298 ) ) ( not ( = ?auto_530293 ?auto_530299 ) ) ( not ( = ?auto_530293 ?auto_530300 ) ) ( not ( = ?auto_530294 ?auto_530295 ) ) ( not ( = ?auto_530294 ?auto_530296 ) ) ( not ( = ?auto_530294 ?auto_530297 ) ) ( not ( = ?auto_530294 ?auto_530298 ) ) ( not ( = ?auto_530294 ?auto_530299 ) ) ( not ( = ?auto_530294 ?auto_530300 ) ) ( not ( = ?auto_530295 ?auto_530296 ) ) ( not ( = ?auto_530295 ?auto_530297 ) ) ( not ( = ?auto_530295 ?auto_530298 ) ) ( not ( = ?auto_530295 ?auto_530299 ) ) ( not ( = ?auto_530295 ?auto_530300 ) ) ( not ( = ?auto_530296 ?auto_530297 ) ) ( not ( = ?auto_530296 ?auto_530298 ) ) ( not ( = ?auto_530296 ?auto_530299 ) ) ( not ( = ?auto_530296 ?auto_530300 ) ) ( not ( = ?auto_530297 ?auto_530298 ) ) ( not ( = ?auto_530297 ?auto_530299 ) ) ( not ( = ?auto_530297 ?auto_530300 ) ) ( not ( = ?auto_530298 ?auto_530299 ) ) ( not ( = ?auto_530298 ?auto_530300 ) ) ( not ( = ?auto_530299 ?auto_530300 ) ) ( ON ?auto_530298 ?auto_530299 ) ( ON ?auto_530297 ?auto_530298 ) ( ON ?auto_530296 ?auto_530297 ) ( ON ?auto_530295 ?auto_530296 ) ( ON ?auto_530294 ?auto_530295 ) ( ON ?auto_530293 ?auto_530294 ) ( ON ?auto_530292 ?auto_530293 ) ( ON ?auto_530291 ?auto_530292 ) ( CLEAR ?auto_530289 ) ( ON ?auto_530290 ?auto_530291 ) ( CLEAR ?auto_530290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_530288 ?auto_530289 ?auto_530290 )
      ( MAKE-12PILE ?auto_530288 ?auto_530289 ?auto_530290 ?auto_530291 ?auto_530292 ?auto_530293 ?auto_530294 ?auto_530295 ?auto_530296 ?auto_530297 ?auto_530298 ?auto_530299 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530338 - BLOCK
      ?auto_530339 - BLOCK
      ?auto_530340 - BLOCK
      ?auto_530341 - BLOCK
      ?auto_530342 - BLOCK
      ?auto_530343 - BLOCK
      ?auto_530344 - BLOCK
      ?auto_530345 - BLOCK
      ?auto_530346 - BLOCK
      ?auto_530347 - BLOCK
      ?auto_530348 - BLOCK
      ?auto_530349 - BLOCK
    )
    :vars
    (
      ?auto_530350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530349 ?auto_530350 ) ( ON-TABLE ?auto_530338 ) ( not ( = ?auto_530338 ?auto_530339 ) ) ( not ( = ?auto_530338 ?auto_530340 ) ) ( not ( = ?auto_530338 ?auto_530341 ) ) ( not ( = ?auto_530338 ?auto_530342 ) ) ( not ( = ?auto_530338 ?auto_530343 ) ) ( not ( = ?auto_530338 ?auto_530344 ) ) ( not ( = ?auto_530338 ?auto_530345 ) ) ( not ( = ?auto_530338 ?auto_530346 ) ) ( not ( = ?auto_530338 ?auto_530347 ) ) ( not ( = ?auto_530338 ?auto_530348 ) ) ( not ( = ?auto_530338 ?auto_530349 ) ) ( not ( = ?auto_530338 ?auto_530350 ) ) ( not ( = ?auto_530339 ?auto_530340 ) ) ( not ( = ?auto_530339 ?auto_530341 ) ) ( not ( = ?auto_530339 ?auto_530342 ) ) ( not ( = ?auto_530339 ?auto_530343 ) ) ( not ( = ?auto_530339 ?auto_530344 ) ) ( not ( = ?auto_530339 ?auto_530345 ) ) ( not ( = ?auto_530339 ?auto_530346 ) ) ( not ( = ?auto_530339 ?auto_530347 ) ) ( not ( = ?auto_530339 ?auto_530348 ) ) ( not ( = ?auto_530339 ?auto_530349 ) ) ( not ( = ?auto_530339 ?auto_530350 ) ) ( not ( = ?auto_530340 ?auto_530341 ) ) ( not ( = ?auto_530340 ?auto_530342 ) ) ( not ( = ?auto_530340 ?auto_530343 ) ) ( not ( = ?auto_530340 ?auto_530344 ) ) ( not ( = ?auto_530340 ?auto_530345 ) ) ( not ( = ?auto_530340 ?auto_530346 ) ) ( not ( = ?auto_530340 ?auto_530347 ) ) ( not ( = ?auto_530340 ?auto_530348 ) ) ( not ( = ?auto_530340 ?auto_530349 ) ) ( not ( = ?auto_530340 ?auto_530350 ) ) ( not ( = ?auto_530341 ?auto_530342 ) ) ( not ( = ?auto_530341 ?auto_530343 ) ) ( not ( = ?auto_530341 ?auto_530344 ) ) ( not ( = ?auto_530341 ?auto_530345 ) ) ( not ( = ?auto_530341 ?auto_530346 ) ) ( not ( = ?auto_530341 ?auto_530347 ) ) ( not ( = ?auto_530341 ?auto_530348 ) ) ( not ( = ?auto_530341 ?auto_530349 ) ) ( not ( = ?auto_530341 ?auto_530350 ) ) ( not ( = ?auto_530342 ?auto_530343 ) ) ( not ( = ?auto_530342 ?auto_530344 ) ) ( not ( = ?auto_530342 ?auto_530345 ) ) ( not ( = ?auto_530342 ?auto_530346 ) ) ( not ( = ?auto_530342 ?auto_530347 ) ) ( not ( = ?auto_530342 ?auto_530348 ) ) ( not ( = ?auto_530342 ?auto_530349 ) ) ( not ( = ?auto_530342 ?auto_530350 ) ) ( not ( = ?auto_530343 ?auto_530344 ) ) ( not ( = ?auto_530343 ?auto_530345 ) ) ( not ( = ?auto_530343 ?auto_530346 ) ) ( not ( = ?auto_530343 ?auto_530347 ) ) ( not ( = ?auto_530343 ?auto_530348 ) ) ( not ( = ?auto_530343 ?auto_530349 ) ) ( not ( = ?auto_530343 ?auto_530350 ) ) ( not ( = ?auto_530344 ?auto_530345 ) ) ( not ( = ?auto_530344 ?auto_530346 ) ) ( not ( = ?auto_530344 ?auto_530347 ) ) ( not ( = ?auto_530344 ?auto_530348 ) ) ( not ( = ?auto_530344 ?auto_530349 ) ) ( not ( = ?auto_530344 ?auto_530350 ) ) ( not ( = ?auto_530345 ?auto_530346 ) ) ( not ( = ?auto_530345 ?auto_530347 ) ) ( not ( = ?auto_530345 ?auto_530348 ) ) ( not ( = ?auto_530345 ?auto_530349 ) ) ( not ( = ?auto_530345 ?auto_530350 ) ) ( not ( = ?auto_530346 ?auto_530347 ) ) ( not ( = ?auto_530346 ?auto_530348 ) ) ( not ( = ?auto_530346 ?auto_530349 ) ) ( not ( = ?auto_530346 ?auto_530350 ) ) ( not ( = ?auto_530347 ?auto_530348 ) ) ( not ( = ?auto_530347 ?auto_530349 ) ) ( not ( = ?auto_530347 ?auto_530350 ) ) ( not ( = ?auto_530348 ?auto_530349 ) ) ( not ( = ?auto_530348 ?auto_530350 ) ) ( not ( = ?auto_530349 ?auto_530350 ) ) ( ON ?auto_530348 ?auto_530349 ) ( ON ?auto_530347 ?auto_530348 ) ( ON ?auto_530346 ?auto_530347 ) ( ON ?auto_530345 ?auto_530346 ) ( ON ?auto_530344 ?auto_530345 ) ( ON ?auto_530343 ?auto_530344 ) ( ON ?auto_530342 ?auto_530343 ) ( ON ?auto_530341 ?auto_530342 ) ( ON ?auto_530340 ?auto_530341 ) ( CLEAR ?auto_530338 ) ( ON ?auto_530339 ?auto_530340 ) ( CLEAR ?auto_530339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_530338 ?auto_530339 )
      ( MAKE-12PILE ?auto_530338 ?auto_530339 ?auto_530340 ?auto_530341 ?auto_530342 ?auto_530343 ?auto_530344 ?auto_530345 ?auto_530346 ?auto_530347 ?auto_530348 ?auto_530349 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_530388 - BLOCK
      ?auto_530389 - BLOCK
      ?auto_530390 - BLOCK
      ?auto_530391 - BLOCK
      ?auto_530392 - BLOCK
      ?auto_530393 - BLOCK
      ?auto_530394 - BLOCK
      ?auto_530395 - BLOCK
      ?auto_530396 - BLOCK
      ?auto_530397 - BLOCK
      ?auto_530398 - BLOCK
      ?auto_530399 - BLOCK
    )
    :vars
    (
      ?auto_530400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530399 ?auto_530400 ) ( not ( = ?auto_530388 ?auto_530389 ) ) ( not ( = ?auto_530388 ?auto_530390 ) ) ( not ( = ?auto_530388 ?auto_530391 ) ) ( not ( = ?auto_530388 ?auto_530392 ) ) ( not ( = ?auto_530388 ?auto_530393 ) ) ( not ( = ?auto_530388 ?auto_530394 ) ) ( not ( = ?auto_530388 ?auto_530395 ) ) ( not ( = ?auto_530388 ?auto_530396 ) ) ( not ( = ?auto_530388 ?auto_530397 ) ) ( not ( = ?auto_530388 ?auto_530398 ) ) ( not ( = ?auto_530388 ?auto_530399 ) ) ( not ( = ?auto_530388 ?auto_530400 ) ) ( not ( = ?auto_530389 ?auto_530390 ) ) ( not ( = ?auto_530389 ?auto_530391 ) ) ( not ( = ?auto_530389 ?auto_530392 ) ) ( not ( = ?auto_530389 ?auto_530393 ) ) ( not ( = ?auto_530389 ?auto_530394 ) ) ( not ( = ?auto_530389 ?auto_530395 ) ) ( not ( = ?auto_530389 ?auto_530396 ) ) ( not ( = ?auto_530389 ?auto_530397 ) ) ( not ( = ?auto_530389 ?auto_530398 ) ) ( not ( = ?auto_530389 ?auto_530399 ) ) ( not ( = ?auto_530389 ?auto_530400 ) ) ( not ( = ?auto_530390 ?auto_530391 ) ) ( not ( = ?auto_530390 ?auto_530392 ) ) ( not ( = ?auto_530390 ?auto_530393 ) ) ( not ( = ?auto_530390 ?auto_530394 ) ) ( not ( = ?auto_530390 ?auto_530395 ) ) ( not ( = ?auto_530390 ?auto_530396 ) ) ( not ( = ?auto_530390 ?auto_530397 ) ) ( not ( = ?auto_530390 ?auto_530398 ) ) ( not ( = ?auto_530390 ?auto_530399 ) ) ( not ( = ?auto_530390 ?auto_530400 ) ) ( not ( = ?auto_530391 ?auto_530392 ) ) ( not ( = ?auto_530391 ?auto_530393 ) ) ( not ( = ?auto_530391 ?auto_530394 ) ) ( not ( = ?auto_530391 ?auto_530395 ) ) ( not ( = ?auto_530391 ?auto_530396 ) ) ( not ( = ?auto_530391 ?auto_530397 ) ) ( not ( = ?auto_530391 ?auto_530398 ) ) ( not ( = ?auto_530391 ?auto_530399 ) ) ( not ( = ?auto_530391 ?auto_530400 ) ) ( not ( = ?auto_530392 ?auto_530393 ) ) ( not ( = ?auto_530392 ?auto_530394 ) ) ( not ( = ?auto_530392 ?auto_530395 ) ) ( not ( = ?auto_530392 ?auto_530396 ) ) ( not ( = ?auto_530392 ?auto_530397 ) ) ( not ( = ?auto_530392 ?auto_530398 ) ) ( not ( = ?auto_530392 ?auto_530399 ) ) ( not ( = ?auto_530392 ?auto_530400 ) ) ( not ( = ?auto_530393 ?auto_530394 ) ) ( not ( = ?auto_530393 ?auto_530395 ) ) ( not ( = ?auto_530393 ?auto_530396 ) ) ( not ( = ?auto_530393 ?auto_530397 ) ) ( not ( = ?auto_530393 ?auto_530398 ) ) ( not ( = ?auto_530393 ?auto_530399 ) ) ( not ( = ?auto_530393 ?auto_530400 ) ) ( not ( = ?auto_530394 ?auto_530395 ) ) ( not ( = ?auto_530394 ?auto_530396 ) ) ( not ( = ?auto_530394 ?auto_530397 ) ) ( not ( = ?auto_530394 ?auto_530398 ) ) ( not ( = ?auto_530394 ?auto_530399 ) ) ( not ( = ?auto_530394 ?auto_530400 ) ) ( not ( = ?auto_530395 ?auto_530396 ) ) ( not ( = ?auto_530395 ?auto_530397 ) ) ( not ( = ?auto_530395 ?auto_530398 ) ) ( not ( = ?auto_530395 ?auto_530399 ) ) ( not ( = ?auto_530395 ?auto_530400 ) ) ( not ( = ?auto_530396 ?auto_530397 ) ) ( not ( = ?auto_530396 ?auto_530398 ) ) ( not ( = ?auto_530396 ?auto_530399 ) ) ( not ( = ?auto_530396 ?auto_530400 ) ) ( not ( = ?auto_530397 ?auto_530398 ) ) ( not ( = ?auto_530397 ?auto_530399 ) ) ( not ( = ?auto_530397 ?auto_530400 ) ) ( not ( = ?auto_530398 ?auto_530399 ) ) ( not ( = ?auto_530398 ?auto_530400 ) ) ( not ( = ?auto_530399 ?auto_530400 ) ) ( ON ?auto_530398 ?auto_530399 ) ( ON ?auto_530397 ?auto_530398 ) ( ON ?auto_530396 ?auto_530397 ) ( ON ?auto_530395 ?auto_530396 ) ( ON ?auto_530394 ?auto_530395 ) ( ON ?auto_530393 ?auto_530394 ) ( ON ?auto_530392 ?auto_530393 ) ( ON ?auto_530391 ?auto_530392 ) ( ON ?auto_530390 ?auto_530391 ) ( ON ?auto_530389 ?auto_530390 ) ( ON ?auto_530388 ?auto_530389 ) ( CLEAR ?auto_530388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_530388 )
      ( MAKE-12PILE ?auto_530388 ?auto_530389 ?auto_530390 ?auto_530391 ?auto_530392 ?auto_530393 ?auto_530394 ?auto_530395 ?auto_530396 ?auto_530397 ?auto_530398 ?auto_530399 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530439 - BLOCK
      ?auto_530440 - BLOCK
      ?auto_530441 - BLOCK
      ?auto_530442 - BLOCK
      ?auto_530443 - BLOCK
      ?auto_530444 - BLOCK
      ?auto_530445 - BLOCK
      ?auto_530446 - BLOCK
      ?auto_530447 - BLOCK
      ?auto_530448 - BLOCK
      ?auto_530449 - BLOCK
      ?auto_530450 - BLOCK
      ?auto_530451 - BLOCK
    )
    :vars
    (
      ?auto_530452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_530450 ) ( ON ?auto_530451 ?auto_530452 ) ( CLEAR ?auto_530451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_530439 ) ( ON ?auto_530440 ?auto_530439 ) ( ON ?auto_530441 ?auto_530440 ) ( ON ?auto_530442 ?auto_530441 ) ( ON ?auto_530443 ?auto_530442 ) ( ON ?auto_530444 ?auto_530443 ) ( ON ?auto_530445 ?auto_530444 ) ( ON ?auto_530446 ?auto_530445 ) ( ON ?auto_530447 ?auto_530446 ) ( ON ?auto_530448 ?auto_530447 ) ( ON ?auto_530449 ?auto_530448 ) ( ON ?auto_530450 ?auto_530449 ) ( not ( = ?auto_530439 ?auto_530440 ) ) ( not ( = ?auto_530439 ?auto_530441 ) ) ( not ( = ?auto_530439 ?auto_530442 ) ) ( not ( = ?auto_530439 ?auto_530443 ) ) ( not ( = ?auto_530439 ?auto_530444 ) ) ( not ( = ?auto_530439 ?auto_530445 ) ) ( not ( = ?auto_530439 ?auto_530446 ) ) ( not ( = ?auto_530439 ?auto_530447 ) ) ( not ( = ?auto_530439 ?auto_530448 ) ) ( not ( = ?auto_530439 ?auto_530449 ) ) ( not ( = ?auto_530439 ?auto_530450 ) ) ( not ( = ?auto_530439 ?auto_530451 ) ) ( not ( = ?auto_530439 ?auto_530452 ) ) ( not ( = ?auto_530440 ?auto_530441 ) ) ( not ( = ?auto_530440 ?auto_530442 ) ) ( not ( = ?auto_530440 ?auto_530443 ) ) ( not ( = ?auto_530440 ?auto_530444 ) ) ( not ( = ?auto_530440 ?auto_530445 ) ) ( not ( = ?auto_530440 ?auto_530446 ) ) ( not ( = ?auto_530440 ?auto_530447 ) ) ( not ( = ?auto_530440 ?auto_530448 ) ) ( not ( = ?auto_530440 ?auto_530449 ) ) ( not ( = ?auto_530440 ?auto_530450 ) ) ( not ( = ?auto_530440 ?auto_530451 ) ) ( not ( = ?auto_530440 ?auto_530452 ) ) ( not ( = ?auto_530441 ?auto_530442 ) ) ( not ( = ?auto_530441 ?auto_530443 ) ) ( not ( = ?auto_530441 ?auto_530444 ) ) ( not ( = ?auto_530441 ?auto_530445 ) ) ( not ( = ?auto_530441 ?auto_530446 ) ) ( not ( = ?auto_530441 ?auto_530447 ) ) ( not ( = ?auto_530441 ?auto_530448 ) ) ( not ( = ?auto_530441 ?auto_530449 ) ) ( not ( = ?auto_530441 ?auto_530450 ) ) ( not ( = ?auto_530441 ?auto_530451 ) ) ( not ( = ?auto_530441 ?auto_530452 ) ) ( not ( = ?auto_530442 ?auto_530443 ) ) ( not ( = ?auto_530442 ?auto_530444 ) ) ( not ( = ?auto_530442 ?auto_530445 ) ) ( not ( = ?auto_530442 ?auto_530446 ) ) ( not ( = ?auto_530442 ?auto_530447 ) ) ( not ( = ?auto_530442 ?auto_530448 ) ) ( not ( = ?auto_530442 ?auto_530449 ) ) ( not ( = ?auto_530442 ?auto_530450 ) ) ( not ( = ?auto_530442 ?auto_530451 ) ) ( not ( = ?auto_530442 ?auto_530452 ) ) ( not ( = ?auto_530443 ?auto_530444 ) ) ( not ( = ?auto_530443 ?auto_530445 ) ) ( not ( = ?auto_530443 ?auto_530446 ) ) ( not ( = ?auto_530443 ?auto_530447 ) ) ( not ( = ?auto_530443 ?auto_530448 ) ) ( not ( = ?auto_530443 ?auto_530449 ) ) ( not ( = ?auto_530443 ?auto_530450 ) ) ( not ( = ?auto_530443 ?auto_530451 ) ) ( not ( = ?auto_530443 ?auto_530452 ) ) ( not ( = ?auto_530444 ?auto_530445 ) ) ( not ( = ?auto_530444 ?auto_530446 ) ) ( not ( = ?auto_530444 ?auto_530447 ) ) ( not ( = ?auto_530444 ?auto_530448 ) ) ( not ( = ?auto_530444 ?auto_530449 ) ) ( not ( = ?auto_530444 ?auto_530450 ) ) ( not ( = ?auto_530444 ?auto_530451 ) ) ( not ( = ?auto_530444 ?auto_530452 ) ) ( not ( = ?auto_530445 ?auto_530446 ) ) ( not ( = ?auto_530445 ?auto_530447 ) ) ( not ( = ?auto_530445 ?auto_530448 ) ) ( not ( = ?auto_530445 ?auto_530449 ) ) ( not ( = ?auto_530445 ?auto_530450 ) ) ( not ( = ?auto_530445 ?auto_530451 ) ) ( not ( = ?auto_530445 ?auto_530452 ) ) ( not ( = ?auto_530446 ?auto_530447 ) ) ( not ( = ?auto_530446 ?auto_530448 ) ) ( not ( = ?auto_530446 ?auto_530449 ) ) ( not ( = ?auto_530446 ?auto_530450 ) ) ( not ( = ?auto_530446 ?auto_530451 ) ) ( not ( = ?auto_530446 ?auto_530452 ) ) ( not ( = ?auto_530447 ?auto_530448 ) ) ( not ( = ?auto_530447 ?auto_530449 ) ) ( not ( = ?auto_530447 ?auto_530450 ) ) ( not ( = ?auto_530447 ?auto_530451 ) ) ( not ( = ?auto_530447 ?auto_530452 ) ) ( not ( = ?auto_530448 ?auto_530449 ) ) ( not ( = ?auto_530448 ?auto_530450 ) ) ( not ( = ?auto_530448 ?auto_530451 ) ) ( not ( = ?auto_530448 ?auto_530452 ) ) ( not ( = ?auto_530449 ?auto_530450 ) ) ( not ( = ?auto_530449 ?auto_530451 ) ) ( not ( = ?auto_530449 ?auto_530452 ) ) ( not ( = ?auto_530450 ?auto_530451 ) ) ( not ( = ?auto_530450 ?auto_530452 ) ) ( not ( = ?auto_530451 ?auto_530452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_530451 ?auto_530452 )
      ( !STACK ?auto_530451 ?auto_530450 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530493 - BLOCK
      ?auto_530494 - BLOCK
      ?auto_530495 - BLOCK
      ?auto_530496 - BLOCK
      ?auto_530497 - BLOCK
      ?auto_530498 - BLOCK
      ?auto_530499 - BLOCK
      ?auto_530500 - BLOCK
      ?auto_530501 - BLOCK
      ?auto_530502 - BLOCK
      ?auto_530503 - BLOCK
      ?auto_530504 - BLOCK
      ?auto_530505 - BLOCK
    )
    :vars
    (
      ?auto_530506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530505 ?auto_530506 ) ( ON-TABLE ?auto_530493 ) ( ON ?auto_530494 ?auto_530493 ) ( ON ?auto_530495 ?auto_530494 ) ( ON ?auto_530496 ?auto_530495 ) ( ON ?auto_530497 ?auto_530496 ) ( ON ?auto_530498 ?auto_530497 ) ( ON ?auto_530499 ?auto_530498 ) ( ON ?auto_530500 ?auto_530499 ) ( ON ?auto_530501 ?auto_530500 ) ( ON ?auto_530502 ?auto_530501 ) ( ON ?auto_530503 ?auto_530502 ) ( not ( = ?auto_530493 ?auto_530494 ) ) ( not ( = ?auto_530493 ?auto_530495 ) ) ( not ( = ?auto_530493 ?auto_530496 ) ) ( not ( = ?auto_530493 ?auto_530497 ) ) ( not ( = ?auto_530493 ?auto_530498 ) ) ( not ( = ?auto_530493 ?auto_530499 ) ) ( not ( = ?auto_530493 ?auto_530500 ) ) ( not ( = ?auto_530493 ?auto_530501 ) ) ( not ( = ?auto_530493 ?auto_530502 ) ) ( not ( = ?auto_530493 ?auto_530503 ) ) ( not ( = ?auto_530493 ?auto_530504 ) ) ( not ( = ?auto_530493 ?auto_530505 ) ) ( not ( = ?auto_530493 ?auto_530506 ) ) ( not ( = ?auto_530494 ?auto_530495 ) ) ( not ( = ?auto_530494 ?auto_530496 ) ) ( not ( = ?auto_530494 ?auto_530497 ) ) ( not ( = ?auto_530494 ?auto_530498 ) ) ( not ( = ?auto_530494 ?auto_530499 ) ) ( not ( = ?auto_530494 ?auto_530500 ) ) ( not ( = ?auto_530494 ?auto_530501 ) ) ( not ( = ?auto_530494 ?auto_530502 ) ) ( not ( = ?auto_530494 ?auto_530503 ) ) ( not ( = ?auto_530494 ?auto_530504 ) ) ( not ( = ?auto_530494 ?auto_530505 ) ) ( not ( = ?auto_530494 ?auto_530506 ) ) ( not ( = ?auto_530495 ?auto_530496 ) ) ( not ( = ?auto_530495 ?auto_530497 ) ) ( not ( = ?auto_530495 ?auto_530498 ) ) ( not ( = ?auto_530495 ?auto_530499 ) ) ( not ( = ?auto_530495 ?auto_530500 ) ) ( not ( = ?auto_530495 ?auto_530501 ) ) ( not ( = ?auto_530495 ?auto_530502 ) ) ( not ( = ?auto_530495 ?auto_530503 ) ) ( not ( = ?auto_530495 ?auto_530504 ) ) ( not ( = ?auto_530495 ?auto_530505 ) ) ( not ( = ?auto_530495 ?auto_530506 ) ) ( not ( = ?auto_530496 ?auto_530497 ) ) ( not ( = ?auto_530496 ?auto_530498 ) ) ( not ( = ?auto_530496 ?auto_530499 ) ) ( not ( = ?auto_530496 ?auto_530500 ) ) ( not ( = ?auto_530496 ?auto_530501 ) ) ( not ( = ?auto_530496 ?auto_530502 ) ) ( not ( = ?auto_530496 ?auto_530503 ) ) ( not ( = ?auto_530496 ?auto_530504 ) ) ( not ( = ?auto_530496 ?auto_530505 ) ) ( not ( = ?auto_530496 ?auto_530506 ) ) ( not ( = ?auto_530497 ?auto_530498 ) ) ( not ( = ?auto_530497 ?auto_530499 ) ) ( not ( = ?auto_530497 ?auto_530500 ) ) ( not ( = ?auto_530497 ?auto_530501 ) ) ( not ( = ?auto_530497 ?auto_530502 ) ) ( not ( = ?auto_530497 ?auto_530503 ) ) ( not ( = ?auto_530497 ?auto_530504 ) ) ( not ( = ?auto_530497 ?auto_530505 ) ) ( not ( = ?auto_530497 ?auto_530506 ) ) ( not ( = ?auto_530498 ?auto_530499 ) ) ( not ( = ?auto_530498 ?auto_530500 ) ) ( not ( = ?auto_530498 ?auto_530501 ) ) ( not ( = ?auto_530498 ?auto_530502 ) ) ( not ( = ?auto_530498 ?auto_530503 ) ) ( not ( = ?auto_530498 ?auto_530504 ) ) ( not ( = ?auto_530498 ?auto_530505 ) ) ( not ( = ?auto_530498 ?auto_530506 ) ) ( not ( = ?auto_530499 ?auto_530500 ) ) ( not ( = ?auto_530499 ?auto_530501 ) ) ( not ( = ?auto_530499 ?auto_530502 ) ) ( not ( = ?auto_530499 ?auto_530503 ) ) ( not ( = ?auto_530499 ?auto_530504 ) ) ( not ( = ?auto_530499 ?auto_530505 ) ) ( not ( = ?auto_530499 ?auto_530506 ) ) ( not ( = ?auto_530500 ?auto_530501 ) ) ( not ( = ?auto_530500 ?auto_530502 ) ) ( not ( = ?auto_530500 ?auto_530503 ) ) ( not ( = ?auto_530500 ?auto_530504 ) ) ( not ( = ?auto_530500 ?auto_530505 ) ) ( not ( = ?auto_530500 ?auto_530506 ) ) ( not ( = ?auto_530501 ?auto_530502 ) ) ( not ( = ?auto_530501 ?auto_530503 ) ) ( not ( = ?auto_530501 ?auto_530504 ) ) ( not ( = ?auto_530501 ?auto_530505 ) ) ( not ( = ?auto_530501 ?auto_530506 ) ) ( not ( = ?auto_530502 ?auto_530503 ) ) ( not ( = ?auto_530502 ?auto_530504 ) ) ( not ( = ?auto_530502 ?auto_530505 ) ) ( not ( = ?auto_530502 ?auto_530506 ) ) ( not ( = ?auto_530503 ?auto_530504 ) ) ( not ( = ?auto_530503 ?auto_530505 ) ) ( not ( = ?auto_530503 ?auto_530506 ) ) ( not ( = ?auto_530504 ?auto_530505 ) ) ( not ( = ?auto_530504 ?auto_530506 ) ) ( not ( = ?auto_530505 ?auto_530506 ) ) ( CLEAR ?auto_530503 ) ( ON ?auto_530504 ?auto_530505 ) ( CLEAR ?auto_530504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_530493 ?auto_530494 ?auto_530495 ?auto_530496 ?auto_530497 ?auto_530498 ?auto_530499 ?auto_530500 ?auto_530501 ?auto_530502 ?auto_530503 ?auto_530504 )
      ( MAKE-13PILE ?auto_530493 ?auto_530494 ?auto_530495 ?auto_530496 ?auto_530497 ?auto_530498 ?auto_530499 ?auto_530500 ?auto_530501 ?auto_530502 ?auto_530503 ?auto_530504 ?auto_530505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530547 - BLOCK
      ?auto_530548 - BLOCK
      ?auto_530549 - BLOCK
      ?auto_530550 - BLOCK
      ?auto_530551 - BLOCK
      ?auto_530552 - BLOCK
      ?auto_530553 - BLOCK
      ?auto_530554 - BLOCK
      ?auto_530555 - BLOCK
      ?auto_530556 - BLOCK
      ?auto_530557 - BLOCK
      ?auto_530558 - BLOCK
      ?auto_530559 - BLOCK
    )
    :vars
    (
      ?auto_530560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530559 ?auto_530560 ) ( ON-TABLE ?auto_530547 ) ( ON ?auto_530548 ?auto_530547 ) ( ON ?auto_530549 ?auto_530548 ) ( ON ?auto_530550 ?auto_530549 ) ( ON ?auto_530551 ?auto_530550 ) ( ON ?auto_530552 ?auto_530551 ) ( ON ?auto_530553 ?auto_530552 ) ( ON ?auto_530554 ?auto_530553 ) ( ON ?auto_530555 ?auto_530554 ) ( ON ?auto_530556 ?auto_530555 ) ( not ( = ?auto_530547 ?auto_530548 ) ) ( not ( = ?auto_530547 ?auto_530549 ) ) ( not ( = ?auto_530547 ?auto_530550 ) ) ( not ( = ?auto_530547 ?auto_530551 ) ) ( not ( = ?auto_530547 ?auto_530552 ) ) ( not ( = ?auto_530547 ?auto_530553 ) ) ( not ( = ?auto_530547 ?auto_530554 ) ) ( not ( = ?auto_530547 ?auto_530555 ) ) ( not ( = ?auto_530547 ?auto_530556 ) ) ( not ( = ?auto_530547 ?auto_530557 ) ) ( not ( = ?auto_530547 ?auto_530558 ) ) ( not ( = ?auto_530547 ?auto_530559 ) ) ( not ( = ?auto_530547 ?auto_530560 ) ) ( not ( = ?auto_530548 ?auto_530549 ) ) ( not ( = ?auto_530548 ?auto_530550 ) ) ( not ( = ?auto_530548 ?auto_530551 ) ) ( not ( = ?auto_530548 ?auto_530552 ) ) ( not ( = ?auto_530548 ?auto_530553 ) ) ( not ( = ?auto_530548 ?auto_530554 ) ) ( not ( = ?auto_530548 ?auto_530555 ) ) ( not ( = ?auto_530548 ?auto_530556 ) ) ( not ( = ?auto_530548 ?auto_530557 ) ) ( not ( = ?auto_530548 ?auto_530558 ) ) ( not ( = ?auto_530548 ?auto_530559 ) ) ( not ( = ?auto_530548 ?auto_530560 ) ) ( not ( = ?auto_530549 ?auto_530550 ) ) ( not ( = ?auto_530549 ?auto_530551 ) ) ( not ( = ?auto_530549 ?auto_530552 ) ) ( not ( = ?auto_530549 ?auto_530553 ) ) ( not ( = ?auto_530549 ?auto_530554 ) ) ( not ( = ?auto_530549 ?auto_530555 ) ) ( not ( = ?auto_530549 ?auto_530556 ) ) ( not ( = ?auto_530549 ?auto_530557 ) ) ( not ( = ?auto_530549 ?auto_530558 ) ) ( not ( = ?auto_530549 ?auto_530559 ) ) ( not ( = ?auto_530549 ?auto_530560 ) ) ( not ( = ?auto_530550 ?auto_530551 ) ) ( not ( = ?auto_530550 ?auto_530552 ) ) ( not ( = ?auto_530550 ?auto_530553 ) ) ( not ( = ?auto_530550 ?auto_530554 ) ) ( not ( = ?auto_530550 ?auto_530555 ) ) ( not ( = ?auto_530550 ?auto_530556 ) ) ( not ( = ?auto_530550 ?auto_530557 ) ) ( not ( = ?auto_530550 ?auto_530558 ) ) ( not ( = ?auto_530550 ?auto_530559 ) ) ( not ( = ?auto_530550 ?auto_530560 ) ) ( not ( = ?auto_530551 ?auto_530552 ) ) ( not ( = ?auto_530551 ?auto_530553 ) ) ( not ( = ?auto_530551 ?auto_530554 ) ) ( not ( = ?auto_530551 ?auto_530555 ) ) ( not ( = ?auto_530551 ?auto_530556 ) ) ( not ( = ?auto_530551 ?auto_530557 ) ) ( not ( = ?auto_530551 ?auto_530558 ) ) ( not ( = ?auto_530551 ?auto_530559 ) ) ( not ( = ?auto_530551 ?auto_530560 ) ) ( not ( = ?auto_530552 ?auto_530553 ) ) ( not ( = ?auto_530552 ?auto_530554 ) ) ( not ( = ?auto_530552 ?auto_530555 ) ) ( not ( = ?auto_530552 ?auto_530556 ) ) ( not ( = ?auto_530552 ?auto_530557 ) ) ( not ( = ?auto_530552 ?auto_530558 ) ) ( not ( = ?auto_530552 ?auto_530559 ) ) ( not ( = ?auto_530552 ?auto_530560 ) ) ( not ( = ?auto_530553 ?auto_530554 ) ) ( not ( = ?auto_530553 ?auto_530555 ) ) ( not ( = ?auto_530553 ?auto_530556 ) ) ( not ( = ?auto_530553 ?auto_530557 ) ) ( not ( = ?auto_530553 ?auto_530558 ) ) ( not ( = ?auto_530553 ?auto_530559 ) ) ( not ( = ?auto_530553 ?auto_530560 ) ) ( not ( = ?auto_530554 ?auto_530555 ) ) ( not ( = ?auto_530554 ?auto_530556 ) ) ( not ( = ?auto_530554 ?auto_530557 ) ) ( not ( = ?auto_530554 ?auto_530558 ) ) ( not ( = ?auto_530554 ?auto_530559 ) ) ( not ( = ?auto_530554 ?auto_530560 ) ) ( not ( = ?auto_530555 ?auto_530556 ) ) ( not ( = ?auto_530555 ?auto_530557 ) ) ( not ( = ?auto_530555 ?auto_530558 ) ) ( not ( = ?auto_530555 ?auto_530559 ) ) ( not ( = ?auto_530555 ?auto_530560 ) ) ( not ( = ?auto_530556 ?auto_530557 ) ) ( not ( = ?auto_530556 ?auto_530558 ) ) ( not ( = ?auto_530556 ?auto_530559 ) ) ( not ( = ?auto_530556 ?auto_530560 ) ) ( not ( = ?auto_530557 ?auto_530558 ) ) ( not ( = ?auto_530557 ?auto_530559 ) ) ( not ( = ?auto_530557 ?auto_530560 ) ) ( not ( = ?auto_530558 ?auto_530559 ) ) ( not ( = ?auto_530558 ?auto_530560 ) ) ( not ( = ?auto_530559 ?auto_530560 ) ) ( ON ?auto_530558 ?auto_530559 ) ( CLEAR ?auto_530556 ) ( ON ?auto_530557 ?auto_530558 ) ( CLEAR ?auto_530557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_530547 ?auto_530548 ?auto_530549 ?auto_530550 ?auto_530551 ?auto_530552 ?auto_530553 ?auto_530554 ?auto_530555 ?auto_530556 ?auto_530557 )
      ( MAKE-13PILE ?auto_530547 ?auto_530548 ?auto_530549 ?auto_530550 ?auto_530551 ?auto_530552 ?auto_530553 ?auto_530554 ?auto_530555 ?auto_530556 ?auto_530557 ?auto_530558 ?auto_530559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530601 - BLOCK
      ?auto_530602 - BLOCK
      ?auto_530603 - BLOCK
      ?auto_530604 - BLOCK
      ?auto_530605 - BLOCK
      ?auto_530606 - BLOCK
      ?auto_530607 - BLOCK
      ?auto_530608 - BLOCK
      ?auto_530609 - BLOCK
      ?auto_530610 - BLOCK
      ?auto_530611 - BLOCK
      ?auto_530612 - BLOCK
      ?auto_530613 - BLOCK
    )
    :vars
    (
      ?auto_530614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530613 ?auto_530614 ) ( ON-TABLE ?auto_530601 ) ( ON ?auto_530602 ?auto_530601 ) ( ON ?auto_530603 ?auto_530602 ) ( ON ?auto_530604 ?auto_530603 ) ( ON ?auto_530605 ?auto_530604 ) ( ON ?auto_530606 ?auto_530605 ) ( ON ?auto_530607 ?auto_530606 ) ( ON ?auto_530608 ?auto_530607 ) ( ON ?auto_530609 ?auto_530608 ) ( not ( = ?auto_530601 ?auto_530602 ) ) ( not ( = ?auto_530601 ?auto_530603 ) ) ( not ( = ?auto_530601 ?auto_530604 ) ) ( not ( = ?auto_530601 ?auto_530605 ) ) ( not ( = ?auto_530601 ?auto_530606 ) ) ( not ( = ?auto_530601 ?auto_530607 ) ) ( not ( = ?auto_530601 ?auto_530608 ) ) ( not ( = ?auto_530601 ?auto_530609 ) ) ( not ( = ?auto_530601 ?auto_530610 ) ) ( not ( = ?auto_530601 ?auto_530611 ) ) ( not ( = ?auto_530601 ?auto_530612 ) ) ( not ( = ?auto_530601 ?auto_530613 ) ) ( not ( = ?auto_530601 ?auto_530614 ) ) ( not ( = ?auto_530602 ?auto_530603 ) ) ( not ( = ?auto_530602 ?auto_530604 ) ) ( not ( = ?auto_530602 ?auto_530605 ) ) ( not ( = ?auto_530602 ?auto_530606 ) ) ( not ( = ?auto_530602 ?auto_530607 ) ) ( not ( = ?auto_530602 ?auto_530608 ) ) ( not ( = ?auto_530602 ?auto_530609 ) ) ( not ( = ?auto_530602 ?auto_530610 ) ) ( not ( = ?auto_530602 ?auto_530611 ) ) ( not ( = ?auto_530602 ?auto_530612 ) ) ( not ( = ?auto_530602 ?auto_530613 ) ) ( not ( = ?auto_530602 ?auto_530614 ) ) ( not ( = ?auto_530603 ?auto_530604 ) ) ( not ( = ?auto_530603 ?auto_530605 ) ) ( not ( = ?auto_530603 ?auto_530606 ) ) ( not ( = ?auto_530603 ?auto_530607 ) ) ( not ( = ?auto_530603 ?auto_530608 ) ) ( not ( = ?auto_530603 ?auto_530609 ) ) ( not ( = ?auto_530603 ?auto_530610 ) ) ( not ( = ?auto_530603 ?auto_530611 ) ) ( not ( = ?auto_530603 ?auto_530612 ) ) ( not ( = ?auto_530603 ?auto_530613 ) ) ( not ( = ?auto_530603 ?auto_530614 ) ) ( not ( = ?auto_530604 ?auto_530605 ) ) ( not ( = ?auto_530604 ?auto_530606 ) ) ( not ( = ?auto_530604 ?auto_530607 ) ) ( not ( = ?auto_530604 ?auto_530608 ) ) ( not ( = ?auto_530604 ?auto_530609 ) ) ( not ( = ?auto_530604 ?auto_530610 ) ) ( not ( = ?auto_530604 ?auto_530611 ) ) ( not ( = ?auto_530604 ?auto_530612 ) ) ( not ( = ?auto_530604 ?auto_530613 ) ) ( not ( = ?auto_530604 ?auto_530614 ) ) ( not ( = ?auto_530605 ?auto_530606 ) ) ( not ( = ?auto_530605 ?auto_530607 ) ) ( not ( = ?auto_530605 ?auto_530608 ) ) ( not ( = ?auto_530605 ?auto_530609 ) ) ( not ( = ?auto_530605 ?auto_530610 ) ) ( not ( = ?auto_530605 ?auto_530611 ) ) ( not ( = ?auto_530605 ?auto_530612 ) ) ( not ( = ?auto_530605 ?auto_530613 ) ) ( not ( = ?auto_530605 ?auto_530614 ) ) ( not ( = ?auto_530606 ?auto_530607 ) ) ( not ( = ?auto_530606 ?auto_530608 ) ) ( not ( = ?auto_530606 ?auto_530609 ) ) ( not ( = ?auto_530606 ?auto_530610 ) ) ( not ( = ?auto_530606 ?auto_530611 ) ) ( not ( = ?auto_530606 ?auto_530612 ) ) ( not ( = ?auto_530606 ?auto_530613 ) ) ( not ( = ?auto_530606 ?auto_530614 ) ) ( not ( = ?auto_530607 ?auto_530608 ) ) ( not ( = ?auto_530607 ?auto_530609 ) ) ( not ( = ?auto_530607 ?auto_530610 ) ) ( not ( = ?auto_530607 ?auto_530611 ) ) ( not ( = ?auto_530607 ?auto_530612 ) ) ( not ( = ?auto_530607 ?auto_530613 ) ) ( not ( = ?auto_530607 ?auto_530614 ) ) ( not ( = ?auto_530608 ?auto_530609 ) ) ( not ( = ?auto_530608 ?auto_530610 ) ) ( not ( = ?auto_530608 ?auto_530611 ) ) ( not ( = ?auto_530608 ?auto_530612 ) ) ( not ( = ?auto_530608 ?auto_530613 ) ) ( not ( = ?auto_530608 ?auto_530614 ) ) ( not ( = ?auto_530609 ?auto_530610 ) ) ( not ( = ?auto_530609 ?auto_530611 ) ) ( not ( = ?auto_530609 ?auto_530612 ) ) ( not ( = ?auto_530609 ?auto_530613 ) ) ( not ( = ?auto_530609 ?auto_530614 ) ) ( not ( = ?auto_530610 ?auto_530611 ) ) ( not ( = ?auto_530610 ?auto_530612 ) ) ( not ( = ?auto_530610 ?auto_530613 ) ) ( not ( = ?auto_530610 ?auto_530614 ) ) ( not ( = ?auto_530611 ?auto_530612 ) ) ( not ( = ?auto_530611 ?auto_530613 ) ) ( not ( = ?auto_530611 ?auto_530614 ) ) ( not ( = ?auto_530612 ?auto_530613 ) ) ( not ( = ?auto_530612 ?auto_530614 ) ) ( not ( = ?auto_530613 ?auto_530614 ) ) ( ON ?auto_530612 ?auto_530613 ) ( ON ?auto_530611 ?auto_530612 ) ( CLEAR ?auto_530609 ) ( ON ?auto_530610 ?auto_530611 ) ( CLEAR ?auto_530610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_530601 ?auto_530602 ?auto_530603 ?auto_530604 ?auto_530605 ?auto_530606 ?auto_530607 ?auto_530608 ?auto_530609 ?auto_530610 )
      ( MAKE-13PILE ?auto_530601 ?auto_530602 ?auto_530603 ?auto_530604 ?auto_530605 ?auto_530606 ?auto_530607 ?auto_530608 ?auto_530609 ?auto_530610 ?auto_530611 ?auto_530612 ?auto_530613 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530655 - BLOCK
      ?auto_530656 - BLOCK
      ?auto_530657 - BLOCK
      ?auto_530658 - BLOCK
      ?auto_530659 - BLOCK
      ?auto_530660 - BLOCK
      ?auto_530661 - BLOCK
      ?auto_530662 - BLOCK
      ?auto_530663 - BLOCK
      ?auto_530664 - BLOCK
      ?auto_530665 - BLOCK
      ?auto_530666 - BLOCK
      ?auto_530667 - BLOCK
    )
    :vars
    (
      ?auto_530668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530667 ?auto_530668 ) ( ON-TABLE ?auto_530655 ) ( ON ?auto_530656 ?auto_530655 ) ( ON ?auto_530657 ?auto_530656 ) ( ON ?auto_530658 ?auto_530657 ) ( ON ?auto_530659 ?auto_530658 ) ( ON ?auto_530660 ?auto_530659 ) ( ON ?auto_530661 ?auto_530660 ) ( ON ?auto_530662 ?auto_530661 ) ( not ( = ?auto_530655 ?auto_530656 ) ) ( not ( = ?auto_530655 ?auto_530657 ) ) ( not ( = ?auto_530655 ?auto_530658 ) ) ( not ( = ?auto_530655 ?auto_530659 ) ) ( not ( = ?auto_530655 ?auto_530660 ) ) ( not ( = ?auto_530655 ?auto_530661 ) ) ( not ( = ?auto_530655 ?auto_530662 ) ) ( not ( = ?auto_530655 ?auto_530663 ) ) ( not ( = ?auto_530655 ?auto_530664 ) ) ( not ( = ?auto_530655 ?auto_530665 ) ) ( not ( = ?auto_530655 ?auto_530666 ) ) ( not ( = ?auto_530655 ?auto_530667 ) ) ( not ( = ?auto_530655 ?auto_530668 ) ) ( not ( = ?auto_530656 ?auto_530657 ) ) ( not ( = ?auto_530656 ?auto_530658 ) ) ( not ( = ?auto_530656 ?auto_530659 ) ) ( not ( = ?auto_530656 ?auto_530660 ) ) ( not ( = ?auto_530656 ?auto_530661 ) ) ( not ( = ?auto_530656 ?auto_530662 ) ) ( not ( = ?auto_530656 ?auto_530663 ) ) ( not ( = ?auto_530656 ?auto_530664 ) ) ( not ( = ?auto_530656 ?auto_530665 ) ) ( not ( = ?auto_530656 ?auto_530666 ) ) ( not ( = ?auto_530656 ?auto_530667 ) ) ( not ( = ?auto_530656 ?auto_530668 ) ) ( not ( = ?auto_530657 ?auto_530658 ) ) ( not ( = ?auto_530657 ?auto_530659 ) ) ( not ( = ?auto_530657 ?auto_530660 ) ) ( not ( = ?auto_530657 ?auto_530661 ) ) ( not ( = ?auto_530657 ?auto_530662 ) ) ( not ( = ?auto_530657 ?auto_530663 ) ) ( not ( = ?auto_530657 ?auto_530664 ) ) ( not ( = ?auto_530657 ?auto_530665 ) ) ( not ( = ?auto_530657 ?auto_530666 ) ) ( not ( = ?auto_530657 ?auto_530667 ) ) ( not ( = ?auto_530657 ?auto_530668 ) ) ( not ( = ?auto_530658 ?auto_530659 ) ) ( not ( = ?auto_530658 ?auto_530660 ) ) ( not ( = ?auto_530658 ?auto_530661 ) ) ( not ( = ?auto_530658 ?auto_530662 ) ) ( not ( = ?auto_530658 ?auto_530663 ) ) ( not ( = ?auto_530658 ?auto_530664 ) ) ( not ( = ?auto_530658 ?auto_530665 ) ) ( not ( = ?auto_530658 ?auto_530666 ) ) ( not ( = ?auto_530658 ?auto_530667 ) ) ( not ( = ?auto_530658 ?auto_530668 ) ) ( not ( = ?auto_530659 ?auto_530660 ) ) ( not ( = ?auto_530659 ?auto_530661 ) ) ( not ( = ?auto_530659 ?auto_530662 ) ) ( not ( = ?auto_530659 ?auto_530663 ) ) ( not ( = ?auto_530659 ?auto_530664 ) ) ( not ( = ?auto_530659 ?auto_530665 ) ) ( not ( = ?auto_530659 ?auto_530666 ) ) ( not ( = ?auto_530659 ?auto_530667 ) ) ( not ( = ?auto_530659 ?auto_530668 ) ) ( not ( = ?auto_530660 ?auto_530661 ) ) ( not ( = ?auto_530660 ?auto_530662 ) ) ( not ( = ?auto_530660 ?auto_530663 ) ) ( not ( = ?auto_530660 ?auto_530664 ) ) ( not ( = ?auto_530660 ?auto_530665 ) ) ( not ( = ?auto_530660 ?auto_530666 ) ) ( not ( = ?auto_530660 ?auto_530667 ) ) ( not ( = ?auto_530660 ?auto_530668 ) ) ( not ( = ?auto_530661 ?auto_530662 ) ) ( not ( = ?auto_530661 ?auto_530663 ) ) ( not ( = ?auto_530661 ?auto_530664 ) ) ( not ( = ?auto_530661 ?auto_530665 ) ) ( not ( = ?auto_530661 ?auto_530666 ) ) ( not ( = ?auto_530661 ?auto_530667 ) ) ( not ( = ?auto_530661 ?auto_530668 ) ) ( not ( = ?auto_530662 ?auto_530663 ) ) ( not ( = ?auto_530662 ?auto_530664 ) ) ( not ( = ?auto_530662 ?auto_530665 ) ) ( not ( = ?auto_530662 ?auto_530666 ) ) ( not ( = ?auto_530662 ?auto_530667 ) ) ( not ( = ?auto_530662 ?auto_530668 ) ) ( not ( = ?auto_530663 ?auto_530664 ) ) ( not ( = ?auto_530663 ?auto_530665 ) ) ( not ( = ?auto_530663 ?auto_530666 ) ) ( not ( = ?auto_530663 ?auto_530667 ) ) ( not ( = ?auto_530663 ?auto_530668 ) ) ( not ( = ?auto_530664 ?auto_530665 ) ) ( not ( = ?auto_530664 ?auto_530666 ) ) ( not ( = ?auto_530664 ?auto_530667 ) ) ( not ( = ?auto_530664 ?auto_530668 ) ) ( not ( = ?auto_530665 ?auto_530666 ) ) ( not ( = ?auto_530665 ?auto_530667 ) ) ( not ( = ?auto_530665 ?auto_530668 ) ) ( not ( = ?auto_530666 ?auto_530667 ) ) ( not ( = ?auto_530666 ?auto_530668 ) ) ( not ( = ?auto_530667 ?auto_530668 ) ) ( ON ?auto_530666 ?auto_530667 ) ( ON ?auto_530665 ?auto_530666 ) ( ON ?auto_530664 ?auto_530665 ) ( CLEAR ?auto_530662 ) ( ON ?auto_530663 ?auto_530664 ) ( CLEAR ?auto_530663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_530655 ?auto_530656 ?auto_530657 ?auto_530658 ?auto_530659 ?auto_530660 ?auto_530661 ?auto_530662 ?auto_530663 )
      ( MAKE-13PILE ?auto_530655 ?auto_530656 ?auto_530657 ?auto_530658 ?auto_530659 ?auto_530660 ?auto_530661 ?auto_530662 ?auto_530663 ?auto_530664 ?auto_530665 ?auto_530666 ?auto_530667 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530709 - BLOCK
      ?auto_530710 - BLOCK
      ?auto_530711 - BLOCK
      ?auto_530712 - BLOCK
      ?auto_530713 - BLOCK
      ?auto_530714 - BLOCK
      ?auto_530715 - BLOCK
      ?auto_530716 - BLOCK
      ?auto_530717 - BLOCK
      ?auto_530718 - BLOCK
      ?auto_530719 - BLOCK
      ?auto_530720 - BLOCK
      ?auto_530721 - BLOCK
    )
    :vars
    (
      ?auto_530722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530721 ?auto_530722 ) ( ON-TABLE ?auto_530709 ) ( ON ?auto_530710 ?auto_530709 ) ( ON ?auto_530711 ?auto_530710 ) ( ON ?auto_530712 ?auto_530711 ) ( ON ?auto_530713 ?auto_530712 ) ( ON ?auto_530714 ?auto_530713 ) ( ON ?auto_530715 ?auto_530714 ) ( not ( = ?auto_530709 ?auto_530710 ) ) ( not ( = ?auto_530709 ?auto_530711 ) ) ( not ( = ?auto_530709 ?auto_530712 ) ) ( not ( = ?auto_530709 ?auto_530713 ) ) ( not ( = ?auto_530709 ?auto_530714 ) ) ( not ( = ?auto_530709 ?auto_530715 ) ) ( not ( = ?auto_530709 ?auto_530716 ) ) ( not ( = ?auto_530709 ?auto_530717 ) ) ( not ( = ?auto_530709 ?auto_530718 ) ) ( not ( = ?auto_530709 ?auto_530719 ) ) ( not ( = ?auto_530709 ?auto_530720 ) ) ( not ( = ?auto_530709 ?auto_530721 ) ) ( not ( = ?auto_530709 ?auto_530722 ) ) ( not ( = ?auto_530710 ?auto_530711 ) ) ( not ( = ?auto_530710 ?auto_530712 ) ) ( not ( = ?auto_530710 ?auto_530713 ) ) ( not ( = ?auto_530710 ?auto_530714 ) ) ( not ( = ?auto_530710 ?auto_530715 ) ) ( not ( = ?auto_530710 ?auto_530716 ) ) ( not ( = ?auto_530710 ?auto_530717 ) ) ( not ( = ?auto_530710 ?auto_530718 ) ) ( not ( = ?auto_530710 ?auto_530719 ) ) ( not ( = ?auto_530710 ?auto_530720 ) ) ( not ( = ?auto_530710 ?auto_530721 ) ) ( not ( = ?auto_530710 ?auto_530722 ) ) ( not ( = ?auto_530711 ?auto_530712 ) ) ( not ( = ?auto_530711 ?auto_530713 ) ) ( not ( = ?auto_530711 ?auto_530714 ) ) ( not ( = ?auto_530711 ?auto_530715 ) ) ( not ( = ?auto_530711 ?auto_530716 ) ) ( not ( = ?auto_530711 ?auto_530717 ) ) ( not ( = ?auto_530711 ?auto_530718 ) ) ( not ( = ?auto_530711 ?auto_530719 ) ) ( not ( = ?auto_530711 ?auto_530720 ) ) ( not ( = ?auto_530711 ?auto_530721 ) ) ( not ( = ?auto_530711 ?auto_530722 ) ) ( not ( = ?auto_530712 ?auto_530713 ) ) ( not ( = ?auto_530712 ?auto_530714 ) ) ( not ( = ?auto_530712 ?auto_530715 ) ) ( not ( = ?auto_530712 ?auto_530716 ) ) ( not ( = ?auto_530712 ?auto_530717 ) ) ( not ( = ?auto_530712 ?auto_530718 ) ) ( not ( = ?auto_530712 ?auto_530719 ) ) ( not ( = ?auto_530712 ?auto_530720 ) ) ( not ( = ?auto_530712 ?auto_530721 ) ) ( not ( = ?auto_530712 ?auto_530722 ) ) ( not ( = ?auto_530713 ?auto_530714 ) ) ( not ( = ?auto_530713 ?auto_530715 ) ) ( not ( = ?auto_530713 ?auto_530716 ) ) ( not ( = ?auto_530713 ?auto_530717 ) ) ( not ( = ?auto_530713 ?auto_530718 ) ) ( not ( = ?auto_530713 ?auto_530719 ) ) ( not ( = ?auto_530713 ?auto_530720 ) ) ( not ( = ?auto_530713 ?auto_530721 ) ) ( not ( = ?auto_530713 ?auto_530722 ) ) ( not ( = ?auto_530714 ?auto_530715 ) ) ( not ( = ?auto_530714 ?auto_530716 ) ) ( not ( = ?auto_530714 ?auto_530717 ) ) ( not ( = ?auto_530714 ?auto_530718 ) ) ( not ( = ?auto_530714 ?auto_530719 ) ) ( not ( = ?auto_530714 ?auto_530720 ) ) ( not ( = ?auto_530714 ?auto_530721 ) ) ( not ( = ?auto_530714 ?auto_530722 ) ) ( not ( = ?auto_530715 ?auto_530716 ) ) ( not ( = ?auto_530715 ?auto_530717 ) ) ( not ( = ?auto_530715 ?auto_530718 ) ) ( not ( = ?auto_530715 ?auto_530719 ) ) ( not ( = ?auto_530715 ?auto_530720 ) ) ( not ( = ?auto_530715 ?auto_530721 ) ) ( not ( = ?auto_530715 ?auto_530722 ) ) ( not ( = ?auto_530716 ?auto_530717 ) ) ( not ( = ?auto_530716 ?auto_530718 ) ) ( not ( = ?auto_530716 ?auto_530719 ) ) ( not ( = ?auto_530716 ?auto_530720 ) ) ( not ( = ?auto_530716 ?auto_530721 ) ) ( not ( = ?auto_530716 ?auto_530722 ) ) ( not ( = ?auto_530717 ?auto_530718 ) ) ( not ( = ?auto_530717 ?auto_530719 ) ) ( not ( = ?auto_530717 ?auto_530720 ) ) ( not ( = ?auto_530717 ?auto_530721 ) ) ( not ( = ?auto_530717 ?auto_530722 ) ) ( not ( = ?auto_530718 ?auto_530719 ) ) ( not ( = ?auto_530718 ?auto_530720 ) ) ( not ( = ?auto_530718 ?auto_530721 ) ) ( not ( = ?auto_530718 ?auto_530722 ) ) ( not ( = ?auto_530719 ?auto_530720 ) ) ( not ( = ?auto_530719 ?auto_530721 ) ) ( not ( = ?auto_530719 ?auto_530722 ) ) ( not ( = ?auto_530720 ?auto_530721 ) ) ( not ( = ?auto_530720 ?auto_530722 ) ) ( not ( = ?auto_530721 ?auto_530722 ) ) ( ON ?auto_530720 ?auto_530721 ) ( ON ?auto_530719 ?auto_530720 ) ( ON ?auto_530718 ?auto_530719 ) ( ON ?auto_530717 ?auto_530718 ) ( CLEAR ?auto_530715 ) ( ON ?auto_530716 ?auto_530717 ) ( CLEAR ?auto_530716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_530709 ?auto_530710 ?auto_530711 ?auto_530712 ?auto_530713 ?auto_530714 ?auto_530715 ?auto_530716 )
      ( MAKE-13PILE ?auto_530709 ?auto_530710 ?auto_530711 ?auto_530712 ?auto_530713 ?auto_530714 ?auto_530715 ?auto_530716 ?auto_530717 ?auto_530718 ?auto_530719 ?auto_530720 ?auto_530721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530763 - BLOCK
      ?auto_530764 - BLOCK
      ?auto_530765 - BLOCK
      ?auto_530766 - BLOCK
      ?auto_530767 - BLOCK
      ?auto_530768 - BLOCK
      ?auto_530769 - BLOCK
      ?auto_530770 - BLOCK
      ?auto_530771 - BLOCK
      ?auto_530772 - BLOCK
      ?auto_530773 - BLOCK
      ?auto_530774 - BLOCK
      ?auto_530775 - BLOCK
    )
    :vars
    (
      ?auto_530776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530775 ?auto_530776 ) ( ON-TABLE ?auto_530763 ) ( ON ?auto_530764 ?auto_530763 ) ( ON ?auto_530765 ?auto_530764 ) ( ON ?auto_530766 ?auto_530765 ) ( ON ?auto_530767 ?auto_530766 ) ( ON ?auto_530768 ?auto_530767 ) ( not ( = ?auto_530763 ?auto_530764 ) ) ( not ( = ?auto_530763 ?auto_530765 ) ) ( not ( = ?auto_530763 ?auto_530766 ) ) ( not ( = ?auto_530763 ?auto_530767 ) ) ( not ( = ?auto_530763 ?auto_530768 ) ) ( not ( = ?auto_530763 ?auto_530769 ) ) ( not ( = ?auto_530763 ?auto_530770 ) ) ( not ( = ?auto_530763 ?auto_530771 ) ) ( not ( = ?auto_530763 ?auto_530772 ) ) ( not ( = ?auto_530763 ?auto_530773 ) ) ( not ( = ?auto_530763 ?auto_530774 ) ) ( not ( = ?auto_530763 ?auto_530775 ) ) ( not ( = ?auto_530763 ?auto_530776 ) ) ( not ( = ?auto_530764 ?auto_530765 ) ) ( not ( = ?auto_530764 ?auto_530766 ) ) ( not ( = ?auto_530764 ?auto_530767 ) ) ( not ( = ?auto_530764 ?auto_530768 ) ) ( not ( = ?auto_530764 ?auto_530769 ) ) ( not ( = ?auto_530764 ?auto_530770 ) ) ( not ( = ?auto_530764 ?auto_530771 ) ) ( not ( = ?auto_530764 ?auto_530772 ) ) ( not ( = ?auto_530764 ?auto_530773 ) ) ( not ( = ?auto_530764 ?auto_530774 ) ) ( not ( = ?auto_530764 ?auto_530775 ) ) ( not ( = ?auto_530764 ?auto_530776 ) ) ( not ( = ?auto_530765 ?auto_530766 ) ) ( not ( = ?auto_530765 ?auto_530767 ) ) ( not ( = ?auto_530765 ?auto_530768 ) ) ( not ( = ?auto_530765 ?auto_530769 ) ) ( not ( = ?auto_530765 ?auto_530770 ) ) ( not ( = ?auto_530765 ?auto_530771 ) ) ( not ( = ?auto_530765 ?auto_530772 ) ) ( not ( = ?auto_530765 ?auto_530773 ) ) ( not ( = ?auto_530765 ?auto_530774 ) ) ( not ( = ?auto_530765 ?auto_530775 ) ) ( not ( = ?auto_530765 ?auto_530776 ) ) ( not ( = ?auto_530766 ?auto_530767 ) ) ( not ( = ?auto_530766 ?auto_530768 ) ) ( not ( = ?auto_530766 ?auto_530769 ) ) ( not ( = ?auto_530766 ?auto_530770 ) ) ( not ( = ?auto_530766 ?auto_530771 ) ) ( not ( = ?auto_530766 ?auto_530772 ) ) ( not ( = ?auto_530766 ?auto_530773 ) ) ( not ( = ?auto_530766 ?auto_530774 ) ) ( not ( = ?auto_530766 ?auto_530775 ) ) ( not ( = ?auto_530766 ?auto_530776 ) ) ( not ( = ?auto_530767 ?auto_530768 ) ) ( not ( = ?auto_530767 ?auto_530769 ) ) ( not ( = ?auto_530767 ?auto_530770 ) ) ( not ( = ?auto_530767 ?auto_530771 ) ) ( not ( = ?auto_530767 ?auto_530772 ) ) ( not ( = ?auto_530767 ?auto_530773 ) ) ( not ( = ?auto_530767 ?auto_530774 ) ) ( not ( = ?auto_530767 ?auto_530775 ) ) ( not ( = ?auto_530767 ?auto_530776 ) ) ( not ( = ?auto_530768 ?auto_530769 ) ) ( not ( = ?auto_530768 ?auto_530770 ) ) ( not ( = ?auto_530768 ?auto_530771 ) ) ( not ( = ?auto_530768 ?auto_530772 ) ) ( not ( = ?auto_530768 ?auto_530773 ) ) ( not ( = ?auto_530768 ?auto_530774 ) ) ( not ( = ?auto_530768 ?auto_530775 ) ) ( not ( = ?auto_530768 ?auto_530776 ) ) ( not ( = ?auto_530769 ?auto_530770 ) ) ( not ( = ?auto_530769 ?auto_530771 ) ) ( not ( = ?auto_530769 ?auto_530772 ) ) ( not ( = ?auto_530769 ?auto_530773 ) ) ( not ( = ?auto_530769 ?auto_530774 ) ) ( not ( = ?auto_530769 ?auto_530775 ) ) ( not ( = ?auto_530769 ?auto_530776 ) ) ( not ( = ?auto_530770 ?auto_530771 ) ) ( not ( = ?auto_530770 ?auto_530772 ) ) ( not ( = ?auto_530770 ?auto_530773 ) ) ( not ( = ?auto_530770 ?auto_530774 ) ) ( not ( = ?auto_530770 ?auto_530775 ) ) ( not ( = ?auto_530770 ?auto_530776 ) ) ( not ( = ?auto_530771 ?auto_530772 ) ) ( not ( = ?auto_530771 ?auto_530773 ) ) ( not ( = ?auto_530771 ?auto_530774 ) ) ( not ( = ?auto_530771 ?auto_530775 ) ) ( not ( = ?auto_530771 ?auto_530776 ) ) ( not ( = ?auto_530772 ?auto_530773 ) ) ( not ( = ?auto_530772 ?auto_530774 ) ) ( not ( = ?auto_530772 ?auto_530775 ) ) ( not ( = ?auto_530772 ?auto_530776 ) ) ( not ( = ?auto_530773 ?auto_530774 ) ) ( not ( = ?auto_530773 ?auto_530775 ) ) ( not ( = ?auto_530773 ?auto_530776 ) ) ( not ( = ?auto_530774 ?auto_530775 ) ) ( not ( = ?auto_530774 ?auto_530776 ) ) ( not ( = ?auto_530775 ?auto_530776 ) ) ( ON ?auto_530774 ?auto_530775 ) ( ON ?auto_530773 ?auto_530774 ) ( ON ?auto_530772 ?auto_530773 ) ( ON ?auto_530771 ?auto_530772 ) ( ON ?auto_530770 ?auto_530771 ) ( CLEAR ?auto_530768 ) ( ON ?auto_530769 ?auto_530770 ) ( CLEAR ?auto_530769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_530763 ?auto_530764 ?auto_530765 ?auto_530766 ?auto_530767 ?auto_530768 ?auto_530769 )
      ( MAKE-13PILE ?auto_530763 ?auto_530764 ?auto_530765 ?auto_530766 ?auto_530767 ?auto_530768 ?auto_530769 ?auto_530770 ?auto_530771 ?auto_530772 ?auto_530773 ?auto_530774 ?auto_530775 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530817 - BLOCK
      ?auto_530818 - BLOCK
      ?auto_530819 - BLOCK
      ?auto_530820 - BLOCK
      ?auto_530821 - BLOCK
      ?auto_530822 - BLOCK
      ?auto_530823 - BLOCK
      ?auto_530824 - BLOCK
      ?auto_530825 - BLOCK
      ?auto_530826 - BLOCK
      ?auto_530827 - BLOCK
      ?auto_530828 - BLOCK
      ?auto_530829 - BLOCK
    )
    :vars
    (
      ?auto_530830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530829 ?auto_530830 ) ( ON-TABLE ?auto_530817 ) ( ON ?auto_530818 ?auto_530817 ) ( ON ?auto_530819 ?auto_530818 ) ( ON ?auto_530820 ?auto_530819 ) ( ON ?auto_530821 ?auto_530820 ) ( not ( = ?auto_530817 ?auto_530818 ) ) ( not ( = ?auto_530817 ?auto_530819 ) ) ( not ( = ?auto_530817 ?auto_530820 ) ) ( not ( = ?auto_530817 ?auto_530821 ) ) ( not ( = ?auto_530817 ?auto_530822 ) ) ( not ( = ?auto_530817 ?auto_530823 ) ) ( not ( = ?auto_530817 ?auto_530824 ) ) ( not ( = ?auto_530817 ?auto_530825 ) ) ( not ( = ?auto_530817 ?auto_530826 ) ) ( not ( = ?auto_530817 ?auto_530827 ) ) ( not ( = ?auto_530817 ?auto_530828 ) ) ( not ( = ?auto_530817 ?auto_530829 ) ) ( not ( = ?auto_530817 ?auto_530830 ) ) ( not ( = ?auto_530818 ?auto_530819 ) ) ( not ( = ?auto_530818 ?auto_530820 ) ) ( not ( = ?auto_530818 ?auto_530821 ) ) ( not ( = ?auto_530818 ?auto_530822 ) ) ( not ( = ?auto_530818 ?auto_530823 ) ) ( not ( = ?auto_530818 ?auto_530824 ) ) ( not ( = ?auto_530818 ?auto_530825 ) ) ( not ( = ?auto_530818 ?auto_530826 ) ) ( not ( = ?auto_530818 ?auto_530827 ) ) ( not ( = ?auto_530818 ?auto_530828 ) ) ( not ( = ?auto_530818 ?auto_530829 ) ) ( not ( = ?auto_530818 ?auto_530830 ) ) ( not ( = ?auto_530819 ?auto_530820 ) ) ( not ( = ?auto_530819 ?auto_530821 ) ) ( not ( = ?auto_530819 ?auto_530822 ) ) ( not ( = ?auto_530819 ?auto_530823 ) ) ( not ( = ?auto_530819 ?auto_530824 ) ) ( not ( = ?auto_530819 ?auto_530825 ) ) ( not ( = ?auto_530819 ?auto_530826 ) ) ( not ( = ?auto_530819 ?auto_530827 ) ) ( not ( = ?auto_530819 ?auto_530828 ) ) ( not ( = ?auto_530819 ?auto_530829 ) ) ( not ( = ?auto_530819 ?auto_530830 ) ) ( not ( = ?auto_530820 ?auto_530821 ) ) ( not ( = ?auto_530820 ?auto_530822 ) ) ( not ( = ?auto_530820 ?auto_530823 ) ) ( not ( = ?auto_530820 ?auto_530824 ) ) ( not ( = ?auto_530820 ?auto_530825 ) ) ( not ( = ?auto_530820 ?auto_530826 ) ) ( not ( = ?auto_530820 ?auto_530827 ) ) ( not ( = ?auto_530820 ?auto_530828 ) ) ( not ( = ?auto_530820 ?auto_530829 ) ) ( not ( = ?auto_530820 ?auto_530830 ) ) ( not ( = ?auto_530821 ?auto_530822 ) ) ( not ( = ?auto_530821 ?auto_530823 ) ) ( not ( = ?auto_530821 ?auto_530824 ) ) ( not ( = ?auto_530821 ?auto_530825 ) ) ( not ( = ?auto_530821 ?auto_530826 ) ) ( not ( = ?auto_530821 ?auto_530827 ) ) ( not ( = ?auto_530821 ?auto_530828 ) ) ( not ( = ?auto_530821 ?auto_530829 ) ) ( not ( = ?auto_530821 ?auto_530830 ) ) ( not ( = ?auto_530822 ?auto_530823 ) ) ( not ( = ?auto_530822 ?auto_530824 ) ) ( not ( = ?auto_530822 ?auto_530825 ) ) ( not ( = ?auto_530822 ?auto_530826 ) ) ( not ( = ?auto_530822 ?auto_530827 ) ) ( not ( = ?auto_530822 ?auto_530828 ) ) ( not ( = ?auto_530822 ?auto_530829 ) ) ( not ( = ?auto_530822 ?auto_530830 ) ) ( not ( = ?auto_530823 ?auto_530824 ) ) ( not ( = ?auto_530823 ?auto_530825 ) ) ( not ( = ?auto_530823 ?auto_530826 ) ) ( not ( = ?auto_530823 ?auto_530827 ) ) ( not ( = ?auto_530823 ?auto_530828 ) ) ( not ( = ?auto_530823 ?auto_530829 ) ) ( not ( = ?auto_530823 ?auto_530830 ) ) ( not ( = ?auto_530824 ?auto_530825 ) ) ( not ( = ?auto_530824 ?auto_530826 ) ) ( not ( = ?auto_530824 ?auto_530827 ) ) ( not ( = ?auto_530824 ?auto_530828 ) ) ( not ( = ?auto_530824 ?auto_530829 ) ) ( not ( = ?auto_530824 ?auto_530830 ) ) ( not ( = ?auto_530825 ?auto_530826 ) ) ( not ( = ?auto_530825 ?auto_530827 ) ) ( not ( = ?auto_530825 ?auto_530828 ) ) ( not ( = ?auto_530825 ?auto_530829 ) ) ( not ( = ?auto_530825 ?auto_530830 ) ) ( not ( = ?auto_530826 ?auto_530827 ) ) ( not ( = ?auto_530826 ?auto_530828 ) ) ( not ( = ?auto_530826 ?auto_530829 ) ) ( not ( = ?auto_530826 ?auto_530830 ) ) ( not ( = ?auto_530827 ?auto_530828 ) ) ( not ( = ?auto_530827 ?auto_530829 ) ) ( not ( = ?auto_530827 ?auto_530830 ) ) ( not ( = ?auto_530828 ?auto_530829 ) ) ( not ( = ?auto_530828 ?auto_530830 ) ) ( not ( = ?auto_530829 ?auto_530830 ) ) ( ON ?auto_530828 ?auto_530829 ) ( ON ?auto_530827 ?auto_530828 ) ( ON ?auto_530826 ?auto_530827 ) ( ON ?auto_530825 ?auto_530826 ) ( ON ?auto_530824 ?auto_530825 ) ( ON ?auto_530823 ?auto_530824 ) ( CLEAR ?auto_530821 ) ( ON ?auto_530822 ?auto_530823 ) ( CLEAR ?auto_530822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_530817 ?auto_530818 ?auto_530819 ?auto_530820 ?auto_530821 ?auto_530822 )
      ( MAKE-13PILE ?auto_530817 ?auto_530818 ?auto_530819 ?auto_530820 ?auto_530821 ?auto_530822 ?auto_530823 ?auto_530824 ?auto_530825 ?auto_530826 ?auto_530827 ?auto_530828 ?auto_530829 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530871 - BLOCK
      ?auto_530872 - BLOCK
      ?auto_530873 - BLOCK
      ?auto_530874 - BLOCK
      ?auto_530875 - BLOCK
      ?auto_530876 - BLOCK
      ?auto_530877 - BLOCK
      ?auto_530878 - BLOCK
      ?auto_530879 - BLOCK
      ?auto_530880 - BLOCK
      ?auto_530881 - BLOCK
      ?auto_530882 - BLOCK
      ?auto_530883 - BLOCK
    )
    :vars
    (
      ?auto_530884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530883 ?auto_530884 ) ( ON-TABLE ?auto_530871 ) ( ON ?auto_530872 ?auto_530871 ) ( ON ?auto_530873 ?auto_530872 ) ( ON ?auto_530874 ?auto_530873 ) ( not ( = ?auto_530871 ?auto_530872 ) ) ( not ( = ?auto_530871 ?auto_530873 ) ) ( not ( = ?auto_530871 ?auto_530874 ) ) ( not ( = ?auto_530871 ?auto_530875 ) ) ( not ( = ?auto_530871 ?auto_530876 ) ) ( not ( = ?auto_530871 ?auto_530877 ) ) ( not ( = ?auto_530871 ?auto_530878 ) ) ( not ( = ?auto_530871 ?auto_530879 ) ) ( not ( = ?auto_530871 ?auto_530880 ) ) ( not ( = ?auto_530871 ?auto_530881 ) ) ( not ( = ?auto_530871 ?auto_530882 ) ) ( not ( = ?auto_530871 ?auto_530883 ) ) ( not ( = ?auto_530871 ?auto_530884 ) ) ( not ( = ?auto_530872 ?auto_530873 ) ) ( not ( = ?auto_530872 ?auto_530874 ) ) ( not ( = ?auto_530872 ?auto_530875 ) ) ( not ( = ?auto_530872 ?auto_530876 ) ) ( not ( = ?auto_530872 ?auto_530877 ) ) ( not ( = ?auto_530872 ?auto_530878 ) ) ( not ( = ?auto_530872 ?auto_530879 ) ) ( not ( = ?auto_530872 ?auto_530880 ) ) ( not ( = ?auto_530872 ?auto_530881 ) ) ( not ( = ?auto_530872 ?auto_530882 ) ) ( not ( = ?auto_530872 ?auto_530883 ) ) ( not ( = ?auto_530872 ?auto_530884 ) ) ( not ( = ?auto_530873 ?auto_530874 ) ) ( not ( = ?auto_530873 ?auto_530875 ) ) ( not ( = ?auto_530873 ?auto_530876 ) ) ( not ( = ?auto_530873 ?auto_530877 ) ) ( not ( = ?auto_530873 ?auto_530878 ) ) ( not ( = ?auto_530873 ?auto_530879 ) ) ( not ( = ?auto_530873 ?auto_530880 ) ) ( not ( = ?auto_530873 ?auto_530881 ) ) ( not ( = ?auto_530873 ?auto_530882 ) ) ( not ( = ?auto_530873 ?auto_530883 ) ) ( not ( = ?auto_530873 ?auto_530884 ) ) ( not ( = ?auto_530874 ?auto_530875 ) ) ( not ( = ?auto_530874 ?auto_530876 ) ) ( not ( = ?auto_530874 ?auto_530877 ) ) ( not ( = ?auto_530874 ?auto_530878 ) ) ( not ( = ?auto_530874 ?auto_530879 ) ) ( not ( = ?auto_530874 ?auto_530880 ) ) ( not ( = ?auto_530874 ?auto_530881 ) ) ( not ( = ?auto_530874 ?auto_530882 ) ) ( not ( = ?auto_530874 ?auto_530883 ) ) ( not ( = ?auto_530874 ?auto_530884 ) ) ( not ( = ?auto_530875 ?auto_530876 ) ) ( not ( = ?auto_530875 ?auto_530877 ) ) ( not ( = ?auto_530875 ?auto_530878 ) ) ( not ( = ?auto_530875 ?auto_530879 ) ) ( not ( = ?auto_530875 ?auto_530880 ) ) ( not ( = ?auto_530875 ?auto_530881 ) ) ( not ( = ?auto_530875 ?auto_530882 ) ) ( not ( = ?auto_530875 ?auto_530883 ) ) ( not ( = ?auto_530875 ?auto_530884 ) ) ( not ( = ?auto_530876 ?auto_530877 ) ) ( not ( = ?auto_530876 ?auto_530878 ) ) ( not ( = ?auto_530876 ?auto_530879 ) ) ( not ( = ?auto_530876 ?auto_530880 ) ) ( not ( = ?auto_530876 ?auto_530881 ) ) ( not ( = ?auto_530876 ?auto_530882 ) ) ( not ( = ?auto_530876 ?auto_530883 ) ) ( not ( = ?auto_530876 ?auto_530884 ) ) ( not ( = ?auto_530877 ?auto_530878 ) ) ( not ( = ?auto_530877 ?auto_530879 ) ) ( not ( = ?auto_530877 ?auto_530880 ) ) ( not ( = ?auto_530877 ?auto_530881 ) ) ( not ( = ?auto_530877 ?auto_530882 ) ) ( not ( = ?auto_530877 ?auto_530883 ) ) ( not ( = ?auto_530877 ?auto_530884 ) ) ( not ( = ?auto_530878 ?auto_530879 ) ) ( not ( = ?auto_530878 ?auto_530880 ) ) ( not ( = ?auto_530878 ?auto_530881 ) ) ( not ( = ?auto_530878 ?auto_530882 ) ) ( not ( = ?auto_530878 ?auto_530883 ) ) ( not ( = ?auto_530878 ?auto_530884 ) ) ( not ( = ?auto_530879 ?auto_530880 ) ) ( not ( = ?auto_530879 ?auto_530881 ) ) ( not ( = ?auto_530879 ?auto_530882 ) ) ( not ( = ?auto_530879 ?auto_530883 ) ) ( not ( = ?auto_530879 ?auto_530884 ) ) ( not ( = ?auto_530880 ?auto_530881 ) ) ( not ( = ?auto_530880 ?auto_530882 ) ) ( not ( = ?auto_530880 ?auto_530883 ) ) ( not ( = ?auto_530880 ?auto_530884 ) ) ( not ( = ?auto_530881 ?auto_530882 ) ) ( not ( = ?auto_530881 ?auto_530883 ) ) ( not ( = ?auto_530881 ?auto_530884 ) ) ( not ( = ?auto_530882 ?auto_530883 ) ) ( not ( = ?auto_530882 ?auto_530884 ) ) ( not ( = ?auto_530883 ?auto_530884 ) ) ( ON ?auto_530882 ?auto_530883 ) ( ON ?auto_530881 ?auto_530882 ) ( ON ?auto_530880 ?auto_530881 ) ( ON ?auto_530879 ?auto_530880 ) ( ON ?auto_530878 ?auto_530879 ) ( ON ?auto_530877 ?auto_530878 ) ( ON ?auto_530876 ?auto_530877 ) ( CLEAR ?auto_530874 ) ( ON ?auto_530875 ?auto_530876 ) ( CLEAR ?auto_530875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_530871 ?auto_530872 ?auto_530873 ?auto_530874 ?auto_530875 )
      ( MAKE-13PILE ?auto_530871 ?auto_530872 ?auto_530873 ?auto_530874 ?auto_530875 ?auto_530876 ?auto_530877 ?auto_530878 ?auto_530879 ?auto_530880 ?auto_530881 ?auto_530882 ?auto_530883 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530925 - BLOCK
      ?auto_530926 - BLOCK
      ?auto_530927 - BLOCK
      ?auto_530928 - BLOCK
      ?auto_530929 - BLOCK
      ?auto_530930 - BLOCK
      ?auto_530931 - BLOCK
      ?auto_530932 - BLOCK
      ?auto_530933 - BLOCK
      ?auto_530934 - BLOCK
      ?auto_530935 - BLOCK
      ?auto_530936 - BLOCK
      ?auto_530937 - BLOCK
    )
    :vars
    (
      ?auto_530938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530937 ?auto_530938 ) ( ON-TABLE ?auto_530925 ) ( ON ?auto_530926 ?auto_530925 ) ( ON ?auto_530927 ?auto_530926 ) ( not ( = ?auto_530925 ?auto_530926 ) ) ( not ( = ?auto_530925 ?auto_530927 ) ) ( not ( = ?auto_530925 ?auto_530928 ) ) ( not ( = ?auto_530925 ?auto_530929 ) ) ( not ( = ?auto_530925 ?auto_530930 ) ) ( not ( = ?auto_530925 ?auto_530931 ) ) ( not ( = ?auto_530925 ?auto_530932 ) ) ( not ( = ?auto_530925 ?auto_530933 ) ) ( not ( = ?auto_530925 ?auto_530934 ) ) ( not ( = ?auto_530925 ?auto_530935 ) ) ( not ( = ?auto_530925 ?auto_530936 ) ) ( not ( = ?auto_530925 ?auto_530937 ) ) ( not ( = ?auto_530925 ?auto_530938 ) ) ( not ( = ?auto_530926 ?auto_530927 ) ) ( not ( = ?auto_530926 ?auto_530928 ) ) ( not ( = ?auto_530926 ?auto_530929 ) ) ( not ( = ?auto_530926 ?auto_530930 ) ) ( not ( = ?auto_530926 ?auto_530931 ) ) ( not ( = ?auto_530926 ?auto_530932 ) ) ( not ( = ?auto_530926 ?auto_530933 ) ) ( not ( = ?auto_530926 ?auto_530934 ) ) ( not ( = ?auto_530926 ?auto_530935 ) ) ( not ( = ?auto_530926 ?auto_530936 ) ) ( not ( = ?auto_530926 ?auto_530937 ) ) ( not ( = ?auto_530926 ?auto_530938 ) ) ( not ( = ?auto_530927 ?auto_530928 ) ) ( not ( = ?auto_530927 ?auto_530929 ) ) ( not ( = ?auto_530927 ?auto_530930 ) ) ( not ( = ?auto_530927 ?auto_530931 ) ) ( not ( = ?auto_530927 ?auto_530932 ) ) ( not ( = ?auto_530927 ?auto_530933 ) ) ( not ( = ?auto_530927 ?auto_530934 ) ) ( not ( = ?auto_530927 ?auto_530935 ) ) ( not ( = ?auto_530927 ?auto_530936 ) ) ( not ( = ?auto_530927 ?auto_530937 ) ) ( not ( = ?auto_530927 ?auto_530938 ) ) ( not ( = ?auto_530928 ?auto_530929 ) ) ( not ( = ?auto_530928 ?auto_530930 ) ) ( not ( = ?auto_530928 ?auto_530931 ) ) ( not ( = ?auto_530928 ?auto_530932 ) ) ( not ( = ?auto_530928 ?auto_530933 ) ) ( not ( = ?auto_530928 ?auto_530934 ) ) ( not ( = ?auto_530928 ?auto_530935 ) ) ( not ( = ?auto_530928 ?auto_530936 ) ) ( not ( = ?auto_530928 ?auto_530937 ) ) ( not ( = ?auto_530928 ?auto_530938 ) ) ( not ( = ?auto_530929 ?auto_530930 ) ) ( not ( = ?auto_530929 ?auto_530931 ) ) ( not ( = ?auto_530929 ?auto_530932 ) ) ( not ( = ?auto_530929 ?auto_530933 ) ) ( not ( = ?auto_530929 ?auto_530934 ) ) ( not ( = ?auto_530929 ?auto_530935 ) ) ( not ( = ?auto_530929 ?auto_530936 ) ) ( not ( = ?auto_530929 ?auto_530937 ) ) ( not ( = ?auto_530929 ?auto_530938 ) ) ( not ( = ?auto_530930 ?auto_530931 ) ) ( not ( = ?auto_530930 ?auto_530932 ) ) ( not ( = ?auto_530930 ?auto_530933 ) ) ( not ( = ?auto_530930 ?auto_530934 ) ) ( not ( = ?auto_530930 ?auto_530935 ) ) ( not ( = ?auto_530930 ?auto_530936 ) ) ( not ( = ?auto_530930 ?auto_530937 ) ) ( not ( = ?auto_530930 ?auto_530938 ) ) ( not ( = ?auto_530931 ?auto_530932 ) ) ( not ( = ?auto_530931 ?auto_530933 ) ) ( not ( = ?auto_530931 ?auto_530934 ) ) ( not ( = ?auto_530931 ?auto_530935 ) ) ( not ( = ?auto_530931 ?auto_530936 ) ) ( not ( = ?auto_530931 ?auto_530937 ) ) ( not ( = ?auto_530931 ?auto_530938 ) ) ( not ( = ?auto_530932 ?auto_530933 ) ) ( not ( = ?auto_530932 ?auto_530934 ) ) ( not ( = ?auto_530932 ?auto_530935 ) ) ( not ( = ?auto_530932 ?auto_530936 ) ) ( not ( = ?auto_530932 ?auto_530937 ) ) ( not ( = ?auto_530932 ?auto_530938 ) ) ( not ( = ?auto_530933 ?auto_530934 ) ) ( not ( = ?auto_530933 ?auto_530935 ) ) ( not ( = ?auto_530933 ?auto_530936 ) ) ( not ( = ?auto_530933 ?auto_530937 ) ) ( not ( = ?auto_530933 ?auto_530938 ) ) ( not ( = ?auto_530934 ?auto_530935 ) ) ( not ( = ?auto_530934 ?auto_530936 ) ) ( not ( = ?auto_530934 ?auto_530937 ) ) ( not ( = ?auto_530934 ?auto_530938 ) ) ( not ( = ?auto_530935 ?auto_530936 ) ) ( not ( = ?auto_530935 ?auto_530937 ) ) ( not ( = ?auto_530935 ?auto_530938 ) ) ( not ( = ?auto_530936 ?auto_530937 ) ) ( not ( = ?auto_530936 ?auto_530938 ) ) ( not ( = ?auto_530937 ?auto_530938 ) ) ( ON ?auto_530936 ?auto_530937 ) ( ON ?auto_530935 ?auto_530936 ) ( ON ?auto_530934 ?auto_530935 ) ( ON ?auto_530933 ?auto_530934 ) ( ON ?auto_530932 ?auto_530933 ) ( ON ?auto_530931 ?auto_530932 ) ( ON ?auto_530930 ?auto_530931 ) ( ON ?auto_530929 ?auto_530930 ) ( CLEAR ?auto_530927 ) ( ON ?auto_530928 ?auto_530929 ) ( CLEAR ?auto_530928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_530925 ?auto_530926 ?auto_530927 ?auto_530928 )
      ( MAKE-13PILE ?auto_530925 ?auto_530926 ?auto_530927 ?auto_530928 ?auto_530929 ?auto_530930 ?auto_530931 ?auto_530932 ?auto_530933 ?auto_530934 ?auto_530935 ?auto_530936 ?auto_530937 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_530979 - BLOCK
      ?auto_530980 - BLOCK
      ?auto_530981 - BLOCK
      ?auto_530982 - BLOCK
      ?auto_530983 - BLOCK
      ?auto_530984 - BLOCK
      ?auto_530985 - BLOCK
      ?auto_530986 - BLOCK
      ?auto_530987 - BLOCK
      ?auto_530988 - BLOCK
      ?auto_530989 - BLOCK
      ?auto_530990 - BLOCK
      ?auto_530991 - BLOCK
    )
    :vars
    (
      ?auto_530992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_530991 ?auto_530992 ) ( ON-TABLE ?auto_530979 ) ( ON ?auto_530980 ?auto_530979 ) ( not ( = ?auto_530979 ?auto_530980 ) ) ( not ( = ?auto_530979 ?auto_530981 ) ) ( not ( = ?auto_530979 ?auto_530982 ) ) ( not ( = ?auto_530979 ?auto_530983 ) ) ( not ( = ?auto_530979 ?auto_530984 ) ) ( not ( = ?auto_530979 ?auto_530985 ) ) ( not ( = ?auto_530979 ?auto_530986 ) ) ( not ( = ?auto_530979 ?auto_530987 ) ) ( not ( = ?auto_530979 ?auto_530988 ) ) ( not ( = ?auto_530979 ?auto_530989 ) ) ( not ( = ?auto_530979 ?auto_530990 ) ) ( not ( = ?auto_530979 ?auto_530991 ) ) ( not ( = ?auto_530979 ?auto_530992 ) ) ( not ( = ?auto_530980 ?auto_530981 ) ) ( not ( = ?auto_530980 ?auto_530982 ) ) ( not ( = ?auto_530980 ?auto_530983 ) ) ( not ( = ?auto_530980 ?auto_530984 ) ) ( not ( = ?auto_530980 ?auto_530985 ) ) ( not ( = ?auto_530980 ?auto_530986 ) ) ( not ( = ?auto_530980 ?auto_530987 ) ) ( not ( = ?auto_530980 ?auto_530988 ) ) ( not ( = ?auto_530980 ?auto_530989 ) ) ( not ( = ?auto_530980 ?auto_530990 ) ) ( not ( = ?auto_530980 ?auto_530991 ) ) ( not ( = ?auto_530980 ?auto_530992 ) ) ( not ( = ?auto_530981 ?auto_530982 ) ) ( not ( = ?auto_530981 ?auto_530983 ) ) ( not ( = ?auto_530981 ?auto_530984 ) ) ( not ( = ?auto_530981 ?auto_530985 ) ) ( not ( = ?auto_530981 ?auto_530986 ) ) ( not ( = ?auto_530981 ?auto_530987 ) ) ( not ( = ?auto_530981 ?auto_530988 ) ) ( not ( = ?auto_530981 ?auto_530989 ) ) ( not ( = ?auto_530981 ?auto_530990 ) ) ( not ( = ?auto_530981 ?auto_530991 ) ) ( not ( = ?auto_530981 ?auto_530992 ) ) ( not ( = ?auto_530982 ?auto_530983 ) ) ( not ( = ?auto_530982 ?auto_530984 ) ) ( not ( = ?auto_530982 ?auto_530985 ) ) ( not ( = ?auto_530982 ?auto_530986 ) ) ( not ( = ?auto_530982 ?auto_530987 ) ) ( not ( = ?auto_530982 ?auto_530988 ) ) ( not ( = ?auto_530982 ?auto_530989 ) ) ( not ( = ?auto_530982 ?auto_530990 ) ) ( not ( = ?auto_530982 ?auto_530991 ) ) ( not ( = ?auto_530982 ?auto_530992 ) ) ( not ( = ?auto_530983 ?auto_530984 ) ) ( not ( = ?auto_530983 ?auto_530985 ) ) ( not ( = ?auto_530983 ?auto_530986 ) ) ( not ( = ?auto_530983 ?auto_530987 ) ) ( not ( = ?auto_530983 ?auto_530988 ) ) ( not ( = ?auto_530983 ?auto_530989 ) ) ( not ( = ?auto_530983 ?auto_530990 ) ) ( not ( = ?auto_530983 ?auto_530991 ) ) ( not ( = ?auto_530983 ?auto_530992 ) ) ( not ( = ?auto_530984 ?auto_530985 ) ) ( not ( = ?auto_530984 ?auto_530986 ) ) ( not ( = ?auto_530984 ?auto_530987 ) ) ( not ( = ?auto_530984 ?auto_530988 ) ) ( not ( = ?auto_530984 ?auto_530989 ) ) ( not ( = ?auto_530984 ?auto_530990 ) ) ( not ( = ?auto_530984 ?auto_530991 ) ) ( not ( = ?auto_530984 ?auto_530992 ) ) ( not ( = ?auto_530985 ?auto_530986 ) ) ( not ( = ?auto_530985 ?auto_530987 ) ) ( not ( = ?auto_530985 ?auto_530988 ) ) ( not ( = ?auto_530985 ?auto_530989 ) ) ( not ( = ?auto_530985 ?auto_530990 ) ) ( not ( = ?auto_530985 ?auto_530991 ) ) ( not ( = ?auto_530985 ?auto_530992 ) ) ( not ( = ?auto_530986 ?auto_530987 ) ) ( not ( = ?auto_530986 ?auto_530988 ) ) ( not ( = ?auto_530986 ?auto_530989 ) ) ( not ( = ?auto_530986 ?auto_530990 ) ) ( not ( = ?auto_530986 ?auto_530991 ) ) ( not ( = ?auto_530986 ?auto_530992 ) ) ( not ( = ?auto_530987 ?auto_530988 ) ) ( not ( = ?auto_530987 ?auto_530989 ) ) ( not ( = ?auto_530987 ?auto_530990 ) ) ( not ( = ?auto_530987 ?auto_530991 ) ) ( not ( = ?auto_530987 ?auto_530992 ) ) ( not ( = ?auto_530988 ?auto_530989 ) ) ( not ( = ?auto_530988 ?auto_530990 ) ) ( not ( = ?auto_530988 ?auto_530991 ) ) ( not ( = ?auto_530988 ?auto_530992 ) ) ( not ( = ?auto_530989 ?auto_530990 ) ) ( not ( = ?auto_530989 ?auto_530991 ) ) ( not ( = ?auto_530989 ?auto_530992 ) ) ( not ( = ?auto_530990 ?auto_530991 ) ) ( not ( = ?auto_530990 ?auto_530992 ) ) ( not ( = ?auto_530991 ?auto_530992 ) ) ( ON ?auto_530990 ?auto_530991 ) ( ON ?auto_530989 ?auto_530990 ) ( ON ?auto_530988 ?auto_530989 ) ( ON ?auto_530987 ?auto_530988 ) ( ON ?auto_530986 ?auto_530987 ) ( ON ?auto_530985 ?auto_530986 ) ( ON ?auto_530984 ?auto_530985 ) ( ON ?auto_530983 ?auto_530984 ) ( ON ?auto_530982 ?auto_530983 ) ( CLEAR ?auto_530980 ) ( ON ?auto_530981 ?auto_530982 ) ( CLEAR ?auto_530981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_530979 ?auto_530980 ?auto_530981 )
      ( MAKE-13PILE ?auto_530979 ?auto_530980 ?auto_530981 ?auto_530982 ?auto_530983 ?auto_530984 ?auto_530985 ?auto_530986 ?auto_530987 ?auto_530988 ?auto_530989 ?auto_530990 ?auto_530991 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_531033 - BLOCK
      ?auto_531034 - BLOCK
      ?auto_531035 - BLOCK
      ?auto_531036 - BLOCK
      ?auto_531037 - BLOCK
      ?auto_531038 - BLOCK
      ?auto_531039 - BLOCK
      ?auto_531040 - BLOCK
      ?auto_531041 - BLOCK
      ?auto_531042 - BLOCK
      ?auto_531043 - BLOCK
      ?auto_531044 - BLOCK
      ?auto_531045 - BLOCK
    )
    :vars
    (
      ?auto_531046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531045 ?auto_531046 ) ( ON-TABLE ?auto_531033 ) ( not ( = ?auto_531033 ?auto_531034 ) ) ( not ( = ?auto_531033 ?auto_531035 ) ) ( not ( = ?auto_531033 ?auto_531036 ) ) ( not ( = ?auto_531033 ?auto_531037 ) ) ( not ( = ?auto_531033 ?auto_531038 ) ) ( not ( = ?auto_531033 ?auto_531039 ) ) ( not ( = ?auto_531033 ?auto_531040 ) ) ( not ( = ?auto_531033 ?auto_531041 ) ) ( not ( = ?auto_531033 ?auto_531042 ) ) ( not ( = ?auto_531033 ?auto_531043 ) ) ( not ( = ?auto_531033 ?auto_531044 ) ) ( not ( = ?auto_531033 ?auto_531045 ) ) ( not ( = ?auto_531033 ?auto_531046 ) ) ( not ( = ?auto_531034 ?auto_531035 ) ) ( not ( = ?auto_531034 ?auto_531036 ) ) ( not ( = ?auto_531034 ?auto_531037 ) ) ( not ( = ?auto_531034 ?auto_531038 ) ) ( not ( = ?auto_531034 ?auto_531039 ) ) ( not ( = ?auto_531034 ?auto_531040 ) ) ( not ( = ?auto_531034 ?auto_531041 ) ) ( not ( = ?auto_531034 ?auto_531042 ) ) ( not ( = ?auto_531034 ?auto_531043 ) ) ( not ( = ?auto_531034 ?auto_531044 ) ) ( not ( = ?auto_531034 ?auto_531045 ) ) ( not ( = ?auto_531034 ?auto_531046 ) ) ( not ( = ?auto_531035 ?auto_531036 ) ) ( not ( = ?auto_531035 ?auto_531037 ) ) ( not ( = ?auto_531035 ?auto_531038 ) ) ( not ( = ?auto_531035 ?auto_531039 ) ) ( not ( = ?auto_531035 ?auto_531040 ) ) ( not ( = ?auto_531035 ?auto_531041 ) ) ( not ( = ?auto_531035 ?auto_531042 ) ) ( not ( = ?auto_531035 ?auto_531043 ) ) ( not ( = ?auto_531035 ?auto_531044 ) ) ( not ( = ?auto_531035 ?auto_531045 ) ) ( not ( = ?auto_531035 ?auto_531046 ) ) ( not ( = ?auto_531036 ?auto_531037 ) ) ( not ( = ?auto_531036 ?auto_531038 ) ) ( not ( = ?auto_531036 ?auto_531039 ) ) ( not ( = ?auto_531036 ?auto_531040 ) ) ( not ( = ?auto_531036 ?auto_531041 ) ) ( not ( = ?auto_531036 ?auto_531042 ) ) ( not ( = ?auto_531036 ?auto_531043 ) ) ( not ( = ?auto_531036 ?auto_531044 ) ) ( not ( = ?auto_531036 ?auto_531045 ) ) ( not ( = ?auto_531036 ?auto_531046 ) ) ( not ( = ?auto_531037 ?auto_531038 ) ) ( not ( = ?auto_531037 ?auto_531039 ) ) ( not ( = ?auto_531037 ?auto_531040 ) ) ( not ( = ?auto_531037 ?auto_531041 ) ) ( not ( = ?auto_531037 ?auto_531042 ) ) ( not ( = ?auto_531037 ?auto_531043 ) ) ( not ( = ?auto_531037 ?auto_531044 ) ) ( not ( = ?auto_531037 ?auto_531045 ) ) ( not ( = ?auto_531037 ?auto_531046 ) ) ( not ( = ?auto_531038 ?auto_531039 ) ) ( not ( = ?auto_531038 ?auto_531040 ) ) ( not ( = ?auto_531038 ?auto_531041 ) ) ( not ( = ?auto_531038 ?auto_531042 ) ) ( not ( = ?auto_531038 ?auto_531043 ) ) ( not ( = ?auto_531038 ?auto_531044 ) ) ( not ( = ?auto_531038 ?auto_531045 ) ) ( not ( = ?auto_531038 ?auto_531046 ) ) ( not ( = ?auto_531039 ?auto_531040 ) ) ( not ( = ?auto_531039 ?auto_531041 ) ) ( not ( = ?auto_531039 ?auto_531042 ) ) ( not ( = ?auto_531039 ?auto_531043 ) ) ( not ( = ?auto_531039 ?auto_531044 ) ) ( not ( = ?auto_531039 ?auto_531045 ) ) ( not ( = ?auto_531039 ?auto_531046 ) ) ( not ( = ?auto_531040 ?auto_531041 ) ) ( not ( = ?auto_531040 ?auto_531042 ) ) ( not ( = ?auto_531040 ?auto_531043 ) ) ( not ( = ?auto_531040 ?auto_531044 ) ) ( not ( = ?auto_531040 ?auto_531045 ) ) ( not ( = ?auto_531040 ?auto_531046 ) ) ( not ( = ?auto_531041 ?auto_531042 ) ) ( not ( = ?auto_531041 ?auto_531043 ) ) ( not ( = ?auto_531041 ?auto_531044 ) ) ( not ( = ?auto_531041 ?auto_531045 ) ) ( not ( = ?auto_531041 ?auto_531046 ) ) ( not ( = ?auto_531042 ?auto_531043 ) ) ( not ( = ?auto_531042 ?auto_531044 ) ) ( not ( = ?auto_531042 ?auto_531045 ) ) ( not ( = ?auto_531042 ?auto_531046 ) ) ( not ( = ?auto_531043 ?auto_531044 ) ) ( not ( = ?auto_531043 ?auto_531045 ) ) ( not ( = ?auto_531043 ?auto_531046 ) ) ( not ( = ?auto_531044 ?auto_531045 ) ) ( not ( = ?auto_531044 ?auto_531046 ) ) ( not ( = ?auto_531045 ?auto_531046 ) ) ( ON ?auto_531044 ?auto_531045 ) ( ON ?auto_531043 ?auto_531044 ) ( ON ?auto_531042 ?auto_531043 ) ( ON ?auto_531041 ?auto_531042 ) ( ON ?auto_531040 ?auto_531041 ) ( ON ?auto_531039 ?auto_531040 ) ( ON ?auto_531038 ?auto_531039 ) ( ON ?auto_531037 ?auto_531038 ) ( ON ?auto_531036 ?auto_531037 ) ( ON ?auto_531035 ?auto_531036 ) ( CLEAR ?auto_531033 ) ( ON ?auto_531034 ?auto_531035 ) ( CLEAR ?auto_531034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_531033 ?auto_531034 )
      ( MAKE-13PILE ?auto_531033 ?auto_531034 ?auto_531035 ?auto_531036 ?auto_531037 ?auto_531038 ?auto_531039 ?auto_531040 ?auto_531041 ?auto_531042 ?auto_531043 ?auto_531044 ?auto_531045 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_531087 - BLOCK
      ?auto_531088 - BLOCK
      ?auto_531089 - BLOCK
      ?auto_531090 - BLOCK
      ?auto_531091 - BLOCK
      ?auto_531092 - BLOCK
      ?auto_531093 - BLOCK
      ?auto_531094 - BLOCK
      ?auto_531095 - BLOCK
      ?auto_531096 - BLOCK
      ?auto_531097 - BLOCK
      ?auto_531098 - BLOCK
      ?auto_531099 - BLOCK
    )
    :vars
    (
      ?auto_531100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531099 ?auto_531100 ) ( not ( = ?auto_531087 ?auto_531088 ) ) ( not ( = ?auto_531087 ?auto_531089 ) ) ( not ( = ?auto_531087 ?auto_531090 ) ) ( not ( = ?auto_531087 ?auto_531091 ) ) ( not ( = ?auto_531087 ?auto_531092 ) ) ( not ( = ?auto_531087 ?auto_531093 ) ) ( not ( = ?auto_531087 ?auto_531094 ) ) ( not ( = ?auto_531087 ?auto_531095 ) ) ( not ( = ?auto_531087 ?auto_531096 ) ) ( not ( = ?auto_531087 ?auto_531097 ) ) ( not ( = ?auto_531087 ?auto_531098 ) ) ( not ( = ?auto_531087 ?auto_531099 ) ) ( not ( = ?auto_531087 ?auto_531100 ) ) ( not ( = ?auto_531088 ?auto_531089 ) ) ( not ( = ?auto_531088 ?auto_531090 ) ) ( not ( = ?auto_531088 ?auto_531091 ) ) ( not ( = ?auto_531088 ?auto_531092 ) ) ( not ( = ?auto_531088 ?auto_531093 ) ) ( not ( = ?auto_531088 ?auto_531094 ) ) ( not ( = ?auto_531088 ?auto_531095 ) ) ( not ( = ?auto_531088 ?auto_531096 ) ) ( not ( = ?auto_531088 ?auto_531097 ) ) ( not ( = ?auto_531088 ?auto_531098 ) ) ( not ( = ?auto_531088 ?auto_531099 ) ) ( not ( = ?auto_531088 ?auto_531100 ) ) ( not ( = ?auto_531089 ?auto_531090 ) ) ( not ( = ?auto_531089 ?auto_531091 ) ) ( not ( = ?auto_531089 ?auto_531092 ) ) ( not ( = ?auto_531089 ?auto_531093 ) ) ( not ( = ?auto_531089 ?auto_531094 ) ) ( not ( = ?auto_531089 ?auto_531095 ) ) ( not ( = ?auto_531089 ?auto_531096 ) ) ( not ( = ?auto_531089 ?auto_531097 ) ) ( not ( = ?auto_531089 ?auto_531098 ) ) ( not ( = ?auto_531089 ?auto_531099 ) ) ( not ( = ?auto_531089 ?auto_531100 ) ) ( not ( = ?auto_531090 ?auto_531091 ) ) ( not ( = ?auto_531090 ?auto_531092 ) ) ( not ( = ?auto_531090 ?auto_531093 ) ) ( not ( = ?auto_531090 ?auto_531094 ) ) ( not ( = ?auto_531090 ?auto_531095 ) ) ( not ( = ?auto_531090 ?auto_531096 ) ) ( not ( = ?auto_531090 ?auto_531097 ) ) ( not ( = ?auto_531090 ?auto_531098 ) ) ( not ( = ?auto_531090 ?auto_531099 ) ) ( not ( = ?auto_531090 ?auto_531100 ) ) ( not ( = ?auto_531091 ?auto_531092 ) ) ( not ( = ?auto_531091 ?auto_531093 ) ) ( not ( = ?auto_531091 ?auto_531094 ) ) ( not ( = ?auto_531091 ?auto_531095 ) ) ( not ( = ?auto_531091 ?auto_531096 ) ) ( not ( = ?auto_531091 ?auto_531097 ) ) ( not ( = ?auto_531091 ?auto_531098 ) ) ( not ( = ?auto_531091 ?auto_531099 ) ) ( not ( = ?auto_531091 ?auto_531100 ) ) ( not ( = ?auto_531092 ?auto_531093 ) ) ( not ( = ?auto_531092 ?auto_531094 ) ) ( not ( = ?auto_531092 ?auto_531095 ) ) ( not ( = ?auto_531092 ?auto_531096 ) ) ( not ( = ?auto_531092 ?auto_531097 ) ) ( not ( = ?auto_531092 ?auto_531098 ) ) ( not ( = ?auto_531092 ?auto_531099 ) ) ( not ( = ?auto_531092 ?auto_531100 ) ) ( not ( = ?auto_531093 ?auto_531094 ) ) ( not ( = ?auto_531093 ?auto_531095 ) ) ( not ( = ?auto_531093 ?auto_531096 ) ) ( not ( = ?auto_531093 ?auto_531097 ) ) ( not ( = ?auto_531093 ?auto_531098 ) ) ( not ( = ?auto_531093 ?auto_531099 ) ) ( not ( = ?auto_531093 ?auto_531100 ) ) ( not ( = ?auto_531094 ?auto_531095 ) ) ( not ( = ?auto_531094 ?auto_531096 ) ) ( not ( = ?auto_531094 ?auto_531097 ) ) ( not ( = ?auto_531094 ?auto_531098 ) ) ( not ( = ?auto_531094 ?auto_531099 ) ) ( not ( = ?auto_531094 ?auto_531100 ) ) ( not ( = ?auto_531095 ?auto_531096 ) ) ( not ( = ?auto_531095 ?auto_531097 ) ) ( not ( = ?auto_531095 ?auto_531098 ) ) ( not ( = ?auto_531095 ?auto_531099 ) ) ( not ( = ?auto_531095 ?auto_531100 ) ) ( not ( = ?auto_531096 ?auto_531097 ) ) ( not ( = ?auto_531096 ?auto_531098 ) ) ( not ( = ?auto_531096 ?auto_531099 ) ) ( not ( = ?auto_531096 ?auto_531100 ) ) ( not ( = ?auto_531097 ?auto_531098 ) ) ( not ( = ?auto_531097 ?auto_531099 ) ) ( not ( = ?auto_531097 ?auto_531100 ) ) ( not ( = ?auto_531098 ?auto_531099 ) ) ( not ( = ?auto_531098 ?auto_531100 ) ) ( not ( = ?auto_531099 ?auto_531100 ) ) ( ON ?auto_531098 ?auto_531099 ) ( ON ?auto_531097 ?auto_531098 ) ( ON ?auto_531096 ?auto_531097 ) ( ON ?auto_531095 ?auto_531096 ) ( ON ?auto_531094 ?auto_531095 ) ( ON ?auto_531093 ?auto_531094 ) ( ON ?auto_531092 ?auto_531093 ) ( ON ?auto_531091 ?auto_531092 ) ( ON ?auto_531090 ?auto_531091 ) ( ON ?auto_531089 ?auto_531090 ) ( ON ?auto_531088 ?auto_531089 ) ( ON ?auto_531087 ?auto_531088 ) ( CLEAR ?auto_531087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_531087 )
      ( MAKE-13PILE ?auto_531087 ?auto_531088 ?auto_531089 ?auto_531090 ?auto_531091 ?auto_531092 ?auto_531093 ?auto_531094 ?auto_531095 ?auto_531096 ?auto_531097 ?auto_531098 ?auto_531099 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531142 - BLOCK
      ?auto_531143 - BLOCK
      ?auto_531144 - BLOCK
      ?auto_531145 - BLOCK
      ?auto_531146 - BLOCK
      ?auto_531147 - BLOCK
      ?auto_531148 - BLOCK
      ?auto_531149 - BLOCK
      ?auto_531150 - BLOCK
      ?auto_531151 - BLOCK
      ?auto_531152 - BLOCK
      ?auto_531153 - BLOCK
      ?auto_531154 - BLOCK
      ?auto_531155 - BLOCK
    )
    :vars
    (
      ?auto_531156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_531154 ) ( ON ?auto_531155 ?auto_531156 ) ( CLEAR ?auto_531155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_531142 ) ( ON ?auto_531143 ?auto_531142 ) ( ON ?auto_531144 ?auto_531143 ) ( ON ?auto_531145 ?auto_531144 ) ( ON ?auto_531146 ?auto_531145 ) ( ON ?auto_531147 ?auto_531146 ) ( ON ?auto_531148 ?auto_531147 ) ( ON ?auto_531149 ?auto_531148 ) ( ON ?auto_531150 ?auto_531149 ) ( ON ?auto_531151 ?auto_531150 ) ( ON ?auto_531152 ?auto_531151 ) ( ON ?auto_531153 ?auto_531152 ) ( ON ?auto_531154 ?auto_531153 ) ( not ( = ?auto_531142 ?auto_531143 ) ) ( not ( = ?auto_531142 ?auto_531144 ) ) ( not ( = ?auto_531142 ?auto_531145 ) ) ( not ( = ?auto_531142 ?auto_531146 ) ) ( not ( = ?auto_531142 ?auto_531147 ) ) ( not ( = ?auto_531142 ?auto_531148 ) ) ( not ( = ?auto_531142 ?auto_531149 ) ) ( not ( = ?auto_531142 ?auto_531150 ) ) ( not ( = ?auto_531142 ?auto_531151 ) ) ( not ( = ?auto_531142 ?auto_531152 ) ) ( not ( = ?auto_531142 ?auto_531153 ) ) ( not ( = ?auto_531142 ?auto_531154 ) ) ( not ( = ?auto_531142 ?auto_531155 ) ) ( not ( = ?auto_531142 ?auto_531156 ) ) ( not ( = ?auto_531143 ?auto_531144 ) ) ( not ( = ?auto_531143 ?auto_531145 ) ) ( not ( = ?auto_531143 ?auto_531146 ) ) ( not ( = ?auto_531143 ?auto_531147 ) ) ( not ( = ?auto_531143 ?auto_531148 ) ) ( not ( = ?auto_531143 ?auto_531149 ) ) ( not ( = ?auto_531143 ?auto_531150 ) ) ( not ( = ?auto_531143 ?auto_531151 ) ) ( not ( = ?auto_531143 ?auto_531152 ) ) ( not ( = ?auto_531143 ?auto_531153 ) ) ( not ( = ?auto_531143 ?auto_531154 ) ) ( not ( = ?auto_531143 ?auto_531155 ) ) ( not ( = ?auto_531143 ?auto_531156 ) ) ( not ( = ?auto_531144 ?auto_531145 ) ) ( not ( = ?auto_531144 ?auto_531146 ) ) ( not ( = ?auto_531144 ?auto_531147 ) ) ( not ( = ?auto_531144 ?auto_531148 ) ) ( not ( = ?auto_531144 ?auto_531149 ) ) ( not ( = ?auto_531144 ?auto_531150 ) ) ( not ( = ?auto_531144 ?auto_531151 ) ) ( not ( = ?auto_531144 ?auto_531152 ) ) ( not ( = ?auto_531144 ?auto_531153 ) ) ( not ( = ?auto_531144 ?auto_531154 ) ) ( not ( = ?auto_531144 ?auto_531155 ) ) ( not ( = ?auto_531144 ?auto_531156 ) ) ( not ( = ?auto_531145 ?auto_531146 ) ) ( not ( = ?auto_531145 ?auto_531147 ) ) ( not ( = ?auto_531145 ?auto_531148 ) ) ( not ( = ?auto_531145 ?auto_531149 ) ) ( not ( = ?auto_531145 ?auto_531150 ) ) ( not ( = ?auto_531145 ?auto_531151 ) ) ( not ( = ?auto_531145 ?auto_531152 ) ) ( not ( = ?auto_531145 ?auto_531153 ) ) ( not ( = ?auto_531145 ?auto_531154 ) ) ( not ( = ?auto_531145 ?auto_531155 ) ) ( not ( = ?auto_531145 ?auto_531156 ) ) ( not ( = ?auto_531146 ?auto_531147 ) ) ( not ( = ?auto_531146 ?auto_531148 ) ) ( not ( = ?auto_531146 ?auto_531149 ) ) ( not ( = ?auto_531146 ?auto_531150 ) ) ( not ( = ?auto_531146 ?auto_531151 ) ) ( not ( = ?auto_531146 ?auto_531152 ) ) ( not ( = ?auto_531146 ?auto_531153 ) ) ( not ( = ?auto_531146 ?auto_531154 ) ) ( not ( = ?auto_531146 ?auto_531155 ) ) ( not ( = ?auto_531146 ?auto_531156 ) ) ( not ( = ?auto_531147 ?auto_531148 ) ) ( not ( = ?auto_531147 ?auto_531149 ) ) ( not ( = ?auto_531147 ?auto_531150 ) ) ( not ( = ?auto_531147 ?auto_531151 ) ) ( not ( = ?auto_531147 ?auto_531152 ) ) ( not ( = ?auto_531147 ?auto_531153 ) ) ( not ( = ?auto_531147 ?auto_531154 ) ) ( not ( = ?auto_531147 ?auto_531155 ) ) ( not ( = ?auto_531147 ?auto_531156 ) ) ( not ( = ?auto_531148 ?auto_531149 ) ) ( not ( = ?auto_531148 ?auto_531150 ) ) ( not ( = ?auto_531148 ?auto_531151 ) ) ( not ( = ?auto_531148 ?auto_531152 ) ) ( not ( = ?auto_531148 ?auto_531153 ) ) ( not ( = ?auto_531148 ?auto_531154 ) ) ( not ( = ?auto_531148 ?auto_531155 ) ) ( not ( = ?auto_531148 ?auto_531156 ) ) ( not ( = ?auto_531149 ?auto_531150 ) ) ( not ( = ?auto_531149 ?auto_531151 ) ) ( not ( = ?auto_531149 ?auto_531152 ) ) ( not ( = ?auto_531149 ?auto_531153 ) ) ( not ( = ?auto_531149 ?auto_531154 ) ) ( not ( = ?auto_531149 ?auto_531155 ) ) ( not ( = ?auto_531149 ?auto_531156 ) ) ( not ( = ?auto_531150 ?auto_531151 ) ) ( not ( = ?auto_531150 ?auto_531152 ) ) ( not ( = ?auto_531150 ?auto_531153 ) ) ( not ( = ?auto_531150 ?auto_531154 ) ) ( not ( = ?auto_531150 ?auto_531155 ) ) ( not ( = ?auto_531150 ?auto_531156 ) ) ( not ( = ?auto_531151 ?auto_531152 ) ) ( not ( = ?auto_531151 ?auto_531153 ) ) ( not ( = ?auto_531151 ?auto_531154 ) ) ( not ( = ?auto_531151 ?auto_531155 ) ) ( not ( = ?auto_531151 ?auto_531156 ) ) ( not ( = ?auto_531152 ?auto_531153 ) ) ( not ( = ?auto_531152 ?auto_531154 ) ) ( not ( = ?auto_531152 ?auto_531155 ) ) ( not ( = ?auto_531152 ?auto_531156 ) ) ( not ( = ?auto_531153 ?auto_531154 ) ) ( not ( = ?auto_531153 ?auto_531155 ) ) ( not ( = ?auto_531153 ?auto_531156 ) ) ( not ( = ?auto_531154 ?auto_531155 ) ) ( not ( = ?auto_531154 ?auto_531156 ) ) ( not ( = ?auto_531155 ?auto_531156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_531155 ?auto_531156 )
      ( !STACK ?auto_531155 ?auto_531154 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531200 - BLOCK
      ?auto_531201 - BLOCK
      ?auto_531202 - BLOCK
      ?auto_531203 - BLOCK
      ?auto_531204 - BLOCK
      ?auto_531205 - BLOCK
      ?auto_531206 - BLOCK
      ?auto_531207 - BLOCK
      ?auto_531208 - BLOCK
      ?auto_531209 - BLOCK
      ?auto_531210 - BLOCK
      ?auto_531211 - BLOCK
      ?auto_531212 - BLOCK
      ?auto_531213 - BLOCK
    )
    :vars
    (
      ?auto_531214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531213 ?auto_531214 ) ( ON-TABLE ?auto_531200 ) ( ON ?auto_531201 ?auto_531200 ) ( ON ?auto_531202 ?auto_531201 ) ( ON ?auto_531203 ?auto_531202 ) ( ON ?auto_531204 ?auto_531203 ) ( ON ?auto_531205 ?auto_531204 ) ( ON ?auto_531206 ?auto_531205 ) ( ON ?auto_531207 ?auto_531206 ) ( ON ?auto_531208 ?auto_531207 ) ( ON ?auto_531209 ?auto_531208 ) ( ON ?auto_531210 ?auto_531209 ) ( ON ?auto_531211 ?auto_531210 ) ( not ( = ?auto_531200 ?auto_531201 ) ) ( not ( = ?auto_531200 ?auto_531202 ) ) ( not ( = ?auto_531200 ?auto_531203 ) ) ( not ( = ?auto_531200 ?auto_531204 ) ) ( not ( = ?auto_531200 ?auto_531205 ) ) ( not ( = ?auto_531200 ?auto_531206 ) ) ( not ( = ?auto_531200 ?auto_531207 ) ) ( not ( = ?auto_531200 ?auto_531208 ) ) ( not ( = ?auto_531200 ?auto_531209 ) ) ( not ( = ?auto_531200 ?auto_531210 ) ) ( not ( = ?auto_531200 ?auto_531211 ) ) ( not ( = ?auto_531200 ?auto_531212 ) ) ( not ( = ?auto_531200 ?auto_531213 ) ) ( not ( = ?auto_531200 ?auto_531214 ) ) ( not ( = ?auto_531201 ?auto_531202 ) ) ( not ( = ?auto_531201 ?auto_531203 ) ) ( not ( = ?auto_531201 ?auto_531204 ) ) ( not ( = ?auto_531201 ?auto_531205 ) ) ( not ( = ?auto_531201 ?auto_531206 ) ) ( not ( = ?auto_531201 ?auto_531207 ) ) ( not ( = ?auto_531201 ?auto_531208 ) ) ( not ( = ?auto_531201 ?auto_531209 ) ) ( not ( = ?auto_531201 ?auto_531210 ) ) ( not ( = ?auto_531201 ?auto_531211 ) ) ( not ( = ?auto_531201 ?auto_531212 ) ) ( not ( = ?auto_531201 ?auto_531213 ) ) ( not ( = ?auto_531201 ?auto_531214 ) ) ( not ( = ?auto_531202 ?auto_531203 ) ) ( not ( = ?auto_531202 ?auto_531204 ) ) ( not ( = ?auto_531202 ?auto_531205 ) ) ( not ( = ?auto_531202 ?auto_531206 ) ) ( not ( = ?auto_531202 ?auto_531207 ) ) ( not ( = ?auto_531202 ?auto_531208 ) ) ( not ( = ?auto_531202 ?auto_531209 ) ) ( not ( = ?auto_531202 ?auto_531210 ) ) ( not ( = ?auto_531202 ?auto_531211 ) ) ( not ( = ?auto_531202 ?auto_531212 ) ) ( not ( = ?auto_531202 ?auto_531213 ) ) ( not ( = ?auto_531202 ?auto_531214 ) ) ( not ( = ?auto_531203 ?auto_531204 ) ) ( not ( = ?auto_531203 ?auto_531205 ) ) ( not ( = ?auto_531203 ?auto_531206 ) ) ( not ( = ?auto_531203 ?auto_531207 ) ) ( not ( = ?auto_531203 ?auto_531208 ) ) ( not ( = ?auto_531203 ?auto_531209 ) ) ( not ( = ?auto_531203 ?auto_531210 ) ) ( not ( = ?auto_531203 ?auto_531211 ) ) ( not ( = ?auto_531203 ?auto_531212 ) ) ( not ( = ?auto_531203 ?auto_531213 ) ) ( not ( = ?auto_531203 ?auto_531214 ) ) ( not ( = ?auto_531204 ?auto_531205 ) ) ( not ( = ?auto_531204 ?auto_531206 ) ) ( not ( = ?auto_531204 ?auto_531207 ) ) ( not ( = ?auto_531204 ?auto_531208 ) ) ( not ( = ?auto_531204 ?auto_531209 ) ) ( not ( = ?auto_531204 ?auto_531210 ) ) ( not ( = ?auto_531204 ?auto_531211 ) ) ( not ( = ?auto_531204 ?auto_531212 ) ) ( not ( = ?auto_531204 ?auto_531213 ) ) ( not ( = ?auto_531204 ?auto_531214 ) ) ( not ( = ?auto_531205 ?auto_531206 ) ) ( not ( = ?auto_531205 ?auto_531207 ) ) ( not ( = ?auto_531205 ?auto_531208 ) ) ( not ( = ?auto_531205 ?auto_531209 ) ) ( not ( = ?auto_531205 ?auto_531210 ) ) ( not ( = ?auto_531205 ?auto_531211 ) ) ( not ( = ?auto_531205 ?auto_531212 ) ) ( not ( = ?auto_531205 ?auto_531213 ) ) ( not ( = ?auto_531205 ?auto_531214 ) ) ( not ( = ?auto_531206 ?auto_531207 ) ) ( not ( = ?auto_531206 ?auto_531208 ) ) ( not ( = ?auto_531206 ?auto_531209 ) ) ( not ( = ?auto_531206 ?auto_531210 ) ) ( not ( = ?auto_531206 ?auto_531211 ) ) ( not ( = ?auto_531206 ?auto_531212 ) ) ( not ( = ?auto_531206 ?auto_531213 ) ) ( not ( = ?auto_531206 ?auto_531214 ) ) ( not ( = ?auto_531207 ?auto_531208 ) ) ( not ( = ?auto_531207 ?auto_531209 ) ) ( not ( = ?auto_531207 ?auto_531210 ) ) ( not ( = ?auto_531207 ?auto_531211 ) ) ( not ( = ?auto_531207 ?auto_531212 ) ) ( not ( = ?auto_531207 ?auto_531213 ) ) ( not ( = ?auto_531207 ?auto_531214 ) ) ( not ( = ?auto_531208 ?auto_531209 ) ) ( not ( = ?auto_531208 ?auto_531210 ) ) ( not ( = ?auto_531208 ?auto_531211 ) ) ( not ( = ?auto_531208 ?auto_531212 ) ) ( not ( = ?auto_531208 ?auto_531213 ) ) ( not ( = ?auto_531208 ?auto_531214 ) ) ( not ( = ?auto_531209 ?auto_531210 ) ) ( not ( = ?auto_531209 ?auto_531211 ) ) ( not ( = ?auto_531209 ?auto_531212 ) ) ( not ( = ?auto_531209 ?auto_531213 ) ) ( not ( = ?auto_531209 ?auto_531214 ) ) ( not ( = ?auto_531210 ?auto_531211 ) ) ( not ( = ?auto_531210 ?auto_531212 ) ) ( not ( = ?auto_531210 ?auto_531213 ) ) ( not ( = ?auto_531210 ?auto_531214 ) ) ( not ( = ?auto_531211 ?auto_531212 ) ) ( not ( = ?auto_531211 ?auto_531213 ) ) ( not ( = ?auto_531211 ?auto_531214 ) ) ( not ( = ?auto_531212 ?auto_531213 ) ) ( not ( = ?auto_531212 ?auto_531214 ) ) ( not ( = ?auto_531213 ?auto_531214 ) ) ( CLEAR ?auto_531211 ) ( ON ?auto_531212 ?auto_531213 ) ( CLEAR ?auto_531212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_531200 ?auto_531201 ?auto_531202 ?auto_531203 ?auto_531204 ?auto_531205 ?auto_531206 ?auto_531207 ?auto_531208 ?auto_531209 ?auto_531210 ?auto_531211 ?auto_531212 )
      ( MAKE-14PILE ?auto_531200 ?auto_531201 ?auto_531202 ?auto_531203 ?auto_531204 ?auto_531205 ?auto_531206 ?auto_531207 ?auto_531208 ?auto_531209 ?auto_531210 ?auto_531211 ?auto_531212 ?auto_531213 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531258 - BLOCK
      ?auto_531259 - BLOCK
      ?auto_531260 - BLOCK
      ?auto_531261 - BLOCK
      ?auto_531262 - BLOCK
      ?auto_531263 - BLOCK
      ?auto_531264 - BLOCK
      ?auto_531265 - BLOCK
      ?auto_531266 - BLOCK
      ?auto_531267 - BLOCK
      ?auto_531268 - BLOCK
      ?auto_531269 - BLOCK
      ?auto_531270 - BLOCK
      ?auto_531271 - BLOCK
    )
    :vars
    (
      ?auto_531272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531271 ?auto_531272 ) ( ON-TABLE ?auto_531258 ) ( ON ?auto_531259 ?auto_531258 ) ( ON ?auto_531260 ?auto_531259 ) ( ON ?auto_531261 ?auto_531260 ) ( ON ?auto_531262 ?auto_531261 ) ( ON ?auto_531263 ?auto_531262 ) ( ON ?auto_531264 ?auto_531263 ) ( ON ?auto_531265 ?auto_531264 ) ( ON ?auto_531266 ?auto_531265 ) ( ON ?auto_531267 ?auto_531266 ) ( ON ?auto_531268 ?auto_531267 ) ( not ( = ?auto_531258 ?auto_531259 ) ) ( not ( = ?auto_531258 ?auto_531260 ) ) ( not ( = ?auto_531258 ?auto_531261 ) ) ( not ( = ?auto_531258 ?auto_531262 ) ) ( not ( = ?auto_531258 ?auto_531263 ) ) ( not ( = ?auto_531258 ?auto_531264 ) ) ( not ( = ?auto_531258 ?auto_531265 ) ) ( not ( = ?auto_531258 ?auto_531266 ) ) ( not ( = ?auto_531258 ?auto_531267 ) ) ( not ( = ?auto_531258 ?auto_531268 ) ) ( not ( = ?auto_531258 ?auto_531269 ) ) ( not ( = ?auto_531258 ?auto_531270 ) ) ( not ( = ?auto_531258 ?auto_531271 ) ) ( not ( = ?auto_531258 ?auto_531272 ) ) ( not ( = ?auto_531259 ?auto_531260 ) ) ( not ( = ?auto_531259 ?auto_531261 ) ) ( not ( = ?auto_531259 ?auto_531262 ) ) ( not ( = ?auto_531259 ?auto_531263 ) ) ( not ( = ?auto_531259 ?auto_531264 ) ) ( not ( = ?auto_531259 ?auto_531265 ) ) ( not ( = ?auto_531259 ?auto_531266 ) ) ( not ( = ?auto_531259 ?auto_531267 ) ) ( not ( = ?auto_531259 ?auto_531268 ) ) ( not ( = ?auto_531259 ?auto_531269 ) ) ( not ( = ?auto_531259 ?auto_531270 ) ) ( not ( = ?auto_531259 ?auto_531271 ) ) ( not ( = ?auto_531259 ?auto_531272 ) ) ( not ( = ?auto_531260 ?auto_531261 ) ) ( not ( = ?auto_531260 ?auto_531262 ) ) ( not ( = ?auto_531260 ?auto_531263 ) ) ( not ( = ?auto_531260 ?auto_531264 ) ) ( not ( = ?auto_531260 ?auto_531265 ) ) ( not ( = ?auto_531260 ?auto_531266 ) ) ( not ( = ?auto_531260 ?auto_531267 ) ) ( not ( = ?auto_531260 ?auto_531268 ) ) ( not ( = ?auto_531260 ?auto_531269 ) ) ( not ( = ?auto_531260 ?auto_531270 ) ) ( not ( = ?auto_531260 ?auto_531271 ) ) ( not ( = ?auto_531260 ?auto_531272 ) ) ( not ( = ?auto_531261 ?auto_531262 ) ) ( not ( = ?auto_531261 ?auto_531263 ) ) ( not ( = ?auto_531261 ?auto_531264 ) ) ( not ( = ?auto_531261 ?auto_531265 ) ) ( not ( = ?auto_531261 ?auto_531266 ) ) ( not ( = ?auto_531261 ?auto_531267 ) ) ( not ( = ?auto_531261 ?auto_531268 ) ) ( not ( = ?auto_531261 ?auto_531269 ) ) ( not ( = ?auto_531261 ?auto_531270 ) ) ( not ( = ?auto_531261 ?auto_531271 ) ) ( not ( = ?auto_531261 ?auto_531272 ) ) ( not ( = ?auto_531262 ?auto_531263 ) ) ( not ( = ?auto_531262 ?auto_531264 ) ) ( not ( = ?auto_531262 ?auto_531265 ) ) ( not ( = ?auto_531262 ?auto_531266 ) ) ( not ( = ?auto_531262 ?auto_531267 ) ) ( not ( = ?auto_531262 ?auto_531268 ) ) ( not ( = ?auto_531262 ?auto_531269 ) ) ( not ( = ?auto_531262 ?auto_531270 ) ) ( not ( = ?auto_531262 ?auto_531271 ) ) ( not ( = ?auto_531262 ?auto_531272 ) ) ( not ( = ?auto_531263 ?auto_531264 ) ) ( not ( = ?auto_531263 ?auto_531265 ) ) ( not ( = ?auto_531263 ?auto_531266 ) ) ( not ( = ?auto_531263 ?auto_531267 ) ) ( not ( = ?auto_531263 ?auto_531268 ) ) ( not ( = ?auto_531263 ?auto_531269 ) ) ( not ( = ?auto_531263 ?auto_531270 ) ) ( not ( = ?auto_531263 ?auto_531271 ) ) ( not ( = ?auto_531263 ?auto_531272 ) ) ( not ( = ?auto_531264 ?auto_531265 ) ) ( not ( = ?auto_531264 ?auto_531266 ) ) ( not ( = ?auto_531264 ?auto_531267 ) ) ( not ( = ?auto_531264 ?auto_531268 ) ) ( not ( = ?auto_531264 ?auto_531269 ) ) ( not ( = ?auto_531264 ?auto_531270 ) ) ( not ( = ?auto_531264 ?auto_531271 ) ) ( not ( = ?auto_531264 ?auto_531272 ) ) ( not ( = ?auto_531265 ?auto_531266 ) ) ( not ( = ?auto_531265 ?auto_531267 ) ) ( not ( = ?auto_531265 ?auto_531268 ) ) ( not ( = ?auto_531265 ?auto_531269 ) ) ( not ( = ?auto_531265 ?auto_531270 ) ) ( not ( = ?auto_531265 ?auto_531271 ) ) ( not ( = ?auto_531265 ?auto_531272 ) ) ( not ( = ?auto_531266 ?auto_531267 ) ) ( not ( = ?auto_531266 ?auto_531268 ) ) ( not ( = ?auto_531266 ?auto_531269 ) ) ( not ( = ?auto_531266 ?auto_531270 ) ) ( not ( = ?auto_531266 ?auto_531271 ) ) ( not ( = ?auto_531266 ?auto_531272 ) ) ( not ( = ?auto_531267 ?auto_531268 ) ) ( not ( = ?auto_531267 ?auto_531269 ) ) ( not ( = ?auto_531267 ?auto_531270 ) ) ( not ( = ?auto_531267 ?auto_531271 ) ) ( not ( = ?auto_531267 ?auto_531272 ) ) ( not ( = ?auto_531268 ?auto_531269 ) ) ( not ( = ?auto_531268 ?auto_531270 ) ) ( not ( = ?auto_531268 ?auto_531271 ) ) ( not ( = ?auto_531268 ?auto_531272 ) ) ( not ( = ?auto_531269 ?auto_531270 ) ) ( not ( = ?auto_531269 ?auto_531271 ) ) ( not ( = ?auto_531269 ?auto_531272 ) ) ( not ( = ?auto_531270 ?auto_531271 ) ) ( not ( = ?auto_531270 ?auto_531272 ) ) ( not ( = ?auto_531271 ?auto_531272 ) ) ( ON ?auto_531270 ?auto_531271 ) ( CLEAR ?auto_531268 ) ( ON ?auto_531269 ?auto_531270 ) ( CLEAR ?auto_531269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_531258 ?auto_531259 ?auto_531260 ?auto_531261 ?auto_531262 ?auto_531263 ?auto_531264 ?auto_531265 ?auto_531266 ?auto_531267 ?auto_531268 ?auto_531269 )
      ( MAKE-14PILE ?auto_531258 ?auto_531259 ?auto_531260 ?auto_531261 ?auto_531262 ?auto_531263 ?auto_531264 ?auto_531265 ?auto_531266 ?auto_531267 ?auto_531268 ?auto_531269 ?auto_531270 ?auto_531271 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531316 - BLOCK
      ?auto_531317 - BLOCK
      ?auto_531318 - BLOCK
      ?auto_531319 - BLOCK
      ?auto_531320 - BLOCK
      ?auto_531321 - BLOCK
      ?auto_531322 - BLOCK
      ?auto_531323 - BLOCK
      ?auto_531324 - BLOCK
      ?auto_531325 - BLOCK
      ?auto_531326 - BLOCK
      ?auto_531327 - BLOCK
      ?auto_531328 - BLOCK
      ?auto_531329 - BLOCK
    )
    :vars
    (
      ?auto_531330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531329 ?auto_531330 ) ( ON-TABLE ?auto_531316 ) ( ON ?auto_531317 ?auto_531316 ) ( ON ?auto_531318 ?auto_531317 ) ( ON ?auto_531319 ?auto_531318 ) ( ON ?auto_531320 ?auto_531319 ) ( ON ?auto_531321 ?auto_531320 ) ( ON ?auto_531322 ?auto_531321 ) ( ON ?auto_531323 ?auto_531322 ) ( ON ?auto_531324 ?auto_531323 ) ( ON ?auto_531325 ?auto_531324 ) ( not ( = ?auto_531316 ?auto_531317 ) ) ( not ( = ?auto_531316 ?auto_531318 ) ) ( not ( = ?auto_531316 ?auto_531319 ) ) ( not ( = ?auto_531316 ?auto_531320 ) ) ( not ( = ?auto_531316 ?auto_531321 ) ) ( not ( = ?auto_531316 ?auto_531322 ) ) ( not ( = ?auto_531316 ?auto_531323 ) ) ( not ( = ?auto_531316 ?auto_531324 ) ) ( not ( = ?auto_531316 ?auto_531325 ) ) ( not ( = ?auto_531316 ?auto_531326 ) ) ( not ( = ?auto_531316 ?auto_531327 ) ) ( not ( = ?auto_531316 ?auto_531328 ) ) ( not ( = ?auto_531316 ?auto_531329 ) ) ( not ( = ?auto_531316 ?auto_531330 ) ) ( not ( = ?auto_531317 ?auto_531318 ) ) ( not ( = ?auto_531317 ?auto_531319 ) ) ( not ( = ?auto_531317 ?auto_531320 ) ) ( not ( = ?auto_531317 ?auto_531321 ) ) ( not ( = ?auto_531317 ?auto_531322 ) ) ( not ( = ?auto_531317 ?auto_531323 ) ) ( not ( = ?auto_531317 ?auto_531324 ) ) ( not ( = ?auto_531317 ?auto_531325 ) ) ( not ( = ?auto_531317 ?auto_531326 ) ) ( not ( = ?auto_531317 ?auto_531327 ) ) ( not ( = ?auto_531317 ?auto_531328 ) ) ( not ( = ?auto_531317 ?auto_531329 ) ) ( not ( = ?auto_531317 ?auto_531330 ) ) ( not ( = ?auto_531318 ?auto_531319 ) ) ( not ( = ?auto_531318 ?auto_531320 ) ) ( not ( = ?auto_531318 ?auto_531321 ) ) ( not ( = ?auto_531318 ?auto_531322 ) ) ( not ( = ?auto_531318 ?auto_531323 ) ) ( not ( = ?auto_531318 ?auto_531324 ) ) ( not ( = ?auto_531318 ?auto_531325 ) ) ( not ( = ?auto_531318 ?auto_531326 ) ) ( not ( = ?auto_531318 ?auto_531327 ) ) ( not ( = ?auto_531318 ?auto_531328 ) ) ( not ( = ?auto_531318 ?auto_531329 ) ) ( not ( = ?auto_531318 ?auto_531330 ) ) ( not ( = ?auto_531319 ?auto_531320 ) ) ( not ( = ?auto_531319 ?auto_531321 ) ) ( not ( = ?auto_531319 ?auto_531322 ) ) ( not ( = ?auto_531319 ?auto_531323 ) ) ( not ( = ?auto_531319 ?auto_531324 ) ) ( not ( = ?auto_531319 ?auto_531325 ) ) ( not ( = ?auto_531319 ?auto_531326 ) ) ( not ( = ?auto_531319 ?auto_531327 ) ) ( not ( = ?auto_531319 ?auto_531328 ) ) ( not ( = ?auto_531319 ?auto_531329 ) ) ( not ( = ?auto_531319 ?auto_531330 ) ) ( not ( = ?auto_531320 ?auto_531321 ) ) ( not ( = ?auto_531320 ?auto_531322 ) ) ( not ( = ?auto_531320 ?auto_531323 ) ) ( not ( = ?auto_531320 ?auto_531324 ) ) ( not ( = ?auto_531320 ?auto_531325 ) ) ( not ( = ?auto_531320 ?auto_531326 ) ) ( not ( = ?auto_531320 ?auto_531327 ) ) ( not ( = ?auto_531320 ?auto_531328 ) ) ( not ( = ?auto_531320 ?auto_531329 ) ) ( not ( = ?auto_531320 ?auto_531330 ) ) ( not ( = ?auto_531321 ?auto_531322 ) ) ( not ( = ?auto_531321 ?auto_531323 ) ) ( not ( = ?auto_531321 ?auto_531324 ) ) ( not ( = ?auto_531321 ?auto_531325 ) ) ( not ( = ?auto_531321 ?auto_531326 ) ) ( not ( = ?auto_531321 ?auto_531327 ) ) ( not ( = ?auto_531321 ?auto_531328 ) ) ( not ( = ?auto_531321 ?auto_531329 ) ) ( not ( = ?auto_531321 ?auto_531330 ) ) ( not ( = ?auto_531322 ?auto_531323 ) ) ( not ( = ?auto_531322 ?auto_531324 ) ) ( not ( = ?auto_531322 ?auto_531325 ) ) ( not ( = ?auto_531322 ?auto_531326 ) ) ( not ( = ?auto_531322 ?auto_531327 ) ) ( not ( = ?auto_531322 ?auto_531328 ) ) ( not ( = ?auto_531322 ?auto_531329 ) ) ( not ( = ?auto_531322 ?auto_531330 ) ) ( not ( = ?auto_531323 ?auto_531324 ) ) ( not ( = ?auto_531323 ?auto_531325 ) ) ( not ( = ?auto_531323 ?auto_531326 ) ) ( not ( = ?auto_531323 ?auto_531327 ) ) ( not ( = ?auto_531323 ?auto_531328 ) ) ( not ( = ?auto_531323 ?auto_531329 ) ) ( not ( = ?auto_531323 ?auto_531330 ) ) ( not ( = ?auto_531324 ?auto_531325 ) ) ( not ( = ?auto_531324 ?auto_531326 ) ) ( not ( = ?auto_531324 ?auto_531327 ) ) ( not ( = ?auto_531324 ?auto_531328 ) ) ( not ( = ?auto_531324 ?auto_531329 ) ) ( not ( = ?auto_531324 ?auto_531330 ) ) ( not ( = ?auto_531325 ?auto_531326 ) ) ( not ( = ?auto_531325 ?auto_531327 ) ) ( not ( = ?auto_531325 ?auto_531328 ) ) ( not ( = ?auto_531325 ?auto_531329 ) ) ( not ( = ?auto_531325 ?auto_531330 ) ) ( not ( = ?auto_531326 ?auto_531327 ) ) ( not ( = ?auto_531326 ?auto_531328 ) ) ( not ( = ?auto_531326 ?auto_531329 ) ) ( not ( = ?auto_531326 ?auto_531330 ) ) ( not ( = ?auto_531327 ?auto_531328 ) ) ( not ( = ?auto_531327 ?auto_531329 ) ) ( not ( = ?auto_531327 ?auto_531330 ) ) ( not ( = ?auto_531328 ?auto_531329 ) ) ( not ( = ?auto_531328 ?auto_531330 ) ) ( not ( = ?auto_531329 ?auto_531330 ) ) ( ON ?auto_531328 ?auto_531329 ) ( ON ?auto_531327 ?auto_531328 ) ( CLEAR ?auto_531325 ) ( ON ?auto_531326 ?auto_531327 ) ( CLEAR ?auto_531326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_531316 ?auto_531317 ?auto_531318 ?auto_531319 ?auto_531320 ?auto_531321 ?auto_531322 ?auto_531323 ?auto_531324 ?auto_531325 ?auto_531326 )
      ( MAKE-14PILE ?auto_531316 ?auto_531317 ?auto_531318 ?auto_531319 ?auto_531320 ?auto_531321 ?auto_531322 ?auto_531323 ?auto_531324 ?auto_531325 ?auto_531326 ?auto_531327 ?auto_531328 ?auto_531329 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531374 - BLOCK
      ?auto_531375 - BLOCK
      ?auto_531376 - BLOCK
      ?auto_531377 - BLOCK
      ?auto_531378 - BLOCK
      ?auto_531379 - BLOCK
      ?auto_531380 - BLOCK
      ?auto_531381 - BLOCK
      ?auto_531382 - BLOCK
      ?auto_531383 - BLOCK
      ?auto_531384 - BLOCK
      ?auto_531385 - BLOCK
      ?auto_531386 - BLOCK
      ?auto_531387 - BLOCK
    )
    :vars
    (
      ?auto_531388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531387 ?auto_531388 ) ( ON-TABLE ?auto_531374 ) ( ON ?auto_531375 ?auto_531374 ) ( ON ?auto_531376 ?auto_531375 ) ( ON ?auto_531377 ?auto_531376 ) ( ON ?auto_531378 ?auto_531377 ) ( ON ?auto_531379 ?auto_531378 ) ( ON ?auto_531380 ?auto_531379 ) ( ON ?auto_531381 ?auto_531380 ) ( ON ?auto_531382 ?auto_531381 ) ( not ( = ?auto_531374 ?auto_531375 ) ) ( not ( = ?auto_531374 ?auto_531376 ) ) ( not ( = ?auto_531374 ?auto_531377 ) ) ( not ( = ?auto_531374 ?auto_531378 ) ) ( not ( = ?auto_531374 ?auto_531379 ) ) ( not ( = ?auto_531374 ?auto_531380 ) ) ( not ( = ?auto_531374 ?auto_531381 ) ) ( not ( = ?auto_531374 ?auto_531382 ) ) ( not ( = ?auto_531374 ?auto_531383 ) ) ( not ( = ?auto_531374 ?auto_531384 ) ) ( not ( = ?auto_531374 ?auto_531385 ) ) ( not ( = ?auto_531374 ?auto_531386 ) ) ( not ( = ?auto_531374 ?auto_531387 ) ) ( not ( = ?auto_531374 ?auto_531388 ) ) ( not ( = ?auto_531375 ?auto_531376 ) ) ( not ( = ?auto_531375 ?auto_531377 ) ) ( not ( = ?auto_531375 ?auto_531378 ) ) ( not ( = ?auto_531375 ?auto_531379 ) ) ( not ( = ?auto_531375 ?auto_531380 ) ) ( not ( = ?auto_531375 ?auto_531381 ) ) ( not ( = ?auto_531375 ?auto_531382 ) ) ( not ( = ?auto_531375 ?auto_531383 ) ) ( not ( = ?auto_531375 ?auto_531384 ) ) ( not ( = ?auto_531375 ?auto_531385 ) ) ( not ( = ?auto_531375 ?auto_531386 ) ) ( not ( = ?auto_531375 ?auto_531387 ) ) ( not ( = ?auto_531375 ?auto_531388 ) ) ( not ( = ?auto_531376 ?auto_531377 ) ) ( not ( = ?auto_531376 ?auto_531378 ) ) ( not ( = ?auto_531376 ?auto_531379 ) ) ( not ( = ?auto_531376 ?auto_531380 ) ) ( not ( = ?auto_531376 ?auto_531381 ) ) ( not ( = ?auto_531376 ?auto_531382 ) ) ( not ( = ?auto_531376 ?auto_531383 ) ) ( not ( = ?auto_531376 ?auto_531384 ) ) ( not ( = ?auto_531376 ?auto_531385 ) ) ( not ( = ?auto_531376 ?auto_531386 ) ) ( not ( = ?auto_531376 ?auto_531387 ) ) ( not ( = ?auto_531376 ?auto_531388 ) ) ( not ( = ?auto_531377 ?auto_531378 ) ) ( not ( = ?auto_531377 ?auto_531379 ) ) ( not ( = ?auto_531377 ?auto_531380 ) ) ( not ( = ?auto_531377 ?auto_531381 ) ) ( not ( = ?auto_531377 ?auto_531382 ) ) ( not ( = ?auto_531377 ?auto_531383 ) ) ( not ( = ?auto_531377 ?auto_531384 ) ) ( not ( = ?auto_531377 ?auto_531385 ) ) ( not ( = ?auto_531377 ?auto_531386 ) ) ( not ( = ?auto_531377 ?auto_531387 ) ) ( not ( = ?auto_531377 ?auto_531388 ) ) ( not ( = ?auto_531378 ?auto_531379 ) ) ( not ( = ?auto_531378 ?auto_531380 ) ) ( not ( = ?auto_531378 ?auto_531381 ) ) ( not ( = ?auto_531378 ?auto_531382 ) ) ( not ( = ?auto_531378 ?auto_531383 ) ) ( not ( = ?auto_531378 ?auto_531384 ) ) ( not ( = ?auto_531378 ?auto_531385 ) ) ( not ( = ?auto_531378 ?auto_531386 ) ) ( not ( = ?auto_531378 ?auto_531387 ) ) ( not ( = ?auto_531378 ?auto_531388 ) ) ( not ( = ?auto_531379 ?auto_531380 ) ) ( not ( = ?auto_531379 ?auto_531381 ) ) ( not ( = ?auto_531379 ?auto_531382 ) ) ( not ( = ?auto_531379 ?auto_531383 ) ) ( not ( = ?auto_531379 ?auto_531384 ) ) ( not ( = ?auto_531379 ?auto_531385 ) ) ( not ( = ?auto_531379 ?auto_531386 ) ) ( not ( = ?auto_531379 ?auto_531387 ) ) ( not ( = ?auto_531379 ?auto_531388 ) ) ( not ( = ?auto_531380 ?auto_531381 ) ) ( not ( = ?auto_531380 ?auto_531382 ) ) ( not ( = ?auto_531380 ?auto_531383 ) ) ( not ( = ?auto_531380 ?auto_531384 ) ) ( not ( = ?auto_531380 ?auto_531385 ) ) ( not ( = ?auto_531380 ?auto_531386 ) ) ( not ( = ?auto_531380 ?auto_531387 ) ) ( not ( = ?auto_531380 ?auto_531388 ) ) ( not ( = ?auto_531381 ?auto_531382 ) ) ( not ( = ?auto_531381 ?auto_531383 ) ) ( not ( = ?auto_531381 ?auto_531384 ) ) ( not ( = ?auto_531381 ?auto_531385 ) ) ( not ( = ?auto_531381 ?auto_531386 ) ) ( not ( = ?auto_531381 ?auto_531387 ) ) ( not ( = ?auto_531381 ?auto_531388 ) ) ( not ( = ?auto_531382 ?auto_531383 ) ) ( not ( = ?auto_531382 ?auto_531384 ) ) ( not ( = ?auto_531382 ?auto_531385 ) ) ( not ( = ?auto_531382 ?auto_531386 ) ) ( not ( = ?auto_531382 ?auto_531387 ) ) ( not ( = ?auto_531382 ?auto_531388 ) ) ( not ( = ?auto_531383 ?auto_531384 ) ) ( not ( = ?auto_531383 ?auto_531385 ) ) ( not ( = ?auto_531383 ?auto_531386 ) ) ( not ( = ?auto_531383 ?auto_531387 ) ) ( not ( = ?auto_531383 ?auto_531388 ) ) ( not ( = ?auto_531384 ?auto_531385 ) ) ( not ( = ?auto_531384 ?auto_531386 ) ) ( not ( = ?auto_531384 ?auto_531387 ) ) ( not ( = ?auto_531384 ?auto_531388 ) ) ( not ( = ?auto_531385 ?auto_531386 ) ) ( not ( = ?auto_531385 ?auto_531387 ) ) ( not ( = ?auto_531385 ?auto_531388 ) ) ( not ( = ?auto_531386 ?auto_531387 ) ) ( not ( = ?auto_531386 ?auto_531388 ) ) ( not ( = ?auto_531387 ?auto_531388 ) ) ( ON ?auto_531386 ?auto_531387 ) ( ON ?auto_531385 ?auto_531386 ) ( ON ?auto_531384 ?auto_531385 ) ( CLEAR ?auto_531382 ) ( ON ?auto_531383 ?auto_531384 ) ( CLEAR ?auto_531383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_531374 ?auto_531375 ?auto_531376 ?auto_531377 ?auto_531378 ?auto_531379 ?auto_531380 ?auto_531381 ?auto_531382 ?auto_531383 )
      ( MAKE-14PILE ?auto_531374 ?auto_531375 ?auto_531376 ?auto_531377 ?auto_531378 ?auto_531379 ?auto_531380 ?auto_531381 ?auto_531382 ?auto_531383 ?auto_531384 ?auto_531385 ?auto_531386 ?auto_531387 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531432 - BLOCK
      ?auto_531433 - BLOCK
      ?auto_531434 - BLOCK
      ?auto_531435 - BLOCK
      ?auto_531436 - BLOCK
      ?auto_531437 - BLOCK
      ?auto_531438 - BLOCK
      ?auto_531439 - BLOCK
      ?auto_531440 - BLOCK
      ?auto_531441 - BLOCK
      ?auto_531442 - BLOCK
      ?auto_531443 - BLOCK
      ?auto_531444 - BLOCK
      ?auto_531445 - BLOCK
    )
    :vars
    (
      ?auto_531446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531445 ?auto_531446 ) ( ON-TABLE ?auto_531432 ) ( ON ?auto_531433 ?auto_531432 ) ( ON ?auto_531434 ?auto_531433 ) ( ON ?auto_531435 ?auto_531434 ) ( ON ?auto_531436 ?auto_531435 ) ( ON ?auto_531437 ?auto_531436 ) ( ON ?auto_531438 ?auto_531437 ) ( ON ?auto_531439 ?auto_531438 ) ( not ( = ?auto_531432 ?auto_531433 ) ) ( not ( = ?auto_531432 ?auto_531434 ) ) ( not ( = ?auto_531432 ?auto_531435 ) ) ( not ( = ?auto_531432 ?auto_531436 ) ) ( not ( = ?auto_531432 ?auto_531437 ) ) ( not ( = ?auto_531432 ?auto_531438 ) ) ( not ( = ?auto_531432 ?auto_531439 ) ) ( not ( = ?auto_531432 ?auto_531440 ) ) ( not ( = ?auto_531432 ?auto_531441 ) ) ( not ( = ?auto_531432 ?auto_531442 ) ) ( not ( = ?auto_531432 ?auto_531443 ) ) ( not ( = ?auto_531432 ?auto_531444 ) ) ( not ( = ?auto_531432 ?auto_531445 ) ) ( not ( = ?auto_531432 ?auto_531446 ) ) ( not ( = ?auto_531433 ?auto_531434 ) ) ( not ( = ?auto_531433 ?auto_531435 ) ) ( not ( = ?auto_531433 ?auto_531436 ) ) ( not ( = ?auto_531433 ?auto_531437 ) ) ( not ( = ?auto_531433 ?auto_531438 ) ) ( not ( = ?auto_531433 ?auto_531439 ) ) ( not ( = ?auto_531433 ?auto_531440 ) ) ( not ( = ?auto_531433 ?auto_531441 ) ) ( not ( = ?auto_531433 ?auto_531442 ) ) ( not ( = ?auto_531433 ?auto_531443 ) ) ( not ( = ?auto_531433 ?auto_531444 ) ) ( not ( = ?auto_531433 ?auto_531445 ) ) ( not ( = ?auto_531433 ?auto_531446 ) ) ( not ( = ?auto_531434 ?auto_531435 ) ) ( not ( = ?auto_531434 ?auto_531436 ) ) ( not ( = ?auto_531434 ?auto_531437 ) ) ( not ( = ?auto_531434 ?auto_531438 ) ) ( not ( = ?auto_531434 ?auto_531439 ) ) ( not ( = ?auto_531434 ?auto_531440 ) ) ( not ( = ?auto_531434 ?auto_531441 ) ) ( not ( = ?auto_531434 ?auto_531442 ) ) ( not ( = ?auto_531434 ?auto_531443 ) ) ( not ( = ?auto_531434 ?auto_531444 ) ) ( not ( = ?auto_531434 ?auto_531445 ) ) ( not ( = ?auto_531434 ?auto_531446 ) ) ( not ( = ?auto_531435 ?auto_531436 ) ) ( not ( = ?auto_531435 ?auto_531437 ) ) ( not ( = ?auto_531435 ?auto_531438 ) ) ( not ( = ?auto_531435 ?auto_531439 ) ) ( not ( = ?auto_531435 ?auto_531440 ) ) ( not ( = ?auto_531435 ?auto_531441 ) ) ( not ( = ?auto_531435 ?auto_531442 ) ) ( not ( = ?auto_531435 ?auto_531443 ) ) ( not ( = ?auto_531435 ?auto_531444 ) ) ( not ( = ?auto_531435 ?auto_531445 ) ) ( not ( = ?auto_531435 ?auto_531446 ) ) ( not ( = ?auto_531436 ?auto_531437 ) ) ( not ( = ?auto_531436 ?auto_531438 ) ) ( not ( = ?auto_531436 ?auto_531439 ) ) ( not ( = ?auto_531436 ?auto_531440 ) ) ( not ( = ?auto_531436 ?auto_531441 ) ) ( not ( = ?auto_531436 ?auto_531442 ) ) ( not ( = ?auto_531436 ?auto_531443 ) ) ( not ( = ?auto_531436 ?auto_531444 ) ) ( not ( = ?auto_531436 ?auto_531445 ) ) ( not ( = ?auto_531436 ?auto_531446 ) ) ( not ( = ?auto_531437 ?auto_531438 ) ) ( not ( = ?auto_531437 ?auto_531439 ) ) ( not ( = ?auto_531437 ?auto_531440 ) ) ( not ( = ?auto_531437 ?auto_531441 ) ) ( not ( = ?auto_531437 ?auto_531442 ) ) ( not ( = ?auto_531437 ?auto_531443 ) ) ( not ( = ?auto_531437 ?auto_531444 ) ) ( not ( = ?auto_531437 ?auto_531445 ) ) ( not ( = ?auto_531437 ?auto_531446 ) ) ( not ( = ?auto_531438 ?auto_531439 ) ) ( not ( = ?auto_531438 ?auto_531440 ) ) ( not ( = ?auto_531438 ?auto_531441 ) ) ( not ( = ?auto_531438 ?auto_531442 ) ) ( not ( = ?auto_531438 ?auto_531443 ) ) ( not ( = ?auto_531438 ?auto_531444 ) ) ( not ( = ?auto_531438 ?auto_531445 ) ) ( not ( = ?auto_531438 ?auto_531446 ) ) ( not ( = ?auto_531439 ?auto_531440 ) ) ( not ( = ?auto_531439 ?auto_531441 ) ) ( not ( = ?auto_531439 ?auto_531442 ) ) ( not ( = ?auto_531439 ?auto_531443 ) ) ( not ( = ?auto_531439 ?auto_531444 ) ) ( not ( = ?auto_531439 ?auto_531445 ) ) ( not ( = ?auto_531439 ?auto_531446 ) ) ( not ( = ?auto_531440 ?auto_531441 ) ) ( not ( = ?auto_531440 ?auto_531442 ) ) ( not ( = ?auto_531440 ?auto_531443 ) ) ( not ( = ?auto_531440 ?auto_531444 ) ) ( not ( = ?auto_531440 ?auto_531445 ) ) ( not ( = ?auto_531440 ?auto_531446 ) ) ( not ( = ?auto_531441 ?auto_531442 ) ) ( not ( = ?auto_531441 ?auto_531443 ) ) ( not ( = ?auto_531441 ?auto_531444 ) ) ( not ( = ?auto_531441 ?auto_531445 ) ) ( not ( = ?auto_531441 ?auto_531446 ) ) ( not ( = ?auto_531442 ?auto_531443 ) ) ( not ( = ?auto_531442 ?auto_531444 ) ) ( not ( = ?auto_531442 ?auto_531445 ) ) ( not ( = ?auto_531442 ?auto_531446 ) ) ( not ( = ?auto_531443 ?auto_531444 ) ) ( not ( = ?auto_531443 ?auto_531445 ) ) ( not ( = ?auto_531443 ?auto_531446 ) ) ( not ( = ?auto_531444 ?auto_531445 ) ) ( not ( = ?auto_531444 ?auto_531446 ) ) ( not ( = ?auto_531445 ?auto_531446 ) ) ( ON ?auto_531444 ?auto_531445 ) ( ON ?auto_531443 ?auto_531444 ) ( ON ?auto_531442 ?auto_531443 ) ( ON ?auto_531441 ?auto_531442 ) ( CLEAR ?auto_531439 ) ( ON ?auto_531440 ?auto_531441 ) ( CLEAR ?auto_531440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_531432 ?auto_531433 ?auto_531434 ?auto_531435 ?auto_531436 ?auto_531437 ?auto_531438 ?auto_531439 ?auto_531440 )
      ( MAKE-14PILE ?auto_531432 ?auto_531433 ?auto_531434 ?auto_531435 ?auto_531436 ?auto_531437 ?auto_531438 ?auto_531439 ?auto_531440 ?auto_531441 ?auto_531442 ?auto_531443 ?auto_531444 ?auto_531445 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531490 - BLOCK
      ?auto_531491 - BLOCK
      ?auto_531492 - BLOCK
      ?auto_531493 - BLOCK
      ?auto_531494 - BLOCK
      ?auto_531495 - BLOCK
      ?auto_531496 - BLOCK
      ?auto_531497 - BLOCK
      ?auto_531498 - BLOCK
      ?auto_531499 - BLOCK
      ?auto_531500 - BLOCK
      ?auto_531501 - BLOCK
      ?auto_531502 - BLOCK
      ?auto_531503 - BLOCK
    )
    :vars
    (
      ?auto_531504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531503 ?auto_531504 ) ( ON-TABLE ?auto_531490 ) ( ON ?auto_531491 ?auto_531490 ) ( ON ?auto_531492 ?auto_531491 ) ( ON ?auto_531493 ?auto_531492 ) ( ON ?auto_531494 ?auto_531493 ) ( ON ?auto_531495 ?auto_531494 ) ( ON ?auto_531496 ?auto_531495 ) ( not ( = ?auto_531490 ?auto_531491 ) ) ( not ( = ?auto_531490 ?auto_531492 ) ) ( not ( = ?auto_531490 ?auto_531493 ) ) ( not ( = ?auto_531490 ?auto_531494 ) ) ( not ( = ?auto_531490 ?auto_531495 ) ) ( not ( = ?auto_531490 ?auto_531496 ) ) ( not ( = ?auto_531490 ?auto_531497 ) ) ( not ( = ?auto_531490 ?auto_531498 ) ) ( not ( = ?auto_531490 ?auto_531499 ) ) ( not ( = ?auto_531490 ?auto_531500 ) ) ( not ( = ?auto_531490 ?auto_531501 ) ) ( not ( = ?auto_531490 ?auto_531502 ) ) ( not ( = ?auto_531490 ?auto_531503 ) ) ( not ( = ?auto_531490 ?auto_531504 ) ) ( not ( = ?auto_531491 ?auto_531492 ) ) ( not ( = ?auto_531491 ?auto_531493 ) ) ( not ( = ?auto_531491 ?auto_531494 ) ) ( not ( = ?auto_531491 ?auto_531495 ) ) ( not ( = ?auto_531491 ?auto_531496 ) ) ( not ( = ?auto_531491 ?auto_531497 ) ) ( not ( = ?auto_531491 ?auto_531498 ) ) ( not ( = ?auto_531491 ?auto_531499 ) ) ( not ( = ?auto_531491 ?auto_531500 ) ) ( not ( = ?auto_531491 ?auto_531501 ) ) ( not ( = ?auto_531491 ?auto_531502 ) ) ( not ( = ?auto_531491 ?auto_531503 ) ) ( not ( = ?auto_531491 ?auto_531504 ) ) ( not ( = ?auto_531492 ?auto_531493 ) ) ( not ( = ?auto_531492 ?auto_531494 ) ) ( not ( = ?auto_531492 ?auto_531495 ) ) ( not ( = ?auto_531492 ?auto_531496 ) ) ( not ( = ?auto_531492 ?auto_531497 ) ) ( not ( = ?auto_531492 ?auto_531498 ) ) ( not ( = ?auto_531492 ?auto_531499 ) ) ( not ( = ?auto_531492 ?auto_531500 ) ) ( not ( = ?auto_531492 ?auto_531501 ) ) ( not ( = ?auto_531492 ?auto_531502 ) ) ( not ( = ?auto_531492 ?auto_531503 ) ) ( not ( = ?auto_531492 ?auto_531504 ) ) ( not ( = ?auto_531493 ?auto_531494 ) ) ( not ( = ?auto_531493 ?auto_531495 ) ) ( not ( = ?auto_531493 ?auto_531496 ) ) ( not ( = ?auto_531493 ?auto_531497 ) ) ( not ( = ?auto_531493 ?auto_531498 ) ) ( not ( = ?auto_531493 ?auto_531499 ) ) ( not ( = ?auto_531493 ?auto_531500 ) ) ( not ( = ?auto_531493 ?auto_531501 ) ) ( not ( = ?auto_531493 ?auto_531502 ) ) ( not ( = ?auto_531493 ?auto_531503 ) ) ( not ( = ?auto_531493 ?auto_531504 ) ) ( not ( = ?auto_531494 ?auto_531495 ) ) ( not ( = ?auto_531494 ?auto_531496 ) ) ( not ( = ?auto_531494 ?auto_531497 ) ) ( not ( = ?auto_531494 ?auto_531498 ) ) ( not ( = ?auto_531494 ?auto_531499 ) ) ( not ( = ?auto_531494 ?auto_531500 ) ) ( not ( = ?auto_531494 ?auto_531501 ) ) ( not ( = ?auto_531494 ?auto_531502 ) ) ( not ( = ?auto_531494 ?auto_531503 ) ) ( not ( = ?auto_531494 ?auto_531504 ) ) ( not ( = ?auto_531495 ?auto_531496 ) ) ( not ( = ?auto_531495 ?auto_531497 ) ) ( not ( = ?auto_531495 ?auto_531498 ) ) ( not ( = ?auto_531495 ?auto_531499 ) ) ( not ( = ?auto_531495 ?auto_531500 ) ) ( not ( = ?auto_531495 ?auto_531501 ) ) ( not ( = ?auto_531495 ?auto_531502 ) ) ( not ( = ?auto_531495 ?auto_531503 ) ) ( not ( = ?auto_531495 ?auto_531504 ) ) ( not ( = ?auto_531496 ?auto_531497 ) ) ( not ( = ?auto_531496 ?auto_531498 ) ) ( not ( = ?auto_531496 ?auto_531499 ) ) ( not ( = ?auto_531496 ?auto_531500 ) ) ( not ( = ?auto_531496 ?auto_531501 ) ) ( not ( = ?auto_531496 ?auto_531502 ) ) ( not ( = ?auto_531496 ?auto_531503 ) ) ( not ( = ?auto_531496 ?auto_531504 ) ) ( not ( = ?auto_531497 ?auto_531498 ) ) ( not ( = ?auto_531497 ?auto_531499 ) ) ( not ( = ?auto_531497 ?auto_531500 ) ) ( not ( = ?auto_531497 ?auto_531501 ) ) ( not ( = ?auto_531497 ?auto_531502 ) ) ( not ( = ?auto_531497 ?auto_531503 ) ) ( not ( = ?auto_531497 ?auto_531504 ) ) ( not ( = ?auto_531498 ?auto_531499 ) ) ( not ( = ?auto_531498 ?auto_531500 ) ) ( not ( = ?auto_531498 ?auto_531501 ) ) ( not ( = ?auto_531498 ?auto_531502 ) ) ( not ( = ?auto_531498 ?auto_531503 ) ) ( not ( = ?auto_531498 ?auto_531504 ) ) ( not ( = ?auto_531499 ?auto_531500 ) ) ( not ( = ?auto_531499 ?auto_531501 ) ) ( not ( = ?auto_531499 ?auto_531502 ) ) ( not ( = ?auto_531499 ?auto_531503 ) ) ( not ( = ?auto_531499 ?auto_531504 ) ) ( not ( = ?auto_531500 ?auto_531501 ) ) ( not ( = ?auto_531500 ?auto_531502 ) ) ( not ( = ?auto_531500 ?auto_531503 ) ) ( not ( = ?auto_531500 ?auto_531504 ) ) ( not ( = ?auto_531501 ?auto_531502 ) ) ( not ( = ?auto_531501 ?auto_531503 ) ) ( not ( = ?auto_531501 ?auto_531504 ) ) ( not ( = ?auto_531502 ?auto_531503 ) ) ( not ( = ?auto_531502 ?auto_531504 ) ) ( not ( = ?auto_531503 ?auto_531504 ) ) ( ON ?auto_531502 ?auto_531503 ) ( ON ?auto_531501 ?auto_531502 ) ( ON ?auto_531500 ?auto_531501 ) ( ON ?auto_531499 ?auto_531500 ) ( ON ?auto_531498 ?auto_531499 ) ( CLEAR ?auto_531496 ) ( ON ?auto_531497 ?auto_531498 ) ( CLEAR ?auto_531497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_531490 ?auto_531491 ?auto_531492 ?auto_531493 ?auto_531494 ?auto_531495 ?auto_531496 ?auto_531497 )
      ( MAKE-14PILE ?auto_531490 ?auto_531491 ?auto_531492 ?auto_531493 ?auto_531494 ?auto_531495 ?auto_531496 ?auto_531497 ?auto_531498 ?auto_531499 ?auto_531500 ?auto_531501 ?auto_531502 ?auto_531503 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531548 - BLOCK
      ?auto_531549 - BLOCK
      ?auto_531550 - BLOCK
      ?auto_531551 - BLOCK
      ?auto_531552 - BLOCK
      ?auto_531553 - BLOCK
      ?auto_531554 - BLOCK
      ?auto_531555 - BLOCK
      ?auto_531556 - BLOCK
      ?auto_531557 - BLOCK
      ?auto_531558 - BLOCK
      ?auto_531559 - BLOCK
      ?auto_531560 - BLOCK
      ?auto_531561 - BLOCK
    )
    :vars
    (
      ?auto_531562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531561 ?auto_531562 ) ( ON-TABLE ?auto_531548 ) ( ON ?auto_531549 ?auto_531548 ) ( ON ?auto_531550 ?auto_531549 ) ( ON ?auto_531551 ?auto_531550 ) ( ON ?auto_531552 ?auto_531551 ) ( ON ?auto_531553 ?auto_531552 ) ( not ( = ?auto_531548 ?auto_531549 ) ) ( not ( = ?auto_531548 ?auto_531550 ) ) ( not ( = ?auto_531548 ?auto_531551 ) ) ( not ( = ?auto_531548 ?auto_531552 ) ) ( not ( = ?auto_531548 ?auto_531553 ) ) ( not ( = ?auto_531548 ?auto_531554 ) ) ( not ( = ?auto_531548 ?auto_531555 ) ) ( not ( = ?auto_531548 ?auto_531556 ) ) ( not ( = ?auto_531548 ?auto_531557 ) ) ( not ( = ?auto_531548 ?auto_531558 ) ) ( not ( = ?auto_531548 ?auto_531559 ) ) ( not ( = ?auto_531548 ?auto_531560 ) ) ( not ( = ?auto_531548 ?auto_531561 ) ) ( not ( = ?auto_531548 ?auto_531562 ) ) ( not ( = ?auto_531549 ?auto_531550 ) ) ( not ( = ?auto_531549 ?auto_531551 ) ) ( not ( = ?auto_531549 ?auto_531552 ) ) ( not ( = ?auto_531549 ?auto_531553 ) ) ( not ( = ?auto_531549 ?auto_531554 ) ) ( not ( = ?auto_531549 ?auto_531555 ) ) ( not ( = ?auto_531549 ?auto_531556 ) ) ( not ( = ?auto_531549 ?auto_531557 ) ) ( not ( = ?auto_531549 ?auto_531558 ) ) ( not ( = ?auto_531549 ?auto_531559 ) ) ( not ( = ?auto_531549 ?auto_531560 ) ) ( not ( = ?auto_531549 ?auto_531561 ) ) ( not ( = ?auto_531549 ?auto_531562 ) ) ( not ( = ?auto_531550 ?auto_531551 ) ) ( not ( = ?auto_531550 ?auto_531552 ) ) ( not ( = ?auto_531550 ?auto_531553 ) ) ( not ( = ?auto_531550 ?auto_531554 ) ) ( not ( = ?auto_531550 ?auto_531555 ) ) ( not ( = ?auto_531550 ?auto_531556 ) ) ( not ( = ?auto_531550 ?auto_531557 ) ) ( not ( = ?auto_531550 ?auto_531558 ) ) ( not ( = ?auto_531550 ?auto_531559 ) ) ( not ( = ?auto_531550 ?auto_531560 ) ) ( not ( = ?auto_531550 ?auto_531561 ) ) ( not ( = ?auto_531550 ?auto_531562 ) ) ( not ( = ?auto_531551 ?auto_531552 ) ) ( not ( = ?auto_531551 ?auto_531553 ) ) ( not ( = ?auto_531551 ?auto_531554 ) ) ( not ( = ?auto_531551 ?auto_531555 ) ) ( not ( = ?auto_531551 ?auto_531556 ) ) ( not ( = ?auto_531551 ?auto_531557 ) ) ( not ( = ?auto_531551 ?auto_531558 ) ) ( not ( = ?auto_531551 ?auto_531559 ) ) ( not ( = ?auto_531551 ?auto_531560 ) ) ( not ( = ?auto_531551 ?auto_531561 ) ) ( not ( = ?auto_531551 ?auto_531562 ) ) ( not ( = ?auto_531552 ?auto_531553 ) ) ( not ( = ?auto_531552 ?auto_531554 ) ) ( not ( = ?auto_531552 ?auto_531555 ) ) ( not ( = ?auto_531552 ?auto_531556 ) ) ( not ( = ?auto_531552 ?auto_531557 ) ) ( not ( = ?auto_531552 ?auto_531558 ) ) ( not ( = ?auto_531552 ?auto_531559 ) ) ( not ( = ?auto_531552 ?auto_531560 ) ) ( not ( = ?auto_531552 ?auto_531561 ) ) ( not ( = ?auto_531552 ?auto_531562 ) ) ( not ( = ?auto_531553 ?auto_531554 ) ) ( not ( = ?auto_531553 ?auto_531555 ) ) ( not ( = ?auto_531553 ?auto_531556 ) ) ( not ( = ?auto_531553 ?auto_531557 ) ) ( not ( = ?auto_531553 ?auto_531558 ) ) ( not ( = ?auto_531553 ?auto_531559 ) ) ( not ( = ?auto_531553 ?auto_531560 ) ) ( not ( = ?auto_531553 ?auto_531561 ) ) ( not ( = ?auto_531553 ?auto_531562 ) ) ( not ( = ?auto_531554 ?auto_531555 ) ) ( not ( = ?auto_531554 ?auto_531556 ) ) ( not ( = ?auto_531554 ?auto_531557 ) ) ( not ( = ?auto_531554 ?auto_531558 ) ) ( not ( = ?auto_531554 ?auto_531559 ) ) ( not ( = ?auto_531554 ?auto_531560 ) ) ( not ( = ?auto_531554 ?auto_531561 ) ) ( not ( = ?auto_531554 ?auto_531562 ) ) ( not ( = ?auto_531555 ?auto_531556 ) ) ( not ( = ?auto_531555 ?auto_531557 ) ) ( not ( = ?auto_531555 ?auto_531558 ) ) ( not ( = ?auto_531555 ?auto_531559 ) ) ( not ( = ?auto_531555 ?auto_531560 ) ) ( not ( = ?auto_531555 ?auto_531561 ) ) ( not ( = ?auto_531555 ?auto_531562 ) ) ( not ( = ?auto_531556 ?auto_531557 ) ) ( not ( = ?auto_531556 ?auto_531558 ) ) ( not ( = ?auto_531556 ?auto_531559 ) ) ( not ( = ?auto_531556 ?auto_531560 ) ) ( not ( = ?auto_531556 ?auto_531561 ) ) ( not ( = ?auto_531556 ?auto_531562 ) ) ( not ( = ?auto_531557 ?auto_531558 ) ) ( not ( = ?auto_531557 ?auto_531559 ) ) ( not ( = ?auto_531557 ?auto_531560 ) ) ( not ( = ?auto_531557 ?auto_531561 ) ) ( not ( = ?auto_531557 ?auto_531562 ) ) ( not ( = ?auto_531558 ?auto_531559 ) ) ( not ( = ?auto_531558 ?auto_531560 ) ) ( not ( = ?auto_531558 ?auto_531561 ) ) ( not ( = ?auto_531558 ?auto_531562 ) ) ( not ( = ?auto_531559 ?auto_531560 ) ) ( not ( = ?auto_531559 ?auto_531561 ) ) ( not ( = ?auto_531559 ?auto_531562 ) ) ( not ( = ?auto_531560 ?auto_531561 ) ) ( not ( = ?auto_531560 ?auto_531562 ) ) ( not ( = ?auto_531561 ?auto_531562 ) ) ( ON ?auto_531560 ?auto_531561 ) ( ON ?auto_531559 ?auto_531560 ) ( ON ?auto_531558 ?auto_531559 ) ( ON ?auto_531557 ?auto_531558 ) ( ON ?auto_531556 ?auto_531557 ) ( ON ?auto_531555 ?auto_531556 ) ( CLEAR ?auto_531553 ) ( ON ?auto_531554 ?auto_531555 ) ( CLEAR ?auto_531554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_531548 ?auto_531549 ?auto_531550 ?auto_531551 ?auto_531552 ?auto_531553 ?auto_531554 )
      ( MAKE-14PILE ?auto_531548 ?auto_531549 ?auto_531550 ?auto_531551 ?auto_531552 ?auto_531553 ?auto_531554 ?auto_531555 ?auto_531556 ?auto_531557 ?auto_531558 ?auto_531559 ?auto_531560 ?auto_531561 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531606 - BLOCK
      ?auto_531607 - BLOCK
      ?auto_531608 - BLOCK
      ?auto_531609 - BLOCK
      ?auto_531610 - BLOCK
      ?auto_531611 - BLOCK
      ?auto_531612 - BLOCK
      ?auto_531613 - BLOCK
      ?auto_531614 - BLOCK
      ?auto_531615 - BLOCK
      ?auto_531616 - BLOCK
      ?auto_531617 - BLOCK
      ?auto_531618 - BLOCK
      ?auto_531619 - BLOCK
    )
    :vars
    (
      ?auto_531620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531619 ?auto_531620 ) ( ON-TABLE ?auto_531606 ) ( ON ?auto_531607 ?auto_531606 ) ( ON ?auto_531608 ?auto_531607 ) ( ON ?auto_531609 ?auto_531608 ) ( ON ?auto_531610 ?auto_531609 ) ( not ( = ?auto_531606 ?auto_531607 ) ) ( not ( = ?auto_531606 ?auto_531608 ) ) ( not ( = ?auto_531606 ?auto_531609 ) ) ( not ( = ?auto_531606 ?auto_531610 ) ) ( not ( = ?auto_531606 ?auto_531611 ) ) ( not ( = ?auto_531606 ?auto_531612 ) ) ( not ( = ?auto_531606 ?auto_531613 ) ) ( not ( = ?auto_531606 ?auto_531614 ) ) ( not ( = ?auto_531606 ?auto_531615 ) ) ( not ( = ?auto_531606 ?auto_531616 ) ) ( not ( = ?auto_531606 ?auto_531617 ) ) ( not ( = ?auto_531606 ?auto_531618 ) ) ( not ( = ?auto_531606 ?auto_531619 ) ) ( not ( = ?auto_531606 ?auto_531620 ) ) ( not ( = ?auto_531607 ?auto_531608 ) ) ( not ( = ?auto_531607 ?auto_531609 ) ) ( not ( = ?auto_531607 ?auto_531610 ) ) ( not ( = ?auto_531607 ?auto_531611 ) ) ( not ( = ?auto_531607 ?auto_531612 ) ) ( not ( = ?auto_531607 ?auto_531613 ) ) ( not ( = ?auto_531607 ?auto_531614 ) ) ( not ( = ?auto_531607 ?auto_531615 ) ) ( not ( = ?auto_531607 ?auto_531616 ) ) ( not ( = ?auto_531607 ?auto_531617 ) ) ( not ( = ?auto_531607 ?auto_531618 ) ) ( not ( = ?auto_531607 ?auto_531619 ) ) ( not ( = ?auto_531607 ?auto_531620 ) ) ( not ( = ?auto_531608 ?auto_531609 ) ) ( not ( = ?auto_531608 ?auto_531610 ) ) ( not ( = ?auto_531608 ?auto_531611 ) ) ( not ( = ?auto_531608 ?auto_531612 ) ) ( not ( = ?auto_531608 ?auto_531613 ) ) ( not ( = ?auto_531608 ?auto_531614 ) ) ( not ( = ?auto_531608 ?auto_531615 ) ) ( not ( = ?auto_531608 ?auto_531616 ) ) ( not ( = ?auto_531608 ?auto_531617 ) ) ( not ( = ?auto_531608 ?auto_531618 ) ) ( not ( = ?auto_531608 ?auto_531619 ) ) ( not ( = ?auto_531608 ?auto_531620 ) ) ( not ( = ?auto_531609 ?auto_531610 ) ) ( not ( = ?auto_531609 ?auto_531611 ) ) ( not ( = ?auto_531609 ?auto_531612 ) ) ( not ( = ?auto_531609 ?auto_531613 ) ) ( not ( = ?auto_531609 ?auto_531614 ) ) ( not ( = ?auto_531609 ?auto_531615 ) ) ( not ( = ?auto_531609 ?auto_531616 ) ) ( not ( = ?auto_531609 ?auto_531617 ) ) ( not ( = ?auto_531609 ?auto_531618 ) ) ( not ( = ?auto_531609 ?auto_531619 ) ) ( not ( = ?auto_531609 ?auto_531620 ) ) ( not ( = ?auto_531610 ?auto_531611 ) ) ( not ( = ?auto_531610 ?auto_531612 ) ) ( not ( = ?auto_531610 ?auto_531613 ) ) ( not ( = ?auto_531610 ?auto_531614 ) ) ( not ( = ?auto_531610 ?auto_531615 ) ) ( not ( = ?auto_531610 ?auto_531616 ) ) ( not ( = ?auto_531610 ?auto_531617 ) ) ( not ( = ?auto_531610 ?auto_531618 ) ) ( not ( = ?auto_531610 ?auto_531619 ) ) ( not ( = ?auto_531610 ?auto_531620 ) ) ( not ( = ?auto_531611 ?auto_531612 ) ) ( not ( = ?auto_531611 ?auto_531613 ) ) ( not ( = ?auto_531611 ?auto_531614 ) ) ( not ( = ?auto_531611 ?auto_531615 ) ) ( not ( = ?auto_531611 ?auto_531616 ) ) ( not ( = ?auto_531611 ?auto_531617 ) ) ( not ( = ?auto_531611 ?auto_531618 ) ) ( not ( = ?auto_531611 ?auto_531619 ) ) ( not ( = ?auto_531611 ?auto_531620 ) ) ( not ( = ?auto_531612 ?auto_531613 ) ) ( not ( = ?auto_531612 ?auto_531614 ) ) ( not ( = ?auto_531612 ?auto_531615 ) ) ( not ( = ?auto_531612 ?auto_531616 ) ) ( not ( = ?auto_531612 ?auto_531617 ) ) ( not ( = ?auto_531612 ?auto_531618 ) ) ( not ( = ?auto_531612 ?auto_531619 ) ) ( not ( = ?auto_531612 ?auto_531620 ) ) ( not ( = ?auto_531613 ?auto_531614 ) ) ( not ( = ?auto_531613 ?auto_531615 ) ) ( not ( = ?auto_531613 ?auto_531616 ) ) ( not ( = ?auto_531613 ?auto_531617 ) ) ( not ( = ?auto_531613 ?auto_531618 ) ) ( not ( = ?auto_531613 ?auto_531619 ) ) ( not ( = ?auto_531613 ?auto_531620 ) ) ( not ( = ?auto_531614 ?auto_531615 ) ) ( not ( = ?auto_531614 ?auto_531616 ) ) ( not ( = ?auto_531614 ?auto_531617 ) ) ( not ( = ?auto_531614 ?auto_531618 ) ) ( not ( = ?auto_531614 ?auto_531619 ) ) ( not ( = ?auto_531614 ?auto_531620 ) ) ( not ( = ?auto_531615 ?auto_531616 ) ) ( not ( = ?auto_531615 ?auto_531617 ) ) ( not ( = ?auto_531615 ?auto_531618 ) ) ( not ( = ?auto_531615 ?auto_531619 ) ) ( not ( = ?auto_531615 ?auto_531620 ) ) ( not ( = ?auto_531616 ?auto_531617 ) ) ( not ( = ?auto_531616 ?auto_531618 ) ) ( not ( = ?auto_531616 ?auto_531619 ) ) ( not ( = ?auto_531616 ?auto_531620 ) ) ( not ( = ?auto_531617 ?auto_531618 ) ) ( not ( = ?auto_531617 ?auto_531619 ) ) ( not ( = ?auto_531617 ?auto_531620 ) ) ( not ( = ?auto_531618 ?auto_531619 ) ) ( not ( = ?auto_531618 ?auto_531620 ) ) ( not ( = ?auto_531619 ?auto_531620 ) ) ( ON ?auto_531618 ?auto_531619 ) ( ON ?auto_531617 ?auto_531618 ) ( ON ?auto_531616 ?auto_531617 ) ( ON ?auto_531615 ?auto_531616 ) ( ON ?auto_531614 ?auto_531615 ) ( ON ?auto_531613 ?auto_531614 ) ( ON ?auto_531612 ?auto_531613 ) ( CLEAR ?auto_531610 ) ( ON ?auto_531611 ?auto_531612 ) ( CLEAR ?auto_531611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_531606 ?auto_531607 ?auto_531608 ?auto_531609 ?auto_531610 ?auto_531611 )
      ( MAKE-14PILE ?auto_531606 ?auto_531607 ?auto_531608 ?auto_531609 ?auto_531610 ?auto_531611 ?auto_531612 ?auto_531613 ?auto_531614 ?auto_531615 ?auto_531616 ?auto_531617 ?auto_531618 ?auto_531619 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531664 - BLOCK
      ?auto_531665 - BLOCK
      ?auto_531666 - BLOCK
      ?auto_531667 - BLOCK
      ?auto_531668 - BLOCK
      ?auto_531669 - BLOCK
      ?auto_531670 - BLOCK
      ?auto_531671 - BLOCK
      ?auto_531672 - BLOCK
      ?auto_531673 - BLOCK
      ?auto_531674 - BLOCK
      ?auto_531675 - BLOCK
      ?auto_531676 - BLOCK
      ?auto_531677 - BLOCK
    )
    :vars
    (
      ?auto_531678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531677 ?auto_531678 ) ( ON-TABLE ?auto_531664 ) ( ON ?auto_531665 ?auto_531664 ) ( ON ?auto_531666 ?auto_531665 ) ( ON ?auto_531667 ?auto_531666 ) ( not ( = ?auto_531664 ?auto_531665 ) ) ( not ( = ?auto_531664 ?auto_531666 ) ) ( not ( = ?auto_531664 ?auto_531667 ) ) ( not ( = ?auto_531664 ?auto_531668 ) ) ( not ( = ?auto_531664 ?auto_531669 ) ) ( not ( = ?auto_531664 ?auto_531670 ) ) ( not ( = ?auto_531664 ?auto_531671 ) ) ( not ( = ?auto_531664 ?auto_531672 ) ) ( not ( = ?auto_531664 ?auto_531673 ) ) ( not ( = ?auto_531664 ?auto_531674 ) ) ( not ( = ?auto_531664 ?auto_531675 ) ) ( not ( = ?auto_531664 ?auto_531676 ) ) ( not ( = ?auto_531664 ?auto_531677 ) ) ( not ( = ?auto_531664 ?auto_531678 ) ) ( not ( = ?auto_531665 ?auto_531666 ) ) ( not ( = ?auto_531665 ?auto_531667 ) ) ( not ( = ?auto_531665 ?auto_531668 ) ) ( not ( = ?auto_531665 ?auto_531669 ) ) ( not ( = ?auto_531665 ?auto_531670 ) ) ( not ( = ?auto_531665 ?auto_531671 ) ) ( not ( = ?auto_531665 ?auto_531672 ) ) ( not ( = ?auto_531665 ?auto_531673 ) ) ( not ( = ?auto_531665 ?auto_531674 ) ) ( not ( = ?auto_531665 ?auto_531675 ) ) ( not ( = ?auto_531665 ?auto_531676 ) ) ( not ( = ?auto_531665 ?auto_531677 ) ) ( not ( = ?auto_531665 ?auto_531678 ) ) ( not ( = ?auto_531666 ?auto_531667 ) ) ( not ( = ?auto_531666 ?auto_531668 ) ) ( not ( = ?auto_531666 ?auto_531669 ) ) ( not ( = ?auto_531666 ?auto_531670 ) ) ( not ( = ?auto_531666 ?auto_531671 ) ) ( not ( = ?auto_531666 ?auto_531672 ) ) ( not ( = ?auto_531666 ?auto_531673 ) ) ( not ( = ?auto_531666 ?auto_531674 ) ) ( not ( = ?auto_531666 ?auto_531675 ) ) ( not ( = ?auto_531666 ?auto_531676 ) ) ( not ( = ?auto_531666 ?auto_531677 ) ) ( not ( = ?auto_531666 ?auto_531678 ) ) ( not ( = ?auto_531667 ?auto_531668 ) ) ( not ( = ?auto_531667 ?auto_531669 ) ) ( not ( = ?auto_531667 ?auto_531670 ) ) ( not ( = ?auto_531667 ?auto_531671 ) ) ( not ( = ?auto_531667 ?auto_531672 ) ) ( not ( = ?auto_531667 ?auto_531673 ) ) ( not ( = ?auto_531667 ?auto_531674 ) ) ( not ( = ?auto_531667 ?auto_531675 ) ) ( not ( = ?auto_531667 ?auto_531676 ) ) ( not ( = ?auto_531667 ?auto_531677 ) ) ( not ( = ?auto_531667 ?auto_531678 ) ) ( not ( = ?auto_531668 ?auto_531669 ) ) ( not ( = ?auto_531668 ?auto_531670 ) ) ( not ( = ?auto_531668 ?auto_531671 ) ) ( not ( = ?auto_531668 ?auto_531672 ) ) ( not ( = ?auto_531668 ?auto_531673 ) ) ( not ( = ?auto_531668 ?auto_531674 ) ) ( not ( = ?auto_531668 ?auto_531675 ) ) ( not ( = ?auto_531668 ?auto_531676 ) ) ( not ( = ?auto_531668 ?auto_531677 ) ) ( not ( = ?auto_531668 ?auto_531678 ) ) ( not ( = ?auto_531669 ?auto_531670 ) ) ( not ( = ?auto_531669 ?auto_531671 ) ) ( not ( = ?auto_531669 ?auto_531672 ) ) ( not ( = ?auto_531669 ?auto_531673 ) ) ( not ( = ?auto_531669 ?auto_531674 ) ) ( not ( = ?auto_531669 ?auto_531675 ) ) ( not ( = ?auto_531669 ?auto_531676 ) ) ( not ( = ?auto_531669 ?auto_531677 ) ) ( not ( = ?auto_531669 ?auto_531678 ) ) ( not ( = ?auto_531670 ?auto_531671 ) ) ( not ( = ?auto_531670 ?auto_531672 ) ) ( not ( = ?auto_531670 ?auto_531673 ) ) ( not ( = ?auto_531670 ?auto_531674 ) ) ( not ( = ?auto_531670 ?auto_531675 ) ) ( not ( = ?auto_531670 ?auto_531676 ) ) ( not ( = ?auto_531670 ?auto_531677 ) ) ( not ( = ?auto_531670 ?auto_531678 ) ) ( not ( = ?auto_531671 ?auto_531672 ) ) ( not ( = ?auto_531671 ?auto_531673 ) ) ( not ( = ?auto_531671 ?auto_531674 ) ) ( not ( = ?auto_531671 ?auto_531675 ) ) ( not ( = ?auto_531671 ?auto_531676 ) ) ( not ( = ?auto_531671 ?auto_531677 ) ) ( not ( = ?auto_531671 ?auto_531678 ) ) ( not ( = ?auto_531672 ?auto_531673 ) ) ( not ( = ?auto_531672 ?auto_531674 ) ) ( not ( = ?auto_531672 ?auto_531675 ) ) ( not ( = ?auto_531672 ?auto_531676 ) ) ( not ( = ?auto_531672 ?auto_531677 ) ) ( not ( = ?auto_531672 ?auto_531678 ) ) ( not ( = ?auto_531673 ?auto_531674 ) ) ( not ( = ?auto_531673 ?auto_531675 ) ) ( not ( = ?auto_531673 ?auto_531676 ) ) ( not ( = ?auto_531673 ?auto_531677 ) ) ( not ( = ?auto_531673 ?auto_531678 ) ) ( not ( = ?auto_531674 ?auto_531675 ) ) ( not ( = ?auto_531674 ?auto_531676 ) ) ( not ( = ?auto_531674 ?auto_531677 ) ) ( not ( = ?auto_531674 ?auto_531678 ) ) ( not ( = ?auto_531675 ?auto_531676 ) ) ( not ( = ?auto_531675 ?auto_531677 ) ) ( not ( = ?auto_531675 ?auto_531678 ) ) ( not ( = ?auto_531676 ?auto_531677 ) ) ( not ( = ?auto_531676 ?auto_531678 ) ) ( not ( = ?auto_531677 ?auto_531678 ) ) ( ON ?auto_531676 ?auto_531677 ) ( ON ?auto_531675 ?auto_531676 ) ( ON ?auto_531674 ?auto_531675 ) ( ON ?auto_531673 ?auto_531674 ) ( ON ?auto_531672 ?auto_531673 ) ( ON ?auto_531671 ?auto_531672 ) ( ON ?auto_531670 ?auto_531671 ) ( ON ?auto_531669 ?auto_531670 ) ( CLEAR ?auto_531667 ) ( ON ?auto_531668 ?auto_531669 ) ( CLEAR ?auto_531668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_531664 ?auto_531665 ?auto_531666 ?auto_531667 ?auto_531668 )
      ( MAKE-14PILE ?auto_531664 ?auto_531665 ?auto_531666 ?auto_531667 ?auto_531668 ?auto_531669 ?auto_531670 ?auto_531671 ?auto_531672 ?auto_531673 ?auto_531674 ?auto_531675 ?auto_531676 ?auto_531677 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531722 - BLOCK
      ?auto_531723 - BLOCK
      ?auto_531724 - BLOCK
      ?auto_531725 - BLOCK
      ?auto_531726 - BLOCK
      ?auto_531727 - BLOCK
      ?auto_531728 - BLOCK
      ?auto_531729 - BLOCK
      ?auto_531730 - BLOCK
      ?auto_531731 - BLOCK
      ?auto_531732 - BLOCK
      ?auto_531733 - BLOCK
      ?auto_531734 - BLOCK
      ?auto_531735 - BLOCK
    )
    :vars
    (
      ?auto_531736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531735 ?auto_531736 ) ( ON-TABLE ?auto_531722 ) ( ON ?auto_531723 ?auto_531722 ) ( ON ?auto_531724 ?auto_531723 ) ( not ( = ?auto_531722 ?auto_531723 ) ) ( not ( = ?auto_531722 ?auto_531724 ) ) ( not ( = ?auto_531722 ?auto_531725 ) ) ( not ( = ?auto_531722 ?auto_531726 ) ) ( not ( = ?auto_531722 ?auto_531727 ) ) ( not ( = ?auto_531722 ?auto_531728 ) ) ( not ( = ?auto_531722 ?auto_531729 ) ) ( not ( = ?auto_531722 ?auto_531730 ) ) ( not ( = ?auto_531722 ?auto_531731 ) ) ( not ( = ?auto_531722 ?auto_531732 ) ) ( not ( = ?auto_531722 ?auto_531733 ) ) ( not ( = ?auto_531722 ?auto_531734 ) ) ( not ( = ?auto_531722 ?auto_531735 ) ) ( not ( = ?auto_531722 ?auto_531736 ) ) ( not ( = ?auto_531723 ?auto_531724 ) ) ( not ( = ?auto_531723 ?auto_531725 ) ) ( not ( = ?auto_531723 ?auto_531726 ) ) ( not ( = ?auto_531723 ?auto_531727 ) ) ( not ( = ?auto_531723 ?auto_531728 ) ) ( not ( = ?auto_531723 ?auto_531729 ) ) ( not ( = ?auto_531723 ?auto_531730 ) ) ( not ( = ?auto_531723 ?auto_531731 ) ) ( not ( = ?auto_531723 ?auto_531732 ) ) ( not ( = ?auto_531723 ?auto_531733 ) ) ( not ( = ?auto_531723 ?auto_531734 ) ) ( not ( = ?auto_531723 ?auto_531735 ) ) ( not ( = ?auto_531723 ?auto_531736 ) ) ( not ( = ?auto_531724 ?auto_531725 ) ) ( not ( = ?auto_531724 ?auto_531726 ) ) ( not ( = ?auto_531724 ?auto_531727 ) ) ( not ( = ?auto_531724 ?auto_531728 ) ) ( not ( = ?auto_531724 ?auto_531729 ) ) ( not ( = ?auto_531724 ?auto_531730 ) ) ( not ( = ?auto_531724 ?auto_531731 ) ) ( not ( = ?auto_531724 ?auto_531732 ) ) ( not ( = ?auto_531724 ?auto_531733 ) ) ( not ( = ?auto_531724 ?auto_531734 ) ) ( not ( = ?auto_531724 ?auto_531735 ) ) ( not ( = ?auto_531724 ?auto_531736 ) ) ( not ( = ?auto_531725 ?auto_531726 ) ) ( not ( = ?auto_531725 ?auto_531727 ) ) ( not ( = ?auto_531725 ?auto_531728 ) ) ( not ( = ?auto_531725 ?auto_531729 ) ) ( not ( = ?auto_531725 ?auto_531730 ) ) ( not ( = ?auto_531725 ?auto_531731 ) ) ( not ( = ?auto_531725 ?auto_531732 ) ) ( not ( = ?auto_531725 ?auto_531733 ) ) ( not ( = ?auto_531725 ?auto_531734 ) ) ( not ( = ?auto_531725 ?auto_531735 ) ) ( not ( = ?auto_531725 ?auto_531736 ) ) ( not ( = ?auto_531726 ?auto_531727 ) ) ( not ( = ?auto_531726 ?auto_531728 ) ) ( not ( = ?auto_531726 ?auto_531729 ) ) ( not ( = ?auto_531726 ?auto_531730 ) ) ( not ( = ?auto_531726 ?auto_531731 ) ) ( not ( = ?auto_531726 ?auto_531732 ) ) ( not ( = ?auto_531726 ?auto_531733 ) ) ( not ( = ?auto_531726 ?auto_531734 ) ) ( not ( = ?auto_531726 ?auto_531735 ) ) ( not ( = ?auto_531726 ?auto_531736 ) ) ( not ( = ?auto_531727 ?auto_531728 ) ) ( not ( = ?auto_531727 ?auto_531729 ) ) ( not ( = ?auto_531727 ?auto_531730 ) ) ( not ( = ?auto_531727 ?auto_531731 ) ) ( not ( = ?auto_531727 ?auto_531732 ) ) ( not ( = ?auto_531727 ?auto_531733 ) ) ( not ( = ?auto_531727 ?auto_531734 ) ) ( not ( = ?auto_531727 ?auto_531735 ) ) ( not ( = ?auto_531727 ?auto_531736 ) ) ( not ( = ?auto_531728 ?auto_531729 ) ) ( not ( = ?auto_531728 ?auto_531730 ) ) ( not ( = ?auto_531728 ?auto_531731 ) ) ( not ( = ?auto_531728 ?auto_531732 ) ) ( not ( = ?auto_531728 ?auto_531733 ) ) ( not ( = ?auto_531728 ?auto_531734 ) ) ( not ( = ?auto_531728 ?auto_531735 ) ) ( not ( = ?auto_531728 ?auto_531736 ) ) ( not ( = ?auto_531729 ?auto_531730 ) ) ( not ( = ?auto_531729 ?auto_531731 ) ) ( not ( = ?auto_531729 ?auto_531732 ) ) ( not ( = ?auto_531729 ?auto_531733 ) ) ( not ( = ?auto_531729 ?auto_531734 ) ) ( not ( = ?auto_531729 ?auto_531735 ) ) ( not ( = ?auto_531729 ?auto_531736 ) ) ( not ( = ?auto_531730 ?auto_531731 ) ) ( not ( = ?auto_531730 ?auto_531732 ) ) ( not ( = ?auto_531730 ?auto_531733 ) ) ( not ( = ?auto_531730 ?auto_531734 ) ) ( not ( = ?auto_531730 ?auto_531735 ) ) ( not ( = ?auto_531730 ?auto_531736 ) ) ( not ( = ?auto_531731 ?auto_531732 ) ) ( not ( = ?auto_531731 ?auto_531733 ) ) ( not ( = ?auto_531731 ?auto_531734 ) ) ( not ( = ?auto_531731 ?auto_531735 ) ) ( not ( = ?auto_531731 ?auto_531736 ) ) ( not ( = ?auto_531732 ?auto_531733 ) ) ( not ( = ?auto_531732 ?auto_531734 ) ) ( not ( = ?auto_531732 ?auto_531735 ) ) ( not ( = ?auto_531732 ?auto_531736 ) ) ( not ( = ?auto_531733 ?auto_531734 ) ) ( not ( = ?auto_531733 ?auto_531735 ) ) ( not ( = ?auto_531733 ?auto_531736 ) ) ( not ( = ?auto_531734 ?auto_531735 ) ) ( not ( = ?auto_531734 ?auto_531736 ) ) ( not ( = ?auto_531735 ?auto_531736 ) ) ( ON ?auto_531734 ?auto_531735 ) ( ON ?auto_531733 ?auto_531734 ) ( ON ?auto_531732 ?auto_531733 ) ( ON ?auto_531731 ?auto_531732 ) ( ON ?auto_531730 ?auto_531731 ) ( ON ?auto_531729 ?auto_531730 ) ( ON ?auto_531728 ?auto_531729 ) ( ON ?auto_531727 ?auto_531728 ) ( ON ?auto_531726 ?auto_531727 ) ( CLEAR ?auto_531724 ) ( ON ?auto_531725 ?auto_531726 ) ( CLEAR ?auto_531725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_531722 ?auto_531723 ?auto_531724 ?auto_531725 )
      ( MAKE-14PILE ?auto_531722 ?auto_531723 ?auto_531724 ?auto_531725 ?auto_531726 ?auto_531727 ?auto_531728 ?auto_531729 ?auto_531730 ?auto_531731 ?auto_531732 ?auto_531733 ?auto_531734 ?auto_531735 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531780 - BLOCK
      ?auto_531781 - BLOCK
      ?auto_531782 - BLOCK
      ?auto_531783 - BLOCK
      ?auto_531784 - BLOCK
      ?auto_531785 - BLOCK
      ?auto_531786 - BLOCK
      ?auto_531787 - BLOCK
      ?auto_531788 - BLOCK
      ?auto_531789 - BLOCK
      ?auto_531790 - BLOCK
      ?auto_531791 - BLOCK
      ?auto_531792 - BLOCK
      ?auto_531793 - BLOCK
    )
    :vars
    (
      ?auto_531794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531793 ?auto_531794 ) ( ON-TABLE ?auto_531780 ) ( ON ?auto_531781 ?auto_531780 ) ( not ( = ?auto_531780 ?auto_531781 ) ) ( not ( = ?auto_531780 ?auto_531782 ) ) ( not ( = ?auto_531780 ?auto_531783 ) ) ( not ( = ?auto_531780 ?auto_531784 ) ) ( not ( = ?auto_531780 ?auto_531785 ) ) ( not ( = ?auto_531780 ?auto_531786 ) ) ( not ( = ?auto_531780 ?auto_531787 ) ) ( not ( = ?auto_531780 ?auto_531788 ) ) ( not ( = ?auto_531780 ?auto_531789 ) ) ( not ( = ?auto_531780 ?auto_531790 ) ) ( not ( = ?auto_531780 ?auto_531791 ) ) ( not ( = ?auto_531780 ?auto_531792 ) ) ( not ( = ?auto_531780 ?auto_531793 ) ) ( not ( = ?auto_531780 ?auto_531794 ) ) ( not ( = ?auto_531781 ?auto_531782 ) ) ( not ( = ?auto_531781 ?auto_531783 ) ) ( not ( = ?auto_531781 ?auto_531784 ) ) ( not ( = ?auto_531781 ?auto_531785 ) ) ( not ( = ?auto_531781 ?auto_531786 ) ) ( not ( = ?auto_531781 ?auto_531787 ) ) ( not ( = ?auto_531781 ?auto_531788 ) ) ( not ( = ?auto_531781 ?auto_531789 ) ) ( not ( = ?auto_531781 ?auto_531790 ) ) ( not ( = ?auto_531781 ?auto_531791 ) ) ( not ( = ?auto_531781 ?auto_531792 ) ) ( not ( = ?auto_531781 ?auto_531793 ) ) ( not ( = ?auto_531781 ?auto_531794 ) ) ( not ( = ?auto_531782 ?auto_531783 ) ) ( not ( = ?auto_531782 ?auto_531784 ) ) ( not ( = ?auto_531782 ?auto_531785 ) ) ( not ( = ?auto_531782 ?auto_531786 ) ) ( not ( = ?auto_531782 ?auto_531787 ) ) ( not ( = ?auto_531782 ?auto_531788 ) ) ( not ( = ?auto_531782 ?auto_531789 ) ) ( not ( = ?auto_531782 ?auto_531790 ) ) ( not ( = ?auto_531782 ?auto_531791 ) ) ( not ( = ?auto_531782 ?auto_531792 ) ) ( not ( = ?auto_531782 ?auto_531793 ) ) ( not ( = ?auto_531782 ?auto_531794 ) ) ( not ( = ?auto_531783 ?auto_531784 ) ) ( not ( = ?auto_531783 ?auto_531785 ) ) ( not ( = ?auto_531783 ?auto_531786 ) ) ( not ( = ?auto_531783 ?auto_531787 ) ) ( not ( = ?auto_531783 ?auto_531788 ) ) ( not ( = ?auto_531783 ?auto_531789 ) ) ( not ( = ?auto_531783 ?auto_531790 ) ) ( not ( = ?auto_531783 ?auto_531791 ) ) ( not ( = ?auto_531783 ?auto_531792 ) ) ( not ( = ?auto_531783 ?auto_531793 ) ) ( not ( = ?auto_531783 ?auto_531794 ) ) ( not ( = ?auto_531784 ?auto_531785 ) ) ( not ( = ?auto_531784 ?auto_531786 ) ) ( not ( = ?auto_531784 ?auto_531787 ) ) ( not ( = ?auto_531784 ?auto_531788 ) ) ( not ( = ?auto_531784 ?auto_531789 ) ) ( not ( = ?auto_531784 ?auto_531790 ) ) ( not ( = ?auto_531784 ?auto_531791 ) ) ( not ( = ?auto_531784 ?auto_531792 ) ) ( not ( = ?auto_531784 ?auto_531793 ) ) ( not ( = ?auto_531784 ?auto_531794 ) ) ( not ( = ?auto_531785 ?auto_531786 ) ) ( not ( = ?auto_531785 ?auto_531787 ) ) ( not ( = ?auto_531785 ?auto_531788 ) ) ( not ( = ?auto_531785 ?auto_531789 ) ) ( not ( = ?auto_531785 ?auto_531790 ) ) ( not ( = ?auto_531785 ?auto_531791 ) ) ( not ( = ?auto_531785 ?auto_531792 ) ) ( not ( = ?auto_531785 ?auto_531793 ) ) ( not ( = ?auto_531785 ?auto_531794 ) ) ( not ( = ?auto_531786 ?auto_531787 ) ) ( not ( = ?auto_531786 ?auto_531788 ) ) ( not ( = ?auto_531786 ?auto_531789 ) ) ( not ( = ?auto_531786 ?auto_531790 ) ) ( not ( = ?auto_531786 ?auto_531791 ) ) ( not ( = ?auto_531786 ?auto_531792 ) ) ( not ( = ?auto_531786 ?auto_531793 ) ) ( not ( = ?auto_531786 ?auto_531794 ) ) ( not ( = ?auto_531787 ?auto_531788 ) ) ( not ( = ?auto_531787 ?auto_531789 ) ) ( not ( = ?auto_531787 ?auto_531790 ) ) ( not ( = ?auto_531787 ?auto_531791 ) ) ( not ( = ?auto_531787 ?auto_531792 ) ) ( not ( = ?auto_531787 ?auto_531793 ) ) ( not ( = ?auto_531787 ?auto_531794 ) ) ( not ( = ?auto_531788 ?auto_531789 ) ) ( not ( = ?auto_531788 ?auto_531790 ) ) ( not ( = ?auto_531788 ?auto_531791 ) ) ( not ( = ?auto_531788 ?auto_531792 ) ) ( not ( = ?auto_531788 ?auto_531793 ) ) ( not ( = ?auto_531788 ?auto_531794 ) ) ( not ( = ?auto_531789 ?auto_531790 ) ) ( not ( = ?auto_531789 ?auto_531791 ) ) ( not ( = ?auto_531789 ?auto_531792 ) ) ( not ( = ?auto_531789 ?auto_531793 ) ) ( not ( = ?auto_531789 ?auto_531794 ) ) ( not ( = ?auto_531790 ?auto_531791 ) ) ( not ( = ?auto_531790 ?auto_531792 ) ) ( not ( = ?auto_531790 ?auto_531793 ) ) ( not ( = ?auto_531790 ?auto_531794 ) ) ( not ( = ?auto_531791 ?auto_531792 ) ) ( not ( = ?auto_531791 ?auto_531793 ) ) ( not ( = ?auto_531791 ?auto_531794 ) ) ( not ( = ?auto_531792 ?auto_531793 ) ) ( not ( = ?auto_531792 ?auto_531794 ) ) ( not ( = ?auto_531793 ?auto_531794 ) ) ( ON ?auto_531792 ?auto_531793 ) ( ON ?auto_531791 ?auto_531792 ) ( ON ?auto_531790 ?auto_531791 ) ( ON ?auto_531789 ?auto_531790 ) ( ON ?auto_531788 ?auto_531789 ) ( ON ?auto_531787 ?auto_531788 ) ( ON ?auto_531786 ?auto_531787 ) ( ON ?auto_531785 ?auto_531786 ) ( ON ?auto_531784 ?auto_531785 ) ( ON ?auto_531783 ?auto_531784 ) ( CLEAR ?auto_531781 ) ( ON ?auto_531782 ?auto_531783 ) ( CLEAR ?auto_531782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_531780 ?auto_531781 ?auto_531782 )
      ( MAKE-14PILE ?auto_531780 ?auto_531781 ?auto_531782 ?auto_531783 ?auto_531784 ?auto_531785 ?auto_531786 ?auto_531787 ?auto_531788 ?auto_531789 ?auto_531790 ?auto_531791 ?auto_531792 ?auto_531793 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531838 - BLOCK
      ?auto_531839 - BLOCK
      ?auto_531840 - BLOCK
      ?auto_531841 - BLOCK
      ?auto_531842 - BLOCK
      ?auto_531843 - BLOCK
      ?auto_531844 - BLOCK
      ?auto_531845 - BLOCK
      ?auto_531846 - BLOCK
      ?auto_531847 - BLOCK
      ?auto_531848 - BLOCK
      ?auto_531849 - BLOCK
      ?auto_531850 - BLOCK
      ?auto_531851 - BLOCK
    )
    :vars
    (
      ?auto_531852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531851 ?auto_531852 ) ( ON-TABLE ?auto_531838 ) ( not ( = ?auto_531838 ?auto_531839 ) ) ( not ( = ?auto_531838 ?auto_531840 ) ) ( not ( = ?auto_531838 ?auto_531841 ) ) ( not ( = ?auto_531838 ?auto_531842 ) ) ( not ( = ?auto_531838 ?auto_531843 ) ) ( not ( = ?auto_531838 ?auto_531844 ) ) ( not ( = ?auto_531838 ?auto_531845 ) ) ( not ( = ?auto_531838 ?auto_531846 ) ) ( not ( = ?auto_531838 ?auto_531847 ) ) ( not ( = ?auto_531838 ?auto_531848 ) ) ( not ( = ?auto_531838 ?auto_531849 ) ) ( not ( = ?auto_531838 ?auto_531850 ) ) ( not ( = ?auto_531838 ?auto_531851 ) ) ( not ( = ?auto_531838 ?auto_531852 ) ) ( not ( = ?auto_531839 ?auto_531840 ) ) ( not ( = ?auto_531839 ?auto_531841 ) ) ( not ( = ?auto_531839 ?auto_531842 ) ) ( not ( = ?auto_531839 ?auto_531843 ) ) ( not ( = ?auto_531839 ?auto_531844 ) ) ( not ( = ?auto_531839 ?auto_531845 ) ) ( not ( = ?auto_531839 ?auto_531846 ) ) ( not ( = ?auto_531839 ?auto_531847 ) ) ( not ( = ?auto_531839 ?auto_531848 ) ) ( not ( = ?auto_531839 ?auto_531849 ) ) ( not ( = ?auto_531839 ?auto_531850 ) ) ( not ( = ?auto_531839 ?auto_531851 ) ) ( not ( = ?auto_531839 ?auto_531852 ) ) ( not ( = ?auto_531840 ?auto_531841 ) ) ( not ( = ?auto_531840 ?auto_531842 ) ) ( not ( = ?auto_531840 ?auto_531843 ) ) ( not ( = ?auto_531840 ?auto_531844 ) ) ( not ( = ?auto_531840 ?auto_531845 ) ) ( not ( = ?auto_531840 ?auto_531846 ) ) ( not ( = ?auto_531840 ?auto_531847 ) ) ( not ( = ?auto_531840 ?auto_531848 ) ) ( not ( = ?auto_531840 ?auto_531849 ) ) ( not ( = ?auto_531840 ?auto_531850 ) ) ( not ( = ?auto_531840 ?auto_531851 ) ) ( not ( = ?auto_531840 ?auto_531852 ) ) ( not ( = ?auto_531841 ?auto_531842 ) ) ( not ( = ?auto_531841 ?auto_531843 ) ) ( not ( = ?auto_531841 ?auto_531844 ) ) ( not ( = ?auto_531841 ?auto_531845 ) ) ( not ( = ?auto_531841 ?auto_531846 ) ) ( not ( = ?auto_531841 ?auto_531847 ) ) ( not ( = ?auto_531841 ?auto_531848 ) ) ( not ( = ?auto_531841 ?auto_531849 ) ) ( not ( = ?auto_531841 ?auto_531850 ) ) ( not ( = ?auto_531841 ?auto_531851 ) ) ( not ( = ?auto_531841 ?auto_531852 ) ) ( not ( = ?auto_531842 ?auto_531843 ) ) ( not ( = ?auto_531842 ?auto_531844 ) ) ( not ( = ?auto_531842 ?auto_531845 ) ) ( not ( = ?auto_531842 ?auto_531846 ) ) ( not ( = ?auto_531842 ?auto_531847 ) ) ( not ( = ?auto_531842 ?auto_531848 ) ) ( not ( = ?auto_531842 ?auto_531849 ) ) ( not ( = ?auto_531842 ?auto_531850 ) ) ( not ( = ?auto_531842 ?auto_531851 ) ) ( not ( = ?auto_531842 ?auto_531852 ) ) ( not ( = ?auto_531843 ?auto_531844 ) ) ( not ( = ?auto_531843 ?auto_531845 ) ) ( not ( = ?auto_531843 ?auto_531846 ) ) ( not ( = ?auto_531843 ?auto_531847 ) ) ( not ( = ?auto_531843 ?auto_531848 ) ) ( not ( = ?auto_531843 ?auto_531849 ) ) ( not ( = ?auto_531843 ?auto_531850 ) ) ( not ( = ?auto_531843 ?auto_531851 ) ) ( not ( = ?auto_531843 ?auto_531852 ) ) ( not ( = ?auto_531844 ?auto_531845 ) ) ( not ( = ?auto_531844 ?auto_531846 ) ) ( not ( = ?auto_531844 ?auto_531847 ) ) ( not ( = ?auto_531844 ?auto_531848 ) ) ( not ( = ?auto_531844 ?auto_531849 ) ) ( not ( = ?auto_531844 ?auto_531850 ) ) ( not ( = ?auto_531844 ?auto_531851 ) ) ( not ( = ?auto_531844 ?auto_531852 ) ) ( not ( = ?auto_531845 ?auto_531846 ) ) ( not ( = ?auto_531845 ?auto_531847 ) ) ( not ( = ?auto_531845 ?auto_531848 ) ) ( not ( = ?auto_531845 ?auto_531849 ) ) ( not ( = ?auto_531845 ?auto_531850 ) ) ( not ( = ?auto_531845 ?auto_531851 ) ) ( not ( = ?auto_531845 ?auto_531852 ) ) ( not ( = ?auto_531846 ?auto_531847 ) ) ( not ( = ?auto_531846 ?auto_531848 ) ) ( not ( = ?auto_531846 ?auto_531849 ) ) ( not ( = ?auto_531846 ?auto_531850 ) ) ( not ( = ?auto_531846 ?auto_531851 ) ) ( not ( = ?auto_531846 ?auto_531852 ) ) ( not ( = ?auto_531847 ?auto_531848 ) ) ( not ( = ?auto_531847 ?auto_531849 ) ) ( not ( = ?auto_531847 ?auto_531850 ) ) ( not ( = ?auto_531847 ?auto_531851 ) ) ( not ( = ?auto_531847 ?auto_531852 ) ) ( not ( = ?auto_531848 ?auto_531849 ) ) ( not ( = ?auto_531848 ?auto_531850 ) ) ( not ( = ?auto_531848 ?auto_531851 ) ) ( not ( = ?auto_531848 ?auto_531852 ) ) ( not ( = ?auto_531849 ?auto_531850 ) ) ( not ( = ?auto_531849 ?auto_531851 ) ) ( not ( = ?auto_531849 ?auto_531852 ) ) ( not ( = ?auto_531850 ?auto_531851 ) ) ( not ( = ?auto_531850 ?auto_531852 ) ) ( not ( = ?auto_531851 ?auto_531852 ) ) ( ON ?auto_531850 ?auto_531851 ) ( ON ?auto_531849 ?auto_531850 ) ( ON ?auto_531848 ?auto_531849 ) ( ON ?auto_531847 ?auto_531848 ) ( ON ?auto_531846 ?auto_531847 ) ( ON ?auto_531845 ?auto_531846 ) ( ON ?auto_531844 ?auto_531845 ) ( ON ?auto_531843 ?auto_531844 ) ( ON ?auto_531842 ?auto_531843 ) ( ON ?auto_531841 ?auto_531842 ) ( ON ?auto_531840 ?auto_531841 ) ( CLEAR ?auto_531838 ) ( ON ?auto_531839 ?auto_531840 ) ( CLEAR ?auto_531839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_531838 ?auto_531839 )
      ( MAKE-14PILE ?auto_531838 ?auto_531839 ?auto_531840 ?auto_531841 ?auto_531842 ?auto_531843 ?auto_531844 ?auto_531845 ?auto_531846 ?auto_531847 ?auto_531848 ?auto_531849 ?auto_531850 ?auto_531851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_531896 - BLOCK
      ?auto_531897 - BLOCK
      ?auto_531898 - BLOCK
      ?auto_531899 - BLOCK
      ?auto_531900 - BLOCK
      ?auto_531901 - BLOCK
      ?auto_531902 - BLOCK
      ?auto_531903 - BLOCK
      ?auto_531904 - BLOCK
      ?auto_531905 - BLOCK
      ?auto_531906 - BLOCK
      ?auto_531907 - BLOCK
      ?auto_531908 - BLOCK
      ?auto_531909 - BLOCK
    )
    :vars
    (
      ?auto_531910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_531909 ?auto_531910 ) ( not ( = ?auto_531896 ?auto_531897 ) ) ( not ( = ?auto_531896 ?auto_531898 ) ) ( not ( = ?auto_531896 ?auto_531899 ) ) ( not ( = ?auto_531896 ?auto_531900 ) ) ( not ( = ?auto_531896 ?auto_531901 ) ) ( not ( = ?auto_531896 ?auto_531902 ) ) ( not ( = ?auto_531896 ?auto_531903 ) ) ( not ( = ?auto_531896 ?auto_531904 ) ) ( not ( = ?auto_531896 ?auto_531905 ) ) ( not ( = ?auto_531896 ?auto_531906 ) ) ( not ( = ?auto_531896 ?auto_531907 ) ) ( not ( = ?auto_531896 ?auto_531908 ) ) ( not ( = ?auto_531896 ?auto_531909 ) ) ( not ( = ?auto_531896 ?auto_531910 ) ) ( not ( = ?auto_531897 ?auto_531898 ) ) ( not ( = ?auto_531897 ?auto_531899 ) ) ( not ( = ?auto_531897 ?auto_531900 ) ) ( not ( = ?auto_531897 ?auto_531901 ) ) ( not ( = ?auto_531897 ?auto_531902 ) ) ( not ( = ?auto_531897 ?auto_531903 ) ) ( not ( = ?auto_531897 ?auto_531904 ) ) ( not ( = ?auto_531897 ?auto_531905 ) ) ( not ( = ?auto_531897 ?auto_531906 ) ) ( not ( = ?auto_531897 ?auto_531907 ) ) ( not ( = ?auto_531897 ?auto_531908 ) ) ( not ( = ?auto_531897 ?auto_531909 ) ) ( not ( = ?auto_531897 ?auto_531910 ) ) ( not ( = ?auto_531898 ?auto_531899 ) ) ( not ( = ?auto_531898 ?auto_531900 ) ) ( not ( = ?auto_531898 ?auto_531901 ) ) ( not ( = ?auto_531898 ?auto_531902 ) ) ( not ( = ?auto_531898 ?auto_531903 ) ) ( not ( = ?auto_531898 ?auto_531904 ) ) ( not ( = ?auto_531898 ?auto_531905 ) ) ( not ( = ?auto_531898 ?auto_531906 ) ) ( not ( = ?auto_531898 ?auto_531907 ) ) ( not ( = ?auto_531898 ?auto_531908 ) ) ( not ( = ?auto_531898 ?auto_531909 ) ) ( not ( = ?auto_531898 ?auto_531910 ) ) ( not ( = ?auto_531899 ?auto_531900 ) ) ( not ( = ?auto_531899 ?auto_531901 ) ) ( not ( = ?auto_531899 ?auto_531902 ) ) ( not ( = ?auto_531899 ?auto_531903 ) ) ( not ( = ?auto_531899 ?auto_531904 ) ) ( not ( = ?auto_531899 ?auto_531905 ) ) ( not ( = ?auto_531899 ?auto_531906 ) ) ( not ( = ?auto_531899 ?auto_531907 ) ) ( not ( = ?auto_531899 ?auto_531908 ) ) ( not ( = ?auto_531899 ?auto_531909 ) ) ( not ( = ?auto_531899 ?auto_531910 ) ) ( not ( = ?auto_531900 ?auto_531901 ) ) ( not ( = ?auto_531900 ?auto_531902 ) ) ( not ( = ?auto_531900 ?auto_531903 ) ) ( not ( = ?auto_531900 ?auto_531904 ) ) ( not ( = ?auto_531900 ?auto_531905 ) ) ( not ( = ?auto_531900 ?auto_531906 ) ) ( not ( = ?auto_531900 ?auto_531907 ) ) ( not ( = ?auto_531900 ?auto_531908 ) ) ( not ( = ?auto_531900 ?auto_531909 ) ) ( not ( = ?auto_531900 ?auto_531910 ) ) ( not ( = ?auto_531901 ?auto_531902 ) ) ( not ( = ?auto_531901 ?auto_531903 ) ) ( not ( = ?auto_531901 ?auto_531904 ) ) ( not ( = ?auto_531901 ?auto_531905 ) ) ( not ( = ?auto_531901 ?auto_531906 ) ) ( not ( = ?auto_531901 ?auto_531907 ) ) ( not ( = ?auto_531901 ?auto_531908 ) ) ( not ( = ?auto_531901 ?auto_531909 ) ) ( not ( = ?auto_531901 ?auto_531910 ) ) ( not ( = ?auto_531902 ?auto_531903 ) ) ( not ( = ?auto_531902 ?auto_531904 ) ) ( not ( = ?auto_531902 ?auto_531905 ) ) ( not ( = ?auto_531902 ?auto_531906 ) ) ( not ( = ?auto_531902 ?auto_531907 ) ) ( not ( = ?auto_531902 ?auto_531908 ) ) ( not ( = ?auto_531902 ?auto_531909 ) ) ( not ( = ?auto_531902 ?auto_531910 ) ) ( not ( = ?auto_531903 ?auto_531904 ) ) ( not ( = ?auto_531903 ?auto_531905 ) ) ( not ( = ?auto_531903 ?auto_531906 ) ) ( not ( = ?auto_531903 ?auto_531907 ) ) ( not ( = ?auto_531903 ?auto_531908 ) ) ( not ( = ?auto_531903 ?auto_531909 ) ) ( not ( = ?auto_531903 ?auto_531910 ) ) ( not ( = ?auto_531904 ?auto_531905 ) ) ( not ( = ?auto_531904 ?auto_531906 ) ) ( not ( = ?auto_531904 ?auto_531907 ) ) ( not ( = ?auto_531904 ?auto_531908 ) ) ( not ( = ?auto_531904 ?auto_531909 ) ) ( not ( = ?auto_531904 ?auto_531910 ) ) ( not ( = ?auto_531905 ?auto_531906 ) ) ( not ( = ?auto_531905 ?auto_531907 ) ) ( not ( = ?auto_531905 ?auto_531908 ) ) ( not ( = ?auto_531905 ?auto_531909 ) ) ( not ( = ?auto_531905 ?auto_531910 ) ) ( not ( = ?auto_531906 ?auto_531907 ) ) ( not ( = ?auto_531906 ?auto_531908 ) ) ( not ( = ?auto_531906 ?auto_531909 ) ) ( not ( = ?auto_531906 ?auto_531910 ) ) ( not ( = ?auto_531907 ?auto_531908 ) ) ( not ( = ?auto_531907 ?auto_531909 ) ) ( not ( = ?auto_531907 ?auto_531910 ) ) ( not ( = ?auto_531908 ?auto_531909 ) ) ( not ( = ?auto_531908 ?auto_531910 ) ) ( not ( = ?auto_531909 ?auto_531910 ) ) ( ON ?auto_531908 ?auto_531909 ) ( ON ?auto_531907 ?auto_531908 ) ( ON ?auto_531906 ?auto_531907 ) ( ON ?auto_531905 ?auto_531906 ) ( ON ?auto_531904 ?auto_531905 ) ( ON ?auto_531903 ?auto_531904 ) ( ON ?auto_531902 ?auto_531903 ) ( ON ?auto_531901 ?auto_531902 ) ( ON ?auto_531900 ?auto_531901 ) ( ON ?auto_531899 ?auto_531900 ) ( ON ?auto_531898 ?auto_531899 ) ( ON ?auto_531897 ?auto_531898 ) ( ON ?auto_531896 ?auto_531897 ) ( CLEAR ?auto_531896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_531896 )
      ( MAKE-14PILE ?auto_531896 ?auto_531897 ?auto_531898 ?auto_531899 ?auto_531900 ?auto_531901 ?auto_531902 ?auto_531903 ?auto_531904 ?auto_531905 ?auto_531906 ?auto_531907 ?auto_531908 ?auto_531909 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_531955 - BLOCK
      ?auto_531956 - BLOCK
      ?auto_531957 - BLOCK
      ?auto_531958 - BLOCK
      ?auto_531959 - BLOCK
      ?auto_531960 - BLOCK
      ?auto_531961 - BLOCK
      ?auto_531962 - BLOCK
      ?auto_531963 - BLOCK
      ?auto_531964 - BLOCK
      ?auto_531965 - BLOCK
      ?auto_531966 - BLOCK
      ?auto_531967 - BLOCK
      ?auto_531968 - BLOCK
      ?auto_531969 - BLOCK
    )
    :vars
    (
      ?auto_531970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_531968 ) ( ON ?auto_531969 ?auto_531970 ) ( CLEAR ?auto_531969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_531955 ) ( ON ?auto_531956 ?auto_531955 ) ( ON ?auto_531957 ?auto_531956 ) ( ON ?auto_531958 ?auto_531957 ) ( ON ?auto_531959 ?auto_531958 ) ( ON ?auto_531960 ?auto_531959 ) ( ON ?auto_531961 ?auto_531960 ) ( ON ?auto_531962 ?auto_531961 ) ( ON ?auto_531963 ?auto_531962 ) ( ON ?auto_531964 ?auto_531963 ) ( ON ?auto_531965 ?auto_531964 ) ( ON ?auto_531966 ?auto_531965 ) ( ON ?auto_531967 ?auto_531966 ) ( ON ?auto_531968 ?auto_531967 ) ( not ( = ?auto_531955 ?auto_531956 ) ) ( not ( = ?auto_531955 ?auto_531957 ) ) ( not ( = ?auto_531955 ?auto_531958 ) ) ( not ( = ?auto_531955 ?auto_531959 ) ) ( not ( = ?auto_531955 ?auto_531960 ) ) ( not ( = ?auto_531955 ?auto_531961 ) ) ( not ( = ?auto_531955 ?auto_531962 ) ) ( not ( = ?auto_531955 ?auto_531963 ) ) ( not ( = ?auto_531955 ?auto_531964 ) ) ( not ( = ?auto_531955 ?auto_531965 ) ) ( not ( = ?auto_531955 ?auto_531966 ) ) ( not ( = ?auto_531955 ?auto_531967 ) ) ( not ( = ?auto_531955 ?auto_531968 ) ) ( not ( = ?auto_531955 ?auto_531969 ) ) ( not ( = ?auto_531955 ?auto_531970 ) ) ( not ( = ?auto_531956 ?auto_531957 ) ) ( not ( = ?auto_531956 ?auto_531958 ) ) ( not ( = ?auto_531956 ?auto_531959 ) ) ( not ( = ?auto_531956 ?auto_531960 ) ) ( not ( = ?auto_531956 ?auto_531961 ) ) ( not ( = ?auto_531956 ?auto_531962 ) ) ( not ( = ?auto_531956 ?auto_531963 ) ) ( not ( = ?auto_531956 ?auto_531964 ) ) ( not ( = ?auto_531956 ?auto_531965 ) ) ( not ( = ?auto_531956 ?auto_531966 ) ) ( not ( = ?auto_531956 ?auto_531967 ) ) ( not ( = ?auto_531956 ?auto_531968 ) ) ( not ( = ?auto_531956 ?auto_531969 ) ) ( not ( = ?auto_531956 ?auto_531970 ) ) ( not ( = ?auto_531957 ?auto_531958 ) ) ( not ( = ?auto_531957 ?auto_531959 ) ) ( not ( = ?auto_531957 ?auto_531960 ) ) ( not ( = ?auto_531957 ?auto_531961 ) ) ( not ( = ?auto_531957 ?auto_531962 ) ) ( not ( = ?auto_531957 ?auto_531963 ) ) ( not ( = ?auto_531957 ?auto_531964 ) ) ( not ( = ?auto_531957 ?auto_531965 ) ) ( not ( = ?auto_531957 ?auto_531966 ) ) ( not ( = ?auto_531957 ?auto_531967 ) ) ( not ( = ?auto_531957 ?auto_531968 ) ) ( not ( = ?auto_531957 ?auto_531969 ) ) ( not ( = ?auto_531957 ?auto_531970 ) ) ( not ( = ?auto_531958 ?auto_531959 ) ) ( not ( = ?auto_531958 ?auto_531960 ) ) ( not ( = ?auto_531958 ?auto_531961 ) ) ( not ( = ?auto_531958 ?auto_531962 ) ) ( not ( = ?auto_531958 ?auto_531963 ) ) ( not ( = ?auto_531958 ?auto_531964 ) ) ( not ( = ?auto_531958 ?auto_531965 ) ) ( not ( = ?auto_531958 ?auto_531966 ) ) ( not ( = ?auto_531958 ?auto_531967 ) ) ( not ( = ?auto_531958 ?auto_531968 ) ) ( not ( = ?auto_531958 ?auto_531969 ) ) ( not ( = ?auto_531958 ?auto_531970 ) ) ( not ( = ?auto_531959 ?auto_531960 ) ) ( not ( = ?auto_531959 ?auto_531961 ) ) ( not ( = ?auto_531959 ?auto_531962 ) ) ( not ( = ?auto_531959 ?auto_531963 ) ) ( not ( = ?auto_531959 ?auto_531964 ) ) ( not ( = ?auto_531959 ?auto_531965 ) ) ( not ( = ?auto_531959 ?auto_531966 ) ) ( not ( = ?auto_531959 ?auto_531967 ) ) ( not ( = ?auto_531959 ?auto_531968 ) ) ( not ( = ?auto_531959 ?auto_531969 ) ) ( not ( = ?auto_531959 ?auto_531970 ) ) ( not ( = ?auto_531960 ?auto_531961 ) ) ( not ( = ?auto_531960 ?auto_531962 ) ) ( not ( = ?auto_531960 ?auto_531963 ) ) ( not ( = ?auto_531960 ?auto_531964 ) ) ( not ( = ?auto_531960 ?auto_531965 ) ) ( not ( = ?auto_531960 ?auto_531966 ) ) ( not ( = ?auto_531960 ?auto_531967 ) ) ( not ( = ?auto_531960 ?auto_531968 ) ) ( not ( = ?auto_531960 ?auto_531969 ) ) ( not ( = ?auto_531960 ?auto_531970 ) ) ( not ( = ?auto_531961 ?auto_531962 ) ) ( not ( = ?auto_531961 ?auto_531963 ) ) ( not ( = ?auto_531961 ?auto_531964 ) ) ( not ( = ?auto_531961 ?auto_531965 ) ) ( not ( = ?auto_531961 ?auto_531966 ) ) ( not ( = ?auto_531961 ?auto_531967 ) ) ( not ( = ?auto_531961 ?auto_531968 ) ) ( not ( = ?auto_531961 ?auto_531969 ) ) ( not ( = ?auto_531961 ?auto_531970 ) ) ( not ( = ?auto_531962 ?auto_531963 ) ) ( not ( = ?auto_531962 ?auto_531964 ) ) ( not ( = ?auto_531962 ?auto_531965 ) ) ( not ( = ?auto_531962 ?auto_531966 ) ) ( not ( = ?auto_531962 ?auto_531967 ) ) ( not ( = ?auto_531962 ?auto_531968 ) ) ( not ( = ?auto_531962 ?auto_531969 ) ) ( not ( = ?auto_531962 ?auto_531970 ) ) ( not ( = ?auto_531963 ?auto_531964 ) ) ( not ( = ?auto_531963 ?auto_531965 ) ) ( not ( = ?auto_531963 ?auto_531966 ) ) ( not ( = ?auto_531963 ?auto_531967 ) ) ( not ( = ?auto_531963 ?auto_531968 ) ) ( not ( = ?auto_531963 ?auto_531969 ) ) ( not ( = ?auto_531963 ?auto_531970 ) ) ( not ( = ?auto_531964 ?auto_531965 ) ) ( not ( = ?auto_531964 ?auto_531966 ) ) ( not ( = ?auto_531964 ?auto_531967 ) ) ( not ( = ?auto_531964 ?auto_531968 ) ) ( not ( = ?auto_531964 ?auto_531969 ) ) ( not ( = ?auto_531964 ?auto_531970 ) ) ( not ( = ?auto_531965 ?auto_531966 ) ) ( not ( = ?auto_531965 ?auto_531967 ) ) ( not ( = ?auto_531965 ?auto_531968 ) ) ( not ( = ?auto_531965 ?auto_531969 ) ) ( not ( = ?auto_531965 ?auto_531970 ) ) ( not ( = ?auto_531966 ?auto_531967 ) ) ( not ( = ?auto_531966 ?auto_531968 ) ) ( not ( = ?auto_531966 ?auto_531969 ) ) ( not ( = ?auto_531966 ?auto_531970 ) ) ( not ( = ?auto_531967 ?auto_531968 ) ) ( not ( = ?auto_531967 ?auto_531969 ) ) ( not ( = ?auto_531967 ?auto_531970 ) ) ( not ( = ?auto_531968 ?auto_531969 ) ) ( not ( = ?auto_531968 ?auto_531970 ) ) ( not ( = ?auto_531969 ?auto_531970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_531969 ?auto_531970 )
      ( !STACK ?auto_531969 ?auto_531968 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532017 - BLOCK
      ?auto_532018 - BLOCK
      ?auto_532019 - BLOCK
      ?auto_532020 - BLOCK
      ?auto_532021 - BLOCK
      ?auto_532022 - BLOCK
      ?auto_532023 - BLOCK
      ?auto_532024 - BLOCK
      ?auto_532025 - BLOCK
      ?auto_532026 - BLOCK
      ?auto_532027 - BLOCK
      ?auto_532028 - BLOCK
      ?auto_532029 - BLOCK
      ?auto_532030 - BLOCK
      ?auto_532031 - BLOCK
    )
    :vars
    (
      ?auto_532032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532031 ?auto_532032 ) ( ON-TABLE ?auto_532017 ) ( ON ?auto_532018 ?auto_532017 ) ( ON ?auto_532019 ?auto_532018 ) ( ON ?auto_532020 ?auto_532019 ) ( ON ?auto_532021 ?auto_532020 ) ( ON ?auto_532022 ?auto_532021 ) ( ON ?auto_532023 ?auto_532022 ) ( ON ?auto_532024 ?auto_532023 ) ( ON ?auto_532025 ?auto_532024 ) ( ON ?auto_532026 ?auto_532025 ) ( ON ?auto_532027 ?auto_532026 ) ( ON ?auto_532028 ?auto_532027 ) ( ON ?auto_532029 ?auto_532028 ) ( not ( = ?auto_532017 ?auto_532018 ) ) ( not ( = ?auto_532017 ?auto_532019 ) ) ( not ( = ?auto_532017 ?auto_532020 ) ) ( not ( = ?auto_532017 ?auto_532021 ) ) ( not ( = ?auto_532017 ?auto_532022 ) ) ( not ( = ?auto_532017 ?auto_532023 ) ) ( not ( = ?auto_532017 ?auto_532024 ) ) ( not ( = ?auto_532017 ?auto_532025 ) ) ( not ( = ?auto_532017 ?auto_532026 ) ) ( not ( = ?auto_532017 ?auto_532027 ) ) ( not ( = ?auto_532017 ?auto_532028 ) ) ( not ( = ?auto_532017 ?auto_532029 ) ) ( not ( = ?auto_532017 ?auto_532030 ) ) ( not ( = ?auto_532017 ?auto_532031 ) ) ( not ( = ?auto_532017 ?auto_532032 ) ) ( not ( = ?auto_532018 ?auto_532019 ) ) ( not ( = ?auto_532018 ?auto_532020 ) ) ( not ( = ?auto_532018 ?auto_532021 ) ) ( not ( = ?auto_532018 ?auto_532022 ) ) ( not ( = ?auto_532018 ?auto_532023 ) ) ( not ( = ?auto_532018 ?auto_532024 ) ) ( not ( = ?auto_532018 ?auto_532025 ) ) ( not ( = ?auto_532018 ?auto_532026 ) ) ( not ( = ?auto_532018 ?auto_532027 ) ) ( not ( = ?auto_532018 ?auto_532028 ) ) ( not ( = ?auto_532018 ?auto_532029 ) ) ( not ( = ?auto_532018 ?auto_532030 ) ) ( not ( = ?auto_532018 ?auto_532031 ) ) ( not ( = ?auto_532018 ?auto_532032 ) ) ( not ( = ?auto_532019 ?auto_532020 ) ) ( not ( = ?auto_532019 ?auto_532021 ) ) ( not ( = ?auto_532019 ?auto_532022 ) ) ( not ( = ?auto_532019 ?auto_532023 ) ) ( not ( = ?auto_532019 ?auto_532024 ) ) ( not ( = ?auto_532019 ?auto_532025 ) ) ( not ( = ?auto_532019 ?auto_532026 ) ) ( not ( = ?auto_532019 ?auto_532027 ) ) ( not ( = ?auto_532019 ?auto_532028 ) ) ( not ( = ?auto_532019 ?auto_532029 ) ) ( not ( = ?auto_532019 ?auto_532030 ) ) ( not ( = ?auto_532019 ?auto_532031 ) ) ( not ( = ?auto_532019 ?auto_532032 ) ) ( not ( = ?auto_532020 ?auto_532021 ) ) ( not ( = ?auto_532020 ?auto_532022 ) ) ( not ( = ?auto_532020 ?auto_532023 ) ) ( not ( = ?auto_532020 ?auto_532024 ) ) ( not ( = ?auto_532020 ?auto_532025 ) ) ( not ( = ?auto_532020 ?auto_532026 ) ) ( not ( = ?auto_532020 ?auto_532027 ) ) ( not ( = ?auto_532020 ?auto_532028 ) ) ( not ( = ?auto_532020 ?auto_532029 ) ) ( not ( = ?auto_532020 ?auto_532030 ) ) ( not ( = ?auto_532020 ?auto_532031 ) ) ( not ( = ?auto_532020 ?auto_532032 ) ) ( not ( = ?auto_532021 ?auto_532022 ) ) ( not ( = ?auto_532021 ?auto_532023 ) ) ( not ( = ?auto_532021 ?auto_532024 ) ) ( not ( = ?auto_532021 ?auto_532025 ) ) ( not ( = ?auto_532021 ?auto_532026 ) ) ( not ( = ?auto_532021 ?auto_532027 ) ) ( not ( = ?auto_532021 ?auto_532028 ) ) ( not ( = ?auto_532021 ?auto_532029 ) ) ( not ( = ?auto_532021 ?auto_532030 ) ) ( not ( = ?auto_532021 ?auto_532031 ) ) ( not ( = ?auto_532021 ?auto_532032 ) ) ( not ( = ?auto_532022 ?auto_532023 ) ) ( not ( = ?auto_532022 ?auto_532024 ) ) ( not ( = ?auto_532022 ?auto_532025 ) ) ( not ( = ?auto_532022 ?auto_532026 ) ) ( not ( = ?auto_532022 ?auto_532027 ) ) ( not ( = ?auto_532022 ?auto_532028 ) ) ( not ( = ?auto_532022 ?auto_532029 ) ) ( not ( = ?auto_532022 ?auto_532030 ) ) ( not ( = ?auto_532022 ?auto_532031 ) ) ( not ( = ?auto_532022 ?auto_532032 ) ) ( not ( = ?auto_532023 ?auto_532024 ) ) ( not ( = ?auto_532023 ?auto_532025 ) ) ( not ( = ?auto_532023 ?auto_532026 ) ) ( not ( = ?auto_532023 ?auto_532027 ) ) ( not ( = ?auto_532023 ?auto_532028 ) ) ( not ( = ?auto_532023 ?auto_532029 ) ) ( not ( = ?auto_532023 ?auto_532030 ) ) ( not ( = ?auto_532023 ?auto_532031 ) ) ( not ( = ?auto_532023 ?auto_532032 ) ) ( not ( = ?auto_532024 ?auto_532025 ) ) ( not ( = ?auto_532024 ?auto_532026 ) ) ( not ( = ?auto_532024 ?auto_532027 ) ) ( not ( = ?auto_532024 ?auto_532028 ) ) ( not ( = ?auto_532024 ?auto_532029 ) ) ( not ( = ?auto_532024 ?auto_532030 ) ) ( not ( = ?auto_532024 ?auto_532031 ) ) ( not ( = ?auto_532024 ?auto_532032 ) ) ( not ( = ?auto_532025 ?auto_532026 ) ) ( not ( = ?auto_532025 ?auto_532027 ) ) ( not ( = ?auto_532025 ?auto_532028 ) ) ( not ( = ?auto_532025 ?auto_532029 ) ) ( not ( = ?auto_532025 ?auto_532030 ) ) ( not ( = ?auto_532025 ?auto_532031 ) ) ( not ( = ?auto_532025 ?auto_532032 ) ) ( not ( = ?auto_532026 ?auto_532027 ) ) ( not ( = ?auto_532026 ?auto_532028 ) ) ( not ( = ?auto_532026 ?auto_532029 ) ) ( not ( = ?auto_532026 ?auto_532030 ) ) ( not ( = ?auto_532026 ?auto_532031 ) ) ( not ( = ?auto_532026 ?auto_532032 ) ) ( not ( = ?auto_532027 ?auto_532028 ) ) ( not ( = ?auto_532027 ?auto_532029 ) ) ( not ( = ?auto_532027 ?auto_532030 ) ) ( not ( = ?auto_532027 ?auto_532031 ) ) ( not ( = ?auto_532027 ?auto_532032 ) ) ( not ( = ?auto_532028 ?auto_532029 ) ) ( not ( = ?auto_532028 ?auto_532030 ) ) ( not ( = ?auto_532028 ?auto_532031 ) ) ( not ( = ?auto_532028 ?auto_532032 ) ) ( not ( = ?auto_532029 ?auto_532030 ) ) ( not ( = ?auto_532029 ?auto_532031 ) ) ( not ( = ?auto_532029 ?auto_532032 ) ) ( not ( = ?auto_532030 ?auto_532031 ) ) ( not ( = ?auto_532030 ?auto_532032 ) ) ( not ( = ?auto_532031 ?auto_532032 ) ) ( CLEAR ?auto_532029 ) ( ON ?auto_532030 ?auto_532031 ) ( CLEAR ?auto_532030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_532017 ?auto_532018 ?auto_532019 ?auto_532020 ?auto_532021 ?auto_532022 ?auto_532023 ?auto_532024 ?auto_532025 ?auto_532026 ?auto_532027 ?auto_532028 ?auto_532029 ?auto_532030 )
      ( MAKE-15PILE ?auto_532017 ?auto_532018 ?auto_532019 ?auto_532020 ?auto_532021 ?auto_532022 ?auto_532023 ?auto_532024 ?auto_532025 ?auto_532026 ?auto_532027 ?auto_532028 ?auto_532029 ?auto_532030 ?auto_532031 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532079 - BLOCK
      ?auto_532080 - BLOCK
      ?auto_532081 - BLOCK
      ?auto_532082 - BLOCK
      ?auto_532083 - BLOCK
      ?auto_532084 - BLOCK
      ?auto_532085 - BLOCK
      ?auto_532086 - BLOCK
      ?auto_532087 - BLOCK
      ?auto_532088 - BLOCK
      ?auto_532089 - BLOCK
      ?auto_532090 - BLOCK
      ?auto_532091 - BLOCK
      ?auto_532092 - BLOCK
      ?auto_532093 - BLOCK
    )
    :vars
    (
      ?auto_532094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532093 ?auto_532094 ) ( ON-TABLE ?auto_532079 ) ( ON ?auto_532080 ?auto_532079 ) ( ON ?auto_532081 ?auto_532080 ) ( ON ?auto_532082 ?auto_532081 ) ( ON ?auto_532083 ?auto_532082 ) ( ON ?auto_532084 ?auto_532083 ) ( ON ?auto_532085 ?auto_532084 ) ( ON ?auto_532086 ?auto_532085 ) ( ON ?auto_532087 ?auto_532086 ) ( ON ?auto_532088 ?auto_532087 ) ( ON ?auto_532089 ?auto_532088 ) ( ON ?auto_532090 ?auto_532089 ) ( not ( = ?auto_532079 ?auto_532080 ) ) ( not ( = ?auto_532079 ?auto_532081 ) ) ( not ( = ?auto_532079 ?auto_532082 ) ) ( not ( = ?auto_532079 ?auto_532083 ) ) ( not ( = ?auto_532079 ?auto_532084 ) ) ( not ( = ?auto_532079 ?auto_532085 ) ) ( not ( = ?auto_532079 ?auto_532086 ) ) ( not ( = ?auto_532079 ?auto_532087 ) ) ( not ( = ?auto_532079 ?auto_532088 ) ) ( not ( = ?auto_532079 ?auto_532089 ) ) ( not ( = ?auto_532079 ?auto_532090 ) ) ( not ( = ?auto_532079 ?auto_532091 ) ) ( not ( = ?auto_532079 ?auto_532092 ) ) ( not ( = ?auto_532079 ?auto_532093 ) ) ( not ( = ?auto_532079 ?auto_532094 ) ) ( not ( = ?auto_532080 ?auto_532081 ) ) ( not ( = ?auto_532080 ?auto_532082 ) ) ( not ( = ?auto_532080 ?auto_532083 ) ) ( not ( = ?auto_532080 ?auto_532084 ) ) ( not ( = ?auto_532080 ?auto_532085 ) ) ( not ( = ?auto_532080 ?auto_532086 ) ) ( not ( = ?auto_532080 ?auto_532087 ) ) ( not ( = ?auto_532080 ?auto_532088 ) ) ( not ( = ?auto_532080 ?auto_532089 ) ) ( not ( = ?auto_532080 ?auto_532090 ) ) ( not ( = ?auto_532080 ?auto_532091 ) ) ( not ( = ?auto_532080 ?auto_532092 ) ) ( not ( = ?auto_532080 ?auto_532093 ) ) ( not ( = ?auto_532080 ?auto_532094 ) ) ( not ( = ?auto_532081 ?auto_532082 ) ) ( not ( = ?auto_532081 ?auto_532083 ) ) ( not ( = ?auto_532081 ?auto_532084 ) ) ( not ( = ?auto_532081 ?auto_532085 ) ) ( not ( = ?auto_532081 ?auto_532086 ) ) ( not ( = ?auto_532081 ?auto_532087 ) ) ( not ( = ?auto_532081 ?auto_532088 ) ) ( not ( = ?auto_532081 ?auto_532089 ) ) ( not ( = ?auto_532081 ?auto_532090 ) ) ( not ( = ?auto_532081 ?auto_532091 ) ) ( not ( = ?auto_532081 ?auto_532092 ) ) ( not ( = ?auto_532081 ?auto_532093 ) ) ( not ( = ?auto_532081 ?auto_532094 ) ) ( not ( = ?auto_532082 ?auto_532083 ) ) ( not ( = ?auto_532082 ?auto_532084 ) ) ( not ( = ?auto_532082 ?auto_532085 ) ) ( not ( = ?auto_532082 ?auto_532086 ) ) ( not ( = ?auto_532082 ?auto_532087 ) ) ( not ( = ?auto_532082 ?auto_532088 ) ) ( not ( = ?auto_532082 ?auto_532089 ) ) ( not ( = ?auto_532082 ?auto_532090 ) ) ( not ( = ?auto_532082 ?auto_532091 ) ) ( not ( = ?auto_532082 ?auto_532092 ) ) ( not ( = ?auto_532082 ?auto_532093 ) ) ( not ( = ?auto_532082 ?auto_532094 ) ) ( not ( = ?auto_532083 ?auto_532084 ) ) ( not ( = ?auto_532083 ?auto_532085 ) ) ( not ( = ?auto_532083 ?auto_532086 ) ) ( not ( = ?auto_532083 ?auto_532087 ) ) ( not ( = ?auto_532083 ?auto_532088 ) ) ( not ( = ?auto_532083 ?auto_532089 ) ) ( not ( = ?auto_532083 ?auto_532090 ) ) ( not ( = ?auto_532083 ?auto_532091 ) ) ( not ( = ?auto_532083 ?auto_532092 ) ) ( not ( = ?auto_532083 ?auto_532093 ) ) ( not ( = ?auto_532083 ?auto_532094 ) ) ( not ( = ?auto_532084 ?auto_532085 ) ) ( not ( = ?auto_532084 ?auto_532086 ) ) ( not ( = ?auto_532084 ?auto_532087 ) ) ( not ( = ?auto_532084 ?auto_532088 ) ) ( not ( = ?auto_532084 ?auto_532089 ) ) ( not ( = ?auto_532084 ?auto_532090 ) ) ( not ( = ?auto_532084 ?auto_532091 ) ) ( not ( = ?auto_532084 ?auto_532092 ) ) ( not ( = ?auto_532084 ?auto_532093 ) ) ( not ( = ?auto_532084 ?auto_532094 ) ) ( not ( = ?auto_532085 ?auto_532086 ) ) ( not ( = ?auto_532085 ?auto_532087 ) ) ( not ( = ?auto_532085 ?auto_532088 ) ) ( not ( = ?auto_532085 ?auto_532089 ) ) ( not ( = ?auto_532085 ?auto_532090 ) ) ( not ( = ?auto_532085 ?auto_532091 ) ) ( not ( = ?auto_532085 ?auto_532092 ) ) ( not ( = ?auto_532085 ?auto_532093 ) ) ( not ( = ?auto_532085 ?auto_532094 ) ) ( not ( = ?auto_532086 ?auto_532087 ) ) ( not ( = ?auto_532086 ?auto_532088 ) ) ( not ( = ?auto_532086 ?auto_532089 ) ) ( not ( = ?auto_532086 ?auto_532090 ) ) ( not ( = ?auto_532086 ?auto_532091 ) ) ( not ( = ?auto_532086 ?auto_532092 ) ) ( not ( = ?auto_532086 ?auto_532093 ) ) ( not ( = ?auto_532086 ?auto_532094 ) ) ( not ( = ?auto_532087 ?auto_532088 ) ) ( not ( = ?auto_532087 ?auto_532089 ) ) ( not ( = ?auto_532087 ?auto_532090 ) ) ( not ( = ?auto_532087 ?auto_532091 ) ) ( not ( = ?auto_532087 ?auto_532092 ) ) ( not ( = ?auto_532087 ?auto_532093 ) ) ( not ( = ?auto_532087 ?auto_532094 ) ) ( not ( = ?auto_532088 ?auto_532089 ) ) ( not ( = ?auto_532088 ?auto_532090 ) ) ( not ( = ?auto_532088 ?auto_532091 ) ) ( not ( = ?auto_532088 ?auto_532092 ) ) ( not ( = ?auto_532088 ?auto_532093 ) ) ( not ( = ?auto_532088 ?auto_532094 ) ) ( not ( = ?auto_532089 ?auto_532090 ) ) ( not ( = ?auto_532089 ?auto_532091 ) ) ( not ( = ?auto_532089 ?auto_532092 ) ) ( not ( = ?auto_532089 ?auto_532093 ) ) ( not ( = ?auto_532089 ?auto_532094 ) ) ( not ( = ?auto_532090 ?auto_532091 ) ) ( not ( = ?auto_532090 ?auto_532092 ) ) ( not ( = ?auto_532090 ?auto_532093 ) ) ( not ( = ?auto_532090 ?auto_532094 ) ) ( not ( = ?auto_532091 ?auto_532092 ) ) ( not ( = ?auto_532091 ?auto_532093 ) ) ( not ( = ?auto_532091 ?auto_532094 ) ) ( not ( = ?auto_532092 ?auto_532093 ) ) ( not ( = ?auto_532092 ?auto_532094 ) ) ( not ( = ?auto_532093 ?auto_532094 ) ) ( ON ?auto_532092 ?auto_532093 ) ( CLEAR ?auto_532090 ) ( ON ?auto_532091 ?auto_532092 ) ( CLEAR ?auto_532091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_532079 ?auto_532080 ?auto_532081 ?auto_532082 ?auto_532083 ?auto_532084 ?auto_532085 ?auto_532086 ?auto_532087 ?auto_532088 ?auto_532089 ?auto_532090 ?auto_532091 )
      ( MAKE-15PILE ?auto_532079 ?auto_532080 ?auto_532081 ?auto_532082 ?auto_532083 ?auto_532084 ?auto_532085 ?auto_532086 ?auto_532087 ?auto_532088 ?auto_532089 ?auto_532090 ?auto_532091 ?auto_532092 ?auto_532093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532141 - BLOCK
      ?auto_532142 - BLOCK
      ?auto_532143 - BLOCK
      ?auto_532144 - BLOCK
      ?auto_532145 - BLOCK
      ?auto_532146 - BLOCK
      ?auto_532147 - BLOCK
      ?auto_532148 - BLOCK
      ?auto_532149 - BLOCK
      ?auto_532150 - BLOCK
      ?auto_532151 - BLOCK
      ?auto_532152 - BLOCK
      ?auto_532153 - BLOCK
      ?auto_532154 - BLOCK
      ?auto_532155 - BLOCK
    )
    :vars
    (
      ?auto_532156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532155 ?auto_532156 ) ( ON-TABLE ?auto_532141 ) ( ON ?auto_532142 ?auto_532141 ) ( ON ?auto_532143 ?auto_532142 ) ( ON ?auto_532144 ?auto_532143 ) ( ON ?auto_532145 ?auto_532144 ) ( ON ?auto_532146 ?auto_532145 ) ( ON ?auto_532147 ?auto_532146 ) ( ON ?auto_532148 ?auto_532147 ) ( ON ?auto_532149 ?auto_532148 ) ( ON ?auto_532150 ?auto_532149 ) ( ON ?auto_532151 ?auto_532150 ) ( not ( = ?auto_532141 ?auto_532142 ) ) ( not ( = ?auto_532141 ?auto_532143 ) ) ( not ( = ?auto_532141 ?auto_532144 ) ) ( not ( = ?auto_532141 ?auto_532145 ) ) ( not ( = ?auto_532141 ?auto_532146 ) ) ( not ( = ?auto_532141 ?auto_532147 ) ) ( not ( = ?auto_532141 ?auto_532148 ) ) ( not ( = ?auto_532141 ?auto_532149 ) ) ( not ( = ?auto_532141 ?auto_532150 ) ) ( not ( = ?auto_532141 ?auto_532151 ) ) ( not ( = ?auto_532141 ?auto_532152 ) ) ( not ( = ?auto_532141 ?auto_532153 ) ) ( not ( = ?auto_532141 ?auto_532154 ) ) ( not ( = ?auto_532141 ?auto_532155 ) ) ( not ( = ?auto_532141 ?auto_532156 ) ) ( not ( = ?auto_532142 ?auto_532143 ) ) ( not ( = ?auto_532142 ?auto_532144 ) ) ( not ( = ?auto_532142 ?auto_532145 ) ) ( not ( = ?auto_532142 ?auto_532146 ) ) ( not ( = ?auto_532142 ?auto_532147 ) ) ( not ( = ?auto_532142 ?auto_532148 ) ) ( not ( = ?auto_532142 ?auto_532149 ) ) ( not ( = ?auto_532142 ?auto_532150 ) ) ( not ( = ?auto_532142 ?auto_532151 ) ) ( not ( = ?auto_532142 ?auto_532152 ) ) ( not ( = ?auto_532142 ?auto_532153 ) ) ( not ( = ?auto_532142 ?auto_532154 ) ) ( not ( = ?auto_532142 ?auto_532155 ) ) ( not ( = ?auto_532142 ?auto_532156 ) ) ( not ( = ?auto_532143 ?auto_532144 ) ) ( not ( = ?auto_532143 ?auto_532145 ) ) ( not ( = ?auto_532143 ?auto_532146 ) ) ( not ( = ?auto_532143 ?auto_532147 ) ) ( not ( = ?auto_532143 ?auto_532148 ) ) ( not ( = ?auto_532143 ?auto_532149 ) ) ( not ( = ?auto_532143 ?auto_532150 ) ) ( not ( = ?auto_532143 ?auto_532151 ) ) ( not ( = ?auto_532143 ?auto_532152 ) ) ( not ( = ?auto_532143 ?auto_532153 ) ) ( not ( = ?auto_532143 ?auto_532154 ) ) ( not ( = ?auto_532143 ?auto_532155 ) ) ( not ( = ?auto_532143 ?auto_532156 ) ) ( not ( = ?auto_532144 ?auto_532145 ) ) ( not ( = ?auto_532144 ?auto_532146 ) ) ( not ( = ?auto_532144 ?auto_532147 ) ) ( not ( = ?auto_532144 ?auto_532148 ) ) ( not ( = ?auto_532144 ?auto_532149 ) ) ( not ( = ?auto_532144 ?auto_532150 ) ) ( not ( = ?auto_532144 ?auto_532151 ) ) ( not ( = ?auto_532144 ?auto_532152 ) ) ( not ( = ?auto_532144 ?auto_532153 ) ) ( not ( = ?auto_532144 ?auto_532154 ) ) ( not ( = ?auto_532144 ?auto_532155 ) ) ( not ( = ?auto_532144 ?auto_532156 ) ) ( not ( = ?auto_532145 ?auto_532146 ) ) ( not ( = ?auto_532145 ?auto_532147 ) ) ( not ( = ?auto_532145 ?auto_532148 ) ) ( not ( = ?auto_532145 ?auto_532149 ) ) ( not ( = ?auto_532145 ?auto_532150 ) ) ( not ( = ?auto_532145 ?auto_532151 ) ) ( not ( = ?auto_532145 ?auto_532152 ) ) ( not ( = ?auto_532145 ?auto_532153 ) ) ( not ( = ?auto_532145 ?auto_532154 ) ) ( not ( = ?auto_532145 ?auto_532155 ) ) ( not ( = ?auto_532145 ?auto_532156 ) ) ( not ( = ?auto_532146 ?auto_532147 ) ) ( not ( = ?auto_532146 ?auto_532148 ) ) ( not ( = ?auto_532146 ?auto_532149 ) ) ( not ( = ?auto_532146 ?auto_532150 ) ) ( not ( = ?auto_532146 ?auto_532151 ) ) ( not ( = ?auto_532146 ?auto_532152 ) ) ( not ( = ?auto_532146 ?auto_532153 ) ) ( not ( = ?auto_532146 ?auto_532154 ) ) ( not ( = ?auto_532146 ?auto_532155 ) ) ( not ( = ?auto_532146 ?auto_532156 ) ) ( not ( = ?auto_532147 ?auto_532148 ) ) ( not ( = ?auto_532147 ?auto_532149 ) ) ( not ( = ?auto_532147 ?auto_532150 ) ) ( not ( = ?auto_532147 ?auto_532151 ) ) ( not ( = ?auto_532147 ?auto_532152 ) ) ( not ( = ?auto_532147 ?auto_532153 ) ) ( not ( = ?auto_532147 ?auto_532154 ) ) ( not ( = ?auto_532147 ?auto_532155 ) ) ( not ( = ?auto_532147 ?auto_532156 ) ) ( not ( = ?auto_532148 ?auto_532149 ) ) ( not ( = ?auto_532148 ?auto_532150 ) ) ( not ( = ?auto_532148 ?auto_532151 ) ) ( not ( = ?auto_532148 ?auto_532152 ) ) ( not ( = ?auto_532148 ?auto_532153 ) ) ( not ( = ?auto_532148 ?auto_532154 ) ) ( not ( = ?auto_532148 ?auto_532155 ) ) ( not ( = ?auto_532148 ?auto_532156 ) ) ( not ( = ?auto_532149 ?auto_532150 ) ) ( not ( = ?auto_532149 ?auto_532151 ) ) ( not ( = ?auto_532149 ?auto_532152 ) ) ( not ( = ?auto_532149 ?auto_532153 ) ) ( not ( = ?auto_532149 ?auto_532154 ) ) ( not ( = ?auto_532149 ?auto_532155 ) ) ( not ( = ?auto_532149 ?auto_532156 ) ) ( not ( = ?auto_532150 ?auto_532151 ) ) ( not ( = ?auto_532150 ?auto_532152 ) ) ( not ( = ?auto_532150 ?auto_532153 ) ) ( not ( = ?auto_532150 ?auto_532154 ) ) ( not ( = ?auto_532150 ?auto_532155 ) ) ( not ( = ?auto_532150 ?auto_532156 ) ) ( not ( = ?auto_532151 ?auto_532152 ) ) ( not ( = ?auto_532151 ?auto_532153 ) ) ( not ( = ?auto_532151 ?auto_532154 ) ) ( not ( = ?auto_532151 ?auto_532155 ) ) ( not ( = ?auto_532151 ?auto_532156 ) ) ( not ( = ?auto_532152 ?auto_532153 ) ) ( not ( = ?auto_532152 ?auto_532154 ) ) ( not ( = ?auto_532152 ?auto_532155 ) ) ( not ( = ?auto_532152 ?auto_532156 ) ) ( not ( = ?auto_532153 ?auto_532154 ) ) ( not ( = ?auto_532153 ?auto_532155 ) ) ( not ( = ?auto_532153 ?auto_532156 ) ) ( not ( = ?auto_532154 ?auto_532155 ) ) ( not ( = ?auto_532154 ?auto_532156 ) ) ( not ( = ?auto_532155 ?auto_532156 ) ) ( ON ?auto_532154 ?auto_532155 ) ( ON ?auto_532153 ?auto_532154 ) ( CLEAR ?auto_532151 ) ( ON ?auto_532152 ?auto_532153 ) ( CLEAR ?auto_532152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_532141 ?auto_532142 ?auto_532143 ?auto_532144 ?auto_532145 ?auto_532146 ?auto_532147 ?auto_532148 ?auto_532149 ?auto_532150 ?auto_532151 ?auto_532152 )
      ( MAKE-15PILE ?auto_532141 ?auto_532142 ?auto_532143 ?auto_532144 ?auto_532145 ?auto_532146 ?auto_532147 ?auto_532148 ?auto_532149 ?auto_532150 ?auto_532151 ?auto_532152 ?auto_532153 ?auto_532154 ?auto_532155 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532203 - BLOCK
      ?auto_532204 - BLOCK
      ?auto_532205 - BLOCK
      ?auto_532206 - BLOCK
      ?auto_532207 - BLOCK
      ?auto_532208 - BLOCK
      ?auto_532209 - BLOCK
      ?auto_532210 - BLOCK
      ?auto_532211 - BLOCK
      ?auto_532212 - BLOCK
      ?auto_532213 - BLOCK
      ?auto_532214 - BLOCK
      ?auto_532215 - BLOCK
      ?auto_532216 - BLOCK
      ?auto_532217 - BLOCK
    )
    :vars
    (
      ?auto_532218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532217 ?auto_532218 ) ( ON-TABLE ?auto_532203 ) ( ON ?auto_532204 ?auto_532203 ) ( ON ?auto_532205 ?auto_532204 ) ( ON ?auto_532206 ?auto_532205 ) ( ON ?auto_532207 ?auto_532206 ) ( ON ?auto_532208 ?auto_532207 ) ( ON ?auto_532209 ?auto_532208 ) ( ON ?auto_532210 ?auto_532209 ) ( ON ?auto_532211 ?auto_532210 ) ( ON ?auto_532212 ?auto_532211 ) ( not ( = ?auto_532203 ?auto_532204 ) ) ( not ( = ?auto_532203 ?auto_532205 ) ) ( not ( = ?auto_532203 ?auto_532206 ) ) ( not ( = ?auto_532203 ?auto_532207 ) ) ( not ( = ?auto_532203 ?auto_532208 ) ) ( not ( = ?auto_532203 ?auto_532209 ) ) ( not ( = ?auto_532203 ?auto_532210 ) ) ( not ( = ?auto_532203 ?auto_532211 ) ) ( not ( = ?auto_532203 ?auto_532212 ) ) ( not ( = ?auto_532203 ?auto_532213 ) ) ( not ( = ?auto_532203 ?auto_532214 ) ) ( not ( = ?auto_532203 ?auto_532215 ) ) ( not ( = ?auto_532203 ?auto_532216 ) ) ( not ( = ?auto_532203 ?auto_532217 ) ) ( not ( = ?auto_532203 ?auto_532218 ) ) ( not ( = ?auto_532204 ?auto_532205 ) ) ( not ( = ?auto_532204 ?auto_532206 ) ) ( not ( = ?auto_532204 ?auto_532207 ) ) ( not ( = ?auto_532204 ?auto_532208 ) ) ( not ( = ?auto_532204 ?auto_532209 ) ) ( not ( = ?auto_532204 ?auto_532210 ) ) ( not ( = ?auto_532204 ?auto_532211 ) ) ( not ( = ?auto_532204 ?auto_532212 ) ) ( not ( = ?auto_532204 ?auto_532213 ) ) ( not ( = ?auto_532204 ?auto_532214 ) ) ( not ( = ?auto_532204 ?auto_532215 ) ) ( not ( = ?auto_532204 ?auto_532216 ) ) ( not ( = ?auto_532204 ?auto_532217 ) ) ( not ( = ?auto_532204 ?auto_532218 ) ) ( not ( = ?auto_532205 ?auto_532206 ) ) ( not ( = ?auto_532205 ?auto_532207 ) ) ( not ( = ?auto_532205 ?auto_532208 ) ) ( not ( = ?auto_532205 ?auto_532209 ) ) ( not ( = ?auto_532205 ?auto_532210 ) ) ( not ( = ?auto_532205 ?auto_532211 ) ) ( not ( = ?auto_532205 ?auto_532212 ) ) ( not ( = ?auto_532205 ?auto_532213 ) ) ( not ( = ?auto_532205 ?auto_532214 ) ) ( not ( = ?auto_532205 ?auto_532215 ) ) ( not ( = ?auto_532205 ?auto_532216 ) ) ( not ( = ?auto_532205 ?auto_532217 ) ) ( not ( = ?auto_532205 ?auto_532218 ) ) ( not ( = ?auto_532206 ?auto_532207 ) ) ( not ( = ?auto_532206 ?auto_532208 ) ) ( not ( = ?auto_532206 ?auto_532209 ) ) ( not ( = ?auto_532206 ?auto_532210 ) ) ( not ( = ?auto_532206 ?auto_532211 ) ) ( not ( = ?auto_532206 ?auto_532212 ) ) ( not ( = ?auto_532206 ?auto_532213 ) ) ( not ( = ?auto_532206 ?auto_532214 ) ) ( not ( = ?auto_532206 ?auto_532215 ) ) ( not ( = ?auto_532206 ?auto_532216 ) ) ( not ( = ?auto_532206 ?auto_532217 ) ) ( not ( = ?auto_532206 ?auto_532218 ) ) ( not ( = ?auto_532207 ?auto_532208 ) ) ( not ( = ?auto_532207 ?auto_532209 ) ) ( not ( = ?auto_532207 ?auto_532210 ) ) ( not ( = ?auto_532207 ?auto_532211 ) ) ( not ( = ?auto_532207 ?auto_532212 ) ) ( not ( = ?auto_532207 ?auto_532213 ) ) ( not ( = ?auto_532207 ?auto_532214 ) ) ( not ( = ?auto_532207 ?auto_532215 ) ) ( not ( = ?auto_532207 ?auto_532216 ) ) ( not ( = ?auto_532207 ?auto_532217 ) ) ( not ( = ?auto_532207 ?auto_532218 ) ) ( not ( = ?auto_532208 ?auto_532209 ) ) ( not ( = ?auto_532208 ?auto_532210 ) ) ( not ( = ?auto_532208 ?auto_532211 ) ) ( not ( = ?auto_532208 ?auto_532212 ) ) ( not ( = ?auto_532208 ?auto_532213 ) ) ( not ( = ?auto_532208 ?auto_532214 ) ) ( not ( = ?auto_532208 ?auto_532215 ) ) ( not ( = ?auto_532208 ?auto_532216 ) ) ( not ( = ?auto_532208 ?auto_532217 ) ) ( not ( = ?auto_532208 ?auto_532218 ) ) ( not ( = ?auto_532209 ?auto_532210 ) ) ( not ( = ?auto_532209 ?auto_532211 ) ) ( not ( = ?auto_532209 ?auto_532212 ) ) ( not ( = ?auto_532209 ?auto_532213 ) ) ( not ( = ?auto_532209 ?auto_532214 ) ) ( not ( = ?auto_532209 ?auto_532215 ) ) ( not ( = ?auto_532209 ?auto_532216 ) ) ( not ( = ?auto_532209 ?auto_532217 ) ) ( not ( = ?auto_532209 ?auto_532218 ) ) ( not ( = ?auto_532210 ?auto_532211 ) ) ( not ( = ?auto_532210 ?auto_532212 ) ) ( not ( = ?auto_532210 ?auto_532213 ) ) ( not ( = ?auto_532210 ?auto_532214 ) ) ( not ( = ?auto_532210 ?auto_532215 ) ) ( not ( = ?auto_532210 ?auto_532216 ) ) ( not ( = ?auto_532210 ?auto_532217 ) ) ( not ( = ?auto_532210 ?auto_532218 ) ) ( not ( = ?auto_532211 ?auto_532212 ) ) ( not ( = ?auto_532211 ?auto_532213 ) ) ( not ( = ?auto_532211 ?auto_532214 ) ) ( not ( = ?auto_532211 ?auto_532215 ) ) ( not ( = ?auto_532211 ?auto_532216 ) ) ( not ( = ?auto_532211 ?auto_532217 ) ) ( not ( = ?auto_532211 ?auto_532218 ) ) ( not ( = ?auto_532212 ?auto_532213 ) ) ( not ( = ?auto_532212 ?auto_532214 ) ) ( not ( = ?auto_532212 ?auto_532215 ) ) ( not ( = ?auto_532212 ?auto_532216 ) ) ( not ( = ?auto_532212 ?auto_532217 ) ) ( not ( = ?auto_532212 ?auto_532218 ) ) ( not ( = ?auto_532213 ?auto_532214 ) ) ( not ( = ?auto_532213 ?auto_532215 ) ) ( not ( = ?auto_532213 ?auto_532216 ) ) ( not ( = ?auto_532213 ?auto_532217 ) ) ( not ( = ?auto_532213 ?auto_532218 ) ) ( not ( = ?auto_532214 ?auto_532215 ) ) ( not ( = ?auto_532214 ?auto_532216 ) ) ( not ( = ?auto_532214 ?auto_532217 ) ) ( not ( = ?auto_532214 ?auto_532218 ) ) ( not ( = ?auto_532215 ?auto_532216 ) ) ( not ( = ?auto_532215 ?auto_532217 ) ) ( not ( = ?auto_532215 ?auto_532218 ) ) ( not ( = ?auto_532216 ?auto_532217 ) ) ( not ( = ?auto_532216 ?auto_532218 ) ) ( not ( = ?auto_532217 ?auto_532218 ) ) ( ON ?auto_532216 ?auto_532217 ) ( ON ?auto_532215 ?auto_532216 ) ( ON ?auto_532214 ?auto_532215 ) ( CLEAR ?auto_532212 ) ( ON ?auto_532213 ?auto_532214 ) ( CLEAR ?auto_532213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_532203 ?auto_532204 ?auto_532205 ?auto_532206 ?auto_532207 ?auto_532208 ?auto_532209 ?auto_532210 ?auto_532211 ?auto_532212 ?auto_532213 )
      ( MAKE-15PILE ?auto_532203 ?auto_532204 ?auto_532205 ?auto_532206 ?auto_532207 ?auto_532208 ?auto_532209 ?auto_532210 ?auto_532211 ?auto_532212 ?auto_532213 ?auto_532214 ?auto_532215 ?auto_532216 ?auto_532217 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532265 - BLOCK
      ?auto_532266 - BLOCK
      ?auto_532267 - BLOCK
      ?auto_532268 - BLOCK
      ?auto_532269 - BLOCK
      ?auto_532270 - BLOCK
      ?auto_532271 - BLOCK
      ?auto_532272 - BLOCK
      ?auto_532273 - BLOCK
      ?auto_532274 - BLOCK
      ?auto_532275 - BLOCK
      ?auto_532276 - BLOCK
      ?auto_532277 - BLOCK
      ?auto_532278 - BLOCK
      ?auto_532279 - BLOCK
    )
    :vars
    (
      ?auto_532280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532279 ?auto_532280 ) ( ON-TABLE ?auto_532265 ) ( ON ?auto_532266 ?auto_532265 ) ( ON ?auto_532267 ?auto_532266 ) ( ON ?auto_532268 ?auto_532267 ) ( ON ?auto_532269 ?auto_532268 ) ( ON ?auto_532270 ?auto_532269 ) ( ON ?auto_532271 ?auto_532270 ) ( ON ?auto_532272 ?auto_532271 ) ( ON ?auto_532273 ?auto_532272 ) ( not ( = ?auto_532265 ?auto_532266 ) ) ( not ( = ?auto_532265 ?auto_532267 ) ) ( not ( = ?auto_532265 ?auto_532268 ) ) ( not ( = ?auto_532265 ?auto_532269 ) ) ( not ( = ?auto_532265 ?auto_532270 ) ) ( not ( = ?auto_532265 ?auto_532271 ) ) ( not ( = ?auto_532265 ?auto_532272 ) ) ( not ( = ?auto_532265 ?auto_532273 ) ) ( not ( = ?auto_532265 ?auto_532274 ) ) ( not ( = ?auto_532265 ?auto_532275 ) ) ( not ( = ?auto_532265 ?auto_532276 ) ) ( not ( = ?auto_532265 ?auto_532277 ) ) ( not ( = ?auto_532265 ?auto_532278 ) ) ( not ( = ?auto_532265 ?auto_532279 ) ) ( not ( = ?auto_532265 ?auto_532280 ) ) ( not ( = ?auto_532266 ?auto_532267 ) ) ( not ( = ?auto_532266 ?auto_532268 ) ) ( not ( = ?auto_532266 ?auto_532269 ) ) ( not ( = ?auto_532266 ?auto_532270 ) ) ( not ( = ?auto_532266 ?auto_532271 ) ) ( not ( = ?auto_532266 ?auto_532272 ) ) ( not ( = ?auto_532266 ?auto_532273 ) ) ( not ( = ?auto_532266 ?auto_532274 ) ) ( not ( = ?auto_532266 ?auto_532275 ) ) ( not ( = ?auto_532266 ?auto_532276 ) ) ( not ( = ?auto_532266 ?auto_532277 ) ) ( not ( = ?auto_532266 ?auto_532278 ) ) ( not ( = ?auto_532266 ?auto_532279 ) ) ( not ( = ?auto_532266 ?auto_532280 ) ) ( not ( = ?auto_532267 ?auto_532268 ) ) ( not ( = ?auto_532267 ?auto_532269 ) ) ( not ( = ?auto_532267 ?auto_532270 ) ) ( not ( = ?auto_532267 ?auto_532271 ) ) ( not ( = ?auto_532267 ?auto_532272 ) ) ( not ( = ?auto_532267 ?auto_532273 ) ) ( not ( = ?auto_532267 ?auto_532274 ) ) ( not ( = ?auto_532267 ?auto_532275 ) ) ( not ( = ?auto_532267 ?auto_532276 ) ) ( not ( = ?auto_532267 ?auto_532277 ) ) ( not ( = ?auto_532267 ?auto_532278 ) ) ( not ( = ?auto_532267 ?auto_532279 ) ) ( not ( = ?auto_532267 ?auto_532280 ) ) ( not ( = ?auto_532268 ?auto_532269 ) ) ( not ( = ?auto_532268 ?auto_532270 ) ) ( not ( = ?auto_532268 ?auto_532271 ) ) ( not ( = ?auto_532268 ?auto_532272 ) ) ( not ( = ?auto_532268 ?auto_532273 ) ) ( not ( = ?auto_532268 ?auto_532274 ) ) ( not ( = ?auto_532268 ?auto_532275 ) ) ( not ( = ?auto_532268 ?auto_532276 ) ) ( not ( = ?auto_532268 ?auto_532277 ) ) ( not ( = ?auto_532268 ?auto_532278 ) ) ( not ( = ?auto_532268 ?auto_532279 ) ) ( not ( = ?auto_532268 ?auto_532280 ) ) ( not ( = ?auto_532269 ?auto_532270 ) ) ( not ( = ?auto_532269 ?auto_532271 ) ) ( not ( = ?auto_532269 ?auto_532272 ) ) ( not ( = ?auto_532269 ?auto_532273 ) ) ( not ( = ?auto_532269 ?auto_532274 ) ) ( not ( = ?auto_532269 ?auto_532275 ) ) ( not ( = ?auto_532269 ?auto_532276 ) ) ( not ( = ?auto_532269 ?auto_532277 ) ) ( not ( = ?auto_532269 ?auto_532278 ) ) ( not ( = ?auto_532269 ?auto_532279 ) ) ( not ( = ?auto_532269 ?auto_532280 ) ) ( not ( = ?auto_532270 ?auto_532271 ) ) ( not ( = ?auto_532270 ?auto_532272 ) ) ( not ( = ?auto_532270 ?auto_532273 ) ) ( not ( = ?auto_532270 ?auto_532274 ) ) ( not ( = ?auto_532270 ?auto_532275 ) ) ( not ( = ?auto_532270 ?auto_532276 ) ) ( not ( = ?auto_532270 ?auto_532277 ) ) ( not ( = ?auto_532270 ?auto_532278 ) ) ( not ( = ?auto_532270 ?auto_532279 ) ) ( not ( = ?auto_532270 ?auto_532280 ) ) ( not ( = ?auto_532271 ?auto_532272 ) ) ( not ( = ?auto_532271 ?auto_532273 ) ) ( not ( = ?auto_532271 ?auto_532274 ) ) ( not ( = ?auto_532271 ?auto_532275 ) ) ( not ( = ?auto_532271 ?auto_532276 ) ) ( not ( = ?auto_532271 ?auto_532277 ) ) ( not ( = ?auto_532271 ?auto_532278 ) ) ( not ( = ?auto_532271 ?auto_532279 ) ) ( not ( = ?auto_532271 ?auto_532280 ) ) ( not ( = ?auto_532272 ?auto_532273 ) ) ( not ( = ?auto_532272 ?auto_532274 ) ) ( not ( = ?auto_532272 ?auto_532275 ) ) ( not ( = ?auto_532272 ?auto_532276 ) ) ( not ( = ?auto_532272 ?auto_532277 ) ) ( not ( = ?auto_532272 ?auto_532278 ) ) ( not ( = ?auto_532272 ?auto_532279 ) ) ( not ( = ?auto_532272 ?auto_532280 ) ) ( not ( = ?auto_532273 ?auto_532274 ) ) ( not ( = ?auto_532273 ?auto_532275 ) ) ( not ( = ?auto_532273 ?auto_532276 ) ) ( not ( = ?auto_532273 ?auto_532277 ) ) ( not ( = ?auto_532273 ?auto_532278 ) ) ( not ( = ?auto_532273 ?auto_532279 ) ) ( not ( = ?auto_532273 ?auto_532280 ) ) ( not ( = ?auto_532274 ?auto_532275 ) ) ( not ( = ?auto_532274 ?auto_532276 ) ) ( not ( = ?auto_532274 ?auto_532277 ) ) ( not ( = ?auto_532274 ?auto_532278 ) ) ( not ( = ?auto_532274 ?auto_532279 ) ) ( not ( = ?auto_532274 ?auto_532280 ) ) ( not ( = ?auto_532275 ?auto_532276 ) ) ( not ( = ?auto_532275 ?auto_532277 ) ) ( not ( = ?auto_532275 ?auto_532278 ) ) ( not ( = ?auto_532275 ?auto_532279 ) ) ( not ( = ?auto_532275 ?auto_532280 ) ) ( not ( = ?auto_532276 ?auto_532277 ) ) ( not ( = ?auto_532276 ?auto_532278 ) ) ( not ( = ?auto_532276 ?auto_532279 ) ) ( not ( = ?auto_532276 ?auto_532280 ) ) ( not ( = ?auto_532277 ?auto_532278 ) ) ( not ( = ?auto_532277 ?auto_532279 ) ) ( not ( = ?auto_532277 ?auto_532280 ) ) ( not ( = ?auto_532278 ?auto_532279 ) ) ( not ( = ?auto_532278 ?auto_532280 ) ) ( not ( = ?auto_532279 ?auto_532280 ) ) ( ON ?auto_532278 ?auto_532279 ) ( ON ?auto_532277 ?auto_532278 ) ( ON ?auto_532276 ?auto_532277 ) ( ON ?auto_532275 ?auto_532276 ) ( CLEAR ?auto_532273 ) ( ON ?auto_532274 ?auto_532275 ) ( CLEAR ?auto_532274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_532265 ?auto_532266 ?auto_532267 ?auto_532268 ?auto_532269 ?auto_532270 ?auto_532271 ?auto_532272 ?auto_532273 ?auto_532274 )
      ( MAKE-15PILE ?auto_532265 ?auto_532266 ?auto_532267 ?auto_532268 ?auto_532269 ?auto_532270 ?auto_532271 ?auto_532272 ?auto_532273 ?auto_532274 ?auto_532275 ?auto_532276 ?auto_532277 ?auto_532278 ?auto_532279 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532327 - BLOCK
      ?auto_532328 - BLOCK
      ?auto_532329 - BLOCK
      ?auto_532330 - BLOCK
      ?auto_532331 - BLOCK
      ?auto_532332 - BLOCK
      ?auto_532333 - BLOCK
      ?auto_532334 - BLOCK
      ?auto_532335 - BLOCK
      ?auto_532336 - BLOCK
      ?auto_532337 - BLOCK
      ?auto_532338 - BLOCK
      ?auto_532339 - BLOCK
      ?auto_532340 - BLOCK
      ?auto_532341 - BLOCK
    )
    :vars
    (
      ?auto_532342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532341 ?auto_532342 ) ( ON-TABLE ?auto_532327 ) ( ON ?auto_532328 ?auto_532327 ) ( ON ?auto_532329 ?auto_532328 ) ( ON ?auto_532330 ?auto_532329 ) ( ON ?auto_532331 ?auto_532330 ) ( ON ?auto_532332 ?auto_532331 ) ( ON ?auto_532333 ?auto_532332 ) ( ON ?auto_532334 ?auto_532333 ) ( not ( = ?auto_532327 ?auto_532328 ) ) ( not ( = ?auto_532327 ?auto_532329 ) ) ( not ( = ?auto_532327 ?auto_532330 ) ) ( not ( = ?auto_532327 ?auto_532331 ) ) ( not ( = ?auto_532327 ?auto_532332 ) ) ( not ( = ?auto_532327 ?auto_532333 ) ) ( not ( = ?auto_532327 ?auto_532334 ) ) ( not ( = ?auto_532327 ?auto_532335 ) ) ( not ( = ?auto_532327 ?auto_532336 ) ) ( not ( = ?auto_532327 ?auto_532337 ) ) ( not ( = ?auto_532327 ?auto_532338 ) ) ( not ( = ?auto_532327 ?auto_532339 ) ) ( not ( = ?auto_532327 ?auto_532340 ) ) ( not ( = ?auto_532327 ?auto_532341 ) ) ( not ( = ?auto_532327 ?auto_532342 ) ) ( not ( = ?auto_532328 ?auto_532329 ) ) ( not ( = ?auto_532328 ?auto_532330 ) ) ( not ( = ?auto_532328 ?auto_532331 ) ) ( not ( = ?auto_532328 ?auto_532332 ) ) ( not ( = ?auto_532328 ?auto_532333 ) ) ( not ( = ?auto_532328 ?auto_532334 ) ) ( not ( = ?auto_532328 ?auto_532335 ) ) ( not ( = ?auto_532328 ?auto_532336 ) ) ( not ( = ?auto_532328 ?auto_532337 ) ) ( not ( = ?auto_532328 ?auto_532338 ) ) ( not ( = ?auto_532328 ?auto_532339 ) ) ( not ( = ?auto_532328 ?auto_532340 ) ) ( not ( = ?auto_532328 ?auto_532341 ) ) ( not ( = ?auto_532328 ?auto_532342 ) ) ( not ( = ?auto_532329 ?auto_532330 ) ) ( not ( = ?auto_532329 ?auto_532331 ) ) ( not ( = ?auto_532329 ?auto_532332 ) ) ( not ( = ?auto_532329 ?auto_532333 ) ) ( not ( = ?auto_532329 ?auto_532334 ) ) ( not ( = ?auto_532329 ?auto_532335 ) ) ( not ( = ?auto_532329 ?auto_532336 ) ) ( not ( = ?auto_532329 ?auto_532337 ) ) ( not ( = ?auto_532329 ?auto_532338 ) ) ( not ( = ?auto_532329 ?auto_532339 ) ) ( not ( = ?auto_532329 ?auto_532340 ) ) ( not ( = ?auto_532329 ?auto_532341 ) ) ( not ( = ?auto_532329 ?auto_532342 ) ) ( not ( = ?auto_532330 ?auto_532331 ) ) ( not ( = ?auto_532330 ?auto_532332 ) ) ( not ( = ?auto_532330 ?auto_532333 ) ) ( not ( = ?auto_532330 ?auto_532334 ) ) ( not ( = ?auto_532330 ?auto_532335 ) ) ( not ( = ?auto_532330 ?auto_532336 ) ) ( not ( = ?auto_532330 ?auto_532337 ) ) ( not ( = ?auto_532330 ?auto_532338 ) ) ( not ( = ?auto_532330 ?auto_532339 ) ) ( not ( = ?auto_532330 ?auto_532340 ) ) ( not ( = ?auto_532330 ?auto_532341 ) ) ( not ( = ?auto_532330 ?auto_532342 ) ) ( not ( = ?auto_532331 ?auto_532332 ) ) ( not ( = ?auto_532331 ?auto_532333 ) ) ( not ( = ?auto_532331 ?auto_532334 ) ) ( not ( = ?auto_532331 ?auto_532335 ) ) ( not ( = ?auto_532331 ?auto_532336 ) ) ( not ( = ?auto_532331 ?auto_532337 ) ) ( not ( = ?auto_532331 ?auto_532338 ) ) ( not ( = ?auto_532331 ?auto_532339 ) ) ( not ( = ?auto_532331 ?auto_532340 ) ) ( not ( = ?auto_532331 ?auto_532341 ) ) ( not ( = ?auto_532331 ?auto_532342 ) ) ( not ( = ?auto_532332 ?auto_532333 ) ) ( not ( = ?auto_532332 ?auto_532334 ) ) ( not ( = ?auto_532332 ?auto_532335 ) ) ( not ( = ?auto_532332 ?auto_532336 ) ) ( not ( = ?auto_532332 ?auto_532337 ) ) ( not ( = ?auto_532332 ?auto_532338 ) ) ( not ( = ?auto_532332 ?auto_532339 ) ) ( not ( = ?auto_532332 ?auto_532340 ) ) ( not ( = ?auto_532332 ?auto_532341 ) ) ( not ( = ?auto_532332 ?auto_532342 ) ) ( not ( = ?auto_532333 ?auto_532334 ) ) ( not ( = ?auto_532333 ?auto_532335 ) ) ( not ( = ?auto_532333 ?auto_532336 ) ) ( not ( = ?auto_532333 ?auto_532337 ) ) ( not ( = ?auto_532333 ?auto_532338 ) ) ( not ( = ?auto_532333 ?auto_532339 ) ) ( not ( = ?auto_532333 ?auto_532340 ) ) ( not ( = ?auto_532333 ?auto_532341 ) ) ( not ( = ?auto_532333 ?auto_532342 ) ) ( not ( = ?auto_532334 ?auto_532335 ) ) ( not ( = ?auto_532334 ?auto_532336 ) ) ( not ( = ?auto_532334 ?auto_532337 ) ) ( not ( = ?auto_532334 ?auto_532338 ) ) ( not ( = ?auto_532334 ?auto_532339 ) ) ( not ( = ?auto_532334 ?auto_532340 ) ) ( not ( = ?auto_532334 ?auto_532341 ) ) ( not ( = ?auto_532334 ?auto_532342 ) ) ( not ( = ?auto_532335 ?auto_532336 ) ) ( not ( = ?auto_532335 ?auto_532337 ) ) ( not ( = ?auto_532335 ?auto_532338 ) ) ( not ( = ?auto_532335 ?auto_532339 ) ) ( not ( = ?auto_532335 ?auto_532340 ) ) ( not ( = ?auto_532335 ?auto_532341 ) ) ( not ( = ?auto_532335 ?auto_532342 ) ) ( not ( = ?auto_532336 ?auto_532337 ) ) ( not ( = ?auto_532336 ?auto_532338 ) ) ( not ( = ?auto_532336 ?auto_532339 ) ) ( not ( = ?auto_532336 ?auto_532340 ) ) ( not ( = ?auto_532336 ?auto_532341 ) ) ( not ( = ?auto_532336 ?auto_532342 ) ) ( not ( = ?auto_532337 ?auto_532338 ) ) ( not ( = ?auto_532337 ?auto_532339 ) ) ( not ( = ?auto_532337 ?auto_532340 ) ) ( not ( = ?auto_532337 ?auto_532341 ) ) ( not ( = ?auto_532337 ?auto_532342 ) ) ( not ( = ?auto_532338 ?auto_532339 ) ) ( not ( = ?auto_532338 ?auto_532340 ) ) ( not ( = ?auto_532338 ?auto_532341 ) ) ( not ( = ?auto_532338 ?auto_532342 ) ) ( not ( = ?auto_532339 ?auto_532340 ) ) ( not ( = ?auto_532339 ?auto_532341 ) ) ( not ( = ?auto_532339 ?auto_532342 ) ) ( not ( = ?auto_532340 ?auto_532341 ) ) ( not ( = ?auto_532340 ?auto_532342 ) ) ( not ( = ?auto_532341 ?auto_532342 ) ) ( ON ?auto_532340 ?auto_532341 ) ( ON ?auto_532339 ?auto_532340 ) ( ON ?auto_532338 ?auto_532339 ) ( ON ?auto_532337 ?auto_532338 ) ( ON ?auto_532336 ?auto_532337 ) ( CLEAR ?auto_532334 ) ( ON ?auto_532335 ?auto_532336 ) ( CLEAR ?auto_532335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_532327 ?auto_532328 ?auto_532329 ?auto_532330 ?auto_532331 ?auto_532332 ?auto_532333 ?auto_532334 ?auto_532335 )
      ( MAKE-15PILE ?auto_532327 ?auto_532328 ?auto_532329 ?auto_532330 ?auto_532331 ?auto_532332 ?auto_532333 ?auto_532334 ?auto_532335 ?auto_532336 ?auto_532337 ?auto_532338 ?auto_532339 ?auto_532340 ?auto_532341 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532389 - BLOCK
      ?auto_532390 - BLOCK
      ?auto_532391 - BLOCK
      ?auto_532392 - BLOCK
      ?auto_532393 - BLOCK
      ?auto_532394 - BLOCK
      ?auto_532395 - BLOCK
      ?auto_532396 - BLOCK
      ?auto_532397 - BLOCK
      ?auto_532398 - BLOCK
      ?auto_532399 - BLOCK
      ?auto_532400 - BLOCK
      ?auto_532401 - BLOCK
      ?auto_532402 - BLOCK
      ?auto_532403 - BLOCK
    )
    :vars
    (
      ?auto_532404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532403 ?auto_532404 ) ( ON-TABLE ?auto_532389 ) ( ON ?auto_532390 ?auto_532389 ) ( ON ?auto_532391 ?auto_532390 ) ( ON ?auto_532392 ?auto_532391 ) ( ON ?auto_532393 ?auto_532392 ) ( ON ?auto_532394 ?auto_532393 ) ( ON ?auto_532395 ?auto_532394 ) ( not ( = ?auto_532389 ?auto_532390 ) ) ( not ( = ?auto_532389 ?auto_532391 ) ) ( not ( = ?auto_532389 ?auto_532392 ) ) ( not ( = ?auto_532389 ?auto_532393 ) ) ( not ( = ?auto_532389 ?auto_532394 ) ) ( not ( = ?auto_532389 ?auto_532395 ) ) ( not ( = ?auto_532389 ?auto_532396 ) ) ( not ( = ?auto_532389 ?auto_532397 ) ) ( not ( = ?auto_532389 ?auto_532398 ) ) ( not ( = ?auto_532389 ?auto_532399 ) ) ( not ( = ?auto_532389 ?auto_532400 ) ) ( not ( = ?auto_532389 ?auto_532401 ) ) ( not ( = ?auto_532389 ?auto_532402 ) ) ( not ( = ?auto_532389 ?auto_532403 ) ) ( not ( = ?auto_532389 ?auto_532404 ) ) ( not ( = ?auto_532390 ?auto_532391 ) ) ( not ( = ?auto_532390 ?auto_532392 ) ) ( not ( = ?auto_532390 ?auto_532393 ) ) ( not ( = ?auto_532390 ?auto_532394 ) ) ( not ( = ?auto_532390 ?auto_532395 ) ) ( not ( = ?auto_532390 ?auto_532396 ) ) ( not ( = ?auto_532390 ?auto_532397 ) ) ( not ( = ?auto_532390 ?auto_532398 ) ) ( not ( = ?auto_532390 ?auto_532399 ) ) ( not ( = ?auto_532390 ?auto_532400 ) ) ( not ( = ?auto_532390 ?auto_532401 ) ) ( not ( = ?auto_532390 ?auto_532402 ) ) ( not ( = ?auto_532390 ?auto_532403 ) ) ( not ( = ?auto_532390 ?auto_532404 ) ) ( not ( = ?auto_532391 ?auto_532392 ) ) ( not ( = ?auto_532391 ?auto_532393 ) ) ( not ( = ?auto_532391 ?auto_532394 ) ) ( not ( = ?auto_532391 ?auto_532395 ) ) ( not ( = ?auto_532391 ?auto_532396 ) ) ( not ( = ?auto_532391 ?auto_532397 ) ) ( not ( = ?auto_532391 ?auto_532398 ) ) ( not ( = ?auto_532391 ?auto_532399 ) ) ( not ( = ?auto_532391 ?auto_532400 ) ) ( not ( = ?auto_532391 ?auto_532401 ) ) ( not ( = ?auto_532391 ?auto_532402 ) ) ( not ( = ?auto_532391 ?auto_532403 ) ) ( not ( = ?auto_532391 ?auto_532404 ) ) ( not ( = ?auto_532392 ?auto_532393 ) ) ( not ( = ?auto_532392 ?auto_532394 ) ) ( not ( = ?auto_532392 ?auto_532395 ) ) ( not ( = ?auto_532392 ?auto_532396 ) ) ( not ( = ?auto_532392 ?auto_532397 ) ) ( not ( = ?auto_532392 ?auto_532398 ) ) ( not ( = ?auto_532392 ?auto_532399 ) ) ( not ( = ?auto_532392 ?auto_532400 ) ) ( not ( = ?auto_532392 ?auto_532401 ) ) ( not ( = ?auto_532392 ?auto_532402 ) ) ( not ( = ?auto_532392 ?auto_532403 ) ) ( not ( = ?auto_532392 ?auto_532404 ) ) ( not ( = ?auto_532393 ?auto_532394 ) ) ( not ( = ?auto_532393 ?auto_532395 ) ) ( not ( = ?auto_532393 ?auto_532396 ) ) ( not ( = ?auto_532393 ?auto_532397 ) ) ( not ( = ?auto_532393 ?auto_532398 ) ) ( not ( = ?auto_532393 ?auto_532399 ) ) ( not ( = ?auto_532393 ?auto_532400 ) ) ( not ( = ?auto_532393 ?auto_532401 ) ) ( not ( = ?auto_532393 ?auto_532402 ) ) ( not ( = ?auto_532393 ?auto_532403 ) ) ( not ( = ?auto_532393 ?auto_532404 ) ) ( not ( = ?auto_532394 ?auto_532395 ) ) ( not ( = ?auto_532394 ?auto_532396 ) ) ( not ( = ?auto_532394 ?auto_532397 ) ) ( not ( = ?auto_532394 ?auto_532398 ) ) ( not ( = ?auto_532394 ?auto_532399 ) ) ( not ( = ?auto_532394 ?auto_532400 ) ) ( not ( = ?auto_532394 ?auto_532401 ) ) ( not ( = ?auto_532394 ?auto_532402 ) ) ( not ( = ?auto_532394 ?auto_532403 ) ) ( not ( = ?auto_532394 ?auto_532404 ) ) ( not ( = ?auto_532395 ?auto_532396 ) ) ( not ( = ?auto_532395 ?auto_532397 ) ) ( not ( = ?auto_532395 ?auto_532398 ) ) ( not ( = ?auto_532395 ?auto_532399 ) ) ( not ( = ?auto_532395 ?auto_532400 ) ) ( not ( = ?auto_532395 ?auto_532401 ) ) ( not ( = ?auto_532395 ?auto_532402 ) ) ( not ( = ?auto_532395 ?auto_532403 ) ) ( not ( = ?auto_532395 ?auto_532404 ) ) ( not ( = ?auto_532396 ?auto_532397 ) ) ( not ( = ?auto_532396 ?auto_532398 ) ) ( not ( = ?auto_532396 ?auto_532399 ) ) ( not ( = ?auto_532396 ?auto_532400 ) ) ( not ( = ?auto_532396 ?auto_532401 ) ) ( not ( = ?auto_532396 ?auto_532402 ) ) ( not ( = ?auto_532396 ?auto_532403 ) ) ( not ( = ?auto_532396 ?auto_532404 ) ) ( not ( = ?auto_532397 ?auto_532398 ) ) ( not ( = ?auto_532397 ?auto_532399 ) ) ( not ( = ?auto_532397 ?auto_532400 ) ) ( not ( = ?auto_532397 ?auto_532401 ) ) ( not ( = ?auto_532397 ?auto_532402 ) ) ( not ( = ?auto_532397 ?auto_532403 ) ) ( not ( = ?auto_532397 ?auto_532404 ) ) ( not ( = ?auto_532398 ?auto_532399 ) ) ( not ( = ?auto_532398 ?auto_532400 ) ) ( not ( = ?auto_532398 ?auto_532401 ) ) ( not ( = ?auto_532398 ?auto_532402 ) ) ( not ( = ?auto_532398 ?auto_532403 ) ) ( not ( = ?auto_532398 ?auto_532404 ) ) ( not ( = ?auto_532399 ?auto_532400 ) ) ( not ( = ?auto_532399 ?auto_532401 ) ) ( not ( = ?auto_532399 ?auto_532402 ) ) ( not ( = ?auto_532399 ?auto_532403 ) ) ( not ( = ?auto_532399 ?auto_532404 ) ) ( not ( = ?auto_532400 ?auto_532401 ) ) ( not ( = ?auto_532400 ?auto_532402 ) ) ( not ( = ?auto_532400 ?auto_532403 ) ) ( not ( = ?auto_532400 ?auto_532404 ) ) ( not ( = ?auto_532401 ?auto_532402 ) ) ( not ( = ?auto_532401 ?auto_532403 ) ) ( not ( = ?auto_532401 ?auto_532404 ) ) ( not ( = ?auto_532402 ?auto_532403 ) ) ( not ( = ?auto_532402 ?auto_532404 ) ) ( not ( = ?auto_532403 ?auto_532404 ) ) ( ON ?auto_532402 ?auto_532403 ) ( ON ?auto_532401 ?auto_532402 ) ( ON ?auto_532400 ?auto_532401 ) ( ON ?auto_532399 ?auto_532400 ) ( ON ?auto_532398 ?auto_532399 ) ( ON ?auto_532397 ?auto_532398 ) ( CLEAR ?auto_532395 ) ( ON ?auto_532396 ?auto_532397 ) ( CLEAR ?auto_532396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_532389 ?auto_532390 ?auto_532391 ?auto_532392 ?auto_532393 ?auto_532394 ?auto_532395 ?auto_532396 )
      ( MAKE-15PILE ?auto_532389 ?auto_532390 ?auto_532391 ?auto_532392 ?auto_532393 ?auto_532394 ?auto_532395 ?auto_532396 ?auto_532397 ?auto_532398 ?auto_532399 ?auto_532400 ?auto_532401 ?auto_532402 ?auto_532403 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532451 - BLOCK
      ?auto_532452 - BLOCK
      ?auto_532453 - BLOCK
      ?auto_532454 - BLOCK
      ?auto_532455 - BLOCK
      ?auto_532456 - BLOCK
      ?auto_532457 - BLOCK
      ?auto_532458 - BLOCK
      ?auto_532459 - BLOCK
      ?auto_532460 - BLOCK
      ?auto_532461 - BLOCK
      ?auto_532462 - BLOCK
      ?auto_532463 - BLOCK
      ?auto_532464 - BLOCK
      ?auto_532465 - BLOCK
    )
    :vars
    (
      ?auto_532466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532465 ?auto_532466 ) ( ON-TABLE ?auto_532451 ) ( ON ?auto_532452 ?auto_532451 ) ( ON ?auto_532453 ?auto_532452 ) ( ON ?auto_532454 ?auto_532453 ) ( ON ?auto_532455 ?auto_532454 ) ( ON ?auto_532456 ?auto_532455 ) ( not ( = ?auto_532451 ?auto_532452 ) ) ( not ( = ?auto_532451 ?auto_532453 ) ) ( not ( = ?auto_532451 ?auto_532454 ) ) ( not ( = ?auto_532451 ?auto_532455 ) ) ( not ( = ?auto_532451 ?auto_532456 ) ) ( not ( = ?auto_532451 ?auto_532457 ) ) ( not ( = ?auto_532451 ?auto_532458 ) ) ( not ( = ?auto_532451 ?auto_532459 ) ) ( not ( = ?auto_532451 ?auto_532460 ) ) ( not ( = ?auto_532451 ?auto_532461 ) ) ( not ( = ?auto_532451 ?auto_532462 ) ) ( not ( = ?auto_532451 ?auto_532463 ) ) ( not ( = ?auto_532451 ?auto_532464 ) ) ( not ( = ?auto_532451 ?auto_532465 ) ) ( not ( = ?auto_532451 ?auto_532466 ) ) ( not ( = ?auto_532452 ?auto_532453 ) ) ( not ( = ?auto_532452 ?auto_532454 ) ) ( not ( = ?auto_532452 ?auto_532455 ) ) ( not ( = ?auto_532452 ?auto_532456 ) ) ( not ( = ?auto_532452 ?auto_532457 ) ) ( not ( = ?auto_532452 ?auto_532458 ) ) ( not ( = ?auto_532452 ?auto_532459 ) ) ( not ( = ?auto_532452 ?auto_532460 ) ) ( not ( = ?auto_532452 ?auto_532461 ) ) ( not ( = ?auto_532452 ?auto_532462 ) ) ( not ( = ?auto_532452 ?auto_532463 ) ) ( not ( = ?auto_532452 ?auto_532464 ) ) ( not ( = ?auto_532452 ?auto_532465 ) ) ( not ( = ?auto_532452 ?auto_532466 ) ) ( not ( = ?auto_532453 ?auto_532454 ) ) ( not ( = ?auto_532453 ?auto_532455 ) ) ( not ( = ?auto_532453 ?auto_532456 ) ) ( not ( = ?auto_532453 ?auto_532457 ) ) ( not ( = ?auto_532453 ?auto_532458 ) ) ( not ( = ?auto_532453 ?auto_532459 ) ) ( not ( = ?auto_532453 ?auto_532460 ) ) ( not ( = ?auto_532453 ?auto_532461 ) ) ( not ( = ?auto_532453 ?auto_532462 ) ) ( not ( = ?auto_532453 ?auto_532463 ) ) ( not ( = ?auto_532453 ?auto_532464 ) ) ( not ( = ?auto_532453 ?auto_532465 ) ) ( not ( = ?auto_532453 ?auto_532466 ) ) ( not ( = ?auto_532454 ?auto_532455 ) ) ( not ( = ?auto_532454 ?auto_532456 ) ) ( not ( = ?auto_532454 ?auto_532457 ) ) ( not ( = ?auto_532454 ?auto_532458 ) ) ( not ( = ?auto_532454 ?auto_532459 ) ) ( not ( = ?auto_532454 ?auto_532460 ) ) ( not ( = ?auto_532454 ?auto_532461 ) ) ( not ( = ?auto_532454 ?auto_532462 ) ) ( not ( = ?auto_532454 ?auto_532463 ) ) ( not ( = ?auto_532454 ?auto_532464 ) ) ( not ( = ?auto_532454 ?auto_532465 ) ) ( not ( = ?auto_532454 ?auto_532466 ) ) ( not ( = ?auto_532455 ?auto_532456 ) ) ( not ( = ?auto_532455 ?auto_532457 ) ) ( not ( = ?auto_532455 ?auto_532458 ) ) ( not ( = ?auto_532455 ?auto_532459 ) ) ( not ( = ?auto_532455 ?auto_532460 ) ) ( not ( = ?auto_532455 ?auto_532461 ) ) ( not ( = ?auto_532455 ?auto_532462 ) ) ( not ( = ?auto_532455 ?auto_532463 ) ) ( not ( = ?auto_532455 ?auto_532464 ) ) ( not ( = ?auto_532455 ?auto_532465 ) ) ( not ( = ?auto_532455 ?auto_532466 ) ) ( not ( = ?auto_532456 ?auto_532457 ) ) ( not ( = ?auto_532456 ?auto_532458 ) ) ( not ( = ?auto_532456 ?auto_532459 ) ) ( not ( = ?auto_532456 ?auto_532460 ) ) ( not ( = ?auto_532456 ?auto_532461 ) ) ( not ( = ?auto_532456 ?auto_532462 ) ) ( not ( = ?auto_532456 ?auto_532463 ) ) ( not ( = ?auto_532456 ?auto_532464 ) ) ( not ( = ?auto_532456 ?auto_532465 ) ) ( not ( = ?auto_532456 ?auto_532466 ) ) ( not ( = ?auto_532457 ?auto_532458 ) ) ( not ( = ?auto_532457 ?auto_532459 ) ) ( not ( = ?auto_532457 ?auto_532460 ) ) ( not ( = ?auto_532457 ?auto_532461 ) ) ( not ( = ?auto_532457 ?auto_532462 ) ) ( not ( = ?auto_532457 ?auto_532463 ) ) ( not ( = ?auto_532457 ?auto_532464 ) ) ( not ( = ?auto_532457 ?auto_532465 ) ) ( not ( = ?auto_532457 ?auto_532466 ) ) ( not ( = ?auto_532458 ?auto_532459 ) ) ( not ( = ?auto_532458 ?auto_532460 ) ) ( not ( = ?auto_532458 ?auto_532461 ) ) ( not ( = ?auto_532458 ?auto_532462 ) ) ( not ( = ?auto_532458 ?auto_532463 ) ) ( not ( = ?auto_532458 ?auto_532464 ) ) ( not ( = ?auto_532458 ?auto_532465 ) ) ( not ( = ?auto_532458 ?auto_532466 ) ) ( not ( = ?auto_532459 ?auto_532460 ) ) ( not ( = ?auto_532459 ?auto_532461 ) ) ( not ( = ?auto_532459 ?auto_532462 ) ) ( not ( = ?auto_532459 ?auto_532463 ) ) ( not ( = ?auto_532459 ?auto_532464 ) ) ( not ( = ?auto_532459 ?auto_532465 ) ) ( not ( = ?auto_532459 ?auto_532466 ) ) ( not ( = ?auto_532460 ?auto_532461 ) ) ( not ( = ?auto_532460 ?auto_532462 ) ) ( not ( = ?auto_532460 ?auto_532463 ) ) ( not ( = ?auto_532460 ?auto_532464 ) ) ( not ( = ?auto_532460 ?auto_532465 ) ) ( not ( = ?auto_532460 ?auto_532466 ) ) ( not ( = ?auto_532461 ?auto_532462 ) ) ( not ( = ?auto_532461 ?auto_532463 ) ) ( not ( = ?auto_532461 ?auto_532464 ) ) ( not ( = ?auto_532461 ?auto_532465 ) ) ( not ( = ?auto_532461 ?auto_532466 ) ) ( not ( = ?auto_532462 ?auto_532463 ) ) ( not ( = ?auto_532462 ?auto_532464 ) ) ( not ( = ?auto_532462 ?auto_532465 ) ) ( not ( = ?auto_532462 ?auto_532466 ) ) ( not ( = ?auto_532463 ?auto_532464 ) ) ( not ( = ?auto_532463 ?auto_532465 ) ) ( not ( = ?auto_532463 ?auto_532466 ) ) ( not ( = ?auto_532464 ?auto_532465 ) ) ( not ( = ?auto_532464 ?auto_532466 ) ) ( not ( = ?auto_532465 ?auto_532466 ) ) ( ON ?auto_532464 ?auto_532465 ) ( ON ?auto_532463 ?auto_532464 ) ( ON ?auto_532462 ?auto_532463 ) ( ON ?auto_532461 ?auto_532462 ) ( ON ?auto_532460 ?auto_532461 ) ( ON ?auto_532459 ?auto_532460 ) ( ON ?auto_532458 ?auto_532459 ) ( CLEAR ?auto_532456 ) ( ON ?auto_532457 ?auto_532458 ) ( CLEAR ?auto_532457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_532451 ?auto_532452 ?auto_532453 ?auto_532454 ?auto_532455 ?auto_532456 ?auto_532457 )
      ( MAKE-15PILE ?auto_532451 ?auto_532452 ?auto_532453 ?auto_532454 ?auto_532455 ?auto_532456 ?auto_532457 ?auto_532458 ?auto_532459 ?auto_532460 ?auto_532461 ?auto_532462 ?auto_532463 ?auto_532464 ?auto_532465 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532513 - BLOCK
      ?auto_532514 - BLOCK
      ?auto_532515 - BLOCK
      ?auto_532516 - BLOCK
      ?auto_532517 - BLOCK
      ?auto_532518 - BLOCK
      ?auto_532519 - BLOCK
      ?auto_532520 - BLOCK
      ?auto_532521 - BLOCK
      ?auto_532522 - BLOCK
      ?auto_532523 - BLOCK
      ?auto_532524 - BLOCK
      ?auto_532525 - BLOCK
      ?auto_532526 - BLOCK
      ?auto_532527 - BLOCK
    )
    :vars
    (
      ?auto_532528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532527 ?auto_532528 ) ( ON-TABLE ?auto_532513 ) ( ON ?auto_532514 ?auto_532513 ) ( ON ?auto_532515 ?auto_532514 ) ( ON ?auto_532516 ?auto_532515 ) ( ON ?auto_532517 ?auto_532516 ) ( not ( = ?auto_532513 ?auto_532514 ) ) ( not ( = ?auto_532513 ?auto_532515 ) ) ( not ( = ?auto_532513 ?auto_532516 ) ) ( not ( = ?auto_532513 ?auto_532517 ) ) ( not ( = ?auto_532513 ?auto_532518 ) ) ( not ( = ?auto_532513 ?auto_532519 ) ) ( not ( = ?auto_532513 ?auto_532520 ) ) ( not ( = ?auto_532513 ?auto_532521 ) ) ( not ( = ?auto_532513 ?auto_532522 ) ) ( not ( = ?auto_532513 ?auto_532523 ) ) ( not ( = ?auto_532513 ?auto_532524 ) ) ( not ( = ?auto_532513 ?auto_532525 ) ) ( not ( = ?auto_532513 ?auto_532526 ) ) ( not ( = ?auto_532513 ?auto_532527 ) ) ( not ( = ?auto_532513 ?auto_532528 ) ) ( not ( = ?auto_532514 ?auto_532515 ) ) ( not ( = ?auto_532514 ?auto_532516 ) ) ( not ( = ?auto_532514 ?auto_532517 ) ) ( not ( = ?auto_532514 ?auto_532518 ) ) ( not ( = ?auto_532514 ?auto_532519 ) ) ( not ( = ?auto_532514 ?auto_532520 ) ) ( not ( = ?auto_532514 ?auto_532521 ) ) ( not ( = ?auto_532514 ?auto_532522 ) ) ( not ( = ?auto_532514 ?auto_532523 ) ) ( not ( = ?auto_532514 ?auto_532524 ) ) ( not ( = ?auto_532514 ?auto_532525 ) ) ( not ( = ?auto_532514 ?auto_532526 ) ) ( not ( = ?auto_532514 ?auto_532527 ) ) ( not ( = ?auto_532514 ?auto_532528 ) ) ( not ( = ?auto_532515 ?auto_532516 ) ) ( not ( = ?auto_532515 ?auto_532517 ) ) ( not ( = ?auto_532515 ?auto_532518 ) ) ( not ( = ?auto_532515 ?auto_532519 ) ) ( not ( = ?auto_532515 ?auto_532520 ) ) ( not ( = ?auto_532515 ?auto_532521 ) ) ( not ( = ?auto_532515 ?auto_532522 ) ) ( not ( = ?auto_532515 ?auto_532523 ) ) ( not ( = ?auto_532515 ?auto_532524 ) ) ( not ( = ?auto_532515 ?auto_532525 ) ) ( not ( = ?auto_532515 ?auto_532526 ) ) ( not ( = ?auto_532515 ?auto_532527 ) ) ( not ( = ?auto_532515 ?auto_532528 ) ) ( not ( = ?auto_532516 ?auto_532517 ) ) ( not ( = ?auto_532516 ?auto_532518 ) ) ( not ( = ?auto_532516 ?auto_532519 ) ) ( not ( = ?auto_532516 ?auto_532520 ) ) ( not ( = ?auto_532516 ?auto_532521 ) ) ( not ( = ?auto_532516 ?auto_532522 ) ) ( not ( = ?auto_532516 ?auto_532523 ) ) ( not ( = ?auto_532516 ?auto_532524 ) ) ( not ( = ?auto_532516 ?auto_532525 ) ) ( not ( = ?auto_532516 ?auto_532526 ) ) ( not ( = ?auto_532516 ?auto_532527 ) ) ( not ( = ?auto_532516 ?auto_532528 ) ) ( not ( = ?auto_532517 ?auto_532518 ) ) ( not ( = ?auto_532517 ?auto_532519 ) ) ( not ( = ?auto_532517 ?auto_532520 ) ) ( not ( = ?auto_532517 ?auto_532521 ) ) ( not ( = ?auto_532517 ?auto_532522 ) ) ( not ( = ?auto_532517 ?auto_532523 ) ) ( not ( = ?auto_532517 ?auto_532524 ) ) ( not ( = ?auto_532517 ?auto_532525 ) ) ( not ( = ?auto_532517 ?auto_532526 ) ) ( not ( = ?auto_532517 ?auto_532527 ) ) ( not ( = ?auto_532517 ?auto_532528 ) ) ( not ( = ?auto_532518 ?auto_532519 ) ) ( not ( = ?auto_532518 ?auto_532520 ) ) ( not ( = ?auto_532518 ?auto_532521 ) ) ( not ( = ?auto_532518 ?auto_532522 ) ) ( not ( = ?auto_532518 ?auto_532523 ) ) ( not ( = ?auto_532518 ?auto_532524 ) ) ( not ( = ?auto_532518 ?auto_532525 ) ) ( not ( = ?auto_532518 ?auto_532526 ) ) ( not ( = ?auto_532518 ?auto_532527 ) ) ( not ( = ?auto_532518 ?auto_532528 ) ) ( not ( = ?auto_532519 ?auto_532520 ) ) ( not ( = ?auto_532519 ?auto_532521 ) ) ( not ( = ?auto_532519 ?auto_532522 ) ) ( not ( = ?auto_532519 ?auto_532523 ) ) ( not ( = ?auto_532519 ?auto_532524 ) ) ( not ( = ?auto_532519 ?auto_532525 ) ) ( not ( = ?auto_532519 ?auto_532526 ) ) ( not ( = ?auto_532519 ?auto_532527 ) ) ( not ( = ?auto_532519 ?auto_532528 ) ) ( not ( = ?auto_532520 ?auto_532521 ) ) ( not ( = ?auto_532520 ?auto_532522 ) ) ( not ( = ?auto_532520 ?auto_532523 ) ) ( not ( = ?auto_532520 ?auto_532524 ) ) ( not ( = ?auto_532520 ?auto_532525 ) ) ( not ( = ?auto_532520 ?auto_532526 ) ) ( not ( = ?auto_532520 ?auto_532527 ) ) ( not ( = ?auto_532520 ?auto_532528 ) ) ( not ( = ?auto_532521 ?auto_532522 ) ) ( not ( = ?auto_532521 ?auto_532523 ) ) ( not ( = ?auto_532521 ?auto_532524 ) ) ( not ( = ?auto_532521 ?auto_532525 ) ) ( not ( = ?auto_532521 ?auto_532526 ) ) ( not ( = ?auto_532521 ?auto_532527 ) ) ( not ( = ?auto_532521 ?auto_532528 ) ) ( not ( = ?auto_532522 ?auto_532523 ) ) ( not ( = ?auto_532522 ?auto_532524 ) ) ( not ( = ?auto_532522 ?auto_532525 ) ) ( not ( = ?auto_532522 ?auto_532526 ) ) ( not ( = ?auto_532522 ?auto_532527 ) ) ( not ( = ?auto_532522 ?auto_532528 ) ) ( not ( = ?auto_532523 ?auto_532524 ) ) ( not ( = ?auto_532523 ?auto_532525 ) ) ( not ( = ?auto_532523 ?auto_532526 ) ) ( not ( = ?auto_532523 ?auto_532527 ) ) ( not ( = ?auto_532523 ?auto_532528 ) ) ( not ( = ?auto_532524 ?auto_532525 ) ) ( not ( = ?auto_532524 ?auto_532526 ) ) ( not ( = ?auto_532524 ?auto_532527 ) ) ( not ( = ?auto_532524 ?auto_532528 ) ) ( not ( = ?auto_532525 ?auto_532526 ) ) ( not ( = ?auto_532525 ?auto_532527 ) ) ( not ( = ?auto_532525 ?auto_532528 ) ) ( not ( = ?auto_532526 ?auto_532527 ) ) ( not ( = ?auto_532526 ?auto_532528 ) ) ( not ( = ?auto_532527 ?auto_532528 ) ) ( ON ?auto_532526 ?auto_532527 ) ( ON ?auto_532525 ?auto_532526 ) ( ON ?auto_532524 ?auto_532525 ) ( ON ?auto_532523 ?auto_532524 ) ( ON ?auto_532522 ?auto_532523 ) ( ON ?auto_532521 ?auto_532522 ) ( ON ?auto_532520 ?auto_532521 ) ( ON ?auto_532519 ?auto_532520 ) ( CLEAR ?auto_532517 ) ( ON ?auto_532518 ?auto_532519 ) ( CLEAR ?auto_532518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_532513 ?auto_532514 ?auto_532515 ?auto_532516 ?auto_532517 ?auto_532518 )
      ( MAKE-15PILE ?auto_532513 ?auto_532514 ?auto_532515 ?auto_532516 ?auto_532517 ?auto_532518 ?auto_532519 ?auto_532520 ?auto_532521 ?auto_532522 ?auto_532523 ?auto_532524 ?auto_532525 ?auto_532526 ?auto_532527 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532575 - BLOCK
      ?auto_532576 - BLOCK
      ?auto_532577 - BLOCK
      ?auto_532578 - BLOCK
      ?auto_532579 - BLOCK
      ?auto_532580 - BLOCK
      ?auto_532581 - BLOCK
      ?auto_532582 - BLOCK
      ?auto_532583 - BLOCK
      ?auto_532584 - BLOCK
      ?auto_532585 - BLOCK
      ?auto_532586 - BLOCK
      ?auto_532587 - BLOCK
      ?auto_532588 - BLOCK
      ?auto_532589 - BLOCK
    )
    :vars
    (
      ?auto_532590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532589 ?auto_532590 ) ( ON-TABLE ?auto_532575 ) ( ON ?auto_532576 ?auto_532575 ) ( ON ?auto_532577 ?auto_532576 ) ( ON ?auto_532578 ?auto_532577 ) ( not ( = ?auto_532575 ?auto_532576 ) ) ( not ( = ?auto_532575 ?auto_532577 ) ) ( not ( = ?auto_532575 ?auto_532578 ) ) ( not ( = ?auto_532575 ?auto_532579 ) ) ( not ( = ?auto_532575 ?auto_532580 ) ) ( not ( = ?auto_532575 ?auto_532581 ) ) ( not ( = ?auto_532575 ?auto_532582 ) ) ( not ( = ?auto_532575 ?auto_532583 ) ) ( not ( = ?auto_532575 ?auto_532584 ) ) ( not ( = ?auto_532575 ?auto_532585 ) ) ( not ( = ?auto_532575 ?auto_532586 ) ) ( not ( = ?auto_532575 ?auto_532587 ) ) ( not ( = ?auto_532575 ?auto_532588 ) ) ( not ( = ?auto_532575 ?auto_532589 ) ) ( not ( = ?auto_532575 ?auto_532590 ) ) ( not ( = ?auto_532576 ?auto_532577 ) ) ( not ( = ?auto_532576 ?auto_532578 ) ) ( not ( = ?auto_532576 ?auto_532579 ) ) ( not ( = ?auto_532576 ?auto_532580 ) ) ( not ( = ?auto_532576 ?auto_532581 ) ) ( not ( = ?auto_532576 ?auto_532582 ) ) ( not ( = ?auto_532576 ?auto_532583 ) ) ( not ( = ?auto_532576 ?auto_532584 ) ) ( not ( = ?auto_532576 ?auto_532585 ) ) ( not ( = ?auto_532576 ?auto_532586 ) ) ( not ( = ?auto_532576 ?auto_532587 ) ) ( not ( = ?auto_532576 ?auto_532588 ) ) ( not ( = ?auto_532576 ?auto_532589 ) ) ( not ( = ?auto_532576 ?auto_532590 ) ) ( not ( = ?auto_532577 ?auto_532578 ) ) ( not ( = ?auto_532577 ?auto_532579 ) ) ( not ( = ?auto_532577 ?auto_532580 ) ) ( not ( = ?auto_532577 ?auto_532581 ) ) ( not ( = ?auto_532577 ?auto_532582 ) ) ( not ( = ?auto_532577 ?auto_532583 ) ) ( not ( = ?auto_532577 ?auto_532584 ) ) ( not ( = ?auto_532577 ?auto_532585 ) ) ( not ( = ?auto_532577 ?auto_532586 ) ) ( not ( = ?auto_532577 ?auto_532587 ) ) ( not ( = ?auto_532577 ?auto_532588 ) ) ( not ( = ?auto_532577 ?auto_532589 ) ) ( not ( = ?auto_532577 ?auto_532590 ) ) ( not ( = ?auto_532578 ?auto_532579 ) ) ( not ( = ?auto_532578 ?auto_532580 ) ) ( not ( = ?auto_532578 ?auto_532581 ) ) ( not ( = ?auto_532578 ?auto_532582 ) ) ( not ( = ?auto_532578 ?auto_532583 ) ) ( not ( = ?auto_532578 ?auto_532584 ) ) ( not ( = ?auto_532578 ?auto_532585 ) ) ( not ( = ?auto_532578 ?auto_532586 ) ) ( not ( = ?auto_532578 ?auto_532587 ) ) ( not ( = ?auto_532578 ?auto_532588 ) ) ( not ( = ?auto_532578 ?auto_532589 ) ) ( not ( = ?auto_532578 ?auto_532590 ) ) ( not ( = ?auto_532579 ?auto_532580 ) ) ( not ( = ?auto_532579 ?auto_532581 ) ) ( not ( = ?auto_532579 ?auto_532582 ) ) ( not ( = ?auto_532579 ?auto_532583 ) ) ( not ( = ?auto_532579 ?auto_532584 ) ) ( not ( = ?auto_532579 ?auto_532585 ) ) ( not ( = ?auto_532579 ?auto_532586 ) ) ( not ( = ?auto_532579 ?auto_532587 ) ) ( not ( = ?auto_532579 ?auto_532588 ) ) ( not ( = ?auto_532579 ?auto_532589 ) ) ( not ( = ?auto_532579 ?auto_532590 ) ) ( not ( = ?auto_532580 ?auto_532581 ) ) ( not ( = ?auto_532580 ?auto_532582 ) ) ( not ( = ?auto_532580 ?auto_532583 ) ) ( not ( = ?auto_532580 ?auto_532584 ) ) ( not ( = ?auto_532580 ?auto_532585 ) ) ( not ( = ?auto_532580 ?auto_532586 ) ) ( not ( = ?auto_532580 ?auto_532587 ) ) ( not ( = ?auto_532580 ?auto_532588 ) ) ( not ( = ?auto_532580 ?auto_532589 ) ) ( not ( = ?auto_532580 ?auto_532590 ) ) ( not ( = ?auto_532581 ?auto_532582 ) ) ( not ( = ?auto_532581 ?auto_532583 ) ) ( not ( = ?auto_532581 ?auto_532584 ) ) ( not ( = ?auto_532581 ?auto_532585 ) ) ( not ( = ?auto_532581 ?auto_532586 ) ) ( not ( = ?auto_532581 ?auto_532587 ) ) ( not ( = ?auto_532581 ?auto_532588 ) ) ( not ( = ?auto_532581 ?auto_532589 ) ) ( not ( = ?auto_532581 ?auto_532590 ) ) ( not ( = ?auto_532582 ?auto_532583 ) ) ( not ( = ?auto_532582 ?auto_532584 ) ) ( not ( = ?auto_532582 ?auto_532585 ) ) ( not ( = ?auto_532582 ?auto_532586 ) ) ( not ( = ?auto_532582 ?auto_532587 ) ) ( not ( = ?auto_532582 ?auto_532588 ) ) ( not ( = ?auto_532582 ?auto_532589 ) ) ( not ( = ?auto_532582 ?auto_532590 ) ) ( not ( = ?auto_532583 ?auto_532584 ) ) ( not ( = ?auto_532583 ?auto_532585 ) ) ( not ( = ?auto_532583 ?auto_532586 ) ) ( not ( = ?auto_532583 ?auto_532587 ) ) ( not ( = ?auto_532583 ?auto_532588 ) ) ( not ( = ?auto_532583 ?auto_532589 ) ) ( not ( = ?auto_532583 ?auto_532590 ) ) ( not ( = ?auto_532584 ?auto_532585 ) ) ( not ( = ?auto_532584 ?auto_532586 ) ) ( not ( = ?auto_532584 ?auto_532587 ) ) ( not ( = ?auto_532584 ?auto_532588 ) ) ( not ( = ?auto_532584 ?auto_532589 ) ) ( not ( = ?auto_532584 ?auto_532590 ) ) ( not ( = ?auto_532585 ?auto_532586 ) ) ( not ( = ?auto_532585 ?auto_532587 ) ) ( not ( = ?auto_532585 ?auto_532588 ) ) ( not ( = ?auto_532585 ?auto_532589 ) ) ( not ( = ?auto_532585 ?auto_532590 ) ) ( not ( = ?auto_532586 ?auto_532587 ) ) ( not ( = ?auto_532586 ?auto_532588 ) ) ( not ( = ?auto_532586 ?auto_532589 ) ) ( not ( = ?auto_532586 ?auto_532590 ) ) ( not ( = ?auto_532587 ?auto_532588 ) ) ( not ( = ?auto_532587 ?auto_532589 ) ) ( not ( = ?auto_532587 ?auto_532590 ) ) ( not ( = ?auto_532588 ?auto_532589 ) ) ( not ( = ?auto_532588 ?auto_532590 ) ) ( not ( = ?auto_532589 ?auto_532590 ) ) ( ON ?auto_532588 ?auto_532589 ) ( ON ?auto_532587 ?auto_532588 ) ( ON ?auto_532586 ?auto_532587 ) ( ON ?auto_532585 ?auto_532586 ) ( ON ?auto_532584 ?auto_532585 ) ( ON ?auto_532583 ?auto_532584 ) ( ON ?auto_532582 ?auto_532583 ) ( ON ?auto_532581 ?auto_532582 ) ( ON ?auto_532580 ?auto_532581 ) ( CLEAR ?auto_532578 ) ( ON ?auto_532579 ?auto_532580 ) ( CLEAR ?auto_532579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_532575 ?auto_532576 ?auto_532577 ?auto_532578 ?auto_532579 )
      ( MAKE-15PILE ?auto_532575 ?auto_532576 ?auto_532577 ?auto_532578 ?auto_532579 ?auto_532580 ?auto_532581 ?auto_532582 ?auto_532583 ?auto_532584 ?auto_532585 ?auto_532586 ?auto_532587 ?auto_532588 ?auto_532589 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532637 - BLOCK
      ?auto_532638 - BLOCK
      ?auto_532639 - BLOCK
      ?auto_532640 - BLOCK
      ?auto_532641 - BLOCK
      ?auto_532642 - BLOCK
      ?auto_532643 - BLOCK
      ?auto_532644 - BLOCK
      ?auto_532645 - BLOCK
      ?auto_532646 - BLOCK
      ?auto_532647 - BLOCK
      ?auto_532648 - BLOCK
      ?auto_532649 - BLOCK
      ?auto_532650 - BLOCK
      ?auto_532651 - BLOCK
    )
    :vars
    (
      ?auto_532652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532651 ?auto_532652 ) ( ON-TABLE ?auto_532637 ) ( ON ?auto_532638 ?auto_532637 ) ( ON ?auto_532639 ?auto_532638 ) ( not ( = ?auto_532637 ?auto_532638 ) ) ( not ( = ?auto_532637 ?auto_532639 ) ) ( not ( = ?auto_532637 ?auto_532640 ) ) ( not ( = ?auto_532637 ?auto_532641 ) ) ( not ( = ?auto_532637 ?auto_532642 ) ) ( not ( = ?auto_532637 ?auto_532643 ) ) ( not ( = ?auto_532637 ?auto_532644 ) ) ( not ( = ?auto_532637 ?auto_532645 ) ) ( not ( = ?auto_532637 ?auto_532646 ) ) ( not ( = ?auto_532637 ?auto_532647 ) ) ( not ( = ?auto_532637 ?auto_532648 ) ) ( not ( = ?auto_532637 ?auto_532649 ) ) ( not ( = ?auto_532637 ?auto_532650 ) ) ( not ( = ?auto_532637 ?auto_532651 ) ) ( not ( = ?auto_532637 ?auto_532652 ) ) ( not ( = ?auto_532638 ?auto_532639 ) ) ( not ( = ?auto_532638 ?auto_532640 ) ) ( not ( = ?auto_532638 ?auto_532641 ) ) ( not ( = ?auto_532638 ?auto_532642 ) ) ( not ( = ?auto_532638 ?auto_532643 ) ) ( not ( = ?auto_532638 ?auto_532644 ) ) ( not ( = ?auto_532638 ?auto_532645 ) ) ( not ( = ?auto_532638 ?auto_532646 ) ) ( not ( = ?auto_532638 ?auto_532647 ) ) ( not ( = ?auto_532638 ?auto_532648 ) ) ( not ( = ?auto_532638 ?auto_532649 ) ) ( not ( = ?auto_532638 ?auto_532650 ) ) ( not ( = ?auto_532638 ?auto_532651 ) ) ( not ( = ?auto_532638 ?auto_532652 ) ) ( not ( = ?auto_532639 ?auto_532640 ) ) ( not ( = ?auto_532639 ?auto_532641 ) ) ( not ( = ?auto_532639 ?auto_532642 ) ) ( not ( = ?auto_532639 ?auto_532643 ) ) ( not ( = ?auto_532639 ?auto_532644 ) ) ( not ( = ?auto_532639 ?auto_532645 ) ) ( not ( = ?auto_532639 ?auto_532646 ) ) ( not ( = ?auto_532639 ?auto_532647 ) ) ( not ( = ?auto_532639 ?auto_532648 ) ) ( not ( = ?auto_532639 ?auto_532649 ) ) ( not ( = ?auto_532639 ?auto_532650 ) ) ( not ( = ?auto_532639 ?auto_532651 ) ) ( not ( = ?auto_532639 ?auto_532652 ) ) ( not ( = ?auto_532640 ?auto_532641 ) ) ( not ( = ?auto_532640 ?auto_532642 ) ) ( not ( = ?auto_532640 ?auto_532643 ) ) ( not ( = ?auto_532640 ?auto_532644 ) ) ( not ( = ?auto_532640 ?auto_532645 ) ) ( not ( = ?auto_532640 ?auto_532646 ) ) ( not ( = ?auto_532640 ?auto_532647 ) ) ( not ( = ?auto_532640 ?auto_532648 ) ) ( not ( = ?auto_532640 ?auto_532649 ) ) ( not ( = ?auto_532640 ?auto_532650 ) ) ( not ( = ?auto_532640 ?auto_532651 ) ) ( not ( = ?auto_532640 ?auto_532652 ) ) ( not ( = ?auto_532641 ?auto_532642 ) ) ( not ( = ?auto_532641 ?auto_532643 ) ) ( not ( = ?auto_532641 ?auto_532644 ) ) ( not ( = ?auto_532641 ?auto_532645 ) ) ( not ( = ?auto_532641 ?auto_532646 ) ) ( not ( = ?auto_532641 ?auto_532647 ) ) ( not ( = ?auto_532641 ?auto_532648 ) ) ( not ( = ?auto_532641 ?auto_532649 ) ) ( not ( = ?auto_532641 ?auto_532650 ) ) ( not ( = ?auto_532641 ?auto_532651 ) ) ( not ( = ?auto_532641 ?auto_532652 ) ) ( not ( = ?auto_532642 ?auto_532643 ) ) ( not ( = ?auto_532642 ?auto_532644 ) ) ( not ( = ?auto_532642 ?auto_532645 ) ) ( not ( = ?auto_532642 ?auto_532646 ) ) ( not ( = ?auto_532642 ?auto_532647 ) ) ( not ( = ?auto_532642 ?auto_532648 ) ) ( not ( = ?auto_532642 ?auto_532649 ) ) ( not ( = ?auto_532642 ?auto_532650 ) ) ( not ( = ?auto_532642 ?auto_532651 ) ) ( not ( = ?auto_532642 ?auto_532652 ) ) ( not ( = ?auto_532643 ?auto_532644 ) ) ( not ( = ?auto_532643 ?auto_532645 ) ) ( not ( = ?auto_532643 ?auto_532646 ) ) ( not ( = ?auto_532643 ?auto_532647 ) ) ( not ( = ?auto_532643 ?auto_532648 ) ) ( not ( = ?auto_532643 ?auto_532649 ) ) ( not ( = ?auto_532643 ?auto_532650 ) ) ( not ( = ?auto_532643 ?auto_532651 ) ) ( not ( = ?auto_532643 ?auto_532652 ) ) ( not ( = ?auto_532644 ?auto_532645 ) ) ( not ( = ?auto_532644 ?auto_532646 ) ) ( not ( = ?auto_532644 ?auto_532647 ) ) ( not ( = ?auto_532644 ?auto_532648 ) ) ( not ( = ?auto_532644 ?auto_532649 ) ) ( not ( = ?auto_532644 ?auto_532650 ) ) ( not ( = ?auto_532644 ?auto_532651 ) ) ( not ( = ?auto_532644 ?auto_532652 ) ) ( not ( = ?auto_532645 ?auto_532646 ) ) ( not ( = ?auto_532645 ?auto_532647 ) ) ( not ( = ?auto_532645 ?auto_532648 ) ) ( not ( = ?auto_532645 ?auto_532649 ) ) ( not ( = ?auto_532645 ?auto_532650 ) ) ( not ( = ?auto_532645 ?auto_532651 ) ) ( not ( = ?auto_532645 ?auto_532652 ) ) ( not ( = ?auto_532646 ?auto_532647 ) ) ( not ( = ?auto_532646 ?auto_532648 ) ) ( not ( = ?auto_532646 ?auto_532649 ) ) ( not ( = ?auto_532646 ?auto_532650 ) ) ( not ( = ?auto_532646 ?auto_532651 ) ) ( not ( = ?auto_532646 ?auto_532652 ) ) ( not ( = ?auto_532647 ?auto_532648 ) ) ( not ( = ?auto_532647 ?auto_532649 ) ) ( not ( = ?auto_532647 ?auto_532650 ) ) ( not ( = ?auto_532647 ?auto_532651 ) ) ( not ( = ?auto_532647 ?auto_532652 ) ) ( not ( = ?auto_532648 ?auto_532649 ) ) ( not ( = ?auto_532648 ?auto_532650 ) ) ( not ( = ?auto_532648 ?auto_532651 ) ) ( not ( = ?auto_532648 ?auto_532652 ) ) ( not ( = ?auto_532649 ?auto_532650 ) ) ( not ( = ?auto_532649 ?auto_532651 ) ) ( not ( = ?auto_532649 ?auto_532652 ) ) ( not ( = ?auto_532650 ?auto_532651 ) ) ( not ( = ?auto_532650 ?auto_532652 ) ) ( not ( = ?auto_532651 ?auto_532652 ) ) ( ON ?auto_532650 ?auto_532651 ) ( ON ?auto_532649 ?auto_532650 ) ( ON ?auto_532648 ?auto_532649 ) ( ON ?auto_532647 ?auto_532648 ) ( ON ?auto_532646 ?auto_532647 ) ( ON ?auto_532645 ?auto_532646 ) ( ON ?auto_532644 ?auto_532645 ) ( ON ?auto_532643 ?auto_532644 ) ( ON ?auto_532642 ?auto_532643 ) ( ON ?auto_532641 ?auto_532642 ) ( CLEAR ?auto_532639 ) ( ON ?auto_532640 ?auto_532641 ) ( CLEAR ?auto_532640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_532637 ?auto_532638 ?auto_532639 ?auto_532640 )
      ( MAKE-15PILE ?auto_532637 ?auto_532638 ?auto_532639 ?auto_532640 ?auto_532641 ?auto_532642 ?auto_532643 ?auto_532644 ?auto_532645 ?auto_532646 ?auto_532647 ?auto_532648 ?auto_532649 ?auto_532650 ?auto_532651 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532699 - BLOCK
      ?auto_532700 - BLOCK
      ?auto_532701 - BLOCK
      ?auto_532702 - BLOCK
      ?auto_532703 - BLOCK
      ?auto_532704 - BLOCK
      ?auto_532705 - BLOCK
      ?auto_532706 - BLOCK
      ?auto_532707 - BLOCK
      ?auto_532708 - BLOCK
      ?auto_532709 - BLOCK
      ?auto_532710 - BLOCK
      ?auto_532711 - BLOCK
      ?auto_532712 - BLOCK
      ?auto_532713 - BLOCK
    )
    :vars
    (
      ?auto_532714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532713 ?auto_532714 ) ( ON-TABLE ?auto_532699 ) ( ON ?auto_532700 ?auto_532699 ) ( not ( = ?auto_532699 ?auto_532700 ) ) ( not ( = ?auto_532699 ?auto_532701 ) ) ( not ( = ?auto_532699 ?auto_532702 ) ) ( not ( = ?auto_532699 ?auto_532703 ) ) ( not ( = ?auto_532699 ?auto_532704 ) ) ( not ( = ?auto_532699 ?auto_532705 ) ) ( not ( = ?auto_532699 ?auto_532706 ) ) ( not ( = ?auto_532699 ?auto_532707 ) ) ( not ( = ?auto_532699 ?auto_532708 ) ) ( not ( = ?auto_532699 ?auto_532709 ) ) ( not ( = ?auto_532699 ?auto_532710 ) ) ( not ( = ?auto_532699 ?auto_532711 ) ) ( not ( = ?auto_532699 ?auto_532712 ) ) ( not ( = ?auto_532699 ?auto_532713 ) ) ( not ( = ?auto_532699 ?auto_532714 ) ) ( not ( = ?auto_532700 ?auto_532701 ) ) ( not ( = ?auto_532700 ?auto_532702 ) ) ( not ( = ?auto_532700 ?auto_532703 ) ) ( not ( = ?auto_532700 ?auto_532704 ) ) ( not ( = ?auto_532700 ?auto_532705 ) ) ( not ( = ?auto_532700 ?auto_532706 ) ) ( not ( = ?auto_532700 ?auto_532707 ) ) ( not ( = ?auto_532700 ?auto_532708 ) ) ( not ( = ?auto_532700 ?auto_532709 ) ) ( not ( = ?auto_532700 ?auto_532710 ) ) ( not ( = ?auto_532700 ?auto_532711 ) ) ( not ( = ?auto_532700 ?auto_532712 ) ) ( not ( = ?auto_532700 ?auto_532713 ) ) ( not ( = ?auto_532700 ?auto_532714 ) ) ( not ( = ?auto_532701 ?auto_532702 ) ) ( not ( = ?auto_532701 ?auto_532703 ) ) ( not ( = ?auto_532701 ?auto_532704 ) ) ( not ( = ?auto_532701 ?auto_532705 ) ) ( not ( = ?auto_532701 ?auto_532706 ) ) ( not ( = ?auto_532701 ?auto_532707 ) ) ( not ( = ?auto_532701 ?auto_532708 ) ) ( not ( = ?auto_532701 ?auto_532709 ) ) ( not ( = ?auto_532701 ?auto_532710 ) ) ( not ( = ?auto_532701 ?auto_532711 ) ) ( not ( = ?auto_532701 ?auto_532712 ) ) ( not ( = ?auto_532701 ?auto_532713 ) ) ( not ( = ?auto_532701 ?auto_532714 ) ) ( not ( = ?auto_532702 ?auto_532703 ) ) ( not ( = ?auto_532702 ?auto_532704 ) ) ( not ( = ?auto_532702 ?auto_532705 ) ) ( not ( = ?auto_532702 ?auto_532706 ) ) ( not ( = ?auto_532702 ?auto_532707 ) ) ( not ( = ?auto_532702 ?auto_532708 ) ) ( not ( = ?auto_532702 ?auto_532709 ) ) ( not ( = ?auto_532702 ?auto_532710 ) ) ( not ( = ?auto_532702 ?auto_532711 ) ) ( not ( = ?auto_532702 ?auto_532712 ) ) ( not ( = ?auto_532702 ?auto_532713 ) ) ( not ( = ?auto_532702 ?auto_532714 ) ) ( not ( = ?auto_532703 ?auto_532704 ) ) ( not ( = ?auto_532703 ?auto_532705 ) ) ( not ( = ?auto_532703 ?auto_532706 ) ) ( not ( = ?auto_532703 ?auto_532707 ) ) ( not ( = ?auto_532703 ?auto_532708 ) ) ( not ( = ?auto_532703 ?auto_532709 ) ) ( not ( = ?auto_532703 ?auto_532710 ) ) ( not ( = ?auto_532703 ?auto_532711 ) ) ( not ( = ?auto_532703 ?auto_532712 ) ) ( not ( = ?auto_532703 ?auto_532713 ) ) ( not ( = ?auto_532703 ?auto_532714 ) ) ( not ( = ?auto_532704 ?auto_532705 ) ) ( not ( = ?auto_532704 ?auto_532706 ) ) ( not ( = ?auto_532704 ?auto_532707 ) ) ( not ( = ?auto_532704 ?auto_532708 ) ) ( not ( = ?auto_532704 ?auto_532709 ) ) ( not ( = ?auto_532704 ?auto_532710 ) ) ( not ( = ?auto_532704 ?auto_532711 ) ) ( not ( = ?auto_532704 ?auto_532712 ) ) ( not ( = ?auto_532704 ?auto_532713 ) ) ( not ( = ?auto_532704 ?auto_532714 ) ) ( not ( = ?auto_532705 ?auto_532706 ) ) ( not ( = ?auto_532705 ?auto_532707 ) ) ( not ( = ?auto_532705 ?auto_532708 ) ) ( not ( = ?auto_532705 ?auto_532709 ) ) ( not ( = ?auto_532705 ?auto_532710 ) ) ( not ( = ?auto_532705 ?auto_532711 ) ) ( not ( = ?auto_532705 ?auto_532712 ) ) ( not ( = ?auto_532705 ?auto_532713 ) ) ( not ( = ?auto_532705 ?auto_532714 ) ) ( not ( = ?auto_532706 ?auto_532707 ) ) ( not ( = ?auto_532706 ?auto_532708 ) ) ( not ( = ?auto_532706 ?auto_532709 ) ) ( not ( = ?auto_532706 ?auto_532710 ) ) ( not ( = ?auto_532706 ?auto_532711 ) ) ( not ( = ?auto_532706 ?auto_532712 ) ) ( not ( = ?auto_532706 ?auto_532713 ) ) ( not ( = ?auto_532706 ?auto_532714 ) ) ( not ( = ?auto_532707 ?auto_532708 ) ) ( not ( = ?auto_532707 ?auto_532709 ) ) ( not ( = ?auto_532707 ?auto_532710 ) ) ( not ( = ?auto_532707 ?auto_532711 ) ) ( not ( = ?auto_532707 ?auto_532712 ) ) ( not ( = ?auto_532707 ?auto_532713 ) ) ( not ( = ?auto_532707 ?auto_532714 ) ) ( not ( = ?auto_532708 ?auto_532709 ) ) ( not ( = ?auto_532708 ?auto_532710 ) ) ( not ( = ?auto_532708 ?auto_532711 ) ) ( not ( = ?auto_532708 ?auto_532712 ) ) ( not ( = ?auto_532708 ?auto_532713 ) ) ( not ( = ?auto_532708 ?auto_532714 ) ) ( not ( = ?auto_532709 ?auto_532710 ) ) ( not ( = ?auto_532709 ?auto_532711 ) ) ( not ( = ?auto_532709 ?auto_532712 ) ) ( not ( = ?auto_532709 ?auto_532713 ) ) ( not ( = ?auto_532709 ?auto_532714 ) ) ( not ( = ?auto_532710 ?auto_532711 ) ) ( not ( = ?auto_532710 ?auto_532712 ) ) ( not ( = ?auto_532710 ?auto_532713 ) ) ( not ( = ?auto_532710 ?auto_532714 ) ) ( not ( = ?auto_532711 ?auto_532712 ) ) ( not ( = ?auto_532711 ?auto_532713 ) ) ( not ( = ?auto_532711 ?auto_532714 ) ) ( not ( = ?auto_532712 ?auto_532713 ) ) ( not ( = ?auto_532712 ?auto_532714 ) ) ( not ( = ?auto_532713 ?auto_532714 ) ) ( ON ?auto_532712 ?auto_532713 ) ( ON ?auto_532711 ?auto_532712 ) ( ON ?auto_532710 ?auto_532711 ) ( ON ?auto_532709 ?auto_532710 ) ( ON ?auto_532708 ?auto_532709 ) ( ON ?auto_532707 ?auto_532708 ) ( ON ?auto_532706 ?auto_532707 ) ( ON ?auto_532705 ?auto_532706 ) ( ON ?auto_532704 ?auto_532705 ) ( ON ?auto_532703 ?auto_532704 ) ( ON ?auto_532702 ?auto_532703 ) ( CLEAR ?auto_532700 ) ( ON ?auto_532701 ?auto_532702 ) ( CLEAR ?auto_532701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_532699 ?auto_532700 ?auto_532701 )
      ( MAKE-15PILE ?auto_532699 ?auto_532700 ?auto_532701 ?auto_532702 ?auto_532703 ?auto_532704 ?auto_532705 ?auto_532706 ?auto_532707 ?auto_532708 ?auto_532709 ?auto_532710 ?auto_532711 ?auto_532712 ?auto_532713 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532761 - BLOCK
      ?auto_532762 - BLOCK
      ?auto_532763 - BLOCK
      ?auto_532764 - BLOCK
      ?auto_532765 - BLOCK
      ?auto_532766 - BLOCK
      ?auto_532767 - BLOCK
      ?auto_532768 - BLOCK
      ?auto_532769 - BLOCK
      ?auto_532770 - BLOCK
      ?auto_532771 - BLOCK
      ?auto_532772 - BLOCK
      ?auto_532773 - BLOCK
      ?auto_532774 - BLOCK
      ?auto_532775 - BLOCK
    )
    :vars
    (
      ?auto_532776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532775 ?auto_532776 ) ( ON-TABLE ?auto_532761 ) ( not ( = ?auto_532761 ?auto_532762 ) ) ( not ( = ?auto_532761 ?auto_532763 ) ) ( not ( = ?auto_532761 ?auto_532764 ) ) ( not ( = ?auto_532761 ?auto_532765 ) ) ( not ( = ?auto_532761 ?auto_532766 ) ) ( not ( = ?auto_532761 ?auto_532767 ) ) ( not ( = ?auto_532761 ?auto_532768 ) ) ( not ( = ?auto_532761 ?auto_532769 ) ) ( not ( = ?auto_532761 ?auto_532770 ) ) ( not ( = ?auto_532761 ?auto_532771 ) ) ( not ( = ?auto_532761 ?auto_532772 ) ) ( not ( = ?auto_532761 ?auto_532773 ) ) ( not ( = ?auto_532761 ?auto_532774 ) ) ( not ( = ?auto_532761 ?auto_532775 ) ) ( not ( = ?auto_532761 ?auto_532776 ) ) ( not ( = ?auto_532762 ?auto_532763 ) ) ( not ( = ?auto_532762 ?auto_532764 ) ) ( not ( = ?auto_532762 ?auto_532765 ) ) ( not ( = ?auto_532762 ?auto_532766 ) ) ( not ( = ?auto_532762 ?auto_532767 ) ) ( not ( = ?auto_532762 ?auto_532768 ) ) ( not ( = ?auto_532762 ?auto_532769 ) ) ( not ( = ?auto_532762 ?auto_532770 ) ) ( not ( = ?auto_532762 ?auto_532771 ) ) ( not ( = ?auto_532762 ?auto_532772 ) ) ( not ( = ?auto_532762 ?auto_532773 ) ) ( not ( = ?auto_532762 ?auto_532774 ) ) ( not ( = ?auto_532762 ?auto_532775 ) ) ( not ( = ?auto_532762 ?auto_532776 ) ) ( not ( = ?auto_532763 ?auto_532764 ) ) ( not ( = ?auto_532763 ?auto_532765 ) ) ( not ( = ?auto_532763 ?auto_532766 ) ) ( not ( = ?auto_532763 ?auto_532767 ) ) ( not ( = ?auto_532763 ?auto_532768 ) ) ( not ( = ?auto_532763 ?auto_532769 ) ) ( not ( = ?auto_532763 ?auto_532770 ) ) ( not ( = ?auto_532763 ?auto_532771 ) ) ( not ( = ?auto_532763 ?auto_532772 ) ) ( not ( = ?auto_532763 ?auto_532773 ) ) ( not ( = ?auto_532763 ?auto_532774 ) ) ( not ( = ?auto_532763 ?auto_532775 ) ) ( not ( = ?auto_532763 ?auto_532776 ) ) ( not ( = ?auto_532764 ?auto_532765 ) ) ( not ( = ?auto_532764 ?auto_532766 ) ) ( not ( = ?auto_532764 ?auto_532767 ) ) ( not ( = ?auto_532764 ?auto_532768 ) ) ( not ( = ?auto_532764 ?auto_532769 ) ) ( not ( = ?auto_532764 ?auto_532770 ) ) ( not ( = ?auto_532764 ?auto_532771 ) ) ( not ( = ?auto_532764 ?auto_532772 ) ) ( not ( = ?auto_532764 ?auto_532773 ) ) ( not ( = ?auto_532764 ?auto_532774 ) ) ( not ( = ?auto_532764 ?auto_532775 ) ) ( not ( = ?auto_532764 ?auto_532776 ) ) ( not ( = ?auto_532765 ?auto_532766 ) ) ( not ( = ?auto_532765 ?auto_532767 ) ) ( not ( = ?auto_532765 ?auto_532768 ) ) ( not ( = ?auto_532765 ?auto_532769 ) ) ( not ( = ?auto_532765 ?auto_532770 ) ) ( not ( = ?auto_532765 ?auto_532771 ) ) ( not ( = ?auto_532765 ?auto_532772 ) ) ( not ( = ?auto_532765 ?auto_532773 ) ) ( not ( = ?auto_532765 ?auto_532774 ) ) ( not ( = ?auto_532765 ?auto_532775 ) ) ( not ( = ?auto_532765 ?auto_532776 ) ) ( not ( = ?auto_532766 ?auto_532767 ) ) ( not ( = ?auto_532766 ?auto_532768 ) ) ( not ( = ?auto_532766 ?auto_532769 ) ) ( not ( = ?auto_532766 ?auto_532770 ) ) ( not ( = ?auto_532766 ?auto_532771 ) ) ( not ( = ?auto_532766 ?auto_532772 ) ) ( not ( = ?auto_532766 ?auto_532773 ) ) ( not ( = ?auto_532766 ?auto_532774 ) ) ( not ( = ?auto_532766 ?auto_532775 ) ) ( not ( = ?auto_532766 ?auto_532776 ) ) ( not ( = ?auto_532767 ?auto_532768 ) ) ( not ( = ?auto_532767 ?auto_532769 ) ) ( not ( = ?auto_532767 ?auto_532770 ) ) ( not ( = ?auto_532767 ?auto_532771 ) ) ( not ( = ?auto_532767 ?auto_532772 ) ) ( not ( = ?auto_532767 ?auto_532773 ) ) ( not ( = ?auto_532767 ?auto_532774 ) ) ( not ( = ?auto_532767 ?auto_532775 ) ) ( not ( = ?auto_532767 ?auto_532776 ) ) ( not ( = ?auto_532768 ?auto_532769 ) ) ( not ( = ?auto_532768 ?auto_532770 ) ) ( not ( = ?auto_532768 ?auto_532771 ) ) ( not ( = ?auto_532768 ?auto_532772 ) ) ( not ( = ?auto_532768 ?auto_532773 ) ) ( not ( = ?auto_532768 ?auto_532774 ) ) ( not ( = ?auto_532768 ?auto_532775 ) ) ( not ( = ?auto_532768 ?auto_532776 ) ) ( not ( = ?auto_532769 ?auto_532770 ) ) ( not ( = ?auto_532769 ?auto_532771 ) ) ( not ( = ?auto_532769 ?auto_532772 ) ) ( not ( = ?auto_532769 ?auto_532773 ) ) ( not ( = ?auto_532769 ?auto_532774 ) ) ( not ( = ?auto_532769 ?auto_532775 ) ) ( not ( = ?auto_532769 ?auto_532776 ) ) ( not ( = ?auto_532770 ?auto_532771 ) ) ( not ( = ?auto_532770 ?auto_532772 ) ) ( not ( = ?auto_532770 ?auto_532773 ) ) ( not ( = ?auto_532770 ?auto_532774 ) ) ( not ( = ?auto_532770 ?auto_532775 ) ) ( not ( = ?auto_532770 ?auto_532776 ) ) ( not ( = ?auto_532771 ?auto_532772 ) ) ( not ( = ?auto_532771 ?auto_532773 ) ) ( not ( = ?auto_532771 ?auto_532774 ) ) ( not ( = ?auto_532771 ?auto_532775 ) ) ( not ( = ?auto_532771 ?auto_532776 ) ) ( not ( = ?auto_532772 ?auto_532773 ) ) ( not ( = ?auto_532772 ?auto_532774 ) ) ( not ( = ?auto_532772 ?auto_532775 ) ) ( not ( = ?auto_532772 ?auto_532776 ) ) ( not ( = ?auto_532773 ?auto_532774 ) ) ( not ( = ?auto_532773 ?auto_532775 ) ) ( not ( = ?auto_532773 ?auto_532776 ) ) ( not ( = ?auto_532774 ?auto_532775 ) ) ( not ( = ?auto_532774 ?auto_532776 ) ) ( not ( = ?auto_532775 ?auto_532776 ) ) ( ON ?auto_532774 ?auto_532775 ) ( ON ?auto_532773 ?auto_532774 ) ( ON ?auto_532772 ?auto_532773 ) ( ON ?auto_532771 ?auto_532772 ) ( ON ?auto_532770 ?auto_532771 ) ( ON ?auto_532769 ?auto_532770 ) ( ON ?auto_532768 ?auto_532769 ) ( ON ?auto_532767 ?auto_532768 ) ( ON ?auto_532766 ?auto_532767 ) ( ON ?auto_532765 ?auto_532766 ) ( ON ?auto_532764 ?auto_532765 ) ( ON ?auto_532763 ?auto_532764 ) ( CLEAR ?auto_532761 ) ( ON ?auto_532762 ?auto_532763 ) ( CLEAR ?auto_532762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_532761 ?auto_532762 )
      ( MAKE-15PILE ?auto_532761 ?auto_532762 ?auto_532763 ?auto_532764 ?auto_532765 ?auto_532766 ?auto_532767 ?auto_532768 ?auto_532769 ?auto_532770 ?auto_532771 ?auto_532772 ?auto_532773 ?auto_532774 ?auto_532775 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_532823 - BLOCK
      ?auto_532824 - BLOCK
      ?auto_532825 - BLOCK
      ?auto_532826 - BLOCK
      ?auto_532827 - BLOCK
      ?auto_532828 - BLOCK
      ?auto_532829 - BLOCK
      ?auto_532830 - BLOCK
      ?auto_532831 - BLOCK
      ?auto_532832 - BLOCK
      ?auto_532833 - BLOCK
      ?auto_532834 - BLOCK
      ?auto_532835 - BLOCK
      ?auto_532836 - BLOCK
      ?auto_532837 - BLOCK
    )
    :vars
    (
      ?auto_532838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532837 ?auto_532838 ) ( not ( = ?auto_532823 ?auto_532824 ) ) ( not ( = ?auto_532823 ?auto_532825 ) ) ( not ( = ?auto_532823 ?auto_532826 ) ) ( not ( = ?auto_532823 ?auto_532827 ) ) ( not ( = ?auto_532823 ?auto_532828 ) ) ( not ( = ?auto_532823 ?auto_532829 ) ) ( not ( = ?auto_532823 ?auto_532830 ) ) ( not ( = ?auto_532823 ?auto_532831 ) ) ( not ( = ?auto_532823 ?auto_532832 ) ) ( not ( = ?auto_532823 ?auto_532833 ) ) ( not ( = ?auto_532823 ?auto_532834 ) ) ( not ( = ?auto_532823 ?auto_532835 ) ) ( not ( = ?auto_532823 ?auto_532836 ) ) ( not ( = ?auto_532823 ?auto_532837 ) ) ( not ( = ?auto_532823 ?auto_532838 ) ) ( not ( = ?auto_532824 ?auto_532825 ) ) ( not ( = ?auto_532824 ?auto_532826 ) ) ( not ( = ?auto_532824 ?auto_532827 ) ) ( not ( = ?auto_532824 ?auto_532828 ) ) ( not ( = ?auto_532824 ?auto_532829 ) ) ( not ( = ?auto_532824 ?auto_532830 ) ) ( not ( = ?auto_532824 ?auto_532831 ) ) ( not ( = ?auto_532824 ?auto_532832 ) ) ( not ( = ?auto_532824 ?auto_532833 ) ) ( not ( = ?auto_532824 ?auto_532834 ) ) ( not ( = ?auto_532824 ?auto_532835 ) ) ( not ( = ?auto_532824 ?auto_532836 ) ) ( not ( = ?auto_532824 ?auto_532837 ) ) ( not ( = ?auto_532824 ?auto_532838 ) ) ( not ( = ?auto_532825 ?auto_532826 ) ) ( not ( = ?auto_532825 ?auto_532827 ) ) ( not ( = ?auto_532825 ?auto_532828 ) ) ( not ( = ?auto_532825 ?auto_532829 ) ) ( not ( = ?auto_532825 ?auto_532830 ) ) ( not ( = ?auto_532825 ?auto_532831 ) ) ( not ( = ?auto_532825 ?auto_532832 ) ) ( not ( = ?auto_532825 ?auto_532833 ) ) ( not ( = ?auto_532825 ?auto_532834 ) ) ( not ( = ?auto_532825 ?auto_532835 ) ) ( not ( = ?auto_532825 ?auto_532836 ) ) ( not ( = ?auto_532825 ?auto_532837 ) ) ( not ( = ?auto_532825 ?auto_532838 ) ) ( not ( = ?auto_532826 ?auto_532827 ) ) ( not ( = ?auto_532826 ?auto_532828 ) ) ( not ( = ?auto_532826 ?auto_532829 ) ) ( not ( = ?auto_532826 ?auto_532830 ) ) ( not ( = ?auto_532826 ?auto_532831 ) ) ( not ( = ?auto_532826 ?auto_532832 ) ) ( not ( = ?auto_532826 ?auto_532833 ) ) ( not ( = ?auto_532826 ?auto_532834 ) ) ( not ( = ?auto_532826 ?auto_532835 ) ) ( not ( = ?auto_532826 ?auto_532836 ) ) ( not ( = ?auto_532826 ?auto_532837 ) ) ( not ( = ?auto_532826 ?auto_532838 ) ) ( not ( = ?auto_532827 ?auto_532828 ) ) ( not ( = ?auto_532827 ?auto_532829 ) ) ( not ( = ?auto_532827 ?auto_532830 ) ) ( not ( = ?auto_532827 ?auto_532831 ) ) ( not ( = ?auto_532827 ?auto_532832 ) ) ( not ( = ?auto_532827 ?auto_532833 ) ) ( not ( = ?auto_532827 ?auto_532834 ) ) ( not ( = ?auto_532827 ?auto_532835 ) ) ( not ( = ?auto_532827 ?auto_532836 ) ) ( not ( = ?auto_532827 ?auto_532837 ) ) ( not ( = ?auto_532827 ?auto_532838 ) ) ( not ( = ?auto_532828 ?auto_532829 ) ) ( not ( = ?auto_532828 ?auto_532830 ) ) ( not ( = ?auto_532828 ?auto_532831 ) ) ( not ( = ?auto_532828 ?auto_532832 ) ) ( not ( = ?auto_532828 ?auto_532833 ) ) ( not ( = ?auto_532828 ?auto_532834 ) ) ( not ( = ?auto_532828 ?auto_532835 ) ) ( not ( = ?auto_532828 ?auto_532836 ) ) ( not ( = ?auto_532828 ?auto_532837 ) ) ( not ( = ?auto_532828 ?auto_532838 ) ) ( not ( = ?auto_532829 ?auto_532830 ) ) ( not ( = ?auto_532829 ?auto_532831 ) ) ( not ( = ?auto_532829 ?auto_532832 ) ) ( not ( = ?auto_532829 ?auto_532833 ) ) ( not ( = ?auto_532829 ?auto_532834 ) ) ( not ( = ?auto_532829 ?auto_532835 ) ) ( not ( = ?auto_532829 ?auto_532836 ) ) ( not ( = ?auto_532829 ?auto_532837 ) ) ( not ( = ?auto_532829 ?auto_532838 ) ) ( not ( = ?auto_532830 ?auto_532831 ) ) ( not ( = ?auto_532830 ?auto_532832 ) ) ( not ( = ?auto_532830 ?auto_532833 ) ) ( not ( = ?auto_532830 ?auto_532834 ) ) ( not ( = ?auto_532830 ?auto_532835 ) ) ( not ( = ?auto_532830 ?auto_532836 ) ) ( not ( = ?auto_532830 ?auto_532837 ) ) ( not ( = ?auto_532830 ?auto_532838 ) ) ( not ( = ?auto_532831 ?auto_532832 ) ) ( not ( = ?auto_532831 ?auto_532833 ) ) ( not ( = ?auto_532831 ?auto_532834 ) ) ( not ( = ?auto_532831 ?auto_532835 ) ) ( not ( = ?auto_532831 ?auto_532836 ) ) ( not ( = ?auto_532831 ?auto_532837 ) ) ( not ( = ?auto_532831 ?auto_532838 ) ) ( not ( = ?auto_532832 ?auto_532833 ) ) ( not ( = ?auto_532832 ?auto_532834 ) ) ( not ( = ?auto_532832 ?auto_532835 ) ) ( not ( = ?auto_532832 ?auto_532836 ) ) ( not ( = ?auto_532832 ?auto_532837 ) ) ( not ( = ?auto_532832 ?auto_532838 ) ) ( not ( = ?auto_532833 ?auto_532834 ) ) ( not ( = ?auto_532833 ?auto_532835 ) ) ( not ( = ?auto_532833 ?auto_532836 ) ) ( not ( = ?auto_532833 ?auto_532837 ) ) ( not ( = ?auto_532833 ?auto_532838 ) ) ( not ( = ?auto_532834 ?auto_532835 ) ) ( not ( = ?auto_532834 ?auto_532836 ) ) ( not ( = ?auto_532834 ?auto_532837 ) ) ( not ( = ?auto_532834 ?auto_532838 ) ) ( not ( = ?auto_532835 ?auto_532836 ) ) ( not ( = ?auto_532835 ?auto_532837 ) ) ( not ( = ?auto_532835 ?auto_532838 ) ) ( not ( = ?auto_532836 ?auto_532837 ) ) ( not ( = ?auto_532836 ?auto_532838 ) ) ( not ( = ?auto_532837 ?auto_532838 ) ) ( ON ?auto_532836 ?auto_532837 ) ( ON ?auto_532835 ?auto_532836 ) ( ON ?auto_532834 ?auto_532835 ) ( ON ?auto_532833 ?auto_532834 ) ( ON ?auto_532832 ?auto_532833 ) ( ON ?auto_532831 ?auto_532832 ) ( ON ?auto_532830 ?auto_532831 ) ( ON ?auto_532829 ?auto_532830 ) ( ON ?auto_532828 ?auto_532829 ) ( ON ?auto_532827 ?auto_532828 ) ( ON ?auto_532826 ?auto_532827 ) ( ON ?auto_532825 ?auto_532826 ) ( ON ?auto_532824 ?auto_532825 ) ( ON ?auto_532823 ?auto_532824 ) ( CLEAR ?auto_532823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_532823 )
      ( MAKE-15PILE ?auto_532823 ?auto_532824 ?auto_532825 ?auto_532826 ?auto_532827 ?auto_532828 ?auto_532829 ?auto_532830 ?auto_532831 ?auto_532832 ?auto_532833 ?auto_532834 ?auto_532835 ?auto_532836 ?auto_532837 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_532886 - BLOCK
      ?auto_532887 - BLOCK
      ?auto_532888 - BLOCK
      ?auto_532889 - BLOCK
      ?auto_532890 - BLOCK
      ?auto_532891 - BLOCK
      ?auto_532892 - BLOCK
      ?auto_532893 - BLOCK
      ?auto_532894 - BLOCK
      ?auto_532895 - BLOCK
      ?auto_532896 - BLOCK
      ?auto_532897 - BLOCK
      ?auto_532898 - BLOCK
      ?auto_532899 - BLOCK
      ?auto_532900 - BLOCK
      ?auto_532901 - BLOCK
    )
    :vars
    (
      ?auto_532902 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_532900 ) ( ON ?auto_532901 ?auto_532902 ) ( CLEAR ?auto_532901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_532886 ) ( ON ?auto_532887 ?auto_532886 ) ( ON ?auto_532888 ?auto_532887 ) ( ON ?auto_532889 ?auto_532888 ) ( ON ?auto_532890 ?auto_532889 ) ( ON ?auto_532891 ?auto_532890 ) ( ON ?auto_532892 ?auto_532891 ) ( ON ?auto_532893 ?auto_532892 ) ( ON ?auto_532894 ?auto_532893 ) ( ON ?auto_532895 ?auto_532894 ) ( ON ?auto_532896 ?auto_532895 ) ( ON ?auto_532897 ?auto_532896 ) ( ON ?auto_532898 ?auto_532897 ) ( ON ?auto_532899 ?auto_532898 ) ( ON ?auto_532900 ?auto_532899 ) ( not ( = ?auto_532886 ?auto_532887 ) ) ( not ( = ?auto_532886 ?auto_532888 ) ) ( not ( = ?auto_532886 ?auto_532889 ) ) ( not ( = ?auto_532886 ?auto_532890 ) ) ( not ( = ?auto_532886 ?auto_532891 ) ) ( not ( = ?auto_532886 ?auto_532892 ) ) ( not ( = ?auto_532886 ?auto_532893 ) ) ( not ( = ?auto_532886 ?auto_532894 ) ) ( not ( = ?auto_532886 ?auto_532895 ) ) ( not ( = ?auto_532886 ?auto_532896 ) ) ( not ( = ?auto_532886 ?auto_532897 ) ) ( not ( = ?auto_532886 ?auto_532898 ) ) ( not ( = ?auto_532886 ?auto_532899 ) ) ( not ( = ?auto_532886 ?auto_532900 ) ) ( not ( = ?auto_532886 ?auto_532901 ) ) ( not ( = ?auto_532886 ?auto_532902 ) ) ( not ( = ?auto_532887 ?auto_532888 ) ) ( not ( = ?auto_532887 ?auto_532889 ) ) ( not ( = ?auto_532887 ?auto_532890 ) ) ( not ( = ?auto_532887 ?auto_532891 ) ) ( not ( = ?auto_532887 ?auto_532892 ) ) ( not ( = ?auto_532887 ?auto_532893 ) ) ( not ( = ?auto_532887 ?auto_532894 ) ) ( not ( = ?auto_532887 ?auto_532895 ) ) ( not ( = ?auto_532887 ?auto_532896 ) ) ( not ( = ?auto_532887 ?auto_532897 ) ) ( not ( = ?auto_532887 ?auto_532898 ) ) ( not ( = ?auto_532887 ?auto_532899 ) ) ( not ( = ?auto_532887 ?auto_532900 ) ) ( not ( = ?auto_532887 ?auto_532901 ) ) ( not ( = ?auto_532887 ?auto_532902 ) ) ( not ( = ?auto_532888 ?auto_532889 ) ) ( not ( = ?auto_532888 ?auto_532890 ) ) ( not ( = ?auto_532888 ?auto_532891 ) ) ( not ( = ?auto_532888 ?auto_532892 ) ) ( not ( = ?auto_532888 ?auto_532893 ) ) ( not ( = ?auto_532888 ?auto_532894 ) ) ( not ( = ?auto_532888 ?auto_532895 ) ) ( not ( = ?auto_532888 ?auto_532896 ) ) ( not ( = ?auto_532888 ?auto_532897 ) ) ( not ( = ?auto_532888 ?auto_532898 ) ) ( not ( = ?auto_532888 ?auto_532899 ) ) ( not ( = ?auto_532888 ?auto_532900 ) ) ( not ( = ?auto_532888 ?auto_532901 ) ) ( not ( = ?auto_532888 ?auto_532902 ) ) ( not ( = ?auto_532889 ?auto_532890 ) ) ( not ( = ?auto_532889 ?auto_532891 ) ) ( not ( = ?auto_532889 ?auto_532892 ) ) ( not ( = ?auto_532889 ?auto_532893 ) ) ( not ( = ?auto_532889 ?auto_532894 ) ) ( not ( = ?auto_532889 ?auto_532895 ) ) ( not ( = ?auto_532889 ?auto_532896 ) ) ( not ( = ?auto_532889 ?auto_532897 ) ) ( not ( = ?auto_532889 ?auto_532898 ) ) ( not ( = ?auto_532889 ?auto_532899 ) ) ( not ( = ?auto_532889 ?auto_532900 ) ) ( not ( = ?auto_532889 ?auto_532901 ) ) ( not ( = ?auto_532889 ?auto_532902 ) ) ( not ( = ?auto_532890 ?auto_532891 ) ) ( not ( = ?auto_532890 ?auto_532892 ) ) ( not ( = ?auto_532890 ?auto_532893 ) ) ( not ( = ?auto_532890 ?auto_532894 ) ) ( not ( = ?auto_532890 ?auto_532895 ) ) ( not ( = ?auto_532890 ?auto_532896 ) ) ( not ( = ?auto_532890 ?auto_532897 ) ) ( not ( = ?auto_532890 ?auto_532898 ) ) ( not ( = ?auto_532890 ?auto_532899 ) ) ( not ( = ?auto_532890 ?auto_532900 ) ) ( not ( = ?auto_532890 ?auto_532901 ) ) ( not ( = ?auto_532890 ?auto_532902 ) ) ( not ( = ?auto_532891 ?auto_532892 ) ) ( not ( = ?auto_532891 ?auto_532893 ) ) ( not ( = ?auto_532891 ?auto_532894 ) ) ( not ( = ?auto_532891 ?auto_532895 ) ) ( not ( = ?auto_532891 ?auto_532896 ) ) ( not ( = ?auto_532891 ?auto_532897 ) ) ( not ( = ?auto_532891 ?auto_532898 ) ) ( not ( = ?auto_532891 ?auto_532899 ) ) ( not ( = ?auto_532891 ?auto_532900 ) ) ( not ( = ?auto_532891 ?auto_532901 ) ) ( not ( = ?auto_532891 ?auto_532902 ) ) ( not ( = ?auto_532892 ?auto_532893 ) ) ( not ( = ?auto_532892 ?auto_532894 ) ) ( not ( = ?auto_532892 ?auto_532895 ) ) ( not ( = ?auto_532892 ?auto_532896 ) ) ( not ( = ?auto_532892 ?auto_532897 ) ) ( not ( = ?auto_532892 ?auto_532898 ) ) ( not ( = ?auto_532892 ?auto_532899 ) ) ( not ( = ?auto_532892 ?auto_532900 ) ) ( not ( = ?auto_532892 ?auto_532901 ) ) ( not ( = ?auto_532892 ?auto_532902 ) ) ( not ( = ?auto_532893 ?auto_532894 ) ) ( not ( = ?auto_532893 ?auto_532895 ) ) ( not ( = ?auto_532893 ?auto_532896 ) ) ( not ( = ?auto_532893 ?auto_532897 ) ) ( not ( = ?auto_532893 ?auto_532898 ) ) ( not ( = ?auto_532893 ?auto_532899 ) ) ( not ( = ?auto_532893 ?auto_532900 ) ) ( not ( = ?auto_532893 ?auto_532901 ) ) ( not ( = ?auto_532893 ?auto_532902 ) ) ( not ( = ?auto_532894 ?auto_532895 ) ) ( not ( = ?auto_532894 ?auto_532896 ) ) ( not ( = ?auto_532894 ?auto_532897 ) ) ( not ( = ?auto_532894 ?auto_532898 ) ) ( not ( = ?auto_532894 ?auto_532899 ) ) ( not ( = ?auto_532894 ?auto_532900 ) ) ( not ( = ?auto_532894 ?auto_532901 ) ) ( not ( = ?auto_532894 ?auto_532902 ) ) ( not ( = ?auto_532895 ?auto_532896 ) ) ( not ( = ?auto_532895 ?auto_532897 ) ) ( not ( = ?auto_532895 ?auto_532898 ) ) ( not ( = ?auto_532895 ?auto_532899 ) ) ( not ( = ?auto_532895 ?auto_532900 ) ) ( not ( = ?auto_532895 ?auto_532901 ) ) ( not ( = ?auto_532895 ?auto_532902 ) ) ( not ( = ?auto_532896 ?auto_532897 ) ) ( not ( = ?auto_532896 ?auto_532898 ) ) ( not ( = ?auto_532896 ?auto_532899 ) ) ( not ( = ?auto_532896 ?auto_532900 ) ) ( not ( = ?auto_532896 ?auto_532901 ) ) ( not ( = ?auto_532896 ?auto_532902 ) ) ( not ( = ?auto_532897 ?auto_532898 ) ) ( not ( = ?auto_532897 ?auto_532899 ) ) ( not ( = ?auto_532897 ?auto_532900 ) ) ( not ( = ?auto_532897 ?auto_532901 ) ) ( not ( = ?auto_532897 ?auto_532902 ) ) ( not ( = ?auto_532898 ?auto_532899 ) ) ( not ( = ?auto_532898 ?auto_532900 ) ) ( not ( = ?auto_532898 ?auto_532901 ) ) ( not ( = ?auto_532898 ?auto_532902 ) ) ( not ( = ?auto_532899 ?auto_532900 ) ) ( not ( = ?auto_532899 ?auto_532901 ) ) ( not ( = ?auto_532899 ?auto_532902 ) ) ( not ( = ?auto_532900 ?auto_532901 ) ) ( not ( = ?auto_532900 ?auto_532902 ) ) ( not ( = ?auto_532901 ?auto_532902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_532901 ?auto_532902 )
      ( !STACK ?auto_532901 ?auto_532900 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_532919 - BLOCK
      ?auto_532920 - BLOCK
      ?auto_532921 - BLOCK
      ?auto_532922 - BLOCK
      ?auto_532923 - BLOCK
      ?auto_532924 - BLOCK
      ?auto_532925 - BLOCK
      ?auto_532926 - BLOCK
      ?auto_532927 - BLOCK
      ?auto_532928 - BLOCK
      ?auto_532929 - BLOCK
      ?auto_532930 - BLOCK
      ?auto_532931 - BLOCK
      ?auto_532932 - BLOCK
      ?auto_532933 - BLOCK
      ?auto_532934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_532933 ) ( ON-TABLE ?auto_532934 ) ( CLEAR ?auto_532934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_532919 ) ( ON ?auto_532920 ?auto_532919 ) ( ON ?auto_532921 ?auto_532920 ) ( ON ?auto_532922 ?auto_532921 ) ( ON ?auto_532923 ?auto_532922 ) ( ON ?auto_532924 ?auto_532923 ) ( ON ?auto_532925 ?auto_532924 ) ( ON ?auto_532926 ?auto_532925 ) ( ON ?auto_532927 ?auto_532926 ) ( ON ?auto_532928 ?auto_532927 ) ( ON ?auto_532929 ?auto_532928 ) ( ON ?auto_532930 ?auto_532929 ) ( ON ?auto_532931 ?auto_532930 ) ( ON ?auto_532932 ?auto_532931 ) ( ON ?auto_532933 ?auto_532932 ) ( not ( = ?auto_532919 ?auto_532920 ) ) ( not ( = ?auto_532919 ?auto_532921 ) ) ( not ( = ?auto_532919 ?auto_532922 ) ) ( not ( = ?auto_532919 ?auto_532923 ) ) ( not ( = ?auto_532919 ?auto_532924 ) ) ( not ( = ?auto_532919 ?auto_532925 ) ) ( not ( = ?auto_532919 ?auto_532926 ) ) ( not ( = ?auto_532919 ?auto_532927 ) ) ( not ( = ?auto_532919 ?auto_532928 ) ) ( not ( = ?auto_532919 ?auto_532929 ) ) ( not ( = ?auto_532919 ?auto_532930 ) ) ( not ( = ?auto_532919 ?auto_532931 ) ) ( not ( = ?auto_532919 ?auto_532932 ) ) ( not ( = ?auto_532919 ?auto_532933 ) ) ( not ( = ?auto_532919 ?auto_532934 ) ) ( not ( = ?auto_532920 ?auto_532921 ) ) ( not ( = ?auto_532920 ?auto_532922 ) ) ( not ( = ?auto_532920 ?auto_532923 ) ) ( not ( = ?auto_532920 ?auto_532924 ) ) ( not ( = ?auto_532920 ?auto_532925 ) ) ( not ( = ?auto_532920 ?auto_532926 ) ) ( not ( = ?auto_532920 ?auto_532927 ) ) ( not ( = ?auto_532920 ?auto_532928 ) ) ( not ( = ?auto_532920 ?auto_532929 ) ) ( not ( = ?auto_532920 ?auto_532930 ) ) ( not ( = ?auto_532920 ?auto_532931 ) ) ( not ( = ?auto_532920 ?auto_532932 ) ) ( not ( = ?auto_532920 ?auto_532933 ) ) ( not ( = ?auto_532920 ?auto_532934 ) ) ( not ( = ?auto_532921 ?auto_532922 ) ) ( not ( = ?auto_532921 ?auto_532923 ) ) ( not ( = ?auto_532921 ?auto_532924 ) ) ( not ( = ?auto_532921 ?auto_532925 ) ) ( not ( = ?auto_532921 ?auto_532926 ) ) ( not ( = ?auto_532921 ?auto_532927 ) ) ( not ( = ?auto_532921 ?auto_532928 ) ) ( not ( = ?auto_532921 ?auto_532929 ) ) ( not ( = ?auto_532921 ?auto_532930 ) ) ( not ( = ?auto_532921 ?auto_532931 ) ) ( not ( = ?auto_532921 ?auto_532932 ) ) ( not ( = ?auto_532921 ?auto_532933 ) ) ( not ( = ?auto_532921 ?auto_532934 ) ) ( not ( = ?auto_532922 ?auto_532923 ) ) ( not ( = ?auto_532922 ?auto_532924 ) ) ( not ( = ?auto_532922 ?auto_532925 ) ) ( not ( = ?auto_532922 ?auto_532926 ) ) ( not ( = ?auto_532922 ?auto_532927 ) ) ( not ( = ?auto_532922 ?auto_532928 ) ) ( not ( = ?auto_532922 ?auto_532929 ) ) ( not ( = ?auto_532922 ?auto_532930 ) ) ( not ( = ?auto_532922 ?auto_532931 ) ) ( not ( = ?auto_532922 ?auto_532932 ) ) ( not ( = ?auto_532922 ?auto_532933 ) ) ( not ( = ?auto_532922 ?auto_532934 ) ) ( not ( = ?auto_532923 ?auto_532924 ) ) ( not ( = ?auto_532923 ?auto_532925 ) ) ( not ( = ?auto_532923 ?auto_532926 ) ) ( not ( = ?auto_532923 ?auto_532927 ) ) ( not ( = ?auto_532923 ?auto_532928 ) ) ( not ( = ?auto_532923 ?auto_532929 ) ) ( not ( = ?auto_532923 ?auto_532930 ) ) ( not ( = ?auto_532923 ?auto_532931 ) ) ( not ( = ?auto_532923 ?auto_532932 ) ) ( not ( = ?auto_532923 ?auto_532933 ) ) ( not ( = ?auto_532923 ?auto_532934 ) ) ( not ( = ?auto_532924 ?auto_532925 ) ) ( not ( = ?auto_532924 ?auto_532926 ) ) ( not ( = ?auto_532924 ?auto_532927 ) ) ( not ( = ?auto_532924 ?auto_532928 ) ) ( not ( = ?auto_532924 ?auto_532929 ) ) ( not ( = ?auto_532924 ?auto_532930 ) ) ( not ( = ?auto_532924 ?auto_532931 ) ) ( not ( = ?auto_532924 ?auto_532932 ) ) ( not ( = ?auto_532924 ?auto_532933 ) ) ( not ( = ?auto_532924 ?auto_532934 ) ) ( not ( = ?auto_532925 ?auto_532926 ) ) ( not ( = ?auto_532925 ?auto_532927 ) ) ( not ( = ?auto_532925 ?auto_532928 ) ) ( not ( = ?auto_532925 ?auto_532929 ) ) ( not ( = ?auto_532925 ?auto_532930 ) ) ( not ( = ?auto_532925 ?auto_532931 ) ) ( not ( = ?auto_532925 ?auto_532932 ) ) ( not ( = ?auto_532925 ?auto_532933 ) ) ( not ( = ?auto_532925 ?auto_532934 ) ) ( not ( = ?auto_532926 ?auto_532927 ) ) ( not ( = ?auto_532926 ?auto_532928 ) ) ( not ( = ?auto_532926 ?auto_532929 ) ) ( not ( = ?auto_532926 ?auto_532930 ) ) ( not ( = ?auto_532926 ?auto_532931 ) ) ( not ( = ?auto_532926 ?auto_532932 ) ) ( not ( = ?auto_532926 ?auto_532933 ) ) ( not ( = ?auto_532926 ?auto_532934 ) ) ( not ( = ?auto_532927 ?auto_532928 ) ) ( not ( = ?auto_532927 ?auto_532929 ) ) ( not ( = ?auto_532927 ?auto_532930 ) ) ( not ( = ?auto_532927 ?auto_532931 ) ) ( not ( = ?auto_532927 ?auto_532932 ) ) ( not ( = ?auto_532927 ?auto_532933 ) ) ( not ( = ?auto_532927 ?auto_532934 ) ) ( not ( = ?auto_532928 ?auto_532929 ) ) ( not ( = ?auto_532928 ?auto_532930 ) ) ( not ( = ?auto_532928 ?auto_532931 ) ) ( not ( = ?auto_532928 ?auto_532932 ) ) ( not ( = ?auto_532928 ?auto_532933 ) ) ( not ( = ?auto_532928 ?auto_532934 ) ) ( not ( = ?auto_532929 ?auto_532930 ) ) ( not ( = ?auto_532929 ?auto_532931 ) ) ( not ( = ?auto_532929 ?auto_532932 ) ) ( not ( = ?auto_532929 ?auto_532933 ) ) ( not ( = ?auto_532929 ?auto_532934 ) ) ( not ( = ?auto_532930 ?auto_532931 ) ) ( not ( = ?auto_532930 ?auto_532932 ) ) ( not ( = ?auto_532930 ?auto_532933 ) ) ( not ( = ?auto_532930 ?auto_532934 ) ) ( not ( = ?auto_532931 ?auto_532932 ) ) ( not ( = ?auto_532931 ?auto_532933 ) ) ( not ( = ?auto_532931 ?auto_532934 ) ) ( not ( = ?auto_532932 ?auto_532933 ) ) ( not ( = ?auto_532932 ?auto_532934 ) ) ( not ( = ?auto_532933 ?auto_532934 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_532934 )
      ( !STACK ?auto_532934 ?auto_532933 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_532951 - BLOCK
      ?auto_532952 - BLOCK
      ?auto_532953 - BLOCK
      ?auto_532954 - BLOCK
      ?auto_532955 - BLOCK
      ?auto_532956 - BLOCK
      ?auto_532957 - BLOCK
      ?auto_532958 - BLOCK
      ?auto_532959 - BLOCK
      ?auto_532960 - BLOCK
      ?auto_532961 - BLOCK
      ?auto_532962 - BLOCK
      ?auto_532963 - BLOCK
      ?auto_532964 - BLOCK
      ?auto_532965 - BLOCK
      ?auto_532966 - BLOCK
    )
    :vars
    (
      ?auto_532967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_532966 ?auto_532967 ) ( ON-TABLE ?auto_532951 ) ( ON ?auto_532952 ?auto_532951 ) ( ON ?auto_532953 ?auto_532952 ) ( ON ?auto_532954 ?auto_532953 ) ( ON ?auto_532955 ?auto_532954 ) ( ON ?auto_532956 ?auto_532955 ) ( ON ?auto_532957 ?auto_532956 ) ( ON ?auto_532958 ?auto_532957 ) ( ON ?auto_532959 ?auto_532958 ) ( ON ?auto_532960 ?auto_532959 ) ( ON ?auto_532961 ?auto_532960 ) ( ON ?auto_532962 ?auto_532961 ) ( ON ?auto_532963 ?auto_532962 ) ( ON ?auto_532964 ?auto_532963 ) ( not ( = ?auto_532951 ?auto_532952 ) ) ( not ( = ?auto_532951 ?auto_532953 ) ) ( not ( = ?auto_532951 ?auto_532954 ) ) ( not ( = ?auto_532951 ?auto_532955 ) ) ( not ( = ?auto_532951 ?auto_532956 ) ) ( not ( = ?auto_532951 ?auto_532957 ) ) ( not ( = ?auto_532951 ?auto_532958 ) ) ( not ( = ?auto_532951 ?auto_532959 ) ) ( not ( = ?auto_532951 ?auto_532960 ) ) ( not ( = ?auto_532951 ?auto_532961 ) ) ( not ( = ?auto_532951 ?auto_532962 ) ) ( not ( = ?auto_532951 ?auto_532963 ) ) ( not ( = ?auto_532951 ?auto_532964 ) ) ( not ( = ?auto_532951 ?auto_532965 ) ) ( not ( = ?auto_532951 ?auto_532966 ) ) ( not ( = ?auto_532951 ?auto_532967 ) ) ( not ( = ?auto_532952 ?auto_532953 ) ) ( not ( = ?auto_532952 ?auto_532954 ) ) ( not ( = ?auto_532952 ?auto_532955 ) ) ( not ( = ?auto_532952 ?auto_532956 ) ) ( not ( = ?auto_532952 ?auto_532957 ) ) ( not ( = ?auto_532952 ?auto_532958 ) ) ( not ( = ?auto_532952 ?auto_532959 ) ) ( not ( = ?auto_532952 ?auto_532960 ) ) ( not ( = ?auto_532952 ?auto_532961 ) ) ( not ( = ?auto_532952 ?auto_532962 ) ) ( not ( = ?auto_532952 ?auto_532963 ) ) ( not ( = ?auto_532952 ?auto_532964 ) ) ( not ( = ?auto_532952 ?auto_532965 ) ) ( not ( = ?auto_532952 ?auto_532966 ) ) ( not ( = ?auto_532952 ?auto_532967 ) ) ( not ( = ?auto_532953 ?auto_532954 ) ) ( not ( = ?auto_532953 ?auto_532955 ) ) ( not ( = ?auto_532953 ?auto_532956 ) ) ( not ( = ?auto_532953 ?auto_532957 ) ) ( not ( = ?auto_532953 ?auto_532958 ) ) ( not ( = ?auto_532953 ?auto_532959 ) ) ( not ( = ?auto_532953 ?auto_532960 ) ) ( not ( = ?auto_532953 ?auto_532961 ) ) ( not ( = ?auto_532953 ?auto_532962 ) ) ( not ( = ?auto_532953 ?auto_532963 ) ) ( not ( = ?auto_532953 ?auto_532964 ) ) ( not ( = ?auto_532953 ?auto_532965 ) ) ( not ( = ?auto_532953 ?auto_532966 ) ) ( not ( = ?auto_532953 ?auto_532967 ) ) ( not ( = ?auto_532954 ?auto_532955 ) ) ( not ( = ?auto_532954 ?auto_532956 ) ) ( not ( = ?auto_532954 ?auto_532957 ) ) ( not ( = ?auto_532954 ?auto_532958 ) ) ( not ( = ?auto_532954 ?auto_532959 ) ) ( not ( = ?auto_532954 ?auto_532960 ) ) ( not ( = ?auto_532954 ?auto_532961 ) ) ( not ( = ?auto_532954 ?auto_532962 ) ) ( not ( = ?auto_532954 ?auto_532963 ) ) ( not ( = ?auto_532954 ?auto_532964 ) ) ( not ( = ?auto_532954 ?auto_532965 ) ) ( not ( = ?auto_532954 ?auto_532966 ) ) ( not ( = ?auto_532954 ?auto_532967 ) ) ( not ( = ?auto_532955 ?auto_532956 ) ) ( not ( = ?auto_532955 ?auto_532957 ) ) ( not ( = ?auto_532955 ?auto_532958 ) ) ( not ( = ?auto_532955 ?auto_532959 ) ) ( not ( = ?auto_532955 ?auto_532960 ) ) ( not ( = ?auto_532955 ?auto_532961 ) ) ( not ( = ?auto_532955 ?auto_532962 ) ) ( not ( = ?auto_532955 ?auto_532963 ) ) ( not ( = ?auto_532955 ?auto_532964 ) ) ( not ( = ?auto_532955 ?auto_532965 ) ) ( not ( = ?auto_532955 ?auto_532966 ) ) ( not ( = ?auto_532955 ?auto_532967 ) ) ( not ( = ?auto_532956 ?auto_532957 ) ) ( not ( = ?auto_532956 ?auto_532958 ) ) ( not ( = ?auto_532956 ?auto_532959 ) ) ( not ( = ?auto_532956 ?auto_532960 ) ) ( not ( = ?auto_532956 ?auto_532961 ) ) ( not ( = ?auto_532956 ?auto_532962 ) ) ( not ( = ?auto_532956 ?auto_532963 ) ) ( not ( = ?auto_532956 ?auto_532964 ) ) ( not ( = ?auto_532956 ?auto_532965 ) ) ( not ( = ?auto_532956 ?auto_532966 ) ) ( not ( = ?auto_532956 ?auto_532967 ) ) ( not ( = ?auto_532957 ?auto_532958 ) ) ( not ( = ?auto_532957 ?auto_532959 ) ) ( not ( = ?auto_532957 ?auto_532960 ) ) ( not ( = ?auto_532957 ?auto_532961 ) ) ( not ( = ?auto_532957 ?auto_532962 ) ) ( not ( = ?auto_532957 ?auto_532963 ) ) ( not ( = ?auto_532957 ?auto_532964 ) ) ( not ( = ?auto_532957 ?auto_532965 ) ) ( not ( = ?auto_532957 ?auto_532966 ) ) ( not ( = ?auto_532957 ?auto_532967 ) ) ( not ( = ?auto_532958 ?auto_532959 ) ) ( not ( = ?auto_532958 ?auto_532960 ) ) ( not ( = ?auto_532958 ?auto_532961 ) ) ( not ( = ?auto_532958 ?auto_532962 ) ) ( not ( = ?auto_532958 ?auto_532963 ) ) ( not ( = ?auto_532958 ?auto_532964 ) ) ( not ( = ?auto_532958 ?auto_532965 ) ) ( not ( = ?auto_532958 ?auto_532966 ) ) ( not ( = ?auto_532958 ?auto_532967 ) ) ( not ( = ?auto_532959 ?auto_532960 ) ) ( not ( = ?auto_532959 ?auto_532961 ) ) ( not ( = ?auto_532959 ?auto_532962 ) ) ( not ( = ?auto_532959 ?auto_532963 ) ) ( not ( = ?auto_532959 ?auto_532964 ) ) ( not ( = ?auto_532959 ?auto_532965 ) ) ( not ( = ?auto_532959 ?auto_532966 ) ) ( not ( = ?auto_532959 ?auto_532967 ) ) ( not ( = ?auto_532960 ?auto_532961 ) ) ( not ( = ?auto_532960 ?auto_532962 ) ) ( not ( = ?auto_532960 ?auto_532963 ) ) ( not ( = ?auto_532960 ?auto_532964 ) ) ( not ( = ?auto_532960 ?auto_532965 ) ) ( not ( = ?auto_532960 ?auto_532966 ) ) ( not ( = ?auto_532960 ?auto_532967 ) ) ( not ( = ?auto_532961 ?auto_532962 ) ) ( not ( = ?auto_532961 ?auto_532963 ) ) ( not ( = ?auto_532961 ?auto_532964 ) ) ( not ( = ?auto_532961 ?auto_532965 ) ) ( not ( = ?auto_532961 ?auto_532966 ) ) ( not ( = ?auto_532961 ?auto_532967 ) ) ( not ( = ?auto_532962 ?auto_532963 ) ) ( not ( = ?auto_532962 ?auto_532964 ) ) ( not ( = ?auto_532962 ?auto_532965 ) ) ( not ( = ?auto_532962 ?auto_532966 ) ) ( not ( = ?auto_532962 ?auto_532967 ) ) ( not ( = ?auto_532963 ?auto_532964 ) ) ( not ( = ?auto_532963 ?auto_532965 ) ) ( not ( = ?auto_532963 ?auto_532966 ) ) ( not ( = ?auto_532963 ?auto_532967 ) ) ( not ( = ?auto_532964 ?auto_532965 ) ) ( not ( = ?auto_532964 ?auto_532966 ) ) ( not ( = ?auto_532964 ?auto_532967 ) ) ( not ( = ?auto_532965 ?auto_532966 ) ) ( not ( = ?auto_532965 ?auto_532967 ) ) ( not ( = ?auto_532966 ?auto_532967 ) ) ( CLEAR ?auto_532964 ) ( ON ?auto_532965 ?auto_532966 ) ( CLEAR ?auto_532965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_532951 ?auto_532952 ?auto_532953 ?auto_532954 ?auto_532955 ?auto_532956 ?auto_532957 ?auto_532958 ?auto_532959 ?auto_532960 ?auto_532961 ?auto_532962 ?auto_532963 ?auto_532964 ?auto_532965 )
      ( MAKE-16PILE ?auto_532951 ?auto_532952 ?auto_532953 ?auto_532954 ?auto_532955 ?auto_532956 ?auto_532957 ?auto_532958 ?auto_532959 ?auto_532960 ?auto_532961 ?auto_532962 ?auto_532963 ?auto_532964 ?auto_532965 ?auto_532966 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_532984 - BLOCK
      ?auto_532985 - BLOCK
      ?auto_532986 - BLOCK
      ?auto_532987 - BLOCK
      ?auto_532988 - BLOCK
      ?auto_532989 - BLOCK
      ?auto_532990 - BLOCK
      ?auto_532991 - BLOCK
      ?auto_532992 - BLOCK
      ?auto_532993 - BLOCK
      ?auto_532994 - BLOCK
      ?auto_532995 - BLOCK
      ?auto_532996 - BLOCK
      ?auto_532997 - BLOCK
      ?auto_532998 - BLOCK
      ?auto_532999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_532999 ) ( ON-TABLE ?auto_532984 ) ( ON ?auto_532985 ?auto_532984 ) ( ON ?auto_532986 ?auto_532985 ) ( ON ?auto_532987 ?auto_532986 ) ( ON ?auto_532988 ?auto_532987 ) ( ON ?auto_532989 ?auto_532988 ) ( ON ?auto_532990 ?auto_532989 ) ( ON ?auto_532991 ?auto_532990 ) ( ON ?auto_532992 ?auto_532991 ) ( ON ?auto_532993 ?auto_532992 ) ( ON ?auto_532994 ?auto_532993 ) ( ON ?auto_532995 ?auto_532994 ) ( ON ?auto_532996 ?auto_532995 ) ( ON ?auto_532997 ?auto_532996 ) ( not ( = ?auto_532984 ?auto_532985 ) ) ( not ( = ?auto_532984 ?auto_532986 ) ) ( not ( = ?auto_532984 ?auto_532987 ) ) ( not ( = ?auto_532984 ?auto_532988 ) ) ( not ( = ?auto_532984 ?auto_532989 ) ) ( not ( = ?auto_532984 ?auto_532990 ) ) ( not ( = ?auto_532984 ?auto_532991 ) ) ( not ( = ?auto_532984 ?auto_532992 ) ) ( not ( = ?auto_532984 ?auto_532993 ) ) ( not ( = ?auto_532984 ?auto_532994 ) ) ( not ( = ?auto_532984 ?auto_532995 ) ) ( not ( = ?auto_532984 ?auto_532996 ) ) ( not ( = ?auto_532984 ?auto_532997 ) ) ( not ( = ?auto_532984 ?auto_532998 ) ) ( not ( = ?auto_532984 ?auto_532999 ) ) ( not ( = ?auto_532985 ?auto_532986 ) ) ( not ( = ?auto_532985 ?auto_532987 ) ) ( not ( = ?auto_532985 ?auto_532988 ) ) ( not ( = ?auto_532985 ?auto_532989 ) ) ( not ( = ?auto_532985 ?auto_532990 ) ) ( not ( = ?auto_532985 ?auto_532991 ) ) ( not ( = ?auto_532985 ?auto_532992 ) ) ( not ( = ?auto_532985 ?auto_532993 ) ) ( not ( = ?auto_532985 ?auto_532994 ) ) ( not ( = ?auto_532985 ?auto_532995 ) ) ( not ( = ?auto_532985 ?auto_532996 ) ) ( not ( = ?auto_532985 ?auto_532997 ) ) ( not ( = ?auto_532985 ?auto_532998 ) ) ( not ( = ?auto_532985 ?auto_532999 ) ) ( not ( = ?auto_532986 ?auto_532987 ) ) ( not ( = ?auto_532986 ?auto_532988 ) ) ( not ( = ?auto_532986 ?auto_532989 ) ) ( not ( = ?auto_532986 ?auto_532990 ) ) ( not ( = ?auto_532986 ?auto_532991 ) ) ( not ( = ?auto_532986 ?auto_532992 ) ) ( not ( = ?auto_532986 ?auto_532993 ) ) ( not ( = ?auto_532986 ?auto_532994 ) ) ( not ( = ?auto_532986 ?auto_532995 ) ) ( not ( = ?auto_532986 ?auto_532996 ) ) ( not ( = ?auto_532986 ?auto_532997 ) ) ( not ( = ?auto_532986 ?auto_532998 ) ) ( not ( = ?auto_532986 ?auto_532999 ) ) ( not ( = ?auto_532987 ?auto_532988 ) ) ( not ( = ?auto_532987 ?auto_532989 ) ) ( not ( = ?auto_532987 ?auto_532990 ) ) ( not ( = ?auto_532987 ?auto_532991 ) ) ( not ( = ?auto_532987 ?auto_532992 ) ) ( not ( = ?auto_532987 ?auto_532993 ) ) ( not ( = ?auto_532987 ?auto_532994 ) ) ( not ( = ?auto_532987 ?auto_532995 ) ) ( not ( = ?auto_532987 ?auto_532996 ) ) ( not ( = ?auto_532987 ?auto_532997 ) ) ( not ( = ?auto_532987 ?auto_532998 ) ) ( not ( = ?auto_532987 ?auto_532999 ) ) ( not ( = ?auto_532988 ?auto_532989 ) ) ( not ( = ?auto_532988 ?auto_532990 ) ) ( not ( = ?auto_532988 ?auto_532991 ) ) ( not ( = ?auto_532988 ?auto_532992 ) ) ( not ( = ?auto_532988 ?auto_532993 ) ) ( not ( = ?auto_532988 ?auto_532994 ) ) ( not ( = ?auto_532988 ?auto_532995 ) ) ( not ( = ?auto_532988 ?auto_532996 ) ) ( not ( = ?auto_532988 ?auto_532997 ) ) ( not ( = ?auto_532988 ?auto_532998 ) ) ( not ( = ?auto_532988 ?auto_532999 ) ) ( not ( = ?auto_532989 ?auto_532990 ) ) ( not ( = ?auto_532989 ?auto_532991 ) ) ( not ( = ?auto_532989 ?auto_532992 ) ) ( not ( = ?auto_532989 ?auto_532993 ) ) ( not ( = ?auto_532989 ?auto_532994 ) ) ( not ( = ?auto_532989 ?auto_532995 ) ) ( not ( = ?auto_532989 ?auto_532996 ) ) ( not ( = ?auto_532989 ?auto_532997 ) ) ( not ( = ?auto_532989 ?auto_532998 ) ) ( not ( = ?auto_532989 ?auto_532999 ) ) ( not ( = ?auto_532990 ?auto_532991 ) ) ( not ( = ?auto_532990 ?auto_532992 ) ) ( not ( = ?auto_532990 ?auto_532993 ) ) ( not ( = ?auto_532990 ?auto_532994 ) ) ( not ( = ?auto_532990 ?auto_532995 ) ) ( not ( = ?auto_532990 ?auto_532996 ) ) ( not ( = ?auto_532990 ?auto_532997 ) ) ( not ( = ?auto_532990 ?auto_532998 ) ) ( not ( = ?auto_532990 ?auto_532999 ) ) ( not ( = ?auto_532991 ?auto_532992 ) ) ( not ( = ?auto_532991 ?auto_532993 ) ) ( not ( = ?auto_532991 ?auto_532994 ) ) ( not ( = ?auto_532991 ?auto_532995 ) ) ( not ( = ?auto_532991 ?auto_532996 ) ) ( not ( = ?auto_532991 ?auto_532997 ) ) ( not ( = ?auto_532991 ?auto_532998 ) ) ( not ( = ?auto_532991 ?auto_532999 ) ) ( not ( = ?auto_532992 ?auto_532993 ) ) ( not ( = ?auto_532992 ?auto_532994 ) ) ( not ( = ?auto_532992 ?auto_532995 ) ) ( not ( = ?auto_532992 ?auto_532996 ) ) ( not ( = ?auto_532992 ?auto_532997 ) ) ( not ( = ?auto_532992 ?auto_532998 ) ) ( not ( = ?auto_532992 ?auto_532999 ) ) ( not ( = ?auto_532993 ?auto_532994 ) ) ( not ( = ?auto_532993 ?auto_532995 ) ) ( not ( = ?auto_532993 ?auto_532996 ) ) ( not ( = ?auto_532993 ?auto_532997 ) ) ( not ( = ?auto_532993 ?auto_532998 ) ) ( not ( = ?auto_532993 ?auto_532999 ) ) ( not ( = ?auto_532994 ?auto_532995 ) ) ( not ( = ?auto_532994 ?auto_532996 ) ) ( not ( = ?auto_532994 ?auto_532997 ) ) ( not ( = ?auto_532994 ?auto_532998 ) ) ( not ( = ?auto_532994 ?auto_532999 ) ) ( not ( = ?auto_532995 ?auto_532996 ) ) ( not ( = ?auto_532995 ?auto_532997 ) ) ( not ( = ?auto_532995 ?auto_532998 ) ) ( not ( = ?auto_532995 ?auto_532999 ) ) ( not ( = ?auto_532996 ?auto_532997 ) ) ( not ( = ?auto_532996 ?auto_532998 ) ) ( not ( = ?auto_532996 ?auto_532999 ) ) ( not ( = ?auto_532997 ?auto_532998 ) ) ( not ( = ?auto_532997 ?auto_532999 ) ) ( not ( = ?auto_532998 ?auto_532999 ) ) ( CLEAR ?auto_532997 ) ( ON ?auto_532998 ?auto_532999 ) ( CLEAR ?auto_532998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_532984 ?auto_532985 ?auto_532986 ?auto_532987 ?auto_532988 ?auto_532989 ?auto_532990 ?auto_532991 ?auto_532992 ?auto_532993 ?auto_532994 ?auto_532995 ?auto_532996 ?auto_532997 ?auto_532998 )
      ( MAKE-16PILE ?auto_532984 ?auto_532985 ?auto_532986 ?auto_532987 ?auto_532988 ?auto_532989 ?auto_532990 ?auto_532991 ?auto_532992 ?auto_532993 ?auto_532994 ?auto_532995 ?auto_532996 ?auto_532997 ?auto_532998 ?auto_532999 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533016 - BLOCK
      ?auto_533017 - BLOCK
      ?auto_533018 - BLOCK
      ?auto_533019 - BLOCK
      ?auto_533020 - BLOCK
      ?auto_533021 - BLOCK
      ?auto_533022 - BLOCK
      ?auto_533023 - BLOCK
      ?auto_533024 - BLOCK
      ?auto_533025 - BLOCK
      ?auto_533026 - BLOCK
      ?auto_533027 - BLOCK
      ?auto_533028 - BLOCK
      ?auto_533029 - BLOCK
      ?auto_533030 - BLOCK
      ?auto_533031 - BLOCK
    )
    :vars
    (
      ?auto_533032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533031 ?auto_533032 ) ( ON-TABLE ?auto_533016 ) ( ON ?auto_533017 ?auto_533016 ) ( ON ?auto_533018 ?auto_533017 ) ( ON ?auto_533019 ?auto_533018 ) ( ON ?auto_533020 ?auto_533019 ) ( ON ?auto_533021 ?auto_533020 ) ( ON ?auto_533022 ?auto_533021 ) ( ON ?auto_533023 ?auto_533022 ) ( ON ?auto_533024 ?auto_533023 ) ( ON ?auto_533025 ?auto_533024 ) ( ON ?auto_533026 ?auto_533025 ) ( ON ?auto_533027 ?auto_533026 ) ( ON ?auto_533028 ?auto_533027 ) ( not ( = ?auto_533016 ?auto_533017 ) ) ( not ( = ?auto_533016 ?auto_533018 ) ) ( not ( = ?auto_533016 ?auto_533019 ) ) ( not ( = ?auto_533016 ?auto_533020 ) ) ( not ( = ?auto_533016 ?auto_533021 ) ) ( not ( = ?auto_533016 ?auto_533022 ) ) ( not ( = ?auto_533016 ?auto_533023 ) ) ( not ( = ?auto_533016 ?auto_533024 ) ) ( not ( = ?auto_533016 ?auto_533025 ) ) ( not ( = ?auto_533016 ?auto_533026 ) ) ( not ( = ?auto_533016 ?auto_533027 ) ) ( not ( = ?auto_533016 ?auto_533028 ) ) ( not ( = ?auto_533016 ?auto_533029 ) ) ( not ( = ?auto_533016 ?auto_533030 ) ) ( not ( = ?auto_533016 ?auto_533031 ) ) ( not ( = ?auto_533016 ?auto_533032 ) ) ( not ( = ?auto_533017 ?auto_533018 ) ) ( not ( = ?auto_533017 ?auto_533019 ) ) ( not ( = ?auto_533017 ?auto_533020 ) ) ( not ( = ?auto_533017 ?auto_533021 ) ) ( not ( = ?auto_533017 ?auto_533022 ) ) ( not ( = ?auto_533017 ?auto_533023 ) ) ( not ( = ?auto_533017 ?auto_533024 ) ) ( not ( = ?auto_533017 ?auto_533025 ) ) ( not ( = ?auto_533017 ?auto_533026 ) ) ( not ( = ?auto_533017 ?auto_533027 ) ) ( not ( = ?auto_533017 ?auto_533028 ) ) ( not ( = ?auto_533017 ?auto_533029 ) ) ( not ( = ?auto_533017 ?auto_533030 ) ) ( not ( = ?auto_533017 ?auto_533031 ) ) ( not ( = ?auto_533017 ?auto_533032 ) ) ( not ( = ?auto_533018 ?auto_533019 ) ) ( not ( = ?auto_533018 ?auto_533020 ) ) ( not ( = ?auto_533018 ?auto_533021 ) ) ( not ( = ?auto_533018 ?auto_533022 ) ) ( not ( = ?auto_533018 ?auto_533023 ) ) ( not ( = ?auto_533018 ?auto_533024 ) ) ( not ( = ?auto_533018 ?auto_533025 ) ) ( not ( = ?auto_533018 ?auto_533026 ) ) ( not ( = ?auto_533018 ?auto_533027 ) ) ( not ( = ?auto_533018 ?auto_533028 ) ) ( not ( = ?auto_533018 ?auto_533029 ) ) ( not ( = ?auto_533018 ?auto_533030 ) ) ( not ( = ?auto_533018 ?auto_533031 ) ) ( not ( = ?auto_533018 ?auto_533032 ) ) ( not ( = ?auto_533019 ?auto_533020 ) ) ( not ( = ?auto_533019 ?auto_533021 ) ) ( not ( = ?auto_533019 ?auto_533022 ) ) ( not ( = ?auto_533019 ?auto_533023 ) ) ( not ( = ?auto_533019 ?auto_533024 ) ) ( not ( = ?auto_533019 ?auto_533025 ) ) ( not ( = ?auto_533019 ?auto_533026 ) ) ( not ( = ?auto_533019 ?auto_533027 ) ) ( not ( = ?auto_533019 ?auto_533028 ) ) ( not ( = ?auto_533019 ?auto_533029 ) ) ( not ( = ?auto_533019 ?auto_533030 ) ) ( not ( = ?auto_533019 ?auto_533031 ) ) ( not ( = ?auto_533019 ?auto_533032 ) ) ( not ( = ?auto_533020 ?auto_533021 ) ) ( not ( = ?auto_533020 ?auto_533022 ) ) ( not ( = ?auto_533020 ?auto_533023 ) ) ( not ( = ?auto_533020 ?auto_533024 ) ) ( not ( = ?auto_533020 ?auto_533025 ) ) ( not ( = ?auto_533020 ?auto_533026 ) ) ( not ( = ?auto_533020 ?auto_533027 ) ) ( not ( = ?auto_533020 ?auto_533028 ) ) ( not ( = ?auto_533020 ?auto_533029 ) ) ( not ( = ?auto_533020 ?auto_533030 ) ) ( not ( = ?auto_533020 ?auto_533031 ) ) ( not ( = ?auto_533020 ?auto_533032 ) ) ( not ( = ?auto_533021 ?auto_533022 ) ) ( not ( = ?auto_533021 ?auto_533023 ) ) ( not ( = ?auto_533021 ?auto_533024 ) ) ( not ( = ?auto_533021 ?auto_533025 ) ) ( not ( = ?auto_533021 ?auto_533026 ) ) ( not ( = ?auto_533021 ?auto_533027 ) ) ( not ( = ?auto_533021 ?auto_533028 ) ) ( not ( = ?auto_533021 ?auto_533029 ) ) ( not ( = ?auto_533021 ?auto_533030 ) ) ( not ( = ?auto_533021 ?auto_533031 ) ) ( not ( = ?auto_533021 ?auto_533032 ) ) ( not ( = ?auto_533022 ?auto_533023 ) ) ( not ( = ?auto_533022 ?auto_533024 ) ) ( not ( = ?auto_533022 ?auto_533025 ) ) ( not ( = ?auto_533022 ?auto_533026 ) ) ( not ( = ?auto_533022 ?auto_533027 ) ) ( not ( = ?auto_533022 ?auto_533028 ) ) ( not ( = ?auto_533022 ?auto_533029 ) ) ( not ( = ?auto_533022 ?auto_533030 ) ) ( not ( = ?auto_533022 ?auto_533031 ) ) ( not ( = ?auto_533022 ?auto_533032 ) ) ( not ( = ?auto_533023 ?auto_533024 ) ) ( not ( = ?auto_533023 ?auto_533025 ) ) ( not ( = ?auto_533023 ?auto_533026 ) ) ( not ( = ?auto_533023 ?auto_533027 ) ) ( not ( = ?auto_533023 ?auto_533028 ) ) ( not ( = ?auto_533023 ?auto_533029 ) ) ( not ( = ?auto_533023 ?auto_533030 ) ) ( not ( = ?auto_533023 ?auto_533031 ) ) ( not ( = ?auto_533023 ?auto_533032 ) ) ( not ( = ?auto_533024 ?auto_533025 ) ) ( not ( = ?auto_533024 ?auto_533026 ) ) ( not ( = ?auto_533024 ?auto_533027 ) ) ( not ( = ?auto_533024 ?auto_533028 ) ) ( not ( = ?auto_533024 ?auto_533029 ) ) ( not ( = ?auto_533024 ?auto_533030 ) ) ( not ( = ?auto_533024 ?auto_533031 ) ) ( not ( = ?auto_533024 ?auto_533032 ) ) ( not ( = ?auto_533025 ?auto_533026 ) ) ( not ( = ?auto_533025 ?auto_533027 ) ) ( not ( = ?auto_533025 ?auto_533028 ) ) ( not ( = ?auto_533025 ?auto_533029 ) ) ( not ( = ?auto_533025 ?auto_533030 ) ) ( not ( = ?auto_533025 ?auto_533031 ) ) ( not ( = ?auto_533025 ?auto_533032 ) ) ( not ( = ?auto_533026 ?auto_533027 ) ) ( not ( = ?auto_533026 ?auto_533028 ) ) ( not ( = ?auto_533026 ?auto_533029 ) ) ( not ( = ?auto_533026 ?auto_533030 ) ) ( not ( = ?auto_533026 ?auto_533031 ) ) ( not ( = ?auto_533026 ?auto_533032 ) ) ( not ( = ?auto_533027 ?auto_533028 ) ) ( not ( = ?auto_533027 ?auto_533029 ) ) ( not ( = ?auto_533027 ?auto_533030 ) ) ( not ( = ?auto_533027 ?auto_533031 ) ) ( not ( = ?auto_533027 ?auto_533032 ) ) ( not ( = ?auto_533028 ?auto_533029 ) ) ( not ( = ?auto_533028 ?auto_533030 ) ) ( not ( = ?auto_533028 ?auto_533031 ) ) ( not ( = ?auto_533028 ?auto_533032 ) ) ( not ( = ?auto_533029 ?auto_533030 ) ) ( not ( = ?auto_533029 ?auto_533031 ) ) ( not ( = ?auto_533029 ?auto_533032 ) ) ( not ( = ?auto_533030 ?auto_533031 ) ) ( not ( = ?auto_533030 ?auto_533032 ) ) ( not ( = ?auto_533031 ?auto_533032 ) ) ( ON ?auto_533030 ?auto_533031 ) ( CLEAR ?auto_533028 ) ( ON ?auto_533029 ?auto_533030 ) ( CLEAR ?auto_533029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_533016 ?auto_533017 ?auto_533018 ?auto_533019 ?auto_533020 ?auto_533021 ?auto_533022 ?auto_533023 ?auto_533024 ?auto_533025 ?auto_533026 ?auto_533027 ?auto_533028 ?auto_533029 )
      ( MAKE-16PILE ?auto_533016 ?auto_533017 ?auto_533018 ?auto_533019 ?auto_533020 ?auto_533021 ?auto_533022 ?auto_533023 ?auto_533024 ?auto_533025 ?auto_533026 ?auto_533027 ?auto_533028 ?auto_533029 ?auto_533030 ?auto_533031 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533049 - BLOCK
      ?auto_533050 - BLOCK
      ?auto_533051 - BLOCK
      ?auto_533052 - BLOCK
      ?auto_533053 - BLOCK
      ?auto_533054 - BLOCK
      ?auto_533055 - BLOCK
      ?auto_533056 - BLOCK
      ?auto_533057 - BLOCK
      ?auto_533058 - BLOCK
      ?auto_533059 - BLOCK
      ?auto_533060 - BLOCK
      ?auto_533061 - BLOCK
      ?auto_533062 - BLOCK
      ?auto_533063 - BLOCK
      ?auto_533064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533064 ) ( ON-TABLE ?auto_533049 ) ( ON ?auto_533050 ?auto_533049 ) ( ON ?auto_533051 ?auto_533050 ) ( ON ?auto_533052 ?auto_533051 ) ( ON ?auto_533053 ?auto_533052 ) ( ON ?auto_533054 ?auto_533053 ) ( ON ?auto_533055 ?auto_533054 ) ( ON ?auto_533056 ?auto_533055 ) ( ON ?auto_533057 ?auto_533056 ) ( ON ?auto_533058 ?auto_533057 ) ( ON ?auto_533059 ?auto_533058 ) ( ON ?auto_533060 ?auto_533059 ) ( ON ?auto_533061 ?auto_533060 ) ( not ( = ?auto_533049 ?auto_533050 ) ) ( not ( = ?auto_533049 ?auto_533051 ) ) ( not ( = ?auto_533049 ?auto_533052 ) ) ( not ( = ?auto_533049 ?auto_533053 ) ) ( not ( = ?auto_533049 ?auto_533054 ) ) ( not ( = ?auto_533049 ?auto_533055 ) ) ( not ( = ?auto_533049 ?auto_533056 ) ) ( not ( = ?auto_533049 ?auto_533057 ) ) ( not ( = ?auto_533049 ?auto_533058 ) ) ( not ( = ?auto_533049 ?auto_533059 ) ) ( not ( = ?auto_533049 ?auto_533060 ) ) ( not ( = ?auto_533049 ?auto_533061 ) ) ( not ( = ?auto_533049 ?auto_533062 ) ) ( not ( = ?auto_533049 ?auto_533063 ) ) ( not ( = ?auto_533049 ?auto_533064 ) ) ( not ( = ?auto_533050 ?auto_533051 ) ) ( not ( = ?auto_533050 ?auto_533052 ) ) ( not ( = ?auto_533050 ?auto_533053 ) ) ( not ( = ?auto_533050 ?auto_533054 ) ) ( not ( = ?auto_533050 ?auto_533055 ) ) ( not ( = ?auto_533050 ?auto_533056 ) ) ( not ( = ?auto_533050 ?auto_533057 ) ) ( not ( = ?auto_533050 ?auto_533058 ) ) ( not ( = ?auto_533050 ?auto_533059 ) ) ( not ( = ?auto_533050 ?auto_533060 ) ) ( not ( = ?auto_533050 ?auto_533061 ) ) ( not ( = ?auto_533050 ?auto_533062 ) ) ( not ( = ?auto_533050 ?auto_533063 ) ) ( not ( = ?auto_533050 ?auto_533064 ) ) ( not ( = ?auto_533051 ?auto_533052 ) ) ( not ( = ?auto_533051 ?auto_533053 ) ) ( not ( = ?auto_533051 ?auto_533054 ) ) ( not ( = ?auto_533051 ?auto_533055 ) ) ( not ( = ?auto_533051 ?auto_533056 ) ) ( not ( = ?auto_533051 ?auto_533057 ) ) ( not ( = ?auto_533051 ?auto_533058 ) ) ( not ( = ?auto_533051 ?auto_533059 ) ) ( not ( = ?auto_533051 ?auto_533060 ) ) ( not ( = ?auto_533051 ?auto_533061 ) ) ( not ( = ?auto_533051 ?auto_533062 ) ) ( not ( = ?auto_533051 ?auto_533063 ) ) ( not ( = ?auto_533051 ?auto_533064 ) ) ( not ( = ?auto_533052 ?auto_533053 ) ) ( not ( = ?auto_533052 ?auto_533054 ) ) ( not ( = ?auto_533052 ?auto_533055 ) ) ( not ( = ?auto_533052 ?auto_533056 ) ) ( not ( = ?auto_533052 ?auto_533057 ) ) ( not ( = ?auto_533052 ?auto_533058 ) ) ( not ( = ?auto_533052 ?auto_533059 ) ) ( not ( = ?auto_533052 ?auto_533060 ) ) ( not ( = ?auto_533052 ?auto_533061 ) ) ( not ( = ?auto_533052 ?auto_533062 ) ) ( not ( = ?auto_533052 ?auto_533063 ) ) ( not ( = ?auto_533052 ?auto_533064 ) ) ( not ( = ?auto_533053 ?auto_533054 ) ) ( not ( = ?auto_533053 ?auto_533055 ) ) ( not ( = ?auto_533053 ?auto_533056 ) ) ( not ( = ?auto_533053 ?auto_533057 ) ) ( not ( = ?auto_533053 ?auto_533058 ) ) ( not ( = ?auto_533053 ?auto_533059 ) ) ( not ( = ?auto_533053 ?auto_533060 ) ) ( not ( = ?auto_533053 ?auto_533061 ) ) ( not ( = ?auto_533053 ?auto_533062 ) ) ( not ( = ?auto_533053 ?auto_533063 ) ) ( not ( = ?auto_533053 ?auto_533064 ) ) ( not ( = ?auto_533054 ?auto_533055 ) ) ( not ( = ?auto_533054 ?auto_533056 ) ) ( not ( = ?auto_533054 ?auto_533057 ) ) ( not ( = ?auto_533054 ?auto_533058 ) ) ( not ( = ?auto_533054 ?auto_533059 ) ) ( not ( = ?auto_533054 ?auto_533060 ) ) ( not ( = ?auto_533054 ?auto_533061 ) ) ( not ( = ?auto_533054 ?auto_533062 ) ) ( not ( = ?auto_533054 ?auto_533063 ) ) ( not ( = ?auto_533054 ?auto_533064 ) ) ( not ( = ?auto_533055 ?auto_533056 ) ) ( not ( = ?auto_533055 ?auto_533057 ) ) ( not ( = ?auto_533055 ?auto_533058 ) ) ( not ( = ?auto_533055 ?auto_533059 ) ) ( not ( = ?auto_533055 ?auto_533060 ) ) ( not ( = ?auto_533055 ?auto_533061 ) ) ( not ( = ?auto_533055 ?auto_533062 ) ) ( not ( = ?auto_533055 ?auto_533063 ) ) ( not ( = ?auto_533055 ?auto_533064 ) ) ( not ( = ?auto_533056 ?auto_533057 ) ) ( not ( = ?auto_533056 ?auto_533058 ) ) ( not ( = ?auto_533056 ?auto_533059 ) ) ( not ( = ?auto_533056 ?auto_533060 ) ) ( not ( = ?auto_533056 ?auto_533061 ) ) ( not ( = ?auto_533056 ?auto_533062 ) ) ( not ( = ?auto_533056 ?auto_533063 ) ) ( not ( = ?auto_533056 ?auto_533064 ) ) ( not ( = ?auto_533057 ?auto_533058 ) ) ( not ( = ?auto_533057 ?auto_533059 ) ) ( not ( = ?auto_533057 ?auto_533060 ) ) ( not ( = ?auto_533057 ?auto_533061 ) ) ( not ( = ?auto_533057 ?auto_533062 ) ) ( not ( = ?auto_533057 ?auto_533063 ) ) ( not ( = ?auto_533057 ?auto_533064 ) ) ( not ( = ?auto_533058 ?auto_533059 ) ) ( not ( = ?auto_533058 ?auto_533060 ) ) ( not ( = ?auto_533058 ?auto_533061 ) ) ( not ( = ?auto_533058 ?auto_533062 ) ) ( not ( = ?auto_533058 ?auto_533063 ) ) ( not ( = ?auto_533058 ?auto_533064 ) ) ( not ( = ?auto_533059 ?auto_533060 ) ) ( not ( = ?auto_533059 ?auto_533061 ) ) ( not ( = ?auto_533059 ?auto_533062 ) ) ( not ( = ?auto_533059 ?auto_533063 ) ) ( not ( = ?auto_533059 ?auto_533064 ) ) ( not ( = ?auto_533060 ?auto_533061 ) ) ( not ( = ?auto_533060 ?auto_533062 ) ) ( not ( = ?auto_533060 ?auto_533063 ) ) ( not ( = ?auto_533060 ?auto_533064 ) ) ( not ( = ?auto_533061 ?auto_533062 ) ) ( not ( = ?auto_533061 ?auto_533063 ) ) ( not ( = ?auto_533061 ?auto_533064 ) ) ( not ( = ?auto_533062 ?auto_533063 ) ) ( not ( = ?auto_533062 ?auto_533064 ) ) ( not ( = ?auto_533063 ?auto_533064 ) ) ( ON ?auto_533063 ?auto_533064 ) ( CLEAR ?auto_533061 ) ( ON ?auto_533062 ?auto_533063 ) ( CLEAR ?auto_533062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_533049 ?auto_533050 ?auto_533051 ?auto_533052 ?auto_533053 ?auto_533054 ?auto_533055 ?auto_533056 ?auto_533057 ?auto_533058 ?auto_533059 ?auto_533060 ?auto_533061 ?auto_533062 )
      ( MAKE-16PILE ?auto_533049 ?auto_533050 ?auto_533051 ?auto_533052 ?auto_533053 ?auto_533054 ?auto_533055 ?auto_533056 ?auto_533057 ?auto_533058 ?auto_533059 ?auto_533060 ?auto_533061 ?auto_533062 ?auto_533063 ?auto_533064 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533081 - BLOCK
      ?auto_533082 - BLOCK
      ?auto_533083 - BLOCK
      ?auto_533084 - BLOCK
      ?auto_533085 - BLOCK
      ?auto_533086 - BLOCK
      ?auto_533087 - BLOCK
      ?auto_533088 - BLOCK
      ?auto_533089 - BLOCK
      ?auto_533090 - BLOCK
      ?auto_533091 - BLOCK
      ?auto_533092 - BLOCK
      ?auto_533093 - BLOCK
      ?auto_533094 - BLOCK
      ?auto_533095 - BLOCK
      ?auto_533096 - BLOCK
    )
    :vars
    (
      ?auto_533097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533096 ?auto_533097 ) ( ON-TABLE ?auto_533081 ) ( ON ?auto_533082 ?auto_533081 ) ( ON ?auto_533083 ?auto_533082 ) ( ON ?auto_533084 ?auto_533083 ) ( ON ?auto_533085 ?auto_533084 ) ( ON ?auto_533086 ?auto_533085 ) ( ON ?auto_533087 ?auto_533086 ) ( ON ?auto_533088 ?auto_533087 ) ( ON ?auto_533089 ?auto_533088 ) ( ON ?auto_533090 ?auto_533089 ) ( ON ?auto_533091 ?auto_533090 ) ( ON ?auto_533092 ?auto_533091 ) ( not ( = ?auto_533081 ?auto_533082 ) ) ( not ( = ?auto_533081 ?auto_533083 ) ) ( not ( = ?auto_533081 ?auto_533084 ) ) ( not ( = ?auto_533081 ?auto_533085 ) ) ( not ( = ?auto_533081 ?auto_533086 ) ) ( not ( = ?auto_533081 ?auto_533087 ) ) ( not ( = ?auto_533081 ?auto_533088 ) ) ( not ( = ?auto_533081 ?auto_533089 ) ) ( not ( = ?auto_533081 ?auto_533090 ) ) ( not ( = ?auto_533081 ?auto_533091 ) ) ( not ( = ?auto_533081 ?auto_533092 ) ) ( not ( = ?auto_533081 ?auto_533093 ) ) ( not ( = ?auto_533081 ?auto_533094 ) ) ( not ( = ?auto_533081 ?auto_533095 ) ) ( not ( = ?auto_533081 ?auto_533096 ) ) ( not ( = ?auto_533081 ?auto_533097 ) ) ( not ( = ?auto_533082 ?auto_533083 ) ) ( not ( = ?auto_533082 ?auto_533084 ) ) ( not ( = ?auto_533082 ?auto_533085 ) ) ( not ( = ?auto_533082 ?auto_533086 ) ) ( not ( = ?auto_533082 ?auto_533087 ) ) ( not ( = ?auto_533082 ?auto_533088 ) ) ( not ( = ?auto_533082 ?auto_533089 ) ) ( not ( = ?auto_533082 ?auto_533090 ) ) ( not ( = ?auto_533082 ?auto_533091 ) ) ( not ( = ?auto_533082 ?auto_533092 ) ) ( not ( = ?auto_533082 ?auto_533093 ) ) ( not ( = ?auto_533082 ?auto_533094 ) ) ( not ( = ?auto_533082 ?auto_533095 ) ) ( not ( = ?auto_533082 ?auto_533096 ) ) ( not ( = ?auto_533082 ?auto_533097 ) ) ( not ( = ?auto_533083 ?auto_533084 ) ) ( not ( = ?auto_533083 ?auto_533085 ) ) ( not ( = ?auto_533083 ?auto_533086 ) ) ( not ( = ?auto_533083 ?auto_533087 ) ) ( not ( = ?auto_533083 ?auto_533088 ) ) ( not ( = ?auto_533083 ?auto_533089 ) ) ( not ( = ?auto_533083 ?auto_533090 ) ) ( not ( = ?auto_533083 ?auto_533091 ) ) ( not ( = ?auto_533083 ?auto_533092 ) ) ( not ( = ?auto_533083 ?auto_533093 ) ) ( not ( = ?auto_533083 ?auto_533094 ) ) ( not ( = ?auto_533083 ?auto_533095 ) ) ( not ( = ?auto_533083 ?auto_533096 ) ) ( not ( = ?auto_533083 ?auto_533097 ) ) ( not ( = ?auto_533084 ?auto_533085 ) ) ( not ( = ?auto_533084 ?auto_533086 ) ) ( not ( = ?auto_533084 ?auto_533087 ) ) ( not ( = ?auto_533084 ?auto_533088 ) ) ( not ( = ?auto_533084 ?auto_533089 ) ) ( not ( = ?auto_533084 ?auto_533090 ) ) ( not ( = ?auto_533084 ?auto_533091 ) ) ( not ( = ?auto_533084 ?auto_533092 ) ) ( not ( = ?auto_533084 ?auto_533093 ) ) ( not ( = ?auto_533084 ?auto_533094 ) ) ( not ( = ?auto_533084 ?auto_533095 ) ) ( not ( = ?auto_533084 ?auto_533096 ) ) ( not ( = ?auto_533084 ?auto_533097 ) ) ( not ( = ?auto_533085 ?auto_533086 ) ) ( not ( = ?auto_533085 ?auto_533087 ) ) ( not ( = ?auto_533085 ?auto_533088 ) ) ( not ( = ?auto_533085 ?auto_533089 ) ) ( not ( = ?auto_533085 ?auto_533090 ) ) ( not ( = ?auto_533085 ?auto_533091 ) ) ( not ( = ?auto_533085 ?auto_533092 ) ) ( not ( = ?auto_533085 ?auto_533093 ) ) ( not ( = ?auto_533085 ?auto_533094 ) ) ( not ( = ?auto_533085 ?auto_533095 ) ) ( not ( = ?auto_533085 ?auto_533096 ) ) ( not ( = ?auto_533085 ?auto_533097 ) ) ( not ( = ?auto_533086 ?auto_533087 ) ) ( not ( = ?auto_533086 ?auto_533088 ) ) ( not ( = ?auto_533086 ?auto_533089 ) ) ( not ( = ?auto_533086 ?auto_533090 ) ) ( not ( = ?auto_533086 ?auto_533091 ) ) ( not ( = ?auto_533086 ?auto_533092 ) ) ( not ( = ?auto_533086 ?auto_533093 ) ) ( not ( = ?auto_533086 ?auto_533094 ) ) ( not ( = ?auto_533086 ?auto_533095 ) ) ( not ( = ?auto_533086 ?auto_533096 ) ) ( not ( = ?auto_533086 ?auto_533097 ) ) ( not ( = ?auto_533087 ?auto_533088 ) ) ( not ( = ?auto_533087 ?auto_533089 ) ) ( not ( = ?auto_533087 ?auto_533090 ) ) ( not ( = ?auto_533087 ?auto_533091 ) ) ( not ( = ?auto_533087 ?auto_533092 ) ) ( not ( = ?auto_533087 ?auto_533093 ) ) ( not ( = ?auto_533087 ?auto_533094 ) ) ( not ( = ?auto_533087 ?auto_533095 ) ) ( not ( = ?auto_533087 ?auto_533096 ) ) ( not ( = ?auto_533087 ?auto_533097 ) ) ( not ( = ?auto_533088 ?auto_533089 ) ) ( not ( = ?auto_533088 ?auto_533090 ) ) ( not ( = ?auto_533088 ?auto_533091 ) ) ( not ( = ?auto_533088 ?auto_533092 ) ) ( not ( = ?auto_533088 ?auto_533093 ) ) ( not ( = ?auto_533088 ?auto_533094 ) ) ( not ( = ?auto_533088 ?auto_533095 ) ) ( not ( = ?auto_533088 ?auto_533096 ) ) ( not ( = ?auto_533088 ?auto_533097 ) ) ( not ( = ?auto_533089 ?auto_533090 ) ) ( not ( = ?auto_533089 ?auto_533091 ) ) ( not ( = ?auto_533089 ?auto_533092 ) ) ( not ( = ?auto_533089 ?auto_533093 ) ) ( not ( = ?auto_533089 ?auto_533094 ) ) ( not ( = ?auto_533089 ?auto_533095 ) ) ( not ( = ?auto_533089 ?auto_533096 ) ) ( not ( = ?auto_533089 ?auto_533097 ) ) ( not ( = ?auto_533090 ?auto_533091 ) ) ( not ( = ?auto_533090 ?auto_533092 ) ) ( not ( = ?auto_533090 ?auto_533093 ) ) ( not ( = ?auto_533090 ?auto_533094 ) ) ( not ( = ?auto_533090 ?auto_533095 ) ) ( not ( = ?auto_533090 ?auto_533096 ) ) ( not ( = ?auto_533090 ?auto_533097 ) ) ( not ( = ?auto_533091 ?auto_533092 ) ) ( not ( = ?auto_533091 ?auto_533093 ) ) ( not ( = ?auto_533091 ?auto_533094 ) ) ( not ( = ?auto_533091 ?auto_533095 ) ) ( not ( = ?auto_533091 ?auto_533096 ) ) ( not ( = ?auto_533091 ?auto_533097 ) ) ( not ( = ?auto_533092 ?auto_533093 ) ) ( not ( = ?auto_533092 ?auto_533094 ) ) ( not ( = ?auto_533092 ?auto_533095 ) ) ( not ( = ?auto_533092 ?auto_533096 ) ) ( not ( = ?auto_533092 ?auto_533097 ) ) ( not ( = ?auto_533093 ?auto_533094 ) ) ( not ( = ?auto_533093 ?auto_533095 ) ) ( not ( = ?auto_533093 ?auto_533096 ) ) ( not ( = ?auto_533093 ?auto_533097 ) ) ( not ( = ?auto_533094 ?auto_533095 ) ) ( not ( = ?auto_533094 ?auto_533096 ) ) ( not ( = ?auto_533094 ?auto_533097 ) ) ( not ( = ?auto_533095 ?auto_533096 ) ) ( not ( = ?auto_533095 ?auto_533097 ) ) ( not ( = ?auto_533096 ?auto_533097 ) ) ( ON ?auto_533095 ?auto_533096 ) ( ON ?auto_533094 ?auto_533095 ) ( CLEAR ?auto_533092 ) ( ON ?auto_533093 ?auto_533094 ) ( CLEAR ?auto_533093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_533081 ?auto_533082 ?auto_533083 ?auto_533084 ?auto_533085 ?auto_533086 ?auto_533087 ?auto_533088 ?auto_533089 ?auto_533090 ?auto_533091 ?auto_533092 ?auto_533093 )
      ( MAKE-16PILE ?auto_533081 ?auto_533082 ?auto_533083 ?auto_533084 ?auto_533085 ?auto_533086 ?auto_533087 ?auto_533088 ?auto_533089 ?auto_533090 ?auto_533091 ?auto_533092 ?auto_533093 ?auto_533094 ?auto_533095 ?auto_533096 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533114 - BLOCK
      ?auto_533115 - BLOCK
      ?auto_533116 - BLOCK
      ?auto_533117 - BLOCK
      ?auto_533118 - BLOCK
      ?auto_533119 - BLOCK
      ?auto_533120 - BLOCK
      ?auto_533121 - BLOCK
      ?auto_533122 - BLOCK
      ?auto_533123 - BLOCK
      ?auto_533124 - BLOCK
      ?auto_533125 - BLOCK
      ?auto_533126 - BLOCK
      ?auto_533127 - BLOCK
      ?auto_533128 - BLOCK
      ?auto_533129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533129 ) ( ON-TABLE ?auto_533114 ) ( ON ?auto_533115 ?auto_533114 ) ( ON ?auto_533116 ?auto_533115 ) ( ON ?auto_533117 ?auto_533116 ) ( ON ?auto_533118 ?auto_533117 ) ( ON ?auto_533119 ?auto_533118 ) ( ON ?auto_533120 ?auto_533119 ) ( ON ?auto_533121 ?auto_533120 ) ( ON ?auto_533122 ?auto_533121 ) ( ON ?auto_533123 ?auto_533122 ) ( ON ?auto_533124 ?auto_533123 ) ( ON ?auto_533125 ?auto_533124 ) ( not ( = ?auto_533114 ?auto_533115 ) ) ( not ( = ?auto_533114 ?auto_533116 ) ) ( not ( = ?auto_533114 ?auto_533117 ) ) ( not ( = ?auto_533114 ?auto_533118 ) ) ( not ( = ?auto_533114 ?auto_533119 ) ) ( not ( = ?auto_533114 ?auto_533120 ) ) ( not ( = ?auto_533114 ?auto_533121 ) ) ( not ( = ?auto_533114 ?auto_533122 ) ) ( not ( = ?auto_533114 ?auto_533123 ) ) ( not ( = ?auto_533114 ?auto_533124 ) ) ( not ( = ?auto_533114 ?auto_533125 ) ) ( not ( = ?auto_533114 ?auto_533126 ) ) ( not ( = ?auto_533114 ?auto_533127 ) ) ( not ( = ?auto_533114 ?auto_533128 ) ) ( not ( = ?auto_533114 ?auto_533129 ) ) ( not ( = ?auto_533115 ?auto_533116 ) ) ( not ( = ?auto_533115 ?auto_533117 ) ) ( not ( = ?auto_533115 ?auto_533118 ) ) ( not ( = ?auto_533115 ?auto_533119 ) ) ( not ( = ?auto_533115 ?auto_533120 ) ) ( not ( = ?auto_533115 ?auto_533121 ) ) ( not ( = ?auto_533115 ?auto_533122 ) ) ( not ( = ?auto_533115 ?auto_533123 ) ) ( not ( = ?auto_533115 ?auto_533124 ) ) ( not ( = ?auto_533115 ?auto_533125 ) ) ( not ( = ?auto_533115 ?auto_533126 ) ) ( not ( = ?auto_533115 ?auto_533127 ) ) ( not ( = ?auto_533115 ?auto_533128 ) ) ( not ( = ?auto_533115 ?auto_533129 ) ) ( not ( = ?auto_533116 ?auto_533117 ) ) ( not ( = ?auto_533116 ?auto_533118 ) ) ( not ( = ?auto_533116 ?auto_533119 ) ) ( not ( = ?auto_533116 ?auto_533120 ) ) ( not ( = ?auto_533116 ?auto_533121 ) ) ( not ( = ?auto_533116 ?auto_533122 ) ) ( not ( = ?auto_533116 ?auto_533123 ) ) ( not ( = ?auto_533116 ?auto_533124 ) ) ( not ( = ?auto_533116 ?auto_533125 ) ) ( not ( = ?auto_533116 ?auto_533126 ) ) ( not ( = ?auto_533116 ?auto_533127 ) ) ( not ( = ?auto_533116 ?auto_533128 ) ) ( not ( = ?auto_533116 ?auto_533129 ) ) ( not ( = ?auto_533117 ?auto_533118 ) ) ( not ( = ?auto_533117 ?auto_533119 ) ) ( not ( = ?auto_533117 ?auto_533120 ) ) ( not ( = ?auto_533117 ?auto_533121 ) ) ( not ( = ?auto_533117 ?auto_533122 ) ) ( not ( = ?auto_533117 ?auto_533123 ) ) ( not ( = ?auto_533117 ?auto_533124 ) ) ( not ( = ?auto_533117 ?auto_533125 ) ) ( not ( = ?auto_533117 ?auto_533126 ) ) ( not ( = ?auto_533117 ?auto_533127 ) ) ( not ( = ?auto_533117 ?auto_533128 ) ) ( not ( = ?auto_533117 ?auto_533129 ) ) ( not ( = ?auto_533118 ?auto_533119 ) ) ( not ( = ?auto_533118 ?auto_533120 ) ) ( not ( = ?auto_533118 ?auto_533121 ) ) ( not ( = ?auto_533118 ?auto_533122 ) ) ( not ( = ?auto_533118 ?auto_533123 ) ) ( not ( = ?auto_533118 ?auto_533124 ) ) ( not ( = ?auto_533118 ?auto_533125 ) ) ( not ( = ?auto_533118 ?auto_533126 ) ) ( not ( = ?auto_533118 ?auto_533127 ) ) ( not ( = ?auto_533118 ?auto_533128 ) ) ( not ( = ?auto_533118 ?auto_533129 ) ) ( not ( = ?auto_533119 ?auto_533120 ) ) ( not ( = ?auto_533119 ?auto_533121 ) ) ( not ( = ?auto_533119 ?auto_533122 ) ) ( not ( = ?auto_533119 ?auto_533123 ) ) ( not ( = ?auto_533119 ?auto_533124 ) ) ( not ( = ?auto_533119 ?auto_533125 ) ) ( not ( = ?auto_533119 ?auto_533126 ) ) ( not ( = ?auto_533119 ?auto_533127 ) ) ( not ( = ?auto_533119 ?auto_533128 ) ) ( not ( = ?auto_533119 ?auto_533129 ) ) ( not ( = ?auto_533120 ?auto_533121 ) ) ( not ( = ?auto_533120 ?auto_533122 ) ) ( not ( = ?auto_533120 ?auto_533123 ) ) ( not ( = ?auto_533120 ?auto_533124 ) ) ( not ( = ?auto_533120 ?auto_533125 ) ) ( not ( = ?auto_533120 ?auto_533126 ) ) ( not ( = ?auto_533120 ?auto_533127 ) ) ( not ( = ?auto_533120 ?auto_533128 ) ) ( not ( = ?auto_533120 ?auto_533129 ) ) ( not ( = ?auto_533121 ?auto_533122 ) ) ( not ( = ?auto_533121 ?auto_533123 ) ) ( not ( = ?auto_533121 ?auto_533124 ) ) ( not ( = ?auto_533121 ?auto_533125 ) ) ( not ( = ?auto_533121 ?auto_533126 ) ) ( not ( = ?auto_533121 ?auto_533127 ) ) ( not ( = ?auto_533121 ?auto_533128 ) ) ( not ( = ?auto_533121 ?auto_533129 ) ) ( not ( = ?auto_533122 ?auto_533123 ) ) ( not ( = ?auto_533122 ?auto_533124 ) ) ( not ( = ?auto_533122 ?auto_533125 ) ) ( not ( = ?auto_533122 ?auto_533126 ) ) ( not ( = ?auto_533122 ?auto_533127 ) ) ( not ( = ?auto_533122 ?auto_533128 ) ) ( not ( = ?auto_533122 ?auto_533129 ) ) ( not ( = ?auto_533123 ?auto_533124 ) ) ( not ( = ?auto_533123 ?auto_533125 ) ) ( not ( = ?auto_533123 ?auto_533126 ) ) ( not ( = ?auto_533123 ?auto_533127 ) ) ( not ( = ?auto_533123 ?auto_533128 ) ) ( not ( = ?auto_533123 ?auto_533129 ) ) ( not ( = ?auto_533124 ?auto_533125 ) ) ( not ( = ?auto_533124 ?auto_533126 ) ) ( not ( = ?auto_533124 ?auto_533127 ) ) ( not ( = ?auto_533124 ?auto_533128 ) ) ( not ( = ?auto_533124 ?auto_533129 ) ) ( not ( = ?auto_533125 ?auto_533126 ) ) ( not ( = ?auto_533125 ?auto_533127 ) ) ( not ( = ?auto_533125 ?auto_533128 ) ) ( not ( = ?auto_533125 ?auto_533129 ) ) ( not ( = ?auto_533126 ?auto_533127 ) ) ( not ( = ?auto_533126 ?auto_533128 ) ) ( not ( = ?auto_533126 ?auto_533129 ) ) ( not ( = ?auto_533127 ?auto_533128 ) ) ( not ( = ?auto_533127 ?auto_533129 ) ) ( not ( = ?auto_533128 ?auto_533129 ) ) ( ON ?auto_533128 ?auto_533129 ) ( ON ?auto_533127 ?auto_533128 ) ( CLEAR ?auto_533125 ) ( ON ?auto_533126 ?auto_533127 ) ( CLEAR ?auto_533126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_533114 ?auto_533115 ?auto_533116 ?auto_533117 ?auto_533118 ?auto_533119 ?auto_533120 ?auto_533121 ?auto_533122 ?auto_533123 ?auto_533124 ?auto_533125 ?auto_533126 )
      ( MAKE-16PILE ?auto_533114 ?auto_533115 ?auto_533116 ?auto_533117 ?auto_533118 ?auto_533119 ?auto_533120 ?auto_533121 ?auto_533122 ?auto_533123 ?auto_533124 ?auto_533125 ?auto_533126 ?auto_533127 ?auto_533128 ?auto_533129 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533146 - BLOCK
      ?auto_533147 - BLOCK
      ?auto_533148 - BLOCK
      ?auto_533149 - BLOCK
      ?auto_533150 - BLOCK
      ?auto_533151 - BLOCK
      ?auto_533152 - BLOCK
      ?auto_533153 - BLOCK
      ?auto_533154 - BLOCK
      ?auto_533155 - BLOCK
      ?auto_533156 - BLOCK
      ?auto_533157 - BLOCK
      ?auto_533158 - BLOCK
      ?auto_533159 - BLOCK
      ?auto_533160 - BLOCK
      ?auto_533161 - BLOCK
    )
    :vars
    (
      ?auto_533162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533161 ?auto_533162 ) ( ON-TABLE ?auto_533146 ) ( ON ?auto_533147 ?auto_533146 ) ( ON ?auto_533148 ?auto_533147 ) ( ON ?auto_533149 ?auto_533148 ) ( ON ?auto_533150 ?auto_533149 ) ( ON ?auto_533151 ?auto_533150 ) ( ON ?auto_533152 ?auto_533151 ) ( ON ?auto_533153 ?auto_533152 ) ( ON ?auto_533154 ?auto_533153 ) ( ON ?auto_533155 ?auto_533154 ) ( ON ?auto_533156 ?auto_533155 ) ( not ( = ?auto_533146 ?auto_533147 ) ) ( not ( = ?auto_533146 ?auto_533148 ) ) ( not ( = ?auto_533146 ?auto_533149 ) ) ( not ( = ?auto_533146 ?auto_533150 ) ) ( not ( = ?auto_533146 ?auto_533151 ) ) ( not ( = ?auto_533146 ?auto_533152 ) ) ( not ( = ?auto_533146 ?auto_533153 ) ) ( not ( = ?auto_533146 ?auto_533154 ) ) ( not ( = ?auto_533146 ?auto_533155 ) ) ( not ( = ?auto_533146 ?auto_533156 ) ) ( not ( = ?auto_533146 ?auto_533157 ) ) ( not ( = ?auto_533146 ?auto_533158 ) ) ( not ( = ?auto_533146 ?auto_533159 ) ) ( not ( = ?auto_533146 ?auto_533160 ) ) ( not ( = ?auto_533146 ?auto_533161 ) ) ( not ( = ?auto_533146 ?auto_533162 ) ) ( not ( = ?auto_533147 ?auto_533148 ) ) ( not ( = ?auto_533147 ?auto_533149 ) ) ( not ( = ?auto_533147 ?auto_533150 ) ) ( not ( = ?auto_533147 ?auto_533151 ) ) ( not ( = ?auto_533147 ?auto_533152 ) ) ( not ( = ?auto_533147 ?auto_533153 ) ) ( not ( = ?auto_533147 ?auto_533154 ) ) ( not ( = ?auto_533147 ?auto_533155 ) ) ( not ( = ?auto_533147 ?auto_533156 ) ) ( not ( = ?auto_533147 ?auto_533157 ) ) ( not ( = ?auto_533147 ?auto_533158 ) ) ( not ( = ?auto_533147 ?auto_533159 ) ) ( not ( = ?auto_533147 ?auto_533160 ) ) ( not ( = ?auto_533147 ?auto_533161 ) ) ( not ( = ?auto_533147 ?auto_533162 ) ) ( not ( = ?auto_533148 ?auto_533149 ) ) ( not ( = ?auto_533148 ?auto_533150 ) ) ( not ( = ?auto_533148 ?auto_533151 ) ) ( not ( = ?auto_533148 ?auto_533152 ) ) ( not ( = ?auto_533148 ?auto_533153 ) ) ( not ( = ?auto_533148 ?auto_533154 ) ) ( not ( = ?auto_533148 ?auto_533155 ) ) ( not ( = ?auto_533148 ?auto_533156 ) ) ( not ( = ?auto_533148 ?auto_533157 ) ) ( not ( = ?auto_533148 ?auto_533158 ) ) ( not ( = ?auto_533148 ?auto_533159 ) ) ( not ( = ?auto_533148 ?auto_533160 ) ) ( not ( = ?auto_533148 ?auto_533161 ) ) ( not ( = ?auto_533148 ?auto_533162 ) ) ( not ( = ?auto_533149 ?auto_533150 ) ) ( not ( = ?auto_533149 ?auto_533151 ) ) ( not ( = ?auto_533149 ?auto_533152 ) ) ( not ( = ?auto_533149 ?auto_533153 ) ) ( not ( = ?auto_533149 ?auto_533154 ) ) ( not ( = ?auto_533149 ?auto_533155 ) ) ( not ( = ?auto_533149 ?auto_533156 ) ) ( not ( = ?auto_533149 ?auto_533157 ) ) ( not ( = ?auto_533149 ?auto_533158 ) ) ( not ( = ?auto_533149 ?auto_533159 ) ) ( not ( = ?auto_533149 ?auto_533160 ) ) ( not ( = ?auto_533149 ?auto_533161 ) ) ( not ( = ?auto_533149 ?auto_533162 ) ) ( not ( = ?auto_533150 ?auto_533151 ) ) ( not ( = ?auto_533150 ?auto_533152 ) ) ( not ( = ?auto_533150 ?auto_533153 ) ) ( not ( = ?auto_533150 ?auto_533154 ) ) ( not ( = ?auto_533150 ?auto_533155 ) ) ( not ( = ?auto_533150 ?auto_533156 ) ) ( not ( = ?auto_533150 ?auto_533157 ) ) ( not ( = ?auto_533150 ?auto_533158 ) ) ( not ( = ?auto_533150 ?auto_533159 ) ) ( not ( = ?auto_533150 ?auto_533160 ) ) ( not ( = ?auto_533150 ?auto_533161 ) ) ( not ( = ?auto_533150 ?auto_533162 ) ) ( not ( = ?auto_533151 ?auto_533152 ) ) ( not ( = ?auto_533151 ?auto_533153 ) ) ( not ( = ?auto_533151 ?auto_533154 ) ) ( not ( = ?auto_533151 ?auto_533155 ) ) ( not ( = ?auto_533151 ?auto_533156 ) ) ( not ( = ?auto_533151 ?auto_533157 ) ) ( not ( = ?auto_533151 ?auto_533158 ) ) ( not ( = ?auto_533151 ?auto_533159 ) ) ( not ( = ?auto_533151 ?auto_533160 ) ) ( not ( = ?auto_533151 ?auto_533161 ) ) ( not ( = ?auto_533151 ?auto_533162 ) ) ( not ( = ?auto_533152 ?auto_533153 ) ) ( not ( = ?auto_533152 ?auto_533154 ) ) ( not ( = ?auto_533152 ?auto_533155 ) ) ( not ( = ?auto_533152 ?auto_533156 ) ) ( not ( = ?auto_533152 ?auto_533157 ) ) ( not ( = ?auto_533152 ?auto_533158 ) ) ( not ( = ?auto_533152 ?auto_533159 ) ) ( not ( = ?auto_533152 ?auto_533160 ) ) ( not ( = ?auto_533152 ?auto_533161 ) ) ( not ( = ?auto_533152 ?auto_533162 ) ) ( not ( = ?auto_533153 ?auto_533154 ) ) ( not ( = ?auto_533153 ?auto_533155 ) ) ( not ( = ?auto_533153 ?auto_533156 ) ) ( not ( = ?auto_533153 ?auto_533157 ) ) ( not ( = ?auto_533153 ?auto_533158 ) ) ( not ( = ?auto_533153 ?auto_533159 ) ) ( not ( = ?auto_533153 ?auto_533160 ) ) ( not ( = ?auto_533153 ?auto_533161 ) ) ( not ( = ?auto_533153 ?auto_533162 ) ) ( not ( = ?auto_533154 ?auto_533155 ) ) ( not ( = ?auto_533154 ?auto_533156 ) ) ( not ( = ?auto_533154 ?auto_533157 ) ) ( not ( = ?auto_533154 ?auto_533158 ) ) ( not ( = ?auto_533154 ?auto_533159 ) ) ( not ( = ?auto_533154 ?auto_533160 ) ) ( not ( = ?auto_533154 ?auto_533161 ) ) ( not ( = ?auto_533154 ?auto_533162 ) ) ( not ( = ?auto_533155 ?auto_533156 ) ) ( not ( = ?auto_533155 ?auto_533157 ) ) ( not ( = ?auto_533155 ?auto_533158 ) ) ( not ( = ?auto_533155 ?auto_533159 ) ) ( not ( = ?auto_533155 ?auto_533160 ) ) ( not ( = ?auto_533155 ?auto_533161 ) ) ( not ( = ?auto_533155 ?auto_533162 ) ) ( not ( = ?auto_533156 ?auto_533157 ) ) ( not ( = ?auto_533156 ?auto_533158 ) ) ( not ( = ?auto_533156 ?auto_533159 ) ) ( not ( = ?auto_533156 ?auto_533160 ) ) ( not ( = ?auto_533156 ?auto_533161 ) ) ( not ( = ?auto_533156 ?auto_533162 ) ) ( not ( = ?auto_533157 ?auto_533158 ) ) ( not ( = ?auto_533157 ?auto_533159 ) ) ( not ( = ?auto_533157 ?auto_533160 ) ) ( not ( = ?auto_533157 ?auto_533161 ) ) ( not ( = ?auto_533157 ?auto_533162 ) ) ( not ( = ?auto_533158 ?auto_533159 ) ) ( not ( = ?auto_533158 ?auto_533160 ) ) ( not ( = ?auto_533158 ?auto_533161 ) ) ( not ( = ?auto_533158 ?auto_533162 ) ) ( not ( = ?auto_533159 ?auto_533160 ) ) ( not ( = ?auto_533159 ?auto_533161 ) ) ( not ( = ?auto_533159 ?auto_533162 ) ) ( not ( = ?auto_533160 ?auto_533161 ) ) ( not ( = ?auto_533160 ?auto_533162 ) ) ( not ( = ?auto_533161 ?auto_533162 ) ) ( ON ?auto_533160 ?auto_533161 ) ( ON ?auto_533159 ?auto_533160 ) ( ON ?auto_533158 ?auto_533159 ) ( CLEAR ?auto_533156 ) ( ON ?auto_533157 ?auto_533158 ) ( CLEAR ?auto_533157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_533146 ?auto_533147 ?auto_533148 ?auto_533149 ?auto_533150 ?auto_533151 ?auto_533152 ?auto_533153 ?auto_533154 ?auto_533155 ?auto_533156 ?auto_533157 )
      ( MAKE-16PILE ?auto_533146 ?auto_533147 ?auto_533148 ?auto_533149 ?auto_533150 ?auto_533151 ?auto_533152 ?auto_533153 ?auto_533154 ?auto_533155 ?auto_533156 ?auto_533157 ?auto_533158 ?auto_533159 ?auto_533160 ?auto_533161 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533179 - BLOCK
      ?auto_533180 - BLOCK
      ?auto_533181 - BLOCK
      ?auto_533182 - BLOCK
      ?auto_533183 - BLOCK
      ?auto_533184 - BLOCK
      ?auto_533185 - BLOCK
      ?auto_533186 - BLOCK
      ?auto_533187 - BLOCK
      ?auto_533188 - BLOCK
      ?auto_533189 - BLOCK
      ?auto_533190 - BLOCK
      ?auto_533191 - BLOCK
      ?auto_533192 - BLOCK
      ?auto_533193 - BLOCK
      ?auto_533194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533194 ) ( ON-TABLE ?auto_533179 ) ( ON ?auto_533180 ?auto_533179 ) ( ON ?auto_533181 ?auto_533180 ) ( ON ?auto_533182 ?auto_533181 ) ( ON ?auto_533183 ?auto_533182 ) ( ON ?auto_533184 ?auto_533183 ) ( ON ?auto_533185 ?auto_533184 ) ( ON ?auto_533186 ?auto_533185 ) ( ON ?auto_533187 ?auto_533186 ) ( ON ?auto_533188 ?auto_533187 ) ( ON ?auto_533189 ?auto_533188 ) ( not ( = ?auto_533179 ?auto_533180 ) ) ( not ( = ?auto_533179 ?auto_533181 ) ) ( not ( = ?auto_533179 ?auto_533182 ) ) ( not ( = ?auto_533179 ?auto_533183 ) ) ( not ( = ?auto_533179 ?auto_533184 ) ) ( not ( = ?auto_533179 ?auto_533185 ) ) ( not ( = ?auto_533179 ?auto_533186 ) ) ( not ( = ?auto_533179 ?auto_533187 ) ) ( not ( = ?auto_533179 ?auto_533188 ) ) ( not ( = ?auto_533179 ?auto_533189 ) ) ( not ( = ?auto_533179 ?auto_533190 ) ) ( not ( = ?auto_533179 ?auto_533191 ) ) ( not ( = ?auto_533179 ?auto_533192 ) ) ( not ( = ?auto_533179 ?auto_533193 ) ) ( not ( = ?auto_533179 ?auto_533194 ) ) ( not ( = ?auto_533180 ?auto_533181 ) ) ( not ( = ?auto_533180 ?auto_533182 ) ) ( not ( = ?auto_533180 ?auto_533183 ) ) ( not ( = ?auto_533180 ?auto_533184 ) ) ( not ( = ?auto_533180 ?auto_533185 ) ) ( not ( = ?auto_533180 ?auto_533186 ) ) ( not ( = ?auto_533180 ?auto_533187 ) ) ( not ( = ?auto_533180 ?auto_533188 ) ) ( not ( = ?auto_533180 ?auto_533189 ) ) ( not ( = ?auto_533180 ?auto_533190 ) ) ( not ( = ?auto_533180 ?auto_533191 ) ) ( not ( = ?auto_533180 ?auto_533192 ) ) ( not ( = ?auto_533180 ?auto_533193 ) ) ( not ( = ?auto_533180 ?auto_533194 ) ) ( not ( = ?auto_533181 ?auto_533182 ) ) ( not ( = ?auto_533181 ?auto_533183 ) ) ( not ( = ?auto_533181 ?auto_533184 ) ) ( not ( = ?auto_533181 ?auto_533185 ) ) ( not ( = ?auto_533181 ?auto_533186 ) ) ( not ( = ?auto_533181 ?auto_533187 ) ) ( not ( = ?auto_533181 ?auto_533188 ) ) ( not ( = ?auto_533181 ?auto_533189 ) ) ( not ( = ?auto_533181 ?auto_533190 ) ) ( not ( = ?auto_533181 ?auto_533191 ) ) ( not ( = ?auto_533181 ?auto_533192 ) ) ( not ( = ?auto_533181 ?auto_533193 ) ) ( not ( = ?auto_533181 ?auto_533194 ) ) ( not ( = ?auto_533182 ?auto_533183 ) ) ( not ( = ?auto_533182 ?auto_533184 ) ) ( not ( = ?auto_533182 ?auto_533185 ) ) ( not ( = ?auto_533182 ?auto_533186 ) ) ( not ( = ?auto_533182 ?auto_533187 ) ) ( not ( = ?auto_533182 ?auto_533188 ) ) ( not ( = ?auto_533182 ?auto_533189 ) ) ( not ( = ?auto_533182 ?auto_533190 ) ) ( not ( = ?auto_533182 ?auto_533191 ) ) ( not ( = ?auto_533182 ?auto_533192 ) ) ( not ( = ?auto_533182 ?auto_533193 ) ) ( not ( = ?auto_533182 ?auto_533194 ) ) ( not ( = ?auto_533183 ?auto_533184 ) ) ( not ( = ?auto_533183 ?auto_533185 ) ) ( not ( = ?auto_533183 ?auto_533186 ) ) ( not ( = ?auto_533183 ?auto_533187 ) ) ( not ( = ?auto_533183 ?auto_533188 ) ) ( not ( = ?auto_533183 ?auto_533189 ) ) ( not ( = ?auto_533183 ?auto_533190 ) ) ( not ( = ?auto_533183 ?auto_533191 ) ) ( not ( = ?auto_533183 ?auto_533192 ) ) ( not ( = ?auto_533183 ?auto_533193 ) ) ( not ( = ?auto_533183 ?auto_533194 ) ) ( not ( = ?auto_533184 ?auto_533185 ) ) ( not ( = ?auto_533184 ?auto_533186 ) ) ( not ( = ?auto_533184 ?auto_533187 ) ) ( not ( = ?auto_533184 ?auto_533188 ) ) ( not ( = ?auto_533184 ?auto_533189 ) ) ( not ( = ?auto_533184 ?auto_533190 ) ) ( not ( = ?auto_533184 ?auto_533191 ) ) ( not ( = ?auto_533184 ?auto_533192 ) ) ( not ( = ?auto_533184 ?auto_533193 ) ) ( not ( = ?auto_533184 ?auto_533194 ) ) ( not ( = ?auto_533185 ?auto_533186 ) ) ( not ( = ?auto_533185 ?auto_533187 ) ) ( not ( = ?auto_533185 ?auto_533188 ) ) ( not ( = ?auto_533185 ?auto_533189 ) ) ( not ( = ?auto_533185 ?auto_533190 ) ) ( not ( = ?auto_533185 ?auto_533191 ) ) ( not ( = ?auto_533185 ?auto_533192 ) ) ( not ( = ?auto_533185 ?auto_533193 ) ) ( not ( = ?auto_533185 ?auto_533194 ) ) ( not ( = ?auto_533186 ?auto_533187 ) ) ( not ( = ?auto_533186 ?auto_533188 ) ) ( not ( = ?auto_533186 ?auto_533189 ) ) ( not ( = ?auto_533186 ?auto_533190 ) ) ( not ( = ?auto_533186 ?auto_533191 ) ) ( not ( = ?auto_533186 ?auto_533192 ) ) ( not ( = ?auto_533186 ?auto_533193 ) ) ( not ( = ?auto_533186 ?auto_533194 ) ) ( not ( = ?auto_533187 ?auto_533188 ) ) ( not ( = ?auto_533187 ?auto_533189 ) ) ( not ( = ?auto_533187 ?auto_533190 ) ) ( not ( = ?auto_533187 ?auto_533191 ) ) ( not ( = ?auto_533187 ?auto_533192 ) ) ( not ( = ?auto_533187 ?auto_533193 ) ) ( not ( = ?auto_533187 ?auto_533194 ) ) ( not ( = ?auto_533188 ?auto_533189 ) ) ( not ( = ?auto_533188 ?auto_533190 ) ) ( not ( = ?auto_533188 ?auto_533191 ) ) ( not ( = ?auto_533188 ?auto_533192 ) ) ( not ( = ?auto_533188 ?auto_533193 ) ) ( not ( = ?auto_533188 ?auto_533194 ) ) ( not ( = ?auto_533189 ?auto_533190 ) ) ( not ( = ?auto_533189 ?auto_533191 ) ) ( not ( = ?auto_533189 ?auto_533192 ) ) ( not ( = ?auto_533189 ?auto_533193 ) ) ( not ( = ?auto_533189 ?auto_533194 ) ) ( not ( = ?auto_533190 ?auto_533191 ) ) ( not ( = ?auto_533190 ?auto_533192 ) ) ( not ( = ?auto_533190 ?auto_533193 ) ) ( not ( = ?auto_533190 ?auto_533194 ) ) ( not ( = ?auto_533191 ?auto_533192 ) ) ( not ( = ?auto_533191 ?auto_533193 ) ) ( not ( = ?auto_533191 ?auto_533194 ) ) ( not ( = ?auto_533192 ?auto_533193 ) ) ( not ( = ?auto_533192 ?auto_533194 ) ) ( not ( = ?auto_533193 ?auto_533194 ) ) ( ON ?auto_533193 ?auto_533194 ) ( ON ?auto_533192 ?auto_533193 ) ( ON ?auto_533191 ?auto_533192 ) ( CLEAR ?auto_533189 ) ( ON ?auto_533190 ?auto_533191 ) ( CLEAR ?auto_533190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_533179 ?auto_533180 ?auto_533181 ?auto_533182 ?auto_533183 ?auto_533184 ?auto_533185 ?auto_533186 ?auto_533187 ?auto_533188 ?auto_533189 ?auto_533190 )
      ( MAKE-16PILE ?auto_533179 ?auto_533180 ?auto_533181 ?auto_533182 ?auto_533183 ?auto_533184 ?auto_533185 ?auto_533186 ?auto_533187 ?auto_533188 ?auto_533189 ?auto_533190 ?auto_533191 ?auto_533192 ?auto_533193 ?auto_533194 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533211 - BLOCK
      ?auto_533212 - BLOCK
      ?auto_533213 - BLOCK
      ?auto_533214 - BLOCK
      ?auto_533215 - BLOCK
      ?auto_533216 - BLOCK
      ?auto_533217 - BLOCK
      ?auto_533218 - BLOCK
      ?auto_533219 - BLOCK
      ?auto_533220 - BLOCK
      ?auto_533221 - BLOCK
      ?auto_533222 - BLOCK
      ?auto_533223 - BLOCK
      ?auto_533224 - BLOCK
      ?auto_533225 - BLOCK
      ?auto_533226 - BLOCK
    )
    :vars
    (
      ?auto_533227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533226 ?auto_533227 ) ( ON-TABLE ?auto_533211 ) ( ON ?auto_533212 ?auto_533211 ) ( ON ?auto_533213 ?auto_533212 ) ( ON ?auto_533214 ?auto_533213 ) ( ON ?auto_533215 ?auto_533214 ) ( ON ?auto_533216 ?auto_533215 ) ( ON ?auto_533217 ?auto_533216 ) ( ON ?auto_533218 ?auto_533217 ) ( ON ?auto_533219 ?auto_533218 ) ( ON ?auto_533220 ?auto_533219 ) ( not ( = ?auto_533211 ?auto_533212 ) ) ( not ( = ?auto_533211 ?auto_533213 ) ) ( not ( = ?auto_533211 ?auto_533214 ) ) ( not ( = ?auto_533211 ?auto_533215 ) ) ( not ( = ?auto_533211 ?auto_533216 ) ) ( not ( = ?auto_533211 ?auto_533217 ) ) ( not ( = ?auto_533211 ?auto_533218 ) ) ( not ( = ?auto_533211 ?auto_533219 ) ) ( not ( = ?auto_533211 ?auto_533220 ) ) ( not ( = ?auto_533211 ?auto_533221 ) ) ( not ( = ?auto_533211 ?auto_533222 ) ) ( not ( = ?auto_533211 ?auto_533223 ) ) ( not ( = ?auto_533211 ?auto_533224 ) ) ( not ( = ?auto_533211 ?auto_533225 ) ) ( not ( = ?auto_533211 ?auto_533226 ) ) ( not ( = ?auto_533211 ?auto_533227 ) ) ( not ( = ?auto_533212 ?auto_533213 ) ) ( not ( = ?auto_533212 ?auto_533214 ) ) ( not ( = ?auto_533212 ?auto_533215 ) ) ( not ( = ?auto_533212 ?auto_533216 ) ) ( not ( = ?auto_533212 ?auto_533217 ) ) ( not ( = ?auto_533212 ?auto_533218 ) ) ( not ( = ?auto_533212 ?auto_533219 ) ) ( not ( = ?auto_533212 ?auto_533220 ) ) ( not ( = ?auto_533212 ?auto_533221 ) ) ( not ( = ?auto_533212 ?auto_533222 ) ) ( not ( = ?auto_533212 ?auto_533223 ) ) ( not ( = ?auto_533212 ?auto_533224 ) ) ( not ( = ?auto_533212 ?auto_533225 ) ) ( not ( = ?auto_533212 ?auto_533226 ) ) ( not ( = ?auto_533212 ?auto_533227 ) ) ( not ( = ?auto_533213 ?auto_533214 ) ) ( not ( = ?auto_533213 ?auto_533215 ) ) ( not ( = ?auto_533213 ?auto_533216 ) ) ( not ( = ?auto_533213 ?auto_533217 ) ) ( not ( = ?auto_533213 ?auto_533218 ) ) ( not ( = ?auto_533213 ?auto_533219 ) ) ( not ( = ?auto_533213 ?auto_533220 ) ) ( not ( = ?auto_533213 ?auto_533221 ) ) ( not ( = ?auto_533213 ?auto_533222 ) ) ( not ( = ?auto_533213 ?auto_533223 ) ) ( not ( = ?auto_533213 ?auto_533224 ) ) ( not ( = ?auto_533213 ?auto_533225 ) ) ( not ( = ?auto_533213 ?auto_533226 ) ) ( not ( = ?auto_533213 ?auto_533227 ) ) ( not ( = ?auto_533214 ?auto_533215 ) ) ( not ( = ?auto_533214 ?auto_533216 ) ) ( not ( = ?auto_533214 ?auto_533217 ) ) ( not ( = ?auto_533214 ?auto_533218 ) ) ( not ( = ?auto_533214 ?auto_533219 ) ) ( not ( = ?auto_533214 ?auto_533220 ) ) ( not ( = ?auto_533214 ?auto_533221 ) ) ( not ( = ?auto_533214 ?auto_533222 ) ) ( not ( = ?auto_533214 ?auto_533223 ) ) ( not ( = ?auto_533214 ?auto_533224 ) ) ( not ( = ?auto_533214 ?auto_533225 ) ) ( not ( = ?auto_533214 ?auto_533226 ) ) ( not ( = ?auto_533214 ?auto_533227 ) ) ( not ( = ?auto_533215 ?auto_533216 ) ) ( not ( = ?auto_533215 ?auto_533217 ) ) ( not ( = ?auto_533215 ?auto_533218 ) ) ( not ( = ?auto_533215 ?auto_533219 ) ) ( not ( = ?auto_533215 ?auto_533220 ) ) ( not ( = ?auto_533215 ?auto_533221 ) ) ( not ( = ?auto_533215 ?auto_533222 ) ) ( not ( = ?auto_533215 ?auto_533223 ) ) ( not ( = ?auto_533215 ?auto_533224 ) ) ( not ( = ?auto_533215 ?auto_533225 ) ) ( not ( = ?auto_533215 ?auto_533226 ) ) ( not ( = ?auto_533215 ?auto_533227 ) ) ( not ( = ?auto_533216 ?auto_533217 ) ) ( not ( = ?auto_533216 ?auto_533218 ) ) ( not ( = ?auto_533216 ?auto_533219 ) ) ( not ( = ?auto_533216 ?auto_533220 ) ) ( not ( = ?auto_533216 ?auto_533221 ) ) ( not ( = ?auto_533216 ?auto_533222 ) ) ( not ( = ?auto_533216 ?auto_533223 ) ) ( not ( = ?auto_533216 ?auto_533224 ) ) ( not ( = ?auto_533216 ?auto_533225 ) ) ( not ( = ?auto_533216 ?auto_533226 ) ) ( not ( = ?auto_533216 ?auto_533227 ) ) ( not ( = ?auto_533217 ?auto_533218 ) ) ( not ( = ?auto_533217 ?auto_533219 ) ) ( not ( = ?auto_533217 ?auto_533220 ) ) ( not ( = ?auto_533217 ?auto_533221 ) ) ( not ( = ?auto_533217 ?auto_533222 ) ) ( not ( = ?auto_533217 ?auto_533223 ) ) ( not ( = ?auto_533217 ?auto_533224 ) ) ( not ( = ?auto_533217 ?auto_533225 ) ) ( not ( = ?auto_533217 ?auto_533226 ) ) ( not ( = ?auto_533217 ?auto_533227 ) ) ( not ( = ?auto_533218 ?auto_533219 ) ) ( not ( = ?auto_533218 ?auto_533220 ) ) ( not ( = ?auto_533218 ?auto_533221 ) ) ( not ( = ?auto_533218 ?auto_533222 ) ) ( not ( = ?auto_533218 ?auto_533223 ) ) ( not ( = ?auto_533218 ?auto_533224 ) ) ( not ( = ?auto_533218 ?auto_533225 ) ) ( not ( = ?auto_533218 ?auto_533226 ) ) ( not ( = ?auto_533218 ?auto_533227 ) ) ( not ( = ?auto_533219 ?auto_533220 ) ) ( not ( = ?auto_533219 ?auto_533221 ) ) ( not ( = ?auto_533219 ?auto_533222 ) ) ( not ( = ?auto_533219 ?auto_533223 ) ) ( not ( = ?auto_533219 ?auto_533224 ) ) ( not ( = ?auto_533219 ?auto_533225 ) ) ( not ( = ?auto_533219 ?auto_533226 ) ) ( not ( = ?auto_533219 ?auto_533227 ) ) ( not ( = ?auto_533220 ?auto_533221 ) ) ( not ( = ?auto_533220 ?auto_533222 ) ) ( not ( = ?auto_533220 ?auto_533223 ) ) ( not ( = ?auto_533220 ?auto_533224 ) ) ( not ( = ?auto_533220 ?auto_533225 ) ) ( not ( = ?auto_533220 ?auto_533226 ) ) ( not ( = ?auto_533220 ?auto_533227 ) ) ( not ( = ?auto_533221 ?auto_533222 ) ) ( not ( = ?auto_533221 ?auto_533223 ) ) ( not ( = ?auto_533221 ?auto_533224 ) ) ( not ( = ?auto_533221 ?auto_533225 ) ) ( not ( = ?auto_533221 ?auto_533226 ) ) ( not ( = ?auto_533221 ?auto_533227 ) ) ( not ( = ?auto_533222 ?auto_533223 ) ) ( not ( = ?auto_533222 ?auto_533224 ) ) ( not ( = ?auto_533222 ?auto_533225 ) ) ( not ( = ?auto_533222 ?auto_533226 ) ) ( not ( = ?auto_533222 ?auto_533227 ) ) ( not ( = ?auto_533223 ?auto_533224 ) ) ( not ( = ?auto_533223 ?auto_533225 ) ) ( not ( = ?auto_533223 ?auto_533226 ) ) ( not ( = ?auto_533223 ?auto_533227 ) ) ( not ( = ?auto_533224 ?auto_533225 ) ) ( not ( = ?auto_533224 ?auto_533226 ) ) ( not ( = ?auto_533224 ?auto_533227 ) ) ( not ( = ?auto_533225 ?auto_533226 ) ) ( not ( = ?auto_533225 ?auto_533227 ) ) ( not ( = ?auto_533226 ?auto_533227 ) ) ( ON ?auto_533225 ?auto_533226 ) ( ON ?auto_533224 ?auto_533225 ) ( ON ?auto_533223 ?auto_533224 ) ( ON ?auto_533222 ?auto_533223 ) ( CLEAR ?auto_533220 ) ( ON ?auto_533221 ?auto_533222 ) ( CLEAR ?auto_533221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_533211 ?auto_533212 ?auto_533213 ?auto_533214 ?auto_533215 ?auto_533216 ?auto_533217 ?auto_533218 ?auto_533219 ?auto_533220 ?auto_533221 )
      ( MAKE-16PILE ?auto_533211 ?auto_533212 ?auto_533213 ?auto_533214 ?auto_533215 ?auto_533216 ?auto_533217 ?auto_533218 ?auto_533219 ?auto_533220 ?auto_533221 ?auto_533222 ?auto_533223 ?auto_533224 ?auto_533225 ?auto_533226 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533244 - BLOCK
      ?auto_533245 - BLOCK
      ?auto_533246 - BLOCK
      ?auto_533247 - BLOCK
      ?auto_533248 - BLOCK
      ?auto_533249 - BLOCK
      ?auto_533250 - BLOCK
      ?auto_533251 - BLOCK
      ?auto_533252 - BLOCK
      ?auto_533253 - BLOCK
      ?auto_533254 - BLOCK
      ?auto_533255 - BLOCK
      ?auto_533256 - BLOCK
      ?auto_533257 - BLOCK
      ?auto_533258 - BLOCK
      ?auto_533259 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533259 ) ( ON-TABLE ?auto_533244 ) ( ON ?auto_533245 ?auto_533244 ) ( ON ?auto_533246 ?auto_533245 ) ( ON ?auto_533247 ?auto_533246 ) ( ON ?auto_533248 ?auto_533247 ) ( ON ?auto_533249 ?auto_533248 ) ( ON ?auto_533250 ?auto_533249 ) ( ON ?auto_533251 ?auto_533250 ) ( ON ?auto_533252 ?auto_533251 ) ( ON ?auto_533253 ?auto_533252 ) ( not ( = ?auto_533244 ?auto_533245 ) ) ( not ( = ?auto_533244 ?auto_533246 ) ) ( not ( = ?auto_533244 ?auto_533247 ) ) ( not ( = ?auto_533244 ?auto_533248 ) ) ( not ( = ?auto_533244 ?auto_533249 ) ) ( not ( = ?auto_533244 ?auto_533250 ) ) ( not ( = ?auto_533244 ?auto_533251 ) ) ( not ( = ?auto_533244 ?auto_533252 ) ) ( not ( = ?auto_533244 ?auto_533253 ) ) ( not ( = ?auto_533244 ?auto_533254 ) ) ( not ( = ?auto_533244 ?auto_533255 ) ) ( not ( = ?auto_533244 ?auto_533256 ) ) ( not ( = ?auto_533244 ?auto_533257 ) ) ( not ( = ?auto_533244 ?auto_533258 ) ) ( not ( = ?auto_533244 ?auto_533259 ) ) ( not ( = ?auto_533245 ?auto_533246 ) ) ( not ( = ?auto_533245 ?auto_533247 ) ) ( not ( = ?auto_533245 ?auto_533248 ) ) ( not ( = ?auto_533245 ?auto_533249 ) ) ( not ( = ?auto_533245 ?auto_533250 ) ) ( not ( = ?auto_533245 ?auto_533251 ) ) ( not ( = ?auto_533245 ?auto_533252 ) ) ( not ( = ?auto_533245 ?auto_533253 ) ) ( not ( = ?auto_533245 ?auto_533254 ) ) ( not ( = ?auto_533245 ?auto_533255 ) ) ( not ( = ?auto_533245 ?auto_533256 ) ) ( not ( = ?auto_533245 ?auto_533257 ) ) ( not ( = ?auto_533245 ?auto_533258 ) ) ( not ( = ?auto_533245 ?auto_533259 ) ) ( not ( = ?auto_533246 ?auto_533247 ) ) ( not ( = ?auto_533246 ?auto_533248 ) ) ( not ( = ?auto_533246 ?auto_533249 ) ) ( not ( = ?auto_533246 ?auto_533250 ) ) ( not ( = ?auto_533246 ?auto_533251 ) ) ( not ( = ?auto_533246 ?auto_533252 ) ) ( not ( = ?auto_533246 ?auto_533253 ) ) ( not ( = ?auto_533246 ?auto_533254 ) ) ( not ( = ?auto_533246 ?auto_533255 ) ) ( not ( = ?auto_533246 ?auto_533256 ) ) ( not ( = ?auto_533246 ?auto_533257 ) ) ( not ( = ?auto_533246 ?auto_533258 ) ) ( not ( = ?auto_533246 ?auto_533259 ) ) ( not ( = ?auto_533247 ?auto_533248 ) ) ( not ( = ?auto_533247 ?auto_533249 ) ) ( not ( = ?auto_533247 ?auto_533250 ) ) ( not ( = ?auto_533247 ?auto_533251 ) ) ( not ( = ?auto_533247 ?auto_533252 ) ) ( not ( = ?auto_533247 ?auto_533253 ) ) ( not ( = ?auto_533247 ?auto_533254 ) ) ( not ( = ?auto_533247 ?auto_533255 ) ) ( not ( = ?auto_533247 ?auto_533256 ) ) ( not ( = ?auto_533247 ?auto_533257 ) ) ( not ( = ?auto_533247 ?auto_533258 ) ) ( not ( = ?auto_533247 ?auto_533259 ) ) ( not ( = ?auto_533248 ?auto_533249 ) ) ( not ( = ?auto_533248 ?auto_533250 ) ) ( not ( = ?auto_533248 ?auto_533251 ) ) ( not ( = ?auto_533248 ?auto_533252 ) ) ( not ( = ?auto_533248 ?auto_533253 ) ) ( not ( = ?auto_533248 ?auto_533254 ) ) ( not ( = ?auto_533248 ?auto_533255 ) ) ( not ( = ?auto_533248 ?auto_533256 ) ) ( not ( = ?auto_533248 ?auto_533257 ) ) ( not ( = ?auto_533248 ?auto_533258 ) ) ( not ( = ?auto_533248 ?auto_533259 ) ) ( not ( = ?auto_533249 ?auto_533250 ) ) ( not ( = ?auto_533249 ?auto_533251 ) ) ( not ( = ?auto_533249 ?auto_533252 ) ) ( not ( = ?auto_533249 ?auto_533253 ) ) ( not ( = ?auto_533249 ?auto_533254 ) ) ( not ( = ?auto_533249 ?auto_533255 ) ) ( not ( = ?auto_533249 ?auto_533256 ) ) ( not ( = ?auto_533249 ?auto_533257 ) ) ( not ( = ?auto_533249 ?auto_533258 ) ) ( not ( = ?auto_533249 ?auto_533259 ) ) ( not ( = ?auto_533250 ?auto_533251 ) ) ( not ( = ?auto_533250 ?auto_533252 ) ) ( not ( = ?auto_533250 ?auto_533253 ) ) ( not ( = ?auto_533250 ?auto_533254 ) ) ( not ( = ?auto_533250 ?auto_533255 ) ) ( not ( = ?auto_533250 ?auto_533256 ) ) ( not ( = ?auto_533250 ?auto_533257 ) ) ( not ( = ?auto_533250 ?auto_533258 ) ) ( not ( = ?auto_533250 ?auto_533259 ) ) ( not ( = ?auto_533251 ?auto_533252 ) ) ( not ( = ?auto_533251 ?auto_533253 ) ) ( not ( = ?auto_533251 ?auto_533254 ) ) ( not ( = ?auto_533251 ?auto_533255 ) ) ( not ( = ?auto_533251 ?auto_533256 ) ) ( not ( = ?auto_533251 ?auto_533257 ) ) ( not ( = ?auto_533251 ?auto_533258 ) ) ( not ( = ?auto_533251 ?auto_533259 ) ) ( not ( = ?auto_533252 ?auto_533253 ) ) ( not ( = ?auto_533252 ?auto_533254 ) ) ( not ( = ?auto_533252 ?auto_533255 ) ) ( not ( = ?auto_533252 ?auto_533256 ) ) ( not ( = ?auto_533252 ?auto_533257 ) ) ( not ( = ?auto_533252 ?auto_533258 ) ) ( not ( = ?auto_533252 ?auto_533259 ) ) ( not ( = ?auto_533253 ?auto_533254 ) ) ( not ( = ?auto_533253 ?auto_533255 ) ) ( not ( = ?auto_533253 ?auto_533256 ) ) ( not ( = ?auto_533253 ?auto_533257 ) ) ( not ( = ?auto_533253 ?auto_533258 ) ) ( not ( = ?auto_533253 ?auto_533259 ) ) ( not ( = ?auto_533254 ?auto_533255 ) ) ( not ( = ?auto_533254 ?auto_533256 ) ) ( not ( = ?auto_533254 ?auto_533257 ) ) ( not ( = ?auto_533254 ?auto_533258 ) ) ( not ( = ?auto_533254 ?auto_533259 ) ) ( not ( = ?auto_533255 ?auto_533256 ) ) ( not ( = ?auto_533255 ?auto_533257 ) ) ( not ( = ?auto_533255 ?auto_533258 ) ) ( not ( = ?auto_533255 ?auto_533259 ) ) ( not ( = ?auto_533256 ?auto_533257 ) ) ( not ( = ?auto_533256 ?auto_533258 ) ) ( not ( = ?auto_533256 ?auto_533259 ) ) ( not ( = ?auto_533257 ?auto_533258 ) ) ( not ( = ?auto_533257 ?auto_533259 ) ) ( not ( = ?auto_533258 ?auto_533259 ) ) ( ON ?auto_533258 ?auto_533259 ) ( ON ?auto_533257 ?auto_533258 ) ( ON ?auto_533256 ?auto_533257 ) ( ON ?auto_533255 ?auto_533256 ) ( CLEAR ?auto_533253 ) ( ON ?auto_533254 ?auto_533255 ) ( CLEAR ?auto_533254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_533244 ?auto_533245 ?auto_533246 ?auto_533247 ?auto_533248 ?auto_533249 ?auto_533250 ?auto_533251 ?auto_533252 ?auto_533253 ?auto_533254 )
      ( MAKE-16PILE ?auto_533244 ?auto_533245 ?auto_533246 ?auto_533247 ?auto_533248 ?auto_533249 ?auto_533250 ?auto_533251 ?auto_533252 ?auto_533253 ?auto_533254 ?auto_533255 ?auto_533256 ?auto_533257 ?auto_533258 ?auto_533259 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533276 - BLOCK
      ?auto_533277 - BLOCK
      ?auto_533278 - BLOCK
      ?auto_533279 - BLOCK
      ?auto_533280 - BLOCK
      ?auto_533281 - BLOCK
      ?auto_533282 - BLOCK
      ?auto_533283 - BLOCK
      ?auto_533284 - BLOCK
      ?auto_533285 - BLOCK
      ?auto_533286 - BLOCK
      ?auto_533287 - BLOCK
      ?auto_533288 - BLOCK
      ?auto_533289 - BLOCK
      ?auto_533290 - BLOCK
      ?auto_533291 - BLOCK
    )
    :vars
    (
      ?auto_533292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533291 ?auto_533292 ) ( ON-TABLE ?auto_533276 ) ( ON ?auto_533277 ?auto_533276 ) ( ON ?auto_533278 ?auto_533277 ) ( ON ?auto_533279 ?auto_533278 ) ( ON ?auto_533280 ?auto_533279 ) ( ON ?auto_533281 ?auto_533280 ) ( ON ?auto_533282 ?auto_533281 ) ( ON ?auto_533283 ?auto_533282 ) ( ON ?auto_533284 ?auto_533283 ) ( not ( = ?auto_533276 ?auto_533277 ) ) ( not ( = ?auto_533276 ?auto_533278 ) ) ( not ( = ?auto_533276 ?auto_533279 ) ) ( not ( = ?auto_533276 ?auto_533280 ) ) ( not ( = ?auto_533276 ?auto_533281 ) ) ( not ( = ?auto_533276 ?auto_533282 ) ) ( not ( = ?auto_533276 ?auto_533283 ) ) ( not ( = ?auto_533276 ?auto_533284 ) ) ( not ( = ?auto_533276 ?auto_533285 ) ) ( not ( = ?auto_533276 ?auto_533286 ) ) ( not ( = ?auto_533276 ?auto_533287 ) ) ( not ( = ?auto_533276 ?auto_533288 ) ) ( not ( = ?auto_533276 ?auto_533289 ) ) ( not ( = ?auto_533276 ?auto_533290 ) ) ( not ( = ?auto_533276 ?auto_533291 ) ) ( not ( = ?auto_533276 ?auto_533292 ) ) ( not ( = ?auto_533277 ?auto_533278 ) ) ( not ( = ?auto_533277 ?auto_533279 ) ) ( not ( = ?auto_533277 ?auto_533280 ) ) ( not ( = ?auto_533277 ?auto_533281 ) ) ( not ( = ?auto_533277 ?auto_533282 ) ) ( not ( = ?auto_533277 ?auto_533283 ) ) ( not ( = ?auto_533277 ?auto_533284 ) ) ( not ( = ?auto_533277 ?auto_533285 ) ) ( not ( = ?auto_533277 ?auto_533286 ) ) ( not ( = ?auto_533277 ?auto_533287 ) ) ( not ( = ?auto_533277 ?auto_533288 ) ) ( not ( = ?auto_533277 ?auto_533289 ) ) ( not ( = ?auto_533277 ?auto_533290 ) ) ( not ( = ?auto_533277 ?auto_533291 ) ) ( not ( = ?auto_533277 ?auto_533292 ) ) ( not ( = ?auto_533278 ?auto_533279 ) ) ( not ( = ?auto_533278 ?auto_533280 ) ) ( not ( = ?auto_533278 ?auto_533281 ) ) ( not ( = ?auto_533278 ?auto_533282 ) ) ( not ( = ?auto_533278 ?auto_533283 ) ) ( not ( = ?auto_533278 ?auto_533284 ) ) ( not ( = ?auto_533278 ?auto_533285 ) ) ( not ( = ?auto_533278 ?auto_533286 ) ) ( not ( = ?auto_533278 ?auto_533287 ) ) ( not ( = ?auto_533278 ?auto_533288 ) ) ( not ( = ?auto_533278 ?auto_533289 ) ) ( not ( = ?auto_533278 ?auto_533290 ) ) ( not ( = ?auto_533278 ?auto_533291 ) ) ( not ( = ?auto_533278 ?auto_533292 ) ) ( not ( = ?auto_533279 ?auto_533280 ) ) ( not ( = ?auto_533279 ?auto_533281 ) ) ( not ( = ?auto_533279 ?auto_533282 ) ) ( not ( = ?auto_533279 ?auto_533283 ) ) ( not ( = ?auto_533279 ?auto_533284 ) ) ( not ( = ?auto_533279 ?auto_533285 ) ) ( not ( = ?auto_533279 ?auto_533286 ) ) ( not ( = ?auto_533279 ?auto_533287 ) ) ( not ( = ?auto_533279 ?auto_533288 ) ) ( not ( = ?auto_533279 ?auto_533289 ) ) ( not ( = ?auto_533279 ?auto_533290 ) ) ( not ( = ?auto_533279 ?auto_533291 ) ) ( not ( = ?auto_533279 ?auto_533292 ) ) ( not ( = ?auto_533280 ?auto_533281 ) ) ( not ( = ?auto_533280 ?auto_533282 ) ) ( not ( = ?auto_533280 ?auto_533283 ) ) ( not ( = ?auto_533280 ?auto_533284 ) ) ( not ( = ?auto_533280 ?auto_533285 ) ) ( not ( = ?auto_533280 ?auto_533286 ) ) ( not ( = ?auto_533280 ?auto_533287 ) ) ( not ( = ?auto_533280 ?auto_533288 ) ) ( not ( = ?auto_533280 ?auto_533289 ) ) ( not ( = ?auto_533280 ?auto_533290 ) ) ( not ( = ?auto_533280 ?auto_533291 ) ) ( not ( = ?auto_533280 ?auto_533292 ) ) ( not ( = ?auto_533281 ?auto_533282 ) ) ( not ( = ?auto_533281 ?auto_533283 ) ) ( not ( = ?auto_533281 ?auto_533284 ) ) ( not ( = ?auto_533281 ?auto_533285 ) ) ( not ( = ?auto_533281 ?auto_533286 ) ) ( not ( = ?auto_533281 ?auto_533287 ) ) ( not ( = ?auto_533281 ?auto_533288 ) ) ( not ( = ?auto_533281 ?auto_533289 ) ) ( not ( = ?auto_533281 ?auto_533290 ) ) ( not ( = ?auto_533281 ?auto_533291 ) ) ( not ( = ?auto_533281 ?auto_533292 ) ) ( not ( = ?auto_533282 ?auto_533283 ) ) ( not ( = ?auto_533282 ?auto_533284 ) ) ( not ( = ?auto_533282 ?auto_533285 ) ) ( not ( = ?auto_533282 ?auto_533286 ) ) ( not ( = ?auto_533282 ?auto_533287 ) ) ( not ( = ?auto_533282 ?auto_533288 ) ) ( not ( = ?auto_533282 ?auto_533289 ) ) ( not ( = ?auto_533282 ?auto_533290 ) ) ( not ( = ?auto_533282 ?auto_533291 ) ) ( not ( = ?auto_533282 ?auto_533292 ) ) ( not ( = ?auto_533283 ?auto_533284 ) ) ( not ( = ?auto_533283 ?auto_533285 ) ) ( not ( = ?auto_533283 ?auto_533286 ) ) ( not ( = ?auto_533283 ?auto_533287 ) ) ( not ( = ?auto_533283 ?auto_533288 ) ) ( not ( = ?auto_533283 ?auto_533289 ) ) ( not ( = ?auto_533283 ?auto_533290 ) ) ( not ( = ?auto_533283 ?auto_533291 ) ) ( not ( = ?auto_533283 ?auto_533292 ) ) ( not ( = ?auto_533284 ?auto_533285 ) ) ( not ( = ?auto_533284 ?auto_533286 ) ) ( not ( = ?auto_533284 ?auto_533287 ) ) ( not ( = ?auto_533284 ?auto_533288 ) ) ( not ( = ?auto_533284 ?auto_533289 ) ) ( not ( = ?auto_533284 ?auto_533290 ) ) ( not ( = ?auto_533284 ?auto_533291 ) ) ( not ( = ?auto_533284 ?auto_533292 ) ) ( not ( = ?auto_533285 ?auto_533286 ) ) ( not ( = ?auto_533285 ?auto_533287 ) ) ( not ( = ?auto_533285 ?auto_533288 ) ) ( not ( = ?auto_533285 ?auto_533289 ) ) ( not ( = ?auto_533285 ?auto_533290 ) ) ( not ( = ?auto_533285 ?auto_533291 ) ) ( not ( = ?auto_533285 ?auto_533292 ) ) ( not ( = ?auto_533286 ?auto_533287 ) ) ( not ( = ?auto_533286 ?auto_533288 ) ) ( not ( = ?auto_533286 ?auto_533289 ) ) ( not ( = ?auto_533286 ?auto_533290 ) ) ( not ( = ?auto_533286 ?auto_533291 ) ) ( not ( = ?auto_533286 ?auto_533292 ) ) ( not ( = ?auto_533287 ?auto_533288 ) ) ( not ( = ?auto_533287 ?auto_533289 ) ) ( not ( = ?auto_533287 ?auto_533290 ) ) ( not ( = ?auto_533287 ?auto_533291 ) ) ( not ( = ?auto_533287 ?auto_533292 ) ) ( not ( = ?auto_533288 ?auto_533289 ) ) ( not ( = ?auto_533288 ?auto_533290 ) ) ( not ( = ?auto_533288 ?auto_533291 ) ) ( not ( = ?auto_533288 ?auto_533292 ) ) ( not ( = ?auto_533289 ?auto_533290 ) ) ( not ( = ?auto_533289 ?auto_533291 ) ) ( not ( = ?auto_533289 ?auto_533292 ) ) ( not ( = ?auto_533290 ?auto_533291 ) ) ( not ( = ?auto_533290 ?auto_533292 ) ) ( not ( = ?auto_533291 ?auto_533292 ) ) ( ON ?auto_533290 ?auto_533291 ) ( ON ?auto_533289 ?auto_533290 ) ( ON ?auto_533288 ?auto_533289 ) ( ON ?auto_533287 ?auto_533288 ) ( ON ?auto_533286 ?auto_533287 ) ( CLEAR ?auto_533284 ) ( ON ?auto_533285 ?auto_533286 ) ( CLEAR ?auto_533285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_533276 ?auto_533277 ?auto_533278 ?auto_533279 ?auto_533280 ?auto_533281 ?auto_533282 ?auto_533283 ?auto_533284 ?auto_533285 )
      ( MAKE-16PILE ?auto_533276 ?auto_533277 ?auto_533278 ?auto_533279 ?auto_533280 ?auto_533281 ?auto_533282 ?auto_533283 ?auto_533284 ?auto_533285 ?auto_533286 ?auto_533287 ?auto_533288 ?auto_533289 ?auto_533290 ?auto_533291 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533309 - BLOCK
      ?auto_533310 - BLOCK
      ?auto_533311 - BLOCK
      ?auto_533312 - BLOCK
      ?auto_533313 - BLOCK
      ?auto_533314 - BLOCK
      ?auto_533315 - BLOCK
      ?auto_533316 - BLOCK
      ?auto_533317 - BLOCK
      ?auto_533318 - BLOCK
      ?auto_533319 - BLOCK
      ?auto_533320 - BLOCK
      ?auto_533321 - BLOCK
      ?auto_533322 - BLOCK
      ?auto_533323 - BLOCK
      ?auto_533324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533324 ) ( ON-TABLE ?auto_533309 ) ( ON ?auto_533310 ?auto_533309 ) ( ON ?auto_533311 ?auto_533310 ) ( ON ?auto_533312 ?auto_533311 ) ( ON ?auto_533313 ?auto_533312 ) ( ON ?auto_533314 ?auto_533313 ) ( ON ?auto_533315 ?auto_533314 ) ( ON ?auto_533316 ?auto_533315 ) ( ON ?auto_533317 ?auto_533316 ) ( not ( = ?auto_533309 ?auto_533310 ) ) ( not ( = ?auto_533309 ?auto_533311 ) ) ( not ( = ?auto_533309 ?auto_533312 ) ) ( not ( = ?auto_533309 ?auto_533313 ) ) ( not ( = ?auto_533309 ?auto_533314 ) ) ( not ( = ?auto_533309 ?auto_533315 ) ) ( not ( = ?auto_533309 ?auto_533316 ) ) ( not ( = ?auto_533309 ?auto_533317 ) ) ( not ( = ?auto_533309 ?auto_533318 ) ) ( not ( = ?auto_533309 ?auto_533319 ) ) ( not ( = ?auto_533309 ?auto_533320 ) ) ( not ( = ?auto_533309 ?auto_533321 ) ) ( not ( = ?auto_533309 ?auto_533322 ) ) ( not ( = ?auto_533309 ?auto_533323 ) ) ( not ( = ?auto_533309 ?auto_533324 ) ) ( not ( = ?auto_533310 ?auto_533311 ) ) ( not ( = ?auto_533310 ?auto_533312 ) ) ( not ( = ?auto_533310 ?auto_533313 ) ) ( not ( = ?auto_533310 ?auto_533314 ) ) ( not ( = ?auto_533310 ?auto_533315 ) ) ( not ( = ?auto_533310 ?auto_533316 ) ) ( not ( = ?auto_533310 ?auto_533317 ) ) ( not ( = ?auto_533310 ?auto_533318 ) ) ( not ( = ?auto_533310 ?auto_533319 ) ) ( not ( = ?auto_533310 ?auto_533320 ) ) ( not ( = ?auto_533310 ?auto_533321 ) ) ( not ( = ?auto_533310 ?auto_533322 ) ) ( not ( = ?auto_533310 ?auto_533323 ) ) ( not ( = ?auto_533310 ?auto_533324 ) ) ( not ( = ?auto_533311 ?auto_533312 ) ) ( not ( = ?auto_533311 ?auto_533313 ) ) ( not ( = ?auto_533311 ?auto_533314 ) ) ( not ( = ?auto_533311 ?auto_533315 ) ) ( not ( = ?auto_533311 ?auto_533316 ) ) ( not ( = ?auto_533311 ?auto_533317 ) ) ( not ( = ?auto_533311 ?auto_533318 ) ) ( not ( = ?auto_533311 ?auto_533319 ) ) ( not ( = ?auto_533311 ?auto_533320 ) ) ( not ( = ?auto_533311 ?auto_533321 ) ) ( not ( = ?auto_533311 ?auto_533322 ) ) ( not ( = ?auto_533311 ?auto_533323 ) ) ( not ( = ?auto_533311 ?auto_533324 ) ) ( not ( = ?auto_533312 ?auto_533313 ) ) ( not ( = ?auto_533312 ?auto_533314 ) ) ( not ( = ?auto_533312 ?auto_533315 ) ) ( not ( = ?auto_533312 ?auto_533316 ) ) ( not ( = ?auto_533312 ?auto_533317 ) ) ( not ( = ?auto_533312 ?auto_533318 ) ) ( not ( = ?auto_533312 ?auto_533319 ) ) ( not ( = ?auto_533312 ?auto_533320 ) ) ( not ( = ?auto_533312 ?auto_533321 ) ) ( not ( = ?auto_533312 ?auto_533322 ) ) ( not ( = ?auto_533312 ?auto_533323 ) ) ( not ( = ?auto_533312 ?auto_533324 ) ) ( not ( = ?auto_533313 ?auto_533314 ) ) ( not ( = ?auto_533313 ?auto_533315 ) ) ( not ( = ?auto_533313 ?auto_533316 ) ) ( not ( = ?auto_533313 ?auto_533317 ) ) ( not ( = ?auto_533313 ?auto_533318 ) ) ( not ( = ?auto_533313 ?auto_533319 ) ) ( not ( = ?auto_533313 ?auto_533320 ) ) ( not ( = ?auto_533313 ?auto_533321 ) ) ( not ( = ?auto_533313 ?auto_533322 ) ) ( not ( = ?auto_533313 ?auto_533323 ) ) ( not ( = ?auto_533313 ?auto_533324 ) ) ( not ( = ?auto_533314 ?auto_533315 ) ) ( not ( = ?auto_533314 ?auto_533316 ) ) ( not ( = ?auto_533314 ?auto_533317 ) ) ( not ( = ?auto_533314 ?auto_533318 ) ) ( not ( = ?auto_533314 ?auto_533319 ) ) ( not ( = ?auto_533314 ?auto_533320 ) ) ( not ( = ?auto_533314 ?auto_533321 ) ) ( not ( = ?auto_533314 ?auto_533322 ) ) ( not ( = ?auto_533314 ?auto_533323 ) ) ( not ( = ?auto_533314 ?auto_533324 ) ) ( not ( = ?auto_533315 ?auto_533316 ) ) ( not ( = ?auto_533315 ?auto_533317 ) ) ( not ( = ?auto_533315 ?auto_533318 ) ) ( not ( = ?auto_533315 ?auto_533319 ) ) ( not ( = ?auto_533315 ?auto_533320 ) ) ( not ( = ?auto_533315 ?auto_533321 ) ) ( not ( = ?auto_533315 ?auto_533322 ) ) ( not ( = ?auto_533315 ?auto_533323 ) ) ( not ( = ?auto_533315 ?auto_533324 ) ) ( not ( = ?auto_533316 ?auto_533317 ) ) ( not ( = ?auto_533316 ?auto_533318 ) ) ( not ( = ?auto_533316 ?auto_533319 ) ) ( not ( = ?auto_533316 ?auto_533320 ) ) ( not ( = ?auto_533316 ?auto_533321 ) ) ( not ( = ?auto_533316 ?auto_533322 ) ) ( not ( = ?auto_533316 ?auto_533323 ) ) ( not ( = ?auto_533316 ?auto_533324 ) ) ( not ( = ?auto_533317 ?auto_533318 ) ) ( not ( = ?auto_533317 ?auto_533319 ) ) ( not ( = ?auto_533317 ?auto_533320 ) ) ( not ( = ?auto_533317 ?auto_533321 ) ) ( not ( = ?auto_533317 ?auto_533322 ) ) ( not ( = ?auto_533317 ?auto_533323 ) ) ( not ( = ?auto_533317 ?auto_533324 ) ) ( not ( = ?auto_533318 ?auto_533319 ) ) ( not ( = ?auto_533318 ?auto_533320 ) ) ( not ( = ?auto_533318 ?auto_533321 ) ) ( not ( = ?auto_533318 ?auto_533322 ) ) ( not ( = ?auto_533318 ?auto_533323 ) ) ( not ( = ?auto_533318 ?auto_533324 ) ) ( not ( = ?auto_533319 ?auto_533320 ) ) ( not ( = ?auto_533319 ?auto_533321 ) ) ( not ( = ?auto_533319 ?auto_533322 ) ) ( not ( = ?auto_533319 ?auto_533323 ) ) ( not ( = ?auto_533319 ?auto_533324 ) ) ( not ( = ?auto_533320 ?auto_533321 ) ) ( not ( = ?auto_533320 ?auto_533322 ) ) ( not ( = ?auto_533320 ?auto_533323 ) ) ( not ( = ?auto_533320 ?auto_533324 ) ) ( not ( = ?auto_533321 ?auto_533322 ) ) ( not ( = ?auto_533321 ?auto_533323 ) ) ( not ( = ?auto_533321 ?auto_533324 ) ) ( not ( = ?auto_533322 ?auto_533323 ) ) ( not ( = ?auto_533322 ?auto_533324 ) ) ( not ( = ?auto_533323 ?auto_533324 ) ) ( ON ?auto_533323 ?auto_533324 ) ( ON ?auto_533322 ?auto_533323 ) ( ON ?auto_533321 ?auto_533322 ) ( ON ?auto_533320 ?auto_533321 ) ( ON ?auto_533319 ?auto_533320 ) ( CLEAR ?auto_533317 ) ( ON ?auto_533318 ?auto_533319 ) ( CLEAR ?auto_533318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_533309 ?auto_533310 ?auto_533311 ?auto_533312 ?auto_533313 ?auto_533314 ?auto_533315 ?auto_533316 ?auto_533317 ?auto_533318 )
      ( MAKE-16PILE ?auto_533309 ?auto_533310 ?auto_533311 ?auto_533312 ?auto_533313 ?auto_533314 ?auto_533315 ?auto_533316 ?auto_533317 ?auto_533318 ?auto_533319 ?auto_533320 ?auto_533321 ?auto_533322 ?auto_533323 ?auto_533324 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533341 - BLOCK
      ?auto_533342 - BLOCK
      ?auto_533343 - BLOCK
      ?auto_533344 - BLOCK
      ?auto_533345 - BLOCK
      ?auto_533346 - BLOCK
      ?auto_533347 - BLOCK
      ?auto_533348 - BLOCK
      ?auto_533349 - BLOCK
      ?auto_533350 - BLOCK
      ?auto_533351 - BLOCK
      ?auto_533352 - BLOCK
      ?auto_533353 - BLOCK
      ?auto_533354 - BLOCK
      ?auto_533355 - BLOCK
      ?auto_533356 - BLOCK
    )
    :vars
    (
      ?auto_533357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533356 ?auto_533357 ) ( ON-TABLE ?auto_533341 ) ( ON ?auto_533342 ?auto_533341 ) ( ON ?auto_533343 ?auto_533342 ) ( ON ?auto_533344 ?auto_533343 ) ( ON ?auto_533345 ?auto_533344 ) ( ON ?auto_533346 ?auto_533345 ) ( ON ?auto_533347 ?auto_533346 ) ( ON ?auto_533348 ?auto_533347 ) ( not ( = ?auto_533341 ?auto_533342 ) ) ( not ( = ?auto_533341 ?auto_533343 ) ) ( not ( = ?auto_533341 ?auto_533344 ) ) ( not ( = ?auto_533341 ?auto_533345 ) ) ( not ( = ?auto_533341 ?auto_533346 ) ) ( not ( = ?auto_533341 ?auto_533347 ) ) ( not ( = ?auto_533341 ?auto_533348 ) ) ( not ( = ?auto_533341 ?auto_533349 ) ) ( not ( = ?auto_533341 ?auto_533350 ) ) ( not ( = ?auto_533341 ?auto_533351 ) ) ( not ( = ?auto_533341 ?auto_533352 ) ) ( not ( = ?auto_533341 ?auto_533353 ) ) ( not ( = ?auto_533341 ?auto_533354 ) ) ( not ( = ?auto_533341 ?auto_533355 ) ) ( not ( = ?auto_533341 ?auto_533356 ) ) ( not ( = ?auto_533341 ?auto_533357 ) ) ( not ( = ?auto_533342 ?auto_533343 ) ) ( not ( = ?auto_533342 ?auto_533344 ) ) ( not ( = ?auto_533342 ?auto_533345 ) ) ( not ( = ?auto_533342 ?auto_533346 ) ) ( not ( = ?auto_533342 ?auto_533347 ) ) ( not ( = ?auto_533342 ?auto_533348 ) ) ( not ( = ?auto_533342 ?auto_533349 ) ) ( not ( = ?auto_533342 ?auto_533350 ) ) ( not ( = ?auto_533342 ?auto_533351 ) ) ( not ( = ?auto_533342 ?auto_533352 ) ) ( not ( = ?auto_533342 ?auto_533353 ) ) ( not ( = ?auto_533342 ?auto_533354 ) ) ( not ( = ?auto_533342 ?auto_533355 ) ) ( not ( = ?auto_533342 ?auto_533356 ) ) ( not ( = ?auto_533342 ?auto_533357 ) ) ( not ( = ?auto_533343 ?auto_533344 ) ) ( not ( = ?auto_533343 ?auto_533345 ) ) ( not ( = ?auto_533343 ?auto_533346 ) ) ( not ( = ?auto_533343 ?auto_533347 ) ) ( not ( = ?auto_533343 ?auto_533348 ) ) ( not ( = ?auto_533343 ?auto_533349 ) ) ( not ( = ?auto_533343 ?auto_533350 ) ) ( not ( = ?auto_533343 ?auto_533351 ) ) ( not ( = ?auto_533343 ?auto_533352 ) ) ( not ( = ?auto_533343 ?auto_533353 ) ) ( not ( = ?auto_533343 ?auto_533354 ) ) ( not ( = ?auto_533343 ?auto_533355 ) ) ( not ( = ?auto_533343 ?auto_533356 ) ) ( not ( = ?auto_533343 ?auto_533357 ) ) ( not ( = ?auto_533344 ?auto_533345 ) ) ( not ( = ?auto_533344 ?auto_533346 ) ) ( not ( = ?auto_533344 ?auto_533347 ) ) ( not ( = ?auto_533344 ?auto_533348 ) ) ( not ( = ?auto_533344 ?auto_533349 ) ) ( not ( = ?auto_533344 ?auto_533350 ) ) ( not ( = ?auto_533344 ?auto_533351 ) ) ( not ( = ?auto_533344 ?auto_533352 ) ) ( not ( = ?auto_533344 ?auto_533353 ) ) ( not ( = ?auto_533344 ?auto_533354 ) ) ( not ( = ?auto_533344 ?auto_533355 ) ) ( not ( = ?auto_533344 ?auto_533356 ) ) ( not ( = ?auto_533344 ?auto_533357 ) ) ( not ( = ?auto_533345 ?auto_533346 ) ) ( not ( = ?auto_533345 ?auto_533347 ) ) ( not ( = ?auto_533345 ?auto_533348 ) ) ( not ( = ?auto_533345 ?auto_533349 ) ) ( not ( = ?auto_533345 ?auto_533350 ) ) ( not ( = ?auto_533345 ?auto_533351 ) ) ( not ( = ?auto_533345 ?auto_533352 ) ) ( not ( = ?auto_533345 ?auto_533353 ) ) ( not ( = ?auto_533345 ?auto_533354 ) ) ( not ( = ?auto_533345 ?auto_533355 ) ) ( not ( = ?auto_533345 ?auto_533356 ) ) ( not ( = ?auto_533345 ?auto_533357 ) ) ( not ( = ?auto_533346 ?auto_533347 ) ) ( not ( = ?auto_533346 ?auto_533348 ) ) ( not ( = ?auto_533346 ?auto_533349 ) ) ( not ( = ?auto_533346 ?auto_533350 ) ) ( not ( = ?auto_533346 ?auto_533351 ) ) ( not ( = ?auto_533346 ?auto_533352 ) ) ( not ( = ?auto_533346 ?auto_533353 ) ) ( not ( = ?auto_533346 ?auto_533354 ) ) ( not ( = ?auto_533346 ?auto_533355 ) ) ( not ( = ?auto_533346 ?auto_533356 ) ) ( not ( = ?auto_533346 ?auto_533357 ) ) ( not ( = ?auto_533347 ?auto_533348 ) ) ( not ( = ?auto_533347 ?auto_533349 ) ) ( not ( = ?auto_533347 ?auto_533350 ) ) ( not ( = ?auto_533347 ?auto_533351 ) ) ( not ( = ?auto_533347 ?auto_533352 ) ) ( not ( = ?auto_533347 ?auto_533353 ) ) ( not ( = ?auto_533347 ?auto_533354 ) ) ( not ( = ?auto_533347 ?auto_533355 ) ) ( not ( = ?auto_533347 ?auto_533356 ) ) ( not ( = ?auto_533347 ?auto_533357 ) ) ( not ( = ?auto_533348 ?auto_533349 ) ) ( not ( = ?auto_533348 ?auto_533350 ) ) ( not ( = ?auto_533348 ?auto_533351 ) ) ( not ( = ?auto_533348 ?auto_533352 ) ) ( not ( = ?auto_533348 ?auto_533353 ) ) ( not ( = ?auto_533348 ?auto_533354 ) ) ( not ( = ?auto_533348 ?auto_533355 ) ) ( not ( = ?auto_533348 ?auto_533356 ) ) ( not ( = ?auto_533348 ?auto_533357 ) ) ( not ( = ?auto_533349 ?auto_533350 ) ) ( not ( = ?auto_533349 ?auto_533351 ) ) ( not ( = ?auto_533349 ?auto_533352 ) ) ( not ( = ?auto_533349 ?auto_533353 ) ) ( not ( = ?auto_533349 ?auto_533354 ) ) ( not ( = ?auto_533349 ?auto_533355 ) ) ( not ( = ?auto_533349 ?auto_533356 ) ) ( not ( = ?auto_533349 ?auto_533357 ) ) ( not ( = ?auto_533350 ?auto_533351 ) ) ( not ( = ?auto_533350 ?auto_533352 ) ) ( not ( = ?auto_533350 ?auto_533353 ) ) ( not ( = ?auto_533350 ?auto_533354 ) ) ( not ( = ?auto_533350 ?auto_533355 ) ) ( not ( = ?auto_533350 ?auto_533356 ) ) ( not ( = ?auto_533350 ?auto_533357 ) ) ( not ( = ?auto_533351 ?auto_533352 ) ) ( not ( = ?auto_533351 ?auto_533353 ) ) ( not ( = ?auto_533351 ?auto_533354 ) ) ( not ( = ?auto_533351 ?auto_533355 ) ) ( not ( = ?auto_533351 ?auto_533356 ) ) ( not ( = ?auto_533351 ?auto_533357 ) ) ( not ( = ?auto_533352 ?auto_533353 ) ) ( not ( = ?auto_533352 ?auto_533354 ) ) ( not ( = ?auto_533352 ?auto_533355 ) ) ( not ( = ?auto_533352 ?auto_533356 ) ) ( not ( = ?auto_533352 ?auto_533357 ) ) ( not ( = ?auto_533353 ?auto_533354 ) ) ( not ( = ?auto_533353 ?auto_533355 ) ) ( not ( = ?auto_533353 ?auto_533356 ) ) ( not ( = ?auto_533353 ?auto_533357 ) ) ( not ( = ?auto_533354 ?auto_533355 ) ) ( not ( = ?auto_533354 ?auto_533356 ) ) ( not ( = ?auto_533354 ?auto_533357 ) ) ( not ( = ?auto_533355 ?auto_533356 ) ) ( not ( = ?auto_533355 ?auto_533357 ) ) ( not ( = ?auto_533356 ?auto_533357 ) ) ( ON ?auto_533355 ?auto_533356 ) ( ON ?auto_533354 ?auto_533355 ) ( ON ?auto_533353 ?auto_533354 ) ( ON ?auto_533352 ?auto_533353 ) ( ON ?auto_533351 ?auto_533352 ) ( ON ?auto_533350 ?auto_533351 ) ( CLEAR ?auto_533348 ) ( ON ?auto_533349 ?auto_533350 ) ( CLEAR ?auto_533349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_533341 ?auto_533342 ?auto_533343 ?auto_533344 ?auto_533345 ?auto_533346 ?auto_533347 ?auto_533348 ?auto_533349 )
      ( MAKE-16PILE ?auto_533341 ?auto_533342 ?auto_533343 ?auto_533344 ?auto_533345 ?auto_533346 ?auto_533347 ?auto_533348 ?auto_533349 ?auto_533350 ?auto_533351 ?auto_533352 ?auto_533353 ?auto_533354 ?auto_533355 ?auto_533356 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533374 - BLOCK
      ?auto_533375 - BLOCK
      ?auto_533376 - BLOCK
      ?auto_533377 - BLOCK
      ?auto_533378 - BLOCK
      ?auto_533379 - BLOCK
      ?auto_533380 - BLOCK
      ?auto_533381 - BLOCK
      ?auto_533382 - BLOCK
      ?auto_533383 - BLOCK
      ?auto_533384 - BLOCK
      ?auto_533385 - BLOCK
      ?auto_533386 - BLOCK
      ?auto_533387 - BLOCK
      ?auto_533388 - BLOCK
      ?auto_533389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533389 ) ( ON-TABLE ?auto_533374 ) ( ON ?auto_533375 ?auto_533374 ) ( ON ?auto_533376 ?auto_533375 ) ( ON ?auto_533377 ?auto_533376 ) ( ON ?auto_533378 ?auto_533377 ) ( ON ?auto_533379 ?auto_533378 ) ( ON ?auto_533380 ?auto_533379 ) ( ON ?auto_533381 ?auto_533380 ) ( not ( = ?auto_533374 ?auto_533375 ) ) ( not ( = ?auto_533374 ?auto_533376 ) ) ( not ( = ?auto_533374 ?auto_533377 ) ) ( not ( = ?auto_533374 ?auto_533378 ) ) ( not ( = ?auto_533374 ?auto_533379 ) ) ( not ( = ?auto_533374 ?auto_533380 ) ) ( not ( = ?auto_533374 ?auto_533381 ) ) ( not ( = ?auto_533374 ?auto_533382 ) ) ( not ( = ?auto_533374 ?auto_533383 ) ) ( not ( = ?auto_533374 ?auto_533384 ) ) ( not ( = ?auto_533374 ?auto_533385 ) ) ( not ( = ?auto_533374 ?auto_533386 ) ) ( not ( = ?auto_533374 ?auto_533387 ) ) ( not ( = ?auto_533374 ?auto_533388 ) ) ( not ( = ?auto_533374 ?auto_533389 ) ) ( not ( = ?auto_533375 ?auto_533376 ) ) ( not ( = ?auto_533375 ?auto_533377 ) ) ( not ( = ?auto_533375 ?auto_533378 ) ) ( not ( = ?auto_533375 ?auto_533379 ) ) ( not ( = ?auto_533375 ?auto_533380 ) ) ( not ( = ?auto_533375 ?auto_533381 ) ) ( not ( = ?auto_533375 ?auto_533382 ) ) ( not ( = ?auto_533375 ?auto_533383 ) ) ( not ( = ?auto_533375 ?auto_533384 ) ) ( not ( = ?auto_533375 ?auto_533385 ) ) ( not ( = ?auto_533375 ?auto_533386 ) ) ( not ( = ?auto_533375 ?auto_533387 ) ) ( not ( = ?auto_533375 ?auto_533388 ) ) ( not ( = ?auto_533375 ?auto_533389 ) ) ( not ( = ?auto_533376 ?auto_533377 ) ) ( not ( = ?auto_533376 ?auto_533378 ) ) ( not ( = ?auto_533376 ?auto_533379 ) ) ( not ( = ?auto_533376 ?auto_533380 ) ) ( not ( = ?auto_533376 ?auto_533381 ) ) ( not ( = ?auto_533376 ?auto_533382 ) ) ( not ( = ?auto_533376 ?auto_533383 ) ) ( not ( = ?auto_533376 ?auto_533384 ) ) ( not ( = ?auto_533376 ?auto_533385 ) ) ( not ( = ?auto_533376 ?auto_533386 ) ) ( not ( = ?auto_533376 ?auto_533387 ) ) ( not ( = ?auto_533376 ?auto_533388 ) ) ( not ( = ?auto_533376 ?auto_533389 ) ) ( not ( = ?auto_533377 ?auto_533378 ) ) ( not ( = ?auto_533377 ?auto_533379 ) ) ( not ( = ?auto_533377 ?auto_533380 ) ) ( not ( = ?auto_533377 ?auto_533381 ) ) ( not ( = ?auto_533377 ?auto_533382 ) ) ( not ( = ?auto_533377 ?auto_533383 ) ) ( not ( = ?auto_533377 ?auto_533384 ) ) ( not ( = ?auto_533377 ?auto_533385 ) ) ( not ( = ?auto_533377 ?auto_533386 ) ) ( not ( = ?auto_533377 ?auto_533387 ) ) ( not ( = ?auto_533377 ?auto_533388 ) ) ( not ( = ?auto_533377 ?auto_533389 ) ) ( not ( = ?auto_533378 ?auto_533379 ) ) ( not ( = ?auto_533378 ?auto_533380 ) ) ( not ( = ?auto_533378 ?auto_533381 ) ) ( not ( = ?auto_533378 ?auto_533382 ) ) ( not ( = ?auto_533378 ?auto_533383 ) ) ( not ( = ?auto_533378 ?auto_533384 ) ) ( not ( = ?auto_533378 ?auto_533385 ) ) ( not ( = ?auto_533378 ?auto_533386 ) ) ( not ( = ?auto_533378 ?auto_533387 ) ) ( not ( = ?auto_533378 ?auto_533388 ) ) ( not ( = ?auto_533378 ?auto_533389 ) ) ( not ( = ?auto_533379 ?auto_533380 ) ) ( not ( = ?auto_533379 ?auto_533381 ) ) ( not ( = ?auto_533379 ?auto_533382 ) ) ( not ( = ?auto_533379 ?auto_533383 ) ) ( not ( = ?auto_533379 ?auto_533384 ) ) ( not ( = ?auto_533379 ?auto_533385 ) ) ( not ( = ?auto_533379 ?auto_533386 ) ) ( not ( = ?auto_533379 ?auto_533387 ) ) ( not ( = ?auto_533379 ?auto_533388 ) ) ( not ( = ?auto_533379 ?auto_533389 ) ) ( not ( = ?auto_533380 ?auto_533381 ) ) ( not ( = ?auto_533380 ?auto_533382 ) ) ( not ( = ?auto_533380 ?auto_533383 ) ) ( not ( = ?auto_533380 ?auto_533384 ) ) ( not ( = ?auto_533380 ?auto_533385 ) ) ( not ( = ?auto_533380 ?auto_533386 ) ) ( not ( = ?auto_533380 ?auto_533387 ) ) ( not ( = ?auto_533380 ?auto_533388 ) ) ( not ( = ?auto_533380 ?auto_533389 ) ) ( not ( = ?auto_533381 ?auto_533382 ) ) ( not ( = ?auto_533381 ?auto_533383 ) ) ( not ( = ?auto_533381 ?auto_533384 ) ) ( not ( = ?auto_533381 ?auto_533385 ) ) ( not ( = ?auto_533381 ?auto_533386 ) ) ( not ( = ?auto_533381 ?auto_533387 ) ) ( not ( = ?auto_533381 ?auto_533388 ) ) ( not ( = ?auto_533381 ?auto_533389 ) ) ( not ( = ?auto_533382 ?auto_533383 ) ) ( not ( = ?auto_533382 ?auto_533384 ) ) ( not ( = ?auto_533382 ?auto_533385 ) ) ( not ( = ?auto_533382 ?auto_533386 ) ) ( not ( = ?auto_533382 ?auto_533387 ) ) ( not ( = ?auto_533382 ?auto_533388 ) ) ( not ( = ?auto_533382 ?auto_533389 ) ) ( not ( = ?auto_533383 ?auto_533384 ) ) ( not ( = ?auto_533383 ?auto_533385 ) ) ( not ( = ?auto_533383 ?auto_533386 ) ) ( not ( = ?auto_533383 ?auto_533387 ) ) ( not ( = ?auto_533383 ?auto_533388 ) ) ( not ( = ?auto_533383 ?auto_533389 ) ) ( not ( = ?auto_533384 ?auto_533385 ) ) ( not ( = ?auto_533384 ?auto_533386 ) ) ( not ( = ?auto_533384 ?auto_533387 ) ) ( not ( = ?auto_533384 ?auto_533388 ) ) ( not ( = ?auto_533384 ?auto_533389 ) ) ( not ( = ?auto_533385 ?auto_533386 ) ) ( not ( = ?auto_533385 ?auto_533387 ) ) ( not ( = ?auto_533385 ?auto_533388 ) ) ( not ( = ?auto_533385 ?auto_533389 ) ) ( not ( = ?auto_533386 ?auto_533387 ) ) ( not ( = ?auto_533386 ?auto_533388 ) ) ( not ( = ?auto_533386 ?auto_533389 ) ) ( not ( = ?auto_533387 ?auto_533388 ) ) ( not ( = ?auto_533387 ?auto_533389 ) ) ( not ( = ?auto_533388 ?auto_533389 ) ) ( ON ?auto_533388 ?auto_533389 ) ( ON ?auto_533387 ?auto_533388 ) ( ON ?auto_533386 ?auto_533387 ) ( ON ?auto_533385 ?auto_533386 ) ( ON ?auto_533384 ?auto_533385 ) ( ON ?auto_533383 ?auto_533384 ) ( CLEAR ?auto_533381 ) ( ON ?auto_533382 ?auto_533383 ) ( CLEAR ?auto_533382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_533374 ?auto_533375 ?auto_533376 ?auto_533377 ?auto_533378 ?auto_533379 ?auto_533380 ?auto_533381 ?auto_533382 )
      ( MAKE-16PILE ?auto_533374 ?auto_533375 ?auto_533376 ?auto_533377 ?auto_533378 ?auto_533379 ?auto_533380 ?auto_533381 ?auto_533382 ?auto_533383 ?auto_533384 ?auto_533385 ?auto_533386 ?auto_533387 ?auto_533388 ?auto_533389 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533406 - BLOCK
      ?auto_533407 - BLOCK
      ?auto_533408 - BLOCK
      ?auto_533409 - BLOCK
      ?auto_533410 - BLOCK
      ?auto_533411 - BLOCK
      ?auto_533412 - BLOCK
      ?auto_533413 - BLOCK
      ?auto_533414 - BLOCK
      ?auto_533415 - BLOCK
      ?auto_533416 - BLOCK
      ?auto_533417 - BLOCK
      ?auto_533418 - BLOCK
      ?auto_533419 - BLOCK
      ?auto_533420 - BLOCK
      ?auto_533421 - BLOCK
    )
    :vars
    (
      ?auto_533422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533421 ?auto_533422 ) ( ON-TABLE ?auto_533406 ) ( ON ?auto_533407 ?auto_533406 ) ( ON ?auto_533408 ?auto_533407 ) ( ON ?auto_533409 ?auto_533408 ) ( ON ?auto_533410 ?auto_533409 ) ( ON ?auto_533411 ?auto_533410 ) ( ON ?auto_533412 ?auto_533411 ) ( not ( = ?auto_533406 ?auto_533407 ) ) ( not ( = ?auto_533406 ?auto_533408 ) ) ( not ( = ?auto_533406 ?auto_533409 ) ) ( not ( = ?auto_533406 ?auto_533410 ) ) ( not ( = ?auto_533406 ?auto_533411 ) ) ( not ( = ?auto_533406 ?auto_533412 ) ) ( not ( = ?auto_533406 ?auto_533413 ) ) ( not ( = ?auto_533406 ?auto_533414 ) ) ( not ( = ?auto_533406 ?auto_533415 ) ) ( not ( = ?auto_533406 ?auto_533416 ) ) ( not ( = ?auto_533406 ?auto_533417 ) ) ( not ( = ?auto_533406 ?auto_533418 ) ) ( not ( = ?auto_533406 ?auto_533419 ) ) ( not ( = ?auto_533406 ?auto_533420 ) ) ( not ( = ?auto_533406 ?auto_533421 ) ) ( not ( = ?auto_533406 ?auto_533422 ) ) ( not ( = ?auto_533407 ?auto_533408 ) ) ( not ( = ?auto_533407 ?auto_533409 ) ) ( not ( = ?auto_533407 ?auto_533410 ) ) ( not ( = ?auto_533407 ?auto_533411 ) ) ( not ( = ?auto_533407 ?auto_533412 ) ) ( not ( = ?auto_533407 ?auto_533413 ) ) ( not ( = ?auto_533407 ?auto_533414 ) ) ( not ( = ?auto_533407 ?auto_533415 ) ) ( not ( = ?auto_533407 ?auto_533416 ) ) ( not ( = ?auto_533407 ?auto_533417 ) ) ( not ( = ?auto_533407 ?auto_533418 ) ) ( not ( = ?auto_533407 ?auto_533419 ) ) ( not ( = ?auto_533407 ?auto_533420 ) ) ( not ( = ?auto_533407 ?auto_533421 ) ) ( not ( = ?auto_533407 ?auto_533422 ) ) ( not ( = ?auto_533408 ?auto_533409 ) ) ( not ( = ?auto_533408 ?auto_533410 ) ) ( not ( = ?auto_533408 ?auto_533411 ) ) ( not ( = ?auto_533408 ?auto_533412 ) ) ( not ( = ?auto_533408 ?auto_533413 ) ) ( not ( = ?auto_533408 ?auto_533414 ) ) ( not ( = ?auto_533408 ?auto_533415 ) ) ( not ( = ?auto_533408 ?auto_533416 ) ) ( not ( = ?auto_533408 ?auto_533417 ) ) ( not ( = ?auto_533408 ?auto_533418 ) ) ( not ( = ?auto_533408 ?auto_533419 ) ) ( not ( = ?auto_533408 ?auto_533420 ) ) ( not ( = ?auto_533408 ?auto_533421 ) ) ( not ( = ?auto_533408 ?auto_533422 ) ) ( not ( = ?auto_533409 ?auto_533410 ) ) ( not ( = ?auto_533409 ?auto_533411 ) ) ( not ( = ?auto_533409 ?auto_533412 ) ) ( not ( = ?auto_533409 ?auto_533413 ) ) ( not ( = ?auto_533409 ?auto_533414 ) ) ( not ( = ?auto_533409 ?auto_533415 ) ) ( not ( = ?auto_533409 ?auto_533416 ) ) ( not ( = ?auto_533409 ?auto_533417 ) ) ( not ( = ?auto_533409 ?auto_533418 ) ) ( not ( = ?auto_533409 ?auto_533419 ) ) ( not ( = ?auto_533409 ?auto_533420 ) ) ( not ( = ?auto_533409 ?auto_533421 ) ) ( not ( = ?auto_533409 ?auto_533422 ) ) ( not ( = ?auto_533410 ?auto_533411 ) ) ( not ( = ?auto_533410 ?auto_533412 ) ) ( not ( = ?auto_533410 ?auto_533413 ) ) ( not ( = ?auto_533410 ?auto_533414 ) ) ( not ( = ?auto_533410 ?auto_533415 ) ) ( not ( = ?auto_533410 ?auto_533416 ) ) ( not ( = ?auto_533410 ?auto_533417 ) ) ( not ( = ?auto_533410 ?auto_533418 ) ) ( not ( = ?auto_533410 ?auto_533419 ) ) ( not ( = ?auto_533410 ?auto_533420 ) ) ( not ( = ?auto_533410 ?auto_533421 ) ) ( not ( = ?auto_533410 ?auto_533422 ) ) ( not ( = ?auto_533411 ?auto_533412 ) ) ( not ( = ?auto_533411 ?auto_533413 ) ) ( not ( = ?auto_533411 ?auto_533414 ) ) ( not ( = ?auto_533411 ?auto_533415 ) ) ( not ( = ?auto_533411 ?auto_533416 ) ) ( not ( = ?auto_533411 ?auto_533417 ) ) ( not ( = ?auto_533411 ?auto_533418 ) ) ( not ( = ?auto_533411 ?auto_533419 ) ) ( not ( = ?auto_533411 ?auto_533420 ) ) ( not ( = ?auto_533411 ?auto_533421 ) ) ( not ( = ?auto_533411 ?auto_533422 ) ) ( not ( = ?auto_533412 ?auto_533413 ) ) ( not ( = ?auto_533412 ?auto_533414 ) ) ( not ( = ?auto_533412 ?auto_533415 ) ) ( not ( = ?auto_533412 ?auto_533416 ) ) ( not ( = ?auto_533412 ?auto_533417 ) ) ( not ( = ?auto_533412 ?auto_533418 ) ) ( not ( = ?auto_533412 ?auto_533419 ) ) ( not ( = ?auto_533412 ?auto_533420 ) ) ( not ( = ?auto_533412 ?auto_533421 ) ) ( not ( = ?auto_533412 ?auto_533422 ) ) ( not ( = ?auto_533413 ?auto_533414 ) ) ( not ( = ?auto_533413 ?auto_533415 ) ) ( not ( = ?auto_533413 ?auto_533416 ) ) ( not ( = ?auto_533413 ?auto_533417 ) ) ( not ( = ?auto_533413 ?auto_533418 ) ) ( not ( = ?auto_533413 ?auto_533419 ) ) ( not ( = ?auto_533413 ?auto_533420 ) ) ( not ( = ?auto_533413 ?auto_533421 ) ) ( not ( = ?auto_533413 ?auto_533422 ) ) ( not ( = ?auto_533414 ?auto_533415 ) ) ( not ( = ?auto_533414 ?auto_533416 ) ) ( not ( = ?auto_533414 ?auto_533417 ) ) ( not ( = ?auto_533414 ?auto_533418 ) ) ( not ( = ?auto_533414 ?auto_533419 ) ) ( not ( = ?auto_533414 ?auto_533420 ) ) ( not ( = ?auto_533414 ?auto_533421 ) ) ( not ( = ?auto_533414 ?auto_533422 ) ) ( not ( = ?auto_533415 ?auto_533416 ) ) ( not ( = ?auto_533415 ?auto_533417 ) ) ( not ( = ?auto_533415 ?auto_533418 ) ) ( not ( = ?auto_533415 ?auto_533419 ) ) ( not ( = ?auto_533415 ?auto_533420 ) ) ( not ( = ?auto_533415 ?auto_533421 ) ) ( not ( = ?auto_533415 ?auto_533422 ) ) ( not ( = ?auto_533416 ?auto_533417 ) ) ( not ( = ?auto_533416 ?auto_533418 ) ) ( not ( = ?auto_533416 ?auto_533419 ) ) ( not ( = ?auto_533416 ?auto_533420 ) ) ( not ( = ?auto_533416 ?auto_533421 ) ) ( not ( = ?auto_533416 ?auto_533422 ) ) ( not ( = ?auto_533417 ?auto_533418 ) ) ( not ( = ?auto_533417 ?auto_533419 ) ) ( not ( = ?auto_533417 ?auto_533420 ) ) ( not ( = ?auto_533417 ?auto_533421 ) ) ( not ( = ?auto_533417 ?auto_533422 ) ) ( not ( = ?auto_533418 ?auto_533419 ) ) ( not ( = ?auto_533418 ?auto_533420 ) ) ( not ( = ?auto_533418 ?auto_533421 ) ) ( not ( = ?auto_533418 ?auto_533422 ) ) ( not ( = ?auto_533419 ?auto_533420 ) ) ( not ( = ?auto_533419 ?auto_533421 ) ) ( not ( = ?auto_533419 ?auto_533422 ) ) ( not ( = ?auto_533420 ?auto_533421 ) ) ( not ( = ?auto_533420 ?auto_533422 ) ) ( not ( = ?auto_533421 ?auto_533422 ) ) ( ON ?auto_533420 ?auto_533421 ) ( ON ?auto_533419 ?auto_533420 ) ( ON ?auto_533418 ?auto_533419 ) ( ON ?auto_533417 ?auto_533418 ) ( ON ?auto_533416 ?auto_533417 ) ( ON ?auto_533415 ?auto_533416 ) ( ON ?auto_533414 ?auto_533415 ) ( CLEAR ?auto_533412 ) ( ON ?auto_533413 ?auto_533414 ) ( CLEAR ?auto_533413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_533406 ?auto_533407 ?auto_533408 ?auto_533409 ?auto_533410 ?auto_533411 ?auto_533412 ?auto_533413 )
      ( MAKE-16PILE ?auto_533406 ?auto_533407 ?auto_533408 ?auto_533409 ?auto_533410 ?auto_533411 ?auto_533412 ?auto_533413 ?auto_533414 ?auto_533415 ?auto_533416 ?auto_533417 ?auto_533418 ?auto_533419 ?auto_533420 ?auto_533421 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533439 - BLOCK
      ?auto_533440 - BLOCK
      ?auto_533441 - BLOCK
      ?auto_533442 - BLOCK
      ?auto_533443 - BLOCK
      ?auto_533444 - BLOCK
      ?auto_533445 - BLOCK
      ?auto_533446 - BLOCK
      ?auto_533447 - BLOCK
      ?auto_533448 - BLOCK
      ?auto_533449 - BLOCK
      ?auto_533450 - BLOCK
      ?auto_533451 - BLOCK
      ?auto_533452 - BLOCK
      ?auto_533453 - BLOCK
      ?auto_533454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533454 ) ( ON-TABLE ?auto_533439 ) ( ON ?auto_533440 ?auto_533439 ) ( ON ?auto_533441 ?auto_533440 ) ( ON ?auto_533442 ?auto_533441 ) ( ON ?auto_533443 ?auto_533442 ) ( ON ?auto_533444 ?auto_533443 ) ( ON ?auto_533445 ?auto_533444 ) ( not ( = ?auto_533439 ?auto_533440 ) ) ( not ( = ?auto_533439 ?auto_533441 ) ) ( not ( = ?auto_533439 ?auto_533442 ) ) ( not ( = ?auto_533439 ?auto_533443 ) ) ( not ( = ?auto_533439 ?auto_533444 ) ) ( not ( = ?auto_533439 ?auto_533445 ) ) ( not ( = ?auto_533439 ?auto_533446 ) ) ( not ( = ?auto_533439 ?auto_533447 ) ) ( not ( = ?auto_533439 ?auto_533448 ) ) ( not ( = ?auto_533439 ?auto_533449 ) ) ( not ( = ?auto_533439 ?auto_533450 ) ) ( not ( = ?auto_533439 ?auto_533451 ) ) ( not ( = ?auto_533439 ?auto_533452 ) ) ( not ( = ?auto_533439 ?auto_533453 ) ) ( not ( = ?auto_533439 ?auto_533454 ) ) ( not ( = ?auto_533440 ?auto_533441 ) ) ( not ( = ?auto_533440 ?auto_533442 ) ) ( not ( = ?auto_533440 ?auto_533443 ) ) ( not ( = ?auto_533440 ?auto_533444 ) ) ( not ( = ?auto_533440 ?auto_533445 ) ) ( not ( = ?auto_533440 ?auto_533446 ) ) ( not ( = ?auto_533440 ?auto_533447 ) ) ( not ( = ?auto_533440 ?auto_533448 ) ) ( not ( = ?auto_533440 ?auto_533449 ) ) ( not ( = ?auto_533440 ?auto_533450 ) ) ( not ( = ?auto_533440 ?auto_533451 ) ) ( not ( = ?auto_533440 ?auto_533452 ) ) ( not ( = ?auto_533440 ?auto_533453 ) ) ( not ( = ?auto_533440 ?auto_533454 ) ) ( not ( = ?auto_533441 ?auto_533442 ) ) ( not ( = ?auto_533441 ?auto_533443 ) ) ( not ( = ?auto_533441 ?auto_533444 ) ) ( not ( = ?auto_533441 ?auto_533445 ) ) ( not ( = ?auto_533441 ?auto_533446 ) ) ( not ( = ?auto_533441 ?auto_533447 ) ) ( not ( = ?auto_533441 ?auto_533448 ) ) ( not ( = ?auto_533441 ?auto_533449 ) ) ( not ( = ?auto_533441 ?auto_533450 ) ) ( not ( = ?auto_533441 ?auto_533451 ) ) ( not ( = ?auto_533441 ?auto_533452 ) ) ( not ( = ?auto_533441 ?auto_533453 ) ) ( not ( = ?auto_533441 ?auto_533454 ) ) ( not ( = ?auto_533442 ?auto_533443 ) ) ( not ( = ?auto_533442 ?auto_533444 ) ) ( not ( = ?auto_533442 ?auto_533445 ) ) ( not ( = ?auto_533442 ?auto_533446 ) ) ( not ( = ?auto_533442 ?auto_533447 ) ) ( not ( = ?auto_533442 ?auto_533448 ) ) ( not ( = ?auto_533442 ?auto_533449 ) ) ( not ( = ?auto_533442 ?auto_533450 ) ) ( not ( = ?auto_533442 ?auto_533451 ) ) ( not ( = ?auto_533442 ?auto_533452 ) ) ( not ( = ?auto_533442 ?auto_533453 ) ) ( not ( = ?auto_533442 ?auto_533454 ) ) ( not ( = ?auto_533443 ?auto_533444 ) ) ( not ( = ?auto_533443 ?auto_533445 ) ) ( not ( = ?auto_533443 ?auto_533446 ) ) ( not ( = ?auto_533443 ?auto_533447 ) ) ( not ( = ?auto_533443 ?auto_533448 ) ) ( not ( = ?auto_533443 ?auto_533449 ) ) ( not ( = ?auto_533443 ?auto_533450 ) ) ( not ( = ?auto_533443 ?auto_533451 ) ) ( not ( = ?auto_533443 ?auto_533452 ) ) ( not ( = ?auto_533443 ?auto_533453 ) ) ( not ( = ?auto_533443 ?auto_533454 ) ) ( not ( = ?auto_533444 ?auto_533445 ) ) ( not ( = ?auto_533444 ?auto_533446 ) ) ( not ( = ?auto_533444 ?auto_533447 ) ) ( not ( = ?auto_533444 ?auto_533448 ) ) ( not ( = ?auto_533444 ?auto_533449 ) ) ( not ( = ?auto_533444 ?auto_533450 ) ) ( not ( = ?auto_533444 ?auto_533451 ) ) ( not ( = ?auto_533444 ?auto_533452 ) ) ( not ( = ?auto_533444 ?auto_533453 ) ) ( not ( = ?auto_533444 ?auto_533454 ) ) ( not ( = ?auto_533445 ?auto_533446 ) ) ( not ( = ?auto_533445 ?auto_533447 ) ) ( not ( = ?auto_533445 ?auto_533448 ) ) ( not ( = ?auto_533445 ?auto_533449 ) ) ( not ( = ?auto_533445 ?auto_533450 ) ) ( not ( = ?auto_533445 ?auto_533451 ) ) ( not ( = ?auto_533445 ?auto_533452 ) ) ( not ( = ?auto_533445 ?auto_533453 ) ) ( not ( = ?auto_533445 ?auto_533454 ) ) ( not ( = ?auto_533446 ?auto_533447 ) ) ( not ( = ?auto_533446 ?auto_533448 ) ) ( not ( = ?auto_533446 ?auto_533449 ) ) ( not ( = ?auto_533446 ?auto_533450 ) ) ( not ( = ?auto_533446 ?auto_533451 ) ) ( not ( = ?auto_533446 ?auto_533452 ) ) ( not ( = ?auto_533446 ?auto_533453 ) ) ( not ( = ?auto_533446 ?auto_533454 ) ) ( not ( = ?auto_533447 ?auto_533448 ) ) ( not ( = ?auto_533447 ?auto_533449 ) ) ( not ( = ?auto_533447 ?auto_533450 ) ) ( not ( = ?auto_533447 ?auto_533451 ) ) ( not ( = ?auto_533447 ?auto_533452 ) ) ( not ( = ?auto_533447 ?auto_533453 ) ) ( not ( = ?auto_533447 ?auto_533454 ) ) ( not ( = ?auto_533448 ?auto_533449 ) ) ( not ( = ?auto_533448 ?auto_533450 ) ) ( not ( = ?auto_533448 ?auto_533451 ) ) ( not ( = ?auto_533448 ?auto_533452 ) ) ( not ( = ?auto_533448 ?auto_533453 ) ) ( not ( = ?auto_533448 ?auto_533454 ) ) ( not ( = ?auto_533449 ?auto_533450 ) ) ( not ( = ?auto_533449 ?auto_533451 ) ) ( not ( = ?auto_533449 ?auto_533452 ) ) ( not ( = ?auto_533449 ?auto_533453 ) ) ( not ( = ?auto_533449 ?auto_533454 ) ) ( not ( = ?auto_533450 ?auto_533451 ) ) ( not ( = ?auto_533450 ?auto_533452 ) ) ( not ( = ?auto_533450 ?auto_533453 ) ) ( not ( = ?auto_533450 ?auto_533454 ) ) ( not ( = ?auto_533451 ?auto_533452 ) ) ( not ( = ?auto_533451 ?auto_533453 ) ) ( not ( = ?auto_533451 ?auto_533454 ) ) ( not ( = ?auto_533452 ?auto_533453 ) ) ( not ( = ?auto_533452 ?auto_533454 ) ) ( not ( = ?auto_533453 ?auto_533454 ) ) ( ON ?auto_533453 ?auto_533454 ) ( ON ?auto_533452 ?auto_533453 ) ( ON ?auto_533451 ?auto_533452 ) ( ON ?auto_533450 ?auto_533451 ) ( ON ?auto_533449 ?auto_533450 ) ( ON ?auto_533448 ?auto_533449 ) ( ON ?auto_533447 ?auto_533448 ) ( CLEAR ?auto_533445 ) ( ON ?auto_533446 ?auto_533447 ) ( CLEAR ?auto_533446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_533439 ?auto_533440 ?auto_533441 ?auto_533442 ?auto_533443 ?auto_533444 ?auto_533445 ?auto_533446 )
      ( MAKE-16PILE ?auto_533439 ?auto_533440 ?auto_533441 ?auto_533442 ?auto_533443 ?auto_533444 ?auto_533445 ?auto_533446 ?auto_533447 ?auto_533448 ?auto_533449 ?auto_533450 ?auto_533451 ?auto_533452 ?auto_533453 ?auto_533454 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533471 - BLOCK
      ?auto_533472 - BLOCK
      ?auto_533473 - BLOCK
      ?auto_533474 - BLOCK
      ?auto_533475 - BLOCK
      ?auto_533476 - BLOCK
      ?auto_533477 - BLOCK
      ?auto_533478 - BLOCK
      ?auto_533479 - BLOCK
      ?auto_533480 - BLOCK
      ?auto_533481 - BLOCK
      ?auto_533482 - BLOCK
      ?auto_533483 - BLOCK
      ?auto_533484 - BLOCK
      ?auto_533485 - BLOCK
      ?auto_533486 - BLOCK
    )
    :vars
    (
      ?auto_533487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533486 ?auto_533487 ) ( ON-TABLE ?auto_533471 ) ( ON ?auto_533472 ?auto_533471 ) ( ON ?auto_533473 ?auto_533472 ) ( ON ?auto_533474 ?auto_533473 ) ( ON ?auto_533475 ?auto_533474 ) ( ON ?auto_533476 ?auto_533475 ) ( not ( = ?auto_533471 ?auto_533472 ) ) ( not ( = ?auto_533471 ?auto_533473 ) ) ( not ( = ?auto_533471 ?auto_533474 ) ) ( not ( = ?auto_533471 ?auto_533475 ) ) ( not ( = ?auto_533471 ?auto_533476 ) ) ( not ( = ?auto_533471 ?auto_533477 ) ) ( not ( = ?auto_533471 ?auto_533478 ) ) ( not ( = ?auto_533471 ?auto_533479 ) ) ( not ( = ?auto_533471 ?auto_533480 ) ) ( not ( = ?auto_533471 ?auto_533481 ) ) ( not ( = ?auto_533471 ?auto_533482 ) ) ( not ( = ?auto_533471 ?auto_533483 ) ) ( not ( = ?auto_533471 ?auto_533484 ) ) ( not ( = ?auto_533471 ?auto_533485 ) ) ( not ( = ?auto_533471 ?auto_533486 ) ) ( not ( = ?auto_533471 ?auto_533487 ) ) ( not ( = ?auto_533472 ?auto_533473 ) ) ( not ( = ?auto_533472 ?auto_533474 ) ) ( not ( = ?auto_533472 ?auto_533475 ) ) ( not ( = ?auto_533472 ?auto_533476 ) ) ( not ( = ?auto_533472 ?auto_533477 ) ) ( not ( = ?auto_533472 ?auto_533478 ) ) ( not ( = ?auto_533472 ?auto_533479 ) ) ( not ( = ?auto_533472 ?auto_533480 ) ) ( not ( = ?auto_533472 ?auto_533481 ) ) ( not ( = ?auto_533472 ?auto_533482 ) ) ( not ( = ?auto_533472 ?auto_533483 ) ) ( not ( = ?auto_533472 ?auto_533484 ) ) ( not ( = ?auto_533472 ?auto_533485 ) ) ( not ( = ?auto_533472 ?auto_533486 ) ) ( not ( = ?auto_533472 ?auto_533487 ) ) ( not ( = ?auto_533473 ?auto_533474 ) ) ( not ( = ?auto_533473 ?auto_533475 ) ) ( not ( = ?auto_533473 ?auto_533476 ) ) ( not ( = ?auto_533473 ?auto_533477 ) ) ( not ( = ?auto_533473 ?auto_533478 ) ) ( not ( = ?auto_533473 ?auto_533479 ) ) ( not ( = ?auto_533473 ?auto_533480 ) ) ( not ( = ?auto_533473 ?auto_533481 ) ) ( not ( = ?auto_533473 ?auto_533482 ) ) ( not ( = ?auto_533473 ?auto_533483 ) ) ( not ( = ?auto_533473 ?auto_533484 ) ) ( not ( = ?auto_533473 ?auto_533485 ) ) ( not ( = ?auto_533473 ?auto_533486 ) ) ( not ( = ?auto_533473 ?auto_533487 ) ) ( not ( = ?auto_533474 ?auto_533475 ) ) ( not ( = ?auto_533474 ?auto_533476 ) ) ( not ( = ?auto_533474 ?auto_533477 ) ) ( not ( = ?auto_533474 ?auto_533478 ) ) ( not ( = ?auto_533474 ?auto_533479 ) ) ( not ( = ?auto_533474 ?auto_533480 ) ) ( not ( = ?auto_533474 ?auto_533481 ) ) ( not ( = ?auto_533474 ?auto_533482 ) ) ( not ( = ?auto_533474 ?auto_533483 ) ) ( not ( = ?auto_533474 ?auto_533484 ) ) ( not ( = ?auto_533474 ?auto_533485 ) ) ( not ( = ?auto_533474 ?auto_533486 ) ) ( not ( = ?auto_533474 ?auto_533487 ) ) ( not ( = ?auto_533475 ?auto_533476 ) ) ( not ( = ?auto_533475 ?auto_533477 ) ) ( not ( = ?auto_533475 ?auto_533478 ) ) ( not ( = ?auto_533475 ?auto_533479 ) ) ( not ( = ?auto_533475 ?auto_533480 ) ) ( not ( = ?auto_533475 ?auto_533481 ) ) ( not ( = ?auto_533475 ?auto_533482 ) ) ( not ( = ?auto_533475 ?auto_533483 ) ) ( not ( = ?auto_533475 ?auto_533484 ) ) ( not ( = ?auto_533475 ?auto_533485 ) ) ( not ( = ?auto_533475 ?auto_533486 ) ) ( not ( = ?auto_533475 ?auto_533487 ) ) ( not ( = ?auto_533476 ?auto_533477 ) ) ( not ( = ?auto_533476 ?auto_533478 ) ) ( not ( = ?auto_533476 ?auto_533479 ) ) ( not ( = ?auto_533476 ?auto_533480 ) ) ( not ( = ?auto_533476 ?auto_533481 ) ) ( not ( = ?auto_533476 ?auto_533482 ) ) ( not ( = ?auto_533476 ?auto_533483 ) ) ( not ( = ?auto_533476 ?auto_533484 ) ) ( not ( = ?auto_533476 ?auto_533485 ) ) ( not ( = ?auto_533476 ?auto_533486 ) ) ( not ( = ?auto_533476 ?auto_533487 ) ) ( not ( = ?auto_533477 ?auto_533478 ) ) ( not ( = ?auto_533477 ?auto_533479 ) ) ( not ( = ?auto_533477 ?auto_533480 ) ) ( not ( = ?auto_533477 ?auto_533481 ) ) ( not ( = ?auto_533477 ?auto_533482 ) ) ( not ( = ?auto_533477 ?auto_533483 ) ) ( not ( = ?auto_533477 ?auto_533484 ) ) ( not ( = ?auto_533477 ?auto_533485 ) ) ( not ( = ?auto_533477 ?auto_533486 ) ) ( not ( = ?auto_533477 ?auto_533487 ) ) ( not ( = ?auto_533478 ?auto_533479 ) ) ( not ( = ?auto_533478 ?auto_533480 ) ) ( not ( = ?auto_533478 ?auto_533481 ) ) ( not ( = ?auto_533478 ?auto_533482 ) ) ( not ( = ?auto_533478 ?auto_533483 ) ) ( not ( = ?auto_533478 ?auto_533484 ) ) ( not ( = ?auto_533478 ?auto_533485 ) ) ( not ( = ?auto_533478 ?auto_533486 ) ) ( not ( = ?auto_533478 ?auto_533487 ) ) ( not ( = ?auto_533479 ?auto_533480 ) ) ( not ( = ?auto_533479 ?auto_533481 ) ) ( not ( = ?auto_533479 ?auto_533482 ) ) ( not ( = ?auto_533479 ?auto_533483 ) ) ( not ( = ?auto_533479 ?auto_533484 ) ) ( not ( = ?auto_533479 ?auto_533485 ) ) ( not ( = ?auto_533479 ?auto_533486 ) ) ( not ( = ?auto_533479 ?auto_533487 ) ) ( not ( = ?auto_533480 ?auto_533481 ) ) ( not ( = ?auto_533480 ?auto_533482 ) ) ( not ( = ?auto_533480 ?auto_533483 ) ) ( not ( = ?auto_533480 ?auto_533484 ) ) ( not ( = ?auto_533480 ?auto_533485 ) ) ( not ( = ?auto_533480 ?auto_533486 ) ) ( not ( = ?auto_533480 ?auto_533487 ) ) ( not ( = ?auto_533481 ?auto_533482 ) ) ( not ( = ?auto_533481 ?auto_533483 ) ) ( not ( = ?auto_533481 ?auto_533484 ) ) ( not ( = ?auto_533481 ?auto_533485 ) ) ( not ( = ?auto_533481 ?auto_533486 ) ) ( not ( = ?auto_533481 ?auto_533487 ) ) ( not ( = ?auto_533482 ?auto_533483 ) ) ( not ( = ?auto_533482 ?auto_533484 ) ) ( not ( = ?auto_533482 ?auto_533485 ) ) ( not ( = ?auto_533482 ?auto_533486 ) ) ( not ( = ?auto_533482 ?auto_533487 ) ) ( not ( = ?auto_533483 ?auto_533484 ) ) ( not ( = ?auto_533483 ?auto_533485 ) ) ( not ( = ?auto_533483 ?auto_533486 ) ) ( not ( = ?auto_533483 ?auto_533487 ) ) ( not ( = ?auto_533484 ?auto_533485 ) ) ( not ( = ?auto_533484 ?auto_533486 ) ) ( not ( = ?auto_533484 ?auto_533487 ) ) ( not ( = ?auto_533485 ?auto_533486 ) ) ( not ( = ?auto_533485 ?auto_533487 ) ) ( not ( = ?auto_533486 ?auto_533487 ) ) ( ON ?auto_533485 ?auto_533486 ) ( ON ?auto_533484 ?auto_533485 ) ( ON ?auto_533483 ?auto_533484 ) ( ON ?auto_533482 ?auto_533483 ) ( ON ?auto_533481 ?auto_533482 ) ( ON ?auto_533480 ?auto_533481 ) ( ON ?auto_533479 ?auto_533480 ) ( ON ?auto_533478 ?auto_533479 ) ( CLEAR ?auto_533476 ) ( ON ?auto_533477 ?auto_533478 ) ( CLEAR ?auto_533477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_533471 ?auto_533472 ?auto_533473 ?auto_533474 ?auto_533475 ?auto_533476 ?auto_533477 )
      ( MAKE-16PILE ?auto_533471 ?auto_533472 ?auto_533473 ?auto_533474 ?auto_533475 ?auto_533476 ?auto_533477 ?auto_533478 ?auto_533479 ?auto_533480 ?auto_533481 ?auto_533482 ?auto_533483 ?auto_533484 ?auto_533485 ?auto_533486 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533504 - BLOCK
      ?auto_533505 - BLOCK
      ?auto_533506 - BLOCK
      ?auto_533507 - BLOCK
      ?auto_533508 - BLOCK
      ?auto_533509 - BLOCK
      ?auto_533510 - BLOCK
      ?auto_533511 - BLOCK
      ?auto_533512 - BLOCK
      ?auto_533513 - BLOCK
      ?auto_533514 - BLOCK
      ?auto_533515 - BLOCK
      ?auto_533516 - BLOCK
      ?auto_533517 - BLOCK
      ?auto_533518 - BLOCK
      ?auto_533519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533519 ) ( ON-TABLE ?auto_533504 ) ( ON ?auto_533505 ?auto_533504 ) ( ON ?auto_533506 ?auto_533505 ) ( ON ?auto_533507 ?auto_533506 ) ( ON ?auto_533508 ?auto_533507 ) ( ON ?auto_533509 ?auto_533508 ) ( not ( = ?auto_533504 ?auto_533505 ) ) ( not ( = ?auto_533504 ?auto_533506 ) ) ( not ( = ?auto_533504 ?auto_533507 ) ) ( not ( = ?auto_533504 ?auto_533508 ) ) ( not ( = ?auto_533504 ?auto_533509 ) ) ( not ( = ?auto_533504 ?auto_533510 ) ) ( not ( = ?auto_533504 ?auto_533511 ) ) ( not ( = ?auto_533504 ?auto_533512 ) ) ( not ( = ?auto_533504 ?auto_533513 ) ) ( not ( = ?auto_533504 ?auto_533514 ) ) ( not ( = ?auto_533504 ?auto_533515 ) ) ( not ( = ?auto_533504 ?auto_533516 ) ) ( not ( = ?auto_533504 ?auto_533517 ) ) ( not ( = ?auto_533504 ?auto_533518 ) ) ( not ( = ?auto_533504 ?auto_533519 ) ) ( not ( = ?auto_533505 ?auto_533506 ) ) ( not ( = ?auto_533505 ?auto_533507 ) ) ( not ( = ?auto_533505 ?auto_533508 ) ) ( not ( = ?auto_533505 ?auto_533509 ) ) ( not ( = ?auto_533505 ?auto_533510 ) ) ( not ( = ?auto_533505 ?auto_533511 ) ) ( not ( = ?auto_533505 ?auto_533512 ) ) ( not ( = ?auto_533505 ?auto_533513 ) ) ( not ( = ?auto_533505 ?auto_533514 ) ) ( not ( = ?auto_533505 ?auto_533515 ) ) ( not ( = ?auto_533505 ?auto_533516 ) ) ( not ( = ?auto_533505 ?auto_533517 ) ) ( not ( = ?auto_533505 ?auto_533518 ) ) ( not ( = ?auto_533505 ?auto_533519 ) ) ( not ( = ?auto_533506 ?auto_533507 ) ) ( not ( = ?auto_533506 ?auto_533508 ) ) ( not ( = ?auto_533506 ?auto_533509 ) ) ( not ( = ?auto_533506 ?auto_533510 ) ) ( not ( = ?auto_533506 ?auto_533511 ) ) ( not ( = ?auto_533506 ?auto_533512 ) ) ( not ( = ?auto_533506 ?auto_533513 ) ) ( not ( = ?auto_533506 ?auto_533514 ) ) ( not ( = ?auto_533506 ?auto_533515 ) ) ( not ( = ?auto_533506 ?auto_533516 ) ) ( not ( = ?auto_533506 ?auto_533517 ) ) ( not ( = ?auto_533506 ?auto_533518 ) ) ( not ( = ?auto_533506 ?auto_533519 ) ) ( not ( = ?auto_533507 ?auto_533508 ) ) ( not ( = ?auto_533507 ?auto_533509 ) ) ( not ( = ?auto_533507 ?auto_533510 ) ) ( not ( = ?auto_533507 ?auto_533511 ) ) ( not ( = ?auto_533507 ?auto_533512 ) ) ( not ( = ?auto_533507 ?auto_533513 ) ) ( not ( = ?auto_533507 ?auto_533514 ) ) ( not ( = ?auto_533507 ?auto_533515 ) ) ( not ( = ?auto_533507 ?auto_533516 ) ) ( not ( = ?auto_533507 ?auto_533517 ) ) ( not ( = ?auto_533507 ?auto_533518 ) ) ( not ( = ?auto_533507 ?auto_533519 ) ) ( not ( = ?auto_533508 ?auto_533509 ) ) ( not ( = ?auto_533508 ?auto_533510 ) ) ( not ( = ?auto_533508 ?auto_533511 ) ) ( not ( = ?auto_533508 ?auto_533512 ) ) ( not ( = ?auto_533508 ?auto_533513 ) ) ( not ( = ?auto_533508 ?auto_533514 ) ) ( not ( = ?auto_533508 ?auto_533515 ) ) ( not ( = ?auto_533508 ?auto_533516 ) ) ( not ( = ?auto_533508 ?auto_533517 ) ) ( not ( = ?auto_533508 ?auto_533518 ) ) ( not ( = ?auto_533508 ?auto_533519 ) ) ( not ( = ?auto_533509 ?auto_533510 ) ) ( not ( = ?auto_533509 ?auto_533511 ) ) ( not ( = ?auto_533509 ?auto_533512 ) ) ( not ( = ?auto_533509 ?auto_533513 ) ) ( not ( = ?auto_533509 ?auto_533514 ) ) ( not ( = ?auto_533509 ?auto_533515 ) ) ( not ( = ?auto_533509 ?auto_533516 ) ) ( not ( = ?auto_533509 ?auto_533517 ) ) ( not ( = ?auto_533509 ?auto_533518 ) ) ( not ( = ?auto_533509 ?auto_533519 ) ) ( not ( = ?auto_533510 ?auto_533511 ) ) ( not ( = ?auto_533510 ?auto_533512 ) ) ( not ( = ?auto_533510 ?auto_533513 ) ) ( not ( = ?auto_533510 ?auto_533514 ) ) ( not ( = ?auto_533510 ?auto_533515 ) ) ( not ( = ?auto_533510 ?auto_533516 ) ) ( not ( = ?auto_533510 ?auto_533517 ) ) ( not ( = ?auto_533510 ?auto_533518 ) ) ( not ( = ?auto_533510 ?auto_533519 ) ) ( not ( = ?auto_533511 ?auto_533512 ) ) ( not ( = ?auto_533511 ?auto_533513 ) ) ( not ( = ?auto_533511 ?auto_533514 ) ) ( not ( = ?auto_533511 ?auto_533515 ) ) ( not ( = ?auto_533511 ?auto_533516 ) ) ( not ( = ?auto_533511 ?auto_533517 ) ) ( not ( = ?auto_533511 ?auto_533518 ) ) ( not ( = ?auto_533511 ?auto_533519 ) ) ( not ( = ?auto_533512 ?auto_533513 ) ) ( not ( = ?auto_533512 ?auto_533514 ) ) ( not ( = ?auto_533512 ?auto_533515 ) ) ( not ( = ?auto_533512 ?auto_533516 ) ) ( not ( = ?auto_533512 ?auto_533517 ) ) ( not ( = ?auto_533512 ?auto_533518 ) ) ( not ( = ?auto_533512 ?auto_533519 ) ) ( not ( = ?auto_533513 ?auto_533514 ) ) ( not ( = ?auto_533513 ?auto_533515 ) ) ( not ( = ?auto_533513 ?auto_533516 ) ) ( not ( = ?auto_533513 ?auto_533517 ) ) ( not ( = ?auto_533513 ?auto_533518 ) ) ( not ( = ?auto_533513 ?auto_533519 ) ) ( not ( = ?auto_533514 ?auto_533515 ) ) ( not ( = ?auto_533514 ?auto_533516 ) ) ( not ( = ?auto_533514 ?auto_533517 ) ) ( not ( = ?auto_533514 ?auto_533518 ) ) ( not ( = ?auto_533514 ?auto_533519 ) ) ( not ( = ?auto_533515 ?auto_533516 ) ) ( not ( = ?auto_533515 ?auto_533517 ) ) ( not ( = ?auto_533515 ?auto_533518 ) ) ( not ( = ?auto_533515 ?auto_533519 ) ) ( not ( = ?auto_533516 ?auto_533517 ) ) ( not ( = ?auto_533516 ?auto_533518 ) ) ( not ( = ?auto_533516 ?auto_533519 ) ) ( not ( = ?auto_533517 ?auto_533518 ) ) ( not ( = ?auto_533517 ?auto_533519 ) ) ( not ( = ?auto_533518 ?auto_533519 ) ) ( ON ?auto_533518 ?auto_533519 ) ( ON ?auto_533517 ?auto_533518 ) ( ON ?auto_533516 ?auto_533517 ) ( ON ?auto_533515 ?auto_533516 ) ( ON ?auto_533514 ?auto_533515 ) ( ON ?auto_533513 ?auto_533514 ) ( ON ?auto_533512 ?auto_533513 ) ( ON ?auto_533511 ?auto_533512 ) ( CLEAR ?auto_533509 ) ( ON ?auto_533510 ?auto_533511 ) ( CLEAR ?auto_533510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_533504 ?auto_533505 ?auto_533506 ?auto_533507 ?auto_533508 ?auto_533509 ?auto_533510 )
      ( MAKE-16PILE ?auto_533504 ?auto_533505 ?auto_533506 ?auto_533507 ?auto_533508 ?auto_533509 ?auto_533510 ?auto_533511 ?auto_533512 ?auto_533513 ?auto_533514 ?auto_533515 ?auto_533516 ?auto_533517 ?auto_533518 ?auto_533519 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533536 - BLOCK
      ?auto_533537 - BLOCK
      ?auto_533538 - BLOCK
      ?auto_533539 - BLOCK
      ?auto_533540 - BLOCK
      ?auto_533541 - BLOCK
      ?auto_533542 - BLOCK
      ?auto_533543 - BLOCK
      ?auto_533544 - BLOCK
      ?auto_533545 - BLOCK
      ?auto_533546 - BLOCK
      ?auto_533547 - BLOCK
      ?auto_533548 - BLOCK
      ?auto_533549 - BLOCK
      ?auto_533550 - BLOCK
      ?auto_533551 - BLOCK
    )
    :vars
    (
      ?auto_533552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533551 ?auto_533552 ) ( ON-TABLE ?auto_533536 ) ( ON ?auto_533537 ?auto_533536 ) ( ON ?auto_533538 ?auto_533537 ) ( ON ?auto_533539 ?auto_533538 ) ( ON ?auto_533540 ?auto_533539 ) ( not ( = ?auto_533536 ?auto_533537 ) ) ( not ( = ?auto_533536 ?auto_533538 ) ) ( not ( = ?auto_533536 ?auto_533539 ) ) ( not ( = ?auto_533536 ?auto_533540 ) ) ( not ( = ?auto_533536 ?auto_533541 ) ) ( not ( = ?auto_533536 ?auto_533542 ) ) ( not ( = ?auto_533536 ?auto_533543 ) ) ( not ( = ?auto_533536 ?auto_533544 ) ) ( not ( = ?auto_533536 ?auto_533545 ) ) ( not ( = ?auto_533536 ?auto_533546 ) ) ( not ( = ?auto_533536 ?auto_533547 ) ) ( not ( = ?auto_533536 ?auto_533548 ) ) ( not ( = ?auto_533536 ?auto_533549 ) ) ( not ( = ?auto_533536 ?auto_533550 ) ) ( not ( = ?auto_533536 ?auto_533551 ) ) ( not ( = ?auto_533536 ?auto_533552 ) ) ( not ( = ?auto_533537 ?auto_533538 ) ) ( not ( = ?auto_533537 ?auto_533539 ) ) ( not ( = ?auto_533537 ?auto_533540 ) ) ( not ( = ?auto_533537 ?auto_533541 ) ) ( not ( = ?auto_533537 ?auto_533542 ) ) ( not ( = ?auto_533537 ?auto_533543 ) ) ( not ( = ?auto_533537 ?auto_533544 ) ) ( not ( = ?auto_533537 ?auto_533545 ) ) ( not ( = ?auto_533537 ?auto_533546 ) ) ( not ( = ?auto_533537 ?auto_533547 ) ) ( not ( = ?auto_533537 ?auto_533548 ) ) ( not ( = ?auto_533537 ?auto_533549 ) ) ( not ( = ?auto_533537 ?auto_533550 ) ) ( not ( = ?auto_533537 ?auto_533551 ) ) ( not ( = ?auto_533537 ?auto_533552 ) ) ( not ( = ?auto_533538 ?auto_533539 ) ) ( not ( = ?auto_533538 ?auto_533540 ) ) ( not ( = ?auto_533538 ?auto_533541 ) ) ( not ( = ?auto_533538 ?auto_533542 ) ) ( not ( = ?auto_533538 ?auto_533543 ) ) ( not ( = ?auto_533538 ?auto_533544 ) ) ( not ( = ?auto_533538 ?auto_533545 ) ) ( not ( = ?auto_533538 ?auto_533546 ) ) ( not ( = ?auto_533538 ?auto_533547 ) ) ( not ( = ?auto_533538 ?auto_533548 ) ) ( not ( = ?auto_533538 ?auto_533549 ) ) ( not ( = ?auto_533538 ?auto_533550 ) ) ( not ( = ?auto_533538 ?auto_533551 ) ) ( not ( = ?auto_533538 ?auto_533552 ) ) ( not ( = ?auto_533539 ?auto_533540 ) ) ( not ( = ?auto_533539 ?auto_533541 ) ) ( not ( = ?auto_533539 ?auto_533542 ) ) ( not ( = ?auto_533539 ?auto_533543 ) ) ( not ( = ?auto_533539 ?auto_533544 ) ) ( not ( = ?auto_533539 ?auto_533545 ) ) ( not ( = ?auto_533539 ?auto_533546 ) ) ( not ( = ?auto_533539 ?auto_533547 ) ) ( not ( = ?auto_533539 ?auto_533548 ) ) ( not ( = ?auto_533539 ?auto_533549 ) ) ( not ( = ?auto_533539 ?auto_533550 ) ) ( not ( = ?auto_533539 ?auto_533551 ) ) ( not ( = ?auto_533539 ?auto_533552 ) ) ( not ( = ?auto_533540 ?auto_533541 ) ) ( not ( = ?auto_533540 ?auto_533542 ) ) ( not ( = ?auto_533540 ?auto_533543 ) ) ( not ( = ?auto_533540 ?auto_533544 ) ) ( not ( = ?auto_533540 ?auto_533545 ) ) ( not ( = ?auto_533540 ?auto_533546 ) ) ( not ( = ?auto_533540 ?auto_533547 ) ) ( not ( = ?auto_533540 ?auto_533548 ) ) ( not ( = ?auto_533540 ?auto_533549 ) ) ( not ( = ?auto_533540 ?auto_533550 ) ) ( not ( = ?auto_533540 ?auto_533551 ) ) ( not ( = ?auto_533540 ?auto_533552 ) ) ( not ( = ?auto_533541 ?auto_533542 ) ) ( not ( = ?auto_533541 ?auto_533543 ) ) ( not ( = ?auto_533541 ?auto_533544 ) ) ( not ( = ?auto_533541 ?auto_533545 ) ) ( not ( = ?auto_533541 ?auto_533546 ) ) ( not ( = ?auto_533541 ?auto_533547 ) ) ( not ( = ?auto_533541 ?auto_533548 ) ) ( not ( = ?auto_533541 ?auto_533549 ) ) ( not ( = ?auto_533541 ?auto_533550 ) ) ( not ( = ?auto_533541 ?auto_533551 ) ) ( not ( = ?auto_533541 ?auto_533552 ) ) ( not ( = ?auto_533542 ?auto_533543 ) ) ( not ( = ?auto_533542 ?auto_533544 ) ) ( not ( = ?auto_533542 ?auto_533545 ) ) ( not ( = ?auto_533542 ?auto_533546 ) ) ( not ( = ?auto_533542 ?auto_533547 ) ) ( not ( = ?auto_533542 ?auto_533548 ) ) ( not ( = ?auto_533542 ?auto_533549 ) ) ( not ( = ?auto_533542 ?auto_533550 ) ) ( not ( = ?auto_533542 ?auto_533551 ) ) ( not ( = ?auto_533542 ?auto_533552 ) ) ( not ( = ?auto_533543 ?auto_533544 ) ) ( not ( = ?auto_533543 ?auto_533545 ) ) ( not ( = ?auto_533543 ?auto_533546 ) ) ( not ( = ?auto_533543 ?auto_533547 ) ) ( not ( = ?auto_533543 ?auto_533548 ) ) ( not ( = ?auto_533543 ?auto_533549 ) ) ( not ( = ?auto_533543 ?auto_533550 ) ) ( not ( = ?auto_533543 ?auto_533551 ) ) ( not ( = ?auto_533543 ?auto_533552 ) ) ( not ( = ?auto_533544 ?auto_533545 ) ) ( not ( = ?auto_533544 ?auto_533546 ) ) ( not ( = ?auto_533544 ?auto_533547 ) ) ( not ( = ?auto_533544 ?auto_533548 ) ) ( not ( = ?auto_533544 ?auto_533549 ) ) ( not ( = ?auto_533544 ?auto_533550 ) ) ( not ( = ?auto_533544 ?auto_533551 ) ) ( not ( = ?auto_533544 ?auto_533552 ) ) ( not ( = ?auto_533545 ?auto_533546 ) ) ( not ( = ?auto_533545 ?auto_533547 ) ) ( not ( = ?auto_533545 ?auto_533548 ) ) ( not ( = ?auto_533545 ?auto_533549 ) ) ( not ( = ?auto_533545 ?auto_533550 ) ) ( not ( = ?auto_533545 ?auto_533551 ) ) ( not ( = ?auto_533545 ?auto_533552 ) ) ( not ( = ?auto_533546 ?auto_533547 ) ) ( not ( = ?auto_533546 ?auto_533548 ) ) ( not ( = ?auto_533546 ?auto_533549 ) ) ( not ( = ?auto_533546 ?auto_533550 ) ) ( not ( = ?auto_533546 ?auto_533551 ) ) ( not ( = ?auto_533546 ?auto_533552 ) ) ( not ( = ?auto_533547 ?auto_533548 ) ) ( not ( = ?auto_533547 ?auto_533549 ) ) ( not ( = ?auto_533547 ?auto_533550 ) ) ( not ( = ?auto_533547 ?auto_533551 ) ) ( not ( = ?auto_533547 ?auto_533552 ) ) ( not ( = ?auto_533548 ?auto_533549 ) ) ( not ( = ?auto_533548 ?auto_533550 ) ) ( not ( = ?auto_533548 ?auto_533551 ) ) ( not ( = ?auto_533548 ?auto_533552 ) ) ( not ( = ?auto_533549 ?auto_533550 ) ) ( not ( = ?auto_533549 ?auto_533551 ) ) ( not ( = ?auto_533549 ?auto_533552 ) ) ( not ( = ?auto_533550 ?auto_533551 ) ) ( not ( = ?auto_533550 ?auto_533552 ) ) ( not ( = ?auto_533551 ?auto_533552 ) ) ( ON ?auto_533550 ?auto_533551 ) ( ON ?auto_533549 ?auto_533550 ) ( ON ?auto_533548 ?auto_533549 ) ( ON ?auto_533547 ?auto_533548 ) ( ON ?auto_533546 ?auto_533547 ) ( ON ?auto_533545 ?auto_533546 ) ( ON ?auto_533544 ?auto_533545 ) ( ON ?auto_533543 ?auto_533544 ) ( ON ?auto_533542 ?auto_533543 ) ( CLEAR ?auto_533540 ) ( ON ?auto_533541 ?auto_533542 ) ( CLEAR ?auto_533541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_533536 ?auto_533537 ?auto_533538 ?auto_533539 ?auto_533540 ?auto_533541 )
      ( MAKE-16PILE ?auto_533536 ?auto_533537 ?auto_533538 ?auto_533539 ?auto_533540 ?auto_533541 ?auto_533542 ?auto_533543 ?auto_533544 ?auto_533545 ?auto_533546 ?auto_533547 ?auto_533548 ?auto_533549 ?auto_533550 ?auto_533551 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533569 - BLOCK
      ?auto_533570 - BLOCK
      ?auto_533571 - BLOCK
      ?auto_533572 - BLOCK
      ?auto_533573 - BLOCK
      ?auto_533574 - BLOCK
      ?auto_533575 - BLOCK
      ?auto_533576 - BLOCK
      ?auto_533577 - BLOCK
      ?auto_533578 - BLOCK
      ?auto_533579 - BLOCK
      ?auto_533580 - BLOCK
      ?auto_533581 - BLOCK
      ?auto_533582 - BLOCK
      ?auto_533583 - BLOCK
      ?auto_533584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533584 ) ( ON-TABLE ?auto_533569 ) ( ON ?auto_533570 ?auto_533569 ) ( ON ?auto_533571 ?auto_533570 ) ( ON ?auto_533572 ?auto_533571 ) ( ON ?auto_533573 ?auto_533572 ) ( not ( = ?auto_533569 ?auto_533570 ) ) ( not ( = ?auto_533569 ?auto_533571 ) ) ( not ( = ?auto_533569 ?auto_533572 ) ) ( not ( = ?auto_533569 ?auto_533573 ) ) ( not ( = ?auto_533569 ?auto_533574 ) ) ( not ( = ?auto_533569 ?auto_533575 ) ) ( not ( = ?auto_533569 ?auto_533576 ) ) ( not ( = ?auto_533569 ?auto_533577 ) ) ( not ( = ?auto_533569 ?auto_533578 ) ) ( not ( = ?auto_533569 ?auto_533579 ) ) ( not ( = ?auto_533569 ?auto_533580 ) ) ( not ( = ?auto_533569 ?auto_533581 ) ) ( not ( = ?auto_533569 ?auto_533582 ) ) ( not ( = ?auto_533569 ?auto_533583 ) ) ( not ( = ?auto_533569 ?auto_533584 ) ) ( not ( = ?auto_533570 ?auto_533571 ) ) ( not ( = ?auto_533570 ?auto_533572 ) ) ( not ( = ?auto_533570 ?auto_533573 ) ) ( not ( = ?auto_533570 ?auto_533574 ) ) ( not ( = ?auto_533570 ?auto_533575 ) ) ( not ( = ?auto_533570 ?auto_533576 ) ) ( not ( = ?auto_533570 ?auto_533577 ) ) ( not ( = ?auto_533570 ?auto_533578 ) ) ( not ( = ?auto_533570 ?auto_533579 ) ) ( not ( = ?auto_533570 ?auto_533580 ) ) ( not ( = ?auto_533570 ?auto_533581 ) ) ( not ( = ?auto_533570 ?auto_533582 ) ) ( not ( = ?auto_533570 ?auto_533583 ) ) ( not ( = ?auto_533570 ?auto_533584 ) ) ( not ( = ?auto_533571 ?auto_533572 ) ) ( not ( = ?auto_533571 ?auto_533573 ) ) ( not ( = ?auto_533571 ?auto_533574 ) ) ( not ( = ?auto_533571 ?auto_533575 ) ) ( not ( = ?auto_533571 ?auto_533576 ) ) ( not ( = ?auto_533571 ?auto_533577 ) ) ( not ( = ?auto_533571 ?auto_533578 ) ) ( not ( = ?auto_533571 ?auto_533579 ) ) ( not ( = ?auto_533571 ?auto_533580 ) ) ( not ( = ?auto_533571 ?auto_533581 ) ) ( not ( = ?auto_533571 ?auto_533582 ) ) ( not ( = ?auto_533571 ?auto_533583 ) ) ( not ( = ?auto_533571 ?auto_533584 ) ) ( not ( = ?auto_533572 ?auto_533573 ) ) ( not ( = ?auto_533572 ?auto_533574 ) ) ( not ( = ?auto_533572 ?auto_533575 ) ) ( not ( = ?auto_533572 ?auto_533576 ) ) ( not ( = ?auto_533572 ?auto_533577 ) ) ( not ( = ?auto_533572 ?auto_533578 ) ) ( not ( = ?auto_533572 ?auto_533579 ) ) ( not ( = ?auto_533572 ?auto_533580 ) ) ( not ( = ?auto_533572 ?auto_533581 ) ) ( not ( = ?auto_533572 ?auto_533582 ) ) ( not ( = ?auto_533572 ?auto_533583 ) ) ( not ( = ?auto_533572 ?auto_533584 ) ) ( not ( = ?auto_533573 ?auto_533574 ) ) ( not ( = ?auto_533573 ?auto_533575 ) ) ( not ( = ?auto_533573 ?auto_533576 ) ) ( not ( = ?auto_533573 ?auto_533577 ) ) ( not ( = ?auto_533573 ?auto_533578 ) ) ( not ( = ?auto_533573 ?auto_533579 ) ) ( not ( = ?auto_533573 ?auto_533580 ) ) ( not ( = ?auto_533573 ?auto_533581 ) ) ( not ( = ?auto_533573 ?auto_533582 ) ) ( not ( = ?auto_533573 ?auto_533583 ) ) ( not ( = ?auto_533573 ?auto_533584 ) ) ( not ( = ?auto_533574 ?auto_533575 ) ) ( not ( = ?auto_533574 ?auto_533576 ) ) ( not ( = ?auto_533574 ?auto_533577 ) ) ( not ( = ?auto_533574 ?auto_533578 ) ) ( not ( = ?auto_533574 ?auto_533579 ) ) ( not ( = ?auto_533574 ?auto_533580 ) ) ( not ( = ?auto_533574 ?auto_533581 ) ) ( not ( = ?auto_533574 ?auto_533582 ) ) ( not ( = ?auto_533574 ?auto_533583 ) ) ( not ( = ?auto_533574 ?auto_533584 ) ) ( not ( = ?auto_533575 ?auto_533576 ) ) ( not ( = ?auto_533575 ?auto_533577 ) ) ( not ( = ?auto_533575 ?auto_533578 ) ) ( not ( = ?auto_533575 ?auto_533579 ) ) ( not ( = ?auto_533575 ?auto_533580 ) ) ( not ( = ?auto_533575 ?auto_533581 ) ) ( not ( = ?auto_533575 ?auto_533582 ) ) ( not ( = ?auto_533575 ?auto_533583 ) ) ( not ( = ?auto_533575 ?auto_533584 ) ) ( not ( = ?auto_533576 ?auto_533577 ) ) ( not ( = ?auto_533576 ?auto_533578 ) ) ( not ( = ?auto_533576 ?auto_533579 ) ) ( not ( = ?auto_533576 ?auto_533580 ) ) ( not ( = ?auto_533576 ?auto_533581 ) ) ( not ( = ?auto_533576 ?auto_533582 ) ) ( not ( = ?auto_533576 ?auto_533583 ) ) ( not ( = ?auto_533576 ?auto_533584 ) ) ( not ( = ?auto_533577 ?auto_533578 ) ) ( not ( = ?auto_533577 ?auto_533579 ) ) ( not ( = ?auto_533577 ?auto_533580 ) ) ( not ( = ?auto_533577 ?auto_533581 ) ) ( not ( = ?auto_533577 ?auto_533582 ) ) ( not ( = ?auto_533577 ?auto_533583 ) ) ( not ( = ?auto_533577 ?auto_533584 ) ) ( not ( = ?auto_533578 ?auto_533579 ) ) ( not ( = ?auto_533578 ?auto_533580 ) ) ( not ( = ?auto_533578 ?auto_533581 ) ) ( not ( = ?auto_533578 ?auto_533582 ) ) ( not ( = ?auto_533578 ?auto_533583 ) ) ( not ( = ?auto_533578 ?auto_533584 ) ) ( not ( = ?auto_533579 ?auto_533580 ) ) ( not ( = ?auto_533579 ?auto_533581 ) ) ( not ( = ?auto_533579 ?auto_533582 ) ) ( not ( = ?auto_533579 ?auto_533583 ) ) ( not ( = ?auto_533579 ?auto_533584 ) ) ( not ( = ?auto_533580 ?auto_533581 ) ) ( not ( = ?auto_533580 ?auto_533582 ) ) ( not ( = ?auto_533580 ?auto_533583 ) ) ( not ( = ?auto_533580 ?auto_533584 ) ) ( not ( = ?auto_533581 ?auto_533582 ) ) ( not ( = ?auto_533581 ?auto_533583 ) ) ( not ( = ?auto_533581 ?auto_533584 ) ) ( not ( = ?auto_533582 ?auto_533583 ) ) ( not ( = ?auto_533582 ?auto_533584 ) ) ( not ( = ?auto_533583 ?auto_533584 ) ) ( ON ?auto_533583 ?auto_533584 ) ( ON ?auto_533582 ?auto_533583 ) ( ON ?auto_533581 ?auto_533582 ) ( ON ?auto_533580 ?auto_533581 ) ( ON ?auto_533579 ?auto_533580 ) ( ON ?auto_533578 ?auto_533579 ) ( ON ?auto_533577 ?auto_533578 ) ( ON ?auto_533576 ?auto_533577 ) ( ON ?auto_533575 ?auto_533576 ) ( CLEAR ?auto_533573 ) ( ON ?auto_533574 ?auto_533575 ) ( CLEAR ?auto_533574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_533569 ?auto_533570 ?auto_533571 ?auto_533572 ?auto_533573 ?auto_533574 )
      ( MAKE-16PILE ?auto_533569 ?auto_533570 ?auto_533571 ?auto_533572 ?auto_533573 ?auto_533574 ?auto_533575 ?auto_533576 ?auto_533577 ?auto_533578 ?auto_533579 ?auto_533580 ?auto_533581 ?auto_533582 ?auto_533583 ?auto_533584 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533601 - BLOCK
      ?auto_533602 - BLOCK
      ?auto_533603 - BLOCK
      ?auto_533604 - BLOCK
      ?auto_533605 - BLOCK
      ?auto_533606 - BLOCK
      ?auto_533607 - BLOCK
      ?auto_533608 - BLOCK
      ?auto_533609 - BLOCK
      ?auto_533610 - BLOCK
      ?auto_533611 - BLOCK
      ?auto_533612 - BLOCK
      ?auto_533613 - BLOCK
      ?auto_533614 - BLOCK
      ?auto_533615 - BLOCK
      ?auto_533616 - BLOCK
    )
    :vars
    (
      ?auto_533617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533616 ?auto_533617 ) ( ON-TABLE ?auto_533601 ) ( ON ?auto_533602 ?auto_533601 ) ( ON ?auto_533603 ?auto_533602 ) ( ON ?auto_533604 ?auto_533603 ) ( not ( = ?auto_533601 ?auto_533602 ) ) ( not ( = ?auto_533601 ?auto_533603 ) ) ( not ( = ?auto_533601 ?auto_533604 ) ) ( not ( = ?auto_533601 ?auto_533605 ) ) ( not ( = ?auto_533601 ?auto_533606 ) ) ( not ( = ?auto_533601 ?auto_533607 ) ) ( not ( = ?auto_533601 ?auto_533608 ) ) ( not ( = ?auto_533601 ?auto_533609 ) ) ( not ( = ?auto_533601 ?auto_533610 ) ) ( not ( = ?auto_533601 ?auto_533611 ) ) ( not ( = ?auto_533601 ?auto_533612 ) ) ( not ( = ?auto_533601 ?auto_533613 ) ) ( not ( = ?auto_533601 ?auto_533614 ) ) ( not ( = ?auto_533601 ?auto_533615 ) ) ( not ( = ?auto_533601 ?auto_533616 ) ) ( not ( = ?auto_533601 ?auto_533617 ) ) ( not ( = ?auto_533602 ?auto_533603 ) ) ( not ( = ?auto_533602 ?auto_533604 ) ) ( not ( = ?auto_533602 ?auto_533605 ) ) ( not ( = ?auto_533602 ?auto_533606 ) ) ( not ( = ?auto_533602 ?auto_533607 ) ) ( not ( = ?auto_533602 ?auto_533608 ) ) ( not ( = ?auto_533602 ?auto_533609 ) ) ( not ( = ?auto_533602 ?auto_533610 ) ) ( not ( = ?auto_533602 ?auto_533611 ) ) ( not ( = ?auto_533602 ?auto_533612 ) ) ( not ( = ?auto_533602 ?auto_533613 ) ) ( not ( = ?auto_533602 ?auto_533614 ) ) ( not ( = ?auto_533602 ?auto_533615 ) ) ( not ( = ?auto_533602 ?auto_533616 ) ) ( not ( = ?auto_533602 ?auto_533617 ) ) ( not ( = ?auto_533603 ?auto_533604 ) ) ( not ( = ?auto_533603 ?auto_533605 ) ) ( not ( = ?auto_533603 ?auto_533606 ) ) ( not ( = ?auto_533603 ?auto_533607 ) ) ( not ( = ?auto_533603 ?auto_533608 ) ) ( not ( = ?auto_533603 ?auto_533609 ) ) ( not ( = ?auto_533603 ?auto_533610 ) ) ( not ( = ?auto_533603 ?auto_533611 ) ) ( not ( = ?auto_533603 ?auto_533612 ) ) ( not ( = ?auto_533603 ?auto_533613 ) ) ( not ( = ?auto_533603 ?auto_533614 ) ) ( not ( = ?auto_533603 ?auto_533615 ) ) ( not ( = ?auto_533603 ?auto_533616 ) ) ( not ( = ?auto_533603 ?auto_533617 ) ) ( not ( = ?auto_533604 ?auto_533605 ) ) ( not ( = ?auto_533604 ?auto_533606 ) ) ( not ( = ?auto_533604 ?auto_533607 ) ) ( not ( = ?auto_533604 ?auto_533608 ) ) ( not ( = ?auto_533604 ?auto_533609 ) ) ( not ( = ?auto_533604 ?auto_533610 ) ) ( not ( = ?auto_533604 ?auto_533611 ) ) ( not ( = ?auto_533604 ?auto_533612 ) ) ( not ( = ?auto_533604 ?auto_533613 ) ) ( not ( = ?auto_533604 ?auto_533614 ) ) ( not ( = ?auto_533604 ?auto_533615 ) ) ( not ( = ?auto_533604 ?auto_533616 ) ) ( not ( = ?auto_533604 ?auto_533617 ) ) ( not ( = ?auto_533605 ?auto_533606 ) ) ( not ( = ?auto_533605 ?auto_533607 ) ) ( not ( = ?auto_533605 ?auto_533608 ) ) ( not ( = ?auto_533605 ?auto_533609 ) ) ( not ( = ?auto_533605 ?auto_533610 ) ) ( not ( = ?auto_533605 ?auto_533611 ) ) ( not ( = ?auto_533605 ?auto_533612 ) ) ( not ( = ?auto_533605 ?auto_533613 ) ) ( not ( = ?auto_533605 ?auto_533614 ) ) ( not ( = ?auto_533605 ?auto_533615 ) ) ( not ( = ?auto_533605 ?auto_533616 ) ) ( not ( = ?auto_533605 ?auto_533617 ) ) ( not ( = ?auto_533606 ?auto_533607 ) ) ( not ( = ?auto_533606 ?auto_533608 ) ) ( not ( = ?auto_533606 ?auto_533609 ) ) ( not ( = ?auto_533606 ?auto_533610 ) ) ( not ( = ?auto_533606 ?auto_533611 ) ) ( not ( = ?auto_533606 ?auto_533612 ) ) ( not ( = ?auto_533606 ?auto_533613 ) ) ( not ( = ?auto_533606 ?auto_533614 ) ) ( not ( = ?auto_533606 ?auto_533615 ) ) ( not ( = ?auto_533606 ?auto_533616 ) ) ( not ( = ?auto_533606 ?auto_533617 ) ) ( not ( = ?auto_533607 ?auto_533608 ) ) ( not ( = ?auto_533607 ?auto_533609 ) ) ( not ( = ?auto_533607 ?auto_533610 ) ) ( not ( = ?auto_533607 ?auto_533611 ) ) ( not ( = ?auto_533607 ?auto_533612 ) ) ( not ( = ?auto_533607 ?auto_533613 ) ) ( not ( = ?auto_533607 ?auto_533614 ) ) ( not ( = ?auto_533607 ?auto_533615 ) ) ( not ( = ?auto_533607 ?auto_533616 ) ) ( not ( = ?auto_533607 ?auto_533617 ) ) ( not ( = ?auto_533608 ?auto_533609 ) ) ( not ( = ?auto_533608 ?auto_533610 ) ) ( not ( = ?auto_533608 ?auto_533611 ) ) ( not ( = ?auto_533608 ?auto_533612 ) ) ( not ( = ?auto_533608 ?auto_533613 ) ) ( not ( = ?auto_533608 ?auto_533614 ) ) ( not ( = ?auto_533608 ?auto_533615 ) ) ( not ( = ?auto_533608 ?auto_533616 ) ) ( not ( = ?auto_533608 ?auto_533617 ) ) ( not ( = ?auto_533609 ?auto_533610 ) ) ( not ( = ?auto_533609 ?auto_533611 ) ) ( not ( = ?auto_533609 ?auto_533612 ) ) ( not ( = ?auto_533609 ?auto_533613 ) ) ( not ( = ?auto_533609 ?auto_533614 ) ) ( not ( = ?auto_533609 ?auto_533615 ) ) ( not ( = ?auto_533609 ?auto_533616 ) ) ( not ( = ?auto_533609 ?auto_533617 ) ) ( not ( = ?auto_533610 ?auto_533611 ) ) ( not ( = ?auto_533610 ?auto_533612 ) ) ( not ( = ?auto_533610 ?auto_533613 ) ) ( not ( = ?auto_533610 ?auto_533614 ) ) ( not ( = ?auto_533610 ?auto_533615 ) ) ( not ( = ?auto_533610 ?auto_533616 ) ) ( not ( = ?auto_533610 ?auto_533617 ) ) ( not ( = ?auto_533611 ?auto_533612 ) ) ( not ( = ?auto_533611 ?auto_533613 ) ) ( not ( = ?auto_533611 ?auto_533614 ) ) ( not ( = ?auto_533611 ?auto_533615 ) ) ( not ( = ?auto_533611 ?auto_533616 ) ) ( not ( = ?auto_533611 ?auto_533617 ) ) ( not ( = ?auto_533612 ?auto_533613 ) ) ( not ( = ?auto_533612 ?auto_533614 ) ) ( not ( = ?auto_533612 ?auto_533615 ) ) ( not ( = ?auto_533612 ?auto_533616 ) ) ( not ( = ?auto_533612 ?auto_533617 ) ) ( not ( = ?auto_533613 ?auto_533614 ) ) ( not ( = ?auto_533613 ?auto_533615 ) ) ( not ( = ?auto_533613 ?auto_533616 ) ) ( not ( = ?auto_533613 ?auto_533617 ) ) ( not ( = ?auto_533614 ?auto_533615 ) ) ( not ( = ?auto_533614 ?auto_533616 ) ) ( not ( = ?auto_533614 ?auto_533617 ) ) ( not ( = ?auto_533615 ?auto_533616 ) ) ( not ( = ?auto_533615 ?auto_533617 ) ) ( not ( = ?auto_533616 ?auto_533617 ) ) ( ON ?auto_533615 ?auto_533616 ) ( ON ?auto_533614 ?auto_533615 ) ( ON ?auto_533613 ?auto_533614 ) ( ON ?auto_533612 ?auto_533613 ) ( ON ?auto_533611 ?auto_533612 ) ( ON ?auto_533610 ?auto_533611 ) ( ON ?auto_533609 ?auto_533610 ) ( ON ?auto_533608 ?auto_533609 ) ( ON ?auto_533607 ?auto_533608 ) ( ON ?auto_533606 ?auto_533607 ) ( CLEAR ?auto_533604 ) ( ON ?auto_533605 ?auto_533606 ) ( CLEAR ?auto_533605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_533601 ?auto_533602 ?auto_533603 ?auto_533604 ?auto_533605 )
      ( MAKE-16PILE ?auto_533601 ?auto_533602 ?auto_533603 ?auto_533604 ?auto_533605 ?auto_533606 ?auto_533607 ?auto_533608 ?auto_533609 ?auto_533610 ?auto_533611 ?auto_533612 ?auto_533613 ?auto_533614 ?auto_533615 ?auto_533616 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533634 - BLOCK
      ?auto_533635 - BLOCK
      ?auto_533636 - BLOCK
      ?auto_533637 - BLOCK
      ?auto_533638 - BLOCK
      ?auto_533639 - BLOCK
      ?auto_533640 - BLOCK
      ?auto_533641 - BLOCK
      ?auto_533642 - BLOCK
      ?auto_533643 - BLOCK
      ?auto_533644 - BLOCK
      ?auto_533645 - BLOCK
      ?auto_533646 - BLOCK
      ?auto_533647 - BLOCK
      ?auto_533648 - BLOCK
      ?auto_533649 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533649 ) ( ON-TABLE ?auto_533634 ) ( ON ?auto_533635 ?auto_533634 ) ( ON ?auto_533636 ?auto_533635 ) ( ON ?auto_533637 ?auto_533636 ) ( not ( = ?auto_533634 ?auto_533635 ) ) ( not ( = ?auto_533634 ?auto_533636 ) ) ( not ( = ?auto_533634 ?auto_533637 ) ) ( not ( = ?auto_533634 ?auto_533638 ) ) ( not ( = ?auto_533634 ?auto_533639 ) ) ( not ( = ?auto_533634 ?auto_533640 ) ) ( not ( = ?auto_533634 ?auto_533641 ) ) ( not ( = ?auto_533634 ?auto_533642 ) ) ( not ( = ?auto_533634 ?auto_533643 ) ) ( not ( = ?auto_533634 ?auto_533644 ) ) ( not ( = ?auto_533634 ?auto_533645 ) ) ( not ( = ?auto_533634 ?auto_533646 ) ) ( not ( = ?auto_533634 ?auto_533647 ) ) ( not ( = ?auto_533634 ?auto_533648 ) ) ( not ( = ?auto_533634 ?auto_533649 ) ) ( not ( = ?auto_533635 ?auto_533636 ) ) ( not ( = ?auto_533635 ?auto_533637 ) ) ( not ( = ?auto_533635 ?auto_533638 ) ) ( not ( = ?auto_533635 ?auto_533639 ) ) ( not ( = ?auto_533635 ?auto_533640 ) ) ( not ( = ?auto_533635 ?auto_533641 ) ) ( not ( = ?auto_533635 ?auto_533642 ) ) ( not ( = ?auto_533635 ?auto_533643 ) ) ( not ( = ?auto_533635 ?auto_533644 ) ) ( not ( = ?auto_533635 ?auto_533645 ) ) ( not ( = ?auto_533635 ?auto_533646 ) ) ( not ( = ?auto_533635 ?auto_533647 ) ) ( not ( = ?auto_533635 ?auto_533648 ) ) ( not ( = ?auto_533635 ?auto_533649 ) ) ( not ( = ?auto_533636 ?auto_533637 ) ) ( not ( = ?auto_533636 ?auto_533638 ) ) ( not ( = ?auto_533636 ?auto_533639 ) ) ( not ( = ?auto_533636 ?auto_533640 ) ) ( not ( = ?auto_533636 ?auto_533641 ) ) ( not ( = ?auto_533636 ?auto_533642 ) ) ( not ( = ?auto_533636 ?auto_533643 ) ) ( not ( = ?auto_533636 ?auto_533644 ) ) ( not ( = ?auto_533636 ?auto_533645 ) ) ( not ( = ?auto_533636 ?auto_533646 ) ) ( not ( = ?auto_533636 ?auto_533647 ) ) ( not ( = ?auto_533636 ?auto_533648 ) ) ( not ( = ?auto_533636 ?auto_533649 ) ) ( not ( = ?auto_533637 ?auto_533638 ) ) ( not ( = ?auto_533637 ?auto_533639 ) ) ( not ( = ?auto_533637 ?auto_533640 ) ) ( not ( = ?auto_533637 ?auto_533641 ) ) ( not ( = ?auto_533637 ?auto_533642 ) ) ( not ( = ?auto_533637 ?auto_533643 ) ) ( not ( = ?auto_533637 ?auto_533644 ) ) ( not ( = ?auto_533637 ?auto_533645 ) ) ( not ( = ?auto_533637 ?auto_533646 ) ) ( not ( = ?auto_533637 ?auto_533647 ) ) ( not ( = ?auto_533637 ?auto_533648 ) ) ( not ( = ?auto_533637 ?auto_533649 ) ) ( not ( = ?auto_533638 ?auto_533639 ) ) ( not ( = ?auto_533638 ?auto_533640 ) ) ( not ( = ?auto_533638 ?auto_533641 ) ) ( not ( = ?auto_533638 ?auto_533642 ) ) ( not ( = ?auto_533638 ?auto_533643 ) ) ( not ( = ?auto_533638 ?auto_533644 ) ) ( not ( = ?auto_533638 ?auto_533645 ) ) ( not ( = ?auto_533638 ?auto_533646 ) ) ( not ( = ?auto_533638 ?auto_533647 ) ) ( not ( = ?auto_533638 ?auto_533648 ) ) ( not ( = ?auto_533638 ?auto_533649 ) ) ( not ( = ?auto_533639 ?auto_533640 ) ) ( not ( = ?auto_533639 ?auto_533641 ) ) ( not ( = ?auto_533639 ?auto_533642 ) ) ( not ( = ?auto_533639 ?auto_533643 ) ) ( not ( = ?auto_533639 ?auto_533644 ) ) ( not ( = ?auto_533639 ?auto_533645 ) ) ( not ( = ?auto_533639 ?auto_533646 ) ) ( not ( = ?auto_533639 ?auto_533647 ) ) ( not ( = ?auto_533639 ?auto_533648 ) ) ( not ( = ?auto_533639 ?auto_533649 ) ) ( not ( = ?auto_533640 ?auto_533641 ) ) ( not ( = ?auto_533640 ?auto_533642 ) ) ( not ( = ?auto_533640 ?auto_533643 ) ) ( not ( = ?auto_533640 ?auto_533644 ) ) ( not ( = ?auto_533640 ?auto_533645 ) ) ( not ( = ?auto_533640 ?auto_533646 ) ) ( not ( = ?auto_533640 ?auto_533647 ) ) ( not ( = ?auto_533640 ?auto_533648 ) ) ( not ( = ?auto_533640 ?auto_533649 ) ) ( not ( = ?auto_533641 ?auto_533642 ) ) ( not ( = ?auto_533641 ?auto_533643 ) ) ( not ( = ?auto_533641 ?auto_533644 ) ) ( not ( = ?auto_533641 ?auto_533645 ) ) ( not ( = ?auto_533641 ?auto_533646 ) ) ( not ( = ?auto_533641 ?auto_533647 ) ) ( not ( = ?auto_533641 ?auto_533648 ) ) ( not ( = ?auto_533641 ?auto_533649 ) ) ( not ( = ?auto_533642 ?auto_533643 ) ) ( not ( = ?auto_533642 ?auto_533644 ) ) ( not ( = ?auto_533642 ?auto_533645 ) ) ( not ( = ?auto_533642 ?auto_533646 ) ) ( not ( = ?auto_533642 ?auto_533647 ) ) ( not ( = ?auto_533642 ?auto_533648 ) ) ( not ( = ?auto_533642 ?auto_533649 ) ) ( not ( = ?auto_533643 ?auto_533644 ) ) ( not ( = ?auto_533643 ?auto_533645 ) ) ( not ( = ?auto_533643 ?auto_533646 ) ) ( not ( = ?auto_533643 ?auto_533647 ) ) ( not ( = ?auto_533643 ?auto_533648 ) ) ( not ( = ?auto_533643 ?auto_533649 ) ) ( not ( = ?auto_533644 ?auto_533645 ) ) ( not ( = ?auto_533644 ?auto_533646 ) ) ( not ( = ?auto_533644 ?auto_533647 ) ) ( not ( = ?auto_533644 ?auto_533648 ) ) ( not ( = ?auto_533644 ?auto_533649 ) ) ( not ( = ?auto_533645 ?auto_533646 ) ) ( not ( = ?auto_533645 ?auto_533647 ) ) ( not ( = ?auto_533645 ?auto_533648 ) ) ( not ( = ?auto_533645 ?auto_533649 ) ) ( not ( = ?auto_533646 ?auto_533647 ) ) ( not ( = ?auto_533646 ?auto_533648 ) ) ( not ( = ?auto_533646 ?auto_533649 ) ) ( not ( = ?auto_533647 ?auto_533648 ) ) ( not ( = ?auto_533647 ?auto_533649 ) ) ( not ( = ?auto_533648 ?auto_533649 ) ) ( ON ?auto_533648 ?auto_533649 ) ( ON ?auto_533647 ?auto_533648 ) ( ON ?auto_533646 ?auto_533647 ) ( ON ?auto_533645 ?auto_533646 ) ( ON ?auto_533644 ?auto_533645 ) ( ON ?auto_533643 ?auto_533644 ) ( ON ?auto_533642 ?auto_533643 ) ( ON ?auto_533641 ?auto_533642 ) ( ON ?auto_533640 ?auto_533641 ) ( ON ?auto_533639 ?auto_533640 ) ( CLEAR ?auto_533637 ) ( ON ?auto_533638 ?auto_533639 ) ( CLEAR ?auto_533638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_533634 ?auto_533635 ?auto_533636 ?auto_533637 ?auto_533638 )
      ( MAKE-16PILE ?auto_533634 ?auto_533635 ?auto_533636 ?auto_533637 ?auto_533638 ?auto_533639 ?auto_533640 ?auto_533641 ?auto_533642 ?auto_533643 ?auto_533644 ?auto_533645 ?auto_533646 ?auto_533647 ?auto_533648 ?auto_533649 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533666 - BLOCK
      ?auto_533667 - BLOCK
      ?auto_533668 - BLOCK
      ?auto_533669 - BLOCK
      ?auto_533670 - BLOCK
      ?auto_533671 - BLOCK
      ?auto_533672 - BLOCK
      ?auto_533673 - BLOCK
      ?auto_533674 - BLOCK
      ?auto_533675 - BLOCK
      ?auto_533676 - BLOCK
      ?auto_533677 - BLOCK
      ?auto_533678 - BLOCK
      ?auto_533679 - BLOCK
      ?auto_533680 - BLOCK
      ?auto_533681 - BLOCK
    )
    :vars
    (
      ?auto_533682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533681 ?auto_533682 ) ( ON-TABLE ?auto_533666 ) ( ON ?auto_533667 ?auto_533666 ) ( ON ?auto_533668 ?auto_533667 ) ( not ( = ?auto_533666 ?auto_533667 ) ) ( not ( = ?auto_533666 ?auto_533668 ) ) ( not ( = ?auto_533666 ?auto_533669 ) ) ( not ( = ?auto_533666 ?auto_533670 ) ) ( not ( = ?auto_533666 ?auto_533671 ) ) ( not ( = ?auto_533666 ?auto_533672 ) ) ( not ( = ?auto_533666 ?auto_533673 ) ) ( not ( = ?auto_533666 ?auto_533674 ) ) ( not ( = ?auto_533666 ?auto_533675 ) ) ( not ( = ?auto_533666 ?auto_533676 ) ) ( not ( = ?auto_533666 ?auto_533677 ) ) ( not ( = ?auto_533666 ?auto_533678 ) ) ( not ( = ?auto_533666 ?auto_533679 ) ) ( not ( = ?auto_533666 ?auto_533680 ) ) ( not ( = ?auto_533666 ?auto_533681 ) ) ( not ( = ?auto_533666 ?auto_533682 ) ) ( not ( = ?auto_533667 ?auto_533668 ) ) ( not ( = ?auto_533667 ?auto_533669 ) ) ( not ( = ?auto_533667 ?auto_533670 ) ) ( not ( = ?auto_533667 ?auto_533671 ) ) ( not ( = ?auto_533667 ?auto_533672 ) ) ( not ( = ?auto_533667 ?auto_533673 ) ) ( not ( = ?auto_533667 ?auto_533674 ) ) ( not ( = ?auto_533667 ?auto_533675 ) ) ( not ( = ?auto_533667 ?auto_533676 ) ) ( not ( = ?auto_533667 ?auto_533677 ) ) ( not ( = ?auto_533667 ?auto_533678 ) ) ( not ( = ?auto_533667 ?auto_533679 ) ) ( not ( = ?auto_533667 ?auto_533680 ) ) ( not ( = ?auto_533667 ?auto_533681 ) ) ( not ( = ?auto_533667 ?auto_533682 ) ) ( not ( = ?auto_533668 ?auto_533669 ) ) ( not ( = ?auto_533668 ?auto_533670 ) ) ( not ( = ?auto_533668 ?auto_533671 ) ) ( not ( = ?auto_533668 ?auto_533672 ) ) ( not ( = ?auto_533668 ?auto_533673 ) ) ( not ( = ?auto_533668 ?auto_533674 ) ) ( not ( = ?auto_533668 ?auto_533675 ) ) ( not ( = ?auto_533668 ?auto_533676 ) ) ( not ( = ?auto_533668 ?auto_533677 ) ) ( not ( = ?auto_533668 ?auto_533678 ) ) ( not ( = ?auto_533668 ?auto_533679 ) ) ( not ( = ?auto_533668 ?auto_533680 ) ) ( not ( = ?auto_533668 ?auto_533681 ) ) ( not ( = ?auto_533668 ?auto_533682 ) ) ( not ( = ?auto_533669 ?auto_533670 ) ) ( not ( = ?auto_533669 ?auto_533671 ) ) ( not ( = ?auto_533669 ?auto_533672 ) ) ( not ( = ?auto_533669 ?auto_533673 ) ) ( not ( = ?auto_533669 ?auto_533674 ) ) ( not ( = ?auto_533669 ?auto_533675 ) ) ( not ( = ?auto_533669 ?auto_533676 ) ) ( not ( = ?auto_533669 ?auto_533677 ) ) ( not ( = ?auto_533669 ?auto_533678 ) ) ( not ( = ?auto_533669 ?auto_533679 ) ) ( not ( = ?auto_533669 ?auto_533680 ) ) ( not ( = ?auto_533669 ?auto_533681 ) ) ( not ( = ?auto_533669 ?auto_533682 ) ) ( not ( = ?auto_533670 ?auto_533671 ) ) ( not ( = ?auto_533670 ?auto_533672 ) ) ( not ( = ?auto_533670 ?auto_533673 ) ) ( not ( = ?auto_533670 ?auto_533674 ) ) ( not ( = ?auto_533670 ?auto_533675 ) ) ( not ( = ?auto_533670 ?auto_533676 ) ) ( not ( = ?auto_533670 ?auto_533677 ) ) ( not ( = ?auto_533670 ?auto_533678 ) ) ( not ( = ?auto_533670 ?auto_533679 ) ) ( not ( = ?auto_533670 ?auto_533680 ) ) ( not ( = ?auto_533670 ?auto_533681 ) ) ( not ( = ?auto_533670 ?auto_533682 ) ) ( not ( = ?auto_533671 ?auto_533672 ) ) ( not ( = ?auto_533671 ?auto_533673 ) ) ( not ( = ?auto_533671 ?auto_533674 ) ) ( not ( = ?auto_533671 ?auto_533675 ) ) ( not ( = ?auto_533671 ?auto_533676 ) ) ( not ( = ?auto_533671 ?auto_533677 ) ) ( not ( = ?auto_533671 ?auto_533678 ) ) ( not ( = ?auto_533671 ?auto_533679 ) ) ( not ( = ?auto_533671 ?auto_533680 ) ) ( not ( = ?auto_533671 ?auto_533681 ) ) ( not ( = ?auto_533671 ?auto_533682 ) ) ( not ( = ?auto_533672 ?auto_533673 ) ) ( not ( = ?auto_533672 ?auto_533674 ) ) ( not ( = ?auto_533672 ?auto_533675 ) ) ( not ( = ?auto_533672 ?auto_533676 ) ) ( not ( = ?auto_533672 ?auto_533677 ) ) ( not ( = ?auto_533672 ?auto_533678 ) ) ( not ( = ?auto_533672 ?auto_533679 ) ) ( not ( = ?auto_533672 ?auto_533680 ) ) ( not ( = ?auto_533672 ?auto_533681 ) ) ( not ( = ?auto_533672 ?auto_533682 ) ) ( not ( = ?auto_533673 ?auto_533674 ) ) ( not ( = ?auto_533673 ?auto_533675 ) ) ( not ( = ?auto_533673 ?auto_533676 ) ) ( not ( = ?auto_533673 ?auto_533677 ) ) ( not ( = ?auto_533673 ?auto_533678 ) ) ( not ( = ?auto_533673 ?auto_533679 ) ) ( not ( = ?auto_533673 ?auto_533680 ) ) ( not ( = ?auto_533673 ?auto_533681 ) ) ( not ( = ?auto_533673 ?auto_533682 ) ) ( not ( = ?auto_533674 ?auto_533675 ) ) ( not ( = ?auto_533674 ?auto_533676 ) ) ( not ( = ?auto_533674 ?auto_533677 ) ) ( not ( = ?auto_533674 ?auto_533678 ) ) ( not ( = ?auto_533674 ?auto_533679 ) ) ( not ( = ?auto_533674 ?auto_533680 ) ) ( not ( = ?auto_533674 ?auto_533681 ) ) ( not ( = ?auto_533674 ?auto_533682 ) ) ( not ( = ?auto_533675 ?auto_533676 ) ) ( not ( = ?auto_533675 ?auto_533677 ) ) ( not ( = ?auto_533675 ?auto_533678 ) ) ( not ( = ?auto_533675 ?auto_533679 ) ) ( not ( = ?auto_533675 ?auto_533680 ) ) ( not ( = ?auto_533675 ?auto_533681 ) ) ( not ( = ?auto_533675 ?auto_533682 ) ) ( not ( = ?auto_533676 ?auto_533677 ) ) ( not ( = ?auto_533676 ?auto_533678 ) ) ( not ( = ?auto_533676 ?auto_533679 ) ) ( not ( = ?auto_533676 ?auto_533680 ) ) ( not ( = ?auto_533676 ?auto_533681 ) ) ( not ( = ?auto_533676 ?auto_533682 ) ) ( not ( = ?auto_533677 ?auto_533678 ) ) ( not ( = ?auto_533677 ?auto_533679 ) ) ( not ( = ?auto_533677 ?auto_533680 ) ) ( not ( = ?auto_533677 ?auto_533681 ) ) ( not ( = ?auto_533677 ?auto_533682 ) ) ( not ( = ?auto_533678 ?auto_533679 ) ) ( not ( = ?auto_533678 ?auto_533680 ) ) ( not ( = ?auto_533678 ?auto_533681 ) ) ( not ( = ?auto_533678 ?auto_533682 ) ) ( not ( = ?auto_533679 ?auto_533680 ) ) ( not ( = ?auto_533679 ?auto_533681 ) ) ( not ( = ?auto_533679 ?auto_533682 ) ) ( not ( = ?auto_533680 ?auto_533681 ) ) ( not ( = ?auto_533680 ?auto_533682 ) ) ( not ( = ?auto_533681 ?auto_533682 ) ) ( ON ?auto_533680 ?auto_533681 ) ( ON ?auto_533679 ?auto_533680 ) ( ON ?auto_533678 ?auto_533679 ) ( ON ?auto_533677 ?auto_533678 ) ( ON ?auto_533676 ?auto_533677 ) ( ON ?auto_533675 ?auto_533676 ) ( ON ?auto_533674 ?auto_533675 ) ( ON ?auto_533673 ?auto_533674 ) ( ON ?auto_533672 ?auto_533673 ) ( ON ?auto_533671 ?auto_533672 ) ( ON ?auto_533670 ?auto_533671 ) ( CLEAR ?auto_533668 ) ( ON ?auto_533669 ?auto_533670 ) ( CLEAR ?auto_533669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_533666 ?auto_533667 ?auto_533668 ?auto_533669 )
      ( MAKE-16PILE ?auto_533666 ?auto_533667 ?auto_533668 ?auto_533669 ?auto_533670 ?auto_533671 ?auto_533672 ?auto_533673 ?auto_533674 ?auto_533675 ?auto_533676 ?auto_533677 ?auto_533678 ?auto_533679 ?auto_533680 ?auto_533681 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533699 - BLOCK
      ?auto_533700 - BLOCK
      ?auto_533701 - BLOCK
      ?auto_533702 - BLOCK
      ?auto_533703 - BLOCK
      ?auto_533704 - BLOCK
      ?auto_533705 - BLOCK
      ?auto_533706 - BLOCK
      ?auto_533707 - BLOCK
      ?auto_533708 - BLOCK
      ?auto_533709 - BLOCK
      ?auto_533710 - BLOCK
      ?auto_533711 - BLOCK
      ?auto_533712 - BLOCK
      ?auto_533713 - BLOCK
      ?auto_533714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533714 ) ( ON-TABLE ?auto_533699 ) ( ON ?auto_533700 ?auto_533699 ) ( ON ?auto_533701 ?auto_533700 ) ( not ( = ?auto_533699 ?auto_533700 ) ) ( not ( = ?auto_533699 ?auto_533701 ) ) ( not ( = ?auto_533699 ?auto_533702 ) ) ( not ( = ?auto_533699 ?auto_533703 ) ) ( not ( = ?auto_533699 ?auto_533704 ) ) ( not ( = ?auto_533699 ?auto_533705 ) ) ( not ( = ?auto_533699 ?auto_533706 ) ) ( not ( = ?auto_533699 ?auto_533707 ) ) ( not ( = ?auto_533699 ?auto_533708 ) ) ( not ( = ?auto_533699 ?auto_533709 ) ) ( not ( = ?auto_533699 ?auto_533710 ) ) ( not ( = ?auto_533699 ?auto_533711 ) ) ( not ( = ?auto_533699 ?auto_533712 ) ) ( not ( = ?auto_533699 ?auto_533713 ) ) ( not ( = ?auto_533699 ?auto_533714 ) ) ( not ( = ?auto_533700 ?auto_533701 ) ) ( not ( = ?auto_533700 ?auto_533702 ) ) ( not ( = ?auto_533700 ?auto_533703 ) ) ( not ( = ?auto_533700 ?auto_533704 ) ) ( not ( = ?auto_533700 ?auto_533705 ) ) ( not ( = ?auto_533700 ?auto_533706 ) ) ( not ( = ?auto_533700 ?auto_533707 ) ) ( not ( = ?auto_533700 ?auto_533708 ) ) ( not ( = ?auto_533700 ?auto_533709 ) ) ( not ( = ?auto_533700 ?auto_533710 ) ) ( not ( = ?auto_533700 ?auto_533711 ) ) ( not ( = ?auto_533700 ?auto_533712 ) ) ( not ( = ?auto_533700 ?auto_533713 ) ) ( not ( = ?auto_533700 ?auto_533714 ) ) ( not ( = ?auto_533701 ?auto_533702 ) ) ( not ( = ?auto_533701 ?auto_533703 ) ) ( not ( = ?auto_533701 ?auto_533704 ) ) ( not ( = ?auto_533701 ?auto_533705 ) ) ( not ( = ?auto_533701 ?auto_533706 ) ) ( not ( = ?auto_533701 ?auto_533707 ) ) ( not ( = ?auto_533701 ?auto_533708 ) ) ( not ( = ?auto_533701 ?auto_533709 ) ) ( not ( = ?auto_533701 ?auto_533710 ) ) ( not ( = ?auto_533701 ?auto_533711 ) ) ( not ( = ?auto_533701 ?auto_533712 ) ) ( not ( = ?auto_533701 ?auto_533713 ) ) ( not ( = ?auto_533701 ?auto_533714 ) ) ( not ( = ?auto_533702 ?auto_533703 ) ) ( not ( = ?auto_533702 ?auto_533704 ) ) ( not ( = ?auto_533702 ?auto_533705 ) ) ( not ( = ?auto_533702 ?auto_533706 ) ) ( not ( = ?auto_533702 ?auto_533707 ) ) ( not ( = ?auto_533702 ?auto_533708 ) ) ( not ( = ?auto_533702 ?auto_533709 ) ) ( not ( = ?auto_533702 ?auto_533710 ) ) ( not ( = ?auto_533702 ?auto_533711 ) ) ( not ( = ?auto_533702 ?auto_533712 ) ) ( not ( = ?auto_533702 ?auto_533713 ) ) ( not ( = ?auto_533702 ?auto_533714 ) ) ( not ( = ?auto_533703 ?auto_533704 ) ) ( not ( = ?auto_533703 ?auto_533705 ) ) ( not ( = ?auto_533703 ?auto_533706 ) ) ( not ( = ?auto_533703 ?auto_533707 ) ) ( not ( = ?auto_533703 ?auto_533708 ) ) ( not ( = ?auto_533703 ?auto_533709 ) ) ( not ( = ?auto_533703 ?auto_533710 ) ) ( not ( = ?auto_533703 ?auto_533711 ) ) ( not ( = ?auto_533703 ?auto_533712 ) ) ( not ( = ?auto_533703 ?auto_533713 ) ) ( not ( = ?auto_533703 ?auto_533714 ) ) ( not ( = ?auto_533704 ?auto_533705 ) ) ( not ( = ?auto_533704 ?auto_533706 ) ) ( not ( = ?auto_533704 ?auto_533707 ) ) ( not ( = ?auto_533704 ?auto_533708 ) ) ( not ( = ?auto_533704 ?auto_533709 ) ) ( not ( = ?auto_533704 ?auto_533710 ) ) ( not ( = ?auto_533704 ?auto_533711 ) ) ( not ( = ?auto_533704 ?auto_533712 ) ) ( not ( = ?auto_533704 ?auto_533713 ) ) ( not ( = ?auto_533704 ?auto_533714 ) ) ( not ( = ?auto_533705 ?auto_533706 ) ) ( not ( = ?auto_533705 ?auto_533707 ) ) ( not ( = ?auto_533705 ?auto_533708 ) ) ( not ( = ?auto_533705 ?auto_533709 ) ) ( not ( = ?auto_533705 ?auto_533710 ) ) ( not ( = ?auto_533705 ?auto_533711 ) ) ( not ( = ?auto_533705 ?auto_533712 ) ) ( not ( = ?auto_533705 ?auto_533713 ) ) ( not ( = ?auto_533705 ?auto_533714 ) ) ( not ( = ?auto_533706 ?auto_533707 ) ) ( not ( = ?auto_533706 ?auto_533708 ) ) ( not ( = ?auto_533706 ?auto_533709 ) ) ( not ( = ?auto_533706 ?auto_533710 ) ) ( not ( = ?auto_533706 ?auto_533711 ) ) ( not ( = ?auto_533706 ?auto_533712 ) ) ( not ( = ?auto_533706 ?auto_533713 ) ) ( not ( = ?auto_533706 ?auto_533714 ) ) ( not ( = ?auto_533707 ?auto_533708 ) ) ( not ( = ?auto_533707 ?auto_533709 ) ) ( not ( = ?auto_533707 ?auto_533710 ) ) ( not ( = ?auto_533707 ?auto_533711 ) ) ( not ( = ?auto_533707 ?auto_533712 ) ) ( not ( = ?auto_533707 ?auto_533713 ) ) ( not ( = ?auto_533707 ?auto_533714 ) ) ( not ( = ?auto_533708 ?auto_533709 ) ) ( not ( = ?auto_533708 ?auto_533710 ) ) ( not ( = ?auto_533708 ?auto_533711 ) ) ( not ( = ?auto_533708 ?auto_533712 ) ) ( not ( = ?auto_533708 ?auto_533713 ) ) ( not ( = ?auto_533708 ?auto_533714 ) ) ( not ( = ?auto_533709 ?auto_533710 ) ) ( not ( = ?auto_533709 ?auto_533711 ) ) ( not ( = ?auto_533709 ?auto_533712 ) ) ( not ( = ?auto_533709 ?auto_533713 ) ) ( not ( = ?auto_533709 ?auto_533714 ) ) ( not ( = ?auto_533710 ?auto_533711 ) ) ( not ( = ?auto_533710 ?auto_533712 ) ) ( not ( = ?auto_533710 ?auto_533713 ) ) ( not ( = ?auto_533710 ?auto_533714 ) ) ( not ( = ?auto_533711 ?auto_533712 ) ) ( not ( = ?auto_533711 ?auto_533713 ) ) ( not ( = ?auto_533711 ?auto_533714 ) ) ( not ( = ?auto_533712 ?auto_533713 ) ) ( not ( = ?auto_533712 ?auto_533714 ) ) ( not ( = ?auto_533713 ?auto_533714 ) ) ( ON ?auto_533713 ?auto_533714 ) ( ON ?auto_533712 ?auto_533713 ) ( ON ?auto_533711 ?auto_533712 ) ( ON ?auto_533710 ?auto_533711 ) ( ON ?auto_533709 ?auto_533710 ) ( ON ?auto_533708 ?auto_533709 ) ( ON ?auto_533707 ?auto_533708 ) ( ON ?auto_533706 ?auto_533707 ) ( ON ?auto_533705 ?auto_533706 ) ( ON ?auto_533704 ?auto_533705 ) ( ON ?auto_533703 ?auto_533704 ) ( CLEAR ?auto_533701 ) ( ON ?auto_533702 ?auto_533703 ) ( CLEAR ?auto_533702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_533699 ?auto_533700 ?auto_533701 ?auto_533702 )
      ( MAKE-16PILE ?auto_533699 ?auto_533700 ?auto_533701 ?auto_533702 ?auto_533703 ?auto_533704 ?auto_533705 ?auto_533706 ?auto_533707 ?auto_533708 ?auto_533709 ?auto_533710 ?auto_533711 ?auto_533712 ?auto_533713 ?auto_533714 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533731 - BLOCK
      ?auto_533732 - BLOCK
      ?auto_533733 - BLOCK
      ?auto_533734 - BLOCK
      ?auto_533735 - BLOCK
      ?auto_533736 - BLOCK
      ?auto_533737 - BLOCK
      ?auto_533738 - BLOCK
      ?auto_533739 - BLOCK
      ?auto_533740 - BLOCK
      ?auto_533741 - BLOCK
      ?auto_533742 - BLOCK
      ?auto_533743 - BLOCK
      ?auto_533744 - BLOCK
      ?auto_533745 - BLOCK
      ?auto_533746 - BLOCK
    )
    :vars
    (
      ?auto_533747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533746 ?auto_533747 ) ( ON-TABLE ?auto_533731 ) ( ON ?auto_533732 ?auto_533731 ) ( not ( = ?auto_533731 ?auto_533732 ) ) ( not ( = ?auto_533731 ?auto_533733 ) ) ( not ( = ?auto_533731 ?auto_533734 ) ) ( not ( = ?auto_533731 ?auto_533735 ) ) ( not ( = ?auto_533731 ?auto_533736 ) ) ( not ( = ?auto_533731 ?auto_533737 ) ) ( not ( = ?auto_533731 ?auto_533738 ) ) ( not ( = ?auto_533731 ?auto_533739 ) ) ( not ( = ?auto_533731 ?auto_533740 ) ) ( not ( = ?auto_533731 ?auto_533741 ) ) ( not ( = ?auto_533731 ?auto_533742 ) ) ( not ( = ?auto_533731 ?auto_533743 ) ) ( not ( = ?auto_533731 ?auto_533744 ) ) ( not ( = ?auto_533731 ?auto_533745 ) ) ( not ( = ?auto_533731 ?auto_533746 ) ) ( not ( = ?auto_533731 ?auto_533747 ) ) ( not ( = ?auto_533732 ?auto_533733 ) ) ( not ( = ?auto_533732 ?auto_533734 ) ) ( not ( = ?auto_533732 ?auto_533735 ) ) ( not ( = ?auto_533732 ?auto_533736 ) ) ( not ( = ?auto_533732 ?auto_533737 ) ) ( not ( = ?auto_533732 ?auto_533738 ) ) ( not ( = ?auto_533732 ?auto_533739 ) ) ( not ( = ?auto_533732 ?auto_533740 ) ) ( not ( = ?auto_533732 ?auto_533741 ) ) ( not ( = ?auto_533732 ?auto_533742 ) ) ( not ( = ?auto_533732 ?auto_533743 ) ) ( not ( = ?auto_533732 ?auto_533744 ) ) ( not ( = ?auto_533732 ?auto_533745 ) ) ( not ( = ?auto_533732 ?auto_533746 ) ) ( not ( = ?auto_533732 ?auto_533747 ) ) ( not ( = ?auto_533733 ?auto_533734 ) ) ( not ( = ?auto_533733 ?auto_533735 ) ) ( not ( = ?auto_533733 ?auto_533736 ) ) ( not ( = ?auto_533733 ?auto_533737 ) ) ( not ( = ?auto_533733 ?auto_533738 ) ) ( not ( = ?auto_533733 ?auto_533739 ) ) ( not ( = ?auto_533733 ?auto_533740 ) ) ( not ( = ?auto_533733 ?auto_533741 ) ) ( not ( = ?auto_533733 ?auto_533742 ) ) ( not ( = ?auto_533733 ?auto_533743 ) ) ( not ( = ?auto_533733 ?auto_533744 ) ) ( not ( = ?auto_533733 ?auto_533745 ) ) ( not ( = ?auto_533733 ?auto_533746 ) ) ( not ( = ?auto_533733 ?auto_533747 ) ) ( not ( = ?auto_533734 ?auto_533735 ) ) ( not ( = ?auto_533734 ?auto_533736 ) ) ( not ( = ?auto_533734 ?auto_533737 ) ) ( not ( = ?auto_533734 ?auto_533738 ) ) ( not ( = ?auto_533734 ?auto_533739 ) ) ( not ( = ?auto_533734 ?auto_533740 ) ) ( not ( = ?auto_533734 ?auto_533741 ) ) ( not ( = ?auto_533734 ?auto_533742 ) ) ( not ( = ?auto_533734 ?auto_533743 ) ) ( not ( = ?auto_533734 ?auto_533744 ) ) ( not ( = ?auto_533734 ?auto_533745 ) ) ( not ( = ?auto_533734 ?auto_533746 ) ) ( not ( = ?auto_533734 ?auto_533747 ) ) ( not ( = ?auto_533735 ?auto_533736 ) ) ( not ( = ?auto_533735 ?auto_533737 ) ) ( not ( = ?auto_533735 ?auto_533738 ) ) ( not ( = ?auto_533735 ?auto_533739 ) ) ( not ( = ?auto_533735 ?auto_533740 ) ) ( not ( = ?auto_533735 ?auto_533741 ) ) ( not ( = ?auto_533735 ?auto_533742 ) ) ( not ( = ?auto_533735 ?auto_533743 ) ) ( not ( = ?auto_533735 ?auto_533744 ) ) ( not ( = ?auto_533735 ?auto_533745 ) ) ( not ( = ?auto_533735 ?auto_533746 ) ) ( not ( = ?auto_533735 ?auto_533747 ) ) ( not ( = ?auto_533736 ?auto_533737 ) ) ( not ( = ?auto_533736 ?auto_533738 ) ) ( not ( = ?auto_533736 ?auto_533739 ) ) ( not ( = ?auto_533736 ?auto_533740 ) ) ( not ( = ?auto_533736 ?auto_533741 ) ) ( not ( = ?auto_533736 ?auto_533742 ) ) ( not ( = ?auto_533736 ?auto_533743 ) ) ( not ( = ?auto_533736 ?auto_533744 ) ) ( not ( = ?auto_533736 ?auto_533745 ) ) ( not ( = ?auto_533736 ?auto_533746 ) ) ( not ( = ?auto_533736 ?auto_533747 ) ) ( not ( = ?auto_533737 ?auto_533738 ) ) ( not ( = ?auto_533737 ?auto_533739 ) ) ( not ( = ?auto_533737 ?auto_533740 ) ) ( not ( = ?auto_533737 ?auto_533741 ) ) ( not ( = ?auto_533737 ?auto_533742 ) ) ( not ( = ?auto_533737 ?auto_533743 ) ) ( not ( = ?auto_533737 ?auto_533744 ) ) ( not ( = ?auto_533737 ?auto_533745 ) ) ( not ( = ?auto_533737 ?auto_533746 ) ) ( not ( = ?auto_533737 ?auto_533747 ) ) ( not ( = ?auto_533738 ?auto_533739 ) ) ( not ( = ?auto_533738 ?auto_533740 ) ) ( not ( = ?auto_533738 ?auto_533741 ) ) ( not ( = ?auto_533738 ?auto_533742 ) ) ( not ( = ?auto_533738 ?auto_533743 ) ) ( not ( = ?auto_533738 ?auto_533744 ) ) ( not ( = ?auto_533738 ?auto_533745 ) ) ( not ( = ?auto_533738 ?auto_533746 ) ) ( not ( = ?auto_533738 ?auto_533747 ) ) ( not ( = ?auto_533739 ?auto_533740 ) ) ( not ( = ?auto_533739 ?auto_533741 ) ) ( not ( = ?auto_533739 ?auto_533742 ) ) ( not ( = ?auto_533739 ?auto_533743 ) ) ( not ( = ?auto_533739 ?auto_533744 ) ) ( not ( = ?auto_533739 ?auto_533745 ) ) ( not ( = ?auto_533739 ?auto_533746 ) ) ( not ( = ?auto_533739 ?auto_533747 ) ) ( not ( = ?auto_533740 ?auto_533741 ) ) ( not ( = ?auto_533740 ?auto_533742 ) ) ( not ( = ?auto_533740 ?auto_533743 ) ) ( not ( = ?auto_533740 ?auto_533744 ) ) ( not ( = ?auto_533740 ?auto_533745 ) ) ( not ( = ?auto_533740 ?auto_533746 ) ) ( not ( = ?auto_533740 ?auto_533747 ) ) ( not ( = ?auto_533741 ?auto_533742 ) ) ( not ( = ?auto_533741 ?auto_533743 ) ) ( not ( = ?auto_533741 ?auto_533744 ) ) ( not ( = ?auto_533741 ?auto_533745 ) ) ( not ( = ?auto_533741 ?auto_533746 ) ) ( not ( = ?auto_533741 ?auto_533747 ) ) ( not ( = ?auto_533742 ?auto_533743 ) ) ( not ( = ?auto_533742 ?auto_533744 ) ) ( not ( = ?auto_533742 ?auto_533745 ) ) ( not ( = ?auto_533742 ?auto_533746 ) ) ( not ( = ?auto_533742 ?auto_533747 ) ) ( not ( = ?auto_533743 ?auto_533744 ) ) ( not ( = ?auto_533743 ?auto_533745 ) ) ( not ( = ?auto_533743 ?auto_533746 ) ) ( not ( = ?auto_533743 ?auto_533747 ) ) ( not ( = ?auto_533744 ?auto_533745 ) ) ( not ( = ?auto_533744 ?auto_533746 ) ) ( not ( = ?auto_533744 ?auto_533747 ) ) ( not ( = ?auto_533745 ?auto_533746 ) ) ( not ( = ?auto_533745 ?auto_533747 ) ) ( not ( = ?auto_533746 ?auto_533747 ) ) ( ON ?auto_533745 ?auto_533746 ) ( ON ?auto_533744 ?auto_533745 ) ( ON ?auto_533743 ?auto_533744 ) ( ON ?auto_533742 ?auto_533743 ) ( ON ?auto_533741 ?auto_533742 ) ( ON ?auto_533740 ?auto_533741 ) ( ON ?auto_533739 ?auto_533740 ) ( ON ?auto_533738 ?auto_533739 ) ( ON ?auto_533737 ?auto_533738 ) ( ON ?auto_533736 ?auto_533737 ) ( ON ?auto_533735 ?auto_533736 ) ( ON ?auto_533734 ?auto_533735 ) ( CLEAR ?auto_533732 ) ( ON ?auto_533733 ?auto_533734 ) ( CLEAR ?auto_533733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_533731 ?auto_533732 ?auto_533733 )
      ( MAKE-16PILE ?auto_533731 ?auto_533732 ?auto_533733 ?auto_533734 ?auto_533735 ?auto_533736 ?auto_533737 ?auto_533738 ?auto_533739 ?auto_533740 ?auto_533741 ?auto_533742 ?auto_533743 ?auto_533744 ?auto_533745 ?auto_533746 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533764 - BLOCK
      ?auto_533765 - BLOCK
      ?auto_533766 - BLOCK
      ?auto_533767 - BLOCK
      ?auto_533768 - BLOCK
      ?auto_533769 - BLOCK
      ?auto_533770 - BLOCK
      ?auto_533771 - BLOCK
      ?auto_533772 - BLOCK
      ?auto_533773 - BLOCK
      ?auto_533774 - BLOCK
      ?auto_533775 - BLOCK
      ?auto_533776 - BLOCK
      ?auto_533777 - BLOCK
      ?auto_533778 - BLOCK
      ?auto_533779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533779 ) ( ON-TABLE ?auto_533764 ) ( ON ?auto_533765 ?auto_533764 ) ( not ( = ?auto_533764 ?auto_533765 ) ) ( not ( = ?auto_533764 ?auto_533766 ) ) ( not ( = ?auto_533764 ?auto_533767 ) ) ( not ( = ?auto_533764 ?auto_533768 ) ) ( not ( = ?auto_533764 ?auto_533769 ) ) ( not ( = ?auto_533764 ?auto_533770 ) ) ( not ( = ?auto_533764 ?auto_533771 ) ) ( not ( = ?auto_533764 ?auto_533772 ) ) ( not ( = ?auto_533764 ?auto_533773 ) ) ( not ( = ?auto_533764 ?auto_533774 ) ) ( not ( = ?auto_533764 ?auto_533775 ) ) ( not ( = ?auto_533764 ?auto_533776 ) ) ( not ( = ?auto_533764 ?auto_533777 ) ) ( not ( = ?auto_533764 ?auto_533778 ) ) ( not ( = ?auto_533764 ?auto_533779 ) ) ( not ( = ?auto_533765 ?auto_533766 ) ) ( not ( = ?auto_533765 ?auto_533767 ) ) ( not ( = ?auto_533765 ?auto_533768 ) ) ( not ( = ?auto_533765 ?auto_533769 ) ) ( not ( = ?auto_533765 ?auto_533770 ) ) ( not ( = ?auto_533765 ?auto_533771 ) ) ( not ( = ?auto_533765 ?auto_533772 ) ) ( not ( = ?auto_533765 ?auto_533773 ) ) ( not ( = ?auto_533765 ?auto_533774 ) ) ( not ( = ?auto_533765 ?auto_533775 ) ) ( not ( = ?auto_533765 ?auto_533776 ) ) ( not ( = ?auto_533765 ?auto_533777 ) ) ( not ( = ?auto_533765 ?auto_533778 ) ) ( not ( = ?auto_533765 ?auto_533779 ) ) ( not ( = ?auto_533766 ?auto_533767 ) ) ( not ( = ?auto_533766 ?auto_533768 ) ) ( not ( = ?auto_533766 ?auto_533769 ) ) ( not ( = ?auto_533766 ?auto_533770 ) ) ( not ( = ?auto_533766 ?auto_533771 ) ) ( not ( = ?auto_533766 ?auto_533772 ) ) ( not ( = ?auto_533766 ?auto_533773 ) ) ( not ( = ?auto_533766 ?auto_533774 ) ) ( not ( = ?auto_533766 ?auto_533775 ) ) ( not ( = ?auto_533766 ?auto_533776 ) ) ( not ( = ?auto_533766 ?auto_533777 ) ) ( not ( = ?auto_533766 ?auto_533778 ) ) ( not ( = ?auto_533766 ?auto_533779 ) ) ( not ( = ?auto_533767 ?auto_533768 ) ) ( not ( = ?auto_533767 ?auto_533769 ) ) ( not ( = ?auto_533767 ?auto_533770 ) ) ( not ( = ?auto_533767 ?auto_533771 ) ) ( not ( = ?auto_533767 ?auto_533772 ) ) ( not ( = ?auto_533767 ?auto_533773 ) ) ( not ( = ?auto_533767 ?auto_533774 ) ) ( not ( = ?auto_533767 ?auto_533775 ) ) ( not ( = ?auto_533767 ?auto_533776 ) ) ( not ( = ?auto_533767 ?auto_533777 ) ) ( not ( = ?auto_533767 ?auto_533778 ) ) ( not ( = ?auto_533767 ?auto_533779 ) ) ( not ( = ?auto_533768 ?auto_533769 ) ) ( not ( = ?auto_533768 ?auto_533770 ) ) ( not ( = ?auto_533768 ?auto_533771 ) ) ( not ( = ?auto_533768 ?auto_533772 ) ) ( not ( = ?auto_533768 ?auto_533773 ) ) ( not ( = ?auto_533768 ?auto_533774 ) ) ( not ( = ?auto_533768 ?auto_533775 ) ) ( not ( = ?auto_533768 ?auto_533776 ) ) ( not ( = ?auto_533768 ?auto_533777 ) ) ( not ( = ?auto_533768 ?auto_533778 ) ) ( not ( = ?auto_533768 ?auto_533779 ) ) ( not ( = ?auto_533769 ?auto_533770 ) ) ( not ( = ?auto_533769 ?auto_533771 ) ) ( not ( = ?auto_533769 ?auto_533772 ) ) ( not ( = ?auto_533769 ?auto_533773 ) ) ( not ( = ?auto_533769 ?auto_533774 ) ) ( not ( = ?auto_533769 ?auto_533775 ) ) ( not ( = ?auto_533769 ?auto_533776 ) ) ( not ( = ?auto_533769 ?auto_533777 ) ) ( not ( = ?auto_533769 ?auto_533778 ) ) ( not ( = ?auto_533769 ?auto_533779 ) ) ( not ( = ?auto_533770 ?auto_533771 ) ) ( not ( = ?auto_533770 ?auto_533772 ) ) ( not ( = ?auto_533770 ?auto_533773 ) ) ( not ( = ?auto_533770 ?auto_533774 ) ) ( not ( = ?auto_533770 ?auto_533775 ) ) ( not ( = ?auto_533770 ?auto_533776 ) ) ( not ( = ?auto_533770 ?auto_533777 ) ) ( not ( = ?auto_533770 ?auto_533778 ) ) ( not ( = ?auto_533770 ?auto_533779 ) ) ( not ( = ?auto_533771 ?auto_533772 ) ) ( not ( = ?auto_533771 ?auto_533773 ) ) ( not ( = ?auto_533771 ?auto_533774 ) ) ( not ( = ?auto_533771 ?auto_533775 ) ) ( not ( = ?auto_533771 ?auto_533776 ) ) ( not ( = ?auto_533771 ?auto_533777 ) ) ( not ( = ?auto_533771 ?auto_533778 ) ) ( not ( = ?auto_533771 ?auto_533779 ) ) ( not ( = ?auto_533772 ?auto_533773 ) ) ( not ( = ?auto_533772 ?auto_533774 ) ) ( not ( = ?auto_533772 ?auto_533775 ) ) ( not ( = ?auto_533772 ?auto_533776 ) ) ( not ( = ?auto_533772 ?auto_533777 ) ) ( not ( = ?auto_533772 ?auto_533778 ) ) ( not ( = ?auto_533772 ?auto_533779 ) ) ( not ( = ?auto_533773 ?auto_533774 ) ) ( not ( = ?auto_533773 ?auto_533775 ) ) ( not ( = ?auto_533773 ?auto_533776 ) ) ( not ( = ?auto_533773 ?auto_533777 ) ) ( not ( = ?auto_533773 ?auto_533778 ) ) ( not ( = ?auto_533773 ?auto_533779 ) ) ( not ( = ?auto_533774 ?auto_533775 ) ) ( not ( = ?auto_533774 ?auto_533776 ) ) ( not ( = ?auto_533774 ?auto_533777 ) ) ( not ( = ?auto_533774 ?auto_533778 ) ) ( not ( = ?auto_533774 ?auto_533779 ) ) ( not ( = ?auto_533775 ?auto_533776 ) ) ( not ( = ?auto_533775 ?auto_533777 ) ) ( not ( = ?auto_533775 ?auto_533778 ) ) ( not ( = ?auto_533775 ?auto_533779 ) ) ( not ( = ?auto_533776 ?auto_533777 ) ) ( not ( = ?auto_533776 ?auto_533778 ) ) ( not ( = ?auto_533776 ?auto_533779 ) ) ( not ( = ?auto_533777 ?auto_533778 ) ) ( not ( = ?auto_533777 ?auto_533779 ) ) ( not ( = ?auto_533778 ?auto_533779 ) ) ( ON ?auto_533778 ?auto_533779 ) ( ON ?auto_533777 ?auto_533778 ) ( ON ?auto_533776 ?auto_533777 ) ( ON ?auto_533775 ?auto_533776 ) ( ON ?auto_533774 ?auto_533775 ) ( ON ?auto_533773 ?auto_533774 ) ( ON ?auto_533772 ?auto_533773 ) ( ON ?auto_533771 ?auto_533772 ) ( ON ?auto_533770 ?auto_533771 ) ( ON ?auto_533769 ?auto_533770 ) ( ON ?auto_533768 ?auto_533769 ) ( ON ?auto_533767 ?auto_533768 ) ( CLEAR ?auto_533765 ) ( ON ?auto_533766 ?auto_533767 ) ( CLEAR ?auto_533766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_533764 ?auto_533765 ?auto_533766 )
      ( MAKE-16PILE ?auto_533764 ?auto_533765 ?auto_533766 ?auto_533767 ?auto_533768 ?auto_533769 ?auto_533770 ?auto_533771 ?auto_533772 ?auto_533773 ?auto_533774 ?auto_533775 ?auto_533776 ?auto_533777 ?auto_533778 ?auto_533779 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533796 - BLOCK
      ?auto_533797 - BLOCK
      ?auto_533798 - BLOCK
      ?auto_533799 - BLOCK
      ?auto_533800 - BLOCK
      ?auto_533801 - BLOCK
      ?auto_533802 - BLOCK
      ?auto_533803 - BLOCK
      ?auto_533804 - BLOCK
      ?auto_533805 - BLOCK
      ?auto_533806 - BLOCK
      ?auto_533807 - BLOCK
      ?auto_533808 - BLOCK
      ?auto_533809 - BLOCK
      ?auto_533810 - BLOCK
      ?auto_533811 - BLOCK
    )
    :vars
    (
      ?auto_533812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533811 ?auto_533812 ) ( ON-TABLE ?auto_533796 ) ( not ( = ?auto_533796 ?auto_533797 ) ) ( not ( = ?auto_533796 ?auto_533798 ) ) ( not ( = ?auto_533796 ?auto_533799 ) ) ( not ( = ?auto_533796 ?auto_533800 ) ) ( not ( = ?auto_533796 ?auto_533801 ) ) ( not ( = ?auto_533796 ?auto_533802 ) ) ( not ( = ?auto_533796 ?auto_533803 ) ) ( not ( = ?auto_533796 ?auto_533804 ) ) ( not ( = ?auto_533796 ?auto_533805 ) ) ( not ( = ?auto_533796 ?auto_533806 ) ) ( not ( = ?auto_533796 ?auto_533807 ) ) ( not ( = ?auto_533796 ?auto_533808 ) ) ( not ( = ?auto_533796 ?auto_533809 ) ) ( not ( = ?auto_533796 ?auto_533810 ) ) ( not ( = ?auto_533796 ?auto_533811 ) ) ( not ( = ?auto_533796 ?auto_533812 ) ) ( not ( = ?auto_533797 ?auto_533798 ) ) ( not ( = ?auto_533797 ?auto_533799 ) ) ( not ( = ?auto_533797 ?auto_533800 ) ) ( not ( = ?auto_533797 ?auto_533801 ) ) ( not ( = ?auto_533797 ?auto_533802 ) ) ( not ( = ?auto_533797 ?auto_533803 ) ) ( not ( = ?auto_533797 ?auto_533804 ) ) ( not ( = ?auto_533797 ?auto_533805 ) ) ( not ( = ?auto_533797 ?auto_533806 ) ) ( not ( = ?auto_533797 ?auto_533807 ) ) ( not ( = ?auto_533797 ?auto_533808 ) ) ( not ( = ?auto_533797 ?auto_533809 ) ) ( not ( = ?auto_533797 ?auto_533810 ) ) ( not ( = ?auto_533797 ?auto_533811 ) ) ( not ( = ?auto_533797 ?auto_533812 ) ) ( not ( = ?auto_533798 ?auto_533799 ) ) ( not ( = ?auto_533798 ?auto_533800 ) ) ( not ( = ?auto_533798 ?auto_533801 ) ) ( not ( = ?auto_533798 ?auto_533802 ) ) ( not ( = ?auto_533798 ?auto_533803 ) ) ( not ( = ?auto_533798 ?auto_533804 ) ) ( not ( = ?auto_533798 ?auto_533805 ) ) ( not ( = ?auto_533798 ?auto_533806 ) ) ( not ( = ?auto_533798 ?auto_533807 ) ) ( not ( = ?auto_533798 ?auto_533808 ) ) ( not ( = ?auto_533798 ?auto_533809 ) ) ( not ( = ?auto_533798 ?auto_533810 ) ) ( not ( = ?auto_533798 ?auto_533811 ) ) ( not ( = ?auto_533798 ?auto_533812 ) ) ( not ( = ?auto_533799 ?auto_533800 ) ) ( not ( = ?auto_533799 ?auto_533801 ) ) ( not ( = ?auto_533799 ?auto_533802 ) ) ( not ( = ?auto_533799 ?auto_533803 ) ) ( not ( = ?auto_533799 ?auto_533804 ) ) ( not ( = ?auto_533799 ?auto_533805 ) ) ( not ( = ?auto_533799 ?auto_533806 ) ) ( not ( = ?auto_533799 ?auto_533807 ) ) ( not ( = ?auto_533799 ?auto_533808 ) ) ( not ( = ?auto_533799 ?auto_533809 ) ) ( not ( = ?auto_533799 ?auto_533810 ) ) ( not ( = ?auto_533799 ?auto_533811 ) ) ( not ( = ?auto_533799 ?auto_533812 ) ) ( not ( = ?auto_533800 ?auto_533801 ) ) ( not ( = ?auto_533800 ?auto_533802 ) ) ( not ( = ?auto_533800 ?auto_533803 ) ) ( not ( = ?auto_533800 ?auto_533804 ) ) ( not ( = ?auto_533800 ?auto_533805 ) ) ( not ( = ?auto_533800 ?auto_533806 ) ) ( not ( = ?auto_533800 ?auto_533807 ) ) ( not ( = ?auto_533800 ?auto_533808 ) ) ( not ( = ?auto_533800 ?auto_533809 ) ) ( not ( = ?auto_533800 ?auto_533810 ) ) ( not ( = ?auto_533800 ?auto_533811 ) ) ( not ( = ?auto_533800 ?auto_533812 ) ) ( not ( = ?auto_533801 ?auto_533802 ) ) ( not ( = ?auto_533801 ?auto_533803 ) ) ( not ( = ?auto_533801 ?auto_533804 ) ) ( not ( = ?auto_533801 ?auto_533805 ) ) ( not ( = ?auto_533801 ?auto_533806 ) ) ( not ( = ?auto_533801 ?auto_533807 ) ) ( not ( = ?auto_533801 ?auto_533808 ) ) ( not ( = ?auto_533801 ?auto_533809 ) ) ( not ( = ?auto_533801 ?auto_533810 ) ) ( not ( = ?auto_533801 ?auto_533811 ) ) ( not ( = ?auto_533801 ?auto_533812 ) ) ( not ( = ?auto_533802 ?auto_533803 ) ) ( not ( = ?auto_533802 ?auto_533804 ) ) ( not ( = ?auto_533802 ?auto_533805 ) ) ( not ( = ?auto_533802 ?auto_533806 ) ) ( not ( = ?auto_533802 ?auto_533807 ) ) ( not ( = ?auto_533802 ?auto_533808 ) ) ( not ( = ?auto_533802 ?auto_533809 ) ) ( not ( = ?auto_533802 ?auto_533810 ) ) ( not ( = ?auto_533802 ?auto_533811 ) ) ( not ( = ?auto_533802 ?auto_533812 ) ) ( not ( = ?auto_533803 ?auto_533804 ) ) ( not ( = ?auto_533803 ?auto_533805 ) ) ( not ( = ?auto_533803 ?auto_533806 ) ) ( not ( = ?auto_533803 ?auto_533807 ) ) ( not ( = ?auto_533803 ?auto_533808 ) ) ( not ( = ?auto_533803 ?auto_533809 ) ) ( not ( = ?auto_533803 ?auto_533810 ) ) ( not ( = ?auto_533803 ?auto_533811 ) ) ( not ( = ?auto_533803 ?auto_533812 ) ) ( not ( = ?auto_533804 ?auto_533805 ) ) ( not ( = ?auto_533804 ?auto_533806 ) ) ( not ( = ?auto_533804 ?auto_533807 ) ) ( not ( = ?auto_533804 ?auto_533808 ) ) ( not ( = ?auto_533804 ?auto_533809 ) ) ( not ( = ?auto_533804 ?auto_533810 ) ) ( not ( = ?auto_533804 ?auto_533811 ) ) ( not ( = ?auto_533804 ?auto_533812 ) ) ( not ( = ?auto_533805 ?auto_533806 ) ) ( not ( = ?auto_533805 ?auto_533807 ) ) ( not ( = ?auto_533805 ?auto_533808 ) ) ( not ( = ?auto_533805 ?auto_533809 ) ) ( not ( = ?auto_533805 ?auto_533810 ) ) ( not ( = ?auto_533805 ?auto_533811 ) ) ( not ( = ?auto_533805 ?auto_533812 ) ) ( not ( = ?auto_533806 ?auto_533807 ) ) ( not ( = ?auto_533806 ?auto_533808 ) ) ( not ( = ?auto_533806 ?auto_533809 ) ) ( not ( = ?auto_533806 ?auto_533810 ) ) ( not ( = ?auto_533806 ?auto_533811 ) ) ( not ( = ?auto_533806 ?auto_533812 ) ) ( not ( = ?auto_533807 ?auto_533808 ) ) ( not ( = ?auto_533807 ?auto_533809 ) ) ( not ( = ?auto_533807 ?auto_533810 ) ) ( not ( = ?auto_533807 ?auto_533811 ) ) ( not ( = ?auto_533807 ?auto_533812 ) ) ( not ( = ?auto_533808 ?auto_533809 ) ) ( not ( = ?auto_533808 ?auto_533810 ) ) ( not ( = ?auto_533808 ?auto_533811 ) ) ( not ( = ?auto_533808 ?auto_533812 ) ) ( not ( = ?auto_533809 ?auto_533810 ) ) ( not ( = ?auto_533809 ?auto_533811 ) ) ( not ( = ?auto_533809 ?auto_533812 ) ) ( not ( = ?auto_533810 ?auto_533811 ) ) ( not ( = ?auto_533810 ?auto_533812 ) ) ( not ( = ?auto_533811 ?auto_533812 ) ) ( ON ?auto_533810 ?auto_533811 ) ( ON ?auto_533809 ?auto_533810 ) ( ON ?auto_533808 ?auto_533809 ) ( ON ?auto_533807 ?auto_533808 ) ( ON ?auto_533806 ?auto_533807 ) ( ON ?auto_533805 ?auto_533806 ) ( ON ?auto_533804 ?auto_533805 ) ( ON ?auto_533803 ?auto_533804 ) ( ON ?auto_533802 ?auto_533803 ) ( ON ?auto_533801 ?auto_533802 ) ( ON ?auto_533800 ?auto_533801 ) ( ON ?auto_533799 ?auto_533800 ) ( ON ?auto_533798 ?auto_533799 ) ( CLEAR ?auto_533796 ) ( ON ?auto_533797 ?auto_533798 ) ( CLEAR ?auto_533797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_533796 ?auto_533797 )
      ( MAKE-16PILE ?auto_533796 ?auto_533797 ?auto_533798 ?auto_533799 ?auto_533800 ?auto_533801 ?auto_533802 ?auto_533803 ?auto_533804 ?auto_533805 ?auto_533806 ?auto_533807 ?auto_533808 ?auto_533809 ?auto_533810 ?auto_533811 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533829 - BLOCK
      ?auto_533830 - BLOCK
      ?auto_533831 - BLOCK
      ?auto_533832 - BLOCK
      ?auto_533833 - BLOCK
      ?auto_533834 - BLOCK
      ?auto_533835 - BLOCK
      ?auto_533836 - BLOCK
      ?auto_533837 - BLOCK
      ?auto_533838 - BLOCK
      ?auto_533839 - BLOCK
      ?auto_533840 - BLOCK
      ?auto_533841 - BLOCK
      ?auto_533842 - BLOCK
      ?auto_533843 - BLOCK
      ?auto_533844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533844 ) ( ON-TABLE ?auto_533829 ) ( not ( = ?auto_533829 ?auto_533830 ) ) ( not ( = ?auto_533829 ?auto_533831 ) ) ( not ( = ?auto_533829 ?auto_533832 ) ) ( not ( = ?auto_533829 ?auto_533833 ) ) ( not ( = ?auto_533829 ?auto_533834 ) ) ( not ( = ?auto_533829 ?auto_533835 ) ) ( not ( = ?auto_533829 ?auto_533836 ) ) ( not ( = ?auto_533829 ?auto_533837 ) ) ( not ( = ?auto_533829 ?auto_533838 ) ) ( not ( = ?auto_533829 ?auto_533839 ) ) ( not ( = ?auto_533829 ?auto_533840 ) ) ( not ( = ?auto_533829 ?auto_533841 ) ) ( not ( = ?auto_533829 ?auto_533842 ) ) ( not ( = ?auto_533829 ?auto_533843 ) ) ( not ( = ?auto_533829 ?auto_533844 ) ) ( not ( = ?auto_533830 ?auto_533831 ) ) ( not ( = ?auto_533830 ?auto_533832 ) ) ( not ( = ?auto_533830 ?auto_533833 ) ) ( not ( = ?auto_533830 ?auto_533834 ) ) ( not ( = ?auto_533830 ?auto_533835 ) ) ( not ( = ?auto_533830 ?auto_533836 ) ) ( not ( = ?auto_533830 ?auto_533837 ) ) ( not ( = ?auto_533830 ?auto_533838 ) ) ( not ( = ?auto_533830 ?auto_533839 ) ) ( not ( = ?auto_533830 ?auto_533840 ) ) ( not ( = ?auto_533830 ?auto_533841 ) ) ( not ( = ?auto_533830 ?auto_533842 ) ) ( not ( = ?auto_533830 ?auto_533843 ) ) ( not ( = ?auto_533830 ?auto_533844 ) ) ( not ( = ?auto_533831 ?auto_533832 ) ) ( not ( = ?auto_533831 ?auto_533833 ) ) ( not ( = ?auto_533831 ?auto_533834 ) ) ( not ( = ?auto_533831 ?auto_533835 ) ) ( not ( = ?auto_533831 ?auto_533836 ) ) ( not ( = ?auto_533831 ?auto_533837 ) ) ( not ( = ?auto_533831 ?auto_533838 ) ) ( not ( = ?auto_533831 ?auto_533839 ) ) ( not ( = ?auto_533831 ?auto_533840 ) ) ( not ( = ?auto_533831 ?auto_533841 ) ) ( not ( = ?auto_533831 ?auto_533842 ) ) ( not ( = ?auto_533831 ?auto_533843 ) ) ( not ( = ?auto_533831 ?auto_533844 ) ) ( not ( = ?auto_533832 ?auto_533833 ) ) ( not ( = ?auto_533832 ?auto_533834 ) ) ( not ( = ?auto_533832 ?auto_533835 ) ) ( not ( = ?auto_533832 ?auto_533836 ) ) ( not ( = ?auto_533832 ?auto_533837 ) ) ( not ( = ?auto_533832 ?auto_533838 ) ) ( not ( = ?auto_533832 ?auto_533839 ) ) ( not ( = ?auto_533832 ?auto_533840 ) ) ( not ( = ?auto_533832 ?auto_533841 ) ) ( not ( = ?auto_533832 ?auto_533842 ) ) ( not ( = ?auto_533832 ?auto_533843 ) ) ( not ( = ?auto_533832 ?auto_533844 ) ) ( not ( = ?auto_533833 ?auto_533834 ) ) ( not ( = ?auto_533833 ?auto_533835 ) ) ( not ( = ?auto_533833 ?auto_533836 ) ) ( not ( = ?auto_533833 ?auto_533837 ) ) ( not ( = ?auto_533833 ?auto_533838 ) ) ( not ( = ?auto_533833 ?auto_533839 ) ) ( not ( = ?auto_533833 ?auto_533840 ) ) ( not ( = ?auto_533833 ?auto_533841 ) ) ( not ( = ?auto_533833 ?auto_533842 ) ) ( not ( = ?auto_533833 ?auto_533843 ) ) ( not ( = ?auto_533833 ?auto_533844 ) ) ( not ( = ?auto_533834 ?auto_533835 ) ) ( not ( = ?auto_533834 ?auto_533836 ) ) ( not ( = ?auto_533834 ?auto_533837 ) ) ( not ( = ?auto_533834 ?auto_533838 ) ) ( not ( = ?auto_533834 ?auto_533839 ) ) ( not ( = ?auto_533834 ?auto_533840 ) ) ( not ( = ?auto_533834 ?auto_533841 ) ) ( not ( = ?auto_533834 ?auto_533842 ) ) ( not ( = ?auto_533834 ?auto_533843 ) ) ( not ( = ?auto_533834 ?auto_533844 ) ) ( not ( = ?auto_533835 ?auto_533836 ) ) ( not ( = ?auto_533835 ?auto_533837 ) ) ( not ( = ?auto_533835 ?auto_533838 ) ) ( not ( = ?auto_533835 ?auto_533839 ) ) ( not ( = ?auto_533835 ?auto_533840 ) ) ( not ( = ?auto_533835 ?auto_533841 ) ) ( not ( = ?auto_533835 ?auto_533842 ) ) ( not ( = ?auto_533835 ?auto_533843 ) ) ( not ( = ?auto_533835 ?auto_533844 ) ) ( not ( = ?auto_533836 ?auto_533837 ) ) ( not ( = ?auto_533836 ?auto_533838 ) ) ( not ( = ?auto_533836 ?auto_533839 ) ) ( not ( = ?auto_533836 ?auto_533840 ) ) ( not ( = ?auto_533836 ?auto_533841 ) ) ( not ( = ?auto_533836 ?auto_533842 ) ) ( not ( = ?auto_533836 ?auto_533843 ) ) ( not ( = ?auto_533836 ?auto_533844 ) ) ( not ( = ?auto_533837 ?auto_533838 ) ) ( not ( = ?auto_533837 ?auto_533839 ) ) ( not ( = ?auto_533837 ?auto_533840 ) ) ( not ( = ?auto_533837 ?auto_533841 ) ) ( not ( = ?auto_533837 ?auto_533842 ) ) ( not ( = ?auto_533837 ?auto_533843 ) ) ( not ( = ?auto_533837 ?auto_533844 ) ) ( not ( = ?auto_533838 ?auto_533839 ) ) ( not ( = ?auto_533838 ?auto_533840 ) ) ( not ( = ?auto_533838 ?auto_533841 ) ) ( not ( = ?auto_533838 ?auto_533842 ) ) ( not ( = ?auto_533838 ?auto_533843 ) ) ( not ( = ?auto_533838 ?auto_533844 ) ) ( not ( = ?auto_533839 ?auto_533840 ) ) ( not ( = ?auto_533839 ?auto_533841 ) ) ( not ( = ?auto_533839 ?auto_533842 ) ) ( not ( = ?auto_533839 ?auto_533843 ) ) ( not ( = ?auto_533839 ?auto_533844 ) ) ( not ( = ?auto_533840 ?auto_533841 ) ) ( not ( = ?auto_533840 ?auto_533842 ) ) ( not ( = ?auto_533840 ?auto_533843 ) ) ( not ( = ?auto_533840 ?auto_533844 ) ) ( not ( = ?auto_533841 ?auto_533842 ) ) ( not ( = ?auto_533841 ?auto_533843 ) ) ( not ( = ?auto_533841 ?auto_533844 ) ) ( not ( = ?auto_533842 ?auto_533843 ) ) ( not ( = ?auto_533842 ?auto_533844 ) ) ( not ( = ?auto_533843 ?auto_533844 ) ) ( ON ?auto_533843 ?auto_533844 ) ( ON ?auto_533842 ?auto_533843 ) ( ON ?auto_533841 ?auto_533842 ) ( ON ?auto_533840 ?auto_533841 ) ( ON ?auto_533839 ?auto_533840 ) ( ON ?auto_533838 ?auto_533839 ) ( ON ?auto_533837 ?auto_533838 ) ( ON ?auto_533836 ?auto_533837 ) ( ON ?auto_533835 ?auto_533836 ) ( ON ?auto_533834 ?auto_533835 ) ( ON ?auto_533833 ?auto_533834 ) ( ON ?auto_533832 ?auto_533833 ) ( ON ?auto_533831 ?auto_533832 ) ( CLEAR ?auto_533829 ) ( ON ?auto_533830 ?auto_533831 ) ( CLEAR ?auto_533830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_533829 ?auto_533830 )
      ( MAKE-16PILE ?auto_533829 ?auto_533830 ?auto_533831 ?auto_533832 ?auto_533833 ?auto_533834 ?auto_533835 ?auto_533836 ?auto_533837 ?auto_533838 ?auto_533839 ?auto_533840 ?auto_533841 ?auto_533842 ?auto_533843 ?auto_533844 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533861 - BLOCK
      ?auto_533862 - BLOCK
      ?auto_533863 - BLOCK
      ?auto_533864 - BLOCK
      ?auto_533865 - BLOCK
      ?auto_533866 - BLOCK
      ?auto_533867 - BLOCK
      ?auto_533868 - BLOCK
      ?auto_533869 - BLOCK
      ?auto_533870 - BLOCK
      ?auto_533871 - BLOCK
      ?auto_533872 - BLOCK
      ?auto_533873 - BLOCK
      ?auto_533874 - BLOCK
      ?auto_533875 - BLOCK
      ?auto_533876 - BLOCK
    )
    :vars
    (
      ?auto_533877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_533876 ?auto_533877 ) ( not ( = ?auto_533861 ?auto_533862 ) ) ( not ( = ?auto_533861 ?auto_533863 ) ) ( not ( = ?auto_533861 ?auto_533864 ) ) ( not ( = ?auto_533861 ?auto_533865 ) ) ( not ( = ?auto_533861 ?auto_533866 ) ) ( not ( = ?auto_533861 ?auto_533867 ) ) ( not ( = ?auto_533861 ?auto_533868 ) ) ( not ( = ?auto_533861 ?auto_533869 ) ) ( not ( = ?auto_533861 ?auto_533870 ) ) ( not ( = ?auto_533861 ?auto_533871 ) ) ( not ( = ?auto_533861 ?auto_533872 ) ) ( not ( = ?auto_533861 ?auto_533873 ) ) ( not ( = ?auto_533861 ?auto_533874 ) ) ( not ( = ?auto_533861 ?auto_533875 ) ) ( not ( = ?auto_533861 ?auto_533876 ) ) ( not ( = ?auto_533861 ?auto_533877 ) ) ( not ( = ?auto_533862 ?auto_533863 ) ) ( not ( = ?auto_533862 ?auto_533864 ) ) ( not ( = ?auto_533862 ?auto_533865 ) ) ( not ( = ?auto_533862 ?auto_533866 ) ) ( not ( = ?auto_533862 ?auto_533867 ) ) ( not ( = ?auto_533862 ?auto_533868 ) ) ( not ( = ?auto_533862 ?auto_533869 ) ) ( not ( = ?auto_533862 ?auto_533870 ) ) ( not ( = ?auto_533862 ?auto_533871 ) ) ( not ( = ?auto_533862 ?auto_533872 ) ) ( not ( = ?auto_533862 ?auto_533873 ) ) ( not ( = ?auto_533862 ?auto_533874 ) ) ( not ( = ?auto_533862 ?auto_533875 ) ) ( not ( = ?auto_533862 ?auto_533876 ) ) ( not ( = ?auto_533862 ?auto_533877 ) ) ( not ( = ?auto_533863 ?auto_533864 ) ) ( not ( = ?auto_533863 ?auto_533865 ) ) ( not ( = ?auto_533863 ?auto_533866 ) ) ( not ( = ?auto_533863 ?auto_533867 ) ) ( not ( = ?auto_533863 ?auto_533868 ) ) ( not ( = ?auto_533863 ?auto_533869 ) ) ( not ( = ?auto_533863 ?auto_533870 ) ) ( not ( = ?auto_533863 ?auto_533871 ) ) ( not ( = ?auto_533863 ?auto_533872 ) ) ( not ( = ?auto_533863 ?auto_533873 ) ) ( not ( = ?auto_533863 ?auto_533874 ) ) ( not ( = ?auto_533863 ?auto_533875 ) ) ( not ( = ?auto_533863 ?auto_533876 ) ) ( not ( = ?auto_533863 ?auto_533877 ) ) ( not ( = ?auto_533864 ?auto_533865 ) ) ( not ( = ?auto_533864 ?auto_533866 ) ) ( not ( = ?auto_533864 ?auto_533867 ) ) ( not ( = ?auto_533864 ?auto_533868 ) ) ( not ( = ?auto_533864 ?auto_533869 ) ) ( not ( = ?auto_533864 ?auto_533870 ) ) ( not ( = ?auto_533864 ?auto_533871 ) ) ( not ( = ?auto_533864 ?auto_533872 ) ) ( not ( = ?auto_533864 ?auto_533873 ) ) ( not ( = ?auto_533864 ?auto_533874 ) ) ( not ( = ?auto_533864 ?auto_533875 ) ) ( not ( = ?auto_533864 ?auto_533876 ) ) ( not ( = ?auto_533864 ?auto_533877 ) ) ( not ( = ?auto_533865 ?auto_533866 ) ) ( not ( = ?auto_533865 ?auto_533867 ) ) ( not ( = ?auto_533865 ?auto_533868 ) ) ( not ( = ?auto_533865 ?auto_533869 ) ) ( not ( = ?auto_533865 ?auto_533870 ) ) ( not ( = ?auto_533865 ?auto_533871 ) ) ( not ( = ?auto_533865 ?auto_533872 ) ) ( not ( = ?auto_533865 ?auto_533873 ) ) ( not ( = ?auto_533865 ?auto_533874 ) ) ( not ( = ?auto_533865 ?auto_533875 ) ) ( not ( = ?auto_533865 ?auto_533876 ) ) ( not ( = ?auto_533865 ?auto_533877 ) ) ( not ( = ?auto_533866 ?auto_533867 ) ) ( not ( = ?auto_533866 ?auto_533868 ) ) ( not ( = ?auto_533866 ?auto_533869 ) ) ( not ( = ?auto_533866 ?auto_533870 ) ) ( not ( = ?auto_533866 ?auto_533871 ) ) ( not ( = ?auto_533866 ?auto_533872 ) ) ( not ( = ?auto_533866 ?auto_533873 ) ) ( not ( = ?auto_533866 ?auto_533874 ) ) ( not ( = ?auto_533866 ?auto_533875 ) ) ( not ( = ?auto_533866 ?auto_533876 ) ) ( not ( = ?auto_533866 ?auto_533877 ) ) ( not ( = ?auto_533867 ?auto_533868 ) ) ( not ( = ?auto_533867 ?auto_533869 ) ) ( not ( = ?auto_533867 ?auto_533870 ) ) ( not ( = ?auto_533867 ?auto_533871 ) ) ( not ( = ?auto_533867 ?auto_533872 ) ) ( not ( = ?auto_533867 ?auto_533873 ) ) ( not ( = ?auto_533867 ?auto_533874 ) ) ( not ( = ?auto_533867 ?auto_533875 ) ) ( not ( = ?auto_533867 ?auto_533876 ) ) ( not ( = ?auto_533867 ?auto_533877 ) ) ( not ( = ?auto_533868 ?auto_533869 ) ) ( not ( = ?auto_533868 ?auto_533870 ) ) ( not ( = ?auto_533868 ?auto_533871 ) ) ( not ( = ?auto_533868 ?auto_533872 ) ) ( not ( = ?auto_533868 ?auto_533873 ) ) ( not ( = ?auto_533868 ?auto_533874 ) ) ( not ( = ?auto_533868 ?auto_533875 ) ) ( not ( = ?auto_533868 ?auto_533876 ) ) ( not ( = ?auto_533868 ?auto_533877 ) ) ( not ( = ?auto_533869 ?auto_533870 ) ) ( not ( = ?auto_533869 ?auto_533871 ) ) ( not ( = ?auto_533869 ?auto_533872 ) ) ( not ( = ?auto_533869 ?auto_533873 ) ) ( not ( = ?auto_533869 ?auto_533874 ) ) ( not ( = ?auto_533869 ?auto_533875 ) ) ( not ( = ?auto_533869 ?auto_533876 ) ) ( not ( = ?auto_533869 ?auto_533877 ) ) ( not ( = ?auto_533870 ?auto_533871 ) ) ( not ( = ?auto_533870 ?auto_533872 ) ) ( not ( = ?auto_533870 ?auto_533873 ) ) ( not ( = ?auto_533870 ?auto_533874 ) ) ( not ( = ?auto_533870 ?auto_533875 ) ) ( not ( = ?auto_533870 ?auto_533876 ) ) ( not ( = ?auto_533870 ?auto_533877 ) ) ( not ( = ?auto_533871 ?auto_533872 ) ) ( not ( = ?auto_533871 ?auto_533873 ) ) ( not ( = ?auto_533871 ?auto_533874 ) ) ( not ( = ?auto_533871 ?auto_533875 ) ) ( not ( = ?auto_533871 ?auto_533876 ) ) ( not ( = ?auto_533871 ?auto_533877 ) ) ( not ( = ?auto_533872 ?auto_533873 ) ) ( not ( = ?auto_533872 ?auto_533874 ) ) ( not ( = ?auto_533872 ?auto_533875 ) ) ( not ( = ?auto_533872 ?auto_533876 ) ) ( not ( = ?auto_533872 ?auto_533877 ) ) ( not ( = ?auto_533873 ?auto_533874 ) ) ( not ( = ?auto_533873 ?auto_533875 ) ) ( not ( = ?auto_533873 ?auto_533876 ) ) ( not ( = ?auto_533873 ?auto_533877 ) ) ( not ( = ?auto_533874 ?auto_533875 ) ) ( not ( = ?auto_533874 ?auto_533876 ) ) ( not ( = ?auto_533874 ?auto_533877 ) ) ( not ( = ?auto_533875 ?auto_533876 ) ) ( not ( = ?auto_533875 ?auto_533877 ) ) ( not ( = ?auto_533876 ?auto_533877 ) ) ( ON ?auto_533875 ?auto_533876 ) ( ON ?auto_533874 ?auto_533875 ) ( ON ?auto_533873 ?auto_533874 ) ( ON ?auto_533872 ?auto_533873 ) ( ON ?auto_533871 ?auto_533872 ) ( ON ?auto_533870 ?auto_533871 ) ( ON ?auto_533869 ?auto_533870 ) ( ON ?auto_533868 ?auto_533869 ) ( ON ?auto_533867 ?auto_533868 ) ( ON ?auto_533866 ?auto_533867 ) ( ON ?auto_533865 ?auto_533866 ) ( ON ?auto_533864 ?auto_533865 ) ( ON ?auto_533863 ?auto_533864 ) ( ON ?auto_533862 ?auto_533863 ) ( ON ?auto_533861 ?auto_533862 ) ( CLEAR ?auto_533861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_533861 )
      ( MAKE-16PILE ?auto_533861 ?auto_533862 ?auto_533863 ?auto_533864 ?auto_533865 ?auto_533866 ?auto_533867 ?auto_533868 ?auto_533869 ?auto_533870 ?auto_533871 ?auto_533872 ?auto_533873 ?auto_533874 ?auto_533875 ?auto_533876 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533894 - BLOCK
      ?auto_533895 - BLOCK
      ?auto_533896 - BLOCK
      ?auto_533897 - BLOCK
      ?auto_533898 - BLOCK
      ?auto_533899 - BLOCK
      ?auto_533900 - BLOCK
      ?auto_533901 - BLOCK
      ?auto_533902 - BLOCK
      ?auto_533903 - BLOCK
      ?auto_533904 - BLOCK
      ?auto_533905 - BLOCK
      ?auto_533906 - BLOCK
      ?auto_533907 - BLOCK
      ?auto_533908 - BLOCK
      ?auto_533909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_533909 ) ( not ( = ?auto_533894 ?auto_533895 ) ) ( not ( = ?auto_533894 ?auto_533896 ) ) ( not ( = ?auto_533894 ?auto_533897 ) ) ( not ( = ?auto_533894 ?auto_533898 ) ) ( not ( = ?auto_533894 ?auto_533899 ) ) ( not ( = ?auto_533894 ?auto_533900 ) ) ( not ( = ?auto_533894 ?auto_533901 ) ) ( not ( = ?auto_533894 ?auto_533902 ) ) ( not ( = ?auto_533894 ?auto_533903 ) ) ( not ( = ?auto_533894 ?auto_533904 ) ) ( not ( = ?auto_533894 ?auto_533905 ) ) ( not ( = ?auto_533894 ?auto_533906 ) ) ( not ( = ?auto_533894 ?auto_533907 ) ) ( not ( = ?auto_533894 ?auto_533908 ) ) ( not ( = ?auto_533894 ?auto_533909 ) ) ( not ( = ?auto_533895 ?auto_533896 ) ) ( not ( = ?auto_533895 ?auto_533897 ) ) ( not ( = ?auto_533895 ?auto_533898 ) ) ( not ( = ?auto_533895 ?auto_533899 ) ) ( not ( = ?auto_533895 ?auto_533900 ) ) ( not ( = ?auto_533895 ?auto_533901 ) ) ( not ( = ?auto_533895 ?auto_533902 ) ) ( not ( = ?auto_533895 ?auto_533903 ) ) ( not ( = ?auto_533895 ?auto_533904 ) ) ( not ( = ?auto_533895 ?auto_533905 ) ) ( not ( = ?auto_533895 ?auto_533906 ) ) ( not ( = ?auto_533895 ?auto_533907 ) ) ( not ( = ?auto_533895 ?auto_533908 ) ) ( not ( = ?auto_533895 ?auto_533909 ) ) ( not ( = ?auto_533896 ?auto_533897 ) ) ( not ( = ?auto_533896 ?auto_533898 ) ) ( not ( = ?auto_533896 ?auto_533899 ) ) ( not ( = ?auto_533896 ?auto_533900 ) ) ( not ( = ?auto_533896 ?auto_533901 ) ) ( not ( = ?auto_533896 ?auto_533902 ) ) ( not ( = ?auto_533896 ?auto_533903 ) ) ( not ( = ?auto_533896 ?auto_533904 ) ) ( not ( = ?auto_533896 ?auto_533905 ) ) ( not ( = ?auto_533896 ?auto_533906 ) ) ( not ( = ?auto_533896 ?auto_533907 ) ) ( not ( = ?auto_533896 ?auto_533908 ) ) ( not ( = ?auto_533896 ?auto_533909 ) ) ( not ( = ?auto_533897 ?auto_533898 ) ) ( not ( = ?auto_533897 ?auto_533899 ) ) ( not ( = ?auto_533897 ?auto_533900 ) ) ( not ( = ?auto_533897 ?auto_533901 ) ) ( not ( = ?auto_533897 ?auto_533902 ) ) ( not ( = ?auto_533897 ?auto_533903 ) ) ( not ( = ?auto_533897 ?auto_533904 ) ) ( not ( = ?auto_533897 ?auto_533905 ) ) ( not ( = ?auto_533897 ?auto_533906 ) ) ( not ( = ?auto_533897 ?auto_533907 ) ) ( not ( = ?auto_533897 ?auto_533908 ) ) ( not ( = ?auto_533897 ?auto_533909 ) ) ( not ( = ?auto_533898 ?auto_533899 ) ) ( not ( = ?auto_533898 ?auto_533900 ) ) ( not ( = ?auto_533898 ?auto_533901 ) ) ( not ( = ?auto_533898 ?auto_533902 ) ) ( not ( = ?auto_533898 ?auto_533903 ) ) ( not ( = ?auto_533898 ?auto_533904 ) ) ( not ( = ?auto_533898 ?auto_533905 ) ) ( not ( = ?auto_533898 ?auto_533906 ) ) ( not ( = ?auto_533898 ?auto_533907 ) ) ( not ( = ?auto_533898 ?auto_533908 ) ) ( not ( = ?auto_533898 ?auto_533909 ) ) ( not ( = ?auto_533899 ?auto_533900 ) ) ( not ( = ?auto_533899 ?auto_533901 ) ) ( not ( = ?auto_533899 ?auto_533902 ) ) ( not ( = ?auto_533899 ?auto_533903 ) ) ( not ( = ?auto_533899 ?auto_533904 ) ) ( not ( = ?auto_533899 ?auto_533905 ) ) ( not ( = ?auto_533899 ?auto_533906 ) ) ( not ( = ?auto_533899 ?auto_533907 ) ) ( not ( = ?auto_533899 ?auto_533908 ) ) ( not ( = ?auto_533899 ?auto_533909 ) ) ( not ( = ?auto_533900 ?auto_533901 ) ) ( not ( = ?auto_533900 ?auto_533902 ) ) ( not ( = ?auto_533900 ?auto_533903 ) ) ( not ( = ?auto_533900 ?auto_533904 ) ) ( not ( = ?auto_533900 ?auto_533905 ) ) ( not ( = ?auto_533900 ?auto_533906 ) ) ( not ( = ?auto_533900 ?auto_533907 ) ) ( not ( = ?auto_533900 ?auto_533908 ) ) ( not ( = ?auto_533900 ?auto_533909 ) ) ( not ( = ?auto_533901 ?auto_533902 ) ) ( not ( = ?auto_533901 ?auto_533903 ) ) ( not ( = ?auto_533901 ?auto_533904 ) ) ( not ( = ?auto_533901 ?auto_533905 ) ) ( not ( = ?auto_533901 ?auto_533906 ) ) ( not ( = ?auto_533901 ?auto_533907 ) ) ( not ( = ?auto_533901 ?auto_533908 ) ) ( not ( = ?auto_533901 ?auto_533909 ) ) ( not ( = ?auto_533902 ?auto_533903 ) ) ( not ( = ?auto_533902 ?auto_533904 ) ) ( not ( = ?auto_533902 ?auto_533905 ) ) ( not ( = ?auto_533902 ?auto_533906 ) ) ( not ( = ?auto_533902 ?auto_533907 ) ) ( not ( = ?auto_533902 ?auto_533908 ) ) ( not ( = ?auto_533902 ?auto_533909 ) ) ( not ( = ?auto_533903 ?auto_533904 ) ) ( not ( = ?auto_533903 ?auto_533905 ) ) ( not ( = ?auto_533903 ?auto_533906 ) ) ( not ( = ?auto_533903 ?auto_533907 ) ) ( not ( = ?auto_533903 ?auto_533908 ) ) ( not ( = ?auto_533903 ?auto_533909 ) ) ( not ( = ?auto_533904 ?auto_533905 ) ) ( not ( = ?auto_533904 ?auto_533906 ) ) ( not ( = ?auto_533904 ?auto_533907 ) ) ( not ( = ?auto_533904 ?auto_533908 ) ) ( not ( = ?auto_533904 ?auto_533909 ) ) ( not ( = ?auto_533905 ?auto_533906 ) ) ( not ( = ?auto_533905 ?auto_533907 ) ) ( not ( = ?auto_533905 ?auto_533908 ) ) ( not ( = ?auto_533905 ?auto_533909 ) ) ( not ( = ?auto_533906 ?auto_533907 ) ) ( not ( = ?auto_533906 ?auto_533908 ) ) ( not ( = ?auto_533906 ?auto_533909 ) ) ( not ( = ?auto_533907 ?auto_533908 ) ) ( not ( = ?auto_533907 ?auto_533909 ) ) ( not ( = ?auto_533908 ?auto_533909 ) ) ( ON ?auto_533908 ?auto_533909 ) ( ON ?auto_533907 ?auto_533908 ) ( ON ?auto_533906 ?auto_533907 ) ( ON ?auto_533905 ?auto_533906 ) ( ON ?auto_533904 ?auto_533905 ) ( ON ?auto_533903 ?auto_533904 ) ( ON ?auto_533902 ?auto_533903 ) ( ON ?auto_533901 ?auto_533902 ) ( ON ?auto_533900 ?auto_533901 ) ( ON ?auto_533899 ?auto_533900 ) ( ON ?auto_533898 ?auto_533899 ) ( ON ?auto_533897 ?auto_533898 ) ( ON ?auto_533896 ?auto_533897 ) ( ON ?auto_533895 ?auto_533896 ) ( ON ?auto_533894 ?auto_533895 ) ( CLEAR ?auto_533894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_533894 )
      ( MAKE-16PILE ?auto_533894 ?auto_533895 ?auto_533896 ?auto_533897 ?auto_533898 ?auto_533899 ?auto_533900 ?auto_533901 ?auto_533902 ?auto_533903 ?auto_533904 ?auto_533905 ?auto_533906 ?auto_533907 ?auto_533908 ?auto_533909 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_533926 - BLOCK
      ?auto_533927 - BLOCK
      ?auto_533928 - BLOCK
      ?auto_533929 - BLOCK
      ?auto_533930 - BLOCK
      ?auto_533931 - BLOCK
      ?auto_533932 - BLOCK
      ?auto_533933 - BLOCK
      ?auto_533934 - BLOCK
      ?auto_533935 - BLOCK
      ?auto_533936 - BLOCK
      ?auto_533937 - BLOCK
      ?auto_533938 - BLOCK
      ?auto_533939 - BLOCK
      ?auto_533940 - BLOCK
      ?auto_533941 - BLOCK
    )
    :vars
    (
      ?auto_533942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_533926 ?auto_533927 ) ) ( not ( = ?auto_533926 ?auto_533928 ) ) ( not ( = ?auto_533926 ?auto_533929 ) ) ( not ( = ?auto_533926 ?auto_533930 ) ) ( not ( = ?auto_533926 ?auto_533931 ) ) ( not ( = ?auto_533926 ?auto_533932 ) ) ( not ( = ?auto_533926 ?auto_533933 ) ) ( not ( = ?auto_533926 ?auto_533934 ) ) ( not ( = ?auto_533926 ?auto_533935 ) ) ( not ( = ?auto_533926 ?auto_533936 ) ) ( not ( = ?auto_533926 ?auto_533937 ) ) ( not ( = ?auto_533926 ?auto_533938 ) ) ( not ( = ?auto_533926 ?auto_533939 ) ) ( not ( = ?auto_533926 ?auto_533940 ) ) ( not ( = ?auto_533926 ?auto_533941 ) ) ( not ( = ?auto_533927 ?auto_533928 ) ) ( not ( = ?auto_533927 ?auto_533929 ) ) ( not ( = ?auto_533927 ?auto_533930 ) ) ( not ( = ?auto_533927 ?auto_533931 ) ) ( not ( = ?auto_533927 ?auto_533932 ) ) ( not ( = ?auto_533927 ?auto_533933 ) ) ( not ( = ?auto_533927 ?auto_533934 ) ) ( not ( = ?auto_533927 ?auto_533935 ) ) ( not ( = ?auto_533927 ?auto_533936 ) ) ( not ( = ?auto_533927 ?auto_533937 ) ) ( not ( = ?auto_533927 ?auto_533938 ) ) ( not ( = ?auto_533927 ?auto_533939 ) ) ( not ( = ?auto_533927 ?auto_533940 ) ) ( not ( = ?auto_533927 ?auto_533941 ) ) ( not ( = ?auto_533928 ?auto_533929 ) ) ( not ( = ?auto_533928 ?auto_533930 ) ) ( not ( = ?auto_533928 ?auto_533931 ) ) ( not ( = ?auto_533928 ?auto_533932 ) ) ( not ( = ?auto_533928 ?auto_533933 ) ) ( not ( = ?auto_533928 ?auto_533934 ) ) ( not ( = ?auto_533928 ?auto_533935 ) ) ( not ( = ?auto_533928 ?auto_533936 ) ) ( not ( = ?auto_533928 ?auto_533937 ) ) ( not ( = ?auto_533928 ?auto_533938 ) ) ( not ( = ?auto_533928 ?auto_533939 ) ) ( not ( = ?auto_533928 ?auto_533940 ) ) ( not ( = ?auto_533928 ?auto_533941 ) ) ( not ( = ?auto_533929 ?auto_533930 ) ) ( not ( = ?auto_533929 ?auto_533931 ) ) ( not ( = ?auto_533929 ?auto_533932 ) ) ( not ( = ?auto_533929 ?auto_533933 ) ) ( not ( = ?auto_533929 ?auto_533934 ) ) ( not ( = ?auto_533929 ?auto_533935 ) ) ( not ( = ?auto_533929 ?auto_533936 ) ) ( not ( = ?auto_533929 ?auto_533937 ) ) ( not ( = ?auto_533929 ?auto_533938 ) ) ( not ( = ?auto_533929 ?auto_533939 ) ) ( not ( = ?auto_533929 ?auto_533940 ) ) ( not ( = ?auto_533929 ?auto_533941 ) ) ( not ( = ?auto_533930 ?auto_533931 ) ) ( not ( = ?auto_533930 ?auto_533932 ) ) ( not ( = ?auto_533930 ?auto_533933 ) ) ( not ( = ?auto_533930 ?auto_533934 ) ) ( not ( = ?auto_533930 ?auto_533935 ) ) ( not ( = ?auto_533930 ?auto_533936 ) ) ( not ( = ?auto_533930 ?auto_533937 ) ) ( not ( = ?auto_533930 ?auto_533938 ) ) ( not ( = ?auto_533930 ?auto_533939 ) ) ( not ( = ?auto_533930 ?auto_533940 ) ) ( not ( = ?auto_533930 ?auto_533941 ) ) ( not ( = ?auto_533931 ?auto_533932 ) ) ( not ( = ?auto_533931 ?auto_533933 ) ) ( not ( = ?auto_533931 ?auto_533934 ) ) ( not ( = ?auto_533931 ?auto_533935 ) ) ( not ( = ?auto_533931 ?auto_533936 ) ) ( not ( = ?auto_533931 ?auto_533937 ) ) ( not ( = ?auto_533931 ?auto_533938 ) ) ( not ( = ?auto_533931 ?auto_533939 ) ) ( not ( = ?auto_533931 ?auto_533940 ) ) ( not ( = ?auto_533931 ?auto_533941 ) ) ( not ( = ?auto_533932 ?auto_533933 ) ) ( not ( = ?auto_533932 ?auto_533934 ) ) ( not ( = ?auto_533932 ?auto_533935 ) ) ( not ( = ?auto_533932 ?auto_533936 ) ) ( not ( = ?auto_533932 ?auto_533937 ) ) ( not ( = ?auto_533932 ?auto_533938 ) ) ( not ( = ?auto_533932 ?auto_533939 ) ) ( not ( = ?auto_533932 ?auto_533940 ) ) ( not ( = ?auto_533932 ?auto_533941 ) ) ( not ( = ?auto_533933 ?auto_533934 ) ) ( not ( = ?auto_533933 ?auto_533935 ) ) ( not ( = ?auto_533933 ?auto_533936 ) ) ( not ( = ?auto_533933 ?auto_533937 ) ) ( not ( = ?auto_533933 ?auto_533938 ) ) ( not ( = ?auto_533933 ?auto_533939 ) ) ( not ( = ?auto_533933 ?auto_533940 ) ) ( not ( = ?auto_533933 ?auto_533941 ) ) ( not ( = ?auto_533934 ?auto_533935 ) ) ( not ( = ?auto_533934 ?auto_533936 ) ) ( not ( = ?auto_533934 ?auto_533937 ) ) ( not ( = ?auto_533934 ?auto_533938 ) ) ( not ( = ?auto_533934 ?auto_533939 ) ) ( not ( = ?auto_533934 ?auto_533940 ) ) ( not ( = ?auto_533934 ?auto_533941 ) ) ( not ( = ?auto_533935 ?auto_533936 ) ) ( not ( = ?auto_533935 ?auto_533937 ) ) ( not ( = ?auto_533935 ?auto_533938 ) ) ( not ( = ?auto_533935 ?auto_533939 ) ) ( not ( = ?auto_533935 ?auto_533940 ) ) ( not ( = ?auto_533935 ?auto_533941 ) ) ( not ( = ?auto_533936 ?auto_533937 ) ) ( not ( = ?auto_533936 ?auto_533938 ) ) ( not ( = ?auto_533936 ?auto_533939 ) ) ( not ( = ?auto_533936 ?auto_533940 ) ) ( not ( = ?auto_533936 ?auto_533941 ) ) ( not ( = ?auto_533937 ?auto_533938 ) ) ( not ( = ?auto_533937 ?auto_533939 ) ) ( not ( = ?auto_533937 ?auto_533940 ) ) ( not ( = ?auto_533937 ?auto_533941 ) ) ( not ( = ?auto_533938 ?auto_533939 ) ) ( not ( = ?auto_533938 ?auto_533940 ) ) ( not ( = ?auto_533938 ?auto_533941 ) ) ( not ( = ?auto_533939 ?auto_533940 ) ) ( not ( = ?auto_533939 ?auto_533941 ) ) ( not ( = ?auto_533940 ?auto_533941 ) ) ( ON ?auto_533926 ?auto_533942 ) ( not ( = ?auto_533941 ?auto_533942 ) ) ( not ( = ?auto_533940 ?auto_533942 ) ) ( not ( = ?auto_533939 ?auto_533942 ) ) ( not ( = ?auto_533938 ?auto_533942 ) ) ( not ( = ?auto_533937 ?auto_533942 ) ) ( not ( = ?auto_533936 ?auto_533942 ) ) ( not ( = ?auto_533935 ?auto_533942 ) ) ( not ( = ?auto_533934 ?auto_533942 ) ) ( not ( = ?auto_533933 ?auto_533942 ) ) ( not ( = ?auto_533932 ?auto_533942 ) ) ( not ( = ?auto_533931 ?auto_533942 ) ) ( not ( = ?auto_533930 ?auto_533942 ) ) ( not ( = ?auto_533929 ?auto_533942 ) ) ( not ( = ?auto_533928 ?auto_533942 ) ) ( not ( = ?auto_533927 ?auto_533942 ) ) ( not ( = ?auto_533926 ?auto_533942 ) ) ( ON ?auto_533927 ?auto_533926 ) ( ON ?auto_533928 ?auto_533927 ) ( ON ?auto_533929 ?auto_533928 ) ( ON ?auto_533930 ?auto_533929 ) ( ON ?auto_533931 ?auto_533930 ) ( ON ?auto_533932 ?auto_533931 ) ( ON ?auto_533933 ?auto_533932 ) ( ON ?auto_533934 ?auto_533933 ) ( ON ?auto_533935 ?auto_533934 ) ( ON ?auto_533936 ?auto_533935 ) ( ON ?auto_533937 ?auto_533936 ) ( ON ?auto_533938 ?auto_533937 ) ( ON ?auto_533939 ?auto_533938 ) ( ON ?auto_533940 ?auto_533939 ) ( ON ?auto_533941 ?auto_533940 ) ( CLEAR ?auto_533941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_533941 ?auto_533940 ?auto_533939 ?auto_533938 ?auto_533937 ?auto_533936 ?auto_533935 ?auto_533934 ?auto_533933 ?auto_533932 ?auto_533931 ?auto_533930 ?auto_533929 ?auto_533928 ?auto_533927 ?auto_533926 )
      ( MAKE-16PILE ?auto_533926 ?auto_533927 ?auto_533928 ?auto_533929 ?auto_533930 ?auto_533931 ?auto_533932 ?auto_533933 ?auto_533934 ?auto_533935 ?auto_533936 ?auto_533937 ?auto_533938 ?auto_533939 ?auto_533940 ?auto_533941 ) )
  )

)

