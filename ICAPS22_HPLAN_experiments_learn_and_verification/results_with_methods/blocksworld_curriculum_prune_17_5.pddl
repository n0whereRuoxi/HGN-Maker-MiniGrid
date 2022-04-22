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
      ?auto_627721 - BLOCK
    )
    :vars
    (
      ?auto_627722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627721 ?auto_627722 ) ( CLEAR ?auto_627721 ) ( HAND-EMPTY ) ( not ( = ?auto_627721 ?auto_627722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627721 ?auto_627722 )
      ( !PUTDOWN ?auto_627721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_627728 - BLOCK
      ?auto_627729 - BLOCK
    )
    :vars
    (
      ?auto_627730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_627728 ) ( ON ?auto_627729 ?auto_627730 ) ( CLEAR ?auto_627729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_627728 ) ( not ( = ?auto_627728 ?auto_627729 ) ) ( not ( = ?auto_627728 ?auto_627730 ) ) ( not ( = ?auto_627729 ?auto_627730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627729 ?auto_627730 )
      ( !STACK ?auto_627729 ?auto_627728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_627738 - BLOCK
      ?auto_627739 - BLOCK
    )
    :vars
    (
      ?auto_627740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627739 ?auto_627740 ) ( not ( = ?auto_627738 ?auto_627739 ) ) ( not ( = ?auto_627738 ?auto_627740 ) ) ( not ( = ?auto_627739 ?auto_627740 ) ) ( ON ?auto_627738 ?auto_627739 ) ( CLEAR ?auto_627738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627738 )
      ( MAKE-2PILE ?auto_627738 ?auto_627739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_627749 - BLOCK
      ?auto_627750 - BLOCK
      ?auto_627751 - BLOCK
    )
    :vars
    (
      ?auto_627752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_627750 ) ( ON ?auto_627751 ?auto_627752 ) ( CLEAR ?auto_627751 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_627749 ) ( ON ?auto_627750 ?auto_627749 ) ( not ( = ?auto_627749 ?auto_627750 ) ) ( not ( = ?auto_627749 ?auto_627751 ) ) ( not ( = ?auto_627749 ?auto_627752 ) ) ( not ( = ?auto_627750 ?auto_627751 ) ) ( not ( = ?auto_627750 ?auto_627752 ) ) ( not ( = ?auto_627751 ?auto_627752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627751 ?auto_627752 )
      ( !STACK ?auto_627751 ?auto_627750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_627763 - BLOCK
      ?auto_627764 - BLOCK
      ?auto_627765 - BLOCK
    )
    :vars
    (
      ?auto_627766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627765 ?auto_627766 ) ( ON-TABLE ?auto_627763 ) ( not ( = ?auto_627763 ?auto_627764 ) ) ( not ( = ?auto_627763 ?auto_627765 ) ) ( not ( = ?auto_627763 ?auto_627766 ) ) ( not ( = ?auto_627764 ?auto_627765 ) ) ( not ( = ?auto_627764 ?auto_627766 ) ) ( not ( = ?auto_627765 ?auto_627766 ) ) ( CLEAR ?auto_627763 ) ( ON ?auto_627764 ?auto_627765 ) ( CLEAR ?auto_627764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_627763 ?auto_627764 )
      ( MAKE-3PILE ?auto_627763 ?auto_627764 ?auto_627765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_627777 - BLOCK
      ?auto_627778 - BLOCK
      ?auto_627779 - BLOCK
    )
    :vars
    (
      ?auto_627780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627779 ?auto_627780 ) ( not ( = ?auto_627777 ?auto_627778 ) ) ( not ( = ?auto_627777 ?auto_627779 ) ) ( not ( = ?auto_627777 ?auto_627780 ) ) ( not ( = ?auto_627778 ?auto_627779 ) ) ( not ( = ?auto_627778 ?auto_627780 ) ) ( not ( = ?auto_627779 ?auto_627780 ) ) ( ON ?auto_627778 ?auto_627779 ) ( ON ?auto_627777 ?auto_627778 ) ( CLEAR ?auto_627777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627777 )
      ( MAKE-3PILE ?auto_627777 ?auto_627778 ?auto_627779 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_627792 - BLOCK
      ?auto_627793 - BLOCK
      ?auto_627794 - BLOCK
      ?auto_627795 - BLOCK
    )
    :vars
    (
      ?auto_627796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_627794 ) ( ON ?auto_627795 ?auto_627796 ) ( CLEAR ?auto_627795 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_627792 ) ( ON ?auto_627793 ?auto_627792 ) ( ON ?auto_627794 ?auto_627793 ) ( not ( = ?auto_627792 ?auto_627793 ) ) ( not ( = ?auto_627792 ?auto_627794 ) ) ( not ( = ?auto_627792 ?auto_627795 ) ) ( not ( = ?auto_627792 ?auto_627796 ) ) ( not ( = ?auto_627793 ?auto_627794 ) ) ( not ( = ?auto_627793 ?auto_627795 ) ) ( not ( = ?auto_627793 ?auto_627796 ) ) ( not ( = ?auto_627794 ?auto_627795 ) ) ( not ( = ?auto_627794 ?auto_627796 ) ) ( not ( = ?auto_627795 ?auto_627796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627795 ?auto_627796 )
      ( !STACK ?auto_627795 ?auto_627794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_627810 - BLOCK
      ?auto_627811 - BLOCK
      ?auto_627812 - BLOCK
      ?auto_627813 - BLOCK
    )
    :vars
    (
      ?auto_627814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627813 ?auto_627814 ) ( ON-TABLE ?auto_627810 ) ( ON ?auto_627811 ?auto_627810 ) ( not ( = ?auto_627810 ?auto_627811 ) ) ( not ( = ?auto_627810 ?auto_627812 ) ) ( not ( = ?auto_627810 ?auto_627813 ) ) ( not ( = ?auto_627810 ?auto_627814 ) ) ( not ( = ?auto_627811 ?auto_627812 ) ) ( not ( = ?auto_627811 ?auto_627813 ) ) ( not ( = ?auto_627811 ?auto_627814 ) ) ( not ( = ?auto_627812 ?auto_627813 ) ) ( not ( = ?auto_627812 ?auto_627814 ) ) ( not ( = ?auto_627813 ?auto_627814 ) ) ( CLEAR ?auto_627811 ) ( ON ?auto_627812 ?auto_627813 ) ( CLEAR ?auto_627812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_627810 ?auto_627811 ?auto_627812 )
      ( MAKE-4PILE ?auto_627810 ?auto_627811 ?auto_627812 ?auto_627813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_627828 - BLOCK
      ?auto_627829 - BLOCK
      ?auto_627830 - BLOCK
      ?auto_627831 - BLOCK
    )
    :vars
    (
      ?auto_627832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627831 ?auto_627832 ) ( ON-TABLE ?auto_627828 ) ( not ( = ?auto_627828 ?auto_627829 ) ) ( not ( = ?auto_627828 ?auto_627830 ) ) ( not ( = ?auto_627828 ?auto_627831 ) ) ( not ( = ?auto_627828 ?auto_627832 ) ) ( not ( = ?auto_627829 ?auto_627830 ) ) ( not ( = ?auto_627829 ?auto_627831 ) ) ( not ( = ?auto_627829 ?auto_627832 ) ) ( not ( = ?auto_627830 ?auto_627831 ) ) ( not ( = ?auto_627830 ?auto_627832 ) ) ( not ( = ?auto_627831 ?auto_627832 ) ) ( ON ?auto_627830 ?auto_627831 ) ( CLEAR ?auto_627828 ) ( ON ?auto_627829 ?auto_627830 ) ( CLEAR ?auto_627829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_627828 ?auto_627829 )
      ( MAKE-4PILE ?auto_627828 ?auto_627829 ?auto_627830 ?auto_627831 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_627846 - BLOCK
      ?auto_627847 - BLOCK
      ?auto_627848 - BLOCK
      ?auto_627849 - BLOCK
    )
    :vars
    (
      ?auto_627850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627849 ?auto_627850 ) ( not ( = ?auto_627846 ?auto_627847 ) ) ( not ( = ?auto_627846 ?auto_627848 ) ) ( not ( = ?auto_627846 ?auto_627849 ) ) ( not ( = ?auto_627846 ?auto_627850 ) ) ( not ( = ?auto_627847 ?auto_627848 ) ) ( not ( = ?auto_627847 ?auto_627849 ) ) ( not ( = ?auto_627847 ?auto_627850 ) ) ( not ( = ?auto_627848 ?auto_627849 ) ) ( not ( = ?auto_627848 ?auto_627850 ) ) ( not ( = ?auto_627849 ?auto_627850 ) ) ( ON ?auto_627848 ?auto_627849 ) ( ON ?auto_627847 ?auto_627848 ) ( ON ?auto_627846 ?auto_627847 ) ( CLEAR ?auto_627846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627846 )
      ( MAKE-4PILE ?auto_627846 ?auto_627847 ?auto_627848 ?auto_627849 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_627865 - BLOCK
      ?auto_627866 - BLOCK
      ?auto_627867 - BLOCK
      ?auto_627868 - BLOCK
      ?auto_627869 - BLOCK
    )
    :vars
    (
      ?auto_627870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_627868 ) ( ON ?auto_627869 ?auto_627870 ) ( CLEAR ?auto_627869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_627865 ) ( ON ?auto_627866 ?auto_627865 ) ( ON ?auto_627867 ?auto_627866 ) ( ON ?auto_627868 ?auto_627867 ) ( not ( = ?auto_627865 ?auto_627866 ) ) ( not ( = ?auto_627865 ?auto_627867 ) ) ( not ( = ?auto_627865 ?auto_627868 ) ) ( not ( = ?auto_627865 ?auto_627869 ) ) ( not ( = ?auto_627865 ?auto_627870 ) ) ( not ( = ?auto_627866 ?auto_627867 ) ) ( not ( = ?auto_627866 ?auto_627868 ) ) ( not ( = ?auto_627866 ?auto_627869 ) ) ( not ( = ?auto_627866 ?auto_627870 ) ) ( not ( = ?auto_627867 ?auto_627868 ) ) ( not ( = ?auto_627867 ?auto_627869 ) ) ( not ( = ?auto_627867 ?auto_627870 ) ) ( not ( = ?auto_627868 ?auto_627869 ) ) ( not ( = ?auto_627868 ?auto_627870 ) ) ( not ( = ?auto_627869 ?auto_627870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627869 ?auto_627870 )
      ( !STACK ?auto_627869 ?auto_627868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_627887 - BLOCK
      ?auto_627888 - BLOCK
      ?auto_627889 - BLOCK
      ?auto_627890 - BLOCK
      ?auto_627891 - BLOCK
    )
    :vars
    (
      ?auto_627892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627891 ?auto_627892 ) ( ON-TABLE ?auto_627887 ) ( ON ?auto_627888 ?auto_627887 ) ( ON ?auto_627889 ?auto_627888 ) ( not ( = ?auto_627887 ?auto_627888 ) ) ( not ( = ?auto_627887 ?auto_627889 ) ) ( not ( = ?auto_627887 ?auto_627890 ) ) ( not ( = ?auto_627887 ?auto_627891 ) ) ( not ( = ?auto_627887 ?auto_627892 ) ) ( not ( = ?auto_627888 ?auto_627889 ) ) ( not ( = ?auto_627888 ?auto_627890 ) ) ( not ( = ?auto_627888 ?auto_627891 ) ) ( not ( = ?auto_627888 ?auto_627892 ) ) ( not ( = ?auto_627889 ?auto_627890 ) ) ( not ( = ?auto_627889 ?auto_627891 ) ) ( not ( = ?auto_627889 ?auto_627892 ) ) ( not ( = ?auto_627890 ?auto_627891 ) ) ( not ( = ?auto_627890 ?auto_627892 ) ) ( not ( = ?auto_627891 ?auto_627892 ) ) ( CLEAR ?auto_627889 ) ( ON ?auto_627890 ?auto_627891 ) ( CLEAR ?auto_627890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_627887 ?auto_627888 ?auto_627889 ?auto_627890 )
      ( MAKE-5PILE ?auto_627887 ?auto_627888 ?auto_627889 ?auto_627890 ?auto_627891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_627909 - BLOCK
      ?auto_627910 - BLOCK
      ?auto_627911 - BLOCK
      ?auto_627912 - BLOCK
      ?auto_627913 - BLOCK
    )
    :vars
    (
      ?auto_627914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627913 ?auto_627914 ) ( ON-TABLE ?auto_627909 ) ( ON ?auto_627910 ?auto_627909 ) ( not ( = ?auto_627909 ?auto_627910 ) ) ( not ( = ?auto_627909 ?auto_627911 ) ) ( not ( = ?auto_627909 ?auto_627912 ) ) ( not ( = ?auto_627909 ?auto_627913 ) ) ( not ( = ?auto_627909 ?auto_627914 ) ) ( not ( = ?auto_627910 ?auto_627911 ) ) ( not ( = ?auto_627910 ?auto_627912 ) ) ( not ( = ?auto_627910 ?auto_627913 ) ) ( not ( = ?auto_627910 ?auto_627914 ) ) ( not ( = ?auto_627911 ?auto_627912 ) ) ( not ( = ?auto_627911 ?auto_627913 ) ) ( not ( = ?auto_627911 ?auto_627914 ) ) ( not ( = ?auto_627912 ?auto_627913 ) ) ( not ( = ?auto_627912 ?auto_627914 ) ) ( not ( = ?auto_627913 ?auto_627914 ) ) ( ON ?auto_627912 ?auto_627913 ) ( CLEAR ?auto_627910 ) ( ON ?auto_627911 ?auto_627912 ) ( CLEAR ?auto_627911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_627909 ?auto_627910 ?auto_627911 )
      ( MAKE-5PILE ?auto_627909 ?auto_627910 ?auto_627911 ?auto_627912 ?auto_627913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_627931 - BLOCK
      ?auto_627932 - BLOCK
      ?auto_627933 - BLOCK
      ?auto_627934 - BLOCK
      ?auto_627935 - BLOCK
    )
    :vars
    (
      ?auto_627936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627935 ?auto_627936 ) ( ON-TABLE ?auto_627931 ) ( not ( = ?auto_627931 ?auto_627932 ) ) ( not ( = ?auto_627931 ?auto_627933 ) ) ( not ( = ?auto_627931 ?auto_627934 ) ) ( not ( = ?auto_627931 ?auto_627935 ) ) ( not ( = ?auto_627931 ?auto_627936 ) ) ( not ( = ?auto_627932 ?auto_627933 ) ) ( not ( = ?auto_627932 ?auto_627934 ) ) ( not ( = ?auto_627932 ?auto_627935 ) ) ( not ( = ?auto_627932 ?auto_627936 ) ) ( not ( = ?auto_627933 ?auto_627934 ) ) ( not ( = ?auto_627933 ?auto_627935 ) ) ( not ( = ?auto_627933 ?auto_627936 ) ) ( not ( = ?auto_627934 ?auto_627935 ) ) ( not ( = ?auto_627934 ?auto_627936 ) ) ( not ( = ?auto_627935 ?auto_627936 ) ) ( ON ?auto_627934 ?auto_627935 ) ( ON ?auto_627933 ?auto_627934 ) ( CLEAR ?auto_627931 ) ( ON ?auto_627932 ?auto_627933 ) ( CLEAR ?auto_627932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_627931 ?auto_627932 )
      ( MAKE-5PILE ?auto_627931 ?auto_627932 ?auto_627933 ?auto_627934 ?auto_627935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_627953 - BLOCK
      ?auto_627954 - BLOCK
      ?auto_627955 - BLOCK
      ?auto_627956 - BLOCK
      ?auto_627957 - BLOCK
    )
    :vars
    (
      ?auto_627958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_627957 ?auto_627958 ) ( not ( = ?auto_627953 ?auto_627954 ) ) ( not ( = ?auto_627953 ?auto_627955 ) ) ( not ( = ?auto_627953 ?auto_627956 ) ) ( not ( = ?auto_627953 ?auto_627957 ) ) ( not ( = ?auto_627953 ?auto_627958 ) ) ( not ( = ?auto_627954 ?auto_627955 ) ) ( not ( = ?auto_627954 ?auto_627956 ) ) ( not ( = ?auto_627954 ?auto_627957 ) ) ( not ( = ?auto_627954 ?auto_627958 ) ) ( not ( = ?auto_627955 ?auto_627956 ) ) ( not ( = ?auto_627955 ?auto_627957 ) ) ( not ( = ?auto_627955 ?auto_627958 ) ) ( not ( = ?auto_627956 ?auto_627957 ) ) ( not ( = ?auto_627956 ?auto_627958 ) ) ( not ( = ?auto_627957 ?auto_627958 ) ) ( ON ?auto_627956 ?auto_627957 ) ( ON ?auto_627955 ?auto_627956 ) ( ON ?auto_627954 ?auto_627955 ) ( ON ?auto_627953 ?auto_627954 ) ( CLEAR ?auto_627953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_627953 )
      ( MAKE-5PILE ?auto_627953 ?auto_627954 ?auto_627955 ?auto_627956 ?auto_627957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_627976 - BLOCK
      ?auto_627977 - BLOCK
      ?auto_627978 - BLOCK
      ?auto_627979 - BLOCK
      ?auto_627980 - BLOCK
      ?auto_627981 - BLOCK
    )
    :vars
    (
      ?auto_627982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_627980 ) ( ON ?auto_627981 ?auto_627982 ) ( CLEAR ?auto_627981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_627976 ) ( ON ?auto_627977 ?auto_627976 ) ( ON ?auto_627978 ?auto_627977 ) ( ON ?auto_627979 ?auto_627978 ) ( ON ?auto_627980 ?auto_627979 ) ( not ( = ?auto_627976 ?auto_627977 ) ) ( not ( = ?auto_627976 ?auto_627978 ) ) ( not ( = ?auto_627976 ?auto_627979 ) ) ( not ( = ?auto_627976 ?auto_627980 ) ) ( not ( = ?auto_627976 ?auto_627981 ) ) ( not ( = ?auto_627976 ?auto_627982 ) ) ( not ( = ?auto_627977 ?auto_627978 ) ) ( not ( = ?auto_627977 ?auto_627979 ) ) ( not ( = ?auto_627977 ?auto_627980 ) ) ( not ( = ?auto_627977 ?auto_627981 ) ) ( not ( = ?auto_627977 ?auto_627982 ) ) ( not ( = ?auto_627978 ?auto_627979 ) ) ( not ( = ?auto_627978 ?auto_627980 ) ) ( not ( = ?auto_627978 ?auto_627981 ) ) ( not ( = ?auto_627978 ?auto_627982 ) ) ( not ( = ?auto_627979 ?auto_627980 ) ) ( not ( = ?auto_627979 ?auto_627981 ) ) ( not ( = ?auto_627979 ?auto_627982 ) ) ( not ( = ?auto_627980 ?auto_627981 ) ) ( not ( = ?auto_627980 ?auto_627982 ) ) ( not ( = ?auto_627981 ?auto_627982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_627981 ?auto_627982 )
      ( !STACK ?auto_627981 ?auto_627980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_628002 - BLOCK
      ?auto_628003 - BLOCK
      ?auto_628004 - BLOCK
      ?auto_628005 - BLOCK
      ?auto_628006 - BLOCK
      ?auto_628007 - BLOCK
    )
    :vars
    (
      ?auto_628008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628007 ?auto_628008 ) ( ON-TABLE ?auto_628002 ) ( ON ?auto_628003 ?auto_628002 ) ( ON ?auto_628004 ?auto_628003 ) ( ON ?auto_628005 ?auto_628004 ) ( not ( = ?auto_628002 ?auto_628003 ) ) ( not ( = ?auto_628002 ?auto_628004 ) ) ( not ( = ?auto_628002 ?auto_628005 ) ) ( not ( = ?auto_628002 ?auto_628006 ) ) ( not ( = ?auto_628002 ?auto_628007 ) ) ( not ( = ?auto_628002 ?auto_628008 ) ) ( not ( = ?auto_628003 ?auto_628004 ) ) ( not ( = ?auto_628003 ?auto_628005 ) ) ( not ( = ?auto_628003 ?auto_628006 ) ) ( not ( = ?auto_628003 ?auto_628007 ) ) ( not ( = ?auto_628003 ?auto_628008 ) ) ( not ( = ?auto_628004 ?auto_628005 ) ) ( not ( = ?auto_628004 ?auto_628006 ) ) ( not ( = ?auto_628004 ?auto_628007 ) ) ( not ( = ?auto_628004 ?auto_628008 ) ) ( not ( = ?auto_628005 ?auto_628006 ) ) ( not ( = ?auto_628005 ?auto_628007 ) ) ( not ( = ?auto_628005 ?auto_628008 ) ) ( not ( = ?auto_628006 ?auto_628007 ) ) ( not ( = ?auto_628006 ?auto_628008 ) ) ( not ( = ?auto_628007 ?auto_628008 ) ) ( CLEAR ?auto_628005 ) ( ON ?auto_628006 ?auto_628007 ) ( CLEAR ?auto_628006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_628002 ?auto_628003 ?auto_628004 ?auto_628005 ?auto_628006 )
      ( MAKE-6PILE ?auto_628002 ?auto_628003 ?auto_628004 ?auto_628005 ?auto_628006 ?auto_628007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_628028 - BLOCK
      ?auto_628029 - BLOCK
      ?auto_628030 - BLOCK
      ?auto_628031 - BLOCK
      ?auto_628032 - BLOCK
      ?auto_628033 - BLOCK
    )
    :vars
    (
      ?auto_628034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628033 ?auto_628034 ) ( ON-TABLE ?auto_628028 ) ( ON ?auto_628029 ?auto_628028 ) ( ON ?auto_628030 ?auto_628029 ) ( not ( = ?auto_628028 ?auto_628029 ) ) ( not ( = ?auto_628028 ?auto_628030 ) ) ( not ( = ?auto_628028 ?auto_628031 ) ) ( not ( = ?auto_628028 ?auto_628032 ) ) ( not ( = ?auto_628028 ?auto_628033 ) ) ( not ( = ?auto_628028 ?auto_628034 ) ) ( not ( = ?auto_628029 ?auto_628030 ) ) ( not ( = ?auto_628029 ?auto_628031 ) ) ( not ( = ?auto_628029 ?auto_628032 ) ) ( not ( = ?auto_628029 ?auto_628033 ) ) ( not ( = ?auto_628029 ?auto_628034 ) ) ( not ( = ?auto_628030 ?auto_628031 ) ) ( not ( = ?auto_628030 ?auto_628032 ) ) ( not ( = ?auto_628030 ?auto_628033 ) ) ( not ( = ?auto_628030 ?auto_628034 ) ) ( not ( = ?auto_628031 ?auto_628032 ) ) ( not ( = ?auto_628031 ?auto_628033 ) ) ( not ( = ?auto_628031 ?auto_628034 ) ) ( not ( = ?auto_628032 ?auto_628033 ) ) ( not ( = ?auto_628032 ?auto_628034 ) ) ( not ( = ?auto_628033 ?auto_628034 ) ) ( ON ?auto_628032 ?auto_628033 ) ( CLEAR ?auto_628030 ) ( ON ?auto_628031 ?auto_628032 ) ( CLEAR ?auto_628031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_628028 ?auto_628029 ?auto_628030 ?auto_628031 )
      ( MAKE-6PILE ?auto_628028 ?auto_628029 ?auto_628030 ?auto_628031 ?auto_628032 ?auto_628033 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_628054 - BLOCK
      ?auto_628055 - BLOCK
      ?auto_628056 - BLOCK
      ?auto_628057 - BLOCK
      ?auto_628058 - BLOCK
      ?auto_628059 - BLOCK
    )
    :vars
    (
      ?auto_628060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628059 ?auto_628060 ) ( ON-TABLE ?auto_628054 ) ( ON ?auto_628055 ?auto_628054 ) ( not ( = ?auto_628054 ?auto_628055 ) ) ( not ( = ?auto_628054 ?auto_628056 ) ) ( not ( = ?auto_628054 ?auto_628057 ) ) ( not ( = ?auto_628054 ?auto_628058 ) ) ( not ( = ?auto_628054 ?auto_628059 ) ) ( not ( = ?auto_628054 ?auto_628060 ) ) ( not ( = ?auto_628055 ?auto_628056 ) ) ( not ( = ?auto_628055 ?auto_628057 ) ) ( not ( = ?auto_628055 ?auto_628058 ) ) ( not ( = ?auto_628055 ?auto_628059 ) ) ( not ( = ?auto_628055 ?auto_628060 ) ) ( not ( = ?auto_628056 ?auto_628057 ) ) ( not ( = ?auto_628056 ?auto_628058 ) ) ( not ( = ?auto_628056 ?auto_628059 ) ) ( not ( = ?auto_628056 ?auto_628060 ) ) ( not ( = ?auto_628057 ?auto_628058 ) ) ( not ( = ?auto_628057 ?auto_628059 ) ) ( not ( = ?auto_628057 ?auto_628060 ) ) ( not ( = ?auto_628058 ?auto_628059 ) ) ( not ( = ?auto_628058 ?auto_628060 ) ) ( not ( = ?auto_628059 ?auto_628060 ) ) ( ON ?auto_628058 ?auto_628059 ) ( ON ?auto_628057 ?auto_628058 ) ( CLEAR ?auto_628055 ) ( ON ?auto_628056 ?auto_628057 ) ( CLEAR ?auto_628056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_628054 ?auto_628055 ?auto_628056 )
      ( MAKE-6PILE ?auto_628054 ?auto_628055 ?auto_628056 ?auto_628057 ?auto_628058 ?auto_628059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_628080 - BLOCK
      ?auto_628081 - BLOCK
      ?auto_628082 - BLOCK
      ?auto_628083 - BLOCK
      ?auto_628084 - BLOCK
      ?auto_628085 - BLOCK
    )
    :vars
    (
      ?auto_628086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628085 ?auto_628086 ) ( ON-TABLE ?auto_628080 ) ( not ( = ?auto_628080 ?auto_628081 ) ) ( not ( = ?auto_628080 ?auto_628082 ) ) ( not ( = ?auto_628080 ?auto_628083 ) ) ( not ( = ?auto_628080 ?auto_628084 ) ) ( not ( = ?auto_628080 ?auto_628085 ) ) ( not ( = ?auto_628080 ?auto_628086 ) ) ( not ( = ?auto_628081 ?auto_628082 ) ) ( not ( = ?auto_628081 ?auto_628083 ) ) ( not ( = ?auto_628081 ?auto_628084 ) ) ( not ( = ?auto_628081 ?auto_628085 ) ) ( not ( = ?auto_628081 ?auto_628086 ) ) ( not ( = ?auto_628082 ?auto_628083 ) ) ( not ( = ?auto_628082 ?auto_628084 ) ) ( not ( = ?auto_628082 ?auto_628085 ) ) ( not ( = ?auto_628082 ?auto_628086 ) ) ( not ( = ?auto_628083 ?auto_628084 ) ) ( not ( = ?auto_628083 ?auto_628085 ) ) ( not ( = ?auto_628083 ?auto_628086 ) ) ( not ( = ?auto_628084 ?auto_628085 ) ) ( not ( = ?auto_628084 ?auto_628086 ) ) ( not ( = ?auto_628085 ?auto_628086 ) ) ( ON ?auto_628084 ?auto_628085 ) ( ON ?auto_628083 ?auto_628084 ) ( ON ?auto_628082 ?auto_628083 ) ( CLEAR ?auto_628080 ) ( ON ?auto_628081 ?auto_628082 ) ( CLEAR ?auto_628081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_628080 ?auto_628081 )
      ( MAKE-6PILE ?auto_628080 ?auto_628081 ?auto_628082 ?auto_628083 ?auto_628084 ?auto_628085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_628106 - BLOCK
      ?auto_628107 - BLOCK
      ?auto_628108 - BLOCK
      ?auto_628109 - BLOCK
      ?auto_628110 - BLOCK
      ?auto_628111 - BLOCK
    )
    :vars
    (
      ?auto_628112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628111 ?auto_628112 ) ( not ( = ?auto_628106 ?auto_628107 ) ) ( not ( = ?auto_628106 ?auto_628108 ) ) ( not ( = ?auto_628106 ?auto_628109 ) ) ( not ( = ?auto_628106 ?auto_628110 ) ) ( not ( = ?auto_628106 ?auto_628111 ) ) ( not ( = ?auto_628106 ?auto_628112 ) ) ( not ( = ?auto_628107 ?auto_628108 ) ) ( not ( = ?auto_628107 ?auto_628109 ) ) ( not ( = ?auto_628107 ?auto_628110 ) ) ( not ( = ?auto_628107 ?auto_628111 ) ) ( not ( = ?auto_628107 ?auto_628112 ) ) ( not ( = ?auto_628108 ?auto_628109 ) ) ( not ( = ?auto_628108 ?auto_628110 ) ) ( not ( = ?auto_628108 ?auto_628111 ) ) ( not ( = ?auto_628108 ?auto_628112 ) ) ( not ( = ?auto_628109 ?auto_628110 ) ) ( not ( = ?auto_628109 ?auto_628111 ) ) ( not ( = ?auto_628109 ?auto_628112 ) ) ( not ( = ?auto_628110 ?auto_628111 ) ) ( not ( = ?auto_628110 ?auto_628112 ) ) ( not ( = ?auto_628111 ?auto_628112 ) ) ( ON ?auto_628110 ?auto_628111 ) ( ON ?auto_628109 ?auto_628110 ) ( ON ?auto_628108 ?auto_628109 ) ( ON ?auto_628107 ?auto_628108 ) ( ON ?auto_628106 ?auto_628107 ) ( CLEAR ?auto_628106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_628106 )
      ( MAKE-6PILE ?auto_628106 ?auto_628107 ?auto_628108 ?auto_628109 ?auto_628110 ?auto_628111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628133 - BLOCK
      ?auto_628134 - BLOCK
      ?auto_628135 - BLOCK
      ?auto_628136 - BLOCK
      ?auto_628137 - BLOCK
      ?auto_628138 - BLOCK
      ?auto_628139 - BLOCK
    )
    :vars
    (
      ?auto_628140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_628138 ) ( ON ?auto_628139 ?auto_628140 ) ( CLEAR ?auto_628139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_628133 ) ( ON ?auto_628134 ?auto_628133 ) ( ON ?auto_628135 ?auto_628134 ) ( ON ?auto_628136 ?auto_628135 ) ( ON ?auto_628137 ?auto_628136 ) ( ON ?auto_628138 ?auto_628137 ) ( not ( = ?auto_628133 ?auto_628134 ) ) ( not ( = ?auto_628133 ?auto_628135 ) ) ( not ( = ?auto_628133 ?auto_628136 ) ) ( not ( = ?auto_628133 ?auto_628137 ) ) ( not ( = ?auto_628133 ?auto_628138 ) ) ( not ( = ?auto_628133 ?auto_628139 ) ) ( not ( = ?auto_628133 ?auto_628140 ) ) ( not ( = ?auto_628134 ?auto_628135 ) ) ( not ( = ?auto_628134 ?auto_628136 ) ) ( not ( = ?auto_628134 ?auto_628137 ) ) ( not ( = ?auto_628134 ?auto_628138 ) ) ( not ( = ?auto_628134 ?auto_628139 ) ) ( not ( = ?auto_628134 ?auto_628140 ) ) ( not ( = ?auto_628135 ?auto_628136 ) ) ( not ( = ?auto_628135 ?auto_628137 ) ) ( not ( = ?auto_628135 ?auto_628138 ) ) ( not ( = ?auto_628135 ?auto_628139 ) ) ( not ( = ?auto_628135 ?auto_628140 ) ) ( not ( = ?auto_628136 ?auto_628137 ) ) ( not ( = ?auto_628136 ?auto_628138 ) ) ( not ( = ?auto_628136 ?auto_628139 ) ) ( not ( = ?auto_628136 ?auto_628140 ) ) ( not ( = ?auto_628137 ?auto_628138 ) ) ( not ( = ?auto_628137 ?auto_628139 ) ) ( not ( = ?auto_628137 ?auto_628140 ) ) ( not ( = ?auto_628138 ?auto_628139 ) ) ( not ( = ?auto_628138 ?auto_628140 ) ) ( not ( = ?auto_628139 ?auto_628140 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_628139 ?auto_628140 )
      ( !STACK ?auto_628139 ?auto_628138 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628163 - BLOCK
      ?auto_628164 - BLOCK
      ?auto_628165 - BLOCK
      ?auto_628166 - BLOCK
      ?auto_628167 - BLOCK
      ?auto_628168 - BLOCK
      ?auto_628169 - BLOCK
    )
    :vars
    (
      ?auto_628170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628169 ?auto_628170 ) ( ON-TABLE ?auto_628163 ) ( ON ?auto_628164 ?auto_628163 ) ( ON ?auto_628165 ?auto_628164 ) ( ON ?auto_628166 ?auto_628165 ) ( ON ?auto_628167 ?auto_628166 ) ( not ( = ?auto_628163 ?auto_628164 ) ) ( not ( = ?auto_628163 ?auto_628165 ) ) ( not ( = ?auto_628163 ?auto_628166 ) ) ( not ( = ?auto_628163 ?auto_628167 ) ) ( not ( = ?auto_628163 ?auto_628168 ) ) ( not ( = ?auto_628163 ?auto_628169 ) ) ( not ( = ?auto_628163 ?auto_628170 ) ) ( not ( = ?auto_628164 ?auto_628165 ) ) ( not ( = ?auto_628164 ?auto_628166 ) ) ( not ( = ?auto_628164 ?auto_628167 ) ) ( not ( = ?auto_628164 ?auto_628168 ) ) ( not ( = ?auto_628164 ?auto_628169 ) ) ( not ( = ?auto_628164 ?auto_628170 ) ) ( not ( = ?auto_628165 ?auto_628166 ) ) ( not ( = ?auto_628165 ?auto_628167 ) ) ( not ( = ?auto_628165 ?auto_628168 ) ) ( not ( = ?auto_628165 ?auto_628169 ) ) ( not ( = ?auto_628165 ?auto_628170 ) ) ( not ( = ?auto_628166 ?auto_628167 ) ) ( not ( = ?auto_628166 ?auto_628168 ) ) ( not ( = ?auto_628166 ?auto_628169 ) ) ( not ( = ?auto_628166 ?auto_628170 ) ) ( not ( = ?auto_628167 ?auto_628168 ) ) ( not ( = ?auto_628167 ?auto_628169 ) ) ( not ( = ?auto_628167 ?auto_628170 ) ) ( not ( = ?auto_628168 ?auto_628169 ) ) ( not ( = ?auto_628168 ?auto_628170 ) ) ( not ( = ?auto_628169 ?auto_628170 ) ) ( CLEAR ?auto_628167 ) ( ON ?auto_628168 ?auto_628169 ) ( CLEAR ?auto_628168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_628163 ?auto_628164 ?auto_628165 ?auto_628166 ?auto_628167 ?auto_628168 )
      ( MAKE-7PILE ?auto_628163 ?auto_628164 ?auto_628165 ?auto_628166 ?auto_628167 ?auto_628168 ?auto_628169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628193 - BLOCK
      ?auto_628194 - BLOCK
      ?auto_628195 - BLOCK
      ?auto_628196 - BLOCK
      ?auto_628197 - BLOCK
      ?auto_628198 - BLOCK
      ?auto_628199 - BLOCK
    )
    :vars
    (
      ?auto_628200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628199 ?auto_628200 ) ( ON-TABLE ?auto_628193 ) ( ON ?auto_628194 ?auto_628193 ) ( ON ?auto_628195 ?auto_628194 ) ( ON ?auto_628196 ?auto_628195 ) ( not ( = ?auto_628193 ?auto_628194 ) ) ( not ( = ?auto_628193 ?auto_628195 ) ) ( not ( = ?auto_628193 ?auto_628196 ) ) ( not ( = ?auto_628193 ?auto_628197 ) ) ( not ( = ?auto_628193 ?auto_628198 ) ) ( not ( = ?auto_628193 ?auto_628199 ) ) ( not ( = ?auto_628193 ?auto_628200 ) ) ( not ( = ?auto_628194 ?auto_628195 ) ) ( not ( = ?auto_628194 ?auto_628196 ) ) ( not ( = ?auto_628194 ?auto_628197 ) ) ( not ( = ?auto_628194 ?auto_628198 ) ) ( not ( = ?auto_628194 ?auto_628199 ) ) ( not ( = ?auto_628194 ?auto_628200 ) ) ( not ( = ?auto_628195 ?auto_628196 ) ) ( not ( = ?auto_628195 ?auto_628197 ) ) ( not ( = ?auto_628195 ?auto_628198 ) ) ( not ( = ?auto_628195 ?auto_628199 ) ) ( not ( = ?auto_628195 ?auto_628200 ) ) ( not ( = ?auto_628196 ?auto_628197 ) ) ( not ( = ?auto_628196 ?auto_628198 ) ) ( not ( = ?auto_628196 ?auto_628199 ) ) ( not ( = ?auto_628196 ?auto_628200 ) ) ( not ( = ?auto_628197 ?auto_628198 ) ) ( not ( = ?auto_628197 ?auto_628199 ) ) ( not ( = ?auto_628197 ?auto_628200 ) ) ( not ( = ?auto_628198 ?auto_628199 ) ) ( not ( = ?auto_628198 ?auto_628200 ) ) ( not ( = ?auto_628199 ?auto_628200 ) ) ( ON ?auto_628198 ?auto_628199 ) ( CLEAR ?auto_628196 ) ( ON ?auto_628197 ?auto_628198 ) ( CLEAR ?auto_628197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_628193 ?auto_628194 ?auto_628195 ?auto_628196 ?auto_628197 )
      ( MAKE-7PILE ?auto_628193 ?auto_628194 ?auto_628195 ?auto_628196 ?auto_628197 ?auto_628198 ?auto_628199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628223 - BLOCK
      ?auto_628224 - BLOCK
      ?auto_628225 - BLOCK
      ?auto_628226 - BLOCK
      ?auto_628227 - BLOCK
      ?auto_628228 - BLOCK
      ?auto_628229 - BLOCK
    )
    :vars
    (
      ?auto_628230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628229 ?auto_628230 ) ( ON-TABLE ?auto_628223 ) ( ON ?auto_628224 ?auto_628223 ) ( ON ?auto_628225 ?auto_628224 ) ( not ( = ?auto_628223 ?auto_628224 ) ) ( not ( = ?auto_628223 ?auto_628225 ) ) ( not ( = ?auto_628223 ?auto_628226 ) ) ( not ( = ?auto_628223 ?auto_628227 ) ) ( not ( = ?auto_628223 ?auto_628228 ) ) ( not ( = ?auto_628223 ?auto_628229 ) ) ( not ( = ?auto_628223 ?auto_628230 ) ) ( not ( = ?auto_628224 ?auto_628225 ) ) ( not ( = ?auto_628224 ?auto_628226 ) ) ( not ( = ?auto_628224 ?auto_628227 ) ) ( not ( = ?auto_628224 ?auto_628228 ) ) ( not ( = ?auto_628224 ?auto_628229 ) ) ( not ( = ?auto_628224 ?auto_628230 ) ) ( not ( = ?auto_628225 ?auto_628226 ) ) ( not ( = ?auto_628225 ?auto_628227 ) ) ( not ( = ?auto_628225 ?auto_628228 ) ) ( not ( = ?auto_628225 ?auto_628229 ) ) ( not ( = ?auto_628225 ?auto_628230 ) ) ( not ( = ?auto_628226 ?auto_628227 ) ) ( not ( = ?auto_628226 ?auto_628228 ) ) ( not ( = ?auto_628226 ?auto_628229 ) ) ( not ( = ?auto_628226 ?auto_628230 ) ) ( not ( = ?auto_628227 ?auto_628228 ) ) ( not ( = ?auto_628227 ?auto_628229 ) ) ( not ( = ?auto_628227 ?auto_628230 ) ) ( not ( = ?auto_628228 ?auto_628229 ) ) ( not ( = ?auto_628228 ?auto_628230 ) ) ( not ( = ?auto_628229 ?auto_628230 ) ) ( ON ?auto_628228 ?auto_628229 ) ( ON ?auto_628227 ?auto_628228 ) ( CLEAR ?auto_628225 ) ( ON ?auto_628226 ?auto_628227 ) ( CLEAR ?auto_628226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_628223 ?auto_628224 ?auto_628225 ?auto_628226 )
      ( MAKE-7PILE ?auto_628223 ?auto_628224 ?auto_628225 ?auto_628226 ?auto_628227 ?auto_628228 ?auto_628229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628253 - BLOCK
      ?auto_628254 - BLOCK
      ?auto_628255 - BLOCK
      ?auto_628256 - BLOCK
      ?auto_628257 - BLOCK
      ?auto_628258 - BLOCK
      ?auto_628259 - BLOCK
    )
    :vars
    (
      ?auto_628260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628259 ?auto_628260 ) ( ON-TABLE ?auto_628253 ) ( ON ?auto_628254 ?auto_628253 ) ( not ( = ?auto_628253 ?auto_628254 ) ) ( not ( = ?auto_628253 ?auto_628255 ) ) ( not ( = ?auto_628253 ?auto_628256 ) ) ( not ( = ?auto_628253 ?auto_628257 ) ) ( not ( = ?auto_628253 ?auto_628258 ) ) ( not ( = ?auto_628253 ?auto_628259 ) ) ( not ( = ?auto_628253 ?auto_628260 ) ) ( not ( = ?auto_628254 ?auto_628255 ) ) ( not ( = ?auto_628254 ?auto_628256 ) ) ( not ( = ?auto_628254 ?auto_628257 ) ) ( not ( = ?auto_628254 ?auto_628258 ) ) ( not ( = ?auto_628254 ?auto_628259 ) ) ( not ( = ?auto_628254 ?auto_628260 ) ) ( not ( = ?auto_628255 ?auto_628256 ) ) ( not ( = ?auto_628255 ?auto_628257 ) ) ( not ( = ?auto_628255 ?auto_628258 ) ) ( not ( = ?auto_628255 ?auto_628259 ) ) ( not ( = ?auto_628255 ?auto_628260 ) ) ( not ( = ?auto_628256 ?auto_628257 ) ) ( not ( = ?auto_628256 ?auto_628258 ) ) ( not ( = ?auto_628256 ?auto_628259 ) ) ( not ( = ?auto_628256 ?auto_628260 ) ) ( not ( = ?auto_628257 ?auto_628258 ) ) ( not ( = ?auto_628257 ?auto_628259 ) ) ( not ( = ?auto_628257 ?auto_628260 ) ) ( not ( = ?auto_628258 ?auto_628259 ) ) ( not ( = ?auto_628258 ?auto_628260 ) ) ( not ( = ?auto_628259 ?auto_628260 ) ) ( ON ?auto_628258 ?auto_628259 ) ( ON ?auto_628257 ?auto_628258 ) ( ON ?auto_628256 ?auto_628257 ) ( CLEAR ?auto_628254 ) ( ON ?auto_628255 ?auto_628256 ) ( CLEAR ?auto_628255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_628253 ?auto_628254 ?auto_628255 )
      ( MAKE-7PILE ?auto_628253 ?auto_628254 ?auto_628255 ?auto_628256 ?auto_628257 ?auto_628258 ?auto_628259 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628283 - BLOCK
      ?auto_628284 - BLOCK
      ?auto_628285 - BLOCK
      ?auto_628286 - BLOCK
      ?auto_628287 - BLOCK
      ?auto_628288 - BLOCK
      ?auto_628289 - BLOCK
    )
    :vars
    (
      ?auto_628290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628289 ?auto_628290 ) ( ON-TABLE ?auto_628283 ) ( not ( = ?auto_628283 ?auto_628284 ) ) ( not ( = ?auto_628283 ?auto_628285 ) ) ( not ( = ?auto_628283 ?auto_628286 ) ) ( not ( = ?auto_628283 ?auto_628287 ) ) ( not ( = ?auto_628283 ?auto_628288 ) ) ( not ( = ?auto_628283 ?auto_628289 ) ) ( not ( = ?auto_628283 ?auto_628290 ) ) ( not ( = ?auto_628284 ?auto_628285 ) ) ( not ( = ?auto_628284 ?auto_628286 ) ) ( not ( = ?auto_628284 ?auto_628287 ) ) ( not ( = ?auto_628284 ?auto_628288 ) ) ( not ( = ?auto_628284 ?auto_628289 ) ) ( not ( = ?auto_628284 ?auto_628290 ) ) ( not ( = ?auto_628285 ?auto_628286 ) ) ( not ( = ?auto_628285 ?auto_628287 ) ) ( not ( = ?auto_628285 ?auto_628288 ) ) ( not ( = ?auto_628285 ?auto_628289 ) ) ( not ( = ?auto_628285 ?auto_628290 ) ) ( not ( = ?auto_628286 ?auto_628287 ) ) ( not ( = ?auto_628286 ?auto_628288 ) ) ( not ( = ?auto_628286 ?auto_628289 ) ) ( not ( = ?auto_628286 ?auto_628290 ) ) ( not ( = ?auto_628287 ?auto_628288 ) ) ( not ( = ?auto_628287 ?auto_628289 ) ) ( not ( = ?auto_628287 ?auto_628290 ) ) ( not ( = ?auto_628288 ?auto_628289 ) ) ( not ( = ?auto_628288 ?auto_628290 ) ) ( not ( = ?auto_628289 ?auto_628290 ) ) ( ON ?auto_628288 ?auto_628289 ) ( ON ?auto_628287 ?auto_628288 ) ( ON ?auto_628286 ?auto_628287 ) ( ON ?auto_628285 ?auto_628286 ) ( CLEAR ?auto_628283 ) ( ON ?auto_628284 ?auto_628285 ) ( CLEAR ?auto_628284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_628283 ?auto_628284 )
      ( MAKE-7PILE ?auto_628283 ?auto_628284 ?auto_628285 ?auto_628286 ?auto_628287 ?auto_628288 ?auto_628289 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_628313 - BLOCK
      ?auto_628314 - BLOCK
      ?auto_628315 - BLOCK
      ?auto_628316 - BLOCK
      ?auto_628317 - BLOCK
      ?auto_628318 - BLOCK
      ?auto_628319 - BLOCK
    )
    :vars
    (
      ?auto_628320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628319 ?auto_628320 ) ( not ( = ?auto_628313 ?auto_628314 ) ) ( not ( = ?auto_628313 ?auto_628315 ) ) ( not ( = ?auto_628313 ?auto_628316 ) ) ( not ( = ?auto_628313 ?auto_628317 ) ) ( not ( = ?auto_628313 ?auto_628318 ) ) ( not ( = ?auto_628313 ?auto_628319 ) ) ( not ( = ?auto_628313 ?auto_628320 ) ) ( not ( = ?auto_628314 ?auto_628315 ) ) ( not ( = ?auto_628314 ?auto_628316 ) ) ( not ( = ?auto_628314 ?auto_628317 ) ) ( not ( = ?auto_628314 ?auto_628318 ) ) ( not ( = ?auto_628314 ?auto_628319 ) ) ( not ( = ?auto_628314 ?auto_628320 ) ) ( not ( = ?auto_628315 ?auto_628316 ) ) ( not ( = ?auto_628315 ?auto_628317 ) ) ( not ( = ?auto_628315 ?auto_628318 ) ) ( not ( = ?auto_628315 ?auto_628319 ) ) ( not ( = ?auto_628315 ?auto_628320 ) ) ( not ( = ?auto_628316 ?auto_628317 ) ) ( not ( = ?auto_628316 ?auto_628318 ) ) ( not ( = ?auto_628316 ?auto_628319 ) ) ( not ( = ?auto_628316 ?auto_628320 ) ) ( not ( = ?auto_628317 ?auto_628318 ) ) ( not ( = ?auto_628317 ?auto_628319 ) ) ( not ( = ?auto_628317 ?auto_628320 ) ) ( not ( = ?auto_628318 ?auto_628319 ) ) ( not ( = ?auto_628318 ?auto_628320 ) ) ( not ( = ?auto_628319 ?auto_628320 ) ) ( ON ?auto_628318 ?auto_628319 ) ( ON ?auto_628317 ?auto_628318 ) ( ON ?auto_628316 ?auto_628317 ) ( ON ?auto_628315 ?auto_628316 ) ( ON ?auto_628314 ?auto_628315 ) ( ON ?auto_628313 ?auto_628314 ) ( CLEAR ?auto_628313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_628313 )
      ( MAKE-7PILE ?auto_628313 ?auto_628314 ?auto_628315 ?auto_628316 ?auto_628317 ?auto_628318 ?auto_628319 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628344 - BLOCK
      ?auto_628345 - BLOCK
      ?auto_628346 - BLOCK
      ?auto_628347 - BLOCK
      ?auto_628348 - BLOCK
      ?auto_628349 - BLOCK
      ?auto_628350 - BLOCK
      ?auto_628351 - BLOCK
    )
    :vars
    (
      ?auto_628352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_628350 ) ( ON ?auto_628351 ?auto_628352 ) ( CLEAR ?auto_628351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_628344 ) ( ON ?auto_628345 ?auto_628344 ) ( ON ?auto_628346 ?auto_628345 ) ( ON ?auto_628347 ?auto_628346 ) ( ON ?auto_628348 ?auto_628347 ) ( ON ?auto_628349 ?auto_628348 ) ( ON ?auto_628350 ?auto_628349 ) ( not ( = ?auto_628344 ?auto_628345 ) ) ( not ( = ?auto_628344 ?auto_628346 ) ) ( not ( = ?auto_628344 ?auto_628347 ) ) ( not ( = ?auto_628344 ?auto_628348 ) ) ( not ( = ?auto_628344 ?auto_628349 ) ) ( not ( = ?auto_628344 ?auto_628350 ) ) ( not ( = ?auto_628344 ?auto_628351 ) ) ( not ( = ?auto_628344 ?auto_628352 ) ) ( not ( = ?auto_628345 ?auto_628346 ) ) ( not ( = ?auto_628345 ?auto_628347 ) ) ( not ( = ?auto_628345 ?auto_628348 ) ) ( not ( = ?auto_628345 ?auto_628349 ) ) ( not ( = ?auto_628345 ?auto_628350 ) ) ( not ( = ?auto_628345 ?auto_628351 ) ) ( not ( = ?auto_628345 ?auto_628352 ) ) ( not ( = ?auto_628346 ?auto_628347 ) ) ( not ( = ?auto_628346 ?auto_628348 ) ) ( not ( = ?auto_628346 ?auto_628349 ) ) ( not ( = ?auto_628346 ?auto_628350 ) ) ( not ( = ?auto_628346 ?auto_628351 ) ) ( not ( = ?auto_628346 ?auto_628352 ) ) ( not ( = ?auto_628347 ?auto_628348 ) ) ( not ( = ?auto_628347 ?auto_628349 ) ) ( not ( = ?auto_628347 ?auto_628350 ) ) ( not ( = ?auto_628347 ?auto_628351 ) ) ( not ( = ?auto_628347 ?auto_628352 ) ) ( not ( = ?auto_628348 ?auto_628349 ) ) ( not ( = ?auto_628348 ?auto_628350 ) ) ( not ( = ?auto_628348 ?auto_628351 ) ) ( not ( = ?auto_628348 ?auto_628352 ) ) ( not ( = ?auto_628349 ?auto_628350 ) ) ( not ( = ?auto_628349 ?auto_628351 ) ) ( not ( = ?auto_628349 ?auto_628352 ) ) ( not ( = ?auto_628350 ?auto_628351 ) ) ( not ( = ?auto_628350 ?auto_628352 ) ) ( not ( = ?auto_628351 ?auto_628352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_628351 ?auto_628352 )
      ( !STACK ?auto_628351 ?auto_628350 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628378 - BLOCK
      ?auto_628379 - BLOCK
      ?auto_628380 - BLOCK
      ?auto_628381 - BLOCK
      ?auto_628382 - BLOCK
      ?auto_628383 - BLOCK
      ?auto_628384 - BLOCK
      ?auto_628385 - BLOCK
    )
    :vars
    (
      ?auto_628386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628385 ?auto_628386 ) ( ON-TABLE ?auto_628378 ) ( ON ?auto_628379 ?auto_628378 ) ( ON ?auto_628380 ?auto_628379 ) ( ON ?auto_628381 ?auto_628380 ) ( ON ?auto_628382 ?auto_628381 ) ( ON ?auto_628383 ?auto_628382 ) ( not ( = ?auto_628378 ?auto_628379 ) ) ( not ( = ?auto_628378 ?auto_628380 ) ) ( not ( = ?auto_628378 ?auto_628381 ) ) ( not ( = ?auto_628378 ?auto_628382 ) ) ( not ( = ?auto_628378 ?auto_628383 ) ) ( not ( = ?auto_628378 ?auto_628384 ) ) ( not ( = ?auto_628378 ?auto_628385 ) ) ( not ( = ?auto_628378 ?auto_628386 ) ) ( not ( = ?auto_628379 ?auto_628380 ) ) ( not ( = ?auto_628379 ?auto_628381 ) ) ( not ( = ?auto_628379 ?auto_628382 ) ) ( not ( = ?auto_628379 ?auto_628383 ) ) ( not ( = ?auto_628379 ?auto_628384 ) ) ( not ( = ?auto_628379 ?auto_628385 ) ) ( not ( = ?auto_628379 ?auto_628386 ) ) ( not ( = ?auto_628380 ?auto_628381 ) ) ( not ( = ?auto_628380 ?auto_628382 ) ) ( not ( = ?auto_628380 ?auto_628383 ) ) ( not ( = ?auto_628380 ?auto_628384 ) ) ( not ( = ?auto_628380 ?auto_628385 ) ) ( not ( = ?auto_628380 ?auto_628386 ) ) ( not ( = ?auto_628381 ?auto_628382 ) ) ( not ( = ?auto_628381 ?auto_628383 ) ) ( not ( = ?auto_628381 ?auto_628384 ) ) ( not ( = ?auto_628381 ?auto_628385 ) ) ( not ( = ?auto_628381 ?auto_628386 ) ) ( not ( = ?auto_628382 ?auto_628383 ) ) ( not ( = ?auto_628382 ?auto_628384 ) ) ( not ( = ?auto_628382 ?auto_628385 ) ) ( not ( = ?auto_628382 ?auto_628386 ) ) ( not ( = ?auto_628383 ?auto_628384 ) ) ( not ( = ?auto_628383 ?auto_628385 ) ) ( not ( = ?auto_628383 ?auto_628386 ) ) ( not ( = ?auto_628384 ?auto_628385 ) ) ( not ( = ?auto_628384 ?auto_628386 ) ) ( not ( = ?auto_628385 ?auto_628386 ) ) ( CLEAR ?auto_628383 ) ( ON ?auto_628384 ?auto_628385 ) ( CLEAR ?auto_628384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_628378 ?auto_628379 ?auto_628380 ?auto_628381 ?auto_628382 ?auto_628383 ?auto_628384 )
      ( MAKE-8PILE ?auto_628378 ?auto_628379 ?auto_628380 ?auto_628381 ?auto_628382 ?auto_628383 ?auto_628384 ?auto_628385 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628412 - BLOCK
      ?auto_628413 - BLOCK
      ?auto_628414 - BLOCK
      ?auto_628415 - BLOCK
      ?auto_628416 - BLOCK
      ?auto_628417 - BLOCK
      ?auto_628418 - BLOCK
      ?auto_628419 - BLOCK
    )
    :vars
    (
      ?auto_628420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628419 ?auto_628420 ) ( ON-TABLE ?auto_628412 ) ( ON ?auto_628413 ?auto_628412 ) ( ON ?auto_628414 ?auto_628413 ) ( ON ?auto_628415 ?auto_628414 ) ( ON ?auto_628416 ?auto_628415 ) ( not ( = ?auto_628412 ?auto_628413 ) ) ( not ( = ?auto_628412 ?auto_628414 ) ) ( not ( = ?auto_628412 ?auto_628415 ) ) ( not ( = ?auto_628412 ?auto_628416 ) ) ( not ( = ?auto_628412 ?auto_628417 ) ) ( not ( = ?auto_628412 ?auto_628418 ) ) ( not ( = ?auto_628412 ?auto_628419 ) ) ( not ( = ?auto_628412 ?auto_628420 ) ) ( not ( = ?auto_628413 ?auto_628414 ) ) ( not ( = ?auto_628413 ?auto_628415 ) ) ( not ( = ?auto_628413 ?auto_628416 ) ) ( not ( = ?auto_628413 ?auto_628417 ) ) ( not ( = ?auto_628413 ?auto_628418 ) ) ( not ( = ?auto_628413 ?auto_628419 ) ) ( not ( = ?auto_628413 ?auto_628420 ) ) ( not ( = ?auto_628414 ?auto_628415 ) ) ( not ( = ?auto_628414 ?auto_628416 ) ) ( not ( = ?auto_628414 ?auto_628417 ) ) ( not ( = ?auto_628414 ?auto_628418 ) ) ( not ( = ?auto_628414 ?auto_628419 ) ) ( not ( = ?auto_628414 ?auto_628420 ) ) ( not ( = ?auto_628415 ?auto_628416 ) ) ( not ( = ?auto_628415 ?auto_628417 ) ) ( not ( = ?auto_628415 ?auto_628418 ) ) ( not ( = ?auto_628415 ?auto_628419 ) ) ( not ( = ?auto_628415 ?auto_628420 ) ) ( not ( = ?auto_628416 ?auto_628417 ) ) ( not ( = ?auto_628416 ?auto_628418 ) ) ( not ( = ?auto_628416 ?auto_628419 ) ) ( not ( = ?auto_628416 ?auto_628420 ) ) ( not ( = ?auto_628417 ?auto_628418 ) ) ( not ( = ?auto_628417 ?auto_628419 ) ) ( not ( = ?auto_628417 ?auto_628420 ) ) ( not ( = ?auto_628418 ?auto_628419 ) ) ( not ( = ?auto_628418 ?auto_628420 ) ) ( not ( = ?auto_628419 ?auto_628420 ) ) ( ON ?auto_628418 ?auto_628419 ) ( CLEAR ?auto_628416 ) ( ON ?auto_628417 ?auto_628418 ) ( CLEAR ?auto_628417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_628412 ?auto_628413 ?auto_628414 ?auto_628415 ?auto_628416 ?auto_628417 )
      ( MAKE-8PILE ?auto_628412 ?auto_628413 ?auto_628414 ?auto_628415 ?auto_628416 ?auto_628417 ?auto_628418 ?auto_628419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628446 - BLOCK
      ?auto_628447 - BLOCK
      ?auto_628448 - BLOCK
      ?auto_628449 - BLOCK
      ?auto_628450 - BLOCK
      ?auto_628451 - BLOCK
      ?auto_628452 - BLOCK
      ?auto_628453 - BLOCK
    )
    :vars
    (
      ?auto_628454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628453 ?auto_628454 ) ( ON-TABLE ?auto_628446 ) ( ON ?auto_628447 ?auto_628446 ) ( ON ?auto_628448 ?auto_628447 ) ( ON ?auto_628449 ?auto_628448 ) ( not ( = ?auto_628446 ?auto_628447 ) ) ( not ( = ?auto_628446 ?auto_628448 ) ) ( not ( = ?auto_628446 ?auto_628449 ) ) ( not ( = ?auto_628446 ?auto_628450 ) ) ( not ( = ?auto_628446 ?auto_628451 ) ) ( not ( = ?auto_628446 ?auto_628452 ) ) ( not ( = ?auto_628446 ?auto_628453 ) ) ( not ( = ?auto_628446 ?auto_628454 ) ) ( not ( = ?auto_628447 ?auto_628448 ) ) ( not ( = ?auto_628447 ?auto_628449 ) ) ( not ( = ?auto_628447 ?auto_628450 ) ) ( not ( = ?auto_628447 ?auto_628451 ) ) ( not ( = ?auto_628447 ?auto_628452 ) ) ( not ( = ?auto_628447 ?auto_628453 ) ) ( not ( = ?auto_628447 ?auto_628454 ) ) ( not ( = ?auto_628448 ?auto_628449 ) ) ( not ( = ?auto_628448 ?auto_628450 ) ) ( not ( = ?auto_628448 ?auto_628451 ) ) ( not ( = ?auto_628448 ?auto_628452 ) ) ( not ( = ?auto_628448 ?auto_628453 ) ) ( not ( = ?auto_628448 ?auto_628454 ) ) ( not ( = ?auto_628449 ?auto_628450 ) ) ( not ( = ?auto_628449 ?auto_628451 ) ) ( not ( = ?auto_628449 ?auto_628452 ) ) ( not ( = ?auto_628449 ?auto_628453 ) ) ( not ( = ?auto_628449 ?auto_628454 ) ) ( not ( = ?auto_628450 ?auto_628451 ) ) ( not ( = ?auto_628450 ?auto_628452 ) ) ( not ( = ?auto_628450 ?auto_628453 ) ) ( not ( = ?auto_628450 ?auto_628454 ) ) ( not ( = ?auto_628451 ?auto_628452 ) ) ( not ( = ?auto_628451 ?auto_628453 ) ) ( not ( = ?auto_628451 ?auto_628454 ) ) ( not ( = ?auto_628452 ?auto_628453 ) ) ( not ( = ?auto_628452 ?auto_628454 ) ) ( not ( = ?auto_628453 ?auto_628454 ) ) ( ON ?auto_628452 ?auto_628453 ) ( ON ?auto_628451 ?auto_628452 ) ( CLEAR ?auto_628449 ) ( ON ?auto_628450 ?auto_628451 ) ( CLEAR ?auto_628450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_628446 ?auto_628447 ?auto_628448 ?auto_628449 ?auto_628450 )
      ( MAKE-8PILE ?auto_628446 ?auto_628447 ?auto_628448 ?auto_628449 ?auto_628450 ?auto_628451 ?auto_628452 ?auto_628453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628480 - BLOCK
      ?auto_628481 - BLOCK
      ?auto_628482 - BLOCK
      ?auto_628483 - BLOCK
      ?auto_628484 - BLOCK
      ?auto_628485 - BLOCK
      ?auto_628486 - BLOCK
      ?auto_628487 - BLOCK
    )
    :vars
    (
      ?auto_628488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628487 ?auto_628488 ) ( ON-TABLE ?auto_628480 ) ( ON ?auto_628481 ?auto_628480 ) ( ON ?auto_628482 ?auto_628481 ) ( not ( = ?auto_628480 ?auto_628481 ) ) ( not ( = ?auto_628480 ?auto_628482 ) ) ( not ( = ?auto_628480 ?auto_628483 ) ) ( not ( = ?auto_628480 ?auto_628484 ) ) ( not ( = ?auto_628480 ?auto_628485 ) ) ( not ( = ?auto_628480 ?auto_628486 ) ) ( not ( = ?auto_628480 ?auto_628487 ) ) ( not ( = ?auto_628480 ?auto_628488 ) ) ( not ( = ?auto_628481 ?auto_628482 ) ) ( not ( = ?auto_628481 ?auto_628483 ) ) ( not ( = ?auto_628481 ?auto_628484 ) ) ( not ( = ?auto_628481 ?auto_628485 ) ) ( not ( = ?auto_628481 ?auto_628486 ) ) ( not ( = ?auto_628481 ?auto_628487 ) ) ( not ( = ?auto_628481 ?auto_628488 ) ) ( not ( = ?auto_628482 ?auto_628483 ) ) ( not ( = ?auto_628482 ?auto_628484 ) ) ( not ( = ?auto_628482 ?auto_628485 ) ) ( not ( = ?auto_628482 ?auto_628486 ) ) ( not ( = ?auto_628482 ?auto_628487 ) ) ( not ( = ?auto_628482 ?auto_628488 ) ) ( not ( = ?auto_628483 ?auto_628484 ) ) ( not ( = ?auto_628483 ?auto_628485 ) ) ( not ( = ?auto_628483 ?auto_628486 ) ) ( not ( = ?auto_628483 ?auto_628487 ) ) ( not ( = ?auto_628483 ?auto_628488 ) ) ( not ( = ?auto_628484 ?auto_628485 ) ) ( not ( = ?auto_628484 ?auto_628486 ) ) ( not ( = ?auto_628484 ?auto_628487 ) ) ( not ( = ?auto_628484 ?auto_628488 ) ) ( not ( = ?auto_628485 ?auto_628486 ) ) ( not ( = ?auto_628485 ?auto_628487 ) ) ( not ( = ?auto_628485 ?auto_628488 ) ) ( not ( = ?auto_628486 ?auto_628487 ) ) ( not ( = ?auto_628486 ?auto_628488 ) ) ( not ( = ?auto_628487 ?auto_628488 ) ) ( ON ?auto_628486 ?auto_628487 ) ( ON ?auto_628485 ?auto_628486 ) ( ON ?auto_628484 ?auto_628485 ) ( CLEAR ?auto_628482 ) ( ON ?auto_628483 ?auto_628484 ) ( CLEAR ?auto_628483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_628480 ?auto_628481 ?auto_628482 ?auto_628483 )
      ( MAKE-8PILE ?auto_628480 ?auto_628481 ?auto_628482 ?auto_628483 ?auto_628484 ?auto_628485 ?auto_628486 ?auto_628487 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628514 - BLOCK
      ?auto_628515 - BLOCK
      ?auto_628516 - BLOCK
      ?auto_628517 - BLOCK
      ?auto_628518 - BLOCK
      ?auto_628519 - BLOCK
      ?auto_628520 - BLOCK
      ?auto_628521 - BLOCK
    )
    :vars
    (
      ?auto_628522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628521 ?auto_628522 ) ( ON-TABLE ?auto_628514 ) ( ON ?auto_628515 ?auto_628514 ) ( not ( = ?auto_628514 ?auto_628515 ) ) ( not ( = ?auto_628514 ?auto_628516 ) ) ( not ( = ?auto_628514 ?auto_628517 ) ) ( not ( = ?auto_628514 ?auto_628518 ) ) ( not ( = ?auto_628514 ?auto_628519 ) ) ( not ( = ?auto_628514 ?auto_628520 ) ) ( not ( = ?auto_628514 ?auto_628521 ) ) ( not ( = ?auto_628514 ?auto_628522 ) ) ( not ( = ?auto_628515 ?auto_628516 ) ) ( not ( = ?auto_628515 ?auto_628517 ) ) ( not ( = ?auto_628515 ?auto_628518 ) ) ( not ( = ?auto_628515 ?auto_628519 ) ) ( not ( = ?auto_628515 ?auto_628520 ) ) ( not ( = ?auto_628515 ?auto_628521 ) ) ( not ( = ?auto_628515 ?auto_628522 ) ) ( not ( = ?auto_628516 ?auto_628517 ) ) ( not ( = ?auto_628516 ?auto_628518 ) ) ( not ( = ?auto_628516 ?auto_628519 ) ) ( not ( = ?auto_628516 ?auto_628520 ) ) ( not ( = ?auto_628516 ?auto_628521 ) ) ( not ( = ?auto_628516 ?auto_628522 ) ) ( not ( = ?auto_628517 ?auto_628518 ) ) ( not ( = ?auto_628517 ?auto_628519 ) ) ( not ( = ?auto_628517 ?auto_628520 ) ) ( not ( = ?auto_628517 ?auto_628521 ) ) ( not ( = ?auto_628517 ?auto_628522 ) ) ( not ( = ?auto_628518 ?auto_628519 ) ) ( not ( = ?auto_628518 ?auto_628520 ) ) ( not ( = ?auto_628518 ?auto_628521 ) ) ( not ( = ?auto_628518 ?auto_628522 ) ) ( not ( = ?auto_628519 ?auto_628520 ) ) ( not ( = ?auto_628519 ?auto_628521 ) ) ( not ( = ?auto_628519 ?auto_628522 ) ) ( not ( = ?auto_628520 ?auto_628521 ) ) ( not ( = ?auto_628520 ?auto_628522 ) ) ( not ( = ?auto_628521 ?auto_628522 ) ) ( ON ?auto_628520 ?auto_628521 ) ( ON ?auto_628519 ?auto_628520 ) ( ON ?auto_628518 ?auto_628519 ) ( ON ?auto_628517 ?auto_628518 ) ( CLEAR ?auto_628515 ) ( ON ?auto_628516 ?auto_628517 ) ( CLEAR ?auto_628516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_628514 ?auto_628515 ?auto_628516 )
      ( MAKE-8PILE ?auto_628514 ?auto_628515 ?auto_628516 ?auto_628517 ?auto_628518 ?auto_628519 ?auto_628520 ?auto_628521 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628548 - BLOCK
      ?auto_628549 - BLOCK
      ?auto_628550 - BLOCK
      ?auto_628551 - BLOCK
      ?auto_628552 - BLOCK
      ?auto_628553 - BLOCK
      ?auto_628554 - BLOCK
      ?auto_628555 - BLOCK
    )
    :vars
    (
      ?auto_628556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628555 ?auto_628556 ) ( ON-TABLE ?auto_628548 ) ( not ( = ?auto_628548 ?auto_628549 ) ) ( not ( = ?auto_628548 ?auto_628550 ) ) ( not ( = ?auto_628548 ?auto_628551 ) ) ( not ( = ?auto_628548 ?auto_628552 ) ) ( not ( = ?auto_628548 ?auto_628553 ) ) ( not ( = ?auto_628548 ?auto_628554 ) ) ( not ( = ?auto_628548 ?auto_628555 ) ) ( not ( = ?auto_628548 ?auto_628556 ) ) ( not ( = ?auto_628549 ?auto_628550 ) ) ( not ( = ?auto_628549 ?auto_628551 ) ) ( not ( = ?auto_628549 ?auto_628552 ) ) ( not ( = ?auto_628549 ?auto_628553 ) ) ( not ( = ?auto_628549 ?auto_628554 ) ) ( not ( = ?auto_628549 ?auto_628555 ) ) ( not ( = ?auto_628549 ?auto_628556 ) ) ( not ( = ?auto_628550 ?auto_628551 ) ) ( not ( = ?auto_628550 ?auto_628552 ) ) ( not ( = ?auto_628550 ?auto_628553 ) ) ( not ( = ?auto_628550 ?auto_628554 ) ) ( not ( = ?auto_628550 ?auto_628555 ) ) ( not ( = ?auto_628550 ?auto_628556 ) ) ( not ( = ?auto_628551 ?auto_628552 ) ) ( not ( = ?auto_628551 ?auto_628553 ) ) ( not ( = ?auto_628551 ?auto_628554 ) ) ( not ( = ?auto_628551 ?auto_628555 ) ) ( not ( = ?auto_628551 ?auto_628556 ) ) ( not ( = ?auto_628552 ?auto_628553 ) ) ( not ( = ?auto_628552 ?auto_628554 ) ) ( not ( = ?auto_628552 ?auto_628555 ) ) ( not ( = ?auto_628552 ?auto_628556 ) ) ( not ( = ?auto_628553 ?auto_628554 ) ) ( not ( = ?auto_628553 ?auto_628555 ) ) ( not ( = ?auto_628553 ?auto_628556 ) ) ( not ( = ?auto_628554 ?auto_628555 ) ) ( not ( = ?auto_628554 ?auto_628556 ) ) ( not ( = ?auto_628555 ?auto_628556 ) ) ( ON ?auto_628554 ?auto_628555 ) ( ON ?auto_628553 ?auto_628554 ) ( ON ?auto_628552 ?auto_628553 ) ( ON ?auto_628551 ?auto_628552 ) ( ON ?auto_628550 ?auto_628551 ) ( CLEAR ?auto_628548 ) ( ON ?auto_628549 ?auto_628550 ) ( CLEAR ?auto_628549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_628548 ?auto_628549 )
      ( MAKE-8PILE ?auto_628548 ?auto_628549 ?auto_628550 ?auto_628551 ?auto_628552 ?auto_628553 ?auto_628554 ?auto_628555 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_628582 - BLOCK
      ?auto_628583 - BLOCK
      ?auto_628584 - BLOCK
      ?auto_628585 - BLOCK
      ?auto_628586 - BLOCK
      ?auto_628587 - BLOCK
      ?auto_628588 - BLOCK
      ?auto_628589 - BLOCK
    )
    :vars
    (
      ?auto_628590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628589 ?auto_628590 ) ( not ( = ?auto_628582 ?auto_628583 ) ) ( not ( = ?auto_628582 ?auto_628584 ) ) ( not ( = ?auto_628582 ?auto_628585 ) ) ( not ( = ?auto_628582 ?auto_628586 ) ) ( not ( = ?auto_628582 ?auto_628587 ) ) ( not ( = ?auto_628582 ?auto_628588 ) ) ( not ( = ?auto_628582 ?auto_628589 ) ) ( not ( = ?auto_628582 ?auto_628590 ) ) ( not ( = ?auto_628583 ?auto_628584 ) ) ( not ( = ?auto_628583 ?auto_628585 ) ) ( not ( = ?auto_628583 ?auto_628586 ) ) ( not ( = ?auto_628583 ?auto_628587 ) ) ( not ( = ?auto_628583 ?auto_628588 ) ) ( not ( = ?auto_628583 ?auto_628589 ) ) ( not ( = ?auto_628583 ?auto_628590 ) ) ( not ( = ?auto_628584 ?auto_628585 ) ) ( not ( = ?auto_628584 ?auto_628586 ) ) ( not ( = ?auto_628584 ?auto_628587 ) ) ( not ( = ?auto_628584 ?auto_628588 ) ) ( not ( = ?auto_628584 ?auto_628589 ) ) ( not ( = ?auto_628584 ?auto_628590 ) ) ( not ( = ?auto_628585 ?auto_628586 ) ) ( not ( = ?auto_628585 ?auto_628587 ) ) ( not ( = ?auto_628585 ?auto_628588 ) ) ( not ( = ?auto_628585 ?auto_628589 ) ) ( not ( = ?auto_628585 ?auto_628590 ) ) ( not ( = ?auto_628586 ?auto_628587 ) ) ( not ( = ?auto_628586 ?auto_628588 ) ) ( not ( = ?auto_628586 ?auto_628589 ) ) ( not ( = ?auto_628586 ?auto_628590 ) ) ( not ( = ?auto_628587 ?auto_628588 ) ) ( not ( = ?auto_628587 ?auto_628589 ) ) ( not ( = ?auto_628587 ?auto_628590 ) ) ( not ( = ?auto_628588 ?auto_628589 ) ) ( not ( = ?auto_628588 ?auto_628590 ) ) ( not ( = ?auto_628589 ?auto_628590 ) ) ( ON ?auto_628588 ?auto_628589 ) ( ON ?auto_628587 ?auto_628588 ) ( ON ?auto_628586 ?auto_628587 ) ( ON ?auto_628585 ?auto_628586 ) ( ON ?auto_628584 ?auto_628585 ) ( ON ?auto_628583 ?auto_628584 ) ( ON ?auto_628582 ?auto_628583 ) ( CLEAR ?auto_628582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_628582 )
      ( MAKE-8PILE ?auto_628582 ?auto_628583 ?auto_628584 ?auto_628585 ?auto_628586 ?auto_628587 ?auto_628588 ?auto_628589 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628617 - BLOCK
      ?auto_628618 - BLOCK
      ?auto_628619 - BLOCK
      ?auto_628620 - BLOCK
      ?auto_628621 - BLOCK
      ?auto_628622 - BLOCK
      ?auto_628623 - BLOCK
      ?auto_628624 - BLOCK
      ?auto_628625 - BLOCK
    )
    :vars
    (
      ?auto_628626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_628624 ) ( ON ?auto_628625 ?auto_628626 ) ( CLEAR ?auto_628625 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_628617 ) ( ON ?auto_628618 ?auto_628617 ) ( ON ?auto_628619 ?auto_628618 ) ( ON ?auto_628620 ?auto_628619 ) ( ON ?auto_628621 ?auto_628620 ) ( ON ?auto_628622 ?auto_628621 ) ( ON ?auto_628623 ?auto_628622 ) ( ON ?auto_628624 ?auto_628623 ) ( not ( = ?auto_628617 ?auto_628618 ) ) ( not ( = ?auto_628617 ?auto_628619 ) ) ( not ( = ?auto_628617 ?auto_628620 ) ) ( not ( = ?auto_628617 ?auto_628621 ) ) ( not ( = ?auto_628617 ?auto_628622 ) ) ( not ( = ?auto_628617 ?auto_628623 ) ) ( not ( = ?auto_628617 ?auto_628624 ) ) ( not ( = ?auto_628617 ?auto_628625 ) ) ( not ( = ?auto_628617 ?auto_628626 ) ) ( not ( = ?auto_628618 ?auto_628619 ) ) ( not ( = ?auto_628618 ?auto_628620 ) ) ( not ( = ?auto_628618 ?auto_628621 ) ) ( not ( = ?auto_628618 ?auto_628622 ) ) ( not ( = ?auto_628618 ?auto_628623 ) ) ( not ( = ?auto_628618 ?auto_628624 ) ) ( not ( = ?auto_628618 ?auto_628625 ) ) ( not ( = ?auto_628618 ?auto_628626 ) ) ( not ( = ?auto_628619 ?auto_628620 ) ) ( not ( = ?auto_628619 ?auto_628621 ) ) ( not ( = ?auto_628619 ?auto_628622 ) ) ( not ( = ?auto_628619 ?auto_628623 ) ) ( not ( = ?auto_628619 ?auto_628624 ) ) ( not ( = ?auto_628619 ?auto_628625 ) ) ( not ( = ?auto_628619 ?auto_628626 ) ) ( not ( = ?auto_628620 ?auto_628621 ) ) ( not ( = ?auto_628620 ?auto_628622 ) ) ( not ( = ?auto_628620 ?auto_628623 ) ) ( not ( = ?auto_628620 ?auto_628624 ) ) ( not ( = ?auto_628620 ?auto_628625 ) ) ( not ( = ?auto_628620 ?auto_628626 ) ) ( not ( = ?auto_628621 ?auto_628622 ) ) ( not ( = ?auto_628621 ?auto_628623 ) ) ( not ( = ?auto_628621 ?auto_628624 ) ) ( not ( = ?auto_628621 ?auto_628625 ) ) ( not ( = ?auto_628621 ?auto_628626 ) ) ( not ( = ?auto_628622 ?auto_628623 ) ) ( not ( = ?auto_628622 ?auto_628624 ) ) ( not ( = ?auto_628622 ?auto_628625 ) ) ( not ( = ?auto_628622 ?auto_628626 ) ) ( not ( = ?auto_628623 ?auto_628624 ) ) ( not ( = ?auto_628623 ?auto_628625 ) ) ( not ( = ?auto_628623 ?auto_628626 ) ) ( not ( = ?auto_628624 ?auto_628625 ) ) ( not ( = ?auto_628624 ?auto_628626 ) ) ( not ( = ?auto_628625 ?auto_628626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_628625 ?auto_628626 )
      ( !STACK ?auto_628625 ?auto_628624 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628655 - BLOCK
      ?auto_628656 - BLOCK
      ?auto_628657 - BLOCK
      ?auto_628658 - BLOCK
      ?auto_628659 - BLOCK
      ?auto_628660 - BLOCK
      ?auto_628661 - BLOCK
      ?auto_628662 - BLOCK
      ?auto_628663 - BLOCK
    )
    :vars
    (
      ?auto_628664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628663 ?auto_628664 ) ( ON-TABLE ?auto_628655 ) ( ON ?auto_628656 ?auto_628655 ) ( ON ?auto_628657 ?auto_628656 ) ( ON ?auto_628658 ?auto_628657 ) ( ON ?auto_628659 ?auto_628658 ) ( ON ?auto_628660 ?auto_628659 ) ( ON ?auto_628661 ?auto_628660 ) ( not ( = ?auto_628655 ?auto_628656 ) ) ( not ( = ?auto_628655 ?auto_628657 ) ) ( not ( = ?auto_628655 ?auto_628658 ) ) ( not ( = ?auto_628655 ?auto_628659 ) ) ( not ( = ?auto_628655 ?auto_628660 ) ) ( not ( = ?auto_628655 ?auto_628661 ) ) ( not ( = ?auto_628655 ?auto_628662 ) ) ( not ( = ?auto_628655 ?auto_628663 ) ) ( not ( = ?auto_628655 ?auto_628664 ) ) ( not ( = ?auto_628656 ?auto_628657 ) ) ( not ( = ?auto_628656 ?auto_628658 ) ) ( not ( = ?auto_628656 ?auto_628659 ) ) ( not ( = ?auto_628656 ?auto_628660 ) ) ( not ( = ?auto_628656 ?auto_628661 ) ) ( not ( = ?auto_628656 ?auto_628662 ) ) ( not ( = ?auto_628656 ?auto_628663 ) ) ( not ( = ?auto_628656 ?auto_628664 ) ) ( not ( = ?auto_628657 ?auto_628658 ) ) ( not ( = ?auto_628657 ?auto_628659 ) ) ( not ( = ?auto_628657 ?auto_628660 ) ) ( not ( = ?auto_628657 ?auto_628661 ) ) ( not ( = ?auto_628657 ?auto_628662 ) ) ( not ( = ?auto_628657 ?auto_628663 ) ) ( not ( = ?auto_628657 ?auto_628664 ) ) ( not ( = ?auto_628658 ?auto_628659 ) ) ( not ( = ?auto_628658 ?auto_628660 ) ) ( not ( = ?auto_628658 ?auto_628661 ) ) ( not ( = ?auto_628658 ?auto_628662 ) ) ( not ( = ?auto_628658 ?auto_628663 ) ) ( not ( = ?auto_628658 ?auto_628664 ) ) ( not ( = ?auto_628659 ?auto_628660 ) ) ( not ( = ?auto_628659 ?auto_628661 ) ) ( not ( = ?auto_628659 ?auto_628662 ) ) ( not ( = ?auto_628659 ?auto_628663 ) ) ( not ( = ?auto_628659 ?auto_628664 ) ) ( not ( = ?auto_628660 ?auto_628661 ) ) ( not ( = ?auto_628660 ?auto_628662 ) ) ( not ( = ?auto_628660 ?auto_628663 ) ) ( not ( = ?auto_628660 ?auto_628664 ) ) ( not ( = ?auto_628661 ?auto_628662 ) ) ( not ( = ?auto_628661 ?auto_628663 ) ) ( not ( = ?auto_628661 ?auto_628664 ) ) ( not ( = ?auto_628662 ?auto_628663 ) ) ( not ( = ?auto_628662 ?auto_628664 ) ) ( not ( = ?auto_628663 ?auto_628664 ) ) ( CLEAR ?auto_628661 ) ( ON ?auto_628662 ?auto_628663 ) ( CLEAR ?auto_628662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_628655 ?auto_628656 ?auto_628657 ?auto_628658 ?auto_628659 ?auto_628660 ?auto_628661 ?auto_628662 )
      ( MAKE-9PILE ?auto_628655 ?auto_628656 ?auto_628657 ?auto_628658 ?auto_628659 ?auto_628660 ?auto_628661 ?auto_628662 ?auto_628663 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628693 - BLOCK
      ?auto_628694 - BLOCK
      ?auto_628695 - BLOCK
      ?auto_628696 - BLOCK
      ?auto_628697 - BLOCK
      ?auto_628698 - BLOCK
      ?auto_628699 - BLOCK
      ?auto_628700 - BLOCK
      ?auto_628701 - BLOCK
    )
    :vars
    (
      ?auto_628702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628701 ?auto_628702 ) ( ON-TABLE ?auto_628693 ) ( ON ?auto_628694 ?auto_628693 ) ( ON ?auto_628695 ?auto_628694 ) ( ON ?auto_628696 ?auto_628695 ) ( ON ?auto_628697 ?auto_628696 ) ( ON ?auto_628698 ?auto_628697 ) ( not ( = ?auto_628693 ?auto_628694 ) ) ( not ( = ?auto_628693 ?auto_628695 ) ) ( not ( = ?auto_628693 ?auto_628696 ) ) ( not ( = ?auto_628693 ?auto_628697 ) ) ( not ( = ?auto_628693 ?auto_628698 ) ) ( not ( = ?auto_628693 ?auto_628699 ) ) ( not ( = ?auto_628693 ?auto_628700 ) ) ( not ( = ?auto_628693 ?auto_628701 ) ) ( not ( = ?auto_628693 ?auto_628702 ) ) ( not ( = ?auto_628694 ?auto_628695 ) ) ( not ( = ?auto_628694 ?auto_628696 ) ) ( not ( = ?auto_628694 ?auto_628697 ) ) ( not ( = ?auto_628694 ?auto_628698 ) ) ( not ( = ?auto_628694 ?auto_628699 ) ) ( not ( = ?auto_628694 ?auto_628700 ) ) ( not ( = ?auto_628694 ?auto_628701 ) ) ( not ( = ?auto_628694 ?auto_628702 ) ) ( not ( = ?auto_628695 ?auto_628696 ) ) ( not ( = ?auto_628695 ?auto_628697 ) ) ( not ( = ?auto_628695 ?auto_628698 ) ) ( not ( = ?auto_628695 ?auto_628699 ) ) ( not ( = ?auto_628695 ?auto_628700 ) ) ( not ( = ?auto_628695 ?auto_628701 ) ) ( not ( = ?auto_628695 ?auto_628702 ) ) ( not ( = ?auto_628696 ?auto_628697 ) ) ( not ( = ?auto_628696 ?auto_628698 ) ) ( not ( = ?auto_628696 ?auto_628699 ) ) ( not ( = ?auto_628696 ?auto_628700 ) ) ( not ( = ?auto_628696 ?auto_628701 ) ) ( not ( = ?auto_628696 ?auto_628702 ) ) ( not ( = ?auto_628697 ?auto_628698 ) ) ( not ( = ?auto_628697 ?auto_628699 ) ) ( not ( = ?auto_628697 ?auto_628700 ) ) ( not ( = ?auto_628697 ?auto_628701 ) ) ( not ( = ?auto_628697 ?auto_628702 ) ) ( not ( = ?auto_628698 ?auto_628699 ) ) ( not ( = ?auto_628698 ?auto_628700 ) ) ( not ( = ?auto_628698 ?auto_628701 ) ) ( not ( = ?auto_628698 ?auto_628702 ) ) ( not ( = ?auto_628699 ?auto_628700 ) ) ( not ( = ?auto_628699 ?auto_628701 ) ) ( not ( = ?auto_628699 ?auto_628702 ) ) ( not ( = ?auto_628700 ?auto_628701 ) ) ( not ( = ?auto_628700 ?auto_628702 ) ) ( not ( = ?auto_628701 ?auto_628702 ) ) ( ON ?auto_628700 ?auto_628701 ) ( CLEAR ?auto_628698 ) ( ON ?auto_628699 ?auto_628700 ) ( CLEAR ?auto_628699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_628693 ?auto_628694 ?auto_628695 ?auto_628696 ?auto_628697 ?auto_628698 ?auto_628699 )
      ( MAKE-9PILE ?auto_628693 ?auto_628694 ?auto_628695 ?auto_628696 ?auto_628697 ?auto_628698 ?auto_628699 ?auto_628700 ?auto_628701 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628731 - BLOCK
      ?auto_628732 - BLOCK
      ?auto_628733 - BLOCK
      ?auto_628734 - BLOCK
      ?auto_628735 - BLOCK
      ?auto_628736 - BLOCK
      ?auto_628737 - BLOCK
      ?auto_628738 - BLOCK
      ?auto_628739 - BLOCK
    )
    :vars
    (
      ?auto_628740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628739 ?auto_628740 ) ( ON-TABLE ?auto_628731 ) ( ON ?auto_628732 ?auto_628731 ) ( ON ?auto_628733 ?auto_628732 ) ( ON ?auto_628734 ?auto_628733 ) ( ON ?auto_628735 ?auto_628734 ) ( not ( = ?auto_628731 ?auto_628732 ) ) ( not ( = ?auto_628731 ?auto_628733 ) ) ( not ( = ?auto_628731 ?auto_628734 ) ) ( not ( = ?auto_628731 ?auto_628735 ) ) ( not ( = ?auto_628731 ?auto_628736 ) ) ( not ( = ?auto_628731 ?auto_628737 ) ) ( not ( = ?auto_628731 ?auto_628738 ) ) ( not ( = ?auto_628731 ?auto_628739 ) ) ( not ( = ?auto_628731 ?auto_628740 ) ) ( not ( = ?auto_628732 ?auto_628733 ) ) ( not ( = ?auto_628732 ?auto_628734 ) ) ( not ( = ?auto_628732 ?auto_628735 ) ) ( not ( = ?auto_628732 ?auto_628736 ) ) ( not ( = ?auto_628732 ?auto_628737 ) ) ( not ( = ?auto_628732 ?auto_628738 ) ) ( not ( = ?auto_628732 ?auto_628739 ) ) ( not ( = ?auto_628732 ?auto_628740 ) ) ( not ( = ?auto_628733 ?auto_628734 ) ) ( not ( = ?auto_628733 ?auto_628735 ) ) ( not ( = ?auto_628733 ?auto_628736 ) ) ( not ( = ?auto_628733 ?auto_628737 ) ) ( not ( = ?auto_628733 ?auto_628738 ) ) ( not ( = ?auto_628733 ?auto_628739 ) ) ( not ( = ?auto_628733 ?auto_628740 ) ) ( not ( = ?auto_628734 ?auto_628735 ) ) ( not ( = ?auto_628734 ?auto_628736 ) ) ( not ( = ?auto_628734 ?auto_628737 ) ) ( not ( = ?auto_628734 ?auto_628738 ) ) ( not ( = ?auto_628734 ?auto_628739 ) ) ( not ( = ?auto_628734 ?auto_628740 ) ) ( not ( = ?auto_628735 ?auto_628736 ) ) ( not ( = ?auto_628735 ?auto_628737 ) ) ( not ( = ?auto_628735 ?auto_628738 ) ) ( not ( = ?auto_628735 ?auto_628739 ) ) ( not ( = ?auto_628735 ?auto_628740 ) ) ( not ( = ?auto_628736 ?auto_628737 ) ) ( not ( = ?auto_628736 ?auto_628738 ) ) ( not ( = ?auto_628736 ?auto_628739 ) ) ( not ( = ?auto_628736 ?auto_628740 ) ) ( not ( = ?auto_628737 ?auto_628738 ) ) ( not ( = ?auto_628737 ?auto_628739 ) ) ( not ( = ?auto_628737 ?auto_628740 ) ) ( not ( = ?auto_628738 ?auto_628739 ) ) ( not ( = ?auto_628738 ?auto_628740 ) ) ( not ( = ?auto_628739 ?auto_628740 ) ) ( ON ?auto_628738 ?auto_628739 ) ( ON ?auto_628737 ?auto_628738 ) ( CLEAR ?auto_628735 ) ( ON ?auto_628736 ?auto_628737 ) ( CLEAR ?auto_628736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_628731 ?auto_628732 ?auto_628733 ?auto_628734 ?auto_628735 ?auto_628736 )
      ( MAKE-9PILE ?auto_628731 ?auto_628732 ?auto_628733 ?auto_628734 ?auto_628735 ?auto_628736 ?auto_628737 ?auto_628738 ?auto_628739 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628769 - BLOCK
      ?auto_628770 - BLOCK
      ?auto_628771 - BLOCK
      ?auto_628772 - BLOCK
      ?auto_628773 - BLOCK
      ?auto_628774 - BLOCK
      ?auto_628775 - BLOCK
      ?auto_628776 - BLOCK
      ?auto_628777 - BLOCK
    )
    :vars
    (
      ?auto_628778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628777 ?auto_628778 ) ( ON-TABLE ?auto_628769 ) ( ON ?auto_628770 ?auto_628769 ) ( ON ?auto_628771 ?auto_628770 ) ( ON ?auto_628772 ?auto_628771 ) ( not ( = ?auto_628769 ?auto_628770 ) ) ( not ( = ?auto_628769 ?auto_628771 ) ) ( not ( = ?auto_628769 ?auto_628772 ) ) ( not ( = ?auto_628769 ?auto_628773 ) ) ( not ( = ?auto_628769 ?auto_628774 ) ) ( not ( = ?auto_628769 ?auto_628775 ) ) ( not ( = ?auto_628769 ?auto_628776 ) ) ( not ( = ?auto_628769 ?auto_628777 ) ) ( not ( = ?auto_628769 ?auto_628778 ) ) ( not ( = ?auto_628770 ?auto_628771 ) ) ( not ( = ?auto_628770 ?auto_628772 ) ) ( not ( = ?auto_628770 ?auto_628773 ) ) ( not ( = ?auto_628770 ?auto_628774 ) ) ( not ( = ?auto_628770 ?auto_628775 ) ) ( not ( = ?auto_628770 ?auto_628776 ) ) ( not ( = ?auto_628770 ?auto_628777 ) ) ( not ( = ?auto_628770 ?auto_628778 ) ) ( not ( = ?auto_628771 ?auto_628772 ) ) ( not ( = ?auto_628771 ?auto_628773 ) ) ( not ( = ?auto_628771 ?auto_628774 ) ) ( not ( = ?auto_628771 ?auto_628775 ) ) ( not ( = ?auto_628771 ?auto_628776 ) ) ( not ( = ?auto_628771 ?auto_628777 ) ) ( not ( = ?auto_628771 ?auto_628778 ) ) ( not ( = ?auto_628772 ?auto_628773 ) ) ( not ( = ?auto_628772 ?auto_628774 ) ) ( not ( = ?auto_628772 ?auto_628775 ) ) ( not ( = ?auto_628772 ?auto_628776 ) ) ( not ( = ?auto_628772 ?auto_628777 ) ) ( not ( = ?auto_628772 ?auto_628778 ) ) ( not ( = ?auto_628773 ?auto_628774 ) ) ( not ( = ?auto_628773 ?auto_628775 ) ) ( not ( = ?auto_628773 ?auto_628776 ) ) ( not ( = ?auto_628773 ?auto_628777 ) ) ( not ( = ?auto_628773 ?auto_628778 ) ) ( not ( = ?auto_628774 ?auto_628775 ) ) ( not ( = ?auto_628774 ?auto_628776 ) ) ( not ( = ?auto_628774 ?auto_628777 ) ) ( not ( = ?auto_628774 ?auto_628778 ) ) ( not ( = ?auto_628775 ?auto_628776 ) ) ( not ( = ?auto_628775 ?auto_628777 ) ) ( not ( = ?auto_628775 ?auto_628778 ) ) ( not ( = ?auto_628776 ?auto_628777 ) ) ( not ( = ?auto_628776 ?auto_628778 ) ) ( not ( = ?auto_628777 ?auto_628778 ) ) ( ON ?auto_628776 ?auto_628777 ) ( ON ?auto_628775 ?auto_628776 ) ( ON ?auto_628774 ?auto_628775 ) ( CLEAR ?auto_628772 ) ( ON ?auto_628773 ?auto_628774 ) ( CLEAR ?auto_628773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_628769 ?auto_628770 ?auto_628771 ?auto_628772 ?auto_628773 )
      ( MAKE-9PILE ?auto_628769 ?auto_628770 ?auto_628771 ?auto_628772 ?auto_628773 ?auto_628774 ?auto_628775 ?auto_628776 ?auto_628777 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628807 - BLOCK
      ?auto_628808 - BLOCK
      ?auto_628809 - BLOCK
      ?auto_628810 - BLOCK
      ?auto_628811 - BLOCK
      ?auto_628812 - BLOCK
      ?auto_628813 - BLOCK
      ?auto_628814 - BLOCK
      ?auto_628815 - BLOCK
    )
    :vars
    (
      ?auto_628816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628815 ?auto_628816 ) ( ON-TABLE ?auto_628807 ) ( ON ?auto_628808 ?auto_628807 ) ( ON ?auto_628809 ?auto_628808 ) ( not ( = ?auto_628807 ?auto_628808 ) ) ( not ( = ?auto_628807 ?auto_628809 ) ) ( not ( = ?auto_628807 ?auto_628810 ) ) ( not ( = ?auto_628807 ?auto_628811 ) ) ( not ( = ?auto_628807 ?auto_628812 ) ) ( not ( = ?auto_628807 ?auto_628813 ) ) ( not ( = ?auto_628807 ?auto_628814 ) ) ( not ( = ?auto_628807 ?auto_628815 ) ) ( not ( = ?auto_628807 ?auto_628816 ) ) ( not ( = ?auto_628808 ?auto_628809 ) ) ( not ( = ?auto_628808 ?auto_628810 ) ) ( not ( = ?auto_628808 ?auto_628811 ) ) ( not ( = ?auto_628808 ?auto_628812 ) ) ( not ( = ?auto_628808 ?auto_628813 ) ) ( not ( = ?auto_628808 ?auto_628814 ) ) ( not ( = ?auto_628808 ?auto_628815 ) ) ( not ( = ?auto_628808 ?auto_628816 ) ) ( not ( = ?auto_628809 ?auto_628810 ) ) ( not ( = ?auto_628809 ?auto_628811 ) ) ( not ( = ?auto_628809 ?auto_628812 ) ) ( not ( = ?auto_628809 ?auto_628813 ) ) ( not ( = ?auto_628809 ?auto_628814 ) ) ( not ( = ?auto_628809 ?auto_628815 ) ) ( not ( = ?auto_628809 ?auto_628816 ) ) ( not ( = ?auto_628810 ?auto_628811 ) ) ( not ( = ?auto_628810 ?auto_628812 ) ) ( not ( = ?auto_628810 ?auto_628813 ) ) ( not ( = ?auto_628810 ?auto_628814 ) ) ( not ( = ?auto_628810 ?auto_628815 ) ) ( not ( = ?auto_628810 ?auto_628816 ) ) ( not ( = ?auto_628811 ?auto_628812 ) ) ( not ( = ?auto_628811 ?auto_628813 ) ) ( not ( = ?auto_628811 ?auto_628814 ) ) ( not ( = ?auto_628811 ?auto_628815 ) ) ( not ( = ?auto_628811 ?auto_628816 ) ) ( not ( = ?auto_628812 ?auto_628813 ) ) ( not ( = ?auto_628812 ?auto_628814 ) ) ( not ( = ?auto_628812 ?auto_628815 ) ) ( not ( = ?auto_628812 ?auto_628816 ) ) ( not ( = ?auto_628813 ?auto_628814 ) ) ( not ( = ?auto_628813 ?auto_628815 ) ) ( not ( = ?auto_628813 ?auto_628816 ) ) ( not ( = ?auto_628814 ?auto_628815 ) ) ( not ( = ?auto_628814 ?auto_628816 ) ) ( not ( = ?auto_628815 ?auto_628816 ) ) ( ON ?auto_628814 ?auto_628815 ) ( ON ?auto_628813 ?auto_628814 ) ( ON ?auto_628812 ?auto_628813 ) ( ON ?auto_628811 ?auto_628812 ) ( CLEAR ?auto_628809 ) ( ON ?auto_628810 ?auto_628811 ) ( CLEAR ?auto_628810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_628807 ?auto_628808 ?auto_628809 ?auto_628810 )
      ( MAKE-9PILE ?auto_628807 ?auto_628808 ?auto_628809 ?auto_628810 ?auto_628811 ?auto_628812 ?auto_628813 ?auto_628814 ?auto_628815 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628845 - BLOCK
      ?auto_628846 - BLOCK
      ?auto_628847 - BLOCK
      ?auto_628848 - BLOCK
      ?auto_628849 - BLOCK
      ?auto_628850 - BLOCK
      ?auto_628851 - BLOCK
      ?auto_628852 - BLOCK
      ?auto_628853 - BLOCK
    )
    :vars
    (
      ?auto_628854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628853 ?auto_628854 ) ( ON-TABLE ?auto_628845 ) ( ON ?auto_628846 ?auto_628845 ) ( not ( = ?auto_628845 ?auto_628846 ) ) ( not ( = ?auto_628845 ?auto_628847 ) ) ( not ( = ?auto_628845 ?auto_628848 ) ) ( not ( = ?auto_628845 ?auto_628849 ) ) ( not ( = ?auto_628845 ?auto_628850 ) ) ( not ( = ?auto_628845 ?auto_628851 ) ) ( not ( = ?auto_628845 ?auto_628852 ) ) ( not ( = ?auto_628845 ?auto_628853 ) ) ( not ( = ?auto_628845 ?auto_628854 ) ) ( not ( = ?auto_628846 ?auto_628847 ) ) ( not ( = ?auto_628846 ?auto_628848 ) ) ( not ( = ?auto_628846 ?auto_628849 ) ) ( not ( = ?auto_628846 ?auto_628850 ) ) ( not ( = ?auto_628846 ?auto_628851 ) ) ( not ( = ?auto_628846 ?auto_628852 ) ) ( not ( = ?auto_628846 ?auto_628853 ) ) ( not ( = ?auto_628846 ?auto_628854 ) ) ( not ( = ?auto_628847 ?auto_628848 ) ) ( not ( = ?auto_628847 ?auto_628849 ) ) ( not ( = ?auto_628847 ?auto_628850 ) ) ( not ( = ?auto_628847 ?auto_628851 ) ) ( not ( = ?auto_628847 ?auto_628852 ) ) ( not ( = ?auto_628847 ?auto_628853 ) ) ( not ( = ?auto_628847 ?auto_628854 ) ) ( not ( = ?auto_628848 ?auto_628849 ) ) ( not ( = ?auto_628848 ?auto_628850 ) ) ( not ( = ?auto_628848 ?auto_628851 ) ) ( not ( = ?auto_628848 ?auto_628852 ) ) ( not ( = ?auto_628848 ?auto_628853 ) ) ( not ( = ?auto_628848 ?auto_628854 ) ) ( not ( = ?auto_628849 ?auto_628850 ) ) ( not ( = ?auto_628849 ?auto_628851 ) ) ( not ( = ?auto_628849 ?auto_628852 ) ) ( not ( = ?auto_628849 ?auto_628853 ) ) ( not ( = ?auto_628849 ?auto_628854 ) ) ( not ( = ?auto_628850 ?auto_628851 ) ) ( not ( = ?auto_628850 ?auto_628852 ) ) ( not ( = ?auto_628850 ?auto_628853 ) ) ( not ( = ?auto_628850 ?auto_628854 ) ) ( not ( = ?auto_628851 ?auto_628852 ) ) ( not ( = ?auto_628851 ?auto_628853 ) ) ( not ( = ?auto_628851 ?auto_628854 ) ) ( not ( = ?auto_628852 ?auto_628853 ) ) ( not ( = ?auto_628852 ?auto_628854 ) ) ( not ( = ?auto_628853 ?auto_628854 ) ) ( ON ?auto_628852 ?auto_628853 ) ( ON ?auto_628851 ?auto_628852 ) ( ON ?auto_628850 ?auto_628851 ) ( ON ?auto_628849 ?auto_628850 ) ( ON ?auto_628848 ?auto_628849 ) ( CLEAR ?auto_628846 ) ( ON ?auto_628847 ?auto_628848 ) ( CLEAR ?auto_628847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_628845 ?auto_628846 ?auto_628847 )
      ( MAKE-9PILE ?auto_628845 ?auto_628846 ?auto_628847 ?auto_628848 ?auto_628849 ?auto_628850 ?auto_628851 ?auto_628852 ?auto_628853 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628883 - BLOCK
      ?auto_628884 - BLOCK
      ?auto_628885 - BLOCK
      ?auto_628886 - BLOCK
      ?auto_628887 - BLOCK
      ?auto_628888 - BLOCK
      ?auto_628889 - BLOCK
      ?auto_628890 - BLOCK
      ?auto_628891 - BLOCK
    )
    :vars
    (
      ?auto_628892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628891 ?auto_628892 ) ( ON-TABLE ?auto_628883 ) ( not ( = ?auto_628883 ?auto_628884 ) ) ( not ( = ?auto_628883 ?auto_628885 ) ) ( not ( = ?auto_628883 ?auto_628886 ) ) ( not ( = ?auto_628883 ?auto_628887 ) ) ( not ( = ?auto_628883 ?auto_628888 ) ) ( not ( = ?auto_628883 ?auto_628889 ) ) ( not ( = ?auto_628883 ?auto_628890 ) ) ( not ( = ?auto_628883 ?auto_628891 ) ) ( not ( = ?auto_628883 ?auto_628892 ) ) ( not ( = ?auto_628884 ?auto_628885 ) ) ( not ( = ?auto_628884 ?auto_628886 ) ) ( not ( = ?auto_628884 ?auto_628887 ) ) ( not ( = ?auto_628884 ?auto_628888 ) ) ( not ( = ?auto_628884 ?auto_628889 ) ) ( not ( = ?auto_628884 ?auto_628890 ) ) ( not ( = ?auto_628884 ?auto_628891 ) ) ( not ( = ?auto_628884 ?auto_628892 ) ) ( not ( = ?auto_628885 ?auto_628886 ) ) ( not ( = ?auto_628885 ?auto_628887 ) ) ( not ( = ?auto_628885 ?auto_628888 ) ) ( not ( = ?auto_628885 ?auto_628889 ) ) ( not ( = ?auto_628885 ?auto_628890 ) ) ( not ( = ?auto_628885 ?auto_628891 ) ) ( not ( = ?auto_628885 ?auto_628892 ) ) ( not ( = ?auto_628886 ?auto_628887 ) ) ( not ( = ?auto_628886 ?auto_628888 ) ) ( not ( = ?auto_628886 ?auto_628889 ) ) ( not ( = ?auto_628886 ?auto_628890 ) ) ( not ( = ?auto_628886 ?auto_628891 ) ) ( not ( = ?auto_628886 ?auto_628892 ) ) ( not ( = ?auto_628887 ?auto_628888 ) ) ( not ( = ?auto_628887 ?auto_628889 ) ) ( not ( = ?auto_628887 ?auto_628890 ) ) ( not ( = ?auto_628887 ?auto_628891 ) ) ( not ( = ?auto_628887 ?auto_628892 ) ) ( not ( = ?auto_628888 ?auto_628889 ) ) ( not ( = ?auto_628888 ?auto_628890 ) ) ( not ( = ?auto_628888 ?auto_628891 ) ) ( not ( = ?auto_628888 ?auto_628892 ) ) ( not ( = ?auto_628889 ?auto_628890 ) ) ( not ( = ?auto_628889 ?auto_628891 ) ) ( not ( = ?auto_628889 ?auto_628892 ) ) ( not ( = ?auto_628890 ?auto_628891 ) ) ( not ( = ?auto_628890 ?auto_628892 ) ) ( not ( = ?auto_628891 ?auto_628892 ) ) ( ON ?auto_628890 ?auto_628891 ) ( ON ?auto_628889 ?auto_628890 ) ( ON ?auto_628888 ?auto_628889 ) ( ON ?auto_628887 ?auto_628888 ) ( ON ?auto_628886 ?auto_628887 ) ( ON ?auto_628885 ?auto_628886 ) ( CLEAR ?auto_628883 ) ( ON ?auto_628884 ?auto_628885 ) ( CLEAR ?auto_628884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_628883 ?auto_628884 )
      ( MAKE-9PILE ?auto_628883 ?auto_628884 ?auto_628885 ?auto_628886 ?auto_628887 ?auto_628888 ?auto_628889 ?auto_628890 ?auto_628891 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_628921 - BLOCK
      ?auto_628922 - BLOCK
      ?auto_628923 - BLOCK
      ?auto_628924 - BLOCK
      ?auto_628925 - BLOCK
      ?auto_628926 - BLOCK
      ?auto_628927 - BLOCK
      ?auto_628928 - BLOCK
      ?auto_628929 - BLOCK
    )
    :vars
    (
      ?auto_628930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_628929 ?auto_628930 ) ( not ( = ?auto_628921 ?auto_628922 ) ) ( not ( = ?auto_628921 ?auto_628923 ) ) ( not ( = ?auto_628921 ?auto_628924 ) ) ( not ( = ?auto_628921 ?auto_628925 ) ) ( not ( = ?auto_628921 ?auto_628926 ) ) ( not ( = ?auto_628921 ?auto_628927 ) ) ( not ( = ?auto_628921 ?auto_628928 ) ) ( not ( = ?auto_628921 ?auto_628929 ) ) ( not ( = ?auto_628921 ?auto_628930 ) ) ( not ( = ?auto_628922 ?auto_628923 ) ) ( not ( = ?auto_628922 ?auto_628924 ) ) ( not ( = ?auto_628922 ?auto_628925 ) ) ( not ( = ?auto_628922 ?auto_628926 ) ) ( not ( = ?auto_628922 ?auto_628927 ) ) ( not ( = ?auto_628922 ?auto_628928 ) ) ( not ( = ?auto_628922 ?auto_628929 ) ) ( not ( = ?auto_628922 ?auto_628930 ) ) ( not ( = ?auto_628923 ?auto_628924 ) ) ( not ( = ?auto_628923 ?auto_628925 ) ) ( not ( = ?auto_628923 ?auto_628926 ) ) ( not ( = ?auto_628923 ?auto_628927 ) ) ( not ( = ?auto_628923 ?auto_628928 ) ) ( not ( = ?auto_628923 ?auto_628929 ) ) ( not ( = ?auto_628923 ?auto_628930 ) ) ( not ( = ?auto_628924 ?auto_628925 ) ) ( not ( = ?auto_628924 ?auto_628926 ) ) ( not ( = ?auto_628924 ?auto_628927 ) ) ( not ( = ?auto_628924 ?auto_628928 ) ) ( not ( = ?auto_628924 ?auto_628929 ) ) ( not ( = ?auto_628924 ?auto_628930 ) ) ( not ( = ?auto_628925 ?auto_628926 ) ) ( not ( = ?auto_628925 ?auto_628927 ) ) ( not ( = ?auto_628925 ?auto_628928 ) ) ( not ( = ?auto_628925 ?auto_628929 ) ) ( not ( = ?auto_628925 ?auto_628930 ) ) ( not ( = ?auto_628926 ?auto_628927 ) ) ( not ( = ?auto_628926 ?auto_628928 ) ) ( not ( = ?auto_628926 ?auto_628929 ) ) ( not ( = ?auto_628926 ?auto_628930 ) ) ( not ( = ?auto_628927 ?auto_628928 ) ) ( not ( = ?auto_628927 ?auto_628929 ) ) ( not ( = ?auto_628927 ?auto_628930 ) ) ( not ( = ?auto_628928 ?auto_628929 ) ) ( not ( = ?auto_628928 ?auto_628930 ) ) ( not ( = ?auto_628929 ?auto_628930 ) ) ( ON ?auto_628928 ?auto_628929 ) ( ON ?auto_628927 ?auto_628928 ) ( ON ?auto_628926 ?auto_628927 ) ( ON ?auto_628925 ?auto_628926 ) ( ON ?auto_628924 ?auto_628925 ) ( ON ?auto_628923 ?auto_628924 ) ( ON ?auto_628922 ?auto_628923 ) ( ON ?auto_628921 ?auto_628922 ) ( CLEAR ?auto_628921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_628921 )
      ( MAKE-9PILE ?auto_628921 ?auto_628922 ?auto_628923 ?auto_628924 ?auto_628925 ?auto_628926 ?auto_628927 ?auto_628928 ?auto_628929 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_628960 - BLOCK
      ?auto_628961 - BLOCK
      ?auto_628962 - BLOCK
      ?auto_628963 - BLOCK
      ?auto_628964 - BLOCK
      ?auto_628965 - BLOCK
      ?auto_628966 - BLOCK
      ?auto_628967 - BLOCK
      ?auto_628968 - BLOCK
      ?auto_628969 - BLOCK
    )
    :vars
    (
      ?auto_628970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_628968 ) ( ON ?auto_628969 ?auto_628970 ) ( CLEAR ?auto_628969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_628960 ) ( ON ?auto_628961 ?auto_628960 ) ( ON ?auto_628962 ?auto_628961 ) ( ON ?auto_628963 ?auto_628962 ) ( ON ?auto_628964 ?auto_628963 ) ( ON ?auto_628965 ?auto_628964 ) ( ON ?auto_628966 ?auto_628965 ) ( ON ?auto_628967 ?auto_628966 ) ( ON ?auto_628968 ?auto_628967 ) ( not ( = ?auto_628960 ?auto_628961 ) ) ( not ( = ?auto_628960 ?auto_628962 ) ) ( not ( = ?auto_628960 ?auto_628963 ) ) ( not ( = ?auto_628960 ?auto_628964 ) ) ( not ( = ?auto_628960 ?auto_628965 ) ) ( not ( = ?auto_628960 ?auto_628966 ) ) ( not ( = ?auto_628960 ?auto_628967 ) ) ( not ( = ?auto_628960 ?auto_628968 ) ) ( not ( = ?auto_628960 ?auto_628969 ) ) ( not ( = ?auto_628960 ?auto_628970 ) ) ( not ( = ?auto_628961 ?auto_628962 ) ) ( not ( = ?auto_628961 ?auto_628963 ) ) ( not ( = ?auto_628961 ?auto_628964 ) ) ( not ( = ?auto_628961 ?auto_628965 ) ) ( not ( = ?auto_628961 ?auto_628966 ) ) ( not ( = ?auto_628961 ?auto_628967 ) ) ( not ( = ?auto_628961 ?auto_628968 ) ) ( not ( = ?auto_628961 ?auto_628969 ) ) ( not ( = ?auto_628961 ?auto_628970 ) ) ( not ( = ?auto_628962 ?auto_628963 ) ) ( not ( = ?auto_628962 ?auto_628964 ) ) ( not ( = ?auto_628962 ?auto_628965 ) ) ( not ( = ?auto_628962 ?auto_628966 ) ) ( not ( = ?auto_628962 ?auto_628967 ) ) ( not ( = ?auto_628962 ?auto_628968 ) ) ( not ( = ?auto_628962 ?auto_628969 ) ) ( not ( = ?auto_628962 ?auto_628970 ) ) ( not ( = ?auto_628963 ?auto_628964 ) ) ( not ( = ?auto_628963 ?auto_628965 ) ) ( not ( = ?auto_628963 ?auto_628966 ) ) ( not ( = ?auto_628963 ?auto_628967 ) ) ( not ( = ?auto_628963 ?auto_628968 ) ) ( not ( = ?auto_628963 ?auto_628969 ) ) ( not ( = ?auto_628963 ?auto_628970 ) ) ( not ( = ?auto_628964 ?auto_628965 ) ) ( not ( = ?auto_628964 ?auto_628966 ) ) ( not ( = ?auto_628964 ?auto_628967 ) ) ( not ( = ?auto_628964 ?auto_628968 ) ) ( not ( = ?auto_628964 ?auto_628969 ) ) ( not ( = ?auto_628964 ?auto_628970 ) ) ( not ( = ?auto_628965 ?auto_628966 ) ) ( not ( = ?auto_628965 ?auto_628967 ) ) ( not ( = ?auto_628965 ?auto_628968 ) ) ( not ( = ?auto_628965 ?auto_628969 ) ) ( not ( = ?auto_628965 ?auto_628970 ) ) ( not ( = ?auto_628966 ?auto_628967 ) ) ( not ( = ?auto_628966 ?auto_628968 ) ) ( not ( = ?auto_628966 ?auto_628969 ) ) ( not ( = ?auto_628966 ?auto_628970 ) ) ( not ( = ?auto_628967 ?auto_628968 ) ) ( not ( = ?auto_628967 ?auto_628969 ) ) ( not ( = ?auto_628967 ?auto_628970 ) ) ( not ( = ?auto_628968 ?auto_628969 ) ) ( not ( = ?auto_628968 ?auto_628970 ) ) ( not ( = ?auto_628969 ?auto_628970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_628969 ?auto_628970 )
      ( !STACK ?auto_628969 ?auto_628968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629002 - BLOCK
      ?auto_629003 - BLOCK
      ?auto_629004 - BLOCK
      ?auto_629005 - BLOCK
      ?auto_629006 - BLOCK
      ?auto_629007 - BLOCK
      ?auto_629008 - BLOCK
      ?auto_629009 - BLOCK
      ?auto_629010 - BLOCK
      ?auto_629011 - BLOCK
    )
    :vars
    (
      ?auto_629012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629011 ?auto_629012 ) ( ON-TABLE ?auto_629002 ) ( ON ?auto_629003 ?auto_629002 ) ( ON ?auto_629004 ?auto_629003 ) ( ON ?auto_629005 ?auto_629004 ) ( ON ?auto_629006 ?auto_629005 ) ( ON ?auto_629007 ?auto_629006 ) ( ON ?auto_629008 ?auto_629007 ) ( ON ?auto_629009 ?auto_629008 ) ( not ( = ?auto_629002 ?auto_629003 ) ) ( not ( = ?auto_629002 ?auto_629004 ) ) ( not ( = ?auto_629002 ?auto_629005 ) ) ( not ( = ?auto_629002 ?auto_629006 ) ) ( not ( = ?auto_629002 ?auto_629007 ) ) ( not ( = ?auto_629002 ?auto_629008 ) ) ( not ( = ?auto_629002 ?auto_629009 ) ) ( not ( = ?auto_629002 ?auto_629010 ) ) ( not ( = ?auto_629002 ?auto_629011 ) ) ( not ( = ?auto_629002 ?auto_629012 ) ) ( not ( = ?auto_629003 ?auto_629004 ) ) ( not ( = ?auto_629003 ?auto_629005 ) ) ( not ( = ?auto_629003 ?auto_629006 ) ) ( not ( = ?auto_629003 ?auto_629007 ) ) ( not ( = ?auto_629003 ?auto_629008 ) ) ( not ( = ?auto_629003 ?auto_629009 ) ) ( not ( = ?auto_629003 ?auto_629010 ) ) ( not ( = ?auto_629003 ?auto_629011 ) ) ( not ( = ?auto_629003 ?auto_629012 ) ) ( not ( = ?auto_629004 ?auto_629005 ) ) ( not ( = ?auto_629004 ?auto_629006 ) ) ( not ( = ?auto_629004 ?auto_629007 ) ) ( not ( = ?auto_629004 ?auto_629008 ) ) ( not ( = ?auto_629004 ?auto_629009 ) ) ( not ( = ?auto_629004 ?auto_629010 ) ) ( not ( = ?auto_629004 ?auto_629011 ) ) ( not ( = ?auto_629004 ?auto_629012 ) ) ( not ( = ?auto_629005 ?auto_629006 ) ) ( not ( = ?auto_629005 ?auto_629007 ) ) ( not ( = ?auto_629005 ?auto_629008 ) ) ( not ( = ?auto_629005 ?auto_629009 ) ) ( not ( = ?auto_629005 ?auto_629010 ) ) ( not ( = ?auto_629005 ?auto_629011 ) ) ( not ( = ?auto_629005 ?auto_629012 ) ) ( not ( = ?auto_629006 ?auto_629007 ) ) ( not ( = ?auto_629006 ?auto_629008 ) ) ( not ( = ?auto_629006 ?auto_629009 ) ) ( not ( = ?auto_629006 ?auto_629010 ) ) ( not ( = ?auto_629006 ?auto_629011 ) ) ( not ( = ?auto_629006 ?auto_629012 ) ) ( not ( = ?auto_629007 ?auto_629008 ) ) ( not ( = ?auto_629007 ?auto_629009 ) ) ( not ( = ?auto_629007 ?auto_629010 ) ) ( not ( = ?auto_629007 ?auto_629011 ) ) ( not ( = ?auto_629007 ?auto_629012 ) ) ( not ( = ?auto_629008 ?auto_629009 ) ) ( not ( = ?auto_629008 ?auto_629010 ) ) ( not ( = ?auto_629008 ?auto_629011 ) ) ( not ( = ?auto_629008 ?auto_629012 ) ) ( not ( = ?auto_629009 ?auto_629010 ) ) ( not ( = ?auto_629009 ?auto_629011 ) ) ( not ( = ?auto_629009 ?auto_629012 ) ) ( not ( = ?auto_629010 ?auto_629011 ) ) ( not ( = ?auto_629010 ?auto_629012 ) ) ( not ( = ?auto_629011 ?auto_629012 ) ) ( CLEAR ?auto_629009 ) ( ON ?auto_629010 ?auto_629011 ) ( CLEAR ?auto_629010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_629002 ?auto_629003 ?auto_629004 ?auto_629005 ?auto_629006 ?auto_629007 ?auto_629008 ?auto_629009 ?auto_629010 )
      ( MAKE-10PILE ?auto_629002 ?auto_629003 ?auto_629004 ?auto_629005 ?auto_629006 ?auto_629007 ?auto_629008 ?auto_629009 ?auto_629010 ?auto_629011 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629044 - BLOCK
      ?auto_629045 - BLOCK
      ?auto_629046 - BLOCK
      ?auto_629047 - BLOCK
      ?auto_629048 - BLOCK
      ?auto_629049 - BLOCK
      ?auto_629050 - BLOCK
      ?auto_629051 - BLOCK
      ?auto_629052 - BLOCK
      ?auto_629053 - BLOCK
    )
    :vars
    (
      ?auto_629054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629053 ?auto_629054 ) ( ON-TABLE ?auto_629044 ) ( ON ?auto_629045 ?auto_629044 ) ( ON ?auto_629046 ?auto_629045 ) ( ON ?auto_629047 ?auto_629046 ) ( ON ?auto_629048 ?auto_629047 ) ( ON ?auto_629049 ?auto_629048 ) ( ON ?auto_629050 ?auto_629049 ) ( not ( = ?auto_629044 ?auto_629045 ) ) ( not ( = ?auto_629044 ?auto_629046 ) ) ( not ( = ?auto_629044 ?auto_629047 ) ) ( not ( = ?auto_629044 ?auto_629048 ) ) ( not ( = ?auto_629044 ?auto_629049 ) ) ( not ( = ?auto_629044 ?auto_629050 ) ) ( not ( = ?auto_629044 ?auto_629051 ) ) ( not ( = ?auto_629044 ?auto_629052 ) ) ( not ( = ?auto_629044 ?auto_629053 ) ) ( not ( = ?auto_629044 ?auto_629054 ) ) ( not ( = ?auto_629045 ?auto_629046 ) ) ( not ( = ?auto_629045 ?auto_629047 ) ) ( not ( = ?auto_629045 ?auto_629048 ) ) ( not ( = ?auto_629045 ?auto_629049 ) ) ( not ( = ?auto_629045 ?auto_629050 ) ) ( not ( = ?auto_629045 ?auto_629051 ) ) ( not ( = ?auto_629045 ?auto_629052 ) ) ( not ( = ?auto_629045 ?auto_629053 ) ) ( not ( = ?auto_629045 ?auto_629054 ) ) ( not ( = ?auto_629046 ?auto_629047 ) ) ( not ( = ?auto_629046 ?auto_629048 ) ) ( not ( = ?auto_629046 ?auto_629049 ) ) ( not ( = ?auto_629046 ?auto_629050 ) ) ( not ( = ?auto_629046 ?auto_629051 ) ) ( not ( = ?auto_629046 ?auto_629052 ) ) ( not ( = ?auto_629046 ?auto_629053 ) ) ( not ( = ?auto_629046 ?auto_629054 ) ) ( not ( = ?auto_629047 ?auto_629048 ) ) ( not ( = ?auto_629047 ?auto_629049 ) ) ( not ( = ?auto_629047 ?auto_629050 ) ) ( not ( = ?auto_629047 ?auto_629051 ) ) ( not ( = ?auto_629047 ?auto_629052 ) ) ( not ( = ?auto_629047 ?auto_629053 ) ) ( not ( = ?auto_629047 ?auto_629054 ) ) ( not ( = ?auto_629048 ?auto_629049 ) ) ( not ( = ?auto_629048 ?auto_629050 ) ) ( not ( = ?auto_629048 ?auto_629051 ) ) ( not ( = ?auto_629048 ?auto_629052 ) ) ( not ( = ?auto_629048 ?auto_629053 ) ) ( not ( = ?auto_629048 ?auto_629054 ) ) ( not ( = ?auto_629049 ?auto_629050 ) ) ( not ( = ?auto_629049 ?auto_629051 ) ) ( not ( = ?auto_629049 ?auto_629052 ) ) ( not ( = ?auto_629049 ?auto_629053 ) ) ( not ( = ?auto_629049 ?auto_629054 ) ) ( not ( = ?auto_629050 ?auto_629051 ) ) ( not ( = ?auto_629050 ?auto_629052 ) ) ( not ( = ?auto_629050 ?auto_629053 ) ) ( not ( = ?auto_629050 ?auto_629054 ) ) ( not ( = ?auto_629051 ?auto_629052 ) ) ( not ( = ?auto_629051 ?auto_629053 ) ) ( not ( = ?auto_629051 ?auto_629054 ) ) ( not ( = ?auto_629052 ?auto_629053 ) ) ( not ( = ?auto_629052 ?auto_629054 ) ) ( not ( = ?auto_629053 ?auto_629054 ) ) ( ON ?auto_629052 ?auto_629053 ) ( CLEAR ?auto_629050 ) ( ON ?auto_629051 ?auto_629052 ) ( CLEAR ?auto_629051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_629044 ?auto_629045 ?auto_629046 ?auto_629047 ?auto_629048 ?auto_629049 ?auto_629050 ?auto_629051 )
      ( MAKE-10PILE ?auto_629044 ?auto_629045 ?auto_629046 ?auto_629047 ?auto_629048 ?auto_629049 ?auto_629050 ?auto_629051 ?auto_629052 ?auto_629053 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629086 - BLOCK
      ?auto_629087 - BLOCK
      ?auto_629088 - BLOCK
      ?auto_629089 - BLOCK
      ?auto_629090 - BLOCK
      ?auto_629091 - BLOCK
      ?auto_629092 - BLOCK
      ?auto_629093 - BLOCK
      ?auto_629094 - BLOCK
      ?auto_629095 - BLOCK
    )
    :vars
    (
      ?auto_629096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629095 ?auto_629096 ) ( ON-TABLE ?auto_629086 ) ( ON ?auto_629087 ?auto_629086 ) ( ON ?auto_629088 ?auto_629087 ) ( ON ?auto_629089 ?auto_629088 ) ( ON ?auto_629090 ?auto_629089 ) ( ON ?auto_629091 ?auto_629090 ) ( not ( = ?auto_629086 ?auto_629087 ) ) ( not ( = ?auto_629086 ?auto_629088 ) ) ( not ( = ?auto_629086 ?auto_629089 ) ) ( not ( = ?auto_629086 ?auto_629090 ) ) ( not ( = ?auto_629086 ?auto_629091 ) ) ( not ( = ?auto_629086 ?auto_629092 ) ) ( not ( = ?auto_629086 ?auto_629093 ) ) ( not ( = ?auto_629086 ?auto_629094 ) ) ( not ( = ?auto_629086 ?auto_629095 ) ) ( not ( = ?auto_629086 ?auto_629096 ) ) ( not ( = ?auto_629087 ?auto_629088 ) ) ( not ( = ?auto_629087 ?auto_629089 ) ) ( not ( = ?auto_629087 ?auto_629090 ) ) ( not ( = ?auto_629087 ?auto_629091 ) ) ( not ( = ?auto_629087 ?auto_629092 ) ) ( not ( = ?auto_629087 ?auto_629093 ) ) ( not ( = ?auto_629087 ?auto_629094 ) ) ( not ( = ?auto_629087 ?auto_629095 ) ) ( not ( = ?auto_629087 ?auto_629096 ) ) ( not ( = ?auto_629088 ?auto_629089 ) ) ( not ( = ?auto_629088 ?auto_629090 ) ) ( not ( = ?auto_629088 ?auto_629091 ) ) ( not ( = ?auto_629088 ?auto_629092 ) ) ( not ( = ?auto_629088 ?auto_629093 ) ) ( not ( = ?auto_629088 ?auto_629094 ) ) ( not ( = ?auto_629088 ?auto_629095 ) ) ( not ( = ?auto_629088 ?auto_629096 ) ) ( not ( = ?auto_629089 ?auto_629090 ) ) ( not ( = ?auto_629089 ?auto_629091 ) ) ( not ( = ?auto_629089 ?auto_629092 ) ) ( not ( = ?auto_629089 ?auto_629093 ) ) ( not ( = ?auto_629089 ?auto_629094 ) ) ( not ( = ?auto_629089 ?auto_629095 ) ) ( not ( = ?auto_629089 ?auto_629096 ) ) ( not ( = ?auto_629090 ?auto_629091 ) ) ( not ( = ?auto_629090 ?auto_629092 ) ) ( not ( = ?auto_629090 ?auto_629093 ) ) ( not ( = ?auto_629090 ?auto_629094 ) ) ( not ( = ?auto_629090 ?auto_629095 ) ) ( not ( = ?auto_629090 ?auto_629096 ) ) ( not ( = ?auto_629091 ?auto_629092 ) ) ( not ( = ?auto_629091 ?auto_629093 ) ) ( not ( = ?auto_629091 ?auto_629094 ) ) ( not ( = ?auto_629091 ?auto_629095 ) ) ( not ( = ?auto_629091 ?auto_629096 ) ) ( not ( = ?auto_629092 ?auto_629093 ) ) ( not ( = ?auto_629092 ?auto_629094 ) ) ( not ( = ?auto_629092 ?auto_629095 ) ) ( not ( = ?auto_629092 ?auto_629096 ) ) ( not ( = ?auto_629093 ?auto_629094 ) ) ( not ( = ?auto_629093 ?auto_629095 ) ) ( not ( = ?auto_629093 ?auto_629096 ) ) ( not ( = ?auto_629094 ?auto_629095 ) ) ( not ( = ?auto_629094 ?auto_629096 ) ) ( not ( = ?auto_629095 ?auto_629096 ) ) ( ON ?auto_629094 ?auto_629095 ) ( ON ?auto_629093 ?auto_629094 ) ( CLEAR ?auto_629091 ) ( ON ?auto_629092 ?auto_629093 ) ( CLEAR ?auto_629092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_629086 ?auto_629087 ?auto_629088 ?auto_629089 ?auto_629090 ?auto_629091 ?auto_629092 )
      ( MAKE-10PILE ?auto_629086 ?auto_629087 ?auto_629088 ?auto_629089 ?auto_629090 ?auto_629091 ?auto_629092 ?auto_629093 ?auto_629094 ?auto_629095 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629128 - BLOCK
      ?auto_629129 - BLOCK
      ?auto_629130 - BLOCK
      ?auto_629131 - BLOCK
      ?auto_629132 - BLOCK
      ?auto_629133 - BLOCK
      ?auto_629134 - BLOCK
      ?auto_629135 - BLOCK
      ?auto_629136 - BLOCK
      ?auto_629137 - BLOCK
    )
    :vars
    (
      ?auto_629138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629137 ?auto_629138 ) ( ON-TABLE ?auto_629128 ) ( ON ?auto_629129 ?auto_629128 ) ( ON ?auto_629130 ?auto_629129 ) ( ON ?auto_629131 ?auto_629130 ) ( ON ?auto_629132 ?auto_629131 ) ( not ( = ?auto_629128 ?auto_629129 ) ) ( not ( = ?auto_629128 ?auto_629130 ) ) ( not ( = ?auto_629128 ?auto_629131 ) ) ( not ( = ?auto_629128 ?auto_629132 ) ) ( not ( = ?auto_629128 ?auto_629133 ) ) ( not ( = ?auto_629128 ?auto_629134 ) ) ( not ( = ?auto_629128 ?auto_629135 ) ) ( not ( = ?auto_629128 ?auto_629136 ) ) ( not ( = ?auto_629128 ?auto_629137 ) ) ( not ( = ?auto_629128 ?auto_629138 ) ) ( not ( = ?auto_629129 ?auto_629130 ) ) ( not ( = ?auto_629129 ?auto_629131 ) ) ( not ( = ?auto_629129 ?auto_629132 ) ) ( not ( = ?auto_629129 ?auto_629133 ) ) ( not ( = ?auto_629129 ?auto_629134 ) ) ( not ( = ?auto_629129 ?auto_629135 ) ) ( not ( = ?auto_629129 ?auto_629136 ) ) ( not ( = ?auto_629129 ?auto_629137 ) ) ( not ( = ?auto_629129 ?auto_629138 ) ) ( not ( = ?auto_629130 ?auto_629131 ) ) ( not ( = ?auto_629130 ?auto_629132 ) ) ( not ( = ?auto_629130 ?auto_629133 ) ) ( not ( = ?auto_629130 ?auto_629134 ) ) ( not ( = ?auto_629130 ?auto_629135 ) ) ( not ( = ?auto_629130 ?auto_629136 ) ) ( not ( = ?auto_629130 ?auto_629137 ) ) ( not ( = ?auto_629130 ?auto_629138 ) ) ( not ( = ?auto_629131 ?auto_629132 ) ) ( not ( = ?auto_629131 ?auto_629133 ) ) ( not ( = ?auto_629131 ?auto_629134 ) ) ( not ( = ?auto_629131 ?auto_629135 ) ) ( not ( = ?auto_629131 ?auto_629136 ) ) ( not ( = ?auto_629131 ?auto_629137 ) ) ( not ( = ?auto_629131 ?auto_629138 ) ) ( not ( = ?auto_629132 ?auto_629133 ) ) ( not ( = ?auto_629132 ?auto_629134 ) ) ( not ( = ?auto_629132 ?auto_629135 ) ) ( not ( = ?auto_629132 ?auto_629136 ) ) ( not ( = ?auto_629132 ?auto_629137 ) ) ( not ( = ?auto_629132 ?auto_629138 ) ) ( not ( = ?auto_629133 ?auto_629134 ) ) ( not ( = ?auto_629133 ?auto_629135 ) ) ( not ( = ?auto_629133 ?auto_629136 ) ) ( not ( = ?auto_629133 ?auto_629137 ) ) ( not ( = ?auto_629133 ?auto_629138 ) ) ( not ( = ?auto_629134 ?auto_629135 ) ) ( not ( = ?auto_629134 ?auto_629136 ) ) ( not ( = ?auto_629134 ?auto_629137 ) ) ( not ( = ?auto_629134 ?auto_629138 ) ) ( not ( = ?auto_629135 ?auto_629136 ) ) ( not ( = ?auto_629135 ?auto_629137 ) ) ( not ( = ?auto_629135 ?auto_629138 ) ) ( not ( = ?auto_629136 ?auto_629137 ) ) ( not ( = ?auto_629136 ?auto_629138 ) ) ( not ( = ?auto_629137 ?auto_629138 ) ) ( ON ?auto_629136 ?auto_629137 ) ( ON ?auto_629135 ?auto_629136 ) ( ON ?auto_629134 ?auto_629135 ) ( CLEAR ?auto_629132 ) ( ON ?auto_629133 ?auto_629134 ) ( CLEAR ?auto_629133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_629128 ?auto_629129 ?auto_629130 ?auto_629131 ?auto_629132 ?auto_629133 )
      ( MAKE-10PILE ?auto_629128 ?auto_629129 ?auto_629130 ?auto_629131 ?auto_629132 ?auto_629133 ?auto_629134 ?auto_629135 ?auto_629136 ?auto_629137 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629170 - BLOCK
      ?auto_629171 - BLOCK
      ?auto_629172 - BLOCK
      ?auto_629173 - BLOCK
      ?auto_629174 - BLOCK
      ?auto_629175 - BLOCK
      ?auto_629176 - BLOCK
      ?auto_629177 - BLOCK
      ?auto_629178 - BLOCK
      ?auto_629179 - BLOCK
    )
    :vars
    (
      ?auto_629180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629179 ?auto_629180 ) ( ON-TABLE ?auto_629170 ) ( ON ?auto_629171 ?auto_629170 ) ( ON ?auto_629172 ?auto_629171 ) ( ON ?auto_629173 ?auto_629172 ) ( not ( = ?auto_629170 ?auto_629171 ) ) ( not ( = ?auto_629170 ?auto_629172 ) ) ( not ( = ?auto_629170 ?auto_629173 ) ) ( not ( = ?auto_629170 ?auto_629174 ) ) ( not ( = ?auto_629170 ?auto_629175 ) ) ( not ( = ?auto_629170 ?auto_629176 ) ) ( not ( = ?auto_629170 ?auto_629177 ) ) ( not ( = ?auto_629170 ?auto_629178 ) ) ( not ( = ?auto_629170 ?auto_629179 ) ) ( not ( = ?auto_629170 ?auto_629180 ) ) ( not ( = ?auto_629171 ?auto_629172 ) ) ( not ( = ?auto_629171 ?auto_629173 ) ) ( not ( = ?auto_629171 ?auto_629174 ) ) ( not ( = ?auto_629171 ?auto_629175 ) ) ( not ( = ?auto_629171 ?auto_629176 ) ) ( not ( = ?auto_629171 ?auto_629177 ) ) ( not ( = ?auto_629171 ?auto_629178 ) ) ( not ( = ?auto_629171 ?auto_629179 ) ) ( not ( = ?auto_629171 ?auto_629180 ) ) ( not ( = ?auto_629172 ?auto_629173 ) ) ( not ( = ?auto_629172 ?auto_629174 ) ) ( not ( = ?auto_629172 ?auto_629175 ) ) ( not ( = ?auto_629172 ?auto_629176 ) ) ( not ( = ?auto_629172 ?auto_629177 ) ) ( not ( = ?auto_629172 ?auto_629178 ) ) ( not ( = ?auto_629172 ?auto_629179 ) ) ( not ( = ?auto_629172 ?auto_629180 ) ) ( not ( = ?auto_629173 ?auto_629174 ) ) ( not ( = ?auto_629173 ?auto_629175 ) ) ( not ( = ?auto_629173 ?auto_629176 ) ) ( not ( = ?auto_629173 ?auto_629177 ) ) ( not ( = ?auto_629173 ?auto_629178 ) ) ( not ( = ?auto_629173 ?auto_629179 ) ) ( not ( = ?auto_629173 ?auto_629180 ) ) ( not ( = ?auto_629174 ?auto_629175 ) ) ( not ( = ?auto_629174 ?auto_629176 ) ) ( not ( = ?auto_629174 ?auto_629177 ) ) ( not ( = ?auto_629174 ?auto_629178 ) ) ( not ( = ?auto_629174 ?auto_629179 ) ) ( not ( = ?auto_629174 ?auto_629180 ) ) ( not ( = ?auto_629175 ?auto_629176 ) ) ( not ( = ?auto_629175 ?auto_629177 ) ) ( not ( = ?auto_629175 ?auto_629178 ) ) ( not ( = ?auto_629175 ?auto_629179 ) ) ( not ( = ?auto_629175 ?auto_629180 ) ) ( not ( = ?auto_629176 ?auto_629177 ) ) ( not ( = ?auto_629176 ?auto_629178 ) ) ( not ( = ?auto_629176 ?auto_629179 ) ) ( not ( = ?auto_629176 ?auto_629180 ) ) ( not ( = ?auto_629177 ?auto_629178 ) ) ( not ( = ?auto_629177 ?auto_629179 ) ) ( not ( = ?auto_629177 ?auto_629180 ) ) ( not ( = ?auto_629178 ?auto_629179 ) ) ( not ( = ?auto_629178 ?auto_629180 ) ) ( not ( = ?auto_629179 ?auto_629180 ) ) ( ON ?auto_629178 ?auto_629179 ) ( ON ?auto_629177 ?auto_629178 ) ( ON ?auto_629176 ?auto_629177 ) ( ON ?auto_629175 ?auto_629176 ) ( CLEAR ?auto_629173 ) ( ON ?auto_629174 ?auto_629175 ) ( CLEAR ?auto_629174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_629170 ?auto_629171 ?auto_629172 ?auto_629173 ?auto_629174 )
      ( MAKE-10PILE ?auto_629170 ?auto_629171 ?auto_629172 ?auto_629173 ?auto_629174 ?auto_629175 ?auto_629176 ?auto_629177 ?auto_629178 ?auto_629179 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629212 - BLOCK
      ?auto_629213 - BLOCK
      ?auto_629214 - BLOCK
      ?auto_629215 - BLOCK
      ?auto_629216 - BLOCK
      ?auto_629217 - BLOCK
      ?auto_629218 - BLOCK
      ?auto_629219 - BLOCK
      ?auto_629220 - BLOCK
      ?auto_629221 - BLOCK
    )
    :vars
    (
      ?auto_629222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629221 ?auto_629222 ) ( ON-TABLE ?auto_629212 ) ( ON ?auto_629213 ?auto_629212 ) ( ON ?auto_629214 ?auto_629213 ) ( not ( = ?auto_629212 ?auto_629213 ) ) ( not ( = ?auto_629212 ?auto_629214 ) ) ( not ( = ?auto_629212 ?auto_629215 ) ) ( not ( = ?auto_629212 ?auto_629216 ) ) ( not ( = ?auto_629212 ?auto_629217 ) ) ( not ( = ?auto_629212 ?auto_629218 ) ) ( not ( = ?auto_629212 ?auto_629219 ) ) ( not ( = ?auto_629212 ?auto_629220 ) ) ( not ( = ?auto_629212 ?auto_629221 ) ) ( not ( = ?auto_629212 ?auto_629222 ) ) ( not ( = ?auto_629213 ?auto_629214 ) ) ( not ( = ?auto_629213 ?auto_629215 ) ) ( not ( = ?auto_629213 ?auto_629216 ) ) ( not ( = ?auto_629213 ?auto_629217 ) ) ( not ( = ?auto_629213 ?auto_629218 ) ) ( not ( = ?auto_629213 ?auto_629219 ) ) ( not ( = ?auto_629213 ?auto_629220 ) ) ( not ( = ?auto_629213 ?auto_629221 ) ) ( not ( = ?auto_629213 ?auto_629222 ) ) ( not ( = ?auto_629214 ?auto_629215 ) ) ( not ( = ?auto_629214 ?auto_629216 ) ) ( not ( = ?auto_629214 ?auto_629217 ) ) ( not ( = ?auto_629214 ?auto_629218 ) ) ( not ( = ?auto_629214 ?auto_629219 ) ) ( not ( = ?auto_629214 ?auto_629220 ) ) ( not ( = ?auto_629214 ?auto_629221 ) ) ( not ( = ?auto_629214 ?auto_629222 ) ) ( not ( = ?auto_629215 ?auto_629216 ) ) ( not ( = ?auto_629215 ?auto_629217 ) ) ( not ( = ?auto_629215 ?auto_629218 ) ) ( not ( = ?auto_629215 ?auto_629219 ) ) ( not ( = ?auto_629215 ?auto_629220 ) ) ( not ( = ?auto_629215 ?auto_629221 ) ) ( not ( = ?auto_629215 ?auto_629222 ) ) ( not ( = ?auto_629216 ?auto_629217 ) ) ( not ( = ?auto_629216 ?auto_629218 ) ) ( not ( = ?auto_629216 ?auto_629219 ) ) ( not ( = ?auto_629216 ?auto_629220 ) ) ( not ( = ?auto_629216 ?auto_629221 ) ) ( not ( = ?auto_629216 ?auto_629222 ) ) ( not ( = ?auto_629217 ?auto_629218 ) ) ( not ( = ?auto_629217 ?auto_629219 ) ) ( not ( = ?auto_629217 ?auto_629220 ) ) ( not ( = ?auto_629217 ?auto_629221 ) ) ( not ( = ?auto_629217 ?auto_629222 ) ) ( not ( = ?auto_629218 ?auto_629219 ) ) ( not ( = ?auto_629218 ?auto_629220 ) ) ( not ( = ?auto_629218 ?auto_629221 ) ) ( not ( = ?auto_629218 ?auto_629222 ) ) ( not ( = ?auto_629219 ?auto_629220 ) ) ( not ( = ?auto_629219 ?auto_629221 ) ) ( not ( = ?auto_629219 ?auto_629222 ) ) ( not ( = ?auto_629220 ?auto_629221 ) ) ( not ( = ?auto_629220 ?auto_629222 ) ) ( not ( = ?auto_629221 ?auto_629222 ) ) ( ON ?auto_629220 ?auto_629221 ) ( ON ?auto_629219 ?auto_629220 ) ( ON ?auto_629218 ?auto_629219 ) ( ON ?auto_629217 ?auto_629218 ) ( ON ?auto_629216 ?auto_629217 ) ( CLEAR ?auto_629214 ) ( ON ?auto_629215 ?auto_629216 ) ( CLEAR ?auto_629215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_629212 ?auto_629213 ?auto_629214 ?auto_629215 )
      ( MAKE-10PILE ?auto_629212 ?auto_629213 ?auto_629214 ?auto_629215 ?auto_629216 ?auto_629217 ?auto_629218 ?auto_629219 ?auto_629220 ?auto_629221 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629254 - BLOCK
      ?auto_629255 - BLOCK
      ?auto_629256 - BLOCK
      ?auto_629257 - BLOCK
      ?auto_629258 - BLOCK
      ?auto_629259 - BLOCK
      ?auto_629260 - BLOCK
      ?auto_629261 - BLOCK
      ?auto_629262 - BLOCK
      ?auto_629263 - BLOCK
    )
    :vars
    (
      ?auto_629264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629263 ?auto_629264 ) ( ON-TABLE ?auto_629254 ) ( ON ?auto_629255 ?auto_629254 ) ( not ( = ?auto_629254 ?auto_629255 ) ) ( not ( = ?auto_629254 ?auto_629256 ) ) ( not ( = ?auto_629254 ?auto_629257 ) ) ( not ( = ?auto_629254 ?auto_629258 ) ) ( not ( = ?auto_629254 ?auto_629259 ) ) ( not ( = ?auto_629254 ?auto_629260 ) ) ( not ( = ?auto_629254 ?auto_629261 ) ) ( not ( = ?auto_629254 ?auto_629262 ) ) ( not ( = ?auto_629254 ?auto_629263 ) ) ( not ( = ?auto_629254 ?auto_629264 ) ) ( not ( = ?auto_629255 ?auto_629256 ) ) ( not ( = ?auto_629255 ?auto_629257 ) ) ( not ( = ?auto_629255 ?auto_629258 ) ) ( not ( = ?auto_629255 ?auto_629259 ) ) ( not ( = ?auto_629255 ?auto_629260 ) ) ( not ( = ?auto_629255 ?auto_629261 ) ) ( not ( = ?auto_629255 ?auto_629262 ) ) ( not ( = ?auto_629255 ?auto_629263 ) ) ( not ( = ?auto_629255 ?auto_629264 ) ) ( not ( = ?auto_629256 ?auto_629257 ) ) ( not ( = ?auto_629256 ?auto_629258 ) ) ( not ( = ?auto_629256 ?auto_629259 ) ) ( not ( = ?auto_629256 ?auto_629260 ) ) ( not ( = ?auto_629256 ?auto_629261 ) ) ( not ( = ?auto_629256 ?auto_629262 ) ) ( not ( = ?auto_629256 ?auto_629263 ) ) ( not ( = ?auto_629256 ?auto_629264 ) ) ( not ( = ?auto_629257 ?auto_629258 ) ) ( not ( = ?auto_629257 ?auto_629259 ) ) ( not ( = ?auto_629257 ?auto_629260 ) ) ( not ( = ?auto_629257 ?auto_629261 ) ) ( not ( = ?auto_629257 ?auto_629262 ) ) ( not ( = ?auto_629257 ?auto_629263 ) ) ( not ( = ?auto_629257 ?auto_629264 ) ) ( not ( = ?auto_629258 ?auto_629259 ) ) ( not ( = ?auto_629258 ?auto_629260 ) ) ( not ( = ?auto_629258 ?auto_629261 ) ) ( not ( = ?auto_629258 ?auto_629262 ) ) ( not ( = ?auto_629258 ?auto_629263 ) ) ( not ( = ?auto_629258 ?auto_629264 ) ) ( not ( = ?auto_629259 ?auto_629260 ) ) ( not ( = ?auto_629259 ?auto_629261 ) ) ( not ( = ?auto_629259 ?auto_629262 ) ) ( not ( = ?auto_629259 ?auto_629263 ) ) ( not ( = ?auto_629259 ?auto_629264 ) ) ( not ( = ?auto_629260 ?auto_629261 ) ) ( not ( = ?auto_629260 ?auto_629262 ) ) ( not ( = ?auto_629260 ?auto_629263 ) ) ( not ( = ?auto_629260 ?auto_629264 ) ) ( not ( = ?auto_629261 ?auto_629262 ) ) ( not ( = ?auto_629261 ?auto_629263 ) ) ( not ( = ?auto_629261 ?auto_629264 ) ) ( not ( = ?auto_629262 ?auto_629263 ) ) ( not ( = ?auto_629262 ?auto_629264 ) ) ( not ( = ?auto_629263 ?auto_629264 ) ) ( ON ?auto_629262 ?auto_629263 ) ( ON ?auto_629261 ?auto_629262 ) ( ON ?auto_629260 ?auto_629261 ) ( ON ?auto_629259 ?auto_629260 ) ( ON ?auto_629258 ?auto_629259 ) ( ON ?auto_629257 ?auto_629258 ) ( CLEAR ?auto_629255 ) ( ON ?auto_629256 ?auto_629257 ) ( CLEAR ?auto_629256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_629254 ?auto_629255 ?auto_629256 )
      ( MAKE-10PILE ?auto_629254 ?auto_629255 ?auto_629256 ?auto_629257 ?auto_629258 ?auto_629259 ?auto_629260 ?auto_629261 ?auto_629262 ?auto_629263 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629296 - BLOCK
      ?auto_629297 - BLOCK
      ?auto_629298 - BLOCK
      ?auto_629299 - BLOCK
      ?auto_629300 - BLOCK
      ?auto_629301 - BLOCK
      ?auto_629302 - BLOCK
      ?auto_629303 - BLOCK
      ?auto_629304 - BLOCK
      ?auto_629305 - BLOCK
    )
    :vars
    (
      ?auto_629306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629305 ?auto_629306 ) ( ON-TABLE ?auto_629296 ) ( not ( = ?auto_629296 ?auto_629297 ) ) ( not ( = ?auto_629296 ?auto_629298 ) ) ( not ( = ?auto_629296 ?auto_629299 ) ) ( not ( = ?auto_629296 ?auto_629300 ) ) ( not ( = ?auto_629296 ?auto_629301 ) ) ( not ( = ?auto_629296 ?auto_629302 ) ) ( not ( = ?auto_629296 ?auto_629303 ) ) ( not ( = ?auto_629296 ?auto_629304 ) ) ( not ( = ?auto_629296 ?auto_629305 ) ) ( not ( = ?auto_629296 ?auto_629306 ) ) ( not ( = ?auto_629297 ?auto_629298 ) ) ( not ( = ?auto_629297 ?auto_629299 ) ) ( not ( = ?auto_629297 ?auto_629300 ) ) ( not ( = ?auto_629297 ?auto_629301 ) ) ( not ( = ?auto_629297 ?auto_629302 ) ) ( not ( = ?auto_629297 ?auto_629303 ) ) ( not ( = ?auto_629297 ?auto_629304 ) ) ( not ( = ?auto_629297 ?auto_629305 ) ) ( not ( = ?auto_629297 ?auto_629306 ) ) ( not ( = ?auto_629298 ?auto_629299 ) ) ( not ( = ?auto_629298 ?auto_629300 ) ) ( not ( = ?auto_629298 ?auto_629301 ) ) ( not ( = ?auto_629298 ?auto_629302 ) ) ( not ( = ?auto_629298 ?auto_629303 ) ) ( not ( = ?auto_629298 ?auto_629304 ) ) ( not ( = ?auto_629298 ?auto_629305 ) ) ( not ( = ?auto_629298 ?auto_629306 ) ) ( not ( = ?auto_629299 ?auto_629300 ) ) ( not ( = ?auto_629299 ?auto_629301 ) ) ( not ( = ?auto_629299 ?auto_629302 ) ) ( not ( = ?auto_629299 ?auto_629303 ) ) ( not ( = ?auto_629299 ?auto_629304 ) ) ( not ( = ?auto_629299 ?auto_629305 ) ) ( not ( = ?auto_629299 ?auto_629306 ) ) ( not ( = ?auto_629300 ?auto_629301 ) ) ( not ( = ?auto_629300 ?auto_629302 ) ) ( not ( = ?auto_629300 ?auto_629303 ) ) ( not ( = ?auto_629300 ?auto_629304 ) ) ( not ( = ?auto_629300 ?auto_629305 ) ) ( not ( = ?auto_629300 ?auto_629306 ) ) ( not ( = ?auto_629301 ?auto_629302 ) ) ( not ( = ?auto_629301 ?auto_629303 ) ) ( not ( = ?auto_629301 ?auto_629304 ) ) ( not ( = ?auto_629301 ?auto_629305 ) ) ( not ( = ?auto_629301 ?auto_629306 ) ) ( not ( = ?auto_629302 ?auto_629303 ) ) ( not ( = ?auto_629302 ?auto_629304 ) ) ( not ( = ?auto_629302 ?auto_629305 ) ) ( not ( = ?auto_629302 ?auto_629306 ) ) ( not ( = ?auto_629303 ?auto_629304 ) ) ( not ( = ?auto_629303 ?auto_629305 ) ) ( not ( = ?auto_629303 ?auto_629306 ) ) ( not ( = ?auto_629304 ?auto_629305 ) ) ( not ( = ?auto_629304 ?auto_629306 ) ) ( not ( = ?auto_629305 ?auto_629306 ) ) ( ON ?auto_629304 ?auto_629305 ) ( ON ?auto_629303 ?auto_629304 ) ( ON ?auto_629302 ?auto_629303 ) ( ON ?auto_629301 ?auto_629302 ) ( ON ?auto_629300 ?auto_629301 ) ( ON ?auto_629299 ?auto_629300 ) ( ON ?auto_629298 ?auto_629299 ) ( CLEAR ?auto_629296 ) ( ON ?auto_629297 ?auto_629298 ) ( CLEAR ?auto_629297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_629296 ?auto_629297 )
      ( MAKE-10PILE ?auto_629296 ?auto_629297 ?auto_629298 ?auto_629299 ?auto_629300 ?auto_629301 ?auto_629302 ?auto_629303 ?auto_629304 ?auto_629305 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_629338 - BLOCK
      ?auto_629339 - BLOCK
      ?auto_629340 - BLOCK
      ?auto_629341 - BLOCK
      ?auto_629342 - BLOCK
      ?auto_629343 - BLOCK
      ?auto_629344 - BLOCK
      ?auto_629345 - BLOCK
      ?auto_629346 - BLOCK
      ?auto_629347 - BLOCK
    )
    :vars
    (
      ?auto_629348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629347 ?auto_629348 ) ( not ( = ?auto_629338 ?auto_629339 ) ) ( not ( = ?auto_629338 ?auto_629340 ) ) ( not ( = ?auto_629338 ?auto_629341 ) ) ( not ( = ?auto_629338 ?auto_629342 ) ) ( not ( = ?auto_629338 ?auto_629343 ) ) ( not ( = ?auto_629338 ?auto_629344 ) ) ( not ( = ?auto_629338 ?auto_629345 ) ) ( not ( = ?auto_629338 ?auto_629346 ) ) ( not ( = ?auto_629338 ?auto_629347 ) ) ( not ( = ?auto_629338 ?auto_629348 ) ) ( not ( = ?auto_629339 ?auto_629340 ) ) ( not ( = ?auto_629339 ?auto_629341 ) ) ( not ( = ?auto_629339 ?auto_629342 ) ) ( not ( = ?auto_629339 ?auto_629343 ) ) ( not ( = ?auto_629339 ?auto_629344 ) ) ( not ( = ?auto_629339 ?auto_629345 ) ) ( not ( = ?auto_629339 ?auto_629346 ) ) ( not ( = ?auto_629339 ?auto_629347 ) ) ( not ( = ?auto_629339 ?auto_629348 ) ) ( not ( = ?auto_629340 ?auto_629341 ) ) ( not ( = ?auto_629340 ?auto_629342 ) ) ( not ( = ?auto_629340 ?auto_629343 ) ) ( not ( = ?auto_629340 ?auto_629344 ) ) ( not ( = ?auto_629340 ?auto_629345 ) ) ( not ( = ?auto_629340 ?auto_629346 ) ) ( not ( = ?auto_629340 ?auto_629347 ) ) ( not ( = ?auto_629340 ?auto_629348 ) ) ( not ( = ?auto_629341 ?auto_629342 ) ) ( not ( = ?auto_629341 ?auto_629343 ) ) ( not ( = ?auto_629341 ?auto_629344 ) ) ( not ( = ?auto_629341 ?auto_629345 ) ) ( not ( = ?auto_629341 ?auto_629346 ) ) ( not ( = ?auto_629341 ?auto_629347 ) ) ( not ( = ?auto_629341 ?auto_629348 ) ) ( not ( = ?auto_629342 ?auto_629343 ) ) ( not ( = ?auto_629342 ?auto_629344 ) ) ( not ( = ?auto_629342 ?auto_629345 ) ) ( not ( = ?auto_629342 ?auto_629346 ) ) ( not ( = ?auto_629342 ?auto_629347 ) ) ( not ( = ?auto_629342 ?auto_629348 ) ) ( not ( = ?auto_629343 ?auto_629344 ) ) ( not ( = ?auto_629343 ?auto_629345 ) ) ( not ( = ?auto_629343 ?auto_629346 ) ) ( not ( = ?auto_629343 ?auto_629347 ) ) ( not ( = ?auto_629343 ?auto_629348 ) ) ( not ( = ?auto_629344 ?auto_629345 ) ) ( not ( = ?auto_629344 ?auto_629346 ) ) ( not ( = ?auto_629344 ?auto_629347 ) ) ( not ( = ?auto_629344 ?auto_629348 ) ) ( not ( = ?auto_629345 ?auto_629346 ) ) ( not ( = ?auto_629345 ?auto_629347 ) ) ( not ( = ?auto_629345 ?auto_629348 ) ) ( not ( = ?auto_629346 ?auto_629347 ) ) ( not ( = ?auto_629346 ?auto_629348 ) ) ( not ( = ?auto_629347 ?auto_629348 ) ) ( ON ?auto_629346 ?auto_629347 ) ( ON ?auto_629345 ?auto_629346 ) ( ON ?auto_629344 ?auto_629345 ) ( ON ?auto_629343 ?auto_629344 ) ( ON ?auto_629342 ?auto_629343 ) ( ON ?auto_629341 ?auto_629342 ) ( ON ?auto_629340 ?auto_629341 ) ( ON ?auto_629339 ?auto_629340 ) ( ON ?auto_629338 ?auto_629339 ) ( CLEAR ?auto_629338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_629338 )
      ( MAKE-10PILE ?auto_629338 ?auto_629339 ?auto_629340 ?auto_629341 ?auto_629342 ?auto_629343 ?auto_629344 ?auto_629345 ?auto_629346 ?auto_629347 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629381 - BLOCK
      ?auto_629382 - BLOCK
      ?auto_629383 - BLOCK
      ?auto_629384 - BLOCK
      ?auto_629385 - BLOCK
      ?auto_629386 - BLOCK
      ?auto_629387 - BLOCK
      ?auto_629388 - BLOCK
      ?auto_629389 - BLOCK
      ?auto_629390 - BLOCK
      ?auto_629391 - BLOCK
    )
    :vars
    (
      ?auto_629392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_629390 ) ( ON ?auto_629391 ?auto_629392 ) ( CLEAR ?auto_629391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_629381 ) ( ON ?auto_629382 ?auto_629381 ) ( ON ?auto_629383 ?auto_629382 ) ( ON ?auto_629384 ?auto_629383 ) ( ON ?auto_629385 ?auto_629384 ) ( ON ?auto_629386 ?auto_629385 ) ( ON ?auto_629387 ?auto_629386 ) ( ON ?auto_629388 ?auto_629387 ) ( ON ?auto_629389 ?auto_629388 ) ( ON ?auto_629390 ?auto_629389 ) ( not ( = ?auto_629381 ?auto_629382 ) ) ( not ( = ?auto_629381 ?auto_629383 ) ) ( not ( = ?auto_629381 ?auto_629384 ) ) ( not ( = ?auto_629381 ?auto_629385 ) ) ( not ( = ?auto_629381 ?auto_629386 ) ) ( not ( = ?auto_629381 ?auto_629387 ) ) ( not ( = ?auto_629381 ?auto_629388 ) ) ( not ( = ?auto_629381 ?auto_629389 ) ) ( not ( = ?auto_629381 ?auto_629390 ) ) ( not ( = ?auto_629381 ?auto_629391 ) ) ( not ( = ?auto_629381 ?auto_629392 ) ) ( not ( = ?auto_629382 ?auto_629383 ) ) ( not ( = ?auto_629382 ?auto_629384 ) ) ( not ( = ?auto_629382 ?auto_629385 ) ) ( not ( = ?auto_629382 ?auto_629386 ) ) ( not ( = ?auto_629382 ?auto_629387 ) ) ( not ( = ?auto_629382 ?auto_629388 ) ) ( not ( = ?auto_629382 ?auto_629389 ) ) ( not ( = ?auto_629382 ?auto_629390 ) ) ( not ( = ?auto_629382 ?auto_629391 ) ) ( not ( = ?auto_629382 ?auto_629392 ) ) ( not ( = ?auto_629383 ?auto_629384 ) ) ( not ( = ?auto_629383 ?auto_629385 ) ) ( not ( = ?auto_629383 ?auto_629386 ) ) ( not ( = ?auto_629383 ?auto_629387 ) ) ( not ( = ?auto_629383 ?auto_629388 ) ) ( not ( = ?auto_629383 ?auto_629389 ) ) ( not ( = ?auto_629383 ?auto_629390 ) ) ( not ( = ?auto_629383 ?auto_629391 ) ) ( not ( = ?auto_629383 ?auto_629392 ) ) ( not ( = ?auto_629384 ?auto_629385 ) ) ( not ( = ?auto_629384 ?auto_629386 ) ) ( not ( = ?auto_629384 ?auto_629387 ) ) ( not ( = ?auto_629384 ?auto_629388 ) ) ( not ( = ?auto_629384 ?auto_629389 ) ) ( not ( = ?auto_629384 ?auto_629390 ) ) ( not ( = ?auto_629384 ?auto_629391 ) ) ( not ( = ?auto_629384 ?auto_629392 ) ) ( not ( = ?auto_629385 ?auto_629386 ) ) ( not ( = ?auto_629385 ?auto_629387 ) ) ( not ( = ?auto_629385 ?auto_629388 ) ) ( not ( = ?auto_629385 ?auto_629389 ) ) ( not ( = ?auto_629385 ?auto_629390 ) ) ( not ( = ?auto_629385 ?auto_629391 ) ) ( not ( = ?auto_629385 ?auto_629392 ) ) ( not ( = ?auto_629386 ?auto_629387 ) ) ( not ( = ?auto_629386 ?auto_629388 ) ) ( not ( = ?auto_629386 ?auto_629389 ) ) ( not ( = ?auto_629386 ?auto_629390 ) ) ( not ( = ?auto_629386 ?auto_629391 ) ) ( not ( = ?auto_629386 ?auto_629392 ) ) ( not ( = ?auto_629387 ?auto_629388 ) ) ( not ( = ?auto_629387 ?auto_629389 ) ) ( not ( = ?auto_629387 ?auto_629390 ) ) ( not ( = ?auto_629387 ?auto_629391 ) ) ( not ( = ?auto_629387 ?auto_629392 ) ) ( not ( = ?auto_629388 ?auto_629389 ) ) ( not ( = ?auto_629388 ?auto_629390 ) ) ( not ( = ?auto_629388 ?auto_629391 ) ) ( not ( = ?auto_629388 ?auto_629392 ) ) ( not ( = ?auto_629389 ?auto_629390 ) ) ( not ( = ?auto_629389 ?auto_629391 ) ) ( not ( = ?auto_629389 ?auto_629392 ) ) ( not ( = ?auto_629390 ?auto_629391 ) ) ( not ( = ?auto_629390 ?auto_629392 ) ) ( not ( = ?auto_629391 ?auto_629392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_629391 ?auto_629392 )
      ( !STACK ?auto_629391 ?auto_629390 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629427 - BLOCK
      ?auto_629428 - BLOCK
      ?auto_629429 - BLOCK
      ?auto_629430 - BLOCK
      ?auto_629431 - BLOCK
      ?auto_629432 - BLOCK
      ?auto_629433 - BLOCK
      ?auto_629434 - BLOCK
      ?auto_629435 - BLOCK
      ?auto_629436 - BLOCK
      ?auto_629437 - BLOCK
    )
    :vars
    (
      ?auto_629438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629437 ?auto_629438 ) ( ON-TABLE ?auto_629427 ) ( ON ?auto_629428 ?auto_629427 ) ( ON ?auto_629429 ?auto_629428 ) ( ON ?auto_629430 ?auto_629429 ) ( ON ?auto_629431 ?auto_629430 ) ( ON ?auto_629432 ?auto_629431 ) ( ON ?auto_629433 ?auto_629432 ) ( ON ?auto_629434 ?auto_629433 ) ( ON ?auto_629435 ?auto_629434 ) ( not ( = ?auto_629427 ?auto_629428 ) ) ( not ( = ?auto_629427 ?auto_629429 ) ) ( not ( = ?auto_629427 ?auto_629430 ) ) ( not ( = ?auto_629427 ?auto_629431 ) ) ( not ( = ?auto_629427 ?auto_629432 ) ) ( not ( = ?auto_629427 ?auto_629433 ) ) ( not ( = ?auto_629427 ?auto_629434 ) ) ( not ( = ?auto_629427 ?auto_629435 ) ) ( not ( = ?auto_629427 ?auto_629436 ) ) ( not ( = ?auto_629427 ?auto_629437 ) ) ( not ( = ?auto_629427 ?auto_629438 ) ) ( not ( = ?auto_629428 ?auto_629429 ) ) ( not ( = ?auto_629428 ?auto_629430 ) ) ( not ( = ?auto_629428 ?auto_629431 ) ) ( not ( = ?auto_629428 ?auto_629432 ) ) ( not ( = ?auto_629428 ?auto_629433 ) ) ( not ( = ?auto_629428 ?auto_629434 ) ) ( not ( = ?auto_629428 ?auto_629435 ) ) ( not ( = ?auto_629428 ?auto_629436 ) ) ( not ( = ?auto_629428 ?auto_629437 ) ) ( not ( = ?auto_629428 ?auto_629438 ) ) ( not ( = ?auto_629429 ?auto_629430 ) ) ( not ( = ?auto_629429 ?auto_629431 ) ) ( not ( = ?auto_629429 ?auto_629432 ) ) ( not ( = ?auto_629429 ?auto_629433 ) ) ( not ( = ?auto_629429 ?auto_629434 ) ) ( not ( = ?auto_629429 ?auto_629435 ) ) ( not ( = ?auto_629429 ?auto_629436 ) ) ( not ( = ?auto_629429 ?auto_629437 ) ) ( not ( = ?auto_629429 ?auto_629438 ) ) ( not ( = ?auto_629430 ?auto_629431 ) ) ( not ( = ?auto_629430 ?auto_629432 ) ) ( not ( = ?auto_629430 ?auto_629433 ) ) ( not ( = ?auto_629430 ?auto_629434 ) ) ( not ( = ?auto_629430 ?auto_629435 ) ) ( not ( = ?auto_629430 ?auto_629436 ) ) ( not ( = ?auto_629430 ?auto_629437 ) ) ( not ( = ?auto_629430 ?auto_629438 ) ) ( not ( = ?auto_629431 ?auto_629432 ) ) ( not ( = ?auto_629431 ?auto_629433 ) ) ( not ( = ?auto_629431 ?auto_629434 ) ) ( not ( = ?auto_629431 ?auto_629435 ) ) ( not ( = ?auto_629431 ?auto_629436 ) ) ( not ( = ?auto_629431 ?auto_629437 ) ) ( not ( = ?auto_629431 ?auto_629438 ) ) ( not ( = ?auto_629432 ?auto_629433 ) ) ( not ( = ?auto_629432 ?auto_629434 ) ) ( not ( = ?auto_629432 ?auto_629435 ) ) ( not ( = ?auto_629432 ?auto_629436 ) ) ( not ( = ?auto_629432 ?auto_629437 ) ) ( not ( = ?auto_629432 ?auto_629438 ) ) ( not ( = ?auto_629433 ?auto_629434 ) ) ( not ( = ?auto_629433 ?auto_629435 ) ) ( not ( = ?auto_629433 ?auto_629436 ) ) ( not ( = ?auto_629433 ?auto_629437 ) ) ( not ( = ?auto_629433 ?auto_629438 ) ) ( not ( = ?auto_629434 ?auto_629435 ) ) ( not ( = ?auto_629434 ?auto_629436 ) ) ( not ( = ?auto_629434 ?auto_629437 ) ) ( not ( = ?auto_629434 ?auto_629438 ) ) ( not ( = ?auto_629435 ?auto_629436 ) ) ( not ( = ?auto_629435 ?auto_629437 ) ) ( not ( = ?auto_629435 ?auto_629438 ) ) ( not ( = ?auto_629436 ?auto_629437 ) ) ( not ( = ?auto_629436 ?auto_629438 ) ) ( not ( = ?auto_629437 ?auto_629438 ) ) ( CLEAR ?auto_629435 ) ( ON ?auto_629436 ?auto_629437 ) ( CLEAR ?auto_629436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_629427 ?auto_629428 ?auto_629429 ?auto_629430 ?auto_629431 ?auto_629432 ?auto_629433 ?auto_629434 ?auto_629435 ?auto_629436 )
      ( MAKE-11PILE ?auto_629427 ?auto_629428 ?auto_629429 ?auto_629430 ?auto_629431 ?auto_629432 ?auto_629433 ?auto_629434 ?auto_629435 ?auto_629436 ?auto_629437 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629473 - BLOCK
      ?auto_629474 - BLOCK
      ?auto_629475 - BLOCK
      ?auto_629476 - BLOCK
      ?auto_629477 - BLOCK
      ?auto_629478 - BLOCK
      ?auto_629479 - BLOCK
      ?auto_629480 - BLOCK
      ?auto_629481 - BLOCK
      ?auto_629482 - BLOCK
      ?auto_629483 - BLOCK
    )
    :vars
    (
      ?auto_629484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629483 ?auto_629484 ) ( ON-TABLE ?auto_629473 ) ( ON ?auto_629474 ?auto_629473 ) ( ON ?auto_629475 ?auto_629474 ) ( ON ?auto_629476 ?auto_629475 ) ( ON ?auto_629477 ?auto_629476 ) ( ON ?auto_629478 ?auto_629477 ) ( ON ?auto_629479 ?auto_629478 ) ( ON ?auto_629480 ?auto_629479 ) ( not ( = ?auto_629473 ?auto_629474 ) ) ( not ( = ?auto_629473 ?auto_629475 ) ) ( not ( = ?auto_629473 ?auto_629476 ) ) ( not ( = ?auto_629473 ?auto_629477 ) ) ( not ( = ?auto_629473 ?auto_629478 ) ) ( not ( = ?auto_629473 ?auto_629479 ) ) ( not ( = ?auto_629473 ?auto_629480 ) ) ( not ( = ?auto_629473 ?auto_629481 ) ) ( not ( = ?auto_629473 ?auto_629482 ) ) ( not ( = ?auto_629473 ?auto_629483 ) ) ( not ( = ?auto_629473 ?auto_629484 ) ) ( not ( = ?auto_629474 ?auto_629475 ) ) ( not ( = ?auto_629474 ?auto_629476 ) ) ( not ( = ?auto_629474 ?auto_629477 ) ) ( not ( = ?auto_629474 ?auto_629478 ) ) ( not ( = ?auto_629474 ?auto_629479 ) ) ( not ( = ?auto_629474 ?auto_629480 ) ) ( not ( = ?auto_629474 ?auto_629481 ) ) ( not ( = ?auto_629474 ?auto_629482 ) ) ( not ( = ?auto_629474 ?auto_629483 ) ) ( not ( = ?auto_629474 ?auto_629484 ) ) ( not ( = ?auto_629475 ?auto_629476 ) ) ( not ( = ?auto_629475 ?auto_629477 ) ) ( not ( = ?auto_629475 ?auto_629478 ) ) ( not ( = ?auto_629475 ?auto_629479 ) ) ( not ( = ?auto_629475 ?auto_629480 ) ) ( not ( = ?auto_629475 ?auto_629481 ) ) ( not ( = ?auto_629475 ?auto_629482 ) ) ( not ( = ?auto_629475 ?auto_629483 ) ) ( not ( = ?auto_629475 ?auto_629484 ) ) ( not ( = ?auto_629476 ?auto_629477 ) ) ( not ( = ?auto_629476 ?auto_629478 ) ) ( not ( = ?auto_629476 ?auto_629479 ) ) ( not ( = ?auto_629476 ?auto_629480 ) ) ( not ( = ?auto_629476 ?auto_629481 ) ) ( not ( = ?auto_629476 ?auto_629482 ) ) ( not ( = ?auto_629476 ?auto_629483 ) ) ( not ( = ?auto_629476 ?auto_629484 ) ) ( not ( = ?auto_629477 ?auto_629478 ) ) ( not ( = ?auto_629477 ?auto_629479 ) ) ( not ( = ?auto_629477 ?auto_629480 ) ) ( not ( = ?auto_629477 ?auto_629481 ) ) ( not ( = ?auto_629477 ?auto_629482 ) ) ( not ( = ?auto_629477 ?auto_629483 ) ) ( not ( = ?auto_629477 ?auto_629484 ) ) ( not ( = ?auto_629478 ?auto_629479 ) ) ( not ( = ?auto_629478 ?auto_629480 ) ) ( not ( = ?auto_629478 ?auto_629481 ) ) ( not ( = ?auto_629478 ?auto_629482 ) ) ( not ( = ?auto_629478 ?auto_629483 ) ) ( not ( = ?auto_629478 ?auto_629484 ) ) ( not ( = ?auto_629479 ?auto_629480 ) ) ( not ( = ?auto_629479 ?auto_629481 ) ) ( not ( = ?auto_629479 ?auto_629482 ) ) ( not ( = ?auto_629479 ?auto_629483 ) ) ( not ( = ?auto_629479 ?auto_629484 ) ) ( not ( = ?auto_629480 ?auto_629481 ) ) ( not ( = ?auto_629480 ?auto_629482 ) ) ( not ( = ?auto_629480 ?auto_629483 ) ) ( not ( = ?auto_629480 ?auto_629484 ) ) ( not ( = ?auto_629481 ?auto_629482 ) ) ( not ( = ?auto_629481 ?auto_629483 ) ) ( not ( = ?auto_629481 ?auto_629484 ) ) ( not ( = ?auto_629482 ?auto_629483 ) ) ( not ( = ?auto_629482 ?auto_629484 ) ) ( not ( = ?auto_629483 ?auto_629484 ) ) ( ON ?auto_629482 ?auto_629483 ) ( CLEAR ?auto_629480 ) ( ON ?auto_629481 ?auto_629482 ) ( CLEAR ?auto_629481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_629473 ?auto_629474 ?auto_629475 ?auto_629476 ?auto_629477 ?auto_629478 ?auto_629479 ?auto_629480 ?auto_629481 )
      ( MAKE-11PILE ?auto_629473 ?auto_629474 ?auto_629475 ?auto_629476 ?auto_629477 ?auto_629478 ?auto_629479 ?auto_629480 ?auto_629481 ?auto_629482 ?auto_629483 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629519 - BLOCK
      ?auto_629520 - BLOCK
      ?auto_629521 - BLOCK
      ?auto_629522 - BLOCK
      ?auto_629523 - BLOCK
      ?auto_629524 - BLOCK
      ?auto_629525 - BLOCK
      ?auto_629526 - BLOCK
      ?auto_629527 - BLOCK
      ?auto_629528 - BLOCK
      ?auto_629529 - BLOCK
    )
    :vars
    (
      ?auto_629530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629529 ?auto_629530 ) ( ON-TABLE ?auto_629519 ) ( ON ?auto_629520 ?auto_629519 ) ( ON ?auto_629521 ?auto_629520 ) ( ON ?auto_629522 ?auto_629521 ) ( ON ?auto_629523 ?auto_629522 ) ( ON ?auto_629524 ?auto_629523 ) ( ON ?auto_629525 ?auto_629524 ) ( not ( = ?auto_629519 ?auto_629520 ) ) ( not ( = ?auto_629519 ?auto_629521 ) ) ( not ( = ?auto_629519 ?auto_629522 ) ) ( not ( = ?auto_629519 ?auto_629523 ) ) ( not ( = ?auto_629519 ?auto_629524 ) ) ( not ( = ?auto_629519 ?auto_629525 ) ) ( not ( = ?auto_629519 ?auto_629526 ) ) ( not ( = ?auto_629519 ?auto_629527 ) ) ( not ( = ?auto_629519 ?auto_629528 ) ) ( not ( = ?auto_629519 ?auto_629529 ) ) ( not ( = ?auto_629519 ?auto_629530 ) ) ( not ( = ?auto_629520 ?auto_629521 ) ) ( not ( = ?auto_629520 ?auto_629522 ) ) ( not ( = ?auto_629520 ?auto_629523 ) ) ( not ( = ?auto_629520 ?auto_629524 ) ) ( not ( = ?auto_629520 ?auto_629525 ) ) ( not ( = ?auto_629520 ?auto_629526 ) ) ( not ( = ?auto_629520 ?auto_629527 ) ) ( not ( = ?auto_629520 ?auto_629528 ) ) ( not ( = ?auto_629520 ?auto_629529 ) ) ( not ( = ?auto_629520 ?auto_629530 ) ) ( not ( = ?auto_629521 ?auto_629522 ) ) ( not ( = ?auto_629521 ?auto_629523 ) ) ( not ( = ?auto_629521 ?auto_629524 ) ) ( not ( = ?auto_629521 ?auto_629525 ) ) ( not ( = ?auto_629521 ?auto_629526 ) ) ( not ( = ?auto_629521 ?auto_629527 ) ) ( not ( = ?auto_629521 ?auto_629528 ) ) ( not ( = ?auto_629521 ?auto_629529 ) ) ( not ( = ?auto_629521 ?auto_629530 ) ) ( not ( = ?auto_629522 ?auto_629523 ) ) ( not ( = ?auto_629522 ?auto_629524 ) ) ( not ( = ?auto_629522 ?auto_629525 ) ) ( not ( = ?auto_629522 ?auto_629526 ) ) ( not ( = ?auto_629522 ?auto_629527 ) ) ( not ( = ?auto_629522 ?auto_629528 ) ) ( not ( = ?auto_629522 ?auto_629529 ) ) ( not ( = ?auto_629522 ?auto_629530 ) ) ( not ( = ?auto_629523 ?auto_629524 ) ) ( not ( = ?auto_629523 ?auto_629525 ) ) ( not ( = ?auto_629523 ?auto_629526 ) ) ( not ( = ?auto_629523 ?auto_629527 ) ) ( not ( = ?auto_629523 ?auto_629528 ) ) ( not ( = ?auto_629523 ?auto_629529 ) ) ( not ( = ?auto_629523 ?auto_629530 ) ) ( not ( = ?auto_629524 ?auto_629525 ) ) ( not ( = ?auto_629524 ?auto_629526 ) ) ( not ( = ?auto_629524 ?auto_629527 ) ) ( not ( = ?auto_629524 ?auto_629528 ) ) ( not ( = ?auto_629524 ?auto_629529 ) ) ( not ( = ?auto_629524 ?auto_629530 ) ) ( not ( = ?auto_629525 ?auto_629526 ) ) ( not ( = ?auto_629525 ?auto_629527 ) ) ( not ( = ?auto_629525 ?auto_629528 ) ) ( not ( = ?auto_629525 ?auto_629529 ) ) ( not ( = ?auto_629525 ?auto_629530 ) ) ( not ( = ?auto_629526 ?auto_629527 ) ) ( not ( = ?auto_629526 ?auto_629528 ) ) ( not ( = ?auto_629526 ?auto_629529 ) ) ( not ( = ?auto_629526 ?auto_629530 ) ) ( not ( = ?auto_629527 ?auto_629528 ) ) ( not ( = ?auto_629527 ?auto_629529 ) ) ( not ( = ?auto_629527 ?auto_629530 ) ) ( not ( = ?auto_629528 ?auto_629529 ) ) ( not ( = ?auto_629528 ?auto_629530 ) ) ( not ( = ?auto_629529 ?auto_629530 ) ) ( ON ?auto_629528 ?auto_629529 ) ( ON ?auto_629527 ?auto_629528 ) ( CLEAR ?auto_629525 ) ( ON ?auto_629526 ?auto_629527 ) ( CLEAR ?auto_629526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_629519 ?auto_629520 ?auto_629521 ?auto_629522 ?auto_629523 ?auto_629524 ?auto_629525 ?auto_629526 )
      ( MAKE-11PILE ?auto_629519 ?auto_629520 ?auto_629521 ?auto_629522 ?auto_629523 ?auto_629524 ?auto_629525 ?auto_629526 ?auto_629527 ?auto_629528 ?auto_629529 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629565 - BLOCK
      ?auto_629566 - BLOCK
      ?auto_629567 - BLOCK
      ?auto_629568 - BLOCK
      ?auto_629569 - BLOCK
      ?auto_629570 - BLOCK
      ?auto_629571 - BLOCK
      ?auto_629572 - BLOCK
      ?auto_629573 - BLOCK
      ?auto_629574 - BLOCK
      ?auto_629575 - BLOCK
    )
    :vars
    (
      ?auto_629576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629575 ?auto_629576 ) ( ON-TABLE ?auto_629565 ) ( ON ?auto_629566 ?auto_629565 ) ( ON ?auto_629567 ?auto_629566 ) ( ON ?auto_629568 ?auto_629567 ) ( ON ?auto_629569 ?auto_629568 ) ( ON ?auto_629570 ?auto_629569 ) ( not ( = ?auto_629565 ?auto_629566 ) ) ( not ( = ?auto_629565 ?auto_629567 ) ) ( not ( = ?auto_629565 ?auto_629568 ) ) ( not ( = ?auto_629565 ?auto_629569 ) ) ( not ( = ?auto_629565 ?auto_629570 ) ) ( not ( = ?auto_629565 ?auto_629571 ) ) ( not ( = ?auto_629565 ?auto_629572 ) ) ( not ( = ?auto_629565 ?auto_629573 ) ) ( not ( = ?auto_629565 ?auto_629574 ) ) ( not ( = ?auto_629565 ?auto_629575 ) ) ( not ( = ?auto_629565 ?auto_629576 ) ) ( not ( = ?auto_629566 ?auto_629567 ) ) ( not ( = ?auto_629566 ?auto_629568 ) ) ( not ( = ?auto_629566 ?auto_629569 ) ) ( not ( = ?auto_629566 ?auto_629570 ) ) ( not ( = ?auto_629566 ?auto_629571 ) ) ( not ( = ?auto_629566 ?auto_629572 ) ) ( not ( = ?auto_629566 ?auto_629573 ) ) ( not ( = ?auto_629566 ?auto_629574 ) ) ( not ( = ?auto_629566 ?auto_629575 ) ) ( not ( = ?auto_629566 ?auto_629576 ) ) ( not ( = ?auto_629567 ?auto_629568 ) ) ( not ( = ?auto_629567 ?auto_629569 ) ) ( not ( = ?auto_629567 ?auto_629570 ) ) ( not ( = ?auto_629567 ?auto_629571 ) ) ( not ( = ?auto_629567 ?auto_629572 ) ) ( not ( = ?auto_629567 ?auto_629573 ) ) ( not ( = ?auto_629567 ?auto_629574 ) ) ( not ( = ?auto_629567 ?auto_629575 ) ) ( not ( = ?auto_629567 ?auto_629576 ) ) ( not ( = ?auto_629568 ?auto_629569 ) ) ( not ( = ?auto_629568 ?auto_629570 ) ) ( not ( = ?auto_629568 ?auto_629571 ) ) ( not ( = ?auto_629568 ?auto_629572 ) ) ( not ( = ?auto_629568 ?auto_629573 ) ) ( not ( = ?auto_629568 ?auto_629574 ) ) ( not ( = ?auto_629568 ?auto_629575 ) ) ( not ( = ?auto_629568 ?auto_629576 ) ) ( not ( = ?auto_629569 ?auto_629570 ) ) ( not ( = ?auto_629569 ?auto_629571 ) ) ( not ( = ?auto_629569 ?auto_629572 ) ) ( not ( = ?auto_629569 ?auto_629573 ) ) ( not ( = ?auto_629569 ?auto_629574 ) ) ( not ( = ?auto_629569 ?auto_629575 ) ) ( not ( = ?auto_629569 ?auto_629576 ) ) ( not ( = ?auto_629570 ?auto_629571 ) ) ( not ( = ?auto_629570 ?auto_629572 ) ) ( not ( = ?auto_629570 ?auto_629573 ) ) ( not ( = ?auto_629570 ?auto_629574 ) ) ( not ( = ?auto_629570 ?auto_629575 ) ) ( not ( = ?auto_629570 ?auto_629576 ) ) ( not ( = ?auto_629571 ?auto_629572 ) ) ( not ( = ?auto_629571 ?auto_629573 ) ) ( not ( = ?auto_629571 ?auto_629574 ) ) ( not ( = ?auto_629571 ?auto_629575 ) ) ( not ( = ?auto_629571 ?auto_629576 ) ) ( not ( = ?auto_629572 ?auto_629573 ) ) ( not ( = ?auto_629572 ?auto_629574 ) ) ( not ( = ?auto_629572 ?auto_629575 ) ) ( not ( = ?auto_629572 ?auto_629576 ) ) ( not ( = ?auto_629573 ?auto_629574 ) ) ( not ( = ?auto_629573 ?auto_629575 ) ) ( not ( = ?auto_629573 ?auto_629576 ) ) ( not ( = ?auto_629574 ?auto_629575 ) ) ( not ( = ?auto_629574 ?auto_629576 ) ) ( not ( = ?auto_629575 ?auto_629576 ) ) ( ON ?auto_629574 ?auto_629575 ) ( ON ?auto_629573 ?auto_629574 ) ( ON ?auto_629572 ?auto_629573 ) ( CLEAR ?auto_629570 ) ( ON ?auto_629571 ?auto_629572 ) ( CLEAR ?auto_629571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_629565 ?auto_629566 ?auto_629567 ?auto_629568 ?auto_629569 ?auto_629570 ?auto_629571 )
      ( MAKE-11PILE ?auto_629565 ?auto_629566 ?auto_629567 ?auto_629568 ?auto_629569 ?auto_629570 ?auto_629571 ?auto_629572 ?auto_629573 ?auto_629574 ?auto_629575 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629611 - BLOCK
      ?auto_629612 - BLOCK
      ?auto_629613 - BLOCK
      ?auto_629614 - BLOCK
      ?auto_629615 - BLOCK
      ?auto_629616 - BLOCK
      ?auto_629617 - BLOCK
      ?auto_629618 - BLOCK
      ?auto_629619 - BLOCK
      ?auto_629620 - BLOCK
      ?auto_629621 - BLOCK
    )
    :vars
    (
      ?auto_629622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629621 ?auto_629622 ) ( ON-TABLE ?auto_629611 ) ( ON ?auto_629612 ?auto_629611 ) ( ON ?auto_629613 ?auto_629612 ) ( ON ?auto_629614 ?auto_629613 ) ( ON ?auto_629615 ?auto_629614 ) ( not ( = ?auto_629611 ?auto_629612 ) ) ( not ( = ?auto_629611 ?auto_629613 ) ) ( not ( = ?auto_629611 ?auto_629614 ) ) ( not ( = ?auto_629611 ?auto_629615 ) ) ( not ( = ?auto_629611 ?auto_629616 ) ) ( not ( = ?auto_629611 ?auto_629617 ) ) ( not ( = ?auto_629611 ?auto_629618 ) ) ( not ( = ?auto_629611 ?auto_629619 ) ) ( not ( = ?auto_629611 ?auto_629620 ) ) ( not ( = ?auto_629611 ?auto_629621 ) ) ( not ( = ?auto_629611 ?auto_629622 ) ) ( not ( = ?auto_629612 ?auto_629613 ) ) ( not ( = ?auto_629612 ?auto_629614 ) ) ( not ( = ?auto_629612 ?auto_629615 ) ) ( not ( = ?auto_629612 ?auto_629616 ) ) ( not ( = ?auto_629612 ?auto_629617 ) ) ( not ( = ?auto_629612 ?auto_629618 ) ) ( not ( = ?auto_629612 ?auto_629619 ) ) ( not ( = ?auto_629612 ?auto_629620 ) ) ( not ( = ?auto_629612 ?auto_629621 ) ) ( not ( = ?auto_629612 ?auto_629622 ) ) ( not ( = ?auto_629613 ?auto_629614 ) ) ( not ( = ?auto_629613 ?auto_629615 ) ) ( not ( = ?auto_629613 ?auto_629616 ) ) ( not ( = ?auto_629613 ?auto_629617 ) ) ( not ( = ?auto_629613 ?auto_629618 ) ) ( not ( = ?auto_629613 ?auto_629619 ) ) ( not ( = ?auto_629613 ?auto_629620 ) ) ( not ( = ?auto_629613 ?auto_629621 ) ) ( not ( = ?auto_629613 ?auto_629622 ) ) ( not ( = ?auto_629614 ?auto_629615 ) ) ( not ( = ?auto_629614 ?auto_629616 ) ) ( not ( = ?auto_629614 ?auto_629617 ) ) ( not ( = ?auto_629614 ?auto_629618 ) ) ( not ( = ?auto_629614 ?auto_629619 ) ) ( not ( = ?auto_629614 ?auto_629620 ) ) ( not ( = ?auto_629614 ?auto_629621 ) ) ( not ( = ?auto_629614 ?auto_629622 ) ) ( not ( = ?auto_629615 ?auto_629616 ) ) ( not ( = ?auto_629615 ?auto_629617 ) ) ( not ( = ?auto_629615 ?auto_629618 ) ) ( not ( = ?auto_629615 ?auto_629619 ) ) ( not ( = ?auto_629615 ?auto_629620 ) ) ( not ( = ?auto_629615 ?auto_629621 ) ) ( not ( = ?auto_629615 ?auto_629622 ) ) ( not ( = ?auto_629616 ?auto_629617 ) ) ( not ( = ?auto_629616 ?auto_629618 ) ) ( not ( = ?auto_629616 ?auto_629619 ) ) ( not ( = ?auto_629616 ?auto_629620 ) ) ( not ( = ?auto_629616 ?auto_629621 ) ) ( not ( = ?auto_629616 ?auto_629622 ) ) ( not ( = ?auto_629617 ?auto_629618 ) ) ( not ( = ?auto_629617 ?auto_629619 ) ) ( not ( = ?auto_629617 ?auto_629620 ) ) ( not ( = ?auto_629617 ?auto_629621 ) ) ( not ( = ?auto_629617 ?auto_629622 ) ) ( not ( = ?auto_629618 ?auto_629619 ) ) ( not ( = ?auto_629618 ?auto_629620 ) ) ( not ( = ?auto_629618 ?auto_629621 ) ) ( not ( = ?auto_629618 ?auto_629622 ) ) ( not ( = ?auto_629619 ?auto_629620 ) ) ( not ( = ?auto_629619 ?auto_629621 ) ) ( not ( = ?auto_629619 ?auto_629622 ) ) ( not ( = ?auto_629620 ?auto_629621 ) ) ( not ( = ?auto_629620 ?auto_629622 ) ) ( not ( = ?auto_629621 ?auto_629622 ) ) ( ON ?auto_629620 ?auto_629621 ) ( ON ?auto_629619 ?auto_629620 ) ( ON ?auto_629618 ?auto_629619 ) ( ON ?auto_629617 ?auto_629618 ) ( CLEAR ?auto_629615 ) ( ON ?auto_629616 ?auto_629617 ) ( CLEAR ?auto_629616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_629611 ?auto_629612 ?auto_629613 ?auto_629614 ?auto_629615 ?auto_629616 )
      ( MAKE-11PILE ?auto_629611 ?auto_629612 ?auto_629613 ?auto_629614 ?auto_629615 ?auto_629616 ?auto_629617 ?auto_629618 ?auto_629619 ?auto_629620 ?auto_629621 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629657 - BLOCK
      ?auto_629658 - BLOCK
      ?auto_629659 - BLOCK
      ?auto_629660 - BLOCK
      ?auto_629661 - BLOCK
      ?auto_629662 - BLOCK
      ?auto_629663 - BLOCK
      ?auto_629664 - BLOCK
      ?auto_629665 - BLOCK
      ?auto_629666 - BLOCK
      ?auto_629667 - BLOCK
    )
    :vars
    (
      ?auto_629668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629667 ?auto_629668 ) ( ON-TABLE ?auto_629657 ) ( ON ?auto_629658 ?auto_629657 ) ( ON ?auto_629659 ?auto_629658 ) ( ON ?auto_629660 ?auto_629659 ) ( not ( = ?auto_629657 ?auto_629658 ) ) ( not ( = ?auto_629657 ?auto_629659 ) ) ( not ( = ?auto_629657 ?auto_629660 ) ) ( not ( = ?auto_629657 ?auto_629661 ) ) ( not ( = ?auto_629657 ?auto_629662 ) ) ( not ( = ?auto_629657 ?auto_629663 ) ) ( not ( = ?auto_629657 ?auto_629664 ) ) ( not ( = ?auto_629657 ?auto_629665 ) ) ( not ( = ?auto_629657 ?auto_629666 ) ) ( not ( = ?auto_629657 ?auto_629667 ) ) ( not ( = ?auto_629657 ?auto_629668 ) ) ( not ( = ?auto_629658 ?auto_629659 ) ) ( not ( = ?auto_629658 ?auto_629660 ) ) ( not ( = ?auto_629658 ?auto_629661 ) ) ( not ( = ?auto_629658 ?auto_629662 ) ) ( not ( = ?auto_629658 ?auto_629663 ) ) ( not ( = ?auto_629658 ?auto_629664 ) ) ( not ( = ?auto_629658 ?auto_629665 ) ) ( not ( = ?auto_629658 ?auto_629666 ) ) ( not ( = ?auto_629658 ?auto_629667 ) ) ( not ( = ?auto_629658 ?auto_629668 ) ) ( not ( = ?auto_629659 ?auto_629660 ) ) ( not ( = ?auto_629659 ?auto_629661 ) ) ( not ( = ?auto_629659 ?auto_629662 ) ) ( not ( = ?auto_629659 ?auto_629663 ) ) ( not ( = ?auto_629659 ?auto_629664 ) ) ( not ( = ?auto_629659 ?auto_629665 ) ) ( not ( = ?auto_629659 ?auto_629666 ) ) ( not ( = ?auto_629659 ?auto_629667 ) ) ( not ( = ?auto_629659 ?auto_629668 ) ) ( not ( = ?auto_629660 ?auto_629661 ) ) ( not ( = ?auto_629660 ?auto_629662 ) ) ( not ( = ?auto_629660 ?auto_629663 ) ) ( not ( = ?auto_629660 ?auto_629664 ) ) ( not ( = ?auto_629660 ?auto_629665 ) ) ( not ( = ?auto_629660 ?auto_629666 ) ) ( not ( = ?auto_629660 ?auto_629667 ) ) ( not ( = ?auto_629660 ?auto_629668 ) ) ( not ( = ?auto_629661 ?auto_629662 ) ) ( not ( = ?auto_629661 ?auto_629663 ) ) ( not ( = ?auto_629661 ?auto_629664 ) ) ( not ( = ?auto_629661 ?auto_629665 ) ) ( not ( = ?auto_629661 ?auto_629666 ) ) ( not ( = ?auto_629661 ?auto_629667 ) ) ( not ( = ?auto_629661 ?auto_629668 ) ) ( not ( = ?auto_629662 ?auto_629663 ) ) ( not ( = ?auto_629662 ?auto_629664 ) ) ( not ( = ?auto_629662 ?auto_629665 ) ) ( not ( = ?auto_629662 ?auto_629666 ) ) ( not ( = ?auto_629662 ?auto_629667 ) ) ( not ( = ?auto_629662 ?auto_629668 ) ) ( not ( = ?auto_629663 ?auto_629664 ) ) ( not ( = ?auto_629663 ?auto_629665 ) ) ( not ( = ?auto_629663 ?auto_629666 ) ) ( not ( = ?auto_629663 ?auto_629667 ) ) ( not ( = ?auto_629663 ?auto_629668 ) ) ( not ( = ?auto_629664 ?auto_629665 ) ) ( not ( = ?auto_629664 ?auto_629666 ) ) ( not ( = ?auto_629664 ?auto_629667 ) ) ( not ( = ?auto_629664 ?auto_629668 ) ) ( not ( = ?auto_629665 ?auto_629666 ) ) ( not ( = ?auto_629665 ?auto_629667 ) ) ( not ( = ?auto_629665 ?auto_629668 ) ) ( not ( = ?auto_629666 ?auto_629667 ) ) ( not ( = ?auto_629666 ?auto_629668 ) ) ( not ( = ?auto_629667 ?auto_629668 ) ) ( ON ?auto_629666 ?auto_629667 ) ( ON ?auto_629665 ?auto_629666 ) ( ON ?auto_629664 ?auto_629665 ) ( ON ?auto_629663 ?auto_629664 ) ( ON ?auto_629662 ?auto_629663 ) ( CLEAR ?auto_629660 ) ( ON ?auto_629661 ?auto_629662 ) ( CLEAR ?auto_629661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_629657 ?auto_629658 ?auto_629659 ?auto_629660 ?auto_629661 )
      ( MAKE-11PILE ?auto_629657 ?auto_629658 ?auto_629659 ?auto_629660 ?auto_629661 ?auto_629662 ?auto_629663 ?auto_629664 ?auto_629665 ?auto_629666 ?auto_629667 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629703 - BLOCK
      ?auto_629704 - BLOCK
      ?auto_629705 - BLOCK
      ?auto_629706 - BLOCK
      ?auto_629707 - BLOCK
      ?auto_629708 - BLOCK
      ?auto_629709 - BLOCK
      ?auto_629710 - BLOCK
      ?auto_629711 - BLOCK
      ?auto_629712 - BLOCK
      ?auto_629713 - BLOCK
    )
    :vars
    (
      ?auto_629714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629713 ?auto_629714 ) ( ON-TABLE ?auto_629703 ) ( ON ?auto_629704 ?auto_629703 ) ( ON ?auto_629705 ?auto_629704 ) ( not ( = ?auto_629703 ?auto_629704 ) ) ( not ( = ?auto_629703 ?auto_629705 ) ) ( not ( = ?auto_629703 ?auto_629706 ) ) ( not ( = ?auto_629703 ?auto_629707 ) ) ( not ( = ?auto_629703 ?auto_629708 ) ) ( not ( = ?auto_629703 ?auto_629709 ) ) ( not ( = ?auto_629703 ?auto_629710 ) ) ( not ( = ?auto_629703 ?auto_629711 ) ) ( not ( = ?auto_629703 ?auto_629712 ) ) ( not ( = ?auto_629703 ?auto_629713 ) ) ( not ( = ?auto_629703 ?auto_629714 ) ) ( not ( = ?auto_629704 ?auto_629705 ) ) ( not ( = ?auto_629704 ?auto_629706 ) ) ( not ( = ?auto_629704 ?auto_629707 ) ) ( not ( = ?auto_629704 ?auto_629708 ) ) ( not ( = ?auto_629704 ?auto_629709 ) ) ( not ( = ?auto_629704 ?auto_629710 ) ) ( not ( = ?auto_629704 ?auto_629711 ) ) ( not ( = ?auto_629704 ?auto_629712 ) ) ( not ( = ?auto_629704 ?auto_629713 ) ) ( not ( = ?auto_629704 ?auto_629714 ) ) ( not ( = ?auto_629705 ?auto_629706 ) ) ( not ( = ?auto_629705 ?auto_629707 ) ) ( not ( = ?auto_629705 ?auto_629708 ) ) ( not ( = ?auto_629705 ?auto_629709 ) ) ( not ( = ?auto_629705 ?auto_629710 ) ) ( not ( = ?auto_629705 ?auto_629711 ) ) ( not ( = ?auto_629705 ?auto_629712 ) ) ( not ( = ?auto_629705 ?auto_629713 ) ) ( not ( = ?auto_629705 ?auto_629714 ) ) ( not ( = ?auto_629706 ?auto_629707 ) ) ( not ( = ?auto_629706 ?auto_629708 ) ) ( not ( = ?auto_629706 ?auto_629709 ) ) ( not ( = ?auto_629706 ?auto_629710 ) ) ( not ( = ?auto_629706 ?auto_629711 ) ) ( not ( = ?auto_629706 ?auto_629712 ) ) ( not ( = ?auto_629706 ?auto_629713 ) ) ( not ( = ?auto_629706 ?auto_629714 ) ) ( not ( = ?auto_629707 ?auto_629708 ) ) ( not ( = ?auto_629707 ?auto_629709 ) ) ( not ( = ?auto_629707 ?auto_629710 ) ) ( not ( = ?auto_629707 ?auto_629711 ) ) ( not ( = ?auto_629707 ?auto_629712 ) ) ( not ( = ?auto_629707 ?auto_629713 ) ) ( not ( = ?auto_629707 ?auto_629714 ) ) ( not ( = ?auto_629708 ?auto_629709 ) ) ( not ( = ?auto_629708 ?auto_629710 ) ) ( not ( = ?auto_629708 ?auto_629711 ) ) ( not ( = ?auto_629708 ?auto_629712 ) ) ( not ( = ?auto_629708 ?auto_629713 ) ) ( not ( = ?auto_629708 ?auto_629714 ) ) ( not ( = ?auto_629709 ?auto_629710 ) ) ( not ( = ?auto_629709 ?auto_629711 ) ) ( not ( = ?auto_629709 ?auto_629712 ) ) ( not ( = ?auto_629709 ?auto_629713 ) ) ( not ( = ?auto_629709 ?auto_629714 ) ) ( not ( = ?auto_629710 ?auto_629711 ) ) ( not ( = ?auto_629710 ?auto_629712 ) ) ( not ( = ?auto_629710 ?auto_629713 ) ) ( not ( = ?auto_629710 ?auto_629714 ) ) ( not ( = ?auto_629711 ?auto_629712 ) ) ( not ( = ?auto_629711 ?auto_629713 ) ) ( not ( = ?auto_629711 ?auto_629714 ) ) ( not ( = ?auto_629712 ?auto_629713 ) ) ( not ( = ?auto_629712 ?auto_629714 ) ) ( not ( = ?auto_629713 ?auto_629714 ) ) ( ON ?auto_629712 ?auto_629713 ) ( ON ?auto_629711 ?auto_629712 ) ( ON ?auto_629710 ?auto_629711 ) ( ON ?auto_629709 ?auto_629710 ) ( ON ?auto_629708 ?auto_629709 ) ( ON ?auto_629707 ?auto_629708 ) ( CLEAR ?auto_629705 ) ( ON ?auto_629706 ?auto_629707 ) ( CLEAR ?auto_629706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_629703 ?auto_629704 ?auto_629705 ?auto_629706 )
      ( MAKE-11PILE ?auto_629703 ?auto_629704 ?auto_629705 ?auto_629706 ?auto_629707 ?auto_629708 ?auto_629709 ?auto_629710 ?auto_629711 ?auto_629712 ?auto_629713 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629749 - BLOCK
      ?auto_629750 - BLOCK
      ?auto_629751 - BLOCK
      ?auto_629752 - BLOCK
      ?auto_629753 - BLOCK
      ?auto_629754 - BLOCK
      ?auto_629755 - BLOCK
      ?auto_629756 - BLOCK
      ?auto_629757 - BLOCK
      ?auto_629758 - BLOCK
      ?auto_629759 - BLOCK
    )
    :vars
    (
      ?auto_629760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629759 ?auto_629760 ) ( ON-TABLE ?auto_629749 ) ( ON ?auto_629750 ?auto_629749 ) ( not ( = ?auto_629749 ?auto_629750 ) ) ( not ( = ?auto_629749 ?auto_629751 ) ) ( not ( = ?auto_629749 ?auto_629752 ) ) ( not ( = ?auto_629749 ?auto_629753 ) ) ( not ( = ?auto_629749 ?auto_629754 ) ) ( not ( = ?auto_629749 ?auto_629755 ) ) ( not ( = ?auto_629749 ?auto_629756 ) ) ( not ( = ?auto_629749 ?auto_629757 ) ) ( not ( = ?auto_629749 ?auto_629758 ) ) ( not ( = ?auto_629749 ?auto_629759 ) ) ( not ( = ?auto_629749 ?auto_629760 ) ) ( not ( = ?auto_629750 ?auto_629751 ) ) ( not ( = ?auto_629750 ?auto_629752 ) ) ( not ( = ?auto_629750 ?auto_629753 ) ) ( not ( = ?auto_629750 ?auto_629754 ) ) ( not ( = ?auto_629750 ?auto_629755 ) ) ( not ( = ?auto_629750 ?auto_629756 ) ) ( not ( = ?auto_629750 ?auto_629757 ) ) ( not ( = ?auto_629750 ?auto_629758 ) ) ( not ( = ?auto_629750 ?auto_629759 ) ) ( not ( = ?auto_629750 ?auto_629760 ) ) ( not ( = ?auto_629751 ?auto_629752 ) ) ( not ( = ?auto_629751 ?auto_629753 ) ) ( not ( = ?auto_629751 ?auto_629754 ) ) ( not ( = ?auto_629751 ?auto_629755 ) ) ( not ( = ?auto_629751 ?auto_629756 ) ) ( not ( = ?auto_629751 ?auto_629757 ) ) ( not ( = ?auto_629751 ?auto_629758 ) ) ( not ( = ?auto_629751 ?auto_629759 ) ) ( not ( = ?auto_629751 ?auto_629760 ) ) ( not ( = ?auto_629752 ?auto_629753 ) ) ( not ( = ?auto_629752 ?auto_629754 ) ) ( not ( = ?auto_629752 ?auto_629755 ) ) ( not ( = ?auto_629752 ?auto_629756 ) ) ( not ( = ?auto_629752 ?auto_629757 ) ) ( not ( = ?auto_629752 ?auto_629758 ) ) ( not ( = ?auto_629752 ?auto_629759 ) ) ( not ( = ?auto_629752 ?auto_629760 ) ) ( not ( = ?auto_629753 ?auto_629754 ) ) ( not ( = ?auto_629753 ?auto_629755 ) ) ( not ( = ?auto_629753 ?auto_629756 ) ) ( not ( = ?auto_629753 ?auto_629757 ) ) ( not ( = ?auto_629753 ?auto_629758 ) ) ( not ( = ?auto_629753 ?auto_629759 ) ) ( not ( = ?auto_629753 ?auto_629760 ) ) ( not ( = ?auto_629754 ?auto_629755 ) ) ( not ( = ?auto_629754 ?auto_629756 ) ) ( not ( = ?auto_629754 ?auto_629757 ) ) ( not ( = ?auto_629754 ?auto_629758 ) ) ( not ( = ?auto_629754 ?auto_629759 ) ) ( not ( = ?auto_629754 ?auto_629760 ) ) ( not ( = ?auto_629755 ?auto_629756 ) ) ( not ( = ?auto_629755 ?auto_629757 ) ) ( not ( = ?auto_629755 ?auto_629758 ) ) ( not ( = ?auto_629755 ?auto_629759 ) ) ( not ( = ?auto_629755 ?auto_629760 ) ) ( not ( = ?auto_629756 ?auto_629757 ) ) ( not ( = ?auto_629756 ?auto_629758 ) ) ( not ( = ?auto_629756 ?auto_629759 ) ) ( not ( = ?auto_629756 ?auto_629760 ) ) ( not ( = ?auto_629757 ?auto_629758 ) ) ( not ( = ?auto_629757 ?auto_629759 ) ) ( not ( = ?auto_629757 ?auto_629760 ) ) ( not ( = ?auto_629758 ?auto_629759 ) ) ( not ( = ?auto_629758 ?auto_629760 ) ) ( not ( = ?auto_629759 ?auto_629760 ) ) ( ON ?auto_629758 ?auto_629759 ) ( ON ?auto_629757 ?auto_629758 ) ( ON ?auto_629756 ?auto_629757 ) ( ON ?auto_629755 ?auto_629756 ) ( ON ?auto_629754 ?auto_629755 ) ( ON ?auto_629753 ?auto_629754 ) ( ON ?auto_629752 ?auto_629753 ) ( CLEAR ?auto_629750 ) ( ON ?auto_629751 ?auto_629752 ) ( CLEAR ?auto_629751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_629749 ?auto_629750 ?auto_629751 )
      ( MAKE-11PILE ?auto_629749 ?auto_629750 ?auto_629751 ?auto_629752 ?auto_629753 ?auto_629754 ?auto_629755 ?auto_629756 ?auto_629757 ?auto_629758 ?auto_629759 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629795 - BLOCK
      ?auto_629796 - BLOCK
      ?auto_629797 - BLOCK
      ?auto_629798 - BLOCK
      ?auto_629799 - BLOCK
      ?auto_629800 - BLOCK
      ?auto_629801 - BLOCK
      ?auto_629802 - BLOCK
      ?auto_629803 - BLOCK
      ?auto_629804 - BLOCK
      ?auto_629805 - BLOCK
    )
    :vars
    (
      ?auto_629806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629805 ?auto_629806 ) ( ON-TABLE ?auto_629795 ) ( not ( = ?auto_629795 ?auto_629796 ) ) ( not ( = ?auto_629795 ?auto_629797 ) ) ( not ( = ?auto_629795 ?auto_629798 ) ) ( not ( = ?auto_629795 ?auto_629799 ) ) ( not ( = ?auto_629795 ?auto_629800 ) ) ( not ( = ?auto_629795 ?auto_629801 ) ) ( not ( = ?auto_629795 ?auto_629802 ) ) ( not ( = ?auto_629795 ?auto_629803 ) ) ( not ( = ?auto_629795 ?auto_629804 ) ) ( not ( = ?auto_629795 ?auto_629805 ) ) ( not ( = ?auto_629795 ?auto_629806 ) ) ( not ( = ?auto_629796 ?auto_629797 ) ) ( not ( = ?auto_629796 ?auto_629798 ) ) ( not ( = ?auto_629796 ?auto_629799 ) ) ( not ( = ?auto_629796 ?auto_629800 ) ) ( not ( = ?auto_629796 ?auto_629801 ) ) ( not ( = ?auto_629796 ?auto_629802 ) ) ( not ( = ?auto_629796 ?auto_629803 ) ) ( not ( = ?auto_629796 ?auto_629804 ) ) ( not ( = ?auto_629796 ?auto_629805 ) ) ( not ( = ?auto_629796 ?auto_629806 ) ) ( not ( = ?auto_629797 ?auto_629798 ) ) ( not ( = ?auto_629797 ?auto_629799 ) ) ( not ( = ?auto_629797 ?auto_629800 ) ) ( not ( = ?auto_629797 ?auto_629801 ) ) ( not ( = ?auto_629797 ?auto_629802 ) ) ( not ( = ?auto_629797 ?auto_629803 ) ) ( not ( = ?auto_629797 ?auto_629804 ) ) ( not ( = ?auto_629797 ?auto_629805 ) ) ( not ( = ?auto_629797 ?auto_629806 ) ) ( not ( = ?auto_629798 ?auto_629799 ) ) ( not ( = ?auto_629798 ?auto_629800 ) ) ( not ( = ?auto_629798 ?auto_629801 ) ) ( not ( = ?auto_629798 ?auto_629802 ) ) ( not ( = ?auto_629798 ?auto_629803 ) ) ( not ( = ?auto_629798 ?auto_629804 ) ) ( not ( = ?auto_629798 ?auto_629805 ) ) ( not ( = ?auto_629798 ?auto_629806 ) ) ( not ( = ?auto_629799 ?auto_629800 ) ) ( not ( = ?auto_629799 ?auto_629801 ) ) ( not ( = ?auto_629799 ?auto_629802 ) ) ( not ( = ?auto_629799 ?auto_629803 ) ) ( not ( = ?auto_629799 ?auto_629804 ) ) ( not ( = ?auto_629799 ?auto_629805 ) ) ( not ( = ?auto_629799 ?auto_629806 ) ) ( not ( = ?auto_629800 ?auto_629801 ) ) ( not ( = ?auto_629800 ?auto_629802 ) ) ( not ( = ?auto_629800 ?auto_629803 ) ) ( not ( = ?auto_629800 ?auto_629804 ) ) ( not ( = ?auto_629800 ?auto_629805 ) ) ( not ( = ?auto_629800 ?auto_629806 ) ) ( not ( = ?auto_629801 ?auto_629802 ) ) ( not ( = ?auto_629801 ?auto_629803 ) ) ( not ( = ?auto_629801 ?auto_629804 ) ) ( not ( = ?auto_629801 ?auto_629805 ) ) ( not ( = ?auto_629801 ?auto_629806 ) ) ( not ( = ?auto_629802 ?auto_629803 ) ) ( not ( = ?auto_629802 ?auto_629804 ) ) ( not ( = ?auto_629802 ?auto_629805 ) ) ( not ( = ?auto_629802 ?auto_629806 ) ) ( not ( = ?auto_629803 ?auto_629804 ) ) ( not ( = ?auto_629803 ?auto_629805 ) ) ( not ( = ?auto_629803 ?auto_629806 ) ) ( not ( = ?auto_629804 ?auto_629805 ) ) ( not ( = ?auto_629804 ?auto_629806 ) ) ( not ( = ?auto_629805 ?auto_629806 ) ) ( ON ?auto_629804 ?auto_629805 ) ( ON ?auto_629803 ?auto_629804 ) ( ON ?auto_629802 ?auto_629803 ) ( ON ?auto_629801 ?auto_629802 ) ( ON ?auto_629800 ?auto_629801 ) ( ON ?auto_629799 ?auto_629800 ) ( ON ?auto_629798 ?auto_629799 ) ( ON ?auto_629797 ?auto_629798 ) ( CLEAR ?auto_629795 ) ( ON ?auto_629796 ?auto_629797 ) ( CLEAR ?auto_629796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_629795 ?auto_629796 )
      ( MAKE-11PILE ?auto_629795 ?auto_629796 ?auto_629797 ?auto_629798 ?auto_629799 ?auto_629800 ?auto_629801 ?auto_629802 ?auto_629803 ?auto_629804 ?auto_629805 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_629841 - BLOCK
      ?auto_629842 - BLOCK
      ?auto_629843 - BLOCK
      ?auto_629844 - BLOCK
      ?auto_629845 - BLOCK
      ?auto_629846 - BLOCK
      ?auto_629847 - BLOCK
      ?auto_629848 - BLOCK
      ?auto_629849 - BLOCK
      ?auto_629850 - BLOCK
      ?auto_629851 - BLOCK
    )
    :vars
    (
      ?auto_629852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629851 ?auto_629852 ) ( not ( = ?auto_629841 ?auto_629842 ) ) ( not ( = ?auto_629841 ?auto_629843 ) ) ( not ( = ?auto_629841 ?auto_629844 ) ) ( not ( = ?auto_629841 ?auto_629845 ) ) ( not ( = ?auto_629841 ?auto_629846 ) ) ( not ( = ?auto_629841 ?auto_629847 ) ) ( not ( = ?auto_629841 ?auto_629848 ) ) ( not ( = ?auto_629841 ?auto_629849 ) ) ( not ( = ?auto_629841 ?auto_629850 ) ) ( not ( = ?auto_629841 ?auto_629851 ) ) ( not ( = ?auto_629841 ?auto_629852 ) ) ( not ( = ?auto_629842 ?auto_629843 ) ) ( not ( = ?auto_629842 ?auto_629844 ) ) ( not ( = ?auto_629842 ?auto_629845 ) ) ( not ( = ?auto_629842 ?auto_629846 ) ) ( not ( = ?auto_629842 ?auto_629847 ) ) ( not ( = ?auto_629842 ?auto_629848 ) ) ( not ( = ?auto_629842 ?auto_629849 ) ) ( not ( = ?auto_629842 ?auto_629850 ) ) ( not ( = ?auto_629842 ?auto_629851 ) ) ( not ( = ?auto_629842 ?auto_629852 ) ) ( not ( = ?auto_629843 ?auto_629844 ) ) ( not ( = ?auto_629843 ?auto_629845 ) ) ( not ( = ?auto_629843 ?auto_629846 ) ) ( not ( = ?auto_629843 ?auto_629847 ) ) ( not ( = ?auto_629843 ?auto_629848 ) ) ( not ( = ?auto_629843 ?auto_629849 ) ) ( not ( = ?auto_629843 ?auto_629850 ) ) ( not ( = ?auto_629843 ?auto_629851 ) ) ( not ( = ?auto_629843 ?auto_629852 ) ) ( not ( = ?auto_629844 ?auto_629845 ) ) ( not ( = ?auto_629844 ?auto_629846 ) ) ( not ( = ?auto_629844 ?auto_629847 ) ) ( not ( = ?auto_629844 ?auto_629848 ) ) ( not ( = ?auto_629844 ?auto_629849 ) ) ( not ( = ?auto_629844 ?auto_629850 ) ) ( not ( = ?auto_629844 ?auto_629851 ) ) ( not ( = ?auto_629844 ?auto_629852 ) ) ( not ( = ?auto_629845 ?auto_629846 ) ) ( not ( = ?auto_629845 ?auto_629847 ) ) ( not ( = ?auto_629845 ?auto_629848 ) ) ( not ( = ?auto_629845 ?auto_629849 ) ) ( not ( = ?auto_629845 ?auto_629850 ) ) ( not ( = ?auto_629845 ?auto_629851 ) ) ( not ( = ?auto_629845 ?auto_629852 ) ) ( not ( = ?auto_629846 ?auto_629847 ) ) ( not ( = ?auto_629846 ?auto_629848 ) ) ( not ( = ?auto_629846 ?auto_629849 ) ) ( not ( = ?auto_629846 ?auto_629850 ) ) ( not ( = ?auto_629846 ?auto_629851 ) ) ( not ( = ?auto_629846 ?auto_629852 ) ) ( not ( = ?auto_629847 ?auto_629848 ) ) ( not ( = ?auto_629847 ?auto_629849 ) ) ( not ( = ?auto_629847 ?auto_629850 ) ) ( not ( = ?auto_629847 ?auto_629851 ) ) ( not ( = ?auto_629847 ?auto_629852 ) ) ( not ( = ?auto_629848 ?auto_629849 ) ) ( not ( = ?auto_629848 ?auto_629850 ) ) ( not ( = ?auto_629848 ?auto_629851 ) ) ( not ( = ?auto_629848 ?auto_629852 ) ) ( not ( = ?auto_629849 ?auto_629850 ) ) ( not ( = ?auto_629849 ?auto_629851 ) ) ( not ( = ?auto_629849 ?auto_629852 ) ) ( not ( = ?auto_629850 ?auto_629851 ) ) ( not ( = ?auto_629850 ?auto_629852 ) ) ( not ( = ?auto_629851 ?auto_629852 ) ) ( ON ?auto_629850 ?auto_629851 ) ( ON ?auto_629849 ?auto_629850 ) ( ON ?auto_629848 ?auto_629849 ) ( ON ?auto_629847 ?auto_629848 ) ( ON ?auto_629846 ?auto_629847 ) ( ON ?auto_629845 ?auto_629846 ) ( ON ?auto_629844 ?auto_629845 ) ( ON ?auto_629843 ?auto_629844 ) ( ON ?auto_629842 ?auto_629843 ) ( ON ?auto_629841 ?auto_629842 ) ( CLEAR ?auto_629841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_629841 )
      ( MAKE-11PILE ?auto_629841 ?auto_629842 ?auto_629843 ?auto_629844 ?auto_629845 ?auto_629846 ?auto_629847 ?auto_629848 ?auto_629849 ?auto_629850 ?auto_629851 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_629888 - BLOCK
      ?auto_629889 - BLOCK
      ?auto_629890 - BLOCK
      ?auto_629891 - BLOCK
      ?auto_629892 - BLOCK
      ?auto_629893 - BLOCK
      ?auto_629894 - BLOCK
      ?auto_629895 - BLOCK
      ?auto_629896 - BLOCK
      ?auto_629897 - BLOCK
      ?auto_629898 - BLOCK
      ?auto_629899 - BLOCK
    )
    :vars
    (
      ?auto_629900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_629898 ) ( ON ?auto_629899 ?auto_629900 ) ( CLEAR ?auto_629899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_629888 ) ( ON ?auto_629889 ?auto_629888 ) ( ON ?auto_629890 ?auto_629889 ) ( ON ?auto_629891 ?auto_629890 ) ( ON ?auto_629892 ?auto_629891 ) ( ON ?auto_629893 ?auto_629892 ) ( ON ?auto_629894 ?auto_629893 ) ( ON ?auto_629895 ?auto_629894 ) ( ON ?auto_629896 ?auto_629895 ) ( ON ?auto_629897 ?auto_629896 ) ( ON ?auto_629898 ?auto_629897 ) ( not ( = ?auto_629888 ?auto_629889 ) ) ( not ( = ?auto_629888 ?auto_629890 ) ) ( not ( = ?auto_629888 ?auto_629891 ) ) ( not ( = ?auto_629888 ?auto_629892 ) ) ( not ( = ?auto_629888 ?auto_629893 ) ) ( not ( = ?auto_629888 ?auto_629894 ) ) ( not ( = ?auto_629888 ?auto_629895 ) ) ( not ( = ?auto_629888 ?auto_629896 ) ) ( not ( = ?auto_629888 ?auto_629897 ) ) ( not ( = ?auto_629888 ?auto_629898 ) ) ( not ( = ?auto_629888 ?auto_629899 ) ) ( not ( = ?auto_629888 ?auto_629900 ) ) ( not ( = ?auto_629889 ?auto_629890 ) ) ( not ( = ?auto_629889 ?auto_629891 ) ) ( not ( = ?auto_629889 ?auto_629892 ) ) ( not ( = ?auto_629889 ?auto_629893 ) ) ( not ( = ?auto_629889 ?auto_629894 ) ) ( not ( = ?auto_629889 ?auto_629895 ) ) ( not ( = ?auto_629889 ?auto_629896 ) ) ( not ( = ?auto_629889 ?auto_629897 ) ) ( not ( = ?auto_629889 ?auto_629898 ) ) ( not ( = ?auto_629889 ?auto_629899 ) ) ( not ( = ?auto_629889 ?auto_629900 ) ) ( not ( = ?auto_629890 ?auto_629891 ) ) ( not ( = ?auto_629890 ?auto_629892 ) ) ( not ( = ?auto_629890 ?auto_629893 ) ) ( not ( = ?auto_629890 ?auto_629894 ) ) ( not ( = ?auto_629890 ?auto_629895 ) ) ( not ( = ?auto_629890 ?auto_629896 ) ) ( not ( = ?auto_629890 ?auto_629897 ) ) ( not ( = ?auto_629890 ?auto_629898 ) ) ( not ( = ?auto_629890 ?auto_629899 ) ) ( not ( = ?auto_629890 ?auto_629900 ) ) ( not ( = ?auto_629891 ?auto_629892 ) ) ( not ( = ?auto_629891 ?auto_629893 ) ) ( not ( = ?auto_629891 ?auto_629894 ) ) ( not ( = ?auto_629891 ?auto_629895 ) ) ( not ( = ?auto_629891 ?auto_629896 ) ) ( not ( = ?auto_629891 ?auto_629897 ) ) ( not ( = ?auto_629891 ?auto_629898 ) ) ( not ( = ?auto_629891 ?auto_629899 ) ) ( not ( = ?auto_629891 ?auto_629900 ) ) ( not ( = ?auto_629892 ?auto_629893 ) ) ( not ( = ?auto_629892 ?auto_629894 ) ) ( not ( = ?auto_629892 ?auto_629895 ) ) ( not ( = ?auto_629892 ?auto_629896 ) ) ( not ( = ?auto_629892 ?auto_629897 ) ) ( not ( = ?auto_629892 ?auto_629898 ) ) ( not ( = ?auto_629892 ?auto_629899 ) ) ( not ( = ?auto_629892 ?auto_629900 ) ) ( not ( = ?auto_629893 ?auto_629894 ) ) ( not ( = ?auto_629893 ?auto_629895 ) ) ( not ( = ?auto_629893 ?auto_629896 ) ) ( not ( = ?auto_629893 ?auto_629897 ) ) ( not ( = ?auto_629893 ?auto_629898 ) ) ( not ( = ?auto_629893 ?auto_629899 ) ) ( not ( = ?auto_629893 ?auto_629900 ) ) ( not ( = ?auto_629894 ?auto_629895 ) ) ( not ( = ?auto_629894 ?auto_629896 ) ) ( not ( = ?auto_629894 ?auto_629897 ) ) ( not ( = ?auto_629894 ?auto_629898 ) ) ( not ( = ?auto_629894 ?auto_629899 ) ) ( not ( = ?auto_629894 ?auto_629900 ) ) ( not ( = ?auto_629895 ?auto_629896 ) ) ( not ( = ?auto_629895 ?auto_629897 ) ) ( not ( = ?auto_629895 ?auto_629898 ) ) ( not ( = ?auto_629895 ?auto_629899 ) ) ( not ( = ?auto_629895 ?auto_629900 ) ) ( not ( = ?auto_629896 ?auto_629897 ) ) ( not ( = ?auto_629896 ?auto_629898 ) ) ( not ( = ?auto_629896 ?auto_629899 ) ) ( not ( = ?auto_629896 ?auto_629900 ) ) ( not ( = ?auto_629897 ?auto_629898 ) ) ( not ( = ?auto_629897 ?auto_629899 ) ) ( not ( = ?auto_629897 ?auto_629900 ) ) ( not ( = ?auto_629898 ?auto_629899 ) ) ( not ( = ?auto_629898 ?auto_629900 ) ) ( not ( = ?auto_629899 ?auto_629900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_629899 ?auto_629900 )
      ( !STACK ?auto_629899 ?auto_629898 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_629938 - BLOCK
      ?auto_629939 - BLOCK
      ?auto_629940 - BLOCK
      ?auto_629941 - BLOCK
      ?auto_629942 - BLOCK
      ?auto_629943 - BLOCK
      ?auto_629944 - BLOCK
      ?auto_629945 - BLOCK
      ?auto_629946 - BLOCK
      ?auto_629947 - BLOCK
      ?auto_629948 - BLOCK
      ?auto_629949 - BLOCK
    )
    :vars
    (
      ?auto_629950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629949 ?auto_629950 ) ( ON-TABLE ?auto_629938 ) ( ON ?auto_629939 ?auto_629938 ) ( ON ?auto_629940 ?auto_629939 ) ( ON ?auto_629941 ?auto_629940 ) ( ON ?auto_629942 ?auto_629941 ) ( ON ?auto_629943 ?auto_629942 ) ( ON ?auto_629944 ?auto_629943 ) ( ON ?auto_629945 ?auto_629944 ) ( ON ?auto_629946 ?auto_629945 ) ( ON ?auto_629947 ?auto_629946 ) ( not ( = ?auto_629938 ?auto_629939 ) ) ( not ( = ?auto_629938 ?auto_629940 ) ) ( not ( = ?auto_629938 ?auto_629941 ) ) ( not ( = ?auto_629938 ?auto_629942 ) ) ( not ( = ?auto_629938 ?auto_629943 ) ) ( not ( = ?auto_629938 ?auto_629944 ) ) ( not ( = ?auto_629938 ?auto_629945 ) ) ( not ( = ?auto_629938 ?auto_629946 ) ) ( not ( = ?auto_629938 ?auto_629947 ) ) ( not ( = ?auto_629938 ?auto_629948 ) ) ( not ( = ?auto_629938 ?auto_629949 ) ) ( not ( = ?auto_629938 ?auto_629950 ) ) ( not ( = ?auto_629939 ?auto_629940 ) ) ( not ( = ?auto_629939 ?auto_629941 ) ) ( not ( = ?auto_629939 ?auto_629942 ) ) ( not ( = ?auto_629939 ?auto_629943 ) ) ( not ( = ?auto_629939 ?auto_629944 ) ) ( not ( = ?auto_629939 ?auto_629945 ) ) ( not ( = ?auto_629939 ?auto_629946 ) ) ( not ( = ?auto_629939 ?auto_629947 ) ) ( not ( = ?auto_629939 ?auto_629948 ) ) ( not ( = ?auto_629939 ?auto_629949 ) ) ( not ( = ?auto_629939 ?auto_629950 ) ) ( not ( = ?auto_629940 ?auto_629941 ) ) ( not ( = ?auto_629940 ?auto_629942 ) ) ( not ( = ?auto_629940 ?auto_629943 ) ) ( not ( = ?auto_629940 ?auto_629944 ) ) ( not ( = ?auto_629940 ?auto_629945 ) ) ( not ( = ?auto_629940 ?auto_629946 ) ) ( not ( = ?auto_629940 ?auto_629947 ) ) ( not ( = ?auto_629940 ?auto_629948 ) ) ( not ( = ?auto_629940 ?auto_629949 ) ) ( not ( = ?auto_629940 ?auto_629950 ) ) ( not ( = ?auto_629941 ?auto_629942 ) ) ( not ( = ?auto_629941 ?auto_629943 ) ) ( not ( = ?auto_629941 ?auto_629944 ) ) ( not ( = ?auto_629941 ?auto_629945 ) ) ( not ( = ?auto_629941 ?auto_629946 ) ) ( not ( = ?auto_629941 ?auto_629947 ) ) ( not ( = ?auto_629941 ?auto_629948 ) ) ( not ( = ?auto_629941 ?auto_629949 ) ) ( not ( = ?auto_629941 ?auto_629950 ) ) ( not ( = ?auto_629942 ?auto_629943 ) ) ( not ( = ?auto_629942 ?auto_629944 ) ) ( not ( = ?auto_629942 ?auto_629945 ) ) ( not ( = ?auto_629942 ?auto_629946 ) ) ( not ( = ?auto_629942 ?auto_629947 ) ) ( not ( = ?auto_629942 ?auto_629948 ) ) ( not ( = ?auto_629942 ?auto_629949 ) ) ( not ( = ?auto_629942 ?auto_629950 ) ) ( not ( = ?auto_629943 ?auto_629944 ) ) ( not ( = ?auto_629943 ?auto_629945 ) ) ( not ( = ?auto_629943 ?auto_629946 ) ) ( not ( = ?auto_629943 ?auto_629947 ) ) ( not ( = ?auto_629943 ?auto_629948 ) ) ( not ( = ?auto_629943 ?auto_629949 ) ) ( not ( = ?auto_629943 ?auto_629950 ) ) ( not ( = ?auto_629944 ?auto_629945 ) ) ( not ( = ?auto_629944 ?auto_629946 ) ) ( not ( = ?auto_629944 ?auto_629947 ) ) ( not ( = ?auto_629944 ?auto_629948 ) ) ( not ( = ?auto_629944 ?auto_629949 ) ) ( not ( = ?auto_629944 ?auto_629950 ) ) ( not ( = ?auto_629945 ?auto_629946 ) ) ( not ( = ?auto_629945 ?auto_629947 ) ) ( not ( = ?auto_629945 ?auto_629948 ) ) ( not ( = ?auto_629945 ?auto_629949 ) ) ( not ( = ?auto_629945 ?auto_629950 ) ) ( not ( = ?auto_629946 ?auto_629947 ) ) ( not ( = ?auto_629946 ?auto_629948 ) ) ( not ( = ?auto_629946 ?auto_629949 ) ) ( not ( = ?auto_629946 ?auto_629950 ) ) ( not ( = ?auto_629947 ?auto_629948 ) ) ( not ( = ?auto_629947 ?auto_629949 ) ) ( not ( = ?auto_629947 ?auto_629950 ) ) ( not ( = ?auto_629948 ?auto_629949 ) ) ( not ( = ?auto_629948 ?auto_629950 ) ) ( not ( = ?auto_629949 ?auto_629950 ) ) ( CLEAR ?auto_629947 ) ( ON ?auto_629948 ?auto_629949 ) ( CLEAR ?auto_629948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_629938 ?auto_629939 ?auto_629940 ?auto_629941 ?auto_629942 ?auto_629943 ?auto_629944 ?auto_629945 ?auto_629946 ?auto_629947 ?auto_629948 )
      ( MAKE-12PILE ?auto_629938 ?auto_629939 ?auto_629940 ?auto_629941 ?auto_629942 ?auto_629943 ?auto_629944 ?auto_629945 ?auto_629946 ?auto_629947 ?auto_629948 ?auto_629949 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_629988 - BLOCK
      ?auto_629989 - BLOCK
      ?auto_629990 - BLOCK
      ?auto_629991 - BLOCK
      ?auto_629992 - BLOCK
      ?auto_629993 - BLOCK
      ?auto_629994 - BLOCK
      ?auto_629995 - BLOCK
      ?auto_629996 - BLOCK
      ?auto_629997 - BLOCK
      ?auto_629998 - BLOCK
      ?auto_629999 - BLOCK
    )
    :vars
    (
      ?auto_630000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_629999 ?auto_630000 ) ( ON-TABLE ?auto_629988 ) ( ON ?auto_629989 ?auto_629988 ) ( ON ?auto_629990 ?auto_629989 ) ( ON ?auto_629991 ?auto_629990 ) ( ON ?auto_629992 ?auto_629991 ) ( ON ?auto_629993 ?auto_629992 ) ( ON ?auto_629994 ?auto_629993 ) ( ON ?auto_629995 ?auto_629994 ) ( ON ?auto_629996 ?auto_629995 ) ( not ( = ?auto_629988 ?auto_629989 ) ) ( not ( = ?auto_629988 ?auto_629990 ) ) ( not ( = ?auto_629988 ?auto_629991 ) ) ( not ( = ?auto_629988 ?auto_629992 ) ) ( not ( = ?auto_629988 ?auto_629993 ) ) ( not ( = ?auto_629988 ?auto_629994 ) ) ( not ( = ?auto_629988 ?auto_629995 ) ) ( not ( = ?auto_629988 ?auto_629996 ) ) ( not ( = ?auto_629988 ?auto_629997 ) ) ( not ( = ?auto_629988 ?auto_629998 ) ) ( not ( = ?auto_629988 ?auto_629999 ) ) ( not ( = ?auto_629988 ?auto_630000 ) ) ( not ( = ?auto_629989 ?auto_629990 ) ) ( not ( = ?auto_629989 ?auto_629991 ) ) ( not ( = ?auto_629989 ?auto_629992 ) ) ( not ( = ?auto_629989 ?auto_629993 ) ) ( not ( = ?auto_629989 ?auto_629994 ) ) ( not ( = ?auto_629989 ?auto_629995 ) ) ( not ( = ?auto_629989 ?auto_629996 ) ) ( not ( = ?auto_629989 ?auto_629997 ) ) ( not ( = ?auto_629989 ?auto_629998 ) ) ( not ( = ?auto_629989 ?auto_629999 ) ) ( not ( = ?auto_629989 ?auto_630000 ) ) ( not ( = ?auto_629990 ?auto_629991 ) ) ( not ( = ?auto_629990 ?auto_629992 ) ) ( not ( = ?auto_629990 ?auto_629993 ) ) ( not ( = ?auto_629990 ?auto_629994 ) ) ( not ( = ?auto_629990 ?auto_629995 ) ) ( not ( = ?auto_629990 ?auto_629996 ) ) ( not ( = ?auto_629990 ?auto_629997 ) ) ( not ( = ?auto_629990 ?auto_629998 ) ) ( not ( = ?auto_629990 ?auto_629999 ) ) ( not ( = ?auto_629990 ?auto_630000 ) ) ( not ( = ?auto_629991 ?auto_629992 ) ) ( not ( = ?auto_629991 ?auto_629993 ) ) ( not ( = ?auto_629991 ?auto_629994 ) ) ( not ( = ?auto_629991 ?auto_629995 ) ) ( not ( = ?auto_629991 ?auto_629996 ) ) ( not ( = ?auto_629991 ?auto_629997 ) ) ( not ( = ?auto_629991 ?auto_629998 ) ) ( not ( = ?auto_629991 ?auto_629999 ) ) ( not ( = ?auto_629991 ?auto_630000 ) ) ( not ( = ?auto_629992 ?auto_629993 ) ) ( not ( = ?auto_629992 ?auto_629994 ) ) ( not ( = ?auto_629992 ?auto_629995 ) ) ( not ( = ?auto_629992 ?auto_629996 ) ) ( not ( = ?auto_629992 ?auto_629997 ) ) ( not ( = ?auto_629992 ?auto_629998 ) ) ( not ( = ?auto_629992 ?auto_629999 ) ) ( not ( = ?auto_629992 ?auto_630000 ) ) ( not ( = ?auto_629993 ?auto_629994 ) ) ( not ( = ?auto_629993 ?auto_629995 ) ) ( not ( = ?auto_629993 ?auto_629996 ) ) ( not ( = ?auto_629993 ?auto_629997 ) ) ( not ( = ?auto_629993 ?auto_629998 ) ) ( not ( = ?auto_629993 ?auto_629999 ) ) ( not ( = ?auto_629993 ?auto_630000 ) ) ( not ( = ?auto_629994 ?auto_629995 ) ) ( not ( = ?auto_629994 ?auto_629996 ) ) ( not ( = ?auto_629994 ?auto_629997 ) ) ( not ( = ?auto_629994 ?auto_629998 ) ) ( not ( = ?auto_629994 ?auto_629999 ) ) ( not ( = ?auto_629994 ?auto_630000 ) ) ( not ( = ?auto_629995 ?auto_629996 ) ) ( not ( = ?auto_629995 ?auto_629997 ) ) ( not ( = ?auto_629995 ?auto_629998 ) ) ( not ( = ?auto_629995 ?auto_629999 ) ) ( not ( = ?auto_629995 ?auto_630000 ) ) ( not ( = ?auto_629996 ?auto_629997 ) ) ( not ( = ?auto_629996 ?auto_629998 ) ) ( not ( = ?auto_629996 ?auto_629999 ) ) ( not ( = ?auto_629996 ?auto_630000 ) ) ( not ( = ?auto_629997 ?auto_629998 ) ) ( not ( = ?auto_629997 ?auto_629999 ) ) ( not ( = ?auto_629997 ?auto_630000 ) ) ( not ( = ?auto_629998 ?auto_629999 ) ) ( not ( = ?auto_629998 ?auto_630000 ) ) ( not ( = ?auto_629999 ?auto_630000 ) ) ( ON ?auto_629998 ?auto_629999 ) ( CLEAR ?auto_629996 ) ( ON ?auto_629997 ?auto_629998 ) ( CLEAR ?auto_629997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_629988 ?auto_629989 ?auto_629990 ?auto_629991 ?auto_629992 ?auto_629993 ?auto_629994 ?auto_629995 ?auto_629996 ?auto_629997 )
      ( MAKE-12PILE ?auto_629988 ?auto_629989 ?auto_629990 ?auto_629991 ?auto_629992 ?auto_629993 ?auto_629994 ?auto_629995 ?auto_629996 ?auto_629997 ?auto_629998 ?auto_629999 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630038 - BLOCK
      ?auto_630039 - BLOCK
      ?auto_630040 - BLOCK
      ?auto_630041 - BLOCK
      ?auto_630042 - BLOCK
      ?auto_630043 - BLOCK
      ?auto_630044 - BLOCK
      ?auto_630045 - BLOCK
      ?auto_630046 - BLOCK
      ?auto_630047 - BLOCK
      ?auto_630048 - BLOCK
      ?auto_630049 - BLOCK
    )
    :vars
    (
      ?auto_630050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630049 ?auto_630050 ) ( ON-TABLE ?auto_630038 ) ( ON ?auto_630039 ?auto_630038 ) ( ON ?auto_630040 ?auto_630039 ) ( ON ?auto_630041 ?auto_630040 ) ( ON ?auto_630042 ?auto_630041 ) ( ON ?auto_630043 ?auto_630042 ) ( ON ?auto_630044 ?auto_630043 ) ( ON ?auto_630045 ?auto_630044 ) ( not ( = ?auto_630038 ?auto_630039 ) ) ( not ( = ?auto_630038 ?auto_630040 ) ) ( not ( = ?auto_630038 ?auto_630041 ) ) ( not ( = ?auto_630038 ?auto_630042 ) ) ( not ( = ?auto_630038 ?auto_630043 ) ) ( not ( = ?auto_630038 ?auto_630044 ) ) ( not ( = ?auto_630038 ?auto_630045 ) ) ( not ( = ?auto_630038 ?auto_630046 ) ) ( not ( = ?auto_630038 ?auto_630047 ) ) ( not ( = ?auto_630038 ?auto_630048 ) ) ( not ( = ?auto_630038 ?auto_630049 ) ) ( not ( = ?auto_630038 ?auto_630050 ) ) ( not ( = ?auto_630039 ?auto_630040 ) ) ( not ( = ?auto_630039 ?auto_630041 ) ) ( not ( = ?auto_630039 ?auto_630042 ) ) ( not ( = ?auto_630039 ?auto_630043 ) ) ( not ( = ?auto_630039 ?auto_630044 ) ) ( not ( = ?auto_630039 ?auto_630045 ) ) ( not ( = ?auto_630039 ?auto_630046 ) ) ( not ( = ?auto_630039 ?auto_630047 ) ) ( not ( = ?auto_630039 ?auto_630048 ) ) ( not ( = ?auto_630039 ?auto_630049 ) ) ( not ( = ?auto_630039 ?auto_630050 ) ) ( not ( = ?auto_630040 ?auto_630041 ) ) ( not ( = ?auto_630040 ?auto_630042 ) ) ( not ( = ?auto_630040 ?auto_630043 ) ) ( not ( = ?auto_630040 ?auto_630044 ) ) ( not ( = ?auto_630040 ?auto_630045 ) ) ( not ( = ?auto_630040 ?auto_630046 ) ) ( not ( = ?auto_630040 ?auto_630047 ) ) ( not ( = ?auto_630040 ?auto_630048 ) ) ( not ( = ?auto_630040 ?auto_630049 ) ) ( not ( = ?auto_630040 ?auto_630050 ) ) ( not ( = ?auto_630041 ?auto_630042 ) ) ( not ( = ?auto_630041 ?auto_630043 ) ) ( not ( = ?auto_630041 ?auto_630044 ) ) ( not ( = ?auto_630041 ?auto_630045 ) ) ( not ( = ?auto_630041 ?auto_630046 ) ) ( not ( = ?auto_630041 ?auto_630047 ) ) ( not ( = ?auto_630041 ?auto_630048 ) ) ( not ( = ?auto_630041 ?auto_630049 ) ) ( not ( = ?auto_630041 ?auto_630050 ) ) ( not ( = ?auto_630042 ?auto_630043 ) ) ( not ( = ?auto_630042 ?auto_630044 ) ) ( not ( = ?auto_630042 ?auto_630045 ) ) ( not ( = ?auto_630042 ?auto_630046 ) ) ( not ( = ?auto_630042 ?auto_630047 ) ) ( not ( = ?auto_630042 ?auto_630048 ) ) ( not ( = ?auto_630042 ?auto_630049 ) ) ( not ( = ?auto_630042 ?auto_630050 ) ) ( not ( = ?auto_630043 ?auto_630044 ) ) ( not ( = ?auto_630043 ?auto_630045 ) ) ( not ( = ?auto_630043 ?auto_630046 ) ) ( not ( = ?auto_630043 ?auto_630047 ) ) ( not ( = ?auto_630043 ?auto_630048 ) ) ( not ( = ?auto_630043 ?auto_630049 ) ) ( not ( = ?auto_630043 ?auto_630050 ) ) ( not ( = ?auto_630044 ?auto_630045 ) ) ( not ( = ?auto_630044 ?auto_630046 ) ) ( not ( = ?auto_630044 ?auto_630047 ) ) ( not ( = ?auto_630044 ?auto_630048 ) ) ( not ( = ?auto_630044 ?auto_630049 ) ) ( not ( = ?auto_630044 ?auto_630050 ) ) ( not ( = ?auto_630045 ?auto_630046 ) ) ( not ( = ?auto_630045 ?auto_630047 ) ) ( not ( = ?auto_630045 ?auto_630048 ) ) ( not ( = ?auto_630045 ?auto_630049 ) ) ( not ( = ?auto_630045 ?auto_630050 ) ) ( not ( = ?auto_630046 ?auto_630047 ) ) ( not ( = ?auto_630046 ?auto_630048 ) ) ( not ( = ?auto_630046 ?auto_630049 ) ) ( not ( = ?auto_630046 ?auto_630050 ) ) ( not ( = ?auto_630047 ?auto_630048 ) ) ( not ( = ?auto_630047 ?auto_630049 ) ) ( not ( = ?auto_630047 ?auto_630050 ) ) ( not ( = ?auto_630048 ?auto_630049 ) ) ( not ( = ?auto_630048 ?auto_630050 ) ) ( not ( = ?auto_630049 ?auto_630050 ) ) ( ON ?auto_630048 ?auto_630049 ) ( ON ?auto_630047 ?auto_630048 ) ( CLEAR ?auto_630045 ) ( ON ?auto_630046 ?auto_630047 ) ( CLEAR ?auto_630046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_630038 ?auto_630039 ?auto_630040 ?auto_630041 ?auto_630042 ?auto_630043 ?auto_630044 ?auto_630045 ?auto_630046 )
      ( MAKE-12PILE ?auto_630038 ?auto_630039 ?auto_630040 ?auto_630041 ?auto_630042 ?auto_630043 ?auto_630044 ?auto_630045 ?auto_630046 ?auto_630047 ?auto_630048 ?auto_630049 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630088 - BLOCK
      ?auto_630089 - BLOCK
      ?auto_630090 - BLOCK
      ?auto_630091 - BLOCK
      ?auto_630092 - BLOCK
      ?auto_630093 - BLOCK
      ?auto_630094 - BLOCK
      ?auto_630095 - BLOCK
      ?auto_630096 - BLOCK
      ?auto_630097 - BLOCK
      ?auto_630098 - BLOCK
      ?auto_630099 - BLOCK
    )
    :vars
    (
      ?auto_630100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630099 ?auto_630100 ) ( ON-TABLE ?auto_630088 ) ( ON ?auto_630089 ?auto_630088 ) ( ON ?auto_630090 ?auto_630089 ) ( ON ?auto_630091 ?auto_630090 ) ( ON ?auto_630092 ?auto_630091 ) ( ON ?auto_630093 ?auto_630092 ) ( ON ?auto_630094 ?auto_630093 ) ( not ( = ?auto_630088 ?auto_630089 ) ) ( not ( = ?auto_630088 ?auto_630090 ) ) ( not ( = ?auto_630088 ?auto_630091 ) ) ( not ( = ?auto_630088 ?auto_630092 ) ) ( not ( = ?auto_630088 ?auto_630093 ) ) ( not ( = ?auto_630088 ?auto_630094 ) ) ( not ( = ?auto_630088 ?auto_630095 ) ) ( not ( = ?auto_630088 ?auto_630096 ) ) ( not ( = ?auto_630088 ?auto_630097 ) ) ( not ( = ?auto_630088 ?auto_630098 ) ) ( not ( = ?auto_630088 ?auto_630099 ) ) ( not ( = ?auto_630088 ?auto_630100 ) ) ( not ( = ?auto_630089 ?auto_630090 ) ) ( not ( = ?auto_630089 ?auto_630091 ) ) ( not ( = ?auto_630089 ?auto_630092 ) ) ( not ( = ?auto_630089 ?auto_630093 ) ) ( not ( = ?auto_630089 ?auto_630094 ) ) ( not ( = ?auto_630089 ?auto_630095 ) ) ( not ( = ?auto_630089 ?auto_630096 ) ) ( not ( = ?auto_630089 ?auto_630097 ) ) ( not ( = ?auto_630089 ?auto_630098 ) ) ( not ( = ?auto_630089 ?auto_630099 ) ) ( not ( = ?auto_630089 ?auto_630100 ) ) ( not ( = ?auto_630090 ?auto_630091 ) ) ( not ( = ?auto_630090 ?auto_630092 ) ) ( not ( = ?auto_630090 ?auto_630093 ) ) ( not ( = ?auto_630090 ?auto_630094 ) ) ( not ( = ?auto_630090 ?auto_630095 ) ) ( not ( = ?auto_630090 ?auto_630096 ) ) ( not ( = ?auto_630090 ?auto_630097 ) ) ( not ( = ?auto_630090 ?auto_630098 ) ) ( not ( = ?auto_630090 ?auto_630099 ) ) ( not ( = ?auto_630090 ?auto_630100 ) ) ( not ( = ?auto_630091 ?auto_630092 ) ) ( not ( = ?auto_630091 ?auto_630093 ) ) ( not ( = ?auto_630091 ?auto_630094 ) ) ( not ( = ?auto_630091 ?auto_630095 ) ) ( not ( = ?auto_630091 ?auto_630096 ) ) ( not ( = ?auto_630091 ?auto_630097 ) ) ( not ( = ?auto_630091 ?auto_630098 ) ) ( not ( = ?auto_630091 ?auto_630099 ) ) ( not ( = ?auto_630091 ?auto_630100 ) ) ( not ( = ?auto_630092 ?auto_630093 ) ) ( not ( = ?auto_630092 ?auto_630094 ) ) ( not ( = ?auto_630092 ?auto_630095 ) ) ( not ( = ?auto_630092 ?auto_630096 ) ) ( not ( = ?auto_630092 ?auto_630097 ) ) ( not ( = ?auto_630092 ?auto_630098 ) ) ( not ( = ?auto_630092 ?auto_630099 ) ) ( not ( = ?auto_630092 ?auto_630100 ) ) ( not ( = ?auto_630093 ?auto_630094 ) ) ( not ( = ?auto_630093 ?auto_630095 ) ) ( not ( = ?auto_630093 ?auto_630096 ) ) ( not ( = ?auto_630093 ?auto_630097 ) ) ( not ( = ?auto_630093 ?auto_630098 ) ) ( not ( = ?auto_630093 ?auto_630099 ) ) ( not ( = ?auto_630093 ?auto_630100 ) ) ( not ( = ?auto_630094 ?auto_630095 ) ) ( not ( = ?auto_630094 ?auto_630096 ) ) ( not ( = ?auto_630094 ?auto_630097 ) ) ( not ( = ?auto_630094 ?auto_630098 ) ) ( not ( = ?auto_630094 ?auto_630099 ) ) ( not ( = ?auto_630094 ?auto_630100 ) ) ( not ( = ?auto_630095 ?auto_630096 ) ) ( not ( = ?auto_630095 ?auto_630097 ) ) ( not ( = ?auto_630095 ?auto_630098 ) ) ( not ( = ?auto_630095 ?auto_630099 ) ) ( not ( = ?auto_630095 ?auto_630100 ) ) ( not ( = ?auto_630096 ?auto_630097 ) ) ( not ( = ?auto_630096 ?auto_630098 ) ) ( not ( = ?auto_630096 ?auto_630099 ) ) ( not ( = ?auto_630096 ?auto_630100 ) ) ( not ( = ?auto_630097 ?auto_630098 ) ) ( not ( = ?auto_630097 ?auto_630099 ) ) ( not ( = ?auto_630097 ?auto_630100 ) ) ( not ( = ?auto_630098 ?auto_630099 ) ) ( not ( = ?auto_630098 ?auto_630100 ) ) ( not ( = ?auto_630099 ?auto_630100 ) ) ( ON ?auto_630098 ?auto_630099 ) ( ON ?auto_630097 ?auto_630098 ) ( ON ?auto_630096 ?auto_630097 ) ( CLEAR ?auto_630094 ) ( ON ?auto_630095 ?auto_630096 ) ( CLEAR ?auto_630095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_630088 ?auto_630089 ?auto_630090 ?auto_630091 ?auto_630092 ?auto_630093 ?auto_630094 ?auto_630095 )
      ( MAKE-12PILE ?auto_630088 ?auto_630089 ?auto_630090 ?auto_630091 ?auto_630092 ?auto_630093 ?auto_630094 ?auto_630095 ?auto_630096 ?auto_630097 ?auto_630098 ?auto_630099 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630138 - BLOCK
      ?auto_630139 - BLOCK
      ?auto_630140 - BLOCK
      ?auto_630141 - BLOCK
      ?auto_630142 - BLOCK
      ?auto_630143 - BLOCK
      ?auto_630144 - BLOCK
      ?auto_630145 - BLOCK
      ?auto_630146 - BLOCK
      ?auto_630147 - BLOCK
      ?auto_630148 - BLOCK
      ?auto_630149 - BLOCK
    )
    :vars
    (
      ?auto_630150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630149 ?auto_630150 ) ( ON-TABLE ?auto_630138 ) ( ON ?auto_630139 ?auto_630138 ) ( ON ?auto_630140 ?auto_630139 ) ( ON ?auto_630141 ?auto_630140 ) ( ON ?auto_630142 ?auto_630141 ) ( ON ?auto_630143 ?auto_630142 ) ( not ( = ?auto_630138 ?auto_630139 ) ) ( not ( = ?auto_630138 ?auto_630140 ) ) ( not ( = ?auto_630138 ?auto_630141 ) ) ( not ( = ?auto_630138 ?auto_630142 ) ) ( not ( = ?auto_630138 ?auto_630143 ) ) ( not ( = ?auto_630138 ?auto_630144 ) ) ( not ( = ?auto_630138 ?auto_630145 ) ) ( not ( = ?auto_630138 ?auto_630146 ) ) ( not ( = ?auto_630138 ?auto_630147 ) ) ( not ( = ?auto_630138 ?auto_630148 ) ) ( not ( = ?auto_630138 ?auto_630149 ) ) ( not ( = ?auto_630138 ?auto_630150 ) ) ( not ( = ?auto_630139 ?auto_630140 ) ) ( not ( = ?auto_630139 ?auto_630141 ) ) ( not ( = ?auto_630139 ?auto_630142 ) ) ( not ( = ?auto_630139 ?auto_630143 ) ) ( not ( = ?auto_630139 ?auto_630144 ) ) ( not ( = ?auto_630139 ?auto_630145 ) ) ( not ( = ?auto_630139 ?auto_630146 ) ) ( not ( = ?auto_630139 ?auto_630147 ) ) ( not ( = ?auto_630139 ?auto_630148 ) ) ( not ( = ?auto_630139 ?auto_630149 ) ) ( not ( = ?auto_630139 ?auto_630150 ) ) ( not ( = ?auto_630140 ?auto_630141 ) ) ( not ( = ?auto_630140 ?auto_630142 ) ) ( not ( = ?auto_630140 ?auto_630143 ) ) ( not ( = ?auto_630140 ?auto_630144 ) ) ( not ( = ?auto_630140 ?auto_630145 ) ) ( not ( = ?auto_630140 ?auto_630146 ) ) ( not ( = ?auto_630140 ?auto_630147 ) ) ( not ( = ?auto_630140 ?auto_630148 ) ) ( not ( = ?auto_630140 ?auto_630149 ) ) ( not ( = ?auto_630140 ?auto_630150 ) ) ( not ( = ?auto_630141 ?auto_630142 ) ) ( not ( = ?auto_630141 ?auto_630143 ) ) ( not ( = ?auto_630141 ?auto_630144 ) ) ( not ( = ?auto_630141 ?auto_630145 ) ) ( not ( = ?auto_630141 ?auto_630146 ) ) ( not ( = ?auto_630141 ?auto_630147 ) ) ( not ( = ?auto_630141 ?auto_630148 ) ) ( not ( = ?auto_630141 ?auto_630149 ) ) ( not ( = ?auto_630141 ?auto_630150 ) ) ( not ( = ?auto_630142 ?auto_630143 ) ) ( not ( = ?auto_630142 ?auto_630144 ) ) ( not ( = ?auto_630142 ?auto_630145 ) ) ( not ( = ?auto_630142 ?auto_630146 ) ) ( not ( = ?auto_630142 ?auto_630147 ) ) ( not ( = ?auto_630142 ?auto_630148 ) ) ( not ( = ?auto_630142 ?auto_630149 ) ) ( not ( = ?auto_630142 ?auto_630150 ) ) ( not ( = ?auto_630143 ?auto_630144 ) ) ( not ( = ?auto_630143 ?auto_630145 ) ) ( not ( = ?auto_630143 ?auto_630146 ) ) ( not ( = ?auto_630143 ?auto_630147 ) ) ( not ( = ?auto_630143 ?auto_630148 ) ) ( not ( = ?auto_630143 ?auto_630149 ) ) ( not ( = ?auto_630143 ?auto_630150 ) ) ( not ( = ?auto_630144 ?auto_630145 ) ) ( not ( = ?auto_630144 ?auto_630146 ) ) ( not ( = ?auto_630144 ?auto_630147 ) ) ( not ( = ?auto_630144 ?auto_630148 ) ) ( not ( = ?auto_630144 ?auto_630149 ) ) ( not ( = ?auto_630144 ?auto_630150 ) ) ( not ( = ?auto_630145 ?auto_630146 ) ) ( not ( = ?auto_630145 ?auto_630147 ) ) ( not ( = ?auto_630145 ?auto_630148 ) ) ( not ( = ?auto_630145 ?auto_630149 ) ) ( not ( = ?auto_630145 ?auto_630150 ) ) ( not ( = ?auto_630146 ?auto_630147 ) ) ( not ( = ?auto_630146 ?auto_630148 ) ) ( not ( = ?auto_630146 ?auto_630149 ) ) ( not ( = ?auto_630146 ?auto_630150 ) ) ( not ( = ?auto_630147 ?auto_630148 ) ) ( not ( = ?auto_630147 ?auto_630149 ) ) ( not ( = ?auto_630147 ?auto_630150 ) ) ( not ( = ?auto_630148 ?auto_630149 ) ) ( not ( = ?auto_630148 ?auto_630150 ) ) ( not ( = ?auto_630149 ?auto_630150 ) ) ( ON ?auto_630148 ?auto_630149 ) ( ON ?auto_630147 ?auto_630148 ) ( ON ?auto_630146 ?auto_630147 ) ( ON ?auto_630145 ?auto_630146 ) ( CLEAR ?auto_630143 ) ( ON ?auto_630144 ?auto_630145 ) ( CLEAR ?auto_630144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_630138 ?auto_630139 ?auto_630140 ?auto_630141 ?auto_630142 ?auto_630143 ?auto_630144 )
      ( MAKE-12PILE ?auto_630138 ?auto_630139 ?auto_630140 ?auto_630141 ?auto_630142 ?auto_630143 ?auto_630144 ?auto_630145 ?auto_630146 ?auto_630147 ?auto_630148 ?auto_630149 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630188 - BLOCK
      ?auto_630189 - BLOCK
      ?auto_630190 - BLOCK
      ?auto_630191 - BLOCK
      ?auto_630192 - BLOCK
      ?auto_630193 - BLOCK
      ?auto_630194 - BLOCK
      ?auto_630195 - BLOCK
      ?auto_630196 - BLOCK
      ?auto_630197 - BLOCK
      ?auto_630198 - BLOCK
      ?auto_630199 - BLOCK
    )
    :vars
    (
      ?auto_630200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630199 ?auto_630200 ) ( ON-TABLE ?auto_630188 ) ( ON ?auto_630189 ?auto_630188 ) ( ON ?auto_630190 ?auto_630189 ) ( ON ?auto_630191 ?auto_630190 ) ( ON ?auto_630192 ?auto_630191 ) ( not ( = ?auto_630188 ?auto_630189 ) ) ( not ( = ?auto_630188 ?auto_630190 ) ) ( not ( = ?auto_630188 ?auto_630191 ) ) ( not ( = ?auto_630188 ?auto_630192 ) ) ( not ( = ?auto_630188 ?auto_630193 ) ) ( not ( = ?auto_630188 ?auto_630194 ) ) ( not ( = ?auto_630188 ?auto_630195 ) ) ( not ( = ?auto_630188 ?auto_630196 ) ) ( not ( = ?auto_630188 ?auto_630197 ) ) ( not ( = ?auto_630188 ?auto_630198 ) ) ( not ( = ?auto_630188 ?auto_630199 ) ) ( not ( = ?auto_630188 ?auto_630200 ) ) ( not ( = ?auto_630189 ?auto_630190 ) ) ( not ( = ?auto_630189 ?auto_630191 ) ) ( not ( = ?auto_630189 ?auto_630192 ) ) ( not ( = ?auto_630189 ?auto_630193 ) ) ( not ( = ?auto_630189 ?auto_630194 ) ) ( not ( = ?auto_630189 ?auto_630195 ) ) ( not ( = ?auto_630189 ?auto_630196 ) ) ( not ( = ?auto_630189 ?auto_630197 ) ) ( not ( = ?auto_630189 ?auto_630198 ) ) ( not ( = ?auto_630189 ?auto_630199 ) ) ( not ( = ?auto_630189 ?auto_630200 ) ) ( not ( = ?auto_630190 ?auto_630191 ) ) ( not ( = ?auto_630190 ?auto_630192 ) ) ( not ( = ?auto_630190 ?auto_630193 ) ) ( not ( = ?auto_630190 ?auto_630194 ) ) ( not ( = ?auto_630190 ?auto_630195 ) ) ( not ( = ?auto_630190 ?auto_630196 ) ) ( not ( = ?auto_630190 ?auto_630197 ) ) ( not ( = ?auto_630190 ?auto_630198 ) ) ( not ( = ?auto_630190 ?auto_630199 ) ) ( not ( = ?auto_630190 ?auto_630200 ) ) ( not ( = ?auto_630191 ?auto_630192 ) ) ( not ( = ?auto_630191 ?auto_630193 ) ) ( not ( = ?auto_630191 ?auto_630194 ) ) ( not ( = ?auto_630191 ?auto_630195 ) ) ( not ( = ?auto_630191 ?auto_630196 ) ) ( not ( = ?auto_630191 ?auto_630197 ) ) ( not ( = ?auto_630191 ?auto_630198 ) ) ( not ( = ?auto_630191 ?auto_630199 ) ) ( not ( = ?auto_630191 ?auto_630200 ) ) ( not ( = ?auto_630192 ?auto_630193 ) ) ( not ( = ?auto_630192 ?auto_630194 ) ) ( not ( = ?auto_630192 ?auto_630195 ) ) ( not ( = ?auto_630192 ?auto_630196 ) ) ( not ( = ?auto_630192 ?auto_630197 ) ) ( not ( = ?auto_630192 ?auto_630198 ) ) ( not ( = ?auto_630192 ?auto_630199 ) ) ( not ( = ?auto_630192 ?auto_630200 ) ) ( not ( = ?auto_630193 ?auto_630194 ) ) ( not ( = ?auto_630193 ?auto_630195 ) ) ( not ( = ?auto_630193 ?auto_630196 ) ) ( not ( = ?auto_630193 ?auto_630197 ) ) ( not ( = ?auto_630193 ?auto_630198 ) ) ( not ( = ?auto_630193 ?auto_630199 ) ) ( not ( = ?auto_630193 ?auto_630200 ) ) ( not ( = ?auto_630194 ?auto_630195 ) ) ( not ( = ?auto_630194 ?auto_630196 ) ) ( not ( = ?auto_630194 ?auto_630197 ) ) ( not ( = ?auto_630194 ?auto_630198 ) ) ( not ( = ?auto_630194 ?auto_630199 ) ) ( not ( = ?auto_630194 ?auto_630200 ) ) ( not ( = ?auto_630195 ?auto_630196 ) ) ( not ( = ?auto_630195 ?auto_630197 ) ) ( not ( = ?auto_630195 ?auto_630198 ) ) ( not ( = ?auto_630195 ?auto_630199 ) ) ( not ( = ?auto_630195 ?auto_630200 ) ) ( not ( = ?auto_630196 ?auto_630197 ) ) ( not ( = ?auto_630196 ?auto_630198 ) ) ( not ( = ?auto_630196 ?auto_630199 ) ) ( not ( = ?auto_630196 ?auto_630200 ) ) ( not ( = ?auto_630197 ?auto_630198 ) ) ( not ( = ?auto_630197 ?auto_630199 ) ) ( not ( = ?auto_630197 ?auto_630200 ) ) ( not ( = ?auto_630198 ?auto_630199 ) ) ( not ( = ?auto_630198 ?auto_630200 ) ) ( not ( = ?auto_630199 ?auto_630200 ) ) ( ON ?auto_630198 ?auto_630199 ) ( ON ?auto_630197 ?auto_630198 ) ( ON ?auto_630196 ?auto_630197 ) ( ON ?auto_630195 ?auto_630196 ) ( ON ?auto_630194 ?auto_630195 ) ( CLEAR ?auto_630192 ) ( ON ?auto_630193 ?auto_630194 ) ( CLEAR ?auto_630193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_630188 ?auto_630189 ?auto_630190 ?auto_630191 ?auto_630192 ?auto_630193 )
      ( MAKE-12PILE ?auto_630188 ?auto_630189 ?auto_630190 ?auto_630191 ?auto_630192 ?auto_630193 ?auto_630194 ?auto_630195 ?auto_630196 ?auto_630197 ?auto_630198 ?auto_630199 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630238 - BLOCK
      ?auto_630239 - BLOCK
      ?auto_630240 - BLOCK
      ?auto_630241 - BLOCK
      ?auto_630242 - BLOCK
      ?auto_630243 - BLOCK
      ?auto_630244 - BLOCK
      ?auto_630245 - BLOCK
      ?auto_630246 - BLOCK
      ?auto_630247 - BLOCK
      ?auto_630248 - BLOCK
      ?auto_630249 - BLOCK
    )
    :vars
    (
      ?auto_630250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630249 ?auto_630250 ) ( ON-TABLE ?auto_630238 ) ( ON ?auto_630239 ?auto_630238 ) ( ON ?auto_630240 ?auto_630239 ) ( ON ?auto_630241 ?auto_630240 ) ( not ( = ?auto_630238 ?auto_630239 ) ) ( not ( = ?auto_630238 ?auto_630240 ) ) ( not ( = ?auto_630238 ?auto_630241 ) ) ( not ( = ?auto_630238 ?auto_630242 ) ) ( not ( = ?auto_630238 ?auto_630243 ) ) ( not ( = ?auto_630238 ?auto_630244 ) ) ( not ( = ?auto_630238 ?auto_630245 ) ) ( not ( = ?auto_630238 ?auto_630246 ) ) ( not ( = ?auto_630238 ?auto_630247 ) ) ( not ( = ?auto_630238 ?auto_630248 ) ) ( not ( = ?auto_630238 ?auto_630249 ) ) ( not ( = ?auto_630238 ?auto_630250 ) ) ( not ( = ?auto_630239 ?auto_630240 ) ) ( not ( = ?auto_630239 ?auto_630241 ) ) ( not ( = ?auto_630239 ?auto_630242 ) ) ( not ( = ?auto_630239 ?auto_630243 ) ) ( not ( = ?auto_630239 ?auto_630244 ) ) ( not ( = ?auto_630239 ?auto_630245 ) ) ( not ( = ?auto_630239 ?auto_630246 ) ) ( not ( = ?auto_630239 ?auto_630247 ) ) ( not ( = ?auto_630239 ?auto_630248 ) ) ( not ( = ?auto_630239 ?auto_630249 ) ) ( not ( = ?auto_630239 ?auto_630250 ) ) ( not ( = ?auto_630240 ?auto_630241 ) ) ( not ( = ?auto_630240 ?auto_630242 ) ) ( not ( = ?auto_630240 ?auto_630243 ) ) ( not ( = ?auto_630240 ?auto_630244 ) ) ( not ( = ?auto_630240 ?auto_630245 ) ) ( not ( = ?auto_630240 ?auto_630246 ) ) ( not ( = ?auto_630240 ?auto_630247 ) ) ( not ( = ?auto_630240 ?auto_630248 ) ) ( not ( = ?auto_630240 ?auto_630249 ) ) ( not ( = ?auto_630240 ?auto_630250 ) ) ( not ( = ?auto_630241 ?auto_630242 ) ) ( not ( = ?auto_630241 ?auto_630243 ) ) ( not ( = ?auto_630241 ?auto_630244 ) ) ( not ( = ?auto_630241 ?auto_630245 ) ) ( not ( = ?auto_630241 ?auto_630246 ) ) ( not ( = ?auto_630241 ?auto_630247 ) ) ( not ( = ?auto_630241 ?auto_630248 ) ) ( not ( = ?auto_630241 ?auto_630249 ) ) ( not ( = ?auto_630241 ?auto_630250 ) ) ( not ( = ?auto_630242 ?auto_630243 ) ) ( not ( = ?auto_630242 ?auto_630244 ) ) ( not ( = ?auto_630242 ?auto_630245 ) ) ( not ( = ?auto_630242 ?auto_630246 ) ) ( not ( = ?auto_630242 ?auto_630247 ) ) ( not ( = ?auto_630242 ?auto_630248 ) ) ( not ( = ?auto_630242 ?auto_630249 ) ) ( not ( = ?auto_630242 ?auto_630250 ) ) ( not ( = ?auto_630243 ?auto_630244 ) ) ( not ( = ?auto_630243 ?auto_630245 ) ) ( not ( = ?auto_630243 ?auto_630246 ) ) ( not ( = ?auto_630243 ?auto_630247 ) ) ( not ( = ?auto_630243 ?auto_630248 ) ) ( not ( = ?auto_630243 ?auto_630249 ) ) ( not ( = ?auto_630243 ?auto_630250 ) ) ( not ( = ?auto_630244 ?auto_630245 ) ) ( not ( = ?auto_630244 ?auto_630246 ) ) ( not ( = ?auto_630244 ?auto_630247 ) ) ( not ( = ?auto_630244 ?auto_630248 ) ) ( not ( = ?auto_630244 ?auto_630249 ) ) ( not ( = ?auto_630244 ?auto_630250 ) ) ( not ( = ?auto_630245 ?auto_630246 ) ) ( not ( = ?auto_630245 ?auto_630247 ) ) ( not ( = ?auto_630245 ?auto_630248 ) ) ( not ( = ?auto_630245 ?auto_630249 ) ) ( not ( = ?auto_630245 ?auto_630250 ) ) ( not ( = ?auto_630246 ?auto_630247 ) ) ( not ( = ?auto_630246 ?auto_630248 ) ) ( not ( = ?auto_630246 ?auto_630249 ) ) ( not ( = ?auto_630246 ?auto_630250 ) ) ( not ( = ?auto_630247 ?auto_630248 ) ) ( not ( = ?auto_630247 ?auto_630249 ) ) ( not ( = ?auto_630247 ?auto_630250 ) ) ( not ( = ?auto_630248 ?auto_630249 ) ) ( not ( = ?auto_630248 ?auto_630250 ) ) ( not ( = ?auto_630249 ?auto_630250 ) ) ( ON ?auto_630248 ?auto_630249 ) ( ON ?auto_630247 ?auto_630248 ) ( ON ?auto_630246 ?auto_630247 ) ( ON ?auto_630245 ?auto_630246 ) ( ON ?auto_630244 ?auto_630245 ) ( ON ?auto_630243 ?auto_630244 ) ( CLEAR ?auto_630241 ) ( ON ?auto_630242 ?auto_630243 ) ( CLEAR ?auto_630242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_630238 ?auto_630239 ?auto_630240 ?auto_630241 ?auto_630242 )
      ( MAKE-12PILE ?auto_630238 ?auto_630239 ?auto_630240 ?auto_630241 ?auto_630242 ?auto_630243 ?auto_630244 ?auto_630245 ?auto_630246 ?auto_630247 ?auto_630248 ?auto_630249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630288 - BLOCK
      ?auto_630289 - BLOCK
      ?auto_630290 - BLOCK
      ?auto_630291 - BLOCK
      ?auto_630292 - BLOCK
      ?auto_630293 - BLOCK
      ?auto_630294 - BLOCK
      ?auto_630295 - BLOCK
      ?auto_630296 - BLOCK
      ?auto_630297 - BLOCK
      ?auto_630298 - BLOCK
      ?auto_630299 - BLOCK
    )
    :vars
    (
      ?auto_630300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630299 ?auto_630300 ) ( ON-TABLE ?auto_630288 ) ( ON ?auto_630289 ?auto_630288 ) ( ON ?auto_630290 ?auto_630289 ) ( not ( = ?auto_630288 ?auto_630289 ) ) ( not ( = ?auto_630288 ?auto_630290 ) ) ( not ( = ?auto_630288 ?auto_630291 ) ) ( not ( = ?auto_630288 ?auto_630292 ) ) ( not ( = ?auto_630288 ?auto_630293 ) ) ( not ( = ?auto_630288 ?auto_630294 ) ) ( not ( = ?auto_630288 ?auto_630295 ) ) ( not ( = ?auto_630288 ?auto_630296 ) ) ( not ( = ?auto_630288 ?auto_630297 ) ) ( not ( = ?auto_630288 ?auto_630298 ) ) ( not ( = ?auto_630288 ?auto_630299 ) ) ( not ( = ?auto_630288 ?auto_630300 ) ) ( not ( = ?auto_630289 ?auto_630290 ) ) ( not ( = ?auto_630289 ?auto_630291 ) ) ( not ( = ?auto_630289 ?auto_630292 ) ) ( not ( = ?auto_630289 ?auto_630293 ) ) ( not ( = ?auto_630289 ?auto_630294 ) ) ( not ( = ?auto_630289 ?auto_630295 ) ) ( not ( = ?auto_630289 ?auto_630296 ) ) ( not ( = ?auto_630289 ?auto_630297 ) ) ( not ( = ?auto_630289 ?auto_630298 ) ) ( not ( = ?auto_630289 ?auto_630299 ) ) ( not ( = ?auto_630289 ?auto_630300 ) ) ( not ( = ?auto_630290 ?auto_630291 ) ) ( not ( = ?auto_630290 ?auto_630292 ) ) ( not ( = ?auto_630290 ?auto_630293 ) ) ( not ( = ?auto_630290 ?auto_630294 ) ) ( not ( = ?auto_630290 ?auto_630295 ) ) ( not ( = ?auto_630290 ?auto_630296 ) ) ( not ( = ?auto_630290 ?auto_630297 ) ) ( not ( = ?auto_630290 ?auto_630298 ) ) ( not ( = ?auto_630290 ?auto_630299 ) ) ( not ( = ?auto_630290 ?auto_630300 ) ) ( not ( = ?auto_630291 ?auto_630292 ) ) ( not ( = ?auto_630291 ?auto_630293 ) ) ( not ( = ?auto_630291 ?auto_630294 ) ) ( not ( = ?auto_630291 ?auto_630295 ) ) ( not ( = ?auto_630291 ?auto_630296 ) ) ( not ( = ?auto_630291 ?auto_630297 ) ) ( not ( = ?auto_630291 ?auto_630298 ) ) ( not ( = ?auto_630291 ?auto_630299 ) ) ( not ( = ?auto_630291 ?auto_630300 ) ) ( not ( = ?auto_630292 ?auto_630293 ) ) ( not ( = ?auto_630292 ?auto_630294 ) ) ( not ( = ?auto_630292 ?auto_630295 ) ) ( not ( = ?auto_630292 ?auto_630296 ) ) ( not ( = ?auto_630292 ?auto_630297 ) ) ( not ( = ?auto_630292 ?auto_630298 ) ) ( not ( = ?auto_630292 ?auto_630299 ) ) ( not ( = ?auto_630292 ?auto_630300 ) ) ( not ( = ?auto_630293 ?auto_630294 ) ) ( not ( = ?auto_630293 ?auto_630295 ) ) ( not ( = ?auto_630293 ?auto_630296 ) ) ( not ( = ?auto_630293 ?auto_630297 ) ) ( not ( = ?auto_630293 ?auto_630298 ) ) ( not ( = ?auto_630293 ?auto_630299 ) ) ( not ( = ?auto_630293 ?auto_630300 ) ) ( not ( = ?auto_630294 ?auto_630295 ) ) ( not ( = ?auto_630294 ?auto_630296 ) ) ( not ( = ?auto_630294 ?auto_630297 ) ) ( not ( = ?auto_630294 ?auto_630298 ) ) ( not ( = ?auto_630294 ?auto_630299 ) ) ( not ( = ?auto_630294 ?auto_630300 ) ) ( not ( = ?auto_630295 ?auto_630296 ) ) ( not ( = ?auto_630295 ?auto_630297 ) ) ( not ( = ?auto_630295 ?auto_630298 ) ) ( not ( = ?auto_630295 ?auto_630299 ) ) ( not ( = ?auto_630295 ?auto_630300 ) ) ( not ( = ?auto_630296 ?auto_630297 ) ) ( not ( = ?auto_630296 ?auto_630298 ) ) ( not ( = ?auto_630296 ?auto_630299 ) ) ( not ( = ?auto_630296 ?auto_630300 ) ) ( not ( = ?auto_630297 ?auto_630298 ) ) ( not ( = ?auto_630297 ?auto_630299 ) ) ( not ( = ?auto_630297 ?auto_630300 ) ) ( not ( = ?auto_630298 ?auto_630299 ) ) ( not ( = ?auto_630298 ?auto_630300 ) ) ( not ( = ?auto_630299 ?auto_630300 ) ) ( ON ?auto_630298 ?auto_630299 ) ( ON ?auto_630297 ?auto_630298 ) ( ON ?auto_630296 ?auto_630297 ) ( ON ?auto_630295 ?auto_630296 ) ( ON ?auto_630294 ?auto_630295 ) ( ON ?auto_630293 ?auto_630294 ) ( ON ?auto_630292 ?auto_630293 ) ( CLEAR ?auto_630290 ) ( ON ?auto_630291 ?auto_630292 ) ( CLEAR ?auto_630291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_630288 ?auto_630289 ?auto_630290 ?auto_630291 )
      ( MAKE-12PILE ?auto_630288 ?auto_630289 ?auto_630290 ?auto_630291 ?auto_630292 ?auto_630293 ?auto_630294 ?auto_630295 ?auto_630296 ?auto_630297 ?auto_630298 ?auto_630299 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630338 - BLOCK
      ?auto_630339 - BLOCK
      ?auto_630340 - BLOCK
      ?auto_630341 - BLOCK
      ?auto_630342 - BLOCK
      ?auto_630343 - BLOCK
      ?auto_630344 - BLOCK
      ?auto_630345 - BLOCK
      ?auto_630346 - BLOCK
      ?auto_630347 - BLOCK
      ?auto_630348 - BLOCK
      ?auto_630349 - BLOCK
    )
    :vars
    (
      ?auto_630350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630349 ?auto_630350 ) ( ON-TABLE ?auto_630338 ) ( ON ?auto_630339 ?auto_630338 ) ( not ( = ?auto_630338 ?auto_630339 ) ) ( not ( = ?auto_630338 ?auto_630340 ) ) ( not ( = ?auto_630338 ?auto_630341 ) ) ( not ( = ?auto_630338 ?auto_630342 ) ) ( not ( = ?auto_630338 ?auto_630343 ) ) ( not ( = ?auto_630338 ?auto_630344 ) ) ( not ( = ?auto_630338 ?auto_630345 ) ) ( not ( = ?auto_630338 ?auto_630346 ) ) ( not ( = ?auto_630338 ?auto_630347 ) ) ( not ( = ?auto_630338 ?auto_630348 ) ) ( not ( = ?auto_630338 ?auto_630349 ) ) ( not ( = ?auto_630338 ?auto_630350 ) ) ( not ( = ?auto_630339 ?auto_630340 ) ) ( not ( = ?auto_630339 ?auto_630341 ) ) ( not ( = ?auto_630339 ?auto_630342 ) ) ( not ( = ?auto_630339 ?auto_630343 ) ) ( not ( = ?auto_630339 ?auto_630344 ) ) ( not ( = ?auto_630339 ?auto_630345 ) ) ( not ( = ?auto_630339 ?auto_630346 ) ) ( not ( = ?auto_630339 ?auto_630347 ) ) ( not ( = ?auto_630339 ?auto_630348 ) ) ( not ( = ?auto_630339 ?auto_630349 ) ) ( not ( = ?auto_630339 ?auto_630350 ) ) ( not ( = ?auto_630340 ?auto_630341 ) ) ( not ( = ?auto_630340 ?auto_630342 ) ) ( not ( = ?auto_630340 ?auto_630343 ) ) ( not ( = ?auto_630340 ?auto_630344 ) ) ( not ( = ?auto_630340 ?auto_630345 ) ) ( not ( = ?auto_630340 ?auto_630346 ) ) ( not ( = ?auto_630340 ?auto_630347 ) ) ( not ( = ?auto_630340 ?auto_630348 ) ) ( not ( = ?auto_630340 ?auto_630349 ) ) ( not ( = ?auto_630340 ?auto_630350 ) ) ( not ( = ?auto_630341 ?auto_630342 ) ) ( not ( = ?auto_630341 ?auto_630343 ) ) ( not ( = ?auto_630341 ?auto_630344 ) ) ( not ( = ?auto_630341 ?auto_630345 ) ) ( not ( = ?auto_630341 ?auto_630346 ) ) ( not ( = ?auto_630341 ?auto_630347 ) ) ( not ( = ?auto_630341 ?auto_630348 ) ) ( not ( = ?auto_630341 ?auto_630349 ) ) ( not ( = ?auto_630341 ?auto_630350 ) ) ( not ( = ?auto_630342 ?auto_630343 ) ) ( not ( = ?auto_630342 ?auto_630344 ) ) ( not ( = ?auto_630342 ?auto_630345 ) ) ( not ( = ?auto_630342 ?auto_630346 ) ) ( not ( = ?auto_630342 ?auto_630347 ) ) ( not ( = ?auto_630342 ?auto_630348 ) ) ( not ( = ?auto_630342 ?auto_630349 ) ) ( not ( = ?auto_630342 ?auto_630350 ) ) ( not ( = ?auto_630343 ?auto_630344 ) ) ( not ( = ?auto_630343 ?auto_630345 ) ) ( not ( = ?auto_630343 ?auto_630346 ) ) ( not ( = ?auto_630343 ?auto_630347 ) ) ( not ( = ?auto_630343 ?auto_630348 ) ) ( not ( = ?auto_630343 ?auto_630349 ) ) ( not ( = ?auto_630343 ?auto_630350 ) ) ( not ( = ?auto_630344 ?auto_630345 ) ) ( not ( = ?auto_630344 ?auto_630346 ) ) ( not ( = ?auto_630344 ?auto_630347 ) ) ( not ( = ?auto_630344 ?auto_630348 ) ) ( not ( = ?auto_630344 ?auto_630349 ) ) ( not ( = ?auto_630344 ?auto_630350 ) ) ( not ( = ?auto_630345 ?auto_630346 ) ) ( not ( = ?auto_630345 ?auto_630347 ) ) ( not ( = ?auto_630345 ?auto_630348 ) ) ( not ( = ?auto_630345 ?auto_630349 ) ) ( not ( = ?auto_630345 ?auto_630350 ) ) ( not ( = ?auto_630346 ?auto_630347 ) ) ( not ( = ?auto_630346 ?auto_630348 ) ) ( not ( = ?auto_630346 ?auto_630349 ) ) ( not ( = ?auto_630346 ?auto_630350 ) ) ( not ( = ?auto_630347 ?auto_630348 ) ) ( not ( = ?auto_630347 ?auto_630349 ) ) ( not ( = ?auto_630347 ?auto_630350 ) ) ( not ( = ?auto_630348 ?auto_630349 ) ) ( not ( = ?auto_630348 ?auto_630350 ) ) ( not ( = ?auto_630349 ?auto_630350 ) ) ( ON ?auto_630348 ?auto_630349 ) ( ON ?auto_630347 ?auto_630348 ) ( ON ?auto_630346 ?auto_630347 ) ( ON ?auto_630345 ?auto_630346 ) ( ON ?auto_630344 ?auto_630345 ) ( ON ?auto_630343 ?auto_630344 ) ( ON ?auto_630342 ?auto_630343 ) ( ON ?auto_630341 ?auto_630342 ) ( CLEAR ?auto_630339 ) ( ON ?auto_630340 ?auto_630341 ) ( CLEAR ?auto_630340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_630338 ?auto_630339 ?auto_630340 )
      ( MAKE-12PILE ?auto_630338 ?auto_630339 ?auto_630340 ?auto_630341 ?auto_630342 ?auto_630343 ?auto_630344 ?auto_630345 ?auto_630346 ?auto_630347 ?auto_630348 ?auto_630349 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630388 - BLOCK
      ?auto_630389 - BLOCK
      ?auto_630390 - BLOCK
      ?auto_630391 - BLOCK
      ?auto_630392 - BLOCK
      ?auto_630393 - BLOCK
      ?auto_630394 - BLOCK
      ?auto_630395 - BLOCK
      ?auto_630396 - BLOCK
      ?auto_630397 - BLOCK
      ?auto_630398 - BLOCK
      ?auto_630399 - BLOCK
    )
    :vars
    (
      ?auto_630400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630399 ?auto_630400 ) ( ON-TABLE ?auto_630388 ) ( not ( = ?auto_630388 ?auto_630389 ) ) ( not ( = ?auto_630388 ?auto_630390 ) ) ( not ( = ?auto_630388 ?auto_630391 ) ) ( not ( = ?auto_630388 ?auto_630392 ) ) ( not ( = ?auto_630388 ?auto_630393 ) ) ( not ( = ?auto_630388 ?auto_630394 ) ) ( not ( = ?auto_630388 ?auto_630395 ) ) ( not ( = ?auto_630388 ?auto_630396 ) ) ( not ( = ?auto_630388 ?auto_630397 ) ) ( not ( = ?auto_630388 ?auto_630398 ) ) ( not ( = ?auto_630388 ?auto_630399 ) ) ( not ( = ?auto_630388 ?auto_630400 ) ) ( not ( = ?auto_630389 ?auto_630390 ) ) ( not ( = ?auto_630389 ?auto_630391 ) ) ( not ( = ?auto_630389 ?auto_630392 ) ) ( not ( = ?auto_630389 ?auto_630393 ) ) ( not ( = ?auto_630389 ?auto_630394 ) ) ( not ( = ?auto_630389 ?auto_630395 ) ) ( not ( = ?auto_630389 ?auto_630396 ) ) ( not ( = ?auto_630389 ?auto_630397 ) ) ( not ( = ?auto_630389 ?auto_630398 ) ) ( not ( = ?auto_630389 ?auto_630399 ) ) ( not ( = ?auto_630389 ?auto_630400 ) ) ( not ( = ?auto_630390 ?auto_630391 ) ) ( not ( = ?auto_630390 ?auto_630392 ) ) ( not ( = ?auto_630390 ?auto_630393 ) ) ( not ( = ?auto_630390 ?auto_630394 ) ) ( not ( = ?auto_630390 ?auto_630395 ) ) ( not ( = ?auto_630390 ?auto_630396 ) ) ( not ( = ?auto_630390 ?auto_630397 ) ) ( not ( = ?auto_630390 ?auto_630398 ) ) ( not ( = ?auto_630390 ?auto_630399 ) ) ( not ( = ?auto_630390 ?auto_630400 ) ) ( not ( = ?auto_630391 ?auto_630392 ) ) ( not ( = ?auto_630391 ?auto_630393 ) ) ( not ( = ?auto_630391 ?auto_630394 ) ) ( not ( = ?auto_630391 ?auto_630395 ) ) ( not ( = ?auto_630391 ?auto_630396 ) ) ( not ( = ?auto_630391 ?auto_630397 ) ) ( not ( = ?auto_630391 ?auto_630398 ) ) ( not ( = ?auto_630391 ?auto_630399 ) ) ( not ( = ?auto_630391 ?auto_630400 ) ) ( not ( = ?auto_630392 ?auto_630393 ) ) ( not ( = ?auto_630392 ?auto_630394 ) ) ( not ( = ?auto_630392 ?auto_630395 ) ) ( not ( = ?auto_630392 ?auto_630396 ) ) ( not ( = ?auto_630392 ?auto_630397 ) ) ( not ( = ?auto_630392 ?auto_630398 ) ) ( not ( = ?auto_630392 ?auto_630399 ) ) ( not ( = ?auto_630392 ?auto_630400 ) ) ( not ( = ?auto_630393 ?auto_630394 ) ) ( not ( = ?auto_630393 ?auto_630395 ) ) ( not ( = ?auto_630393 ?auto_630396 ) ) ( not ( = ?auto_630393 ?auto_630397 ) ) ( not ( = ?auto_630393 ?auto_630398 ) ) ( not ( = ?auto_630393 ?auto_630399 ) ) ( not ( = ?auto_630393 ?auto_630400 ) ) ( not ( = ?auto_630394 ?auto_630395 ) ) ( not ( = ?auto_630394 ?auto_630396 ) ) ( not ( = ?auto_630394 ?auto_630397 ) ) ( not ( = ?auto_630394 ?auto_630398 ) ) ( not ( = ?auto_630394 ?auto_630399 ) ) ( not ( = ?auto_630394 ?auto_630400 ) ) ( not ( = ?auto_630395 ?auto_630396 ) ) ( not ( = ?auto_630395 ?auto_630397 ) ) ( not ( = ?auto_630395 ?auto_630398 ) ) ( not ( = ?auto_630395 ?auto_630399 ) ) ( not ( = ?auto_630395 ?auto_630400 ) ) ( not ( = ?auto_630396 ?auto_630397 ) ) ( not ( = ?auto_630396 ?auto_630398 ) ) ( not ( = ?auto_630396 ?auto_630399 ) ) ( not ( = ?auto_630396 ?auto_630400 ) ) ( not ( = ?auto_630397 ?auto_630398 ) ) ( not ( = ?auto_630397 ?auto_630399 ) ) ( not ( = ?auto_630397 ?auto_630400 ) ) ( not ( = ?auto_630398 ?auto_630399 ) ) ( not ( = ?auto_630398 ?auto_630400 ) ) ( not ( = ?auto_630399 ?auto_630400 ) ) ( ON ?auto_630398 ?auto_630399 ) ( ON ?auto_630397 ?auto_630398 ) ( ON ?auto_630396 ?auto_630397 ) ( ON ?auto_630395 ?auto_630396 ) ( ON ?auto_630394 ?auto_630395 ) ( ON ?auto_630393 ?auto_630394 ) ( ON ?auto_630392 ?auto_630393 ) ( ON ?auto_630391 ?auto_630392 ) ( ON ?auto_630390 ?auto_630391 ) ( CLEAR ?auto_630388 ) ( ON ?auto_630389 ?auto_630390 ) ( CLEAR ?auto_630389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_630388 ?auto_630389 )
      ( MAKE-12PILE ?auto_630388 ?auto_630389 ?auto_630390 ?auto_630391 ?auto_630392 ?auto_630393 ?auto_630394 ?auto_630395 ?auto_630396 ?auto_630397 ?auto_630398 ?auto_630399 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_630438 - BLOCK
      ?auto_630439 - BLOCK
      ?auto_630440 - BLOCK
      ?auto_630441 - BLOCK
      ?auto_630442 - BLOCK
      ?auto_630443 - BLOCK
      ?auto_630444 - BLOCK
      ?auto_630445 - BLOCK
      ?auto_630446 - BLOCK
      ?auto_630447 - BLOCK
      ?auto_630448 - BLOCK
      ?auto_630449 - BLOCK
    )
    :vars
    (
      ?auto_630450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630449 ?auto_630450 ) ( not ( = ?auto_630438 ?auto_630439 ) ) ( not ( = ?auto_630438 ?auto_630440 ) ) ( not ( = ?auto_630438 ?auto_630441 ) ) ( not ( = ?auto_630438 ?auto_630442 ) ) ( not ( = ?auto_630438 ?auto_630443 ) ) ( not ( = ?auto_630438 ?auto_630444 ) ) ( not ( = ?auto_630438 ?auto_630445 ) ) ( not ( = ?auto_630438 ?auto_630446 ) ) ( not ( = ?auto_630438 ?auto_630447 ) ) ( not ( = ?auto_630438 ?auto_630448 ) ) ( not ( = ?auto_630438 ?auto_630449 ) ) ( not ( = ?auto_630438 ?auto_630450 ) ) ( not ( = ?auto_630439 ?auto_630440 ) ) ( not ( = ?auto_630439 ?auto_630441 ) ) ( not ( = ?auto_630439 ?auto_630442 ) ) ( not ( = ?auto_630439 ?auto_630443 ) ) ( not ( = ?auto_630439 ?auto_630444 ) ) ( not ( = ?auto_630439 ?auto_630445 ) ) ( not ( = ?auto_630439 ?auto_630446 ) ) ( not ( = ?auto_630439 ?auto_630447 ) ) ( not ( = ?auto_630439 ?auto_630448 ) ) ( not ( = ?auto_630439 ?auto_630449 ) ) ( not ( = ?auto_630439 ?auto_630450 ) ) ( not ( = ?auto_630440 ?auto_630441 ) ) ( not ( = ?auto_630440 ?auto_630442 ) ) ( not ( = ?auto_630440 ?auto_630443 ) ) ( not ( = ?auto_630440 ?auto_630444 ) ) ( not ( = ?auto_630440 ?auto_630445 ) ) ( not ( = ?auto_630440 ?auto_630446 ) ) ( not ( = ?auto_630440 ?auto_630447 ) ) ( not ( = ?auto_630440 ?auto_630448 ) ) ( not ( = ?auto_630440 ?auto_630449 ) ) ( not ( = ?auto_630440 ?auto_630450 ) ) ( not ( = ?auto_630441 ?auto_630442 ) ) ( not ( = ?auto_630441 ?auto_630443 ) ) ( not ( = ?auto_630441 ?auto_630444 ) ) ( not ( = ?auto_630441 ?auto_630445 ) ) ( not ( = ?auto_630441 ?auto_630446 ) ) ( not ( = ?auto_630441 ?auto_630447 ) ) ( not ( = ?auto_630441 ?auto_630448 ) ) ( not ( = ?auto_630441 ?auto_630449 ) ) ( not ( = ?auto_630441 ?auto_630450 ) ) ( not ( = ?auto_630442 ?auto_630443 ) ) ( not ( = ?auto_630442 ?auto_630444 ) ) ( not ( = ?auto_630442 ?auto_630445 ) ) ( not ( = ?auto_630442 ?auto_630446 ) ) ( not ( = ?auto_630442 ?auto_630447 ) ) ( not ( = ?auto_630442 ?auto_630448 ) ) ( not ( = ?auto_630442 ?auto_630449 ) ) ( not ( = ?auto_630442 ?auto_630450 ) ) ( not ( = ?auto_630443 ?auto_630444 ) ) ( not ( = ?auto_630443 ?auto_630445 ) ) ( not ( = ?auto_630443 ?auto_630446 ) ) ( not ( = ?auto_630443 ?auto_630447 ) ) ( not ( = ?auto_630443 ?auto_630448 ) ) ( not ( = ?auto_630443 ?auto_630449 ) ) ( not ( = ?auto_630443 ?auto_630450 ) ) ( not ( = ?auto_630444 ?auto_630445 ) ) ( not ( = ?auto_630444 ?auto_630446 ) ) ( not ( = ?auto_630444 ?auto_630447 ) ) ( not ( = ?auto_630444 ?auto_630448 ) ) ( not ( = ?auto_630444 ?auto_630449 ) ) ( not ( = ?auto_630444 ?auto_630450 ) ) ( not ( = ?auto_630445 ?auto_630446 ) ) ( not ( = ?auto_630445 ?auto_630447 ) ) ( not ( = ?auto_630445 ?auto_630448 ) ) ( not ( = ?auto_630445 ?auto_630449 ) ) ( not ( = ?auto_630445 ?auto_630450 ) ) ( not ( = ?auto_630446 ?auto_630447 ) ) ( not ( = ?auto_630446 ?auto_630448 ) ) ( not ( = ?auto_630446 ?auto_630449 ) ) ( not ( = ?auto_630446 ?auto_630450 ) ) ( not ( = ?auto_630447 ?auto_630448 ) ) ( not ( = ?auto_630447 ?auto_630449 ) ) ( not ( = ?auto_630447 ?auto_630450 ) ) ( not ( = ?auto_630448 ?auto_630449 ) ) ( not ( = ?auto_630448 ?auto_630450 ) ) ( not ( = ?auto_630449 ?auto_630450 ) ) ( ON ?auto_630448 ?auto_630449 ) ( ON ?auto_630447 ?auto_630448 ) ( ON ?auto_630446 ?auto_630447 ) ( ON ?auto_630445 ?auto_630446 ) ( ON ?auto_630444 ?auto_630445 ) ( ON ?auto_630443 ?auto_630444 ) ( ON ?auto_630442 ?auto_630443 ) ( ON ?auto_630441 ?auto_630442 ) ( ON ?auto_630440 ?auto_630441 ) ( ON ?auto_630439 ?auto_630440 ) ( ON ?auto_630438 ?auto_630439 ) ( CLEAR ?auto_630438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_630438 )
      ( MAKE-12PILE ?auto_630438 ?auto_630439 ?auto_630440 ?auto_630441 ?auto_630442 ?auto_630443 ?auto_630444 ?auto_630445 ?auto_630446 ?auto_630447 ?auto_630448 ?auto_630449 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630489 - BLOCK
      ?auto_630490 - BLOCK
      ?auto_630491 - BLOCK
      ?auto_630492 - BLOCK
      ?auto_630493 - BLOCK
      ?auto_630494 - BLOCK
      ?auto_630495 - BLOCK
      ?auto_630496 - BLOCK
      ?auto_630497 - BLOCK
      ?auto_630498 - BLOCK
      ?auto_630499 - BLOCK
      ?auto_630500 - BLOCK
      ?auto_630501 - BLOCK
    )
    :vars
    (
      ?auto_630502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_630500 ) ( ON ?auto_630501 ?auto_630502 ) ( CLEAR ?auto_630501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_630489 ) ( ON ?auto_630490 ?auto_630489 ) ( ON ?auto_630491 ?auto_630490 ) ( ON ?auto_630492 ?auto_630491 ) ( ON ?auto_630493 ?auto_630492 ) ( ON ?auto_630494 ?auto_630493 ) ( ON ?auto_630495 ?auto_630494 ) ( ON ?auto_630496 ?auto_630495 ) ( ON ?auto_630497 ?auto_630496 ) ( ON ?auto_630498 ?auto_630497 ) ( ON ?auto_630499 ?auto_630498 ) ( ON ?auto_630500 ?auto_630499 ) ( not ( = ?auto_630489 ?auto_630490 ) ) ( not ( = ?auto_630489 ?auto_630491 ) ) ( not ( = ?auto_630489 ?auto_630492 ) ) ( not ( = ?auto_630489 ?auto_630493 ) ) ( not ( = ?auto_630489 ?auto_630494 ) ) ( not ( = ?auto_630489 ?auto_630495 ) ) ( not ( = ?auto_630489 ?auto_630496 ) ) ( not ( = ?auto_630489 ?auto_630497 ) ) ( not ( = ?auto_630489 ?auto_630498 ) ) ( not ( = ?auto_630489 ?auto_630499 ) ) ( not ( = ?auto_630489 ?auto_630500 ) ) ( not ( = ?auto_630489 ?auto_630501 ) ) ( not ( = ?auto_630489 ?auto_630502 ) ) ( not ( = ?auto_630490 ?auto_630491 ) ) ( not ( = ?auto_630490 ?auto_630492 ) ) ( not ( = ?auto_630490 ?auto_630493 ) ) ( not ( = ?auto_630490 ?auto_630494 ) ) ( not ( = ?auto_630490 ?auto_630495 ) ) ( not ( = ?auto_630490 ?auto_630496 ) ) ( not ( = ?auto_630490 ?auto_630497 ) ) ( not ( = ?auto_630490 ?auto_630498 ) ) ( not ( = ?auto_630490 ?auto_630499 ) ) ( not ( = ?auto_630490 ?auto_630500 ) ) ( not ( = ?auto_630490 ?auto_630501 ) ) ( not ( = ?auto_630490 ?auto_630502 ) ) ( not ( = ?auto_630491 ?auto_630492 ) ) ( not ( = ?auto_630491 ?auto_630493 ) ) ( not ( = ?auto_630491 ?auto_630494 ) ) ( not ( = ?auto_630491 ?auto_630495 ) ) ( not ( = ?auto_630491 ?auto_630496 ) ) ( not ( = ?auto_630491 ?auto_630497 ) ) ( not ( = ?auto_630491 ?auto_630498 ) ) ( not ( = ?auto_630491 ?auto_630499 ) ) ( not ( = ?auto_630491 ?auto_630500 ) ) ( not ( = ?auto_630491 ?auto_630501 ) ) ( not ( = ?auto_630491 ?auto_630502 ) ) ( not ( = ?auto_630492 ?auto_630493 ) ) ( not ( = ?auto_630492 ?auto_630494 ) ) ( not ( = ?auto_630492 ?auto_630495 ) ) ( not ( = ?auto_630492 ?auto_630496 ) ) ( not ( = ?auto_630492 ?auto_630497 ) ) ( not ( = ?auto_630492 ?auto_630498 ) ) ( not ( = ?auto_630492 ?auto_630499 ) ) ( not ( = ?auto_630492 ?auto_630500 ) ) ( not ( = ?auto_630492 ?auto_630501 ) ) ( not ( = ?auto_630492 ?auto_630502 ) ) ( not ( = ?auto_630493 ?auto_630494 ) ) ( not ( = ?auto_630493 ?auto_630495 ) ) ( not ( = ?auto_630493 ?auto_630496 ) ) ( not ( = ?auto_630493 ?auto_630497 ) ) ( not ( = ?auto_630493 ?auto_630498 ) ) ( not ( = ?auto_630493 ?auto_630499 ) ) ( not ( = ?auto_630493 ?auto_630500 ) ) ( not ( = ?auto_630493 ?auto_630501 ) ) ( not ( = ?auto_630493 ?auto_630502 ) ) ( not ( = ?auto_630494 ?auto_630495 ) ) ( not ( = ?auto_630494 ?auto_630496 ) ) ( not ( = ?auto_630494 ?auto_630497 ) ) ( not ( = ?auto_630494 ?auto_630498 ) ) ( not ( = ?auto_630494 ?auto_630499 ) ) ( not ( = ?auto_630494 ?auto_630500 ) ) ( not ( = ?auto_630494 ?auto_630501 ) ) ( not ( = ?auto_630494 ?auto_630502 ) ) ( not ( = ?auto_630495 ?auto_630496 ) ) ( not ( = ?auto_630495 ?auto_630497 ) ) ( not ( = ?auto_630495 ?auto_630498 ) ) ( not ( = ?auto_630495 ?auto_630499 ) ) ( not ( = ?auto_630495 ?auto_630500 ) ) ( not ( = ?auto_630495 ?auto_630501 ) ) ( not ( = ?auto_630495 ?auto_630502 ) ) ( not ( = ?auto_630496 ?auto_630497 ) ) ( not ( = ?auto_630496 ?auto_630498 ) ) ( not ( = ?auto_630496 ?auto_630499 ) ) ( not ( = ?auto_630496 ?auto_630500 ) ) ( not ( = ?auto_630496 ?auto_630501 ) ) ( not ( = ?auto_630496 ?auto_630502 ) ) ( not ( = ?auto_630497 ?auto_630498 ) ) ( not ( = ?auto_630497 ?auto_630499 ) ) ( not ( = ?auto_630497 ?auto_630500 ) ) ( not ( = ?auto_630497 ?auto_630501 ) ) ( not ( = ?auto_630497 ?auto_630502 ) ) ( not ( = ?auto_630498 ?auto_630499 ) ) ( not ( = ?auto_630498 ?auto_630500 ) ) ( not ( = ?auto_630498 ?auto_630501 ) ) ( not ( = ?auto_630498 ?auto_630502 ) ) ( not ( = ?auto_630499 ?auto_630500 ) ) ( not ( = ?auto_630499 ?auto_630501 ) ) ( not ( = ?auto_630499 ?auto_630502 ) ) ( not ( = ?auto_630500 ?auto_630501 ) ) ( not ( = ?auto_630500 ?auto_630502 ) ) ( not ( = ?auto_630501 ?auto_630502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_630501 ?auto_630502 )
      ( !STACK ?auto_630501 ?auto_630500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630543 - BLOCK
      ?auto_630544 - BLOCK
      ?auto_630545 - BLOCK
      ?auto_630546 - BLOCK
      ?auto_630547 - BLOCK
      ?auto_630548 - BLOCK
      ?auto_630549 - BLOCK
      ?auto_630550 - BLOCK
      ?auto_630551 - BLOCK
      ?auto_630552 - BLOCK
      ?auto_630553 - BLOCK
      ?auto_630554 - BLOCK
      ?auto_630555 - BLOCK
    )
    :vars
    (
      ?auto_630556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630555 ?auto_630556 ) ( ON-TABLE ?auto_630543 ) ( ON ?auto_630544 ?auto_630543 ) ( ON ?auto_630545 ?auto_630544 ) ( ON ?auto_630546 ?auto_630545 ) ( ON ?auto_630547 ?auto_630546 ) ( ON ?auto_630548 ?auto_630547 ) ( ON ?auto_630549 ?auto_630548 ) ( ON ?auto_630550 ?auto_630549 ) ( ON ?auto_630551 ?auto_630550 ) ( ON ?auto_630552 ?auto_630551 ) ( ON ?auto_630553 ?auto_630552 ) ( not ( = ?auto_630543 ?auto_630544 ) ) ( not ( = ?auto_630543 ?auto_630545 ) ) ( not ( = ?auto_630543 ?auto_630546 ) ) ( not ( = ?auto_630543 ?auto_630547 ) ) ( not ( = ?auto_630543 ?auto_630548 ) ) ( not ( = ?auto_630543 ?auto_630549 ) ) ( not ( = ?auto_630543 ?auto_630550 ) ) ( not ( = ?auto_630543 ?auto_630551 ) ) ( not ( = ?auto_630543 ?auto_630552 ) ) ( not ( = ?auto_630543 ?auto_630553 ) ) ( not ( = ?auto_630543 ?auto_630554 ) ) ( not ( = ?auto_630543 ?auto_630555 ) ) ( not ( = ?auto_630543 ?auto_630556 ) ) ( not ( = ?auto_630544 ?auto_630545 ) ) ( not ( = ?auto_630544 ?auto_630546 ) ) ( not ( = ?auto_630544 ?auto_630547 ) ) ( not ( = ?auto_630544 ?auto_630548 ) ) ( not ( = ?auto_630544 ?auto_630549 ) ) ( not ( = ?auto_630544 ?auto_630550 ) ) ( not ( = ?auto_630544 ?auto_630551 ) ) ( not ( = ?auto_630544 ?auto_630552 ) ) ( not ( = ?auto_630544 ?auto_630553 ) ) ( not ( = ?auto_630544 ?auto_630554 ) ) ( not ( = ?auto_630544 ?auto_630555 ) ) ( not ( = ?auto_630544 ?auto_630556 ) ) ( not ( = ?auto_630545 ?auto_630546 ) ) ( not ( = ?auto_630545 ?auto_630547 ) ) ( not ( = ?auto_630545 ?auto_630548 ) ) ( not ( = ?auto_630545 ?auto_630549 ) ) ( not ( = ?auto_630545 ?auto_630550 ) ) ( not ( = ?auto_630545 ?auto_630551 ) ) ( not ( = ?auto_630545 ?auto_630552 ) ) ( not ( = ?auto_630545 ?auto_630553 ) ) ( not ( = ?auto_630545 ?auto_630554 ) ) ( not ( = ?auto_630545 ?auto_630555 ) ) ( not ( = ?auto_630545 ?auto_630556 ) ) ( not ( = ?auto_630546 ?auto_630547 ) ) ( not ( = ?auto_630546 ?auto_630548 ) ) ( not ( = ?auto_630546 ?auto_630549 ) ) ( not ( = ?auto_630546 ?auto_630550 ) ) ( not ( = ?auto_630546 ?auto_630551 ) ) ( not ( = ?auto_630546 ?auto_630552 ) ) ( not ( = ?auto_630546 ?auto_630553 ) ) ( not ( = ?auto_630546 ?auto_630554 ) ) ( not ( = ?auto_630546 ?auto_630555 ) ) ( not ( = ?auto_630546 ?auto_630556 ) ) ( not ( = ?auto_630547 ?auto_630548 ) ) ( not ( = ?auto_630547 ?auto_630549 ) ) ( not ( = ?auto_630547 ?auto_630550 ) ) ( not ( = ?auto_630547 ?auto_630551 ) ) ( not ( = ?auto_630547 ?auto_630552 ) ) ( not ( = ?auto_630547 ?auto_630553 ) ) ( not ( = ?auto_630547 ?auto_630554 ) ) ( not ( = ?auto_630547 ?auto_630555 ) ) ( not ( = ?auto_630547 ?auto_630556 ) ) ( not ( = ?auto_630548 ?auto_630549 ) ) ( not ( = ?auto_630548 ?auto_630550 ) ) ( not ( = ?auto_630548 ?auto_630551 ) ) ( not ( = ?auto_630548 ?auto_630552 ) ) ( not ( = ?auto_630548 ?auto_630553 ) ) ( not ( = ?auto_630548 ?auto_630554 ) ) ( not ( = ?auto_630548 ?auto_630555 ) ) ( not ( = ?auto_630548 ?auto_630556 ) ) ( not ( = ?auto_630549 ?auto_630550 ) ) ( not ( = ?auto_630549 ?auto_630551 ) ) ( not ( = ?auto_630549 ?auto_630552 ) ) ( not ( = ?auto_630549 ?auto_630553 ) ) ( not ( = ?auto_630549 ?auto_630554 ) ) ( not ( = ?auto_630549 ?auto_630555 ) ) ( not ( = ?auto_630549 ?auto_630556 ) ) ( not ( = ?auto_630550 ?auto_630551 ) ) ( not ( = ?auto_630550 ?auto_630552 ) ) ( not ( = ?auto_630550 ?auto_630553 ) ) ( not ( = ?auto_630550 ?auto_630554 ) ) ( not ( = ?auto_630550 ?auto_630555 ) ) ( not ( = ?auto_630550 ?auto_630556 ) ) ( not ( = ?auto_630551 ?auto_630552 ) ) ( not ( = ?auto_630551 ?auto_630553 ) ) ( not ( = ?auto_630551 ?auto_630554 ) ) ( not ( = ?auto_630551 ?auto_630555 ) ) ( not ( = ?auto_630551 ?auto_630556 ) ) ( not ( = ?auto_630552 ?auto_630553 ) ) ( not ( = ?auto_630552 ?auto_630554 ) ) ( not ( = ?auto_630552 ?auto_630555 ) ) ( not ( = ?auto_630552 ?auto_630556 ) ) ( not ( = ?auto_630553 ?auto_630554 ) ) ( not ( = ?auto_630553 ?auto_630555 ) ) ( not ( = ?auto_630553 ?auto_630556 ) ) ( not ( = ?auto_630554 ?auto_630555 ) ) ( not ( = ?auto_630554 ?auto_630556 ) ) ( not ( = ?auto_630555 ?auto_630556 ) ) ( CLEAR ?auto_630553 ) ( ON ?auto_630554 ?auto_630555 ) ( CLEAR ?auto_630554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_630543 ?auto_630544 ?auto_630545 ?auto_630546 ?auto_630547 ?auto_630548 ?auto_630549 ?auto_630550 ?auto_630551 ?auto_630552 ?auto_630553 ?auto_630554 )
      ( MAKE-13PILE ?auto_630543 ?auto_630544 ?auto_630545 ?auto_630546 ?auto_630547 ?auto_630548 ?auto_630549 ?auto_630550 ?auto_630551 ?auto_630552 ?auto_630553 ?auto_630554 ?auto_630555 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630597 - BLOCK
      ?auto_630598 - BLOCK
      ?auto_630599 - BLOCK
      ?auto_630600 - BLOCK
      ?auto_630601 - BLOCK
      ?auto_630602 - BLOCK
      ?auto_630603 - BLOCK
      ?auto_630604 - BLOCK
      ?auto_630605 - BLOCK
      ?auto_630606 - BLOCK
      ?auto_630607 - BLOCK
      ?auto_630608 - BLOCK
      ?auto_630609 - BLOCK
    )
    :vars
    (
      ?auto_630610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630609 ?auto_630610 ) ( ON-TABLE ?auto_630597 ) ( ON ?auto_630598 ?auto_630597 ) ( ON ?auto_630599 ?auto_630598 ) ( ON ?auto_630600 ?auto_630599 ) ( ON ?auto_630601 ?auto_630600 ) ( ON ?auto_630602 ?auto_630601 ) ( ON ?auto_630603 ?auto_630602 ) ( ON ?auto_630604 ?auto_630603 ) ( ON ?auto_630605 ?auto_630604 ) ( ON ?auto_630606 ?auto_630605 ) ( not ( = ?auto_630597 ?auto_630598 ) ) ( not ( = ?auto_630597 ?auto_630599 ) ) ( not ( = ?auto_630597 ?auto_630600 ) ) ( not ( = ?auto_630597 ?auto_630601 ) ) ( not ( = ?auto_630597 ?auto_630602 ) ) ( not ( = ?auto_630597 ?auto_630603 ) ) ( not ( = ?auto_630597 ?auto_630604 ) ) ( not ( = ?auto_630597 ?auto_630605 ) ) ( not ( = ?auto_630597 ?auto_630606 ) ) ( not ( = ?auto_630597 ?auto_630607 ) ) ( not ( = ?auto_630597 ?auto_630608 ) ) ( not ( = ?auto_630597 ?auto_630609 ) ) ( not ( = ?auto_630597 ?auto_630610 ) ) ( not ( = ?auto_630598 ?auto_630599 ) ) ( not ( = ?auto_630598 ?auto_630600 ) ) ( not ( = ?auto_630598 ?auto_630601 ) ) ( not ( = ?auto_630598 ?auto_630602 ) ) ( not ( = ?auto_630598 ?auto_630603 ) ) ( not ( = ?auto_630598 ?auto_630604 ) ) ( not ( = ?auto_630598 ?auto_630605 ) ) ( not ( = ?auto_630598 ?auto_630606 ) ) ( not ( = ?auto_630598 ?auto_630607 ) ) ( not ( = ?auto_630598 ?auto_630608 ) ) ( not ( = ?auto_630598 ?auto_630609 ) ) ( not ( = ?auto_630598 ?auto_630610 ) ) ( not ( = ?auto_630599 ?auto_630600 ) ) ( not ( = ?auto_630599 ?auto_630601 ) ) ( not ( = ?auto_630599 ?auto_630602 ) ) ( not ( = ?auto_630599 ?auto_630603 ) ) ( not ( = ?auto_630599 ?auto_630604 ) ) ( not ( = ?auto_630599 ?auto_630605 ) ) ( not ( = ?auto_630599 ?auto_630606 ) ) ( not ( = ?auto_630599 ?auto_630607 ) ) ( not ( = ?auto_630599 ?auto_630608 ) ) ( not ( = ?auto_630599 ?auto_630609 ) ) ( not ( = ?auto_630599 ?auto_630610 ) ) ( not ( = ?auto_630600 ?auto_630601 ) ) ( not ( = ?auto_630600 ?auto_630602 ) ) ( not ( = ?auto_630600 ?auto_630603 ) ) ( not ( = ?auto_630600 ?auto_630604 ) ) ( not ( = ?auto_630600 ?auto_630605 ) ) ( not ( = ?auto_630600 ?auto_630606 ) ) ( not ( = ?auto_630600 ?auto_630607 ) ) ( not ( = ?auto_630600 ?auto_630608 ) ) ( not ( = ?auto_630600 ?auto_630609 ) ) ( not ( = ?auto_630600 ?auto_630610 ) ) ( not ( = ?auto_630601 ?auto_630602 ) ) ( not ( = ?auto_630601 ?auto_630603 ) ) ( not ( = ?auto_630601 ?auto_630604 ) ) ( not ( = ?auto_630601 ?auto_630605 ) ) ( not ( = ?auto_630601 ?auto_630606 ) ) ( not ( = ?auto_630601 ?auto_630607 ) ) ( not ( = ?auto_630601 ?auto_630608 ) ) ( not ( = ?auto_630601 ?auto_630609 ) ) ( not ( = ?auto_630601 ?auto_630610 ) ) ( not ( = ?auto_630602 ?auto_630603 ) ) ( not ( = ?auto_630602 ?auto_630604 ) ) ( not ( = ?auto_630602 ?auto_630605 ) ) ( not ( = ?auto_630602 ?auto_630606 ) ) ( not ( = ?auto_630602 ?auto_630607 ) ) ( not ( = ?auto_630602 ?auto_630608 ) ) ( not ( = ?auto_630602 ?auto_630609 ) ) ( not ( = ?auto_630602 ?auto_630610 ) ) ( not ( = ?auto_630603 ?auto_630604 ) ) ( not ( = ?auto_630603 ?auto_630605 ) ) ( not ( = ?auto_630603 ?auto_630606 ) ) ( not ( = ?auto_630603 ?auto_630607 ) ) ( not ( = ?auto_630603 ?auto_630608 ) ) ( not ( = ?auto_630603 ?auto_630609 ) ) ( not ( = ?auto_630603 ?auto_630610 ) ) ( not ( = ?auto_630604 ?auto_630605 ) ) ( not ( = ?auto_630604 ?auto_630606 ) ) ( not ( = ?auto_630604 ?auto_630607 ) ) ( not ( = ?auto_630604 ?auto_630608 ) ) ( not ( = ?auto_630604 ?auto_630609 ) ) ( not ( = ?auto_630604 ?auto_630610 ) ) ( not ( = ?auto_630605 ?auto_630606 ) ) ( not ( = ?auto_630605 ?auto_630607 ) ) ( not ( = ?auto_630605 ?auto_630608 ) ) ( not ( = ?auto_630605 ?auto_630609 ) ) ( not ( = ?auto_630605 ?auto_630610 ) ) ( not ( = ?auto_630606 ?auto_630607 ) ) ( not ( = ?auto_630606 ?auto_630608 ) ) ( not ( = ?auto_630606 ?auto_630609 ) ) ( not ( = ?auto_630606 ?auto_630610 ) ) ( not ( = ?auto_630607 ?auto_630608 ) ) ( not ( = ?auto_630607 ?auto_630609 ) ) ( not ( = ?auto_630607 ?auto_630610 ) ) ( not ( = ?auto_630608 ?auto_630609 ) ) ( not ( = ?auto_630608 ?auto_630610 ) ) ( not ( = ?auto_630609 ?auto_630610 ) ) ( ON ?auto_630608 ?auto_630609 ) ( CLEAR ?auto_630606 ) ( ON ?auto_630607 ?auto_630608 ) ( CLEAR ?auto_630607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_630597 ?auto_630598 ?auto_630599 ?auto_630600 ?auto_630601 ?auto_630602 ?auto_630603 ?auto_630604 ?auto_630605 ?auto_630606 ?auto_630607 )
      ( MAKE-13PILE ?auto_630597 ?auto_630598 ?auto_630599 ?auto_630600 ?auto_630601 ?auto_630602 ?auto_630603 ?auto_630604 ?auto_630605 ?auto_630606 ?auto_630607 ?auto_630608 ?auto_630609 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630651 - BLOCK
      ?auto_630652 - BLOCK
      ?auto_630653 - BLOCK
      ?auto_630654 - BLOCK
      ?auto_630655 - BLOCK
      ?auto_630656 - BLOCK
      ?auto_630657 - BLOCK
      ?auto_630658 - BLOCK
      ?auto_630659 - BLOCK
      ?auto_630660 - BLOCK
      ?auto_630661 - BLOCK
      ?auto_630662 - BLOCK
      ?auto_630663 - BLOCK
    )
    :vars
    (
      ?auto_630664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630663 ?auto_630664 ) ( ON-TABLE ?auto_630651 ) ( ON ?auto_630652 ?auto_630651 ) ( ON ?auto_630653 ?auto_630652 ) ( ON ?auto_630654 ?auto_630653 ) ( ON ?auto_630655 ?auto_630654 ) ( ON ?auto_630656 ?auto_630655 ) ( ON ?auto_630657 ?auto_630656 ) ( ON ?auto_630658 ?auto_630657 ) ( ON ?auto_630659 ?auto_630658 ) ( not ( = ?auto_630651 ?auto_630652 ) ) ( not ( = ?auto_630651 ?auto_630653 ) ) ( not ( = ?auto_630651 ?auto_630654 ) ) ( not ( = ?auto_630651 ?auto_630655 ) ) ( not ( = ?auto_630651 ?auto_630656 ) ) ( not ( = ?auto_630651 ?auto_630657 ) ) ( not ( = ?auto_630651 ?auto_630658 ) ) ( not ( = ?auto_630651 ?auto_630659 ) ) ( not ( = ?auto_630651 ?auto_630660 ) ) ( not ( = ?auto_630651 ?auto_630661 ) ) ( not ( = ?auto_630651 ?auto_630662 ) ) ( not ( = ?auto_630651 ?auto_630663 ) ) ( not ( = ?auto_630651 ?auto_630664 ) ) ( not ( = ?auto_630652 ?auto_630653 ) ) ( not ( = ?auto_630652 ?auto_630654 ) ) ( not ( = ?auto_630652 ?auto_630655 ) ) ( not ( = ?auto_630652 ?auto_630656 ) ) ( not ( = ?auto_630652 ?auto_630657 ) ) ( not ( = ?auto_630652 ?auto_630658 ) ) ( not ( = ?auto_630652 ?auto_630659 ) ) ( not ( = ?auto_630652 ?auto_630660 ) ) ( not ( = ?auto_630652 ?auto_630661 ) ) ( not ( = ?auto_630652 ?auto_630662 ) ) ( not ( = ?auto_630652 ?auto_630663 ) ) ( not ( = ?auto_630652 ?auto_630664 ) ) ( not ( = ?auto_630653 ?auto_630654 ) ) ( not ( = ?auto_630653 ?auto_630655 ) ) ( not ( = ?auto_630653 ?auto_630656 ) ) ( not ( = ?auto_630653 ?auto_630657 ) ) ( not ( = ?auto_630653 ?auto_630658 ) ) ( not ( = ?auto_630653 ?auto_630659 ) ) ( not ( = ?auto_630653 ?auto_630660 ) ) ( not ( = ?auto_630653 ?auto_630661 ) ) ( not ( = ?auto_630653 ?auto_630662 ) ) ( not ( = ?auto_630653 ?auto_630663 ) ) ( not ( = ?auto_630653 ?auto_630664 ) ) ( not ( = ?auto_630654 ?auto_630655 ) ) ( not ( = ?auto_630654 ?auto_630656 ) ) ( not ( = ?auto_630654 ?auto_630657 ) ) ( not ( = ?auto_630654 ?auto_630658 ) ) ( not ( = ?auto_630654 ?auto_630659 ) ) ( not ( = ?auto_630654 ?auto_630660 ) ) ( not ( = ?auto_630654 ?auto_630661 ) ) ( not ( = ?auto_630654 ?auto_630662 ) ) ( not ( = ?auto_630654 ?auto_630663 ) ) ( not ( = ?auto_630654 ?auto_630664 ) ) ( not ( = ?auto_630655 ?auto_630656 ) ) ( not ( = ?auto_630655 ?auto_630657 ) ) ( not ( = ?auto_630655 ?auto_630658 ) ) ( not ( = ?auto_630655 ?auto_630659 ) ) ( not ( = ?auto_630655 ?auto_630660 ) ) ( not ( = ?auto_630655 ?auto_630661 ) ) ( not ( = ?auto_630655 ?auto_630662 ) ) ( not ( = ?auto_630655 ?auto_630663 ) ) ( not ( = ?auto_630655 ?auto_630664 ) ) ( not ( = ?auto_630656 ?auto_630657 ) ) ( not ( = ?auto_630656 ?auto_630658 ) ) ( not ( = ?auto_630656 ?auto_630659 ) ) ( not ( = ?auto_630656 ?auto_630660 ) ) ( not ( = ?auto_630656 ?auto_630661 ) ) ( not ( = ?auto_630656 ?auto_630662 ) ) ( not ( = ?auto_630656 ?auto_630663 ) ) ( not ( = ?auto_630656 ?auto_630664 ) ) ( not ( = ?auto_630657 ?auto_630658 ) ) ( not ( = ?auto_630657 ?auto_630659 ) ) ( not ( = ?auto_630657 ?auto_630660 ) ) ( not ( = ?auto_630657 ?auto_630661 ) ) ( not ( = ?auto_630657 ?auto_630662 ) ) ( not ( = ?auto_630657 ?auto_630663 ) ) ( not ( = ?auto_630657 ?auto_630664 ) ) ( not ( = ?auto_630658 ?auto_630659 ) ) ( not ( = ?auto_630658 ?auto_630660 ) ) ( not ( = ?auto_630658 ?auto_630661 ) ) ( not ( = ?auto_630658 ?auto_630662 ) ) ( not ( = ?auto_630658 ?auto_630663 ) ) ( not ( = ?auto_630658 ?auto_630664 ) ) ( not ( = ?auto_630659 ?auto_630660 ) ) ( not ( = ?auto_630659 ?auto_630661 ) ) ( not ( = ?auto_630659 ?auto_630662 ) ) ( not ( = ?auto_630659 ?auto_630663 ) ) ( not ( = ?auto_630659 ?auto_630664 ) ) ( not ( = ?auto_630660 ?auto_630661 ) ) ( not ( = ?auto_630660 ?auto_630662 ) ) ( not ( = ?auto_630660 ?auto_630663 ) ) ( not ( = ?auto_630660 ?auto_630664 ) ) ( not ( = ?auto_630661 ?auto_630662 ) ) ( not ( = ?auto_630661 ?auto_630663 ) ) ( not ( = ?auto_630661 ?auto_630664 ) ) ( not ( = ?auto_630662 ?auto_630663 ) ) ( not ( = ?auto_630662 ?auto_630664 ) ) ( not ( = ?auto_630663 ?auto_630664 ) ) ( ON ?auto_630662 ?auto_630663 ) ( ON ?auto_630661 ?auto_630662 ) ( CLEAR ?auto_630659 ) ( ON ?auto_630660 ?auto_630661 ) ( CLEAR ?auto_630660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_630651 ?auto_630652 ?auto_630653 ?auto_630654 ?auto_630655 ?auto_630656 ?auto_630657 ?auto_630658 ?auto_630659 ?auto_630660 )
      ( MAKE-13PILE ?auto_630651 ?auto_630652 ?auto_630653 ?auto_630654 ?auto_630655 ?auto_630656 ?auto_630657 ?auto_630658 ?auto_630659 ?auto_630660 ?auto_630661 ?auto_630662 ?auto_630663 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630705 - BLOCK
      ?auto_630706 - BLOCK
      ?auto_630707 - BLOCK
      ?auto_630708 - BLOCK
      ?auto_630709 - BLOCK
      ?auto_630710 - BLOCK
      ?auto_630711 - BLOCK
      ?auto_630712 - BLOCK
      ?auto_630713 - BLOCK
      ?auto_630714 - BLOCK
      ?auto_630715 - BLOCK
      ?auto_630716 - BLOCK
      ?auto_630717 - BLOCK
    )
    :vars
    (
      ?auto_630718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630717 ?auto_630718 ) ( ON-TABLE ?auto_630705 ) ( ON ?auto_630706 ?auto_630705 ) ( ON ?auto_630707 ?auto_630706 ) ( ON ?auto_630708 ?auto_630707 ) ( ON ?auto_630709 ?auto_630708 ) ( ON ?auto_630710 ?auto_630709 ) ( ON ?auto_630711 ?auto_630710 ) ( ON ?auto_630712 ?auto_630711 ) ( not ( = ?auto_630705 ?auto_630706 ) ) ( not ( = ?auto_630705 ?auto_630707 ) ) ( not ( = ?auto_630705 ?auto_630708 ) ) ( not ( = ?auto_630705 ?auto_630709 ) ) ( not ( = ?auto_630705 ?auto_630710 ) ) ( not ( = ?auto_630705 ?auto_630711 ) ) ( not ( = ?auto_630705 ?auto_630712 ) ) ( not ( = ?auto_630705 ?auto_630713 ) ) ( not ( = ?auto_630705 ?auto_630714 ) ) ( not ( = ?auto_630705 ?auto_630715 ) ) ( not ( = ?auto_630705 ?auto_630716 ) ) ( not ( = ?auto_630705 ?auto_630717 ) ) ( not ( = ?auto_630705 ?auto_630718 ) ) ( not ( = ?auto_630706 ?auto_630707 ) ) ( not ( = ?auto_630706 ?auto_630708 ) ) ( not ( = ?auto_630706 ?auto_630709 ) ) ( not ( = ?auto_630706 ?auto_630710 ) ) ( not ( = ?auto_630706 ?auto_630711 ) ) ( not ( = ?auto_630706 ?auto_630712 ) ) ( not ( = ?auto_630706 ?auto_630713 ) ) ( not ( = ?auto_630706 ?auto_630714 ) ) ( not ( = ?auto_630706 ?auto_630715 ) ) ( not ( = ?auto_630706 ?auto_630716 ) ) ( not ( = ?auto_630706 ?auto_630717 ) ) ( not ( = ?auto_630706 ?auto_630718 ) ) ( not ( = ?auto_630707 ?auto_630708 ) ) ( not ( = ?auto_630707 ?auto_630709 ) ) ( not ( = ?auto_630707 ?auto_630710 ) ) ( not ( = ?auto_630707 ?auto_630711 ) ) ( not ( = ?auto_630707 ?auto_630712 ) ) ( not ( = ?auto_630707 ?auto_630713 ) ) ( not ( = ?auto_630707 ?auto_630714 ) ) ( not ( = ?auto_630707 ?auto_630715 ) ) ( not ( = ?auto_630707 ?auto_630716 ) ) ( not ( = ?auto_630707 ?auto_630717 ) ) ( not ( = ?auto_630707 ?auto_630718 ) ) ( not ( = ?auto_630708 ?auto_630709 ) ) ( not ( = ?auto_630708 ?auto_630710 ) ) ( not ( = ?auto_630708 ?auto_630711 ) ) ( not ( = ?auto_630708 ?auto_630712 ) ) ( not ( = ?auto_630708 ?auto_630713 ) ) ( not ( = ?auto_630708 ?auto_630714 ) ) ( not ( = ?auto_630708 ?auto_630715 ) ) ( not ( = ?auto_630708 ?auto_630716 ) ) ( not ( = ?auto_630708 ?auto_630717 ) ) ( not ( = ?auto_630708 ?auto_630718 ) ) ( not ( = ?auto_630709 ?auto_630710 ) ) ( not ( = ?auto_630709 ?auto_630711 ) ) ( not ( = ?auto_630709 ?auto_630712 ) ) ( not ( = ?auto_630709 ?auto_630713 ) ) ( not ( = ?auto_630709 ?auto_630714 ) ) ( not ( = ?auto_630709 ?auto_630715 ) ) ( not ( = ?auto_630709 ?auto_630716 ) ) ( not ( = ?auto_630709 ?auto_630717 ) ) ( not ( = ?auto_630709 ?auto_630718 ) ) ( not ( = ?auto_630710 ?auto_630711 ) ) ( not ( = ?auto_630710 ?auto_630712 ) ) ( not ( = ?auto_630710 ?auto_630713 ) ) ( not ( = ?auto_630710 ?auto_630714 ) ) ( not ( = ?auto_630710 ?auto_630715 ) ) ( not ( = ?auto_630710 ?auto_630716 ) ) ( not ( = ?auto_630710 ?auto_630717 ) ) ( not ( = ?auto_630710 ?auto_630718 ) ) ( not ( = ?auto_630711 ?auto_630712 ) ) ( not ( = ?auto_630711 ?auto_630713 ) ) ( not ( = ?auto_630711 ?auto_630714 ) ) ( not ( = ?auto_630711 ?auto_630715 ) ) ( not ( = ?auto_630711 ?auto_630716 ) ) ( not ( = ?auto_630711 ?auto_630717 ) ) ( not ( = ?auto_630711 ?auto_630718 ) ) ( not ( = ?auto_630712 ?auto_630713 ) ) ( not ( = ?auto_630712 ?auto_630714 ) ) ( not ( = ?auto_630712 ?auto_630715 ) ) ( not ( = ?auto_630712 ?auto_630716 ) ) ( not ( = ?auto_630712 ?auto_630717 ) ) ( not ( = ?auto_630712 ?auto_630718 ) ) ( not ( = ?auto_630713 ?auto_630714 ) ) ( not ( = ?auto_630713 ?auto_630715 ) ) ( not ( = ?auto_630713 ?auto_630716 ) ) ( not ( = ?auto_630713 ?auto_630717 ) ) ( not ( = ?auto_630713 ?auto_630718 ) ) ( not ( = ?auto_630714 ?auto_630715 ) ) ( not ( = ?auto_630714 ?auto_630716 ) ) ( not ( = ?auto_630714 ?auto_630717 ) ) ( not ( = ?auto_630714 ?auto_630718 ) ) ( not ( = ?auto_630715 ?auto_630716 ) ) ( not ( = ?auto_630715 ?auto_630717 ) ) ( not ( = ?auto_630715 ?auto_630718 ) ) ( not ( = ?auto_630716 ?auto_630717 ) ) ( not ( = ?auto_630716 ?auto_630718 ) ) ( not ( = ?auto_630717 ?auto_630718 ) ) ( ON ?auto_630716 ?auto_630717 ) ( ON ?auto_630715 ?auto_630716 ) ( ON ?auto_630714 ?auto_630715 ) ( CLEAR ?auto_630712 ) ( ON ?auto_630713 ?auto_630714 ) ( CLEAR ?auto_630713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_630705 ?auto_630706 ?auto_630707 ?auto_630708 ?auto_630709 ?auto_630710 ?auto_630711 ?auto_630712 ?auto_630713 )
      ( MAKE-13PILE ?auto_630705 ?auto_630706 ?auto_630707 ?auto_630708 ?auto_630709 ?auto_630710 ?auto_630711 ?auto_630712 ?auto_630713 ?auto_630714 ?auto_630715 ?auto_630716 ?auto_630717 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630759 - BLOCK
      ?auto_630760 - BLOCK
      ?auto_630761 - BLOCK
      ?auto_630762 - BLOCK
      ?auto_630763 - BLOCK
      ?auto_630764 - BLOCK
      ?auto_630765 - BLOCK
      ?auto_630766 - BLOCK
      ?auto_630767 - BLOCK
      ?auto_630768 - BLOCK
      ?auto_630769 - BLOCK
      ?auto_630770 - BLOCK
      ?auto_630771 - BLOCK
    )
    :vars
    (
      ?auto_630772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630771 ?auto_630772 ) ( ON-TABLE ?auto_630759 ) ( ON ?auto_630760 ?auto_630759 ) ( ON ?auto_630761 ?auto_630760 ) ( ON ?auto_630762 ?auto_630761 ) ( ON ?auto_630763 ?auto_630762 ) ( ON ?auto_630764 ?auto_630763 ) ( ON ?auto_630765 ?auto_630764 ) ( not ( = ?auto_630759 ?auto_630760 ) ) ( not ( = ?auto_630759 ?auto_630761 ) ) ( not ( = ?auto_630759 ?auto_630762 ) ) ( not ( = ?auto_630759 ?auto_630763 ) ) ( not ( = ?auto_630759 ?auto_630764 ) ) ( not ( = ?auto_630759 ?auto_630765 ) ) ( not ( = ?auto_630759 ?auto_630766 ) ) ( not ( = ?auto_630759 ?auto_630767 ) ) ( not ( = ?auto_630759 ?auto_630768 ) ) ( not ( = ?auto_630759 ?auto_630769 ) ) ( not ( = ?auto_630759 ?auto_630770 ) ) ( not ( = ?auto_630759 ?auto_630771 ) ) ( not ( = ?auto_630759 ?auto_630772 ) ) ( not ( = ?auto_630760 ?auto_630761 ) ) ( not ( = ?auto_630760 ?auto_630762 ) ) ( not ( = ?auto_630760 ?auto_630763 ) ) ( not ( = ?auto_630760 ?auto_630764 ) ) ( not ( = ?auto_630760 ?auto_630765 ) ) ( not ( = ?auto_630760 ?auto_630766 ) ) ( not ( = ?auto_630760 ?auto_630767 ) ) ( not ( = ?auto_630760 ?auto_630768 ) ) ( not ( = ?auto_630760 ?auto_630769 ) ) ( not ( = ?auto_630760 ?auto_630770 ) ) ( not ( = ?auto_630760 ?auto_630771 ) ) ( not ( = ?auto_630760 ?auto_630772 ) ) ( not ( = ?auto_630761 ?auto_630762 ) ) ( not ( = ?auto_630761 ?auto_630763 ) ) ( not ( = ?auto_630761 ?auto_630764 ) ) ( not ( = ?auto_630761 ?auto_630765 ) ) ( not ( = ?auto_630761 ?auto_630766 ) ) ( not ( = ?auto_630761 ?auto_630767 ) ) ( not ( = ?auto_630761 ?auto_630768 ) ) ( not ( = ?auto_630761 ?auto_630769 ) ) ( not ( = ?auto_630761 ?auto_630770 ) ) ( not ( = ?auto_630761 ?auto_630771 ) ) ( not ( = ?auto_630761 ?auto_630772 ) ) ( not ( = ?auto_630762 ?auto_630763 ) ) ( not ( = ?auto_630762 ?auto_630764 ) ) ( not ( = ?auto_630762 ?auto_630765 ) ) ( not ( = ?auto_630762 ?auto_630766 ) ) ( not ( = ?auto_630762 ?auto_630767 ) ) ( not ( = ?auto_630762 ?auto_630768 ) ) ( not ( = ?auto_630762 ?auto_630769 ) ) ( not ( = ?auto_630762 ?auto_630770 ) ) ( not ( = ?auto_630762 ?auto_630771 ) ) ( not ( = ?auto_630762 ?auto_630772 ) ) ( not ( = ?auto_630763 ?auto_630764 ) ) ( not ( = ?auto_630763 ?auto_630765 ) ) ( not ( = ?auto_630763 ?auto_630766 ) ) ( not ( = ?auto_630763 ?auto_630767 ) ) ( not ( = ?auto_630763 ?auto_630768 ) ) ( not ( = ?auto_630763 ?auto_630769 ) ) ( not ( = ?auto_630763 ?auto_630770 ) ) ( not ( = ?auto_630763 ?auto_630771 ) ) ( not ( = ?auto_630763 ?auto_630772 ) ) ( not ( = ?auto_630764 ?auto_630765 ) ) ( not ( = ?auto_630764 ?auto_630766 ) ) ( not ( = ?auto_630764 ?auto_630767 ) ) ( not ( = ?auto_630764 ?auto_630768 ) ) ( not ( = ?auto_630764 ?auto_630769 ) ) ( not ( = ?auto_630764 ?auto_630770 ) ) ( not ( = ?auto_630764 ?auto_630771 ) ) ( not ( = ?auto_630764 ?auto_630772 ) ) ( not ( = ?auto_630765 ?auto_630766 ) ) ( not ( = ?auto_630765 ?auto_630767 ) ) ( not ( = ?auto_630765 ?auto_630768 ) ) ( not ( = ?auto_630765 ?auto_630769 ) ) ( not ( = ?auto_630765 ?auto_630770 ) ) ( not ( = ?auto_630765 ?auto_630771 ) ) ( not ( = ?auto_630765 ?auto_630772 ) ) ( not ( = ?auto_630766 ?auto_630767 ) ) ( not ( = ?auto_630766 ?auto_630768 ) ) ( not ( = ?auto_630766 ?auto_630769 ) ) ( not ( = ?auto_630766 ?auto_630770 ) ) ( not ( = ?auto_630766 ?auto_630771 ) ) ( not ( = ?auto_630766 ?auto_630772 ) ) ( not ( = ?auto_630767 ?auto_630768 ) ) ( not ( = ?auto_630767 ?auto_630769 ) ) ( not ( = ?auto_630767 ?auto_630770 ) ) ( not ( = ?auto_630767 ?auto_630771 ) ) ( not ( = ?auto_630767 ?auto_630772 ) ) ( not ( = ?auto_630768 ?auto_630769 ) ) ( not ( = ?auto_630768 ?auto_630770 ) ) ( not ( = ?auto_630768 ?auto_630771 ) ) ( not ( = ?auto_630768 ?auto_630772 ) ) ( not ( = ?auto_630769 ?auto_630770 ) ) ( not ( = ?auto_630769 ?auto_630771 ) ) ( not ( = ?auto_630769 ?auto_630772 ) ) ( not ( = ?auto_630770 ?auto_630771 ) ) ( not ( = ?auto_630770 ?auto_630772 ) ) ( not ( = ?auto_630771 ?auto_630772 ) ) ( ON ?auto_630770 ?auto_630771 ) ( ON ?auto_630769 ?auto_630770 ) ( ON ?auto_630768 ?auto_630769 ) ( ON ?auto_630767 ?auto_630768 ) ( CLEAR ?auto_630765 ) ( ON ?auto_630766 ?auto_630767 ) ( CLEAR ?auto_630766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_630759 ?auto_630760 ?auto_630761 ?auto_630762 ?auto_630763 ?auto_630764 ?auto_630765 ?auto_630766 )
      ( MAKE-13PILE ?auto_630759 ?auto_630760 ?auto_630761 ?auto_630762 ?auto_630763 ?auto_630764 ?auto_630765 ?auto_630766 ?auto_630767 ?auto_630768 ?auto_630769 ?auto_630770 ?auto_630771 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630813 - BLOCK
      ?auto_630814 - BLOCK
      ?auto_630815 - BLOCK
      ?auto_630816 - BLOCK
      ?auto_630817 - BLOCK
      ?auto_630818 - BLOCK
      ?auto_630819 - BLOCK
      ?auto_630820 - BLOCK
      ?auto_630821 - BLOCK
      ?auto_630822 - BLOCK
      ?auto_630823 - BLOCK
      ?auto_630824 - BLOCK
      ?auto_630825 - BLOCK
    )
    :vars
    (
      ?auto_630826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630825 ?auto_630826 ) ( ON-TABLE ?auto_630813 ) ( ON ?auto_630814 ?auto_630813 ) ( ON ?auto_630815 ?auto_630814 ) ( ON ?auto_630816 ?auto_630815 ) ( ON ?auto_630817 ?auto_630816 ) ( ON ?auto_630818 ?auto_630817 ) ( not ( = ?auto_630813 ?auto_630814 ) ) ( not ( = ?auto_630813 ?auto_630815 ) ) ( not ( = ?auto_630813 ?auto_630816 ) ) ( not ( = ?auto_630813 ?auto_630817 ) ) ( not ( = ?auto_630813 ?auto_630818 ) ) ( not ( = ?auto_630813 ?auto_630819 ) ) ( not ( = ?auto_630813 ?auto_630820 ) ) ( not ( = ?auto_630813 ?auto_630821 ) ) ( not ( = ?auto_630813 ?auto_630822 ) ) ( not ( = ?auto_630813 ?auto_630823 ) ) ( not ( = ?auto_630813 ?auto_630824 ) ) ( not ( = ?auto_630813 ?auto_630825 ) ) ( not ( = ?auto_630813 ?auto_630826 ) ) ( not ( = ?auto_630814 ?auto_630815 ) ) ( not ( = ?auto_630814 ?auto_630816 ) ) ( not ( = ?auto_630814 ?auto_630817 ) ) ( not ( = ?auto_630814 ?auto_630818 ) ) ( not ( = ?auto_630814 ?auto_630819 ) ) ( not ( = ?auto_630814 ?auto_630820 ) ) ( not ( = ?auto_630814 ?auto_630821 ) ) ( not ( = ?auto_630814 ?auto_630822 ) ) ( not ( = ?auto_630814 ?auto_630823 ) ) ( not ( = ?auto_630814 ?auto_630824 ) ) ( not ( = ?auto_630814 ?auto_630825 ) ) ( not ( = ?auto_630814 ?auto_630826 ) ) ( not ( = ?auto_630815 ?auto_630816 ) ) ( not ( = ?auto_630815 ?auto_630817 ) ) ( not ( = ?auto_630815 ?auto_630818 ) ) ( not ( = ?auto_630815 ?auto_630819 ) ) ( not ( = ?auto_630815 ?auto_630820 ) ) ( not ( = ?auto_630815 ?auto_630821 ) ) ( not ( = ?auto_630815 ?auto_630822 ) ) ( not ( = ?auto_630815 ?auto_630823 ) ) ( not ( = ?auto_630815 ?auto_630824 ) ) ( not ( = ?auto_630815 ?auto_630825 ) ) ( not ( = ?auto_630815 ?auto_630826 ) ) ( not ( = ?auto_630816 ?auto_630817 ) ) ( not ( = ?auto_630816 ?auto_630818 ) ) ( not ( = ?auto_630816 ?auto_630819 ) ) ( not ( = ?auto_630816 ?auto_630820 ) ) ( not ( = ?auto_630816 ?auto_630821 ) ) ( not ( = ?auto_630816 ?auto_630822 ) ) ( not ( = ?auto_630816 ?auto_630823 ) ) ( not ( = ?auto_630816 ?auto_630824 ) ) ( not ( = ?auto_630816 ?auto_630825 ) ) ( not ( = ?auto_630816 ?auto_630826 ) ) ( not ( = ?auto_630817 ?auto_630818 ) ) ( not ( = ?auto_630817 ?auto_630819 ) ) ( not ( = ?auto_630817 ?auto_630820 ) ) ( not ( = ?auto_630817 ?auto_630821 ) ) ( not ( = ?auto_630817 ?auto_630822 ) ) ( not ( = ?auto_630817 ?auto_630823 ) ) ( not ( = ?auto_630817 ?auto_630824 ) ) ( not ( = ?auto_630817 ?auto_630825 ) ) ( not ( = ?auto_630817 ?auto_630826 ) ) ( not ( = ?auto_630818 ?auto_630819 ) ) ( not ( = ?auto_630818 ?auto_630820 ) ) ( not ( = ?auto_630818 ?auto_630821 ) ) ( not ( = ?auto_630818 ?auto_630822 ) ) ( not ( = ?auto_630818 ?auto_630823 ) ) ( not ( = ?auto_630818 ?auto_630824 ) ) ( not ( = ?auto_630818 ?auto_630825 ) ) ( not ( = ?auto_630818 ?auto_630826 ) ) ( not ( = ?auto_630819 ?auto_630820 ) ) ( not ( = ?auto_630819 ?auto_630821 ) ) ( not ( = ?auto_630819 ?auto_630822 ) ) ( not ( = ?auto_630819 ?auto_630823 ) ) ( not ( = ?auto_630819 ?auto_630824 ) ) ( not ( = ?auto_630819 ?auto_630825 ) ) ( not ( = ?auto_630819 ?auto_630826 ) ) ( not ( = ?auto_630820 ?auto_630821 ) ) ( not ( = ?auto_630820 ?auto_630822 ) ) ( not ( = ?auto_630820 ?auto_630823 ) ) ( not ( = ?auto_630820 ?auto_630824 ) ) ( not ( = ?auto_630820 ?auto_630825 ) ) ( not ( = ?auto_630820 ?auto_630826 ) ) ( not ( = ?auto_630821 ?auto_630822 ) ) ( not ( = ?auto_630821 ?auto_630823 ) ) ( not ( = ?auto_630821 ?auto_630824 ) ) ( not ( = ?auto_630821 ?auto_630825 ) ) ( not ( = ?auto_630821 ?auto_630826 ) ) ( not ( = ?auto_630822 ?auto_630823 ) ) ( not ( = ?auto_630822 ?auto_630824 ) ) ( not ( = ?auto_630822 ?auto_630825 ) ) ( not ( = ?auto_630822 ?auto_630826 ) ) ( not ( = ?auto_630823 ?auto_630824 ) ) ( not ( = ?auto_630823 ?auto_630825 ) ) ( not ( = ?auto_630823 ?auto_630826 ) ) ( not ( = ?auto_630824 ?auto_630825 ) ) ( not ( = ?auto_630824 ?auto_630826 ) ) ( not ( = ?auto_630825 ?auto_630826 ) ) ( ON ?auto_630824 ?auto_630825 ) ( ON ?auto_630823 ?auto_630824 ) ( ON ?auto_630822 ?auto_630823 ) ( ON ?auto_630821 ?auto_630822 ) ( ON ?auto_630820 ?auto_630821 ) ( CLEAR ?auto_630818 ) ( ON ?auto_630819 ?auto_630820 ) ( CLEAR ?auto_630819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_630813 ?auto_630814 ?auto_630815 ?auto_630816 ?auto_630817 ?auto_630818 ?auto_630819 )
      ( MAKE-13PILE ?auto_630813 ?auto_630814 ?auto_630815 ?auto_630816 ?auto_630817 ?auto_630818 ?auto_630819 ?auto_630820 ?auto_630821 ?auto_630822 ?auto_630823 ?auto_630824 ?auto_630825 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630867 - BLOCK
      ?auto_630868 - BLOCK
      ?auto_630869 - BLOCK
      ?auto_630870 - BLOCK
      ?auto_630871 - BLOCK
      ?auto_630872 - BLOCK
      ?auto_630873 - BLOCK
      ?auto_630874 - BLOCK
      ?auto_630875 - BLOCK
      ?auto_630876 - BLOCK
      ?auto_630877 - BLOCK
      ?auto_630878 - BLOCK
      ?auto_630879 - BLOCK
    )
    :vars
    (
      ?auto_630880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630879 ?auto_630880 ) ( ON-TABLE ?auto_630867 ) ( ON ?auto_630868 ?auto_630867 ) ( ON ?auto_630869 ?auto_630868 ) ( ON ?auto_630870 ?auto_630869 ) ( ON ?auto_630871 ?auto_630870 ) ( not ( = ?auto_630867 ?auto_630868 ) ) ( not ( = ?auto_630867 ?auto_630869 ) ) ( not ( = ?auto_630867 ?auto_630870 ) ) ( not ( = ?auto_630867 ?auto_630871 ) ) ( not ( = ?auto_630867 ?auto_630872 ) ) ( not ( = ?auto_630867 ?auto_630873 ) ) ( not ( = ?auto_630867 ?auto_630874 ) ) ( not ( = ?auto_630867 ?auto_630875 ) ) ( not ( = ?auto_630867 ?auto_630876 ) ) ( not ( = ?auto_630867 ?auto_630877 ) ) ( not ( = ?auto_630867 ?auto_630878 ) ) ( not ( = ?auto_630867 ?auto_630879 ) ) ( not ( = ?auto_630867 ?auto_630880 ) ) ( not ( = ?auto_630868 ?auto_630869 ) ) ( not ( = ?auto_630868 ?auto_630870 ) ) ( not ( = ?auto_630868 ?auto_630871 ) ) ( not ( = ?auto_630868 ?auto_630872 ) ) ( not ( = ?auto_630868 ?auto_630873 ) ) ( not ( = ?auto_630868 ?auto_630874 ) ) ( not ( = ?auto_630868 ?auto_630875 ) ) ( not ( = ?auto_630868 ?auto_630876 ) ) ( not ( = ?auto_630868 ?auto_630877 ) ) ( not ( = ?auto_630868 ?auto_630878 ) ) ( not ( = ?auto_630868 ?auto_630879 ) ) ( not ( = ?auto_630868 ?auto_630880 ) ) ( not ( = ?auto_630869 ?auto_630870 ) ) ( not ( = ?auto_630869 ?auto_630871 ) ) ( not ( = ?auto_630869 ?auto_630872 ) ) ( not ( = ?auto_630869 ?auto_630873 ) ) ( not ( = ?auto_630869 ?auto_630874 ) ) ( not ( = ?auto_630869 ?auto_630875 ) ) ( not ( = ?auto_630869 ?auto_630876 ) ) ( not ( = ?auto_630869 ?auto_630877 ) ) ( not ( = ?auto_630869 ?auto_630878 ) ) ( not ( = ?auto_630869 ?auto_630879 ) ) ( not ( = ?auto_630869 ?auto_630880 ) ) ( not ( = ?auto_630870 ?auto_630871 ) ) ( not ( = ?auto_630870 ?auto_630872 ) ) ( not ( = ?auto_630870 ?auto_630873 ) ) ( not ( = ?auto_630870 ?auto_630874 ) ) ( not ( = ?auto_630870 ?auto_630875 ) ) ( not ( = ?auto_630870 ?auto_630876 ) ) ( not ( = ?auto_630870 ?auto_630877 ) ) ( not ( = ?auto_630870 ?auto_630878 ) ) ( not ( = ?auto_630870 ?auto_630879 ) ) ( not ( = ?auto_630870 ?auto_630880 ) ) ( not ( = ?auto_630871 ?auto_630872 ) ) ( not ( = ?auto_630871 ?auto_630873 ) ) ( not ( = ?auto_630871 ?auto_630874 ) ) ( not ( = ?auto_630871 ?auto_630875 ) ) ( not ( = ?auto_630871 ?auto_630876 ) ) ( not ( = ?auto_630871 ?auto_630877 ) ) ( not ( = ?auto_630871 ?auto_630878 ) ) ( not ( = ?auto_630871 ?auto_630879 ) ) ( not ( = ?auto_630871 ?auto_630880 ) ) ( not ( = ?auto_630872 ?auto_630873 ) ) ( not ( = ?auto_630872 ?auto_630874 ) ) ( not ( = ?auto_630872 ?auto_630875 ) ) ( not ( = ?auto_630872 ?auto_630876 ) ) ( not ( = ?auto_630872 ?auto_630877 ) ) ( not ( = ?auto_630872 ?auto_630878 ) ) ( not ( = ?auto_630872 ?auto_630879 ) ) ( not ( = ?auto_630872 ?auto_630880 ) ) ( not ( = ?auto_630873 ?auto_630874 ) ) ( not ( = ?auto_630873 ?auto_630875 ) ) ( not ( = ?auto_630873 ?auto_630876 ) ) ( not ( = ?auto_630873 ?auto_630877 ) ) ( not ( = ?auto_630873 ?auto_630878 ) ) ( not ( = ?auto_630873 ?auto_630879 ) ) ( not ( = ?auto_630873 ?auto_630880 ) ) ( not ( = ?auto_630874 ?auto_630875 ) ) ( not ( = ?auto_630874 ?auto_630876 ) ) ( not ( = ?auto_630874 ?auto_630877 ) ) ( not ( = ?auto_630874 ?auto_630878 ) ) ( not ( = ?auto_630874 ?auto_630879 ) ) ( not ( = ?auto_630874 ?auto_630880 ) ) ( not ( = ?auto_630875 ?auto_630876 ) ) ( not ( = ?auto_630875 ?auto_630877 ) ) ( not ( = ?auto_630875 ?auto_630878 ) ) ( not ( = ?auto_630875 ?auto_630879 ) ) ( not ( = ?auto_630875 ?auto_630880 ) ) ( not ( = ?auto_630876 ?auto_630877 ) ) ( not ( = ?auto_630876 ?auto_630878 ) ) ( not ( = ?auto_630876 ?auto_630879 ) ) ( not ( = ?auto_630876 ?auto_630880 ) ) ( not ( = ?auto_630877 ?auto_630878 ) ) ( not ( = ?auto_630877 ?auto_630879 ) ) ( not ( = ?auto_630877 ?auto_630880 ) ) ( not ( = ?auto_630878 ?auto_630879 ) ) ( not ( = ?auto_630878 ?auto_630880 ) ) ( not ( = ?auto_630879 ?auto_630880 ) ) ( ON ?auto_630878 ?auto_630879 ) ( ON ?auto_630877 ?auto_630878 ) ( ON ?auto_630876 ?auto_630877 ) ( ON ?auto_630875 ?auto_630876 ) ( ON ?auto_630874 ?auto_630875 ) ( ON ?auto_630873 ?auto_630874 ) ( CLEAR ?auto_630871 ) ( ON ?auto_630872 ?auto_630873 ) ( CLEAR ?auto_630872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_630867 ?auto_630868 ?auto_630869 ?auto_630870 ?auto_630871 ?auto_630872 )
      ( MAKE-13PILE ?auto_630867 ?auto_630868 ?auto_630869 ?auto_630870 ?auto_630871 ?auto_630872 ?auto_630873 ?auto_630874 ?auto_630875 ?auto_630876 ?auto_630877 ?auto_630878 ?auto_630879 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630921 - BLOCK
      ?auto_630922 - BLOCK
      ?auto_630923 - BLOCK
      ?auto_630924 - BLOCK
      ?auto_630925 - BLOCK
      ?auto_630926 - BLOCK
      ?auto_630927 - BLOCK
      ?auto_630928 - BLOCK
      ?auto_630929 - BLOCK
      ?auto_630930 - BLOCK
      ?auto_630931 - BLOCK
      ?auto_630932 - BLOCK
      ?auto_630933 - BLOCK
    )
    :vars
    (
      ?auto_630934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630933 ?auto_630934 ) ( ON-TABLE ?auto_630921 ) ( ON ?auto_630922 ?auto_630921 ) ( ON ?auto_630923 ?auto_630922 ) ( ON ?auto_630924 ?auto_630923 ) ( not ( = ?auto_630921 ?auto_630922 ) ) ( not ( = ?auto_630921 ?auto_630923 ) ) ( not ( = ?auto_630921 ?auto_630924 ) ) ( not ( = ?auto_630921 ?auto_630925 ) ) ( not ( = ?auto_630921 ?auto_630926 ) ) ( not ( = ?auto_630921 ?auto_630927 ) ) ( not ( = ?auto_630921 ?auto_630928 ) ) ( not ( = ?auto_630921 ?auto_630929 ) ) ( not ( = ?auto_630921 ?auto_630930 ) ) ( not ( = ?auto_630921 ?auto_630931 ) ) ( not ( = ?auto_630921 ?auto_630932 ) ) ( not ( = ?auto_630921 ?auto_630933 ) ) ( not ( = ?auto_630921 ?auto_630934 ) ) ( not ( = ?auto_630922 ?auto_630923 ) ) ( not ( = ?auto_630922 ?auto_630924 ) ) ( not ( = ?auto_630922 ?auto_630925 ) ) ( not ( = ?auto_630922 ?auto_630926 ) ) ( not ( = ?auto_630922 ?auto_630927 ) ) ( not ( = ?auto_630922 ?auto_630928 ) ) ( not ( = ?auto_630922 ?auto_630929 ) ) ( not ( = ?auto_630922 ?auto_630930 ) ) ( not ( = ?auto_630922 ?auto_630931 ) ) ( not ( = ?auto_630922 ?auto_630932 ) ) ( not ( = ?auto_630922 ?auto_630933 ) ) ( not ( = ?auto_630922 ?auto_630934 ) ) ( not ( = ?auto_630923 ?auto_630924 ) ) ( not ( = ?auto_630923 ?auto_630925 ) ) ( not ( = ?auto_630923 ?auto_630926 ) ) ( not ( = ?auto_630923 ?auto_630927 ) ) ( not ( = ?auto_630923 ?auto_630928 ) ) ( not ( = ?auto_630923 ?auto_630929 ) ) ( not ( = ?auto_630923 ?auto_630930 ) ) ( not ( = ?auto_630923 ?auto_630931 ) ) ( not ( = ?auto_630923 ?auto_630932 ) ) ( not ( = ?auto_630923 ?auto_630933 ) ) ( not ( = ?auto_630923 ?auto_630934 ) ) ( not ( = ?auto_630924 ?auto_630925 ) ) ( not ( = ?auto_630924 ?auto_630926 ) ) ( not ( = ?auto_630924 ?auto_630927 ) ) ( not ( = ?auto_630924 ?auto_630928 ) ) ( not ( = ?auto_630924 ?auto_630929 ) ) ( not ( = ?auto_630924 ?auto_630930 ) ) ( not ( = ?auto_630924 ?auto_630931 ) ) ( not ( = ?auto_630924 ?auto_630932 ) ) ( not ( = ?auto_630924 ?auto_630933 ) ) ( not ( = ?auto_630924 ?auto_630934 ) ) ( not ( = ?auto_630925 ?auto_630926 ) ) ( not ( = ?auto_630925 ?auto_630927 ) ) ( not ( = ?auto_630925 ?auto_630928 ) ) ( not ( = ?auto_630925 ?auto_630929 ) ) ( not ( = ?auto_630925 ?auto_630930 ) ) ( not ( = ?auto_630925 ?auto_630931 ) ) ( not ( = ?auto_630925 ?auto_630932 ) ) ( not ( = ?auto_630925 ?auto_630933 ) ) ( not ( = ?auto_630925 ?auto_630934 ) ) ( not ( = ?auto_630926 ?auto_630927 ) ) ( not ( = ?auto_630926 ?auto_630928 ) ) ( not ( = ?auto_630926 ?auto_630929 ) ) ( not ( = ?auto_630926 ?auto_630930 ) ) ( not ( = ?auto_630926 ?auto_630931 ) ) ( not ( = ?auto_630926 ?auto_630932 ) ) ( not ( = ?auto_630926 ?auto_630933 ) ) ( not ( = ?auto_630926 ?auto_630934 ) ) ( not ( = ?auto_630927 ?auto_630928 ) ) ( not ( = ?auto_630927 ?auto_630929 ) ) ( not ( = ?auto_630927 ?auto_630930 ) ) ( not ( = ?auto_630927 ?auto_630931 ) ) ( not ( = ?auto_630927 ?auto_630932 ) ) ( not ( = ?auto_630927 ?auto_630933 ) ) ( not ( = ?auto_630927 ?auto_630934 ) ) ( not ( = ?auto_630928 ?auto_630929 ) ) ( not ( = ?auto_630928 ?auto_630930 ) ) ( not ( = ?auto_630928 ?auto_630931 ) ) ( not ( = ?auto_630928 ?auto_630932 ) ) ( not ( = ?auto_630928 ?auto_630933 ) ) ( not ( = ?auto_630928 ?auto_630934 ) ) ( not ( = ?auto_630929 ?auto_630930 ) ) ( not ( = ?auto_630929 ?auto_630931 ) ) ( not ( = ?auto_630929 ?auto_630932 ) ) ( not ( = ?auto_630929 ?auto_630933 ) ) ( not ( = ?auto_630929 ?auto_630934 ) ) ( not ( = ?auto_630930 ?auto_630931 ) ) ( not ( = ?auto_630930 ?auto_630932 ) ) ( not ( = ?auto_630930 ?auto_630933 ) ) ( not ( = ?auto_630930 ?auto_630934 ) ) ( not ( = ?auto_630931 ?auto_630932 ) ) ( not ( = ?auto_630931 ?auto_630933 ) ) ( not ( = ?auto_630931 ?auto_630934 ) ) ( not ( = ?auto_630932 ?auto_630933 ) ) ( not ( = ?auto_630932 ?auto_630934 ) ) ( not ( = ?auto_630933 ?auto_630934 ) ) ( ON ?auto_630932 ?auto_630933 ) ( ON ?auto_630931 ?auto_630932 ) ( ON ?auto_630930 ?auto_630931 ) ( ON ?auto_630929 ?auto_630930 ) ( ON ?auto_630928 ?auto_630929 ) ( ON ?auto_630927 ?auto_630928 ) ( ON ?auto_630926 ?auto_630927 ) ( CLEAR ?auto_630924 ) ( ON ?auto_630925 ?auto_630926 ) ( CLEAR ?auto_630925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_630921 ?auto_630922 ?auto_630923 ?auto_630924 ?auto_630925 )
      ( MAKE-13PILE ?auto_630921 ?auto_630922 ?auto_630923 ?auto_630924 ?auto_630925 ?auto_630926 ?auto_630927 ?auto_630928 ?auto_630929 ?auto_630930 ?auto_630931 ?auto_630932 ?auto_630933 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_630975 - BLOCK
      ?auto_630976 - BLOCK
      ?auto_630977 - BLOCK
      ?auto_630978 - BLOCK
      ?auto_630979 - BLOCK
      ?auto_630980 - BLOCK
      ?auto_630981 - BLOCK
      ?auto_630982 - BLOCK
      ?auto_630983 - BLOCK
      ?auto_630984 - BLOCK
      ?auto_630985 - BLOCK
      ?auto_630986 - BLOCK
      ?auto_630987 - BLOCK
    )
    :vars
    (
      ?auto_630988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_630987 ?auto_630988 ) ( ON-TABLE ?auto_630975 ) ( ON ?auto_630976 ?auto_630975 ) ( ON ?auto_630977 ?auto_630976 ) ( not ( = ?auto_630975 ?auto_630976 ) ) ( not ( = ?auto_630975 ?auto_630977 ) ) ( not ( = ?auto_630975 ?auto_630978 ) ) ( not ( = ?auto_630975 ?auto_630979 ) ) ( not ( = ?auto_630975 ?auto_630980 ) ) ( not ( = ?auto_630975 ?auto_630981 ) ) ( not ( = ?auto_630975 ?auto_630982 ) ) ( not ( = ?auto_630975 ?auto_630983 ) ) ( not ( = ?auto_630975 ?auto_630984 ) ) ( not ( = ?auto_630975 ?auto_630985 ) ) ( not ( = ?auto_630975 ?auto_630986 ) ) ( not ( = ?auto_630975 ?auto_630987 ) ) ( not ( = ?auto_630975 ?auto_630988 ) ) ( not ( = ?auto_630976 ?auto_630977 ) ) ( not ( = ?auto_630976 ?auto_630978 ) ) ( not ( = ?auto_630976 ?auto_630979 ) ) ( not ( = ?auto_630976 ?auto_630980 ) ) ( not ( = ?auto_630976 ?auto_630981 ) ) ( not ( = ?auto_630976 ?auto_630982 ) ) ( not ( = ?auto_630976 ?auto_630983 ) ) ( not ( = ?auto_630976 ?auto_630984 ) ) ( not ( = ?auto_630976 ?auto_630985 ) ) ( not ( = ?auto_630976 ?auto_630986 ) ) ( not ( = ?auto_630976 ?auto_630987 ) ) ( not ( = ?auto_630976 ?auto_630988 ) ) ( not ( = ?auto_630977 ?auto_630978 ) ) ( not ( = ?auto_630977 ?auto_630979 ) ) ( not ( = ?auto_630977 ?auto_630980 ) ) ( not ( = ?auto_630977 ?auto_630981 ) ) ( not ( = ?auto_630977 ?auto_630982 ) ) ( not ( = ?auto_630977 ?auto_630983 ) ) ( not ( = ?auto_630977 ?auto_630984 ) ) ( not ( = ?auto_630977 ?auto_630985 ) ) ( not ( = ?auto_630977 ?auto_630986 ) ) ( not ( = ?auto_630977 ?auto_630987 ) ) ( not ( = ?auto_630977 ?auto_630988 ) ) ( not ( = ?auto_630978 ?auto_630979 ) ) ( not ( = ?auto_630978 ?auto_630980 ) ) ( not ( = ?auto_630978 ?auto_630981 ) ) ( not ( = ?auto_630978 ?auto_630982 ) ) ( not ( = ?auto_630978 ?auto_630983 ) ) ( not ( = ?auto_630978 ?auto_630984 ) ) ( not ( = ?auto_630978 ?auto_630985 ) ) ( not ( = ?auto_630978 ?auto_630986 ) ) ( not ( = ?auto_630978 ?auto_630987 ) ) ( not ( = ?auto_630978 ?auto_630988 ) ) ( not ( = ?auto_630979 ?auto_630980 ) ) ( not ( = ?auto_630979 ?auto_630981 ) ) ( not ( = ?auto_630979 ?auto_630982 ) ) ( not ( = ?auto_630979 ?auto_630983 ) ) ( not ( = ?auto_630979 ?auto_630984 ) ) ( not ( = ?auto_630979 ?auto_630985 ) ) ( not ( = ?auto_630979 ?auto_630986 ) ) ( not ( = ?auto_630979 ?auto_630987 ) ) ( not ( = ?auto_630979 ?auto_630988 ) ) ( not ( = ?auto_630980 ?auto_630981 ) ) ( not ( = ?auto_630980 ?auto_630982 ) ) ( not ( = ?auto_630980 ?auto_630983 ) ) ( not ( = ?auto_630980 ?auto_630984 ) ) ( not ( = ?auto_630980 ?auto_630985 ) ) ( not ( = ?auto_630980 ?auto_630986 ) ) ( not ( = ?auto_630980 ?auto_630987 ) ) ( not ( = ?auto_630980 ?auto_630988 ) ) ( not ( = ?auto_630981 ?auto_630982 ) ) ( not ( = ?auto_630981 ?auto_630983 ) ) ( not ( = ?auto_630981 ?auto_630984 ) ) ( not ( = ?auto_630981 ?auto_630985 ) ) ( not ( = ?auto_630981 ?auto_630986 ) ) ( not ( = ?auto_630981 ?auto_630987 ) ) ( not ( = ?auto_630981 ?auto_630988 ) ) ( not ( = ?auto_630982 ?auto_630983 ) ) ( not ( = ?auto_630982 ?auto_630984 ) ) ( not ( = ?auto_630982 ?auto_630985 ) ) ( not ( = ?auto_630982 ?auto_630986 ) ) ( not ( = ?auto_630982 ?auto_630987 ) ) ( not ( = ?auto_630982 ?auto_630988 ) ) ( not ( = ?auto_630983 ?auto_630984 ) ) ( not ( = ?auto_630983 ?auto_630985 ) ) ( not ( = ?auto_630983 ?auto_630986 ) ) ( not ( = ?auto_630983 ?auto_630987 ) ) ( not ( = ?auto_630983 ?auto_630988 ) ) ( not ( = ?auto_630984 ?auto_630985 ) ) ( not ( = ?auto_630984 ?auto_630986 ) ) ( not ( = ?auto_630984 ?auto_630987 ) ) ( not ( = ?auto_630984 ?auto_630988 ) ) ( not ( = ?auto_630985 ?auto_630986 ) ) ( not ( = ?auto_630985 ?auto_630987 ) ) ( not ( = ?auto_630985 ?auto_630988 ) ) ( not ( = ?auto_630986 ?auto_630987 ) ) ( not ( = ?auto_630986 ?auto_630988 ) ) ( not ( = ?auto_630987 ?auto_630988 ) ) ( ON ?auto_630986 ?auto_630987 ) ( ON ?auto_630985 ?auto_630986 ) ( ON ?auto_630984 ?auto_630985 ) ( ON ?auto_630983 ?auto_630984 ) ( ON ?auto_630982 ?auto_630983 ) ( ON ?auto_630981 ?auto_630982 ) ( ON ?auto_630980 ?auto_630981 ) ( ON ?auto_630979 ?auto_630980 ) ( CLEAR ?auto_630977 ) ( ON ?auto_630978 ?auto_630979 ) ( CLEAR ?auto_630978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_630975 ?auto_630976 ?auto_630977 ?auto_630978 )
      ( MAKE-13PILE ?auto_630975 ?auto_630976 ?auto_630977 ?auto_630978 ?auto_630979 ?auto_630980 ?auto_630981 ?auto_630982 ?auto_630983 ?auto_630984 ?auto_630985 ?auto_630986 ?auto_630987 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_631029 - BLOCK
      ?auto_631030 - BLOCK
      ?auto_631031 - BLOCK
      ?auto_631032 - BLOCK
      ?auto_631033 - BLOCK
      ?auto_631034 - BLOCK
      ?auto_631035 - BLOCK
      ?auto_631036 - BLOCK
      ?auto_631037 - BLOCK
      ?auto_631038 - BLOCK
      ?auto_631039 - BLOCK
      ?auto_631040 - BLOCK
      ?auto_631041 - BLOCK
    )
    :vars
    (
      ?auto_631042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631041 ?auto_631042 ) ( ON-TABLE ?auto_631029 ) ( ON ?auto_631030 ?auto_631029 ) ( not ( = ?auto_631029 ?auto_631030 ) ) ( not ( = ?auto_631029 ?auto_631031 ) ) ( not ( = ?auto_631029 ?auto_631032 ) ) ( not ( = ?auto_631029 ?auto_631033 ) ) ( not ( = ?auto_631029 ?auto_631034 ) ) ( not ( = ?auto_631029 ?auto_631035 ) ) ( not ( = ?auto_631029 ?auto_631036 ) ) ( not ( = ?auto_631029 ?auto_631037 ) ) ( not ( = ?auto_631029 ?auto_631038 ) ) ( not ( = ?auto_631029 ?auto_631039 ) ) ( not ( = ?auto_631029 ?auto_631040 ) ) ( not ( = ?auto_631029 ?auto_631041 ) ) ( not ( = ?auto_631029 ?auto_631042 ) ) ( not ( = ?auto_631030 ?auto_631031 ) ) ( not ( = ?auto_631030 ?auto_631032 ) ) ( not ( = ?auto_631030 ?auto_631033 ) ) ( not ( = ?auto_631030 ?auto_631034 ) ) ( not ( = ?auto_631030 ?auto_631035 ) ) ( not ( = ?auto_631030 ?auto_631036 ) ) ( not ( = ?auto_631030 ?auto_631037 ) ) ( not ( = ?auto_631030 ?auto_631038 ) ) ( not ( = ?auto_631030 ?auto_631039 ) ) ( not ( = ?auto_631030 ?auto_631040 ) ) ( not ( = ?auto_631030 ?auto_631041 ) ) ( not ( = ?auto_631030 ?auto_631042 ) ) ( not ( = ?auto_631031 ?auto_631032 ) ) ( not ( = ?auto_631031 ?auto_631033 ) ) ( not ( = ?auto_631031 ?auto_631034 ) ) ( not ( = ?auto_631031 ?auto_631035 ) ) ( not ( = ?auto_631031 ?auto_631036 ) ) ( not ( = ?auto_631031 ?auto_631037 ) ) ( not ( = ?auto_631031 ?auto_631038 ) ) ( not ( = ?auto_631031 ?auto_631039 ) ) ( not ( = ?auto_631031 ?auto_631040 ) ) ( not ( = ?auto_631031 ?auto_631041 ) ) ( not ( = ?auto_631031 ?auto_631042 ) ) ( not ( = ?auto_631032 ?auto_631033 ) ) ( not ( = ?auto_631032 ?auto_631034 ) ) ( not ( = ?auto_631032 ?auto_631035 ) ) ( not ( = ?auto_631032 ?auto_631036 ) ) ( not ( = ?auto_631032 ?auto_631037 ) ) ( not ( = ?auto_631032 ?auto_631038 ) ) ( not ( = ?auto_631032 ?auto_631039 ) ) ( not ( = ?auto_631032 ?auto_631040 ) ) ( not ( = ?auto_631032 ?auto_631041 ) ) ( not ( = ?auto_631032 ?auto_631042 ) ) ( not ( = ?auto_631033 ?auto_631034 ) ) ( not ( = ?auto_631033 ?auto_631035 ) ) ( not ( = ?auto_631033 ?auto_631036 ) ) ( not ( = ?auto_631033 ?auto_631037 ) ) ( not ( = ?auto_631033 ?auto_631038 ) ) ( not ( = ?auto_631033 ?auto_631039 ) ) ( not ( = ?auto_631033 ?auto_631040 ) ) ( not ( = ?auto_631033 ?auto_631041 ) ) ( not ( = ?auto_631033 ?auto_631042 ) ) ( not ( = ?auto_631034 ?auto_631035 ) ) ( not ( = ?auto_631034 ?auto_631036 ) ) ( not ( = ?auto_631034 ?auto_631037 ) ) ( not ( = ?auto_631034 ?auto_631038 ) ) ( not ( = ?auto_631034 ?auto_631039 ) ) ( not ( = ?auto_631034 ?auto_631040 ) ) ( not ( = ?auto_631034 ?auto_631041 ) ) ( not ( = ?auto_631034 ?auto_631042 ) ) ( not ( = ?auto_631035 ?auto_631036 ) ) ( not ( = ?auto_631035 ?auto_631037 ) ) ( not ( = ?auto_631035 ?auto_631038 ) ) ( not ( = ?auto_631035 ?auto_631039 ) ) ( not ( = ?auto_631035 ?auto_631040 ) ) ( not ( = ?auto_631035 ?auto_631041 ) ) ( not ( = ?auto_631035 ?auto_631042 ) ) ( not ( = ?auto_631036 ?auto_631037 ) ) ( not ( = ?auto_631036 ?auto_631038 ) ) ( not ( = ?auto_631036 ?auto_631039 ) ) ( not ( = ?auto_631036 ?auto_631040 ) ) ( not ( = ?auto_631036 ?auto_631041 ) ) ( not ( = ?auto_631036 ?auto_631042 ) ) ( not ( = ?auto_631037 ?auto_631038 ) ) ( not ( = ?auto_631037 ?auto_631039 ) ) ( not ( = ?auto_631037 ?auto_631040 ) ) ( not ( = ?auto_631037 ?auto_631041 ) ) ( not ( = ?auto_631037 ?auto_631042 ) ) ( not ( = ?auto_631038 ?auto_631039 ) ) ( not ( = ?auto_631038 ?auto_631040 ) ) ( not ( = ?auto_631038 ?auto_631041 ) ) ( not ( = ?auto_631038 ?auto_631042 ) ) ( not ( = ?auto_631039 ?auto_631040 ) ) ( not ( = ?auto_631039 ?auto_631041 ) ) ( not ( = ?auto_631039 ?auto_631042 ) ) ( not ( = ?auto_631040 ?auto_631041 ) ) ( not ( = ?auto_631040 ?auto_631042 ) ) ( not ( = ?auto_631041 ?auto_631042 ) ) ( ON ?auto_631040 ?auto_631041 ) ( ON ?auto_631039 ?auto_631040 ) ( ON ?auto_631038 ?auto_631039 ) ( ON ?auto_631037 ?auto_631038 ) ( ON ?auto_631036 ?auto_631037 ) ( ON ?auto_631035 ?auto_631036 ) ( ON ?auto_631034 ?auto_631035 ) ( ON ?auto_631033 ?auto_631034 ) ( ON ?auto_631032 ?auto_631033 ) ( CLEAR ?auto_631030 ) ( ON ?auto_631031 ?auto_631032 ) ( CLEAR ?auto_631031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_631029 ?auto_631030 ?auto_631031 )
      ( MAKE-13PILE ?auto_631029 ?auto_631030 ?auto_631031 ?auto_631032 ?auto_631033 ?auto_631034 ?auto_631035 ?auto_631036 ?auto_631037 ?auto_631038 ?auto_631039 ?auto_631040 ?auto_631041 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_631083 - BLOCK
      ?auto_631084 - BLOCK
      ?auto_631085 - BLOCK
      ?auto_631086 - BLOCK
      ?auto_631087 - BLOCK
      ?auto_631088 - BLOCK
      ?auto_631089 - BLOCK
      ?auto_631090 - BLOCK
      ?auto_631091 - BLOCK
      ?auto_631092 - BLOCK
      ?auto_631093 - BLOCK
      ?auto_631094 - BLOCK
      ?auto_631095 - BLOCK
    )
    :vars
    (
      ?auto_631096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631095 ?auto_631096 ) ( ON-TABLE ?auto_631083 ) ( not ( = ?auto_631083 ?auto_631084 ) ) ( not ( = ?auto_631083 ?auto_631085 ) ) ( not ( = ?auto_631083 ?auto_631086 ) ) ( not ( = ?auto_631083 ?auto_631087 ) ) ( not ( = ?auto_631083 ?auto_631088 ) ) ( not ( = ?auto_631083 ?auto_631089 ) ) ( not ( = ?auto_631083 ?auto_631090 ) ) ( not ( = ?auto_631083 ?auto_631091 ) ) ( not ( = ?auto_631083 ?auto_631092 ) ) ( not ( = ?auto_631083 ?auto_631093 ) ) ( not ( = ?auto_631083 ?auto_631094 ) ) ( not ( = ?auto_631083 ?auto_631095 ) ) ( not ( = ?auto_631083 ?auto_631096 ) ) ( not ( = ?auto_631084 ?auto_631085 ) ) ( not ( = ?auto_631084 ?auto_631086 ) ) ( not ( = ?auto_631084 ?auto_631087 ) ) ( not ( = ?auto_631084 ?auto_631088 ) ) ( not ( = ?auto_631084 ?auto_631089 ) ) ( not ( = ?auto_631084 ?auto_631090 ) ) ( not ( = ?auto_631084 ?auto_631091 ) ) ( not ( = ?auto_631084 ?auto_631092 ) ) ( not ( = ?auto_631084 ?auto_631093 ) ) ( not ( = ?auto_631084 ?auto_631094 ) ) ( not ( = ?auto_631084 ?auto_631095 ) ) ( not ( = ?auto_631084 ?auto_631096 ) ) ( not ( = ?auto_631085 ?auto_631086 ) ) ( not ( = ?auto_631085 ?auto_631087 ) ) ( not ( = ?auto_631085 ?auto_631088 ) ) ( not ( = ?auto_631085 ?auto_631089 ) ) ( not ( = ?auto_631085 ?auto_631090 ) ) ( not ( = ?auto_631085 ?auto_631091 ) ) ( not ( = ?auto_631085 ?auto_631092 ) ) ( not ( = ?auto_631085 ?auto_631093 ) ) ( not ( = ?auto_631085 ?auto_631094 ) ) ( not ( = ?auto_631085 ?auto_631095 ) ) ( not ( = ?auto_631085 ?auto_631096 ) ) ( not ( = ?auto_631086 ?auto_631087 ) ) ( not ( = ?auto_631086 ?auto_631088 ) ) ( not ( = ?auto_631086 ?auto_631089 ) ) ( not ( = ?auto_631086 ?auto_631090 ) ) ( not ( = ?auto_631086 ?auto_631091 ) ) ( not ( = ?auto_631086 ?auto_631092 ) ) ( not ( = ?auto_631086 ?auto_631093 ) ) ( not ( = ?auto_631086 ?auto_631094 ) ) ( not ( = ?auto_631086 ?auto_631095 ) ) ( not ( = ?auto_631086 ?auto_631096 ) ) ( not ( = ?auto_631087 ?auto_631088 ) ) ( not ( = ?auto_631087 ?auto_631089 ) ) ( not ( = ?auto_631087 ?auto_631090 ) ) ( not ( = ?auto_631087 ?auto_631091 ) ) ( not ( = ?auto_631087 ?auto_631092 ) ) ( not ( = ?auto_631087 ?auto_631093 ) ) ( not ( = ?auto_631087 ?auto_631094 ) ) ( not ( = ?auto_631087 ?auto_631095 ) ) ( not ( = ?auto_631087 ?auto_631096 ) ) ( not ( = ?auto_631088 ?auto_631089 ) ) ( not ( = ?auto_631088 ?auto_631090 ) ) ( not ( = ?auto_631088 ?auto_631091 ) ) ( not ( = ?auto_631088 ?auto_631092 ) ) ( not ( = ?auto_631088 ?auto_631093 ) ) ( not ( = ?auto_631088 ?auto_631094 ) ) ( not ( = ?auto_631088 ?auto_631095 ) ) ( not ( = ?auto_631088 ?auto_631096 ) ) ( not ( = ?auto_631089 ?auto_631090 ) ) ( not ( = ?auto_631089 ?auto_631091 ) ) ( not ( = ?auto_631089 ?auto_631092 ) ) ( not ( = ?auto_631089 ?auto_631093 ) ) ( not ( = ?auto_631089 ?auto_631094 ) ) ( not ( = ?auto_631089 ?auto_631095 ) ) ( not ( = ?auto_631089 ?auto_631096 ) ) ( not ( = ?auto_631090 ?auto_631091 ) ) ( not ( = ?auto_631090 ?auto_631092 ) ) ( not ( = ?auto_631090 ?auto_631093 ) ) ( not ( = ?auto_631090 ?auto_631094 ) ) ( not ( = ?auto_631090 ?auto_631095 ) ) ( not ( = ?auto_631090 ?auto_631096 ) ) ( not ( = ?auto_631091 ?auto_631092 ) ) ( not ( = ?auto_631091 ?auto_631093 ) ) ( not ( = ?auto_631091 ?auto_631094 ) ) ( not ( = ?auto_631091 ?auto_631095 ) ) ( not ( = ?auto_631091 ?auto_631096 ) ) ( not ( = ?auto_631092 ?auto_631093 ) ) ( not ( = ?auto_631092 ?auto_631094 ) ) ( not ( = ?auto_631092 ?auto_631095 ) ) ( not ( = ?auto_631092 ?auto_631096 ) ) ( not ( = ?auto_631093 ?auto_631094 ) ) ( not ( = ?auto_631093 ?auto_631095 ) ) ( not ( = ?auto_631093 ?auto_631096 ) ) ( not ( = ?auto_631094 ?auto_631095 ) ) ( not ( = ?auto_631094 ?auto_631096 ) ) ( not ( = ?auto_631095 ?auto_631096 ) ) ( ON ?auto_631094 ?auto_631095 ) ( ON ?auto_631093 ?auto_631094 ) ( ON ?auto_631092 ?auto_631093 ) ( ON ?auto_631091 ?auto_631092 ) ( ON ?auto_631090 ?auto_631091 ) ( ON ?auto_631089 ?auto_631090 ) ( ON ?auto_631088 ?auto_631089 ) ( ON ?auto_631087 ?auto_631088 ) ( ON ?auto_631086 ?auto_631087 ) ( ON ?auto_631085 ?auto_631086 ) ( CLEAR ?auto_631083 ) ( ON ?auto_631084 ?auto_631085 ) ( CLEAR ?auto_631084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_631083 ?auto_631084 )
      ( MAKE-13PILE ?auto_631083 ?auto_631084 ?auto_631085 ?auto_631086 ?auto_631087 ?auto_631088 ?auto_631089 ?auto_631090 ?auto_631091 ?auto_631092 ?auto_631093 ?auto_631094 ?auto_631095 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_631137 - BLOCK
      ?auto_631138 - BLOCK
      ?auto_631139 - BLOCK
      ?auto_631140 - BLOCK
      ?auto_631141 - BLOCK
      ?auto_631142 - BLOCK
      ?auto_631143 - BLOCK
      ?auto_631144 - BLOCK
      ?auto_631145 - BLOCK
      ?auto_631146 - BLOCK
      ?auto_631147 - BLOCK
      ?auto_631148 - BLOCK
      ?auto_631149 - BLOCK
    )
    :vars
    (
      ?auto_631150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631149 ?auto_631150 ) ( not ( = ?auto_631137 ?auto_631138 ) ) ( not ( = ?auto_631137 ?auto_631139 ) ) ( not ( = ?auto_631137 ?auto_631140 ) ) ( not ( = ?auto_631137 ?auto_631141 ) ) ( not ( = ?auto_631137 ?auto_631142 ) ) ( not ( = ?auto_631137 ?auto_631143 ) ) ( not ( = ?auto_631137 ?auto_631144 ) ) ( not ( = ?auto_631137 ?auto_631145 ) ) ( not ( = ?auto_631137 ?auto_631146 ) ) ( not ( = ?auto_631137 ?auto_631147 ) ) ( not ( = ?auto_631137 ?auto_631148 ) ) ( not ( = ?auto_631137 ?auto_631149 ) ) ( not ( = ?auto_631137 ?auto_631150 ) ) ( not ( = ?auto_631138 ?auto_631139 ) ) ( not ( = ?auto_631138 ?auto_631140 ) ) ( not ( = ?auto_631138 ?auto_631141 ) ) ( not ( = ?auto_631138 ?auto_631142 ) ) ( not ( = ?auto_631138 ?auto_631143 ) ) ( not ( = ?auto_631138 ?auto_631144 ) ) ( not ( = ?auto_631138 ?auto_631145 ) ) ( not ( = ?auto_631138 ?auto_631146 ) ) ( not ( = ?auto_631138 ?auto_631147 ) ) ( not ( = ?auto_631138 ?auto_631148 ) ) ( not ( = ?auto_631138 ?auto_631149 ) ) ( not ( = ?auto_631138 ?auto_631150 ) ) ( not ( = ?auto_631139 ?auto_631140 ) ) ( not ( = ?auto_631139 ?auto_631141 ) ) ( not ( = ?auto_631139 ?auto_631142 ) ) ( not ( = ?auto_631139 ?auto_631143 ) ) ( not ( = ?auto_631139 ?auto_631144 ) ) ( not ( = ?auto_631139 ?auto_631145 ) ) ( not ( = ?auto_631139 ?auto_631146 ) ) ( not ( = ?auto_631139 ?auto_631147 ) ) ( not ( = ?auto_631139 ?auto_631148 ) ) ( not ( = ?auto_631139 ?auto_631149 ) ) ( not ( = ?auto_631139 ?auto_631150 ) ) ( not ( = ?auto_631140 ?auto_631141 ) ) ( not ( = ?auto_631140 ?auto_631142 ) ) ( not ( = ?auto_631140 ?auto_631143 ) ) ( not ( = ?auto_631140 ?auto_631144 ) ) ( not ( = ?auto_631140 ?auto_631145 ) ) ( not ( = ?auto_631140 ?auto_631146 ) ) ( not ( = ?auto_631140 ?auto_631147 ) ) ( not ( = ?auto_631140 ?auto_631148 ) ) ( not ( = ?auto_631140 ?auto_631149 ) ) ( not ( = ?auto_631140 ?auto_631150 ) ) ( not ( = ?auto_631141 ?auto_631142 ) ) ( not ( = ?auto_631141 ?auto_631143 ) ) ( not ( = ?auto_631141 ?auto_631144 ) ) ( not ( = ?auto_631141 ?auto_631145 ) ) ( not ( = ?auto_631141 ?auto_631146 ) ) ( not ( = ?auto_631141 ?auto_631147 ) ) ( not ( = ?auto_631141 ?auto_631148 ) ) ( not ( = ?auto_631141 ?auto_631149 ) ) ( not ( = ?auto_631141 ?auto_631150 ) ) ( not ( = ?auto_631142 ?auto_631143 ) ) ( not ( = ?auto_631142 ?auto_631144 ) ) ( not ( = ?auto_631142 ?auto_631145 ) ) ( not ( = ?auto_631142 ?auto_631146 ) ) ( not ( = ?auto_631142 ?auto_631147 ) ) ( not ( = ?auto_631142 ?auto_631148 ) ) ( not ( = ?auto_631142 ?auto_631149 ) ) ( not ( = ?auto_631142 ?auto_631150 ) ) ( not ( = ?auto_631143 ?auto_631144 ) ) ( not ( = ?auto_631143 ?auto_631145 ) ) ( not ( = ?auto_631143 ?auto_631146 ) ) ( not ( = ?auto_631143 ?auto_631147 ) ) ( not ( = ?auto_631143 ?auto_631148 ) ) ( not ( = ?auto_631143 ?auto_631149 ) ) ( not ( = ?auto_631143 ?auto_631150 ) ) ( not ( = ?auto_631144 ?auto_631145 ) ) ( not ( = ?auto_631144 ?auto_631146 ) ) ( not ( = ?auto_631144 ?auto_631147 ) ) ( not ( = ?auto_631144 ?auto_631148 ) ) ( not ( = ?auto_631144 ?auto_631149 ) ) ( not ( = ?auto_631144 ?auto_631150 ) ) ( not ( = ?auto_631145 ?auto_631146 ) ) ( not ( = ?auto_631145 ?auto_631147 ) ) ( not ( = ?auto_631145 ?auto_631148 ) ) ( not ( = ?auto_631145 ?auto_631149 ) ) ( not ( = ?auto_631145 ?auto_631150 ) ) ( not ( = ?auto_631146 ?auto_631147 ) ) ( not ( = ?auto_631146 ?auto_631148 ) ) ( not ( = ?auto_631146 ?auto_631149 ) ) ( not ( = ?auto_631146 ?auto_631150 ) ) ( not ( = ?auto_631147 ?auto_631148 ) ) ( not ( = ?auto_631147 ?auto_631149 ) ) ( not ( = ?auto_631147 ?auto_631150 ) ) ( not ( = ?auto_631148 ?auto_631149 ) ) ( not ( = ?auto_631148 ?auto_631150 ) ) ( not ( = ?auto_631149 ?auto_631150 ) ) ( ON ?auto_631148 ?auto_631149 ) ( ON ?auto_631147 ?auto_631148 ) ( ON ?auto_631146 ?auto_631147 ) ( ON ?auto_631145 ?auto_631146 ) ( ON ?auto_631144 ?auto_631145 ) ( ON ?auto_631143 ?auto_631144 ) ( ON ?auto_631142 ?auto_631143 ) ( ON ?auto_631141 ?auto_631142 ) ( ON ?auto_631140 ?auto_631141 ) ( ON ?auto_631139 ?auto_631140 ) ( ON ?auto_631138 ?auto_631139 ) ( ON ?auto_631137 ?auto_631138 ) ( CLEAR ?auto_631137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_631137 )
      ( MAKE-13PILE ?auto_631137 ?auto_631138 ?auto_631139 ?auto_631140 ?auto_631141 ?auto_631142 ?auto_631143 ?auto_631144 ?auto_631145 ?auto_631146 ?auto_631147 ?auto_631148 ?auto_631149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631192 - BLOCK
      ?auto_631193 - BLOCK
      ?auto_631194 - BLOCK
      ?auto_631195 - BLOCK
      ?auto_631196 - BLOCK
      ?auto_631197 - BLOCK
      ?auto_631198 - BLOCK
      ?auto_631199 - BLOCK
      ?auto_631200 - BLOCK
      ?auto_631201 - BLOCK
      ?auto_631202 - BLOCK
      ?auto_631203 - BLOCK
      ?auto_631204 - BLOCK
      ?auto_631205 - BLOCK
    )
    :vars
    (
      ?auto_631206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_631204 ) ( ON ?auto_631205 ?auto_631206 ) ( CLEAR ?auto_631205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_631192 ) ( ON ?auto_631193 ?auto_631192 ) ( ON ?auto_631194 ?auto_631193 ) ( ON ?auto_631195 ?auto_631194 ) ( ON ?auto_631196 ?auto_631195 ) ( ON ?auto_631197 ?auto_631196 ) ( ON ?auto_631198 ?auto_631197 ) ( ON ?auto_631199 ?auto_631198 ) ( ON ?auto_631200 ?auto_631199 ) ( ON ?auto_631201 ?auto_631200 ) ( ON ?auto_631202 ?auto_631201 ) ( ON ?auto_631203 ?auto_631202 ) ( ON ?auto_631204 ?auto_631203 ) ( not ( = ?auto_631192 ?auto_631193 ) ) ( not ( = ?auto_631192 ?auto_631194 ) ) ( not ( = ?auto_631192 ?auto_631195 ) ) ( not ( = ?auto_631192 ?auto_631196 ) ) ( not ( = ?auto_631192 ?auto_631197 ) ) ( not ( = ?auto_631192 ?auto_631198 ) ) ( not ( = ?auto_631192 ?auto_631199 ) ) ( not ( = ?auto_631192 ?auto_631200 ) ) ( not ( = ?auto_631192 ?auto_631201 ) ) ( not ( = ?auto_631192 ?auto_631202 ) ) ( not ( = ?auto_631192 ?auto_631203 ) ) ( not ( = ?auto_631192 ?auto_631204 ) ) ( not ( = ?auto_631192 ?auto_631205 ) ) ( not ( = ?auto_631192 ?auto_631206 ) ) ( not ( = ?auto_631193 ?auto_631194 ) ) ( not ( = ?auto_631193 ?auto_631195 ) ) ( not ( = ?auto_631193 ?auto_631196 ) ) ( not ( = ?auto_631193 ?auto_631197 ) ) ( not ( = ?auto_631193 ?auto_631198 ) ) ( not ( = ?auto_631193 ?auto_631199 ) ) ( not ( = ?auto_631193 ?auto_631200 ) ) ( not ( = ?auto_631193 ?auto_631201 ) ) ( not ( = ?auto_631193 ?auto_631202 ) ) ( not ( = ?auto_631193 ?auto_631203 ) ) ( not ( = ?auto_631193 ?auto_631204 ) ) ( not ( = ?auto_631193 ?auto_631205 ) ) ( not ( = ?auto_631193 ?auto_631206 ) ) ( not ( = ?auto_631194 ?auto_631195 ) ) ( not ( = ?auto_631194 ?auto_631196 ) ) ( not ( = ?auto_631194 ?auto_631197 ) ) ( not ( = ?auto_631194 ?auto_631198 ) ) ( not ( = ?auto_631194 ?auto_631199 ) ) ( not ( = ?auto_631194 ?auto_631200 ) ) ( not ( = ?auto_631194 ?auto_631201 ) ) ( not ( = ?auto_631194 ?auto_631202 ) ) ( not ( = ?auto_631194 ?auto_631203 ) ) ( not ( = ?auto_631194 ?auto_631204 ) ) ( not ( = ?auto_631194 ?auto_631205 ) ) ( not ( = ?auto_631194 ?auto_631206 ) ) ( not ( = ?auto_631195 ?auto_631196 ) ) ( not ( = ?auto_631195 ?auto_631197 ) ) ( not ( = ?auto_631195 ?auto_631198 ) ) ( not ( = ?auto_631195 ?auto_631199 ) ) ( not ( = ?auto_631195 ?auto_631200 ) ) ( not ( = ?auto_631195 ?auto_631201 ) ) ( not ( = ?auto_631195 ?auto_631202 ) ) ( not ( = ?auto_631195 ?auto_631203 ) ) ( not ( = ?auto_631195 ?auto_631204 ) ) ( not ( = ?auto_631195 ?auto_631205 ) ) ( not ( = ?auto_631195 ?auto_631206 ) ) ( not ( = ?auto_631196 ?auto_631197 ) ) ( not ( = ?auto_631196 ?auto_631198 ) ) ( not ( = ?auto_631196 ?auto_631199 ) ) ( not ( = ?auto_631196 ?auto_631200 ) ) ( not ( = ?auto_631196 ?auto_631201 ) ) ( not ( = ?auto_631196 ?auto_631202 ) ) ( not ( = ?auto_631196 ?auto_631203 ) ) ( not ( = ?auto_631196 ?auto_631204 ) ) ( not ( = ?auto_631196 ?auto_631205 ) ) ( not ( = ?auto_631196 ?auto_631206 ) ) ( not ( = ?auto_631197 ?auto_631198 ) ) ( not ( = ?auto_631197 ?auto_631199 ) ) ( not ( = ?auto_631197 ?auto_631200 ) ) ( not ( = ?auto_631197 ?auto_631201 ) ) ( not ( = ?auto_631197 ?auto_631202 ) ) ( not ( = ?auto_631197 ?auto_631203 ) ) ( not ( = ?auto_631197 ?auto_631204 ) ) ( not ( = ?auto_631197 ?auto_631205 ) ) ( not ( = ?auto_631197 ?auto_631206 ) ) ( not ( = ?auto_631198 ?auto_631199 ) ) ( not ( = ?auto_631198 ?auto_631200 ) ) ( not ( = ?auto_631198 ?auto_631201 ) ) ( not ( = ?auto_631198 ?auto_631202 ) ) ( not ( = ?auto_631198 ?auto_631203 ) ) ( not ( = ?auto_631198 ?auto_631204 ) ) ( not ( = ?auto_631198 ?auto_631205 ) ) ( not ( = ?auto_631198 ?auto_631206 ) ) ( not ( = ?auto_631199 ?auto_631200 ) ) ( not ( = ?auto_631199 ?auto_631201 ) ) ( not ( = ?auto_631199 ?auto_631202 ) ) ( not ( = ?auto_631199 ?auto_631203 ) ) ( not ( = ?auto_631199 ?auto_631204 ) ) ( not ( = ?auto_631199 ?auto_631205 ) ) ( not ( = ?auto_631199 ?auto_631206 ) ) ( not ( = ?auto_631200 ?auto_631201 ) ) ( not ( = ?auto_631200 ?auto_631202 ) ) ( not ( = ?auto_631200 ?auto_631203 ) ) ( not ( = ?auto_631200 ?auto_631204 ) ) ( not ( = ?auto_631200 ?auto_631205 ) ) ( not ( = ?auto_631200 ?auto_631206 ) ) ( not ( = ?auto_631201 ?auto_631202 ) ) ( not ( = ?auto_631201 ?auto_631203 ) ) ( not ( = ?auto_631201 ?auto_631204 ) ) ( not ( = ?auto_631201 ?auto_631205 ) ) ( not ( = ?auto_631201 ?auto_631206 ) ) ( not ( = ?auto_631202 ?auto_631203 ) ) ( not ( = ?auto_631202 ?auto_631204 ) ) ( not ( = ?auto_631202 ?auto_631205 ) ) ( not ( = ?auto_631202 ?auto_631206 ) ) ( not ( = ?auto_631203 ?auto_631204 ) ) ( not ( = ?auto_631203 ?auto_631205 ) ) ( not ( = ?auto_631203 ?auto_631206 ) ) ( not ( = ?auto_631204 ?auto_631205 ) ) ( not ( = ?auto_631204 ?auto_631206 ) ) ( not ( = ?auto_631205 ?auto_631206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_631205 ?auto_631206 )
      ( !STACK ?auto_631205 ?auto_631204 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631250 - BLOCK
      ?auto_631251 - BLOCK
      ?auto_631252 - BLOCK
      ?auto_631253 - BLOCK
      ?auto_631254 - BLOCK
      ?auto_631255 - BLOCK
      ?auto_631256 - BLOCK
      ?auto_631257 - BLOCK
      ?auto_631258 - BLOCK
      ?auto_631259 - BLOCK
      ?auto_631260 - BLOCK
      ?auto_631261 - BLOCK
      ?auto_631262 - BLOCK
      ?auto_631263 - BLOCK
    )
    :vars
    (
      ?auto_631264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631263 ?auto_631264 ) ( ON-TABLE ?auto_631250 ) ( ON ?auto_631251 ?auto_631250 ) ( ON ?auto_631252 ?auto_631251 ) ( ON ?auto_631253 ?auto_631252 ) ( ON ?auto_631254 ?auto_631253 ) ( ON ?auto_631255 ?auto_631254 ) ( ON ?auto_631256 ?auto_631255 ) ( ON ?auto_631257 ?auto_631256 ) ( ON ?auto_631258 ?auto_631257 ) ( ON ?auto_631259 ?auto_631258 ) ( ON ?auto_631260 ?auto_631259 ) ( ON ?auto_631261 ?auto_631260 ) ( not ( = ?auto_631250 ?auto_631251 ) ) ( not ( = ?auto_631250 ?auto_631252 ) ) ( not ( = ?auto_631250 ?auto_631253 ) ) ( not ( = ?auto_631250 ?auto_631254 ) ) ( not ( = ?auto_631250 ?auto_631255 ) ) ( not ( = ?auto_631250 ?auto_631256 ) ) ( not ( = ?auto_631250 ?auto_631257 ) ) ( not ( = ?auto_631250 ?auto_631258 ) ) ( not ( = ?auto_631250 ?auto_631259 ) ) ( not ( = ?auto_631250 ?auto_631260 ) ) ( not ( = ?auto_631250 ?auto_631261 ) ) ( not ( = ?auto_631250 ?auto_631262 ) ) ( not ( = ?auto_631250 ?auto_631263 ) ) ( not ( = ?auto_631250 ?auto_631264 ) ) ( not ( = ?auto_631251 ?auto_631252 ) ) ( not ( = ?auto_631251 ?auto_631253 ) ) ( not ( = ?auto_631251 ?auto_631254 ) ) ( not ( = ?auto_631251 ?auto_631255 ) ) ( not ( = ?auto_631251 ?auto_631256 ) ) ( not ( = ?auto_631251 ?auto_631257 ) ) ( not ( = ?auto_631251 ?auto_631258 ) ) ( not ( = ?auto_631251 ?auto_631259 ) ) ( not ( = ?auto_631251 ?auto_631260 ) ) ( not ( = ?auto_631251 ?auto_631261 ) ) ( not ( = ?auto_631251 ?auto_631262 ) ) ( not ( = ?auto_631251 ?auto_631263 ) ) ( not ( = ?auto_631251 ?auto_631264 ) ) ( not ( = ?auto_631252 ?auto_631253 ) ) ( not ( = ?auto_631252 ?auto_631254 ) ) ( not ( = ?auto_631252 ?auto_631255 ) ) ( not ( = ?auto_631252 ?auto_631256 ) ) ( not ( = ?auto_631252 ?auto_631257 ) ) ( not ( = ?auto_631252 ?auto_631258 ) ) ( not ( = ?auto_631252 ?auto_631259 ) ) ( not ( = ?auto_631252 ?auto_631260 ) ) ( not ( = ?auto_631252 ?auto_631261 ) ) ( not ( = ?auto_631252 ?auto_631262 ) ) ( not ( = ?auto_631252 ?auto_631263 ) ) ( not ( = ?auto_631252 ?auto_631264 ) ) ( not ( = ?auto_631253 ?auto_631254 ) ) ( not ( = ?auto_631253 ?auto_631255 ) ) ( not ( = ?auto_631253 ?auto_631256 ) ) ( not ( = ?auto_631253 ?auto_631257 ) ) ( not ( = ?auto_631253 ?auto_631258 ) ) ( not ( = ?auto_631253 ?auto_631259 ) ) ( not ( = ?auto_631253 ?auto_631260 ) ) ( not ( = ?auto_631253 ?auto_631261 ) ) ( not ( = ?auto_631253 ?auto_631262 ) ) ( not ( = ?auto_631253 ?auto_631263 ) ) ( not ( = ?auto_631253 ?auto_631264 ) ) ( not ( = ?auto_631254 ?auto_631255 ) ) ( not ( = ?auto_631254 ?auto_631256 ) ) ( not ( = ?auto_631254 ?auto_631257 ) ) ( not ( = ?auto_631254 ?auto_631258 ) ) ( not ( = ?auto_631254 ?auto_631259 ) ) ( not ( = ?auto_631254 ?auto_631260 ) ) ( not ( = ?auto_631254 ?auto_631261 ) ) ( not ( = ?auto_631254 ?auto_631262 ) ) ( not ( = ?auto_631254 ?auto_631263 ) ) ( not ( = ?auto_631254 ?auto_631264 ) ) ( not ( = ?auto_631255 ?auto_631256 ) ) ( not ( = ?auto_631255 ?auto_631257 ) ) ( not ( = ?auto_631255 ?auto_631258 ) ) ( not ( = ?auto_631255 ?auto_631259 ) ) ( not ( = ?auto_631255 ?auto_631260 ) ) ( not ( = ?auto_631255 ?auto_631261 ) ) ( not ( = ?auto_631255 ?auto_631262 ) ) ( not ( = ?auto_631255 ?auto_631263 ) ) ( not ( = ?auto_631255 ?auto_631264 ) ) ( not ( = ?auto_631256 ?auto_631257 ) ) ( not ( = ?auto_631256 ?auto_631258 ) ) ( not ( = ?auto_631256 ?auto_631259 ) ) ( not ( = ?auto_631256 ?auto_631260 ) ) ( not ( = ?auto_631256 ?auto_631261 ) ) ( not ( = ?auto_631256 ?auto_631262 ) ) ( not ( = ?auto_631256 ?auto_631263 ) ) ( not ( = ?auto_631256 ?auto_631264 ) ) ( not ( = ?auto_631257 ?auto_631258 ) ) ( not ( = ?auto_631257 ?auto_631259 ) ) ( not ( = ?auto_631257 ?auto_631260 ) ) ( not ( = ?auto_631257 ?auto_631261 ) ) ( not ( = ?auto_631257 ?auto_631262 ) ) ( not ( = ?auto_631257 ?auto_631263 ) ) ( not ( = ?auto_631257 ?auto_631264 ) ) ( not ( = ?auto_631258 ?auto_631259 ) ) ( not ( = ?auto_631258 ?auto_631260 ) ) ( not ( = ?auto_631258 ?auto_631261 ) ) ( not ( = ?auto_631258 ?auto_631262 ) ) ( not ( = ?auto_631258 ?auto_631263 ) ) ( not ( = ?auto_631258 ?auto_631264 ) ) ( not ( = ?auto_631259 ?auto_631260 ) ) ( not ( = ?auto_631259 ?auto_631261 ) ) ( not ( = ?auto_631259 ?auto_631262 ) ) ( not ( = ?auto_631259 ?auto_631263 ) ) ( not ( = ?auto_631259 ?auto_631264 ) ) ( not ( = ?auto_631260 ?auto_631261 ) ) ( not ( = ?auto_631260 ?auto_631262 ) ) ( not ( = ?auto_631260 ?auto_631263 ) ) ( not ( = ?auto_631260 ?auto_631264 ) ) ( not ( = ?auto_631261 ?auto_631262 ) ) ( not ( = ?auto_631261 ?auto_631263 ) ) ( not ( = ?auto_631261 ?auto_631264 ) ) ( not ( = ?auto_631262 ?auto_631263 ) ) ( not ( = ?auto_631262 ?auto_631264 ) ) ( not ( = ?auto_631263 ?auto_631264 ) ) ( CLEAR ?auto_631261 ) ( ON ?auto_631262 ?auto_631263 ) ( CLEAR ?auto_631262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_631250 ?auto_631251 ?auto_631252 ?auto_631253 ?auto_631254 ?auto_631255 ?auto_631256 ?auto_631257 ?auto_631258 ?auto_631259 ?auto_631260 ?auto_631261 ?auto_631262 )
      ( MAKE-14PILE ?auto_631250 ?auto_631251 ?auto_631252 ?auto_631253 ?auto_631254 ?auto_631255 ?auto_631256 ?auto_631257 ?auto_631258 ?auto_631259 ?auto_631260 ?auto_631261 ?auto_631262 ?auto_631263 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631308 - BLOCK
      ?auto_631309 - BLOCK
      ?auto_631310 - BLOCK
      ?auto_631311 - BLOCK
      ?auto_631312 - BLOCK
      ?auto_631313 - BLOCK
      ?auto_631314 - BLOCK
      ?auto_631315 - BLOCK
      ?auto_631316 - BLOCK
      ?auto_631317 - BLOCK
      ?auto_631318 - BLOCK
      ?auto_631319 - BLOCK
      ?auto_631320 - BLOCK
      ?auto_631321 - BLOCK
    )
    :vars
    (
      ?auto_631322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631321 ?auto_631322 ) ( ON-TABLE ?auto_631308 ) ( ON ?auto_631309 ?auto_631308 ) ( ON ?auto_631310 ?auto_631309 ) ( ON ?auto_631311 ?auto_631310 ) ( ON ?auto_631312 ?auto_631311 ) ( ON ?auto_631313 ?auto_631312 ) ( ON ?auto_631314 ?auto_631313 ) ( ON ?auto_631315 ?auto_631314 ) ( ON ?auto_631316 ?auto_631315 ) ( ON ?auto_631317 ?auto_631316 ) ( ON ?auto_631318 ?auto_631317 ) ( not ( = ?auto_631308 ?auto_631309 ) ) ( not ( = ?auto_631308 ?auto_631310 ) ) ( not ( = ?auto_631308 ?auto_631311 ) ) ( not ( = ?auto_631308 ?auto_631312 ) ) ( not ( = ?auto_631308 ?auto_631313 ) ) ( not ( = ?auto_631308 ?auto_631314 ) ) ( not ( = ?auto_631308 ?auto_631315 ) ) ( not ( = ?auto_631308 ?auto_631316 ) ) ( not ( = ?auto_631308 ?auto_631317 ) ) ( not ( = ?auto_631308 ?auto_631318 ) ) ( not ( = ?auto_631308 ?auto_631319 ) ) ( not ( = ?auto_631308 ?auto_631320 ) ) ( not ( = ?auto_631308 ?auto_631321 ) ) ( not ( = ?auto_631308 ?auto_631322 ) ) ( not ( = ?auto_631309 ?auto_631310 ) ) ( not ( = ?auto_631309 ?auto_631311 ) ) ( not ( = ?auto_631309 ?auto_631312 ) ) ( not ( = ?auto_631309 ?auto_631313 ) ) ( not ( = ?auto_631309 ?auto_631314 ) ) ( not ( = ?auto_631309 ?auto_631315 ) ) ( not ( = ?auto_631309 ?auto_631316 ) ) ( not ( = ?auto_631309 ?auto_631317 ) ) ( not ( = ?auto_631309 ?auto_631318 ) ) ( not ( = ?auto_631309 ?auto_631319 ) ) ( not ( = ?auto_631309 ?auto_631320 ) ) ( not ( = ?auto_631309 ?auto_631321 ) ) ( not ( = ?auto_631309 ?auto_631322 ) ) ( not ( = ?auto_631310 ?auto_631311 ) ) ( not ( = ?auto_631310 ?auto_631312 ) ) ( not ( = ?auto_631310 ?auto_631313 ) ) ( not ( = ?auto_631310 ?auto_631314 ) ) ( not ( = ?auto_631310 ?auto_631315 ) ) ( not ( = ?auto_631310 ?auto_631316 ) ) ( not ( = ?auto_631310 ?auto_631317 ) ) ( not ( = ?auto_631310 ?auto_631318 ) ) ( not ( = ?auto_631310 ?auto_631319 ) ) ( not ( = ?auto_631310 ?auto_631320 ) ) ( not ( = ?auto_631310 ?auto_631321 ) ) ( not ( = ?auto_631310 ?auto_631322 ) ) ( not ( = ?auto_631311 ?auto_631312 ) ) ( not ( = ?auto_631311 ?auto_631313 ) ) ( not ( = ?auto_631311 ?auto_631314 ) ) ( not ( = ?auto_631311 ?auto_631315 ) ) ( not ( = ?auto_631311 ?auto_631316 ) ) ( not ( = ?auto_631311 ?auto_631317 ) ) ( not ( = ?auto_631311 ?auto_631318 ) ) ( not ( = ?auto_631311 ?auto_631319 ) ) ( not ( = ?auto_631311 ?auto_631320 ) ) ( not ( = ?auto_631311 ?auto_631321 ) ) ( not ( = ?auto_631311 ?auto_631322 ) ) ( not ( = ?auto_631312 ?auto_631313 ) ) ( not ( = ?auto_631312 ?auto_631314 ) ) ( not ( = ?auto_631312 ?auto_631315 ) ) ( not ( = ?auto_631312 ?auto_631316 ) ) ( not ( = ?auto_631312 ?auto_631317 ) ) ( not ( = ?auto_631312 ?auto_631318 ) ) ( not ( = ?auto_631312 ?auto_631319 ) ) ( not ( = ?auto_631312 ?auto_631320 ) ) ( not ( = ?auto_631312 ?auto_631321 ) ) ( not ( = ?auto_631312 ?auto_631322 ) ) ( not ( = ?auto_631313 ?auto_631314 ) ) ( not ( = ?auto_631313 ?auto_631315 ) ) ( not ( = ?auto_631313 ?auto_631316 ) ) ( not ( = ?auto_631313 ?auto_631317 ) ) ( not ( = ?auto_631313 ?auto_631318 ) ) ( not ( = ?auto_631313 ?auto_631319 ) ) ( not ( = ?auto_631313 ?auto_631320 ) ) ( not ( = ?auto_631313 ?auto_631321 ) ) ( not ( = ?auto_631313 ?auto_631322 ) ) ( not ( = ?auto_631314 ?auto_631315 ) ) ( not ( = ?auto_631314 ?auto_631316 ) ) ( not ( = ?auto_631314 ?auto_631317 ) ) ( not ( = ?auto_631314 ?auto_631318 ) ) ( not ( = ?auto_631314 ?auto_631319 ) ) ( not ( = ?auto_631314 ?auto_631320 ) ) ( not ( = ?auto_631314 ?auto_631321 ) ) ( not ( = ?auto_631314 ?auto_631322 ) ) ( not ( = ?auto_631315 ?auto_631316 ) ) ( not ( = ?auto_631315 ?auto_631317 ) ) ( not ( = ?auto_631315 ?auto_631318 ) ) ( not ( = ?auto_631315 ?auto_631319 ) ) ( not ( = ?auto_631315 ?auto_631320 ) ) ( not ( = ?auto_631315 ?auto_631321 ) ) ( not ( = ?auto_631315 ?auto_631322 ) ) ( not ( = ?auto_631316 ?auto_631317 ) ) ( not ( = ?auto_631316 ?auto_631318 ) ) ( not ( = ?auto_631316 ?auto_631319 ) ) ( not ( = ?auto_631316 ?auto_631320 ) ) ( not ( = ?auto_631316 ?auto_631321 ) ) ( not ( = ?auto_631316 ?auto_631322 ) ) ( not ( = ?auto_631317 ?auto_631318 ) ) ( not ( = ?auto_631317 ?auto_631319 ) ) ( not ( = ?auto_631317 ?auto_631320 ) ) ( not ( = ?auto_631317 ?auto_631321 ) ) ( not ( = ?auto_631317 ?auto_631322 ) ) ( not ( = ?auto_631318 ?auto_631319 ) ) ( not ( = ?auto_631318 ?auto_631320 ) ) ( not ( = ?auto_631318 ?auto_631321 ) ) ( not ( = ?auto_631318 ?auto_631322 ) ) ( not ( = ?auto_631319 ?auto_631320 ) ) ( not ( = ?auto_631319 ?auto_631321 ) ) ( not ( = ?auto_631319 ?auto_631322 ) ) ( not ( = ?auto_631320 ?auto_631321 ) ) ( not ( = ?auto_631320 ?auto_631322 ) ) ( not ( = ?auto_631321 ?auto_631322 ) ) ( ON ?auto_631320 ?auto_631321 ) ( CLEAR ?auto_631318 ) ( ON ?auto_631319 ?auto_631320 ) ( CLEAR ?auto_631319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_631308 ?auto_631309 ?auto_631310 ?auto_631311 ?auto_631312 ?auto_631313 ?auto_631314 ?auto_631315 ?auto_631316 ?auto_631317 ?auto_631318 ?auto_631319 )
      ( MAKE-14PILE ?auto_631308 ?auto_631309 ?auto_631310 ?auto_631311 ?auto_631312 ?auto_631313 ?auto_631314 ?auto_631315 ?auto_631316 ?auto_631317 ?auto_631318 ?auto_631319 ?auto_631320 ?auto_631321 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631366 - BLOCK
      ?auto_631367 - BLOCK
      ?auto_631368 - BLOCK
      ?auto_631369 - BLOCK
      ?auto_631370 - BLOCK
      ?auto_631371 - BLOCK
      ?auto_631372 - BLOCK
      ?auto_631373 - BLOCK
      ?auto_631374 - BLOCK
      ?auto_631375 - BLOCK
      ?auto_631376 - BLOCK
      ?auto_631377 - BLOCK
      ?auto_631378 - BLOCK
      ?auto_631379 - BLOCK
    )
    :vars
    (
      ?auto_631380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631379 ?auto_631380 ) ( ON-TABLE ?auto_631366 ) ( ON ?auto_631367 ?auto_631366 ) ( ON ?auto_631368 ?auto_631367 ) ( ON ?auto_631369 ?auto_631368 ) ( ON ?auto_631370 ?auto_631369 ) ( ON ?auto_631371 ?auto_631370 ) ( ON ?auto_631372 ?auto_631371 ) ( ON ?auto_631373 ?auto_631372 ) ( ON ?auto_631374 ?auto_631373 ) ( ON ?auto_631375 ?auto_631374 ) ( not ( = ?auto_631366 ?auto_631367 ) ) ( not ( = ?auto_631366 ?auto_631368 ) ) ( not ( = ?auto_631366 ?auto_631369 ) ) ( not ( = ?auto_631366 ?auto_631370 ) ) ( not ( = ?auto_631366 ?auto_631371 ) ) ( not ( = ?auto_631366 ?auto_631372 ) ) ( not ( = ?auto_631366 ?auto_631373 ) ) ( not ( = ?auto_631366 ?auto_631374 ) ) ( not ( = ?auto_631366 ?auto_631375 ) ) ( not ( = ?auto_631366 ?auto_631376 ) ) ( not ( = ?auto_631366 ?auto_631377 ) ) ( not ( = ?auto_631366 ?auto_631378 ) ) ( not ( = ?auto_631366 ?auto_631379 ) ) ( not ( = ?auto_631366 ?auto_631380 ) ) ( not ( = ?auto_631367 ?auto_631368 ) ) ( not ( = ?auto_631367 ?auto_631369 ) ) ( not ( = ?auto_631367 ?auto_631370 ) ) ( not ( = ?auto_631367 ?auto_631371 ) ) ( not ( = ?auto_631367 ?auto_631372 ) ) ( not ( = ?auto_631367 ?auto_631373 ) ) ( not ( = ?auto_631367 ?auto_631374 ) ) ( not ( = ?auto_631367 ?auto_631375 ) ) ( not ( = ?auto_631367 ?auto_631376 ) ) ( not ( = ?auto_631367 ?auto_631377 ) ) ( not ( = ?auto_631367 ?auto_631378 ) ) ( not ( = ?auto_631367 ?auto_631379 ) ) ( not ( = ?auto_631367 ?auto_631380 ) ) ( not ( = ?auto_631368 ?auto_631369 ) ) ( not ( = ?auto_631368 ?auto_631370 ) ) ( not ( = ?auto_631368 ?auto_631371 ) ) ( not ( = ?auto_631368 ?auto_631372 ) ) ( not ( = ?auto_631368 ?auto_631373 ) ) ( not ( = ?auto_631368 ?auto_631374 ) ) ( not ( = ?auto_631368 ?auto_631375 ) ) ( not ( = ?auto_631368 ?auto_631376 ) ) ( not ( = ?auto_631368 ?auto_631377 ) ) ( not ( = ?auto_631368 ?auto_631378 ) ) ( not ( = ?auto_631368 ?auto_631379 ) ) ( not ( = ?auto_631368 ?auto_631380 ) ) ( not ( = ?auto_631369 ?auto_631370 ) ) ( not ( = ?auto_631369 ?auto_631371 ) ) ( not ( = ?auto_631369 ?auto_631372 ) ) ( not ( = ?auto_631369 ?auto_631373 ) ) ( not ( = ?auto_631369 ?auto_631374 ) ) ( not ( = ?auto_631369 ?auto_631375 ) ) ( not ( = ?auto_631369 ?auto_631376 ) ) ( not ( = ?auto_631369 ?auto_631377 ) ) ( not ( = ?auto_631369 ?auto_631378 ) ) ( not ( = ?auto_631369 ?auto_631379 ) ) ( not ( = ?auto_631369 ?auto_631380 ) ) ( not ( = ?auto_631370 ?auto_631371 ) ) ( not ( = ?auto_631370 ?auto_631372 ) ) ( not ( = ?auto_631370 ?auto_631373 ) ) ( not ( = ?auto_631370 ?auto_631374 ) ) ( not ( = ?auto_631370 ?auto_631375 ) ) ( not ( = ?auto_631370 ?auto_631376 ) ) ( not ( = ?auto_631370 ?auto_631377 ) ) ( not ( = ?auto_631370 ?auto_631378 ) ) ( not ( = ?auto_631370 ?auto_631379 ) ) ( not ( = ?auto_631370 ?auto_631380 ) ) ( not ( = ?auto_631371 ?auto_631372 ) ) ( not ( = ?auto_631371 ?auto_631373 ) ) ( not ( = ?auto_631371 ?auto_631374 ) ) ( not ( = ?auto_631371 ?auto_631375 ) ) ( not ( = ?auto_631371 ?auto_631376 ) ) ( not ( = ?auto_631371 ?auto_631377 ) ) ( not ( = ?auto_631371 ?auto_631378 ) ) ( not ( = ?auto_631371 ?auto_631379 ) ) ( not ( = ?auto_631371 ?auto_631380 ) ) ( not ( = ?auto_631372 ?auto_631373 ) ) ( not ( = ?auto_631372 ?auto_631374 ) ) ( not ( = ?auto_631372 ?auto_631375 ) ) ( not ( = ?auto_631372 ?auto_631376 ) ) ( not ( = ?auto_631372 ?auto_631377 ) ) ( not ( = ?auto_631372 ?auto_631378 ) ) ( not ( = ?auto_631372 ?auto_631379 ) ) ( not ( = ?auto_631372 ?auto_631380 ) ) ( not ( = ?auto_631373 ?auto_631374 ) ) ( not ( = ?auto_631373 ?auto_631375 ) ) ( not ( = ?auto_631373 ?auto_631376 ) ) ( not ( = ?auto_631373 ?auto_631377 ) ) ( not ( = ?auto_631373 ?auto_631378 ) ) ( not ( = ?auto_631373 ?auto_631379 ) ) ( not ( = ?auto_631373 ?auto_631380 ) ) ( not ( = ?auto_631374 ?auto_631375 ) ) ( not ( = ?auto_631374 ?auto_631376 ) ) ( not ( = ?auto_631374 ?auto_631377 ) ) ( not ( = ?auto_631374 ?auto_631378 ) ) ( not ( = ?auto_631374 ?auto_631379 ) ) ( not ( = ?auto_631374 ?auto_631380 ) ) ( not ( = ?auto_631375 ?auto_631376 ) ) ( not ( = ?auto_631375 ?auto_631377 ) ) ( not ( = ?auto_631375 ?auto_631378 ) ) ( not ( = ?auto_631375 ?auto_631379 ) ) ( not ( = ?auto_631375 ?auto_631380 ) ) ( not ( = ?auto_631376 ?auto_631377 ) ) ( not ( = ?auto_631376 ?auto_631378 ) ) ( not ( = ?auto_631376 ?auto_631379 ) ) ( not ( = ?auto_631376 ?auto_631380 ) ) ( not ( = ?auto_631377 ?auto_631378 ) ) ( not ( = ?auto_631377 ?auto_631379 ) ) ( not ( = ?auto_631377 ?auto_631380 ) ) ( not ( = ?auto_631378 ?auto_631379 ) ) ( not ( = ?auto_631378 ?auto_631380 ) ) ( not ( = ?auto_631379 ?auto_631380 ) ) ( ON ?auto_631378 ?auto_631379 ) ( ON ?auto_631377 ?auto_631378 ) ( CLEAR ?auto_631375 ) ( ON ?auto_631376 ?auto_631377 ) ( CLEAR ?auto_631376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_631366 ?auto_631367 ?auto_631368 ?auto_631369 ?auto_631370 ?auto_631371 ?auto_631372 ?auto_631373 ?auto_631374 ?auto_631375 ?auto_631376 )
      ( MAKE-14PILE ?auto_631366 ?auto_631367 ?auto_631368 ?auto_631369 ?auto_631370 ?auto_631371 ?auto_631372 ?auto_631373 ?auto_631374 ?auto_631375 ?auto_631376 ?auto_631377 ?auto_631378 ?auto_631379 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631424 - BLOCK
      ?auto_631425 - BLOCK
      ?auto_631426 - BLOCK
      ?auto_631427 - BLOCK
      ?auto_631428 - BLOCK
      ?auto_631429 - BLOCK
      ?auto_631430 - BLOCK
      ?auto_631431 - BLOCK
      ?auto_631432 - BLOCK
      ?auto_631433 - BLOCK
      ?auto_631434 - BLOCK
      ?auto_631435 - BLOCK
      ?auto_631436 - BLOCK
      ?auto_631437 - BLOCK
    )
    :vars
    (
      ?auto_631438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631437 ?auto_631438 ) ( ON-TABLE ?auto_631424 ) ( ON ?auto_631425 ?auto_631424 ) ( ON ?auto_631426 ?auto_631425 ) ( ON ?auto_631427 ?auto_631426 ) ( ON ?auto_631428 ?auto_631427 ) ( ON ?auto_631429 ?auto_631428 ) ( ON ?auto_631430 ?auto_631429 ) ( ON ?auto_631431 ?auto_631430 ) ( ON ?auto_631432 ?auto_631431 ) ( not ( = ?auto_631424 ?auto_631425 ) ) ( not ( = ?auto_631424 ?auto_631426 ) ) ( not ( = ?auto_631424 ?auto_631427 ) ) ( not ( = ?auto_631424 ?auto_631428 ) ) ( not ( = ?auto_631424 ?auto_631429 ) ) ( not ( = ?auto_631424 ?auto_631430 ) ) ( not ( = ?auto_631424 ?auto_631431 ) ) ( not ( = ?auto_631424 ?auto_631432 ) ) ( not ( = ?auto_631424 ?auto_631433 ) ) ( not ( = ?auto_631424 ?auto_631434 ) ) ( not ( = ?auto_631424 ?auto_631435 ) ) ( not ( = ?auto_631424 ?auto_631436 ) ) ( not ( = ?auto_631424 ?auto_631437 ) ) ( not ( = ?auto_631424 ?auto_631438 ) ) ( not ( = ?auto_631425 ?auto_631426 ) ) ( not ( = ?auto_631425 ?auto_631427 ) ) ( not ( = ?auto_631425 ?auto_631428 ) ) ( not ( = ?auto_631425 ?auto_631429 ) ) ( not ( = ?auto_631425 ?auto_631430 ) ) ( not ( = ?auto_631425 ?auto_631431 ) ) ( not ( = ?auto_631425 ?auto_631432 ) ) ( not ( = ?auto_631425 ?auto_631433 ) ) ( not ( = ?auto_631425 ?auto_631434 ) ) ( not ( = ?auto_631425 ?auto_631435 ) ) ( not ( = ?auto_631425 ?auto_631436 ) ) ( not ( = ?auto_631425 ?auto_631437 ) ) ( not ( = ?auto_631425 ?auto_631438 ) ) ( not ( = ?auto_631426 ?auto_631427 ) ) ( not ( = ?auto_631426 ?auto_631428 ) ) ( not ( = ?auto_631426 ?auto_631429 ) ) ( not ( = ?auto_631426 ?auto_631430 ) ) ( not ( = ?auto_631426 ?auto_631431 ) ) ( not ( = ?auto_631426 ?auto_631432 ) ) ( not ( = ?auto_631426 ?auto_631433 ) ) ( not ( = ?auto_631426 ?auto_631434 ) ) ( not ( = ?auto_631426 ?auto_631435 ) ) ( not ( = ?auto_631426 ?auto_631436 ) ) ( not ( = ?auto_631426 ?auto_631437 ) ) ( not ( = ?auto_631426 ?auto_631438 ) ) ( not ( = ?auto_631427 ?auto_631428 ) ) ( not ( = ?auto_631427 ?auto_631429 ) ) ( not ( = ?auto_631427 ?auto_631430 ) ) ( not ( = ?auto_631427 ?auto_631431 ) ) ( not ( = ?auto_631427 ?auto_631432 ) ) ( not ( = ?auto_631427 ?auto_631433 ) ) ( not ( = ?auto_631427 ?auto_631434 ) ) ( not ( = ?auto_631427 ?auto_631435 ) ) ( not ( = ?auto_631427 ?auto_631436 ) ) ( not ( = ?auto_631427 ?auto_631437 ) ) ( not ( = ?auto_631427 ?auto_631438 ) ) ( not ( = ?auto_631428 ?auto_631429 ) ) ( not ( = ?auto_631428 ?auto_631430 ) ) ( not ( = ?auto_631428 ?auto_631431 ) ) ( not ( = ?auto_631428 ?auto_631432 ) ) ( not ( = ?auto_631428 ?auto_631433 ) ) ( not ( = ?auto_631428 ?auto_631434 ) ) ( not ( = ?auto_631428 ?auto_631435 ) ) ( not ( = ?auto_631428 ?auto_631436 ) ) ( not ( = ?auto_631428 ?auto_631437 ) ) ( not ( = ?auto_631428 ?auto_631438 ) ) ( not ( = ?auto_631429 ?auto_631430 ) ) ( not ( = ?auto_631429 ?auto_631431 ) ) ( not ( = ?auto_631429 ?auto_631432 ) ) ( not ( = ?auto_631429 ?auto_631433 ) ) ( not ( = ?auto_631429 ?auto_631434 ) ) ( not ( = ?auto_631429 ?auto_631435 ) ) ( not ( = ?auto_631429 ?auto_631436 ) ) ( not ( = ?auto_631429 ?auto_631437 ) ) ( not ( = ?auto_631429 ?auto_631438 ) ) ( not ( = ?auto_631430 ?auto_631431 ) ) ( not ( = ?auto_631430 ?auto_631432 ) ) ( not ( = ?auto_631430 ?auto_631433 ) ) ( not ( = ?auto_631430 ?auto_631434 ) ) ( not ( = ?auto_631430 ?auto_631435 ) ) ( not ( = ?auto_631430 ?auto_631436 ) ) ( not ( = ?auto_631430 ?auto_631437 ) ) ( not ( = ?auto_631430 ?auto_631438 ) ) ( not ( = ?auto_631431 ?auto_631432 ) ) ( not ( = ?auto_631431 ?auto_631433 ) ) ( not ( = ?auto_631431 ?auto_631434 ) ) ( not ( = ?auto_631431 ?auto_631435 ) ) ( not ( = ?auto_631431 ?auto_631436 ) ) ( not ( = ?auto_631431 ?auto_631437 ) ) ( not ( = ?auto_631431 ?auto_631438 ) ) ( not ( = ?auto_631432 ?auto_631433 ) ) ( not ( = ?auto_631432 ?auto_631434 ) ) ( not ( = ?auto_631432 ?auto_631435 ) ) ( not ( = ?auto_631432 ?auto_631436 ) ) ( not ( = ?auto_631432 ?auto_631437 ) ) ( not ( = ?auto_631432 ?auto_631438 ) ) ( not ( = ?auto_631433 ?auto_631434 ) ) ( not ( = ?auto_631433 ?auto_631435 ) ) ( not ( = ?auto_631433 ?auto_631436 ) ) ( not ( = ?auto_631433 ?auto_631437 ) ) ( not ( = ?auto_631433 ?auto_631438 ) ) ( not ( = ?auto_631434 ?auto_631435 ) ) ( not ( = ?auto_631434 ?auto_631436 ) ) ( not ( = ?auto_631434 ?auto_631437 ) ) ( not ( = ?auto_631434 ?auto_631438 ) ) ( not ( = ?auto_631435 ?auto_631436 ) ) ( not ( = ?auto_631435 ?auto_631437 ) ) ( not ( = ?auto_631435 ?auto_631438 ) ) ( not ( = ?auto_631436 ?auto_631437 ) ) ( not ( = ?auto_631436 ?auto_631438 ) ) ( not ( = ?auto_631437 ?auto_631438 ) ) ( ON ?auto_631436 ?auto_631437 ) ( ON ?auto_631435 ?auto_631436 ) ( ON ?auto_631434 ?auto_631435 ) ( CLEAR ?auto_631432 ) ( ON ?auto_631433 ?auto_631434 ) ( CLEAR ?auto_631433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_631424 ?auto_631425 ?auto_631426 ?auto_631427 ?auto_631428 ?auto_631429 ?auto_631430 ?auto_631431 ?auto_631432 ?auto_631433 )
      ( MAKE-14PILE ?auto_631424 ?auto_631425 ?auto_631426 ?auto_631427 ?auto_631428 ?auto_631429 ?auto_631430 ?auto_631431 ?auto_631432 ?auto_631433 ?auto_631434 ?auto_631435 ?auto_631436 ?auto_631437 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631482 - BLOCK
      ?auto_631483 - BLOCK
      ?auto_631484 - BLOCK
      ?auto_631485 - BLOCK
      ?auto_631486 - BLOCK
      ?auto_631487 - BLOCK
      ?auto_631488 - BLOCK
      ?auto_631489 - BLOCK
      ?auto_631490 - BLOCK
      ?auto_631491 - BLOCK
      ?auto_631492 - BLOCK
      ?auto_631493 - BLOCK
      ?auto_631494 - BLOCK
      ?auto_631495 - BLOCK
    )
    :vars
    (
      ?auto_631496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631495 ?auto_631496 ) ( ON-TABLE ?auto_631482 ) ( ON ?auto_631483 ?auto_631482 ) ( ON ?auto_631484 ?auto_631483 ) ( ON ?auto_631485 ?auto_631484 ) ( ON ?auto_631486 ?auto_631485 ) ( ON ?auto_631487 ?auto_631486 ) ( ON ?auto_631488 ?auto_631487 ) ( ON ?auto_631489 ?auto_631488 ) ( not ( = ?auto_631482 ?auto_631483 ) ) ( not ( = ?auto_631482 ?auto_631484 ) ) ( not ( = ?auto_631482 ?auto_631485 ) ) ( not ( = ?auto_631482 ?auto_631486 ) ) ( not ( = ?auto_631482 ?auto_631487 ) ) ( not ( = ?auto_631482 ?auto_631488 ) ) ( not ( = ?auto_631482 ?auto_631489 ) ) ( not ( = ?auto_631482 ?auto_631490 ) ) ( not ( = ?auto_631482 ?auto_631491 ) ) ( not ( = ?auto_631482 ?auto_631492 ) ) ( not ( = ?auto_631482 ?auto_631493 ) ) ( not ( = ?auto_631482 ?auto_631494 ) ) ( not ( = ?auto_631482 ?auto_631495 ) ) ( not ( = ?auto_631482 ?auto_631496 ) ) ( not ( = ?auto_631483 ?auto_631484 ) ) ( not ( = ?auto_631483 ?auto_631485 ) ) ( not ( = ?auto_631483 ?auto_631486 ) ) ( not ( = ?auto_631483 ?auto_631487 ) ) ( not ( = ?auto_631483 ?auto_631488 ) ) ( not ( = ?auto_631483 ?auto_631489 ) ) ( not ( = ?auto_631483 ?auto_631490 ) ) ( not ( = ?auto_631483 ?auto_631491 ) ) ( not ( = ?auto_631483 ?auto_631492 ) ) ( not ( = ?auto_631483 ?auto_631493 ) ) ( not ( = ?auto_631483 ?auto_631494 ) ) ( not ( = ?auto_631483 ?auto_631495 ) ) ( not ( = ?auto_631483 ?auto_631496 ) ) ( not ( = ?auto_631484 ?auto_631485 ) ) ( not ( = ?auto_631484 ?auto_631486 ) ) ( not ( = ?auto_631484 ?auto_631487 ) ) ( not ( = ?auto_631484 ?auto_631488 ) ) ( not ( = ?auto_631484 ?auto_631489 ) ) ( not ( = ?auto_631484 ?auto_631490 ) ) ( not ( = ?auto_631484 ?auto_631491 ) ) ( not ( = ?auto_631484 ?auto_631492 ) ) ( not ( = ?auto_631484 ?auto_631493 ) ) ( not ( = ?auto_631484 ?auto_631494 ) ) ( not ( = ?auto_631484 ?auto_631495 ) ) ( not ( = ?auto_631484 ?auto_631496 ) ) ( not ( = ?auto_631485 ?auto_631486 ) ) ( not ( = ?auto_631485 ?auto_631487 ) ) ( not ( = ?auto_631485 ?auto_631488 ) ) ( not ( = ?auto_631485 ?auto_631489 ) ) ( not ( = ?auto_631485 ?auto_631490 ) ) ( not ( = ?auto_631485 ?auto_631491 ) ) ( not ( = ?auto_631485 ?auto_631492 ) ) ( not ( = ?auto_631485 ?auto_631493 ) ) ( not ( = ?auto_631485 ?auto_631494 ) ) ( not ( = ?auto_631485 ?auto_631495 ) ) ( not ( = ?auto_631485 ?auto_631496 ) ) ( not ( = ?auto_631486 ?auto_631487 ) ) ( not ( = ?auto_631486 ?auto_631488 ) ) ( not ( = ?auto_631486 ?auto_631489 ) ) ( not ( = ?auto_631486 ?auto_631490 ) ) ( not ( = ?auto_631486 ?auto_631491 ) ) ( not ( = ?auto_631486 ?auto_631492 ) ) ( not ( = ?auto_631486 ?auto_631493 ) ) ( not ( = ?auto_631486 ?auto_631494 ) ) ( not ( = ?auto_631486 ?auto_631495 ) ) ( not ( = ?auto_631486 ?auto_631496 ) ) ( not ( = ?auto_631487 ?auto_631488 ) ) ( not ( = ?auto_631487 ?auto_631489 ) ) ( not ( = ?auto_631487 ?auto_631490 ) ) ( not ( = ?auto_631487 ?auto_631491 ) ) ( not ( = ?auto_631487 ?auto_631492 ) ) ( not ( = ?auto_631487 ?auto_631493 ) ) ( not ( = ?auto_631487 ?auto_631494 ) ) ( not ( = ?auto_631487 ?auto_631495 ) ) ( not ( = ?auto_631487 ?auto_631496 ) ) ( not ( = ?auto_631488 ?auto_631489 ) ) ( not ( = ?auto_631488 ?auto_631490 ) ) ( not ( = ?auto_631488 ?auto_631491 ) ) ( not ( = ?auto_631488 ?auto_631492 ) ) ( not ( = ?auto_631488 ?auto_631493 ) ) ( not ( = ?auto_631488 ?auto_631494 ) ) ( not ( = ?auto_631488 ?auto_631495 ) ) ( not ( = ?auto_631488 ?auto_631496 ) ) ( not ( = ?auto_631489 ?auto_631490 ) ) ( not ( = ?auto_631489 ?auto_631491 ) ) ( not ( = ?auto_631489 ?auto_631492 ) ) ( not ( = ?auto_631489 ?auto_631493 ) ) ( not ( = ?auto_631489 ?auto_631494 ) ) ( not ( = ?auto_631489 ?auto_631495 ) ) ( not ( = ?auto_631489 ?auto_631496 ) ) ( not ( = ?auto_631490 ?auto_631491 ) ) ( not ( = ?auto_631490 ?auto_631492 ) ) ( not ( = ?auto_631490 ?auto_631493 ) ) ( not ( = ?auto_631490 ?auto_631494 ) ) ( not ( = ?auto_631490 ?auto_631495 ) ) ( not ( = ?auto_631490 ?auto_631496 ) ) ( not ( = ?auto_631491 ?auto_631492 ) ) ( not ( = ?auto_631491 ?auto_631493 ) ) ( not ( = ?auto_631491 ?auto_631494 ) ) ( not ( = ?auto_631491 ?auto_631495 ) ) ( not ( = ?auto_631491 ?auto_631496 ) ) ( not ( = ?auto_631492 ?auto_631493 ) ) ( not ( = ?auto_631492 ?auto_631494 ) ) ( not ( = ?auto_631492 ?auto_631495 ) ) ( not ( = ?auto_631492 ?auto_631496 ) ) ( not ( = ?auto_631493 ?auto_631494 ) ) ( not ( = ?auto_631493 ?auto_631495 ) ) ( not ( = ?auto_631493 ?auto_631496 ) ) ( not ( = ?auto_631494 ?auto_631495 ) ) ( not ( = ?auto_631494 ?auto_631496 ) ) ( not ( = ?auto_631495 ?auto_631496 ) ) ( ON ?auto_631494 ?auto_631495 ) ( ON ?auto_631493 ?auto_631494 ) ( ON ?auto_631492 ?auto_631493 ) ( ON ?auto_631491 ?auto_631492 ) ( CLEAR ?auto_631489 ) ( ON ?auto_631490 ?auto_631491 ) ( CLEAR ?auto_631490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_631482 ?auto_631483 ?auto_631484 ?auto_631485 ?auto_631486 ?auto_631487 ?auto_631488 ?auto_631489 ?auto_631490 )
      ( MAKE-14PILE ?auto_631482 ?auto_631483 ?auto_631484 ?auto_631485 ?auto_631486 ?auto_631487 ?auto_631488 ?auto_631489 ?auto_631490 ?auto_631491 ?auto_631492 ?auto_631493 ?auto_631494 ?auto_631495 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631540 - BLOCK
      ?auto_631541 - BLOCK
      ?auto_631542 - BLOCK
      ?auto_631543 - BLOCK
      ?auto_631544 - BLOCK
      ?auto_631545 - BLOCK
      ?auto_631546 - BLOCK
      ?auto_631547 - BLOCK
      ?auto_631548 - BLOCK
      ?auto_631549 - BLOCK
      ?auto_631550 - BLOCK
      ?auto_631551 - BLOCK
      ?auto_631552 - BLOCK
      ?auto_631553 - BLOCK
    )
    :vars
    (
      ?auto_631554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631553 ?auto_631554 ) ( ON-TABLE ?auto_631540 ) ( ON ?auto_631541 ?auto_631540 ) ( ON ?auto_631542 ?auto_631541 ) ( ON ?auto_631543 ?auto_631542 ) ( ON ?auto_631544 ?auto_631543 ) ( ON ?auto_631545 ?auto_631544 ) ( ON ?auto_631546 ?auto_631545 ) ( not ( = ?auto_631540 ?auto_631541 ) ) ( not ( = ?auto_631540 ?auto_631542 ) ) ( not ( = ?auto_631540 ?auto_631543 ) ) ( not ( = ?auto_631540 ?auto_631544 ) ) ( not ( = ?auto_631540 ?auto_631545 ) ) ( not ( = ?auto_631540 ?auto_631546 ) ) ( not ( = ?auto_631540 ?auto_631547 ) ) ( not ( = ?auto_631540 ?auto_631548 ) ) ( not ( = ?auto_631540 ?auto_631549 ) ) ( not ( = ?auto_631540 ?auto_631550 ) ) ( not ( = ?auto_631540 ?auto_631551 ) ) ( not ( = ?auto_631540 ?auto_631552 ) ) ( not ( = ?auto_631540 ?auto_631553 ) ) ( not ( = ?auto_631540 ?auto_631554 ) ) ( not ( = ?auto_631541 ?auto_631542 ) ) ( not ( = ?auto_631541 ?auto_631543 ) ) ( not ( = ?auto_631541 ?auto_631544 ) ) ( not ( = ?auto_631541 ?auto_631545 ) ) ( not ( = ?auto_631541 ?auto_631546 ) ) ( not ( = ?auto_631541 ?auto_631547 ) ) ( not ( = ?auto_631541 ?auto_631548 ) ) ( not ( = ?auto_631541 ?auto_631549 ) ) ( not ( = ?auto_631541 ?auto_631550 ) ) ( not ( = ?auto_631541 ?auto_631551 ) ) ( not ( = ?auto_631541 ?auto_631552 ) ) ( not ( = ?auto_631541 ?auto_631553 ) ) ( not ( = ?auto_631541 ?auto_631554 ) ) ( not ( = ?auto_631542 ?auto_631543 ) ) ( not ( = ?auto_631542 ?auto_631544 ) ) ( not ( = ?auto_631542 ?auto_631545 ) ) ( not ( = ?auto_631542 ?auto_631546 ) ) ( not ( = ?auto_631542 ?auto_631547 ) ) ( not ( = ?auto_631542 ?auto_631548 ) ) ( not ( = ?auto_631542 ?auto_631549 ) ) ( not ( = ?auto_631542 ?auto_631550 ) ) ( not ( = ?auto_631542 ?auto_631551 ) ) ( not ( = ?auto_631542 ?auto_631552 ) ) ( not ( = ?auto_631542 ?auto_631553 ) ) ( not ( = ?auto_631542 ?auto_631554 ) ) ( not ( = ?auto_631543 ?auto_631544 ) ) ( not ( = ?auto_631543 ?auto_631545 ) ) ( not ( = ?auto_631543 ?auto_631546 ) ) ( not ( = ?auto_631543 ?auto_631547 ) ) ( not ( = ?auto_631543 ?auto_631548 ) ) ( not ( = ?auto_631543 ?auto_631549 ) ) ( not ( = ?auto_631543 ?auto_631550 ) ) ( not ( = ?auto_631543 ?auto_631551 ) ) ( not ( = ?auto_631543 ?auto_631552 ) ) ( not ( = ?auto_631543 ?auto_631553 ) ) ( not ( = ?auto_631543 ?auto_631554 ) ) ( not ( = ?auto_631544 ?auto_631545 ) ) ( not ( = ?auto_631544 ?auto_631546 ) ) ( not ( = ?auto_631544 ?auto_631547 ) ) ( not ( = ?auto_631544 ?auto_631548 ) ) ( not ( = ?auto_631544 ?auto_631549 ) ) ( not ( = ?auto_631544 ?auto_631550 ) ) ( not ( = ?auto_631544 ?auto_631551 ) ) ( not ( = ?auto_631544 ?auto_631552 ) ) ( not ( = ?auto_631544 ?auto_631553 ) ) ( not ( = ?auto_631544 ?auto_631554 ) ) ( not ( = ?auto_631545 ?auto_631546 ) ) ( not ( = ?auto_631545 ?auto_631547 ) ) ( not ( = ?auto_631545 ?auto_631548 ) ) ( not ( = ?auto_631545 ?auto_631549 ) ) ( not ( = ?auto_631545 ?auto_631550 ) ) ( not ( = ?auto_631545 ?auto_631551 ) ) ( not ( = ?auto_631545 ?auto_631552 ) ) ( not ( = ?auto_631545 ?auto_631553 ) ) ( not ( = ?auto_631545 ?auto_631554 ) ) ( not ( = ?auto_631546 ?auto_631547 ) ) ( not ( = ?auto_631546 ?auto_631548 ) ) ( not ( = ?auto_631546 ?auto_631549 ) ) ( not ( = ?auto_631546 ?auto_631550 ) ) ( not ( = ?auto_631546 ?auto_631551 ) ) ( not ( = ?auto_631546 ?auto_631552 ) ) ( not ( = ?auto_631546 ?auto_631553 ) ) ( not ( = ?auto_631546 ?auto_631554 ) ) ( not ( = ?auto_631547 ?auto_631548 ) ) ( not ( = ?auto_631547 ?auto_631549 ) ) ( not ( = ?auto_631547 ?auto_631550 ) ) ( not ( = ?auto_631547 ?auto_631551 ) ) ( not ( = ?auto_631547 ?auto_631552 ) ) ( not ( = ?auto_631547 ?auto_631553 ) ) ( not ( = ?auto_631547 ?auto_631554 ) ) ( not ( = ?auto_631548 ?auto_631549 ) ) ( not ( = ?auto_631548 ?auto_631550 ) ) ( not ( = ?auto_631548 ?auto_631551 ) ) ( not ( = ?auto_631548 ?auto_631552 ) ) ( not ( = ?auto_631548 ?auto_631553 ) ) ( not ( = ?auto_631548 ?auto_631554 ) ) ( not ( = ?auto_631549 ?auto_631550 ) ) ( not ( = ?auto_631549 ?auto_631551 ) ) ( not ( = ?auto_631549 ?auto_631552 ) ) ( not ( = ?auto_631549 ?auto_631553 ) ) ( not ( = ?auto_631549 ?auto_631554 ) ) ( not ( = ?auto_631550 ?auto_631551 ) ) ( not ( = ?auto_631550 ?auto_631552 ) ) ( not ( = ?auto_631550 ?auto_631553 ) ) ( not ( = ?auto_631550 ?auto_631554 ) ) ( not ( = ?auto_631551 ?auto_631552 ) ) ( not ( = ?auto_631551 ?auto_631553 ) ) ( not ( = ?auto_631551 ?auto_631554 ) ) ( not ( = ?auto_631552 ?auto_631553 ) ) ( not ( = ?auto_631552 ?auto_631554 ) ) ( not ( = ?auto_631553 ?auto_631554 ) ) ( ON ?auto_631552 ?auto_631553 ) ( ON ?auto_631551 ?auto_631552 ) ( ON ?auto_631550 ?auto_631551 ) ( ON ?auto_631549 ?auto_631550 ) ( ON ?auto_631548 ?auto_631549 ) ( CLEAR ?auto_631546 ) ( ON ?auto_631547 ?auto_631548 ) ( CLEAR ?auto_631547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_631540 ?auto_631541 ?auto_631542 ?auto_631543 ?auto_631544 ?auto_631545 ?auto_631546 ?auto_631547 )
      ( MAKE-14PILE ?auto_631540 ?auto_631541 ?auto_631542 ?auto_631543 ?auto_631544 ?auto_631545 ?auto_631546 ?auto_631547 ?auto_631548 ?auto_631549 ?auto_631550 ?auto_631551 ?auto_631552 ?auto_631553 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631598 - BLOCK
      ?auto_631599 - BLOCK
      ?auto_631600 - BLOCK
      ?auto_631601 - BLOCK
      ?auto_631602 - BLOCK
      ?auto_631603 - BLOCK
      ?auto_631604 - BLOCK
      ?auto_631605 - BLOCK
      ?auto_631606 - BLOCK
      ?auto_631607 - BLOCK
      ?auto_631608 - BLOCK
      ?auto_631609 - BLOCK
      ?auto_631610 - BLOCK
      ?auto_631611 - BLOCK
    )
    :vars
    (
      ?auto_631612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631611 ?auto_631612 ) ( ON-TABLE ?auto_631598 ) ( ON ?auto_631599 ?auto_631598 ) ( ON ?auto_631600 ?auto_631599 ) ( ON ?auto_631601 ?auto_631600 ) ( ON ?auto_631602 ?auto_631601 ) ( ON ?auto_631603 ?auto_631602 ) ( not ( = ?auto_631598 ?auto_631599 ) ) ( not ( = ?auto_631598 ?auto_631600 ) ) ( not ( = ?auto_631598 ?auto_631601 ) ) ( not ( = ?auto_631598 ?auto_631602 ) ) ( not ( = ?auto_631598 ?auto_631603 ) ) ( not ( = ?auto_631598 ?auto_631604 ) ) ( not ( = ?auto_631598 ?auto_631605 ) ) ( not ( = ?auto_631598 ?auto_631606 ) ) ( not ( = ?auto_631598 ?auto_631607 ) ) ( not ( = ?auto_631598 ?auto_631608 ) ) ( not ( = ?auto_631598 ?auto_631609 ) ) ( not ( = ?auto_631598 ?auto_631610 ) ) ( not ( = ?auto_631598 ?auto_631611 ) ) ( not ( = ?auto_631598 ?auto_631612 ) ) ( not ( = ?auto_631599 ?auto_631600 ) ) ( not ( = ?auto_631599 ?auto_631601 ) ) ( not ( = ?auto_631599 ?auto_631602 ) ) ( not ( = ?auto_631599 ?auto_631603 ) ) ( not ( = ?auto_631599 ?auto_631604 ) ) ( not ( = ?auto_631599 ?auto_631605 ) ) ( not ( = ?auto_631599 ?auto_631606 ) ) ( not ( = ?auto_631599 ?auto_631607 ) ) ( not ( = ?auto_631599 ?auto_631608 ) ) ( not ( = ?auto_631599 ?auto_631609 ) ) ( not ( = ?auto_631599 ?auto_631610 ) ) ( not ( = ?auto_631599 ?auto_631611 ) ) ( not ( = ?auto_631599 ?auto_631612 ) ) ( not ( = ?auto_631600 ?auto_631601 ) ) ( not ( = ?auto_631600 ?auto_631602 ) ) ( not ( = ?auto_631600 ?auto_631603 ) ) ( not ( = ?auto_631600 ?auto_631604 ) ) ( not ( = ?auto_631600 ?auto_631605 ) ) ( not ( = ?auto_631600 ?auto_631606 ) ) ( not ( = ?auto_631600 ?auto_631607 ) ) ( not ( = ?auto_631600 ?auto_631608 ) ) ( not ( = ?auto_631600 ?auto_631609 ) ) ( not ( = ?auto_631600 ?auto_631610 ) ) ( not ( = ?auto_631600 ?auto_631611 ) ) ( not ( = ?auto_631600 ?auto_631612 ) ) ( not ( = ?auto_631601 ?auto_631602 ) ) ( not ( = ?auto_631601 ?auto_631603 ) ) ( not ( = ?auto_631601 ?auto_631604 ) ) ( not ( = ?auto_631601 ?auto_631605 ) ) ( not ( = ?auto_631601 ?auto_631606 ) ) ( not ( = ?auto_631601 ?auto_631607 ) ) ( not ( = ?auto_631601 ?auto_631608 ) ) ( not ( = ?auto_631601 ?auto_631609 ) ) ( not ( = ?auto_631601 ?auto_631610 ) ) ( not ( = ?auto_631601 ?auto_631611 ) ) ( not ( = ?auto_631601 ?auto_631612 ) ) ( not ( = ?auto_631602 ?auto_631603 ) ) ( not ( = ?auto_631602 ?auto_631604 ) ) ( not ( = ?auto_631602 ?auto_631605 ) ) ( not ( = ?auto_631602 ?auto_631606 ) ) ( not ( = ?auto_631602 ?auto_631607 ) ) ( not ( = ?auto_631602 ?auto_631608 ) ) ( not ( = ?auto_631602 ?auto_631609 ) ) ( not ( = ?auto_631602 ?auto_631610 ) ) ( not ( = ?auto_631602 ?auto_631611 ) ) ( not ( = ?auto_631602 ?auto_631612 ) ) ( not ( = ?auto_631603 ?auto_631604 ) ) ( not ( = ?auto_631603 ?auto_631605 ) ) ( not ( = ?auto_631603 ?auto_631606 ) ) ( not ( = ?auto_631603 ?auto_631607 ) ) ( not ( = ?auto_631603 ?auto_631608 ) ) ( not ( = ?auto_631603 ?auto_631609 ) ) ( not ( = ?auto_631603 ?auto_631610 ) ) ( not ( = ?auto_631603 ?auto_631611 ) ) ( not ( = ?auto_631603 ?auto_631612 ) ) ( not ( = ?auto_631604 ?auto_631605 ) ) ( not ( = ?auto_631604 ?auto_631606 ) ) ( not ( = ?auto_631604 ?auto_631607 ) ) ( not ( = ?auto_631604 ?auto_631608 ) ) ( not ( = ?auto_631604 ?auto_631609 ) ) ( not ( = ?auto_631604 ?auto_631610 ) ) ( not ( = ?auto_631604 ?auto_631611 ) ) ( not ( = ?auto_631604 ?auto_631612 ) ) ( not ( = ?auto_631605 ?auto_631606 ) ) ( not ( = ?auto_631605 ?auto_631607 ) ) ( not ( = ?auto_631605 ?auto_631608 ) ) ( not ( = ?auto_631605 ?auto_631609 ) ) ( not ( = ?auto_631605 ?auto_631610 ) ) ( not ( = ?auto_631605 ?auto_631611 ) ) ( not ( = ?auto_631605 ?auto_631612 ) ) ( not ( = ?auto_631606 ?auto_631607 ) ) ( not ( = ?auto_631606 ?auto_631608 ) ) ( not ( = ?auto_631606 ?auto_631609 ) ) ( not ( = ?auto_631606 ?auto_631610 ) ) ( not ( = ?auto_631606 ?auto_631611 ) ) ( not ( = ?auto_631606 ?auto_631612 ) ) ( not ( = ?auto_631607 ?auto_631608 ) ) ( not ( = ?auto_631607 ?auto_631609 ) ) ( not ( = ?auto_631607 ?auto_631610 ) ) ( not ( = ?auto_631607 ?auto_631611 ) ) ( not ( = ?auto_631607 ?auto_631612 ) ) ( not ( = ?auto_631608 ?auto_631609 ) ) ( not ( = ?auto_631608 ?auto_631610 ) ) ( not ( = ?auto_631608 ?auto_631611 ) ) ( not ( = ?auto_631608 ?auto_631612 ) ) ( not ( = ?auto_631609 ?auto_631610 ) ) ( not ( = ?auto_631609 ?auto_631611 ) ) ( not ( = ?auto_631609 ?auto_631612 ) ) ( not ( = ?auto_631610 ?auto_631611 ) ) ( not ( = ?auto_631610 ?auto_631612 ) ) ( not ( = ?auto_631611 ?auto_631612 ) ) ( ON ?auto_631610 ?auto_631611 ) ( ON ?auto_631609 ?auto_631610 ) ( ON ?auto_631608 ?auto_631609 ) ( ON ?auto_631607 ?auto_631608 ) ( ON ?auto_631606 ?auto_631607 ) ( ON ?auto_631605 ?auto_631606 ) ( CLEAR ?auto_631603 ) ( ON ?auto_631604 ?auto_631605 ) ( CLEAR ?auto_631604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_631598 ?auto_631599 ?auto_631600 ?auto_631601 ?auto_631602 ?auto_631603 ?auto_631604 )
      ( MAKE-14PILE ?auto_631598 ?auto_631599 ?auto_631600 ?auto_631601 ?auto_631602 ?auto_631603 ?auto_631604 ?auto_631605 ?auto_631606 ?auto_631607 ?auto_631608 ?auto_631609 ?auto_631610 ?auto_631611 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631656 - BLOCK
      ?auto_631657 - BLOCK
      ?auto_631658 - BLOCK
      ?auto_631659 - BLOCK
      ?auto_631660 - BLOCK
      ?auto_631661 - BLOCK
      ?auto_631662 - BLOCK
      ?auto_631663 - BLOCK
      ?auto_631664 - BLOCK
      ?auto_631665 - BLOCK
      ?auto_631666 - BLOCK
      ?auto_631667 - BLOCK
      ?auto_631668 - BLOCK
      ?auto_631669 - BLOCK
    )
    :vars
    (
      ?auto_631670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631669 ?auto_631670 ) ( ON-TABLE ?auto_631656 ) ( ON ?auto_631657 ?auto_631656 ) ( ON ?auto_631658 ?auto_631657 ) ( ON ?auto_631659 ?auto_631658 ) ( ON ?auto_631660 ?auto_631659 ) ( not ( = ?auto_631656 ?auto_631657 ) ) ( not ( = ?auto_631656 ?auto_631658 ) ) ( not ( = ?auto_631656 ?auto_631659 ) ) ( not ( = ?auto_631656 ?auto_631660 ) ) ( not ( = ?auto_631656 ?auto_631661 ) ) ( not ( = ?auto_631656 ?auto_631662 ) ) ( not ( = ?auto_631656 ?auto_631663 ) ) ( not ( = ?auto_631656 ?auto_631664 ) ) ( not ( = ?auto_631656 ?auto_631665 ) ) ( not ( = ?auto_631656 ?auto_631666 ) ) ( not ( = ?auto_631656 ?auto_631667 ) ) ( not ( = ?auto_631656 ?auto_631668 ) ) ( not ( = ?auto_631656 ?auto_631669 ) ) ( not ( = ?auto_631656 ?auto_631670 ) ) ( not ( = ?auto_631657 ?auto_631658 ) ) ( not ( = ?auto_631657 ?auto_631659 ) ) ( not ( = ?auto_631657 ?auto_631660 ) ) ( not ( = ?auto_631657 ?auto_631661 ) ) ( not ( = ?auto_631657 ?auto_631662 ) ) ( not ( = ?auto_631657 ?auto_631663 ) ) ( not ( = ?auto_631657 ?auto_631664 ) ) ( not ( = ?auto_631657 ?auto_631665 ) ) ( not ( = ?auto_631657 ?auto_631666 ) ) ( not ( = ?auto_631657 ?auto_631667 ) ) ( not ( = ?auto_631657 ?auto_631668 ) ) ( not ( = ?auto_631657 ?auto_631669 ) ) ( not ( = ?auto_631657 ?auto_631670 ) ) ( not ( = ?auto_631658 ?auto_631659 ) ) ( not ( = ?auto_631658 ?auto_631660 ) ) ( not ( = ?auto_631658 ?auto_631661 ) ) ( not ( = ?auto_631658 ?auto_631662 ) ) ( not ( = ?auto_631658 ?auto_631663 ) ) ( not ( = ?auto_631658 ?auto_631664 ) ) ( not ( = ?auto_631658 ?auto_631665 ) ) ( not ( = ?auto_631658 ?auto_631666 ) ) ( not ( = ?auto_631658 ?auto_631667 ) ) ( not ( = ?auto_631658 ?auto_631668 ) ) ( not ( = ?auto_631658 ?auto_631669 ) ) ( not ( = ?auto_631658 ?auto_631670 ) ) ( not ( = ?auto_631659 ?auto_631660 ) ) ( not ( = ?auto_631659 ?auto_631661 ) ) ( not ( = ?auto_631659 ?auto_631662 ) ) ( not ( = ?auto_631659 ?auto_631663 ) ) ( not ( = ?auto_631659 ?auto_631664 ) ) ( not ( = ?auto_631659 ?auto_631665 ) ) ( not ( = ?auto_631659 ?auto_631666 ) ) ( not ( = ?auto_631659 ?auto_631667 ) ) ( not ( = ?auto_631659 ?auto_631668 ) ) ( not ( = ?auto_631659 ?auto_631669 ) ) ( not ( = ?auto_631659 ?auto_631670 ) ) ( not ( = ?auto_631660 ?auto_631661 ) ) ( not ( = ?auto_631660 ?auto_631662 ) ) ( not ( = ?auto_631660 ?auto_631663 ) ) ( not ( = ?auto_631660 ?auto_631664 ) ) ( not ( = ?auto_631660 ?auto_631665 ) ) ( not ( = ?auto_631660 ?auto_631666 ) ) ( not ( = ?auto_631660 ?auto_631667 ) ) ( not ( = ?auto_631660 ?auto_631668 ) ) ( not ( = ?auto_631660 ?auto_631669 ) ) ( not ( = ?auto_631660 ?auto_631670 ) ) ( not ( = ?auto_631661 ?auto_631662 ) ) ( not ( = ?auto_631661 ?auto_631663 ) ) ( not ( = ?auto_631661 ?auto_631664 ) ) ( not ( = ?auto_631661 ?auto_631665 ) ) ( not ( = ?auto_631661 ?auto_631666 ) ) ( not ( = ?auto_631661 ?auto_631667 ) ) ( not ( = ?auto_631661 ?auto_631668 ) ) ( not ( = ?auto_631661 ?auto_631669 ) ) ( not ( = ?auto_631661 ?auto_631670 ) ) ( not ( = ?auto_631662 ?auto_631663 ) ) ( not ( = ?auto_631662 ?auto_631664 ) ) ( not ( = ?auto_631662 ?auto_631665 ) ) ( not ( = ?auto_631662 ?auto_631666 ) ) ( not ( = ?auto_631662 ?auto_631667 ) ) ( not ( = ?auto_631662 ?auto_631668 ) ) ( not ( = ?auto_631662 ?auto_631669 ) ) ( not ( = ?auto_631662 ?auto_631670 ) ) ( not ( = ?auto_631663 ?auto_631664 ) ) ( not ( = ?auto_631663 ?auto_631665 ) ) ( not ( = ?auto_631663 ?auto_631666 ) ) ( not ( = ?auto_631663 ?auto_631667 ) ) ( not ( = ?auto_631663 ?auto_631668 ) ) ( not ( = ?auto_631663 ?auto_631669 ) ) ( not ( = ?auto_631663 ?auto_631670 ) ) ( not ( = ?auto_631664 ?auto_631665 ) ) ( not ( = ?auto_631664 ?auto_631666 ) ) ( not ( = ?auto_631664 ?auto_631667 ) ) ( not ( = ?auto_631664 ?auto_631668 ) ) ( not ( = ?auto_631664 ?auto_631669 ) ) ( not ( = ?auto_631664 ?auto_631670 ) ) ( not ( = ?auto_631665 ?auto_631666 ) ) ( not ( = ?auto_631665 ?auto_631667 ) ) ( not ( = ?auto_631665 ?auto_631668 ) ) ( not ( = ?auto_631665 ?auto_631669 ) ) ( not ( = ?auto_631665 ?auto_631670 ) ) ( not ( = ?auto_631666 ?auto_631667 ) ) ( not ( = ?auto_631666 ?auto_631668 ) ) ( not ( = ?auto_631666 ?auto_631669 ) ) ( not ( = ?auto_631666 ?auto_631670 ) ) ( not ( = ?auto_631667 ?auto_631668 ) ) ( not ( = ?auto_631667 ?auto_631669 ) ) ( not ( = ?auto_631667 ?auto_631670 ) ) ( not ( = ?auto_631668 ?auto_631669 ) ) ( not ( = ?auto_631668 ?auto_631670 ) ) ( not ( = ?auto_631669 ?auto_631670 ) ) ( ON ?auto_631668 ?auto_631669 ) ( ON ?auto_631667 ?auto_631668 ) ( ON ?auto_631666 ?auto_631667 ) ( ON ?auto_631665 ?auto_631666 ) ( ON ?auto_631664 ?auto_631665 ) ( ON ?auto_631663 ?auto_631664 ) ( ON ?auto_631662 ?auto_631663 ) ( CLEAR ?auto_631660 ) ( ON ?auto_631661 ?auto_631662 ) ( CLEAR ?auto_631661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_631656 ?auto_631657 ?auto_631658 ?auto_631659 ?auto_631660 ?auto_631661 )
      ( MAKE-14PILE ?auto_631656 ?auto_631657 ?auto_631658 ?auto_631659 ?auto_631660 ?auto_631661 ?auto_631662 ?auto_631663 ?auto_631664 ?auto_631665 ?auto_631666 ?auto_631667 ?auto_631668 ?auto_631669 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631714 - BLOCK
      ?auto_631715 - BLOCK
      ?auto_631716 - BLOCK
      ?auto_631717 - BLOCK
      ?auto_631718 - BLOCK
      ?auto_631719 - BLOCK
      ?auto_631720 - BLOCK
      ?auto_631721 - BLOCK
      ?auto_631722 - BLOCK
      ?auto_631723 - BLOCK
      ?auto_631724 - BLOCK
      ?auto_631725 - BLOCK
      ?auto_631726 - BLOCK
      ?auto_631727 - BLOCK
    )
    :vars
    (
      ?auto_631728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631727 ?auto_631728 ) ( ON-TABLE ?auto_631714 ) ( ON ?auto_631715 ?auto_631714 ) ( ON ?auto_631716 ?auto_631715 ) ( ON ?auto_631717 ?auto_631716 ) ( not ( = ?auto_631714 ?auto_631715 ) ) ( not ( = ?auto_631714 ?auto_631716 ) ) ( not ( = ?auto_631714 ?auto_631717 ) ) ( not ( = ?auto_631714 ?auto_631718 ) ) ( not ( = ?auto_631714 ?auto_631719 ) ) ( not ( = ?auto_631714 ?auto_631720 ) ) ( not ( = ?auto_631714 ?auto_631721 ) ) ( not ( = ?auto_631714 ?auto_631722 ) ) ( not ( = ?auto_631714 ?auto_631723 ) ) ( not ( = ?auto_631714 ?auto_631724 ) ) ( not ( = ?auto_631714 ?auto_631725 ) ) ( not ( = ?auto_631714 ?auto_631726 ) ) ( not ( = ?auto_631714 ?auto_631727 ) ) ( not ( = ?auto_631714 ?auto_631728 ) ) ( not ( = ?auto_631715 ?auto_631716 ) ) ( not ( = ?auto_631715 ?auto_631717 ) ) ( not ( = ?auto_631715 ?auto_631718 ) ) ( not ( = ?auto_631715 ?auto_631719 ) ) ( not ( = ?auto_631715 ?auto_631720 ) ) ( not ( = ?auto_631715 ?auto_631721 ) ) ( not ( = ?auto_631715 ?auto_631722 ) ) ( not ( = ?auto_631715 ?auto_631723 ) ) ( not ( = ?auto_631715 ?auto_631724 ) ) ( not ( = ?auto_631715 ?auto_631725 ) ) ( not ( = ?auto_631715 ?auto_631726 ) ) ( not ( = ?auto_631715 ?auto_631727 ) ) ( not ( = ?auto_631715 ?auto_631728 ) ) ( not ( = ?auto_631716 ?auto_631717 ) ) ( not ( = ?auto_631716 ?auto_631718 ) ) ( not ( = ?auto_631716 ?auto_631719 ) ) ( not ( = ?auto_631716 ?auto_631720 ) ) ( not ( = ?auto_631716 ?auto_631721 ) ) ( not ( = ?auto_631716 ?auto_631722 ) ) ( not ( = ?auto_631716 ?auto_631723 ) ) ( not ( = ?auto_631716 ?auto_631724 ) ) ( not ( = ?auto_631716 ?auto_631725 ) ) ( not ( = ?auto_631716 ?auto_631726 ) ) ( not ( = ?auto_631716 ?auto_631727 ) ) ( not ( = ?auto_631716 ?auto_631728 ) ) ( not ( = ?auto_631717 ?auto_631718 ) ) ( not ( = ?auto_631717 ?auto_631719 ) ) ( not ( = ?auto_631717 ?auto_631720 ) ) ( not ( = ?auto_631717 ?auto_631721 ) ) ( not ( = ?auto_631717 ?auto_631722 ) ) ( not ( = ?auto_631717 ?auto_631723 ) ) ( not ( = ?auto_631717 ?auto_631724 ) ) ( not ( = ?auto_631717 ?auto_631725 ) ) ( not ( = ?auto_631717 ?auto_631726 ) ) ( not ( = ?auto_631717 ?auto_631727 ) ) ( not ( = ?auto_631717 ?auto_631728 ) ) ( not ( = ?auto_631718 ?auto_631719 ) ) ( not ( = ?auto_631718 ?auto_631720 ) ) ( not ( = ?auto_631718 ?auto_631721 ) ) ( not ( = ?auto_631718 ?auto_631722 ) ) ( not ( = ?auto_631718 ?auto_631723 ) ) ( not ( = ?auto_631718 ?auto_631724 ) ) ( not ( = ?auto_631718 ?auto_631725 ) ) ( not ( = ?auto_631718 ?auto_631726 ) ) ( not ( = ?auto_631718 ?auto_631727 ) ) ( not ( = ?auto_631718 ?auto_631728 ) ) ( not ( = ?auto_631719 ?auto_631720 ) ) ( not ( = ?auto_631719 ?auto_631721 ) ) ( not ( = ?auto_631719 ?auto_631722 ) ) ( not ( = ?auto_631719 ?auto_631723 ) ) ( not ( = ?auto_631719 ?auto_631724 ) ) ( not ( = ?auto_631719 ?auto_631725 ) ) ( not ( = ?auto_631719 ?auto_631726 ) ) ( not ( = ?auto_631719 ?auto_631727 ) ) ( not ( = ?auto_631719 ?auto_631728 ) ) ( not ( = ?auto_631720 ?auto_631721 ) ) ( not ( = ?auto_631720 ?auto_631722 ) ) ( not ( = ?auto_631720 ?auto_631723 ) ) ( not ( = ?auto_631720 ?auto_631724 ) ) ( not ( = ?auto_631720 ?auto_631725 ) ) ( not ( = ?auto_631720 ?auto_631726 ) ) ( not ( = ?auto_631720 ?auto_631727 ) ) ( not ( = ?auto_631720 ?auto_631728 ) ) ( not ( = ?auto_631721 ?auto_631722 ) ) ( not ( = ?auto_631721 ?auto_631723 ) ) ( not ( = ?auto_631721 ?auto_631724 ) ) ( not ( = ?auto_631721 ?auto_631725 ) ) ( not ( = ?auto_631721 ?auto_631726 ) ) ( not ( = ?auto_631721 ?auto_631727 ) ) ( not ( = ?auto_631721 ?auto_631728 ) ) ( not ( = ?auto_631722 ?auto_631723 ) ) ( not ( = ?auto_631722 ?auto_631724 ) ) ( not ( = ?auto_631722 ?auto_631725 ) ) ( not ( = ?auto_631722 ?auto_631726 ) ) ( not ( = ?auto_631722 ?auto_631727 ) ) ( not ( = ?auto_631722 ?auto_631728 ) ) ( not ( = ?auto_631723 ?auto_631724 ) ) ( not ( = ?auto_631723 ?auto_631725 ) ) ( not ( = ?auto_631723 ?auto_631726 ) ) ( not ( = ?auto_631723 ?auto_631727 ) ) ( not ( = ?auto_631723 ?auto_631728 ) ) ( not ( = ?auto_631724 ?auto_631725 ) ) ( not ( = ?auto_631724 ?auto_631726 ) ) ( not ( = ?auto_631724 ?auto_631727 ) ) ( not ( = ?auto_631724 ?auto_631728 ) ) ( not ( = ?auto_631725 ?auto_631726 ) ) ( not ( = ?auto_631725 ?auto_631727 ) ) ( not ( = ?auto_631725 ?auto_631728 ) ) ( not ( = ?auto_631726 ?auto_631727 ) ) ( not ( = ?auto_631726 ?auto_631728 ) ) ( not ( = ?auto_631727 ?auto_631728 ) ) ( ON ?auto_631726 ?auto_631727 ) ( ON ?auto_631725 ?auto_631726 ) ( ON ?auto_631724 ?auto_631725 ) ( ON ?auto_631723 ?auto_631724 ) ( ON ?auto_631722 ?auto_631723 ) ( ON ?auto_631721 ?auto_631722 ) ( ON ?auto_631720 ?auto_631721 ) ( ON ?auto_631719 ?auto_631720 ) ( CLEAR ?auto_631717 ) ( ON ?auto_631718 ?auto_631719 ) ( CLEAR ?auto_631718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_631714 ?auto_631715 ?auto_631716 ?auto_631717 ?auto_631718 )
      ( MAKE-14PILE ?auto_631714 ?auto_631715 ?auto_631716 ?auto_631717 ?auto_631718 ?auto_631719 ?auto_631720 ?auto_631721 ?auto_631722 ?auto_631723 ?auto_631724 ?auto_631725 ?auto_631726 ?auto_631727 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631772 - BLOCK
      ?auto_631773 - BLOCK
      ?auto_631774 - BLOCK
      ?auto_631775 - BLOCK
      ?auto_631776 - BLOCK
      ?auto_631777 - BLOCK
      ?auto_631778 - BLOCK
      ?auto_631779 - BLOCK
      ?auto_631780 - BLOCK
      ?auto_631781 - BLOCK
      ?auto_631782 - BLOCK
      ?auto_631783 - BLOCK
      ?auto_631784 - BLOCK
      ?auto_631785 - BLOCK
    )
    :vars
    (
      ?auto_631786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631785 ?auto_631786 ) ( ON-TABLE ?auto_631772 ) ( ON ?auto_631773 ?auto_631772 ) ( ON ?auto_631774 ?auto_631773 ) ( not ( = ?auto_631772 ?auto_631773 ) ) ( not ( = ?auto_631772 ?auto_631774 ) ) ( not ( = ?auto_631772 ?auto_631775 ) ) ( not ( = ?auto_631772 ?auto_631776 ) ) ( not ( = ?auto_631772 ?auto_631777 ) ) ( not ( = ?auto_631772 ?auto_631778 ) ) ( not ( = ?auto_631772 ?auto_631779 ) ) ( not ( = ?auto_631772 ?auto_631780 ) ) ( not ( = ?auto_631772 ?auto_631781 ) ) ( not ( = ?auto_631772 ?auto_631782 ) ) ( not ( = ?auto_631772 ?auto_631783 ) ) ( not ( = ?auto_631772 ?auto_631784 ) ) ( not ( = ?auto_631772 ?auto_631785 ) ) ( not ( = ?auto_631772 ?auto_631786 ) ) ( not ( = ?auto_631773 ?auto_631774 ) ) ( not ( = ?auto_631773 ?auto_631775 ) ) ( not ( = ?auto_631773 ?auto_631776 ) ) ( not ( = ?auto_631773 ?auto_631777 ) ) ( not ( = ?auto_631773 ?auto_631778 ) ) ( not ( = ?auto_631773 ?auto_631779 ) ) ( not ( = ?auto_631773 ?auto_631780 ) ) ( not ( = ?auto_631773 ?auto_631781 ) ) ( not ( = ?auto_631773 ?auto_631782 ) ) ( not ( = ?auto_631773 ?auto_631783 ) ) ( not ( = ?auto_631773 ?auto_631784 ) ) ( not ( = ?auto_631773 ?auto_631785 ) ) ( not ( = ?auto_631773 ?auto_631786 ) ) ( not ( = ?auto_631774 ?auto_631775 ) ) ( not ( = ?auto_631774 ?auto_631776 ) ) ( not ( = ?auto_631774 ?auto_631777 ) ) ( not ( = ?auto_631774 ?auto_631778 ) ) ( not ( = ?auto_631774 ?auto_631779 ) ) ( not ( = ?auto_631774 ?auto_631780 ) ) ( not ( = ?auto_631774 ?auto_631781 ) ) ( not ( = ?auto_631774 ?auto_631782 ) ) ( not ( = ?auto_631774 ?auto_631783 ) ) ( not ( = ?auto_631774 ?auto_631784 ) ) ( not ( = ?auto_631774 ?auto_631785 ) ) ( not ( = ?auto_631774 ?auto_631786 ) ) ( not ( = ?auto_631775 ?auto_631776 ) ) ( not ( = ?auto_631775 ?auto_631777 ) ) ( not ( = ?auto_631775 ?auto_631778 ) ) ( not ( = ?auto_631775 ?auto_631779 ) ) ( not ( = ?auto_631775 ?auto_631780 ) ) ( not ( = ?auto_631775 ?auto_631781 ) ) ( not ( = ?auto_631775 ?auto_631782 ) ) ( not ( = ?auto_631775 ?auto_631783 ) ) ( not ( = ?auto_631775 ?auto_631784 ) ) ( not ( = ?auto_631775 ?auto_631785 ) ) ( not ( = ?auto_631775 ?auto_631786 ) ) ( not ( = ?auto_631776 ?auto_631777 ) ) ( not ( = ?auto_631776 ?auto_631778 ) ) ( not ( = ?auto_631776 ?auto_631779 ) ) ( not ( = ?auto_631776 ?auto_631780 ) ) ( not ( = ?auto_631776 ?auto_631781 ) ) ( not ( = ?auto_631776 ?auto_631782 ) ) ( not ( = ?auto_631776 ?auto_631783 ) ) ( not ( = ?auto_631776 ?auto_631784 ) ) ( not ( = ?auto_631776 ?auto_631785 ) ) ( not ( = ?auto_631776 ?auto_631786 ) ) ( not ( = ?auto_631777 ?auto_631778 ) ) ( not ( = ?auto_631777 ?auto_631779 ) ) ( not ( = ?auto_631777 ?auto_631780 ) ) ( not ( = ?auto_631777 ?auto_631781 ) ) ( not ( = ?auto_631777 ?auto_631782 ) ) ( not ( = ?auto_631777 ?auto_631783 ) ) ( not ( = ?auto_631777 ?auto_631784 ) ) ( not ( = ?auto_631777 ?auto_631785 ) ) ( not ( = ?auto_631777 ?auto_631786 ) ) ( not ( = ?auto_631778 ?auto_631779 ) ) ( not ( = ?auto_631778 ?auto_631780 ) ) ( not ( = ?auto_631778 ?auto_631781 ) ) ( not ( = ?auto_631778 ?auto_631782 ) ) ( not ( = ?auto_631778 ?auto_631783 ) ) ( not ( = ?auto_631778 ?auto_631784 ) ) ( not ( = ?auto_631778 ?auto_631785 ) ) ( not ( = ?auto_631778 ?auto_631786 ) ) ( not ( = ?auto_631779 ?auto_631780 ) ) ( not ( = ?auto_631779 ?auto_631781 ) ) ( not ( = ?auto_631779 ?auto_631782 ) ) ( not ( = ?auto_631779 ?auto_631783 ) ) ( not ( = ?auto_631779 ?auto_631784 ) ) ( not ( = ?auto_631779 ?auto_631785 ) ) ( not ( = ?auto_631779 ?auto_631786 ) ) ( not ( = ?auto_631780 ?auto_631781 ) ) ( not ( = ?auto_631780 ?auto_631782 ) ) ( not ( = ?auto_631780 ?auto_631783 ) ) ( not ( = ?auto_631780 ?auto_631784 ) ) ( not ( = ?auto_631780 ?auto_631785 ) ) ( not ( = ?auto_631780 ?auto_631786 ) ) ( not ( = ?auto_631781 ?auto_631782 ) ) ( not ( = ?auto_631781 ?auto_631783 ) ) ( not ( = ?auto_631781 ?auto_631784 ) ) ( not ( = ?auto_631781 ?auto_631785 ) ) ( not ( = ?auto_631781 ?auto_631786 ) ) ( not ( = ?auto_631782 ?auto_631783 ) ) ( not ( = ?auto_631782 ?auto_631784 ) ) ( not ( = ?auto_631782 ?auto_631785 ) ) ( not ( = ?auto_631782 ?auto_631786 ) ) ( not ( = ?auto_631783 ?auto_631784 ) ) ( not ( = ?auto_631783 ?auto_631785 ) ) ( not ( = ?auto_631783 ?auto_631786 ) ) ( not ( = ?auto_631784 ?auto_631785 ) ) ( not ( = ?auto_631784 ?auto_631786 ) ) ( not ( = ?auto_631785 ?auto_631786 ) ) ( ON ?auto_631784 ?auto_631785 ) ( ON ?auto_631783 ?auto_631784 ) ( ON ?auto_631782 ?auto_631783 ) ( ON ?auto_631781 ?auto_631782 ) ( ON ?auto_631780 ?auto_631781 ) ( ON ?auto_631779 ?auto_631780 ) ( ON ?auto_631778 ?auto_631779 ) ( ON ?auto_631777 ?auto_631778 ) ( ON ?auto_631776 ?auto_631777 ) ( CLEAR ?auto_631774 ) ( ON ?auto_631775 ?auto_631776 ) ( CLEAR ?auto_631775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_631772 ?auto_631773 ?auto_631774 ?auto_631775 )
      ( MAKE-14PILE ?auto_631772 ?auto_631773 ?auto_631774 ?auto_631775 ?auto_631776 ?auto_631777 ?auto_631778 ?auto_631779 ?auto_631780 ?auto_631781 ?auto_631782 ?auto_631783 ?auto_631784 ?auto_631785 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631830 - BLOCK
      ?auto_631831 - BLOCK
      ?auto_631832 - BLOCK
      ?auto_631833 - BLOCK
      ?auto_631834 - BLOCK
      ?auto_631835 - BLOCK
      ?auto_631836 - BLOCK
      ?auto_631837 - BLOCK
      ?auto_631838 - BLOCK
      ?auto_631839 - BLOCK
      ?auto_631840 - BLOCK
      ?auto_631841 - BLOCK
      ?auto_631842 - BLOCK
      ?auto_631843 - BLOCK
    )
    :vars
    (
      ?auto_631844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631843 ?auto_631844 ) ( ON-TABLE ?auto_631830 ) ( ON ?auto_631831 ?auto_631830 ) ( not ( = ?auto_631830 ?auto_631831 ) ) ( not ( = ?auto_631830 ?auto_631832 ) ) ( not ( = ?auto_631830 ?auto_631833 ) ) ( not ( = ?auto_631830 ?auto_631834 ) ) ( not ( = ?auto_631830 ?auto_631835 ) ) ( not ( = ?auto_631830 ?auto_631836 ) ) ( not ( = ?auto_631830 ?auto_631837 ) ) ( not ( = ?auto_631830 ?auto_631838 ) ) ( not ( = ?auto_631830 ?auto_631839 ) ) ( not ( = ?auto_631830 ?auto_631840 ) ) ( not ( = ?auto_631830 ?auto_631841 ) ) ( not ( = ?auto_631830 ?auto_631842 ) ) ( not ( = ?auto_631830 ?auto_631843 ) ) ( not ( = ?auto_631830 ?auto_631844 ) ) ( not ( = ?auto_631831 ?auto_631832 ) ) ( not ( = ?auto_631831 ?auto_631833 ) ) ( not ( = ?auto_631831 ?auto_631834 ) ) ( not ( = ?auto_631831 ?auto_631835 ) ) ( not ( = ?auto_631831 ?auto_631836 ) ) ( not ( = ?auto_631831 ?auto_631837 ) ) ( not ( = ?auto_631831 ?auto_631838 ) ) ( not ( = ?auto_631831 ?auto_631839 ) ) ( not ( = ?auto_631831 ?auto_631840 ) ) ( not ( = ?auto_631831 ?auto_631841 ) ) ( not ( = ?auto_631831 ?auto_631842 ) ) ( not ( = ?auto_631831 ?auto_631843 ) ) ( not ( = ?auto_631831 ?auto_631844 ) ) ( not ( = ?auto_631832 ?auto_631833 ) ) ( not ( = ?auto_631832 ?auto_631834 ) ) ( not ( = ?auto_631832 ?auto_631835 ) ) ( not ( = ?auto_631832 ?auto_631836 ) ) ( not ( = ?auto_631832 ?auto_631837 ) ) ( not ( = ?auto_631832 ?auto_631838 ) ) ( not ( = ?auto_631832 ?auto_631839 ) ) ( not ( = ?auto_631832 ?auto_631840 ) ) ( not ( = ?auto_631832 ?auto_631841 ) ) ( not ( = ?auto_631832 ?auto_631842 ) ) ( not ( = ?auto_631832 ?auto_631843 ) ) ( not ( = ?auto_631832 ?auto_631844 ) ) ( not ( = ?auto_631833 ?auto_631834 ) ) ( not ( = ?auto_631833 ?auto_631835 ) ) ( not ( = ?auto_631833 ?auto_631836 ) ) ( not ( = ?auto_631833 ?auto_631837 ) ) ( not ( = ?auto_631833 ?auto_631838 ) ) ( not ( = ?auto_631833 ?auto_631839 ) ) ( not ( = ?auto_631833 ?auto_631840 ) ) ( not ( = ?auto_631833 ?auto_631841 ) ) ( not ( = ?auto_631833 ?auto_631842 ) ) ( not ( = ?auto_631833 ?auto_631843 ) ) ( not ( = ?auto_631833 ?auto_631844 ) ) ( not ( = ?auto_631834 ?auto_631835 ) ) ( not ( = ?auto_631834 ?auto_631836 ) ) ( not ( = ?auto_631834 ?auto_631837 ) ) ( not ( = ?auto_631834 ?auto_631838 ) ) ( not ( = ?auto_631834 ?auto_631839 ) ) ( not ( = ?auto_631834 ?auto_631840 ) ) ( not ( = ?auto_631834 ?auto_631841 ) ) ( not ( = ?auto_631834 ?auto_631842 ) ) ( not ( = ?auto_631834 ?auto_631843 ) ) ( not ( = ?auto_631834 ?auto_631844 ) ) ( not ( = ?auto_631835 ?auto_631836 ) ) ( not ( = ?auto_631835 ?auto_631837 ) ) ( not ( = ?auto_631835 ?auto_631838 ) ) ( not ( = ?auto_631835 ?auto_631839 ) ) ( not ( = ?auto_631835 ?auto_631840 ) ) ( not ( = ?auto_631835 ?auto_631841 ) ) ( not ( = ?auto_631835 ?auto_631842 ) ) ( not ( = ?auto_631835 ?auto_631843 ) ) ( not ( = ?auto_631835 ?auto_631844 ) ) ( not ( = ?auto_631836 ?auto_631837 ) ) ( not ( = ?auto_631836 ?auto_631838 ) ) ( not ( = ?auto_631836 ?auto_631839 ) ) ( not ( = ?auto_631836 ?auto_631840 ) ) ( not ( = ?auto_631836 ?auto_631841 ) ) ( not ( = ?auto_631836 ?auto_631842 ) ) ( not ( = ?auto_631836 ?auto_631843 ) ) ( not ( = ?auto_631836 ?auto_631844 ) ) ( not ( = ?auto_631837 ?auto_631838 ) ) ( not ( = ?auto_631837 ?auto_631839 ) ) ( not ( = ?auto_631837 ?auto_631840 ) ) ( not ( = ?auto_631837 ?auto_631841 ) ) ( not ( = ?auto_631837 ?auto_631842 ) ) ( not ( = ?auto_631837 ?auto_631843 ) ) ( not ( = ?auto_631837 ?auto_631844 ) ) ( not ( = ?auto_631838 ?auto_631839 ) ) ( not ( = ?auto_631838 ?auto_631840 ) ) ( not ( = ?auto_631838 ?auto_631841 ) ) ( not ( = ?auto_631838 ?auto_631842 ) ) ( not ( = ?auto_631838 ?auto_631843 ) ) ( not ( = ?auto_631838 ?auto_631844 ) ) ( not ( = ?auto_631839 ?auto_631840 ) ) ( not ( = ?auto_631839 ?auto_631841 ) ) ( not ( = ?auto_631839 ?auto_631842 ) ) ( not ( = ?auto_631839 ?auto_631843 ) ) ( not ( = ?auto_631839 ?auto_631844 ) ) ( not ( = ?auto_631840 ?auto_631841 ) ) ( not ( = ?auto_631840 ?auto_631842 ) ) ( not ( = ?auto_631840 ?auto_631843 ) ) ( not ( = ?auto_631840 ?auto_631844 ) ) ( not ( = ?auto_631841 ?auto_631842 ) ) ( not ( = ?auto_631841 ?auto_631843 ) ) ( not ( = ?auto_631841 ?auto_631844 ) ) ( not ( = ?auto_631842 ?auto_631843 ) ) ( not ( = ?auto_631842 ?auto_631844 ) ) ( not ( = ?auto_631843 ?auto_631844 ) ) ( ON ?auto_631842 ?auto_631843 ) ( ON ?auto_631841 ?auto_631842 ) ( ON ?auto_631840 ?auto_631841 ) ( ON ?auto_631839 ?auto_631840 ) ( ON ?auto_631838 ?auto_631839 ) ( ON ?auto_631837 ?auto_631838 ) ( ON ?auto_631836 ?auto_631837 ) ( ON ?auto_631835 ?auto_631836 ) ( ON ?auto_631834 ?auto_631835 ) ( ON ?auto_631833 ?auto_631834 ) ( CLEAR ?auto_631831 ) ( ON ?auto_631832 ?auto_631833 ) ( CLEAR ?auto_631832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_631830 ?auto_631831 ?auto_631832 )
      ( MAKE-14PILE ?auto_631830 ?auto_631831 ?auto_631832 ?auto_631833 ?auto_631834 ?auto_631835 ?auto_631836 ?auto_631837 ?auto_631838 ?auto_631839 ?auto_631840 ?auto_631841 ?auto_631842 ?auto_631843 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631888 - BLOCK
      ?auto_631889 - BLOCK
      ?auto_631890 - BLOCK
      ?auto_631891 - BLOCK
      ?auto_631892 - BLOCK
      ?auto_631893 - BLOCK
      ?auto_631894 - BLOCK
      ?auto_631895 - BLOCK
      ?auto_631896 - BLOCK
      ?auto_631897 - BLOCK
      ?auto_631898 - BLOCK
      ?auto_631899 - BLOCK
      ?auto_631900 - BLOCK
      ?auto_631901 - BLOCK
    )
    :vars
    (
      ?auto_631902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631901 ?auto_631902 ) ( ON-TABLE ?auto_631888 ) ( not ( = ?auto_631888 ?auto_631889 ) ) ( not ( = ?auto_631888 ?auto_631890 ) ) ( not ( = ?auto_631888 ?auto_631891 ) ) ( not ( = ?auto_631888 ?auto_631892 ) ) ( not ( = ?auto_631888 ?auto_631893 ) ) ( not ( = ?auto_631888 ?auto_631894 ) ) ( not ( = ?auto_631888 ?auto_631895 ) ) ( not ( = ?auto_631888 ?auto_631896 ) ) ( not ( = ?auto_631888 ?auto_631897 ) ) ( not ( = ?auto_631888 ?auto_631898 ) ) ( not ( = ?auto_631888 ?auto_631899 ) ) ( not ( = ?auto_631888 ?auto_631900 ) ) ( not ( = ?auto_631888 ?auto_631901 ) ) ( not ( = ?auto_631888 ?auto_631902 ) ) ( not ( = ?auto_631889 ?auto_631890 ) ) ( not ( = ?auto_631889 ?auto_631891 ) ) ( not ( = ?auto_631889 ?auto_631892 ) ) ( not ( = ?auto_631889 ?auto_631893 ) ) ( not ( = ?auto_631889 ?auto_631894 ) ) ( not ( = ?auto_631889 ?auto_631895 ) ) ( not ( = ?auto_631889 ?auto_631896 ) ) ( not ( = ?auto_631889 ?auto_631897 ) ) ( not ( = ?auto_631889 ?auto_631898 ) ) ( not ( = ?auto_631889 ?auto_631899 ) ) ( not ( = ?auto_631889 ?auto_631900 ) ) ( not ( = ?auto_631889 ?auto_631901 ) ) ( not ( = ?auto_631889 ?auto_631902 ) ) ( not ( = ?auto_631890 ?auto_631891 ) ) ( not ( = ?auto_631890 ?auto_631892 ) ) ( not ( = ?auto_631890 ?auto_631893 ) ) ( not ( = ?auto_631890 ?auto_631894 ) ) ( not ( = ?auto_631890 ?auto_631895 ) ) ( not ( = ?auto_631890 ?auto_631896 ) ) ( not ( = ?auto_631890 ?auto_631897 ) ) ( not ( = ?auto_631890 ?auto_631898 ) ) ( not ( = ?auto_631890 ?auto_631899 ) ) ( not ( = ?auto_631890 ?auto_631900 ) ) ( not ( = ?auto_631890 ?auto_631901 ) ) ( not ( = ?auto_631890 ?auto_631902 ) ) ( not ( = ?auto_631891 ?auto_631892 ) ) ( not ( = ?auto_631891 ?auto_631893 ) ) ( not ( = ?auto_631891 ?auto_631894 ) ) ( not ( = ?auto_631891 ?auto_631895 ) ) ( not ( = ?auto_631891 ?auto_631896 ) ) ( not ( = ?auto_631891 ?auto_631897 ) ) ( not ( = ?auto_631891 ?auto_631898 ) ) ( not ( = ?auto_631891 ?auto_631899 ) ) ( not ( = ?auto_631891 ?auto_631900 ) ) ( not ( = ?auto_631891 ?auto_631901 ) ) ( not ( = ?auto_631891 ?auto_631902 ) ) ( not ( = ?auto_631892 ?auto_631893 ) ) ( not ( = ?auto_631892 ?auto_631894 ) ) ( not ( = ?auto_631892 ?auto_631895 ) ) ( not ( = ?auto_631892 ?auto_631896 ) ) ( not ( = ?auto_631892 ?auto_631897 ) ) ( not ( = ?auto_631892 ?auto_631898 ) ) ( not ( = ?auto_631892 ?auto_631899 ) ) ( not ( = ?auto_631892 ?auto_631900 ) ) ( not ( = ?auto_631892 ?auto_631901 ) ) ( not ( = ?auto_631892 ?auto_631902 ) ) ( not ( = ?auto_631893 ?auto_631894 ) ) ( not ( = ?auto_631893 ?auto_631895 ) ) ( not ( = ?auto_631893 ?auto_631896 ) ) ( not ( = ?auto_631893 ?auto_631897 ) ) ( not ( = ?auto_631893 ?auto_631898 ) ) ( not ( = ?auto_631893 ?auto_631899 ) ) ( not ( = ?auto_631893 ?auto_631900 ) ) ( not ( = ?auto_631893 ?auto_631901 ) ) ( not ( = ?auto_631893 ?auto_631902 ) ) ( not ( = ?auto_631894 ?auto_631895 ) ) ( not ( = ?auto_631894 ?auto_631896 ) ) ( not ( = ?auto_631894 ?auto_631897 ) ) ( not ( = ?auto_631894 ?auto_631898 ) ) ( not ( = ?auto_631894 ?auto_631899 ) ) ( not ( = ?auto_631894 ?auto_631900 ) ) ( not ( = ?auto_631894 ?auto_631901 ) ) ( not ( = ?auto_631894 ?auto_631902 ) ) ( not ( = ?auto_631895 ?auto_631896 ) ) ( not ( = ?auto_631895 ?auto_631897 ) ) ( not ( = ?auto_631895 ?auto_631898 ) ) ( not ( = ?auto_631895 ?auto_631899 ) ) ( not ( = ?auto_631895 ?auto_631900 ) ) ( not ( = ?auto_631895 ?auto_631901 ) ) ( not ( = ?auto_631895 ?auto_631902 ) ) ( not ( = ?auto_631896 ?auto_631897 ) ) ( not ( = ?auto_631896 ?auto_631898 ) ) ( not ( = ?auto_631896 ?auto_631899 ) ) ( not ( = ?auto_631896 ?auto_631900 ) ) ( not ( = ?auto_631896 ?auto_631901 ) ) ( not ( = ?auto_631896 ?auto_631902 ) ) ( not ( = ?auto_631897 ?auto_631898 ) ) ( not ( = ?auto_631897 ?auto_631899 ) ) ( not ( = ?auto_631897 ?auto_631900 ) ) ( not ( = ?auto_631897 ?auto_631901 ) ) ( not ( = ?auto_631897 ?auto_631902 ) ) ( not ( = ?auto_631898 ?auto_631899 ) ) ( not ( = ?auto_631898 ?auto_631900 ) ) ( not ( = ?auto_631898 ?auto_631901 ) ) ( not ( = ?auto_631898 ?auto_631902 ) ) ( not ( = ?auto_631899 ?auto_631900 ) ) ( not ( = ?auto_631899 ?auto_631901 ) ) ( not ( = ?auto_631899 ?auto_631902 ) ) ( not ( = ?auto_631900 ?auto_631901 ) ) ( not ( = ?auto_631900 ?auto_631902 ) ) ( not ( = ?auto_631901 ?auto_631902 ) ) ( ON ?auto_631900 ?auto_631901 ) ( ON ?auto_631899 ?auto_631900 ) ( ON ?auto_631898 ?auto_631899 ) ( ON ?auto_631897 ?auto_631898 ) ( ON ?auto_631896 ?auto_631897 ) ( ON ?auto_631895 ?auto_631896 ) ( ON ?auto_631894 ?auto_631895 ) ( ON ?auto_631893 ?auto_631894 ) ( ON ?auto_631892 ?auto_631893 ) ( ON ?auto_631891 ?auto_631892 ) ( ON ?auto_631890 ?auto_631891 ) ( CLEAR ?auto_631888 ) ( ON ?auto_631889 ?auto_631890 ) ( CLEAR ?auto_631889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_631888 ?auto_631889 )
      ( MAKE-14PILE ?auto_631888 ?auto_631889 ?auto_631890 ?auto_631891 ?auto_631892 ?auto_631893 ?auto_631894 ?auto_631895 ?auto_631896 ?auto_631897 ?auto_631898 ?auto_631899 ?auto_631900 ?auto_631901 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_631946 - BLOCK
      ?auto_631947 - BLOCK
      ?auto_631948 - BLOCK
      ?auto_631949 - BLOCK
      ?auto_631950 - BLOCK
      ?auto_631951 - BLOCK
      ?auto_631952 - BLOCK
      ?auto_631953 - BLOCK
      ?auto_631954 - BLOCK
      ?auto_631955 - BLOCK
      ?auto_631956 - BLOCK
      ?auto_631957 - BLOCK
      ?auto_631958 - BLOCK
      ?auto_631959 - BLOCK
    )
    :vars
    (
      ?auto_631960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_631959 ?auto_631960 ) ( not ( = ?auto_631946 ?auto_631947 ) ) ( not ( = ?auto_631946 ?auto_631948 ) ) ( not ( = ?auto_631946 ?auto_631949 ) ) ( not ( = ?auto_631946 ?auto_631950 ) ) ( not ( = ?auto_631946 ?auto_631951 ) ) ( not ( = ?auto_631946 ?auto_631952 ) ) ( not ( = ?auto_631946 ?auto_631953 ) ) ( not ( = ?auto_631946 ?auto_631954 ) ) ( not ( = ?auto_631946 ?auto_631955 ) ) ( not ( = ?auto_631946 ?auto_631956 ) ) ( not ( = ?auto_631946 ?auto_631957 ) ) ( not ( = ?auto_631946 ?auto_631958 ) ) ( not ( = ?auto_631946 ?auto_631959 ) ) ( not ( = ?auto_631946 ?auto_631960 ) ) ( not ( = ?auto_631947 ?auto_631948 ) ) ( not ( = ?auto_631947 ?auto_631949 ) ) ( not ( = ?auto_631947 ?auto_631950 ) ) ( not ( = ?auto_631947 ?auto_631951 ) ) ( not ( = ?auto_631947 ?auto_631952 ) ) ( not ( = ?auto_631947 ?auto_631953 ) ) ( not ( = ?auto_631947 ?auto_631954 ) ) ( not ( = ?auto_631947 ?auto_631955 ) ) ( not ( = ?auto_631947 ?auto_631956 ) ) ( not ( = ?auto_631947 ?auto_631957 ) ) ( not ( = ?auto_631947 ?auto_631958 ) ) ( not ( = ?auto_631947 ?auto_631959 ) ) ( not ( = ?auto_631947 ?auto_631960 ) ) ( not ( = ?auto_631948 ?auto_631949 ) ) ( not ( = ?auto_631948 ?auto_631950 ) ) ( not ( = ?auto_631948 ?auto_631951 ) ) ( not ( = ?auto_631948 ?auto_631952 ) ) ( not ( = ?auto_631948 ?auto_631953 ) ) ( not ( = ?auto_631948 ?auto_631954 ) ) ( not ( = ?auto_631948 ?auto_631955 ) ) ( not ( = ?auto_631948 ?auto_631956 ) ) ( not ( = ?auto_631948 ?auto_631957 ) ) ( not ( = ?auto_631948 ?auto_631958 ) ) ( not ( = ?auto_631948 ?auto_631959 ) ) ( not ( = ?auto_631948 ?auto_631960 ) ) ( not ( = ?auto_631949 ?auto_631950 ) ) ( not ( = ?auto_631949 ?auto_631951 ) ) ( not ( = ?auto_631949 ?auto_631952 ) ) ( not ( = ?auto_631949 ?auto_631953 ) ) ( not ( = ?auto_631949 ?auto_631954 ) ) ( not ( = ?auto_631949 ?auto_631955 ) ) ( not ( = ?auto_631949 ?auto_631956 ) ) ( not ( = ?auto_631949 ?auto_631957 ) ) ( not ( = ?auto_631949 ?auto_631958 ) ) ( not ( = ?auto_631949 ?auto_631959 ) ) ( not ( = ?auto_631949 ?auto_631960 ) ) ( not ( = ?auto_631950 ?auto_631951 ) ) ( not ( = ?auto_631950 ?auto_631952 ) ) ( not ( = ?auto_631950 ?auto_631953 ) ) ( not ( = ?auto_631950 ?auto_631954 ) ) ( not ( = ?auto_631950 ?auto_631955 ) ) ( not ( = ?auto_631950 ?auto_631956 ) ) ( not ( = ?auto_631950 ?auto_631957 ) ) ( not ( = ?auto_631950 ?auto_631958 ) ) ( not ( = ?auto_631950 ?auto_631959 ) ) ( not ( = ?auto_631950 ?auto_631960 ) ) ( not ( = ?auto_631951 ?auto_631952 ) ) ( not ( = ?auto_631951 ?auto_631953 ) ) ( not ( = ?auto_631951 ?auto_631954 ) ) ( not ( = ?auto_631951 ?auto_631955 ) ) ( not ( = ?auto_631951 ?auto_631956 ) ) ( not ( = ?auto_631951 ?auto_631957 ) ) ( not ( = ?auto_631951 ?auto_631958 ) ) ( not ( = ?auto_631951 ?auto_631959 ) ) ( not ( = ?auto_631951 ?auto_631960 ) ) ( not ( = ?auto_631952 ?auto_631953 ) ) ( not ( = ?auto_631952 ?auto_631954 ) ) ( not ( = ?auto_631952 ?auto_631955 ) ) ( not ( = ?auto_631952 ?auto_631956 ) ) ( not ( = ?auto_631952 ?auto_631957 ) ) ( not ( = ?auto_631952 ?auto_631958 ) ) ( not ( = ?auto_631952 ?auto_631959 ) ) ( not ( = ?auto_631952 ?auto_631960 ) ) ( not ( = ?auto_631953 ?auto_631954 ) ) ( not ( = ?auto_631953 ?auto_631955 ) ) ( not ( = ?auto_631953 ?auto_631956 ) ) ( not ( = ?auto_631953 ?auto_631957 ) ) ( not ( = ?auto_631953 ?auto_631958 ) ) ( not ( = ?auto_631953 ?auto_631959 ) ) ( not ( = ?auto_631953 ?auto_631960 ) ) ( not ( = ?auto_631954 ?auto_631955 ) ) ( not ( = ?auto_631954 ?auto_631956 ) ) ( not ( = ?auto_631954 ?auto_631957 ) ) ( not ( = ?auto_631954 ?auto_631958 ) ) ( not ( = ?auto_631954 ?auto_631959 ) ) ( not ( = ?auto_631954 ?auto_631960 ) ) ( not ( = ?auto_631955 ?auto_631956 ) ) ( not ( = ?auto_631955 ?auto_631957 ) ) ( not ( = ?auto_631955 ?auto_631958 ) ) ( not ( = ?auto_631955 ?auto_631959 ) ) ( not ( = ?auto_631955 ?auto_631960 ) ) ( not ( = ?auto_631956 ?auto_631957 ) ) ( not ( = ?auto_631956 ?auto_631958 ) ) ( not ( = ?auto_631956 ?auto_631959 ) ) ( not ( = ?auto_631956 ?auto_631960 ) ) ( not ( = ?auto_631957 ?auto_631958 ) ) ( not ( = ?auto_631957 ?auto_631959 ) ) ( not ( = ?auto_631957 ?auto_631960 ) ) ( not ( = ?auto_631958 ?auto_631959 ) ) ( not ( = ?auto_631958 ?auto_631960 ) ) ( not ( = ?auto_631959 ?auto_631960 ) ) ( ON ?auto_631958 ?auto_631959 ) ( ON ?auto_631957 ?auto_631958 ) ( ON ?auto_631956 ?auto_631957 ) ( ON ?auto_631955 ?auto_631956 ) ( ON ?auto_631954 ?auto_631955 ) ( ON ?auto_631953 ?auto_631954 ) ( ON ?auto_631952 ?auto_631953 ) ( ON ?auto_631951 ?auto_631952 ) ( ON ?auto_631950 ?auto_631951 ) ( ON ?auto_631949 ?auto_631950 ) ( ON ?auto_631948 ?auto_631949 ) ( ON ?auto_631947 ?auto_631948 ) ( ON ?auto_631946 ?auto_631947 ) ( CLEAR ?auto_631946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_631946 )
      ( MAKE-14PILE ?auto_631946 ?auto_631947 ?auto_631948 ?auto_631949 ?auto_631950 ?auto_631951 ?auto_631952 ?auto_631953 ?auto_631954 ?auto_631955 ?auto_631956 ?auto_631957 ?auto_631958 ?auto_631959 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632005 - BLOCK
      ?auto_632006 - BLOCK
      ?auto_632007 - BLOCK
      ?auto_632008 - BLOCK
      ?auto_632009 - BLOCK
      ?auto_632010 - BLOCK
      ?auto_632011 - BLOCK
      ?auto_632012 - BLOCK
      ?auto_632013 - BLOCK
      ?auto_632014 - BLOCK
      ?auto_632015 - BLOCK
      ?auto_632016 - BLOCK
      ?auto_632017 - BLOCK
      ?auto_632018 - BLOCK
      ?auto_632019 - BLOCK
    )
    :vars
    (
      ?auto_632020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_632018 ) ( ON ?auto_632019 ?auto_632020 ) ( CLEAR ?auto_632019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_632005 ) ( ON ?auto_632006 ?auto_632005 ) ( ON ?auto_632007 ?auto_632006 ) ( ON ?auto_632008 ?auto_632007 ) ( ON ?auto_632009 ?auto_632008 ) ( ON ?auto_632010 ?auto_632009 ) ( ON ?auto_632011 ?auto_632010 ) ( ON ?auto_632012 ?auto_632011 ) ( ON ?auto_632013 ?auto_632012 ) ( ON ?auto_632014 ?auto_632013 ) ( ON ?auto_632015 ?auto_632014 ) ( ON ?auto_632016 ?auto_632015 ) ( ON ?auto_632017 ?auto_632016 ) ( ON ?auto_632018 ?auto_632017 ) ( not ( = ?auto_632005 ?auto_632006 ) ) ( not ( = ?auto_632005 ?auto_632007 ) ) ( not ( = ?auto_632005 ?auto_632008 ) ) ( not ( = ?auto_632005 ?auto_632009 ) ) ( not ( = ?auto_632005 ?auto_632010 ) ) ( not ( = ?auto_632005 ?auto_632011 ) ) ( not ( = ?auto_632005 ?auto_632012 ) ) ( not ( = ?auto_632005 ?auto_632013 ) ) ( not ( = ?auto_632005 ?auto_632014 ) ) ( not ( = ?auto_632005 ?auto_632015 ) ) ( not ( = ?auto_632005 ?auto_632016 ) ) ( not ( = ?auto_632005 ?auto_632017 ) ) ( not ( = ?auto_632005 ?auto_632018 ) ) ( not ( = ?auto_632005 ?auto_632019 ) ) ( not ( = ?auto_632005 ?auto_632020 ) ) ( not ( = ?auto_632006 ?auto_632007 ) ) ( not ( = ?auto_632006 ?auto_632008 ) ) ( not ( = ?auto_632006 ?auto_632009 ) ) ( not ( = ?auto_632006 ?auto_632010 ) ) ( not ( = ?auto_632006 ?auto_632011 ) ) ( not ( = ?auto_632006 ?auto_632012 ) ) ( not ( = ?auto_632006 ?auto_632013 ) ) ( not ( = ?auto_632006 ?auto_632014 ) ) ( not ( = ?auto_632006 ?auto_632015 ) ) ( not ( = ?auto_632006 ?auto_632016 ) ) ( not ( = ?auto_632006 ?auto_632017 ) ) ( not ( = ?auto_632006 ?auto_632018 ) ) ( not ( = ?auto_632006 ?auto_632019 ) ) ( not ( = ?auto_632006 ?auto_632020 ) ) ( not ( = ?auto_632007 ?auto_632008 ) ) ( not ( = ?auto_632007 ?auto_632009 ) ) ( not ( = ?auto_632007 ?auto_632010 ) ) ( not ( = ?auto_632007 ?auto_632011 ) ) ( not ( = ?auto_632007 ?auto_632012 ) ) ( not ( = ?auto_632007 ?auto_632013 ) ) ( not ( = ?auto_632007 ?auto_632014 ) ) ( not ( = ?auto_632007 ?auto_632015 ) ) ( not ( = ?auto_632007 ?auto_632016 ) ) ( not ( = ?auto_632007 ?auto_632017 ) ) ( not ( = ?auto_632007 ?auto_632018 ) ) ( not ( = ?auto_632007 ?auto_632019 ) ) ( not ( = ?auto_632007 ?auto_632020 ) ) ( not ( = ?auto_632008 ?auto_632009 ) ) ( not ( = ?auto_632008 ?auto_632010 ) ) ( not ( = ?auto_632008 ?auto_632011 ) ) ( not ( = ?auto_632008 ?auto_632012 ) ) ( not ( = ?auto_632008 ?auto_632013 ) ) ( not ( = ?auto_632008 ?auto_632014 ) ) ( not ( = ?auto_632008 ?auto_632015 ) ) ( not ( = ?auto_632008 ?auto_632016 ) ) ( not ( = ?auto_632008 ?auto_632017 ) ) ( not ( = ?auto_632008 ?auto_632018 ) ) ( not ( = ?auto_632008 ?auto_632019 ) ) ( not ( = ?auto_632008 ?auto_632020 ) ) ( not ( = ?auto_632009 ?auto_632010 ) ) ( not ( = ?auto_632009 ?auto_632011 ) ) ( not ( = ?auto_632009 ?auto_632012 ) ) ( not ( = ?auto_632009 ?auto_632013 ) ) ( not ( = ?auto_632009 ?auto_632014 ) ) ( not ( = ?auto_632009 ?auto_632015 ) ) ( not ( = ?auto_632009 ?auto_632016 ) ) ( not ( = ?auto_632009 ?auto_632017 ) ) ( not ( = ?auto_632009 ?auto_632018 ) ) ( not ( = ?auto_632009 ?auto_632019 ) ) ( not ( = ?auto_632009 ?auto_632020 ) ) ( not ( = ?auto_632010 ?auto_632011 ) ) ( not ( = ?auto_632010 ?auto_632012 ) ) ( not ( = ?auto_632010 ?auto_632013 ) ) ( not ( = ?auto_632010 ?auto_632014 ) ) ( not ( = ?auto_632010 ?auto_632015 ) ) ( not ( = ?auto_632010 ?auto_632016 ) ) ( not ( = ?auto_632010 ?auto_632017 ) ) ( not ( = ?auto_632010 ?auto_632018 ) ) ( not ( = ?auto_632010 ?auto_632019 ) ) ( not ( = ?auto_632010 ?auto_632020 ) ) ( not ( = ?auto_632011 ?auto_632012 ) ) ( not ( = ?auto_632011 ?auto_632013 ) ) ( not ( = ?auto_632011 ?auto_632014 ) ) ( not ( = ?auto_632011 ?auto_632015 ) ) ( not ( = ?auto_632011 ?auto_632016 ) ) ( not ( = ?auto_632011 ?auto_632017 ) ) ( not ( = ?auto_632011 ?auto_632018 ) ) ( not ( = ?auto_632011 ?auto_632019 ) ) ( not ( = ?auto_632011 ?auto_632020 ) ) ( not ( = ?auto_632012 ?auto_632013 ) ) ( not ( = ?auto_632012 ?auto_632014 ) ) ( not ( = ?auto_632012 ?auto_632015 ) ) ( not ( = ?auto_632012 ?auto_632016 ) ) ( not ( = ?auto_632012 ?auto_632017 ) ) ( not ( = ?auto_632012 ?auto_632018 ) ) ( not ( = ?auto_632012 ?auto_632019 ) ) ( not ( = ?auto_632012 ?auto_632020 ) ) ( not ( = ?auto_632013 ?auto_632014 ) ) ( not ( = ?auto_632013 ?auto_632015 ) ) ( not ( = ?auto_632013 ?auto_632016 ) ) ( not ( = ?auto_632013 ?auto_632017 ) ) ( not ( = ?auto_632013 ?auto_632018 ) ) ( not ( = ?auto_632013 ?auto_632019 ) ) ( not ( = ?auto_632013 ?auto_632020 ) ) ( not ( = ?auto_632014 ?auto_632015 ) ) ( not ( = ?auto_632014 ?auto_632016 ) ) ( not ( = ?auto_632014 ?auto_632017 ) ) ( not ( = ?auto_632014 ?auto_632018 ) ) ( not ( = ?auto_632014 ?auto_632019 ) ) ( not ( = ?auto_632014 ?auto_632020 ) ) ( not ( = ?auto_632015 ?auto_632016 ) ) ( not ( = ?auto_632015 ?auto_632017 ) ) ( not ( = ?auto_632015 ?auto_632018 ) ) ( not ( = ?auto_632015 ?auto_632019 ) ) ( not ( = ?auto_632015 ?auto_632020 ) ) ( not ( = ?auto_632016 ?auto_632017 ) ) ( not ( = ?auto_632016 ?auto_632018 ) ) ( not ( = ?auto_632016 ?auto_632019 ) ) ( not ( = ?auto_632016 ?auto_632020 ) ) ( not ( = ?auto_632017 ?auto_632018 ) ) ( not ( = ?auto_632017 ?auto_632019 ) ) ( not ( = ?auto_632017 ?auto_632020 ) ) ( not ( = ?auto_632018 ?auto_632019 ) ) ( not ( = ?auto_632018 ?auto_632020 ) ) ( not ( = ?auto_632019 ?auto_632020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_632019 ?auto_632020 )
      ( !STACK ?auto_632019 ?auto_632018 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632067 - BLOCK
      ?auto_632068 - BLOCK
      ?auto_632069 - BLOCK
      ?auto_632070 - BLOCK
      ?auto_632071 - BLOCK
      ?auto_632072 - BLOCK
      ?auto_632073 - BLOCK
      ?auto_632074 - BLOCK
      ?auto_632075 - BLOCK
      ?auto_632076 - BLOCK
      ?auto_632077 - BLOCK
      ?auto_632078 - BLOCK
      ?auto_632079 - BLOCK
      ?auto_632080 - BLOCK
      ?auto_632081 - BLOCK
    )
    :vars
    (
      ?auto_632082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632081 ?auto_632082 ) ( ON-TABLE ?auto_632067 ) ( ON ?auto_632068 ?auto_632067 ) ( ON ?auto_632069 ?auto_632068 ) ( ON ?auto_632070 ?auto_632069 ) ( ON ?auto_632071 ?auto_632070 ) ( ON ?auto_632072 ?auto_632071 ) ( ON ?auto_632073 ?auto_632072 ) ( ON ?auto_632074 ?auto_632073 ) ( ON ?auto_632075 ?auto_632074 ) ( ON ?auto_632076 ?auto_632075 ) ( ON ?auto_632077 ?auto_632076 ) ( ON ?auto_632078 ?auto_632077 ) ( ON ?auto_632079 ?auto_632078 ) ( not ( = ?auto_632067 ?auto_632068 ) ) ( not ( = ?auto_632067 ?auto_632069 ) ) ( not ( = ?auto_632067 ?auto_632070 ) ) ( not ( = ?auto_632067 ?auto_632071 ) ) ( not ( = ?auto_632067 ?auto_632072 ) ) ( not ( = ?auto_632067 ?auto_632073 ) ) ( not ( = ?auto_632067 ?auto_632074 ) ) ( not ( = ?auto_632067 ?auto_632075 ) ) ( not ( = ?auto_632067 ?auto_632076 ) ) ( not ( = ?auto_632067 ?auto_632077 ) ) ( not ( = ?auto_632067 ?auto_632078 ) ) ( not ( = ?auto_632067 ?auto_632079 ) ) ( not ( = ?auto_632067 ?auto_632080 ) ) ( not ( = ?auto_632067 ?auto_632081 ) ) ( not ( = ?auto_632067 ?auto_632082 ) ) ( not ( = ?auto_632068 ?auto_632069 ) ) ( not ( = ?auto_632068 ?auto_632070 ) ) ( not ( = ?auto_632068 ?auto_632071 ) ) ( not ( = ?auto_632068 ?auto_632072 ) ) ( not ( = ?auto_632068 ?auto_632073 ) ) ( not ( = ?auto_632068 ?auto_632074 ) ) ( not ( = ?auto_632068 ?auto_632075 ) ) ( not ( = ?auto_632068 ?auto_632076 ) ) ( not ( = ?auto_632068 ?auto_632077 ) ) ( not ( = ?auto_632068 ?auto_632078 ) ) ( not ( = ?auto_632068 ?auto_632079 ) ) ( not ( = ?auto_632068 ?auto_632080 ) ) ( not ( = ?auto_632068 ?auto_632081 ) ) ( not ( = ?auto_632068 ?auto_632082 ) ) ( not ( = ?auto_632069 ?auto_632070 ) ) ( not ( = ?auto_632069 ?auto_632071 ) ) ( not ( = ?auto_632069 ?auto_632072 ) ) ( not ( = ?auto_632069 ?auto_632073 ) ) ( not ( = ?auto_632069 ?auto_632074 ) ) ( not ( = ?auto_632069 ?auto_632075 ) ) ( not ( = ?auto_632069 ?auto_632076 ) ) ( not ( = ?auto_632069 ?auto_632077 ) ) ( not ( = ?auto_632069 ?auto_632078 ) ) ( not ( = ?auto_632069 ?auto_632079 ) ) ( not ( = ?auto_632069 ?auto_632080 ) ) ( not ( = ?auto_632069 ?auto_632081 ) ) ( not ( = ?auto_632069 ?auto_632082 ) ) ( not ( = ?auto_632070 ?auto_632071 ) ) ( not ( = ?auto_632070 ?auto_632072 ) ) ( not ( = ?auto_632070 ?auto_632073 ) ) ( not ( = ?auto_632070 ?auto_632074 ) ) ( not ( = ?auto_632070 ?auto_632075 ) ) ( not ( = ?auto_632070 ?auto_632076 ) ) ( not ( = ?auto_632070 ?auto_632077 ) ) ( not ( = ?auto_632070 ?auto_632078 ) ) ( not ( = ?auto_632070 ?auto_632079 ) ) ( not ( = ?auto_632070 ?auto_632080 ) ) ( not ( = ?auto_632070 ?auto_632081 ) ) ( not ( = ?auto_632070 ?auto_632082 ) ) ( not ( = ?auto_632071 ?auto_632072 ) ) ( not ( = ?auto_632071 ?auto_632073 ) ) ( not ( = ?auto_632071 ?auto_632074 ) ) ( not ( = ?auto_632071 ?auto_632075 ) ) ( not ( = ?auto_632071 ?auto_632076 ) ) ( not ( = ?auto_632071 ?auto_632077 ) ) ( not ( = ?auto_632071 ?auto_632078 ) ) ( not ( = ?auto_632071 ?auto_632079 ) ) ( not ( = ?auto_632071 ?auto_632080 ) ) ( not ( = ?auto_632071 ?auto_632081 ) ) ( not ( = ?auto_632071 ?auto_632082 ) ) ( not ( = ?auto_632072 ?auto_632073 ) ) ( not ( = ?auto_632072 ?auto_632074 ) ) ( not ( = ?auto_632072 ?auto_632075 ) ) ( not ( = ?auto_632072 ?auto_632076 ) ) ( not ( = ?auto_632072 ?auto_632077 ) ) ( not ( = ?auto_632072 ?auto_632078 ) ) ( not ( = ?auto_632072 ?auto_632079 ) ) ( not ( = ?auto_632072 ?auto_632080 ) ) ( not ( = ?auto_632072 ?auto_632081 ) ) ( not ( = ?auto_632072 ?auto_632082 ) ) ( not ( = ?auto_632073 ?auto_632074 ) ) ( not ( = ?auto_632073 ?auto_632075 ) ) ( not ( = ?auto_632073 ?auto_632076 ) ) ( not ( = ?auto_632073 ?auto_632077 ) ) ( not ( = ?auto_632073 ?auto_632078 ) ) ( not ( = ?auto_632073 ?auto_632079 ) ) ( not ( = ?auto_632073 ?auto_632080 ) ) ( not ( = ?auto_632073 ?auto_632081 ) ) ( not ( = ?auto_632073 ?auto_632082 ) ) ( not ( = ?auto_632074 ?auto_632075 ) ) ( not ( = ?auto_632074 ?auto_632076 ) ) ( not ( = ?auto_632074 ?auto_632077 ) ) ( not ( = ?auto_632074 ?auto_632078 ) ) ( not ( = ?auto_632074 ?auto_632079 ) ) ( not ( = ?auto_632074 ?auto_632080 ) ) ( not ( = ?auto_632074 ?auto_632081 ) ) ( not ( = ?auto_632074 ?auto_632082 ) ) ( not ( = ?auto_632075 ?auto_632076 ) ) ( not ( = ?auto_632075 ?auto_632077 ) ) ( not ( = ?auto_632075 ?auto_632078 ) ) ( not ( = ?auto_632075 ?auto_632079 ) ) ( not ( = ?auto_632075 ?auto_632080 ) ) ( not ( = ?auto_632075 ?auto_632081 ) ) ( not ( = ?auto_632075 ?auto_632082 ) ) ( not ( = ?auto_632076 ?auto_632077 ) ) ( not ( = ?auto_632076 ?auto_632078 ) ) ( not ( = ?auto_632076 ?auto_632079 ) ) ( not ( = ?auto_632076 ?auto_632080 ) ) ( not ( = ?auto_632076 ?auto_632081 ) ) ( not ( = ?auto_632076 ?auto_632082 ) ) ( not ( = ?auto_632077 ?auto_632078 ) ) ( not ( = ?auto_632077 ?auto_632079 ) ) ( not ( = ?auto_632077 ?auto_632080 ) ) ( not ( = ?auto_632077 ?auto_632081 ) ) ( not ( = ?auto_632077 ?auto_632082 ) ) ( not ( = ?auto_632078 ?auto_632079 ) ) ( not ( = ?auto_632078 ?auto_632080 ) ) ( not ( = ?auto_632078 ?auto_632081 ) ) ( not ( = ?auto_632078 ?auto_632082 ) ) ( not ( = ?auto_632079 ?auto_632080 ) ) ( not ( = ?auto_632079 ?auto_632081 ) ) ( not ( = ?auto_632079 ?auto_632082 ) ) ( not ( = ?auto_632080 ?auto_632081 ) ) ( not ( = ?auto_632080 ?auto_632082 ) ) ( not ( = ?auto_632081 ?auto_632082 ) ) ( CLEAR ?auto_632079 ) ( ON ?auto_632080 ?auto_632081 ) ( CLEAR ?auto_632080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_632067 ?auto_632068 ?auto_632069 ?auto_632070 ?auto_632071 ?auto_632072 ?auto_632073 ?auto_632074 ?auto_632075 ?auto_632076 ?auto_632077 ?auto_632078 ?auto_632079 ?auto_632080 )
      ( MAKE-15PILE ?auto_632067 ?auto_632068 ?auto_632069 ?auto_632070 ?auto_632071 ?auto_632072 ?auto_632073 ?auto_632074 ?auto_632075 ?auto_632076 ?auto_632077 ?auto_632078 ?auto_632079 ?auto_632080 ?auto_632081 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632129 - BLOCK
      ?auto_632130 - BLOCK
      ?auto_632131 - BLOCK
      ?auto_632132 - BLOCK
      ?auto_632133 - BLOCK
      ?auto_632134 - BLOCK
      ?auto_632135 - BLOCK
      ?auto_632136 - BLOCK
      ?auto_632137 - BLOCK
      ?auto_632138 - BLOCK
      ?auto_632139 - BLOCK
      ?auto_632140 - BLOCK
      ?auto_632141 - BLOCK
      ?auto_632142 - BLOCK
      ?auto_632143 - BLOCK
    )
    :vars
    (
      ?auto_632144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632143 ?auto_632144 ) ( ON-TABLE ?auto_632129 ) ( ON ?auto_632130 ?auto_632129 ) ( ON ?auto_632131 ?auto_632130 ) ( ON ?auto_632132 ?auto_632131 ) ( ON ?auto_632133 ?auto_632132 ) ( ON ?auto_632134 ?auto_632133 ) ( ON ?auto_632135 ?auto_632134 ) ( ON ?auto_632136 ?auto_632135 ) ( ON ?auto_632137 ?auto_632136 ) ( ON ?auto_632138 ?auto_632137 ) ( ON ?auto_632139 ?auto_632138 ) ( ON ?auto_632140 ?auto_632139 ) ( not ( = ?auto_632129 ?auto_632130 ) ) ( not ( = ?auto_632129 ?auto_632131 ) ) ( not ( = ?auto_632129 ?auto_632132 ) ) ( not ( = ?auto_632129 ?auto_632133 ) ) ( not ( = ?auto_632129 ?auto_632134 ) ) ( not ( = ?auto_632129 ?auto_632135 ) ) ( not ( = ?auto_632129 ?auto_632136 ) ) ( not ( = ?auto_632129 ?auto_632137 ) ) ( not ( = ?auto_632129 ?auto_632138 ) ) ( not ( = ?auto_632129 ?auto_632139 ) ) ( not ( = ?auto_632129 ?auto_632140 ) ) ( not ( = ?auto_632129 ?auto_632141 ) ) ( not ( = ?auto_632129 ?auto_632142 ) ) ( not ( = ?auto_632129 ?auto_632143 ) ) ( not ( = ?auto_632129 ?auto_632144 ) ) ( not ( = ?auto_632130 ?auto_632131 ) ) ( not ( = ?auto_632130 ?auto_632132 ) ) ( not ( = ?auto_632130 ?auto_632133 ) ) ( not ( = ?auto_632130 ?auto_632134 ) ) ( not ( = ?auto_632130 ?auto_632135 ) ) ( not ( = ?auto_632130 ?auto_632136 ) ) ( not ( = ?auto_632130 ?auto_632137 ) ) ( not ( = ?auto_632130 ?auto_632138 ) ) ( not ( = ?auto_632130 ?auto_632139 ) ) ( not ( = ?auto_632130 ?auto_632140 ) ) ( not ( = ?auto_632130 ?auto_632141 ) ) ( not ( = ?auto_632130 ?auto_632142 ) ) ( not ( = ?auto_632130 ?auto_632143 ) ) ( not ( = ?auto_632130 ?auto_632144 ) ) ( not ( = ?auto_632131 ?auto_632132 ) ) ( not ( = ?auto_632131 ?auto_632133 ) ) ( not ( = ?auto_632131 ?auto_632134 ) ) ( not ( = ?auto_632131 ?auto_632135 ) ) ( not ( = ?auto_632131 ?auto_632136 ) ) ( not ( = ?auto_632131 ?auto_632137 ) ) ( not ( = ?auto_632131 ?auto_632138 ) ) ( not ( = ?auto_632131 ?auto_632139 ) ) ( not ( = ?auto_632131 ?auto_632140 ) ) ( not ( = ?auto_632131 ?auto_632141 ) ) ( not ( = ?auto_632131 ?auto_632142 ) ) ( not ( = ?auto_632131 ?auto_632143 ) ) ( not ( = ?auto_632131 ?auto_632144 ) ) ( not ( = ?auto_632132 ?auto_632133 ) ) ( not ( = ?auto_632132 ?auto_632134 ) ) ( not ( = ?auto_632132 ?auto_632135 ) ) ( not ( = ?auto_632132 ?auto_632136 ) ) ( not ( = ?auto_632132 ?auto_632137 ) ) ( not ( = ?auto_632132 ?auto_632138 ) ) ( not ( = ?auto_632132 ?auto_632139 ) ) ( not ( = ?auto_632132 ?auto_632140 ) ) ( not ( = ?auto_632132 ?auto_632141 ) ) ( not ( = ?auto_632132 ?auto_632142 ) ) ( not ( = ?auto_632132 ?auto_632143 ) ) ( not ( = ?auto_632132 ?auto_632144 ) ) ( not ( = ?auto_632133 ?auto_632134 ) ) ( not ( = ?auto_632133 ?auto_632135 ) ) ( not ( = ?auto_632133 ?auto_632136 ) ) ( not ( = ?auto_632133 ?auto_632137 ) ) ( not ( = ?auto_632133 ?auto_632138 ) ) ( not ( = ?auto_632133 ?auto_632139 ) ) ( not ( = ?auto_632133 ?auto_632140 ) ) ( not ( = ?auto_632133 ?auto_632141 ) ) ( not ( = ?auto_632133 ?auto_632142 ) ) ( not ( = ?auto_632133 ?auto_632143 ) ) ( not ( = ?auto_632133 ?auto_632144 ) ) ( not ( = ?auto_632134 ?auto_632135 ) ) ( not ( = ?auto_632134 ?auto_632136 ) ) ( not ( = ?auto_632134 ?auto_632137 ) ) ( not ( = ?auto_632134 ?auto_632138 ) ) ( not ( = ?auto_632134 ?auto_632139 ) ) ( not ( = ?auto_632134 ?auto_632140 ) ) ( not ( = ?auto_632134 ?auto_632141 ) ) ( not ( = ?auto_632134 ?auto_632142 ) ) ( not ( = ?auto_632134 ?auto_632143 ) ) ( not ( = ?auto_632134 ?auto_632144 ) ) ( not ( = ?auto_632135 ?auto_632136 ) ) ( not ( = ?auto_632135 ?auto_632137 ) ) ( not ( = ?auto_632135 ?auto_632138 ) ) ( not ( = ?auto_632135 ?auto_632139 ) ) ( not ( = ?auto_632135 ?auto_632140 ) ) ( not ( = ?auto_632135 ?auto_632141 ) ) ( not ( = ?auto_632135 ?auto_632142 ) ) ( not ( = ?auto_632135 ?auto_632143 ) ) ( not ( = ?auto_632135 ?auto_632144 ) ) ( not ( = ?auto_632136 ?auto_632137 ) ) ( not ( = ?auto_632136 ?auto_632138 ) ) ( not ( = ?auto_632136 ?auto_632139 ) ) ( not ( = ?auto_632136 ?auto_632140 ) ) ( not ( = ?auto_632136 ?auto_632141 ) ) ( not ( = ?auto_632136 ?auto_632142 ) ) ( not ( = ?auto_632136 ?auto_632143 ) ) ( not ( = ?auto_632136 ?auto_632144 ) ) ( not ( = ?auto_632137 ?auto_632138 ) ) ( not ( = ?auto_632137 ?auto_632139 ) ) ( not ( = ?auto_632137 ?auto_632140 ) ) ( not ( = ?auto_632137 ?auto_632141 ) ) ( not ( = ?auto_632137 ?auto_632142 ) ) ( not ( = ?auto_632137 ?auto_632143 ) ) ( not ( = ?auto_632137 ?auto_632144 ) ) ( not ( = ?auto_632138 ?auto_632139 ) ) ( not ( = ?auto_632138 ?auto_632140 ) ) ( not ( = ?auto_632138 ?auto_632141 ) ) ( not ( = ?auto_632138 ?auto_632142 ) ) ( not ( = ?auto_632138 ?auto_632143 ) ) ( not ( = ?auto_632138 ?auto_632144 ) ) ( not ( = ?auto_632139 ?auto_632140 ) ) ( not ( = ?auto_632139 ?auto_632141 ) ) ( not ( = ?auto_632139 ?auto_632142 ) ) ( not ( = ?auto_632139 ?auto_632143 ) ) ( not ( = ?auto_632139 ?auto_632144 ) ) ( not ( = ?auto_632140 ?auto_632141 ) ) ( not ( = ?auto_632140 ?auto_632142 ) ) ( not ( = ?auto_632140 ?auto_632143 ) ) ( not ( = ?auto_632140 ?auto_632144 ) ) ( not ( = ?auto_632141 ?auto_632142 ) ) ( not ( = ?auto_632141 ?auto_632143 ) ) ( not ( = ?auto_632141 ?auto_632144 ) ) ( not ( = ?auto_632142 ?auto_632143 ) ) ( not ( = ?auto_632142 ?auto_632144 ) ) ( not ( = ?auto_632143 ?auto_632144 ) ) ( ON ?auto_632142 ?auto_632143 ) ( CLEAR ?auto_632140 ) ( ON ?auto_632141 ?auto_632142 ) ( CLEAR ?auto_632141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_632129 ?auto_632130 ?auto_632131 ?auto_632132 ?auto_632133 ?auto_632134 ?auto_632135 ?auto_632136 ?auto_632137 ?auto_632138 ?auto_632139 ?auto_632140 ?auto_632141 )
      ( MAKE-15PILE ?auto_632129 ?auto_632130 ?auto_632131 ?auto_632132 ?auto_632133 ?auto_632134 ?auto_632135 ?auto_632136 ?auto_632137 ?auto_632138 ?auto_632139 ?auto_632140 ?auto_632141 ?auto_632142 ?auto_632143 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632191 - BLOCK
      ?auto_632192 - BLOCK
      ?auto_632193 - BLOCK
      ?auto_632194 - BLOCK
      ?auto_632195 - BLOCK
      ?auto_632196 - BLOCK
      ?auto_632197 - BLOCK
      ?auto_632198 - BLOCK
      ?auto_632199 - BLOCK
      ?auto_632200 - BLOCK
      ?auto_632201 - BLOCK
      ?auto_632202 - BLOCK
      ?auto_632203 - BLOCK
      ?auto_632204 - BLOCK
      ?auto_632205 - BLOCK
    )
    :vars
    (
      ?auto_632206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632205 ?auto_632206 ) ( ON-TABLE ?auto_632191 ) ( ON ?auto_632192 ?auto_632191 ) ( ON ?auto_632193 ?auto_632192 ) ( ON ?auto_632194 ?auto_632193 ) ( ON ?auto_632195 ?auto_632194 ) ( ON ?auto_632196 ?auto_632195 ) ( ON ?auto_632197 ?auto_632196 ) ( ON ?auto_632198 ?auto_632197 ) ( ON ?auto_632199 ?auto_632198 ) ( ON ?auto_632200 ?auto_632199 ) ( ON ?auto_632201 ?auto_632200 ) ( not ( = ?auto_632191 ?auto_632192 ) ) ( not ( = ?auto_632191 ?auto_632193 ) ) ( not ( = ?auto_632191 ?auto_632194 ) ) ( not ( = ?auto_632191 ?auto_632195 ) ) ( not ( = ?auto_632191 ?auto_632196 ) ) ( not ( = ?auto_632191 ?auto_632197 ) ) ( not ( = ?auto_632191 ?auto_632198 ) ) ( not ( = ?auto_632191 ?auto_632199 ) ) ( not ( = ?auto_632191 ?auto_632200 ) ) ( not ( = ?auto_632191 ?auto_632201 ) ) ( not ( = ?auto_632191 ?auto_632202 ) ) ( not ( = ?auto_632191 ?auto_632203 ) ) ( not ( = ?auto_632191 ?auto_632204 ) ) ( not ( = ?auto_632191 ?auto_632205 ) ) ( not ( = ?auto_632191 ?auto_632206 ) ) ( not ( = ?auto_632192 ?auto_632193 ) ) ( not ( = ?auto_632192 ?auto_632194 ) ) ( not ( = ?auto_632192 ?auto_632195 ) ) ( not ( = ?auto_632192 ?auto_632196 ) ) ( not ( = ?auto_632192 ?auto_632197 ) ) ( not ( = ?auto_632192 ?auto_632198 ) ) ( not ( = ?auto_632192 ?auto_632199 ) ) ( not ( = ?auto_632192 ?auto_632200 ) ) ( not ( = ?auto_632192 ?auto_632201 ) ) ( not ( = ?auto_632192 ?auto_632202 ) ) ( not ( = ?auto_632192 ?auto_632203 ) ) ( not ( = ?auto_632192 ?auto_632204 ) ) ( not ( = ?auto_632192 ?auto_632205 ) ) ( not ( = ?auto_632192 ?auto_632206 ) ) ( not ( = ?auto_632193 ?auto_632194 ) ) ( not ( = ?auto_632193 ?auto_632195 ) ) ( not ( = ?auto_632193 ?auto_632196 ) ) ( not ( = ?auto_632193 ?auto_632197 ) ) ( not ( = ?auto_632193 ?auto_632198 ) ) ( not ( = ?auto_632193 ?auto_632199 ) ) ( not ( = ?auto_632193 ?auto_632200 ) ) ( not ( = ?auto_632193 ?auto_632201 ) ) ( not ( = ?auto_632193 ?auto_632202 ) ) ( not ( = ?auto_632193 ?auto_632203 ) ) ( not ( = ?auto_632193 ?auto_632204 ) ) ( not ( = ?auto_632193 ?auto_632205 ) ) ( not ( = ?auto_632193 ?auto_632206 ) ) ( not ( = ?auto_632194 ?auto_632195 ) ) ( not ( = ?auto_632194 ?auto_632196 ) ) ( not ( = ?auto_632194 ?auto_632197 ) ) ( not ( = ?auto_632194 ?auto_632198 ) ) ( not ( = ?auto_632194 ?auto_632199 ) ) ( not ( = ?auto_632194 ?auto_632200 ) ) ( not ( = ?auto_632194 ?auto_632201 ) ) ( not ( = ?auto_632194 ?auto_632202 ) ) ( not ( = ?auto_632194 ?auto_632203 ) ) ( not ( = ?auto_632194 ?auto_632204 ) ) ( not ( = ?auto_632194 ?auto_632205 ) ) ( not ( = ?auto_632194 ?auto_632206 ) ) ( not ( = ?auto_632195 ?auto_632196 ) ) ( not ( = ?auto_632195 ?auto_632197 ) ) ( not ( = ?auto_632195 ?auto_632198 ) ) ( not ( = ?auto_632195 ?auto_632199 ) ) ( not ( = ?auto_632195 ?auto_632200 ) ) ( not ( = ?auto_632195 ?auto_632201 ) ) ( not ( = ?auto_632195 ?auto_632202 ) ) ( not ( = ?auto_632195 ?auto_632203 ) ) ( not ( = ?auto_632195 ?auto_632204 ) ) ( not ( = ?auto_632195 ?auto_632205 ) ) ( not ( = ?auto_632195 ?auto_632206 ) ) ( not ( = ?auto_632196 ?auto_632197 ) ) ( not ( = ?auto_632196 ?auto_632198 ) ) ( not ( = ?auto_632196 ?auto_632199 ) ) ( not ( = ?auto_632196 ?auto_632200 ) ) ( not ( = ?auto_632196 ?auto_632201 ) ) ( not ( = ?auto_632196 ?auto_632202 ) ) ( not ( = ?auto_632196 ?auto_632203 ) ) ( not ( = ?auto_632196 ?auto_632204 ) ) ( not ( = ?auto_632196 ?auto_632205 ) ) ( not ( = ?auto_632196 ?auto_632206 ) ) ( not ( = ?auto_632197 ?auto_632198 ) ) ( not ( = ?auto_632197 ?auto_632199 ) ) ( not ( = ?auto_632197 ?auto_632200 ) ) ( not ( = ?auto_632197 ?auto_632201 ) ) ( not ( = ?auto_632197 ?auto_632202 ) ) ( not ( = ?auto_632197 ?auto_632203 ) ) ( not ( = ?auto_632197 ?auto_632204 ) ) ( not ( = ?auto_632197 ?auto_632205 ) ) ( not ( = ?auto_632197 ?auto_632206 ) ) ( not ( = ?auto_632198 ?auto_632199 ) ) ( not ( = ?auto_632198 ?auto_632200 ) ) ( not ( = ?auto_632198 ?auto_632201 ) ) ( not ( = ?auto_632198 ?auto_632202 ) ) ( not ( = ?auto_632198 ?auto_632203 ) ) ( not ( = ?auto_632198 ?auto_632204 ) ) ( not ( = ?auto_632198 ?auto_632205 ) ) ( not ( = ?auto_632198 ?auto_632206 ) ) ( not ( = ?auto_632199 ?auto_632200 ) ) ( not ( = ?auto_632199 ?auto_632201 ) ) ( not ( = ?auto_632199 ?auto_632202 ) ) ( not ( = ?auto_632199 ?auto_632203 ) ) ( not ( = ?auto_632199 ?auto_632204 ) ) ( not ( = ?auto_632199 ?auto_632205 ) ) ( not ( = ?auto_632199 ?auto_632206 ) ) ( not ( = ?auto_632200 ?auto_632201 ) ) ( not ( = ?auto_632200 ?auto_632202 ) ) ( not ( = ?auto_632200 ?auto_632203 ) ) ( not ( = ?auto_632200 ?auto_632204 ) ) ( not ( = ?auto_632200 ?auto_632205 ) ) ( not ( = ?auto_632200 ?auto_632206 ) ) ( not ( = ?auto_632201 ?auto_632202 ) ) ( not ( = ?auto_632201 ?auto_632203 ) ) ( not ( = ?auto_632201 ?auto_632204 ) ) ( not ( = ?auto_632201 ?auto_632205 ) ) ( not ( = ?auto_632201 ?auto_632206 ) ) ( not ( = ?auto_632202 ?auto_632203 ) ) ( not ( = ?auto_632202 ?auto_632204 ) ) ( not ( = ?auto_632202 ?auto_632205 ) ) ( not ( = ?auto_632202 ?auto_632206 ) ) ( not ( = ?auto_632203 ?auto_632204 ) ) ( not ( = ?auto_632203 ?auto_632205 ) ) ( not ( = ?auto_632203 ?auto_632206 ) ) ( not ( = ?auto_632204 ?auto_632205 ) ) ( not ( = ?auto_632204 ?auto_632206 ) ) ( not ( = ?auto_632205 ?auto_632206 ) ) ( ON ?auto_632204 ?auto_632205 ) ( ON ?auto_632203 ?auto_632204 ) ( CLEAR ?auto_632201 ) ( ON ?auto_632202 ?auto_632203 ) ( CLEAR ?auto_632202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_632191 ?auto_632192 ?auto_632193 ?auto_632194 ?auto_632195 ?auto_632196 ?auto_632197 ?auto_632198 ?auto_632199 ?auto_632200 ?auto_632201 ?auto_632202 )
      ( MAKE-15PILE ?auto_632191 ?auto_632192 ?auto_632193 ?auto_632194 ?auto_632195 ?auto_632196 ?auto_632197 ?auto_632198 ?auto_632199 ?auto_632200 ?auto_632201 ?auto_632202 ?auto_632203 ?auto_632204 ?auto_632205 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632253 - BLOCK
      ?auto_632254 - BLOCK
      ?auto_632255 - BLOCK
      ?auto_632256 - BLOCK
      ?auto_632257 - BLOCK
      ?auto_632258 - BLOCK
      ?auto_632259 - BLOCK
      ?auto_632260 - BLOCK
      ?auto_632261 - BLOCK
      ?auto_632262 - BLOCK
      ?auto_632263 - BLOCK
      ?auto_632264 - BLOCK
      ?auto_632265 - BLOCK
      ?auto_632266 - BLOCK
      ?auto_632267 - BLOCK
    )
    :vars
    (
      ?auto_632268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632267 ?auto_632268 ) ( ON-TABLE ?auto_632253 ) ( ON ?auto_632254 ?auto_632253 ) ( ON ?auto_632255 ?auto_632254 ) ( ON ?auto_632256 ?auto_632255 ) ( ON ?auto_632257 ?auto_632256 ) ( ON ?auto_632258 ?auto_632257 ) ( ON ?auto_632259 ?auto_632258 ) ( ON ?auto_632260 ?auto_632259 ) ( ON ?auto_632261 ?auto_632260 ) ( ON ?auto_632262 ?auto_632261 ) ( not ( = ?auto_632253 ?auto_632254 ) ) ( not ( = ?auto_632253 ?auto_632255 ) ) ( not ( = ?auto_632253 ?auto_632256 ) ) ( not ( = ?auto_632253 ?auto_632257 ) ) ( not ( = ?auto_632253 ?auto_632258 ) ) ( not ( = ?auto_632253 ?auto_632259 ) ) ( not ( = ?auto_632253 ?auto_632260 ) ) ( not ( = ?auto_632253 ?auto_632261 ) ) ( not ( = ?auto_632253 ?auto_632262 ) ) ( not ( = ?auto_632253 ?auto_632263 ) ) ( not ( = ?auto_632253 ?auto_632264 ) ) ( not ( = ?auto_632253 ?auto_632265 ) ) ( not ( = ?auto_632253 ?auto_632266 ) ) ( not ( = ?auto_632253 ?auto_632267 ) ) ( not ( = ?auto_632253 ?auto_632268 ) ) ( not ( = ?auto_632254 ?auto_632255 ) ) ( not ( = ?auto_632254 ?auto_632256 ) ) ( not ( = ?auto_632254 ?auto_632257 ) ) ( not ( = ?auto_632254 ?auto_632258 ) ) ( not ( = ?auto_632254 ?auto_632259 ) ) ( not ( = ?auto_632254 ?auto_632260 ) ) ( not ( = ?auto_632254 ?auto_632261 ) ) ( not ( = ?auto_632254 ?auto_632262 ) ) ( not ( = ?auto_632254 ?auto_632263 ) ) ( not ( = ?auto_632254 ?auto_632264 ) ) ( not ( = ?auto_632254 ?auto_632265 ) ) ( not ( = ?auto_632254 ?auto_632266 ) ) ( not ( = ?auto_632254 ?auto_632267 ) ) ( not ( = ?auto_632254 ?auto_632268 ) ) ( not ( = ?auto_632255 ?auto_632256 ) ) ( not ( = ?auto_632255 ?auto_632257 ) ) ( not ( = ?auto_632255 ?auto_632258 ) ) ( not ( = ?auto_632255 ?auto_632259 ) ) ( not ( = ?auto_632255 ?auto_632260 ) ) ( not ( = ?auto_632255 ?auto_632261 ) ) ( not ( = ?auto_632255 ?auto_632262 ) ) ( not ( = ?auto_632255 ?auto_632263 ) ) ( not ( = ?auto_632255 ?auto_632264 ) ) ( not ( = ?auto_632255 ?auto_632265 ) ) ( not ( = ?auto_632255 ?auto_632266 ) ) ( not ( = ?auto_632255 ?auto_632267 ) ) ( not ( = ?auto_632255 ?auto_632268 ) ) ( not ( = ?auto_632256 ?auto_632257 ) ) ( not ( = ?auto_632256 ?auto_632258 ) ) ( not ( = ?auto_632256 ?auto_632259 ) ) ( not ( = ?auto_632256 ?auto_632260 ) ) ( not ( = ?auto_632256 ?auto_632261 ) ) ( not ( = ?auto_632256 ?auto_632262 ) ) ( not ( = ?auto_632256 ?auto_632263 ) ) ( not ( = ?auto_632256 ?auto_632264 ) ) ( not ( = ?auto_632256 ?auto_632265 ) ) ( not ( = ?auto_632256 ?auto_632266 ) ) ( not ( = ?auto_632256 ?auto_632267 ) ) ( not ( = ?auto_632256 ?auto_632268 ) ) ( not ( = ?auto_632257 ?auto_632258 ) ) ( not ( = ?auto_632257 ?auto_632259 ) ) ( not ( = ?auto_632257 ?auto_632260 ) ) ( not ( = ?auto_632257 ?auto_632261 ) ) ( not ( = ?auto_632257 ?auto_632262 ) ) ( not ( = ?auto_632257 ?auto_632263 ) ) ( not ( = ?auto_632257 ?auto_632264 ) ) ( not ( = ?auto_632257 ?auto_632265 ) ) ( not ( = ?auto_632257 ?auto_632266 ) ) ( not ( = ?auto_632257 ?auto_632267 ) ) ( not ( = ?auto_632257 ?auto_632268 ) ) ( not ( = ?auto_632258 ?auto_632259 ) ) ( not ( = ?auto_632258 ?auto_632260 ) ) ( not ( = ?auto_632258 ?auto_632261 ) ) ( not ( = ?auto_632258 ?auto_632262 ) ) ( not ( = ?auto_632258 ?auto_632263 ) ) ( not ( = ?auto_632258 ?auto_632264 ) ) ( not ( = ?auto_632258 ?auto_632265 ) ) ( not ( = ?auto_632258 ?auto_632266 ) ) ( not ( = ?auto_632258 ?auto_632267 ) ) ( not ( = ?auto_632258 ?auto_632268 ) ) ( not ( = ?auto_632259 ?auto_632260 ) ) ( not ( = ?auto_632259 ?auto_632261 ) ) ( not ( = ?auto_632259 ?auto_632262 ) ) ( not ( = ?auto_632259 ?auto_632263 ) ) ( not ( = ?auto_632259 ?auto_632264 ) ) ( not ( = ?auto_632259 ?auto_632265 ) ) ( not ( = ?auto_632259 ?auto_632266 ) ) ( not ( = ?auto_632259 ?auto_632267 ) ) ( not ( = ?auto_632259 ?auto_632268 ) ) ( not ( = ?auto_632260 ?auto_632261 ) ) ( not ( = ?auto_632260 ?auto_632262 ) ) ( not ( = ?auto_632260 ?auto_632263 ) ) ( not ( = ?auto_632260 ?auto_632264 ) ) ( not ( = ?auto_632260 ?auto_632265 ) ) ( not ( = ?auto_632260 ?auto_632266 ) ) ( not ( = ?auto_632260 ?auto_632267 ) ) ( not ( = ?auto_632260 ?auto_632268 ) ) ( not ( = ?auto_632261 ?auto_632262 ) ) ( not ( = ?auto_632261 ?auto_632263 ) ) ( not ( = ?auto_632261 ?auto_632264 ) ) ( not ( = ?auto_632261 ?auto_632265 ) ) ( not ( = ?auto_632261 ?auto_632266 ) ) ( not ( = ?auto_632261 ?auto_632267 ) ) ( not ( = ?auto_632261 ?auto_632268 ) ) ( not ( = ?auto_632262 ?auto_632263 ) ) ( not ( = ?auto_632262 ?auto_632264 ) ) ( not ( = ?auto_632262 ?auto_632265 ) ) ( not ( = ?auto_632262 ?auto_632266 ) ) ( not ( = ?auto_632262 ?auto_632267 ) ) ( not ( = ?auto_632262 ?auto_632268 ) ) ( not ( = ?auto_632263 ?auto_632264 ) ) ( not ( = ?auto_632263 ?auto_632265 ) ) ( not ( = ?auto_632263 ?auto_632266 ) ) ( not ( = ?auto_632263 ?auto_632267 ) ) ( not ( = ?auto_632263 ?auto_632268 ) ) ( not ( = ?auto_632264 ?auto_632265 ) ) ( not ( = ?auto_632264 ?auto_632266 ) ) ( not ( = ?auto_632264 ?auto_632267 ) ) ( not ( = ?auto_632264 ?auto_632268 ) ) ( not ( = ?auto_632265 ?auto_632266 ) ) ( not ( = ?auto_632265 ?auto_632267 ) ) ( not ( = ?auto_632265 ?auto_632268 ) ) ( not ( = ?auto_632266 ?auto_632267 ) ) ( not ( = ?auto_632266 ?auto_632268 ) ) ( not ( = ?auto_632267 ?auto_632268 ) ) ( ON ?auto_632266 ?auto_632267 ) ( ON ?auto_632265 ?auto_632266 ) ( ON ?auto_632264 ?auto_632265 ) ( CLEAR ?auto_632262 ) ( ON ?auto_632263 ?auto_632264 ) ( CLEAR ?auto_632263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_632253 ?auto_632254 ?auto_632255 ?auto_632256 ?auto_632257 ?auto_632258 ?auto_632259 ?auto_632260 ?auto_632261 ?auto_632262 ?auto_632263 )
      ( MAKE-15PILE ?auto_632253 ?auto_632254 ?auto_632255 ?auto_632256 ?auto_632257 ?auto_632258 ?auto_632259 ?auto_632260 ?auto_632261 ?auto_632262 ?auto_632263 ?auto_632264 ?auto_632265 ?auto_632266 ?auto_632267 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632315 - BLOCK
      ?auto_632316 - BLOCK
      ?auto_632317 - BLOCK
      ?auto_632318 - BLOCK
      ?auto_632319 - BLOCK
      ?auto_632320 - BLOCK
      ?auto_632321 - BLOCK
      ?auto_632322 - BLOCK
      ?auto_632323 - BLOCK
      ?auto_632324 - BLOCK
      ?auto_632325 - BLOCK
      ?auto_632326 - BLOCK
      ?auto_632327 - BLOCK
      ?auto_632328 - BLOCK
      ?auto_632329 - BLOCK
    )
    :vars
    (
      ?auto_632330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632329 ?auto_632330 ) ( ON-TABLE ?auto_632315 ) ( ON ?auto_632316 ?auto_632315 ) ( ON ?auto_632317 ?auto_632316 ) ( ON ?auto_632318 ?auto_632317 ) ( ON ?auto_632319 ?auto_632318 ) ( ON ?auto_632320 ?auto_632319 ) ( ON ?auto_632321 ?auto_632320 ) ( ON ?auto_632322 ?auto_632321 ) ( ON ?auto_632323 ?auto_632322 ) ( not ( = ?auto_632315 ?auto_632316 ) ) ( not ( = ?auto_632315 ?auto_632317 ) ) ( not ( = ?auto_632315 ?auto_632318 ) ) ( not ( = ?auto_632315 ?auto_632319 ) ) ( not ( = ?auto_632315 ?auto_632320 ) ) ( not ( = ?auto_632315 ?auto_632321 ) ) ( not ( = ?auto_632315 ?auto_632322 ) ) ( not ( = ?auto_632315 ?auto_632323 ) ) ( not ( = ?auto_632315 ?auto_632324 ) ) ( not ( = ?auto_632315 ?auto_632325 ) ) ( not ( = ?auto_632315 ?auto_632326 ) ) ( not ( = ?auto_632315 ?auto_632327 ) ) ( not ( = ?auto_632315 ?auto_632328 ) ) ( not ( = ?auto_632315 ?auto_632329 ) ) ( not ( = ?auto_632315 ?auto_632330 ) ) ( not ( = ?auto_632316 ?auto_632317 ) ) ( not ( = ?auto_632316 ?auto_632318 ) ) ( not ( = ?auto_632316 ?auto_632319 ) ) ( not ( = ?auto_632316 ?auto_632320 ) ) ( not ( = ?auto_632316 ?auto_632321 ) ) ( not ( = ?auto_632316 ?auto_632322 ) ) ( not ( = ?auto_632316 ?auto_632323 ) ) ( not ( = ?auto_632316 ?auto_632324 ) ) ( not ( = ?auto_632316 ?auto_632325 ) ) ( not ( = ?auto_632316 ?auto_632326 ) ) ( not ( = ?auto_632316 ?auto_632327 ) ) ( not ( = ?auto_632316 ?auto_632328 ) ) ( not ( = ?auto_632316 ?auto_632329 ) ) ( not ( = ?auto_632316 ?auto_632330 ) ) ( not ( = ?auto_632317 ?auto_632318 ) ) ( not ( = ?auto_632317 ?auto_632319 ) ) ( not ( = ?auto_632317 ?auto_632320 ) ) ( not ( = ?auto_632317 ?auto_632321 ) ) ( not ( = ?auto_632317 ?auto_632322 ) ) ( not ( = ?auto_632317 ?auto_632323 ) ) ( not ( = ?auto_632317 ?auto_632324 ) ) ( not ( = ?auto_632317 ?auto_632325 ) ) ( not ( = ?auto_632317 ?auto_632326 ) ) ( not ( = ?auto_632317 ?auto_632327 ) ) ( not ( = ?auto_632317 ?auto_632328 ) ) ( not ( = ?auto_632317 ?auto_632329 ) ) ( not ( = ?auto_632317 ?auto_632330 ) ) ( not ( = ?auto_632318 ?auto_632319 ) ) ( not ( = ?auto_632318 ?auto_632320 ) ) ( not ( = ?auto_632318 ?auto_632321 ) ) ( not ( = ?auto_632318 ?auto_632322 ) ) ( not ( = ?auto_632318 ?auto_632323 ) ) ( not ( = ?auto_632318 ?auto_632324 ) ) ( not ( = ?auto_632318 ?auto_632325 ) ) ( not ( = ?auto_632318 ?auto_632326 ) ) ( not ( = ?auto_632318 ?auto_632327 ) ) ( not ( = ?auto_632318 ?auto_632328 ) ) ( not ( = ?auto_632318 ?auto_632329 ) ) ( not ( = ?auto_632318 ?auto_632330 ) ) ( not ( = ?auto_632319 ?auto_632320 ) ) ( not ( = ?auto_632319 ?auto_632321 ) ) ( not ( = ?auto_632319 ?auto_632322 ) ) ( not ( = ?auto_632319 ?auto_632323 ) ) ( not ( = ?auto_632319 ?auto_632324 ) ) ( not ( = ?auto_632319 ?auto_632325 ) ) ( not ( = ?auto_632319 ?auto_632326 ) ) ( not ( = ?auto_632319 ?auto_632327 ) ) ( not ( = ?auto_632319 ?auto_632328 ) ) ( not ( = ?auto_632319 ?auto_632329 ) ) ( not ( = ?auto_632319 ?auto_632330 ) ) ( not ( = ?auto_632320 ?auto_632321 ) ) ( not ( = ?auto_632320 ?auto_632322 ) ) ( not ( = ?auto_632320 ?auto_632323 ) ) ( not ( = ?auto_632320 ?auto_632324 ) ) ( not ( = ?auto_632320 ?auto_632325 ) ) ( not ( = ?auto_632320 ?auto_632326 ) ) ( not ( = ?auto_632320 ?auto_632327 ) ) ( not ( = ?auto_632320 ?auto_632328 ) ) ( not ( = ?auto_632320 ?auto_632329 ) ) ( not ( = ?auto_632320 ?auto_632330 ) ) ( not ( = ?auto_632321 ?auto_632322 ) ) ( not ( = ?auto_632321 ?auto_632323 ) ) ( not ( = ?auto_632321 ?auto_632324 ) ) ( not ( = ?auto_632321 ?auto_632325 ) ) ( not ( = ?auto_632321 ?auto_632326 ) ) ( not ( = ?auto_632321 ?auto_632327 ) ) ( not ( = ?auto_632321 ?auto_632328 ) ) ( not ( = ?auto_632321 ?auto_632329 ) ) ( not ( = ?auto_632321 ?auto_632330 ) ) ( not ( = ?auto_632322 ?auto_632323 ) ) ( not ( = ?auto_632322 ?auto_632324 ) ) ( not ( = ?auto_632322 ?auto_632325 ) ) ( not ( = ?auto_632322 ?auto_632326 ) ) ( not ( = ?auto_632322 ?auto_632327 ) ) ( not ( = ?auto_632322 ?auto_632328 ) ) ( not ( = ?auto_632322 ?auto_632329 ) ) ( not ( = ?auto_632322 ?auto_632330 ) ) ( not ( = ?auto_632323 ?auto_632324 ) ) ( not ( = ?auto_632323 ?auto_632325 ) ) ( not ( = ?auto_632323 ?auto_632326 ) ) ( not ( = ?auto_632323 ?auto_632327 ) ) ( not ( = ?auto_632323 ?auto_632328 ) ) ( not ( = ?auto_632323 ?auto_632329 ) ) ( not ( = ?auto_632323 ?auto_632330 ) ) ( not ( = ?auto_632324 ?auto_632325 ) ) ( not ( = ?auto_632324 ?auto_632326 ) ) ( not ( = ?auto_632324 ?auto_632327 ) ) ( not ( = ?auto_632324 ?auto_632328 ) ) ( not ( = ?auto_632324 ?auto_632329 ) ) ( not ( = ?auto_632324 ?auto_632330 ) ) ( not ( = ?auto_632325 ?auto_632326 ) ) ( not ( = ?auto_632325 ?auto_632327 ) ) ( not ( = ?auto_632325 ?auto_632328 ) ) ( not ( = ?auto_632325 ?auto_632329 ) ) ( not ( = ?auto_632325 ?auto_632330 ) ) ( not ( = ?auto_632326 ?auto_632327 ) ) ( not ( = ?auto_632326 ?auto_632328 ) ) ( not ( = ?auto_632326 ?auto_632329 ) ) ( not ( = ?auto_632326 ?auto_632330 ) ) ( not ( = ?auto_632327 ?auto_632328 ) ) ( not ( = ?auto_632327 ?auto_632329 ) ) ( not ( = ?auto_632327 ?auto_632330 ) ) ( not ( = ?auto_632328 ?auto_632329 ) ) ( not ( = ?auto_632328 ?auto_632330 ) ) ( not ( = ?auto_632329 ?auto_632330 ) ) ( ON ?auto_632328 ?auto_632329 ) ( ON ?auto_632327 ?auto_632328 ) ( ON ?auto_632326 ?auto_632327 ) ( ON ?auto_632325 ?auto_632326 ) ( CLEAR ?auto_632323 ) ( ON ?auto_632324 ?auto_632325 ) ( CLEAR ?auto_632324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_632315 ?auto_632316 ?auto_632317 ?auto_632318 ?auto_632319 ?auto_632320 ?auto_632321 ?auto_632322 ?auto_632323 ?auto_632324 )
      ( MAKE-15PILE ?auto_632315 ?auto_632316 ?auto_632317 ?auto_632318 ?auto_632319 ?auto_632320 ?auto_632321 ?auto_632322 ?auto_632323 ?auto_632324 ?auto_632325 ?auto_632326 ?auto_632327 ?auto_632328 ?auto_632329 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632377 - BLOCK
      ?auto_632378 - BLOCK
      ?auto_632379 - BLOCK
      ?auto_632380 - BLOCK
      ?auto_632381 - BLOCK
      ?auto_632382 - BLOCK
      ?auto_632383 - BLOCK
      ?auto_632384 - BLOCK
      ?auto_632385 - BLOCK
      ?auto_632386 - BLOCK
      ?auto_632387 - BLOCK
      ?auto_632388 - BLOCK
      ?auto_632389 - BLOCK
      ?auto_632390 - BLOCK
      ?auto_632391 - BLOCK
    )
    :vars
    (
      ?auto_632392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632391 ?auto_632392 ) ( ON-TABLE ?auto_632377 ) ( ON ?auto_632378 ?auto_632377 ) ( ON ?auto_632379 ?auto_632378 ) ( ON ?auto_632380 ?auto_632379 ) ( ON ?auto_632381 ?auto_632380 ) ( ON ?auto_632382 ?auto_632381 ) ( ON ?auto_632383 ?auto_632382 ) ( ON ?auto_632384 ?auto_632383 ) ( not ( = ?auto_632377 ?auto_632378 ) ) ( not ( = ?auto_632377 ?auto_632379 ) ) ( not ( = ?auto_632377 ?auto_632380 ) ) ( not ( = ?auto_632377 ?auto_632381 ) ) ( not ( = ?auto_632377 ?auto_632382 ) ) ( not ( = ?auto_632377 ?auto_632383 ) ) ( not ( = ?auto_632377 ?auto_632384 ) ) ( not ( = ?auto_632377 ?auto_632385 ) ) ( not ( = ?auto_632377 ?auto_632386 ) ) ( not ( = ?auto_632377 ?auto_632387 ) ) ( not ( = ?auto_632377 ?auto_632388 ) ) ( not ( = ?auto_632377 ?auto_632389 ) ) ( not ( = ?auto_632377 ?auto_632390 ) ) ( not ( = ?auto_632377 ?auto_632391 ) ) ( not ( = ?auto_632377 ?auto_632392 ) ) ( not ( = ?auto_632378 ?auto_632379 ) ) ( not ( = ?auto_632378 ?auto_632380 ) ) ( not ( = ?auto_632378 ?auto_632381 ) ) ( not ( = ?auto_632378 ?auto_632382 ) ) ( not ( = ?auto_632378 ?auto_632383 ) ) ( not ( = ?auto_632378 ?auto_632384 ) ) ( not ( = ?auto_632378 ?auto_632385 ) ) ( not ( = ?auto_632378 ?auto_632386 ) ) ( not ( = ?auto_632378 ?auto_632387 ) ) ( not ( = ?auto_632378 ?auto_632388 ) ) ( not ( = ?auto_632378 ?auto_632389 ) ) ( not ( = ?auto_632378 ?auto_632390 ) ) ( not ( = ?auto_632378 ?auto_632391 ) ) ( not ( = ?auto_632378 ?auto_632392 ) ) ( not ( = ?auto_632379 ?auto_632380 ) ) ( not ( = ?auto_632379 ?auto_632381 ) ) ( not ( = ?auto_632379 ?auto_632382 ) ) ( not ( = ?auto_632379 ?auto_632383 ) ) ( not ( = ?auto_632379 ?auto_632384 ) ) ( not ( = ?auto_632379 ?auto_632385 ) ) ( not ( = ?auto_632379 ?auto_632386 ) ) ( not ( = ?auto_632379 ?auto_632387 ) ) ( not ( = ?auto_632379 ?auto_632388 ) ) ( not ( = ?auto_632379 ?auto_632389 ) ) ( not ( = ?auto_632379 ?auto_632390 ) ) ( not ( = ?auto_632379 ?auto_632391 ) ) ( not ( = ?auto_632379 ?auto_632392 ) ) ( not ( = ?auto_632380 ?auto_632381 ) ) ( not ( = ?auto_632380 ?auto_632382 ) ) ( not ( = ?auto_632380 ?auto_632383 ) ) ( not ( = ?auto_632380 ?auto_632384 ) ) ( not ( = ?auto_632380 ?auto_632385 ) ) ( not ( = ?auto_632380 ?auto_632386 ) ) ( not ( = ?auto_632380 ?auto_632387 ) ) ( not ( = ?auto_632380 ?auto_632388 ) ) ( not ( = ?auto_632380 ?auto_632389 ) ) ( not ( = ?auto_632380 ?auto_632390 ) ) ( not ( = ?auto_632380 ?auto_632391 ) ) ( not ( = ?auto_632380 ?auto_632392 ) ) ( not ( = ?auto_632381 ?auto_632382 ) ) ( not ( = ?auto_632381 ?auto_632383 ) ) ( not ( = ?auto_632381 ?auto_632384 ) ) ( not ( = ?auto_632381 ?auto_632385 ) ) ( not ( = ?auto_632381 ?auto_632386 ) ) ( not ( = ?auto_632381 ?auto_632387 ) ) ( not ( = ?auto_632381 ?auto_632388 ) ) ( not ( = ?auto_632381 ?auto_632389 ) ) ( not ( = ?auto_632381 ?auto_632390 ) ) ( not ( = ?auto_632381 ?auto_632391 ) ) ( not ( = ?auto_632381 ?auto_632392 ) ) ( not ( = ?auto_632382 ?auto_632383 ) ) ( not ( = ?auto_632382 ?auto_632384 ) ) ( not ( = ?auto_632382 ?auto_632385 ) ) ( not ( = ?auto_632382 ?auto_632386 ) ) ( not ( = ?auto_632382 ?auto_632387 ) ) ( not ( = ?auto_632382 ?auto_632388 ) ) ( not ( = ?auto_632382 ?auto_632389 ) ) ( not ( = ?auto_632382 ?auto_632390 ) ) ( not ( = ?auto_632382 ?auto_632391 ) ) ( not ( = ?auto_632382 ?auto_632392 ) ) ( not ( = ?auto_632383 ?auto_632384 ) ) ( not ( = ?auto_632383 ?auto_632385 ) ) ( not ( = ?auto_632383 ?auto_632386 ) ) ( not ( = ?auto_632383 ?auto_632387 ) ) ( not ( = ?auto_632383 ?auto_632388 ) ) ( not ( = ?auto_632383 ?auto_632389 ) ) ( not ( = ?auto_632383 ?auto_632390 ) ) ( not ( = ?auto_632383 ?auto_632391 ) ) ( not ( = ?auto_632383 ?auto_632392 ) ) ( not ( = ?auto_632384 ?auto_632385 ) ) ( not ( = ?auto_632384 ?auto_632386 ) ) ( not ( = ?auto_632384 ?auto_632387 ) ) ( not ( = ?auto_632384 ?auto_632388 ) ) ( not ( = ?auto_632384 ?auto_632389 ) ) ( not ( = ?auto_632384 ?auto_632390 ) ) ( not ( = ?auto_632384 ?auto_632391 ) ) ( not ( = ?auto_632384 ?auto_632392 ) ) ( not ( = ?auto_632385 ?auto_632386 ) ) ( not ( = ?auto_632385 ?auto_632387 ) ) ( not ( = ?auto_632385 ?auto_632388 ) ) ( not ( = ?auto_632385 ?auto_632389 ) ) ( not ( = ?auto_632385 ?auto_632390 ) ) ( not ( = ?auto_632385 ?auto_632391 ) ) ( not ( = ?auto_632385 ?auto_632392 ) ) ( not ( = ?auto_632386 ?auto_632387 ) ) ( not ( = ?auto_632386 ?auto_632388 ) ) ( not ( = ?auto_632386 ?auto_632389 ) ) ( not ( = ?auto_632386 ?auto_632390 ) ) ( not ( = ?auto_632386 ?auto_632391 ) ) ( not ( = ?auto_632386 ?auto_632392 ) ) ( not ( = ?auto_632387 ?auto_632388 ) ) ( not ( = ?auto_632387 ?auto_632389 ) ) ( not ( = ?auto_632387 ?auto_632390 ) ) ( not ( = ?auto_632387 ?auto_632391 ) ) ( not ( = ?auto_632387 ?auto_632392 ) ) ( not ( = ?auto_632388 ?auto_632389 ) ) ( not ( = ?auto_632388 ?auto_632390 ) ) ( not ( = ?auto_632388 ?auto_632391 ) ) ( not ( = ?auto_632388 ?auto_632392 ) ) ( not ( = ?auto_632389 ?auto_632390 ) ) ( not ( = ?auto_632389 ?auto_632391 ) ) ( not ( = ?auto_632389 ?auto_632392 ) ) ( not ( = ?auto_632390 ?auto_632391 ) ) ( not ( = ?auto_632390 ?auto_632392 ) ) ( not ( = ?auto_632391 ?auto_632392 ) ) ( ON ?auto_632390 ?auto_632391 ) ( ON ?auto_632389 ?auto_632390 ) ( ON ?auto_632388 ?auto_632389 ) ( ON ?auto_632387 ?auto_632388 ) ( ON ?auto_632386 ?auto_632387 ) ( CLEAR ?auto_632384 ) ( ON ?auto_632385 ?auto_632386 ) ( CLEAR ?auto_632385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_632377 ?auto_632378 ?auto_632379 ?auto_632380 ?auto_632381 ?auto_632382 ?auto_632383 ?auto_632384 ?auto_632385 )
      ( MAKE-15PILE ?auto_632377 ?auto_632378 ?auto_632379 ?auto_632380 ?auto_632381 ?auto_632382 ?auto_632383 ?auto_632384 ?auto_632385 ?auto_632386 ?auto_632387 ?auto_632388 ?auto_632389 ?auto_632390 ?auto_632391 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632439 - BLOCK
      ?auto_632440 - BLOCK
      ?auto_632441 - BLOCK
      ?auto_632442 - BLOCK
      ?auto_632443 - BLOCK
      ?auto_632444 - BLOCK
      ?auto_632445 - BLOCK
      ?auto_632446 - BLOCK
      ?auto_632447 - BLOCK
      ?auto_632448 - BLOCK
      ?auto_632449 - BLOCK
      ?auto_632450 - BLOCK
      ?auto_632451 - BLOCK
      ?auto_632452 - BLOCK
      ?auto_632453 - BLOCK
    )
    :vars
    (
      ?auto_632454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632453 ?auto_632454 ) ( ON-TABLE ?auto_632439 ) ( ON ?auto_632440 ?auto_632439 ) ( ON ?auto_632441 ?auto_632440 ) ( ON ?auto_632442 ?auto_632441 ) ( ON ?auto_632443 ?auto_632442 ) ( ON ?auto_632444 ?auto_632443 ) ( ON ?auto_632445 ?auto_632444 ) ( not ( = ?auto_632439 ?auto_632440 ) ) ( not ( = ?auto_632439 ?auto_632441 ) ) ( not ( = ?auto_632439 ?auto_632442 ) ) ( not ( = ?auto_632439 ?auto_632443 ) ) ( not ( = ?auto_632439 ?auto_632444 ) ) ( not ( = ?auto_632439 ?auto_632445 ) ) ( not ( = ?auto_632439 ?auto_632446 ) ) ( not ( = ?auto_632439 ?auto_632447 ) ) ( not ( = ?auto_632439 ?auto_632448 ) ) ( not ( = ?auto_632439 ?auto_632449 ) ) ( not ( = ?auto_632439 ?auto_632450 ) ) ( not ( = ?auto_632439 ?auto_632451 ) ) ( not ( = ?auto_632439 ?auto_632452 ) ) ( not ( = ?auto_632439 ?auto_632453 ) ) ( not ( = ?auto_632439 ?auto_632454 ) ) ( not ( = ?auto_632440 ?auto_632441 ) ) ( not ( = ?auto_632440 ?auto_632442 ) ) ( not ( = ?auto_632440 ?auto_632443 ) ) ( not ( = ?auto_632440 ?auto_632444 ) ) ( not ( = ?auto_632440 ?auto_632445 ) ) ( not ( = ?auto_632440 ?auto_632446 ) ) ( not ( = ?auto_632440 ?auto_632447 ) ) ( not ( = ?auto_632440 ?auto_632448 ) ) ( not ( = ?auto_632440 ?auto_632449 ) ) ( not ( = ?auto_632440 ?auto_632450 ) ) ( not ( = ?auto_632440 ?auto_632451 ) ) ( not ( = ?auto_632440 ?auto_632452 ) ) ( not ( = ?auto_632440 ?auto_632453 ) ) ( not ( = ?auto_632440 ?auto_632454 ) ) ( not ( = ?auto_632441 ?auto_632442 ) ) ( not ( = ?auto_632441 ?auto_632443 ) ) ( not ( = ?auto_632441 ?auto_632444 ) ) ( not ( = ?auto_632441 ?auto_632445 ) ) ( not ( = ?auto_632441 ?auto_632446 ) ) ( not ( = ?auto_632441 ?auto_632447 ) ) ( not ( = ?auto_632441 ?auto_632448 ) ) ( not ( = ?auto_632441 ?auto_632449 ) ) ( not ( = ?auto_632441 ?auto_632450 ) ) ( not ( = ?auto_632441 ?auto_632451 ) ) ( not ( = ?auto_632441 ?auto_632452 ) ) ( not ( = ?auto_632441 ?auto_632453 ) ) ( not ( = ?auto_632441 ?auto_632454 ) ) ( not ( = ?auto_632442 ?auto_632443 ) ) ( not ( = ?auto_632442 ?auto_632444 ) ) ( not ( = ?auto_632442 ?auto_632445 ) ) ( not ( = ?auto_632442 ?auto_632446 ) ) ( not ( = ?auto_632442 ?auto_632447 ) ) ( not ( = ?auto_632442 ?auto_632448 ) ) ( not ( = ?auto_632442 ?auto_632449 ) ) ( not ( = ?auto_632442 ?auto_632450 ) ) ( not ( = ?auto_632442 ?auto_632451 ) ) ( not ( = ?auto_632442 ?auto_632452 ) ) ( not ( = ?auto_632442 ?auto_632453 ) ) ( not ( = ?auto_632442 ?auto_632454 ) ) ( not ( = ?auto_632443 ?auto_632444 ) ) ( not ( = ?auto_632443 ?auto_632445 ) ) ( not ( = ?auto_632443 ?auto_632446 ) ) ( not ( = ?auto_632443 ?auto_632447 ) ) ( not ( = ?auto_632443 ?auto_632448 ) ) ( not ( = ?auto_632443 ?auto_632449 ) ) ( not ( = ?auto_632443 ?auto_632450 ) ) ( not ( = ?auto_632443 ?auto_632451 ) ) ( not ( = ?auto_632443 ?auto_632452 ) ) ( not ( = ?auto_632443 ?auto_632453 ) ) ( not ( = ?auto_632443 ?auto_632454 ) ) ( not ( = ?auto_632444 ?auto_632445 ) ) ( not ( = ?auto_632444 ?auto_632446 ) ) ( not ( = ?auto_632444 ?auto_632447 ) ) ( not ( = ?auto_632444 ?auto_632448 ) ) ( not ( = ?auto_632444 ?auto_632449 ) ) ( not ( = ?auto_632444 ?auto_632450 ) ) ( not ( = ?auto_632444 ?auto_632451 ) ) ( not ( = ?auto_632444 ?auto_632452 ) ) ( not ( = ?auto_632444 ?auto_632453 ) ) ( not ( = ?auto_632444 ?auto_632454 ) ) ( not ( = ?auto_632445 ?auto_632446 ) ) ( not ( = ?auto_632445 ?auto_632447 ) ) ( not ( = ?auto_632445 ?auto_632448 ) ) ( not ( = ?auto_632445 ?auto_632449 ) ) ( not ( = ?auto_632445 ?auto_632450 ) ) ( not ( = ?auto_632445 ?auto_632451 ) ) ( not ( = ?auto_632445 ?auto_632452 ) ) ( not ( = ?auto_632445 ?auto_632453 ) ) ( not ( = ?auto_632445 ?auto_632454 ) ) ( not ( = ?auto_632446 ?auto_632447 ) ) ( not ( = ?auto_632446 ?auto_632448 ) ) ( not ( = ?auto_632446 ?auto_632449 ) ) ( not ( = ?auto_632446 ?auto_632450 ) ) ( not ( = ?auto_632446 ?auto_632451 ) ) ( not ( = ?auto_632446 ?auto_632452 ) ) ( not ( = ?auto_632446 ?auto_632453 ) ) ( not ( = ?auto_632446 ?auto_632454 ) ) ( not ( = ?auto_632447 ?auto_632448 ) ) ( not ( = ?auto_632447 ?auto_632449 ) ) ( not ( = ?auto_632447 ?auto_632450 ) ) ( not ( = ?auto_632447 ?auto_632451 ) ) ( not ( = ?auto_632447 ?auto_632452 ) ) ( not ( = ?auto_632447 ?auto_632453 ) ) ( not ( = ?auto_632447 ?auto_632454 ) ) ( not ( = ?auto_632448 ?auto_632449 ) ) ( not ( = ?auto_632448 ?auto_632450 ) ) ( not ( = ?auto_632448 ?auto_632451 ) ) ( not ( = ?auto_632448 ?auto_632452 ) ) ( not ( = ?auto_632448 ?auto_632453 ) ) ( not ( = ?auto_632448 ?auto_632454 ) ) ( not ( = ?auto_632449 ?auto_632450 ) ) ( not ( = ?auto_632449 ?auto_632451 ) ) ( not ( = ?auto_632449 ?auto_632452 ) ) ( not ( = ?auto_632449 ?auto_632453 ) ) ( not ( = ?auto_632449 ?auto_632454 ) ) ( not ( = ?auto_632450 ?auto_632451 ) ) ( not ( = ?auto_632450 ?auto_632452 ) ) ( not ( = ?auto_632450 ?auto_632453 ) ) ( not ( = ?auto_632450 ?auto_632454 ) ) ( not ( = ?auto_632451 ?auto_632452 ) ) ( not ( = ?auto_632451 ?auto_632453 ) ) ( not ( = ?auto_632451 ?auto_632454 ) ) ( not ( = ?auto_632452 ?auto_632453 ) ) ( not ( = ?auto_632452 ?auto_632454 ) ) ( not ( = ?auto_632453 ?auto_632454 ) ) ( ON ?auto_632452 ?auto_632453 ) ( ON ?auto_632451 ?auto_632452 ) ( ON ?auto_632450 ?auto_632451 ) ( ON ?auto_632449 ?auto_632450 ) ( ON ?auto_632448 ?auto_632449 ) ( ON ?auto_632447 ?auto_632448 ) ( CLEAR ?auto_632445 ) ( ON ?auto_632446 ?auto_632447 ) ( CLEAR ?auto_632446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_632439 ?auto_632440 ?auto_632441 ?auto_632442 ?auto_632443 ?auto_632444 ?auto_632445 ?auto_632446 )
      ( MAKE-15PILE ?auto_632439 ?auto_632440 ?auto_632441 ?auto_632442 ?auto_632443 ?auto_632444 ?auto_632445 ?auto_632446 ?auto_632447 ?auto_632448 ?auto_632449 ?auto_632450 ?auto_632451 ?auto_632452 ?auto_632453 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632501 - BLOCK
      ?auto_632502 - BLOCK
      ?auto_632503 - BLOCK
      ?auto_632504 - BLOCK
      ?auto_632505 - BLOCK
      ?auto_632506 - BLOCK
      ?auto_632507 - BLOCK
      ?auto_632508 - BLOCK
      ?auto_632509 - BLOCK
      ?auto_632510 - BLOCK
      ?auto_632511 - BLOCK
      ?auto_632512 - BLOCK
      ?auto_632513 - BLOCK
      ?auto_632514 - BLOCK
      ?auto_632515 - BLOCK
    )
    :vars
    (
      ?auto_632516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632515 ?auto_632516 ) ( ON-TABLE ?auto_632501 ) ( ON ?auto_632502 ?auto_632501 ) ( ON ?auto_632503 ?auto_632502 ) ( ON ?auto_632504 ?auto_632503 ) ( ON ?auto_632505 ?auto_632504 ) ( ON ?auto_632506 ?auto_632505 ) ( not ( = ?auto_632501 ?auto_632502 ) ) ( not ( = ?auto_632501 ?auto_632503 ) ) ( not ( = ?auto_632501 ?auto_632504 ) ) ( not ( = ?auto_632501 ?auto_632505 ) ) ( not ( = ?auto_632501 ?auto_632506 ) ) ( not ( = ?auto_632501 ?auto_632507 ) ) ( not ( = ?auto_632501 ?auto_632508 ) ) ( not ( = ?auto_632501 ?auto_632509 ) ) ( not ( = ?auto_632501 ?auto_632510 ) ) ( not ( = ?auto_632501 ?auto_632511 ) ) ( not ( = ?auto_632501 ?auto_632512 ) ) ( not ( = ?auto_632501 ?auto_632513 ) ) ( not ( = ?auto_632501 ?auto_632514 ) ) ( not ( = ?auto_632501 ?auto_632515 ) ) ( not ( = ?auto_632501 ?auto_632516 ) ) ( not ( = ?auto_632502 ?auto_632503 ) ) ( not ( = ?auto_632502 ?auto_632504 ) ) ( not ( = ?auto_632502 ?auto_632505 ) ) ( not ( = ?auto_632502 ?auto_632506 ) ) ( not ( = ?auto_632502 ?auto_632507 ) ) ( not ( = ?auto_632502 ?auto_632508 ) ) ( not ( = ?auto_632502 ?auto_632509 ) ) ( not ( = ?auto_632502 ?auto_632510 ) ) ( not ( = ?auto_632502 ?auto_632511 ) ) ( not ( = ?auto_632502 ?auto_632512 ) ) ( not ( = ?auto_632502 ?auto_632513 ) ) ( not ( = ?auto_632502 ?auto_632514 ) ) ( not ( = ?auto_632502 ?auto_632515 ) ) ( not ( = ?auto_632502 ?auto_632516 ) ) ( not ( = ?auto_632503 ?auto_632504 ) ) ( not ( = ?auto_632503 ?auto_632505 ) ) ( not ( = ?auto_632503 ?auto_632506 ) ) ( not ( = ?auto_632503 ?auto_632507 ) ) ( not ( = ?auto_632503 ?auto_632508 ) ) ( not ( = ?auto_632503 ?auto_632509 ) ) ( not ( = ?auto_632503 ?auto_632510 ) ) ( not ( = ?auto_632503 ?auto_632511 ) ) ( not ( = ?auto_632503 ?auto_632512 ) ) ( not ( = ?auto_632503 ?auto_632513 ) ) ( not ( = ?auto_632503 ?auto_632514 ) ) ( not ( = ?auto_632503 ?auto_632515 ) ) ( not ( = ?auto_632503 ?auto_632516 ) ) ( not ( = ?auto_632504 ?auto_632505 ) ) ( not ( = ?auto_632504 ?auto_632506 ) ) ( not ( = ?auto_632504 ?auto_632507 ) ) ( not ( = ?auto_632504 ?auto_632508 ) ) ( not ( = ?auto_632504 ?auto_632509 ) ) ( not ( = ?auto_632504 ?auto_632510 ) ) ( not ( = ?auto_632504 ?auto_632511 ) ) ( not ( = ?auto_632504 ?auto_632512 ) ) ( not ( = ?auto_632504 ?auto_632513 ) ) ( not ( = ?auto_632504 ?auto_632514 ) ) ( not ( = ?auto_632504 ?auto_632515 ) ) ( not ( = ?auto_632504 ?auto_632516 ) ) ( not ( = ?auto_632505 ?auto_632506 ) ) ( not ( = ?auto_632505 ?auto_632507 ) ) ( not ( = ?auto_632505 ?auto_632508 ) ) ( not ( = ?auto_632505 ?auto_632509 ) ) ( not ( = ?auto_632505 ?auto_632510 ) ) ( not ( = ?auto_632505 ?auto_632511 ) ) ( not ( = ?auto_632505 ?auto_632512 ) ) ( not ( = ?auto_632505 ?auto_632513 ) ) ( not ( = ?auto_632505 ?auto_632514 ) ) ( not ( = ?auto_632505 ?auto_632515 ) ) ( not ( = ?auto_632505 ?auto_632516 ) ) ( not ( = ?auto_632506 ?auto_632507 ) ) ( not ( = ?auto_632506 ?auto_632508 ) ) ( not ( = ?auto_632506 ?auto_632509 ) ) ( not ( = ?auto_632506 ?auto_632510 ) ) ( not ( = ?auto_632506 ?auto_632511 ) ) ( not ( = ?auto_632506 ?auto_632512 ) ) ( not ( = ?auto_632506 ?auto_632513 ) ) ( not ( = ?auto_632506 ?auto_632514 ) ) ( not ( = ?auto_632506 ?auto_632515 ) ) ( not ( = ?auto_632506 ?auto_632516 ) ) ( not ( = ?auto_632507 ?auto_632508 ) ) ( not ( = ?auto_632507 ?auto_632509 ) ) ( not ( = ?auto_632507 ?auto_632510 ) ) ( not ( = ?auto_632507 ?auto_632511 ) ) ( not ( = ?auto_632507 ?auto_632512 ) ) ( not ( = ?auto_632507 ?auto_632513 ) ) ( not ( = ?auto_632507 ?auto_632514 ) ) ( not ( = ?auto_632507 ?auto_632515 ) ) ( not ( = ?auto_632507 ?auto_632516 ) ) ( not ( = ?auto_632508 ?auto_632509 ) ) ( not ( = ?auto_632508 ?auto_632510 ) ) ( not ( = ?auto_632508 ?auto_632511 ) ) ( not ( = ?auto_632508 ?auto_632512 ) ) ( not ( = ?auto_632508 ?auto_632513 ) ) ( not ( = ?auto_632508 ?auto_632514 ) ) ( not ( = ?auto_632508 ?auto_632515 ) ) ( not ( = ?auto_632508 ?auto_632516 ) ) ( not ( = ?auto_632509 ?auto_632510 ) ) ( not ( = ?auto_632509 ?auto_632511 ) ) ( not ( = ?auto_632509 ?auto_632512 ) ) ( not ( = ?auto_632509 ?auto_632513 ) ) ( not ( = ?auto_632509 ?auto_632514 ) ) ( not ( = ?auto_632509 ?auto_632515 ) ) ( not ( = ?auto_632509 ?auto_632516 ) ) ( not ( = ?auto_632510 ?auto_632511 ) ) ( not ( = ?auto_632510 ?auto_632512 ) ) ( not ( = ?auto_632510 ?auto_632513 ) ) ( not ( = ?auto_632510 ?auto_632514 ) ) ( not ( = ?auto_632510 ?auto_632515 ) ) ( not ( = ?auto_632510 ?auto_632516 ) ) ( not ( = ?auto_632511 ?auto_632512 ) ) ( not ( = ?auto_632511 ?auto_632513 ) ) ( not ( = ?auto_632511 ?auto_632514 ) ) ( not ( = ?auto_632511 ?auto_632515 ) ) ( not ( = ?auto_632511 ?auto_632516 ) ) ( not ( = ?auto_632512 ?auto_632513 ) ) ( not ( = ?auto_632512 ?auto_632514 ) ) ( not ( = ?auto_632512 ?auto_632515 ) ) ( not ( = ?auto_632512 ?auto_632516 ) ) ( not ( = ?auto_632513 ?auto_632514 ) ) ( not ( = ?auto_632513 ?auto_632515 ) ) ( not ( = ?auto_632513 ?auto_632516 ) ) ( not ( = ?auto_632514 ?auto_632515 ) ) ( not ( = ?auto_632514 ?auto_632516 ) ) ( not ( = ?auto_632515 ?auto_632516 ) ) ( ON ?auto_632514 ?auto_632515 ) ( ON ?auto_632513 ?auto_632514 ) ( ON ?auto_632512 ?auto_632513 ) ( ON ?auto_632511 ?auto_632512 ) ( ON ?auto_632510 ?auto_632511 ) ( ON ?auto_632509 ?auto_632510 ) ( ON ?auto_632508 ?auto_632509 ) ( CLEAR ?auto_632506 ) ( ON ?auto_632507 ?auto_632508 ) ( CLEAR ?auto_632507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_632501 ?auto_632502 ?auto_632503 ?auto_632504 ?auto_632505 ?auto_632506 ?auto_632507 )
      ( MAKE-15PILE ?auto_632501 ?auto_632502 ?auto_632503 ?auto_632504 ?auto_632505 ?auto_632506 ?auto_632507 ?auto_632508 ?auto_632509 ?auto_632510 ?auto_632511 ?auto_632512 ?auto_632513 ?auto_632514 ?auto_632515 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632563 - BLOCK
      ?auto_632564 - BLOCK
      ?auto_632565 - BLOCK
      ?auto_632566 - BLOCK
      ?auto_632567 - BLOCK
      ?auto_632568 - BLOCK
      ?auto_632569 - BLOCK
      ?auto_632570 - BLOCK
      ?auto_632571 - BLOCK
      ?auto_632572 - BLOCK
      ?auto_632573 - BLOCK
      ?auto_632574 - BLOCK
      ?auto_632575 - BLOCK
      ?auto_632576 - BLOCK
      ?auto_632577 - BLOCK
    )
    :vars
    (
      ?auto_632578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632577 ?auto_632578 ) ( ON-TABLE ?auto_632563 ) ( ON ?auto_632564 ?auto_632563 ) ( ON ?auto_632565 ?auto_632564 ) ( ON ?auto_632566 ?auto_632565 ) ( ON ?auto_632567 ?auto_632566 ) ( not ( = ?auto_632563 ?auto_632564 ) ) ( not ( = ?auto_632563 ?auto_632565 ) ) ( not ( = ?auto_632563 ?auto_632566 ) ) ( not ( = ?auto_632563 ?auto_632567 ) ) ( not ( = ?auto_632563 ?auto_632568 ) ) ( not ( = ?auto_632563 ?auto_632569 ) ) ( not ( = ?auto_632563 ?auto_632570 ) ) ( not ( = ?auto_632563 ?auto_632571 ) ) ( not ( = ?auto_632563 ?auto_632572 ) ) ( not ( = ?auto_632563 ?auto_632573 ) ) ( not ( = ?auto_632563 ?auto_632574 ) ) ( not ( = ?auto_632563 ?auto_632575 ) ) ( not ( = ?auto_632563 ?auto_632576 ) ) ( not ( = ?auto_632563 ?auto_632577 ) ) ( not ( = ?auto_632563 ?auto_632578 ) ) ( not ( = ?auto_632564 ?auto_632565 ) ) ( not ( = ?auto_632564 ?auto_632566 ) ) ( not ( = ?auto_632564 ?auto_632567 ) ) ( not ( = ?auto_632564 ?auto_632568 ) ) ( not ( = ?auto_632564 ?auto_632569 ) ) ( not ( = ?auto_632564 ?auto_632570 ) ) ( not ( = ?auto_632564 ?auto_632571 ) ) ( not ( = ?auto_632564 ?auto_632572 ) ) ( not ( = ?auto_632564 ?auto_632573 ) ) ( not ( = ?auto_632564 ?auto_632574 ) ) ( not ( = ?auto_632564 ?auto_632575 ) ) ( not ( = ?auto_632564 ?auto_632576 ) ) ( not ( = ?auto_632564 ?auto_632577 ) ) ( not ( = ?auto_632564 ?auto_632578 ) ) ( not ( = ?auto_632565 ?auto_632566 ) ) ( not ( = ?auto_632565 ?auto_632567 ) ) ( not ( = ?auto_632565 ?auto_632568 ) ) ( not ( = ?auto_632565 ?auto_632569 ) ) ( not ( = ?auto_632565 ?auto_632570 ) ) ( not ( = ?auto_632565 ?auto_632571 ) ) ( not ( = ?auto_632565 ?auto_632572 ) ) ( not ( = ?auto_632565 ?auto_632573 ) ) ( not ( = ?auto_632565 ?auto_632574 ) ) ( not ( = ?auto_632565 ?auto_632575 ) ) ( not ( = ?auto_632565 ?auto_632576 ) ) ( not ( = ?auto_632565 ?auto_632577 ) ) ( not ( = ?auto_632565 ?auto_632578 ) ) ( not ( = ?auto_632566 ?auto_632567 ) ) ( not ( = ?auto_632566 ?auto_632568 ) ) ( not ( = ?auto_632566 ?auto_632569 ) ) ( not ( = ?auto_632566 ?auto_632570 ) ) ( not ( = ?auto_632566 ?auto_632571 ) ) ( not ( = ?auto_632566 ?auto_632572 ) ) ( not ( = ?auto_632566 ?auto_632573 ) ) ( not ( = ?auto_632566 ?auto_632574 ) ) ( not ( = ?auto_632566 ?auto_632575 ) ) ( not ( = ?auto_632566 ?auto_632576 ) ) ( not ( = ?auto_632566 ?auto_632577 ) ) ( not ( = ?auto_632566 ?auto_632578 ) ) ( not ( = ?auto_632567 ?auto_632568 ) ) ( not ( = ?auto_632567 ?auto_632569 ) ) ( not ( = ?auto_632567 ?auto_632570 ) ) ( not ( = ?auto_632567 ?auto_632571 ) ) ( not ( = ?auto_632567 ?auto_632572 ) ) ( not ( = ?auto_632567 ?auto_632573 ) ) ( not ( = ?auto_632567 ?auto_632574 ) ) ( not ( = ?auto_632567 ?auto_632575 ) ) ( not ( = ?auto_632567 ?auto_632576 ) ) ( not ( = ?auto_632567 ?auto_632577 ) ) ( not ( = ?auto_632567 ?auto_632578 ) ) ( not ( = ?auto_632568 ?auto_632569 ) ) ( not ( = ?auto_632568 ?auto_632570 ) ) ( not ( = ?auto_632568 ?auto_632571 ) ) ( not ( = ?auto_632568 ?auto_632572 ) ) ( not ( = ?auto_632568 ?auto_632573 ) ) ( not ( = ?auto_632568 ?auto_632574 ) ) ( not ( = ?auto_632568 ?auto_632575 ) ) ( not ( = ?auto_632568 ?auto_632576 ) ) ( not ( = ?auto_632568 ?auto_632577 ) ) ( not ( = ?auto_632568 ?auto_632578 ) ) ( not ( = ?auto_632569 ?auto_632570 ) ) ( not ( = ?auto_632569 ?auto_632571 ) ) ( not ( = ?auto_632569 ?auto_632572 ) ) ( not ( = ?auto_632569 ?auto_632573 ) ) ( not ( = ?auto_632569 ?auto_632574 ) ) ( not ( = ?auto_632569 ?auto_632575 ) ) ( not ( = ?auto_632569 ?auto_632576 ) ) ( not ( = ?auto_632569 ?auto_632577 ) ) ( not ( = ?auto_632569 ?auto_632578 ) ) ( not ( = ?auto_632570 ?auto_632571 ) ) ( not ( = ?auto_632570 ?auto_632572 ) ) ( not ( = ?auto_632570 ?auto_632573 ) ) ( not ( = ?auto_632570 ?auto_632574 ) ) ( not ( = ?auto_632570 ?auto_632575 ) ) ( not ( = ?auto_632570 ?auto_632576 ) ) ( not ( = ?auto_632570 ?auto_632577 ) ) ( not ( = ?auto_632570 ?auto_632578 ) ) ( not ( = ?auto_632571 ?auto_632572 ) ) ( not ( = ?auto_632571 ?auto_632573 ) ) ( not ( = ?auto_632571 ?auto_632574 ) ) ( not ( = ?auto_632571 ?auto_632575 ) ) ( not ( = ?auto_632571 ?auto_632576 ) ) ( not ( = ?auto_632571 ?auto_632577 ) ) ( not ( = ?auto_632571 ?auto_632578 ) ) ( not ( = ?auto_632572 ?auto_632573 ) ) ( not ( = ?auto_632572 ?auto_632574 ) ) ( not ( = ?auto_632572 ?auto_632575 ) ) ( not ( = ?auto_632572 ?auto_632576 ) ) ( not ( = ?auto_632572 ?auto_632577 ) ) ( not ( = ?auto_632572 ?auto_632578 ) ) ( not ( = ?auto_632573 ?auto_632574 ) ) ( not ( = ?auto_632573 ?auto_632575 ) ) ( not ( = ?auto_632573 ?auto_632576 ) ) ( not ( = ?auto_632573 ?auto_632577 ) ) ( not ( = ?auto_632573 ?auto_632578 ) ) ( not ( = ?auto_632574 ?auto_632575 ) ) ( not ( = ?auto_632574 ?auto_632576 ) ) ( not ( = ?auto_632574 ?auto_632577 ) ) ( not ( = ?auto_632574 ?auto_632578 ) ) ( not ( = ?auto_632575 ?auto_632576 ) ) ( not ( = ?auto_632575 ?auto_632577 ) ) ( not ( = ?auto_632575 ?auto_632578 ) ) ( not ( = ?auto_632576 ?auto_632577 ) ) ( not ( = ?auto_632576 ?auto_632578 ) ) ( not ( = ?auto_632577 ?auto_632578 ) ) ( ON ?auto_632576 ?auto_632577 ) ( ON ?auto_632575 ?auto_632576 ) ( ON ?auto_632574 ?auto_632575 ) ( ON ?auto_632573 ?auto_632574 ) ( ON ?auto_632572 ?auto_632573 ) ( ON ?auto_632571 ?auto_632572 ) ( ON ?auto_632570 ?auto_632571 ) ( ON ?auto_632569 ?auto_632570 ) ( CLEAR ?auto_632567 ) ( ON ?auto_632568 ?auto_632569 ) ( CLEAR ?auto_632568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_632563 ?auto_632564 ?auto_632565 ?auto_632566 ?auto_632567 ?auto_632568 )
      ( MAKE-15PILE ?auto_632563 ?auto_632564 ?auto_632565 ?auto_632566 ?auto_632567 ?auto_632568 ?auto_632569 ?auto_632570 ?auto_632571 ?auto_632572 ?auto_632573 ?auto_632574 ?auto_632575 ?auto_632576 ?auto_632577 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632625 - BLOCK
      ?auto_632626 - BLOCK
      ?auto_632627 - BLOCK
      ?auto_632628 - BLOCK
      ?auto_632629 - BLOCK
      ?auto_632630 - BLOCK
      ?auto_632631 - BLOCK
      ?auto_632632 - BLOCK
      ?auto_632633 - BLOCK
      ?auto_632634 - BLOCK
      ?auto_632635 - BLOCK
      ?auto_632636 - BLOCK
      ?auto_632637 - BLOCK
      ?auto_632638 - BLOCK
      ?auto_632639 - BLOCK
    )
    :vars
    (
      ?auto_632640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632639 ?auto_632640 ) ( ON-TABLE ?auto_632625 ) ( ON ?auto_632626 ?auto_632625 ) ( ON ?auto_632627 ?auto_632626 ) ( ON ?auto_632628 ?auto_632627 ) ( not ( = ?auto_632625 ?auto_632626 ) ) ( not ( = ?auto_632625 ?auto_632627 ) ) ( not ( = ?auto_632625 ?auto_632628 ) ) ( not ( = ?auto_632625 ?auto_632629 ) ) ( not ( = ?auto_632625 ?auto_632630 ) ) ( not ( = ?auto_632625 ?auto_632631 ) ) ( not ( = ?auto_632625 ?auto_632632 ) ) ( not ( = ?auto_632625 ?auto_632633 ) ) ( not ( = ?auto_632625 ?auto_632634 ) ) ( not ( = ?auto_632625 ?auto_632635 ) ) ( not ( = ?auto_632625 ?auto_632636 ) ) ( not ( = ?auto_632625 ?auto_632637 ) ) ( not ( = ?auto_632625 ?auto_632638 ) ) ( not ( = ?auto_632625 ?auto_632639 ) ) ( not ( = ?auto_632625 ?auto_632640 ) ) ( not ( = ?auto_632626 ?auto_632627 ) ) ( not ( = ?auto_632626 ?auto_632628 ) ) ( not ( = ?auto_632626 ?auto_632629 ) ) ( not ( = ?auto_632626 ?auto_632630 ) ) ( not ( = ?auto_632626 ?auto_632631 ) ) ( not ( = ?auto_632626 ?auto_632632 ) ) ( not ( = ?auto_632626 ?auto_632633 ) ) ( not ( = ?auto_632626 ?auto_632634 ) ) ( not ( = ?auto_632626 ?auto_632635 ) ) ( not ( = ?auto_632626 ?auto_632636 ) ) ( not ( = ?auto_632626 ?auto_632637 ) ) ( not ( = ?auto_632626 ?auto_632638 ) ) ( not ( = ?auto_632626 ?auto_632639 ) ) ( not ( = ?auto_632626 ?auto_632640 ) ) ( not ( = ?auto_632627 ?auto_632628 ) ) ( not ( = ?auto_632627 ?auto_632629 ) ) ( not ( = ?auto_632627 ?auto_632630 ) ) ( not ( = ?auto_632627 ?auto_632631 ) ) ( not ( = ?auto_632627 ?auto_632632 ) ) ( not ( = ?auto_632627 ?auto_632633 ) ) ( not ( = ?auto_632627 ?auto_632634 ) ) ( not ( = ?auto_632627 ?auto_632635 ) ) ( not ( = ?auto_632627 ?auto_632636 ) ) ( not ( = ?auto_632627 ?auto_632637 ) ) ( not ( = ?auto_632627 ?auto_632638 ) ) ( not ( = ?auto_632627 ?auto_632639 ) ) ( not ( = ?auto_632627 ?auto_632640 ) ) ( not ( = ?auto_632628 ?auto_632629 ) ) ( not ( = ?auto_632628 ?auto_632630 ) ) ( not ( = ?auto_632628 ?auto_632631 ) ) ( not ( = ?auto_632628 ?auto_632632 ) ) ( not ( = ?auto_632628 ?auto_632633 ) ) ( not ( = ?auto_632628 ?auto_632634 ) ) ( not ( = ?auto_632628 ?auto_632635 ) ) ( not ( = ?auto_632628 ?auto_632636 ) ) ( not ( = ?auto_632628 ?auto_632637 ) ) ( not ( = ?auto_632628 ?auto_632638 ) ) ( not ( = ?auto_632628 ?auto_632639 ) ) ( not ( = ?auto_632628 ?auto_632640 ) ) ( not ( = ?auto_632629 ?auto_632630 ) ) ( not ( = ?auto_632629 ?auto_632631 ) ) ( not ( = ?auto_632629 ?auto_632632 ) ) ( not ( = ?auto_632629 ?auto_632633 ) ) ( not ( = ?auto_632629 ?auto_632634 ) ) ( not ( = ?auto_632629 ?auto_632635 ) ) ( not ( = ?auto_632629 ?auto_632636 ) ) ( not ( = ?auto_632629 ?auto_632637 ) ) ( not ( = ?auto_632629 ?auto_632638 ) ) ( not ( = ?auto_632629 ?auto_632639 ) ) ( not ( = ?auto_632629 ?auto_632640 ) ) ( not ( = ?auto_632630 ?auto_632631 ) ) ( not ( = ?auto_632630 ?auto_632632 ) ) ( not ( = ?auto_632630 ?auto_632633 ) ) ( not ( = ?auto_632630 ?auto_632634 ) ) ( not ( = ?auto_632630 ?auto_632635 ) ) ( not ( = ?auto_632630 ?auto_632636 ) ) ( not ( = ?auto_632630 ?auto_632637 ) ) ( not ( = ?auto_632630 ?auto_632638 ) ) ( not ( = ?auto_632630 ?auto_632639 ) ) ( not ( = ?auto_632630 ?auto_632640 ) ) ( not ( = ?auto_632631 ?auto_632632 ) ) ( not ( = ?auto_632631 ?auto_632633 ) ) ( not ( = ?auto_632631 ?auto_632634 ) ) ( not ( = ?auto_632631 ?auto_632635 ) ) ( not ( = ?auto_632631 ?auto_632636 ) ) ( not ( = ?auto_632631 ?auto_632637 ) ) ( not ( = ?auto_632631 ?auto_632638 ) ) ( not ( = ?auto_632631 ?auto_632639 ) ) ( not ( = ?auto_632631 ?auto_632640 ) ) ( not ( = ?auto_632632 ?auto_632633 ) ) ( not ( = ?auto_632632 ?auto_632634 ) ) ( not ( = ?auto_632632 ?auto_632635 ) ) ( not ( = ?auto_632632 ?auto_632636 ) ) ( not ( = ?auto_632632 ?auto_632637 ) ) ( not ( = ?auto_632632 ?auto_632638 ) ) ( not ( = ?auto_632632 ?auto_632639 ) ) ( not ( = ?auto_632632 ?auto_632640 ) ) ( not ( = ?auto_632633 ?auto_632634 ) ) ( not ( = ?auto_632633 ?auto_632635 ) ) ( not ( = ?auto_632633 ?auto_632636 ) ) ( not ( = ?auto_632633 ?auto_632637 ) ) ( not ( = ?auto_632633 ?auto_632638 ) ) ( not ( = ?auto_632633 ?auto_632639 ) ) ( not ( = ?auto_632633 ?auto_632640 ) ) ( not ( = ?auto_632634 ?auto_632635 ) ) ( not ( = ?auto_632634 ?auto_632636 ) ) ( not ( = ?auto_632634 ?auto_632637 ) ) ( not ( = ?auto_632634 ?auto_632638 ) ) ( not ( = ?auto_632634 ?auto_632639 ) ) ( not ( = ?auto_632634 ?auto_632640 ) ) ( not ( = ?auto_632635 ?auto_632636 ) ) ( not ( = ?auto_632635 ?auto_632637 ) ) ( not ( = ?auto_632635 ?auto_632638 ) ) ( not ( = ?auto_632635 ?auto_632639 ) ) ( not ( = ?auto_632635 ?auto_632640 ) ) ( not ( = ?auto_632636 ?auto_632637 ) ) ( not ( = ?auto_632636 ?auto_632638 ) ) ( not ( = ?auto_632636 ?auto_632639 ) ) ( not ( = ?auto_632636 ?auto_632640 ) ) ( not ( = ?auto_632637 ?auto_632638 ) ) ( not ( = ?auto_632637 ?auto_632639 ) ) ( not ( = ?auto_632637 ?auto_632640 ) ) ( not ( = ?auto_632638 ?auto_632639 ) ) ( not ( = ?auto_632638 ?auto_632640 ) ) ( not ( = ?auto_632639 ?auto_632640 ) ) ( ON ?auto_632638 ?auto_632639 ) ( ON ?auto_632637 ?auto_632638 ) ( ON ?auto_632636 ?auto_632637 ) ( ON ?auto_632635 ?auto_632636 ) ( ON ?auto_632634 ?auto_632635 ) ( ON ?auto_632633 ?auto_632634 ) ( ON ?auto_632632 ?auto_632633 ) ( ON ?auto_632631 ?auto_632632 ) ( ON ?auto_632630 ?auto_632631 ) ( CLEAR ?auto_632628 ) ( ON ?auto_632629 ?auto_632630 ) ( CLEAR ?auto_632629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_632625 ?auto_632626 ?auto_632627 ?auto_632628 ?auto_632629 )
      ( MAKE-15PILE ?auto_632625 ?auto_632626 ?auto_632627 ?auto_632628 ?auto_632629 ?auto_632630 ?auto_632631 ?auto_632632 ?auto_632633 ?auto_632634 ?auto_632635 ?auto_632636 ?auto_632637 ?auto_632638 ?auto_632639 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632687 - BLOCK
      ?auto_632688 - BLOCK
      ?auto_632689 - BLOCK
      ?auto_632690 - BLOCK
      ?auto_632691 - BLOCK
      ?auto_632692 - BLOCK
      ?auto_632693 - BLOCK
      ?auto_632694 - BLOCK
      ?auto_632695 - BLOCK
      ?auto_632696 - BLOCK
      ?auto_632697 - BLOCK
      ?auto_632698 - BLOCK
      ?auto_632699 - BLOCK
      ?auto_632700 - BLOCK
      ?auto_632701 - BLOCK
    )
    :vars
    (
      ?auto_632702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632701 ?auto_632702 ) ( ON-TABLE ?auto_632687 ) ( ON ?auto_632688 ?auto_632687 ) ( ON ?auto_632689 ?auto_632688 ) ( not ( = ?auto_632687 ?auto_632688 ) ) ( not ( = ?auto_632687 ?auto_632689 ) ) ( not ( = ?auto_632687 ?auto_632690 ) ) ( not ( = ?auto_632687 ?auto_632691 ) ) ( not ( = ?auto_632687 ?auto_632692 ) ) ( not ( = ?auto_632687 ?auto_632693 ) ) ( not ( = ?auto_632687 ?auto_632694 ) ) ( not ( = ?auto_632687 ?auto_632695 ) ) ( not ( = ?auto_632687 ?auto_632696 ) ) ( not ( = ?auto_632687 ?auto_632697 ) ) ( not ( = ?auto_632687 ?auto_632698 ) ) ( not ( = ?auto_632687 ?auto_632699 ) ) ( not ( = ?auto_632687 ?auto_632700 ) ) ( not ( = ?auto_632687 ?auto_632701 ) ) ( not ( = ?auto_632687 ?auto_632702 ) ) ( not ( = ?auto_632688 ?auto_632689 ) ) ( not ( = ?auto_632688 ?auto_632690 ) ) ( not ( = ?auto_632688 ?auto_632691 ) ) ( not ( = ?auto_632688 ?auto_632692 ) ) ( not ( = ?auto_632688 ?auto_632693 ) ) ( not ( = ?auto_632688 ?auto_632694 ) ) ( not ( = ?auto_632688 ?auto_632695 ) ) ( not ( = ?auto_632688 ?auto_632696 ) ) ( not ( = ?auto_632688 ?auto_632697 ) ) ( not ( = ?auto_632688 ?auto_632698 ) ) ( not ( = ?auto_632688 ?auto_632699 ) ) ( not ( = ?auto_632688 ?auto_632700 ) ) ( not ( = ?auto_632688 ?auto_632701 ) ) ( not ( = ?auto_632688 ?auto_632702 ) ) ( not ( = ?auto_632689 ?auto_632690 ) ) ( not ( = ?auto_632689 ?auto_632691 ) ) ( not ( = ?auto_632689 ?auto_632692 ) ) ( not ( = ?auto_632689 ?auto_632693 ) ) ( not ( = ?auto_632689 ?auto_632694 ) ) ( not ( = ?auto_632689 ?auto_632695 ) ) ( not ( = ?auto_632689 ?auto_632696 ) ) ( not ( = ?auto_632689 ?auto_632697 ) ) ( not ( = ?auto_632689 ?auto_632698 ) ) ( not ( = ?auto_632689 ?auto_632699 ) ) ( not ( = ?auto_632689 ?auto_632700 ) ) ( not ( = ?auto_632689 ?auto_632701 ) ) ( not ( = ?auto_632689 ?auto_632702 ) ) ( not ( = ?auto_632690 ?auto_632691 ) ) ( not ( = ?auto_632690 ?auto_632692 ) ) ( not ( = ?auto_632690 ?auto_632693 ) ) ( not ( = ?auto_632690 ?auto_632694 ) ) ( not ( = ?auto_632690 ?auto_632695 ) ) ( not ( = ?auto_632690 ?auto_632696 ) ) ( not ( = ?auto_632690 ?auto_632697 ) ) ( not ( = ?auto_632690 ?auto_632698 ) ) ( not ( = ?auto_632690 ?auto_632699 ) ) ( not ( = ?auto_632690 ?auto_632700 ) ) ( not ( = ?auto_632690 ?auto_632701 ) ) ( not ( = ?auto_632690 ?auto_632702 ) ) ( not ( = ?auto_632691 ?auto_632692 ) ) ( not ( = ?auto_632691 ?auto_632693 ) ) ( not ( = ?auto_632691 ?auto_632694 ) ) ( not ( = ?auto_632691 ?auto_632695 ) ) ( not ( = ?auto_632691 ?auto_632696 ) ) ( not ( = ?auto_632691 ?auto_632697 ) ) ( not ( = ?auto_632691 ?auto_632698 ) ) ( not ( = ?auto_632691 ?auto_632699 ) ) ( not ( = ?auto_632691 ?auto_632700 ) ) ( not ( = ?auto_632691 ?auto_632701 ) ) ( not ( = ?auto_632691 ?auto_632702 ) ) ( not ( = ?auto_632692 ?auto_632693 ) ) ( not ( = ?auto_632692 ?auto_632694 ) ) ( not ( = ?auto_632692 ?auto_632695 ) ) ( not ( = ?auto_632692 ?auto_632696 ) ) ( not ( = ?auto_632692 ?auto_632697 ) ) ( not ( = ?auto_632692 ?auto_632698 ) ) ( not ( = ?auto_632692 ?auto_632699 ) ) ( not ( = ?auto_632692 ?auto_632700 ) ) ( not ( = ?auto_632692 ?auto_632701 ) ) ( not ( = ?auto_632692 ?auto_632702 ) ) ( not ( = ?auto_632693 ?auto_632694 ) ) ( not ( = ?auto_632693 ?auto_632695 ) ) ( not ( = ?auto_632693 ?auto_632696 ) ) ( not ( = ?auto_632693 ?auto_632697 ) ) ( not ( = ?auto_632693 ?auto_632698 ) ) ( not ( = ?auto_632693 ?auto_632699 ) ) ( not ( = ?auto_632693 ?auto_632700 ) ) ( not ( = ?auto_632693 ?auto_632701 ) ) ( not ( = ?auto_632693 ?auto_632702 ) ) ( not ( = ?auto_632694 ?auto_632695 ) ) ( not ( = ?auto_632694 ?auto_632696 ) ) ( not ( = ?auto_632694 ?auto_632697 ) ) ( not ( = ?auto_632694 ?auto_632698 ) ) ( not ( = ?auto_632694 ?auto_632699 ) ) ( not ( = ?auto_632694 ?auto_632700 ) ) ( not ( = ?auto_632694 ?auto_632701 ) ) ( not ( = ?auto_632694 ?auto_632702 ) ) ( not ( = ?auto_632695 ?auto_632696 ) ) ( not ( = ?auto_632695 ?auto_632697 ) ) ( not ( = ?auto_632695 ?auto_632698 ) ) ( not ( = ?auto_632695 ?auto_632699 ) ) ( not ( = ?auto_632695 ?auto_632700 ) ) ( not ( = ?auto_632695 ?auto_632701 ) ) ( not ( = ?auto_632695 ?auto_632702 ) ) ( not ( = ?auto_632696 ?auto_632697 ) ) ( not ( = ?auto_632696 ?auto_632698 ) ) ( not ( = ?auto_632696 ?auto_632699 ) ) ( not ( = ?auto_632696 ?auto_632700 ) ) ( not ( = ?auto_632696 ?auto_632701 ) ) ( not ( = ?auto_632696 ?auto_632702 ) ) ( not ( = ?auto_632697 ?auto_632698 ) ) ( not ( = ?auto_632697 ?auto_632699 ) ) ( not ( = ?auto_632697 ?auto_632700 ) ) ( not ( = ?auto_632697 ?auto_632701 ) ) ( not ( = ?auto_632697 ?auto_632702 ) ) ( not ( = ?auto_632698 ?auto_632699 ) ) ( not ( = ?auto_632698 ?auto_632700 ) ) ( not ( = ?auto_632698 ?auto_632701 ) ) ( not ( = ?auto_632698 ?auto_632702 ) ) ( not ( = ?auto_632699 ?auto_632700 ) ) ( not ( = ?auto_632699 ?auto_632701 ) ) ( not ( = ?auto_632699 ?auto_632702 ) ) ( not ( = ?auto_632700 ?auto_632701 ) ) ( not ( = ?auto_632700 ?auto_632702 ) ) ( not ( = ?auto_632701 ?auto_632702 ) ) ( ON ?auto_632700 ?auto_632701 ) ( ON ?auto_632699 ?auto_632700 ) ( ON ?auto_632698 ?auto_632699 ) ( ON ?auto_632697 ?auto_632698 ) ( ON ?auto_632696 ?auto_632697 ) ( ON ?auto_632695 ?auto_632696 ) ( ON ?auto_632694 ?auto_632695 ) ( ON ?auto_632693 ?auto_632694 ) ( ON ?auto_632692 ?auto_632693 ) ( ON ?auto_632691 ?auto_632692 ) ( CLEAR ?auto_632689 ) ( ON ?auto_632690 ?auto_632691 ) ( CLEAR ?auto_632690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_632687 ?auto_632688 ?auto_632689 ?auto_632690 )
      ( MAKE-15PILE ?auto_632687 ?auto_632688 ?auto_632689 ?auto_632690 ?auto_632691 ?auto_632692 ?auto_632693 ?auto_632694 ?auto_632695 ?auto_632696 ?auto_632697 ?auto_632698 ?auto_632699 ?auto_632700 ?auto_632701 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632749 - BLOCK
      ?auto_632750 - BLOCK
      ?auto_632751 - BLOCK
      ?auto_632752 - BLOCK
      ?auto_632753 - BLOCK
      ?auto_632754 - BLOCK
      ?auto_632755 - BLOCK
      ?auto_632756 - BLOCK
      ?auto_632757 - BLOCK
      ?auto_632758 - BLOCK
      ?auto_632759 - BLOCK
      ?auto_632760 - BLOCK
      ?auto_632761 - BLOCK
      ?auto_632762 - BLOCK
      ?auto_632763 - BLOCK
    )
    :vars
    (
      ?auto_632764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632763 ?auto_632764 ) ( ON-TABLE ?auto_632749 ) ( ON ?auto_632750 ?auto_632749 ) ( not ( = ?auto_632749 ?auto_632750 ) ) ( not ( = ?auto_632749 ?auto_632751 ) ) ( not ( = ?auto_632749 ?auto_632752 ) ) ( not ( = ?auto_632749 ?auto_632753 ) ) ( not ( = ?auto_632749 ?auto_632754 ) ) ( not ( = ?auto_632749 ?auto_632755 ) ) ( not ( = ?auto_632749 ?auto_632756 ) ) ( not ( = ?auto_632749 ?auto_632757 ) ) ( not ( = ?auto_632749 ?auto_632758 ) ) ( not ( = ?auto_632749 ?auto_632759 ) ) ( not ( = ?auto_632749 ?auto_632760 ) ) ( not ( = ?auto_632749 ?auto_632761 ) ) ( not ( = ?auto_632749 ?auto_632762 ) ) ( not ( = ?auto_632749 ?auto_632763 ) ) ( not ( = ?auto_632749 ?auto_632764 ) ) ( not ( = ?auto_632750 ?auto_632751 ) ) ( not ( = ?auto_632750 ?auto_632752 ) ) ( not ( = ?auto_632750 ?auto_632753 ) ) ( not ( = ?auto_632750 ?auto_632754 ) ) ( not ( = ?auto_632750 ?auto_632755 ) ) ( not ( = ?auto_632750 ?auto_632756 ) ) ( not ( = ?auto_632750 ?auto_632757 ) ) ( not ( = ?auto_632750 ?auto_632758 ) ) ( not ( = ?auto_632750 ?auto_632759 ) ) ( not ( = ?auto_632750 ?auto_632760 ) ) ( not ( = ?auto_632750 ?auto_632761 ) ) ( not ( = ?auto_632750 ?auto_632762 ) ) ( not ( = ?auto_632750 ?auto_632763 ) ) ( not ( = ?auto_632750 ?auto_632764 ) ) ( not ( = ?auto_632751 ?auto_632752 ) ) ( not ( = ?auto_632751 ?auto_632753 ) ) ( not ( = ?auto_632751 ?auto_632754 ) ) ( not ( = ?auto_632751 ?auto_632755 ) ) ( not ( = ?auto_632751 ?auto_632756 ) ) ( not ( = ?auto_632751 ?auto_632757 ) ) ( not ( = ?auto_632751 ?auto_632758 ) ) ( not ( = ?auto_632751 ?auto_632759 ) ) ( not ( = ?auto_632751 ?auto_632760 ) ) ( not ( = ?auto_632751 ?auto_632761 ) ) ( not ( = ?auto_632751 ?auto_632762 ) ) ( not ( = ?auto_632751 ?auto_632763 ) ) ( not ( = ?auto_632751 ?auto_632764 ) ) ( not ( = ?auto_632752 ?auto_632753 ) ) ( not ( = ?auto_632752 ?auto_632754 ) ) ( not ( = ?auto_632752 ?auto_632755 ) ) ( not ( = ?auto_632752 ?auto_632756 ) ) ( not ( = ?auto_632752 ?auto_632757 ) ) ( not ( = ?auto_632752 ?auto_632758 ) ) ( not ( = ?auto_632752 ?auto_632759 ) ) ( not ( = ?auto_632752 ?auto_632760 ) ) ( not ( = ?auto_632752 ?auto_632761 ) ) ( not ( = ?auto_632752 ?auto_632762 ) ) ( not ( = ?auto_632752 ?auto_632763 ) ) ( not ( = ?auto_632752 ?auto_632764 ) ) ( not ( = ?auto_632753 ?auto_632754 ) ) ( not ( = ?auto_632753 ?auto_632755 ) ) ( not ( = ?auto_632753 ?auto_632756 ) ) ( not ( = ?auto_632753 ?auto_632757 ) ) ( not ( = ?auto_632753 ?auto_632758 ) ) ( not ( = ?auto_632753 ?auto_632759 ) ) ( not ( = ?auto_632753 ?auto_632760 ) ) ( not ( = ?auto_632753 ?auto_632761 ) ) ( not ( = ?auto_632753 ?auto_632762 ) ) ( not ( = ?auto_632753 ?auto_632763 ) ) ( not ( = ?auto_632753 ?auto_632764 ) ) ( not ( = ?auto_632754 ?auto_632755 ) ) ( not ( = ?auto_632754 ?auto_632756 ) ) ( not ( = ?auto_632754 ?auto_632757 ) ) ( not ( = ?auto_632754 ?auto_632758 ) ) ( not ( = ?auto_632754 ?auto_632759 ) ) ( not ( = ?auto_632754 ?auto_632760 ) ) ( not ( = ?auto_632754 ?auto_632761 ) ) ( not ( = ?auto_632754 ?auto_632762 ) ) ( not ( = ?auto_632754 ?auto_632763 ) ) ( not ( = ?auto_632754 ?auto_632764 ) ) ( not ( = ?auto_632755 ?auto_632756 ) ) ( not ( = ?auto_632755 ?auto_632757 ) ) ( not ( = ?auto_632755 ?auto_632758 ) ) ( not ( = ?auto_632755 ?auto_632759 ) ) ( not ( = ?auto_632755 ?auto_632760 ) ) ( not ( = ?auto_632755 ?auto_632761 ) ) ( not ( = ?auto_632755 ?auto_632762 ) ) ( not ( = ?auto_632755 ?auto_632763 ) ) ( not ( = ?auto_632755 ?auto_632764 ) ) ( not ( = ?auto_632756 ?auto_632757 ) ) ( not ( = ?auto_632756 ?auto_632758 ) ) ( not ( = ?auto_632756 ?auto_632759 ) ) ( not ( = ?auto_632756 ?auto_632760 ) ) ( not ( = ?auto_632756 ?auto_632761 ) ) ( not ( = ?auto_632756 ?auto_632762 ) ) ( not ( = ?auto_632756 ?auto_632763 ) ) ( not ( = ?auto_632756 ?auto_632764 ) ) ( not ( = ?auto_632757 ?auto_632758 ) ) ( not ( = ?auto_632757 ?auto_632759 ) ) ( not ( = ?auto_632757 ?auto_632760 ) ) ( not ( = ?auto_632757 ?auto_632761 ) ) ( not ( = ?auto_632757 ?auto_632762 ) ) ( not ( = ?auto_632757 ?auto_632763 ) ) ( not ( = ?auto_632757 ?auto_632764 ) ) ( not ( = ?auto_632758 ?auto_632759 ) ) ( not ( = ?auto_632758 ?auto_632760 ) ) ( not ( = ?auto_632758 ?auto_632761 ) ) ( not ( = ?auto_632758 ?auto_632762 ) ) ( not ( = ?auto_632758 ?auto_632763 ) ) ( not ( = ?auto_632758 ?auto_632764 ) ) ( not ( = ?auto_632759 ?auto_632760 ) ) ( not ( = ?auto_632759 ?auto_632761 ) ) ( not ( = ?auto_632759 ?auto_632762 ) ) ( not ( = ?auto_632759 ?auto_632763 ) ) ( not ( = ?auto_632759 ?auto_632764 ) ) ( not ( = ?auto_632760 ?auto_632761 ) ) ( not ( = ?auto_632760 ?auto_632762 ) ) ( not ( = ?auto_632760 ?auto_632763 ) ) ( not ( = ?auto_632760 ?auto_632764 ) ) ( not ( = ?auto_632761 ?auto_632762 ) ) ( not ( = ?auto_632761 ?auto_632763 ) ) ( not ( = ?auto_632761 ?auto_632764 ) ) ( not ( = ?auto_632762 ?auto_632763 ) ) ( not ( = ?auto_632762 ?auto_632764 ) ) ( not ( = ?auto_632763 ?auto_632764 ) ) ( ON ?auto_632762 ?auto_632763 ) ( ON ?auto_632761 ?auto_632762 ) ( ON ?auto_632760 ?auto_632761 ) ( ON ?auto_632759 ?auto_632760 ) ( ON ?auto_632758 ?auto_632759 ) ( ON ?auto_632757 ?auto_632758 ) ( ON ?auto_632756 ?auto_632757 ) ( ON ?auto_632755 ?auto_632756 ) ( ON ?auto_632754 ?auto_632755 ) ( ON ?auto_632753 ?auto_632754 ) ( ON ?auto_632752 ?auto_632753 ) ( CLEAR ?auto_632750 ) ( ON ?auto_632751 ?auto_632752 ) ( CLEAR ?auto_632751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_632749 ?auto_632750 ?auto_632751 )
      ( MAKE-15PILE ?auto_632749 ?auto_632750 ?auto_632751 ?auto_632752 ?auto_632753 ?auto_632754 ?auto_632755 ?auto_632756 ?auto_632757 ?auto_632758 ?auto_632759 ?auto_632760 ?auto_632761 ?auto_632762 ?auto_632763 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632811 - BLOCK
      ?auto_632812 - BLOCK
      ?auto_632813 - BLOCK
      ?auto_632814 - BLOCK
      ?auto_632815 - BLOCK
      ?auto_632816 - BLOCK
      ?auto_632817 - BLOCK
      ?auto_632818 - BLOCK
      ?auto_632819 - BLOCK
      ?auto_632820 - BLOCK
      ?auto_632821 - BLOCK
      ?auto_632822 - BLOCK
      ?auto_632823 - BLOCK
      ?auto_632824 - BLOCK
      ?auto_632825 - BLOCK
    )
    :vars
    (
      ?auto_632826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632825 ?auto_632826 ) ( ON-TABLE ?auto_632811 ) ( not ( = ?auto_632811 ?auto_632812 ) ) ( not ( = ?auto_632811 ?auto_632813 ) ) ( not ( = ?auto_632811 ?auto_632814 ) ) ( not ( = ?auto_632811 ?auto_632815 ) ) ( not ( = ?auto_632811 ?auto_632816 ) ) ( not ( = ?auto_632811 ?auto_632817 ) ) ( not ( = ?auto_632811 ?auto_632818 ) ) ( not ( = ?auto_632811 ?auto_632819 ) ) ( not ( = ?auto_632811 ?auto_632820 ) ) ( not ( = ?auto_632811 ?auto_632821 ) ) ( not ( = ?auto_632811 ?auto_632822 ) ) ( not ( = ?auto_632811 ?auto_632823 ) ) ( not ( = ?auto_632811 ?auto_632824 ) ) ( not ( = ?auto_632811 ?auto_632825 ) ) ( not ( = ?auto_632811 ?auto_632826 ) ) ( not ( = ?auto_632812 ?auto_632813 ) ) ( not ( = ?auto_632812 ?auto_632814 ) ) ( not ( = ?auto_632812 ?auto_632815 ) ) ( not ( = ?auto_632812 ?auto_632816 ) ) ( not ( = ?auto_632812 ?auto_632817 ) ) ( not ( = ?auto_632812 ?auto_632818 ) ) ( not ( = ?auto_632812 ?auto_632819 ) ) ( not ( = ?auto_632812 ?auto_632820 ) ) ( not ( = ?auto_632812 ?auto_632821 ) ) ( not ( = ?auto_632812 ?auto_632822 ) ) ( not ( = ?auto_632812 ?auto_632823 ) ) ( not ( = ?auto_632812 ?auto_632824 ) ) ( not ( = ?auto_632812 ?auto_632825 ) ) ( not ( = ?auto_632812 ?auto_632826 ) ) ( not ( = ?auto_632813 ?auto_632814 ) ) ( not ( = ?auto_632813 ?auto_632815 ) ) ( not ( = ?auto_632813 ?auto_632816 ) ) ( not ( = ?auto_632813 ?auto_632817 ) ) ( not ( = ?auto_632813 ?auto_632818 ) ) ( not ( = ?auto_632813 ?auto_632819 ) ) ( not ( = ?auto_632813 ?auto_632820 ) ) ( not ( = ?auto_632813 ?auto_632821 ) ) ( not ( = ?auto_632813 ?auto_632822 ) ) ( not ( = ?auto_632813 ?auto_632823 ) ) ( not ( = ?auto_632813 ?auto_632824 ) ) ( not ( = ?auto_632813 ?auto_632825 ) ) ( not ( = ?auto_632813 ?auto_632826 ) ) ( not ( = ?auto_632814 ?auto_632815 ) ) ( not ( = ?auto_632814 ?auto_632816 ) ) ( not ( = ?auto_632814 ?auto_632817 ) ) ( not ( = ?auto_632814 ?auto_632818 ) ) ( not ( = ?auto_632814 ?auto_632819 ) ) ( not ( = ?auto_632814 ?auto_632820 ) ) ( not ( = ?auto_632814 ?auto_632821 ) ) ( not ( = ?auto_632814 ?auto_632822 ) ) ( not ( = ?auto_632814 ?auto_632823 ) ) ( not ( = ?auto_632814 ?auto_632824 ) ) ( not ( = ?auto_632814 ?auto_632825 ) ) ( not ( = ?auto_632814 ?auto_632826 ) ) ( not ( = ?auto_632815 ?auto_632816 ) ) ( not ( = ?auto_632815 ?auto_632817 ) ) ( not ( = ?auto_632815 ?auto_632818 ) ) ( not ( = ?auto_632815 ?auto_632819 ) ) ( not ( = ?auto_632815 ?auto_632820 ) ) ( not ( = ?auto_632815 ?auto_632821 ) ) ( not ( = ?auto_632815 ?auto_632822 ) ) ( not ( = ?auto_632815 ?auto_632823 ) ) ( not ( = ?auto_632815 ?auto_632824 ) ) ( not ( = ?auto_632815 ?auto_632825 ) ) ( not ( = ?auto_632815 ?auto_632826 ) ) ( not ( = ?auto_632816 ?auto_632817 ) ) ( not ( = ?auto_632816 ?auto_632818 ) ) ( not ( = ?auto_632816 ?auto_632819 ) ) ( not ( = ?auto_632816 ?auto_632820 ) ) ( not ( = ?auto_632816 ?auto_632821 ) ) ( not ( = ?auto_632816 ?auto_632822 ) ) ( not ( = ?auto_632816 ?auto_632823 ) ) ( not ( = ?auto_632816 ?auto_632824 ) ) ( not ( = ?auto_632816 ?auto_632825 ) ) ( not ( = ?auto_632816 ?auto_632826 ) ) ( not ( = ?auto_632817 ?auto_632818 ) ) ( not ( = ?auto_632817 ?auto_632819 ) ) ( not ( = ?auto_632817 ?auto_632820 ) ) ( not ( = ?auto_632817 ?auto_632821 ) ) ( not ( = ?auto_632817 ?auto_632822 ) ) ( not ( = ?auto_632817 ?auto_632823 ) ) ( not ( = ?auto_632817 ?auto_632824 ) ) ( not ( = ?auto_632817 ?auto_632825 ) ) ( not ( = ?auto_632817 ?auto_632826 ) ) ( not ( = ?auto_632818 ?auto_632819 ) ) ( not ( = ?auto_632818 ?auto_632820 ) ) ( not ( = ?auto_632818 ?auto_632821 ) ) ( not ( = ?auto_632818 ?auto_632822 ) ) ( not ( = ?auto_632818 ?auto_632823 ) ) ( not ( = ?auto_632818 ?auto_632824 ) ) ( not ( = ?auto_632818 ?auto_632825 ) ) ( not ( = ?auto_632818 ?auto_632826 ) ) ( not ( = ?auto_632819 ?auto_632820 ) ) ( not ( = ?auto_632819 ?auto_632821 ) ) ( not ( = ?auto_632819 ?auto_632822 ) ) ( not ( = ?auto_632819 ?auto_632823 ) ) ( not ( = ?auto_632819 ?auto_632824 ) ) ( not ( = ?auto_632819 ?auto_632825 ) ) ( not ( = ?auto_632819 ?auto_632826 ) ) ( not ( = ?auto_632820 ?auto_632821 ) ) ( not ( = ?auto_632820 ?auto_632822 ) ) ( not ( = ?auto_632820 ?auto_632823 ) ) ( not ( = ?auto_632820 ?auto_632824 ) ) ( not ( = ?auto_632820 ?auto_632825 ) ) ( not ( = ?auto_632820 ?auto_632826 ) ) ( not ( = ?auto_632821 ?auto_632822 ) ) ( not ( = ?auto_632821 ?auto_632823 ) ) ( not ( = ?auto_632821 ?auto_632824 ) ) ( not ( = ?auto_632821 ?auto_632825 ) ) ( not ( = ?auto_632821 ?auto_632826 ) ) ( not ( = ?auto_632822 ?auto_632823 ) ) ( not ( = ?auto_632822 ?auto_632824 ) ) ( not ( = ?auto_632822 ?auto_632825 ) ) ( not ( = ?auto_632822 ?auto_632826 ) ) ( not ( = ?auto_632823 ?auto_632824 ) ) ( not ( = ?auto_632823 ?auto_632825 ) ) ( not ( = ?auto_632823 ?auto_632826 ) ) ( not ( = ?auto_632824 ?auto_632825 ) ) ( not ( = ?auto_632824 ?auto_632826 ) ) ( not ( = ?auto_632825 ?auto_632826 ) ) ( ON ?auto_632824 ?auto_632825 ) ( ON ?auto_632823 ?auto_632824 ) ( ON ?auto_632822 ?auto_632823 ) ( ON ?auto_632821 ?auto_632822 ) ( ON ?auto_632820 ?auto_632821 ) ( ON ?auto_632819 ?auto_632820 ) ( ON ?auto_632818 ?auto_632819 ) ( ON ?auto_632817 ?auto_632818 ) ( ON ?auto_632816 ?auto_632817 ) ( ON ?auto_632815 ?auto_632816 ) ( ON ?auto_632814 ?auto_632815 ) ( ON ?auto_632813 ?auto_632814 ) ( CLEAR ?auto_632811 ) ( ON ?auto_632812 ?auto_632813 ) ( CLEAR ?auto_632812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_632811 ?auto_632812 )
      ( MAKE-15PILE ?auto_632811 ?auto_632812 ?auto_632813 ?auto_632814 ?auto_632815 ?auto_632816 ?auto_632817 ?auto_632818 ?auto_632819 ?auto_632820 ?auto_632821 ?auto_632822 ?auto_632823 ?auto_632824 ?auto_632825 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_632873 - BLOCK
      ?auto_632874 - BLOCK
      ?auto_632875 - BLOCK
      ?auto_632876 - BLOCK
      ?auto_632877 - BLOCK
      ?auto_632878 - BLOCK
      ?auto_632879 - BLOCK
      ?auto_632880 - BLOCK
      ?auto_632881 - BLOCK
      ?auto_632882 - BLOCK
      ?auto_632883 - BLOCK
      ?auto_632884 - BLOCK
      ?auto_632885 - BLOCK
      ?auto_632886 - BLOCK
      ?auto_632887 - BLOCK
    )
    :vars
    (
      ?auto_632888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_632887 ?auto_632888 ) ( not ( = ?auto_632873 ?auto_632874 ) ) ( not ( = ?auto_632873 ?auto_632875 ) ) ( not ( = ?auto_632873 ?auto_632876 ) ) ( not ( = ?auto_632873 ?auto_632877 ) ) ( not ( = ?auto_632873 ?auto_632878 ) ) ( not ( = ?auto_632873 ?auto_632879 ) ) ( not ( = ?auto_632873 ?auto_632880 ) ) ( not ( = ?auto_632873 ?auto_632881 ) ) ( not ( = ?auto_632873 ?auto_632882 ) ) ( not ( = ?auto_632873 ?auto_632883 ) ) ( not ( = ?auto_632873 ?auto_632884 ) ) ( not ( = ?auto_632873 ?auto_632885 ) ) ( not ( = ?auto_632873 ?auto_632886 ) ) ( not ( = ?auto_632873 ?auto_632887 ) ) ( not ( = ?auto_632873 ?auto_632888 ) ) ( not ( = ?auto_632874 ?auto_632875 ) ) ( not ( = ?auto_632874 ?auto_632876 ) ) ( not ( = ?auto_632874 ?auto_632877 ) ) ( not ( = ?auto_632874 ?auto_632878 ) ) ( not ( = ?auto_632874 ?auto_632879 ) ) ( not ( = ?auto_632874 ?auto_632880 ) ) ( not ( = ?auto_632874 ?auto_632881 ) ) ( not ( = ?auto_632874 ?auto_632882 ) ) ( not ( = ?auto_632874 ?auto_632883 ) ) ( not ( = ?auto_632874 ?auto_632884 ) ) ( not ( = ?auto_632874 ?auto_632885 ) ) ( not ( = ?auto_632874 ?auto_632886 ) ) ( not ( = ?auto_632874 ?auto_632887 ) ) ( not ( = ?auto_632874 ?auto_632888 ) ) ( not ( = ?auto_632875 ?auto_632876 ) ) ( not ( = ?auto_632875 ?auto_632877 ) ) ( not ( = ?auto_632875 ?auto_632878 ) ) ( not ( = ?auto_632875 ?auto_632879 ) ) ( not ( = ?auto_632875 ?auto_632880 ) ) ( not ( = ?auto_632875 ?auto_632881 ) ) ( not ( = ?auto_632875 ?auto_632882 ) ) ( not ( = ?auto_632875 ?auto_632883 ) ) ( not ( = ?auto_632875 ?auto_632884 ) ) ( not ( = ?auto_632875 ?auto_632885 ) ) ( not ( = ?auto_632875 ?auto_632886 ) ) ( not ( = ?auto_632875 ?auto_632887 ) ) ( not ( = ?auto_632875 ?auto_632888 ) ) ( not ( = ?auto_632876 ?auto_632877 ) ) ( not ( = ?auto_632876 ?auto_632878 ) ) ( not ( = ?auto_632876 ?auto_632879 ) ) ( not ( = ?auto_632876 ?auto_632880 ) ) ( not ( = ?auto_632876 ?auto_632881 ) ) ( not ( = ?auto_632876 ?auto_632882 ) ) ( not ( = ?auto_632876 ?auto_632883 ) ) ( not ( = ?auto_632876 ?auto_632884 ) ) ( not ( = ?auto_632876 ?auto_632885 ) ) ( not ( = ?auto_632876 ?auto_632886 ) ) ( not ( = ?auto_632876 ?auto_632887 ) ) ( not ( = ?auto_632876 ?auto_632888 ) ) ( not ( = ?auto_632877 ?auto_632878 ) ) ( not ( = ?auto_632877 ?auto_632879 ) ) ( not ( = ?auto_632877 ?auto_632880 ) ) ( not ( = ?auto_632877 ?auto_632881 ) ) ( not ( = ?auto_632877 ?auto_632882 ) ) ( not ( = ?auto_632877 ?auto_632883 ) ) ( not ( = ?auto_632877 ?auto_632884 ) ) ( not ( = ?auto_632877 ?auto_632885 ) ) ( not ( = ?auto_632877 ?auto_632886 ) ) ( not ( = ?auto_632877 ?auto_632887 ) ) ( not ( = ?auto_632877 ?auto_632888 ) ) ( not ( = ?auto_632878 ?auto_632879 ) ) ( not ( = ?auto_632878 ?auto_632880 ) ) ( not ( = ?auto_632878 ?auto_632881 ) ) ( not ( = ?auto_632878 ?auto_632882 ) ) ( not ( = ?auto_632878 ?auto_632883 ) ) ( not ( = ?auto_632878 ?auto_632884 ) ) ( not ( = ?auto_632878 ?auto_632885 ) ) ( not ( = ?auto_632878 ?auto_632886 ) ) ( not ( = ?auto_632878 ?auto_632887 ) ) ( not ( = ?auto_632878 ?auto_632888 ) ) ( not ( = ?auto_632879 ?auto_632880 ) ) ( not ( = ?auto_632879 ?auto_632881 ) ) ( not ( = ?auto_632879 ?auto_632882 ) ) ( not ( = ?auto_632879 ?auto_632883 ) ) ( not ( = ?auto_632879 ?auto_632884 ) ) ( not ( = ?auto_632879 ?auto_632885 ) ) ( not ( = ?auto_632879 ?auto_632886 ) ) ( not ( = ?auto_632879 ?auto_632887 ) ) ( not ( = ?auto_632879 ?auto_632888 ) ) ( not ( = ?auto_632880 ?auto_632881 ) ) ( not ( = ?auto_632880 ?auto_632882 ) ) ( not ( = ?auto_632880 ?auto_632883 ) ) ( not ( = ?auto_632880 ?auto_632884 ) ) ( not ( = ?auto_632880 ?auto_632885 ) ) ( not ( = ?auto_632880 ?auto_632886 ) ) ( not ( = ?auto_632880 ?auto_632887 ) ) ( not ( = ?auto_632880 ?auto_632888 ) ) ( not ( = ?auto_632881 ?auto_632882 ) ) ( not ( = ?auto_632881 ?auto_632883 ) ) ( not ( = ?auto_632881 ?auto_632884 ) ) ( not ( = ?auto_632881 ?auto_632885 ) ) ( not ( = ?auto_632881 ?auto_632886 ) ) ( not ( = ?auto_632881 ?auto_632887 ) ) ( not ( = ?auto_632881 ?auto_632888 ) ) ( not ( = ?auto_632882 ?auto_632883 ) ) ( not ( = ?auto_632882 ?auto_632884 ) ) ( not ( = ?auto_632882 ?auto_632885 ) ) ( not ( = ?auto_632882 ?auto_632886 ) ) ( not ( = ?auto_632882 ?auto_632887 ) ) ( not ( = ?auto_632882 ?auto_632888 ) ) ( not ( = ?auto_632883 ?auto_632884 ) ) ( not ( = ?auto_632883 ?auto_632885 ) ) ( not ( = ?auto_632883 ?auto_632886 ) ) ( not ( = ?auto_632883 ?auto_632887 ) ) ( not ( = ?auto_632883 ?auto_632888 ) ) ( not ( = ?auto_632884 ?auto_632885 ) ) ( not ( = ?auto_632884 ?auto_632886 ) ) ( not ( = ?auto_632884 ?auto_632887 ) ) ( not ( = ?auto_632884 ?auto_632888 ) ) ( not ( = ?auto_632885 ?auto_632886 ) ) ( not ( = ?auto_632885 ?auto_632887 ) ) ( not ( = ?auto_632885 ?auto_632888 ) ) ( not ( = ?auto_632886 ?auto_632887 ) ) ( not ( = ?auto_632886 ?auto_632888 ) ) ( not ( = ?auto_632887 ?auto_632888 ) ) ( ON ?auto_632886 ?auto_632887 ) ( ON ?auto_632885 ?auto_632886 ) ( ON ?auto_632884 ?auto_632885 ) ( ON ?auto_632883 ?auto_632884 ) ( ON ?auto_632882 ?auto_632883 ) ( ON ?auto_632881 ?auto_632882 ) ( ON ?auto_632880 ?auto_632881 ) ( ON ?auto_632879 ?auto_632880 ) ( ON ?auto_632878 ?auto_632879 ) ( ON ?auto_632877 ?auto_632878 ) ( ON ?auto_632876 ?auto_632877 ) ( ON ?auto_632875 ?auto_632876 ) ( ON ?auto_632874 ?auto_632875 ) ( ON ?auto_632873 ?auto_632874 ) ( CLEAR ?auto_632873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_632873 )
      ( MAKE-15PILE ?auto_632873 ?auto_632874 ?auto_632875 ?auto_632876 ?auto_632877 ?auto_632878 ?auto_632879 ?auto_632880 ?auto_632881 ?auto_632882 ?auto_632883 ?auto_632884 ?auto_632885 ?auto_632886 ?auto_632887 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_632936 - BLOCK
      ?auto_632937 - BLOCK
      ?auto_632938 - BLOCK
      ?auto_632939 - BLOCK
      ?auto_632940 - BLOCK
      ?auto_632941 - BLOCK
      ?auto_632942 - BLOCK
      ?auto_632943 - BLOCK
      ?auto_632944 - BLOCK
      ?auto_632945 - BLOCK
      ?auto_632946 - BLOCK
      ?auto_632947 - BLOCK
      ?auto_632948 - BLOCK
      ?auto_632949 - BLOCK
      ?auto_632950 - BLOCK
      ?auto_632951 - BLOCK
    )
    :vars
    (
      ?auto_632952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_632950 ) ( ON ?auto_632951 ?auto_632952 ) ( CLEAR ?auto_632951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_632936 ) ( ON ?auto_632937 ?auto_632936 ) ( ON ?auto_632938 ?auto_632937 ) ( ON ?auto_632939 ?auto_632938 ) ( ON ?auto_632940 ?auto_632939 ) ( ON ?auto_632941 ?auto_632940 ) ( ON ?auto_632942 ?auto_632941 ) ( ON ?auto_632943 ?auto_632942 ) ( ON ?auto_632944 ?auto_632943 ) ( ON ?auto_632945 ?auto_632944 ) ( ON ?auto_632946 ?auto_632945 ) ( ON ?auto_632947 ?auto_632946 ) ( ON ?auto_632948 ?auto_632947 ) ( ON ?auto_632949 ?auto_632948 ) ( ON ?auto_632950 ?auto_632949 ) ( not ( = ?auto_632936 ?auto_632937 ) ) ( not ( = ?auto_632936 ?auto_632938 ) ) ( not ( = ?auto_632936 ?auto_632939 ) ) ( not ( = ?auto_632936 ?auto_632940 ) ) ( not ( = ?auto_632936 ?auto_632941 ) ) ( not ( = ?auto_632936 ?auto_632942 ) ) ( not ( = ?auto_632936 ?auto_632943 ) ) ( not ( = ?auto_632936 ?auto_632944 ) ) ( not ( = ?auto_632936 ?auto_632945 ) ) ( not ( = ?auto_632936 ?auto_632946 ) ) ( not ( = ?auto_632936 ?auto_632947 ) ) ( not ( = ?auto_632936 ?auto_632948 ) ) ( not ( = ?auto_632936 ?auto_632949 ) ) ( not ( = ?auto_632936 ?auto_632950 ) ) ( not ( = ?auto_632936 ?auto_632951 ) ) ( not ( = ?auto_632936 ?auto_632952 ) ) ( not ( = ?auto_632937 ?auto_632938 ) ) ( not ( = ?auto_632937 ?auto_632939 ) ) ( not ( = ?auto_632937 ?auto_632940 ) ) ( not ( = ?auto_632937 ?auto_632941 ) ) ( not ( = ?auto_632937 ?auto_632942 ) ) ( not ( = ?auto_632937 ?auto_632943 ) ) ( not ( = ?auto_632937 ?auto_632944 ) ) ( not ( = ?auto_632937 ?auto_632945 ) ) ( not ( = ?auto_632937 ?auto_632946 ) ) ( not ( = ?auto_632937 ?auto_632947 ) ) ( not ( = ?auto_632937 ?auto_632948 ) ) ( not ( = ?auto_632937 ?auto_632949 ) ) ( not ( = ?auto_632937 ?auto_632950 ) ) ( not ( = ?auto_632937 ?auto_632951 ) ) ( not ( = ?auto_632937 ?auto_632952 ) ) ( not ( = ?auto_632938 ?auto_632939 ) ) ( not ( = ?auto_632938 ?auto_632940 ) ) ( not ( = ?auto_632938 ?auto_632941 ) ) ( not ( = ?auto_632938 ?auto_632942 ) ) ( not ( = ?auto_632938 ?auto_632943 ) ) ( not ( = ?auto_632938 ?auto_632944 ) ) ( not ( = ?auto_632938 ?auto_632945 ) ) ( not ( = ?auto_632938 ?auto_632946 ) ) ( not ( = ?auto_632938 ?auto_632947 ) ) ( not ( = ?auto_632938 ?auto_632948 ) ) ( not ( = ?auto_632938 ?auto_632949 ) ) ( not ( = ?auto_632938 ?auto_632950 ) ) ( not ( = ?auto_632938 ?auto_632951 ) ) ( not ( = ?auto_632938 ?auto_632952 ) ) ( not ( = ?auto_632939 ?auto_632940 ) ) ( not ( = ?auto_632939 ?auto_632941 ) ) ( not ( = ?auto_632939 ?auto_632942 ) ) ( not ( = ?auto_632939 ?auto_632943 ) ) ( not ( = ?auto_632939 ?auto_632944 ) ) ( not ( = ?auto_632939 ?auto_632945 ) ) ( not ( = ?auto_632939 ?auto_632946 ) ) ( not ( = ?auto_632939 ?auto_632947 ) ) ( not ( = ?auto_632939 ?auto_632948 ) ) ( not ( = ?auto_632939 ?auto_632949 ) ) ( not ( = ?auto_632939 ?auto_632950 ) ) ( not ( = ?auto_632939 ?auto_632951 ) ) ( not ( = ?auto_632939 ?auto_632952 ) ) ( not ( = ?auto_632940 ?auto_632941 ) ) ( not ( = ?auto_632940 ?auto_632942 ) ) ( not ( = ?auto_632940 ?auto_632943 ) ) ( not ( = ?auto_632940 ?auto_632944 ) ) ( not ( = ?auto_632940 ?auto_632945 ) ) ( not ( = ?auto_632940 ?auto_632946 ) ) ( not ( = ?auto_632940 ?auto_632947 ) ) ( not ( = ?auto_632940 ?auto_632948 ) ) ( not ( = ?auto_632940 ?auto_632949 ) ) ( not ( = ?auto_632940 ?auto_632950 ) ) ( not ( = ?auto_632940 ?auto_632951 ) ) ( not ( = ?auto_632940 ?auto_632952 ) ) ( not ( = ?auto_632941 ?auto_632942 ) ) ( not ( = ?auto_632941 ?auto_632943 ) ) ( not ( = ?auto_632941 ?auto_632944 ) ) ( not ( = ?auto_632941 ?auto_632945 ) ) ( not ( = ?auto_632941 ?auto_632946 ) ) ( not ( = ?auto_632941 ?auto_632947 ) ) ( not ( = ?auto_632941 ?auto_632948 ) ) ( not ( = ?auto_632941 ?auto_632949 ) ) ( not ( = ?auto_632941 ?auto_632950 ) ) ( not ( = ?auto_632941 ?auto_632951 ) ) ( not ( = ?auto_632941 ?auto_632952 ) ) ( not ( = ?auto_632942 ?auto_632943 ) ) ( not ( = ?auto_632942 ?auto_632944 ) ) ( not ( = ?auto_632942 ?auto_632945 ) ) ( not ( = ?auto_632942 ?auto_632946 ) ) ( not ( = ?auto_632942 ?auto_632947 ) ) ( not ( = ?auto_632942 ?auto_632948 ) ) ( not ( = ?auto_632942 ?auto_632949 ) ) ( not ( = ?auto_632942 ?auto_632950 ) ) ( not ( = ?auto_632942 ?auto_632951 ) ) ( not ( = ?auto_632942 ?auto_632952 ) ) ( not ( = ?auto_632943 ?auto_632944 ) ) ( not ( = ?auto_632943 ?auto_632945 ) ) ( not ( = ?auto_632943 ?auto_632946 ) ) ( not ( = ?auto_632943 ?auto_632947 ) ) ( not ( = ?auto_632943 ?auto_632948 ) ) ( not ( = ?auto_632943 ?auto_632949 ) ) ( not ( = ?auto_632943 ?auto_632950 ) ) ( not ( = ?auto_632943 ?auto_632951 ) ) ( not ( = ?auto_632943 ?auto_632952 ) ) ( not ( = ?auto_632944 ?auto_632945 ) ) ( not ( = ?auto_632944 ?auto_632946 ) ) ( not ( = ?auto_632944 ?auto_632947 ) ) ( not ( = ?auto_632944 ?auto_632948 ) ) ( not ( = ?auto_632944 ?auto_632949 ) ) ( not ( = ?auto_632944 ?auto_632950 ) ) ( not ( = ?auto_632944 ?auto_632951 ) ) ( not ( = ?auto_632944 ?auto_632952 ) ) ( not ( = ?auto_632945 ?auto_632946 ) ) ( not ( = ?auto_632945 ?auto_632947 ) ) ( not ( = ?auto_632945 ?auto_632948 ) ) ( not ( = ?auto_632945 ?auto_632949 ) ) ( not ( = ?auto_632945 ?auto_632950 ) ) ( not ( = ?auto_632945 ?auto_632951 ) ) ( not ( = ?auto_632945 ?auto_632952 ) ) ( not ( = ?auto_632946 ?auto_632947 ) ) ( not ( = ?auto_632946 ?auto_632948 ) ) ( not ( = ?auto_632946 ?auto_632949 ) ) ( not ( = ?auto_632946 ?auto_632950 ) ) ( not ( = ?auto_632946 ?auto_632951 ) ) ( not ( = ?auto_632946 ?auto_632952 ) ) ( not ( = ?auto_632947 ?auto_632948 ) ) ( not ( = ?auto_632947 ?auto_632949 ) ) ( not ( = ?auto_632947 ?auto_632950 ) ) ( not ( = ?auto_632947 ?auto_632951 ) ) ( not ( = ?auto_632947 ?auto_632952 ) ) ( not ( = ?auto_632948 ?auto_632949 ) ) ( not ( = ?auto_632948 ?auto_632950 ) ) ( not ( = ?auto_632948 ?auto_632951 ) ) ( not ( = ?auto_632948 ?auto_632952 ) ) ( not ( = ?auto_632949 ?auto_632950 ) ) ( not ( = ?auto_632949 ?auto_632951 ) ) ( not ( = ?auto_632949 ?auto_632952 ) ) ( not ( = ?auto_632950 ?auto_632951 ) ) ( not ( = ?auto_632950 ?auto_632952 ) ) ( not ( = ?auto_632951 ?auto_632952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_632951 ?auto_632952 )
      ( !STACK ?auto_632951 ?auto_632950 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633002 - BLOCK
      ?auto_633003 - BLOCK
      ?auto_633004 - BLOCK
      ?auto_633005 - BLOCK
      ?auto_633006 - BLOCK
      ?auto_633007 - BLOCK
      ?auto_633008 - BLOCK
      ?auto_633009 - BLOCK
      ?auto_633010 - BLOCK
      ?auto_633011 - BLOCK
      ?auto_633012 - BLOCK
      ?auto_633013 - BLOCK
      ?auto_633014 - BLOCK
      ?auto_633015 - BLOCK
      ?auto_633016 - BLOCK
      ?auto_633017 - BLOCK
    )
    :vars
    (
      ?auto_633018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633017 ?auto_633018 ) ( ON-TABLE ?auto_633002 ) ( ON ?auto_633003 ?auto_633002 ) ( ON ?auto_633004 ?auto_633003 ) ( ON ?auto_633005 ?auto_633004 ) ( ON ?auto_633006 ?auto_633005 ) ( ON ?auto_633007 ?auto_633006 ) ( ON ?auto_633008 ?auto_633007 ) ( ON ?auto_633009 ?auto_633008 ) ( ON ?auto_633010 ?auto_633009 ) ( ON ?auto_633011 ?auto_633010 ) ( ON ?auto_633012 ?auto_633011 ) ( ON ?auto_633013 ?auto_633012 ) ( ON ?auto_633014 ?auto_633013 ) ( ON ?auto_633015 ?auto_633014 ) ( not ( = ?auto_633002 ?auto_633003 ) ) ( not ( = ?auto_633002 ?auto_633004 ) ) ( not ( = ?auto_633002 ?auto_633005 ) ) ( not ( = ?auto_633002 ?auto_633006 ) ) ( not ( = ?auto_633002 ?auto_633007 ) ) ( not ( = ?auto_633002 ?auto_633008 ) ) ( not ( = ?auto_633002 ?auto_633009 ) ) ( not ( = ?auto_633002 ?auto_633010 ) ) ( not ( = ?auto_633002 ?auto_633011 ) ) ( not ( = ?auto_633002 ?auto_633012 ) ) ( not ( = ?auto_633002 ?auto_633013 ) ) ( not ( = ?auto_633002 ?auto_633014 ) ) ( not ( = ?auto_633002 ?auto_633015 ) ) ( not ( = ?auto_633002 ?auto_633016 ) ) ( not ( = ?auto_633002 ?auto_633017 ) ) ( not ( = ?auto_633002 ?auto_633018 ) ) ( not ( = ?auto_633003 ?auto_633004 ) ) ( not ( = ?auto_633003 ?auto_633005 ) ) ( not ( = ?auto_633003 ?auto_633006 ) ) ( not ( = ?auto_633003 ?auto_633007 ) ) ( not ( = ?auto_633003 ?auto_633008 ) ) ( not ( = ?auto_633003 ?auto_633009 ) ) ( not ( = ?auto_633003 ?auto_633010 ) ) ( not ( = ?auto_633003 ?auto_633011 ) ) ( not ( = ?auto_633003 ?auto_633012 ) ) ( not ( = ?auto_633003 ?auto_633013 ) ) ( not ( = ?auto_633003 ?auto_633014 ) ) ( not ( = ?auto_633003 ?auto_633015 ) ) ( not ( = ?auto_633003 ?auto_633016 ) ) ( not ( = ?auto_633003 ?auto_633017 ) ) ( not ( = ?auto_633003 ?auto_633018 ) ) ( not ( = ?auto_633004 ?auto_633005 ) ) ( not ( = ?auto_633004 ?auto_633006 ) ) ( not ( = ?auto_633004 ?auto_633007 ) ) ( not ( = ?auto_633004 ?auto_633008 ) ) ( not ( = ?auto_633004 ?auto_633009 ) ) ( not ( = ?auto_633004 ?auto_633010 ) ) ( not ( = ?auto_633004 ?auto_633011 ) ) ( not ( = ?auto_633004 ?auto_633012 ) ) ( not ( = ?auto_633004 ?auto_633013 ) ) ( not ( = ?auto_633004 ?auto_633014 ) ) ( not ( = ?auto_633004 ?auto_633015 ) ) ( not ( = ?auto_633004 ?auto_633016 ) ) ( not ( = ?auto_633004 ?auto_633017 ) ) ( not ( = ?auto_633004 ?auto_633018 ) ) ( not ( = ?auto_633005 ?auto_633006 ) ) ( not ( = ?auto_633005 ?auto_633007 ) ) ( not ( = ?auto_633005 ?auto_633008 ) ) ( not ( = ?auto_633005 ?auto_633009 ) ) ( not ( = ?auto_633005 ?auto_633010 ) ) ( not ( = ?auto_633005 ?auto_633011 ) ) ( not ( = ?auto_633005 ?auto_633012 ) ) ( not ( = ?auto_633005 ?auto_633013 ) ) ( not ( = ?auto_633005 ?auto_633014 ) ) ( not ( = ?auto_633005 ?auto_633015 ) ) ( not ( = ?auto_633005 ?auto_633016 ) ) ( not ( = ?auto_633005 ?auto_633017 ) ) ( not ( = ?auto_633005 ?auto_633018 ) ) ( not ( = ?auto_633006 ?auto_633007 ) ) ( not ( = ?auto_633006 ?auto_633008 ) ) ( not ( = ?auto_633006 ?auto_633009 ) ) ( not ( = ?auto_633006 ?auto_633010 ) ) ( not ( = ?auto_633006 ?auto_633011 ) ) ( not ( = ?auto_633006 ?auto_633012 ) ) ( not ( = ?auto_633006 ?auto_633013 ) ) ( not ( = ?auto_633006 ?auto_633014 ) ) ( not ( = ?auto_633006 ?auto_633015 ) ) ( not ( = ?auto_633006 ?auto_633016 ) ) ( not ( = ?auto_633006 ?auto_633017 ) ) ( not ( = ?auto_633006 ?auto_633018 ) ) ( not ( = ?auto_633007 ?auto_633008 ) ) ( not ( = ?auto_633007 ?auto_633009 ) ) ( not ( = ?auto_633007 ?auto_633010 ) ) ( not ( = ?auto_633007 ?auto_633011 ) ) ( not ( = ?auto_633007 ?auto_633012 ) ) ( not ( = ?auto_633007 ?auto_633013 ) ) ( not ( = ?auto_633007 ?auto_633014 ) ) ( not ( = ?auto_633007 ?auto_633015 ) ) ( not ( = ?auto_633007 ?auto_633016 ) ) ( not ( = ?auto_633007 ?auto_633017 ) ) ( not ( = ?auto_633007 ?auto_633018 ) ) ( not ( = ?auto_633008 ?auto_633009 ) ) ( not ( = ?auto_633008 ?auto_633010 ) ) ( not ( = ?auto_633008 ?auto_633011 ) ) ( not ( = ?auto_633008 ?auto_633012 ) ) ( not ( = ?auto_633008 ?auto_633013 ) ) ( not ( = ?auto_633008 ?auto_633014 ) ) ( not ( = ?auto_633008 ?auto_633015 ) ) ( not ( = ?auto_633008 ?auto_633016 ) ) ( not ( = ?auto_633008 ?auto_633017 ) ) ( not ( = ?auto_633008 ?auto_633018 ) ) ( not ( = ?auto_633009 ?auto_633010 ) ) ( not ( = ?auto_633009 ?auto_633011 ) ) ( not ( = ?auto_633009 ?auto_633012 ) ) ( not ( = ?auto_633009 ?auto_633013 ) ) ( not ( = ?auto_633009 ?auto_633014 ) ) ( not ( = ?auto_633009 ?auto_633015 ) ) ( not ( = ?auto_633009 ?auto_633016 ) ) ( not ( = ?auto_633009 ?auto_633017 ) ) ( not ( = ?auto_633009 ?auto_633018 ) ) ( not ( = ?auto_633010 ?auto_633011 ) ) ( not ( = ?auto_633010 ?auto_633012 ) ) ( not ( = ?auto_633010 ?auto_633013 ) ) ( not ( = ?auto_633010 ?auto_633014 ) ) ( not ( = ?auto_633010 ?auto_633015 ) ) ( not ( = ?auto_633010 ?auto_633016 ) ) ( not ( = ?auto_633010 ?auto_633017 ) ) ( not ( = ?auto_633010 ?auto_633018 ) ) ( not ( = ?auto_633011 ?auto_633012 ) ) ( not ( = ?auto_633011 ?auto_633013 ) ) ( not ( = ?auto_633011 ?auto_633014 ) ) ( not ( = ?auto_633011 ?auto_633015 ) ) ( not ( = ?auto_633011 ?auto_633016 ) ) ( not ( = ?auto_633011 ?auto_633017 ) ) ( not ( = ?auto_633011 ?auto_633018 ) ) ( not ( = ?auto_633012 ?auto_633013 ) ) ( not ( = ?auto_633012 ?auto_633014 ) ) ( not ( = ?auto_633012 ?auto_633015 ) ) ( not ( = ?auto_633012 ?auto_633016 ) ) ( not ( = ?auto_633012 ?auto_633017 ) ) ( not ( = ?auto_633012 ?auto_633018 ) ) ( not ( = ?auto_633013 ?auto_633014 ) ) ( not ( = ?auto_633013 ?auto_633015 ) ) ( not ( = ?auto_633013 ?auto_633016 ) ) ( not ( = ?auto_633013 ?auto_633017 ) ) ( not ( = ?auto_633013 ?auto_633018 ) ) ( not ( = ?auto_633014 ?auto_633015 ) ) ( not ( = ?auto_633014 ?auto_633016 ) ) ( not ( = ?auto_633014 ?auto_633017 ) ) ( not ( = ?auto_633014 ?auto_633018 ) ) ( not ( = ?auto_633015 ?auto_633016 ) ) ( not ( = ?auto_633015 ?auto_633017 ) ) ( not ( = ?auto_633015 ?auto_633018 ) ) ( not ( = ?auto_633016 ?auto_633017 ) ) ( not ( = ?auto_633016 ?auto_633018 ) ) ( not ( = ?auto_633017 ?auto_633018 ) ) ( CLEAR ?auto_633015 ) ( ON ?auto_633016 ?auto_633017 ) ( CLEAR ?auto_633016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_633002 ?auto_633003 ?auto_633004 ?auto_633005 ?auto_633006 ?auto_633007 ?auto_633008 ?auto_633009 ?auto_633010 ?auto_633011 ?auto_633012 ?auto_633013 ?auto_633014 ?auto_633015 ?auto_633016 )
      ( MAKE-16PILE ?auto_633002 ?auto_633003 ?auto_633004 ?auto_633005 ?auto_633006 ?auto_633007 ?auto_633008 ?auto_633009 ?auto_633010 ?auto_633011 ?auto_633012 ?auto_633013 ?auto_633014 ?auto_633015 ?auto_633016 ?auto_633017 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633068 - BLOCK
      ?auto_633069 - BLOCK
      ?auto_633070 - BLOCK
      ?auto_633071 - BLOCK
      ?auto_633072 - BLOCK
      ?auto_633073 - BLOCK
      ?auto_633074 - BLOCK
      ?auto_633075 - BLOCK
      ?auto_633076 - BLOCK
      ?auto_633077 - BLOCK
      ?auto_633078 - BLOCK
      ?auto_633079 - BLOCK
      ?auto_633080 - BLOCK
      ?auto_633081 - BLOCK
      ?auto_633082 - BLOCK
      ?auto_633083 - BLOCK
    )
    :vars
    (
      ?auto_633084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633083 ?auto_633084 ) ( ON-TABLE ?auto_633068 ) ( ON ?auto_633069 ?auto_633068 ) ( ON ?auto_633070 ?auto_633069 ) ( ON ?auto_633071 ?auto_633070 ) ( ON ?auto_633072 ?auto_633071 ) ( ON ?auto_633073 ?auto_633072 ) ( ON ?auto_633074 ?auto_633073 ) ( ON ?auto_633075 ?auto_633074 ) ( ON ?auto_633076 ?auto_633075 ) ( ON ?auto_633077 ?auto_633076 ) ( ON ?auto_633078 ?auto_633077 ) ( ON ?auto_633079 ?auto_633078 ) ( ON ?auto_633080 ?auto_633079 ) ( not ( = ?auto_633068 ?auto_633069 ) ) ( not ( = ?auto_633068 ?auto_633070 ) ) ( not ( = ?auto_633068 ?auto_633071 ) ) ( not ( = ?auto_633068 ?auto_633072 ) ) ( not ( = ?auto_633068 ?auto_633073 ) ) ( not ( = ?auto_633068 ?auto_633074 ) ) ( not ( = ?auto_633068 ?auto_633075 ) ) ( not ( = ?auto_633068 ?auto_633076 ) ) ( not ( = ?auto_633068 ?auto_633077 ) ) ( not ( = ?auto_633068 ?auto_633078 ) ) ( not ( = ?auto_633068 ?auto_633079 ) ) ( not ( = ?auto_633068 ?auto_633080 ) ) ( not ( = ?auto_633068 ?auto_633081 ) ) ( not ( = ?auto_633068 ?auto_633082 ) ) ( not ( = ?auto_633068 ?auto_633083 ) ) ( not ( = ?auto_633068 ?auto_633084 ) ) ( not ( = ?auto_633069 ?auto_633070 ) ) ( not ( = ?auto_633069 ?auto_633071 ) ) ( not ( = ?auto_633069 ?auto_633072 ) ) ( not ( = ?auto_633069 ?auto_633073 ) ) ( not ( = ?auto_633069 ?auto_633074 ) ) ( not ( = ?auto_633069 ?auto_633075 ) ) ( not ( = ?auto_633069 ?auto_633076 ) ) ( not ( = ?auto_633069 ?auto_633077 ) ) ( not ( = ?auto_633069 ?auto_633078 ) ) ( not ( = ?auto_633069 ?auto_633079 ) ) ( not ( = ?auto_633069 ?auto_633080 ) ) ( not ( = ?auto_633069 ?auto_633081 ) ) ( not ( = ?auto_633069 ?auto_633082 ) ) ( not ( = ?auto_633069 ?auto_633083 ) ) ( not ( = ?auto_633069 ?auto_633084 ) ) ( not ( = ?auto_633070 ?auto_633071 ) ) ( not ( = ?auto_633070 ?auto_633072 ) ) ( not ( = ?auto_633070 ?auto_633073 ) ) ( not ( = ?auto_633070 ?auto_633074 ) ) ( not ( = ?auto_633070 ?auto_633075 ) ) ( not ( = ?auto_633070 ?auto_633076 ) ) ( not ( = ?auto_633070 ?auto_633077 ) ) ( not ( = ?auto_633070 ?auto_633078 ) ) ( not ( = ?auto_633070 ?auto_633079 ) ) ( not ( = ?auto_633070 ?auto_633080 ) ) ( not ( = ?auto_633070 ?auto_633081 ) ) ( not ( = ?auto_633070 ?auto_633082 ) ) ( not ( = ?auto_633070 ?auto_633083 ) ) ( not ( = ?auto_633070 ?auto_633084 ) ) ( not ( = ?auto_633071 ?auto_633072 ) ) ( not ( = ?auto_633071 ?auto_633073 ) ) ( not ( = ?auto_633071 ?auto_633074 ) ) ( not ( = ?auto_633071 ?auto_633075 ) ) ( not ( = ?auto_633071 ?auto_633076 ) ) ( not ( = ?auto_633071 ?auto_633077 ) ) ( not ( = ?auto_633071 ?auto_633078 ) ) ( not ( = ?auto_633071 ?auto_633079 ) ) ( not ( = ?auto_633071 ?auto_633080 ) ) ( not ( = ?auto_633071 ?auto_633081 ) ) ( not ( = ?auto_633071 ?auto_633082 ) ) ( not ( = ?auto_633071 ?auto_633083 ) ) ( not ( = ?auto_633071 ?auto_633084 ) ) ( not ( = ?auto_633072 ?auto_633073 ) ) ( not ( = ?auto_633072 ?auto_633074 ) ) ( not ( = ?auto_633072 ?auto_633075 ) ) ( not ( = ?auto_633072 ?auto_633076 ) ) ( not ( = ?auto_633072 ?auto_633077 ) ) ( not ( = ?auto_633072 ?auto_633078 ) ) ( not ( = ?auto_633072 ?auto_633079 ) ) ( not ( = ?auto_633072 ?auto_633080 ) ) ( not ( = ?auto_633072 ?auto_633081 ) ) ( not ( = ?auto_633072 ?auto_633082 ) ) ( not ( = ?auto_633072 ?auto_633083 ) ) ( not ( = ?auto_633072 ?auto_633084 ) ) ( not ( = ?auto_633073 ?auto_633074 ) ) ( not ( = ?auto_633073 ?auto_633075 ) ) ( not ( = ?auto_633073 ?auto_633076 ) ) ( not ( = ?auto_633073 ?auto_633077 ) ) ( not ( = ?auto_633073 ?auto_633078 ) ) ( not ( = ?auto_633073 ?auto_633079 ) ) ( not ( = ?auto_633073 ?auto_633080 ) ) ( not ( = ?auto_633073 ?auto_633081 ) ) ( not ( = ?auto_633073 ?auto_633082 ) ) ( not ( = ?auto_633073 ?auto_633083 ) ) ( not ( = ?auto_633073 ?auto_633084 ) ) ( not ( = ?auto_633074 ?auto_633075 ) ) ( not ( = ?auto_633074 ?auto_633076 ) ) ( not ( = ?auto_633074 ?auto_633077 ) ) ( not ( = ?auto_633074 ?auto_633078 ) ) ( not ( = ?auto_633074 ?auto_633079 ) ) ( not ( = ?auto_633074 ?auto_633080 ) ) ( not ( = ?auto_633074 ?auto_633081 ) ) ( not ( = ?auto_633074 ?auto_633082 ) ) ( not ( = ?auto_633074 ?auto_633083 ) ) ( not ( = ?auto_633074 ?auto_633084 ) ) ( not ( = ?auto_633075 ?auto_633076 ) ) ( not ( = ?auto_633075 ?auto_633077 ) ) ( not ( = ?auto_633075 ?auto_633078 ) ) ( not ( = ?auto_633075 ?auto_633079 ) ) ( not ( = ?auto_633075 ?auto_633080 ) ) ( not ( = ?auto_633075 ?auto_633081 ) ) ( not ( = ?auto_633075 ?auto_633082 ) ) ( not ( = ?auto_633075 ?auto_633083 ) ) ( not ( = ?auto_633075 ?auto_633084 ) ) ( not ( = ?auto_633076 ?auto_633077 ) ) ( not ( = ?auto_633076 ?auto_633078 ) ) ( not ( = ?auto_633076 ?auto_633079 ) ) ( not ( = ?auto_633076 ?auto_633080 ) ) ( not ( = ?auto_633076 ?auto_633081 ) ) ( not ( = ?auto_633076 ?auto_633082 ) ) ( not ( = ?auto_633076 ?auto_633083 ) ) ( not ( = ?auto_633076 ?auto_633084 ) ) ( not ( = ?auto_633077 ?auto_633078 ) ) ( not ( = ?auto_633077 ?auto_633079 ) ) ( not ( = ?auto_633077 ?auto_633080 ) ) ( not ( = ?auto_633077 ?auto_633081 ) ) ( not ( = ?auto_633077 ?auto_633082 ) ) ( not ( = ?auto_633077 ?auto_633083 ) ) ( not ( = ?auto_633077 ?auto_633084 ) ) ( not ( = ?auto_633078 ?auto_633079 ) ) ( not ( = ?auto_633078 ?auto_633080 ) ) ( not ( = ?auto_633078 ?auto_633081 ) ) ( not ( = ?auto_633078 ?auto_633082 ) ) ( not ( = ?auto_633078 ?auto_633083 ) ) ( not ( = ?auto_633078 ?auto_633084 ) ) ( not ( = ?auto_633079 ?auto_633080 ) ) ( not ( = ?auto_633079 ?auto_633081 ) ) ( not ( = ?auto_633079 ?auto_633082 ) ) ( not ( = ?auto_633079 ?auto_633083 ) ) ( not ( = ?auto_633079 ?auto_633084 ) ) ( not ( = ?auto_633080 ?auto_633081 ) ) ( not ( = ?auto_633080 ?auto_633082 ) ) ( not ( = ?auto_633080 ?auto_633083 ) ) ( not ( = ?auto_633080 ?auto_633084 ) ) ( not ( = ?auto_633081 ?auto_633082 ) ) ( not ( = ?auto_633081 ?auto_633083 ) ) ( not ( = ?auto_633081 ?auto_633084 ) ) ( not ( = ?auto_633082 ?auto_633083 ) ) ( not ( = ?auto_633082 ?auto_633084 ) ) ( not ( = ?auto_633083 ?auto_633084 ) ) ( ON ?auto_633082 ?auto_633083 ) ( CLEAR ?auto_633080 ) ( ON ?auto_633081 ?auto_633082 ) ( CLEAR ?auto_633081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_633068 ?auto_633069 ?auto_633070 ?auto_633071 ?auto_633072 ?auto_633073 ?auto_633074 ?auto_633075 ?auto_633076 ?auto_633077 ?auto_633078 ?auto_633079 ?auto_633080 ?auto_633081 )
      ( MAKE-16PILE ?auto_633068 ?auto_633069 ?auto_633070 ?auto_633071 ?auto_633072 ?auto_633073 ?auto_633074 ?auto_633075 ?auto_633076 ?auto_633077 ?auto_633078 ?auto_633079 ?auto_633080 ?auto_633081 ?auto_633082 ?auto_633083 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633134 - BLOCK
      ?auto_633135 - BLOCK
      ?auto_633136 - BLOCK
      ?auto_633137 - BLOCK
      ?auto_633138 - BLOCK
      ?auto_633139 - BLOCK
      ?auto_633140 - BLOCK
      ?auto_633141 - BLOCK
      ?auto_633142 - BLOCK
      ?auto_633143 - BLOCK
      ?auto_633144 - BLOCK
      ?auto_633145 - BLOCK
      ?auto_633146 - BLOCK
      ?auto_633147 - BLOCK
      ?auto_633148 - BLOCK
      ?auto_633149 - BLOCK
    )
    :vars
    (
      ?auto_633150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633149 ?auto_633150 ) ( ON-TABLE ?auto_633134 ) ( ON ?auto_633135 ?auto_633134 ) ( ON ?auto_633136 ?auto_633135 ) ( ON ?auto_633137 ?auto_633136 ) ( ON ?auto_633138 ?auto_633137 ) ( ON ?auto_633139 ?auto_633138 ) ( ON ?auto_633140 ?auto_633139 ) ( ON ?auto_633141 ?auto_633140 ) ( ON ?auto_633142 ?auto_633141 ) ( ON ?auto_633143 ?auto_633142 ) ( ON ?auto_633144 ?auto_633143 ) ( ON ?auto_633145 ?auto_633144 ) ( not ( = ?auto_633134 ?auto_633135 ) ) ( not ( = ?auto_633134 ?auto_633136 ) ) ( not ( = ?auto_633134 ?auto_633137 ) ) ( not ( = ?auto_633134 ?auto_633138 ) ) ( not ( = ?auto_633134 ?auto_633139 ) ) ( not ( = ?auto_633134 ?auto_633140 ) ) ( not ( = ?auto_633134 ?auto_633141 ) ) ( not ( = ?auto_633134 ?auto_633142 ) ) ( not ( = ?auto_633134 ?auto_633143 ) ) ( not ( = ?auto_633134 ?auto_633144 ) ) ( not ( = ?auto_633134 ?auto_633145 ) ) ( not ( = ?auto_633134 ?auto_633146 ) ) ( not ( = ?auto_633134 ?auto_633147 ) ) ( not ( = ?auto_633134 ?auto_633148 ) ) ( not ( = ?auto_633134 ?auto_633149 ) ) ( not ( = ?auto_633134 ?auto_633150 ) ) ( not ( = ?auto_633135 ?auto_633136 ) ) ( not ( = ?auto_633135 ?auto_633137 ) ) ( not ( = ?auto_633135 ?auto_633138 ) ) ( not ( = ?auto_633135 ?auto_633139 ) ) ( not ( = ?auto_633135 ?auto_633140 ) ) ( not ( = ?auto_633135 ?auto_633141 ) ) ( not ( = ?auto_633135 ?auto_633142 ) ) ( not ( = ?auto_633135 ?auto_633143 ) ) ( not ( = ?auto_633135 ?auto_633144 ) ) ( not ( = ?auto_633135 ?auto_633145 ) ) ( not ( = ?auto_633135 ?auto_633146 ) ) ( not ( = ?auto_633135 ?auto_633147 ) ) ( not ( = ?auto_633135 ?auto_633148 ) ) ( not ( = ?auto_633135 ?auto_633149 ) ) ( not ( = ?auto_633135 ?auto_633150 ) ) ( not ( = ?auto_633136 ?auto_633137 ) ) ( not ( = ?auto_633136 ?auto_633138 ) ) ( not ( = ?auto_633136 ?auto_633139 ) ) ( not ( = ?auto_633136 ?auto_633140 ) ) ( not ( = ?auto_633136 ?auto_633141 ) ) ( not ( = ?auto_633136 ?auto_633142 ) ) ( not ( = ?auto_633136 ?auto_633143 ) ) ( not ( = ?auto_633136 ?auto_633144 ) ) ( not ( = ?auto_633136 ?auto_633145 ) ) ( not ( = ?auto_633136 ?auto_633146 ) ) ( not ( = ?auto_633136 ?auto_633147 ) ) ( not ( = ?auto_633136 ?auto_633148 ) ) ( not ( = ?auto_633136 ?auto_633149 ) ) ( not ( = ?auto_633136 ?auto_633150 ) ) ( not ( = ?auto_633137 ?auto_633138 ) ) ( not ( = ?auto_633137 ?auto_633139 ) ) ( not ( = ?auto_633137 ?auto_633140 ) ) ( not ( = ?auto_633137 ?auto_633141 ) ) ( not ( = ?auto_633137 ?auto_633142 ) ) ( not ( = ?auto_633137 ?auto_633143 ) ) ( not ( = ?auto_633137 ?auto_633144 ) ) ( not ( = ?auto_633137 ?auto_633145 ) ) ( not ( = ?auto_633137 ?auto_633146 ) ) ( not ( = ?auto_633137 ?auto_633147 ) ) ( not ( = ?auto_633137 ?auto_633148 ) ) ( not ( = ?auto_633137 ?auto_633149 ) ) ( not ( = ?auto_633137 ?auto_633150 ) ) ( not ( = ?auto_633138 ?auto_633139 ) ) ( not ( = ?auto_633138 ?auto_633140 ) ) ( not ( = ?auto_633138 ?auto_633141 ) ) ( not ( = ?auto_633138 ?auto_633142 ) ) ( not ( = ?auto_633138 ?auto_633143 ) ) ( not ( = ?auto_633138 ?auto_633144 ) ) ( not ( = ?auto_633138 ?auto_633145 ) ) ( not ( = ?auto_633138 ?auto_633146 ) ) ( not ( = ?auto_633138 ?auto_633147 ) ) ( not ( = ?auto_633138 ?auto_633148 ) ) ( not ( = ?auto_633138 ?auto_633149 ) ) ( not ( = ?auto_633138 ?auto_633150 ) ) ( not ( = ?auto_633139 ?auto_633140 ) ) ( not ( = ?auto_633139 ?auto_633141 ) ) ( not ( = ?auto_633139 ?auto_633142 ) ) ( not ( = ?auto_633139 ?auto_633143 ) ) ( not ( = ?auto_633139 ?auto_633144 ) ) ( not ( = ?auto_633139 ?auto_633145 ) ) ( not ( = ?auto_633139 ?auto_633146 ) ) ( not ( = ?auto_633139 ?auto_633147 ) ) ( not ( = ?auto_633139 ?auto_633148 ) ) ( not ( = ?auto_633139 ?auto_633149 ) ) ( not ( = ?auto_633139 ?auto_633150 ) ) ( not ( = ?auto_633140 ?auto_633141 ) ) ( not ( = ?auto_633140 ?auto_633142 ) ) ( not ( = ?auto_633140 ?auto_633143 ) ) ( not ( = ?auto_633140 ?auto_633144 ) ) ( not ( = ?auto_633140 ?auto_633145 ) ) ( not ( = ?auto_633140 ?auto_633146 ) ) ( not ( = ?auto_633140 ?auto_633147 ) ) ( not ( = ?auto_633140 ?auto_633148 ) ) ( not ( = ?auto_633140 ?auto_633149 ) ) ( not ( = ?auto_633140 ?auto_633150 ) ) ( not ( = ?auto_633141 ?auto_633142 ) ) ( not ( = ?auto_633141 ?auto_633143 ) ) ( not ( = ?auto_633141 ?auto_633144 ) ) ( not ( = ?auto_633141 ?auto_633145 ) ) ( not ( = ?auto_633141 ?auto_633146 ) ) ( not ( = ?auto_633141 ?auto_633147 ) ) ( not ( = ?auto_633141 ?auto_633148 ) ) ( not ( = ?auto_633141 ?auto_633149 ) ) ( not ( = ?auto_633141 ?auto_633150 ) ) ( not ( = ?auto_633142 ?auto_633143 ) ) ( not ( = ?auto_633142 ?auto_633144 ) ) ( not ( = ?auto_633142 ?auto_633145 ) ) ( not ( = ?auto_633142 ?auto_633146 ) ) ( not ( = ?auto_633142 ?auto_633147 ) ) ( not ( = ?auto_633142 ?auto_633148 ) ) ( not ( = ?auto_633142 ?auto_633149 ) ) ( not ( = ?auto_633142 ?auto_633150 ) ) ( not ( = ?auto_633143 ?auto_633144 ) ) ( not ( = ?auto_633143 ?auto_633145 ) ) ( not ( = ?auto_633143 ?auto_633146 ) ) ( not ( = ?auto_633143 ?auto_633147 ) ) ( not ( = ?auto_633143 ?auto_633148 ) ) ( not ( = ?auto_633143 ?auto_633149 ) ) ( not ( = ?auto_633143 ?auto_633150 ) ) ( not ( = ?auto_633144 ?auto_633145 ) ) ( not ( = ?auto_633144 ?auto_633146 ) ) ( not ( = ?auto_633144 ?auto_633147 ) ) ( not ( = ?auto_633144 ?auto_633148 ) ) ( not ( = ?auto_633144 ?auto_633149 ) ) ( not ( = ?auto_633144 ?auto_633150 ) ) ( not ( = ?auto_633145 ?auto_633146 ) ) ( not ( = ?auto_633145 ?auto_633147 ) ) ( not ( = ?auto_633145 ?auto_633148 ) ) ( not ( = ?auto_633145 ?auto_633149 ) ) ( not ( = ?auto_633145 ?auto_633150 ) ) ( not ( = ?auto_633146 ?auto_633147 ) ) ( not ( = ?auto_633146 ?auto_633148 ) ) ( not ( = ?auto_633146 ?auto_633149 ) ) ( not ( = ?auto_633146 ?auto_633150 ) ) ( not ( = ?auto_633147 ?auto_633148 ) ) ( not ( = ?auto_633147 ?auto_633149 ) ) ( not ( = ?auto_633147 ?auto_633150 ) ) ( not ( = ?auto_633148 ?auto_633149 ) ) ( not ( = ?auto_633148 ?auto_633150 ) ) ( not ( = ?auto_633149 ?auto_633150 ) ) ( ON ?auto_633148 ?auto_633149 ) ( ON ?auto_633147 ?auto_633148 ) ( CLEAR ?auto_633145 ) ( ON ?auto_633146 ?auto_633147 ) ( CLEAR ?auto_633146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_633134 ?auto_633135 ?auto_633136 ?auto_633137 ?auto_633138 ?auto_633139 ?auto_633140 ?auto_633141 ?auto_633142 ?auto_633143 ?auto_633144 ?auto_633145 ?auto_633146 )
      ( MAKE-16PILE ?auto_633134 ?auto_633135 ?auto_633136 ?auto_633137 ?auto_633138 ?auto_633139 ?auto_633140 ?auto_633141 ?auto_633142 ?auto_633143 ?auto_633144 ?auto_633145 ?auto_633146 ?auto_633147 ?auto_633148 ?auto_633149 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633200 - BLOCK
      ?auto_633201 - BLOCK
      ?auto_633202 - BLOCK
      ?auto_633203 - BLOCK
      ?auto_633204 - BLOCK
      ?auto_633205 - BLOCK
      ?auto_633206 - BLOCK
      ?auto_633207 - BLOCK
      ?auto_633208 - BLOCK
      ?auto_633209 - BLOCK
      ?auto_633210 - BLOCK
      ?auto_633211 - BLOCK
      ?auto_633212 - BLOCK
      ?auto_633213 - BLOCK
      ?auto_633214 - BLOCK
      ?auto_633215 - BLOCK
    )
    :vars
    (
      ?auto_633216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633215 ?auto_633216 ) ( ON-TABLE ?auto_633200 ) ( ON ?auto_633201 ?auto_633200 ) ( ON ?auto_633202 ?auto_633201 ) ( ON ?auto_633203 ?auto_633202 ) ( ON ?auto_633204 ?auto_633203 ) ( ON ?auto_633205 ?auto_633204 ) ( ON ?auto_633206 ?auto_633205 ) ( ON ?auto_633207 ?auto_633206 ) ( ON ?auto_633208 ?auto_633207 ) ( ON ?auto_633209 ?auto_633208 ) ( ON ?auto_633210 ?auto_633209 ) ( not ( = ?auto_633200 ?auto_633201 ) ) ( not ( = ?auto_633200 ?auto_633202 ) ) ( not ( = ?auto_633200 ?auto_633203 ) ) ( not ( = ?auto_633200 ?auto_633204 ) ) ( not ( = ?auto_633200 ?auto_633205 ) ) ( not ( = ?auto_633200 ?auto_633206 ) ) ( not ( = ?auto_633200 ?auto_633207 ) ) ( not ( = ?auto_633200 ?auto_633208 ) ) ( not ( = ?auto_633200 ?auto_633209 ) ) ( not ( = ?auto_633200 ?auto_633210 ) ) ( not ( = ?auto_633200 ?auto_633211 ) ) ( not ( = ?auto_633200 ?auto_633212 ) ) ( not ( = ?auto_633200 ?auto_633213 ) ) ( not ( = ?auto_633200 ?auto_633214 ) ) ( not ( = ?auto_633200 ?auto_633215 ) ) ( not ( = ?auto_633200 ?auto_633216 ) ) ( not ( = ?auto_633201 ?auto_633202 ) ) ( not ( = ?auto_633201 ?auto_633203 ) ) ( not ( = ?auto_633201 ?auto_633204 ) ) ( not ( = ?auto_633201 ?auto_633205 ) ) ( not ( = ?auto_633201 ?auto_633206 ) ) ( not ( = ?auto_633201 ?auto_633207 ) ) ( not ( = ?auto_633201 ?auto_633208 ) ) ( not ( = ?auto_633201 ?auto_633209 ) ) ( not ( = ?auto_633201 ?auto_633210 ) ) ( not ( = ?auto_633201 ?auto_633211 ) ) ( not ( = ?auto_633201 ?auto_633212 ) ) ( not ( = ?auto_633201 ?auto_633213 ) ) ( not ( = ?auto_633201 ?auto_633214 ) ) ( not ( = ?auto_633201 ?auto_633215 ) ) ( not ( = ?auto_633201 ?auto_633216 ) ) ( not ( = ?auto_633202 ?auto_633203 ) ) ( not ( = ?auto_633202 ?auto_633204 ) ) ( not ( = ?auto_633202 ?auto_633205 ) ) ( not ( = ?auto_633202 ?auto_633206 ) ) ( not ( = ?auto_633202 ?auto_633207 ) ) ( not ( = ?auto_633202 ?auto_633208 ) ) ( not ( = ?auto_633202 ?auto_633209 ) ) ( not ( = ?auto_633202 ?auto_633210 ) ) ( not ( = ?auto_633202 ?auto_633211 ) ) ( not ( = ?auto_633202 ?auto_633212 ) ) ( not ( = ?auto_633202 ?auto_633213 ) ) ( not ( = ?auto_633202 ?auto_633214 ) ) ( not ( = ?auto_633202 ?auto_633215 ) ) ( not ( = ?auto_633202 ?auto_633216 ) ) ( not ( = ?auto_633203 ?auto_633204 ) ) ( not ( = ?auto_633203 ?auto_633205 ) ) ( not ( = ?auto_633203 ?auto_633206 ) ) ( not ( = ?auto_633203 ?auto_633207 ) ) ( not ( = ?auto_633203 ?auto_633208 ) ) ( not ( = ?auto_633203 ?auto_633209 ) ) ( not ( = ?auto_633203 ?auto_633210 ) ) ( not ( = ?auto_633203 ?auto_633211 ) ) ( not ( = ?auto_633203 ?auto_633212 ) ) ( not ( = ?auto_633203 ?auto_633213 ) ) ( not ( = ?auto_633203 ?auto_633214 ) ) ( not ( = ?auto_633203 ?auto_633215 ) ) ( not ( = ?auto_633203 ?auto_633216 ) ) ( not ( = ?auto_633204 ?auto_633205 ) ) ( not ( = ?auto_633204 ?auto_633206 ) ) ( not ( = ?auto_633204 ?auto_633207 ) ) ( not ( = ?auto_633204 ?auto_633208 ) ) ( not ( = ?auto_633204 ?auto_633209 ) ) ( not ( = ?auto_633204 ?auto_633210 ) ) ( not ( = ?auto_633204 ?auto_633211 ) ) ( not ( = ?auto_633204 ?auto_633212 ) ) ( not ( = ?auto_633204 ?auto_633213 ) ) ( not ( = ?auto_633204 ?auto_633214 ) ) ( not ( = ?auto_633204 ?auto_633215 ) ) ( not ( = ?auto_633204 ?auto_633216 ) ) ( not ( = ?auto_633205 ?auto_633206 ) ) ( not ( = ?auto_633205 ?auto_633207 ) ) ( not ( = ?auto_633205 ?auto_633208 ) ) ( not ( = ?auto_633205 ?auto_633209 ) ) ( not ( = ?auto_633205 ?auto_633210 ) ) ( not ( = ?auto_633205 ?auto_633211 ) ) ( not ( = ?auto_633205 ?auto_633212 ) ) ( not ( = ?auto_633205 ?auto_633213 ) ) ( not ( = ?auto_633205 ?auto_633214 ) ) ( not ( = ?auto_633205 ?auto_633215 ) ) ( not ( = ?auto_633205 ?auto_633216 ) ) ( not ( = ?auto_633206 ?auto_633207 ) ) ( not ( = ?auto_633206 ?auto_633208 ) ) ( not ( = ?auto_633206 ?auto_633209 ) ) ( not ( = ?auto_633206 ?auto_633210 ) ) ( not ( = ?auto_633206 ?auto_633211 ) ) ( not ( = ?auto_633206 ?auto_633212 ) ) ( not ( = ?auto_633206 ?auto_633213 ) ) ( not ( = ?auto_633206 ?auto_633214 ) ) ( not ( = ?auto_633206 ?auto_633215 ) ) ( not ( = ?auto_633206 ?auto_633216 ) ) ( not ( = ?auto_633207 ?auto_633208 ) ) ( not ( = ?auto_633207 ?auto_633209 ) ) ( not ( = ?auto_633207 ?auto_633210 ) ) ( not ( = ?auto_633207 ?auto_633211 ) ) ( not ( = ?auto_633207 ?auto_633212 ) ) ( not ( = ?auto_633207 ?auto_633213 ) ) ( not ( = ?auto_633207 ?auto_633214 ) ) ( not ( = ?auto_633207 ?auto_633215 ) ) ( not ( = ?auto_633207 ?auto_633216 ) ) ( not ( = ?auto_633208 ?auto_633209 ) ) ( not ( = ?auto_633208 ?auto_633210 ) ) ( not ( = ?auto_633208 ?auto_633211 ) ) ( not ( = ?auto_633208 ?auto_633212 ) ) ( not ( = ?auto_633208 ?auto_633213 ) ) ( not ( = ?auto_633208 ?auto_633214 ) ) ( not ( = ?auto_633208 ?auto_633215 ) ) ( not ( = ?auto_633208 ?auto_633216 ) ) ( not ( = ?auto_633209 ?auto_633210 ) ) ( not ( = ?auto_633209 ?auto_633211 ) ) ( not ( = ?auto_633209 ?auto_633212 ) ) ( not ( = ?auto_633209 ?auto_633213 ) ) ( not ( = ?auto_633209 ?auto_633214 ) ) ( not ( = ?auto_633209 ?auto_633215 ) ) ( not ( = ?auto_633209 ?auto_633216 ) ) ( not ( = ?auto_633210 ?auto_633211 ) ) ( not ( = ?auto_633210 ?auto_633212 ) ) ( not ( = ?auto_633210 ?auto_633213 ) ) ( not ( = ?auto_633210 ?auto_633214 ) ) ( not ( = ?auto_633210 ?auto_633215 ) ) ( not ( = ?auto_633210 ?auto_633216 ) ) ( not ( = ?auto_633211 ?auto_633212 ) ) ( not ( = ?auto_633211 ?auto_633213 ) ) ( not ( = ?auto_633211 ?auto_633214 ) ) ( not ( = ?auto_633211 ?auto_633215 ) ) ( not ( = ?auto_633211 ?auto_633216 ) ) ( not ( = ?auto_633212 ?auto_633213 ) ) ( not ( = ?auto_633212 ?auto_633214 ) ) ( not ( = ?auto_633212 ?auto_633215 ) ) ( not ( = ?auto_633212 ?auto_633216 ) ) ( not ( = ?auto_633213 ?auto_633214 ) ) ( not ( = ?auto_633213 ?auto_633215 ) ) ( not ( = ?auto_633213 ?auto_633216 ) ) ( not ( = ?auto_633214 ?auto_633215 ) ) ( not ( = ?auto_633214 ?auto_633216 ) ) ( not ( = ?auto_633215 ?auto_633216 ) ) ( ON ?auto_633214 ?auto_633215 ) ( ON ?auto_633213 ?auto_633214 ) ( ON ?auto_633212 ?auto_633213 ) ( CLEAR ?auto_633210 ) ( ON ?auto_633211 ?auto_633212 ) ( CLEAR ?auto_633211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_633200 ?auto_633201 ?auto_633202 ?auto_633203 ?auto_633204 ?auto_633205 ?auto_633206 ?auto_633207 ?auto_633208 ?auto_633209 ?auto_633210 ?auto_633211 )
      ( MAKE-16PILE ?auto_633200 ?auto_633201 ?auto_633202 ?auto_633203 ?auto_633204 ?auto_633205 ?auto_633206 ?auto_633207 ?auto_633208 ?auto_633209 ?auto_633210 ?auto_633211 ?auto_633212 ?auto_633213 ?auto_633214 ?auto_633215 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633266 - BLOCK
      ?auto_633267 - BLOCK
      ?auto_633268 - BLOCK
      ?auto_633269 - BLOCK
      ?auto_633270 - BLOCK
      ?auto_633271 - BLOCK
      ?auto_633272 - BLOCK
      ?auto_633273 - BLOCK
      ?auto_633274 - BLOCK
      ?auto_633275 - BLOCK
      ?auto_633276 - BLOCK
      ?auto_633277 - BLOCK
      ?auto_633278 - BLOCK
      ?auto_633279 - BLOCK
      ?auto_633280 - BLOCK
      ?auto_633281 - BLOCK
    )
    :vars
    (
      ?auto_633282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633281 ?auto_633282 ) ( ON-TABLE ?auto_633266 ) ( ON ?auto_633267 ?auto_633266 ) ( ON ?auto_633268 ?auto_633267 ) ( ON ?auto_633269 ?auto_633268 ) ( ON ?auto_633270 ?auto_633269 ) ( ON ?auto_633271 ?auto_633270 ) ( ON ?auto_633272 ?auto_633271 ) ( ON ?auto_633273 ?auto_633272 ) ( ON ?auto_633274 ?auto_633273 ) ( ON ?auto_633275 ?auto_633274 ) ( not ( = ?auto_633266 ?auto_633267 ) ) ( not ( = ?auto_633266 ?auto_633268 ) ) ( not ( = ?auto_633266 ?auto_633269 ) ) ( not ( = ?auto_633266 ?auto_633270 ) ) ( not ( = ?auto_633266 ?auto_633271 ) ) ( not ( = ?auto_633266 ?auto_633272 ) ) ( not ( = ?auto_633266 ?auto_633273 ) ) ( not ( = ?auto_633266 ?auto_633274 ) ) ( not ( = ?auto_633266 ?auto_633275 ) ) ( not ( = ?auto_633266 ?auto_633276 ) ) ( not ( = ?auto_633266 ?auto_633277 ) ) ( not ( = ?auto_633266 ?auto_633278 ) ) ( not ( = ?auto_633266 ?auto_633279 ) ) ( not ( = ?auto_633266 ?auto_633280 ) ) ( not ( = ?auto_633266 ?auto_633281 ) ) ( not ( = ?auto_633266 ?auto_633282 ) ) ( not ( = ?auto_633267 ?auto_633268 ) ) ( not ( = ?auto_633267 ?auto_633269 ) ) ( not ( = ?auto_633267 ?auto_633270 ) ) ( not ( = ?auto_633267 ?auto_633271 ) ) ( not ( = ?auto_633267 ?auto_633272 ) ) ( not ( = ?auto_633267 ?auto_633273 ) ) ( not ( = ?auto_633267 ?auto_633274 ) ) ( not ( = ?auto_633267 ?auto_633275 ) ) ( not ( = ?auto_633267 ?auto_633276 ) ) ( not ( = ?auto_633267 ?auto_633277 ) ) ( not ( = ?auto_633267 ?auto_633278 ) ) ( not ( = ?auto_633267 ?auto_633279 ) ) ( not ( = ?auto_633267 ?auto_633280 ) ) ( not ( = ?auto_633267 ?auto_633281 ) ) ( not ( = ?auto_633267 ?auto_633282 ) ) ( not ( = ?auto_633268 ?auto_633269 ) ) ( not ( = ?auto_633268 ?auto_633270 ) ) ( not ( = ?auto_633268 ?auto_633271 ) ) ( not ( = ?auto_633268 ?auto_633272 ) ) ( not ( = ?auto_633268 ?auto_633273 ) ) ( not ( = ?auto_633268 ?auto_633274 ) ) ( not ( = ?auto_633268 ?auto_633275 ) ) ( not ( = ?auto_633268 ?auto_633276 ) ) ( not ( = ?auto_633268 ?auto_633277 ) ) ( not ( = ?auto_633268 ?auto_633278 ) ) ( not ( = ?auto_633268 ?auto_633279 ) ) ( not ( = ?auto_633268 ?auto_633280 ) ) ( not ( = ?auto_633268 ?auto_633281 ) ) ( not ( = ?auto_633268 ?auto_633282 ) ) ( not ( = ?auto_633269 ?auto_633270 ) ) ( not ( = ?auto_633269 ?auto_633271 ) ) ( not ( = ?auto_633269 ?auto_633272 ) ) ( not ( = ?auto_633269 ?auto_633273 ) ) ( not ( = ?auto_633269 ?auto_633274 ) ) ( not ( = ?auto_633269 ?auto_633275 ) ) ( not ( = ?auto_633269 ?auto_633276 ) ) ( not ( = ?auto_633269 ?auto_633277 ) ) ( not ( = ?auto_633269 ?auto_633278 ) ) ( not ( = ?auto_633269 ?auto_633279 ) ) ( not ( = ?auto_633269 ?auto_633280 ) ) ( not ( = ?auto_633269 ?auto_633281 ) ) ( not ( = ?auto_633269 ?auto_633282 ) ) ( not ( = ?auto_633270 ?auto_633271 ) ) ( not ( = ?auto_633270 ?auto_633272 ) ) ( not ( = ?auto_633270 ?auto_633273 ) ) ( not ( = ?auto_633270 ?auto_633274 ) ) ( not ( = ?auto_633270 ?auto_633275 ) ) ( not ( = ?auto_633270 ?auto_633276 ) ) ( not ( = ?auto_633270 ?auto_633277 ) ) ( not ( = ?auto_633270 ?auto_633278 ) ) ( not ( = ?auto_633270 ?auto_633279 ) ) ( not ( = ?auto_633270 ?auto_633280 ) ) ( not ( = ?auto_633270 ?auto_633281 ) ) ( not ( = ?auto_633270 ?auto_633282 ) ) ( not ( = ?auto_633271 ?auto_633272 ) ) ( not ( = ?auto_633271 ?auto_633273 ) ) ( not ( = ?auto_633271 ?auto_633274 ) ) ( not ( = ?auto_633271 ?auto_633275 ) ) ( not ( = ?auto_633271 ?auto_633276 ) ) ( not ( = ?auto_633271 ?auto_633277 ) ) ( not ( = ?auto_633271 ?auto_633278 ) ) ( not ( = ?auto_633271 ?auto_633279 ) ) ( not ( = ?auto_633271 ?auto_633280 ) ) ( not ( = ?auto_633271 ?auto_633281 ) ) ( not ( = ?auto_633271 ?auto_633282 ) ) ( not ( = ?auto_633272 ?auto_633273 ) ) ( not ( = ?auto_633272 ?auto_633274 ) ) ( not ( = ?auto_633272 ?auto_633275 ) ) ( not ( = ?auto_633272 ?auto_633276 ) ) ( not ( = ?auto_633272 ?auto_633277 ) ) ( not ( = ?auto_633272 ?auto_633278 ) ) ( not ( = ?auto_633272 ?auto_633279 ) ) ( not ( = ?auto_633272 ?auto_633280 ) ) ( not ( = ?auto_633272 ?auto_633281 ) ) ( not ( = ?auto_633272 ?auto_633282 ) ) ( not ( = ?auto_633273 ?auto_633274 ) ) ( not ( = ?auto_633273 ?auto_633275 ) ) ( not ( = ?auto_633273 ?auto_633276 ) ) ( not ( = ?auto_633273 ?auto_633277 ) ) ( not ( = ?auto_633273 ?auto_633278 ) ) ( not ( = ?auto_633273 ?auto_633279 ) ) ( not ( = ?auto_633273 ?auto_633280 ) ) ( not ( = ?auto_633273 ?auto_633281 ) ) ( not ( = ?auto_633273 ?auto_633282 ) ) ( not ( = ?auto_633274 ?auto_633275 ) ) ( not ( = ?auto_633274 ?auto_633276 ) ) ( not ( = ?auto_633274 ?auto_633277 ) ) ( not ( = ?auto_633274 ?auto_633278 ) ) ( not ( = ?auto_633274 ?auto_633279 ) ) ( not ( = ?auto_633274 ?auto_633280 ) ) ( not ( = ?auto_633274 ?auto_633281 ) ) ( not ( = ?auto_633274 ?auto_633282 ) ) ( not ( = ?auto_633275 ?auto_633276 ) ) ( not ( = ?auto_633275 ?auto_633277 ) ) ( not ( = ?auto_633275 ?auto_633278 ) ) ( not ( = ?auto_633275 ?auto_633279 ) ) ( not ( = ?auto_633275 ?auto_633280 ) ) ( not ( = ?auto_633275 ?auto_633281 ) ) ( not ( = ?auto_633275 ?auto_633282 ) ) ( not ( = ?auto_633276 ?auto_633277 ) ) ( not ( = ?auto_633276 ?auto_633278 ) ) ( not ( = ?auto_633276 ?auto_633279 ) ) ( not ( = ?auto_633276 ?auto_633280 ) ) ( not ( = ?auto_633276 ?auto_633281 ) ) ( not ( = ?auto_633276 ?auto_633282 ) ) ( not ( = ?auto_633277 ?auto_633278 ) ) ( not ( = ?auto_633277 ?auto_633279 ) ) ( not ( = ?auto_633277 ?auto_633280 ) ) ( not ( = ?auto_633277 ?auto_633281 ) ) ( not ( = ?auto_633277 ?auto_633282 ) ) ( not ( = ?auto_633278 ?auto_633279 ) ) ( not ( = ?auto_633278 ?auto_633280 ) ) ( not ( = ?auto_633278 ?auto_633281 ) ) ( not ( = ?auto_633278 ?auto_633282 ) ) ( not ( = ?auto_633279 ?auto_633280 ) ) ( not ( = ?auto_633279 ?auto_633281 ) ) ( not ( = ?auto_633279 ?auto_633282 ) ) ( not ( = ?auto_633280 ?auto_633281 ) ) ( not ( = ?auto_633280 ?auto_633282 ) ) ( not ( = ?auto_633281 ?auto_633282 ) ) ( ON ?auto_633280 ?auto_633281 ) ( ON ?auto_633279 ?auto_633280 ) ( ON ?auto_633278 ?auto_633279 ) ( ON ?auto_633277 ?auto_633278 ) ( CLEAR ?auto_633275 ) ( ON ?auto_633276 ?auto_633277 ) ( CLEAR ?auto_633276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_633266 ?auto_633267 ?auto_633268 ?auto_633269 ?auto_633270 ?auto_633271 ?auto_633272 ?auto_633273 ?auto_633274 ?auto_633275 ?auto_633276 )
      ( MAKE-16PILE ?auto_633266 ?auto_633267 ?auto_633268 ?auto_633269 ?auto_633270 ?auto_633271 ?auto_633272 ?auto_633273 ?auto_633274 ?auto_633275 ?auto_633276 ?auto_633277 ?auto_633278 ?auto_633279 ?auto_633280 ?auto_633281 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633332 - BLOCK
      ?auto_633333 - BLOCK
      ?auto_633334 - BLOCK
      ?auto_633335 - BLOCK
      ?auto_633336 - BLOCK
      ?auto_633337 - BLOCK
      ?auto_633338 - BLOCK
      ?auto_633339 - BLOCK
      ?auto_633340 - BLOCK
      ?auto_633341 - BLOCK
      ?auto_633342 - BLOCK
      ?auto_633343 - BLOCK
      ?auto_633344 - BLOCK
      ?auto_633345 - BLOCK
      ?auto_633346 - BLOCK
      ?auto_633347 - BLOCK
    )
    :vars
    (
      ?auto_633348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633347 ?auto_633348 ) ( ON-TABLE ?auto_633332 ) ( ON ?auto_633333 ?auto_633332 ) ( ON ?auto_633334 ?auto_633333 ) ( ON ?auto_633335 ?auto_633334 ) ( ON ?auto_633336 ?auto_633335 ) ( ON ?auto_633337 ?auto_633336 ) ( ON ?auto_633338 ?auto_633337 ) ( ON ?auto_633339 ?auto_633338 ) ( ON ?auto_633340 ?auto_633339 ) ( not ( = ?auto_633332 ?auto_633333 ) ) ( not ( = ?auto_633332 ?auto_633334 ) ) ( not ( = ?auto_633332 ?auto_633335 ) ) ( not ( = ?auto_633332 ?auto_633336 ) ) ( not ( = ?auto_633332 ?auto_633337 ) ) ( not ( = ?auto_633332 ?auto_633338 ) ) ( not ( = ?auto_633332 ?auto_633339 ) ) ( not ( = ?auto_633332 ?auto_633340 ) ) ( not ( = ?auto_633332 ?auto_633341 ) ) ( not ( = ?auto_633332 ?auto_633342 ) ) ( not ( = ?auto_633332 ?auto_633343 ) ) ( not ( = ?auto_633332 ?auto_633344 ) ) ( not ( = ?auto_633332 ?auto_633345 ) ) ( not ( = ?auto_633332 ?auto_633346 ) ) ( not ( = ?auto_633332 ?auto_633347 ) ) ( not ( = ?auto_633332 ?auto_633348 ) ) ( not ( = ?auto_633333 ?auto_633334 ) ) ( not ( = ?auto_633333 ?auto_633335 ) ) ( not ( = ?auto_633333 ?auto_633336 ) ) ( not ( = ?auto_633333 ?auto_633337 ) ) ( not ( = ?auto_633333 ?auto_633338 ) ) ( not ( = ?auto_633333 ?auto_633339 ) ) ( not ( = ?auto_633333 ?auto_633340 ) ) ( not ( = ?auto_633333 ?auto_633341 ) ) ( not ( = ?auto_633333 ?auto_633342 ) ) ( not ( = ?auto_633333 ?auto_633343 ) ) ( not ( = ?auto_633333 ?auto_633344 ) ) ( not ( = ?auto_633333 ?auto_633345 ) ) ( not ( = ?auto_633333 ?auto_633346 ) ) ( not ( = ?auto_633333 ?auto_633347 ) ) ( not ( = ?auto_633333 ?auto_633348 ) ) ( not ( = ?auto_633334 ?auto_633335 ) ) ( not ( = ?auto_633334 ?auto_633336 ) ) ( not ( = ?auto_633334 ?auto_633337 ) ) ( not ( = ?auto_633334 ?auto_633338 ) ) ( not ( = ?auto_633334 ?auto_633339 ) ) ( not ( = ?auto_633334 ?auto_633340 ) ) ( not ( = ?auto_633334 ?auto_633341 ) ) ( not ( = ?auto_633334 ?auto_633342 ) ) ( not ( = ?auto_633334 ?auto_633343 ) ) ( not ( = ?auto_633334 ?auto_633344 ) ) ( not ( = ?auto_633334 ?auto_633345 ) ) ( not ( = ?auto_633334 ?auto_633346 ) ) ( not ( = ?auto_633334 ?auto_633347 ) ) ( not ( = ?auto_633334 ?auto_633348 ) ) ( not ( = ?auto_633335 ?auto_633336 ) ) ( not ( = ?auto_633335 ?auto_633337 ) ) ( not ( = ?auto_633335 ?auto_633338 ) ) ( not ( = ?auto_633335 ?auto_633339 ) ) ( not ( = ?auto_633335 ?auto_633340 ) ) ( not ( = ?auto_633335 ?auto_633341 ) ) ( not ( = ?auto_633335 ?auto_633342 ) ) ( not ( = ?auto_633335 ?auto_633343 ) ) ( not ( = ?auto_633335 ?auto_633344 ) ) ( not ( = ?auto_633335 ?auto_633345 ) ) ( not ( = ?auto_633335 ?auto_633346 ) ) ( not ( = ?auto_633335 ?auto_633347 ) ) ( not ( = ?auto_633335 ?auto_633348 ) ) ( not ( = ?auto_633336 ?auto_633337 ) ) ( not ( = ?auto_633336 ?auto_633338 ) ) ( not ( = ?auto_633336 ?auto_633339 ) ) ( not ( = ?auto_633336 ?auto_633340 ) ) ( not ( = ?auto_633336 ?auto_633341 ) ) ( not ( = ?auto_633336 ?auto_633342 ) ) ( not ( = ?auto_633336 ?auto_633343 ) ) ( not ( = ?auto_633336 ?auto_633344 ) ) ( not ( = ?auto_633336 ?auto_633345 ) ) ( not ( = ?auto_633336 ?auto_633346 ) ) ( not ( = ?auto_633336 ?auto_633347 ) ) ( not ( = ?auto_633336 ?auto_633348 ) ) ( not ( = ?auto_633337 ?auto_633338 ) ) ( not ( = ?auto_633337 ?auto_633339 ) ) ( not ( = ?auto_633337 ?auto_633340 ) ) ( not ( = ?auto_633337 ?auto_633341 ) ) ( not ( = ?auto_633337 ?auto_633342 ) ) ( not ( = ?auto_633337 ?auto_633343 ) ) ( not ( = ?auto_633337 ?auto_633344 ) ) ( not ( = ?auto_633337 ?auto_633345 ) ) ( not ( = ?auto_633337 ?auto_633346 ) ) ( not ( = ?auto_633337 ?auto_633347 ) ) ( not ( = ?auto_633337 ?auto_633348 ) ) ( not ( = ?auto_633338 ?auto_633339 ) ) ( not ( = ?auto_633338 ?auto_633340 ) ) ( not ( = ?auto_633338 ?auto_633341 ) ) ( not ( = ?auto_633338 ?auto_633342 ) ) ( not ( = ?auto_633338 ?auto_633343 ) ) ( not ( = ?auto_633338 ?auto_633344 ) ) ( not ( = ?auto_633338 ?auto_633345 ) ) ( not ( = ?auto_633338 ?auto_633346 ) ) ( not ( = ?auto_633338 ?auto_633347 ) ) ( not ( = ?auto_633338 ?auto_633348 ) ) ( not ( = ?auto_633339 ?auto_633340 ) ) ( not ( = ?auto_633339 ?auto_633341 ) ) ( not ( = ?auto_633339 ?auto_633342 ) ) ( not ( = ?auto_633339 ?auto_633343 ) ) ( not ( = ?auto_633339 ?auto_633344 ) ) ( not ( = ?auto_633339 ?auto_633345 ) ) ( not ( = ?auto_633339 ?auto_633346 ) ) ( not ( = ?auto_633339 ?auto_633347 ) ) ( not ( = ?auto_633339 ?auto_633348 ) ) ( not ( = ?auto_633340 ?auto_633341 ) ) ( not ( = ?auto_633340 ?auto_633342 ) ) ( not ( = ?auto_633340 ?auto_633343 ) ) ( not ( = ?auto_633340 ?auto_633344 ) ) ( not ( = ?auto_633340 ?auto_633345 ) ) ( not ( = ?auto_633340 ?auto_633346 ) ) ( not ( = ?auto_633340 ?auto_633347 ) ) ( not ( = ?auto_633340 ?auto_633348 ) ) ( not ( = ?auto_633341 ?auto_633342 ) ) ( not ( = ?auto_633341 ?auto_633343 ) ) ( not ( = ?auto_633341 ?auto_633344 ) ) ( not ( = ?auto_633341 ?auto_633345 ) ) ( not ( = ?auto_633341 ?auto_633346 ) ) ( not ( = ?auto_633341 ?auto_633347 ) ) ( not ( = ?auto_633341 ?auto_633348 ) ) ( not ( = ?auto_633342 ?auto_633343 ) ) ( not ( = ?auto_633342 ?auto_633344 ) ) ( not ( = ?auto_633342 ?auto_633345 ) ) ( not ( = ?auto_633342 ?auto_633346 ) ) ( not ( = ?auto_633342 ?auto_633347 ) ) ( not ( = ?auto_633342 ?auto_633348 ) ) ( not ( = ?auto_633343 ?auto_633344 ) ) ( not ( = ?auto_633343 ?auto_633345 ) ) ( not ( = ?auto_633343 ?auto_633346 ) ) ( not ( = ?auto_633343 ?auto_633347 ) ) ( not ( = ?auto_633343 ?auto_633348 ) ) ( not ( = ?auto_633344 ?auto_633345 ) ) ( not ( = ?auto_633344 ?auto_633346 ) ) ( not ( = ?auto_633344 ?auto_633347 ) ) ( not ( = ?auto_633344 ?auto_633348 ) ) ( not ( = ?auto_633345 ?auto_633346 ) ) ( not ( = ?auto_633345 ?auto_633347 ) ) ( not ( = ?auto_633345 ?auto_633348 ) ) ( not ( = ?auto_633346 ?auto_633347 ) ) ( not ( = ?auto_633346 ?auto_633348 ) ) ( not ( = ?auto_633347 ?auto_633348 ) ) ( ON ?auto_633346 ?auto_633347 ) ( ON ?auto_633345 ?auto_633346 ) ( ON ?auto_633344 ?auto_633345 ) ( ON ?auto_633343 ?auto_633344 ) ( ON ?auto_633342 ?auto_633343 ) ( CLEAR ?auto_633340 ) ( ON ?auto_633341 ?auto_633342 ) ( CLEAR ?auto_633341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_633332 ?auto_633333 ?auto_633334 ?auto_633335 ?auto_633336 ?auto_633337 ?auto_633338 ?auto_633339 ?auto_633340 ?auto_633341 )
      ( MAKE-16PILE ?auto_633332 ?auto_633333 ?auto_633334 ?auto_633335 ?auto_633336 ?auto_633337 ?auto_633338 ?auto_633339 ?auto_633340 ?auto_633341 ?auto_633342 ?auto_633343 ?auto_633344 ?auto_633345 ?auto_633346 ?auto_633347 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633398 - BLOCK
      ?auto_633399 - BLOCK
      ?auto_633400 - BLOCK
      ?auto_633401 - BLOCK
      ?auto_633402 - BLOCK
      ?auto_633403 - BLOCK
      ?auto_633404 - BLOCK
      ?auto_633405 - BLOCK
      ?auto_633406 - BLOCK
      ?auto_633407 - BLOCK
      ?auto_633408 - BLOCK
      ?auto_633409 - BLOCK
      ?auto_633410 - BLOCK
      ?auto_633411 - BLOCK
      ?auto_633412 - BLOCK
      ?auto_633413 - BLOCK
    )
    :vars
    (
      ?auto_633414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633413 ?auto_633414 ) ( ON-TABLE ?auto_633398 ) ( ON ?auto_633399 ?auto_633398 ) ( ON ?auto_633400 ?auto_633399 ) ( ON ?auto_633401 ?auto_633400 ) ( ON ?auto_633402 ?auto_633401 ) ( ON ?auto_633403 ?auto_633402 ) ( ON ?auto_633404 ?auto_633403 ) ( ON ?auto_633405 ?auto_633404 ) ( not ( = ?auto_633398 ?auto_633399 ) ) ( not ( = ?auto_633398 ?auto_633400 ) ) ( not ( = ?auto_633398 ?auto_633401 ) ) ( not ( = ?auto_633398 ?auto_633402 ) ) ( not ( = ?auto_633398 ?auto_633403 ) ) ( not ( = ?auto_633398 ?auto_633404 ) ) ( not ( = ?auto_633398 ?auto_633405 ) ) ( not ( = ?auto_633398 ?auto_633406 ) ) ( not ( = ?auto_633398 ?auto_633407 ) ) ( not ( = ?auto_633398 ?auto_633408 ) ) ( not ( = ?auto_633398 ?auto_633409 ) ) ( not ( = ?auto_633398 ?auto_633410 ) ) ( not ( = ?auto_633398 ?auto_633411 ) ) ( not ( = ?auto_633398 ?auto_633412 ) ) ( not ( = ?auto_633398 ?auto_633413 ) ) ( not ( = ?auto_633398 ?auto_633414 ) ) ( not ( = ?auto_633399 ?auto_633400 ) ) ( not ( = ?auto_633399 ?auto_633401 ) ) ( not ( = ?auto_633399 ?auto_633402 ) ) ( not ( = ?auto_633399 ?auto_633403 ) ) ( not ( = ?auto_633399 ?auto_633404 ) ) ( not ( = ?auto_633399 ?auto_633405 ) ) ( not ( = ?auto_633399 ?auto_633406 ) ) ( not ( = ?auto_633399 ?auto_633407 ) ) ( not ( = ?auto_633399 ?auto_633408 ) ) ( not ( = ?auto_633399 ?auto_633409 ) ) ( not ( = ?auto_633399 ?auto_633410 ) ) ( not ( = ?auto_633399 ?auto_633411 ) ) ( not ( = ?auto_633399 ?auto_633412 ) ) ( not ( = ?auto_633399 ?auto_633413 ) ) ( not ( = ?auto_633399 ?auto_633414 ) ) ( not ( = ?auto_633400 ?auto_633401 ) ) ( not ( = ?auto_633400 ?auto_633402 ) ) ( not ( = ?auto_633400 ?auto_633403 ) ) ( not ( = ?auto_633400 ?auto_633404 ) ) ( not ( = ?auto_633400 ?auto_633405 ) ) ( not ( = ?auto_633400 ?auto_633406 ) ) ( not ( = ?auto_633400 ?auto_633407 ) ) ( not ( = ?auto_633400 ?auto_633408 ) ) ( not ( = ?auto_633400 ?auto_633409 ) ) ( not ( = ?auto_633400 ?auto_633410 ) ) ( not ( = ?auto_633400 ?auto_633411 ) ) ( not ( = ?auto_633400 ?auto_633412 ) ) ( not ( = ?auto_633400 ?auto_633413 ) ) ( not ( = ?auto_633400 ?auto_633414 ) ) ( not ( = ?auto_633401 ?auto_633402 ) ) ( not ( = ?auto_633401 ?auto_633403 ) ) ( not ( = ?auto_633401 ?auto_633404 ) ) ( not ( = ?auto_633401 ?auto_633405 ) ) ( not ( = ?auto_633401 ?auto_633406 ) ) ( not ( = ?auto_633401 ?auto_633407 ) ) ( not ( = ?auto_633401 ?auto_633408 ) ) ( not ( = ?auto_633401 ?auto_633409 ) ) ( not ( = ?auto_633401 ?auto_633410 ) ) ( not ( = ?auto_633401 ?auto_633411 ) ) ( not ( = ?auto_633401 ?auto_633412 ) ) ( not ( = ?auto_633401 ?auto_633413 ) ) ( not ( = ?auto_633401 ?auto_633414 ) ) ( not ( = ?auto_633402 ?auto_633403 ) ) ( not ( = ?auto_633402 ?auto_633404 ) ) ( not ( = ?auto_633402 ?auto_633405 ) ) ( not ( = ?auto_633402 ?auto_633406 ) ) ( not ( = ?auto_633402 ?auto_633407 ) ) ( not ( = ?auto_633402 ?auto_633408 ) ) ( not ( = ?auto_633402 ?auto_633409 ) ) ( not ( = ?auto_633402 ?auto_633410 ) ) ( not ( = ?auto_633402 ?auto_633411 ) ) ( not ( = ?auto_633402 ?auto_633412 ) ) ( not ( = ?auto_633402 ?auto_633413 ) ) ( not ( = ?auto_633402 ?auto_633414 ) ) ( not ( = ?auto_633403 ?auto_633404 ) ) ( not ( = ?auto_633403 ?auto_633405 ) ) ( not ( = ?auto_633403 ?auto_633406 ) ) ( not ( = ?auto_633403 ?auto_633407 ) ) ( not ( = ?auto_633403 ?auto_633408 ) ) ( not ( = ?auto_633403 ?auto_633409 ) ) ( not ( = ?auto_633403 ?auto_633410 ) ) ( not ( = ?auto_633403 ?auto_633411 ) ) ( not ( = ?auto_633403 ?auto_633412 ) ) ( not ( = ?auto_633403 ?auto_633413 ) ) ( not ( = ?auto_633403 ?auto_633414 ) ) ( not ( = ?auto_633404 ?auto_633405 ) ) ( not ( = ?auto_633404 ?auto_633406 ) ) ( not ( = ?auto_633404 ?auto_633407 ) ) ( not ( = ?auto_633404 ?auto_633408 ) ) ( not ( = ?auto_633404 ?auto_633409 ) ) ( not ( = ?auto_633404 ?auto_633410 ) ) ( not ( = ?auto_633404 ?auto_633411 ) ) ( not ( = ?auto_633404 ?auto_633412 ) ) ( not ( = ?auto_633404 ?auto_633413 ) ) ( not ( = ?auto_633404 ?auto_633414 ) ) ( not ( = ?auto_633405 ?auto_633406 ) ) ( not ( = ?auto_633405 ?auto_633407 ) ) ( not ( = ?auto_633405 ?auto_633408 ) ) ( not ( = ?auto_633405 ?auto_633409 ) ) ( not ( = ?auto_633405 ?auto_633410 ) ) ( not ( = ?auto_633405 ?auto_633411 ) ) ( not ( = ?auto_633405 ?auto_633412 ) ) ( not ( = ?auto_633405 ?auto_633413 ) ) ( not ( = ?auto_633405 ?auto_633414 ) ) ( not ( = ?auto_633406 ?auto_633407 ) ) ( not ( = ?auto_633406 ?auto_633408 ) ) ( not ( = ?auto_633406 ?auto_633409 ) ) ( not ( = ?auto_633406 ?auto_633410 ) ) ( not ( = ?auto_633406 ?auto_633411 ) ) ( not ( = ?auto_633406 ?auto_633412 ) ) ( not ( = ?auto_633406 ?auto_633413 ) ) ( not ( = ?auto_633406 ?auto_633414 ) ) ( not ( = ?auto_633407 ?auto_633408 ) ) ( not ( = ?auto_633407 ?auto_633409 ) ) ( not ( = ?auto_633407 ?auto_633410 ) ) ( not ( = ?auto_633407 ?auto_633411 ) ) ( not ( = ?auto_633407 ?auto_633412 ) ) ( not ( = ?auto_633407 ?auto_633413 ) ) ( not ( = ?auto_633407 ?auto_633414 ) ) ( not ( = ?auto_633408 ?auto_633409 ) ) ( not ( = ?auto_633408 ?auto_633410 ) ) ( not ( = ?auto_633408 ?auto_633411 ) ) ( not ( = ?auto_633408 ?auto_633412 ) ) ( not ( = ?auto_633408 ?auto_633413 ) ) ( not ( = ?auto_633408 ?auto_633414 ) ) ( not ( = ?auto_633409 ?auto_633410 ) ) ( not ( = ?auto_633409 ?auto_633411 ) ) ( not ( = ?auto_633409 ?auto_633412 ) ) ( not ( = ?auto_633409 ?auto_633413 ) ) ( not ( = ?auto_633409 ?auto_633414 ) ) ( not ( = ?auto_633410 ?auto_633411 ) ) ( not ( = ?auto_633410 ?auto_633412 ) ) ( not ( = ?auto_633410 ?auto_633413 ) ) ( not ( = ?auto_633410 ?auto_633414 ) ) ( not ( = ?auto_633411 ?auto_633412 ) ) ( not ( = ?auto_633411 ?auto_633413 ) ) ( not ( = ?auto_633411 ?auto_633414 ) ) ( not ( = ?auto_633412 ?auto_633413 ) ) ( not ( = ?auto_633412 ?auto_633414 ) ) ( not ( = ?auto_633413 ?auto_633414 ) ) ( ON ?auto_633412 ?auto_633413 ) ( ON ?auto_633411 ?auto_633412 ) ( ON ?auto_633410 ?auto_633411 ) ( ON ?auto_633409 ?auto_633410 ) ( ON ?auto_633408 ?auto_633409 ) ( ON ?auto_633407 ?auto_633408 ) ( CLEAR ?auto_633405 ) ( ON ?auto_633406 ?auto_633407 ) ( CLEAR ?auto_633406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_633398 ?auto_633399 ?auto_633400 ?auto_633401 ?auto_633402 ?auto_633403 ?auto_633404 ?auto_633405 ?auto_633406 )
      ( MAKE-16PILE ?auto_633398 ?auto_633399 ?auto_633400 ?auto_633401 ?auto_633402 ?auto_633403 ?auto_633404 ?auto_633405 ?auto_633406 ?auto_633407 ?auto_633408 ?auto_633409 ?auto_633410 ?auto_633411 ?auto_633412 ?auto_633413 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633464 - BLOCK
      ?auto_633465 - BLOCK
      ?auto_633466 - BLOCK
      ?auto_633467 - BLOCK
      ?auto_633468 - BLOCK
      ?auto_633469 - BLOCK
      ?auto_633470 - BLOCK
      ?auto_633471 - BLOCK
      ?auto_633472 - BLOCK
      ?auto_633473 - BLOCK
      ?auto_633474 - BLOCK
      ?auto_633475 - BLOCK
      ?auto_633476 - BLOCK
      ?auto_633477 - BLOCK
      ?auto_633478 - BLOCK
      ?auto_633479 - BLOCK
    )
    :vars
    (
      ?auto_633480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633479 ?auto_633480 ) ( ON-TABLE ?auto_633464 ) ( ON ?auto_633465 ?auto_633464 ) ( ON ?auto_633466 ?auto_633465 ) ( ON ?auto_633467 ?auto_633466 ) ( ON ?auto_633468 ?auto_633467 ) ( ON ?auto_633469 ?auto_633468 ) ( ON ?auto_633470 ?auto_633469 ) ( not ( = ?auto_633464 ?auto_633465 ) ) ( not ( = ?auto_633464 ?auto_633466 ) ) ( not ( = ?auto_633464 ?auto_633467 ) ) ( not ( = ?auto_633464 ?auto_633468 ) ) ( not ( = ?auto_633464 ?auto_633469 ) ) ( not ( = ?auto_633464 ?auto_633470 ) ) ( not ( = ?auto_633464 ?auto_633471 ) ) ( not ( = ?auto_633464 ?auto_633472 ) ) ( not ( = ?auto_633464 ?auto_633473 ) ) ( not ( = ?auto_633464 ?auto_633474 ) ) ( not ( = ?auto_633464 ?auto_633475 ) ) ( not ( = ?auto_633464 ?auto_633476 ) ) ( not ( = ?auto_633464 ?auto_633477 ) ) ( not ( = ?auto_633464 ?auto_633478 ) ) ( not ( = ?auto_633464 ?auto_633479 ) ) ( not ( = ?auto_633464 ?auto_633480 ) ) ( not ( = ?auto_633465 ?auto_633466 ) ) ( not ( = ?auto_633465 ?auto_633467 ) ) ( not ( = ?auto_633465 ?auto_633468 ) ) ( not ( = ?auto_633465 ?auto_633469 ) ) ( not ( = ?auto_633465 ?auto_633470 ) ) ( not ( = ?auto_633465 ?auto_633471 ) ) ( not ( = ?auto_633465 ?auto_633472 ) ) ( not ( = ?auto_633465 ?auto_633473 ) ) ( not ( = ?auto_633465 ?auto_633474 ) ) ( not ( = ?auto_633465 ?auto_633475 ) ) ( not ( = ?auto_633465 ?auto_633476 ) ) ( not ( = ?auto_633465 ?auto_633477 ) ) ( not ( = ?auto_633465 ?auto_633478 ) ) ( not ( = ?auto_633465 ?auto_633479 ) ) ( not ( = ?auto_633465 ?auto_633480 ) ) ( not ( = ?auto_633466 ?auto_633467 ) ) ( not ( = ?auto_633466 ?auto_633468 ) ) ( not ( = ?auto_633466 ?auto_633469 ) ) ( not ( = ?auto_633466 ?auto_633470 ) ) ( not ( = ?auto_633466 ?auto_633471 ) ) ( not ( = ?auto_633466 ?auto_633472 ) ) ( not ( = ?auto_633466 ?auto_633473 ) ) ( not ( = ?auto_633466 ?auto_633474 ) ) ( not ( = ?auto_633466 ?auto_633475 ) ) ( not ( = ?auto_633466 ?auto_633476 ) ) ( not ( = ?auto_633466 ?auto_633477 ) ) ( not ( = ?auto_633466 ?auto_633478 ) ) ( not ( = ?auto_633466 ?auto_633479 ) ) ( not ( = ?auto_633466 ?auto_633480 ) ) ( not ( = ?auto_633467 ?auto_633468 ) ) ( not ( = ?auto_633467 ?auto_633469 ) ) ( not ( = ?auto_633467 ?auto_633470 ) ) ( not ( = ?auto_633467 ?auto_633471 ) ) ( not ( = ?auto_633467 ?auto_633472 ) ) ( not ( = ?auto_633467 ?auto_633473 ) ) ( not ( = ?auto_633467 ?auto_633474 ) ) ( not ( = ?auto_633467 ?auto_633475 ) ) ( not ( = ?auto_633467 ?auto_633476 ) ) ( not ( = ?auto_633467 ?auto_633477 ) ) ( not ( = ?auto_633467 ?auto_633478 ) ) ( not ( = ?auto_633467 ?auto_633479 ) ) ( not ( = ?auto_633467 ?auto_633480 ) ) ( not ( = ?auto_633468 ?auto_633469 ) ) ( not ( = ?auto_633468 ?auto_633470 ) ) ( not ( = ?auto_633468 ?auto_633471 ) ) ( not ( = ?auto_633468 ?auto_633472 ) ) ( not ( = ?auto_633468 ?auto_633473 ) ) ( not ( = ?auto_633468 ?auto_633474 ) ) ( not ( = ?auto_633468 ?auto_633475 ) ) ( not ( = ?auto_633468 ?auto_633476 ) ) ( not ( = ?auto_633468 ?auto_633477 ) ) ( not ( = ?auto_633468 ?auto_633478 ) ) ( not ( = ?auto_633468 ?auto_633479 ) ) ( not ( = ?auto_633468 ?auto_633480 ) ) ( not ( = ?auto_633469 ?auto_633470 ) ) ( not ( = ?auto_633469 ?auto_633471 ) ) ( not ( = ?auto_633469 ?auto_633472 ) ) ( not ( = ?auto_633469 ?auto_633473 ) ) ( not ( = ?auto_633469 ?auto_633474 ) ) ( not ( = ?auto_633469 ?auto_633475 ) ) ( not ( = ?auto_633469 ?auto_633476 ) ) ( not ( = ?auto_633469 ?auto_633477 ) ) ( not ( = ?auto_633469 ?auto_633478 ) ) ( not ( = ?auto_633469 ?auto_633479 ) ) ( not ( = ?auto_633469 ?auto_633480 ) ) ( not ( = ?auto_633470 ?auto_633471 ) ) ( not ( = ?auto_633470 ?auto_633472 ) ) ( not ( = ?auto_633470 ?auto_633473 ) ) ( not ( = ?auto_633470 ?auto_633474 ) ) ( not ( = ?auto_633470 ?auto_633475 ) ) ( not ( = ?auto_633470 ?auto_633476 ) ) ( not ( = ?auto_633470 ?auto_633477 ) ) ( not ( = ?auto_633470 ?auto_633478 ) ) ( not ( = ?auto_633470 ?auto_633479 ) ) ( not ( = ?auto_633470 ?auto_633480 ) ) ( not ( = ?auto_633471 ?auto_633472 ) ) ( not ( = ?auto_633471 ?auto_633473 ) ) ( not ( = ?auto_633471 ?auto_633474 ) ) ( not ( = ?auto_633471 ?auto_633475 ) ) ( not ( = ?auto_633471 ?auto_633476 ) ) ( not ( = ?auto_633471 ?auto_633477 ) ) ( not ( = ?auto_633471 ?auto_633478 ) ) ( not ( = ?auto_633471 ?auto_633479 ) ) ( not ( = ?auto_633471 ?auto_633480 ) ) ( not ( = ?auto_633472 ?auto_633473 ) ) ( not ( = ?auto_633472 ?auto_633474 ) ) ( not ( = ?auto_633472 ?auto_633475 ) ) ( not ( = ?auto_633472 ?auto_633476 ) ) ( not ( = ?auto_633472 ?auto_633477 ) ) ( not ( = ?auto_633472 ?auto_633478 ) ) ( not ( = ?auto_633472 ?auto_633479 ) ) ( not ( = ?auto_633472 ?auto_633480 ) ) ( not ( = ?auto_633473 ?auto_633474 ) ) ( not ( = ?auto_633473 ?auto_633475 ) ) ( not ( = ?auto_633473 ?auto_633476 ) ) ( not ( = ?auto_633473 ?auto_633477 ) ) ( not ( = ?auto_633473 ?auto_633478 ) ) ( not ( = ?auto_633473 ?auto_633479 ) ) ( not ( = ?auto_633473 ?auto_633480 ) ) ( not ( = ?auto_633474 ?auto_633475 ) ) ( not ( = ?auto_633474 ?auto_633476 ) ) ( not ( = ?auto_633474 ?auto_633477 ) ) ( not ( = ?auto_633474 ?auto_633478 ) ) ( not ( = ?auto_633474 ?auto_633479 ) ) ( not ( = ?auto_633474 ?auto_633480 ) ) ( not ( = ?auto_633475 ?auto_633476 ) ) ( not ( = ?auto_633475 ?auto_633477 ) ) ( not ( = ?auto_633475 ?auto_633478 ) ) ( not ( = ?auto_633475 ?auto_633479 ) ) ( not ( = ?auto_633475 ?auto_633480 ) ) ( not ( = ?auto_633476 ?auto_633477 ) ) ( not ( = ?auto_633476 ?auto_633478 ) ) ( not ( = ?auto_633476 ?auto_633479 ) ) ( not ( = ?auto_633476 ?auto_633480 ) ) ( not ( = ?auto_633477 ?auto_633478 ) ) ( not ( = ?auto_633477 ?auto_633479 ) ) ( not ( = ?auto_633477 ?auto_633480 ) ) ( not ( = ?auto_633478 ?auto_633479 ) ) ( not ( = ?auto_633478 ?auto_633480 ) ) ( not ( = ?auto_633479 ?auto_633480 ) ) ( ON ?auto_633478 ?auto_633479 ) ( ON ?auto_633477 ?auto_633478 ) ( ON ?auto_633476 ?auto_633477 ) ( ON ?auto_633475 ?auto_633476 ) ( ON ?auto_633474 ?auto_633475 ) ( ON ?auto_633473 ?auto_633474 ) ( ON ?auto_633472 ?auto_633473 ) ( CLEAR ?auto_633470 ) ( ON ?auto_633471 ?auto_633472 ) ( CLEAR ?auto_633471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_633464 ?auto_633465 ?auto_633466 ?auto_633467 ?auto_633468 ?auto_633469 ?auto_633470 ?auto_633471 )
      ( MAKE-16PILE ?auto_633464 ?auto_633465 ?auto_633466 ?auto_633467 ?auto_633468 ?auto_633469 ?auto_633470 ?auto_633471 ?auto_633472 ?auto_633473 ?auto_633474 ?auto_633475 ?auto_633476 ?auto_633477 ?auto_633478 ?auto_633479 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633530 - BLOCK
      ?auto_633531 - BLOCK
      ?auto_633532 - BLOCK
      ?auto_633533 - BLOCK
      ?auto_633534 - BLOCK
      ?auto_633535 - BLOCK
      ?auto_633536 - BLOCK
      ?auto_633537 - BLOCK
      ?auto_633538 - BLOCK
      ?auto_633539 - BLOCK
      ?auto_633540 - BLOCK
      ?auto_633541 - BLOCK
      ?auto_633542 - BLOCK
      ?auto_633543 - BLOCK
      ?auto_633544 - BLOCK
      ?auto_633545 - BLOCK
    )
    :vars
    (
      ?auto_633546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633545 ?auto_633546 ) ( ON-TABLE ?auto_633530 ) ( ON ?auto_633531 ?auto_633530 ) ( ON ?auto_633532 ?auto_633531 ) ( ON ?auto_633533 ?auto_633532 ) ( ON ?auto_633534 ?auto_633533 ) ( ON ?auto_633535 ?auto_633534 ) ( not ( = ?auto_633530 ?auto_633531 ) ) ( not ( = ?auto_633530 ?auto_633532 ) ) ( not ( = ?auto_633530 ?auto_633533 ) ) ( not ( = ?auto_633530 ?auto_633534 ) ) ( not ( = ?auto_633530 ?auto_633535 ) ) ( not ( = ?auto_633530 ?auto_633536 ) ) ( not ( = ?auto_633530 ?auto_633537 ) ) ( not ( = ?auto_633530 ?auto_633538 ) ) ( not ( = ?auto_633530 ?auto_633539 ) ) ( not ( = ?auto_633530 ?auto_633540 ) ) ( not ( = ?auto_633530 ?auto_633541 ) ) ( not ( = ?auto_633530 ?auto_633542 ) ) ( not ( = ?auto_633530 ?auto_633543 ) ) ( not ( = ?auto_633530 ?auto_633544 ) ) ( not ( = ?auto_633530 ?auto_633545 ) ) ( not ( = ?auto_633530 ?auto_633546 ) ) ( not ( = ?auto_633531 ?auto_633532 ) ) ( not ( = ?auto_633531 ?auto_633533 ) ) ( not ( = ?auto_633531 ?auto_633534 ) ) ( not ( = ?auto_633531 ?auto_633535 ) ) ( not ( = ?auto_633531 ?auto_633536 ) ) ( not ( = ?auto_633531 ?auto_633537 ) ) ( not ( = ?auto_633531 ?auto_633538 ) ) ( not ( = ?auto_633531 ?auto_633539 ) ) ( not ( = ?auto_633531 ?auto_633540 ) ) ( not ( = ?auto_633531 ?auto_633541 ) ) ( not ( = ?auto_633531 ?auto_633542 ) ) ( not ( = ?auto_633531 ?auto_633543 ) ) ( not ( = ?auto_633531 ?auto_633544 ) ) ( not ( = ?auto_633531 ?auto_633545 ) ) ( not ( = ?auto_633531 ?auto_633546 ) ) ( not ( = ?auto_633532 ?auto_633533 ) ) ( not ( = ?auto_633532 ?auto_633534 ) ) ( not ( = ?auto_633532 ?auto_633535 ) ) ( not ( = ?auto_633532 ?auto_633536 ) ) ( not ( = ?auto_633532 ?auto_633537 ) ) ( not ( = ?auto_633532 ?auto_633538 ) ) ( not ( = ?auto_633532 ?auto_633539 ) ) ( not ( = ?auto_633532 ?auto_633540 ) ) ( not ( = ?auto_633532 ?auto_633541 ) ) ( not ( = ?auto_633532 ?auto_633542 ) ) ( not ( = ?auto_633532 ?auto_633543 ) ) ( not ( = ?auto_633532 ?auto_633544 ) ) ( not ( = ?auto_633532 ?auto_633545 ) ) ( not ( = ?auto_633532 ?auto_633546 ) ) ( not ( = ?auto_633533 ?auto_633534 ) ) ( not ( = ?auto_633533 ?auto_633535 ) ) ( not ( = ?auto_633533 ?auto_633536 ) ) ( not ( = ?auto_633533 ?auto_633537 ) ) ( not ( = ?auto_633533 ?auto_633538 ) ) ( not ( = ?auto_633533 ?auto_633539 ) ) ( not ( = ?auto_633533 ?auto_633540 ) ) ( not ( = ?auto_633533 ?auto_633541 ) ) ( not ( = ?auto_633533 ?auto_633542 ) ) ( not ( = ?auto_633533 ?auto_633543 ) ) ( not ( = ?auto_633533 ?auto_633544 ) ) ( not ( = ?auto_633533 ?auto_633545 ) ) ( not ( = ?auto_633533 ?auto_633546 ) ) ( not ( = ?auto_633534 ?auto_633535 ) ) ( not ( = ?auto_633534 ?auto_633536 ) ) ( not ( = ?auto_633534 ?auto_633537 ) ) ( not ( = ?auto_633534 ?auto_633538 ) ) ( not ( = ?auto_633534 ?auto_633539 ) ) ( not ( = ?auto_633534 ?auto_633540 ) ) ( not ( = ?auto_633534 ?auto_633541 ) ) ( not ( = ?auto_633534 ?auto_633542 ) ) ( not ( = ?auto_633534 ?auto_633543 ) ) ( not ( = ?auto_633534 ?auto_633544 ) ) ( not ( = ?auto_633534 ?auto_633545 ) ) ( not ( = ?auto_633534 ?auto_633546 ) ) ( not ( = ?auto_633535 ?auto_633536 ) ) ( not ( = ?auto_633535 ?auto_633537 ) ) ( not ( = ?auto_633535 ?auto_633538 ) ) ( not ( = ?auto_633535 ?auto_633539 ) ) ( not ( = ?auto_633535 ?auto_633540 ) ) ( not ( = ?auto_633535 ?auto_633541 ) ) ( not ( = ?auto_633535 ?auto_633542 ) ) ( not ( = ?auto_633535 ?auto_633543 ) ) ( not ( = ?auto_633535 ?auto_633544 ) ) ( not ( = ?auto_633535 ?auto_633545 ) ) ( not ( = ?auto_633535 ?auto_633546 ) ) ( not ( = ?auto_633536 ?auto_633537 ) ) ( not ( = ?auto_633536 ?auto_633538 ) ) ( not ( = ?auto_633536 ?auto_633539 ) ) ( not ( = ?auto_633536 ?auto_633540 ) ) ( not ( = ?auto_633536 ?auto_633541 ) ) ( not ( = ?auto_633536 ?auto_633542 ) ) ( not ( = ?auto_633536 ?auto_633543 ) ) ( not ( = ?auto_633536 ?auto_633544 ) ) ( not ( = ?auto_633536 ?auto_633545 ) ) ( not ( = ?auto_633536 ?auto_633546 ) ) ( not ( = ?auto_633537 ?auto_633538 ) ) ( not ( = ?auto_633537 ?auto_633539 ) ) ( not ( = ?auto_633537 ?auto_633540 ) ) ( not ( = ?auto_633537 ?auto_633541 ) ) ( not ( = ?auto_633537 ?auto_633542 ) ) ( not ( = ?auto_633537 ?auto_633543 ) ) ( not ( = ?auto_633537 ?auto_633544 ) ) ( not ( = ?auto_633537 ?auto_633545 ) ) ( not ( = ?auto_633537 ?auto_633546 ) ) ( not ( = ?auto_633538 ?auto_633539 ) ) ( not ( = ?auto_633538 ?auto_633540 ) ) ( not ( = ?auto_633538 ?auto_633541 ) ) ( not ( = ?auto_633538 ?auto_633542 ) ) ( not ( = ?auto_633538 ?auto_633543 ) ) ( not ( = ?auto_633538 ?auto_633544 ) ) ( not ( = ?auto_633538 ?auto_633545 ) ) ( not ( = ?auto_633538 ?auto_633546 ) ) ( not ( = ?auto_633539 ?auto_633540 ) ) ( not ( = ?auto_633539 ?auto_633541 ) ) ( not ( = ?auto_633539 ?auto_633542 ) ) ( not ( = ?auto_633539 ?auto_633543 ) ) ( not ( = ?auto_633539 ?auto_633544 ) ) ( not ( = ?auto_633539 ?auto_633545 ) ) ( not ( = ?auto_633539 ?auto_633546 ) ) ( not ( = ?auto_633540 ?auto_633541 ) ) ( not ( = ?auto_633540 ?auto_633542 ) ) ( not ( = ?auto_633540 ?auto_633543 ) ) ( not ( = ?auto_633540 ?auto_633544 ) ) ( not ( = ?auto_633540 ?auto_633545 ) ) ( not ( = ?auto_633540 ?auto_633546 ) ) ( not ( = ?auto_633541 ?auto_633542 ) ) ( not ( = ?auto_633541 ?auto_633543 ) ) ( not ( = ?auto_633541 ?auto_633544 ) ) ( not ( = ?auto_633541 ?auto_633545 ) ) ( not ( = ?auto_633541 ?auto_633546 ) ) ( not ( = ?auto_633542 ?auto_633543 ) ) ( not ( = ?auto_633542 ?auto_633544 ) ) ( not ( = ?auto_633542 ?auto_633545 ) ) ( not ( = ?auto_633542 ?auto_633546 ) ) ( not ( = ?auto_633543 ?auto_633544 ) ) ( not ( = ?auto_633543 ?auto_633545 ) ) ( not ( = ?auto_633543 ?auto_633546 ) ) ( not ( = ?auto_633544 ?auto_633545 ) ) ( not ( = ?auto_633544 ?auto_633546 ) ) ( not ( = ?auto_633545 ?auto_633546 ) ) ( ON ?auto_633544 ?auto_633545 ) ( ON ?auto_633543 ?auto_633544 ) ( ON ?auto_633542 ?auto_633543 ) ( ON ?auto_633541 ?auto_633542 ) ( ON ?auto_633540 ?auto_633541 ) ( ON ?auto_633539 ?auto_633540 ) ( ON ?auto_633538 ?auto_633539 ) ( ON ?auto_633537 ?auto_633538 ) ( CLEAR ?auto_633535 ) ( ON ?auto_633536 ?auto_633537 ) ( CLEAR ?auto_633536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_633530 ?auto_633531 ?auto_633532 ?auto_633533 ?auto_633534 ?auto_633535 ?auto_633536 )
      ( MAKE-16PILE ?auto_633530 ?auto_633531 ?auto_633532 ?auto_633533 ?auto_633534 ?auto_633535 ?auto_633536 ?auto_633537 ?auto_633538 ?auto_633539 ?auto_633540 ?auto_633541 ?auto_633542 ?auto_633543 ?auto_633544 ?auto_633545 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633596 - BLOCK
      ?auto_633597 - BLOCK
      ?auto_633598 - BLOCK
      ?auto_633599 - BLOCK
      ?auto_633600 - BLOCK
      ?auto_633601 - BLOCK
      ?auto_633602 - BLOCK
      ?auto_633603 - BLOCK
      ?auto_633604 - BLOCK
      ?auto_633605 - BLOCK
      ?auto_633606 - BLOCK
      ?auto_633607 - BLOCK
      ?auto_633608 - BLOCK
      ?auto_633609 - BLOCK
      ?auto_633610 - BLOCK
      ?auto_633611 - BLOCK
    )
    :vars
    (
      ?auto_633612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633611 ?auto_633612 ) ( ON-TABLE ?auto_633596 ) ( ON ?auto_633597 ?auto_633596 ) ( ON ?auto_633598 ?auto_633597 ) ( ON ?auto_633599 ?auto_633598 ) ( ON ?auto_633600 ?auto_633599 ) ( not ( = ?auto_633596 ?auto_633597 ) ) ( not ( = ?auto_633596 ?auto_633598 ) ) ( not ( = ?auto_633596 ?auto_633599 ) ) ( not ( = ?auto_633596 ?auto_633600 ) ) ( not ( = ?auto_633596 ?auto_633601 ) ) ( not ( = ?auto_633596 ?auto_633602 ) ) ( not ( = ?auto_633596 ?auto_633603 ) ) ( not ( = ?auto_633596 ?auto_633604 ) ) ( not ( = ?auto_633596 ?auto_633605 ) ) ( not ( = ?auto_633596 ?auto_633606 ) ) ( not ( = ?auto_633596 ?auto_633607 ) ) ( not ( = ?auto_633596 ?auto_633608 ) ) ( not ( = ?auto_633596 ?auto_633609 ) ) ( not ( = ?auto_633596 ?auto_633610 ) ) ( not ( = ?auto_633596 ?auto_633611 ) ) ( not ( = ?auto_633596 ?auto_633612 ) ) ( not ( = ?auto_633597 ?auto_633598 ) ) ( not ( = ?auto_633597 ?auto_633599 ) ) ( not ( = ?auto_633597 ?auto_633600 ) ) ( not ( = ?auto_633597 ?auto_633601 ) ) ( not ( = ?auto_633597 ?auto_633602 ) ) ( not ( = ?auto_633597 ?auto_633603 ) ) ( not ( = ?auto_633597 ?auto_633604 ) ) ( not ( = ?auto_633597 ?auto_633605 ) ) ( not ( = ?auto_633597 ?auto_633606 ) ) ( not ( = ?auto_633597 ?auto_633607 ) ) ( not ( = ?auto_633597 ?auto_633608 ) ) ( not ( = ?auto_633597 ?auto_633609 ) ) ( not ( = ?auto_633597 ?auto_633610 ) ) ( not ( = ?auto_633597 ?auto_633611 ) ) ( not ( = ?auto_633597 ?auto_633612 ) ) ( not ( = ?auto_633598 ?auto_633599 ) ) ( not ( = ?auto_633598 ?auto_633600 ) ) ( not ( = ?auto_633598 ?auto_633601 ) ) ( not ( = ?auto_633598 ?auto_633602 ) ) ( not ( = ?auto_633598 ?auto_633603 ) ) ( not ( = ?auto_633598 ?auto_633604 ) ) ( not ( = ?auto_633598 ?auto_633605 ) ) ( not ( = ?auto_633598 ?auto_633606 ) ) ( not ( = ?auto_633598 ?auto_633607 ) ) ( not ( = ?auto_633598 ?auto_633608 ) ) ( not ( = ?auto_633598 ?auto_633609 ) ) ( not ( = ?auto_633598 ?auto_633610 ) ) ( not ( = ?auto_633598 ?auto_633611 ) ) ( not ( = ?auto_633598 ?auto_633612 ) ) ( not ( = ?auto_633599 ?auto_633600 ) ) ( not ( = ?auto_633599 ?auto_633601 ) ) ( not ( = ?auto_633599 ?auto_633602 ) ) ( not ( = ?auto_633599 ?auto_633603 ) ) ( not ( = ?auto_633599 ?auto_633604 ) ) ( not ( = ?auto_633599 ?auto_633605 ) ) ( not ( = ?auto_633599 ?auto_633606 ) ) ( not ( = ?auto_633599 ?auto_633607 ) ) ( not ( = ?auto_633599 ?auto_633608 ) ) ( not ( = ?auto_633599 ?auto_633609 ) ) ( not ( = ?auto_633599 ?auto_633610 ) ) ( not ( = ?auto_633599 ?auto_633611 ) ) ( not ( = ?auto_633599 ?auto_633612 ) ) ( not ( = ?auto_633600 ?auto_633601 ) ) ( not ( = ?auto_633600 ?auto_633602 ) ) ( not ( = ?auto_633600 ?auto_633603 ) ) ( not ( = ?auto_633600 ?auto_633604 ) ) ( not ( = ?auto_633600 ?auto_633605 ) ) ( not ( = ?auto_633600 ?auto_633606 ) ) ( not ( = ?auto_633600 ?auto_633607 ) ) ( not ( = ?auto_633600 ?auto_633608 ) ) ( not ( = ?auto_633600 ?auto_633609 ) ) ( not ( = ?auto_633600 ?auto_633610 ) ) ( not ( = ?auto_633600 ?auto_633611 ) ) ( not ( = ?auto_633600 ?auto_633612 ) ) ( not ( = ?auto_633601 ?auto_633602 ) ) ( not ( = ?auto_633601 ?auto_633603 ) ) ( not ( = ?auto_633601 ?auto_633604 ) ) ( not ( = ?auto_633601 ?auto_633605 ) ) ( not ( = ?auto_633601 ?auto_633606 ) ) ( not ( = ?auto_633601 ?auto_633607 ) ) ( not ( = ?auto_633601 ?auto_633608 ) ) ( not ( = ?auto_633601 ?auto_633609 ) ) ( not ( = ?auto_633601 ?auto_633610 ) ) ( not ( = ?auto_633601 ?auto_633611 ) ) ( not ( = ?auto_633601 ?auto_633612 ) ) ( not ( = ?auto_633602 ?auto_633603 ) ) ( not ( = ?auto_633602 ?auto_633604 ) ) ( not ( = ?auto_633602 ?auto_633605 ) ) ( not ( = ?auto_633602 ?auto_633606 ) ) ( not ( = ?auto_633602 ?auto_633607 ) ) ( not ( = ?auto_633602 ?auto_633608 ) ) ( not ( = ?auto_633602 ?auto_633609 ) ) ( not ( = ?auto_633602 ?auto_633610 ) ) ( not ( = ?auto_633602 ?auto_633611 ) ) ( not ( = ?auto_633602 ?auto_633612 ) ) ( not ( = ?auto_633603 ?auto_633604 ) ) ( not ( = ?auto_633603 ?auto_633605 ) ) ( not ( = ?auto_633603 ?auto_633606 ) ) ( not ( = ?auto_633603 ?auto_633607 ) ) ( not ( = ?auto_633603 ?auto_633608 ) ) ( not ( = ?auto_633603 ?auto_633609 ) ) ( not ( = ?auto_633603 ?auto_633610 ) ) ( not ( = ?auto_633603 ?auto_633611 ) ) ( not ( = ?auto_633603 ?auto_633612 ) ) ( not ( = ?auto_633604 ?auto_633605 ) ) ( not ( = ?auto_633604 ?auto_633606 ) ) ( not ( = ?auto_633604 ?auto_633607 ) ) ( not ( = ?auto_633604 ?auto_633608 ) ) ( not ( = ?auto_633604 ?auto_633609 ) ) ( not ( = ?auto_633604 ?auto_633610 ) ) ( not ( = ?auto_633604 ?auto_633611 ) ) ( not ( = ?auto_633604 ?auto_633612 ) ) ( not ( = ?auto_633605 ?auto_633606 ) ) ( not ( = ?auto_633605 ?auto_633607 ) ) ( not ( = ?auto_633605 ?auto_633608 ) ) ( not ( = ?auto_633605 ?auto_633609 ) ) ( not ( = ?auto_633605 ?auto_633610 ) ) ( not ( = ?auto_633605 ?auto_633611 ) ) ( not ( = ?auto_633605 ?auto_633612 ) ) ( not ( = ?auto_633606 ?auto_633607 ) ) ( not ( = ?auto_633606 ?auto_633608 ) ) ( not ( = ?auto_633606 ?auto_633609 ) ) ( not ( = ?auto_633606 ?auto_633610 ) ) ( not ( = ?auto_633606 ?auto_633611 ) ) ( not ( = ?auto_633606 ?auto_633612 ) ) ( not ( = ?auto_633607 ?auto_633608 ) ) ( not ( = ?auto_633607 ?auto_633609 ) ) ( not ( = ?auto_633607 ?auto_633610 ) ) ( not ( = ?auto_633607 ?auto_633611 ) ) ( not ( = ?auto_633607 ?auto_633612 ) ) ( not ( = ?auto_633608 ?auto_633609 ) ) ( not ( = ?auto_633608 ?auto_633610 ) ) ( not ( = ?auto_633608 ?auto_633611 ) ) ( not ( = ?auto_633608 ?auto_633612 ) ) ( not ( = ?auto_633609 ?auto_633610 ) ) ( not ( = ?auto_633609 ?auto_633611 ) ) ( not ( = ?auto_633609 ?auto_633612 ) ) ( not ( = ?auto_633610 ?auto_633611 ) ) ( not ( = ?auto_633610 ?auto_633612 ) ) ( not ( = ?auto_633611 ?auto_633612 ) ) ( ON ?auto_633610 ?auto_633611 ) ( ON ?auto_633609 ?auto_633610 ) ( ON ?auto_633608 ?auto_633609 ) ( ON ?auto_633607 ?auto_633608 ) ( ON ?auto_633606 ?auto_633607 ) ( ON ?auto_633605 ?auto_633606 ) ( ON ?auto_633604 ?auto_633605 ) ( ON ?auto_633603 ?auto_633604 ) ( ON ?auto_633602 ?auto_633603 ) ( CLEAR ?auto_633600 ) ( ON ?auto_633601 ?auto_633602 ) ( CLEAR ?auto_633601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_633596 ?auto_633597 ?auto_633598 ?auto_633599 ?auto_633600 ?auto_633601 )
      ( MAKE-16PILE ?auto_633596 ?auto_633597 ?auto_633598 ?auto_633599 ?auto_633600 ?auto_633601 ?auto_633602 ?auto_633603 ?auto_633604 ?auto_633605 ?auto_633606 ?auto_633607 ?auto_633608 ?auto_633609 ?auto_633610 ?auto_633611 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633662 - BLOCK
      ?auto_633663 - BLOCK
      ?auto_633664 - BLOCK
      ?auto_633665 - BLOCK
      ?auto_633666 - BLOCK
      ?auto_633667 - BLOCK
      ?auto_633668 - BLOCK
      ?auto_633669 - BLOCK
      ?auto_633670 - BLOCK
      ?auto_633671 - BLOCK
      ?auto_633672 - BLOCK
      ?auto_633673 - BLOCK
      ?auto_633674 - BLOCK
      ?auto_633675 - BLOCK
      ?auto_633676 - BLOCK
      ?auto_633677 - BLOCK
    )
    :vars
    (
      ?auto_633678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633677 ?auto_633678 ) ( ON-TABLE ?auto_633662 ) ( ON ?auto_633663 ?auto_633662 ) ( ON ?auto_633664 ?auto_633663 ) ( ON ?auto_633665 ?auto_633664 ) ( not ( = ?auto_633662 ?auto_633663 ) ) ( not ( = ?auto_633662 ?auto_633664 ) ) ( not ( = ?auto_633662 ?auto_633665 ) ) ( not ( = ?auto_633662 ?auto_633666 ) ) ( not ( = ?auto_633662 ?auto_633667 ) ) ( not ( = ?auto_633662 ?auto_633668 ) ) ( not ( = ?auto_633662 ?auto_633669 ) ) ( not ( = ?auto_633662 ?auto_633670 ) ) ( not ( = ?auto_633662 ?auto_633671 ) ) ( not ( = ?auto_633662 ?auto_633672 ) ) ( not ( = ?auto_633662 ?auto_633673 ) ) ( not ( = ?auto_633662 ?auto_633674 ) ) ( not ( = ?auto_633662 ?auto_633675 ) ) ( not ( = ?auto_633662 ?auto_633676 ) ) ( not ( = ?auto_633662 ?auto_633677 ) ) ( not ( = ?auto_633662 ?auto_633678 ) ) ( not ( = ?auto_633663 ?auto_633664 ) ) ( not ( = ?auto_633663 ?auto_633665 ) ) ( not ( = ?auto_633663 ?auto_633666 ) ) ( not ( = ?auto_633663 ?auto_633667 ) ) ( not ( = ?auto_633663 ?auto_633668 ) ) ( not ( = ?auto_633663 ?auto_633669 ) ) ( not ( = ?auto_633663 ?auto_633670 ) ) ( not ( = ?auto_633663 ?auto_633671 ) ) ( not ( = ?auto_633663 ?auto_633672 ) ) ( not ( = ?auto_633663 ?auto_633673 ) ) ( not ( = ?auto_633663 ?auto_633674 ) ) ( not ( = ?auto_633663 ?auto_633675 ) ) ( not ( = ?auto_633663 ?auto_633676 ) ) ( not ( = ?auto_633663 ?auto_633677 ) ) ( not ( = ?auto_633663 ?auto_633678 ) ) ( not ( = ?auto_633664 ?auto_633665 ) ) ( not ( = ?auto_633664 ?auto_633666 ) ) ( not ( = ?auto_633664 ?auto_633667 ) ) ( not ( = ?auto_633664 ?auto_633668 ) ) ( not ( = ?auto_633664 ?auto_633669 ) ) ( not ( = ?auto_633664 ?auto_633670 ) ) ( not ( = ?auto_633664 ?auto_633671 ) ) ( not ( = ?auto_633664 ?auto_633672 ) ) ( not ( = ?auto_633664 ?auto_633673 ) ) ( not ( = ?auto_633664 ?auto_633674 ) ) ( not ( = ?auto_633664 ?auto_633675 ) ) ( not ( = ?auto_633664 ?auto_633676 ) ) ( not ( = ?auto_633664 ?auto_633677 ) ) ( not ( = ?auto_633664 ?auto_633678 ) ) ( not ( = ?auto_633665 ?auto_633666 ) ) ( not ( = ?auto_633665 ?auto_633667 ) ) ( not ( = ?auto_633665 ?auto_633668 ) ) ( not ( = ?auto_633665 ?auto_633669 ) ) ( not ( = ?auto_633665 ?auto_633670 ) ) ( not ( = ?auto_633665 ?auto_633671 ) ) ( not ( = ?auto_633665 ?auto_633672 ) ) ( not ( = ?auto_633665 ?auto_633673 ) ) ( not ( = ?auto_633665 ?auto_633674 ) ) ( not ( = ?auto_633665 ?auto_633675 ) ) ( not ( = ?auto_633665 ?auto_633676 ) ) ( not ( = ?auto_633665 ?auto_633677 ) ) ( not ( = ?auto_633665 ?auto_633678 ) ) ( not ( = ?auto_633666 ?auto_633667 ) ) ( not ( = ?auto_633666 ?auto_633668 ) ) ( not ( = ?auto_633666 ?auto_633669 ) ) ( not ( = ?auto_633666 ?auto_633670 ) ) ( not ( = ?auto_633666 ?auto_633671 ) ) ( not ( = ?auto_633666 ?auto_633672 ) ) ( not ( = ?auto_633666 ?auto_633673 ) ) ( not ( = ?auto_633666 ?auto_633674 ) ) ( not ( = ?auto_633666 ?auto_633675 ) ) ( not ( = ?auto_633666 ?auto_633676 ) ) ( not ( = ?auto_633666 ?auto_633677 ) ) ( not ( = ?auto_633666 ?auto_633678 ) ) ( not ( = ?auto_633667 ?auto_633668 ) ) ( not ( = ?auto_633667 ?auto_633669 ) ) ( not ( = ?auto_633667 ?auto_633670 ) ) ( not ( = ?auto_633667 ?auto_633671 ) ) ( not ( = ?auto_633667 ?auto_633672 ) ) ( not ( = ?auto_633667 ?auto_633673 ) ) ( not ( = ?auto_633667 ?auto_633674 ) ) ( not ( = ?auto_633667 ?auto_633675 ) ) ( not ( = ?auto_633667 ?auto_633676 ) ) ( not ( = ?auto_633667 ?auto_633677 ) ) ( not ( = ?auto_633667 ?auto_633678 ) ) ( not ( = ?auto_633668 ?auto_633669 ) ) ( not ( = ?auto_633668 ?auto_633670 ) ) ( not ( = ?auto_633668 ?auto_633671 ) ) ( not ( = ?auto_633668 ?auto_633672 ) ) ( not ( = ?auto_633668 ?auto_633673 ) ) ( not ( = ?auto_633668 ?auto_633674 ) ) ( not ( = ?auto_633668 ?auto_633675 ) ) ( not ( = ?auto_633668 ?auto_633676 ) ) ( not ( = ?auto_633668 ?auto_633677 ) ) ( not ( = ?auto_633668 ?auto_633678 ) ) ( not ( = ?auto_633669 ?auto_633670 ) ) ( not ( = ?auto_633669 ?auto_633671 ) ) ( not ( = ?auto_633669 ?auto_633672 ) ) ( not ( = ?auto_633669 ?auto_633673 ) ) ( not ( = ?auto_633669 ?auto_633674 ) ) ( not ( = ?auto_633669 ?auto_633675 ) ) ( not ( = ?auto_633669 ?auto_633676 ) ) ( not ( = ?auto_633669 ?auto_633677 ) ) ( not ( = ?auto_633669 ?auto_633678 ) ) ( not ( = ?auto_633670 ?auto_633671 ) ) ( not ( = ?auto_633670 ?auto_633672 ) ) ( not ( = ?auto_633670 ?auto_633673 ) ) ( not ( = ?auto_633670 ?auto_633674 ) ) ( not ( = ?auto_633670 ?auto_633675 ) ) ( not ( = ?auto_633670 ?auto_633676 ) ) ( not ( = ?auto_633670 ?auto_633677 ) ) ( not ( = ?auto_633670 ?auto_633678 ) ) ( not ( = ?auto_633671 ?auto_633672 ) ) ( not ( = ?auto_633671 ?auto_633673 ) ) ( not ( = ?auto_633671 ?auto_633674 ) ) ( not ( = ?auto_633671 ?auto_633675 ) ) ( not ( = ?auto_633671 ?auto_633676 ) ) ( not ( = ?auto_633671 ?auto_633677 ) ) ( not ( = ?auto_633671 ?auto_633678 ) ) ( not ( = ?auto_633672 ?auto_633673 ) ) ( not ( = ?auto_633672 ?auto_633674 ) ) ( not ( = ?auto_633672 ?auto_633675 ) ) ( not ( = ?auto_633672 ?auto_633676 ) ) ( not ( = ?auto_633672 ?auto_633677 ) ) ( not ( = ?auto_633672 ?auto_633678 ) ) ( not ( = ?auto_633673 ?auto_633674 ) ) ( not ( = ?auto_633673 ?auto_633675 ) ) ( not ( = ?auto_633673 ?auto_633676 ) ) ( not ( = ?auto_633673 ?auto_633677 ) ) ( not ( = ?auto_633673 ?auto_633678 ) ) ( not ( = ?auto_633674 ?auto_633675 ) ) ( not ( = ?auto_633674 ?auto_633676 ) ) ( not ( = ?auto_633674 ?auto_633677 ) ) ( not ( = ?auto_633674 ?auto_633678 ) ) ( not ( = ?auto_633675 ?auto_633676 ) ) ( not ( = ?auto_633675 ?auto_633677 ) ) ( not ( = ?auto_633675 ?auto_633678 ) ) ( not ( = ?auto_633676 ?auto_633677 ) ) ( not ( = ?auto_633676 ?auto_633678 ) ) ( not ( = ?auto_633677 ?auto_633678 ) ) ( ON ?auto_633676 ?auto_633677 ) ( ON ?auto_633675 ?auto_633676 ) ( ON ?auto_633674 ?auto_633675 ) ( ON ?auto_633673 ?auto_633674 ) ( ON ?auto_633672 ?auto_633673 ) ( ON ?auto_633671 ?auto_633672 ) ( ON ?auto_633670 ?auto_633671 ) ( ON ?auto_633669 ?auto_633670 ) ( ON ?auto_633668 ?auto_633669 ) ( ON ?auto_633667 ?auto_633668 ) ( CLEAR ?auto_633665 ) ( ON ?auto_633666 ?auto_633667 ) ( CLEAR ?auto_633666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_633662 ?auto_633663 ?auto_633664 ?auto_633665 ?auto_633666 )
      ( MAKE-16PILE ?auto_633662 ?auto_633663 ?auto_633664 ?auto_633665 ?auto_633666 ?auto_633667 ?auto_633668 ?auto_633669 ?auto_633670 ?auto_633671 ?auto_633672 ?auto_633673 ?auto_633674 ?auto_633675 ?auto_633676 ?auto_633677 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633728 - BLOCK
      ?auto_633729 - BLOCK
      ?auto_633730 - BLOCK
      ?auto_633731 - BLOCK
      ?auto_633732 - BLOCK
      ?auto_633733 - BLOCK
      ?auto_633734 - BLOCK
      ?auto_633735 - BLOCK
      ?auto_633736 - BLOCK
      ?auto_633737 - BLOCK
      ?auto_633738 - BLOCK
      ?auto_633739 - BLOCK
      ?auto_633740 - BLOCK
      ?auto_633741 - BLOCK
      ?auto_633742 - BLOCK
      ?auto_633743 - BLOCK
    )
    :vars
    (
      ?auto_633744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633743 ?auto_633744 ) ( ON-TABLE ?auto_633728 ) ( ON ?auto_633729 ?auto_633728 ) ( ON ?auto_633730 ?auto_633729 ) ( not ( = ?auto_633728 ?auto_633729 ) ) ( not ( = ?auto_633728 ?auto_633730 ) ) ( not ( = ?auto_633728 ?auto_633731 ) ) ( not ( = ?auto_633728 ?auto_633732 ) ) ( not ( = ?auto_633728 ?auto_633733 ) ) ( not ( = ?auto_633728 ?auto_633734 ) ) ( not ( = ?auto_633728 ?auto_633735 ) ) ( not ( = ?auto_633728 ?auto_633736 ) ) ( not ( = ?auto_633728 ?auto_633737 ) ) ( not ( = ?auto_633728 ?auto_633738 ) ) ( not ( = ?auto_633728 ?auto_633739 ) ) ( not ( = ?auto_633728 ?auto_633740 ) ) ( not ( = ?auto_633728 ?auto_633741 ) ) ( not ( = ?auto_633728 ?auto_633742 ) ) ( not ( = ?auto_633728 ?auto_633743 ) ) ( not ( = ?auto_633728 ?auto_633744 ) ) ( not ( = ?auto_633729 ?auto_633730 ) ) ( not ( = ?auto_633729 ?auto_633731 ) ) ( not ( = ?auto_633729 ?auto_633732 ) ) ( not ( = ?auto_633729 ?auto_633733 ) ) ( not ( = ?auto_633729 ?auto_633734 ) ) ( not ( = ?auto_633729 ?auto_633735 ) ) ( not ( = ?auto_633729 ?auto_633736 ) ) ( not ( = ?auto_633729 ?auto_633737 ) ) ( not ( = ?auto_633729 ?auto_633738 ) ) ( not ( = ?auto_633729 ?auto_633739 ) ) ( not ( = ?auto_633729 ?auto_633740 ) ) ( not ( = ?auto_633729 ?auto_633741 ) ) ( not ( = ?auto_633729 ?auto_633742 ) ) ( not ( = ?auto_633729 ?auto_633743 ) ) ( not ( = ?auto_633729 ?auto_633744 ) ) ( not ( = ?auto_633730 ?auto_633731 ) ) ( not ( = ?auto_633730 ?auto_633732 ) ) ( not ( = ?auto_633730 ?auto_633733 ) ) ( not ( = ?auto_633730 ?auto_633734 ) ) ( not ( = ?auto_633730 ?auto_633735 ) ) ( not ( = ?auto_633730 ?auto_633736 ) ) ( not ( = ?auto_633730 ?auto_633737 ) ) ( not ( = ?auto_633730 ?auto_633738 ) ) ( not ( = ?auto_633730 ?auto_633739 ) ) ( not ( = ?auto_633730 ?auto_633740 ) ) ( not ( = ?auto_633730 ?auto_633741 ) ) ( not ( = ?auto_633730 ?auto_633742 ) ) ( not ( = ?auto_633730 ?auto_633743 ) ) ( not ( = ?auto_633730 ?auto_633744 ) ) ( not ( = ?auto_633731 ?auto_633732 ) ) ( not ( = ?auto_633731 ?auto_633733 ) ) ( not ( = ?auto_633731 ?auto_633734 ) ) ( not ( = ?auto_633731 ?auto_633735 ) ) ( not ( = ?auto_633731 ?auto_633736 ) ) ( not ( = ?auto_633731 ?auto_633737 ) ) ( not ( = ?auto_633731 ?auto_633738 ) ) ( not ( = ?auto_633731 ?auto_633739 ) ) ( not ( = ?auto_633731 ?auto_633740 ) ) ( not ( = ?auto_633731 ?auto_633741 ) ) ( not ( = ?auto_633731 ?auto_633742 ) ) ( not ( = ?auto_633731 ?auto_633743 ) ) ( not ( = ?auto_633731 ?auto_633744 ) ) ( not ( = ?auto_633732 ?auto_633733 ) ) ( not ( = ?auto_633732 ?auto_633734 ) ) ( not ( = ?auto_633732 ?auto_633735 ) ) ( not ( = ?auto_633732 ?auto_633736 ) ) ( not ( = ?auto_633732 ?auto_633737 ) ) ( not ( = ?auto_633732 ?auto_633738 ) ) ( not ( = ?auto_633732 ?auto_633739 ) ) ( not ( = ?auto_633732 ?auto_633740 ) ) ( not ( = ?auto_633732 ?auto_633741 ) ) ( not ( = ?auto_633732 ?auto_633742 ) ) ( not ( = ?auto_633732 ?auto_633743 ) ) ( not ( = ?auto_633732 ?auto_633744 ) ) ( not ( = ?auto_633733 ?auto_633734 ) ) ( not ( = ?auto_633733 ?auto_633735 ) ) ( not ( = ?auto_633733 ?auto_633736 ) ) ( not ( = ?auto_633733 ?auto_633737 ) ) ( not ( = ?auto_633733 ?auto_633738 ) ) ( not ( = ?auto_633733 ?auto_633739 ) ) ( not ( = ?auto_633733 ?auto_633740 ) ) ( not ( = ?auto_633733 ?auto_633741 ) ) ( not ( = ?auto_633733 ?auto_633742 ) ) ( not ( = ?auto_633733 ?auto_633743 ) ) ( not ( = ?auto_633733 ?auto_633744 ) ) ( not ( = ?auto_633734 ?auto_633735 ) ) ( not ( = ?auto_633734 ?auto_633736 ) ) ( not ( = ?auto_633734 ?auto_633737 ) ) ( not ( = ?auto_633734 ?auto_633738 ) ) ( not ( = ?auto_633734 ?auto_633739 ) ) ( not ( = ?auto_633734 ?auto_633740 ) ) ( not ( = ?auto_633734 ?auto_633741 ) ) ( not ( = ?auto_633734 ?auto_633742 ) ) ( not ( = ?auto_633734 ?auto_633743 ) ) ( not ( = ?auto_633734 ?auto_633744 ) ) ( not ( = ?auto_633735 ?auto_633736 ) ) ( not ( = ?auto_633735 ?auto_633737 ) ) ( not ( = ?auto_633735 ?auto_633738 ) ) ( not ( = ?auto_633735 ?auto_633739 ) ) ( not ( = ?auto_633735 ?auto_633740 ) ) ( not ( = ?auto_633735 ?auto_633741 ) ) ( not ( = ?auto_633735 ?auto_633742 ) ) ( not ( = ?auto_633735 ?auto_633743 ) ) ( not ( = ?auto_633735 ?auto_633744 ) ) ( not ( = ?auto_633736 ?auto_633737 ) ) ( not ( = ?auto_633736 ?auto_633738 ) ) ( not ( = ?auto_633736 ?auto_633739 ) ) ( not ( = ?auto_633736 ?auto_633740 ) ) ( not ( = ?auto_633736 ?auto_633741 ) ) ( not ( = ?auto_633736 ?auto_633742 ) ) ( not ( = ?auto_633736 ?auto_633743 ) ) ( not ( = ?auto_633736 ?auto_633744 ) ) ( not ( = ?auto_633737 ?auto_633738 ) ) ( not ( = ?auto_633737 ?auto_633739 ) ) ( not ( = ?auto_633737 ?auto_633740 ) ) ( not ( = ?auto_633737 ?auto_633741 ) ) ( not ( = ?auto_633737 ?auto_633742 ) ) ( not ( = ?auto_633737 ?auto_633743 ) ) ( not ( = ?auto_633737 ?auto_633744 ) ) ( not ( = ?auto_633738 ?auto_633739 ) ) ( not ( = ?auto_633738 ?auto_633740 ) ) ( not ( = ?auto_633738 ?auto_633741 ) ) ( not ( = ?auto_633738 ?auto_633742 ) ) ( not ( = ?auto_633738 ?auto_633743 ) ) ( not ( = ?auto_633738 ?auto_633744 ) ) ( not ( = ?auto_633739 ?auto_633740 ) ) ( not ( = ?auto_633739 ?auto_633741 ) ) ( not ( = ?auto_633739 ?auto_633742 ) ) ( not ( = ?auto_633739 ?auto_633743 ) ) ( not ( = ?auto_633739 ?auto_633744 ) ) ( not ( = ?auto_633740 ?auto_633741 ) ) ( not ( = ?auto_633740 ?auto_633742 ) ) ( not ( = ?auto_633740 ?auto_633743 ) ) ( not ( = ?auto_633740 ?auto_633744 ) ) ( not ( = ?auto_633741 ?auto_633742 ) ) ( not ( = ?auto_633741 ?auto_633743 ) ) ( not ( = ?auto_633741 ?auto_633744 ) ) ( not ( = ?auto_633742 ?auto_633743 ) ) ( not ( = ?auto_633742 ?auto_633744 ) ) ( not ( = ?auto_633743 ?auto_633744 ) ) ( ON ?auto_633742 ?auto_633743 ) ( ON ?auto_633741 ?auto_633742 ) ( ON ?auto_633740 ?auto_633741 ) ( ON ?auto_633739 ?auto_633740 ) ( ON ?auto_633738 ?auto_633739 ) ( ON ?auto_633737 ?auto_633738 ) ( ON ?auto_633736 ?auto_633737 ) ( ON ?auto_633735 ?auto_633736 ) ( ON ?auto_633734 ?auto_633735 ) ( ON ?auto_633733 ?auto_633734 ) ( ON ?auto_633732 ?auto_633733 ) ( CLEAR ?auto_633730 ) ( ON ?auto_633731 ?auto_633732 ) ( CLEAR ?auto_633731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_633728 ?auto_633729 ?auto_633730 ?auto_633731 )
      ( MAKE-16PILE ?auto_633728 ?auto_633729 ?auto_633730 ?auto_633731 ?auto_633732 ?auto_633733 ?auto_633734 ?auto_633735 ?auto_633736 ?auto_633737 ?auto_633738 ?auto_633739 ?auto_633740 ?auto_633741 ?auto_633742 ?auto_633743 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633794 - BLOCK
      ?auto_633795 - BLOCK
      ?auto_633796 - BLOCK
      ?auto_633797 - BLOCK
      ?auto_633798 - BLOCK
      ?auto_633799 - BLOCK
      ?auto_633800 - BLOCK
      ?auto_633801 - BLOCK
      ?auto_633802 - BLOCK
      ?auto_633803 - BLOCK
      ?auto_633804 - BLOCK
      ?auto_633805 - BLOCK
      ?auto_633806 - BLOCK
      ?auto_633807 - BLOCK
      ?auto_633808 - BLOCK
      ?auto_633809 - BLOCK
    )
    :vars
    (
      ?auto_633810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633809 ?auto_633810 ) ( ON-TABLE ?auto_633794 ) ( ON ?auto_633795 ?auto_633794 ) ( not ( = ?auto_633794 ?auto_633795 ) ) ( not ( = ?auto_633794 ?auto_633796 ) ) ( not ( = ?auto_633794 ?auto_633797 ) ) ( not ( = ?auto_633794 ?auto_633798 ) ) ( not ( = ?auto_633794 ?auto_633799 ) ) ( not ( = ?auto_633794 ?auto_633800 ) ) ( not ( = ?auto_633794 ?auto_633801 ) ) ( not ( = ?auto_633794 ?auto_633802 ) ) ( not ( = ?auto_633794 ?auto_633803 ) ) ( not ( = ?auto_633794 ?auto_633804 ) ) ( not ( = ?auto_633794 ?auto_633805 ) ) ( not ( = ?auto_633794 ?auto_633806 ) ) ( not ( = ?auto_633794 ?auto_633807 ) ) ( not ( = ?auto_633794 ?auto_633808 ) ) ( not ( = ?auto_633794 ?auto_633809 ) ) ( not ( = ?auto_633794 ?auto_633810 ) ) ( not ( = ?auto_633795 ?auto_633796 ) ) ( not ( = ?auto_633795 ?auto_633797 ) ) ( not ( = ?auto_633795 ?auto_633798 ) ) ( not ( = ?auto_633795 ?auto_633799 ) ) ( not ( = ?auto_633795 ?auto_633800 ) ) ( not ( = ?auto_633795 ?auto_633801 ) ) ( not ( = ?auto_633795 ?auto_633802 ) ) ( not ( = ?auto_633795 ?auto_633803 ) ) ( not ( = ?auto_633795 ?auto_633804 ) ) ( not ( = ?auto_633795 ?auto_633805 ) ) ( not ( = ?auto_633795 ?auto_633806 ) ) ( not ( = ?auto_633795 ?auto_633807 ) ) ( not ( = ?auto_633795 ?auto_633808 ) ) ( not ( = ?auto_633795 ?auto_633809 ) ) ( not ( = ?auto_633795 ?auto_633810 ) ) ( not ( = ?auto_633796 ?auto_633797 ) ) ( not ( = ?auto_633796 ?auto_633798 ) ) ( not ( = ?auto_633796 ?auto_633799 ) ) ( not ( = ?auto_633796 ?auto_633800 ) ) ( not ( = ?auto_633796 ?auto_633801 ) ) ( not ( = ?auto_633796 ?auto_633802 ) ) ( not ( = ?auto_633796 ?auto_633803 ) ) ( not ( = ?auto_633796 ?auto_633804 ) ) ( not ( = ?auto_633796 ?auto_633805 ) ) ( not ( = ?auto_633796 ?auto_633806 ) ) ( not ( = ?auto_633796 ?auto_633807 ) ) ( not ( = ?auto_633796 ?auto_633808 ) ) ( not ( = ?auto_633796 ?auto_633809 ) ) ( not ( = ?auto_633796 ?auto_633810 ) ) ( not ( = ?auto_633797 ?auto_633798 ) ) ( not ( = ?auto_633797 ?auto_633799 ) ) ( not ( = ?auto_633797 ?auto_633800 ) ) ( not ( = ?auto_633797 ?auto_633801 ) ) ( not ( = ?auto_633797 ?auto_633802 ) ) ( not ( = ?auto_633797 ?auto_633803 ) ) ( not ( = ?auto_633797 ?auto_633804 ) ) ( not ( = ?auto_633797 ?auto_633805 ) ) ( not ( = ?auto_633797 ?auto_633806 ) ) ( not ( = ?auto_633797 ?auto_633807 ) ) ( not ( = ?auto_633797 ?auto_633808 ) ) ( not ( = ?auto_633797 ?auto_633809 ) ) ( not ( = ?auto_633797 ?auto_633810 ) ) ( not ( = ?auto_633798 ?auto_633799 ) ) ( not ( = ?auto_633798 ?auto_633800 ) ) ( not ( = ?auto_633798 ?auto_633801 ) ) ( not ( = ?auto_633798 ?auto_633802 ) ) ( not ( = ?auto_633798 ?auto_633803 ) ) ( not ( = ?auto_633798 ?auto_633804 ) ) ( not ( = ?auto_633798 ?auto_633805 ) ) ( not ( = ?auto_633798 ?auto_633806 ) ) ( not ( = ?auto_633798 ?auto_633807 ) ) ( not ( = ?auto_633798 ?auto_633808 ) ) ( not ( = ?auto_633798 ?auto_633809 ) ) ( not ( = ?auto_633798 ?auto_633810 ) ) ( not ( = ?auto_633799 ?auto_633800 ) ) ( not ( = ?auto_633799 ?auto_633801 ) ) ( not ( = ?auto_633799 ?auto_633802 ) ) ( not ( = ?auto_633799 ?auto_633803 ) ) ( not ( = ?auto_633799 ?auto_633804 ) ) ( not ( = ?auto_633799 ?auto_633805 ) ) ( not ( = ?auto_633799 ?auto_633806 ) ) ( not ( = ?auto_633799 ?auto_633807 ) ) ( not ( = ?auto_633799 ?auto_633808 ) ) ( not ( = ?auto_633799 ?auto_633809 ) ) ( not ( = ?auto_633799 ?auto_633810 ) ) ( not ( = ?auto_633800 ?auto_633801 ) ) ( not ( = ?auto_633800 ?auto_633802 ) ) ( not ( = ?auto_633800 ?auto_633803 ) ) ( not ( = ?auto_633800 ?auto_633804 ) ) ( not ( = ?auto_633800 ?auto_633805 ) ) ( not ( = ?auto_633800 ?auto_633806 ) ) ( not ( = ?auto_633800 ?auto_633807 ) ) ( not ( = ?auto_633800 ?auto_633808 ) ) ( not ( = ?auto_633800 ?auto_633809 ) ) ( not ( = ?auto_633800 ?auto_633810 ) ) ( not ( = ?auto_633801 ?auto_633802 ) ) ( not ( = ?auto_633801 ?auto_633803 ) ) ( not ( = ?auto_633801 ?auto_633804 ) ) ( not ( = ?auto_633801 ?auto_633805 ) ) ( not ( = ?auto_633801 ?auto_633806 ) ) ( not ( = ?auto_633801 ?auto_633807 ) ) ( not ( = ?auto_633801 ?auto_633808 ) ) ( not ( = ?auto_633801 ?auto_633809 ) ) ( not ( = ?auto_633801 ?auto_633810 ) ) ( not ( = ?auto_633802 ?auto_633803 ) ) ( not ( = ?auto_633802 ?auto_633804 ) ) ( not ( = ?auto_633802 ?auto_633805 ) ) ( not ( = ?auto_633802 ?auto_633806 ) ) ( not ( = ?auto_633802 ?auto_633807 ) ) ( not ( = ?auto_633802 ?auto_633808 ) ) ( not ( = ?auto_633802 ?auto_633809 ) ) ( not ( = ?auto_633802 ?auto_633810 ) ) ( not ( = ?auto_633803 ?auto_633804 ) ) ( not ( = ?auto_633803 ?auto_633805 ) ) ( not ( = ?auto_633803 ?auto_633806 ) ) ( not ( = ?auto_633803 ?auto_633807 ) ) ( not ( = ?auto_633803 ?auto_633808 ) ) ( not ( = ?auto_633803 ?auto_633809 ) ) ( not ( = ?auto_633803 ?auto_633810 ) ) ( not ( = ?auto_633804 ?auto_633805 ) ) ( not ( = ?auto_633804 ?auto_633806 ) ) ( not ( = ?auto_633804 ?auto_633807 ) ) ( not ( = ?auto_633804 ?auto_633808 ) ) ( not ( = ?auto_633804 ?auto_633809 ) ) ( not ( = ?auto_633804 ?auto_633810 ) ) ( not ( = ?auto_633805 ?auto_633806 ) ) ( not ( = ?auto_633805 ?auto_633807 ) ) ( not ( = ?auto_633805 ?auto_633808 ) ) ( not ( = ?auto_633805 ?auto_633809 ) ) ( not ( = ?auto_633805 ?auto_633810 ) ) ( not ( = ?auto_633806 ?auto_633807 ) ) ( not ( = ?auto_633806 ?auto_633808 ) ) ( not ( = ?auto_633806 ?auto_633809 ) ) ( not ( = ?auto_633806 ?auto_633810 ) ) ( not ( = ?auto_633807 ?auto_633808 ) ) ( not ( = ?auto_633807 ?auto_633809 ) ) ( not ( = ?auto_633807 ?auto_633810 ) ) ( not ( = ?auto_633808 ?auto_633809 ) ) ( not ( = ?auto_633808 ?auto_633810 ) ) ( not ( = ?auto_633809 ?auto_633810 ) ) ( ON ?auto_633808 ?auto_633809 ) ( ON ?auto_633807 ?auto_633808 ) ( ON ?auto_633806 ?auto_633807 ) ( ON ?auto_633805 ?auto_633806 ) ( ON ?auto_633804 ?auto_633805 ) ( ON ?auto_633803 ?auto_633804 ) ( ON ?auto_633802 ?auto_633803 ) ( ON ?auto_633801 ?auto_633802 ) ( ON ?auto_633800 ?auto_633801 ) ( ON ?auto_633799 ?auto_633800 ) ( ON ?auto_633798 ?auto_633799 ) ( ON ?auto_633797 ?auto_633798 ) ( CLEAR ?auto_633795 ) ( ON ?auto_633796 ?auto_633797 ) ( CLEAR ?auto_633796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_633794 ?auto_633795 ?auto_633796 )
      ( MAKE-16PILE ?auto_633794 ?auto_633795 ?auto_633796 ?auto_633797 ?auto_633798 ?auto_633799 ?auto_633800 ?auto_633801 ?auto_633802 ?auto_633803 ?auto_633804 ?auto_633805 ?auto_633806 ?auto_633807 ?auto_633808 ?auto_633809 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633860 - BLOCK
      ?auto_633861 - BLOCK
      ?auto_633862 - BLOCK
      ?auto_633863 - BLOCK
      ?auto_633864 - BLOCK
      ?auto_633865 - BLOCK
      ?auto_633866 - BLOCK
      ?auto_633867 - BLOCK
      ?auto_633868 - BLOCK
      ?auto_633869 - BLOCK
      ?auto_633870 - BLOCK
      ?auto_633871 - BLOCK
      ?auto_633872 - BLOCK
      ?auto_633873 - BLOCK
      ?auto_633874 - BLOCK
      ?auto_633875 - BLOCK
    )
    :vars
    (
      ?auto_633876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633875 ?auto_633876 ) ( ON-TABLE ?auto_633860 ) ( not ( = ?auto_633860 ?auto_633861 ) ) ( not ( = ?auto_633860 ?auto_633862 ) ) ( not ( = ?auto_633860 ?auto_633863 ) ) ( not ( = ?auto_633860 ?auto_633864 ) ) ( not ( = ?auto_633860 ?auto_633865 ) ) ( not ( = ?auto_633860 ?auto_633866 ) ) ( not ( = ?auto_633860 ?auto_633867 ) ) ( not ( = ?auto_633860 ?auto_633868 ) ) ( not ( = ?auto_633860 ?auto_633869 ) ) ( not ( = ?auto_633860 ?auto_633870 ) ) ( not ( = ?auto_633860 ?auto_633871 ) ) ( not ( = ?auto_633860 ?auto_633872 ) ) ( not ( = ?auto_633860 ?auto_633873 ) ) ( not ( = ?auto_633860 ?auto_633874 ) ) ( not ( = ?auto_633860 ?auto_633875 ) ) ( not ( = ?auto_633860 ?auto_633876 ) ) ( not ( = ?auto_633861 ?auto_633862 ) ) ( not ( = ?auto_633861 ?auto_633863 ) ) ( not ( = ?auto_633861 ?auto_633864 ) ) ( not ( = ?auto_633861 ?auto_633865 ) ) ( not ( = ?auto_633861 ?auto_633866 ) ) ( not ( = ?auto_633861 ?auto_633867 ) ) ( not ( = ?auto_633861 ?auto_633868 ) ) ( not ( = ?auto_633861 ?auto_633869 ) ) ( not ( = ?auto_633861 ?auto_633870 ) ) ( not ( = ?auto_633861 ?auto_633871 ) ) ( not ( = ?auto_633861 ?auto_633872 ) ) ( not ( = ?auto_633861 ?auto_633873 ) ) ( not ( = ?auto_633861 ?auto_633874 ) ) ( not ( = ?auto_633861 ?auto_633875 ) ) ( not ( = ?auto_633861 ?auto_633876 ) ) ( not ( = ?auto_633862 ?auto_633863 ) ) ( not ( = ?auto_633862 ?auto_633864 ) ) ( not ( = ?auto_633862 ?auto_633865 ) ) ( not ( = ?auto_633862 ?auto_633866 ) ) ( not ( = ?auto_633862 ?auto_633867 ) ) ( not ( = ?auto_633862 ?auto_633868 ) ) ( not ( = ?auto_633862 ?auto_633869 ) ) ( not ( = ?auto_633862 ?auto_633870 ) ) ( not ( = ?auto_633862 ?auto_633871 ) ) ( not ( = ?auto_633862 ?auto_633872 ) ) ( not ( = ?auto_633862 ?auto_633873 ) ) ( not ( = ?auto_633862 ?auto_633874 ) ) ( not ( = ?auto_633862 ?auto_633875 ) ) ( not ( = ?auto_633862 ?auto_633876 ) ) ( not ( = ?auto_633863 ?auto_633864 ) ) ( not ( = ?auto_633863 ?auto_633865 ) ) ( not ( = ?auto_633863 ?auto_633866 ) ) ( not ( = ?auto_633863 ?auto_633867 ) ) ( not ( = ?auto_633863 ?auto_633868 ) ) ( not ( = ?auto_633863 ?auto_633869 ) ) ( not ( = ?auto_633863 ?auto_633870 ) ) ( not ( = ?auto_633863 ?auto_633871 ) ) ( not ( = ?auto_633863 ?auto_633872 ) ) ( not ( = ?auto_633863 ?auto_633873 ) ) ( not ( = ?auto_633863 ?auto_633874 ) ) ( not ( = ?auto_633863 ?auto_633875 ) ) ( not ( = ?auto_633863 ?auto_633876 ) ) ( not ( = ?auto_633864 ?auto_633865 ) ) ( not ( = ?auto_633864 ?auto_633866 ) ) ( not ( = ?auto_633864 ?auto_633867 ) ) ( not ( = ?auto_633864 ?auto_633868 ) ) ( not ( = ?auto_633864 ?auto_633869 ) ) ( not ( = ?auto_633864 ?auto_633870 ) ) ( not ( = ?auto_633864 ?auto_633871 ) ) ( not ( = ?auto_633864 ?auto_633872 ) ) ( not ( = ?auto_633864 ?auto_633873 ) ) ( not ( = ?auto_633864 ?auto_633874 ) ) ( not ( = ?auto_633864 ?auto_633875 ) ) ( not ( = ?auto_633864 ?auto_633876 ) ) ( not ( = ?auto_633865 ?auto_633866 ) ) ( not ( = ?auto_633865 ?auto_633867 ) ) ( not ( = ?auto_633865 ?auto_633868 ) ) ( not ( = ?auto_633865 ?auto_633869 ) ) ( not ( = ?auto_633865 ?auto_633870 ) ) ( not ( = ?auto_633865 ?auto_633871 ) ) ( not ( = ?auto_633865 ?auto_633872 ) ) ( not ( = ?auto_633865 ?auto_633873 ) ) ( not ( = ?auto_633865 ?auto_633874 ) ) ( not ( = ?auto_633865 ?auto_633875 ) ) ( not ( = ?auto_633865 ?auto_633876 ) ) ( not ( = ?auto_633866 ?auto_633867 ) ) ( not ( = ?auto_633866 ?auto_633868 ) ) ( not ( = ?auto_633866 ?auto_633869 ) ) ( not ( = ?auto_633866 ?auto_633870 ) ) ( not ( = ?auto_633866 ?auto_633871 ) ) ( not ( = ?auto_633866 ?auto_633872 ) ) ( not ( = ?auto_633866 ?auto_633873 ) ) ( not ( = ?auto_633866 ?auto_633874 ) ) ( not ( = ?auto_633866 ?auto_633875 ) ) ( not ( = ?auto_633866 ?auto_633876 ) ) ( not ( = ?auto_633867 ?auto_633868 ) ) ( not ( = ?auto_633867 ?auto_633869 ) ) ( not ( = ?auto_633867 ?auto_633870 ) ) ( not ( = ?auto_633867 ?auto_633871 ) ) ( not ( = ?auto_633867 ?auto_633872 ) ) ( not ( = ?auto_633867 ?auto_633873 ) ) ( not ( = ?auto_633867 ?auto_633874 ) ) ( not ( = ?auto_633867 ?auto_633875 ) ) ( not ( = ?auto_633867 ?auto_633876 ) ) ( not ( = ?auto_633868 ?auto_633869 ) ) ( not ( = ?auto_633868 ?auto_633870 ) ) ( not ( = ?auto_633868 ?auto_633871 ) ) ( not ( = ?auto_633868 ?auto_633872 ) ) ( not ( = ?auto_633868 ?auto_633873 ) ) ( not ( = ?auto_633868 ?auto_633874 ) ) ( not ( = ?auto_633868 ?auto_633875 ) ) ( not ( = ?auto_633868 ?auto_633876 ) ) ( not ( = ?auto_633869 ?auto_633870 ) ) ( not ( = ?auto_633869 ?auto_633871 ) ) ( not ( = ?auto_633869 ?auto_633872 ) ) ( not ( = ?auto_633869 ?auto_633873 ) ) ( not ( = ?auto_633869 ?auto_633874 ) ) ( not ( = ?auto_633869 ?auto_633875 ) ) ( not ( = ?auto_633869 ?auto_633876 ) ) ( not ( = ?auto_633870 ?auto_633871 ) ) ( not ( = ?auto_633870 ?auto_633872 ) ) ( not ( = ?auto_633870 ?auto_633873 ) ) ( not ( = ?auto_633870 ?auto_633874 ) ) ( not ( = ?auto_633870 ?auto_633875 ) ) ( not ( = ?auto_633870 ?auto_633876 ) ) ( not ( = ?auto_633871 ?auto_633872 ) ) ( not ( = ?auto_633871 ?auto_633873 ) ) ( not ( = ?auto_633871 ?auto_633874 ) ) ( not ( = ?auto_633871 ?auto_633875 ) ) ( not ( = ?auto_633871 ?auto_633876 ) ) ( not ( = ?auto_633872 ?auto_633873 ) ) ( not ( = ?auto_633872 ?auto_633874 ) ) ( not ( = ?auto_633872 ?auto_633875 ) ) ( not ( = ?auto_633872 ?auto_633876 ) ) ( not ( = ?auto_633873 ?auto_633874 ) ) ( not ( = ?auto_633873 ?auto_633875 ) ) ( not ( = ?auto_633873 ?auto_633876 ) ) ( not ( = ?auto_633874 ?auto_633875 ) ) ( not ( = ?auto_633874 ?auto_633876 ) ) ( not ( = ?auto_633875 ?auto_633876 ) ) ( ON ?auto_633874 ?auto_633875 ) ( ON ?auto_633873 ?auto_633874 ) ( ON ?auto_633872 ?auto_633873 ) ( ON ?auto_633871 ?auto_633872 ) ( ON ?auto_633870 ?auto_633871 ) ( ON ?auto_633869 ?auto_633870 ) ( ON ?auto_633868 ?auto_633869 ) ( ON ?auto_633867 ?auto_633868 ) ( ON ?auto_633866 ?auto_633867 ) ( ON ?auto_633865 ?auto_633866 ) ( ON ?auto_633864 ?auto_633865 ) ( ON ?auto_633863 ?auto_633864 ) ( ON ?auto_633862 ?auto_633863 ) ( CLEAR ?auto_633860 ) ( ON ?auto_633861 ?auto_633862 ) ( CLEAR ?auto_633861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_633860 ?auto_633861 )
      ( MAKE-16PILE ?auto_633860 ?auto_633861 ?auto_633862 ?auto_633863 ?auto_633864 ?auto_633865 ?auto_633866 ?auto_633867 ?auto_633868 ?auto_633869 ?auto_633870 ?auto_633871 ?auto_633872 ?auto_633873 ?auto_633874 ?auto_633875 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_633926 - BLOCK
      ?auto_633927 - BLOCK
      ?auto_633928 - BLOCK
      ?auto_633929 - BLOCK
      ?auto_633930 - BLOCK
      ?auto_633931 - BLOCK
      ?auto_633932 - BLOCK
      ?auto_633933 - BLOCK
      ?auto_633934 - BLOCK
      ?auto_633935 - BLOCK
      ?auto_633936 - BLOCK
      ?auto_633937 - BLOCK
      ?auto_633938 - BLOCK
      ?auto_633939 - BLOCK
      ?auto_633940 - BLOCK
      ?auto_633941 - BLOCK
    )
    :vars
    (
      ?auto_633942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_633941 ?auto_633942 ) ( not ( = ?auto_633926 ?auto_633927 ) ) ( not ( = ?auto_633926 ?auto_633928 ) ) ( not ( = ?auto_633926 ?auto_633929 ) ) ( not ( = ?auto_633926 ?auto_633930 ) ) ( not ( = ?auto_633926 ?auto_633931 ) ) ( not ( = ?auto_633926 ?auto_633932 ) ) ( not ( = ?auto_633926 ?auto_633933 ) ) ( not ( = ?auto_633926 ?auto_633934 ) ) ( not ( = ?auto_633926 ?auto_633935 ) ) ( not ( = ?auto_633926 ?auto_633936 ) ) ( not ( = ?auto_633926 ?auto_633937 ) ) ( not ( = ?auto_633926 ?auto_633938 ) ) ( not ( = ?auto_633926 ?auto_633939 ) ) ( not ( = ?auto_633926 ?auto_633940 ) ) ( not ( = ?auto_633926 ?auto_633941 ) ) ( not ( = ?auto_633926 ?auto_633942 ) ) ( not ( = ?auto_633927 ?auto_633928 ) ) ( not ( = ?auto_633927 ?auto_633929 ) ) ( not ( = ?auto_633927 ?auto_633930 ) ) ( not ( = ?auto_633927 ?auto_633931 ) ) ( not ( = ?auto_633927 ?auto_633932 ) ) ( not ( = ?auto_633927 ?auto_633933 ) ) ( not ( = ?auto_633927 ?auto_633934 ) ) ( not ( = ?auto_633927 ?auto_633935 ) ) ( not ( = ?auto_633927 ?auto_633936 ) ) ( not ( = ?auto_633927 ?auto_633937 ) ) ( not ( = ?auto_633927 ?auto_633938 ) ) ( not ( = ?auto_633927 ?auto_633939 ) ) ( not ( = ?auto_633927 ?auto_633940 ) ) ( not ( = ?auto_633927 ?auto_633941 ) ) ( not ( = ?auto_633927 ?auto_633942 ) ) ( not ( = ?auto_633928 ?auto_633929 ) ) ( not ( = ?auto_633928 ?auto_633930 ) ) ( not ( = ?auto_633928 ?auto_633931 ) ) ( not ( = ?auto_633928 ?auto_633932 ) ) ( not ( = ?auto_633928 ?auto_633933 ) ) ( not ( = ?auto_633928 ?auto_633934 ) ) ( not ( = ?auto_633928 ?auto_633935 ) ) ( not ( = ?auto_633928 ?auto_633936 ) ) ( not ( = ?auto_633928 ?auto_633937 ) ) ( not ( = ?auto_633928 ?auto_633938 ) ) ( not ( = ?auto_633928 ?auto_633939 ) ) ( not ( = ?auto_633928 ?auto_633940 ) ) ( not ( = ?auto_633928 ?auto_633941 ) ) ( not ( = ?auto_633928 ?auto_633942 ) ) ( not ( = ?auto_633929 ?auto_633930 ) ) ( not ( = ?auto_633929 ?auto_633931 ) ) ( not ( = ?auto_633929 ?auto_633932 ) ) ( not ( = ?auto_633929 ?auto_633933 ) ) ( not ( = ?auto_633929 ?auto_633934 ) ) ( not ( = ?auto_633929 ?auto_633935 ) ) ( not ( = ?auto_633929 ?auto_633936 ) ) ( not ( = ?auto_633929 ?auto_633937 ) ) ( not ( = ?auto_633929 ?auto_633938 ) ) ( not ( = ?auto_633929 ?auto_633939 ) ) ( not ( = ?auto_633929 ?auto_633940 ) ) ( not ( = ?auto_633929 ?auto_633941 ) ) ( not ( = ?auto_633929 ?auto_633942 ) ) ( not ( = ?auto_633930 ?auto_633931 ) ) ( not ( = ?auto_633930 ?auto_633932 ) ) ( not ( = ?auto_633930 ?auto_633933 ) ) ( not ( = ?auto_633930 ?auto_633934 ) ) ( not ( = ?auto_633930 ?auto_633935 ) ) ( not ( = ?auto_633930 ?auto_633936 ) ) ( not ( = ?auto_633930 ?auto_633937 ) ) ( not ( = ?auto_633930 ?auto_633938 ) ) ( not ( = ?auto_633930 ?auto_633939 ) ) ( not ( = ?auto_633930 ?auto_633940 ) ) ( not ( = ?auto_633930 ?auto_633941 ) ) ( not ( = ?auto_633930 ?auto_633942 ) ) ( not ( = ?auto_633931 ?auto_633932 ) ) ( not ( = ?auto_633931 ?auto_633933 ) ) ( not ( = ?auto_633931 ?auto_633934 ) ) ( not ( = ?auto_633931 ?auto_633935 ) ) ( not ( = ?auto_633931 ?auto_633936 ) ) ( not ( = ?auto_633931 ?auto_633937 ) ) ( not ( = ?auto_633931 ?auto_633938 ) ) ( not ( = ?auto_633931 ?auto_633939 ) ) ( not ( = ?auto_633931 ?auto_633940 ) ) ( not ( = ?auto_633931 ?auto_633941 ) ) ( not ( = ?auto_633931 ?auto_633942 ) ) ( not ( = ?auto_633932 ?auto_633933 ) ) ( not ( = ?auto_633932 ?auto_633934 ) ) ( not ( = ?auto_633932 ?auto_633935 ) ) ( not ( = ?auto_633932 ?auto_633936 ) ) ( not ( = ?auto_633932 ?auto_633937 ) ) ( not ( = ?auto_633932 ?auto_633938 ) ) ( not ( = ?auto_633932 ?auto_633939 ) ) ( not ( = ?auto_633932 ?auto_633940 ) ) ( not ( = ?auto_633932 ?auto_633941 ) ) ( not ( = ?auto_633932 ?auto_633942 ) ) ( not ( = ?auto_633933 ?auto_633934 ) ) ( not ( = ?auto_633933 ?auto_633935 ) ) ( not ( = ?auto_633933 ?auto_633936 ) ) ( not ( = ?auto_633933 ?auto_633937 ) ) ( not ( = ?auto_633933 ?auto_633938 ) ) ( not ( = ?auto_633933 ?auto_633939 ) ) ( not ( = ?auto_633933 ?auto_633940 ) ) ( not ( = ?auto_633933 ?auto_633941 ) ) ( not ( = ?auto_633933 ?auto_633942 ) ) ( not ( = ?auto_633934 ?auto_633935 ) ) ( not ( = ?auto_633934 ?auto_633936 ) ) ( not ( = ?auto_633934 ?auto_633937 ) ) ( not ( = ?auto_633934 ?auto_633938 ) ) ( not ( = ?auto_633934 ?auto_633939 ) ) ( not ( = ?auto_633934 ?auto_633940 ) ) ( not ( = ?auto_633934 ?auto_633941 ) ) ( not ( = ?auto_633934 ?auto_633942 ) ) ( not ( = ?auto_633935 ?auto_633936 ) ) ( not ( = ?auto_633935 ?auto_633937 ) ) ( not ( = ?auto_633935 ?auto_633938 ) ) ( not ( = ?auto_633935 ?auto_633939 ) ) ( not ( = ?auto_633935 ?auto_633940 ) ) ( not ( = ?auto_633935 ?auto_633941 ) ) ( not ( = ?auto_633935 ?auto_633942 ) ) ( not ( = ?auto_633936 ?auto_633937 ) ) ( not ( = ?auto_633936 ?auto_633938 ) ) ( not ( = ?auto_633936 ?auto_633939 ) ) ( not ( = ?auto_633936 ?auto_633940 ) ) ( not ( = ?auto_633936 ?auto_633941 ) ) ( not ( = ?auto_633936 ?auto_633942 ) ) ( not ( = ?auto_633937 ?auto_633938 ) ) ( not ( = ?auto_633937 ?auto_633939 ) ) ( not ( = ?auto_633937 ?auto_633940 ) ) ( not ( = ?auto_633937 ?auto_633941 ) ) ( not ( = ?auto_633937 ?auto_633942 ) ) ( not ( = ?auto_633938 ?auto_633939 ) ) ( not ( = ?auto_633938 ?auto_633940 ) ) ( not ( = ?auto_633938 ?auto_633941 ) ) ( not ( = ?auto_633938 ?auto_633942 ) ) ( not ( = ?auto_633939 ?auto_633940 ) ) ( not ( = ?auto_633939 ?auto_633941 ) ) ( not ( = ?auto_633939 ?auto_633942 ) ) ( not ( = ?auto_633940 ?auto_633941 ) ) ( not ( = ?auto_633940 ?auto_633942 ) ) ( not ( = ?auto_633941 ?auto_633942 ) ) ( ON ?auto_633940 ?auto_633941 ) ( ON ?auto_633939 ?auto_633940 ) ( ON ?auto_633938 ?auto_633939 ) ( ON ?auto_633937 ?auto_633938 ) ( ON ?auto_633936 ?auto_633937 ) ( ON ?auto_633935 ?auto_633936 ) ( ON ?auto_633934 ?auto_633935 ) ( ON ?auto_633933 ?auto_633934 ) ( ON ?auto_633932 ?auto_633933 ) ( ON ?auto_633931 ?auto_633932 ) ( ON ?auto_633930 ?auto_633931 ) ( ON ?auto_633929 ?auto_633930 ) ( ON ?auto_633928 ?auto_633929 ) ( ON ?auto_633927 ?auto_633928 ) ( ON ?auto_633926 ?auto_633927 ) ( CLEAR ?auto_633926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_633926 )
      ( MAKE-16PILE ?auto_633926 ?auto_633927 ?auto_633928 ?auto_633929 ?auto_633930 ?auto_633931 ?auto_633932 ?auto_633933 ?auto_633934 ?auto_633935 ?auto_633936 ?auto_633937 ?auto_633938 ?auto_633939 ?auto_633940 ?auto_633941 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_633993 - BLOCK
      ?auto_633994 - BLOCK
      ?auto_633995 - BLOCK
      ?auto_633996 - BLOCK
      ?auto_633997 - BLOCK
      ?auto_633998 - BLOCK
      ?auto_633999 - BLOCK
      ?auto_634000 - BLOCK
      ?auto_634001 - BLOCK
      ?auto_634002 - BLOCK
      ?auto_634003 - BLOCK
      ?auto_634004 - BLOCK
      ?auto_634005 - BLOCK
      ?auto_634006 - BLOCK
      ?auto_634007 - BLOCK
      ?auto_634008 - BLOCK
      ?auto_634009 - BLOCK
    )
    :vars
    (
      ?auto_634010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_634008 ) ( ON ?auto_634009 ?auto_634010 ) ( CLEAR ?auto_634009 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_633993 ) ( ON ?auto_633994 ?auto_633993 ) ( ON ?auto_633995 ?auto_633994 ) ( ON ?auto_633996 ?auto_633995 ) ( ON ?auto_633997 ?auto_633996 ) ( ON ?auto_633998 ?auto_633997 ) ( ON ?auto_633999 ?auto_633998 ) ( ON ?auto_634000 ?auto_633999 ) ( ON ?auto_634001 ?auto_634000 ) ( ON ?auto_634002 ?auto_634001 ) ( ON ?auto_634003 ?auto_634002 ) ( ON ?auto_634004 ?auto_634003 ) ( ON ?auto_634005 ?auto_634004 ) ( ON ?auto_634006 ?auto_634005 ) ( ON ?auto_634007 ?auto_634006 ) ( ON ?auto_634008 ?auto_634007 ) ( not ( = ?auto_633993 ?auto_633994 ) ) ( not ( = ?auto_633993 ?auto_633995 ) ) ( not ( = ?auto_633993 ?auto_633996 ) ) ( not ( = ?auto_633993 ?auto_633997 ) ) ( not ( = ?auto_633993 ?auto_633998 ) ) ( not ( = ?auto_633993 ?auto_633999 ) ) ( not ( = ?auto_633993 ?auto_634000 ) ) ( not ( = ?auto_633993 ?auto_634001 ) ) ( not ( = ?auto_633993 ?auto_634002 ) ) ( not ( = ?auto_633993 ?auto_634003 ) ) ( not ( = ?auto_633993 ?auto_634004 ) ) ( not ( = ?auto_633993 ?auto_634005 ) ) ( not ( = ?auto_633993 ?auto_634006 ) ) ( not ( = ?auto_633993 ?auto_634007 ) ) ( not ( = ?auto_633993 ?auto_634008 ) ) ( not ( = ?auto_633993 ?auto_634009 ) ) ( not ( = ?auto_633993 ?auto_634010 ) ) ( not ( = ?auto_633994 ?auto_633995 ) ) ( not ( = ?auto_633994 ?auto_633996 ) ) ( not ( = ?auto_633994 ?auto_633997 ) ) ( not ( = ?auto_633994 ?auto_633998 ) ) ( not ( = ?auto_633994 ?auto_633999 ) ) ( not ( = ?auto_633994 ?auto_634000 ) ) ( not ( = ?auto_633994 ?auto_634001 ) ) ( not ( = ?auto_633994 ?auto_634002 ) ) ( not ( = ?auto_633994 ?auto_634003 ) ) ( not ( = ?auto_633994 ?auto_634004 ) ) ( not ( = ?auto_633994 ?auto_634005 ) ) ( not ( = ?auto_633994 ?auto_634006 ) ) ( not ( = ?auto_633994 ?auto_634007 ) ) ( not ( = ?auto_633994 ?auto_634008 ) ) ( not ( = ?auto_633994 ?auto_634009 ) ) ( not ( = ?auto_633994 ?auto_634010 ) ) ( not ( = ?auto_633995 ?auto_633996 ) ) ( not ( = ?auto_633995 ?auto_633997 ) ) ( not ( = ?auto_633995 ?auto_633998 ) ) ( not ( = ?auto_633995 ?auto_633999 ) ) ( not ( = ?auto_633995 ?auto_634000 ) ) ( not ( = ?auto_633995 ?auto_634001 ) ) ( not ( = ?auto_633995 ?auto_634002 ) ) ( not ( = ?auto_633995 ?auto_634003 ) ) ( not ( = ?auto_633995 ?auto_634004 ) ) ( not ( = ?auto_633995 ?auto_634005 ) ) ( not ( = ?auto_633995 ?auto_634006 ) ) ( not ( = ?auto_633995 ?auto_634007 ) ) ( not ( = ?auto_633995 ?auto_634008 ) ) ( not ( = ?auto_633995 ?auto_634009 ) ) ( not ( = ?auto_633995 ?auto_634010 ) ) ( not ( = ?auto_633996 ?auto_633997 ) ) ( not ( = ?auto_633996 ?auto_633998 ) ) ( not ( = ?auto_633996 ?auto_633999 ) ) ( not ( = ?auto_633996 ?auto_634000 ) ) ( not ( = ?auto_633996 ?auto_634001 ) ) ( not ( = ?auto_633996 ?auto_634002 ) ) ( not ( = ?auto_633996 ?auto_634003 ) ) ( not ( = ?auto_633996 ?auto_634004 ) ) ( not ( = ?auto_633996 ?auto_634005 ) ) ( not ( = ?auto_633996 ?auto_634006 ) ) ( not ( = ?auto_633996 ?auto_634007 ) ) ( not ( = ?auto_633996 ?auto_634008 ) ) ( not ( = ?auto_633996 ?auto_634009 ) ) ( not ( = ?auto_633996 ?auto_634010 ) ) ( not ( = ?auto_633997 ?auto_633998 ) ) ( not ( = ?auto_633997 ?auto_633999 ) ) ( not ( = ?auto_633997 ?auto_634000 ) ) ( not ( = ?auto_633997 ?auto_634001 ) ) ( not ( = ?auto_633997 ?auto_634002 ) ) ( not ( = ?auto_633997 ?auto_634003 ) ) ( not ( = ?auto_633997 ?auto_634004 ) ) ( not ( = ?auto_633997 ?auto_634005 ) ) ( not ( = ?auto_633997 ?auto_634006 ) ) ( not ( = ?auto_633997 ?auto_634007 ) ) ( not ( = ?auto_633997 ?auto_634008 ) ) ( not ( = ?auto_633997 ?auto_634009 ) ) ( not ( = ?auto_633997 ?auto_634010 ) ) ( not ( = ?auto_633998 ?auto_633999 ) ) ( not ( = ?auto_633998 ?auto_634000 ) ) ( not ( = ?auto_633998 ?auto_634001 ) ) ( not ( = ?auto_633998 ?auto_634002 ) ) ( not ( = ?auto_633998 ?auto_634003 ) ) ( not ( = ?auto_633998 ?auto_634004 ) ) ( not ( = ?auto_633998 ?auto_634005 ) ) ( not ( = ?auto_633998 ?auto_634006 ) ) ( not ( = ?auto_633998 ?auto_634007 ) ) ( not ( = ?auto_633998 ?auto_634008 ) ) ( not ( = ?auto_633998 ?auto_634009 ) ) ( not ( = ?auto_633998 ?auto_634010 ) ) ( not ( = ?auto_633999 ?auto_634000 ) ) ( not ( = ?auto_633999 ?auto_634001 ) ) ( not ( = ?auto_633999 ?auto_634002 ) ) ( not ( = ?auto_633999 ?auto_634003 ) ) ( not ( = ?auto_633999 ?auto_634004 ) ) ( not ( = ?auto_633999 ?auto_634005 ) ) ( not ( = ?auto_633999 ?auto_634006 ) ) ( not ( = ?auto_633999 ?auto_634007 ) ) ( not ( = ?auto_633999 ?auto_634008 ) ) ( not ( = ?auto_633999 ?auto_634009 ) ) ( not ( = ?auto_633999 ?auto_634010 ) ) ( not ( = ?auto_634000 ?auto_634001 ) ) ( not ( = ?auto_634000 ?auto_634002 ) ) ( not ( = ?auto_634000 ?auto_634003 ) ) ( not ( = ?auto_634000 ?auto_634004 ) ) ( not ( = ?auto_634000 ?auto_634005 ) ) ( not ( = ?auto_634000 ?auto_634006 ) ) ( not ( = ?auto_634000 ?auto_634007 ) ) ( not ( = ?auto_634000 ?auto_634008 ) ) ( not ( = ?auto_634000 ?auto_634009 ) ) ( not ( = ?auto_634000 ?auto_634010 ) ) ( not ( = ?auto_634001 ?auto_634002 ) ) ( not ( = ?auto_634001 ?auto_634003 ) ) ( not ( = ?auto_634001 ?auto_634004 ) ) ( not ( = ?auto_634001 ?auto_634005 ) ) ( not ( = ?auto_634001 ?auto_634006 ) ) ( not ( = ?auto_634001 ?auto_634007 ) ) ( not ( = ?auto_634001 ?auto_634008 ) ) ( not ( = ?auto_634001 ?auto_634009 ) ) ( not ( = ?auto_634001 ?auto_634010 ) ) ( not ( = ?auto_634002 ?auto_634003 ) ) ( not ( = ?auto_634002 ?auto_634004 ) ) ( not ( = ?auto_634002 ?auto_634005 ) ) ( not ( = ?auto_634002 ?auto_634006 ) ) ( not ( = ?auto_634002 ?auto_634007 ) ) ( not ( = ?auto_634002 ?auto_634008 ) ) ( not ( = ?auto_634002 ?auto_634009 ) ) ( not ( = ?auto_634002 ?auto_634010 ) ) ( not ( = ?auto_634003 ?auto_634004 ) ) ( not ( = ?auto_634003 ?auto_634005 ) ) ( not ( = ?auto_634003 ?auto_634006 ) ) ( not ( = ?auto_634003 ?auto_634007 ) ) ( not ( = ?auto_634003 ?auto_634008 ) ) ( not ( = ?auto_634003 ?auto_634009 ) ) ( not ( = ?auto_634003 ?auto_634010 ) ) ( not ( = ?auto_634004 ?auto_634005 ) ) ( not ( = ?auto_634004 ?auto_634006 ) ) ( not ( = ?auto_634004 ?auto_634007 ) ) ( not ( = ?auto_634004 ?auto_634008 ) ) ( not ( = ?auto_634004 ?auto_634009 ) ) ( not ( = ?auto_634004 ?auto_634010 ) ) ( not ( = ?auto_634005 ?auto_634006 ) ) ( not ( = ?auto_634005 ?auto_634007 ) ) ( not ( = ?auto_634005 ?auto_634008 ) ) ( not ( = ?auto_634005 ?auto_634009 ) ) ( not ( = ?auto_634005 ?auto_634010 ) ) ( not ( = ?auto_634006 ?auto_634007 ) ) ( not ( = ?auto_634006 ?auto_634008 ) ) ( not ( = ?auto_634006 ?auto_634009 ) ) ( not ( = ?auto_634006 ?auto_634010 ) ) ( not ( = ?auto_634007 ?auto_634008 ) ) ( not ( = ?auto_634007 ?auto_634009 ) ) ( not ( = ?auto_634007 ?auto_634010 ) ) ( not ( = ?auto_634008 ?auto_634009 ) ) ( not ( = ?auto_634008 ?auto_634010 ) ) ( not ( = ?auto_634009 ?auto_634010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_634009 ?auto_634010 )
      ( !STACK ?auto_634009 ?auto_634008 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634028 - BLOCK
      ?auto_634029 - BLOCK
      ?auto_634030 - BLOCK
      ?auto_634031 - BLOCK
      ?auto_634032 - BLOCK
      ?auto_634033 - BLOCK
      ?auto_634034 - BLOCK
      ?auto_634035 - BLOCK
      ?auto_634036 - BLOCK
      ?auto_634037 - BLOCK
      ?auto_634038 - BLOCK
      ?auto_634039 - BLOCK
      ?auto_634040 - BLOCK
      ?auto_634041 - BLOCK
      ?auto_634042 - BLOCK
      ?auto_634043 - BLOCK
      ?auto_634044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_634043 ) ( ON-TABLE ?auto_634044 ) ( CLEAR ?auto_634044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_634028 ) ( ON ?auto_634029 ?auto_634028 ) ( ON ?auto_634030 ?auto_634029 ) ( ON ?auto_634031 ?auto_634030 ) ( ON ?auto_634032 ?auto_634031 ) ( ON ?auto_634033 ?auto_634032 ) ( ON ?auto_634034 ?auto_634033 ) ( ON ?auto_634035 ?auto_634034 ) ( ON ?auto_634036 ?auto_634035 ) ( ON ?auto_634037 ?auto_634036 ) ( ON ?auto_634038 ?auto_634037 ) ( ON ?auto_634039 ?auto_634038 ) ( ON ?auto_634040 ?auto_634039 ) ( ON ?auto_634041 ?auto_634040 ) ( ON ?auto_634042 ?auto_634041 ) ( ON ?auto_634043 ?auto_634042 ) ( not ( = ?auto_634028 ?auto_634029 ) ) ( not ( = ?auto_634028 ?auto_634030 ) ) ( not ( = ?auto_634028 ?auto_634031 ) ) ( not ( = ?auto_634028 ?auto_634032 ) ) ( not ( = ?auto_634028 ?auto_634033 ) ) ( not ( = ?auto_634028 ?auto_634034 ) ) ( not ( = ?auto_634028 ?auto_634035 ) ) ( not ( = ?auto_634028 ?auto_634036 ) ) ( not ( = ?auto_634028 ?auto_634037 ) ) ( not ( = ?auto_634028 ?auto_634038 ) ) ( not ( = ?auto_634028 ?auto_634039 ) ) ( not ( = ?auto_634028 ?auto_634040 ) ) ( not ( = ?auto_634028 ?auto_634041 ) ) ( not ( = ?auto_634028 ?auto_634042 ) ) ( not ( = ?auto_634028 ?auto_634043 ) ) ( not ( = ?auto_634028 ?auto_634044 ) ) ( not ( = ?auto_634029 ?auto_634030 ) ) ( not ( = ?auto_634029 ?auto_634031 ) ) ( not ( = ?auto_634029 ?auto_634032 ) ) ( not ( = ?auto_634029 ?auto_634033 ) ) ( not ( = ?auto_634029 ?auto_634034 ) ) ( not ( = ?auto_634029 ?auto_634035 ) ) ( not ( = ?auto_634029 ?auto_634036 ) ) ( not ( = ?auto_634029 ?auto_634037 ) ) ( not ( = ?auto_634029 ?auto_634038 ) ) ( not ( = ?auto_634029 ?auto_634039 ) ) ( not ( = ?auto_634029 ?auto_634040 ) ) ( not ( = ?auto_634029 ?auto_634041 ) ) ( not ( = ?auto_634029 ?auto_634042 ) ) ( not ( = ?auto_634029 ?auto_634043 ) ) ( not ( = ?auto_634029 ?auto_634044 ) ) ( not ( = ?auto_634030 ?auto_634031 ) ) ( not ( = ?auto_634030 ?auto_634032 ) ) ( not ( = ?auto_634030 ?auto_634033 ) ) ( not ( = ?auto_634030 ?auto_634034 ) ) ( not ( = ?auto_634030 ?auto_634035 ) ) ( not ( = ?auto_634030 ?auto_634036 ) ) ( not ( = ?auto_634030 ?auto_634037 ) ) ( not ( = ?auto_634030 ?auto_634038 ) ) ( not ( = ?auto_634030 ?auto_634039 ) ) ( not ( = ?auto_634030 ?auto_634040 ) ) ( not ( = ?auto_634030 ?auto_634041 ) ) ( not ( = ?auto_634030 ?auto_634042 ) ) ( not ( = ?auto_634030 ?auto_634043 ) ) ( not ( = ?auto_634030 ?auto_634044 ) ) ( not ( = ?auto_634031 ?auto_634032 ) ) ( not ( = ?auto_634031 ?auto_634033 ) ) ( not ( = ?auto_634031 ?auto_634034 ) ) ( not ( = ?auto_634031 ?auto_634035 ) ) ( not ( = ?auto_634031 ?auto_634036 ) ) ( not ( = ?auto_634031 ?auto_634037 ) ) ( not ( = ?auto_634031 ?auto_634038 ) ) ( not ( = ?auto_634031 ?auto_634039 ) ) ( not ( = ?auto_634031 ?auto_634040 ) ) ( not ( = ?auto_634031 ?auto_634041 ) ) ( not ( = ?auto_634031 ?auto_634042 ) ) ( not ( = ?auto_634031 ?auto_634043 ) ) ( not ( = ?auto_634031 ?auto_634044 ) ) ( not ( = ?auto_634032 ?auto_634033 ) ) ( not ( = ?auto_634032 ?auto_634034 ) ) ( not ( = ?auto_634032 ?auto_634035 ) ) ( not ( = ?auto_634032 ?auto_634036 ) ) ( not ( = ?auto_634032 ?auto_634037 ) ) ( not ( = ?auto_634032 ?auto_634038 ) ) ( not ( = ?auto_634032 ?auto_634039 ) ) ( not ( = ?auto_634032 ?auto_634040 ) ) ( not ( = ?auto_634032 ?auto_634041 ) ) ( not ( = ?auto_634032 ?auto_634042 ) ) ( not ( = ?auto_634032 ?auto_634043 ) ) ( not ( = ?auto_634032 ?auto_634044 ) ) ( not ( = ?auto_634033 ?auto_634034 ) ) ( not ( = ?auto_634033 ?auto_634035 ) ) ( not ( = ?auto_634033 ?auto_634036 ) ) ( not ( = ?auto_634033 ?auto_634037 ) ) ( not ( = ?auto_634033 ?auto_634038 ) ) ( not ( = ?auto_634033 ?auto_634039 ) ) ( not ( = ?auto_634033 ?auto_634040 ) ) ( not ( = ?auto_634033 ?auto_634041 ) ) ( not ( = ?auto_634033 ?auto_634042 ) ) ( not ( = ?auto_634033 ?auto_634043 ) ) ( not ( = ?auto_634033 ?auto_634044 ) ) ( not ( = ?auto_634034 ?auto_634035 ) ) ( not ( = ?auto_634034 ?auto_634036 ) ) ( not ( = ?auto_634034 ?auto_634037 ) ) ( not ( = ?auto_634034 ?auto_634038 ) ) ( not ( = ?auto_634034 ?auto_634039 ) ) ( not ( = ?auto_634034 ?auto_634040 ) ) ( not ( = ?auto_634034 ?auto_634041 ) ) ( not ( = ?auto_634034 ?auto_634042 ) ) ( not ( = ?auto_634034 ?auto_634043 ) ) ( not ( = ?auto_634034 ?auto_634044 ) ) ( not ( = ?auto_634035 ?auto_634036 ) ) ( not ( = ?auto_634035 ?auto_634037 ) ) ( not ( = ?auto_634035 ?auto_634038 ) ) ( not ( = ?auto_634035 ?auto_634039 ) ) ( not ( = ?auto_634035 ?auto_634040 ) ) ( not ( = ?auto_634035 ?auto_634041 ) ) ( not ( = ?auto_634035 ?auto_634042 ) ) ( not ( = ?auto_634035 ?auto_634043 ) ) ( not ( = ?auto_634035 ?auto_634044 ) ) ( not ( = ?auto_634036 ?auto_634037 ) ) ( not ( = ?auto_634036 ?auto_634038 ) ) ( not ( = ?auto_634036 ?auto_634039 ) ) ( not ( = ?auto_634036 ?auto_634040 ) ) ( not ( = ?auto_634036 ?auto_634041 ) ) ( not ( = ?auto_634036 ?auto_634042 ) ) ( not ( = ?auto_634036 ?auto_634043 ) ) ( not ( = ?auto_634036 ?auto_634044 ) ) ( not ( = ?auto_634037 ?auto_634038 ) ) ( not ( = ?auto_634037 ?auto_634039 ) ) ( not ( = ?auto_634037 ?auto_634040 ) ) ( not ( = ?auto_634037 ?auto_634041 ) ) ( not ( = ?auto_634037 ?auto_634042 ) ) ( not ( = ?auto_634037 ?auto_634043 ) ) ( not ( = ?auto_634037 ?auto_634044 ) ) ( not ( = ?auto_634038 ?auto_634039 ) ) ( not ( = ?auto_634038 ?auto_634040 ) ) ( not ( = ?auto_634038 ?auto_634041 ) ) ( not ( = ?auto_634038 ?auto_634042 ) ) ( not ( = ?auto_634038 ?auto_634043 ) ) ( not ( = ?auto_634038 ?auto_634044 ) ) ( not ( = ?auto_634039 ?auto_634040 ) ) ( not ( = ?auto_634039 ?auto_634041 ) ) ( not ( = ?auto_634039 ?auto_634042 ) ) ( not ( = ?auto_634039 ?auto_634043 ) ) ( not ( = ?auto_634039 ?auto_634044 ) ) ( not ( = ?auto_634040 ?auto_634041 ) ) ( not ( = ?auto_634040 ?auto_634042 ) ) ( not ( = ?auto_634040 ?auto_634043 ) ) ( not ( = ?auto_634040 ?auto_634044 ) ) ( not ( = ?auto_634041 ?auto_634042 ) ) ( not ( = ?auto_634041 ?auto_634043 ) ) ( not ( = ?auto_634041 ?auto_634044 ) ) ( not ( = ?auto_634042 ?auto_634043 ) ) ( not ( = ?auto_634042 ?auto_634044 ) ) ( not ( = ?auto_634043 ?auto_634044 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_634044 )
      ( !STACK ?auto_634044 ?auto_634043 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634062 - BLOCK
      ?auto_634063 - BLOCK
      ?auto_634064 - BLOCK
      ?auto_634065 - BLOCK
      ?auto_634066 - BLOCK
      ?auto_634067 - BLOCK
      ?auto_634068 - BLOCK
      ?auto_634069 - BLOCK
      ?auto_634070 - BLOCK
      ?auto_634071 - BLOCK
      ?auto_634072 - BLOCK
      ?auto_634073 - BLOCK
      ?auto_634074 - BLOCK
      ?auto_634075 - BLOCK
      ?auto_634076 - BLOCK
      ?auto_634077 - BLOCK
      ?auto_634078 - BLOCK
    )
    :vars
    (
      ?auto_634079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634078 ?auto_634079 ) ( ON-TABLE ?auto_634062 ) ( ON ?auto_634063 ?auto_634062 ) ( ON ?auto_634064 ?auto_634063 ) ( ON ?auto_634065 ?auto_634064 ) ( ON ?auto_634066 ?auto_634065 ) ( ON ?auto_634067 ?auto_634066 ) ( ON ?auto_634068 ?auto_634067 ) ( ON ?auto_634069 ?auto_634068 ) ( ON ?auto_634070 ?auto_634069 ) ( ON ?auto_634071 ?auto_634070 ) ( ON ?auto_634072 ?auto_634071 ) ( ON ?auto_634073 ?auto_634072 ) ( ON ?auto_634074 ?auto_634073 ) ( ON ?auto_634075 ?auto_634074 ) ( ON ?auto_634076 ?auto_634075 ) ( not ( = ?auto_634062 ?auto_634063 ) ) ( not ( = ?auto_634062 ?auto_634064 ) ) ( not ( = ?auto_634062 ?auto_634065 ) ) ( not ( = ?auto_634062 ?auto_634066 ) ) ( not ( = ?auto_634062 ?auto_634067 ) ) ( not ( = ?auto_634062 ?auto_634068 ) ) ( not ( = ?auto_634062 ?auto_634069 ) ) ( not ( = ?auto_634062 ?auto_634070 ) ) ( not ( = ?auto_634062 ?auto_634071 ) ) ( not ( = ?auto_634062 ?auto_634072 ) ) ( not ( = ?auto_634062 ?auto_634073 ) ) ( not ( = ?auto_634062 ?auto_634074 ) ) ( not ( = ?auto_634062 ?auto_634075 ) ) ( not ( = ?auto_634062 ?auto_634076 ) ) ( not ( = ?auto_634062 ?auto_634077 ) ) ( not ( = ?auto_634062 ?auto_634078 ) ) ( not ( = ?auto_634062 ?auto_634079 ) ) ( not ( = ?auto_634063 ?auto_634064 ) ) ( not ( = ?auto_634063 ?auto_634065 ) ) ( not ( = ?auto_634063 ?auto_634066 ) ) ( not ( = ?auto_634063 ?auto_634067 ) ) ( not ( = ?auto_634063 ?auto_634068 ) ) ( not ( = ?auto_634063 ?auto_634069 ) ) ( not ( = ?auto_634063 ?auto_634070 ) ) ( not ( = ?auto_634063 ?auto_634071 ) ) ( not ( = ?auto_634063 ?auto_634072 ) ) ( not ( = ?auto_634063 ?auto_634073 ) ) ( not ( = ?auto_634063 ?auto_634074 ) ) ( not ( = ?auto_634063 ?auto_634075 ) ) ( not ( = ?auto_634063 ?auto_634076 ) ) ( not ( = ?auto_634063 ?auto_634077 ) ) ( not ( = ?auto_634063 ?auto_634078 ) ) ( not ( = ?auto_634063 ?auto_634079 ) ) ( not ( = ?auto_634064 ?auto_634065 ) ) ( not ( = ?auto_634064 ?auto_634066 ) ) ( not ( = ?auto_634064 ?auto_634067 ) ) ( not ( = ?auto_634064 ?auto_634068 ) ) ( not ( = ?auto_634064 ?auto_634069 ) ) ( not ( = ?auto_634064 ?auto_634070 ) ) ( not ( = ?auto_634064 ?auto_634071 ) ) ( not ( = ?auto_634064 ?auto_634072 ) ) ( not ( = ?auto_634064 ?auto_634073 ) ) ( not ( = ?auto_634064 ?auto_634074 ) ) ( not ( = ?auto_634064 ?auto_634075 ) ) ( not ( = ?auto_634064 ?auto_634076 ) ) ( not ( = ?auto_634064 ?auto_634077 ) ) ( not ( = ?auto_634064 ?auto_634078 ) ) ( not ( = ?auto_634064 ?auto_634079 ) ) ( not ( = ?auto_634065 ?auto_634066 ) ) ( not ( = ?auto_634065 ?auto_634067 ) ) ( not ( = ?auto_634065 ?auto_634068 ) ) ( not ( = ?auto_634065 ?auto_634069 ) ) ( not ( = ?auto_634065 ?auto_634070 ) ) ( not ( = ?auto_634065 ?auto_634071 ) ) ( not ( = ?auto_634065 ?auto_634072 ) ) ( not ( = ?auto_634065 ?auto_634073 ) ) ( not ( = ?auto_634065 ?auto_634074 ) ) ( not ( = ?auto_634065 ?auto_634075 ) ) ( not ( = ?auto_634065 ?auto_634076 ) ) ( not ( = ?auto_634065 ?auto_634077 ) ) ( not ( = ?auto_634065 ?auto_634078 ) ) ( not ( = ?auto_634065 ?auto_634079 ) ) ( not ( = ?auto_634066 ?auto_634067 ) ) ( not ( = ?auto_634066 ?auto_634068 ) ) ( not ( = ?auto_634066 ?auto_634069 ) ) ( not ( = ?auto_634066 ?auto_634070 ) ) ( not ( = ?auto_634066 ?auto_634071 ) ) ( not ( = ?auto_634066 ?auto_634072 ) ) ( not ( = ?auto_634066 ?auto_634073 ) ) ( not ( = ?auto_634066 ?auto_634074 ) ) ( not ( = ?auto_634066 ?auto_634075 ) ) ( not ( = ?auto_634066 ?auto_634076 ) ) ( not ( = ?auto_634066 ?auto_634077 ) ) ( not ( = ?auto_634066 ?auto_634078 ) ) ( not ( = ?auto_634066 ?auto_634079 ) ) ( not ( = ?auto_634067 ?auto_634068 ) ) ( not ( = ?auto_634067 ?auto_634069 ) ) ( not ( = ?auto_634067 ?auto_634070 ) ) ( not ( = ?auto_634067 ?auto_634071 ) ) ( not ( = ?auto_634067 ?auto_634072 ) ) ( not ( = ?auto_634067 ?auto_634073 ) ) ( not ( = ?auto_634067 ?auto_634074 ) ) ( not ( = ?auto_634067 ?auto_634075 ) ) ( not ( = ?auto_634067 ?auto_634076 ) ) ( not ( = ?auto_634067 ?auto_634077 ) ) ( not ( = ?auto_634067 ?auto_634078 ) ) ( not ( = ?auto_634067 ?auto_634079 ) ) ( not ( = ?auto_634068 ?auto_634069 ) ) ( not ( = ?auto_634068 ?auto_634070 ) ) ( not ( = ?auto_634068 ?auto_634071 ) ) ( not ( = ?auto_634068 ?auto_634072 ) ) ( not ( = ?auto_634068 ?auto_634073 ) ) ( not ( = ?auto_634068 ?auto_634074 ) ) ( not ( = ?auto_634068 ?auto_634075 ) ) ( not ( = ?auto_634068 ?auto_634076 ) ) ( not ( = ?auto_634068 ?auto_634077 ) ) ( not ( = ?auto_634068 ?auto_634078 ) ) ( not ( = ?auto_634068 ?auto_634079 ) ) ( not ( = ?auto_634069 ?auto_634070 ) ) ( not ( = ?auto_634069 ?auto_634071 ) ) ( not ( = ?auto_634069 ?auto_634072 ) ) ( not ( = ?auto_634069 ?auto_634073 ) ) ( not ( = ?auto_634069 ?auto_634074 ) ) ( not ( = ?auto_634069 ?auto_634075 ) ) ( not ( = ?auto_634069 ?auto_634076 ) ) ( not ( = ?auto_634069 ?auto_634077 ) ) ( not ( = ?auto_634069 ?auto_634078 ) ) ( not ( = ?auto_634069 ?auto_634079 ) ) ( not ( = ?auto_634070 ?auto_634071 ) ) ( not ( = ?auto_634070 ?auto_634072 ) ) ( not ( = ?auto_634070 ?auto_634073 ) ) ( not ( = ?auto_634070 ?auto_634074 ) ) ( not ( = ?auto_634070 ?auto_634075 ) ) ( not ( = ?auto_634070 ?auto_634076 ) ) ( not ( = ?auto_634070 ?auto_634077 ) ) ( not ( = ?auto_634070 ?auto_634078 ) ) ( not ( = ?auto_634070 ?auto_634079 ) ) ( not ( = ?auto_634071 ?auto_634072 ) ) ( not ( = ?auto_634071 ?auto_634073 ) ) ( not ( = ?auto_634071 ?auto_634074 ) ) ( not ( = ?auto_634071 ?auto_634075 ) ) ( not ( = ?auto_634071 ?auto_634076 ) ) ( not ( = ?auto_634071 ?auto_634077 ) ) ( not ( = ?auto_634071 ?auto_634078 ) ) ( not ( = ?auto_634071 ?auto_634079 ) ) ( not ( = ?auto_634072 ?auto_634073 ) ) ( not ( = ?auto_634072 ?auto_634074 ) ) ( not ( = ?auto_634072 ?auto_634075 ) ) ( not ( = ?auto_634072 ?auto_634076 ) ) ( not ( = ?auto_634072 ?auto_634077 ) ) ( not ( = ?auto_634072 ?auto_634078 ) ) ( not ( = ?auto_634072 ?auto_634079 ) ) ( not ( = ?auto_634073 ?auto_634074 ) ) ( not ( = ?auto_634073 ?auto_634075 ) ) ( not ( = ?auto_634073 ?auto_634076 ) ) ( not ( = ?auto_634073 ?auto_634077 ) ) ( not ( = ?auto_634073 ?auto_634078 ) ) ( not ( = ?auto_634073 ?auto_634079 ) ) ( not ( = ?auto_634074 ?auto_634075 ) ) ( not ( = ?auto_634074 ?auto_634076 ) ) ( not ( = ?auto_634074 ?auto_634077 ) ) ( not ( = ?auto_634074 ?auto_634078 ) ) ( not ( = ?auto_634074 ?auto_634079 ) ) ( not ( = ?auto_634075 ?auto_634076 ) ) ( not ( = ?auto_634075 ?auto_634077 ) ) ( not ( = ?auto_634075 ?auto_634078 ) ) ( not ( = ?auto_634075 ?auto_634079 ) ) ( not ( = ?auto_634076 ?auto_634077 ) ) ( not ( = ?auto_634076 ?auto_634078 ) ) ( not ( = ?auto_634076 ?auto_634079 ) ) ( not ( = ?auto_634077 ?auto_634078 ) ) ( not ( = ?auto_634077 ?auto_634079 ) ) ( not ( = ?auto_634078 ?auto_634079 ) ) ( CLEAR ?auto_634076 ) ( ON ?auto_634077 ?auto_634078 ) ( CLEAR ?auto_634077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_634062 ?auto_634063 ?auto_634064 ?auto_634065 ?auto_634066 ?auto_634067 ?auto_634068 ?auto_634069 ?auto_634070 ?auto_634071 ?auto_634072 ?auto_634073 ?auto_634074 ?auto_634075 ?auto_634076 ?auto_634077 )
      ( MAKE-17PILE ?auto_634062 ?auto_634063 ?auto_634064 ?auto_634065 ?auto_634066 ?auto_634067 ?auto_634068 ?auto_634069 ?auto_634070 ?auto_634071 ?auto_634072 ?auto_634073 ?auto_634074 ?auto_634075 ?auto_634076 ?auto_634077 ?auto_634078 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634097 - BLOCK
      ?auto_634098 - BLOCK
      ?auto_634099 - BLOCK
      ?auto_634100 - BLOCK
      ?auto_634101 - BLOCK
      ?auto_634102 - BLOCK
      ?auto_634103 - BLOCK
      ?auto_634104 - BLOCK
      ?auto_634105 - BLOCK
      ?auto_634106 - BLOCK
      ?auto_634107 - BLOCK
      ?auto_634108 - BLOCK
      ?auto_634109 - BLOCK
      ?auto_634110 - BLOCK
      ?auto_634111 - BLOCK
      ?auto_634112 - BLOCK
      ?auto_634113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634113 ) ( ON-TABLE ?auto_634097 ) ( ON ?auto_634098 ?auto_634097 ) ( ON ?auto_634099 ?auto_634098 ) ( ON ?auto_634100 ?auto_634099 ) ( ON ?auto_634101 ?auto_634100 ) ( ON ?auto_634102 ?auto_634101 ) ( ON ?auto_634103 ?auto_634102 ) ( ON ?auto_634104 ?auto_634103 ) ( ON ?auto_634105 ?auto_634104 ) ( ON ?auto_634106 ?auto_634105 ) ( ON ?auto_634107 ?auto_634106 ) ( ON ?auto_634108 ?auto_634107 ) ( ON ?auto_634109 ?auto_634108 ) ( ON ?auto_634110 ?auto_634109 ) ( ON ?auto_634111 ?auto_634110 ) ( not ( = ?auto_634097 ?auto_634098 ) ) ( not ( = ?auto_634097 ?auto_634099 ) ) ( not ( = ?auto_634097 ?auto_634100 ) ) ( not ( = ?auto_634097 ?auto_634101 ) ) ( not ( = ?auto_634097 ?auto_634102 ) ) ( not ( = ?auto_634097 ?auto_634103 ) ) ( not ( = ?auto_634097 ?auto_634104 ) ) ( not ( = ?auto_634097 ?auto_634105 ) ) ( not ( = ?auto_634097 ?auto_634106 ) ) ( not ( = ?auto_634097 ?auto_634107 ) ) ( not ( = ?auto_634097 ?auto_634108 ) ) ( not ( = ?auto_634097 ?auto_634109 ) ) ( not ( = ?auto_634097 ?auto_634110 ) ) ( not ( = ?auto_634097 ?auto_634111 ) ) ( not ( = ?auto_634097 ?auto_634112 ) ) ( not ( = ?auto_634097 ?auto_634113 ) ) ( not ( = ?auto_634098 ?auto_634099 ) ) ( not ( = ?auto_634098 ?auto_634100 ) ) ( not ( = ?auto_634098 ?auto_634101 ) ) ( not ( = ?auto_634098 ?auto_634102 ) ) ( not ( = ?auto_634098 ?auto_634103 ) ) ( not ( = ?auto_634098 ?auto_634104 ) ) ( not ( = ?auto_634098 ?auto_634105 ) ) ( not ( = ?auto_634098 ?auto_634106 ) ) ( not ( = ?auto_634098 ?auto_634107 ) ) ( not ( = ?auto_634098 ?auto_634108 ) ) ( not ( = ?auto_634098 ?auto_634109 ) ) ( not ( = ?auto_634098 ?auto_634110 ) ) ( not ( = ?auto_634098 ?auto_634111 ) ) ( not ( = ?auto_634098 ?auto_634112 ) ) ( not ( = ?auto_634098 ?auto_634113 ) ) ( not ( = ?auto_634099 ?auto_634100 ) ) ( not ( = ?auto_634099 ?auto_634101 ) ) ( not ( = ?auto_634099 ?auto_634102 ) ) ( not ( = ?auto_634099 ?auto_634103 ) ) ( not ( = ?auto_634099 ?auto_634104 ) ) ( not ( = ?auto_634099 ?auto_634105 ) ) ( not ( = ?auto_634099 ?auto_634106 ) ) ( not ( = ?auto_634099 ?auto_634107 ) ) ( not ( = ?auto_634099 ?auto_634108 ) ) ( not ( = ?auto_634099 ?auto_634109 ) ) ( not ( = ?auto_634099 ?auto_634110 ) ) ( not ( = ?auto_634099 ?auto_634111 ) ) ( not ( = ?auto_634099 ?auto_634112 ) ) ( not ( = ?auto_634099 ?auto_634113 ) ) ( not ( = ?auto_634100 ?auto_634101 ) ) ( not ( = ?auto_634100 ?auto_634102 ) ) ( not ( = ?auto_634100 ?auto_634103 ) ) ( not ( = ?auto_634100 ?auto_634104 ) ) ( not ( = ?auto_634100 ?auto_634105 ) ) ( not ( = ?auto_634100 ?auto_634106 ) ) ( not ( = ?auto_634100 ?auto_634107 ) ) ( not ( = ?auto_634100 ?auto_634108 ) ) ( not ( = ?auto_634100 ?auto_634109 ) ) ( not ( = ?auto_634100 ?auto_634110 ) ) ( not ( = ?auto_634100 ?auto_634111 ) ) ( not ( = ?auto_634100 ?auto_634112 ) ) ( not ( = ?auto_634100 ?auto_634113 ) ) ( not ( = ?auto_634101 ?auto_634102 ) ) ( not ( = ?auto_634101 ?auto_634103 ) ) ( not ( = ?auto_634101 ?auto_634104 ) ) ( not ( = ?auto_634101 ?auto_634105 ) ) ( not ( = ?auto_634101 ?auto_634106 ) ) ( not ( = ?auto_634101 ?auto_634107 ) ) ( not ( = ?auto_634101 ?auto_634108 ) ) ( not ( = ?auto_634101 ?auto_634109 ) ) ( not ( = ?auto_634101 ?auto_634110 ) ) ( not ( = ?auto_634101 ?auto_634111 ) ) ( not ( = ?auto_634101 ?auto_634112 ) ) ( not ( = ?auto_634101 ?auto_634113 ) ) ( not ( = ?auto_634102 ?auto_634103 ) ) ( not ( = ?auto_634102 ?auto_634104 ) ) ( not ( = ?auto_634102 ?auto_634105 ) ) ( not ( = ?auto_634102 ?auto_634106 ) ) ( not ( = ?auto_634102 ?auto_634107 ) ) ( not ( = ?auto_634102 ?auto_634108 ) ) ( not ( = ?auto_634102 ?auto_634109 ) ) ( not ( = ?auto_634102 ?auto_634110 ) ) ( not ( = ?auto_634102 ?auto_634111 ) ) ( not ( = ?auto_634102 ?auto_634112 ) ) ( not ( = ?auto_634102 ?auto_634113 ) ) ( not ( = ?auto_634103 ?auto_634104 ) ) ( not ( = ?auto_634103 ?auto_634105 ) ) ( not ( = ?auto_634103 ?auto_634106 ) ) ( not ( = ?auto_634103 ?auto_634107 ) ) ( not ( = ?auto_634103 ?auto_634108 ) ) ( not ( = ?auto_634103 ?auto_634109 ) ) ( not ( = ?auto_634103 ?auto_634110 ) ) ( not ( = ?auto_634103 ?auto_634111 ) ) ( not ( = ?auto_634103 ?auto_634112 ) ) ( not ( = ?auto_634103 ?auto_634113 ) ) ( not ( = ?auto_634104 ?auto_634105 ) ) ( not ( = ?auto_634104 ?auto_634106 ) ) ( not ( = ?auto_634104 ?auto_634107 ) ) ( not ( = ?auto_634104 ?auto_634108 ) ) ( not ( = ?auto_634104 ?auto_634109 ) ) ( not ( = ?auto_634104 ?auto_634110 ) ) ( not ( = ?auto_634104 ?auto_634111 ) ) ( not ( = ?auto_634104 ?auto_634112 ) ) ( not ( = ?auto_634104 ?auto_634113 ) ) ( not ( = ?auto_634105 ?auto_634106 ) ) ( not ( = ?auto_634105 ?auto_634107 ) ) ( not ( = ?auto_634105 ?auto_634108 ) ) ( not ( = ?auto_634105 ?auto_634109 ) ) ( not ( = ?auto_634105 ?auto_634110 ) ) ( not ( = ?auto_634105 ?auto_634111 ) ) ( not ( = ?auto_634105 ?auto_634112 ) ) ( not ( = ?auto_634105 ?auto_634113 ) ) ( not ( = ?auto_634106 ?auto_634107 ) ) ( not ( = ?auto_634106 ?auto_634108 ) ) ( not ( = ?auto_634106 ?auto_634109 ) ) ( not ( = ?auto_634106 ?auto_634110 ) ) ( not ( = ?auto_634106 ?auto_634111 ) ) ( not ( = ?auto_634106 ?auto_634112 ) ) ( not ( = ?auto_634106 ?auto_634113 ) ) ( not ( = ?auto_634107 ?auto_634108 ) ) ( not ( = ?auto_634107 ?auto_634109 ) ) ( not ( = ?auto_634107 ?auto_634110 ) ) ( not ( = ?auto_634107 ?auto_634111 ) ) ( not ( = ?auto_634107 ?auto_634112 ) ) ( not ( = ?auto_634107 ?auto_634113 ) ) ( not ( = ?auto_634108 ?auto_634109 ) ) ( not ( = ?auto_634108 ?auto_634110 ) ) ( not ( = ?auto_634108 ?auto_634111 ) ) ( not ( = ?auto_634108 ?auto_634112 ) ) ( not ( = ?auto_634108 ?auto_634113 ) ) ( not ( = ?auto_634109 ?auto_634110 ) ) ( not ( = ?auto_634109 ?auto_634111 ) ) ( not ( = ?auto_634109 ?auto_634112 ) ) ( not ( = ?auto_634109 ?auto_634113 ) ) ( not ( = ?auto_634110 ?auto_634111 ) ) ( not ( = ?auto_634110 ?auto_634112 ) ) ( not ( = ?auto_634110 ?auto_634113 ) ) ( not ( = ?auto_634111 ?auto_634112 ) ) ( not ( = ?auto_634111 ?auto_634113 ) ) ( not ( = ?auto_634112 ?auto_634113 ) ) ( CLEAR ?auto_634111 ) ( ON ?auto_634112 ?auto_634113 ) ( CLEAR ?auto_634112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_634097 ?auto_634098 ?auto_634099 ?auto_634100 ?auto_634101 ?auto_634102 ?auto_634103 ?auto_634104 ?auto_634105 ?auto_634106 ?auto_634107 ?auto_634108 ?auto_634109 ?auto_634110 ?auto_634111 ?auto_634112 )
      ( MAKE-17PILE ?auto_634097 ?auto_634098 ?auto_634099 ?auto_634100 ?auto_634101 ?auto_634102 ?auto_634103 ?auto_634104 ?auto_634105 ?auto_634106 ?auto_634107 ?auto_634108 ?auto_634109 ?auto_634110 ?auto_634111 ?auto_634112 ?auto_634113 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634131 - BLOCK
      ?auto_634132 - BLOCK
      ?auto_634133 - BLOCK
      ?auto_634134 - BLOCK
      ?auto_634135 - BLOCK
      ?auto_634136 - BLOCK
      ?auto_634137 - BLOCK
      ?auto_634138 - BLOCK
      ?auto_634139 - BLOCK
      ?auto_634140 - BLOCK
      ?auto_634141 - BLOCK
      ?auto_634142 - BLOCK
      ?auto_634143 - BLOCK
      ?auto_634144 - BLOCK
      ?auto_634145 - BLOCK
      ?auto_634146 - BLOCK
      ?auto_634147 - BLOCK
    )
    :vars
    (
      ?auto_634148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634147 ?auto_634148 ) ( ON-TABLE ?auto_634131 ) ( ON ?auto_634132 ?auto_634131 ) ( ON ?auto_634133 ?auto_634132 ) ( ON ?auto_634134 ?auto_634133 ) ( ON ?auto_634135 ?auto_634134 ) ( ON ?auto_634136 ?auto_634135 ) ( ON ?auto_634137 ?auto_634136 ) ( ON ?auto_634138 ?auto_634137 ) ( ON ?auto_634139 ?auto_634138 ) ( ON ?auto_634140 ?auto_634139 ) ( ON ?auto_634141 ?auto_634140 ) ( ON ?auto_634142 ?auto_634141 ) ( ON ?auto_634143 ?auto_634142 ) ( ON ?auto_634144 ?auto_634143 ) ( not ( = ?auto_634131 ?auto_634132 ) ) ( not ( = ?auto_634131 ?auto_634133 ) ) ( not ( = ?auto_634131 ?auto_634134 ) ) ( not ( = ?auto_634131 ?auto_634135 ) ) ( not ( = ?auto_634131 ?auto_634136 ) ) ( not ( = ?auto_634131 ?auto_634137 ) ) ( not ( = ?auto_634131 ?auto_634138 ) ) ( not ( = ?auto_634131 ?auto_634139 ) ) ( not ( = ?auto_634131 ?auto_634140 ) ) ( not ( = ?auto_634131 ?auto_634141 ) ) ( not ( = ?auto_634131 ?auto_634142 ) ) ( not ( = ?auto_634131 ?auto_634143 ) ) ( not ( = ?auto_634131 ?auto_634144 ) ) ( not ( = ?auto_634131 ?auto_634145 ) ) ( not ( = ?auto_634131 ?auto_634146 ) ) ( not ( = ?auto_634131 ?auto_634147 ) ) ( not ( = ?auto_634131 ?auto_634148 ) ) ( not ( = ?auto_634132 ?auto_634133 ) ) ( not ( = ?auto_634132 ?auto_634134 ) ) ( not ( = ?auto_634132 ?auto_634135 ) ) ( not ( = ?auto_634132 ?auto_634136 ) ) ( not ( = ?auto_634132 ?auto_634137 ) ) ( not ( = ?auto_634132 ?auto_634138 ) ) ( not ( = ?auto_634132 ?auto_634139 ) ) ( not ( = ?auto_634132 ?auto_634140 ) ) ( not ( = ?auto_634132 ?auto_634141 ) ) ( not ( = ?auto_634132 ?auto_634142 ) ) ( not ( = ?auto_634132 ?auto_634143 ) ) ( not ( = ?auto_634132 ?auto_634144 ) ) ( not ( = ?auto_634132 ?auto_634145 ) ) ( not ( = ?auto_634132 ?auto_634146 ) ) ( not ( = ?auto_634132 ?auto_634147 ) ) ( not ( = ?auto_634132 ?auto_634148 ) ) ( not ( = ?auto_634133 ?auto_634134 ) ) ( not ( = ?auto_634133 ?auto_634135 ) ) ( not ( = ?auto_634133 ?auto_634136 ) ) ( not ( = ?auto_634133 ?auto_634137 ) ) ( not ( = ?auto_634133 ?auto_634138 ) ) ( not ( = ?auto_634133 ?auto_634139 ) ) ( not ( = ?auto_634133 ?auto_634140 ) ) ( not ( = ?auto_634133 ?auto_634141 ) ) ( not ( = ?auto_634133 ?auto_634142 ) ) ( not ( = ?auto_634133 ?auto_634143 ) ) ( not ( = ?auto_634133 ?auto_634144 ) ) ( not ( = ?auto_634133 ?auto_634145 ) ) ( not ( = ?auto_634133 ?auto_634146 ) ) ( not ( = ?auto_634133 ?auto_634147 ) ) ( not ( = ?auto_634133 ?auto_634148 ) ) ( not ( = ?auto_634134 ?auto_634135 ) ) ( not ( = ?auto_634134 ?auto_634136 ) ) ( not ( = ?auto_634134 ?auto_634137 ) ) ( not ( = ?auto_634134 ?auto_634138 ) ) ( not ( = ?auto_634134 ?auto_634139 ) ) ( not ( = ?auto_634134 ?auto_634140 ) ) ( not ( = ?auto_634134 ?auto_634141 ) ) ( not ( = ?auto_634134 ?auto_634142 ) ) ( not ( = ?auto_634134 ?auto_634143 ) ) ( not ( = ?auto_634134 ?auto_634144 ) ) ( not ( = ?auto_634134 ?auto_634145 ) ) ( not ( = ?auto_634134 ?auto_634146 ) ) ( not ( = ?auto_634134 ?auto_634147 ) ) ( not ( = ?auto_634134 ?auto_634148 ) ) ( not ( = ?auto_634135 ?auto_634136 ) ) ( not ( = ?auto_634135 ?auto_634137 ) ) ( not ( = ?auto_634135 ?auto_634138 ) ) ( not ( = ?auto_634135 ?auto_634139 ) ) ( not ( = ?auto_634135 ?auto_634140 ) ) ( not ( = ?auto_634135 ?auto_634141 ) ) ( not ( = ?auto_634135 ?auto_634142 ) ) ( not ( = ?auto_634135 ?auto_634143 ) ) ( not ( = ?auto_634135 ?auto_634144 ) ) ( not ( = ?auto_634135 ?auto_634145 ) ) ( not ( = ?auto_634135 ?auto_634146 ) ) ( not ( = ?auto_634135 ?auto_634147 ) ) ( not ( = ?auto_634135 ?auto_634148 ) ) ( not ( = ?auto_634136 ?auto_634137 ) ) ( not ( = ?auto_634136 ?auto_634138 ) ) ( not ( = ?auto_634136 ?auto_634139 ) ) ( not ( = ?auto_634136 ?auto_634140 ) ) ( not ( = ?auto_634136 ?auto_634141 ) ) ( not ( = ?auto_634136 ?auto_634142 ) ) ( not ( = ?auto_634136 ?auto_634143 ) ) ( not ( = ?auto_634136 ?auto_634144 ) ) ( not ( = ?auto_634136 ?auto_634145 ) ) ( not ( = ?auto_634136 ?auto_634146 ) ) ( not ( = ?auto_634136 ?auto_634147 ) ) ( not ( = ?auto_634136 ?auto_634148 ) ) ( not ( = ?auto_634137 ?auto_634138 ) ) ( not ( = ?auto_634137 ?auto_634139 ) ) ( not ( = ?auto_634137 ?auto_634140 ) ) ( not ( = ?auto_634137 ?auto_634141 ) ) ( not ( = ?auto_634137 ?auto_634142 ) ) ( not ( = ?auto_634137 ?auto_634143 ) ) ( not ( = ?auto_634137 ?auto_634144 ) ) ( not ( = ?auto_634137 ?auto_634145 ) ) ( not ( = ?auto_634137 ?auto_634146 ) ) ( not ( = ?auto_634137 ?auto_634147 ) ) ( not ( = ?auto_634137 ?auto_634148 ) ) ( not ( = ?auto_634138 ?auto_634139 ) ) ( not ( = ?auto_634138 ?auto_634140 ) ) ( not ( = ?auto_634138 ?auto_634141 ) ) ( not ( = ?auto_634138 ?auto_634142 ) ) ( not ( = ?auto_634138 ?auto_634143 ) ) ( not ( = ?auto_634138 ?auto_634144 ) ) ( not ( = ?auto_634138 ?auto_634145 ) ) ( not ( = ?auto_634138 ?auto_634146 ) ) ( not ( = ?auto_634138 ?auto_634147 ) ) ( not ( = ?auto_634138 ?auto_634148 ) ) ( not ( = ?auto_634139 ?auto_634140 ) ) ( not ( = ?auto_634139 ?auto_634141 ) ) ( not ( = ?auto_634139 ?auto_634142 ) ) ( not ( = ?auto_634139 ?auto_634143 ) ) ( not ( = ?auto_634139 ?auto_634144 ) ) ( not ( = ?auto_634139 ?auto_634145 ) ) ( not ( = ?auto_634139 ?auto_634146 ) ) ( not ( = ?auto_634139 ?auto_634147 ) ) ( not ( = ?auto_634139 ?auto_634148 ) ) ( not ( = ?auto_634140 ?auto_634141 ) ) ( not ( = ?auto_634140 ?auto_634142 ) ) ( not ( = ?auto_634140 ?auto_634143 ) ) ( not ( = ?auto_634140 ?auto_634144 ) ) ( not ( = ?auto_634140 ?auto_634145 ) ) ( not ( = ?auto_634140 ?auto_634146 ) ) ( not ( = ?auto_634140 ?auto_634147 ) ) ( not ( = ?auto_634140 ?auto_634148 ) ) ( not ( = ?auto_634141 ?auto_634142 ) ) ( not ( = ?auto_634141 ?auto_634143 ) ) ( not ( = ?auto_634141 ?auto_634144 ) ) ( not ( = ?auto_634141 ?auto_634145 ) ) ( not ( = ?auto_634141 ?auto_634146 ) ) ( not ( = ?auto_634141 ?auto_634147 ) ) ( not ( = ?auto_634141 ?auto_634148 ) ) ( not ( = ?auto_634142 ?auto_634143 ) ) ( not ( = ?auto_634142 ?auto_634144 ) ) ( not ( = ?auto_634142 ?auto_634145 ) ) ( not ( = ?auto_634142 ?auto_634146 ) ) ( not ( = ?auto_634142 ?auto_634147 ) ) ( not ( = ?auto_634142 ?auto_634148 ) ) ( not ( = ?auto_634143 ?auto_634144 ) ) ( not ( = ?auto_634143 ?auto_634145 ) ) ( not ( = ?auto_634143 ?auto_634146 ) ) ( not ( = ?auto_634143 ?auto_634147 ) ) ( not ( = ?auto_634143 ?auto_634148 ) ) ( not ( = ?auto_634144 ?auto_634145 ) ) ( not ( = ?auto_634144 ?auto_634146 ) ) ( not ( = ?auto_634144 ?auto_634147 ) ) ( not ( = ?auto_634144 ?auto_634148 ) ) ( not ( = ?auto_634145 ?auto_634146 ) ) ( not ( = ?auto_634145 ?auto_634147 ) ) ( not ( = ?auto_634145 ?auto_634148 ) ) ( not ( = ?auto_634146 ?auto_634147 ) ) ( not ( = ?auto_634146 ?auto_634148 ) ) ( not ( = ?auto_634147 ?auto_634148 ) ) ( ON ?auto_634146 ?auto_634147 ) ( CLEAR ?auto_634144 ) ( ON ?auto_634145 ?auto_634146 ) ( CLEAR ?auto_634145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_634131 ?auto_634132 ?auto_634133 ?auto_634134 ?auto_634135 ?auto_634136 ?auto_634137 ?auto_634138 ?auto_634139 ?auto_634140 ?auto_634141 ?auto_634142 ?auto_634143 ?auto_634144 ?auto_634145 )
      ( MAKE-17PILE ?auto_634131 ?auto_634132 ?auto_634133 ?auto_634134 ?auto_634135 ?auto_634136 ?auto_634137 ?auto_634138 ?auto_634139 ?auto_634140 ?auto_634141 ?auto_634142 ?auto_634143 ?auto_634144 ?auto_634145 ?auto_634146 ?auto_634147 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634166 - BLOCK
      ?auto_634167 - BLOCK
      ?auto_634168 - BLOCK
      ?auto_634169 - BLOCK
      ?auto_634170 - BLOCK
      ?auto_634171 - BLOCK
      ?auto_634172 - BLOCK
      ?auto_634173 - BLOCK
      ?auto_634174 - BLOCK
      ?auto_634175 - BLOCK
      ?auto_634176 - BLOCK
      ?auto_634177 - BLOCK
      ?auto_634178 - BLOCK
      ?auto_634179 - BLOCK
      ?auto_634180 - BLOCK
      ?auto_634181 - BLOCK
      ?auto_634182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634182 ) ( ON-TABLE ?auto_634166 ) ( ON ?auto_634167 ?auto_634166 ) ( ON ?auto_634168 ?auto_634167 ) ( ON ?auto_634169 ?auto_634168 ) ( ON ?auto_634170 ?auto_634169 ) ( ON ?auto_634171 ?auto_634170 ) ( ON ?auto_634172 ?auto_634171 ) ( ON ?auto_634173 ?auto_634172 ) ( ON ?auto_634174 ?auto_634173 ) ( ON ?auto_634175 ?auto_634174 ) ( ON ?auto_634176 ?auto_634175 ) ( ON ?auto_634177 ?auto_634176 ) ( ON ?auto_634178 ?auto_634177 ) ( ON ?auto_634179 ?auto_634178 ) ( not ( = ?auto_634166 ?auto_634167 ) ) ( not ( = ?auto_634166 ?auto_634168 ) ) ( not ( = ?auto_634166 ?auto_634169 ) ) ( not ( = ?auto_634166 ?auto_634170 ) ) ( not ( = ?auto_634166 ?auto_634171 ) ) ( not ( = ?auto_634166 ?auto_634172 ) ) ( not ( = ?auto_634166 ?auto_634173 ) ) ( not ( = ?auto_634166 ?auto_634174 ) ) ( not ( = ?auto_634166 ?auto_634175 ) ) ( not ( = ?auto_634166 ?auto_634176 ) ) ( not ( = ?auto_634166 ?auto_634177 ) ) ( not ( = ?auto_634166 ?auto_634178 ) ) ( not ( = ?auto_634166 ?auto_634179 ) ) ( not ( = ?auto_634166 ?auto_634180 ) ) ( not ( = ?auto_634166 ?auto_634181 ) ) ( not ( = ?auto_634166 ?auto_634182 ) ) ( not ( = ?auto_634167 ?auto_634168 ) ) ( not ( = ?auto_634167 ?auto_634169 ) ) ( not ( = ?auto_634167 ?auto_634170 ) ) ( not ( = ?auto_634167 ?auto_634171 ) ) ( not ( = ?auto_634167 ?auto_634172 ) ) ( not ( = ?auto_634167 ?auto_634173 ) ) ( not ( = ?auto_634167 ?auto_634174 ) ) ( not ( = ?auto_634167 ?auto_634175 ) ) ( not ( = ?auto_634167 ?auto_634176 ) ) ( not ( = ?auto_634167 ?auto_634177 ) ) ( not ( = ?auto_634167 ?auto_634178 ) ) ( not ( = ?auto_634167 ?auto_634179 ) ) ( not ( = ?auto_634167 ?auto_634180 ) ) ( not ( = ?auto_634167 ?auto_634181 ) ) ( not ( = ?auto_634167 ?auto_634182 ) ) ( not ( = ?auto_634168 ?auto_634169 ) ) ( not ( = ?auto_634168 ?auto_634170 ) ) ( not ( = ?auto_634168 ?auto_634171 ) ) ( not ( = ?auto_634168 ?auto_634172 ) ) ( not ( = ?auto_634168 ?auto_634173 ) ) ( not ( = ?auto_634168 ?auto_634174 ) ) ( not ( = ?auto_634168 ?auto_634175 ) ) ( not ( = ?auto_634168 ?auto_634176 ) ) ( not ( = ?auto_634168 ?auto_634177 ) ) ( not ( = ?auto_634168 ?auto_634178 ) ) ( not ( = ?auto_634168 ?auto_634179 ) ) ( not ( = ?auto_634168 ?auto_634180 ) ) ( not ( = ?auto_634168 ?auto_634181 ) ) ( not ( = ?auto_634168 ?auto_634182 ) ) ( not ( = ?auto_634169 ?auto_634170 ) ) ( not ( = ?auto_634169 ?auto_634171 ) ) ( not ( = ?auto_634169 ?auto_634172 ) ) ( not ( = ?auto_634169 ?auto_634173 ) ) ( not ( = ?auto_634169 ?auto_634174 ) ) ( not ( = ?auto_634169 ?auto_634175 ) ) ( not ( = ?auto_634169 ?auto_634176 ) ) ( not ( = ?auto_634169 ?auto_634177 ) ) ( not ( = ?auto_634169 ?auto_634178 ) ) ( not ( = ?auto_634169 ?auto_634179 ) ) ( not ( = ?auto_634169 ?auto_634180 ) ) ( not ( = ?auto_634169 ?auto_634181 ) ) ( not ( = ?auto_634169 ?auto_634182 ) ) ( not ( = ?auto_634170 ?auto_634171 ) ) ( not ( = ?auto_634170 ?auto_634172 ) ) ( not ( = ?auto_634170 ?auto_634173 ) ) ( not ( = ?auto_634170 ?auto_634174 ) ) ( not ( = ?auto_634170 ?auto_634175 ) ) ( not ( = ?auto_634170 ?auto_634176 ) ) ( not ( = ?auto_634170 ?auto_634177 ) ) ( not ( = ?auto_634170 ?auto_634178 ) ) ( not ( = ?auto_634170 ?auto_634179 ) ) ( not ( = ?auto_634170 ?auto_634180 ) ) ( not ( = ?auto_634170 ?auto_634181 ) ) ( not ( = ?auto_634170 ?auto_634182 ) ) ( not ( = ?auto_634171 ?auto_634172 ) ) ( not ( = ?auto_634171 ?auto_634173 ) ) ( not ( = ?auto_634171 ?auto_634174 ) ) ( not ( = ?auto_634171 ?auto_634175 ) ) ( not ( = ?auto_634171 ?auto_634176 ) ) ( not ( = ?auto_634171 ?auto_634177 ) ) ( not ( = ?auto_634171 ?auto_634178 ) ) ( not ( = ?auto_634171 ?auto_634179 ) ) ( not ( = ?auto_634171 ?auto_634180 ) ) ( not ( = ?auto_634171 ?auto_634181 ) ) ( not ( = ?auto_634171 ?auto_634182 ) ) ( not ( = ?auto_634172 ?auto_634173 ) ) ( not ( = ?auto_634172 ?auto_634174 ) ) ( not ( = ?auto_634172 ?auto_634175 ) ) ( not ( = ?auto_634172 ?auto_634176 ) ) ( not ( = ?auto_634172 ?auto_634177 ) ) ( not ( = ?auto_634172 ?auto_634178 ) ) ( not ( = ?auto_634172 ?auto_634179 ) ) ( not ( = ?auto_634172 ?auto_634180 ) ) ( not ( = ?auto_634172 ?auto_634181 ) ) ( not ( = ?auto_634172 ?auto_634182 ) ) ( not ( = ?auto_634173 ?auto_634174 ) ) ( not ( = ?auto_634173 ?auto_634175 ) ) ( not ( = ?auto_634173 ?auto_634176 ) ) ( not ( = ?auto_634173 ?auto_634177 ) ) ( not ( = ?auto_634173 ?auto_634178 ) ) ( not ( = ?auto_634173 ?auto_634179 ) ) ( not ( = ?auto_634173 ?auto_634180 ) ) ( not ( = ?auto_634173 ?auto_634181 ) ) ( not ( = ?auto_634173 ?auto_634182 ) ) ( not ( = ?auto_634174 ?auto_634175 ) ) ( not ( = ?auto_634174 ?auto_634176 ) ) ( not ( = ?auto_634174 ?auto_634177 ) ) ( not ( = ?auto_634174 ?auto_634178 ) ) ( not ( = ?auto_634174 ?auto_634179 ) ) ( not ( = ?auto_634174 ?auto_634180 ) ) ( not ( = ?auto_634174 ?auto_634181 ) ) ( not ( = ?auto_634174 ?auto_634182 ) ) ( not ( = ?auto_634175 ?auto_634176 ) ) ( not ( = ?auto_634175 ?auto_634177 ) ) ( not ( = ?auto_634175 ?auto_634178 ) ) ( not ( = ?auto_634175 ?auto_634179 ) ) ( not ( = ?auto_634175 ?auto_634180 ) ) ( not ( = ?auto_634175 ?auto_634181 ) ) ( not ( = ?auto_634175 ?auto_634182 ) ) ( not ( = ?auto_634176 ?auto_634177 ) ) ( not ( = ?auto_634176 ?auto_634178 ) ) ( not ( = ?auto_634176 ?auto_634179 ) ) ( not ( = ?auto_634176 ?auto_634180 ) ) ( not ( = ?auto_634176 ?auto_634181 ) ) ( not ( = ?auto_634176 ?auto_634182 ) ) ( not ( = ?auto_634177 ?auto_634178 ) ) ( not ( = ?auto_634177 ?auto_634179 ) ) ( not ( = ?auto_634177 ?auto_634180 ) ) ( not ( = ?auto_634177 ?auto_634181 ) ) ( not ( = ?auto_634177 ?auto_634182 ) ) ( not ( = ?auto_634178 ?auto_634179 ) ) ( not ( = ?auto_634178 ?auto_634180 ) ) ( not ( = ?auto_634178 ?auto_634181 ) ) ( not ( = ?auto_634178 ?auto_634182 ) ) ( not ( = ?auto_634179 ?auto_634180 ) ) ( not ( = ?auto_634179 ?auto_634181 ) ) ( not ( = ?auto_634179 ?auto_634182 ) ) ( not ( = ?auto_634180 ?auto_634181 ) ) ( not ( = ?auto_634180 ?auto_634182 ) ) ( not ( = ?auto_634181 ?auto_634182 ) ) ( ON ?auto_634181 ?auto_634182 ) ( CLEAR ?auto_634179 ) ( ON ?auto_634180 ?auto_634181 ) ( CLEAR ?auto_634180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_634166 ?auto_634167 ?auto_634168 ?auto_634169 ?auto_634170 ?auto_634171 ?auto_634172 ?auto_634173 ?auto_634174 ?auto_634175 ?auto_634176 ?auto_634177 ?auto_634178 ?auto_634179 ?auto_634180 )
      ( MAKE-17PILE ?auto_634166 ?auto_634167 ?auto_634168 ?auto_634169 ?auto_634170 ?auto_634171 ?auto_634172 ?auto_634173 ?auto_634174 ?auto_634175 ?auto_634176 ?auto_634177 ?auto_634178 ?auto_634179 ?auto_634180 ?auto_634181 ?auto_634182 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634200 - BLOCK
      ?auto_634201 - BLOCK
      ?auto_634202 - BLOCK
      ?auto_634203 - BLOCK
      ?auto_634204 - BLOCK
      ?auto_634205 - BLOCK
      ?auto_634206 - BLOCK
      ?auto_634207 - BLOCK
      ?auto_634208 - BLOCK
      ?auto_634209 - BLOCK
      ?auto_634210 - BLOCK
      ?auto_634211 - BLOCK
      ?auto_634212 - BLOCK
      ?auto_634213 - BLOCK
      ?auto_634214 - BLOCK
      ?auto_634215 - BLOCK
      ?auto_634216 - BLOCK
    )
    :vars
    (
      ?auto_634217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634216 ?auto_634217 ) ( ON-TABLE ?auto_634200 ) ( ON ?auto_634201 ?auto_634200 ) ( ON ?auto_634202 ?auto_634201 ) ( ON ?auto_634203 ?auto_634202 ) ( ON ?auto_634204 ?auto_634203 ) ( ON ?auto_634205 ?auto_634204 ) ( ON ?auto_634206 ?auto_634205 ) ( ON ?auto_634207 ?auto_634206 ) ( ON ?auto_634208 ?auto_634207 ) ( ON ?auto_634209 ?auto_634208 ) ( ON ?auto_634210 ?auto_634209 ) ( ON ?auto_634211 ?auto_634210 ) ( ON ?auto_634212 ?auto_634211 ) ( not ( = ?auto_634200 ?auto_634201 ) ) ( not ( = ?auto_634200 ?auto_634202 ) ) ( not ( = ?auto_634200 ?auto_634203 ) ) ( not ( = ?auto_634200 ?auto_634204 ) ) ( not ( = ?auto_634200 ?auto_634205 ) ) ( not ( = ?auto_634200 ?auto_634206 ) ) ( not ( = ?auto_634200 ?auto_634207 ) ) ( not ( = ?auto_634200 ?auto_634208 ) ) ( not ( = ?auto_634200 ?auto_634209 ) ) ( not ( = ?auto_634200 ?auto_634210 ) ) ( not ( = ?auto_634200 ?auto_634211 ) ) ( not ( = ?auto_634200 ?auto_634212 ) ) ( not ( = ?auto_634200 ?auto_634213 ) ) ( not ( = ?auto_634200 ?auto_634214 ) ) ( not ( = ?auto_634200 ?auto_634215 ) ) ( not ( = ?auto_634200 ?auto_634216 ) ) ( not ( = ?auto_634200 ?auto_634217 ) ) ( not ( = ?auto_634201 ?auto_634202 ) ) ( not ( = ?auto_634201 ?auto_634203 ) ) ( not ( = ?auto_634201 ?auto_634204 ) ) ( not ( = ?auto_634201 ?auto_634205 ) ) ( not ( = ?auto_634201 ?auto_634206 ) ) ( not ( = ?auto_634201 ?auto_634207 ) ) ( not ( = ?auto_634201 ?auto_634208 ) ) ( not ( = ?auto_634201 ?auto_634209 ) ) ( not ( = ?auto_634201 ?auto_634210 ) ) ( not ( = ?auto_634201 ?auto_634211 ) ) ( not ( = ?auto_634201 ?auto_634212 ) ) ( not ( = ?auto_634201 ?auto_634213 ) ) ( not ( = ?auto_634201 ?auto_634214 ) ) ( not ( = ?auto_634201 ?auto_634215 ) ) ( not ( = ?auto_634201 ?auto_634216 ) ) ( not ( = ?auto_634201 ?auto_634217 ) ) ( not ( = ?auto_634202 ?auto_634203 ) ) ( not ( = ?auto_634202 ?auto_634204 ) ) ( not ( = ?auto_634202 ?auto_634205 ) ) ( not ( = ?auto_634202 ?auto_634206 ) ) ( not ( = ?auto_634202 ?auto_634207 ) ) ( not ( = ?auto_634202 ?auto_634208 ) ) ( not ( = ?auto_634202 ?auto_634209 ) ) ( not ( = ?auto_634202 ?auto_634210 ) ) ( not ( = ?auto_634202 ?auto_634211 ) ) ( not ( = ?auto_634202 ?auto_634212 ) ) ( not ( = ?auto_634202 ?auto_634213 ) ) ( not ( = ?auto_634202 ?auto_634214 ) ) ( not ( = ?auto_634202 ?auto_634215 ) ) ( not ( = ?auto_634202 ?auto_634216 ) ) ( not ( = ?auto_634202 ?auto_634217 ) ) ( not ( = ?auto_634203 ?auto_634204 ) ) ( not ( = ?auto_634203 ?auto_634205 ) ) ( not ( = ?auto_634203 ?auto_634206 ) ) ( not ( = ?auto_634203 ?auto_634207 ) ) ( not ( = ?auto_634203 ?auto_634208 ) ) ( not ( = ?auto_634203 ?auto_634209 ) ) ( not ( = ?auto_634203 ?auto_634210 ) ) ( not ( = ?auto_634203 ?auto_634211 ) ) ( not ( = ?auto_634203 ?auto_634212 ) ) ( not ( = ?auto_634203 ?auto_634213 ) ) ( not ( = ?auto_634203 ?auto_634214 ) ) ( not ( = ?auto_634203 ?auto_634215 ) ) ( not ( = ?auto_634203 ?auto_634216 ) ) ( not ( = ?auto_634203 ?auto_634217 ) ) ( not ( = ?auto_634204 ?auto_634205 ) ) ( not ( = ?auto_634204 ?auto_634206 ) ) ( not ( = ?auto_634204 ?auto_634207 ) ) ( not ( = ?auto_634204 ?auto_634208 ) ) ( not ( = ?auto_634204 ?auto_634209 ) ) ( not ( = ?auto_634204 ?auto_634210 ) ) ( not ( = ?auto_634204 ?auto_634211 ) ) ( not ( = ?auto_634204 ?auto_634212 ) ) ( not ( = ?auto_634204 ?auto_634213 ) ) ( not ( = ?auto_634204 ?auto_634214 ) ) ( not ( = ?auto_634204 ?auto_634215 ) ) ( not ( = ?auto_634204 ?auto_634216 ) ) ( not ( = ?auto_634204 ?auto_634217 ) ) ( not ( = ?auto_634205 ?auto_634206 ) ) ( not ( = ?auto_634205 ?auto_634207 ) ) ( not ( = ?auto_634205 ?auto_634208 ) ) ( not ( = ?auto_634205 ?auto_634209 ) ) ( not ( = ?auto_634205 ?auto_634210 ) ) ( not ( = ?auto_634205 ?auto_634211 ) ) ( not ( = ?auto_634205 ?auto_634212 ) ) ( not ( = ?auto_634205 ?auto_634213 ) ) ( not ( = ?auto_634205 ?auto_634214 ) ) ( not ( = ?auto_634205 ?auto_634215 ) ) ( not ( = ?auto_634205 ?auto_634216 ) ) ( not ( = ?auto_634205 ?auto_634217 ) ) ( not ( = ?auto_634206 ?auto_634207 ) ) ( not ( = ?auto_634206 ?auto_634208 ) ) ( not ( = ?auto_634206 ?auto_634209 ) ) ( not ( = ?auto_634206 ?auto_634210 ) ) ( not ( = ?auto_634206 ?auto_634211 ) ) ( not ( = ?auto_634206 ?auto_634212 ) ) ( not ( = ?auto_634206 ?auto_634213 ) ) ( not ( = ?auto_634206 ?auto_634214 ) ) ( not ( = ?auto_634206 ?auto_634215 ) ) ( not ( = ?auto_634206 ?auto_634216 ) ) ( not ( = ?auto_634206 ?auto_634217 ) ) ( not ( = ?auto_634207 ?auto_634208 ) ) ( not ( = ?auto_634207 ?auto_634209 ) ) ( not ( = ?auto_634207 ?auto_634210 ) ) ( not ( = ?auto_634207 ?auto_634211 ) ) ( not ( = ?auto_634207 ?auto_634212 ) ) ( not ( = ?auto_634207 ?auto_634213 ) ) ( not ( = ?auto_634207 ?auto_634214 ) ) ( not ( = ?auto_634207 ?auto_634215 ) ) ( not ( = ?auto_634207 ?auto_634216 ) ) ( not ( = ?auto_634207 ?auto_634217 ) ) ( not ( = ?auto_634208 ?auto_634209 ) ) ( not ( = ?auto_634208 ?auto_634210 ) ) ( not ( = ?auto_634208 ?auto_634211 ) ) ( not ( = ?auto_634208 ?auto_634212 ) ) ( not ( = ?auto_634208 ?auto_634213 ) ) ( not ( = ?auto_634208 ?auto_634214 ) ) ( not ( = ?auto_634208 ?auto_634215 ) ) ( not ( = ?auto_634208 ?auto_634216 ) ) ( not ( = ?auto_634208 ?auto_634217 ) ) ( not ( = ?auto_634209 ?auto_634210 ) ) ( not ( = ?auto_634209 ?auto_634211 ) ) ( not ( = ?auto_634209 ?auto_634212 ) ) ( not ( = ?auto_634209 ?auto_634213 ) ) ( not ( = ?auto_634209 ?auto_634214 ) ) ( not ( = ?auto_634209 ?auto_634215 ) ) ( not ( = ?auto_634209 ?auto_634216 ) ) ( not ( = ?auto_634209 ?auto_634217 ) ) ( not ( = ?auto_634210 ?auto_634211 ) ) ( not ( = ?auto_634210 ?auto_634212 ) ) ( not ( = ?auto_634210 ?auto_634213 ) ) ( not ( = ?auto_634210 ?auto_634214 ) ) ( not ( = ?auto_634210 ?auto_634215 ) ) ( not ( = ?auto_634210 ?auto_634216 ) ) ( not ( = ?auto_634210 ?auto_634217 ) ) ( not ( = ?auto_634211 ?auto_634212 ) ) ( not ( = ?auto_634211 ?auto_634213 ) ) ( not ( = ?auto_634211 ?auto_634214 ) ) ( not ( = ?auto_634211 ?auto_634215 ) ) ( not ( = ?auto_634211 ?auto_634216 ) ) ( not ( = ?auto_634211 ?auto_634217 ) ) ( not ( = ?auto_634212 ?auto_634213 ) ) ( not ( = ?auto_634212 ?auto_634214 ) ) ( not ( = ?auto_634212 ?auto_634215 ) ) ( not ( = ?auto_634212 ?auto_634216 ) ) ( not ( = ?auto_634212 ?auto_634217 ) ) ( not ( = ?auto_634213 ?auto_634214 ) ) ( not ( = ?auto_634213 ?auto_634215 ) ) ( not ( = ?auto_634213 ?auto_634216 ) ) ( not ( = ?auto_634213 ?auto_634217 ) ) ( not ( = ?auto_634214 ?auto_634215 ) ) ( not ( = ?auto_634214 ?auto_634216 ) ) ( not ( = ?auto_634214 ?auto_634217 ) ) ( not ( = ?auto_634215 ?auto_634216 ) ) ( not ( = ?auto_634215 ?auto_634217 ) ) ( not ( = ?auto_634216 ?auto_634217 ) ) ( ON ?auto_634215 ?auto_634216 ) ( ON ?auto_634214 ?auto_634215 ) ( CLEAR ?auto_634212 ) ( ON ?auto_634213 ?auto_634214 ) ( CLEAR ?auto_634213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_634200 ?auto_634201 ?auto_634202 ?auto_634203 ?auto_634204 ?auto_634205 ?auto_634206 ?auto_634207 ?auto_634208 ?auto_634209 ?auto_634210 ?auto_634211 ?auto_634212 ?auto_634213 )
      ( MAKE-17PILE ?auto_634200 ?auto_634201 ?auto_634202 ?auto_634203 ?auto_634204 ?auto_634205 ?auto_634206 ?auto_634207 ?auto_634208 ?auto_634209 ?auto_634210 ?auto_634211 ?auto_634212 ?auto_634213 ?auto_634214 ?auto_634215 ?auto_634216 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634235 - BLOCK
      ?auto_634236 - BLOCK
      ?auto_634237 - BLOCK
      ?auto_634238 - BLOCK
      ?auto_634239 - BLOCK
      ?auto_634240 - BLOCK
      ?auto_634241 - BLOCK
      ?auto_634242 - BLOCK
      ?auto_634243 - BLOCK
      ?auto_634244 - BLOCK
      ?auto_634245 - BLOCK
      ?auto_634246 - BLOCK
      ?auto_634247 - BLOCK
      ?auto_634248 - BLOCK
      ?auto_634249 - BLOCK
      ?auto_634250 - BLOCK
      ?auto_634251 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634251 ) ( ON-TABLE ?auto_634235 ) ( ON ?auto_634236 ?auto_634235 ) ( ON ?auto_634237 ?auto_634236 ) ( ON ?auto_634238 ?auto_634237 ) ( ON ?auto_634239 ?auto_634238 ) ( ON ?auto_634240 ?auto_634239 ) ( ON ?auto_634241 ?auto_634240 ) ( ON ?auto_634242 ?auto_634241 ) ( ON ?auto_634243 ?auto_634242 ) ( ON ?auto_634244 ?auto_634243 ) ( ON ?auto_634245 ?auto_634244 ) ( ON ?auto_634246 ?auto_634245 ) ( ON ?auto_634247 ?auto_634246 ) ( not ( = ?auto_634235 ?auto_634236 ) ) ( not ( = ?auto_634235 ?auto_634237 ) ) ( not ( = ?auto_634235 ?auto_634238 ) ) ( not ( = ?auto_634235 ?auto_634239 ) ) ( not ( = ?auto_634235 ?auto_634240 ) ) ( not ( = ?auto_634235 ?auto_634241 ) ) ( not ( = ?auto_634235 ?auto_634242 ) ) ( not ( = ?auto_634235 ?auto_634243 ) ) ( not ( = ?auto_634235 ?auto_634244 ) ) ( not ( = ?auto_634235 ?auto_634245 ) ) ( not ( = ?auto_634235 ?auto_634246 ) ) ( not ( = ?auto_634235 ?auto_634247 ) ) ( not ( = ?auto_634235 ?auto_634248 ) ) ( not ( = ?auto_634235 ?auto_634249 ) ) ( not ( = ?auto_634235 ?auto_634250 ) ) ( not ( = ?auto_634235 ?auto_634251 ) ) ( not ( = ?auto_634236 ?auto_634237 ) ) ( not ( = ?auto_634236 ?auto_634238 ) ) ( not ( = ?auto_634236 ?auto_634239 ) ) ( not ( = ?auto_634236 ?auto_634240 ) ) ( not ( = ?auto_634236 ?auto_634241 ) ) ( not ( = ?auto_634236 ?auto_634242 ) ) ( not ( = ?auto_634236 ?auto_634243 ) ) ( not ( = ?auto_634236 ?auto_634244 ) ) ( not ( = ?auto_634236 ?auto_634245 ) ) ( not ( = ?auto_634236 ?auto_634246 ) ) ( not ( = ?auto_634236 ?auto_634247 ) ) ( not ( = ?auto_634236 ?auto_634248 ) ) ( not ( = ?auto_634236 ?auto_634249 ) ) ( not ( = ?auto_634236 ?auto_634250 ) ) ( not ( = ?auto_634236 ?auto_634251 ) ) ( not ( = ?auto_634237 ?auto_634238 ) ) ( not ( = ?auto_634237 ?auto_634239 ) ) ( not ( = ?auto_634237 ?auto_634240 ) ) ( not ( = ?auto_634237 ?auto_634241 ) ) ( not ( = ?auto_634237 ?auto_634242 ) ) ( not ( = ?auto_634237 ?auto_634243 ) ) ( not ( = ?auto_634237 ?auto_634244 ) ) ( not ( = ?auto_634237 ?auto_634245 ) ) ( not ( = ?auto_634237 ?auto_634246 ) ) ( not ( = ?auto_634237 ?auto_634247 ) ) ( not ( = ?auto_634237 ?auto_634248 ) ) ( not ( = ?auto_634237 ?auto_634249 ) ) ( not ( = ?auto_634237 ?auto_634250 ) ) ( not ( = ?auto_634237 ?auto_634251 ) ) ( not ( = ?auto_634238 ?auto_634239 ) ) ( not ( = ?auto_634238 ?auto_634240 ) ) ( not ( = ?auto_634238 ?auto_634241 ) ) ( not ( = ?auto_634238 ?auto_634242 ) ) ( not ( = ?auto_634238 ?auto_634243 ) ) ( not ( = ?auto_634238 ?auto_634244 ) ) ( not ( = ?auto_634238 ?auto_634245 ) ) ( not ( = ?auto_634238 ?auto_634246 ) ) ( not ( = ?auto_634238 ?auto_634247 ) ) ( not ( = ?auto_634238 ?auto_634248 ) ) ( not ( = ?auto_634238 ?auto_634249 ) ) ( not ( = ?auto_634238 ?auto_634250 ) ) ( not ( = ?auto_634238 ?auto_634251 ) ) ( not ( = ?auto_634239 ?auto_634240 ) ) ( not ( = ?auto_634239 ?auto_634241 ) ) ( not ( = ?auto_634239 ?auto_634242 ) ) ( not ( = ?auto_634239 ?auto_634243 ) ) ( not ( = ?auto_634239 ?auto_634244 ) ) ( not ( = ?auto_634239 ?auto_634245 ) ) ( not ( = ?auto_634239 ?auto_634246 ) ) ( not ( = ?auto_634239 ?auto_634247 ) ) ( not ( = ?auto_634239 ?auto_634248 ) ) ( not ( = ?auto_634239 ?auto_634249 ) ) ( not ( = ?auto_634239 ?auto_634250 ) ) ( not ( = ?auto_634239 ?auto_634251 ) ) ( not ( = ?auto_634240 ?auto_634241 ) ) ( not ( = ?auto_634240 ?auto_634242 ) ) ( not ( = ?auto_634240 ?auto_634243 ) ) ( not ( = ?auto_634240 ?auto_634244 ) ) ( not ( = ?auto_634240 ?auto_634245 ) ) ( not ( = ?auto_634240 ?auto_634246 ) ) ( not ( = ?auto_634240 ?auto_634247 ) ) ( not ( = ?auto_634240 ?auto_634248 ) ) ( not ( = ?auto_634240 ?auto_634249 ) ) ( not ( = ?auto_634240 ?auto_634250 ) ) ( not ( = ?auto_634240 ?auto_634251 ) ) ( not ( = ?auto_634241 ?auto_634242 ) ) ( not ( = ?auto_634241 ?auto_634243 ) ) ( not ( = ?auto_634241 ?auto_634244 ) ) ( not ( = ?auto_634241 ?auto_634245 ) ) ( not ( = ?auto_634241 ?auto_634246 ) ) ( not ( = ?auto_634241 ?auto_634247 ) ) ( not ( = ?auto_634241 ?auto_634248 ) ) ( not ( = ?auto_634241 ?auto_634249 ) ) ( not ( = ?auto_634241 ?auto_634250 ) ) ( not ( = ?auto_634241 ?auto_634251 ) ) ( not ( = ?auto_634242 ?auto_634243 ) ) ( not ( = ?auto_634242 ?auto_634244 ) ) ( not ( = ?auto_634242 ?auto_634245 ) ) ( not ( = ?auto_634242 ?auto_634246 ) ) ( not ( = ?auto_634242 ?auto_634247 ) ) ( not ( = ?auto_634242 ?auto_634248 ) ) ( not ( = ?auto_634242 ?auto_634249 ) ) ( not ( = ?auto_634242 ?auto_634250 ) ) ( not ( = ?auto_634242 ?auto_634251 ) ) ( not ( = ?auto_634243 ?auto_634244 ) ) ( not ( = ?auto_634243 ?auto_634245 ) ) ( not ( = ?auto_634243 ?auto_634246 ) ) ( not ( = ?auto_634243 ?auto_634247 ) ) ( not ( = ?auto_634243 ?auto_634248 ) ) ( not ( = ?auto_634243 ?auto_634249 ) ) ( not ( = ?auto_634243 ?auto_634250 ) ) ( not ( = ?auto_634243 ?auto_634251 ) ) ( not ( = ?auto_634244 ?auto_634245 ) ) ( not ( = ?auto_634244 ?auto_634246 ) ) ( not ( = ?auto_634244 ?auto_634247 ) ) ( not ( = ?auto_634244 ?auto_634248 ) ) ( not ( = ?auto_634244 ?auto_634249 ) ) ( not ( = ?auto_634244 ?auto_634250 ) ) ( not ( = ?auto_634244 ?auto_634251 ) ) ( not ( = ?auto_634245 ?auto_634246 ) ) ( not ( = ?auto_634245 ?auto_634247 ) ) ( not ( = ?auto_634245 ?auto_634248 ) ) ( not ( = ?auto_634245 ?auto_634249 ) ) ( not ( = ?auto_634245 ?auto_634250 ) ) ( not ( = ?auto_634245 ?auto_634251 ) ) ( not ( = ?auto_634246 ?auto_634247 ) ) ( not ( = ?auto_634246 ?auto_634248 ) ) ( not ( = ?auto_634246 ?auto_634249 ) ) ( not ( = ?auto_634246 ?auto_634250 ) ) ( not ( = ?auto_634246 ?auto_634251 ) ) ( not ( = ?auto_634247 ?auto_634248 ) ) ( not ( = ?auto_634247 ?auto_634249 ) ) ( not ( = ?auto_634247 ?auto_634250 ) ) ( not ( = ?auto_634247 ?auto_634251 ) ) ( not ( = ?auto_634248 ?auto_634249 ) ) ( not ( = ?auto_634248 ?auto_634250 ) ) ( not ( = ?auto_634248 ?auto_634251 ) ) ( not ( = ?auto_634249 ?auto_634250 ) ) ( not ( = ?auto_634249 ?auto_634251 ) ) ( not ( = ?auto_634250 ?auto_634251 ) ) ( ON ?auto_634250 ?auto_634251 ) ( ON ?auto_634249 ?auto_634250 ) ( CLEAR ?auto_634247 ) ( ON ?auto_634248 ?auto_634249 ) ( CLEAR ?auto_634248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_634235 ?auto_634236 ?auto_634237 ?auto_634238 ?auto_634239 ?auto_634240 ?auto_634241 ?auto_634242 ?auto_634243 ?auto_634244 ?auto_634245 ?auto_634246 ?auto_634247 ?auto_634248 )
      ( MAKE-17PILE ?auto_634235 ?auto_634236 ?auto_634237 ?auto_634238 ?auto_634239 ?auto_634240 ?auto_634241 ?auto_634242 ?auto_634243 ?auto_634244 ?auto_634245 ?auto_634246 ?auto_634247 ?auto_634248 ?auto_634249 ?auto_634250 ?auto_634251 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634269 - BLOCK
      ?auto_634270 - BLOCK
      ?auto_634271 - BLOCK
      ?auto_634272 - BLOCK
      ?auto_634273 - BLOCK
      ?auto_634274 - BLOCK
      ?auto_634275 - BLOCK
      ?auto_634276 - BLOCK
      ?auto_634277 - BLOCK
      ?auto_634278 - BLOCK
      ?auto_634279 - BLOCK
      ?auto_634280 - BLOCK
      ?auto_634281 - BLOCK
      ?auto_634282 - BLOCK
      ?auto_634283 - BLOCK
      ?auto_634284 - BLOCK
      ?auto_634285 - BLOCK
    )
    :vars
    (
      ?auto_634286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634285 ?auto_634286 ) ( ON-TABLE ?auto_634269 ) ( ON ?auto_634270 ?auto_634269 ) ( ON ?auto_634271 ?auto_634270 ) ( ON ?auto_634272 ?auto_634271 ) ( ON ?auto_634273 ?auto_634272 ) ( ON ?auto_634274 ?auto_634273 ) ( ON ?auto_634275 ?auto_634274 ) ( ON ?auto_634276 ?auto_634275 ) ( ON ?auto_634277 ?auto_634276 ) ( ON ?auto_634278 ?auto_634277 ) ( ON ?auto_634279 ?auto_634278 ) ( ON ?auto_634280 ?auto_634279 ) ( not ( = ?auto_634269 ?auto_634270 ) ) ( not ( = ?auto_634269 ?auto_634271 ) ) ( not ( = ?auto_634269 ?auto_634272 ) ) ( not ( = ?auto_634269 ?auto_634273 ) ) ( not ( = ?auto_634269 ?auto_634274 ) ) ( not ( = ?auto_634269 ?auto_634275 ) ) ( not ( = ?auto_634269 ?auto_634276 ) ) ( not ( = ?auto_634269 ?auto_634277 ) ) ( not ( = ?auto_634269 ?auto_634278 ) ) ( not ( = ?auto_634269 ?auto_634279 ) ) ( not ( = ?auto_634269 ?auto_634280 ) ) ( not ( = ?auto_634269 ?auto_634281 ) ) ( not ( = ?auto_634269 ?auto_634282 ) ) ( not ( = ?auto_634269 ?auto_634283 ) ) ( not ( = ?auto_634269 ?auto_634284 ) ) ( not ( = ?auto_634269 ?auto_634285 ) ) ( not ( = ?auto_634269 ?auto_634286 ) ) ( not ( = ?auto_634270 ?auto_634271 ) ) ( not ( = ?auto_634270 ?auto_634272 ) ) ( not ( = ?auto_634270 ?auto_634273 ) ) ( not ( = ?auto_634270 ?auto_634274 ) ) ( not ( = ?auto_634270 ?auto_634275 ) ) ( not ( = ?auto_634270 ?auto_634276 ) ) ( not ( = ?auto_634270 ?auto_634277 ) ) ( not ( = ?auto_634270 ?auto_634278 ) ) ( not ( = ?auto_634270 ?auto_634279 ) ) ( not ( = ?auto_634270 ?auto_634280 ) ) ( not ( = ?auto_634270 ?auto_634281 ) ) ( not ( = ?auto_634270 ?auto_634282 ) ) ( not ( = ?auto_634270 ?auto_634283 ) ) ( not ( = ?auto_634270 ?auto_634284 ) ) ( not ( = ?auto_634270 ?auto_634285 ) ) ( not ( = ?auto_634270 ?auto_634286 ) ) ( not ( = ?auto_634271 ?auto_634272 ) ) ( not ( = ?auto_634271 ?auto_634273 ) ) ( not ( = ?auto_634271 ?auto_634274 ) ) ( not ( = ?auto_634271 ?auto_634275 ) ) ( not ( = ?auto_634271 ?auto_634276 ) ) ( not ( = ?auto_634271 ?auto_634277 ) ) ( not ( = ?auto_634271 ?auto_634278 ) ) ( not ( = ?auto_634271 ?auto_634279 ) ) ( not ( = ?auto_634271 ?auto_634280 ) ) ( not ( = ?auto_634271 ?auto_634281 ) ) ( not ( = ?auto_634271 ?auto_634282 ) ) ( not ( = ?auto_634271 ?auto_634283 ) ) ( not ( = ?auto_634271 ?auto_634284 ) ) ( not ( = ?auto_634271 ?auto_634285 ) ) ( not ( = ?auto_634271 ?auto_634286 ) ) ( not ( = ?auto_634272 ?auto_634273 ) ) ( not ( = ?auto_634272 ?auto_634274 ) ) ( not ( = ?auto_634272 ?auto_634275 ) ) ( not ( = ?auto_634272 ?auto_634276 ) ) ( not ( = ?auto_634272 ?auto_634277 ) ) ( not ( = ?auto_634272 ?auto_634278 ) ) ( not ( = ?auto_634272 ?auto_634279 ) ) ( not ( = ?auto_634272 ?auto_634280 ) ) ( not ( = ?auto_634272 ?auto_634281 ) ) ( not ( = ?auto_634272 ?auto_634282 ) ) ( not ( = ?auto_634272 ?auto_634283 ) ) ( not ( = ?auto_634272 ?auto_634284 ) ) ( not ( = ?auto_634272 ?auto_634285 ) ) ( not ( = ?auto_634272 ?auto_634286 ) ) ( not ( = ?auto_634273 ?auto_634274 ) ) ( not ( = ?auto_634273 ?auto_634275 ) ) ( not ( = ?auto_634273 ?auto_634276 ) ) ( not ( = ?auto_634273 ?auto_634277 ) ) ( not ( = ?auto_634273 ?auto_634278 ) ) ( not ( = ?auto_634273 ?auto_634279 ) ) ( not ( = ?auto_634273 ?auto_634280 ) ) ( not ( = ?auto_634273 ?auto_634281 ) ) ( not ( = ?auto_634273 ?auto_634282 ) ) ( not ( = ?auto_634273 ?auto_634283 ) ) ( not ( = ?auto_634273 ?auto_634284 ) ) ( not ( = ?auto_634273 ?auto_634285 ) ) ( not ( = ?auto_634273 ?auto_634286 ) ) ( not ( = ?auto_634274 ?auto_634275 ) ) ( not ( = ?auto_634274 ?auto_634276 ) ) ( not ( = ?auto_634274 ?auto_634277 ) ) ( not ( = ?auto_634274 ?auto_634278 ) ) ( not ( = ?auto_634274 ?auto_634279 ) ) ( not ( = ?auto_634274 ?auto_634280 ) ) ( not ( = ?auto_634274 ?auto_634281 ) ) ( not ( = ?auto_634274 ?auto_634282 ) ) ( not ( = ?auto_634274 ?auto_634283 ) ) ( not ( = ?auto_634274 ?auto_634284 ) ) ( not ( = ?auto_634274 ?auto_634285 ) ) ( not ( = ?auto_634274 ?auto_634286 ) ) ( not ( = ?auto_634275 ?auto_634276 ) ) ( not ( = ?auto_634275 ?auto_634277 ) ) ( not ( = ?auto_634275 ?auto_634278 ) ) ( not ( = ?auto_634275 ?auto_634279 ) ) ( not ( = ?auto_634275 ?auto_634280 ) ) ( not ( = ?auto_634275 ?auto_634281 ) ) ( not ( = ?auto_634275 ?auto_634282 ) ) ( not ( = ?auto_634275 ?auto_634283 ) ) ( not ( = ?auto_634275 ?auto_634284 ) ) ( not ( = ?auto_634275 ?auto_634285 ) ) ( not ( = ?auto_634275 ?auto_634286 ) ) ( not ( = ?auto_634276 ?auto_634277 ) ) ( not ( = ?auto_634276 ?auto_634278 ) ) ( not ( = ?auto_634276 ?auto_634279 ) ) ( not ( = ?auto_634276 ?auto_634280 ) ) ( not ( = ?auto_634276 ?auto_634281 ) ) ( not ( = ?auto_634276 ?auto_634282 ) ) ( not ( = ?auto_634276 ?auto_634283 ) ) ( not ( = ?auto_634276 ?auto_634284 ) ) ( not ( = ?auto_634276 ?auto_634285 ) ) ( not ( = ?auto_634276 ?auto_634286 ) ) ( not ( = ?auto_634277 ?auto_634278 ) ) ( not ( = ?auto_634277 ?auto_634279 ) ) ( not ( = ?auto_634277 ?auto_634280 ) ) ( not ( = ?auto_634277 ?auto_634281 ) ) ( not ( = ?auto_634277 ?auto_634282 ) ) ( not ( = ?auto_634277 ?auto_634283 ) ) ( not ( = ?auto_634277 ?auto_634284 ) ) ( not ( = ?auto_634277 ?auto_634285 ) ) ( not ( = ?auto_634277 ?auto_634286 ) ) ( not ( = ?auto_634278 ?auto_634279 ) ) ( not ( = ?auto_634278 ?auto_634280 ) ) ( not ( = ?auto_634278 ?auto_634281 ) ) ( not ( = ?auto_634278 ?auto_634282 ) ) ( not ( = ?auto_634278 ?auto_634283 ) ) ( not ( = ?auto_634278 ?auto_634284 ) ) ( not ( = ?auto_634278 ?auto_634285 ) ) ( not ( = ?auto_634278 ?auto_634286 ) ) ( not ( = ?auto_634279 ?auto_634280 ) ) ( not ( = ?auto_634279 ?auto_634281 ) ) ( not ( = ?auto_634279 ?auto_634282 ) ) ( not ( = ?auto_634279 ?auto_634283 ) ) ( not ( = ?auto_634279 ?auto_634284 ) ) ( not ( = ?auto_634279 ?auto_634285 ) ) ( not ( = ?auto_634279 ?auto_634286 ) ) ( not ( = ?auto_634280 ?auto_634281 ) ) ( not ( = ?auto_634280 ?auto_634282 ) ) ( not ( = ?auto_634280 ?auto_634283 ) ) ( not ( = ?auto_634280 ?auto_634284 ) ) ( not ( = ?auto_634280 ?auto_634285 ) ) ( not ( = ?auto_634280 ?auto_634286 ) ) ( not ( = ?auto_634281 ?auto_634282 ) ) ( not ( = ?auto_634281 ?auto_634283 ) ) ( not ( = ?auto_634281 ?auto_634284 ) ) ( not ( = ?auto_634281 ?auto_634285 ) ) ( not ( = ?auto_634281 ?auto_634286 ) ) ( not ( = ?auto_634282 ?auto_634283 ) ) ( not ( = ?auto_634282 ?auto_634284 ) ) ( not ( = ?auto_634282 ?auto_634285 ) ) ( not ( = ?auto_634282 ?auto_634286 ) ) ( not ( = ?auto_634283 ?auto_634284 ) ) ( not ( = ?auto_634283 ?auto_634285 ) ) ( not ( = ?auto_634283 ?auto_634286 ) ) ( not ( = ?auto_634284 ?auto_634285 ) ) ( not ( = ?auto_634284 ?auto_634286 ) ) ( not ( = ?auto_634285 ?auto_634286 ) ) ( ON ?auto_634284 ?auto_634285 ) ( ON ?auto_634283 ?auto_634284 ) ( ON ?auto_634282 ?auto_634283 ) ( CLEAR ?auto_634280 ) ( ON ?auto_634281 ?auto_634282 ) ( CLEAR ?auto_634281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_634269 ?auto_634270 ?auto_634271 ?auto_634272 ?auto_634273 ?auto_634274 ?auto_634275 ?auto_634276 ?auto_634277 ?auto_634278 ?auto_634279 ?auto_634280 ?auto_634281 )
      ( MAKE-17PILE ?auto_634269 ?auto_634270 ?auto_634271 ?auto_634272 ?auto_634273 ?auto_634274 ?auto_634275 ?auto_634276 ?auto_634277 ?auto_634278 ?auto_634279 ?auto_634280 ?auto_634281 ?auto_634282 ?auto_634283 ?auto_634284 ?auto_634285 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634304 - BLOCK
      ?auto_634305 - BLOCK
      ?auto_634306 - BLOCK
      ?auto_634307 - BLOCK
      ?auto_634308 - BLOCK
      ?auto_634309 - BLOCK
      ?auto_634310 - BLOCK
      ?auto_634311 - BLOCK
      ?auto_634312 - BLOCK
      ?auto_634313 - BLOCK
      ?auto_634314 - BLOCK
      ?auto_634315 - BLOCK
      ?auto_634316 - BLOCK
      ?auto_634317 - BLOCK
      ?auto_634318 - BLOCK
      ?auto_634319 - BLOCK
      ?auto_634320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634320 ) ( ON-TABLE ?auto_634304 ) ( ON ?auto_634305 ?auto_634304 ) ( ON ?auto_634306 ?auto_634305 ) ( ON ?auto_634307 ?auto_634306 ) ( ON ?auto_634308 ?auto_634307 ) ( ON ?auto_634309 ?auto_634308 ) ( ON ?auto_634310 ?auto_634309 ) ( ON ?auto_634311 ?auto_634310 ) ( ON ?auto_634312 ?auto_634311 ) ( ON ?auto_634313 ?auto_634312 ) ( ON ?auto_634314 ?auto_634313 ) ( ON ?auto_634315 ?auto_634314 ) ( not ( = ?auto_634304 ?auto_634305 ) ) ( not ( = ?auto_634304 ?auto_634306 ) ) ( not ( = ?auto_634304 ?auto_634307 ) ) ( not ( = ?auto_634304 ?auto_634308 ) ) ( not ( = ?auto_634304 ?auto_634309 ) ) ( not ( = ?auto_634304 ?auto_634310 ) ) ( not ( = ?auto_634304 ?auto_634311 ) ) ( not ( = ?auto_634304 ?auto_634312 ) ) ( not ( = ?auto_634304 ?auto_634313 ) ) ( not ( = ?auto_634304 ?auto_634314 ) ) ( not ( = ?auto_634304 ?auto_634315 ) ) ( not ( = ?auto_634304 ?auto_634316 ) ) ( not ( = ?auto_634304 ?auto_634317 ) ) ( not ( = ?auto_634304 ?auto_634318 ) ) ( not ( = ?auto_634304 ?auto_634319 ) ) ( not ( = ?auto_634304 ?auto_634320 ) ) ( not ( = ?auto_634305 ?auto_634306 ) ) ( not ( = ?auto_634305 ?auto_634307 ) ) ( not ( = ?auto_634305 ?auto_634308 ) ) ( not ( = ?auto_634305 ?auto_634309 ) ) ( not ( = ?auto_634305 ?auto_634310 ) ) ( not ( = ?auto_634305 ?auto_634311 ) ) ( not ( = ?auto_634305 ?auto_634312 ) ) ( not ( = ?auto_634305 ?auto_634313 ) ) ( not ( = ?auto_634305 ?auto_634314 ) ) ( not ( = ?auto_634305 ?auto_634315 ) ) ( not ( = ?auto_634305 ?auto_634316 ) ) ( not ( = ?auto_634305 ?auto_634317 ) ) ( not ( = ?auto_634305 ?auto_634318 ) ) ( not ( = ?auto_634305 ?auto_634319 ) ) ( not ( = ?auto_634305 ?auto_634320 ) ) ( not ( = ?auto_634306 ?auto_634307 ) ) ( not ( = ?auto_634306 ?auto_634308 ) ) ( not ( = ?auto_634306 ?auto_634309 ) ) ( not ( = ?auto_634306 ?auto_634310 ) ) ( not ( = ?auto_634306 ?auto_634311 ) ) ( not ( = ?auto_634306 ?auto_634312 ) ) ( not ( = ?auto_634306 ?auto_634313 ) ) ( not ( = ?auto_634306 ?auto_634314 ) ) ( not ( = ?auto_634306 ?auto_634315 ) ) ( not ( = ?auto_634306 ?auto_634316 ) ) ( not ( = ?auto_634306 ?auto_634317 ) ) ( not ( = ?auto_634306 ?auto_634318 ) ) ( not ( = ?auto_634306 ?auto_634319 ) ) ( not ( = ?auto_634306 ?auto_634320 ) ) ( not ( = ?auto_634307 ?auto_634308 ) ) ( not ( = ?auto_634307 ?auto_634309 ) ) ( not ( = ?auto_634307 ?auto_634310 ) ) ( not ( = ?auto_634307 ?auto_634311 ) ) ( not ( = ?auto_634307 ?auto_634312 ) ) ( not ( = ?auto_634307 ?auto_634313 ) ) ( not ( = ?auto_634307 ?auto_634314 ) ) ( not ( = ?auto_634307 ?auto_634315 ) ) ( not ( = ?auto_634307 ?auto_634316 ) ) ( not ( = ?auto_634307 ?auto_634317 ) ) ( not ( = ?auto_634307 ?auto_634318 ) ) ( not ( = ?auto_634307 ?auto_634319 ) ) ( not ( = ?auto_634307 ?auto_634320 ) ) ( not ( = ?auto_634308 ?auto_634309 ) ) ( not ( = ?auto_634308 ?auto_634310 ) ) ( not ( = ?auto_634308 ?auto_634311 ) ) ( not ( = ?auto_634308 ?auto_634312 ) ) ( not ( = ?auto_634308 ?auto_634313 ) ) ( not ( = ?auto_634308 ?auto_634314 ) ) ( not ( = ?auto_634308 ?auto_634315 ) ) ( not ( = ?auto_634308 ?auto_634316 ) ) ( not ( = ?auto_634308 ?auto_634317 ) ) ( not ( = ?auto_634308 ?auto_634318 ) ) ( not ( = ?auto_634308 ?auto_634319 ) ) ( not ( = ?auto_634308 ?auto_634320 ) ) ( not ( = ?auto_634309 ?auto_634310 ) ) ( not ( = ?auto_634309 ?auto_634311 ) ) ( not ( = ?auto_634309 ?auto_634312 ) ) ( not ( = ?auto_634309 ?auto_634313 ) ) ( not ( = ?auto_634309 ?auto_634314 ) ) ( not ( = ?auto_634309 ?auto_634315 ) ) ( not ( = ?auto_634309 ?auto_634316 ) ) ( not ( = ?auto_634309 ?auto_634317 ) ) ( not ( = ?auto_634309 ?auto_634318 ) ) ( not ( = ?auto_634309 ?auto_634319 ) ) ( not ( = ?auto_634309 ?auto_634320 ) ) ( not ( = ?auto_634310 ?auto_634311 ) ) ( not ( = ?auto_634310 ?auto_634312 ) ) ( not ( = ?auto_634310 ?auto_634313 ) ) ( not ( = ?auto_634310 ?auto_634314 ) ) ( not ( = ?auto_634310 ?auto_634315 ) ) ( not ( = ?auto_634310 ?auto_634316 ) ) ( not ( = ?auto_634310 ?auto_634317 ) ) ( not ( = ?auto_634310 ?auto_634318 ) ) ( not ( = ?auto_634310 ?auto_634319 ) ) ( not ( = ?auto_634310 ?auto_634320 ) ) ( not ( = ?auto_634311 ?auto_634312 ) ) ( not ( = ?auto_634311 ?auto_634313 ) ) ( not ( = ?auto_634311 ?auto_634314 ) ) ( not ( = ?auto_634311 ?auto_634315 ) ) ( not ( = ?auto_634311 ?auto_634316 ) ) ( not ( = ?auto_634311 ?auto_634317 ) ) ( not ( = ?auto_634311 ?auto_634318 ) ) ( not ( = ?auto_634311 ?auto_634319 ) ) ( not ( = ?auto_634311 ?auto_634320 ) ) ( not ( = ?auto_634312 ?auto_634313 ) ) ( not ( = ?auto_634312 ?auto_634314 ) ) ( not ( = ?auto_634312 ?auto_634315 ) ) ( not ( = ?auto_634312 ?auto_634316 ) ) ( not ( = ?auto_634312 ?auto_634317 ) ) ( not ( = ?auto_634312 ?auto_634318 ) ) ( not ( = ?auto_634312 ?auto_634319 ) ) ( not ( = ?auto_634312 ?auto_634320 ) ) ( not ( = ?auto_634313 ?auto_634314 ) ) ( not ( = ?auto_634313 ?auto_634315 ) ) ( not ( = ?auto_634313 ?auto_634316 ) ) ( not ( = ?auto_634313 ?auto_634317 ) ) ( not ( = ?auto_634313 ?auto_634318 ) ) ( not ( = ?auto_634313 ?auto_634319 ) ) ( not ( = ?auto_634313 ?auto_634320 ) ) ( not ( = ?auto_634314 ?auto_634315 ) ) ( not ( = ?auto_634314 ?auto_634316 ) ) ( not ( = ?auto_634314 ?auto_634317 ) ) ( not ( = ?auto_634314 ?auto_634318 ) ) ( not ( = ?auto_634314 ?auto_634319 ) ) ( not ( = ?auto_634314 ?auto_634320 ) ) ( not ( = ?auto_634315 ?auto_634316 ) ) ( not ( = ?auto_634315 ?auto_634317 ) ) ( not ( = ?auto_634315 ?auto_634318 ) ) ( not ( = ?auto_634315 ?auto_634319 ) ) ( not ( = ?auto_634315 ?auto_634320 ) ) ( not ( = ?auto_634316 ?auto_634317 ) ) ( not ( = ?auto_634316 ?auto_634318 ) ) ( not ( = ?auto_634316 ?auto_634319 ) ) ( not ( = ?auto_634316 ?auto_634320 ) ) ( not ( = ?auto_634317 ?auto_634318 ) ) ( not ( = ?auto_634317 ?auto_634319 ) ) ( not ( = ?auto_634317 ?auto_634320 ) ) ( not ( = ?auto_634318 ?auto_634319 ) ) ( not ( = ?auto_634318 ?auto_634320 ) ) ( not ( = ?auto_634319 ?auto_634320 ) ) ( ON ?auto_634319 ?auto_634320 ) ( ON ?auto_634318 ?auto_634319 ) ( ON ?auto_634317 ?auto_634318 ) ( CLEAR ?auto_634315 ) ( ON ?auto_634316 ?auto_634317 ) ( CLEAR ?auto_634316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_634304 ?auto_634305 ?auto_634306 ?auto_634307 ?auto_634308 ?auto_634309 ?auto_634310 ?auto_634311 ?auto_634312 ?auto_634313 ?auto_634314 ?auto_634315 ?auto_634316 )
      ( MAKE-17PILE ?auto_634304 ?auto_634305 ?auto_634306 ?auto_634307 ?auto_634308 ?auto_634309 ?auto_634310 ?auto_634311 ?auto_634312 ?auto_634313 ?auto_634314 ?auto_634315 ?auto_634316 ?auto_634317 ?auto_634318 ?auto_634319 ?auto_634320 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634338 - BLOCK
      ?auto_634339 - BLOCK
      ?auto_634340 - BLOCK
      ?auto_634341 - BLOCK
      ?auto_634342 - BLOCK
      ?auto_634343 - BLOCK
      ?auto_634344 - BLOCK
      ?auto_634345 - BLOCK
      ?auto_634346 - BLOCK
      ?auto_634347 - BLOCK
      ?auto_634348 - BLOCK
      ?auto_634349 - BLOCK
      ?auto_634350 - BLOCK
      ?auto_634351 - BLOCK
      ?auto_634352 - BLOCK
      ?auto_634353 - BLOCK
      ?auto_634354 - BLOCK
    )
    :vars
    (
      ?auto_634355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634354 ?auto_634355 ) ( ON-TABLE ?auto_634338 ) ( ON ?auto_634339 ?auto_634338 ) ( ON ?auto_634340 ?auto_634339 ) ( ON ?auto_634341 ?auto_634340 ) ( ON ?auto_634342 ?auto_634341 ) ( ON ?auto_634343 ?auto_634342 ) ( ON ?auto_634344 ?auto_634343 ) ( ON ?auto_634345 ?auto_634344 ) ( ON ?auto_634346 ?auto_634345 ) ( ON ?auto_634347 ?auto_634346 ) ( ON ?auto_634348 ?auto_634347 ) ( not ( = ?auto_634338 ?auto_634339 ) ) ( not ( = ?auto_634338 ?auto_634340 ) ) ( not ( = ?auto_634338 ?auto_634341 ) ) ( not ( = ?auto_634338 ?auto_634342 ) ) ( not ( = ?auto_634338 ?auto_634343 ) ) ( not ( = ?auto_634338 ?auto_634344 ) ) ( not ( = ?auto_634338 ?auto_634345 ) ) ( not ( = ?auto_634338 ?auto_634346 ) ) ( not ( = ?auto_634338 ?auto_634347 ) ) ( not ( = ?auto_634338 ?auto_634348 ) ) ( not ( = ?auto_634338 ?auto_634349 ) ) ( not ( = ?auto_634338 ?auto_634350 ) ) ( not ( = ?auto_634338 ?auto_634351 ) ) ( not ( = ?auto_634338 ?auto_634352 ) ) ( not ( = ?auto_634338 ?auto_634353 ) ) ( not ( = ?auto_634338 ?auto_634354 ) ) ( not ( = ?auto_634338 ?auto_634355 ) ) ( not ( = ?auto_634339 ?auto_634340 ) ) ( not ( = ?auto_634339 ?auto_634341 ) ) ( not ( = ?auto_634339 ?auto_634342 ) ) ( not ( = ?auto_634339 ?auto_634343 ) ) ( not ( = ?auto_634339 ?auto_634344 ) ) ( not ( = ?auto_634339 ?auto_634345 ) ) ( not ( = ?auto_634339 ?auto_634346 ) ) ( not ( = ?auto_634339 ?auto_634347 ) ) ( not ( = ?auto_634339 ?auto_634348 ) ) ( not ( = ?auto_634339 ?auto_634349 ) ) ( not ( = ?auto_634339 ?auto_634350 ) ) ( not ( = ?auto_634339 ?auto_634351 ) ) ( not ( = ?auto_634339 ?auto_634352 ) ) ( not ( = ?auto_634339 ?auto_634353 ) ) ( not ( = ?auto_634339 ?auto_634354 ) ) ( not ( = ?auto_634339 ?auto_634355 ) ) ( not ( = ?auto_634340 ?auto_634341 ) ) ( not ( = ?auto_634340 ?auto_634342 ) ) ( not ( = ?auto_634340 ?auto_634343 ) ) ( not ( = ?auto_634340 ?auto_634344 ) ) ( not ( = ?auto_634340 ?auto_634345 ) ) ( not ( = ?auto_634340 ?auto_634346 ) ) ( not ( = ?auto_634340 ?auto_634347 ) ) ( not ( = ?auto_634340 ?auto_634348 ) ) ( not ( = ?auto_634340 ?auto_634349 ) ) ( not ( = ?auto_634340 ?auto_634350 ) ) ( not ( = ?auto_634340 ?auto_634351 ) ) ( not ( = ?auto_634340 ?auto_634352 ) ) ( not ( = ?auto_634340 ?auto_634353 ) ) ( not ( = ?auto_634340 ?auto_634354 ) ) ( not ( = ?auto_634340 ?auto_634355 ) ) ( not ( = ?auto_634341 ?auto_634342 ) ) ( not ( = ?auto_634341 ?auto_634343 ) ) ( not ( = ?auto_634341 ?auto_634344 ) ) ( not ( = ?auto_634341 ?auto_634345 ) ) ( not ( = ?auto_634341 ?auto_634346 ) ) ( not ( = ?auto_634341 ?auto_634347 ) ) ( not ( = ?auto_634341 ?auto_634348 ) ) ( not ( = ?auto_634341 ?auto_634349 ) ) ( not ( = ?auto_634341 ?auto_634350 ) ) ( not ( = ?auto_634341 ?auto_634351 ) ) ( not ( = ?auto_634341 ?auto_634352 ) ) ( not ( = ?auto_634341 ?auto_634353 ) ) ( not ( = ?auto_634341 ?auto_634354 ) ) ( not ( = ?auto_634341 ?auto_634355 ) ) ( not ( = ?auto_634342 ?auto_634343 ) ) ( not ( = ?auto_634342 ?auto_634344 ) ) ( not ( = ?auto_634342 ?auto_634345 ) ) ( not ( = ?auto_634342 ?auto_634346 ) ) ( not ( = ?auto_634342 ?auto_634347 ) ) ( not ( = ?auto_634342 ?auto_634348 ) ) ( not ( = ?auto_634342 ?auto_634349 ) ) ( not ( = ?auto_634342 ?auto_634350 ) ) ( not ( = ?auto_634342 ?auto_634351 ) ) ( not ( = ?auto_634342 ?auto_634352 ) ) ( not ( = ?auto_634342 ?auto_634353 ) ) ( not ( = ?auto_634342 ?auto_634354 ) ) ( not ( = ?auto_634342 ?auto_634355 ) ) ( not ( = ?auto_634343 ?auto_634344 ) ) ( not ( = ?auto_634343 ?auto_634345 ) ) ( not ( = ?auto_634343 ?auto_634346 ) ) ( not ( = ?auto_634343 ?auto_634347 ) ) ( not ( = ?auto_634343 ?auto_634348 ) ) ( not ( = ?auto_634343 ?auto_634349 ) ) ( not ( = ?auto_634343 ?auto_634350 ) ) ( not ( = ?auto_634343 ?auto_634351 ) ) ( not ( = ?auto_634343 ?auto_634352 ) ) ( not ( = ?auto_634343 ?auto_634353 ) ) ( not ( = ?auto_634343 ?auto_634354 ) ) ( not ( = ?auto_634343 ?auto_634355 ) ) ( not ( = ?auto_634344 ?auto_634345 ) ) ( not ( = ?auto_634344 ?auto_634346 ) ) ( not ( = ?auto_634344 ?auto_634347 ) ) ( not ( = ?auto_634344 ?auto_634348 ) ) ( not ( = ?auto_634344 ?auto_634349 ) ) ( not ( = ?auto_634344 ?auto_634350 ) ) ( not ( = ?auto_634344 ?auto_634351 ) ) ( not ( = ?auto_634344 ?auto_634352 ) ) ( not ( = ?auto_634344 ?auto_634353 ) ) ( not ( = ?auto_634344 ?auto_634354 ) ) ( not ( = ?auto_634344 ?auto_634355 ) ) ( not ( = ?auto_634345 ?auto_634346 ) ) ( not ( = ?auto_634345 ?auto_634347 ) ) ( not ( = ?auto_634345 ?auto_634348 ) ) ( not ( = ?auto_634345 ?auto_634349 ) ) ( not ( = ?auto_634345 ?auto_634350 ) ) ( not ( = ?auto_634345 ?auto_634351 ) ) ( not ( = ?auto_634345 ?auto_634352 ) ) ( not ( = ?auto_634345 ?auto_634353 ) ) ( not ( = ?auto_634345 ?auto_634354 ) ) ( not ( = ?auto_634345 ?auto_634355 ) ) ( not ( = ?auto_634346 ?auto_634347 ) ) ( not ( = ?auto_634346 ?auto_634348 ) ) ( not ( = ?auto_634346 ?auto_634349 ) ) ( not ( = ?auto_634346 ?auto_634350 ) ) ( not ( = ?auto_634346 ?auto_634351 ) ) ( not ( = ?auto_634346 ?auto_634352 ) ) ( not ( = ?auto_634346 ?auto_634353 ) ) ( not ( = ?auto_634346 ?auto_634354 ) ) ( not ( = ?auto_634346 ?auto_634355 ) ) ( not ( = ?auto_634347 ?auto_634348 ) ) ( not ( = ?auto_634347 ?auto_634349 ) ) ( not ( = ?auto_634347 ?auto_634350 ) ) ( not ( = ?auto_634347 ?auto_634351 ) ) ( not ( = ?auto_634347 ?auto_634352 ) ) ( not ( = ?auto_634347 ?auto_634353 ) ) ( not ( = ?auto_634347 ?auto_634354 ) ) ( not ( = ?auto_634347 ?auto_634355 ) ) ( not ( = ?auto_634348 ?auto_634349 ) ) ( not ( = ?auto_634348 ?auto_634350 ) ) ( not ( = ?auto_634348 ?auto_634351 ) ) ( not ( = ?auto_634348 ?auto_634352 ) ) ( not ( = ?auto_634348 ?auto_634353 ) ) ( not ( = ?auto_634348 ?auto_634354 ) ) ( not ( = ?auto_634348 ?auto_634355 ) ) ( not ( = ?auto_634349 ?auto_634350 ) ) ( not ( = ?auto_634349 ?auto_634351 ) ) ( not ( = ?auto_634349 ?auto_634352 ) ) ( not ( = ?auto_634349 ?auto_634353 ) ) ( not ( = ?auto_634349 ?auto_634354 ) ) ( not ( = ?auto_634349 ?auto_634355 ) ) ( not ( = ?auto_634350 ?auto_634351 ) ) ( not ( = ?auto_634350 ?auto_634352 ) ) ( not ( = ?auto_634350 ?auto_634353 ) ) ( not ( = ?auto_634350 ?auto_634354 ) ) ( not ( = ?auto_634350 ?auto_634355 ) ) ( not ( = ?auto_634351 ?auto_634352 ) ) ( not ( = ?auto_634351 ?auto_634353 ) ) ( not ( = ?auto_634351 ?auto_634354 ) ) ( not ( = ?auto_634351 ?auto_634355 ) ) ( not ( = ?auto_634352 ?auto_634353 ) ) ( not ( = ?auto_634352 ?auto_634354 ) ) ( not ( = ?auto_634352 ?auto_634355 ) ) ( not ( = ?auto_634353 ?auto_634354 ) ) ( not ( = ?auto_634353 ?auto_634355 ) ) ( not ( = ?auto_634354 ?auto_634355 ) ) ( ON ?auto_634353 ?auto_634354 ) ( ON ?auto_634352 ?auto_634353 ) ( ON ?auto_634351 ?auto_634352 ) ( ON ?auto_634350 ?auto_634351 ) ( CLEAR ?auto_634348 ) ( ON ?auto_634349 ?auto_634350 ) ( CLEAR ?auto_634349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_634338 ?auto_634339 ?auto_634340 ?auto_634341 ?auto_634342 ?auto_634343 ?auto_634344 ?auto_634345 ?auto_634346 ?auto_634347 ?auto_634348 ?auto_634349 )
      ( MAKE-17PILE ?auto_634338 ?auto_634339 ?auto_634340 ?auto_634341 ?auto_634342 ?auto_634343 ?auto_634344 ?auto_634345 ?auto_634346 ?auto_634347 ?auto_634348 ?auto_634349 ?auto_634350 ?auto_634351 ?auto_634352 ?auto_634353 ?auto_634354 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634373 - BLOCK
      ?auto_634374 - BLOCK
      ?auto_634375 - BLOCK
      ?auto_634376 - BLOCK
      ?auto_634377 - BLOCK
      ?auto_634378 - BLOCK
      ?auto_634379 - BLOCK
      ?auto_634380 - BLOCK
      ?auto_634381 - BLOCK
      ?auto_634382 - BLOCK
      ?auto_634383 - BLOCK
      ?auto_634384 - BLOCK
      ?auto_634385 - BLOCK
      ?auto_634386 - BLOCK
      ?auto_634387 - BLOCK
      ?auto_634388 - BLOCK
      ?auto_634389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634389 ) ( ON-TABLE ?auto_634373 ) ( ON ?auto_634374 ?auto_634373 ) ( ON ?auto_634375 ?auto_634374 ) ( ON ?auto_634376 ?auto_634375 ) ( ON ?auto_634377 ?auto_634376 ) ( ON ?auto_634378 ?auto_634377 ) ( ON ?auto_634379 ?auto_634378 ) ( ON ?auto_634380 ?auto_634379 ) ( ON ?auto_634381 ?auto_634380 ) ( ON ?auto_634382 ?auto_634381 ) ( ON ?auto_634383 ?auto_634382 ) ( not ( = ?auto_634373 ?auto_634374 ) ) ( not ( = ?auto_634373 ?auto_634375 ) ) ( not ( = ?auto_634373 ?auto_634376 ) ) ( not ( = ?auto_634373 ?auto_634377 ) ) ( not ( = ?auto_634373 ?auto_634378 ) ) ( not ( = ?auto_634373 ?auto_634379 ) ) ( not ( = ?auto_634373 ?auto_634380 ) ) ( not ( = ?auto_634373 ?auto_634381 ) ) ( not ( = ?auto_634373 ?auto_634382 ) ) ( not ( = ?auto_634373 ?auto_634383 ) ) ( not ( = ?auto_634373 ?auto_634384 ) ) ( not ( = ?auto_634373 ?auto_634385 ) ) ( not ( = ?auto_634373 ?auto_634386 ) ) ( not ( = ?auto_634373 ?auto_634387 ) ) ( not ( = ?auto_634373 ?auto_634388 ) ) ( not ( = ?auto_634373 ?auto_634389 ) ) ( not ( = ?auto_634374 ?auto_634375 ) ) ( not ( = ?auto_634374 ?auto_634376 ) ) ( not ( = ?auto_634374 ?auto_634377 ) ) ( not ( = ?auto_634374 ?auto_634378 ) ) ( not ( = ?auto_634374 ?auto_634379 ) ) ( not ( = ?auto_634374 ?auto_634380 ) ) ( not ( = ?auto_634374 ?auto_634381 ) ) ( not ( = ?auto_634374 ?auto_634382 ) ) ( not ( = ?auto_634374 ?auto_634383 ) ) ( not ( = ?auto_634374 ?auto_634384 ) ) ( not ( = ?auto_634374 ?auto_634385 ) ) ( not ( = ?auto_634374 ?auto_634386 ) ) ( not ( = ?auto_634374 ?auto_634387 ) ) ( not ( = ?auto_634374 ?auto_634388 ) ) ( not ( = ?auto_634374 ?auto_634389 ) ) ( not ( = ?auto_634375 ?auto_634376 ) ) ( not ( = ?auto_634375 ?auto_634377 ) ) ( not ( = ?auto_634375 ?auto_634378 ) ) ( not ( = ?auto_634375 ?auto_634379 ) ) ( not ( = ?auto_634375 ?auto_634380 ) ) ( not ( = ?auto_634375 ?auto_634381 ) ) ( not ( = ?auto_634375 ?auto_634382 ) ) ( not ( = ?auto_634375 ?auto_634383 ) ) ( not ( = ?auto_634375 ?auto_634384 ) ) ( not ( = ?auto_634375 ?auto_634385 ) ) ( not ( = ?auto_634375 ?auto_634386 ) ) ( not ( = ?auto_634375 ?auto_634387 ) ) ( not ( = ?auto_634375 ?auto_634388 ) ) ( not ( = ?auto_634375 ?auto_634389 ) ) ( not ( = ?auto_634376 ?auto_634377 ) ) ( not ( = ?auto_634376 ?auto_634378 ) ) ( not ( = ?auto_634376 ?auto_634379 ) ) ( not ( = ?auto_634376 ?auto_634380 ) ) ( not ( = ?auto_634376 ?auto_634381 ) ) ( not ( = ?auto_634376 ?auto_634382 ) ) ( not ( = ?auto_634376 ?auto_634383 ) ) ( not ( = ?auto_634376 ?auto_634384 ) ) ( not ( = ?auto_634376 ?auto_634385 ) ) ( not ( = ?auto_634376 ?auto_634386 ) ) ( not ( = ?auto_634376 ?auto_634387 ) ) ( not ( = ?auto_634376 ?auto_634388 ) ) ( not ( = ?auto_634376 ?auto_634389 ) ) ( not ( = ?auto_634377 ?auto_634378 ) ) ( not ( = ?auto_634377 ?auto_634379 ) ) ( not ( = ?auto_634377 ?auto_634380 ) ) ( not ( = ?auto_634377 ?auto_634381 ) ) ( not ( = ?auto_634377 ?auto_634382 ) ) ( not ( = ?auto_634377 ?auto_634383 ) ) ( not ( = ?auto_634377 ?auto_634384 ) ) ( not ( = ?auto_634377 ?auto_634385 ) ) ( not ( = ?auto_634377 ?auto_634386 ) ) ( not ( = ?auto_634377 ?auto_634387 ) ) ( not ( = ?auto_634377 ?auto_634388 ) ) ( not ( = ?auto_634377 ?auto_634389 ) ) ( not ( = ?auto_634378 ?auto_634379 ) ) ( not ( = ?auto_634378 ?auto_634380 ) ) ( not ( = ?auto_634378 ?auto_634381 ) ) ( not ( = ?auto_634378 ?auto_634382 ) ) ( not ( = ?auto_634378 ?auto_634383 ) ) ( not ( = ?auto_634378 ?auto_634384 ) ) ( not ( = ?auto_634378 ?auto_634385 ) ) ( not ( = ?auto_634378 ?auto_634386 ) ) ( not ( = ?auto_634378 ?auto_634387 ) ) ( not ( = ?auto_634378 ?auto_634388 ) ) ( not ( = ?auto_634378 ?auto_634389 ) ) ( not ( = ?auto_634379 ?auto_634380 ) ) ( not ( = ?auto_634379 ?auto_634381 ) ) ( not ( = ?auto_634379 ?auto_634382 ) ) ( not ( = ?auto_634379 ?auto_634383 ) ) ( not ( = ?auto_634379 ?auto_634384 ) ) ( not ( = ?auto_634379 ?auto_634385 ) ) ( not ( = ?auto_634379 ?auto_634386 ) ) ( not ( = ?auto_634379 ?auto_634387 ) ) ( not ( = ?auto_634379 ?auto_634388 ) ) ( not ( = ?auto_634379 ?auto_634389 ) ) ( not ( = ?auto_634380 ?auto_634381 ) ) ( not ( = ?auto_634380 ?auto_634382 ) ) ( not ( = ?auto_634380 ?auto_634383 ) ) ( not ( = ?auto_634380 ?auto_634384 ) ) ( not ( = ?auto_634380 ?auto_634385 ) ) ( not ( = ?auto_634380 ?auto_634386 ) ) ( not ( = ?auto_634380 ?auto_634387 ) ) ( not ( = ?auto_634380 ?auto_634388 ) ) ( not ( = ?auto_634380 ?auto_634389 ) ) ( not ( = ?auto_634381 ?auto_634382 ) ) ( not ( = ?auto_634381 ?auto_634383 ) ) ( not ( = ?auto_634381 ?auto_634384 ) ) ( not ( = ?auto_634381 ?auto_634385 ) ) ( not ( = ?auto_634381 ?auto_634386 ) ) ( not ( = ?auto_634381 ?auto_634387 ) ) ( not ( = ?auto_634381 ?auto_634388 ) ) ( not ( = ?auto_634381 ?auto_634389 ) ) ( not ( = ?auto_634382 ?auto_634383 ) ) ( not ( = ?auto_634382 ?auto_634384 ) ) ( not ( = ?auto_634382 ?auto_634385 ) ) ( not ( = ?auto_634382 ?auto_634386 ) ) ( not ( = ?auto_634382 ?auto_634387 ) ) ( not ( = ?auto_634382 ?auto_634388 ) ) ( not ( = ?auto_634382 ?auto_634389 ) ) ( not ( = ?auto_634383 ?auto_634384 ) ) ( not ( = ?auto_634383 ?auto_634385 ) ) ( not ( = ?auto_634383 ?auto_634386 ) ) ( not ( = ?auto_634383 ?auto_634387 ) ) ( not ( = ?auto_634383 ?auto_634388 ) ) ( not ( = ?auto_634383 ?auto_634389 ) ) ( not ( = ?auto_634384 ?auto_634385 ) ) ( not ( = ?auto_634384 ?auto_634386 ) ) ( not ( = ?auto_634384 ?auto_634387 ) ) ( not ( = ?auto_634384 ?auto_634388 ) ) ( not ( = ?auto_634384 ?auto_634389 ) ) ( not ( = ?auto_634385 ?auto_634386 ) ) ( not ( = ?auto_634385 ?auto_634387 ) ) ( not ( = ?auto_634385 ?auto_634388 ) ) ( not ( = ?auto_634385 ?auto_634389 ) ) ( not ( = ?auto_634386 ?auto_634387 ) ) ( not ( = ?auto_634386 ?auto_634388 ) ) ( not ( = ?auto_634386 ?auto_634389 ) ) ( not ( = ?auto_634387 ?auto_634388 ) ) ( not ( = ?auto_634387 ?auto_634389 ) ) ( not ( = ?auto_634388 ?auto_634389 ) ) ( ON ?auto_634388 ?auto_634389 ) ( ON ?auto_634387 ?auto_634388 ) ( ON ?auto_634386 ?auto_634387 ) ( ON ?auto_634385 ?auto_634386 ) ( CLEAR ?auto_634383 ) ( ON ?auto_634384 ?auto_634385 ) ( CLEAR ?auto_634384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_634373 ?auto_634374 ?auto_634375 ?auto_634376 ?auto_634377 ?auto_634378 ?auto_634379 ?auto_634380 ?auto_634381 ?auto_634382 ?auto_634383 ?auto_634384 )
      ( MAKE-17PILE ?auto_634373 ?auto_634374 ?auto_634375 ?auto_634376 ?auto_634377 ?auto_634378 ?auto_634379 ?auto_634380 ?auto_634381 ?auto_634382 ?auto_634383 ?auto_634384 ?auto_634385 ?auto_634386 ?auto_634387 ?auto_634388 ?auto_634389 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634407 - BLOCK
      ?auto_634408 - BLOCK
      ?auto_634409 - BLOCK
      ?auto_634410 - BLOCK
      ?auto_634411 - BLOCK
      ?auto_634412 - BLOCK
      ?auto_634413 - BLOCK
      ?auto_634414 - BLOCK
      ?auto_634415 - BLOCK
      ?auto_634416 - BLOCK
      ?auto_634417 - BLOCK
      ?auto_634418 - BLOCK
      ?auto_634419 - BLOCK
      ?auto_634420 - BLOCK
      ?auto_634421 - BLOCK
      ?auto_634422 - BLOCK
      ?auto_634423 - BLOCK
    )
    :vars
    (
      ?auto_634424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634423 ?auto_634424 ) ( ON-TABLE ?auto_634407 ) ( ON ?auto_634408 ?auto_634407 ) ( ON ?auto_634409 ?auto_634408 ) ( ON ?auto_634410 ?auto_634409 ) ( ON ?auto_634411 ?auto_634410 ) ( ON ?auto_634412 ?auto_634411 ) ( ON ?auto_634413 ?auto_634412 ) ( ON ?auto_634414 ?auto_634413 ) ( ON ?auto_634415 ?auto_634414 ) ( ON ?auto_634416 ?auto_634415 ) ( not ( = ?auto_634407 ?auto_634408 ) ) ( not ( = ?auto_634407 ?auto_634409 ) ) ( not ( = ?auto_634407 ?auto_634410 ) ) ( not ( = ?auto_634407 ?auto_634411 ) ) ( not ( = ?auto_634407 ?auto_634412 ) ) ( not ( = ?auto_634407 ?auto_634413 ) ) ( not ( = ?auto_634407 ?auto_634414 ) ) ( not ( = ?auto_634407 ?auto_634415 ) ) ( not ( = ?auto_634407 ?auto_634416 ) ) ( not ( = ?auto_634407 ?auto_634417 ) ) ( not ( = ?auto_634407 ?auto_634418 ) ) ( not ( = ?auto_634407 ?auto_634419 ) ) ( not ( = ?auto_634407 ?auto_634420 ) ) ( not ( = ?auto_634407 ?auto_634421 ) ) ( not ( = ?auto_634407 ?auto_634422 ) ) ( not ( = ?auto_634407 ?auto_634423 ) ) ( not ( = ?auto_634407 ?auto_634424 ) ) ( not ( = ?auto_634408 ?auto_634409 ) ) ( not ( = ?auto_634408 ?auto_634410 ) ) ( not ( = ?auto_634408 ?auto_634411 ) ) ( not ( = ?auto_634408 ?auto_634412 ) ) ( not ( = ?auto_634408 ?auto_634413 ) ) ( not ( = ?auto_634408 ?auto_634414 ) ) ( not ( = ?auto_634408 ?auto_634415 ) ) ( not ( = ?auto_634408 ?auto_634416 ) ) ( not ( = ?auto_634408 ?auto_634417 ) ) ( not ( = ?auto_634408 ?auto_634418 ) ) ( not ( = ?auto_634408 ?auto_634419 ) ) ( not ( = ?auto_634408 ?auto_634420 ) ) ( not ( = ?auto_634408 ?auto_634421 ) ) ( not ( = ?auto_634408 ?auto_634422 ) ) ( not ( = ?auto_634408 ?auto_634423 ) ) ( not ( = ?auto_634408 ?auto_634424 ) ) ( not ( = ?auto_634409 ?auto_634410 ) ) ( not ( = ?auto_634409 ?auto_634411 ) ) ( not ( = ?auto_634409 ?auto_634412 ) ) ( not ( = ?auto_634409 ?auto_634413 ) ) ( not ( = ?auto_634409 ?auto_634414 ) ) ( not ( = ?auto_634409 ?auto_634415 ) ) ( not ( = ?auto_634409 ?auto_634416 ) ) ( not ( = ?auto_634409 ?auto_634417 ) ) ( not ( = ?auto_634409 ?auto_634418 ) ) ( not ( = ?auto_634409 ?auto_634419 ) ) ( not ( = ?auto_634409 ?auto_634420 ) ) ( not ( = ?auto_634409 ?auto_634421 ) ) ( not ( = ?auto_634409 ?auto_634422 ) ) ( not ( = ?auto_634409 ?auto_634423 ) ) ( not ( = ?auto_634409 ?auto_634424 ) ) ( not ( = ?auto_634410 ?auto_634411 ) ) ( not ( = ?auto_634410 ?auto_634412 ) ) ( not ( = ?auto_634410 ?auto_634413 ) ) ( not ( = ?auto_634410 ?auto_634414 ) ) ( not ( = ?auto_634410 ?auto_634415 ) ) ( not ( = ?auto_634410 ?auto_634416 ) ) ( not ( = ?auto_634410 ?auto_634417 ) ) ( not ( = ?auto_634410 ?auto_634418 ) ) ( not ( = ?auto_634410 ?auto_634419 ) ) ( not ( = ?auto_634410 ?auto_634420 ) ) ( not ( = ?auto_634410 ?auto_634421 ) ) ( not ( = ?auto_634410 ?auto_634422 ) ) ( not ( = ?auto_634410 ?auto_634423 ) ) ( not ( = ?auto_634410 ?auto_634424 ) ) ( not ( = ?auto_634411 ?auto_634412 ) ) ( not ( = ?auto_634411 ?auto_634413 ) ) ( not ( = ?auto_634411 ?auto_634414 ) ) ( not ( = ?auto_634411 ?auto_634415 ) ) ( not ( = ?auto_634411 ?auto_634416 ) ) ( not ( = ?auto_634411 ?auto_634417 ) ) ( not ( = ?auto_634411 ?auto_634418 ) ) ( not ( = ?auto_634411 ?auto_634419 ) ) ( not ( = ?auto_634411 ?auto_634420 ) ) ( not ( = ?auto_634411 ?auto_634421 ) ) ( not ( = ?auto_634411 ?auto_634422 ) ) ( not ( = ?auto_634411 ?auto_634423 ) ) ( not ( = ?auto_634411 ?auto_634424 ) ) ( not ( = ?auto_634412 ?auto_634413 ) ) ( not ( = ?auto_634412 ?auto_634414 ) ) ( not ( = ?auto_634412 ?auto_634415 ) ) ( not ( = ?auto_634412 ?auto_634416 ) ) ( not ( = ?auto_634412 ?auto_634417 ) ) ( not ( = ?auto_634412 ?auto_634418 ) ) ( not ( = ?auto_634412 ?auto_634419 ) ) ( not ( = ?auto_634412 ?auto_634420 ) ) ( not ( = ?auto_634412 ?auto_634421 ) ) ( not ( = ?auto_634412 ?auto_634422 ) ) ( not ( = ?auto_634412 ?auto_634423 ) ) ( not ( = ?auto_634412 ?auto_634424 ) ) ( not ( = ?auto_634413 ?auto_634414 ) ) ( not ( = ?auto_634413 ?auto_634415 ) ) ( not ( = ?auto_634413 ?auto_634416 ) ) ( not ( = ?auto_634413 ?auto_634417 ) ) ( not ( = ?auto_634413 ?auto_634418 ) ) ( not ( = ?auto_634413 ?auto_634419 ) ) ( not ( = ?auto_634413 ?auto_634420 ) ) ( not ( = ?auto_634413 ?auto_634421 ) ) ( not ( = ?auto_634413 ?auto_634422 ) ) ( not ( = ?auto_634413 ?auto_634423 ) ) ( not ( = ?auto_634413 ?auto_634424 ) ) ( not ( = ?auto_634414 ?auto_634415 ) ) ( not ( = ?auto_634414 ?auto_634416 ) ) ( not ( = ?auto_634414 ?auto_634417 ) ) ( not ( = ?auto_634414 ?auto_634418 ) ) ( not ( = ?auto_634414 ?auto_634419 ) ) ( not ( = ?auto_634414 ?auto_634420 ) ) ( not ( = ?auto_634414 ?auto_634421 ) ) ( not ( = ?auto_634414 ?auto_634422 ) ) ( not ( = ?auto_634414 ?auto_634423 ) ) ( not ( = ?auto_634414 ?auto_634424 ) ) ( not ( = ?auto_634415 ?auto_634416 ) ) ( not ( = ?auto_634415 ?auto_634417 ) ) ( not ( = ?auto_634415 ?auto_634418 ) ) ( not ( = ?auto_634415 ?auto_634419 ) ) ( not ( = ?auto_634415 ?auto_634420 ) ) ( not ( = ?auto_634415 ?auto_634421 ) ) ( not ( = ?auto_634415 ?auto_634422 ) ) ( not ( = ?auto_634415 ?auto_634423 ) ) ( not ( = ?auto_634415 ?auto_634424 ) ) ( not ( = ?auto_634416 ?auto_634417 ) ) ( not ( = ?auto_634416 ?auto_634418 ) ) ( not ( = ?auto_634416 ?auto_634419 ) ) ( not ( = ?auto_634416 ?auto_634420 ) ) ( not ( = ?auto_634416 ?auto_634421 ) ) ( not ( = ?auto_634416 ?auto_634422 ) ) ( not ( = ?auto_634416 ?auto_634423 ) ) ( not ( = ?auto_634416 ?auto_634424 ) ) ( not ( = ?auto_634417 ?auto_634418 ) ) ( not ( = ?auto_634417 ?auto_634419 ) ) ( not ( = ?auto_634417 ?auto_634420 ) ) ( not ( = ?auto_634417 ?auto_634421 ) ) ( not ( = ?auto_634417 ?auto_634422 ) ) ( not ( = ?auto_634417 ?auto_634423 ) ) ( not ( = ?auto_634417 ?auto_634424 ) ) ( not ( = ?auto_634418 ?auto_634419 ) ) ( not ( = ?auto_634418 ?auto_634420 ) ) ( not ( = ?auto_634418 ?auto_634421 ) ) ( not ( = ?auto_634418 ?auto_634422 ) ) ( not ( = ?auto_634418 ?auto_634423 ) ) ( not ( = ?auto_634418 ?auto_634424 ) ) ( not ( = ?auto_634419 ?auto_634420 ) ) ( not ( = ?auto_634419 ?auto_634421 ) ) ( not ( = ?auto_634419 ?auto_634422 ) ) ( not ( = ?auto_634419 ?auto_634423 ) ) ( not ( = ?auto_634419 ?auto_634424 ) ) ( not ( = ?auto_634420 ?auto_634421 ) ) ( not ( = ?auto_634420 ?auto_634422 ) ) ( not ( = ?auto_634420 ?auto_634423 ) ) ( not ( = ?auto_634420 ?auto_634424 ) ) ( not ( = ?auto_634421 ?auto_634422 ) ) ( not ( = ?auto_634421 ?auto_634423 ) ) ( not ( = ?auto_634421 ?auto_634424 ) ) ( not ( = ?auto_634422 ?auto_634423 ) ) ( not ( = ?auto_634422 ?auto_634424 ) ) ( not ( = ?auto_634423 ?auto_634424 ) ) ( ON ?auto_634422 ?auto_634423 ) ( ON ?auto_634421 ?auto_634422 ) ( ON ?auto_634420 ?auto_634421 ) ( ON ?auto_634419 ?auto_634420 ) ( ON ?auto_634418 ?auto_634419 ) ( CLEAR ?auto_634416 ) ( ON ?auto_634417 ?auto_634418 ) ( CLEAR ?auto_634417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_634407 ?auto_634408 ?auto_634409 ?auto_634410 ?auto_634411 ?auto_634412 ?auto_634413 ?auto_634414 ?auto_634415 ?auto_634416 ?auto_634417 )
      ( MAKE-17PILE ?auto_634407 ?auto_634408 ?auto_634409 ?auto_634410 ?auto_634411 ?auto_634412 ?auto_634413 ?auto_634414 ?auto_634415 ?auto_634416 ?auto_634417 ?auto_634418 ?auto_634419 ?auto_634420 ?auto_634421 ?auto_634422 ?auto_634423 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634442 - BLOCK
      ?auto_634443 - BLOCK
      ?auto_634444 - BLOCK
      ?auto_634445 - BLOCK
      ?auto_634446 - BLOCK
      ?auto_634447 - BLOCK
      ?auto_634448 - BLOCK
      ?auto_634449 - BLOCK
      ?auto_634450 - BLOCK
      ?auto_634451 - BLOCK
      ?auto_634452 - BLOCK
      ?auto_634453 - BLOCK
      ?auto_634454 - BLOCK
      ?auto_634455 - BLOCK
      ?auto_634456 - BLOCK
      ?auto_634457 - BLOCK
      ?auto_634458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634458 ) ( ON-TABLE ?auto_634442 ) ( ON ?auto_634443 ?auto_634442 ) ( ON ?auto_634444 ?auto_634443 ) ( ON ?auto_634445 ?auto_634444 ) ( ON ?auto_634446 ?auto_634445 ) ( ON ?auto_634447 ?auto_634446 ) ( ON ?auto_634448 ?auto_634447 ) ( ON ?auto_634449 ?auto_634448 ) ( ON ?auto_634450 ?auto_634449 ) ( ON ?auto_634451 ?auto_634450 ) ( not ( = ?auto_634442 ?auto_634443 ) ) ( not ( = ?auto_634442 ?auto_634444 ) ) ( not ( = ?auto_634442 ?auto_634445 ) ) ( not ( = ?auto_634442 ?auto_634446 ) ) ( not ( = ?auto_634442 ?auto_634447 ) ) ( not ( = ?auto_634442 ?auto_634448 ) ) ( not ( = ?auto_634442 ?auto_634449 ) ) ( not ( = ?auto_634442 ?auto_634450 ) ) ( not ( = ?auto_634442 ?auto_634451 ) ) ( not ( = ?auto_634442 ?auto_634452 ) ) ( not ( = ?auto_634442 ?auto_634453 ) ) ( not ( = ?auto_634442 ?auto_634454 ) ) ( not ( = ?auto_634442 ?auto_634455 ) ) ( not ( = ?auto_634442 ?auto_634456 ) ) ( not ( = ?auto_634442 ?auto_634457 ) ) ( not ( = ?auto_634442 ?auto_634458 ) ) ( not ( = ?auto_634443 ?auto_634444 ) ) ( not ( = ?auto_634443 ?auto_634445 ) ) ( not ( = ?auto_634443 ?auto_634446 ) ) ( not ( = ?auto_634443 ?auto_634447 ) ) ( not ( = ?auto_634443 ?auto_634448 ) ) ( not ( = ?auto_634443 ?auto_634449 ) ) ( not ( = ?auto_634443 ?auto_634450 ) ) ( not ( = ?auto_634443 ?auto_634451 ) ) ( not ( = ?auto_634443 ?auto_634452 ) ) ( not ( = ?auto_634443 ?auto_634453 ) ) ( not ( = ?auto_634443 ?auto_634454 ) ) ( not ( = ?auto_634443 ?auto_634455 ) ) ( not ( = ?auto_634443 ?auto_634456 ) ) ( not ( = ?auto_634443 ?auto_634457 ) ) ( not ( = ?auto_634443 ?auto_634458 ) ) ( not ( = ?auto_634444 ?auto_634445 ) ) ( not ( = ?auto_634444 ?auto_634446 ) ) ( not ( = ?auto_634444 ?auto_634447 ) ) ( not ( = ?auto_634444 ?auto_634448 ) ) ( not ( = ?auto_634444 ?auto_634449 ) ) ( not ( = ?auto_634444 ?auto_634450 ) ) ( not ( = ?auto_634444 ?auto_634451 ) ) ( not ( = ?auto_634444 ?auto_634452 ) ) ( not ( = ?auto_634444 ?auto_634453 ) ) ( not ( = ?auto_634444 ?auto_634454 ) ) ( not ( = ?auto_634444 ?auto_634455 ) ) ( not ( = ?auto_634444 ?auto_634456 ) ) ( not ( = ?auto_634444 ?auto_634457 ) ) ( not ( = ?auto_634444 ?auto_634458 ) ) ( not ( = ?auto_634445 ?auto_634446 ) ) ( not ( = ?auto_634445 ?auto_634447 ) ) ( not ( = ?auto_634445 ?auto_634448 ) ) ( not ( = ?auto_634445 ?auto_634449 ) ) ( not ( = ?auto_634445 ?auto_634450 ) ) ( not ( = ?auto_634445 ?auto_634451 ) ) ( not ( = ?auto_634445 ?auto_634452 ) ) ( not ( = ?auto_634445 ?auto_634453 ) ) ( not ( = ?auto_634445 ?auto_634454 ) ) ( not ( = ?auto_634445 ?auto_634455 ) ) ( not ( = ?auto_634445 ?auto_634456 ) ) ( not ( = ?auto_634445 ?auto_634457 ) ) ( not ( = ?auto_634445 ?auto_634458 ) ) ( not ( = ?auto_634446 ?auto_634447 ) ) ( not ( = ?auto_634446 ?auto_634448 ) ) ( not ( = ?auto_634446 ?auto_634449 ) ) ( not ( = ?auto_634446 ?auto_634450 ) ) ( not ( = ?auto_634446 ?auto_634451 ) ) ( not ( = ?auto_634446 ?auto_634452 ) ) ( not ( = ?auto_634446 ?auto_634453 ) ) ( not ( = ?auto_634446 ?auto_634454 ) ) ( not ( = ?auto_634446 ?auto_634455 ) ) ( not ( = ?auto_634446 ?auto_634456 ) ) ( not ( = ?auto_634446 ?auto_634457 ) ) ( not ( = ?auto_634446 ?auto_634458 ) ) ( not ( = ?auto_634447 ?auto_634448 ) ) ( not ( = ?auto_634447 ?auto_634449 ) ) ( not ( = ?auto_634447 ?auto_634450 ) ) ( not ( = ?auto_634447 ?auto_634451 ) ) ( not ( = ?auto_634447 ?auto_634452 ) ) ( not ( = ?auto_634447 ?auto_634453 ) ) ( not ( = ?auto_634447 ?auto_634454 ) ) ( not ( = ?auto_634447 ?auto_634455 ) ) ( not ( = ?auto_634447 ?auto_634456 ) ) ( not ( = ?auto_634447 ?auto_634457 ) ) ( not ( = ?auto_634447 ?auto_634458 ) ) ( not ( = ?auto_634448 ?auto_634449 ) ) ( not ( = ?auto_634448 ?auto_634450 ) ) ( not ( = ?auto_634448 ?auto_634451 ) ) ( not ( = ?auto_634448 ?auto_634452 ) ) ( not ( = ?auto_634448 ?auto_634453 ) ) ( not ( = ?auto_634448 ?auto_634454 ) ) ( not ( = ?auto_634448 ?auto_634455 ) ) ( not ( = ?auto_634448 ?auto_634456 ) ) ( not ( = ?auto_634448 ?auto_634457 ) ) ( not ( = ?auto_634448 ?auto_634458 ) ) ( not ( = ?auto_634449 ?auto_634450 ) ) ( not ( = ?auto_634449 ?auto_634451 ) ) ( not ( = ?auto_634449 ?auto_634452 ) ) ( not ( = ?auto_634449 ?auto_634453 ) ) ( not ( = ?auto_634449 ?auto_634454 ) ) ( not ( = ?auto_634449 ?auto_634455 ) ) ( not ( = ?auto_634449 ?auto_634456 ) ) ( not ( = ?auto_634449 ?auto_634457 ) ) ( not ( = ?auto_634449 ?auto_634458 ) ) ( not ( = ?auto_634450 ?auto_634451 ) ) ( not ( = ?auto_634450 ?auto_634452 ) ) ( not ( = ?auto_634450 ?auto_634453 ) ) ( not ( = ?auto_634450 ?auto_634454 ) ) ( not ( = ?auto_634450 ?auto_634455 ) ) ( not ( = ?auto_634450 ?auto_634456 ) ) ( not ( = ?auto_634450 ?auto_634457 ) ) ( not ( = ?auto_634450 ?auto_634458 ) ) ( not ( = ?auto_634451 ?auto_634452 ) ) ( not ( = ?auto_634451 ?auto_634453 ) ) ( not ( = ?auto_634451 ?auto_634454 ) ) ( not ( = ?auto_634451 ?auto_634455 ) ) ( not ( = ?auto_634451 ?auto_634456 ) ) ( not ( = ?auto_634451 ?auto_634457 ) ) ( not ( = ?auto_634451 ?auto_634458 ) ) ( not ( = ?auto_634452 ?auto_634453 ) ) ( not ( = ?auto_634452 ?auto_634454 ) ) ( not ( = ?auto_634452 ?auto_634455 ) ) ( not ( = ?auto_634452 ?auto_634456 ) ) ( not ( = ?auto_634452 ?auto_634457 ) ) ( not ( = ?auto_634452 ?auto_634458 ) ) ( not ( = ?auto_634453 ?auto_634454 ) ) ( not ( = ?auto_634453 ?auto_634455 ) ) ( not ( = ?auto_634453 ?auto_634456 ) ) ( not ( = ?auto_634453 ?auto_634457 ) ) ( not ( = ?auto_634453 ?auto_634458 ) ) ( not ( = ?auto_634454 ?auto_634455 ) ) ( not ( = ?auto_634454 ?auto_634456 ) ) ( not ( = ?auto_634454 ?auto_634457 ) ) ( not ( = ?auto_634454 ?auto_634458 ) ) ( not ( = ?auto_634455 ?auto_634456 ) ) ( not ( = ?auto_634455 ?auto_634457 ) ) ( not ( = ?auto_634455 ?auto_634458 ) ) ( not ( = ?auto_634456 ?auto_634457 ) ) ( not ( = ?auto_634456 ?auto_634458 ) ) ( not ( = ?auto_634457 ?auto_634458 ) ) ( ON ?auto_634457 ?auto_634458 ) ( ON ?auto_634456 ?auto_634457 ) ( ON ?auto_634455 ?auto_634456 ) ( ON ?auto_634454 ?auto_634455 ) ( ON ?auto_634453 ?auto_634454 ) ( CLEAR ?auto_634451 ) ( ON ?auto_634452 ?auto_634453 ) ( CLEAR ?auto_634452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_634442 ?auto_634443 ?auto_634444 ?auto_634445 ?auto_634446 ?auto_634447 ?auto_634448 ?auto_634449 ?auto_634450 ?auto_634451 ?auto_634452 )
      ( MAKE-17PILE ?auto_634442 ?auto_634443 ?auto_634444 ?auto_634445 ?auto_634446 ?auto_634447 ?auto_634448 ?auto_634449 ?auto_634450 ?auto_634451 ?auto_634452 ?auto_634453 ?auto_634454 ?auto_634455 ?auto_634456 ?auto_634457 ?auto_634458 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634476 - BLOCK
      ?auto_634477 - BLOCK
      ?auto_634478 - BLOCK
      ?auto_634479 - BLOCK
      ?auto_634480 - BLOCK
      ?auto_634481 - BLOCK
      ?auto_634482 - BLOCK
      ?auto_634483 - BLOCK
      ?auto_634484 - BLOCK
      ?auto_634485 - BLOCK
      ?auto_634486 - BLOCK
      ?auto_634487 - BLOCK
      ?auto_634488 - BLOCK
      ?auto_634489 - BLOCK
      ?auto_634490 - BLOCK
      ?auto_634491 - BLOCK
      ?auto_634492 - BLOCK
    )
    :vars
    (
      ?auto_634493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634492 ?auto_634493 ) ( ON-TABLE ?auto_634476 ) ( ON ?auto_634477 ?auto_634476 ) ( ON ?auto_634478 ?auto_634477 ) ( ON ?auto_634479 ?auto_634478 ) ( ON ?auto_634480 ?auto_634479 ) ( ON ?auto_634481 ?auto_634480 ) ( ON ?auto_634482 ?auto_634481 ) ( ON ?auto_634483 ?auto_634482 ) ( ON ?auto_634484 ?auto_634483 ) ( not ( = ?auto_634476 ?auto_634477 ) ) ( not ( = ?auto_634476 ?auto_634478 ) ) ( not ( = ?auto_634476 ?auto_634479 ) ) ( not ( = ?auto_634476 ?auto_634480 ) ) ( not ( = ?auto_634476 ?auto_634481 ) ) ( not ( = ?auto_634476 ?auto_634482 ) ) ( not ( = ?auto_634476 ?auto_634483 ) ) ( not ( = ?auto_634476 ?auto_634484 ) ) ( not ( = ?auto_634476 ?auto_634485 ) ) ( not ( = ?auto_634476 ?auto_634486 ) ) ( not ( = ?auto_634476 ?auto_634487 ) ) ( not ( = ?auto_634476 ?auto_634488 ) ) ( not ( = ?auto_634476 ?auto_634489 ) ) ( not ( = ?auto_634476 ?auto_634490 ) ) ( not ( = ?auto_634476 ?auto_634491 ) ) ( not ( = ?auto_634476 ?auto_634492 ) ) ( not ( = ?auto_634476 ?auto_634493 ) ) ( not ( = ?auto_634477 ?auto_634478 ) ) ( not ( = ?auto_634477 ?auto_634479 ) ) ( not ( = ?auto_634477 ?auto_634480 ) ) ( not ( = ?auto_634477 ?auto_634481 ) ) ( not ( = ?auto_634477 ?auto_634482 ) ) ( not ( = ?auto_634477 ?auto_634483 ) ) ( not ( = ?auto_634477 ?auto_634484 ) ) ( not ( = ?auto_634477 ?auto_634485 ) ) ( not ( = ?auto_634477 ?auto_634486 ) ) ( not ( = ?auto_634477 ?auto_634487 ) ) ( not ( = ?auto_634477 ?auto_634488 ) ) ( not ( = ?auto_634477 ?auto_634489 ) ) ( not ( = ?auto_634477 ?auto_634490 ) ) ( not ( = ?auto_634477 ?auto_634491 ) ) ( not ( = ?auto_634477 ?auto_634492 ) ) ( not ( = ?auto_634477 ?auto_634493 ) ) ( not ( = ?auto_634478 ?auto_634479 ) ) ( not ( = ?auto_634478 ?auto_634480 ) ) ( not ( = ?auto_634478 ?auto_634481 ) ) ( not ( = ?auto_634478 ?auto_634482 ) ) ( not ( = ?auto_634478 ?auto_634483 ) ) ( not ( = ?auto_634478 ?auto_634484 ) ) ( not ( = ?auto_634478 ?auto_634485 ) ) ( not ( = ?auto_634478 ?auto_634486 ) ) ( not ( = ?auto_634478 ?auto_634487 ) ) ( not ( = ?auto_634478 ?auto_634488 ) ) ( not ( = ?auto_634478 ?auto_634489 ) ) ( not ( = ?auto_634478 ?auto_634490 ) ) ( not ( = ?auto_634478 ?auto_634491 ) ) ( not ( = ?auto_634478 ?auto_634492 ) ) ( not ( = ?auto_634478 ?auto_634493 ) ) ( not ( = ?auto_634479 ?auto_634480 ) ) ( not ( = ?auto_634479 ?auto_634481 ) ) ( not ( = ?auto_634479 ?auto_634482 ) ) ( not ( = ?auto_634479 ?auto_634483 ) ) ( not ( = ?auto_634479 ?auto_634484 ) ) ( not ( = ?auto_634479 ?auto_634485 ) ) ( not ( = ?auto_634479 ?auto_634486 ) ) ( not ( = ?auto_634479 ?auto_634487 ) ) ( not ( = ?auto_634479 ?auto_634488 ) ) ( not ( = ?auto_634479 ?auto_634489 ) ) ( not ( = ?auto_634479 ?auto_634490 ) ) ( not ( = ?auto_634479 ?auto_634491 ) ) ( not ( = ?auto_634479 ?auto_634492 ) ) ( not ( = ?auto_634479 ?auto_634493 ) ) ( not ( = ?auto_634480 ?auto_634481 ) ) ( not ( = ?auto_634480 ?auto_634482 ) ) ( not ( = ?auto_634480 ?auto_634483 ) ) ( not ( = ?auto_634480 ?auto_634484 ) ) ( not ( = ?auto_634480 ?auto_634485 ) ) ( not ( = ?auto_634480 ?auto_634486 ) ) ( not ( = ?auto_634480 ?auto_634487 ) ) ( not ( = ?auto_634480 ?auto_634488 ) ) ( not ( = ?auto_634480 ?auto_634489 ) ) ( not ( = ?auto_634480 ?auto_634490 ) ) ( not ( = ?auto_634480 ?auto_634491 ) ) ( not ( = ?auto_634480 ?auto_634492 ) ) ( not ( = ?auto_634480 ?auto_634493 ) ) ( not ( = ?auto_634481 ?auto_634482 ) ) ( not ( = ?auto_634481 ?auto_634483 ) ) ( not ( = ?auto_634481 ?auto_634484 ) ) ( not ( = ?auto_634481 ?auto_634485 ) ) ( not ( = ?auto_634481 ?auto_634486 ) ) ( not ( = ?auto_634481 ?auto_634487 ) ) ( not ( = ?auto_634481 ?auto_634488 ) ) ( not ( = ?auto_634481 ?auto_634489 ) ) ( not ( = ?auto_634481 ?auto_634490 ) ) ( not ( = ?auto_634481 ?auto_634491 ) ) ( not ( = ?auto_634481 ?auto_634492 ) ) ( not ( = ?auto_634481 ?auto_634493 ) ) ( not ( = ?auto_634482 ?auto_634483 ) ) ( not ( = ?auto_634482 ?auto_634484 ) ) ( not ( = ?auto_634482 ?auto_634485 ) ) ( not ( = ?auto_634482 ?auto_634486 ) ) ( not ( = ?auto_634482 ?auto_634487 ) ) ( not ( = ?auto_634482 ?auto_634488 ) ) ( not ( = ?auto_634482 ?auto_634489 ) ) ( not ( = ?auto_634482 ?auto_634490 ) ) ( not ( = ?auto_634482 ?auto_634491 ) ) ( not ( = ?auto_634482 ?auto_634492 ) ) ( not ( = ?auto_634482 ?auto_634493 ) ) ( not ( = ?auto_634483 ?auto_634484 ) ) ( not ( = ?auto_634483 ?auto_634485 ) ) ( not ( = ?auto_634483 ?auto_634486 ) ) ( not ( = ?auto_634483 ?auto_634487 ) ) ( not ( = ?auto_634483 ?auto_634488 ) ) ( not ( = ?auto_634483 ?auto_634489 ) ) ( not ( = ?auto_634483 ?auto_634490 ) ) ( not ( = ?auto_634483 ?auto_634491 ) ) ( not ( = ?auto_634483 ?auto_634492 ) ) ( not ( = ?auto_634483 ?auto_634493 ) ) ( not ( = ?auto_634484 ?auto_634485 ) ) ( not ( = ?auto_634484 ?auto_634486 ) ) ( not ( = ?auto_634484 ?auto_634487 ) ) ( not ( = ?auto_634484 ?auto_634488 ) ) ( not ( = ?auto_634484 ?auto_634489 ) ) ( not ( = ?auto_634484 ?auto_634490 ) ) ( not ( = ?auto_634484 ?auto_634491 ) ) ( not ( = ?auto_634484 ?auto_634492 ) ) ( not ( = ?auto_634484 ?auto_634493 ) ) ( not ( = ?auto_634485 ?auto_634486 ) ) ( not ( = ?auto_634485 ?auto_634487 ) ) ( not ( = ?auto_634485 ?auto_634488 ) ) ( not ( = ?auto_634485 ?auto_634489 ) ) ( not ( = ?auto_634485 ?auto_634490 ) ) ( not ( = ?auto_634485 ?auto_634491 ) ) ( not ( = ?auto_634485 ?auto_634492 ) ) ( not ( = ?auto_634485 ?auto_634493 ) ) ( not ( = ?auto_634486 ?auto_634487 ) ) ( not ( = ?auto_634486 ?auto_634488 ) ) ( not ( = ?auto_634486 ?auto_634489 ) ) ( not ( = ?auto_634486 ?auto_634490 ) ) ( not ( = ?auto_634486 ?auto_634491 ) ) ( not ( = ?auto_634486 ?auto_634492 ) ) ( not ( = ?auto_634486 ?auto_634493 ) ) ( not ( = ?auto_634487 ?auto_634488 ) ) ( not ( = ?auto_634487 ?auto_634489 ) ) ( not ( = ?auto_634487 ?auto_634490 ) ) ( not ( = ?auto_634487 ?auto_634491 ) ) ( not ( = ?auto_634487 ?auto_634492 ) ) ( not ( = ?auto_634487 ?auto_634493 ) ) ( not ( = ?auto_634488 ?auto_634489 ) ) ( not ( = ?auto_634488 ?auto_634490 ) ) ( not ( = ?auto_634488 ?auto_634491 ) ) ( not ( = ?auto_634488 ?auto_634492 ) ) ( not ( = ?auto_634488 ?auto_634493 ) ) ( not ( = ?auto_634489 ?auto_634490 ) ) ( not ( = ?auto_634489 ?auto_634491 ) ) ( not ( = ?auto_634489 ?auto_634492 ) ) ( not ( = ?auto_634489 ?auto_634493 ) ) ( not ( = ?auto_634490 ?auto_634491 ) ) ( not ( = ?auto_634490 ?auto_634492 ) ) ( not ( = ?auto_634490 ?auto_634493 ) ) ( not ( = ?auto_634491 ?auto_634492 ) ) ( not ( = ?auto_634491 ?auto_634493 ) ) ( not ( = ?auto_634492 ?auto_634493 ) ) ( ON ?auto_634491 ?auto_634492 ) ( ON ?auto_634490 ?auto_634491 ) ( ON ?auto_634489 ?auto_634490 ) ( ON ?auto_634488 ?auto_634489 ) ( ON ?auto_634487 ?auto_634488 ) ( ON ?auto_634486 ?auto_634487 ) ( CLEAR ?auto_634484 ) ( ON ?auto_634485 ?auto_634486 ) ( CLEAR ?auto_634485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_634476 ?auto_634477 ?auto_634478 ?auto_634479 ?auto_634480 ?auto_634481 ?auto_634482 ?auto_634483 ?auto_634484 ?auto_634485 )
      ( MAKE-17PILE ?auto_634476 ?auto_634477 ?auto_634478 ?auto_634479 ?auto_634480 ?auto_634481 ?auto_634482 ?auto_634483 ?auto_634484 ?auto_634485 ?auto_634486 ?auto_634487 ?auto_634488 ?auto_634489 ?auto_634490 ?auto_634491 ?auto_634492 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634511 - BLOCK
      ?auto_634512 - BLOCK
      ?auto_634513 - BLOCK
      ?auto_634514 - BLOCK
      ?auto_634515 - BLOCK
      ?auto_634516 - BLOCK
      ?auto_634517 - BLOCK
      ?auto_634518 - BLOCK
      ?auto_634519 - BLOCK
      ?auto_634520 - BLOCK
      ?auto_634521 - BLOCK
      ?auto_634522 - BLOCK
      ?auto_634523 - BLOCK
      ?auto_634524 - BLOCK
      ?auto_634525 - BLOCK
      ?auto_634526 - BLOCK
      ?auto_634527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634527 ) ( ON-TABLE ?auto_634511 ) ( ON ?auto_634512 ?auto_634511 ) ( ON ?auto_634513 ?auto_634512 ) ( ON ?auto_634514 ?auto_634513 ) ( ON ?auto_634515 ?auto_634514 ) ( ON ?auto_634516 ?auto_634515 ) ( ON ?auto_634517 ?auto_634516 ) ( ON ?auto_634518 ?auto_634517 ) ( ON ?auto_634519 ?auto_634518 ) ( not ( = ?auto_634511 ?auto_634512 ) ) ( not ( = ?auto_634511 ?auto_634513 ) ) ( not ( = ?auto_634511 ?auto_634514 ) ) ( not ( = ?auto_634511 ?auto_634515 ) ) ( not ( = ?auto_634511 ?auto_634516 ) ) ( not ( = ?auto_634511 ?auto_634517 ) ) ( not ( = ?auto_634511 ?auto_634518 ) ) ( not ( = ?auto_634511 ?auto_634519 ) ) ( not ( = ?auto_634511 ?auto_634520 ) ) ( not ( = ?auto_634511 ?auto_634521 ) ) ( not ( = ?auto_634511 ?auto_634522 ) ) ( not ( = ?auto_634511 ?auto_634523 ) ) ( not ( = ?auto_634511 ?auto_634524 ) ) ( not ( = ?auto_634511 ?auto_634525 ) ) ( not ( = ?auto_634511 ?auto_634526 ) ) ( not ( = ?auto_634511 ?auto_634527 ) ) ( not ( = ?auto_634512 ?auto_634513 ) ) ( not ( = ?auto_634512 ?auto_634514 ) ) ( not ( = ?auto_634512 ?auto_634515 ) ) ( not ( = ?auto_634512 ?auto_634516 ) ) ( not ( = ?auto_634512 ?auto_634517 ) ) ( not ( = ?auto_634512 ?auto_634518 ) ) ( not ( = ?auto_634512 ?auto_634519 ) ) ( not ( = ?auto_634512 ?auto_634520 ) ) ( not ( = ?auto_634512 ?auto_634521 ) ) ( not ( = ?auto_634512 ?auto_634522 ) ) ( not ( = ?auto_634512 ?auto_634523 ) ) ( not ( = ?auto_634512 ?auto_634524 ) ) ( not ( = ?auto_634512 ?auto_634525 ) ) ( not ( = ?auto_634512 ?auto_634526 ) ) ( not ( = ?auto_634512 ?auto_634527 ) ) ( not ( = ?auto_634513 ?auto_634514 ) ) ( not ( = ?auto_634513 ?auto_634515 ) ) ( not ( = ?auto_634513 ?auto_634516 ) ) ( not ( = ?auto_634513 ?auto_634517 ) ) ( not ( = ?auto_634513 ?auto_634518 ) ) ( not ( = ?auto_634513 ?auto_634519 ) ) ( not ( = ?auto_634513 ?auto_634520 ) ) ( not ( = ?auto_634513 ?auto_634521 ) ) ( not ( = ?auto_634513 ?auto_634522 ) ) ( not ( = ?auto_634513 ?auto_634523 ) ) ( not ( = ?auto_634513 ?auto_634524 ) ) ( not ( = ?auto_634513 ?auto_634525 ) ) ( not ( = ?auto_634513 ?auto_634526 ) ) ( not ( = ?auto_634513 ?auto_634527 ) ) ( not ( = ?auto_634514 ?auto_634515 ) ) ( not ( = ?auto_634514 ?auto_634516 ) ) ( not ( = ?auto_634514 ?auto_634517 ) ) ( not ( = ?auto_634514 ?auto_634518 ) ) ( not ( = ?auto_634514 ?auto_634519 ) ) ( not ( = ?auto_634514 ?auto_634520 ) ) ( not ( = ?auto_634514 ?auto_634521 ) ) ( not ( = ?auto_634514 ?auto_634522 ) ) ( not ( = ?auto_634514 ?auto_634523 ) ) ( not ( = ?auto_634514 ?auto_634524 ) ) ( not ( = ?auto_634514 ?auto_634525 ) ) ( not ( = ?auto_634514 ?auto_634526 ) ) ( not ( = ?auto_634514 ?auto_634527 ) ) ( not ( = ?auto_634515 ?auto_634516 ) ) ( not ( = ?auto_634515 ?auto_634517 ) ) ( not ( = ?auto_634515 ?auto_634518 ) ) ( not ( = ?auto_634515 ?auto_634519 ) ) ( not ( = ?auto_634515 ?auto_634520 ) ) ( not ( = ?auto_634515 ?auto_634521 ) ) ( not ( = ?auto_634515 ?auto_634522 ) ) ( not ( = ?auto_634515 ?auto_634523 ) ) ( not ( = ?auto_634515 ?auto_634524 ) ) ( not ( = ?auto_634515 ?auto_634525 ) ) ( not ( = ?auto_634515 ?auto_634526 ) ) ( not ( = ?auto_634515 ?auto_634527 ) ) ( not ( = ?auto_634516 ?auto_634517 ) ) ( not ( = ?auto_634516 ?auto_634518 ) ) ( not ( = ?auto_634516 ?auto_634519 ) ) ( not ( = ?auto_634516 ?auto_634520 ) ) ( not ( = ?auto_634516 ?auto_634521 ) ) ( not ( = ?auto_634516 ?auto_634522 ) ) ( not ( = ?auto_634516 ?auto_634523 ) ) ( not ( = ?auto_634516 ?auto_634524 ) ) ( not ( = ?auto_634516 ?auto_634525 ) ) ( not ( = ?auto_634516 ?auto_634526 ) ) ( not ( = ?auto_634516 ?auto_634527 ) ) ( not ( = ?auto_634517 ?auto_634518 ) ) ( not ( = ?auto_634517 ?auto_634519 ) ) ( not ( = ?auto_634517 ?auto_634520 ) ) ( not ( = ?auto_634517 ?auto_634521 ) ) ( not ( = ?auto_634517 ?auto_634522 ) ) ( not ( = ?auto_634517 ?auto_634523 ) ) ( not ( = ?auto_634517 ?auto_634524 ) ) ( not ( = ?auto_634517 ?auto_634525 ) ) ( not ( = ?auto_634517 ?auto_634526 ) ) ( not ( = ?auto_634517 ?auto_634527 ) ) ( not ( = ?auto_634518 ?auto_634519 ) ) ( not ( = ?auto_634518 ?auto_634520 ) ) ( not ( = ?auto_634518 ?auto_634521 ) ) ( not ( = ?auto_634518 ?auto_634522 ) ) ( not ( = ?auto_634518 ?auto_634523 ) ) ( not ( = ?auto_634518 ?auto_634524 ) ) ( not ( = ?auto_634518 ?auto_634525 ) ) ( not ( = ?auto_634518 ?auto_634526 ) ) ( not ( = ?auto_634518 ?auto_634527 ) ) ( not ( = ?auto_634519 ?auto_634520 ) ) ( not ( = ?auto_634519 ?auto_634521 ) ) ( not ( = ?auto_634519 ?auto_634522 ) ) ( not ( = ?auto_634519 ?auto_634523 ) ) ( not ( = ?auto_634519 ?auto_634524 ) ) ( not ( = ?auto_634519 ?auto_634525 ) ) ( not ( = ?auto_634519 ?auto_634526 ) ) ( not ( = ?auto_634519 ?auto_634527 ) ) ( not ( = ?auto_634520 ?auto_634521 ) ) ( not ( = ?auto_634520 ?auto_634522 ) ) ( not ( = ?auto_634520 ?auto_634523 ) ) ( not ( = ?auto_634520 ?auto_634524 ) ) ( not ( = ?auto_634520 ?auto_634525 ) ) ( not ( = ?auto_634520 ?auto_634526 ) ) ( not ( = ?auto_634520 ?auto_634527 ) ) ( not ( = ?auto_634521 ?auto_634522 ) ) ( not ( = ?auto_634521 ?auto_634523 ) ) ( not ( = ?auto_634521 ?auto_634524 ) ) ( not ( = ?auto_634521 ?auto_634525 ) ) ( not ( = ?auto_634521 ?auto_634526 ) ) ( not ( = ?auto_634521 ?auto_634527 ) ) ( not ( = ?auto_634522 ?auto_634523 ) ) ( not ( = ?auto_634522 ?auto_634524 ) ) ( not ( = ?auto_634522 ?auto_634525 ) ) ( not ( = ?auto_634522 ?auto_634526 ) ) ( not ( = ?auto_634522 ?auto_634527 ) ) ( not ( = ?auto_634523 ?auto_634524 ) ) ( not ( = ?auto_634523 ?auto_634525 ) ) ( not ( = ?auto_634523 ?auto_634526 ) ) ( not ( = ?auto_634523 ?auto_634527 ) ) ( not ( = ?auto_634524 ?auto_634525 ) ) ( not ( = ?auto_634524 ?auto_634526 ) ) ( not ( = ?auto_634524 ?auto_634527 ) ) ( not ( = ?auto_634525 ?auto_634526 ) ) ( not ( = ?auto_634525 ?auto_634527 ) ) ( not ( = ?auto_634526 ?auto_634527 ) ) ( ON ?auto_634526 ?auto_634527 ) ( ON ?auto_634525 ?auto_634526 ) ( ON ?auto_634524 ?auto_634525 ) ( ON ?auto_634523 ?auto_634524 ) ( ON ?auto_634522 ?auto_634523 ) ( ON ?auto_634521 ?auto_634522 ) ( CLEAR ?auto_634519 ) ( ON ?auto_634520 ?auto_634521 ) ( CLEAR ?auto_634520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_634511 ?auto_634512 ?auto_634513 ?auto_634514 ?auto_634515 ?auto_634516 ?auto_634517 ?auto_634518 ?auto_634519 ?auto_634520 )
      ( MAKE-17PILE ?auto_634511 ?auto_634512 ?auto_634513 ?auto_634514 ?auto_634515 ?auto_634516 ?auto_634517 ?auto_634518 ?auto_634519 ?auto_634520 ?auto_634521 ?auto_634522 ?auto_634523 ?auto_634524 ?auto_634525 ?auto_634526 ?auto_634527 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634545 - BLOCK
      ?auto_634546 - BLOCK
      ?auto_634547 - BLOCK
      ?auto_634548 - BLOCK
      ?auto_634549 - BLOCK
      ?auto_634550 - BLOCK
      ?auto_634551 - BLOCK
      ?auto_634552 - BLOCK
      ?auto_634553 - BLOCK
      ?auto_634554 - BLOCK
      ?auto_634555 - BLOCK
      ?auto_634556 - BLOCK
      ?auto_634557 - BLOCK
      ?auto_634558 - BLOCK
      ?auto_634559 - BLOCK
      ?auto_634560 - BLOCK
      ?auto_634561 - BLOCK
    )
    :vars
    (
      ?auto_634562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634561 ?auto_634562 ) ( ON-TABLE ?auto_634545 ) ( ON ?auto_634546 ?auto_634545 ) ( ON ?auto_634547 ?auto_634546 ) ( ON ?auto_634548 ?auto_634547 ) ( ON ?auto_634549 ?auto_634548 ) ( ON ?auto_634550 ?auto_634549 ) ( ON ?auto_634551 ?auto_634550 ) ( ON ?auto_634552 ?auto_634551 ) ( not ( = ?auto_634545 ?auto_634546 ) ) ( not ( = ?auto_634545 ?auto_634547 ) ) ( not ( = ?auto_634545 ?auto_634548 ) ) ( not ( = ?auto_634545 ?auto_634549 ) ) ( not ( = ?auto_634545 ?auto_634550 ) ) ( not ( = ?auto_634545 ?auto_634551 ) ) ( not ( = ?auto_634545 ?auto_634552 ) ) ( not ( = ?auto_634545 ?auto_634553 ) ) ( not ( = ?auto_634545 ?auto_634554 ) ) ( not ( = ?auto_634545 ?auto_634555 ) ) ( not ( = ?auto_634545 ?auto_634556 ) ) ( not ( = ?auto_634545 ?auto_634557 ) ) ( not ( = ?auto_634545 ?auto_634558 ) ) ( not ( = ?auto_634545 ?auto_634559 ) ) ( not ( = ?auto_634545 ?auto_634560 ) ) ( not ( = ?auto_634545 ?auto_634561 ) ) ( not ( = ?auto_634545 ?auto_634562 ) ) ( not ( = ?auto_634546 ?auto_634547 ) ) ( not ( = ?auto_634546 ?auto_634548 ) ) ( not ( = ?auto_634546 ?auto_634549 ) ) ( not ( = ?auto_634546 ?auto_634550 ) ) ( not ( = ?auto_634546 ?auto_634551 ) ) ( not ( = ?auto_634546 ?auto_634552 ) ) ( not ( = ?auto_634546 ?auto_634553 ) ) ( not ( = ?auto_634546 ?auto_634554 ) ) ( not ( = ?auto_634546 ?auto_634555 ) ) ( not ( = ?auto_634546 ?auto_634556 ) ) ( not ( = ?auto_634546 ?auto_634557 ) ) ( not ( = ?auto_634546 ?auto_634558 ) ) ( not ( = ?auto_634546 ?auto_634559 ) ) ( not ( = ?auto_634546 ?auto_634560 ) ) ( not ( = ?auto_634546 ?auto_634561 ) ) ( not ( = ?auto_634546 ?auto_634562 ) ) ( not ( = ?auto_634547 ?auto_634548 ) ) ( not ( = ?auto_634547 ?auto_634549 ) ) ( not ( = ?auto_634547 ?auto_634550 ) ) ( not ( = ?auto_634547 ?auto_634551 ) ) ( not ( = ?auto_634547 ?auto_634552 ) ) ( not ( = ?auto_634547 ?auto_634553 ) ) ( not ( = ?auto_634547 ?auto_634554 ) ) ( not ( = ?auto_634547 ?auto_634555 ) ) ( not ( = ?auto_634547 ?auto_634556 ) ) ( not ( = ?auto_634547 ?auto_634557 ) ) ( not ( = ?auto_634547 ?auto_634558 ) ) ( not ( = ?auto_634547 ?auto_634559 ) ) ( not ( = ?auto_634547 ?auto_634560 ) ) ( not ( = ?auto_634547 ?auto_634561 ) ) ( not ( = ?auto_634547 ?auto_634562 ) ) ( not ( = ?auto_634548 ?auto_634549 ) ) ( not ( = ?auto_634548 ?auto_634550 ) ) ( not ( = ?auto_634548 ?auto_634551 ) ) ( not ( = ?auto_634548 ?auto_634552 ) ) ( not ( = ?auto_634548 ?auto_634553 ) ) ( not ( = ?auto_634548 ?auto_634554 ) ) ( not ( = ?auto_634548 ?auto_634555 ) ) ( not ( = ?auto_634548 ?auto_634556 ) ) ( not ( = ?auto_634548 ?auto_634557 ) ) ( not ( = ?auto_634548 ?auto_634558 ) ) ( not ( = ?auto_634548 ?auto_634559 ) ) ( not ( = ?auto_634548 ?auto_634560 ) ) ( not ( = ?auto_634548 ?auto_634561 ) ) ( not ( = ?auto_634548 ?auto_634562 ) ) ( not ( = ?auto_634549 ?auto_634550 ) ) ( not ( = ?auto_634549 ?auto_634551 ) ) ( not ( = ?auto_634549 ?auto_634552 ) ) ( not ( = ?auto_634549 ?auto_634553 ) ) ( not ( = ?auto_634549 ?auto_634554 ) ) ( not ( = ?auto_634549 ?auto_634555 ) ) ( not ( = ?auto_634549 ?auto_634556 ) ) ( not ( = ?auto_634549 ?auto_634557 ) ) ( not ( = ?auto_634549 ?auto_634558 ) ) ( not ( = ?auto_634549 ?auto_634559 ) ) ( not ( = ?auto_634549 ?auto_634560 ) ) ( not ( = ?auto_634549 ?auto_634561 ) ) ( not ( = ?auto_634549 ?auto_634562 ) ) ( not ( = ?auto_634550 ?auto_634551 ) ) ( not ( = ?auto_634550 ?auto_634552 ) ) ( not ( = ?auto_634550 ?auto_634553 ) ) ( not ( = ?auto_634550 ?auto_634554 ) ) ( not ( = ?auto_634550 ?auto_634555 ) ) ( not ( = ?auto_634550 ?auto_634556 ) ) ( not ( = ?auto_634550 ?auto_634557 ) ) ( not ( = ?auto_634550 ?auto_634558 ) ) ( not ( = ?auto_634550 ?auto_634559 ) ) ( not ( = ?auto_634550 ?auto_634560 ) ) ( not ( = ?auto_634550 ?auto_634561 ) ) ( not ( = ?auto_634550 ?auto_634562 ) ) ( not ( = ?auto_634551 ?auto_634552 ) ) ( not ( = ?auto_634551 ?auto_634553 ) ) ( not ( = ?auto_634551 ?auto_634554 ) ) ( not ( = ?auto_634551 ?auto_634555 ) ) ( not ( = ?auto_634551 ?auto_634556 ) ) ( not ( = ?auto_634551 ?auto_634557 ) ) ( not ( = ?auto_634551 ?auto_634558 ) ) ( not ( = ?auto_634551 ?auto_634559 ) ) ( not ( = ?auto_634551 ?auto_634560 ) ) ( not ( = ?auto_634551 ?auto_634561 ) ) ( not ( = ?auto_634551 ?auto_634562 ) ) ( not ( = ?auto_634552 ?auto_634553 ) ) ( not ( = ?auto_634552 ?auto_634554 ) ) ( not ( = ?auto_634552 ?auto_634555 ) ) ( not ( = ?auto_634552 ?auto_634556 ) ) ( not ( = ?auto_634552 ?auto_634557 ) ) ( not ( = ?auto_634552 ?auto_634558 ) ) ( not ( = ?auto_634552 ?auto_634559 ) ) ( not ( = ?auto_634552 ?auto_634560 ) ) ( not ( = ?auto_634552 ?auto_634561 ) ) ( not ( = ?auto_634552 ?auto_634562 ) ) ( not ( = ?auto_634553 ?auto_634554 ) ) ( not ( = ?auto_634553 ?auto_634555 ) ) ( not ( = ?auto_634553 ?auto_634556 ) ) ( not ( = ?auto_634553 ?auto_634557 ) ) ( not ( = ?auto_634553 ?auto_634558 ) ) ( not ( = ?auto_634553 ?auto_634559 ) ) ( not ( = ?auto_634553 ?auto_634560 ) ) ( not ( = ?auto_634553 ?auto_634561 ) ) ( not ( = ?auto_634553 ?auto_634562 ) ) ( not ( = ?auto_634554 ?auto_634555 ) ) ( not ( = ?auto_634554 ?auto_634556 ) ) ( not ( = ?auto_634554 ?auto_634557 ) ) ( not ( = ?auto_634554 ?auto_634558 ) ) ( not ( = ?auto_634554 ?auto_634559 ) ) ( not ( = ?auto_634554 ?auto_634560 ) ) ( not ( = ?auto_634554 ?auto_634561 ) ) ( not ( = ?auto_634554 ?auto_634562 ) ) ( not ( = ?auto_634555 ?auto_634556 ) ) ( not ( = ?auto_634555 ?auto_634557 ) ) ( not ( = ?auto_634555 ?auto_634558 ) ) ( not ( = ?auto_634555 ?auto_634559 ) ) ( not ( = ?auto_634555 ?auto_634560 ) ) ( not ( = ?auto_634555 ?auto_634561 ) ) ( not ( = ?auto_634555 ?auto_634562 ) ) ( not ( = ?auto_634556 ?auto_634557 ) ) ( not ( = ?auto_634556 ?auto_634558 ) ) ( not ( = ?auto_634556 ?auto_634559 ) ) ( not ( = ?auto_634556 ?auto_634560 ) ) ( not ( = ?auto_634556 ?auto_634561 ) ) ( not ( = ?auto_634556 ?auto_634562 ) ) ( not ( = ?auto_634557 ?auto_634558 ) ) ( not ( = ?auto_634557 ?auto_634559 ) ) ( not ( = ?auto_634557 ?auto_634560 ) ) ( not ( = ?auto_634557 ?auto_634561 ) ) ( not ( = ?auto_634557 ?auto_634562 ) ) ( not ( = ?auto_634558 ?auto_634559 ) ) ( not ( = ?auto_634558 ?auto_634560 ) ) ( not ( = ?auto_634558 ?auto_634561 ) ) ( not ( = ?auto_634558 ?auto_634562 ) ) ( not ( = ?auto_634559 ?auto_634560 ) ) ( not ( = ?auto_634559 ?auto_634561 ) ) ( not ( = ?auto_634559 ?auto_634562 ) ) ( not ( = ?auto_634560 ?auto_634561 ) ) ( not ( = ?auto_634560 ?auto_634562 ) ) ( not ( = ?auto_634561 ?auto_634562 ) ) ( ON ?auto_634560 ?auto_634561 ) ( ON ?auto_634559 ?auto_634560 ) ( ON ?auto_634558 ?auto_634559 ) ( ON ?auto_634557 ?auto_634558 ) ( ON ?auto_634556 ?auto_634557 ) ( ON ?auto_634555 ?auto_634556 ) ( ON ?auto_634554 ?auto_634555 ) ( CLEAR ?auto_634552 ) ( ON ?auto_634553 ?auto_634554 ) ( CLEAR ?auto_634553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_634545 ?auto_634546 ?auto_634547 ?auto_634548 ?auto_634549 ?auto_634550 ?auto_634551 ?auto_634552 ?auto_634553 )
      ( MAKE-17PILE ?auto_634545 ?auto_634546 ?auto_634547 ?auto_634548 ?auto_634549 ?auto_634550 ?auto_634551 ?auto_634552 ?auto_634553 ?auto_634554 ?auto_634555 ?auto_634556 ?auto_634557 ?auto_634558 ?auto_634559 ?auto_634560 ?auto_634561 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634580 - BLOCK
      ?auto_634581 - BLOCK
      ?auto_634582 - BLOCK
      ?auto_634583 - BLOCK
      ?auto_634584 - BLOCK
      ?auto_634585 - BLOCK
      ?auto_634586 - BLOCK
      ?auto_634587 - BLOCK
      ?auto_634588 - BLOCK
      ?auto_634589 - BLOCK
      ?auto_634590 - BLOCK
      ?auto_634591 - BLOCK
      ?auto_634592 - BLOCK
      ?auto_634593 - BLOCK
      ?auto_634594 - BLOCK
      ?auto_634595 - BLOCK
      ?auto_634596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634596 ) ( ON-TABLE ?auto_634580 ) ( ON ?auto_634581 ?auto_634580 ) ( ON ?auto_634582 ?auto_634581 ) ( ON ?auto_634583 ?auto_634582 ) ( ON ?auto_634584 ?auto_634583 ) ( ON ?auto_634585 ?auto_634584 ) ( ON ?auto_634586 ?auto_634585 ) ( ON ?auto_634587 ?auto_634586 ) ( not ( = ?auto_634580 ?auto_634581 ) ) ( not ( = ?auto_634580 ?auto_634582 ) ) ( not ( = ?auto_634580 ?auto_634583 ) ) ( not ( = ?auto_634580 ?auto_634584 ) ) ( not ( = ?auto_634580 ?auto_634585 ) ) ( not ( = ?auto_634580 ?auto_634586 ) ) ( not ( = ?auto_634580 ?auto_634587 ) ) ( not ( = ?auto_634580 ?auto_634588 ) ) ( not ( = ?auto_634580 ?auto_634589 ) ) ( not ( = ?auto_634580 ?auto_634590 ) ) ( not ( = ?auto_634580 ?auto_634591 ) ) ( not ( = ?auto_634580 ?auto_634592 ) ) ( not ( = ?auto_634580 ?auto_634593 ) ) ( not ( = ?auto_634580 ?auto_634594 ) ) ( not ( = ?auto_634580 ?auto_634595 ) ) ( not ( = ?auto_634580 ?auto_634596 ) ) ( not ( = ?auto_634581 ?auto_634582 ) ) ( not ( = ?auto_634581 ?auto_634583 ) ) ( not ( = ?auto_634581 ?auto_634584 ) ) ( not ( = ?auto_634581 ?auto_634585 ) ) ( not ( = ?auto_634581 ?auto_634586 ) ) ( not ( = ?auto_634581 ?auto_634587 ) ) ( not ( = ?auto_634581 ?auto_634588 ) ) ( not ( = ?auto_634581 ?auto_634589 ) ) ( not ( = ?auto_634581 ?auto_634590 ) ) ( not ( = ?auto_634581 ?auto_634591 ) ) ( not ( = ?auto_634581 ?auto_634592 ) ) ( not ( = ?auto_634581 ?auto_634593 ) ) ( not ( = ?auto_634581 ?auto_634594 ) ) ( not ( = ?auto_634581 ?auto_634595 ) ) ( not ( = ?auto_634581 ?auto_634596 ) ) ( not ( = ?auto_634582 ?auto_634583 ) ) ( not ( = ?auto_634582 ?auto_634584 ) ) ( not ( = ?auto_634582 ?auto_634585 ) ) ( not ( = ?auto_634582 ?auto_634586 ) ) ( not ( = ?auto_634582 ?auto_634587 ) ) ( not ( = ?auto_634582 ?auto_634588 ) ) ( not ( = ?auto_634582 ?auto_634589 ) ) ( not ( = ?auto_634582 ?auto_634590 ) ) ( not ( = ?auto_634582 ?auto_634591 ) ) ( not ( = ?auto_634582 ?auto_634592 ) ) ( not ( = ?auto_634582 ?auto_634593 ) ) ( not ( = ?auto_634582 ?auto_634594 ) ) ( not ( = ?auto_634582 ?auto_634595 ) ) ( not ( = ?auto_634582 ?auto_634596 ) ) ( not ( = ?auto_634583 ?auto_634584 ) ) ( not ( = ?auto_634583 ?auto_634585 ) ) ( not ( = ?auto_634583 ?auto_634586 ) ) ( not ( = ?auto_634583 ?auto_634587 ) ) ( not ( = ?auto_634583 ?auto_634588 ) ) ( not ( = ?auto_634583 ?auto_634589 ) ) ( not ( = ?auto_634583 ?auto_634590 ) ) ( not ( = ?auto_634583 ?auto_634591 ) ) ( not ( = ?auto_634583 ?auto_634592 ) ) ( not ( = ?auto_634583 ?auto_634593 ) ) ( not ( = ?auto_634583 ?auto_634594 ) ) ( not ( = ?auto_634583 ?auto_634595 ) ) ( not ( = ?auto_634583 ?auto_634596 ) ) ( not ( = ?auto_634584 ?auto_634585 ) ) ( not ( = ?auto_634584 ?auto_634586 ) ) ( not ( = ?auto_634584 ?auto_634587 ) ) ( not ( = ?auto_634584 ?auto_634588 ) ) ( not ( = ?auto_634584 ?auto_634589 ) ) ( not ( = ?auto_634584 ?auto_634590 ) ) ( not ( = ?auto_634584 ?auto_634591 ) ) ( not ( = ?auto_634584 ?auto_634592 ) ) ( not ( = ?auto_634584 ?auto_634593 ) ) ( not ( = ?auto_634584 ?auto_634594 ) ) ( not ( = ?auto_634584 ?auto_634595 ) ) ( not ( = ?auto_634584 ?auto_634596 ) ) ( not ( = ?auto_634585 ?auto_634586 ) ) ( not ( = ?auto_634585 ?auto_634587 ) ) ( not ( = ?auto_634585 ?auto_634588 ) ) ( not ( = ?auto_634585 ?auto_634589 ) ) ( not ( = ?auto_634585 ?auto_634590 ) ) ( not ( = ?auto_634585 ?auto_634591 ) ) ( not ( = ?auto_634585 ?auto_634592 ) ) ( not ( = ?auto_634585 ?auto_634593 ) ) ( not ( = ?auto_634585 ?auto_634594 ) ) ( not ( = ?auto_634585 ?auto_634595 ) ) ( not ( = ?auto_634585 ?auto_634596 ) ) ( not ( = ?auto_634586 ?auto_634587 ) ) ( not ( = ?auto_634586 ?auto_634588 ) ) ( not ( = ?auto_634586 ?auto_634589 ) ) ( not ( = ?auto_634586 ?auto_634590 ) ) ( not ( = ?auto_634586 ?auto_634591 ) ) ( not ( = ?auto_634586 ?auto_634592 ) ) ( not ( = ?auto_634586 ?auto_634593 ) ) ( not ( = ?auto_634586 ?auto_634594 ) ) ( not ( = ?auto_634586 ?auto_634595 ) ) ( not ( = ?auto_634586 ?auto_634596 ) ) ( not ( = ?auto_634587 ?auto_634588 ) ) ( not ( = ?auto_634587 ?auto_634589 ) ) ( not ( = ?auto_634587 ?auto_634590 ) ) ( not ( = ?auto_634587 ?auto_634591 ) ) ( not ( = ?auto_634587 ?auto_634592 ) ) ( not ( = ?auto_634587 ?auto_634593 ) ) ( not ( = ?auto_634587 ?auto_634594 ) ) ( not ( = ?auto_634587 ?auto_634595 ) ) ( not ( = ?auto_634587 ?auto_634596 ) ) ( not ( = ?auto_634588 ?auto_634589 ) ) ( not ( = ?auto_634588 ?auto_634590 ) ) ( not ( = ?auto_634588 ?auto_634591 ) ) ( not ( = ?auto_634588 ?auto_634592 ) ) ( not ( = ?auto_634588 ?auto_634593 ) ) ( not ( = ?auto_634588 ?auto_634594 ) ) ( not ( = ?auto_634588 ?auto_634595 ) ) ( not ( = ?auto_634588 ?auto_634596 ) ) ( not ( = ?auto_634589 ?auto_634590 ) ) ( not ( = ?auto_634589 ?auto_634591 ) ) ( not ( = ?auto_634589 ?auto_634592 ) ) ( not ( = ?auto_634589 ?auto_634593 ) ) ( not ( = ?auto_634589 ?auto_634594 ) ) ( not ( = ?auto_634589 ?auto_634595 ) ) ( not ( = ?auto_634589 ?auto_634596 ) ) ( not ( = ?auto_634590 ?auto_634591 ) ) ( not ( = ?auto_634590 ?auto_634592 ) ) ( not ( = ?auto_634590 ?auto_634593 ) ) ( not ( = ?auto_634590 ?auto_634594 ) ) ( not ( = ?auto_634590 ?auto_634595 ) ) ( not ( = ?auto_634590 ?auto_634596 ) ) ( not ( = ?auto_634591 ?auto_634592 ) ) ( not ( = ?auto_634591 ?auto_634593 ) ) ( not ( = ?auto_634591 ?auto_634594 ) ) ( not ( = ?auto_634591 ?auto_634595 ) ) ( not ( = ?auto_634591 ?auto_634596 ) ) ( not ( = ?auto_634592 ?auto_634593 ) ) ( not ( = ?auto_634592 ?auto_634594 ) ) ( not ( = ?auto_634592 ?auto_634595 ) ) ( not ( = ?auto_634592 ?auto_634596 ) ) ( not ( = ?auto_634593 ?auto_634594 ) ) ( not ( = ?auto_634593 ?auto_634595 ) ) ( not ( = ?auto_634593 ?auto_634596 ) ) ( not ( = ?auto_634594 ?auto_634595 ) ) ( not ( = ?auto_634594 ?auto_634596 ) ) ( not ( = ?auto_634595 ?auto_634596 ) ) ( ON ?auto_634595 ?auto_634596 ) ( ON ?auto_634594 ?auto_634595 ) ( ON ?auto_634593 ?auto_634594 ) ( ON ?auto_634592 ?auto_634593 ) ( ON ?auto_634591 ?auto_634592 ) ( ON ?auto_634590 ?auto_634591 ) ( ON ?auto_634589 ?auto_634590 ) ( CLEAR ?auto_634587 ) ( ON ?auto_634588 ?auto_634589 ) ( CLEAR ?auto_634588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_634580 ?auto_634581 ?auto_634582 ?auto_634583 ?auto_634584 ?auto_634585 ?auto_634586 ?auto_634587 ?auto_634588 )
      ( MAKE-17PILE ?auto_634580 ?auto_634581 ?auto_634582 ?auto_634583 ?auto_634584 ?auto_634585 ?auto_634586 ?auto_634587 ?auto_634588 ?auto_634589 ?auto_634590 ?auto_634591 ?auto_634592 ?auto_634593 ?auto_634594 ?auto_634595 ?auto_634596 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634614 - BLOCK
      ?auto_634615 - BLOCK
      ?auto_634616 - BLOCK
      ?auto_634617 - BLOCK
      ?auto_634618 - BLOCK
      ?auto_634619 - BLOCK
      ?auto_634620 - BLOCK
      ?auto_634621 - BLOCK
      ?auto_634622 - BLOCK
      ?auto_634623 - BLOCK
      ?auto_634624 - BLOCK
      ?auto_634625 - BLOCK
      ?auto_634626 - BLOCK
      ?auto_634627 - BLOCK
      ?auto_634628 - BLOCK
      ?auto_634629 - BLOCK
      ?auto_634630 - BLOCK
    )
    :vars
    (
      ?auto_634631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634630 ?auto_634631 ) ( ON-TABLE ?auto_634614 ) ( ON ?auto_634615 ?auto_634614 ) ( ON ?auto_634616 ?auto_634615 ) ( ON ?auto_634617 ?auto_634616 ) ( ON ?auto_634618 ?auto_634617 ) ( ON ?auto_634619 ?auto_634618 ) ( ON ?auto_634620 ?auto_634619 ) ( not ( = ?auto_634614 ?auto_634615 ) ) ( not ( = ?auto_634614 ?auto_634616 ) ) ( not ( = ?auto_634614 ?auto_634617 ) ) ( not ( = ?auto_634614 ?auto_634618 ) ) ( not ( = ?auto_634614 ?auto_634619 ) ) ( not ( = ?auto_634614 ?auto_634620 ) ) ( not ( = ?auto_634614 ?auto_634621 ) ) ( not ( = ?auto_634614 ?auto_634622 ) ) ( not ( = ?auto_634614 ?auto_634623 ) ) ( not ( = ?auto_634614 ?auto_634624 ) ) ( not ( = ?auto_634614 ?auto_634625 ) ) ( not ( = ?auto_634614 ?auto_634626 ) ) ( not ( = ?auto_634614 ?auto_634627 ) ) ( not ( = ?auto_634614 ?auto_634628 ) ) ( not ( = ?auto_634614 ?auto_634629 ) ) ( not ( = ?auto_634614 ?auto_634630 ) ) ( not ( = ?auto_634614 ?auto_634631 ) ) ( not ( = ?auto_634615 ?auto_634616 ) ) ( not ( = ?auto_634615 ?auto_634617 ) ) ( not ( = ?auto_634615 ?auto_634618 ) ) ( not ( = ?auto_634615 ?auto_634619 ) ) ( not ( = ?auto_634615 ?auto_634620 ) ) ( not ( = ?auto_634615 ?auto_634621 ) ) ( not ( = ?auto_634615 ?auto_634622 ) ) ( not ( = ?auto_634615 ?auto_634623 ) ) ( not ( = ?auto_634615 ?auto_634624 ) ) ( not ( = ?auto_634615 ?auto_634625 ) ) ( not ( = ?auto_634615 ?auto_634626 ) ) ( not ( = ?auto_634615 ?auto_634627 ) ) ( not ( = ?auto_634615 ?auto_634628 ) ) ( not ( = ?auto_634615 ?auto_634629 ) ) ( not ( = ?auto_634615 ?auto_634630 ) ) ( not ( = ?auto_634615 ?auto_634631 ) ) ( not ( = ?auto_634616 ?auto_634617 ) ) ( not ( = ?auto_634616 ?auto_634618 ) ) ( not ( = ?auto_634616 ?auto_634619 ) ) ( not ( = ?auto_634616 ?auto_634620 ) ) ( not ( = ?auto_634616 ?auto_634621 ) ) ( not ( = ?auto_634616 ?auto_634622 ) ) ( not ( = ?auto_634616 ?auto_634623 ) ) ( not ( = ?auto_634616 ?auto_634624 ) ) ( not ( = ?auto_634616 ?auto_634625 ) ) ( not ( = ?auto_634616 ?auto_634626 ) ) ( not ( = ?auto_634616 ?auto_634627 ) ) ( not ( = ?auto_634616 ?auto_634628 ) ) ( not ( = ?auto_634616 ?auto_634629 ) ) ( not ( = ?auto_634616 ?auto_634630 ) ) ( not ( = ?auto_634616 ?auto_634631 ) ) ( not ( = ?auto_634617 ?auto_634618 ) ) ( not ( = ?auto_634617 ?auto_634619 ) ) ( not ( = ?auto_634617 ?auto_634620 ) ) ( not ( = ?auto_634617 ?auto_634621 ) ) ( not ( = ?auto_634617 ?auto_634622 ) ) ( not ( = ?auto_634617 ?auto_634623 ) ) ( not ( = ?auto_634617 ?auto_634624 ) ) ( not ( = ?auto_634617 ?auto_634625 ) ) ( not ( = ?auto_634617 ?auto_634626 ) ) ( not ( = ?auto_634617 ?auto_634627 ) ) ( not ( = ?auto_634617 ?auto_634628 ) ) ( not ( = ?auto_634617 ?auto_634629 ) ) ( not ( = ?auto_634617 ?auto_634630 ) ) ( not ( = ?auto_634617 ?auto_634631 ) ) ( not ( = ?auto_634618 ?auto_634619 ) ) ( not ( = ?auto_634618 ?auto_634620 ) ) ( not ( = ?auto_634618 ?auto_634621 ) ) ( not ( = ?auto_634618 ?auto_634622 ) ) ( not ( = ?auto_634618 ?auto_634623 ) ) ( not ( = ?auto_634618 ?auto_634624 ) ) ( not ( = ?auto_634618 ?auto_634625 ) ) ( not ( = ?auto_634618 ?auto_634626 ) ) ( not ( = ?auto_634618 ?auto_634627 ) ) ( not ( = ?auto_634618 ?auto_634628 ) ) ( not ( = ?auto_634618 ?auto_634629 ) ) ( not ( = ?auto_634618 ?auto_634630 ) ) ( not ( = ?auto_634618 ?auto_634631 ) ) ( not ( = ?auto_634619 ?auto_634620 ) ) ( not ( = ?auto_634619 ?auto_634621 ) ) ( not ( = ?auto_634619 ?auto_634622 ) ) ( not ( = ?auto_634619 ?auto_634623 ) ) ( not ( = ?auto_634619 ?auto_634624 ) ) ( not ( = ?auto_634619 ?auto_634625 ) ) ( not ( = ?auto_634619 ?auto_634626 ) ) ( not ( = ?auto_634619 ?auto_634627 ) ) ( not ( = ?auto_634619 ?auto_634628 ) ) ( not ( = ?auto_634619 ?auto_634629 ) ) ( not ( = ?auto_634619 ?auto_634630 ) ) ( not ( = ?auto_634619 ?auto_634631 ) ) ( not ( = ?auto_634620 ?auto_634621 ) ) ( not ( = ?auto_634620 ?auto_634622 ) ) ( not ( = ?auto_634620 ?auto_634623 ) ) ( not ( = ?auto_634620 ?auto_634624 ) ) ( not ( = ?auto_634620 ?auto_634625 ) ) ( not ( = ?auto_634620 ?auto_634626 ) ) ( not ( = ?auto_634620 ?auto_634627 ) ) ( not ( = ?auto_634620 ?auto_634628 ) ) ( not ( = ?auto_634620 ?auto_634629 ) ) ( not ( = ?auto_634620 ?auto_634630 ) ) ( not ( = ?auto_634620 ?auto_634631 ) ) ( not ( = ?auto_634621 ?auto_634622 ) ) ( not ( = ?auto_634621 ?auto_634623 ) ) ( not ( = ?auto_634621 ?auto_634624 ) ) ( not ( = ?auto_634621 ?auto_634625 ) ) ( not ( = ?auto_634621 ?auto_634626 ) ) ( not ( = ?auto_634621 ?auto_634627 ) ) ( not ( = ?auto_634621 ?auto_634628 ) ) ( not ( = ?auto_634621 ?auto_634629 ) ) ( not ( = ?auto_634621 ?auto_634630 ) ) ( not ( = ?auto_634621 ?auto_634631 ) ) ( not ( = ?auto_634622 ?auto_634623 ) ) ( not ( = ?auto_634622 ?auto_634624 ) ) ( not ( = ?auto_634622 ?auto_634625 ) ) ( not ( = ?auto_634622 ?auto_634626 ) ) ( not ( = ?auto_634622 ?auto_634627 ) ) ( not ( = ?auto_634622 ?auto_634628 ) ) ( not ( = ?auto_634622 ?auto_634629 ) ) ( not ( = ?auto_634622 ?auto_634630 ) ) ( not ( = ?auto_634622 ?auto_634631 ) ) ( not ( = ?auto_634623 ?auto_634624 ) ) ( not ( = ?auto_634623 ?auto_634625 ) ) ( not ( = ?auto_634623 ?auto_634626 ) ) ( not ( = ?auto_634623 ?auto_634627 ) ) ( not ( = ?auto_634623 ?auto_634628 ) ) ( not ( = ?auto_634623 ?auto_634629 ) ) ( not ( = ?auto_634623 ?auto_634630 ) ) ( not ( = ?auto_634623 ?auto_634631 ) ) ( not ( = ?auto_634624 ?auto_634625 ) ) ( not ( = ?auto_634624 ?auto_634626 ) ) ( not ( = ?auto_634624 ?auto_634627 ) ) ( not ( = ?auto_634624 ?auto_634628 ) ) ( not ( = ?auto_634624 ?auto_634629 ) ) ( not ( = ?auto_634624 ?auto_634630 ) ) ( not ( = ?auto_634624 ?auto_634631 ) ) ( not ( = ?auto_634625 ?auto_634626 ) ) ( not ( = ?auto_634625 ?auto_634627 ) ) ( not ( = ?auto_634625 ?auto_634628 ) ) ( not ( = ?auto_634625 ?auto_634629 ) ) ( not ( = ?auto_634625 ?auto_634630 ) ) ( not ( = ?auto_634625 ?auto_634631 ) ) ( not ( = ?auto_634626 ?auto_634627 ) ) ( not ( = ?auto_634626 ?auto_634628 ) ) ( not ( = ?auto_634626 ?auto_634629 ) ) ( not ( = ?auto_634626 ?auto_634630 ) ) ( not ( = ?auto_634626 ?auto_634631 ) ) ( not ( = ?auto_634627 ?auto_634628 ) ) ( not ( = ?auto_634627 ?auto_634629 ) ) ( not ( = ?auto_634627 ?auto_634630 ) ) ( not ( = ?auto_634627 ?auto_634631 ) ) ( not ( = ?auto_634628 ?auto_634629 ) ) ( not ( = ?auto_634628 ?auto_634630 ) ) ( not ( = ?auto_634628 ?auto_634631 ) ) ( not ( = ?auto_634629 ?auto_634630 ) ) ( not ( = ?auto_634629 ?auto_634631 ) ) ( not ( = ?auto_634630 ?auto_634631 ) ) ( ON ?auto_634629 ?auto_634630 ) ( ON ?auto_634628 ?auto_634629 ) ( ON ?auto_634627 ?auto_634628 ) ( ON ?auto_634626 ?auto_634627 ) ( ON ?auto_634625 ?auto_634626 ) ( ON ?auto_634624 ?auto_634625 ) ( ON ?auto_634623 ?auto_634624 ) ( ON ?auto_634622 ?auto_634623 ) ( CLEAR ?auto_634620 ) ( ON ?auto_634621 ?auto_634622 ) ( CLEAR ?auto_634621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_634614 ?auto_634615 ?auto_634616 ?auto_634617 ?auto_634618 ?auto_634619 ?auto_634620 ?auto_634621 )
      ( MAKE-17PILE ?auto_634614 ?auto_634615 ?auto_634616 ?auto_634617 ?auto_634618 ?auto_634619 ?auto_634620 ?auto_634621 ?auto_634622 ?auto_634623 ?auto_634624 ?auto_634625 ?auto_634626 ?auto_634627 ?auto_634628 ?auto_634629 ?auto_634630 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634649 - BLOCK
      ?auto_634650 - BLOCK
      ?auto_634651 - BLOCK
      ?auto_634652 - BLOCK
      ?auto_634653 - BLOCK
      ?auto_634654 - BLOCK
      ?auto_634655 - BLOCK
      ?auto_634656 - BLOCK
      ?auto_634657 - BLOCK
      ?auto_634658 - BLOCK
      ?auto_634659 - BLOCK
      ?auto_634660 - BLOCK
      ?auto_634661 - BLOCK
      ?auto_634662 - BLOCK
      ?auto_634663 - BLOCK
      ?auto_634664 - BLOCK
      ?auto_634665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634665 ) ( ON-TABLE ?auto_634649 ) ( ON ?auto_634650 ?auto_634649 ) ( ON ?auto_634651 ?auto_634650 ) ( ON ?auto_634652 ?auto_634651 ) ( ON ?auto_634653 ?auto_634652 ) ( ON ?auto_634654 ?auto_634653 ) ( ON ?auto_634655 ?auto_634654 ) ( not ( = ?auto_634649 ?auto_634650 ) ) ( not ( = ?auto_634649 ?auto_634651 ) ) ( not ( = ?auto_634649 ?auto_634652 ) ) ( not ( = ?auto_634649 ?auto_634653 ) ) ( not ( = ?auto_634649 ?auto_634654 ) ) ( not ( = ?auto_634649 ?auto_634655 ) ) ( not ( = ?auto_634649 ?auto_634656 ) ) ( not ( = ?auto_634649 ?auto_634657 ) ) ( not ( = ?auto_634649 ?auto_634658 ) ) ( not ( = ?auto_634649 ?auto_634659 ) ) ( not ( = ?auto_634649 ?auto_634660 ) ) ( not ( = ?auto_634649 ?auto_634661 ) ) ( not ( = ?auto_634649 ?auto_634662 ) ) ( not ( = ?auto_634649 ?auto_634663 ) ) ( not ( = ?auto_634649 ?auto_634664 ) ) ( not ( = ?auto_634649 ?auto_634665 ) ) ( not ( = ?auto_634650 ?auto_634651 ) ) ( not ( = ?auto_634650 ?auto_634652 ) ) ( not ( = ?auto_634650 ?auto_634653 ) ) ( not ( = ?auto_634650 ?auto_634654 ) ) ( not ( = ?auto_634650 ?auto_634655 ) ) ( not ( = ?auto_634650 ?auto_634656 ) ) ( not ( = ?auto_634650 ?auto_634657 ) ) ( not ( = ?auto_634650 ?auto_634658 ) ) ( not ( = ?auto_634650 ?auto_634659 ) ) ( not ( = ?auto_634650 ?auto_634660 ) ) ( not ( = ?auto_634650 ?auto_634661 ) ) ( not ( = ?auto_634650 ?auto_634662 ) ) ( not ( = ?auto_634650 ?auto_634663 ) ) ( not ( = ?auto_634650 ?auto_634664 ) ) ( not ( = ?auto_634650 ?auto_634665 ) ) ( not ( = ?auto_634651 ?auto_634652 ) ) ( not ( = ?auto_634651 ?auto_634653 ) ) ( not ( = ?auto_634651 ?auto_634654 ) ) ( not ( = ?auto_634651 ?auto_634655 ) ) ( not ( = ?auto_634651 ?auto_634656 ) ) ( not ( = ?auto_634651 ?auto_634657 ) ) ( not ( = ?auto_634651 ?auto_634658 ) ) ( not ( = ?auto_634651 ?auto_634659 ) ) ( not ( = ?auto_634651 ?auto_634660 ) ) ( not ( = ?auto_634651 ?auto_634661 ) ) ( not ( = ?auto_634651 ?auto_634662 ) ) ( not ( = ?auto_634651 ?auto_634663 ) ) ( not ( = ?auto_634651 ?auto_634664 ) ) ( not ( = ?auto_634651 ?auto_634665 ) ) ( not ( = ?auto_634652 ?auto_634653 ) ) ( not ( = ?auto_634652 ?auto_634654 ) ) ( not ( = ?auto_634652 ?auto_634655 ) ) ( not ( = ?auto_634652 ?auto_634656 ) ) ( not ( = ?auto_634652 ?auto_634657 ) ) ( not ( = ?auto_634652 ?auto_634658 ) ) ( not ( = ?auto_634652 ?auto_634659 ) ) ( not ( = ?auto_634652 ?auto_634660 ) ) ( not ( = ?auto_634652 ?auto_634661 ) ) ( not ( = ?auto_634652 ?auto_634662 ) ) ( not ( = ?auto_634652 ?auto_634663 ) ) ( not ( = ?auto_634652 ?auto_634664 ) ) ( not ( = ?auto_634652 ?auto_634665 ) ) ( not ( = ?auto_634653 ?auto_634654 ) ) ( not ( = ?auto_634653 ?auto_634655 ) ) ( not ( = ?auto_634653 ?auto_634656 ) ) ( not ( = ?auto_634653 ?auto_634657 ) ) ( not ( = ?auto_634653 ?auto_634658 ) ) ( not ( = ?auto_634653 ?auto_634659 ) ) ( not ( = ?auto_634653 ?auto_634660 ) ) ( not ( = ?auto_634653 ?auto_634661 ) ) ( not ( = ?auto_634653 ?auto_634662 ) ) ( not ( = ?auto_634653 ?auto_634663 ) ) ( not ( = ?auto_634653 ?auto_634664 ) ) ( not ( = ?auto_634653 ?auto_634665 ) ) ( not ( = ?auto_634654 ?auto_634655 ) ) ( not ( = ?auto_634654 ?auto_634656 ) ) ( not ( = ?auto_634654 ?auto_634657 ) ) ( not ( = ?auto_634654 ?auto_634658 ) ) ( not ( = ?auto_634654 ?auto_634659 ) ) ( not ( = ?auto_634654 ?auto_634660 ) ) ( not ( = ?auto_634654 ?auto_634661 ) ) ( not ( = ?auto_634654 ?auto_634662 ) ) ( not ( = ?auto_634654 ?auto_634663 ) ) ( not ( = ?auto_634654 ?auto_634664 ) ) ( not ( = ?auto_634654 ?auto_634665 ) ) ( not ( = ?auto_634655 ?auto_634656 ) ) ( not ( = ?auto_634655 ?auto_634657 ) ) ( not ( = ?auto_634655 ?auto_634658 ) ) ( not ( = ?auto_634655 ?auto_634659 ) ) ( not ( = ?auto_634655 ?auto_634660 ) ) ( not ( = ?auto_634655 ?auto_634661 ) ) ( not ( = ?auto_634655 ?auto_634662 ) ) ( not ( = ?auto_634655 ?auto_634663 ) ) ( not ( = ?auto_634655 ?auto_634664 ) ) ( not ( = ?auto_634655 ?auto_634665 ) ) ( not ( = ?auto_634656 ?auto_634657 ) ) ( not ( = ?auto_634656 ?auto_634658 ) ) ( not ( = ?auto_634656 ?auto_634659 ) ) ( not ( = ?auto_634656 ?auto_634660 ) ) ( not ( = ?auto_634656 ?auto_634661 ) ) ( not ( = ?auto_634656 ?auto_634662 ) ) ( not ( = ?auto_634656 ?auto_634663 ) ) ( not ( = ?auto_634656 ?auto_634664 ) ) ( not ( = ?auto_634656 ?auto_634665 ) ) ( not ( = ?auto_634657 ?auto_634658 ) ) ( not ( = ?auto_634657 ?auto_634659 ) ) ( not ( = ?auto_634657 ?auto_634660 ) ) ( not ( = ?auto_634657 ?auto_634661 ) ) ( not ( = ?auto_634657 ?auto_634662 ) ) ( not ( = ?auto_634657 ?auto_634663 ) ) ( not ( = ?auto_634657 ?auto_634664 ) ) ( not ( = ?auto_634657 ?auto_634665 ) ) ( not ( = ?auto_634658 ?auto_634659 ) ) ( not ( = ?auto_634658 ?auto_634660 ) ) ( not ( = ?auto_634658 ?auto_634661 ) ) ( not ( = ?auto_634658 ?auto_634662 ) ) ( not ( = ?auto_634658 ?auto_634663 ) ) ( not ( = ?auto_634658 ?auto_634664 ) ) ( not ( = ?auto_634658 ?auto_634665 ) ) ( not ( = ?auto_634659 ?auto_634660 ) ) ( not ( = ?auto_634659 ?auto_634661 ) ) ( not ( = ?auto_634659 ?auto_634662 ) ) ( not ( = ?auto_634659 ?auto_634663 ) ) ( not ( = ?auto_634659 ?auto_634664 ) ) ( not ( = ?auto_634659 ?auto_634665 ) ) ( not ( = ?auto_634660 ?auto_634661 ) ) ( not ( = ?auto_634660 ?auto_634662 ) ) ( not ( = ?auto_634660 ?auto_634663 ) ) ( not ( = ?auto_634660 ?auto_634664 ) ) ( not ( = ?auto_634660 ?auto_634665 ) ) ( not ( = ?auto_634661 ?auto_634662 ) ) ( not ( = ?auto_634661 ?auto_634663 ) ) ( not ( = ?auto_634661 ?auto_634664 ) ) ( not ( = ?auto_634661 ?auto_634665 ) ) ( not ( = ?auto_634662 ?auto_634663 ) ) ( not ( = ?auto_634662 ?auto_634664 ) ) ( not ( = ?auto_634662 ?auto_634665 ) ) ( not ( = ?auto_634663 ?auto_634664 ) ) ( not ( = ?auto_634663 ?auto_634665 ) ) ( not ( = ?auto_634664 ?auto_634665 ) ) ( ON ?auto_634664 ?auto_634665 ) ( ON ?auto_634663 ?auto_634664 ) ( ON ?auto_634662 ?auto_634663 ) ( ON ?auto_634661 ?auto_634662 ) ( ON ?auto_634660 ?auto_634661 ) ( ON ?auto_634659 ?auto_634660 ) ( ON ?auto_634658 ?auto_634659 ) ( ON ?auto_634657 ?auto_634658 ) ( CLEAR ?auto_634655 ) ( ON ?auto_634656 ?auto_634657 ) ( CLEAR ?auto_634656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_634649 ?auto_634650 ?auto_634651 ?auto_634652 ?auto_634653 ?auto_634654 ?auto_634655 ?auto_634656 )
      ( MAKE-17PILE ?auto_634649 ?auto_634650 ?auto_634651 ?auto_634652 ?auto_634653 ?auto_634654 ?auto_634655 ?auto_634656 ?auto_634657 ?auto_634658 ?auto_634659 ?auto_634660 ?auto_634661 ?auto_634662 ?auto_634663 ?auto_634664 ?auto_634665 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634683 - BLOCK
      ?auto_634684 - BLOCK
      ?auto_634685 - BLOCK
      ?auto_634686 - BLOCK
      ?auto_634687 - BLOCK
      ?auto_634688 - BLOCK
      ?auto_634689 - BLOCK
      ?auto_634690 - BLOCK
      ?auto_634691 - BLOCK
      ?auto_634692 - BLOCK
      ?auto_634693 - BLOCK
      ?auto_634694 - BLOCK
      ?auto_634695 - BLOCK
      ?auto_634696 - BLOCK
      ?auto_634697 - BLOCK
      ?auto_634698 - BLOCK
      ?auto_634699 - BLOCK
    )
    :vars
    (
      ?auto_634700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634699 ?auto_634700 ) ( ON-TABLE ?auto_634683 ) ( ON ?auto_634684 ?auto_634683 ) ( ON ?auto_634685 ?auto_634684 ) ( ON ?auto_634686 ?auto_634685 ) ( ON ?auto_634687 ?auto_634686 ) ( ON ?auto_634688 ?auto_634687 ) ( not ( = ?auto_634683 ?auto_634684 ) ) ( not ( = ?auto_634683 ?auto_634685 ) ) ( not ( = ?auto_634683 ?auto_634686 ) ) ( not ( = ?auto_634683 ?auto_634687 ) ) ( not ( = ?auto_634683 ?auto_634688 ) ) ( not ( = ?auto_634683 ?auto_634689 ) ) ( not ( = ?auto_634683 ?auto_634690 ) ) ( not ( = ?auto_634683 ?auto_634691 ) ) ( not ( = ?auto_634683 ?auto_634692 ) ) ( not ( = ?auto_634683 ?auto_634693 ) ) ( not ( = ?auto_634683 ?auto_634694 ) ) ( not ( = ?auto_634683 ?auto_634695 ) ) ( not ( = ?auto_634683 ?auto_634696 ) ) ( not ( = ?auto_634683 ?auto_634697 ) ) ( not ( = ?auto_634683 ?auto_634698 ) ) ( not ( = ?auto_634683 ?auto_634699 ) ) ( not ( = ?auto_634683 ?auto_634700 ) ) ( not ( = ?auto_634684 ?auto_634685 ) ) ( not ( = ?auto_634684 ?auto_634686 ) ) ( not ( = ?auto_634684 ?auto_634687 ) ) ( not ( = ?auto_634684 ?auto_634688 ) ) ( not ( = ?auto_634684 ?auto_634689 ) ) ( not ( = ?auto_634684 ?auto_634690 ) ) ( not ( = ?auto_634684 ?auto_634691 ) ) ( not ( = ?auto_634684 ?auto_634692 ) ) ( not ( = ?auto_634684 ?auto_634693 ) ) ( not ( = ?auto_634684 ?auto_634694 ) ) ( not ( = ?auto_634684 ?auto_634695 ) ) ( not ( = ?auto_634684 ?auto_634696 ) ) ( not ( = ?auto_634684 ?auto_634697 ) ) ( not ( = ?auto_634684 ?auto_634698 ) ) ( not ( = ?auto_634684 ?auto_634699 ) ) ( not ( = ?auto_634684 ?auto_634700 ) ) ( not ( = ?auto_634685 ?auto_634686 ) ) ( not ( = ?auto_634685 ?auto_634687 ) ) ( not ( = ?auto_634685 ?auto_634688 ) ) ( not ( = ?auto_634685 ?auto_634689 ) ) ( not ( = ?auto_634685 ?auto_634690 ) ) ( not ( = ?auto_634685 ?auto_634691 ) ) ( not ( = ?auto_634685 ?auto_634692 ) ) ( not ( = ?auto_634685 ?auto_634693 ) ) ( not ( = ?auto_634685 ?auto_634694 ) ) ( not ( = ?auto_634685 ?auto_634695 ) ) ( not ( = ?auto_634685 ?auto_634696 ) ) ( not ( = ?auto_634685 ?auto_634697 ) ) ( not ( = ?auto_634685 ?auto_634698 ) ) ( not ( = ?auto_634685 ?auto_634699 ) ) ( not ( = ?auto_634685 ?auto_634700 ) ) ( not ( = ?auto_634686 ?auto_634687 ) ) ( not ( = ?auto_634686 ?auto_634688 ) ) ( not ( = ?auto_634686 ?auto_634689 ) ) ( not ( = ?auto_634686 ?auto_634690 ) ) ( not ( = ?auto_634686 ?auto_634691 ) ) ( not ( = ?auto_634686 ?auto_634692 ) ) ( not ( = ?auto_634686 ?auto_634693 ) ) ( not ( = ?auto_634686 ?auto_634694 ) ) ( not ( = ?auto_634686 ?auto_634695 ) ) ( not ( = ?auto_634686 ?auto_634696 ) ) ( not ( = ?auto_634686 ?auto_634697 ) ) ( not ( = ?auto_634686 ?auto_634698 ) ) ( not ( = ?auto_634686 ?auto_634699 ) ) ( not ( = ?auto_634686 ?auto_634700 ) ) ( not ( = ?auto_634687 ?auto_634688 ) ) ( not ( = ?auto_634687 ?auto_634689 ) ) ( not ( = ?auto_634687 ?auto_634690 ) ) ( not ( = ?auto_634687 ?auto_634691 ) ) ( not ( = ?auto_634687 ?auto_634692 ) ) ( not ( = ?auto_634687 ?auto_634693 ) ) ( not ( = ?auto_634687 ?auto_634694 ) ) ( not ( = ?auto_634687 ?auto_634695 ) ) ( not ( = ?auto_634687 ?auto_634696 ) ) ( not ( = ?auto_634687 ?auto_634697 ) ) ( not ( = ?auto_634687 ?auto_634698 ) ) ( not ( = ?auto_634687 ?auto_634699 ) ) ( not ( = ?auto_634687 ?auto_634700 ) ) ( not ( = ?auto_634688 ?auto_634689 ) ) ( not ( = ?auto_634688 ?auto_634690 ) ) ( not ( = ?auto_634688 ?auto_634691 ) ) ( not ( = ?auto_634688 ?auto_634692 ) ) ( not ( = ?auto_634688 ?auto_634693 ) ) ( not ( = ?auto_634688 ?auto_634694 ) ) ( not ( = ?auto_634688 ?auto_634695 ) ) ( not ( = ?auto_634688 ?auto_634696 ) ) ( not ( = ?auto_634688 ?auto_634697 ) ) ( not ( = ?auto_634688 ?auto_634698 ) ) ( not ( = ?auto_634688 ?auto_634699 ) ) ( not ( = ?auto_634688 ?auto_634700 ) ) ( not ( = ?auto_634689 ?auto_634690 ) ) ( not ( = ?auto_634689 ?auto_634691 ) ) ( not ( = ?auto_634689 ?auto_634692 ) ) ( not ( = ?auto_634689 ?auto_634693 ) ) ( not ( = ?auto_634689 ?auto_634694 ) ) ( not ( = ?auto_634689 ?auto_634695 ) ) ( not ( = ?auto_634689 ?auto_634696 ) ) ( not ( = ?auto_634689 ?auto_634697 ) ) ( not ( = ?auto_634689 ?auto_634698 ) ) ( not ( = ?auto_634689 ?auto_634699 ) ) ( not ( = ?auto_634689 ?auto_634700 ) ) ( not ( = ?auto_634690 ?auto_634691 ) ) ( not ( = ?auto_634690 ?auto_634692 ) ) ( not ( = ?auto_634690 ?auto_634693 ) ) ( not ( = ?auto_634690 ?auto_634694 ) ) ( not ( = ?auto_634690 ?auto_634695 ) ) ( not ( = ?auto_634690 ?auto_634696 ) ) ( not ( = ?auto_634690 ?auto_634697 ) ) ( not ( = ?auto_634690 ?auto_634698 ) ) ( not ( = ?auto_634690 ?auto_634699 ) ) ( not ( = ?auto_634690 ?auto_634700 ) ) ( not ( = ?auto_634691 ?auto_634692 ) ) ( not ( = ?auto_634691 ?auto_634693 ) ) ( not ( = ?auto_634691 ?auto_634694 ) ) ( not ( = ?auto_634691 ?auto_634695 ) ) ( not ( = ?auto_634691 ?auto_634696 ) ) ( not ( = ?auto_634691 ?auto_634697 ) ) ( not ( = ?auto_634691 ?auto_634698 ) ) ( not ( = ?auto_634691 ?auto_634699 ) ) ( not ( = ?auto_634691 ?auto_634700 ) ) ( not ( = ?auto_634692 ?auto_634693 ) ) ( not ( = ?auto_634692 ?auto_634694 ) ) ( not ( = ?auto_634692 ?auto_634695 ) ) ( not ( = ?auto_634692 ?auto_634696 ) ) ( not ( = ?auto_634692 ?auto_634697 ) ) ( not ( = ?auto_634692 ?auto_634698 ) ) ( not ( = ?auto_634692 ?auto_634699 ) ) ( not ( = ?auto_634692 ?auto_634700 ) ) ( not ( = ?auto_634693 ?auto_634694 ) ) ( not ( = ?auto_634693 ?auto_634695 ) ) ( not ( = ?auto_634693 ?auto_634696 ) ) ( not ( = ?auto_634693 ?auto_634697 ) ) ( not ( = ?auto_634693 ?auto_634698 ) ) ( not ( = ?auto_634693 ?auto_634699 ) ) ( not ( = ?auto_634693 ?auto_634700 ) ) ( not ( = ?auto_634694 ?auto_634695 ) ) ( not ( = ?auto_634694 ?auto_634696 ) ) ( not ( = ?auto_634694 ?auto_634697 ) ) ( not ( = ?auto_634694 ?auto_634698 ) ) ( not ( = ?auto_634694 ?auto_634699 ) ) ( not ( = ?auto_634694 ?auto_634700 ) ) ( not ( = ?auto_634695 ?auto_634696 ) ) ( not ( = ?auto_634695 ?auto_634697 ) ) ( not ( = ?auto_634695 ?auto_634698 ) ) ( not ( = ?auto_634695 ?auto_634699 ) ) ( not ( = ?auto_634695 ?auto_634700 ) ) ( not ( = ?auto_634696 ?auto_634697 ) ) ( not ( = ?auto_634696 ?auto_634698 ) ) ( not ( = ?auto_634696 ?auto_634699 ) ) ( not ( = ?auto_634696 ?auto_634700 ) ) ( not ( = ?auto_634697 ?auto_634698 ) ) ( not ( = ?auto_634697 ?auto_634699 ) ) ( not ( = ?auto_634697 ?auto_634700 ) ) ( not ( = ?auto_634698 ?auto_634699 ) ) ( not ( = ?auto_634698 ?auto_634700 ) ) ( not ( = ?auto_634699 ?auto_634700 ) ) ( ON ?auto_634698 ?auto_634699 ) ( ON ?auto_634697 ?auto_634698 ) ( ON ?auto_634696 ?auto_634697 ) ( ON ?auto_634695 ?auto_634696 ) ( ON ?auto_634694 ?auto_634695 ) ( ON ?auto_634693 ?auto_634694 ) ( ON ?auto_634692 ?auto_634693 ) ( ON ?auto_634691 ?auto_634692 ) ( ON ?auto_634690 ?auto_634691 ) ( CLEAR ?auto_634688 ) ( ON ?auto_634689 ?auto_634690 ) ( CLEAR ?auto_634689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_634683 ?auto_634684 ?auto_634685 ?auto_634686 ?auto_634687 ?auto_634688 ?auto_634689 )
      ( MAKE-17PILE ?auto_634683 ?auto_634684 ?auto_634685 ?auto_634686 ?auto_634687 ?auto_634688 ?auto_634689 ?auto_634690 ?auto_634691 ?auto_634692 ?auto_634693 ?auto_634694 ?auto_634695 ?auto_634696 ?auto_634697 ?auto_634698 ?auto_634699 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634718 - BLOCK
      ?auto_634719 - BLOCK
      ?auto_634720 - BLOCK
      ?auto_634721 - BLOCK
      ?auto_634722 - BLOCK
      ?auto_634723 - BLOCK
      ?auto_634724 - BLOCK
      ?auto_634725 - BLOCK
      ?auto_634726 - BLOCK
      ?auto_634727 - BLOCK
      ?auto_634728 - BLOCK
      ?auto_634729 - BLOCK
      ?auto_634730 - BLOCK
      ?auto_634731 - BLOCK
      ?auto_634732 - BLOCK
      ?auto_634733 - BLOCK
      ?auto_634734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634734 ) ( ON-TABLE ?auto_634718 ) ( ON ?auto_634719 ?auto_634718 ) ( ON ?auto_634720 ?auto_634719 ) ( ON ?auto_634721 ?auto_634720 ) ( ON ?auto_634722 ?auto_634721 ) ( ON ?auto_634723 ?auto_634722 ) ( not ( = ?auto_634718 ?auto_634719 ) ) ( not ( = ?auto_634718 ?auto_634720 ) ) ( not ( = ?auto_634718 ?auto_634721 ) ) ( not ( = ?auto_634718 ?auto_634722 ) ) ( not ( = ?auto_634718 ?auto_634723 ) ) ( not ( = ?auto_634718 ?auto_634724 ) ) ( not ( = ?auto_634718 ?auto_634725 ) ) ( not ( = ?auto_634718 ?auto_634726 ) ) ( not ( = ?auto_634718 ?auto_634727 ) ) ( not ( = ?auto_634718 ?auto_634728 ) ) ( not ( = ?auto_634718 ?auto_634729 ) ) ( not ( = ?auto_634718 ?auto_634730 ) ) ( not ( = ?auto_634718 ?auto_634731 ) ) ( not ( = ?auto_634718 ?auto_634732 ) ) ( not ( = ?auto_634718 ?auto_634733 ) ) ( not ( = ?auto_634718 ?auto_634734 ) ) ( not ( = ?auto_634719 ?auto_634720 ) ) ( not ( = ?auto_634719 ?auto_634721 ) ) ( not ( = ?auto_634719 ?auto_634722 ) ) ( not ( = ?auto_634719 ?auto_634723 ) ) ( not ( = ?auto_634719 ?auto_634724 ) ) ( not ( = ?auto_634719 ?auto_634725 ) ) ( not ( = ?auto_634719 ?auto_634726 ) ) ( not ( = ?auto_634719 ?auto_634727 ) ) ( not ( = ?auto_634719 ?auto_634728 ) ) ( not ( = ?auto_634719 ?auto_634729 ) ) ( not ( = ?auto_634719 ?auto_634730 ) ) ( not ( = ?auto_634719 ?auto_634731 ) ) ( not ( = ?auto_634719 ?auto_634732 ) ) ( not ( = ?auto_634719 ?auto_634733 ) ) ( not ( = ?auto_634719 ?auto_634734 ) ) ( not ( = ?auto_634720 ?auto_634721 ) ) ( not ( = ?auto_634720 ?auto_634722 ) ) ( not ( = ?auto_634720 ?auto_634723 ) ) ( not ( = ?auto_634720 ?auto_634724 ) ) ( not ( = ?auto_634720 ?auto_634725 ) ) ( not ( = ?auto_634720 ?auto_634726 ) ) ( not ( = ?auto_634720 ?auto_634727 ) ) ( not ( = ?auto_634720 ?auto_634728 ) ) ( not ( = ?auto_634720 ?auto_634729 ) ) ( not ( = ?auto_634720 ?auto_634730 ) ) ( not ( = ?auto_634720 ?auto_634731 ) ) ( not ( = ?auto_634720 ?auto_634732 ) ) ( not ( = ?auto_634720 ?auto_634733 ) ) ( not ( = ?auto_634720 ?auto_634734 ) ) ( not ( = ?auto_634721 ?auto_634722 ) ) ( not ( = ?auto_634721 ?auto_634723 ) ) ( not ( = ?auto_634721 ?auto_634724 ) ) ( not ( = ?auto_634721 ?auto_634725 ) ) ( not ( = ?auto_634721 ?auto_634726 ) ) ( not ( = ?auto_634721 ?auto_634727 ) ) ( not ( = ?auto_634721 ?auto_634728 ) ) ( not ( = ?auto_634721 ?auto_634729 ) ) ( not ( = ?auto_634721 ?auto_634730 ) ) ( not ( = ?auto_634721 ?auto_634731 ) ) ( not ( = ?auto_634721 ?auto_634732 ) ) ( not ( = ?auto_634721 ?auto_634733 ) ) ( not ( = ?auto_634721 ?auto_634734 ) ) ( not ( = ?auto_634722 ?auto_634723 ) ) ( not ( = ?auto_634722 ?auto_634724 ) ) ( not ( = ?auto_634722 ?auto_634725 ) ) ( not ( = ?auto_634722 ?auto_634726 ) ) ( not ( = ?auto_634722 ?auto_634727 ) ) ( not ( = ?auto_634722 ?auto_634728 ) ) ( not ( = ?auto_634722 ?auto_634729 ) ) ( not ( = ?auto_634722 ?auto_634730 ) ) ( not ( = ?auto_634722 ?auto_634731 ) ) ( not ( = ?auto_634722 ?auto_634732 ) ) ( not ( = ?auto_634722 ?auto_634733 ) ) ( not ( = ?auto_634722 ?auto_634734 ) ) ( not ( = ?auto_634723 ?auto_634724 ) ) ( not ( = ?auto_634723 ?auto_634725 ) ) ( not ( = ?auto_634723 ?auto_634726 ) ) ( not ( = ?auto_634723 ?auto_634727 ) ) ( not ( = ?auto_634723 ?auto_634728 ) ) ( not ( = ?auto_634723 ?auto_634729 ) ) ( not ( = ?auto_634723 ?auto_634730 ) ) ( not ( = ?auto_634723 ?auto_634731 ) ) ( not ( = ?auto_634723 ?auto_634732 ) ) ( not ( = ?auto_634723 ?auto_634733 ) ) ( not ( = ?auto_634723 ?auto_634734 ) ) ( not ( = ?auto_634724 ?auto_634725 ) ) ( not ( = ?auto_634724 ?auto_634726 ) ) ( not ( = ?auto_634724 ?auto_634727 ) ) ( not ( = ?auto_634724 ?auto_634728 ) ) ( not ( = ?auto_634724 ?auto_634729 ) ) ( not ( = ?auto_634724 ?auto_634730 ) ) ( not ( = ?auto_634724 ?auto_634731 ) ) ( not ( = ?auto_634724 ?auto_634732 ) ) ( not ( = ?auto_634724 ?auto_634733 ) ) ( not ( = ?auto_634724 ?auto_634734 ) ) ( not ( = ?auto_634725 ?auto_634726 ) ) ( not ( = ?auto_634725 ?auto_634727 ) ) ( not ( = ?auto_634725 ?auto_634728 ) ) ( not ( = ?auto_634725 ?auto_634729 ) ) ( not ( = ?auto_634725 ?auto_634730 ) ) ( not ( = ?auto_634725 ?auto_634731 ) ) ( not ( = ?auto_634725 ?auto_634732 ) ) ( not ( = ?auto_634725 ?auto_634733 ) ) ( not ( = ?auto_634725 ?auto_634734 ) ) ( not ( = ?auto_634726 ?auto_634727 ) ) ( not ( = ?auto_634726 ?auto_634728 ) ) ( not ( = ?auto_634726 ?auto_634729 ) ) ( not ( = ?auto_634726 ?auto_634730 ) ) ( not ( = ?auto_634726 ?auto_634731 ) ) ( not ( = ?auto_634726 ?auto_634732 ) ) ( not ( = ?auto_634726 ?auto_634733 ) ) ( not ( = ?auto_634726 ?auto_634734 ) ) ( not ( = ?auto_634727 ?auto_634728 ) ) ( not ( = ?auto_634727 ?auto_634729 ) ) ( not ( = ?auto_634727 ?auto_634730 ) ) ( not ( = ?auto_634727 ?auto_634731 ) ) ( not ( = ?auto_634727 ?auto_634732 ) ) ( not ( = ?auto_634727 ?auto_634733 ) ) ( not ( = ?auto_634727 ?auto_634734 ) ) ( not ( = ?auto_634728 ?auto_634729 ) ) ( not ( = ?auto_634728 ?auto_634730 ) ) ( not ( = ?auto_634728 ?auto_634731 ) ) ( not ( = ?auto_634728 ?auto_634732 ) ) ( not ( = ?auto_634728 ?auto_634733 ) ) ( not ( = ?auto_634728 ?auto_634734 ) ) ( not ( = ?auto_634729 ?auto_634730 ) ) ( not ( = ?auto_634729 ?auto_634731 ) ) ( not ( = ?auto_634729 ?auto_634732 ) ) ( not ( = ?auto_634729 ?auto_634733 ) ) ( not ( = ?auto_634729 ?auto_634734 ) ) ( not ( = ?auto_634730 ?auto_634731 ) ) ( not ( = ?auto_634730 ?auto_634732 ) ) ( not ( = ?auto_634730 ?auto_634733 ) ) ( not ( = ?auto_634730 ?auto_634734 ) ) ( not ( = ?auto_634731 ?auto_634732 ) ) ( not ( = ?auto_634731 ?auto_634733 ) ) ( not ( = ?auto_634731 ?auto_634734 ) ) ( not ( = ?auto_634732 ?auto_634733 ) ) ( not ( = ?auto_634732 ?auto_634734 ) ) ( not ( = ?auto_634733 ?auto_634734 ) ) ( ON ?auto_634733 ?auto_634734 ) ( ON ?auto_634732 ?auto_634733 ) ( ON ?auto_634731 ?auto_634732 ) ( ON ?auto_634730 ?auto_634731 ) ( ON ?auto_634729 ?auto_634730 ) ( ON ?auto_634728 ?auto_634729 ) ( ON ?auto_634727 ?auto_634728 ) ( ON ?auto_634726 ?auto_634727 ) ( ON ?auto_634725 ?auto_634726 ) ( CLEAR ?auto_634723 ) ( ON ?auto_634724 ?auto_634725 ) ( CLEAR ?auto_634724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_634718 ?auto_634719 ?auto_634720 ?auto_634721 ?auto_634722 ?auto_634723 ?auto_634724 )
      ( MAKE-17PILE ?auto_634718 ?auto_634719 ?auto_634720 ?auto_634721 ?auto_634722 ?auto_634723 ?auto_634724 ?auto_634725 ?auto_634726 ?auto_634727 ?auto_634728 ?auto_634729 ?auto_634730 ?auto_634731 ?auto_634732 ?auto_634733 ?auto_634734 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634752 - BLOCK
      ?auto_634753 - BLOCK
      ?auto_634754 - BLOCK
      ?auto_634755 - BLOCK
      ?auto_634756 - BLOCK
      ?auto_634757 - BLOCK
      ?auto_634758 - BLOCK
      ?auto_634759 - BLOCK
      ?auto_634760 - BLOCK
      ?auto_634761 - BLOCK
      ?auto_634762 - BLOCK
      ?auto_634763 - BLOCK
      ?auto_634764 - BLOCK
      ?auto_634765 - BLOCK
      ?auto_634766 - BLOCK
      ?auto_634767 - BLOCK
      ?auto_634768 - BLOCK
    )
    :vars
    (
      ?auto_634769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634768 ?auto_634769 ) ( ON-TABLE ?auto_634752 ) ( ON ?auto_634753 ?auto_634752 ) ( ON ?auto_634754 ?auto_634753 ) ( ON ?auto_634755 ?auto_634754 ) ( ON ?auto_634756 ?auto_634755 ) ( not ( = ?auto_634752 ?auto_634753 ) ) ( not ( = ?auto_634752 ?auto_634754 ) ) ( not ( = ?auto_634752 ?auto_634755 ) ) ( not ( = ?auto_634752 ?auto_634756 ) ) ( not ( = ?auto_634752 ?auto_634757 ) ) ( not ( = ?auto_634752 ?auto_634758 ) ) ( not ( = ?auto_634752 ?auto_634759 ) ) ( not ( = ?auto_634752 ?auto_634760 ) ) ( not ( = ?auto_634752 ?auto_634761 ) ) ( not ( = ?auto_634752 ?auto_634762 ) ) ( not ( = ?auto_634752 ?auto_634763 ) ) ( not ( = ?auto_634752 ?auto_634764 ) ) ( not ( = ?auto_634752 ?auto_634765 ) ) ( not ( = ?auto_634752 ?auto_634766 ) ) ( not ( = ?auto_634752 ?auto_634767 ) ) ( not ( = ?auto_634752 ?auto_634768 ) ) ( not ( = ?auto_634752 ?auto_634769 ) ) ( not ( = ?auto_634753 ?auto_634754 ) ) ( not ( = ?auto_634753 ?auto_634755 ) ) ( not ( = ?auto_634753 ?auto_634756 ) ) ( not ( = ?auto_634753 ?auto_634757 ) ) ( not ( = ?auto_634753 ?auto_634758 ) ) ( not ( = ?auto_634753 ?auto_634759 ) ) ( not ( = ?auto_634753 ?auto_634760 ) ) ( not ( = ?auto_634753 ?auto_634761 ) ) ( not ( = ?auto_634753 ?auto_634762 ) ) ( not ( = ?auto_634753 ?auto_634763 ) ) ( not ( = ?auto_634753 ?auto_634764 ) ) ( not ( = ?auto_634753 ?auto_634765 ) ) ( not ( = ?auto_634753 ?auto_634766 ) ) ( not ( = ?auto_634753 ?auto_634767 ) ) ( not ( = ?auto_634753 ?auto_634768 ) ) ( not ( = ?auto_634753 ?auto_634769 ) ) ( not ( = ?auto_634754 ?auto_634755 ) ) ( not ( = ?auto_634754 ?auto_634756 ) ) ( not ( = ?auto_634754 ?auto_634757 ) ) ( not ( = ?auto_634754 ?auto_634758 ) ) ( not ( = ?auto_634754 ?auto_634759 ) ) ( not ( = ?auto_634754 ?auto_634760 ) ) ( not ( = ?auto_634754 ?auto_634761 ) ) ( not ( = ?auto_634754 ?auto_634762 ) ) ( not ( = ?auto_634754 ?auto_634763 ) ) ( not ( = ?auto_634754 ?auto_634764 ) ) ( not ( = ?auto_634754 ?auto_634765 ) ) ( not ( = ?auto_634754 ?auto_634766 ) ) ( not ( = ?auto_634754 ?auto_634767 ) ) ( not ( = ?auto_634754 ?auto_634768 ) ) ( not ( = ?auto_634754 ?auto_634769 ) ) ( not ( = ?auto_634755 ?auto_634756 ) ) ( not ( = ?auto_634755 ?auto_634757 ) ) ( not ( = ?auto_634755 ?auto_634758 ) ) ( not ( = ?auto_634755 ?auto_634759 ) ) ( not ( = ?auto_634755 ?auto_634760 ) ) ( not ( = ?auto_634755 ?auto_634761 ) ) ( not ( = ?auto_634755 ?auto_634762 ) ) ( not ( = ?auto_634755 ?auto_634763 ) ) ( not ( = ?auto_634755 ?auto_634764 ) ) ( not ( = ?auto_634755 ?auto_634765 ) ) ( not ( = ?auto_634755 ?auto_634766 ) ) ( not ( = ?auto_634755 ?auto_634767 ) ) ( not ( = ?auto_634755 ?auto_634768 ) ) ( not ( = ?auto_634755 ?auto_634769 ) ) ( not ( = ?auto_634756 ?auto_634757 ) ) ( not ( = ?auto_634756 ?auto_634758 ) ) ( not ( = ?auto_634756 ?auto_634759 ) ) ( not ( = ?auto_634756 ?auto_634760 ) ) ( not ( = ?auto_634756 ?auto_634761 ) ) ( not ( = ?auto_634756 ?auto_634762 ) ) ( not ( = ?auto_634756 ?auto_634763 ) ) ( not ( = ?auto_634756 ?auto_634764 ) ) ( not ( = ?auto_634756 ?auto_634765 ) ) ( not ( = ?auto_634756 ?auto_634766 ) ) ( not ( = ?auto_634756 ?auto_634767 ) ) ( not ( = ?auto_634756 ?auto_634768 ) ) ( not ( = ?auto_634756 ?auto_634769 ) ) ( not ( = ?auto_634757 ?auto_634758 ) ) ( not ( = ?auto_634757 ?auto_634759 ) ) ( not ( = ?auto_634757 ?auto_634760 ) ) ( not ( = ?auto_634757 ?auto_634761 ) ) ( not ( = ?auto_634757 ?auto_634762 ) ) ( not ( = ?auto_634757 ?auto_634763 ) ) ( not ( = ?auto_634757 ?auto_634764 ) ) ( not ( = ?auto_634757 ?auto_634765 ) ) ( not ( = ?auto_634757 ?auto_634766 ) ) ( not ( = ?auto_634757 ?auto_634767 ) ) ( not ( = ?auto_634757 ?auto_634768 ) ) ( not ( = ?auto_634757 ?auto_634769 ) ) ( not ( = ?auto_634758 ?auto_634759 ) ) ( not ( = ?auto_634758 ?auto_634760 ) ) ( not ( = ?auto_634758 ?auto_634761 ) ) ( not ( = ?auto_634758 ?auto_634762 ) ) ( not ( = ?auto_634758 ?auto_634763 ) ) ( not ( = ?auto_634758 ?auto_634764 ) ) ( not ( = ?auto_634758 ?auto_634765 ) ) ( not ( = ?auto_634758 ?auto_634766 ) ) ( not ( = ?auto_634758 ?auto_634767 ) ) ( not ( = ?auto_634758 ?auto_634768 ) ) ( not ( = ?auto_634758 ?auto_634769 ) ) ( not ( = ?auto_634759 ?auto_634760 ) ) ( not ( = ?auto_634759 ?auto_634761 ) ) ( not ( = ?auto_634759 ?auto_634762 ) ) ( not ( = ?auto_634759 ?auto_634763 ) ) ( not ( = ?auto_634759 ?auto_634764 ) ) ( not ( = ?auto_634759 ?auto_634765 ) ) ( not ( = ?auto_634759 ?auto_634766 ) ) ( not ( = ?auto_634759 ?auto_634767 ) ) ( not ( = ?auto_634759 ?auto_634768 ) ) ( not ( = ?auto_634759 ?auto_634769 ) ) ( not ( = ?auto_634760 ?auto_634761 ) ) ( not ( = ?auto_634760 ?auto_634762 ) ) ( not ( = ?auto_634760 ?auto_634763 ) ) ( not ( = ?auto_634760 ?auto_634764 ) ) ( not ( = ?auto_634760 ?auto_634765 ) ) ( not ( = ?auto_634760 ?auto_634766 ) ) ( not ( = ?auto_634760 ?auto_634767 ) ) ( not ( = ?auto_634760 ?auto_634768 ) ) ( not ( = ?auto_634760 ?auto_634769 ) ) ( not ( = ?auto_634761 ?auto_634762 ) ) ( not ( = ?auto_634761 ?auto_634763 ) ) ( not ( = ?auto_634761 ?auto_634764 ) ) ( not ( = ?auto_634761 ?auto_634765 ) ) ( not ( = ?auto_634761 ?auto_634766 ) ) ( not ( = ?auto_634761 ?auto_634767 ) ) ( not ( = ?auto_634761 ?auto_634768 ) ) ( not ( = ?auto_634761 ?auto_634769 ) ) ( not ( = ?auto_634762 ?auto_634763 ) ) ( not ( = ?auto_634762 ?auto_634764 ) ) ( not ( = ?auto_634762 ?auto_634765 ) ) ( not ( = ?auto_634762 ?auto_634766 ) ) ( not ( = ?auto_634762 ?auto_634767 ) ) ( not ( = ?auto_634762 ?auto_634768 ) ) ( not ( = ?auto_634762 ?auto_634769 ) ) ( not ( = ?auto_634763 ?auto_634764 ) ) ( not ( = ?auto_634763 ?auto_634765 ) ) ( not ( = ?auto_634763 ?auto_634766 ) ) ( not ( = ?auto_634763 ?auto_634767 ) ) ( not ( = ?auto_634763 ?auto_634768 ) ) ( not ( = ?auto_634763 ?auto_634769 ) ) ( not ( = ?auto_634764 ?auto_634765 ) ) ( not ( = ?auto_634764 ?auto_634766 ) ) ( not ( = ?auto_634764 ?auto_634767 ) ) ( not ( = ?auto_634764 ?auto_634768 ) ) ( not ( = ?auto_634764 ?auto_634769 ) ) ( not ( = ?auto_634765 ?auto_634766 ) ) ( not ( = ?auto_634765 ?auto_634767 ) ) ( not ( = ?auto_634765 ?auto_634768 ) ) ( not ( = ?auto_634765 ?auto_634769 ) ) ( not ( = ?auto_634766 ?auto_634767 ) ) ( not ( = ?auto_634766 ?auto_634768 ) ) ( not ( = ?auto_634766 ?auto_634769 ) ) ( not ( = ?auto_634767 ?auto_634768 ) ) ( not ( = ?auto_634767 ?auto_634769 ) ) ( not ( = ?auto_634768 ?auto_634769 ) ) ( ON ?auto_634767 ?auto_634768 ) ( ON ?auto_634766 ?auto_634767 ) ( ON ?auto_634765 ?auto_634766 ) ( ON ?auto_634764 ?auto_634765 ) ( ON ?auto_634763 ?auto_634764 ) ( ON ?auto_634762 ?auto_634763 ) ( ON ?auto_634761 ?auto_634762 ) ( ON ?auto_634760 ?auto_634761 ) ( ON ?auto_634759 ?auto_634760 ) ( ON ?auto_634758 ?auto_634759 ) ( CLEAR ?auto_634756 ) ( ON ?auto_634757 ?auto_634758 ) ( CLEAR ?auto_634757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_634752 ?auto_634753 ?auto_634754 ?auto_634755 ?auto_634756 ?auto_634757 )
      ( MAKE-17PILE ?auto_634752 ?auto_634753 ?auto_634754 ?auto_634755 ?auto_634756 ?auto_634757 ?auto_634758 ?auto_634759 ?auto_634760 ?auto_634761 ?auto_634762 ?auto_634763 ?auto_634764 ?auto_634765 ?auto_634766 ?auto_634767 ?auto_634768 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634787 - BLOCK
      ?auto_634788 - BLOCK
      ?auto_634789 - BLOCK
      ?auto_634790 - BLOCK
      ?auto_634791 - BLOCK
      ?auto_634792 - BLOCK
      ?auto_634793 - BLOCK
      ?auto_634794 - BLOCK
      ?auto_634795 - BLOCK
      ?auto_634796 - BLOCK
      ?auto_634797 - BLOCK
      ?auto_634798 - BLOCK
      ?auto_634799 - BLOCK
      ?auto_634800 - BLOCK
      ?auto_634801 - BLOCK
      ?auto_634802 - BLOCK
      ?auto_634803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634803 ) ( ON-TABLE ?auto_634787 ) ( ON ?auto_634788 ?auto_634787 ) ( ON ?auto_634789 ?auto_634788 ) ( ON ?auto_634790 ?auto_634789 ) ( ON ?auto_634791 ?auto_634790 ) ( not ( = ?auto_634787 ?auto_634788 ) ) ( not ( = ?auto_634787 ?auto_634789 ) ) ( not ( = ?auto_634787 ?auto_634790 ) ) ( not ( = ?auto_634787 ?auto_634791 ) ) ( not ( = ?auto_634787 ?auto_634792 ) ) ( not ( = ?auto_634787 ?auto_634793 ) ) ( not ( = ?auto_634787 ?auto_634794 ) ) ( not ( = ?auto_634787 ?auto_634795 ) ) ( not ( = ?auto_634787 ?auto_634796 ) ) ( not ( = ?auto_634787 ?auto_634797 ) ) ( not ( = ?auto_634787 ?auto_634798 ) ) ( not ( = ?auto_634787 ?auto_634799 ) ) ( not ( = ?auto_634787 ?auto_634800 ) ) ( not ( = ?auto_634787 ?auto_634801 ) ) ( not ( = ?auto_634787 ?auto_634802 ) ) ( not ( = ?auto_634787 ?auto_634803 ) ) ( not ( = ?auto_634788 ?auto_634789 ) ) ( not ( = ?auto_634788 ?auto_634790 ) ) ( not ( = ?auto_634788 ?auto_634791 ) ) ( not ( = ?auto_634788 ?auto_634792 ) ) ( not ( = ?auto_634788 ?auto_634793 ) ) ( not ( = ?auto_634788 ?auto_634794 ) ) ( not ( = ?auto_634788 ?auto_634795 ) ) ( not ( = ?auto_634788 ?auto_634796 ) ) ( not ( = ?auto_634788 ?auto_634797 ) ) ( not ( = ?auto_634788 ?auto_634798 ) ) ( not ( = ?auto_634788 ?auto_634799 ) ) ( not ( = ?auto_634788 ?auto_634800 ) ) ( not ( = ?auto_634788 ?auto_634801 ) ) ( not ( = ?auto_634788 ?auto_634802 ) ) ( not ( = ?auto_634788 ?auto_634803 ) ) ( not ( = ?auto_634789 ?auto_634790 ) ) ( not ( = ?auto_634789 ?auto_634791 ) ) ( not ( = ?auto_634789 ?auto_634792 ) ) ( not ( = ?auto_634789 ?auto_634793 ) ) ( not ( = ?auto_634789 ?auto_634794 ) ) ( not ( = ?auto_634789 ?auto_634795 ) ) ( not ( = ?auto_634789 ?auto_634796 ) ) ( not ( = ?auto_634789 ?auto_634797 ) ) ( not ( = ?auto_634789 ?auto_634798 ) ) ( not ( = ?auto_634789 ?auto_634799 ) ) ( not ( = ?auto_634789 ?auto_634800 ) ) ( not ( = ?auto_634789 ?auto_634801 ) ) ( not ( = ?auto_634789 ?auto_634802 ) ) ( not ( = ?auto_634789 ?auto_634803 ) ) ( not ( = ?auto_634790 ?auto_634791 ) ) ( not ( = ?auto_634790 ?auto_634792 ) ) ( not ( = ?auto_634790 ?auto_634793 ) ) ( not ( = ?auto_634790 ?auto_634794 ) ) ( not ( = ?auto_634790 ?auto_634795 ) ) ( not ( = ?auto_634790 ?auto_634796 ) ) ( not ( = ?auto_634790 ?auto_634797 ) ) ( not ( = ?auto_634790 ?auto_634798 ) ) ( not ( = ?auto_634790 ?auto_634799 ) ) ( not ( = ?auto_634790 ?auto_634800 ) ) ( not ( = ?auto_634790 ?auto_634801 ) ) ( not ( = ?auto_634790 ?auto_634802 ) ) ( not ( = ?auto_634790 ?auto_634803 ) ) ( not ( = ?auto_634791 ?auto_634792 ) ) ( not ( = ?auto_634791 ?auto_634793 ) ) ( not ( = ?auto_634791 ?auto_634794 ) ) ( not ( = ?auto_634791 ?auto_634795 ) ) ( not ( = ?auto_634791 ?auto_634796 ) ) ( not ( = ?auto_634791 ?auto_634797 ) ) ( not ( = ?auto_634791 ?auto_634798 ) ) ( not ( = ?auto_634791 ?auto_634799 ) ) ( not ( = ?auto_634791 ?auto_634800 ) ) ( not ( = ?auto_634791 ?auto_634801 ) ) ( not ( = ?auto_634791 ?auto_634802 ) ) ( not ( = ?auto_634791 ?auto_634803 ) ) ( not ( = ?auto_634792 ?auto_634793 ) ) ( not ( = ?auto_634792 ?auto_634794 ) ) ( not ( = ?auto_634792 ?auto_634795 ) ) ( not ( = ?auto_634792 ?auto_634796 ) ) ( not ( = ?auto_634792 ?auto_634797 ) ) ( not ( = ?auto_634792 ?auto_634798 ) ) ( not ( = ?auto_634792 ?auto_634799 ) ) ( not ( = ?auto_634792 ?auto_634800 ) ) ( not ( = ?auto_634792 ?auto_634801 ) ) ( not ( = ?auto_634792 ?auto_634802 ) ) ( not ( = ?auto_634792 ?auto_634803 ) ) ( not ( = ?auto_634793 ?auto_634794 ) ) ( not ( = ?auto_634793 ?auto_634795 ) ) ( not ( = ?auto_634793 ?auto_634796 ) ) ( not ( = ?auto_634793 ?auto_634797 ) ) ( not ( = ?auto_634793 ?auto_634798 ) ) ( not ( = ?auto_634793 ?auto_634799 ) ) ( not ( = ?auto_634793 ?auto_634800 ) ) ( not ( = ?auto_634793 ?auto_634801 ) ) ( not ( = ?auto_634793 ?auto_634802 ) ) ( not ( = ?auto_634793 ?auto_634803 ) ) ( not ( = ?auto_634794 ?auto_634795 ) ) ( not ( = ?auto_634794 ?auto_634796 ) ) ( not ( = ?auto_634794 ?auto_634797 ) ) ( not ( = ?auto_634794 ?auto_634798 ) ) ( not ( = ?auto_634794 ?auto_634799 ) ) ( not ( = ?auto_634794 ?auto_634800 ) ) ( not ( = ?auto_634794 ?auto_634801 ) ) ( not ( = ?auto_634794 ?auto_634802 ) ) ( not ( = ?auto_634794 ?auto_634803 ) ) ( not ( = ?auto_634795 ?auto_634796 ) ) ( not ( = ?auto_634795 ?auto_634797 ) ) ( not ( = ?auto_634795 ?auto_634798 ) ) ( not ( = ?auto_634795 ?auto_634799 ) ) ( not ( = ?auto_634795 ?auto_634800 ) ) ( not ( = ?auto_634795 ?auto_634801 ) ) ( not ( = ?auto_634795 ?auto_634802 ) ) ( not ( = ?auto_634795 ?auto_634803 ) ) ( not ( = ?auto_634796 ?auto_634797 ) ) ( not ( = ?auto_634796 ?auto_634798 ) ) ( not ( = ?auto_634796 ?auto_634799 ) ) ( not ( = ?auto_634796 ?auto_634800 ) ) ( not ( = ?auto_634796 ?auto_634801 ) ) ( not ( = ?auto_634796 ?auto_634802 ) ) ( not ( = ?auto_634796 ?auto_634803 ) ) ( not ( = ?auto_634797 ?auto_634798 ) ) ( not ( = ?auto_634797 ?auto_634799 ) ) ( not ( = ?auto_634797 ?auto_634800 ) ) ( not ( = ?auto_634797 ?auto_634801 ) ) ( not ( = ?auto_634797 ?auto_634802 ) ) ( not ( = ?auto_634797 ?auto_634803 ) ) ( not ( = ?auto_634798 ?auto_634799 ) ) ( not ( = ?auto_634798 ?auto_634800 ) ) ( not ( = ?auto_634798 ?auto_634801 ) ) ( not ( = ?auto_634798 ?auto_634802 ) ) ( not ( = ?auto_634798 ?auto_634803 ) ) ( not ( = ?auto_634799 ?auto_634800 ) ) ( not ( = ?auto_634799 ?auto_634801 ) ) ( not ( = ?auto_634799 ?auto_634802 ) ) ( not ( = ?auto_634799 ?auto_634803 ) ) ( not ( = ?auto_634800 ?auto_634801 ) ) ( not ( = ?auto_634800 ?auto_634802 ) ) ( not ( = ?auto_634800 ?auto_634803 ) ) ( not ( = ?auto_634801 ?auto_634802 ) ) ( not ( = ?auto_634801 ?auto_634803 ) ) ( not ( = ?auto_634802 ?auto_634803 ) ) ( ON ?auto_634802 ?auto_634803 ) ( ON ?auto_634801 ?auto_634802 ) ( ON ?auto_634800 ?auto_634801 ) ( ON ?auto_634799 ?auto_634800 ) ( ON ?auto_634798 ?auto_634799 ) ( ON ?auto_634797 ?auto_634798 ) ( ON ?auto_634796 ?auto_634797 ) ( ON ?auto_634795 ?auto_634796 ) ( ON ?auto_634794 ?auto_634795 ) ( ON ?auto_634793 ?auto_634794 ) ( CLEAR ?auto_634791 ) ( ON ?auto_634792 ?auto_634793 ) ( CLEAR ?auto_634792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_634787 ?auto_634788 ?auto_634789 ?auto_634790 ?auto_634791 ?auto_634792 )
      ( MAKE-17PILE ?auto_634787 ?auto_634788 ?auto_634789 ?auto_634790 ?auto_634791 ?auto_634792 ?auto_634793 ?auto_634794 ?auto_634795 ?auto_634796 ?auto_634797 ?auto_634798 ?auto_634799 ?auto_634800 ?auto_634801 ?auto_634802 ?auto_634803 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634821 - BLOCK
      ?auto_634822 - BLOCK
      ?auto_634823 - BLOCK
      ?auto_634824 - BLOCK
      ?auto_634825 - BLOCK
      ?auto_634826 - BLOCK
      ?auto_634827 - BLOCK
      ?auto_634828 - BLOCK
      ?auto_634829 - BLOCK
      ?auto_634830 - BLOCK
      ?auto_634831 - BLOCK
      ?auto_634832 - BLOCK
      ?auto_634833 - BLOCK
      ?auto_634834 - BLOCK
      ?auto_634835 - BLOCK
      ?auto_634836 - BLOCK
      ?auto_634837 - BLOCK
    )
    :vars
    (
      ?auto_634838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634837 ?auto_634838 ) ( ON-TABLE ?auto_634821 ) ( ON ?auto_634822 ?auto_634821 ) ( ON ?auto_634823 ?auto_634822 ) ( ON ?auto_634824 ?auto_634823 ) ( not ( = ?auto_634821 ?auto_634822 ) ) ( not ( = ?auto_634821 ?auto_634823 ) ) ( not ( = ?auto_634821 ?auto_634824 ) ) ( not ( = ?auto_634821 ?auto_634825 ) ) ( not ( = ?auto_634821 ?auto_634826 ) ) ( not ( = ?auto_634821 ?auto_634827 ) ) ( not ( = ?auto_634821 ?auto_634828 ) ) ( not ( = ?auto_634821 ?auto_634829 ) ) ( not ( = ?auto_634821 ?auto_634830 ) ) ( not ( = ?auto_634821 ?auto_634831 ) ) ( not ( = ?auto_634821 ?auto_634832 ) ) ( not ( = ?auto_634821 ?auto_634833 ) ) ( not ( = ?auto_634821 ?auto_634834 ) ) ( not ( = ?auto_634821 ?auto_634835 ) ) ( not ( = ?auto_634821 ?auto_634836 ) ) ( not ( = ?auto_634821 ?auto_634837 ) ) ( not ( = ?auto_634821 ?auto_634838 ) ) ( not ( = ?auto_634822 ?auto_634823 ) ) ( not ( = ?auto_634822 ?auto_634824 ) ) ( not ( = ?auto_634822 ?auto_634825 ) ) ( not ( = ?auto_634822 ?auto_634826 ) ) ( not ( = ?auto_634822 ?auto_634827 ) ) ( not ( = ?auto_634822 ?auto_634828 ) ) ( not ( = ?auto_634822 ?auto_634829 ) ) ( not ( = ?auto_634822 ?auto_634830 ) ) ( not ( = ?auto_634822 ?auto_634831 ) ) ( not ( = ?auto_634822 ?auto_634832 ) ) ( not ( = ?auto_634822 ?auto_634833 ) ) ( not ( = ?auto_634822 ?auto_634834 ) ) ( not ( = ?auto_634822 ?auto_634835 ) ) ( not ( = ?auto_634822 ?auto_634836 ) ) ( not ( = ?auto_634822 ?auto_634837 ) ) ( not ( = ?auto_634822 ?auto_634838 ) ) ( not ( = ?auto_634823 ?auto_634824 ) ) ( not ( = ?auto_634823 ?auto_634825 ) ) ( not ( = ?auto_634823 ?auto_634826 ) ) ( not ( = ?auto_634823 ?auto_634827 ) ) ( not ( = ?auto_634823 ?auto_634828 ) ) ( not ( = ?auto_634823 ?auto_634829 ) ) ( not ( = ?auto_634823 ?auto_634830 ) ) ( not ( = ?auto_634823 ?auto_634831 ) ) ( not ( = ?auto_634823 ?auto_634832 ) ) ( not ( = ?auto_634823 ?auto_634833 ) ) ( not ( = ?auto_634823 ?auto_634834 ) ) ( not ( = ?auto_634823 ?auto_634835 ) ) ( not ( = ?auto_634823 ?auto_634836 ) ) ( not ( = ?auto_634823 ?auto_634837 ) ) ( not ( = ?auto_634823 ?auto_634838 ) ) ( not ( = ?auto_634824 ?auto_634825 ) ) ( not ( = ?auto_634824 ?auto_634826 ) ) ( not ( = ?auto_634824 ?auto_634827 ) ) ( not ( = ?auto_634824 ?auto_634828 ) ) ( not ( = ?auto_634824 ?auto_634829 ) ) ( not ( = ?auto_634824 ?auto_634830 ) ) ( not ( = ?auto_634824 ?auto_634831 ) ) ( not ( = ?auto_634824 ?auto_634832 ) ) ( not ( = ?auto_634824 ?auto_634833 ) ) ( not ( = ?auto_634824 ?auto_634834 ) ) ( not ( = ?auto_634824 ?auto_634835 ) ) ( not ( = ?auto_634824 ?auto_634836 ) ) ( not ( = ?auto_634824 ?auto_634837 ) ) ( not ( = ?auto_634824 ?auto_634838 ) ) ( not ( = ?auto_634825 ?auto_634826 ) ) ( not ( = ?auto_634825 ?auto_634827 ) ) ( not ( = ?auto_634825 ?auto_634828 ) ) ( not ( = ?auto_634825 ?auto_634829 ) ) ( not ( = ?auto_634825 ?auto_634830 ) ) ( not ( = ?auto_634825 ?auto_634831 ) ) ( not ( = ?auto_634825 ?auto_634832 ) ) ( not ( = ?auto_634825 ?auto_634833 ) ) ( not ( = ?auto_634825 ?auto_634834 ) ) ( not ( = ?auto_634825 ?auto_634835 ) ) ( not ( = ?auto_634825 ?auto_634836 ) ) ( not ( = ?auto_634825 ?auto_634837 ) ) ( not ( = ?auto_634825 ?auto_634838 ) ) ( not ( = ?auto_634826 ?auto_634827 ) ) ( not ( = ?auto_634826 ?auto_634828 ) ) ( not ( = ?auto_634826 ?auto_634829 ) ) ( not ( = ?auto_634826 ?auto_634830 ) ) ( not ( = ?auto_634826 ?auto_634831 ) ) ( not ( = ?auto_634826 ?auto_634832 ) ) ( not ( = ?auto_634826 ?auto_634833 ) ) ( not ( = ?auto_634826 ?auto_634834 ) ) ( not ( = ?auto_634826 ?auto_634835 ) ) ( not ( = ?auto_634826 ?auto_634836 ) ) ( not ( = ?auto_634826 ?auto_634837 ) ) ( not ( = ?auto_634826 ?auto_634838 ) ) ( not ( = ?auto_634827 ?auto_634828 ) ) ( not ( = ?auto_634827 ?auto_634829 ) ) ( not ( = ?auto_634827 ?auto_634830 ) ) ( not ( = ?auto_634827 ?auto_634831 ) ) ( not ( = ?auto_634827 ?auto_634832 ) ) ( not ( = ?auto_634827 ?auto_634833 ) ) ( not ( = ?auto_634827 ?auto_634834 ) ) ( not ( = ?auto_634827 ?auto_634835 ) ) ( not ( = ?auto_634827 ?auto_634836 ) ) ( not ( = ?auto_634827 ?auto_634837 ) ) ( not ( = ?auto_634827 ?auto_634838 ) ) ( not ( = ?auto_634828 ?auto_634829 ) ) ( not ( = ?auto_634828 ?auto_634830 ) ) ( not ( = ?auto_634828 ?auto_634831 ) ) ( not ( = ?auto_634828 ?auto_634832 ) ) ( not ( = ?auto_634828 ?auto_634833 ) ) ( not ( = ?auto_634828 ?auto_634834 ) ) ( not ( = ?auto_634828 ?auto_634835 ) ) ( not ( = ?auto_634828 ?auto_634836 ) ) ( not ( = ?auto_634828 ?auto_634837 ) ) ( not ( = ?auto_634828 ?auto_634838 ) ) ( not ( = ?auto_634829 ?auto_634830 ) ) ( not ( = ?auto_634829 ?auto_634831 ) ) ( not ( = ?auto_634829 ?auto_634832 ) ) ( not ( = ?auto_634829 ?auto_634833 ) ) ( not ( = ?auto_634829 ?auto_634834 ) ) ( not ( = ?auto_634829 ?auto_634835 ) ) ( not ( = ?auto_634829 ?auto_634836 ) ) ( not ( = ?auto_634829 ?auto_634837 ) ) ( not ( = ?auto_634829 ?auto_634838 ) ) ( not ( = ?auto_634830 ?auto_634831 ) ) ( not ( = ?auto_634830 ?auto_634832 ) ) ( not ( = ?auto_634830 ?auto_634833 ) ) ( not ( = ?auto_634830 ?auto_634834 ) ) ( not ( = ?auto_634830 ?auto_634835 ) ) ( not ( = ?auto_634830 ?auto_634836 ) ) ( not ( = ?auto_634830 ?auto_634837 ) ) ( not ( = ?auto_634830 ?auto_634838 ) ) ( not ( = ?auto_634831 ?auto_634832 ) ) ( not ( = ?auto_634831 ?auto_634833 ) ) ( not ( = ?auto_634831 ?auto_634834 ) ) ( not ( = ?auto_634831 ?auto_634835 ) ) ( not ( = ?auto_634831 ?auto_634836 ) ) ( not ( = ?auto_634831 ?auto_634837 ) ) ( not ( = ?auto_634831 ?auto_634838 ) ) ( not ( = ?auto_634832 ?auto_634833 ) ) ( not ( = ?auto_634832 ?auto_634834 ) ) ( not ( = ?auto_634832 ?auto_634835 ) ) ( not ( = ?auto_634832 ?auto_634836 ) ) ( not ( = ?auto_634832 ?auto_634837 ) ) ( not ( = ?auto_634832 ?auto_634838 ) ) ( not ( = ?auto_634833 ?auto_634834 ) ) ( not ( = ?auto_634833 ?auto_634835 ) ) ( not ( = ?auto_634833 ?auto_634836 ) ) ( not ( = ?auto_634833 ?auto_634837 ) ) ( not ( = ?auto_634833 ?auto_634838 ) ) ( not ( = ?auto_634834 ?auto_634835 ) ) ( not ( = ?auto_634834 ?auto_634836 ) ) ( not ( = ?auto_634834 ?auto_634837 ) ) ( not ( = ?auto_634834 ?auto_634838 ) ) ( not ( = ?auto_634835 ?auto_634836 ) ) ( not ( = ?auto_634835 ?auto_634837 ) ) ( not ( = ?auto_634835 ?auto_634838 ) ) ( not ( = ?auto_634836 ?auto_634837 ) ) ( not ( = ?auto_634836 ?auto_634838 ) ) ( not ( = ?auto_634837 ?auto_634838 ) ) ( ON ?auto_634836 ?auto_634837 ) ( ON ?auto_634835 ?auto_634836 ) ( ON ?auto_634834 ?auto_634835 ) ( ON ?auto_634833 ?auto_634834 ) ( ON ?auto_634832 ?auto_634833 ) ( ON ?auto_634831 ?auto_634832 ) ( ON ?auto_634830 ?auto_634831 ) ( ON ?auto_634829 ?auto_634830 ) ( ON ?auto_634828 ?auto_634829 ) ( ON ?auto_634827 ?auto_634828 ) ( ON ?auto_634826 ?auto_634827 ) ( CLEAR ?auto_634824 ) ( ON ?auto_634825 ?auto_634826 ) ( CLEAR ?auto_634825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_634821 ?auto_634822 ?auto_634823 ?auto_634824 ?auto_634825 )
      ( MAKE-17PILE ?auto_634821 ?auto_634822 ?auto_634823 ?auto_634824 ?auto_634825 ?auto_634826 ?auto_634827 ?auto_634828 ?auto_634829 ?auto_634830 ?auto_634831 ?auto_634832 ?auto_634833 ?auto_634834 ?auto_634835 ?auto_634836 ?auto_634837 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634856 - BLOCK
      ?auto_634857 - BLOCK
      ?auto_634858 - BLOCK
      ?auto_634859 - BLOCK
      ?auto_634860 - BLOCK
      ?auto_634861 - BLOCK
      ?auto_634862 - BLOCK
      ?auto_634863 - BLOCK
      ?auto_634864 - BLOCK
      ?auto_634865 - BLOCK
      ?auto_634866 - BLOCK
      ?auto_634867 - BLOCK
      ?auto_634868 - BLOCK
      ?auto_634869 - BLOCK
      ?auto_634870 - BLOCK
      ?auto_634871 - BLOCK
      ?auto_634872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634872 ) ( ON-TABLE ?auto_634856 ) ( ON ?auto_634857 ?auto_634856 ) ( ON ?auto_634858 ?auto_634857 ) ( ON ?auto_634859 ?auto_634858 ) ( not ( = ?auto_634856 ?auto_634857 ) ) ( not ( = ?auto_634856 ?auto_634858 ) ) ( not ( = ?auto_634856 ?auto_634859 ) ) ( not ( = ?auto_634856 ?auto_634860 ) ) ( not ( = ?auto_634856 ?auto_634861 ) ) ( not ( = ?auto_634856 ?auto_634862 ) ) ( not ( = ?auto_634856 ?auto_634863 ) ) ( not ( = ?auto_634856 ?auto_634864 ) ) ( not ( = ?auto_634856 ?auto_634865 ) ) ( not ( = ?auto_634856 ?auto_634866 ) ) ( not ( = ?auto_634856 ?auto_634867 ) ) ( not ( = ?auto_634856 ?auto_634868 ) ) ( not ( = ?auto_634856 ?auto_634869 ) ) ( not ( = ?auto_634856 ?auto_634870 ) ) ( not ( = ?auto_634856 ?auto_634871 ) ) ( not ( = ?auto_634856 ?auto_634872 ) ) ( not ( = ?auto_634857 ?auto_634858 ) ) ( not ( = ?auto_634857 ?auto_634859 ) ) ( not ( = ?auto_634857 ?auto_634860 ) ) ( not ( = ?auto_634857 ?auto_634861 ) ) ( not ( = ?auto_634857 ?auto_634862 ) ) ( not ( = ?auto_634857 ?auto_634863 ) ) ( not ( = ?auto_634857 ?auto_634864 ) ) ( not ( = ?auto_634857 ?auto_634865 ) ) ( not ( = ?auto_634857 ?auto_634866 ) ) ( not ( = ?auto_634857 ?auto_634867 ) ) ( not ( = ?auto_634857 ?auto_634868 ) ) ( not ( = ?auto_634857 ?auto_634869 ) ) ( not ( = ?auto_634857 ?auto_634870 ) ) ( not ( = ?auto_634857 ?auto_634871 ) ) ( not ( = ?auto_634857 ?auto_634872 ) ) ( not ( = ?auto_634858 ?auto_634859 ) ) ( not ( = ?auto_634858 ?auto_634860 ) ) ( not ( = ?auto_634858 ?auto_634861 ) ) ( not ( = ?auto_634858 ?auto_634862 ) ) ( not ( = ?auto_634858 ?auto_634863 ) ) ( not ( = ?auto_634858 ?auto_634864 ) ) ( not ( = ?auto_634858 ?auto_634865 ) ) ( not ( = ?auto_634858 ?auto_634866 ) ) ( not ( = ?auto_634858 ?auto_634867 ) ) ( not ( = ?auto_634858 ?auto_634868 ) ) ( not ( = ?auto_634858 ?auto_634869 ) ) ( not ( = ?auto_634858 ?auto_634870 ) ) ( not ( = ?auto_634858 ?auto_634871 ) ) ( not ( = ?auto_634858 ?auto_634872 ) ) ( not ( = ?auto_634859 ?auto_634860 ) ) ( not ( = ?auto_634859 ?auto_634861 ) ) ( not ( = ?auto_634859 ?auto_634862 ) ) ( not ( = ?auto_634859 ?auto_634863 ) ) ( not ( = ?auto_634859 ?auto_634864 ) ) ( not ( = ?auto_634859 ?auto_634865 ) ) ( not ( = ?auto_634859 ?auto_634866 ) ) ( not ( = ?auto_634859 ?auto_634867 ) ) ( not ( = ?auto_634859 ?auto_634868 ) ) ( not ( = ?auto_634859 ?auto_634869 ) ) ( not ( = ?auto_634859 ?auto_634870 ) ) ( not ( = ?auto_634859 ?auto_634871 ) ) ( not ( = ?auto_634859 ?auto_634872 ) ) ( not ( = ?auto_634860 ?auto_634861 ) ) ( not ( = ?auto_634860 ?auto_634862 ) ) ( not ( = ?auto_634860 ?auto_634863 ) ) ( not ( = ?auto_634860 ?auto_634864 ) ) ( not ( = ?auto_634860 ?auto_634865 ) ) ( not ( = ?auto_634860 ?auto_634866 ) ) ( not ( = ?auto_634860 ?auto_634867 ) ) ( not ( = ?auto_634860 ?auto_634868 ) ) ( not ( = ?auto_634860 ?auto_634869 ) ) ( not ( = ?auto_634860 ?auto_634870 ) ) ( not ( = ?auto_634860 ?auto_634871 ) ) ( not ( = ?auto_634860 ?auto_634872 ) ) ( not ( = ?auto_634861 ?auto_634862 ) ) ( not ( = ?auto_634861 ?auto_634863 ) ) ( not ( = ?auto_634861 ?auto_634864 ) ) ( not ( = ?auto_634861 ?auto_634865 ) ) ( not ( = ?auto_634861 ?auto_634866 ) ) ( not ( = ?auto_634861 ?auto_634867 ) ) ( not ( = ?auto_634861 ?auto_634868 ) ) ( not ( = ?auto_634861 ?auto_634869 ) ) ( not ( = ?auto_634861 ?auto_634870 ) ) ( not ( = ?auto_634861 ?auto_634871 ) ) ( not ( = ?auto_634861 ?auto_634872 ) ) ( not ( = ?auto_634862 ?auto_634863 ) ) ( not ( = ?auto_634862 ?auto_634864 ) ) ( not ( = ?auto_634862 ?auto_634865 ) ) ( not ( = ?auto_634862 ?auto_634866 ) ) ( not ( = ?auto_634862 ?auto_634867 ) ) ( not ( = ?auto_634862 ?auto_634868 ) ) ( not ( = ?auto_634862 ?auto_634869 ) ) ( not ( = ?auto_634862 ?auto_634870 ) ) ( not ( = ?auto_634862 ?auto_634871 ) ) ( not ( = ?auto_634862 ?auto_634872 ) ) ( not ( = ?auto_634863 ?auto_634864 ) ) ( not ( = ?auto_634863 ?auto_634865 ) ) ( not ( = ?auto_634863 ?auto_634866 ) ) ( not ( = ?auto_634863 ?auto_634867 ) ) ( not ( = ?auto_634863 ?auto_634868 ) ) ( not ( = ?auto_634863 ?auto_634869 ) ) ( not ( = ?auto_634863 ?auto_634870 ) ) ( not ( = ?auto_634863 ?auto_634871 ) ) ( not ( = ?auto_634863 ?auto_634872 ) ) ( not ( = ?auto_634864 ?auto_634865 ) ) ( not ( = ?auto_634864 ?auto_634866 ) ) ( not ( = ?auto_634864 ?auto_634867 ) ) ( not ( = ?auto_634864 ?auto_634868 ) ) ( not ( = ?auto_634864 ?auto_634869 ) ) ( not ( = ?auto_634864 ?auto_634870 ) ) ( not ( = ?auto_634864 ?auto_634871 ) ) ( not ( = ?auto_634864 ?auto_634872 ) ) ( not ( = ?auto_634865 ?auto_634866 ) ) ( not ( = ?auto_634865 ?auto_634867 ) ) ( not ( = ?auto_634865 ?auto_634868 ) ) ( not ( = ?auto_634865 ?auto_634869 ) ) ( not ( = ?auto_634865 ?auto_634870 ) ) ( not ( = ?auto_634865 ?auto_634871 ) ) ( not ( = ?auto_634865 ?auto_634872 ) ) ( not ( = ?auto_634866 ?auto_634867 ) ) ( not ( = ?auto_634866 ?auto_634868 ) ) ( not ( = ?auto_634866 ?auto_634869 ) ) ( not ( = ?auto_634866 ?auto_634870 ) ) ( not ( = ?auto_634866 ?auto_634871 ) ) ( not ( = ?auto_634866 ?auto_634872 ) ) ( not ( = ?auto_634867 ?auto_634868 ) ) ( not ( = ?auto_634867 ?auto_634869 ) ) ( not ( = ?auto_634867 ?auto_634870 ) ) ( not ( = ?auto_634867 ?auto_634871 ) ) ( not ( = ?auto_634867 ?auto_634872 ) ) ( not ( = ?auto_634868 ?auto_634869 ) ) ( not ( = ?auto_634868 ?auto_634870 ) ) ( not ( = ?auto_634868 ?auto_634871 ) ) ( not ( = ?auto_634868 ?auto_634872 ) ) ( not ( = ?auto_634869 ?auto_634870 ) ) ( not ( = ?auto_634869 ?auto_634871 ) ) ( not ( = ?auto_634869 ?auto_634872 ) ) ( not ( = ?auto_634870 ?auto_634871 ) ) ( not ( = ?auto_634870 ?auto_634872 ) ) ( not ( = ?auto_634871 ?auto_634872 ) ) ( ON ?auto_634871 ?auto_634872 ) ( ON ?auto_634870 ?auto_634871 ) ( ON ?auto_634869 ?auto_634870 ) ( ON ?auto_634868 ?auto_634869 ) ( ON ?auto_634867 ?auto_634868 ) ( ON ?auto_634866 ?auto_634867 ) ( ON ?auto_634865 ?auto_634866 ) ( ON ?auto_634864 ?auto_634865 ) ( ON ?auto_634863 ?auto_634864 ) ( ON ?auto_634862 ?auto_634863 ) ( ON ?auto_634861 ?auto_634862 ) ( CLEAR ?auto_634859 ) ( ON ?auto_634860 ?auto_634861 ) ( CLEAR ?auto_634860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_634856 ?auto_634857 ?auto_634858 ?auto_634859 ?auto_634860 )
      ( MAKE-17PILE ?auto_634856 ?auto_634857 ?auto_634858 ?auto_634859 ?auto_634860 ?auto_634861 ?auto_634862 ?auto_634863 ?auto_634864 ?auto_634865 ?auto_634866 ?auto_634867 ?auto_634868 ?auto_634869 ?auto_634870 ?auto_634871 ?auto_634872 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634890 - BLOCK
      ?auto_634891 - BLOCK
      ?auto_634892 - BLOCK
      ?auto_634893 - BLOCK
      ?auto_634894 - BLOCK
      ?auto_634895 - BLOCK
      ?auto_634896 - BLOCK
      ?auto_634897 - BLOCK
      ?auto_634898 - BLOCK
      ?auto_634899 - BLOCK
      ?auto_634900 - BLOCK
      ?auto_634901 - BLOCK
      ?auto_634902 - BLOCK
      ?auto_634903 - BLOCK
      ?auto_634904 - BLOCK
      ?auto_634905 - BLOCK
      ?auto_634906 - BLOCK
    )
    :vars
    (
      ?auto_634907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634906 ?auto_634907 ) ( ON-TABLE ?auto_634890 ) ( ON ?auto_634891 ?auto_634890 ) ( ON ?auto_634892 ?auto_634891 ) ( not ( = ?auto_634890 ?auto_634891 ) ) ( not ( = ?auto_634890 ?auto_634892 ) ) ( not ( = ?auto_634890 ?auto_634893 ) ) ( not ( = ?auto_634890 ?auto_634894 ) ) ( not ( = ?auto_634890 ?auto_634895 ) ) ( not ( = ?auto_634890 ?auto_634896 ) ) ( not ( = ?auto_634890 ?auto_634897 ) ) ( not ( = ?auto_634890 ?auto_634898 ) ) ( not ( = ?auto_634890 ?auto_634899 ) ) ( not ( = ?auto_634890 ?auto_634900 ) ) ( not ( = ?auto_634890 ?auto_634901 ) ) ( not ( = ?auto_634890 ?auto_634902 ) ) ( not ( = ?auto_634890 ?auto_634903 ) ) ( not ( = ?auto_634890 ?auto_634904 ) ) ( not ( = ?auto_634890 ?auto_634905 ) ) ( not ( = ?auto_634890 ?auto_634906 ) ) ( not ( = ?auto_634890 ?auto_634907 ) ) ( not ( = ?auto_634891 ?auto_634892 ) ) ( not ( = ?auto_634891 ?auto_634893 ) ) ( not ( = ?auto_634891 ?auto_634894 ) ) ( not ( = ?auto_634891 ?auto_634895 ) ) ( not ( = ?auto_634891 ?auto_634896 ) ) ( not ( = ?auto_634891 ?auto_634897 ) ) ( not ( = ?auto_634891 ?auto_634898 ) ) ( not ( = ?auto_634891 ?auto_634899 ) ) ( not ( = ?auto_634891 ?auto_634900 ) ) ( not ( = ?auto_634891 ?auto_634901 ) ) ( not ( = ?auto_634891 ?auto_634902 ) ) ( not ( = ?auto_634891 ?auto_634903 ) ) ( not ( = ?auto_634891 ?auto_634904 ) ) ( not ( = ?auto_634891 ?auto_634905 ) ) ( not ( = ?auto_634891 ?auto_634906 ) ) ( not ( = ?auto_634891 ?auto_634907 ) ) ( not ( = ?auto_634892 ?auto_634893 ) ) ( not ( = ?auto_634892 ?auto_634894 ) ) ( not ( = ?auto_634892 ?auto_634895 ) ) ( not ( = ?auto_634892 ?auto_634896 ) ) ( not ( = ?auto_634892 ?auto_634897 ) ) ( not ( = ?auto_634892 ?auto_634898 ) ) ( not ( = ?auto_634892 ?auto_634899 ) ) ( not ( = ?auto_634892 ?auto_634900 ) ) ( not ( = ?auto_634892 ?auto_634901 ) ) ( not ( = ?auto_634892 ?auto_634902 ) ) ( not ( = ?auto_634892 ?auto_634903 ) ) ( not ( = ?auto_634892 ?auto_634904 ) ) ( not ( = ?auto_634892 ?auto_634905 ) ) ( not ( = ?auto_634892 ?auto_634906 ) ) ( not ( = ?auto_634892 ?auto_634907 ) ) ( not ( = ?auto_634893 ?auto_634894 ) ) ( not ( = ?auto_634893 ?auto_634895 ) ) ( not ( = ?auto_634893 ?auto_634896 ) ) ( not ( = ?auto_634893 ?auto_634897 ) ) ( not ( = ?auto_634893 ?auto_634898 ) ) ( not ( = ?auto_634893 ?auto_634899 ) ) ( not ( = ?auto_634893 ?auto_634900 ) ) ( not ( = ?auto_634893 ?auto_634901 ) ) ( not ( = ?auto_634893 ?auto_634902 ) ) ( not ( = ?auto_634893 ?auto_634903 ) ) ( not ( = ?auto_634893 ?auto_634904 ) ) ( not ( = ?auto_634893 ?auto_634905 ) ) ( not ( = ?auto_634893 ?auto_634906 ) ) ( not ( = ?auto_634893 ?auto_634907 ) ) ( not ( = ?auto_634894 ?auto_634895 ) ) ( not ( = ?auto_634894 ?auto_634896 ) ) ( not ( = ?auto_634894 ?auto_634897 ) ) ( not ( = ?auto_634894 ?auto_634898 ) ) ( not ( = ?auto_634894 ?auto_634899 ) ) ( not ( = ?auto_634894 ?auto_634900 ) ) ( not ( = ?auto_634894 ?auto_634901 ) ) ( not ( = ?auto_634894 ?auto_634902 ) ) ( not ( = ?auto_634894 ?auto_634903 ) ) ( not ( = ?auto_634894 ?auto_634904 ) ) ( not ( = ?auto_634894 ?auto_634905 ) ) ( not ( = ?auto_634894 ?auto_634906 ) ) ( not ( = ?auto_634894 ?auto_634907 ) ) ( not ( = ?auto_634895 ?auto_634896 ) ) ( not ( = ?auto_634895 ?auto_634897 ) ) ( not ( = ?auto_634895 ?auto_634898 ) ) ( not ( = ?auto_634895 ?auto_634899 ) ) ( not ( = ?auto_634895 ?auto_634900 ) ) ( not ( = ?auto_634895 ?auto_634901 ) ) ( not ( = ?auto_634895 ?auto_634902 ) ) ( not ( = ?auto_634895 ?auto_634903 ) ) ( not ( = ?auto_634895 ?auto_634904 ) ) ( not ( = ?auto_634895 ?auto_634905 ) ) ( not ( = ?auto_634895 ?auto_634906 ) ) ( not ( = ?auto_634895 ?auto_634907 ) ) ( not ( = ?auto_634896 ?auto_634897 ) ) ( not ( = ?auto_634896 ?auto_634898 ) ) ( not ( = ?auto_634896 ?auto_634899 ) ) ( not ( = ?auto_634896 ?auto_634900 ) ) ( not ( = ?auto_634896 ?auto_634901 ) ) ( not ( = ?auto_634896 ?auto_634902 ) ) ( not ( = ?auto_634896 ?auto_634903 ) ) ( not ( = ?auto_634896 ?auto_634904 ) ) ( not ( = ?auto_634896 ?auto_634905 ) ) ( not ( = ?auto_634896 ?auto_634906 ) ) ( not ( = ?auto_634896 ?auto_634907 ) ) ( not ( = ?auto_634897 ?auto_634898 ) ) ( not ( = ?auto_634897 ?auto_634899 ) ) ( not ( = ?auto_634897 ?auto_634900 ) ) ( not ( = ?auto_634897 ?auto_634901 ) ) ( not ( = ?auto_634897 ?auto_634902 ) ) ( not ( = ?auto_634897 ?auto_634903 ) ) ( not ( = ?auto_634897 ?auto_634904 ) ) ( not ( = ?auto_634897 ?auto_634905 ) ) ( not ( = ?auto_634897 ?auto_634906 ) ) ( not ( = ?auto_634897 ?auto_634907 ) ) ( not ( = ?auto_634898 ?auto_634899 ) ) ( not ( = ?auto_634898 ?auto_634900 ) ) ( not ( = ?auto_634898 ?auto_634901 ) ) ( not ( = ?auto_634898 ?auto_634902 ) ) ( not ( = ?auto_634898 ?auto_634903 ) ) ( not ( = ?auto_634898 ?auto_634904 ) ) ( not ( = ?auto_634898 ?auto_634905 ) ) ( not ( = ?auto_634898 ?auto_634906 ) ) ( not ( = ?auto_634898 ?auto_634907 ) ) ( not ( = ?auto_634899 ?auto_634900 ) ) ( not ( = ?auto_634899 ?auto_634901 ) ) ( not ( = ?auto_634899 ?auto_634902 ) ) ( not ( = ?auto_634899 ?auto_634903 ) ) ( not ( = ?auto_634899 ?auto_634904 ) ) ( not ( = ?auto_634899 ?auto_634905 ) ) ( not ( = ?auto_634899 ?auto_634906 ) ) ( not ( = ?auto_634899 ?auto_634907 ) ) ( not ( = ?auto_634900 ?auto_634901 ) ) ( not ( = ?auto_634900 ?auto_634902 ) ) ( not ( = ?auto_634900 ?auto_634903 ) ) ( not ( = ?auto_634900 ?auto_634904 ) ) ( not ( = ?auto_634900 ?auto_634905 ) ) ( not ( = ?auto_634900 ?auto_634906 ) ) ( not ( = ?auto_634900 ?auto_634907 ) ) ( not ( = ?auto_634901 ?auto_634902 ) ) ( not ( = ?auto_634901 ?auto_634903 ) ) ( not ( = ?auto_634901 ?auto_634904 ) ) ( not ( = ?auto_634901 ?auto_634905 ) ) ( not ( = ?auto_634901 ?auto_634906 ) ) ( not ( = ?auto_634901 ?auto_634907 ) ) ( not ( = ?auto_634902 ?auto_634903 ) ) ( not ( = ?auto_634902 ?auto_634904 ) ) ( not ( = ?auto_634902 ?auto_634905 ) ) ( not ( = ?auto_634902 ?auto_634906 ) ) ( not ( = ?auto_634902 ?auto_634907 ) ) ( not ( = ?auto_634903 ?auto_634904 ) ) ( not ( = ?auto_634903 ?auto_634905 ) ) ( not ( = ?auto_634903 ?auto_634906 ) ) ( not ( = ?auto_634903 ?auto_634907 ) ) ( not ( = ?auto_634904 ?auto_634905 ) ) ( not ( = ?auto_634904 ?auto_634906 ) ) ( not ( = ?auto_634904 ?auto_634907 ) ) ( not ( = ?auto_634905 ?auto_634906 ) ) ( not ( = ?auto_634905 ?auto_634907 ) ) ( not ( = ?auto_634906 ?auto_634907 ) ) ( ON ?auto_634905 ?auto_634906 ) ( ON ?auto_634904 ?auto_634905 ) ( ON ?auto_634903 ?auto_634904 ) ( ON ?auto_634902 ?auto_634903 ) ( ON ?auto_634901 ?auto_634902 ) ( ON ?auto_634900 ?auto_634901 ) ( ON ?auto_634899 ?auto_634900 ) ( ON ?auto_634898 ?auto_634899 ) ( ON ?auto_634897 ?auto_634898 ) ( ON ?auto_634896 ?auto_634897 ) ( ON ?auto_634895 ?auto_634896 ) ( ON ?auto_634894 ?auto_634895 ) ( CLEAR ?auto_634892 ) ( ON ?auto_634893 ?auto_634894 ) ( CLEAR ?auto_634893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_634890 ?auto_634891 ?auto_634892 ?auto_634893 )
      ( MAKE-17PILE ?auto_634890 ?auto_634891 ?auto_634892 ?auto_634893 ?auto_634894 ?auto_634895 ?auto_634896 ?auto_634897 ?auto_634898 ?auto_634899 ?auto_634900 ?auto_634901 ?auto_634902 ?auto_634903 ?auto_634904 ?auto_634905 ?auto_634906 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634925 - BLOCK
      ?auto_634926 - BLOCK
      ?auto_634927 - BLOCK
      ?auto_634928 - BLOCK
      ?auto_634929 - BLOCK
      ?auto_634930 - BLOCK
      ?auto_634931 - BLOCK
      ?auto_634932 - BLOCK
      ?auto_634933 - BLOCK
      ?auto_634934 - BLOCK
      ?auto_634935 - BLOCK
      ?auto_634936 - BLOCK
      ?auto_634937 - BLOCK
      ?auto_634938 - BLOCK
      ?auto_634939 - BLOCK
      ?auto_634940 - BLOCK
      ?auto_634941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_634941 ) ( ON-TABLE ?auto_634925 ) ( ON ?auto_634926 ?auto_634925 ) ( ON ?auto_634927 ?auto_634926 ) ( not ( = ?auto_634925 ?auto_634926 ) ) ( not ( = ?auto_634925 ?auto_634927 ) ) ( not ( = ?auto_634925 ?auto_634928 ) ) ( not ( = ?auto_634925 ?auto_634929 ) ) ( not ( = ?auto_634925 ?auto_634930 ) ) ( not ( = ?auto_634925 ?auto_634931 ) ) ( not ( = ?auto_634925 ?auto_634932 ) ) ( not ( = ?auto_634925 ?auto_634933 ) ) ( not ( = ?auto_634925 ?auto_634934 ) ) ( not ( = ?auto_634925 ?auto_634935 ) ) ( not ( = ?auto_634925 ?auto_634936 ) ) ( not ( = ?auto_634925 ?auto_634937 ) ) ( not ( = ?auto_634925 ?auto_634938 ) ) ( not ( = ?auto_634925 ?auto_634939 ) ) ( not ( = ?auto_634925 ?auto_634940 ) ) ( not ( = ?auto_634925 ?auto_634941 ) ) ( not ( = ?auto_634926 ?auto_634927 ) ) ( not ( = ?auto_634926 ?auto_634928 ) ) ( not ( = ?auto_634926 ?auto_634929 ) ) ( not ( = ?auto_634926 ?auto_634930 ) ) ( not ( = ?auto_634926 ?auto_634931 ) ) ( not ( = ?auto_634926 ?auto_634932 ) ) ( not ( = ?auto_634926 ?auto_634933 ) ) ( not ( = ?auto_634926 ?auto_634934 ) ) ( not ( = ?auto_634926 ?auto_634935 ) ) ( not ( = ?auto_634926 ?auto_634936 ) ) ( not ( = ?auto_634926 ?auto_634937 ) ) ( not ( = ?auto_634926 ?auto_634938 ) ) ( not ( = ?auto_634926 ?auto_634939 ) ) ( not ( = ?auto_634926 ?auto_634940 ) ) ( not ( = ?auto_634926 ?auto_634941 ) ) ( not ( = ?auto_634927 ?auto_634928 ) ) ( not ( = ?auto_634927 ?auto_634929 ) ) ( not ( = ?auto_634927 ?auto_634930 ) ) ( not ( = ?auto_634927 ?auto_634931 ) ) ( not ( = ?auto_634927 ?auto_634932 ) ) ( not ( = ?auto_634927 ?auto_634933 ) ) ( not ( = ?auto_634927 ?auto_634934 ) ) ( not ( = ?auto_634927 ?auto_634935 ) ) ( not ( = ?auto_634927 ?auto_634936 ) ) ( not ( = ?auto_634927 ?auto_634937 ) ) ( not ( = ?auto_634927 ?auto_634938 ) ) ( not ( = ?auto_634927 ?auto_634939 ) ) ( not ( = ?auto_634927 ?auto_634940 ) ) ( not ( = ?auto_634927 ?auto_634941 ) ) ( not ( = ?auto_634928 ?auto_634929 ) ) ( not ( = ?auto_634928 ?auto_634930 ) ) ( not ( = ?auto_634928 ?auto_634931 ) ) ( not ( = ?auto_634928 ?auto_634932 ) ) ( not ( = ?auto_634928 ?auto_634933 ) ) ( not ( = ?auto_634928 ?auto_634934 ) ) ( not ( = ?auto_634928 ?auto_634935 ) ) ( not ( = ?auto_634928 ?auto_634936 ) ) ( not ( = ?auto_634928 ?auto_634937 ) ) ( not ( = ?auto_634928 ?auto_634938 ) ) ( not ( = ?auto_634928 ?auto_634939 ) ) ( not ( = ?auto_634928 ?auto_634940 ) ) ( not ( = ?auto_634928 ?auto_634941 ) ) ( not ( = ?auto_634929 ?auto_634930 ) ) ( not ( = ?auto_634929 ?auto_634931 ) ) ( not ( = ?auto_634929 ?auto_634932 ) ) ( not ( = ?auto_634929 ?auto_634933 ) ) ( not ( = ?auto_634929 ?auto_634934 ) ) ( not ( = ?auto_634929 ?auto_634935 ) ) ( not ( = ?auto_634929 ?auto_634936 ) ) ( not ( = ?auto_634929 ?auto_634937 ) ) ( not ( = ?auto_634929 ?auto_634938 ) ) ( not ( = ?auto_634929 ?auto_634939 ) ) ( not ( = ?auto_634929 ?auto_634940 ) ) ( not ( = ?auto_634929 ?auto_634941 ) ) ( not ( = ?auto_634930 ?auto_634931 ) ) ( not ( = ?auto_634930 ?auto_634932 ) ) ( not ( = ?auto_634930 ?auto_634933 ) ) ( not ( = ?auto_634930 ?auto_634934 ) ) ( not ( = ?auto_634930 ?auto_634935 ) ) ( not ( = ?auto_634930 ?auto_634936 ) ) ( not ( = ?auto_634930 ?auto_634937 ) ) ( not ( = ?auto_634930 ?auto_634938 ) ) ( not ( = ?auto_634930 ?auto_634939 ) ) ( not ( = ?auto_634930 ?auto_634940 ) ) ( not ( = ?auto_634930 ?auto_634941 ) ) ( not ( = ?auto_634931 ?auto_634932 ) ) ( not ( = ?auto_634931 ?auto_634933 ) ) ( not ( = ?auto_634931 ?auto_634934 ) ) ( not ( = ?auto_634931 ?auto_634935 ) ) ( not ( = ?auto_634931 ?auto_634936 ) ) ( not ( = ?auto_634931 ?auto_634937 ) ) ( not ( = ?auto_634931 ?auto_634938 ) ) ( not ( = ?auto_634931 ?auto_634939 ) ) ( not ( = ?auto_634931 ?auto_634940 ) ) ( not ( = ?auto_634931 ?auto_634941 ) ) ( not ( = ?auto_634932 ?auto_634933 ) ) ( not ( = ?auto_634932 ?auto_634934 ) ) ( not ( = ?auto_634932 ?auto_634935 ) ) ( not ( = ?auto_634932 ?auto_634936 ) ) ( not ( = ?auto_634932 ?auto_634937 ) ) ( not ( = ?auto_634932 ?auto_634938 ) ) ( not ( = ?auto_634932 ?auto_634939 ) ) ( not ( = ?auto_634932 ?auto_634940 ) ) ( not ( = ?auto_634932 ?auto_634941 ) ) ( not ( = ?auto_634933 ?auto_634934 ) ) ( not ( = ?auto_634933 ?auto_634935 ) ) ( not ( = ?auto_634933 ?auto_634936 ) ) ( not ( = ?auto_634933 ?auto_634937 ) ) ( not ( = ?auto_634933 ?auto_634938 ) ) ( not ( = ?auto_634933 ?auto_634939 ) ) ( not ( = ?auto_634933 ?auto_634940 ) ) ( not ( = ?auto_634933 ?auto_634941 ) ) ( not ( = ?auto_634934 ?auto_634935 ) ) ( not ( = ?auto_634934 ?auto_634936 ) ) ( not ( = ?auto_634934 ?auto_634937 ) ) ( not ( = ?auto_634934 ?auto_634938 ) ) ( not ( = ?auto_634934 ?auto_634939 ) ) ( not ( = ?auto_634934 ?auto_634940 ) ) ( not ( = ?auto_634934 ?auto_634941 ) ) ( not ( = ?auto_634935 ?auto_634936 ) ) ( not ( = ?auto_634935 ?auto_634937 ) ) ( not ( = ?auto_634935 ?auto_634938 ) ) ( not ( = ?auto_634935 ?auto_634939 ) ) ( not ( = ?auto_634935 ?auto_634940 ) ) ( not ( = ?auto_634935 ?auto_634941 ) ) ( not ( = ?auto_634936 ?auto_634937 ) ) ( not ( = ?auto_634936 ?auto_634938 ) ) ( not ( = ?auto_634936 ?auto_634939 ) ) ( not ( = ?auto_634936 ?auto_634940 ) ) ( not ( = ?auto_634936 ?auto_634941 ) ) ( not ( = ?auto_634937 ?auto_634938 ) ) ( not ( = ?auto_634937 ?auto_634939 ) ) ( not ( = ?auto_634937 ?auto_634940 ) ) ( not ( = ?auto_634937 ?auto_634941 ) ) ( not ( = ?auto_634938 ?auto_634939 ) ) ( not ( = ?auto_634938 ?auto_634940 ) ) ( not ( = ?auto_634938 ?auto_634941 ) ) ( not ( = ?auto_634939 ?auto_634940 ) ) ( not ( = ?auto_634939 ?auto_634941 ) ) ( not ( = ?auto_634940 ?auto_634941 ) ) ( ON ?auto_634940 ?auto_634941 ) ( ON ?auto_634939 ?auto_634940 ) ( ON ?auto_634938 ?auto_634939 ) ( ON ?auto_634937 ?auto_634938 ) ( ON ?auto_634936 ?auto_634937 ) ( ON ?auto_634935 ?auto_634936 ) ( ON ?auto_634934 ?auto_634935 ) ( ON ?auto_634933 ?auto_634934 ) ( ON ?auto_634932 ?auto_634933 ) ( ON ?auto_634931 ?auto_634932 ) ( ON ?auto_634930 ?auto_634931 ) ( ON ?auto_634929 ?auto_634930 ) ( CLEAR ?auto_634927 ) ( ON ?auto_634928 ?auto_634929 ) ( CLEAR ?auto_634928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_634925 ?auto_634926 ?auto_634927 ?auto_634928 )
      ( MAKE-17PILE ?auto_634925 ?auto_634926 ?auto_634927 ?auto_634928 ?auto_634929 ?auto_634930 ?auto_634931 ?auto_634932 ?auto_634933 ?auto_634934 ?auto_634935 ?auto_634936 ?auto_634937 ?auto_634938 ?auto_634939 ?auto_634940 ?auto_634941 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634959 - BLOCK
      ?auto_634960 - BLOCK
      ?auto_634961 - BLOCK
      ?auto_634962 - BLOCK
      ?auto_634963 - BLOCK
      ?auto_634964 - BLOCK
      ?auto_634965 - BLOCK
      ?auto_634966 - BLOCK
      ?auto_634967 - BLOCK
      ?auto_634968 - BLOCK
      ?auto_634969 - BLOCK
      ?auto_634970 - BLOCK
      ?auto_634971 - BLOCK
      ?auto_634972 - BLOCK
      ?auto_634973 - BLOCK
      ?auto_634974 - BLOCK
      ?auto_634975 - BLOCK
    )
    :vars
    (
      ?auto_634976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_634975 ?auto_634976 ) ( ON-TABLE ?auto_634959 ) ( ON ?auto_634960 ?auto_634959 ) ( not ( = ?auto_634959 ?auto_634960 ) ) ( not ( = ?auto_634959 ?auto_634961 ) ) ( not ( = ?auto_634959 ?auto_634962 ) ) ( not ( = ?auto_634959 ?auto_634963 ) ) ( not ( = ?auto_634959 ?auto_634964 ) ) ( not ( = ?auto_634959 ?auto_634965 ) ) ( not ( = ?auto_634959 ?auto_634966 ) ) ( not ( = ?auto_634959 ?auto_634967 ) ) ( not ( = ?auto_634959 ?auto_634968 ) ) ( not ( = ?auto_634959 ?auto_634969 ) ) ( not ( = ?auto_634959 ?auto_634970 ) ) ( not ( = ?auto_634959 ?auto_634971 ) ) ( not ( = ?auto_634959 ?auto_634972 ) ) ( not ( = ?auto_634959 ?auto_634973 ) ) ( not ( = ?auto_634959 ?auto_634974 ) ) ( not ( = ?auto_634959 ?auto_634975 ) ) ( not ( = ?auto_634959 ?auto_634976 ) ) ( not ( = ?auto_634960 ?auto_634961 ) ) ( not ( = ?auto_634960 ?auto_634962 ) ) ( not ( = ?auto_634960 ?auto_634963 ) ) ( not ( = ?auto_634960 ?auto_634964 ) ) ( not ( = ?auto_634960 ?auto_634965 ) ) ( not ( = ?auto_634960 ?auto_634966 ) ) ( not ( = ?auto_634960 ?auto_634967 ) ) ( not ( = ?auto_634960 ?auto_634968 ) ) ( not ( = ?auto_634960 ?auto_634969 ) ) ( not ( = ?auto_634960 ?auto_634970 ) ) ( not ( = ?auto_634960 ?auto_634971 ) ) ( not ( = ?auto_634960 ?auto_634972 ) ) ( not ( = ?auto_634960 ?auto_634973 ) ) ( not ( = ?auto_634960 ?auto_634974 ) ) ( not ( = ?auto_634960 ?auto_634975 ) ) ( not ( = ?auto_634960 ?auto_634976 ) ) ( not ( = ?auto_634961 ?auto_634962 ) ) ( not ( = ?auto_634961 ?auto_634963 ) ) ( not ( = ?auto_634961 ?auto_634964 ) ) ( not ( = ?auto_634961 ?auto_634965 ) ) ( not ( = ?auto_634961 ?auto_634966 ) ) ( not ( = ?auto_634961 ?auto_634967 ) ) ( not ( = ?auto_634961 ?auto_634968 ) ) ( not ( = ?auto_634961 ?auto_634969 ) ) ( not ( = ?auto_634961 ?auto_634970 ) ) ( not ( = ?auto_634961 ?auto_634971 ) ) ( not ( = ?auto_634961 ?auto_634972 ) ) ( not ( = ?auto_634961 ?auto_634973 ) ) ( not ( = ?auto_634961 ?auto_634974 ) ) ( not ( = ?auto_634961 ?auto_634975 ) ) ( not ( = ?auto_634961 ?auto_634976 ) ) ( not ( = ?auto_634962 ?auto_634963 ) ) ( not ( = ?auto_634962 ?auto_634964 ) ) ( not ( = ?auto_634962 ?auto_634965 ) ) ( not ( = ?auto_634962 ?auto_634966 ) ) ( not ( = ?auto_634962 ?auto_634967 ) ) ( not ( = ?auto_634962 ?auto_634968 ) ) ( not ( = ?auto_634962 ?auto_634969 ) ) ( not ( = ?auto_634962 ?auto_634970 ) ) ( not ( = ?auto_634962 ?auto_634971 ) ) ( not ( = ?auto_634962 ?auto_634972 ) ) ( not ( = ?auto_634962 ?auto_634973 ) ) ( not ( = ?auto_634962 ?auto_634974 ) ) ( not ( = ?auto_634962 ?auto_634975 ) ) ( not ( = ?auto_634962 ?auto_634976 ) ) ( not ( = ?auto_634963 ?auto_634964 ) ) ( not ( = ?auto_634963 ?auto_634965 ) ) ( not ( = ?auto_634963 ?auto_634966 ) ) ( not ( = ?auto_634963 ?auto_634967 ) ) ( not ( = ?auto_634963 ?auto_634968 ) ) ( not ( = ?auto_634963 ?auto_634969 ) ) ( not ( = ?auto_634963 ?auto_634970 ) ) ( not ( = ?auto_634963 ?auto_634971 ) ) ( not ( = ?auto_634963 ?auto_634972 ) ) ( not ( = ?auto_634963 ?auto_634973 ) ) ( not ( = ?auto_634963 ?auto_634974 ) ) ( not ( = ?auto_634963 ?auto_634975 ) ) ( not ( = ?auto_634963 ?auto_634976 ) ) ( not ( = ?auto_634964 ?auto_634965 ) ) ( not ( = ?auto_634964 ?auto_634966 ) ) ( not ( = ?auto_634964 ?auto_634967 ) ) ( not ( = ?auto_634964 ?auto_634968 ) ) ( not ( = ?auto_634964 ?auto_634969 ) ) ( not ( = ?auto_634964 ?auto_634970 ) ) ( not ( = ?auto_634964 ?auto_634971 ) ) ( not ( = ?auto_634964 ?auto_634972 ) ) ( not ( = ?auto_634964 ?auto_634973 ) ) ( not ( = ?auto_634964 ?auto_634974 ) ) ( not ( = ?auto_634964 ?auto_634975 ) ) ( not ( = ?auto_634964 ?auto_634976 ) ) ( not ( = ?auto_634965 ?auto_634966 ) ) ( not ( = ?auto_634965 ?auto_634967 ) ) ( not ( = ?auto_634965 ?auto_634968 ) ) ( not ( = ?auto_634965 ?auto_634969 ) ) ( not ( = ?auto_634965 ?auto_634970 ) ) ( not ( = ?auto_634965 ?auto_634971 ) ) ( not ( = ?auto_634965 ?auto_634972 ) ) ( not ( = ?auto_634965 ?auto_634973 ) ) ( not ( = ?auto_634965 ?auto_634974 ) ) ( not ( = ?auto_634965 ?auto_634975 ) ) ( not ( = ?auto_634965 ?auto_634976 ) ) ( not ( = ?auto_634966 ?auto_634967 ) ) ( not ( = ?auto_634966 ?auto_634968 ) ) ( not ( = ?auto_634966 ?auto_634969 ) ) ( not ( = ?auto_634966 ?auto_634970 ) ) ( not ( = ?auto_634966 ?auto_634971 ) ) ( not ( = ?auto_634966 ?auto_634972 ) ) ( not ( = ?auto_634966 ?auto_634973 ) ) ( not ( = ?auto_634966 ?auto_634974 ) ) ( not ( = ?auto_634966 ?auto_634975 ) ) ( not ( = ?auto_634966 ?auto_634976 ) ) ( not ( = ?auto_634967 ?auto_634968 ) ) ( not ( = ?auto_634967 ?auto_634969 ) ) ( not ( = ?auto_634967 ?auto_634970 ) ) ( not ( = ?auto_634967 ?auto_634971 ) ) ( not ( = ?auto_634967 ?auto_634972 ) ) ( not ( = ?auto_634967 ?auto_634973 ) ) ( not ( = ?auto_634967 ?auto_634974 ) ) ( not ( = ?auto_634967 ?auto_634975 ) ) ( not ( = ?auto_634967 ?auto_634976 ) ) ( not ( = ?auto_634968 ?auto_634969 ) ) ( not ( = ?auto_634968 ?auto_634970 ) ) ( not ( = ?auto_634968 ?auto_634971 ) ) ( not ( = ?auto_634968 ?auto_634972 ) ) ( not ( = ?auto_634968 ?auto_634973 ) ) ( not ( = ?auto_634968 ?auto_634974 ) ) ( not ( = ?auto_634968 ?auto_634975 ) ) ( not ( = ?auto_634968 ?auto_634976 ) ) ( not ( = ?auto_634969 ?auto_634970 ) ) ( not ( = ?auto_634969 ?auto_634971 ) ) ( not ( = ?auto_634969 ?auto_634972 ) ) ( not ( = ?auto_634969 ?auto_634973 ) ) ( not ( = ?auto_634969 ?auto_634974 ) ) ( not ( = ?auto_634969 ?auto_634975 ) ) ( not ( = ?auto_634969 ?auto_634976 ) ) ( not ( = ?auto_634970 ?auto_634971 ) ) ( not ( = ?auto_634970 ?auto_634972 ) ) ( not ( = ?auto_634970 ?auto_634973 ) ) ( not ( = ?auto_634970 ?auto_634974 ) ) ( not ( = ?auto_634970 ?auto_634975 ) ) ( not ( = ?auto_634970 ?auto_634976 ) ) ( not ( = ?auto_634971 ?auto_634972 ) ) ( not ( = ?auto_634971 ?auto_634973 ) ) ( not ( = ?auto_634971 ?auto_634974 ) ) ( not ( = ?auto_634971 ?auto_634975 ) ) ( not ( = ?auto_634971 ?auto_634976 ) ) ( not ( = ?auto_634972 ?auto_634973 ) ) ( not ( = ?auto_634972 ?auto_634974 ) ) ( not ( = ?auto_634972 ?auto_634975 ) ) ( not ( = ?auto_634972 ?auto_634976 ) ) ( not ( = ?auto_634973 ?auto_634974 ) ) ( not ( = ?auto_634973 ?auto_634975 ) ) ( not ( = ?auto_634973 ?auto_634976 ) ) ( not ( = ?auto_634974 ?auto_634975 ) ) ( not ( = ?auto_634974 ?auto_634976 ) ) ( not ( = ?auto_634975 ?auto_634976 ) ) ( ON ?auto_634974 ?auto_634975 ) ( ON ?auto_634973 ?auto_634974 ) ( ON ?auto_634972 ?auto_634973 ) ( ON ?auto_634971 ?auto_634972 ) ( ON ?auto_634970 ?auto_634971 ) ( ON ?auto_634969 ?auto_634970 ) ( ON ?auto_634968 ?auto_634969 ) ( ON ?auto_634967 ?auto_634968 ) ( ON ?auto_634966 ?auto_634967 ) ( ON ?auto_634965 ?auto_634966 ) ( ON ?auto_634964 ?auto_634965 ) ( ON ?auto_634963 ?auto_634964 ) ( ON ?auto_634962 ?auto_634963 ) ( CLEAR ?auto_634960 ) ( ON ?auto_634961 ?auto_634962 ) ( CLEAR ?auto_634961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_634959 ?auto_634960 ?auto_634961 )
      ( MAKE-17PILE ?auto_634959 ?auto_634960 ?auto_634961 ?auto_634962 ?auto_634963 ?auto_634964 ?auto_634965 ?auto_634966 ?auto_634967 ?auto_634968 ?auto_634969 ?auto_634970 ?auto_634971 ?auto_634972 ?auto_634973 ?auto_634974 ?auto_634975 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_634994 - BLOCK
      ?auto_634995 - BLOCK
      ?auto_634996 - BLOCK
      ?auto_634997 - BLOCK
      ?auto_634998 - BLOCK
      ?auto_634999 - BLOCK
      ?auto_635000 - BLOCK
      ?auto_635001 - BLOCK
      ?auto_635002 - BLOCK
      ?auto_635003 - BLOCK
      ?auto_635004 - BLOCK
      ?auto_635005 - BLOCK
      ?auto_635006 - BLOCK
      ?auto_635007 - BLOCK
      ?auto_635008 - BLOCK
      ?auto_635009 - BLOCK
      ?auto_635010 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_635010 ) ( ON-TABLE ?auto_634994 ) ( ON ?auto_634995 ?auto_634994 ) ( not ( = ?auto_634994 ?auto_634995 ) ) ( not ( = ?auto_634994 ?auto_634996 ) ) ( not ( = ?auto_634994 ?auto_634997 ) ) ( not ( = ?auto_634994 ?auto_634998 ) ) ( not ( = ?auto_634994 ?auto_634999 ) ) ( not ( = ?auto_634994 ?auto_635000 ) ) ( not ( = ?auto_634994 ?auto_635001 ) ) ( not ( = ?auto_634994 ?auto_635002 ) ) ( not ( = ?auto_634994 ?auto_635003 ) ) ( not ( = ?auto_634994 ?auto_635004 ) ) ( not ( = ?auto_634994 ?auto_635005 ) ) ( not ( = ?auto_634994 ?auto_635006 ) ) ( not ( = ?auto_634994 ?auto_635007 ) ) ( not ( = ?auto_634994 ?auto_635008 ) ) ( not ( = ?auto_634994 ?auto_635009 ) ) ( not ( = ?auto_634994 ?auto_635010 ) ) ( not ( = ?auto_634995 ?auto_634996 ) ) ( not ( = ?auto_634995 ?auto_634997 ) ) ( not ( = ?auto_634995 ?auto_634998 ) ) ( not ( = ?auto_634995 ?auto_634999 ) ) ( not ( = ?auto_634995 ?auto_635000 ) ) ( not ( = ?auto_634995 ?auto_635001 ) ) ( not ( = ?auto_634995 ?auto_635002 ) ) ( not ( = ?auto_634995 ?auto_635003 ) ) ( not ( = ?auto_634995 ?auto_635004 ) ) ( not ( = ?auto_634995 ?auto_635005 ) ) ( not ( = ?auto_634995 ?auto_635006 ) ) ( not ( = ?auto_634995 ?auto_635007 ) ) ( not ( = ?auto_634995 ?auto_635008 ) ) ( not ( = ?auto_634995 ?auto_635009 ) ) ( not ( = ?auto_634995 ?auto_635010 ) ) ( not ( = ?auto_634996 ?auto_634997 ) ) ( not ( = ?auto_634996 ?auto_634998 ) ) ( not ( = ?auto_634996 ?auto_634999 ) ) ( not ( = ?auto_634996 ?auto_635000 ) ) ( not ( = ?auto_634996 ?auto_635001 ) ) ( not ( = ?auto_634996 ?auto_635002 ) ) ( not ( = ?auto_634996 ?auto_635003 ) ) ( not ( = ?auto_634996 ?auto_635004 ) ) ( not ( = ?auto_634996 ?auto_635005 ) ) ( not ( = ?auto_634996 ?auto_635006 ) ) ( not ( = ?auto_634996 ?auto_635007 ) ) ( not ( = ?auto_634996 ?auto_635008 ) ) ( not ( = ?auto_634996 ?auto_635009 ) ) ( not ( = ?auto_634996 ?auto_635010 ) ) ( not ( = ?auto_634997 ?auto_634998 ) ) ( not ( = ?auto_634997 ?auto_634999 ) ) ( not ( = ?auto_634997 ?auto_635000 ) ) ( not ( = ?auto_634997 ?auto_635001 ) ) ( not ( = ?auto_634997 ?auto_635002 ) ) ( not ( = ?auto_634997 ?auto_635003 ) ) ( not ( = ?auto_634997 ?auto_635004 ) ) ( not ( = ?auto_634997 ?auto_635005 ) ) ( not ( = ?auto_634997 ?auto_635006 ) ) ( not ( = ?auto_634997 ?auto_635007 ) ) ( not ( = ?auto_634997 ?auto_635008 ) ) ( not ( = ?auto_634997 ?auto_635009 ) ) ( not ( = ?auto_634997 ?auto_635010 ) ) ( not ( = ?auto_634998 ?auto_634999 ) ) ( not ( = ?auto_634998 ?auto_635000 ) ) ( not ( = ?auto_634998 ?auto_635001 ) ) ( not ( = ?auto_634998 ?auto_635002 ) ) ( not ( = ?auto_634998 ?auto_635003 ) ) ( not ( = ?auto_634998 ?auto_635004 ) ) ( not ( = ?auto_634998 ?auto_635005 ) ) ( not ( = ?auto_634998 ?auto_635006 ) ) ( not ( = ?auto_634998 ?auto_635007 ) ) ( not ( = ?auto_634998 ?auto_635008 ) ) ( not ( = ?auto_634998 ?auto_635009 ) ) ( not ( = ?auto_634998 ?auto_635010 ) ) ( not ( = ?auto_634999 ?auto_635000 ) ) ( not ( = ?auto_634999 ?auto_635001 ) ) ( not ( = ?auto_634999 ?auto_635002 ) ) ( not ( = ?auto_634999 ?auto_635003 ) ) ( not ( = ?auto_634999 ?auto_635004 ) ) ( not ( = ?auto_634999 ?auto_635005 ) ) ( not ( = ?auto_634999 ?auto_635006 ) ) ( not ( = ?auto_634999 ?auto_635007 ) ) ( not ( = ?auto_634999 ?auto_635008 ) ) ( not ( = ?auto_634999 ?auto_635009 ) ) ( not ( = ?auto_634999 ?auto_635010 ) ) ( not ( = ?auto_635000 ?auto_635001 ) ) ( not ( = ?auto_635000 ?auto_635002 ) ) ( not ( = ?auto_635000 ?auto_635003 ) ) ( not ( = ?auto_635000 ?auto_635004 ) ) ( not ( = ?auto_635000 ?auto_635005 ) ) ( not ( = ?auto_635000 ?auto_635006 ) ) ( not ( = ?auto_635000 ?auto_635007 ) ) ( not ( = ?auto_635000 ?auto_635008 ) ) ( not ( = ?auto_635000 ?auto_635009 ) ) ( not ( = ?auto_635000 ?auto_635010 ) ) ( not ( = ?auto_635001 ?auto_635002 ) ) ( not ( = ?auto_635001 ?auto_635003 ) ) ( not ( = ?auto_635001 ?auto_635004 ) ) ( not ( = ?auto_635001 ?auto_635005 ) ) ( not ( = ?auto_635001 ?auto_635006 ) ) ( not ( = ?auto_635001 ?auto_635007 ) ) ( not ( = ?auto_635001 ?auto_635008 ) ) ( not ( = ?auto_635001 ?auto_635009 ) ) ( not ( = ?auto_635001 ?auto_635010 ) ) ( not ( = ?auto_635002 ?auto_635003 ) ) ( not ( = ?auto_635002 ?auto_635004 ) ) ( not ( = ?auto_635002 ?auto_635005 ) ) ( not ( = ?auto_635002 ?auto_635006 ) ) ( not ( = ?auto_635002 ?auto_635007 ) ) ( not ( = ?auto_635002 ?auto_635008 ) ) ( not ( = ?auto_635002 ?auto_635009 ) ) ( not ( = ?auto_635002 ?auto_635010 ) ) ( not ( = ?auto_635003 ?auto_635004 ) ) ( not ( = ?auto_635003 ?auto_635005 ) ) ( not ( = ?auto_635003 ?auto_635006 ) ) ( not ( = ?auto_635003 ?auto_635007 ) ) ( not ( = ?auto_635003 ?auto_635008 ) ) ( not ( = ?auto_635003 ?auto_635009 ) ) ( not ( = ?auto_635003 ?auto_635010 ) ) ( not ( = ?auto_635004 ?auto_635005 ) ) ( not ( = ?auto_635004 ?auto_635006 ) ) ( not ( = ?auto_635004 ?auto_635007 ) ) ( not ( = ?auto_635004 ?auto_635008 ) ) ( not ( = ?auto_635004 ?auto_635009 ) ) ( not ( = ?auto_635004 ?auto_635010 ) ) ( not ( = ?auto_635005 ?auto_635006 ) ) ( not ( = ?auto_635005 ?auto_635007 ) ) ( not ( = ?auto_635005 ?auto_635008 ) ) ( not ( = ?auto_635005 ?auto_635009 ) ) ( not ( = ?auto_635005 ?auto_635010 ) ) ( not ( = ?auto_635006 ?auto_635007 ) ) ( not ( = ?auto_635006 ?auto_635008 ) ) ( not ( = ?auto_635006 ?auto_635009 ) ) ( not ( = ?auto_635006 ?auto_635010 ) ) ( not ( = ?auto_635007 ?auto_635008 ) ) ( not ( = ?auto_635007 ?auto_635009 ) ) ( not ( = ?auto_635007 ?auto_635010 ) ) ( not ( = ?auto_635008 ?auto_635009 ) ) ( not ( = ?auto_635008 ?auto_635010 ) ) ( not ( = ?auto_635009 ?auto_635010 ) ) ( ON ?auto_635009 ?auto_635010 ) ( ON ?auto_635008 ?auto_635009 ) ( ON ?auto_635007 ?auto_635008 ) ( ON ?auto_635006 ?auto_635007 ) ( ON ?auto_635005 ?auto_635006 ) ( ON ?auto_635004 ?auto_635005 ) ( ON ?auto_635003 ?auto_635004 ) ( ON ?auto_635002 ?auto_635003 ) ( ON ?auto_635001 ?auto_635002 ) ( ON ?auto_635000 ?auto_635001 ) ( ON ?auto_634999 ?auto_635000 ) ( ON ?auto_634998 ?auto_634999 ) ( ON ?auto_634997 ?auto_634998 ) ( CLEAR ?auto_634995 ) ( ON ?auto_634996 ?auto_634997 ) ( CLEAR ?auto_634996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_634994 ?auto_634995 ?auto_634996 )
      ( MAKE-17PILE ?auto_634994 ?auto_634995 ?auto_634996 ?auto_634997 ?auto_634998 ?auto_634999 ?auto_635000 ?auto_635001 ?auto_635002 ?auto_635003 ?auto_635004 ?auto_635005 ?auto_635006 ?auto_635007 ?auto_635008 ?auto_635009 ?auto_635010 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_635028 - BLOCK
      ?auto_635029 - BLOCK
      ?auto_635030 - BLOCK
      ?auto_635031 - BLOCK
      ?auto_635032 - BLOCK
      ?auto_635033 - BLOCK
      ?auto_635034 - BLOCK
      ?auto_635035 - BLOCK
      ?auto_635036 - BLOCK
      ?auto_635037 - BLOCK
      ?auto_635038 - BLOCK
      ?auto_635039 - BLOCK
      ?auto_635040 - BLOCK
      ?auto_635041 - BLOCK
      ?auto_635042 - BLOCK
      ?auto_635043 - BLOCK
      ?auto_635044 - BLOCK
    )
    :vars
    (
      ?auto_635045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635044 ?auto_635045 ) ( ON-TABLE ?auto_635028 ) ( not ( = ?auto_635028 ?auto_635029 ) ) ( not ( = ?auto_635028 ?auto_635030 ) ) ( not ( = ?auto_635028 ?auto_635031 ) ) ( not ( = ?auto_635028 ?auto_635032 ) ) ( not ( = ?auto_635028 ?auto_635033 ) ) ( not ( = ?auto_635028 ?auto_635034 ) ) ( not ( = ?auto_635028 ?auto_635035 ) ) ( not ( = ?auto_635028 ?auto_635036 ) ) ( not ( = ?auto_635028 ?auto_635037 ) ) ( not ( = ?auto_635028 ?auto_635038 ) ) ( not ( = ?auto_635028 ?auto_635039 ) ) ( not ( = ?auto_635028 ?auto_635040 ) ) ( not ( = ?auto_635028 ?auto_635041 ) ) ( not ( = ?auto_635028 ?auto_635042 ) ) ( not ( = ?auto_635028 ?auto_635043 ) ) ( not ( = ?auto_635028 ?auto_635044 ) ) ( not ( = ?auto_635028 ?auto_635045 ) ) ( not ( = ?auto_635029 ?auto_635030 ) ) ( not ( = ?auto_635029 ?auto_635031 ) ) ( not ( = ?auto_635029 ?auto_635032 ) ) ( not ( = ?auto_635029 ?auto_635033 ) ) ( not ( = ?auto_635029 ?auto_635034 ) ) ( not ( = ?auto_635029 ?auto_635035 ) ) ( not ( = ?auto_635029 ?auto_635036 ) ) ( not ( = ?auto_635029 ?auto_635037 ) ) ( not ( = ?auto_635029 ?auto_635038 ) ) ( not ( = ?auto_635029 ?auto_635039 ) ) ( not ( = ?auto_635029 ?auto_635040 ) ) ( not ( = ?auto_635029 ?auto_635041 ) ) ( not ( = ?auto_635029 ?auto_635042 ) ) ( not ( = ?auto_635029 ?auto_635043 ) ) ( not ( = ?auto_635029 ?auto_635044 ) ) ( not ( = ?auto_635029 ?auto_635045 ) ) ( not ( = ?auto_635030 ?auto_635031 ) ) ( not ( = ?auto_635030 ?auto_635032 ) ) ( not ( = ?auto_635030 ?auto_635033 ) ) ( not ( = ?auto_635030 ?auto_635034 ) ) ( not ( = ?auto_635030 ?auto_635035 ) ) ( not ( = ?auto_635030 ?auto_635036 ) ) ( not ( = ?auto_635030 ?auto_635037 ) ) ( not ( = ?auto_635030 ?auto_635038 ) ) ( not ( = ?auto_635030 ?auto_635039 ) ) ( not ( = ?auto_635030 ?auto_635040 ) ) ( not ( = ?auto_635030 ?auto_635041 ) ) ( not ( = ?auto_635030 ?auto_635042 ) ) ( not ( = ?auto_635030 ?auto_635043 ) ) ( not ( = ?auto_635030 ?auto_635044 ) ) ( not ( = ?auto_635030 ?auto_635045 ) ) ( not ( = ?auto_635031 ?auto_635032 ) ) ( not ( = ?auto_635031 ?auto_635033 ) ) ( not ( = ?auto_635031 ?auto_635034 ) ) ( not ( = ?auto_635031 ?auto_635035 ) ) ( not ( = ?auto_635031 ?auto_635036 ) ) ( not ( = ?auto_635031 ?auto_635037 ) ) ( not ( = ?auto_635031 ?auto_635038 ) ) ( not ( = ?auto_635031 ?auto_635039 ) ) ( not ( = ?auto_635031 ?auto_635040 ) ) ( not ( = ?auto_635031 ?auto_635041 ) ) ( not ( = ?auto_635031 ?auto_635042 ) ) ( not ( = ?auto_635031 ?auto_635043 ) ) ( not ( = ?auto_635031 ?auto_635044 ) ) ( not ( = ?auto_635031 ?auto_635045 ) ) ( not ( = ?auto_635032 ?auto_635033 ) ) ( not ( = ?auto_635032 ?auto_635034 ) ) ( not ( = ?auto_635032 ?auto_635035 ) ) ( not ( = ?auto_635032 ?auto_635036 ) ) ( not ( = ?auto_635032 ?auto_635037 ) ) ( not ( = ?auto_635032 ?auto_635038 ) ) ( not ( = ?auto_635032 ?auto_635039 ) ) ( not ( = ?auto_635032 ?auto_635040 ) ) ( not ( = ?auto_635032 ?auto_635041 ) ) ( not ( = ?auto_635032 ?auto_635042 ) ) ( not ( = ?auto_635032 ?auto_635043 ) ) ( not ( = ?auto_635032 ?auto_635044 ) ) ( not ( = ?auto_635032 ?auto_635045 ) ) ( not ( = ?auto_635033 ?auto_635034 ) ) ( not ( = ?auto_635033 ?auto_635035 ) ) ( not ( = ?auto_635033 ?auto_635036 ) ) ( not ( = ?auto_635033 ?auto_635037 ) ) ( not ( = ?auto_635033 ?auto_635038 ) ) ( not ( = ?auto_635033 ?auto_635039 ) ) ( not ( = ?auto_635033 ?auto_635040 ) ) ( not ( = ?auto_635033 ?auto_635041 ) ) ( not ( = ?auto_635033 ?auto_635042 ) ) ( not ( = ?auto_635033 ?auto_635043 ) ) ( not ( = ?auto_635033 ?auto_635044 ) ) ( not ( = ?auto_635033 ?auto_635045 ) ) ( not ( = ?auto_635034 ?auto_635035 ) ) ( not ( = ?auto_635034 ?auto_635036 ) ) ( not ( = ?auto_635034 ?auto_635037 ) ) ( not ( = ?auto_635034 ?auto_635038 ) ) ( not ( = ?auto_635034 ?auto_635039 ) ) ( not ( = ?auto_635034 ?auto_635040 ) ) ( not ( = ?auto_635034 ?auto_635041 ) ) ( not ( = ?auto_635034 ?auto_635042 ) ) ( not ( = ?auto_635034 ?auto_635043 ) ) ( not ( = ?auto_635034 ?auto_635044 ) ) ( not ( = ?auto_635034 ?auto_635045 ) ) ( not ( = ?auto_635035 ?auto_635036 ) ) ( not ( = ?auto_635035 ?auto_635037 ) ) ( not ( = ?auto_635035 ?auto_635038 ) ) ( not ( = ?auto_635035 ?auto_635039 ) ) ( not ( = ?auto_635035 ?auto_635040 ) ) ( not ( = ?auto_635035 ?auto_635041 ) ) ( not ( = ?auto_635035 ?auto_635042 ) ) ( not ( = ?auto_635035 ?auto_635043 ) ) ( not ( = ?auto_635035 ?auto_635044 ) ) ( not ( = ?auto_635035 ?auto_635045 ) ) ( not ( = ?auto_635036 ?auto_635037 ) ) ( not ( = ?auto_635036 ?auto_635038 ) ) ( not ( = ?auto_635036 ?auto_635039 ) ) ( not ( = ?auto_635036 ?auto_635040 ) ) ( not ( = ?auto_635036 ?auto_635041 ) ) ( not ( = ?auto_635036 ?auto_635042 ) ) ( not ( = ?auto_635036 ?auto_635043 ) ) ( not ( = ?auto_635036 ?auto_635044 ) ) ( not ( = ?auto_635036 ?auto_635045 ) ) ( not ( = ?auto_635037 ?auto_635038 ) ) ( not ( = ?auto_635037 ?auto_635039 ) ) ( not ( = ?auto_635037 ?auto_635040 ) ) ( not ( = ?auto_635037 ?auto_635041 ) ) ( not ( = ?auto_635037 ?auto_635042 ) ) ( not ( = ?auto_635037 ?auto_635043 ) ) ( not ( = ?auto_635037 ?auto_635044 ) ) ( not ( = ?auto_635037 ?auto_635045 ) ) ( not ( = ?auto_635038 ?auto_635039 ) ) ( not ( = ?auto_635038 ?auto_635040 ) ) ( not ( = ?auto_635038 ?auto_635041 ) ) ( not ( = ?auto_635038 ?auto_635042 ) ) ( not ( = ?auto_635038 ?auto_635043 ) ) ( not ( = ?auto_635038 ?auto_635044 ) ) ( not ( = ?auto_635038 ?auto_635045 ) ) ( not ( = ?auto_635039 ?auto_635040 ) ) ( not ( = ?auto_635039 ?auto_635041 ) ) ( not ( = ?auto_635039 ?auto_635042 ) ) ( not ( = ?auto_635039 ?auto_635043 ) ) ( not ( = ?auto_635039 ?auto_635044 ) ) ( not ( = ?auto_635039 ?auto_635045 ) ) ( not ( = ?auto_635040 ?auto_635041 ) ) ( not ( = ?auto_635040 ?auto_635042 ) ) ( not ( = ?auto_635040 ?auto_635043 ) ) ( not ( = ?auto_635040 ?auto_635044 ) ) ( not ( = ?auto_635040 ?auto_635045 ) ) ( not ( = ?auto_635041 ?auto_635042 ) ) ( not ( = ?auto_635041 ?auto_635043 ) ) ( not ( = ?auto_635041 ?auto_635044 ) ) ( not ( = ?auto_635041 ?auto_635045 ) ) ( not ( = ?auto_635042 ?auto_635043 ) ) ( not ( = ?auto_635042 ?auto_635044 ) ) ( not ( = ?auto_635042 ?auto_635045 ) ) ( not ( = ?auto_635043 ?auto_635044 ) ) ( not ( = ?auto_635043 ?auto_635045 ) ) ( not ( = ?auto_635044 ?auto_635045 ) ) ( ON ?auto_635043 ?auto_635044 ) ( ON ?auto_635042 ?auto_635043 ) ( ON ?auto_635041 ?auto_635042 ) ( ON ?auto_635040 ?auto_635041 ) ( ON ?auto_635039 ?auto_635040 ) ( ON ?auto_635038 ?auto_635039 ) ( ON ?auto_635037 ?auto_635038 ) ( ON ?auto_635036 ?auto_635037 ) ( ON ?auto_635035 ?auto_635036 ) ( ON ?auto_635034 ?auto_635035 ) ( ON ?auto_635033 ?auto_635034 ) ( ON ?auto_635032 ?auto_635033 ) ( ON ?auto_635031 ?auto_635032 ) ( ON ?auto_635030 ?auto_635031 ) ( CLEAR ?auto_635028 ) ( ON ?auto_635029 ?auto_635030 ) ( CLEAR ?auto_635029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635028 ?auto_635029 )
      ( MAKE-17PILE ?auto_635028 ?auto_635029 ?auto_635030 ?auto_635031 ?auto_635032 ?auto_635033 ?auto_635034 ?auto_635035 ?auto_635036 ?auto_635037 ?auto_635038 ?auto_635039 ?auto_635040 ?auto_635041 ?auto_635042 ?auto_635043 ?auto_635044 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_635063 - BLOCK
      ?auto_635064 - BLOCK
      ?auto_635065 - BLOCK
      ?auto_635066 - BLOCK
      ?auto_635067 - BLOCK
      ?auto_635068 - BLOCK
      ?auto_635069 - BLOCK
      ?auto_635070 - BLOCK
      ?auto_635071 - BLOCK
      ?auto_635072 - BLOCK
      ?auto_635073 - BLOCK
      ?auto_635074 - BLOCK
      ?auto_635075 - BLOCK
      ?auto_635076 - BLOCK
      ?auto_635077 - BLOCK
      ?auto_635078 - BLOCK
      ?auto_635079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_635079 ) ( ON-TABLE ?auto_635063 ) ( not ( = ?auto_635063 ?auto_635064 ) ) ( not ( = ?auto_635063 ?auto_635065 ) ) ( not ( = ?auto_635063 ?auto_635066 ) ) ( not ( = ?auto_635063 ?auto_635067 ) ) ( not ( = ?auto_635063 ?auto_635068 ) ) ( not ( = ?auto_635063 ?auto_635069 ) ) ( not ( = ?auto_635063 ?auto_635070 ) ) ( not ( = ?auto_635063 ?auto_635071 ) ) ( not ( = ?auto_635063 ?auto_635072 ) ) ( not ( = ?auto_635063 ?auto_635073 ) ) ( not ( = ?auto_635063 ?auto_635074 ) ) ( not ( = ?auto_635063 ?auto_635075 ) ) ( not ( = ?auto_635063 ?auto_635076 ) ) ( not ( = ?auto_635063 ?auto_635077 ) ) ( not ( = ?auto_635063 ?auto_635078 ) ) ( not ( = ?auto_635063 ?auto_635079 ) ) ( not ( = ?auto_635064 ?auto_635065 ) ) ( not ( = ?auto_635064 ?auto_635066 ) ) ( not ( = ?auto_635064 ?auto_635067 ) ) ( not ( = ?auto_635064 ?auto_635068 ) ) ( not ( = ?auto_635064 ?auto_635069 ) ) ( not ( = ?auto_635064 ?auto_635070 ) ) ( not ( = ?auto_635064 ?auto_635071 ) ) ( not ( = ?auto_635064 ?auto_635072 ) ) ( not ( = ?auto_635064 ?auto_635073 ) ) ( not ( = ?auto_635064 ?auto_635074 ) ) ( not ( = ?auto_635064 ?auto_635075 ) ) ( not ( = ?auto_635064 ?auto_635076 ) ) ( not ( = ?auto_635064 ?auto_635077 ) ) ( not ( = ?auto_635064 ?auto_635078 ) ) ( not ( = ?auto_635064 ?auto_635079 ) ) ( not ( = ?auto_635065 ?auto_635066 ) ) ( not ( = ?auto_635065 ?auto_635067 ) ) ( not ( = ?auto_635065 ?auto_635068 ) ) ( not ( = ?auto_635065 ?auto_635069 ) ) ( not ( = ?auto_635065 ?auto_635070 ) ) ( not ( = ?auto_635065 ?auto_635071 ) ) ( not ( = ?auto_635065 ?auto_635072 ) ) ( not ( = ?auto_635065 ?auto_635073 ) ) ( not ( = ?auto_635065 ?auto_635074 ) ) ( not ( = ?auto_635065 ?auto_635075 ) ) ( not ( = ?auto_635065 ?auto_635076 ) ) ( not ( = ?auto_635065 ?auto_635077 ) ) ( not ( = ?auto_635065 ?auto_635078 ) ) ( not ( = ?auto_635065 ?auto_635079 ) ) ( not ( = ?auto_635066 ?auto_635067 ) ) ( not ( = ?auto_635066 ?auto_635068 ) ) ( not ( = ?auto_635066 ?auto_635069 ) ) ( not ( = ?auto_635066 ?auto_635070 ) ) ( not ( = ?auto_635066 ?auto_635071 ) ) ( not ( = ?auto_635066 ?auto_635072 ) ) ( not ( = ?auto_635066 ?auto_635073 ) ) ( not ( = ?auto_635066 ?auto_635074 ) ) ( not ( = ?auto_635066 ?auto_635075 ) ) ( not ( = ?auto_635066 ?auto_635076 ) ) ( not ( = ?auto_635066 ?auto_635077 ) ) ( not ( = ?auto_635066 ?auto_635078 ) ) ( not ( = ?auto_635066 ?auto_635079 ) ) ( not ( = ?auto_635067 ?auto_635068 ) ) ( not ( = ?auto_635067 ?auto_635069 ) ) ( not ( = ?auto_635067 ?auto_635070 ) ) ( not ( = ?auto_635067 ?auto_635071 ) ) ( not ( = ?auto_635067 ?auto_635072 ) ) ( not ( = ?auto_635067 ?auto_635073 ) ) ( not ( = ?auto_635067 ?auto_635074 ) ) ( not ( = ?auto_635067 ?auto_635075 ) ) ( not ( = ?auto_635067 ?auto_635076 ) ) ( not ( = ?auto_635067 ?auto_635077 ) ) ( not ( = ?auto_635067 ?auto_635078 ) ) ( not ( = ?auto_635067 ?auto_635079 ) ) ( not ( = ?auto_635068 ?auto_635069 ) ) ( not ( = ?auto_635068 ?auto_635070 ) ) ( not ( = ?auto_635068 ?auto_635071 ) ) ( not ( = ?auto_635068 ?auto_635072 ) ) ( not ( = ?auto_635068 ?auto_635073 ) ) ( not ( = ?auto_635068 ?auto_635074 ) ) ( not ( = ?auto_635068 ?auto_635075 ) ) ( not ( = ?auto_635068 ?auto_635076 ) ) ( not ( = ?auto_635068 ?auto_635077 ) ) ( not ( = ?auto_635068 ?auto_635078 ) ) ( not ( = ?auto_635068 ?auto_635079 ) ) ( not ( = ?auto_635069 ?auto_635070 ) ) ( not ( = ?auto_635069 ?auto_635071 ) ) ( not ( = ?auto_635069 ?auto_635072 ) ) ( not ( = ?auto_635069 ?auto_635073 ) ) ( not ( = ?auto_635069 ?auto_635074 ) ) ( not ( = ?auto_635069 ?auto_635075 ) ) ( not ( = ?auto_635069 ?auto_635076 ) ) ( not ( = ?auto_635069 ?auto_635077 ) ) ( not ( = ?auto_635069 ?auto_635078 ) ) ( not ( = ?auto_635069 ?auto_635079 ) ) ( not ( = ?auto_635070 ?auto_635071 ) ) ( not ( = ?auto_635070 ?auto_635072 ) ) ( not ( = ?auto_635070 ?auto_635073 ) ) ( not ( = ?auto_635070 ?auto_635074 ) ) ( not ( = ?auto_635070 ?auto_635075 ) ) ( not ( = ?auto_635070 ?auto_635076 ) ) ( not ( = ?auto_635070 ?auto_635077 ) ) ( not ( = ?auto_635070 ?auto_635078 ) ) ( not ( = ?auto_635070 ?auto_635079 ) ) ( not ( = ?auto_635071 ?auto_635072 ) ) ( not ( = ?auto_635071 ?auto_635073 ) ) ( not ( = ?auto_635071 ?auto_635074 ) ) ( not ( = ?auto_635071 ?auto_635075 ) ) ( not ( = ?auto_635071 ?auto_635076 ) ) ( not ( = ?auto_635071 ?auto_635077 ) ) ( not ( = ?auto_635071 ?auto_635078 ) ) ( not ( = ?auto_635071 ?auto_635079 ) ) ( not ( = ?auto_635072 ?auto_635073 ) ) ( not ( = ?auto_635072 ?auto_635074 ) ) ( not ( = ?auto_635072 ?auto_635075 ) ) ( not ( = ?auto_635072 ?auto_635076 ) ) ( not ( = ?auto_635072 ?auto_635077 ) ) ( not ( = ?auto_635072 ?auto_635078 ) ) ( not ( = ?auto_635072 ?auto_635079 ) ) ( not ( = ?auto_635073 ?auto_635074 ) ) ( not ( = ?auto_635073 ?auto_635075 ) ) ( not ( = ?auto_635073 ?auto_635076 ) ) ( not ( = ?auto_635073 ?auto_635077 ) ) ( not ( = ?auto_635073 ?auto_635078 ) ) ( not ( = ?auto_635073 ?auto_635079 ) ) ( not ( = ?auto_635074 ?auto_635075 ) ) ( not ( = ?auto_635074 ?auto_635076 ) ) ( not ( = ?auto_635074 ?auto_635077 ) ) ( not ( = ?auto_635074 ?auto_635078 ) ) ( not ( = ?auto_635074 ?auto_635079 ) ) ( not ( = ?auto_635075 ?auto_635076 ) ) ( not ( = ?auto_635075 ?auto_635077 ) ) ( not ( = ?auto_635075 ?auto_635078 ) ) ( not ( = ?auto_635075 ?auto_635079 ) ) ( not ( = ?auto_635076 ?auto_635077 ) ) ( not ( = ?auto_635076 ?auto_635078 ) ) ( not ( = ?auto_635076 ?auto_635079 ) ) ( not ( = ?auto_635077 ?auto_635078 ) ) ( not ( = ?auto_635077 ?auto_635079 ) ) ( not ( = ?auto_635078 ?auto_635079 ) ) ( ON ?auto_635078 ?auto_635079 ) ( ON ?auto_635077 ?auto_635078 ) ( ON ?auto_635076 ?auto_635077 ) ( ON ?auto_635075 ?auto_635076 ) ( ON ?auto_635074 ?auto_635075 ) ( ON ?auto_635073 ?auto_635074 ) ( ON ?auto_635072 ?auto_635073 ) ( ON ?auto_635071 ?auto_635072 ) ( ON ?auto_635070 ?auto_635071 ) ( ON ?auto_635069 ?auto_635070 ) ( ON ?auto_635068 ?auto_635069 ) ( ON ?auto_635067 ?auto_635068 ) ( ON ?auto_635066 ?auto_635067 ) ( ON ?auto_635065 ?auto_635066 ) ( CLEAR ?auto_635063 ) ( ON ?auto_635064 ?auto_635065 ) ( CLEAR ?auto_635064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_635063 ?auto_635064 )
      ( MAKE-17PILE ?auto_635063 ?auto_635064 ?auto_635065 ?auto_635066 ?auto_635067 ?auto_635068 ?auto_635069 ?auto_635070 ?auto_635071 ?auto_635072 ?auto_635073 ?auto_635074 ?auto_635075 ?auto_635076 ?auto_635077 ?auto_635078 ?auto_635079 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_635097 - BLOCK
      ?auto_635098 - BLOCK
      ?auto_635099 - BLOCK
      ?auto_635100 - BLOCK
      ?auto_635101 - BLOCK
      ?auto_635102 - BLOCK
      ?auto_635103 - BLOCK
      ?auto_635104 - BLOCK
      ?auto_635105 - BLOCK
      ?auto_635106 - BLOCK
      ?auto_635107 - BLOCK
      ?auto_635108 - BLOCK
      ?auto_635109 - BLOCK
      ?auto_635110 - BLOCK
      ?auto_635111 - BLOCK
      ?auto_635112 - BLOCK
      ?auto_635113 - BLOCK
    )
    :vars
    (
      ?auto_635114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_635113 ?auto_635114 ) ( not ( = ?auto_635097 ?auto_635098 ) ) ( not ( = ?auto_635097 ?auto_635099 ) ) ( not ( = ?auto_635097 ?auto_635100 ) ) ( not ( = ?auto_635097 ?auto_635101 ) ) ( not ( = ?auto_635097 ?auto_635102 ) ) ( not ( = ?auto_635097 ?auto_635103 ) ) ( not ( = ?auto_635097 ?auto_635104 ) ) ( not ( = ?auto_635097 ?auto_635105 ) ) ( not ( = ?auto_635097 ?auto_635106 ) ) ( not ( = ?auto_635097 ?auto_635107 ) ) ( not ( = ?auto_635097 ?auto_635108 ) ) ( not ( = ?auto_635097 ?auto_635109 ) ) ( not ( = ?auto_635097 ?auto_635110 ) ) ( not ( = ?auto_635097 ?auto_635111 ) ) ( not ( = ?auto_635097 ?auto_635112 ) ) ( not ( = ?auto_635097 ?auto_635113 ) ) ( not ( = ?auto_635097 ?auto_635114 ) ) ( not ( = ?auto_635098 ?auto_635099 ) ) ( not ( = ?auto_635098 ?auto_635100 ) ) ( not ( = ?auto_635098 ?auto_635101 ) ) ( not ( = ?auto_635098 ?auto_635102 ) ) ( not ( = ?auto_635098 ?auto_635103 ) ) ( not ( = ?auto_635098 ?auto_635104 ) ) ( not ( = ?auto_635098 ?auto_635105 ) ) ( not ( = ?auto_635098 ?auto_635106 ) ) ( not ( = ?auto_635098 ?auto_635107 ) ) ( not ( = ?auto_635098 ?auto_635108 ) ) ( not ( = ?auto_635098 ?auto_635109 ) ) ( not ( = ?auto_635098 ?auto_635110 ) ) ( not ( = ?auto_635098 ?auto_635111 ) ) ( not ( = ?auto_635098 ?auto_635112 ) ) ( not ( = ?auto_635098 ?auto_635113 ) ) ( not ( = ?auto_635098 ?auto_635114 ) ) ( not ( = ?auto_635099 ?auto_635100 ) ) ( not ( = ?auto_635099 ?auto_635101 ) ) ( not ( = ?auto_635099 ?auto_635102 ) ) ( not ( = ?auto_635099 ?auto_635103 ) ) ( not ( = ?auto_635099 ?auto_635104 ) ) ( not ( = ?auto_635099 ?auto_635105 ) ) ( not ( = ?auto_635099 ?auto_635106 ) ) ( not ( = ?auto_635099 ?auto_635107 ) ) ( not ( = ?auto_635099 ?auto_635108 ) ) ( not ( = ?auto_635099 ?auto_635109 ) ) ( not ( = ?auto_635099 ?auto_635110 ) ) ( not ( = ?auto_635099 ?auto_635111 ) ) ( not ( = ?auto_635099 ?auto_635112 ) ) ( not ( = ?auto_635099 ?auto_635113 ) ) ( not ( = ?auto_635099 ?auto_635114 ) ) ( not ( = ?auto_635100 ?auto_635101 ) ) ( not ( = ?auto_635100 ?auto_635102 ) ) ( not ( = ?auto_635100 ?auto_635103 ) ) ( not ( = ?auto_635100 ?auto_635104 ) ) ( not ( = ?auto_635100 ?auto_635105 ) ) ( not ( = ?auto_635100 ?auto_635106 ) ) ( not ( = ?auto_635100 ?auto_635107 ) ) ( not ( = ?auto_635100 ?auto_635108 ) ) ( not ( = ?auto_635100 ?auto_635109 ) ) ( not ( = ?auto_635100 ?auto_635110 ) ) ( not ( = ?auto_635100 ?auto_635111 ) ) ( not ( = ?auto_635100 ?auto_635112 ) ) ( not ( = ?auto_635100 ?auto_635113 ) ) ( not ( = ?auto_635100 ?auto_635114 ) ) ( not ( = ?auto_635101 ?auto_635102 ) ) ( not ( = ?auto_635101 ?auto_635103 ) ) ( not ( = ?auto_635101 ?auto_635104 ) ) ( not ( = ?auto_635101 ?auto_635105 ) ) ( not ( = ?auto_635101 ?auto_635106 ) ) ( not ( = ?auto_635101 ?auto_635107 ) ) ( not ( = ?auto_635101 ?auto_635108 ) ) ( not ( = ?auto_635101 ?auto_635109 ) ) ( not ( = ?auto_635101 ?auto_635110 ) ) ( not ( = ?auto_635101 ?auto_635111 ) ) ( not ( = ?auto_635101 ?auto_635112 ) ) ( not ( = ?auto_635101 ?auto_635113 ) ) ( not ( = ?auto_635101 ?auto_635114 ) ) ( not ( = ?auto_635102 ?auto_635103 ) ) ( not ( = ?auto_635102 ?auto_635104 ) ) ( not ( = ?auto_635102 ?auto_635105 ) ) ( not ( = ?auto_635102 ?auto_635106 ) ) ( not ( = ?auto_635102 ?auto_635107 ) ) ( not ( = ?auto_635102 ?auto_635108 ) ) ( not ( = ?auto_635102 ?auto_635109 ) ) ( not ( = ?auto_635102 ?auto_635110 ) ) ( not ( = ?auto_635102 ?auto_635111 ) ) ( not ( = ?auto_635102 ?auto_635112 ) ) ( not ( = ?auto_635102 ?auto_635113 ) ) ( not ( = ?auto_635102 ?auto_635114 ) ) ( not ( = ?auto_635103 ?auto_635104 ) ) ( not ( = ?auto_635103 ?auto_635105 ) ) ( not ( = ?auto_635103 ?auto_635106 ) ) ( not ( = ?auto_635103 ?auto_635107 ) ) ( not ( = ?auto_635103 ?auto_635108 ) ) ( not ( = ?auto_635103 ?auto_635109 ) ) ( not ( = ?auto_635103 ?auto_635110 ) ) ( not ( = ?auto_635103 ?auto_635111 ) ) ( not ( = ?auto_635103 ?auto_635112 ) ) ( not ( = ?auto_635103 ?auto_635113 ) ) ( not ( = ?auto_635103 ?auto_635114 ) ) ( not ( = ?auto_635104 ?auto_635105 ) ) ( not ( = ?auto_635104 ?auto_635106 ) ) ( not ( = ?auto_635104 ?auto_635107 ) ) ( not ( = ?auto_635104 ?auto_635108 ) ) ( not ( = ?auto_635104 ?auto_635109 ) ) ( not ( = ?auto_635104 ?auto_635110 ) ) ( not ( = ?auto_635104 ?auto_635111 ) ) ( not ( = ?auto_635104 ?auto_635112 ) ) ( not ( = ?auto_635104 ?auto_635113 ) ) ( not ( = ?auto_635104 ?auto_635114 ) ) ( not ( = ?auto_635105 ?auto_635106 ) ) ( not ( = ?auto_635105 ?auto_635107 ) ) ( not ( = ?auto_635105 ?auto_635108 ) ) ( not ( = ?auto_635105 ?auto_635109 ) ) ( not ( = ?auto_635105 ?auto_635110 ) ) ( not ( = ?auto_635105 ?auto_635111 ) ) ( not ( = ?auto_635105 ?auto_635112 ) ) ( not ( = ?auto_635105 ?auto_635113 ) ) ( not ( = ?auto_635105 ?auto_635114 ) ) ( not ( = ?auto_635106 ?auto_635107 ) ) ( not ( = ?auto_635106 ?auto_635108 ) ) ( not ( = ?auto_635106 ?auto_635109 ) ) ( not ( = ?auto_635106 ?auto_635110 ) ) ( not ( = ?auto_635106 ?auto_635111 ) ) ( not ( = ?auto_635106 ?auto_635112 ) ) ( not ( = ?auto_635106 ?auto_635113 ) ) ( not ( = ?auto_635106 ?auto_635114 ) ) ( not ( = ?auto_635107 ?auto_635108 ) ) ( not ( = ?auto_635107 ?auto_635109 ) ) ( not ( = ?auto_635107 ?auto_635110 ) ) ( not ( = ?auto_635107 ?auto_635111 ) ) ( not ( = ?auto_635107 ?auto_635112 ) ) ( not ( = ?auto_635107 ?auto_635113 ) ) ( not ( = ?auto_635107 ?auto_635114 ) ) ( not ( = ?auto_635108 ?auto_635109 ) ) ( not ( = ?auto_635108 ?auto_635110 ) ) ( not ( = ?auto_635108 ?auto_635111 ) ) ( not ( = ?auto_635108 ?auto_635112 ) ) ( not ( = ?auto_635108 ?auto_635113 ) ) ( not ( = ?auto_635108 ?auto_635114 ) ) ( not ( = ?auto_635109 ?auto_635110 ) ) ( not ( = ?auto_635109 ?auto_635111 ) ) ( not ( = ?auto_635109 ?auto_635112 ) ) ( not ( = ?auto_635109 ?auto_635113 ) ) ( not ( = ?auto_635109 ?auto_635114 ) ) ( not ( = ?auto_635110 ?auto_635111 ) ) ( not ( = ?auto_635110 ?auto_635112 ) ) ( not ( = ?auto_635110 ?auto_635113 ) ) ( not ( = ?auto_635110 ?auto_635114 ) ) ( not ( = ?auto_635111 ?auto_635112 ) ) ( not ( = ?auto_635111 ?auto_635113 ) ) ( not ( = ?auto_635111 ?auto_635114 ) ) ( not ( = ?auto_635112 ?auto_635113 ) ) ( not ( = ?auto_635112 ?auto_635114 ) ) ( not ( = ?auto_635113 ?auto_635114 ) ) ( ON ?auto_635112 ?auto_635113 ) ( ON ?auto_635111 ?auto_635112 ) ( ON ?auto_635110 ?auto_635111 ) ( ON ?auto_635109 ?auto_635110 ) ( ON ?auto_635108 ?auto_635109 ) ( ON ?auto_635107 ?auto_635108 ) ( ON ?auto_635106 ?auto_635107 ) ( ON ?auto_635105 ?auto_635106 ) ( ON ?auto_635104 ?auto_635105 ) ( ON ?auto_635103 ?auto_635104 ) ( ON ?auto_635102 ?auto_635103 ) ( ON ?auto_635101 ?auto_635102 ) ( ON ?auto_635100 ?auto_635101 ) ( ON ?auto_635099 ?auto_635100 ) ( ON ?auto_635098 ?auto_635099 ) ( ON ?auto_635097 ?auto_635098 ) ( CLEAR ?auto_635097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635097 )
      ( MAKE-17PILE ?auto_635097 ?auto_635098 ?auto_635099 ?auto_635100 ?auto_635101 ?auto_635102 ?auto_635103 ?auto_635104 ?auto_635105 ?auto_635106 ?auto_635107 ?auto_635108 ?auto_635109 ?auto_635110 ?auto_635111 ?auto_635112 ?auto_635113 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_635132 - BLOCK
      ?auto_635133 - BLOCK
      ?auto_635134 - BLOCK
      ?auto_635135 - BLOCK
      ?auto_635136 - BLOCK
      ?auto_635137 - BLOCK
      ?auto_635138 - BLOCK
      ?auto_635139 - BLOCK
      ?auto_635140 - BLOCK
      ?auto_635141 - BLOCK
      ?auto_635142 - BLOCK
      ?auto_635143 - BLOCK
      ?auto_635144 - BLOCK
      ?auto_635145 - BLOCK
      ?auto_635146 - BLOCK
      ?auto_635147 - BLOCK
      ?auto_635148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_635148 ) ( not ( = ?auto_635132 ?auto_635133 ) ) ( not ( = ?auto_635132 ?auto_635134 ) ) ( not ( = ?auto_635132 ?auto_635135 ) ) ( not ( = ?auto_635132 ?auto_635136 ) ) ( not ( = ?auto_635132 ?auto_635137 ) ) ( not ( = ?auto_635132 ?auto_635138 ) ) ( not ( = ?auto_635132 ?auto_635139 ) ) ( not ( = ?auto_635132 ?auto_635140 ) ) ( not ( = ?auto_635132 ?auto_635141 ) ) ( not ( = ?auto_635132 ?auto_635142 ) ) ( not ( = ?auto_635132 ?auto_635143 ) ) ( not ( = ?auto_635132 ?auto_635144 ) ) ( not ( = ?auto_635132 ?auto_635145 ) ) ( not ( = ?auto_635132 ?auto_635146 ) ) ( not ( = ?auto_635132 ?auto_635147 ) ) ( not ( = ?auto_635132 ?auto_635148 ) ) ( not ( = ?auto_635133 ?auto_635134 ) ) ( not ( = ?auto_635133 ?auto_635135 ) ) ( not ( = ?auto_635133 ?auto_635136 ) ) ( not ( = ?auto_635133 ?auto_635137 ) ) ( not ( = ?auto_635133 ?auto_635138 ) ) ( not ( = ?auto_635133 ?auto_635139 ) ) ( not ( = ?auto_635133 ?auto_635140 ) ) ( not ( = ?auto_635133 ?auto_635141 ) ) ( not ( = ?auto_635133 ?auto_635142 ) ) ( not ( = ?auto_635133 ?auto_635143 ) ) ( not ( = ?auto_635133 ?auto_635144 ) ) ( not ( = ?auto_635133 ?auto_635145 ) ) ( not ( = ?auto_635133 ?auto_635146 ) ) ( not ( = ?auto_635133 ?auto_635147 ) ) ( not ( = ?auto_635133 ?auto_635148 ) ) ( not ( = ?auto_635134 ?auto_635135 ) ) ( not ( = ?auto_635134 ?auto_635136 ) ) ( not ( = ?auto_635134 ?auto_635137 ) ) ( not ( = ?auto_635134 ?auto_635138 ) ) ( not ( = ?auto_635134 ?auto_635139 ) ) ( not ( = ?auto_635134 ?auto_635140 ) ) ( not ( = ?auto_635134 ?auto_635141 ) ) ( not ( = ?auto_635134 ?auto_635142 ) ) ( not ( = ?auto_635134 ?auto_635143 ) ) ( not ( = ?auto_635134 ?auto_635144 ) ) ( not ( = ?auto_635134 ?auto_635145 ) ) ( not ( = ?auto_635134 ?auto_635146 ) ) ( not ( = ?auto_635134 ?auto_635147 ) ) ( not ( = ?auto_635134 ?auto_635148 ) ) ( not ( = ?auto_635135 ?auto_635136 ) ) ( not ( = ?auto_635135 ?auto_635137 ) ) ( not ( = ?auto_635135 ?auto_635138 ) ) ( not ( = ?auto_635135 ?auto_635139 ) ) ( not ( = ?auto_635135 ?auto_635140 ) ) ( not ( = ?auto_635135 ?auto_635141 ) ) ( not ( = ?auto_635135 ?auto_635142 ) ) ( not ( = ?auto_635135 ?auto_635143 ) ) ( not ( = ?auto_635135 ?auto_635144 ) ) ( not ( = ?auto_635135 ?auto_635145 ) ) ( not ( = ?auto_635135 ?auto_635146 ) ) ( not ( = ?auto_635135 ?auto_635147 ) ) ( not ( = ?auto_635135 ?auto_635148 ) ) ( not ( = ?auto_635136 ?auto_635137 ) ) ( not ( = ?auto_635136 ?auto_635138 ) ) ( not ( = ?auto_635136 ?auto_635139 ) ) ( not ( = ?auto_635136 ?auto_635140 ) ) ( not ( = ?auto_635136 ?auto_635141 ) ) ( not ( = ?auto_635136 ?auto_635142 ) ) ( not ( = ?auto_635136 ?auto_635143 ) ) ( not ( = ?auto_635136 ?auto_635144 ) ) ( not ( = ?auto_635136 ?auto_635145 ) ) ( not ( = ?auto_635136 ?auto_635146 ) ) ( not ( = ?auto_635136 ?auto_635147 ) ) ( not ( = ?auto_635136 ?auto_635148 ) ) ( not ( = ?auto_635137 ?auto_635138 ) ) ( not ( = ?auto_635137 ?auto_635139 ) ) ( not ( = ?auto_635137 ?auto_635140 ) ) ( not ( = ?auto_635137 ?auto_635141 ) ) ( not ( = ?auto_635137 ?auto_635142 ) ) ( not ( = ?auto_635137 ?auto_635143 ) ) ( not ( = ?auto_635137 ?auto_635144 ) ) ( not ( = ?auto_635137 ?auto_635145 ) ) ( not ( = ?auto_635137 ?auto_635146 ) ) ( not ( = ?auto_635137 ?auto_635147 ) ) ( not ( = ?auto_635137 ?auto_635148 ) ) ( not ( = ?auto_635138 ?auto_635139 ) ) ( not ( = ?auto_635138 ?auto_635140 ) ) ( not ( = ?auto_635138 ?auto_635141 ) ) ( not ( = ?auto_635138 ?auto_635142 ) ) ( not ( = ?auto_635138 ?auto_635143 ) ) ( not ( = ?auto_635138 ?auto_635144 ) ) ( not ( = ?auto_635138 ?auto_635145 ) ) ( not ( = ?auto_635138 ?auto_635146 ) ) ( not ( = ?auto_635138 ?auto_635147 ) ) ( not ( = ?auto_635138 ?auto_635148 ) ) ( not ( = ?auto_635139 ?auto_635140 ) ) ( not ( = ?auto_635139 ?auto_635141 ) ) ( not ( = ?auto_635139 ?auto_635142 ) ) ( not ( = ?auto_635139 ?auto_635143 ) ) ( not ( = ?auto_635139 ?auto_635144 ) ) ( not ( = ?auto_635139 ?auto_635145 ) ) ( not ( = ?auto_635139 ?auto_635146 ) ) ( not ( = ?auto_635139 ?auto_635147 ) ) ( not ( = ?auto_635139 ?auto_635148 ) ) ( not ( = ?auto_635140 ?auto_635141 ) ) ( not ( = ?auto_635140 ?auto_635142 ) ) ( not ( = ?auto_635140 ?auto_635143 ) ) ( not ( = ?auto_635140 ?auto_635144 ) ) ( not ( = ?auto_635140 ?auto_635145 ) ) ( not ( = ?auto_635140 ?auto_635146 ) ) ( not ( = ?auto_635140 ?auto_635147 ) ) ( not ( = ?auto_635140 ?auto_635148 ) ) ( not ( = ?auto_635141 ?auto_635142 ) ) ( not ( = ?auto_635141 ?auto_635143 ) ) ( not ( = ?auto_635141 ?auto_635144 ) ) ( not ( = ?auto_635141 ?auto_635145 ) ) ( not ( = ?auto_635141 ?auto_635146 ) ) ( not ( = ?auto_635141 ?auto_635147 ) ) ( not ( = ?auto_635141 ?auto_635148 ) ) ( not ( = ?auto_635142 ?auto_635143 ) ) ( not ( = ?auto_635142 ?auto_635144 ) ) ( not ( = ?auto_635142 ?auto_635145 ) ) ( not ( = ?auto_635142 ?auto_635146 ) ) ( not ( = ?auto_635142 ?auto_635147 ) ) ( not ( = ?auto_635142 ?auto_635148 ) ) ( not ( = ?auto_635143 ?auto_635144 ) ) ( not ( = ?auto_635143 ?auto_635145 ) ) ( not ( = ?auto_635143 ?auto_635146 ) ) ( not ( = ?auto_635143 ?auto_635147 ) ) ( not ( = ?auto_635143 ?auto_635148 ) ) ( not ( = ?auto_635144 ?auto_635145 ) ) ( not ( = ?auto_635144 ?auto_635146 ) ) ( not ( = ?auto_635144 ?auto_635147 ) ) ( not ( = ?auto_635144 ?auto_635148 ) ) ( not ( = ?auto_635145 ?auto_635146 ) ) ( not ( = ?auto_635145 ?auto_635147 ) ) ( not ( = ?auto_635145 ?auto_635148 ) ) ( not ( = ?auto_635146 ?auto_635147 ) ) ( not ( = ?auto_635146 ?auto_635148 ) ) ( not ( = ?auto_635147 ?auto_635148 ) ) ( ON ?auto_635147 ?auto_635148 ) ( ON ?auto_635146 ?auto_635147 ) ( ON ?auto_635145 ?auto_635146 ) ( ON ?auto_635144 ?auto_635145 ) ( ON ?auto_635143 ?auto_635144 ) ( ON ?auto_635142 ?auto_635143 ) ( ON ?auto_635141 ?auto_635142 ) ( ON ?auto_635140 ?auto_635141 ) ( ON ?auto_635139 ?auto_635140 ) ( ON ?auto_635138 ?auto_635139 ) ( ON ?auto_635137 ?auto_635138 ) ( ON ?auto_635136 ?auto_635137 ) ( ON ?auto_635135 ?auto_635136 ) ( ON ?auto_635134 ?auto_635135 ) ( ON ?auto_635133 ?auto_635134 ) ( ON ?auto_635132 ?auto_635133 ) ( CLEAR ?auto_635132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_635132 )
      ( MAKE-17PILE ?auto_635132 ?auto_635133 ?auto_635134 ?auto_635135 ?auto_635136 ?auto_635137 ?auto_635138 ?auto_635139 ?auto_635140 ?auto_635141 ?auto_635142 ?auto_635143 ?auto_635144 ?auto_635145 ?auto_635146 ?auto_635147 ?auto_635148 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_635166 - BLOCK
      ?auto_635167 - BLOCK
      ?auto_635168 - BLOCK
      ?auto_635169 - BLOCK
      ?auto_635170 - BLOCK
      ?auto_635171 - BLOCK
      ?auto_635172 - BLOCK
      ?auto_635173 - BLOCK
      ?auto_635174 - BLOCK
      ?auto_635175 - BLOCK
      ?auto_635176 - BLOCK
      ?auto_635177 - BLOCK
      ?auto_635178 - BLOCK
      ?auto_635179 - BLOCK
      ?auto_635180 - BLOCK
      ?auto_635181 - BLOCK
      ?auto_635182 - BLOCK
    )
    :vars
    (
      ?auto_635183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_635166 ?auto_635167 ) ) ( not ( = ?auto_635166 ?auto_635168 ) ) ( not ( = ?auto_635166 ?auto_635169 ) ) ( not ( = ?auto_635166 ?auto_635170 ) ) ( not ( = ?auto_635166 ?auto_635171 ) ) ( not ( = ?auto_635166 ?auto_635172 ) ) ( not ( = ?auto_635166 ?auto_635173 ) ) ( not ( = ?auto_635166 ?auto_635174 ) ) ( not ( = ?auto_635166 ?auto_635175 ) ) ( not ( = ?auto_635166 ?auto_635176 ) ) ( not ( = ?auto_635166 ?auto_635177 ) ) ( not ( = ?auto_635166 ?auto_635178 ) ) ( not ( = ?auto_635166 ?auto_635179 ) ) ( not ( = ?auto_635166 ?auto_635180 ) ) ( not ( = ?auto_635166 ?auto_635181 ) ) ( not ( = ?auto_635166 ?auto_635182 ) ) ( not ( = ?auto_635167 ?auto_635168 ) ) ( not ( = ?auto_635167 ?auto_635169 ) ) ( not ( = ?auto_635167 ?auto_635170 ) ) ( not ( = ?auto_635167 ?auto_635171 ) ) ( not ( = ?auto_635167 ?auto_635172 ) ) ( not ( = ?auto_635167 ?auto_635173 ) ) ( not ( = ?auto_635167 ?auto_635174 ) ) ( not ( = ?auto_635167 ?auto_635175 ) ) ( not ( = ?auto_635167 ?auto_635176 ) ) ( not ( = ?auto_635167 ?auto_635177 ) ) ( not ( = ?auto_635167 ?auto_635178 ) ) ( not ( = ?auto_635167 ?auto_635179 ) ) ( not ( = ?auto_635167 ?auto_635180 ) ) ( not ( = ?auto_635167 ?auto_635181 ) ) ( not ( = ?auto_635167 ?auto_635182 ) ) ( not ( = ?auto_635168 ?auto_635169 ) ) ( not ( = ?auto_635168 ?auto_635170 ) ) ( not ( = ?auto_635168 ?auto_635171 ) ) ( not ( = ?auto_635168 ?auto_635172 ) ) ( not ( = ?auto_635168 ?auto_635173 ) ) ( not ( = ?auto_635168 ?auto_635174 ) ) ( not ( = ?auto_635168 ?auto_635175 ) ) ( not ( = ?auto_635168 ?auto_635176 ) ) ( not ( = ?auto_635168 ?auto_635177 ) ) ( not ( = ?auto_635168 ?auto_635178 ) ) ( not ( = ?auto_635168 ?auto_635179 ) ) ( not ( = ?auto_635168 ?auto_635180 ) ) ( not ( = ?auto_635168 ?auto_635181 ) ) ( not ( = ?auto_635168 ?auto_635182 ) ) ( not ( = ?auto_635169 ?auto_635170 ) ) ( not ( = ?auto_635169 ?auto_635171 ) ) ( not ( = ?auto_635169 ?auto_635172 ) ) ( not ( = ?auto_635169 ?auto_635173 ) ) ( not ( = ?auto_635169 ?auto_635174 ) ) ( not ( = ?auto_635169 ?auto_635175 ) ) ( not ( = ?auto_635169 ?auto_635176 ) ) ( not ( = ?auto_635169 ?auto_635177 ) ) ( not ( = ?auto_635169 ?auto_635178 ) ) ( not ( = ?auto_635169 ?auto_635179 ) ) ( not ( = ?auto_635169 ?auto_635180 ) ) ( not ( = ?auto_635169 ?auto_635181 ) ) ( not ( = ?auto_635169 ?auto_635182 ) ) ( not ( = ?auto_635170 ?auto_635171 ) ) ( not ( = ?auto_635170 ?auto_635172 ) ) ( not ( = ?auto_635170 ?auto_635173 ) ) ( not ( = ?auto_635170 ?auto_635174 ) ) ( not ( = ?auto_635170 ?auto_635175 ) ) ( not ( = ?auto_635170 ?auto_635176 ) ) ( not ( = ?auto_635170 ?auto_635177 ) ) ( not ( = ?auto_635170 ?auto_635178 ) ) ( not ( = ?auto_635170 ?auto_635179 ) ) ( not ( = ?auto_635170 ?auto_635180 ) ) ( not ( = ?auto_635170 ?auto_635181 ) ) ( not ( = ?auto_635170 ?auto_635182 ) ) ( not ( = ?auto_635171 ?auto_635172 ) ) ( not ( = ?auto_635171 ?auto_635173 ) ) ( not ( = ?auto_635171 ?auto_635174 ) ) ( not ( = ?auto_635171 ?auto_635175 ) ) ( not ( = ?auto_635171 ?auto_635176 ) ) ( not ( = ?auto_635171 ?auto_635177 ) ) ( not ( = ?auto_635171 ?auto_635178 ) ) ( not ( = ?auto_635171 ?auto_635179 ) ) ( not ( = ?auto_635171 ?auto_635180 ) ) ( not ( = ?auto_635171 ?auto_635181 ) ) ( not ( = ?auto_635171 ?auto_635182 ) ) ( not ( = ?auto_635172 ?auto_635173 ) ) ( not ( = ?auto_635172 ?auto_635174 ) ) ( not ( = ?auto_635172 ?auto_635175 ) ) ( not ( = ?auto_635172 ?auto_635176 ) ) ( not ( = ?auto_635172 ?auto_635177 ) ) ( not ( = ?auto_635172 ?auto_635178 ) ) ( not ( = ?auto_635172 ?auto_635179 ) ) ( not ( = ?auto_635172 ?auto_635180 ) ) ( not ( = ?auto_635172 ?auto_635181 ) ) ( not ( = ?auto_635172 ?auto_635182 ) ) ( not ( = ?auto_635173 ?auto_635174 ) ) ( not ( = ?auto_635173 ?auto_635175 ) ) ( not ( = ?auto_635173 ?auto_635176 ) ) ( not ( = ?auto_635173 ?auto_635177 ) ) ( not ( = ?auto_635173 ?auto_635178 ) ) ( not ( = ?auto_635173 ?auto_635179 ) ) ( not ( = ?auto_635173 ?auto_635180 ) ) ( not ( = ?auto_635173 ?auto_635181 ) ) ( not ( = ?auto_635173 ?auto_635182 ) ) ( not ( = ?auto_635174 ?auto_635175 ) ) ( not ( = ?auto_635174 ?auto_635176 ) ) ( not ( = ?auto_635174 ?auto_635177 ) ) ( not ( = ?auto_635174 ?auto_635178 ) ) ( not ( = ?auto_635174 ?auto_635179 ) ) ( not ( = ?auto_635174 ?auto_635180 ) ) ( not ( = ?auto_635174 ?auto_635181 ) ) ( not ( = ?auto_635174 ?auto_635182 ) ) ( not ( = ?auto_635175 ?auto_635176 ) ) ( not ( = ?auto_635175 ?auto_635177 ) ) ( not ( = ?auto_635175 ?auto_635178 ) ) ( not ( = ?auto_635175 ?auto_635179 ) ) ( not ( = ?auto_635175 ?auto_635180 ) ) ( not ( = ?auto_635175 ?auto_635181 ) ) ( not ( = ?auto_635175 ?auto_635182 ) ) ( not ( = ?auto_635176 ?auto_635177 ) ) ( not ( = ?auto_635176 ?auto_635178 ) ) ( not ( = ?auto_635176 ?auto_635179 ) ) ( not ( = ?auto_635176 ?auto_635180 ) ) ( not ( = ?auto_635176 ?auto_635181 ) ) ( not ( = ?auto_635176 ?auto_635182 ) ) ( not ( = ?auto_635177 ?auto_635178 ) ) ( not ( = ?auto_635177 ?auto_635179 ) ) ( not ( = ?auto_635177 ?auto_635180 ) ) ( not ( = ?auto_635177 ?auto_635181 ) ) ( not ( = ?auto_635177 ?auto_635182 ) ) ( not ( = ?auto_635178 ?auto_635179 ) ) ( not ( = ?auto_635178 ?auto_635180 ) ) ( not ( = ?auto_635178 ?auto_635181 ) ) ( not ( = ?auto_635178 ?auto_635182 ) ) ( not ( = ?auto_635179 ?auto_635180 ) ) ( not ( = ?auto_635179 ?auto_635181 ) ) ( not ( = ?auto_635179 ?auto_635182 ) ) ( not ( = ?auto_635180 ?auto_635181 ) ) ( not ( = ?auto_635180 ?auto_635182 ) ) ( not ( = ?auto_635181 ?auto_635182 ) ) ( ON ?auto_635166 ?auto_635183 ) ( not ( = ?auto_635182 ?auto_635183 ) ) ( not ( = ?auto_635181 ?auto_635183 ) ) ( not ( = ?auto_635180 ?auto_635183 ) ) ( not ( = ?auto_635179 ?auto_635183 ) ) ( not ( = ?auto_635178 ?auto_635183 ) ) ( not ( = ?auto_635177 ?auto_635183 ) ) ( not ( = ?auto_635176 ?auto_635183 ) ) ( not ( = ?auto_635175 ?auto_635183 ) ) ( not ( = ?auto_635174 ?auto_635183 ) ) ( not ( = ?auto_635173 ?auto_635183 ) ) ( not ( = ?auto_635172 ?auto_635183 ) ) ( not ( = ?auto_635171 ?auto_635183 ) ) ( not ( = ?auto_635170 ?auto_635183 ) ) ( not ( = ?auto_635169 ?auto_635183 ) ) ( not ( = ?auto_635168 ?auto_635183 ) ) ( not ( = ?auto_635167 ?auto_635183 ) ) ( not ( = ?auto_635166 ?auto_635183 ) ) ( ON ?auto_635167 ?auto_635166 ) ( ON ?auto_635168 ?auto_635167 ) ( ON ?auto_635169 ?auto_635168 ) ( ON ?auto_635170 ?auto_635169 ) ( ON ?auto_635171 ?auto_635170 ) ( ON ?auto_635172 ?auto_635171 ) ( ON ?auto_635173 ?auto_635172 ) ( ON ?auto_635174 ?auto_635173 ) ( ON ?auto_635175 ?auto_635174 ) ( ON ?auto_635176 ?auto_635175 ) ( ON ?auto_635177 ?auto_635176 ) ( ON ?auto_635178 ?auto_635177 ) ( ON ?auto_635179 ?auto_635178 ) ( ON ?auto_635180 ?auto_635179 ) ( ON ?auto_635181 ?auto_635180 ) ( ON ?auto_635182 ?auto_635181 ) ( CLEAR ?auto_635182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_635182 ?auto_635181 ?auto_635180 ?auto_635179 ?auto_635178 ?auto_635177 ?auto_635176 ?auto_635175 ?auto_635174 ?auto_635173 ?auto_635172 ?auto_635171 ?auto_635170 ?auto_635169 ?auto_635168 ?auto_635167 ?auto_635166 )
      ( MAKE-17PILE ?auto_635166 ?auto_635167 ?auto_635168 ?auto_635169 ?auto_635170 ?auto_635171 ?auto_635172 ?auto_635173 ?auto_635174 ?auto_635175 ?auto_635176 ?auto_635177 ?auto_635178 ?auto_635179 ?auto_635180 ?auto_635181 ?auto_635182 ) )
  )

)

