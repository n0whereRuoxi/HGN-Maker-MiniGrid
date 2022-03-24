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
      ?auto_724753 - BLOCK
    )
    :vars
    (
      ?auto_724754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724753 ?auto_724754 ) ( CLEAR ?auto_724753 ) ( HAND-EMPTY ) ( not ( = ?auto_724753 ?auto_724754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_724753 ?auto_724754 )
      ( !PUTDOWN ?auto_724753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_724760 - BLOCK
      ?auto_724761 - BLOCK
    )
    :vars
    (
      ?auto_724762 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_724760 ) ( ON ?auto_724761 ?auto_724762 ) ( CLEAR ?auto_724761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_724760 ) ( not ( = ?auto_724760 ?auto_724761 ) ) ( not ( = ?auto_724760 ?auto_724762 ) ) ( not ( = ?auto_724761 ?auto_724762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_724761 ?auto_724762 )
      ( !STACK ?auto_724761 ?auto_724760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_724770 - BLOCK
      ?auto_724771 - BLOCK
    )
    :vars
    (
      ?auto_724772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724771 ?auto_724772 ) ( not ( = ?auto_724770 ?auto_724771 ) ) ( not ( = ?auto_724770 ?auto_724772 ) ) ( not ( = ?auto_724771 ?auto_724772 ) ) ( ON ?auto_724770 ?auto_724771 ) ( CLEAR ?auto_724770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724770 )
      ( MAKE-2PILE ?auto_724770 ?auto_724771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_724781 - BLOCK
      ?auto_724782 - BLOCK
      ?auto_724783 - BLOCK
    )
    :vars
    (
      ?auto_724784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_724782 ) ( ON ?auto_724783 ?auto_724784 ) ( CLEAR ?auto_724783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_724781 ) ( ON ?auto_724782 ?auto_724781 ) ( not ( = ?auto_724781 ?auto_724782 ) ) ( not ( = ?auto_724781 ?auto_724783 ) ) ( not ( = ?auto_724781 ?auto_724784 ) ) ( not ( = ?auto_724782 ?auto_724783 ) ) ( not ( = ?auto_724782 ?auto_724784 ) ) ( not ( = ?auto_724783 ?auto_724784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_724783 ?auto_724784 )
      ( !STACK ?auto_724783 ?auto_724782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_724795 - BLOCK
      ?auto_724796 - BLOCK
      ?auto_724797 - BLOCK
    )
    :vars
    (
      ?auto_724798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724797 ?auto_724798 ) ( ON-TABLE ?auto_724795 ) ( not ( = ?auto_724795 ?auto_724796 ) ) ( not ( = ?auto_724795 ?auto_724797 ) ) ( not ( = ?auto_724795 ?auto_724798 ) ) ( not ( = ?auto_724796 ?auto_724797 ) ) ( not ( = ?auto_724796 ?auto_724798 ) ) ( not ( = ?auto_724797 ?auto_724798 ) ) ( CLEAR ?auto_724795 ) ( ON ?auto_724796 ?auto_724797 ) ( CLEAR ?auto_724796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_724795 ?auto_724796 )
      ( MAKE-3PILE ?auto_724795 ?auto_724796 ?auto_724797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_724809 - BLOCK
      ?auto_724810 - BLOCK
      ?auto_724811 - BLOCK
    )
    :vars
    (
      ?auto_724812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724811 ?auto_724812 ) ( not ( = ?auto_724809 ?auto_724810 ) ) ( not ( = ?auto_724809 ?auto_724811 ) ) ( not ( = ?auto_724809 ?auto_724812 ) ) ( not ( = ?auto_724810 ?auto_724811 ) ) ( not ( = ?auto_724810 ?auto_724812 ) ) ( not ( = ?auto_724811 ?auto_724812 ) ) ( ON ?auto_724810 ?auto_724811 ) ( ON ?auto_724809 ?auto_724810 ) ( CLEAR ?auto_724809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724809 )
      ( MAKE-3PILE ?auto_724809 ?auto_724810 ?auto_724811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_724824 - BLOCK
      ?auto_724825 - BLOCK
      ?auto_724826 - BLOCK
      ?auto_724827 - BLOCK
    )
    :vars
    (
      ?auto_724828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_724826 ) ( ON ?auto_724827 ?auto_724828 ) ( CLEAR ?auto_724827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_724824 ) ( ON ?auto_724825 ?auto_724824 ) ( ON ?auto_724826 ?auto_724825 ) ( not ( = ?auto_724824 ?auto_724825 ) ) ( not ( = ?auto_724824 ?auto_724826 ) ) ( not ( = ?auto_724824 ?auto_724827 ) ) ( not ( = ?auto_724824 ?auto_724828 ) ) ( not ( = ?auto_724825 ?auto_724826 ) ) ( not ( = ?auto_724825 ?auto_724827 ) ) ( not ( = ?auto_724825 ?auto_724828 ) ) ( not ( = ?auto_724826 ?auto_724827 ) ) ( not ( = ?auto_724826 ?auto_724828 ) ) ( not ( = ?auto_724827 ?auto_724828 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_724827 ?auto_724828 )
      ( !STACK ?auto_724827 ?auto_724826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_724842 - BLOCK
      ?auto_724843 - BLOCK
      ?auto_724844 - BLOCK
      ?auto_724845 - BLOCK
    )
    :vars
    (
      ?auto_724846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724845 ?auto_724846 ) ( ON-TABLE ?auto_724842 ) ( ON ?auto_724843 ?auto_724842 ) ( not ( = ?auto_724842 ?auto_724843 ) ) ( not ( = ?auto_724842 ?auto_724844 ) ) ( not ( = ?auto_724842 ?auto_724845 ) ) ( not ( = ?auto_724842 ?auto_724846 ) ) ( not ( = ?auto_724843 ?auto_724844 ) ) ( not ( = ?auto_724843 ?auto_724845 ) ) ( not ( = ?auto_724843 ?auto_724846 ) ) ( not ( = ?auto_724844 ?auto_724845 ) ) ( not ( = ?auto_724844 ?auto_724846 ) ) ( not ( = ?auto_724845 ?auto_724846 ) ) ( CLEAR ?auto_724843 ) ( ON ?auto_724844 ?auto_724845 ) ( CLEAR ?auto_724844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_724842 ?auto_724843 ?auto_724844 )
      ( MAKE-4PILE ?auto_724842 ?auto_724843 ?auto_724844 ?auto_724845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_724860 - BLOCK
      ?auto_724861 - BLOCK
      ?auto_724862 - BLOCK
      ?auto_724863 - BLOCK
    )
    :vars
    (
      ?auto_724864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724863 ?auto_724864 ) ( ON-TABLE ?auto_724860 ) ( not ( = ?auto_724860 ?auto_724861 ) ) ( not ( = ?auto_724860 ?auto_724862 ) ) ( not ( = ?auto_724860 ?auto_724863 ) ) ( not ( = ?auto_724860 ?auto_724864 ) ) ( not ( = ?auto_724861 ?auto_724862 ) ) ( not ( = ?auto_724861 ?auto_724863 ) ) ( not ( = ?auto_724861 ?auto_724864 ) ) ( not ( = ?auto_724862 ?auto_724863 ) ) ( not ( = ?auto_724862 ?auto_724864 ) ) ( not ( = ?auto_724863 ?auto_724864 ) ) ( ON ?auto_724862 ?auto_724863 ) ( CLEAR ?auto_724860 ) ( ON ?auto_724861 ?auto_724862 ) ( CLEAR ?auto_724861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_724860 ?auto_724861 )
      ( MAKE-4PILE ?auto_724860 ?auto_724861 ?auto_724862 ?auto_724863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_724878 - BLOCK
      ?auto_724879 - BLOCK
      ?auto_724880 - BLOCK
      ?auto_724881 - BLOCK
    )
    :vars
    (
      ?auto_724882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724881 ?auto_724882 ) ( not ( = ?auto_724878 ?auto_724879 ) ) ( not ( = ?auto_724878 ?auto_724880 ) ) ( not ( = ?auto_724878 ?auto_724881 ) ) ( not ( = ?auto_724878 ?auto_724882 ) ) ( not ( = ?auto_724879 ?auto_724880 ) ) ( not ( = ?auto_724879 ?auto_724881 ) ) ( not ( = ?auto_724879 ?auto_724882 ) ) ( not ( = ?auto_724880 ?auto_724881 ) ) ( not ( = ?auto_724880 ?auto_724882 ) ) ( not ( = ?auto_724881 ?auto_724882 ) ) ( ON ?auto_724880 ?auto_724881 ) ( ON ?auto_724879 ?auto_724880 ) ( ON ?auto_724878 ?auto_724879 ) ( CLEAR ?auto_724878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724878 )
      ( MAKE-4PILE ?auto_724878 ?auto_724879 ?auto_724880 ?auto_724881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_724897 - BLOCK
      ?auto_724898 - BLOCK
      ?auto_724899 - BLOCK
      ?auto_724900 - BLOCK
      ?auto_724901 - BLOCK
    )
    :vars
    (
      ?auto_724902 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_724900 ) ( ON ?auto_724901 ?auto_724902 ) ( CLEAR ?auto_724901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_724897 ) ( ON ?auto_724898 ?auto_724897 ) ( ON ?auto_724899 ?auto_724898 ) ( ON ?auto_724900 ?auto_724899 ) ( not ( = ?auto_724897 ?auto_724898 ) ) ( not ( = ?auto_724897 ?auto_724899 ) ) ( not ( = ?auto_724897 ?auto_724900 ) ) ( not ( = ?auto_724897 ?auto_724901 ) ) ( not ( = ?auto_724897 ?auto_724902 ) ) ( not ( = ?auto_724898 ?auto_724899 ) ) ( not ( = ?auto_724898 ?auto_724900 ) ) ( not ( = ?auto_724898 ?auto_724901 ) ) ( not ( = ?auto_724898 ?auto_724902 ) ) ( not ( = ?auto_724899 ?auto_724900 ) ) ( not ( = ?auto_724899 ?auto_724901 ) ) ( not ( = ?auto_724899 ?auto_724902 ) ) ( not ( = ?auto_724900 ?auto_724901 ) ) ( not ( = ?auto_724900 ?auto_724902 ) ) ( not ( = ?auto_724901 ?auto_724902 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_724901 ?auto_724902 )
      ( !STACK ?auto_724901 ?auto_724900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_724919 - BLOCK
      ?auto_724920 - BLOCK
      ?auto_724921 - BLOCK
      ?auto_724922 - BLOCK
      ?auto_724923 - BLOCK
    )
    :vars
    (
      ?auto_724924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724923 ?auto_724924 ) ( ON-TABLE ?auto_724919 ) ( ON ?auto_724920 ?auto_724919 ) ( ON ?auto_724921 ?auto_724920 ) ( not ( = ?auto_724919 ?auto_724920 ) ) ( not ( = ?auto_724919 ?auto_724921 ) ) ( not ( = ?auto_724919 ?auto_724922 ) ) ( not ( = ?auto_724919 ?auto_724923 ) ) ( not ( = ?auto_724919 ?auto_724924 ) ) ( not ( = ?auto_724920 ?auto_724921 ) ) ( not ( = ?auto_724920 ?auto_724922 ) ) ( not ( = ?auto_724920 ?auto_724923 ) ) ( not ( = ?auto_724920 ?auto_724924 ) ) ( not ( = ?auto_724921 ?auto_724922 ) ) ( not ( = ?auto_724921 ?auto_724923 ) ) ( not ( = ?auto_724921 ?auto_724924 ) ) ( not ( = ?auto_724922 ?auto_724923 ) ) ( not ( = ?auto_724922 ?auto_724924 ) ) ( not ( = ?auto_724923 ?auto_724924 ) ) ( CLEAR ?auto_724921 ) ( ON ?auto_724922 ?auto_724923 ) ( CLEAR ?auto_724922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_724919 ?auto_724920 ?auto_724921 ?auto_724922 )
      ( MAKE-5PILE ?auto_724919 ?auto_724920 ?auto_724921 ?auto_724922 ?auto_724923 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_724941 - BLOCK
      ?auto_724942 - BLOCK
      ?auto_724943 - BLOCK
      ?auto_724944 - BLOCK
      ?auto_724945 - BLOCK
    )
    :vars
    (
      ?auto_724946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724945 ?auto_724946 ) ( ON-TABLE ?auto_724941 ) ( ON ?auto_724942 ?auto_724941 ) ( not ( = ?auto_724941 ?auto_724942 ) ) ( not ( = ?auto_724941 ?auto_724943 ) ) ( not ( = ?auto_724941 ?auto_724944 ) ) ( not ( = ?auto_724941 ?auto_724945 ) ) ( not ( = ?auto_724941 ?auto_724946 ) ) ( not ( = ?auto_724942 ?auto_724943 ) ) ( not ( = ?auto_724942 ?auto_724944 ) ) ( not ( = ?auto_724942 ?auto_724945 ) ) ( not ( = ?auto_724942 ?auto_724946 ) ) ( not ( = ?auto_724943 ?auto_724944 ) ) ( not ( = ?auto_724943 ?auto_724945 ) ) ( not ( = ?auto_724943 ?auto_724946 ) ) ( not ( = ?auto_724944 ?auto_724945 ) ) ( not ( = ?auto_724944 ?auto_724946 ) ) ( not ( = ?auto_724945 ?auto_724946 ) ) ( ON ?auto_724944 ?auto_724945 ) ( CLEAR ?auto_724942 ) ( ON ?auto_724943 ?auto_724944 ) ( CLEAR ?auto_724943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_724941 ?auto_724942 ?auto_724943 )
      ( MAKE-5PILE ?auto_724941 ?auto_724942 ?auto_724943 ?auto_724944 ?auto_724945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_724963 - BLOCK
      ?auto_724964 - BLOCK
      ?auto_724965 - BLOCK
      ?auto_724966 - BLOCK
      ?auto_724967 - BLOCK
    )
    :vars
    (
      ?auto_724968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724967 ?auto_724968 ) ( ON-TABLE ?auto_724963 ) ( not ( = ?auto_724963 ?auto_724964 ) ) ( not ( = ?auto_724963 ?auto_724965 ) ) ( not ( = ?auto_724963 ?auto_724966 ) ) ( not ( = ?auto_724963 ?auto_724967 ) ) ( not ( = ?auto_724963 ?auto_724968 ) ) ( not ( = ?auto_724964 ?auto_724965 ) ) ( not ( = ?auto_724964 ?auto_724966 ) ) ( not ( = ?auto_724964 ?auto_724967 ) ) ( not ( = ?auto_724964 ?auto_724968 ) ) ( not ( = ?auto_724965 ?auto_724966 ) ) ( not ( = ?auto_724965 ?auto_724967 ) ) ( not ( = ?auto_724965 ?auto_724968 ) ) ( not ( = ?auto_724966 ?auto_724967 ) ) ( not ( = ?auto_724966 ?auto_724968 ) ) ( not ( = ?auto_724967 ?auto_724968 ) ) ( ON ?auto_724966 ?auto_724967 ) ( ON ?auto_724965 ?auto_724966 ) ( CLEAR ?auto_724963 ) ( ON ?auto_724964 ?auto_724965 ) ( CLEAR ?auto_724964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_724963 ?auto_724964 )
      ( MAKE-5PILE ?auto_724963 ?auto_724964 ?auto_724965 ?auto_724966 ?auto_724967 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_724985 - BLOCK
      ?auto_724986 - BLOCK
      ?auto_724987 - BLOCK
      ?auto_724988 - BLOCK
      ?auto_724989 - BLOCK
    )
    :vars
    (
      ?auto_724990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_724989 ?auto_724990 ) ( not ( = ?auto_724985 ?auto_724986 ) ) ( not ( = ?auto_724985 ?auto_724987 ) ) ( not ( = ?auto_724985 ?auto_724988 ) ) ( not ( = ?auto_724985 ?auto_724989 ) ) ( not ( = ?auto_724985 ?auto_724990 ) ) ( not ( = ?auto_724986 ?auto_724987 ) ) ( not ( = ?auto_724986 ?auto_724988 ) ) ( not ( = ?auto_724986 ?auto_724989 ) ) ( not ( = ?auto_724986 ?auto_724990 ) ) ( not ( = ?auto_724987 ?auto_724988 ) ) ( not ( = ?auto_724987 ?auto_724989 ) ) ( not ( = ?auto_724987 ?auto_724990 ) ) ( not ( = ?auto_724988 ?auto_724989 ) ) ( not ( = ?auto_724988 ?auto_724990 ) ) ( not ( = ?auto_724989 ?auto_724990 ) ) ( ON ?auto_724988 ?auto_724989 ) ( ON ?auto_724987 ?auto_724988 ) ( ON ?auto_724986 ?auto_724987 ) ( ON ?auto_724985 ?auto_724986 ) ( CLEAR ?auto_724985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_724985 )
      ( MAKE-5PILE ?auto_724985 ?auto_724986 ?auto_724987 ?auto_724988 ?auto_724989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725008 - BLOCK
      ?auto_725009 - BLOCK
      ?auto_725010 - BLOCK
      ?auto_725011 - BLOCK
      ?auto_725012 - BLOCK
      ?auto_725013 - BLOCK
    )
    :vars
    (
      ?auto_725014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_725012 ) ( ON ?auto_725013 ?auto_725014 ) ( CLEAR ?auto_725013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_725008 ) ( ON ?auto_725009 ?auto_725008 ) ( ON ?auto_725010 ?auto_725009 ) ( ON ?auto_725011 ?auto_725010 ) ( ON ?auto_725012 ?auto_725011 ) ( not ( = ?auto_725008 ?auto_725009 ) ) ( not ( = ?auto_725008 ?auto_725010 ) ) ( not ( = ?auto_725008 ?auto_725011 ) ) ( not ( = ?auto_725008 ?auto_725012 ) ) ( not ( = ?auto_725008 ?auto_725013 ) ) ( not ( = ?auto_725008 ?auto_725014 ) ) ( not ( = ?auto_725009 ?auto_725010 ) ) ( not ( = ?auto_725009 ?auto_725011 ) ) ( not ( = ?auto_725009 ?auto_725012 ) ) ( not ( = ?auto_725009 ?auto_725013 ) ) ( not ( = ?auto_725009 ?auto_725014 ) ) ( not ( = ?auto_725010 ?auto_725011 ) ) ( not ( = ?auto_725010 ?auto_725012 ) ) ( not ( = ?auto_725010 ?auto_725013 ) ) ( not ( = ?auto_725010 ?auto_725014 ) ) ( not ( = ?auto_725011 ?auto_725012 ) ) ( not ( = ?auto_725011 ?auto_725013 ) ) ( not ( = ?auto_725011 ?auto_725014 ) ) ( not ( = ?auto_725012 ?auto_725013 ) ) ( not ( = ?auto_725012 ?auto_725014 ) ) ( not ( = ?auto_725013 ?auto_725014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_725013 ?auto_725014 )
      ( !STACK ?auto_725013 ?auto_725012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725034 - BLOCK
      ?auto_725035 - BLOCK
      ?auto_725036 - BLOCK
      ?auto_725037 - BLOCK
      ?auto_725038 - BLOCK
      ?auto_725039 - BLOCK
    )
    :vars
    (
      ?auto_725040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725039 ?auto_725040 ) ( ON-TABLE ?auto_725034 ) ( ON ?auto_725035 ?auto_725034 ) ( ON ?auto_725036 ?auto_725035 ) ( ON ?auto_725037 ?auto_725036 ) ( not ( = ?auto_725034 ?auto_725035 ) ) ( not ( = ?auto_725034 ?auto_725036 ) ) ( not ( = ?auto_725034 ?auto_725037 ) ) ( not ( = ?auto_725034 ?auto_725038 ) ) ( not ( = ?auto_725034 ?auto_725039 ) ) ( not ( = ?auto_725034 ?auto_725040 ) ) ( not ( = ?auto_725035 ?auto_725036 ) ) ( not ( = ?auto_725035 ?auto_725037 ) ) ( not ( = ?auto_725035 ?auto_725038 ) ) ( not ( = ?auto_725035 ?auto_725039 ) ) ( not ( = ?auto_725035 ?auto_725040 ) ) ( not ( = ?auto_725036 ?auto_725037 ) ) ( not ( = ?auto_725036 ?auto_725038 ) ) ( not ( = ?auto_725036 ?auto_725039 ) ) ( not ( = ?auto_725036 ?auto_725040 ) ) ( not ( = ?auto_725037 ?auto_725038 ) ) ( not ( = ?auto_725037 ?auto_725039 ) ) ( not ( = ?auto_725037 ?auto_725040 ) ) ( not ( = ?auto_725038 ?auto_725039 ) ) ( not ( = ?auto_725038 ?auto_725040 ) ) ( not ( = ?auto_725039 ?auto_725040 ) ) ( CLEAR ?auto_725037 ) ( ON ?auto_725038 ?auto_725039 ) ( CLEAR ?auto_725038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_725034 ?auto_725035 ?auto_725036 ?auto_725037 ?auto_725038 )
      ( MAKE-6PILE ?auto_725034 ?auto_725035 ?auto_725036 ?auto_725037 ?auto_725038 ?auto_725039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725060 - BLOCK
      ?auto_725061 - BLOCK
      ?auto_725062 - BLOCK
      ?auto_725063 - BLOCK
      ?auto_725064 - BLOCK
      ?auto_725065 - BLOCK
    )
    :vars
    (
      ?auto_725066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725065 ?auto_725066 ) ( ON-TABLE ?auto_725060 ) ( ON ?auto_725061 ?auto_725060 ) ( ON ?auto_725062 ?auto_725061 ) ( not ( = ?auto_725060 ?auto_725061 ) ) ( not ( = ?auto_725060 ?auto_725062 ) ) ( not ( = ?auto_725060 ?auto_725063 ) ) ( not ( = ?auto_725060 ?auto_725064 ) ) ( not ( = ?auto_725060 ?auto_725065 ) ) ( not ( = ?auto_725060 ?auto_725066 ) ) ( not ( = ?auto_725061 ?auto_725062 ) ) ( not ( = ?auto_725061 ?auto_725063 ) ) ( not ( = ?auto_725061 ?auto_725064 ) ) ( not ( = ?auto_725061 ?auto_725065 ) ) ( not ( = ?auto_725061 ?auto_725066 ) ) ( not ( = ?auto_725062 ?auto_725063 ) ) ( not ( = ?auto_725062 ?auto_725064 ) ) ( not ( = ?auto_725062 ?auto_725065 ) ) ( not ( = ?auto_725062 ?auto_725066 ) ) ( not ( = ?auto_725063 ?auto_725064 ) ) ( not ( = ?auto_725063 ?auto_725065 ) ) ( not ( = ?auto_725063 ?auto_725066 ) ) ( not ( = ?auto_725064 ?auto_725065 ) ) ( not ( = ?auto_725064 ?auto_725066 ) ) ( not ( = ?auto_725065 ?auto_725066 ) ) ( ON ?auto_725064 ?auto_725065 ) ( CLEAR ?auto_725062 ) ( ON ?auto_725063 ?auto_725064 ) ( CLEAR ?auto_725063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_725060 ?auto_725061 ?auto_725062 ?auto_725063 )
      ( MAKE-6PILE ?auto_725060 ?auto_725061 ?auto_725062 ?auto_725063 ?auto_725064 ?auto_725065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725086 - BLOCK
      ?auto_725087 - BLOCK
      ?auto_725088 - BLOCK
      ?auto_725089 - BLOCK
      ?auto_725090 - BLOCK
      ?auto_725091 - BLOCK
    )
    :vars
    (
      ?auto_725092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725091 ?auto_725092 ) ( ON-TABLE ?auto_725086 ) ( ON ?auto_725087 ?auto_725086 ) ( not ( = ?auto_725086 ?auto_725087 ) ) ( not ( = ?auto_725086 ?auto_725088 ) ) ( not ( = ?auto_725086 ?auto_725089 ) ) ( not ( = ?auto_725086 ?auto_725090 ) ) ( not ( = ?auto_725086 ?auto_725091 ) ) ( not ( = ?auto_725086 ?auto_725092 ) ) ( not ( = ?auto_725087 ?auto_725088 ) ) ( not ( = ?auto_725087 ?auto_725089 ) ) ( not ( = ?auto_725087 ?auto_725090 ) ) ( not ( = ?auto_725087 ?auto_725091 ) ) ( not ( = ?auto_725087 ?auto_725092 ) ) ( not ( = ?auto_725088 ?auto_725089 ) ) ( not ( = ?auto_725088 ?auto_725090 ) ) ( not ( = ?auto_725088 ?auto_725091 ) ) ( not ( = ?auto_725088 ?auto_725092 ) ) ( not ( = ?auto_725089 ?auto_725090 ) ) ( not ( = ?auto_725089 ?auto_725091 ) ) ( not ( = ?auto_725089 ?auto_725092 ) ) ( not ( = ?auto_725090 ?auto_725091 ) ) ( not ( = ?auto_725090 ?auto_725092 ) ) ( not ( = ?auto_725091 ?auto_725092 ) ) ( ON ?auto_725090 ?auto_725091 ) ( ON ?auto_725089 ?auto_725090 ) ( CLEAR ?auto_725087 ) ( ON ?auto_725088 ?auto_725089 ) ( CLEAR ?auto_725088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_725086 ?auto_725087 ?auto_725088 )
      ( MAKE-6PILE ?auto_725086 ?auto_725087 ?auto_725088 ?auto_725089 ?auto_725090 ?auto_725091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725112 - BLOCK
      ?auto_725113 - BLOCK
      ?auto_725114 - BLOCK
      ?auto_725115 - BLOCK
      ?auto_725116 - BLOCK
      ?auto_725117 - BLOCK
    )
    :vars
    (
      ?auto_725118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725117 ?auto_725118 ) ( ON-TABLE ?auto_725112 ) ( not ( = ?auto_725112 ?auto_725113 ) ) ( not ( = ?auto_725112 ?auto_725114 ) ) ( not ( = ?auto_725112 ?auto_725115 ) ) ( not ( = ?auto_725112 ?auto_725116 ) ) ( not ( = ?auto_725112 ?auto_725117 ) ) ( not ( = ?auto_725112 ?auto_725118 ) ) ( not ( = ?auto_725113 ?auto_725114 ) ) ( not ( = ?auto_725113 ?auto_725115 ) ) ( not ( = ?auto_725113 ?auto_725116 ) ) ( not ( = ?auto_725113 ?auto_725117 ) ) ( not ( = ?auto_725113 ?auto_725118 ) ) ( not ( = ?auto_725114 ?auto_725115 ) ) ( not ( = ?auto_725114 ?auto_725116 ) ) ( not ( = ?auto_725114 ?auto_725117 ) ) ( not ( = ?auto_725114 ?auto_725118 ) ) ( not ( = ?auto_725115 ?auto_725116 ) ) ( not ( = ?auto_725115 ?auto_725117 ) ) ( not ( = ?auto_725115 ?auto_725118 ) ) ( not ( = ?auto_725116 ?auto_725117 ) ) ( not ( = ?auto_725116 ?auto_725118 ) ) ( not ( = ?auto_725117 ?auto_725118 ) ) ( ON ?auto_725116 ?auto_725117 ) ( ON ?auto_725115 ?auto_725116 ) ( ON ?auto_725114 ?auto_725115 ) ( CLEAR ?auto_725112 ) ( ON ?auto_725113 ?auto_725114 ) ( CLEAR ?auto_725113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_725112 ?auto_725113 )
      ( MAKE-6PILE ?auto_725112 ?auto_725113 ?auto_725114 ?auto_725115 ?auto_725116 ?auto_725117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_725138 - BLOCK
      ?auto_725139 - BLOCK
      ?auto_725140 - BLOCK
      ?auto_725141 - BLOCK
      ?auto_725142 - BLOCK
      ?auto_725143 - BLOCK
    )
    :vars
    (
      ?auto_725144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725143 ?auto_725144 ) ( not ( = ?auto_725138 ?auto_725139 ) ) ( not ( = ?auto_725138 ?auto_725140 ) ) ( not ( = ?auto_725138 ?auto_725141 ) ) ( not ( = ?auto_725138 ?auto_725142 ) ) ( not ( = ?auto_725138 ?auto_725143 ) ) ( not ( = ?auto_725138 ?auto_725144 ) ) ( not ( = ?auto_725139 ?auto_725140 ) ) ( not ( = ?auto_725139 ?auto_725141 ) ) ( not ( = ?auto_725139 ?auto_725142 ) ) ( not ( = ?auto_725139 ?auto_725143 ) ) ( not ( = ?auto_725139 ?auto_725144 ) ) ( not ( = ?auto_725140 ?auto_725141 ) ) ( not ( = ?auto_725140 ?auto_725142 ) ) ( not ( = ?auto_725140 ?auto_725143 ) ) ( not ( = ?auto_725140 ?auto_725144 ) ) ( not ( = ?auto_725141 ?auto_725142 ) ) ( not ( = ?auto_725141 ?auto_725143 ) ) ( not ( = ?auto_725141 ?auto_725144 ) ) ( not ( = ?auto_725142 ?auto_725143 ) ) ( not ( = ?auto_725142 ?auto_725144 ) ) ( not ( = ?auto_725143 ?auto_725144 ) ) ( ON ?auto_725142 ?auto_725143 ) ( ON ?auto_725141 ?auto_725142 ) ( ON ?auto_725140 ?auto_725141 ) ( ON ?auto_725139 ?auto_725140 ) ( ON ?auto_725138 ?auto_725139 ) ( CLEAR ?auto_725138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_725138 )
      ( MAKE-6PILE ?auto_725138 ?auto_725139 ?auto_725140 ?auto_725141 ?auto_725142 ?auto_725143 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725165 - BLOCK
      ?auto_725166 - BLOCK
      ?auto_725167 - BLOCK
      ?auto_725168 - BLOCK
      ?auto_725169 - BLOCK
      ?auto_725170 - BLOCK
      ?auto_725171 - BLOCK
    )
    :vars
    (
      ?auto_725172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_725170 ) ( ON ?auto_725171 ?auto_725172 ) ( CLEAR ?auto_725171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_725165 ) ( ON ?auto_725166 ?auto_725165 ) ( ON ?auto_725167 ?auto_725166 ) ( ON ?auto_725168 ?auto_725167 ) ( ON ?auto_725169 ?auto_725168 ) ( ON ?auto_725170 ?auto_725169 ) ( not ( = ?auto_725165 ?auto_725166 ) ) ( not ( = ?auto_725165 ?auto_725167 ) ) ( not ( = ?auto_725165 ?auto_725168 ) ) ( not ( = ?auto_725165 ?auto_725169 ) ) ( not ( = ?auto_725165 ?auto_725170 ) ) ( not ( = ?auto_725165 ?auto_725171 ) ) ( not ( = ?auto_725165 ?auto_725172 ) ) ( not ( = ?auto_725166 ?auto_725167 ) ) ( not ( = ?auto_725166 ?auto_725168 ) ) ( not ( = ?auto_725166 ?auto_725169 ) ) ( not ( = ?auto_725166 ?auto_725170 ) ) ( not ( = ?auto_725166 ?auto_725171 ) ) ( not ( = ?auto_725166 ?auto_725172 ) ) ( not ( = ?auto_725167 ?auto_725168 ) ) ( not ( = ?auto_725167 ?auto_725169 ) ) ( not ( = ?auto_725167 ?auto_725170 ) ) ( not ( = ?auto_725167 ?auto_725171 ) ) ( not ( = ?auto_725167 ?auto_725172 ) ) ( not ( = ?auto_725168 ?auto_725169 ) ) ( not ( = ?auto_725168 ?auto_725170 ) ) ( not ( = ?auto_725168 ?auto_725171 ) ) ( not ( = ?auto_725168 ?auto_725172 ) ) ( not ( = ?auto_725169 ?auto_725170 ) ) ( not ( = ?auto_725169 ?auto_725171 ) ) ( not ( = ?auto_725169 ?auto_725172 ) ) ( not ( = ?auto_725170 ?auto_725171 ) ) ( not ( = ?auto_725170 ?auto_725172 ) ) ( not ( = ?auto_725171 ?auto_725172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_725171 ?auto_725172 )
      ( !STACK ?auto_725171 ?auto_725170 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725195 - BLOCK
      ?auto_725196 - BLOCK
      ?auto_725197 - BLOCK
      ?auto_725198 - BLOCK
      ?auto_725199 - BLOCK
      ?auto_725200 - BLOCK
      ?auto_725201 - BLOCK
    )
    :vars
    (
      ?auto_725202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725201 ?auto_725202 ) ( ON-TABLE ?auto_725195 ) ( ON ?auto_725196 ?auto_725195 ) ( ON ?auto_725197 ?auto_725196 ) ( ON ?auto_725198 ?auto_725197 ) ( ON ?auto_725199 ?auto_725198 ) ( not ( = ?auto_725195 ?auto_725196 ) ) ( not ( = ?auto_725195 ?auto_725197 ) ) ( not ( = ?auto_725195 ?auto_725198 ) ) ( not ( = ?auto_725195 ?auto_725199 ) ) ( not ( = ?auto_725195 ?auto_725200 ) ) ( not ( = ?auto_725195 ?auto_725201 ) ) ( not ( = ?auto_725195 ?auto_725202 ) ) ( not ( = ?auto_725196 ?auto_725197 ) ) ( not ( = ?auto_725196 ?auto_725198 ) ) ( not ( = ?auto_725196 ?auto_725199 ) ) ( not ( = ?auto_725196 ?auto_725200 ) ) ( not ( = ?auto_725196 ?auto_725201 ) ) ( not ( = ?auto_725196 ?auto_725202 ) ) ( not ( = ?auto_725197 ?auto_725198 ) ) ( not ( = ?auto_725197 ?auto_725199 ) ) ( not ( = ?auto_725197 ?auto_725200 ) ) ( not ( = ?auto_725197 ?auto_725201 ) ) ( not ( = ?auto_725197 ?auto_725202 ) ) ( not ( = ?auto_725198 ?auto_725199 ) ) ( not ( = ?auto_725198 ?auto_725200 ) ) ( not ( = ?auto_725198 ?auto_725201 ) ) ( not ( = ?auto_725198 ?auto_725202 ) ) ( not ( = ?auto_725199 ?auto_725200 ) ) ( not ( = ?auto_725199 ?auto_725201 ) ) ( not ( = ?auto_725199 ?auto_725202 ) ) ( not ( = ?auto_725200 ?auto_725201 ) ) ( not ( = ?auto_725200 ?auto_725202 ) ) ( not ( = ?auto_725201 ?auto_725202 ) ) ( CLEAR ?auto_725199 ) ( ON ?auto_725200 ?auto_725201 ) ( CLEAR ?auto_725200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_725195 ?auto_725196 ?auto_725197 ?auto_725198 ?auto_725199 ?auto_725200 )
      ( MAKE-7PILE ?auto_725195 ?auto_725196 ?auto_725197 ?auto_725198 ?auto_725199 ?auto_725200 ?auto_725201 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725225 - BLOCK
      ?auto_725226 - BLOCK
      ?auto_725227 - BLOCK
      ?auto_725228 - BLOCK
      ?auto_725229 - BLOCK
      ?auto_725230 - BLOCK
      ?auto_725231 - BLOCK
    )
    :vars
    (
      ?auto_725232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725231 ?auto_725232 ) ( ON-TABLE ?auto_725225 ) ( ON ?auto_725226 ?auto_725225 ) ( ON ?auto_725227 ?auto_725226 ) ( ON ?auto_725228 ?auto_725227 ) ( not ( = ?auto_725225 ?auto_725226 ) ) ( not ( = ?auto_725225 ?auto_725227 ) ) ( not ( = ?auto_725225 ?auto_725228 ) ) ( not ( = ?auto_725225 ?auto_725229 ) ) ( not ( = ?auto_725225 ?auto_725230 ) ) ( not ( = ?auto_725225 ?auto_725231 ) ) ( not ( = ?auto_725225 ?auto_725232 ) ) ( not ( = ?auto_725226 ?auto_725227 ) ) ( not ( = ?auto_725226 ?auto_725228 ) ) ( not ( = ?auto_725226 ?auto_725229 ) ) ( not ( = ?auto_725226 ?auto_725230 ) ) ( not ( = ?auto_725226 ?auto_725231 ) ) ( not ( = ?auto_725226 ?auto_725232 ) ) ( not ( = ?auto_725227 ?auto_725228 ) ) ( not ( = ?auto_725227 ?auto_725229 ) ) ( not ( = ?auto_725227 ?auto_725230 ) ) ( not ( = ?auto_725227 ?auto_725231 ) ) ( not ( = ?auto_725227 ?auto_725232 ) ) ( not ( = ?auto_725228 ?auto_725229 ) ) ( not ( = ?auto_725228 ?auto_725230 ) ) ( not ( = ?auto_725228 ?auto_725231 ) ) ( not ( = ?auto_725228 ?auto_725232 ) ) ( not ( = ?auto_725229 ?auto_725230 ) ) ( not ( = ?auto_725229 ?auto_725231 ) ) ( not ( = ?auto_725229 ?auto_725232 ) ) ( not ( = ?auto_725230 ?auto_725231 ) ) ( not ( = ?auto_725230 ?auto_725232 ) ) ( not ( = ?auto_725231 ?auto_725232 ) ) ( ON ?auto_725230 ?auto_725231 ) ( CLEAR ?auto_725228 ) ( ON ?auto_725229 ?auto_725230 ) ( CLEAR ?auto_725229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_725225 ?auto_725226 ?auto_725227 ?auto_725228 ?auto_725229 )
      ( MAKE-7PILE ?auto_725225 ?auto_725226 ?auto_725227 ?auto_725228 ?auto_725229 ?auto_725230 ?auto_725231 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725255 - BLOCK
      ?auto_725256 - BLOCK
      ?auto_725257 - BLOCK
      ?auto_725258 - BLOCK
      ?auto_725259 - BLOCK
      ?auto_725260 - BLOCK
      ?auto_725261 - BLOCK
    )
    :vars
    (
      ?auto_725262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725261 ?auto_725262 ) ( ON-TABLE ?auto_725255 ) ( ON ?auto_725256 ?auto_725255 ) ( ON ?auto_725257 ?auto_725256 ) ( not ( = ?auto_725255 ?auto_725256 ) ) ( not ( = ?auto_725255 ?auto_725257 ) ) ( not ( = ?auto_725255 ?auto_725258 ) ) ( not ( = ?auto_725255 ?auto_725259 ) ) ( not ( = ?auto_725255 ?auto_725260 ) ) ( not ( = ?auto_725255 ?auto_725261 ) ) ( not ( = ?auto_725255 ?auto_725262 ) ) ( not ( = ?auto_725256 ?auto_725257 ) ) ( not ( = ?auto_725256 ?auto_725258 ) ) ( not ( = ?auto_725256 ?auto_725259 ) ) ( not ( = ?auto_725256 ?auto_725260 ) ) ( not ( = ?auto_725256 ?auto_725261 ) ) ( not ( = ?auto_725256 ?auto_725262 ) ) ( not ( = ?auto_725257 ?auto_725258 ) ) ( not ( = ?auto_725257 ?auto_725259 ) ) ( not ( = ?auto_725257 ?auto_725260 ) ) ( not ( = ?auto_725257 ?auto_725261 ) ) ( not ( = ?auto_725257 ?auto_725262 ) ) ( not ( = ?auto_725258 ?auto_725259 ) ) ( not ( = ?auto_725258 ?auto_725260 ) ) ( not ( = ?auto_725258 ?auto_725261 ) ) ( not ( = ?auto_725258 ?auto_725262 ) ) ( not ( = ?auto_725259 ?auto_725260 ) ) ( not ( = ?auto_725259 ?auto_725261 ) ) ( not ( = ?auto_725259 ?auto_725262 ) ) ( not ( = ?auto_725260 ?auto_725261 ) ) ( not ( = ?auto_725260 ?auto_725262 ) ) ( not ( = ?auto_725261 ?auto_725262 ) ) ( ON ?auto_725260 ?auto_725261 ) ( ON ?auto_725259 ?auto_725260 ) ( CLEAR ?auto_725257 ) ( ON ?auto_725258 ?auto_725259 ) ( CLEAR ?auto_725258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_725255 ?auto_725256 ?auto_725257 ?auto_725258 )
      ( MAKE-7PILE ?auto_725255 ?auto_725256 ?auto_725257 ?auto_725258 ?auto_725259 ?auto_725260 ?auto_725261 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725285 - BLOCK
      ?auto_725286 - BLOCK
      ?auto_725287 - BLOCK
      ?auto_725288 - BLOCK
      ?auto_725289 - BLOCK
      ?auto_725290 - BLOCK
      ?auto_725291 - BLOCK
    )
    :vars
    (
      ?auto_725292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725291 ?auto_725292 ) ( ON-TABLE ?auto_725285 ) ( ON ?auto_725286 ?auto_725285 ) ( not ( = ?auto_725285 ?auto_725286 ) ) ( not ( = ?auto_725285 ?auto_725287 ) ) ( not ( = ?auto_725285 ?auto_725288 ) ) ( not ( = ?auto_725285 ?auto_725289 ) ) ( not ( = ?auto_725285 ?auto_725290 ) ) ( not ( = ?auto_725285 ?auto_725291 ) ) ( not ( = ?auto_725285 ?auto_725292 ) ) ( not ( = ?auto_725286 ?auto_725287 ) ) ( not ( = ?auto_725286 ?auto_725288 ) ) ( not ( = ?auto_725286 ?auto_725289 ) ) ( not ( = ?auto_725286 ?auto_725290 ) ) ( not ( = ?auto_725286 ?auto_725291 ) ) ( not ( = ?auto_725286 ?auto_725292 ) ) ( not ( = ?auto_725287 ?auto_725288 ) ) ( not ( = ?auto_725287 ?auto_725289 ) ) ( not ( = ?auto_725287 ?auto_725290 ) ) ( not ( = ?auto_725287 ?auto_725291 ) ) ( not ( = ?auto_725287 ?auto_725292 ) ) ( not ( = ?auto_725288 ?auto_725289 ) ) ( not ( = ?auto_725288 ?auto_725290 ) ) ( not ( = ?auto_725288 ?auto_725291 ) ) ( not ( = ?auto_725288 ?auto_725292 ) ) ( not ( = ?auto_725289 ?auto_725290 ) ) ( not ( = ?auto_725289 ?auto_725291 ) ) ( not ( = ?auto_725289 ?auto_725292 ) ) ( not ( = ?auto_725290 ?auto_725291 ) ) ( not ( = ?auto_725290 ?auto_725292 ) ) ( not ( = ?auto_725291 ?auto_725292 ) ) ( ON ?auto_725290 ?auto_725291 ) ( ON ?auto_725289 ?auto_725290 ) ( ON ?auto_725288 ?auto_725289 ) ( CLEAR ?auto_725286 ) ( ON ?auto_725287 ?auto_725288 ) ( CLEAR ?auto_725287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_725285 ?auto_725286 ?auto_725287 )
      ( MAKE-7PILE ?auto_725285 ?auto_725286 ?auto_725287 ?auto_725288 ?auto_725289 ?auto_725290 ?auto_725291 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725315 - BLOCK
      ?auto_725316 - BLOCK
      ?auto_725317 - BLOCK
      ?auto_725318 - BLOCK
      ?auto_725319 - BLOCK
      ?auto_725320 - BLOCK
      ?auto_725321 - BLOCK
    )
    :vars
    (
      ?auto_725322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725321 ?auto_725322 ) ( ON-TABLE ?auto_725315 ) ( not ( = ?auto_725315 ?auto_725316 ) ) ( not ( = ?auto_725315 ?auto_725317 ) ) ( not ( = ?auto_725315 ?auto_725318 ) ) ( not ( = ?auto_725315 ?auto_725319 ) ) ( not ( = ?auto_725315 ?auto_725320 ) ) ( not ( = ?auto_725315 ?auto_725321 ) ) ( not ( = ?auto_725315 ?auto_725322 ) ) ( not ( = ?auto_725316 ?auto_725317 ) ) ( not ( = ?auto_725316 ?auto_725318 ) ) ( not ( = ?auto_725316 ?auto_725319 ) ) ( not ( = ?auto_725316 ?auto_725320 ) ) ( not ( = ?auto_725316 ?auto_725321 ) ) ( not ( = ?auto_725316 ?auto_725322 ) ) ( not ( = ?auto_725317 ?auto_725318 ) ) ( not ( = ?auto_725317 ?auto_725319 ) ) ( not ( = ?auto_725317 ?auto_725320 ) ) ( not ( = ?auto_725317 ?auto_725321 ) ) ( not ( = ?auto_725317 ?auto_725322 ) ) ( not ( = ?auto_725318 ?auto_725319 ) ) ( not ( = ?auto_725318 ?auto_725320 ) ) ( not ( = ?auto_725318 ?auto_725321 ) ) ( not ( = ?auto_725318 ?auto_725322 ) ) ( not ( = ?auto_725319 ?auto_725320 ) ) ( not ( = ?auto_725319 ?auto_725321 ) ) ( not ( = ?auto_725319 ?auto_725322 ) ) ( not ( = ?auto_725320 ?auto_725321 ) ) ( not ( = ?auto_725320 ?auto_725322 ) ) ( not ( = ?auto_725321 ?auto_725322 ) ) ( ON ?auto_725320 ?auto_725321 ) ( ON ?auto_725319 ?auto_725320 ) ( ON ?auto_725318 ?auto_725319 ) ( ON ?auto_725317 ?auto_725318 ) ( CLEAR ?auto_725315 ) ( ON ?auto_725316 ?auto_725317 ) ( CLEAR ?auto_725316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_725315 ?auto_725316 )
      ( MAKE-7PILE ?auto_725315 ?auto_725316 ?auto_725317 ?auto_725318 ?auto_725319 ?auto_725320 ?auto_725321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_725345 - BLOCK
      ?auto_725346 - BLOCK
      ?auto_725347 - BLOCK
      ?auto_725348 - BLOCK
      ?auto_725349 - BLOCK
      ?auto_725350 - BLOCK
      ?auto_725351 - BLOCK
    )
    :vars
    (
      ?auto_725352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725351 ?auto_725352 ) ( not ( = ?auto_725345 ?auto_725346 ) ) ( not ( = ?auto_725345 ?auto_725347 ) ) ( not ( = ?auto_725345 ?auto_725348 ) ) ( not ( = ?auto_725345 ?auto_725349 ) ) ( not ( = ?auto_725345 ?auto_725350 ) ) ( not ( = ?auto_725345 ?auto_725351 ) ) ( not ( = ?auto_725345 ?auto_725352 ) ) ( not ( = ?auto_725346 ?auto_725347 ) ) ( not ( = ?auto_725346 ?auto_725348 ) ) ( not ( = ?auto_725346 ?auto_725349 ) ) ( not ( = ?auto_725346 ?auto_725350 ) ) ( not ( = ?auto_725346 ?auto_725351 ) ) ( not ( = ?auto_725346 ?auto_725352 ) ) ( not ( = ?auto_725347 ?auto_725348 ) ) ( not ( = ?auto_725347 ?auto_725349 ) ) ( not ( = ?auto_725347 ?auto_725350 ) ) ( not ( = ?auto_725347 ?auto_725351 ) ) ( not ( = ?auto_725347 ?auto_725352 ) ) ( not ( = ?auto_725348 ?auto_725349 ) ) ( not ( = ?auto_725348 ?auto_725350 ) ) ( not ( = ?auto_725348 ?auto_725351 ) ) ( not ( = ?auto_725348 ?auto_725352 ) ) ( not ( = ?auto_725349 ?auto_725350 ) ) ( not ( = ?auto_725349 ?auto_725351 ) ) ( not ( = ?auto_725349 ?auto_725352 ) ) ( not ( = ?auto_725350 ?auto_725351 ) ) ( not ( = ?auto_725350 ?auto_725352 ) ) ( not ( = ?auto_725351 ?auto_725352 ) ) ( ON ?auto_725350 ?auto_725351 ) ( ON ?auto_725349 ?auto_725350 ) ( ON ?auto_725348 ?auto_725349 ) ( ON ?auto_725347 ?auto_725348 ) ( ON ?auto_725346 ?auto_725347 ) ( ON ?auto_725345 ?auto_725346 ) ( CLEAR ?auto_725345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_725345 )
      ( MAKE-7PILE ?auto_725345 ?auto_725346 ?auto_725347 ?auto_725348 ?auto_725349 ?auto_725350 ?auto_725351 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725376 - BLOCK
      ?auto_725377 - BLOCK
      ?auto_725378 - BLOCK
      ?auto_725379 - BLOCK
      ?auto_725380 - BLOCK
      ?auto_725381 - BLOCK
      ?auto_725382 - BLOCK
      ?auto_725383 - BLOCK
    )
    :vars
    (
      ?auto_725384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_725382 ) ( ON ?auto_725383 ?auto_725384 ) ( CLEAR ?auto_725383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_725376 ) ( ON ?auto_725377 ?auto_725376 ) ( ON ?auto_725378 ?auto_725377 ) ( ON ?auto_725379 ?auto_725378 ) ( ON ?auto_725380 ?auto_725379 ) ( ON ?auto_725381 ?auto_725380 ) ( ON ?auto_725382 ?auto_725381 ) ( not ( = ?auto_725376 ?auto_725377 ) ) ( not ( = ?auto_725376 ?auto_725378 ) ) ( not ( = ?auto_725376 ?auto_725379 ) ) ( not ( = ?auto_725376 ?auto_725380 ) ) ( not ( = ?auto_725376 ?auto_725381 ) ) ( not ( = ?auto_725376 ?auto_725382 ) ) ( not ( = ?auto_725376 ?auto_725383 ) ) ( not ( = ?auto_725376 ?auto_725384 ) ) ( not ( = ?auto_725377 ?auto_725378 ) ) ( not ( = ?auto_725377 ?auto_725379 ) ) ( not ( = ?auto_725377 ?auto_725380 ) ) ( not ( = ?auto_725377 ?auto_725381 ) ) ( not ( = ?auto_725377 ?auto_725382 ) ) ( not ( = ?auto_725377 ?auto_725383 ) ) ( not ( = ?auto_725377 ?auto_725384 ) ) ( not ( = ?auto_725378 ?auto_725379 ) ) ( not ( = ?auto_725378 ?auto_725380 ) ) ( not ( = ?auto_725378 ?auto_725381 ) ) ( not ( = ?auto_725378 ?auto_725382 ) ) ( not ( = ?auto_725378 ?auto_725383 ) ) ( not ( = ?auto_725378 ?auto_725384 ) ) ( not ( = ?auto_725379 ?auto_725380 ) ) ( not ( = ?auto_725379 ?auto_725381 ) ) ( not ( = ?auto_725379 ?auto_725382 ) ) ( not ( = ?auto_725379 ?auto_725383 ) ) ( not ( = ?auto_725379 ?auto_725384 ) ) ( not ( = ?auto_725380 ?auto_725381 ) ) ( not ( = ?auto_725380 ?auto_725382 ) ) ( not ( = ?auto_725380 ?auto_725383 ) ) ( not ( = ?auto_725380 ?auto_725384 ) ) ( not ( = ?auto_725381 ?auto_725382 ) ) ( not ( = ?auto_725381 ?auto_725383 ) ) ( not ( = ?auto_725381 ?auto_725384 ) ) ( not ( = ?auto_725382 ?auto_725383 ) ) ( not ( = ?auto_725382 ?auto_725384 ) ) ( not ( = ?auto_725383 ?auto_725384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_725383 ?auto_725384 )
      ( !STACK ?auto_725383 ?auto_725382 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725410 - BLOCK
      ?auto_725411 - BLOCK
      ?auto_725412 - BLOCK
      ?auto_725413 - BLOCK
      ?auto_725414 - BLOCK
      ?auto_725415 - BLOCK
      ?auto_725416 - BLOCK
      ?auto_725417 - BLOCK
    )
    :vars
    (
      ?auto_725418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725417 ?auto_725418 ) ( ON-TABLE ?auto_725410 ) ( ON ?auto_725411 ?auto_725410 ) ( ON ?auto_725412 ?auto_725411 ) ( ON ?auto_725413 ?auto_725412 ) ( ON ?auto_725414 ?auto_725413 ) ( ON ?auto_725415 ?auto_725414 ) ( not ( = ?auto_725410 ?auto_725411 ) ) ( not ( = ?auto_725410 ?auto_725412 ) ) ( not ( = ?auto_725410 ?auto_725413 ) ) ( not ( = ?auto_725410 ?auto_725414 ) ) ( not ( = ?auto_725410 ?auto_725415 ) ) ( not ( = ?auto_725410 ?auto_725416 ) ) ( not ( = ?auto_725410 ?auto_725417 ) ) ( not ( = ?auto_725410 ?auto_725418 ) ) ( not ( = ?auto_725411 ?auto_725412 ) ) ( not ( = ?auto_725411 ?auto_725413 ) ) ( not ( = ?auto_725411 ?auto_725414 ) ) ( not ( = ?auto_725411 ?auto_725415 ) ) ( not ( = ?auto_725411 ?auto_725416 ) ) ( not ( = ?auto_725411 ?auto_725417 ) ) ( not ( = ?auto_725411 ?auto_725418 ) ) ( not ( = ?auto_725412 ?auto_725413 ) ) ( not ( = ?auto_725412 ?auto_725414 ) ) ( not ( = ?auto_725412 ?auto_725415 ) ) ( not ( = ?auto_725412 ?auto_725416 ) ) ( not ( = ?auto_725412 ?auto_725417 ) ) ( not ( = ?auto_725412 ?auto_725418 ) ) ( not ( = ?auto_725413 ?auto_725414 ) ) ( not ( = ?auto_725413 ?auto_725415 ) ) ( not ( = ?auto_725413 ?auto_725416 ) ) ( not ( = ?auto_725413 ?auto_725417 ) ) ( not ( = ?auto_725413 ?auto_725418 ) ) ( not ( = ?auto_725414 ?auto_725415 ) ) ( not ( = ?auto_725414 ?auto_725416 ) ) ( not ( = ?auto_725414 ?auto_725417 ) ) ( not ( = ?auto_725414 ?auto_725418 ) ) ( not ( = ?auto_725415 ?auto_725416 ) ) ( not ( = ?auto_725415 ?auto_725417 ) ) ( not ( = ?auto_725415 ?auto_725418 ) ) ( not ( = ?auto_725416 ?auto_725417 ) ) ( not ( = ?auto_725416 ?auto_725418 ) ) ( not ( = ?auto_725417 ?auto_725418 ) ) ( CLEAR ?auto_725415 ) ( ON ?auto_725416 ?auto_725417 ) ( CLEAR ?auto_725416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_725410 ?auto_725411 ?auto_725412 ?auto_725413 ?auto_725414 ?auto_725415 ?auto_725416 )
      ( MAKE-8PILE ?auto_725410 ?auto_725411 ?auto_725412 ?auto_725413 ?auto_725414 ?auto_725415 ?auto_725416 ?auto_725417 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725444 - BLOCK
      ?auto_725445 - BLOCK
      ?auto_725446 - BLOCK
      ?auto_725447 - BLOCK
      ?auto_725448 - BLOCK
      ?auto_725449 - BLOCK
      ?auto_725450 - BLOCK
      ?auto_725451 - BLOCK
    )
    :vars
    (
      ?auto_725452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725451 ?auto_725452 ) ( ON-TABLE ?auto_725444 ) ( ON ?auto_725445 ?auto_725444 ) ( ON ?auto_725446 ?auto_725445 ) ( ON ?auto_725447 ?auto_725446 ) ( ON ?auto_725448 ?auto_725447 ) ( not ( = ?auto_725444 ?auto_725445 ) ) ( not ( = ?auto_725444 ?auto_725446 ) ) ( not ( = ?auto_725444 ?auto_725447 ) ) ( not ( = ?auto_725444 ?auto_725448 ) ) ( not ( = ?auto_725444 ?auto_725449 ) ) ( not ( = ?auto_725444 ?auto_725450 ) ) ( not ( = ?auto_725444 ?auto_725451 ) ) ( not ( = ?auto_725444 ?auto_725452 ) ) ( not ( = ?auto_725445 ?auto_725446 ) ) ( not ( = ?auto_725445 ?auto_725447 ) ) ( not ( = ?auto_725445 ?auto_725448 ) ) ( not ( = ?auto_725445 ?auto_725449 ) ) ( not ( = ?auto_725445 ?auto_725450 ) ) ( not ( = ?auto_725445 ?auto_725451 ) ) ( not ( = ?auto_725445 ?auto_725452 ) ) ( not ( = ?auto_725446 ?auto_725447 ) ) ( not ( = ?auto_725446 ?auto_725448 ) ) ( not ( = ?auto_725446 ?auto_725449 ) ) ( not ( = ?auto_725446 ?auto_725450 ) ) ( not ( = ?auto_725446 ?auto_725451 ) ) ( not ( = ?auto_725446 ?auto_725452 ) ) ( not ( = ?auto_725447 ?auto_725448 ) ) ( not ( = ?auto_725447 ?auto_725449 ) ) ( not ( = ?auto_725447 ?auto_725450 ) ) ( not ( = ?auto_725447 ?auto_725451 ) ) ( not ( = ?auto_725447 ?auto_725452 ) ) ( not ( = ?auto_725448 ?auto_725449 ) ) ( not ( = ?auto_725448 ?auto_725450 ) ) ( not ( = ?auto_725448 ?auto_725451 ) ) ( not ( = ?auto_725448 ?auto_725452 ) ) ( not ( = ?auto_725449 ?auto_725450 ) ) ( not ( = ?auto_725449 ?auto_725451 ) ) ( not ( = ?auto_725449 ?auto_725452 ) ) ( not ( = ?auto_725450 ?auto_725451 ) ) ( not ( = ?auto_725450 ?auto_725452 ) ) ( not ( = ?auto_725451 ?auto_725452 ) ) ( ON ?auto_725450 ?auto_725451 ) ( CLEAR ?auto_725448 ) ( ON ?auto_725449 ?auto_725450 ) ( CLEAR ?auto_725449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_725444 ?auto_725445 ?auto_725446 ?auto_725447 ?auto_725448 ?auto_725449 )
      ( MAKE-8PILE ?auto_725444 ?auto_725445 ?auto_725446 ?auto_725447 ?auto_725448 ?auto_725449 ?auto_725450 ?auto_725451 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725478 - BLOCK
      ?auto_725479 - BLOCK
      ?auto_725480 - BLOCK
      ?auto_725481 - BLOCK
      ?auto_725482 - BLOCK
      ?auto_725483 - BLOCK
      ?auto_725484 - BLOCK
      ?auto_725485 - BLOCK
    )
    :vars
    (
      ?auto_725486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725485 ?auto_725486 ) ( ON-TABLE ?auto_725478 ) ( ON ?auto_725479 ?auto_725478 ) ( ON ?auto_725480 ?auto_725479 ) ( ON ?auto_725481 ?auto_725480 ) ( not ( = ?auto_725478 ?auto_725479 ) ) ( not ( = ?auto_725478 ?auto_725480 ) ) ( not ( = ?auto_725478 ?auto_725481 ) ) ( not ( = ?auto_725478 ?auto_725482 ) ) ( not ( = ?auto_725478 ?auto_725483 ) ) ( not ( = ?auto_725478 ?auto_725484 ) ) ( not ( = ?auto_725478 ?auto_725485 ) ) ( not ( = ?auto_725478 ?auto_725486 ) ) ( not ( = ?auto_725479 ?auto_725480 ) ) ( not ( = ?auto_725479 ?auto_725481 ) ) ( not ( = ?auto_725479 ?auto_725482 ) ) ( not ( = ?auto_725479 ?auto_725483 ) ) ( not ( = ?auto_725479 ?auto_725484 ) ) ( not ( = ?auto_725479 ?auto_725485 ) ) ( not ( = ?auto_725479 ?auto_725486 ) ) ( not ( = ?auto_725480 ?auto_725481 ) ) ( not ( = ?auto_725480 ?auto_725482 ) ) ( not ( = ?auto_725480 ?auto_725483 ) ) ( not ( = ?auto_725480 ?auto_725484 ) ) ( not ( = ?auto_725480 ?auto_725485 ) ) ( not ( = ?auto_725480 ?auto_725486 ) ) ( not ( = ?auto_725481 ?auto_725482 ) ) ( not ( = ?auto_725481 ?auto_725483 ) ) ( not ( = ?auto_725481 ?auto_725484 ) ) ( not ( = ?auto_725481 ?auto_725485 ) ) ( not ( = ?auto_725481 ?auto_725486 ) ) ( not ( = ?auto_725482 ?auto_725483 ) ) ( not ( = ?auto_725482 ?auto_725484 ) ) ( not ( = ?auto_725482 ?auto_725485 ) ) ( not ( = ?auto_725482 ?auto_725486 ) ) ( not ( = ?auto_725483 ?auto_725484 ) ) ( not ( = ?auto_725483 ?auto_725485 ) ) ( not ( = ?auto_725483 ?auto_725486 ) ) ( not ( = ?auto_725484 ?auto_725485 ) ) ( not ( = ?auto_725484 ?auto_725486 ) ) ( not ( = ?auto_725485 ?auto_725486 ) ) ( ON ?auto_725484 ?auto_725485 ) ( ON ?auto_725483 ?auto_725484 ) ( CLEAR ?auto_725481 ) ( ON ?auto_725482 ?auto_725483 ) ( CLEAR ?auto_725482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_725478 ?auto_725479 ?auto_725480 ?auto_725481 ?auto_725482 )
      ( MAKE-8PILE ?auto_725478 ?auto_725479 ?auto_725480 ?auto_725481 ?auto_725482 ?auto_725483 ?auto_725484 ?auto_725485 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725512 - BLOCK
      ?auto_725513 - BLOCK
      ?auto_725514 - BLOCK
      ?auto_725515 - BLOCK
      ?auto_725516 - BLOCK
      ?auto_725517 - BLOCK
      ?auto_725518 - BLOCK
      ?auto_725519 - BLOCK
    )
    :vars
    (
      ?auto_725520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725519 ?auto_725520 ) ( ON-TABLE ?auto_725512 ) ( ON ?auto_725513 ?auto_725512 ) ( ON ?auto_725514 ?auto_725513 ) ( not ( = ?auto_725512 ?auto_725513 ) ) ( not ( = ?auto_725512 ?auto_725514 ) ) ( not ( = ?auto_725512 ?auto_725515 ) ) ( not ( = ?auto_725512 ?auto_725516 ) ) ( not ( = ?auto_725512 ?auto_725517 ) ) ( not ( = ?auto_725512 ?auto_725518 ) ) ( not ( = ?auto_725512 ?auto_725519 ) ) ( not ( = ?auto_725512 ?auto_725520 ) ) ( not ( = ?auto_725513 ?auto_725514 ) ) ( not ( = ?auto_725513 ?auto_725515 ) ) ( not ( = ?auto_725513 ?auto_725516 ) ) ( not ( = ?auto_725513 ?auto_725517 ) ) ( not ( = ?auto_725513 ?auto_725518 ) ) ( not ( = ?auto_725513 ?auto_725519 ) ) ( not ( = ?auto_725513 ?auto_725520 ) ) ( not ( = ?auto_725514 ?auto_725515 ) ) ( not ( = ?auto_725514 ?auto_725516 ) ) ( not ( = ?auto_725514 ?auto_725517 ) ) ( not ( = ?auto_725514 ?auto_725518 ) ) ( not ( = ?auto_725514 ?auto_725519 ) ) ( not ( = ?auto_725514 ?auto_725520 ) ) ( not ( = ?auto_725515 ?auto_725516 ) ) ( not ( = ?auto_725515 ?auto_725517 ) ) ( not ( = ?auto_725515 ?auto_725518 ) ) ( not ( = ?auto_725515 ?auto_725519 ) ) ( not ( = ?auto_725515 ?auto_725520 ) ) ( not ( = ?auto_725516 ?auto_725517 ) ) ( not ( = ?auto_725516 ?auto_725518 ) ) ( not ( = ?auto_725516 ?auto_725519 ) ) ( not ( = ?auto_725516 ?auto_725520 ) ) ( not ( = ?auto_725517 ?auto_725518 ) ) ( not ( = ?auto_725517 ?auto_725519 ) ) ( not ( = ?auto_725517 ?auto_725520 ) ) ( not ( = ?auto_725518 ?auto_725519 ) ) ( not ( = ?auto_725518 ?auto_725520 ) ) ( not ( = ?auto_725519 ?auto_725520 ) ) ( ON ?auto_725518 ?auto_725519 ) ( ON ?auto_725517 ?auto_725518 ) ( ON ?auto_725516 ?auto_725517 ) ( CLEAR ?auto_725514 ) ( ON ?auto_725515 ?auto_725516 ) ( CLEAR ?auto_725515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_725512 ?auto_725513 ?auto_725514 ?auto_725515 )
      ( MAKE-8PILE ?auto_725512 ?auto_725513 ?auto_725514 ?auto_725515 ?auto_725516 ?auto_725517 ?auto_725518 ?auto_725519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725546 - BLOCK
      ?auto_725547 - BLOCK
      ?auto_725548 - BLOCK
      ?auto_725549 - BLOCK
      ?auto_725550 - BLOCK
      ?auto_725551 - BLOCK
      ?auto_725552 - BLOCK
      ?auto_725553 - BLOCK
    )
    :vars
    (
      ?auto_725554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725553 ?auto_725554 ) ( ON-TABLE ?auto_725546 ) ( ON ?auto_725547 ?auto_725546 ) ( not ( = ?auto_725546 ?auto_725547 ) ) ( not ( = ?auto_725546 ?auto_725548 ) ) ( not ( = ?auto_725546 ?auto_725549 ) ) ( not ( = ?auto_725546 ?auto_725550 ) ) ( not ( = ?auto_725546 ?auto_725551 ) ) ( not ( = ?auto_725546 ?auto_725552 ) ) ( not ( = ?auto_725546 ?auto_725553 ) ) ( not ( = ?auto_725546 ?auto_725554 ) ) ( not ( = ?auto_725547 ?auto_725548 ) ) ( not ( = ?auto_725547 ?auto_725549 ) ) ( not ( = ?auto_725547 ?auto_725550 ) ) ( not ( = ?auto_725547 ?auto_725551 ) ) ( not ( = ?auto_725547 ?auto_725552 ) ) ( not ( = ?auto_725547 ?auto_725553 ) ) ( not ( = ?auto_725547 ?auto_725554 ) ) ( not ( = ?auto_725548 ?auto_725549 ) ) ( not ( = ?auto_725548 ?auto_725550 ) ) ( not ( = ?auto_725548 ?auto_725551 ) ) ( not ( = ?auto_725548 ?auto_725552 ) ) ( not ( = ?auto_725548 ?auto_725553 ) ) ( not ( = ?auto_725548 ?auto_725554 ) ) ( not ( = ?auto_725549 ?auto_725550 ) ) ( not ( = ?auto_725549 ?auto_725551 ) ) ( not ( = ?auto_725549 ?auto_725552 ) ) ( not ( = ?auto_725549 ?auto_725553 ) ) ( not ( = ?auto_725549 ?auto_725554 ) ) ( not ( = ?auto_725550 ?auto_725551 ) ) ( not ( = ?auto_725550 ?auto_725552 ) ) ( not ( = ?auto_725550 ?auto_725553 ) ) ( not ( = ?auto_725550 ?auto_725554 ) ) ( not ( = ?auto_725551 ?auto_725552 ) ) ( not ( = ?auto_725551 ?auto_725553 ) ) ( not ( = ?auto_725551 ?auto_725554 ) ) ( not ( = ?auto_725552 ?auto_725553 ) ) ( not ( = ?auto_725552 ?auto_725554 ) ) ( not ( = ?auto_725553 ?auto_725554 ) ) ( ON ?auto_725552 ?auto_725553 ) ( ON ?auto_725551 ?auto_725552 ) ( ON ?auto_725550 ?auto_725551 ) ( ON ?auto_725549 ?auto_725550 ) ( CLEAR ?auto_725547 ) ( ON ?auto_725548 ?auto_725549 ) ( CLEAR ?auto_725548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_725546 ?auto_725547 ?auto_725548 )
      ( MAKE-8PILE ?auto_725546 ?auto_725547 ?auto_725548 ?auto_725549 ?auto_725550 ?auto_725551 ?auto_725552 ?auto_725553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725580 - BLOCK
      ?auto_725581 - BLOCK
      ?auto_725582 - BLOCK
      ?auto_725583 - BLOCK
      ?auto_725584 - BLOCK
      ?auto_725585 - BLOCK
      ?auto_725586 - BLOCK
      ?auto_725587 - BLOCK
    )
    :vars
    (
      ?auto_725588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725587 ?auto_725588 ) ( ON-TABLE ?auto_725580 ) ( not ( = ?auto_725580 ?auto_725581 ) ) ( not ( = ?auto_725580 ?auto_725582 ) ) ( not ( = ?auto_725580 ?auto_725583 ) ) ( not ( = ?auto_725580 ?auto_725584 ) ) ( not ( = ?auto_725580 ?auto_725585 ) ) ( not ( = ?auto_725580 ?auto_725586 ) ) ( not ( = ?auto_725580 ?auto_725587 ) ) ( not ( = ?auto_725580 ?auto_725588 ) ) ( not ( = ?auto_725581 ?auto_725582 ) ) ( not ( = ?auto_725581 ?auto_725583 ) ) ( not ( = ?auto_725581 ?auto_725584 ) ) ( not ( = ?auto_725581 ?auto_725585 ) ) ( not ( = ?auto_725581 ?auto_725586 ) ) ( not ( = ?auto_725581 ?auto_725587 ) ) ( not ( = ?auto_725581 ?auto_725588 ) ) ( not ( = ?auto_725582 ?auto_725583 ) ) ( not ( = ?auto_725582 ?auto_725584 ) ) ( not ( = ?auto_725582 ?auto_725585 ) ) ( not ( = ?auto_725582 ?auto_725586 ) ) ( not ( = ?auto_725582 ?auto_725587 ) ) ( not ( = ?auto_725582 ?auto_725588 ) ) ( not ( = ?auto_725583 ?auto_725584 ) ) ( not ( = ?auto_725583 ?auto_725585 ) ) ( not ( = ?auto_725583 ?auto_725586 ) ) ( not ( = ?auto_725583 ?auto_725587 ) ) ( not ( = ?auto_725583 ?auto_725588 ) ) ( not ( = ?auto_725584 ?auto_725585 ) ) ( not ( = ?auto_725584 ?auto_725586 ) ) ( not ( = ?auto_725584 ?auto_725587 ) ) ( not ( = ?auto_725584 ?auto_725588 ) ) ( not ( = ?auto_725585 ?auto_725586 ) ) ( not ( = ?auto_725585 ?auto_725587 ) ) ( not ( = ?auto_725585 ?auto_725588 ) ) ( not ( = ?auto_725586 ?auto_725587 ) ) ( not ( = ?auto_725586 ?auto_725588 ) ) ( not ( = ?auto_725587 ?auto_725588 ) ) ( ON ?auto_725586 ?auto_725587 ) ( ON ?auto_725585 ?auto_725586 ) ( ON ?auto_725584 ?auto_725585 ) ( ON ?auto_725583 ?auto_725584 ) ( ON ?auto_725582 ?auto_725583 ) ( CLEAR ?auto_725580 ) ( ON ?auto_725581 ?auto_725582 ) ( CLEAR ?auto_725581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_725580 ?auto_725581 )
      ( MAKE-8PILE ?auto_725580 ?auto_725581 ?auto_725582 ?auto_725583 ?auto_725584 ?auto_725585 ?auto_725586 ?auto_725587 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_725614 - BLOCK
      ?auto_725615 - BLOCK
      ?auto_725616 - BLOCK
      ?auto_725617 - BLOCK
      ?auto_725618 - BLOCK
      ?auto_725619 - BLOCK
      ?auto_725620 - BLOCK
      ?auto_725621 - BLOCK
    )
    :vars
    (
      ?auto_725622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725621 ?auto_725622 ) ( not ( = ?auto_725614 ?auto_725615 ) ) ( not ( = ?auto_725614 ?auto_725616 ) ) ( not ( = ?auto_725614 ?auto_725617 ) ) ( not ( = ?auto_725614 ?auto_725618 ) ) ( not ( = ?auto_725614 ?auto_725619 ) ) ( not ( = ?auto_725614 ?auto_725620 ) ) ( not ( = ?auto_725614 ?auto_725621 ) ) ( not ( = ?auto_725614 ?auto_725622 ) ) ( not ( = ?auto_725615 ?auto_725616 ) ) ( not ( = ?auto_725615 ?auto_725617 ) ) ( not ( = ?auto_725615 ?auto_725618 ) ) ( not ( = ?auto_725615 ?auto_725619 ) ) ( not ( = ?auto_725615 ?auto_725620 ) ) ( not ( = ?auto_725615 ?auto_725621 ) ) ( not ( = ?auto_725615 ?auto_725622 ) ) ( not ( = ?auto_725616 ?auto_725617 ) ) ( not ( = ?auto_725616 ?auto_725618 ) ) ( not ( = ?auto_725616 ?auto_725619 ) ) ( not ( = ?auto_725616 ?auto_725620 ) ) ( not ( = ?auto_725616 ?auto_725621 ) ) ( not ( = ?auto_725616 ?auto_725622 ) ) ( not ( = ?auto_725617 ?auto_725618 ) ) ( not ( = ?auto_725617 ?auto_725619 ) ) ( not ( = ?auto_725617 ?auto_725620 ) ) ( not ( = ?auto_725617 ?auto_725621 ) ) ( not ( = ?auto_725617 ?auto_725622 ) ) ( not ( = ?auto_725618 ?auto_725619 ) ) ( not ( = ?auto_725618 ?auto_725620 ) ) ( not ( = ?auto_725618 ?auto_725621 ) ) ( not ( = ?auto_725618 ?auto_725622 ) ) ( not ( = ?auto_725619 ?auto_725620 ) ) ( not ( = ?auto_725619 ?auto_725621 ) ) ( not ( = ?auto_725619 ?auto_725622 ) ) ( not ( = ?auto_725620 ?auto_725621 ) ) ( not ( = ?auto_725620 ?auto_725622 ) ) ( not ( = ?auto_725621 ?auto_725622 ) ) ( ON ?auto_725620 ?auto_725621 ) ( ON ?auto_725619 ?auto_725620 ) ( ON ?auto_725618 ?auto_725619 ) ( ON ?auto_725617 ?auto_725618 ) ( ON ?auto_725616 ?auto_725617 ) ( ON ?auto_725615 ?auto_725616 ) ( ON ?auto_725614 ?auto_725615 ) ( CLEAR ?auto_725614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_725614 )
      ( MAKE-8PILE ?auto_725614 ?auto_725615 ?auto_725616 ?auto_725617 ?auto_725618 ?auto_725619 ?auto_725620 ?auto_725621 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725649 - BLOCK
      ?auto_725650 - BLOCK
      ?auto_725651 - BLOCK
      ?auto_725652 - BLOCK
      ?auto_725653 - BLOCK
      ?auto_725654 - BLOCK
      ?auto_725655 - BLOCK
      ?auto_725656 - BLOCK
      ?auto_725657 - BLOCK
    )
    :vars
    (
      ?auto_725658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_725656 ) ( ON ?auto_725657 ?auto_725658 ) ( CLEAR ?auto_725657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_725649 ) ( ON ?auto_725650 ?auto_725649 ) ( ON ?auto_725651 ?auto_725650 ) ( ON ?auto_725652 ?auto_725651 ) ( ON ?auto_725653 ?auto_725652 ) ( ON ?auto_725654 ?auto_725653 ) ( ON ?auto_725655 ?auto_725654 ) ( ON ?auto_725656 ?auto_725655 ) ( not ( = ?auto_725649 ?auto_725650 ) ) ( not ( = ?auto_725649 ?auto_725651 ) ) ( not ( = ?auto_725649 ?auto_725652 ) ) ( not ( = ?auto_725649 ?auto_725653 ) ) ( not ( = ?auto_725649 ?auto_725654 ) ) ( not ( = ?auto_725649 ?auto_725655 ) ) ( not ( = ?auto_725649 ?auto_725656 ) ) ( not ( = ?auto_725649 ?auto_725657 ) ) ( not ( = ?auto_725649 ?auto_725658 ) ) ( not ( = ?auto_725650 ?auto_725651 ) ) ( not ( = ?auto_725650 ?auto_725652 ) ) ( not ( = ?auto_725650 ?auto_725653 ) ) ( not ( = ?auto_725650 ?auto_725654 ) ) ( not ( = ?auto_725650 ?auto_725655 ) ) ( not ( = ?auto_725650 ?auto_725656 ) ) ( not ( = ?auto_725650 ?auto_725657 ) ) ( not ( = ?auto_725650 ?auto_725658 ) ) ( not ( = ?auto_725651 ?auto_725652 ) ) ( not ( = ?auto_725651 ?auto_725653 ) ) ( not ( = ?auto_725651 ?auto_725654 ) ) ( not ( = ?auto_725651 ?auto_725655 ) ) ( not ( = ?auto_725651 ?auto_725656 ) ) ( not ( = ?auto_725651 ?auto_725657 ) ) ( not ( = ?auto_725651 ?auto_725658 ) ) ( not ( = ?auto_725652 ?auto_725653 ) ) ( not ( = ?auto_725652 ?auto_725654 ) ) ( not ( = ?auto_725652 ?auto_725655 ) ) ( not ( = ?auto_725652 ?auto_725656 ) ) ( not ( = ?auto_725652 ?auto_725657 ) ) ( not ( = ?auto_725652 ?auto_725658 ) ) ( not ( = ?auto_725653 ?auto_725654 ) ) ( not ( = ?auto_725653 ?auto_725655 ) ) ( not ( = ?auto_725653 ?auto_725656 ) ) ( not ( = ?auto_725653 ?auto_725657 ) ) ( not ( = ?auto_725653 ?auto_725658 ) ) ( not ( = ?auto_725654 ?auto_725655 ) ) ( not ( = ?auto_725654 ?auto_725656 ) ) ( not ( = ?auto_725654 ?auto_725657 ) ) ( not ( = ?auto_725654 ?auto_725658 ) ) ( not ( = ?auto_725655 ?auto_725656 ) ) ( not ( = ?auto_725655 ?auto_725657 ) ) ( not ( = ?auto_725655 ?auto_725658 ) ) ( not ( = ?auto_725656 ?auto_725657 ) ) ( not ( = ?auto_725656 ?auto_725658 ) ) ( not ( = ?auto_725657 ?auto_725658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_725657 ?auto_725658 )
      ( !STACK ?auto_725657 ?auto_725656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725687 - BLOCK
      ?auto_725688 - BLOCK
      ?auto_725689 - BLOCK
      ?auto_725690 - BLOCK
      ?auto_725691 - BLOCK
      ?auto_725692 - BLOCK
      ?auto_725693 - BLOCK
      ?auto_725694 - BLOCK
      ?auto_725695 - BLOCK
    )
    :vars
    (
      ?auto_725696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725695 ?auto_725696 ) ( ON-TABLE ?auto_725687 ) ( ON ?auto_725688 ?auto_725687 ) ( ON ?auto_725689 ?auto_725688 ) ( ON ?auto_725690 ?auto_725689 ) ( ON ?auto_725691 ?auto_725690 ) ( ON ?auto_725692 ?auto_725691 ) ( ON ?auto_725693 ?auto_725692 ) ( not ( = ?auto_725687 ?auto_725688 ) ) ( not ( = ?auto_725687 ?auto_725689 ) ) ( not ( = ?auto_725687 ?auto_725690 ) ) ( not ( = ?auto_725687 ?auto_725691 ) ) ( not ( = ?auto_725687 ?auto_725692 ) ) ( not ( = ?auto_725687 ?auto_725693 ) ) ( not ( = ?auto_725687 ?auto_725694 ) ) ( not ( = ?auto_725687 ?auto_725695 ) ) ( not ( = ?auto_725687 ?auto_725696 ) ) ( not ( = ?auto_725688 ?auto_725689 ) ) ( not ( = ?auto_725688 ?auto_725690 ) ) ( not ( = ?auto_725688 ?auto_725691 ) ) ( not ( = ?auto_725688 ?auto_725692 ) ) ( not ( = ?auto_725688 ?auto_725693 ) ) ( not ( = ?auto_725688 ?auto_725694 ) ) ( not ( = ?auto_725688 ?auto_725695 ) ) ( not ( = ?auto_725688 ?auto_725696 ) ) ( not ( = ?auto_725689 ?auto_725690 ) ) ( not ( = ?auto_725689 ?auto_725691 ) ) ( not ( = ?auto_725689 ?auto_725692 ) ) ( not ( = ?auto_725689 ?auto_725693 ) ) ( not ( = ?auto_725689 ?auto_725694 ) ) ( not ( = ?auto_725689 ?auto_725695 ) ) ( not ( = ?auto_725689 ?auto_725696 ) ) ( not ( = ?auto_725690 ?auto_725691 ) ) ( not ( = ?auto_725690 ?auto_725692 ) ) ( not ( = ?auto_725690 ?auto_725693 ) ) ( not ( = ?auto_725690 ?auto_725694 ) ) ( not ( = ?auto_725690 ?auto_725695 ) ) ( not ( = ?auto_725690 ?auto_725696 ) ) ( not ( = ?auto_725691 ?auto_725692 ) ) ( not ( = ?auto_725691 ?auto_725693 ) ) ( not ( = ?auto_725691 ?auto_725694 ) ) ( not ( = ?auto_725691 ?auto_725695 ) ) ( not ( = ?auto_725691 ?auto_725696 ) ) ( not ( = ?auto_725692 ?auto_725693 ) ) ( not ( = ?auto_725692 ?auto_725694 ) ) ( not ( = ?auto_725692 ?auto_725695 ) ) ( not ( = ?auto_725692 ?auto_725696 ) ) ( not ( = ?auto_725693 ?auto_725694 ) ) ( not ( = ?auto_725693 ?auto_725695 ) ) ( not ( = ?auto_725693 ?auto_725696 ) ) ( not ( = ?auto_725694 ?auto_725695 ) ) ( not ( = ?auto_725694 ?auto_725696 ) ) ( not ( = ?auto_725695 ?auto_725696 ) ) ( CLEAR ?auto_725693 ) ( ON ?auto_725694 ?auto_725695 ) ( CLEAR ?auto_725694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_725687 ?auto_725688 ?auto_725689 ?auto_725690 ?auto_725691 ?auto_725692 ?auto_725693 ?auto_725694 )
      ( MAKE-9PILE ?auto_725687 ?auto_725688 ?auto_725689 ?auto_725690 ?auto_725691 ?auto_725692 ?auto_725693 ?auto_725694 ?auto_725695 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725725 - BLOCK
      ?auto_725726 - BLOCK
      ?auto_725727 - BLOCK
      ?auto_725728 - BLOCK
      ?auto_725729 - BLOCK
      ?auto_725730 - BLOCK
      ?auto_725731 - BLOCK
      ?auto_725732 - BLOCK
      ?auto_725733 - BLOCK
    )
    :vars
    (
      ?auto_725734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725733 ?auto_725734 ) ( ON-TABLE ?auto_725725 ) ( ON ?auto_725726 ?auto_725725 ) ( ON ?auto_725727 ?auto_725726 ) ( ON ?auto_725728 ?auto_725727 ) ( ON ?auto_725729 ?auto_725728 ) ( ON ?auto_725730 ?auto_725729 ) ( not ( = ?auto_725725 ?auto_725726 ) ) ( not ( = ?auto_725725 ?auto_725727 ) ) ( not ( = ?auto_725725 ?auto_725728 ) ) ( not ( = ?auto_725725 ?auto_725729 ) ) ( not ( = ?auto_725725 ?auto_725730 ) ) ( not ( = ?auto_725725 ?auto_725731 ) ) ( not ( = ?auto_725725 ?auto_725732 ) ) ( not ( = ?auto_725725 ?auto_725733 ) ) ( not ( = ?auto_725725 ?auto_725734 ) ) ( not ( = ?auto_725726 ?auto_725727 ) ) ( not ( = ?auto_725726 ?auto_725728 ) ) ( not ( = ?auto_725726 ?auto_725729 ) ) ( not ( = ?auto_725726 ?auto_725730 ) ) ( not ( = ?auto_725726 ?auto_725731 ) ) ( not ( = ?auto_725726 ?auto_725732 ) ) ( not ( = ?auto_725726 ?auto_725733 ) ) ( not ( = ?auto_725726 ?auto_725734 ) ) ( not ( = ?auto_725727 ?auto_725728 ) ) ( not ( = ?auto_725727 ?auto_725729 ) ) ( not ( = ?auto_725727 ?auto_725730 ) ) ( not ( = ?auto_725727 ?auto_725731 ) ) ( not ( = ?auto_725727 ?auto_725732 ) ) ( not ( = ?auto_725727 ?auto_725733 ) ) ( not ( = ?auto_725727 ?auto_725734 ) ) ( not ( = ?auto_725728 ?auto_725729 ) ) ( not ( = ?auto_725728 ?auto_725730 ) ) ( not ( = ?auto_725728 ?auto_725731 ) ) ( not ( = ?auto_725728 ?auto_725732 ) ) ( not ( = ?auto_725728 ?auto_725733 ) ) ( not ( = ?auto_725728 ?auto_725734 ) ) ( not ( = ?auto_725729 ?auto_725730 ) ) ( not ( = ?auto_725729 ?auto_725731 ) ) ( not ( = ?auto_725729 ?auto_725732 ) ) ( not ( = ?auto_725729 ?auto_725733 ) ) ( not ( = ?auto_725729 ?auto_725734 ) ) ( not ( = ?auto_725730 ?auto_725731 ) ) ( not ( = ?auto_725730 ?auto_725732 ) ) ( not ( = ?auto_725730 ?auto_725733 ) ) ( not ( = ?auto_725730 ?auto_725734 ) ) ( not ( = ?auto_725731 ?auto_725732 ) ) ( not ( = ?auto_725731 ?auto_725733 ) ) ( not ( = ?auto_725731 ?auto_725734 ) ) ( not ( = ?auto_725732 ?auto_725733 ) ) ( not ( = ?auto_725732 ?auto_725734 ) ) ( not ( = ?auto_725733 ?auto_725734 ) ) ( ON ?auto_725732 ?auto_725733 ) ( CLEAR ?auto_725730 ) ( ON ?auto_725731 ?auto_725732 ) ( CLEAR ?auto_725731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_725725 ?auto_725726 ?auto_725727 ?auto_725728 ?auto_725729 ?auto_725730 ?auto_725731 )
      ( MAKE-9PILE ?auto_725725 ?auto_725726 ?auto_725727 ?auto_725728 ?auto_725729 ?auto_725730 ?auto_725731 ?auto_725732 ?auto_725733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725763 - BLOCK
      ?auto_725764 - BLOCK
      ?auto_725765 - BLOCK
      ?auto_725766 - BLOCK
      ?auto_725767 - BLOCK
      ?auto_725768 - BLOCK
      ?auto_725769 - BLOCK
      ?auto_725770 - BLOCK
      ?auto_725771 - BLOCK
    )
    :vars
    (
      ?auto_725772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725771 ?auto_725772 ) ( ON-TABLE ?auto_725763 ) ( ON ?auto_725764 ?auto_725763 ) ( ON ?auto_725765 ?auto_725764 ) ( ON ?auto_725766 ?auto_725765 ) ( ON ?auto_725767 ?auto_725766 ) ( not ( = ?auto_725763 ?auto_725764 ) ) ( not ( = ?auto_725763 ?auto_725765 ) ) ( not ( = ?auto_725763 ?auto_725766 ) ) ( not ( = ?auto_725763 ?auto_725767 ) ) ( not ( = ?auto_725763 ?auto_725768 ) ) ( not ( = ?auto_725763 ?auto_725769 ) ) ( not ( = ?auto_725763 ?auto_725770 ) ) ( not ( = ?auto_725763 ?auto_725771 ) ) ( not ( = ?auto_725763 ?auto_725772 ) ) ( not ( = ?auto_725764 ?auto_725765 ) ) ( not ( = ?auto_725764 ?auto_725766 ) ) ( not ( = ?auto_725764 ?auto_725767 ) ) ( not ( = ?auto_725764 ?auto_725768 ) ) ( not ( = ?auto_725764 ?auto_725769 ) ) ( not ( = ?auto_725764 ?auto_725770 ) ) ( not ( = ?auto_725764 ?auto_725771 ) ) ( not ( = ?auto_725764 ?auto_725772 ) ) ( not ( = ?auto_725765 ?auto_725766 ) ) ( not ( = ?auto_725765 ?auto_725767 ) ) ( not ( = ?auto_725765 ?auto_725768 ) ) ( not ( = ?auto_725765 ?auto_725769 ) ) ( not ( = ?auto_725765 ?auto_725770 ) ) ( not ( = ?auto_725765 ?auto_725771 ) ) ( not ( = ?auto_725765 ?auto_725772 ) ) ( not ( = ?auto_725766 ?auto_725767 ) ) ( not ( = ?auto_725766 ?auto_725768 ) ) ( not ( = ?auto_725766 ?auto_725769 ) ) ( not ( = ?auto_725766 ?auto_725770 ) ) ( not ( = ?auto_725766 ?auto_725771 ) ) ( not ( = ?auto_725766 ?auto_725772 ) ) ( not ( = ?auto_725767 ?auto_725768 ) ) ( not ( = ?auto_725767 ?auto_725769 ) ) ( not ( = ?auto_725767 ?auto_725770 ) ) ( not ( = ?auto_725767 ?auto_725771 ) ) ( not ( = ?auto_725767 ?auto_725772 ) ) ( not ( = ?auto_725768 ?auto_725769 ) ) ( not ( = ?auto_725768 ?auto_725770 ) ) ( not ( = ?auto_725768 ?auto_725771 ) ) ( not ( = ?auto_725768 ?auto_725772 ) ) ( not ( = ?auto_725769 ?auto_725770 ) ) ( not ( = ?auto_725769 ?auto_725771 ) ) ( not ( = ?auto_725769 ?auto_725772 ) ) ( not ( = ?auto_725770 ?auto_725771 ) ) ( not ( = ?auto_725770 ?auto_725772 ) ) ( not ( = ?auto_725771 ?auto_725772 ) ) ( ON ?auto_725770 ?auto_725771 ) ( ON ?auto_725769 ?auto_725770 ) ( CLEAR ?auto_725767 ) ( ON ?auto_725768 ?auto_725769 ) ( CLEAR ?auto_725768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_725763 ?auto_725764 ?auto_725765 ?auto_725766 ?auto_725767 ?auto_725768 )
      ( MAKE-9PILE ?auto_725763 ?auto_725764 ?auto_725765 ?auto_725766 ?auto_725767 ?auto_725768 ?auto_725769 ?auto_725770 ?auto_725771 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725801 - BLOCK
      ?auto_725802 - BLOCK
      ?auto_725803 - BLOCK
      ?auto_725804 - BLOCK
      ?auto_725805 - BLOCK
      ?auto_725806 - BLOCK
      ?auto_725807 - BLOCK
      ?auto_725808 - BLOCK
      ?auto_725809 - BLOCK
    )
    :vars
    (
      ?auto_725810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725809 ?auto_725810 ) ( ON-TABLE ?auto_725801 ) ( ON ?auto_725802 ?auto_725801 ) ( ON ?auto_725803 ?auto_725802 ) ( ON ?auto_725804 ?auto_725803 ) ( not ( = ?auto_725801 ?auto_725802 ) ) ( not ( = ?auto_725801 ?auto_725803 ) ) ( not ( = ?auto_725801 ?auto_725804 ) ) ( not ( = ?auto_725801 ?auto_725805 ) ) ( not ( = ?auto_725801 ?auto_725806 ) ) ( not ( = ?auto_725801 ?auto_725807 ) ) ( not ( = ?auto_725801 ?auto_725808 ) ) ( not ( = ?auto_725801 ?auto_725809 ) ) ( not ( = ?auto_725801 ?auto_725810 ) ) ( not ( = ?auto_725802 ?auto_725803 ) ) ( not ( = ?auto_725802 ?auto_725804 ) ) ( not ( = ?auto_725802 ?auto_725805 ) ) ( not ( = ?auto_725802 ?auto_725806 ) ) ( not ( = ?auto_725802 ?auto_725807 ) ) ( not ( = ?auto_725802 ?auto_725808 ) ) ( not ( = ?auto_725802 ?auto_725809 ) ) ( not ( = ?auto_725802 ?auto_725810 ) ) ( not ( = ?auto_725803 ?auto_725804 ) ) ( not ( = ?auto_725803 ?auto_725805 ) ) ( not ( = ?auto_725803 ?auto_725806 ) ) ( not ( = ?auto_725803 ?auto_725807 ) ) ( not ( = ?auto_725803 ?auto_725808 ) ) ( not ( = ?auto_725803 ?auto_725809 ) ) ( not ( = ?auto_725803 ?auto_725810 ) ) ( not ( = ?auto_725804 ?auto_725805 ) ) ( not ( = ?auto_725804 ?auto_725806 ) ) ( not ( = ?auto_725804 ?auto_725807 ) ) ( not ( = ?auto_725804 ?auto_725808 ) ) ( not ( = ?auto_725804 ?auto_725809 ) ) ( not ( = ?auto_725804 ?auto_725810 ) ) ( not ( = ?auto_725805 ?auto_725806 ) ) ( not ( = ?auto_725805 ?auto_725807 ) ) ( not ( = ?auto_725805 ?auto_725808 ) ) ( not ( = ?auto_725805 ?auto_725809 ) ) ( not ( = ?auto_725805 ?auto_725810 ) ) ( not ( = ?auto_725806 ?auto_725807 ) ) ( not ( = ?auto_725806 ?auto_725808 ) ) ( not ( = ?auto_725806 ?auto_725809 ) ) ( not ( = ?auto_725806 ?auto_725810 ) ) ( not ( = ?auto_725807 ?auto_725808 ) ) ( not ( = ?auto_725807 ?auto_725809 ) ) ( not ( = ?auto_725807 ?auto_725810 ) ) ( not ( = ?auto_725808 ?auto_725809 ) ) ( not ( = ?auto_725808 ?auto_725810 ) ) ( not ( = ?auto_725809 ?auto_725810 ) ) ( ON ?auto_725808 ?auto_725809 ) ( ON ?auto_725807 ?auto_725808 ) ( ON ?auto_725806 ?auto_725807 ) ( CLEAR ?auto_725804 ) ( ON ?auto_725805 ?auto_725806 ) ( CLEAR ?auto_725805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_725801 ?auto_725802 ?auto_725803 ?auto_725804 ?auto_725805 )
      ( MAKE-9PILE ?auto_725801 ?auto_725802 ?auto_725803 ?auto_725804 ?auto_725805 ?auto_725806 ?auto_725807 ?auto_725808 ?auto_725809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725839 - BLOCK
      ?auto_725840 - BLOCK
      ?auto_725841 - BLOCK
      ?auto_725842 - BLOCK
      ?auto_725843 - BLOCK
      ?auto_725844 - BLOCK
      ?auto_725845 - BLOCK
      ?auto_725846 - BLOCK
      ?auto_725847 - BLOCK
    )
    :vars
    (
      ?auto_725848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725847 ?auto_725848 ) ( ON-TABLE ?auto_725839 ) ( ON ?auto_725840 ?auto_725839 ) ( ON ?auto_725841 ?auto_725840 ) ( not ( = ?auto_725839 ?auto_725840 ) ) ( not ( = ?auto_725839 ?auto_725841 ) ) ( not ( = ?auto_725839 ?auto_725842 ) ) ( not ( = ?auto_725839 ?auto_725843 ) ) ( not ( = ?auto_725839 ?auto_725844 ) ) ( not ( = ?auto_725839 ?auto_725845 ) ) ( not ( = ?auto_725839 ?auto_725846 ) ) ( not ( = ?auto_725839 ?auto_725847 ) ) ( not ( = ?auto_725839 ?auto_725848 ) ) ( not ( = ?auto_725840 ?auto_725841 ) ) ( not ( = ?auto_725840 ?auto_725842 ) ) ( not ( = ?auto_725840 ?auto_725843 ) ) ( not ( = ?auto_725840 ?auto_725844 ) ) ( not ( = ?auto_725840 ?auto_725845 ) ) ( not ( = ?auto_725840 ?auto_725846 ) ) ( not ( = ?auto_725840 ?auto_725847 ) ) ( not ( = ?auto_725840 ?auto_725848 ) ) ( not ( = ?auto_725841 ?auto_725842 ) ) ( not ( = ?auto_725841 ?auto_725843 ) ) ( not ( = ?auto_725841 ?auto_725844 ) ) ( not ( = ?auto_725841 ?auto_725845 ) ) ( not ( = ?auto_725841 ?auto_725846 ) ) ( not ( = ?auto_725841 ?auto_725847 ) ) ( not ( = ?auto_725841 ?auto_725848 ) ) ( not ( = ?auto_725842 ?auto_725843 ) ) ( not ( = ?auto_725842 ?auto_725844 ) ) ( not ( = ?auto_725842 ?auto_725845 ) ) ( not ( = ?auto_725842 ?auto_725846 ) ) ( not ( = ?auto_725842 ?auto_725847 ) ) ( not ( = ?auto_725842 ?auto_725848 ) ) ( not ( = ?auto_725843 ?auto_725844 ) ) ( not ( = ?auto_725843 ?auto_725845 ) ) ( not ( = ?auto_725843 ?auto_725846 ) ) ( not ( = ?auto_725843 ?auto_725847 ) ) ( not ( = ?auto_725843 ?auto_725848 ) ) ( not ( = ?auto_725844 ?auto_725845 ) ) ( not ( = ?auto_725844 ?auto_725846 ) ) ( not ( = ?auto_725844 ?auto_725847 ) ) ( not ( = ?auto_725844 ?auto_725848 ) ) ( not ( = ?auto_725845 ?auto_725846 ) ) ( not ( = ?auto_725845 ?auto_725847 ) ) ( not ( = ?auto_725845 ?auto_725848 ) ) ( not ( = ?auto_725846 ?auto_725847 ) ) ( not ( = ?auto_725846 ?auto_725848 ) ) ( not ( = ?auto_725847 ?auto_725848 ) ) ( ON ?auto_725846 ?auto_725847 ) ( ON ?auto_725845 ?auto_725846 ) ( ON ?auto_725844 ?auto_725845 ) ( ON ?auto_725843 ?auto_725844 ) ( CLEAR ?auto_725841 ) ( ON ?auto_725842 ?auto_725843 ) ( CLEAR ?auto_725842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_725839 ?auto_725840 ?auto_725841 ?auto_725842 )
      ( MAKE-9PILE ?auto_725839 ?auto_725840 ?auto_725841 ?auto_725842 ?auto_725843 ?auto_725844 ?auto_725845 ?auto_725846 ?auto_725847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725877 - BLOCK
      ?auto_725878 - BLOCK
      ?auto_725879 - BLOCK
      ?auto_725880 - BLOCK
      ?auto_725881 - BLOCK
      ?auto_725882 - BLOCK
      ?auto_725883 - BLOCK
      ?auto_725884 - BLOCK
      ?auto_725885 - BLOCK
    )
    :vars
    (
      ?auto_725886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725885 ?auto_725886 ) ( ON-TABLE ?auto_725877 ) ( ON ?auto_725878 ?auto_725877 ) ( not ( = ?auto_725877 ?auto_725878 ) ) ( not ( = ?auto_725877 ?auto_725879 ) ) ( not ( = ?auto_725877 ?auto_725880 ) ) ( not ( = ?auto_725877 ?auto_725881 ) ) ( not ( = ?auto_725877 ?auto_725882 ) ) ( not ( = ?auto_725877 ?auto_725883 ) ) ( not ( = ?auto_725877 ?auto_725884 ) ) ( not ( = ?auto_725877 ?auto_725885 ) ) ( not ( = ?auto_725877 ?auto_725886 ) ) ( not ( = ?auto_725878 ?auto_725879 ) ) ( not ( = ?auto_725878 ?auto_725880 ) ) ( not ( = ?auto_725878 ?auto_725881 ) ) ( not ( = ?auto_725878 ?auto_725882 ) ) ( not ( = ?auto_725878 ?auto_725883 ) ) ( not ( = ?auto_725878 ?auto_725884 ) ) ( not ( = ?auto_725878 ?auto_725885 ) ) ( not ( = ?auto_725878 ?auto_725886 ) ) ( not ( = ?auto_725879 ?auto_725880 ) ) ( not ( = ?auto_725879 ?auto_725881 ) ) ( not ( = ?auto_725879 ?auto_725882 ) ) ( not ( = ?auto_725879 ?auto_725883 ) ) ( not ( = ?auto_725879 ?auto_725884 ) ) ( not ( = ?auto_725879 ?auto_725885 ) ) ( not ( = ?auto_725879 ?auto_725886 ) ) ( not ( = ?auto_725880 ?auto_725881 ) ) ( not ( = ?auto_725880 ?auto_725882 ) ) ( not ( = ?auto_725880 ?auto_725883 ) ) ( not ( = ?auto_725880 ?auto_725884 ) ) ( not ( = ?auto_725880 ?auto_725885 ) ) ( not ( = ?auto_725880 ?auto_725886 ) ) ( not ( = ?auto_725881 ?auto_725882 ) ) ( not ( = ?auto_725881 ?auto_725883 ) ) ( not ( = ?auto_725881 ?auto_725884 ) ) ( not ( = ?auto_725881 ?auto_725885 ) ) ( not ( = ?auto_725881 ?auto_725886 ) ) ( not ( = ?auto_725882 ?auto_725883 ) ) ( not ( = ?auto_725882 ?auto_725884 ) ) ( not ( = ?auto_725882 ?auto_725885 ) ) ( not ( = ?auto_725882 ?auto_725886 ) ) ( not ( = ?auto_725883 ?auto_725884 ) ) ( not ( = ?auto_725883 ?auto_725885 ) ) ( not ( = ?auto_725883 ?auto_725886 ) ) ( not ( = ?auto_725884 ?auto_725885 ) ) ( not ( = ?auto_725884 ?auto_725886 ) ) ( not ( = ?auto_725885 ?auto_725886 ) ) ( ON ?auto_725884 ?auto_725885 ) ( ON ?auto_725883 ?auto_725884 ) ( ON ?auto_725882 ?auto_725883 ) ( ON ?auto_725881 ?auto_725882 ) ( ON ?auto_725880 ?auto_725881 ) ( CLEAR ?auto_725878 ) ( ON ?auto_725879 ?auto_725880 ) ( CLEAR ?auto_725879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_725877 ?auto_725878 ?auto_725879 )
      ( MAKE-9PILE ?auto_725877 ?auto_725878 ?auto_725879 ?auto_725880 ?auto_725881 ?auto_725882 ?auto_725883 ?auto_725884 ?auto_725885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725915 - BLOCK
      ?auto_725916 - BLOCK
      ?auto_725917 - BLOCK
      ?auto_725918 - BLOCK
      ?auto_725919 - BLOCK
      ?auto_725920 - BLOCK
      ?auto_725921 - BLOCK
      ?auto_725922 - BLOCK
      ?auto_725923 - BLOCK
    )
    :vars
    (
      ?auto_725924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725923 ?auto_725924 ) ( ON-TABLE ?auto_725915 ) ( not ( = ?auto_725915 ?auto_725916 ) ) ( not ( = ?auto_725915 ?auto_725917 ) ) ( not ( = ?auto_725915 ?auto_725918 ) ) ( not ( = ?auto_725915 ?auto_725919 ) ) ( not ( = ?auto_725915 ?auto_725920 ) ) ( not ( = ?auto_725915 ?auto_725921 ) ) ( not ( = ?auto_725915 ?auto_725922 ) ) ( not ( = ?auto_725915 ?auto_725923 ) ) ( not ( = ?auto_725915 ?auto_725924 ) ) ( not ( = ?auto_725916 ?auto_725917 ) ) ( not ( = ?auto_725916 ?auto_725918 ) ) ( not ( = ?auto_725916 ?auto_725919 ) ) ( not ( = ?auto_725916 ?auto_725920 ) ) ( not ( = ?auto_725916 ?auto_725921 ) ) ( not ( = ?auto_725916 ?auto_725922 ) ) ( not ( = ?auto_725916 ?auto_725923 ) ) ( not ( = ?auto_725916 ?auto_725924 ) ) ( not ( = ?auto_725917 ?auto_725918 ) ) ( not ( = ?auto_725917 ?auto_725919 ) ) ( not ( = ?auto_725917 ?auto_725920 ) ) ( not ( = ?auto_725917 ?auto_725921 ) ) ( not ( = ?auto_725917 ?auto_725922 ) ) ( not ( = ?auto_725917 ?auto_725923 ) ) ( not ( = ?auto_725917 ?auto_725924 ) ) ( not ( = ?auto_725918 ?auto_725919 ) ) ( not ( = ?auto_725918 ?auto_725920 ) ) ( not ( = ?auto_725918 ?auto_725921 ) ) ( not ( = ?auto_725918 ?auto_725922 ) ) ( not ( = ?auto_725918 ?auto_725923 ) ) ( not ( = ?auto_725918 ?auto_725924 ) ) ( not ( = ?auto_725919 ?auto_725920 ) ) ( not ( = ?auto_725919 ?auto_725921 ) ) ( not ( = ?auto_725919 ?auto_725922 ) ) ( not ( = ?auto_725919 ?auto_725923 ) ) ( not ( = ?auto_725919 ?auto_725924 ) ) ( not ( = ?auto_725920 ?auto_725921 ) ) ( not ( = ?auto_725920 ?auto_725922 ) ) ( not ( = ?auto_725920 ?auto_725923 ) ) ( not ( = ?auto_725920 ?auto_725924 ) ) ( not ( = ?auto_725921 ?auto_725922 ) ) ( not ( = ?auto_725921 ?auto_725923 ) ) ( not ( = ?auto_725921 ?auto_725924 ) ) ( not ( = ?auto_725922 ?auto_725923 ) ) ( not ( = ?auto_725922 ?auto_725924 ) ) ( not ( = ?auto_725923 ?auto_725924 ) ) ( ON ?auto_725922 ?auto_725923 ) ( ON ?auto_725921 ?auto_725922 ) ( ON ?auto_725920 ?auto_725921 ) ( ON ?auto_725919 ?auto_725920 ) ( ON ?auto_725918 ?auto_725919 ) ( ON ?auto_725917 ?auto_725918 ) ( CLEAR ?auto_725915 ) ( ON ?auto_725916 ?auto_725917 ) ( CLEAR ?auto_725916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_725915 ?auto_725916 )
      ( MAKE-9PILE ?auto_725915 ?auto_725916 ?auto_725917 ?auto_725918 ?auto_725919 ?auto_725920 ?auto_725921 ?auto_725922 ?auto_725923 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_725953 - BLOCK
      ?auto_725954 - BLOCK
      ?auto_725955 - BLOCK
      ?auto_725956 - BLOCK
      ?auto_725957 - BLOCK
      ?auto_725958 - BLOCK
      ?auto_725959 - BLOCK
      ?auto_725960 - BLOCK
      ?auto_725961 - BLOCK
    )
    :vars
    (
      ?auto_725962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_725961 ?auto_725962 ) ( not ( = ?auto_725953 ?auto_725954 ) ) ( not ( = ?auto_725953 ?auto_725955 ) ) ( not ( = ?auto_725953 ?auto_725956 ) ) ( not ( = ?auto_725953 ?auto_725957 ) ) ( not ( = ?auto_725953 ?auto_725958 ) ) ( not ( = ?auto_725953 ?auto_725959 ) ) ( not ( = ?auto_725953 ?auto_725960 ) ) ( not ( = ?auto_725953 ?auto_725961 ) ) ( not ( = ?auto_725953 ?auto_725962 ) ) ( not ( = ?auto_725954 ?auto_725955 ) ) ( not ( = ?auto_725954 ?auto_725956 ) ) ( not ( = ?auto_725954 ?auto_725957 ) ) ( not ( = ?auto_725954 ?auto_725958 ) ) ( not ( = ?auto_725954 ?auto_725959 ) ) ( not ( = ?auto_725954 ?auto_725960 ) ) ( not ( = ?auto_725954 ?auto_725961 ) ) ( not ( = ?auto_725954 ?auto_725962 ) ) ( not ( = ?auto_725955 ?auto_725956 ) ) ( not ( = ?auto_725955 ?auto_725957 ) ) ( not ( = ?auto_725955 ?auto_725958 ) ) ( not ( = ?auto_725955 ?auto_725959 ) ) ( not ( = ?auto_725955 ?auto_725960 ) ) ( not ( = ?auto_725955 ?auto_725961 ) ) ( not ( = ?auto_725955 ?auto_725962 ) ) ( not ( = ?auto_725956 ?auto_725957 ) ) ( not ( = ?auto_725956 ?auto_725958 ) ) ( not ( = ?auto_725956 ?auto_725959 ) ) ( not ( = ?auto_725956 ?auto_725960 ) ) ( not ( = ?auto_725956 ?auto_725961 ) ) ( not ( = ?auto_725956 ?auto_725962 ) ) ( not ( = ?auto_725957 ?auto_725958 ) ) ( not ( = ?auto_725957 ?auto_725959 ) ) ( not ( = ?auto_725957 ?auto_725960 ) ) ( not ( = ?auto_725957 ?auto_725961 ) ) ( not ( = ?auto_725957 ?auto_725962 ) ) ( not ( = ?auto_725958 ?auto_725959 ) ) ( not ( = ?auto_725958 ?auto_725960 ) ) ( not ( = ?auto_725958 ?auto_725961 ) ) ( not ( = ?auto_725958 ?auto_725962 ) ) ( not ( = ?auto_725959 ?auto_725960 ) ) ( not ( = ?auto_725959 ?auto_725961 ) ) ( not ( = ?auto_725959 ?auto_725962 ) ) ( not ( = ?auto_725960 ?auto_725961 ) ) ( not ( = ?auto_725960 ?auto_725962 ) ) ( not ( = ?auto_725961 ?auto_725962 ) ) ( ON ?auto_725960 ?auto_725961 ) ( ON ?auto_725959 ?auto_725960 ) ( ON ?auto_725958 ?auto_725959 ) ( ON ?auto_725957 ?auto_725958 ) ( ON ?auto_725956 ?auto_725957 ) ( ON ?auto_725955 ?auto_725956 ) ( ON ?auto_725954 ?auto_725955 ) ( ON ?auto_725953 ?auto_725954 ) ( CLEAR ?auto_725953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_725953 )
      ( MAKE-9PILE ?auto_725953 ?auto_725954 ?auto_725955 ?auto_725956 ?auto_725957 ?auto_725958 ?auto_725959 ?auto_725960 ?auto_725961 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_725992 - BLOCK
      ?auto_725993 - BLOCK
      ?auto_725994 - BLOCK
      ?auto_725995 - BLOCK
      ?auto_725996 - BLOCK
      ?auto_725997 - BLOCK
      ?auto_725998 - BLOCK
      ?auto_725999 - BLOCK
      ?auto_726000 - BLOCK
      ?auto_726001 - BLOCK
    )
    :vars
    (
      ?auto_726002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_726000 ) ( ON ?auto_726001 ?auto_726002 ) ( CLEAR ?auto_726001 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_725992 ) ( ON ?auto_725993 ?auto_725992 ) ( ON ?auto_725994 ?auto_725993 ) ( ON ?auto_725995 ?auto_725994 ) ( ON ?auto_725996 ?auto_725995 ) ( ON ?auto_725997 ?auto_725996 ) ( ON ?auto_725998 ?auto_725997 ) ( ON ?auto_725999 ?auto_725998 ) ( ON ?auto_726000 ?auto_725999 ) ( not ( = ?auto_725992 ?auto_725993 ) ) ( not ( = ?auto_725992 ?auto_725994 ) ) ( not ( = ?auto_725992 ?auto_725995 ) ) ( not ( = ?auto_725992 ?auto_725996 ) ) ( not ( = ?auto_725992 ?auto_725997 ) ) ( not ( = ?auto_725992 ?auto_725998 ) ) ( not ( = ?auto_725992 ?auto_725999 ) ) ( not ( = ?auto_725992 ?auto_726000 ) ) ( not ( = ?auto_725992 ?auto_726001 ) ) ( not ( = ?auto_725992 ?auto_726002 ) ) ( not ( = ?auto_725993 ?auto_725994 ) ) ( not ( = ?auto_725993 ?auto_725995 ) ) ( not ( = ?auto_725993 ?auto_725996 ) ) ( not ( = ?auto_725993 ?auto_725997 ) ) ( not ( = ?auto_725993 ?auto_725998 ) ) ( not ( = ?auto_725993 ?auto_725999 ) ) ( not ( = ?auto_725993 ?auto_726000 ) ) ( not ( = ?auto_725993 ?auto_726001 ) ) ( not ( = ?auto_725993 ?auto_726002 ) ) ( not ( = ?auto_725994 ?auto_725995 ) ) ( not ( = ?auto_725994 ?auto_725996 ) ) ( not ( = ?auto_725994 ?auto_725997 ) ) ( not ( = ?auto_725994 ?auto_725998 ) ) ( not ( = ?auto_725994 ?auto_725999 ) ) ( not ( = ?auto_725994 ?auto_726000 ) ) ( not ( = ?auto_725994 ?auto_726001 ) ) ( not ( = ?auto_725994 ?auto_726002 ) ) ( not ( = ?auto_725995 ?auto_725996 ) ) ( not ( = ?auto_725995 ?auto_725997 ) ) ( not ( = ?auto_725995 ?auto_725998 ) ) ( not ( = ?auto_725995 ?auto_725999 ) ) ( not ( = ?auto_725995 ?auto_726000 ) ) ( not ( = ?auto_725995 ?auto_726001 ) ) ( not ( = ?auto_725995 ?auto_726002 ) ) ( not ( = ?auto_725996 ?auto_725997 ) ) ( not ( = ?auto_725996 ?auto_725998 ) ) ( not ( = ?auto_725996 ?auto_725999 ) ) ( not ( = ?auto_725996 ?auto_726000 ) ) ( not ( = ?auto_725996 ?auto_726001 ) ) ( not ( = ?auto_725996 ?auto_726002 ) ) ( not ( = ?auto_725997 ?auto_725998 ) ) ( not ( = ?auto_725997 ?auto_725999 ) ) ( not ( = ?auto_725997 ?auto_726000 ) ) ( not ( = ?auto_725997 ?auto_726001 ) ) ( not ( = ?auto_725997 ?auto_726002 ) ) ( not ( = ?auto_725998 ?auto_725999 ) ) ( not ( = ?auto_725998 ?auto_726000 ) ) ( not ( = ?auto_725998 ?auto_726001 ) ) ( not ( = ?auto_725998 ?auto_726002 ) ) ( not ( = ?auto_725999 ?auto_726000 ) ) ( not ( = ?auto_725999 ?auto_726001 ) ) ( not ( = ?auto_725999 ?auto_726002 ) ) ( not ( = ?auto_726000 ?auto_726001 ) ) ( not ( = ?auto_726000 ?auto_726002 ) ) ( not ( = ?auto_726001 ?auto_726002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_726001 ?auto_726002 )
      ( !STACK ?auto_726001 ?auto_726000 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726034 - BLOCK
      ?auto_726035 - BLOCK
      ?auto_726036 - BLOCK
      ?auto_726037 - BLOCK
      ?auto_726038 - BLOCK
      ?auto_726039 - BLOCK
      ?auto_726040 - BLOCK
      ?auto_726041 - BLOCK
      ?auto_726042 - BLOCK
      ?auto_726043 - BLOCK
    )
    :vars
    (
      ?auto_726044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726043 ?auto_726044 ) ( ON-TABLE ?auto_726034 ) ( ON ?auto_726035 ?auto_726034 ) ( ON ?auto_726036 ?auto_726035 ) ( ON ?auto_726037 ?auto_726036 ) ( ON ?auto_726038 ?auto_726037 ) ( ON ?auto_726039 ?auto_726038 ) ( ON ?auto_726040 ?auto_726039 ) ( ON ?auto_726041 ?auto_726040 ) ( not ( = ?auto_726034 ?auto_726035 ) ) ( not ( = ?auto_726034 ?auto_726036 ) ) ( not ( = ?auto_726034 ?auto_726037 ) ) ( not ( = ?auto_726034 ?auto_726038 ) ) ( not ( = ?auto_726034 ?auto_726039 ) ) ( not ( = ?auto_726034 ?auto_726040 ) ) ( not ( = ?auto_726034 ?auto_726041 ) ) ( not ( = ?auto_726034 ?auto_726042 ) ) ( not ( = ?auto_726034 ?auto_726043 ) ) ( not ( = ?auto_726034 ?auto_726044 ) ) ( not ( = ?auto_726035 ?auto_726036 ) ) ( not ( = ?auto_726035 ?auto_726037 ) ) ( not ( = ?auto_726035 ?auto_726038 ) ) ( not ( = ?auto_726035 ?auto_726039 ) ) ( not ( = ?auto_726035 ?auto_726040 ) ) ( not ( = ?auto_726035 ?auto_726041 ) ) ( not ( = ?auto_726035 ?auto_726042 ) ) ( not ( = ?auto_726035 ?auto_726043 ) ) ( not ( = ?auto_726035 ?auto_726044 ) ) ( not ( = ?auto_726036 ?auto_726037 ) ) ( not ( = ?auto_726036 ?auto_726038 ) ) ( not ( = ?auto_726036 ?auto_726039 ) ) ( not ( = ?auto_726036 ?auto_726040 ) ) ( not ( = ?auto_726036 ?auto_726041 ) ) ( not ( = ?auto_726036 ?auto_726042 ) ) ( not ( = ?auto_726036 ?auto_726043 ) ) ( not ( = ?auto_726036 ?auto_726044 ) ) ( not ( = ?auto_726037 ?auto_726038 ) ) ( not ( = ?auto_726037 ?auto_726039 ) ) ( not ( = ?auto_726037 ?auto_726040 ) ) ( not ( = ?auto_726037 ?auto_726041 ) ) ( not ( = ?auto_726037 ?auto_726042 ) ) ( not ( = ?auto_726037 ?auto_726043 ) ) ( not ( = ?auto_726037 ?auto_726044 ) ) ( not ( = ?auto_726038 ?auto_726039 ) ) ( not ( = ?auto_726038 ?auto_726040 ) ) ( not ( = ?auto_726038 ?auto_726041 ) ) ( not ( = ?auto_726038 ?auto_726042 ) ) ( not ( = ?auto_726038 ?auto_726043 ) ) ( not ( = ?auto_726038 ?auto_726044 ) ) ( not ( = ?auto_726039 ?auto_726040 ) ) ( not ( = ?auto_726039 ?auto_726041 ) ) ( not ( = ?auto_726039 ?auto_726042 ) ) ( not ( = ?auto_726039 ?auto_726043 ) ) ( not ( = ?auto_726039 ?auto_726044 ) ) ( not ( = ?auto_726040 ?auto_726041 ) ) ( not ( = ?auto_726040 ?auto_726042 ) ) ( not ( = ?auto_726040 ?auto_726043 ) ) ( not ( = ?auto_726040 ?auto_726044 ) ) ( not ( = ?auto_726041 ?auto_726042 ) ) ( not ( = ?auto_726041 ?auto_726043 ) ) ( not ( = ?auto_726041 ?auto_726044 ) ) ( not ( = ?auto_726042 ?auto_726043 ) ) ( not ( = ?auto_726042 ?auto_726044 ) ) ( not ( = ?auto_726043 ?auto_726044 ) ) ( CLEAR ?auto_726041 ) ( ON ?auto_726042 ?auto_726043 ) ( CLEAR ?auto_726042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_726034 ?auto_726035 ?auto_726036 ?auto_726037 ?auto_726038 ?auto_726039 ?auto_726040 ?auto_726041 ?auto_726042 )
      ( MAKE-10PILE ?auto_726034 ?auto_726035 ?auto_726036 ?auto_726037 ?auto_726038 ?auto_726039 ?auto_726040 ?auto_726041 ?auto_726042 ?auto_726043 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726076 - BLOCK
      ?auto_726077 - BLOCK
      ?auto_726078 - BLOCK
      ?auto_726079 - BLOCK
      ?auto_726080 - BLOCK
      ?auto_726081 - BLOCK
      ?auto_726082 - BLOCK
      ?auto_726083 - BLOCK
      ?auto_726084 - BLOCK
      ?auto_726085 - BLOCK
    )
    :vars
    (
      ?auto_726086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726085 ?auto_726086 ) ( ON-TABLE ?auto_726076 ) ( ON ?auto_726077 ?auto_726076 ) ( ON ?auto_726078 ?auto_726077 ) ( ON ?auto_726079 ?auto_726078 ) ( ON ?auto_726080 ?auto_726079 ) ( ON ?auto_726081 ?auto_726080 ) ( ON ?auto_726082 ?auto_726081 ) ( not ( = ?auto_726076 ?auto_726077 ) ) ( not ( = ?auto_726076 ?auto_726078 ) ) ( not ( = ?auto_726076 ?auto_726079 ) ) ( not ( = ?auto_726076 ?auto_726080 ) ) ( not ( = ?auto_726076 ?auto_726081 ) ) ( not ( = ?auto_726076 ?auto_726082 ) ) ( not ( = ?auto_726076 ?auto_726083 ) ) ( not ( = ?auto_726076 ?auto_726084 ) ) ( not ( = ?auto_726076 ?auto_726085 ) ) ( not ( = ?auto_726076 ?auto_726086 ) ) ( not ( = ?auto_726077 ?auto_726078 ) ) ( not ( = ?auto_726077 ?auto_726079 ) ) ( not ( = ?auto_726077 ?auto_726080 ) ) ( not ( = ?auto_726077 ?auto_726081 ) ) ( not ( = ?auto_726077 ?auto_726082 ) ) ( not ( = ?auto_726077 ?auto_726083 ) ) ( not ( = ?auto_726077 ?auto_726084 ) ) ( not ( = ?auto_726077 ?auto_726085 ) ) ( not ( = ?auto_726077 ?auto_726086 ) ) ( not ( = ?auto_726078 ?auto_726079 ) ) ( not ( = ?auto_726078 ?auto_726080 ) ) ( not ( = ?auto_726078 ?auto_726081 ) ) ( not ( = ?auto_726078 ?auto_726082 ) ) ( not ( = ?auto_726078 ?auto_726083 ) ) ( not ( = ?auto_726078 ?auto_726084 ) ) ( not ( = ?auto_726078 ?auto_726085 ) ) ( not ( = ?auto_726078 ?auto_726086 ) ) ( not ( = ?auto_726079 ?auto_726080 ) ) ( not ( = ?auto_726079 ?auto_726081 ) ) ( not ( = ?auto_726079 ?auto_726082 ) ) ( not ( = ?auto_726079 ?auto_726083 ) ) ( not ( = ?auto_726079 ?auto_726084 ) ) ( not ( = ?auto_726079 ?auto_726085 ) ) ( not ( = ?auto_726079 ?auto_726086 ) ) ( not ( = ?auto_726080 ?auto_726081 ) ) ( not ( = ?auto_726080 ?auto_726082 ) ) ( not ( = ?auto_726080 ?auto_726083 ) ) ( not ( = ?auto_726080 ?auto_726084 ) ) ( not ( = ?auto_726080 ?auto_726085 ) ) ( not ( = ?auto_726080 ?auto_726086 ) ) ( not ( = ?auto_726081 ?auto_726082 ) ) ( not ( = ?auto_726081 ?auto_726083 ) ) ( not ( = ?auto_726081 ?auto_726084 ) ) ( not ( = ?auto_726081 ?auto_726085 ) ) ( not ( = ?auto_726081 ?auto_726086 ) ) ( not ( = ?auto_726082 ?auto_726083 ) ) ( not ( = ?auto_726082 ?auto_726084 ) ) ( not ( = ?auto_726082 ?auto_726085 ) ) ( not ( = ?auto_726082 ?auto_726086 ) ) ( not ( = ?auto_726083 ?auto_726084 ) ) ( not ( = ?auto_726083 ?auto_726085 ) ) ( not ( = ?auto_726083 ?auto_726086 ) ) ( not ( = ?auto_726084 ?auto_726085 ) ) ( not ( = ?auto_726084 ?auto_726086 ) ) ( not ( = ?auto_726085 ?auto_726086 ) ) ( ON ?auto_726084 ?auto_726085 ) ( CLEAR ?auto_726082 ) ( ON ?auto_726083 ?auto_726084 ) ( CLEAR ?auto_726083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_726076 ?auto_726077 ?auto_726078 ?auto_726079 ?auto_726080 ?auto_726081 ?auto_726082 ?auto_726083 )
      ( MAKE-10PILE ?auto_726076 ?auto_726077 ?auto_726078 ?auto_726079 ?auto_726080 ?auto_726081 ?auto_726082 ?auto_726083 ?auto_726084 ?auto_726085 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726118 - BLOCK
      ?auto_726119 - BLOCK
      ?auto_726120 - BLOCK
      ?auto_726121 - BLOCK
      ?auto_726122 - BLOCK
      ?auto_726123 - BLOCK
      ?auto_726124 - BLOCK
      ?auto_726125 - BLOCK
      ?auto_726126 - BLOCK
      ?auto_726127 - BLOCK
    )
    :vars
    (
      ?auto_726128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726127 ?auto_726128 ) ( ON-TABLE ?auto_726118 ) ( ON ?auto_726119 ?auto_726118 ) ( ON ?auto_726120 ?auto_726119 ) ( ON ?auto_726121 ?auto_726120 ) ( ON ?auto_726122 ?auto_726121 ) ( ON ?auto_726123 ?auto_726122 ) ( not ( = ?auto_726118 ?auto_726119 ) ) ( not ( = ?auto_726118 ?auto_726120 ) ) ( not ( = ?auto_726118 ?auto_726121 ) ) ( not ( = ?auto_726118 ?auto_726122 ) ) ( not ( = ?auto_726118 ?auto_726123 ) ) ( not ( = ?auto_726118 ?auto_726124 ) ) ( not ( = ?auto_726118 ?auto_726125 ) ) ( not ( = ?auto_726118 ?auto_726126 ) ) ( not ( = ?auto_726118 ?auto_726127 ) ) ( not ( = ?auto_726118 ?auto_726128 ) ) ( not ( = ?auto_726119 ?auto_726120 ) ) ( not ( = ?auto_726119 ?auto_726121 ) ) ( not ( = ?auto_726119 ?auto_726122 ) ) ( not ( = ?auto_726119 ?auto_726123 ) ) ( not ( = ?auto_726119 ?auto_726124 ) ) ( not ( = ?auto_726119 ?auto_726125 ) ) ( not ( = ?auto_726119 ?auto_726126 ) ) ( not ( = ?auto_726119 ?auto_726127 ) ) ( not ( = ?auto_726119 ?auto_726128 ) ) ( not ( = ?auto_726120 ?auto_726121 ) ) ( not ( = ?auto_726120 ?auto_726122 ) ) ( not ( = ?auto_726120 ?auto_726123 ) ) ( not ( = ?auto_726120 ?auto_726124 ) ) ( not ( = ?auto_726120 ?auto_726125 ) ) ( not ( = ?auto_726120 ?auto_726126 ) ) ( not ( = ?auto_726120 ?auto_726127 ) ) ( not ( = ?auto_726120 ?auto_726128 ) ) ( not ( = ?auto_726121 ?auto_726122 ) ) ( not ( = ?auto_726121 ?auto_726123 ) ) ( not ( = ?auto_726121 ?auto_726124 ) ) ( not ( = ?auto_726121 ?auto_726125 ) ) ( not ( = ?auto_726121 ?auto_726126 ) ) ( not ( = ?auto_726121 ?auto_726127 ) ) ( not ( = ?auto_726121 ?auto_726128 ) ) ( not ( = ?auto_726122 ?auto_726123 ) ) ( not ( = ?auto_726122 ?auto_726124 ) ) ( not ( = ?auto_726122 ?auto_726125 ) ) ( not ( = ?auto_726122 ?auto_726126 ) ) ( not ( = ?auto_726122 ?auto_726127 ) ) ( not ( = ?auto_726122 ?auto_726128 ) ) ( not ( = ?auto_726123 ?auto_726124 ) ) ( not ( = ?auto_726123 ?auto_726125 ) ) ( not ( = ?auto_726123 ?auto_726126 ) ) ( not ( = ?auto_726123 ?auto_726127 ) ) ( not ( = ?auto_726123 ?auto_726128 ) ) ( not ( = ?auto_726124 ?auto_726125 ) ) ( not ( = ?auto_726124 ?auto_726126 ) ) ( not ( = ?auto_726124 ?auto_726127 ) ) ( not ( = ?auto_726124 ?auto_726128 ) ) ( not ( = ?auto_726125 ?auto_726126 ) ) ( not ( = ?auto_726125 ?auto_726127 ) ) ( not ( = ?auto_726125 ?auto_726128 ) ) ( not ( = ?auto_726126 ?auto_726127 ) ) ( not ( = ?auto_726126 ?auto_726128 ) ) ( not ( = ?auto_726127 ?auto_726128 ) ) ( ON ?auto_726126 ?auto_726127 ) ( ON ?auto_726125 ?auto_726126 ) ( CLEAR ?auto_726123 ) ( ON ?auto_726124 ?auto_726125 ) ( CLEAR ?auto_726124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_726118 ?auto_726119 ?auto_726120 ?auto_726121 ?auto_726122 ?auto_726123 ?auto_726124 )
      ( MAKE-10PILE ?auto_726118 ?auto_726119 ?auto_726120 ?auto_726121 ?auto_726122 ?auto_726123 ?auto_726124 ?auto_726125 ?auto_726126 ?auto_726127 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726160 - BLOCK
      ?auto_726161 - BLOCK
      ?auto_726162 - BLOCK
      ?auto_726163 - BLOCK
      ?auto_726164 - BLOCK
      ?auto_726165 - BLOCK
      ?auto_726166 - BLOCK
      ?auto_726167 - BLOCK
      ?auto_726168 - BLOCK
      ?auto_726169 - BLOCK
    )
    :vars
    (
      ?auto_726170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726169 ?auto_726170 ) ( ON-TABLE ?auto_726160 ) ( ON ?auto_726161 ?auto_726160 ) ( ON ?auto_726162 ?auto_726161 ) ( ON ?auto_726163 ?auto_726162 ) ( ON ?auto_726164 ?auto_726163 ) ( not ( = ?auto_726160 ?auto_726161 ) ) ( not ( = ?auto_726160 ?auto_726162 ) ) ( not ( = ?auto_726160 ?auto_726163 ) ) ( not ( = ?auto_726160 ?auto_726164 ) ) ( not ( = ?auto_726160 ?auto_726165 ) ) ( not ( = ?auto_726160 ?auto_726166 ) ) ( not ( = ?auto_726160 ?auto_726167 ) ) ( not ( = ?auto_726160 ?auto_726168 ) ) ( not ( = ?auto_726160 ?auto_726169 ) ) ( not ( = ?auto_726160 ?auto_726170 ) ) ( not ( = ?auto_726161 ?auto_726162 ) ) ( not ( = ?auto_726161 ?auto_726163 ) ) ( not ( = ?auto_726161 ?auto_726164 ) ) ( not ( = ?auto_726161 ?auto_726165 ) ) ( not ( = ?auto_726161 ?auto_726166 ) ) ( not ( = ?auto_726161 ?auto_726167 ) ) ( not ( = ?auto_726161 ?auto_726168 ) ) ( not ( = ?auto_726161 ?auto_726169 ) ) ( not ( = ?auto_726161 ?auto_726170 ) ) ( not ( = ?auto_726162 ?auto_726163 ) ) ( not ( = ?auto_726162 ?auto_726164 ) ) ( not ( = ?auto_726162 ?auto_726165 ) ) ( not ( = ?auto_726162 ?auto_726166 ) ) ( not ( = ?auto_726162 ?auto_726167 ) ) ( not ( = ?auto_726162 ?auto_726168 ) ) ( not ( = ?auto_726162 ?auto_726169 ) ) ( not ( = ?auto_726162 ?auto_726170 ) ) ( not ( = ?auto_726163 ?auto_726164 ) ) ( not ( = ?auto_726163 ?auto_726165 ) ) ( not ( = ?auto_726163 ?auto_726166 ) ) ( not ( = ?auto_726163 ?auto_726167 ) ) ( not ( = ?auto_726163 ?auto_726168 ) ) ( not ( = ?auto_726163 ?auto_726169 ) ) ( not ( = ?auto_726163 ?auto_726170 ) ) ( not ( = ?auto_726164 ?auto_726165 ) ) ( not ( = ?auto_726164 ?auto_726166 ) ) ( not ( = ?auto_726164 ?auto_726167 ) ) ( not ( = ?auto_726164 ?auto_726168 ) ) ( not ( = ?auto_726164 ?auto_726169 ) ) ( not ( = ?auto_726164 ?auto_726170 ) ) ( not ( = ?auto_726165 ?auto_726166 ) ) ( not ( = ?auto_726165 ?auto_726167 ) ) ( not ( = ?auto_726165 ?auto_726168 ) ) ( not ( = ?auto_726165 ?auto_726169 ) ) ( not ( = ?auto_726165 ?auto_726170 ) ) ( not ( = ?auto_726166 ?auto_726167 ) ) ( not ( = ?auto_726166 ?auto_726168 ) ) ( not ( = ?auto_726166 ?auto_726169 ) ) ( not ( = ?auto_726166 ?auto_726170 ) ) ( not ( = ?auto_726167 ?auto_726168 ) ) ( not ( = ?auto_726167 ?auto_726169 ) ) ( not ( = ?auto_726167 ?auto_726170 ) ) ( not ( = ?auto_726168 ?auto_726169 ) ) ( not ( = ?auto_726168 ?auto_726170 ) ) ( not ( = ?auto_726169 ?auto_726170 ) ) ( ON ?auto_726168 ?auto_726169 ) ( ON ?auto_726167 ?auto_726168 ) ( ON ?auto_726166 ?auto_726167 ) ( CLEAR ?auto_726164 ) ( ON ?auto_726165 ?auto_726166 ) ( CLEAR ?auto_726165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_726160 ?auto_726161 ?auto_726162 ?auto_726163 ?auto_726164 ?auto_726165 )
      ( MAKE-10PILE ?auto_726160 ?auto_726161 ?auto_726162 ?auto_726163 ?auto_726164 ?auto_726165 ?auto_726166 ?auto_726167 ?auto_726168 ?auto_726169 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726202 - BLOCK
      ?auto_726203 - BLOCK
      ?auto_726204 - BLOCK
      ?auto_726205 - BLOCK
      ?auto_726206 - BLOCK
      ?auto_726207 - BLOCK
      ?auto_726208 - BLOCK
      ?auto_726209 - BLOCK
      ?auto_726210 - BLOCK
      ?auto_726211 - BLOCK
    )
    :vars
    (
      ?auto_726212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726211 ?auto_726212 ) ( ON-TABLE ?auto_726202 ) ( ON ?auto_726203 ?auto_726202 ) ( ON ?auto_726204 ?auto_726203 ) ( ON ?auto_726205 ?auto_726204 ) ( not ( = ?auto_726202 ?auto_726203 ) ) ( not ( = ?auto_726202 ?auto_726204 ) ) ( not ( = ?auto_726202 ?auto_726205 ) ) ( not ( = ?auto_726202 ?auto_726206 ) ) ( not ( = ?auto_726202 ?auto_726207 ) ) ( not ( = ?auto_726202 ?auto_726208 ) ) ( not ( = ?auto_726202 ?auto_726209 ) ) ( not ( = ?auto_726202 ?auto_726210 ) ) ( not ( = ?auto_726202 ?auto_726211 ) ) ( not ( = ?auto_726202 ?auto_726212 ) ) ( not ( = ?auto_726203 ?auto_726204 ) ) ( not ( = ?auto_726203 ?auto_726205 ) ) ( not ( = ?auto_726203 ?auto_726206 ) ) ( not ( = ?auto_726203 ?auto_726207 ) ) ( not ( = ?auto_726203 ?auto_726208 ) ) ( not ( = ?auto_726203 ?auto_726209 ) ) ( not ( = ?auto_726203 ?auto_726210 ) ) ( not ( = ?auto_726203 ?auto_726211 ) ) ( not ( = ?auto_726203 ?auto_726212 ) ) ( not ( = ?auto_726204 ?auto_726205 ) ) ( not ( = ?auto_726204 ?auto_726206 ) ) ( not ( = ?auto_726204 ?auto_726207 ) ) ( not ( = ?auto_726204 ?auto_726208 ) ) ( not ( = ?auto_726204 ?auto_726209 ) ) ( not ( = ?auto_726204 ?auto_726210 ) ) ( not ( = ?auto_726204 ?auto_726211 ) ) ( not ( = ?auto_726204 ?auto_726212 ) ) ( not ( = ?auto_726205 ?auto_726206 ) ) ( not ( = ?auto_726205 ?auto_726207 ) ) ( not ( = ?auto_726205 ?auto_726208 ) ) ( not ( = ?auto_726205 ?auto_726209 ) ) ( not ( = ?auto_726205 ?auto_726210 ) ) ( not ( = ?auto_726205 ?auto_726211 ) ) ( not ( = ?auto_726205 ?auto_726212 ) ) ( not ( = ?auto_726206 ?auto_726207 ) ) ( not ( = ?auto_726206 ?auto_726208 ) ) ( not ( = ?auto_726206 ?auto_726209 ) ) ( not ( = ?auto_726206 ?auto_726210 ) ) ( not ( = ?auto_726206 ?auto_726211 ) ) ( not ( = ?auto_726206 ?auto_726212 ) ) ( not ( = ?auto_726207 ?auto_726208 ) ) ( not ( = ?auto_726207 ?auto_726209 ) ) ( not ( = ?auto_726207 ?auto_726210 ) ) ( not ( = ?auto_726207 ?auto_726211 ) ) ( not ( = ?auto_726207 ?auto_726212 ) ) ( not ( = ?auto_726208 ?auto_726209 ) ) ( not ( = ?auto_726208 ?auto_726210 ) ) ( not ( = ?auto_726208 ?auto_726211 ) ) ( not ( = ?auto_726208 ?auto_726212 ) ) ( not ( = ?auto_726209 ?auto_726210 ) ) ( not ( = ?auto_726209 ?auto_726211 ) ) ( not ( = ?auto_726209 ?auto_726212 ) ) ( not ( = ?auto_726210 ?auto_726211 ) ) ( not ( = ?auto_726210 ?auto_726212 ) ) ( not ( = ?auto_726211 ?auto_726212 ) ) ( ON ?auto_726210 ?auto_726211 ) ( ON ?auto_726209 ?auto_726210 ) ( ON ?auto_726208 ?auto_726209 ) ( ON ?auto_726207 ?auto_726208 ) ( CLEAR ?auto_726205 ) ( ON ?auto_726206 ?auto_726207 ) ( CLEAR ?auto_726206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_726202 ?auto_726203 ?auto_726204 ?auto_726205 ?auto_726206 )
      ( MAKE-10PILE ?auto_726202 ?auto_726203 ?auto_726204 ?auto_726205 ?auto_726206 ?auto_726207 ?auto_726208 ?auto_726209 ?auto_726210 ?auto_726211 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726244 - BLOCK
      ?auto_726245 - BLOCK
      ?auto_726246 - BLOCK
      ?auto_726247 - BLOCK
      ?auto_726248 - BLOCK
      ?auto_726249 - BLOCK
      ?auto_726250 - BLOCK
      ?auto_726251 - BLOCK
      ?auto_726252 - BLOCK
      ?auto_726253 - BLOCK
    )
    :vars
    (
      ?auto_726254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726253 ?auto_726254 ) ( ON-TABLE ?auto_726244 ) ( ON ?auto_726245 ?auto_726244 ) ( ON ?auto_726246 ?auto_726245 ) ( not ( = ?auto_726244 ?auto_726245 ) ) ( not ( = ?auto_726244 ?auto_726246 ) ) ( not ( = ?auto_726244 ?auto_726247 ) ) ( not ( = ?auto_726244 ?auto_726248 ) ) ( not ( = ?auto_726244 ?auto_726249 ) ) ( not ( = ?auto_726244 ?auto_726250 ) ) ( not ( = ?auto_726244 ?auto_726251 ) ) ( not ( = ?auto_726244 ?auto_726252 ) ) ( not ( = ?auto_726244 ?auto_726253 ) ) ( not ( = ?auto_726244 ?auto_726254 ) ) ( not ( = ?auto_726245 ?auto_726246 ) ) ( not ( = ?auto_726245 ?auto_726247 ) ) ( not ( = ?auto_726245 ?auto_726248 ) ) ( not ( = ?auto_726245 ?auto_726249 ) ) ( not ( = ?auto_726245 ?auto_726250 ) ) ( not ( = ?auto_726245 ?auto_726251 ) ) ( not ( = ?auto_726245 ?auto_726252 ) ) ( not ( = ?auto_726245 ?auto_726253 ) ) ( not ( = ?auto_726245 ?auto_726254 ) ) ( not ( = ?auto_726246 ?auto_726247 ) ) ( not ( = ?auto_726246 ?auto_726248 ) ) ( not ( = ?auto_726246 ?auto_726249 ) ) ( not ( = ?auto_726246 ?auto_726250 ) ) ( not ( = ?auto_726246 ?auto_726251 ) ) ( not ( = ?auto_726246 ?auto_726252 ) ) ( not ( = ?auto_726246 ?auto_726253 ) ) ( not ( = ?auto_726246 ?auto_726254 ) ) ( not ( = ?auto_726247 ?auto_726248 ) ) ( not ( = ?auto_726247 ?auto_726249 ) ) ( not ( = ?auto_726247 ?auto_726250 ) ) ( not ( = ?auto_726247 ?auto_726251 ) ) ( not ( = ?auto_726247 ?auto_726252 ) ) ( not ( = ?auto_726247 ?auto_726253 ) ) ( not ( = ?auto_726247 ?auto_726254 ) ) ( not ( = ?auto_726248 ?auto_726249 ) ) ( not ( = ?auto_726248 ?auto_726250 ) ) ( not ( = ?auto_726248 ?auto_726251 ) ) ( not ( = ?auto_726248 ?auto_726252 ) ) ( not ( = ?auto_726248 ?auto_726253 ) ) ( not ( = ?auto_726248 ?auto_726254 ) ) ( not ( = ?auto_726249 ?auto_726250 ) ) ( not ( = ?auto_726249 ?auto_726251 ) ) ( not ( = ?auto_726249 ?auto_726252 ) ) ( not ( = ?auto_726249 ?auto_726253 ) ) ( not ( = ?auto_726249 ?auto_726254 ) ) ( not ( = ?auto_726250 ?auto_726251 ) ) ( not ( = ?auto_726250 ?auto_726252 ) ) ( not ( = ?auto_726250 ?auto_726253 ) ) ( not ( = ?auto_726250 ?auto_726254 ) ) ( not ( = ?auto_726251 ?auto_726252 ) ) ( not ( = ?auto_726251 ?auto_726253 ) ) ( not ( = ?auto_726251 ?auto_726254 ) ) ( not ( = ?auto_726252 ?auto_726253 ) ) ( not ( = ?auto_726252 ?auto_726254 ) ) ( not ( = ?auto_726253 ?auto_726254 ) ) ( ON ?auto_726252 ?auto_726253 ) ( ON ?auto_726251 ?auto_726252 ) ( ON ?auto_726250 ?auto_726251 ) ( ON ?auto_726249 ?auto_726250 ) ( ON ?auto_726248 ?auto_726249 ) ( CLEAR ?auto_726246 ) ( ON ?auto_726247 ?auto_726248 ) ( CLEAR ?auto_726247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_726244 ?auto_726245 ?auto_726246 ?auto_726247 )
      ( MAKE-10PILE ?auto_726244 ?auto_726245 ?auto_726246 ?auto_726247 ?auto_726248 ?auto_726249 ?auto_726250 ?auto_726251 ?auto_726252 ?auto_726253 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726286 - BLOCK
      ?auto_726287 - BLOCK
      ?auto_726288 - BLOCK
      ?auto_726289 - BLOCK
      ?auto_726290 - BLOCK
      ?auto_726291 - BLOCK
      ?auto_726292 - BLOCK
      ?auto_726293 - BLOCK
      ?auto_726294 - BLOCK
      ?auto_726295 - BLOCK
    )
    :vars
    (
      ?auto_726296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726295 ?auto_726296 ) ( ON-TABLE ?auto_726286 ) ( ON ?auto_726287 ?auto_726286 ) ( not ( = ?auto_726286 ?auto_726287 ) ) ( not ( = ?auto_726286 ?auto_726288 ) ) ( not ( = ?auto_726286 ?auto_726289 ) ) ( not ( = ?auto_726286 ?auto_726290 ) ) ( not ( = ?auto_726286 ?auto_726291 ) ) ( not ( = ?auto_726286 ?auto_726292 ) ) ( not ( = ?auto_726286 ?auto_726293 ) ) ( not ( = ?auto_726286 ?auto_726294 ) ) ( not ( = ?auto_726286 ?auto_726295 ) ) ( not ( = ?auto_726286 ?auto_726296 ) ) ( not ( = ?auto_726287 ?auto_726288 ) ) ( not ( = ?auto_726287 ?auto_726289 ) ) ( not ( = ?auto_726287 ?auto_726290 ) ) ( not ( = ?auto_726287 ?auto_726291 ) ) ( not ( = ?auto_726287 ?auto_726292 ) ) ( not ( = ?auto_726287 ?auto_726293 ) ) ( not ( = ?auto_726287 ?auto_726294 ) ) ( not ( = ?auto_726287 ?auto_726295 ) ) ( not ( = ?auto_726287 ?auto_726296 ) ) ( not ( = ?auto_726288 ?auto_726289 ) ) ( not ( = ?auto_726288 ?auto_726290 ) ) ( not ( = ?auto_726288 ?auto_726291 ) ) ( not ( = ?auto_726288 ?auto_726292 ) ) ( not ( = ?auto_726288 ?auto_726293 ) ) ( not ( = ?auto_726288 ?auto_726294 ) ) ( not ( = ?auto_726288 ?auto_726295 ) ) ( not ( = ?auto_726288 ?auto_726296 ) ) ( not ( = ?auto_726289 ?auto_726290 ) ) ( not ( = ?auto_726289 ?auto_726291 ) ) ( not ( = ?auto_726289 ?auto_726292 ) ) ( not ( = ?auto_726289 ?auto_726293 ) ) ( not ( = ?auto_726289 ?auto_726294 ) ) ( not ( = ?auto_726289 ?auto_726295 ) ) ( not ( = ?auto_726289 ?auto_726296 ) ) ( not ( = ?auto_726290 ?auto_726291 ) ) ( not ( = ?auto_726290 ?auto_726292 ) ) ( not ( = ?auto_726290 ?auto_726293 ) ) ( not ( = ?auto_726290 ?auto_726294 ) ) ( not ( = ?auto_726290 ?auto_726295 ) ) ( not ( = ?auto_726290 ?auto_726296 ) ) ( not ( = ?auto_726291 ?auto_726292 ) ) ( not ( = ?auto_726291 ?auto_726293 ) ) ( not ( = ?auto_726291 ?auto_726294 ) ) ( not ( = ?auto_726291 ?auto_726295 ) ) ( not ( = ?auto_726291 ?auto_726296 ) ) ( not ( = ?auto_726292 ?auto_726293 ) ) ( not ( = ?auto_726292 ?auto_726294 ) ) ( not ( = ?auto_726292 ?auto_726295 ) ) ( not ( = ?auto_726292 ?auto_726296 ) ) ( not ( = ?auto_726293 ?auto_726294 ) ) ( not ( = ?auto_726293 ?auto_726295 ) ) ( not ( = ?auto_726293 ?auto_726296 ) ) ( not ( = ?auto_726294 ?auto_726295 ) ) ( not ( = ?auto_726294 ?auto_726296 ) ) ( not ( = ?auto_726295 ?auto_726296 ) ) ( ON ?auto_726294 ?auto_726295 ) ( ON ?auto_726293 ?auto_726294 ) ( ON ?auto_726292 ?auto_726293 ) ( ON ?auto_726291 ?auto_726292 ) ( ON ?auto_726290 ?auto_726291 ) ( ON ?auto_726289 ?auto_726290 ) ( CLEAR ?auto_726287 ) ( ON ?auto_726288 ?auto_726289 ) ( CLEAR ?auto_726288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_726286 ?auto_726287 ?auto_726288 )
      ( MAKE-10PILE ?auto_726286 ?auto_726287 ?auto_726288 ?auto_726289 ?auto_726290 ?auto_726291 ?auto_726292 ?auto_726293 ?auto_726294 ?auto_726295 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726328 - BLOCK
      ?auto_726329 - BLOCK
      ?auto_726330 - BLOCK
      ?auto_726331 - BLOCK
      ?auto_726332 - BLOCK
      ?auto_726333 - BLOCK
      ?auto_726334 - BLOCK
      ?auto_726335 - BLOCK
      ?auto_726336 - BLOCK
      ?auto_726337 - BLOCK
    )
    :vars
    (
      ?auto_726338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726337 ?auto_726338 ) ( ON-TABLE ?auto_726328 ) ( not ( = ?auto_726328 ?auto_726329 ) ) ( not ( = ?auto_726328 ?auto_726330 ) ) ( not ( = ?auto_726328 ?auto_726331 ) ) ( not ( = ?auto_726328 ?auto_726332 ) ) ( not ( = ?auto_726328 ?auto_726333 ) ) ( not ( = ?auto_726328 ?auto_726334 ) ) ( not ( = ?auto_726328 ?auto_726335 ) ) ( not ( = ?auto_726328 ?auto_726336 ) ) ( not ( = ?auto_726328 ?auto_726337 ) ) ( not ( = ?auto_726328 ?auto_726338 ) ) ( not ( = ?auto_726329 ?auto_726330 ) ) ( not ( = ?auto_726329 ?auto_726331 ) ) ( not ( = ?auto_726329 ?auto_726332 ) ) ( not ( = ?auto_726329 ?auto_726333 ) ) ( not ( = ?auto_726329 ?auto_726334 ) ) ( not ( = ?auto_726329 ?auto_726335 ) ) ( not ( = ?auto_726329 ?auto_726336 ) ) ( not ( = ?auto_726329 ?auto_726337 ) ) ( not ( = ?auto_726329 ?auto_726338 ) ) ( not ( = ?auto_726330 ?auto_726331 ) ) ( not ( = ?auto_726330 ?auto_726332 ) ) ( not ( = ?auto_726330 ?auto_726333 ) ) ( not ( = ?auto_726330 ?auto_726334 ) ) ( not ( = ?auto_726330 ?auto_726335 ) ) ( not ( = ?auto_726330 ?auto_726336 ) ) ( not ( = ?auto_726330 ?auto_726337 ) ) ( not ( = ?auto_726330 ?auto_726338 ) ) ( not ( = ?auto_726331 ?auto_726332 ) ) ( not ( = ?auto_726331 ?auto_726333 ) ) ( not ( = ?auto_726331 ?auto_726334 ) ) ( not ( = ?auto_726331 ?auto_726335 ) ) ( not ( = ?auto_726331 ?auto_726336 ) ) ( not ( = ?auto_726331 ?auto_726337 ) ) ( not ( = ?auto_726331 ?auto_726338 ) ) ( not ( = ?auto_726332 ?auto_726333 ) ) ( not ( = ?auto_726332 ?auto_726334 ) ) ( not ( = ?auto_726332 ?auto_726335 ) ) ( not ( = ?auto_726332 ?auto_726336 ) ) ( not ( = ?auto_726332 ?auto_726337 ) ) ( not ( = ?auto_726332 ?auto_726338 ) ) ( not ( = ?auto_726333 ?auto_726334 ) ) ( not ( = ?auto_726333 ?auto_726335 ) ) ( not ( = ?auto_726333 ?auto_726336 ) ) ( not ( = ?auto_726333 ?auto_726337 ) ) ( not ( = ?auto_726333 ?auto_726338 ) ) ( not ( = ?auto_726334 ?auto_726335 ) ) ( not ( = ?auto_726334 ?auto_726336 ) ) ( not ( = ?auto_726334 ?auto_726337 ) ) ( not ( = ?auto_726334 ?auto_726338 ) ) ( not ( = ?auto_726335 ?auto_726336 ) ) ( not ( = ?auto_726335 ?auto_726337 ) ) ( not ( = ?auto_726335 ?auto_726338 ) ) ( not ( = ?auto_726336 ?auto_726337 ) ) ( not ( = ?auto_726336 ?auto_726338 ) ) ( not ( = ?auto_726337 ?auto_726338 ) ) ( ON ?auto_726336 ?auto_726337 ) ( ON ?auto_726335 ?auto_726336 ) ( ON ?auto_726334 ?auto_726335 ) ( ON ?auto_726333 ?auto_726334 ) ( ON ?auto_726332 ?auto_726333 ) ( ON ?auto_726331 ?auto_726332 ) ( ON ?auto_726330 ?auto_726331 ) ( CLEAR ?auto_726328 ) ( ON ?auto_726329 ?auto_726330 ) ( CLEAR ?auto_726329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_726328 ?auto_726329 )
      ( MAKE-10PILE ?auto_726328 ?auto_726329 ?auto_726330 ?auto_726331 ?auto_726332 ?auto_726333 ?auto_726334 ?auto_726335 ?auto_726336 ?auto_726337 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_726370 - BLOCK
      ?auto_726371 - BLOCK
      ?auto_726372 - BLOCK
      ?auto_726373 - BLOCK
      ?auto_726374 - BLOCK
      ?auto_726375 - BLOCK
      ?auto_726376 - BLOCK
      ?auto_726377 - BLOCK
      ?auto_726378 - BLOCK
      ?auto_726379 - BLOCK
    )
    :vars
    (
      ?auto_726380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726379 ?auto_726380 ) ( not ( = ?auto_726370 ?auto_726371 ) ) ( not ( = ?auto_726370 ?auto_726372 ) ) ( not ( = ?auto_726370 ?auto_726373 ) ) ( not ( = ?auto_726370 ?auto_726374 ) ) ( not ( = ?auto_726370 ?auto_726375 ) ) ( not ( = ?auto_726370 ?auto_726376 ) ) ( not ( = ?auto_726370 ?auto_726377 ) ) ( not ( = ?auto_726370 ?auto_726378 ) ) ( not ( = ?auto_726370 ?auto_726379 ) ) ( not ( = ?auto_726370 ?auto_726380 ) ) ( not ( = ?auto_726371 ?auto_726372 ) ) ( not ( = ?auto_726371 ?auto_726373 ) ) ( not ( = ?auto_726371 ?auto_726374 ) ) ( not ( = ?auto_726371 ?auto_726375 ) ) ( not ( = ?auto_726371 ?auto_726376 ) ) ( not ( = ?auto_726371 ?auto_726377 ) ) ( not ( = ?auto_726371 ?auto_726378 ) ) ( not ( = ?auto_726371 ?auto_726379 ) ) ( not ( = ?auto_726371 ?auto_726380 ) ) ( not ( = ?auto_726372 ?auto_726373 ) ) ( not ( = ?auto_726372 ?auto_726374 ) ) ( not ( = ?auto_726372 ?auto_726375 ) ) ( not ( = ?auto_726372 ?auto_726376 ) ) ( not ( = ?auto_726372 ?auto_726377 ) ) ( not ( = ?auto_726372 ?auto_726378 ) ) ( not ( = ?auto_726372 ?auto_726379 ) ) ( not ( = ?auto_726372 ?auto_726380 ) ) ( not ( = ?auto_726373 ?auto_726374 ) ) ( not ( = ?auto_726373 ?auto_726375 ) ) ( not ( = ?auto_726373 ?auto_726376 ) ) ( not ( = ?auto_726373 ?auto_726377 ) ) ( not ( = ?auto_726373 ?auto_726378 ) ) ( not ( = ?auto_726373 ?auto_726379 ) ) ( not ( = ?auto_726373 ?auto_726380 ) ) ( not ( = ?auto_726374 ?auto_726375 ) ) ( not ( = ?auto_726374 ?auto_726376 ) ) ( not ( = ?auto_726374 ?auto_726377 ) ) ( not ( = ?auto_726374 ?auto_726378 ) ) ( not ( = ?auto_726374 ?auto_726379 ) ) ( not ( = ?auto_726374 ?auto_726380 ) ) ( not ( = ?auto_726375 ?auto_726376 ) ) ( not ( = ?auto_726375 ?auto_726377 ) ) ( not ( = ?auto_726375 ?auto_726378 ) ) ( not ( = ?auto_726375 ?auto_726379 ) ) ( not ( = ?auto_726375 ?auto_726380 ) ) ( not ( = ?auto_726376 ?auto_726377 ) ) ( not ( = ?auto_726376 ?auto_726378 ) ) ( not ( = ?auto_726376 ?auto_726379 ) ) ( not ( = ?auto_726376 ?auto_726380 ) ) ( not ( = ?auto_726377 ?auto_726378 ) ) ( not ( = ?auto_726377 ?auto_726379 ) ) ( not ( = ?auto_726377 ?auto_726380 ) ) ( not ( = ?auto_726378 ?auto_726379 ) ) ( not ( = ?auto_726378 ?auto_726380 ) ) ( not ( = ?auto_726379 ?auto_726380 ) ) ( ON ?auto_726378 ?auto_726379 ) ( ON ?auto_726377 ?auto_726378 ) ( ON ?auto_726376 ?auto_726377 ) ( ON ?auto_726375 ?auto_726376 ) ( ON ?auto_726374 ?auto_726375 ) ( ON ?auto_726373 ?auto_726374 ) ( ON ?auto_726372 ?auto_726373 ) ( ON ?auto_726371 ?auto_726372 ) ( ON ?auto_726370 ?auto_726371 ) ( CLEAR ?auto_726370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_726370 )
      ( MAKE-10PILE ?auto_726370 ?auto_726371 ?auto_726372 ?auto_726373 ?auto_726374 ?auto_726375 ?auto_726376 ?auto_726377 ?auto_726378 ?auto_726379 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726413 - BLOCK
      ?auto_726414 - BLOCK
      ?auto_726415 - BLOCK
      ?auto_726416 - BLOCK
      ?auto_726417 - BLOCK
      ?auto_726418 - BLOCK
      ?auto_726419 - BLOCK
      ?auto_726420 - BLOCK
      ?auto_726421 - BLOCK
      ?auto_726422 - BLOCK
      ?auto_726423 - BLOCK
    )
    :vars
    (
      ?auto_726424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_726422 ) ( ON ?auto_726423 ?auto_726424 ) ( CLEAR ?auto_726423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_726413 ) ( ON ?auto_726414 ?auto_726413 ) ( ON ?auto_726415 ?auto_726414 ) ( ON ?auto_726416 ?auto_726415 ) ( ON ?auto_726417 ?auto_726416 ) ( ON ?auto_726418 ?auto_726417 ) ( ON ?auto_726419 ?auto_726418 ) ( ON ?auto_726420 ?auto_726419 ) ( ON ?auto_726421 ?auto_726420 ) ( ON ?auto_726422 ?auto_726421 ) ( not ( = ?auto_726413 ?auto_726414 ) ) ( not ( = ?auto_726413 ?auto_726415 ) ) ( not ( = ?auto_726413 ?auto_726416 ) ) ( not ( = ?auto_726413 ?auto_726417 ) ) ( not ( = ?auto_726413 ?auto_726418 ) ) ( not ( = ?auto_726413 ?auto_726419 ) ) ( not ( = ?auto_726413 ?auto_726420 ) ) ( not ( = ?auto_726413 ?auto_726421 ) ) ( not ( = ?auto_726413 ?auto_726422 ) ) ( not ( = ?auto_726413 ?auto_726423 ) ) ( not ( = ?auto_726413 ?auto_726424 ) ) ( not ( = ?auto_726414 ?auto_726415 ) ) ( not ( = ?auto_726414 ?auto_726416 ) ) ( not ( = ?auto_726414 ?auto_726417 ) ) ( not ( = ?auto_726414 ?auto_726418 ) ) ( not ( = ?auto_726414 ?auto_726419 ) ) ( not ( = ?auto_726414 ?auto_726420 ) ) ( not ( = ?auto_726414 ?auto_726421 ) ) ( not ( = ?auto_726414 ?auto_726422 ) ) ( not ( = ?auto_726414 ?auto_726423 ) ) ( not ( = ?auto_726414 ?auto_726424 ) ) ( not ( = ?auto_726415 ?auto_726416 ) ) ( not ( = ?auto_726415 ?auto_726417 ) ) ( not ( = ?auto_726415 ?auto_726418 ) ) ( not ( = ?auto_726415 ?auto_726419 ) ) ( not ( = ?auto_726415 ?auto_726420 ) ) ( not ( = ?auto_726415 ?auto_726421 ) ) ( not ( = ?auto_726415 ?auto_726422 ) ) ( not ( = ?auto_726415 ?auto_726423 ) ) ( not ( = ?auto_726415 ?auto_726424 ) ) ( not ( = ?auto_726416 ?auto_726417 ) ) ( not ( = ?auto_726416 ?auto_726418 ) ) ( not ( = ?auto_726416 ?auto_726419 ) ) ( not ( = ?auto_726416 ?auto_726420 ) ) ( not ( = ?auto_726416 ?auto_726421 ) ) ( not ( = ?auto_726416 ?auto_726422 ) ) ( not ( = ?auto_726416 ?auto_726423 ) ) ( not ( = ?auto_726416 ?auto_726424 ) ) ( not ( = ?auto_726417 ?auto_726418 ) ) ( not ( = ?auto_726417 ?auto_726419 ) ) ( not ( = ?auto_726417 ?auto_726420 ) ) ( not ( = ?auto_726417 ?auto_726421 ) ) ( not ( = ?auto_726417 ?auto_726422 ) ) ( not ( = ?auto_726417 ?auto_726423 ) ) ( not ( = ?auto_726417 ?auto_726424 ) ) ( not ( = ?auto_726418 ?auto_726419 ) ) ( not ( = ?auto_726418 ?auto_726420 ) ) ( not ( = ?auto_726418 ?auto_726421 ) ) ( not ( = ?auto_726418 ?auto_726422 ) ) ( not ( = ?auto_726418 ?auto_726423 ) ) ( not ( = ?auto_726418 ?auto_726424 ) ) ( not ( = ?auto_726419 ?auto_726420 ) ) ( not ( = ?auto_726419 ?auto_726421 ) ) ( not ( = ?auto_726419 ?auto_726422 ) ) ( not ( = ?auto_726419 ?auto_726423 ) ) ( not ( = ?auto_726419 ?auto_726424 ) ) ( not ( = ?auto_726420 ?auto_726421 ) ) ( not ( = ?auto_726420 ?auto_726422 ) ) ( not ( = ?auto_726420 ?auto_726423 ) ) ( not ( = ?auto_726420 ?auto_726424 ) ) ( not ( = ?auto_726421 ?auto_726422 ) ) ( not ( = ?auto_726421 ?auto_726423 ) ) ( not ( = ?auto_726421 ?auto_726424 ) ) ( not ( = ?auto_726422 ?auto_726423 ) ) ( not ( = ?auto_726422 ?auto_726424 ) ) ( not ( = ?auto_726423 ?auto_726424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_726423 ?auto_726424 )
      ( !STACK ?auto_726423 ?auto_726422 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726459 - BLOCK
      ?auto_726460 - BLOCK
      ?auto_726461 - BLOCK
      ?auto_726462 - BLOCK
      ?auto_726463 - BLOCK
      ?auto_726464 - BLOCK
      ?auto_726465 - BLOCK
      ?auto_726466 - BLOCK
      ?auto_726467 - BLOCK
      ?auto_726468 - BLOCK
      ?auto_726469 - BLOCK
    )
    :vars
    (
      ?auto_726470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726469 ?auto_726470 ) ( ON-TABLE ?auto_726459 ) ( ON ?auto_726460 ?auto_726459 ) ( ON ?auto_726461 ?auto_726460 ) ( ON ?auto_726462 ?auto_726461 ) ( ON ?auto_726463 ?auto_726462 ) ( ON ?auto_726464 ?auto_726463 ) ( ON ?auto_726465 ?auto_726464 ) ( ON ?auto_726466 ?auto_726465 ) ( ON ?auto_726467 ?auto_726466 ) ( not ( = ?auto_726459 ?auto_726460 ) ) ( not ( = ?auto_726459 ?auto_726461 ) ) ( not ( = ?auto_726459 ?auto_726462 ) ) ( not ( = ?auto_726459 ?auto_726463 ) ) ( not ( = ?auto_726459 ?auto_726464 ) ) ( not ( = ?auto_726459 ?auto_726465 ) ) ( not ( = ?auto_726459 ?auto_726466 ) ) ( not ( = ?auto_726459 ?auto_726467 ) ) ( not ( = ?auto_726459 ?auto_726468 ) ) ( not ( = ?auto_726459 ?auto_726469 ) ) ( not ( = ?auto_726459 ?auto_726470 ) ) ( not ( = ?auto_726460 ?auto_726461 ) ) ( not ( = ?auto_726460 ?auto_726462 ) ) ( not ( = ?auto_726460 ?auto_726463 ) ) ( not ( = ?auto_726460 ?auto_726464 ) ) ( not ( = ?auto_726460 ?auto_726465 ) ) ( not ( = ?auto_726460 ?auto_726466 ) ) ( not ( = ?auto_726460 ?auto_726467 ) ) ( not ( = ?auto_726460 ?auto_726468 ) ) ( not ( = ?auto_726460 ?auto_726469 ) ) ( not ( = ?auto_726460 ?auto_726470 ) ) ( not ( = ?auto_726461 ?auto_726462 ) ) ( not ( = ?auto_726461 ?auto_726463 ) ) ( not ( = ?auto_726461 ?auto_726464 ) ) ( not ( = ?auto_726461 ?auto_726465 ) ) ( not ( = ?auto_726461 ?auto_726466 ) ) ( not ( = ?auto_726461 ?auto_726467 ) ) ( not ( = ?auto_726461 ?auto_726468 ) ) ( not ( = ?auto_726461 ?auto_726469 ) ) ( not ( = ?auto_726461 ?auto_726470 ) ) ( not ( = ?auto_726462 ?auto_726463 ) ) ( not ( = ?auto_726462 ?auto_726464 ) ) ( not ( = ?auto_726462 ?auto_726465 ) ) ( not ( = ?auto_726462 ?auto_726466 ) ) ( not ( = ?auto_726462 ?auto_726467 ) ) ( not ( = ?auto_726462 ?auto_726468 ) ) ( not ( = ?auto_726462 ?auto_726469 ) ) ( not ( = ?auto_726462 ?auto_726470 ) ) ( not ( = ?auto_726463 ?auto_726464 ) ) ( not ( = ?auto_726463 ?auto_726465 ) ) ( not ( = ?auto_726463 ?auto_726466 ) ) ( not ( = ?auto_726463 ?auto_726467 ) ) ( not ( = ?auto_726463 ?auto_726468 ) ) ( not ( = ?auto_726463 ?auto_726469 ) ) ( not ( = ?auto_726463 ?auto_726470 ) ) ( not ( = ?auto_726464 ?auto_726465 ) ) ( not ( = ?auto_726464 ?auto_726466 ) ) ( not ( = ?auto_726464 ?auto_726467 ) ) ( not ( = ?auto_726464 ?auto_726468 ) ) ( not ( = ?auto_726464 ?auto_726469 ) ) ( not ( = ?auto_726464 ?auto_726470 ) ) ( not ( = ?auto_726465 ?auto_726466 ) ) ( not ( = ?auto_726465 ?auto_726467 ) ) ( not ( = ?auto_726465 ?auto_726468 ) ) ( not ( = ?auto_726465 ?auto_726469 ) ) ( not ( = ?auto_726465 ?auto_726470 ) ) ( not ( = ?auto_726466 ?auto_726467 ) ) ( not ( = ?auto_726466 ?auto_726468 ) ) ( not ( = ?auto_726466 ?auto_726469 ) ) ( not ( = ?auto_726466 ?auto_726470 ) ) ( not ( = ?auto_726467 ?auto_726468 ) ) ( not ( = ?auto_726467 ?auto_726469 ) ) ( not ( = ?auto_726467 ?auto_726470 ) ) ( not ( = ?auto_726468 ?auto_726469 ) ) ( not ( = ?auto_726468 ?auto_726470 ) ) ( not ( = ?auto_726469 ?auto_726470 ) ) ( CLEAR ?auto_726467 ) ( ON ?auto_726468 ?auto_726469 ) ( CLEAR ?auto_726468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_726459 ?auto_726460 ?auto_726461 ?auto_726462 ?auto_726463 ?auto_726464 ?auto_726465 ?auto_726466 ?auto_726467 ?auto_726468 )
      ( MAKE-11PILE ?auto_726459 ?auto_726460 ?auto_726461 ?auto_726462 ?auto_726463 ?auto_726464 ?auto_726465 ?auto_726466 ?auto_726467 ?auto_726468 ?auto_726469 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726505 - BLOCK
      ?auto_726506 - BLOCK
      ?auto_726507 - BLOCK
      ?auto_726508 - BLOCK
      ?auto_726509 - BLOCK
      ?auto_726510 - BLOCK
      ?auto_726511 - BLOCK
      ?auto_726512 - BLOCK
      ?auto_726513 - BLOCK
      ?auto_726514 - BLOCK
      ?auto_726515 - BLOCK
    )
    :vars
    (
      ?auto_726516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726515 ?auto_726516 ) ( ON-TABLE ?auto_726505 ) ( ON ?auto_726506 ?auto_726505 ) ( ON ?auto_726507 ?auto_726506 ) ( ON ?auto_726508 ?auto_726507 ) ( ON ?auto_726509 ?auto_726508 ) ( ON ?auto_726510 ?auto_726509 ) ( ON ?auto_726511 ?auto_726510 ) ( ON ?auto_726512 ?auto_726511 ) ( not ( = ?auto_726505 ?auto_726506 ) ) ( not ( = ?auto_726505 ?auto_726507 ) ) ( not ( = ?auto_726505 ?auto_726508 ) ) ( not ( = ?auto_726505 ?auto_726509 ) ) ( not ( = ?auto_726505 ?auto_726510 ) ) ( not ( = ?auto_726505 ?auto_726511 ) ) ( not ( = ?auto_726505 ?auto_726512 ) ) ( not ( = ?auto_726505 ?auto_726513 ) ) ( not ( = ?auto_726505 ?auto_726514 ) ) ( not ( = ?auto_726505 ?auto_726515 ) ) ( not ( = ?auto_726505 ?auto_726516 ) ) ( not ( = ?auto_726506 ?auto_726507 ) ) ( not ( = ?auto_726506 ?auto_726508 ) ) ( not ( = ?auto_726506 ?auto_726509 ) ) ( not ( = ?auto_726506 ?auto_726510 ) ) ( not ( = ?auto_726506 ?auto_726511 ) ) ( not ( = ?auto_726506 ?auto_726512 ) ) ( not ( = ?auto_726506 ?auto_726513 ) ) ( not ( = ?auto_726506 ?auto_726514 ) ) ( not ( = ?auto_726506 ?auto_726515 ) ) ( not ( = ?auto_726506 ?auto_726516 ) ) ( not ( = ?auto_726507 ?auto_726508 ) ) ( not ( = ?auto_726507 ?auto_726509 ) ) ( not ( = ?auto_726507 ?auto_726510 ) ) ( not ( = ?auto_726507 ?auto_726511 ) ) ( not ( = ?auto_726507 ?auto_726512 ) ) ( not ( = ?auto_726507 ?auto_726513 ) ) ( not ( = ?auto_726507 ?auto_726514 ) ) ( not ( = ?auto_726507 ?auto_726515 ) ) ( not ( = ?auto_726507 ?auto_726516 ) ) ( not ( = ?auto_726508 ?auto_726509 ) ) ( not ( = ?auto_726508 ?auto_726510 ) ) ( not ( = ?auto_726508 ?auto_726511 ) ) ( not ( = ?auto_726508 ?auto_726512 ) ) ( not ( = ?auto_726508 ?auto_726513 ) ) ( not ( = ?auto_726508 ?auto_726514 ) ) ( not ( = ?auto_726508 ?auto_726515 ) ) ( not ( = ?auto_726508 ?auto_726516 ) ) ( not ( = ?auto_726509 ?auto_726510 ) ) ( not ( = ?auto_726509 ?auto_726511 ) ) ( not ( = ?auto_726509 ?auto_726512 ) ) ( not ( = ?auto_726509 ?auto_726513 ) ) ( not ( = ?auto_726509 ?auto_726514 ) ) ( not ( = ?auto_726509 ?auto_726515 ) ) ( not ( = ?auto_726509 ?auto_726516 ) ) ( not ( = ?auto_726510 ?auto_726511 ) ) ( not ( = ?auto_726510 ?auto_726512 ) ) ( not ( = ?auto_726510 ?auto_726513 ) ) ( not ( = ?auto_726510 ?auto_726514 ) ) ( not ( = ?auto_726510 ?auto_726515 ) ) ( not ( = ?auto_726510 ?auto_726516 ) ) ( not ( = ?auto_726511 ?auto_726512 ) ) ( not ( = ?auto_726511 ?auto_726513 ) ) ( not ( = ?auto_726511 ?auto_726514 ) ) ( not ( = ?auto_726511 ?auto_726515 ) ) ( not ( = ?auto_726511 ?auto_726516 ) ) ( not ( = ?auto_726512 ?auto_726513 ) ) ( not ( = ?auto_726512 ?auto_726514 ) ) ( not ( = ?auto_726512 ?auto_726515 ) ) ( not ( = ?auto_726512 ?auto_726516 ) ) ( not ( = ?auto_726513 ?auto_726514 ) ) ( not ( = ?auto_726513 ?auto_726515 ) ) ( not ( = ?auto_726513 ?auto_726516 ) ) ( not ( = ?auto_726514 ?auto_726515 ) ) ( not ( = ?auto_726514 ?auto_726516 ) ) ( not ( = ?auto_726515 ?auto_726516 ) ) ( ON ?auto_726514 ?auto_726515 ) ( CLEAR ?auto_726512 ) ( ON ?auto_726513 ?auto_726514 ) ( CLEAR ?auto_726513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_726505 ?auto_726506 ?auto_726507 ?auto_726508 ?auto_726509 ?auto_726510 ?auto_726511 ?auto_726512 ?auto_726513 )
      ( MAKE-11PILE ?auto_726505 ?auto_726506 ?auto_726507 ?auto_726508 ?auto_726509 ?auto_726510 ?auto_726511 ?auto_726512 ?auto_726513 ?auto_726514 ?auto_726515 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726551 - BLOCK
      ?auto_726552 - BLOCK
      ?auto_726553 - BLOCK
      ?auto_726554 - BLOCK
      ?auto_726555 - BLOCK
      ?auto_726556 - BLOCK
      ?auto_726557 - BLOCK
      ?auto_726558 - BLOCK
      ?auto_726559 - BLOCK
      ?auto_726560 - BLOCK
      ?auto_726561 - BLOCK
    )
    :vars
    (
      ?auto_726562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726561 ?auto_726562 ) ( ON-TABLE ?auto_726551 ) ( ON ?auto_726552 ?auto_726551 ) ( ON ?auto_726553 ?auto_726552 ) ( ON ?auto_726554 ?auto_726553 ) ( ON ?auto_726555 ?auto_726554 ) ( ON ?auto_726556 ?auto_726555 ) ( ON ?auto_726557 ?auto_726556 ) ( not ( = ?auto_726551 ?auto_726552 ) ) ( not ( = ?auto_726551 ?auto_726553 ) ) ( not ( = ?auto_726551 ?auto_726554 ) ) ( not ( = ?auto_726551 ?auto_726555 ) ) ( not ( = ?auto_726551 ?auto_726556 ) ) ( not ( = ?auto_726551 ?auto_726557 ) ) ( not ( = ?auto_726551 ?auto_726558 ) ) ( not ( = ?auto_726551 ?auto_726559 ) ) ( not ( = ?auto_726551 ?auto_726560 ) ) ( not ( = ?auto_726551 ?auto_726561 ) ) ( not ( = ?auto_726551 ?auto_726562 ) ) ( not ( = ?auto_726552 ?auto_726553 ) ) ( not ( = ?auto_726552 ?auto_726554 ) ) ( not ( = ?auto_726552 ?auto_726555 ) ) ( not ( = ?auto_726552 ?auto_726556 ) ) ( not ( = ?auto_726552 ?auto_726557 ) ) ( not ( = ?auto_726552 ?auto_726558 ) ) ( not ( = ?auto_726552 ?auto_726559 ) ) ( not ( = ?auto_726552 ?auto_726560 ) ) ( not ( = ?auto_726552 ?auto_726561 ) ) ( not ( = ?auto_726552 ?auto_726562 ) ) ( not ( = ?auto_726553 ?auto_726554 ) ) ( not ( = ?auto_726553 ?auto_726555 ) ) ( not ( = ?auto_726553 ?auto_726556 ) ) ( not ( = ?auto_726553 ?auto_726557 ) ) ( not ( = ?auto_726553 ?auto_726558 ) ) ( not ( = ?auto_726553 ?auto_726559 ) ) ( not ( = ?auto_726553 ?auto_726560 ) ) ( not ( = ?auto_726553 ?auto_726561 ) ) ( not ( = ?auto_726553 ?auto_726562 ) ) ( not ( = ?auto_726554 ?auto_726555 ) ) ( not ( = ?auto_726554 ?auto_726556 ) ) ( not ( = ?auto_726554 ?auto_726557 ) ) ( not ( = ?auto_726554 ?auto_726558 ) ) ( not ( = ?auto_726554 ?auto_726559 ) ) ( not ( = ?auto_726554 ?auto_726560 ) ) ( not ( = ?auto_726554 ?auto_726561 ) ) ( not ( = ?auto_726554 ?auto_726562 ) ) ( not ( = ?auto_726555 ?auto_726556 ) ) ( not ( = ?auto_726555 ?auto_726557 ) ) ( not ( = ?auto_726555 ?auto_726558 ) ) ( not ( = ?auto_726555 ?auto_726559 ) ) ( not ( = ?auto_726555 ?auto_726560 ) ) ( not ( = ?auto_726555 ?auto_726561 ) ) ( not ( = ?auto_726555 ?auto_726562 ) ) ( not ( = ?auto_726556 ?auto_726557 ) ) ( not ( = ?auto_726556 ?auto_726558 ) ) ( not ( = ?auto_726556 ?auto_726559 ) ) ( not ( = ?auto_726556 ?auto_726560 ) ) ( not ( = ?auto_726556 ?auto_726561 ) ) ( not ( = ?auto_726556 ?auto_726562 ) ) ( not ( = ?auto_726557 ?auto_726558 ) ) ( not ( = ?auto_726557 ?auto_726559 ) ) ( not ( = ?auto_726557 ?auto_726560 ) ) ( not ( = ?auto_726557 ?auto_726561 ) ) ( not ( = ?auto_726557 ?auto_726562 ) ) ( not ( = ?auto_726558 ?auto_726559 ) ) ( not ( = ?auto_726558 ?auto_726560 ) ) ( not ( = ?auto_726558 ?auto_726561 ) ) ( not ( = ?auto_726558 ?auto_726562 ) ) ( not ( = ?auto_726559 ?auto_726560 ) ) ( not ( = ?auto_726559 ?auto_726561 ) ) ( not ( = ?auto_726559 ?auto_726562 ) ) ( not ( = ?auto_726560 ?auto_726561 ) ) ( not ( = ?auto_726560 ?auto_726562 ) ) ( not ( = ?auto_726561 ?auto_726562 ) ) ( ON ?auto_726560 ?auto_726561 ) ( ON ?auto_726559 ?auto_726560 ) ( CLEAR ?auto_726557 ) ( ON ?auto_726558 ?auto_726559 ) ( CLEAR ?auto_726558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_726551 ?auto_726552 ?auto_726553 ?auto_726554 ?auto_726555 ?auto_726556 ?auto_726557 ?auto_726558 )
      ( MAKE-11PILE ?auto_726551 ?auto_726552 ?auto_726553 ?auto_726554 ?auto_726555 ?auto_726556 ?auto_726557 ?auto_726558 ?auto_726559 ?auto_726560 ?auto_726561 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726597 - BLOCK
      ?auto_726598 - BLOCK
      ?auto_726599 - BLOCK
      ?auto_726600 - BLOCK
      ?auto_726601 - BLOCK
      ?auto_726602 - BLOCK
      ?auto_726603 - BLOCK
      ?auto_726604 - BLOCK
      ?auto_726605 - BLOCK
      ?auto_726606 - BLOCK
      ?auto_726607 - BLOCK
    )
    :vars
    (
      ?auto_726608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726607 ?auto_726608 ) ( ON-TABLE ?auto_726597 ) ( ON ?auto_726598 ?auto_726597 ) ( ON ?auto_726599 ?auto_726598 ) ( ON ?auto_726600 ?auto_726599 ) ( ON ?auto_726601 ?auto_726600 ) ( ON ?auto_726602 ?auto_726601 ) ( not ( = ?auto_726597 ?auto_726598 ) ) ( not ( = ?auto_726597 ?auto_726599 ) ) ( not ( = ?auto_726597 ?auto_726600 ) ) ( not ( = ?auto_726597 ?auto_726601 ) ) ( not ( = ?auto_726597 ?auto_726602 ) ) ( not ( = ?auto_726597 ?auto_726603 ) ) ( not ( = ?auto_726597 ?auto_726604 ) ) ( not ( = ?auto_726597 ?auto_726605 ) ) ( not ( = ?auto_726597 ?auto_726606 ) ) ( not ( = ?auto_726597 ?auto_726607 ) ) ( not ( = ?auto_726597 ?auto_726608 ) ) ( not ( = ?auto_726598 ?auto_726599 ) ) ( not ( = ?auto_726598 ?auto_726600 ) ) ( not ( = ?auto_726598 ?auto_726601 ) ) ( not ( = ?auto_726598 ?auto_726602 ) ) ( not ( = ?auto_726598 ?auto_726603 ) ) ( not ( = ?auto_726598 ?auto_726604 ) ) ( not ( = ?auto_726598 ?auto_726605 ) ) ( not ( = ?auto_726598 ?auto_726606 ) ) ( not ( = ?auto_726598 ?auto_726607 ) ) ( not ( = ?auto_726598 ?auto_726608 ) ) ( not ( = ?auto_726599 ?auto_726600 ) ) ( not ( = ?auto_726599 ?auto_726601 ) ) ( not ( = ?auto_726599 ?auto_726602 ) ) ( not ( = ?auto_726599 ?auto_726603 ) ) ( not ( = ?auto_726599 ?auto_726604 ) ) ( not ( = ?auto_726599 ?auto_726605 ) ) ( not ( = ?auto_726599 ?auto_726606 ) ) ( not ( = ?auto_726599 ?auto_726607 ) ) ( not ( = ?auto_726599 ?auto_726608 ) ) ( not ( = ?auto_726600 ?auto_726601 ) ) ( not ( = ?auto_726600 ?auto_726602 ) ) ( not ( = ?auto_726600 ?auto_726603 ) ) ( not ( = ?auto_726600 ?auto_726604 ) ) ( not ( = ?auto_726600 ?auto_726605 ) ) ( not ( = ?auto_726600 ?auto_726606 ) ) ( not ( = ?auto_726600 ?auto_726607 ) ) ( not ( = ?auto_726600 ?auto_726608 ) ) ( not ( = ?auto_726601 ?auto_726602 ) ) ( not ( = ?auto_726601 ?auto_726603 ) ) ( not ( = ?auto_726601 ?auto_726604 ) ) ( not ( = ?auto_726601 ?auto_726605 ) ) ( not ( = ?auto_726601 ?auto_726606 ) ) ( not ( = ?auto_726601 ?auto_726607 ) ) ( not ( = ?auto_726601 ?auto_726608 ) ) ( not ( = ?auto_726602 ?auto_726603 ) ) ( not ( = ?auto_726602 ?auto_726604 ) ) ( not ( = ?auto_726602 ?auto_726605 ) ) ( not ( = ?auto_726602 ?auto_726606 ) ) ( not ( = ?auto_726602 ?auto_726607 ) ) ( not ( = ?auto_726602 ?auto_726608 ) ) ( not ( = ?auto_726603 ?auto_726604 ) ) ( not ( = ?auto_726603 ?auto_726605 ) ) ( not ( = ?auto_726603 ?auto_726606 ) ) ( not ( = ?auto_726603 ?auto_726607 ) ) ( not ( = ?auto_726603 ?auto_726608 ) ) ( not ( = ?auto_726604 ?auto_726605 ) ) ( not ( = ?auto_726604 ?auto_726606 ) ) ( not ( = ?auto_726604 ?auto_726607 ) ) ( not ( = ?auto_726604 ?auto_726608 ) ) ( not ( = ?auto_726605 ?auto_726606 ) ) ( not ( = ?auto_726605 ?auto_726607 ) ) ( not ( = ?auto_726605 ?auto_726608 ) ) ( not ( = ?auto_726606 ?auto_726607 ) ) ( not ( = ?auto_726606 ?auto_726608 ) ) ( not ( = ?auto_726607 ?auto_726608 ) ) ( ON ?auto_726606 ?auto_726607 ) ( ON ?auto_726605 ?auto_726606 ) ( ON ?auto_726604 ?auto_726605 ) ( CLEAR ?auto_726602 ) ( ON ?auto_726603 ?auto_726604 ) ( CLEAR ?auto_726603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_726597 ?auto_726598 ?auto_726599 ?auto_726600 ?auto_726601 ?auto_726602 ?auto_726603 )
      ( MAKE-11PILE ?auto_726597 ?auto_726598 ?auto_726599 ?auto_726600 ?auto_726601 ?auto_726602 ?auto_726603 ?auto_726604 ?auto_726605 ?auto_726606 ?auto_726607 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726643 - BLOCK
      ?auto_726644 - BLOCK
      ?auto_726645 - BLOCK
      ?auto_726646 - BLOCK
      ?auto_726647 - BLOCK
      ?auto_726648 - BLOCK
      ?auto_726649 - BLOCK
      ?auto_726650 - BLOCK
      ?auto_726651 - BLOCK
      ?auto_726652 - BLOCK
      ?auto_726653 - BLOCK
    )
    :vars
    (
      ?auto_726654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726653 ?auto_726654 ) ( ON-TABLE ?auto_726643 ) ( ON ?auto_726644 ?auto_726643 ) ( ON ?auto_726645 ?auto_726644 ) ( ON ?auto_726646 ?auto_726645 ) ( ON ?auto_726647 ?auto_726646 ) ( not ( = ?auto_726643 ?auto_726644 ) ) ( not ( = ?auto_726643 ?auto_726645 ) ) ( not ( = ?auto_726643 ?auto_726646 ) ) ( not ( = ?auto_726643 ?auto_726647 ) ) ( not ( = ?auto_726643 ?auto_726648 ) ) ( not ( = ?auto_726643 ?auto_726649 ) ) ( not ( = ?auto_726643 ?auto_726650 ) ) ( not ( = ?auto_726643 ?auto_726651 ) ) ( not ( = ?auto_726643 ?auto_726652 ) ) ( not ( = ?auto_726643 ?auto_726653 ) ) ( not ( = ?auto_726643 ?auto_726654 ) ) ( not ( = ?auto_726644 ?auto_726645 ) ) ( not ( = ?auto_726644 ?auto_726646 ) ) ( not ( = ?auto_726644 ?auto_726647 ) ) ( not ( = ?auto_726644 ?auto_726648 ) ) ( not ( = ?auto_726644 ?auto_726649 ) ) ( not ( = ?auto_726644 ?auto_726650 ) ) ( not ( = ?auto_726644 ?auto_726651 ) ) ( not ( = ?auto_726644 ?auto_726652 ) ) ( not ( = ?auto_726644 ?auto_726653 ) ) ( not ( = ?auto_726644 ?auto_726654 ) ) ( not ( = ?auto_726645 ?auto_726646 ) ) ( not ( = ?auto_726645 ?auto_726647 ) ) ( not ( = ?auto_726645 ?auto_726648 ) ) ( not ( = ?auto_726645 ?auto_726649 ) ) ( not ( = ?auto_726645 ?auto_726650 ) ) ( not ( = ?auto_726645 ?auto_726651 ) ) ( not ( = ?auto_726645 ?auto_726652 ) ) ( not ( = ?auto_726645 ?auto_726653 ) ) ( not ( = ?auto_726645 ?auto_726654 ) ) ( not ( = ?auto_726646 ?auto_726647 ) ) ( not ( = ?auto_726646 ?auto_726648 ) ) ( not ( = ?auto_726646 ?auto_726649 ) ) ( not ( = ?auto_726646 ?auto_726650 ) ) ( not ( = ?auto_726646 ?auto_726651 ) ) ( not ( = ?auto_726646 ?auto_726652 ) ) ( not ( = ?auto_726646 ?auto_726653 ) ) ( not ( = ?auto_726646 ?auto_726654 ) ) ( not ( = ?auto_726647 ?auto_726648 ) ) ( not ( = ?auto_726647 ?auto_726649 ) ) ( not ( = ?auto_726647 ?auto_726650 ) ) ( not ( = ?auto_726647 ?auto_726651 ) ) ( not ( = ?auto_726647 ?auto_726652 ) ) ( not ( = ?auto_726647 ?auto_726653 ) ) ( not ( = ?auto_726647 ?auto_726654 ) ) ( not ( = ?auto_726648 ?auto_726649 ) ) ( not ( = ?auto_726648 ?auto_726650 ) ) ( not ( = ?auto_726648 ?auto_726651 ) ) ( not ( = ?auto_726648 ?auto_726652 ) ) ( not ( = ?auto_726648 ?auto_726653 ) ) ( not ( = ?auto_726648 ?auto_726654 ) ) ( not ( = ?auto_726649 ?auto_726650 ) ) ( not ( = ?auto_726649 ?auto_726651 ) ) ( not ( = ?auto_726649 ?auto_726652 ) ) ( not ( = ?auto_726649 ?auto_726653 ) ) ( not ( = ?auto_726649 ?auto_726654 ) ) ( not ( = ?auto_726650 ?auto_726651 ) ) ( not ( = ?auto_726650 ?auto_726652 ) ) ( not ( = ?auto_726650 ?auto_726653 ) ) ( not ( = ?auto_726650 ?auto_726654 ) ) ( not ( = ?auto_726651 ?auto_726652 ) ) ( not ( = ?auto_726651 ?auto_726653 ) ) ( not ( = ?auto_726651 ?auto_726654 ) ) ( not ( = ?auto_726652 ?auto_726653 ) ) ( not ( = ?auto_726652 ?auto_726654 ) ) ( not ( = ?auto_726653 ?auto_726654 ) ) ( ON ?auto_726652 ?auto_726653 ) ( ON ?auto_726651 ?auto_726652 ) ( ON ?auto_726650 ?auto_726651 ) ( ON ?auto_726649 ?auto_726650 ) ( CLEAR ?auto_726647 ) ( ON ?auto_726648 ?auto_726649 ) ( CLEAR ?auto_726648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_726643 ?auto_726644 ?auto_726645 ?auto_726646 ?auto_726647 ?auto_726648 )
      ( MAKE-11PILE ?auto_726643 ?auto_726644 ?auto_726645 ?auto_726646 ?auto_726647 ?auto_726648 ?auto_726649 ?auto_726650 ?auto_726651 ?auto_726652 ?auto_726653 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726689 - BLOCK
      ?auto_726690 - BLOCK
      ?auto_726691 - BLOCK
      ?auto_726692 - BLOCK
      ?auto_726693 - BLOCK
      ?auto_726694 - BLOCK
      ?auto_726695 - BLOCK
      ?auto_726696 - BLOCK
      ?auto_726697 - BLOCK
      ?auto_726698 - BLOCK
      ?auto_726699 - BLOCK
    )
    :vars
    (
      ?auto_726700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726699 ?auto_726700 ) ( ON-TABLE ?auto_726689 ) ( ON ?auto_726690 ?auto_726689 ) ( ON ?auto_726691 ?auto_726690 ) ( ON ?auto_726692 ?auto_726691 ) ( not ( = ?auto_726689 ?auto_726690 ) ) ( not ( = ?auto_726689 ?auto_726691 ) ) ( not ( = ?auto_726689 ?auto_726692 ) ) ( not ( = ?auto_726689 ?auto_726693 ) ) ( not ( = ?auto_726689 ?auto_726694 ) ) ( not ( = ?auto_726689 ?auto_726695 ) ) ( not ( = ?auto_726689 ?auto_726696 ) ) ( not ( = ?auto_726689 ?auto_726697 ) ) ( not ( = ?auto_726689 ?auto_726698 ) ) ( not ( = ?auto_726689 ?auto_726699 ) ) ( not ( = ?auto_726689 ?auto_726700 ) ) ( not ( = ?auto_726690 ?auto_726691 ) ) ( not ( = ?auto_726690 ?auto_726692 ) ) ( not ( = ?auto_726690 ?auto_726693 ) ) ( not ( = ?auto_726690 ?auto_726694 ) ) ( not ( = ?auto_726690 ?auto_726695 ) ) ( not ( = ?auto_726690 ?auto_726696 ) ) ( not ( = ?auto_726690 ?auto_726697 ) ) ( not ( = ?auto_726690 ?auto_726698 ) ) ( not ( = ?auto_726690 ?auto_726699 ) ) ( not ( = ?auto_726690 ?auto_726700 ) ) ( not ( = ?auto_726691 ?auto_726692 ) ) ( not ( = ?auto_726691 ?auto_726693 ) ) ( not ( = ?auto_726691 ?auto_726694 ) ) ( not ( = ?auto_726691 ?auto_726695 ) ) ( not ( = ?auto_726691 ?auto_726696 ) ) ( not ( = ?auto_726691 ?auto_726697 ) ) ( not ( = ?auto_726691 ?auto_726698 ) ) ( not ( = ?auto_726691 ?auto_726699 ) ) ( not ( = ?auto_726691 ?auto_726700 ) ) ( not ( = ?auto_726692 ?auto_726693 ) ) ( not ( = ?auto_726692 ?auto_726694 ) ) ( not ( = ?auto_726692 ?auto_726695 ) ) ( not ( = ?auto_726692 ?auto_726696 ) ) ( not ( = ?auto_726692 ?auto_726697 ) ) ( not ( = ?auto_726692 ?auto_726698 ) ) ( not ( = ?auto_726692 ?auto_726699 ) ) ( not ( = ?auto_726692 ?auto_726700 ) ) ( not ( = ?auto_726693 ?auto_726694 ) ) ( not ( = ?auto_726693 ?auto_726695 ) ) ( not ( = ?auto_726693 ?auto_726696 ) ) ( not ( = ?auto_726693 ?auto_726697 ) ) ( not ( = ?auto_726693 ?auto_726698 ) ) ( not ( = ?auto_726693 ?auto_726699 ) ) ( not ( = ?auto_726693 ?auto_726700 ) ) ( not ( = ?auto_726694 ?auto_726695 ) ) ( not ( = ?auto_726694 ?auto_726696 ) ) ( not ( = ?auto_726694 ?auto_726697 ) ) ( not ( = ?auto_726694 ?auto_726698 ) ) ( not ( = ?auto_726694 ?auto_726699 ) ) ( not ( = ?auto_726694 ?auto_726700 ) ) ( not ( = ?auto_726695 ?auto_726696 ) ) ( not ( = ?auto_726695 ?auto_726697 ) ) ( not ( = ?auto_726695 ?auto_726698 ) ) ( not ( = ?auto_726695 ?auto_726699 ) ) ( not ( = ?auto_726695 ?auto_726700 ) ) ( not ( = ?auto_726696 ?auto_726697 ) ) ( not ( = ?auto_726696 ?auto_726698 ) ) ( not ( = ?auto_726696 ?auto_726699 ) ) ( not ( = ?auto_726696 ?auto_726700 ) ) ( not ( = ?auto_726697 ?auto_726698 ) ) ( not ( = ?auto_726697 ?auto_726699 ) ) ( not ( = ?auto_726697 ?auto_726700 ) ) ( not ( = ?auto_726698 ?auto_726699 ) ) ( not ( = ?auto_726698 ?auto_726700 ) ) ( not ( = ?auto_726699 ?auto_726700 ) ) ( ON ?auto_726698 ?auto_726699 ) ( ON ?auto_726697 ?auto_726698 ) ( ON ?auto_726696 ?auto_726697 ) ( ON ?auto_726695 ?auto_726696 ) ( ON ?auto_726694 ?auto_726695 ) ( CLEAR ?auto_726692 ) ( ON ?auto_726693 ?auto_726694 ) ( CLEAR ?auto_726693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_726689 ?auto_726690 ?auto_726691 ?auto_726692 ?auto_726693 )
      ( MAKE-11PILE ?auto_726689 ?auto_726690 ?auto_726691 ?auto_726692 ?auto_726693 ?auto_726694 ?auto_726695 ?auto_726696 ?auto_726697 ?auto_726698 ?auto_726699 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726735 - BLOCK
      ?auto_726736 - BLOCK
      ?auto_726737 - BLOCK
      ?auto_726738 - BLOCK
      ?auto_726739 - BLOCK
      ?auto_726740 - BLOCK
      ?auto_726741 - BLOCK
      ?auto_726742 - BLOCK
      ?auto_726743 - BLOCK
      ?auto_726744 - BLOCK
      ?auto_726745 - BLOCK
    )
    :vars
    (
      ?auto_726746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726745 ?auto_726746 ) ( ON-TABLE ?auto_726735 ) ( ON ?auto_726736 ?auto_726735 ) ( ON ?auto_726737 ?auto_726736 ) ( not ( = ?auto_726735 ?auto_726736 ) ) ( not ( = ?auto_726735 ?auto_726737 ) ) ( not ( = ?auto_726735 ?auto_726738 ) ) ( not ( = ?auto_726735 ?auto_726739 ) ) ( not ( = ?auto_726735 ?auto_726740 ) ) ( not ( = ?auto_726735 ?auto_726741 ) ) ( not ( = ?auto_726735 ?auto_726742 ) ) ( not ( = ?auto_726735 ?auto_726743 ) ) ( not ( = ?auto_726735 ?auto_726744 ) ) ( not ( = ?auto_726735 ?auto_726745 ) ) ( not ( = ?auto_726735 ?auto_726746 ) ) ( not ( = ?auto_726736 ?auto_726737 ) ) ( not ( = ?auto_726736 ?auto_726738 ) ) ( not ( = ?auto_726736 ?auto_726739 ) ) ( not ( = ?auto_726736 ?auto_726740 ) ) ( not ( = ?auto_726736 ?auto_726741 ) ) ( not ( = ?auto_726736 ?auto_726742 ) ) ( not ( = ?auto_726736 ?auto_726743 ) ) ( not ( = ?auto_726736 ?auto_726744 ) ) ( not ( = ?auto_726736 ?auto_726745 ) ) ( not ( = ?auto_726736 ?auto_726746 ) ) ( not ( = ?auto_726737 ?auto_726738 ) ) ( not ( = ?auto_726737 ?auto_726739 ) ) ( not ( = ?auto_726737 ?auto_726740 ) ) ( not ( = ?auto_726737 ?auto_726741 ) ) ( not ( = ?auto_726737 ?auto_726742 ) ) ( not ( = ?auto_726737 ?auto_726743 ) ) ( not ( = ?auto_726737 ?auto_726744 ) ) ( not ( = ?auto_726737 ?auto_726745 ) ) ( not ( = ?auto_726737 ?auto_726746 ) ) ( not ( = ?auto_726738 ?auto_726739 ) ) ( not ( = ?auto_726738 ?auto_726740 ) ) ( not ( = ?auto_726738 ?auto_726741 ) ) ( not ( = ?auto_726738 ?auto_726742 ) ) ( not ( = ?auto_726738 ?auto_726743 ) ) ( not ( = ?auto_726738 ?auto_726744 ) ) ( not ( = ?auto_726738 ?auto_726745 ) ) ( not ( = ?auto_726738 ?auto_726746 ) ) ( not ( = ?auto_726739 ?auto_726740 ) ) ( not ( = ?auto_726739 ?auto_726741 ) ) ( not ( = ?auto_726739 ?auto_726742 ) ) ( not ( = ?auto_726739 ?auto_726743 ) ) ( not ( = ?auto_726739 ?auto_726744 ) ) ( not ( = ?auto_726739 ?auto_726745 ) ) ( not ( = ?auto_726739 ?auto_726746 ) ) ( not ( = ?auto_726740 ?auto_726741 ) ) ( not ( = ?auto_726740 ?auto_726742 ) ) ( not ( = ?auto_726740 ?auto_726743 ) ) ( not ( = ?auto_726740 ?auto_726744 ) ) ( not ( = ?auto_726740 ?auto_726745 ) ) ( not ( = ?auto_726740 ?auto_726746 ) ) ( not ( = ?auto_726741 ?auto_726742 ) ) ( not ( = ?auto_726741 ?auto_726743 ) ) ( not ( = ?auto_726741 ?auto_726744 ) ) ( not ( = ?auto_726741 ?auto_726745 ) ) ( not ( = ?auto_726741 ?auto_726746 ) ) ( not ( = ?auto_726742 ?auto_726743 ) ) ( not ( = ?auto_726742 ?auto_726744 ) ) ( not ( = ?auto_726742 ?auto_726745 ) ) ( not ( = ?auto_726742 ?auto_726746 ) ) ( not ( = ?auto_726743 ?auto_726744 ) ) ( not ( = ?auto_726743 ?auto_726745 ) ) ( not ( = ?auto_726743 ?auto_726746 ) ) ( not ( = ?auto_726744 ?auto_726745 ) ) ( not ( = ?auto_726744 ?auto_726746 ) ) ( not ( = ?auto_726745 ?auto_726746 ) ) ( ON ?auto_726744 ?auto_726745 ) ( ON ?auto_726743 ?auto_726744 ) ( ON ?auto_726742 ?auto_726743 ) ( ON ?auto_726741 ?auto_726742 ) ( ON ?auto_726740 ?auto_726741 ) ( ON ?auto_726739 ?auto_726740 ) ( CLEAR ?auto_726737 ) ( ON ?auto_726738 ?auto_726739 ) ( CLEAR ?auto_726738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_726735 ?auto_726736 ?auto_726737 ?auto_726738 )
      ( MAKE-11PILE ?auto_726735 ?auto_726736 ?auto_726737 ?auto_726738 ?auto_726739 ?auto_726740 ?auto_726741 ?auto_726742 ?auto_726743 ?auto_726744 ?auto_726745 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726781 - BLOCK
      ?auto_726782 - BLOCK
      ?auto_726783 - BLOCK
      ?auto_726784 - BLOCK
      ?auto_726785 - BLOCK
      ?auto_726786 - BLOCK
      ?auto_726787 - BLOCK
      ?auto_726788 - BLOCK
      ?auto_726789 - BLOCK
      ?auto_726790 - BLOCK
      ?auto_726791 - BLOCK
    )
    :vars
    (
      ?auto_726792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726791 ?auto_726792 ) ( ON-TABLE ?auto_726781 ) ( ON ?auto_726782 ?auto_726781 ) ( not ( = ?auto_726781 ?auto_726782 ) ) ( not ( = ?auto_726781 ?auto_726783 ) ) ( not ( = ?auto_726781 ?auto_726784 ) ) ( not ( = ?auto_726781 ?auto_726785 ) ) ( not ( = ?auto_726781 ?auto_726786 ) ) ( not ( = ?auto_726781 ?auto_726787 ) ) ( not ( = ?auto_726781 ?auto_726788 ) ) ( not ( = ?auto_726781 ?auto_726789 ) ) ( not ( = ?auto_726781 ?auto_726790 ) ) ( not ( = ?auto_726781 ?auto_726791 ) ) ( not ( = ?auto_726781 ?auto_726792 ) ) ( not ( = ?auto_726782 ?auto_726783 ) ) ( not ( = ?auto_726782 ?auto_726784 ) ) ( not ( = ?auto_726782 ?auto_726785 ) ) ( not ( = ?auto_726782 ?auto_726786 ) ) ( not ( = ?auto_726782 ?auto_726787 ) ) ( not ( = ?auto_726782 ?auto_726788 ) ) ( not ( = ?auto_726782 ?auto_726789 ) ) ( not ( = ?auto_726782 ?auto_726790 ) ) ( not ( = ?auto_726782 ?auto_726791 ) ) ( not ( = ?auto_726782 ?auto_726792 ) ) ( not ( = ?auto_726783 ?auto_726784 ) ) ( not ( = ?auto_726783 ?auto_726785 ) ) ( not ( = ?auto_726783 ?auto_726786 ) ) ( not ( = ?auto_726783 ?auto_726787 ) ) ( not ( = ?auto_726783 ?auto_726788 ) ) ( not ( = ?auto_726783 ?auto_726789 ) ) ( not ( = ?auto_726783 ?auto_726790 ) ) ( not ( = ?auto_726783 ?auto_726791 ) ) ( not ( = ?auto_726783 ?auto_726792 ) ) ( not ( = ?auto_726784 ?auto_726785 ) ) ( not ( = ?auto_726784 ?auto_726786 ) ) ( not ( = ?auto_726784 ?auto_726787 ) ) ( not ( = ?auto_726784 ?auto_726788 ) ) ( not ( = ?auto_726784 ?auto_726789 ) ) ( not ( = ?auto_726784 ?auto_726790 ) ) ( not ( = ?auto_726784 ?auto_726791 ) ) ( not ( = ?auto_726784 ?auto_726792 ) ) ( not ( = ?auto_726785 ?auto_726786 ) ) ( not ( = ?auto_726785 ?auto_726787 ) ) ( not ( = ?auto_726785 ?auto_726788 ) ) ( not ( = ?auto_726785 ?auto_726789 ) ) ( not ( = ?auto_726785 ?auto_726790 ) ) ( not ( = ?auto_726785 ?auto_726791 ) ) ( not ( = ?auto_726785 ?auto_726792 ) ) ( not ( = ?auto_726786 ?auto_726787 ) ) ( not ( = ?auto_726786 ?auto_726788 ) ) ( not ( = ?auto_726786 ?auto_726789 ) ) ( not ( = ?auto_726786 ?auto_726790 ) ) ( not ( = ?auto_726786 ?auto_726791 ) ) ( not ( = ?auto_726786 ?auto_726792 ) ) ( not ( = ?auto_726787 ?auto_726788 ) ) ( not ( = ?auto_726787 ?auto_726789 ) ) ( not ( = ?auto_726787 ?auto_726790 ) ) ( not ( = ?auto_726787 ?auto_726791 ) ) ( not ( = ?auto_726787 ?auto_726792 ) ) ( not ( = ?auto_726788 ?auto_726789 ) ) ( not ( = ?auto_726788 ?auto_726790 ) ) ( not ( = ?auto_726788 ?auto_726791 ) ) ( not ( = ?auto_726788 ?auto_726792 ) ) ( not ( = ?auto_726789 ?auto_726790 ) ) ( not ( = ?auto_726789 ?auto_726791 ) ) ( not ( = ?auto_726789 ?auto_726792 ) ) ( not ( = ?auto_726790 ?auto_726791 ) ) ( not ( = ?auto_726790 ?auto_726792 ) ) ( not ( = ?auto_726791 ?auto_726792 ) ) ( ON ?auto_726790 ?auto_726791 ) ( ON ?auto_726789 ?auto_726790 ) ( ON ?auto_726788 ?auto_726789 ) ( ON ?auto_726787 ?auto_726788 ) ( ON ?auto_726786 ?auto_726787 ) ( ON ?auto_726785 ?auto_726786 ) ( ON ?auto_726784 ?auto_726785 ) ( CLEAR ?auto_726782 ) ( ON ?auto_726783 ?auto_726784 ) ( CLEAR ?auto_726783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_726781 ?auto_726782 ?auto_726783 )
      ( MAKE-11PILE ?auto_726781 ?auto_726782 ?auto_726783 ?auto_726784 ?auto_726785 ?auto_726786 ?auto_726787 ?auto_726788 ?auto_726789 ?auto_726790 ?auto_726791 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726827 - BLOCK
      ?auto_726828 - BLOCK
      ?auto_726829 - BLOCK
      ?auto_726830 - BLOCK
      ?auto_726831 - BLOCK
      ?auto_726832 - BLOCK
      ?auto_726833 - BLOCK
      ?auto_726834 - BLOCK
      ?auto_726835 - BLOCK
      ?auto_726836 - BLOCK
      ?auto_726837 - BLOCK
    )
    :vars
    (
      ?auto_726838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726837 ?auto_726838 ) ( ON-TABLE ?auto_726827 ) ( not ( = ?auto_726827 ?auto_726828 ) ) ( not ( = ?auto_726827 ?auto_726829 ) ) ( not ( = ?auto_726827 ?auto_726830 ) ) ( not ( = ?auto_726827 ?auto_726831 ) ) ( not ( = ?auto_726827 ?auto_726832 ) ) ( not ( = ?auto_726827 ?auto_726833 ) ) ( not ( = ?auto_726827 ?auto_726834 ) ) ( not ( = ?auto_726827 ?auto_726835 ) ) ( not ( = ?auto_726827 ?auto_726836 ) ) ( not ( = ?auto_726827 ?auto_726837 ) ) ( not ( = ?auto_726827 ?auto_726838 ) ) ( not ( = ?auto_726828 ?auto_726829 ) ) ( not ( = ?auto_726828 ?auto_726830 ) ) ( not ( = ?auto_726828 ?auto_726831 ) ) ( not ( = ?auto_726828 ?auto_726832 ) ) ( not ( = ?auto_726828 ?auto_726833 ) ) ( not ( = ?auto_726828 ?auto_726834 ) ) ( not ( = ?auto_726828 ?auto_726835 ) ) ( not ( = ?auto_726828 ?auto_726836 ) ) ( not ( = ?auto_726828 ?auto_726837 ) ) ( not ( = ?auto_726828 ?auto_726838 ) ) ( not ( = ?auto_726829 ?auto_726830 ) ) ( not ( = ?auto_726829 ?auto_726831 ) ) ( not ( = ?auto_726829 ?auto_726832 ) ) ( not ( = ?auto_726829 ?auto_726833 ) ) ( not ( = ?auto_726829 ?auto_726834 ) ) ( not ( = ?auto_726829 ?auto_726835 ) ) ( not ( = ?auto_726829 ?auto_726836 ) ) ( not ( = ?auto_726829 ?auto_726837 ) ) ( not ( = ?auto_726829 ?auto_726838 ) ) ( not ( = ?auto_726830 ?auto_726831 ) ) ( not ( = ?auto_726830 ?auto_726832 ) ) ( not ( = ?auto_726830 ?auto_726833 ) ) ( not ( = ?auto_726830 ?auto_726834 ) ) ( not ( = ?auto_726830 ?auto_726835 ) ) ( not ( = ?auto_726830 ?auto_726836 ) ) ( not ( = ?auto_726830 ?auto_726837 ) ) ( not ( = ?auto_726830 ?auto_726838 ) ) ( not ( = ?auto_726831 ?auto_726832 ) ) ( not ( = ?auto_726831 ?auto_726833 ) ) ( not ( = ?auto_726831 ?auto_726834 ) ) ( not ( = ?auto_726831 ?auto_726835 ) ) ( not ( = ?auto_726831 ?auto_726836 ) ) ( not ( = ?auto_726831 ?auto_726837 ) ) ( not ( = ?auto_726831 ?auto_726838 ) ) ( not ( = ?auto_726832 ?auto_726833 ) ) ( not ( = ?auto_726832 ?auto_726834 ) ) ( not ( = ?auto_726832 ?auto_726835 ) ) ( not ( = ?auto_726832 ?auto_726836 ) ) ( not ( = ?auto_726832 ?auto_726837 ) ) ( not ( = ?auto_726832 ?auto_726838 ) ) ( not ( = ?auto_726833 ?auto_726834 ) ) ( not ( = ?auto_726833 ?auto_726835 ) ) ( not ( = ?auto_726833 ?auto_726836 ) ) ( not ( = ?auto_726833 ?auto_726837 ) ) ( not ( = ?auto_726833 ?auto_726838 ) ) ( not ( = ?auto_726834 ?auto_726835 ) ) ( not ( = ?auto_726834 ?auto_726836 ) ) ( not ( = ?auto_726834 ?auto_726837 ) ) ( not ( = ?auto_726834 ?auto_726838 ) ) ( not ( = ?auto_726835 ?auto_726836 ) ) ( not ( = ?auto_726835 ?auto_726837 ) ) ( not ( = ?auto_726835 ?auto_726838 ) ) ( not ( = ?auto_726836 ?auto_726837 ) ) ( not ( = ?auto_726836 ?auto_726838 ) ) ( not ( = ?auto_726837 ?auto_726838 ) ) ( ON ?auto_726836 ?auto_726837 ) ( ON ?auto_726835 ?auto_726836 ) ( ON ?auto_726834 ?auto_726835 ) ( ON ?auto_726833 ?auto_726834 ) ( ON ?auto_726832 ?auto_726833 ) ( ON ?auto_726831 ?auto_726832 ) ( ON ?auto_726830 ?auto_726831 ) ( ON ?auto_726829 ?auto_726830 ) ( CLEAR ?auto_726827 ) ( ON ?auto_726828 ?auto_726829 ) ( CLEAR ?auto_726828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_726827 ?auto_726828 )
      ( MAKE-11PILE ?auto_726827 ?auto_726828 ?auto_726829 ?auto_726830 ?auto_726831 ?auto_726832 ?auto_726833 ?auto_726834 ?auto_726835 ?auto_726836 ?auto_726837 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_726873 - BLOCK
      ?auto_726874 - BLOCK
      ?auto_726875 - BLOCK
      ?auto_726876 - BLOCK
      ?auto_726877 - BLOCK
      ?auto_726878 - BLOCK
      ?auto_726879 - BLOCK
      ?auto_726880 - BLOCK
      ?auto_726881 - BLOCK
      ?auto_726882 - BLOCK
      ?auto_726883 - BLOCK
    )
    :vars
    (
      ?auto_726884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726883 ?auto_726884 ) ( not ( = ?auto_726873 ?auto_726874 ) ) ( not ( = ?auto_726873 ?auto_726875 ) ) ( not ( = ?auto_726873 ?auto_726876 ) ) ( not ( = ?auto_726873 ?auto_726877 ) ) ( not ( = ?auto_726873 ?auto_726878 ) ) ( not ( = ?auto_726873 ?auto_726879 ) ) ( not ( = ?auto_726873 ?auto_726880 ) ) ( not ( = ?auto_726873 ?auto_726881 ) ) ( not ( = ?auto_726873 ?auto_726882 ) ) ( not ( = ?auto_726873 ?auto_726883 ) ) ( not ( = ?auto_726873 ?auto_726884 ) ) ( not ( = ?auto_726874 ?auto_726875 ) ) ( not ( = ?auto_726874 ?auto_726876 ) ) ( not ( = ?auto_726874 ?auto_726877 ) ) ( not ( = ?auto_726874 ?auto_726878 ) ) ( not ( = ?auto_726874 ?auto_726879 ) ) ( not ( = ?auto_726874 ?auto_726880 ) ) ( not ( = ?auto_726874 ?auto_726881 ) ) ( not ( = ?auto_726874 ?auto_726882 ) ) ( not ( = ?auto_726874 ?auto_726883 ) ) ( not ( = ?auto_726874 ?auto_726884 ) ) ( not ( = ?auto_726875 ?auto_726876 ) ) ( not ( = ?auto_726875 ?auto_726877 ) ) ( not ( = ?auto_726875 ?auto_726878 ) ) ( not ( = ?auto_726875 ?auto_726879 ) ) ( not ( = ?auto_726875 ?auto_726880 ) ) ( not ( = ?auto_726875 ?auto_726881 ) ) ( not ( = ?auto_726875 ?auto_726882 ) ) ( not ( = ?auto_726875 ?auto_726883 ) ) ( not ( = ?auto_726875 ?auto_726884 ) ) ( not ( = ?auto_726876 ?auto_726877 ) ) ( not ( = ?auto_726876 ?auto_726878 ) ) ( not ( = ?auto_726876 ?auto_726879 ) ) ( not ( = ?auto_726876 ?auto_726880 ) ) ( not ( = ?auto_726876 ?auto_726881 ) ) ( not ( = ?auto_726876 ?auto_726882 ) ) ( not ( = ?auto_726876 ?auto_726883 ) ) ( not ( = ?auto_726876 ?auto_726884 ) ) ( not ( = ?auto_726877 ?auto_726878 ) ) ( not ( = ?auto_726877 ?auto_726879 ) ) ( not ( = ?auto_726877 ?auto_726880 ) ) ( not ( = ?auto_726877 ?auto_726881 ) ) ( not ( = ?auto_726877 ?auto_726882 ) ) ( not ( = ?auto_726877 ?auto_726883 ) ) ( not ( = ?auto_726877 ?auto_726884 ) ) ( not ( = ?auto_726878 ?auto_726879 ) ) ( not ( = ?auto_726878 ?auto_726880 ) ) ( not ( = ?auto_726878 ?auto_726881 ) ) ( not ( = ?auto_726878 ?auto_726882 ) ) ( not ( = ?auto_726878 ?auto_726883 ) ) ( not ( = ?auto_726878 ?auto_726884 ) ) ( not ( = ?auto_726879 ?auto_726880 ) ) ( not ( = ?auto_726879 ?auto_726881 ) ) ( not ( = ?auto_726879 ?auto_726882 ) ) ( not ( = ?auto_726879 ?auto_726883 ) ) ( not ( = ?auto_726879 ?auto_726884 ) ) ( not ( = ?auto_726880 ?auto_726881 ) ) ( not ( = ?auto_726880 ?auto_726882 ) ) ( not ( = ?auto_726880 ?auto_726883 ) ) ( not ( = ?auto_726880 ?auto_726884 ) ) ( not ( = ?auto_726881 ?auto_726882 ) ) ( not ( = ?auto_726881 ?auto_726883 ) ) ( not ( = ?auto_726881 ?auto_726884 ) ) ( not ( = ?auto_726882 ?auto_726883 ) ) ( not ( = ?auto_726882 ?auto_726884 ) ) ( not ( = ?auto_726883 ?auto_726884 ) ) ( ON ?auto_726882 ?auto_726883 ) ( ON ?auto_726881 ?auto_726882 ) ( ON ?auto_726880 ?auto_726881 ) ( ON ?auto_726879 ?auto_726880 ) ( ON ?auto_726878 ?auto_726879 ) ( ON ?auto_726877 ?auto_726878 ) ( ON ?auto_726876 ?auto_726877 ) ( ON ?auto_726875 ?auto_726876 ) ( ON ?auto_726874 ?auto_726875 ) ( ON ?auto_726873 ?auto_726874 ) ( CLEAR ?auto_726873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_726873 )
      ( MAKE-11PILE ?auto_726873 ?auto_726874 ?auto_726875 ?auto_726876 ?auto_726877 ?auto_726878 ?auto_726879 ?auto_726880 ?auto_726881 ?auto_726882 ?auto_726883 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_726920 - BLOCK
      ?auto_726921 - BLOCK
      ?auto_726922 - BLOCK
      ?auto_726923 - BLOCK
      ?auto_726924 - BLOCK
      ?auto_726925 - BLOCK
      ?auto_726926 - BLOCK
      ?auto_726927 - BLOCK
      ?auto_726928 - BLOCK
      ?auto_726929 - BLOCK
      ?auto_726930 - BLOCK
      ?auto_726931 - BLOCK
    )
    :vars
    (
      ?auto_726932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_726930 ) ( ON ?auto_726931 ?auto_726932 ) ( CLEAR ?auto_726931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_726920 ) ( ON ?auto_726921 ?auto_726920 ) ( ON ?auto_726922 ?auto_726921 ) ( ON ?auto_726923 ?auto_726922 ) ( ON ?auto_726924 ?auto_726923 ) ( ON ?auto_726925 ?auto_726924 ) ( ON ?auto_726926 ?auto_726925 ) ( ON ?auto_726927 ?auto_726926 ) ( ON ?auto_726928 ?auto_726927 ) ( ON ?auto_726929 ?auto_726928 ) ( ON ?auto_726930 ?auto_726929 ) ( not ( = ?auto_726920 ?auto_726921 ) ) ( not ( = ?auto_726920 ?auto_726922 ) ) ( not ( = ?auto_726920 ?auto_726923 ) ) ( not ( = ?auto_726920 ?auto_726924 ) ) ( not ( = ?auto_726920 ?auto_726925 ) ) ( not ( = ?auto_726920 ?auto_726926 ) ) ( not ( = ?auto_726920 ?auto_726927 ) ) ( not ( = ?auto_726920 ?auto_726928 ) ) ( not ( = ?auto_726920 ?auto_726929 ) ) ( not ( = ?auto_726920 ?auto_726930 ) ) ( not ( = ?auto_726920 ?auto_726931 ) ) ( not ( = ?auto_726920 ?auto_726932 ) ) ( not ( = ?auto_726921 ?auto_726922 ) ) ( not ( = ?auto_726921 ?auto_726923 ) ) ( not ( = ?auto_726921 ?auto_726924 ) ) ( not ( = ?auto_726921 ?auto_726925 ) ) ( not ( = ?auto_726921 ?auto_726926 ) ) ( not ( = ?auto_726921 ?auto_726927 ) ) ( not ( = ?auto_726921 ?auto_726928 ) ) ( not ( = ?auto_726921 ?auto_726929 ) ) ( not ( = ?auto_726921 ?auto_726930 ) ) ( not ( = ?auto_726921 ?auto_726931 ) ) ( not ( = ?auto_726921 ?auto_726932 ) ) ( not ( = ?auto_726922 ?auto_726923 ) ) ( not ( = ?auto_726922 ?auto_726924 ) ) ( not ( = ?auto_726922 ?auto_726925 ) ) ( not ( = ?auto_726922 ?auto_726926 ) ) ( not ( = ?auto_726922 ?auto_726927 ) ) ( not ( = ?auto_726922 ?auto_726928 ) ) ( not ( = ?auto_726922 ?auto_726929 ) ) ( not ( = ?auto_726922 ?auto_726930 ) ) ( not ( = ?auto_726922 ?auto_726931 ) ) ( not ( = ?auto_726922 ?auto_726932 ) ) ( not ( = ?auto_726923 ?auto_726924 ) ) ( not ( = ?auto_726923 ?auto_726925 ) ) ( not ( = ?auto_726923 ?auto_726926 ) ) ( not ( = ?auto_726923 ?auto_726927 ) ) ( not ( = ?auto_726923 ?auto_726928 ) ) ( not ( = ?auto_726923 ?auto_726929 ) ) ( not ( = ?auto_726923 ?auto_726930 ) ) ( not ( = ?auto_726923 ?auto_726931 ) ) ( not ( = ?auto_726923 ?auto_726932 ) ) ( not ( = ?auto_726924 ?auto_726925 ) ) ( not ( = ?auto_726924 ?auto_726926 ) ) ( not ( = ?auto_726924 ?auto_726927 ) ) ( not ( = ?auto_726924 ?auto_726928 ) ) ( not ( = ?auto_726924 ?auto_726929 ) ) ( not ( = ?auto_726924 ?auto_726930 ) ) ( not ( = ?auto_726924 ?auto_726931 ) ) ( not ( = ?auto_726924 ?auto_726932 ) ) ( not ( = ?auto_726925 ?auto_726926 ) ) ( not ( = ?auto_726925 ?auto_726927 ) ) ( not ( = ?auto_726925 ?auto_726928 ) ) ( not ( = ?auto_726925 ?auto_726929 ) ) ( not ( = ?auto_726925 ?auto_726930 ) ) ( not ( = ?auto_726925 ?auto_726931 ) ) ( not ( = ?auto_726925 ?auto_726932 ) ) ( not ( = ?auto_726926 ?auto_726927 ) ) ( not ( = ?auto_726926 ?auto_726928 ) ) ( not ( = ?auto_726926 ?auto_726929 ) ) ( not ( = ?auto_726926 ?auto_726930 ) ) ( not ( = ?auto_726926 ?auto_726931 ) ) ( not ( = ?auto_726926 ?auto_726932 ) ) ( not ( = ?auto_726927 ?auto_726928 ) ) ( not ( = ?auto_726927 ?auto_726929 ) ) ( not ( = ?auto_726927 ?auto_726930 ) ) ( not ( = ?auto_726927 ?auto_726931 ) ) ( not ( = ?auto_726927 ?auto_726932 ) ) ( not ( = ?auto_726928 ?auto_726929 ) ) ( not ( = ?auto_726928 ?auto_726930 ) ) ( not ( = ?auto_726928 ?auto_726931 ) ) ( not ( = ?auto_726928 ?auto_726932 ) ) ( not ( = ?auto_726929 ?auto_726930 ) ) ( not ( = ?auto_726929 ?auto_726931 ) ) ( not ( = ?auto_726929 ?auto_726932 ) ) ( not ( = ?auto_726930 ?auto_726931 ) ) ( not ( = ?auto_726930 ?auto_726932 ) ) ( not ( = ?auto_726931 ?auto_726932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_726931 ?auto_726932 )
      ( !STACK ?auto_726931 ?auto_726930 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_726970 - BLOCK
      ?auto_726971 - BLOCK
      ?auto_726972 - BLOCK
      ?auto_726973 - BLOCK
      ?auto_726974 - BLOCK
      ?auto_726975 - BLOCK
      ?auto_726976 - BLOCK
      ?auto_726977 - BLOCK
      ?auto_726978 - BLOCK
      ?auto_726979 - BLOCK
      ?auto_726980 - BLOCK
      ?auto_726981 - BLOCK
    )
    :vars
    (
      ?auto_726982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_726981 ?auto_726982 ) ( ON-TABLE ?auto_726970 ) ( ON ?auto_726971 ?auto_726970 ) ( ON ?auto_726972 ?auto_726971 ) ( ON ?auto_726973 ?auto_726972 ) ( ON ?auto_726974 ?auto_726973 ) ( ON ?auto_726975 ?auto_726974 ) ( ON ?auto_726976 ?auto_726975 ) ( ON ?auto_726977 ?auto_726976 ) ( ON ?auto_726978 ?auto_726977 ) ( ON ?auto_726979 ?auto_726978 ) ( not ( = ?auto_726970 ?auto_726971 ) ) ( not ( = ?auto_726970 ?auto_726972 ) ) ( not ( = ?auto_726970 ?auto_726973 ) ) ( not ( = ?auto_726970 ?auto_726974 ) ) ( not ( = ?auto_726970 ?auto_726975 ) ) ( not ( = ?auto_726970 ?auto_726976 ) ) ( not ( = ?auto_726970 ?auto_726977 ) ) ( not ( = ?auto_726970 ?auto_726978 ) ) ( not ( = ?auto_726970 ?auto_726979 ) ) ( not ( = ?auto_726970 ?auto_726980 ) ) ( not ( = ?auto_726970 ?auto_726981 ) ) ( not ( = ?auto_726970 ?auto_726982 ) ) ( not ( = ?auto_726971 ?auto_726972 ) ) ( not ( = ?auto_726971 ?auto_726973 ) ) ( not ( = ?auto_726971 ?auto_726974 ) ) ( not ( = ?auto_726971 ?auto_726975 ) ) ( not ( = ?auto_726971 ?auto_726976 ) ) ( not ( = ?auto_726971 ?auto_726977 ) ) ( not ( = ?auto_726971 ?auto_726978 ) ) ( not ( = ?auto_726971 ?auto_726979 ) ) ( not ( = ?auto_726971 ?auto_726980 ) ) ( not ( = ?auto_726971 ?auto_726981 ) ) ( not ( = ?auto_726971 ?auto_726982 ) ) ( not ( = ?auto_726972 ?auto_726973 ) ) ( not ( = ?auto_726972 ?auto_726974 ) ) ( not ( = ?auto_726972 ?auto_726975 ) ) ( not ( = ?auto_726972 ?auto_726976 ) ) ( not ( = ?auto_726972 ?auto_726977 ) ) ( not ( = ?auto_726972 ?auto_726978 ) ) ( not ( = ?auto_726972 ?auto_726979 ) ) ( not ( = ?auto_726972 ?auto_726980 ) ) ( not ( = ?auto_726972 ?auto_726981 ) ) ( not ( = ?auto_726972 ?auto_726982 ) ) ( not ( = ?auto_726973 ?auto_726974 ) ) ( not ( = ?auto_726973 ?auto_726975 ) ) ( not ( = ?auto_726973 ?auto_726976 ) ) ( not ( = ?auto_726973 ?auto_726977 ) ) ( not ( = ?auto_726973 ?auto_726978 ) ) ( not ( = ?auto_726973 ?auto_726979 ) ) ( not ( = ?auto_726973 ?auto_726980 ) ) ( not ( = ?auto_726973 ?auto_726981 ) ) ( not ( = ?auto_726973 ?auto_726982 ) ) ( not ( = ?auto_726974 ?auto_726975 ) ) ( not ( = ?auto_726974 ?auto_726976 ) ) ( not ( = ?auto_726974 ?auto_726977 ) ) ( not ( = ?auto_726974 ?auto_726978 ) ) ( not ( = ?auto_726974 ?auto_726979 ) ) ( not ( = ?auto_726974 ?auto_726980 ) ) ( not ( = ?auto_726974 ?auto_726981 ) ) ( not ( = ?auto_726974 ?auto_726982 ) ) ( not ( = ?auto_726975 ?auto_726976 ) ) ( not ( = ?auto_726975 ?auto_726977 ) ) ( not ( = ?auto_726975 ?auto_726978 ) ) ( not ( = ?auto_726975 ?auto_726979 ) ) ( not ( = ?auto_726975 ?auto_726980 ) ) ( not ( = ?auto_726975 ?auto_726981 ) ) ( not ( = ?auto_726975 ?auto_726982 ) ) ( not ( = ?auto_726976 ?auto_726977 ) ) ( not ( = ?auto_726976 ?auto_726978 ) ) ( not ( = ?auto_726976 ?auto_726979 ) ) ( not ( = ?auto_726976 ?auto_726980 ) ) ( not ( = ?auto_726976 ?auto_726981 ) ) ( not ( = ?auto_726976 ?auto_726982 ) ) ( not ( = ?auto_726977 ?auto_726978 ) ) ( not ( = ?auto_726977 ?auto_726979 ) ) ( not ( = ?auto_726977 ?auto_726980 ) ) ( not ( = ?auto_726977 ?auto_726981 ) ) ( not ( = ?auto_726977 ?auto_726982 ) ) ( not ( = ?auto_726978 ?auto_726979 ) ) ( not ( = ?auto_726978 ?auto_726980 ) ) ( not ( = ?auto_726978 ?auto_726981 ) ) ( not ( = ?auto_726978 ?auto_726982 ) ) ( not ( = ?auto_726979 ?auto_726980 ) ) ( not ( = ?auto_726979 ?auto_726981 ) ) ( not ( = ?auto_726979 ?auto_726982 ) ) ( not ( = ?auto_726980 ?auto_726981 ) ) ( not ( = ?auto_726980 ?auto_726982 ) ) ( not ( = ?auto_726981 ?auto_726982 ) ) ( CLEAR ?auto_726979 ) ( ON ?auto_726980 ?auto_726981 ) ( CLEAR ?auto_726980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_726970 ?auto_726971 ?auto_726972 ?auto_726973 ?auto_726974 ?auto_726975 ?auto_726976 ?auto_726977 ?auto_726978 ?auto_726979 ?auto_726980 )
      ( MAKE-12PILE ?auto_726970 ?auto_726971 ?auto_726972 ?auto_726973 ?auto_726974 ?auto_726975 ?auto_726976 ?auto_726977 ?auto_726978 ?auto_726979 ?auto_726980 ?auto_726981 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727020 - BLOCK
      ?auto_727021 - BLOCK
      ?auto_727022 - BLOCK
      ?auto_727023 - BLOCK
      ?auto_727024 - BLOCK
      ?auto_727025 - BLOCK
      ?auto_727026 - BLOCK
      ?auto_727027 - BLOCK
      ?auto_727028 - BLOCK
      ?auto_727029 - BLOCK
      ?auto_727030 - BLOCK
      ?auto_727031 - BLOCK
    )
    :vars
    (
      ?auto_727032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727031 ?auto_727032 ) ( ON-TABLE ?auto_727020 ) ( ON ?auto_727021 ?auto_727020 ) ( ON ?auto_727022 ?auto_727021 ) ( ON ?auto_727023 ?auto_727022 ) ( ON ?auto_727024 ?auto_727023 ) ( ON ?auto_727025 ?auto_727024 ) ( ON ?auto_727026 ?auto_727025 ) ( ON ?auto_727027 ?auto_727026 ) ( ON ?auto_727028 ?auto_727027 ) ( not ( = ?auto_727020 ?auto_727021 ) ) ( not ( = ?auto_727020 ?auto_727022 ) ) ( not ( = ?auto_727020 ?auto_727023 ) ) ( not ( = ?auto_727020 ?auto_727024 ) ) ( not ( = ?auto_727020 ?auto_727025 ) ) ( not ( = ?auto_727020 ?auto_727026 ) ) ( not ( = ?auto_727020 ?auto_727027 ) ) ( not ( = ?auto_727020 ?auto_727028 ) ) ( not ( = ?auto_727020 ?auto_727029 ) ) ( not ( = ?auto_727020 ?auto_727030 ) ) ( not ( = ?auto_727020 ?auto_727031 ) ) ( not ( = ?auto_727020 ?auto_727032 ) ) ( not ( = ?auto_727021 ?auto_727022 ) ) ( not ( = ?auto_727021 ?auto_727023 ) ) ( not ( = ?auto_727021 ?auto_727024 ) ) ( not ( = ?auto_727021 ?auto_727025 ) ) ( not ( = ?auto_727021 ?auto_727026 ) ) ( not ( = ?auto_727021 ?auto_727027 ) ) ( not ( = ?auto_727021 ?auto_727028 ) ) ( not ( = ?auto_727021 ?auto_727029 ) ) ( not ( = ?auto_727021 ?auto_727030 ) ) ( not ( = ?auto_727021 ?auto_727031 ) ) ( not ( = ?auto_727021 ?auto_727032 ) ) ( not ( = ?auto_727022 ?auto_727023 ) ) ( not ( = ?auto_727022 ?auto_727024 ) ) ( not ( = ?auto_727022 ?auto_727025 ) ) ( not ( = ?auto_727022 ?auto_727026 ) ) ( not ( = ?auto_727022 ?auto_727027 ) ) ( not ( = ?auto_727022 ?auto_727028 ) ) ( not ( = ?auto_727022 ?auto_727029 ) ) ( not ( = ?auto_727022 ?auto_727030 ) ) ( not ( = ?auto_727022 ?auto_727031 ) ) ( not ( = ?auto_727022 ?auto_727032 ) ) ( not ( = ?auto_727023 ?auto_727024 ) ) ( not ( = ?auto_727023 ?auto_727025 ) ) ( not ( = ?auto_727023 ?auto_727026 ) ) ( not ( = ?auto_727023 ?auto_727027 ) ) ( not ( = ?auto_727023 ?auto_727028 ) ) ( not ( = ?auto_727023 ?auto_727029 ) ) ( not ( = ?auto_727023 ?auto_727030 ) ) ( not ( = ?auto_727023 ?auto_727031 ) ) ( not ( = ?auto_727023 ?auto_727032 ) ) ( not ( = ?auto_727024 ?auto_727025 ) ) ( not ( = ?auto_727024 ?auto_727026 ) ) ( not ( = ?auto_727024 ?auto_727027 ) ) ( not ( = ?auto_727024 ?auto_727028 ) ) ( not ( = ?auto_727024 ?auto_727029 ) ) ( not ( = ?auto_727024 ?auto_727030 ) ) ( not ( = ?auto_727024 ?auto_727031 ) ) ( not ( = ?auto_727024 ?auto_727032 ) ) ( not ( = ?auto_727025 ?auto_727026 ) ) ( not ( = ?auto_727025 ?auto_727027 ) ) ( not ( = ?auto_727025 ?auto_727028 ) ) ( not ( = ?auto_727025 ?auto_727029 ) ) ( not ( = ?auto_727025 ?auto_727030 ) ) ( not ( = ?auto_727025 ?auto_727031 ) ) ( not ( = ?auto_727025 ?auto_727032 ) ) ( not ( = ?auto_727026 ?auto_727027 ) ) ( not ( = ?auto_727026 ?auto_727028 ) ) ( not ( = ?auto_727026 ?auto_727029 ) ) ( not ( = ?auto_727026 ?auto_727030 ) ) ( not ( = ?auto_727026 ?auto_727031 ) ) ( not ( = ?auto_727026 ?auto_727032 ) ) ( not ( = ?auto_727027 ?auto_727028 ) ) ( not ( = ?auto_727027 ?auto_727029 ) ) ( not ( = ?auto_727027 ?auto_727030 ) ) ( not ( = ?auto_727027 ?auto_727031 ) ) ( not ( = ?auto_727027 ?auto_727032 ) ) ( not ( = ?auto_727028 ?auto_727029 ) ) ( not ( = ?auto_727028 ?auto_727030 ) ) ( not ( = ?auto_727028 ?auto_727031 ) ) ( not ( = ?auto_727028 ?auto_727032 ) ) ( not ( = ?auto_727029 ?auto_727030 ) ) ( not ( = ?auto_727029 ?auto_727031 ) ) ( not ( = ?auto_727029 ?auto_727032 ) ) ( not ( = ?auto_727030 ?auto_727031 ) ) ( not ( = ?auto_727030 ?auto_727032 ) ) ( not ( = ?auto_727031 ?auto_727032 ) ) ( ON ?auto_727030 ?auto_727031 ) ( CLEAR ?auto_727028 ) ( ON ?auto_727029 ?auto_727030 ) ( CLEAR ?auto_727029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_727020 ?auto_727021 ?auto_727022 ?auto_727023 ?auto_727024 ?auto_727025 ?auto_727026 ?auto_727027 ?auto_727028 ?auto_727029 )
      ( MAKE-12PILE ?auto_727020 ?auto_727021 ?auto_727022 ?auto_727023 ?auto_727024 ?auto_727025 ?auto_727026 ?auto_727027 ?auto_727028 ?auto_727029 ?auto_727030 ?auto_727031 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727070 - BLOCK
      ?auto_727071 - BLOCK
      ?auto_727072 - BLOCK
      ?auto_727073 - BLOCK
      ?auto_727074 - BLOCK
      ?auto_727075 - BLOCK
      ?auto_727076 - BLOCK
      ?auto_727077 - BLOCK
      ?auto_727078 - BLOCK
      ?auto_727079 - BLOCK
      ?auto_727080 - BLOCK
      ?auto_727081 - BLOCK
    )
    :vars
    (
      ?auto_727082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727081 ?auto_727082 ) ( ON-TABLE ?auto_727070 ) ( ON ?auto_727071 ?auto_727070 ) ( ON ?auto_727072 ?auto_727071 ) ( ON ?auto_727073 ?auto_727072 ) ( ON ?auto_727074 ?auto_727073 ) ( ON ?auto_727075 ?auto_727074 ) ( ON ?auto_727076 ?auto_727075 ) ( ON ?auto_727077 ?auto_727076 ) ( not ( = ?auto_727070 ?auto_727071 ) ) ( not ( = ?auto_727070 ?auto_727072 ) ) ( not ( = ?auto_727070 ?auto_727073 ) ) ( not ( = ?auto_727070 ?auto_727074 ) ) ( not ( = ?auto_727070 ?auto_727075 ) ) ( not ( = ?auto_727070 ?auto_727076 ) ) ( not ( = ?auto_727070 ?auto_727077 ) ) ( not ( = ?auto_727070 ?auto_727078 ) ) ( not ( = ?auto_727070 ?auto_727079 ) ) ( not ( = ?auto_727070 ?auto_727080 ) ) ( not ( = ?auto_727070 ?auto_727081 ) ) ( not ( = ?auto_727070 ?auto_727082 ) ) ( not ( = ?auto_727071 ?auto_727072 ) ) ( not ( = ?auto_727071 ?auto_727073 ) ) ( not ( = ?auto_727071 ?auto_727074 ) ) ( not ( = ?auto_727071 ?auto_727075 ) ) ( not ( = ?auto_727071 ?auto_727076 ) ) ( not ( = ?auto_727071 ?auto_727077 ) ) ( not ( = ?auto_727071 ?auto_727078 ) ) ( not ( = ?auto_727071 ?auto_727079 ) ) ( not ( = ?auto_727071 ?auto_727080 ) ) ( not ( = ?auto_727071 ?auto_727081 ) ) ( not ( = ?auto_727071 ?auto_727082 ) ) ( not ( = ?auto_727072 ?auto_727073 ) ) ( not ( = ?auto_727072 ?auto_727074 ) ) ( not ( = ?auto_727072 ?auto_727075 ) ) ( not ( = ?auto_727072 ?auto_727076 ) ) ( not ( = ?auto_727072 ?auto_727077 ) ) ( not ( = ?auto_727072 ?auto_727078 ) ) ( not ( = ?auto_727072 ?auto_727079 ) ) ( not ( = ?auto_727072 ?auto_727080 ) ) ( not ( = ?auto_727072 ?auto_727081 ) ) ( not ( = ?auto_727072 ?auto_727082 ) ) ( not ( = ?auto_727073 ?auto_727074 ) ) ( not ( = ?auto_727073 ?auto_727075 ) ) ( not ( = ?auto_727073 ?auto_727076 ) ) ( not ( = ?auto_727073 ?auto_727077 ) ) ( not ( = ?auto_727073 ?auto_727078 ) ) ( not ( = ?auto_727073 ?auto_727079 ) ) ( not ( = ?auto_727073 ?auto_727080 ) ) ( not ( = ?auto_727073 ?auto_727081 ) ) ( not ( = ?auto_727073 ?auto_727082 ) ) ( not ( = ?auto_727074 ?auto_727075 ) ) ( not ( = ?auto_727074 ?auto_727076 ) ) ( not ( = ?auto_727074 ?auto_727077 ) ) ( not ( = ?auto_727074 ?auto_727078 ) ) ( not ( = ?auto_727074 ?auto_727079 ) ) ( not ( = ?auto_727074 ?auto_727080 ) ) ( not ( = ?auto_727074 ?auto_727081 ) ) ( not ( = ?auto_727074 ?auto_727082 ) ) ( not ( = ?auto_727075 ?auto_727076 ) ) ( not ( = ?auto_727075 ?auto_727077 ) ) ( not ( = ?auto_727075 ?auto_727078 ) ) ( not ( = ?auto_727075 ?auto_727079 ) ) ( not ( = ?auto_727075 ?auto_727080 ) ) ( not ( = ?auto_727075 ?auto_727081 ) ) ( not ( = ?auto_727075 ?auto_727082 ) ) ( not ( = ?auto_727076 ?auto_727077 ) ) ( not ( = ?auto_727076 ?auto_727078 ) ) ( not ( = ?auto_727076 ?auto_727079 ) ) ( not ( = ?auto_727076 ?auto_727080 ) ) ( not ( = ?auto_727076 ?auto_727081 ) ) ( not ( = ?auto_727076 ?auto_727082 ) ) ( not ( = ?auto_727077 ?auto_727078 ) ) ( not ( = ?auto_727077 ?auto_727079 ) ) ( not ( = ?auto_727077 ?auto_727080 ) ) ( not ( = ?auto_727077 ?auto_727081 ) ) ( not ( = ?auto_727077 ?auto_727082 ) ) ( not ( = ?auto_727078 ?auto_727079 ) ) ( not ( = ?auto_727078 ?auto_727080 ) ) ( not ( = ?auto_727078 ?auto_727081 ) ) ( not ( = ?auto_727078 ?auto_727082 ) ) ( not ( = ?auto_727079 ?auto_727080 ) ) ( not ( = ?auto_727079 ?auto_727081 ) ) ( not ( = ?auto_727079 ?auto_727082 ) ) ( not ( = ?auto_727080 ?auto_727081 ) ) ( not ( = ?auto_727080 ?auto_727082 ) ) ( not ( = ?auto_727081 ?auto_727082 ) ) ( ON ?auto_727080 ?auto_727081 ) ( ON ?auto_727079 ?auto_727080 ) ( CLEAR ?auto_727077 ) ( ON ?auto_727078 ?auto_727079 ) ( CLEAR ?auto_727078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_727070 ?auto_727071 ?auto_727072 ?auto_727073 ?auto_727074 ?auto_727075 ?auto_727076 ?auto_727077 ?auto_727078 )
      ( MAKE-12PILE ?auto_727070 ?auto_727071 ?auto_727072 ?auto_727073 ?auto_727074 ?auto_727075 ?auto_727076 ?auto_727077 ?auto_727078 ?auto_727079 ?auto_727080 ?auto_727081 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727120 - BLOCK
      ?auto_727121 - BLOCK
      ?auto_727122 - BLOCK
      ?auto_727123 - BLOCK
      ?auto_727124 - BLOCK
      ?auto_727125 - BLOCK
      ?auto_727126 - BLOCK
      ?auto_727127 - BLOCK
      ?auto_727128 - BLOCK
      ?auto_727129 - BLOCK
      ?auto_727130 - BLOCK
      ?auto_727131 - BLOCK
    )
    :vars
    (
      ?auto_727132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727131 ?auto_727132 ) ( ON-TABLE ?auto_727120 ) ( ON ?auto_727121 ?auto_727120 ) ( ON ?auto_727122 ?auto_727121 ) ( ON ?auto_727123 ?auto_727122 ) ( ON ?auto_727124 ?auto_727123 ) ( ON ?auto_727125 ?auto_727124 ) ( ON ?auto_727126 ?auto_727125 ) ( not ( = ?auto_727120 ?auto_727121 ) ) ( not ( = ?auto_727120 ?auto_727122 ) ) ( not ( = ?auto_727120 ?auto_727123 ) ) ( not ( = ?auto_727120 ?auto_727124 ) ) ( not ( = ?auto_727120 ?auto_727125 ) ) ( not ( = ?auto_727120 ?auto_727126 ) ) ( not ( = ?auto_727120 ?auto_727127 ) ) ( not ( = ?auto_727120 ?auto_727128 ) ) ( not ( = ?auto_727120 ?auto_727129 ) ) ( not ( = ?auto_727120 ?auto_727130 ) ) ( not ( = ?auto_727120 ?auto_727131 ) ) ( not ( = ?auto_727120 ?auto_727132 ) ) ( not ( = ?auto_727121 ?auto_727122 ) ) ( not ( = ?auto_727121 ?auto_727123 ) ) ( not ( = ?auto_727121 ?auto_727124 ) ) ( not ( = ?auto_727121 ?auto_727125 ) ) ( not ( = ?auto_727121 ?auto_727126 ) ) ( not ( = ?auto_727121 ?auto_727127 ) ) ( not ( = ?auto_727121 ?auto_727128 ) ) ( not ( = ?auto_727121 ?auto_727129 ) ) ( not ( = ?auto_727121 ?auto_727130 ) ) ( not ( = ?auto_727121 ?auto_727131 ) ) ( not ( = ?auto_727121 ?auto_727132 ) ) ( not ( = ?auto_727122 ?auto_727123 ) ) ( not ( = ?auto_727122 ?auto_727124 ) ) ( not ( = ?auto_727122 ?auto_727125 ) ) ( not ( = ?auto_727122 ?auto_727126 ) ) ( not ( = ?auto_727122 ?auto_727127 ) ) ( not ( = ?auto_727122 ?auto_727128 ) ) ( not ( = ?auto_727122 ?auto_727129 ) ) ( not ( = ?auto_727122 ?auto_727130 ) ) ( not ( = ?auto_727122 ?auto_727131 ) ) ( not ( = ?auto_727122 ?auto_727132 ) ) ( not ( = ?auto_727123 ?auto_727124 ) ) ( not ( = ?auto_727123 ?auto_727125 ) ) ( not ( = ?auto_727123 ?auto_727126 ) ) ( not ( = ?auto_727123 ?auto_727127 ) ) ( not ( = ?auto_727123 ?auto_727128 ) ) ( not ( = ?auto_727123 ?auto_727129 ) ) ( not ( = ?auto_727123 ?auto_727130 ) ) ( not ( = ?auto_727123 ?auto_727131 ) ) ( not ( = ?auto_727123 ?auto_727132 ) ) ( not ( = ?auto_727124 ?auto_727125 ) ) ( not ( = ?auto_727124 ?auto_727126 ) ) ( not ( = ?auto_727124 ?auto_727127 ) ) ( not ( = ?auto_727124 ?auto_727128 ) ) ( not ( = ?auto_727124 ?auto_727129 ) ) ( not ( = ?auto_727124 ?auto_727130 ) ) ( not ( = ?auto_727124 ?auto_727131 ) ) ( not ( = ?auto_727124 ?auto_727132 ) ) ( not ( = ?auto_727125 ?auto_727126 ) ) ( not ( = ?auto_727125 ?auto_727127 ) ) ( not ( = ?auto_727125 ?auto_727128 ) ) ( not ( = ?auto_727125 ?auto_727129 ) ) ( not ( = ?auto_727125 ?auto_727130 ) ) ( not ( = ?auto_727125 ?auto_727131 ) ) ( not ( = ?auto_727125 ?auto_727132 ) ) ( not ( = ?auto_727126 ?auto_727127 ) ) ( not ( = ?auto_727126 ?auto_727128 ) ) ( not ( = ?auto_727126 ?auto_727129 ) ) ( not ( = ?auto_727126 ?auto_727130 ) ) ( not ( = ?auto_727126 ?auto_727131 ) ) ( not ( = ?auto_727126 ?auto_727132 ) ) ( not ( = ?auto_727127 ?auto_727128 ) ) ( not ( = ?auto_727127 ?auto_727129 ) ) ( not ( = ?auto_727127 ?auto_727130 ) ) ( not ( = ?auto_727127 ?auto_727131 ) ) ( not ( = ?auto_727127 ?auto_727132 ) ) ( not ( = ?auto_727128 ?auto_727129 ) ) ( not ( = ?auto_727128 ?auto_727130 ) ) ( not ( = ?auto_727128 ?auto_727131 ) ) ( not ( = ?auto_727128 ?auto_727132 ) ) ( not ( = ?auto_727129 ?auto_727130 ) ) ( not ( = ?auto_727129 ?auto_727131 ) ) ( not ( = ?auto_727129 ?auto_727132 ) ) ( not ( = ?auto_727130 ?auto_727131 ) ) ( not ( = ?auto_727130 ?auto_727132 ) ) ( not ( = ?auto_727131 ?auto_727132 ) ) ( ON ?auto_727130 ?auto_727131 ) ( ON ?auto_727129 ?auto_727130 ) ( ON ?auto_727128 ?auto_727129 ) ( CLEAR ?auto_727126 ) ( ON ?auto_727127 ?auto_727128 ) ( CLEAR ?auto_727127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_727120 ?auto_727121 ?auto_727122 ?auto_727123 ?auto_727124 ?auto_727125 ?auto_727126 ?auto_727127 )
      ( MAKE-12PILE ?auto_727120 ?auto_727121 ?auto_727122 ?auto_727123 ?auto_727124 ?auto_727125 ?auto_727126 ?auto_727127 ?auto_727128 ?auto_727129 ?auto_727130 ?auto_727131 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727170 - BLOCK
      ?auto_727171 - BLOCK
      ?auto_727172 - BLOCK
      ?auto_727173 - BLOCK
      ?auto_727174 - BLOCK
      ?auto_727175 - BLOCK
      ?auto_727176 - BLOCK
      ?auto_727177 - BLOCK
      ?auto_727178 - BLOCK
      ?auto_727179 - BLOCK
      ?auto_727180 - BLOCK
      ?auto_727181 - BLOCK
    )
    :vars
    (
      ?auto_727182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727181 ?auto_727182 ) ( ON-TABLE ?auto_727170 ) ( ON ?auto_727171 ?auto_727170 ) ( ON ?auto_727172 ?auto_727171 ) ( ON ?auto_727173 ?auto_727172 ) ( ON ?auto_727174 ?auto_727173 ) ( ON ?auto_727175 ?auto_727174 ) ( not ( = ?auto_727170 ?auto_727171 ) ) ( not ( = ?auto_727170 ?auto_727172 ) ) ( not ( = ?auto_727170 ?auto_727173 ) ) ( not ( = ?auto_727170 ?auto_727174 ) ) ( not ( = ?auto_727170 ?auto_727175 ) ) ( not ( = ?auto_727170 ?auto_727176 ) ) ( not ( = ?auto_727170 ?auto_727177 ) ) ( not ( = ?auto_727170 ?auto_727178 ) ) ( not ( = ?auto_727170 ?auto_727179 ) ) ( not ( = ?auto_727170 ?auto_727180 ) ) ( not ( = ?auto_727170 ?auto_727181 ) ) ( not ( = ?auto_727170 ?auto_727182 ) ) ( not ( = ?auto_727171 ?auto_727172 ) ) ( not ( = ?auto_727171 ?auto_727173 ) ) ( not ( = ?auto_727171 ?auto_727174 ) ) ( not ( = ?auto_727171 ?auto_727175 ) ) ( not ( = ?auto_727171 ?auto_727176 ) ) ( not ( = ?auto_727171 ?auto_727177 ) ) ( not ( = ?auto_727171 ?auto_727178 ) ) ( not ( = ?auto_727171 ?auto_727179 ) ) ( not ( = ?auto_727171 ?auto_727180 ) ) ( not ( = ?auto_727171 ?auto_727181 ) ) ( not ( = ?auto_727171 ?auto_727182 ) ) ( not ( = ?auto_727172 ?auto_727173 ) ) ( not ( = ?auto_727172 ?auto_727174 ) ) ( not ( = ?auto_727172 ?auto_727175 ) ) ( not ( = ?auto_727172 ?auto_727176 ) ) ( not ( = ?auto_727172 ?auto_727177 ) ) ( not ( = ?auto_727172 ?auto_727178 ) ) ( not ( = ?auto_727172 ?auto_727179 ) ) ( not ( = ?auto_727172 ?auto_727180 ) ) ( not ( = ?auto_727172 ?auto_727181 ) ) ( not ( = ?auto_727172 ?auto_727182 ) ) ( not ( = ?auto_727173 ?auto_727174 ) ) ( not ( = ?auto_727173 ?auto_727175 ) ) ( not ( = ?auto_727173 ?auto_727176 ) ) ( not ( = ?auto_727173 ?auto_727177 ) ) ( not ( = ?auto_727173 ?auto_727178 ) ) ( not ( = ?auto_727173 ?auto_727179 ) ) ( not ( = ?auto_727173 ?auto_727180 ) ) ( not ( = ?auto_727173 ?auto_727181 ) ) ( not ( = ?auto_727173 ?auto_727182 ) ) ( not ( = ?auto_727174 ?auto_727175 ) ) ( not ( = ?auto_727174 ?auto_727176 ) ) ( not ( = ?auto_727174 ?auto_727177 ) ) ( not ( = ?auto_727174 ?auto_727178 ) ) ( not ( = ?auto_727174 ?auto_727179 ) ) ( not ( = ?auto_727174 ?auto_727180 ) ) ( not ( = ?auto_727174 ?auto_727181 ) ) ( not ( = ?auto_727174 ?auto_727182 ) ) ( not ( = ?auto_727175 ?auto_727176 ) ) ( not ( = ?auto_727175 ?auto_727177 ) ) ( not ( = ?auto_727175 ?auto_727178 ) ) ( not ( = ?auto_727175 ?auto_727179 ) ) ( not ( = ?auto_727175 ?auto_727180 ) ) ( not ( = ?auto_727175 ?auto_727181 ) ) ( not ( = ?auto_727175 ?auto_727182 ) ) ( not ( = ?auto_727176 ?auto_727177 ) ) ( not ( = ?auto_727176 ?auto_727178 ) ) ( not ( = ?auto_727176 ?auto_727179 ) ) ( not ( = ?auto_727176 ?auto_727180 ) ) ( not ( = ?auto_727176 ?auto_727181 ) ) ( not ( = ?auto_727176 ?auto_727182 ) ) ( not ( = ?auto_727177 ?auto_727178 ) ) ( not ( = ?auto_727177 ?auto_727179 ) ) ( not ( = ?auto_727177 ?auto_727180 ) ) ( not ( = ?auto_727177 ?auto_727181 ) ) ( not ( = ?auto_727177 ?auto_727182 ) ) ( not ( = ?auto_727178 ?auto_727179 ) ) ( not ( = ?auto_727178 ?auto_727180 ) ) ( not ( = ?auto_727178 ?auto_727181 ) ) ( not ( = ?auto_727178 ?auto_727182 ) ) ( not ( = ?auto_727179 ?auto_727180 ) ) ( not ( = ?auto_727179 ?auto_727181 ) ) ( not ( = ?auto_727179 ?auto_727182 ) ) ( not ( = ?auto_727180 ?auto_727181 ) ) ( not ( = ?auto_727180 ?auto_727182 ) ) ( not ( = ?auto_727181 ?auto_727182 ) ) ( ON ?auto_727180 ?auto_727181 ) ( ON ?auto_727179 ?auto_727180 ) ( ON ?auto_727178 ?auto_727179 ) ( ON ?auto_727177 ?auto_727178 ) ( CLEAR ?auto_727175 ) ( ON ?auto_727176 ?auto_727177 ) ( CLEAR ?auto_727176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_727170 ?auto_727171 ?auto_727172 ?auto_727173 ?auto_727174 ?auto_727175 ?auto_727176 )
      ( MAKE-12PILE ?auto_727170 ?auto_727171 ?auto_727172 ?auto_727173 ?auto_727174 ?auto_727175 ?auto_727176 ?auto_727177 ?auto_727178 ?auto_727179 ?auto_727180 ?auto_727181 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727220 - BLOCK
      ?auto_727221 - BLOCK
      ?auto_727222 - BLOCK
      ?auto_727223 - BLOCK
      ?auto_727224 - BLOCK
      ?auto_727225 - BLOCK
      ?auto_727226 - BLOCK
      ?auto_727227 - BLOCK
      ?auto_727228 - BLOCK
      ?auto_727229 - BLOCK
      ?auto_727230 - BLOCK
      ?auto_727231 - BLOCK
    )
    :vars
    (
      ?auto_727232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727231 ?auto_727232 ) ( ON-TABLE ?auto_727220 ) ( ON ?auto_727221 ?auto_727220 ) ( ON ?auto_727222 ?auto_727221 ) ( ON ?auto_727223 ?auto_727222 ) ( ON ?auto_727224 ?auto_727223 ) ( not ( = ?auto_727220 ?auto_727221 ) ) ( not ( = ?auto_727220 ?auto_727222 ) ) ( not ( = ?auto_727220 ?auto_727223 ) ) ( not ( = ?auto_727220 ?auto_727224 ) ) ( not ( = ?auto_727220 ?auto_727225 ) ) ( not ( = ?auto_727220 ?auto_727226 ) ) ( not ( = ?auto_727220 ?auto_727227 ) ) ( not ( = ?auto_727220 ?auto_727228 ) ) ( not ( = ?auto_727220 ?auto_727229 ) ) ( not ( = ?auto_727220 ?auto_727230 ) ) ( not ( = ?auto_727220 ?auto_727231 ) ) ( not ( = ?auto_727220 ?auto_727232 ) ) ( not ( = ?auto_727221 ?auto_727222 ) ) ( not ( = ?auto_727221 ?auto_727223 ) ) ( not ( = ?auto_727221 ?auto_727224 ) ) ( not ( = ?auto_727221 ?auto_727225 ) ) ( not ( = ?auto_727221 ?auto_727226 ) ) ( not ( = ?auto_727221 ?auto_727227 ) ) ( not ( = ?auto_727221 ?auto_727228 ) ) ( not ( = ?auto_727221 ?auto_727229 ) ) ( not ( = ?auto_727221 ?auto_727230 ) ) ( not ( = ?auto_727221 ?auto_727231 ) ) ( not ( = ?auto_727221 ?auto_727232 ) ) ( not ( = ?auto_727222 ?auto_727223 ) ) ( not ( = ?auto_727222 ?auto_727224 ) ) ( not ( = ?auto_727222 ?auto_727225 ) ) ( not ( = ?auto_727222 ?auto_727226 ) ) ( not ( = ?auto_727222 ?auto_727227 ) ) ( not ( = ?auto_727222 ?auto_727228 ) ) ( not ( = ?auto_727222 ?auto_727229 ) ) ( not ( = ?auto_727222 ?auto_727230 ) ) ( not ( = ?auto_727222 ?auto_727231 ) ) ( not ( = ?auto_727222 ?auto_727232 ) ) ( not ( = ?auto_727223 ?auto_727224 ) ) ( not ( = ?auto_727223 ?auto_727225 ) ) ( not ( = ?auto_727223 ?auto_727226 ) ) ( not ( = ?auto_727223 ?auto_727227 ) ) ( not ( = ?auto_727223 ?auto_727228 ) ) ( not ( = ?auto_727223 ?auto_727229 ) ) ( not ( = ?auto_727223 ?auto_727230 ) ) ( not ( = ?auto_727223 ?auto_727231 ) ) ( not ( = ?auto_727223 ?auto_727232 ) ) ( not ( = ?auto_727224 ?auto_727225 ) ) ( not ( = ?auto_727224 ?auto_727226 ) ) ( not ( = ?auto_727224 ?auto_727227 ) ) ( not ( = ?auto_727224 ?auto_727228 ) ) ( not ( = ?auto_727224 ?auto_727229 ) ) ( not ( = ?auto_727224 ?auto_727230 ) ) ( not ( = ?auto_727224 ?auto_727231 ) ) ( not ( = ?auto_727224 ?auto_727232 ) ) ( not ( = ?auto_727225 ?auto_727226 ) ) ( not ( = ?auto_727225 ?auto_727227 ) ) ( not ( = ?auto_727225 ?auto_727228 ) ) ( not ( = ?auto_727225 ?auto_727229 ) ) ( not ( = ?auto_727225 ?auto_727230 ) ) ( not ( = ?auto_727225 ?auto_727231 ) ) ( not ( = ?auto_727225 ?auto_727232 ) ) ( not ( = ?auto_727226 ?auto_727227 ) ) ( not ( = ?auto_727226 ?auto_727228 ) ) ( not ( = ?auto_727226 ?auto_727229 ) ) ( not ( = ?auto_727226 ?auto_727230 ) ) ( not ( = ?auto_727226 ?auto_727231 ) ) ( not ( = ?auto_727226 ?auto_727232 ) ) ( not ( = ?auto_727227 ?auto_727228 ) ) ( not ( = ?auto_727227 ?auto_727229 ) ) ( not ( = ?auto_727227 ?auto_727230 ) ) ( not ( = ?auto_727227 ?auto_727231 ) ) ( not ( = ?auto_727227 ?auto_727232 ) ) ( not ( = ?auto_727228 ?auto_727229 ) ) ( not ( = ?auto_727228 ?auto_727230 ) ) ( not ( = ?auto_727228 ?auto_727231 ) ) ( not ( = ?auto_727228 ?auto_727232 ) ) ( not ( = ?auto_727229 ?auto_727230 ) ) ( not ( = ?auto_727229 ?auto_727231 ) ) ( not ( = ?auto_727229 ?auto_727232 ) ) ( not ( = ?auto_727230 ?auto_727231 ) ) ( not ( = ?auto_727230 ?auto_727232 ) ) ( not ( = ?auto_727231 ?auto_727232 ) ) ( ON ?auto_727230 ?auto_727231 ) ( ON ?auto_727229 ?auto_727230 ) ( ON ?auto_727228 ?auto_727229 ) ( ON ?auto_727227 ?auto_727228 ) ( ON ?auto_727226 ?auto_727227 ) ( CLEAR ?auto_727224 ) ( ON ?auto_727225 ?auto_727226 ) ( CLEAR ?auto_727225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_727220 ?auto_727221 ?auto_727222 ?auto_727223 ?auto_727224 ?auto_727225 )
      ( MAKE-12PILE ?auto_727220 ?auto_727221 ?auto_727222 ?auto_727223 ?auto_727224 ?auto_727225 ?auto_727226 ?auto_727227 ?auto_727228 ?auto_727229 ?auto_727230 ?auto_727231 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727270 - BLOCK
      ?auto_727271 - BLOCK
      ?auto_727272 - BLOCK
      ?auto_727273 - BLOCK
      ?auto_727274 - BLOCK
      ?auto_727275 - BLOCK
      ?auto_727276 - BLOCK
      ?auto_727277 - BLOCK
      ?auto_727278 - BLOCK
      ?auto_727279 - BLOCK
      ?auto_727280 - BLOCK
      ?auto_727281 - BLOCK
    )
    :vars
    (
      ?auto_727282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727281 ?auto_727282 ) ( ON-TABLE ?auto_727270 ) ( ON ?auto_727271 ?auto_727270 ) ( ON ?auto_727272 ?auto_727271 ) ( ON ?auto_727273 ?auto_727272 ) ( not ( = ?auto_727270 ?auto_727271 ) ) ( not ( = ?auto_727270 ?auto_727272 ) ) ( not ( = ?auto_727270 ?auto_727273 ) ) ( not ( = ?auto_727270 ?auto_727274 ) ) ( not ( = ?auto_727270 ?auto_727275 ) ) ( not ( = ?auto_727270 ?auto_727276 ) ) ( not ( = ?auto_727270 ?auto_727277 ) ) ( not ( = ?auto_727270 ?auto_727278 ) ) ( not ( = ?auto_727270 ?auto_727279 ) ) ( not ( = ?auto_727270 ?auto_727280 ) ) ( not ( = ?auto_727270 ?auto_727281 ) ) ( not ( = ?auto_727270 ?auto_727282 ) ) ( not ( = ?auto_727271 ?auto_727272 ) ) ( not ( = ?auto_727271 ?auto_727273 ) ) ( not ( = ?auto_727271 ?auto_727274 ) ) ( not ( = ?auto_727271 ?auto_727275 ) ) ( not ( = ?auto_727271 ?auto_727276 ) ) ( not ( = ?auto_727271 ?auto_727277 ) ) ( not ( = ?auto_727271 ?auto_727278 ) ) ( not ( = ?auto_727271 ?auto_727279 ) ) ( not ( = ?auto_727271 ?auto_727280 ) ) ( not ( = ?auto_727271 ?auto_727281 ) ) ( not ( = ?auto_727271 ?auto_727282 ) ) ( not ( = ?auto_727272 ?auto_727273 ) ) ( not ( = ?auto_727272 ?auto_727274 ) ) ( not ( = ?auto_727272 ?auto_727275 ) ) ( not ( = ?auto_727272 ?auto_727276 ) ) ( not ( = ?auto_727272 ?auto_727277 ) ) ( not ( = ?auto_727272 ?auto_727278 ) ) ( not ( = ?auto_727272 ?auto_727279 ) ) ( not ( = ?auto_727272 ?auto_727280 ) ) ( not ( = ?auto_727272 ?auto_727281 ) ) ( not ( = ?auto_727272 ?auto_727282 ) ) ( not ( = ?auto_727273 ?auto_727274 ) ) ( not ( = ?auto_727273 ?auto_727275 ) ) ( not ( = ?auto_727273 ?auto_727276 ) ) ( not ( = ?auto_727273 ?auto_727277 ) ) ( not ( = ?auto_727273 ?auto_727278 ) ) ( not ( = ?auto_727273 ?auto_727279 ) ) ( not ( = ?auto_727273 ?auto_727280 ) ) ( not ( = ?auto_727273 ?auto_727281 ) ) ( not ( = ?auto_727273 ?auto_727282 ) ) ( not ( = ?auto_727274 ?auto_727275 ) ) ( not ( = ?auto_727274 ?auto_727276 ) ) ( not ( = ?auto_727274 ?auto_727277 ) ) ( not ( = ?auto_727274 ?auto_727278 ) ) ( not ( = ?auto_727274 ?auto_727279 ) ) ( not ( = ?auto_727274 ?auto_727280 ) ) ( not ( = ?auto_727274 ?auto_727281 ) ) ( not ( = ?auto_727274 ?auto_727282 ) ) ( not ( = ?auto_727275 ?auto_727276 ) ) ( not ( = ?auto_727275 ?auto_727277 ) ) ( not ( = ?auto_727275 ?auto_727278 ) ) ( not ( = ?auto_727275 ?auto_727279 ) ) ( not ( = ?auto_727275 ?auto_727280 ) ) ( not ( = ?auto_727275 ?auto_727281 ) ) ( not ( = ?auto_727275 ?auto_727282 ) ) ( not ( = ?auto_727276 ?auto_727277 ) ) ( not ( = ?auto_727276 ?auto_727278 ) ) ( not ( = ?auto_727276 ?auto_727279 ) ) ( not ( = ?auto_727276 ?auto_727280 ) ) ( not ( = ?auto_727276 ?auto_727281 ) ) ( not ( = ?auto_727276 ?auto_727282 ) ) ( not ( = ?auto_727277 ?auto_727278 ) ) ( not ( = ?auto_727277 ?auto_727279 ) ) ( not ( = ?auto_727277 ?auto_727280 ) ) ( not ( = ?auto_727277 ?auto_727281 ) ) ( not ( = ?auto_727277 ?auto_727282 ) ) ( not ( = ?auto_727278 ?auto_727279 ) ) ( not ( = ?auto_727278 ?auto_727280 ) ) ( not ( = ?auto_727278 ?auto_727281 ) ) ( not ( = ?auto_727278 ?auto_727282 ) ) ( not ( = ?auto_727279 ?auto_727280 ) ) ( not ( = ?auto_727279 ?auto_727281 ) ) ( not ( = ?auto_727279 ?auto_727282 ) ) ( not ( = ?auto_727280 ?auto_727281 ) ) ( not ( = ?auto_727280 ?auto_727282 ) ) ( not ( = ?auto_727281 ?auto_727282 ) ) ( ON ?auto_727280 ?auto_727281 ) ( ON ?auto_727279 ?auto_727280 ) ( ON ?auto_727278 ?auto_727279 ) ( ON ?auto_727277 ?auto_727278 ) ( ON ?auto_727276 ?auto_727277 ) ( ON ?auto_727275 ?auto_727276 ) ( CLEAR ?auto_727273 ) ( ON ?auto_727274 ?auto_727275 ) ( CLEAR ?auto_727274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_727270 ?auto_727271 ?auto_727272 ?auto_727273 ?auto_727274 )
      ( MAKE-12PILE ?auto_727270 ?auto_727271 ?auto_727272 ?auto_727273 ?auto_727274 ?auto_727275 ?auto_727276 ?auto_727277 ?auto_727278 ?auto_727279 ?auto_727280 ?auto_727281 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727320 - BLOCK
      ?auto_727321 - BLOCK
      ?auto_727322 - BLOCK
      ?auto_727323 - BLOCK
      ?auto_727324 - BLOCK
      ?auto_727325 - BLOCK
      ?auto_727326 - BLOCK
      ?auto_727327 - BLOCK
      ?auto_727328 - BLOCK
      ?auto_727329 - BLOCK
      ?auto_727330 - BLOCK
      ?auto_727331 - BLOCK
    )
    :vars
    (
      ?auto_727332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727331 ?auto_727332 ) ( ON-TABLE ?auto_727320 ) ( ON ?auto_727321 ?auto_727320 ) ( ON ?auto_727322 ?auto_727321 ) ( not ( = ?auto_727320 ?auto_727321 ) ) ( not ( = ?auto_727320 ?auto_727322 ) ) ( not ( = ?auto_727320 ?auto_727323 ) ) ( not ( = ?auto_727320 ?auto_727324 ) ) ( not ( = ?auto_727320 ?auto_727325 ) ) ( not ( = ?auto_727320 ?auto_727326 ) ) ( not ( = ?auto_727320 ?auto_727327 ) ) ( not ( = ?auto_727320 ?auto_727328 ) ) ( not ( = ?auto_727320 ?auto_727329 ) ) ( not ( = ?auto_727320 ?auto_727330 ) ) ( not ( = ?auto_727320 ?auto_727331 ) ) ( not ( = ?auto_727320 ?auto_727332 ) ) ( not ( = ?auto_727321 ?auto_727322 ) ) ( not ( = ?auto_727321 ?auto_727323 ) ) ( not ( = ?auto_727321 ?auto_727324 ) ) ( not ( = ?auto_727321 ?auto_727325 ) ) ( not ( = ?auto_727321 ?auto_727326 ) ) ( not ( = ?auto_727321 ?auto_727327 ) ) ( not ( = ?auto_727321 ?auto_727328 ) ) ( not ( = ?auto_727321 ?auto_727329 ) ) ( not ( = ?auto_727321 ?auto_727330 ) ) ( not ( = ?auto_727321 ?auto_727331 ) ) ( not ( = ?auto_727321 ?auto_727332 ) ) ( not ( = ?auto_727322 ?auto_727323 ) ) ( not ( = ?auto_727322 ?auto_727324 ) ) ( not ( = ?auto_727322 ?auto_727325 ) ) ( not ( = ?auto_727322 ?auto_727326 ) ) ( not ( = ?auto_727322 ?auto_727327 ) ) ( not ( = ?auto_727322 ?auto_727328 ) ) ( not ( = ?auto_727322 ?auto_727329 ) ) ( not ( = ?auto_727322 ?auto_727330 ) ) ( not ( = ?auto_727322 ?auto_727331 ) ) ( not ( = ?auto_727322 ?auto_727332 ) ) ( not ( = ?auto_727323 ?auto_727324 ) ) ( not ( = ?auto_727323 ?auto_727325 ) ) ( not ( = ?auto_727323 ?auto_727326 ) ) ( not ( = ?auto_727323 ?auto_727327 ) ) ( not ( = ?auto_727323 ?auto_727328 ) ) ( not ( = ?auto_727323 ?auto_727329 ) ) ( not ( = ?auto_727323 ?auto_727330 ) ) ( not ( = ?auto_727323 ?auto_727331 ) ) ( not ( = ?auto_727323 ?auto_727332 ) ) ( not ( = ?auto_727324 ?auto_727325 ) ) ( not ( = ?auto_727324 ?auto_727326 ) ) ( not ( = ?auto_727324 ?auto_727327 ) ) ( not ( = ?auto_727324 ?auto_727328 ) ) ( not ( = ?auto_727324 ?auto_727329 ) ) ( not ( = ?auto_727324 ?auto_727330 ) ) ( not ( = ?auto_727324 ?auto_727331 ) ) ( not ( = ?auto_727324 ?auto_727332 ) ) ( not ( = ?auto_727325 ?auto_727326 ) ) ( not ( = ?auto_727325 ?auto_727327 ) ) ( not ( = ?auto_727325 ?auto_727328 ) ) ( not ( = ?auto_727325 ?auto_727329 ) ) ( not ( = ?auto_727325 ?auto_727330 ) ) ( not ( = ?auto_727325 ?auto_727331 ) ) ( not ( = ?auto_727325 ?auto_727332 ) ) ( not ( = ?auto_727326 ?auto_727327 ) ) ( not ( = ?auto_727326 ?auto_727328 ) ) ( not ( = ?auto_727326 ?auto_727329 ) ) ( not ( = ?auto_727326 ?auto_727330 ) ) ( not ( = ?auto_727326 ?auto_727331 ) ) ( not ( = ?auto_727326 ?auto_727332 ) ) ( not ( = ?auto_727327 ?auto_727328 ) ) ( not ( = ?auto_727327 ?auto_727329 ) ) ( not ( = ?auto_727327 ?auto_727330 ) ) ( not ( = ?auto_727327 ?auto_727331 ) ) ( not ( = ?auto_727327 ?auto_727332 ) ) ( not ( = ?auto_727328 ?auto_727329 ) ) ( not ( = ?auto_727328 ?auto_727330 ) ) ( not ( = ?auto_727328 ?auto_727331 ) ) ( not ( = ?auto_727328 ?auto_727332 ) ) ( not ( = ?auto_727329 ?auto_727330 ) ) ( not ( = ?auto_727329 ?auto_727331 ) ) ( not ( = ?auto_727329 ?auto_727332 ) ) ( not ( = ?auto_727330 ?auto_727331 ) ) ( not ( = ?auto_727330 ?auto_727332 ) ) ( not ( = ?auto_727331 ?auto_727332 ) ) ( ON ?auto_727330 ?auto_727331 ) ( ON ?auto_727329 ?auto_727330 ) ( ON ?auto_727328 ?auto_727329 ) ( ON ?auto_727327 ?auto_727328 ) ( ON ?auto_727326 ?auto_727327 ) ( ON ?auto_727325 ?auto_727326 ) ( ON ?auto_727324 ?auto_727325 ) ( CLEAR ?auto_727322 ) ( ON ?auto_727323 ?auto_727324 ) ( CLEAR ?auto_727323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_727320 ?auto_727321 ?auto_727322 ?auto_727323 )
      ( MAKE-12PILE ?auto_727320 ?auto_727321 ?auto_727322 ?auto_727323 ?auto_727324 ?auto_727325 ?auto_727326 ?auto_727327 ?auto_727328 ?auto_727329 ?auto_727330 ?auto_727331 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727370 - BLOCK
      ?auto_727371 - BLOCK
      ?auto_727372 - BLOCK
      ?auto_727373 - BLOCK
      ?auto_727374 - BLOCK
      ?auto_727375 - BLOCK
      ?auto_727376 - BLOCK
      ?auto_727377 - BLOCK
      ?auto_727378 - BLOCK
      ?auto_727379 - BLOCK
      ?auto_727380 - BLOCK
      ?auto_727381 - BLOCK
    )
    :vars
    (
      ?auto_727382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727381 ?auto_727382 ) ( ON-TABLE ?auto_727370 ) ( ON ?auto_727371 ?auto_727370 ) ( not ( = ?auto_727370 ?auto_727371 ) ) ( not ( = ?auto_727370 ?auto_727372 ) ) ( not ( = ?auto_727370 ?auto_727373 ) ) ( not ( = ?auto_727370 ?auto_727374 ) ) ( not ( = ?auto_727370 ?auto_727375 ) ) ( not ( = ?auto_727370 ?auto_727376 ) ) ( not ( = ?auto_727370 ?auto_727377 ) ) ( not ( = ?auto_727370 ?auto_727378 ) ) ( not ( = ?auto_727370 ?auto_727379 ) ) ( not ( = ?auto_727370 ?auto_727380 ) ) ( not ( = ?auto_727370 ?auto_727381 ) ) ( not ( = ?auto_727370 ?auto_727382 ) ) ( not ( = ?auto_727371 ?auto_727372 ) ) ( not ( = ?auto_727371 ?auto_727373 ) ) ( not ( = ?auto_727371 ?auto_727374 ) ) ( not ( = ?auto_727371 ?auto_727375 ) ) ( not ( = ?auto_727371 ?auto_727376 ) ) ( not ( = ?auto_727371 ?auto_727377 ) ) ( not ( = ?auto_727371 ?auto_727378 ) ) ( not ( = ?auto_727371 ?auto_727379 ) ) ( not ( = ?auto_727371 ?auto_727380 ) ) ( not ( = ?auto_727371 ?auto_727381 ) ) ( not ( = ?auto_727371 ?auto_727382 ) ) ( not ( = ?auto_727372 ?auto_727373 ) ) ( not ( = ?auto_727372 ?auto_727374 ) ) ( not ( = ?auto_727372 ?auto_727375 ) ) ( not ( = ?auto_727372 ?auto_727376 ) ) ( not ( = ?auto_727372 ?auto_727377 ) ) ( not ( = ?auto_727372 ?auto_727378 ) ) ( not ( = ?auto_727372 ?auto_727379 ) ) ( not ( = ?auto_727372 ?auto_727380 ) ) ( not ( = ?auto_727372 ?auto_727381 ) ) ( not ( = ?auto_727372 ?auto_727382 ) ) ( not ( = ?auto_727373 ?auto_727374 ) ) ( not ( = ?auto_727373 ?auto_727375 ) ) ( not ( = ?auto_727373 ?auto_727376 ) ) ( not ( = ?auto_727373 ?auto_727377 ) ) ( not ( = ?auto_727373 ?auto_727378 ) ) ( not ( = ?auto_727373 ?auto_727379 ) ) ( not ( = ?auto_727373 ?auto_727380 ) ) ( not ( = ?auto_727373 ?auto_727381 ) ) ( not ( = ?auto_727373 ?auto_727382 ) ) ( not ( = ?auto_727374 ?auto_727375 ) ) ( not ( = ?auto_727374 ?auto_727376 ) ) ( not ( = ?auto_727374 ?auto_727377 ) ) ( not ( = ?auto_727374 ?auto_727378 ) ) ( not ( = ?auto_727374 ?auto_727379 ) ) ( not ( = ?auto_727374 ?auto_727380 ) ) ( not ( = ?auto_727374 ?auto_727381 ) ) ( not ( = ?auto_727374 ?auto_727382 ) ) ( not ( = ?auto_727375 ?auto_727376 ) ) ( not ( = ?auto_727375 ?auto_727377 ) ) ( not ( = ?auto_727375 ?auto_727378 ) ) ( not ( = ?auto_727375 ?auto_727379 ) ) ( not ( = ?auto_727375 ?auto_727380 ) ) ( not ( = ?auto_727375 ?auto_727381 ) ) ( not ( = ?auto_727375 ?auto_727382 ) ) ( not ( = ?auto_727376 ?auto_727377 ) ) ( not ( = ?auto_727376 ?auto_727378 ) ) ( not ( = ?auto_727376 ?auto_727379 ) ) ( not ( = ?auto_727376 ?auto_727380 ) ) ( not ( = ?auto_727376 ?auto_727381 ) ) ( not ( = ?auto_727376 ?auto_727382 ) ) ( not ( = ?auto_727377 ?auto_727378 ) ) ( not ( = ?auto_727377 ?auto_727379 ) ) ( not ( = ?auto_727377 ?auto_727380 ) ) ( not ( = ?auto_727377 ?auto_727381 ) ) ( not ( = ?auto_727377 ?auto_727382 ) ) ( not ( = ?auto_727378 ?auto_727379 ) ) ( not ( = ?auto_727378 ?auto_727380 ) ) ( not ( = ?auto_727378 ?auto_727381 ) ) ( not ( = ?auto_727378 ?auto_727382 ) ) ( not ( = ?auto_727379 ?auto_727380 ) ) ( not ( = ?auto_727379 ?auto_727381 ) ) ( not ( = ?auto_727379 ?auto_727382 ) ) ( not ( = ?auto_727380 ?auto_727381 ) ) ( not ( = ?auto_727380 ?auto_727382 ) ) ( not ( = ?auto_727381 ?auto_727382 ) ) ( ON ?auto_727380 ?auto_727381 ) ( ON ?auto_727379 ?auto_727380 ) ( ON ?auto_727378 ?auto_727379 ) ( ON ?auto_727377 ?auto_727378 ) ( ON ?auto_727376 ?auto_727377 ) ( ON ?auto_727375 ?auto_727376 ) ( ON ?auto_727374 ?auto_727375 ) ( ON ?auto_727373 ?auto_727374 ) ( CLEAR ?auto_727371 ) ( ON ?auto_727372 ?auto_727373 ) ( CLEAR ?auto_727372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_727370 ?auto_727371 ?auto_727372 )
      ( MAKE-12PILE ?auto_727370 ?auto_727371 ?auto_727372 ?auto_727373 ?auto_727374 ?auto_727375 ?auto_727376 ?auto_727377 ?auto_727378 ?auto_727379 ?auto_727380 ?auto_727381 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727420 - BLOCK
      ?auto_727421 - BLOCK
      ?auto_727422 - BLOCK
      ?auto_727423 - BLOCK
      ?auto_727424 - BLOCK
      ?auto_727425 - BLOCK
      ?auto_727426 - BLOCK
      ?auto_727427 - BLOCK
      ?auto_727428 - BLOCK
      ?auto_727429 - BLOCK
      ?auto_727430 - BLOCK
      ?auto_727431 - BLOCK
    )
    :vars
    (
      ?auto_727432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727431 ?auto_727432 ) ( ON-TABLE ?auto_727420 ) ( not ( = ?auto_727420 ?auto_727421 ) ) ( not ( = ?auto_727420 ?auto_727422 ) ) ( not ( = ?auto_727420 ?auto_727423 ) ) ( not ( = ?auto_727420 ?auto_727424 ) ) ( not ( = ?auto_727420 ?auto_727425 ) ) ( not ( = ?auto_727420 ?auto_727426 ) ) ( not ( = ?auto_727420 ?auto_727427 ) ) ( not ( = ?auto_727420 ?auto_727428 ) ) ( not ( = ?auto_727420 ?auto_727429 ) ) ( not ( = ?auto_727420 ?auto_727430 ) ) ( not ( = ?auto_727420 ?auto_727431 ) ) ( not ( = ?auto_727420 ?auto_727432 ) ) ( not ( = ?auto_727421 ?auto_727422 ) ) ( not ( = ?auto_727421 ?auto_727423 ) ) ( not ( = ?auto_727421 ?auto_727424 ) ) ( not ( = ?auto_727421 ?auto_727425 ) ) ( not ( = ?auto_727421 ?auto_727426 ) ) ( not ( = ?auto_727421 ?auto_727427 ) ) ( not ( = ?auto_727421 ?auto_727428 ) ) ( not ( = ?auto_727421 ?auto_727429 ) ) ( not ( = ?auto_727421 ?auto_727430 ) ) ( not ( = ?auto_727421 ?auto_727431 ) ) ( not ( = ?auto_727421 ?auto_727432 ) ) ( not ( = ?auto_727422 ?auto_727423 ) ) ( not ( = ?auto_727422 ?auto_727424 ) ) ( not ( = ?auto_727422 ?auto_727425 ) ) ( not ( = ?auto_727422 ?auto_727426 ) ) ( not ( = ?auto_727422 ?auto_727427 ) ) ( not ( = ?auto_727422 ?auto_727428 ) ) ( not ( = ?auto_727422 ?auto_727429 ) ) ( not ( = ?auto_727422 ?auto_727430 ) ) ( not ( = ?auto_727422 ?auto_727431 ) ) ( not ( = ?auto_727422 ?auto_727432 ) ) ( not ( = ?auto_727423 ?auto_727424 ) ) ( not ( = ?auto_727423 ?auto_727425 ) ) ( not ( = ?auto_727423 ?auto_727426 ) ) ( not ( = ?auto_727423 ?auto_727427 ) ) ( not ( = ?auto_727423 ?auto_727428 ) ) ( not ( = ?auto_727423 ?auto_727429 ) ) ( not ( = ?auto_727423 ?auto_727430 ) ) ( not ( = ?auto_727423 ?auto_727431 ) ) ( not ( = ?auto_727423 ?auto_727432 ) ) ( not ( = ?auto_727424 ?auto_727425 ) ) ( not ( = ?auto_727424 ?auto_727426 ) ) ( not ( = ?auto_727424 ?auto_727427 ) ) ( not ( = ?auto_727424 ?auto_727428 ) ) ( not ( = ?auto_727424 ?auto_727429 ) ) ( not ( = ?auto_727424 ?auto_727430 ) ) ( not ( = ?auto_727424 ?auto_727431 ) ) ( not ( = ?auto_727424 ?auto_727432 ) ) ( not ( = ?auto_727425 ?auto_727426 ) ) ( not ( = ?auto_727425 ?auto_727427 ) ) ( not ( = ?auto_727425 ?auto_727428 ) ) ( not ( = ?auto_727425 ?auto_727429 ) ) ( not ( = ?auto_727425 ?auto_727430 ) ) ( not ( = ?auto_727425 ?auto_727431 ) ) ( not ( = ?auto_727425 ?auto_727432 ) ) ( not ( = ?auto_727426 ?auto_727427 ) ) ( not ( = ?auto_727426 ?auto_727428 ) ) ( not ( = ?auto_727426 ?auto_727429 ) ) ( not ( = ?auto_727426 ?auto_727430 ) ) ( not ( = ?auto_727426 ?auto_727431 ) ) ( not ( = ?auto_727426 ?auto_727432 ) ) ( not ( = ?auto_727427 ?auto_727428 ) ) ( not ( = ?auto_727427 ?auto_727429 ) ) ( not ( = ?auto_727427 ?auto_727430 ) ) ( not ( = ?auto_727427 ?auto_727431 ) ) ( not ( = ?auto_727427 ?auto_727432 ) ) ( not ( = ?auto_727428 ?auto_727429 ) ) ( not ( = ?auto_727428 ?auto_727430 ) ) ( not ( = ?auto_727428 ?auto_727431 ) ) ( not ( = ?auto_727428 ?auto_727432 ) ) ( not ( = ?auto_727429 ?auto_727430 ) ) ( not ( = ?auto_727429 ?auto_727431 ) ) ( not ( = ?auto_727429 ?auto_727432 ) ) ( not ( = ?auto_727430 ?auto_727431 ) ) ( not ( = ?auto_727430 ?auto_727432 ) ) ( not ( = ?auto_727431 ?auto_727432 ) ) ( ON ?auto_727430 ?auto_727431 ) ( ON ?auto_727429 ?auto_727430 ) ( ON ?auto_727428 ?auto_727429 ) ( ON ?auto_727427 ?auto_727428 ) ( ON ?auto_727426 ?auto_727427 ) ( ON ?auto_727425 ?auto_727426 ) ( ON ?auto_727424 ?auto_727425 ) ( ON ?auto_727423 ?auto_727424 ) ( ON ?auto_727422 ?auto_727423 ) ( CLEAR ?auto_727420 ) ( ON ?auto_727421 ?auto_727422 ) ( CLEAR ?auto_727421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_727420 ?auto_727421 )
      ( MAKE-12PILE ?auto_727420 ?auto_727421 ?auto_727422 ?auto_727423 ?auto_727424 ?auto_727425 ?auto_727426 ?auto_727427 ?auto_727428 ?auto_727429 ?auto_727430 ?auto_727431 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_727470 - BLOCK
      ?auto_727471 - BLOCK
      ?auto_727472 - BLOCK
      ?auto_727473 - BLOCK
      ?auto_727474 - BLOCK
      ?auto_727475 - BLOCK
      ?auto_727476 - BLOCK
      ?auto_727477 - BLOCK
      ?auto_727478 - BLOCK
      ?auto_727479 - BLOCK
      ?auto_727480 - BLOCK
      ?auto_727481 - BLOCK
    )
    :vars
    (
      ?auto_727482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727481 ?auto_727482 ) ( not ( = ?auto_727470 ?auto_727471 ) ) ( not ( = ?auto_727470 ?auto_727472 ) ) ( not ( = ?auto_727470 ?auto_727473 ) ) ( not ( = ?auto_727470 ?auto_727474 ) ) ( not ( = ?auto_727470 ?auto_727475 ) ) ( not ( = ?auto_727470 ?auto_727476 ) ) ( not ( = ?auto_727470 ?auto_727477 ) ) ( not ( = ?auto_727470 ?auto_727478 ) ) ( not ( = ?auto_727470 ?auto_727479 ) ) ( not ( = ?auto_727470 ?auto_727480 ) ) ( not ( = ?auto_727470 ?auto_727481 ) ) ( not ( = ?auto_727470 ?auto_727482 ) ) ( not ( = ?auto_727471 ?auto_727472 ) ) ( not ( = ?auto_727471 ?auto_727473 ) ) ( not ( = ?auto_727471 ?auto_727474 ) ) ( not ( = ?auto_727471 ?auto_727475 ) ) ( not ( = ?auto_727471 ?auto_727476 ) ) ( not ( = ?auto_727471 ?auto_727477 ) ) ( not ( = ?auto_727471 ?auto_727478 ) ) ( not ( = ?auto_727471 ?auto_727479 ) ) ( not ( = ?auto_727471 ?auto_727480 ) ) ( not ( = ?auto_727471 ?auto_727481 ) ) ( not ( = ?auto_727471 ?auto_727482 ) ) ( not ( = ?auto_727472 ?auto_727473 ) ) ( not ( = ?auto_727472 ?auto_727474 ) ) ( not ( = ?auto_727472 ?auto_727475 ) ) ( not ( = ?auto_727472 ?auto_727476 ) ) ( not ( = ?auto_727472 ?auto_727477 ) ) ( not ( = ?auto_727472 ?auto_727478 ) ) ( not ( = ?auto_727472 ?auto_727479 ) ) ( not ( = ?auto_727472 ?auto_727480 ) ) ( not ( = ?auto_727472 ?auto_727481 ) ) ( not ( = ?auto_727472 ?auto_727482 ) ) ( not ( = ?auto_727473 ?auto_727474 ) ) ( not ( = ?auto_727473 ?auto_727475 ) ) ( not ( = ?auto_727473 ?auto_727476 ) ) ( not ( = ?auto_727473 ?auto_727477 ) ) ( not ( = ?auto_727473 ?auto_727478 ) ) ( not ( = ?auto_727473 ?auto_727479 ) ) ( not ( = ?auto_727473 ?auto_727480 ) ) ( not ( = ?auto_727473 ?auto_727481 ) ) ( not ( = ?auto_727473 ?auto_727482 ) ) ( not ( = ?auto_727474 ?auto_727475 ) ) ( not ( = ?auto_727474 ?auto_727476 ) ) ( not ( = ?auto_727474 ?auto_727477 ) ) ( not ( = ?auto_727474 ?auto_727478 ) ) ( not ( = ?auto_727474 ?auto_727479 ) ) ( not ( = ?auto_727474 ?auto_727480 ) ) ( not ( = ?auto_727474 ?auto_727481 ) ) ( not ( = ?auto_727474 ?auto_727482 ) ) ( not ( = ?auto_727475 ?auto_727476 ) ) ( not ( = ?auto_727475 ?auto_727477 ) ) ( not ( = ?auto_727475 ?auto_727478 ) ) ( not ( = ?auto_727475 ?auto_727479 ) ) ( not ( = ?auto_727475 ?auto_727480 ) ) ( not ( = ?auto_727475 ?auto_727481 ) ) ( not ( = ?auto_727475 ?auto_727482 ) ) ( not ( = ?auto_727476 ?auto_727477 ) ) ( not ( = ?auto_727476 ?auto_727478 ) ) ( not ( = ?auto_727476 ?auto_727479 ) ) ( not ( = ?auto_727476 ?auto_727480 ) ) ( not ( = ?auto_727476 ?auto_727481 ) ) ( not ( = ?auto_727476 ?auto_727482 ) ) ( not ( = ?auto_727477 ?auto_727478 ) ) ( not ( = ?auto_727477 ?auto_727479 ) ) ( not ( = ?auto_727477 ?auto_727480 ) ) ( not ( = ?auto_727477 ?auto_727481 ) ) ( not ( = ?auto_727477 ?auto_727482 ) ) ( not ( = ?auto_727478 ?auto_727479 ) ) ( not ( = ?auto_727478 ?auto_727480 ) ) ( not ( = ?auto_727478 ?auto_727481 ) ) ( not ( = ?auto_727478 ?auto_727482 ) ) ( not ( = ?auto_727479 ?auto_727480 ) ) ( not ( = ?auto_727479 ?auto_727481 ) ) ( not ( = ?auto_727479 ?auto_727482 ) ) ( not ( = ?auto_727480 ?auto_727481 ) ) ( not ( = ?auto_727480 ?auto_727482 ) ) ( not ( = ?auto_727481 ?auto_727482 ) ) ( ON ?auto_727480 ?auto_727481 ) ( ON ?auto_727479 ?auto_727480 ) ( ON ?auto_727478 ?auto_727479 ) ( ON ?auto_727477 ?auto_727478 ) ( ON ?auto_727476 ?auto_727477 ) ( ON ?auto_727475 ?auto_727476 ) ( ON ?auto_727474 ?auto_727475 ) ( ON ?auto_727473 ?auto_727474 ) ( ON ?auto_727472 ?auto_727473 ) ( ON ?auto_727471 ?auto_727472 ) ( ON ?auto_727470 ?auto_727471 ) ( CLEAR ?auto_727470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_727470 )
      ( MAKE-12PILE ?auto_727470 ?auto_727471 ?auto_727472 ?auto_727473 ?auto_727474 ?auto_727475 ?auto_727476 ?auto_727477 ?auto_727478 ?auto_727479 ?auto_727480 ?auto_727481 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727521 - BLOCK
      ?auto_727522 - BLOCK
      ?auto_727523 - BLOCK
      ?auto_727524 - BLOCK
      ?auto_727525 - BLOCK
      ?auto_727526 - BLOCK
      ?auto_727527 - BLOCK
      ?auto_727528 - BLOCK
      ?auto_727529 - BLOCK
      ?auto_727530 - BLOCK
      ?auto_727531 - BLOCK
      ?auto_727532 - BLOCK
      ?auto_727533 - BLOCK
    )
    :vars
    (
      ?auto_727534 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_727532 ) ( ON ?auto_727533 ?auto_727534 ) ( CLEAR ?auto_727533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_727521 ) ( ON ?auto_727522 ?auto_727521 ) ( ON ?auto_727523 ?auto_727522 ) ( ON ?auto_727524 ?auto_727523 ) ( ON ?auto_727525 ?auto_727524 ) ( ON ?auto_727526 ?auto_727525 ) ( ON ?auto_727527 ?auto_727526 ) ( ON ?auto_727528 ?auto_727527 ) ( ON ?auto_727529 ?auto_727528 ) ( ON ?auto_727530 ?auto_727529 ) ( ON ?auto_727531 ?auto_727530 ) ( ON ?auto_727532 ?auto_727531 ) ( not ( = ?auto_727521 ?auto_727522 ) ) ( not ( = ?auto_727521 ?auto_727523 ) ) ( not ( = ?auto_727521 ?auto_727524 ) ) ( not ( = ?auto_727521 ?auto_727525 ) ) ( not ( = ?auto_727521 ?auto_727526 ) ) ( not ( = ?auto_727521 ?auto_727527 ) ) ( not ( = ?auto_727521 ?auto_727528 ) ) ( not ( = ?auto_727521 ?auto_727529 ) ) ( not ( = ?auto_727521 ?auto_727530 ) ) ( not ( = ?auto_727521 ?auto_727531 ) ) ( not ( = ?auto_727521 ?auto_727532 ) ) ( not ( = ?auto_727521 ?auto_727533 ) ) ( not ( = ?auto_727521 ?auto_727534 ) ) ( not ( = ?auto_727522 ?auto_727523 ) ) ( not ( = ?auto_727522 ?auto_727524 ) ) ( not ( = ?auto_727522 ?auto_727525 ) ) ( not ( = ?auto_727522 ?auto_727526 ) ) ( not ( = ?auto_727522 ?auto_727527 ) ) ( not ( = ?auto_727522 ?auto_727528 ) ) ( not ( = ?auto_727522 ?auto_727529 ) ) ( not ( = ?auto_727522 ?auto_727530 ) ) ( not ( = ?auto_727522 ?auto_727531 ) ) ( not ( = ?auto_727522 ?auto_727532 ) ) ( not ( = ?auto_727522 ?auto_727533 ) ) ( not ( = ?auto_727522 ?auto_727534 ) ) ( not ( = ?auto_727523 ?auto_727524 ) ) ( not ( = ?auto_727523 ?auto_727525 ) ) ( not ( = ?auto_727523 ?auto_727526 ) ) ( not ( = ?auto_727523 ?auto_727527 ) ) ( not ( = ?auto_727523 ?auto_727528 ) ) ( not ( = ?auto_727523 ?auto_727529 ) ) ( not ( = ?auto_727523 ?auto_727530 ) ) ( not ( = ?auto_727523 ?auto_727531 ) ) ( not ( = ?auto_727523 ?auto_727532 ) ) ( not ( = ?auto_727523 ?auto_727533 ) ) ( not ( = ?auto_727523 ?auto_727534 ) ) ( not ( = ?auto_727524 ?auto_727525 ) ) ( not ( = ?auto_727524 ?auto_727526 ) ) ( not ( = ?auto_727524 ?auto_727527 ) ) ( not ( = ?auto_727524 ?auto_727528 ) ) ( not ( = ?auto_727524 ?auto_727529 ) ) ( not ( = ?auto_727524 ?auto_727530 ) ) ( not ( = ?auto_727524 ?auto_727531 ) ) ( not ( = ?auto_727524 ?auto_727532 ) ) ( not ( = ?auto_727524 ?auto_727533 ) ) ( not ( = ?auto_727524 ?auto_727534 ) ) ( not ( = ?auto_727525 ?auto_727526 ) ) ( not ( = ?auto_727525 ?auto_727527 ) ) ( not ( = ?auto_727525 ?auto_727528 ) ) ( not ( = ?auto_727525 ?auto_727529 ) ) ( not ( = ?auto_727525 ?auto_727530 ) ) ( not ( = ?auto_727525 ?auto_727531 ) ) ( not ( = ?auto_727525 ?auto_727532 ) ) ( not ( = ?auto_727525 ?auto_727533 ) ) ( not ( = ?auto_727525 ?auto_727534 ) ) ( not ( = ?auto_727526 ?auto_727527 ) ) ( not ( = ?auto_727526 ?auto_727528 ) ) ( not ( = ?auto_727526 ?auto_727529 ) ) ( not ( = ?auto_727526 ?auto_727530 ) ) ( not ( = ?auto_727526 ?auto_727531 ) ) ( not ( = ?auto_727526 ?auto_727532 ) ) ( not ( = ?auto_727526 ?auto_727533 ) ) ( not ( = ?auto_727526 ?auto_727534 ) ) ( not ( = ?auto_727527 ?auto_727528 ) ) ( not ( = ?auto_727527 ?auto_727529 ) ) ( not ( = ?auto_727527 ?auto_727530 ) ) ( not ( = ?auto_727527 ?auto_727531 ) ) ( not ( = ?auto_727527 ?auto_727532 ) ) ( not ( = ?auto_727527 ?auto_727533 ) ) ( not ( = ?auto_727527 ?auto_727534 ) ) ( not ( = ?auto_727528 ?auto_727529 ) ) ( not ( = ?auto_727528 ?auto_727530 ) ) ( not ( = ?auto_727528 ?auto_727531 ) ) ( not ( = ?auto_727528 ?auto_727532 ) ) ( not ( = ?auto_727528 ?auto_727533 ) ) ( not ( = ?auto_727528 ?auto_727534 ) ) ( not ( = ?auto_727529 ?auto_727530 ) ) ( not ( = ?auto_727529 ?auto_727531 ) ) ( not ( = ?auto_727529 ?auto_727532 ) ) ( not ( = ?auto_727529 ?auto_727533 ) ) ( not ( = ?auto_727529 ?auto_727534 ) ) ( not ( = ?auto_727530 ?auto_727531 ) ) ( not ( = ?auto_727530 ?auto_727532 ) ) ( not ( = ?auto_727530 ?auto_727533 ) ) ( not ( = ?auto_727530 ?auto_727534 ) ) ( not ( = ?auto_727531 ?auto_727532 ) ) ( not ( = ?auto_727531 ?auto_727533 ) ) ( not ( = ?auto_727531 ?auto_727534 ) ) ( not ( = ?auto_727532 ?auto_727533 ) ) ( not ( = ?auto_727532 ?auto_727534 ) ) ( not ( = ?auto_727533 ?auto_727534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_727533 ?auto_727534 )
      ( !STACK ?auto_727533 ?auto_727532 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727575 - BLOCK
      ?auto_727576 - BLOCK
      ?auto_727577 - BLOCK
      ?auto_727578 - BLOCK
      ?auto_727579 - BLOCK
      ?auto_727580 - BLOCK
      ?auto_727581 - BLOCK
      ?auto_727582 - BLOCK
      ?auto_727583 - BLOCK
      ?auto_727584 - BLOCK
      ?auto_727585 - BLOCK
      ?auto_727586 - BLOCK
      ?auto_727587 - BLOCK
    )
    :vars
    (
      ?auto_727588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727587 ?auto_727588 ) ( ON-TABLE ?auto_727575 ) ( ON ?auto_727576 ?auto_727575 ) ( ON ?auto_727577 ?auto_727576 ) ( ON ?auto_727578 ?auto_727577 ) ( ON ?auto_727579 ?auto_727578 ) ( ON ?auto_727580 ?auto_727579 ) ( ON ?auto_727581 ?auto_727580 ) ( ON ?auto_727582 ?auto_727581 ) ( ON ?auto_727583 ?auto_727582 ) ( ON ?auto_727584 ?auto_727583 ) ( ON ?auto_727585 ?auto_727584 ) ( not ( = ?auto_727575 ?auto_727576 ) ) ( not ( = ?auto_727575 ?auto_727577 ) ) ( not ( = ?auto_727575 ?auto_727578 ) ) ( not ( = ?auto_727575 ?auto_727579 ) ) ( not ( = ?auto_727575 ?auto_727580 ) ) ( not ( = ?auto_727575 ?auto_727581 ) ) ( not ( = ?auto_727575 ?auto_727582 ) ) ( not ( = ?auto_727575 ?auto_727583 ) ) ( not ( = ?auto_727575 ?auto_727584 ) ) ( not ( = ?auto_727575 ?auto_727585 ) ) ( not ( = ?auto_727575 ?auto_727586 ) ) ( not ( = ?auto_727575 ?auto_727587 ) ) ( not ( = ?auto_727575 ?auto_727588 ) ) ( not ( = ?auto_727576 ?auto_727577 ) ) ( not ( = ?auto_727576 ?auto_727578 ) ) ( not ( = ?auto_727576 ?auto_727579 ) ) ( not ( = ?auto_727576 ?auto_727580 ) ) ( not ( = ?auto_727576 ?auto_727581 ) ) ( not ( = ?auto_727576 ?auto_727582 ) ) ( not ( = ?auto_727576 ?auto_727583 ) ) ( not ( = ?auto_727576 ?auto_727584 ) ) ( not ( = ?auto_727576 ?auto_727585 ) ) ( not ( = ?auto_727576 ?auto_727586 ) ) ( not ( = ?auto_727576 ?auto_727587 ) ) ( not ( = ?auto_727576 ?auto_727588 ) ) ( not ( = ?auto_727577 ?auto_727578 ) ) ( not ( = ?auto_727577 ?auto_727579 ) ) ( not ( = ?auto_727577 ?auto_727580 ) ) ( not ( = ?auto_727577 ?auto_727581 ) ) ( not ( = ?auto_727577 ?auto_727582 ) ) ( not ( = ?auto_727577 ?auto_727583 ) ) ( not ( = ?auto_727577 ?auto_727584 ) ) ( not ( = ?auto_727577 ?auto_727585 ) ) ( not ( = ?auto_727577 ?auto_727586 ) ) ( not ( = ?auto_727577 ?auto_727587 ) ) ( not ( = ?auto_727577 ?auto_727588 ) ) ( not ( = ?auto_727578 ?auto_727579 ) ) ( not ( = ?auto_727578 ?auto_727580 ) ) ( not ( = ?auto_727578 ?auto_727581 ) ) ( not ( = ?auto_727578 ?auto_727582 ) ) ( not ( = ?auto_727578 ?auto_727583 ) ) ( not ( = ?auto_727578 ?auto_727584 ) ) ( not ( = ?auto_727578 ?auto_727585 ) ) ( not ( = ?auto_727578 ?auto_727586 ) ) ( not ( = ?auto_727578 ?auto_727587 ) ) ( not ( = ?auto_727578 ?auto_727588 ) ) ( not ( = ?auto_727579 ?auto_727580 ) ) ( not ( = ?auto_727579 ?auto_727581 ) ) ( not ( = ?auto_727579 ?auto_727582 ) ) ( not ( = ?auto_727579 ?auto_727583 ) ) ( not ( = ?auto_727579 ?auto_727584 ) ) ( not ( = ?auto_727579 ?auto_727585 ) ) ( not ( = ?auto_727579 ?auto_727586 ) ) ( not ( = ?auto_727579 ?auto_727587 ) ) ( not ( = ?auto_727579 ?auto_727588 ) ) ( not ( = ?auto_727580 ?auto_727581 ) ) ( not ( = ?auto_727580 ?auto_727582 ) ) ( not ( = ?auto_727580 ?auto_727583 ) ) ( not ( = ?auto_727580 ?auto_727584 ) ) ( not ( = ?auto_727580 ?auto_727585 ) ) ( not ( = ?auto_727580 ?auto_727586 ) ) ( not ( = ?auto_727580 ?auto_727587 ) ) ( not ( = ?auto_727580 ?auto_727588 ) ) ( not ( = ?auto_727581 ?auto_727582 ) ) ( not ( = ?auto_727581 ?auto_727583 ) ) ( not ( = ?auto_727581 ?auto_727584 ) ) ( not ( = ?auto_727581 ?auto_727585 ) ) ( not ( = ?auto_727581 ?auto_727586 ) ) ( not ( = ?auto_727581 ?auto_727587 ) ) ( not ( = ?auto_727581 ?auto_727588 ) ) ( not ( = ?auto_727582 ?auto_727583 ) ) ( not ( = ?auto_727582 ?auto_727584 ) ) ( not ( = ?auto_727582 ?auto_727585 ) ) ( not ( = ?auto_727582 ?auto_727586 ) ) ( not ( = ?auto_727582 ?auto_727587 ) ) ( not ( = ?auto_727582 ?auto_727588 ) ) ( not ( = ?auto_727583 ?auto_727584 ) ) ( not ( = ?auto_727583 ?auto_727585 ) ) ( not ( = ?auto_727583 ?auto_727586 ) ) ( not ( = ?auto_727583 ?auto_727587 ) ) ( not ( = ?auto_727583 ?auto_727588 ) ) ( not ( = ?auto_727584 ?auto_727585 ) ) ( not ( = ?auto_727584 ?auto_727586 ) ) ( not ( = ?auto_727584 ?auto_727587 ) ) ( not ( = ?auto_727584 ?auto_727588 ) ) ( not ( = ?auto_727585 ?auto_727586 ) ) ( not ( = ?auto_727585 ?auto_727587 ) ) ( not ( = ?auto_727585 ?auto_727588 ) ) ( not ( = ?auto_727586 ?auto_727587 ) ) ( not ( = ?auto_727586 ?auto_727588 ) ) ( not ( = ?auto_727587 ?auto_727588 ) ) ( CLEAR ?auto_727585 ) ( ON ?auto_727586 ?auto_727587 ) ( CLEAR ?auto_727586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_727575 ?auto_727576 ?auto_727577 ?auto_727578 ?auto_727579 ?auto_727580 ?auto_727581 ?auto_727582 ?auto_727583 ?auto_727584 ?auto_727585 ?auto_727586 )
      ( MAKE-13PILE ?auto_727575 ?auto_727576 ?auto_727577 ?auto_727578 ?auto_727579 ?auto_727580 ?auto_727581 ?auto_727582 ?auto_727583 ?auto_727584 ?auto_727585 ?auto_727586 ?auto_727587 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727629 - BLOCK
      ?auto_727630 - BLOCK
      ?auto_727631 - BLOCK
      ?auto_727632 - BLOCK
      ?auto_727633 - BLOCK
      ?auto_727634 - BLOCK
      ?auto_727635 - BLOCK
      ?auto_727636 - BLOCK
      ?auto_727637 - BLOCK
      ?auto_727638 - BLOCK
      ?auto_727639 - BLOCK
      ?auto_727640 - BLOCK
      ?auto_727641 - BLOCK
    )
    :vars
    (
      ?auto_727642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727641 ?auto_727642 ) ( ON-TABLE ?auto_727629 ) ( ON ?auto_727630 ?auto_727629 ) ( ON ?auto_727631 ?auto_727630 ) ( ON ?auto_727632 ?auto_727631 ) ( ON ?auto_727633 ?auto_727632 ) ( ON ?auto_727634 ?auto_727633 ) ( ON ?auto_727635 ?auto_727634 ) ( ON ?auto_727636 ?auto_727635 ) ( ON ?auto_727637 ?auto_727636 ) ( ON ?auto_727638 ?auto_727637 ) ( not ( = ?auto_727629 ?auto_727630 ) ) ( not ( = ?auto_727629 ?auto_727631 ) ) ( not ( = ?auto_727629 ?auto_727632 ) ) ( not ( = ?auto_727629 ?auto_727633 ) ) ( not ( = ?auto_727629 ?auto_727634 ) ) ( not ( = ?auto_727629 ?auto_727635 ) ) ( not ( = ?auto_727629 ?auto_727636 ) ) ( not ( = ?auto_727629 ?auto_727637 ) ) ( not ( = ?auto_727629 ?auto_727638 ) ) ( not ( = ?auto_727629 ?auto_727639 ) ) ( not ( = ?auto_727629 ?auto_727640 ) ) ( not ( = ?auto_727629 ?auto_727641 ) ) ( not ( = ?auto_727629 ?auto_727642 ) ) ( not ( = ?auto_727630 ?auto_727631 ) ) ( not ( = ?auto_727630 ?auto_727632 ) ) ( not ( = ?auto_727630 ?auto_727633 ) ) ( not ( = ?auto_727630 ?auto_727634 ) ) ( not ( = ?auto_727630 ?auto_727635 ) ) ( not ( = ?auto_727630 ?auto_727636 ) ) ( not ( = ?auto_727630 ?auto_727637 ) ) ( not ( = ?auto_727630 ?auto_727638 ) ) ( not ( = ?auto_727630 ?auto_727639 ) ) ( not ( = ?auto_727630 ?auto_727640 ) ) ( not ( = ?auto_727630 ?auto_727641 ) ) ( not ( = ?auto_727630 ?auto_727642 ) ) ( not ( = ?auto_727631 ?auto_727632 ) ) ( not ( = ?auto_727631 ?auto_727633 ) ) ( not ( = ?auto_727631 ?auto_727634 ) ) ( not ( = ?auto_727631 ?auto_727635 ) ) ( not ( = ?auto_727631 ?auto_727636 ) ) ( not ( = ?auto_727631 ?auto_727637 ) ) ( not ( = ?auto_727631 ?auto_727638 ) ) ( not ( = ?auto_727631 ?auto_727639 ) ) ( not ( = ?auto_727631 ?auto_727640 ) ) ( not ( = ?auto_727631 ?auto_727641 ) ) ( not ( = ?auto_727631 ?auto_727642 ) ) ( not ( = ?auto_727632 ?auto_727633 ) ) ( not ( = ?auto_727632 ?auto_727634 ) ) ( not ( = ?auto_727632 ?auto_727635 ) ) ( not ( = ?auto_727632 ?auto_727636 ) ) ( not ( = ?auto_727632 ?auto_727637 ) ) ( not ( = ?auto_727632 ?auto_727638 ) ) ( not ( = ?auto_727632 ?auto_727639 ) ) ( not ( = ?auto_727632 ?auto_727640 ) ) ( not ( = ?auto_727632 ?auto_727641 ) ) ( not ( = ?auto_727632 ?auto_727642 ) ) ( not ( = ?auto_727633 ?auto_727634 ) ) ( not ( = ?auto_727633 ?auto_727635 ) ) ( not ( = ?auto_727633 ?auto_727636 ) ) ( not ( = ?auto_727633 ?auto_727637 ) ) ( not ( = ?auto_727633 ?auto_727638 ) ) ( not ( = ?auto_727633 ?auto_727639 ) ) ( not ( = ?auto_727633 ?auto_727640 ) ) ( not ( = ?auto_727633 ?auto_727641 ) ) ( not ( = ?auto_727633 ?auto_727642 ) ) ( not ( = ?auto_727634 ?auto_727635 ) ) ( not ( = ?auto_727634 ?auto_727636 ) ) ( not ( = ?auto_727634 ?auto_727637 ) ) ( not ( = ?auto_727634 ?auto_727638 ) ) ( not ( = ?auto_727634 ?auto_727639 ) ) ( not ( = ?auto_727634 ?auto_727640 ) ) ( not ( = ?auto_727634 ?auto_727641 ) ) ( not ( = ?auto_727634 ?auto_727642 ) ) ( not ( = ?auto_727635 ?auto_727636 ) ) ( not ( = ?auto_727635 ?auto_727637 ) ) ( not ( = ?auto_727635 ?auto_727638 ) ) ( not ( = ?auto_727635 ?auto_727639 ) ) ( not ( = ?auto_727635 ?auto_727640 ) ) ( not ( = ?auto_727635 ?auto_727641 ) ) ( not ( = ?auto_727635 ?auto_727642 ) ) ( not ( = ?auto_727636 ?auto_727637 ) ) ( not ( = ?auto_727636 ?auto_727638 ) ) ( not ( = ?auto_727636 ?auto_727639 ) ) ( not ( = ?auto_727636 ?auto_727640 ) ) ( not ( = ?auto_727636 ?auto_727641 ) ) ( not ( = ?auto_727636 ?auto_727642 ) ) ( not ( = ?auto_727637 ?auto_727638 ) ) ( not ( = ?auto_727637 ?auto_727639 ) ) ( not ( = ?auto_727637 ?auto_727640 ) ) ( not ( = ?auto_727637 ?auto_727641 ) ) ( not ( = ?auto_727637 ?auto_727642 ) ) ( not ( = ?auto_727638 ?auto_727639 ) ) ( not ( = ?auto_727638 ?auto_727640 ) ) ( not ( = ?auto_727638 ?auto_727641 ) ) ( not ( = ?auto_727638 ?auto_727642 ) ) ( not ( = ?auto_727639 ?auto_727640 ) ) ( not ( = ?auto_727639 ?auto_727641 ) ) ( not ( = ?auto_727639 ?auto_727642 ) ) ( not ( = ?auto_727640 ?auto_727641 ) ) ( not ( = ?auto_727640 ?auto_727642 ) ) ( not ( = ?auto_727641 ?auto_727642 ) ) ( ON ?auto_727640 ?auto_727641 ) ( CLEAR ?auto_727638 ) ( ON ?auto_727639 ?auto_727640 ) ( CLEAR ?auto_727639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_727629 ?auto_727630 ?auto_727631 ?auto_727632 ?auto_727633 ?auto_727634 ?auto_727635 ?auto_727636 ?auto_727637 ?auto_727638 ?auto_727639 )
      ( MAKE-13PILE ?auto_727629 ?auto_727630 ?auto_727631 ?auto_727632 ?auto_727633 ?auto_727634 ?auto_727635 ?auto_727636 ?auto_727637 ?auto_727638 ?auto_727639 ?auto_727640 ?auto_727641 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727683 - BLOCK
      ?auto_727684 - BLOCK
      ?auto_727685 - BLOCK
      ?auto_727686 - BLOCK
      ?auto_727687 - BLOCK
      ?auto_727688 - BLOCK
      ?auto_727689 - BLOCK
      ?auto_727690 - BLOCK
      ?auto_727691 - BLOCK
      ?auto_727692 - BLOCK
      ?auto_727693 - BLOCK
      ?auto_727694 - BLOCK
      ?auto_727695 - BLOCK
    )
    :vars
    (
      ?auto_727696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727695 ?auto_727696 ) ( ON-TABLE ?auto_727683 ) ( ON ?auto_727684 ?auto_727683 ) ( ON ?auto_727685 ?auto_727684 ) ( ON ?auto_727686 ?auto_727685 ) ( ON ?auto_727687 ?auto_727686 ) ( ON ?auto_727688 ?auto_727687 ) ( ON ?auto_727689 ?auto_727688 ) ( ON ?auto_727690 ?auto_727689 ) ( ON ?auto_727691 ?auto_727690 ) ( not ( = ?auto_727683 ?auto_727684 ) ) ( not ( = ?auto_727683 ?auto_727685 ) ) ( not ( = ?auto_727683 ?auto_727686 ) ) ( not ( = ?auto_727683 ?auto_727687 ) ) ( not ( = ?auto_727683 ?auto_727688 ) ) ( not ( = ?auto_727683 ?auto_727689 ) ) ( not ( = ?auto_727683 ?auto_727690 ) ) ( not ( = ?auto_727683 ?auto_727691 ) ) ( not ( = ?auto_727683 ?auto_727692 ) ) ( not ( = ?auto_727683 ?auto_727693 ) ) ( not ( = ?auto_727683 ?auto_727694 ) ) ( not ( = ?auto_727683 ?auto_727695 ) ) ( not ( = ?auto_727683 ?auto_727696 ) ) ( not ( = ?auto_727684 ?auto_727685 ) ) ( not ( = ?auto_727684 ?auto_727686 ) ) ( not ( = ?auto_727684 ?auto_727687 ) ) ( not ( = ?auto_727684 ?auto_727688 ) ) ( not ( = ?auto_727684 ?auto_727689 ) ) ( not ( = ?auto_727684 ?auto_727690 ) ) ( not ( = ?auto_727684 ?auto_727691 ) ) ( not ( = ?auto_727684 ?auto_727692 ) ) ( not ( = ?auto_727684 ?auto_727693 ) ) ( not ( = ?auto_727684 ?auto_727694 ) ) ( not ( = ?auto_727684 ?auto_727695 ) ) ( not ( = ?auto_727684 ?auto_727696 ) ) ( not ( = ?auto_727685 ?auto_727686 ) ) ( not ( = ?auto_727685 ?auto_727687 ) ) ( not ( = ?auto_727685 ?auto_727688 ) ) ( not ( = ?auto_727685 ?auto_727689 ) ) ( not ( = ?auto_727685 ?auto_727690 ) ) ( not ( = ?auto_727685 ?auto_727691 ) ) ( not ( = ?auto_727685 ?auto_727692 ) ) ( not ( = ?auto_727685 ?auto_727693 ) ) ( not ( = ?auto_727685 ?auto_727694 ) ) ( not ( = ?auto_727685 ?auto_727695 ) ) ( not ( = ?auto_727685 ?auto_727696 ) ) ( not ( = ?auto_727686 ?auto_727687 ) ) ( not ( = ?auto_727686 ?auto_727688 ) ) ( not ( = ?auto_727686 ?auto_727689 ) ) ( not ( = ?auto_727686 ?auto_727690 ) ) ( not ( = ?auto_727686 ?auto_727691 ) ) ( not ( = ?auto_727686 ?auto_727692 ) ) ( not ( = ?auto_727686 ?auto_727693 ) ) ( not ( = ?auto_727686 ?auto_727694 ) ) ( not ( = ?auto_727686 ?auto_727695 ) ) ( not ( = ?auto_727686 ?auto_727696 ) ) ( not ( = ?auto_727687 ?auto_727688 ) ) ( not ( = ?auto_727687 ?auto_727689 ) ) ( not ( = ?auto_727687 ?auto_727690 ) ) ( not ( = ?auto_727687 ?auto_727691 ) ) ( not ( = ?auto_727687 ?auto_727692 ) ) ( not ( = ?auto_727687 ?auto_727693 ) ) ( not ( = ?auto_727687 ?auto_727694 ) ) ( not ( = ?auto_727687 ?auto_727695 ) ) ( not ( = ?auto_727687 ?auto_727696 ) ) ( not ( = ?auto_727688 ?auto_727689 ) ) ( not ( = ?auto_727688 ?auto_727690 ) ) ( not ( = ?auto_727688 ?auto_727691 ) ) ( not ( = ?auto_727688 ?auto_727692 ) ) ( not ( = ?auto_727688 ?auto_727693 ) ) ( not ( = ?auto_727688 ?auto_727694 ) ) ( not ( = ?auto_727688 ?auto_727695 ) ) ( not ( = ?auto_727688 ?auto_727696 ) ) ( not ( = ?auto_727689 ?auto_727690 ) ) ( not ( = ?auto_727689 ?auto_727691 ) ) ( not ( = ?auto_727689 ?auto_727692 ) ) ( not ( = ?auto_727689 ?auto_727693 ) ) ( not ( = ?auto_727689 ?auto_727694 ) ) ( not ( = ?auto_727689 ?auto_727695 ) ) ( not ( = ?auto_727689 ?auto_727696 ) ) ( not ( = ?auto_727690 ?auto_727691 ) ) ( not ( = ?auto_727690 ?auto_727692 ) ) ( not ( = ?auto_727690 ?auto_727693 ) ) ( not ( = ?auto_727690 ?auto_727694 ) ) ( not ( = ?auto_727690 ?auto_727695 ) ) ( not ( = ?auto_727690 ?auto_727696 ) ) ( not ( = ?auto_727691 ?auto_727692 ) ) ( not ( = ?auto_727691 ?auto_727693 ) ) ( not ( = ?auto_727691 ?auto_727694 ) ) ( not ( = ?auto_727691 ?auto_727695 ) ) ( not ( = ?auto_727691 ?auto_727696 ) ) ( not ( = ?auto_727692 ?auto_727693 ) ) ( not ( = ?auto_727692 ?auto_727694 ) ) ( not ( = ?auto_727692 ?auto_727695 ) ) ( not ( = ?auto_727692 ?auto_727696 ) ) ( not ( = ?auto_727693 ?auto_727694 ) ) ( not ( = ?auto_727693 ?auto_727695 ) ) ( not ( = ?auto_727693 ?auto_727696 ) ) ( not ( = ?auto_727694 ?auto_727695 ) ) ( not ( = ?auto_727694 ?auto_727696 ) ) ( not ( = ?auto_727695 ?auto_727696 ) ) ( ON ?auto_727694 ?auto_727695 ) ( ON ?auto_727693 ?auto_727694 ) ( CLEAR ?auto_727691 ) ( ON ?auto_727692 ?auto_727693 ) ( CLEAR ?auto_727692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_727683 ?auto_727684 ?auto_727685 ?auto_727686 ?auto_727687 ?auto_727688 ?auto_727689 ?auto_727690 ?auto_727691 ?auto_727692 )
      ( MAKE-13PILE ?auto_727683 ?auto_727684 ?auto_727685 ?auto_727686 ?auto_727687 ?auto_727688 ?auto_727689 ?auto_727690 ?auto_727691 ?auto_727692 ?auto_727693 ?auto_727694 ?auto_727695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727737 - BLOCK
      ?auto_727738 - BLOCK
      ?auto_727739 - BLOCK
      ?auto_727740 - BLOCK
      ?auto_727741 - BLOCK
      ?auto_727742 - BLOCK
      ?auto_727743 - BLOCK
      ?auto_727744 - BLOCK
      ?auto_727745 - BLOCK
      ?auto_727746 - BLOCK
      ?auto_727747 - BLOCK
      ?auto_727748 - BLOCK
      ?auto_727749 - BLOCK
    )
    :vars
    (
      ?auto_727750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727749 ?auto_727750 ) ( ON-TABLE ?auto_727737 ) ( ON ?auto_727738 ?auto_727737 ) ( ON ?auto_727739 ?auto_727738 ) ( ON ?auto_727740 ?auto_727739 ) ( ON ?auto_727741 ?auto_727740 ) ( ON ?auto_727742 ?auto_727741 ) ( ON ?auto_727743 ?auto_727742 ) ( ON ?auto_727744 ?auto_727743 ) ( not ( = ?auto_727737 ?auto_727738 ) ) ( not ( = ?auto_727737 ?auto_727739 ) ) ( not ( = ?auto_727737 ?auto_727740 ) ) ( not ( = ?auto_727737 ?auto_727741 ) ) ( not ( = ?auto_727737 ?auto_727742 ) ) ( not ( = ?auto_727737 ?auto_727743 ) ) ( not ( = ?auto_727737 ?auto_727744 ) ) ( not ( = ?auto_727737 ?auto_727745 ) ) ( not ( = ?auto_727737 ?auto_727746 ) ) ( not ( = ?auto_727737 ?auto_727747 ) ) ( not ( = ?auto_727737 ?auto_727748 ) ) ( not ( = ?auto_727737 ?auto_727749 ) ) ( not ( = ?auto_727737 ?auto_727750 ) ) ( not ( = ?auto_727738 ?auto_727739 ) ) ( not ( = ?auto_727738 ?auto_727740 ) ) ( not ( = ?auto_727738 ?auto_727741 ) ) ( not ( = ?auto_727738 ?auto_727742 ) ) ( not ( = ?auto_727738 ?auto_727743 ) ) ( not ( = ?auto_727738 ?auto_727744 ) ) ( not ( = ?auto_727738 ?auto_727745 ) ) ( not ( = ?auto_727738 ?auto_727746 ) ) ( not ( = ?auto_727738 ?auto_727747 ) ) ( not ( = ?auto_727738 ?auto_727748 ) ) ( not ( = ?auto_727738 ?auto_727749 ) ) ( not ( = ?auto_727738 ?auto_727750 ) ) ( not ( = ?auto_727739 ?auto_727740 ) ) ( not ( = ?auto_727739 ?auto_727741 ) ) ( not ( = ?auto_727739 ?auto_727742 ) ) ( not ( = ?auto_727739 ?auto_727743 ) ) ( not ( = ?auto_727739 ?auto_727744 ) ) ( not ( = ?auto_727739 ?auto_727745 ) ) ( not ( = ?auto_727739 ?auto_727746 ) ) ( not ( = ?auto_727739 ?auto_727747 ) ) ( not ( = ?auto_727739 ?auto_727748 ) ) ( not ( = ?auto_727739 ?auto_727749 ) ) ( not ( = ?auto_727739 ?auto_727750 ) ) ( not ( = ?auto_727740 ?auto_727741 ) ) ( not ( = ?auto_727740 ?auto_727742 ) ) ( not ( = ?auto_727740 ?auto_727743 ) ) ( not ( = ?auto_727740 ?auto_727744 ) ) ( not ( = ?auto_727740 ?auto_727745 ) ) ( not ( = ?auto_727740 ?auto_727746 ) ) ( not ( = ?auto_727740 ?auto_727747 ) ) ( not ( = ?auto_727740 ?auto_727748 ) ) ( not ( = ?auto_727740 ?auto_727749 ) ) ( not ( = ?auto_727740 ?auto_727750 ) ) ( not ( = ?auto_727741 ?auto_727742 ) ) ( not ( = ?auto_727741 ?auto_727743 ) ) ( not ( = ?auto_727741 ?auto_727744 ) ) ( not ( = ?auto_727741 ?auto_727745 ) ) ( not ( = ?auto_727741 ?auto_727746 ) ) ( not ( = ?auto_727741 ?auto_727747 ) ) ( not ( = ?auto_727741 ?auto_727748 ) ) ( not ( = ?auto_727741 ?auto_727749 ) ) ( not ( = ?auto_727741 ?auto_727750 ) ) ( not ( = ?auto_727742 ?auto_727743 ) ) ( not ( = ?auto_727742 ?auto_727744 ) ) ( not ( = ?auto_727742 ?auto_727745 ) ) ( not ( = ?auto_727742 ?auto_727746 ) ) ( not ( = ?auto_727742 ?auto_727747 ) ) ( not ( = ?auto_727742 ?auto_727748 ) ) ( not ( = ?auto_727742 ?auto_727749 ) ) ( not ( = ?auto_727742 ?auto_727750 ) ) ( not ( = ?auto_727743 ?auto_727744 ) ) ( not ( = ?auto_727743 ?auto_727745 ) ) ( not ( = ?auto_727743 ?auto_727746 ) ) ( not ( = ?auto_727743 ?auto_727747 ) ) ( not ( = ?auto_727743 ?auto_727748 ) ) ( not ( = ?auto_727743 ?auto_727749 ) ) ( not ( = ?auto_727743 ?auto_727750 ) ) ( not ( = ?auto_727744 ?auto_727745 ) ) ( not ( = ?auto_727744 ?auto_727746 ) ) ( not ( = ?auto_727744 ?auto_727747 ) ) ( not ( = ?auto_727744 ?auto_727748 ) ) ( not ( = ?auto_727744 ?auto_727749 ) ) ( not ( = ?auto_727744 ?auto_727750 ) ) ( not ( = ?auto_727745 ?auto_727746 ) ) ( not ( = ?auto_727745 ?auto_727747 ) ) ( not ( = ?auto_727745 ?auto_727748 ) ) ( not ( = ?auto_727745 ?auto_727749 ) ) ( not ( = ?auto_727745 ?auto_727750 ) ) ( not ( = ?auto_727746 ?auto_727747 ) ) ( not ( = ?auto_727746 ?auto_727748 ) ) ( not ( = ?auto_727746 ?auto_727749 ) ) ( not ( = ?auto_727746 ?auto_727750 ) ) ( not ( = ?auto_727747 ?auto_727748 ) ) ( not ( = ?auto_727747 ?auto_727749 ) ) ( not ( = ?auto_727747 ?auto_727750 ) ) ( not ( = ?auto_727748 ?auto_727749 ) ) ( not ( = ?auto_727748 ?auto_727750 ) ) ( not ( = ?auto_727749 ?auto_727750 ) ) ( ON ?auto_727748 ?auto_727749 ) ( ON ?auto_727747 ?auto_727748 ) ( ON ?auto_727746 ?auto_727747 ) ( CLEAR ?auto_727744 ) ( ON ?auto_727745 ?auto_727746 ) ( CLEAR ?auto_727745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_727737 ?auto_727738 ?auto_727739 ?auto_727740 ?auto_727741 ?auto_727742 ?auto_727743 ?auto_727744 ?auto_727745 )
      ( MAKE-13PILE ?auto_727737 ?auto_727738 ?auto_727739 ?auto_727740 ?auto_727741 ?auto_727742 ?auto_727743 ?auto_727744 ?auto_727745 ?auto_727746 ?auto_727747 ?auto_727748 ?auto_727749 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727791 - BLOCK
      ?auto_727792 - BLOCK
      ?auto_727793 - BLOCK
      ?auto_727794 - BLOCK
      ?auto_727795 - BLOCK
      ?auto_727796 - BLOCK
      ?auto_727797 - BLOCK
      ?auto_727798 - BLOCK
      ?auto_727799 - BLOCK
      ?auto_727800 - BLOCK
      ?auto_727801 - BLOCK
      ?auto_727802 - BLOCK
      ?auto_727803 - BLOCK
    )
    :vars
    (
      ?auto_727804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727803 ?auto_727804 ) ( ON-TABLE ?auto_727791 ) ( ON ?auto_727792 ?auto_727791 ) ( ON ?auto_727793 ?auto_727792 ) ( ON ?auto_727794 ?auto_727793 ) ( ON ?auto_727795 ?auto_727794 ) ( ON ?auto_727796 ?auto_727795 ) ( ON ?auto_727797 ?auto_727796 ) ( not ( = ?auto_727791 ?auto_727792 ) ) ( not ( = ?auto_727791 ?auto_727793 ) ) ( not ( = ?auto_727791 ?auto_727794 ) ) ( not ( = ?auto_727791 ?auto_727795 ) ) ( not ( = ?auto_727791 ?auto_727796 ) ) ( not ( = ?auto_727791 ?auto_727797 ) ) ( not ( = ?auto_727791 ?auto_727798 ) ) ( not ( = ?auto_727791 ?auto_727799 ) ) ( not ( = ?auto_727791 ?auto_727800 ) ) ( not ( = ?auto_727791 ?auto_727801 ) ) ( not ( = ?auto_727791 ?auto_727802 ) ) ( not ( = ?auto_727791 ?auto_727803 ) ) ( not ( = ?auto_727791 ?auto_727804 ) ) ( not ( = ?auto_727792 ?auto_727793 ) ) ( not ( = ?auto_727792 ?auto_727794 ) ) ( not ( = ?auto_727792 ?auto_727795 ) ) ( not ( = ?auto_727792 ?auto_727796 ) ) ( not ( = ?auto_727792 ?auto_727797 ) ) ( not ( = ?auto_727792 ?auto_727798 ) ) ( not ( = ?auto_727792 ?auto_727799 ) ) ( not ( = ?auto_727792 ?auto_727800 ) ) ( not ( = ?auto_727792 ?auto_727801 ) ) ( not ( = ?auto_727792 ?auto_727802 ) ) ( not ( = ?auto_727792 ?auto_727803 ) ) ( not ( = ?auto_727792 ?auto_727804 ) ) ( not ( = ?auto_727793 ?auto_727794 ) ) ( not ( = ?auto_727793 ?auto_727795 ) ) ( not ( = ?auto_727793 ?auto_727796 ) ) ( not ( = ?auto_727793 ?auto_727797 ) ) ( not ( = ?auto_727793 ?auto_727798 ) ) ( not ( = ?auto_727793 ?auto_727799 ) ) ( not ( = ?auto_727793 ?auto_727800 ) ) ( not ( = ?auto_727793 ?auto_727801 ) ) ( not ( = ?auto_727793 ?auto_727802 ) ) ( not ( = ?auto_727793 ?auto_727803 ) ) ( not ( = ?auto_727793 ?auto_727804 ) ) ( not ( = ?auto_727794 ?auto_727795 ) ) ( not ( = ?auto_727794 ?auto_727796 ) ) ( not ( = ?auto_727794 ?auto_727797 ) ) ( not ( = ?auto_727794 ?auto_727798 ) ) ( not ( = ?auto_727794 ?auto_727799 ) ) ( not ( = ?auto_727794 ?auto_727800 ) ) ( not ( = ?auto_727794 ?auto_727801 ) ) ( not ( = ?auto_727794 ?auto_727802 ) ) ( not ( = ?auto_727794 ?auto_727803 ) ) ( not ( = ?auto_727794 ?auto_727804 ) ) ( not ( = ?auto_727795 ?auto_727796 ) ) ( not ( = ?auto_727795 ?auto_727797 ) ) ( not ( = ?auto_727795 ?auto_727798 ) ) ( not ( = ?auto_727795 ?auto_727799 ) ) ( not ( = ?auto_727795 ?auto_727800 ) ) ( not ( = ?auto_727795 ?auto_727801 ) ) ( not ( = ?auto_727795 ?auto_727802 ) ) ( not ( = ?auto_727795 ?auto_727803 ) ) ( not ( = ?auto_727795 ?auto_727804 ) ) ( not ( = ?auto_727796 ?auto_727797 ) ) ( not ( = ?auto_727796 ?auto_727798 ) ) ( not ( = ?auto_727796 ?auto_727799 ) ) ( not ( = ?auto_727796 ?auto_727800 ) ) ( not ( = ?auto_727796 ?auto_727801 ) ) ( not ( = ?auto_727796 ?auto_727802 ) ) ( not ( = ?auto_727796 ?auto_727803 ) ) ( not ( = ?auto_727796 ?auto_727804 ) ) ( not ( = ?auto_727797 ?auto_727798 ) ) ( not ( = ?auto_727797 ?auto_727799 ) ) ( not ( = ?auto_727797 ?auto_727800 ) ) ( not ( = ?auto_727797 ?auto_727801 ) ) ( not ( = ?auto_727797 ?auto_727802 ) ) ( not ( = ?auto_727797 ?auto_727803 ) ) ( not ( = ?auto_727797 ?auto_727804 ) ) ( not ( = ?auto_727798 ?auto_727799 ) ) ( not ( = ?auto_727798 ?auto_727800 ) ) ( not ( = ?auto_727798 ?auto_727801 ) ) ( not ( = ?auto_727798 ?auto_727802 ) ) ( not ( = ?auto_727798 ?auto_727803 ) ) ( not ( = ?auto_727798 ?auto_727804 ) ) ( not ( = ?auto_727799 ?auto_727800 ) ) ( not ( = ?auto_727799 ?auto_727801 ) ) ( not ( = ?auto_727799 ?auto_727802 ) ) ( not ( = ?auto_727799 ?auto_727803 ) ) ( not ( = ?auto_727799 ?auto_727804 ) ) ( not ( = ?auto_727800 ?auto_727801 ) ) ( not ( = ?auto_727800 ?auto_727802 ) ) ( not ( = ?auto_727800 ?auto_727803 ) ) ( not ( = ?auto_727800 ?auto_727804 ) ) ( not ( = ?auto_727801 ?auto_727802 ) ) ( not ( = ?auto_727801 ?auto_727803 ) ) ( not ( = ?auto_727801 ?auto_727804 ) ) ( not ( = ?auto_727802 ?auto_727803 ) ) ( not ( = ?auto_727802 ?auto_727804 ) ) ( not ( = ?auto_727803 ?auto_727804 ) ) ( ON ?auto_727802 ?auto_727803 ) ( ON ?auto_727801 ?auto_727802 ) ( ON ?auto_727800 ?auto_727801 ) ( ON ?auto_727799 ?auto_727800 ) ( CLEAR ?auto_727797 ) ( ON ?auto_727798 ?auto_727799 ) ( CLEAR ?auto_727798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_727791 ?auto_727792 ?auto_727793 ?auto_727794 ?auto_727795 ?auto_727796 ?auto_727797 ?auto_727798 )
      ( MAKE-13PILE ?auto_727791 ?auto_727792 ?auto_727793 ?auto_727794 ?auto_727795 ?auto_727796 ?auto_727797 ?auto_727798 ?auto_727799 ?auto_727800 ?auto_727801 ?auto_727802 ?auto_727803 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727845 - BLOCK
      ?auto_727846 - BLOCK
      ?auto_727847 - BLOCK
      ?auto_727848 - BLOCK
      ?auto_727849 - BLOCK
      ?auto_727850 - BLOCK
      ?auto_727851 - BLOCK
      ?auto_727852 - BLOCK
      ?auto_727853 - BLOCK
      ?auto_727854 - BLOCK
      ?auto_727855 - BLOCK
      ?auto_727856 - BLOCK
      ?auto_727857 - BLOCK
    )
    :vars
    (
      ?auto_727858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727857 ?auto_727858 ) ( ON-TABLE ?auto_727845 ) ( ON ?auto_727846 ?auto_727845 ) ( ON ?auto_727847 ?auto_727846 ) ( ON ?auto_727848 ?auto_727847 ) ( ON ?auto_727849 ?auto_727848 ) ( ON ?auto_727850 ?auto_727849 ) ( not ( = ?auto_727845 ?auto_727846 ) ) ( not ( = ?auto_727845 ?auto_727847 ) ) ( not ( = ?auto_727845 ?auto_727848 ) ) ( not ( = ?auto_727845 ?auto_727849 ) ) ( not ( = ?auto_727845 ?auto_727850 ) ) ( not ( = ?auto_727845 ?auto_727851 ) ) ( not ( = ?auto_727845 ?auto_727852 ) ) ( not ( = ?auto_727845 ?auto_727853 ) ) ( not ( = ?auto_727845 ?auto_727854 ) ) ( not ( = ?auto_727845 ?auto_727855 ) ) ( not ( = ?auto_727845 ?auto_727856 ) ) ( not ( = ?auto_727845 ?auto_727857 ) ) ( not ( = ?auto_727845 ?auto_727858 ) ) ( not ( = ?auto_727846 ?auto_727847 ) ) ( not ( = ?auto_727846 ?auto_727848 ) ) ( not ( = ?auto_727846 ?auto_727849 ) ) ( not ( = ?auto_727846 ?auto_727850 ) ) ( not ( = ?auto_727846 ?auto_727851 ) ) ( not ( = ?auto_727846 ?auto_727852 ) ) ( not ( = ?auto_727846 ?auto_727853 ) ) ( not ( = ?auto_727846 ?auto_727854 ) ) ( not ( = ?auto_727846 ?auto_727855 ) ) ( not ( = ?auto_727846 ?auto_727856 ) ) ( not ( = ?auto_727846 ?auto_727857 ) ) ( not ( = ?auto_727846 ?auto_727858 ) ) ( not ( = ?auto_727847 ?auto_727848 ) ) ( not ( = ?auto_727847 ?auto_727849 ) ) ( not ( = ?auto_727847 ?auto_727850 ) ) ( not ( = ?auto_727847 ?auto_727851 ) ) ( not ( = ?auto_727847 ?auto_727852 ) ) ( not ( = ?auto_727847 ?auto_727853 ) ) ( not ( = ?auto_727847 ?auto_727854 ) ) ( not ( = ?auto_727847 ?auto_727855 ) ) ( not ( = ?auto_727847 ?auto_727856 ) ) ( not ( = ?auto_727847 ?auto_727857 ) ) ( not ( = ?auto_727847 ?auto_727858 ) ) ( not ( = ?auto_727848 ?auto_727849 ) ) ( not ( = ?auto_727848 ?auto_727850 ) ) ( not ( = ?auto_727848 ?auto_727851 ) ) ( not ( = ?auto_727848 ?auto_727852 ) ) ( not ( = ?auto_727848 ?auto_727853 ) ) ( not ( = ?auto_727848 ?auto_727854 ) ) ( not ( = ?auto_727848 ?auto_727855 ) ) ( not ( = ?auto_727848 ?auto_727856 ) ) ( not ( = ?auto_727848 ?auto_727857 ) ) ( not ( = ?auto_727848 ?auto_727858 ) ) ( not ( = ?auto_727849 ?auto_727850 ) ) ( not ( = ?auto_727849 ?auto_727851 ) ) ( not ( = ?auto_727849 ?auto_727852 ) ) ( not ( = ?auto_727849 ?auto_727853 ) ) ( not ( = ?auto_727849 ?auto_727854 ) ) ( not ( = ?auto_727849 ?auto_727855 ) ) ( not ( = ?auto_727849 ?auto_727856 ) ) ( not ( = ?auto_727849 ?auto_727857 ) ) ( not ( = ?auto_727849 ?auto_727858 ) ) ( not ( = ?auto_727850 ?auto_727851 ) ) ( not ( = ?auto_727850 ?auto_727852 ) ) ( not ( = ?auto_727850 ?auto_727853 ) ) ( not ( = ?auto_727850 ?auto_727854 ) ) ( not ( = ?auto_727850 ?auto_727855 ) ) ( not ( = ?auto_727850 ?auto_727856 ) ) ( not ( = ?auto_727850 ?auto_727857 ) ) ( not ( = ?auto_727850 ?auto_727858 ) ) ( not ( = ?auto_727851 ?auto_727852 ) ) ( not ( = ?auto_727851 ?auto_727853 ) ) ( not ( = ?auto_727851 ?auto_727854 ) ) ( not ( = ?auto_727851 ?auto_727855 ) ) ( not ( = ?auto_727851 ?auto_727856 ) ) ( not ( = ?auto_727851 ?auto_727857 ) ) ( not ( = ?auto_727851 ?auto_727858 ) ) ( not ( = ?auto_727852 ?auto_727853 ) ) ( not ( = ?auto_727852 ?auto_727854 ) ) ( not ( = ?auto_727852 ?auto_727855 ) ) ( not ( = ?auto_727852 ?auto_727856 ) ) ( not ( = ?auto_727852 ?auto_727857 ) ) ( not ( = ?auto_727852 ?auto_727858 ) ) ( not ( = ?auto_727853 ?auto_727854 ) ) ( not ( = ?auto_727853 ?auto_727855 ) ) ( not ( = ?auto_727853 ?auto_727856 ) ) ( not ( = ?auto_727853 ?auto_727857 ) ) ( not ( = ?auto_727853 ?auto_727858 ) ) ( not ( = ?auto_727854 ?auto_727855 ) ) ( not ( = ?auto_727854 ?auto_727856 ) ) ( not ( = ?auto_727854 ?auto_727857 ) ) ( not ( = ?auto_727854 ?auto_727858 ) ) ( not ( = ?auto_727855 ?auto_727856 ) ) ( not ( = ?auto_727855 ?auto_727857 ) ) ( not ( = ?auto_727855 ?auto_727858 ) ) ( not ( = ?auto_727856 ?auto_727857 ) ) ( not ( = ?auto_727856 ?auto_727858 ) ) ( not ( = ?auto_727857 ?auto_727858 ) ) ( ON ?auto_727856 ?auto_727857 ) ( ON ?auto_727855 ?auto_727856 ) ( ON ?auto_727854 ?auto_727855 ) ( ON ?auto_727853 ?auto_727854 ) ( ON ?auto_727852 ?auto_727853 ) ( CLEAR ?auto_727850 ) ( ON ?auto_727851 ?auto_727852 ) ( CLEAR ?auto_727851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_727845 ?auto_727846 ?auto_727847 ?auto_727848 ?auto_727849 ?auto_727850 ?auto_727851 )
      ( MAKE-13PILE ?auto_727845 ?auto_727846 ?auto_727847 ?auto_727848 ?auto_727849 ?auto_727850 ?auto_727851 ?auto_727852 ?auto_727853 ?auto_727854 ?auto_727855 ?auto_727856 ?auto_727857 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727899 - BLOCK
      ?auto_727900 - BLOCK
      ?auto_727901 - BLOCK
      ?auto_727902 - BLOCK
      ?auto_727903 - BLOCK
      ?auto_727904 - BLOCK
      ?auto_727905 - BLOCK
      ?auto_727906 - BLOCK
      ?auto_727907 - BLOCK
      ?auto_727908 - BLOCK
      ?auto_727909 - BLOCK
      ?auto_727910 - BLOCK
      ?auto_727911 - BLOCK
    )
    :vars
    (
      ?auto_727912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727911 ?auto_727912 ) ( ON-TABLE ?auto_727899 ) ( ON ?auto_727900 ?auto_727899 ) ( ON ?auto_727901 ?auto_727900 ) ( ON ?auto_727902 ?auto_727901 ) ( ON ?auto_727903 ?auto_727902 ) ( not ( = ?auto_727899 ?auto_727900 ) ) ( not ( = ?auto_727899 ?auto_727901 ) ) ( not ( = ?auto_727899 ?auto_727902 ) ) ( not ( = ?auto_727899 ?auto_727903 ) ) ( not ( = ?auto_727899 ?auto_727904 ) ) ( not ( = ?auto_727899 ?auto_727905 ) ) ( not ( = ?auto_727899 ?auto_727906 ) ) ( not ( = ?auto_727899 ?auto_727907 ) ) ( not ( = ?auto_727899 ?auto_727908 ) ) ( not ( = ?auto_727899 ?auto_727909 ) ) ( not ( = ?auto_727899 ?auto_727910 ) ) ( not ( = ?auto_727899 ?auto_727911 ) ) ( not ( = ?auto_727899 ?auto_727912 ) ) ( not ( = ?auto_727900 ?auto_727901 ) ) ( not ( = ?auto_727900 ?auto_727902 ) ) ( not ( = ?auto_727900 ?auto_727903 ) ) ( not ( = ?auto_727900 ?auto_727904 ) ) ( not ( = ?auto_727900 ?auto_727905 ) ) ( not ( = ?auto_727900 ?auto_727906 ) ) ( not ( = ?auto_727900 ?auto_727907 ) ) ( not ( = ?auto_727900 ?auto_727908 ) ) ( not ( = ?auto_727900 ?auto_727909 ) ) ( not ( = ?auto_727900 ?auto_727910 ) ) ( not ( = ?auto_727900 ?auto_727911 ) ) ( not ( = ?auto_727900 ?auto_727912 ) ) ( not ( = ?auto_727901 ?auto_727902 ) ) ( not ( = ?auto_727901 ?auto_727903 ) ) ( not ( = ?auto_727901 ?auto_727904 ) ) ( not ( = ?auto_727901 ?auto_727905 ) ) ( not ( = ?auto_727901 ?auto_727906 ) ) ( not ( = ?auto_727901 ?auto_727907 ) ) ( not ( = ?auto_727901 ?auto_727908 ) ) ( not ( = ?auto_727901 ?auto_727909 ) ) ( not ( = ?auto_727901 ?auto_727910 ) ) ( not ( = ?auto_727901 ?auto_727911 ) ) ( not ( = ?auto_727901 ?auto_727912 ) ) ( not ( = ?auto_727902 ?auto_727903 ) ) ( not ( = ?auto_727902 ?auto_727904 ) ) ( not ( = ?auto_727902 ?auto_727905 ) ) ( not ( = ?auto_727902 ?auto_727906 ) ) ( not ( = ?auto_727902 ?auto_727907 ) ) ( not ( = ?auto_727902 ?auto_727908 ) ) ( not ( = ?auto_727902 ?auto_727909 ) ) ( not ( = ?auto_727902 ?auto_727910 ) ) ( not ( = ?auto_727902 ?auto_727911 ) ) ( not ( = ?auto_727902 ?auto_727912 ) ) ( not ( = ?auto_727903 ?auto_727904 ) ) ( not ( = ?auto_727903 ?auto_727905 ) ) ( not ( = ?auto_727903 ?auto_727906 ) ) ( not ( = ?auto_727903 ?auto_727907 ) ) ( not ( = ?auto_727903 ?auto_727908 ) ) ( not ( = ?auto_727903 ?auto_727909 ) ) ( not ( = ?auto_727903 ?auto_727910 ) ) ( not ( = ?auto_727903 ?auto_727911 ) ) ( not ( = ?auto_727903 ?auto_727912 ) ) ( not ( = ?auto_727904 ?auto_727905 ) ) ( not ( = ?auto_727904 ?auto_727906 ) ) ( not ( = ?auto_727904 ?auto_727907 ) ) ( not ( = ?auto_727904 ?auto_727908 ) ) ( not ( = ?auto_727904 ?auto_727909 ) ) ( not ( = ?auto_727904 ?auto_727910 ) ) ( not ( = ?auto_727904 ?auto_727911 ) ) ( not ( = ?auto_727904 ?auto_727912 ) ) ( not ( = ?auto_727905 ?auto_727906 ) ) ( not ( = ?auto_727905 ?auto_727907 ) ) ( not ( = ?auto_727905 ?auto_727908 ) ) ( not ( = ?auto_727905 ?auto_727909 ) ) ( not ( = ?auto_727905 ?auto_727910 ) ) ( not ( = ?auto_727905 ?auto_727911 ) ) ( not ( = ?auto_727905 ?auto_727912 ) ) ( not ( = ?auto_727906 ?auto_727907 ) ) ( not ( = ?auto_727906 ?auto_727908 ) ) ( not ( = ?auto_727906 ?auto_727909 ) ) ( not ( = ?auto_727906 ?auto_727910 ) ) ( not ( = ?auto_727906 ?auto_727911 ) ) ( not ( = ?auto_727906 ?auto_727912 ) ) ( not ( = ?auto_727907 ?auto_727908 ) ) ( not ( = ?auto_727907 ?auto_727909 ) ) ( not ( = ?auto_727907 ?auto_727910 ) ) ( not ( = ?auto_727907 ?auto_727911 ) ) ( not ( = ?auto_727907 ?auto_727912 ) ) ( not ( = ?auto_727908 ?auto_727909 ) ) ( not ( = ?auto_727908 ?auto_727910 ) ) ( not ( = ?auto_727908 ?auto_727911 ) ) ( not ( = ?auto_727908 ?auto_727912 ) ) ( not ( = ?auto_727909 ?auto_727910 ) ) ( not ( = ?auto_727909 ?auto_727911 ) ) ( not ( = ?auto_727909 ?auto_727912 ) ) ( not ( = ?auto_727910 ?auto_727911 ) ) ( not ( = ?auto_727910 ?auto_727912 ) ) ( not ( = ?auto_727911 ?auto_727912 ) ) ( ON ?auto_727910 ?auto_727911 ) ( ON ?auto_727909 ?auto_727910 ) ( ON ?auto_727908 ?auto_727909 ) ( ON ?auto_727907 ?auto_727908 ) ( ON ?auto_727906 ?auto_727907 ) ( ON ?auto_727905 ?auto_727906 ) ( CLEAR ?auto_727903 ) ( ON ?auto_727904 ?auto_727905 ) ( CLEAR ?auto_727904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_727899 ?auto_727900 ?auto_727901 ?auto_727902 ?auto_727903 ?auto_727904 )
      ( MAKE-13PILE ?auto_727899 ?auto_727900 ?auto_727901 ?auto_727902 ?auto_727903 ?auto_727904 ?auto_727905 ?auto_727906 ?auto_727907 ?auto_727908 ?auto_727909 ?auto_727910 ?auto_727911 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_727953 - BLOCK
      ?auto_727954 - BLOCK
      ?auto_727955 - BLOCK
      ?auto_727956 - BLOCK
      ?auto_727957 - BLOCK
      ?auto_727958 - BLOCK
      ?auto_727959 - BLOCK
      ?auto_727960 - BLOCK
      ?auto_727961 - BLOCK
      ?auto_727962 - BLOCK
      ?auto_727963 - BLOCK
      ?auto_727964 - BLOCK
      ?auto_727965 - BLOCK
    )
    :vars
    (
      ?auto_727966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_727965 ?auto_727966 ) ( ON-TABLE ?auto_727953 ) ( ON ?auto_727954 ?auto_727953 ) ( ON ?auto_727955 ?auto_727954 ) ( ON ?auto_727956 ?auto_727955 ) ( not ( = ?auto_727953 ?auto_727954 ) ) ( not ( = ?auto_727953 ?auto_727955 ) ) ( not ( = ?auto_727953 ?auto_727956 ) ) ( not ( = ?auto_727953 ?auto_727957 ) ) ( not ( = ?auto_727953 ?auto_727958 ) ) ( not ( = ?auto_727953 ?auto_727959 ) ) ( not ( = ?auto_727953 ?auto_727960 ) ) ( not ( = ?auto_727953 ?auto_727961 ) ) ( not ( = ?auto_727953 ?auto_727962 ) ) ( not ( = ?auto_727953 ?auto_727963 ) ) ( not ( = ?auto_727953 ?auto_727964 ) ) ( not ( = ?auto_727953 ?auto_727965 ) ) ( not ( = ?auto_727953 ?auto_727966 ) ) ( not ( = ?auto_727954 ?auto_727955 ) ) ( not ( = ?auto_727954 ?auto_727956 ) ) ( not ( = ?auto_727954 ?auto_727957 ) ) ( not ( = ?auto_727954 ?auto_727958 ) ) ( not ( = ?auto_727954 ?auto_727959 ) ) ( not ( = ?auto_727954 ?auto_727960 ) ) ( not ( = ?auto_727954 ?auto_727961 ) ) ( not ( = ?auto_727954 ?auto_727962 ) ) ( not ( = ?auto_727954 ?auto_727963 ) ) ( not ( = ?auto_727954 ?auto_727964 ) ) ( not ( = ?auto_727954 ?auto_727965 ) ) ( not ( = ?auto_727954 ?auto_727966 ) ) ( not ( = ?auto_727955 ?auto_727956 ) ) ( not ( = ?auto_727955 ?auto_727957 ) ) ( not ( = ?auto_727955 ?auto_727958 ) ) ( not ( = ?auto_727955 ?auto_727959 ) ) ( not ( = ?auto_727955 ?auto_727960 ) ) ( not ( = ?auto_727955 ?auto_727961 ) ) ( not ( = ?auto_727955 ?auto_727962 ) ) ( not ( = ?auto_727955 ?auto_727963 ) ) ( not ( = ?auto_727955 ?auto_727964 ) ) ( not ( = ?auto_727955 ?auto_727965 ) ) ( not ( = ?auto_727955 ?auto_727966 ) ) ( not ( = ?auto_727956 ?auto_727957 ) ) ( not ( = ?auto_727956 ?auto_727958 ) ) ( not ( = ?auto_727956 ?auto_727959 ) ) ( not ( = ?auto_727956 ?auto_727960 ) ) ( not ( = ?auto_727956 ?auto_727961 ) ) ( not ( = ?auto_727956 ?auto_727962 ) ) ( not ( = ?auto_727956 ?auto_727963 ) ) ( not ( = ?auto_727956 ?auto_727964 ) ) ( not ( = ?auto_727956 ?auto_727965 ) ) ( not ( = ?auto_727956 ?auto_727966 ) ) ( not ( = ?auto_727957 ?auto_727958 ) ) ( not ( = ?auto_727957 ?auto_727959 ) ) ( not ( = ?auto_727957 ?auto_727960 ) ) ( not ( = ?auto_727957 ?auto_727961 ) ) ( not ( = ?auto_727957 ?auto_727962 ) ) ( not ( = ?auto_727957 ?auto_727963 ) ) ( not ( = ?auto_727957 ?auto_727964 ) ) ( not ( = ?auto_727957 ?auto_727965 ) ) ( not ( = ?auto_727957 ?auto_727966 ) ) ( not ( = ?auto_727958 ?auto_727959 ) ) ( not ( = ?auto_727958 ?auto_727960 ) ) ( not ( = ?auto_727958 ?auto_727961 ) ) ( not ( = ?auto_727958 ?auto_727962 ) ) ( not ( = ?auto_727958 ?auto_727963 ) ) ( not ( = ?auto_727958 ?auto_727964 ) ) ( not ( = ?auto_727958 ?auto_727965 ) ) ( not ( = ?auto_727958 ?auto_727966 ) ) ( not ( = ?auto_727959 ?auto_727960 ) ) ( not ( = ?auto_727959 ?auto_727961 ) ) ( not ( = ?auto_727959 ?auto_727962 ) ) ( not ( = ?auto_727959 ?auto_727963 ) ) ( not ( = ?auto_727959 ?auto_727964 ) ) ( not ( = ?auto_727959 ?auto_727965 ) ) ( not ( = ?auto_727959 ?auto_727966 ) ) ( not ( = ?auto_727960 ?auto_727961 ) ) ( not ( = ?auto_727960 ?auto_727962 ) ) ( not ( = ?auto_727960 ?auto_727963 ) ) ( not ( = ?auto_727960 ?auto_727964 ) ) ( not ( = ?auto_727960 ?auto_727965 ) ) ( not ( = ?auto_727960 ?auto_727966 ) ) ( not ( = ?auto_727961 ?auto_727962 ) ) ( not ( = ?auto_727961 ?auto_727963 ) ) ( not ( = ?auto_727961 ?auto_727964 ) ) ( not ( = ?auto_727961 ?auto_727965 ) ) ( not ( = ?auto_727961 ?auto_727966 ) ) ( not ( = ?auto_727962 ?auto_727963 ) ) ( not ( = ?auto_727962 ?auto_727964 ) ) ( not ( = ?auto_727962 ?auto_727965 ) ) ( not ( = ?auto_727962 ?auto_727966 ) ) ( not ( = ?auto_727963 ?auto_727964 ) ) ( not ( = ?auto_727963 ?auto_727965 ) ) ( not ( = ?auto_727963 ?auto_727966 ) ) ( not ( = ?auto_727964 ?auto_727965 ) ) ( not ( = ?auto_727964 ?auto_727966 ) ) ( not ( = ?auto_727965 ?auto_727966 ) ) ( ON ?auto_727964 ?auto_727965 ) ( ON ?auto_727963 ?auto_727964 ) ( ON ?auto_727962 ?auto_727963 ) ( ON ?auto_727961 ?auto_727962 ) ( ON ?auto_727960 ?auto_727961 ) ( ON ?auto_727959 ?auto_727960 ) ( ON ?auto_727958 ?auto_727959 ) ( CLEAR ?auto_727956 ) ( ON ?auto_727957 ?auto_727958 ) ( CLEAR ?auto_727957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_727953 ?auto_727954 ?auto_727955 ?auto_727956 ?auto_727957 )
      ( MAKE-13PILE ?auto_727953 ?auto_727954 ?auto_727955 ?auto_727956 ?auto_727957 ?auto_727958 ?auto_727959 ?auto_727960 ?auto_727961 ?auto_727962 ?auto_727963 ?auto_727964 ?auto_727965 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_728007 - BLOCK
      ?auto_728008 - BLOCK
      ?auto_728009 - BLOCK
      ?auto_728010 - BLOCK
      ?auto_728011 - BLOCK
      ?auto_728012 - BLOCK
      ?auto_728013 - BLOCK
      ?auto_728014 - BLOCK
      ?auto_728015 - BLOCK
      ?auto_728016 - BLOCK
      ?auto_728017 - BLOCK
      ?auto_728018 - BLOCK
      ?auto_728019 - BLOCK
    )
    :vars
    (
      ?auto_728020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728019 ?auto_728020 ) ( ON-TABLE ?auto_728007 ) ( ON ?auto_728008 ?auto_728007 ) ( ON ?auto_728009 ?auto_728008 ) ( not ( = ?auto_728007 ?auto_728008 ) ) ( not ( = ?auto_728007 ?auto_728009 ) ) ( not ( = ?auto_728007 ?auto_728010 ) ) ( not ( = ?auto_728007 ?auto_728011 ) ) ( not ( = ?auto_728007 ?auto_728012 ) ) ( not ( = ?auto_728007 ?auto_728013 ) ) ( not ( = ?auto_728007 ?auto_728014 ) ) ( not ( = ?auto_728007 ?auto_728015 ) ) ( not ( = ?auto_728007 ?auto_728016 ) ) ( not ( = ?auto_728007 ?auto_728017 ) ) ( not ( = ?auto_728007 ?auto_728018 ) ) ( not ( = ?auto_728007 ?auto_728019 ) ) ( not ( = ?auto_728007 ?auto_728020 ) ) ( not ( = ?auto_728008 ?auto_728009 ) ) ( not ( = ?auto_728008 ?auto_728010 ) ) ( not ( = ?auto_728008 ?auto_728011 ) ) ( not ( = ?auto_728008 ?auto_728012 ) ) ( not ( = ?auto_728008 ?auto_728013 ) ) ( not ( = ?auto_728008 ?auto_728014 ) ) ( not ( = ?auto_728008 ?auto_728015 ) ) ( not ( = ?auto_728008 ?auto_728016 ) ) ( not ( = ?auto_728008 ?auto_728017 ) ) ( not ( = ?auto_728008 ?auto_728018 ) ) ( not ( = ?auto_728008 ?auto_728019 ) ) ( not ( = ?auto_728008 ?auto_728020 ) ) ( not ( = ?auto_728009 ?auto_728010 ) ) ( not ( = ?auto_728009 ?auto_728011 ) ) ( not ( = ?auto_728009 ?auto_728012 ) ) ( not ( = ?auto_728009 ?auto_728013 ) ) ( not ( = ?auto_728009 ?auto_728014 ) ) ( not ( = ?auto_728009 ?auto_728015 ) ) ( not ( = ?auto_728009 ?auto_728016 ) ) ( not ( = ?auto_728009 ?auto_728017 ) ) ( not ( = ?auto_728009 ?auto_728018 ) ) ( not ( = ?auto_728009 ?auto_728019 ) ) ( not ( = ?auto_728009 ?auto_728020 ) ) ( not ( = ?auto_728010 ?auto_728011 ) ) ( not ( = ?auto_728010 ?auto_728012 ) ) ( not ( = ?auto_728010 ?auto_728013 ) ) ( not ( = ?auto_728010 ?auto_728014 ) ) ( not ( = ?auto_728010 ?auto_728015 ) ) ( not ( = ?auto_728010 ?auto_728016 ) ) ( not ( = ?auto_728010 ?auto_728017 ) ) ( not ( = ?auto_728010 ?auto_728018 ) ) ( not ( = ?auto_728010 ?auto_728019 ) ) ( not ( = ?auto_728010 ?auto_728020 ) ) ( not ( = ?auto_728011 ?auto_728012 ) ) ( not ( = ?auto_728011 ?auto_728013 ) ) ( not ( = ?auto_728011 ?auto_728014 ) ) ( not ( = ?auto_728011 ?auto_728015 ) ) ( not ( = ?auto_728011 ?auto_728016 ) ) ( not ( = ?auto_728011 ?auto_728017 ) ) ( not ( = ?auto_728011 ?auto_728018 ) ) ( not ( = ?auto_728011 ?auto_728019 ) ) ( not ( = ?auto_728011 ?auto_728020 ) ) ( not ( = ?auto_728012 ?auto_728013 ) ) ( not ( = ?auto_728012 ?auto_728014 ) ) ( not ( = ?auto_728012 ?auto_728015 ) ) ( not ( = ?auto_728012 ?auto_728016 ) ) ( not ( = ?auto_728012 ?auto_728017 ) ) ( not ( = ?auto_728012 ?auto_728018 ) ) ( not ( = ?auto_728012 ?auto_728019 ) ) ( not ( = ?auto_728012 ?auto_728020 ) ) ( not ( = ?auto_728013 ?auto_728014 ) ) ( not ( = ?auto_728013 ?auto_728015 ) ) ( not ( = ?auto_728013 ?auto_728016 ) ) ( not ( = ?auto_728013 ?auto_728017 ) ) ( not ( = ?auto_728013 ?auto_728018 ) ) ( not ( = ?auto_728013 ?auto_728019 ) ) ( not ( = ?auto_728013 ?auto_728020 ) ) ( not ( = ?auto_728014 ?auto_728015 ) ) ( not ( = ?auto_728014 ?auto_728016 ) ) ( not ( = ?auto_728014 ?auto_728017 ) ) ( not ( = ?auto_728014 ?auto_728018 ) ) ( not ( = ?auto_728014 ?auto_728019 ) ) ( not ( = ?auto_728014 ?auto_728020 ) ) ( not ( = ?auto_728015 ?auto_728016 ) ) ( not ( = ?auto_728015 ?auto_728017 ) ) ( not ( = ?auto_728015 ?auto_728018 ) ) ( not ( = ?auto_728015 ?auto_728019 ) ) ( not ( = ?auto_728015 ?auto_728020 ) ) ( not ( = ?auto_728016 ?auto_728017 ) ) ( not ( = ?auto_728016 ?auto_728018 ) ) ( not ( = ?auto_728016 ?auto_728019 ) ) ( not ( = ?auto_728016 ?auto_728020 ) ) ( not ( = ?auto_728017 ?auto_728018 ) ) ( not ( = ?auto_728017 ?auto_728019 ) ) ( not ( = ?auto_728017 ?auto_728020 ) ) ( not ( = ?auto_728018 ?auto_728019 ) ) ( not ( = ?auto_728018 ?auto_728020 ) ) ( not ( = ?auto_728019 ?auto_728020 ) ) ( ON ?auto_728018 ?auto_728019 ) ( ON ?auto_728017 ?auto_728018 ) ( ON ?auto_728016 ?auto_728017 ) ( ON ?auto_728015 ?auto_728016 ) ( ON ?auto_728014 ?auto_728015 ) ( ON ?auto_728013 ?auto_728014 ) ( ON ?auto_728012 ?auto_728013 ) ( ON ?auto_728011 ?auto_728012 ) ( CLEAR ?auto_728009 ) ( ON ?auto_728010 ?auto_728011 ) ( CLEAR ?auto_728010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_728007 ?auto_728008 ?auto_728009 ?auto_728010 )
      ( MAKE-13PILE ?auto_728007 ?auto_728008 ?auto_728009 ?auto_728010 ?auto_728011 ?auto_728012 ?auto_728013 ?auto_728014 ?auto_728015 ?auto_728016 ?auto_728017 ?auto_728018 ?auto_728019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_728061 - BLOCK
      ?auto_728062 - BLOCK
      ?auto_728063 - BLOCK
      ?auto_728064 - BLOCK
      ?auto_728065 - BLOCK
      ?auto_728066 - BLOCK
      ?auto_728067 - BLOCK
      ?auto_728068 - BLOCK
      ?auto_728069 - BLOCK
      ?auto_728070 - BLOCK
      ?auto_728071 - BLOCK
      ?auto_728072 - BLOCK
      ?auto_728073 - BLOCK
    )
    :vars
    (
      ?auto_728074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728073 ?auto_728074 ) ( ON-TABLE ?auto_728061 ) ( ON ?auto_728062 ?auto_728061 ) ( not ( = ?auto_728061 ?auto_728062 ) ) ( not ( = ?auto_728061 ?auto_728063 ) ) ( not ( = ?auto_728061 ?auto_728064 ) ) ( not ( = ?auto_728061 ?auto_728065 ) ) ( not ( = ?auto_728061 ?auto_728066 ) ) ( not ( = ?auto_728061 ?auto_728067 ) ) ( not ( = ?auto_728061 ?auto_728068 ) ) ( not ( = ?auto_728061 ?auto_728069 ) ) ( not ( = ?auto_728061 ?auto_728070 ) ) ( not ( = ?auto_728061 ?auto_728071 ) ) ( not ( = ?auto_728061 ?auto_728072 ) ) ( not ( = ?auto_728061 ?auto_728073 ) ) ( not ( = ?auto_728061 ?auto_728074 ) ) ( not ( = ?auto_728062 ?auto_728063 ) ) ( not ( = ?auto_728062 ?auto_728064 ) ) ( not ( = ?auto_728062 ?auto_728065 ) ) ( not ( = ?auto_728062 ?auto_728066 ) ) ( not ( = ?auto_728062 ?auto_728067 ) ) ( not ( = ?auto_728062 ?auto_728068 ) ) ( not ( = ?auto_728062 ?auto_728069 ) ) ( not ( = ?auto_728062 ?auto_728070 ) ) ( not ( = ?auto_728062 ?auto_728071 ) ) ( not ( = ?auto_728062 ?auto_728072 ) ) ( not ( = ?auto_728062 ?auto_728073 ) ) ( not ( = ?auto_728062 ?auto_728074 ) ) ( not ( = ?auto_728063 ?auto_728064 ) ) ( not ( = ?auto_728063 ?auto_728065 ) ) ( not ( = ?auto_728063 ?auto_728066 ) ) ( not ( = ?auto_728063 ?auto_728067 ) ) ( not ( = ?auto_728063 ?auto_728068 ) ) ( not ( = ?auto_728063 ?auto_728069 ) ) ( not ( = ?auto_728063 ?auto_728070 ) ) ( not ( = ?auto_728063 ?auto_728071 ) ) ( not ( = ?auto_728063 ?auto_728072 ) ) ( not ( = ?auto_728063 ?auto_728073 ) ) ( not ( = ?auto_728063 ?auto_728074 ) ) ( not ( = ?auto_728064 ?auto_728065 ) ) ( not ( = ?auto_728064 ?auto_728066 ) ) ( not ( = ?auto_728064 ?auto_728067 ) ) ( not ( = ?auto_728064 ?auto_728068 ) ) ( not ( = ?auto_728064 ?auto_728069 ) ) ( not ( = ?auto_728064 ?auto_728070 ) ) ( not ( = ?auto_728064 ?auto_728071 ) ) ( not ( = ?auto_728064 ?auto_728072 ) ) ( not ( = ?auto_728064 ?auto_728073 ) ) ( not ( = ?auto_728064 ?auto_728074 ) ) ( not ( = ?auto_728065 ?auto_728066 ) ) ( not ( = ?auto_728065 ?auto_728067 ) ) ( not ( = ?auto_728065 ?auto_728068 ) ) ( not ( = ?auto_728065 ?auto_728069 ) ) ( not ( = ?auto_728065 ?auto_728070 ) ) ( not ( = ?auto_728065 ?auto_728071 ) ) ( not ( = ?auto_728065 ?auto_728072 ) ) ( not ( = ?auto_728065 ?auto_728073 ) ) ( not ( = ?auto_728065 ?auto_728074 ) ) ( not ( = ?auto_728066 ?auto_728067 ) ) ( not ( = ?auto_728066 ?auto_728068 ) ) ( not ( = ?auto_728066 ?auto_728069 ) ) ( not ( = ?auto_728066 ?auto_728070 ) ) ( not ( = ?auto_728066 ?auto_728071 ) ) ( not ( = ?auto_728066 ?auto_728072 ) ) ( not ( = ?auto_728066 ?auto_728073 ) ) ( not ( = ?auto_728066 ?auto_728074 ) ) ( not ( = ?auto_728067 ?auto_728068 ) ) ( not ( = ?auto_728067 ?auto_728069 ) ) ( not ( = ?auto_728067 ?auto_728070 ) ) ( not ( = ?auto_728067 ?auto_728071 ) ) ( not ( = ?auto_728067 ?auto_728072 ) ) ( not ( = ?auto_728067 ?auto_728073 ) ) ( not ( = ?auto_728067 ?auto_728074 ) ) ( not ( = ?auto_728068 ?auto_728069 ) ) ( not ( = ?auto_728068 ?auto_728070 ) ) ( not ( = ?auto_728068 ?auto_728071 ) ) ( not ( = ?auto_728068 ?auto_728072 ) ) ( not ( = ?auto_728068 ?auto_728073 ) ) ( not ( = ?auto_728068 ?auto_728074 ) ) ( not ( = ?auto_728069 ?auto_728070 ) ) ( not ( = ?auto_728069 ?auto_728071 ) ) ( not ( = ?auto_728069 ?auto_728072 ) ) ( not ( = ?auto_728069 ?auto_728073 ) ) ( not ( = ?auto_728069 ?auto_728074 ) ) ( not ( = ?auto_728070 ?auto_728071 ) ) ( not ( = ?auto_728070 ?auto_728072 ) ) ( not ( = ?auto_728070 ?auto_728073 ) ) ( not ( = ?auto_728070 ?auto_728074 ) ) ( not ( = ?auto_728071 ?auto_728072 ) ) ( not ( = ?auto_728071 ?auto_728073 ) ) ( not ( = ?auto_728071 ?auto_728074 ) ) ( not ( = ?auto_728072 ?auto_728073 ) ) ( not ( = ?auto_728072 ?auto_728074 ) ) ( not ( = ?auto_728073 ?auto_728074 ) ) ( ON ?auto_728072 ?auto_728073 ) ( ON ?auto_728071 ?auto_728072 ) ( ON ?auto_728070 ?auto_728071 ) ( ON ?auto_728069 ?auto_728070 ) ( ON ?auto_728068 ?auto_728069 ) ( ON ?auto_728067 ?auto_728068 ) ( ON ?auto_728066 ?auto_728067 ) ( ON ?auto_728065 ?auto_728066 ) ( ON ?auto_728064 ?auto_728065 ) ( CLEAR ?auto_728062 ) ( ON ?auto_728063 ?auto_728064 ) ( CLEAR ?auto_728063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_728061 ?auto_728062 ?auto_728063 )
      ( MAKE-13PILE ?auto_728061 ?auto_728062 ?auto_728063 ?auto_728064 ?auto_728065 ?auto_728066 ?auto_728067 ?auto_728068 ?auto_728069 ?auto_728070 ?auto_728071 ?auto_728072 ?auto_728073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_728115 - BLOCK
      ?auto_728116 - BLOCK
      ?auto_728117 - BLOCK
      ?auto_728118 - BLOCK
      ?auto_728119 - BLOCK
      ?auto_728120 - BLOCK
      ?auto_728121 - BLOCK
      ?auto_728122 - BLOCK
      ?auto_728123 - BLOCK
      ?auto_728124 - BLOCK
      ?auto_728125 - BLOCK
      ?auto_728126 - BLOCK
      ?auto_728127 - BLOCK
    )
    :vars
    (
      ?auto_728128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728127 ?auto_728128 ) ( ON-TABLE ?auto_728115 ) ( not ( = ?auto_728115 ?auto_728116 ) ) ( not ( = ?auto_728115 ?auto_728117 ) ) ( not ( = ?auto_728115 ?auto_728118 ) ) ( not ( = ?auto_728115 ?auto_728119 ) ) ( not ( = ?auto_728115 ?auto_728120 ) ) ( not ( = ?auto_728115 ?auto_728121 ) ) ( not ( = ?auto_728115 ?auto_728122 ) ) ( not ( = ?auto_728115 ?auto_728123 ) ) ( not ( = ?auto_728115 ?auto_728124 ) ) ( not ( = ?auto_728115 ?auto_728125 ) ) ( not ( = ?auto_728115 ?auto_728126 ) ) ( not ( = ?auto_728115 ?auto_728127 ) ) ( not ( = ?auto_728115 ?auto_728128 ) ) ( not ( = ?auto_728116 ?auto_728117 ) ) ( not ( = ?auto_728116 ?auto_728118 ) ) ( not ( = ?auto_728116 ?auto_728119 ) ) ( not ( = ?auto_728116 ?auto_728120 ) ) ( not ( = ?auto_728116 ?auto_728121 ) ) ( not ( = ?auto_728116 ?auto_728122 ) ) ( not ( = ?auto_728116 ?auto_728123 ) ) ( not ( = ?auto_728116 ?auto_728124 ) ) ( not ( = ?auto_728116 ?auto_728125 ) ) ( not ( = ?auto_728116 ?auto_728126 ) ) ( not ( = ?auto_728116 ?auto_728127 ) ) ( not ( = ?auto_728116 ?auto_728128 ) ) ( not ( = ?auto_728117 ?auto_728118 ) ) ( not ( = ?auto_728117 ?auto_728119 ) ) ( not ( = ?auto_728117 ?auto_728120 ) ) ( not ( = ?auto_728117 ?auto_728121 ) ) ( not ( = ?auto_728117 ?auto_728122 ) ) ( not ( = ?auto_728117 ?auto_728123 ) ) ( not ( = ?auto_728117 ?auto_728124 ) ) ( not ( = ?auto_728117 ?auto_728125 ) ) ( not ( = ?auto_728117 ?auto_728126 ) ) ( not ( = ?auto_728117 ?auto_728127 ) ) ( not ( = ?auto_728117 ?auto_728128 ) ) ( not ( = ?auto_728118 ?auto_728119 ) ) ( not ( = ?auto_728118 ?auto_728120 ) ) ( not ( = ?auto_728118 ?auto_728121 ) ) ( not ( = ?auto_728118 ?auto_728122 ) ) ( not ( = ?auto_728118 ?auto_728123 ) ) ( not ( = ?auto_728118 ?auto_728124 ) ) ( not ( = ?auto_728118 ?auto_728125 ) ) ( not ( = ?auto_728118 ?auto_728126 ) ) ( not ( = ?auto_728118 ?auto_728127 ) ) ( not ( = ?auto_728118 ?auto_728128 ) ) ( not ( = ?auto_728119 ?auto_728120 ) ) ( not ( = ?auto_728119 ?auto_728121 ) ) ( not ( = ?auto_728119 ?auto_728122 ) ) ( not ( = ?auto_728119 ?auto_728123 ) ) ( not ( = ?auto_728119 ?auto_728124 ) ) ( not ( = ?auto_728119 ?auto_728125 ) ) ( not ( = ?auto_728119 ?auto_728126 ) ) ( not ( = ?auto_728119 ?auto_728127 ) ) ( not ( = ?auto_728119 ?auto_728128 ) ) ( not ( = ?auto_728120 ?auto_728121 ) ) ( not ( = ?auto_728120 ?auto_728122 ) ) ( not ( = ?auto_728120 ?auto_728123 ) ) ( not ( = ?auto_728120 ?auto_728124 ) ) ( not ( = ?auto_728120 ?auto_728125 ) ) ( not ( = ?auto_728120 ?auto_728126 ) ) ( not ( = ?auto_728120 ?auto_728127 ) ) ( not ( = ?auto_728120 ?auto_728128 ) ) ( not ( = ?auto_728121 ?auto_728122 ) ) ( not ( = ?auto_728121 ?auto_728123 ) ) ( not ( = ?auto_728121 ?auto_728124 ) ) ( not ( = ?auto_728121 ?auto_728125 ) ) ( not ( = ?auto_728121 ?auto_728126 ) ) ( not ( = ?auto_728121 ?auto_728127 ) ) ( not ( = ?auto_728121 ?auto_728128 ) ) ( not ( = ?auto_728122 ?auto_728123 ) ) ( not ( = ?auto_728122 ?auto_728124 ) ) ( not ( = ?auto_728122 ?auto_728125 ) ) ( not ( = ?auto_728122 ?auto_728126 ) ) ( not ( = ?auto_728122 ?auto_728127 ) ) ( not ( = ?auto_728122 ?auto_728128 ) ) ( not ( = ?auto_728123 ?auto_728124 ) ) ( not ( = ?auto_728123 ?auto_728125 ) ) ( not ( = ?auto_728123 ?auto_728126 ) ) ( not ( = ?auto_728123 ?auto_728127 ) ) ( not ( = ?auto_728123 ?auto_728128 ) ) ( not ( = ?auto_728124 ?auto_728125 ) ) ( not ( = ?auto_728124 ?auto_728126 ) ) ( not ( = ?auto_728124 ?auto_728127 ) ) ( not ( = ?auto_728124 ?auto_728128 ) ) ( not ( = ?auto_728125 ?auto_728126 ) ) ( not ( = ?auto_728125 ?auto_728127 ) ) ( not ( = ?auto_728125 ?auto_728128 ) ) ( not ( = ?auto_728126 ?auto_728127 ) ) ( not ( = ?auto_728126 ?auto_728128 ) ) ( not ( = ?auto_728127 ?auto_728128 ) ) ( ON ?auto_728126 ?auto_728127 ) ( ON ?auto_728125 ?auto_728126 ) ( ON ?auto_728124 ?auto_728125 ) ( ON ?auto_728123 ?auto_728124 ) ( ON ?auto_728122 ?auto_728123 ) ( ON ?auto_728121 ?auto_728122 ) ( ON ?auto_728120 ?auto_728121 ) ( ON ?auto_728119 ?auto_728120 ) ( ON ?auto_728118 ?auto_728119 ) ( ON ?auto_728117 ?auto_728118 ) ( CLEAR ?auto_728115 ) ( ON ?auto_728116 ?auto_728117 ) ( CLEAR ?auto_728116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_728115 ?auto_728116 )
      ( MAKE-13PILE ?auto_728115 ?auto_728116 ?auto_728117 ?auto_728118 ?auto_728119 ?auto_728120 ?auto_728121 ?auto_728122 ?auto_728123 ?auto_728124 ?auto_728125 ?auto_728126 ?auto_728127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_728169 - BLOCK
      ?auto_728170 - BLOCK
      ?auto_728171 - BLOCK
      ?auto_728172 - BLOCK
      ?auto_728173 - BLOCK
      ?auto_728174 - BLOCK
      ?auto_728175 - BLOCK
      ?auto_728176 - BLOCK
      ?auto_728177 - BLOCK
      ?auto_728178 - BLOCK
      ?auto_728179 - BLOCK
      ?auto_728180 - BLOCK
      ?auto_728181 - BLOCK
    )
    :vars
    (
      ?auto_728182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728181 ?auto_728182 ) ( not ( = ?auto_728169 ?auto_728170 ) ) ( not ( = ?auto_728169 ?auto_728171 ) ) ( not ( = ?auto_728169 ?auto_728172 ) ) ( not ( = ?auto_728169 ?auto_728173 ) ) ( not ( = ?auto_728169 ?auto_728174 ) ) ( not ( = ?auto_728169 ?auto_728175 ) ) ( not ( = ?auto_728169 ?auto_728176 ) ) ( not ( = ?auto_728169 ?auto_728177 ) ) ( not ( = ?auto_728169 ?auto_728178 ) ) ( not ( = ?auto_728169 ?auto_728179 ) ) ( not ( = ?auto_728169 ?auto_728180 ) ) ( not ( = ?auto_728169 ?auto_728181 ) ) ( not ( = ?auto_728169 ?auto_728182 ) ) ( not ( = ?auto_728170 ?auto_728171 ) ) ( not ( = ?auto_728170 ?auto_728172 ) ) ( not ( = ?auto_728170 ?auto_728173 ) ) ( not ( = ?auto_728170 ?auto_728174 ) ) ( not ( = ?auto_728170 ?auto_728175 ) ) ( not ( = ?auto_728170 ?auto_728176 ) ) ( not ( = ?auto_728170 ?auto_728177 ) ) ( not ( = ?auto_728170 ?auto_728178 ) ) ( not ( = ?auto_728170 ?auto_728179 ) ) ( not ( = ?auto_728170 ?auto_728180 ) ) ( not ( = ?auto_728170 ?auto_728181 ) ) ( not ( = ?auto_728170 ?auto_728182 ) ) ( not ( = ?auto_728171 ?auto_728172 ) ) ( not ( = ?auto_728171 ?auto_728173 ) ) ( not ( = ?auto_728171 ?auto_728174 ) ) ( not ( = ?auto_728171 ?auto_728175 ) ) ( not ( = ?auto_728171 ?auto_728176 ) ) ( not ( = ?auto_728171 ?auto_728177 ) ) ( not ( = ?auto_728171 ?auto_728178 ) ) ( not ( = ?auto_728171 ?auto_728179 ) ) ( not ( = ?auto_728171 ?auto_728180 ) ) ( not ( = ?auto_728171 ?auto_728181 ) ) ( not ( = ?auto_728171 ?auto_728182 ) ) ( not ( = ?auto_728172 ?auto_728173 ) ) ( not ( = ?auto_728172 ?auto_728174 ) ) ( not ( = ?auto_728172 ?auto_728175 ) ) ( not ( = ?auto_728172 ?auto_728176 ) ) ( not ( = ?auto_728172 ?auto_728177 ) ) ( not ( = ?auto_728172 ?auto_728178 ) ) ( not ( = ?auto_728172 ?auto_728179 ) ) ( not ( = ?auto_728172 ?auto_728180 ) ) ( not ( = ?auto_728172 ?auto_728181 ) ) ( not ( = ?auto_728172 ?auto_728182 ) ) ( not ( = ?auto_728173 ?auto_728174 ) ) ( not ( = ?auto_728173 ?auto_728175 ) ) ( not ( = ?auto_728173 ?auto_728176 ) ) ( not ( = ?auto_728173 ?auto_728177 ) ) ( not ( = ?auto_728173 ?auto_728178 ) ) ( not ( = ?auto_728173 ?auto_728179 ) ) ( not ( = ?auto_728173 ?auto_728180 ) ) ( not ( = ?auto_728173 ?auto_728181 ) ) ( not ( = ?auto_728173 ?auto_728182 ) ) ( not ( = ?auto_728174 ?auto_728175 ) ) ( not ( = ?auto_728174 ?auto_728176 ) ) ( not ( = ?auto_728174 ?auto_728177 ) ) ( not ( = ?auto_728174 ?auto_728178 ) ) ( not ( = ?auto_728174 ?auto_728179 ) ) ( not ( = ?auto_728174 ?auto_728180 ) ) ( not ( = ?auto_728174 ?auto_728181 ) ) ( not ( = ?auto_728174 ?auto_728182 ) ) ( not ( = ?auto_728175 ?auto_728176 ) ) ( not ( = ?auto_728175 ?auto_728177 ) ) ( not ( = ?auto_728175 ?auto_728178 ) ) ( not ( = ?auto_728175 ?auto_728179 ) ) ( not ( = ?auto_728175 ?auto_728180 ) ) ( not ( = ?auto_728175 ?auto_728181 ) ) ( not ( = ?auto_728175 ?auto_728182 ) ) ( not ( = ?auto_728176 ?auto_728177 ) ) ( not ( = ?auto_728176 ?auto_728178 ) ) ( not ( = ?auto_728176 ?auto_728179 ) ) ( not ( = ?auto_728176 ?auto_728180 ) ) ( not ( = ?auto_728176 ?auto_728181 ) ) ( not ( = ?auto_728176 ?auto_728182 ) ) ( not ( = ?auto_728177 ?auto_728178 ) ) ( not ( = ?auto_728177 ?auto_728179 ) ) ( not ( = ?auto_728177 ?auto_728180 ) ) ( not ( = ?auto_728177 ?auto_728181 ) ) ( not ( = ?auto_728177 ?auto_728182 ) ) ( not ( = ?auto_728178 ?auto_728179 ) ) ( not ( = ?auto_728178 ?auto_728180 ) ) ( not ( = ?auto_728178 ?auto_728181 ) ) ( not ( = ?auto_728178 ?auto_728182 ) ) ( not ( = ?auto_728179 ?auto_728180 ) ) ( not ( = ?auto_728179 ?auto_728181 ) ) ( not ( = ?auto_728179 ?auto_728182 ) ) ( not ( = ?auto_728180 ?auto_728181 ) ) ( not ( = ?auto_728180 ?auto_728182 ) ) ( not ( = ?auto_728181 ?auto_728182 ) ) ( ON ?auto_728180 ?auto_728181 ) ( ON ?auto_728179 ?auto_728180 ) ( ON ?auto_728178 ?auto_728179 ) ( ON ?auto_728177 ?auto_728178 ) ( ON ?auto_728176 ?auto_728177 ) ( ON ?auto_728175 ?auto_728176 ) ( ON ?auto_728174 ?auto_728175 ) ( ON ?auto_728173 ?auto_728174 ) ( ON ?auto_728172 ?auto_728173 ) ( ON ?auto_728171 ?auto_728172 ) ( ON ?auto_728170 ?auto_728171 ) ( ON ?auto_728169 ?auto_728170 ) ( CLEAR ?auto_728169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_728169 )
      ( MAKE-13PILE ?auto_728169 ?auto_728170 ?auto_728171 ?auto_728172 ?auto_728173 ?auto_728174 ?auto_728175 ?auto_728176 ?auto_728177 ?auto_728178 ?auto_728179 ?auto_728180 ?auto_728181 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728224 - BLOCK
      ?auto_728225 - BLOCK
      ?auto_728226 - BLOCK
      ?auto_728227 - BLOCK
      ?auto_728228 - BLOCK
      ?auto_728229 - BLOCK
      ?auto_728230 - BLOCK
      ?auto_728231 - BLOCK
      ?auto_728232 - BLOCK
      ?auto_728233 - BLOCK
      ?auto_728234 - BLOCK
      ?auto_728235 - BLOCK
      ?auto_728236 - BLOCK
      ?auto_728237 - BLOCK
    )
    :vars
    (
      ?auto_728238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_728236 ) ( ON ?auto_728237 ?auto_728238 ) ( CLEAR ?auto_728237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_728224 ) ( ON ?auto_728225 ?auto_728224 ) ( ON ?auto_728226 ?auto_728225 ) ( ON ?auto_728227 ?auto_728226 ) ( ON ?auto_728228 ?auto_728227 ) ( ON ?auto_728229 ?auto_728228 ) ( ON ?auto_728230 ?auto_728229 ) ( ON ?auto_728231 ?auto_728230 ) ( ON ?auto_728232 ?auto_728231 ) ( ON ?auto_728233 ?auto_728232 ) ( ON ?auto_728234 ?auto_728233 ) ( ON ?auto_728235 ?auto_728234 ) ( ON ?auto_728236 ?auto_728235 ) ( not ( = ?auto_728224 ?auto_728225 ) ) ( not ( = ?auto_728224 ?auto_728226 ) ) ( not ( = ?auto_728224 ?auto_728227 ) ) ( not ( = ?auto_728224 ?auto_728228 ) ) ( not ( = ?auto_728224 ?auto_728229 ) ) ( not ( = ?auto_728224 ?auto_728230 ) ) ( not ( = ?auto_728224 ?auto_728231 ) ) ( not ( = ?auto_728224 ?auto_728232 ) ) ( not ( = ?auto_728224 ?auto_728233 ) ) ( not ( = ?auto_728224 ?auto_728234 ) ) ( not ( = ?auto_728224 ?auto_728235 ) ) ( not ( = ?auto_728224 ?auto_728236 ) ) ( not ( = ?auto_728224 ?auto_728237 ) ) ( not ( = ?auto_728224 ?auto_728238 ) ) ( not ( = ?auto_728225 ?auto_728226 ) ) ( not ( = ?auto_728225 ?auto_728227 ) ) ( not ( = ?auto_728225 ?auto_728228 ) ) ( not ( = ?auto_728225 ?auto_728229 ) ) ( not ( = ?auto_728225 ?auto_728230 ) ) ( not ( = ?auto_728225 ?auto_728231 ) ) ( not ( = ?auto_728225 ?auto_728232 ) ) ( not ( = ?auto_728225 ?auto_728233 ) ) ( not ( = ?auto_728225 ?auto_728234 ) ) ( not ( = ?auto_728225 ?auto_728235 ) ) ( not ( = ?auto_728225 ?auto_728236 ) ) ( not ( = ?auto_728225 ?auto_728237 ) ) ( not ( = ?auto_728225 ?auto_728238 ) ) ( not ( = ?auto_728226 ?auto_728227 ) ) ( not ( = ?auto_728226 ?auto_728228 ) ) ( not ( = ?auto_728226 ?auto_728229 ) ) ( not ( = ?auto_728226 ?auto_728230 ) ) ( not ( = ?auto_728226 ?auto_728231 ) ) ( not ( = ?auto_728226 ?auto_728232 ) ) ( not ( = ?auto_728226 ?auto_728233 ) ) ( not ( = ?auto_728226 ?auto_728234 ) ) ( not ( = ?auto_728226 ?auto_728235 ) ) ( not ( = ?auto_728226 ?auto_728236 ) ) ( not ( = ?auto_728226 ?auto_728237 ) ) ( not ( = ?auto_728226 ?auto_728238 ) ) ( not ( = ?auto_728227 ?auto_728228 ) ) ( not ( = ?auto_728227 ?auto_728229 ) ) ( not ( = ?auto_728227 ?auto_728230 ) ) ( not ( = ?auto_728227 ?auto_728231 ) ) ( not ( = ?auto_728227 ?auto_728232 ) ) ( not ( = ?auto_728227 ?auto_728233 ) ) ( not ( = ?auto_728227 ?auto_728234 ) ) ( not ( = ?auto_728227 ?auto_728235 ) ) ( not ( = ?auto_728227 ?auto_728236 ) ) ( not ( = ?auto_728227 ?auto_728237 ) ) ( not ( = ?auto_728227 ?auto_728238 ) ) ( not ( = ?auto_728228 ?auto_728229 ) ) ( not ( = ?auto_728228 ?auto_728230 ) ) ( not ( = ?auto_728228 ?auto_728231 ) ) ( not ( = ?auto_728228 ?auto_728232 ) ) ( not ( = ?auto_728228 ?auto_728233 ) ) ( not ( = ?auto_728228 ?auto_728234 ) ) ( not ( = ?auto_728228 ?auto_728235 ) ) ( not ( = ?auto_728228 ?auto_728236 ) ) ( not ( = ?auto_728228 ?auto_728237 ) ) ( not ( = ?auto_728228 ?auto_728238 ) ) ( not ( = ?auto_728229 ?auto_728230 ) ) ( not ( = ?auto_728229 ?auto_728231 ) ) ( not ( = ?auto_728229 ?auto_728232 ) ) ( not ( = ?auto_728229 ?auto_728233 ) ) ( not ( = ?auto_728229 ?auto_728234 ) ) ( not ( = ?auto_728229 ?auto_728235 ) ) ( not ( = ?auto_728229 ?auto_728236 ) ) ( not ( = ?auto_728229 ?auto_728237 ) ) ( not ( = ?auto_728229 ?auto_728238 ) ) ( not ( = ?auto_728230 ?auto_728231 ) ) ( not ( = ?auto_728230 ?auto_728232 ) ) ( not ( = ?auto_728230 ?auto_728233 ) ) ( not ( = ?auto_728230 ?auto_728234 ) ) ( not ( = ?auto_728230 ?auto_728235 ) ) ( not ( = ?auto_728230 ?auto_728236 ) ) ( not ( = ?auto_728230 ?auto_728237 ) ) ( not ( = ?auto_728230 ?auto_728238 ) ) ( not ( = ?auto_728231 ?auto_728232 ) ) ( not ( = ?auto_728231 ?auto_728233 ) ) ( not ( = ?auto_728231 ?auto_728234 ) ) ( not ( = ?auto_728231 ?auto_728235 ) ) ( not ( = ?auto_728231 ?auto_728236 ) ) ( not ( = ?auto_728231 ?auto_728237 ) ) ( not ( = ?auto_728231 ?auto_728238 ) ) ( not ( = ?auto_728232 ?auto_728233 ) ) ( not ( = ?auto_728232 ?auto_728234 ) ) ( not ( = ?auto_728232 ?auto_728235 ) ) ( not ( = ?auto_728232 ?auto_728236 ) ) ( not ( = ?auto_728232 ?auto_728237 ) ) ( not ( = ?auto_728232 ?auto_728238 ) ) ( not ( = ?auto_728233 ?auto_728234 ) ) ( not ( = ?auto_728233 ?auto_728235 ) ) ( not ( = ?auto_728233 ?auto_728236 ) ) ( not ( = ?auto_728233 ?auto_728237 ) ) ( not ( = ?auto_728233 ?auto_728238 ) ) ( not ( = ?auto_728234 ?auto_728235 ) ) ( not ( = ?auto_728234 ?auto_728236 ) ) ( not ( = ?auto_728234 ?auto_728237 ) ) ( not ( = ?auto_728234 ?auto_728238 ) ) ( not ( = ?auto_728235 ?auto_728236 ) ) ( not ( = ?auto_728235 ?auto_728237 ) ) ( not ( = ?auto_728235 ?auto_728238 ) ) ( not ( = ?auto_728236 ?auto_728237 ) ) ( not ( = ?auto_728236 ?auto_728238 ) ) ( not ( = ?auto_728237 ?auto_728238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_728237 ?auto_728238 )
      ( !STACK ?auto_728237 ?auto_728236 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728282 - BLOCK
      ?auto_728283 - BLOCK
      ?auto_728284 - BLOCK
      ?auto_728285 - BLOCK
      ?auto_728286 - BLOCK
      ?auto_728287 - BLOCK
      ?auto_728288 - BLOCK
      ?auto_728289 - BLOCK
      ?auto_728290 - BLOCK
      ?auto_728291 - BLOCK
      ?auto_728292 - BLOCK
      ?auto_728293 - BLOCK
      ?auto_728294 - BLOCK
      ?auto_728295 - BLOCK
    )
    :vars
    (
      ?auto_728296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728295 ?auto_728296 ) ( ON-TABLE ?auto_728282 ) ( ON ?auto_728283 ?auto_728282 ) ( ON ?auto_728284 ?auto_728283 ) ( ON ?auto_728285 ?auto_728284 ) ( ON ?auto_728286 ?auto_728285 ) ( ON ?auto_728287 ?auto_728286 ) ( ON ?auto_728288 ?auto_728287 ) ( ON ?auto_728289 ?auto_728288 ) ( ON ?auto_728290 ?auto_728289 ) ( ON ?auto_728291 ?auto_728290 ) ( ON ?auto_728292 ?auto_728291 ) ( ON ?auto_728293 ?auto_728292 ) ( not ( = ?auto_728282 ?auto_728283 ) ) ( not ( = ?auto_728282 ?auto_728284 ) ) ( not ( = ?auto_728282 ?auto_728285 ) ) ( not ( = ?auto_728282 ?auto_728286 ) ) ( not ( = ?auto_728282 ?auto_728287 ) ) ( not ( = ?auto_728282 ?auto_728288 ) ) ( not ( = ?auto_728282 ?auto_728289 ) ) ( not ( = ?auto_728282 ?auto_728290 ) ) ( not ( = ?auto_728282 ?auto_728291 ) ) ( not ( = ?auto_728282 ?auto_728292 ) ) ( not ( = ?auto_728282 ?auto_728293 ) ) ( not ( = ?auto_728282 ?auto_728294 ) ) ( not ( = ?auto_728282 ?auto_728295 ) ) ( not ( = ?auto_728282 ?auto_728296 ) ) ( not ( = ?auto_728283 ?auto_728284 ) ) ( not ( = ?auto_728283 ?auto_728285 ) ) ( not ( = ?auto_728283 ?auto_728286 ) ) ( not ( = ?auto_728283 ?auto_728287 ) ) ( not ( = ?auto_728283 ?auto_728288 ) ) ( not ( = ?auto_728283 ?auto_728289 ) ) ( not ( = ?auto_728283 ?auto_728290 ) ) ( not ( = ?auto_728283 ?auto_728291 ) ) ( not ( = ?auto_728283 ?auto_728292 ) ) ( not ( = ?auto_728283 ?auto_728293 ) ) ( not ( = ?auto_728283 ?auto_728294 ) ) ( not ( = ?auto_728283 ?auto_728295 ) ) ( not ( = ?auto_728283 ?auto_728296 ) ) ( not ( = ?auto_728284 ?auto_728285 ) ) ( not ( = ?auto_728284 ?auto_728286 ) ) ( not ( = ?auto_728284 ?auto_728287 ) ) ( not ( = ?auto_728284 ?auto_728288 ) ) ( not ( = ?auto_728284 ?auto_728289 ) ) ( not ( = ?auto_728284 ?auto_728290 ) ) ( not ( = ?auto_728284 ?auto_728291 ) ) ( not ( = ?auto_728284 ?auto_728292 ) ) ( not ( = ?auto_728284 ?auto_728293 ) ) ( not ( = ?auto_728284 ?auto_728294 ) ) ( not ( = ?auto_728284 ?auto_728295 ) ) ( not ( = ?auto_728284 ?auto_728296 ) ) ( not ( = ?auto_728285 ?auto_728286 ) ) ( not ( = ?auto_728285 ?auto_728287 ) ) ( not ( = ?auto_728285 ?auto_728288 ) ) ( not ( = ?auto_728285 ?auto_728289 ) ) ( not ( = ?auto_728285 ?auto_728290 ) ) ( not ( = ?auto_728285 ?auto_728291 ) ) ( not ( = ?auto_728285 ?auto_728292 ) ) ( not ( = ?auto_728285 ?auto_728293 ) ) ( not ( = ?auto_728285 ?auto_728294 ) ) ( not ( = ?auto_728285 ?auto_728295 ) ) ( not ( = ?auto_728285 ?auto_728296 ) ) ( not ( = ?auto_728286 ?auto_728287 ) ) ( not ( = ?auto_728286 ?auto_728288 ) ) ( not ( = ?auto_728286 ?auto_728289 ) ) ( not ( = ?auto_728286 ?auto_728290 ) ) ( not ( = ?auto_728286 ?auto_728291 ) ) ( not ( = ?auto_728286 ?auto_728292 ) ) ( not ( = ?auto_728286 ?auto_728293 ) ) ( not ( = ?auto_728286 ?auto_728294 ) ) ( not ( = ?auto_728286 ?auto_728295 ) ) ( not ( = ?auto_728286 ?auto_728296 ) ) ( not ( = ?auto_728287 ?auto_728288 ) ) ( not ( = ?auto_728287 ?auto_728289 ) ) ( not ( = ?auto_728287 ?auto_728290 ) ) ( not ( = ?auto_728287 ?auto_728291 ) ) ( not ( = ?auto_728287 ?auto_728292 ) ) ( not ( = ?auto_728287 ?auto_728293 ) ) ( not ( = ?auto_728287 ?auto_728294 ) ) ( not ( = ?auto_728287 ?auto_728295 ) ) ( not ( = ?auto_728287 ?auto_728296 ) ) ( not ( = ?auto_728288 ?auto_728289 ) ) ( not ( = ?auto_728288 ?auto_728290 ) ) ( not ( = ?auto_728288 ?auto_728291 ) ) ( not ( = ?auto_728288 ?auto_728292 ) ) ( not ( = ?auto_728288 ?auto_728293 ) ) ( not ( = ?auto_728288 ?auto_728294 ) ) ( not ( = ?auto_728288 ?auto_728295 ) ) ( not ( = ?auto_728288 ?auto_728296 ) ) ( not ( = ?auto_728289 ?auto_728290 ) ) ( not ( = ?auto_728289 ?auto_728291 ) ) ( not ( = ?auto_728289 ?auto_728292 ) ) ( not ( = ?auto_728289 ?auto_728293 ) ) ( not ( = ?auto_728289 ?auto_728294 ) ) ( not ( = ?auto_728289 ?auto_728295 ) ) ( not ( = ?auto_728289 ?auto_728296 ) ) ( not ( = ?auto_728290 ?auto_728291 ) ) ( not ( = ?auto_728290 ?auto_728292 ) ) ( not ( = ?auto_728290 ?auto_728293 ) ) ( not ( = ?auto_728290 ?auto_728294 ) ) ( not ( = ?auto_728290 ?auto_728295 ) ) ( not ( = ?auto_728290 ?auto_728296 ) ) ( not ( = ?auto_728291 ?auto_728292 ) ) ( not ( = ?auto_728291 ?auto_728293 ) ) ( not ( = ?auto_728291 ?auto_728294 ) ) ( not ( = ?auto_728291 ?auto_728295 ) ) ( not ( = ?auto_728291 ?auto_728296 ) ) ( not ( = ?auto_728292 ?auto_728293 ) ) ( not ( = ?auto_728292 ?auto_728294 ) ) ( not ( = ?auto_728292 ?auto_728295 ) ) ( not ( = ?auto_728292 ?auto_728296 ) ) ( not ( = ?auto_728293 ?auto_728294 ) ) ( not ( = ?auto_728293 ?auto_728295 ) ) ( not ( = ?auto_728293 ?auto_728296 ) ) ( not ( = ?auto_728294 ?auto_728295 ) ) ( not ( = ?auto_728294 ?auto_728296 ) ) ( not ( = ?auto_728295 ?auto_728296 ) ) ( CLEAR ?auto_728293 ) ( ON ?auto_728294 ?auto_728295 ) ( CLEAR ?auto_728294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_728282 ?auto_728283 ?auto_728284 ?auto_728285 ?auto_728286 ?auto_728287 ?auto_728288 ?auto_728289 ?auto_728290 ?auto_728291 ?auto_728292 ?auto_728293 ?auto_728294 )
      ( MAKE-14PILE ?auto_728282 ?auto_728283 ?auto_728284 ?auto_728285 ?auto_728286 ?auto_728287 ?auto_728288 ?auto_728289 ?auto_728290 ?auto_728291 ?auto_728292 ?auto_728293 ?auto_728294 ?auto_728295 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728340 - BLOCK
      ?auto_728341 - BLOCK
      ?auto_728342 - BLOCK
      ?auto_728343 - BLOCK
      ?auto_728344 - BLOCK
      ?auto_728345 - BLOCK
      ?auto_728346 - BLOCK
      ?auto_728347 - BLOCK
      ?auto_728348 - BLOCK
      ?auto_728349 - BLOCK
      ?auto_728350 - BLOCK
      ?auto_728351 - BLOCK
      ?auto_728352 - BLOCK
      ?auto_728353 - BLOCK
    )
    :vars
    (
      ?auto_728354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728353 ?auto_728354 ) ( ON-TABLE ?auto_728340 ) ( ON ?auto_728341 ?auto_728340 ) ( ON ?auto_728342 ?auto_728341 ) ( ON ?auto_728343 ?auto_728342 ) ( ON ?auto_728344 ?auto_728343 ) ( ON ?auto_728345 ?auto_728344 ) ( ON ?auto_728346 ?auto_728345 ) ( ON ?auto_728347 ?auto_728346 ) ( ON ?auto_728348 ?auto_728347 ) ( ON ?auto_728349 ?auto_728348 ) ( ON ?auto_728350 ?auto_728349 ) ( not ( = ?auto_728340 ?auto_728341 ) ) ( not ( = ?auto_728340 ?auto_728342 ) ) ( not ( = ?auto_728340 ?auto_728343 ) ) ( not ( = ?auto_728340 ?auto_728344 ) ) ( not ( = ?auto_728340 ?auto_728345 ) ) ( not ( = ?auto_728340 ?auto_728346 ) ) ( not ( = ?auto_728340 ?auto_728347 ) ) ( not ( = ?auto_728340 ?auto_728348 ) ) ( not ( = ?auto_728340 ?auto_728349 ) ) ( not ( = ?auto_728340 ?auto_728350 ) ) ( not ( = ?auto_728340 ?auto_728351 ) ) ( not ( = ?auto_728340 ?auto_728352 ) ) ( not ( = ?auto_728340 ?auto_728353 ) ) ( not ( = ?auto_728340 ?auto_728354 ) ) ( not ( = ?auto_728341 ?auto_728342 ) ) ( not ( = ?auto_728341 ?auto_728343 ) ) ( not ( = ?auto_728341 ?auto_728344 ) ) ( not ( = ?auto_728341 ?auto_728345 ) ) ( not ( = ?auto_728341 ?auto_728346 ) ) ( not ( = ?auto_728341 ?auto_728347 ) ) ( not ( = ?auto_728341 ?auto_728348 ) ) ( not ( = ?auto_728341 ?auto_728349 ) ) ( not ( = ?auto_728341 ?auto_728350 ) ) ( not ( = ?auto_728341 ?auto_728351 ) ) ( not ( = ?auto_728341 ?auto_728352 ) ) ( not ( = ?auto_728341 ?auto_728353 ) ) ( not ( = ?auto_728341 ?auto_728354 ) ) ( not ( = ?auto_728342 ?auto_728343 ) ) ( not ( = ?auto_728342 ?auto_728344 ) ) ( not ( = ?auto_728342 ?auto_728345 ) ) ( not ( = ?auto_728342 ?auto_728346 ) ) ( not ( = ?auto_728342 ?auto_728347 ) ) ( not ( = ?auto_728342 ?auto_728348 ) ) ( not ( = ?auto_728342 ?auto_728349 ) ) ( not ( = ?auto_728342 ?auto_728350 ) ) ( not ( = ?auto_728342 ?auto_728351 ) ) ( not ( = ?auto_728342 ?auto_728352 ) ) ( not ( = ?auto_728342 ?auto_728353 ) ) ( not ( = ?auto_728342 ?auto_728354 ) ) ( not ( = ?auto_728343 ?auto_728344 ) ) ( not ( = ?auto_728343 ?auto_728345 ) ) ( not ( = ?auto_728343 ?auto_728346 ) ) ( not ( = ?auto_728343 ?auto_728347 ) ) ( not ( = ?auto_728343 ?auto_728348 ) ) ( not ( = ?auto_728343 ?auto_728349 ) ) ( not ( = ?auto_728343 ?auto_728350 ) ) ( not ( = ?auto_728343 ?auto_728351 ) ) ( not ( = ?auto_728343 ?auto_728352 ) ) ( not ( = ?auto_728343 ?auto_728353 ) ) ( not ( = ?auto_728343 ?auto_728354 ) ) ( not ( = ?auto_728344 ?auto_728345 ) ) ( not ( = ?auto_728344 ?auto_728346 ) ) ( not ( = ?auto_728344 ?auto_728347 ) ) ( not ( = ?auto_728344 ?auto_728348 ) ) ( not ( = ?auto_728344 ?auto_728349 ) ) ( not ( = ?auto_728344 ?auto_728350 ) ) ( not ( = ?auto_728344 ?auto_728351 ) ) ( not ( = ?auto_728344 ?auto_728352 ) ) ( not ( = ?auto_728344 ?auto_728353 ) ) ( not ( = ?auto_728344 ?auto_728354 ) ) ( not ( = ?auto_728345 ?auto_728346 ) ) ( not ( = ?auto_728345 ?auto_728347 ) ) ( not ( = ?auto_728345 ?auto_728348 ) ) ( not ( = ?auto_728345 ?auto_728349 ) ) ( not ( = ?auto_728345 ?auto_728350 ) ) ( not ( = ?auto_728345 ?auto_728351 ) ) ( not ( = ?auto_728345 ?auto_728352 ) ) ( not ( = ?auto_728345 ?auto_728353 ) ) ( not ( = ?auto_728345 ?auto_728354 ) ) ( not ( = ?auto_728346 ?auto_728347 ) ) ( not ( = ?auto_728346 ?auto_728348 ) ) ( not ( = ?auto_728346 ?auto_728349 ) ) ( not ( = ?auto_728346 ?auto_728350 ) ) ( not ( = ?auto_728346 ?auto_728351 ) ) ( not ( = ?auto_728346 ?auto_728352 ) ) ( not ( = ?auto_728346 ?auto_728353 ) ) ( not ( = ?auto_728346 ?auto_728354 ) ) ( not ( = ?auto_728347 ?auto_728348 ) ) ( not ( = ?auto_728347 ?auto_728349 ) ) ( not ( = ?auto_728347 ?auto_728350 ) ) ( not ( = ?auto_728347 ?auto_728351 ) ) ( not ( = ?auto_728347 ?auto_728352 ) ) ( not ( = ?auto_728347 ?auto_728353 ) ) ( not ( = ?auto_728347 ?auto_728354 ) ) ( not ( = ?auto_728348 ?auto_728349 ) ) ( not ( = ?auto_728348 ?auto_728350 ) ) ( not ( = ?auto_728348 ?auto_728351 ) ) ( not ( = ?auto_728348 ?auto_728352 ) ) ( not ( = ?auto_728348 ?auto_728353 ) ) ( not ( = ?auto_728348 ?auto_728354 ) ) ( not ( = ?auto_728349 ?auto_728350 ) ) ( not ( = ?auto_728349 ?auto_728351 ) ) ( not ( = ?auto_728349 ?auto_728352 ) ) ( not ( = ?auto_728349 ?auto_728353 ) ) ( not ( = ?auto_728349 ?auto_728354 ) ) ( not ( = ?auto_728350 ?auto_728351 ) ) ( not ( = ?auto_728350 ?auto_728352 ) ) ( not ( = ?auto_728350 ?auto_728353 ) ) ( not ( = ?auto_728350 ?auto_728354 ) ) ( not ( = ?auto_728351 ?auto_728352 ) ) ( not ( = ?auto_728351 ?auto_728353 ) ) ( not ( = ?auto_728351 ?auto_728354 ) ) ( not ( = ?auto_728352 ?auto_728353 ) ) ( not ( = ?auto_728352 ?auto_728354 ) ) ( not ( = ?auto_728353 ?auto_728354 ) ) ( ON ?auto_728352 ?auto_728353 ) ( CLEAR ?auto_728350 ) ( ON ?auto_728351 ?auto_728352 ) ( CLEAR ?auto_728351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_728340 ?auto_728341 ?auto_728342 ?auto_728343 ?auto_728344 ?auto_728345 ?auto_728346 ?auto_728347 ?auto_728348 ?auto_728349 ?auto_728350 ?auto_728351 )
      ( MAKE-14PILE ?auto_728340 ?auto_728341 ?auto_728342 ?auto_728343 ?auto_728344 ?auto_728345 ?auto_728346 ?auto_728347 ?auto_728348 ?auto_728349 ?auto_728350 ?auto_728351 ?auto_728352 ?auto_728353 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728398 - BLOCK
      ?auto_728399 - BLOCK
      ?auto_728400 - BLOCK
      ?auto_728401 - BLOCK
      ?auto_728402 - BLOCK
      ?auto_728403 - BLOCK
      ?auto_728404 - BLOCK
      ?auto_728405 - BLOCK
      ?auto_728406 - BLOCK
      ?auto_728407 - BLOCK
      ?auto_728408 - BLOCK
      ?auto_728409 - BLOCK
      ?auto_728410 - BLOCK
      ?auto_728411 - BLOCK
    )
    :vars
    (
      ?auto_728412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728411 ?auto_728412 ) ( ON-TABLE ?auto_728398 ) ( ON ?auto_728399 ?auto_728398 ) ( ON ?auto_728400 ?auto_728399 ) ( ON ?auto_728401 ?auto_728400 ) ( ON ?auto_728402 ?auto_728401 ) ( ON ?auto_728403 ?auto_728402 ) ( ON ?auto_728404 ?auto_728403 ) ( ON ?auto_728405 ?auto_728404 ) ( ON ?auto_728406 ?auto_728405 ) ( ON ?auto_728407 ?auto_728406 ) ( not ( = ?auto_728398 ?auto_728399 ) ) ( not ( = ?auto_728398 ?auto_728400 ) ) ( not ( = ?auto_728398 ?auto_728401 ) ) ( not ( = ?auto_728398 ?auto_728402 ) ) ( not ( = ?auto_728398 ?auto_728403 ) ) ( not ( = ?auto_728398 ?auto_728404 ) ) ( not ( = ?auto_728398 ?auto_728405 ) ) ( not ( = ?auto_728398 ?auto_728406 ) ) ( not ( = ?auto_728398 ?auto_728407 ) ) ( not ( = ?auto_728398 ?auto_728408 ) ) ( not ( = ?auto_728398 ?auto_728409 ) ) ( not ( = ?auto_728398 ?auto_728410 ) ) ( not ( = ?auto_728398 ?auto_728411 ) ) ( not ( = ?auto_728398 ?auto_728412 ) ) ( not ( = ?auto_728399 ?auto_728400 ) ) ( not ( = ?auto_728399 ?auto_728401 ) ) ( not ( = ?auto_728399 ?auto_728402 ) ) ( not ( = ?auto_728399 ?auto_728403 ) ) ( not ( = ?auto_728399 ?auto_728404 ) ) ( not ( = ?auto_728399 ?auto_728405 ) ) ( not ( = ?auto_728399 ?auto_728406 ) ) ( not ( = ?auto_728399 ?auto_728407 ) ) ( not ( = ?auto_728399 ?auto_728408 ) ) ( not ( = ?auto_728399 ?auto_728409 ) ) ( not ( = ?auto_728399 ?auto_728410 ) ) ( not ( = ?auto_728399 ?auto_728411 ) ) ( not ( = ?auto_728399 ?auto_728412 ) ) ( not ( = ?auto_728400 ?auto_728401 ) ) ( not ( = ?auto_728400 ?auto_728402 ) ) ( not ( = ?auto_728400 ?auto_728403 ) ) ( not ( = ?auto_728400 ?auto_728404 ) ) ( not ( = ?auto_728400 ?auto_728405 ) ) ( not ( = ?auto_728400 ?auto_728406 ) ) ( not ( = ?auto_728400 ?auto_728407 ) ) ( not ( = ?auto_728400 ?auto_728408 ) ) ( not ( = ?auto_728400 ?auto_728409 ) ) ( not ( = ?auto_728400 ?auto_728410 ) ) ( not ( = ?auto_728400 ?auto_728411 ) ) ( not ( = ?auto_728400 ?auto_728412 ) ) ( not ( = ?auto_728401 ?auto_728402 ) ) ( not ( = ?auto_728401 ?auto_728403 ) ) ( not ( = ?auto_728401 ?auto_728404 ) ) ( not ( = ?auto_728401 ?auto_728405 ) ) ( not ( = ?auto_728401 ?auto_728406 ) ) ( not ( = ?auto_728401 ?auto_728407 ) ) ( not ( = ?auto_728401 ?auto_728408 ) ) ( not ( = ?auto_728401 ?auto_728409 ) ) ( not ( = ?auto_728401 ?auto_728410 ) ) ( not ( = ?auto_728401 ?auto_728411 ) ) ( not ( = ?auto_728401 ?auto_728412 ) ) ( not ( = ?auto_728402 ?auto_728403 ) ) ( not ( = ?auto_728402 ?auto_728404 ) ) ( not ( = ?auto_728402 ?auto_728405 ) ) ( not ( = ?auto_728402 ?auto_728406 ) ) ( not ( = ?auto_728402 ?auto_728407 ) ) ( not ( = ?auto_728402 ?auto_728408 ) ) ( not ( = ?auto_728402 ?auto_728409 ) ) ( not ( = ?auto_728402 ?auto_728410 ) ) ( not ( = ?auto_728402 ?auto_728411 ) ) ( not ( = ?auto_728402 ?auto_728412 ) ) ( not ( = ?auto_728403 ?auto_728404 ) ) ( not ( = ?auto_728403 ?auto_728405 ) ) ( not ( = ?auto_728403 ?auto_728406 ) ) ( not ( = ?auto_728403 ?auto_728407 ) ) ( not ( = ?auto_728403 ?auto_728408 ) ) ( not ( = ?auto_728403 ?auto_728409 ) ) ( not ( = ?auto_728403 ?auto_728410 ) ) ( not ( = ?auto_728403 ?auto_728411 ) ) ( not ( = ?auto_728403 ?auto_728412 ) ) ( not ( = ?auto_728404 ?auto_728405 ) ) ( not ( = ?auto_728404 ?auto_728406 ) ) ( not ( = ?auto_728404 ?auto_728407 ) ) ( not ( = ?auto_728404 ?auto_728408 ) ) ( not ( = ?auto_728404 ?auto_728409 ) ) ( not ( = ?auto_728404 ?auto_728410 ) ) ( not ( = ?auto_728404 ?auto_728411 ) ) ( not ( = ?auto_728404 ?auto_728412 ) ) ( not ( = ?auto_728405 ?auto_728406 ) ) ( not ( = ?auto_728405 ?auto_728407 ) ) ( not ( = ?auto_728405 ?auto_728408 ) ) ( not ( = ?auto_728405 ?auto_728409 ) ) ( not ( = ?auto_728405 ?auto_728410 ) ) ( not ( = ?auto_728405 ?auto_728411 ) ) ( not ( = ?auto_728405 ?auto_728412 ) ) ( not ( = ?auto_728406 ?auto_728407 ) ) ( not ( = ?auto_728406 ?auto_728408 ) ) ( not ( = ?auto_728406 ?auto_728409 ) ) ( not ( = ?auto_728406 ?auto_728410 ) ) ( not ( = ?auto_728406 ?auto_728411 ) ) ( not ( = ?auto_728406 ?auto_728412 ) ) ( not ( = ?auto_728407 ?auto_728408 ) ) ( not ( = ?auto_728407 ?auto_728409 ) ) ( not ( = ?auto_728407 ?auto_728410 ) ) ( not ( = ?auto_728407 ?auto_728411 ) ) ( not ( = ?auto_728407 ?auto_728412 ) ) ( not ( = ?auto_728408 ?auto_728409 ) ) ( not ( = ?auto_728408 ?auto_728410 ) ) ( not ( = ?auto_728408 ?auto_728411 ) ) ( not ( = ?auto_728408 ?auto_728412 ) ) ( not ( = ?auto_728409 ?auto_728410 ) ) ( not ( = ?auto_728409 ?auto_728411 ) ) ( not ( = ?auto_728409 ?auto_728412 ) ) ( not ( = ?auto_728410 ?auto_728411 ) ) ( not ( = ?auto_728410 ?auto_728412 ) ) ( not ( = ?auto_728411 ?auto_728412 ) ) ( ON ?auto_728410 ?auto_728411 ) ( ON ?auto_728409 ?auto_728410 ) ( CLEAR ?auto_728407 ) ( ON ?auto_728408 ?auto_728409 ) ( CLEAR ?auto_728408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_728398 ?auto_728399 ?auto_728400 ?auto_728401 ?auto_728402 ?auto_728403 ?auto_728404 ?auto_728405 ?auto_728406 ?auto_728407 ?auto_728408 )
      ( MAKE-14PILE ?auto_728398 ?auto_728399 ?auto_728400 ?auto_728401 ?auto_728402 ?auto_728403 ?auto_728404 ?auto_728405 ?auto_728406 ?auto_728407 ?auto_728408 ?auto_728409 ?auto_728410 ?auto_728411 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728456 - BLOCK
      ?auto_728457 - BLOCK
      ?auto_728458 - BLOCK
      ?auto_728459 - BLOCK
      ?auto_728460 - BLOCK
      ?auto_728461 - BLOCK
      ?auto_728462 - BLOCK
      ?auto_728463 - BLOCK
      ?auto_728464 - BLOCK
      ?auto_728465 - BLOCK
      ?auto_728466 - BLOCK
      ?auto_728467 - BLOCK
      ?auto_728468 - BLOCK
      ?auto_728469 - BLOCK
    )
    :vars
    (
      ?auto_728470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728469 ?auto_728470 ) ( ON-TABLE ?auto_728456 ) ( ON ?auto_728457 ?auto_728456 ) ( ON ?auto_728458 ?auto_728457 ) ( ON ?auto_728459 ?auto_728458 ) ( ON ?auto_728460 ?auto_728459 ) ( ON ?auto_728461 ?auto_728460 ) ( ON ?auto_728462 ?auto_728461 ) ( ON ?auto_728463 ?auto_728462 ) ( ON ?auto_728464 ?auto_728463 ) ( not ( = ?auto_728456 ?auto_728457 ) ) ( not ( = ?auto_728456 ?auto_728458 ) ) ( not ( = ?auto_728456 ?auto_728459 ) ) ( not ( = ?auto_728456 ?auto_728460 ) ) ( not ( = ?auto_728456 ?auto_728461 ) ) ( not ( = ?auto_728456 ?auto_728462 ) ) ( not ( = ?auto_728456 ?auto_728463 ) ) ( not ( = ?auto_728456 ?auto_728464 ) ) ( not ( = ?auto_728456 ?auto_728465 ) ) ( not ( = ?auto_728456 ?auto_728466 ) ) ( not ( = ?auto_728456 ?auto_728467 ) ) ( not ( = ?auto_728456 ?auto_728468 ) ) ( not ( = ?auto_728456 ?auto_728469 ) ) ( not ( = ?auto_728456 ?auto_728470 ) ) ( not ( = ?auto_728457 ?auto_728458 ) ) ( not ( = ?auto_728457 ?auto_728459 ) ) ( not ( = ?auto_728457 ?auto_728460 ) ) ( not ( = ?auto_728457 ?auto_728461 ) ) ( not ( = ?auto_728457 ?auto_728462 ) ) ( not ( = ?auto_728457 ?auto_728463 ) ) ( not ( = ?auto_728457 ?auto_728464 ) ) ( not ( = ?auto_728457 ?auto_728465 ) ) ( not ( = ?auto_728457 ?auto_728466 ) ) ( not ( = ?auto_728457 ?auto_728467 ) ) ( not ( = ?auto_728457 ?auto_728468 ) ) ( not ( = ?auto_728457 ?auto_728469 ) ) ( not ( = ?auto_728457 ?auto_728470 ) ) ( not ( = ?auto_728458 ?auto_728459 ) ) ( not ( = ?auto_728458 ?auto_728460 ) ) ( not ( = ?auto_728458 ?auto_728461 ) ) ( not ( = ?auto_728458 ?auto_728462 ) ) ( not ( = ?auto_728458 ?auto_728463 ) ) ( not ( = ?auto_728458 ?auto_728464 ) ) ( not ( = ?auto_728458 ?auto_728465 ) ) ( not ( = ?auto_728458 ?auto_728466 ) ) ( not ( = ?auto_728458 ?auto_728467 ) ) ( not ( = ?auto_728458 ?auto_728468 ) ) ( not ( = ?auto_728458 ?auto_728469 ) ) ( not ( = ?auto_728458 ?auto_728470 ) ) ( not ( = ?auto_728459 ?auto_728460 ) ) ( not ( = ?auto_728459 ?auto_728461 ) ) ( not ( = ?auto_728459 ?auto_728462 ) ) ( not ( = ?auto_728459 ?auto_728463 ) ) ( not ( = ?auto_728459 ?auto_728464 ) ) ( not ( = ?auto_728459 ?auto_728465 ) ) ( not ( = ?auto_728459 ?auto_728466 ) ) ( not ( = ?auto_728459 ?auto_728467 ) ) ( not ( = ?auto_728459 ?auto_728468 ) ) ( not ( = ?auto_728459 ?auto_728469 ) ) ( not ( = ?auto_728459 ?auto_728470 ) ) ( not ( = ?auto_728460 ?auto_728461 ) ) ( not ( = ?auto_728460 ?auto_728462 ) ) ( not ( = ?auto_728460 ?auto_728463 ) ) ( not ( = ?auto_728460 ?auto_728464 ) ) ( not ( = ?auto_728460 ?auto_728465 ) ) ( not ( = ?auto_728460 ?auto_728466 ) ) ( not ( = ?auto_728460 ?auto_728467 ) ) ( not ( = ?auto_728460 ?auto_728468 ) ) ( not ( = ?auto_728460 ?auto_728469 ) ) ( not ( = ?auto_728460 ?auto_728470 ) ) ( not ( = ?auto_728461 ?auto_728462 ) ) ( not ( = ?auto_728461 ?auto_728463 ) ) ( not ( = ?auto_728461 ?auto_728464 ) ) ( not ( = ?auto_728461 ?auto_728465 ) ) ( not ( = ?auto_728461 ?auto_728466 ) ) ( not ( = ?auto_728461 ?auto_728467 ) ) ( not ( = ?auto_728461 ?auto_728468 ) ) ( not ( = ?auto_728461 ?auto_728469 ) ) ( not ( = ?auto_728461 ?auto_728470 ) ) ( not ( = ?auto_728462 ?auto_728463 ) ) ( not ( = ?auto_728462 ?auto_728464 ) ) ( not ( = ?auto_728462 ?auto_728465 ) ) ( not ( = ?auto_728462 ?auto_728466 ) ) ( not ( = ?auto_728462 ?auto_728467 ) ) ( not ( = ?auto_728462 ?auto_728468 ) ) ( not ( = ?auto_728462 ?auto_728469 ) ) ( not ( = ?auto_728462 ?auto_728470 ) ) ( not ( = ?auto_728463 ?auto_728464 ) ) ( not ( = ?auto_728463 ?auto_728465 ) ) ( not ( = ?auto_728463 ?auto_728466 ) ) ( not ( = ?auto_728463 ?auto_728467 ) ) ( not ( = ?auto_728463 ?auto_728468 ) ) ( not ( = ?auto_728463 ?auto_728469 ) ) ( not ( = ?auto_728463 ?auto_728470 ) ) ( not ( = ?auto_728464 ?auto_728465 ) ) ( not ( = ?auto_728464 ?auto_728466 ) ) ( not ( = ?auto_728464 ?auto_728467 ) ) ( not ( = ?auto_728464 ?auto_728468 ) ) ( not ( = ?auto_728464 ?auto_728469 ) ) ( not ( = ?auto_728464 ?auto_728470 ) ) ( not ( = ?auto_728465 ?auto_728466 ) ) ( not ( = ?auto_728465 ?auto_728467 ) ) ( not ( = ?auto_728465 ?auto_728468 ) ) ( not ( = ?auto_728465 ?auto_728469 ) ) ( not ( = ?auto_728465 ?auto_728470 ) ) ( not ( = ?auto_728466 ?auto_728467 ) ) ( not ( = ?auto_728466 ?auto_728468 ) ) ( not ( = ?auto_728466 ?auto_728469 ) ) ( not ( = ?auto_728466 ?auto_728470 ) ) ( not ( = ?auto_728467 ?auto_728468 ) ) ( not ( = ?auto_728467 ?auto_728469 ) ) ( not ( = ?auto_728467 ?auto_728470 ) ) ( not ( = ?auto_728468 ?auto_728469 ) ) ( not ( = ?auto_728468 ?auto_728470 ) ) ( not ( = ?auto_728469 ?auto_728470 ) ) ( ON ?auto_728468 ?auto_728469 ) ( ON ?auto_728467 ?auto_728468 ) ( ON ?auto_728466 ?auto_728467 ) ( CLEAR ?auto_728464 ) ( ON ?auto_728465 ?auto_728466 ) ( CLEAR ?auto_728465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_728456 ?auto_728457 ?auto_728458 ?auto_728459 ?auto_728460 ?auto_728461 ?auto_728462 ?auto_728463 ?auto_728464 ?auto_728465 )
      ( MAKE-14PILE ?auto_728456 ?auto_728457 ?auto_728458 ?auto_728459 ?auto_728460 ?auto_728461 ?auto_728462 ?auto_728463 ?auto_728464 ?auto_728465 ?auto_728466 ?auto_728467 ?auto_728468 ?auto_728469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728514 - BLOCK
      ?auto_728515 - BLOCK
      ?auto_728516 - BLOCK
      ?auto_728517 - BLOCK
      ?auto_728518 - BLOCK
      ?auto_728519 - BLOCK
      ?auto_728520 - BLOCK
      ?auto_728521 - BLOCK
      ?auto_728522 - BLOCK
      ?auto_728523 - BLOCK
      ?auto_728524 - BLOCK
      ?auto_728525 - BLOCK
      ?auto_728526 - BLOCK
      ?auto_728527 - BLOCK
    )
    :vars
    (
      ?auto_728528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728527 ?auto_728528 ) ( ON-TABLE ?auto_728514 ) ( ON ?auto_728515 ?auto_728514 ) ( ON ?auto_728516 ?auto_728515 ) ( ON ?auto_728517 ?auto_728516 ) ( ON ?auto_728518 ?auto_728517 ) ( ON ?auto_728519 ?auto_728518 ) ( ON ?auto_728520 ?auto_728519 ) ( ON ?auto_728521 ?auto_728520 ) ( not ( = ?auto_728514 ?auto_728515 ) ) ( not ( = ?auto_728514 ?auto_728516 ) ) ( not ( = ?auto_728514 ?auto_728517 ) ) ( not ( = ?auto_728514 ?auto_728518 ) ) ( not ( = ?auto_728514 ?auto_728519 ) ) ( not ( = ?auto_728514 ?auto_728520 ) ) ( not ( = ?auto_728514 ?auto_728521 ) ) ( not ( = ?auto_728514 ?auto_728522 ) ) ( not ( = ?auto_728514 ?auto_728523 ) ) ( not ( = ?auto_728514 ?auto_728524 ) ) ( not ( = ?auto_728514 ?auto_728525 ) ) ( not ( = ?auto_728514 ?auto_728526 ) ) ( not ( = ?auto_728514 ?auto_728527 ) ) ( not ( = ?auto_728514 ?auto_728528 ) ) ( not ( = ?auto_728515 ?auto_728516 ) ) ( not ( = ?auto_728515 ?auto_728517 ) ) ( not ( = ?auto_728515 ?auto_728518 ) ) ( not ( = ?auto_728515 ?auto_728519 ) ) ( not ( = ?auto_728515 ?auto_728520 ) ) ( not ( = ?auto_728515 ?auto_728521 ) ) ( not ( = ?auto_728515 ?auto_728522 ) ) ( not ( = ?auto_728515 ?auto_728523 ) ) ( not ( = ?auto_728515 ?auto_728524 ) ) ( not ( = ?auto_728515 ?auto_728525 ) ) ( not ( = ?auto_728515 ?auto_728526 ) ) ( not ( = ?auto_728515 ?auto_728527 ) ) ( not ( = ?auto_728515 ?auto_728528 ) ) ( not ( = ?auto_728516 ?auto_728517 ) ) ( not ( = ?auto_728516 ?auto_728518 ) ) ( not ( = ?auto_728516 ?auto_728519 ) ) ( not ( = ?auto_728516 ?auto_728520 ) ) ( not ( = ?auto_728516 ?auto_728521 ) ) ( not ( = ?auto_728516 ?auto_728522 ) ) ( not ( = ?auto_728516 ?auto_728523 ) ) ( not ( = ?auto_728516 ?auto_728524 ) ) ( not ( = ?auto_728516 ?auto_728525 ) ) ( not ( = ?auto_728516 ?auto_728526 ) ) ( not ( = ?auto_728516 ?auto_728527 ) ) ( not ( = ?auto_728516 ?auto_728528 ) ) ( not ( = ?auto_728517 ?auto_728518 ) ) ( not ( = ?auto_728517 ?auto_728519 ) ) ( not ( = ?auto_728517 ?auto_728520 ) ) ( not ( = ?auto_728517 ?auto_728521 ) ) ( not ( = ?auto_728517 ?auto_728522 ) ) ( not ( = ?auto_728517 ?auto_728523 ) ) ( not ( = ?auto_728517 ?auto_728524 ) ) ( not ( = ?auto_728517 ?auto_728525 ) ) ( not ( = ?auto_728517 ?auto_728526 ) ) ( not ( = ?auto_728517 ?auto_728527 ) ) ( not ( = ?auto_728517 ?auto_728528 ) ) ( not ( = ?auto_728518 ?auto_728519 ) ) ( not ( = ?auto_728518 ?auto_728520 ) ) ( not ( = ?auto_728518 ?auto_728521 ) ) ( not ( = ?auto_728518 ?auto_728522 ) ) ( not ( = ?auto_728518 ?auto_728523 ) ) ( not ( = ?auto_728518 ?auto_728524 ) ) ( not ( = ?auto_728518 ?auto_728525 ) ) ( not ( = ?auto_728518 ?auto_728526 ) ) ( not ( = ?auto_728518 ?auto_728527 ) ) ( not ( = ?auto_728518 ?auto_728528 ) ) ( not ( = ?auto_728519 ?auto_728520 ) ) ( not ( = ?auto_728519 ?auto_728521 ) ) ( not ( = ?auto_728519 ?auto_728522 ) ) ( not ( = ?auto_728519 ?auto_728523 ) ) ( not ( = ?auto_728519 ?auto_728524 ) ) ( not ( = ?auto_728519 ?auto_728525 ) ) ( not ( = ?auto_728519 ?auto_728526 ) ) ( not ( = ?auto_728519 ?auto_728527 ) ) ( not ( = ?auto_728519 ?auto_728528 ) ) ( not ( = ?auto_728520 ?auto_728521 ) ) ( not ( = ?auto_728520 ?auto_728522 ) ) ( not ( = ?auto_728520 ?auto_728523 ) ) ( not ( = ?auto_728520 ?auto_728524 ) ) ( not ( = ?auto_728520 ?auto_728525 ) ) ( not ( = ?auto_728520 ?auto_728526 ) ) ( not ( = ?auto_728520 ?auto_728527 ) ) ( not ( = ?auto_728520 ?auto_728528 ) ) ( not ( = ?auto_728521 ?auto_728522 ) ) ( not ( = ?auto_728521 ?auto_728523 ) ) ( not ( = ?auto_728521 ?auto_728524 ) ) ( not ( = ?auto_728521 ?auto_728525 ) ) ( not ( = ?auto_728521 ?auto_728526 ) ) ( not ( = ?auto_728521 ?auto_728527 ) ) ( not ( = ?auto_728521 ?auto_728528 ) ) ( not ( = ?auto_728522 ?auto_728523 ) ) ( not ( = ?auto_728522 ?auto_728524 ) ) ( not ( = ?auto_728522 ?auto_728525 ) ) ( not ( = ?auto_728522 ?auto_728526 ) ) ( not ( = ?auto_728522 ?auto_728527 ) ) ( not ( = ?auto_728522 ?auto_728528 ) ) ( not ( = ?auto_728523 ?auto_728524 ) ) ( not ( = ?auto_728523 ?auto_728525 ) ) ( not ( = ?auto_728523 ?auto_728526 ) ) ( not ( = ?auto_728523 ?auto_728527 ) ) ( not ( = ?auto_728523 ?auto_728528 ) ) ( not ( = ?auto_728524 ?auto_728525 ) ) ( not ( = ?auto_728524 ?auto_728526 ) ) ( not ( = ?auto_728524 ?auto_728527 ) ) ( not ( = ?auto_728524 ?auto_728528 ) ) ( not ( = ?auto_728525 ?auto_728526 ) ) ( not ( = ?auto_728525 ?auto_728527 ) ) ( not ( = ?auto_728525 ?auto_728528 ) ) ( not ( = ?auto_728526 ?auto_728527 ) ) ( not ( = ?auto_728526 ?auto_728528 ) ) ( not ( = ?auto_728527 ?auto_728528 ) ) ( ON ?auto_728526 ?auto_728527 ) ( ON ?auto_728525 ?auto_728526 ) ( ON ?auto_728524 ?auto_728525 ) ( ON ?auto_728523 ?auto_728524 ) ( CLEAR ?auto_728521 ) ( ON ?auto_728522 ?auto_728523 ) ( CLEAR ?auto_728522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_728514 ?auto_728515 ?auto_728516 ?auto_728517 ?auto_728518 ?auto_728519 ?auto_728520 ?auto_728521 ?auto_728522 )
      ( MAKE-14PILE ?auto_728514 ?auto_728515 ?auto_728516 ?auto_728517 ?auto_728518 ?auto_728519 ?auto_728520 ?auto_728521 ?auto_728522 ?auto_728523 ?auto_728524 ?auto_728525 ?auto_728526 ?auto_728527 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728572 - BLOCK
      ?auto_728573 - BLOCK
      ?auto_728574 - BLOCK
      ?auto_728575 - BLOCK
      ?auto_728576 - BLOCK
      ?auto_728577 - BLOCK
      ?auto_728578 - BLOCK
      ?auto_728579 - BLOCK
      ?auto_728580 - BLOCK
      ?auto_728581 - BLOCK
      ?auto_728582 - BLOCK
      ?auto_728583 - BLOCK
      ?auto_728584 - BLOCK
      ?auto_728585 - BLOCK
    )
    :vars
    (
      ?auto_728586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728585 ?auto_728586 ) ( ON-TABLE ?auto_728572 ) ( ON ?auto_728573 ?auto_728572 ) ( ON ?auto_728574 ?auto_728573 ) ( ON ?auto_728575 ?auto_728574 ) ( ON ?auto_728576 ?auto_728575 ) ( ON ?auto_728577 ?auto_728576 ) ( ON ?auto_728578 ?auto_728577 ) ( not ( = ?auto_728572 ?auto_728573 ) ) ( not ( = ?auto_728572 ?auto_728574 ) ) ( not ( = ?auto_728572 ?auto_728575 ) ) ( not ( = ?auto_728572 ?auto_728576 ) ) ( not ( = ?auto_728572 ?auto_728577 ) ) ( not ( = ?auto_728572 ?auto_728578 ) ) ( not ( = ?auto_728572 ?auto_728579 ) ) ( not ( = ?auto_728572 ?auto_728580 ) ) ( not ( = ?auto_728572 ?auto_728581 ) ) ( not ( = ?auto_728572 ?auto_728582 ) ) ( not ( = ?auto_728572 ?auto_728583 ) ) ( not ( = ?auto_728572 ?auto_728584 ) ) ( not ( = ?auto_728572 ?auto_728585 ) ) ( not ( = ?auto_728572 ?auto_728586 ) ) ( not ( = ?auto_728573 ?auto_728574 ) ) ( not ( = ?auto_728573 ?auto_728575 ) ) ( not ( = ?auto_728573 ?auto_728576 ) ) ( not ( = ?auto_728573 ?auto_728577 ) ) ( not ( = ?auto_728573 ?auto_728578 ) ) ( not ( = ?auto_728573 ?auto_728579 ) ) ( not ( = ?auto_728573 ?auto_728580 ) ) ( not ( = ?auto_728573 ?auto_728581 ) ) ( not ( = ?auto_728573 ?auto_728582 ) ) ( not ( = ?auto_728573 ?auto_728583 ) ) ( not ( = ?auto_728573 ?auto_728584 ) ) ( not ( = ?auto_728573 ?auto_728585 ) ) ( not ( = ?auto_728573 ?auto_728586 ) ) ( not ( = ?auto_728574 ?auto_728575 ) ) ( not ( = ?auto_728574 ?auto_728576 ) ) ( not ( = ?auto_728574 ?auto_728577 ) ) ( not ( = ?auto_728574 ?auto_728578 ) ) ( not ( = ?auto_728574 ?auto_728579 ) ) ( not ( = ?auto_728574 ?auto_728580 ) ) ( not ( = ?auto_728574 ?auto_728581 ) ) ( not ( = ?auto_728574 ?auto_728582 ) ) ( not ( = ?auto_728574 ?auto_728583 ) ) ( not ( = ?auto_728574 ?auto_728584 ) ) ( not ( = ?auto_728574 ?auto_728585 ) ) ( not ( = ?auto_728574 ?auto_728586 ) ) ( not ( = ?auto_728575 ?auto_728576 ) ) ( not ( = ?auto_728575 ?auto_728577 ) ) ( not ( = ?auto_728575 ?auto_728578 ) ) ( not ( = ?auto_728575 ?auto_728579 ) ) ( not ( = ?auto_728575 ?auto_728580 ) ) ( not ( = ?auto_728575 ?auto_728581 ) ) ( not ( = ?auto_728575 ?auto_728582 ) ) ( not ( = ?auto_728575 ?auto_728583 ) ) ( not ( = ?auto_728575 ?auto_728584 ) ) ( not ( = ?auto_728575 ?auto_728585 ) ) ( not ( = ?auto_728575 ?auto_728586 ) ) ( not ( = ?auto_728576 ?auto_728577 ) ) ( not ( = ?auto_728576 ?auto_728578 ) ) ( not ( = ?auto_728576 ?auto_728579 ) ) ( not ( = ?auto_728576 ?auto_728580 ) ) ( not ( = ?auto_728576 ?auto_728581 ) ) ( not ( = ?auto_728576 ?auto_728582 ) ) ( not ( = ?auto_728576 ?auto_728583 ) ) ( not ( = ?auto_728576 ?auto_728584 ) ) ( not ( = ?auto_728576 ?auto_728585 ) ) ( not ( = ?auto_728576 ?auto_728586 ) ) ( not ( = ?auto_728577 ?auto_728578 ) ) ( not ( = ?auto_728577 ?auto_728579 ) ) ( not ( = ?auto_728577 ?auto_728580 ) ) ( not ( = ?auto_728577 ?auto_728581 ) ) ( not ( = ?auto_728577 ?auto_728582 ) ) ( not ( = ?auto_728577 ?auto_728583 ) ) ( not ( = ?auto_728577 ?auto_728584 ) ) ( not ( = ?auto_728577 ?auto_728585 ) ) ( not ( = ?auto_728577 ?auto_728586 ) ) ( not ( = ?auto_728578 ?auto_728579 ) ) ( not ( = ?auto_728578 ?auto_728580 ) ) ( not ( = ?auto_728578 ?auto_728581 ) ) ( not ( = ?auto_728578 ?auto_728582 ) ) ( not ( = ?auto_728578 ?auto_728583 ) ) ( not ( = ?auto_728578 ?auto_728584 ) ) ( not ( = ?auto_728578 ?auto_728585 ) ) ( not ( = ?auto_728578 ?auto_728586 ) ) ( not ( = ?auto_728579 ?auto_728580 ) ) ( not ( = ?auto_728579 ?auto_728581 ) ) ( not ( = ?auto_728579 ?auto_728582 ) ) ( not ( = ?auto_728579 ?auto_728583 ) ) ( not ( = ?auto_728579 ?auto_728584 ) ) ( not ( = ?auto_728579 ?auto_728585 ) ) ( not ( = ?auto_728579 ?auto_728586 ) ) ( not ( = ?auto_728580 ?auto_728581 ) ) ( not ( = ?auto_728580 ?auto_728582 ) ) ( not ( = ?auto_728580 ?auto_728583 ) ) ( not ( = ?auto_728580 ?auto_728584 ) ) ( not ( = ?auto_728580 ?auto_728585 ) ) ( not ( = ?auto_728580 ?auto_728586 ) ) ( not ( = ?auto_728581 ?auto_728582 ) ) ( not ( = ?auto_728581 ?auto_728583 ) ) ( not ( = ?auto_728581 ?auto_728584 ) ) ( not ( = ?auto_728581 ?auto_728585 ) ) ( not ( = ?auto_728581 ?auto_728586 ) ) ( not ( = ?auto_728582 ?auto_728583 ) ) ( not ( = ?auto_728582 ?auto_728584 ) ) ( not ( = ?auto_728582 ?auto_728585 ) ) ( not ( = ?auto_728582 ?auto_728586 ) ) ( not ( = ?auto_728583 ?auto_728584 ) ) ( not ( = ?auto_728583 ?auto_728585 ) ) ( not ( = ?auto_728583 ?auto_728586 ) ) ( not ( = ?auto_728584 ?auto_728585 ) ) ( not ( = ?auto_728584 ?auto_728586 ) ) ( not ( = ?auto_728585 ?auto_728586 ) ) ( ON ?auto_728584 ?auto_728585 ) ( ON ?auto_728583 ?auto_728584 ) ( ON ?auto_728582 ?auto_728583 ) ( ON ?auto_728581 ?auto_728582 ) ( ON ?auto_728580 ?auto_728581 ) ( CLEAR ?auto_728578 ) ( ON ?auto_728579 ?auto_728580 ) ( CLEAR ?auto_728579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_728572 ?auto_728573 ?auto_728574 ?auto_728575 ?auto_728576 ?auto_728577 ?auto_728578 ?auto_728579 )
      ( MAKE-14PILE ?auto_728572 ?auto_728573 ?auto_728574 ?auto_728575 ?auto_728576 ?auto_728577 ?auto_728578 ?auto_728579 ?auto_728580 ?auto_728581 ?auto_728582 ?auto_728583 ?auto_728584 ?auto_728585 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728630 - BLOCK
      ?auto_728631 - BLOCK
      ?auto_728632 - BLOCK
      ?auto_728633 - BLOCK
      ?auto_728634 - BLOCK
      ?auto_728635 - BLOCK
      ?auto_728636 - BLOCK
      ?auto_728637 - BLOCK
      ?auto_728638 - BLOCK
      ?auto_728639 - BLOCK
      ?auto_728640 - BLOCK
      ?auto_728641 - BLOCK
      ?auto_728642 - BLOCK
      ?auto_728643 - BLOCK
    )
    :vars
    (
      ?auto_728644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728643 ?auto_728644 ) ( ON-TABLE ?auto_728630 ) ( ON ?auto_728631 ?auto_728630 ) ( ON ?auto_728632 ?auto_728631 ) ( ON ?auto_728633 ?auto_728632 ) ( ON ?auto_728634 ?auto_728633 ) ( ON ?auto_728635 ?auto_728634 ) ( not ( = ?auto_728630 ?auto_728631 ) ) ( not ( = ?auto_728630 ?auto_728632 ) ) ( not ( = ?auto_728630 ?auto_728633 ) ) ( not ( = ?auto_728630 ?auto_728634 ) ) ( not ( = ?auto_728630 ?auto_728635 ) ) ( not ( = ?auto_728630 ?auto_728636 ) ) ( not ( = ?auto_728630 ?auto_728637 ) ) ( not ( = ?auto_728630 ?auto_728638 ) ) ( not ( = ?auto_728630 ?auto_728639 ) ) ( not ( = ?auto_728630 ?auto_728640 ) ) ( not ( = ?auto_728630 ?auto_728641 ) ) ( not ( = ?auto_728630 ?auto_728642 ) ) ( not ( = ?auto_728630 ?auto_728643 ) ) ( not ( = ?auto_728630 ?auto_728644 ) ) ( not ( = ?auto_728631 ?auto_728632 ) ) ( not ( = ?auto_728631 ?auto_728633 ) ) ( not ( = ?auto_728631 ?auto_728634 ) ) ( not ( = ?auto_728631 ?auto_728635 ) ) ( not ( = ?auto_728631 ?auto_728636 ) ) ( not ( = ?auto_728631 ?auto_728637 ) ) ( not ( = ?auto_728631 ?auto_728638 ) ) ( not ( = ?auto_728631 ?auto_728639 ) ) ( not ( = ?auto_728631 ?auto_728640 ) ) ( not ( = ?auto_728631 ?auto_728641 ) ) ( not ( = ?auto_728631 ?auto_728642 ) ) ( not ( = ?auto_728631 ?auto_728643 ) ) ( not ( = ?auto_728631 ?auto_728644 ) ) ( not ( = ?auto_728632 ?auto_728633 ) ) ( not ( = ?auto_728632 ?auto_728634 ) ) ( not ( = ?auto_728632 ?auto_728635 ) ) ( not ( = ?auto_728632 ?auto_728636 ) ) ( not ( = ?auto_728632 ?auto_728637 ) ) ( not ( = ?auto_728632 ?auto_728638 ) ) ( not ( = ?auto_728632 ?auto_728639 ) ) ( not ( = ?auto_728632 ?auto_728640 ) ) ( not ( = ?auto_728632 ?auto_728641 ) ) ( not ( = ?auto_728632 ?auto_728642 ) ) ( not ( = ?auto_728632 ?auto_728643 ) ) ( not ( = ?auto_728632 ?auto_728644 ) ) ( not ( = ?auto_728633 ?auto_728634 ) ) ( not ( = ?auto_728633 ?auto_728635 ) ) ( not ( = ?auto_728633 ?auto_728636 ) ) ( not ( = ?auto_728633 ?auto_728637 ) ) ( not ( = ?auto_728633 ?auto_728638 ) ) ( not ( = ?auto_728633 ?auto_728639 ) ) ( not ( = ?auto_728633 ?auto_728640 ) ) ( not ( = ?auto_728633 ?auto_728641 ) ) ( not ( = ?auto_728633 ?auto_728642 ) ) ( not ( = ?auto_728633 ?auto_728643 ) ) ( not ( = ?auto_728633 ?auto_728644 ) ) ( not ( = ?auto_728634 ?auto_728635 ) ) ( not ( = ?auto_728634 ?auto_728636 ) ) ( not ( = ?auto_728634 ?auto_728637 ) ) ( not ( = ?auto_728634 ?auto_728638 ) ) ( not ( = ?auto_728634 ?auto_728639 ) ) ( not ( = ?auto_728634 ?auto_728640 ) ) ( not ( = ?auto_728634 ?auto_728641 ) ) ( not ( = ?auto_728634 ?auto_728642 ) ) ( not ( = ?auto_728634 ?auto_728643 ) ) ( not ( = ?auto_728634 ?auto_728644 ) ) ( not ( = ?auto_728635 ?auto_728636 ) ) ( not ( = ?auto_728635 ?auto_728637 ) ) ( not ( = ?auto_728635 ?auto_728638 ) ) ( not ( = ?auto_728635 ?auto_728639 ) ) ( not ( = ?auto_728635 ?auto_728640 ) ) ( not ( = ?auto_728635 ?auto_728641 ) ) ( not ( = ?auto_728635 ?auto_728642 ) ) ( not ( = ?auto_728635 ?auto_728643 ) ) ( not ( = ?auto_728635 ?auto_728644 ) ) ( not ( = ?auto_728636 ?auto_728637 ) ) ( not ( = ?auto_728636 ?auto_728638 ) ) ( not ( = ?auto_728636 ?auto_728639 ) ) ( not ( = ?auto_728636 ?auto_728640 ) ) ( not ( = ?auto_728636 ?auto_728641 ) ) ( not ( = ?auto_728636 ?auto_728642 ) ) ( not ( = ?auto_728636 ?auto_728643 ) ) ( not ( = ?auto_728636 ?auto_728644 ) ) ( not ( = ?auto_728637 ?auto_728638 ) ) ( not ( = ?auto_728637 ?auto_728639 ) ) ( not ( = ?auto_728637 ?auto_728640 ) ) ( not ( = ?auto_728637 ?auto_728641 ) ) ( not ( = ?auto_728637 ?auto_728642 ) ) ( not ( = ?auto_728637 ?auto_728643 ) ) ( not ( = ?auto_728637 ?auto_728644 ) ) ( not ( = ?auto_728638 ?auto_728639 ) ) ( not ( = ?auto_728638 ?auto_728640 ) ) ( not ( = ?auto_728638 ?auto_728641 ) ) ( not ( = ?auto_728638 ?auto_728642 ) ) ( not ( = ?auto_728638 ?auto_728643 ) ) ( not ( = ?auto_728638 ?auto_728644 ) ) ( not ( = ?auto_728639 ?auto_728640 ) ) ( not ( = ?auto_728639 ?auto_728641 ) ) ( not ( = ?auto_728639 ?auto_728642 ) ) ( not ( = ?auto_728639 ?auto_728643 ) ) ( not ( = ?auto_728639 ?auto_728644 ) ) ( not ( = ?auto_728640 ?auto_728641 ) ) ( not ( = ?auto_728640 ?auto_728642 ) ) ( not ( = ?auto_728640 ?auto_728643 ) ) ( not ( = ?auto_728640 ?auto_728644 ) ) ( not ( = ?auto_728641 ?auto_728642 ) ) ( not ( = ?auto_728641 ?auto_728643 ) ) ( not ( = ?auto_728641 ?auto_728644 ) ) ( not ( = ?auto_728642 ?auto_728643 ) ) ( not ( = ?auto_728642 ?auto_728644 ) ) ( not ( = ?auto_728643 ?auto_728644 ) ) ( ON ?auto_728642 ?auto_728643 ) ( ON ?auto_728641 ?auto_728642 ) ( ON ?auto_728640 ?auto_728641 ) ( ON ?auto_728639 ?auto_728640 ) ( ON ?auto_728638 ?auto_728639 ) ( ON ?auto_728637 ?auto_728638 ) ( CLEAR ?auto_728635 ) ( ON ?auto_728636 ?auto_728637 ) ( CLEAR ?auto_728636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_728630 ?auto_728631 ?auto_728632 ?auto_728633 ?auto_728634 ?auto_728635 ?auto_728636 )
      ( MAKE-14PILE ?auto_728630 ?auto_728631 ?auto_728632 ?auto_728633 ?auto_728634 ?auto_728635 ?auto_728636 ?auto_728637 ?auto_728638 ?auto_728639 ?auto_728640 ?auto_728641 ?auto_728642 ?auto_728643 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728688 - BLOCK
      ?auto_728689 - BLOCK
      ?auto_728690 - BLOCK
      ?auto_728691 - BLOCK
      ?auto_728692 - BLOCK
      ?auto_728693 - BLOCK
      ?auto_728694 - BLOCK
      ?auto_728695 - BLOCK
      ?auto_728696 - BLOCK
      ?auto_728697 - BLOCK
      ?auto_728698 - BLOCK
      ?auto_728699 - BLOCK
      ?auto_728700 - BLOCK
      ?auto_728701 - BLOCK
    )
    :vars
    (
      ?auto_728702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728701 ?auto_728702 ) ( ON-TABLE ?auto_728688 ) ( ON ?auto_728689 ?auto_728688 ) ( ON ?auto_728690 ?auto_728689 ) ( ON ?auto_728691 ?auto_728690 ) ( ON ?auto_728692 ?auto_728691 ) ( not ( = ?auto_728688 ?auto_728689 ) ) ( not ( = ?auto_728688 ?auto_728690 ) ) ( not ( = ?auto_728688 ?auto_728691 ) ) ( not ( = ?auto_728688 ?auto_728692 ) ) ( not ( = ?auto_728688 ?auto_728693 ) ) ( not ( = ?auto_728688 ?auto_728694 ) ) ( not ( = ?auto_728688 ?auto_728695 ) ) ( not ( = ?auto_728688 ?auto_728696 ) ) ( not ( = ?auto_728688 ?auto_728697 ) ) ( not ( = ?auto_728688 ?auto_728698 ) ) ( not ( = ?auto_728688 ?auto_728699 ) ) ( not ( = ?auto_728688 ?auto_728700 ) ) ( not ( = ?auto_728688 ?auto_728701 ) ) ( not ( = ?auto_728688 ?auto_728702 ) ) ( not ( = ?auto_728689 ?auto_728690 ) ) ( not ( = ?auto_728689 ?auto_728691 ) ) ( not ( = ?auto_728689 ?auto_728692 ) ) ( not ( = ?auto_728689 ?auto_728693 ) ) ( not ( = ?auto_728689 ?auto_728694 ) ) ( not ( = ?auto_728689 ?auto_728695 ) ) ( not ( = ?auto_728689 ?auto_728696 ) ) ( not ( = ?auto_728689 ?auto_728697 ) ) ( not ( = ?auto_728689 ?auto_728698 ) ) ( not ( = ?auto_728689 ?auto_728699 ) ) ( not ( = ?auto_728689 ?auto_728700 ) ) ( not ( = ?auto_728689 ?auto_728701 ) ) ( not ( = ?auto_728689 ?auto_728702 ) ) ( not ( = ?auto_728690 ?auto_728691 ) ) ( not ( = ?auto_728690 ?auto_728692 ) ) ( not ( = ?auto_728690 ?auto_728693 ) ) ( not ( = ?auto_728690 ?auto_728694 ) ) ( not ( = ?auto_728690 ?auto_728695 ) ) ( not ( = ?auto_728690 ?auto_728696 ) ) ( not ( = ?auto_728690 ?auto_728697 ) ) ( not ( = ?auto_728690 ?auto_728698 ) ) ( not ( = ?auto_728690 ?auto_728699 ) ) ( not ( = ?auto_728690 ?auto_728700 ) ) ( not ( = ?auto_728690 ?auto_728701 ) ) ( not ( = ?auto_728690 ?auto_728702 ) ) ( not ( = ?auto_728691 ?auto_728692 ) ) ( not ( = ?auto_728691 ?auto_728693 ) ) ( not ( = ?auto_728691 ?auto_728694 ) ) ( not ( = ?auto_728691 ?auto_728695 ) ) ( not ( = ?auto_728691 ?auto_728696 ) ) ( not ( = ?auto_728691 ?auto_728697 ) ) ( not ( = ?auto_728691 ?auto_728698 ) ) ( not ( = ?auto_728691 ?auto_728699 ) ) ( not ( = ?auto_728691 ?auto_728700 ) ) ( not ( = ?auto_728691 ?auto_728701 ) ) ( not ( = ?auto_728691 ?auto_728702 ) ) ( not ( = ?auto_728692 ?auto_728693 ) ) ( not ( = ?auto_728692 ?auto_728694 ) ) ( not ( = ?auto_728692 ?auto_728695 ) ) ( not ( = ?auto_728692 ?auto_728696 ) ) ( not ( = ?auto_728692 ?auto_728697 ) ) ( not ( = ?auto_728692 ?auto_728698 ) ) ( not ( = ?auto_728692 ?auto_728699 ) ) ( not ( = ?auto_728692 ?auto_728700 ) ) ( not ( = ?auto_728692 ?auto_728701 ) ) ( not ( = ?auto_728692 ?auto_728702 ) ) ( not ( = ?auto_728693 ?auto_728694 ) ) ( not ( = ?auto_728693 ?auto_728695 ) ) ( not ( = ?auto_728693 ?auto_728696 ) ) ( not ( = ?auto_728693 ?auto_728697 ) ) ( not ( = ?auto_728693 ?auto_728698 ) ) ( not ( = ?auto_728693 ?auto_728699 ) ) ( not ( = ?auto_728693 ?auto_728700 ) ) ( not ( = ?auto_728693 ?auto_728701 ) ) ( not ( = ?auto_728693 ?auto_728702 ) ) ( not ( = ?auto_728694 ?auto_728695 ) ) ( not ( = ?auto_728694 ?auto_728696 ) ) ( not ( = ?auto_728694 ?auto_728697 ) ) ( not ( = ?auto_728694 ?auto_728698 ) ) ( not ( = ?auto_728694 ?auto_728699 ) ) ( not ( = ?auto_728694 ?auto_728700 ) ) ( not ( = ?auto_728694 ?auto_728701 ) ) ( not ( = ?auto_728694 ?auto_728702 ) ) ( not ( = ?auto_728695 ?auto_728696 ) ) ( not ( = ?auto_728695 ?auto_728697 ) ) ( not ( = ?auto_728695 ?auto_728698 ) ) ( not ( = ?auto_728695 ?auto_728699 ) ) ( not ( = ?auto_728695 ?auto_728700 ) ) ( not ( = ?auto_728695 ?auto_728701 ) ) ( not ( = ?auto_728695 ?auto_728702 ) ) ( not ( = ?auto_728696 ?auto_728697 ) ) ( not ( = ?auto_728696 ?auto_728698 ) ) ( not ( = ?auto_728696 ?auto_728699 ) ) ( not ( = ?auto_728696 ?auto_728700 ) ) ( not ( = ?auto_728696 ?auto_728701 ) ) ( not ( = ?auto_728696 ?auto_728702 ) ) ( not ( = ?auto_728697 ?auto_728698 ) ) ( not ( = ?auto_728697 ?auto_728699 ) ) ( not ( = ?auto_728697 ?auto_728700 ) ) ( not ( = ?auto_728697 ?auto_728701 ) ) ( not ( = ?auto_728697 ?auto_728702 ) ) ( not ( = ?auto_728698 ?auto_728699 ) ) ( not ( = ?auto_728698 ?auto_728700 ) ) ( not ( = ?auto_728698 ?auto_728701 ) ) ( not ( = ?auto_728698 ?auto_728702 ) ) ( not ( = ?auto_728699 ?auto_728700 ) ) ( not ( = ?auto_728699 ?auto_728701 ) ) ( not ( = ?auto_728699 ?auto_728702 ) ) ( not ( = ?auto_728700 ?auto_728701 ) ) ( not ( = ?auto_728700 ?auto_728702 ) ) ( not ( = ?auto_728701 ?auto_728702 ) ) ( ON ?auto_728700 ?auto_728701 ) ( ON ?auto_728699 ?auto_728700 ) ( ON ?auto_728698 ?auto_728699 ) ( ON ?auto_728697 ?auto_728698 ) ( ON ?auto_728696 ?auto_728697 ) ( ON ?auto_728695 ?auto_728696 ) ( ON ?auto_728694 ?auto_728695 ) ( CLEAR ?auto_728692 ) ( ON ?auto_728693 ?auto_728694 ) ( CLEAR ?auto_728693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_728688 ?auto_728689 ?auto_728690 ?auto_728691 ?auto_728692 ?auto_728693 )
      ( MAKE-14PILE ?auto_728688 ?auto_728689 ?auto_728690 ?auto_728691 ?auto_728692 ?auto_728693 ?auto_728694 ?auto_728695 ?auto_728696 ?auto_728697 ?auto_728698 ?auto_728699 ?auto_728700 ?auto_728701 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728746 - BLOCK
      ?auto_728747 - BLOCK
      ?auto_728748 - BLOCK
      ?auto_728749 - BLOCK
      ?auto_728750 - BLOCK
      ?auto_728751 - BLOCK
      ?auto_728752 - BLOCK
      ?auto_728753 - BLOCK
      ?auto_728754 - BLOCK
      ?auto_728755 - BLOCK
      ?auto_728756 - BLOCK
      ?auto_728757 - BLOCK
      ?auto_728758 - BLOCK
      ?auto_728759 - BLOCK
    )
    :vars
    (
      ?auto_728760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728759 ?auto_728760 ) ( ON-TABLE ?auto_728746 ) ( ON ?auto_728747 ?auto_728746 ) ( ON ?auto_728748 ?auto_728747 ) ( ON ?auto_728749 ?auto_728748 ) ( not ( = ?auto_728746 ?auto_728747 ) ) ( not ( = ?auto_728746 ?auto_728748 ) ) ( not ( = ?auto_728746 ?auto_728749 ) ) ( not ( = ?auto_728746 ?auto_728750 ) ) ( not ( = ?auto_728746 ?auto_728751 ) ) ( not ( = ?auto_728746 ?auto_728752 ) ) ( not ( = ?auto_728746 ?auto_728753 ) ) ( not ( = ?auto_728746 ?auto_728754 ) ) ( not ( = ?auto_728746 ?auto_728755 ) ) ( not ( = ?auto_728746 ?auto_728756 ) ) ( not ( = ?auto_728746 ?auto_728757 ) ) ( not ( = ?auto_728746 ?auto_728758 ) ) ( not ( = ?auto_728746 ?auto_728759 ) ) ( not ( = ?auto_728746 ?auto_728760 ) ) ( not ( = ?auto_728747 ?auto_728748 ) ) ( not ( = ?auto_728747 ?auto_728749 ) ) ( not ( = ?auto_728747 ?auto_728750 ) ) ( not ( = ?auto_728747 ?auto_728751 ) ) ( not ( = ?auto_728747 ?auto_728752 ) ) ( not ( = ?auto_728747 ?auto_728753 ) ) ( not ( = ?auto_728747 ?auto_728754 ) ) ( not ( = ?auto_728747 ?auto_728755 ) ) ( not ( = ?auto_728747 ?auto_728756 ) ) ( not ( = ?auto_728747 ?auto_728757 ) ) ( not ( = ?auto_728747 ?auto_728758 ) ) ( not ( = ?auto_728747 ?auto_728759 ) ) ( not ( = ?auto_728747 ?auto_728760 ) ) ( not ( = ?auto_728748 ?auto_728749 ) ) ( not ( = ?auto_728748 ?auto_728750 ) ) ( not ( = ?auto_728748 ?auto_728751 ) ) ( not ( = ?auto_728748 ?auto_728752 ) ) ( not ( = ?auto_728748 ?auto_728753 ) ) ( not ( = ?auto_728748 ?auto_728754 ) ) ( not ( = ?auto_728748 ?auto_728755 ) ) ( not ( = ?auto_728748 ?auto_728756 ) ) ( not ( = ?auto_728748 ?auto_728757 ) ) ( not ( = ?auto_728748 ?auto_728758 ) ) ( not ( = ?auto_728748 ?auto_728759 ) ) ( not ( = ?auto_728748 ?auto_728760 ) ) ( not ( = ?auto_728749 ?auto_728750 ) ) ( not ( = ?auto_728749 ?auto_728751 ) ) ( not ( = ?auto_728749 ?auto_728752 ) ) ( not ( = ?auto_728749 ?auto_728753 ) ) ( not ( = ?auto_728749 ?auto_728754 ) ) ( not ( = ?auto_728749 ?auto_728755 ) ) ( not ( = ?auto_728749 ?auto_728756 ) ) ( not ( = ?auto_728749 ?auto_728757 ) ) ( not ( = ?auto_728749 ?auto_728758 ) ) ( not ( = ?auto_728749 ?auto_728759 ) ) ( not ( = ?auto_728749 ?auto_728760 ) ) ( not ( = ?auto_728750 ?auto_728751 ) ) ( not ( = ?auto_728750 ?auto_728752 ) ) ( not ( = ?auto_728750 ?auto_728753 ) ) ( not ( = ?auto_728750 ?auto_728754 ) ) ( not ( = ?auto_728750 ?auto_728755 ) ) ( not ( = ?auto_728750 ?auto_728756 ) ) ( not ( = ?auto_728750 ?auto_728757 ) ) ( not ( = ?auto_728750 ?auto_728758 ) ) ( not ( = ?auto_728750 ?auto_728759 ) ) ( not ( = ?auto_728750 ?auto_728760 ) ) ( not ( = ?auto_728751 ?auto_728752 ) ) ( not ( = ?auto_728751 ?auto_728753 ) ) ( not ( = ?auto_728751 ?auto_728754 ) ) ( not ( = ?auto_728751 ?auto_728755 ) ) ( not ( = ?auto_728751 ?auto_728756 ) ) ( not ( = ?auto_728751 ?auto_728757 ) ) ( not ( = ?auto_728751 ?auto_728758 ) ) ( not ( = ?auto_728751 ?auto_728759 ) ) ( not ( = ?auto_728751 ?auto_728760 ) ) ( not ( = ?auto_728752 ?auto_728753 ) ) ( not ( = ?auto_728752 ?auto_728754 ) ) ( not ( = ?auto_728752 ?auto_728755 ) ) ( not ( = ?auto_728752 ?auto_728756 ) ) ( not ( = ?auto_728752 ?auto_728757 ) ) ( not ( = ?auto_728752 ?auto_728758 ) ) ( not ( = ?auto_728752 ?auto_728759 ) ) ( not ( = ?auto_728752 ?auto_728760 ) ) ( not ( = ?auto_728753 ?auto_728754 ) ) ( not ( = ?auto_728753 ?auto_728755 ) ) ( not ( = ?auto_728753 ?auto_728756 ) ) ( not ( = ?auto_728753 ?auto_728757 ) ) ( not ( = ?auto_728753 ?auto_728758 ) ) ( not ( = ?auto_728753 ?auto_728759 ) ) ( not ( = ?auto_728753 ?auto_728760 ) ) ( not ( = ?auto_728754 ?auto_728755 ) ) ( not ( = ?auto_728754 ?auto_728756 ) ) ( not ( = ?auto_728754 ?auto_728757 ) ) ( not ( = ?auto_728754 ?auto_728758 ) ) ( not ( = ?auto_728754 ?auto_728759 ) ) ( not ( = ?auto_728754 ?auto_728760 ) ) ( not ( = ?auto_728755 ?auto_728756 ) ) ( not ( = ?auto_728755 ?auto_728757 ) ) ( not ( = ?auto_728755 ?auto_728758 ) ) ( not ( = ?auto_728755 ?auto_728759 ) ) ( not ( = ?auto_728755 ?auto_728760 ) ) ( not ( = ?auto_728756 ?auto_728757 ) ) ( not ( = ?auto_728756 ?auto_728758 ) ) ( not ( = ?auto_728756 ?auto_728759 ) ) ( not ( = ?auto_728756 ?auto_728760 ) ) ( not ( = ?auto_728757 ?auto_728758 ) ) ( not ( = ?auto_728757 ?auto_728759 ) ) ( not ( = ?auto_728757 ?auto_728760 ) ) ( not ( = ?auto_728758 ?auto_728759 ) ) ( not ( = ?auto_728758 ?auto_728760 ) ) ( not ( = ?auto_728759 ?auto_728760 ) ) ( ON ?auto_728758 ?auto_728759 ) ( ON ?auto_728757 ?auto_728758 ) ( ON ?auto_728756 ?auto_728757 ) ( ON ?auto_728755 ?auto_728756 ) ( ON ?auto_728754 ?auto_728755 ) ( ON ?auto_728753 ?auto_728754 ) ( ON ?auto_728752 ?auto_728753 ) ( ON ?auto_728751 ?auto_728752 ) ( CLEAR ?auto_728749 ) ( ON ?auto_728750 ?auto_728751 ) ( CLEAR ?auto_728750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_728746 ?auto_728747 ?auto_728748 ?auto_728749 ?auto_728750 )
      ( MAKE-14PILE ?auto_728746 ?auto_728747 ?auto_728748 ?auto_728749 ?auto_728750 ?auto_728751 ?auto_728752 ?auto_728753 ?auto_728754 ?auto_728755 ?auto_728756 ?auto_728757 ?auto_728758 ?auto_728759 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728804 - BLOCK
      ?auto_728805 - BLOCK
      ?auto_728806 - BLOCK
      ?auto_728807 - BLOCK
      ?auto_728808 - BLOCK
      ?auto_728809 - BLOCK
      ?auto_728810 - BLOCK
      ?auto_728811 - BLOCK
      ?auto_728812 - BLOCK
      ?auto_728813 - BLOCK
      ?auto_728814 - BLOCK
      ?auto_728815 - BLOCK
      ?auto_728816 - BLOCK
      ?auto_728817 - BLOCK
    )
    :vars
    (
      ?auto_728818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728817 ?auto_728818 ) ( ON-TABLE ?auto_728804 ) ( ON ?auto_728805 ?auto_728804 ) ( ON ?auto_728806 ?auto_728805 ) ( not ( = ?auto_728804 ?auto_728805 ) ) ( not ( = ?auto_728804 ?auto_728806 ) ) ( not ( = ?auto_728804 ?auto_728807 ) ) ( not ( = ?auto_728804 ?auto_728808 ) ) ( not ( = ?auto_728804 ?auto_728809 ) ) ( not ( = ?auto_728804 ?auto_728810 ) ) ( not ( = ?auto_728804 ?auto_728811 ) ) ( not ( = ?auto_728804 ?auto_728812 ) ) ( not ( = ?auto_728804 ?auto_728813 ) ) ( not ( = ?auto_728804 ?auto_728814 ) ) ( not ( = ?auto_728804 ?auto_728815 ) ) ( not ( = ?auto_728804 ?auto_728816 ) ) ( not ( = ?auto_728804 ?auto_728817 ) ) ( not ( = ?auto_728804 ?auto_728818 ) ) ( not ( = ?auto_728805 ?auto_728806 ) ) ( not ( = ?auto_728805 ?auto_728807 ) ) ( not ( = ?auto_728805 ?auto_728808 ) ) ( not ( = ?auto_728805 ?auto_728809 ) ) ( not ( = ?auto_728805 ?auto_728810 ) ) ( not ( = ?auto_728805 ?auto_728811 ) ) ( not ( = ?auto_728805 ?auto_728812 ) ) ( not ( = ?auto_728805 ?auto_728813 ) ) ( not ( = ?auto_728805 ?auto_728814 ) ) ( not ( = ?auto_728805 ?auto_728815 ) ) ( not ( = ?auto_728805 ?auto_728816 ) ) ( not ( = ?auto_728805 ?auto_728817 ) ) ( not ( = ?auto_728805 ?auto_728818 ) ) ( not ( = ?auto_728806 ?auto_728807 ) ) ( not ( = ?auto_728806 ?auto_728808 ) ) ( not ( = ?auto_728806 ?auto_728809 ) ) ( not ( = ?auto_728806 ?auto_728810 ) ) ( not ( = ?auto_728806 ?auto_728811 ) ) ( not ( = ?auto_728806 ?auto_728812 ) ) ( not ( = ?auto_728806 ?auto_728813 ) ) ( not ( = ?auto_728806 ?auto_728814 ) ) ( not ( = ?auto_728806 ?auto_728815 ) ) ( not ( = ?auto_728806 ?auto_728816 ) ) ( not ( = ?auto_728806 ?auto_728817 ) ) ( not ( = ?auto_728806 ?auto_728818 ) ) ( not ( = ?auto_728807 ?auto_728808 ) ) ( not ( = ?auto_728807 ?auto_728809 ) ) ( not ( = ?auto_728807 ?auto_728810 ) ) ( not ( = ?auto_728807 ?auto_728811 ) ) ( not ( = ?auto_728807 ?auto_728812 ) ) ( not ( = ?auto_728807 ?auto_728813 ) ) ( not ( = ?auto_728807 ?auto_728814 ) ) ( not ( = ?auto_728807 ?auto_728815 ) ) ( not ( = ?auto_728807 ?auto_728816 ) ) ( not ( = ?auto_728807 ?auto_728817 ) ) ( not ( = ?auto_728807 ?auto_728818 ) ) ( not ( = ?auto_728808 ?auto_728809 ) ) ( not ( = ?auto_728808 ?auto_728810 ) ) ( not ( = ?auto_728808 ?auto_728811 ) ) ( not ( = ?auto_728808 ?auto_728812 ) ) ( not ( = ?auto_728808 ?auto_728813 ) ) ( not ( = ?auto_728808 ?auto_728814 ) ) ( not ( = ?auto_728808 ?auto_728815 ) ) ( not ( = ?auto_728808 ?auto_728816 ) ) ( not ( = ?auto_728808 ?auto_728817 ) ) ( not ( = ?auto_728808 ?auto_728818 ) ) ( not ( = ?auto_728809 ?auto_728810 ) ) ( not ( = ?auto_728809 ?auto_728811 ) ) ( not ( = ?auto_728809 ?auto_728812 ) ) ( not ( = ?auto_728809 ?auto_728813 ) ) ( not ( = ?auto_728809 ?auto_728814 ) ) ( not ( = ?auto_728809 ?auto_728815 ) ) ( not ( = ?auto_728809 ?auto_728816 ) ) ( not ( = ?auto_728809 ?auto_728817 ) ) ( not ( = ?auto_728809 ?auto_728818 ) ) ( not ( = ?auto_728810 ?auto_728811 ) ) ( not ( = ?auto_728810 ?auto_728812 ) ) ( not ( = ?auto_728810 ?auto_728813 ) ) ( not ( = ?auto_728810 ?auto_728814 ) ) ( not ( = ?auto_728810 ?auto_728815 ) ) ( not ( = ?auto_728810 ?auto_728816 ) ) ( not ( = ?auto_728810 ?auto_728817 ) ) ( not ( = ?auto_728810 ?auto_728818 ) ) ( not ( = ?auto_728811 ?auto_728812 ) ) ( not ( = ?auto_728811 ?auto_728813 ) ) ( not ( = ?auto_728811 ?auto_728814 ) ) ( not ( = ?auto_728811 ?auto_728815 ) ) ( not ( = ?auto_728811 ?auto_728816 ) ) ( not ( = ?auto_728811 ?auto_728817 ) ) ( not ( = ?auto_728811 ?auto_728818 ) ) ( not ( = ?auto_728812 ?auto_728813 ) ) ( not ( = ?auto_728812 ?auto_728814 ) ) ( not ( = ?auto_728812 ?auto_728815 ) ) ( not ( = ?auto_728812 ?auto_728816 ) ) ( not ( = ?auto_728812 ?auto_728817 ) ) ( not ( = ?auto_728812 ?auto_728818 ) ) ( not ( = ?auto_728813 ?auto_728814 ) ) ( not ( = ?auto_728813 ?auto_728815 ) ) ( not ( = ?auto_728813 ?auto_728816 ) ) ( not ( = ?auto_728813 ?auto_728817 ) ) ( not ( = ?auto_728813 ?auto_728818 ) ) ( not ( = ?auto_728814 ?auto_728815 ) ) ( not ( = ?auto_728814 ?auto_728816 ) ) ( not ( = ?auto_728814 ?auto_728817 ) ) ( not ( = ?auto_728814 ?auto_728818 ) ) ( not ( = ?auto_728815 ?auto_728816 ) ) ( not ( = ?auto_728815 ?auto_728817 ) ) ( not ( = ?auto_728815 ?auto_728818 ) ) ( not ( = ?auto_728816 ?auto_728817 ) ) ( not ( = ?auto_728816 ?auto_728818 ) ) ( not ( = ?auto_728817 ?auto_728818 ) ) ( ON ?auto_728816 ?auto_728817 ) ( ON ?auto_728815 ?auto_728816 ) ( ON ?auto_728814 ?auto_728815 ) ( ON ?auto_728813 ?auto_728814 ) ( ON ?auto_728812 ?auto_728813 ) ( ON ?auto_728811 ?auto_728812 ) ( ON ?auto_728810 ?auto_728811 ) ( ON ?auto_728809 ?auto_728810 ) ( ON ?auto_728808 ?auto_728809 ) ( CLEAR ?auto_728806 ) ( ON ?auto_728807 ?auto_728808 ) ( CLEAR ?auto_728807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_728804 ?auto_728805 ?auto_728806 ?auto_728807 )
      ( MAKE-14PILE ?auto_728804 ?auto_728805 ?auto_728806 ?auto_728807 ?auto_728808 ?auto_728809 ?auto_728810 ?auto_728811 ?auto_728812 ?auto_728813 ?auto_728814 ?auto_728815 ?auto_728816 ?auto_728817 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728862 - BLOCK
      ?auto_728863 - BLOCK
      ?auto_728864 - BLOCK
      ?auto_728865 - BLOCK
      ?auto_728866 - BLOCK
      ?auto_728867 - BLOCK
      ?auto_728868 - BLOCK
      ?auto_728869 - BLOCK
      ?auto_728870 - BLOCK
      ?auto_728871 - BLOCK
      ?auto_728872 - BLOCK
      ?auto_728873 - BLOCK
      ?auto_728874 - BLOCK
      ?auto_728875 - BLOCK
    )
    :vars
    (
      ?auto_728876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728875 ?auto_728876 ) ( ON-TABLE ?auto_728862 ) ( ON ?auto_728863 ?auto_728862 ) ( not ( = ?auto_728862 ?auto_728863 ) ) ( not ( = ?auto_728862 ?auto_728864 ) ) ( not ( = ?auto_728862 ?auto_728865 ) ) ( not ( = ?auto_728862 ?auto_728866 ) ) ( not ( = ?auto_728862 ?auto_728867 ) ) ( not ( = ?auto_728862 ?auto_728868 ) ) ( not ( = ?auto_728862 ?auto_728869 ) ) ( not ( = ?auto_728862 ?auto_728870 ) ) ( not ( = ?auto_728862 ?auto_728871 ) ) ( not ( = ?auto_728862 ?auto_728872 ) ) ( not ( = ?auto_728862 ?auto_728873 ) ) ( not ( = ?auto_728862 ?auto_728874 ) ) ( not ( = ?auto_728862 ?auto_728875 ) ) ( not ( = ?auto_728862 ?auto_728876 ) ) ( not ( = ?auto_728863 ?auto_728864 ) ) ( not ( = ?auto_728863 ?auto_728865 ) ) ( not ( = ?auto_728863 ?auto_728866 ) ) ( not ( = ?auto_728863 ?auto_728867 ) ) ( not ( = ?auto_728863 ?auto_728868 ) ) ( not ( = ?auto_728863 ?auto_728869 ) ) ( not ( = ?auto_728863 ?auto_728870 ) ) ( not ( = ?auto_728863 ?auto_728871 ) ) ( not ( = ?auto_728863 ?auto_728872 ) ) ( not ( = ?auto_728863 ?auto_728873 ) ) ( not ( = ?auto_728863 ?auto_728874 ) ) ( not ( = ?auto_728863 ?auto_728875 ) ) ( not ( = ?auto_728863 ?auto_728876 ) ) ( not ( = ?auto_728864 ?auto_728865 ) ) ( not ( = ?auto_728864 ?auto_728866 ) ) ( not ( = ?auto_728864 ?auto_728867 ) ) ( not ( = ?auto_728864 ?auto_728868 ) ) ( not ( = ?auto_728864 ?auto_728869 ) ) ( not ( = ?auto_728864 ?auto_728870 ) ) ( not ( = ?auto_728864 ?auto_728871 ) ) ( not ( = ?auto_728864 ?auto_728872 ) ) ( not ( = ?auto_728864 ?auto_728873 ) ) ( not ( = ?auto_728864 ?auto_728874 ) ) ( not ( = ?auto_728864 ?auto_728875 ) ) ( not ( = ?auto_728864 ?auto_728876 ) ) ( not ( = ?auto_728865 ?auto_728866 ) ) ( not ( = ?auto_728865 ?auto_728867 ) ) ( not ( = ?auto_728865 ?auto_728868 ) ) ( not ( = ?auto_728865 ?auto_728869 ) ) ( not ( = ?auto_728865 ?auto_728870 ) ) ( not ( = ?auto_728865 ?auto_728871 ) ) ( not ( = ?auto_728865 ?auto_728872 ) ) ( not ( = ?auto_728865 ?auto_728873 ) ) ( not ( = ?auto_728865 ?auto_728874 ) ) ( not ( = ?auto_728865 ?auto_728875 ) ) ( not ( = ?auto_728865 ?auto_728876 ) ) ( not ( = ?auto_728866 ?auto_728867 ) ) ( not ( = ?auto_728866 ?auto_728868 ) ) ( not ( = ?auto_728866 ?auto_728869 ) ) ( not ( = ?auto_728866 ?auto_728870 ) ) ( not ( = ?auto_728866 ?auto_728871 ) ) ( not ( = ?auto_728866 ?auto_728872 ) ) ( not ( = ?auto_728866 ?auto_728873 ) ) ( not ( = ?auto_728866 ?auto_728874 ) ) ( not ( = ?auto_728866 ?auto_728875 ) ) ( not ( = ?auto_728866 ?auto_728876 ) ) ( not ( = ?auto_728867 ?auto_728868 ) ) ( not ( = ?auto_728867 ?auto_728869 ) ) ( not ( = ?auto_728867 ?auto_728870 ) ) ( not ( = ?auto_728867 ?auto_728871 ) ) ( not ( = ?auto_728867 ?auto_728872 ) ) ( not ( = ?auto_728867 ?auto_728873 ) ) ( not ( = ?auto_728867 ?auto_728874 ) ) ( not ( = ?auto_728867 ?auto_728875 ) ) ( not ( = ?auto_728867 ?auto_728876 ) ) ( not ( = ?auto_728868 ?auto_728869 ) ) ( not ( = ?auto_728868 ?auto_728870 ) ) ( not ( = ?auto_728868 ?auto_728871 ) ) ( not ( = ?auto_728868 ?auto_728872 ) ) ( not ( = ?auto_728868 ?auto_728873 ) ) ( not ( = ?auto_728868 ?auto_728874 ) ) ( not ( = ?auto_728868 ?auto_728875 ) ) ( not ( = ?auto_728868 ?auto_728876 ) ) ( not ( = ?auto_728869 ?auto_728870 ) ) ( not ( = ?auto_728869 ?auto_728871 ) ) ( not ( = ?auto_728869 ?auto_728872 ) ) ( not ( = ?auto_728869 ?auto_728873 ) ) ( not ( = ?auto_728869 ?auto_728874 ) ) ( not ( = ?auto_728869 ?auto_728875 ) ) ( not ( = ?auto_728869 ?auto_728876 ) ) ( not ( = ?auto_728870 ?auto_728871 ) ) ( not ( = ?auto_728870 ?auto_728872 ) ) ( not ( = ?auto_728870 ?auto_728873 ) ) ( not ( = ?auto_728870 ?auto_728874 ) ) ( not ( = ?auto_728870 ?auto_728875 ) ) ( not ( = ?auto_728870 ?auto_728876 ) ) ( not ( = ?auto_728871 ?auto_728872 ) ) ( not ( = ?auto_728871 ?auto_728873 ) ) ( not ( = ?auto_728871 ?auto_728874 ) ) ( not ( = ?auto_728871 ?auto_728875 ) ) ( not ( = ?auto_728871 ?auto_728876 ) ) ( not ( = ?auto_728872 ?auto_728873 ) ) ( not ( = ?auto_728872 ?auto_728874 ) ) ( not ( = ?auto_728872 ?auto_728875 ) ) ( not ( = ?auto_728872 ?auto_728876 ) ) ( not ( = ?auto_728873 ?auto_728874 ) ) ( not ( = ?auto_728873 ?auto_728875 ) ) ( not ( = ?auto_728873 ?auto_728876 ) ) ( not ( = ?auto_728874 ?auto_728875 ) ) ( not ( = ?auto_728874 ?auto_728876 ) ) ( not ( = ?auto_728875 ?auto_728876 ) ) ( ON ?auto_728874 ?auto_728875 ) ( ON ?auto_728873 ?auto_728874 ) ( ON ?auto_728872 ?auto_728873 ) ( ON ?auto_728871 ?auto_728872 ) ( ON ?auto_728870 ?auto_728871 ) ( ON ?auto_728869 ?auto_728870 ) ( ON ?auto_728868 ?auto_728869 ) ( ON ?auto_728867 ?auto_728868 ) ( ON ?auto_728866 ?auto_728867 ) ( ON ?auto_728865 ?auto_728866 ) ( CLEAR ?auto_728863 ) ( ON ?auto_728864 ?auto_728865 ) ( CLEAR ?auto_728864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_728862 ?auto_728863 ?auto_728864 )
      ( MAKE-14PILE ?auto_728862 ?auto_728863 ?auto_728864 ?auto_728865 ?auto_728866 ?auto_728867 ?auto_728868 ?auto_728869 ?auto_728870 ?auto_728871 ?auto_728872 ?auto_728873 ?auto_728874 ?auto_728875 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728920 - BLOCK
      ?auto_728921 - BLOCK
      ?auto_728922 - BLOCK
      ?auto_728923 - BLOCK
      ?auto_728924 - BLOCK
      ?auto_728925 - BLOCK
      ?auto_728926 - BLOCK
      ?auto_728927 - BLOCK
      ?auto_728928 - BLOCK
      ?auto_728929 - BLOCK
      ?auto_728930 - BLOCK
      ?auto_728931 - BLOCK
      ?auto_728932 - BLOCK
      ?auto_728933 - BLOCK
    )
    :vars
    (
      ?auto_728934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728933 ?auto_728934 ) ( ON-TABLE ?auto_728920 ) ( not ( = ?auto_728920 ?auto_728921 ) ) ( not ( = ?auto_728920 ?auto_728922 ) ) ( not ( = ?auto_728920 ?auto_728923 ) ) ( not ( = ?auto_728920 ?auto_728924 ) ) ( not ( = ?auto_728920 ?auto_728925 ) ) ( not ( = ?auto_728920 ?auto_728926 ) ) ( not ( = ?auto_728920 ?auto_728927 ) ) ( not ( = ?auto_728920 ?auto_728928 ) ) ( not ( = ?auto_728920 ?auto_728929 ) ) ( not ( = ?auto_728920 ?auto_728930 ) ) ( not ( = ?auto_728920 ?auto_728931 ) ) ( not ( = ?auto_728920 ?auto_728932 ) ) ( not ( = ?auto_728920 ?auto_728933 ) ) ( not ( = ?auto_728920 ?auto_728934 ) ) ( not ( = ?auto_728921 ?auto_728922 ) ) ( not ( = ?auto_728921 ?auto_728923 ) ) ( not ( = ?auto_728921 ?auto_728924 ) ) ( not ( = ?auto_728921 ?auto_728925 ) ) ( not ( = ?auto_728921 ?auto_728926 ) ) ( not ( = ?auto_728921 ?auto_728927 ) ) ( not ( = ?auto_728921 ?auto_728928 ) ) ( not ( = ?auto_728921 ?auto_728929 ) ) ( not ( = ?auto_728921 ?auto_728930 ) ) ( not ( = ?auto_728921 ?auto_728931 ) ) ( not ( = ?auto_728921 ?auto_728932 ) ) ( not ( = ?auto_728921 ?auto_728933 ) ) ( not ( = ?auto_728921 ?auto_728934 ) ) ( not ( = ?auto_728922 ?auto_728923 ) ) ( not ( = ?auto_728922 ?auto_728924 ) ) ( not ( = ?auto_728922 ?auto_728925 ) ) ( not ( = ?auto_728922 ?auto_728926 ) ) ( not ( = ?auto_728922 ?auto_728927 ) ) ( not ( = ?auto_728922 ?auto_728928 ) ) ( not ( = ?auto_728922 ?auto_728929 ) ) ( not ( = ?auto_728922 ?auto_728930 ) ) ( not ( = ?auto_728922 ?auto_728931 ) ) ( not ( = ?auto_728922 ?auto_728932 ) ) ( not ( = ?auto_728922 ?auto_728933 ) ) ( not ( = ?auto_728922 ?auto_728934 ) ) ( not ( = ?auto_728923 ?auto_728924 ) ) ( not ( = ?auto_728923 ?auto_728925 ) ) ( not ( = ?auto_728923 ?auto_728926 ) ) ( not ( = ?auto_728923 ?auto_728927 ) ) ( not ( = ?auto_728923 ?auto_728928 ) ) ( not ( = ?auto_728923 ?auto_728929 ) ) ( not ( = ?auto_728923 ?auto_728930 ) ) ( not ( = ?auto_728923 ?auto_728931 ) ) ( not ( = ?auto_728923 ?auto_728932 ) ) ( not ( = ?auto_728923 ?auto_728933 ) ) ( not ( = ?auto_728923 ?auto_728934 ) ) ( not ( = ?auto_728924 ?auto_728925 ) ) ( not ( = ?auto_728924 ?auto_728926 ) ) ( not ( = ?auto_728924 ?auto_728927 ) ) ( not ( = ?auto_728924 ?auto_728928 ) ) ( not ( = ?auto_728924 ?auto_728929 ) ) ( not ( = ?auto_728924 ?auto_728930 ) ) ( not ( = ?auto_728924 ?auto_728931 ) ) ( not ( = ?auto_728924 ?auto_728932 ) ) ( not ( = ?auto_728924 ?auto_728933 ) ) ( not ( = ?auto_728924 ?auto_728934 ) ) ( not ( = ?auto_728925 ?auto_728926 ) ) ( not ( = ?auto_728925 ?auto_728927 ) ) ( not ( = ?auto_728925 ?auto_728928 ) ) ( not ( = ?auto_728925 ?auto_728929 ) ) ( not ( = ?auto_728925 ?auto_728930 ) ) ( not ( = ?auto_728925 ?auto_728931 ) ) ( not ( = ?auto_728925 ?auto_728932 ) ) ( not ( = ?auto_728925 ?auto_728933 ) ) ( not ( = ?auto_728925 ?auto_728934 ) ) ( not ( = ?auto_728926 ?auto_728927 ) ) ( not ( = ?auto_728926 ?auto_728928 ) ) ( not ( = ?auto_728926 ?auto_728929 ) ) ( not ( = ?auto_728926 ?auto_728930 ) ) ( not ( = ?auto_728926 ?auto_728931 ) ) ( not ( = ?auto_728926 ?auto_728932 ) ) ( not ( = ?auto_728926 ?auto_728933 ) ) ( not ( = ?auto_728926 ?auto_728934 ) ) ( not ( = ?auto_728927 ?auto_728928 ) ) ( not ( = ?auto_728927 ?auto_728929 ) ) ( not ( = ?auto_728927 ?auto_728930 ) ) ( not ( = ?auto_728927 ?auto_728931 ) ) ( not ( = ?auto_728927 ?auto_728932 ) ) ( not ( = ?auto_728927 ?auto_728933 ) ) ( not ( = ?auto_728927 ?auto_728934 ) ) ( not ( = ?auto_728928 ?auto_728929 ) ) ( not ( = ?auto_728928 ?auto_728930 ) ) ( not ( = ?auto_728928 ?auto_728931 ) ) ( not ( = ?auto_728928 ?auto_728932 ) ) ( not ( = ?auto_728928 ?auto_728933 ) ) ( not ( = ?auto_728928 ?auto_728934 ) ) ( not ( = ?auto_728929 ?auto_728930 ) ) ( not ( = ?auto_728929 ?auto_728931 ) ) ( not ( = ?auto_728929 ?auto_728932 ) ) ( not ( = ?auto_728929 ?auto_728933 ) ) ( not ( = ?auto_728929 ?auto_728934 ) ) ( not ( = ?auto_728930 ?auto_728931 ) ) ( not ( = ?auto_728930 ?auto_728932 ) ) ( not ( = ?auto_728930 ?auto_728933 ) ) ( not ( = ?auto_728930 ?auto_728934 ) ) ( not ( = ?auto_728931 ?auto_728932 ) ) ( not ( = ?auto_728931 ?auto_728933 ) ) ( not ( = ?auto_728931 ?auto_728934 ) ) ( not ( = ?auto_728932 ?auto_728933 ) ) ( not ( = ?auto_728932 ?auto_728934 ) ) ( not ( = ?auto_728933 ?auto_728934 ) ) ( ON ?auto_728932 ?auto_728933 ) ( ON ?auto_728931 ?auto_728932 ) ( ON ?auto_728930 ?auto_728931 ) ( ON ?auto_728929 ?auto_728930 ) ( ON ?auto_728928 ?auto_728929 ) ( ON ?auto_728927 ?auto_728928 ) ( ON ?auto_728926 ?auto_728927 ) ( ON ?auto_728925 ?auto_728926 ) ( ON ?auto_728924 ?auto_728925 ) ( ON ?auto_728923 ?auto_728924 ) ( ON ?auto_728922 ?auto_728923 ) ( CLEAR ?auto_728920 ) ( ON ?auto_728921 ?auto_728922 ) ( CLEAR ?auto_728921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_728920 ?auto_728921 )
      ( MAKE-14PILE ?auto_728920 ?auto_728921 ?auto_728922 ?auto_728923 ?auto_728924 ?auto_728925 ?auto_728926 ?auto_728927 ?auto_728928 ?auto_728929 ?auto_728930 ?auto_728931 ?auto_728932 ?auto_728933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_728978 - BLOCK
      ?auto_728979 - BLOCK
      ?auto_728980 - BLOCK
      ?auto_728981 - BLOCK
      ?auto_728982 - BLOCK
      ?auto_728983 - BLOCK
      ?auto_728984 - BLOCK
      ?auto_728985 - BLOCK
      ?auto_728986 - BLOCK
      ?auto_728987 - BLOCK
      ?auto_728988 - BLOCK
      ?auto_728989 - BLOCK
      ?auto_728990 - BLOCK
      ?auto_728991 - BLOCK
    )
    :vars
    (
      ?auto_728992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_728991 ?auto_728992 ) ( not ( = ?auto_728978 ?auto_728979 ) ) ( not ( = ?auto_728978 ?auto_728980 ) ) ( not ( = ?auto_728978 ?auto_728981 ) ) ( not ( = ?auto_728978 ?auto_728982 ) ) ( not ( = ?auto_728978 ?auto_728983 ) ) ( not ( = ?auto_728978 ?auto_728984 ) ) ( not ( = ?auto_728978 ?auto_728985 ) ) ( not ( = ?auto_728978 ?auto_728986 ) ) ( not ( = ?auto_728978 ?auto_728987 ) ) ( not ( = ?auto_728978 ?auto_728988 ) ) ( not ( = ?auto_728978 ?auto_728989 ) ) ( not ( = ?auto_728978 ?auto_728990 ) ) ( not ( = ?auto_728978 ?auto_728991 ) ) ( not ( = ?auto_728978 ?auto_728992 ) ) ( not ( = ?auto_728979 ?auto_728980 ) ) ( not ( = ?auto_728979 ?auto_728981 ) ) ( not ( = ?auto_728979 ?auto_728982 ) ) ( not ( = ?auto_728979 ?auto_728983 ) ) ( not ( = ?auto_728979 ?auto_728984 ) ) ( not ( = ?auto_728979 ?auto_728985 ) ) ( not ( = ?auto_728979 ?auto_728986 ) ) ( not ( = ?auto_728979 ?auto_728987 ) ) ( not ( = ?auto_728979 ?auto_728988 ) ) ( not ( = ?auto_728979 ?auto_728989 ) ) ( not ( = ?auto_728979 ?auto_728990 ) ) ( not ( = ?auto_728979 ?auto_728991 ) ) ( not ( = ?auto_728979 ?auto_728992 ) ) ( not ( = ?auto_728980 ?auto_728981 ) ) ( not ( = ?auto_728980 ?auto_728982 ) ) ( not ( = ?auto_728980 ?auto_728983 ) ) ( not ( = ?auto_728980 ?auto_728984 ) ) ( not ( = ?auto_728980 ?auto_728985 ) ) ( not ( = ?auto_728980 ?auto_728986 ) ) ( not ( = ?auto_728980 ?auto_728987 ) ) ( not ( = ?auto_728980 ?auto_728988 ) ) ( not ( = ?auto_728980 ?auto_728989 ) ) ( not ( = ?auto_728980 ?auto_728990 ) ) ( not ( = ?auto_728980 ?auto_728991 ) ) ( not ( = ?auto_728980 ?auto_728992 ) ) ( not ( = ?auto_728981 ?auto_728982 ) ) ( not ( = ?auto_728981 ?auto_728983 ) ) ( not ( = ?auto_728981 ?auto_728984 ) ) ( not ( = ?auto_728981 ?auto_728985 ) ) ( not ( = ?auto_728981 ?auto_728986 ) ) ( not ( = ?auto_728981 ?auto_728987 ) ) ( not ( = ?auto_728981 ?auto_728988 ) ) ( not ( = ?auto_728981 ?auto_728989 ) ) ( not ( = ?auto_728981 ?auto_728990 ) ) ( not ( = ?auto_728981 ?auto_728991 ) ) ( not ( = ?auto_728981 ?auto_728992 ) ) ( not ( = ?auto_728982 ?auto_728983 ) ) ( not ( = ?auto_728982 ?auto_728984 ) ) ( not ( = ?auto_728982 ?auto_728985 ) ) ( not ( = ?auto_728982 ?auto_728986 ) ) ( not ( = ?auto_728982 ?auto_728987 ) ) ( not ( = ?auto_728982 ?auto_728988 ) ) ( not ( = ?auto_728982 ?auto_728989 ) ) ( not ( = ?auto_728982 ?auto_728990 ) ) ( not ( = ?auto_728982 ?auto_728991 ) ) ( not ( = ?auto_728982 ?auto_728992 ) ) ( not ( = ?auto_728983 ?auto_728984 ) ) ( not ( = ?auto_728983 ?auto_728985 ) ) ( not ( = ?auto_728983 ?auto_728986 ) ) ( not ( = ?auto_728983 ?auto_728987 ) ) ( not ( = ?auto_728983 ?auto_728988 ) ) ( not ( = ?auto_728983 ?auto_728989 ) ) ( not ( = ?auto_728983 ?auto_728990 ) ) ( not ( = ?auto_728983 ?auto_728991 ) ) ( not ( = ?auto_728983 ?auto_728992 ) ) ( not ( = ?auto_728984 ?auto_728985 ) ) ( not ( = ?auto_728984 ?auto_728986 ) ) ( not ( = ?auto_728984 ?auto_728987 ) ) ( not ( = ?auto_728984 ?auto_728988 ) ) ( not ( = ?auto_728984 ?auto_728989 ) ) ( not ( = ?auto_728984 ?auto_728990 ) ) ( not ( = ?auto_728984 ?auto_728991 ) ) ( not ( = ?auto_728984 ?auto_728992 ) ) ( not ( = ?auto_728985 ?auto_728986 ) ) ( not ( = ?auto_728985 ?auto_728987 ) ) ( not ( = ?auto_728985 ?auto_728988 ) ) ( not ( = ?auto_728985 ?auto_728989 ) ) ( not ( = ?auto_728985 ?auto_728990 ) ) ( not ( = ?auto_728985 ?auto_728991 ) ) ( not ( = ?auto_728985 ?auto_728992 ) ) ( not ( = ?auto_728986 ?auto_728987 ) ) ( not ( = ?auto_728986 ?auto_728988 ) ) ( not ( = ?auto_728986 ?auto_728989 ) ) ( not ( = ?auto_728986 ?auto_728990 ) ) ( not ( = ?auto_728986 ?auto_728991 ) ) ( not ( = ?auto_728986 ?auto_728992 ) ) ( not ( = ?auto_728987 ?auto_728988 ) ) ( not ( = ?auto_728987 ?auto_728989 ) ) ( not ( = ?auto_728987 ?auto_728990 ) ) ( not ( = ?auto_728987 ?auto_728991 ) ) ( not ( = ?auto_728987 ?auto_728992 ) ) ( not ( = ?auto_728988 ?auto_728989 ) ) ( not ( = ?auto_728988 ?auto_728990 ) ) ( not ( = ?auto_728988 ?auto_728991 ) ) ( not ( = ?auto_728988 ?auto_728992 ) ) ( not ( = ?auto_728989 ?auto_728990 ) ) ( not ( = ?auto_728989 ?auto_728991 ) ) ( not ( = ?auto_728989 ?auto_728992 ) ) ( not ( = ?auto_728990 ?auto_728991 ) ) ( not ( = ?auto_728990 ?auto_728992 ) ) ( not ( = ?auto_728991 ?auto_728992 ) ) ( ON ?auto_728990 ?auto_728991 ) ( ON ?auto_728989 ?auto_728990 ) ( ON ?auto_728988 ?auto_728989 ) ( ON ?auto_728987 ?auto_728988 ) ( ON ?auto_728986 ?auto_728987 ) ( ON ?auto_728985 ?auto_728986 ) ( ON ?auto_728984 ?auto_728985 ) ( ON ?auto_728983 ?auto_728984 ) ( ON ?auto_728982 ?auto_728983 ) ( ON ?auto_728981 ?auto_728982 ) ( ON ?auto_728980 ?auto_728981 ) ( ON ?auto_728979 ?auto_728980 ) ( ON ?auto_728978 ?auto_728979 ) ( CLEAR ?auto_728978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_728978 )
      ( MAKE-14PILE ?auto_728978 ?auto_728979 ?auto_728980 ?auto_728981 ?auto_728982 ?auto_728983 ?auto_728984 ?auto_728985 ?auto_728986 ?auto_728987 ?auto_728988 ?auto_728989 ?auto_728990 ?auto_728991 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729037 - BLOCK
      ?auto_729038 - BLOCK
      ?auto_729039 - BLOCK
      ?auto_729040 - BLOCK
      ?auto_729041 - BLOCK
      ?auto_729042 - BLOCK
      ?auto_729043 - BLOCK
      ?auto_729044 - BLOCK
      ?auto_729045 - BLOCK
      ?auto_729046 - BLOCK
      ?auto_729047 - BLOCK
      ?auto_729048 - BLOCK
      ?auto_729049 - BLOCK
      ?auto_729050 - BLOCK
      ?auto_729051 - BLOCK
    )
    :vars
    (
      ?auto_729052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_729050 ) ( ON ?auto_729051 ?auto_729052 ) ( CLEAR ?auto_729051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_729037 ) ( ON ?auto_729038 ?auto_729037 ) ( ON ?auto_729039 ?auto_729038 ) ( ON ?auto_729040 ?auto_729039 ) ( ON ?auto_729041 ?auto_729040 ) ( ON ?auto_729042 ?auto_729041 ) ( ON ?auto_729043 ?auto_729042 ) ( ON ?auto_729044 ?auto_729043 ) ( ON ?auto_729045 ?auto_729044 ) ( ON ?auto_729046 ?auto_729045 ) ( ON ?auto_729047 ?auto_729046 ) ( ON ?auto_729048 ?auto_729047 ) ( ON ?auto_729049 ?auto_729048 ) ( ON ?auto_729050 ?auto_729049 ) ( not ( = ?auto_729037 ?auto_729038 ) ) ( not ( = ?auto_729037 ?auto_729039 ) ) ( not ( = ?auto_729037 ?auto_729040 ) ) ( not ( = ?auto_729037 ?auto_729041 ) ) ( not ( = ?auto_729037 ?auto_729042 ) ) ( not ( = ?auto_729037 ?auto_729043 ) ) ( not ( = ?auto_729037 ?auto_729044 ) ) ( not ( = ?auto_729037 ?auto_729045 ) ) ( not ( = ?auto_729037 ?auto_729046 ) ) ( not ( = ?auto_729037 ?auto_729047 ) ) ( not ( = ?auto_729037 ?auto_729048 ) ) ( not ( = ?auto_729037 ?auto_729049 ) ) ( not ( = ?auto_729037 ?auto_729050 ) ) ( not ( = ?auto_729037 ?auto_729051 ) ) ( not ( = ?auto_729037 ?auto_729052 ) ) ( not ( = ?auto_729038 ?auto_729039 ) ) ( not ( = ?auto_729038 ?auto_729040 ) ) ( not ( = ?auto_729038 ?auto_729041 ) ) ( not ( = ?auto_729038 ?auto_729042 ) ) ( not ( = ?auto_729038 ?auto_729043 ) ) ( not ( = ?auto_729038 ?auto_729044 ) ) ( not ( = ?auto_729038 ?auto_729045 ) ) ( not ( = ?auto_729038 ?auto_729046 ) ) ( not ( = ?auto_729038 ?auto_729047 ) ) ( not ( = ?auto_729038 ?auto_729048 ) ) ( not ( = ?auto_729038 ?auto_729049 ) ) ( not ( = ?auto_729038 ?auto_729050 ) ) ( not ( = ?auto_729038 ?auto_729051 ) ) ( not ( = ?auto_729038 ?auto_729052 ) ) ( not ( = ?auto_729039 ?auto_729040 ) ) ( not ( = ?auto_729039 ?auto_729041 ) ) ( not ( = ?auto_729039 ?auto_729042 ) ) ( not ( = ?auto_729039 ?auto_729043 ) ) ( not ( = ?auto_729039 ?auto_729044 ) ) ( not ( = ?auto_729039 ?auto_729045 ) ) ( not ( = ?auto_729039 ?auto_729046 ) ) ( not ( = ?auto_729039 ?auto_729047 ) ) ( not ( = ?auto_729039 ?auto_729048 ) ) ( not ( = ?auto_729039 ?auto_729049 ) ) ( not ( = ?auto_729039 ?auto_729050 ) ) ( not ( = ?auto_729039 ?auto_729051 ) ) ( not ( = ?auto_729039 ?auto_729052 ) ) ( not ( = ?auto_729040 ?auto_729041 ) ) ( not ( = ?auto_729040 ?auto_729042 ) ) ( not ( = ?auto_729040 ?auto_729043 ) ) ( not ( = ?auto_729040 ?auto_729044 ) ) ( not ( = ?auto_729040 ?auto_729045 ) ) ( not ( = ?auto_729040 ?auto_729046 ) ) ( not ( = ?auto_729040 ?auto_729047 ) ) ( not ( = ?auto_729040 ?auto_729048 ) ) ( not ( = ?auto_729040 ?auto_729049 ) ) ( not ( = ?auto_729040 ?auto_729050 ) ) ( not ( = ?auto_729040 ?auto_729051 ) ) ( not ( = ?auto_729040 ?auto_729052 ) ) ( not ( = ?auto_729041 ?auto_729042 ) ) ( not ( = ?auto_729041 ?auto_729043 ) ) ( not ( = ?auto_729041 ?auto_729044 ) ) ( not ( = ?auto_729041 ?auto_729045 ) ) ( not ( = ?auto_729041 ?auto_729046 ) ) ( not ( = ?auto_729041 ?auto_729047 ) ) ( not ( = ?auto_729041 ?auto_729048 ) ) ( not ( = ?auto_729041 ?auto_729049 ) ) ( not ( = ?auto_729041 ?auto_729050 ) ) ( not ( = ?auto_729041 ?auto_729051 ) ) ( not ( = ?auto_729041 ?auto_729052 ) ) ( not ( = ?auto_729042 ?auto_729043 ) ) ( not ( = ?auto_729042 ?auto_729044 ) ) ( not ( = ?auto_729042 ?auto_729045 ) ) ( not ( = ?auto_729042 ?auto_729046 ) ) ( not ( = ?auto_729042 ?auto_729047 ) ) ( not ( = ?auto_729042 ?auto_729048 ) ) ( not ( = ?auto_729042 ?auto_729049 ) ) ( not ( = ?auto_729042 ?auto_729050 ) ) ( not ( = ?auto_729042 ?auto_729051 ) ) ( not ( = ?auto_729042 ?auto_729052 ) ) ( not ( = ?auto_729043 ?auto_729044 ) ) ( not ( = ?auto_729043 ?auto_729045 ) ) ( not ( = ?auto_729043 ?auto_729046 ) ) ( not ( = ?auto_729043 ?auto_729047 ) ) ( not ( = ?auto_729043 ?auto_729048 ) ) ( not ( = ?auto_729043 ?auto_729049 ) ) ( not ( = ?auto_729043 ?auto_729050 ) ) ( not ( = ?auto_729043 ?auto_729051 ) ) ( not ( = ?auto_729043 ?auto_729052 ) ) ( not ( = ?auto_729044 ?auto_729045 ) ) ( not ( = ?auto_729044 ?auto_729046 ) ) ( not ( = ?auto_729044 ?auto_729047 ) ) ( not ( = ?auto_729044 ?auto_729048 ) ) ( not ( = ?auto_729044 ?auto_729049 ) ) ( not ( = ?auto_729044 ?auto_729050 ) ) ( not ( = ?auto_729044 ?auto_729051 ) ) ( not ( = ?auto_729044 ?auto_729052 ) ) ( not ( = ?auto_729045 ?auto_729046 ) ) ( not ( = ?auto_729045 ?auto_729047 ) ) ( not ( = ?auto_729045 ?auto_729048 ) ) ( not ( = ?auto_729045 ?auto_729049 ) ) ( not ( = ?auto_729045 ?auto_729050 ) ) ( not ( = ?auto_729045 ?auto_729051 ) ) ( not ( = ?auto_729045 ?auto_729052 ) ) ( not ( = ?auto_729046 ?auto_729047 ) ) ( not ( = ?auto_729046 ?auto_729048 ) ) ( not ( = ?auto_729046 ?auto_729049 ) ) ( not ( = ?auto_729046 ?auto_729050 ) ) ( not ( = ?auto_729046 ?auto_729051 ) ) ( not ( = ?auto_729046 ?auto_729052 ) ) ( not ( = ?auto_729047 ?auto_729048 ) ) ( not ( = ?auto_729047 ?auto_729049 ) ) ( not ( = ?auto_729047 ?auto_729050 ) ) ( not ( = ?auto_729047 ?auto_729051 ) ) ( not ( = ?auto_729047 ?auto_729052 ) ) ( not ( = ?auto_729048 ?auto_729049 ) ) ( not ( = ?auto_729048 ?auto_729050 ) ) ( not ( = ?auto_729048 ?auto_729051 ) ) ( not ( = ?auto_729048 ?auto_729052 ) ) ( not ( = ?auto_729049 ?auto_729050 ) ) ( not ( = ?auto_729049 ?auto_729051 ) ) ( not ( = ?auto_729049 ?auto_729052 ) ) ( not ( = ?auto_729050 ?auto_729051 ) ) ( not ( = ?auto_729050 ?auto_729052 ) ) ( not ( = ?auto_729051 ?auto_729052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_729051 ?auto_729052 )
      ( !STACK ?auto_729051 ?auto_729050 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729099 - BLOCK
      ?auto_729100 - BLOCK
      ?auto_729101 - BLOCK
      ?auto_729102 - BLOCK
      ?auto_729103 - BLOCK
      ?auto_729104 - BLOCK
      ?auto_729105 - BLOCK
      ?auto_729106 - BLOCK
      ?auto_729107 - BLOCK
      ?auto_729108 - BLOCK
      ?auto_729109 - BLOCK
      ?auto_729110 - BLOCK
      ?auto_729111 - BLOCK
      ?auto_729112 - BLOCK
      ?auto_729113 - BLOCK
    )
    :vars
    (
      ?auto_729114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729113 ?auto_729114 ) ( ON-TABLE ?auto_729099 ) ( ON ?auto_729100 ?auto_729099 ) ( ON ?auto_729101 ?auto_729100 ) ( ON ?auto_729102 ?auto_729101 ) ( ON ?auto_729103 ?auto_729102 ) ( ON ?auto_729104 ?auto_729103 ) ( ON ?auto_729105 ?auto_729104 ) ( ON ?auto_729106 ?auto_729105 ) ( ON ?auto_729107 ?auto_729106 ) ( ON ?auto_729108 ?auto_729107 ) ( ON ?auto_729109 ?auto_729108 ) ( ON ?auto_729110 ?auto_729109 ) ( ON ?auto_729111 ?auto_729110 ) ( not ( = ?auto_729099 ?auto_729100 ) ) ( not ( = ?auto_729099 ?auto_729101 ) ) ( not ( = ?auto_729099 ?auto_729102 ) ) ( not ( = ?auto_729099 ?auto_729103 ) ) ( not ( = ?auto_729099 ?auto_729104 ) ) ( not ( = ?auto_729099 ?auto_729105 ) ) ( not ( = ?auto_729099 ?auto_729106 ) ) ( not ( = ?auto_729099 ?auto_729107 ) ) ( not ( = ?auto_729099 ?auto_729108 ) ) ( not ( = ?auto_729099 ?auto_729109 ) ) ( not ( = ?auto_729099 ?auto_729110 ) ) ( not ( = ?auto_729099 ?auto_729111 ) ) ( not ( = ?auto_729099 ?auto_729112 ) ) ( not ( = ?auto_729099 ?auto_729113 ) ) ( not ( = ?auto_729099 ?auto_729114 ) ) ( not ( = ?auto_729100 ?auto_729101 ) ) ( not ( = ?auto_729100 ?auto_729102 ) ) ( not ( = ?auto_729100 ?auto_729103 ) ) ( not ( = ?auto_729100 ?auto_729104 ) ) ( not ( = ?auto_729100 ?auto_729105 ) ) ( not ( = ?auto_729100 ?auto_729106 ) ) ( not ( = ?auto_729100 ?auto_729107 ) ) ( not ( = ?auto_729100 ?auto_729108 ) ) ( not ( = ?auto_729100 ?auto_729109 ) ) ( not ( = ?auto_729100 ?auto_729110 ) ) ( not ( = ?auto_729100 ?auto_729111 ) ) ( not ( = ?auto_729100 ?auto_729112 ) ) ( not ( = ?auto_729100 ?auto_729113 ) ) ( not ( = ?auto_729100 ?auto_729114 ) ) ( not ( = ?auto_729101 ?auto_729102 ) ) ( not ( = ?auto_729101 ?auto_729103 ) ) ( not ( = ?auto_729101 ?auto_729104 ) ) ( not ( = ?auto_729101 ?auto_729105 ) ) ( not ( = ?auto_729101 ?auto_729106 ) ) ( not ( = ?auto_729101 ?auto_729107 ) ) ( not ( = ?auto_729101 ?auto_729108 ) ) ( not ( = ?auto_729101 ?auto_729109 ) ) ( not ( = ?auto_729101 ?auto_729110 ) ) ( not ( = ?auto_729101 ?auto_729111 ) ) ( not ( = ?auto_729101 ?auto_729112 ) ) ( not ( = ?auto_729101 ?auto_729113 ) ) ( not ( = ?auto_729101 ?auto_729114 ) ) ( not ( = ?auto_729102 ?auto_729103 ) ) ( not ( = ?auto_729102 ?auto_729104 ) ) ( not ( = ?auto_729102 ?auto_729105 ) ) ( not ( = ?auto_729102 ?auto_729106 ) ) ( not ( = ?auto_729102 ?auto_729107 ) ) ( not ( = ?auto_729102 ?auto_729108 ) ) ( not ( = ?auto_729102 ?auto_729109 ) ) ( not ( = ?auto_729102 ?auto_729110 ) ) ( not ( = ?auto_729102 ?auto_729111 ) ) ( not ( = ?auto_729102 ?auto_729112 ) ) ( not ( = ?auto_729102 ?auto_729113 ) ) ( not ( = ?auto_729102 ?auto_729114 ) ) ( not ( = ?auto_729103 ?auto_729104 ) ) ( not ( = ?auto_729103 ?auto_729105 ) ) ( not ( = ?auto_729103 ?auto_729106 ) ) ( not ( = ?auto_729103 ?auto_729107 ) ) ( not ( = ?auto_729103 ?auto_729108 ) ) ( not ( = ?auto_729103 ?auto_729109 ) ) ( not ( = ?auto_729103 ?auto_729110 ) ) ( not ( = ?auto_729103 ?auto_729111 ) ) ( not ( = ?auto_729103 ?auto_729112 ) ) ( not ( = ?auto_729103 ?auto_729113 ) ) ( not ( = ?auto_729103 ?auto_729114 ) ) ( not ( = ?auto_729104 ?auto_729105 ) ) ( not ( = ?auto_729104 ?auto_729106 ) ) ( not ( = ?auto_729104 ?auto_729107 ) ) ( not ( = ?auto_729104 ?auto_729108 ) ) ( not ( = ?auto_729104 ?auto_729109 ) ) ( not ( = ?auto_729104 ?auto_729110 ) ) ( not ( = ?auto_729104 ?auto_729111 ) ) ( not ( = ?auto_729104 ?auto_729112 ) ) ( not ( = ?auto_729104 ?auto_729113 ) ) ( not ( = ?auto_729104 ?auto_729114 ) ) ( not ( = ?auto_729105 ?auto_729106 ) ) ( not ( = ?auto_729105 ?auto_729107 ) ) ( not ( = ?auto_729105 ?auto_729108 ) ) ( not ( = ?auto_729105 ?auto_729109 ) ) ( not ( = ?auto_729105 ?auto_729110 ) ) ( not ( = ?auto_729105 ?auto_729111 ) ) ( not ( = ?auto_729105 ?auto_729112 ) ) ( not ( = ?auto_729105 ?auto_729113 ) ) ( not ( = ?auto_729105 ?auto_729114 ) ) ( not ( = ?auto_729106 ?auto_729107 ) ) ( not ( = ?auto_729106 ?auto_729108 ) ) ( not ( = ?auto_729106 ?auto_729109 ) ) ( not ( = ?auto_729106 ?auto_729110 ) ) ( not ( = ?auto_729106 ?auto_729111 ) ) ( not ( = ?auto_729106 ?auto_729112 ) ) ( not ( = ?auto_729106 ?auto_729113 ) ) ( not ( = ?auto_729106 ?auto_729114 ) ) ( not ( = ?auto_729107 ?auto_729108 ) ) ( not ( = ?auto_729107 ?auto_729109 ) ) ( not ( = ?auto_729107 ?auto_729110 ) ) ( not ( = ?auto_729107 ?auto_729111 ) ) ( not ( = ?auto_729107 ?auto_729112 ) ) ( not ( = ?auto_729107 ?auto_729113 ) ) ( not ( = ?auto_729107 ?auto_729114 ) ) ( not ( = ?auto_729108 ?auto_729109 ) ) ( not ( = ?auto_729108 ?auto_729110 ) ) ( not ( = ?auto_729108 ?auto_729111 ) ) ( not ( = ?auto_729108 ?auto_729112 ) ) ( not ( = ?auto_729108 ?auto_729113 ) ) ( not ( = ?auto_729108 ?auto_729114 ) ) ( not ( = ?auto_729109 ?auto_729110 ) ) ( not ( = ?auto_729109 ?auto_729111 ) ) ( not ( = ?auto_729109 ?auto_729112 ) ) ( not ( = ?auto_729109 ?auto_729113 ) ) ( not ( = ?auto_729109 ?auto_729114 ) ) ( not ( = ?auto_729110 ?auto_729111 ) ) ( not ( = ?auto_729110 ?auto_729112 ) ) ( not ( = ?auto_729110 ?auto_729113 ) ) ( not ( = ?auto_729110 ?auto_729114 ) ) ( not ( = ?auto_729111 ?auto_729112 ) ) ( not ( = ?auto_729111 ?auto_729113 ) ) ( not ( = ?auto_729111 ?auto_729114 ) ) ( not ( = ?auto_729112 ?auto_729113 ) ) ( not ( = ?auto_729112 ?auto_729114 ) ) ( not ( = ?auto_729113 ?auto_729114 ) ) ( CLEAR ?auto_729111 ) ( ON ?auto_729112 ?auto_729113 ) ( CLEAR ?auto_729112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_729099 ?auto_729100 ?auto_729101 ?auto_729102 ?auto_729103 ?auto_729104 ?auto_729105 ?auto_729106 ?auto_729107 ?auto_729108 ?auto_729109 ?auto_729110 ?auto_729111 ?auto_729112 )
      ( MAKE-15PILE ?auto_729099 ?auto_729100 ?auto_729101 ?auto_729102 ?auto_729103 ?auto_729104 ?auto_729105 ?auto_729106 ?auto_729107 ?auto_729108 ?auto_729109 ?auto_729110 ?auto_729111 ?auto_729112 ?auto_729113 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729161 - BLOCK
      ?auto_729162 - BLOCK
      ?auto_729163 - BLOCK
      ?auto_729164 - BLOCK
      ?auto_729165 - BLOCK
      ?auto_729166 - BLOCK
      ?auto_729167 - BLOCK
      ?auto_729168 - BLOCK
      ?auto_729169 - BLOCK
      ?auto_729170 - BLOCK
      ?auto_729171 - BLOCK
      ?auto_729172 - BLOCK
      ?auto_729173 - BLOCK
      ?auto_729174 - BLOCK
      ?auto_729175 - BLOCK
    )
    :vars
    (
      ?auto_729176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729175 ?auto_729176 ) ( ON-TABLE ?auto_729161 ) ( ON ?auto_729162 ?auto_729161 ) ( ON ?auto_729163 ?auto_729162 ) ( ON ?auto_729164 ?auto_729163 ) ( ON ?auto_729165 ?auto_729164 ) ( ON ?auto_729166 ?auto_729165 ) ( ON ?auto_729167 ?auto_729166 ) ( ON ?auto_729168 ?auto_729167 ) ( ON ?auto_729169 ?auto_729168 ) ( ON ?auto_729170 ?auto_729169 ) ( ON ?auto_729171 ?auto_729170 ) ( ON ?auto_729172 ?auto_729171 ) ( not ( = ?auto_729161 ?auto_729162 ) ) ( not ( = ?auto_729161 ?auto_729163 ) ) ( not ( = ?auto_729161 ?auto_729164 ) ) ( not ( = ?auto_729161 ?auto_729165 ) ) ( not ( = ?auto_729161 ?auto_729166 ) ) ( not ( = ?auto_729161 ?auto_729167 ) ) ( not ( = ?auto_729161 ?auto_729168 ) ) ( not ( = ?auto_729161 ?auto_729169 ) ) ( not ( = ?auto_729161 ?auto_729170 ) ) ( not ( = ?auto_729161 ?auto_729171 ) ) ( not ( = ?auto_729161 ?auto_729172 ) ) ( not ( = ?auto_729161 ?auto_729173 ) ) ( not ( = ?auto_729161 ?auto_729174 ) ) ( not ( = ?auto_729161 ?auto_729175 ) ) ( not ( = ?auto_729161 ?auto_729176 ) ) ( not ( = ?auto_729162 ?auto_729163 ) ) ( not ( = ?auto_729162 ?auto_729164 ) ) ( not ( = ?auto_729162 ?auto_729165 ) ) ( not ( = ?auto_729162 ?auto_729166 ) ) ( not ( = ?auto_729162 ?auto_729167 ) ) ( not ( = ?auto_729162 ?auto_729168 ) ) ( not ( = ?auto_729162 ?auto_729169 ) ) ( not ( = ?auto_729162 ?auto_729170 ) ) ( not ( = ?auto_729162 ?auto_729171 ) ) ( not ( = ?auto_729162 ?auto_729172 ) ) ( not ( = ?auto_729162 ?auto_729173 ) ) ( not ( = ?auto_729162 ?auto_729174 ) ) ( not ( = ?auto_729162 ?auto_729175 ) ) ( not ( = ?auto_729162 ?auto_729176 ) ) ( not ( = ?auto_729163 ?auto_729164 ) ) ( not ( = ?auto_729163 ?auto_729165 ) ) ( not ( = ?auto_729163 ?auto_729166 ) ) ( not ( = ?auto_729163 ?auto_729167 ) ) ( not ( = ?auto_729163 ?auto_729168 ) ) ( not ( = ?auto_729163 ?auto_729169 ) ) ( not ( = ?auto_729163 ?auto_729170 ) ) ( not ( = ?auto_729163 ?auto_729171 ) ) ( not ( = ?auto_729163 ?auto_729172 ) ) ( not ( = ?auto_729163 ?auto_729173 ) ) ( not ( = ?auto_729163 ?auto_729174 ) ) ( not ( = ?auto_729163 ?auto_729175 ) ) ( not ( = ?auto_729163 ?auto_729176 ) ) ( not ( = ?auto_729164 ?auto_729165 ) ) ( not ( = ?auto_729164 ?auto_729166 ) ) ( not ( = ?auto_729164 ?auto_729167 ) ) ( not ( = ?auto_729164 ?auto_729168 ) ) ( not ( = ?auto_729164 ?auto_729169 ) ) ( not ( = ?auto_729164 ?auto_729170 ) ) ( not ( = ?auto_729164 ?auto_729171 ) ) ( not ( = ?auto_729164 ?auto_729172 ) ) ( not ( = ?auto_729164 ?auto_729173 ) ) ( not ( = ?auto_729164 ?auto_729174 ) ) ( not ( = ?auto_729164 ?auto_729175 ) ) ( not ( = ?auto_729164 ?auto_729176 ) ) ( not ( = ?auto_729165 ?auto_729166 ) ) ( not ( = ?auto_729165 ?auto_729167 ) ) ( not ( = ?auto_729165 ?auto_729168 ) ) ( not ( = ?auto_729165 ?auto_729169 ) ) ( not ( = ?auto_729165 ?auto_729170 ) ) ( not ( = ?auto_729165 ?auto_729171 ) ) ( not ( = ?auto_729165 ?auto_729172 ) ) ( not ( = ?auto_729165 ?auto_729173 ) ) ( not ( = ?auto_729165 ?auto_729174 ) ) ( not ( = ?auto_729165 ?auto_729175 ) ) ( not ( = ?auto_729165 ?auto_729176 ) ) ( not ( = ?auto_729166 ?auto_729167 ) ) ( not ( = ?auto_729166 ?auto_729168 ) ) ( not ( = ?auto_729166 ?auto_729169 ) ) ( not ( = ?auto_729166 ?auto_729170 ) ) ( not ( = ?auto_729166 ?auto_729171 ) ) ( not ( = ?auto_729166 ?auto_729172 ) ) ( not ( = ?auto_729166 ?auto_729173 ) ) ( not ( = ?auto_729166 ?auto_729174 ) ) ( not ( = ?auto_729166 ?auto_729175 ) ) ( not ( = ?auto_729166 ?auto_729176 ) ) ( not ( = ?auto_729167 ?auto_729168 ) ) ( not ( = ?auto_729167 ?auto_729169 ) ) ( not ( = ?auto_729167 ?auto_729170 ) ) ( not ( = ?auto_729167 ?auto_729171 ) ) ( not ( = ?auto_729167 ?auto_729172 ) ) ( not ( = ?auto_729167 ?auto_729173 ) ) ( not ( = ?auto_729167 ?auto_729174 ) ) ( not ( = ?auto_729167 ?auto_729175 ) ) ( not ( = ?auto_729167 ?auto_729176 ) ) ( not ( = ?auto_729168 ?auto_729169 ) ) ( not ( = ?auto_729168 ?auto_729170 ) ) ( not ( = ?auto_729168 ?auto_729171 ) ) ( not ( = ?auto_729168 ?auto_729172 ) ) ( not ( = ?auto_729168 ?auto_729173 ) ) ( not ( = ?auto_729168 ?auto_729174 ) ) ( not ( = ?auto_729168 ?auto_729175 ) ) ( not ( = ?auto_729168 ?auto_729176 ) ) ( not ( = ?auto_729169 ?auto_729170 ) ) ( not ( = ?auto_729169 ?auto_729171 ) ) ( not ( = ?auto_729169 ?auto_729172 ) ) ( not ( = ?auto_729169 ?auto_729173 ) ) ( not ( = ?auto_729169 ?auto_729174 ) ) ( not ( = ?auto_729169 ?auto_729175 ) ) ( not ( = ?auto_729169 ?auto_729176 ) ) ( not ( = ?auto_729170 ?auto_729171 ) ) ( not ( = ?auto_729170 ?auto_729172 ) ) ( not ( = ?auto_729170 ?auto_729173 ) ) ( not ( = ?auto_729170 ?auto_729174 ) ) ( not ( = ?auto_729170 ?auto_729175 ) ) ( not ( = ?auto_729170 ?auto_729176 ) ) ( not ( = ?auto_729171 ?auto_729172 ) ) ( not ( = ?auto_729171 ?auto_729173 ) ) ( not ( = ?auto_729171 ?auto_729174 ) ) ( not ( = ?auto_729171 ?auto_729175 ) ) ( not ( = ?auto_729171 ?auto_729176 ) ) ( not ( = ?auto_729172 ?auto_729173 ) ) ( not ( = ?auto_729172 ?auto_729174 ) ) ( not ( = ?auto_729172 ?auto_729175 ) ) ( not ( = ?auto_729172 ?auto_729176 ) ) ( not ( = ?auto_729173 ?auto_729174 ) ) ( not ( = ?auto_729173 ?auto_729175 ) ) ( not ( = ?auto_729173 ?auto_729176 ) ) ( not ( = ?auto_729174 ?auto_729175 ) ) ( not ( = ?auto_729174 ?auto_729176 ) ) ( not ( = ?auto_729175 ?auto_729176 ) ) ( ON ?auto_729174 ?auto_729175 ) ( CLEAR ?auto_729172 ) ( ON ?auto_729173 ?auto_729174 ) ( CLEAR ?auto_729173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_729161 ?auto_729162 ?auto_729163 ?auto_729164 ?auto_729165 ?auto_729166 ?auto_729167 ?auto_729168 ?auto_729169 ?auto_729170 ?auto_729171 ?auto_729172 ?auto_729173 )
      ( MAKE-15PILE ?auto_729161 ?auto_729162 ?auto_729163 ?auto_729164 ?auto_729165 ?auto_729166 ?auto_729167 ?auto_729168 ?auto_729169 ?auto_729170 ?auto_729171 ?auto_729172 ?auto_729173 ?auto_729174 ?auto_729175 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729223 - BLOCK
      ?auto_729224 - BLOCK
      ?auto_729225 - BLOCK
      ?auto_729226 - BLOCK
      ?auto_729227 - BLOCK
      ?auto_729228 - BLOCK
      ?auto_729229 - BLOCK
      ?auto_729230 - BLOCK
      ?auto_729231 - BLOCK
      ?auto_729232 - BLOCK
      ?auto_729233 - BLOCK
      ?auto_729234 - BLOCK
      ?auto_729235 - BLOCK
      ?auto_729236 - BLOCK
      ?auto_729237 - BLOCK
    )
    :vars
    (
      ?auto_729238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729237 ?auto_729238 ) ( ON-TABLE ?auto_729223 ) ( ON ?auto_729224 ?auto_729223 ) ( ON ?auto_729225 ?auto_729224 ) ( ON ?auto_729226 ?auto_729225 ) ( ON ?auto_729227 ?auto_729226 ) ( ON ?auto_729228 ?auto_729227 ) ( ON ?auto_729229 ?auto_729228 ) ( ON ?auto_729230 ?auto_729229 ) ( ON ?auto_729231 ?auto_729230 ) ( ON ?auto_729232 ?auto_729231 ) ( ON ?auto_729233 ?auto_729232 ) ( not ( = ?auto_729223 ?auto_729224 ) ) ( not ( = ?auto_729223 ?auto_729225 ) ) ( not ( = ?auto_729223 ?auto_729226 ) ) ( not ( = ?auto_729223 ?auto_729227 ) ) ( not ( = ?auto_729223 ?auto_729228 ) ) ( not ( = ?auto_729223 ?auto_729229 ) ) ( not ( = ?auto_729223 ?auto_729230 ) ) ( not ( = ?auto_729223 ?auto_729231 ) ) ( not ( = ?auto_729223 ?auto_729232 ) ) ( not ( = ?auto_729223 ?auto_729233 ) ) ( not ( = ?auto_729223 ?auto_729234 ) ) ( not ( = ?auto_729223 ?auto_729235 ) ) ( not ( = ?auto_729223 ?auto_729236 ) ) ( not ( = ?auto_729223 ?auto_729237 ) ) ( not ( = ?auto_729223 ?auto_729238 ) ) ( not ( = ?auto_729224 ?auto_729225 ) ) ( not ( = ?auto_729224 ?auto_729226 ) ) ( not ( = ?auto_729224 ?auto_729227 ) ) ( not ( = ?auto_729224 ?auto_729228 ) ) ( not ( = ?auto_729224 ?auto_729229 ) ) ( not ( = ?auto_729224 ?auto_729230 ) ) ( not ( = ?auto_729224 ?auto_729231 ) ) ( not ( = ?auto_729224 ?auto_729232 ) ) ( not ( = ?auto_729224 ?auto_729233 ) ) ( not ( = ?auto_729224 ?auto_729234 ) ) ( not ( = ?auto_729224 ?auto_729235 ) ) ( not ( = ?auto_729224 ?auto_729236 ) ) ( not ( = ?auto_729224 ?auto_729237 ) ) ( not ( = ?auto_729224 ?auto_729238 ) ) ( not ( = ?auto_729225 ?auto_729226 ) ) ( not ( = ?auto_729225 ?auto_729227 ) ) ( not ( = ?auto_729225 ?auto_729228 ) ) ( not ( = ?auto_729225 ?auto_729229 ) ) ( not ( = ?auto_729225 ?auto_729230 ) ) ( not ( = ?auto_729225 ?auto_729231 ) ) ( not ( = ?auto_729225 ?auto_729232 ) ) ( not ( = ?auto_729225 ?auto_729233 ) ) ( not ( = ?auto_729225 ?auto_729234 ) ) ( not ( = ?auto_729225 ?auto_729235 ) ) ( not ( = ?auto_729225 ?auto_729236 ) ) ( not ( = ?auto_729225 ?auto_729237 ) ) ( not ( = ?auto_729225 ?auto_729238 ) ) ( not ( = ?auto_729226 ?auto_729227 ) ) ( not ( = ?auto_729226 ?auto_729228 ) ) ( not ( = ?auto_729226 ?auto_729229 ) ) ( not ( = ?auto_729226 ?auto_729230 ) ) ( not ( = ?auto_729226 ?auto_729231 ) ) ( not ( = ?auto_729226 ?auto_729232 ) ) ( not ( = ?auto_729226 ?auto_729233 ) ) ( not ( = ?auto_729226 ?auto_729234 ) ) ( not ( = ?auto_729226 ?auto_729235 ) ) ( not ( = ?auto_729226 ?auto_729236 ) ) ( not ( = ?auto_729226 ?auto_729237 ) ) ( not ( = ?auto_729226 ?auto_729238 ) ) ( not ( = ?auto_729227 ?auto_729228 ) ) ( not ( = ?auto_729227 ?auto_729229 ) ) ( not ( = ?auto_729227 ?auto_729230 ) ) ( not ( = ?auto_729227 ?auto_729231 ) ) ( not ( = ?auto_729227 ?auto_729232 ) ) ( not ( = ?auto_729227 ?auto_729233 ) ) ( not ( = ?auto_729227 ?auto_729234 ) ) ( not ( = ?auto_729227 ?auto_729235 ) ) ( not ( = ?auto_729227 ?auto_729236 ) ) ( not ( = ?auto_729227 ?auto_729237 ) ) ( not ( = ?auto_729227 ?auto_729238 ) ) ( not ( = ?auto_729228 ?auto_729229 ) ) ( not ( = ?auto_729228 ?auto_729230 ) ) ( not ( = ?auto_729228 ?auto_729231 ) ) ( not ( = ?auto_729228 ?auto_729232 ) ) ( not ( = ?auto_729228 ?auto_729233 ) ) ( not ( = ?auto_729228 ?auto_729234 ) ) ( not ( = ?auto_729228 ?auto_729235 ) ) ( not ( = ?auto_729228 ?auto_729236 ) ) ( not ( = ?auto_729228 ?auto_729237 ) ) ( not ( = ?auto_729228 ?auto_729238 ) ) ( not ( = ?auto_729229 ?auto_729230 ) ) ( not ( = ?auto_729229 ?auto_729231 ) ) ( not ( = ?auto_729229 ?auto_729232 ) ) ( not ( = ?auto_729229 ?auto_729233 ) ) ( not ( = ?auto_729229 ?auto_729234 ) ) ( not ( = ?auto_729229 ?auto_729235 ) ) ( not ( = ?auto_729229 ?auto_729236 ) ) ( not ( = ?auto_729229 ?auto_729237 ) ) ( not ( = ?auto_729229 ?auto_729238 ) ) ( not ( = ?auto_729230 ?auto_729231 ) ) ( not ( = ?auto_729230 ?auto_729232 ) ) ( not ( = ?auto_729230 ?auto_729233 ) ) ( not ( = ?auto_729230 ?auto_729234 ) ) ( not ( = ?auto_729230 ?auto_729235 ) ) ( not ( = ?auto_729230 ?auto_729236 ) ) ( not ( = ?auto_729230 ?auto_729237 ) ) ( not ( = ?auto_729230 ?auto_729238 ) ) ( not ( = ?auto_729231 ?auto_729232 ) ) ( not ( = ?auto_729231 ?auto_729233 ) ) ( not ( = ?auto_729231 ?auto_729234 ) ) ( not ( = ?auto_729231 ?auto_729235 ) ) ( not ( = ?auto_729231 ?auto_729236 ) ) ( not ( = ?auto_729231 ?auto_729237 ) ) ( not ( = ?auto_729231 ?auto_729238 ) ) ( not ( = ?auto_729232 ?auto_729233 ) ) ( not ( = ?auto_729232 ?auto_729234 ) ) ( not ( = ?auto_729232 ?auto_729235 ) ) ( not ( = ?auto_729232 ?auto_729236 ) ) ( not ( = ?auto_729232 ?auto_729237 ) ) ( not ( = ?auto_729232 ?auto_729238 ) ) ( not ( = ?auto_729233 ?auto_729234 ) ) ( not ( = ?auto_729233 ?auto_729235 ) ) ( not ( = ?auto_729233 ?auto_729236 ) ) ( not ( = ?auto_729233 ?auto_729237 ) ) ( not ( = ?auto_729233 ?auto_729238 ) ) ( not ( = ?auto_729234 ?auto_729235 ) ) ( not ( = ?auto_729234 ?auto_729236 ) ) ( not ( = ?auto_729234 ?auto_729237 ) ) ( not ( = ?auto_729234 ?auto_729238 ) ) ( not ( = ?auto_729235 ?auto_729236 ) ) ( not ( = ?auto_729235 ?auto_729237 ) ) ( not ( = ?auto_729235 ?auto_729238 ) ) ( not ( = ?auto_729236 ?auto_729237 ) ) ( not ( = ?auto_729236 ?auto_729238 ) ) ( not ( = ?auto_729237 ?auto_729238 ) ) ( ON ?auto_729236 ?auto_729237 ) ( ON ?auto_729235 ?auto_729236 ) ( CLEAR ?auto_729233 ) ( ON ?auto_729234 ?auto_729235 ) ( CLEAR ?auto_729234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_729223 ?auto_729224 ?auto_729225 ?auto_729226 ?auto_729227 ?auto_729228 ?auto_729229 ?auto_729230 ?auto_729231 ?auto_729232 ?auto_729233 ?auto_729234 )
      ( MAKE-15PILE ?auto_729223 ?auto_729224 ?auto_729225 ?auto_729226 ?auto_729227 ?auto_729228 ?auto_729229 ?auto_729230 ?auto_729231 ?auto_729232 ?auto_729233 ?auto_729234 ?auto_729235 ?auto_729236 ?auto_729237 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729285 - BLOCK
      ?auto_729286 - BLOCK
      ?auto_729287 - BLOCK
      ?auto_729288 - BLOCK
      ?auto_729289 - BLOCK
      ?auto_729290 - BLOCK
      ?auto_729291 - BLOCK
      ?auto_729292 - BLOCK
      ?auto_729293 - BLOCK
      ?auto_729294 - BLOCK
      ?auto_729295 - BLOCK
      ?auto_729296 - BLOCK
      ?auto_729297 - BLOCK
      ?auto_729298 - BLOCK
      ?auto_729299 - BLOCK
    )
    :vars
    (
      ?auto_729300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729299 ?auto_729300 ) ( ON-TABLE ?auto_729285 ) ( ON ?auto_729286 ?auto_729285 ) ( ON ?auto_729287 ?auto_729286 ) ( ON ?auto_729288 ?auto_729287 ) ( ON ?auto_729289 ?auto_729288 ) ( ON ?auto_729290 ?auto_729289 ) ( ON ?auto_729291 ?auto_729290 ) ( ON ?auto_729292 ?auto_729291 ) ( ON ?auto_729293 ?auto_729292 ) ( ON ?auto_729294 ?auto_729293 ) ( not ( = ?auto_729285 ?auto_729286 ) ) ( not ( = ?auto_729285 ?auto_729287 ) ) ( not ( = ?auto_729285 ?auto_729288 ) ) ( not ( = ?auto_729285 ?auto_729289 ) ) ( not ( = ?auto_729285 ?auto_729290 ) ) ( not ( = ?auto_729285 ?auto_729291 ) ) ( not ( = ?auto_729285 ?auto_729292 ) ) ( not ( = ?auto_729285 ?auto_729293 ) ) ( not ( = ?auto_729285 ?auto_729294 ) ) ( not ( = ?auto_729285 ?auto_729295 ) ) ( not ( = ?auto_729285 ?auto_729296 ) ) ( not ( = ?auto_729285 ?auto_729297 ) ) ( not ( = ?auto_729285 ?auto_729298 ) ) ( not ( = ?auto_729285 ?auto_729299 ) ) ( not ( = ?auto_729285 ?auto_729300 ) ) ( not ( = ?auto_729286 ?auto_729287 ) ) ( not ( = ?auto_729286 ?auto_729288 ) ) ( not ( = ?auto_729286 ?auto_729289 ) ) ( not ( = ?auto_729286 ?auto_729290 ) ) ( not ( = ?auto_729286 ?auto_729291 ) ) ( not ( = ?auto_729286 ?auto_729292 ) ) ( not ( = ?auto_729286 ?auto_729293 ) ) ( not ( = ?auto_729286 ?auto_729294 ) ) ( not ( = ?auto_729286 ?auto_729295 ) ) ( not ( = ?auto_729286 ?auto_729296 ) ) ( not ( = ?auto_729286 ?auto_729297 ) ) ( not ( = ?auto_729286 ?auto_729298 ) ) ( not ( = ?auto_729286 ?auto_729299 ) ) ( not ( = ?auto_729286 ?auto_729300 ) ) ( not ( = ?auto_729287 ?auto_729288 ) ) ( not ( = ?auto_729287 ?auto_729289 ) ) ( not ( = ?auto_729287 ?auto_729290 ) ) ( not ( = ?auto_729287 ?auto_729291 ) ) ( not ( = ?auto_729287 ?auto_729292 ) ) ( not ( = ?auto_729287 ?auto_729293 ) ) ( not ( = ?auto_729287 ?auto_729294 ) ) ( not ( = ?auto_729287 ?auto_729295 ) ) ( not ( = ?auto_729287 ?auto_729296 ) ) ( not ( = ?auto_729287 ?auto_729297 ) ) ( not ( = ?auto_729287 ?auto_729298 ) ) ( not ( = ?auto_729287 ?auto_729299 ) ) ( not ( = ?auto_729287 ?auto_729300 ) ) ( not ( = ?auto_729288 ?auto_729289 ) ) ( not ( = ?auto_729288 ?auto_729290 ) ) ( not ( = ?auto_729288 ?auto_729291 ) ) ( not ( = ?auto_729288 ?auto_729292 ) ) ( not ( = ?auto_729288 ?auto_729293 ) ) ( not ( = ?auto_729288 ?auto_729294 ) ) ( not ( = ?auto_729288 ?auto_729295 ) ) ( not ( = ?auto_729288 ?auto_729296 ) ) ( not ( = ?auto_729288 ?auto_729297 ) ) ( not ( = ?auto_729288 ?auto_729298 ) ) ( not ( = ?auto_729288 ?auto_729299 ) ) ( not ( = ?auto_729288 ?auto_729300 ) ) ( not ( = ?auto_729289 ?auto_729290 ) ) ( not ( = ?auto_729289 ?auto_729291 ) ) ( not ( = ?auto_729289 ?auto_729292 ) ) ( not ( = ?auto_729289 ?auto_729293 ) ) ( not ( = ?auto_729289 ?auto_729294 ) ) ( not ( = ?auto_729289 ?auto_729295 ) ) ( not ( = ?auto_729289 ?auto_729296 ) ) ( not ( = ?auto_729289 ?auto_729297 ) ) ( not ( = ?auto_729289 ?auto_729298 ) ) ( not ( = ?auto_729289 ?auto_729299 ) ) ( not ( = ?auto_729289 ?auto_729300 ) ) ( not ( = ?auto_729290 ?auto_729291 ) ) ( not ( = ?auto_729290 ?auto_729292 ) ) ( not ( = ?auto_729290 ?auto_729293 ) ) ( not ( = ?auto_729290 ?auto_729294 ) ) ( not ( = ?auto_729290 ?auto_729295 ) ) ( not ( = ?auto_729290 ?auto_729296 ) ) ( not ( = ?auto_729290 ?auto_729297 ) ) ( not ( = ?auto_729290 ?auto_729298 ) ) ( not ( = ?auto_729290 ?auto_729299 ) ) ( not ( = ?auto_729290 ?auto_729300 ) ) ( not ( = ?auto_729291 ?auto_729292 ) ) ( not ( = ?auto_729291 ?auto_729293 ) ) ( not ( = ?auto_729291 ?auto_729294 ) ) ( not ( = ?auto_729291 ?auto_729295 ) ) ( not ( = ?auto_729291 ?auto_729296 ) ) ( not ( = ?auto_729291 ?auto_729297 ) ) ( not ( = ?auto_729291 ?auto_729298 ) ) ( not ( = ?auto_729291 ?auto_729299 ) ) ( not ( = ?auto_729291 ?auto_729300 ) ) ( not ( = ?auto_729292 ?auto_729293 ) ) ( not ( = ?auto_729292 ?auto_729294 ) ) ( not ( = ?auto_729292 ?auto_729295 ) ) ( not ( = ?auto_729292 ?auto_729296 ) ) ( not ( = ?auto_729292 ?auto_729297 ) ) ( not ( = ?auto_729292 ?auto_729298 ) ) ( not ( = ?auto_729292 ?auto_729299 ) ) ( not ( = ?auto_729292 ?auto_729300 ) ) ( not ( = ?auto_729293 ?auto_729294 ) ) ( not ( = ?auto_729293 ?auto_729295 ) ) ( not ( = ?auto_729293 ?auto_729296 ) ) ( not ( = ?auto_729293 ?auto_729297 ) ) ( not ( = ?auto_729293 ?auto_729298 ) ) ( not ( = ?auto_729293 ?auto_729299 ) ) ( not ( = ?auto_729293 ?auto_729300 ) ) ( not ( = ?auto_729294 ?auto_729295 ) ) ( not ( = ?auto_729294 ?auto_729296 ) ) ( not ( = ?auto_729294 ?auto_729297 ) ) ( not ( = ?auto_729294 ?auto_729298 ) ) ( not ( = ?auto_729294 ?auto_729299 ) ) ( not ( = ?auto_729294 ?auto_729300 ) ) ( not ( = ?auto_729295 ?auto_729296 ) ) ( not ( = ?auto_729295 ?auto_729297 ) ) ( not ( = ?auto_729295 ?auto_729298 ) ) ( not ( = ?auto_729295 ?auto_729299 ) ) ( not ( = ?auto_729295 ?auto_729300 ) ) ( not ( = ?auto_729296 ?auto_729297 ) ) ( not ( = ?auto_729296 ?auto_729298 ) ) ( not ( = ?auto_729296 ?auto_729299 ) ) ( not ( = ?auto_729296 ?auto_729300 ) ) ( not ( = ?auto_729297 ?auto_729298 ) ) ( not ( = ?auto_729297 ?auto_729299 ) ) ( not ( = ?auto_729297 ?auto_729300 ) ) ( not ( = ?auto_729298 ?auto_729299 ) ) ( not ( = ?auto_729298 ?auto_729300 ) ) ( not ( = ?auto_729299 ?auto_729300 ) ) ( ON ?auto_729298 ?auto_729299 ) ( ON ?auto_729297 ?auto_729298 ) ( ON ?auto_729296 ?auto_729297 ) ( CLEAR ?auto_729294 ) ( ON ?auto_729295 ?auto_729296 ) ( CLEAR ?auto_729295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_729285 ?auto_729286 ?auto_729287 ?auto_729288 ?auto_729289 ?auto_729290 ?auto_729291 ?auto_729292 ?auto_729293 ?auto_729294 ?auto_729295 )
      ( MAKE-15PILE ?auto_729285 ?auto_729286 ?auto_729287 ?auto_729288 ?auto_729289 ?auto_729290 ?auto_729291 ?auto_729292 ?auto_729293 ?auto_729294 ?auto_729295 ?auto_729296 ?auto_729297 ?auto_729298 ?auto_729299 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729347 - BLOCK
      ?auto_729348 - BLOCK
      ?auto_729349 - BLOCK
      ?auto_729350 - BLOCK
      ?auto_729351 - BLOCK
      ?auto_729352 - BLOCK
      ?auto_729353 - BLOCK
      ?auto_729354 - BLOCK
      ?auto_729355 - BLOCK
      ?auto_729356 - BLOCK
      ?auto_729357 - BLOCK
      ?auto_729358 - BLOCK
      ?auto_729359 - BLOCK
      ?auto_729360 - BLOCK
      ?auto_729361 - BLOCK
    )
    :vars
    (
      ?auto_729362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729361 ?auto_729362 ) ( ON-TABLE ?auto_729347 ) ( ON ?auto_729348 ?auto_729347 ) ( ON ?auto_729349 ?auto_729348 ) ( ON ?auto_729350 ?auto_729349 ) ( ON ?auto_729351 ?auto_729350 ) ( ON ?auto_729352 ?auto_729351 ) ( ON ?auto_729353 ?auto_729352 ) ( ON ?auto_729354 ?auto_729353 ) ( ON ?auto_729355 ?auto_729354 ) ( not ( = ?auto_729347 ?auto_729348 ) ) ( not ( = ?auto_729347 ?auto_729349 ) ) ( not ( = ?auto_729347 ?auto_729350 ) ) ( not ( = ?auto_729347 ?auto_729351 ) ) ( not ( = ?auto_729347 ?auto_729352 ) ) ( not ( = ?auto_729347 ?auto_729353 ) ) ( not ( = ?auto_729347 ?auto_729354 ) ) ( not ( = ?auto_729347 ?auto_729355 ) ) ( not ( = ?auto_729347 ?auto_729356 ) ) ( not ( = ?auto_729347 ?auto_729357 ) ) ( not ( = ?auto_729347 ?auto_729358 ) ) ( not ( = ?auto_729347 ?auto_729359 ) ) ( not ( = ?auto_729347 ?auto_729360 ) ) ( not ( = ?auto_729347 ?auto_729361 ) ) ( not ( = ?auto_729347 ?auto_729362 ) ) ( not ( = ?auto_729348 ?auto_729349 ) ) ( not ( = ?auto_729348 ?auto_729350 ) ) ( not ( = ?auto_729348 ?auto_729351 ) ) ( not ( = ?auto_729348 ?auto_729352 ) ) ( not ( = ?auto_729348 ?auto_729353 ) ) ( not ( = ?auto_729348 ?auto_729354 ) ) ( not ( = ?auto_729348 ?auto_729355 ) ) ( not ( = ?auto_729348 ?auto_729356 ) ) ( not ( = ?auto_729348 ?auto_729357 ) ) ( not ( = ?auto_729348 ?auto_729358 ) ) ( not ( = ?auto_729348 ?auto_729359 ) ) ( not ( = ?auto_729348 ?auto_729360 ) ) ( not ( = ?auto_729348 ?auto_729361 ) ) ( not ( = ?auto_729348 ?auto_729362 ) ) ( not ( = ?auto_729349 ?auto_729350 ) ) ( not ( = ?auto_729349 ?auto_729351 ) ) ( not ( = ?auto_729349 ?auto_729352 ) ) ( not ( = ?auto_729349 ?auto_729353 ) ) ( not ( = ?auto_729349 ?auto_729354 ) ) ( not ( = ?auto_729349 ?auto_729355 ) ) ( not ( = ?auto_729349 ?auto_729356 ) ) ( not ( = ?auto_729349 ?auto_729357 ) ) ( not ( = ?auto_729349 ?auto_729358 ) ) ( not ( = ?auto_729349 ?auto_729359 ) ) ( not ( = ?auto_729349 ?auto_729360 ) ) ( not ( = ?auto_729349 ?auto_729361 ) ) ( not ( = ?auto_729349 ?auto_729362 ) ) ( not ( = ?auto_729350 ?auto_729351 ) ) ( not ( = ?auto_729350 ?auto_729352 ) ) ( not ( = ?auto_729350 ?auto_729353 ) ) ( not ( = ?auto_729350 ?auto_729354 ) ) ( not ( = ?auto_729350 ?auto_729355 ) ) ( not ( = ?auto_729350 ?auto_729356 ) ) ( not ( = ?auto_729350 ?auto_729357 ) ) ( not ( = ?auto_729350 ?auto_729358 ) ) ( not ( = ?auto_729350 ?auto_729359 ) ) ( not ( = ?auto_729350 ?auto_729360 ) ) ( not ( = ?auto_729350 ?auto_729361 ) ) ( not ( = ?auto_729350 ?auto_729362 ) ) ( not ( = ?auto_729351 ?auto_729352 ) ) ( not ( = ?auto_729351 ?auto_729353 ) ) ( not ( = ?auto_729351 ?auto_729354 ) ) ( not ( = ?auto_729351 ?auto_729355 ) ) ( not ( = ?auto_729351 ?auto_729356 ) ) ( not ( = ?auto_729351 ?auto_729357 ) ) ( not ( = ?auto_729351 ?auto_729358 ) ) ( not ( = ?auto_729351 ?auto_729359 ) ) ( not ( = ?auto_729351 ?auto_729360 ) ) ( not ( = ?auto_729351 ?auto_729361 ) ) ( not ( = ?auto_729351 ?auto_729362 ) ) ( not ( = ?auto_729352 ?auto_729353 ) ) ( not ( = ?auto_729352 ?auto_729354 ) ) ( not ( = ?auto_729352 ?auto_729355 ) ) ( not ( = ?auto_729352 ?auto_729356 ) ) ( not ( = ?auto_729352 ?auto_729357 ) ) ( not ( = ?auto_729352 ?auto_729358 ) ) ( not ( = ?auto_729352 ?auto_729359 ) ) ( not ( = ?auto_729352 ?auto_729360 ) ) ( not ( = ?auto_729352 ?auto_729361 ) ) ( not ( = ?auto_729352 ?auto_729362 ) ) ( not ( = ?auto_729353 ?auto_729354 ) ) ( not ( = ?auto_729353 ?auto_729355 ) ) ( not ( = ?auto_729353 ?auto_729356 ) ) ( not ( = ?auto_729353 ?auto_729357 ) ) ( not ( = ?auto_729353 ?auto_729358 ) ) ( not ( = ?auto_729353 ?auto_729359 ) ) ( not ( = ?auto_729353 ?auto_729360 ) ) ( not ( = ?auto_729353 ?auto_729361 ) ) ( not ( = ?auto_729353 ?auto_729362 ) ) ( not ( = ?auto_729354 ?auto_729355 ) ) ( not ( = ?auto_729354 ?auto_729356 ) ) ( not ( = ?auto_729354 ?auto_729357 ) ) ( not ( = ?auto_729354 ?auto_729358 ) ) ( not ( = ?auto_729354 ?auto_729359 ) ) ( not ( = ?auto_729354 ?auto_729360 ) ) ( not ( = ?auto_729354 ?auto_729361 ) ) ( not ( = ?auto_729354 ?auto_729362 ) ) ( not ( = ?auto_729355 ?auto_729356 ) ) ( not ( = ?auto_729355 ?auto_729357 ) ) ( not ( = ?auto_729355 ?auto_729358 ) ) ( not ( = ?auto_729355 ?auto_729359 ) ) ( not ( = ?auto_729355 ?auto_729360 ) ) ( not ( = ?auto_729355 ?auto_729361 ) ) ( not ( = ?auto_729355 ?auto_729362 ) ) ( not ( = ?auto_729356 ?auto_729357 ) ) ( not ( = ?auto_729356 ?auto_729358 ) ) ( not ( = ?auto_729356 ?auto_729359 ) ) ( not ( = ?auto_729356 ?auto_729360 ) ) ( not ( = ?auto_729356 ?auto_729361 ) ) ( not ( = ?auto_729356 ?auto_729362 ) ) ( not ( = ?auto_729357 ?auto_729358 ) ) ( not ( = ?auto_729357 ?auto_729359 ) ) ( not ( = ?auto_729357 ?auto_729360 ) ) ( not ( = ?auto_729357 ?auto_729361 ) ) ( not ( = ?auto_729357 ?auto_729362 ) ) ( not ( = ?auto_729358 ?auto_729359 ) ) ( not ( = ?auto_729358 ?auto_729360 ) ) ( not ( = ?auto_729358 ?auto_729361 ) ) ( not ( = ?auto_729358 ?auto_729362 ) ) ( not ( = ?auto_729359 ?auto_729360 ) ) ( not ( = ?auto_729359 ?auto_729361 ) ) ( not ( = ?auto_729359 ?auto_729362 ) ) ( not ( = ?auto_729360 ?auto_729361 ) ) ( not ( = ?auto_729360 ?auto_729362 ) ) ( not ( = ?auto_729361 ?auto_729362 ) ) ( ON ?auto_729360 ?auto_729361 ) ( ON ?auto_729359 ?auto_729360 ) ( ON ?auto_729358 ?auto_729359 ) ( ON ?auto_729357 ?auto_729358 ) ( CLEAR ?auto_729355 ) ( ON ?auto_729356 ?auto_729357 ) ( CLEAR ?auto_729356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_729347 ?auto_729348 ?auto_729349 ?auto_729350 ?auto_729351 ?auto_729352 ?auto_729353 ?auto_729354 ?auto_729355 ?auto_729356 )
      ( MAKE-15PILE ?auto_729347 ?auto_729348 ?auto_729349 ?auto_729350 ?auto_729351 ?auto_729352 ?auto_729353 ?auto_729354 ?auto_729355 ?auto_729356 ?auto_729357 ?auto_729358 ?auto_729359 ?auto_729360 ?auto_729361 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729409 - BLOCK
      ?auto_729410 - BLOCK
      ?auto_729411 - BLOCK
      ?auto_729412 - BLOCK
      ?auto_729413 - BLOCK
      ?auto_729414 - BLOCK
      ?auto_729415 - BLOCK
      ?auto_729416 - BLOCK
      ?auto_729417 - BLOCK
      ?auto_729418 - BLOCK
      ?auto_729419 - BLOCK
      ?auto_729420 - BLOCK
      ?auto_729421 - BLOCK
      ?auto_729422 - BLOCK
      ?auto_729423 - BLOCK
    )
    :vars
    (
      ?auto_729424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729423 ?auto_729424 ) ( ON-TABLE ?auto_729409 ) ( ON ?auto_729410 ?auto_729409 ) ( ON ?auto_729411 ?auto_729410 ) ( ON ?auto_729412 ?auto_729411 ) ( ON ?auto_729413 ?auto_729412 ) ( ON ?auto_729414 ?auto_729413 ) ( ON ?auto_729415 ?auto_729414 ) ( ON ?auto_729416 ?auto_729415 ) ( not ( = ?auto_729409 ?auto_729410 ) ) ( not ( = ?auto_729409 ?auto_729411 ) ) ( not ( = ?auto_729409 ?auto_729412 ) ) ( not ( = ?auto_729409 ?auto_729413 ) ) ( not ( = ?auto_729409 ?auto_729414 ) ) ( not ( = ?auto_729409 ?auto_729415 ) ) ( not ( = ?auto_729409 ?auto_729416 ) ) ( not ( = ?auto_729409 ?auto_729417 ) ) ( not ( = ?auto_729409 ?auto_729418 ) ) ( not ( = ?auto_729409 ?auto_729419 ) ) ( not ( = ?auto_729409 ?auto_729420 ) ) ( not ( = ?auto_729409 ?auto_729421 ) ) ( not ( = ?auto_729409 ?auto_729422 ) ) ( not ( = ?auto_729409 ?auto_729423 ) ) ( not ( = ?auto_729409 ?auto_729424 ) ) ( not ( = ?auto_729410 ?auto_729411 ) ) ( not ( = ?auto_729410 ?auto_729412 ) ) ( not ( = ?auto_729410 ?auto_729413 ) ) ( not ( = ?auto_729410 ?auto_729414 ) ) ( not ( = ?auto_729410 ?auto_729415 ) ) ( not ( = ?auto_729410 ?auto_729416 ) ) ( not ( = ?auto_729410 ?auto_729417 ) ) ( not ( = ?auto_729410 ?auto_729418 ) ) ( not ( = ?auto_729410 ?auto_729419 ) ) ( not ( = ?auto_729410 ?auto_729420 ) ) ( not ( = ?auto_729410 ?auto_729421 ) ) ( not ( = ?auto_729410 ?auto_729422 ) ) ( not ( = ?auto_729410 ?auto_729423 ) ) ( not ( = ?auto_729410 ?auto_729424 ) ) ( not ( = ?auto_729411 ?auto_729412 ) ) ( not ( = ?auto_729411 ?auto_729413 ) ) ( not ( = ?auto_729411 ?auto_729414 ) ) ( not ( = ?auto_729411 ?auto_729415 ) ) ( not ( = ?auto_729411 ?auto_729416 ) ) ( not ( = ?auto_729411 ?auto_729417 ) ) ( not ( = ?auto_729411 ?auto_729418 ) ) ( not ( = ?auto_729411 ?auto_729419 ) ) ( not ( = ?auto_729411 ?auto_729420 ) ) ( not ( = ?auto_729411 ?auto_729421 ) ) ( not ( = ?auto_729411 ?auto_729422 ) ) ( not ( = ?auto_729411 ?auto_729423 ) ) ( not ( = ?auto_729411 ?auto_729424 ) ) ( not ( = ?auto_729412 ?auto_729413 ) ) ( not ( = ?auto_729412 ?auto_729414 ) ) ( not ( = ?auto_729412 ?auto_729415 ) ) ( not ( = ?auto_729412 ?auto_729416 ) ) ( not ( = ?auto_729412 ?auto_729417 ) ) ( not ( = ?auto_729412 ?auto_729418 ) ) ( not ( = ?auto_729412 ?auto_729419 ) ) ( not ( = ?auto_729412 ?auto_729420 ) ) ( not ( = ?auto_729412 ?auto_729421 ) ) ( not ( = ?auto_729412 ?auto_729422 ) ) ( not ( = ?auto_729412 ?auto_729423 ) ) ( not ( = ?auto_729412 ?auto_729424 ) ) ( not ( = ?auto_729413 ?auto_729414 ) ) ( not ( = ?auto_729413 ?auto_729415 ) ) ( not ( = ?auto_729413 ?auto_729416 ) ) ( not ( = ?auto_729413 ?auto_729417 ) ) ( not ( = ?auto_729413 ?auto_729418 ) ) ( not ( = ?auto_729413 ?auto_729419 ) ) ( not ( = ?auto_729413 ?auto_729420 ) ) ( not ( = ?auto_729413 ?auto_729421 ) ) ( not ( = ?auto_729413 ?auto_729422 ) ) ( not ( = ?auto_729413 ?auto_729423 ) ) ( not ( = ?auto_729413 ?auto_729424 ) ) ( not ( = ?auto_729414 ?auto_729415 ) ) ( not ( = ?auto_729414 ?auto_729416 ) ) ( not ( = ?auto_729414 ?auto_729417 ) ) ( not ( = ?auto_729414 ?auto_729418 ) ) ( not ( = ?auto_729414 ?auto_729419 ) ) ( not ( = ?auto_729414 ?auto_729420 ) ) ( not ( = ?auto_729414 ?auto_729421 ) ) ( not ( = ?auto_729414 ?auto_729422 ) ) ( not ( = ?auto_729414 ?auto_729423 ) ) ( not ( = ?auto_729414 ?auto_729424 ) ) ( not ( = ?auto_729415 ?auto_729416 ) ) ( not ( = ?auto_729415 ?auto_729417 ) ) ( not ( = ?auto_729415 ?auto_729418 ) ) ( not ( = ?auto_729415 ?auto_729419 ) ) ( not ( = ?auto_729415 ?auto_729420 ) ) ( not ( = ?auto_729415 ?auto_729421 ) ) ( not ( = ?auto_729415 ?auto_729422 ) ) ( not ( = ?auto_729415 ?auto_729423 ) ) ( not ( = ?auto_729415 ?auto_729424 ) ) ( not ( = ?auto_729416 ?auto_729417 ) ) ( not ( = ?auto_729416 ?auto_729418 ) ) ( not ( = ?auto_729416 ?auto_729419 ) ) ( not ( = ?auto_729416 ?auto_729420 ) ) ( not ( = ?auto_729416 ?auto_729421 ) ) ( not ( = ?auto_729416 ?auto_729422 ) ) ( not ( = ?auto_729416 ?auto_729423 ) ) ( not ( = ?auto_729416 ?auto_729424 ) ) ( not ( = ?auto_729417 ?auto_729418 ) ) ( not ( = ?auto_729417 ?auto_729419 ) ) ( not ( = ?auto_729417 ?auto_729420 ) ) ( not ( = ?auto_729417 ?auto_729421 ) ) ( not ( = ?auto_729417 ?auto_729422 ) ) ( not ( = ?auto_729417 ?auto_729423 ) ) ( not ( = ?auto_729417 ?auto_729424 ) ) ( not ( = ?auto_729418 ?auto_729419 ) ) ( not ( = ?auto_729418 ?auto_729420 ) ) ( not ( = ?auto_729418 ?auto_729421 ) ) ( not ( = ?auto_729418 ?auto_729422 ) ) ( not ( = ?auto_729418 ?auto_729423 ) ) ( not ( = ?auto_729418 ?auto_729424 ) ) ( not ( = ?auto_729419 ?auto_729420 ) ) ( not ( = ?auto_729419 ?auto_729421 ) ) ( not ( = ?auto_729419 ?auto_729422 ) ) ( not ( = ?auto_729419 ?auto_729423 ) ) ( not ( = ?auto_729419 ?auto_729424 ) ) ( not ( = ?auto_729420 ?auto_729421 ) ) ( not ( = ?auto_729420 ?auto_729422 ) ) ( not ( = ?auto_729420 ?auto_729423 ) ) ( not ( = ?auto_729420 ?auto_729424 ) ) ( not ( = ?auto_729421 ?auto_729422 ) ) ( not ( = ?auto_729421 ?auto_729423 ) ) ( not ( = ?auto_729421 ?auto_729424 ) ) ( not ( = ?auto_729422 ?auto_729423 ) ) ( not ( = ?auto_729422 ?auto_729424 ) ) ( not ( = ?auto_729423 ?auto_729424 ) ) ( ON ?auto_729422 ?auto_729423 ) ( ON ?auto_729421 ?auto_729422 ) ( ON ?auto_729420 ?auto_729421 ) ( ON ?auto_729419 ?auto_729420 ) ( ON ?auto_729418 ?auto_729419 ) ( CLEAR ?auto_729416 ) ( ON ?auto_729417 ?auto_729418 ) ( CLEAR ?auto_729417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_729409 ?auto_729410 ?auto_729411 ?auto_729412 ?auto_729413 ?auto_729414 ?auto_729415 ?auto_729416 ?auto_729417 )
      ( MAKE-15PILE ?auto_729409 ?auto_729410 ?auto_729411 ?auto_729412 ?auto_729413 ?auto_729414 ?auto_729415 ?auto_729416 ?auto_729417 ?auto_729418 ?auto_729419 ?auto_729420 ?auto_729421 ?auto_729422 ?auto_729423 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729471 - BLOCK
      ?auto_729472 - BLOCK
      ?auto_729473 - BLOCK
      ?auto_729474 - BLOCK
      ?auto_729475 - BLOCK
      ?auto_729476 - BLOCK
      ?auto_729477 - BLOCK
      ?auto_729478 - BLOCK
      ?auto_729479 - BLOCK
      ?auto_729480 - BLOCK
      ?auto_729481 - BLOCK
      ?auto_729482 - BLOCK
      ?auto_729483 - BLOCK
      ?auto_729484 - BLOCK
      ?auto_729485 - BLOCK
    )
    :vars
    (
      ?auto_729486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729485 ?auto_729486 ) ( ON-TABLE ?auto_729471 ) ( ON ?auto_729472 ?auto_729471 ) ( ON ?auto_729473 ?auto_729472 ) ( ON ?auto_729474 ?auto_729473 ) ( ON ?auto_729475 ?auto_729474 ) ( ON ?auto_729476 ?auto_729475 ) ( ON ?auto_729477 ?auto_729476 ) ( not ( = ?auto_729471 ?auto_729472 ) ) ( not ( = ?auto_729471 ?auto_729473 ) ) ( not ( = ?auto_729471 ?auto_729474 ) ) ( not ( = ?auto_729471 ?auto_729475 ) ) ( not ( = ?auto_729471 ?auto_729476 ) ) ( not ( = ?auto_729471 ?auto_729477 ) ) ( not ( = ?auto_729471 ?auto_729478 ) ) ( not ( = ?auto_729471 ?auto_729479 ) ) ( not ( = ?auto_729471 ?auto_729480 ) ) ( not ( = ?auto_729471 ?auto_729481 ) ) ( not ( = ?auto_729471 ?auto_729482 ) ) ( not ( = ?auto_729471 ?auto_729483 ) ) ( not ( = ?auto_729471 ?auto_729484 ) ) ( not ( = ?auto_729471 ?auto_729485 ) ) ( not ( = ?auto_729471 ?auto_729486 ) ) ( not ( = ?auto_729472 ?auto_729473 ) ) ( not ( = ?auto_729472 ?auto_729474 ) ) ( not ( = ?auto_729472 ?auto_729475 ) ) ( not ( = ?auto_729472 ?auto_729476 ) ) ( not ( = ?auto_729472 ?auto_729477 ) ) ( not ( = ?auto_729472 ?auto_729478 ) ) ( not ( = ?auto_729472 ?auto_729479 ) ) ( not ( = ?auto_729472 ?auto_729480 ) ) ( not ( = ?auto_729472 ?auto_729481 ) ) ( not ( = ?auto_729472 ?auto_729482 ) ) ( not ( = ?auto_729472 ?auto_729483 ) ) ( not ( = ?auto_729472 ?auto_729484 ) ) ( not ( = ?auto_729472 ?auto_729485 ) ) ( not ( = ?auto_729472 ?auto_729486 ) ) ( not ( = ?auto_729473 ?auto_729474 ) ) ( not ( = ?auto_729473 ?auto_729475 ) ) ( not ( = ?auto_729473 ?auto_729476 ) ) ( not ( = ?auto_729473 ?auto_729477 ) ) ( not ( = ?auto_729473 ?auto_729478 ) ) ( not ( = ?auto_729473 ?auto_729479 ) ) ( not ( = ?auto_729473 ?auto_729480 ) ) ( not ( = ?auto_729473 ?auto_729481 ) ) ( not ( = ?auto_729473 ?auto_729482 ) ) ( not ( = ?auto_729473 ?auto_729483 ) ) ( not ( = ?auto_729473 ?auto_729484 ) ) ( not ( = ?auto_729473 ?auto_729485 ) ) ( not ( = ?auto_729473 ?auto_729486 ) ) ( not ( = ?auto_729474 ?auto_729475 ) ) ( not ( = ?auto_729474 ?auto_729476 ) ) ( not ( = ?auto_729474 ?auto_729477 ) ) ( not ( = ?auto_729474 ?auto_729478 ) ) ( not ( = ?auto_729474 ?auto_729479 ) ) ( not ( = ?auto_729474 ?auto_729480 ) ) ( not ( = ?auto_729474 ?auto_729481 ) ) ( not ( = ?auto_729474 ?auto_729482 ) ) ( not ( = ?auto_729474 ?auto_729483 ) ) ( not ( = ?auto_729474 ?auto_729484 ) ) ( not ( = ?auto_729474 ?auto_729485 ) ) ( not ( = ?auto_729474 ?auto_729486 ) ) ( not ( = ?auto_729475 ?auto_729476 ) ) ( not ( = ?auto_729475 ?auto_729477 ) ) ( not ( = ?auto_729475 ?auto_729478 ) ) ( not ( = ?auto_729475 ?auto_729479 ) ) ( not ( = ?auto_729475 ?auto_729480 ) ) ( not ( = ?auto_729475 ?auto_729481 ) ) ( not ( = ?auto_729475 ?auto_729482 ) ) ( not ( = ?auto_729475 ?auto_729483 ) ) ( not ( = ?auto_729475 ?auto_729484 ) ) ( not ( = ?auto_729475 ?auto_729485 ) ) ( not ( = ?auto_729475 ?auto_729486 ) ) ( not ( = ?auto_729476 ?auto_729477 ) ) ( not ( = ?auto_729476 ?auto_729478 ) ) ( not ( = ?auto_729476 ?auto_729479 ) ) ( not ( = ?auto_729476 ?auto_729480 ) ) ( not ( = ?auto_729476 ?auto_729481 ) ) ( not ( = ?auto_729476 ?auto_729482 ) ) ( not ( = ?auto_729476 ?auto_729483 ) ) ( not ( = ?auto_729476 ?auto_729484 ) ) ( not ( = ?auto_729476 ?auto_729485 ) ) ( not ( = ?auto_729476 ?auto_729486 ) ) ( not ( = ?auto_729477 ?auto_729478 ) ) ( not ( = ?auto_729477 ?auto_729479 ) ) ( not ( = ?auto_729477 ?auto_729480 ) ) ( not ( = ?auto_729477 ?auto_729481 ) ) ( not ( = ?auto_729477 ?auto_729482 ) ) ( not ( = ?auto_729477 ?auto_729483 ) ) ( not ( = ?auto_729477 ?auto_729484 ) ) ( not ( = ?auto_729477 ?auto_729485 ) ) ( not ( = ?auto_729477 ?auto_729486 ) ) ( not ( = ?auto_729478 ?auto_729479 ) ) ( not ( = ?auto_729478 ?auto_729480 ) ) ( not ( = ?auto_729478 ?auto_729481 ) ) ( not ( = ?auto_729478 ?auto_729482 ) ) ( not ( = ?auto_729478 ?auto_729483 ) ) ( not ( = ?auto_729478 ?auto_729484 ) ) ( not ( = ?auto_729478 ?auto_729485 ) ) ( not ( = ?auto_729478 ?auto_729486 ) ) ( not ( = ?auto_729479 ?auto_729480 ) ) ( not ( = ?auto_729479 ?auto_729481 ) ) ( not ( = ?auto_729479 ?auto_729482 ) ) ( not ( = ?auto_729479 ?auto_729483 ) ) ( not ( = ?auto_729479 ?auto_729484 ) ) ( not ( = ?auto_729479 ?auto_729485 ) ) ( not ( = ?auto_729479 ?auto_729486 ) ) ( not ( = ?auto_729480 ?auto_729481 ) ) ( not ( = ?auto_729480 ?auto_729482 ) ) ( not ( = ?auto_729480 ?auto_729483 ) ) ( not ( = ?auto_729480 ?auto_729484 ) ) ( not ( = ?auto_729480 ?auto_729485 ) ) ( not ( = ?auto_729480 ?auto_729486 ) ) ( not ( = ?auto_729481 ?auto_729482 ) ) ( not ( = ?auto_729481 ?auto_729483 ) ) ( not ( = ?auto_729481 ?auto_729484 ) ) ( not ( = ?auto_729481 ?auto_729485 ) ) ( not ( = ?auto_729481 ?auto_729486 ) ) ( not ( = ?auto_729482 ?auto_729483 ) ) ( not ( = ?auto_729482 ?auto_729484 ) ) ( not ( = ?auto_729482 ?auto_729485 ) ) ( not ( = ?auto_729482 ?auto_729486 ) ) ( not ( = ?auto_729483 ?auto_729484 ) ) ( not ( = ?auto_729483 ?auto_729485 ) ) ( not ( = ?auto_729483 ?auto_729486 ) ) ( not ( = ?auto_729484 ?auto_729485 ) ) ( not ( = ?auto_729484 ?auto_729486 ) ) ( not ( = ?auto_729485 ?auto_729486 ) ) ( ON ?auto_729484 ?auto_729485 ) ( ON ?auto_729483 ?auto_729484 ) ( ON ?auto_729482 ?auto_729483 ) ( ON ?auto_729481 ?auto_729482 ) ( ON ?auto_729480 ?auto_729481 ) ( ON ?auto_729479 ?auto_729480 ) ( CLEAR ?auto_729477 ) ( ON ?auto_729478 ?auto_729479 ) ( CLEAR ?auto_729478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_729471 ?auto_729472 ?auto_729473 ?auto_729474 ?auto_729475 ?auto_729476 ?auto_729477 ?auto_729478 )
      ( MAKE-15PILE ?auto_729471 ?auto_729472 ?auto_729473 ?auto_729474 ?auto_729475 ?auto_729476 ?auto_729477 ?auto_729478 ?auto_729479 ?auto_729480 ?auto_729481 ?auto_729482 ?auto_729483 ?auto_729484 ?auto_729485 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729533 - BLOCK
      ?auto_729534 - BLOCK
      ?auto_729535 - BLOCK
      ?auto_729536 - BLOCK
      ?auto_729537 - BLOCK
      ?auto_729538 - BLOCK
      ?auto_729539 - BLOCK
      ?auto_729540 - BLOCK
      ?auto_729541 - BLOCK
      ?auto_729542 - BLOCK
      ?auto_729543 - BLOCK
      ?auto_729544 - BLOCK
      ?auto_729545 - BLOCK
      ?auto_729546 - BLOCK
      ?auto_729547 - BLOCK
    )
    :vars
    (
      ?auto_729548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729547 ?auto_729548 ) ( ON-TABLE ?auto_729533 ) ( ON ?auto_729534 ?auto_729533 ) ( ON ?auto_729535 ?auto_729534 ) ( ON ?auto_729536 ?auto_729535 ) ( ON ?auto_729537 ?auto_729536 ) ( ON ?auto_729538 ?auto_729537 ) ( not ( = ?auto_729533 ?auto_729534 ) ) ( not ( = ?auto_729533 ?auto_729535 ) ) ( not ( = ?auto_729533 ?auto_729536 ) ) ( not ( = ?auto_729533 ?auto_729537 ) ) ( not ( = ?auto_729533 ?auto_729538 ) ) ( not ( = ?auto_729533 ?auto_729539 ) ) ( not ( = ?auto_729533 ?auto_729540 ) ) ( not ( = ?auto_729533 ?auto_729541 ) ) ( not ( = ?auto_729533 ?auto_729542 ) ) ( not ( = ?auto_729533 ?auto_729543 ) ) ( not ( = ?auto_729533 ?auto_729544 ) ) ( not ( = ?auto_729533 ?auto_729545 ) ) ( not ( = ?auto_729533 ?auto_729546 ) ) ( not ( = ?auto_729533 ?auto_729547 ) ) ( not ( = ?auto_729533 ?auto_729548 ) ) ( not ( = ?auto_729534 ?auto_729535 ) ) ( not ( = ?auto_729534 ?auto_729536 ) ) ( not ( = ?auto_729534 ?auto_729537 ) ) ( not ( = ?auto_729534 ?auto_729538 ) ) ( not ( = ?auto_729534 ?auto_729539 ) ) ( not ( = ?auto_729534 ?auto_729540 ) ) ( not ( = ?auto_729534 ?auto_729541 ) ) ( not ( = ?auto_729534 ?auto_729542 ) ) ( not ( = ?auto_729534 ?auto_729543 ) ) ( not ( = ?auto_729534 ?auto_729544 ) ) ( not ( = ?auto_729534 ?auto_729545 ) ) ( not ( = ?auto_729534 ?auto_729546 ) ) ( not ( = ?auto_729534 ?auto_729547 ) ) ( not ( = ?auto_729534 ?auto_729548 ) ) ( not ( = ?auto_729535 ?auto_729536 ) ) ( not ( = ?auto_729535 ?auto_729537 ) ) ( not ( = ?auto_729535 ?auto_729538 ) ) ( not ( = ?auto_729535 ?auto_729539 ) ) ( not ( = ?auto_729535 ?auto_729540 ) ) ( not ( = ?auto_729535 ?auto_729541 ) ) ( not ( = ?auto_729535 ?auto_729542 ) ) ( not ( = ?auto_729535 ?auto_729543 ) ) ( not ( = ?auto_729535 ?auto_729544 ) ) ( not ( = ?auto_729535 ?auto_729545 ) ) ( not ( = ?auto_729535 ?auto_729546 ) ) ( not ( = ?auto_729535 ?auto_729547 ) ) ( not ( = ?auto_729535 ?auto_729548 ) ) ( not ( = ?auto_729536 ?auto_729537 ) ) ( not ( = ?auto_729536 ?auto_729538 ) ) ( not ( = ?auto_729536 ?auto_729539 ) ) ( not ( = ?auto_729536 ?auto_729540 ) ) ( not ( = ?auto_729536 ?auto_729541 ) ) ( not ( = ?auto_729536 ?auto_729542 ) ) ( not ( = ?auto_729536 ?auto_729543 ) ) ( not ( = ?auto_729536 ?auto_729544 ) ) ( not ( = ?auto_729536 ?auto_729545 ) ) ( not ( = ?auto_729536 ?auto_729546 ) ) ( not ( = ?auto_729536 ?auto_729547 ) ) ( not ( = ?auto_729536 ?auto_729548 ) ) ( not ( = ?auto_729537 ?auto_729538 ) ) ( not ( = ?auto_729537 ?auto_729539 ) ) ( not ( = ?auto_729537 ?auto_729540 ) ) ( not ( = ?auto_729537 ?auto_729541 ) ) ( not ( = ?auto_729537 ?auto_729542 ) ) ( not ( = ?auto_729537 ?auto_729543 ) ) ( not ( = ?auto_729537 ?auto_729544 ) ) ( not ( = ?auto_729537 ?auto_729545 ) ) ( not ( = ?auto_729537 ?auto_729546 ) ) ( not ( = ?auto_729537 ?auto_729547 ) ) ( not ( = ?auto_729537 ?auto_729548 ) ) ( not ( = ?auto_729538 ?auto_729539 ) ) ( not ( = ?auto_729538 ?auto_729540 ) ) ( not ( = ?auto_729538 ?auto_729541 ) ) ( not ( = ?auto_729538 ?auto_729542 ) ) ( not ( = ?auto_729538 ?auto_729543 ) ) ( not ( = ?auto_729538 ?auto_729544 ) ) ( not ( = ?auto_729538 ?auto_729545 ) ) ( not ( = ?auto_729538 ?auto_729546 ) ) ( not ( = ?auto_729538 ?auto_729547 ) ) ( not ( = ?auto_729538 ?auto_729548 ) ) ( not ( = ?auto_729539 ?auto_729540 ) ) ( not ( = ?auto_729539 ?auto_729541 ) ) ( not ( = ?auto_729539 ?auto_729542 ) ) ( not ( = ?auto_729539 ?auto_729543 ) ) ( not ( = ?auto_729539 ?auto_729544 ) ) ( not ( = ?auto_729539 ?auto_729545 ) ) ( not ( = ?auto_729539 ?auto_729546 ) ) ( not ( = ?auto_729539 ?auto_729547 ) ) ( not ( = ?auto_729539 ?auto_729548 ) ) ( not ( = ?auto_729540 ?auto_729541 ) ) ( not ( = ?auto_729540 ?auto_729542 ) ) ( not ( = ?auto_729540 ?auto_729543 ) ) ( not ( = ?auto_729540 ?auto_729544 ) ) ( not ( = ?auto_729540 ?auto_729545 ) ) ( not ( = ?auto_729540 ?auto_729546 ) ) ( not ( = ?auto_729540 ?auto_729547 ) ) ( not ( = ?auto_729540 ?auto_729548 ) ) ( not ( = ?auto_729541 ?auto_729542 ) ) ( not ( = ?auto_729541 ?auto_729543 ) ) ( not ( = ?auto_729541 ?auto_729544 ) ) ( not ( = ?auto_729541 ?auto_729545 ) ) ( not ( = ?auto_729541 ?auto_729546 ) ) ( not ( = ?auto_729541 ?auto_729547 ) ) ( not ( = ?auto_729541 ?auto_729548 ) ) ( not ( = ?auto_729542 ?auto_729543 ) ) ( not ( = ?auto_729542 ?auto_729544 ) ) ( not ( = ?auto_729542 ?auto_729545 ) ) ( not ( = ?auto_729542 ?auto_729546 ) ) ( not ( = ?auto_729542 ?auto_729547 ) ) ( not ( = ?auto_729542 ?auto_729548 ) ) ( not ( = ?auto_729543 ?auto_729544 ) ) ( not ( = ?auto_729543 ?auto_729545 ) ) ( not ( = ?auto_729543 ?auto_729546 ) ) ( not ( = ?auto_729543 ?auto_729547 ) ) ( not ( = ?auto_729543 ?auto_729548 ) ) ( not ( = ?auto_729544 ?auto_729545 ) ) ( not ( = ?auto_729544 ?auto_729546 ) ) ( not ( = ?auto_729544 ?auto_729547 ) ) ( not ( = ?auto_729544 ?auto_729548 ) ) ( not ( = ?auto_729545 ?auto_729546 ) ) ( not ( = ?auto_729545 ?auto_729547 ) ) ( not ( = ?auto_729545 ?auto_729548 ) ) ( not ( = ?auto_729546 ?auto_729547 ) ) ( not ( = ?auto_729546 ?auto_729548 ) ) ( not ( = ?auto_729547 ?auto_729548 ) ) ( ON ?auto_729546 ?auto_729547 ) ( ON ?auto_729545 ?auto_729546 ) ( ON ?auto_729544 ?auto_729545 ) ( ON ?auto_729543 ?auto_729544 ) ( ON ?auto_729542 ?auto_729543 ) ( ON ?auto_729541 ?auto_729542 ) ( ON ?auto_729540 ?auto_729541 ) ( CLEAR ?auto_729538 ) ( ON ?auto_729539 ?auto_729540 ) ( CLEAR ?auto_729539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_729533 ?auto_729534 ?auto_729535 ?auto_729536 ?auto_729537 ?auto_729538 ?auto_729539 )
      ( MAKE-15PILE ?auto_729533 ?auto_729534 ?auto_729535 ?auto_729536 ?auto_729537 ?auto_729538 ?auto_729539 ?auto_729540 ?auto_729541 ?auto_729542 ?auto_729543 ?auto_729544 ?auto_729545 ?auto_729546 ?auto_729547 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729595 - BLOCK
      ?auto_729596 - BLOCK
      ?auto_729597 - BLOCK
      ?auto_729598 - BLOCK
      ?auto_729599 - BLOCK
      ?auto_729600 - BLOCK
      ?auto_729601 - BLOCK
      ?auto_729602 - BLOCK
      ?auto_729603 - BLOCK
      ?auto_729604 - BLOCK
      ?auto_729605 - BLOCK
      ?auto_729606 - BLOCK
      ?auto_729607 - BLOCK
      ?auto_729608 - BLOCK
      ?auto_729609 - BLOCK
    )
    :vars
    (
      ?auto_729610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729609 ?auto_729610 ) ( ON-TABLE ?auto_729595 ) ( ON ?auto_729596 ?auto_729595 ) ( ON ?auto_729597 ?auto_729596 ) ( ON ?auto_729598 ?auto_729597 ) ( ON ?auto_729599 ?auto_729598 ) ( not ( = ?auto_729595 ?auto_729596 ) ) ( not ( = ?auto_729595 ?auto_729597 ) ) ( not ( = ?auto_729595 ?auto_729598 ) ) ( not ( = ?auto_729595 ?auto_729599 ) ) ( not ( = ?auto_729595 ?auto_729600 ) ) ( not ( = ?auto_729595 ?auto_729601 ) ) ( not ( = ?auto_729595 ?auto_729602 ) ) ( not ( = ?auto_729595 ?auto_729603 ) ) ( not ( = ?auto_729595 ?auto_729604 ) ) ( not ( = ?auto_729595 ?auto_729605 ) ) ( not ( = ?auto_729595 ?auto_729606 ) ) ( not ( = ?auto_729595 ?auto_729607 ) ) ( not ( = ?auto_729595 ?auto_729608 ) ) ( not ( = ?auto_729595 ?auto_729609 ) ) ( not ( = ?auto_729595 ?auto_729610 ) ) ( not ( = ?auto_729596 ?auto_729597 ) ) ( not ( = ?auto_729596 ?auto_729598 ) ) ( not ( = ?auto_729596 ?auto_729599 ) ) ( not ( = ?auto_729596 ?auto_729600 ) ) ( not ( = ?auto_729596 ?auto_729601 ) ) ( not ( = ?auto_729596 ?auto_729602 ) ) ( not ( = ?auto_729596 ?auto_729603 ) ) ( not ( = ?auto_729596 ?auto_729604 ) ) ( not ( = ?auto_729596 ?auto_729605 ) ) ( not ( = ?auto_729596 ?auto_729606 ) ) ( not ( = ?auto_729596 ?auto_729607 ) ) ( not ( = ?auto_729596 ?auto_729608 ) ) ( not ( = ?auto_729596 ?auto_729609 ) ) ( not ( = ?auto_729596 ?auto_729610 ) ) ( not ( = ?auto_729597 ?auto_729598 ) ) ( not ( = ?auto_729597 ?auto_729599 ) ) ( not ( = ?auto_729597 ?auto_729600 ) ) ( not ( = ?auto_729597 ?auto_729601 ) ) ( not ( = ?auto_729597 ?auto_729602 ) ) ( not ( = ?auto_729597 ?auto_729603 ) ) ( not ( = ?auto_729597 ?auto_729604 ) ) ( not ( = ?auto_729597 ?auto_729605 ) ) ( not ( = ?auto_729597 ?auto_729606 ) ) ( not ( = ?auto_729597 ?auto_729607 ) ) ( not ( = ?auto_729597 ?auto_729608 ) ) ( not ( = ?auto_729597 ?auto_729609 ) ) ( not ( = ?auto_729597 ?auto_729610 ) ) ( not ( = ?auto_729598 ?auto_729599 ) ) ( not ( = ?auto_729598 ?auto_729600 ) ) ( not ( = ?auto_729598 ?auto_729601 ) ) ( not ( = ?auto_729598 ?auto_729602 ) ) ( not ( = ?auto_729598 ?auto_729603 ) ) ( not ( = ?auto_729598 ?auto_729604 ) ) ( not ( = ?auto_729598 ?auto_729605 ) ) ( not ( = ?auto_729598 ?auto_729606 ) ) ( not ( = ?auto_729598 ?auto_729607 ) ) ( not ( = ?auto_729598 ?auto_729608 ) ) ( not ( = ?auto_729598 ?auto_729609 ) ) ( not ( = ?auto_729598 ?auto_729610 ) ) ( not ( = ?auto_729599 ?auto_729600 ) ) ( not ( = ?auto_729599 ?auto_729601 ) ) ( not ( = ?auto_729599 ?auto_729602 ) ) ( not ( = ?auto_729599 ?auto_729603 ) ) ( not ( = ?auto_729599 ?auto_729604 ) ) ( not ( = ?auto_729599 ?auto_729605 ) ) ( not ( = ?auto_729599 ?auto_729606 ) ) ( not ( = ?auto_729599 ?auto_729607 ) ) ( not ( = ?auto_729599 ?auto_729608 ) ) ( not ( = ?auto_729599 ?auto_729609 ) ) ( not ( = ?auto_729599 ?auto_729610 ) ) ( not ( = ?auto_729600 ?auto_729601 ) ) ( not ( = ?auto_729600 ?auto_729602 ) ) ( not ( = ?auto_729600 ?auto_729603 ) ) ( not ( = ?auto_729600 ?auto_729604 ) ) ( not ( = ?auto_729600 ?auto_729605 ) ) ( not ( = ?auto_729600 ?auto_729606 ) ) ( not ( = ?auto_729600 ?auto_729607 ) ) ( not ( = ?auto_729600 ?auto_729608 ) ) ( not ( = ?auto_729600 ?auto_729609 ) ) ( not ( = ?auto_729600 ?auto_729610 ) ) ( not ( = ?auto_729601 ?auto_729602 ) ) ( not ( = ?auto_729601 ?auto_729603 ) ) ( not ( = ?auto_729601 ?auto_729604 ) ) ( not ( = ?auto_729601 ?auto_729605 ) ) ( not ( = ?auto_729601 ?auto_729606 ) ) ( not ( = ?auto_729601 ?auto_729607 ) ) ( not ( = ?auto_729601 ?auto_729608 ) ) ( not ( = ?auto_729601 ?auto_729609 ) ) ( not ( = ?auto_729601 ?auto_729610 ) ) ( not ( = ?auto_729602 ?auto_729603 ) ) ( not ( = ?auto_729602 ?auto_729604 ) ) ( not ( = ?auto_729602 ?auto_729605 ) ) ( not ( = ?auto_729602 ?auto_729606 ) ) ( not ( = ?auto_729602 ?auto_729607 ) ) ( not ( = ?auto_729602 ?auto_729608 ) ) ( not ( = ?auto_729602 ?auto_729609 ) ) ( not ( = ?auto_729602 ?auto_729610 ) ) ( not ( = ?auto_729603 ?auto_729604 ) ) ( not ( = ?auto_729603 ?auto_729605 ) ) ( not ( = ?auto_729603 ?auto_729606 ) ) ( not ( = ?auto_729603 ?auto_729607 ) ) ( not ( = ?auto_729603 ?auto_729608 ) ) ( not ( = ?auto_729603 ?auto_729609 ) ) ( not ( = ?auto_729603 ?auto_729610 ) ) ( not ( = ?auto_729604 ?auto_729605 ) ) ( not ( = ?auto_729604 ?auto_729606 ) ) ( not ( = ?auto_729604 ?auto_729607 ) ) ( not ( = ?auto_729604 ?auto_729608 ) ) ( not ( = ?auto_729604 ?auto_729609 ) ) ( not ( = ?auto_729604 ?auto_729610 ) ) ( not ( = ?auto_729605 ?auto_729606 ) ) ( not ( = ?auto_729605 ?auto_729607 ) ) ( not ( = ?auto_729605 ?auto_729608 ) ) ( not ( = ?auto_729605 ?auto_729609 ) ) ( not ( = ?auto_729605 ?auto_729610 ) ) ( not ( = ?auto_729606 ?auto_729607 ) ) ( not ( = ?auto_729606 ?auto_729608 ) ) ( not ( = ?auto_729606 ?auto_729609 ) ) ( not ( = ?auto_729606 ?auto_729610 ) ) ( not ( = ?auto_729607 ?auto_729608 ) ) ( not ( = ?auto_729607 ?auto_729609 ) ) ( not ( = ?auto_729607 ?auto_729610 ) ) ( not ( = ?auto_729608 ?auto_729609 ) ) ( not ( = ?auto_729608 ?auto_729610 ) ) ( not ( = ?auto_729609 ?auto_729610 ) ) ( ON ?auto_729608 ?auto_729609 ) ( ON ?auto_729607 ?auto_729608 ) ( ON ?auto_729606 ?auto_729607 ) ( ON ?auto_729605 ?auto_729606 ) ( ON ?auto_729604 ?auto_729605 ) ( ON ?auto_729603 ?auto_729604 ) ( ON ?auto_729602 ?auto_729603 ) ( ON ?auto_729601 ?auto_729602 ) ( CLEAR ?auto_729599 ) ( ON ?auto_729600 ?auto_729601 ) ( CLEAR ?auto_729600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_729595 ?auto_729596 ?auto_729597 ?auto_729598 ?auto_729599 ?auto_729600 )
      ( MAKE-15PILE ?auto_729595 ?auto_729596 ?auto_729597 ?auto_729598 ?auto_729599 ?auto_729600 ?auto_729601 ?auto_729602 ?auto_729603 ?auto_729604 ?auto_729605 ?auto_729606 ?auto_729607 ?auto_729608 ?auto_729609 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729657 - BLOCK
      ?auto_729658 - BLOCK
      ?auto_729659 - BLOCK
      ?auto_729660 - BLOCK
      ?auto_729661 - BLOCK
      ?auto_729662 - BLOCK
      ?auto_729663 - BLOCK
      ?auto_729664 - BLOCK
      ?auto_729665 - BLOCK
      ?auto_729666 - BLOCK
      ?auto_729667 - BLOCK
      ?auto_729668 - BLOCK
      ?auto_729669 - BLOCK
      ?auto_729670 - BLOCK
      ?auto_729671 - BLOCK
    )
    :vars
    (
      ?auto_729672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729671 ?auto_729672 ) ( ON-TABLE ?auto_729657 ) ( ON ?auto_729658 ?auto_729657 ) ( ON ?auto_729659 ?auto_729658 ) ( ON ?auto_729660 ?auto_729659 ) ( not ( = ?auto_729657 ?auto_729658 ) ) ( not ( = ?auto_729657 ?auto_729659 ) ) ( not ( = ?auto_729657 ?auto_729660 ) ) ( not ( = ?auto_729657 ?auto_729661 ) ) ( not ( = ?auto_729657 ?auto_729662 ) ) ( not ( = ?auto_729657 ?auto_729663 ) ) ( not ( = ?auto_729657 ?auto_729664 ) ) ( not ( = ?auto_729657 ?auto_729665 ) ) ( not ( = ?auto_729657 ?auto_729666 ) ) ( not ( = ?auto_729657 ?auto_729667 ) ) ( not ( = ?auto_729657 ?auto_729668 ) ) ( not ( = ?auto_729657 ?auto_729669 ) ) ( not ( = ?auto_729657 ?auto_729670 ) ) ( not ( = ?auto_729657 ?auto_729671 ) ) ( not ( = ?auto_729657 ?auto_729672 ) ) ( not ( = ?auto_729658 ?auto_729659 ) ) ( not ( = ?auto_729658 ?auto_729660 ) ) ( not ( = ?auto_729658 ?auto_729661 ) ) ( not ( = ?auto_729658 ?auto_729662 ) ) ( not ( = ?auto_729658 ?auto_729663 ) ) ( not ( = ?auto_729658 ?auto_729664 ) ) ( not ( = ?auto_729658 ?auto_729665 ) ) ( not ( = ?auto_729658 ?auto_729666 ) ) ( not ( = ?auto_729658 ?auto_729667 ) ) ( not ( = ?auto_729658 ?auto_729668 ) ) ( not ( = ?auto_729658 ?auto_729669 ) ) ( not ( = ?auto_729658 ?auto_729670 ) ) ( not ( = ?auto_729658 ?auto_729671 ) ) ( not ( = ?auto_729658 ?auto_729672 ) ) ( not ( = ?auto_729659 ?auto_729660 ) ) ( not ( = ?auto_729659 ?auto_729661 ) ) ( not ( = ?auto_729659 ?auto_729662 ) ) ( not ( = ?auto_729659 ?auto_729663 ) ) ( not ( = ?auto_729659 ?auto_729664 ) ) ( not ( = ?auto_729659 ?auto_729665 ) ) ( not ( = ?auto_729659 ?auto_729666 ) ) ( not ( = ?auto_729659 ?auto_729667 ) ) ( not ( = ?auto_729659 ?auto_729668 ) ) ( not ( = ?auto_729659 ?auto_729669 ) ) ( not ( = ?auto_729659 ?auto_729670 ) ) ( not ( = ?auto_729659 ?auto_729671 ) ) ( not ( = ?auto_729659 ?auto_729672 ) ) ( not ( = ?auto_729660 ?auto_729661 ) ) ( not ( = ?auto_729660 ?auto_729662 ) ) ( not ( = ?auto_729660 ?auto_729663 ) ) ( not ( = ?auto_729660 ?auto_729664 ) ) ( not ( = ?auto_729660 ?auto_729665 ) ) ( not ( = ?auto_729660 ?auto_729666 ) ) ( not ( = ?auto_729660 ?auto_729667 ) ) ( not ( = ?auto_729660 ?auto_729668 ) ) ( not ( = ?auto_729660 ?auto_729669 ) ) ( not ( = ?auto_729660 ?auto_729670 ) ) ( not ( = ?auto_729660 ?auto_729671 ) ) ( not ( = ?auto_729660 ?auto_729672 ) ) ( not ( = ?auto_729661 ?auto_729662 ) ) ( not ( = ?auto_729661 ?auto_729663 ) ) ( not ( = ?auto_729661 ?auto_729664 ) ) ( not ( = ?auto_729661 ?auto_729665 ) ) ( not ( = ?auto_729661 ?auto_729666 ) ) ( not ( = ?auto_729661 ?auto_729667 ) ) ( not ( = ?auto_729661 ?auto_729668 ) ) ( not ( = ?auto_729661 ?auto_729669 ) ) ( not ( = ?auto_729661 ?auto_729670 ) ) ( not ( = ?auto_729661 ?auto_729671 ) ) ( not ( = ?auto_729661 ?auto_729672 ) ) ( not ( = ?auto_729662 ?auto_729663 ) ) ( not ( = ?auto_729662 ?auto_729664 ) ) ( not ( = ?auto_729662 ?auto_729665 ) ) ( not ( = ?auto_729662 ?auto_729666 ) ) ( not ( = ?auto_729662 ?auto_729667 ) ) ( not ( = ?auto_729662 ?auto_729668 ) ) ( not ( = ?auto_729662 ?auto_729669 ) ) ( not ( = ?auto_729662 ?auto_729670 ) ) ( not ( = ?auto_729662 ?auto_729671 ) ) ( not ( = ?auto_729662 ?auto_729672 ) ) ( not ( = ?auto_729663 ?auto_729664 ) ) ( not ( = ?auto_729663 ?auto_729665 ) ) ( not ( = ?auto_729663 ?auto_729666 ) ) ( not ( = ?auto_729663 ?auto_729667 ) ) ( not ( = ?auto_729663 ?auto_729668 ) ) ( not ( = ?auto_729663 ?auto_729669 ) ) ( not ( = ?auto_729663 ?auto_729670 ) ) ( not ( = ?auto_729663 ?auto_729671 ) ) ( not ( = ?auto_729663 ?auto_729672 ) ) ( not ( = ?auto_729664 ?auto_729665 ) ) ( not ( = ?auto_729664 ?auto_729666 ) ) ( not ( = ?auto_729664 ?auto_729667 ) ) ( not ( = ?auto_729664 ?auto_729668 ) ) ( not ( = ?auto_729664 ?auto_729669 ) ) ( not ( = ?auto_729664 ?auto_729670 ) ) ( not ( = ?auto_729664 ?auto_729671 ) ) ( not ( = ?auto_729664 ?auto_729672 ) ) ( not ( = ?auto_729665 ?auto_729666 ) ) ( not ( = ?auto_729665 ?auto_729667 ) ) ( not ( = ?auto_729665 ?auto_729668 ) ) ( not ( = ?auto_729665 ?auto_729669 ) ) ( not ( = ?auto_729665 ?auto_729670 ) ) ( not ( = ?auto_729665 ?auto_729671 ) ) ( not ( = ?auto_729665 ?auto_729672 ) ) ( not ( = ?auto_729666 ?auto_729667 ) ) ( not ( = ?auto_729666 ?auto_729668 ) ) ( not ( = ?auto_729666 ?auto_729669 ) ) ( not ( = ?auto_729666 ?auto_729670 ) ) ( not ( = ?auto_729666 ?auto_729671 ) ) ( not ( = ?auto_729666 ?auto_729672 ) ) ( not ( = ?auto_729667 ?auto_729668 ) ) ( not ( = ?auto_729667 ?auto_729669 ) ) ( not ( = ?auto_729667 ?auto_729670 ) ) ( not ( = ?auto_729667 ?auto_729671 ) ) ( not ( = ?auto_729667 ?auto_729672 ) ) ( not ( = ?auto_729668 ?auto_729669 ) ) ( not ( = ?auto_729668 ?auto_729670 ) ) ( not ( = ?auto_729668 ?auto_729671 ) ) ( not ( = ?auto_729668 ?auto_729672 ) ) ( not ( = ?auto_729669 ?auto_729670 ) ) ( not ( = ?auto_729669 ?auto_729671 ) ) ( not ( = ?auto_729669 ?auto_729672 ) ) ( not ( = ?auto_729670 ?auto_729671 ) ) ( not ( = ?auto_729670 ?auto_729672 ) ) ( not ( = ?auto_729671 ?auto_729672 ) ) ( ON ?auto_729670 ?auto_729671 ) ( ON ?auto_729669 ?auto_729670 ) ( ON ?auto_729668 ?auto_729669 ) ( ON ?auto_729667 ?auto_729668 ) ( ON ?auto_729666 ?auto_729667 ) ( ON ?auto_729665 ?auto_729666 ) ( ON ?auto_729664 ?auto_729665 ) ( ON ?auto_729663 ?auto_729664 ) ( ON ?auto_729662 ?auto_729663 ) ( CLEAR ?auto_729660 ) ( ON ?auto_729661 ?auto_729662 ) ( CLEAR ?auto_729661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_729657 ?auto_729658 ?auto_729659 ?auto_729660 ?auto_729661 )
      ( MAKE-15PILE ?auto_729657 ?auto_729658 ?auto_729659 ?auto_729660 ?auto_729661 ?auto_729662 ?auto_729663 ?auto_729664 ?auto_729665 ?auto_729666 ?auto_729667 ?auto_729668 ?auto_729669 ?auto_729670 ?auto_729671 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729719 - BLOCK
      ?auto_729720 - BLOCK
      ?auto_729721 - BLOCK
      ?auto_729722 - BLOCK
      ?auto_729723 - BLOCK
      ?auto_729724 - BLOCK
      ?auto_729725 - BLOCK
      ?auto_729726 - BLOCK
      ?auto_729727 - BLOCK
      ?auto_729728 - BLOCK
      ?auto_729729 - BLOCK
      ?auto_729730 - BLOCK
      ?auto_729731 - BLOCK
      ?auto_729732 - BLOCK
      ?auto_729733 - BLOCK
    )
    :vars
    (
      ?auto_729734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729733 ?auto_729734 ) ( ON-TABLE ?auto_729719 ) ( ON ?auto_729720 ?auto_729719 ) ( ON ?auto_729721 ?auto_729720 ) ( not ( = ?auto_729719 ?auto_729720 ) ) ( not ( = ?auto_729719 ?auto_729721 ) ) ( not ( = ?auto_729719 ?auto_729722 ) ) ( not ( = ?auto_729719 ?auto_729723 ) ) ( not ( = ?auto_729719 ?auto_729724 ) ) ( not ( = ?auto_729719 ?auto_729725 ) ) ( not ( = ?auto_729719 ?auto_729726 ) ) ( not ( = ?auto_729719 ?auto_729727 ) ) ( not ( = ?auto_729719 ?auto_729728 ) ) ( not ( = ?auto_729719 ?auto_729729 ) ) ( not ( = ?auto_729719 ?auto_729730 ) ) ( not ( = ?auto_729719 ?auto_729731 ) ) ( not ( = ?auto_729719 ?auto_729732 ) ) ( not ( = ?auto_729719 ?auto_729733 ) ) ( not ( = ?auto_729719 ?auto_729734 ) ) ( not ( = ?auto_729720 ?auto_729721 ) ) ( not ( = ?auto_729720 ?auto_729722 ) ) ( not ( = ?auto_729720 ?auto_729723 ) ) ( not ( = ?auto_729720 ?auto_729724 ) ) ( not ( = ?auto_729720 ?auto_729725 ) ) ( not ( = ?auto_729720 ?auto_729726 ) ) ( not ( = ?auto_729720 ?auto_729727 ) ) ( not ( = ?auto_729720 ?auto_729728 ) ) ( not ( = ?auto_729720 ?auto_729729 ) ) ( not ( = ?auto_729720 ?auto_729730 ) ) ( not ( = ?auto_729720 ?auto_729731 ) ) ( not ( = ?auto_729720 ?auto_729732 ) ) ( not ( = ?auto_729720 ?auto_729733 ) ) ( not ( = ?auto_729720 ?auto_729734 ) ) ( not ( = ?auto_729721 ?auto_729722 ) ) ( not ( = ?auto_729721 ?auto_729723 ) ) ( not ( = ?auto_729721 ?auto_729724 ) ) ( not ( = ?auto_729721 ?auto_729725 ) ) ( not ( = ?auto_729721 ?auto_729726 ) ) ( not ( = ?auto_729721 ?auto_729727 ) ) ( not ( = ?auto_729721 ?auto_729728 ) ) ( not ( = ?auto_729721 ?auto_729729 ) ) ( not ( = ?auto_729721 ?auto_729730 ) ) ( not ( = ?auto_729721 ?auto_729731 ) ) ( not ( = ?auto_729721 ?auto_729732 ) ) ( not ( = ?auto_729721 ?auto_729733 ) ) ( not ( = ?auto_729721 ?auto_729734 ) ) ( not ( = ?auto_729722 ?auto_729723 ) ) ( not ( = ?auto_729722 ?auto_729724 ) ) ( not ( = ?auto_729722 ?auto_729725 ) ) ( not ( = ?auto_729722 ?auto_729726 ) ) ( not ( = ?auto_729722 ?auto_729727 ) ) ( not ( = ?auto_729722 ?auto_729728 ) ) ( not ( = ?auto_729722 ?auto_729729 ) ) ( not ( = ?auto_729722 ?auto_729730 ) ) ( not ( = ?auto_729722 ?auto_729731 ) ) ( not ( = ?auto_729722 ?auto_729732 ) ) ( not ( = ?auto_729722 ?auto_729733 ) ) ( not ( = ?auto_729722 ?auto_729734 ) ) ( not ( = ?auto_729723 ?auto_729724 ) ) ( not ( = ?auto_729723 ?auto_729725 ) ) ( not ( = ?auto_729723 ?auto_729726 ) ) ( not ( = ?auto_729723 ?auto_729727 ) ) ( not ( = ?auto_729723 ?auto_729728 ) ) ( not ( = ?auto_729723 ?auto_729729 ) ) ( not ( = ?auto_729723 ?auto_729730 ) ) ( not ( = ?auto_729723 ?auto_729731 ) ) ( not ( = ?auto_729723 ?auto_729732 ) ) ( not ( = ?auto_729723 ?auto_729733 ) ) ( not ( = ?auto_729723 ?auto_729734 ) ) ( not ( = ?auto_729724 ?auto_729725 ) ) ( not ( = ?auto_729724 ?auto_729726 ) ) ( not ( = ?auto_729724 ?auto_729727 ) ) ( not ( = ?auto_729724 ?auto_729728 ) ) ( not ( = ?auto_729724 ?auto_729729 ) ) ( not ( = ?auto_729724 ?auto_729730 ) ) ( not ( = ?auto_729724 ?auto_729731 ) ) ( not ( = ?auto_729724 ?auto_729732 ) ) ( not ( = ?auto_729724 ?auto_729733 ) ) ( not ( = ?auto_729724 ?auto_729734 ) ) ( not ( = ?auto_729725 ?auto_729726 ) ) ( not ( = ?auto_729725 ?auto_729727 ) ) ( not ( = ?auto_729725 ?auto_729728 ) ) ( not ( = ?auto_729725 ?auto_729729 ) ) ( not ( = ?auto_729725 ?auto_729730 ) ) ( not ( = ?auto_729725 ?auto_729731 ) ) ( not ( = ?auto_729725 ?auto_729732 ) ) ( not ( = ?auto_729725 ?auto_729733 ) ) ( not ( = ?auto_729725 ?auto_729734 ) ) ( not ( = ?auto_729726 ?auto_729727 ) ) ( not ( = ?auto_729726 ?auto_729728 ) ) ( not ( = ?auto_729726 ?auto_729729 ) ) ( not ( = ?auto_729726 ?auto_729730 ) ) ( not ( = ?auto_729726 ?auto_729731 ) ) ( not ( = ?auto_729726 ?auto_729732 ) ) ( not ( = ?auto_729726 ?auto_729733 ) ) ( not ( = ?auto_729726 ?auto_729734 ) ) ( not ( = ?auto_729727 ?auto_729728 ) ) ( not ( = ?auto_729727 ?auto_729729 ) ) ( not ( = ?auto_729727 ?auto_729730 ) ) ( not ( = ?auto_729727 ?auto_729731 ) ) ( not ( = ?auto_729727 ?auto_729732 ) ) ( not ( = ?auto_729727 ?auto_729733 ) ) ( not ( = ?auto_729727 ?auto_729734 ) ) ( not ( = ?auto_729728 ?auto_729729 ) ) ( not ( = ?auto_729728 ?auto_729730 ) ) ( not ( = ?auto_729728 ?auto_729731 ) ) ( not ( = ?auto_729728 ?auto_729732 ) ) ( not ( = ?auto_729728 ?auto_729733 ) ) ( not ( = ?auto_729728 ?auto_729734 ) ) ( not ( = ?auto_729729 ?auto_729730 ) ) ( not ( = ?auto_729729 ?auto_729731 ) ) ( not ( = ?auto_729729 ?auto_729732 ) ) ( not ( = ?auto_729729 ?auto_729733 ) ) ( not ( = ?auto_729729 ?auto_729734 ) ) ( not ( = ?auto_729730 ?auto_729731 ) ) ( not ( = ?auto_729730 ?auto_729732 ) ) ( not ( = ?auto_729730 ?auto_729733 ) ) ( not ( = ?auto_729730 ?auto_729734 ) ) ( not ( = ?auto_729731 ?auto_729732 ) ) ( not ( = ?auto_729731 ?auto_729733 ) ) ( not ( = ?auto_729731 ?auto_729734 ) ) ( not ( = ?auto_729732 ?auto_729733 ) ) ( not ( = ?auto_729732 ?auto_729734 ) ) ( not ( = ?auto_729733 ?auto_729734 ) ) ( ON ?auto_729732 ?auto_729733 ) ( ON ?auto_729731 ?auto_729732 ) ( ON ?auto_729730 ?auto_729731 ) ( ON ?auto_729729 ?auto_729730 ) ( ON ?auto_729728 ?auto_729729 ) ( ON ?auto_729727 ?auto_729728 ) ( ON ?auto_729726 ?auto_729727 ) ( ON ?auto_729725 ?auto_729726 ) ( ON ?auto_729724 ?auto_729725 ) ( ON ?auto_729723 ?auto_729724 ) ( CLEAR ?auto_729721 ) ( ON ?auto_729722 ?auto_729723 ) ( CLEAR ?auto_729722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_729719 ?auto_729720 ?auto_729721 ?auto_729722 )
      ( MAKE-15PILE ?auto_729719 ?auto_729720 ?auto_729721 ?auto_729722 ?auto_729723 ?auto_729724 ?auto_729725 ?auto_729726 ?auto_729727 ?auto_729728 ?auto_729729 ?auto_729730 ?auto_729731 ?auto_729732 ?auto_729733 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729781 - BLOCK
      ?auto_729782 - BLOCK
      ?auto_729783 - BLOCK
      ?auto_729784 - BLOCK
      ?auto_729785 - BLOCK
      ?auto_729786 - BLOCK
      ?auto_729787 - BLOCK
      ?auto_729788 - BLOCK
      ?auto_729789 - BLOCK
      ?auto_729790 - BLOCK
      ?auto_729791 - BLOCK
      ?auto_729792 - BLOCK
      ?auto_729793 - BLOCK
      ?auto_729794 - BLOCK
      ?auto_729795 - BLOCK
    )
    :vars
    (
      ?auto_729796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729795 ?auto_729796 ) ( ON-TABLE ?auto_729781 ) ( ON ?auto_729782 ?auto_729781 ) ( not ( = ?auto_729781 ?auto_729782 ) ) ( not ( = ?auto_729781 ?auto_729783 ) ) ( not ( = ?auto_729781 ?auto_729784 ) ) ( not ( = ?auto_729781 ?auto_729785 ) ) ( not ( = ?auto_729781 ?auto_729786 ) ) ( not ( = ?auto_729781 ?auto_729787 ) ) ( not ( = ?auto_729781 ?auto_729788 ) ) ( not ( = ?auto_729781 ?auto_729789 ) ) ( not ( = ?auto_729781 ?auto_729790 ) ) ( not ( = ?auto_729781 ?auto_729791 ) ) ( not ( = ?auto_729781 ?auto_729792 ) ) ( not ( = ?auto_729781 ?auto_729793 ) ) ( not ( = ?auto_729781 ?auto_729794 ) ) ( not ( = ?auto_729781 ?auto_729795 ) ) ( not ( = ?auto_729781 ?auto_729796 ) ) ( not ( = ?auto_729782 ?auto_729783 ) ) ( not ( = ?auto_729782 ?auto_729784 ) ) ( not ( = ?auto_729782 ?auto_729785 ) ) ( not ( = ?auto_729782 ?auto_729786 ) ) ( not ( = ?auto_729782 ?auto_729787 ) ) ( not ( = ?auto_729782 ?auto_729788 ) ) ( not ( = ?auto_729782 ?auto_729789 ) ) ( not ( = ?auto_729782 ?auto_729790 ) ) ( not ( = ?auto_729782 ?auto_729791 ) ) ( not ( = ?auto_729782 ?auto_729792 ) ) ( not ( = ?auto_729782 ?auto_729793 ) ) ( not ( = ?auto_729782 ?auto_729794 ) ) ( not ( = ?auto_729782 ?auto_729795 ) ) ( not ( = ?auto_729782 ?auto_729796 ) ) ( not ( = ?auto_729783 ?auto_729784 ) ) ( not ( = ?auto_729783 ?auto_729785 ) ) ( not ( = ?auto_729783 ?auto_729786 ) ) ( not ( = ?auto_729783 ?auto_729787 ) ) ( not ( = ?auto_729783 ?auto_729788 ) ) ( not ( = ?auto_729783 ?auto_729789 ) ) ( not ( = ?auto_729783 ?auto_729790 ) ) ( not ( = ?auto_729783 ?auto_729791 ) ) ( not ( = ?auto_729783 ?auto_729792 ) ) ( not ( = ?auto_729783 ?auto_729793 ) ) ( not ( = ?auto_729783 ?auto_729794 ) ) ( not ( = ?auto_729783 ?auto_729795 ) ) ( not ( = ?auto_729783 ?auto_729796 ) ) ( not ( = ?auto_729784 ?auto_729785 ) ) ( not ( = ?auto_729784 ?auto_729786 ) ) ( not ( = ?auto_729784 ?auto_729787 ) ) ( not ( = ?auto_729784 ?auto_729788 ) ) ( not ( = ?auto_729784 ?auto_729789 ) ) ( not ( = ?auto_729784 ?auto_729790 ) ) ( not ( = ?auto_729784 ?auto_729791 ) ) ( not ( = ?auto_729784 ?auto_729792 ) ) ( not ( = ?auto_729784 ?auto_729793 ) ) ( not ( = ?auto_729784 ?auto_729794 ) ) ( not ( = ?auto_729784 ?auto_729795 ) ) ( not ( = ?auto_729784 ?auto_729796 ) ) ( not ( = ?auto_729785 ?auto_729786 ) ) ( not ( = ?auto_729785 ?auto_729787 ) ) ( not ( = ?auto_729785 ?auto_729788 ) ) ( not ( = ?auto_729785 ?auto_729789 ) ) ( not ( = ?auto_729785 ?auto_729790 ) ) ( not ( = ?auto_729785 ?auto_729791 ) ) ( not ( = ?auto_729785 ?auto_729792 ) ) ( not ( = ?auto_729785 ?auto_729793 ) ) ( not ( = ?auto_729785 ?auto_729794 ) ) ( not ( = ?auto_729785 ?auto_729795 ) ) ( not ( = ?auto_729785 ?auto_729796 ) ) ( not ( = ?auto_729786 ?auto_729787 ) ) ( not ( = ?auto_729786 ?auto_729788 ) ) ( not ( = ?auto_729786 ?auto_729789 ) ) ( not ( = ?auto_729786 ?auto_729790 ) ) ( not ( = ?auto_729786 ?auto_729791 ) ) ( not ( = ?auto_729786 ?auto_729792 ) ) ( not ( = ?auto_729786 ?auto_729793 ) ) ( not ( = ?auto_729786 ?auto_729794 ) ) ( not ( = ?auto_729786 ?auto_729795 ) ) ( not ( = ?auto_729786 ?auto_729796 ) ) ( not ( = ?auto_729787 ?auto_729788 ) ) ( not ( = ?auto_729787 ?auto_729789 ) ) ( not ( = ?auto_729787 ?auto_729790 ) ) ( not ( = ?auto_729787 ?auto_729791 ) ) ( not ( = ?auto_729787 ?auto_729792 ) ) ( not ( = ?auto_729787 ?auto_729793 ) ) ( not ( = ?auto_729787 ?auto_729794 ) ) ( not ( = ?auto_729787 ?auto_729795 ) ) ( not ( = ?auto_729787 ?auto_729796 ) ) ( not ( = ?auto_729788 ?auto_729789 ) ) ( not ( = ?auto_729788 ?auto_729790 ) ) ( not ( = ?auto_729788 ?auto_729791 ) ) ( not ( = ?auto_729788 ?auto_729792 ) ) ( not ( = ?auto_729788 ?auto_729793 ) ) ( not ( = ?auto_729788 ?auto_729794 ) ) ( not ( = ?auto_729788 ?auto_729795 ) ) ( not ( = ?auto_729788 ?auto_729796 ) ) ( not ( = ?auto_729789 ?auto_729790 ) ) ( not ( = ?auto_729789 ?auto_729791 ) ) ( not ( = ?auto_729789 ?auto_729792 ) ) ( not ( = ?auto_729789 ?auto_729793 ) ) ( not ( = ?auto_729789 ?auto_729794 ) ) ( not ( = ?auto_729789 ?auto_729795 ) ) ( not ( = ?auto_729789 ?auto_729796 ) ) ( not ( = ?auto_729790 ?auto_729791 ) ) ( not ( = ?auto_729790 ?auto_729792 ) ) ( not ( = ?auto_729790 ?auto_729793 ) ) ( not ( = ?auto_729790 ?auto_729794 ) ) ( not ( = ?auto_729790 ?auto_729795 ) ) ( not ( = ?auto_729790 ?auto_729796 ) ) ( not ( = ?auto_729791 ?auto_729792 ) ) ( not ( = ?auto_729791 ?auto_729793 ) ) ( not ( = ?auto_729791 ?auto_729794 ) ) ( not ( = ?auto_729791 ?auto_729795 ) ) ( not ( = ?auto_729791 ?auto_729796 ) ) ( not ( = ?auto_729792 ?auto_729793 ) ) ( not ( = ?auto_729792 ?auto_729794 ) ) ( not ( = ?auto_729792 ?auto_729795 ) ) ( not ( = ?auto_729792 ?auto_729796 ) ) ( not ( = ?auto_729793 ?auto_729794 ) ) ( not ( = ?auto_729793 ?auto_729795 ) ) ( not ( = ?auto_729793 ?auto_729796 ) ) ( not ( = ?auto_729794 ?auto_729795 ) ) ( not ( = ?auto_729794 ?auto_729796 ) ) ( not ( = ?auto_729795 ?auto_729796 ) ) ( ON ?auto_729794 ?auto_729795 ) ( ON ?auto_729793 ?auto_729794 ) ( ON ?auto_729792 ?auto_729793 ) ( ON ?auto_729791 ?auto_729792 ) ( ON ?auto_729790 ?auto_729791 ) ( ON ?auto_729789 ?auto_729790 ) ( ON ?auto_729788 ?auto_729789 ) ( ON ?auto_729787 ?auto_729788 ) ( ON ?auto_729786 ?auto_729787 ) ( ON ?auto_729785 ?auto_729786 ) ( ON ?auto_729784 ?auto_729785 ) ( CLEAR ?auto_729782 ) ( ON ?auto_729783 ?auto_729784 ) ( CLEAR ?auto_729783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_729781 ?auto_729782 ?auto_729783 )
      ( MAKE-15PILE ?auto_729781 ?auto_729782 ?auto_729783 ?auto_729784 ?auto_729785 ?auto_729786 ?auto_729787 ?auto_729788 ?auto_729789 ?auto_729790 ?auto_729791 ?auto_729792 ?auto_729793 ?auto_729794 ?auto_729795 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729843 - BLOCK
      ?auto_729844 - BLOCK
      ?auto_729845 - BLOCK
      ?auto_729846 - BLOCK
      ?auto_729847 - BLOCK
      ?auto_729848 - BLOCK
      ?auto_729849 - BLOCK
      ?auto_729850 - BLOCK
      ?auto_729851 - BLOCK
      ?auto_729852 - BLOCK
      ?auto_729853 - BLOCK
      ?auto_729854 - BLOCK
      ?auto_729855 - BLOCK
      ?auto_729856 - BLOCK
      ?auto_729857 - BLOCK
    )
    :vars
    (
      ?auto_729858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729857 ?auto_729858 ) ( ON-TABLE ?auto_729843 ) ( not ( = ?auto_729843 ?auto_729844 ) ) ( not ( = ?auto_729843 ?auto_729845 ) ) ( not ( = ?auto_729843 ?auto_729846 ) ) ( not ( = ?auto_729843 ?auto_729847 ) ) ( not ( = ?auto_729843 ?auto_729848 ) ) ( not ( = ?auto_729843 ?auto_729849 ) ) ( not ( = ?auto_729843 ?auto_729850 ) ) ( not ( = ?auto_729843 ?auto_729851 ) ) ( not ( = ?auto_729843 ?auto_729852 ) ) ( not ( = ?auto_729843 ?auto_729853 ) ) ( not ( = ?auto_729843 ?auto_729854 ) ) ( not ( = ?auto_729843 ?auto_729855 ) ) ( not ( = ?auto_729843 ?auto_729856 ) ) ( not ( = ?auto_729843 ?auto_729857 ) ) ( not ( = ?auto_729843 ?auto_729858 ) ) ( not ( = ?auto_729844 ?auto_729845 ) ) ( not ( = ?auto_729844 ?auto_729846 ) ) ( not ( = ?auto_729844 ?auto_729847 ) ) ( not ( = ?auto_729844 ?auto_729848 ) ) ( not ( = ?auto_729844 ?auto_729849 ) ) ( not ( = ?auto_729844 ?auto_729850 ) ) ( not ( = ?auto_729844 ?auto_729851 ) ) ( not ( = ?auto_729844 ?auto_729852 ) ) ( not ( = ?auto_729844 ?auto_729853 ) ) ( not ( = ?auto_729844 ?auto_729854 ) ) ( not ( = ?auto_729844 ?auto_729855 ) ) ( not ( = ?auto_729844 ?auto_729856 ) ) ( not ( = ?auto_729844 ?auto_729857 ) ) ( not ( = ?auto_729844 ?auto_729858 ) ) ( not ( = ?auto_729845 ?auto_729846 ) ) ( not ( = ?auto_729845 ?auto_729847 ) ) ( not ( = ?auto_729845 ?auto_729848 ) ) ( not ( = ?auto_729845 ?auto_729849 ) ) ( not ( = ?auto_729845 ?auto_729850 ) ) ( not ( = ?auto_729845 ?auto_729851 ) ) ( not ( = ?auto_729845 ?auto_729852 ) ) ( not ( = ?auto_729845 ?auto_729853 ) ) ( not ( = ?auto_729845 ?auto_729854 ) ) ( not ( = ?auto_729845 ?auto_729855 ) ) ( not ( = ?auto_729845 ?auto_729856 ) ) ( not ( = ?auto_729845 ?auto_729857 ) ) ( not ( = ?auto_729845 ?auto_729858 ) ) ( not ( = ?auto_729846 ?auto_729847 ) ) ( not ( = ?auto_729846 ?auto_729848 ) ) ( not ( = ?auto_729846 ?auto_729849 ) ) ( not ( = ?auto_729846 ?auto_729850 ) ) ( not ( = ?auto_729846 ?auto_729851 ) ) ( not ( = ?auto_729846 ?auto_729852 ) ) ( not ( = ?auto_729846 ?auto_729853 ) ) ( not ( = ?auto_729846 ?auto_729854 ) ) ( not ( = ?auto_729846 ?auto_729855 ) ) ( not ( = ?auto_729846 ?auto_729856 ) ) ( not ( = ?auto_729846 ?auto_729857 ) ) ( not ( = ?auto_729846 ?auto_729858 ) ) ( not ( = ?auto_729847 ?auto_729848 ) ) ( not ( = ?auto_729847 ?auto_729849 ) ) ( not ( = ?auto_729847 ?auto_729850 ) ) ( not ( = ?auto_729847 ?auto_729851 ) ) ( not ( = ?auto_729847 ?auto_729852 ) ) ( not ( = ?auto_729847 ?auto_729853 ) ) ( not ( = ?auto_729847 ?auto_729854 ) ) ( not ( = ?auto_729847 ?auto_729855 ) ) ( not ( = ?auto_729847 ?auto_729856 ) ) ( not ( = ?auto_729847 ?auto_729857 ) ) ( not ( = ?auto_729847 ?auto_729858 ) ) ( not ( = ?auto_729848 ?auto_729849 ) ) ( not ( = ?auto_729848 ?auto_729850 ) ) ( not ( = ?auto_729848 ?auto_729851 ) ) ( not ( = ?auto_729848 ?auto_729852 ) ) ( not ( = ?auto_729848 ?auto_729853 ) ) ( not ( = ?auto_729848 ?auto_729854 ) ) ( not ( = ?auto_729848 ?auto_729855 ) ) ( not ( = ?auto_729848 ?auto_729856 ) ) ( not ( = ?auto_729848 ?auto_729857 ) ) ( not ( = ?auto_729848 ?auto_729858 ) ) ( not ( = ?auto_729849 ?auto_729850 ) ) ( not ( = ?auto_729849 ?auto_729851 ) ) ( not ( = ?auto_729849 ?auto_729852 ) ) ( not ( = ?auto_729849 ?auto_729853 ) ) ( not ( = ?auto_729849 ?auto_729854 ) ) ( not ( = ?auto_729849 ?auto_729855 ) ) ( not ( = ?auto_729849 ?auto_729856 ) ) ( not ( = ?auto_729849 ?auto_729857 ) ) ( not ( = ?auto_729849 ?auto_729858 ) ) ( not ( = ?auto_729850 ?auto_729851 ) ) ( not ( = ?auto_729850 ?auto_729852 ) ) ( not ( = ?auto_729850 ?auto_729853 ) ) ( not ( = ?auto_729850 ?auto_729854 ) ) ( not ( = ?auto_729850 ?auto_729855 ) ) ( not ( = ?auto_729850 ?auto_729856 ) ) ( not ( = ?auto_729850 ?auto_729857 ) ) ( not ( = ?auto_729850 ?auto_729858 ) ) ( not ( = ?auto_729851 ?auto_729852 ) ) ( not ( = ?auto_729851 ?auto_729853 ) ) ( not ( = ?auto_729851 ?auto_729854 ) ) ( not ( = ?auto_729851 ?auto_729855 ) ) ( not ( = ?auto_729851 ?auto_729856 ) ) ( not ( = ?auto_729851 ?auto_729857 ) ) ( not ( = ?auto_729851 ?auto_729858 ) ) ( not ( = ?auto_729852 ?auto_729853 ) ) ( not ( = ?auto_729852 ?auto_729854 ) ) ( not ( = ?auto_729852 ?auto_729855 ) ) ( not ( = ?auto_729852 ?auto_729856 ) ) ( not ( = ?auto_729852 ?auto_729857 ) ) ( not ( = ?auto_729852 ?auto_729858 ) ) ( not ( = ?auto_729853 ?auto_729854 ) ) ( not ( = ?auto_729853 ?auto_729855 ) ) ( not ( = ?auto_729853 ?auto_729856 ) ) ( not ( = ?auto_729853 ?auto_729857 ) ) ( not ( = ?auto_729853 ?auto_729858 ) ) ( not ( = ?auto_729854 ?auto_729855 ) ) ( not ( = ?auto_729854 ?auto_729856 ) ) ( not ( = ?auto_729854 ?auto_729857 ) ) ( not ( = ?auto_729854 ?auto_729858 ) ) ( not ( = ?auto_729855 ?auto_729856 ) ) ( not ( = ?auto_729855 ?auto_729857 ) ) ( not ( = ?auto_729855 ?auto_729858 ) ) ( not ( = ?auto_729856 ?auto_729857 ) ) ( not ( = ?auto_729856 ?auto_729858 ) ) ( not ( = ?auto_729857 ?auto_729858 ) ) ( ON ?auto_729856 ?auto_729857 ) ( ON ?auto_729855 ?auto_729856 ) ( ON ?auto_729854 ?auto_729855 ) ( ON ?auto_729853 ?auto_729854 ) ( ON ?auto_729852 ?auto_729853 ) ( ON ?auto_729851 ?auto_729852 ) ( ON ?auto_729850 ?auto_729851 ) ( ON ?auto_729849 ?auto_729850 ) ( ON ?auto_729848 ?auto_729849 ) ( ON ?auto_729847 ?auto_729848 ) ( ON ?auto_729846 ?auto_729847 ) ( ON ?auto_729845 ?auto_729846 ) ( CLEAR ?auto_729843 ) ( ON ?auto_729844 ?auto_729845 ) ( CLEAR ?auto_729844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_729843 ?auto_729844 )
      ( MAKE-15PILE ?auto_729843 ?auto_729844 ?auto_729845 ?auto_729846 ?auto_729847 ?auto_729848 ?auto_729849 ?auto_729850 ?auto_729851 ?auto_729852 ?auto_729853 ?auto_729854 ?auto_729855 ?auto_729856 ?auto_729857 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_729905 - BLOCK
      ?auto_729906 - BLOCK
      ?auto_729907 - BLOCK
      ?auto_729908 - BLOCK
      ?auto_729909 - BLOCK
      ?auto_729910 - BLOCK
      ?auto_729911 - BLOCK
      ?auto_729912 - BLOCK
      ?auto_729913 - BLOCK
      ?auto_729914 - BLOCK
      ?auto_729915 - BLOCK
      ?auto_729916 - BLOCK
      ?auto_729917 - BLOCK
      ?auto_729918 - BLOCK
      ?auto_729919 - BLOCK
    )
    :vars
    (
      ?auto_729920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_729919 ?auto_729920 ) ( not ( = ?auto_729905 ?auto_729906 ) ) ( not ( = ?auto_729905 ?auto_729907 ) ) ( not ( = ?auto_729905 ?auto_729908 ) ) ( not ( = ?auto_729905 ?auto_729909 ) ) ( not ( = ?auto_729905 ?auto_729910 ) ) ( not ( = ?auto_729905 ?auto_729911 ) ) ( not ( = ?auto_729905 ?auto_729912 ) ) ( not ( = ?auto_729905 ?auto_729913 ) ) ( not ( = ?auto_729905 ?auto_729914 ) ) ( not ( = ?auto_729905 ?auto_729915 ) ) ( not ( = ?auto_729905 ?auto_729916 ) ) ( not ( = ?auto_729905 ?auto_729917 ) ) ( not ( = ?auto_729905 ?auto_729918 ) ) ( not ( = ?auto_729905 ?auto_729919 ) ) ( not ( = ?auto_729905 ?auto_729920 ) ) ( not ( = ?auto_729906 ?auto_729907 ) ) ( not ( = ?auto_729906 ?auto_729908 ) ) ( not ( = ?auto_729906 ?auto_729909 ) ) ( not ( = ?auto_729906 ?auto_729910 ) ) ( not ( = ?auto_729906 ?auto_729911 ) ) ( not ( = ?auto_729906 ?auto_729912 ) ) ( not ( = ?auto_729906 ?auto_729913 ) ) ( not ( = ?auto_729906 ?auto_729914 ) ) ( not ( = ?auto_729906 ?auto_729915 ) ) ( not ( = ?auto_729906 ?auto_729916 ) ) ( not ( = ?auto_729906 ?auto_729917 ) ) ( not ( = ?auto_729906 ?auto_729918 ) ) ( not ( = ?auto_729906 ?auto_729919 ) ) ( not ( = ?auto_729906 ?auto_729920 ) ) ( not ( = ?auto_729907 ?auto_729908 ) ) ( not ( = ?auto_729907 ?auto_729909 ) ) ( not ( = ?auto_729907 ?auto_729910 ) ) ( not ( = ?auto_729907 ?auto_729911 ) ) ( not ( = ?auto_729907 ?auto_729912 ) ) ( not ( = ?auto_729907 ?auto_729913 ) ) ( not ( = ?auto_729907 ?auto_729914 ) ) ( not ( = ?auto_729907 ?auto_729915 ) ) ( not ( = ?auto_729907 ?auto_729916 ) ) ( not ( = ?auto_729907 ?auto_729917 ) ) ( not ( = ?auto_729907 ?auto_729918 ) ) ( not ( = ?auto_729907 ?auto_729919 ) ) ( not ( = ?auto_729907 ?auto_729920 ) ) ( not ( = ?auto_729908 ?auto_729909 ) ) ( not ( = ?auto_729908 ?auto_729910 ) ) ( not ( = ?auto_729908 ?auto_729911 ) ) ( not ( = ?auto_729908 ?auto_729912 ) ) ( not ( = ?auto_729908 ?auto_729913 ) ) ( not ( = ?auto_729908 ?auto_729914 ) ) ( not ( = ?auto_729908 ?auto_729915 ) ) ( not ( = ?auto_729908 ?auto_729916 ) ) ( not ( = ?auto_729908 ?auto_729917 ) ) ( not ( = ?auto_729908 ?auto_729918 ) ) ( not ( = ?auto_729908 ?auto_729919 ) ) ( not ( = ?auto_729908 ?auto_729920 ) ) ( not ( = ?auto_729909 ?auto_729910 ) ) ( not ( = ?auto_729909 ?auto_729911 ) ) ( not ( = ?auto_729909 ?auto_729912 ) ) ( not ( = ?auto_729909 ?auto_729913 ) ) ( not ( = ?auto_729909 ?auto_729914 ) ) ( not ( = ?auto_729909 ?auto_729915 ) ) ( not ( = ?auto_729909 ?auto_729916 ) ) ( not ( = ?auto_729909 ?auto_729917 ) ) ( not ( = ?auto_729909 ?auto_729918 ) ) ( not ( = ?auto_729909 ?auto_729919 ) ) ( not ( = ?auto_729909 ?auto_729920 ) ) ( not ( = ?auto_729910 ?auto_729911 ) ) ( not ( = ?auto_729910 ?auto_729912 ) ) ( not ( = ?auto_729910 ?auto_729913 ) ) ( not ( = ?auto_729910 ?auto_729914 ) ) ( not ( = ?auto_729910 ?auto_729915 ) ) ( not ( = ?auto_729910 ?auto_729916 ) ) ( not ( = ?auto_729910 ?auto_729917 ) ) ( not ( = ?auto_729910 ?auto_729918 ) ) ( not ( = ?auto_729910 ?auto_729919 ) ) ( not ( = ?auto_729910 ?auto_729920 ) ) ( not ( = ?auto_729911 ?auto_729912 ) ) ( not ( = ?auto_729911 ?auto_729913 ) ) ( not ( = ?auto_729911 ?auto_729914 ) ) ( not ( = ?auto_729911 ?auto_729915 ) ) ( not ( = ?auto_729911 ?auto_729916 ) ) ( not ( = ?auto_729911 ?auto_729917 ) ) ( not ( = ?auto_729911 ?auto_729918 ) ) ( not ( = ?auto_729911 ?auto_729919 ) ) ( not ( = ?auto_729911 ?auto_729920 ) ) ( not ( = ?auto_729912 ?auto_729913 ) ) ( not ( = ?auto_729912 ?auto_729914 ) ) ( not ( = ?auto_729912 ?auto_729915 ) ) ( not ( = ?auto_729912 ?auto_729916 ) ) ( not ( = ?auto_729912 ?auto_729917 ) ) ( not ( = ?auto_729912 ?auto_729918 ) ) ( not ( = ?auto_729912 ?auto_729919 ) ) ( not ( = ?auto_729912 ?auto_729920 ) ) ( not ( = ?auto_729913 ?auto_729914 ) ) ( not ( = ?auto_729913 ?auto_729915 ) ) ( not ( = ?auto_729913 ?auto_729916 ) ) ( not ( = ?auto_729913 ?auto_729917 ) ) ( not ( = ?auto_729913 ?auto_729918 ) ) ( not ( = ?auto_729913 ?auto_729919 ) ) ( not ( = ?auto_729913 ?auto_729920 ) ) ( not ( = ?auto_729914 ?auto_729915 ) ) ( not ( = ?auto_729914 ?auto_729916 ) ) ( not ( = ?auto_729914 ?auto_729917 ) ) ( not ( = ?auto_729914 ?auto_729918 ) ) ( not ( = ?auto_729914 ?auto_729919 ) ) ( not ( = ?auto_729914 ?auto_729920 ) ) ( not ( = ?auto_729915 ?auto_729916 ) ) ( not ( = ?auto_729915 ?auto_729917 ) ) ( not ( = ?auto_729915 ?auto_729918 ) ) ( not ( = ?auto_729915 ?auto_729919 ) ) ( not ( = ?auto_729915 ?auto_729920 ) ) ( not ( = ?auto_729916 ?auto_729917 ) ) ( not ( = ?auto_729916 ?auto_729918 ) ) ( not ( = ?auto_729916 ?auto_729919 ) ) ( not ( = ?auto_729916 ?auto_729920 ) ) ( not ( = ?auto_729917 ?auto_729918 ) ) ( not ( = ?auto_729917 ?auto_729919 ) ) ( not ( = ?auto_729917 ?auto_729920 ) ) ( not ( = ?auto_729918 ?auto_729919 ) ) ( not ( = ?auto_729918 ?auto_729920 ) ) ( not ( = ?auto_729919 ?auto_729920 ) ) ( ON ?auto_729918 ?auto_729919 ) ( ON ?auto_729917 ?auto_729918 ) ( ON ?auto_729916 ?auto_729917 ) ( ON ?auto_729915 ?auto_729916 ) ( ON ?auto_729914 ?auto_729915 ) ( ON ?auto_729913 ?auto_729914 ) ( ON ?auto_729912 ?auto_729913 ) ( ON ?auto_729911 ?auto_729912 ) ( ON ?auto_729910 ?auto_729911 ) ( ON ?auto_729909 ?auto_729910 ) ( ON ?auto_729908 ?auto_729909 ) ( ON ?auto_729907 ?auto_729908 ) ( ON ?auto_729906 ?auto_729907 ) ( ON ?auto_729905 ?auto_729906 ) ( CLEAR ?auto_729905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_729905 )
      ( MAKE-15PILE ?auto_729905 ?auto_729906 ?auto_729907 ?auto_729908 ?auto_729909 ?auto_729910 ?auto_729911 ?auto_729912 ?auto_729913 ?auto_729914 ?auto_729915 ?auto_729916 ?auto_729917 ?auto_729918 ?auto_729919 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_729968 - BLOCK
      ?auto_729969 - BLOCK
      ?auto_729970 - BLOCK
      ?auto_729971 - BLOCK
      ?auto_729972 - BLOCK
      ?auto_729973 - BLOCK
      ?auto_729974 - BLOCK
      ?auto_729975 - BLOCK
      ?auto_729976 - BLOCK
      ?auto_729977 - BLOCK
      ?auto_729978 - BLOCK
      ?auto_729979 - BLOCK
      ?auto_729980 - BLOCK
      ?auto_729981 - BLOCK
      ?auto_729982 - BLOCK
      ?auto_729983 - BLOCK
    )
    :vars
    (
      ?auto_729984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_729982 ) ( ON ?auto_729983 ?auto_729984 ) ( CLEAR ?auto_729983 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_729968 ) ( ON ?auto_729969 ?auto_729968 ) ( ON ?auto_729970 ?auto_729969 ) ( ON ?auto_729971 ?auto_729970 ) ( ON ?auto_729972 ?auto_729971 ) ( ON ?auto_729973 ?auto_729972 ) ( ON ?auto_729974 ?auto_729973 ) ( ON ?auto_729975 ?auto_729974 ) ( ON ?auto_729976 ?auto_729975 ) ( ON ?auto_729977 ?auto_729976 ) ( ON ?auto_729978 ?auto_729977 ) ( ON ?auto_729979 ?auto_729978 ) ( ON ?auto_729980 ?auto_729979 ) ( ON ?auto_729981 ?auto_729980 ) ( ON ?auto_729982 ?auto_729981 ) ( not ( = ?auto_729968 ?auto_729969 ) ) ( not ( = ?auto_729968 ?auto_729970 ) ) ( not ( = ?auto_729968 ?auto_729971 ) ) ( not ( = ?auto_729968 ?auto_729972 ) ) ( not ( = ?auto_729968 ?auto_729973 ) ) ( not ( = ?auto_729968 ?auto_729974 ) ) ( not ( = ?auto_729968 ?auto_729975 ) ) ( not ( = ?auto_729968 ?auto_729976 ) ) ( not ( = ?auto_729968 ?auto_729977 ) ) ( not ( = ?auto_729968 ?auto_729978 ) ) ( not ( = ?auto_729968 ?auto_729979 ) ) ( not ( = ?auto_729968 ?auto_729980 ) ) ( not ( = ?auto_729968 ?auto_729981 ) ) ( not ( = ?auto_729968 ?auto_729982 ) ) ( not ( = ?auto_729968 ?auto_729983 ) ) ( not ( = ?auto_729968 ?auto_729984 ) ) ( not ( = ?auto_729969 ?auto_729970 ) ) ( not ( = ?auto_729969 ?auto_729971 ) ) ( not ( = ?auto_729969 ?auto_729972 ) ) ( not ( = ?auto_729969 ?auto_729973 ) ) ( not ( = ?auto_729969 ?auto_729974 ) ) ( not ( = ?auto_729969 ?auto_729975 ) ) ( not ( = ?auto_729969 ?auto_729976 ) ) ( not ( = ?auto_729969 ?auto_729977 ) ) ( not ( = ?auto_729969 ?auto_729978 ) ) ( not ( = ?auto_729969 ?auto_729979 ) ) ( not ( = ?auto_729969 ?auto_729980 ) ) ( not ( = ?auto_729969 ?auto_729981 ) ) ( not ( = ?auto_729969 ?auto_729982 ) ) ( not ( = ?auto_729969 ?auto_729983 ) ) ( not ( = ?auto_729969 ?auto_729984 ) ) ( not ( = ?auto_729970 ?auto_729971 ) ) ( not ( = ?auto_729970 ?auto_729972 ) ) ( not ( = ?auto_729970 ?auto_729973 ) ) ( not ( = ?auto_729970 ?auto_729974 ) ) ( not ( = ?auto_729970 ?auto_729975 ) ) ( not ( = ?auto_729970 ?auto_729976 ) ) ( not ( = ?auto_729970 ?auto_729977 ) ) ( not ( = ?auto_729970 ?auto_729978 ) ) ( not ( = ?auto_729970 ?auto_729979 ) ) ( not ( = ?auto_729970 ?auto_729980 ) ) ( not ( = ?auto_729970 ?auto_729981 ) ) ( not ( = ?auto_729970 ?auto_729982 ) ) ( not ( = ?auto_729970 ?auto_729983 ) ) ( not ( = ?auto_729970 ?auto_729984 ) ) ( not ( = ?auto_729971 ?auto_729972 ) ) ( not ( = ?auto_729971 ?auto_729973 ) ) ( not ( = ?auto_729971 ?auto_729974 ) ) ( not ( = ?auto_729971 ?auto_729975 ) ) ( not ( = ?auto_729971 ?auto_729976 ) ) ( not ( = ?auto_729971 ?auto_729977 ) ) ( not ( = ?auto_729971 ?auto_729978 ) ) ( not ( = ?auto_729971 ?auto_729979 ) ) ( not ( = ?auto_729971 ?auto_729980 ) ) ( not ( = ?auto_729971 ?auto_729981 ) ) ( not ( = ?auto_729971 ?auto_729982 ) ) ( not ( = ?auto_729971 ?auto_729983 ) ) ( not ( = ?auto_729971 ?auto_729984 ) ) ( not ( = ?auto_729972 ?auto_729973 ) ) ( not ( = ?auto_729972 ?auto_729974 ) ) ( not ( = ?auto_729972 ?auto_729975 ) ) ( not ( = ?auto_729972 ?auto_729976 ) ) ( not ( = ?auto_729972 ?auto_729977 ) ) ( not ( = ?auto_729972 ?auto_729978 ) ) ( not ( = ?auto_729972 ?auto_729979 ) ) ( not ( = ?auto_729972 ?auto_729980 ) ) ( not ( = ?auto_729972 ?auto_729981 ) ) ( not ( = ?auto_729972 ?auto_729982 ) ) ( not ( = ?auto_729972 ?auto_729983 ) ) ( not ( = ?auto_729972 ?auto_729984 ) ) ( not ( = ?auto_729973 ?auto_729974 ) ) ( not ( = ?auto_729973 ?auto_729975 ) ) ( not ( = ?auto_729973 ?auto_729976 ) ) ( not ( = ?auto_729973 ?auto_729977 ) ) ( not ( = ?auto_729973 ?auto_729978 ) ) ( not ( = ?auto_729973 ?auto_729979 ) ) ( not ( = ?auto_729973 ?auto_729980 ) ) ( not ( = ?auto_729973 ?auto_729981 ) ) ( not ( = ?auto_729973 ?auto_729982 ) ) ( not ( = ?auto_729973 ?auto_729983 ) ) ( not ( = ?auto_729973 ?auto_729984 ) ) ( not ( = ?auto_729974 ?auto_729975 ) ) ( not ( = ?auto_729974 ?auto_729976 ) ) ( not ( = ?auto_729974 ?auto_729977 ) ) ( not ( = ?auto_729974 ?auto_729978 ) ) ( not ( = ?auto_729974 ?auto_729979 ) ) ( not ( = ?auto_729974 ?auto_729980 ) ) ( not ( = ?auto_729974 ?auto_729981 ) ) ( not ( = ?auto_729974 ?auto_729982 ) ) ( not ( = ?auto_729974 ?auto_729983 ) ) ( not ( = ?auto_729974 ?auto_729984 ) ) ( not ( = ?auto_729975 ?auto_729976 ) ) ( not ( = ?auto_729975 ?auto_729977 ) ) ( not ( = ?auto_729975 ?auto_729978 ) ) ( not ( = ?auto_729975 ?auto_729979 ) ) ( not ( = ?auto_729975 ?auto_729980 ) ) ( not ( = ?auto_729975 ?auto_729981 ) ) ( not ( = ?auto_729975 ?auto_729982 ) ) ( not ( = ?auto_729975 ?auto_729983 ) ) ( not ( = ?auto_729975 ?auto_729984 ) ) ( not ( = ?auto_729976 ?auto_729977 ) ) ( not ( = ?auto_729976 ?auto_729978 ) ) ( not ( = ?auto_729976 ?auto_729979 ) ) ( not ( = ?auto_729976 ?auto_729980 ) ) ( not ( = ?auto_729976 ?auto_729981 ) ) ( not ( = ?auto_729976 ?auto_729982 ) ) ( not ( = ?auto_729976 ?auto_729983 ) ) ( not ( = ?auto_729976 ?auto_729984 ) ) ( not ( = ?auto_729977 ?auto_729978 ) ) ( not ( = ?auto_729977 ?auto_729979 ) ) ( not ( = ?auto_729977 ?auto_729980 ) ) ( not ( = ?auto_729977 ?auto_729981 ) ) ( not ( = ?auto_729977 ?auto_729982 ) ) ( not ( = ?auto_729977 ?auto_729983 ) ) ( not ( = ?auto_729977 ?auto_729984 ) ) ( not ( = ?auto_729978 ?auto_729979 ) ) ( not ( = ?auto_729978 ?auto_729980 ) ) ( not ( = ?auto_729978 ?auto_729981 ) ) ( not ( = ?auto_729978 ?auto_729982 ) ) ( not ( = ?auto_729978 ?auto_729983 ) ) ( not ( = ?auto_729978 ?auto_729984 ) ) ( not ( = ?auto_729979 ?auto_729980 ) ) ( not ( = ?auto_729979 ?auto_729981 ) ) ( not ( = ?auto_729979 ?auto_729982 ) ) ( not ( = ?auto_729979 ?auto_729983 ) ) ( not ( = ?auto_729979 ?auto_729984 ) ) ( not ( = ?auto_729980 ?auto_729981 ) ) ( not ( = ?auto_729980 ?auto_729982 ) ) ( not ( = ?auto_729980 ?auto_729983 ) ) ( not ( = ?auto_729980 ?auto_729984 ) ) ( not ( = ?auto_729981 ?auto_729982 ) ) ( not ( = ?auto_729981 ?auto_729983 ) ) ( not ( = ?auto_729981 ?auto_729984 ) ) ( not ( = ?auto_729982 ?auto_729983 ) ) ( not ( = ?auto_729982 ?auto_729984 ) ) ( not ( = ?auto_729983 ?auto_729984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_729983 ?auto_729984 )
      ( !STACK ?auto_729983 ?auto_729982 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730034 - BLOCK
      ?auto_730035 - BLOCK
      ?auto_730036 - BLOCK
      ?auto_730037 - BLOCK
      ?auto_730038 - BLOCK
      ?auto_730039 - BLOCK
      ?auto_730040 - BLOCK
      ?auto_730041 - BLOCK
      ?auto_730042 - BLOCK
      ?auto_730043 - BLOCK
      ?auto_730044 - BLOCK
      ?auto_730045 - BLOCK
      ?auto_730046 - BLOCK
      ?auto_730047 - BLOCK
      ?auto_730048 - BLOCK
      ?auto_730049 - BLOCK
    )
    :vars
    (
      ?auto_730050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730049 ?auto_730050 ) ( ON-TABLE ?auto_730034 ) ( ON ?auto_730035 ?auto_730034 ) ( ON ?auto_730036 ?auto_730035 ) ( ON ?auto_730037 ?auto_730036 ) ( ON ?auto_730038 ?auto_730037 ) ( ON ?auto_730039 ?auto_730038 ) ( ON ?auto_730040 ?auto_730039 ) ( ON ?auto_730041 ?auto_730040 ) ( ON ?auto_730042 ?auto_730041 ) ( ON ?auto_730043 ?auto_730042 ) ( ON ?auto_730044 ?auto_730043 ) ( ON ?auto_730045 ?auto_730044 ) ( ON ?auto_730046 ?auto_730045 ) ( ON ?auto_730047 ?auto_730046 ) ( not ( = ?auto_730034 ?auto_730035 ) ) ( not ( = ?auto_730034 ?auto_730036 ) ) ( not ( = ?auto_730034 ?auto_730037 ) ) ( not ( = ?auto_730034 ?auto_730038 ) ) ( not ( = ?auto_730034 ?auto_730039 ) ) ( not ( = ?auto_730034 ?auto_730040 ) ) ( not ( = ?auto_730034 ?auto_730041 ) ) ( not ( = ?auto_730034 ?auto_730042 ) ) ( not ( = ?auto_730034 ?auto_730043 ) ) ( not ( = ?auto_730034 ?auto_730044 ) ) ( not ( = ?auto_730034 ?auto_730045 ) ) ( not ( = ?auto_730034 ?auto_730046 ) ) ( not ( = ?auto_730034 ?auto_730047 ) ) ( not ( = ?auto_730034 ?auto_730048 ) ) ( not ( = ?auto_730034 ?auto_730049 ) ) ( not ( = ?auto_730034 ?auto_730050 ) ) ( not ( = ?auto_730035 ?auto_730036 ) ) ( not ( = ?auto_730035 ?auto_730037 ) ) ( not ( = ?auto_730035 ?auto_730038 ) ) ( not ( = ?auto_730035 ?auto_730039 ) ) ( not ( = ?auto_730035 ?auto_730040 ) ) ( not ( = ?auto_730035 ?auto_730041 ) ) ( not ( = ?auto_730035 ?auto_730042 ) ) ( not ( = ?auto_730035 ?auto_730043 ) ) ( not ( = ?auto_730035 ?auto_730044 ) ) ( not ( = ?auto_730035 ?auto_730045 ) ) ( not ( = ?auto_730035 ?auto_730046 ) ) ( not ( = ?auto_730035 ?auto_730047 ) ) ( not ( = ?auto_730035 ?auto_730048 ) ) ( not ( = ?auto_730035 ?auto_730049 ) ) ( not ( = ?auto_730035 ?auto_730050 ) ) ( not ( = ?auto_730036 ?auto_730037 ) ) ( not ( = ?auto_730036 ?auto_730038 ) ) ( not ( = ?auto_730036 ?auto_730039 ) ) ( not ( = ?auto_730036 ?auto_730040 ) ) ( not ( = ?auto_730036 ?auto_730041 ) ) ( not ( = ?auto_730036 ?auto_730042 ) ) ( not ( = ?auto_730036 ?auto_730043 ) ) ( not ( = ?auto_730036 ?auto_730044 ) ) ( not ( = ?auto_730036 ?auto_730045 ) ) ( not ( = ?auto_730036 ?auto_730046 ) ) ( not ( = ?auto_730036 ?auto_730047 ) ) ( not ( = ?auto_730036 ?auto_730048 ) ) ( not ( = ?auto_730036 ?auto_730049 ) ) ( not ( = ?auto_730036 ?auto_730050 ) ) ( not ( = ?auto_730037 ?auto_730038 ) ) ( not ( = ?auto_730037 ?auto_730039 ) ) ( not ( = ?auto_730037 ?auto_730040 ) ) ( not ( = ?auto_730037 ?auto_730041 ) ) ( not ( = ?auto_730037 ?auto_730042 ) ) ( not ( = ?auto_730037 ?auto_730043 ) ) ( not ( = ?auto_730037 ?auto_730044 ) ) ( not ( = ?auto_730037 ?auto_730045 ) ) ( not ( = ?auto_730037 ?auto_730046 ) ) ( not ( = ?auto_730037 ?auto_730047 ) ) ( not ( = ?auto_730037 ?auto_730048 ) ) ( not ( = ?auto_730037 ?auto_730049 ) ) ( not ( = ?auto_730037 ?auto_730050 ) ) ( not ( = ?auto_730038 ?auto_730039 ) ) ( not ( = ?auto_730038 ?auto_730040 ) ) ( not ( = ?auto_730038 ?auto_730041 ) ) ( not ( = ?auto_730038 ?auto_730042 ) ) ( not ( = ?auto_730038 ?auto_730043 ) ) ( not ( = ?auto_730038 ?auto_730044 ) ) ( not ( = ?auto_730038 ?auto_730045 ) ) ( not ( = ?auto_730038 ?auto_730046 ) ) ( not ( = ?auto_730038 ?auto_730047 ) ) ( not ( = ?auto_730038 ?auto_730048 ) ) ( not ( = ?auto_730038 ?auto_730049 ) ) ( not ( = ?auto_730038 ?auto_730050 ) ) ( not ( = ?auto_730039 ?auto_730040 ) ) ( not ( = ?auto_730039 ?auto_730041 ) ) ( not ( = ?auto_730039 ?auto_730042 ) ) ( not ( = ?auto_730039 ?auto_730043 ) ) ( not ( = ?auto_730039 ?auto_730044 ) ) ( not ( = ?auto_730039 ?auto_730045 ) ) ( not ( = ?auto_730039 ?auto_730046 ) ) ( not ( = ?auto_730039 ?auto_730047 ) ) ( not ( = ?auto_730039 ?auto_730048 ) ) ( not ( = ?auto_730039 ?auto_730049 ) ) ( not ( = ?auto_730039 ?auto_730050 ) ) ( not ( = ?auto_730040 ?auto_730041 ) ) ( not ( = ?auto_730040 ?auto_730042 ) ) ( not ( = ?auto_730040 ?auto_730043 ) ) ( not ( = ?auto_730040 ?auto_730044 ) ) ( not ( = ?auto_730040 ?auto_730045 ) ) ( not ( = ?auto_730040 ?auto_730046 ) ) ( not ( = ?auto_730040 ?auto_730047 ) ) ( not ( = ?auto_730040 ?auto_730048 ) ) ( not ( = ?auto_730040 ?auto_730049 ) ) ( not ( = ?auto_730040 ?auto_730050 ) ) ( not ( = ?auto_730041 ?auto_730042 ) ) ( not ( = ?auto_730041 ?auto_730043 ) ) ( not ( = ?auto_730041 ?auto_730044 ) ) ( not ( = ?auto_730041 ?auto_730045 ) ) ( not ( = ?auto_730041 ?auto_730046 ) ) ( not ( = ?auto_730041 ?auto_730047 ) ) ( not ( = ?auto_730041 ?auto_730048 ) ) ( not ( = ?auto_730041 ?auto_730049 ) ) ( not ( = ?auto_730041 ?auto_730050 ) ) ( not ( = ?auto_730042 ?auto_730043 ) ) ( not ( = ?auto_730042 ?auto_730044 ) ) ( not ( = ?auto_730042 ?auto_730045 ) ) ( not ( = ?auto_730042 ?auto_730046 ) ) ( not ( = ?auto_730042 ?auto_730047 ) ) ( not ( = ?auto_730042 ?auto_730048 ) ) ( not ( = ?auto_730042 ?auto_730049 ) ) ( not ( = ?auto_730042 ?auto_730050 ) ) ( not ( = ?auto_730043 ?auto_730044 ) ) ( not ( = ?auto_730043 ?auto_730045 ) ) ( not ( = ?auto_730043 ?auto_730046 ) ) ( not ( = ?auto_730043 ?auto_730047 ) ) ( not ( = ?auto_730043 ?auto_730048 ) ) ( not ( = ?auto_730043 ?auto_730049 ) ) ( not ( = ?auto_730043 ?auto_730050 ) ) ( not ( = ?auto_730044 ?auto_730045 ) ) ( not ( = ?auto_730044 ?auto_730046 ) ) ( not ( = ?auto_730044 ?auto_730047 ) ) ( not ( = ?auto_730044 ?auto_730048 ) ) ( not ( = ?auto_730044 ?auto_730049 ) ) ( not ( = ?auto_730044 ?auto_730050 ) ) ( not ( = ?auto_730045 ?auto_730046 ) ) ( not ( = ?auto_730045 ?auto_730047 ) ) ( not ( = ?auto_730045 ?auto_730048 ) ) ( not ( = ?auto_730045 ?auto_730049 ) ) ( not ( = ?auto_730045 ?auto_730050 ) ) ( not ( = ?auto_730046 ?auto_730047 ) ) ( not ( = ?auto_730046 ?auto_730048 ) ) ( not ( = ?auto_730046 ?auto_730049 ) ) ( not ( = ?auto_730046 ?auto_730050 ) ) ( not ( = ?auto_730047 ?auto_730048 ) ) ( not ( = ?auto_730047 ?auto_730049 ) ) ( not ( = ?auto_730047 ?auto_730050 ) ) ( not ( = ?auto_730048 ?auto_730049 ) ) ( not ( = ?auto_730048 ?auto_730050 ) ) ( not ( = ?auto_730049 ?auto_730050 ) ) ( CLEAR ?auto_730047 ) ( ON ?auto_730048 ?auto_730049 ) ( CLEAR ?auto_730048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_730034 ?auto_730035 ?auto_730036 ?auto_730037 ?auto_730038 ?auto_730039 ?auto_730040 ?auto_730041 ?auto_730042 ?auto_730043 ?auto_730044 ?auto_730045 ?auto_730046 ?auto_730047 ?auto_730048 )
      ( MAKE-16PILE ?auto_730034 ?auto_730035 ?auto_730036 ?auto_730037 ?auto_730038 ?auto_730039 ?auto_730040 ?auto_730041 ?auto_730042 ?auto_730043 ?auto_730044 ?auto_730045 ?auto_730046 ?auto_730047 ?auto_730048 ?auto_730049 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730100 - BLOCK
      ?auto_730101 - BLOCK
      ?auto_730102 - BLOCK
      ?auto_730103 - BLOCK
      ?auto_730104 - BLOCK
      ?auto_730105 - BLOCK
      ?auto_730106 - BLOCK
      ?auto_730107 - BLOCK
      ?auto_730108 - BLOCK
      ?auto_730109 - BLOCK
      ?auto_730110 - BLOCK
      ?auto_730111 - BLOCK
      ?auto_730112 - BLOCK
      ?auto_730113 - BLOCK
      ?auto_730114 - BLOCK
      ?auto_730115 - BLOCK
    )
    :vars
    (
      ?auto_730116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730115 ?auto_730116 ) ( ON-TABLE ?auto_730100 ) ( ON ?auto_730101 ?auto_730100 ) ( ON ?auto_730102 ?auto_730101 ) ( ON ?auto_730103 ?auto_730102 ) ( ON ?auto_730104 ?auto_730103 ) ( ON ?auto_730105 ?auto_730104 ) ( ON ?auto_730106 ?auto_730105 ) ( ON ?auto_730107 ?auto_730106 ) ( ON ?auto_730108 ?auto_730107 ) ( ON ?auto_730109 ?auto_730108 ) ( ON ?auto_730110 ?auto_730109 ) ( ON ?auto_730111 ?auto_730110 ) ( ON ?auto_730112 ?auto_730111 ) ( not ( = ?auto_730100 ?auto_730101 ) ) ( not ( = ?auto_730100 ?auto_730102 ) ) ( not ( = ?auto_730100 ?auto_730103 ) ) ( not ( = ?auto_730100 ?auto_730104 ) ) ( not ( = ?auto_730100 ?auto_730105 ) ) ( not ( = ?auto_730100 ?auto_730106 ) ) ( not ( = ?auto_730100 ?auto_730107 ) ) ( not ( = ?auto_730100 ?auto_730108 ) ) ( not ( = ?auto_730100 ?auto_730109 ) ) ( not ( = ?auto_730100 ?auto_730110 ) ) ( not ( = ?auto_730100 ?auto_730111 ) ) ( not ( = ?auto_730100 ?auto_730112 ) ) ( not ( = ?auto_730100 ?auto_730113 ) ) ( not ( = ?auto_730100 ?auto_730114 ) ) ( not ( = ?auto_730100 ?auto_730115 ) ) ( not ( = ?auto_730100 ?auto_730116 ) ) ( not ( = ?auto_730101 ?auto_730102 ) ) ( not ( = ?auto_730101 ?auto_730103 ) ) ( not ( = ?auto_730101 ?auto_730104 ) ) ( not ( = ?auto_730101 ?auto_730105 ) ) ( not ( = ?auto_730101 ?auto_730106 ) ) ( not ( = ?auto_730101 ?auto_730107 ) ) ( not ( = ?auto_730101 ?auto_730108 ) ) ( not ( = ?auto_730101 ?auto_730109 ) ) ( not ( = ?auto_730101 ?auto_730110 ) ) ( not ( = ?auto_730101 ?auto_730111 ) ) ( not ( = ?auto_730101 ?auto_730112 ) ) ( not ( = ?auto_730101 ?auto_730113 ) ) ( not ( = ?auto_730101 ?auto_730114 ) ) ( not ( = ?auto_730101 ?auto_730115 ) ) ( not ( = ?auto_730101 ?auto_730116 ) ) ( not ( = ?auto_730102 ?auto_730103 ) ) ( not ( = ?auto_730102 ?auto_730104 ) ) ( not ( = ?auto_730102 ?auto_730105 ) ) ( not ( = ?auto_730102 ?auto_730106 ) ) ( not ( = ?auto_730102 ?auto_730107 ) ) ( not ( = ?auto_730102 ?auto_730108 ) ) ( not ( = ?auto_730102 ?auto_730109 ) ) ( not ( = ?auto_730102 ?auto_730110 ) ) ( not ( = ?auto_730102 ?auto_730111 ) ) ( not ( = ?auto_730102 ?auto_730112 ) ) ( not ( = ?auto_730102 ?auto_730113 ) ) ( not ( = ?auto_730102 ?auto_730114 ) ) ( not ( = ?auto_730102 ?auto_730115 ) ) ( not ( = ?auto_730102 ?auto_730116 ) ) ( not ( = ?auto_730103 ?auto_730104 ) ) ( not ( = ?auto_730103 ?auto_730105 ) ) ( not ( = ?auto_730103 ?auto_730106 ) ) ( not ( = ?auto_730103 ?auto_730107 ) ) ( not ( = ?auto_730103 ?auto_730108 ) ) ( not ( = ?auto_730103 ?auto_730109 ) ) ( not ( = ?auto_730103 ?auto_730110 ) ) ( not ( = ?auto_730103 ?auto_730111 ) ) ( not ( = ?auto_730103 ?auto_730112 ) ) ( not ( = ?auto_730103 ?auto_730113 ) ) ( not ( = ?auto_730103 ?auto_730114 ) ) ( not ( = ?auto_730103 ?auto_730115 ) ) ( not ( = ?auto_730103 ?auto_730116 ) ) ( not ( = ?auto_730104 ?auto_730105 ) ) ( not ( = ?auto_730104 ?auto_730106 ) ) ( not ( = ?auto_730104 ?auto_730107 ) ) ( not ( = ?auto_730104 ?auto_730108 ) ) ( not ( = ?auto_730104 ?auto_730109 ) ) ( not ( = ?auto_730104 ?auto_730110 ) ) ( not ( = ?auto_730104 ?auto_730111 ) ) ( not ( = ?auto_730104 ?auto_730112 ) ) ( not ( = ?auto_730104 ?auto_730113 ) ) ( not ( = ?auto_730104 ?auto_730114 ) ) ( not ( = ?auto_730104 ?auto_730115 ) ) ( not ( = ?auto_730104 ?auto_730116 ) ) ( not ( = ?auto_730105 ?auto_730106 ) ) ( not ( = ?auto_730105 ?auto_730107 ) ) ( not ( = ?auto_730105 ?auto_730108 ) ) ( not ( = ?auto_730105 ?auto_730109 ) ) ( not ( = ?auto_730105 ?auto_730110 ) ) ( not ( = ?auto_730105 ?auto_730111 ) ) ( not ( = ?auto_730105 ?auto_730112 ) ) ( not ( = ?auto_730105 ?auto_730113 ) ) ( not ( = ?auto_730105 ?auto_730114 ) ) ( not ( = ?auto_730105 ?auto_730115 ) ) ( not ( = ?auto_730105 ?auto_730116 ) ) ( not ( = ?auto_730106 ?auto_730107 ) ) ( not ( = ?auto_730106 ?auto_730108 ) ) ( not ( = ?auto_730106 ?auto_730109 ) ) ( not ( = ?auto_730106 ?auto_730110 ) ) ( not ( = ?auto_730106 ?auto_730111 ) ) ( not ( = ?auto_730106 ?auto_730112 ) ) ( not ( = ?auto_730106 ?auto_730113 ) ) ( not ( = ?auto_730106 ?auto_730114 ) ) ( not ( = ?auto_730106 ?auto_730115 ) ) ( not ( = ?auto_730106 ?auto_730116 ) ) ( not ( = ?auto_730107 ?auto_730108 ) ) ( not ( = ?auto_730107 ?auto_730109 ) ) ( not ( = ?auto_730107 ?auto_730110 ) ) ( not ( = ?auto_730107 ?auto_730111 ) ) ( not ( = ?auto_730107 ?auto_730112 ) ) ( not ( = ?auto_730107 ?auto_730113 ) ) ( not ( = ?auto_730107 ?auto_730114 ) ) ( not ( = ?auto_730107 ?auto_730115 ) ) ( not ( = ?auto_730107 ?auto_730116 ) ) ( not ( = ?auto_730108 ?auto_730109 ) ) ( not ( = ?auto_730108 ?auto_730110 ) ) ( not ( = ?auto_730108 ?auto_730111 ) ) ( not ( = ?auto_730108 ?auto_730112 ) ) ( not ( = ?auto_730108 ?auto_730113 ) ) ( not ( = ?auto_730108 ?auto_730114 ) ) ( not ( = ?auto_730108 ?auto_730115 ) ) ( not ( = ?auto_730108 ?auto_730116 ) ) ( not ( = ?auto_730109 ?auto_730110 ) ) ( not ( = ?auto_730109 ?auto_730111 ) ) ( not ( = ?auto_730109 ?auto_730112 ) ) ( not ( = ?auto_730109 ?auto_730113 ) ) ( not ( = ?auto_730109 ?auto_730114 ) ) ( not ( = ?auto_730109 ?auto_730115 ) ) ( not ( = ?auto_730109 ?auto_730116 ) ) ( not ( = ?auto_730110 ?auto_730111 ) ) ( not ( = ?auto_730110 ?auto_730112 ) ) ( not ( = ?auto_730110 ?auto_730113 ) ) ( not ( = ?auto_730110 ?auto_730114 ) ) ( not ( = ?auto_730110 ?auto_730115 ) ) ( not ( = ?auto_730110 ?auto_730116 ) ) ( not ( = ?auto_730111 ?auto_730112 ) ) ( not ( = ?auto_730111 ?auto_730113 ) ) ( not ( = ?auto_730111 ?auto_730114 ) ) ( not ( = ?auto_730111 ?auto_730115 ) ) ( not ( = ?auto_730111 ?auto_730116 ) ) ( not ( = ?auto_730112 ?auto_730113 ) ) ( not ( = ?auto_730112 ?auto_730114 ) ) ( not ( = ?auto_730112 ?auto_730115 ) ) ( not ( = ?auto_730112 ?auto_730116 ) ) ( not ( = ?auto_730113 ?auto_730114 ) ) ( not ( = ?auto_730113 ?auto_730115 ) ) ( not ( = ?auto_730113 ?auto_730116 ) ) ( not ( = ?auto_730114 ?auto_730115 ) ) ( not ( = ?auto_730114 ?auto_730116 ) ) ( not ( = ?auto_730115 ?auto_730116 ) ) ( ON ?auto_730114 ?auto_730115 ) ( CLEAR ?auto_730112 ) ( ON ?auto_730113 ?auto_730114 ) ( CLEAR ?auto_730113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_730100 ?auto_730101 ?auto_730102 ?auto_730103 ?auto_730104 ?auto_730105 ?auto_730106 ?auto_730107 ?auto_730108 ?auto_730109 ?auto_730110 ?auto_730111 ?auto_730112 ?auto_730113 )
      ( MAKE-16PILE ?auto_730100 ?auto_730101 ?auto_730102 ?auto_730103 ?auto_730104 ?auto_730105 ?auto_730106 ?auto_730107 ?auto_730108 ?auto_730109 ?auto_730110 ?auto_730111 ?auto_730112 ?auto_730113 ?auto_730114 ?auto_730115 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730166 - BLOCK
      ?auto_730167 - BLOCK
      ?auto_730168 - BLOCK
      ?auto_730169 - BLOCK
      ?auto_730170 - BLOCK
      ?auto_730171 - BLOCK
      ?auto_730172 - BLOCK
      ?auto_730173 - BLOCK
      ?auto_730174 - BLOCK
      ?auto_730175 - BLOCK
      ?auto_730176 - BLOCK
      ?auto_730177 - BLOCK
      ?auto_730178 - BLOCK
      ?auto_730179 - BLOCK
      ?auto_730180 - BLOCK
      ?auto_730181 - BLOCK
    )
    :vars
    (
      ?auto_730182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730181 ?auto_730182 ) ( ON-TABLE ?auto_730166 ) ( ON ?auto_730167 ?auto_730166 ) ( ON ?auto_730168 ?auto_730167 ) ( ON ?auto_730169 ?auto_730168 ) ( ON ?auto_730170 ?auto_730169 ) ( ON ?auto_730171 ?auto_730170 ) ( ON ?auto_730172 ?auto_730171 ) ( ON ?auto_730173 ?auto_730172 ) ( ON ?auto_730174 ?auto_730173 ) ( ON ?auto_730175 ?auto_730174 ) ( ON ?auto_730176 ?auto_730175 ) ( ON ?auto_730177 ?auto_730176 ) ( not ( = ?auto_730166 ?auto_730167 ) ) ( not ( = ?auto_730166 ?auto_730168 ) ) ( not ( = ?auto_730166 ?auto_730169 ) ) ( not ( = ?auto_730166 ?auto_730170 ) ) ( not ( = ?auto_730166 ?auto_730171 ) ) ( not ( = ?auto_730166 ?auto_730172 ) ) ( not ( = ?auto_730166 ?auto_730173 ) ) ( not ( = ?auto_730166 ?auto_730174 ) ) ( not ( = ?auto_730166 ?auto_730175 ) ) ( not ( = ?auto_730166 ?auto_730176 ) ) ( not ( = ?auto_730166 ?auto_730177 ) ) ( not ( = ?auto_730166 ?auto_730178 ) ) ( not ( = ?auto_730166 ?auto_730179 ) ) ( not ( = ?auto_730166 ?auto_730180 ) ) ( not ( = ?auto_730166 ?auto_730181 ) ) ( not ( = ?auto_730166 ?auto_730182 ) ) ( not ( = ?auto_730167 ?auto_730168 ) ) ( not ( = ?auto_730167 ?auto_730169 ) ) ( not ( = ?auto_730167 ?auto_730170 ) ) ( not ( = ?auto_730167 ?auto_730171 ) ) ( not ( = ?auto_730167 ?auto_730172 ) ) ( not ( = ?auto_730167 ?auto_730173 ) ) ( not ( = ?auto_730167 ?auto_730174 ) ) ( not ( = ?auto_730167 ?auto_730175 ) ) ( not ( = ?auto_730167 ?auto_730176 ) ) ( not ( = ?auto_730167 ?auto_730177 ) ) ( not ( = ?auto_730167 ?auto_730178 ) ) ( not ( = ?auto_730167 ?auto_730179 ) ) ( not ( = ?auto_730167 ?auto_730180 ) ) ( not ( = ?auto_730167 ?auto_730181 ) ) ( not ( = ?auto_730167 ?auto_730182 ) ) ( not ( = ?auto_730168 ?auto_730169 ) ) ( not ( = ?auto_730168 ?auto_730170 ) ) ( not ( = ?auto_730168 ?auto_730171 ) ) ( not ( = ?auto_730168 ?auto_730172 ) ) ( not ( = ?auto_730168 ?auto_730173 ) ) ( not ( = ?auto_730168 ?auto_730174 ) ) ( not ( = ?auto_730168 ?auto_730175 ) ) ( not ( = ?auto_730168 ?auto_730176 ) ) ( not ( = ?auto_730168 ?auto_730177 ) ) ( not ( = ?auto_730168 ?auto_730178 ) ) ( not ( = ?auto_730168 ?auto_730179 ) ) ( not ( = ?auto_730168 ?auto_730180 ) ) ( not ( = ?auto_730168 ?auto_730181 ) ) ( not ( = ?auto_730168 ?auto_730182 ) ) ( not ( = ?auto_730169 ?auto_730170 ) ) ( not ( = ?auto_730169 ?auto_730171 ) ) ( not ( = ?auto_730169 ?auto_730172 ) ) ( not ( = ?auto_730169 ?auto_730173 ) ) ( not ( = ?auto_730169 ?auto_730174 ) ) ( not ( = ?auto_730169 ?auto_730175 ) ) ( not ( = ?auto_730169 ?auto_730176 ) ) ( not ( = ?auto_730169 ?auto_730177 ) ) ( not ( = ?auto_730169 ?auto_730178 ) ) ( not ( = ?auto_730169 ?auto_730179 ) ) ( not ( = ?auto_730169 ?auto_730180 ) ) ( not ( = ?auto_730169 ?auto_730181 ) ) ( not ( = ?auto_730169 ?auto_730182 ) ) ( not ( = ?auto_730170 ?auto_730171 ) ) ( not ( = ?auto_730170 ?auto_730172 ) ) ( not ( = ?auto_730170 ?auto_730173 ) ) ( not ( = ?auto_730170 ?auto_730174 ) ) ( not ( = ?auto_730170 ?auto_730175 ) ) ( not ( = ?auto_730170 ?auto_730176 ) ) ( not ( = ?auto_730170 ?auto_730177 ) ) ( not ( = ?auto_730170 ?auto_730178 ) ) ( not ( = ?auto_730170 ?auto_730179 ) ) ( not ( = ?auto_730170 ?auto_730180 ) ) ( not ( = ?auto_730170 ?auto_730181 ) ) ( not ( = ?auto_730170 ?auto_730182 ) ) ( not ( = ?auto_730171 ?auto_730172 ) ) ( not ( = ?auto_730171 ?auto_730173 ) ) ( not ( = ?auto_730171 ?auto_730174 ) ) ( not ( = ?auto_730171 ?auto_730175 ) ) ( not ( = ?auto_730171 ?auto_730176 ) ) ( not ( = ?auto_730171 ?auto_730177 ) ) ( not ( = ?auto_730171 ?auto_730178 ) ) ( not ( = ?auto_730171 ?auto_730179 ) ) ( not ( = ?auto_730171 ?auto_730180 ) ) ( not ( = ?auto_730171 ?auto_730181 ) ) ( not ( = ?auto_730171 ?auto_730182 ) ) ( not ( = ?auto_730172 ?auto_730173 ) ) ( not ( = ?auto_730172 ?auto_730174 ) ) ( not ( = ?auto_730172 ?auto_730175 ) ) ( not ( = ?auto_730172 ?auto_730176 ) ) ( not ( = ?auto_730172 ?auto_730177 ) ) ( not ( = ?auto_730172 ?auto_730178 ) ) ( not ( = ?auto_730172 ?auto_730179 ) ) ( not ( = ?auto_730172 ?auto_730180 ) ) ( not ( = ?auto_730172 ?auto_730181 ) ) ( not ( = ?auto_730172 ?auto_730182 ) ) ( not ( = ?auto_730173 ?auto_730174 ) ) ( not ( = ?auto_730173 ?auto_730175 ) ) ( not ( = ?auto_730173 ?auto_730176 ) ) ( not ( = ?auto_730173 ?auto_730177 ) ) ( not ( = ?auto_730173 ?auto_730178 ) ) ( not ( = ?auto_730173 ?auto_730179 ) ) ( not ( = ?auto_730173 ?auto_730180 ) ) ( not ( = ?auto_730173 ?auto_730181 ) ) ( not ( = ?auto_730173 ?auto_730182 ) ) ( not ( = ?auto_730174 ?auto_730175 ) ) ( not ( = ?auto_730174 ?auto_730176 ) ) ( not ( = ?auto_730174 ?auto_730177 ) ) ( not ( = ?auto_730174 ?auto_730178 ) ) ( not ( = ?auto_730174 ?auto_730179 ) ) ( not ( = ?auto_730174 ?auto_730180 ) ) ( not ( = ?auto_730174 ?auto_730181 ) ) ( not ( = ?auto_730174 ?auto_730182 ) ) ( not ( = ?auto_730175 ?auto_730176 ) ) ( not ( = ?auto_730175 ?auto_730177 ) ) ( not ( = ?auto_730175 ?auto_730178 ) ) ( not ( = ?auto_730175 ?auto_730179 ) ) ( not ( = ?auto_730175 ?auto_730180 ) ) ( not ( = ?auto_730175 ?auto_730181 ) ) ( not ( = ?auto_730175 ?auto_730182 ) ) ( not ( = ?auto_730176 ?auto_730177 ) ) ( not ( = ?auto_730176 ?auto_730178 ) ) ( not ( = ?auto_730176 ?auto_730179 ) ) ( not ( = ?auto_730176 ?auto_730180 ) ) ( not ( = ?auto_730176 ?auto_730181 ) ) ( not ( = ?auto_730176 ?auto_730182 ) ) ( not ( = ?auto_730177 ?auto_730178 ) ) ( not ( = ?auto_730177 ?auto_730179 ) ) ( not ( = ?auto_730177 ?auto_730180 ) ) ( not ( = ?auto_730177 ?auto_730181 ) ) ( not ( = ?auto_730177 ?auto_730182 ) ) ( not ( = ?auto_730178 ?auto_730179 ) ) ( not ( = ?auto_730178 ?auto_730180 ) ) ( not ( = ?auto_730178 ?auto_730181 ) ) ( not ( = ?auto_730178 ?auto_730182 ) ) ( not ( = ?auto_730179 ?auto_730180 ) ) ( not ( = ?auto_730179 ?auto_730181 ) ) ( not ( = ?auto_730179 ?auto_730182 ) ) ( not ( = ?auto_730180 ?auto_730181 ) ) ( not ( = ?auto_730180 ?auto_730182 ) ) ( not ( = ?auto_730181 ?auto_730182 ) ) ( ON ?auto_730180 ?auto_730181 ) ( ON ?auto_730179 ?auto_730180 ) ( CLEAR ?auto_730177 ) ( ON ?auto_730178 ?auto_730179 ) ( CLEAR ?auto_730178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_730166 ?auto_730167 ?auto_730168 ?auto_730169 ?auto_730170 ?auto_730171 ?auto_730172 ?auto_730173 ?auto_730174 ?auto_730175 ?auto_730176 ?auto_730177 ?auto_730178 )
      ( MAKE-16PILE ?auto_730166 ?auto_730167 ?auto_730168 ?auto_730169 ?auto_730170 ?auto_730171 ?auto_730172 ?auto_730173 ?auto_730174 ?auto_730175 ?auto_730176 ?auto_730177 ?auto_730178 ?auto_730179 ?auto_730180 ?auto_730181 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730232 - BLOCK
      ?auto_730233 - BLOCK
      ?auto_730234 - BLOCK
      ?auto_730235 - BLOCK
      ?auto_730236 - BLOCK
      ?auto_730237 - BLOCK
      ?auto_730238 - BLOCK
      ?auto_730239 - BLOCK
      ?auto_730240 - BLOCK
      ?auto_730241 - BLOCK
      ?auto_730242 - BLOCK
      ?auto_730243 - BLOCK
      ?auto_730244 - BLOCK
      ?auto_730245 - BLOCK
      ?auto_730246 - BLOCK
      ?auto_730247 - BLOCK
    )
    :vars
    (
      ?auto_730248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730247 ?auto_730248 ) ( ON-TABLE ?auto_730232 ) ( ON ?auto_730233 ?auto_730232 ) ( ON ?auto_730234 ?auto_730233 ) ( ON ?auto_730235 ?auto_730234 ) ( ON ?auto_730236 ?auto_730235 ) ( ON ?auto_730237 ?auto_730236 ) ( ON ?auto_730238 ?auto_730237 ) ( ON ?auto_730239 ?auto_730238 ) ( ON ?auto_730240 ?auto_730239 ) ( ON ?auto_730241 ?auto_730240 ) ( ON ?auto_730242 ?auto_730241 ) ( not ( = ?auto_730232 ?auto_730233 ) ) ( not ( = ?auto_730232 ?auto_730234 ) ) ( not ( = ?auto_730232 ?auto_730235 ) ) ( not ( = ?auto_730232 ?auto_730236 ) ) ( not ( = ?auto_730232 ?auto_730237 ) ) ( not ( = ?auto_730232 ?auto_730238 ) ) ( not ( = ?auto_730232 ?auto_730239 ) ) ( not ( = ?auto_730232 ?auto_730240 ) ) ( not ( = ?auto_730232 ?auto_730241 ) ) ( not ( = ?auto_730232 ?auto_730242 ) ) ( not ( = ?auto_730232 ?auto_730243 ) ) ( not ( = ?auto_730232 ?auto_730244 ) ) ( not ( = ?auto_730232 ?auto_730245 ) ) ( not ( = ?auto_730232 ?auto_730246 ) ) ( not ( = ?auto_730232 ?auto_730247 ) ) ( not ( = ?auto_730232 ?auto_730248 ) ) ( not ( = ?auto_730233 ?auto_730234 ) ) ( not ( = ?auto_730233 ?auto_730235 ) ) ( not ( = ?auto_730233 ?auto_730236 ) ) ( not ( = ?auto_730233 ?auto_730237 ) ) ( not ( = ?auto_730233 ?auto_730238 ) ) ( not ( = ?auto_730233 ?auto_730239 ) ) ( not ( = ?auto_730233 ?auto_730240 ) ) ( not ( = ?auto_730233 ?auto_730241 ) ) ( not ( = ?auto_730233 ?auto_730242 ) ) ( not ( = ?auto_730233 ?auto_730243 ) ) ( not ( = ?auto_730233 ?auto_730244 ) ) ( not ( = ?auto_730233 ?auto_730245 ) ) ( not ( = ?auto_730233 ?auto_730246 ) ) ( not ( = ?auto_730233 ?auto_730247 ) ) ( not ( = ?auto_730233 ?auto_730248 ) ) ( not ( = ?auto_730234 ?auto_730235 ) ) ( not ( = ?auto_730234 ?auto_730236 ) ) ( not ( = ?auto_730234 ?auto_730237 ) ) ( not ( = ?auto_730234 ?auto_730238 ) ) ( not ( = ?auto_730234 ?auto_730239 ) ) ( not ( = ?auto_730234 ?auto_730240 ) ) ( not ( = ?auto_730234 ?auto_730241 ) ) ( not ( = ?auto_730234 ?auto_730242 ) ) ( not ( = ?auto_730234 ?auto_730243 ) ) ( not ( = ?auto_730234 ?auto_730244 ) ) ( not ( = ?auto_730234 ?auto_730245 ) ) ( not ( = ?auto_730234 ?auto_730246 ) ) ( not ( = ?auto_730234 ?auto_730247 ) ) ( not ( = ?auto_730234 ?auto_730248 ) ) ( not ( = ?auto_730235 ?auto_730236 ) ) ( not ( = ?auto_730235 ?auto_730237 ) ) ( not ( = ?auto_730235 ?auto_730238 ) ) ( not ( = ?auto_730235 ?auto_730239 ) ) ( not ( = ?auto_730235 ?auto_730240 ) ) ( not ( = ?auto_730235 ?auto_730241 ) ) ( not ( = ?auto_730235 ?auto_730242 ) ) ( not ( = ?auto_730235 ?auto_730243 ) ) ( not ( = ?auto_730235 ?auto_730244 ) ) ( not ( = ?auto_730235 ?auto_730245 ) ) ( not ( = ?auto_730235 ?auto_730246 ) ) ( not ( = ?auto_730235 ?auto_730247 ) ) ( not ( = ?auto_730235 ?auto_730248 ) ) ( not ( = ?auto_730236 ?auto_730237 ) ) ( not ( = ?auto_730236 ?auto_730238 ) ) ( not ( = ?auto_730236 ?auto_730239 ) ) ( not ( = ?auto_730236 ?auto_730240 ) ) ( not ( = ?auto_730236 ?auto_730241 ) ) ( not ( = ?auto_730236 ?auto_730242 ) ) ( not ( = ?auto_730236 ?auto_730243 ) ) ( not ( = ?auto_730236 ?auto_730244 ) ) ( not ( = ?auto_730236 ?auto_730245 ) ) ( not ( = ?auto_730236 ?auto_730246 ) ) ( not ( = ?auto_730236 ?auto_730247 ) ) ( not ( = ?auto_730236 ?auto_730248 ) ) ( not ( = ?auto_730237 ?auto_730238 ) ) ( not ( = ?auto_730237 ?auto_730239 ) ) ( not ( = ?auto_730237 ?auto_730240 ) ) ( not ( = ?auto_730237 ?auto_730241 ) ) ( not ( = ?auto_730237 ?auto_730242 ) ) ( not ( = ?auto_730237 ?auto_730243 ) ) ( not ( = ?auto_730237 ?auto_730244 ) ) ( not ( = ?auto_730237 ?auto_730245 ) ) ( not ( = ?auto_730237 ?auto_730246 ) ) ( not ( = ?auto_730237 ?auto_730247 ) ) ( not ( = ?auto_730237 ?auto_730248 ) ) ( not ( = ?auto_730238 ?auto_730239 ) ) ( not ( = ?auto_730238 ?auto_730240 ) ) ( not ( = ?auto_730238 ?auto_730241 ) ) ( not ( = ?auto_730238 ?auto_730242 ) ) ( not ( = ?auto_730238 ?auto_730243 ) ) ( not ( = ?auto_730238 ?auto_730244 ) ) ( not ( = ?auto_730238 ?auto_730245 ) ) ( not ( = ?auto_730238 ?auto_730246 ) ) ( not ( = ?auto_730238 ?auto_730247 ) ) ( not ( = ?auto_730238 ?auto_730248 ) ) ( not ( = ?auto_730239 ?auto_730240 ) ) ( not ( = ?auto_730239 ?auto_730241 ) ) ( not ( = ?auto_730239 ?auto_730242 ) ) ( not ( = ?auto_730239 ?auto_730243 ) ) ( not ( = ?auto_730239 ?auto_730244 ) ) ( not ( = ?auto_730239 ?auto_730245 ) ) ( not ( = ?auto_730239 ?auto_730246 ) ) ( not ( = ?auto_730239 ?auto_730247 ) ) ( not ( = ?auto_730239 ?auto_730248 ) ) ( not ( = ?auto_730240 ?auto_730241 ) ) ( not ( = ?auto_730240 ?auto_730242 ) ) ( not ( = ?auto_730240 ?auto_730243 ) ) ( not ( = ?auto_730240 ?auto_730244 ) ) ( not ( = ?auto_730240 ?auto_730245 ) ) ( not ( = ?auto_730240 ?auto_730246 ) ) ( not ( = ?auto_730240 ?auto_730247 ) ) ( not ( = ?auto_730240 ?auto_730248 ) ) ( not ( = ?auto_730241 ?auto_730242 ) ) ( not ( = ?auto_730241 ?auto_730243 ) ) ( not ( = ?auto_730241 ?auto_730244 ) ) ( not ( = ?auto_730241 ?auto_730245 ) ) ( not ( = ?auto_730241 ?auto_730246 ) ) ( not ( = ?auto_730241 ?auto_730247 ) ) ( not ( = ?auto_730241 ?auto_730248 ) ) ( not ( = ?auto_730242 ?auto_730243 ) ) ( not ( = ?auto_730242 ?auto_730244 ) ) ( not ( = ?auto_730242 ?auto_730245 ) ) ( not ( = ?auto_730242 ?auto_730246 ) ) ( not ( = ?auto_730242 ?auto_730247 ) ) ( not ( = ?auto_730242 ?auto_730248 ) ) ( not ( = ?auto_730243 ?auto_730244 ) ) ( not ( = ?auto_730243 ?auto_730245 ) ) ( not ( = ?auto_730243 ?auto_730246 ) ) ( not ( = ?auto_730243 ?auto_730247 ) ) ( not ( = ?auto_730243 ?auto_730248 ) ) ( not ( = ?auto_730244 ?auto_730245 ) ) ( not ( = ?auto_730244 ?auto_730246 ) ) ( not ( = ?auto_730244 ?auto_730247 ) ) ( not ( = ?auto_730244 ?auto_730248 ) ) ( not ( = ?auto_730245 ?auto_730246 ) ) ( not ( = ?auto_730245 ?auto_730247 ) ) ( not ( = ?auto_730245 ?auto_730248 ) ) ( not ( = ?auto_730246 ?auto_730247 ) ) ( not ( = ?auto_730246 ?auto_730248 ) ) ( not ( = ?auto_730247 ?auto_730248 ) ) ( ON ?auto_730246 ?auto_730247 ) ( ON ?auto_730245 ?auto_730246 ) ( ON ?auto_730244 ?auto_730245 ) ( CLEAR ?auto_730242 ) ( ON ?auto_730243 ?auto_730244 ) ( CLEAR ?auto_730243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_730232 ?auto_730233 ?auto_730234 ?auto_730235 ?auto_730236 ?auto_730237 ?auto_730238 ?auto_730239 ?auto_730240 ?auto_730241 ?auto_730242 ?auto_730243 )
      ( MAKE-16PILE ?auto_730232 ?auto_730233 ?auto_730234 ?auto_730235 ?auto_730236 ?auto_730237 ?auto_730238 ?auto_730239 ?auto_730240 ?auto_730241 ?auto_730242 ?auto_730243 ?auto_730244 ?auto_730245 ?auto_730246 ?auto_730247 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730298 - BLOCK
      ?auto_730299 - BLOCK
      ?auto_730300 - BLOCK
      ?auto_730301 - BLOCK
      ?auto_730302 - BLOCK
      ?auto_730303 - BLOCK
      ?auto_730304 - BLOCK
      ?auto_730305 - BLOCK
      ?auto_730306 - BLOCK
      ?auto_730307 - BLOCK
      ?auto_730308 - BLOCK
      ?auto_730309 - BLOCK
      ?auto_730310 - BLOCK
      ?auto_730311 - BLOCK
      ?auto_730312 - BLOCK
      ?auto_730313 - BLOCK
    )
    :vars
    (
      ?auto_730314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730313 ?auto_730314 ) ( ON-TABLE ?auto_730298 ) ( ON ?auto_730299 ?auto_730298 ) ( ON ?auto_730300 ?auto_730299 ) ( ON ?auto_730301 ?auto_730300 ) ( ON ?auto_730302 ?auto_730301 ) ( ON ?auto_730303 ?auto_730302 ) ( ON ?auto_730304 ?auto_730303 ) ( ON ?auto_730305 ?auto_730304 ) ( ON ?auto_730306 ?auto_730305 ) ( ON ?auto_730307 ?auto_730306 ) ( not ( = ?auto_730298 ?auto_730299 ) ) ( not ( = ?auto_730298 ?auto_730300 ) ) ( not ( = ?auto_730298 ?auto_730301 ) ) ( not ( = ?auto_730298 ?auto_730302 ) ) ( not ( = ?auto_730298 ?auto_730303 ) ) ( not ( = ?auto_730298 ?auto_730304 ) ) ( not ( = ?auto_730298 ?auto_730305 ) ) ( not ( = ?auto_730298 ?auto_730306 ) ) ( not ( = ?auto_730298 ?auto_730307 ) ) ( not ( = ?auto_730298 ?auto_730308 ) ) ( not ( = ?auto_730298 ?auto_730309 ) ) ( not ( = ?auto_730298 ?auto_730310 ) ) ( not ( = ?auto_730298 ?auto_730311 ) ) ( not ( = ?auto_730298 ?auto_730312 ) ) ( not ( = ?auto_730298 ?auto_730313 ) ) ( not ( = ?auto_730298 ?auto_730314 ) ) ( not ( = ?auto_730299 ?auto_730300 ) ) ( not ( = ?auto_730299 ?auto_730301 ) ) ( not ( = ?auto_730299 ?auto_730302 ) ) ( not ( = ?auto_730299 ?auto_730303 ) ) ( not ( = ?auto_730299 ?auto_730304 ) ) ( not ( = ?auto_730299 ?auto_730305 ) ) ( not ( = ?auto_730299 ?auto_730306 ) ) ( not ( = ?auto_730299 ?auto_730307 ) ) ( not ( = ?auto_730299 ?auto_730308 ) ) ( not ( = ?auto_730299 ?auto_730309 ) ) ( not ( = ?auto_730299 ?auto_730310 ) ) ( not ( = ?auto_730299 ?auto_730311 ) ) ( not ( = ?auto_730299 ?auto_730312 ) ) ( not ( = ?auto_730299 ?auto_730313 ) ) ( not ( = ?auto_730299 ?auto_730314 ) ) ( not ( = ?auto_730300 ?auto_730301 ) ) ( not ( = ?auto_730300 ?auto_730302 ) ) ( not ( = ?auto_730300 ?auto_730303 ) ) ( not ( = ?auto_730300 ?auto_730304 ) ) ( not ( = ?auto_730300 ?auto_730305 ) ) ( not ( = ?auto_730300 ?auto_730306 ) ) ( not ( = ?auto_730300 ?auto_730307 ) ) ( not ( = ?auto_730300 ?auto_730308 ) ) ( not ( = ?auto_730300 ?auto_730309 ) ) ( not ( = ?auto_730300 ?auto_730310 ) ) ( not ( = ?auto_730300 ?auto_730311 ) ) ( not ( = ?auto_730300 ?auto_730312 ) ) ( not ( = ?auto_730300 ?auto_730313 ) ) ( not ( = ?auto_730300 ?auto_730314 ) ) ( not ( = ?auto_730301 ?auto_730302 ) ) ( not ( = ?auto_730301 ?auto_730303 ) ) ( not ( = ?auto_730301 ?auto_730304 ) ) ( not ( = ?auto_730301 ?auto_730305 ) ) ( not ( = ?auto_730301 ?auto_730306 ) ) ( not ( = ?auto_730301 ?auto_730307 ) ) ( not ( = ?auto_730301 ?auto_730308 ) ) ( not ( = ?auto_730301 ?auto_730309 ) ) ( not ( = ?auto_730301 ?auto_730310 ) ) ( not ( = ?auto_730301 ?auto_730311 ) ) ( not ( = ?auto_730301 ?auto_730312 ) ) ( not ( = ?auto_730301 ?auto_730313 ) ) ( not ( = ?auto_730301 ?auto_730314 ) ) ( not ( = ?auto_730302 ?auto_730303 ) ) ( not ( = ?auto_730302 ?auto_730304 ) ) ( not ( = ?auto_730302 ?auto_730305 ) ) ( not ( = ?auto_730302 ?auto_730306 ) ) ( not ( = ?auto_730302 ?auto_730307 ) ) ( not ( = ?auto_730302 ?auto_730308 ) ) ( not ( = ?auto_730302 ?auto_730309 ) ) ( not ( = ?auto_730302 ?auto_730310 ) ) ( not ( = ?auto_730302 ?auto_730311 ) ) ( not ( = ?auto_730302 ?auto_730312 ) ) ( not ( = ?auto_730302 ?auto_730313 ) ) ( not ( = ?auto_730302 ?auto_730314 ) ) ( not ( = ?auto_730303 ?auto_730304 ) ) ( not ( = ?auto_730303 ?auto_730305 ) ) ( not ( = ?auto_730303 ?auto_730306 ) ) ( not ( = ?auto_730303 ?auto_730307 ) ) ( not ( = ?auto_730303 ?auto_730308 ) ) ( not ( = ?auto_730303 ?auto_730309 ) ) ( not ( = ?auto_730303 ?auto_730310 ) ) ( not ( = ?auto_730303 ?auto_730311 ) ) ( not ( = ?auto_730303 ?auto_730312 ) ) ( not ( = ?auto_730303 ?auto_730313 ) ) ( not ( = ?auto_730303 ?auto_730314 ) ) ( not ( = ?auto_730304 ?auto_730305 ) ) ( not ( = ?auto_730304 ?auto_730306 ) ) ( not ( = ?auto_730304 ?auto_730307 ) ) ( not ( = ?auto_730304 ?auto_730308 ) ) ( not ( = ?auto_730304 ?auto_730309 ) ) ( not ( = ?auto_730304 ?auto_730310 ) ) ( not ( = ?auto_730304 ?auto_730311 ) ) ( not ( = ?auto_730304 ?auto_730312 ) ) ( not ( = ?auto_730304 ?auto_730313 ) ) ( not ( = ?auto_730304 ?auto_730314 ) ) ( not ( = ?auto_730305 ?auto_730306 ) ) ( not ( = ?auto_730305 ?auto_730307 ) ) ( not ( = ?auto_730305 ?auto_730308 ) ) ( not ( = ?auto_730305 ?auto_730309 ) ) ( not ( = ?auto_730305 ?auto_730310 ) ) ( not ( = ?auto_730305 ?auto_730311 ) ) ( not ( = ?auto_730305 ?auto_730312 ) ) ( not ( = ?auto_730305 ?auto_730313 ) ) ( not ( = ?auto_730305 ?auto_730314 ) ) ( not ( = ?auto_730306 ?auto_730307 ) ) ( not ( = ?auto_730306 ?auto_730308 ) ) ( not ( = ?auto_730306 ?auto_730309 ) ) ( not ( = ?auto_730306 ?auto_730310 ) ) ( not ( = ?auto_730306 ?auto_730311 ) ) ( not ( = ?auto_730306 ?auto_730312 ) ) ( not ( = ?auto_730306 ?auto_730313 ) ) ( not ( = ?auto_730306 ?auto_730314 ) ) ( not ( = ?auto_730307 ?auto_730308 ) ) ( not ( = ?auto_730307 ?auto_730309 ) ) ( not ( = ?auto_730307 ?auto_730310 ) ) ( not ( = ?auto_730307 ?auto_730311 ) ) ( not ( = ?auto_730307 ?auto_730312 ) ) ( not ( = ?auto_730307 ?auto_730313 ) ) ( not ( = ?auto_730307 ?auto_730314 ) ) ( not ( = ?auto_730308 ?auto_730309 ) ) ( not ( = ?auto_730308 ?auto_730310 ) ) ( not ( = ?auto_730308 ?auto_730311 ) ) ( not ( = ?auto_730308 ?auto_730312 ) ) ( not ( = ?auto_730308 ?auto_730313 ) ) ( not ( = ?auto_730308 ?auto_730314 ) ) ( not ( = ?auto_730309 ?auto_730310 ) ) ( not ( = ?auto_730309 ?auto_730311 ) ) ( not ( = ?auto_730309 ?auto_730312 ) ) ( not ( = ?auto_730309 ?auto_730313 ) ) ( not ( = ?auto_730309 ?auto_730314 ) ) ( not ( = ?auto_730310 ?auto_730311 ) ) ( not ( = ?auto_730310 ?auto_730312 ) ) ( not ( = ?auto_730310 ?auto_730313 ) ) ( not ( = ?auto_730310 ?auto_730314 ) ) ( not ( = ?auto_730311 ?auto_730312 ) ) ( not ( = ?auto_730311 ?auto_730313 ) ) ( not ( = ?auto_730311 ?auto_730314 ) ) ( not ( = ?auto_730312 ?auto_730313 ) ) ( not ( = ?auto_730312 ?auto_730314 ) ) ( not ( = ?auto_730313 ?auto_730314 ) ) ( ON ?auto_730312 ?auto_730313 ) ( ON ?auto_730311 ?auto_730312 ) ( ON ?auto_730310 ?auto_730311 ) ( ON ?auto_730309 ?auto_730310 ) ( CLEAR ?auto_730307 ) ( ON ?auto_730308 ?auto_730309 ) ( CLEAR ?auto_730308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_730298 ?auto_730299 ?auto_730300 ?auto_730301 ?auto_730302 ?auto_730303 ?auto_730304 ?auto_730305 ?auto_730306 ?auto_730307 ?auto_730308 )
      ( MAKE-16PILE ?auto_730298 ?auto_730299 ?auto_730300 ?auto_730301 ?auto_730302 ?auto_730303 ?auto_730304 ?auto_730305 ?auto_730306 ?auto_730307 ?auto_730308 ?auto_730309 ?auto_730310 ?auto_730311 ?auto_730312 ?auto_730313 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730364 - BLOCK
      ?auto_730365 - BLOCK
      ?auto_730366 - BLOCK
      ?auto_730367 - BLOCK
      ?auto_730368 - BLOCK
      ?auto_730369 - BLOCK
      ?auto_730370 - BLOCK
      ?auto_730371 - BLOCK
      ?auto_730372 - BLOCK
      ?auto_730373 - BLOCK
      ?auto_730374 - BLOCK
      ?auto_730375 - BLOCK
      ?auto_730376 - BLOCK
      ?auto_730377 - BLOCK
      ?auto_730378 - BLOCK
      ?auto_730379 - BLOCK
    )
    :vars
    (
      ?auto_730380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730379 ?auto_730380 ) ( ON-TABLE ?auto_730364 ) ( ON ?auto_730365 ?auto_730364 ) ( ON ?auto_730366 ?auto_730365 ) ( ON ?auto_730367 ?auto_730366 ) ( ON ?auto_730368 ?auto_730367 ) ( ON ?auto_730369 ?auto_730368 ) ( ON ?auto_730370 ?auto_730369 ) ( ON ?auto_730371 ?auto_730370 ) ( ON ?auto_730372 ?auto_730371 ) ( not ( = ?auto_730364 ?auto_730365 ) ) ( not ( = ?auto_730364 ?auto_730366 ) ) ( not ( = ?auto_730364 ?auto_730367 ) ) ( not ( = ?auto_730364 ?auto_730368 ) ) ( not ( = ?auto_730364 ?auto_730369 ) ) ( not ( = ?auto_730364 ?auto_730370 ) ) ( not ( = ?auto_730364 ?auto_730371 ) ) ( not ( = ?auto_730364 ?auto_730372 ) ) ( not ( = ?auto_730364 ?auto_730373 ) ) ( not ( = ?auto_730364 ?auto_730374 ) ) ( not ( = ?auto_730364 ?auto_730375 ) ) ( not ( = ?auto_730364 ?auto_730376 ) ) ( not ( = ?auto_730364 ?auto_730377 ) ) ( not ( = ?auto_730364 ?auto_730378 ) ) ( not ( = ?auto_730364 ?auto_730379 ) ) ( not ( = ?auto_730364 ?auto_730380 ) ) ( not ( = ?auto_730365 ?auto_730366 ) ) ( not ( = ?auto_730365 ?auto_730367 ) ) ( not ( = ?auto_730365 ?auto_730368 ) ) ( not ( = ?auto_730365 ?auto_730369 ) ) ( not ( = ?auto_730365 ?auto_730370 ) ) ( not ( = ?auto_730365 ?auto_730371 ) ) ( not ( = ?auto_730365 ?auto_730372 ) ) ( not ( = ?auto_730365 ?auto_730373 ) ) ( not ( = ?auto_730365 ?auto_730374 ) ) ( not ( = ?auto_730365 ?auto_730375 ) ) ( not ( = ?auto_730365 ?auto_730376 ) ) ( not ( = ?auto_730365 ?auto_730377 ) ) ( not ( = ?auto_730365 ?auto_730378 ) ) ( not ( = ?auto_730365 ?auto_730379 ) ) ( not ( = ?auto_730365 ?auto_730380 ) ) ( not ( = ?auto_730366 ?auto_730367 ) ) ( not ( = ?auto_730366 ?auto_730368 ) ) ( not ( = ?auto_730366 ?auto_730369 ) ) ( not ( = ?auto_730366 ?auto_730370 ) ) ( not ( = ?auto_730366 ?auto_730371 ) ) ( not ( = ?auto_730366 ?auto_730372 ) ) ( not ( = ?auto_730366 ?auto_730373 ) ) ( not ( = ?auto_730366 ?auto_730374 ) ) ( not ( = ?auto_730366 ?auto_730375 ) ) ( not ( = ?auto_730366 ?auto_730376 ) ) ( not ( = ?auto_730366 ?auto_730377 ) ) ( not ( = ?auto_730366 ?auto_730378 ) ) ( not ( = ?auto_730366 ?auto_730379 ) ) ( not ( = ?auto_730366 ?auto_730380 ) ) ( not ( = ?auto_730367 ?auto_730368 ) ) ( not ( = ?auto_730367 ?auto_730369 ) ) ( not ( = ?auto_730367 ?auto_730370 ) ) ( not ( = ?auto_730367 ?auto_730371 ) ) ( not ( = ?auto_730367 ?auto_730372 ) ) ( not ( = ?auto_730367 ?auto_730373 ) ) ( not ( = ?auto_730367 ?auto_730374 ) ) ( not ( = ?auto_730367 ?auto_730375 ) ) ( not ( = ?auto_730367 ?auto_730376 ) ) ( not ( = ?auto_730367 ?auto_730377 ) ) ( not ( = ?auto_730367 ?auto_730378 ) ) ( not ( = ?auto_730367 ?auto_730379 ) ) ( not ( = ?auto_730367 ?auto_730380 ) ) ( not ( = ?auto_730368 ?auto_730369 ) ) ( not ( = ?auto_730368 ?auto_730370 ) ) ( not ( = ?auto_730368 ?auto_730371 ) ) ( not ( = ?auto_730368 ?auto_730372 ) ) ( not ( = ?auto_730368 ?auto_730373 ) ) ( not ( = ?auto_730368 ?auto_730374 ) ) ( not ( = ?auto_730368 ?auto_730375 ) ) ( not ( = ?auto_730368 ?auto_730376 ) ) ( not ( = ?auto_730368 ?auto_730377 ) ) ( not ( = ?auto_730368 ?auto_730378 ) ) ( not ( = ?auto_730368 ?auto_730379 ) ) ( not ( = ?auto_730368 ?auto_730380 ) ) ( not ( = ?auto_730369 ?auto_730370 ) ) ( not ( = ?auto_730369 ?auto_730371 ) ) ( not ( = ?auto_730369 ?auto_730372 ) ) ( not ( = ?auto_730369 ?auto_730373 ) ) ( not ( = ?auto_730369 ?auto_730374 ) ) ( not ( = ?auto_730369 ?auto_730375 ) ) ( not ( = ?auto_730369 ?auto_730376 ) ) ( not ( = ?auto_730369 ?auto_730377 ) ) ( not ( = ?auto_730369 ?auto_730378 ) ) ( not ( = ?auto_730369 ?auto_730379 ) ) ( not ( = ?auto_730369 ?auto_730380 ) ) ( not ( = ?auto_730370 ?auto_730371 ) ) ( not ( = ?auto_730370 ?auto_730372 ) ) ( not ( = ?auto_730370 ?auto_730373 ) ) ( not ( = ?auto_730370 ?auto_730374 ) ) ( not ( = ?auto_730370 ?auto_730375 ) ) ( not ( = ?auto_730370 ?auto_730376 ) ) ( not ( = ?auto_730370 ?auto_730377 ) ) ( not ( = ?auto_730370 ?auto_730378 ) ) ( not ( = ?auto_730370 ?auto_730379 ) ) ( not ( = ?auto_730370 ?auto_730380 ) ) ( not ( = ?auto_730371 ?auto_730372 ) ) ( not ( = ?auto_730371 ?auto_730373 ) ) ( not ( = ?auto_730371 ?auto_730374 ) ) ( not ( = ?auto_730371 ?auto_730375 ) ) ( not ( = ?auto_730371 ?auto_730376 ) ) ( not ( = ?auto_730371 ?auto_730377 ) ) ( not ( = ?auto_730371 ?auto_730378 ) ) ( not ( = ?auto_730371 ?auto_730379 ) ) ( not ( = ?auto_730371 ?auto_730380 ) ) ( not ( = ?auto_730372 ?auto_730373 ) ) ( not ( = ?auto_730372 ?auto_730374 ) ) ( not ( = ?auto_730372 ?auto_730375 ) ) ( not ( = ?auto_730372 ?auto_730376 ) ) ( not ( = ?auto_730372 ?auto_730377 ) ) ( not ( = ?auto_730372 ?auto_730378 ) ) ( not ( = ?auto_730372 ?auto_730379 ) ) ( not ( = ?auto_730372 ?auto_730380 ) ) ( not ( = ?auto_730373 ?auto_730374 ) ) ( not ( = ?auto_730373 ?auto_730375 ) ) ( not ( = ?auto_730373 ?auto_730376 ) ) ( not ( = ?auto_730373 ?auto_730377 ) ) ( not ( = ?auto_730373 ?auto_730378 ) ) ( not ( = ?auto_730373 ?auto_730379 ) ) ( not ( = ?auto_730373 ?auto_730380 ) ) ( not ( = ?auto_730374 ?auto_730375 ) ) ( not ( = ?auto_730374 ?auto_730376 ) ) ( not ( = ?auto_730374 ?auto_730377 ) ) ( not ( = ?auto_730374 ?auto_730378 ) ) ( not ( = ?auto_730374 ?auto_730379 ) ) ( not ( = ?auto_730374 ?auto_730380 ) ) ( not ( = ?auto_730375 ?auto_730376 ) ) ( not ( = ?auto_730375 ?auto_730377 ) ) ( not ( = ?auto_730375 ?auto_730378 ) ) ( not ( = ?auto_730375 ?auto_730379 ) ) ( not ( = ?auto_730375 ?auto_730380 ) ) ( not ( = ?auto_730376 ?auto_730377 ) ) ( not ( = ?auto_730376 ?auto_730378 ) ) ( not ( = ?auto_730376 ?auto_730379 ) ) ( not ( = ?auto_730376 ?auto_730380 ) ) ( not ( = ?auto_730377 ?auto_730378 ) ) ( not ( = ?auto_730377 ?auto_730379 ) ) ( not ( = ?auto_730377 ?auto_730380 ) ) ( not ( = ?auto_730378 ?auto_730379 ) ) ( not ( = ?auto_730378 ?auto_730380 ) ) ( not ( = ?auto_730379 ?auto_730380 ) ) ( ON ?auto_730378 ?auto_730379 ) ( ON ?auto_730377 ?auto_730378 ) ( ON ?auto_730376 ?auto_730377 ) ( ON ?auto_730375 ?auto_730376 ) ( ON ?auto_730374 ?auto_730375 ) ( CLEAR ?auto_730372 ) ( ON ?auto_730373 ?auto_730374 ) ( CLEAR ?auto_730373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_730364 ?auto_730365 ?auto_730366 ?auto_730367 ?auto_730368 ?auto_730369 ?auto_730370 ?auto_730371 ?auto_730372 ?auto_730373 )
      ( MAKE-16PILE ?auto_730364 ?auto_730365 ?auto_730366 ?auto_730367 ?auto_730368 ?auto_730369 ?auto_730370 ?auto_730371 ?auto_730372 ?auto_730373 ?auto_730374 ?auto_730375 ?auto_730376 ?auto_730377 ?auto_730378 ?auto_730379 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730430 - BLOCK
      ?auto_730431 - BLOCK
      ?auto_730432 - BLOCK
      ?auto_730433 - BLOCK
      ?auto_730434 - BLOCK
      ?auto_730435 - BLOCK
      ?auto_730436 - BLOCK
      ?auto_730437 - BLOCK
      ?auto_730438 - BLOCK
      ?auto_730439 - BLOCK
      ?auto_730440 - BLOCK
      ?auto_730441 - BLOCK
      ?auto_730442 - BLOCK
      ?auto_730443 - BLOCK
      ?auto_730444 - BLOCK
      ?auto_730445 - BLOCK
    )
    :vars
    (
      ?auto_730446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730445 ?auto_730446 ) ( ON-TABLE ?auto_730430 ) ( ON ?auto_730431 ?auto_730430 ) ( ON ?auto_730432 ?auto_730431 ) ( ON ?auto_730433 ?auto_730432 ) ( ON ?auto_730434 ?auto_730433 ) ( ON ?auto_730435 ?auto_730434 ) ( ON ?auto_730436 ?auto_730435 ) ( ON ?auto_730437 ?auto_730436 ) ( not ( = ?auto_730430 ?auto_730431 ) ) ( not ( = ?auto_730430 ?auto_730432 ) ) ( not ( = ?auto_730430 ?auto_730433 ) ) ( not ( = ?auto_730430 ?auto_730434 ) ) ( not ( = ?auto_730430 ?auto_730435 ) ) ( not ( = ?auto_730430 ?auto_730436 ) ) ( not ( = ?auto_730430 ?auto_730437 ) ) ( not ( = ?auto_730430 ?auto_730438 ) ) ( not ( = ?auto_730430 ?auto_730439 ) ) ( not ( = ?auto_730430 ?auto_730440 ) ) ( not ( = ?auto_730430 ?auto_730441 ) ) ( not ( = ?auto_730430 ?auto_730442 ) ) ( not ( = ?auto_730430 ?auto_730443 ) ) ( not ( = ?auto_730430 ?auto_730444 ) ) ( not ( = ?auto_730430 ?auto_730445 ) ) ( not ( = ?auto_730430 ?auto_730446 ) ) ( not ( = ?auto_730431 ?auto_730432 ) ) ( not ( = ?auto_730431 ?auto_730433 ) ) ( not ( = ?auto_730431 ?auto_730434 ) ) ( not ( = ?auto_730431 ?auto_730435 ) ) ( not ( = ?auto_730431 ?auto_730436 ) ) ( not ( = ?auto_730431 ?auto_730437 ) ) ( not ( = ?auto_730431 ?auto_730438 ) ) ( not ( = ?auto_730431 ?auto_730439 ) ) ( not ( = ?auto_730431 ?auto_730440 ) ) ( not ( = ?auto_730431 ?auto_730441 ) ) ( not ( = ?auto_730431 ?auto_730442 ) ) ( not ( = ?auto_730431 ?auto_730443 ) ) ( not ( = ?auto_730431 ?auto_730444 ) ) ( not ( = ?auto_730431 ?auto_730445 ) ) ( not ( = ?auto_730431 ?auto_730446 ) ) ( not ( = ?auto_730432 ?auto_730433 ) ) ( not ( = ?auto_730432 ?auto_730434 ) ) ( not ( = ?auto_730432 ?auto_730435 ) ) ( not ( = ?auto_730432 ?auto_730436 ) ) ( not ( = ?auto_730432 ?auto_730437 ) ) ( not ( = ?auto_730432 ?auto_730438 ) ) ( not ( = ?auto_730432 ?auto_730439 ) ) ( not ( = ?auto_730432 ?auto_730440 ) ) ( not ( = ?auto_730432 ?auto_730441 ) ) ( not ( = ?auto_730432 ?auto_730442 ) ) ( not ( = ?auto_730432 ?auto_730443 ) ) ( not ( = ?auto_730432 ?auto_730444 ) ) ( not ( = ?auto_730432 ?auto_730445 ) ) ( not ( = ?auto_730432 ?auto_730446 ) ) ( not ( = ?auto_730433 ?auto_730434 ) ) ( not ( = ?auto_730433 ?auto_730435 ) ) ( not ( = ?auto_730433 ?auto_730436 ) ) ( not ( = ?auto_730433 ?auto_730437 ) ) ( not ( = ?auto_730433 ?auto_730438 ) ) ( not ( = ?auto_730433 ?auto_730439 ) ) ( not ( = ?auto_730433 ?auto_730440 ) ) ( not ( = ?auto_730433 ?auto_730441 ) ) ( not ( = ?auto_730433 ?auto_730442 ) ) ( not ( = ?auto_730433 ?auto_730443 ) ) ( not ( = ?auto_730433 ?auto_730444 ) ) ( not ( = ?auto_730433 ?auto_730445 ) ) ( not ( = ?auto_730433 ?auto_730446 ) ) ( not ( = ?auto_730434 ?auto_730435 ) ) ( not ( = ?auto_730434 ?auto_730436 ) ) ( not ( = ?auto_730434 ?auto_730437 ) ) ( not ( = ?auto_730434 ?auto_730438 ) ) ( not ( = ?auto_730434 ?auto_730439 ) ) ( not ( = ?auto_730434 ?auto_730440 ) ) ( not ( = ?auto_730434 ?auto_730441 ) ) ( not ( = ?auto_730434 ?auto_730442 ) ) ( not ( = ?auto_730434 ?auto_730443 ) ) ( not ( = ?auto_730434 ?auto_730444 ) ) ( not ( = ?auto_730434 ?auto_730445 ) ) ( not ( = ?auto_730434 ?auto_730446 ) ) ( not ( = ?auto_730435 ?auto_730436 ) ) ( not ( = ?auto_730435 ?auto_730437 ) ) ( not ( = ?auto_730435 ?auto_730438 ) ) ( not ( = ?auto_730435 ?auto_730439 ) ) ( not ( = ?auto_730435 ?auto_730440 ) ) ( not ( = ?auto_730435 ?auto_730441 ) ) ( not ( = ?auto_730435 ?auto_730442 ) ) ( not ( = ?auto_730435 ?auto_730443 ) ) ( not ( = ?auto_730435 ?auto_730444 ) ) ( not ( = ?auto_730435 ?auto_730445 ) ) ( not ( = ?auto_730435 ?auto_730446 ) ) ( not ( = ?auto_730436 ?auto_730437 ) ) ( not ( = ?auto_730436 ?auto_730438 ) ) ( not ( = ?auto_730436 ?auto_730439 ) ) ( not ( = ?auto_730436 ?auto_730440 ) ) ( not ( = ?auto_730436 ?auto_730441 ) ) ( not ( = ?auto_730436 ?auto_730442 ) ) ( not ( = ?auto_730436 ?auto_730443 ) ) ( not ( = ?auto_730436 ?auto_730444 ) ) ( not ( = ?auto_730436 ?auto_730445 ) ) ( not ( = ?auto_730436 ?auto_730446 ) ) ( not ( = ?auto_730437 ?auto_730438 ) ) ( not ( = ?auto_730437 ?auto_730439 ) ) ( not ( = ?auto_730437 ?auto_730440 ) ) ( not ( = ?auto_730437 ?auto_730441 ) ) ( not ( = ?auto_730437 ?auto_730442 ) ) ( not ( = ?auto_730437 ?auto_730443 ) ) ( not ( = ?auto_730437 ?auto_730444 ) ) ( not ( = ?auto_730437 ?auto_730445 ) ) ( not ( = ?auto_730437 ?auto_730446 ) ) ( not ( = ?auto_730438 ?auto_730439 ) ) ( not ( = ?auto_730438 ?auto_730440 ) ) ( not ( = ?auto_730438 ?auto_730441 ) ) ( not ( = ?auto_730438 ?auto_730442 ) ) ( not ( = ?auto_730438 ?auto_730443 ) ) ( not ( = ?auto_730438 ?auto_730444 ) ) ( not ( = ?auto_730438 ?auto_730445 ) ) ( not ( = ?auto_730438 ?auto_730446 ) ) ( not ( = ?auto_730439 ?auto_730440 ) ) ( not ( = ?auto_730439 ?auto_730441 ) ) ( not ( = ?auto_730439 ?auto_730442 ) ) ( not ( = ?auto_730439 ?auto_730443 ) ) ( not ( = ?auto_730439 ?auto_730444 ) ) ( not ( = ?auto_730439 ?auto_730445 ) ) ( not ( = ?auto_730439 ?auto_730446 ) ) ( not ( = ?auto_730440 ?auto_730441 ) ) ( not ( = ?auto_730440 ?auto_730442 ) ) ( not ( = ?auto_730440 ?auto_730443 ) ) ( not ( = ?auto_730440 ?auto_730444 ) ) ( not ( = ?auto_730440 ?auto_730445 ) ) ( not ( = ?auto_730440 ?auto_730446 ) ) ( not ( = ?auto_730441 ?auto_730442 ) ) ( not ( = ?auto_730441 ?auto_730443 ) ) ( not ( = ?auto_730441 ?auto_730444 ) ) ( not ( = ?auto_730441 ?auto_730445 ) ) ( not ( = ?auto_730441 ?auto_730446 ) ) ( not ( = ?auto_730442 ?auto_730443 ) ) ( not ( = ?auto_730442 ?auto_730444 ) ) ( not ( = ?auto_730442 ?auto_730445 ) ) ( not ( = ?auto_730442 ?auto_730446 ) ) ( not ( = ?auto_730443 ?auto_730444 ) ) ( not ( = ?auto_730443 ?auto_730445 ) ) ( not ( = ?auto_730443 ?auto_730446 ) ) ( not ( = ?auto_730444 ?auto_730445 ) ) ( not ( = ?auto_730444 ?auto_730446 ) ) ( not ( = ?auto_730445 ?auto_730446 ) ) ( ON ?auto_730444 ?auto_730445 ) ( ON ?auto_730443 ?auto_730444 ) ( ON ?auto_730442 ?auto_730443 ) ( ON ?auto_730441 ?auto_730442 ) ( ON ?auto_730440 ?auto_730441 ) ( ON ?auto_730439 ?auto_730440 ) ( CLEAR ?auto_730437 ) ( ON ?auto_730438 ?auto_730439 ) ( CLEAR ?auto_730438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_730430 ?auto_730431 ?auto_730432 ?auto_730433 ?auto_730434 ?auto_730435 ?auto_730436 ?auto_730437 ?auto_730438 )
      ( MAKE-16PILE ?auto_730430 ?auto_730431 ?auto_730432 ?auto_730433 ?auto_730434 ?auto_730435 ?auto_730436 ?auto_730437 ?auto_730438 ?auto_730439 ?auto_730440 ?auto_730441 ?auto_730442 ?auto_730443 ?auto_730444 ?auto_730445 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730496 - BLOCK
      ?auto_730497 - BLOCK
      ?auto_730498 - BLOCK
      ?auto_730499 - BLOCK
      ?auto_730500 - BLOCK
      ?auto_730501 - BLOCK
      ?auto_730502 - BLOCK
      ?auto_730503 - BLOCK
      ?auto_730504 - BLOCK
      ?auto_730505 - BLOCK
      ?auto_730506 - BLOCK
      ?auto_730507 - BLOCK
      ?auto_730508 - BLOCK
      ?auto_730509 - BLOCK
      ?auto_730510 - BLOCK
      ?auto_730511 - BLOCK
    )
    :vars
    (
      ?auto_730512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730511 ?auto_730512 ) ( ON-TABLE ?auto_730496 ) ( ON ?auto_730497 ?auto_730496 ) ( ON ?auto_730498 ?auto_730497 ) ( ON ?auto_730499 ?auto_730498 ) ( ON ?auto_730500 ?auto_730499 ) ( ON ?auto_730501 ?auto_730500 ) ( ON ?auto_730502 ?auto_730501 ) ( not ( = ?auto_730496 ?auto_730497 ) ) ( not ( = ?auto_730496 ?auto_730498 ) ) ( not ( = ?auto_730496 ?auto_730499 ) ) ( not ( = ?auto_730496 ?auto_730500 ) ) ( not ( = ?auto_730496 ?auto_730501 ) ) ( not ( = ?auto_730496 ?auto_730502 ) ) ( not ( = ?auto_730496 ?auto_730503 ) ) ( not ( = ?auto_730496 ?auto_730504 ) ) ( not ( = ?auto_730496 ?auto_730505 ) ) ( not ( = ?auto_730496 ?auto_730506 ) ) ( not ( = ?auto_730496 ?auto_730507 ) ) ( not ( = ?auto_730496 ?auto_730508 ) ) ( not ( = ?auto_730496 ?auto_730509 ) ) ( not ( = ?auto_730496 ?auto_730510 ) ) ( not ( = ?auto_730496 ?auto_730511 ) ) ( not ( = ?auto_730496 ?auto_730512 ) ) ( not ( = ?auto_730497 ?auto_730498 ) ) ( not ( = ?auto_730497 ?auto_730499 ) ) ( not ( = ?auto_730497 ?auto_730500 ) ) ( not ( = ?auto_730497 ?auto_730501 ) ) ( not ( = ?auto_730497 ?auto_730502 ) ) ( not ( = ?auto_730497 ?auto_730503 ) ) ( not ( = ?auto_730497 ?auto_730504 ) ) ( not ( = ?auto_730497 ?auto_730505 ) ) ( not ( = ?auto_730497 ?auto_730506 ) ) ( not ( = ?auto_730497 ?auto_730507 ) ) ( not ( = ?auto_730497 ?auto_730508 ) ) ( not ( = ?auto_730497 ?auto_730509 ) ) ( not ( = ?auto_730497 ?auto_730510 ) ) ( not ( = ?auto_730497 ?auto_730511 ) ) ( not ( = ?auto_730497 ?auto_730512 ) ) ( not ( = ?auto_730498 ?auto_730499 ) ) ( not ( = ?auto_730498 ?auto_730500 ) ) ( not ( = ?auto_730498 ?auto_730501 ) ) ( not ( = ?auto_730498 ?auto_730502 ) ) ( not ( = ?auto_730498 ?auto_730503 ) ) ( not ( = ?auto_730498 ?auto_730504 ) ) ( not ( = ?auto_730498 ?auto_730505 ) ) ( not ( = ?auto_730498 ?auto_730506 ) ) ( not ( = ?auto_730498 ?auto_730507 ) ) ( not ( = ?auto_730498 ?auto_730508 ) ) ( not ( = ?auto_730498 ?auto_730509 ) ) ( not ( = ?auto_730498 ?auto_730510 ) ) ( not ( = ?auto_730498 ?auto_730511 ) ) ( not ( = ?auto_730498 ?auto_730512 ) ) ( not ( = ?auto_730499 ?auto_730500 ) ) ( not ( = ?auto_730499 ?auto_730501 ) ) ( not ( = ?auto_730499 ?auto_730502 ) ) ( not ( = ?auto_730499 ?auto_730503 ) ) ( not ( = ?auto_730499 ?auto_730504 ) ) ( not ( = ?auto_730499 ?auto_730505 ) ) ( not ( = ?auto_730499 ?auto_730506 ) ) ( not ( = ?auto_730499 ?auto_730507 ) ) ( not ( = ?auto_730499 ?auto_730508 ) ) ( not ( = ?auto_730499 ?auto_730509 ) ) ( not ( = ?auto_730499 ?auto_730510 ) ) ( not ( = ?auto_730499 ?auto_730511 ) ) ( not ( = ?auto_730499 ?auto_730512 ) ) ( not ( = ?auto_730500 ?auto_730501 ) ) ( not ( = ?auto_730500 ?auto_730502 ) ) ( not ( = ?auto_730500 ?auto_730503 ) ) ( not ( = ?auto_730500 ?auto_730504 ) ) ( not ( = ?auto_730500 ?auto_730505 ) ) ( not ( = ?auto_730500 ?auto_730506 ) ) ( not ( = ?auto_730500 ?auto_730507 ) ) ( not ( = ?auto_730500 ?auto_730508 ) ) ( not ( = ?auto_730500 ?auto_730509 ) ) ( not ( = ?auto_730500 ?auto_730510 ) ) ( not ( = ?auto_730500 ?auto_730511 ) ) ( not ( = ?auto_730500 ?auto_730512 ) ) ( not ( = ?auto_730501 ?auto_730502 ) ) ( not ( = ?auto_730501 ?auto_730503 ) ) ( not ( = ?auto_730501 ?auto_730504 ) ) ( not ( = ?auto_730501 ?auto_730505 ) ) ( not ( = ?auto_730501 ?auto_730506 ) ) ( not ( = ?auto_730501 ?auto_730507 ) ) ( not ( = ?auto_730501 ?auto_730508 ) ) ( not ( = ?auto_730501 ?auto_730509 ) ) ( not ( = ?auto_730501 ?auto_730510 ) ) ( not ( = ?auto_730501 ?auto_730511 ) ) ( not ( = ?auto_730501 ?auto_730512 ) ) ( not ( = ?auto_730502 ?auto_730503 ) ) ( not ( = ?auto_730502 ?auto_730504 ) ) ( not ( = ?auto_730502 ?auto_730505 ) ) ( not ( = ?auto_730502 ?auto_730506 ) ) ( not ( = ?auto_730502 ?auto_730507 ) ) ( not ( = ?auto_730502 ?auto_730508 ) ) ( not ( = ?auto_730502 ?auto_730509 ) ) ( not ( = ?auto_730502 ?auto_730510 ) ) ( not ( = ?auto_730502 ?auto_730511 ) ) ( not ( = ?auto_730502 ?auto_730512 ) ) ( not ( = ?auto_730503 ?auto_730504 ) ) ( not ( = ?auto_730503 ?auto_730505 ) ) ( not ( = ?auto_730503 ?auto_730506 ) ) ( not ( = ?auto_730503 ?auto_730507 ) ) ( not ( = ?auto_730503 ?auto_730508 ) ) ( not ( = ?auto_730503 ?auto_730509 ) ) ( not ( = ?auto_730503 ?auto_730510 ) ) ( not ( = ?auto_730503 ?auto_730511 ) ) ( not ( = ?auto_730503 ?auto_730512 ) ) ( not ( = ?auto_730504 ?auto_730505 ) ) ( not ( = ?auto_730504 ?auto_730506 ) ) ( not ( = ?auto_730504 ?auto_730507 ) ) ( not ( = ?auto_730504 ?auto_730508 ) ) ( not ( = ?auto_730504 ?auto_730509 ) ) ( not ( = ?auto_730504 ?auto_730510 ) ) ( not ( = ?auto_730504 ?auto_730511 ) ) ( not ( = ?auto_730504 ?auto_730512 ) ) ( not ( = ?auto_730505 ?auto_730506 ) ) ( not ( = ?auto_730505 ?auto_730507 ) ) ( not ( = ?auto_730505 ?auto_730508 ) ) ( not ( = ?auto_730505 ?auto_730509 ) ) ( not ( = ?auto_730505 ?auto_730510 ) ) ( not ( = ?auto_730505 ?auto_730511 ) ) ( not ( = ?auto_730505 ?auto_730512 ) ) ( not ( = ?auto_730506 ?auto_730507 ) ) ( not ( = ?auto_730506 ?auto_730508 ) ) ( not ( = ?auto_730506 ?auto_730509 ) ) ( not ( = ?auto_730506 ?auto_730510 ) ) ( not ( = ?auto_730506 ?auto_730511 ) ) ( not ( = ?auto_730506 ?auto_730512 ) ) ( not ( = ?auto_730507 ?auto_730508 ) ) ( not ( = ?auto_730507 ?auto_730509 ) ) ( not ( = ?auto_730507 ?auto_730510 ) ) ( not ( = ?auto_730507 ?auto_730511 ) ) ( not ( = ?auto_730507 ?auto_730512 ) ) ( not ( = ?auto_730508 ?auto_730509 ) ) ( not ( = ?auto_730508 ?auto_730510 ) ) ( not ( = ?auto_730508 ?auto_730511 ) ) ( not ( = ?auto_730508 ?auto_730512 ) ) ( not ( = ?auto_730509 ?auto_730510 ) ) ( not ( = ?auto_730509 ?auto_730511 ) ) ( not ( = ?auto_730509 ?auto_730512 ) ) ( not ( = ?auto_730510 ?auto_730511 ) ) ( not ( = ?auto_730510 ?auto_730512 ) ) ( not ( = ?auto_730511 ?auto_730512 ) ) ( ON ?auto_730510 ?auto_730511 ) ( ON ?auto_730509 ?auto_730510 ) ( ON ?auto_730508 ?auto_730509 ) ( ON ?auto_730507 ?auto_730508 ) ( ON ?auto_730506 ?auto_730507 ) ( ON ?auto_730505 ?auto_730506 ) ( ON ?auto_730504 ?auto_730505 ) ( CLEAR ?auto_730502 ) ( ON ?auto_730503 ?auto_730504 ) ( CLEAR ?auto_730503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_730496 ?auto_730497 ?auto_730498 ?auto_730499 ?auto_730500 ?auto_730501 ?auto_730502 ?auto_730503 )
      ( MAKE-16PILE ?auto_730496 ?auto_730497 ?auto_730498 ?auto_730499 ?auto_730500 ?auto_730501 ?auto_730502 ?auto_730503 ?auto_730504 ?auto_730505 ?auto_730506 ?auto_730507 ?auto_730508 ?auto_730509 ?auto_730510 ?auto_730511 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730562 - BLOCK
      ?auto_730563 - BLOCK
      ?auto_730564 - BLOCK
      ?auto_730565 - BLOCK
      ?auto_730566 - BLOCK
      ?auto_730567 - BLOCK
      ?auto_730568 - BLOCK
      ?auto_730569 - BLOCK
      ?auto_730570 - BLOCK
      ?auto_730571 - BLOCK
      ?auto_730572 - BLOCK
      ?auto_730573 - BLOCK
      ?auto_730574 - BLOCK
      ?auto_730575 - BLOCK
      ?auto_730576 - BLOCK
      ?auto_730577 - BLOCK
    )
    :vars
    (
      ?auto_730578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730577 ?auto_730578 ) ( ON-TABLE ?auto_730562 ) ( ON ?auto_730563 ?auto_730562 ) ( ON ?auto_730564 ?auto_730563 ) ( ON ?auto_730565 ?auto_730564 ) ( ON ?auto_730566 ?auto_730565 ) ( ON ?auto_730567 ?auto_730566 ) ( not ( = ?auto_730562 ?auto_730563 ) ) ( not ( = ?auto_730562 ?auto_730564 ) ) ( not ( = ?auto_730562 ?auto_730565 ) ) ( not ( = ?auto_730562 ?auto_730566 ) ) ( not ( = ?auto_730562 ?auto_730567 ) ) ( not ( = ?auto_730562 ?auto_730568 ) ) ( not ( = ?auto_730562 ?auto_730569 ) ) ( not ( = ?auto_730562 ?auto_730570 ) ) ( not ( = ?auto_730562 ?auto_730571 ) ) ( not ( = ?auto_730562 ?auto_730572 ) ) ( not ( = ?auto_730562 ?auto_730573 ) ) ( not ( = ?auto_730562 ?auto_730574 ) ) ( not ( = ?auto_730562 ?auto_730575 ) ) ( not ( = ?auto_730562 ?auto_730576 ) ) ( not ( = ?auto_730562 ?auto_730577 ) ) ( not ( = ?auto_730562 ?auto_730578 ) ) ( not ( = ?auto_730563 ?auto_730564 ) ) ( not ( = ?auto_730563 ?auto_730565 ) ) ( not ( = ?auto_730563 ?auto_730566 ) ) ( not ( = ?auto_730563 ?auto_730567 ) ) ( not ( = ?auto_730563 ?auto_730568 ) ) ( not ( = ?auto_730563 ?auto_730569 ) ) ( not ( = ?auto_730563 ?auto_730570 ) ) ( not ( = ?auto_730563 ?auto_730571 ) ) ( not ( = ?auto_730563 ?auto_730572 ) ) ( not ( = ?auto_730563 ?auto_730573 ) ) ( not ( = ?auto_730563 ?auto_730574 ) ) ( not ( = ?auto_730563 ?auto_730575 ) ) ( not ( = ?auto_730563 ?auto_730576 ) ) ( not ( = ?auto_730563 ?auto_730577 ) ) ( not ( = ?auto_730563 ?auto_730578 ) ) ( not ( = ?auto_730564 ?auto_730565 ) ) ( not ( = ?auto_730564 ?auto_730566 ) ) ( not ( = ?auto_730564 ?auto_730567 ) ) ( not ( = ?auto_730564 ?auto_730568 ) ) ( not ( = ?auto_730564 ?auto_730569 ) ) ( not ( = ?auto_730564 ?auto_730570 ) ) ( not ( = ?auto_730564 ?auto_730571 ) ) ( not ( = ?auto_730564 ?auto_730572 ) ) ( not ( = ?auto_730564 ?auto_730573 ) ) ( not ( = ?auto_730564 ?auto_730574 ) ) ( not ( = ?auto_730564 ?auto_730575 ) ) ( not ( = ?auto_730564 ?auto_730576 ) ) ( not ( = ?auto_730564 ?auto_730577 ) ) ( not ( = ?auto_730564 ?auto_730578 ) ) ( not ( = ?auto_730565 ?auto_730566 ) ) ( not ( = ?auto_730565 ?auto_730567 ) ) ( not ( = ?auto_730565 ?auto_730568 ) ) ( not ( = ?auto_730565 ?auto_730569 ) ) ( not ( = ?auto_730565 ?auto_730570 ) ) ( not ( = ?auto_730565 ?auto_730571 ) ) ( not ( = ?auto_730565 ?auto_730572 ) ) ( not ( = ?auto_730565 ?auto_730573 ) ) ( not ( = ?auto_730565 ?auto_730574 ) ) ( not ( = ?auto_730565 ?auto_730575 ) ) ( not ( = ?auto_730565 ?auto_730576 ) ) ( not ( = ?auto_730565 ?auto_730577 ) ) ( not ( = ?auto_730565 ?auto_730578 ) ) ( not ( = ?auto_730566 ?auto_730567 ) ) ( not ( = ?auto_730566 ?auto_730568 ) ) ( not ( = ?auto_730566 ?auto_730569 ) ) ( not ( = ?auto_730566 ?auto_730570 ) ) ( not ( = ?auto_730566 ?auto_730571 ) ) ( not ( = ?auto_730566 ?auto_730572 ) ) ( not ( = ?auto_730566 ?auto_730573 ) ) ( not ( = ?auto_730566 ?auto_730574 ) ) ( not ( = ?auto_730566 ?auto_730575 ) ) ( not ( = ?auto_730566 ?auto_730576 ) ) ( not ( = ?auto_730566 ?auto_730577 ) ) ( not ( = ?auto_730566 ?auto_730578 ) ) ( not ( = ?auto_730567 ?auto_730568 ) ) ( not ( = ?auto_730567 ?auto_730569 ) ) ( not ( = ?auto_730567 ?auto_730570 ) ) ( not ( = ?auto_730567 ?auto_730571 ) ) ( not ( = ?auto_730567 ?auto_730572 ) ) ( not ( = ?auto_730567 ?auto_730573 ) ) ( not ( = ?auto_730567 ?auto_730574 ) ) ( not ( = ?auto_730567 ?auto_730575 ) ) ( not ( = ?auto_730567 ?auto_730576 ) ) ( not ( = ?auto_730567 ?auto_730577 ) ) ( not ( = ?auto_730567 ?auto_730578 ) ) ( not ( = ?auto_730568 ?auto_730569 ) ) ( not ( = ?auto_730568 ?auto_730570 ) ) ( not ( = ?auto_730568 ?auto_730571 ) ) ( not ( = ?auto_730568 ?auto_730572 ) ) ( not ( = ?auto_730568 ?auto_730573 ) ) ( not ( = ?auto_730568 ?auto_730574 ) ) ( not ( = ?auto_730568 ?auto_730575 ) ) ( not ( = ?auto_730568 ?auto_730576 ) ) ( not ( = ?auto_730568 ?auto_730577 ) ) ( not ( = ?auto_730568 ?auto_730578 ) ) ( not ( = ?auto_730569 ?auto_730570 ) ) ( not ( = ?auto_730569 ?auto_730571 ) ) ( not ( = ?auto_730569 ?auto_730572 ) ) ( not ( = ?auto_730569 ?auto_730573 ) ) ( not ( = ?auto_730569 ?auto_730574 ) ) ( not ( = ?auto_730569 ?auto_730575 ) ) ( not ( = ?auto_730569 ?auto_730576 ) ) ( not ( = ?auto_730569 ?auto_730577 ) ) ( not ( = ?auto_730569 ?auto_730578 ) ) ( not ( = ?auto_730570 ?auto_730571 ) ) ( not ( = ?auto_730570 ?auto_730572 ) ) ( not ( = ?auto_730570 ?auto_730573 ) ) ( not ( = ?auto_730570 ?auto_730574 ) ) ( not ( = ?auto_730570 ?auto_730575 ) ) ( not ( = ?auto_730570 ?auto_730576 ) ) ( not ( = ?auto_730570 ?auto_730577 ) ) ( not ( = ?auto_730570 ?auto_730578 ) ) ( not ( = ?auto_730571 ?auto_730572 ) ) ( not ( = ?auto_730571 ?auto_730573 ) ) ( not ( = ?auto_730571 ?auto_730574 ) ) ( not ( = ?auto_730571 ?auto_730575 ) ) ( not ( = ?auto_730571 ?auto_730576 ) ) ( not ( = ?auto_730571 ?auto_730577 ) ) ( not ( = ?auto_730571 ?auto_730578 ) ) ( not ( = ?auto_730572 ?auto_730573 ) ) ( not ( = ?auto_730572 ?auto_730574 ) ) ( not ( = ?auto_730572 ?auto_730575 ) ) ( not ( = ?auto_730572 ?auto_730576 ) ) ( not ( = ?auto_730572 ?auto_730577 ) ) ( not ( = ?auto_730572 ?auto_730578 ) ) ( not ( = ?auto_730573 ?auto_730574 ) ) ( not ( = ?auto_730573 ?auto_730575 ) ) ( not ( = ?auto_730573 ?auto_730576 ) ) ( not ( = ?auto_730573 ?auto_730577 ) ) ( not ( = ?auto_730573 ?auto_730578 ) ) ( not ( = ?auto_730574 ?auto_730575 ) ) ( not ( = ?auto_730574 ?auto_730576 ) ) ( not ( = ?auto_730574 ?auto_730577 ) ) ( not ( = ?auto_730574 ?auto_730578 ) ) ( not ( = ?auto_730575 ?auto_730576 ) ) ( not ( = ?auto_730575 ?auto_730577 ) ) ( not ( = ?auto_730575 ?auto_730578 ) ) ( not ( = ?auto_730576 ?auto_730577 ) ) ( not ( = ?auto_730576 ?auto_730578 ) ) ( not ( = ?auto_730577 ?auto_730578 ) ) ( ON ?auto_730576 ?auto_730577 ) ( ON ?auto_730575 ?auto_730576 ) ( ON ?auto_730574 ?auto_730575 ) ( ON ?auto_730573 ?auto_730574 ) ( ON ?auto_730572 ?auto_730573 ) ( ON ?auto_730571 ?auto_730572 ) ( ON ?auto_730570 ?auto_730571 ) ( ON ?auto_730569 ?auto_730570 ) ( CLEAR ?auto_730567 ) ( ON ?auto_730568 ?auto_730569 ) ( CLEAR ?auto_730568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_730562 ?auto_730563 ?auto_730564 ?auto_730565 ?auto_730566 ?auto_730567 ?auto_730568 )
      ( MAKE-16PILE ?auto_730562 ?auto_730563 ?auto_730564 ?auto_730565 ?auto_730566 ?auto_730567 ?auto_730568 ?auto_730569 ?auto_730570 ?auto_730571 ?auto_730572 ?auto_730573 ?auto_730574 ?auto_730575 ?auto_730576 ?auto_730577 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730628 - BLOCK
      ?auto_730629 - BLOCK
      ?auto_730630 - BLOCK
      ?auto_730631 - BLOCK
      ?auto_730632 - BLOCK
      ?auto_730633 - BLOCK
      ?auto_730634 - BLOCK
      ?auto_730635 - BLOCK
      ?auto_730636 - BLOCK
      ?auto_730637 - BLOCK
      ?auto_730638 - BLOCK
      ?auto_730639 - BLOCK
      ?auto_730640 - BLOCK
      ?auto_730641 - BLOCK
      ?auto_730642 - BLOCK
      ?auto_730643 - BLOCK
    )
    :vars
    (
      ?auto_730644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730643 ?auto_730644 ) ( ON-TABLE ?auto_730628 ) ( ON ?auto_730629 ?auto_730628 ) ( ON ?auto_730630 ?auto_730629 ) ( ON ?auto_730631 ?auto_730630 ) ( ON ?auto_730632 ?auto_730631 ) ( not ( = ?auto_730628 ?auto_730629 ) ) ( not ( = ?auto_730628 ?auto_730630 ) ) ( not ( = ?auto_730628 ?auto_730631 ) ) ( not ( = ?auto_730628 ?auto_730632 ) ) ( not ( = ?auto_730628 ?auto_730633 ) ) ( not ( = ?auto_730628 ?auto_730634 ) ) ( not ( = ?auto_730628 ?auto_730635 ) ) ( not ( = ?auto_730628 ?auto_730636 ) ) ( not ( = ?auto_730628 ?auto_730637 ) ) ( not ( = ?auto_730628 ?auto_730638 ) ) ( not ( = ?auto_730628 ?auto_730639 ) ) ( not ( = ?auto_730628 ?auto_730640 ) ) ( not ( = ?auto_730628 ?auto_730641 ) ) ( not ( = ?auto_730628 ?auto_730642 ) ) ( not ( = ?auto_730628 ?auto_730643 ) ) ( not ( = ?auto_730628 ?auto_730644 ) ) ( not ( = ?auto_730629 ?auto_730630 ) ) ( not ( = ?auto_730629 ?auto_730631 ) ) ( not ( = ?auto_730629 ?auto_730632 ) ) ( not ( = ?auto_730629 ?auto_730633 ) ) ( not ( = ?auto_730629 ?auto_730634 ) ) ( not ( = ?auto_730629 ?auto_730635 ) ) ( not ( = ?auto_730629 ?auto_730636 ) ) ( not ( = ?auto_730629 ?auto_730637 ) ) ( not ( = ?auto_730629 ?auto_730638 ) ) ( not ( = ?auto_730629 ?auto_730639 ) ) ( not ( = ?auto_730629 ?auto_730640 ) ) ( not ( = ?auto_730629 ?auto_730641 ) ) ( not ( = ?auto_730629 ?auto_730642 ) ) ( not ( = ?auto_730629 ?auto_730643 ) ) ( not ( = ?auto_730629 ?auto_730644 ) ) ( not ( = ?auto_730630 ?auto_730631 ) ) ( not ( = ?auto_730630 ?auto_730632 ) ) ( not ( = ?auto_730630 ?auto_730633 ) ) ( not ( = ?auto_730630 ?auto_730634 ) ) ( not ( = ?auto_730630 ?auto_730635 ) ) ( not ( = ?auto_730630 ?auto_730636 ) ) ( not ( = ?auto_730630 ?auto_730637 ) ) ( not ( = ?auto_730630 ?auto_730638 ) ) ( not ( = ?auto_730630 ?auto_730639 ) ) ( not ( = ?auto_730630 ?auto_730640 ) ) ( not ( = ?auto_730630 ?auto_730641 ) ) ( not ( = ?auto_730630 ?auto_730642 ) ) ( not ( = ?auto_730630 ?auto_730643 ) ) ( not ( = ?auto_730630 ?auto_730644 ) ) ( not ( = ?auto_730631 ?auto_730632 ) ) ( not ( = ?auto_730631 ?auto_730633 ) ) ( not ( = ?auto_730631 ?auto_730634 ) ) ( not ( = ?auto_730631 ?auto_730635 ) ) ( not ( = ?auto_730631 ?auto_730636 ) ) ( not ( = ?auto_730631 ?auto_730637 ) ) ( not ( = ?auto_730631 ?auto_730638 ) ) ( not ( = ?auto_730631 ?auto_730639 ) ) ( not ( = ?auto_730631 ?auto_730640 ) ) ( not ( = ?auto_730631 ?auto_730641 ) ) ( not ( = ?auto_730631 ?auto_730642 ) ) ( not ( = ?auto_730631 ?auto_730643 ) ) ( not ( = ?auto_730631 ?auto_730644 ) ) ( not ( = ?auto_730632 ?auto_730633 ) ) ( not ( = ?auto_730632 ?auto_730634 ) ) ( not ( = ?auto_730632 ?auto_730635 ) ) ( not ( = ?auto_730632 ?auto_730636 ) ) ( not ( = ?auto_730632 ?auto_730637 ) ) ( not ( = ?auto_730632 ?auto_730638 ) ) ( not ( = ?auto_730632 ?auto_730639 ) ) ( not ( = ?auto_730632 ?auto_730640 ) ) ( not ( = ?auto_730632 ?auto_730641 ) ) ( not ( = ?auto_730632 ?auto_730642 ) ) ( not ( = ?auto_730632 ?auto_730643 ) ) ( not ( = ?auto_730632 ?auto_730644 ) ) ( not ( = ?auto_730633 ?auto_730634 ) ) ( not ( = ?auto_730633 ?auto_730635 ) ) ( not ( = ?auto_730633 ?auto_730636 ) ) ( not ( = ?auto_730633 ?auto_730637 ) ) ( not ( = ?auto_730633 ?auto_730638 ) ) ( not ( = ?auto_730633 ?auto_730639 ) ) ( not ( = ?auto_730633 ?auto_730640 ) ) ( not ( = ?auto_730633 ?auto_730641 ) ) ( not ( = ?auto_730633 ?auto_730642 ) ) ( not ( = ?auto_730633 ?auto_730643 ) ) ( not ( = ?auto_730633 ?auto_730644 ) ) ( not ( = ?auto_730634 ?auto_730635 ) ) ( not ( = ?auto_730634 ?auto_730636 ) ) ( not ( = ?auto_730634 ?auto_730637 ) ) ( not ( = ?auto_730634 ?auto_730638 ) ) ( not ( = ?auto_730634 ?auto_730639 ) ) ( not ( = ?auto_730634 ?auto_730640 ) ) ( not ( = ?auto_730634 ?auto_730641 ) ) ( not ( = ?auto_730634 ?auto_730642 ) ) ( not ( = ?auto_730634 ?auto_730643 ) ) ( not ( = ?auto_730634 ?auto_730644 ) ) ( not ( = ?auto_730635 ?auto_730636 ) ) ( not ( = ?auto_730635 ?auto_730637 ) ) ( not ( = ?auto_730635 ?auto_730638 ) ) ( not ( = ?auto_730635 ?auto_730639 ) ) ( not ( = ?auto_730635 ?auto_730640 ) ) ( not ( = ?auto_730635 ?auto_730641 ) ) ( not ( = ?auto_730635 ?auto_730642 ) ) ( not ( = ?auto_730635 ?auto_730643 ) ) ( not ( = ?auto_730635 ?auto_730644 ) ) ( not ( = ?auto_730636 ?auto_730637 ) ) ( not ( = ?auto_730636 ?auto_730638 ) ) ( not ( = ?auto_730636 ?auto_730639 ) ) ( not ( = ?auto_730636 ?auto_730640 ) ) ( not ( = ?auto_730636 ?auto_730641 ) ) ( not ( = ?auto_730636 ?auto_730642 ) ) ( not ( = ?auto_730636 ?auto_730643 ) ) ( not ( = ?auto_730636 ?auto_730644 ) ) ( not ( = ?auto_730637 ?auto_730638 ) ) ( not ( = ?auto_730637 ?auto_730639 ) ) ( not ( = ?auto_730637 ?auto_730640 ) ) ( not ( = ?auto_730637 ?auto_730641 ) ) ( not ( = ?auto_730637 ?auto_730642 ) ) ( not ( = ?auto_730637 ?auto_730643 ) ) ( not ( = ?auto_730637 ?auto_730644 ) ) ( not ( = ?auto_730638 ?auto_730639 ) ) ( not ( = ?auto_730638 ?auto_730640 ) ) ( not ( = ?auto_730638 ?auto_730641 ) ) ( not ( = ?auto_730638 ?auto_730642 ) ) ( not ( = ?auto_730638 ?auto_730643 ) ) ( not ( = ?auto_730638 ?auto_730644 ) ) ( not ( = ?auto_730639 ?auto_730640 ) ) ( not ( = ?auto_730639 ?auto_730641 ) ) ( not ( = ?auto_730639 ?auto_730642 ) ) ( not ( = ?auto_730639 ?auto_730643 ) ) ( not ( = ?auto_730639 ?auto_730644 ) ) ( not ( = ?auto_730640 ?auto_730641 ) ) ( not ( = ?auto_730640 ?auto_730642 ) ) ( not ( = ?auto_730640 ?auto_730643 ) ) ( not ( = ?auto_730640 ?auto_730644 ) ) ( not ( = ?auto_730641 ?auto_730642 ) ) ( not ( = ?auto_730641 ?auto_730643 ) ) ( not ( = ?auto_730641 ?auto_730644 ) ) ( not ( = ?auto_730642 ?auto_730643 ) ) ( not ( = ?auto_730642 ?auto_730644 ) ) ( not ( = ?auto_730643 ?auto_730644 ) ) ( ON ?auto_730642 ?auto_730643 ) ( ON ?auto_730641 ?auto_730642 ) ( ON ?auto_730640 ?auto_730641 ) ( ON ?auto_730639 ?auto_730640 ) ( ON ?auto_730638 ?auto_730639 ) ( ON ?auto_730637 ?auto_730638 ) ( ON ?auto_730636 ?auto_730637 ) ( ON ?auto_730635 ?auto_730636 ) ( ON ?auto_730634 ?auto_730635 ) ( CLEAR ?auto_730632 ) ( ON ?auto_730633 ?auto_730634 ) ( CLEAR ?auto_730633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_730628 ?auto_730629 ?auto_730630 ?auto_730631 ?auto_730632 ?auto_730633 )
      ( MAKE-16PILE ?auto_730628 ?auto_730629 ?auto_730630 ?auto_730631 ?auto_730632 ?auto_730633 ?auto_730634 ?auto_730635 ?auto_730636 ?auto_730637 ?auto_730638 ?auto_730639 ?auto_730640 ?auto_730641 ?auto_730642 ?auto_730643 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730694 - BLOCK
      ?auto_730695 - BLOCK
      ?auto_730696 - BLOCK
      ?auto_730697 - BLOCK
      ?auto_730698 - BLOCK
      ?auto_730699 - BLOCK
      ?auto_730700 - BLOCK
      ?auto_730701 - BLOCK
      ?auto_730702 - BLOCK
      ?auto_730703 - BLOCK
      ?auto_730704 - BLOCK
      ?auto_730705 - BLOCK
      ?auto_730706 - BLOCK
      ?auto_730707 - BLOCK
      ?auto_730708 - BLOCK
      ?auto_730709 - BLOCK
    )
    :vars
    (
      ?auto_730710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730709 ?auto_730710 ) ( ON-TABLE ?auto_730694 ) ( ON ?auto_730695 ?auto_730694 ) ( ON ?auto_730696 ?auto_730695 ) ( ON ?auto_730697 ?auto_730696 ) ( not ( = ?auto_730694 ?auto_730695 ) ) ( not ( = ?auto_730694 ?auto_730696 ) ) ( not ( = ?auto_730694 ?auto_730697 ) ) ( not ( = ?auto_730694 ?auto_730698 ) ) ( not ( = ?auto_730694 ?auto_730699 ) ) ( not ( = ?auto_730694 ?auto_730700 ) ) ( not ( = ?auto_730694 ?auto_730701 ) ) ( not ( = ?auto_730694 ?auto_730702 ) ) ( not ( = ?auto_730694 ?auto_730703 ) ) ( not ( = ?auto_730694 ?auto_730704 ) ) ( not ( = ?auto_730694 ?auto_730705 ) ) ( not ( = ?auto_730694 ?auto_730706 ) ) ( not ( = ?auto_730694 ?auto_730707 ) ) ( not ( = ?auto_730694 ?auto_730708 ) ) ( not ( = ?auto_730694 ?auto_730709 ) ) ( not ( = ?auto_730694 ?auto_730710 ) ) ( not ( = ?auto_730695 ?auto_730696 ) ) ( not ( = ?auto_730695 ?auto_730697 ) ) ( not ( = ?auto_730695 ?auto_730698 ) ) ( not ( = ?auto_730695 ?auto_730699 ) ) ( not ( = ?auto_730695 ?auto_730700 ) ) ( not ( = ?auto_730695 ?auto_730701 ) ) ( not ( = ?auto_730695 ?auto_730702 ) ) ( not ( = ?auto_730695 ?auto_730703 ) ) ( not ( = ?auto_730695 ?auto_730704 ) ) ( not ( = ?auto_730695 ?auto_730705 ) ) ( not ( = ?auto_730695 ?auto_730706 ) ) ( not ( = ?auto_730695 ?auto_730707 ) ) ( not ( = ?auto_730695 ?auto_730708 ) ) ( not ( = ?auto_730695 ?auto_730709 ) ) ( not ( = ?auto_730695 ?auto_730710 ) ) ( not ( = ?auto_730696 ?auto_730697 ) ) ( not ( = ?auto_730696 ?auto_730698 ) ) ( not ( = ?auto_730696 ?auto_730699 ) ) ( not ( = ?auto_730696 ?auto_730700 ) ) ( not ( = ?auto_730696 ?auto_730701 ) ) ( not ( = ?auto_730696 ?auto_730702 ) ) ( not ( = ?auto_730696 ?auto_730703 ) ) ( not ( = ?auto_730696 ?auto_730704 ) ) ( not ( = ?auto_730696 ?auto_730705 ) ) ( not ( = ?auto_730696 ?auto_730706 ) ) ( not ( = ?auto_730696 ?auto_730707 ) ) ( not ( = ?auto_730696 ?auto_730708 ) ) ( not ( = ?auto_730696 ?auto_730709 ) ) ( not ( = ?auto_730696 ?auto_730710 ) ) ( not ( = ?auto_730697 ?auto_730698 ) ) ( not ( = ?auto_730697 ?auto_730699 ) ) ( not ( = ?auto_730697 ?auto_730700 ) ) ( not ( = ?auto_730697 ?auto_730701 ) ) ( not ( = ?auto_730697 ?auto_730702 ) ) ( not ( = ?auto_730697 ?auto_730703 ) ) ( not ( = ?auto_730697 ?auto_730704 ) ) ( not ( = ?auto_730697 ?auto_730705 ) ) ( not ( = ?auto_730697 ?auto_730706 ) ) ( not ( = ?auto_730697 ?auto_730707 ) ) ( not ( = ?auto_730697 ?auto_730708 ) ) ( not ( = ?auto_730697 ?auto_730709 ) ) ( not ( = ?auto_730697 ?auto_730710 ) ) ( not ( = ?auto_730698 ?auto_730699 ) ) ( not ( = ?auto_730698 ?auto_730700 ) ) ( not ( = ?auto_730698 ?auto_730701 ) ) ( not ( = ?auto_730698 ?auto_730702 ) ) ( not ( = ?auto_730698 ?auto_730703 ) ) ( not ( = ?auto_730698 ?auto_730704 ) ) ( not ( = ?auto_730698 ?auto_730705 ) ) ( not ( = ?auto_730698 ?auto_730706 ) ) ( not ( = ?auto_730698 ?auto_730707 ) ) ( not ( = ?auto_730698 ?auto_730708 ) ) ( not ( = ?auto_730698 ?auto_730709 ) ) ( not ( = ?auto_730698 ?auto_730710 ) ) ( not ( = ?auto_730699 ?auto_730700 ) ) ( not ( = ?auto_730699 ?auto_730701 ) ) ( not ( = ?auto_730699 ?auto_730702 ) ) ( not ( = ?auto_730699 ?auto_730703 ) ) ( not ( = ?auto_730699 ?auto_730704 ) ) ( not ( = ?auto_730699 ?auto_730705 ) ) ( not ( = ?auto_730699 ?auto_730706 ) ) ( not ( = ?auto_730699 ?auto_730707 ) ) ( not ( = ?auto_730699 ?auto_730708 ) ) ( not ( = ?auto_730699 ?auto_730709 ) ) ( not ( = ?auto_730699 ?auto_730710 ) ) ( not ( = ?auto_730700 ?auto_730701 ) ) ( not ( = ?auto_730700 ?auto_730702 ) ) ( not ( = ?auto_730700 ?auto_730703 ) ) ( not ( = ?auto_730700 ?auto_730704 ) ) ( not ( = ?auto_730700 ?auto_730705 ) ) ( not ( = ?auto_730700 ?auto_730706 ) ) ( not ( = ?auto_730700 ?auto_730707 ) ) ( not ( = ?auto_730700 ?auto_730708 ) ) ( not ( = ?auto_730700 ?auto_730709 ) ) ( not ( = ?auto_730700 ?auto_730710 ) ) ( not ( = ?auto_730701 ?auto_730702 ) ) ( not ( = ?auto_730701 ?auto_730703 ) ) ( not ( = ?auto_730701 ?auto_730704 ) ) ( not ( = ?auto_730701 ?auto_730705 ) ) ( not ( = ?auto_730701 ?auto_730706 ) ) ( not ( = ?auto_730701 ?auto_730707 ) ) ( not ( = ?auto_730701 ?auto_730708 ) ) ( not ( = ?auto_730701 ?auto_730709 ) ) ( not ( = ?auto_730701 ?auto_730710 ) ) ( not ( = ?auto_730702 ?auto_730703 ) ) ( not ( = ?auto_730702 ?auto_730704 ) ) ( not ( = ?auto_730702 ?auto_730705 ) ) ( not ( = ?auto_730702 ?auto_730706 ) ) ( not ( = ?auto_730702 ?auto_730707 ) ) ( not ( = ?auto_730702 ?auto_730708 ) ) ( not ( = ?auto_730702 ?auto_730709 ) ) ( not ( = ?auto_730702 ?auto_730710 ) ) ( not ( = ?auto_730703 ?auto_730704 ) ) ( not ( = ?auto_730703 ?auto_730705 ) ) ( not ( = ?auto_730703 ?auto_730706 ) ) ( not ( = ?auto_730703 ?auto_730707 ) ) ( not ( = ?auto_730703 ?auto_730708 ) ) ( not ( = ?auto_730703 ?auto_730709 ) ) ( not ( = ?auto_730703 ?auto_730710 ) ) ( not ( = ?auto_730704 ?auto_730705 ) ) ( not ( = ?auto_730704 ?auto_730706 ) ) ( not ( = ?auto_730704 ?auto_730707 ) ) ( not ( = ?auto_730704 ?auto_730708 ) ) ( not ( = ?auto_730704 ?auto_730709 ) ) ( not ( = ?auto_730704 ?auto_730710 ) ) ( not ( = ?auto_730705 ?auto_730706 ) ) ( not ( = ?auto_730705 ?auto_730707 ) ) ( not ( = ?auto_730705 ?auto_730708 ) ) ( not ( = ?auto_730705 ?auto_730709 ) ) ( not ( = ?auto_730705 ?auto_730710 ) ) ( not ( = ?auto_730706 ?auto_730707 ) ) ( not ( = ?auto_730706 ?auto_730708 ) ) ( not ( = ?auto_730706 ?auto_730709 ) ) ( not ( = ?auto_730706 ?auto_730710 ) ) ( not ( = ?auto_730707 ?auto_730708 ) ) ( not ( = ?auto_730707 ?auto_730709 ) ) ( not ( = ?auto_730707 ?auto_730710 ) ) ( not ( = ?auto_730708 ?auto_730709 ) ) ( not ( = ?auto_730708 ?auto_730710 ) ) ( not ( = ?auto_730709 ?auto_730710 ) ) ( ON ?auto_730708 ?auto_730709 ) ( ON ?auto_730707 ?auto_730708 ) ( ON ?auto_730706 ?auto_730707 ) ( ON ?auto_730705 ?auto_730706 ) ( ON ?auto_730704 ?auto_730705 ) ( ON ?auto_730703 ?auto_730704 ) ( ON ?auto_730702 ?auto_730703 ) ( ON ?auto_730701 ?auto_730702 ) ( ON ?auto_730700 ?auto_730701 ) ( ON ?auto_730699 ?auto_730700 ) ( CLEAR ?auto_730697 ) ( ON ?auto_730698 ?auto_730699 ) ( CLEAR ?auto_730698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_730694 ?auto_730695 ?auto_730696 ?auto_730697 ?auto_730698 )
      ( MAKE-16PILE ?auto_730694 ?auto_730695 ?auto_730696 ?auto_730697 ?auto_730698 ?auto_730699 ?auto_730700 ?auto_730701 ?auto_730702 ?auto_730703 ?auto_730704 ?auto_730705 ?auto_730706 ?auto_730707 ?auto_730708 ?auto_730709 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730760 - BLOCK
      ?auto_730761 - BLOCK
      ?auto_730762 - BLOCK
      ?auto_730763 - BLOCK
      ?auto_730764 - BLOCK
      ?auto_730765 - BLOCK
      ?auto_730766 - BLOCK
      ?auto_730767 - BLOCK
      ?auto_730768 - BLOCK
      ?auto_730769 - BLOCK
      ?auto_730770 - BLOCK
      ?auto_730771 - BLOCK
      ?auto_730772 - BLOCK
      ?auto_730773 - BLOCK
      ?auto_730774 - BLOCK
      ?auto_730775 - BLOCK
    )
    :vars
    (
      ?auto_730776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730775 ?auto_730776 ) ( ON-TABLE ?auto_730760 ) ( ON ?auto_730761 ?auto_730760 ) ( ON ?auto_730762 ?auto_730761 ) ( not ( = ?auto_730760 ?auto_730761 ) ) ( not ( = ?auto_730760 ?auto_730762 ) ) ( not ( = ?auto_730760 ?auto_730763 ) ) ( not ( = ?auto_730760 ?auto_730764 ) ) ( not ( = ?auto_730760 ?auto_730765 ) ) ( not ( = ?auto_730760 ?auto_730766 ) ) ( not ( = ?auto_730760 ?auto_730767 ) ) ( not ( = ?auto_730760 ?auto_730768 ) ) ( not ( = ?auto_730760 ?auto_730769 ) ) ( not ( = ?auto_730760 ?auto_730770 ) ) ( not ( = ?auto_730760 ?auto_730771 ) ) ( not ( = ?auto_730760 ?auto_730772 ) ) ( not ( = ?auto_730760 ?auto_730773 ) ) ( not ( = ?auto_730760 ?auto_730774 ) ) ( not ( = ?auto_730760 ?auto_730775 ) ) ( not ( = ?auto_730760 ?auto_730776 ) ) ( not ( = ?auto_730761 ?auto_730762 ) ) ( not ( = ?auto_730761 ?auto_730763 ) ) ( not ( = ?auto_730761 ?auto_730764 ) ) ( not ( = ?auto_730761 ?auto_730765 ) ) ( not ( = ?auto_730761 ?auto_730766 ) ) ( not ( = ?auto_730761 ?auto_730767 ) ) ( not ( = ?auto_730761 ?auto_730768 ) ) ( not ( = ?auto_730761 ?auto_730769 ) ) ( not ( = ?auto_730761 ?auto_730770 ) ) ( not ( = ?auto_730761 ?auto_730771 ) ) ( not ( = ?auto_730761 ?auto_730772 ) ) ( not ( = ?auto_730761 ?auto_730773 ) ) ( not ( = ?auto_730761 ?auto_730774 ) ) ( not ( = ?auto_730761 ?auto_730775 ) ) ( not ( = ?auto_730761 ?auto_730776 ) ) ( not ( = ?auto_730762 ?auto_730763 ) ) ( not ( = ?auto_730762 ?auto_730764 ) ) ( not ( = ?auto_730762 ?auto_730765 ) ) ( not ( = ?auto_730762 ?auto_730766 ) ) ( not ( = ?auto_730762 ?auto_730767 ) ) ( not ( = ?auto_730762 ?auto_730768 ) ) ( not ( = ?auto_730762 ?auto_730769 ) ) ( not ( = ?auto_730762 ?auto_730770 ) ) ( not ( = ?auto_730762 ?auto_730771 ) ) ( not ( = ?auto_730762 ?auto_730772 ) ) ( not ( = ?auto_730762 ?auto_730773 ) ) ( not ( = ?auto_730762 ?auto_730774 ) ) ( not ( = ?auto_730762 ?auto_730775 ) ) ( not ( = ?auto_730762 ?auto_730776 ) ) ( not ( = ?auto_730763 ?auto_730764 ) ) ( not ( = ?auto_730763 ?auto_730765 ) ) ( not ( = ?auto_730763 ?auto_730766 ) ) ( not ( = ?auto_730763 ?auto_730767 ) ) ( not ( = ?auto_730763 ?auto_730768 ) ) ( not ( = ?auto_730763 ?auto_730769 ) ) ( not ( = ?auto_730763 ?auto_730770 ) ) ( not ( = ?auto_730763 ?auto_730771 ) ) ( not ( = ?auto_730763 ?auto_730772 ) ) ( not ( = ?auto_730763 ?auto_730773 ) ) ( not ( = ?auto_730763 ?auto_730774 ) ) ( not ( = ?auto_730763 ?auto_730775 ) ) ( not ( = ?auto_730763 ?auto_730776 ) ) ( not ( = ?auto_730764 ?auto_730765 ) ) ( not ( = ?auto_730764 ?auto_730766 ) ) ( not ( = ?auto_730764 ?auto_730767 ) ) ( not ( = ?auto_730764 ?auto_730768 ) ) ( not ( = ?auto_730764 ?auto_730769 ) ) ( not ( = ?auto_730764 ?auto_730770 ) ) ( not ( = ?auto_730764 ?auto_730771 ) ) ( not ( = ?auto_730764 ?auto_730772 ) ) ( not ( = ?auto_730764 ?auto_730773 ) ) ( not ( = ?auto_730764 ?auto_730774 ) ) ( not ( = ?auto_730764 ?auto_730775 ) ) ( not ( = ?auto_730764 ?auto_730776 ) ) ( not ( = ?auto_730765 ?auto_730766 ) ) ( not ( = ?auto_730765 ?auto_730767 ) ) ( not ( = ?auto_730765 ?auto_730768 ) ) ( not ( = ?auto_730765 ?auto_730769 ) ) ( not ( = ?auto_730765 ?auto_730770 ) ) ( not ( = ?auto_730765 ?auto_730771 ) ) ( not ( = ?auto_730765 ?auto_730772 ) ) ( not ( = ?auto_730765 ?auto_730773 ) ) ( not ( = ?auto_730765 ?auto_730774 ) ) ( not ( = ?auto_730765 ?auto_730775 ) ) ( not ( = ?auto_730765 ?auto_730776 ) ) ( not ( = ?auto_730766 ?auto_730767 ) ) ( not ( = ?auto_730766 ?auto_730768 ) ) ( not ( = ?auto_730766 ?auto_730769 ) ) ( not ( = ?auto_730766 ?auto_730770 ) ) ( not ( = ?auto_730766 ?auto_730771 ) ) ( not ( = ?auto_730766 ?auto_730772 ) ) ( not ( = ?auto_730766 ?auto_730773 ) ) ( not ( = ?auto_730766 ?auto_730774 ) ) ( not ( = ?auto_730766 ?auto_730775 ) ) ( not ( = ?auto_730766 ?auto_730776 ) ) ( not ( = ?auto_730767 ?auto_730768 ) ) ( not ( = ?auto_730767 ?auto_730769 ) ) ( not ( = ?auto_730767 ?auto_730770 ) ) ( not ( = ?auto_730767 ?auto_730771 ) ) ( not ( = ?auto_730767 ?auto_730772 ) ) ( not ( = ?auto_730767 ?auto_730773 ) ) ( not ( = ?auto_730767 ?auto_730774 ) ) ( not ( = ?auto_730767 ?auto_730775 ) ) ( not ( = ?auto_730767 ?auto_730776 ) ) ( not ( = ?auto_730768 ?auto_730769 ) ) ( not ( = ?auto_730768 ?auto_730770 ) ) ( not ( = ?auto_730768 ?auto_730771 ) ) ( not ( = ?auto_730768 ?auto_730772 ) ) ( not ( = ?auto_730768 ?auto_730773 ) ) ( not ( = ?auto_730768 ?auto_730774 ) ) ( not ( = ?auto_730768 ?auto_730775 ) ) ( not ( = ?auto_730768 ?auto_730776 ) ) ( not ( = ?auto_730769 ?auto_730770 ) ) ( not ( = ?auto_730769 ?auto_730771 ) ) ( not ( = ?auto_730769 ?auto_730772 ) ) ( not ( = ?auto_730769 ?auto_730773 ) ) ( not ( = ?auto_730769 ?auto_730774 ) ) ( not ( = ?auto_730769 ?auto_730775 ) ) ( not ( = ?auto_730769 ?auto_730776 ) ) ( not ( = ?auto_730770 ?auto_730771 ) ) ( not ( = ?auto_730770 ?auto_730772 ) ) ( not ( = ?auto_730770 ?auto_730773 ) ) ( not ( = ?auto_730770 ?auto_730774 ) ) ( not ( = ?auto_730770 ?auto_730775 ) ) ( not ( = ?auto_730770 ?auto_730776 ) ) ( not ( = ?auto_730771 ?auto_730772 ) ) ( not ( = ?auto_730771 ?auto_730773 ) ) ( not ( = ?auto_730771 ?auto_730774 ) ) ( not ( = ?auto_730771 ?auto_730775 ) ) ( not ( = ?auto_730771 ?auto_730776 ) ) ( not ( = ?auto_730772 ?auto_730773 ) ) ( not ( = ?auto_730772 ?auto_730774 ) ) ( not ( = ?auto_730772 ?auto_730775 ) ) ( not ( = ?auto_730772 ?auto_730776 ) ) ( not ( = ?auto_730773 ?auto_730774 ) ) ( not ( = ?auto_730773 ?auto_730775 ) ) ( not ( = ?auto_730773 ?auto_730776 ) ) ( not ( = ?auto_730774 ?auto_730775 ) ) ( not ( = ?auto_730774 ?auto_730776 ) ) ( not ( = ?auto_730775 ?auto_730776 ) ) ( ON ?auto_730774 ?auto_730775 ) ( ON ?auto_730773 ?auto_730774 ) ( ON ?auto_730772 ?auto_730773 ) ( ON ?auto_730771 ?auto_730772 ) ( ON ?auto_730770 ?auto_730771 ) ( ON ?auto_730769 ?auto_730770 ) ( ON ?auto_730768 ?auto_730769 ) ( ON ?auto_730767 ?auto_730768 ) ( ON ?auto_730766 ?auto_730767 ) ( ON ?auto_730765 ?auto_730766 ) ( ON ?auto_730764 ?auto_730765 ) ( CLEAR ?auto_730762 ) ( ON ?auto_730763 ?auto_730764 ) ( CLEAR ?auto_730763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_730760 ?auto_730761 ?auto_730762 ?auto_730763 )
      ( MAKE-16PILE ?auto_730760 ?auto_730761 ?auto_730762 ?auto_730763 ?auto_730764 ?auto_730765 ?auto_730766 ?auto_730767 ?auto_730768 ?auto_730769 ?auto_730770 ?auto_730771 ?auto_730772 ?auto_730773 ?auto_730774 ?auto_730775 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730826 - BLOCK
      ?auto_730827 - BLOCK
      ?auto_730828 - BLOCK
      ?auto_730829 - BLOCK
      ?auto_730830 - BLOCK
      ?auto_730831 - BLOCK
      ?auto_730832 - BLOCK
      ?auto_730833 - BLOCK
      ?auto_730834 - BLOCK
      ?auto_730835 - BLOCK
      ?auto_730836 - BLOCK
      ?auto_730837 - BLOCK
      ?auto_730838 - BLOCK
      ?auto_730839 - BLOCK
      ?auto_730840 - BLOCK
      ?auto_730841 - BLOCK
    )
    :vars
    (
      ?auto_730842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730841 ?auto_730842 ) ( ON-TABLE ?auto_730826 ) ( ON ?auto_730827 ?auto_730826 ) ( not ( = ?auto_730826 ?auto_730827 ) ) ( not ( = ?auto_730826 ?auto_730828 ) ) ( not ( = ?auto_730826 ?auto_730829 ) ) ( not ( = ?auto_730826 ?auto_730830 ) ) ( not ( = ?auto_730826 ?auto_730831 ) ) ( not ( = ?auto_730826 ?auto_730832 ) ) ( not ( = ?auto_730826 ?auto_730833 ) ) ( not ( = ?auto_730826 ?auto_730834 ) ) ( not ( = ?auto_730826 ?auto_730835 ) ) ( not ( = ?auto_730826 ?auto_730836 ) ) ( not ( = ?auto_730826 ?auto_730837 ) ) ( not ( = ?auto_730826 ?auto_730838 ) ) ( not ( = ?auto_730826 ?auto_730839 ) ) ( not ( = ?auto_730826 ?auto_730840 ) ) ( not ( = ?auto_730826 ?auto_730841 ) ) ( not ( = ?auto_730826 ?auto_730842 ) ) ( not ( = ?auto_730827 ?auto_730828 ) ) ( not ( = ?auto_730827 ?auto_730829 ) ) ( not ( = ?auto_730827 ?auto_730830 ) ) ( not ( = ?auto_730827 ?auto_730831 ) ) ( not ( = ?auto_730827 ?auto_730832 ) ) ( not ( = ?auto_730827 ?auto_730833 ) ) ( not ( = ?auto_730827 ?auto_730834 ) ) ( not ( = ?auto_730827 ?auto_730835 ) ) ( not ( = ?auto_730827 ?auto_730836 ) ) ( not ( = ?auto_730827 ?auto_730837 ) ) ( not ( = ?auto_730827 ?auto_730838 ) ) ( not ( = ?auto_730827 ?auto_730839 ) ) ( not ( = ?auto_730827 ?auto_730840 ) ) ( not ( = ?auto_730827 ?auto_730841 ) ) ( not ( = ?auto_730827 ?auto_730842 ) ) ( not ( = ?auto_730828 ?auto_730829 ) ) ( not ( = ?auto_730828 ?auto_730830 ) ) ( not ( = ?auto_730828 ?auto_730831 ) ) ( not ( = ?auto_730828 ?auto_730832 ) ) ( not ( = ?auto_730828 ?auto_730833 ) ) ( not ( = ?auto_730828 ?auto_730834 ) ) ( not ( = ?auto_730828 ?auto_730835 ) ) ( not ( = ?auto_730828 ?auto_730836 ) ) ( not ( = ?auto_730828 ?auto_730837 ) ) ( not ( = ?auto_730828 ?auto_730838 ) ) ( not ( = ?auto_730828 ?auto_730839 ) ) ( not ( = ?auto_730828 ?auto_730840 ) ) ( not ( = ?auto_730828 ?auto_730841 ) ) ( not ( = ?auto_730828 ?auto_730842 ) ) ( not ( = ?auto_730829 ?auto_730830 ) ) ( not ( = ?auto_730829 ?auto_730831 ) ) ( not ( = ?auto_730829 ?auto_730832 ) ) ( not ( = ?auto_730829 ?auto_730833 ) ) ( not ( = ?auto_730829 ?auto_730834 ) ) ( not ( = ?auto_730829 ?auto_730835 ) ) ( not ( = ?auto_730829 ?auto_730836 ) ) ( not ( = ?auto_730829 ?auto_730837 ) ) ( not ( = ?auto_730829 ?auto_730838 ) ) ( not ( = ?auto_730829 ?auto_730839 ) ) ( not ( = ?auto_730829 ?auto_730840 ) ) ( not ( = ?auto_730829 ?auto_730841 ) ) ( not ( = ?auto_730829 ?auto_730842 ) ) ( not ( = ?auto_730830 ?auto_730831 ) ) ( not ( = ?auto_730830 ?auto_730832 ) ) ( not ( = ?auto_730830 ?auto_730833 ) ) ( not ( = ?auto_730830 ?auto_730834 ) ) ( not ( = ?auto_730830 ?auto_730835 ) ) ( not ( = ?auto_730830 ?auto_730836 ) ) ( not ( = ?auto_730830 ?auto_730837 ) ) ( not ( = ?auto_730830 ?auto_730838 ) ) ( not ( = ?auto_730830 ?auto_730839 ) ) ( not ( = ?auto_730830 ?auto_730840 ) ) ( not ( = ?auto_730830 ?auto_730841 ) ) ( not ( = ?auto_730830 ?auto_730842 ) ) ( not ( = ?auto_730831 ?auto_730832 ) ) ( not ( = ?auto_730831 ?auto_730833 ) ) ( not ( = ?auto_730831 ?auto_730834 ) ) ( not ( = ?auto_730831 ?auto_730835 ) ) ( not ( = ?auto_730831 ?auto_730836 ) ) ( not ( = ?auto_730831 ?auto_730837 ) ) ( not ( = ?auto_730831 ?auto_730838 ) ) ( not ( = ?auto_730831 ?auto_730839 ) ) ( not ( = ?auto_730831 ?auto_730840 ) ) ( not ( = ?auto_730831 ?auto_730841 ) ) ( not ( = ?auto_730831 ?auto_730842 ) ) ( not ( = ?auto_730832 ?auto_730833 ) ) ( not ( = ?auto_730832 ?auto_730834 ) ) ( not ( = ?auto_730832 ?auto_730835 ) ) ( not ( = ?auto_730832 ?auto_730836 ) ) ( not ( = ?auto_730832 ?auto_730837 ) ) ( not ( = ?auto_730832 ?auto_730838 ) ) ( not ( = ?auto_730832 ?auto_730839 ) ) ( not ( = ?auto_730832 ?auto_730840 ) ) ( not ( = ?auto_730832 ?auto_730841 ) ) ( not ( = ?auto_730832 ?auto_730842 ) ) ( not ( = ?auto_730833 ?auto_730834 ) ) ( not ( = ?auto_730833 ?auto_730835 ) ) ( not ( = ?auto_730833 ?auto_730836 ) ) ( not ( = ?auto_730833 ?auto_730837 ) ) ( not ( = ?auto_730833 ?auto_730838 ) ) ( not ( = ?auto_730833 ?auto_730839 ) ) ( not ( = ?auto_730833 ?auto_730840 ) ) ( not ( = ?auto_730833 ?auto_730841 ) ) ( not ( = ?auto_730833 ?auto_730842 ) ) ( not ( = ?auto_730834 ?auto_730835 ) ) ( not ( = ?auto_730834 ?auto_730836 ) ) ( not ( = ?auto_730834 ?auto_730837 ) ) ( not ( = ?auto_730834 ?auto_730838 ) ) ( not ( = ?auto_730834 ?auto_730839 ) ) ( not ( = ?auto_730834 ?auto_730840 ) ) ( not ( = ?auto_730834 ?auto_730841 ) ) ( not ( = ?auto_730834 ?auto_730842 ) ) ( not ( = ?auto_730835 ?auto_730836 ) ) ( not ( = ?auto_730835 ?auto_730837 ) ) ( not ( = ?auto_730835 ?auto_730838 ) ) ( not ( = ?auto_730835 ?auto_730839 ) ) ( not ( = ?auto_730835 ?auto_730840 ) ) ( not ( = ?auto_730835 ?auto_730841 ) ) ( not ( = ?auto_730835 ?auto_730842 ) ) ( not ( = ?auto_730836 ?auto_730837 ) ) ( not ( = ?auto_730836 ?auto_730838 ) ) ( not ( = ?auto_730836 ?auto_730839 ) ) ( not ( = ?auto_730836 ?auto_730840 ) ) ( not ( = ?auto_730836 ?auto_730841 ) ) ( not ( = ?auto_730836 ?auto_730842 ) ) ( not ( = ?auto_730837 ?auto_730838 ) ) ( not ( = ?auto_730837 ?auto_730839 ) ) ( not ( = ?auto_730837 ?auto_730840 ) ) ( not ( = ?auto_730837 ?auto_730841 ) ) ( not ( = ?auto_730837 ?auto_730842 ) ) ( not ( = ?auto_730838 ?auto_730839 ) ) ( not ( = ?auto_730838 ?auto_730840 ) ) ( not ( = ?auto_730838 ?auto_730841 ) ) ( not ( = ?auto_730838 ?auto_730842 ) ) ( not ( = ?auto_730839 ?auto_730840 ) ) ( not ( = ?auto_730839 ?auto_730841 ) ) ( not ( = ?auto_730839 ?auto_730842 ) ) ( not ( = ?auto_730840 ?auto_730841 ) ) ( not ( = ?auto_730840 ?auto_730842 ) ) ( not ( = ?auto_730841 ?auto_730842 ) ) ( ON ?auto_730840 ?auto_730841 ) ( ON ?auto_730839 ?auto_730840 ) ( ON ?auto_730838 ?auto_730839 ) ( ON ?auto_730837 ?auto_730838 ) ( ON ?auto_730836 ?auto_730837 ) ( ON ?auto_730835 ?auto_730836 ) ( ON ?auto_730834 ?auto_730835 ) ( ON ?auto_730833 ?auto_730834 ) ( ON ?auto_730832 ?auto_730833 ) ( ON ?auto_730831 ?auto_730832 ) ( ON ?auto_730830 ?auto_730831 ) ( ON ?auto_730829 ?auto_730830 ) ( CLEAR ?auto_730827 ) ( ON ?auto_730828 ?auto_730829 ) ( CLEAR ?auto_730828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_730826 ?auto_730827 ?auto_730828 )
      ( MAKE-16PILE ?auto_730826 ?auto_730827 ?auto_730828 ?auto_730829 ?auto_730830 ?auto_730831 ?auto_730832 ?auto_730833 ?auto_730834 ?auto_730835 ?auto_730836 ?auto_730837 ?auto_730838 ?auto_730839 ?auto_730840 ?auto_730841 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730892 - BLOCK
      ?auto_730893 - BLOCK
      ?auto_730894 - BLOCK
      ?auto_730895 - BLOCK
      ?auto_730896 - BLOCK
      ?auto_730897 - BLOCK
      ?auto_730898 - BLOCK
      ?auto_730899 - BLOCK
      ?auto_730900 - BLOCK
      ?auto_730901 - BLOCK
      ?auto_730902 - BLOCK
      ?auto_730903 - BLOCK
      ?auto_730904 - BLOCK
      ?auto_730905 - BLOCK
      ?auto_730906 - BLOCK
      ?auto_730907 - BLOCK
    )
    :vars
    (
      ?auto_730908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730907 ?auto_730908 ) ( ON-TABLE ?auto_730892 ) ( not ( = ?auto_730892 ?auto_730893 ) ) ( not ( = ?auto_730892 ?auto_730894 ) ) ( not ( = ?auto_730892 ?auto_730895 ) ) ( not ( = ?auto_730892 ?auto_730896 ) ) ( not ( = ?auto_730892 ?auto_730897 ) ) ( not ( = ?auto_730892 ?auto_730898 ) ) ( not ( = ?auto_730892 ?auto_730899 ) ) ( not ( = ?auto_730892 ?auto_730900 ) ) ( not ( = ?auto_730892 ?auto_730901 ) ) ( not ( = ?auto_730892 ?auto_730902 ) ) ( not ( = ?auto_730892 ?auto_730903 ) ) ( not ( = ?auto_730892 ?auto_730904 ) ) ( not ( = ?auto_730892 ?auto_730905 ) ) ( not ( = ?auto_730892 ?auto_730906 ) ) ( not ( = ?auto_730892 ?auto_730907 ) ) ( not ( = ?auto_730892 ?auto_730908 ) ) ( not ( = ?auto_730893 ?auto_730894 ) ) ( not ( = ?auto_730893 ?auto_730895 ) ) ( not ( = ?auto_730893 ?auto_730896 ) ) ( not ( = ?auto_730893 ?auto_730897 ) ) ( not ( = ?auto_730893 ?auto_730898 ) ) ( not ( = ?auto_730893 ?auto_730899 ) ) ( not ( = ?auto_730893 ?auto_730900 ) ) ( not ( = ?auto_730893 ?auto_730901 ) ) ( not ( = ?auto_730893 ?auto_730902 ) ) ( not ( = ?auto_730893 ?auto_730903 ) ) ( not ( = ?auto_730893 ?auto_730904 ) ) ( not ( = ?auto_730893 ?auto_730905 ) ) ( not ( = ?auto_730893 ?auto_730906 ) ) ( not ( = ?auto_730893 ?auto_730907 ) ) ( not ( = ?auto_730893 ?auto_730908 ) ) ( not ( = ?auto_730894 ?auto_730895 ) ) ( not ( = ?auto_730894 ?auto_730896 ) ) ( not ( = ?auto_730894 ?auto_730897 ) ) ( not ( = ?auto_730894 ?auto_730898 ) ) ( not ( = ?auto_730894 ?auto_730899 ) ) ( not ( = ?auto_730894 ?auto_730900 ) ) ( not ( = ?auto_730894 ?auto_730901 ) ) ( not ( = ?auto_730894 ?auto_730902 ) ) ( not ( = ?auto_730894 ?auto_730903 ) ) ( not ( = ?auto_730894 ?auto_730904 ) ) ( not ( = ?auto_730894 ?auto_730905 ) ) ( not ( = ?auto_730894 ?auto_730906 ) ) ( not ( = ?auto_730894 ?auto_730907 ) ) ( not ( = ?auto_730894 ?auto_730908 ) ) ( not ( = ?auto_730895 ?auto_730896 ) ) ( not ( = ?auto_730895 ?auto_730897 ) ) ( not ( = ?auto_730895 ?auto_730898 ) ) ( not ( = ?auto_730895 ?auto_730899 ) ) ( not ( = ?auto_730895 ?auto_730900 ) ) ( not ( = ?auto_730895 ?auto_730901 ) ) ( not ( = ?auto_730895 ?auto_730902 ) ) ( not ( = ?auto_730895 ?auto_730903 ) ) ( not ( = ?auto_730895 ?auto_730904 ) ) ( not ( = ?auto_730895 ?auto_730905 ) ) ( not ( = ?auto_730895 ?auto_730906 ) ) ( not ( = ?auto_730895 ?auto_730907 ) ) ( not ( = ?auto_730895 ?auto_730908 ) ) ( not ( = ?auto_730896 ?auto_730897 ) ) ( not ( = ?auto_730896 ?auto_730898 ) ) ( not ( = ?auto_730896 ?auto_730899 ) ) ( not ( = ?auto_730896 ?auto_730900 ) ) ( not ( = ?auto_730896 ?auto_730901 ) ) ( not ( = ?auto_730896 ?auto_730902 ) ) ( not ( = ?auto_730896 ?auto_730903 ) ) ( not ( = ?auto_730896 ?auto_730904 ) ) ( not ( = ?auto_730896 ?auto_730905 ) ) ( not ( = ?auto_730896 ?auto_730906 ) ) ( not ( = ?auto_730896 ?auto_730907 ) ) ( not ( = ?auto_730896 ?auto_730908 ) ) ( not ( = ?auto_730897 ?auto_730898 ) ) ( not ( = ?auto_730897 ?auto_730899 ) ) ( not ( = ?auto_730897 ?auto_730900 ) ) ( not ( = ?auto_730897 ?auto_730901 ) ) ( not ( = ?auto_730897 ?auto_730902 ) ) ( not ( = ?auto_730897 ?auto_730903 ) ) ( not ( = ?auto_730897 ?auto_730904 ) ) ( not ( = ?auto_730897 ?auto_730905 ) ) ( not ( = ?auto_730897 ?auto_730906 ) ) ( not ( = ?auto_730897 ?auto_730907 ) ) ( not ( = ?auto_730897 ?auto_730908 ) ) ( not ( = ?auto_730898 ?auto_730899 ) ) ( not ( = ?auto_730898 ?auto_730900 ) ) ( not ( = ?auto_730898 ?auto_730901 ) ) ( not ( = ?auto_730898 ?auto_730902 ) ) ( not ( = ?auto_730898 ?auto_730903 ) ) ( not ( = ?auto_730898 ?auto_730904 ) ) ( not ( = ?auto_730898 ?auto_730905 ) ) ( not ( = ?auto_730898 ?auto_730906 ) ) ( not ( = ?auto_730898 ?auto_730907 ) ) ( not ( = ?auto_730898 ?auto_730908 ) ) ( not ( = ?auto_730899 ?auto_730900 ) ) ( not ( = ?auto_730899 ?auto_730901 ) ) ( not ( = ?auto_730899 ?auto_730902 ) ) ( not ( = ?auto_730899 ?auto_730903 ) ) ( not ( = ?auto_730899 ?auto_730904 ) ) ( not ( = ?auto_730899 ?auto_730905 ) ) ( not ( = ?auto_730899 ?auto_730906 ) ) ( not ( = ?auto_730899 ?auto_730907 ) ) ( not ( = ?auto_730899 ?auto_730908 ) ) ( not ( = ?auto_730900 ?auto_730901 ) ) ( not ( = ?auto_730900 ?auto_730902 ) ) ( not ( = ?auto_730900 ?auto_730903 ) ) ( not ( = ?auto_730900 ?auto_730904 ) ) ( not ( = ?auto_730900 ?auto_730905 ) ) ( not ( = ?auto_730900 ?auto_730906 ) ) ( not ( = ?auto_730900 ?auto_730907 ) ) ( not ( = ?auto_730900 ?auto_730908 ) ) ( not ( = ?auto_730901 ?auto_730902 ) ) ( not ( = ?auto_730901 ?auto_730903 ) ) ( not ( = ?auto_730901 ?auto_730904 ) ) ( not ( = ?auto_730901 ?auto_730905 ) ) ( not ( = ?auto_730901 ?auto_730906 ) ) ( not ( = ?auto_730901 ?auto_730907 ) ) ( not ( = ?auto_730901 ?auto_730908 ) ) ( not ( = ?auto_730902 ?auto_730903 ) ) ( not ( = ?auto_730902 ?auto_730904 ) ) ( not ( = ?auto_730902 ?auto_730905 ) ) ( not ( = ?auto_730902 ?auto_730906 ) ) ( not ( = ?auto_730902 ?auto_730907 ) ) ( not ( = ?auto_730902 ?auto_730908 ) ) ( not ( = ?auto_730903 ?auto_730904 ) ) ( not ( = ?auto_730903 ?auto_730905 ) ) ( not ( = ?auto_730903 ?auto_730906 ) ) ( not ( = ?auto_730903 ?auto_730907 ) ) ( not ( = ?auto_730903 ?auto_730908 ) ) ( not ( = ?auto_730904 ?auto_730905 ) ) ( not ( = ?auto_730904 ?auto_730906 ) ) ( not ( = ?auto_730904 ?auto_730907 ) ) ( not ( = ?auto_730904 ?auto_730908 ) ) ( not ( = ?auto_730905 ?auto_730906 ) ) ( not ( = ?auto_730905 ?auto_730907 ) ) ( not ( = ?auto_730905 ?auto_730908 ) ) ( not ( = ?auto_730906 ?auto_730907 ) ) ( not ( = ?auto_730906 ?auto_730908 ) ) ( not ( = ?auto_730907 ?auto_730908 ) ) ( ON ?auto_730906 ?auto_730907 ) ( ON ?auto_730905 ?auto_730906 ) ( ON ?auto_730904 ?auto_730905 ) ( ON ?auto_730903 ?auto_730904 ) ( ON ?auto_730902 ?auto_730903 ) ( ON ?auto_730901 ?auto_730902 ) ( ON ?auto_730900 ?auto_730901 ) ( ON ?auto_730899 ?auto_730900 ) ( ON ?auto_730898 ?auto_730899 ) ( ON ?auto_730897 ?auto_730898 ) ( ON ?auto_730896 ?auto_730897 ) ( ON ?auto_730895 ?auto_730896 ) ( ON ?auto_730894 ?auto_730895 ) ( CLEAR ?auto_730892 ) ( ON ?auto_730893 ?auto_730894 ) ( CLEAR ?auto_730893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_730892 ?auto_730893 )
      ( MAKE-16PILE ?auto_730892 ?auto_730893 ?auto_730894 ?auto_730895 ?auto_730896 ?auto_730897 ?auto_730898 ?auto_730899 ?auto_730900 ?auto_730901 ?auto_730902 ?auto_730903 ?auto_730904 ?auto_730905 ?auto_730906 ?auto_730907 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_730958 - BLOCK
      ?auto_730959 - BLOCK
      ?auto_730960 - BLOCK
      ?auto_730961 - BLOCK
      ?auto_730962 - BLOCK
      ?auto_730963 - BLOCK
      ?auto_730964 - BLOCK
      ?auto_730965 - BLOCK
      ?auto_730966 - BLOCK
      ?auto_730967 - BLOCK
      ?auto_730968 - BLOCK
      ?auto_730969 - BLOCK
      ?auto_730970 - BLOCK
      ?auto_730971 - BLOCK
      ?auto_730972 - BLOCK
      ?auto_730973 - BLOCK
    )
    :vars
    (
      ?auto_730974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_730973 ?auto_730974 ) ( not ( = ?auto_730958 ?auto_730959 ) ) ( not ( = ?auto_730958 ?auto_730960 ) ) ( not ( = ?auto_730958 ?auto_730961 ) ) ( not ( = ?auto_730958 ?auto_730962 ) ) ( not ( = ?auto_730958 ?auto_730963 ) ) ( not ( = ?auto_730958 ?auto_730964 ) ) ( not ( = ?auto_730958 ?auto_730965 ) ) ( not ( = ?auto_730958 ?auto_730966 ) ) ( not ( = ?auto_730958 ?auto_730967 ) ) ( not ( = ?auto_730958 ?auto_730968 ) ) ( not ( = ?auto_730958 ?auto_730969 ) ) ( not ( = ?auto_730958 ?auto_730970 ) ) ( not ( = ?auto_730958 ?auto_730971 ) ) ( not ( = ?auto_730958 ?auto_730972 ) ) ( not ( = ?auto_730958 ?auto_730973 ) ) ( not ( = ?auto_730958 ?auto_730974 ) ) ( not ( = ?auto_730959 ?auto_730960 ) ) ( not ( = ?auto_730959 ?auto_730961 ) ) ( not ( = ?auto_730959 ?auto_730962 ) ) ( not ( = ?auto_730959 ?auto_730963 ) ) ( not ( = ?auto_730959 ?auto_730964 ) ) ( not ( = ?auto_730959 ?auto_730965 ) ) ( not ( = ?auto_730959 ?auto_730966 ) ) ( not ( = ?auto_730959 ?auto_730967 ) ) ( not ( = ?auto_730959 ?auto_730968 ) ) ( not ( = ?auto_730959 ?auto_730969 ) ) ( not ( = ?auto_730959 ?auto_730970 ) ) ( not ( = ?auto_730959 ?auto_730971 ) ) ( not ( = ?auto_730959 ?auto_730972 ) ) ( not ( = ?auto_730959 ?auto_730973 ) ) ( not ( = ?auto_730959 ?auto_730974 ) ) ( not ( = ?auto_730960 ?auto_730961 ) ) ( not ( = ?auto_730960 ?auto_730962 ) ) ( not ( = ?auto_730960 ?auto_730963 ) ) ( not ( = ?auto_730960 ?auto_730964 ) ) ( not ( = ?auto_730960 ?auto_730965 ) ) ( not ( = ?auto_730960 ?auto_730966 ) ) ( not ( = ?auto_730960 ?auto_730967 ) ) ( not ( = ?auto_730960 ?auto_730968 ) ) ( not ( = ?auto_730960 ?auto_730969 ) ) ( not ( = ?auto_730960 ?auto_730970 ) ) ( not ( = ?auto_730960 ?auto_730971 ) ) ( not ( = ?auto_730960 ?auto_730972 ) ) ( not ( = ?auto_730960 ?auto_730973 ) ) ( not ( = ?auto_730960 ?auto_730974 ) ) ( not ( = ?auto_730961 ?auto_730962 ) ) ( not ( = ?auto_730961 ?auto_730963 ) ) ( not ( = ?auto_730961 ?auto_730964 ) ) ( not ( = ?auto_730961 ?auto_730965 ) ) ( not ( = ?auto_730961 ?auto_730966 ) ) ( not ( = ?auto_730961 ?auto_730967 ) ) ( not ( = ?auto_730961 ?auto_730968 ) ) ( not ( = ?auto_730961 ?auto_730969 ) ) ( not ( = ?auto_730961 ?auto_730970 ) ) ( not ( = ?auto_730961 ?auto_730971 ) ) ( not ( = ?auto_730961 ?auto_730972 ) ) ( not ( = ?auto_730961 ?auto_730973 ) ) ( not ( = ?auto_730961 ?auto_730974 ) ) ( not ( = ?auto_730962 ?auto_730963 ) ) ( not ( = ?auto_730962 ?auto_730964 ) ) ( not ( = ?auto_730962 ?auto_730965 ) ) ( not ( = ?auto_730962 ?auto_730966 ) ) ( not ( = ?auto_730962 ?auto_730967 ) ) ( not ( = ?auto_730962 ?auto_730968 ) ) ( not ( = ?auto_730962 ?auto_730969 ) ) ( not ( = ?auto_730962 ?auto_730970 ) ) ( not ( = ?auto_730962 ?auto_730971 ) ) ( not ( = ?auto_730962 ?auto_730972 ) ) ( not ( = ?auto_730962 ?auto_730973 ) ) ( not ( = ?auto_730962 ?auto_730974 ) ) ( not ( = ?auto_730963 ?auto_730964 ) ) ( not ( = ?auto_730963 ?auto_730965 ) ) ( not ( = ?auto_730963 ?auto_730966 ) ) ( not ( = ?auto_730963 ?auto_730967 ) ) ( not ( = ?auto_730963 ?auto_730968 ) ) ( not ( = ?auto_730963 ?auto_730969 ) ) ( not ( = ?auto_730963 ?auto_730970 ) ) ( not ( = ?auto_730963 ?auto_730971 ) ) ( not ( = ?auto_730963 ?auto_730972 ) ) ( not ( = ?auto_730963 ?auto_730973 ) ) ( not ( = ?auto_730963 ?auto_730974 ) ) ( not ( = ?auto_730964 ?auto_730965 ) ) ( not ( = ?auto_730964 ?auto_730966 ) ) ( not ( = ?auto_730964 ?auto_730967 ) ) ( not ( = ?auto_730964 ?auto_730968 ) ) ( not ( = ?auto_730964 ?auto_730969 ) ) ( not ( = ?auto_730964 ?auto_730970 ) ) ( not ( = ?auto_730964 ?auto_730971 ) ) ( not ( = ?auto_730964 ?auto_730972 ) ) ( not ( = ?auto_730964 ?auto_730973 ) ) ( not ( = ?auto_730964 ?auto_730974 ) ) ( not ( = ?auto_730965 ?auto_730966 ) ) ( not ( = ?auto_730965 ?auto_730967 ) ) ( not ( = ?auto_730965 ?auto_730968 ) ) ( not ( = ?auto_730965 ?auto_730969 ) ) ( not ( = ?auto_730965 ?auto_730970 ) ) ( not ( = ?auto_730965 ?auto_730971 ) ) ( not ( = ?auto_730965 ?auto_730972 ) ) ( not ( = ?auto_730965 ?auto_730973 ) ) ( not ( = ?auto_730965 ?auto_730974 ) ) ( not ( = ?auto_730966 ?auto_730967 ) ) ( not ( = ?auto_730966 ?auto_730968 ) ) ( not ( = ?auto_730966 ?auto_730969 ) ) ( not ( = ?auto_730966 ?auto_730970 ) ) ( not ( = ?auto_730966 ?auto_730971 ) ) ( not ( = ?auto_730966 ?auto_730972 ) ) ( not ( = ?auto_730966 ?auto_730973 ) ) ( not ( = ?auto_730966 ?auto_730974 ) ) ( not ( = ?auto_730967 ?auto_730968 ) ) ( not ( = ?auto_730967 ?auto_730969 ) ) ( not ( = ?auto_730967 ?auto_730970 ) ) ( not ( = ?auto_730967 ?auto_730971 ) ) ( not ( = ?auto_730967 ?auto_730972 ) ) ( not ( = ?auto_730967 ?auto_730973 ) ) ( not ( = ?auto_730967 ?auto_730974 ) ) ( not ( = ?auto_730968 ?auto_730969 ) ) ( not ( = ?auto_730968 ?auto_730970 ) ) ( not ( = ?auto_730968 ?auto_730971 ) ) ( not ( = ?auto_730968 ?auto_730972 ) ) ( not ( = ?auto_730968 ?auto_730973 ) ) ( not ( = ?auto_730968 ?auto_730974 ) ) ( not ( = ?auto_730969 ?auto_730970 ) ) ( not ( = ?auto_730969 ?auto_730971 ) ) ( not ( = ?auto_730969 ?auto_730972 ) ) ( not ( = ?auto_730969 ?auto_730973 ) ) ( not ( = ?auto_730969 ?auto_730974 ) ) ( not ( = ?auto_730970 ?auto_730971 ) ) ( not ( = ?auto_730970 ?auto_730972 ) ) ( not ( = ?auto_730970 ?auto_730973 ) ) ( not ( = ?auto_730970 ?auto_730974 ) ) ( not ( = ?auto_730971 ?auto_730972 ) ) ( not ( = ?auto_730971 ?auto_730973 ) ) ( not ( = ?auto_730971 ?auto_730974 ) ) ( not ( = ?auto_730972 ?auto_730973 ) ) ( not ( = ?auto_730972 ?auto_730974 ) ) ( not ( = ?auto_730973 ?auto_730974 ) ) ( ON ?auto_730972 ?auto_730973 ) ( ON ?auto_730971 ?auto_730972 ) ( ON ?auto_730970 ?auto_730971 ) ( ON ?auto_730969 ?auto_730970 ) ( ON ?auto_730968 ?auto_730969 ) ( ON ?auto_730967 ?auto_730968 ) ( ON ?auto_730966 ?auto_730967 ) ( ON ?auto_730965 ?auto_730966 ) ( ON ?auto_730964 ?auto_730965 ) ( ON ?auto_730963 ?auto_730964 ) ( ON ?auto_730962 ?auto_730963 ) ( ON ?auto_730961 ?auto_730962 ) ( ON ?auto_730960 ?auto_730961 ) ( ON ?auto_730959 ?auto_730960 ) ( ON ?auto_730958 ?auto_730959 ) ( CLEAR ?auto_730958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_730958 )
      ( MAKE-16PILE ?auto_730958 ?auto_730959 ?auto_730960 ?auto_730961 ?auto_730962 ?auto_730963 ?auto_730964 ?auto_730965 ?auto_730966 ?auto_730967 ?auto_730968 ?auto_730969 ?auto_730970 ?auto_730971 ?auto_730972 ?auto_730973 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731025 - BLOCK
      ?auto_731026 - BLOCK
      ?auto_731027 - BLOCK
      ?auto_731028 - BLOCK
      ?auto_731029 - BLOCK
      ?auto_731030 - BLOCK
      ?auto_731031 - BLOCK
      ?auto_731032 - BLOCK
      ?auto_731033 - BLOCK
      ?auto_731034 - BLOCK
      ?auto_731035 - BLOCK
      ?auto_731036 - BLOCK
      ?auto_731037 - BLOCK
      ?auto_731038 - BLOCK
      ?auto_731039 - BLOCK
      ?auto_731040 - BLOCK
      ?auto_731041 - BLOCK
    )
    :vars
    (
      ?auto_731042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_731040 ) ( ON ?auto_731041 ?auto_731042 ) ( CLEAR ?auto_731041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_731025 ) ( ON ?auto_731026 ?auto_731025 ) ( ON ?auto_731027 ?auto_731026 ) ( ON ?auto_731028 ?auto_731027 ) ( ON ?auto_731029 ?auto_731028 ) ( ON ?auto_731030 ?auto_731029 ) ( ON ?auto_731031 ?auto_731030 ) ( ON ?auto_731032 ?auto_731031 ) ( ON ?auto_731033 ?auto_731032 ) ( ON ?auto_731034 ?auto_731033 ) ( ON ?auto_731035 ?auto_731034 ) ( ON ?auto_731036 ?auto_731035 ) ( ON ?auto_731037 ?auto_731036 ) ( ON ?auto_731038 ?auto_731037 ) ( ON ?auto_731039 ?auto_731038 ) ( ON ?auto_731040 ?auto_731039 ) ( not ( = ?auto_731025 ?auto_731026 ) ) ( not ( = ?auto_731025 ?auto_731027 ) ) ( not ( = ?auto_731025 ?auto_731028 ) ) ( not ( = ?auto_731025 ?auto_731029 ) ) ( not ( = ?auto_731025 ?auto_731030 ) ) ( not ( = ?auto_731025 ?auto_731031 ) ) ( not ( = ?auto_731025 ?auto_731032 ) ) ( not ( = ?auto_731025 ?auto_731033 ) ) ( not ( = ?auto_731025 ?auto_731034 ) ) ( not ( = ?auto_731025 ?auto_731035 ) ) ( not ( = ?auto_731025 ?auto_731036 ) ) ( not ( = ?auto_731025 ?auto_731037 ) ) ( not ( = ?auto_731025 ?auto_731038 ) ) ( not ( = ?auto_731025 ?auto_731039 ) ) ( not ( = ?auto_731025 ?auto_731040 ) ) ( not ( = ?auto_731025 ?auto_731041 ) ) ( not ( = ?auto_731025 ?auto_731042 ) ) ( not ( = ?auto_731026 ?auto_731027 ) ) ( not ( = ?auto_731026 ?auto_731028 ) ) ( not ( = ?auto_731026 ?auto_731029 ) ) ( not ( = ?auto_731026 ?auto_731030 ) ) ( not ( = ?auto_731026 ?auto_731031 ) ) ( not ( = ?auto_731026 ?auto_731032 ) ) ( not ( = ?auto_731026 ?auto_731033 ) ) ( not ( = ?auto_731026 ?auto_731034 ) ) ( not ( = ?auto_731026 ?auto_731035 ) ) ( not ( = ?auto_731026 ?auto_731036 ) ) ( not ( = ?auto_731026 ?auto_731037 ) ) ( not ( = ?auto_731026 ?auto_731038 ) ) ( not ( = ?auto_731026 ?auto_731039 ) ) ( not ( = ?auto_731026 ?auto_731040 ) ) ( not ( = ?auto_731026 ?auto_731041 ) ) ( not ( = ?auto_731026 ?auto_731042 ) ) ( not ( = ?auto_731027 ?auto_731028 ) ) ( not ( = ?auto_731027 ?auto_731029 ) ) ( not ( = ?auto_731027 ?auto_731030 ) ) ( not ( = ?auto_731027 ?auto_731031 ) ) ( not ( = ?auto_731027 ?auto_731032 ) ) ( not ( = ?auto_731027 ?auto_731033 ) ) ( not ( = ?auto_731027 ?auto_731034 ) ) ( not ( = ?auto_731027 ?auto_731035 ) ) ( not ( = ?auto_731027 ?auto_731036 ) ) ( not ( = ?auto_731027 ?auto_731037 ) ) ( not ( = ?auto_731027 ?auto_731038 ) ) ( not ( = ?auto_731027 ?auto_731039 ) ) ( not ( = ?auto_731027 ?auto_731040 ) ) ( not ( = ?auto_731027 ?auto_731041 ) ) ( not ( = ?auto_731027 ?auto_731042 ) ) ( not ( = ?auto_731028 ?auto_731029 ) ) ( not ( = ?auto_731028 ?auto_731030 ) ) ( not ( = ?auto_731028 ?auto_731031 ) ) ( not ( = ?auto_731028 ?auto_731032 ) ) ( not ( = ?auto_731028 ?auto_731033 ) ) ( not ( = ?auto_731028 ?auto_731034 ) ) ( not ( = ?auto_731028 ?auto_731035 ) ) ( not ( = ?auto_731028 ?auto_731036 ) ) ( not ( = ?auto_731028 ?auto_731037 ) ) ( not ( = ?auto_731028 ?auto_731038 ) ) ( not ( = ?auto_731028 ?auto_731039 ) ) ( not ( = ?auto_731028 ?auto_731040 ) ) ( not ( = ?auto_731028 ?auto_731041 ) ) ( not ( = ?auto_731028 ?auto_731042 ) ) ( not ( = ?auto_731029 ?auto_731030 ) ) ( not ( = ?auto_731029 ?auto_731031 ) ) ( not ( = ?auto_731029 ?auto_731032 ) ) ( not ( = ?auto_731029 ?auto_731033 ) ) ( not ( = ?auto_731029 ?auto_731034 ) ) ( not ( = ?auto_731029 ?auto_731035 ) ) ( not ( = ?auto_731029 ?auto_731036 ) ) ( not ( = ?auto_731029 ?auto_731037 ) ) ( not ( = ?auto_731029 ?auto_731038 ) ) ( not ( = ?auto_731029 ?auto_731039 ) ) ( not ( = ?auto_731029 ?auto_731040 ) ) ( not ( = ?auto_731029 ?auto_731041 ) ) ( not ( = ?auto_731029 ?auto_731042 ) ) ( not ( = ?auto_731030 ?auto_731031 ) ) ( not ( = ?auto_731030 ?auto_731032 ) ) ( not ( = ?auto_731030 ?auto_731033 ) ) ( not ( = ?auto_731030 ?auto_731034 ) ) ( not ( = ?auto_731030 ?auto_731035 ) ) ( not ( = ?auto_731030 ?auto_731036 ) ) ( not ( = ?auto_731030 ?auto_731037 ) ) ( not ( = ?auto_731030 ?auto_731038 ) ) ( not ( = ?auto_731030 ?auto_731039 ) ) ( not ( = ?auto_731030 ?auto_731040 ) ) ( not ( = ?auto_731030 ?auto_731041 ) ) ( not ( = ?auto_731030 ?auto_731042 ) ) ( not ( = ?auto_731031 ?auto_731032 ) ) ( not ( = ?auto_731031 ?auto_731033 ) ) ( not ( = ?auto_731031 ?auto_731034 ) ) ( not ( = ?auto_731031 ?auto_731035 ) ) ( not ( = ?auto_731031 ?auto_731036 ) ) ( not ( = ?auto_731031 ?auto_731037 ) ) ( not ( = ?auto_731031 ?auto_731038 ) ) ( not ( = ?auto_731031 ?auto_731039 ) ) ( not ( = ?auto_731031 ?auto_731040 ) ) ( not ( = ?auto_731031 ?auto_731041 ) ) ( not ( = ?auto_731031 ?auto_731042 ) ) ( not ( = ?auto_731032 ?auto_731033 ) ) ( not ( = ?auto_731032 ?auto_731034 ) ) ( not ( = ?auto_731032 ?auto_731035 ) ) ( not ( = ?auto_731032 ?auto_731036 ) ) ( not ( = ?auto_731032 ?auto_731037 ) ) ( not ( = ?auto_731032 ?auto_731038 ) ) ( not ( = ?auto_731032 ?auto_731039 ) ) ( not ( = ?auto_731032 ?auto_731040 ) ) ( not ( = ?auto_731032 ?auto_731041 ) ) ( not ( = ?auto_731032 ?auto_731042 ) ) ( not ( = ?auto_731033 ?auto_731034 ) ) ( not ( = ?auto_731033 ?auto_731035 ) ) ( not ( = ?auto_731033 ?auto_731036 ) ) ( not ( = ?auto_731033 ?auto_731037 ) ) ( not ( = ?auto_731033 ?auto_731038 ) ) ( not ( = ?auto_731033 ?auto_731039 ) ) ( not ( = ?auto_731033 ?auto_731040 ) ) ( not ( = ?auto_731033 ?auto_731041 ) ) ( not ( = ?auto_731033 ?auto_731042 ) ) ( not ( = ?auto_731034 ?auto_731035 ) ) ( not ( = ?auto_731034 ?auto_731036 ) ) ( not ( = ?auto_731034 ?auto_731037 ) ) ( not ( = ?auto_731034 ?auto_731038 ) ) ( not ( = ?auto_731034 ?auto_731039 ) ) ( not ( = ?auto_731034 ?auto_731040 ) ) ( not ( = ?auto_731034 ?auto_731041 ) ) ( not ( = ?auto_731034 ?auto_731042 ) ) ( not ( = ?auto_731035 ?auto_731036 ) ) ( not ( = ?auto_731035 ?auto_731037 ) ) ( not ( = ?auto_731035 ?auto_731038 ) ) ( not ( = ?auto_731035 ?auto_731039 ) ) ( not ( = ?auto_731035 ?auto_731040 ) ) ( not ( = ?auto_731035 ?auto_731041 ) ) ( not ( = ?auto_731035 ?auto_731042 ) ) ( not ( = ?auto_731036 ?auto_731037 ) ) ( not ( = ?auto_731036 ?auto_731038 ) ) ( not ( = ?auto_731036 ?auto_731039 ) ) ( not ( = ?auto_731036 ?auto_731040 ) ) ( not ( = ?auto_731036 ?auto_731041 ) ) ( not ( = ?auto_731036 ?auto_731042 ) ) ( not ( = ?auto_731037 ?auto_731038 ) ) ( not ( = ?auto_731037 ?auto_731039 ) ) ( not ( = ?auto_731037 ?auto_731040 ) ) ( not ( = ?auto_731037 ?auto_731041 ) ) ( not ( = ?auto_731037 ?auto_731042 ) ) ( not ( = ?auto_731038 ?auto_731039 ) ) ( not ( = ?auto_731038 ?auto_731040 ) ) ( not ( = ?auto_731038 ?auto_731041 ) ) ( not ( = ?auto_731038 ?auto_731042 ) ) ( not ( = ?auto_731039 ?auto_731040 ) ) ( not ( = ?auto_731039 ?auto_731041 ) ) ( not ( = ?auto_731039 ?auto_731042 ) ) ( not ( = ?auto_731040 ?auto_731041 ) ) ( not ( = ?auto_731040 ?auto_731042 ) ) ( not ( = ?auto_731041 ?auto_731042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_731041 ?auto_731042 )
      ( !STACK ?auto_731041 ?auto_731040 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731060 - BLOCK
      ?auto_731061 - BLOCK
      ?auto_731062 - BLOCK
      ?auto_731063 - BLOCK
      ?auto_731064 - BLOCK
      ?auto_731065 - BLOCK
      ?auto_731066 - BLOCK
      ?auto_731067 - BLOCK
      ?auto_731068 - BLOCK
      ?auto_731069 - BLOCK
      ?auto_731070 - BLOCK
      ?auto_731071 - BLOCK
      ?auto_731072 - BLOCK
      ?auto_731073 - BLOCK
      ?auto_731074 - BLOCK
      ?auto_731075 - BLOCK
      ?auto_731076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_731075 ) ( ON-TABLE ?auto_731076 ) ( CLEAR ?auto_731076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_731060 ) ( ON ?auto_731061 ?auto_731060 ) ( ON ?auto_731062 ?auto_731061 ) ( ON ?auto_731063 ?auto_731062 ) ( ON ?auto_731064 ?auto_731063 ) ( ON ?auto_731065 ?auto_731064 ) ( ON ?auto_731066 ?auto_731065 ) ( ON ?auto_731067 ?auto_731066 ) ( ON ?auto_731068 ?auto_731067 ) ( ON ?auto_731069 ?auto_731068 ) ( ON ?auto_731070 ?auto_731069 ) ( ON ?auto_731071 ?auto_731070 ) ( ON ?auto_731072 ?auto_731071 ) ( ON ?auto_731073 ?auto_731072 ) ( ON ?auto_731074 ?auto_731073 ) ( ON ?auto_731075 ?auto_731074 ) ( not ( = ?auto_731060 ?auto_731061 ) ) ( not ( = ?auto_731060 ?auto_731062 ) ) ( not ( = ?auto_731060 ?auto_731063 ) ) ( not ( = ?auto_731060 ?auto_731064 ) ) ( not ( = ?auto_731060 ?auto_731065 ) ) ( not ( = ?auto_731060 ?auto_731066 ) ) ( not ( = ?auto_731060 ?auto_731067 ) ) ( not ( = ?auto_731060 ?auto_731068 ) ) ( not ( = ?auto_731060 ?auto_731069 ) ) ( not ( = ?auto_731060 ?auto_731070 ) ) ( not ( = ?auto_731060 ?auto_731071 ) ) ( not ( = ?auto_731060 ?auto_731072 ) ) ( not ( = ?auto_731060 ?auto_731073 ) ) ( not ( = ?auto_731060 ?auto_731074 ) ) ( not ( = ?auto_731060 ?auto_731075 ) ) ( not ( = ?auto_731060 ?auto_731076 ) ) ( not ( = ?auto_731061 ?auto_731062 ) ) ( not ( = ?auto_731061 ?auto_731063 ) ) ( not ( = ?auto_731061 ?auto_731064 ) ) ( not ( = ?auto_731061 ?auto_731065 ) ) ( not ( = ?auto_731061 ?auto_731066 ) ) ( not ( = ?auto_731061 ?auto_731067 ) ) ( not ( = ?auto_731061 ?auto_731068 ) ) ( not ( = ?auto_731061 ?auto_731069 ) ) ( not ( = ?auto_731061 ?auto_731070 ) ) ( not ( = ?auto_731061 ?auto_731071 ) ) ( not ( = ?auto_731061 ?auto_731072 ) ) ( not ( = ?auto_731061 ?auto_731073 ) ) ( not ( = ?auto_731061 ?auto_731074 ) ) ( not ( = ?auto_731061 ?auto_731075 ) ) ( not ( = ?auto_731061 ?auto_731076 ) ) ( not ( = ?auto_731062 ?auto_731063 ) ) ( not ( = ?auto_731062 ?auto_731064 ) ) ( not ( = ?auto_731062 ?auto_731065 ) ) ( not ( = ?auto_731062 ?auto_731066 ) ) ( not ( = ?auto_731062 ?auto_731067 ) ) ( not ( = ?auto_731062 ?auto_731068 ) ) ( not ( = ?auto_731062 ?auto_731069 ) ) ( not ( = ?auto_731062 ?auto_731070 ) ) ( not ( = ?auto_731062 ?auto_731071 ) ) ( not ( = ?auto_731062 ?auto_731072 ) ) ( not ( = ?auto_731062 ?auto_731073 ) ) ( not ( = ?auto_731062 ?auto_731074 ) ) ( not ( = ?auto_731062 ?auto_731075 ) ) ( not ( = ?auto_731062 ?auto_731076 ) ) ( not ( = ?auto_731063 ?auto_731064 ) ) ( not ( = ?auto_731063 ?auto_731065 ) ) ( not ( = ?auto_731063 ?auto_731066 ) ) ( not ( = ?auto_731063 ?auto_731067 ) ) ( not ( = ?auto_731063 ?auto_731068 ) ) ( not ( = ?auto_731063 ?auto_731069 ) ) ( not ( = ?auto_731063 ?auto_731070 ) ) ( not ( = ?auto_731063 ?auto_731071 ) ) ( not ( = ?auto_731063 ?auto_731072 ) ) ( not ( = ?auto_731063 ?auto_731073 ) ) ( not ( = ?auto_731063 ?auto_731074 ) ) ( not ( = ?auto_731063 ?auto_731075 ) ) ( not ( = ?auto_731063 ?auto_731076 ) ) ( not ( = ?auto_731064 ?auto_731065 ) ) ( not ( = ?auto_731064 ?auto_731066 ) ) ( not ( = ?auto_731064 ?auto_731067 ) ) ( not ( = ?auto_731064 ?auto_731068 ) ) ( not ( = ?auto_731064 ?auto_731069 ) ) ( not ( = ?auto_731064 ?auto_731070 ) ) ( not ( = ?auto_731064 ?auto_731071 ) ) ( not ( = ?auto_731064 ?auto_731072 ) ) ( not ( = ?auto_731064 ?auto_731073 ) ) ( not ( = ?auto_731064 ?auto_731074 ) ) ( not ( = ?auto_731064 ?auto_731075 ) ) ( not ( = ?auto_731064 ?auto_731076 ) ) ( not ( = ?auto_731065 ?auto_731066 ) ) ( not ( = ?auto_731065 ?auto_731067 ) ) ( not ( = ?auto_731065 ?auto_731068 ) ) ( not ( = ?auto_731065 ?auto_731069 ) ) ( not ( = ?auto_731065 ?auto_731070 ) ) ( not ( = ?auto_731065 ?auto_731071 ) ) ( not ( = ?auto_731065 ?auto_731072 ) ) ( not ( = ?auto_731065 ?auto_731073 ) ) ( not ( = ?auto_731065 ?auto_731074 ) ) ( not ( = ?auto_731065 ?auto_731075 ) ) ( not ( = ?auto_731065 ?auto_731076 ) ) ( not ( = ?auto_731066 ?auto_731067 ) ) ( not ( = ?auto_731066 ?auto_731068 ) ) ( not ( = ?auto_731066 ?auto_731069 ) ) ( not ( = ?auto_731066 ?auto_731070 ) ) ( not ( = ?auto_731066 ?auto_731071 ) ) ( not ( = ?auto_731066 ?auto_731072 ) ) ( not ( = ?auto_731066 ?auto_731073 ) ) ( not ( = ?auto_731066 ?auto_731074 ) ) ( not ( = ?auto_731066 ?auto_731075 ) ) ( not ( = ?auto_731066 ?auto_731076 ) ) ( not ( = ?auto_731067 ?auto_731068 ) ) ( not ( = ?auto_731067 ?auto_731069 ) ) ( not ( = ?auto_731067 ?auto_731070 ) ) ( not ( = ?auto_731067 ?auto_731071 ) ) ( not ( = ?auto_731067 ?auto_731072 ) ) ( not ( = ?auto_731067 ?auto_731073 ) ) ( not ( = ?auto_731067 ?auto_731074 ) ) ( not ( = ?auto_731067 ?auto_731075 ) ) ( not ( = ?auto_731067 ?auto_731076 ) ) ( not ( = ?auto_731068 ?auto_731069 ) ) ( not ( = ?auto_731068 ?auto_731070 ) ) ( not ( = ?auto_731068 ?auto_731071 ) ) ( not ( = ?auto_731068 ?auto_731072 ) ) ( not ( = ?auto_731068 ?auto_731073 ) ) ( not ( = ?auto_731068 ?auto_731074 ) ) ( not ( = ?auto_731068 ?auto_731075 ) ) ( not ( = ?auto_731068 ?auto_731076 ) ) ( not ( = ?auto_731069 ?auto_731070 ) ) ( not ( = ?auto_731069 ?auto_731071 ) ) ( not ( = ?auto_731069 ?auto_731072 ) ) ( not ( = ?auto_731069 ?auto_731073 ) ) ( not ( = ?auto_731069 ?auto_731074 ) ) ( not ( = ?auto_731069 ?auto_731075 ) ) ( not ( = ?auto_731069 ?auto_731076 ) ) ( not ( = ?auto_731070 ?auto_731071 ) ) ( not ( = ?auto_731070 ?auto_731072 ) ) ( not ( = ?auto_731070 ?auto_731073 ) ) ( not ( = ?auto_731070 ?auto_731074 ) ) ( not ( = ?auto_731070 ?auto_731075 ) ) ( not ( = ?auto_731070 ?auto_731076 ) ) ( not ( = ?auto_731071 ?auto_731072 ) ) ( not ( = ?auto_731071 ?auto_731073 ) ) ( not ( = ?auto_731071 ?auto_731074 ) ) ( not ( = ?auto_731071 ?auto_731075 ) ) ( not ( = ?auto_731071 ?auto_731076 ) ) ( not ( = ?auto_731072 ?auto_731073 ) ) ( not ( = ?auto_731072 ?auto_731074 ) ) ( not ( = ?auto_731072 ?auto_731075 ) ) ( not ( = ?auto_731072 ?auto_731076 ) ) ( not ( = ?auto_731073 ?auto_731074 ) ) ( not ( = ?auto_731073 ?auto_731075 ) ) ( not ( = ?auto_731073 ?auto_731076 ) ) ( not ( = ?auto_731074 ?auto_731075 ) ) ( not ( = ?auto_731074 ?auto_731076 ) ) ( not ( = ?auto_731075 ?auto_731076 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_731076 )
      ( !STACK ?auto_731076 ?auto_731075 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731094 - BLOCK
      ?auto_731095 - BLOCK
      ?auto_731096 - BLOCK
      ?auto_731097 - BLOCK
      ?auto_731098 - BLOCK
      ?auto_731099 - BLOCK
      ?auto_731100 - BLOCK
      ?auto_731101 - BLOCK
      ?auto_731102 - BLOCK
      ?auto_731103 - BLOCK
      ?auto_731104 - BLOCK
      ?auto_731105 - BLOCK
      ?auto_731106 - BLOCK
      ?auto_731107 - BLOCK
      ?auto_731108 - BLOCK
      ?auto_731109 - BLOCK
      ?auto_731110 - BLOCK
    )
    :vars
    (
      ?auto_731111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731110 ?auto_731111 ) ( ON-TABLE ?auto_731094 ) ( ON ?auto_731095 ?auto_731094 ) ( ON ?auto_731096 ?auto_731095 ) ( ON ?auto_731097 ?auto_731096 ) ( ON ?auto_731098 ?auto_731097 ) ( ON ?auto_731099 ?auto_731098 ) ( ON ?auto_731100 ?auto_731099 ) ( ON ?auto_731101 ?auto_731100 ) ( ON ?auto_731102 ?auto_731101 ) ( ON ?auto_731103 ?auto_731102 ) ( ON ?auto_731104 ?auto_731103 ) ( ON ?auto_731105 ?auto_731104 ) ( ON ?auto_731106 ?auto_731105 ) ( ON ?auto_731107 ?auto_731106 ) ( ON ?auto_731108 ?auto_731107 ) ( not ( = ?auto_731094 ?auto_731095 ) ) ( not ( = ?auto_731094 ?auto_731096 ) ) ( not ( = ?auto_731094 ?auto_731097 ) ) ( not ( = ?auto_731094 ?auto_731098 ) ) ( not ( = ?auto_731094 ?auto_731099 ) ) ( not ( = ?auto_731094 ?auto_731100 ) ) ( not ( = ?auto_731094 ?auto_731101 ) ) ( not ( = ?auto_731094 ?auto_731102 ) ) ( not ( = ?auto_731094 ?auto_731103 ) ) ( not ( = ?auto_731094 ?auto_731104 ) ) ( not ( = ?auto_731094 ?auto_731105 ) ) ( not ( = ?auto_731094 ?auto_731106 ) ) ( not ( = ?auto_731094 ?auto_731107 ) ) ( not ( = ?auto_731094 ?auto_731108 ) ) ( not ( = ?auto_731094 ?auto_731109 ) ) ( not ( = ?auto_731094 ?auto_731110 ) ) ( not ( = ?auto_731094 ?auto_731111 ) ) ( not ( = ?auto_731095 ?auto_731096 ) ) ( not ( = ?auto_731095 ?auto_731097 ) ) ( not ( = ?auto_731095 ?auto_731098 ) ) ( not ( = ?auto_731095 ?auto_731099 ) ) ( not ( = ?auto_731095 ?auto_731100 ) ) ( not ( = ?auto_731095 ?auto_731101 ) ) ( not ( = ?auto_731095 ?auto_731102 ) ) ( not ( = ?auto_731095 ?auto_731103 ) ) ( not ( = ?auto_731095 ?auto_731104 ) ) ( not ( = ?auto_731095 ?auto_731105 ) ) ( not ( = ?auto_731095 ?auto_731106 ) ) ( not ( = ?auto_731095 ?auto_731107 ) ) ( not ( = ?auto_731095 ?auto_731108 ) ) ( not ( = ?auto_731095 ?auto_731109 ) ) ( not ( = ?auto_731095 ?auto_731110 ) ) ( not ( = ?auto_731095 ?auto_731111 ) ) ( not ( = ?auto_731096 ?auto_731097 ) ) ( not ( = ?auto_731096 ?auto_731098 ) ) ( not ( = ?auto_731096 ?auto_731099 ) ) ( not ( = ?auto_731096 ?auto_731100 ) ) ( not ( = ?auto_731096 ?auto_731101 ) ) ( not ( = ?auto_731096 ?auto_731102 ) ) ( not ( = ?auto_731096 ?auto_731103 ) ) ( not ( = ?auto_731096 ?auto_731104 ) ) ( not ( = ?auto_731096 ?auto_731105 ) ) ( not ( = ?auto_731096 ?auto_731106 ) ) ( not ( = ?auto_731096 ?auto_731107 ) ) ( not ( = ?auto_731096 ?auto_731108 ) ) ( not ( = ?auto_731096 ?auto_731109 ) ) ( not ( = ?auto_731096 ?auto_731110 ) ) ( not ( = ?auto_731096 ?auto_731111 ) ) ( not ( = ?auto_731097 ?auto_731098 ) ) ( not ( = ?auto_731097 ?auto_731099 ) ) ( not ( = ?auto_731097 ?auto_731100 ) ) ( not ( = ?auto_731097 ?auto_731101 ) ) ( not ( = ?auto_731097 ?auto_731102 ) ) ( not ( = ?auto_731097 ?auto_731103 ) ) ( not ( = ?auto_731097 ?auto_731104 ) ) ( not ( = ?auto_731097 ?auto_731105 ) ) ( not ( = ?auto_731097 ?auto_731106 ) ) ( not ( = ?auto_731097 ?auto_731107 ) ) ( not ( = ?auto_731097 ?auto_731108 ) ) ( not ( = ?auto_731097 ?auto_731109 ) ) ( not ( = ?auto_731097 ?auto_731110 ) ) ( not ( = ?auto_731097 ?auto_731111 ) ) ( not ( = ?auto_731098 ?auto_731099 ) ) ( not ( = ?auto_731098 ?auto_731100 ) ) ( not ( = ?auto_731098 ?auto_731101 ) ) ( not ( = ?auto_731098 ?auto_731102 ) ) ( not ( = ?auto_731098 ?auto_731103 ) ) ( not ( = ?auto_731098 ?auto_731104 ) ) ( not ( = ?auto_731098 ?auto_731105 ) ) ( not ( = ?auto_731098 ?auto_731106 ) ) ( not ( = ?auto_731098 ?auto_731107 ) ) ( not ( = ?auto_731098 ?auto_731108 ) ) ( not ( = ?auto_731098 ?auto_731109 ) ) ( not ( = ?auto_731098 ?auto_731110 ) ) ( not ( = ?auto_731098 ?auto_731111 ) ) ( not ( = ?auto_731099 ?auto_731100 ) ) ( not ( = ?auto_731099 ?auto_731101 ) ) ( not ( = ?auto_731099 ?auto_731102 ) ) ( not ( = ?auto_731099 ?auto_731103 ) ) ( not ( = ?auto_731099 ?auto_731104 ) ) ( not ( = ?auto_731099 ?auto_731105 ) ) ( not ( = ?auto_731099 ?auto_731106 ) ) ( not ( = ?auto_731099 ?auto_731107 ) ) ( not ( = ?auto_731099 ?auto_731108 ) ) ( not ( = ?auto_731099 ?auto_731109 ) ) ( not ( = ?auto_731099 ?auto_731110 ) ) ( not ( = ?auto_731099 ?auto_731111 ) ) ( not ( = ?auto_731100 ?auto_731101 ) ) ( not ( = ?auto_731100 ?auto_731102 ) ) ( not ( = ?auto_731100 ?auto_731103 ) ) ( not ( = ?auto_731100 ?auto_731104 ) ) ( not ( = ?auto_731100 ?auto_731105 ) ) ( not ( = ?auto_731100 ?auto_731106 ) ) ( not ( = ?auto_731100 ?auto_731107 ) ) ( not ( = ?auto_731100 ?auto_731108 ) ) ( not ( = ?auto_731100 ?auto_731109 ) ) ( not ( = ?auto_731100 ?auto_731110 ) ) ( not ( = ?auto_731100 ?auto_731111 ) ) ( not ( = ?auto_731101 ?auto_731102 ) ) ( not ( = ?auto_731101 ?auto_731103 ) ) ( not ( = ?auto_731101 ?auto_731104 ) ) ( not ( = ?auto_731101 ?auto_731105 ) ) ( not ( = ?auto_731101 ?auto_731106 ) ) ( not ( = ?auto_731101 ?auto_731107 ) ) ( not ( = ?auto_731101 ?auto_731108 ) ) ( not ( = ?auto_731101 ?auto_731109 ) ) ( not ( = ?auto_731101 ?auto_731110 ) ) ( not ( = ?auto_731101 ?auto_731111 ) ) ( not ( = ?auto_731102 ?auto_731103 ) ) ( not ( = ?auto_731102 ?auto_731104 ) ) ( not ( = ?auto_731102 ?auto_731105 ) ) ( not ( = ?auto_731102 ?auto_731106 ) ) ( not ( = ?auto_731102 ?auto_731107 ) ) ( not ( = ?auto_731102 ?auto_731108 ) ) ( not ( = ?auto_731102 ?auto_731109 ) ) ( not ( = ?auto_731102 ?auto_731110 ) ) ( not ( = ?auto_731102 ?auto_731111 ) ) ( not ( = ?auto_731103 ?auto_731104 ) ) ( not ( = ?auto_731103 ?auto_731105 ) ) ( not ( = ?auto_731103 ?auto_731106 ) ) ( not ( = ?auto_731103 ?auto_731107 ) ) ( not ( = ?auto_731103 ?auto_731108 ) ) ( not ( = ?auto_731103 ?auto_731109 ) ) ( not ( = ?auto_731103 ?auto_731110 ) ) ( not ( = ?auto_731103 ?auto_731111 ) ) ( not ( = ?auto_731104 ?auto_731105 ) ) ( not ( = ?auto_731104 ?auto_731106 ) ) ( not ( = ?auto_731104 ?auto_731107 ) ) ( not ( = ?auto_731104 ?auto_731108 ) ) ( not ( = ?auto_731104 ?auto_731109 ) ) ( not ( = ?auto_731104 ?auto_731110 ) ) ( not ( = ?auto_731104 ?auto_731111 ) ) ( not ( = ?auto_731105 ?auto_731106 ) ) ( not ( = ?auto_731105 ?auto_731107 ) ) ( not ( = ?auto_731105 ?auto_731108 ) ) ( not ( = ?auto_731105 ?auto_731109 ) ) ( not ( = ?auto_731105 ?auto_731110 ) ) ( not ( = ?auto_731105 ?auto_731111 ) ) ( not ( = ?auto_731106 ?auto_731107 ) ) ( not ( = ?auto_731106 ?auto_731108 ) ) ( not ( = ?auto_731106 ?auto_731109 ) ) ( not ( = ?auto_731106 ?auto_731110 ) ) ( not ( = ?auto_731106 ?auto_731111 ) ) ( not ( = ?auto_731107 ?auto_731108 ) ) ( not ( = ?auto_731107 ?auto_731109 ) ) ( not ( = ?auto_731107 ?auto_731110 ) ) ( not ( = ?auto_731107 ?auto_731111 ) ) ( not ( = ?auto_731108 ?auto_731109 ) ) ( not ( = ?auto_731108 ?auto_731110 ) ) ( not ( = ?auto_731108 ?auto_731111 ) ) ( not ( = ?auto_731109 ?auto_731110 ) ) ( not ( = ?auto_731109 ?auto_731111 ) ) ( not ( = ?auto_731110 ?auto_731111 ) ) ( CLEAR ?auto_731108 ) ( ON ?auto_731109 ?auto_731110 ) ( CLEAR ?auto_731109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_731094 ?auto_731095 ?auto_731096 ?auto_731097 ?auto_731098 ?auto_731099 ?auto_731100 ?auto_731101 ?auto_731102 ?auto_731103 ?auto_731104 ?auto_731105 ?auto_731106 ?auto_731107 ?auto_731108 ?auto_731109 )
      ( MAKE-17PILE ?auto_731094 ?auto_731095 ?auto_731096 ?auto_731097 ?auto_731098 ?auto_731099 ?auto_731100 ?auto_731101 ?auto_731102 ?auto_731103 ?auto_731104 ?auto_731105 ?auto_731106 ?auto_731107 ?auto_731108 ?auto_731109 ?auto_731110 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731129 - BLOCK
      ?auto_731130 - BLOCK
      ?auto_731131 - BLOCK
      ?auto_731132 - BLOCK
      ?auto_731133 - BLOCK
      ?auto_731134 - BLOCK
      ?auto_731135 - BLOCK
      ?auto_731136 - BLOCK
      ?auto_731137 - BLOCK
      ?auto_731138 - BLOCK
      ?auto_731139 - BLOCK
      ?auto_731140 - BLOCK
      ?auto_731141 - BLOCK
      ?auto_731142 - BLOCK
      ?auto_731143 - BLOCK
      ?auto_731144 - BLOCK
      ?auto_731145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731145 ) ( ON-TABLE ?auto_731129 ) ( ON ?auto_731130 ?auto_731129 ) ( ON ?auto_731131 ?auto_731130 ) ( ON ?auto_731132 ?auto_731131 ) ( ON ?auto_731133 ?auto_731132 ) ( ON ?auto_731134 ?auto_731133 ) ( ON ?auto_731135 ?auto_731134 ) ( ON ?auto_731136 ?auto_731135 ) ( ON ?auto_731137 ?auto_731136 ) ( ON ?auto_731138 ?auto_731137 ) ( ON ?auto_731139 ?auto_731138 ) ( ON ?auto_731140 ?auto_731139 ) ( ON ?auto_731141 ?auto_731140 ) ( ON ?auto_731142 ?auto_731141 ) ( ON ?auto_731143 ?auto_731142 ) ( not ( = ?auto_731129 ?auto_731130 ) ) ( not ( = ?auto_731129 ?auto_731131 ) ) ( not ( = ?auto_731129 ?auto_731132 ) ) ( not ( = ?auto_731129 ?auto_731133 ) ) ( not ( = ?auto_731129 ?auto_731134 ) ) ( not ( = ?auto_731129 ?auto_731135 ) ) ( not ( = ?auto_731129 ?auto_731136 ) ) ( not ( = ?auto_731129 ?auto_731137 ) ) ( not ( = ?auto_731129 ?auto_731138 ) ) ( not ( = ?auto_731129 ?auto_731139 ) ) ( not ( = ?auto_731129 ?auto_731140 ) ) ( not ( = ?auto_731129 ?auto_731141 ) ) ( not ( = ?auto_731129 ?auto_731142 ) ) ( not ( = ?auto_731129 ?auto_731143 ) ) ( not ( = ?auto_731129 ?auto_731144 ) ) ( not ( = ?auto_731129 ?auto_731145 ) ) ( not ( = ?auto_731130 ?auto_731131 ) ) ( not ( = ?auto_731130 ?auto_731132 ) ) ( not ( = ?auto_731130 ?auto_731133 ) ) ( not ( = ?auto_731130 ?auto_731134 ) ) ( not ( = ?auto_731130 ?auto_731135 ) ) ( not ( = ?auto_731130 ?auto_731136 ) ) ( not ( = ?auto_731130 ?auto_731137 ) ) ( not ( = ?auto_731130 ?auto_731138 ) ) ( not ( = ?auto_731130 ?auto_731139 ) ) ( not ( = ?auto_731130 ?auto_731140 ) ) ( not ( = ?auto_731130 ?auto_731141 ) ) ( not ( = ?auto_731130 ?auto_731142 ) ) ( not ( = ?auto_731130 ?auto_731143 ) ) ( not ( = ?auto_731130 ?auto_731144 ) ) ( not ( = ?auto_731130 ?auto_731145 ) ) ( not ( = ?auto_731131 ?auto_731132 ) ) ( not ( = ?auto_731131 ?auto_731133 ) ) ( not ( = ?auto_731131 ?auto_731134 ) ) ( not ( = ?auto_731131 ?auto_731135 ) ) ( not ( = ?auto_731131 ?auto_731136 ) ) ( not ( = ?auto_731131 ?auto_731137 ) ) ( not ( = ?auto_731131 ?auto_731138 ) ) ( not ( = ?auto_731131 ?auto_731139 ) ) ( not ( = ?auto_731131 ?auto_731140 ) ) ( not ( = ?auto_731131 ?auto_731141 ) ) ( not ( = ?auto_731131 ?auto_731142 ) ) ( not ( = ?auto_731131 ?auto_731143 ) ) ( not ( = ?auto_731131 ?auto_731144 ) ) ( not ( = ?auto_731131 ?auto_731145 ) ) ( not ( = ?auto_731132 ?auto_731133 ) ) ( not ( = ?auto_731132 ?auto_731134 ) ) ( not ( = ?auto_731132 ?auto_731135 ) ) ( not ( = ?auto_731132 ?auto_731136 ) ) ( not ( = ?auto_731132 ?auto_731137 ) ) ( not ( = ?auto_731132 ?auto_731138 ) ) ( not ( = ?auto_731132 ?auto_731139 ) ) ( not ( = ?auto_731132 ?auto_731140 ) ) ( not ( = ?auto_731132 ?auto_731141 ) ) ( not ( = ?auto_731132 ?auto_731142 ) ) ( not ( = ?auto_731132 ?auto_731143 ) ) ( not ( = ?auto_731132 ?auto_731144 ) ) ( not ( = ?auto_731132 ?auto_731145 ) ) ( not ( = ?auto_731133 ?auto_731134 ) ) ( not ( = ?auto_731133 ?auto_731135 ) ) ( not ( = ?auto_731133 ?auto_731136 ) ) ( not ( = ?auto_731133 ?auto_731137 ) ) ( not ( = ?auto_731133 ?auto_731138 ) ) ( not ( = ?auto_731133 ?auto_731139 ) ) ( not ( = ?auto_731133 ?auto_731140 ) ) ( not ( = ?auto_731133 ?auto_731141 ) ) ( not ( = ?auto_731133 ?auto_731142 ) ) ( not ( = ?auto_731133 ?auto_731143 ) ) ( not ( = ?auto_731133 ?auto_731144 ) ) ( not ( = ?auto_731133 ?auto_731145 ) ) ( not ( = ?auto_731134 ?auto_731135 ) ) ( not ( = ?auto_731134 ?auto_731136 ) ) ( not ( = ?auto_731134 ?auto_731137 ) ) ( not ( = ?auto_731134 ?auto_731138 ) ) ( not ( = ?auto_731134 ?auto_731139 ) ) ( not ( = ?auto_731134 ?auto_731140 ) ) ( not ( = ?auto_731134 ?auto_731141 ) ) ( not ( = ?auto_731134 ?auto_731142 ) ) ( not ( = ?auto_731134 ?auto_731143 ) ) ( not ( = ?auto_731134 ?auto_731144 ) ) ( not ( = ?auto_731134 ?auto_731145 ) ) ( not ( = ?auto_731135 ?auto_731136 ) ) ( not ( = ?auto_731135 ?auto_731137 ) ) ( not ( = ?auto_731135 ?auto_731138 ) ) ( not ( = ?auto_731135 ?auto_731139 ) ) ( not ( = ?auto_731135 ?auto_731140 ) ) ( not ( = ?auto_731135 ?auto_731141 ) ) ( not ( = ?auto_731135 ?auto_731142 ) ) ( not ( = ?auto_731135 ?auto_731143 ) ) ( not ( = ?auto_731135 ?auto_731144 ) ) ( not ( = ?auto_731135 ?auto_731145 ) ) ( not ( = ?auto_731136 ?auto_731137 ) ) ( not ( = ?auto_731136 ?auto_731138 ) ) ( not ( = ?auto_731136 ?auto_731139 ) ) ( not ( = ?auto_731136 ?auto_731140 ) ) ( not ( = ?auto_731136 ?auto_731141 ) ) ( not ( = ?auto_731136 ?auto_731142 ) ) ( not ( = ?auto_731136 ?auto_731143 ) ) ( not ( = ?auto_731136 ?auto_731144 ) ) ( not ( = ?auto_731136 ?auto_731145 ) ) ( not ( = ?auto_731137 ?auto_731138 ) ) ( not ( = ?auto_731137 ?auto_731139 ) ) ( not ( = ?auto_731137 ?auto_731140 ) ) ( not ( = ?auto_731137 ?auto_731141 ) ) ( not ( = ?auto_731137 ?auto_731142 ) ) ( not ( = ?auto_731137 ?auto_731143 ) ) ( not ( = ?auto_731137 ?auto_731144 ) ) ( not ( = ?auto_731137 ?auto_731145 ) ) ( not ( = ?auto_731138 ?auto_731139 ) ) ( not ( = ?auto_731138 ?auto_731140 ) ) ( not ( = ?auto_731138 ?auto_731141 ) ) ( not ( = ?auto_731138 ?auto_731142 ) ) ( not ( = ?auto_731138 ?auto_731143 ) ) ( not ( = ?auto_731138 ?auto_731144 ) ) ( not ( = ?auto_731138 ?auto_731145 ) ) ( not ( = ?auto_731139 ?auto_731140 ) ) ( not ( = ?auto_731139 ?auto_731141 ) ) ( not ( = ?auto_731139 ?auto_731142 ) ) ( not ( = ?auto_731139 ?auto_731143 ) ) ( not ( = ?auto_731139 ?auto_731144 ) ) ( not ( = ?auto_731139 ?auto_731145 ) ) ( not ( = ?auto_731140 ?auto_731141 ) ) ( not ( = ?auto_731140 ?auto_731142 ) ) ( not ( = ?auto_731140 ?auto_731143 ) ) ( not ( = ?auto_731140 ?auto_731144 ) ) ( not ( = ?auto_731140 ?auto_731145 ) ) ( not ( = ?auto_731141 ?auto_731142 ) ) ( not ( = ?auto_731141 ?auto_731143 ) ) ( not ( = ?auto_731141 ?auto_731144 ) ) ( not ( = ?auto_731141 ?auto_731145 ) ) ( not ( = ?auto_731142 ?auto_731143 ) ) ( not ( = ?auto_731142 ?auto_731144 ) ) ( not ( = ?auto_731142 ?auto_731145 ) ) ( not ( = ?auto_731143 ?auto_731144 ) ) ( not ( = ?auto_731143 ?auto_731145 ) ) ( not ( = ?auto_731144 ?auto_731145 ) ) ( CLEAR ?auto_731143 ) ( ON ?auto_731144 ?auto_731145 ) ( CLEAR ?auto_731144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_731129 ?auto_731130 ?auto_731131 ?auto_731132 ?auto_731133 ?auto_731134 ?auto_731135 ?auto_731136 ?auto_731137 ?auto_731138 ?auto_731139 ?auto_731140 ?auto_731141 ?auto_731142 ?auto_731143 ?auto_731144 )
      ( MAKE-17PILE ?auto_731129 ?auto_731130 ?auto_731131 ?auto_731132 ?auto_731133 ?auto_731134 ?auto_731135 ?auto_731136 ?auto_731137 ?auto_731138 ?auto_731139 ?auto_731140 ?auto_731141 ?auto_731142 ?auto_731143 ?auto_731144 ?auto_731145 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731163 - BLOCK
      ?auto_731164 - BLOCK
      ?auto_731165 - BLOCK
      ?auto_731166 - BLOCK
      ?auto_731167 - BLOCK
      ?auto_731168 - BLOCK
      ?auto_731169 - BLOCK
      ?auto_731170 - BLOCK
      ?auto_731171 - BLOCK
      ?auto_731172 - BLOCK
      ?auto_731173 - BLOCK
      ?auto_731174 - BLOCK
      ?auto_731175 - BLOCK
      ?auto_731176 - BLOCK
      ?auto_731177 - BLOCK
      ?auto_731178 - BLOCK
      ?auto_731179 - BLOCK
    )
    :vars
    (
      ?auto_731180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731179 ?auto_731180 ) ( ON-TABLE ?auto_731163 ) ( ON ?auto_731164 ?auto_731163 ) ( ON ?auto_731165 ?auto_731164 ) ( ON ?auto_731166 ?auto_731165 ) ( ON ?auto_731167 ?auto_731166 ) ( ON ?auto_731168 ?auto_731167 ) ( ON ?auto_731169 ?auto_731168 ) ( ON ?auto_731170 ?auto_731169 ) ( ON ?auto_731171 ?auto_731170 ) ( ON ?auto_731172 ?auto_731171 ) ( ON ?auto_731173 ?auto_731172 ) ( ON ?auto_731174 ?auto_731173 ) ( ON ?auto_731175 ?auto_731174 ) ( ON ?auto_731176 ?auto_731175 ) ( not ( = ?auto_731163 ?auto_731164 ) ) ( not ( = ?auto_731163 ?auto_731165 ) ) ( not ( = ?auto_731163 ?auto_731166 ) ) ( not ( = ?auto_731163 ?auto_731167 ) ) ( not ( = ?auto_731163 ?auto_731168 ) ) ( not ( = ?auto_731163 ?auto_731169 ) ) ( not ( = ?auto_731163 ?auto_731170 ) ) ( not ( = ?auto_731163 ?auto_731171 ) ) ( not ( = ?auto_731163 ?auto_731172 ) ) ( not ( = ?auto_731163 ?auto_731173 ) ) ( not ( = ?auto_731163 ?auto_731174 ) ) ( not ( = ?auto_731163 ?auto_731175 ) ) ( not ( = ?auto_731163 ?auto_731176 ) ) ( not ( = ?auto_731163 ?auto_731177 ) ) ( not ( = ?auto_731163 ?auto_731178 ) ) ( not ( = ?auto_731163 ?auto_731179 ) ) ( not ( = ?auto_731163 ?auto_731180 ) ) ( not ( = ?auto_731164 ?auto_731165 ) ) ( not ( = ?auto_731164 ?auto_731166 ) ) ( not ( = ?auto_731164 ?auto_731167 ) ) ( not ( = ?auto_731164 ?auto_731168 ) ) ( not ( = ?auto_731164 ?auto_731169 ) ) ( not ( = ?auto_731164 ?auto_731170 ) ) ( not ( = ?auto_731164 ?auto_731171 ) ) ( not ( = ?auto_731164 ?auto_731172 ) ) ( not ( = ?auto_731164 ?auto_731173 ) ) ( not ( = ?auto_731164 ?auto_731174 ) ) ( not ( = ?auto_731164 ?auto_731175 ) ) ( not ( = ?auto_731164 ?auto_731176 ) ) ( not ( = ?auto_731164 ?auto_731177 ) ) ( not ( = ?auto_731164 ?auto_731178 ) ) ( not ( = ?auto_731164 ?auto_731179 ) ) ( not ( = ?auto_731164 ?auto_731180 ) ) ( not ( = ?auto_731165 ?auto_731166 ) ) ( not ( = ?auto_731165 ?auto_731167 ) ) ( not ( = ?auto_731165 ?auto_731168 ) ) ( not ( = ?auto_731165 ?auto_731169 ) ) ( not ( = ?auto_731165 ?auto_731170 ) ) ( not ( = ?auto_731165 ?auto_731171 ) ) ( not ( = ?auto_731165 ?auto_731172 ) ) ( not ( = ?auto_731165 ?auto_731173 ) ) ( not ( = ?auto_731165 ?auto_731174 ) ) ( not ( = ?auto_731165 ?auto_731175 ) ) ( not ( = ?auto_731165 ?auto_731176 ) ) ( not ( = ?auto_731165 ?auto_731177 ) ) ( not ( = ?auto_731165 ?auto_731178 ) ) ( not ( = ?auto_731165 ?auto_731179 ) ) ( not ( = ?auto_731165 ?auto_731180 ) ) ( not ( = ?auto_731166 ?auto_731167 ) ) ( not ( = ?auto_731166 ?auto_731168 ) ) ( not ( = ?auto_731166 ?auto_731169 ) ) ( not ( = ?auto_731166 ?auto_731170 ) ) ( not ( = ?auto_731166 ?auto_731171 ) ) ( not ( = ?auto_731166 ?auto_731172 ) ) ( not ( = ?auto_731166 ?auto_731173 ) ) ( not ( = ?auto_731166 ?auto_731174 ) ) ( not ( = ?auto_731166 ?auto_731175 ) ) ( not ( = ?auto_731166 ?auto_731176 ) ) ( not ( = ?auto_731166 ?auto_731177 ) ) ( not ( = ?auto_731166 ?auto_731178 ) ) ( not ( = ?auto_731166 ?auto_731179 ) ) ( not ( = ?auto_731166 ?auto_731180 ) ) ( not ( = ?auto_731167 ?auto_731168 ) ) ( not ( = ?auto_731167 ?auto_731169 ) ) ( not ( = ?auto_731167 ?auto_731170 ) ) ( not ( = ?auto_731167 ?auto_731171 ) ) ( not ( = ?auto_731167 ?auto_731172 ) ) ( not ( = ?auto_731167 ?auto_731173 ) ) ( not ( = ?auto_731167 ?auto_731174 ) ) ( not ( = ?auto_731167 ?auto_731175 ) ) ( not ( = ?auto_731167 ?auto_731176 ) ) ( not ( = ?auto_731167 ?auto_731177 ) ) ( not ( = ?auto_731167 ?auto_731178 ) ) ( not ( = ?auto_731167 ?auto_731179 ) ) ( not ( = ?auto_731167 ?auto_731180 ) ) ( not ( = ?auto_731168 ?auto_731169 ) ) ( not ( = ?auto_731168 ?auto_731170 ) ) ( not ( = ?auto_731168 ?auto_731171 ) ) ( not ( = ?auto_731168 ?auto_731172 ) ) ( not ( = ?auto_731168 ?auto_731173 ) ) ( not ( = ?auto_731168 ?auto_731174 ) ) ( not ( = ?auto_731168 ?auto_731175 ) ) ( not ( = ?auto_731168 ?auto_731176 ) ) ( not ( = ?auto_731168 ?auto_731177 ) ) ( not ( = ?auto_731168 ?auto_731178 ) ) ( not ( = ?auto_731168 ?auto_731179 ) ) ( not ( = ?auto_731168 ?auto_731180 ) ) ( not ( = ?auto_731169 ?auto_731170 ) ) ( not ( = ?auto_731169 ?auto_731171 ) ) ( not ( = ?auto_731169 ?auto_731172 ) ) ( not ( = ?auto_731169 ?auto_731173 ) ) ( not ( = ?auto_731169 ?auto_731174 ) ) ( not ( = ?auto_731169 ?auto_731175 ) ) ( not ( = ?auto_731169 ?auto_731176 ) ) ( not ( = ?auto_731169 ?auto_731177 ) ) ( not ( = ?auto_731169 ?auto_731178 ) ) ( not ( = ?auto_731169 ?auto_731179 ) ) ( not ( = ?auto_731169 ?auto_731180 ) ) ( not ( = ?auto_731170 ?auto_731171 ) ) ( not ( = ?auto_731170 ?auto_731172 ) ) ( not ( = ?auto_731170 ?auto_731173 ) ) ( not ( = ?auto_731170 ?auto_731174 ) ) ( not ( = ?auto_731170 ?auto_731175 ) ) ( not ( = ?auto_731170 ?auto_731176 ) ) ( not ( = ?auto_731170 ?auto_731177 ) ) ( not ( = ?auto_731170 ?auto_731178 ) ) ( not ( = ?auto_731170 ?auto_731179 ) ) ( not ( = ?auto_731170 ?auto_731180 ) ) ( not ( = ?auto_731171 ?auto_731172 ) ) ( not ( = ?auto_731171 ?auto_731173 ) ) ( not ( = ?auto_731171 ?auto_731174 ) ) ( not ( = ?auto_731171 ?auto_731175 ) ) ( not ( = ?auto_731171 ?auto_731176 ) ) ( not ( = ?auto_731171 ?auto_731177 ) ) ( not ( = ?auto_731171 ?auto_731178 ) ) ( not ( = ?auto_731171 ?auto_731179 ) ) ( not ( = ?auto_731171 ?auto_731180 ) ) ( not ( = ?auto_731172 ?auto_731173 ) ) ( not ( = ?auto_731172 ?auto_731174 ) ) ( not ( = ?auto_731172 ?auto_731175 ) ) ( not ( = ?auto_731172 ?auto_731176 ) ) ( not ( = ?auto_731172 ?auto_731177 ) ) ( not ( = ?auto_731172 ?auto_731178 ) ) ( not ( = ?auto_731172 ?auto_731179 ) ) ( not ( = ?auto_731172 ?auto_731180 ) ) ( not ( = ?auto_731173 ?auto_731174 ) ) ( not ( = ?auto_731173 ?auto_731175 ) ) ( not ( = ?auto_731173 ?auto_731176 ) ) ( not ( = ?auto_731173 ?auto_731177 ) ) ( not ( = ?auto_731173 ?auto_731178 ) ) ( not ( = ?auto_731173 ?auto_731179 ) ) ( not ( = ?auto_731173 ?auto_731180 ) ) ( not ( = ?auto_731174 ?auto_731175 ) ) ( not ( = ?auto_731174 ?auto_731176 ) ) ( not ( = ?auto_731174 ?auto_731177 ) ) ( not ( = ?auto_731174 ?auto_731178 ) ) ( not ( = ?auto_731174 ?auto_731179 ) ) ( not ( = ?auto_731174 ?auto_731180 ) ) ( not ( = ?auto_731175 ?auto_731176 ) ) ( not ( = ?auto_731175 ?auto_731177 ) ) ( not ( = ?auto_731175 ?auto_731178 ) ) ( not ( = ?auto_731175 ?auto_731179 ) ) ( not ( = ?auto_731175 ?auto_731180 ) ) ( not ( = ?auto_731176 ?auto_731177 ) ) ( not ( = ?auto_731176 ?auto_731178 ) ) ( not ( = ?auto_731176 ?auto_731179 ) ) ( not ( = ?auto_731176 ?auto_731180 ) ) ( not ( = ?auto_731177 ?auto_731178 ) ) ( not ( = ?auto_731177 ?auto_731179 ) ) ( not ( = ?auto_731177 ?auto_731180 ) ) ( not ( = ?auto_731178 ?auto_731179 ) ) ( not ( = ?auto_731178 ?auto_731180 ) ) ( not ( = ?auto_731179 ?auto_731180 ) ) ( ON ?auto_731178 ?auto_731179 ) ( CLEAR ?auto_731176 ) ( ON ?auto_731177 ?auto_731178 ) ( CLEAR ?auto_731177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_731163 ?auto_731164 ?auto_731165 ?auto_731166 ?auto_731167 ?auto_731168 ?auto_731169 ?auto_731170 ?auto_731171 ?auto_731172 ?auto_731173 ?auto_731174 ?auto_731175 ?auto_731176 ?auto_731177 )
      ( MAKE-17PILE ?auto_731163 ?auto_731164 ?auto_731165 ?auto_731166 ?auto_731167 ?auto_731168 ?auto_731169 ?auto_731170 ?auto_731171 ?auto_731172 ?auto_731173 ?auto_731174 ?auto_731175 ?auto_731176 ?auto_731177 ?auto_731178 ?auto_731179 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731198 - BLOCK
      ?auto_731199 - BLOCK
      ?auto_731200 - BLOCK
      ?auto_731201 - BLOCK
      ?auto_731202 - BLOCK
      ?auto_731203 - BLOCK
      ?auto_731204 - BLOCK
      ?auto_731205 - BLOCK
      ?auto_731206 - BLOCK
      ?auto_731207 - BLOCK
      ?auto_731208 - BLOCK
      ?auto_731209 - BLOCK
      ?auto_731210 - BLOCK
      ?auto_731211 - BLOCK
      ?auto_731212 - BLOCK
      ?auto_731213 - BLOCK
      ?auto_731214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731214 ) ( ON-TABLE ?auto_731198 ) ( ON ?auto_731199 ?auto_731198 ) ( ON ?auto_731200 ?auto_731199 ) ( ON ?auto_731201 ?auto_731200 ) ( ON ?auto_731202 ?auto_731201 ) ( ON ?auto_731203 ?auto_731202 ) ( ON ?auto_731204 ?auto_731203 ) ( ON ?auto_731205 ?auto_731204 ) ( ON ?auto_731206 ?auto_731205 ) ( ON ?auto_731207 ?auto_731206 ) ( ON ?auto_731208 ?auto_731207 ) ( ON ?auto_731209 ?auto_731208 ) ( ON ?auto_731210 ?auto_731209 ) ( ON ?auto_731211 ?auto_731210 ) ( not ( = ?auto_731198 ?auto_731199 ) ) ( not ( = ?auto_731198 ?auto_731200 ) ) ( not ( = ?auto_731198 ?auto_731201 ) ) ( not ( = ?auto_731198 ?auto_731202 ) ) ( not ( = ?auto_731198 ?auto_731203 ) ) ( not ( = ?auto_731198 ?auto_731204 ) ) ( not ( = ?auto_731198 ?auto_731205 ) ) ( not ( = ?auto_731198 ?auto_731206 ) ) ( not ( = ?auto_731198 ?auto_731207 ) ) ( not ( = ?auto_731198 ?auto_731208 ) ) ( not ( = ?auto_731198 ?auto_731209 ) ) ( not ( = ?auto_731198 ?auto_731210 ) ) ( not ( = ?auto_731198 ?auto_731211 ) ) ( not ( = ?auto_731198 ?auto_731212 ) ) ( not ( = ?auto_731198 ?auto_731213 ) ) ( not ( = ?auto_731198 ?auto_731214 ) ) ( not ( = ?auto_731199 ?auto_731200 ) ) ( not ( = ?auto_731199 ?auto_731201 ) ) ( not ( = ?auto_731199 ?auto_731202 ) ) ( not ( = ?auto_731199 ?auto_731203 ) ) ( not ( = ?auto_731199 ?auto_731204 ) ) ( not ( = ?auto_731199 ?auto_731205 ) ) ( not ( = ?auto_731199 ?auto_731206 ) ) ( not ( = ?auto_731199 ?auto_731207 ) ) ( not ( = ?auto_731199 ?auto_731208 ) ) ( not ( = ?auto_731199 ?auto_731209 ) ) ( not ( = ?auto_731199 ?auto_731210 ) ) ( not ( = ?auto_731199 ?auto_731211 ) ) ( not ( = ?auto_731199 ?auto_731212 ) ) ( not ( = ?auto_731199 ?auto_731213 ) ) ( not ( = ?auto_731199 ?auto_731214 ) ) ( not ( = ?auto_731200 ?auto_731201 ) ) ( not ( = ?auto_731200 ?auto_731202 ) ) ( not ( = ?auto_731200 ?auto_731203 ) ) ( not ( = ?auto_731200 ?auto_731204 ) ) ( not ( = ?auto_731200 ?auto_731205 ) ) ( not ( = ?auto_731200 ?auto_731206 ) ) ( not ( = ?auto_731200 ?auto_731207 ) ) ( not ( = ?auto_731200 ?auto_731208 ) ) ( not ( = ?auto_731200 ?auto_731209 ) ) ( not ( = ?auto_731200 ?auto_731210 ) ) ( not ( = ?auto_731200 ?auto_731211 ) ) ( not ( = ?auto_731200 ?auto_731212 ) ) ( not ( = ?auto_731200 ?auto_731213 ) ) ( not ( = ?auto_731200 ?auto_731214 ) ) ( not ( = ?auto_731201 ?auto_731202 ) ) ( not ( = ?auto_731201 ?auto_731203 ) ) ( not ( = ?auto_731201 ?auto_731204 ) ) ( not ( = ?auto_731201 ?auto_731205 ) ) ( not ( = ?auto_731201 ?auto_731206 ) ) ( not ( = ?auto_731201 ?auto_731207 ) ) ( not ( = ?auto_731201 ?auto_731208 ) ) ( not ( = ?auto_731201 ?auto_731209 ) ) ( not ( = ?auto_731201 ?auto_731210 ) ) ( not ( = ?auto_731201 ?auto_731211 ) ) ( not ( = ?auto_731201 ?auto_731212 ) ) ( not ( = ?auto_731201 ?auto_731213 ) ) ( not ( = ?auto_731201 ?auto_731214 ) ) ( not ( = ?auto_731202 ?auto_731203 ) ) ( not ( = ?auto_731202 ?auto_731204 ) ) ( not ( = ?auto_731202 ?auto_731205 ) ) ( not ( = ?auto_731202 ?auto_731206 ) ) ( not ( = ?auto_731202 ?auto_731207 ) ) ( not ( = ?auto_731202 ?auto_731208 ) ) ( not ( = ?auto_731202 ?auto_731209 ) ) ( not ( = ?auto_731202 ?auto_731210 ) ) ( not ( = ?auto_731202 ?auto_731211 ) ) ( not ( = ?auto_731202 ?auto_731212 ) ) ( not ( = ?auto_731202 ?auto_731213 ) ) ( not ( = ?auto_731202 ?auto_731214 ) ) ( not ( = ?auto_731203 ?auto_731204 ) ) ( not ( = ?auto_731203 ?auto_731205 ) ) ( not ( = ?auto_731203 ?auto_731206 ) ) ( not ( = ?auto_731203 ?auto_731207 ) ) ( not ( = ?auto_731203 ?auto_731208 ) ) ( not ( = ?auto_731203 ?auto_731209 ) ) ( not ( = ?auto_731203 ?auto_731210 ) ) ( not ( = ?auto_731203 ?auto_731211 ) ) ( not ( = ?auto_731203 ?auto_731212 ) ) ( not ( = ?auto_731203 ?auto_731213 ) ) ( not ( = ?auto_731203 ?auto_731214 ) ) ( not ( = ?auto_731204 ?auto_731205 ) ) ( not ( = ?auto_731204 ?auto_731206 ) ) ( not ( = ?auto_731204 ?auto_731207 ) ) ( not ( = ?auto_731204 ?auto_731208 ) ) ( not ( = ?auto_731204 ?auto_731209 ) ) ( not ( = ?auto_731204 ?auto_731210 ) ) ( not ( = ?auto_731204 ?auto_731211 ) ) ( not ( = ?auto_731204 ?auto_731212 ) ) ( not ( = ?auto_731204 ?auto_731213 ) ) ( not ( = ?auto_731204 ?auto_731214 ) ) ( not ( = ?auto_731205 ?auto_731206 ) ) ( not ( = ?auto_731205 ?auto_731207 ) ) ( not ( = ?auto_731205 ?auto_731208 ) ) ( not ( = ?auto_731205 ?auto_731209 ) ) ( not ( = ?auto_731205 ?auto_731210 ) ) ( not ( = ?auto_731205 ?auto_731211 ) ) ( not ( = ?auto_731205 ?auto_731212 ) ) ( not ( = ?auto_731205 ?auto_731213 ) ) ( not ( = ?auto_731205 ?auto_731214 ) ) ( not ( = ?auto_731206 ?auto_731207 ) ) ( not ( = ?auto_731206 ?auto_731208 ) ) ( not ( = ?auto_731206 ?auto_731209 ) ) ( not ( = ?auto_731206 ?auto_731210 ) ) ( not ( = ?auto_731206 ?auto_731211 ) ) ( not ( = ?auto_731206 ?auto_731212 ) ) ( not ( = ?auto_731206 ?auto_731213 ) ) ( not ( = ?auto_731206 ?auto_731214 ) ) ( not ( = ?auto_731207 ?auto_731208 ) ) ( not ( = ?auto_731207 ?auto_731209 ) ) ( not ( = ?auto_731207 ?auto_731210 ) ) ( not ( = ?auto_731207 ?auto_731211 ) ) ( not ( = ?auto_731207 ?auto_731212 ) ) ( not ( = ?auto_731207 ?auto_731213 ) ) ( not ( = ?auto_731207 ?auto_731214 ) ) ( not ( = ?auto_731208 ?auto_731209 ) ) ( not ( = ?auto_731208 ?auto_731210 ) ) ( not ( = ?auto_731208 ?auto_731211 ) ) ( not ( = ?auto_731208 ?auto_731212 ) ) ( not ( = ?auto_731208 ?auto_731213 ) ) ( not ( = ?auto_731208 ?auto_731214 ) ) ( not ( = ?auto_731209 ?auto_731210 ) ) ( not ( = ?auto_731209 ?auto_731211 ) ) ( not ( = ?auto_731209 ?auto_731212 ) ) ( not ( = ?auto_731209 ?auto_731213 ) ) ( not ( = ?auto_731209 ?auto_731214 ) ) ( not ( = ?auto_731210 ?auto_731211 ) ) ( not ( = ?auto_731210 ?auto_731212 ) ) ( not ( = ?auto_731210 ?auto_731213 ) ) ( not ( = ?auto_731210 ?auto_731214 ) ) ( not ( = ?auto_731211 ?auto_731212 ) ) ( not ( = ?auto_731211 ?auto_731213 ) ) ( not ( = ?auto_731211 ?auto_731214 ) ) ( not ( = ?auto_731212 ?auto_731213 ) ) ( not ( = ?auto_731212 ?auto_731214 ) ) ( not ( = ?auto_731213 ?auto_731214 ) ) ( ON ?auto_731213 ?auto_731214 ) ( CLEAR ?auto_731211 ) ( ON ?auto_731212 ?auto_731213 ) ( CLEAR ?auto_731212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_731198 ?auto_731199 ?auto_731200 ?auto_731201 ?auto_731202 ?auto_731203 ?auto_731204 ?auto_731205 ?auto_731206 ?auto_731207 ?auto_731208 ?auto_731209 ?auto_731210 ?auto_731211 ?auto_731212 )
      ( MAKE-17PILE ?auto_731198 ?auto_731199 ?auto_731200 ?auto_731201 ?auto_731202 ?auto_731203 ?auto_731204 ?auto_731205 ?auto_731206 ?auto_731207 ?auto_731208 ?auto_731209 ?auto_731210 ?auto_731211 ?auto_731212 ?auto_731213 ?auto_731214 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731232 - BLOCK
      ?auto_731233 - BLOCK
      ?auto_731234 - BLOCK
      ?auto_731235 - BLOCK
      ?auto_731236 - BLOCK
      ?auto_731237 - BLOCK
      ?auto_731238 - BLOCK
      ?auto_731239 - BLOCK
      ?auto_731240 - BLOCK
      ?auto_731241 - BLOCK
      ?auto_731242 - BLOCK
      ?auto_731243 - BLOCK
      ?auto_731244 - BLOCK
      ?auto_731245 - BLOCK
      ?auto_731246 - BLOCK
      ?auto_731247 - BLOCK
      ?auto_731248 - BLOCK
    )
    :vars
    (
      ?auto_731249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731248 ?auto_731249 ) ( ON-TABLE ?auto_731232 ) ( ON ?auto_731233 ?auto_731232 ) ( ON ?auto_731234 ?auto_731233 ) ( ON ?auto_731235 ?auto_731234 ) ( ON ?auto_731236 ?auto_731235 ) ( ON ?auto_731237 ?auto_731236 ) ( ON ?auto_731238 ?auto_731237 ) ( ON ?auto_731239 ?auto_731238 ) ( ON ?auto_731240 ?auto_731239 ) ( ON ?auto_731241 ?auto_731240 ) ( ON ?auto_731242 ?auto_731241 ) ( ON ?auto_731243 ?auto_731242 ) ( ON ?auto_731244 ?auto_731243 ) ( not ( = ?auto_731232 ?auto_731233 ) ) ( not ( = ?auto_731232 ?auto_731234 ) ) ( not ( = ?auto_731232 ?auto_731235 ) ) ( not ( = ?auto_731232 ?auto_731236 ) ) ( not ( = ?auto_731232 ?auto_731237 ) ) ( not ( = ?auto_731232 ?auto_731238 ) ) ( not ( = ?auto_731232 ?auto_731239 ) ) ( not ( = ?auto_731232 ?auto_731240 ) ) ( not ( = ?auto_731232 ?auto_731241 ) ) ( not ( = ?auto_731232 ?auto_731242 ) ) ( not ( = ?auto_731232 ?auto_731243 ) ) ( not ( = ?auto_731232 ?auto_731244 ) ) ( not ( = ?auto_731232 ?auto_731245 ) ) ( not ( = ?auto_731232 ?auto_731246 ) ) ( not ( = ?auto_731232 ?auto_731247 ) ) ( not ( = ?auto_731232 ?auto_731248 ) ) ( not ( = ?auto_731232 ?auto_731249 ) ) ( not ( = ?auto_731233 ?auto_731234 ) ) ( not ( = ?auto_731233 ?auto_731235 ) ) ( not ( = ?auto_731233 ?auto_731236 ) ) ( not ( = ?auto_731233 ?auto_731237 ) ) ( not ( = ?auto_731233 ?auto_731238 ) ) ( not ( = ?auto_731233 ?auto_731239 ) ) ( not ( = ?auto_731233 ?auto_731240 ) ) ( not ( = ?auto_731233 ?auto_731241 ) ) ( not ( = ?auto_731233 ?auto_731242 ) ) ( not ( = ?auto_731233 ?auto_731243 ) ) ( not ( = ?auto_731233 ?auto_731244 ) ) ( not ( = ?auto_731233 ?auto_731245 ) ) ( not ( = ?auto_731233 ?auto_731246 ) ) ( not ( = ?auto_731233 ?auto_731247 ) ) ( not ( = ?auto_731233 ?auto_731248 ) ) ( not ( = ?auto_731233 ?auto_731249 ) ) ( not ( = ?auto_731234 ?auto_731235 ) ) ( not ( = ?auto_731234 ?auto_731236 ) ) ( not ( = ?auto_731234 ?auto_731237 ) ) ( not ( = ?auto_731234 ?auto_731238 ) ) ( not ( = ?auto_731234 ?auto_731239 ) ) ( not ( = ?auto_731234 ?auto_731240 ) ) ( not ( = ?auto_731234 ?auto_731241 ) ) ( not ( = ?auto_731234 ?auto_731242 ) ) ( not ( = ?auto_731234 ?auto_731243 ) ) ( not ( = ?auto_731234 ?auto_731244 ) ) ( not ( = ?auto_731234 ?auto_731245 ) ) ( not ( = ?auto_731234 ?auto_731246 ) ) ( not ( = ?auto_731234 ?auto_731247 ) ) ( not ( = ?auto_731234 ?auto_731248 ) ) ( not ( = ?auto_731234 ?auto_731249 ) ) ( not ( = ?auto_731235 ?auto_731236 ) ) ( not ( = ?auto_731235 ?auto_731237 ) ) ( not ( = ?auto_731235 ?auto_731238 ) ) ( not ( = ?auto_731235 ?auto_731239 ) ) ( not ( = ?auto_731235 ?auto_731240 ) ) ( not ( = ?auto_731235 ?auto_731241 ) ) ( not ( = ?auto_731235 ?auto_731242 ) ) ( not ( = ?auto_731235 ?auto_731243 ) ) ( not ( = ?auto_731235 ?auto_731244 ) ) ( not ( = ?auto_731235 ?auto_731245 ) ) ( not ( = ?auto_731235 ?auto_731246 ) ) ( not ( = ?auto_731235 ?auto_731247 ) ) ( not ( = ?auto_731235 ?auto_731248 ) ) ( not ( = ?auto_731235 ?auto_731249 ) ) ( not ( = ?auto_731236 ?auto_731237 ) ) ( not ( = ?auto_731236 ?auto_731238 ) ) ( not ( = ?auto_731236 ?auto_731239 ) ) ( not ( = ?auto_731236 ?auto_731240 ) ) ( not ( = ?auto_731236 ?auto_731241 ) ) ( not ( = ?auto_731236 ?auto_731242 ) ) ( not ( = ?auto_731236 ?auto_731243 ) ) ( not ( = ?auto_731236 ?auto_731244 ) ) ( not ( = ?auto_731236 ?auto_731245 ) ) ( not ( = ?auto_731236 ?auto_731246 ) ) ( not ( = ?auto_731236 ?auto_731247 ) ) ( not ( = ?auto_731236 ?auto_731248 ) ) ( not ( = ?auto_731236 ?auto_731249 ) ) ( not ( = ?auto_731237 ?auto_731238 ) ) ( not ( = ?auto_731237 ?auto_731239 ) ) ( not ( = ?auto_731237 ?auto_731240 ) ) ( not ( = ?auto_731237 ?auto_731241 ) ) ( not ( = ?auto_731237 ?auto_731242 ) ) ( not ( = ?auto_731237 ?auto_731243 ) ) ( not ( = ?auto_731237 ?auto_731244 ) ) ( not ( = ?auto_731237 ?auto_731245 ) ) ( not ( = ?auto_731237 ?auto_731246 ) ) ( not ( = ?auto_731237 ?auto_731247 ) ) ( not ( = ?auto_731237 ?auto_731248 ) ) ( not ( = ?auto_731237 ?auto_731249 ) ) ( not ( = ?auto_731238 ?auto_731239 ) ) ( not ( = ?auto_731238 ?auto_731240 ) ) ( not ( = ?auto_731238 ?auto_731241 ) ) ( not ( = ?auto_731238 ?auto_731242 ) ) ( not ( = ?auto_731238 ?auto_731243 ) ) ( not ( = ?auto_731238 ?auto_731244 ) ) ( not ( = ?auto_731238 ?auto_731245 ) ) ( not ( = ?auto_731238 ?auto_731246 ) ) ( not ( = ?auto_731238 ?auto_731247 ) ) ( not ( = ?auto_731238 ?auto_731248 ) ) ( not ( = ?auto_731238 ?auto_731249 ) ) ( not ( = ?auto_731239 ?auto_731240 ) ) ( not ( = ?auto_731239 ?auto_731241 ) ) ( not ( = ?auto_731239 ?auto_731242 ) ) ( not ( = ?auto_731239 ?auto_731243 ) ) ( not ( = ?auto_731239 ?auto_731244 ) ) ( not ( = ?auto_731239 ?auto_731245 ) ) ( not ( = ?auto_731239 ?auto_731246 ) ) ( not ( = ?auto_731239 ?auto_731247 ) ) ( not ( = ?auto_731239 ?auto_731248 ) ) ( not ( = ?auto_731239 ?auto_731249 ) ) ( not ( = ?auto_731240 ?auto_731241 ) ) ( not ( = ?auto_731240 ?auto_731242 ) ) ( not ( = ?auto_731240 ?auto_731243 ) ) ( not ( = ?auto_731240 ?auto_731244 ) ) ( not ( = ?auto_731240 ?auto_731245 ) ) ( not ( = ?auto_731240 ?auto_731246 ) ) ( not ( = ?auto_731240 ?auto_731247 ) ) ( not ( = ?auto_731240 ?auto_731248 ) ) ( not ( = ?auto_731240 ?auto_731249 ) ) ( not ( = ?auto_731241 ?auto_731242 ) ) ( not ( = ?auto_731241 ?auto_731243 ) ) ( not ( = ?auto_731241 ?auto_731244 ) ) ( not ( = ?auto_731241 ?auto_731245 ) ) ( not ( = ?auto_731241 ?auto_731246 ) ) ( not ( = ?auto_731241 ?auto_731247 ) ) ( not ( = ?auto_731241 ?auto_731248 ) ) ( not ( = ?auto_731241 ?auto_731249 ) ) ( not ( = ?auto_731242 ?auto_731243 ) ) ( not ( = ?auto_731242 ?auto_731244 ) ) ( not ( = ?auto_731242 ?auto_731245 ) ) ( not ( = ?auto_731242 ?auto_731246 ) ) ( not ( = ?auto_731242 ?auto_731247 ) ) ( not ( = ?auto_731242 ?auto_731248 ) ) ( not ( = ?auto_731242 ?auto_731249 ) ) ( not ( = ?auto_731243 ?auto_731244 ) ) ( not ( = ?auto_731243 ?auto_731245 ) ) ( not ( = ?auto_731243 ?auto_731246 ) ) ( not ( = ?auto_731243 ?auto_731247 ) ) ( not ( = ?auto_731243 ?auto_731248 ) ) ( not ( = ?auto_731243 ?auto_731249 ) ) ( not ( = ?auto_731244 ?auto_731245 ) ) ( not ( = ?auto_731244 ?auto_731246 ) ) ( not ( = ?auto_731244 ?auto_731247 ) ) ( not ( = ?auto_731244 ?auto_731248 ) ) ( not ( = ?auto_731244 ?auto_731249 ) ) ( not ( = ?auto_731245 ?auto_731246 ) ) ( not ( = ?auto_731245 ?auto_731247 ) ) ( not ( = ?auto_731245 ?auto_731248 ) ) ( not ( = ?auto_731245 ?auto_731249 ) ) ( not ( = ?auto_731246 ?auto_731247 ) ) ( not ( = ?auto_731246 ?auto_731248 ) ) ( not ( = ?auto_731246 ?auto_731249 ) ) ( not ( = ?auto_731247 ?auto_731248 ) ) ( not ( = ?auto_731247 ?auto_731249 ) ) ( not ( = ?auto_731248 ?auto_731249 ) ) ( ON ?auto_731247 ?auto_731248 ) ( ON ?auto_731246 ?auto_731247 ) ( CLEAR ?auto_731244 ) ( ON ?auto_731245 ?auto_731246 ) ( CLEAR ?auto_731245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_731232 ?auto_731233 ?auto_731234 ?auto_731235 ?auto_731236 ?auto_731237 ?auto_731238 ?auto_731239 ?auto_731240 ?auto_731241 ?auto_731242 ?auto_731243 ?auto_731244 ?auto_731245 )
      ( MAKE-17PILE ?auto_731232 ?auto_731233 ?auto_731234 ?auto_731235 ?auto_731236 ?auto_731237 ?auto_731238 ?auto_731239 ?auto_731240 ?auto_731241 ?auto_731242 ?auto_731243 ?auto_731244 ?auto_731245 ?auto_731246 ?auto_731247 ?auto_731248 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731267 - BLOCK
      ?auto_731268 - BLOCK
      ?auto_731269 - BLOCK
      ?auto_731270 - BLOCK
      ?auto_731271 - BLOCK
      ?auto_731272 - BLOCK
      ?auto_731273 - BLOCK
      ?auto_731274 - BLOCK
      ?auto_731275 - BLOCK
      ?auto_731276 - BLOCK
      ?auto_731277 - BLOCK
      ?auto_731278 - BLOCK
      ?auto_731279 - BLOCK
      ?auto_731280 - BLOCK
      ?auto_731281 - BLOCK
      ?auto_731282 - BLOCK
      ?auto_731283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731283 ) ( ON-TABLE ?auto_731267 ) ( ON ?auto_731268 ?auto_731267 ) ( ON ?auto_731269 ?auto_731268 ) ( ON ?auto_731270 ?auto_731269 ) ( ON ?auto_731271 ?auto_731270 ) ( ON ?auto_731272 ?auto_731271 ) ( ON ?auto_731273 ?auto_731272 ) ( ON ?auto_731274 ?auto_731273 ) ( ON ?auto_731275 ?auto_731274 ) ( ON ?auto_731276 ?auto_731275 ) ( ON ?auto_731277 ?auto_731276 ) ( ON ?auto_731278 ?auto_731277 ) ( ON ?auto_731279 ?auto_731278 ) ( not ( = ?auto_731267 ?auto_731268 ) ) ( not ( = ?auto_731267 ?auto_731269 ) ) ( not ( = ?auto_731267 ?auto_731270 ) ) ( not ( = ?auto_731267 ?auto_731271 ) ) ( not ( = ?auto_731267 ?auto_731272 ) ) ( not ( = ?auto_731267 ?auto_731273 ) ) ( not ( = ?auto_731267 ?auto_731274 ) ) ( not ( = ?auto_731267 ?auto_731275 ) ) ( not ( = ?auto_731267 ?auto_731276 ) ) ( not ( = ?auto_731267 ?auto_731277 ) ) ( not ( = ?auto_731267 ?auto_731278 ) ) ( not ( = ?auto_731267 ?auto_731279 ) ) ( not ( = ?auto_731267 ?auto_731280 ) ) ( not ( = ?auto_731267 ?auto_731281 ) ) ( not ( = ?auto_731267 ?auto_731282 ) ) ( not ( = ?auto_731267 ?auto_731283 ) ) ( not ( = ?auto_731268 ?auto_731269 ) ) ( not ( = ?auto_731268 ?auto_731270 ) ) ( not ( = ?auto_731268 ?auto_731271 ) ) ( not ( = ?auto_731268 ?auto_731272 ) ) ( not ( = ?auto_731268 ?auto_731273 ) ) ( not ( = ?auto_731268 ?auto_731274 ) ) ( not ( = ?auto_731268 ?auto_731275 ) ) ( not ( = ?auto_731268 ?auto_731276 ) ) ( not ( = ?auto_731268 ?auto_731277 ) ) ( not ( = ?auto_731268 ?auto_731278 ) ) ( not ( = ?auto_731268 ?auto_731279 ) ) ( not ( = ?auto_731268 ?auto_731280 ) ) ( not ( = ?auto_731268 ?auto_731281 ) ) ( not ( = ?auto_731268 ?auto_731282 ) ) ( not ( = ?auto_731268 ?auto_731283 ) ) ( not ( = ?auto_731269 ?auto_731270 ) ) ( not ( = ?auto_731269 ?auto_731271 ) ) ( not ( = ?auto_731269 ?auto_731272 ) ) ( not ( = ?auto_731269 ?auto_731273 ) ) ( not ( = ?auto_731269 ?auto_731274 ) ) ( not ( = ?auto_731269 ?auto_731275 ) ) ( not ( = ?auto_731269 ?auto_731276 ) ) ( not ( = ?auto_731269 ?auto_731277 ) ) ( not ( = ?auto_731269 ?auto_731278 ) ) ( not ( = ?auto_731269 ?auto_731279 ) ) ( not ( = ?auto_731269 ?auto_731280 ) ) ( not ( = ?auto_731269 ?auto_731281 ) ) ( not ( = ?auto_731269 ?auto_731282 ) ) ( not ( = ?auto_731269 ?auto_731283 ) ) ( not ( = ?auto_731270 ?auto_731271 ) ) ( not ( = ?auto_731270 ?auto_731272 ) ) ( not ( = ?auto_731270 ?auto_731273 ) ) ( not ( = ?auto_731270 ?auto_731274 ) ) ( not ( = ?auto_731270 ?auto_731275 ) ) ( not ( = ?auto_731270 ?auto_731276 ) ) ( not ( = ?auto_731270 ?auto_731277 ) ) ( not ( = ?auto_731270 ?auto_731278 ) ) ( not ( = ?auto_731270 ?auto_731279 ) ) ( not ( = ?auto_731270 ?auto_731280 ) ) ( not ( = ?auto_731270 ?auto_731281 ) ) ( not ( = ?auto_731270 ?auto_731282 ) ) ( not ( = ?auto_731270 ?auto_731283 ) ) ( not ( = ?auto_731271 ?auto_731272 ) ) ( not ( = ?auto_731271 ?auto_731273 ) ) ( not ( = ?auto_731271 ?auto_731274 ) ) ( not ( = ?auto_731271 ?auto_731275 ) ) ( not ( = ?auto_731271 ?auto_731276 ) ) ( not ( = ?auto_731271 ?auto_731277 ) ) ( not ( = ?auto_731271 ?auto_731278 ) ) ( not ( = ?auto_731271 ?auto_731279 ) ) ( not ( = ?auto_731271 ?auto_731280 ) ) ( not ( = ?auto_731271 ?auto_731281 ) ) ( not ( = ?auto_731271 ?auto_731282 ) ) ( not ( = ?auto_731271 ?auto_731283 ) ) ( not ( = ?auto_731272 ?auto_731273 ) ) ( not ( = ?auto_731272 ?auto_731274 ) ) ( not ( = ?auto_731272 ?auto_731275 ) ) ( not ( = ?auto_731272 ?auto_731276 ) ) ( not ( = ?auto_731272 ?auto_731277 ) ) ( not ( = ?auto_731272 ?auto_731278 ) ) ( not ( = ?auto_731272 ?auto_731279 ) ) ( not ( = ?auto_731272 ?auto_731280 ) ) ( not ( = ?auto_731272 ?auto_731281 ) ) ( not ( = ?auto_731272 ?auto_731282 ) ) ( not ( = ?auto_731272 ?auto_731283 ) ) ( not ( = ?auto_731273 ?auto_731274 ) ) ( not ( = ?auto_731273 ?auto_731275 ) ) ( not ( = ?auto_731273 ?auto_731276 ) ) ( not ( = ?auto_731273 ?auto_731277 ) ) ( not ( = ?auto_731273 ?auto_731278 ) ) ( not ( = ?auto_731273 ?auto_731279 ) ) ( not ( = ?auto_731273 ?auto_731280 ) ) ( not ( = ?auto_731273 ?auto_731281 ) ) ( not ( = ?auto_731273 ?auto_731282 ) ) ( not ( = ?auto_731273 ?auto_731283 ) ) ( not ( = ?auto_731274 ?auto_731275 ) ) ( not ( = ?auto_731274 ?auto_731276 ) ) ( not ( = ?auto_731274 ?auto_731277 ) ) ( not ( = ?auto_731274 ?auto_731278 ) ) ( not ( = ?auto_731274 ?auto_731279 ) ) ( not ( = ?auto_731274 ?auto_731280 ) ) ( not ( = ?auto_731274 ?auto_731281 ) ) ( not ( = ?auto_731274 ?auto_731282 ) ) ( not ( = ?auto_731274 ?auto_731283 ) ) ( not ( = ?auto_731275 ?auto_731276 ) ) ( not ( = ?auto_731275 ?auto_731277 ) ) ( not ( = ?auto_731275 ?auto_731278 ) ) ( not ( = ?auto_731275 ?auto_731279 ) ) ( not ( = ?auto_731275 ?auto_731280 ) ) ( not ( = ?auto_731275 ?auto_731281 ) ) ( not ( = ?auto_731275 ?auto_731282 ) ) ( not ( = ?auto_731275 ?auto_731283 ) ) ( not ( = ?auto_731276 ?auto_731277 ) ) ( not ( = ?auto_731276 ?auto_731278 ) ) ( not ( = ?auto_731276 ?auto_731279 ) ) ( not ( = ?auto_731276 ?auto_731280 ) ) ( not ( = ?auto_731276 ?auto_731281 ) ) ( not ( = ?auto_731276 ?auto_731282 ) ) ( not ( = ?auto_731276 ?auto_731283 ) ) ( not ( = ?auto_731277 ?auto_731278 ) ) ( not ( = ?auto_731277 ?auto_731279 ) ) ( not ( = ?auto_731277 ?auto_731280 ) ) ( not ( = ?auto_731277 ?auto_731281 ) ) ( not ( = ?auto_731277 ?auto_731282 ) ) ( not ( = ?auto_731277 ?auto_731283 ) ) ( not ( = ?auto_731278 ?auto_731279 ) ) ( not ( = ?auto_731278 ?auto_731280 ) ) ( not ( = ?auto_731278 ?auto_731281 ) ) ( not ( = ?auto_731278 ?auto_731282 ) ) ( not ( = ?auto_731278 ?auto_731283 ) ) ( not ( = ?auto_731279 ?auto_731280 ) ) ( not ( = ?auto_731279 ?auto_731281 ) ) ( not ( = ?auto_731279 ?auto_731282 ) ) ( not ( = ?auto_731279 ?auto_731283 ) ) ( not ( = ?auto_731280 ?auto_731281 ) ) ( not ( = ?auto_731280 ?auto_731282 ) ) ( not ( = ?auto_731280 ?auto_731283 ) ) ( not ( = ?auto_731281 ?auto_731282 ) ) ( not ( = ?auto_731281 ?auto_731283 ) ) ( not ( = ?auto_731282 ?auto_731283 ) ) ( ON ?auto_731282 ?auto_731283 ) ( ON ?auto_731281 ?auto_731282 ) ( CLEAR ?auto_731279 ) ( ON ?auto_731280 ?auto_731281 ) ( CLEAR ?auto_731280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_731267 ?auto_731268 ?auto_731269 ?auto_731270 ?auto_731271 ?auto_731272 ?auto_731273 ?auto_731274 ?auto_731275 ?auto_731276 ?auto_731277 ?auto_731278 ?auto_731279 ?auto_731280 )
      ( MAKE-17PILE ?auto_731267 ?auto_731268 ?auto_731269 ?auto_731270 ?auto_731271 ?auto_731272 ?auto_731273 ?auto_731274 ?auto_731275 ?auto_731276 ?auto_731277 ?auto_731278 ?auto_731279 ?auto_731280 ?auto_731281 ?auto_731282 ?auto_731283 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731301 - BLOCK
      ?auto_731302 - BLOCK
      ?auto_731303 - BLOCK
      ?auto_731304 - BLOCK
      ?auto_731305 - BLOCK
      ?auto_731306 - BLOCK
      ?auto_731307 - BLOCK
      ?auto_731308 - BLOCK
      ?auto_731309 - BLOCK
      ?auto_731310 - BLOCK
      ?auto_731311 - BLOCK
      ?auto_731312 - BLOCK
      ?auto_731313 - BLOCK
      ?auto_731314 - BLOCK
      ?auto_731315 - BLOCK
      ?auto_731316 - BLOCK
      ?auto_731317 - BLOCK
    )
    :vars
    (
      ?auto_731318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731317 ?auto_731318 ) ( ON-TABLE ?auto_731301 ) ( ON ?auto_731302 ?auto_731301 ) ( ON ?auto_731303 ?auto_731302 ) ( ON ?auto_731304 ?auto_731303 ) ( ON ?auto_731305 ?auto_731304 ) ( ON ?auto_731306 ?auto_731305 ) ( ON ?auto_731307 ?auto_731306 ) ( ON ?auto_731308 ?auto_731307 ) ( ON ?auto_731309 ?auto_731308 ) ( ON ?auto_731310 ?auto_731309 ) ( ON ?auto_731311 ?auto_731310 ) ( ON ?auto_731312 ?auto_731311 ) ( not ( = ?auto_731301 ?auto_731302 ) ) ( not ( = ?auto_731301 ?auto_731303 ) ) ( not ( = ?auto_731301 ?auto_731304 ) ) ( not ( = ?auto_731301 ?auto_731305 ) ) ( not ( = ?auto_731301 ?auto_731306 ) ) ( not ( = ?auto_731301 ?auto_731307 ) ) ( not ( = ?auto_731301 ?auto_731308 ) ) ( not ( = ?auto_731301 ?auto_731309 ) ) ( not ( = ?auto_731301 ?auto_731310 ) ) ( not ( = ?auto_731301 ?auto_731311 ) ) ( not ( = ?auto_731301 ?auto_731312 ) ) ( not ( = ?auto_731301 ?auto_731313 ) ) ( not ( = ?auto_731301 ?auto_731314 ) ) ( not ( = ?auto_731301 ?auto_731315 ) ) ( not ( = ?auto_731301 ?auto_731316 ) ) ( not ( = ?auto_731301 ?auto_731317 ) ) ( not ( = ?auto_731301 ?auto_731318 ) ) ( not ( = ?auto_731302 ?auto_731303 ) ) ( not ( = ?auto_731302 ?auto_731304 ) ) ( not ( = ?auto_731302 ?auto_731305 ) ) ( not ( = ?auto_731302 ?auto_731306 ) ) ( not ( = ?auto_731302 ?auto_731307 ) ) ( not ( = ?auto_731302 ?auto_731308 ) ) ( not ( = ?auto_731302 ?auto_731309 ) ) ( not ( = ?auto_731302 ?auto_731310 ) ) ( not ( = ?auto_731302 ?auto_731311 ) ) ( not ( = ?auto_731302 ?auto_731312 ) ) ( not ( = ?auto_731302 ?auto_731313 ) ) ( not ( = ?auto_731302 ?auto_731314 ) ) ( not ( = ?auto_731302 ?auto_731315 ) ) ( not ( = ?auto_731302 ?auto_731316 ) ) ( not ( = ?auto_731302 ?auto_731317 ) ) ( not ( = ?auto_731302 ?auto_731318 ) ) ( not ( = ?auto_731303 ?auto_731304 ) ) ( not ( = ?auto_731303 ?auto_731305 ) ) ( not ( = ?auto_731303 ?auto_731306 ) ) ( not ( = ?auto_731303 ?auto_731307 ) ) ( not ( = ?auto_731303 ?auto_731308 ) ) ( not ( = ?auto_731303 ?auto_731309 ) ) ( not ( = ?auto_731303 ?auto_731310 ) ) ( not ( = ?auto_731303 ?auto_731311 ) ) ( not ( = ?auto_731303 ?auto_731312 ) ) ( not ( = ?auto_731303 ?auto_731313 ) ) ( not ( = ?auto_731303 ?auto_731314 ) ) ( not ( = ?auto_731303 ?auto_731315 ) ) ( not ( = ?auto_731303 ?auto_731316 ) ) ( not ( = ?auto_731303 ?auto_731317 ) ) ( not ( = ?auto_731303 ?auto_731318 ) ) ( not ( = ?auto_731304 ?auto_731305 ) ) ( not ( = ?auto_731304 ?auto_731306 ) ) ( not ( = ?auto_731304 ?auto_731307 ) ) ( not ( = ?auto_731304 ?auto_731308 ) ) ( not ( = ?auto_731304 ?auto_731309 ) ) ( not ( = ?auto_731304 ?auto_731310 ) ) ( not ( = ?auto_731304 ?auto_731311 ) ) ( not ( = ?auto_731304 ?auto_731312 ) ) ( not ( = ?auto_731304 ?auto_731313 ) ) ( not ( = ?auto_731304 ?auto_731314 ) ) ( not ( = ?auto_731304 ?auto_731315 ) ) ( not ( = ?auto_731304 ?auto_731316 ) ) ( not ( = ?auto_731304 ?auto_731317 ) ) ( not ( = ?auto_731304 ?auto_731318 ) ) ( not ( = ?auto_731305 ?auto_731306 ) ) ( not ( = ?auto_731305 ?auto_731307 ) ) ( not ( = ?auto_731305 ?auto_731308 ) ) ( not ( = ?auto_731305 ?auto_731309 ) ) ( not ( = ?auto_731305 ?auto_731310 ) ) ( not ( = ?auto_731305 ?auto_731311 ) ) ( not ( = ?auto_731305 ?auto_731312 ) ) ( not ( = ?auto_731305 ?auto_731313 ) ) ( not ( = ?auto_731305 ?auto_731314 ) ) ( not ( = ?auto_731305 ?auto_731315 ) ) ( not ( = ?auto_731305 ?auto_731316 ) ) ( not ( = ?auto_731305 ?auto_731317 ) ) ( not ( = ?auto_731305 ?auto_731318 ) ) ( not ( = ?auto_731306 ?auto_731307 ) ) ( not ( = ?auto_731306 ?auto_731308 ) ) ( not ( = ?auto_731306 ?auto_731309 ) ) ( not ( = ?auto_731306 ?auto_731310 ) ) ( not ( = ?auto_731306 ?auto_731311 ) ) ( not ( = ?auto_731306 ?auto_731312 ) ) ( not ( = ?auto_731306 ?auto_731313 ) ) ( not ( = ?auto_731306 ?auto_731314 ) ) ( not ( = ?auto_731306 ?auto_731315 ) ) ( not ( = ?auto_731306 ?auto_731316 ) ) ( not ( = ?auto_731306 ?auto_731317 ) ) ( not ( = ?auto_731306 ?auto_731318 ) ) ( not ( = ?auto_731307 ?auto_731308 ) ) ( not ( = ?auto_731307 ?auto_731309 ) ) ( not ( = ?auto_731307 ?auto_731310 ) ) ( not ( = ?auto_731307 ?auto_731311 ) ) ( not ( = ?auto_731307 ?auto_731312 ) ) ( not ( = ?auto_731307 ?auto_731313 ) ) ( not ( = ?auto_731307 ?auto_731314 ) ) ( not ( = ?auto_731307 ?auto_731315 ) ) ( not ( = ?auto_731307 ?auto_731316 ) ) ( not ( = ?auto_731307 ?auto_731317 ) ) ( not ( = ?auto_731307 ?auto_731318 ) ) ( not ( = ?auto_731308 ?auto_731309 ) ) ( not ( = ?auto_731308 ?auto_731310 ) ) ( not ( = ?auto_731308 ?auto_731311 ) ) ( not ( = ?auto_731308 ?auto_731312 ) ) ( not ( = ?auto_731308 ?auto_731313 ) ) ( not ( = ?auto_731308 ?auto_731314 ) ) ( not ( = ?auto_731308 ?auto_731315 ) ) ( not ( = ?auto_731308 ?auto_731316 ) ) ( not ( = ?auto_731308 ?auto_731317 ) ) ( not ( = ?auto_731308 ?auto_731318 ) ) ( not ( = ?auto_731309 ?auto_731310 ) ) ( not ( = ?auto_731309 ?auto_731311 ) ) ( not ( = ?auto_731309 ?auto_731312 ) ) ( not ( = ?auto_731309 ?auto_731313 ) ) ( not ( = ?auto_731309 ?auto_731314 ) ) ( not ( = ?auto_731309 ?auto_731315 ) ) ( not ( = ?auto_731309 ?auto_731316 ) ) ( not ( = ?auto_731309 ?auto_731317 ) ) ( not ( = ?auto_731309 ?auto_731318 ) ) ( not ( = ?auto_731310 ?auto_731311 ) ) ( not ( = ?auto_731310 ?auto_731312 ) ) ( not ( = ?auto_731310 ?auto_731313 ) ) ( not ( = ?auto_731310 ?auto_731314 ) ) ( not ( = ?auto_731310 ?auto_731315 ) ) ( not ( = ?auto_731310 ?auto_731316 ) ) ( not ( = ?auto_731310 ?auto_731317 ) ) ( not ( = ?auto_731310 ?auto_731318 ) ) ( not ( = ?auto_731311 ?auto_731312 ) ) ( not ( = ?auto_731311 ?auto_731313 ) ) ( not ( = ?auto_731311 ?auto_731314 ) ) ( not ( = ?auto_731311 ?auto_731315 ) ) ( not ( = ?auto_731311 ?auto_731316 ) ) ( not ( = ?auto_731311 ?auto_731317 ) ) ( not ( = ?auto_731311 ?auto_731318 ) ) ( not ( = ?auto_731312 ?auto_731313 ) ) ( not ( = ?auto_731312 ?auto_731314 ) ) ( not ( = ?auto_731312 ?auto_731315 ) ) ( not ( = ?auto_731312 ?auto_731316 ) ) ( not ( = ?auto_731312 ?auto_731317 ) ) ( not ( = ?auto_731312 ?auto_731318 ) ) ( not ( = ?auto_731313 ?auto_731314 ) ) ( not ( = ?auto_731313 ?auto_731315 ) ) ( not ( = ?auto_731313 ?auto_731316 ) ) ( not ( = ?auto_731313 ?auto_731317 ) ) ( not ( = ?auto_731313 ?auto_731318 ) ) ( not ( = ?auto_731314 ?auto_731315 ) ) ( not ( = ?auto_731314 ?auto_731316 ) ) ( not ( = ?auto_731314 ?auto_731317 ) ) ( not ( = ?auto_731314 ?auto_731318 ) ) ( not ( = ?auto_731315 ?auto_731316 ) ) ( not ( = ?auto_731315 ?auto_731317 ) ) ( not ( = ?auto_731315 ?auto_731318 ) ) ( not ( = ?auto_731316 ?auto_731317 ) ) ( not ( = ?auto_731316 ?auto_731318 ) ) ( not ( = ?auto_731317 ?auto_731318 ) ) ( ON ?auto_731316 ?auto_731317 ) ( ON ?auto_731315 ?auto_731316 ) ( ON ?auto_731314 ?auto_731315 ) ( CLEAR ?auto_731312 ) ( ON ?auto_731313 ?auto_731314 ) ( CLEAR ?auto_731313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_731301 ?auto_731302 ?auto_731303 ?auto_731304 ?auto_731305 ?auto_731306 ?auto_731307 ?auto_731308 ?auto_731309 ?auto_731310 ?auto_731311 ?auto_731312 ?auto_731313 )
      ( MAKE-17PILE ?auto_731301 ?auto_731302 ?auto_731303 ?auto_731304 ?auto_731305 ?auto_731306 ?auto_731307 ?auto_731308 ?auto_731309 ?auto_731310 ?auto_731311 ?auto_731312 ?auto_731313 ?auto_731314 ?auto_731315 ?auto_731316 ?auto_731317 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731336 - BLOCK
      ?auto_731337 - BLOCK
      ?auto_731338 - BLOCK
      ?auto_731339 - BLOCK
      ?auto_731340 - BLOCK
      ?auto_731341 - BLOCK
      ?auto_731342 - BLOCK
      ?auto_731343 - BLOCK
      ?auto_731344 - BLOCK
      ?auto_731345 - BLOCK
      ?auto_731346 - BLOCK
      ?auto_731347 - BLOCK
      ?auto_731348 - BLOCK
      ?auto_731349 - BLOCK
      ?auto_731350 - BLOCK
      ?auto_731351 - BLOCK
      ?auto_731352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731352 ) ( ON-TABLE ?auto_731336 ) ( ON ?auto_731337 ?auto_731336 ) ( ON ?auto_731338 ?auto_731337 ) ( ON ?auto_731339 ?auto_731338 ) ( ON ?auto_731340 ?auto_731339 ) ( ON ?auto_731341 ?auto_731340 ) ( ON ?auto_731342 ?auto_731341 ) ( ON ?auto_731343 ?auto_731342 ) ( ON ?auto_731344 ?auto_731343 ) ( ON ?auto_731345 ?auto_731344 ) ( ON ?auto_731346 ?auto_731345 ) ( ON ?auto_731347 ?auto_731346 ) ( not ( = ?auto_731336 ?auto_731337 ) ) ( not ( = ?auto_731336 ?auto_731338 ) ) ( not ( = ?auto_731336 ?auto_731339 ) ) ( not ( = ?auto_731336 ?auto_731340 ) ) ( not ( = ?auto_731336 ?auto_731341 ) ) ( not ( = ?auto_731336 ?auto_731342 ) ) ( not ( = ?auto_731336 ?auto_731343 ) ) ( not ( = ?auto_731336 ?auto_731344 ) ) ( not ( = ?auto_731336 ?auto_731345 ) ) ( not ( = ?auto_731336 ?auto_731346 ) ) ( not ( = ?auto_731336 ?auto_731347 ) ) ( not ( = ?auto_731336 ?auto_731348 ) ) ( not ( = ?auto_731336 ?auto_731349 ) ) ( not ( = ?auto_731336 ?auto_731350 ) ) ( not ( = ?auto_731336 ?auto_731351 ) ) ( not ( = ?auto_731336 ?auto_731352 ) ) ( not ( = ?auto_731337 ?auto_731338 ) ) ( not ( = ?auto_731337 ?auto_731339 ) ) ( not ( = ?auto_731337 ?auto_731340 ) ) ( not ( = ?auto_731337 ?auto_731341 ) ) ( not ( = ?auto_731337 ?auto_731342 ) ) ( not ( = ?auto_731337 ?auto_731343 ) ) ( not ( = ?auto_731337 ?auto_731344 ) ) ( not ( = ?auto_731337 ?auto_731345 ) ) ( not ( = ?auto_731337 ?auto_731346 ) ) ( not ( = ?auto_731337 ?auto_731347 ) ) ( not ( = ?auto_731337 ?auto_731348 ) ) ( not ( = ?auto_731337 ?auto_731349 ) ) ( not ( = ?auto_731337 ?auto_731350 ) ) ( not ( = ?auto_731337 ?auto_731351 ) ) ( not ( = ?auto_731337 ?auto_731352 ) ) ( not ( = ?auto_731338 ?auto_731339 ) ) ( not ( = ?auto_731338 ?auto_731340 ) ) ( not ( = ?auto_731338 ?auto_731341 ) ) ( not ( = ?auto_731338 ?auto_731342 ) ) ( not ( = ?auto_731338 ?auto_731343 ) ) ( not ( = ?auto_731338 ?auto_731344 ) ) ( not ( = ?auto_731338 ?auto_731345 ) ) ( not ( = ?auto_731338 ?auto_731346 ) ) ( not ( = ?auto_731338 ?auto_731347 ) ) ( not ( = ?auto_731338 ?auto_731348 ) ) ( not ( = ?auto_731338 ?auto_731349 ) ) ( not ( = ?auto_731338 ?auto_731350 ) ) ( not ( = ?auto_731338 ?auto_731351 ) ) ( not ( = ?auto_731338 ?auto_731352 ) ) ( not ( = ?auto_731339 ?auto_731340 ) ) ( not ( = ?auto_731339 ?auto_731341 ) ) ( not ( = ?auto_731339 ?auto_731342 ) ) ( not ( = ?auto_731339 ?auto_731343 ) ) ( not ( = ?auto_731339 ?auto_731344 ) ) ( not ( = ?auto_731339 ?auto_731345 ) ) ( not ( = ?auto_731339 ?auto_731346 ) ) ( not ( = ?auto_731339 ?auto_731347 ) ) ( not ( = ?auto_731339 ?auto_731348 ) ) ( not ( = ?auto_731339 ?auto_731349 ) ) ( not ( = ?auto_731339 ?auto_731350 ) ) ( not ( = ?auto_731339 ?auto_731351 ) ) ( not ( = ?auto_731339 ?auto_731352 ) ) ( not ( = ?auto_731340 ?auto_731341 ) ) ( not ( = ?auto_731340 ?auto_731342 ) ) ( not ( = ?auto_731340 ?auto_731343 ) ) ( not ( = ?auto_731340 ?auto_731344 ) ) ( not ( = ?auto_731340 ?auto_731345 ) ) ( not ( = ?auto_731340 ?auto_731346 ) ) ( not ( = ?auto_731340 ?auto_731347 ) ) ( not ( = ?auto_731340 ?auto_731348 ) ) ( not ( = ?auto_731340 ?auto_731349 ) ) ( not ( = ?auto_731340 ?auto_731350 ) ) ( not ( = ?auto_731340 ?auto_731351 ) ) ( not ( = ?auto_731340 ?auto_731352 ) ) ( not ( = ?auto_731341 ?auto_731342 ) ) ( not ( = ?auto_731341 ?auto_731343 ) ) ( not ( = ?auto_731341 ?auto_731344 ) ) ( not ( = ?auto_731341 ?auto_731345 ) ) ( not ( = ?auto_731341 ?auto_731346 ) ) ( not ( = ?auto_731341 ?auto_731347 ) ) ( not ( = ?auto_731341 ?auto_731348 ) ) ( not ( = ?auto_731341 ?auto_731349 ) ) ( not ( = ?auto_731341 ?auto_731350 ) ) ( not ( = ?auto_731341 ?auto_731351 ) ) ( not ( = ?auto_731341 ?auto_731352 ) ) ( not ( = ?auto_731342 ?auto_731343 ) ) ( not ( = ?auto_731342 ?auto_731344 ) ) ( not ( = ?auto_731342 ?auto_731345 ) ) ( not ( = ?auto_731342 ?auto_731346 ) ) ( not ( = ?auto_731342 ?auto_731347 ) ) ( not ( = ?auto_731342 ?auto_731348 ) ) ( not ( = ?auto_731342 ?auto_731349 ) ) ( not ( = ?auto_731342 ?auto_731350 ) ) ( not ( = ?auto_731342 ?auto_731351 ) ) ( not ( = ?auto_731342 ?auto_731352 ) ) ( not ( = ?auto_731343 ?auto_731344 ) ) ( not ( = ?auto_731343 ?auto_731345 ) ) ( not ( = ?auto_731343 ?auto_731346 ) ) ( not ( = ?auto_731343 ?auto_731347 ) ) ( not ( = ?auto_731343 ?auto_731348 ) ) ( not ( = ?auto_731343 ?auto_731349 ) ) ( not ( = ?auto_731343 ?auto_731350 ) ) ( not ( = ?auto_731343 ?auto_731351 ) ) ( not ( = ?auto_731343 ?auto_731352 ) ) ( not ( = ?auto_731344 ?auto_731345 ) ) ( not ( = ?auto_731344 ?auto_731346 ) ) ( not ( = ?auto_731344 ?auto_731347 ) ) ( not ( = ?auto_731344 ?auto_731348 ) ) ( not ( = ?auto_731344 ?auto_731349 ) ) ( not ( = ?auto_731344 ?auto_731350 ) ) ( not ( = ?auto_731344 ?auto_731351 ) ) ( not ( = ?auto_731344 ?auto_731352 ) ) ( not ( = ?auto_731345 ?auto_731346 ) ) ( not ( = ?auto_731345 ?auto_731347 ) ) ( not ( = ?auto_731345 ?auto_731348 ) ) ( not ( = ?auto_731345 ?auto_731349 ) ) ( not ( = ?auto_731345 ?auto_731350 ) ) ( not ( = ?auto_731345 ?auto_731351 ) ) ( not ( = ?auto_731345 ?auto_731352 ) ) ( not ( = ?auto_731346 ?auto_731347 ) ) ( not ( = ?auto_731346 ?auto_731348 ) ) ( not ( = ?auto_731346 ?auto_731349 ) ) ( not ( = ?auto_731346 ?auto_731350 ) ) ( not ( = ?auto_731346 ?auto_731351 ) ) ( not ( = ?auto_731346 ?auto_731352 ) ) ( not ( = ?auto_731347 ?auto_731348 ) ) ( not ( = ?auto_731347 ?auto_731349 ) ) ( not ( = ?auto_731347 ?auto_731350 ) ) ( not ( = ?auto_731347 ?auto_731351 ) ) ( not ( = ?auto_731347 ?auto_731352 ) ) ( not ( = ?auto_731348 ?auto_731349 ) ) ( not ( = ?auto_731348 ?auto_731350 ) ) ( not ( = ?auto_731348 ?auto_731351 ) ) ( not ( = ?auto_731348 ?auto_731352 ) ) ( not ( = ?auto_731349 ?auto_731350 ) ) ( not ( = ?auto_731349 ?auto_731351 ) ) ( not ( = ?auto_731349 ?auto_731352 ) ) ( not ( = ?auto_731350 ?auto_731351 ) ) ( not ( = ?auto_731350 ?auto_731352 ) ) ( not ( = ?auto_731351 ?auto_731352 ) ) ( ON ?auto_731351 ?auto_731352 ) ( ON ?auto_731350 ?auto_731351 ) ( ON ?auto_731349 ?auto_731350 ) ( CLEAR ?auto_731347 ) ( ON ?auto_731348 ?auto_731349 ) ( CLEAR ?auto_731348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_731336 ?auto_731337 ?auto_731338 ?auto_731339 ?auto_731340 ?auto_731341 ?auto_731342 ?auto_731343 ?auto_731344 ?auto_731345 ?auto_731346 ?auto_731347 ?auto_731348 )
      ( MAKE-17PILE ?auto_731336 ?auto_731337 ?auto_731338 ?auto_731339 ?auto_731340 ?auto_731341 ?auto_731342 ?auto_731343 ?auto_731344 ?auto_731345 ?auto_731346 ?auto_731347 ?auto_731348 ?auto_731349 ?auto_731350 ?auto_731351 ?auto_731352 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731370 - BLOCK
      ?auto_731371 - BLOCK
      ?auto_731372 - BLOCK
      ?auto_731373 - BLOCK
      ?auto_731374 - BLOCK
      ?auto_731375 - BLOCK
      ?auto_731376 - BLOCK
      ?auto_731377 - BLOCK
      ?auto_731378 - BLOCK
      ?auto_731379 - BLOCK
      ?auto_731380 - BLOCK
      ?auto_731381 - BLOCK
      ?auto_731382 - BLOCK
      ?auto_731383 - BLOCK
      ?auto_731384 - BLOCK
      ?auto_731385 - BLOCK
      ?auto_731386 - BLOCK
    )
    :vars
    (
      ?auto_731387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731386 ?auto_731387 ) ( ON-TABLE ?auto_731370 ) ( ON ?auto_731371 ?auto_731370 ) ( ON ?auto_731372 ?auto_731371 ) ( ON ?auto_731373 ?auto_731372 ) ( ON ?auto_731374 ?auto_731373 ) ( ON ?auto_731375 ?auto_731374 ) ( ON ?auto_731376 ?auto_731375 ) ( ON ?auto_731377 ?auto_731376 ) ( ON ?auto_731378 ?auto_731377 ) ( ON ?auto_731379 ?auto_731378 ) ( ON ?auto_731380 ?auto_731379 ) ( not ( = ?auto_731370 ?auto_731371 ) ) ( not ( = ?auto_731370 ?auto_731372 ) ) ( not ( = ?auto_731370 ?auto_731373 ) ) ( not ( = ?auto_731370 ?auto_731374 ) ) ( not ( = ?auto_731370 ?auto_731375 ) ) ( not ( = ?auto_731370 ?auto_731376 ) ) ( not ( = ?auto_731370 ?auto_731377 ) ) ( not ( = ?auto_731370 ?auto_731378 ) ) ( not ( = ?auto_731370 ?auto_731379 ) ) ( not ( = ?auto_731370 ?auto_731380 ) ) ( not ( = ?auto_731370 ?auto_731381 ) ) ( not ( = ?auto_731370 ?auto_731382 ) ) ( not ( = ?auto_731370 ?auto_731383 ) ) ( not ( = ?auto_731370 ?auto_731384 ) ) ( not ( = ?auto_731370 ?auto_731385 ) ) ( not ( = ?auto_731370 ?auto_731386 ) ) ( not ( = ?auto_731370 ?auto_731387 ) ) ( not ( = ?auto_731371 ?auto_731372 ) ) ( not ( = ?auto_731371 ?auto_731373 ) ) ( not ( = ?auto_731371 ?auto_731374 ) ) ( not ( = ?auto_731371 ?auto_731375 ) ) ( not ( = ?auto_731371 ?auto_731376 ) ) ( not ( = ?auto_731371 ?auto_731377 ) ) ( not ( = ?auto_731371 ?auto_731378 ) ) ( not ( = ?auto_731371 ?auto_731379 ) ) ( not ( = ?auto_731371 ?auto_731380 ) ) ( not ( = ?auto_731371 ?auto_731381 ) ) ( not ( = ?auto_731371 ?auto_731382 ) ) ( not ( = ?auto_731371 ?auto_731383 ) ) ( not ( = ?auto_731371 ?auto_731384 ) ) ( not ( = ?auto_731371 ?auto_731385 ) ) ( not ( = ?auto_731371 ?auto_731386 ) ) ( not ( = ?auto_731371 ?auto_731387 ) ) ( not ( = ?auto_731372 ?auto_731373 ) ) ( not ( = ?auto_731372 ?auto_731374 ) ) ( not ( = ?auto_731372 ?auto_731375 ) ) ( not ( = ?auto_731372 ?auto_731376 ) ) ( not ( = ?auto_731372 ?auto_731377 ) ) ( not ( = ?auto_731372 ?auto_731378 ) ) ( not ( = ?auto_731372 ?auto_731379 ) ) ( not ( = ?auto_731372 ?auto_731380 ) ) ( not ( = ?auto_731372 ?auto_731381 ) ) ( not ( = ?auto_731372 ?auto_731382 ) ) ( not ( = ?auto_731372 ?auto_731383 ) ) ( not ( = ?auto_731372 ?auto_731384 ) ) ( not ( = ?auto_731372 ?auto_731385 ) ) ( not ( = ?auto_731372 ?auto_731386 ) ) ( not ( = ?auto_731372 ?auto_731387 ) ) ( not ( = ?auto_731373 ?auto_731374 ) ) ( not ( = ?auto_731373 ?auto_731375 ) ) ( not ( = ?auto_731373 ?auto_731376 ) ) ( not ( = ?auto_731373 ?auto_731377 ) ) ( not ( = ?auto_731373 ?auto_731378 ) ) ( not ( = ?auto_731373 ?auto_731379 ) ) ( not ( = ?auto_731373 ?auto_731380 ) ) ( not ( = ?auto_731373 ?auto_731381 ) ) ( not ( = ?auto_731373 ?auto_731382 ) ) ( not ( = ?auto_731373 ?auto_731383 ) ) ( not ( = ?auto_731373 ?auto_731384 ) ) ( not ( = ?auto_731373 ?auto_731385 ) ) ( not ( = ?auto_731373 ?auto_731386 ) ) ( not ( = ?auto_731373 ?auto_731387 ) ) ( not ( = ?auto_731374 ?auto_731375 ) ) ( not ( = ?auto_731374 ?auto_731376 ) ) ( not ( = ?auto_731374 ?auto_731377 ) ) ( not ( = ?auto_731374 ?auto_731378 ) ) ( not ( = ?auto_731374 ?auto_731379 ) ) ( not ( = ?auto_731374 ?auto_731380 ) ) ( not ( = ?auto_731374 ?auto_731381 ) ) ( not ( = ?auto_731374 ?auto_731382 ) ) ( not ( = ?auto_731374 ?auto_731383 ) ) ( not ( = ?auto_731374 ?auto_731384 ) ) ( not ( = ?auto_731374 ?auto_731385 ) ) ( not ( = ?auto_731374 ?auto_731386 ) ) ( not ( = ?auto_731374 ?auto_731387 ) ) ( not ( = ?auto_731375 ?auto_731376 ) ) ( not ( = ?auto_731375 ?auto_731377 ) ) ( not ( = ?auto_731375 ?auto_731378 ) ) ( not ( = ?auto_731375 ?auto_731379 ) ) ( not ( = ?auto_731375 ?auto_731380 ) ) ( not ( = ?auto_731375 ?auto_731381 ) ) ( not ( = ?auto_731375 ?auto_731382 ) ) ( not ( = ?auto_731375 ?auto_731383 ) ) ( not ( = ?auto_731375 ?auto_731384 ) ) ( not ( = ?auto_731375 ?auto_731385 ) ) ( not ( = ?auto_731375 ?auto_731386 ) ) ( not ( = ?auto_731375 ?auto_731387 ) ) ( not ( = ?auto_731376 ?auto_731377 ) ) ( not ( = ?auto_731376 ?auto_731378 ) ) ( not ( = ?auto_731376 ?auto_731379 ) ) ( not ( = ?auto_731376 ?auto_731380 ) ) ( not ( = ?auto_731376 ?auto_731381 ) ) ( not ( = ?auto_731376 ?auto_731382 ) ) ( not ( = ?auto_731376 ?auto_731383 ) ) ( not ( = ?auto_731376 ?auto_731384 ) ) ( not ( = ?auto_731376 ?auto_731385 ) ) ( not ( = ?auto_731376 ?auto_731386 ) ) ( not ( = ?auto_731376 ?auto_731387 ) ) ( not ( = ?auto_731377 ?auto_731378 ) ) ( not ( = ?auto_731377 ?auto_731379 ) ) ( not ( = ?auto_731377 ?auto_731380 ) ) ( not ( = ?auto_731377 ?auto_731381 ) ) ( not ( = ?auto_731377 ?auto_731382 ) ) ( not ( = ?auto_731377 ?auto_731383 ) ) ( not ( = ?auto_731377 ?auto_731384 ) ) ( not ( = ?auto_731377 ?auto_731385 ) ) ( not ( = ?auto_731377 ?auto_731386 ) ) ( not ( = ?auto_731377 ?auto_731387 ) ) ( not ( = ?auto_731378 ?auto_731379 ) ) ( not ( = ?auto_731378 ?auto_731380 ) ) ( not ( = ?auto_731378 ?auto_731381 ) ) ( not ( = ?auto_731378 ?auto_731382 ) ) ( not ( = ?auto_731378 ?auto_731383 ) ) ( not ( = ?auto_731378 ?auto_731384 ) ) ( not ( = ?auto_731378 ?auto_731385 ) ) ( not ( = ?auto_731378 ?auto_731386 ) ) ( not ( = ?auto_731378 ?auto_731387 ) ) ( not ( = ?auto_731379 ?auto_731380 ) ) ( not ( = ?auto_731379 ?auto_731381 ) ) ( not ( = ?auto_731379 ?auto_731382 ) ) ( not ( = ?auto_731379 ?auto_731383 ) ) ( not ( = ?auto_731379 ?auto_731384 ) ) ( not ( = ?auto_731379 ?auto_731385 ) ) ( not ( = ?auto_731379 ?auto_731386 ) ) ( not ( = ?auto_731379 ?auto_731387 ) ) ( not ( = ?auto_731380 ?auto_731381 ) ) ( not ( = ?auto_731380 ?auto_731382 ) ) ( not ( = ?auto_731380 ?auto_731383 ) ) ( not ( = ?auto_731380 ?auto_731384 ) ) ( not ( = ?auto_731380 ?auto_731385 ) ) ( not ( = ?auto_731380 ?auto_731386 ) ) ( not ( = ?auto_731380 ?auto_731387 ) ) ( not ( = ?auto_731381 ?auto_731382 ) ) ( not ( = ?auto_731381 ?auto_731383 ) ) ( not ( = ?auto_731381 ?auto_731384 ) ) ( not ( = ?auto_731381 ?auto_731385 ) ) ( not ( = ?auto_731381 ?auto_731386 ) ) ( not ( = ?auto_731381 ?auto_731387 ) ) ( not ( = ?auto_731382 ?auto_731383 ) ) ( not ( = ?auto_731382 ?auto_731384 ) ) ( not ( = ?auto_731382 ?auto_731385 ) ) ( not ( = ?auto_731382 ?auto_731386 ) ) ( not ( = ?auto_731382 ?auto_731387 ) ) ( not ( = ?auto_731383 ?auto_731384 ) ) ( not ( = ?auto_731383 ?auto_731385 ) ) ( not ( = ?auto_731383 ?auto_731386 ) ) ( not ( = ?auto_731383 ?auto_731387 ) ) ( not ( = ?auto_731384 ?auto_731385 ) ) ( not ( = ?auto_731384 ?auto_731386 ) ) ( not ( = ?auto_731384 ?auto_731387 ) ) ( not ( = ?auto_731385 ?auto_731386 ) ) ( not ( = ?auto_731385 ?auto_731387 ) ) ( not ( = ?auto_731386 ?auto_731387 ) ) ( ON ?auto_731385 ?auto_731386 ) ( ON ?auto_731384 ?auto_731385 ) ( ON ?auto_731383 ?auto_731384 ) ( ON ?auto_731382 ?auto_731383 ) ( CLEAR ?auto_731380 ) ( ON ?auto_731381 ?auto_731382 ) ( CLEAR ?auto_731381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_731370 ?auto_731371 ?auto_731372 ?auto_731373 ?auto_731374 ?auto_731375 ?auto_731376 ?auto_731377 ?auto_731378 ?auto_731379 ?auto_731380 ?auto_731381 )
      ( MAKE-17PILE ?auto_731370 ?auto_731371 ?auto_731372 ?auto_731373 ?auto_731374 ?auto_731375 ?auto_731376 ?auto_731377 ?auto_731378 ?auto_731379 ?auto_731380 ?auto_731381 ?auto_731382 ?auto_731383 ?auto_731384 ?auto_731385 ?auto_731386 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731405 - BLOCK
      ?auto_731406 - BLOCK
      ?auto_731407 - BLOCK
      ?auto_731408 - BLOCK
      ?auto_731409 - BLOCK
      ?auto_731410 - BLOCK
      ?auto_731411 - BLOCK
      ?auto_731412 - BLOCK
      ?auto_731413 - BLOCK
      ?auto_731414 - BLOCK
      ?auto_731415 - BLOCK
      ?auto_731416 - BLOCK
      ?auto_731417 - BLOCK
      ?auto_731418 - BLOCK
      ?auto_731419 - BLOCK
      ?auto_731420 - BLOCK
      ?auto_731421 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731421 ) ( ON-TABLE ?auto_731405 ) ( ON ?auto_731406 ?auto_731405 ) ( ON ?auto_731407 ?auto_731406 ) ( ON ?auto_731408 ?auto_731407 ) ( ON ?auto_731409 ?auto_731408 ) ( ON ?auto_731410 ?auto_731409 ) ( ON ?auto_731411 ?auto_731410 ) ( ON ?auto_731412 ?auto_731411 ) ( ON ?auto_731413 ?auto_731412 ) ( ON ?auto_731414 ?auto_731413 ) ( ON ?auto_731415 ?auto_731414 ) ( not ( = ?auto_731405 ?auto_731406 ) ) ( not ( = ?auto_731405 ?auto_731407 ) ) ( not ( = ?auto_731405 ?auto_731408 ) ) ( not ( = ?auto_731405 ?auto_731409 ) ) ( not ( = ?auto_731405 ?auto_731410 ) ) ( not ( = ?auto_731405 ?auto_731411 ) ) ( not ( = ?auto_731405 ?auto_731412 ) ) ( not ( = ?auto_731405 ?auto_731413 ) ) ( not ( = ?auto_731405 ?auto_731414 ) ) ( not ( = ?auto_731405 ?auto_731415 ) ) ( not ( = ?auto_731405 ?auto_731416 ) ) ( not ( = ?auto_731405 ?auto_731417 ) ) ( not ( = ?auto_731405 ?auto_731418 ) ) ( not ( = ?auto_731405 ?auto_731419 ) ) ( not ( = ?auto_731405 ?auto_731420 ) ) ( not ( = ?auto_731405 ?auto_731421 ) ) ( not ( = ?auto_731406 ?auto_731407 ) ) ( not ( = ?auto_731406 ?auto_731408 ) ) ( not ( = ?auto_731406 ?auto_731409 ) ) ( not ( = ?auto_731406 ?auto_731410 ) ) ( not ( = ?auto_731406 ?auto_731411 ) ) ( not ( = ?auto_731406 ?auto_731412 ) ) ( not ( = ?auto_731406 ?auto_731413 ) ) ( not ( = ?auto_731406 ?auto_731414 ) ) ( not ( = ?auto_731406 ?auto_731415 ) ) ( not ( = ?auto_731406 ?auto_731416 ) ) ( not ( = ?auto_731406 ?auto_731417 ) ) ( not ( = ?auto_731406 ?auto_731418 ) ) ( not ( = ?auto_731406 ?auto_731419 ) ) ( not ( = ?auto_731406 ?auto_731420 ) ) ( not ( = ?auto_731406 ?auto_731421 ) ) ( not ( = ?auto_731407 ?auto_731408 ) ) ( not ( = ?auto_731407 ?auto_731409 ) ) ( not ( = ?auto_731407 ?auto_731410 ) ) ( not ( = ?auto_731407 ?auto_731411 ) ) ( not ( = ?auto_731407 ?auto_731412 ) ) ( not ( = ?auto_731407 ?auto_731413 ) ) ( not ( = ?auto_731407 ?auto_731414 ) ) ( not ( = ?auto_731407 ?auto_731415 ) ) ( not ( = ?auto_731407 ?auto_731416 ) ) ( not ( = ?auto_731407 ?auto_731417 ) ) ( not ( = ?auto_731407 ?auto_731418 ) ) ( not ( = ?auto_731407 ?auto_731419 ) ) ( not ( = ?auto_731407 ?auto_731420 ) ) ( not ( = ?auto_731407 ?auto_731421 ) ) ( not ( = ?auto_731408 ?auto_731409 ) ) ( not ( = ?auto_731408 ?auto_731410 ) ) ( not ( = ?auto_731408 ?auto_731411 ) ) ( not ( = ?auto_731408 ?auto_731412 ) ) ( not ( = ?auto_731408 ?auto_731413 ) ) ( not ( = ?auto_731408 ?auto_731414 ) ) ( not ( = ?auto_731408 ?auto_731415 ) ) ( not ( = ?auto_731408 ?auto_731416 ) ) ( not ( = ?auto_731408 ?auto_731417 ) ) ( not ( = ?auto_731408 ?auto_731418 ) ) ( not ( = ?auto_731408 ?auto_731419 ) ) ( not ( = ?auto_731408 ?auto_731420 ) ) ( not ( = ?auto_731408 ?auto_731421 ) ) ( not ( = ?auto_731409 ?auto_731410 ) ) ( not ( = ?auto_731409 ?auto_731411 ) ) ( not ( = ?auto_731409 ?auto_731412 ) ) ( not ( = ?auto_731409 ?auto_731413 ) ) ( not ( = ?auto_731409 ?auto_731414 ) ) ( not ( = ?auto_731409 ?auto_731415 ) ) ( not ( = ?auto_731409 ?auto_731416 ) ) ( not ( = ?auto_731409 ?auto_731417 ) ) ( not ( = ?auto_731409 ?auto_731418 ) ) ( not ( = ?auto_731409 ?auto_731419 ) ) ( not ( = ?auto_731409 ?auto_731420 ) ) ( not ( = ?auto_731409 ?auto_731421 ) ) ( not ( = ?auto_731410 ?auto_731411 ) ) ( not ( = ?auto_731410 ?auto_731412 ) ) ( not ( = ?auto_731410 ?auto_731413 ) ) ( not ( = ?auto_731410 ?auto_731414 ) ) ( not ( = ?auto_731410 ?auto_731415 ) ) ( not ( = ?auto_731410 ?auto_731416 ) ) ( not ( = ?auto_731410 ?auto_731417 ) ) ( not ( = ?auto_731410 ?auto_731418 ) ) ( not ( = ?auto_731410 ?auto_731419 ) ) ( not ( = ?auto_731410 ?auto_731420 ) ) ( not ( = ?auto_731410 ?auto_731421 ) ) ( not ( = ?auto_731411 ?auto_731412 ) ) ( not ( = ?auto_731411 ?auto_731413 ) ) ( not ( = ?auto_731411 ?auto_731414 ) ) ( not ( = ?auto_731411 ?auto_731415 ) ) ( not ( = ?auto_731411 ?auto_731416 ) ) ( not ( = ?auto_731411 ?auto_731417 ) ) ( not ( = ?auto_731411 ?auto_731418 ) ) ( not ( = ?auto_731411 ?auto_731419 ) ) ( not ( = ?auto_731411 ?auto_731420 ) ) ( not ( = ?auto_731411 ?auto_731421 ) ) ( not ( = ?auto_731412 ?auto_731413 ) ) ( not ( = ?auto_731412 ?auto_731414 ) ) ( not ( = ?auto_731412 ?auto_731415 ) ) ( not ( = ?auto_731412 ?auto_731416 ) ) ( not ( = ?auto_731412 ?auto_731417 ) ) ( not ( = ?auto_731412 ?auto_731418 ) ) ( not ( = ?auto_731412 ?auto_731419 ) ) ( not ( = ?auto_731412 ?auto_731420 ) ) ( not ( = ?auto_731412 ?auto_731421 ) ) ( not ( = ?auto_731413 ?auto_731414 ) ) ( not ( = ?auto_731413 ?auto_731415 ) ) ( not ( = ?auto_731413 ?auto_731416 ) ) ( not ( = ?auto_731413 ?auto_731417 ) ) ( not ( = ?auto_731413 ?auto_731418 ) ) ( not ( = ?auto_731413 ?auto_731419 ) ) ( not ( = ?auto_731413 ?auto_731420 ) ) ( not ( = ?auto_731413 ?auto_731421 ) ) ( not ( = ?auto_731414 ?auto_731415 ) ) ( not ( = ?auto_731414 ?auto_731416 ) ) ( not ( = ?auto_731414 ?auto_731417 ) ) ( not ( = ?auto_731414 ?auto_731418 ) ) ( not ( = ?auto_731414 ?auto_731419 ) ) ( not ( = ?auto_731414 ?auto_731420 ) ) ( not ( = ?auto_731414 ?auto_731421 ) ) ( not ( = ?auto_731415 ?auto_731416 ) ) ( not ( = ?auto_731415 ?auto_731417 ) ) ( not ( = ?auto_731415 ?auto_731418 ) ) ( not ( = ?auto_731415 ?auto_731419 ) ) ( not ( = ?auto_731415 ?auto_731420 ) ) ( not ( = ?auto_731415 ?auto_731421 ) ) ( not ( = ?auto_731416 ?auto_731417 ) ) ( not ( = ?auto_731416 ?auto_731418 ) ) ( not ( = ?auto_731416 ?auto_731419 ) ) ( not ( = ?auto_731416 ?auto_731420 ) ) ( not ( = ?auto_731416 ?auto_731421 ) ) ( not ( = ?auto_731417 ?auto_731418 ) ) ( not ( = ?auto_731417 ?auto_731419 ) ) ( not ( = ?auto_731417 ?auto_731420 ) ) ( not ( = ?auto_731417 ?auto_731421 ) ) ( not ( = ?auto_731418 ?auto_731419 ) ) ( not ( = ?auto_731418 ?auto_731420 ) ) ( not ( = ?auto_731418 ?auto_731421 ) ) ( not ( = ?auto_731419 ?auto_731420 ) ) ( not ( = ?auto_731419 ?auto_731421 ) ) ( not ( = ?auto_731420 ?auto_731421 ) ) ( ON ?auto_731420 ?auto_731421 ) ( ON ?auto_731419 ?auto_731420 ) ( ON ?auto_731418 ?auto_731419 ) ( ON ?auto_731417 ?auto_731418 ) ( CLEAR ?auto_731415 ) ( ON ?auto_731416 ?auto_731417 ) ( CLEAR ?auto_731416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_731405 ?auto_731406 ?auto_731407 ?auto_731408 ?auto_731409 ?auto_731410 ?auto_731411 ?auto_731412 ?auto_731413 ?auto_731414 ?auto_731415 ?auto_731416 )
      ( MAKE-17PILE ?auto_731405 ?auto_731406 ?auto_731407 ?auto_731408 ?auto_731409 ?auto_731410 ?auto_731411 ?auto_731412 ?auto_731413 ?auto_731414 ?auto_731415 ?auto_731416 ?auto_731417 ?auto_731418 ?auto_731419 ?auto_731420 ?auto_731421 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731439 - BLOCK
      ?auto_731440 - BLOCK
      ?auto_731441 - BLOCK
      ?auto_731442 - BLOCK
      ?auto_731443 - BLOCK
      ?auto_731444 - BLOCK
      ?auto_731445 - BLOCK
      ?auto_731446 - BLOCK
      ?auto_731447 - BLOCK
      ?auto_731448 - BLOCK
      ?auto_731449 - BLOCK
      ?auto_731450 - BLOCK
      ?auto_731451 - BLOCK
      ?auto_731452 - BLOCK
      ?auto_731453 - BLOCK
      ?auto_731454 - BLOCK
      ?auto_731455 - BLOCK
    )
    :vars
    (
      ?auto_731456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731455 ?auto_731456 ) ( ON-TABLE ?auto_731439 ) ( ON ?auto_731440 ?auto_731439 ) ( ON ?auto_731441 ?auto_731440 ) ( ON ?auto_731442 ?auto_731441 ) ( ON ?auto_731443 ?auto_731442 ) ( ON ?auto_731444 ?auto_731443 ) ( ON ?auto_731445 ?auto_731444 ) ( ON ?auto_731446 ?auto_731445 ) ( ON ?auto_731447 ?auto_731446 ) ( ON ?auto_731448 ?auto_731447 ) ( not ( = ?auto_731439 ?auto_731440 ) ) ( not ( = ?auto_731439 ?auto_731441 ) ) ( not ( = ?auto_731439 ?auto_731442 ) ) ( not ( = ?auto_731439 ?auto_731443 ) ) ( not ( = ?auto_731439 ?auto_731444 ) ) ( not ( = ?auto_731439 ?auto_731445 ) ) ( not ( = ?auto_731439 ?auto_731446 ) ) ( not ( = ?auto_731439 ?auto_731447 ) ) ( not ( = ?auto_731439 ?auto_731448 ) ) ( not ( = ?auto_731439 ?auto_731449 ) ) ( not ( = ?auto_731439 ?auto_731450 ) ) ( not ( = ?auto_731439 ?auto_731451 ) ) ( not ( = ?auto_731439 ?auto_731452 ) ) ( not ( = ?auto_731439 ?auto_731453 ) ) ( not ( = ?auto_731439 ?auto_731454 ) ) ( not ( = ?auto_731439 ?auto_731455 ) ) ( not ( = ?auto_731439 ?auto_731456 ) ) ( not ( = ?auto_731440 ?auto_731441 ) ) ( not ( = ?auto_731440 ?auto_731442 ) ) ( not ( = ?auto_731440 ?auto_731443 ) ) ( not ( = ?auto_731440 ?auto_731444 ) ) ( not ( = ?auto_731440 ?auto_731445 ) ) ( not ( = ?auto_731440 ?auto_731446 ) ) ( not ( = ?auto_731440 ?auto_731447 ) ) ( not ( = ?auto_731440 ?auto_731448 ) ) ( not ( = ?auto_731440 ?auto_731449 ) ) ( not ( = ?auto_731440 ?auto_731450 ) ) ( not ( = ?auto_731440 ?auto_731451 ) ) ( not ( = ?auto_731440 ?auto_731452 ) ) ( not ( = ?auto_731440 ?auto_731453 ) ) ( not ( = ?auto_731440 ?auto_731454 ) ) ( not ( = ?auto_731440 ?auto_731455 ) ) ( not ( = ?auto_731440 ?auto_731456 ) ) ( not ( = ?auto_731441 ?auto_731442 ) ) ( not ( = ?auto_731441 ?auto_731443 ) ) ( not ( = ?auto_731441 ?auto_731444 ) ) ( not ( = ?auto_731441 ?auto_731445 ) ) ( not ( = ?auto_731441 ?auto_731446 ) ) ( not ( = ?auto_731441 ?auto_731447 ) ) ( not ( = ?auto_731441 ?auto_731448 ) ) ( not ( = ?auto_731441 ?auto_731449 ) ) ( not ( = ?auto_731441 ?auto_731450 ) ) ( not ( = ?auto_731441 ?auto_731451 ) ) ( not ( = ?auto_731441 ?auto_731452 ) ) ( not ( = ?auto_731441 ?auto_731453 ) ) ( not ( = ?auto_731441 ?auto_731454 ) ) ( not ( = ?auto_731441 ?auto_731455 ) ) ( not ( = ?auto_731441 ?auto_731456 ) ) ( not ( = ?auto_731442 ?auto_731443 ) ) ( not ( = ?auto_731442 ?auto_731444 ) ) ( not ( = ?auto_731442 ?auto_731445 ) ) ( not ( = ?auto_731442 ?auto_731446 ) ) ( not ( = ?auto_731442 ?auto_731447 ) ) ( not ( = ?auto_731442 ?auto_731448 ) ) ( not ( = ?auto_731442 ?auto_731449 ) ) ( not ( = ?auto_731442 ?auto_731450 ) ) ( not ( = ?auto_731442 ?auto_731451 ) ) ( not ( = ?auto_731442 ?auto_731452 ) ) ( not ( = ?auto_731442 ?auto_731453 ) ) ( not ( = ?auto_731442 ?auto_731454 ) ) ( not ( = ?auto_731442 ?auto_731455 ) ) ( not ( = ?auto_731442 ?auto_731456 ) ) ( not ( = ?auto_731443 ?auto_731444 ) ) ( not ( = ?auto_731443 ?auto_731445 ) ) ( not ( = ?auto_731443 ?auto_731446 ) ) ( not ( = ?auto_731443 ?auto_731447 ) ) ( not ( = ?auto_731443 ?auto_731448 ) ) ( not ( = ?auto_731443 ?auto_731449 ) ) ( not ( = ?auto_731443 ?auto_731450 ) ) ( not ( = ?auto_731443 ?auto_731451 ) ) ( not ( = ?auto_731443 ?auto_731452 ) ) ( not ( = ?auto_731443 ?auto_731453 ) ) ( not ( = ?auto_731443 ?auto_731454 ) ) ( not ( = ?auto_731443 ?auto_731455 ) ) ( not ( = ?auto_731443 ?auto_731456 ) ) ( not ( = ?auto_731444 ?auto_731445 ) ) ( not ( = ?auto_731444 ?auto_731446 ) ) ( not ( = ?auto_731444 ?auto_731447 ) ) ( not ( = ?auto_731444 ?auto_731448 ) ) ( not ( = ?auto_731444 ?auto_731449 ) ) ( not ( = ?auto_731444 ?auto_731450 ) ) ( not ( = ?auto_731444 ?auto_731451 ) ) ( not ( = ?auto_731444 ?auto_731452 ) ) ( not ( = ?auto_731444 ?auto_731453 ) ) ( not ( = ?auto_731444 ?auto_731454 ) ) ( not ( = ?auto_731444 ?auto_731455 ) ) ( not ( = ?auto_731444 ?auto_731456 ) ) ( not ( = ?auto_731445 ?auto_731446 ) ) ( not ( = ?auto_731445 ?auto_731447 ) ) ( not ( = ?auto_731445 ?auto_731448 ) ) ( not ( = ?auto_731445 ?auto_731449 ) ) ( not ( = ?auto_731445 ?auto_731450 ) ) ( not ( = ?auto_731445 ?auto_731451 ) ) ( not ( = ?auto_731445 ?auto_731452 ) ) ( not ( = ?auto_731445 ?auto_731453 ) ) ( not ( = ?auto_731445 ?auto_731454 ) ) ( not ( = ?auto_731445 ?auto_731455 ) ) ( not ( = ?auto_731445 ?auto_731456 ) ) ( not ( = ?auto_731446 ?auto_731447 ) ) ( not ( = ?auto_731446 ?auto_731448 ) ) ( not ( = ?auto_731446 ?auto_731449 ) ) ( not ( = ?auto_731446 ?auto_731450 ) ) ( not ( = ?auto_731446 ?auto_731451 ) ) ( not ( = ?auto_731446 ?auto_731452 ) ) ( not ( = ?auto_731446 ?auto_731453 ) ) ( not ( = ?auto_731446 ?auto_731454 ) ) ( not ( = ?auto_731446 ?auto_731455 ) ) ( not ( = ?auto_731446 ?auto_731456 ) ) ( not ( = ?auto_731447 ?auto_731448 ) ) ( not ( = ?auto_731447 ?auto_731449 ) ) ( not ( = ?auto_731447 ?auto_731450 ) ) ( not ( = ?auto_731447 ?auto_731451 ) ) ( not ( = ?auto_731447 ?auto_731452 ) ) ( not ( = ?auto_731447 ?auto_731453 ) ) ( not ( = ?auto_731447 ?auto_731454 ) ) ( not ( = ?auto_731447 ?auto_731455 ) ) ( not ( = ?auto_731447 ?auto_731456 ) ) ( not ( = ?auto_731448 ?auto_731449 ) ) ( not ( = ?auto_731448 ?auto_731450 ) ) ( not ( = ?auto_731448 ?auto_731451 ) ) ( not ( = ?auto_731448 ?auto_731452 ) ) ( not ( = ?auto_731448 ?auto_731453 ) ) ( not ( = ?auto_731448 ?auto_731454 ) ) ( not ( = ?auto_731448 ?auto_731455 ) ) ( not ( = ?auto_731448 ?auto_731456 ) ) ( not ( = ?auto_731449 ?auto_731450 ) ) ( not ( = ?auto_731449 ?auto_731451 ) ) ( not ( = ?auto_731449 ?auto_731452 ) ) ( not ( = ?auto_731449 ?auto_731453 ) ) ( not ( = ?auto_731449 ?auto_731454 ) ) ( not ( = ?auto_731449 ?auto_731455 ) ) ( not ( = ?auto_731449 ?auto_731456 ) ) ( not ( = ?auto_731450 ?auto_731451 ) ) ( not ( = ?auto_731450 ?auto_731452 ) ) ( not ( = ?auto_731450 ?auto_731453 ) ) ( not ( = ?auto_731450 ?auto_731454 ) ) ( not ( = ?auto_731450 ?auto_731455 ) ) ( not ( = ?auto_731450 ?auto_731456 ) ) ( not ( = ?auto_731451 ?auto_731452 ) ) ( not ( = ?auto_731451 ?auto_731453 ) ) ( not ( = ?auto_731451 ?auto_731454 ) ) ( not ( = ?auto_731451 ?auto_731455 ) ) ( not ( = ?auto_731451 ?auto_731456 ) ) ( not ( = ?auto_731452 ?auto_731453 ) ) ( not ( = ?auto_731452 ?auto_731454 ) ) ( not ( = ?auto_731452 ?auto_731455 ) ) ( not ( = ?auto_731452 ?auto_731456 ) ) ( not ( = ?auto_731453 ?auto_731454 ) ) ( not ( = ?auto_731453 ?auto_731455 ) ) ( not ( = ?auto_731453 ?auto_731456 ) ) ( not ( = ?auto_731454 ?auto_731455 ) ) ( not ( = ?auto_731454 ?auto_731456 ) ) ( not ( = ?auto_731455 ?auto_731456 ) ) ( ON ?auto_731454 ?auto_731455 ) ( ON ?auto_731453 ?auto_731454 ) ( ON ?auto_731452 ?auto_731453 ) ( ON ?auto_731451 ?auto_731452 ) ( ON ?auto_731450 ?auto_731451 ) ( CLEAR ?auto_731448 ) ( ON ?auto_731449 ?auto_731450 ) ( CLEAR ?auto_731449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_731439 ?auto_731440 ?auto_731441 ?auto_731442 ?auto_731443 ?auto_731444 ?auto_731445 ?auto_731446 ?auto_731447 ?auto_731448 ?auto_731449 )
      ( MAKE-17PILE ?auto_731439 ?auto_731440 ?auto_731441 ?auto_731442 ?auto_731443 ?auto_731444 ?auto_731445 ?auto_731446 ?auto_731447 ?auto_731448 ?auto_731449 ?auto_731450 ?auto_731451 ?auto_731452 ?auto_731453 ?auto_731454 ?auto_731455 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731474 - BLOCK
      ?auto_731475 - BLOCK
      ?auto_731476 - BLOCK
      ?auto_731477 - BLOCK
      ?auto_731478 - BLOCK
      ?auto_731479 - BLOCK
      ?auto_731480 - BLOCK
      ?auto_731481 - BLOCK
      ?auto_731482 - BLOCK
      ?auto_731483 - BLOCK
      ?auto_731484 - BLOCK
      ?auto_731485 - BLOCK
      ?auto_731486 - BLOCK
      ?auto_731487 - BLOCK
      ?auto_731488 - BLOCK
      ?auto_731489 - BLOCK
      ?auto_731490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731490 ) ( ON-TABLE ?auto_731474 ) ( ON ?auto_731475 ?auto_731474 ) ( ON ?auto_731476 ?auto_731475 ) ( ON ?auto_731477 ?auto_731476 ) ( ON ?auto_731478 ?auto_731477 ) ( ON ?auto_731479 ?auto_731478 ) ( ON ?auto_731480 ?auto_731479 ) ( ON ?auto_731481 ?auto_731480 ) ( ON ?auto_731482 ?auto_731481 ) ( ON ?auto_731483 ?auto_731482 ) ( not ( = ?auto_731474 ?auto_731475 ) ) ( not ( = ?auto_731474 ?auto_731476 ) ) ( not ( = ?auto_731474 ?auto_731477 ) ) ( not ( = ?auto_731474 ?auto_731478 ) ) ( not ( = ?auto_731474 ?auto_731479 ) ) ( not ( = ?auto_731474 ?auto_731480 ) ) ( not ( = ?auto_731474 ?auto_731481 ) ) ( not ( = ?auto_731474 ?auto_731482 ) ) ( not ( = ?auto_731474 ?auto_731483 ) ) ( not ( = ?auto_731474 ?auto_731484 ) ) ( not ( = ?auto_731474 ?auto_731485 ) ) ( not ( = ?auto_731474 ?auto_731486 ) ) ( not ( = ?auto_731474 ?auto_731487 ) ) ( not ( = ?auto_731474 ?auto_731488 ) ) ( not ( = ?auto_731474 ?auto_731489 ) ) ( not ( = ?auto_731474 ?auto_731490 ) ) ( not ( = ?auto_731475 ?auto_731476 ) ) ( not ( = ?auto_731475 ?auto_731477 ) ) ( not ( = ?auto_731475 ?auto_731478 ) ) ( not ( = ?auto_731475 ?auto_731479 ) ) ( not ( = ?auto_731475 ?auto_731480 ) ) ( not ( = ?auto_731475 ?auto_731481 ) ) ( not ( = ?auto_731475 ?auto_731482 ) ) ( not ( = ?auto_731475 ?auto_731483 ) ) ( not ( = ?auto_731475 ?auto_731484 ) ) ( not ( = ?auto_731475 ?auto_731485 ) ) ( not ( = ?auto_731475 ?auto_731486 ) ) ( not ( = ?auto_731475 ?auto_731487 ) ) ( not ( = ?auto_731475 ?auto_731488 ) ) ( not ( = ?auto_731475 ?auto_731489 ) ) ( not ( = ?auto_731475 ?auto_731490 ) ) ( not ( = ?auto_731476 ?auto_731477 ) ) ( not ( = ?auto_731476 ?auto_731478 ) ) ( not ( = ?auto_731476 ?auto_731479 ) ) ( not ( = ?auto_731476 ?auto_731480 ) ) ( not ( = ?auto_731476 ?auto_731481 ) ) ( not ( = ?auto_731476 ?auto_731482 ) ) ( not ( = ?auto_731476 ?auto_731483 ) ) ( not ( = ?auto_731476 ?auto_731484 ) ) ( not ( = ?auto_731476 ?auto_731485 ) ) ( not ( = ?auto_731476 ?auto_731486 ) ) ( not ( = ?auto_731476 ?auto_731487 ) ) ( not ( = ?auto_731476 ?auto_731488 ) ) ( not ( = ?auto_731476 ?auto_731489 ) ) ( not ( = ?auto_731476 ?auto_731490 ) ) ( not ( = ?auto_731477 ?auto_731478 ) ) ( not ( = ?auto_731477 ?auto_731479 ) ) ( not ( = ?auto_731477 ?auto_731480 ) ) ( not ( = ?auto_731477 ?auto_731481 ) ) ( not ( = ?auto_731477 ?auto_731482 ) ) ( not ( = ?auto_731477 ?auto_731483 ) ) ( not ( = ?auto_731477 ?auto_731484 ) ) ( not ( = ?auto_731477 ?auto_731485 ) ) ( not ( = ?auto_731477 ?auto_731486 ) ) ( not ( = ?auto_731477 ?auto_731487 ) ) ( not ( = ?auto_731477 ?auto_731488 ) ) ( not ( = ?auto_731477 ?auto_731489 ) ) ( not ( = ?auto_731477 ?auto_731490 ) ) ( not ( = ?auto_731478 ?auto_731479 ) ) ( not ( = ?auto_731478 ?auto_731480 ) ) ( not ( = ?auto_731478 ?auto_731481 ) ) ( not ( = ?auto_731478 ?auto_731482 ) ) ( not ( = ?auto_731478 ?auto_731483 ) ) ( not ( = ?auto_731478 ?auto_731484 ) ) ( not ( = ?auto_731478 ?auto_731485 ) ) ( not ( = ?auto_731478 ?auto_731486 ) ) ( not ( = ?auto_731478 ?auto_731487 ) ) ( not ( = ?auto_731478 ?auto_731488 ) ) ( not ( = ?auto_731478 ?auto_731489 ) ) ( not ( = ?auto_731478 ?auto_731490 ) ) ( not ( = ?auto_731479 ?auto_731480 ) ) ( not ( = ?auto_731479 ?auto_731481 ) ) ( not ( = ?auto_731479 ?auto_731482 ) ) ( not ( = ?auto_731479 ?auto_731483 ) ) ( not ( = ?auto_731479 ?auto_731484 ) ) ( not ( = ?auto_731479 ?auto_731485 ) ) ( not ( = ?auto_731479 ?auto_731486 ) ) ( not ( = ?auto_731479 ?auto_731487 ) ) ( not ( = ?auto_731479 ?auto_731488 ) ) ( not ( = ?auto_731479 ?auto_731489 ) ) ( not ( = ?auto_731479 ?auto_731490 ) ) ( not ( = ?auto_731480 ?auto_731481 ) ) ( not ( = ?auto_731480 ?auto_731482 ) ) ( not ( = ?auto_731480 ?auto_731483 ) ) ( not ( = ?auto_731480 ?auto_731484 ) ) ( not ( = ?auto_731480 ?auto_731485 ) ) ( not ( = ?auto_731480 ?auto_731486 ) ) ( not ( = ?auto_731480 ?auto_731487 ) ) ( not ( = ?auto_731480 ?auto_731488 ) ) ( not ( = ?auto_731480 ?auto_731489 ) ) ( not ( = ?auto_731480 ?auto_731490 ) ) ( not ( = ?auto_731481 ?auto_731482 ) ) ( not ( = ?auto_731481 ?auto_731483 ) ) ( not ( = ?auto_731481 ?auto_731484 ) ) ( not ( = ?auto_731481 ?auto_731485 ) ) ( not ( = ?auto_731481 ?auto_731486 ) ) ( not ( = ?auto_731481 ?auto_731487 ) ) ( not ( = ?auto_731481 ?auto_731488 ) ) ( not ( = ?auto_731481 ?auto_731489 ) ) ( not ( = ?auto_731481 ?auto_731490 ) ) ( not ( = ?auto_731482 ?auto_731483 ) ) ( not ( = ?auto_731482 ?auto_731484 ) ) ( not ( = ?auto_731482 ?auto_731485 ) ) ( not ( = ?auto_731482 ?auto_731486 ) ) ( not ( = ?auto_731482 ?auto_731487 ) ) ( not ( = ?auto_731482 ?auto_731488 ) ) ( not ( = ?auto_731482 ?auto_731489 ) ) ( not ( = ?auto_731482 ?auto_731490 ) ) ( not ( = ?auto_731483 ?auto_731484 ) ) ( not ( = ?auto_731483 ?auto_731485 ) ) ( not ( = ?auto_731483 ?auto_731486 ) ) ( not ( = ?auto_731483 ?auto_731487 ) ) ( not ( = ?auto_731483 ?auto_731488 ) ) ( not ( = ?auto_731483 ?auto_731489 ) ) ( not ( = ?auto_731483 ?auto_731490 ) ) ( not ( = ?auto_731484 ?auto_731485 ) ) ( not ( = ?auto_731484 ?auto_731486 ) ) ( not ( = ?auto_731484 ?auto_731487 ) ) ( not ( = ?auto_731484 ?auto_731488 ) ) ( not ( = ?auto_731484 ?auto_731489 ) ) ( not ( = ?auto_731484 ?auto_731490 ) ) ( not ( = ?auto_731485 ?auto_731486 ) ) ( not ( = ?auto_731485 ?auto_731487 ) ) ( not ( = ?auto_731485 ?auto_731488 ) ) ( not ( = ?auto_731485 ?auto_731489 ) ) ( not ( = ?auto_731485 ?auto_731490 ) ) ( not ( = ?auto_731486 ?auto_731487 ) ) ( not ( = ?auto_731486 ?auto_731488 ) ) ( not ( = ?auto_731486 ?auto_731489 ) ) ( not ( = ?auto_731486 ?auto_731490 ) ) ( not ( = ?auto_731487 ?auto_731488 ) ) ( not ( = ?auto_731487 ?auto_731489 ) ) ( not ( = ?auto_731487 ?auto_731490 ) ) ( not ( = ?auto_731488 ?auto_731489 ) ) ( not ( = ?auto_731488 ?auto_731490 ) ) ( not ( = ?auto_731489 ?auto_731490 ) ) ( ON ?auto_731489 ?auto_731490 ) ( ON ?auto_731488 ?auto_731489 ) ( ON ?auto_731487 ?auto_731488 ) ( ON ?auto_731486 ?auto_731487 ) ( ON ?auto_731485 ?auto_731486 ) ( CLEAR ?auto_731483 ) ( ON ?auto_731484 ?auto_731485 ) ( CLEAR ?auto_731484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_731474 ?auto_731475 ?auto_731476 ?auto_731477 ?auto_731478 ?auto_731479 ?auto_731480 ?auto_731481 ?auto_731482 ?auto_731483 ?auto_731484 )
      ( MAKE-17PILE ?auto_731474 ?auto_731475 ?auto_731476 ?auto_731477 ?auto_731478 ?auto_731479 ?auto_731480 ?auto_731481 ?auto_731482 ?auto_731483 ?auto_731484 ?auto_731485 ?auto_731486 ?auto_731487 ?auto_731488 ?auto_731489 ?auto_731490 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731508 - BLOCK
      ?auto_731509 - BLOCK
      ?auto_731510 - BLOCK
      ?auto_731511 - BLOCK
      ?auto_731512 - BLOCK
      ?auto_731513 - BLOCK
      ?auto_731514 - BLOCK
      ?auto_731515 - BLOCK
      ?auto_731516 - BLOCK
      ?auto_731517 - BLOCK
      ?auto_731518 - BLOCK
      ?auto_731519 - BLOCK
      ?auto_731520 - BLOCK
      ?auto_731521 - BLOCK
      ?auto_731522 - BLOCK
      ?auto_731523 - BLOCK
      ?auto_731524 - BLOCK
    )
    :vars
    (
      ?auto_731525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731524 ?auto_731525 ) ( ON-TABLE ?auto_731508 ) ( ON ?auto_731509 ?auto_731508 ) ( ON ?auto_731510 ?auto_731509 ) ( ON ?auto_731511 ?auto_731510 ) ( ON ?auto_731512 ?auto_731511 ) ( ON ?auto_731513 ?auto_731512 ) ( ON ?auto_731514 ?auto_731513 ) ( ON ?auto_731515 ?auto_731514 ) ( ON ?auto_731516 ?auto_731515 ) ( not ( = ?auto_731508 ?auto_731509 ) ) ( not ( = ?auto_731508 ?auto_731510 ) ) ( not ( = ?auto_731508 ?auto_731511 ) ) ( not ( = ?auto_731508 ?auto_731512 ) ) ( not ( = ?auto_731508 ?auto_731513 ) ) ( not ( = ?auto_731508 ?auto_731514 ) ) ( not ( = ?auto_731508 ?auto_731515 ) ) ( not ( = ?auto_731508 ?auto_731516 ) ) ( not ( = ?auto_731508 ?auto_731517 ) ) ( not ( = ?auto_731508 ?auto_731518 ) ) ( not ( = ?auto_731508 ?auto_731519 ) ) ( not ( = ?auto_731508 ?auto_731520 ) ) ( not ( = ?auto_731508 ?auto_731521 ) ) ( not ( = ?auto_731508 ?auto_731522 ) ) ( not ( = ?auto_731508 ?auto_731523 ) ) ( not ( = ?auto_731508 ?auto_731524 ) ) ( not ( = ?auto_731508 ?auto_731525 ) ) ( not ( = ?auto_731509 ?auto_731510 ) ) ( not ( = ?auto_731509 ?auto_731511 ) ) ( not ( = ?auto_731509 ?auto_731512 ) ) ( not ( = ?auto_731509 ?auto_731513 ) ) ( not ( = ?auto_731509 ?auto_731514 ) ) ( not ( = ?auto_731509 ?auto_731515 ) ) ( not ( = ?auto_731509 ?auto_731516 ) ) ( not ( = ?auto_731509 ?auto_731517 ) ) ( not ( = ?auto_731509 ?auto_731518 ) ) ( not ( = ?auto_731509 ?auto_731519 ) ) ( not ( = ?auto_731509 ?auto_731520 ) ) ( not ( = ?auto_731509 ?auto_731521 ) ) ( not ( = ?auto_731509 ?auto_731522 ) ) ( not ( = ?auto_731509 ?auto_731523 ) ) ( not ( = ?auto_731509 ?auto_731524 ) ) ( not ( = ?auto_731509 ?auto_731525 ) ) ( not ( = ?auto_731510 ?auto_731511 ) ) ( not ( = ?auto_731510 ?auto_731512 ) ) ( not ( = ?auto_731510 ?auto_731513 ) ) ( not ( = ?auto_731510 ?auto_731514 ) ) ( not ( = ?auto_731510 ?auto_731515 ) ) ( not ( = ?auto_731510 ?auto_731516 ) ) ( not ( = ?auto_731510 ?auto_731517 ) ) ( not ( = ?auto_731510 ?auto_731518 ) ) ( not ( = ?auto_731510 ?auto_731519 ) ) ( not ( = ?auto_731510 ?auto_731520 ) ) ( not ( = ?auto_731510 ?auto_731521 ) ) ( not ( = ?auto_731510 ?auto_731522 ) ) ( not ( = ?auto_731510 ?auto_731523 ) ) ( not ( = ?auto_731510 ?auto_731524 ) ) ( not ( = ?auto_731510 ?auto_731525 ) ) ( not ( = ?auto_731511 ?auto_731512 ) ) ( not ( = ?auto_731511 ?auto_731513 ) ) ( not ( = ?auto_731511 ?auto_731514 ) ) ( not ( = ?auto_731511 ?auto_731515 ) ) ( not ( = ?auto_731511 ?auto_731516 ) ) ( not ( = ?auto_731511 ?auto_731517 ) ) ( not ( = ?auto_731511 ?auto_731518 ) ) ( not ( = ?auto_731511 ?auto_731519 ) ) ( not ( = ?auto_731511 ?auto_731520 ) ) ( not ( = ?auto_731511 ?auto_731521 ) ) ( not ( = ?auto_731511 ?auto_731522 ) ) ( not ( = ?auto_731511 ?auto_731523 ) ) ( not ( = ?auto_731511 ?auto_731524 ) ) ( not ( = ?auto_731511 ?auto_731525 ) ) ( not ( = ?auto_731512 ?auto_731513 ) ) ( not ( = ?auto_731512 ?auto_731514 ) ) ( not ( = ?auto_731512 ?auto_731515 ) ) ( not ( = ?auto_731512 ?auto_731516 ) ) ( not ( = ?auto_731512 ?auto_731517 ) ) ( not ( = ?auto_731512 ?auto_731518 ) ) ( not ( = ?auto_731512 ?auto_731519 ) ) ( not ( = ?auto_731512 ?auto_731520 ) ) ( not ( = ?auto_731512 ?auto_731521 ) ) ( not ( = ?auto_731512 ?auto_731522 ) ) ( not ( = ?auto_731512 ?auto_731523 ) ) ( not ( = ?auto_731512 ?auto_731524 ) ) ( not ( = ?auto_731512 ?auto_731525 ) ) ( not ( = ?auto_731513 ?auto_731514 ) ) ( not ( = ?auto_731513 ?auto_731515 ) ) ( not ( = ?auto_731513 ?auto_731516 ) ) ( not ( = ?auto_731513 ?auto_731517 ) ) ( not ( = ?auto_731513 ?auto_731518 ) ) ( not ( = ?auto_731513 ?auto_731519 ) ) ( not ( = ?auto_731513 ?auto_731520 ) ) ( not ( = ?auto_731513 ?auto_731521 ) ) ( not ( = ?auto_731513 ?auto_731522 ) ) ( not ( = ?auto_731513 ?auto_731523 ) ) ( not ( = ?auto_731513 ?auto_731524 ) ) ( not ( = ?auto_731513 ?auto_731525 ) ) ( not ( = ?auto_731514 ?auto_731515 ) ) ( not ( = ?auto_731514 ?auto_731516 ) ) ( not ( = ?auto_731514 ?auto_731517 ) ) ( not ( = ?auto_731514 ?auto_731518 ) ) ( not ( = ?auto_731514 ?auto_731519 ) ) ( not ( = ?auto_731514 ?auto_731520 ) ) ( not ( = ?auto_731514 ?auto_731521 ) ) ( not ( = ?auto_731514 ?auto_731522 ) ) ( not ( = ?auto_731514 ?auto_731523 ) ) ( not ( = ?auto_731514 ?auto_731524 ) ) ( not ( = ?auto_731514 ?auto_731525 ) ) ( not ( = ?auto_731515 ?auto_731516 ) ) ( not ( = ?auto_731515 ?auto_731517 ) ) ( not ( = ?auto_731515 ?auto_731518 ) ) ( not ( = ?auto_731515 ?auto_731519 ) ) ( not ( = ?auto_731515 ?auto_731520 ) ) ( not ( = ?auto_731515 ?auto_731521 ) ) ( not ( = ?auto_731515 ?auto_731522 ) ) ( not ( = ?auto_731515 ?auto_731523 ) ) ( not ( = ?auto_731515 ?auto_731524 ) ) ( not ( = ?auto_731515 ?auto_731525 ) ) ( not ( = ?auto_731516 ?auto_731517 ) ) ( not ( = ?auto_731516 ?auto_731518 ) ) ( not ( = ?auto_731516 ?auto_731519 ) ) ( not ( = ?auto_731516 ?auto_731520 ) ) ( not ( = ?auto_731516 ?auto_731521 ) ) ( not ( = ?auto_731516 ?auto_731522 ) ) ( not ( = ?auto_731516 ?auto_731523 ) ) ( not ( = ?auto_731516 ?auto_731524 ) ) ( not ( = ?auto_731516 ?auto_731525 ) ) ( not ( = ?auto_731517 ?auto_731518 ) ) ( not ( = ?auto_731517 ?auto_731519 ) ) ( not ( = ?auto_731517 ?auto_731520 ) ) ( not ( = ?auto_731517 ?auto_731521 ) ) ( not ( = ?auto_731517 ?auto_731522 ) ) ( not ( = ?auto_731517 ?auto_731523 ) ) ( not ( = ?auto_731517 ?auto_731524 ) ) ( not ( = ?auto_731517 ?auto_731525 ) ) ( not ( = ?auto_731518 ?auto_731519 ) ) ( not ( = ?auto_731518 ?auto_731520 ) ) ( not ( = ?auto_731518 ?auto_731521 ) ) ( not ( = ?auto_731518 ?auto_731522 ) ) ( not ( = ?auto_731518 ?auto_731523 ) ) ( not ( = ?auto_731518 ?auto_731524 ) ) ( not ( = ?auto_731518 ?auto_731525 ) ) ( not ( = ?auto_731519 ?auto_731520 ) ) ( not ( = ?auto_731519 ?auto_731521 ) ) ( not ( = ?auto_731519 ?auto_731522 ) ) ( not ( = ?auto_731519 ?auto_731523 ) ) ( not ( = ?auto_731519 ?auto_731524 ) ) ( not ( = ?auto_731519 ?auto_731525 ) ) ( not ( = ?auto_731520 ?auto_731521 ) ) ( not ( = ?auto_731520 ?auto_731522 ) ) ( not ( = ?auto_731520 ?auto_731523 ) ) ( not ( = ?auto_731520 ?auto_731524 ) ) ( not ( = ?auto_731520 ?auto_731525 ) ) ( not ( = ?auto_731521 ?auto_731522 ) ) ( not ( = ?auto_731521 ?auto_731523 ) ) ( not ( = ?auto_731521 ?auto_731524 ) ) ( not ( = ?auto_731521 ?auto_731525 ) ) ( not ( = ?auto_731522 ?auto_731523 ) ) ( not ( = ?auto_731522 ?auto_731524 ) ) ( not ( = ?auto_731522 ?auto_731525 ) ) ( not ( = ?auto_731523 ?auto_731524 ) ) ( not ( = ?auto_731523 ?auto_731525 ) ) ( not ( = ?auto_731524 ?auto_731525 ) ) ( ON ?auto_731523 ?auto_731524 ) ( ON ?auto_731522 ?auto_731523 ) ( ON ?auto_731521 ?auto_731522 ) ( ON ?auto_731520 ?auto_731521 ) ( ON ?auto_731519 ?auto_731520 ) ( ON ?auto_731518 ?auto_731519 ) ( CLEAR ?auto_731516 ) ( ON ?auto_731517 ?auto_731518 ) ( CLEAR ?auto_731517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_731508 ?auto_731509 ?auto_731510 ?auto_731511 ?auto_731512 ?auto_731513 ?auto_731514 ?auto_731515 ?auto_731516 ?auto_731517 )
      ( MAKE-17PILE ?auto_731508 ?auto_731509 ?auto_731510 ?auto_731511 ?auto_731512 ?auto_731513 ?auto_731514 ?auto_731515 ?auto_731516 ?auto_731517 ?auto_731518 ?auto_731519 ?auto_731520 ?auto_731521 ?auto_731522 ?auto_731523 ?auto_731524 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731543 - BLOCK
      ?auto_731544 - BLOCK
      ?auto_731545 - BLOCK
      ?auto_731546 - BLOCK
      ?auto_731547 - BLOCK
      ?auto_731548 - BLOCK
      ?auto_731549 - BLOCK
      ?auto_731550 - BLOCK
      ?auto_731551 - BLOCK
      ?auto_731552 - BLOCK
      ?auto_731553 - BLOCK
      ?auto_731554 - BLOCK
      ?auto_731555 - BLOCK
      ?auto_731556 - BLOCK
      ?auto_731557 - BLOCK
      ?auto_731558 - BLOCK
      ?auto_731559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731559 ) ( ON-TABLE ?auto_731543 ) ( ON ?auto_731544 ?auto_731543 ) ( ON ?auto_731545 ?auto_731544 ) ( ON ?auto_731546 ?auto_731545 ) ( ON ?auto_731547 ?auto_731546 ) ( ON ?auto_731548 ?auto_731547 ) ( ON ?auto_731549 ?auto_731548 ) ( ON ?auto_731550 ?auto_731549 ) ( ON ?auto_731551 ?auto_731550 ) ( not ( = ?auto_731543 ?auto_731544 ) ) ( not ( = ?auto_731543 ?auto_731545 ) ) ( not ( = ?auto_731543 ?auto_731546 ) ) ( not ( = ?auto_731543 ?auto_731547 ) ) ( not ( = ?auto_731543 ?auto_731548 ) ) ( not ( = ?auto_731543 ?auto_731549 ) ) ( not ( = ?auto_731543 ?auto_731550 ) ) ( not ( = ?auto_731543 ?auto_731551 ) ) ( not ( = ?auto_731543 ?auto_731552 ) ) ( not ( = ?auto_731543 ?auto_731553 ) ) ( not ( = ?auto_731543 ?auto_731554 ) ) ( not ( = ?auto_731543 ?auto_731555 ) ) ( not ( = ?auto_731543 ?auto_731556 ) ) ( not ( = ?auto_731543 ?auto_731557 ) ) ( not ( = ?auto_731543 ?auto_731558 ) ) ( not ( = ?auto_731543 ?auto_731559 ) ) ( not ( = ?auto_731544 ?auto_731545 ) ) ( not ( = ?auto_731544 ?auto_731546 ) ) ( not ( = ?auto_731544 ?auto_731547 ) ) ( not ( = ?auto_731544 ?auto_731548 ) ) ( not ( = ?auto_731544 ?auto_731549 ) ) ( not ( = ?auto_731544 ?auto_731550 ) ) ( not ( = ?auto_731544 ?auto_731551 ) ) ( not ( = ?auto_731544 ?auto_731552 ) ) ( not ( = ?auto_731544 ?auto_731553 ) ) ( not ( = ?auto_731544 ?auto_731554 ) ) ( not ( = ?auto_731544 ?auto_731555 ) ) ( not ( = ?auto_731544 ?auto_731556 ) ) ( not ( = ?auto_731544 ?auto_731557 ) ) ( not ( = ?auto_731544 ?auto_731558 ) ) ( not ( = ?auto_731544 ?auto_731559 ) ) ( not ( = ?auto_731545 ?auto_731546 ) ) ( not ( = ?auto_731545 ?auto_731547 ) ) ( not ( = ?auto_731545 ?auto_731548 ) ) ( not ( = ?auto_731545 ?auto_731549 ) ) ( not ( = ?auto_731545 ?auto_731550 ) ) ( not ( = ?auto_731545 ?auto_731551 ) ) ( not ( = ?auto_731545 ?auto_731552 ) ) ( not ( = ?auto_731545 ?auto_731553 ) ) ( not ( = ?auto_731545 ?auto_731554 ) ) ( not ( = ?auto_731545 ?auto_731555 ) ) ( not ( = ?auto_731545 ?auto_731556 ) ) ( not ( = ?auto_731545 ?auto_731557 ) ) ( not ( = ?auto_731545 ?auto_731558 ) ) ( not ( = ?auto_731545 ?auto_731559 ) ) ( not ( = ?auto_731546 ?auto_731547 ) ) ( not ( = ?auto_731546 ?auto_731548 ) ) ( not ( = ?auto_731546 ?auto_731549 ) ) ( not ( = ?auto_731546 ?auto_731550 ) ) ( not ( = ?auto_731546 ?auto_731551 ) ) ( not ( = ?auto_731546 ?auto_731552 ) ) ( not ( = ?auto_731546 ?auto_731553 ) ) ( not ( = ?auto_731546 ?auto_731554 ) ) ( not ( = ?auto_731546 ?auto_731555 ) ) ( not ( = ?auto_731546 ?auto_731556 ) ) ( not ( = ?auto_731546 ?auto_731557 ) ) ( not ( = ?auto_731546 ?auto_731558 ) ) ( not ( = ?auto_731546 ?auto_731559 ) ) ( not ( = ?auto_731547 ?auto_731548 ) ) ( not ( = ?auto_731547 ?auto_731549 ) ) ( not ( = ?auto_731547 ?auto_731550 ) ) ( not ( = ?auto_731547 ?auto_731551 ) ) ( not ( = ?auto_731547 ?auto_731552 ) ) ( not ( = ?auto_731547 ?auto_731553 ) ) ( not ( = ?auto_731547 ?auto_731554 ) ) ( not ( = ?auto_731547 ?auto_731555 ) ) ( not ( = ?auto_731547 ?auto_731556 ) ) ( not ( = ?auto_731547 ?auto_731557 ) ) ( not ( = ?auto_731547 ?auto_731558 ) ) ( not ( = ?auto_731547 ?auto_731559 ) ) ( not ( = ?auto_731548 ?auto_731549 ) ) ( not ( = ?auto_731548 ?auto_731550 ) ) ( not ( = ?auto_731548 ?auto_731551 ) ) ( not ( = ?auto_731548 ?auto_731552 ) ) ( not ( = ?auto_731548 ?auto_731553 ) ) ( not ( = ?auto_731548 ?auto_731554 ) ) ( not ( = ?auto_731548 ?auto_731555 ) ) ( not ( = ?auto_731548 ?auto_731556 ) ) ( not ( = ?auto_731548 ?auto_731557 ) ) ( not ( = ?auto_731548 ?auto_731558 ) ) ( not ( = ?auto_731548 ?auto_731559 ) ) ( not ( = ?auto_731549 ?auto_731550 ) ) ( not ( = ?auto_731549 ?auto_731551 ) ) ( not ( = ?auto_731549 ?auto_731552 ) ) ( not ( = ?auto_731549 ?auto_731553 ) ) ( not ( = ?auto_731549 ?auto_731554 ) ) ( not ( = ?auto_731549 ?auto_731555 ) ) ( not ( = ?auto_731549 ?auto_731556 ) ) ( not ( = ?auto_731549 ?auto_731557 ) ) ( not ( = ?auto_731549 ?auto_731558 ) ) ( not ( = ?auto_731549 ?auto_731559 ) ) ( not ( = ?auto_731550 ?auto_731551 ) ) ( not ( = ?auto_731550 ?auto_731552 ) ) ( not ( = ?auto_731550 ?auto_731553 ) ) ( not ( = ?auto_731550 ?auto_731554 ) ) ( not ( = ?auto_731550 ?auto_731555 ) ) ( not ( = ?auto_731550 ?auto_731556 ) ) ( not ( = ?auto_731550 ?auto_731557 ) ) ( not ( = ?auto_731550 ?auto_731558 ) ) ( not ( = ?auto_731550 ?auto_731559 ) ) ( not ( = ?auto_731551 ?auto_731552 ) ) ( not ( = ?auto_731551 ?auto_731553 ) ) ( not ( = ?auto_731551 ?auto_731554 ) ) ( not ( = ?auto_731551 ?auto_731555 ) ) ( not ( = ?auto_731551 ?auto_731556 ) ) ( not ( = ?auto_731551 ?auto_731557 ) ) ( not ( = ?auto_731551 ?auto_731558 ) ) ( not ( = ?auto_731551 ?auto_731559 ) ) ( not ( = ?auto_731552 ?auto_731553 ) ) ( not ( = ?auto_731552 ?auto_731554 ) ) ( not ( = ?auto_731552 ?auto_731555 ) ) ( not ( = ?auto_731552 ?auto_731556 ) ) ( not ( = ?auto_731552 ?auto_731557 ) ) ( not ( = ?auto_731552 ?auto_731558 ) ) ( not ( = ?auto_731552 ?auto_731559 ) ) ( not ( = ?auto_731553 ?auto_731554 ) ) ( not ( = ?auto_731553 ?auto_731555 ) ) ( not ( = ?auto_731553 ?auto_731556 ) ) ( not ( = ?auto_731553 ?auto_731557 ) ) ( not ( = ?auto_731553 ?auto_731558 ) ) ( not ( = ?auto_731553 ?auto_731559 ) ) ( not ( = ?auto_731554 ?auto_731555 ) ) ( not ( = ?auto_731554 ?auto_731556 ) ) ( not ( = ?auto_731554 ?auto_731557 ) ) ( not ( = ?auto_731554 ?auto_731558 ) ) ( not ( = ?auto_731554 ?auto_731559 ) ) ( not ( = ?auto_731555 ?auto_731556 ) ) ( not ( = ?auto_731555 ?auto_731557 ) ) ( not ( = ?auto_731555 ?auto_731558 ) ) ( not ( = ?auto_731555 ?auto_731559 ) ) ( not ( = ?auto_731556 ?auto_731557 ) ) ( not ( = ?auto_731556 ?auto_731558 ) ) ( not ( = ?auto_731556 ?auto_731559 ) ) ( not ( = ?auto_731557 ?auto_731558 ) ) ( not ( = ?auto_731557 ?auto_731559 ) ) ( not ( = ?auto_731558 ?auto_731559 ) ) ( ON ?auto_731558 ?auto_731559 ) ( ON ?auto_731557 ?auto_731558 ) ( ON ?auto_731556 ?auto_731557 ) ( ON ?auto_731555 ?auto_731556 ) ( ON ?auto_731554 ?auto_731555 ) ( ON ?auto_731553 ?auto_731554 ) ( CLEAR ?auto_731551 ) ( ON ?auto_731552 ?auto_731553 ) ( CLEAR ?auto_731552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_731543 ?auto_731544 ?auto_731545 ?auto_731546 ?auto_731547 ?auto_731548 ?auto_731549 ?auto_731550 ?auto_731551 ?auto_731552 )
      ( MAKE-17PILE ?auto_731543 ?auto_731544 ?auto_731545 ?auto_731546 ?auto_731547 ?auto_731548 ?auto_731549 ?auto_731550 ?auto_731551 ?auto_731552 ?auto_731553 ?auto_731554 ?auto_731555 ?auto_731556 ?auto_731557 ?auto_731558 ?auto_731559 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731577 - BLOCK
      ?auto_731578 - BLOCK
      ?auto_731579 - BLOCK
      ?auto_731580 - BLOCK
      ?auto_731581 - BLOCK
      ?auto_731582 - BLOCK
      ?auto_731583 - BLOCK
      ?auto_731584 - BLOCK
      ?auto_731585 - BLOCK
      ?auto_731586 - BLOCK
      ?auto_731587 - BLOCK
      ?auto_731588 - BLOCK
      ?auto_731589 - BLOCK
      ?auto_731590 - BLOCK
      ?auto_731591 - BLOCK
      ?auto_731592 - BLOCK
      ?auto_731593 - BLOCK
    )
    :vars
    (
      ?auto_731594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731593 ?auto_731594 ) ( ON-TABLE ?auto_731577 ) ( ON ?auto_731578 ?auto_731577 ) ( ON ?auto_731579 ?auto_731578 ) ( ON ?auto_731580 ?auto_731579 ) ( ON ?auto_731581 ?auto_731580 ) ( ON ?auto_731582 ?auto_731581 ) ( ON ?auto_731583 ?auto_731582 ) ( ON ?auto_731584 ?auto_731583 ) ( not ( = ?auto_731577 ?auto_731578 ) ) ( not ( = ?auto_731577 ?auto_731579 ) ) ( not ( = ?auto_731577 ?auto_731580 ) ) ( not ( = ?auto_731577 ?auto_731581 ) ) ( not ( = ?auto_731577 ?auto_731582 ) ) ( not ( = ?auto_731577 ?auto_731583 ) ) ( not ( = ?auto_731577 ?auto_731584 ) ) ( not ( = ?auto_731577 ?auto_731585 ) ) ( not ( = ?auto_731577 ?auto_731586 ) ) ( not ( = ?auto_731577 ?auto_731587 ) ) ( not ( = ?auto_731577 ?auto_731588 ) ) ( not ( = ?auto_731577 ?auto_731589 ) ) ( not ( = ?auto_731577 ?auto_731590 ) ) ( not ( = ?auto_731577 ?auto_731591 ) ) ( not ( = ?auto_731577 ?auto_731592 ) ) ( not ( = ?auto_731577 ?auto_731593 ) ) ( not ( = ?auto_731577 ?auto_731594 ) ) ( not ( = ?auto_731578 ?auto_731579 ) ) ( not ( = ?auto_731578 ?auto_731580 ) ) ( not ( = ?auto_731578 ?auto_731581 ) ) ( not ( = ?auto_731578 ?auto_731582 ) ) ( not ( = ?auto_731578 ?auto_731583 ) ) ( not ( = ?auto_731578 ?auto_731584 ) ) ( not ( = ?auto_731578 ?auto_731585 ) ) ( not ( = ?auto_731578 ?auto_731586 ) ) ( not ( = ?auto_731578 ?auto_731587 ) ) ( not ( = ?auto_731578 ?auto_731588 ) ) ( not ( = ?auto_731578 ?auto_731589 ) ) ( not ( = ?auto_731578 ?auto_731590 ) ) ( not ( = ?auto_731578 ?auto_731591 ) ) ( not ( = ?auto_731578 ?auto_731592 ) ) ( not ( = ?auto_731578 ?auto_731593 ) ) ( not ( = ?auto_731578 ?auto_731594 ) ) ( not ( = ?auto_731579 ?auto_731580 ) ) ( not ( = ?auto_731579 ?auto_731581 ) ) ( not ( = ?auto_731579 ?auto_731582 ) ) ( not ( = ?auto_731579 ?auto_731583 ) ) ( not ( = ?auto_731579 ?auto_731584 ) ) ( not ( = ?auto_731579 ?auto_731585 ) ) ( not ( = ?auto_731579 ?auto_731586 ) ) ( not ( = ?auto_731579 ?auto_731587 ) ) ( not ( = ?auto_731579 ?auto_731588 ) ) ( not ( = ?auto_731579 ?auto_731589 ) ) ( not ( = ?auto_731579 ?auto_731590 ) ) ( not ( = ?auto_731579 ?auto_731591 ) ) ( not ( = ?auto_731579 ?auto_731592 ) ) ( not ( = ?auto_731579 ?auto_731593 ) ) ( not ( = ?auto_731579 ?auto_731594 ) ) ( not ( = ?auto_731580 ?auto_731581 ) ) ( not ( = ?auto_731580 ?auto_731582 ) ) ( not ( = ?auto_731580 ?auto_731583 ) ) ( not ( = ?auto_731580 ?auto_731584 ) ) ( not ( = ?auto_731580 ?auto_731585 ) ) ( not ( = ?auto_731580 ?auto_731586 ) ) ( not ( = ?auto_731580 ?auto_731587 ) ) ( not ( = ?auto_731580 ?auto_731588 ) ) ( not ( = ?auto_731580 ?auto_731589 ) ) ( not ( = ?auto_731580 ?auto_731590 ) ) ( not ( = ?auto_731580 ?auto_731591 ) ) ( not ( = ?auto_731580 ?auto_731592 ) ) ( not ( = ?auto_731580 ?auto_731593 ) ) ( not ( = ?auto_731580 ?auto_731594 ) ) ( not ( = ?auto_731581 ?auto_731582 ) ) ( not ( = ?auto_731581 ?auto_731583 ) ) ( not ( = ?auto_731581 ?auto_731584 ) ) ( not ( = ?auto_731581 ?auto_731585 ) ) ( not ( = ?auto_731581 ?auto_731586 ) ) ( not ( = ?auto_731581 ?auto_731587 ) ) ( not ( = ?auto_731581 ?auto_731588 ) ) ( not ( = ?auto_731581 ?auto_731589 ) ) ( not ( = ?auto_731581 ?auto_731590 ) ) ( not ( = ?auto_731581 ?auto_731591 ) ) ( not ( = ?auto_731581 ?auto_731592 ) ) ( not ( = ?auto_731581 ?auto_731593 ) ) ( not ( = ?auto_731581 ?auto_731594 ) ) ( not ( = ?auto_731582 ?auto_731583 ) ) ( not ( = ?auto_731582 ?auto_731584 ) ) ( not ( = ?auto_731582 ?auto_731585 ) ) ( not ( = ?auto_731582 ?auto_731586 ) ) ( not ( = ?auto_731582 ?auto_731587 ) ) ( not ( = ?auto_731582 ?auto_731588 ) ) ( not ( = ?auto_731582 ?auto_731589 ) ) ( not ( = ?auto_731582 ?auto_731590 ) ) ( not ( = ?auto_731582 ?auto_731591 ) ) ( not ( = ?auto_731582 ?auto_731592 ) ) ( not ( = ?auto_731582 ?auto_731593 ) ) ( not ( = ?auto_731582 ?auto_731594 ) ) ( not ( = ?auto_731583 ?auto_731584 ) ) ( not ( = ?auto_731583 ?auto_731585 ) ) ( not ( = ?auto_731583 ?auto_731586 ) ) ( not ( = ?auto_731583 ?auto_731587 ) ) ( not ( = ?auto_731583 ?auto_731588 ) ) ( not ( = ?auto_731583 ?auto_731589 ) ) ( not ( = ?auto_731583 ?auto_731590 ) ) ( not ( = ?auto_731583 ?auto_731591 ) ) ( not ( = ?auto_731583 ?auto_731592 ) ) ( not ( = ?auto_731583 ?auto_731593 ) ) ( not ( = ?auto_731583 ?auto_731594 ) ) ( not ( = ?auto_731584 ?auto_731585 ) ) ( not ( = ?auto_731584 ?auto_731586 ) ) ( not ( = ?auto_731584 ?auto_731587 ) ) ( not ( = ?auto_731584 ?auto_731588 ) ) ( not ( = ?auto_731584 ?auto_731589 ) ) ( not ( = ?auto_731584 ?auto_731590 ) ) ( not ( = ?auto_731584 ?auto_731591 ) ) ( not ( = ?auto_731584 ?auto_731592 ) ) ( not ( = ?auto_731584 ?auto_731593 ) ) ( not ( = ?auto_731584 ?auto_731594 ) ) ( not ( = ?auto_731585 ?auto_731586 ) ) ( not ( = ?auto_731585 ?auto_731587 ) ) ( not ( = ?auto_731585 ?auto_731588 ) ) ( not ( = ?auto_731585 ?auto_731589 ) ) ( not ( = ?auto_731585 ?auto_731590 ) ) ( not ( = ?auto_731585 ?auto_731591 ) ) ( not ( = ?auto_731585 ?auto_731592 ) ) ( not ( = ?auto_731585 ?auto_731593 ) ) ( not ( = ?auto_731585 ?auto_731594 ) ) ( not ( = ?auto_731586 ?auto_731587 ) ) ( not ( = ?auto_731586 ?auto_731588 ) ) ( not ( = ?auto_731586 ?auto_731589 ) ) ( not ( = ?auto_731586 ?auto_731590 ) ) ( not ( = ?auto_731586 ?auto_731591 ) ) ( not ( = ?auto_731586 ?auto_731592 ) ) ( not ( = ?auto_731586 ?auto_731593 ) ) ( not ( = ?auto_731586 ?auto_731594 ) ) ( not ( = ?auto_731587 ?auto_731588 ) ) ( not ( = ?auto_731587 ?auto_731589 ) ) ( not ( = ?auto_731587 ?auto_731590 ) ) ( not ( = ?auto_731587 ?auto_731591 ) ) ( not ( = ?auto_731587 ?auto_731592 ) ) ( not ( = ?auto_731587 ?auto_731593 ) ) ( not ( = ?auto_731587 ?auto_731594 ) ) ( not ( = ?auto_731588 ?auto_731589 ) ) ( not ( = ?auto_731588 ?auto_731590 ) ) ( not ( = ?auto_731588 ?auto_731591 ) ) ( not ( = ?auto_731588 ?auto_731592 ) ) ( not ( = ?auto_731588 ?auto_731593 ) ) ( not ( = ?auto_731588 ?auto_731594 ) ) ( not ( = ?auto_731589 ?auto_731590 ) ) ( not ( = ?auto_731589 ?auto_731591 ) ) ( not ( = ?auto_731589 ?auto_731592 ) ) ( not ( = ?auto_731589 ?auto_731593 ) ) ( not ( = ?auto_731589 ?auto_731594 ) ) ( not ( = ?auto_731590 ?auto_731591 ) ) ( not ( = ?auto_731590 ?auto_731592 ) ) ( not ( = ?auto_731590 ?auto_731593 ) ) ( not ( = ?auto_731590 ?auto_731594 ) ) ( not ( = ?auto_731591 ?auto_731592 ) ) ( not ( = ?auto_731591 ?auto_731593 ) ) ( not ( = ?auto_731591 ?auto_731594 ) ) ( not ( = ?auto_731592 ?auto_731593 ) ) ( not ( = ?auto_731592 ?auto_731594 ) ) ( not ( = ?auto_731593 ?auto_731594 ) ) ( ON ?auto_731592 ?auto_731593 ) ( ON ?auto_731591 ?auto_731592 ) ( ON ?auto_731590 ?auto_731591 ) ( ON ?auto_731589 ?auto_731590 ) ( ON ?auto_731588 ?auto_731589 ) ( ON ?auto_731587 ?auto_731588 ) ( ON ?auto_731586 ?auto_731587 ) ( CLEAR ?auto_731584 ) ( ON ?auto_731585 ?auto_731586 ) ( CLEAR ?auto_731585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_731577 ?auto_731578 ?auto_731579 ?auto_731580 ?auto_731581 ?auto_731582 ?auto_731583 ?auto_731584 ?auto_731585 )
      ( MAKE-17PILE ?auto_731577 ?auto_731578 ?auto_731579 ?auto_731580 ?auto_731581 ?auto_731582 ?auto_731583 ?auto_731584 ?auto_731585 ?auto_731586 ?auto_731587 ?auto_731588 ?auto_731589 ?auto_731590 ?auto_731591 ?auto_731592 ?auto_731593 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731612 - BLOCK
      ?auto_731613 - BLOCK
      ?auto_731614 - BLOCK
      ?auto_731615 - BLOCK
      ?auto_731616 - BLOCK
      ?auto_731617 - BLOCK
      ?auto_731618 - BLOCK
      ?auto_731619 - BLOCK
      ?auto_731620 - BLOCK
      ?auto_731621 - BLOCK
      ?auto_731622 - BLOCK
      ?auto_731623 - BLOCK
      ?auto_731624 - BLOCK
      ?auto_731625 - BLOCK
      ?auto_731626 - BLOCK
      ?auto_731627 - BLOCK
      ?auto_731628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731628 ) ( ON-TABLE ?auto_731612 ) ( ON ?auto_731613 ?auto_731612 ) ( ON ?auto_731614 ?auto_731613 ) ( ON ?auto_731615 ?auto_731614 ) ( ON ?auto_731616 ?auto_731615 ) ( ON ?auto_731617 ?auto_731616 ) ( ON ?auto_731618 ?auto_731617 ) ( ON ?auto_731619 ?auto_731618 ) ( not ( = ?auto_731612 ?auto_731613 ) ) ( not ( = ?auto_731612 ?auto_731614 ) ) ( not ( = ?auto_731612 ?auto_731615 ) ) ( not ( = ?auto_731612 ?auto_731616 ) ) ( not ( = ?auto_731612 ?auto_731617 ) ) ( not ( = ?auto_731612 ?auto_731618 ) ) ( not ( = ?auto_731612 ?auto_731619 ) ) ( not ( = ?auto_731612 ?auto_731620 ) ) ( not ( = ?auto_731612 ?auto_731621 ) ) ( not ( = ?auto_731612 ?auto_731622 ) ) ( not ( = ?auto_731612 ?auto_731623 ) ) ( not ( = ?auto_731612 ?auto_731624 ) ) ( not ( = ?auto_731612 ?auto_731625 ) ) ( not ( = ?auto_731612 ?auto_731626 ) ) ( not ( = ?auto_731612 ?auto_731627 ) ) ( not ( = ?auto_731612 ?auto_731628 ) ) ( not ( = ?auto_731613 ?auto_731614 ) ) ( not ( = ?auto_731613 ?auto_731615 ) ) ( not ( = ?auto_731613 ?auto_731616 ) ) ( not ( = ?auto_731613 ?auto_731617 ) ) ( not ( = ?auto_731613 ?auto_731618 ) ) ( not ( = ?auto_731613 ?auto_731619 ) ) ( not ( = ?auto_731613 ?auto_731620 ) ) ( not ( = ?auto_731613 ?auto_731621 ) ) ( not ( = ?auto_731613 ?auto_731622 ) ) ( not ( = ?auto_731613 ?auto_731623 ) ) ( not ( = ?auto_731613 ?auto_731624 ) ) ( not ( = ?auto_731613 ?auto_731625 ) ) ( not ( = ?auto_731613 ?auto_731626 ) ) ( not ( = ?auto_731613 ?auto_731627 ) ) ( not ( = ?auto_731613 ?auto_731628 ) ) ( not ( = ?auto_731614 ?auto_731615 ) ) ( not ( = ?auto_731614 ?auto_731616 ) ) ( not ( = ?auto_731614 ?auto_731617 ) ) ( not ( = ?auto_731614 ?auto_731618 ) ) ( not ( = ?auto_731614 ?auto_731619 ) ) ( not ( = ?auto_731614 ?auto_731620 ) ) ( not ( = ?auto_731614 ?auto_731621 ) ) ( not ( = ?auto_731614 ?auto_731622 ) ) ( not ( = ?auto_731614 ?auto_731623 ) ) ( not ( = ?auto_731614 ?auto_731624 ) ) ( not ( = ?auto_731614 ?auto_731625 ) ) ( not ( = ?auto_731614 ?auto_731626 ) ) ( not ( = ?auto_731614 ?auto_731627 ) ) ( not ( = ?auto_731614 ?auto_731628 ) ) ( not ( = ?auto_731615 ?auto_731616 ) ) ( not ( = ?auto_731615 ?auto_731617 ) ) ( not ( = ?auto_731615 ?auto_731618 ) ) ( not ( = ?auto_731615 ?auto_731619 ) ) ( not ( = ?auto_731615 ?auto_731620 ) ) ( not ( = ?auto_731615 ?auto_731621 ) ) ( not ( = ?auto_731615 ?auto_731622 ) ) ( not ( = ?auto_731615 ?auto_731623 ) ) ( not ( = ?auto_731615 ?auto_731624 ) ) ( not ( = ?auto_731615 ?auto_731625 ) ) ( not ( = ?auto_731615 ?auto_731626 ) ) ( not ( = ?auto_731615 ?auto_731627 ) ) ( not ( = ?auto_731615 ?auto_731628 ) ) ( not ( = ?auto_731616 ?auto_731617 ) ) ( not ( = ?auto_731616 ?auto_731618 ) ) ( not ( = ?auto_731616 ?auto_731619 ) ) ( not ( = ?auto_731616 ?auto_731620 ) ) ( not ( = ?auto_731616 ?auto_731621 ) ) ( not ( = ?auto_731616 ?auto_731622 ) ) ( not ( = ?auto_731616 ?auto_731623 ) ) ( not ( = ?auto_731616 ?auto_731624 ) ) ( not ( = ?auto_731616 ?auto_731625 ) ) ( not ( = ?auto_731616 ?auto_731626 ) ) ( not ( = ?auto_731616 ?auto_731627 ) ) ( not ( = ?auto_731616 ?auto_731628 ) ) ( not ( = ?auto_731617 ?auto_731618 ) ) ( not ( = ?auto_731617 ?auto_731619 ) ) ( not ( = ?auto_731617 ?auto_731620 ) ) ( not ( = ?auto_731617 ?auto_731621 ) ) ( not ( = ?auto_731617 ?auto_731622 ) ) ( not ( = ?auto_731617 ?auto_731623 ) ) ( not ( = ?auto_731617 ?auto_731624 ) ) ( not ( = ?auto_731617 ?auto_731625 ) ) ( not ( = ?auto_731617 ?auto_731626 ) ) ( not ( = ?auto_731617 ?auto_731627 ) ) ( not ( = ?auto_731617 ?auto_731628 ) ) ( not ( = ?auto_731618 ?auto_731619 ) ) ( not ( = ?auto_731618 ?auto_731620 ) ) ( not ( = ?auto_731618 ?auto_731621 ) ) ( not ( = ?auto_731618 ?auto_731622 ) ) ( not ( = ?auto_731618 ?auto_731623 ) ) ( not ( = ?auto_731618 ?auto_731624 ) ) ( not ( = ?auto_731618 ?auto_731625 ) ) ( not ( = ?auto_731618 ?auto_731626 ) ) ( not ( = ?auto_731618 ?auto_731627 ) ) ( not ( = ?auto_731618 ?auto_731628 ) ) ( not ( = ?auto_731619 ?auto_731620 ) ) ( not ( = ?auto_731619 ?auto_731621 ) ) ( not ( = ?auto_731619 ?auto_731622 ) ) ( not ( = ?auto_731619 ?auto_731623 ) ) ( not ( = ?auto_731619 ?auto_731624 ) ) ( not ( = ?auto_731619 ?auto_731625 ) ) ( not ( = ?auto_731619 ?auto_731626 ) ) ( not ( = ?auto_731619 ?auto_731627 ) ) ( not ( = ?auto_731619 ?auto_731628 ) ) ( not ( = ?auto_731620 ?auto_731621 ) ) ( not ( = ?auto_731620 ?auto_731622 ) ) ( not ( = ?auto_731620 ?auto_731623 ) ) ( not ( = ?auto_731620 ?auto_731624 ) ) ( not ( = ?auto_731620 ?auto_731625 ) ) ( not ( = ?auto_731620 ?auto_731626 ) ) ( not ( = ?auto_731620 ?auto_731627 ) ) ( not ( = ?auto_731620 ?auto_731628 ) ) ( not ( = ?auto_731621 ?auto_731622 ) ) ( not ( = ?auto_731621 ?auto_731623 ) ) ( not ( = ?auto_731621 ?auto_731624 ) ) ( not ( = ?auto_731621 ?auto_731625 ) ) ( not ( = ?auto_731621 ?auto_731626 ) ) ( not ( = ?auto_731621 ?auto_731627 ) ) ( not ( = ?auto_731621 ?auto_731628 ) ) ( not ( = ?auto_731622 ?auto_731623 ) ) ( not ( = ?auto_731622 ?auto_731624 ) ) ( not ( = ?auto_731622 ?auto_731625 ) ) ( not ( = ?auto_731622 ?auto_731626 ) ) ( not ( = ?auto_731622 ?auto_731627 ) ) ( not ( = ?auto_731622 ?auto_731628 ) ) ( not ( = ?auto_731623 ?auto_731624 ) ) ( not ( = ?auto_731623 ?auto_731625 ) ) ( not ( = ?auto_731623 ?auto_731626 ) ) ( not ( = ?auto_731623 ?auto_731627 ) ) ( not ( = ?auto_731623 ?auto_731628 ) ) ( not ( = ?auto_731624 ?auto_731625 ) ) ( not ( = ?auto_731624 ?auto_731626 ) ) ( not ( = ?auto_731624 ?auto_731627 ) ) ( not ( = ?auto_731624 ?auto_731628 ) ) ( not ( = ?auto_731625 ?auto_731626 ) ) ( not ( = ?auto_731625 ?auto_731627 ) ) ( not ( = ?auto_731625 ?auto_731628 ) ) ( not ( = ?auto_731626 ?auto_731627 ) ) ( not ( = ?auto_731626 ?auto_731628 ) ) ( not ( = ?auto_731627 ?auto_731628 ) ) ( ON ?auto_731627 ?auto_731628 ) ( ON ?auto_731626 ?auto_731627 ) ( ON ?auto_731625 ?auto_731626 ) ( ON ?auto_731624 ?auto_731625 ) ( ON ?auto_731623 ?auto_731624 ) ( ON ?auto_731622 ?auto_731623 ) ( ON ?auto_731621 ?auto_731622 ) ( CLEAR ?auto_731619 ) ( ON ?auto_731620 ?auto_731621 ) ( CLEAR ?auto_731620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_731612 ?auto_731613 ?auto_731614 ?auto_731615 ?auto_731616 ?auto_731617 ?auto_731618 ?auto_731619 ?auto_731620 )
      ( MAKE-17PILE ?auto_731612 ?auto_731613 ?auto_731614 ?auto_731615 ?auto_731616 ?auto_731617 ?auto_731618 ?auto_731619 ?auto_731620 ?auto_731621 ?auto_731622 ?auto_731623 ?auto_731624 ?auto_731625 ?auto_731626 ?auto_731627 ?auto_731628 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731646 - BLOCK
      ?auto_731647 - BLOCK
      ?auto_731648 - BLOCK
      ?auto_731649 - BLOCK
      ?auto_731650 - BLOCK
      ?auto_731651 - BLOCK
      ?auto_731652 - BLOCK
      ?auto_731653 - BLOCK
      ?auto_731654 - BLOCK
      ?auto_731655 - BLOCK
      ?auto_731656 - BLOCK
      ?auto_731657 - BLOCK
      ?auto_731658 - BLOCK
      ?auto_731659 - BLOCK
      ?auto_731660 - BLOCK
      ?auto_731661 - BLOCK
      ?auto_731662 - BLOCK
    )
    :vars
    (
      ?auto_731663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731662 ?auto_731663 ) ( ON-TABLE ?auto_731646 ) ( ON ?auto_731647 ?auto_731646 ) ( ON ?auto_731648 ?auto_731647 ) ( ON ?auto_731649 ?auto_731648 ) ( ON ?auto_731650 ?auto_731649 ) ( ON ?auto_731651 ?auto_731650 ) ( ON ?auto_731652 ?auto_731651 ) ( not ( = ?auto_731646 ?auto_731647 ) ) ( not ( = ?auto_731646 ?auto_731648 ) ) ( not ( = ?auto_731646 ?auto_731649 ) ) ( not ( = ?auto_731646 ?auto_731650 ) ) ( not ( = ?auto_731646 ?auto_731651 ) ) ( not ( = ?auto_731646 ?auto_731652 ) ) ( not ( = ?auto_731646 ?auto_731653 ) ) ( not ( = ?auto_731646 ?auto_731654 ) ) ( not ( = ?auto_731646 ?auto_731655 ) ) ( not ( = ?auto_731646 ?auto_731656 ) ) ( not ( = ?auto_731646 ?auto_731657 ) ) ( not ( = ?auto_731646 ?auto_731658 ) ) ( not ( = ?auto_731646 ?auto_731659 ) ) ( not ( = ?auto_731646 ?auto_731660 ) ) ( not ( = ?auto_731646 ?auto_731661 ) ) ( not ( = ?auto_731646 ?auto_731662 ) ) ( not ( = ?auto_731646 ?auto_731663 ) ) ( not ( = ?auto_731647 ?auto_731648 ) ) ( not ( = ?auto_731647 ?auto_731649 ) ) ( not ( = ?auto_731647 ?auto_731650 ) ) ( not ( = ?auto_731647 ?auto_731651 ) ) ( not ( = ?auto_731647 ?auto_731652 ) ) ( not ( = ?auto_731647 ?auto_731653 ) ) ( not ( = ?auto_731647 ?auto_731654 ) ) ( not ( = ?auto_731647 ?auto_731655 ) ) ( not ( = ?auto_731647 ?auto_731656 ) ) ( not ( = ?auto_731647 ?auto_731657 ) ) ( not ( = ?auto_731647 ?auto_731658 ) ) ( not ( = ?auto_731647 ?auto_731659 ) ) ( not ( = ?auto_731647 ?auto_731660 ) ) ( not ( = ?auto_731647 ?auto_731661 ) ) ( not ( = ?auto_731647 ?auto_731662 ) ) ( not ( = ?auto_731647 ?auto_731663 ) ) ( not ( = ?auto_731648 ?auto_731649 ) ) ( not ( = ?auto_731648 ?auto_731650 ) ) ( not ( = ?auto_731648 ?auto_731651 ) ) ( not ( = ?auto_731648 ?auto_731652 ) ) ( not ( = ?auto_731648 ?auto_731653 ) ) ( not ( = ?auto_731648 ?auto_731654 ) ) ( not ( = ?auto_731648 ?auto_731655 ) ) ( not ( = ?auto_731648 ?auto_731656 ) ) ( not ( = ?auto_731648 ?auto_731657 ) ) ( not ( = ?auto_731648 ?auto_731658 ) ) ( not ( = ?auto_731648 ?auto_731659 ) ) ( not ( = ?auto_731648 ?auto_731660 ) ) ( not ( = ?auto_731648 ?auto_731661 ) ) ( not ( = ?auto_731648 ?auto_731662 ) ) ( not ( = ?auto_731648 ?auto_731663 ) ) ( not ( = ?auto_731649 ?auto_731650 ) ) ( not ( = ?auto_731649 ?auto_731651 ) ) ( not ( = ?auto_731649 ?auto_731652 ) ) ( not ( = ?auto_731649 ?auto_731653 ) ) ( not ( = ?auto_731649 ?auto_731654 ) ) ( not ( = ?auto_731649 ?auto_731655 ) ) ( not ( = ?auto_731649 ?auto_731656 ) ) ( not ( = ?auto_731649 ?auto_731657 ) ) ( not ( = ?auto_731649 ?auto_731658 ) ) ( not ( = ?auto_731649 ?auto_731659 ) ) ( not ( = ?auto_731649 ?auto_731660 ) ) ( not ( = ?auto_731649 ?auto_731661 ) ) ( not ( = ?auto_731649 ?auto_731662 ) ) ( not ( = ?auto_731649 ?auto_731663 ) ) ( not ( = ?auto_731650 ?auto_731651 ) ) ( not ( = ?auto_731650 ?auto_731652 ) ) ( not ( = ?auto_731650 ?auto_731653 ) ) ( not ( = ?auto_731650 ?auto_731654 ) ) ( not ( = ?auto_731650 ?auto_731655 ) ) ( not ( = ?auto_731650 ?auto_731656 ) ) ( not ( = ?auto_731650 ?auto_731657 ) ) ( not ( = ?auto_731650 ?auto_731658 ) ) ( not ( = ?auto_731650 ?auto_731659 ) ) ( not ( = ?auto_731650 ?auto_731660 ) ) ( not ( = ?auto_731650 ?auto_731661 ) ) ( not ( = ?auto_731650 ?auto_731662 ) ) ( not ( = ?auto_731650 ?auto_731663 ) ) ( not ( = ?auto_731651 ?auto_731652 ) ) ( not ( = ?auto_731651 ?auto_731653 ) ) ( not ( = ?auto_731651 ?auto_731654 ) ) ( not ( = ?auto_731651 ?auto_731655 ) ) ( not ( = ?auto_731651 ?auto_731656 ) ) ( not ( = ?auto_731651 ?auto_731657 ) ) ( not ( = ?auto_731651 ?auto_731658 ) ) ( not ( = ?auto_731651 ?auto_731659 ) ) ( not ( = ?auto_731651 ?auto_731660 ) ) ( not ( = ?auto_731651 ?auto_731661 ) ) ( not ( = ?auto_731651 ?auto_731662 ) ) ( not ( = ?auto_731651 ?auto_731663 ) ) ( not ( = ?auto_731652 ?auto_731653 ) ) ( not ( = ?auto_731652 ?auto_731654 ) ) ( not ( = ?auto_731652 ?auto_731655 ) ) ( not ( = ?auto_731652 ?auto_731656 ) ) ( not ( = ?auto_731652 ?auto_731657 ) ) ( not ( = ?auto_731652 ?auto_731658 ) ) ( not ( = ?auto_731652 ?auto_731659 ) ) ( not ( = ?auto_731652 ?auto_731660 ) ) ( not ( = ?auto_731652 ?auto_731661 ) ) ( not ( = ?auto_731652 ?auto_731662 ) ) ( not ( = ?auto_731652 ?auto_731663 ) ) ( not ( = ?auto_731653 ?auto_731654 ) ) ( not ( = ?auto_731653 ?auto_731655 ) ) ( not ( = ?auto_731653 ?auto_731656 ) ) ( not ( = ?auto_731653 ?auto_731657 ) ) ( not ( = ?auto_731653 ?auto_731658 ) ) ( not ( = ?auto_731653 ?auto_731659 ) ) ( not ( = ?auto_731653 ?auto_731660 ) ) ( not ( = ?auto_731653 ?auto_731661 ) ) ( not ( = ?auto_731653 ?auto_731662 ) ) ( not ( = ?auto_731653 ?auto_731663 ) ) ( not ( = ?auto_731654 ?auto_731655 ) ) ( not ( = ?auto_731654 ?auto_731656 ) ) ( not ( = ?auto_731654 ?auto_731657 ) ) ( not ( = ?auto_731654 ?auto_731658 ) ) ( not ( = ?auto_731654 ?auto_731659 ) ) ( not ( = ?auto_731654 ?auto_731660 ) ) ( not ( = ?auto_731654 ?auto_731661 ) ) ( not ( = ?auto_731654 ?auto_731662 ) ) ( not ( = ?auto_731654 ?auto_731663 ) ) ( not ( = ?auto_731655 ?auto_731656 ) ) ( not ( = ?auto_731655 ?auto_731657 ) ) ( not ( = ?auto_731655 ?auto_731658 ) ) ( not ( = ?auto_731655 ?auto_731659 ) ) ( not ( = ?auto_731655 ?auto_731660 ) ) ( not ( = ?auto_731655 ?auto_731661 ) ) ( not ( = ?auto_731655 ?auto_731662 ) ) ( not ( = ?auto_731655 ?auto_731663 ) ) ( not ( = ?auto_731656 ?auto_731657 ) ) ( not ( = ?auto_731656 ?auto_731658 ) ) ( not ( = ?auto_731656 ?auto_731659 ) ) ( not ( = ?auto_731656 ?auto_731660 ) ) ( not ( = ?auto_731656 ?auto_731661 ) ) ( not ( = ?auto_731656 ?auto_731662 ) ) ( not ( = ?auto_731656 ?auto_731663 ) ) ( not ( = ?auto_731657 ?auto_731658 ) ) ( not ( = ?auto_731657 ?auto_731659 ) ) ( not ( = ?auto_731657 ?auto_731660 ) ) ( not ( = ?auto_731657 ?auto_731661 ) ) ( not ( = ?auto_731657 ?auto_731662 ) ) ( not ( = ?auto_731657 ?auto_731663 ) ) ( not ( = ?auto_731658 ?auto_731659 ) ) ( not ( = ?auto_731658 ?auto_731660 ) ) ( not ( = ?auto_731658 ?auto_731661 ) ) ( not ( = ?auto_731658 ?auto_731662 ) ) ( not ( = ?auto_731658 ?auto_731663 ) ) ( not ( = ?auto_731659 ?auto_731660 ) ) ( not ( = ?auto_731659 ?auto_731661 ) ) ( not ( = ?auto_731659 ?auto_731662 ) ) ( not ( = ?auto_731659 ?auto_731663 ) ) ( not ( = ?auto_731660 ?auto_731661 ) ) ( not ( = ?auto_731660 ?auto_731662 ) ) ( not ( = ?auto_731660 ?auto_731663 ) ) ( not ( = ?auto_731661 ?auto_731662 ) ) ( not ( = ?auto_731661 ?auto_731663 ) ) ( not ( = ?auto_731662 ?auto_731663 ) ) ( ON ?auto_731661 ?auto_731662 ) ( ON ?auto_731660 ?auto_731661 ) ( ON ?auto_731659 ?auto_731660 ) ( ON ?auto_731658 ?auto_731659 ) ( ON ?auto_731657 ?auto_731658 ) ( ON ?auto_731656 ?auto_731657 ) ( ON ?auto_731655 ?auto_731656 ) ( ON ?auto_731654 ?auto_731655 ) ( CLEAR ?auto_731652 ) ( ON ?auto_731653 ?auto_731654 ) ( CLEAR ?auto_731653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_731646 ?auto_731647 ?auto_731648 ?auto_731649 ?auto_731650 ?auto_731651 ?auto_731652 ?auto_731653 )
      ( MAKE-17PILE ?auto_731646 ?auto_731647 ?auto_731648 ?auto_731649 ?auto_731650 ?auto_731651 ?auto_731652 ?auto_731653 ?auto_731654 ?auto_731655 ?auto_731656 ?auto_731657 ?auto_731658 ?auto_731659 ?auto_731660 ?auto_731661 ?auto_731662 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731681 - BLOCK
      ?auto_731682 - BLOCK
      ?auto_731683 - BLOCK
      ?auto_731684 - BLOCK
      ?auto_731685 - BLOCK
      ?auto_731686 - BLOCK
      ?auto_731687 - BLOCK
      ?auto_731688 - BLOCK
      ?auto_731689 - BLOCK
      ?auto_731690 - BLOCK
      ?auto_731691 - BLOCK
      ?auto_731692 - BLOCK
      ?auto_731693 - BLOCK
      ?auto_731694 - BLOCK
      ?auto_731695 - BLOCK
      ?auto_731696 - BLOCK
      ?auto_731697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731697 ) ( ON-TABLE ?auto_731681 ) ( ON ?auto_731682 ?auto_731681 ) ( ON ?auto_731683 ?auto_731682 ) ( ON ?auto_731684 ?auto_731683 ) ( ON ?auto_731685 ?auto_731684 ) ( ON ?auto_731686 ?auto_731685 ) ( ON ?auto_731687 ?auto_731686 ) ( not ( = ?auto_731681 ?auto_731682 ) ) ( not ( = ?auto_731681 ?auto_731683 ) ) ( not ( = ?auto_731681 ?auto_731684 ) ) ( not ( = ?auto_731681 ?auto_731685 ) ) ( not ( = ?auto_731681 ?auto_731686 ) ) ( not ( = ?auto_731681 ?auto_731687 ) ) ( not ( = ?auto_731681 ?auto_731688 ) ) ( not ( = ?auto_731681 ?auto_731689 ) ) ( not ( = ?auto_731681 ?auto_731690 ) ) ( not ( = ?auto_731681 ?auto_731691 ) ) ( not ( = ?auto_731681 ?auto_731692 ) ) ( not ( = ?auto_731681 ?auto_731693 ) ) ( not ( = ?auto_731681 ?auto_731694 ) ) ( not ( = ?auto_731681 ?auto_731695 ) ) ( not ( = ?auto_731681 ?auto_731696 ) ) ( not ( = ?auto_731681 ?auto_731697 ) ) ( not ( = ?auto_731682 ?auto_731683 ) ) ( not ( = ?auto_731682 ?auto_731684 ) ) ( not ( = ?auto_731682 ?auto_731685 ) ) ( not ( = ?auto_731682 ?auto_731686 ) ) ( not ( = ?auto_731682 ?auto_731687 ) ) ( not ( = ?auto_731682 ?auto_731688 ) ) ( not ( = ?auto_731682 ?auto_731689 ) ) ( not ( = ?auto_731682 ?auto_731690 ) ) ( not ( = ?auto_731682 ?auto_731691 ) ) ( not ( = ?auto_731682 ?auto_731692 ) ) ( not ( = ?auto_731682 ?auto_731693 ) ) ( not ( = ?auto_731682 ?auto_731694 ) ) ( not ( = ?auto_731682 ?auto_731695 ) ) ( not ( = ?auto_731682 ?auto_731696 ) ) ( not ( = ?auto_731682 ?auto_731697 ) ) ( not ( = ?auto_731683 ?auto_731684 ) ) ( not ( = ?auto_731683 ?auto_731685 ) ) ( not ( = ?auto_731683 ?auto_731686 ) ) ( not ( = ?auto_731683 ?auto_731687 ) ) ( not ( = ?auto_731683 ?auto_731688 ) ) ( not ( = ?auto_731683 ?auto_731689 ) ) ( not ( = ?auto_731683 ?auto_731690 ) ) ( not ( = ?auto_731683 ?auto_731691 ) ) ( not ( = ?auto_731683 ?auto_731692 ) ) ( not ( = ?auto_731683 ?auto_731693 ) ) ( not ( = ?auto_731683 ?auto_731694 ) ) ( not ( = ?auto_731683 ?auto_731695 ) ) ( not ( = ?auto_731683 ?auto_731696 ) ) ( not ( = ?auto_731683 ?auto_731697 ) ) ( not ( = ?auto_731684 ?auto_731685 ) ) ( not ( = ?auto_731684 ?auto_731686 ) ) ( not ( = ?auto_731684 ?auto_731687 ) ) ( not ( = ?auto_731684 ?auto_731688 ) ) ( not ( = ?auto_731684 ?auto_731689 ) ) ( not ( = ?auto_731684 ?auto_731690 ) ) ( not ( = ?auto_731684 ?auto_731691 ) ) ( not ( = ?auto_731684 ?auto_731692 ) ) ( not ( = ?auto_731684 ?auto_731693 ) ) ( not ( = ?auto_731684 ?auto_731694 ) ) ( not ( = ?auto_731684 ?auto_731695 ) ) ( not ( = ?auto_731684 ?auto_731696 ) ) ( not ( = ?auto_731684 ?auto_731697 ) ) ( not ( = ?auto_731685 ?auto_731686 ) ) ( not ( = ?auto_731685 ?auto_731687 ) ) ( not ( = ?auto_731685 ?auto_731688 ) ) ( not ( = ?auto_731685 ?auto_731689 ) ) ( not ( = ?auto_731685 ?auto_731690 ) ) ( not ( = ?auto_731685 ?auto_731691 ) ) ( not ( = ?auto_731685 ?auto_731692 ) ) ( not ( = ?auto_731685 ?auto_731693 ) ) ( not ( = ?auto_731685 ?auto_731694 ) ) ( not ( = ?auto_731685 ?auto_731695 ) ) ( not ( = ?auto_731685 ?auto_731696 ) ) ( not ( = ?auto_731685 ?auto_731697 ) ) ( not ( = ?auto_731686 ?auto_731687 ) ) ( not ( = ?auto_731686 ?auto_731688 ) ) ( not ( = ?auto_731686 ?auto_731689 ) ) ( not ( = ?auto_731686 ?auto_731690 ) ) ( not ( = ?auto_731686 ?auto_731691 ) ) ( not ( = ?auto_731686 ?auto_731692 ) ) ( not ( = ?auto_731686 ?auto_731693 ) ) ( not ( = ?auto_731686 ?auto_731694 ) ) ( not ( = ?auto_731686 ?auto_731695 ) ) ( not ( = ?auto_731686 ?auto_731696 ) ) ( not ( = ?auto_731686 ?auto_731697 ) ) ( not ( = ?auto_731687 ?auto_731688 ) ) ( not ( = ?auto_731687 ?auto_731689 ) ) ( not ( = ?auto_731687 ?auto_731690 ) ) ( not ( = ?auto_731687 ?auto_731691 ) ) ( not ( = ?auto_731687 ?auto_731692 ) ) ( not ( = ?auto_731687 ?auto_731693 ) ) ( not ( = ?auto_731687 ?auto_731694 ) ) ( not ( = ?auto_731687 ?auto_731695 ) ) ( not ( = ?auto_731687 ?auto_731696 ) ) ( not ( = ?auto_731687 ?auto_731697 ) ) ( not ( = ?auto_731688 ?auto_731689 ) ) ( not ( = ?auto_731688 ?auto_731690 ) ) ( not ( = ?auto_731688 ?auto_731691 ) ) ( not ( = ?auto_731688 ?auto_731692 ) ) ( not ( = ?auto_731688 ?auto_731693 ) ) ( not ( = ?auto_731688 ?auto_731694 ) ) ( not ( = ?auto_731688 ?auto_731695 ) ) ( not ( = ?auto_731688 ?auto_731696 ) ) ( not ( = ?auto_731688 ?auto_731697 ) ) ( not ( = ?auto_731689 ?auto_731690 ) ) ( not ( = ?auto_731689 ?auto_731691 ) ) ( not ( = ?auto_731689 ?auto_731692 ) ) ( not ( = ?auto_731689 ?auto_731693 ) ) ( not ( = ?auto_731689 ?auto_731694 ) ) ( not ( = ?auto_731689 ?auto_731695 ) ) ( not ( = ?auto_731689 ?auto_731696 ) ) ( not ( = ?auto_731689 ?auto_731697 ) ) ( not ( = ?auto_731690 ?auto_731691 ) ) ( not ( = ?auto_731690 ?auto_731692 ) ) ( not ( = ?auto_731690 ?auto_731693 ) ) ( not ( = ?auto_731690 ?auto_731694 ) ) ( not ( = ?auto_731690 ?auto_731695 ) ) ( not ( = ?auto_731690 ?auto_731696 ) ) ( not ( = ?auto_731690 ?auto_731697 ) ) ( not ( = ?auto_731691 ?auto_731692 ) ) ( not ( = ?auto_731691 ?auto_731693 ) ) ( not ( = ?auto_731691 ?auto_731694 ) ) ( not ( = ?auto_731691 ?auto_731695 ) ) ( not ( = ?auto_731691 ?auto_731696 ) ) ( not ( = ?auto_731691 ?auto_731697 ) ) ( not ( = ?auto_731692 ?auto_731693 ) ) ( not ( = ?auto_731692 ?auto_731694 ) ) ( not ( = ?auto_731692 ?auto_731695 ) ) ( not ( = ?auto_731692 ?auto_731696 ) ) ( not ( = ?auto_731692 ?auto_731697 ) ) ( not ( = ?auto_731693 ?auto_731694 ) ) ( not ( = ?auto_731693 ?auto_731695 ) ) ( not ( = ?auto_731693 ?auto_731696 ) ) ( not ( = ?auto_731693 ?auto_731697 ) ) ( not ( = ?auto_731694 ?auto_731695 ) ) ( not ( = ?auto_731694 ?auto_731696 ) ) ( not ( = ?auto_731694 ?auto_731697 ) ) ( not ( = ?auto_731695 ?auto_731696 ) ) ( not ( = ?auto_731695 ?auto_731697 ) ) ( not ( = ?auto_731696 ?auto_731697 ) ) ( ON ?auto_731696 ?auto_731697 ) ( ON ?auto_731695 ?auto_731696 ) ( ON ?auto_731694 ?auto_731695 ) ( ON ?auto_731693 ?auto_731694 ) ( ON ?auto_731692 ?auto_731693 ) ( ON ?auto_731691 ?auto_731692 ) ( ON ?auto_731690 ?auto_731691 ) ( ON ?auto_731689 ?auto_731690 ) ( CLEAR ?auto_731687 ) ( ON ?auto_731688 ?auto_731689 ) ( CLEAR ?auto_731688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_731681 ?auto_731682 ?auto_731683 ?auto_731684 ?auto_731685 ?auto_731686 ?auto_731687 ?auto_731688 )
      ( MAKE-17PILE ?auto_731681 ?auto_731682 ?auto_731683 ?auto_731684 ?auto_731685 ?auto_731686 ?auto_731687 ?auto_731688 ?auto_731689 ?auto_731690 ?auto_731691 ?auto_731692 ?auto_731693 ?auto_731694 ?auto_731695 ?auto_731696 ?auto_731697 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731715 - BLOCK
      ?auto_731716 - BLOCK
      ?auto_731717 - BLOCK
      ?auto_731718 - BLOCK
      ?auto_731719 - BLOCK
      ?auto_731720 - BLOCK
      ?auto_731721 - BLOCK
      ?auto_731722 - BLOCK
      ?auto_731723 - BLOCK
      ?auto_731724 - BLOCK
      ?auto_731725 - BLOCK
      ?auto_731726 - BLOCK
      ?auto_731727 - BLOCK
      ?auto_731728 - BLOCK
      ?auto_731729 - BLOCK
      ?auto_731730 - BLOCK
      ?auto_731731 - BLOCK
    )
    :vars
    (
      ?auto_731732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731731 ?auto_731732 ) ( ON-TABLE ?auto_731715 ) ( ON ?auto_731716 ?auto_731715 ) ( ON ?auto_731717 ?auto_731716 ) ( ON ?auto_731718 ?auto_731717 ) ( ON ?auto_731719 ?auto_731718 ) ( ON ?auto_731720 ?auto_731719 ) ( not ( = ?auto_731715 ?auto_731716 ) ) ( not ( = ?auto_731715 ?auto_731717 ) ) ( not ( = ?auto_731715 ?auto_731718 ) ) ( not ( = ?auto_731715 ?auto_731719 ) ) ( not ( = ?auto_731715 ?auto_731720 ) ) ( not ( = ?auto_731715 ?auto_731721 ) ) ( not ( = ?auto_731715 ?auto_731722 ) ) ( not ( = ?auto_731715 ?auto_731723 ) ) ( not ( = ?auto_731715 ?auto_731724 ) ) ( not ( = ?auto_731715 ?auto_731725 ) ) ( not ( = ?auto_731715 ?auto_731726 ) ) ( not ( = ?auto_731715 ?auto_731727 ) ) ( not ( = ?auto_731715 ?auto_731728 ) ) ( not ( = ?auto_731715 ?auto_731729 ) ) ( not ( = ?auto_731715 ?auto_731730 ) ) ( not ( = ?auto_731715 ?auto_731731 ) ) ( not ( = ?auto_731715 ?auto_731732 ) ) ( not ( = ?auto_731716 ?auto_731717 ) ) ( not ( = ?auto_731716 ?auto_731718 ) ) ( not ( = ?auto_731716 ?auto_731719 ) ) ( not ( = ?auto_731716 ?auto_731720 ) ) ( not ( = ?auto_731716 ?auto_731721 ) ) ( not ( = ?auto_731716 ?auto_731722 ) ) ( not ( = ?auto_731716 ?auto_731723 ) ) ( not ( = ?auto_731716 ?auto_731724 ) ) ( not ( = ?auto_731716 ?auto_731725 ) ) ( not ( = ?auto_731716 ?auto_731726 ) ) ( not ( = ?auto_731716 ?auto_731727 ) ) ( not ( = ?auto_731716 ?auto_731728 ) ) ( not ( = ?auto_731716 ?auto_731729 ) ) ( not ( = ?auto_731716 ?auto_731730 ) ) ( not ( = ?auto_731716 ?auto_731731 ) ) ( not ( = ?auto_731716 ?auto_731732 ) ) ( not ( = ?auto_731717 ?auto_731718 ) ) ( not ( = ?auto_731717 ?auto_731719 ) ) ( not ( = ?auto_731717 ?auto_731720 ) ) ( not ( = ?auto_731717 ?auto_731721 ) ) ( not ( = ?auto_731717 ?auto_731722 ) ) ( not ( = ?auto_731717 ?auto_731723 ) ) ( not ( = ?auto_731717 ?auto_731724 ) ) ( not ( = ?auto_731717 ?auto_731725 ) ) ( not ( = ?auto_731717 ?auto_731726 ) ) ( not ( = ?auto_731717 ?auto_731727 ) ) ( not ( = ?auto_731717 ?auto_731728 ) ) ( not ( = ?auto_731717 ?auto_731729 ) ) ( not ( = ?auto_731717 ?auto_731730 ) ) ( not ( = ?auto_731717 ?auto_731731 ) ) ( not ( = ?auto_731717 ?auto_731732 ) ) ( not ( = ?auto_731718 ?auto_731719 ) ) ( not ( = ?auto_731718 ?auto_731720 ) ) ( not ( = ?auto_731718 ?auto_731721 ) ) ( not ( = ?auto_731718 ?auto_731722 ) ) ( not ( = ?auto_731718 ?auto_731723 ) ) ( not ( = ?auto_731718 ?auto_731724 ) ) ( not ( = ?auto_731718 ?auto_731725 ) ) ( not ( = ?auto_731718 ?auto_731726 ) ) ( not ( = ?auto_731718 ?auto_731727 ) ) ( not ( = ?auto_731718 ?auto_731728 ) ) ( not ( = ?auto_731718 ?auto_731729 ) ) ( not ( = ?auto_731718 ?auto_731730 ) ) ( not ( = ?auto_731718 ?auto_731731 ) ) ( not ( = ?auto_731718 ?auto_731732 ) ) ( not ( = ?auto_731719 ?auto_731720 ) ) ( not ( = ?auto_731719 ?auto_731721 ) ) ( not ( = ?auto_731719 ?auto_731722 ) ) ( not ( = ?auto_731719 ?auto_731723 ) ) ( not ( = ?auto_731719 ?auto_731724 ) ) ( not ( = ?auto_731719 ?auto_731725 ) ) ( not ( = ?auto_731719 ?auto_731726 ) ) ( not ( = ?auto_731719 ?auto_731727 ) ) ( not ( = ?auto_731719 ?auto_731728 ) ) ( not ( = ?auto_731719 ?auto_731729 ) ) ( not ( = ?auto_731719 ?auto_731730 ) ) ( not ( = ?auto_731719 ?auto_731731 ) ) ( not ( = ?auto_731719 ?auto_731732 ) ) ( not ( = ?auto_731720 ?auto_731721 ) ) ( not ( = ?auto_731720 ?auto_731722 ) ) ( not ( = ?auto_731720 ?auto_731723 ) ) ( not ( = ?auto_731720 ?auto_731724 ) ) ( not ( = ?auto_731720 ?auto_731725 ) ) ( not ( = ?auto_731720 ?auto_731726 ) ) ( not ( = ?auto_731720 ?auto_731727 ) ) ( not ( = ?auto_731720 ?auto_731728 ) ) ( not ( = ?auto_731720 ?auto_731729 ) ) ( not ( = ?auto_731720 ?auto_731730 ) ) ( not ( = ?auto_731720 ?auto_731731 ) ) ( not ( = ?auto_731720 ?auto_731732 ) ) ( not ( = ?auto_731721 ?auto_731722 ) ) ( not ( = ?auto_731721 ?auto_731723 ) ) ( not ( = ?auto_731721 ?auto_731724 ) ) ( not ( = ?auto_731721 ?auto_731725 ) ) ( not ( = ?auto_731721 ?auto_731726 ) ) ( not ( = ?auto_731721 ?auto_731727 ) ) ( not ( = ?auto_731721 ?auto_731728 ) ) ( not ( = ?auto_731721 ?auto_731729 ) ) ( not ( = ?auto_731721 ?auto_731730 ) ) ( not ( = ?auto_731721 ?auto_731731 ) ) ( not ( = ?auto_731721 ?auto_731732 ) ) ( not ( = ?auto_731722 ?auto_731723 ) ) ( not ( = ?auto_731722 ?auto_731724 ) ) ( not ( = ?auto_731722 ?auto_731725 ) ) ( not ( = ?auto_731722 ?auto_731726 ) ) ( not ( = ?auto_731722 ?auto_731727 ) ) ( not ( = ?auto_731722 ?auto_731728 ) ) ( not ( = ?auto_731722 ?auto_731729 ) ) ( not ( = ?auto_731722 ?auto_731730 ) ) ( not ( = ?auto_731722 ?auto_731731 ) ) ( not ( = ?auto_731722 ?auto_731732 ) ) ( not ( = ?auto_731723 ?auto_731724 ) ) ( not ( = ?auto_731723 ?auto_731725 ) ) ( not ( = ?auto_731723 ?auto_731726 ) ) ( not ( = ?auto_731723 ?auto_731727 ) ) ( not ( = ?auto_731723 ?auto_731728 ) ) ( not ( = ?auto_731723 ?auto_731729 ) ) ( not ( = ?auto_731723 ?auto_731730 ) ) ( not ( = ?auto_731723 ?auto_731731 ) ) ( not ( = ?auto_731723 ?auto_731732 ) ) ( not ( = ?auto_731724 ?auto_731725 ) ) ( not ( = ?auto_731724 ?auto_731726 ) ) ( not ( = ?auto_731724 ?auto_731727 ) ) ( not ( = ?auto_731724 ?auto_731728 ) ) ( not ( = ?auto_731724 ?auto_731729 ) ) ( not ( = ?auto_731724 ?auto_731730 ) ) ( not ( = ?auto_731724 ?auto_731731 ) ) ( not ( = ?auto_731724 ?auto_731732 ) ) ( not ( = ?auto_731725 ?auto_731726 ) ) ( not ( = ?auto_731725 ?auto_731727 ) ) ( not ( = ?auto_731725 ?auto_731728 ) ) ( not ( = ?auto_731725 ?auto_731729 ) ) ( not ( = ?auto_731725 ?auto_731730 ) ) ( not ( = ?auto_731725 ?auto_731731 ) ) ( not ( = ?auto_731725 ?auto_731732 ) ) ( not ( = ?auto_731726 ?auto_731727 ) ) ( not ( = ?auto_731726 ?auto_731728 ) ) ( not ( = ?auto_731726 ?auto_731729 ) ) ( not ( = ?auto_731726 ?auto_731730 ) ) ( not ( = ?auto_731726 ?auto_731731 ) ) ( not ( = ?auto_731726 ?auto_731732 ) ) ( not ( = ?auto_731727 ?auto_731728 ) ) ( not ( = ?auto_731727 ?auto_731729 ) ) ( not ( = ?auto_731727 ?auto_731730 ) ) ( not ( = ?auto_731727 ?auto_731731 ) ) ( not ( = ?auto_731727 ?auto_731732 ) ) ( not ( = ?auto_731728 ?auto_731729 ) ) ( not ( = ?auto_731728 ?auto_731730 ) ) ( not ( = ?auto_731728 ?auto_731731 ) ) ( not ( = ?auto_731728 ?auto_731732 ) ) ( not ( = ?auto_731729 ?auto_731730 ) ) ( not ( = ?auto_731729 ?auto_731731 ) ) ( not ( = ?auto_731729 ?auto_731732 ) ) ( not ( = ?auto_731730 ?auto_731731 ) ) ( not ( = ?auto_731730 ?auto_731732 ) ) ( not ( = ?auto_731731 ?auto_731732 ) ) ( ON ?auto_731730 ?auto_731731 ) ( ON ?auto_731729 ?auto_731730 ) ( ON ?auto_731728 ?auto_731729 ) ( ON ?auto_731727 ?auto_731728 ) ( ON ?auto_731726 ?auto_731727 ) ( ON ?auto_731725 ?auto_731726 ) ( ON ?auto_731724 ?auto_731725 ) ( ON ?auto_731723 ?auto_731724 ) ( ON ?auto_731722 ?auto_731723 ) ( CLEAR ?auto_731720 ) ( ON ?auto_731721 ?auto_731722 ) ( CLEAR ?auto_731721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_731715 ?auto_731716 ?auto_731717 ?auto_731718 ?auto_731719 ?auto_731720 ?auto_731721 )
      ( MAKE-17PILE ?auto_731715 ?auto_731716 ?auto_731717 ?auto_731718 ?auto_731719 ?auto_731720 ?auto_731721 ?auto_731722 ?auto_731723 ?auto_731724 ?auto_731725 ?auto_731726 ?auto_731727 ?auto_731728 ?auto_731729 ?auto_731730 ?auto_731731 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731750 - BLOCK
      ?auto_731751 - BLOCK
      ?auto_731752 - BLOCK
      ?auto_731753 - BLOCK
      ?auto_731754 - BLOCK
      ?auto_731755 - BLOCK
      ?auto_731756 - BLOCK
      ?auto_731757 - BLOCK
      ?auto_731758 - BLOCK
      ?auto_731759 - BLOCK
      ?auto_731760 - BLOCK
      ?auto_731761 - BLOCK
      ?auto_731762 - BLOCK
      ?auto_731763 - BLOCK
      ?auto_731764 - BLOCK
      ?auto_731765 - BLOCK
      ?auto_731766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731766 ) ( ON-TABLE ?auto_731750 ) ( ON ?auto_731751 ?auto_731750 ) ( ON ?auto_731752 ?auto_731751 ) ( ON ?auto_731753 ?auto_731752 ) ( ON ?auto_731754 ?auto_731753 ) ( ON ?auto_731755 ?auto_731754 ) ( not ( = ?auto_731750 ?auto_731751 ) ) ( not ( = ?auto_731750 ?auto_731752 ) ) ( not ( = ?auto_731750 ?auto_731753 ) ) ( not ( = ?auto_731750 ?auto_731754 ) ) ( not ( = ?auto_731750 ?auto_731755 ) ) ( not ( = ?auto_731750 ?auto_731756 ) ) ( not ( = ?auto_731750 ?auto_731757 ) ) ( not ( = ?auto_731750 ?auto_731758 ) ) ( not ( = ?auto_731750 ?auto_731759 ) ) ( not ( = ?auto_731750 ?auto_731760 ) ) ( not ( = ?auto_731750 ?auto_731761 ) ) ( not ( = ?auto_731750 ?auto_731762 ) ) ( not ( = ?auto_731750 ?auto_731763 ) ) ( not ( = ?auto_731750 ?auto_731764 ) ) ( not ( = ?auto_731750 ?auto_731765 ) ) ( not ( = ?auto_731750 ?auto_731766 ) ) ( not ( = ?auto_731751 ?auto_731752 ) ) ( not ( = ?auto_731751 ?auto_731753 ) ) ( not ( = ?auto_731751 ?auto_731754 ) ) ( not ( = ?auto_731751 ?auto_731755 ) ) ( not ( = ?auto_731751 ?auto_731756 ) ) ( not ( = ?auto_731751 ?auto_731757 ) ) ( not ( = ?auto_731751 ?auto_731758 ) ) ( not ( = ?auto_731751 ?auto_731759 ) ) ( not ( = ?auto_731751 ?auto_731760 ) ) ( not ( = ?auto_731751 ?auto_731761 ) ) ( not ( = ?auto_731751 ?auto_731762 ) ) ( not ( = ?auto_731751 ?auto_731763 ) ) ( not ( = ?auto_731751 ?auto_731764 ) ) ( not ( = ?auto_731751 ?auto_731765 ) ) ( not ( = ?auto_731751 ?auto_731766 ) ) ( not ( = ?auto_731752 ?auto_731753 ) ) ( not ( = ?auto_731752 ?auto_731754 ) ) ( not ( = ?auto_731752 ?auto_731755 ) ) ( not ( = ?auto_731752 ?auto_731756 ) ) ( not ( = ?auto_731752 ?auto_731757 ) ) ( not ( = ?auto_731752 ?auto_731758 ) ) ( not ( = ?auto_731752 ?auto_731759 ) ) ( not ( = ?auto_731752 ?auto_731760 ) ) ( not ( = ?auto_731752 ?auto_731761 ) ) ( not ( = ?auto_731752 ?auto_731762 ) ) ( not ( = ?auto_731752 ?auto_731763 ) ) ( not ( = ?auto_731752 ?auto_731764 ) ) ( not ( = ?auto_731752 ?auto_731765 ) ) ( not ( = ?auto_731752 ?auto_731766 ) ) ( not ( = ?auto_731753 ?auto_731754 ) ) ( not ( = ?auto_731753 ?auto_731755 ) ) ( not ( = ?auto_731753 ?auto_731756 ) ) ( not ( = ?auto_731753 ?auto_731757 ) ) ( not ( = ?auto_731753 ?auto_731758 ) ) ( not ( = ?auto_731753 ?auto_731759 ) ) ( not ( = ?auto_731753 ?auto_731760 ) ) ( not ( = ?auto_731753 ?auto_731761 ) ) ( not ( = ?auto_731753 ?auto_731762 ) ) ( not ( = ?auto_731753 ?auto_731763 ) ) ( not ( = ?auto_731753 ?auto_731764 ) ) ( not ( = ?auto_731753 ?auto_731765 ) ) ( not ( = ?auto_731753 ?auto_731766 ) ) ( not ( = ?auto_731754 ?auto_731755 ) ) ( not ( = ?auto_731754 ?auto_731756 ) ) ( not ( = ?auto_731754 ?auto_731757 ) ) ( not ( = ?auto_731754 ?auto_731758 ) ) ( not ( = ?auto_731754 ?auto_731759 ) ) ( not ( = ?auto_731754 ?auto_731760 ) ) ( not ( = ?auto_731754 ?auto_731761 ) ) ( not ( = ?auto_731754 ?auto_731762 ) ) ( not ( = ?auto_731754 ?auto_731763 ) ) ( not ( = ?auto_731754 ?auto_731764 ) ) ( not ( = ?auto_731754 ?auto_731765 ) ) ( not ( = ?auto_731754 ?auto_731766 ) ) ( not ( = ?auto_731755 ?auto_731756 ) ) ( not ( = ?auto_731755 ?auto_731757 ) ) ( not ( = ?auto_731755 ?auto_731758 ) ) ( not ( = ?auto_731755 ?auto_731759 ) ) ( not ( = ?auto_731755 ?auto_731760 ) ) ( not ( = ?auto_731755 ?auto_731761 ) ) ( not ( = ?auto_731755 ?auto_731762 ) ) ( not ( = ?auto_731755 ?auto_731763 ) ) ( not ( = ?auto_731755 ?auto_731764 ) ) ( not ( = ?auto_731755 ?auto_731765 ) ) ( not ( = ?auto_731755 ?auto_731766 ) ) ( not ( = ?auto_731756 ?auto_731757 ) ) ( not ( = ?auto_731756 ?auto_731758 ) ) ( not ( = ?auto_731756 ?auto_731759 ) ) ( not ( = ?auto_731756 ?auto_731760 ) ) ( not ( = ?auto_731756 ?auto_731761 ) ) ( not ( = ?auto_731756 ?auto_731762 ) ) ( not ( = ?auto_731756 ?auto_731763 ) ) ( not ( = ?auto_731756 ?auto_731764 ) ) ( not ( = ?auto_731756 ?auto_731765 ) ) ( not ( = ?auto_731756 ?auto_731766 ) ) ( not ( = ?auto_731757 ?auto_731758 ) ) ( not ( = ?auto_731757 ?auto_731759 ) ) ( not ( = ?auto_731757 ?auto_731760 ) ) ( not ( = ?auto_731757 ?auto_731761 ) ) ( not ( = ?auto_731757 ?auto_731762 ) ) ( not ( = ?auto_731757 ?auto_731763 ) ) ( not ( = ?auto_731757 ?auto_731764 ) ) ( not ( = ?auto_731757 ?auto_731765 ) ) ( not ( = ?auto_731757 ?auto_731766 ) ) ( not ( = ?auto_731758 ?auto_731759 ) ) ( not ( = ?auto_731758 ?auto_731760 ) ) ( not ( = ?auto_731758 ?auto_731761 ) ) ( not ( = ?auto_731758 ?auto_731762 ) ) ( not ( = ?auto_731758 ?auto_731763 ) ) ( not ( = ?auto_731758 ?auto_731764 ) ) ( not ( = ?auto_731758 ?auto_731765 ) ) ( not ( = ?auto_731758 ?auto_731766 ) ) ( not ( = ?auto_731759 ?auto_731760 ) ) ( not ( = ?auto_731759 ?auto_731761 ) ) ( not ( = ?auto_731759 ?auto_731762 ) ) ( not ( = ?auto_731759 ?auto_731763 ) ) ( not ( = ?auto_731759 ?auto_731764 ) ) ( not ( = ?auto_731759 ?auto_731765 ) ) ( not ( = ?auto_731759 ?auto_731766 ) ) ( not ( = ?auto_731760 ?auto_731761 ) ) ( not ( = ?auto_731760 ?auto_731762 ) ) ( not ( = ?auto_731760 ?auto_731763 ) ) ( not ( = ?auto_731760 ?auto_731764 ) ) ( not ( = ?auto_731760 ?auto_731765 ) ) ( not ( = ?auto_731760 ?auto_731766 ) ) ( not ( = ?auto_731761 ?auto_731762 ) ) ( not ( = ?auto_731761 ?auto_731763 ) ) ( not ( = ?auto_731761 ?auto_731764 ) ) ( not ( = ?auto_731761 ?auto_731765 ) ) ( not ( = ?auto_731761 ?auto_731766 ) ) ( not ( = ?auto_731762 ?auto_731763 ) ) ( not ( = ?auto_731762 ?auto_731764 ) ) ( not ( = ?auto_731762 ?auto_731765 ) ) ( not ( = ?auto_731762 ?auto_731766 ) ) ( not ( = ?auto_731763 ?auto_731764 ) ) ( not ( = ?auto_731763 ?auto_731765 ) ) ( not ( = ?auto_731763 ?auto_731766 ) ) ( not ( = ?auto_731764 ?auto_731765 ) ) ( not ( = ?auto_731764 ?auto_731766 ) ) ( not ( = ?auto_731765 ?auto_731766 ) ) ( ON ?auto_731765 ?auto_731766 ) ( ON ?auto_731764 ?auto_731765 ) ( ON ?auto_731763 ?auto_731764 ) ( ON ?auto_731762 ?auto_731763 ) ( ON ?auto_731761 ?auto_731762 ) ( ON ?auto_731760 ?auto_731761 ) ( ON ?auto_731759 ?auto_731760 ) ( ON ?auto_731758 ?auto_731759 ) ( ON ?auto_731757 ?auto_731758 ) ( CLEAR ?auto_731755 ) ( ON ?auto_731756 ?auto_731757 ) ( CLEAR ?auto_731756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_731750 ?auto_731751 ?auto_731752 ?auto_731753 ?auto_731754 ?auto_731755 ?auto_731756 )
      ( MAKE-17PILE ?auto_731750 ?auto_731751 ?auto_731752 ?auto_731753 ?auto_731754 ?auto_731755 ?auto_731756 ?auto_731757 ?auto_731758 ?auto_731759 ?auto_731760 ?auto_731761 ?auto_731762 ?auto_731763 ?auto_731764 ?auto_731765 ?auto_731766 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731784 - BLOCK
      ?auto_731785 - BLOCK
      ?auto_731786 - BLOCK
      ?auto_731787 - BLOCK
      ?auto_731788 - BLOCK
      ?auto_731789 - BLOCK
      ?auto_731790 - BLOCK
      ?auto_731791 - BLOCK
      ?auto_731792 - BLOCK
      ?auto_731793 - BLOCK
      ?auto_731794 - BLOCK
      ?auto_731795 - BLOCK
      ?auto_731796 - BLOCK
      ?auto_731797 - BLOCK
      ?auto_731798 - BLOCK
      ?auto_731799 - BLOCK
      ?auto_731800 - BLOCK
    )
    :vars
    (
      ?auto_731801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731800 ?auto_731801 ) ( ON-TABLE ?auto_731784 ) ( ON ?auto_731785 ?auto_731784 ) ( ON ?auto_731786 ?auto_731785 ) ( ON ?auto_731787 ?auto_731786 ) ( ON ?auto_731788 ?auto_731787 ) ( not ( = ?auto_731784 ?auto_731785 ) ) ( not ( = ?auto_731784 ?auto_731786 ) ) ( not ( = ?auto_731784 ?auto_731787 ) ) ( not ( = ?auto_731784 ?auto_731788 ) ) ( not ( = ?auto_731784 ?auto_731789 ) ) ( not ( = ?auto_731784 ?auto_731790 ) ) ( not ( = ?auto_731784 ?auto_731791 ) ) ( not ( = ?auto_731784 ?auto_731792 ) ) ( not ( = ?auto_731784 ?auto_731793 ) ) ( not ( = ?auto_731784 ?auto_731794 ) ) ( not ( = ?auto_731784 ?auto_731795 ) ) ( not ( = ?auto_731784 ?auto_731796 ) ) ( not ( = ?auto_731784 ?auto_731797 ) ) ( not ( = ?auto_731784 ?auto_731798 ) ) ( not ( = ?auto_731784 ?auto_731799 ) ) ( not ( = ?auto_731784 ?auto_731800 ) ) ( not ( = ?auto_731784 ?auto_731801 ) ) ( not ( = ?auto_731785 ?auto_731786 ) ) ( not ( = ?auto_731785 ?auto_731787 ) ) ( not ( = ?auto_731785 ?auto_731788 ) ) ( not ( = ?auto_731785 ?auto_731789 ) ) ( not ( = ?auto_731785 ?auto_731790 ) ) ( not ( = ?auto_731785 ?auto_731791 ) ) ( not ( = ?auto_731785 ?auto_731792 ) ) ( not ( = ?auto_731785 ?auto_731793 ) ) ( not ( = ?auto_731785 ?auto_731794 ) ) ( not ( = ?auto_731785 ?auto_731795 ) ) ( not ( = ?auto_731785 ?auto_731796 ) ) ( not ( = ?auto_731785 ?auto_731797 ) ) ( not ( = ?auto_731785 ?auto_731798 ) ) ( not ( = ?auto_731785 ?auto_731799 ) ) ( not ( = ?auto_731785 ?auto_731800 ) ) ( not ( = ?auto_731785 ?auto_731801 ) ) ( not ( = ?auto_731786 ?auto_731787 ) ) ( not ( = ?auto_731786 ?auto_731788 ) ) ( not ( = ?auto_731786 ?auto_731789 ) ) ( not ( = ?auto_731786 ?auto_731790 ) ) ( not ( = ?auto_731786 ?auto_731791 ) ) ( not ( = ?auto_731786 ?auto_731792 ) ) ( not ( = ?auto_731786 ?auto_731793 ) ) ( not ( = ?auto_731786 ?auto_731794 ) ) ( not ( = ?auto_731786 ?auto_731795 ) ) ( not ( = ?auto_731786 ?auto_731796 ) ) ( not ( = ?auto_731786 ?auto_731797 ) ) ( not ( = ?auto_731786 ?auto_731798 ) ) ( not ( = ?auto_731786 ?auto_731799 ) ) ( not ( = ?auto_731786 ?auto_731800 ) ) ( not ( = ?auto_731786 ?auto_731801 ) ) ( not ( = ?auto_731787 ?auto_731788 ) ) ( not ( = ?auto_731787 ?auto_731789 ) ) ( not ( = ?auto_731787 ?auto_731790 ) ) ( not ( = ?auto_731787 ?auto_731791 ) ) ( not ( = ?auto_731787 ?auto_731792 ) ) ( not ( = ?auto_731787 ?auto_731793 ) ) ( not ( = ?auto_731787 ?auto_731794 ) ) ( not ( = ?auto_731787 ?auto_731795 ) ) ( not ( = ?auto_731787 ?auto_731796 ) ) ( not ( = ?auto_731787 ?auto_731797 ) ) ( not ( = ?auto_731787 ?auto_731798 ) ) ( not ( = ?auto_731787 ?auto_731799 ) ) ( not ( = ?auto_731787 ?auto_731800 ) ) ( not ( = ?auto_731787 ?auto_731801 ) ) ( not ( = ?auto_731788 ?auto_731789 ) ) ( not ( = ?auto_731788 ?auto_731790 ) ) ( not ( = ?auto_731788 ?auto_731791 ) ) ( not ( = ?auto_731788 ?auto_731792 ) ) ( not ( = ?auto_731788 ?auto_731793 ) ) ( not ( = ?auto_731788 ?auto_731794 ) ) ( not ( = ?auto_731788 ?auto_731795 ) ) ( not ( = ?auto_731788 ?auto_731796 ) ) ( not ( = ?auto_731788 ?auto_731797 ) ) ( not ( = ?auto_731788 ?auto_731798 ) ) ( not ( = ?auto_731788 ?auto_731799 ) ) ( not ( = ?auto_731788 ?auto_731800 ) ) ( not ( = ?auto_731788 ?auto_731801 ) ) ( not ( = ?auto_731789 ?auto_731790 ) ) ( not ( = ?auto_731789 ?auto_731791 ) ) ( not ( = ?auto_731789 ?auto_731792 ) ) ( not ( = ?auto_731789 ?auto_731793 ) ) ( not ( = ?auto_731789 ?auto_731794 ) ) ( not ( = ?auto_731789 ?auto_731795 ) ) ( not ( = ?auto_731789 ?auto_731796 ) ) ( not ( = ?auto_731789 ?auto_731797 ) ) ( not ( = ?auto_731789 ?auto_731798 ) ) ( not ( = ?auto_731789 ?auto_731799 ) ) ( not ( = ?auto_731789 ?auto_731800 ) ) ( not ( = ?auto_731789 ?auto_731801 ) ) ( not ( = ?auto_731790 ?auto_731791 ) ) ( not ( = ?auto_731790 ?auto_731792 ) ) ( not ( = ?auto_731790 ?auto_731793 ) ) ( not ( = ?auto_731790 ?auto_731794 ) ) ( not ( = ?auto_731790 ?auto_731795 ) ) ( not ( = ?auto_731790 ?auto_731796 ) ) ( not ( = ?auto_731790 ?auto_731797 ) ) ( not ( = ?auto_731790 ?auto_731798 ) ) ( not ( = ?auto_731790 ?auto_731799 ) ) ( not ( = ?auto_731790 ?auto_731800 ) ) ( not ( = ?auto_731790 ?auto_731801 ) ) ( not ( = ?auto_731791 ?auto_731792 ) ) ( not ( = ?auto_731791 ?auto_731793 ) ) ( not ( = ?auto_731791 ?auto_731794 ) ) ( not ( = ?auto_731791 ?auto_731795 ) ) ( not ( = ?auto_731791 ?auto_731796 ) ) ( not ( = ?auto_731791 ?auto_731797 ) ) ( not ( = ?auto_731791 ?auto_731798 ) ) ( not ( = ?auto_731791 ?auto_731799 ) ) ( not ( = ?auto_731791 ?auto_731800 ) ) ( not ( = ?auto_731791 ?auto_731801 ) ) ( not ( = ?auto_731792 ?auto_731793 ) ) ( not ( = ?auto_731792 ?auto_731794 ) ) ( not ( = ?auto_731792 ?auto_731795 ) ) ( not ( = ?auto_731792 ?auto_731796 ) ) ( not ( = ?auto_731792 ?auto_731797 ) ) ( not ( = ?auto_731792 ?auto_731798 ) ) ( not ( = ?auto_731792 ?auto_731799 ) ) ( not ( = ?auto_731792 ?auto_731800 ) ) ( not ( = ?auto_731792 ?auto_731801 ) ) ( not ( = ?auto_731793 ?auto_731794 ) ) ( not ( = ?auto_731793 ?auto_731795 ) ) ( not ( = ?auto_731793 ?auto_731796 ) ) ( not ( = ?auto_731793 ?auto_731797 ) ) ( not ( = ?auto_731793 ?auto_731798 ) ) ( not ( = ?auto_731793 ?auto_731799 ) ) ( not ( = ?auto_731793 ?auto_731800 ) ) ( not ( = ?auto_731793 ?auto_731801 ) ) ( not ( = ?auto_731794 ?auto_731795 ) ) ( not ( = ?auto_731794 ?auto_731796 ) ) ( not ( = ?auto_731794 ?auto_731797 ) ) ( not ( = ?auto_731794 ?auto_731798 ) ) ( not ( = ?auto_731794 ?auto_731799 ) ) ( not ( = ?auto_731794 ?auto_731800 ) ) ( not ( = ?auto_731794 ?auto_731801 ) ) ( not ( = ?auto_731795 ?auto_731796 ) ) ( not ( = ?auto_731795 ?auto_731797 ) ) ( not ( = ?auto_731795 ?auto_731798 ) ) ( not ( = ?auto_731795 ?auto_731799 ) ) ( not ( = ?auto_731795 ?auto_731800 ) ) ( not ( = ?auto_731795 ?auto_731801 ) ) ( not ( = ?auto_731796 ?auto_731797 ) ) ( not ( = ?auto_731796 ?auto_731798 ) ) ( not ( = ?auto_731796 ?auto_731799 ) ) ( not ( = ?auto_731796 ?auto_731800 ) ) ( not ( = ?auto_731796 ?auto_731801 ) ) ( not ( = ?auto_731797 ?auto_731798 ) ) ( not ( = ?auto_731797 ?auto_731799 ) ) ( not ( = ?auto_731797 ?auto_731800 ) ) ( not ( = ?auto_731797 ?auto_731801 ) ) ( not ( = ?auto_731798 ?auto_731799 ) ) ( not ( = ?auto_731798 ?auto_731800 ) ) ( not ( = ?auto_731798 ?auto_731801 ) ) ( not ( = ?auto_731799 ?auto_731800 ) ) ( not ( = ?auto_731799 ?auto_731801 ) ) ( not ( = ?auto_731800 ?auto_731801 ) ) ( ON ?auto_731799 ?auto_731800 ) ( ON ?auto_731798 ?auto_731799 ) ( ON ?auto_731797 ?auto_731798 ) ( ON ?auto_731796 ?auto_731797 ) ( ON ?auto_731795 ?auto_731796 ) ( ON ?auto_731794 ?auto_731795 ) ( ON ?auto_731793 ?auto_731794 ) ( ON ?auto_731792 ?auto_731793 ) ( ON ?auto_731791 ?auto_731792 ) ( ON ?auto_731790 ?auto_731791 ) ( CLEAR ?auto_731788 ) ( ON ?auto_731789 ?auto_731790 ) ( CLEAR ?auto_731789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_731784 ?auto_731785 ?auto_731786 ?auto_731787 ?auto_731788 ?auto_731789 )
      ( MAKE-17PILE ?auto_731784 ?auto_731785 ?auto_731786 ?auto_731787 ?auto_731788 ?auto_731789 ?auto_731790 ?auto_731791 ?auto_731792 ?auto_731793 ?auto_731794 ?auto_731795 ?auto_731796 ?auto_731797 ?auto_731798 ?auto_731799 ?auto_731800 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731819 - BLOCK
      ?auto_731820 - BLOCK
      ?auto_731821 - BLOCK
      ?auto_731822 - BLOCK
      ?auto_731823 - BLOCK
      ?auto_731824 - BLOCK
      ?auto_731825 - BLOCK
      ?auto_731826 - BLOCK
      ?auto_731827 - BLOCK
      ?auto_731828 - BLOCK
      ?auto_731829 - BLOCK
      ?auto_731830 - BLOCK
      ?auto_731831 - BLOCK
      ?auto_731832 - BLOCK
      ?auto_731833 - BLOCK
      ?auto_731834 - BLOCK
      ?auto_731835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731835 ) ( ON-TABLE ?auto_731819 ) ( ON ?auto_731820 ?auto_731819 ) ( ON ?auto_731821 ?auto_731820 ) ( ON ?auto_731822 ?auto_731821 ) ( ON ?auto_731823 ?auto_731822 ) ( not ( = ?auto_731819 ?auto_731820 ) ) ( not ( = ?auto_731819 ?auto_731821 ) ) ( not ( = ?auto_731819 ?auto_731822 ) ) ( not ( = ?auto_731819 ?auto_731823 ) ) ( not ( = ?auto_731819 ?auto_731824 ) ) ( not ( = ?auto_731819 ?auto_731825 ) ) ( not ( = ?auto_731819 ?auto_731826 ) ) ( not ( = ?auto_731819 ?auto_731827 ) ) ( not ( = ?auto_731819 ?auto_731828 ) ) ( not ( = ?auto_731819 ?auto_731829 ) ) ( not ( = ?auto_731819 ?auto_731830 ) ) ( not ( = ?auto_731819 ?auto_731831 ) ) ( not ( = ?auto_731819 ?auto_731832 ) ) ( not ( = ?auto_731819 ?auto_731833 ) ) ( not ( = ?auto_731819 ?auto_731834 ) ) ( not ( = ?auto_731819 ?auto_731835 ) ) ( not ( = ?auto_731820 ?auto_731821 ) ) ( not ( = ?auto_731820 ?auto_731822 ) ) ( not ( = ?auto_731820 ?auto_731823 ) ) ( not ( = ?auto_731820 ?auto_731824 ) ) ( not ( = ?auto_731820 ?auto_731825 ) ) ( not ( = ?auto_731820 ?auto_731826 ) ) ( not ( = ?auto_731820 ?auto_731827 ) ) ( not ( = ?auto_731820 ?auto_731828 ) ) ( not ( = ?auto_731820 ?auto_731829 ) ) ( not ( = ?auto_731820 ?auto_731830 ) ) ( not ( = ?auto_731820 ?auto_731831 ) ) ( not ( = ?auto_731820 ?auto_731832 ) ) ( not ( = ?auto_731820 ?auto_731833 ) ) ( not ( = ?auto_731820 ?auto_731834 ) ) ( not ( = ?auto_731820 ?auto_731835 ) ) ( not ( = ?auto_731821 ?auto_731822 ) ) ( not ( = ?auto_731821 ?auto_731823 ) ) ( not ( = ?auto_731821 ?auto_731824 ) ) ( not ( = ?auto_731821 ?auto_731825 ) ) ( not ( = ?auto_731821 ?auto_731826 ) ) ( not ( = ?auto_731821 ?auto_731827 ) ) ( not ( = ?auto_731821 ?auto_731828 ) ) ( not ( = ?auto_731821 ?auto_731829 ) ) ( not ( = ?auto_731821 ?auto_731830 ) ) ( not ( = ?auto_731821 ?auto_731831 ) ) ( not ( = ?auto_731821 ?auto_731832 ) ) ( not ( = ?auto_731821 ?auto_731833 ) ) ( not ( = ?auto_731821 ?auto_731834 ) ) ( not ( = ?auto_731821 ?auto_731835 ) ) ( not ( = ?auto_731822 ?auto_731823 ) ) ( not ( = ?auto_731822 ?auto_731824 ) ) ( not ( = ?auto_731822 ?auto_731825 ) ) ( not ( = ?auto_731822 ?auto_731826 ) ) ( not ( = ?auto_731822 ?auto_731827 ) ) ( not ( = ?auto_731822 ?auto_731828 ) ) ( not ( = ?auto_731822 ?auto_731829 ) ) ( not ( = ?auto_731822 ?auto_731830 ) ) ( not ( = ?auto_731822 ?auto_731831 ) ) ( not ( = ?auto_731822 ?auto_731832 ) ) ( not ( = ?auto_731822 ?auto_731833 ) ) ( not ( = ?auto_731822 ?auto_731834 ) ) ( not ( = ?auto_731822 ?auto_731835 ) ) ( not ( = ?auto_731823 ?auto_731824 ) ) ( not ( = ?auto_731823 ?auto_731825 ) ) ( not ( = ?auto_731823 ?auto_731826 ) ) ( not ( = ?auto_731823 ?auto_731827 ) ) ( not ( = ?auto_731823 ?auto_731828 ) ) ( not ( = ?auto_731823 ?auto_731829 ) ) ( not ( = ?auto_731823 ?auto_731830 ) ) ( not ( = ?auto_731823 ?auto_731831 ) ) ( not ( = ?auto_731823 ?auto_731832 ) ) ( not ( = ?auto_731823 ?auto_731833 ) ) ( not ( = ?auto_731823 ?auto_731834 ) ) ( not ( = ?auto_731823 ?auto_731835 ) ) ( not ( = ?auto_731824 ?auto_731825 ) ) ( not ( = ?auto_731824 ?auto_731826 ) ) ( not ( = ?auto_731824 ?auto_731827 ) ) ( not ( = ?auto_731824 ?auto_731828 ) ) ( not ( = ?auto_731824 ?auto_731829 ) ) ( not ( = ?auto_731824 ?auto_731830 ) ) ( not ( = ?auto_731824 ?auto_731831 ) ) ( not ( = ?auto_731824 ?auto_731832 ) ) ( not ( = ?auto_731824 ?auto_731833 ) ) ( not ( = ?auto_731824 ?auto_731834 ) ) ( not ( = ?auto_731824 ?auto_731835 ) ) ( not ( = ?auto_731825 ?auto_731826 ) ) ( not ( = ?auto_731825 ?auto_731827 ) ) ( not ( = ?auto_731825 ?auto_731828 ) ) ( not ( = ?auto_731825 ?auto_731829 ) ) ( not ( = ?auto_731825 ?auto_731830 ) ) ( not ( = ?auto_731825 ?auto_731831 ) ) ( not ( = ?auto_731825 ?auto_731832 ) ) ( not ( = ?auto_731825 ?auto_731833 ) ) ( not ( = ?auto_731825 ?auto_731834 ) ) ( not ( = ?auto_731825 ?auto_731835 ) ) ( not ( = ?auto_731826 ?auto_731827 ) ) ( not ( = ?auto_731826 ?auto_731828 ) ) ( not ( = ?auto_731826 ?auto_731829 ) ) ( not ( = ?auto_731826 ?auto_731830 ) ) ( not ( = ?auto_731826 ?auto_731831 ) ) ( not ( = ?auto_731826 ?auto_731832 ) ) ( not ( = ?auto_731826 ?auto_731833 ) ) ( not ( = ?auto_731826 ?auto_731834 ) ) ( not ( = ?auto_731826 ?auto_731835 ) ) ( not ( = ?auto_731827 ?auto_731828 ) ) ( not ( = ?auto_731827 ?auto_731829 ) ) ( not ( = ?auto_731827 ?auto_731830 ) ) ( not ( = ?auto_731827 ?auto_731831 ) ) ( not ( = ?auto_731827 ?auto_731832 ) ) ( not ( = ?auto_731827 ?auto_731833 ) ) ( not ( = ?auto_731827 ?auto_731834 ) ) ( not ( = ?auto_731827 ?auto_731835 ) ) ( not ( = ?auto_731828 ?auto_731829 ) ) ( not ( = ?auto_731828 ?auto_731830 ) ) ( not ( = ?auto_731828 ?auto_731831 ) ) ( not ( = ?auto_731828 ?auto_731832 ) ) ( not ( = ?auto_731828 ?auto_731833 ) ) ( not ( = ?auto_731828 ?auto_731834 ) ) ( not ( = ?auto_731828 ?auto_731835 ) ) ( not ( = ?auto_731829 ?auto_731830 ) ) ( not ( = ?auto_731829 ?auto_731831 ) ) ( not ( = ?auto_731829 ?auto_731832 ) ) ( not ( = ?auto_731829 ?auto_731833 ) ) ( not ( = ?auto_731829 ?auto_731834 ) ) ( not ( = ?auto_731829 ?auto_731835 ) ) ( not ( = ?auto_731830 ?auto_731831 ) ) ( not ( = ?auto_731830 ?auto_731832 ) ) ( not ( = ?auto_731830 ?auto_731833 ) ) ( not ( = ?auto_731830 ?auto_731834 ) ) ( not ( = ?auto_731830 ?auto_731835 ) ) ( not ( = ?auto_731831 ?auto_731832 ) ) ( not ( = ?auto_731831 ?auto_731833 ) ) ( not ( = ?auto_731831 ?auto_731834 ) ) ( not ( = ?auto_731831 ?auto_731835 ) ) ( not ( = ?auto_731832 ?auto_731833 ) ) ( not ( = ?auto_731832 ?auto_731834 ) ) ( not ( = ?auto_731832 ?auto_731835 ) ) ( not ( = ?auto_731833 ?auto_731834 ) ) ( not ( = ?auto_731833 ?auto_731835 ) ) ( not ( = ?auto_731834 ?auto_731835 ) ) ( ON ?auto_731834 ?auto_731835 ) ( ON ?auto_731833 ?auto_731834 ) ( ON ?auto_731832 ?auto_731833 ) ( ON ?auto_731831 ?auto_731832 ) ( ON ?auto_731830 ?auto_731831 ) ( ON ?auto_731829 ?auto_731830 ) ( ON ?auto_731828 ?auto_731829 ) ( ON ?auto_731827 ?auto_731828 ) ( ON ?auto_731826 ?auto_731827 ) ( ON ?auto_731825 ?auto_731826 ) ( CLEAR ?auto_731823 ) ( ON ?auto_731824 ?auto_731825 ) ( CLEAR ?auto_731824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_731819 ?auto_731820 ?auto_731821 ?auto_731822 ?auto_731823 ?auto_731824 )
      ( MAKE-17PILE ?auto_731819 ?auto_731820 ?auto_731821 ?auto_731822 ?auto_731823 ?auto_731824 ?auto_731825 ?auto_731826 ?auto_731827 ?auto_731828 ?auto_731829 ?auto_731830 ?auto_731831 ?auto_731832 ?auto_731833 ?auto_731834 ?auto_731835 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731853 - BLOCK
      ?auto_731854 - BLOCK
      ?auto_731855 - BLOCK
      ?auto_731856 - BLOCK
      ?auto_731857 - BLOCK
      ?auto_731858 - BLOCK
      ?auto_731859 - BLOCK
      ?auto_731860 - BLOCK
      ?auto_731861 - BLOCK
      ?auto_731862 - BLOCK
      ?auto_731863 - BLOCK
      ?auto_731864 - BLOCK
      ?auto_731865 - BLOCK
      ?auto_731866 - BLOCK
      ?auto_731867 - BLOCK
      ?auto_731868 - BLOCK
      ?auto_731869 - BLOCK
    )
    :vars
    (
      ?auto_731870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731869 ?auto_731870 ) ( ON-TABLE ?auto_731853 ) ( ON ?auto_731854 ?auto_731853 ) ( ON ?auto_731855 ?auto_731854 ) ( ON ?auto_731856 ?auto_731855 ) ( not ( = ?auto_731853 ?auto_731854 ) ) ( not ( = ?auto_731853 ?auto_731855 ) ) ( not ( = ?auto_731853 ?auto_731856 ) ) ( not ( = ?auto_731853 ?auto_731857 ) ) ( not ( = ?auto_731853 ?auto_731858 ) ) ( not ( = ?auto_731853 ?auto_731859 ) ) ( not ( = ?auto_731853 ?auto_731860 ) ) ( not ( = ?auto_731853 ?auto_731861 ) ) ( not ( = ?auto_731853 ?auto_731862 ) ) ( not ( = ?auto_731853 ?auto_731863 ) ) ( not ( = ?auto_731853 ?auto_731864 ) ) ( not ( = ?auto_731853 ?auto_731865 ) ) ( not ( = ?auto_731853 ?auto_731866 ) ) ( not ( = ?auto_731853 ?auto_731867 ) ) ( not ( = ?auto_731853 ?auto_731868 ) ) ( not ( = ?auto_731853 ?auto_731869 ) ) ( not ( = ?auto_731853 ?auto_731870 ) ) ( not ( = ?auto_731854 ?auto_731855 ) ) ( not ( = ?auto_731854 ?auto_731856 ) ) ( not ( = ?auto_731854 ?auto_731857 ) ) ( not ( = ?auto_731854 ?auto_731858 ) ) ( not ( = ?auto_731854 ?auto_731859 ) ) ( not ( = ?auto_731854 ?auto_731860 ) ) ( not ( = ?auto_731854 ?auto_731861 ) ) ( not ( = ?auto_731854 ?auto_731862 ) ) ( not ( = ?auto_731854 ?auto_731863 ) ) ( not ( = ?auto_731854 ?auto_731864 ) ) ( not ( = ?auto_731854 ?auto_731865 ) ) ( not ( = ?auto_731854 ?auto_731866 ) ) ( not ( = ?auto_731854 ?auto_731867 ) ) ( not ( = ?auto_731854 ?auto_731868 ) ) ( not ( = ?auto_731854 ?auto_731869 ) ) ( not ( = ?auto_731854 ?auto_731870 ) ) ( not ( = ?auto_731855 ?auto_731856 ) ) ( not ( = ?auto_731855 ?auto_731857 ) ) ( not ( = ?auto_731855 ?auto_731858 ) ) ( not ( = ?auto_731855 ?auto_731859 ) ) ( not ( = ?auto_731855 ?auto_731860 ) ) ( not ( = ?auto_731855 ?auto_731861 ) ) ( not ( = ?auto_731855 ?auto_731862 ) ) ( not ( = ?auto_731855 ?auto_731863 ) ) ( not ( = ?auto_731855 ?auto_731864 ) ) ( not ( = ?auto_731855 ?auto_731865 ) ) ( not ( = ?auto_731855 ?auto_731866 ) ) ( not ( = ?auto_731855 ?auto_731867 ) ) ( not ( = ?auto_731855 ?auto_731868 ) ) ( not ( = ?auto_731855 ?auto_731869 ) ) ( not ( = ?auto_731855 ?auto_731870 ) ) ( not ( = ?auto_731856 ?auto_731857 ) ) ( not ( = ?auto_731856 ?auto_731858 ) ) ( not ( = ?auto_731856 ?auto_731859 ) ) ( not ( = ?auto_731856 ?auto_731860 ) ) ( not ( = ?auto_731856 ?auto_731861 ) ) ( not ( = ?auto_731856 ?auto_731862 ) ) ( not ( = ?auto_731856 ?auto_731863 ) ) ( not ( = ?auto_731856 ?auto_731864 ) ) ( not ( = ?auto_731856 ?auto_731865 ) ) ( not ( = ?auto_731856 ?auto_731866 ) ) ( not ( = ?auto_731856 ?auto_731867 ) ) ( not ( = ?auto_731856 ?auto_731868 ) ) ( not ( = ?auto_731856 ?auto_731869 ) ) ( not ( = ?auto_731856 ?auto_731870 ) ) ( not ( = ?auto_731857 ?auto_731858 ) ) ( not ( = ?auto_731857 ?auto_731859 ) ) ( not ( = ?auto_731857 ?auto_731860 ) ) ( not ( = ?auto_731857 ?auto_731861 ) ) ( not ( = ?auto_731857 ?auto_731862 ) ) ( not ( = ?auto_731857 ?auto_731863 ) ) ( not ( = ?auto_731857 ?auto_731864 ) ) ( not ( = ?auto_731857 ?auto_731865 ) ) ( not ( = ?auto_731857 ?auto_731866 ) ) ( not ( = ?auto_731857 ?auto_731867 ) ) ( not ( = ?auto_731857 ?auto_731868 ) ) ( not ( = ?auto_731857 ?auto_731869 ) ) ( not ( = ?auto_731857 ?auto_731870 ) ) ( not ( = ?auto_731858 ?auto_731859 ) ) ( not ( = ?auto_731858 ?auto_731860 ) ) ( not ( = ?auto_731858 ?auto_731861 ) ) ( not ( = ?auto_731858 ?auto_731862 ) ) ( not ( = ?auto_731858 ?auto_731863 ) ) ( not ( = ?auto_731858 ?auto_731864 ) ) ( not ( = ?auto_731858 ?auto_731865 ) ) ( not ( = ?auto_731858 ?auto_731866 ) ) ( not ( = ?auto_731858 ?auto_731867 ) ) ( not ( = ?auto_731858 ?auto_731868 ) ) ( not ( = ?auto_731858 ?auto_731869 ) ) ( not ( = ?auto_731858 ?auto_731870 ) ) ( not ( = ?auto_731859 ?auto_731860 ) ) ( not ( = ?auto_731859 ?auto_731861 ) ) ( not ( = ?auto_731859 ?auto_731862 ) ) ( not ( = ?auto_731859 ?auto_731863 ) ) ( not ( = ?auto_731859 ?auto_731864 ) ) ( not ( = ?auto_731859 ?auto_731865 ) ) ( not ( = ?auto_731859 ?auto_731866 ) ) ( not ( = ?auto_731859 ?auto_731867 ) ) ( not ( = ?auto_731859 ?auto_731868 ) ) ( not ( = ?auto_731859 ?auto_731869 ) ) ( not ( = ?auto_731859 ?auto_731870 ) ) ( not ( = ?auto_731860 ?auto_731861 ) ) ( not ( = ?auto_731860 ?auto_731862 ) ) ( not ( = ?auto_731860 ?auto_731863 ) ) ( not ( = ?auto_731860 ?auto_731864 ) ) ( not ( = ?auto_731860 ?auto_731865 ) ) ( not ( = ?auto_731860 ?auto_731866 ) ) ( not ( = ?auto_731860 ?auto_731867 ) ) ( not ( = ?auto_731860 ?auto_731868 ) ) ( not ( = ?auto_731860 ?auto_731869 ) ) ( not ( = ?auto_731860 ?auto_731870 ) ) ( not ( = ?auto_731861 ?auto_731862 ) ) ( not ( = ?auto_731861 ?auto_731863 ) ) ( not ( = ?auto_731861 ?auto_731864 ) ) ( not ( = ?auto_731861 ?auto_731865 ) ) ( not ( = ?auto_731861 ?auto_731866 ) ) ( not ( = ?auto_731861 ?auto_731867 ) ) ( not ( = ?auto_731861 ?auto_731868 ) ) ( not ( = ?auto_731861 ?auto_731869 ) ) ( not ( = ?auto_731861 ?auto_731870 ) ) ( not ( = ?auto_731862 ?auto_731863 ) ) ( not ( = ?auto_731862 ?auto_731864 ) ) ( not ( = ?auto_731862 ?auto_731865 ) ) ( not ( = ?auto_731862 ?auto_731866 ) ) ( not ( = ?auto_731862 ?auto_731867 ) ) ( not ( = ?auto_731862 ?auto_731868 ) ) ( not ( = ?auto_731862 ?auto_731869 ) ) ( not ( = ?auto_731862 ?auto_731870 ) ) ( not ( = ?auto_731863 ?auto_731864 ) ) ( not ( = ?auto_731863 ?auto_731865 ) ) ( not ( = ?auto_731863 ?auto_731866 ) ) ( not ( = ?auto_731863 ?auto_731867 ) ) ( not ( = ?auto_731863 ?auto_731868 ) ) ( not ( = ?auto_731863 ?auto_731869 ) ) ( not ( = ?auto_731863 ?auto_731870 ) ) ( not ( = ?auto_731864 ?auto_731865 ) ) ( not ( = ?auto_731864 ?auto_731866 ) ) ( not ( = ?auto_731864 ?auto_731867 ) ) ( not ( = ?auto_731864 ?auto_731868 ) ) ( not ( = ?auto_731864 ?auto_731869 ) ) ( not ( = ?auto_731864 ?auto_731870 ) ) ( not ( = ?auto_731865 ?auto_731866 ) ) ( not ( = ?auto_731865 ?auto_731867 ) ) ( not ( = ?auto_731865 ?auto_731868 ) ) ( not ( = ?auto_731865 ?auto_731869 ) ) ( not ( = ?auto_731865 ?auto_731870 ) ) ( not ( = ?auto_731866 ?auto_731867 ) ) ( not ( = ?auto_731866 ?auto_731868 ) ) ( not ( = ?auto_731866 ?auto_731869 ) ) ( not ( = ?auto_731866 ?auto_731870 ) ) ( not ( = ?auto_731867 ?auto_731868 ) ) ( not ( = ?auto_731867 ?auto_731869 ) ) ( not ( = ?auto_731867 ?auto_731870 ) ) ( not ( = ?auto_731868 ?auto_731869 ) ) ( not ( = ?auto_731868 ?auto_731870 ) ) ( not ( = ?auto_731869 ?auto_731870 ) ) ( ON ?auto_731868 ?auto_731869 ) ( ON ?auto_731867 ?auto_731868 ) ( ON ?auto_731866 ?auto_731867 ) ( ON ?auto_731865 ?auto_731866 ) ( ON ?auto_731864 ?auto_731865 ) ( ON ?auto_731863 ?auto_731864 ) ( ON ?auto_731862 ?auto_731863 ) ( ON ?auto_731861 ?auto_731862 ) ( ON ?auto_731860 ?auto_731861 ) ( ON ?auto_731859 ?auto_731860 ) ( ON ?auto_731858 ?auto_731859 ) ( CLEAR ?auto_731856 ) ( ON ?auto_731857 ?auto_731858 ) ( CLEAR ?auto_731857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_731853 ?auto_731854 ?auto_731855 ?auto_731856 ?auto_731857 )
      ( MAKE-17PILE ?auto_731853 ?auto_731854 ?auto_731855 ?auto_731856 ?auto_731857 ?auto_731858 ?auto_731859 ?auto_731860 ?auto_731861 ?auto_731862 ?auto_731863 ?auto_731864 ?auto_731865 ?auto_731866 ?auto_731867 ?auto_731868 ?auto_731869 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731888 - BLOCK
      ?auto_731889 - BLOCK
      ?auto_731890 - BLOCK
      ?auto_731891 - BLOCK
      ?auto_731892 - BLOCK
      ?auto_731893 - BLOCK
      ?auto_731894 - BLOCK
      ?auto_731895 - BLOCK
      ?auto_731896 - BLOCK
      ?auto_731897 - BLOCK
      ?auto_731898 - BLOCK
      ?auto_731899 - BLOCK
      ?auto_731900 - BLOCK
      ?auto_731901 - BLOCK
      ?auto_731902 - BLOCK
      ?auto_731903 - BLOCK
      ?auto_731904 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731904 ) ( ON-TABLE ?auto_731888 ) ( ON ?auto_731889 ?auto_731888 ) ( ON ?auto_731890 ?auto_731889 ) ( ON ?auto_731891 ?auto_731890 ) ( not ( = ?auto_731888 ?auto_731889 ) ) ( not ( = ?auto_731888 ?auto_731890 ) ) ( not ( = ?auto_731888 ?auto_731891 ) ) ( not ( = ?auto_731888 ?auto_731892 ) ) ( not ( = ?auto_731888 ?auto_731893 ) ) ( not ( = ?auto_731888 ?auto_731894 ) ) ( not ( = ?auto_731888 ?auto_731895 ) ) ( not ( = ?auto_731888 ?auto_731896 ) ) ( not ( = ?auto_731888 ?auto_731897 ) ) ( not ( = ?auto_731888 ?auto_731898 ) ) ( not ( = ?auto_731888 ?auto_731899 ) ) ( not ( = ?auto_731888 ?auto_731900 ) ) ( not ( = ?auto_731888 ?auto_731901 ) ) ( not ( = ?auto_731888 ?auto_731902 ) ) ( not ( = ?auto_731888 ?auto_731903 ) ) ( not ( = ?auto_731888 ?auto_731904 ) ) ( not ( = ?auto_731889 ?auto_731890 ) ) ( not ( = ?auto_731889 ?auto_731891 ) ) ( not ( = ?auto_731889 ?auto_731892 ) ) ( not ( = ?auto_731889 ?auto_731893 ) ) ( not ( = ?auto_731889 ?auto_731894 ) ) ( not ( = ?auto_731889 ?auto_731895 ) ) ( not ( = ?auto_731889 ?auto_731896 ) ) ( not ( = ?auto_731889 ?auto_731897 ) ) ( not ( = ?auto_731889 ?auto_731898 ) ) ( not ( = ?auto_731889 ?auto_731899 ) ) ( not ( = ?auto_731889 ?auto_731900 ) ) ( not ( = ?auto_731889 ?auto_731901 ) ) ( not ( = ?auto_731889 ?auto_731902 ) ) ( not ( = ?auto_731889 ?auto_731903 ) ) ( not ( = ?auto_731889 ?auto_731904 ) ) ( not ( = ?auto_731890 ?auto_731891 ) ) ( not ( = ?auto_731890 ?auto_731892 ) ) ( not ( = ?auto_731890 ?auto_731893 ) ) ( not ( = ?auto_731890 ?auto_731894 ) ) ( not ( = ?auto_731890 ?auto_731895 ) ) ( not ( = ?auto_731890 ?auto_731896 ) ) ( not ( = ?auto_731890 ?auto_731897 ) ) ( not ( = ?auto_731890 ?auto_731898 ) ) ( not ( = ?auto_731890 ?auto_731899 ) ) ( not ( = ?auto_731890 ?auto_731900 ) ) ( not ( = ?auto_731890 ?auto_731901 ) ) ( not ( = ?auto_731890 ?auto_731902 ) ) ( not ( = ?auto_731890 ?auto_731903 ) ) ( not ( = ?auto_731890 ?auto_731904 ) ) ( not ( = ?auto_731891 ?auto_731892 ) ) ( not ( = ?auto_731891 ?auto_731893 ) ) ( not ( = ?auto_731891 ?auto_731894 ) ) ( not ( = ?auto_731891 ?auto_731895 ) ) ( not ( = ?auto_731891 ?auto_731896 ) ) ( not ( = ?auto_731891 ?auto_731897 ) ) ( not ( = ?auto_731891 ?auto_731898 ) ) ( not ( = ?auto_731891 ?auto_731899 ) ) ( not ( = ?auto_731891 ?auto_731900 ) ) ( not ( = ?auto_731891 ?auto_731901 ) ) ( not ( = ?auto_731891 ?auto_731902 ) ) ( not ( = ?auto_731891 ?auto_731903 ) ) ( not ( = ?auto_731891 ?auto_731904 ) ) ( not ( = ?auto_731892 ?auto_731893 ) ) ( not ( = ?auto_731892 ?auto_731894 ) ) ( not ( = ?auto_731892 ?auto_731895 ) ) ( not ( = ?auto_731892 ?auto_731896 ) ) ( not ( = ?auto_731892 ?auto_731897 ) ) ( not ( = ?auto_731892 ?auto_731898 ) ) ( not ( = ?auto_731892 ?auto_731899 ) ) ( not ( = ?auto_731892 ?auto_731900 ) ) ( not ( = ?auto_731892 ?auto_731901 ) ) ( not ( = ?auto_731892 ?auto_731902 ) ) ( not ( = ?auto_731892 ?auto_731903 ) ) ( not ( = ?auto_731892 ?auto_731904 ) ) ( not ( = ?auto_731893 ?auto_731894 ) ) ( not ( = ?auto_731893 ?auto_731895 ) ) ( not ( = ?auto_731893 ?auto_731896 ) ) ( not ( = ?auto_731893 ?auto_731897 ) ) ( not ( = ?auto_731893 ?auto_731898 ) ) ( not ( = ?auto_731893 ?auto_731899 ) ) ( not ( = ?auto_731893 ?auto_731900 ) ) ( not ( = ?auto_731893 ?auto_731901 ) ) ( not ( = ?auto_731893 ?auto_731902 ) ) ( not ( = ?auto_731893 ?auto_731903 ) ) ( not ( = ?auto_731893 ?auto_731904 ) ) ( not ( = ?auto_731894 ?auto_731895 ) ) ( not ( = ?auto_731894 ?auto_731896 ) ) ( not ( = ?auto_731894 ?auto_731897 ) ) ( not ( = ?auto_731894 ?auto_731898 ) ) ( not ( = ?auto_731894 ?auto_731899 ) ) ( not ( = ?auto_731894 ?auto_731900 ) ) ( not ( = ?auto_731894 ?auto_731901 ) ) ( not ( = ?auto_731894 ?auto_731902 ) ) ( not ( = ?auto_731894 ?auto_731903 ) ) ( not ( = ?auto_731894 ?auto_731904 ) ) ( not ( = ?auto_731895 ?auto_731896 ) ) ( not ( = ?auto_731895 ?auto_731897 ) ) ( not ( = ?auto_731895 ?auto_731898 ) ) ( not ( = ?auto_731895 ?auto_731899 ) ) ( not ( = ?auto_731895 ?auto_731900 ) ) ( not ( = ?auto_731895 ?auto_731901 ) ) ( not ( = ?auto_731895 ?auto_731902 ) ) ( not ( = ?auto_731895 ?auto_731903 ) ) ( not ( = ?auto_731895 ?auto_731904 ) ) ( not ( = ?auto_731896 ?auto_731897 ) ) ( not ( = ?auto_731896 ?auto_731898 ) ) ( not ( = ?auto_731896 ?auto_731899 ) ) ( not ( = ?auto_731896 ?auto_731900 ) ) ( not ( = ?auto_731896 ?auto_731901 ) ) ( not ( = ?auto_731896 ?auto_731902 ) ) ( not ( = ?auto_731896 ?auto_731903 ) ) ( not ( = ?auto_731896 ?auto_731904 ) ) ( not ( = ?auto_731897 ?auto_731898 ) ) ( not ( = ?auto_731897 ?auto_731899 ) ) ( not ( = ?auto_731897 ?auto_731900 ) ) ( not ( = ?auto_731897 ?auto_731901 ) ) ( not ( = ?auto_731897 ?auto_731902 ) ) ( not ( = ?auto_731897 ?auto_731903 ) ) ( not ( = ?auto_731897 ?auto_731904 ) ) ( not ( = ?auto_731898 ?auto_731899 ) ) ( not ( = ?auto_731898 ?auto_731900 ) ) ( not ( = ?auto_731898 ?auto_731901 ) ) ( not ( = ?auto_731898 ?auto_731902 ) ) ( not ( = ?auto_731898 ?auto_731903 ) ) ( not ( = ?auto_731898 ?auto_731904 ) ) ( not ( = ?auto_731899 ?auto_731900 ) ) ( not ( = ?auto_731899 ?auto_731901 ) ) ( not ( = ?auto_731899 ?auto_731902 ) ) ( not ( = ?auto_731899 ?auto_731903 ) ) ( not ( = ?auto_731899 ?auto_731904 ) ) ( not ( = ?auto_731900 ?auto_731901 ) ) ( not ( = ?auto_731900 ?auto_731902 ) ) ( not ( = ?auto_731900 ?auto_731903 ) ) ( not ( = ?auto_731900 ?auto_731904 ) ) ( not ( = ?auto_731901 ?auto_731902 ) ) ( not ( = ?auto_731901 ?auto_731903 ) ) ( not ( = ?auto_731901 ?auto_731904 ) ) ( not ( = ?auto_731902 ?auto_731903 ) ) ( not ( = ?auto_731902 ?auto_731904 ) ) ( not ( = ?auto_731903 ?auto_731904 ) ) ( ON ?auto_731903 ?auto_731904 ) ( ON ?auto_731902 ?auto_731903 ) ( ON ?auto_731901 ?auto_731902 ) ( ON ?auto_731900 ?auto_731901 ) ( ON ?auto_731899 ?auto_731900 ) ( ON ?auto_731898 ?auto_731899 ) ( ON ?auto_731897 ?auto_731898 ) ( ON ?auto_731896 ?auto_731897 ) ( ON ?auto_731895 ?auto_731896 ) ( ON ?auto_731894 ?auto_731895 ) ( ON ?auto_731893 ?auto_731894 ) ( CLEAR ?auto_731891 ) ( ON ?auto_731892 ?auto_731893 ) ( CLEAR ?auto_731892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_731888 ?auto_731889 ?auto_731890 ?auto_731891 ?auto_731892 )
      ( MAKE-17PILE ?auto_731888 ?auto_731889 ?auto_731890 ?auto_731891 ?auto_731892 ?auto_731893 ?auto_731894 ?auto_731895 ?auto_731896 ?auto_731897 ?auto_731898 ?auto_731899 ?auto_731900 ?auto_731901 ?auto_731902 ?auto_731903 ?auto_731904 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731922 - BLOCK
      ?auto_731923 - BLOCK
      ?auto_731924 - BLOCK
      ?auto_731925 - BLOCK
      ?auto_731926 - BLOCK
      ?auto_731927 - BLOCK
      ?auto_731928 - BLOCK
      ?auto_731929 - BLOCK
      ?auto_731930 - BLOCK
      ?auto_731931 - BLOCK
      ?auto_731932 - BLOCK
      ?auto_731933 - BLOCK
      ?auto_731934 - BLOCK
      ?auto_731935 - BLOCK
      ?auto_731936 - BLOCK
      ?auto_731937 - BLOCK
      ?auto_731938 - BLOCK
    )
    :vars
    (
      ?auto_731939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_731938 ?auto_731939 ) ( ON-TABLE ?auto_731922 ) ( ON ?auto_731923 ?auto_731922 ) ( ON ?auto_731924 ?auto_731923 ) ( not ( = ?auto_731922 ?auto_731923 ) ) ( not ( = ?auto_731922 ?auto_731924 ) ) ( not ( = ?auto_731922 ?auto_731925 ) ) ( not ( = ?auto_731922 ?auto_731926 ) ) ( not ( = ?auto_731922 ?auto_731927 ) ) ( not ( = ?auto_731922 ?auto_731928 ) ) ( not ( = ?auto_731922 ?auto_731929 ) ) ( not ( = ?auto_731922 ?auto_731930 ) ) ( not ( = ?auto_731922 ?auto_731931 ) ) ( not ( = ?auto_731922 ?auto_731932 ) ) ( not ( = ?auto_731922 ?auto_731933 ) ) ( not ( = ?auto_731922 ?auto_731934 ) ) ( not ( = ?auto_731922 ?auto_731935 ) ) ( not ( = ?auto_731922 ?auto_731936 ) ) ( not ( = ?auto_731922 ?auto_731937 ) ) ( not ( = ?auto_731922 ?auto_731938 ) ) ( not ( = ?auto_731922 ?auto_731939 ) ) ( not ( = ?auto_731923 ?auto_731924 ) ) ( not ( = ?auto_731923 ?auto_731925 ) ) ( not ( = ?auto_731923 ?auto_731926 ) ) ( not ( = ?auto_731923 ?auto_731927 ) ) ( not ( = ?auto_731923 ?auto_731928 ) ) ( not ( = ?auto_731923 ?auto_731929 ) ) ( not ( = ?auto_731923 ?auto_731930 ) ) ( not ( = ?auto_731923 ?auto_731931 ) ) ( not ( = ?auto_731923 ?auto_731932 ) ) ( not ( = ?auto_731923 ?auto_731933 ) ) ( not ( = ?auto_731923 ?auto_731934 ) ) ( not ( = ?auto_731923 ?auto_731935 ) ) ( not ( = ?auto_731923 ?auto_731936 ) ) ( not ( = ?auto_731923 ?auto_731937 ) ) ( not ( = ?auto_731923 ?auto_731938 ) ) ( not ( = ?auto_731923 ?auto_731939 ) ) ( not ( = ?auto_731924 ?auto_731925 ) ) ( not ( = ?auto_731924 ?auto_731926 ) ) ( not ( = ?auto_731924 ?auto_731927 ) ) ( not ( = ?auto_731924 ?auto_731928 ) ) ( not ( = ?auto_731924 ?auto_731929 ) ) ( not ( = ?auto_731924 ?auto_731930 ) ) ( not ( = ?auto_731924 ?auto_731931 ) ) ( not ( = ?auto_731924 ?auto_731932 ) ) ( not ( = ?auto_731924 ?auto_731933 ) ) ( not ( = ?auto_731924 ?auto_731934 ) ) ( not ( = ?auto_731924 ?auto_731935 ) ) ( not ( = ?auto_731924 ?auto_731936 ) ) ( not ( = ?auto_731924 ?auto_731937 ) ) ( not ( = ?auto_731924 ?auto_731938 ) ) ( not ( = ?auto_731924 ?auto_731939 ) ) ( not ( = ?auto_731925 ?auto_731926 ) ) ( not ( = ?auto_731925 ?auto_731927 ) ) ( not ( = ?auto_731925 ?auto_731928 ) ) ( not ( = ?auto_731925 ?auto_731929 ) ) ( not ( = ?auto_731925 ?auto_731930 ) ) ( not ( = ?auto_731925 ?auto_731931 ) ) ( not ( = ?auto_731925 ?auto_731932 ) ) ( not ( = ?auto_731925 ?auto_731933 ) ) ( not ( = ?auto_731925 ?auto_731934 ) ) ( not ( = ?auto_731925 ?auto_731935 ) ) ( not ( = ?auto_731925 ?auto_731936 ) ) ( not ( = ?auto_731925 ?auto_731937 ) ) ( not ( = ?auto_731925 ?auto_731938 ) ) ( not ( = ?auto_731925 ?auto_731939 ) ) ( not ( = ?auto_731926 ?auto_731927 ) ) ( not ( = ?auto_731926 ?auto_731928 ) ) ( not ( = ?auto_731926 ?auto_731929 ) ) ( not ( = ?auto_731926 ?auto_731930 ) ) ( not ( = ?auto_731926 ?auto_731931 ) ) ( not ( = ?auto_731926 ?auto_731932 ) ) ( not ( = ?auto_731926 ?auto_731933 ) ) ( not ( = ?auto_731926 ?auto_731934 ) ) ( not ( = ?auto_731926 ?auto_731935 ) ) ( not ( = ?auto_731926 ?auto_731936 ) ) ( not ( = ?auto_731926 ?auto_731937 ) ) ( not ( = ?auto_731926 ?auto_731938 ) ) ( not ( = ?auto_731926 ?auto_731939 ) ) ( not ( = ?auto_731927 ?auto_731928 ) ) ( not ( = ?auto_731927 ?auto_731929 ) ) ( not ( = ?auto_731927 ?auto_731930 ) ) ( not ( = ?auto_731927 ?auto_731931 ) ) ( not ( = ?auto_731927 ?auto_731932 ) ) ( not ( = ?auto_731927 ?auto_731933 ) ) ( not ( = ?auto_731927 ?auto_731934 ) ) ( not ( = ?auto_731927 ?auto_731935 ) ) ( not ( = ?auto_731927 ?auto_731936 ) ) ( not ( = ?auto_731927 ?auto_731937 ) ) ( not ( = ?auto_731927 ?auto_731938 ) ) ( not ( = ?auto_731927 ?auto_731939 ) ) ( not ( = ?auto_731928 ?auto_731929 ) ) ( not ( = ?auto_731928 ?auto_731930 ) ) ( not ( = ?auto_731928 ?auto_731931 ) ) ( not ( = ?auto_731928 ?auto_731932 ) ) ( not ( = ?auto_731928 ?auto_731933 ) ) ( not ( = ?auto_731928 ?auto_731934 ) ) ( not ( = ?auto_731928 ?auto_731935 ) ) ( not ( = ?auto_731928 ?auto_731936 ) ) ( not ( = ?auto_731928 ?auto_731937 ) ) ( not ( = ?auto_731928 ?auto_731938 ) ) ( not ( = ?auto_731928 ?auto_731939 ) ) ( not ( = ?auto_731929 ?auto_731930 ) ) ( not ( = ?auto_731929 ?auto_731931 ) ) ( not ( = ?auto_731929 ?auto_731932 ) ) ( not ( = ?auto_731929 ?auto_731933 ) ) ( not ( = ?auto_731929 ?auto_731934 ) ) ( not ( = ?auto_731929 ?auto_731935 ) ) ( not ( = ?auto_731929 ?auto_731936 ) ) ( not ( = ?auto_731929 ?auto_731937 ) ) ( not ( = ?auto_731929 ?auto_731938 ) ) ( not ( = ?auto_731929 ?auto_731939 ) ) ( not ( = ?auto_731930 ?auto_731931 ) ) ( not ( = ?auto_731930 ?auto_731932 ) ) ( not ( = ?auto_731930 ?auto_731933 ) ) ( not ( = ?auto_731930 ?auto_731934 ) ) ( not ( = ?auto_731930 ?auto_731935 ) ) ( not ( = ?auto_731930 ?auto_731936 ) ) ( not ( = ?auto_731930 ?auto_731937 ) ) ( not ( = ?auto_731930 ?auto_731938 ) ) ( not ( = ?auto_731930 ?auto_731939 ) ) ( not ( = ?auto_731931 ?auto_731932 ) ) ( not ( = ?auto_731931 ?auto_731933 ) ) ( not ( = ?auto_731931 ?auto_731934 ) ) ( not ( = ?auto_731931 ?auto_731935 ) ) ( not ( = ?auto_731931 ?auto_731936 ) ) ( not ( = ?auto_731931 ?auto_731937 ) ) ( not ( = ?auto_731931 ?auto_731938 ) ) ( not ( = ?auto_731931 ?auto_731939 ) ) ( not ( = ?auto_731932 ?auto_731933 ) ) ( not ( = ?auto_731932 ?auto_731934 ) ) ( not ( = ?auto_731932 ?auto_731935 ) ) ( not ( = ?auto_731932 ?auto_731936 ) ) ( not ( = ?auto_731932 ?auto_731937 ) ) ( not ( = ?auto_731932 ?auto_731938 ) ) ( not ( = ?auto_731932 ?auto_731939 ) ) ( not ( = ?auto_731933 ?auto_731934 ) ) ( not ( = ?auto_731933 ?auto_731935 ) ) ( not ( = ?auto_731933 ?auto_731936 ) ) ( not ( = ?auto_731933 ?auto_731937 ) ) ( not ( = ?auto_731933 ?auto_731938 ) ) ( not ( = ?auto_731933 ?auto_731939 ) ) ( not ( = ?auto_731934 ?auto_731935 ) ) ( not ( = ?auto_731934 ?auto_731936 ) ) ( not ( = ?auto_731934 ?auto_731937 ) ) ( not ( = ?auto_731934 ?auto_731938 ) ) ( not ( = ?auto_731934 ?auto_731939 ) ) ( not ( = ?auto_731935 ?auto_731936 ) ) ( not ( = ?auto_731935 ?auto_731937 ) ) ( not ( = ?auto_731935 ?auto_731938 ) ) ( not ( = ?auto_731935 ?auto_731939 ) ) ( not ( = ?auto_731936 ?auto_731937 ) ) ( not ( = ?auto_731936 ?auto_731938 ) ) ( not ( = ?auto_731936 ?auto_731939 ) ) ( not ( = ?auto_731937 ?auto_731938 ) ) ( not ( = ?auto_731937 ?auto_731939 ) ) ( not ( = ?auto_731938 ?auto_731939 ) ) ( ON ?auto_731937 ?auto_731938 ) ( ON ?auto_731936 ?auto_731937 ) ( ON ?auto_731935 ?auto_731936 ) ( ON ?auto_731934 ?auto_731935 ) ( ON ?auto_731933 ?auto_731934 ) ( ON ?auto_731932 ?auto_731933 ) ( ON ?auto_731931 ?auto_731932 ) ( ON ?auto_731930 ?auto_731931 ) ( ON ?auto_731929 ?auto_731930 ) ( ON ?auto_731928 ?auto_731929 ) ( ON ?auto_731927 ?auto_731928 ) ( ON ?auto_731926 ?auto_731927 ) ( CLEAR ?auto_731924 ) ( ON ?auto_731925 ?auto_731926 ) ( CLEAR ?auto_731925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_731922 ?auto_731923 ?auto_731924 ?auto_731925 )
      ( MAKE-17PILE ?auto_731922 ?auto_731923 ?auto_731924 ?auto_731925 ?auto_731926 ?auto_731927 ?auto_731928 ?auto_731929 ?auto_731930 ?auto_731931 ?auto_731932 ?auto_731933 ?auto_731934 ?auto_731935 ?auto_731936 ?auto_731937 ?auto_731938 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731957 - BLOCK
      ?auto_731958 - BLOCK
      ?auto_731959 - BLOCK
      ?auto_731960 - BLOCK
      ?auto_731961 - BLOCK
      ?auto_731962 - BLOCK
      ?auto_731963 - BLOCK
      ?auto_731964 - BLOCK
      ?auto_731965 - BLOCK
      ?auto_731966 - BLOCK
      ?auto_731967 - BLOCK
      ?auto_731968 - BLOCK
      ?auto_731969 - BLOCK
      ?auto_731970 - BLOCK
      ?auto_731971 - BLOCK
      ?auto_731972 - BLOCK
      ?auto_731973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_731973 ) ( ON-TABLE ?auto_731957 ) ( ON ?auto_731958 ?auto_731957 ) ( ON ?auto_731959 ?auto_731958 ) ( not ( = ?auto_731957 ?auto_731958 ) ) ( not ( = ?auto_731957 ?auto_731959 ) ) ( not ( = ?auto_731957 ?auto_731960 ) ) ( not ( = ?auto_731957 ?auto_731961 ) ) ( not ( = ?auto_731957 ?auto_731962 ) ) ( not ( = ?auto_731957 ?auto_731963 ) ) ( not ( = ?auto_731957 ?auto_731964 ) ) ( not ( = ?auto_731957 ?auto_731965 ) ) ( not ( = ?auto_731957 ?auto_731966 ) ) ( not ( = ?auto_731957 ?auto_731967 ) ) ( not ( = ?auto_731957 ?auto_731968 ) ) ( not ( = ?auto_731957 ?auto_731969 ) ) ( not ( = ?auto_731957 ?auto_731970 ) ) ( not ( = ?auto_731957 ?auto_731971 ) ) ( not ( = ?auto_731957 ?auto_731972 ) ) ( not ( = ?auto_731957 ?auto_731973 ) ) ( not ( = ?auto_731958 ?auto_731959 ) ) ( not ( = ?auto_731958 ?auto_731960 ) ) ( not ( = ?auto_731958 ?auto_731961 ) ) ( not ( = ?auto_731958 ?auto_731962 ) ) ( not ( = ?auto_731958 ?auto_731963 ) ) ( not ( = ?auto_731958 ?auto_731964 ) ) ( not ( = ?auto_731958 ?auto_731965 ) ) ( not ( = ?auto_731958 ?auto_731966 ) ) ( not ( = ?auto_731958 ?auto_731967 ) ) ( not ( = ?auto_731958 ?auto_731968 ) ) ( not ( = ?auto_731958 ?auto_731969 ) ) ( not ( = ?auto_731958 ?auto_731970 ) ) ( not ( = ?auto_731958 ?auto_731971 ) ) ( not ( = ?auto_731958 ?auto_731972 ) ) ( not ( = ?auto_731958 ?auto_731973 ) ) ( not ( = ?auto_731959 ?auto_731960 ) ) ( not ( = ?auto_731959 ?auto_731961 ) ) ( not ( = ?auto_731959 ?auto_731962 ) ) ( not ( = ?auto_731959 ?auto_731963 ) ) ( not ( = ?auto_731959 ?auto_731964 ) ) ( not ( = ?auto_731959 ?auto_731965 ) ) ( not ( = ?auto_731959 ?auto_731966 ) ) ( not ( = ?auto_731959 ?auto_731967 ) ) ( not ( = ?auto_731959 ?auto_731968 ) ) ( not ( = ?auto_731959 ?auto_731969 ) ) ( not ( = ?auto_731959 ?auto_731970 ) ) ( not ( = ?auto_731959 ?auto_731971 ) ) ( not ( = ?auto_731959 ?auto_731972 ) ) ( not ( = ?auto_731959 ?auto_731973 ) ) ( not ( = ?auto_731960 ?auto_731961 ) ) ( not ( = ?auto_731960 ?auto_731962 ) ) ( not ( = ?auto_731960 ?auto_731963 ) ) ( not ( = ?auto_731960 ?auto_731964 ) ) ( not ( = ?auto_731960 ?auto_731965 ) ) ( not ( = ?auto_731960 ?auto_731966 ) ) ( not ( = ?auto_731960 ?auto_731967 ) ) ( not ( = ?auto_731960 ?auto_731968 ) ) ( not ( = ?auto_731960 ?auto_731969 ) ) ( not ( = ?auto_731960 ?auto_731970 ) ) ( not ( = ?auto_731960 ?auto_731971 ) ) ( not ( = ?auto_731960 ?auto_731972 ) ) ( not ( = ?auto_731960 ?auto_731973 ) ) ( not ( = ?auto_731961 ?auto_731962 ) ) ( not ( = ?auto_731961 ?auto_731963 ) ) ( not ( = ?auto_731961 ?auto_731964 ) ) ( not ( = ?auto_731961 ?auto_731965 ) ) ( not ( = ?auto_731961 ?auto_731966 ) ) ( not ( = ?auto_731961 ?auto_731967 ) ) ( not ( = ?auto_731961 ?auto_731968 ) ) ( not ( = ?auto_731961 ?auto_731969 ) ) ( not ( = ?auto_731961 ?auto_731970 ) ) ( not ( = ?auto_731961 ?auto_731971 ) ) ( not ( = ?auto_731961 ?auto_731972 ) ) ( not ( = ?auto_731961 ?auto_731973 ) ) ( not ( = ?auto_731962 ?auto_731963 ) ) ( not ( = ?auto_731962 ?auto_731964 ) ) ( not ( = ?auto_731962 ?auto_731965 ) ) ( not ( = ?auto_731962 ?auto_731966 ) ) ( not ( = ?auto_731962 ?auto_731967 ) ) ( not ( = ?auto_731962 ?auto_731968 ) ) ( not ( = ?auto_731962 ?auto_731969 ) ) ( not ( = ?auto_731962 ?auto_731970 ) ) ( not ( = ?auto_731962 ?auto_731971 ) ) ( not ( = ?auto_731962 ?auto_731972 ) ) ( not ( = ?auto_731962 ?auto_731973 ) ) ( not ( = ?auto_731963 ?auto_731964 ) ) ( not ( = ?auto_731963 ?auto_731965 ) ) ( not ( = ?auto_731963 ?auto_731966 ) ) ( not ( = ?auto_731963 ?auto_731967 ) ) ( not ( = ?auto_731963 ?auto_731968 ) ) ( not ( = ?auto_731963 ?auto_731969 ) ) ( not ( = ?auto_731963 ?auto_731970 ) ) ( not ( = ?auto_731963 ?auto_731971 ) ) ( not ( = ?auto_731963 ?auto_731972 ) ) ( not ( = ?auto_731963 ?auto_731973 ) ) ( not ( = ?auto_731964 ?auto_731965 ) ) ( not ( = ?auto_731964 ?auto_731966 ) ) ( not ( = ?auto_731964 ?auto_731967 ) ) ( not ( = ?auto_731964 ?auto_731968 ) ) ( not ( = ?auto_731964 ?auto_731969 ) ) ( not ( = ?auto_731964 ?auto_731970 ) ) ( not ( = ?auto_731964 ?auto_731971 ) ) ( not ( = ?auto_731964 ?auto_731972 ) ) ( not ( = ?auto_731964 ?auto_731973 ) ) ( not ( = ?auto_731965 ?auto_731966 ) ) ( not ( = ?auto_731965 ?auto_731967 ) ) ( not ( = ?auto_731965 ?auto_731968 ) ) ( not ( = ?auto_731965 ?auto_731969 ) ) ( not ( = ?auto_731965 ?auto_731970 ) ) ( not ( = ?auto_731965 ?auto_731971 ) ) ( not ( = ?auto_731965 ?auto_731972 ) ) ( not ( = ?auto_731965 ?auto_731973 ) ) ( not ( = ?auto_731966 ?auto_731967 ) ) ( not ( = ?auto_731966 ?auto_731968 ) ) ( not ( = ?auto_731966 ?auto_731969 ) ) ( not ( = ?auto_731966 ?auto_731970 ) ) ( not ( = ?auto_731966 ?auto_731971 ) ) ( not ( = ?auto_731966 ?auto_731972 ) ) ( not ( = ?auto_731966 ?auto_731973 ) ) ( not ( = ?auto_731967 ?auto_731968 ) ) ( not ( = ?auto_731967 ?auto_731969 ) ) ( not ( = ?auto_731967 ?auto_731970 ) ) ( not ( = ?auto_731967 ?auto_731971 ) ) ( not ( = ?auto_731967 ?auto_731972 ) ) ( not ( = ?auto_731967 ?auto_731973 ) ) ( not ( = ?auto_731968 ?auto_731969 ) ) ( not ( = ?auto_731968 ?auto_731970 ) ) ( not ( = ?auto_731968 ?auto_731971 ) ) ( not ( = ?auto_731968 ?auto_731972 ) ) ( not ( = ?auto_731968 ?auto_731973 ) ) ( not ( = ?auto_731969 ?auto_731970 ) ) ( not ( = ?auto_731969 ?auto_731971 ) ) ( not ( = ?auto_731969 ?auto_731972 ) ) ( not ( = ?auto_731969 ?auto_731973 ) ) ( not ( = ?auto_731970 ?auto_731971 ) ) ( not ( = ?auto_731970 ?auto_731972 ) ) ( not ( = ?auto_731970 ?auto_731973 ) ) ( not ( = ?auto_731971 ?auto_731972 ) ) ( not ( = ?auto_731971 ?auto_731973 ) ) ( not ( = ?auto_731972 ?auto_731973 ) ) ( ON ?auto_731972 ?auto_731973 ) ( ON ?auto_731971 ?auto_731972 ) ( ON ?auto_731970 ?auto_731971 ) ( ON ?auto_731969 ?auto_731970 ) ( ON ?auto_731968 ?auto_731969 ) ( ON ?auto_731967 ?auto_731968 ) ( ON ?auto_731966 ?auto_731967 ) ( ON ?auto_731965 ?auto_731966 ) ( ON ?auto_731964 ?auto_731965 ) ( ON ?auto_731963 ?auto_731964 ) ( ON ?auto_731962 ?auto_731963 ) ( ON ?auto_731961 ?auto_731962 ) ( CLEAR ?auto_731959 ) ( ON ?auto_731960 ?auto_731961 ) ( CLEAR ?auto_731960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_731957 ?auto_731958 ?auto_731959 ?auto_731960 )
      ( MAKE-17PILE ?auto_731957 ?auto_731958 ?auto_731959 ?auto_731960 ?auto_731961 ?auto_731962 ?auto_731963 ?auto_731964 ?auto_731965 ?auto_731966 ?auto_731967 ?auto_731968 ?auto_731969 ?auto_731970 ?auto_731971 ?auto_731972 ?auto_731973 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_731991 - BLOCK
      ?auto_731992 - BLOCK
      ?auto_731993 - BLOCK
      ?auto_731994 - BLOCK
      ?auto_731995 - BLOCK
      ?auto_731996 - BLOCK
      ?auto_731997 - BLOCK
      ?auto_731998 - BLOCK
      ?auto_731999 - BLOCK
      ?auto_732000 - BLOCK
      ?auto_732001 - BLOCK
      ?auto_732002 - BLOCK
      ?auto_732003 - BLOCK
      ?auto_732004 - BLOCK
      ?auto_732005 - BLOCK
      ?auto_732006 - BLOCK
      ?auto_732007 - BLOCK
    )
    :vars
    (
      ?auto_732008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732007 ?auto_732008 ) ( ON-TABLE ?auto_731991 ) ( ON ?auto_731992 ?auto_731991 ) ( not ( = ?auto_731991 ?auto_731992 ) ) ( not ( = ?auto_731991 ?auto_731993 ) ) ( not ( = ?auto_731991 ?auto_731994 ) ) ( not ( = ?auto_731991 ?auto_731995 ) ) ( not ( = ?auto_731991 ?auto_731996 ) ) ( not ( = ?auto_731991 ?auto_731997 ) ) ( not ( = ?auto_731991 ?auto_731998 ) ) ( not ( = ?auto_731991 ?auto_731999 ) ) ( not ( = ?auto_731991 ?auto_732000 ) ) ( not ( = ?auto_731991 ?auto_732001 ) ) ( not ( = ?auto_731991 ?auto_732002 ) ) ( not ( = ?auto_731991 ?auto_732003 ) ) ( not ( = ?auto_731991 ?auto_732004 ) ) ( not ( = ?auto_731991 ?auto_732005 ) ) ( not ( = ?auto_731991 ?auto_732006 ) ) ( not ( = ?auto_731991 ?auto_732007 ) ) ( not ( = ?auto_731991 ?auto_732008 ) ) ( not ( = ?auto_731992 ?auto_731993 ) ) ( not ( = ?auto_731992 ?auto_731994 ) ) ( not ( = ?auto_731992 ?auto_731995 ) ) ( not ( = ?auto_731992 ?auto_731996 ) ) ( not ( = ?auto_731992 ?auto_731997 ) ) ( not ( = ?auto_731992 ?auto_731998 ) ) ( not ( = ?auto_731992 ?auto_731999 ) ) ( not ( = ?auto_731992 ?auto_732000 ) ) ( not ( = ?auto_731992 ?auto_732001 ) ) ( not ( = ?auto_731992 ?auto_732002 ) ) ( not ( = ?auto_731992 ?auto_732003 ) ) ( not ( = ?auto_731992 ?auto_732004 ) ) ( not ( = ?auto_731992 ?auto_732005 ) ) ( not ( = ?auto_731992 ?auto_732006 ) ) ( not ( = ?auto_731992 ?auto_732007 ) ) ( not ( = ?auto_731992 ?auto_732008 ) ) ( not ( = ?auto_731993 ?auto_731994 ) ) ( not ( = ?auto_731993 ?auto_731995 ) ) ( not ( = ?auto_731993 ?auto_731996 ) ) ( not ( = ?auto_731993 ?auto_731997 ) ) ( not ( = ?auto_731993 ?auto_731998 ) ) ( not ( = ?auto_731993 ?auto_731999 ) ) ( not ( = ?auto_731993 ?auto_732000 ) ) ( not ( = ?auto_731993 ?auto_732001 ) ) ( not ( = ?auto_731993 ?auto_732002 ) ) ( not ( = ?auto_731993 ?auto_732003 ) ) ( not ( = ?auto_731993 ?auto_732004 ) ) ( not ( = ?auto_731993 ?auto_732005 ) ) ( not ( = ?auto_731993 ?auto_732006 ) ) ( not ( = ?auto_731993 ?auto_732007 ) ) ( not ( = ?auto_731993 ?auto_732008 ) ) ( not ( = ?auto_731994 ?auto_731995 ) ) ( not ( = ?auto_731994 ?auto_731996 ) ) ( not ( = ?auto_731994 ?auto_731997 ) ) ( not ( = ?auto_731994 ?auto_731998 ) ) ( not ( = ?auto_731994 ?auto_731999 ) ) ( not ( = ?auto_731994 ?auto_732000 ) ) ( not ( = ?auto_731994 ?auto_732001 ) ) ( not ( = ?auto_731994 ?auto_732002 ) ) ( not ( = ?auto_731994 ?auto_732003 ) ) ( not ( = ?auto_731994 ?auto_732004 ) ) ( not ( = ?auto_731994 ?auto_732005 ) ) ( not ( = ?auto_731994 ?auto_732006 ) ) ( not ( = ?auto_731994 ?auto_732007 ) ) ( not ( = ?auto_731994 ?auto_732008 ) ) ( not ( = ?auto_731995 ?auto_731996 ) ) ( not ( = ?auto_731995 ?auto_731997 ) ) ( not ( = ?auto_731995 ?auto_731998 ) ) ( not ( = ?auto_731995 ?auto_731999 ) ) ( not ( = ?auto_731995 ?auto_732000 ) ) ( not ( = ?auto_731995 ?auto_732001 ) ) ( not ( = ?auto_731995 ?auto_732002 ) ) ( not ( = ?auto_731995 ?auto_732003 ) ) ( not ( = ?auto_731995 ?auto_732004 ) ) ( not ( = ?auto_731995 ?auto_732005 ) ) ( not ( = ?auto_731995 ?auto_732006 ) ) ( not ( = ?auto_731995 ?auto_732007 ) ) ( not ( = ?auto_731995 ?auto_732008 ) ) ( not ( = ?auto_731996 ?auto_731997 ) ) ( not ( = ?auto_731996 ?auto_731998 ) ) ( not ( = ?auto_731996 ?auto_731999 ) ) ( not ( = ?auto_731996 ?auto_732000 ) ) ( not ( = ?auto_731996 ?auto_732001 ) ) ( not ( = ?auto_731996 ?auto_732002 ) ) ( not ( = ?auto_731996 ?auto_732003 ) ) ( not ( = ?auto_731996 ?auto_732004 ) ) ( not ( = ?auto_731996 ?auto_732005 ) ) ( not ( = ?auto_731996 ?auto_732006 ) ) ( not ( = ?auto_731996 ?auto_732007 ) ) ( not ( = ?auto_731996 ?auto_732008 ) ) ( not ( = ?auto_731997 ?auto_731998 ) ) ( not ( = ?auto_731997 ?auto_731999 ) ) ( not ( = ?auto_731997 ?auto_732000 ) ) ( not ( = ?auto_731997 ?auto_732001 ) ) ( not ( = ?auto_731997 ?auto_732002 ) ) ( not ( = ?auto_731997 ?auto_732003 ) ) ( not ( = ?auto_731997 ?auto_732004 ) ) ( not ( = ?auto_731997 ?auto_732005 ) ) ( not ( = ?auto_731997 ?auto_732006 ) ) ( not ( = ?auto_731997 ?auto_732007 ) ) ( not ( = ?auto_731997 ?auto_732008 ) ) ( not ( = ?auto_731998 ?auto_731999 ) ) ( not ( = ?auto_731998 ?auto_732000 ) ) ( not ( = ?auto_731998 ?auto_732001 ) ) ( not ( = ?auto_731998 ?auto_732002 ) ) ( not ( = ?auto_731998 ?auto_732003 ) ) ( not ( = ?auto_731998 ?auto_732004 ) ) ( not ( = ?auto_731998 ?auto_732005 ) ) ( not ( = ?auto_731998 ?auto_732006 ) ) ( not ( = ?auto_731998 ?auto_732007 ) ) ( not ( = ?auto_731998 ?auto_732008 ) ) ( not ( = ?auto_731999 ?auto_732000 ) ) ( not ( = ?auto_731999 ?auto_732001 ) ) ( not ( = ?auto_731999 ?auto_732002 ) ) ( not ( = ?auto_731999 ?auto_732003 ) ) ( not ( = ?auto_731999 ?auto_732004 ) ) ( not ( = ?auto_731999 ?auto_732005 ) ) ( not ( = ?auto_731999 ?auto_732006 ) ) ( not ( = ?auto_731999 ?auto_732007 ) ) ( not ( = ?auto_731999 ?auto_732008 ) ) ( not ( = ?auto_732000 ?auto_732001 ) ) ( not ( = ?auto_732000 ?auto_732002 ) ) ( not ( = ?auto_732000 ?auto_732003 ) ) ( not ( = ?auto_732000 ?auto_732004 ) ) ( not ( = ?auto_732000 ?auto_732005 ) ) ( not ( = ?auto_732000 ?auto_732006 ) ) ( not ( = ?auto_732000 ?auto_732007 ) ) ( not ( = ?auto_732000 ?auto_732008 ) ) ( not ( = ?auto_732001 ?auto_732002 ) ) ( not ( = ?auto_732001 ?auto_732003 ) ) ( not ( = ?auto_732001 ?auto_732004 ) ) ( not ( = ?auto_732001 ?auto_732005 ) ) ( not ( = ?auto_732001 ?auto_732006 ) ) ( not ( = ?auto_732001 ?auto_732007 ) ) ( not ( = ?auto_732001 ?auto_732008 ) ) ( not ( = ?auto_732002 ?auto_732003 ) ) ( not ( = ?auto_732002 ?auto_732004 ) ) ( not ( = ?auto_732002 ?auto_732005 ) ) ( not ( = ?auto_732002 ?auto_732006 ) ) ( not ( = ?auto_732002 ?auto_732007 ) ) ( not ( = ?auto_732002 ?auto_732008 ) ) ( not ( = ?auto_732003 ?auto_732004 ) ) ( not ( = ?auto_732003 ?auto_732005 ) ) ( not ( = ?auto_732003 ?auto_732006 ) ) ( not ( = ?auto_732003 ?auto_732007 ) ) ( not ( = ?auto_732003 ?auto_732008 ) ) ( not ( = ?auto_732004 ?auto_732005 ) ) ( not ( = ?auto_732004 ?auto_732006 ) ) ( not ( = ?auto_732004 ?auto_732007 ) ) ( not ( = ?auto_732004 ?auto_732008 ) ) ( not ( = ?auto_732005 ?auto_732006 ) ) ( not ( = ?auto_732005 ?auto_732007 ) ) ( not ( = ?auto_732005 ?auto_732008 ) ) ( not ( = ?auto_732006 ?auto_732007 ) ) ( not ( = ?auto_732006 ?auto_732008 ) ) ( not ( = ?auto_732007 ?auto_732008 ) ) ( ON ?auto_732006 ?auto_732007 ) ( ON ?auto_732005 ?auto_732006 ) ( ON ?auto_732004 ?auto_732005 ) ( ON ?auto_732003 ?auto_732004 ) ( ON ?auto_732002 ?auto_732003 ) ( ON ?auto_732001 ?auto_732002 ) ( ON ?auto_732000 ?auto_732001 ) ( ON ?auto_731999 ?auto_732000 ) ( ON ?auto_731998 ?auto_731999 ) ( ON ?auto_731997 ?auto_731998 ) ( ON ?auto_731996 ?auto_731997 ) ( ON ?auto_731995 ?auto_731996 ) ( ON ?auto_731994 ?auto_731995 ) ( CLEAR ?auto_731992 ) ( ON ?auto_731993 ?auto_731994 ) ( CLEAR ?auto_731993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_731991 ?auto_731992 ?auto_731993 )
      ( MAKE-17PILE ?auto_731991 ?auto_731992 ?auto_731993 ?auto_731994 ?auto_731995 ?auto_731996 ?auto_731997 ?auto_731998 ?auto_731999 ?auto_732000 ?auto_732001 ?auto_732002 ?auto_732003 ?auto_732004 ?auto_732005 ?auto_732006 ?auto_732007 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732026 - BLOCK
      ?auto_732027 - BLOCK
      ?auto_732028 - BLOCK
      ?auto_732029 - BLOCK
      ?auto_732030 - BLOCK
      ?auto_732031 - BLOCK
      ?auto_732032 - BLOCK
      ?auto_732033 - BLOCK
      ?auto_732034 - BLOCK
      ?auto_732035 - BLOCK
      ?auto_732036 - BLOCK
      ?auto_732037 - BLOCK
      ?auto_732038 - BLOCK
      ?auto_732039 - BLOCK
      ?auto_732040 - BLOCK
      ?auto_732041 - BLOCK
      ?auto_732042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_732042 ) ( ON-TABLE ?auto_732026 ) ( ON ?auto_732027 ?auto_732026 ) ( not ( = ?auto_732026 ?auto_732027 ) ) ( not ( = ?auto_732026 ?auto_732028 ) ) ( not ( = ?auto_732026 ?auto_732029 ) ) ( not ( = ?auto_732026 ?auto_732030 ) ) ( not ( = ?auto_732026 ?auto_732031 ) ) ( not ( = ?auto_732026 ?auto_732032 ) ) ( not ( = ?auto_732026 ?auto_732033 ) ) ( not ( = ?auto_732026 ?auto_732034 ) ) ( not ( = ?auto_732026 ?auto_732035 ) ) ( not ( = ?auto_732026 ?auto_732036 ) ) ( not ( = ?auto_732026 ?auto_732037 ) ) ( not ( = ?auto_732026 ?auto_732038 ) ) ( not ( = ?auto_732026 ?auto_732039 ) ) ( not ( = ?auto_732026 ?auto_732040 ) ) ( not ( = ?auto_732026 ?auto_732041 ) ) ( not ( = ?auto_732026 ?auto_732042 ) ) ( not ( = ?auto_732027 ?auto_732028 ) ) ( not ( = ?auto_732027 ?auto_732029 ) ) ( not ( = ?auto_732027 ?auto_732030 ) ) ( not ( = ?auto_732027 ?auto_732031 ) ) ( not ( = ?auto_732027 ?auto_732032 ) ) ( not ( = ?auto_732027 ?auto_732033 ) ) ( not ( = ?auto_732027 ?auto_732034 ) ) ( not ( = ?auto_732027 ?auto_732035 ) ) ( not ( = ?auto_732027 ?auto_732036 ) ) ( not ( = ?auto_732027 ?auto_732037 ) ) ( not ( = ?auto_732027 ?auto_732038 ) ) ( not ( = ?auto_732027 ?auto_732039 ) ) ( not ( = ?auto_732027 ?auto_732040 ) ) ( not ( = ?auto_732027 ?auto_732041 ) ) ( not ( = ?auto_732027 ?auto_732042 ) ) ( not ( = ?auto_732028 ?auto_732029 ) ) ( not ( = ?auto_732028 ?auto_732030 ) ) ( not ( = ?auto_732028 ?auto_732031 ) ) ( not ( = ?auto_732028 ?auto_732032 ) ) ( not ( = ?auto_732028 ?auto_732033 ) ) ( not ( = ?auto_732028 ?auto_732034 ) ) ( not ( = ?auto_732028 ?auto_732035 ) ) ( not ( = ?auto_732028 ?auto_732036 ) ) ( not ( = ?auto_732028 ?auto_732037 ) ) ( not ( = ?auto_732028 ?auto_732038 ) ) ( not ( = ?auto_732028 ?auto_732039 ) ) ( not ( = ?auto_732028 ?auto_732040 ) ) ( not ( = ?auto_732028 ?auto_732041 ) ) ( not ( = ?auto_732028 ?auto_732042 ) ) ( not ( = ?auto_732029 ?auto_732030 ) ) ( not ( = ?auto_732029 ?auto_732031 ) ) ( not ( = ?auto_732029 ?auto_732032 ) ) ( not ( = ?auto_732029 ?auto_732033 ) ) ( not ( = ?auto_732029 ?auto_732034 ) ) ( not ( = ?auto_732029 ?auto_732035 ) ) ( not ( = ?auto_732029 ?auto_732036 ) ) ( not ( = ?auto_732029 ?auto_732037 ) ) ( not ( = ?auto_732029 ?auto_732038 ) ) ( not ( = ?auto_732029 ?auto_732039 ) ) ( not ( = ?auto_732029 ?auto_732040 ) ) ( not ( = ?auto_732029 ?auto_732041 ) ) ( not ( = ?auto_732029 ?auto_732042 ) ) ( not ( = ?auto_732030 ?auto_732031 ) ) ( not ( = ?auto_732030 ?auto_732032 ) ) ( not ( = ?auto_732030 ?auto_732033 ) ) ( not ( = ?auto_732030 ?auto_732034 ) ) ( not ( = ?auto_732030 ?auto_732035 ) ) ( not ( = ?auto_732030 ?auto_732036 ) ) ( not ( = ?auto_732030 ?auto_732037 ) ) ( not ( = ?auto_732030 ?auto_732038 ) ) ( not ( = ?auto_732030 ?auto_732039 ) ) ( not ( = ?auto_732030 ?auto_732040 ) ) ( not ( = ?auto_732030 ?auto_732041 ) ) ( not ( = ?auto_732030 ?auto_732042 ) ) ( not ( = ?auto_732031 ?auto_732032 ) ) ( not ( = ?auto_732031 ?auto_732033 ) ) ( not ( = ?auto_732031 ?auto_732034 ) ) ( not ( = ?auto_732031 ?auto_732035 ) ) ( not ( = ?auto_732031 ?auto_732036 ) ) ( not ( = ?auto_732031 ?auto_732037 ) ) ( not ( = ?auto_732031 ?auto_732038 ) ) ( not ( = ?auto_732031 ?auto_732039 ) ) ( not ( = ?auto_732031 ?auto_732040 ) ) ( not ( = ?auto_732031 ?auto_732041 ) ) ( not ( = ?auto_732031 ?auto_732042 ) ) ( not ( = ?auto_732032 ?auto_732033 ) ) ( not ( = ?auto_732032 ?auto_732034 ) ) ( not ( = ?auto_732032 ?auto_732035 ) ) ( not ( = ?auto_732032 ?auto_732036 ) ) ( not ( = ?auto_732032 ?auto_732037 ) ) ( not ( = ?auto_732032 ?auto_732038 ) ) ( not ( = ?auto_732032 ?auto_732039 ) ) ( not ( = ?auto_732032 ?auto_732040 ) ) ( not ( = ?auto_732032 ?auto_732041 ) ) ( not ( = ?auto_732032 ?auto_732042 ) ) ( not ( = ?auto_732033 ?auto_732034 ) ) ( not ( = ?auto_732033 ?auto_732035 ) ) ( not ( = ?auto_732033 ?auto_732036 ) ) ( not ( = ?auto_732033 ?auto_732037 ) ) ( not ( = ?auto_732033 ?auto_732038 ) ) ( not ( = ?auto_732033 ?auto_732039 ) ) ( not ( = ?auto_732033 ?auto_732040 ) ) ( not ( = ?auto_732033 ?auto_732041 ) ) ( not ( = ?auto_732033 ?auto_732042 ) ) ( not ( = ?auto_732034 ?auto_732035 ) ) ( not ( = ?auto_732034 ?auto_732036 ) ) ( not ( = ?auto_732034 ?auto_732037 ) ) ( not ( = ?auto_732034 ?auto_732038 ) ) ( not ( = ?auto_732034 ?auto_732039 ) ) ( not ( = ?auto_732034 ?auto_732040 ) ) ( not ( = ?auto_732034 ?auto_732041 ) ) ( not ( = ?auto_732034 ?auto_732042 ) ) ( not ( = ?auto_732035 ?auto_732036 ) ) ( not ( = ?auto_732035 ?auto_732037 ) ) ( not ( = ?auto_732035 ?auto_732038 ) ) ( not ( = ?auto_732035 ?auto_732039 ) ) ( not ( = ?auto_732035 ?auto_732040 ) ) ( not ( = ?auto_732035 ?auto_732041 ) ) ( not ( = ?auto_732035 ?auto_732042 ) ) ( not ( = ?auto_732036 ?auto_732037 ) ) ( not ( = ?auto_732036 ?auto_732038 ) ) ( not ( = ?auto_732036 ?auto_732039 ) ) ( not ( = ?auto_732036 ?auto_732040 ) ) ( not ( = ?auto_732036 ?auto_732041 ) ) ( not ( = ?auto_732036 ?auto_732042 ) ) ( not ( = ?auto_732037 ?auto_732038 ) ) ( not ( = ?auto_732037 ?auto_732039 ) ) ( not ( = ?auto_732037 ?auto_732040 ) ) ( not ( = ?auto_732037 ?auto_732041 ) ) ( not ( = ?auto_732037 ?auto_732042 ) ) ( not ( = ?auto_732038 ?auto_732039 ) ) ( not ( = ?auto_732038 ?auto_732040 ) ) ( not ( = ?auto_732038 ?auto_732041 ) ) ( not ( = ?auto_732038 ?auto_732042 ) ) ( not ( = ?auto_732039 ?auto_732040 ) ) ( not ( = ?auto_732039 ?auto_732041 ) ) ( not ( = ?auto_732039 ?auto_732042 ) ) ( not ( = ?auto_732040 ?auto_732041 ) ) ( not ( = ?auto_732040 ?auto_732042 ) ) ( not ( = ?auto_732041 ?auto_732042 ) ) ( ON ?auto_732041 ?auto_732042 ) ( ON ?auto_732040 ?auto_732041 ) ( ON ?auto_732039 ?auto_732040 ) ( ON ?auto_732038 ?auto_732039 ) ( ON ?auto_732037 ?auto_732038 ) ( ON ?auto_732036 ?auto_732037 ) ( ON ?auto_732035 ?auto_732036 ) ( ON ?auto_732034 ?auto_732035 ) ( ON ?auto_732033 ?auto_732034 ) ( ON ?auto_732032 ?auto_732033 ) ( ON ?auto_732031 ?auto_732032 ) ( ON ?auto_732030 ?auto_732031 ) ( ON ?auto_732029 ?auto_732030 ) ( CLEAR ?auto_732027 ) ( ON ?auto_732028 ?auto_732029 ) ( CLEAR ?auto_732028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_732026 ?auto_732027 ?auto_732028 )
      ( MAKE-17PILE ?auto_732026 ?auto_732027 ?auto_732028 ?auto_732029 ?auto_732030 ?auto_732031 ?auto_732032 ?auto_732033 ?auto_732034 ?auto_732035 ?auto_732036 ?auto_732037 ?auto_732038 ?auto_732039 ?auto_732040 ?auto_732041 ?auto_732042 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732060 - BLOCK
      ?auto_732061 - BLOCK
      ?auto_732062 - BLOCK
      ?auto_732063 - BLOCK
      ?auto_732064 - BLOCK
      ?auto_732065 - BLOCK
      ?auto_732066 - BLOCK
      ?auto_732067 - BLOCK
      ?auto_732068 - BLOCK
      ?auto_732069 - BLOCK
      ?auto_732070 - BLOCK
      ?auto_732071 - BLOCK
      ?auto_732072 - BLOCK
      ?auto_732073 - BLOCK
      ?auto_732074 - BLOCK
      ?auto_732075 - BLOCK
      ?auto_732076 - BLOCK
    )
    :vars
    (
      ?auto_732077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732076 ?auto_732077 ) ( ON-TABLE ?auto_732060 ) ( not ( = ?auto_732060 ?auto_732061 ) ) ( not ( = ?auto_732060 ?auto_732062 ) ) ( not ( = ?auto_732060 ?auto_732063 ) ) ( not ( = ?auto_732060 ?auto_732064 ) ) ( not ( = ?auto_732060 ?auto_732065 ) ) ( not ( = ?auto_732060 ?auto_732066 ) ) ( not ( = ?auto_732060 ?auto_732067 ) ) ( not ( = ?auto_732060 ?auto_732068 ) ) ( not ( = ?auto_732060 ?auto_732069 ) ) ( not ( = ?auto_732060 ?auto_732070 ) ) ( not ( = ?auto_732060 ?auto_732071 ) ) ( not ( = ?auto_732060 ?auto_732072 ) ) ( not ( = ?auto_732060 ?auto_732073 ) ) ( not ( = ?auto_732060 ?auto_732074 ) ) ( not ( = ?auto_732060 ?auto_732075 ) ) ( not ( = ?auto_732060 ?auto_732076 ) ) ( not ( = ?auto_732060 ?auto_732077 ) ) ( not ( = ?auto_732061 ?auto_732062 ) ) ( not ( = ?auto_732061 ?auto_732063 ) ) ( not ( = ?auto_732061 ?auto_732064 ) ) ( not ( = ?auto_732061 ?auto_732065 ) ) ( not ( = ?auto_732061 ?auto_732066 ) ) ( not ( = ?auto_732061 ?auto_732067 ) ) ( not ( = ?auto_732061 ?auto_732068 ) ) ( not ( = ?auto_732061 ?auto_732069 ) ) ( not ( = ?auto_732061 ?auto_732070 ) ) ( not ( = ?auto_732061 ?auto_732071 ) ) ( not ( = ?auto_732061 ?auto_732072 ) ) ( not ( = ?auto_732061 ?auto_732073 ) ) ( not ( = ?auto_732061 ?auto_732074 ) ) ( not ( = ?auto_732061 ?auto_732075 ) ) ( not ( = ?auto_732061 ?auto_732076 ) ) ( not ( = ?auto_732061 ?auto_732077 ) ) ( not ( = ?auto_732062 ?auto_732063 ) ) ( not ( = ?auto_732062 ?auto_732064 ) ) ( not ( = ?auto_732062 ?auto_732065 ) ) ( not ( = ?auto_732062 ?auto_732066 ) ) ( not ( = ?auto_732062 ?auto_732067 ) ) ( not ( = ?auto_732062 ?auto_732068 ) ) ( not ( = ?auto_732062 ?auto_732069 ) ) ( not ( = ?auto_732062 ?auto_732070 ) ) ( not ( = ?auto_732062 ?auto_732071 ) ) ( not ( = ?auto_732062 ?auto_732072 ) ) ( not ( = ?auto_732062 ?auto_732073 ) ) ( not ( = ?auto_732062 ?auto_732074 ) ) ( not ( = ?auto_732062 ?auto_732075 ) ) ( not ( = ?auto_732062 ?auto_732076 ) ) ( not ( = ?auto_732062 ?auto_732077 ) ) ( not ( = ?auto_732063 ?auto_732064 ) ) ( not ( = ?auto_732063 ?auto_732065 ) ) ( not ( = ?auto_732063 ?auto_732066 ) ) ( not ( = ?auto_732063 ?auto_732067 ) ) ( not ( = ?auto_732063 ?auto_732068 ) ) ( not ( = ?auto_732063 ?auto_732069 ) ) ( not ( = ?auto_732063 ?auto_732070 ) ) ( not ( = ?auto_732063 ?auto_732071 ) ) ( not ( = ?auto_732063 ?auto_732072 ) ) ( not ( = ?auto_732063 ?auto_732073 ) ) ( not ( = ?auto_732063 ?auto_732074 ) ) ( not ( = ?auto_732063 ?auto_732075 ) ) ( not ( = ?auto_732063 ?auto_732076 ) ) ( not ( = ?auto_732063 ?auto_732077 ) ) ( not ( = ?auto_732064 ?auto_732065 ) ) ( not ( = ?auto_732064 ?auto_732066 ) ) ( not ( = ?auto_732064 ?auto_732067 ) ) ( not ( = ?auto_732064 ?auto_732068 ) ) ( not ( = ?auto_732064 ?auto_732069 ) ) ( not ( = ?auto_732064 ?auto_732070 ) ) ( not ( = ?auto_732064 ?auto_732071 ) ) ( not ( = ?auto_732064 ?auto_732072 ) ) ( not ( = ?auto_732064 ?auto_732073 ) ) ( not ( = ?auto_732064 ?auto_732074 ) ) ( not ( = ?auto_732064 ?auto_732075 ) ) ( not ( = ?auto_732064 ?auto_732076 ) ) ( not ( = ?auto_732064 ?auto_732077 ) ) ( not ( = ?auto_732065 ?auto_732066 ) ) ( not ( = ?auto_732065 ?auto_732067 ) ) ( not ( = ?auto_732065 ?auto_732068 ) ) ( not ( = ?auto_732065 ?auto_732069 ) ) ( not ( = ?auto_732065 ?auto_732070 ) ) ( not ( = ?auto_732065 ?auto_732071 ) ) ( not ( = ?auto_732065 ?auto_732072 ) ) ( not ( = ?auto_732065 ?auto_732073 ) ) ( not ( = ?auto_732065 ?auto_732074 ) ) ( not ( = ?auto_732065 ?auto_732075 ) ) ( not ( = ?auto_732065 ?auto_732076 ) ) ( not ( = ?auto_732065 ?auto_732077 ) ) ( not ( = ?auto_732066 ?auto_732067 ) ) ( not ( = ?auto_732066 ?auto_732068 ) ) ( not ( = ?auto_732066 ?auto_732069 ) ) ( not ( = ?auto_732066 ?auto_732070 ) ) ( not ( = ?auto_732066 ?auto_732071 ) ) ( not ( = ?auto_732066 ?auto_732072 ) ) ( not ( = ?auto_732066 ?auto_732073 ) ) ( not ( = ?auto_732066 ?auto_732074 ) ) ( not ( = ?auto_732066 ?auto_732075 ) ) ( not ( = ?auto_732066 ?auto_732076 ) ) ( not ( = ?auto_732066 ?auto_732077 ) ) ( not ( = ?auto_732067 ?auto_732068 ) ) ( not ( = ?auto_732067 ?auto_732069 ) ) ( not ( = ?auto_732067 ?auto_732070 ) ) ( not ( = ?auto_732067 ?auto_732071 ) ) ( not ( = ?auto_732067 ?auto_732072 ) ) ( not ( = ?auto_732067 ?auto_732073 ) ) ( not ( = ?auto_732067 ?auto_732074 ) ) ( not ( = ?auto_732067 ?auto_732075 ) ) ( not ( = ?auto_732067 ?auto_732076 ) ) ( not ( = ?auto_732067 ?auto_732077 ) ) ( not ( = ?auto_732068 ?auto_732069 ) ) ( not ( = ?auto_732068 ?auto_732070 ) ) ( not ( = ?auto_732068 ?auto_732071 ) ) ( not ( = ?auto_732068 ?auto_732072 ) ) ( not ( = ?auto_732068 ?auto_732073 ) ) ( not ( = ?auto_732068 ?auto_732074 ) ) ( not ( = ?auto_732068 ?auto_732075 ) ) ( not ( = ?auto_732068 ?auto_732076 ) ) ( not ( = ?auto_732068 ?auto_732077 ) ) ( not ( = ?auto_732069 ?auto_732070 ) ) ( not ( = ?auto_732069 ?auto_732071 ) ) ( not ( = ?auto_732069 ?auto_732072 ) ) ( not ( = ?auto_732069 ?auto_732073 ) ) ( not ( = ?auto_732069 ?auto_732074 ) ) ( not ( = ?auto_732069 ?auto_732075 ) ) ( not ( = ?auto_732069 ?auto_732076 ) ) ( not ( = ?auto_732069 ?auto_732077 ) ) ( not ( = ?auto_732070 ?auto_732071 ) ) ( not ( = ?auto_732070 ?auto_732072 ) ) ( not ( = ?auto_732070 ?auto_732073 ) ) ( not ( = ?auto_732070 ?auto_732074 ) ) ( not ( = ?auto_732070 ?auto_732075 ) ) ( not ( = ?auto_732070 ?auto_732076 ) ) ( not ( = ?auto_732070 ?auto_732077 ) ) ( not ( = ?auto_732071 ?auto_732072 ) ) ( not ( = ?auto_732071 ?auto_732073 ) ) ( not ( = ?auto_732071 ?auto_732074 ) ) ( not ( = ?auto_732071 ?auto_732075 ) ) ( not ( = ?auto_732071 ?auto_732076 ) ) ( not ( = ?auto_732071 ?auto_732077 ) ) ( not ( = ?auto_732072 ?auto_732073 ) ) ( not ( = ?auto_732072 ?auto_732074 ) ) ( not ( = ?auto_732072 ?auto_732075 ) ) ( not ( = ?auto_732072 ?auto_732076 ) ) ( not ( = ?auto_732072 ?auto_732077 ) ) ( not ( = ?auto_732073 ?auto_732074 ) ) ( not ( = ?auto_732073 ?auto_732075 ) ) ( not ( = ?auto_732073 ?auto_732076 ) ) ( not ( = ?auto_732073 ?auto_732077 ) ) ( not ( = ?auto_732074 ?auto_732075 ) ) ( not ( = ?auto_732074 ?auto_732076 ) ) ( not ( = ?auto_732074 ?auto_732077 ) ) ( not ( = ?auto_732075 ?auto_732076 ) ) ( not ( = ?auto_732075 ?auto_732077 ) ) ( not ( = ?auto_732076 ?auto_732077 ) ) ( ON ?auto_732075 ?auto_732076 ) ( ON ?auto_732074 ?auto_732075 ) ( ON ?auto_732073 ?auto_732074 ) ( ON ?auto_732072 ?auto_732073 ) ( ON ?auto_732071 ?auto_732072 ) ( ON ?auto_732070 ?auto_732071 ) ( ON ?auto_732069 ?auto_732070 ) ( ON ?auto_732068 ?auto_732069 ) ( ON ?auto_732067 ?auto_732068 ) ( ON ?auto_732066 ?auto_732067 ) ( ON ?auto_732065 ?auto_732066 ) ( ON ?auto_732064 ?auto_732065 ) ( ON ?auto_732063 ?auto_732064 ) ( ON ?auto_732062 ?auto_732063 ) ( CLEAR ?auto_732060 ) ( ON ?auto_732061 ?auto_732062 ) ( CLEAR ?auto_732061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732060 ?auto_732061 )
      ( MAKE-17PILE ?auto_732060 ?auto_732061 ?auto_732062 ?auto_732063 ?auto_732064 ?auto_732065 ?auto_732066 ?auto_732067 ?auto_732068 ?auto_732069 ?auto_732070 ?auto_732071 ?auto_732072 ?auto_732073 ?auto_732074 ?auto_732075 ?auto_732076 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732095 - BLOCK
      ?auto_732096 - BLOCK
      ?auto_732097 - BLOCK
      ?auto_732098 - BLOCK
      ?auto_732099 - BLOCK
      ?auto_732100 - BLOCK
      ?auto_732101 - BLOCK
      ?auto_732102 - BLOCK
      ?auto_732103 - BLOCK
      ?auto_732104 - BLOCK
      ?auto_732105 - BLOCK
      ?auto_732106 - BLOCK
      ?auto_732107 - BLOCK
      ?auto_732108 - BLOCK
      ?auto_732109 - BLOCK
      ?auto_732110 - BLOCK
      ?auto_732111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_732111 ) ( ON-TABLE ?auto_732095 ) ( not ( = ?auto_732095 ?auto_732096 ) ) ( not ( = ?auto_732095 ?auto_732097 ) ) ( not ( = ?auto_732095 ?auto_732098 ) ) ( not ( = ?auto_732095 ?auto_732099 ) ) ( not ( = ?auto_732095 ?auto_732100 ) ) ( not ( = ?auto_732095 ?auto_732101 ) ) ( not ( = ?auto_732095 ?auto_732102 ) ) ( not ( = ?auto_732095 ?auto_732103 ) ) ( not ( = ?auto_732095 ?auto_732104 ) ) ( not ( = ?auto_732095 ?auto_732105 ) ) ( not ( = ?auto_732095 ?auto_732106 ) ) ( not ( = ?auto_732095 ?auto_732107 ) ) ( not ( = ?auto_732095 ?auto_732108 ) ) ( not ( = ?auto_732095 ?auto_732109 ) ) ( not ( = ?auto_732095 ?auto_732110 ) ) ( not ( = ?auto_732095 ?auto_732111 ) ) ( not ( = ?auto_732096 ?auto_732097 ) ) ( not ( = ?auto_732096 ?auto_732098 ) ) ( not ( = ?auto_732096 ?auto_732099 ) ) ( not ( = ?auto_732096 ?auto_732100 ) ) ( not ( = ?auto_732096 ?auto_732101 ) ) ( not ( = ?auto_732096 ?auto_732102 ) ) ( not ( = ?auto_732096 ?auto_732103 ) ) ( not ( = ?auto_732096 ?auto_732104 ) ) ( not ( = ?auto_732096 ?auto_732105 ) ) ( not ( = ?auto_732096 ?auto_732106 ) ) ( not ( = ?auto_732096 ?auto_732107 ) ) ( not ( = ?auto_732096 ?auto_732108 ) ) ( not ( = ?auto_732096 ?auto_732109 ) ) ( not ( = ?auto_732096 ?auto_732110 ) ) ( not ( = ?auto_732096 ?auto_732111 ) ) ( not ( = ?auto_732097 ?auto_732098 ) ) ( not ( = ?auto_732097 ?auto_732099 ) ) ( not ( = ?auto_732097 ?auto_732100 ) ) ( not ( = ?auto_732097 ?auto_732101 ) ) ( not ( = ?auto_732097 ?auto_732102 ) ) ( not ( = ?auto_732097 ?auto_732103 ) ) ( not ( = ?auto_732097 ?auto_732104 ) ) ( not ( = ?auto_732097 ?auto_732105 ) ) ( not ( = ?auto_732097 ?auto_732106 ) ) ( not ( = ?auto_732097 ?auto_732107 ) ) ( not ( = ?auto_732097 ?auto_732108 ) ) ( not ( = ?auto_732097 ?auto_732109 ) ) ( not ( = ?auto_732097 ?auto_732110 ) ) ( not ( = ?auto_732097 ?auto_732111 ) ) ( not ( = ?auto_732098 ?auto_732099 ) ) ( not ( = ?auto_732098 ?auto_732100 ) ) ( not ( = ?auto_732098 ?auto_732101 ) ) ( not ( = ?auto_732098 ?auto_732102 ) ) ( not ( = ?auto_732098 ?auto_732103 ) ) ( not ( = ?auto_732098 ?auto_732104 ) ) ( not ( = ?auto_732098 ?auto_732105 ) ) ( not ( = ?auto_732098 ?auto_732106 ) ) ( not ( = ?auto_732098 ?auto_732107 ) ) ( not ( = ?auto_732098 ?auto_732108 ) ) ( not ( = ?auto_732098 ?auto_732109 ) ) ( not ( = ?auto_732098 ?auto_732110 ) ) ( not ( = ?auto_732098 ?auto_732111 ) ) ( not ( = ?auto_732099 ?auto_732100 ) ) ( not ( = ?auto_732099 ?auto_732101 ) ) ( not ( = ?auto_732099 ?auto_732102 ) ) ( not ( = ?auto_732099 ?auto_732103 ) ) ( not ( = ?auto_732099 ?auto_732104 ) ) ( not ( = ?auto_732099 ?auto_732105 ) ) ( not ( = ?auto_732099 ?auto_732106 ) ) ( not ( = ?auto_732099 ?auto_732107 ) ) ( not ( = ?auto_732099 ?auto_732108 ) ) ( not ( = ?auto_732099 ?auto_732109 ) ) ( not ( = ?auto_732099 ?auto_732110 ) ) ( not ( = ?auto_732099 ?auto_732111 ) ) ( not ( = ?auto_732100 ?auto_732101 ) ) ( not ( = ?auto_732100 ?auto_732102 ) ) ( not ( = ?auto_732100 ?auto_732103 ) ) ( not ( = ?auto_732100 ?auto_732104 ) ) ( not ( = ?auto_732100 ?auto_732105 ) ) ( not ( = ?auto_732100 ?auto_732106 ) ) ( not ( = ?auto_732100 ?auto_732107 ) ) ( not ( = ?auto_732100 ?auto_732108 ) ) ( not ( = ?auto_732100 ?auto_732109 ) ) ( not ( = ?auto_732100 ?auto_732110 ) ) ( not ( = ?auto_732100 ?auto_732111 ) ) ( not ( = ?auto_732101 ?auto_732102 ) ) ( not ( = ?auto_732101 ?auto_732103 ) ) ( not ( = ?auto_732101 ?auto_732104 ) ) ( not ( = ?auto_732101 ?auto_732105 ) ) ( not ( = ?auto_732101 ?auto_732106 ) ) ( not ( = ?auto_732101 ?auto_732107 ) ) ( not ( = ?auto_732101 ?auto_732108 ) ) ( not ( = ?auto_732101 ?auto_732109 ) ) ( not ( = ?auto_732101 ?auto_732110 ) ) ( not ( = ?auto_732101 ?auto_732111 ) ) ( not ( = ?auto_732102 ?auto_732103 ) ) ( not ( = ?auto_732102 ?auto_732104 ) ) ( not ( = ?auto_732102 ?auto_732105 ) ) ( not ( = ?auto_732102 ?auto_732106 ) ) ( not ( = ?auto_732102 ?auto_732107 ) ) ( not ( = ?auto_732102 ?auto_732108 ) ) ( not ( = ?auto_732102 ?auto_732109 ) ) ( not ( = ?auto_732102 ?auto_732110 ) ) ( not ( = ?auto_732102 ?auto_732111 ) ) ( not ( = ?auto_732103 ?auto_732104 ) ) ( not ( = ?auto_732103 ?auto_732105 ) ) ( not ( = ?auto_732103 ?auto_732106 ) ) ( not ( = ?auto_732103 ?auto_732107 ) ) ( not ( = ?auto_732103 ?auto_732108 ) ) ( not ( = ?auto_732103 ?auto_732109 ) ) ( not ( = ?auto_732103 ?auto_732110 ) ) ( not ( = ?auto_732103 ?auto_732111 ) ) ( not ( = ?auto_732104 ?auto_732105 ) ) ( not ( = ?auto_732104 ?auto_732106 ) ) ( not ( = ?auto_732104 ?auto_732107 ) ) ( not ( = ?auto_732104 ?auto_732108 ) ) ( not ( = ?auto_732104 ?auto_732109 ) ) ( not ( = ?auto_732104 ?auto_732110 ) ) ( not ( = ?auto_732104 ?auto_732111 ) ) ( not ( = ?auto_732105 ?auto_732106 ) ) ( not ( = ?auto_732105 ?auto_732107 ) ) ( not ( = ?auto_732105 ?auto_732108 ) ) ( not ( = ?auto_732105 ?auto_732109 ) ) ( not ( = ?auto_732105 ?auto_732110 ) ) ( not ( = ?auto_732105 ?auto_732111 ) ) ( not ( = ?auto_732106 ?auto_732107 ) ) ( not ( = ?auto_732106 ?auto_732108 ) ) ( not ( = ?auto_732106 ?auto_732109 ) ) ( not ( = ?auto_732106 ?auto_732110 ) ) ( not ( = ?auto_732106 ?auto_732111 ) ) ( not ( = ?auto_732107 ?auto_732108 ) ) ( not ( = ?auto_732107 ?auto_732109 ) ) ( not ( = ?auto_732107 ?auto_732110 ) ) ( not ( = ?auto_732107 ?auto_732111 ) ) ( not ( = ?auto_732108 ?auto_732109 ) ) ( not ( = ?auto_732108 ?auto_732110 ) ) ( not ( = ?auto_732108 ?auto_732111 ) ) ( not ( = ?auto_732109 ?auto_732110 ) ) ( not ( = ?auto_732109 ?auto_732111 ) ) ( not ( = ?auto_732110 ?auto_732111 ) ) ( ON ?auto_732110 ?auto_732111 ) ( ON ?auto_732109 ?auto_732110 ) ( ON ?auto_732108 ?auto_732109 ) ( ON ?auto_732107 ?auto_732108 ) ( ON ?auto_732106 ?auto_732107 ) ( ON ?auto_732105 ?auto_732106 ) ( ON ?auto_732104 ?auto_732105 ) ( ON ?auto_732103 ?auto_732104 ) ( ON ?auto_732102 ?auto_732103 ) ( ON ?auto_732101 ?auto_732102 ) ( ON ?auto_732100 ?auto_732101 ) ( ON ?auto_732099 ?auto_732100 ) ( ON ?auto_732098 ?auto_732099 ) ( ON ?auto_732097 ?auto_732098 ) ( CLEAR ?auto_732095 ) ( ON ?auto_732096 ?auto_732097 ) ( CLEAR ?auto_732096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_732095 ?auto_732096 )
      ( MAKE-17PILE ?auto_732095 ?auto_732096 ?auto_732097 ?auto_732098 ?auto_732099 ?auto_732100 ?auto_732101 ?auto_732102 ?auto_732103 ?auto_732104 ?auto_732105 ?auto_732106 ?auto_732107 ?auto_732108 ?auto_732109 ?auto_732110 ?auto_732111 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732129 - BLOCK
      ?auto_732130 - BLOCK
      ?auto_732131 - BLOCK
      ?auto_732132 - BLOCK
      ?auto_732133 - BLOCK
      ?auto_732134 - BLOCK
      ?auto_732135 - BLOCK
      ?auto_732136 - BLOCK
      ?auto_732137 - BLOCK
      ?auto_732138 - BLOCK
      ?auto_732139 - BLOCK
      ?auto_732140 - BLOCK
      ?auto_732141 - BLOCK
      ?auto_732142 - BLOCK
      ?auto_732143 - BLOCK
      ?auto_732144 - BLOCK
      ?auto_732145 - BLOCK
    )
    :vars
    (
      ?auto_732146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_732145 ?auto_732146 ) ( not ( = ?auto_732129 ?auto_732130 ) ) ( not ( = ?auto_732129 ?auto_732131 ) ) ( not ( = ?auto_732129 ?auto_732132 ) ) ( not ( = ?auto_732129 ?auto_732133 ) ) ( not ( = ?auto_732129 ?auto_732134 ) ) ( not ( = ?auto_732129 ?auto_732135 ) ) ( not ( = ?auto_732129 ?auto_732136 ) ) ( not ( = ?auto_732129 ?auto_732137 ) ) ( not ( = ?auto_732129 ?auto_732138 ) ) ( not ( = ?auto_732129 ?auto_732139 ) ) ( not ( = ?auto_732129 ?auto_732140 ) ) ( not ( = ?auto_732129 ?auto_732141 ) ) ( not ( = ?auto_732129 ?auto_732142 ) ) ( not ( = ?auto_732129 ?auto_732143 ) ) ( not ( = ?auto_732129 ?auto_732144 ) ) ( not ( = ?auto_732129 ?auto_732145 ) ) ( not ( = ?auto_732129 ?auto_732146 ) ) ( not ( = ?auto_732130 ?auto_732131 ) ) ( not ( = ?auto_732130 ?auto_732132 ) ) ( not ( = ?auto_732130 ?auto_732133 ) ) ( not ( = ?auto_732130 ?auto_732134 ) ) ( not ( = ?auto_732130 ?auto_732135 ) ) ( not ( = ?auto_732130 ?auto_732136 ) ) ( not ( = ?auto_732130 ?auto_732137 ) ) ( not ( = ?auto_732130 ?auto_732138 ) ) ( not ( = ?auto_732130 ?auto_732139 ) ) ( not ( = ?auto_732130 ?auto_732140 ) ) ( not ( = ?auto_732130 ?auto_732141 ) ) ( not ( = ?auto_732130 ?auto_732142 ) ) ( not ( = ?auto_732130 ?auto_732143 ) ) ( not ( = ?auto_732130 ?auto_732144 ) ) ( not ( = ?auto_732130 ?auto_732145 ) ) ( not ( = ?auto_732130 ?auto_732146 ) ) ( not ( = ?auto_732131 ?auto_732132 ) ) ( not ( = ?auto_732131 ?auto_732133 ) ) ( not ( = ?auto_732131 ?auto_732134 ) ) ( not ( = ?auto_732131 ?auto_732135 ) ) ( not ( = ?auto_732131 ?auto_732136 ) ) ( not ( = ?auto_732131 ?auto_732137 ) ) ( not ( = ?auto_732131 ?auto_732138 ) ) ( not ( = ?auto_732131 ?auto_732139 ) ) ( not ( = ?auto_732131 ?auto_732140 ) ) ( not ( = ?auto_732131 ?auto_732141 ) ) ( not ( = ?auto_732131 ?auto_732142 ) ) ( not ( = ?auto_732131 ?auto_732143 ) ) ( not ( = ?auto_732131 ?auto_732144 ) ) ( not ( = ?auto_732131 ?auto_732145 ) ) ( not ( = ?auto_732131 ?auto_732146 ) ) ( not ( = ?auto_732132 ?auto_732133 ) ) ( not ( = ?auto_732132 ?auto_732134 ) ) ( not ( = ?auto_732132 ?auto_732135 ) ) ( not ( = ?auto_732132 ?auto_732136 ) ) ( not ( = ?auto_732132 ?auto_732137 ) ) ( not ( = ?auto_732132 ?auto_732138 ) ) ( not ( = ?auto_732132 ?auto_732139 ) ) ( not ( = ?auto_732132 ?auto_732140 ) ) ( not ( = ?auto_732132 ?auto_732141 ) ) ( not ( = ?auto_732132 ?auto_732142 ) ) ( not ( = ?auto_732132 ?auto_732143 ) ) ( not ( = ?auto_732132 ?auto_732144 ) ) ( not ( = ?auto_732132 ?auto_732145 ) ) ( not ( = ?auto_732132 ?auto_732146 ) ) ( not ( = ?auto_732133 ?auto_732134 ) ) ( not ( = ?auto_732133 ?auto_732135 ) ) ( not ( = ?auto_732133 ?auto_732136 ) ) ( not ( = ?auto_732133 ?auto_732137 ) ) ( not ( = ?auto_732133 ?auto_732138 ) ) ( not ( = ?auto_732133 ?auto_732139 ) ) ( not ( = ?auto_732133 ?auto_732140 ) ) ( not ( = ?auto_732133 ?auto_732141 ) ) ( not ( = ?auto_732133 ?auto_732142 ) ) ( not ( = ?auto_732133 ?auto_732143 ) ) ( not ( = ?auto_732133 ?auto_732144 ) ) ( not ( = ?auto_732133 ?auto_732145 ) ) ( not ( = ?auto_732133 ?auto_732146 ) ) ( not ( = ?auto_732134 ?auto_732135 ) ) ( not ( = ?auto_732134 ?auto_732136 ) ) ( not ( = ?auto_732134 ?auto_732137 ) ) ( not ( = ?auto_732134 ?auto_732138 ) ) ( not ( = ?auto_732134 ?auto_732139 ) ) ( not ( = ?auto_732134 ?auto_732140 ) ) ( not ( = ?auto_732134 ?auto_732141 ) ) ( not ( = ?auto_732134 ?auto_732142 ) ) ( not ( = ?auto_732134 ?auto_732143 ) ) ( not ( = ?auto_732134 ?auto_732144 ) ) ( not ( = ?auto_732134 ?auto_732145 ) ) ( not ( = ?auto_732134 ?auto_732146 ) ) ( not ( = ?auto_732135 ?auto_732136 ) ) ( not ( = ?auto_732135 ?auto_732137 ) ) ( not ( = ?auto_732135 ?auto_732138 ) ) ( not ( = ?auto_732135 ?auto_732139 ) ) ( not ( = ?auto_732135 ?auto_732140 ) ) ( not ( = ?auto_732135 ?auto_732141 ) ) ( not ( = ?auto_732135 ?auto_732142 ) ) ( not ( = ?auto_732135 ?auto_732143 ) ) ( not ( = ?auto_732135 ?auto_732144 ) ) ( not ( = ?auto_732135 ?auto_732145 ) ) ( not ( = ?auto_732135 ?auto_732146 ) ) ( not ( = ?auto_732136 ?auto_732137 ) ) ( not ( = ?auto_732136 ?auto_732138 ) ) ( not ( = ?auto_732136 ?auto_732139 ) ) ( not ( = ?auto_732136 ?auto_732140 ) ) ( not ( = ?auto_732136 ?auto_732141 ) ) ( not ( = ?auto_732136 ?auto_732142 ) ) ( not ( = ?auto_732136 ?auto_732143 ) ) ( not ( = ?auto_732136 ?auto_732144 ) ) ( not ( = ?auto_732136 ?auto_732145 ) ) ( not ( = ?auto_732136 ?auto_732146 ) ) ( not ( = ?auto_732137 ?auto_732138 ) ) ( not ( = ?auto_732137 ?auto_732139 ) ) ( not ( = ?auto_732137 ?auto_732140 ) ) ( not ( = ?auto_732137 ?auto_732141 ) ) ( not ( = ?auto_732137 ?auto_732142 ) ) ( not ( = ?auto_732137 ?auto_732143 ) ) ( not ( = ?auto_732137 ?auto_732144 ) ) ( not ( = ?auto_732137 ?auto_732145 ) ) ( not ( = ?auto_732137 ?auto_732146 ) ) ( not ( = ?auto_732138 ?auto_732139 ) ) ( not ( = ?auto_732138 ?auto_732140 ) ) ( not ( = ?auto_732138 ?auto_732141 ) ) ( not ( = ?auto_732138 ?auto_732142 ) ) ( not ( = ?auto_732138 ?auto_732143 ) ) ( not ( = ?auto_732138 ?auto_732144 ) ) ( not ( = ?auto_732138 ?auto_732145 ) ) ( not ( = ?auto_732138 ?auto_732146 ) ) ( not ( = ?auto_732139 ?auto_732140 ) ) ( not ( = ?auto_732139 ?auto_732141 ) ) ( not ( = ?auto_732139 ?auto_732142 ) ) ( not ( = ?auto_732139 ?auto_732143 ) ) ( not ( = ?auto_732139 ?auto_732144 ) ) ( not ( = ?auto_732139 ?auto_732145 ) ) ( not ( = ?auto_732139 ?auto_732146 ) ) ( not ( = ?auto_732140 ?auto_732141 ) ) ( not ( = ?auto_732140 ?auto_732142 ) ) ( not ( = ?auto_732140 ?auto_732143 ) ) ( not ( = ?auto_732140 ?auto_732144 ) ) ( not ( = ?auto_732140 ?auto_732145 ) ) ( not ( = ?auto_732140 ?auto_732146 ) ) ( not ( = ?auto_732141 ?auto_732142 ) ) ( not ( = ?auto_732141 ?auto_732143 ) ) ( not ( = ?auto_732141 ?auto_732144 ) ) ( not ( = ?auto_732141 ?auto_732145 ) ) ( not ( = ?auto_732141 ?auto_732146 ) ) ( not ( = ?auto_732142 ?auto_732143 ) ) ( not ( = ?auto_732142 ?auto_732144 ) ) ( not ( = ?auto_732142 ?auto_732145 ) ) ( not ( = ?auto_732142 ?auto_732146 ) ) ( not ( = ?auto_732143 ?auto_732144 ) ) ( not ( = ?auto_732143 ?auto_732145 ) ) ( not ( = ?auto_732143 ?auto_732146 ) ) ( not ( = ?auto_732144 ?auto_732145 ) ) ( not ( = ?auto_732144 ?auto_732146 ) ) ( not ( = ?auto_732145 ?auto_732146 ) ) ( ON ?auto_732144 ?auto_732145 ) ( ON ?auto_732143 ?auto_732144 ) ( ON ?auto_732142 ?auto_732143 ) ( ON ?auto_732141 ?auto_732142 ) ( ON ?auto_732140 ?auto_732141 ) ( ON ?auto_732139 ?auto_732140 ) ( ON ?auto_732138 ?auto_732139 ) ( ON ?auto_732137 ?auto_732138 ) ( ON ?auto_732136 ?auto_732137 ) ( ON ?auto_732135 ?auto_732136 ) ( ON ?auto_732134 ?auto_732135 ) ( ON ?auto_732133 ?auto_732134 ) ( ON ?auto_732132 ?auto_732133 ) ( ON ?auto_732131 ?auto_732132 ) ( ON ?auto_732130 ?auto_732131 ) ( ON ?auto_732129 ?auto_732130 ) ( CLEAR ?auto_732129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732129 )
      ( MAKE-17PILE ?auto_732129 ?auto_732130 ?auto_732131 ?auto_732132 ?auto_732133 ?auto_732134 ?auto_732135 ?auto_732136 ?auto_732137 ?auto_732138 ?auto_732139 ?auto_732140 ?auto_732141 ?auto_732142 ?auto_732143 ?auto_732144 ?auto_732145 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732164 - BLOCK
      ?auto_732165 - BLOCK
      ?auto_732166 - BLOCK
      ?auto_732167 - BLOCK
      ?auto_732168 - BLOCK
      ?auto_732169 - BLOCK
      ?auto_732170 - BLOCK
      ?auto_732171 - BLOCK
      ?auto_732172 - BLOCK
      ?auto_732173 - BLOCK
      ?auto_732174 - BLOCK
      ?auto_732175 - BLOCK
      ?auto_732176 - BLOCK
      ?auto_732177 - BLOCK
      ?auto_732178 - BLOCK
      ?auto_732179 - BLOCK
      ?auto_732180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_732180 ) ( not ( = ?auto_732164 ?auto_732165 ) ) ( not ( = ?auto_732164 ?auto_732166 ) ) ( not ( = ?auto_732164 ?auto_732167 ) ) ( not ( = ?auto_732164 ?auto_732168 ) ) ( not ( = ?auto_732164 ?auto_732169 ) ) ( not ( = ?auto_732164 ?auto_732170 ) ) ( not ( = ?auto_732164 ?auto_732171 ) ) ( not ( = ?auto_732164 ?auto_732172 ) ) ( not ( = ?auto_732164 ?auto_732173 ) ) ( not ( = ?auto_732164 ?auto_732174 ) ) ( not ( = ?auto_732164 ?auto_732175 ) ) ( not ( = ?auto_732164 ?auto_732176 ) ) ( not ( = ?auto_732164 ?auto_732177 ) ) ( not ( = ?auto_732164 ?auto_732178 ) ) ( not ( = ?auto_732164 ?auto_732179 ) ) ( not ( = ?auto_732164 ?auto_732180 ) ) ( not ( = ?auto_732165 ?auto_732166 ) ) ( not ( = ?auto_732165 ?auto_732167 ) ) ( not ( = ?auto_732165 ?auto_732168 ) ) ( not ( = ?auto_732165 ?auto_732169 ) ) ( not ( = ?auto_732165 ?auto_732170 ) ) ( not ( = ?auto_732165 ?auto_732171 ) ) ( not ( = ?auto_732165 ?auto_732172 ) ) ( not ( = ?auto_732165 ?auto_732173 ) ) ( not ( = ?auto_732165 ?auto_732174 ) ) ( not ( = ?auto_732165 ?auto_732175 ) ) ( not ( = ?auto_732165 ?auto_732176 ) ) ( not ( = ?auto_732165 ?auto_732177 ) ) ( not ( = ?auto_732165 ?auto_732178 ) ) ( not ( = ?auto_732165 ?auto_732179 ) ) ( not ( = ?auto_732165 ?auto_732180 ) ) ( not ( = ?auto_732166 ?auto_732167 ) ) ( not ( = ?auto_732166 ?auto_732168 ) ) ( not ( = ?auto_732166 ?auto_732169 ) ) ( not ( = ?auto_732166 ?auto_732170 ) ) ( not ( = ?auto_732166 ?auto_732171 ) ) ( not ( = ?auto_732166 ?auto_732172 ) ) ( not ( = ?auto_732166 ?auto_732173 ) ) ( not ( = ?auto_732166 ?auto_732174 ) ) ( not ( = ?auto_732166 ?auto_732175 ) ) ( not ( = ?auto_732166 ?auto_732176 ) ) ( not ( = ?auto_732166 ?auto_732177 ) ) ( not ( = ?auto_732166 ?auto_732178 ) ) ( not ( = ?auto_732166 ?auto_732179 ) ) ( not ( = ?auto_732166 ?auto_732180 ) ) ( not ( = ?auto_732167 ?auto_732168 ) ) ( not ( = ?auto_732167 ?auto_732169 ) ) ( not ( = ?auto_732167 ?auto_732170 ) ) ( not ( = ?auto_732167 ?auto_732171 ) ) ( not ( = ?auto_732167 ?auto_732172 ) ) ( not ( = ?auto_732167 ?auto_732173 ) ) ( not ( = ?auto_732167 ?auto_732174 ) ) ( not ( = ?auto_732167 ?auto_732175 ) ) ( not ( = ?auto_732167 ?auto_732176 ) ) ( not ( = ?auto_732167 ?auto_732177 ) ) ( not ( = ?auto_732167 ?auto_732178 ) ) ( not ( = ?auto_732167 ?auto_732179 ) ) ( not ( = ?auto_732167 ?auto_732180 ) ) ( not ( = ?auto_732168 ?auto_732169 ) ) ( not ( = ?auto_732168 ?auto_732170 ) ) ( not ( = ?auto_732168 ?auto_732171 ) ) ( not ( = ?auto_732168 ?auto_732172 ) ) ( not ( = ?auto_732168 ?auto_732173 ) ) ( not ( = ?auto_732168 ?auto_732174 ) ) ( not ( = ?auto_732168 ?auto_732175 ) ) ( not ( = ?auto_732168 ?auto_732176 ) ) ( not ( = ?auto_732168 ?auto_732177 ) ) ( not ( = ?auto_732168 ?auto_732178 ) ) ( not ( = ?auto_732168 ?auto_732179 ) ) ( not ( = ?auto_732168 ?auto_732180 ) ) ( not ( = ?auto_732169 ?auto_732170 ) ) ( not ( = ?auto_732169 ?auto_732171 ) ) ( not ( = ?auto_732169 ?auto_732172 ) ) ( not ( = ?auto_732169 ?auto_732173 ) ) ( not ( = ?auto_732169 ?auto_732174 ) ) ( not ( = ?auto_732169 ?auto_732175 ) ) ( not ( = ?auto_732169 ?auto_732176 ) ) ( not ( = ?auto_732169 ?auto_732177 ) ) ( not ( = ?auto_732169 ?auto_732178 ) ) ( not ( = ?auto_732169 ?auto_732179 ) ) ( not ( = ?auto_732169 ?auto_732180 ) ) ( not ( = ?auto_732170 ?auto_732171 ) ) ( not ( = ?auto_732170 ?auto_732172 ) ) ( not ( = ?auto_732170 ?auto_732173 ) ) ( not ( = ?auto_732170 ?auto_732174 ) ) ( not ( = ?auto_732170 ?auto_732175 ) ) ( not ( = ?auto_732170 ?auto_732176 ) ) ( not ( = ?auto_732170 ?auto_732177 ) ) ( not ( = ?auto_732170 ?auto_732178 ) ) ( not ( = ?auto_732170 ?auto_732179 ) ) ( not ( = ?auto_732170 ?auto_732180 ) ) ( not ( = ?auto_732171 ?auto_732172 ) ) ( not ( = ?auto_732171 ?auto_732173 ) ) ( not ( = ?auto_732171 ?auto_732174 ) ) ( not ( = ?auto_732171 ?auto_732175 ) ) ( not ( = ?auto_732171 ?auto_732176 ) ) ( not ( = ?auto_732171 ?auto_732177 ) ) ( not ( = ?auto_732171 ?auto_732178 ) ) ( not ( = ?auto_732171 ?auto_732179 ) ) ( not ( = ?auto_732171 ?auto_732180 ) ) ( not ( = ?auto_732172 ?auto_732173 ) ) ( not ( = ?auto_732172 ?auto_732174 ) ) ( not ( = ?auto_732172 ?auto_732175 ) ) ( not ( = ?auto_732172 ?auto_732176 ) ) ( not ( = ?auto_732172 ?auto_732177 ) ) ( not ( = ?auto_732172 ?auto_732178 ) ) ( not ( = ?auto_732172 ?auto_732179 ) ) ( not ( = ?auto_732172 ?auto_732180 ) ) ( not ( = ?auto_732173 ?auto_732174 ) ) ( not ( = ?auto_732173 ?auto_732175 ) ) ( not ( = ?auto_732173 ?auto_732176 ) ) ( not ( = ?auto_732173 ?auto_732177 ) ) ( not ( = ?auto_732173 ?auto_732178 ) ) ( not ( = ?auto_732173 ?auto_732179 ) ) ( not ( = ?auto_732173 ?auto_732180 ) ) ( not ( = ?auto_732174 ?auto_732175 ) ) ( not ( = ?auto_732174 ?auto_732176 ) ) ( not ( = ?auto_732174 ?auto_732177 ) ) ( not ( = ?auto_732174 ?auto_732178 ) ) ( not ( = ?auto_732174 ?auto_732179 ) ) ( not ( = ?auto_732174 ?auto_732180 ) ) ( not ( = ?auto_732175 ?auto_732176 ) ) ( not ( = ?auto_732175 ?auto_732177 ) ) ( not ( = ?auto_732175 ?auto_732178 ) ) ( not ( = ?auto_732175 ?auto_732179 ) ) ( not ( = ?auto_732175 ?auto_732180 ) ) ( not ( = ?auto_732176 ?auto_732177 ) ) ( not ( = ?auto_732176 ?auto_732178 ) ) ( not ( = ?auto_732176 ?auto_732179 ) ) ( not ( = ?auto_732176 ?auto_732180 ) ) ( not ( = ?auto_732177 ?auto_732178 ) ) ( not ( = ?auto_732177 ?auto_732179 ) ) ( not ( = ?auto_732177 ?auto_732180 ) ) ( not ( = ?auto_732178 ?auto_732179 ) ) ( not ( = ?auto_732178 ?auto_732180 ) ) ( not ( = ?auto_732179 ?auto_732180 ) ) ( ON ?auto_732179 ?auto_732180 ) ( ON ?auto_732178 ?auto_732179 ) ( ON ?auto_732177 ?auto_732178 ) ( ON ?auto_732176 ?auto_732177 ) ( ON ?auto_732175 ?auto_732176 ) ( ON ?auto_732174 ?auto_732175 ) ( ON ?auto_732173 ?auto_732174 ) ( ON ?auto_732172 ?auto_732173 ) ( ON ?auto_732171 ?auto_732172 ) ( ON ?auto_732170 ?auto_732171 ) ( ON ?auto_732169 ?auto_732170 ) ( ON ?auto_732168 ?auto_732169 ) ( ON ?auto_732167 ?auto_732168 ) ( ON ?auto_732166 ?auto_732167 ) ( ON ?auto_732165 ?auto_732166 ) ( ON ?auto_732164 ?auto_732165 ) ( CLEAR ?auto_732164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_732164 )
      ( MAKE-17PILE ?auto_732164 ?auto_732165 ?auto_732166 ?auto_732167 ?auto_732168 ?auto_732169 ?auto_732170 ?auto_732171 ?auto_732172 ?auto_732173 ?auto_732174 ?auto_732175 ?auto_732176 ?auto_732177 ?auto_732178 ?auto_732179 ?auto_732180 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_732198 - BLOCK
      ?auto_732199 - BLOCK
      ?auto_732200 - BLOCK
      ?auto_732201 - BLOCK
      ?auto_732202 - BLOCK
      ?auto_732203 - BLOCK
      ?auto_732204 - BLOCK
      ?auto_732205 - BLOCK
      ?auto_732206 - BLOCK
      ?auto_732207 - BLOCK
      ?auto_732208 - BLOCK
      ?auto_732209 - BLOCK
      ?auto_732210 - BLOCK
      ?auto_732211 - BLOCK
      ?auto_732212 - BLOCK
      ?auto_732213 - BLOCK
      ?auto_732214 - BLOCK
    )
    :vars
    (
      ?auto_732215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_732198 ?auto_732199 ) ) ( not ( = ?auto_732198 ?auto_732200 ) ) ( not ( = ?auto_732198 ?auto_732201 ) ) ( not ( = ?auto_732198 ?auto_732202 ) ) ( not ( = ?auto_732198 ?auto_732203 ) ) ( not ( = ?auto_732198 ?auto_732204 ) ) ( not ( = ?auto_732198 ?auto_732205 ) ) ( not ( = ?auto_732198 ?auto_732206 ) ) ( not ( = ?auto_732198 ?auto_732207 ) ) ( not ( = ?auto_732198 ?auto_732208 ) ) ( not ( = ?auto_732198 ?auto_732209 ) ) ( not ( = ?auto_732198 ?auto_732210 ) ) ( not ( = ?auto_732198 ?auto_732211 ) ) ( not ( = ?auto_732198 ?auto_732212 ) ) ( not ( = ?auto_732198 ?auto_732213 ) ) ( not ( = ?auto_732198 ?auto_732214 ) ) ( not ( = ?auto_732199 ?auto_732200 ) ) ( not ( = ?auto_732199 ?auto_732201 ) ) ( not ( = ?auto_732199 ?auto_732202 ) ) ( not ( = ?auto_732199 ?auto_732203 ) ) ( not ( = ?auto_732199 ?auto_732204 ) ) ( not ( = ?auto_732199 ?auto_732205 ) ) ( not ( = ?auto_732199 ?auto_732206 ) ) ( not ( = ?auto_732199 ?auto_732207 ) ) ( not ( = ?auto_732199 ?auto_732208 ) ) ( not ( = ?auto_732199 ?auto_732209 ) ) ( not ( = ?auto_732199 ?auto_732210 ) ) ( not ( = ?auto_732199 ?auto_732211 ) ) ( not ( = ?auto_732199 ?auto_732212 ) ) ( not ( = ?auto_732199 ?auto_732213 ) ) ( not ( = ?auto_732199 ?auto_732214 ) ) ( not ( = ?auto_732200 ?auto_732201 ) ) ( not ( = ?auto_732200 ?auto_732202 ) ) ( not ( = ?auto_732200 ?auto_732203 ) ) ( not ( = ?auto_732200 ?auto_732204 ) ) ( not ( = ?auto_732200 ?auto_732205 ) ) ( not ( = ?auto_732200 ?auto_732206 ) ) ( not ( = ?auto_732200 ?auto_732207 ) ) ( not ( = ?auto_732200 ?auto_732208 ) ) ( not ( = ?auto_732200 ?auto_732209 ) ) ( not ( = ?auto_732200 ?auto_732210 ) ) ( not ( = ?auto_732200 ?auto_732211 ) ) ( not ( = ?auto_732200 ?auto_732212 ) ) ( not ( = ?auto_732200 ?auto_732213 ) ) ( not ( = ?auto_732200 ?auto_732214 ) ) ( not ( = ?auto_732201 ?auto_732202 ) ) ( not ( = ?auto_732201 ?auto_732203 ) ) ( not ( = ?auto_732201 ?auto_732204 ) ) ( not ( = ?auto_732201 ?auto_732205 ) ) ( not ( = ?auto_732201 ?auto_732206 ) ) ( not ( = ?auto_732201 ?auto_732207 ) ) ( not ( = ?auto_732201 ?auto_732208 ) ) ( not ( = ?auto_732201 ?auto_732209 ) ) ( not ( = ?auto_732201 ?auto_732210 ) ) ( not ( = ?auto_732201 ?auto_732211 ) ) ( not ( = ?auto_732201 ?auto_732212 ) ) ( not ( = ?auto_732201 ?auto_732213 ) ) ( not ( = ?auto_732201 ?auto_732214 ) ) ( not ( = ?auto_732202 ?auto_732203 ) ) ( not ( = ?auto_732202 ?auto_732204 ) ) ( not ( = ?auto_732202 ?auto_732205 ) ) ( not ( = ?auto_732202 ?auto_732206 ) ) ( not ( = ?auto_732202 ?auto_732207 ) ) ( not ( = ?auto_732202 ?auto_732208 ) ) ( not ( = ?auto_732202 ?auto_732209 ) ) ( not ( = ?auto_732202 ?auto_732210 ) ) ( not ( = ?auto_732202 ?auto_732211 ) ) ( not ( = ?auto_732202 ?auto_732212 ) ) ( not ( = ?auto_732202 ?auto_732213 ) ) ( not ( = ?auto_732202 ?auto_732214 ) ) ( not ( = ?auto_732203 ?auto_732204 ) ) ( not ( = ?auto_732203 ?auto_732205 ) ) ( not ( = ?auto_732203 ?auto_732206 ) ) ( not ( = ?auto_732203 ?auto_732207 ) ) ( not ( = ?auto_732203 ?auto_732208 ) ) ( not ( = ?auto_732203 ?auto_732209 ) ) ( not ( = ?auto_732203 ?auto_732210 ) ) ( not ( = ?auto_732203 ?auto_732211 ) ) ( not ( = ?auto_732203 ?auto_732212 ) ) ( not ( = ?auto_732203 ?auto_732213 ) ) ( not ( = ?auto_732203 ?auto_732214 ) ) ( not ( = ?auto_732204 ?auto_732205 ) ) ( not ( = ?auto_732204 ?auto_732206 ) ) ( not ( = ?auto_732204 ?auto_732207 ) ) ( not ( = ?auto_732204 ?auto_732208 ) ) ( not ( = ?auto_732204 ?auto_732209 ) ) ( not ( = ?auto_732204 ?auto_732210 ) ) ( not ( = ?auto_732204 ?auto_732211 ) ) ( not ( = ?auto_732204 ?auto_732212 ) ) ( not ( = ?auto_732204 ?auto_732213 ) ) ( not ( = ?auto_732204 ?auto_732214 ) ) ( not ( = ?auto_732205 ?auto_732206 ) ) ( not ( = ?auto_732205 ?auto_732207 ) ) ( not ( = ?auto_732205 ?auto_732208 ) ) ( not ( = ?auto_732205 ?auto_732209 ) ) ( not ( = ?auto_732205 ?auto_732210 ) ) ( not ( = ?auto_732205 ?auto_732211 ) ) ( not ( = ?auto_732205 ?auto_732212 ) ) ( not ( = ?auto_732205 ?auto_732213 ) ) ( not ( = ?auto_732205 ?auto_732214 ) ) ( not ( = ?auto_732206 ?auto_732207 ) ) ( not ( = ?auto_732206 ?auto_732208 ) ) ( not ( = ?auto_732206 ?auto_732209 ) ) ( not ( = ?auto_732206 ?auto_732210 ) ) ( not ( = ?auto_732206 ?auto_732211 ) ) ( not ( = ?auto_732206 ?auto_732212 ) ) ( not ( = ?auto_732206 ?auto_732213 ) ) ( not ( = ?auto_732206 ?auto_732214 ) ) ( not ( = ?auto_732207 ?auto_732208 ) ) ( not ( = ?auto_732207 ?auto_732209 ) ) ( not ( = ?auto_732207 ?auto_732210 ) ) ( not ( = ?auto_732207 ?auto_732211 ) ) ( not ( = ?auto_732207 ?auto_732212 ) ) ( not ( = ?auto_732207 ?auto_732213 ) ) ( not ( = ?auto_732207 ?auto_732214 ) ) ( not ( = ?auto_732208 ?auto_732209 ) ) ( not ( = ?auto_732208 ?auto_732210 ) ) ( not ( = ?auto_732208 ?auto_732211 ) ) ( not ( = ?auto_732208 ?auto_732212 ) ) ( not ( = ?auto_732208 ?auto_732213 ) ) ( not ( = ?auto_732208 ?auto_732214 ) ) ( not ( = ?auto_732209 ?auto_732210 ) ) ( not ( = ?auto_732209 ?auto_732211 ) ) ( not ( = ?auto_732209 ?auto_732212 ) ) ( not ( = ?auto_732209 ?auto_732213 ) ) ( not ( = ?auto_732209 ?auto_732214 ) ) ( not ( = ?auto_732210 ?auto_732211 ) ) ( not ( = ?auto_732210 ?auto_732212 ) ) ( not ( = ?auto_732210 ?auto_732213 ) ) ( not ( = ?auto_732210 ?auto_732214 ) ) ( not ( = ?auto_732211 ?auto_732212 ) ) ( not ( = ?auto_732211 ?auto_732213 ) ) ( not ( = ?auto_732211 ?auto_732214 ) ) ( not ( = ?auto_732212 ?auto_732213 ) ) ( not ( = ?auto_732212 ?auto_732214 ) ) ( not ( = ?auto_732213 ?auto_732214 ) ) ( ON ?auto_732198 ?auto_732215 ) ( not ( = ?auto_732214 ?auto_732215 ) ) ( not ( = ?auto_732213 ?auto_732215 ) ) ( not ( = ?auto_732212 ?auto_732215 ) ) ( not ( = ?auto_732211 ?auto_732215 ) ) ( not ( = ?auto_732210 ?auto_732215 ) ) ( not ( = ?auto_732209 ?auto_732215 ) ) ( not ( = ?auto_732208 ?auto_732215 ) ) ( not ( = ?auto_732207 ?auto_732215 ) ) ( not ( = ?auto_732206 ?auto_732215 ) ) ( not ( = ?auto_732205 ?auto_732215 ) ) ( not ( = ?auto_732204 ?auto_732215 ) ) ( not ( = ?auto_732203 ?auto_732215 ) ) ( not ( = ?auto_732202 ?auto_732215 ) ) ( not ( = ?auto_732201 ?auto_732215 ) ) ( not ( = ?auto_732200 ?auto_732215 ) ) ( not ( = ?auto_732199 ?auto_732215 ) ) ( not ( = ?auto_732198 ?auto_732215 ) ) ( ON ?auto_732199 ?auto_732198 ) ( ON ?auto_732200 ?auto_732199 ) ( ON ?auto_732201 ?auto_732200 ) ( ON ?auto_732202 ?auto_732201 ) ( ON ?auto_732203 ?auto_732202 ) ( ON ?auto_732204 ?auto_732203 ) ( ON ?auto_732205 ?auto_732204 ) ( ON ?auto_732206 ?auto_732205 ) ( ON ?auto_732207 ?auto_732206 ) ( ON ?auto_732208 ?auto_732207 ) ( ON ?auto_732209 ?auto_732208 ) ( ON ?auto_732210 ?auto_732209 ) ( ON ?auto_732211 ?auto_732210 ) ( ON ?auto_732212 ?auto_732211 ) ( ON ?auto_732213 ?auto_732212 ) ( ON ?auto_732214 ?auto_732213 ) ( CLEAR ?auto_732214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_732214 ?auto_732213 ?auto_732212 ?auto_732211 ?auto_732210 ?auto_732209 ?auto_732208 ?auto_732207 ?auto_732206 ?auto_732205 ?auto_732204 ?auto_732203 ?auto_732202 ?auto_732201 ?auto_732200 ?auto_732199 ?auto_732198 )
      ( MAKE-17PILE ?auto_732198 ?auto_732199 ?auto_732200 ?auto_732201 ?auto_732202 ?auto_732203 ?auto_732204 ?auto_732205 ?auto_732206 ?auto_732207 ?auto_732208 ?auto_732209 ?auto_732210 ?auto_732211 ?auto_732212 ?auto_732213 ?auto_732214 ) )
  )

)

