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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170853 - BLOCK
      ?auto_170854 - BLOCK
      ?auto_170855 - BLOCK
      ?auto_170856 - BLOCK
      ?auto_170857 - BLOCK
      ?auto_170858 - BLOCK
      ?auto_170859 - BLOCK
      ?auto_170860 - BLOCK
    )
    :vars
    (
      ?auto_170861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170861 ?auto_170860 ) ( CLEAR ?auto_170861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170853 ) ( ON ?auto_170854 ?auto_170853 ) ( ON ?auto_170855 ?auto_170854 ) ( ON ?auto_170856 ?auto_170855 ) ( ON ?auto_170857 ?auto_170856 ) ( ON ?auto_170858 ?auto_170857 ) ( ON ?auto_170859 ?auto_170858 ) ( ON ?auto_170860 ?auto_170859 ) ( not ( = ?auto_170853 ?auto_170854 ) ) ( not ( = ?auto_170853 ?auto_170855 ) ) ( not ( = ?auto_170853 ?auto_170856 ) ) ( not ( = ?auto_170853 ?auto_170857 ) ) ( not ( = ?auto_170853 ?auto_170858 ) ) ( not ( = ?auto_170853 ?auto_170859 ) ) ( not ( = ?auto_170853 ?auto_170860 ) ) ( not ( = ?auto_170853 ?auto_170861 ) ) ( not ( = ?auto_170854 ?auto_170855 ) ) ( not ( = ?auto_170854 ?auto_170856 ) ) ( not ( = ?auto_170854 ?auto_170857 ) ) ( not ( = ?auto_170854 ?auto_170858 ) ) ( not ( = ?auto_170854 ?auto_170859 ) ) ( not ( = ?auto_170854 ?auto_170860 ) ) ( not ( = ?auto_170854 ?auto_170861 ) ) ( not ( = ?auto_170855 ?auto_170856 ) ) ( not ( = ?auto_170855 ?auto_170857 ) ) ( not ( = ?auto_170855 ?auto_170858 ) ) ( not ( = ?auto_170855 ?auto_170859 ) ) ( not ( = ?auto_170855 ?auto_170860 ) ) ( not ( = ?auto_170855 ?auto_170861 ) ) ( not ( = ?auto_170856 ?auto_170857 ) ) ( not ( = ?auto_170856 ?auto_170858 ) ) ( not ( = ?auto_170856 ?auto_170859 ) ) ( not ( = ?auto_170856 ?auto_170860 ) ) ( not ( = ?auto_170856 ?auto_170861 ) ) ( not ( = ?auto_170857 ?auto_170858 ) ) ( not ( = ?auto_170857 ?auto_170859 ) ) ( not ( = ?auto_170857 ?auto_170860 ) ) ( not ( = ?auto_170857 ?auto_170861 ) ) ( not ( = ?auto_170858 ?auto_170859 ) ) ( not ( = ?auto_170858 ?auto_170860 ) ) ( not ( = ?auto_170858 ?auto_170861 ) ) ( not ( = ?auto_170859 ?auto_170860 ) ) ( not ( = ?auto_170859 ?auto_170861 ) ) ( not ( = ?auto_170860 ?auto_170861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170861 ?auto_170860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170863 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170863 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_170863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170864 - BLOCK
    )
    :vars
    (
      ?auto_170865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170864 ?auto_170865 ) ( CLEAR ?auto_170864 ) ( HAND-EMPTY ) ( not ( = ?auto_170864 ?auto_170865 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170864 ?auto_170865 )
      ( MAKE-1PILE ?auto_170864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170873 - BLOCK
      ?auto_170874 - BLOCK
      ?auto_170875 - BLOCK
      ?auto_170876 - BLOCK
      ?auto_170877 - BLOCK
      ?auto_170878 - BLOCK
      ?auto_170879 - BLOCK
    )
    :vars
    (
      ?auto_170880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170880 ?auto_170879 ) ( CLEAR ?auto_170880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170873 ) ( ON ?auto_170874 ?auto_170873 ) ( ON ?auto_170875 ?auto_170874 ) ( ON ?auto_170876 ?auto_170875 ) ( ON ?auto_170877 ?auto_170876 ) ( ON ?auto_170878 ?auto_170877 ) ( ON ?auto_170879 ?auto_170878 ) ( not ( = ?auto_170873 ?auto_170874 ) ) ( not ( = ?auto_170873 ?auto_170875 ) ) ( not ( = ?auto_170873 ?auto_170876 ) ) ( not ( = ?auto_170873 ?auto_170877 ) ) ( not ( = ?auto_170873 ?auto_170878 ) ) ( not ( = ?auto_170873 ?auto_170879 ) ) ( not ( = ?auto_170873 ?auto_170880 ) ) ( not ( = ?auto_170874 ?auto_170875 ) ) ( not ( = ?auto_170874 ?auto_170876 ) ) ( not ( = ?auto_170874 ?auto_170877 ) ) ( not ( = ?auto_170874 ?auto_170878 ) ) ( not ( = ?auto_170874 ?auto_170879 ) ) ( not ( = ?auto_170874 ?auto_170880 ) ) ( not ( = ?auto_170875 ?auto_170876 ) ) ( not ( = ?auto_170875 ?auto_170877 ) ) ( not ( = ?auto_170875 ?auto_170878 ) ) ( not ( = ?auto_170875 ?auto_170879 ) ) ( not ( = ?auto_170875 ?auto_170880 ) ) ( not ( = ?auto_170876 ?auto_170877 ) ) ( not ( = ?auto_170876 ?auto_170878 ) ) ( not ( = ?auto_170876 ?auto_170879 ) ) ( not ( = ?auto_170876 ?auto_170880 ) ) ( not ( = ?auto_170877 ?auto_170878 ) ) ( not ( = ?auto_170877 ?auto_170879 ) ) ( not ( = ?auto_170877 ?auto_170880 ) ) ( not ( = ?auto_170878 ?auto_170879 ) ) ( not ( = ?auto_170878 ?auto_170880 ) ) ( not ( = ?auto_170879 ?auto_170880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170880 ?auto_170879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170881 - BLOCK
      ?auto_170882 - BLOCK
      ?auto_170883 - BLOCK
      ?auto_170884 - BLOCK
      ?auto_170885 - BLOCK
      ?auto_170886 - BLOCK
      ?auto_170887 - BLOCK
    )
    :vars
    (
      ?auto_170888 - BLOCK
      ?auto_170889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170888 ?auto_170887 ) ( CLEAR ?auto_170888 ) ( ON-TABLE ?auto_170881 ) ( ON ?auto_170882 ?auto_170881 ) ( ON ?auto_170883 ?auto_170882 ) ( ON ?auto_170884 ?auto_170883 ) ( ON ?auto_170885 ?auto_170884 ) ( ON ?auto_170886 ?auto_170885 ) ( ON ?auto_170887 ?auto_170886 ) ( not ( = ?auto_170881 ?auto_170882 ) ) ( not ( = ?auto_170881 ?auto_170883 ) ) ( not ( = ?auto_170881 ?auto_170884 ) ) ( not ( = ?auto_170881 ?auto_170885 ) ) ( not ( = ?auto_170881 ?auto_170886 ) ) ( not ( = ?auto_170881 ?auto_170887 ) ) ( not ( = ?auto_170881 ?auto_170888 ) ) ( not ( = ?auto_170882 ?auto_170883 ) ) ( not ( = ?auto_170882 ?auto_170884 ) ) ( not ( = ?auto_170882 ?auto_170885 ) ) ( not ( = ?auto_170882 ?auto_170886 ) ) ( not ( = ?auto_170882 ?auto_170887 ) ) ( not ( = ?auto_170882 ?auto_170888 ) ) ( not ( = ?auto_170883 ?auto_170884 ) ) ( not ( = ?auto_170883 ?auto_170885 ) ) ( not ( = ?auto_170883 ?auto_170886 ) ) ( not ( = ?auto_170883 ?auto_170887 ) ) ( not ( = ?auto_170883 ?auto_170888 ) ) ( not ( = ?auto_170884 ?auto_170885 ) ) ( not ( = ?auto_170884 ?auto_170886 ) ) ( not ( = ?auto_170884 ?auto_170887 ) ) ( not ( = ?auto_170884 ?auto_170888 ) ) ( not ( = ?auto_170885 ?auto_170886 ) ) ( not ( = ?auto_170885 ?auto_170887 ) ) ( not ( = ?auto_170885 ?auto_170888 ) ) ( not ( = ?auto_170886 ?auto_170887 ) ) ( not ( = ?auto_170886 ?auto_170888 ) ) ( not ( = ?auto_170887 ?auto_170888 ) ) ( HOLDING ?auto_170889 ) ( not ( = ?auto_170881 ?auto_170889 ) ) ( not ( = ?auto_170882 ?auto_170889 ) ) ( not ( = ?auto_170883 ?auto_170889 ) ) ( not ( = ?auto_170884 ?auto_170889 ) ) ( not ( = ?auto_170885 ?auto_170889 ) ) ( not ( = ?auto_170886 ?auto_170889 ) ) ( not ( = ?auto_170887 ?auto_170889 ) ) ( not ( = ?auto_170888 ?auto_170889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_170889 )
      ( MAKE-7PILE ?auto_170881 ?auto_170882 ?auto_170883 ?auto_170884 ?auto_170885 ?auto_170886 ?auto_170887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170890 - BLOCK
      ?auto_170891 - BLOCK
      ?auto_170892 - BLOCK
      ?auto_170893 - BLOCK
      ?auto_170894 - BLOCK
      ?auto_170895 - BLOCK
      ?auto_170896 - BLOCK
    )
    :vars
    (
      ?auto_170898 - BLOCK
      ?auto_170897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170898 ?auto_170896 ) ( ON-TABLE ?auto_170890 ) ( ON ?auto_170891 ?auto_170890 ) ( ON ?auto_170892 ?auto_170891 ) ( ON ?auto_170893 ?auto_170892 ) ( ON ?auto_170894 ?auto_170893 ) ( ON ?auto_170895 ?auto_170894 ) ( ON ?auto_170896 ?auto_170895 ) ( not ( = ?auto_170890 ?auto_170891 ) ) ( not ( = ?auto_170890 ?auto_170892 ) ) ( not ( = ?auto_170890 ?auto_170893 ) ) ( not ( = ?auto_170890 ?auto_170894 ) ) ( not ( = ?auto_170890 ?auto_170895 ) ) ( not ( = ?auto_170890 ?auto_170896 ) ) ( not ( = ?auto_170890 ?auto_170898 ) ) ( not ( = ?auto_170891 ?auto_170892 ) ) ( not ( = ?auto_170891 ?auto_170893 ) ) ( not ( = ?auto_170891 ?auto_170894 ) ) ( not ( = ?auto_170891 ?auto_170895 ) ) ( not ( = ?auto_170891 ?auto_170896 ) ) ( not ( = ?auto_170891 ?auto_170898 ) ) ( not ( = ?auto_170892 ?auto_170893 ) ) ( not ( = ?auto_170892 ?auto_170894 ) ) ( not ( = ?auto_170892 ?auto_170895 ) ) ( not ( = ?auto_170892 ?auto_170896 ) ) ( not ( = ?auto_170892 ?auto_170898 ) ) ( not ( = ?auto_170893 ?auto_170894 ) ) ( not ( = ?auto_170893 ?auto_170895 ) ) ( not ( = ?auto_170893 ?auto_170896 ) ) ( not ( = ?auto_170893 ?auto_170898 ) ) ( not ( = ?auto_170894 ?auto_170895 ) ) ( not ( = ?auto_170894 ?auto_170896 ) ) ( not ( = ?auto_170894 ?auto_170898 ) ) ( not ( = ?auto_170895 ?auto_170896 ) ) ( not ( = ?auto_170895 ?auto_170898 ) ) ( not ( = ?auto_170896 ?auto_170898 ) ) ( not ( = ?auto_170890 ?auto_170897 ) ) ( not ( = ?auto_170891 ?auto_170897 ) ) ( not ( = ?auto_170892 ?auto_170897 ) ) ( not ( = ?auto_170893 ?auto_170897 ) ) ( not ( = ?auto_170894 ?auto_170897 ) ) ( not ( = ?auto_170895 ?auto_170897 ) ) ( not ( = ?auto_170896 ?auto_170897 ) ) ( not ( = ?auto_170898 ?auto_170897 ) ) ( ON ?auto_170897 ?auto_170898 ) ( CLEAR ?auto_170897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170890 ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 ?auto_170898 )
      ( MAKE-7PILE ?auto_170890 ?auto_170891 ?auto_170892 ?auto_170893 ?auto_170894 ?auto_170895 ?auto_170896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170901 - BLOCK
      ?auto_170902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170902 ) ( CLEAR ?auto_170901 ) ( ON-TABLE ?auto_170901 ) ( not ( = ?auto_170901 ?auto_170902 ) ) )
    :subtasks
    ( ( !STACK ?auto_170902 ?auto_170901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170903 - BLOCK
      ?auto_170904 - BLOCK
    )
    :vars
    (
      ?auto_170905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170903 ) ( ON-TABLE ?auto_170903 ) ( not ( = ?auto_170903 ?auto_170904 ) ) ( ON ?auto_170904 ?auto_170905 ) ( CLEAR ?auto_170904 ) ( HAND-EMPTY ) ( not ( = ?auto_170903 ?auto_170905 ) ) ( not ( = ?auto_170904 ?auto_170905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170904 ?auto_170905 )
      ( MAKE-2PILE ?auto_170903 ?auto_170904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170906 - BLOCK
      ?auto_170907 - BLOCK
    )
    :vars
    (
      ?auto_170908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170906 ?auto_170907 ) ) ( ON ?auto_170907 ?auto_170908 ) ( CLEAR ?auto_170907 ) ( not ( = ?auto_170906 ?auto_170908 ) ) ( not ( = ?auto_170907 ?auto_170908 ) ) ( HOLDING ?auto_170906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170906 )
      ( MAKE-2PILE ?auto_170906 ?auto_170907 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170909 - BLOCK
      ?auto_170910 - BLOCK
    )
    :vars
    (
      ?auto_170911 - BLOCK
      ?auto_170915 - BLOCK
      ?auto_170917 - BLOCK
      ?auto_170912 - BLOCK
      ?auto_170914 - BLOCK
      ?auto_170916 - BLOCK
      ?auto_170913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170909 ?auto_170910 ) ) ( ON ?auto_170910 ?auto_170911 ) ( not ( = ?auto_170909 ?auto_170911 ) ) ( not ( = ?auto_170910 ?auto_170911 ) ) ( ON ?auto_170909 ?auto_170910 ) ( CLEAR ?auto_170909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170915 ) ( ON ?auto_170917 ?auto_170915 ) ( ON ?auto_170912 ?auto_170917 ) ( ON ?auto_170914 ?auto_170912 ) ( ON ?auto_170916 ?auto_170914 ) ( ON ?auto_170913 ?auto_170916 ) ( ON ?auto_170911 ?auto_170913 ) ( not ( = ?auto_170915 ?auto_170917 ) ) ( not ( = ?auto_170915 ?auto_170912 ) ) ( not ( = ?auto_170915 ?auto_170914 ) ) ( not ( = ?auto_170915 ?auto_170916 ) ) ( not ( = ?auto_170915 ?auto_170913 ) ) ( not ( = ?auto_170915 ?auto_170911 ) ) ( not ( = ?auto_170915 ?auto_170910 ) ) ( not ( = ?auto_170915 ?auto_170909 ) ) ( not ( = ?auto_170917 ?auto_170912 ) ) ( not ( = ?auto_170917 ?auto_170914 ) ) ( not ( = ?auto_170917 ?auto_170916 ) ) ( not ( = ?auto_170917 ?auto_170913 ) ) ( not ( = ?auto_170917 ?auto_170911 ) ) ( not ( = ?auto_170917 ?auto_170910 ) ) ( not ( = ?auto_170917 ?auto_170909 ) ) ( not ( = ?auto_170912 ?auto_170914 ) ) ( not ( = ?auto_170912 ?auto_170916 ) ) ( not ( = ?auto_170912 ?auto_170913 ) ) ( not ( = ?auto_170912 ?auto_170911 ) ) ( not ( = ?auto_170912 ?auto_170910 ) ) ( not ( = ?auto_170912 ?auto_170909 ) ) ( not ( = ?auto_170914 ?auto_170916 ) ) ( not ( = ?auto_170914 ?auto_170913 ) ) ( not ( = ?auto_170914 ?auto_170911 ) ) ( not ( = ?auto_170914 ?auto_170910 ) ) ( not ( = ?auto_170914 ?auto_170909 ) ) ( not ( = ?auto_170916 ?auto_170913 ) ) ( not ( = ?auto_170916 ?auto_170911 ) ) ( not ( = ?auto_170916 ?auto_170910 ) ) ( not ( = ?auto_170916 ?auto_170909 ) ) ( not ( = ?auto_170913 ?auto_170911 ) ) ( not ( = ?auto_170913 ?auto_170910 ) ) ( not ( = ?auto_170913 ?auto_170909 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170915 ?auto_170917 ?auto_170912 ?auto_170914 ?auto_170916 ?auto_170913 ?auto_170911 ?auto_170910 )
      ( MAKE-2PILE ?auto_170909 ?auto_170910 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170924 - BLOCK
      ?auto_170925 - BLOCK
      ?auto_170926 - BLOCK
      ?auto_170927 - BLOCK
      ?auto_170928 - BLOCK
      ?auto_170929 - BLOCK
    )
    :vars
    (
      ?auto_170930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170930 ?auto_170929 ) ( CLEAR ?auto_170930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170924 ) ( ON ?auto_170925 ?auto_170924 ) ( ON ?auto_170926 ?auto_170925 ) ( ON ?auto_170927 ?auto_170926 ) ( ON ?auto_170928 ?auto_170927 ) ( ON ?auto_170929 ?auto_170928 ) ( not ( = ?auto_170924 ?auto_170925 ) ) ( not ( = ?auto_170924 ?auto_170926 ) ) ( not ( = ?auto_170924 ?auto_170927 ) ) ( not ( = ?auto_170924 ?auto_170928 ) ) ( not ( = ?auto_170924 ?auto_170929 ) ) ( not ( = ?auto_170924 ?auto_170930 ) ) ( not ( = ?auto_170925 ?auto_170926 ) ) ( not ( = ?auto_170925 ?auto_170927 ) ) ( not ( = ?auto_170925 ?auto_170928 ) ) ( not ( = ?auto_170925 ?auto_170929 ) ) ( not ( = ?auto_170925 ?auto_170930 ) ) ( not ( = ?auto_170926 ?auto_170927 ) ) ( not ( = ?auto_170926 ?auto_170928 ) ) ( not ( = ?auto_170926 ?auto_170929 ) ) ( not ( = ?auto_170926 ?auto_170930 ) ) ( not ( = ?auto_170927 ?auto_170928 ) ) ( not ( = ?auto_170927 ?auto_170929 ) ) ( not ( = ?auto_170927 ?auto_170930 ) ) ( not ( = ?auto_170928 ?auto_170929 ) ) ( not ( = ?auto_170928 ?auto_170930 ) ) ( not ( = ?auto_170929 ?auto_170930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170930 ?auto_170929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170931 - BLOCK
      ?auto_170932 - BLOCK
      ?auto_170933 - BLOCK
      ?auto_170934 - BLOCK
      ?auto_170935 - BLOCK
      ?auto_170936 - BLOCK
    )
    :vars
    (
      ?auto_170937 - BLOCK
      ?auto_170938 - BLOCK
      ?auto_170939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170937 ?auto_170936 ) ( CLEAR ?auto_170937 ) ( ON-TABLE ?auto_170931 ) ( ON ?auto_170932 ?auto_170931 ) ( ON ?auto_170933 ?auto_170932 ) ( ON ?auto_170934 ?auto_170933 ) ( ON ?auto_170935 ?auto_170934 ) ( ON ?auto_170936 ?auto_170935 ) ( not ( = ?auto_170931 ?auto_170932 ) ) ( not ( = ?auto_170931 ?auto_170933 ) ) ( not ( = ?auto_170931 ?auto_170934 ) ) ( not ( = ?auto_170931 ?auto_170935 ) ) ( not ( = ?auto_170931 ?auto_170936 ) ) ( not ( = ?auto_170931 ?auto_170937 ) ) ( not ( = ?auto_170932 ?auto_170933 ) ) ( not ( = ?auto_170932 ?auto_170934 ) ) ( not ( = ?auto_170932 ?auto_170935 ) ) ( not ( = ?auto_170932 ?auto_170936 ) ) ( not ( = ?auto_170932 ?auto_170937 ) ) ( not ( = ?auto_170933 ?auto_170934 ) ) ( not ( = ?auto_170933 ?auto_170935 ) ) ( not ( = ?auto_170933 ?auto_170936 ) ) ( not ( = ?auto_170933 ?auto_170937 ) ) ( not ( = ?auto_170934 ?auto_170935 ) ) ( not ( = ?auto_170934 ?auto_170936 ) ) ( not ( = ?auto_170934 ?auto_170937 ) ) ( not ( = ?auto_170935 ?auto_170936 ) ) ( not ( = ?auto_170935 ?auto_170937 ) ) ( not ( = ?auto_170936 ?auto_170937 ) ) ( HOLDING ?auto_170938 ) ( CLEAR ?auto_170939 ) ( not ( = ?auto_170931 ?auto_170938 ) ) ( not ( = ?auto_170931 ?auto_170939 ) ) ( not ( = ?auto_170932 ?auto_170938 ) ) ( not ( = ?auto_170932 ?auto_170939 ) ) ( not ( = ?auto_170933 ?auto_170938 ) ) ( not ( = ?auto_170933 ?auto_170939 ) ) ( not ( = ?auto_170934 ?auto_170938 ) ) ( not ( = ?auto_170934 ?auto_170939 ) ) ( not ( = ?auto_170935 ?auto_170938 ) ) ( not ( = ?auto_170935 ?auto_170939 ) ) ( not ( = ?auto_170936 ?auto_170938 ) ) ( not ( = ?auto_170936 ?auto_170939 ) ) ( not ( = ?auto_170937 ?auto_170938 ) ) ( not ( = ?auto_170937 ?auto_170939 ) ) ( not ( = ?auto_170938 ?auto_170939 ) ) )
    :subtasks
    ( ( !STACK ?auto_170938 ?auto_170939 )
      ( MAKE-6PILE ?auto_170931 ?auto_170932 ?auto_170933 ?auto_170934 ?auto_170935 ?auto_170936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170940 - BLOCK
      ?auto_170941 - BLOCK
      ?auto_170942 - BLOCK
      ?auto_170943 - BLOCK
      ?auto_170944 - BLOCK
      ?auto_170945 - BLOCK
    )
    :vars
    (
      ?auto_170946 - BLOCK
      ?auto_170947 - BLOCK
      ?auto_170948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170946 ?auto_170945 ) ( ON-TABLE ?auto_170940 ) ( ON ?auto_170941 ?auto_170940 ) ( ON ?auto_170942 ?auto_170941 ) ( ON ?auto_170943 ?auto_170942 ) ( ON ?auto_170944 ?auto_170943 ) ( ON ?auto_170945 ?auto_170944 ) ( not ( = ?auto_170940 ?auto_170941 ) ) ( not ( = ?auto_170940 ?auto_170942 ) ) ( not ( = ?auto_170940 ?auto_170943 ) ) ( not ( = ?auto_170940 ?auto_170944 ) ) ( not ( = ?auto_170940 ?auto_170945 ) ) ( not ( = ?auto_170940 ?auto_170946 ) ) ( not ( = ?auto_170941 ?auto_170942 ) ) ( not ( = ?auto_170941 ?auto_170943 ) ) ( not ( = ?auto_170941 ?auto_170944 ) ) ( not ( = ?auto_170941 ?auto_170945 ) ) ( not ( = ?auto_170941 ?auto_170946 ) ) ( not ( = ?auto_170942 ?auto_170943 ) ) ( not ( = ?auto_170942 ?auto_170944 ) ) ( not ( = ?auto_170942 ?auto_170945 ) ) ( not ( = ?auto_170942 ?auto_170946 ) ) ( not ( = ?auto_170943 ?auto_170944 ) ) ( not ( = ?auto_170943 ?auto_170945 ) ) ( not ( = ?auto_170943 ?auto_170946 ) ) ( not ( = ?auto_170944 ?auto_170945 ) ) ( not ( = ?auto_170944 ?auto_170946 ) ) ( not ( = ?auto_170945 ?auto_170946 ) ) ( CLEAR ?auto_170947 ) ( not ( = ?auto_170940 ?auto_170948 ) ) ( not ( = ?auto_170940 ?auto_170947 ) ) ( not ( = ?auto_170941 ?auto_170948 ) ) ( not ( = ?auto_170941 ?auto_170947 ) ) ( not ( = ?auto_170942 ?auto_170948 ) ) ( not ( = ?auto_170942 ?auto_170947 ) ) ( not ( = ?auto_170943 ?auto_170948 ) ) ( not ( = ?auto_170943 ?auto_170947 ) ) ( not ( = ?auto_170944 ?auto_170948 ) ) ( not ( = ?auto_170944 ?auto_170947 ) ) ( not ( = ?auto_170945 ?auto_170948 ) ) ( not ( = ?auto_170945 ?auto_170947 ) ) ( not ( = ?auto_170946 ?auto_170948 ) ) ( not ( = ?auto_170946 ?auto_170947 ) ) ( not ( = ?auto_170948 ?auto_170947 ) ) ( ON ?auto_170948 ?auto_170946 ) ( CLEAR ?auto_170948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170940 ?auto_170941 ?auto_170942 ?auto_170943 ?auto_170944 ?auto_170945 ?auto_170946 )
      ( MAKE-6PILE ?auto_170940 ?auto_170941 ?auto_170942 ?auto_170943 ?auto_170944 ?auto_170945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170949 - BLOCK
      ?auto_170950 - BLOCK
      ?auto_170951 - BLOCK
      ?auto_170952 - BLOCK
      ?auto_170953 - BLOCK
      ?auto_170954 - BLOCK
    )
    :vars
    (
      ?auto_170957 - BLOCK
      ?auto_170956 - BLOCK
      ?auto_170955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170957 ?auto_170954 ) ( ON-TABLE ?auto_170949 ) ( ON ?auto_170950 ?auto_170949 ) ( ON ?auto_170951 ?auto_170950 ) ( ON ?auto_170952 ?auto_170951 ) ( ON ?auto_170953 ?auto_170952 ) ( ON ?auto_170954 ?auto_170953 ) ( not ( = ?auto_170949 ?auto_170950 ) ) ( not ( = ?auto_170949 ?auto_170951 ) ) ( not ( = ?auto_170949 ?auto_170952 ) ) ( not ( = ?auto_170949 ?auto_170953 ) ) ( not ( = ?auto_170949 ?auto_170954 ) ) ( not ( = ?auto_170949 ?auto_170957 ) ) ( not ( = ?auto_170950 ?auto_170951 ) ) ( not ( = ?auto_170950 ?auto_170952 ) ) ( not ( = ?auto_170950 ?auto_170953 ) ) ( not ( = ?auto_170950 ?auto_170954 ) ) ( not ( = ?auto_170950 ?auto_170957 ) ) ( not ( = ?auto_170951 ?auto_170952 ) ) ( not ( = ?auto_170951 ?auto_170953 ) ) ( not ( = ?auto_170951 ?auto_170954 ) ) ( not ( = ?auto_170951 ?auto_170957 ) ) ( not ( = ?auto_170952 ?auto_170953 ) ) ( not ( = ?auto_170952 ?auto_170954 ) ) ( not ( = ?auto_170952 ?auto_170957 ) ) ( not ( = ?auto_170953 ?auto_170954 ) ) ( not ( = ?auto_170953 ?auto_170957 ) ) ( not ( = ?auto_170954 ?auto_170957 ) ) ( not ( = ?auto_170949 ?auto_170956 ) ) ( not ( = ?auto_170949 ?auto_170955 ) ) ( not ( = ?auto_170950 ?auto_170956 ) ) ( not ( = ?auto_170950 ?auto_170955 ) ) ( not ( = ?auto_170951 ?auto_170956 ) ) ( not ( = ?auto_170951 ?auto_170955 ) ) ( not ( = ?auto_170952 ?auto_170956 ) ) ( not ( = ?auto_170952 ?auto_170955 ) ) ( not ( = ?auto_170953 ?auto_170956 ) ) ( not ( = ?auto_170953 ?auto_170955 ) ) ( not ( = ?auto_170954 ?auto_170956 ) ) ( not ( = ?auto_170954 ?auto_170955 ) ) ( not ( = ?auto_170957 ?auto_170956 ) ) ( not ( = ?auto_170957 ?auto_170955 ) ) ( not ( = ?auto_170956 ?auto_170955 ) ) ( ON ?auto_170956 ?auto_170957 ) ( CLEAR ?auto_170956 ) ( HOLDING ?auto_170955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170955 )
      ( MAKE-6PILE ?auto_170949 ?auto_170950 ?auto_170951 ?auto_170952 ?auto_170953 ?auto_170954 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170958 - BLOCK
      ?auto_170959 - BLOCK
      ?auto_170960 - BLOCK
      ?auto_170961 - BLOCK
      ?auto_170962 - BLOCK
      ?auto_170963 - BLOCK
    )
    :vars
    (
      ?auto_170964 - BLOCK
      ?auto_170966 - BLOCK
      ?auto_170965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170964 ?auto_170963 ) ( ON-TABLE ?auto_170958 ) ( ON ?auto_170959 ?auto_170958 ) ( ON ?auto_170960 ?auto_170959 ) ( ON ?auto_170961 ?auto_170960 ) ( ON ?auto_170962 ?auto_170961 ) ( ON ?auto_170963 ?auto_170962 ) ( not ( = ?auto_170958 ?auto_170959 ) ) ( not ( = ?auto_170958 ?auto_170960 ) ) ( not ( = ?auto_170958 ?auto_170961 ) ) ( not ( = ?auto_170958 ?auto_170962 ) ) ( not ( = ?auto_170958 ?auto_170963 ) ) ( not ( = ?auto_170958 ?auto_170964 ) ) ( not ( = ?auto_170959 ?auto_170960 ) ) ( not ( = ?auto_170959 ?auto_170961 ) ) ( not ( = ?auto_170959 ?auto_170962 ) ) ( not ( = ?auto_170959 ?auto_170963 ) ) ( not ( = ?auto_170959 ?auto_170964 ) ) ( not ( = ?auto_170960 ?auto_170961 ) ) ( not ( = ?auto_170960 ?auto_170962 ) ) ( not ( = ?auto_170960 ?auto_170963 ) ) ( not ( = ?auto_170960 ?auto_170964 ) ) ( not ( = ?auto_170961 ?auto_170962 ) ) ( not ( = ?auto_170961 ?auto_170963 ) ) ( not ( = ?auto_170961 ?auto_170964 ) ) ( not ( = ?auto_170962 ?auto_170963 ) ) ( not ( = ?auto_170962 ?auto_170964 ) ) ( not ( = ?auto_170963 ?auto_170964 ) ) ( not ( = ?auto_170958 ?auto_170966 ) ) ( not ( = ?auto_170958 ?auto_170965 ) ) ( not ( = ?auto_170959 ?auto_170966 ) ) ( not ( = ?auto_170959 ?auto_170965 ) ) ( not ( = ?auto_170960 ?auto_170966 ) ) ( not ( = ?auto_170960 ?auto_170965 ) ) ( not ( = ?auto_170961 ?auto_170966 ) ) ( not ( = ?auto_170961 ?auto_170965 ) ) ( not ( = ?auto_170962 ?auto_170966 ) ) ( not ( = ?auto_170962 ?auto_170965 ) ) ( not ( = ?auto_170963 ?auto_170966 ) ) ( not ( = ?auto_170963 ?auto_170965 ) ) ( not ( = ?auto_170964 ?auto_170966 ) ) ( not ( = ?auto_170964 ?auto_170965 ) ) ( not ( = ?auto_170966 ?auto_170965 ) ) ( ON ?auto_170966 ?auto_170964 ) ( ON ?auto_170965 ?auto_170966 ) ( CLEAR ?auto_170965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170958 ?auto_170959 ?auto_170960 ?auto_170961 ?auto_170962 ?auto_170963 ?auto_170964 ?auto_170966 )
      ( MAKE-6PILE ?auto_170958 ?auto_170959 ?auto_170960 ?auto_170961 ?auto_170962 ?auto_170963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170970 - BLOCK
      ?auto_170971 - BLOCK
      ?auto_170972 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170972 ) ( CLEAR ?auto_170971 ) ( ON-TABLE ?auto_170970 ) ( ON ?auto_170971 ?auto_170970 ) ( not ( = ?auto_170970 ?auto_170971 ) ) ( not ( = ?auto_170970 ?auto_170972 ) ) ( not ( = ?auto_170971 ?auto_170972 ) ) )
    :subtasks
    ( ( !STACK ?auto_170972 ?auto_170971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170973 - BLOCK
      ?auto_170974 - BLOCK
      ?auto_170975 - BLOCK
    )
    :vars
    (
      ?auto_170976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170974 ) ( ON-TABLE ?auto_170973 ) ( ON ?auto_170974 ?auto_170973 ) ( not ( = ?auto_170973 ?auto_170974 ) ) ( not ( = ?auto_170973 ?auto_170975 ) ) ( not ( = ?auto_170974 ?auto_170975 ) ) ( ON ?auto_170975 ?auto_170976 ) ( CLEAR ?auto_170975 ) ( HAND-EMPTY ) ( not ( = ?auto_170973 ?auto_170976 ) ) ( not ( = ?auto_170974 ?auto_170976 ) ) ( not ( = ?auto_170975 ?auto_170976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170975 ?auto_170976 )
      ( MAKE-3PILE ?auto_170973 ?auto_170974 ?auto_170975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170977 - BLOCK
      ?auto_170978 - BLOCK
      ?auto_170979 - BLOCK
    )
    :vars
    (
      ?auto_170980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170977 ) ( not ( = ?auto_170977 ?auto_170978 ) ) ( not ( = ?auto_170977 ?auto_170979 ) ) ( not ( = ?auto_170978 ?auto_170979 ) ) ( ON ?auto_170979 ?auto_170980 ) ( CLEAR ?auto_170979 ) ( not ( = ?auto_170977 ?auto_170980 ) ) ( not ( = ?auto_170978 ?auto_170980 ) ) ( not ( = ?auto_170979 ?auto_170980 ) ) ( HOLDING ?auto_170978 ) ( CLEAR ?auto_170977 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170977 ?auto_170978 )
      ( MAKE-3PILE ?auto_170977 ?auto_170978 ?auto_170979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170981 - BLOCK
      ?auto_170982 - BLOCK
      ?auto_170983 - BLOCK
    )
    :vars
    (
      ?auto_170984 - BLOCK
      ?auto_170988 - BLOCK
      ?auto_170989 - BLOCK
      ?auto_170985 - BLOCK
      ?auto_170986 - BLOCK
      ?auto_170987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170981 ) ( not ( = ?auto_170981 ?auto_170982 ) ) ( not ( = ?auto_170981 ?auto_170983 ) ) ( not ( = ?auto_170982 ?auto_170983 ) ) ( ON ?auto_170983 ?auto_170984 ) ( not ( = ?auto_170981 ?auto_170984 ) ) ( not ( = ?auto_170982 ?auto_170984 ) ) ( not ( = ?auto_170983 ?auto_170984 ) ) ( CLEAR ?auto_170981 ) ( ON ?auto_170982 ?auto_170983 ) ( CLEAR ?auto_170982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170988 ) ( ON ?auto_170989 ?auto_170988 ) ( ON ?auto_170985 ?auto_170989 ) ( ON ?auto_170986 ?auto_170985 ) ( ON ?auto_170987 ?auto_170986 ) ( ON ?auto_170984 ?auto_170987 ) ( not ( = ?auto_170988 ?auto_170989 ) ) ( not ( = ?auto_170988 ?auto_170985 ) ) ( not ( = ?auto_170988 ?auto_170986 ) ) ( not ( = ?auto_170988 ?auto_170987 ) ) ( not ( = ?auto_170988 ?auto_170984 ) ) ( not ( = ?auto_170988 ?auto_170983 ) ) ( not ( = ?auto_170988 ?auto_170982 ) ) ( not ( = ?auto_170989 ?auto_170985 ) ) ( not ( = ?auto_170989 ?auto_170986 ) ) ( not ( = ?auto_170989 ?auto_170987 ) ) ( not ( = ?auto_170989 ?auto_170984 ) ) ( not ( = ?auto_170989 ?auto_170983 ) ) ( not ( = ?auto_170989 ?auto_170982 ) ) ( not ( = ?auto_170985 ?auto_170986 ) ) ( not ( = ?auto_170985 ?auto_170987 ) ) ( not ( = ?auto_170985 ?auto_170984 ) ) ( not ( = ?auto_170985 ?auto_170983 ) ) ( not ( = ?auto_170985 ?auto_170982 ) ) ( not ( = ?auto_170986 ?auto_170987 ) ) ( not ( = ?auto_170986 ?auto_170984 ) ) ( not ( = ?auto_170986 ?auto_170983 ) ) ( not ( = ?auto_170986 ?auto_170982 ) ) ( not ( = ?auto_170987 ?auto_170984 ) ) ( not ( = ?auto_170987 ?auto_170983 ) ) ( not ( = ?auto_170987 ?auto_170982 ) ) ( not ( = ?auto_170981 ?auto_170988 ) ) ( not ( = ?auto_170981 ?auto_170989 ) ) ( not ( = ?auto_170981 ?auto_170985 ) ) ( not ( = ?auto_170981 ?auto_170986 ) ) ( not ( = ?auto_170981 ?auto_170987 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170988 ?auto_170989 ?auto_170985 ?auto_170986 ?auto_170987 ?auto_170984 ?auto_170983 )
      ( MAKE-3PILE ?auto_170981 ?auto_170982 ?auto_170983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170990 - BLOCK
      ?auto_170991 - BLOCK
      ?auto_170992 - BLOCK
    )
    :vars
    (
      ?auto_170997 - BLOCK
      ?auto_170993 - BLOCK
      ?auto_170998 - BLOCK
      ?auto_170994 - BLOCK
      ?auto_170995 - BLOCK
      ?auto_170996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170990 ?auto_170991 ) ) ( not ( = ?auto_170990 ?auto_170992 ) ) ( not ( = ?auto_170991 ?auto_170992 ) ) ( ON ?auto_170992 ?auto_170997 ) ( not ( = ?auto_170990 ?auto_170997 ) ) ( not ( = ?auto_170991 ?auto_170997 ) ) ( not ( = ?auto_170992 ?auto_170997 ) ) ( ON ?auto_170991 ?auto_170992 ) ( CLEAR ?auto_170991 ) ( ON-TABLE ?auto_170993 ) ( ON ?auto_170998 ?auto_170993 ) ( ON ?auto_170994 ?auto_170998 ) ( ON ?auto_170995 ?auto_170994 ) ( ON ?auto_170996 ?auto_170995 ) ( ON ?auto_170997 ?auto_170996 ) ( not ( = ?auto_170993 ?auto_170998 ) ) ( not ( = ?auto_170993 ?auto_170994 ) ) ( not ( = ?auto_170993 ?auto_170995 ) ) ( not ( = ?auto_170993 ?auto_170996 ) ) ( not ( = ?auto_170993 ?auto_170997 ) ) ( not ( = ?auto_170993 ?auto_170992 ) ) ( not ( = ?auto_170993 ?auto_170991 ) ) ( not ( = ?auto_170998 ?auto_170994 ) ) ( not ( = ?auto_170998 ?auto_170995 ) ) ( not ( = ?auto_170998 ?auto_170996 ) ) ( not ( = ?auto_170998 ?auto_170997 ) ) ( not ( = ?auto_170998 ?auto_170992 ) ) ( not ( = ?auto_170998 ?auto_170991 ) ) ( not ( = ?auto_170994 ?auto_170995 ) ) ( not ( = ?auto_170994 ?auto_170996 ) ) ( not ( = ?auto_170994 ?auto_170997 ) ) ( not ( = ?auto_170994 ?auto_170992 ) ) ( not ( = ?auto_170994 ?auto_170991 ) ) ( not ( = ?auto_170995 ?auto_170996 ) ) ( not ( = ?auto_170995 ?auto_170997 ) ) ( not ( = ?auto_170995 ?auto_170992 ) ) ( not ( = ?auto_170995 ?auto_170991 ) ) ( not ( = ?auto_170996 ?auto_170997 ) ) ( not ( = ?auto_170996 ?auto_170992 ) ) ( not ( = ?auto_170996 ?auto_170991 ) ) ( not ( = ?auto_170990 ?auto_170993 ) ) ( not ( = ?auto_170990 ?auto_170998 ) ) ( not ( = ?auto_170990 ?auto_170994 ) ) ( not ( = ?auto_170990 ?auto_170995 ) ) ( not ( = ?auto_170990 ?auto_170996 ) ) ( HOLDING ?auto_170990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170990 )
      ( MAKE-3PILE ?auto_170990 ?auto_170991 ?auto_170992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_170999 - BLOCK
      ?auto_171000 - BLOCK
      ?auto_171001 - BLOCK
    )
    :vars
    (
      ?auto_171007 - BLOCK
      ?auto_171002 - BLOCK
      ?auto_171004 - BLOCK
      ?auto_171006 - BLOCK
      ?auto_171005 - BLOCK
      ?auto_171003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170999 ?auto_171000 ) ) ( not ( = ?auto_170999 ?auto_171001 ) ) ( not ( = ?auto_171000 ?auto_171001 ) ) ( ON ?auto_171001 ?auto_171007 ) ( not ( = ?auto_170999 ?auto_171007 ) ) ( not ( = ?auto_171000 ?auto_171007 ) ) ( not ( = ?auto_171001 ?auto_171007 ) ) ( ON ?auto_171000 ?auto_171001 ) ( ON-TABLE ?auto_171002 ) ( ON ?auto_171004 ?auto_171002 ) ( ON ?auto_171006 ?auto_171004 ) ( ON ?auto_171005 ?auto_171006 ) ( ON ?auto_171003 ?auto_171005 ) ( ON ?auto_171007 ?auto_171003 ) ( not ( = ?auto_171002 ?auto_171004 ) ) ( not ( = ?auto_171002 ?auto_171006 ) ) ( not ( = ?auto_171002 ?auto_171005 ) ) ( not ( = ?auto_171002 ?auto_171003 ) ) ( not ( = ?auto_171002 ?auto_171007 ) ) ( not ( = ?auto_171002 ?auto_171001 ) ) ( not ( = ?auto_171002 ?auto_171000 ) ) ( not ( = ?auto_171004 ?auto_171006 ) ) ( not ( = ?auto_171004 ?auto_171005 ) ) ( not ( = ?auto_171004 ?auto_171003 ) ) ( not ( = ?auto_171004 ?auto_171007 ) ) ( not ( = ?auto_171004 ?auto_171001 ) ) ( not ( = ?auto_171004 ?auto_171000 ) ) ( not ( = ?auto_171006 ?auto_171005 ) ) ( not ( = ?auto_171006 ?auto_171003 ) ) ( not ( = ?auto_171006 ?auto_171007 ) ) ( not ( = ?auto_171006 ?auto_171001 ) ) ( not ( = ?auto_171006 ?auto_171000 ) ) ( not ( = ?auto_171005 ?auto_171003 ) ) ( not ( = ?auto_171005 ?auto_171007 ) ) ( not ( = ?auto_171005 ?auto_171001 ) ) ( not ( = ?auto_171005 ?auto_171000 ) ) ( not ( = ?auto_171003 ?auto_171007 ) ) ( not ( = ?auto_171003 ?auto_171001 ) ) ( not ( = ?auto_171003 ?auto_171000 ) ) ( not ( = ?auto_170999 ?auto_171002 ) ) ( not ( = ?auto_170999 ?auto_171004 ) ) ( not ( = ?auto_170999 ?auto_171006 ) ) ( not ( = ?auto_170999 ?auto_171005 ) ) ( not ( = ?auto_170999 ?auto_171003 ) ) ( ON ?auto_170999 ?auto_171000 ) ( CLEAR ?auto_170999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171002 ?auto_171004 ?auto_171006 ?auto_171005 ?auto_171003 ?auto_171007 ?auto_171001 ?auto_171000 )
      ( MAKE-3PILE ?auto_170999 ?auto_171000 ?auto_171001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171013 - BLOCK
      ?auto_171014 - BLOCK
      ?auto_171015 - BLOCK
      ?auto_171016 - BLOCK
      ?auto_171017 - BLOCK
    )
    :vars
    (
      ?auto_171018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171018 ?auto_171017 ) ( CLEAR ?auto_171018 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171013 ) ( ON ?auto_171014 ?auto_171013 ) ( ON ?auto_171015 ?auto_171014 ) ( ON ?auto_171016 ?auto_171015 ) ( ON ?auto_171017 ?auto_171016 ) ( not ( = ?auto_171013 ?auto_171014 ) ) ( not ( = ?auto_171013 ?auto_171015 ) ) ( not ( = ?auto_171013 ?auto_171016 ) ) ( not ( = ?auto_171013 ?auto_171017 ) ) ( not ( = ?auto_171013 ?auto_171018 ) ) ( not ( = ?auto_171014 ?auto_171015 ) ) ( not ( = ?auto_171014 ?auto_171016 ) ) ( not ( = ?auto_171014 ?auto_171017 ) ) ( not ( = ?auto_171014 ?auto_171018 ) ) ( not ( = ?auto_171015 ?auto_171016 ) ) ( not ( = ?auto_171015 ?auto_171017 ) ) ( not ( = ?auto_171015 ?auto_171018 ) ) ( not ( = ?auto_171016 ?auto_171017 ) ) ( not ( = ?auto_171016 ?auto_171018 ) ) ( not ( = ?auto_171017 ?auto_171018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171018 ?auto_171017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171019 - BLOCK
      ?auto_171020 - BLOCK
      ?auto_171021 - BLOCK
      ?auto_171022 - BLOCK
      ?auto_171023 - BLOCK
    )
    :vars
    (
      ?auto_171024 - BLOCK
      ?auto_171025 - BLOCK
      ?auto_171026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171024 ?auto_171023 ) ( CLEAR ?auto_171024 ) ( ON-TABLE ?auto_171019 ) ( ON ?auto_171020 ?auto_171019 ) ( ON ?auto_171021 ?auto_171020 ) ( ON ?auto_171022 ?auto_171021 ) ( ON ?auto_171023 ?auto_171022 ) ( not ( = ?auto_171019 ?auto_171020 ) ) ( not ( = ?auto_171019 ?auto_171021 ) ) ( not ( = ?auto_171019 ?auto_171022 ) ) ( not ( = ?auto_171019 ?auto_171023 ) ) ( not ( = ?auto_171019 ?auto_171024 ) ) ( not ( = ?auto_171020 ?auto_171021 ) ) ( not ( = ?auto_171020 ?auto_171022 ) ) ( not ( = ?auto_171020 ?auto_171023 ) ) ( not ( = ?auto_171020 ?auto_171024 ) ) ( not ( = ?auto_171021 ?auto_171022 ) ) ( not ( = ?auto_171021 ?auto_171023 ) ) ( not ( = ?auto_171021 ?auto_171024 ) ) ( not ( = ?auto_171022 ?auto_171023 ) ) ( not ( = ?auto_171022 ?auto_171024 ) ) ( not ( = ?auto_171023 ?auto_171024 ) ) ( HOLDING ?auto_171025 ) ( CLEAR ?auto_171026 ) ( not ( = ?auto_171019 ?auto_171025 ) ) ( not ( = ?auto_171019 ?auto_171026 ) ) ( not ( = ?auto_171020 ?auto_171025 ) ) ( not ( = ?auto_171020 ?auto_171026 ) ) ( not ( = ?auto_171021 ?auto_171025 ) ) ( not ( = ?auto_171021 ?auto_171026 ) ) ( not ( = ?auto_171022 ?auto_171025 ) ) ( not ( = ?auto_171022 ?auto_171026 ) ) ( not ( = ?auto_171023 ?auto_171025 ) ) ( not ( = ?auto_171023 ?auto_171026 ) ) ( not ( = ?auto_171024 ?auto_171025 ) ) ( not ( = ?auto_171024 ?auto_171026 ) ) ( not ( = ?auto_171025 ?auto_171026 ) ) )
    :subtasks
    ( ( !STACK ?auto_171025 ?auto_171026 )
      ( MAKE-5PILE ?auto_171019 ?auto_171020 ?auto_171021 ?auto_171022 ?auto_171023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171027 - BLOCK
      ?auto_171028 - BLOCK
      ?auto_171029 - BLOCK
      ?auto_171030 - BLOCK
      ?auto_171031 - BLOCK
    )
    :vars
    (
      ?auto_171032 - BLOCK
      ?auto_171034 - BLOCK
      ?auto_171033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171032 ?auto_171031 ) ( ON-TABLE ?auto_171027 ) ( ON ?auto_171028 ?auto_171027 ) ( ON ?auto_171029 ?auto_171028 ) ( ON ?auto_171030 ?auto_171029 ) ( ON ?auto_171031 ?auto_171030 ) ( not ( = ?auto_171027 ?auto_171028 ) ) ( not ( = ?auto_171027 ?auto_171029 ) ) ( not ( = ?auto_171027 ?auto_171030 ) ) ( not ( = ?auto_171027 ?auto_171031 ) ) ( not ( = ?auto_171027 ?auto_171032 ) ) ( not ( = ?auto_171028 ?auto_171029 ) ) ( not ( = ?auto_171028 ?auto_171030 ) ) ( not ( = ?auto_171028 ?auto_171031 ) ) ( not ( = ?auto_171028 ?auto_171032 ) ) ( not ( = ?auto_171029 ?auto_171030 ) ) ( not ( = ?auto_171029 ?auto_171031 ) ) ( not ( = ?auto_171029 ?auto_171032 ) ) ( not ( = ?auto_171030 ?auto_171031 ) ) ( not ( = ?auto_171030 ?auto_171032 ) ) ( not ( = ?auto_171031 ?auto_171032 ) ) ( CLEAR ?auto_171034 ) ( not ( = ?auto_171027 ?auto_171033 ) ) ( not ( = ?auto_171027 ?auto_171034 ) ) ( not ( = ?auto_171028 ?auto_171033 ) ) ( not ( = ?auto_171028 ?auto_171034 ) ) ( not ( = ?auto_171029 ?auto_171033 ) ) ( not ( = ?auto_171029 ?auto_171034 ) ) ( not ( = ?auto_171030 ?auto_171033 ) ) ( not ( = ?auto_171030 ?auto_171034 ) ) ( not ( = ?auto_171031 ?auto_171033 ) ) ( not ( = ?auto_171031 ?auto_171034 ) ) ( not ( = ?auto_171032 ?auto_171033 ) ) ( not ( = ?auto_171032 ?auto_171034 ) ) ( not ( = ?auto_171033 ?auto_171034 ) ) ( ON ?auto_171033 ?auto_171032 ) ( CLEAR ?auto_171033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171027 ?auto_171028 ?auto_171029 ?auto_171030 ?auto_171031 ?auto_171032 )
      ( MAKE-5PILE ?auto_171027 ?auto_171028 ?auto_171029 ?auto_171030 ?auto_171031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171035 - BLOCK
      ?auto_171036 - BLOCK
      ?auto_171037 - BLOCK
      ?auto_171038 - BLOCK
      ?auto_171039 - BLOCK
    )
    :vars
    (
      ?auto_171041 - BLOCK
      ?auto_171040 - BLOCK
      ?auto_171042 - BLOCK
      ?auto_171043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171041 ?auto_171039 ) ( ON-TABLE ?auto_171035 ) ( ON ?auto_171036 ?auto_171035 ) ( ON ?auto_171037 ?auto_171036 ) ( ON ?auto_171038 ?auto_171037 ) ( ON ?auto_171039 ?auto_171038 ) ( not ( = ?auto_171035 ?auto_171036 ) ) ( not ( = ?auto_171035 ?auto_171037 ) ) ( not ( = ?auto_171035 ?auto_171038 ) ) ( not ( = ?auto_171035 ?auto_171039 ) ) ( not ( = ?auto_171035 ?auto_171041 ) ) ( not ( = ?auto_171036 ?auto_171037 ) ) ( not ( = ?auto_171036 ?auto_171038 ) ) ( not ( = ?auto_171036 ?auto_171039 ) ) ( not ( = ?auto_171036 ?auto_171041 ) ) ( not ( = ?auto_171037 ?auto_171038 ) ) ( not ( = ?auto_171037 ?auto_171039 ) ) ( not ( = ?auto_171037 ?auto_171041 ) ) ( not ( = ?auto_171038 ?auto_171039 ) ) ( not ( = ?auto_171038 ?auto_171041 ) ) ( not ( = ?auto_171039 ?auto_171041 ) ) ( not ( = ?auto_171035 ?auto_171040 ) ) ( not ( = ?auto_171035 ?auto_171042 ) ) ( not ( = ?auto_171036 ?auto_171040 ) ) ( not ( = ?auto_171036 ?auto_171042 ) ) ( not ( = ?auto_171037 ?auto_171040 ) ) ( not ( = ?auto_171037 ?auto_171042 ) ) ( not ( = ?auto_171038 ?auto_171040 ) ) ( not ( = ?auto_171038 ?auto_171042 ) ) ( not ( = ?auto_171039 ?auto_171040 ) ) ( not ( = ?auto_171039 ?auto_171042 ) ) ( not ( = ?auto_171041 ?auto_171040 ) ) ( not ( = ?auto_171041 ?auto_171042 ) ) ( not ( = ?auto_171040 ?auto_171042 ) ) ( ON ?auto_171040 ?auto_171041 ) ( CLEAR ?auto_171040 ) ( HOLDING ?auto_171042 ) ( CLEAR ?auto_171043 ) ( ON-TABLE ?auto_171043 ) ( not ( = ?auto_171043 ?auto_171042 ) ) ( not ( = ?auto_171035 ?auto_171043 ) ) ( not ( = ?auto_171036 ?auto_171043 ) ) ( not ( = ?auto_171037 ?auto_171043 ) ) ( not ( = ?auto_171038 ?auto_171043 ) ) ( not ( = ?auto_171039 ?auto_171043 ) ) ( not ( = ?auto_171041 ?auto_171043 ) ) ( not ( = ?auto_171040 ?auto_171043 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171043 ?auto_171042 )
      ( MAKE-5PILE ?auto_171035 ?auto_171036 ?auto_171037 ?auto_171038 ?auto_171039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171044 - BLOCK
      ?auto_171045 - BLOCK
      ?auto_171046 - BLOCK
      ?auto_171047 - BLOCK
      ?auto_171048 - BLOCK
    )
    :vars
    (
      ?auto_171050 - BLOCK
      ?auto_171052 - BLOCK
      ?auto_171049 - BLOCK
      ?auto_171051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171050 ?auto_171048 ) ( ON-TABLE ?auto_171044 ) ( ON ?auto_171045 ?auto_171044 ) ( ON ?auto_171046 ?auto_171045 ) ( ON ?auto_171047 ?auto_171046 ) ( ON ?auto_171048 ?auto_171047 ) ( not ( = ?auto_171044 ?auto_171045 ) ) ( not ( = ?auto_171044 ?auto_171046 ) ) ( not ( = ?auto_171044 ?auto_171047 ) ) ( not ( = ?auto_171044 ?auto_171048 ) ) ( not ( = ?auto_171044 ?auto_171050 ) ) ( not ( = ?auto_171045 ?auto_171046 ) ) ( not ( = ?auto_171045 ?auto_171047 ) ) ( not ( = ?auto_171045 ?auto_171048 ) ) ( not ( = ?auto_171045 ?auto_171050 ) ) ( not ( = ?auto_171046 ?auto_171047 ) ) ( not ( = ?auto_171046 ?auto_171048 ) ) ( not ( = ?auto_171046 ?auto_171050 ) ) ( not ( = ?auto_171047 ?auto_171048 ) ) ( not ( = ?auto_171047 ?auto_171050 ) ) ( not ( = ?auto_171048 ?auto_171050 ) ) ( not ( = ?auto_171044 ?auto_171052 ) ) ( not ( = ?auto_171044 ?auto_171049 ) ) ( not ( = ?auto_171045 ?auto_171052 ) ) ( not ( = ?auto_171045 ?auto_171049 ) ) ( not ( = ?auto_171046 ?auto_171052 ) ) ( not ( = ?auto_171046 ?auto_171049 ) ) ( not ( = ?auto_171047 ?auto_171052 ) ) ( not ( = ?auto_171047 ?auto_171049 ) ) ( not ( = ?auto_171048 ?auto_171052 ) ) ( not ( = ?auto_171048 ?auto_171049 ) ) ( not ( = ?auto_171050 ?auto_171052 ) ) ( not ( = ?auto_171050 ?auto_171049 ) ) ( not ( = ?auto_171052 ?auto_171049 ) ) ( ON ?auto_171052 ?auto_171050 ) ( CLEAR ?auto_171051 ) ( ON-TABLE ?auto_171051 ) ( not ( = ?auto_171051 ?auto_171049 ) ) ( not ( = ?auto_171044 ?auto_171051 ) ) ( not ( = ?auto_171045 ?auto_171051 ) ) ( not ( = ?auto_171046 ?auto_171051 ) ) ( not ( = ?auto_171047 ?auto_171051 ) ) ( not ( = ?auto_171048 ?auto_171051 ) ) ( not ( = ?auto_171050 ?auto_171051 ) ) ( not ( = ?auto_171052 ?auto_171051 ) ) ( ON ?auto_171049 ?auto_171052 ) ( CLEAR ?auto_171049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171044 ?auto_171045 ?auto_171046 ?auto_171047 ?auto_171048 ?auto_171050 ?auto_171052 )
      ( MAKE-5PILE ?auto_171044 ?auto_171045 ?auto_171046 ?auto_171047 ?auto_171048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171053 - BLOCK
      ?auto_171054 - BLOCK
      ?auto_171055 - BLOCK
      ?auto_171056 - BLOCK
      ?auto_171057 - BLOCK
    )
    :vars
    (
      ?auto_171061 - BLOCK
      ?auto_171058 - BLOCK
      ?auto_171059 - BLOCK
      ?auto_171060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171061 ?auto_171057 ) ( ON-TABLE ?auto_171053 ) ( ON ?auto_171054 ?auto_171053 ) ( ON ?auto_171055 ?auto_171054 ) ( ON ?auto_171056 ?auto_171055 ) ( ON ?auto_171057 ?auto_171056 ) ( not ( = ?auto_171053 ?auto_171054 ) ) ( not ( = ?auto_171053 ?auto_171055 ) ) ( not ( = ?auto_171053 ?auto_171056 ) ) ( not ( = ?auto_171053 ?auto_171057 ) ) ( not ( = ?auto_171053 ?auto_171061 ) ) ( not ( = ?auto_171054 ?auto_171055 ) ) ( not ( = ?auto_171054 ?auto_171056 ) ) ( not ( = ?auto_171054 ?auto_171057 ) ) ( not ( = ?auto_171054 ?auto_171061 ) ) ( not ( = ?auto_171055 ?auto_171056 ) ) ( not ( = ?auto_171055 ?auto_171057 ) ) ( not ( = ?auto_171055 ?auto_171061 ) ) ( not ( = ?auto_171056 ?auto_171057 ) ) ( not ( = ?auto_171056 ?auto_171061 ) ) ( not ( = ?auto_171057 ?auto_171061 ) ) ( not ( = ?auto_171053 ?auto_171058 ) ) ( not ( = ?auto_171053 ?auto_171059 ) ) ( not ( = ?auto_171054 ?auto_171058 ) ) ( not ( = ?auto_171054 ?auto_171059 ) ) ( not ( = ?auto_171055 ?auto_171058 ) ) ( not ( = ?auto_171055 ?auto_171059 ) ) ( not ( = ?auto_171056 ?auto_171058 ) ) ( not ( = ?auto_171056 ?auto_171059 ) ) ( not ( = ?auto_171057 ?auto_171058 ) ) ( not ( = ?auto_171057 ?auto_171059 ) ) ( not ( = ?auto_171061 ?auto_171058 ) ) ( not ( = ?auto_171061 ?auto_171059 ) ) ( not ( = ?auto_171058 ?auto_171059 ) ) ( ON ?auto_171058 ?auto_171061 ) ( not ( = ?auto_171060 ?auto_171059 ) ) ( not ( = ?auto_171053 ?auto_171060 ) ) ( not ( = ?auto_171054 ?auto_171060 ) ) ( not ( = ?auto_171055 ?auto_171060 ) ) ( not ( = ?auto_171056 ?auto_171060 ) ) ( not ( = ?auto_171057 ?auto_171060 ) ) ( not ( = ?auto_171061 ?auto_171060 ) ) ( not ( = ?auto_171058 ?auto_171060 ) ) ( ON ?auto_171059 ?auto_171058 ) ( CLEAR ?auto_171059 ) ( HOLDING ?auto_171060 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171060 )
      ( MAKE-5PILE ?auto_171053 ?auto_171054 ?auto_171055 ?auto_171056 ?auto_171057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171062 - BLOCK
      ?auto_171063 - BLOCK
      ?auto_171064 - BLOCK
      ?auto_171065 - BLOCK
      ?auto_171066 - BLOCK
    )
    :vars
    (
      ?auto_171068 - BLOCK
      ?auto_171069 - BLOCK
      ?auto_171067 - BLOCK
      ?auto_171070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171068 ?auto_171066 ) ( ON-TABLE ?auto_171062 ) ( ON ?auto_171063 ?auto_171062 ) ( ON ?auto_171064 ?auto_171063 ) ( ON ?auto_171065 ?auto_171064 ) ( ON ?auto_171066 ?auto_171065 ) ( not ( = ?auto_171062 ?auto_171063 ) ) ( not ( = ?auto_171062 ?auto_171064 ) ) ( not ( = ?auto_171062 ?auto_171065 ) ) ( not ( = ?auto_171062 ?auto_171066 ) ) ( not ( = ?auto_171062 ?auto_171068 ) ) ( not ( = ?auto_171063 ?auto_171064 ) ) ( not ( = ?auto_171063 ?auto_171065 ) ) ( not ( = ?auto_171063 ?auto_171066 ) ) ( not ( = ?auto_171063 ?auto_171068 ) ) ( not ( = ?auto_171064 ?auto_171065 ) ) ( not ( = ?auto_171064 ?auto_171066 ) ) ( not ( = ?auto_171064 ?auto_171068 ) ) ( not ( = ?auto_171065 ?auto_171066 ) ) ( not ( = ?auto_171065 ?auto_171068 ) ) ( not ( = ?auto_171066 ?auto_171068 ) ) ( not ( = ?auto_171062 ?auto_171069 ) ) ( not ( = ?auto_171062 ?auto_171067 ) ) ( not ( = ?auto_171063 ?auto_171069 ) ) ( not ( = ?auto_171063 ?auto_171067 ) ) ( not ( = ?auto_171064 ?auto_171069 ) ) ( not ( = ?auto_171064 ?auto_171067 ) ) ( not ( = ?auto_171065 ?auto_171069 ) ) ( not ( = ?auto_171065 ?auto_171067 ) ) ( not ( = ?auto_171066 ?auto_171069 ) ) ( not ( = ?auto_171066 ?auto_171067 ) ) ( not ( = ?auto_171068 ?auto_171069 ) ) ( not ( = ?auto_171068 ?auto_171067 ) ) ( not ( = ?auto_171069 ?auto_171067 ) ) ( ON ?auto_171069 ?auto_171068 ) ( not ( = ?auto_171070 ?auto_171067 ) ) ( not ( = ?auto_171062 ?auto_171070 ) ) ( not ( = ?auto_171063 ?auto_171070 ) ) ( not ( = ?auto_171064 ?auto_171070 ) ) ( not ( = ?auto_171065 ?auto_171070 ) ) ( not ( = ?auto_171066 ?auto_171070 ) ) ( not ( = ?auto_171068 ?auto_171070 ) ) ( not ( = ?auto_171069 ?auto_171070 ) ) ( ON ?auto_171067 ?auto_171069 ) ( ON ?auto_171070 ?auto_171067 ) ( CLEAR ?auto_171070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171062 ?auto_171063 ?auto_171064 ?auto_171065 ?auto_171066 ?auto_171068 ?auto_171069 ?auto_171067 )
      ( MAKE-5PILE ?auto_171062 ?auto_171063 ?auto_171064 ?auto_171065 ?auto_171066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171075 - BLOCK
      ?auto_171076 - BLOCK
      ?auto_171077 - BLOCK
      ?auto_171078 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_171078 ) ( CLEAR ?auto_171077 ) ( ON-TABLE ?auto_171075 ) ( ON ?auto_171076 ?auto_171075 ) ( ON ?auto_171077 ?auto_171076 ) ( not ( = ?auto_171075 ?auto_171076 ) ) ( not ( = ?auto_171075 ?auto_171077 ) ) ( not ( = ?auto_171075 ?auto_171078 ) ) ( not ( = ?auto_171076 ?auto_171077 ) ) ( not ( = ?auto_171076 ?auto_171078 ) ) ( not ( = ?auto_171077 ?auto_171078 ) ) )
    :subtasks
    ( ( !STACK ?auto_171078 ?auto_171077 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171079 - BLOCK
      ?auto_171080 - BLOCK
      ?auto_171081 - BLOCK
      ?auto_171082 - BLOCK
    )
    :vars
    (
      ?auto_171083 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171081 ) ( ON-TABLE ?auto_171079 ) ( ON ?auto_171080 ?auto_171079 ) ( ON ?auto_171081 ?auto_171080 ) ( not ( = ?auto_171079 ?auto_171080 ) ) ( not ( = ?auto_171079 ?auto_171081 ) ) ( not ( = ?auto_171079 ?auto_171082 ) ) ( not ( = ?auto_171080 ?auto_171081 ) ) ( not ( = ?auto_171080 ?auto_171082 ) ) ( not ( = ?auto_171081 ?auto_171082 ) ) ( ON ?auto_171082 ?auto_171083 ) ( CLEAR ?auto_171082 ) ( HAND-EMPTY ) ( not ( = ?auto_171079 ?auto_171083 ) ) ( not ( = ?auto_171080 ?auto_171083 ) ) ( not ( = ?auto_171081 ?auto_171083 ) ) ( not ( = ?auto_171082 ?auto_171083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171082 ?auto_171083 )
      ( MAKE-4PILE ?auto_171079 ?auto_171080 ?auto_171081 ?auto_171082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171084 - BLOCK
      ?auto_171085 - BLOCK
      ?auto_171086 - BLOCK
      ?auto_171087 - BLOCK
    )
    :vars
    (
      ?auto_171088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171084 ) ( ON ?auto_171085 ?auto_171084 ) ( not ( = ?auto_171084 ?auto_171085 ) ) ( not ( = ?auto_171084 ?auto_171086 ) ) ( not ( = ?auto_171084 ?auto_171087 ) ) ( not ( = ?auto_171085 ?auto_171086 ) ) ( not ( = ?auto_171085 ?auto_171087 ) ) ( not ( = ?auto_171086 ?auto_171087 ) ) ( ON ?auto_171087 ?auto_171088 ) ( CLEAR ?auto_171087 ) ( not ( = ?auto_171084 ?auto_171088 ) ) ( not ( = ?auto_171085 ?auto_171088 ) ) ( not ( = ?auto_171086 ?auto_171088 ) ) ( not ( = ?auto_171087 ?auto_171088 ) ) ( HOLDING ?auto_171086 ) ( CLEAR ?auto_171085 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171084 ?auto_171085 ?auto_171086 )
      ( MAKE-4PILE ?auto_171084 ?auto_171085 ?auto_171086 ?auto_171087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171089 - BLOCK
      ?auto_171090 - BLOCK
      ?auto_171091 - BLOCK
      ?auto_171092 - BLOCK
    )
    :vars
    (
      ?auto_171093 - BLOCK
      ?auto_171097 - BLOCK
      ?auto_171095 - BLOCK
      ?auto_171094 - BLOCK
      ?auto_171096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171089 ) ( ON ?auto_171090 ?auto_171089 ) ( not ( = ?auto_171089 ?auto_171090 ) ) ( not ( = ?auto_171089 ?auto_171091 ) ) ( not ( = ?auto_171089 ?auto_171092 ) ) ( not ( = ?auto_171090 ?auto_171091 ) ) ( not ( = ?auto_171090 ?auto_171092 ) ) ( not ( = ?auto_171091 ?auto_171092 ) ) ( ON ?auto_171092 ?auto_171093 ) ( not ( = ?auto_171089 ?auto_171093 ) ) ( not ( = ?auto_171090 ?auto_171093 ) ) ( not ( = ?auto_171091 ?auto_171093 ) ) ( not ( = ?auto_171092 ?auto_171093 ) ) ( CLEAR ?auto_171090 ) ( ON ?auto_171091 ?auto_171092 ) ( CLEAR ?auto_171091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171097 ) ( ON ?auto_171095 ?auto_171097 ) ( ON ?auto_171094 ?auto_171095 ) ( ON ?auto_171096 ?auto_171094 ) ( ON ?auto_171093 ?auto_171096 ) ( not ( = ?auto_171097 ?auto_171095 ) ) ( not ( = ?auto_171097 ?auto_171094 ) ) ( not ( = ?auto_171097 ?auto_171096 ) ) ( not ( = ?auto_171097 ?auto_171093 ) ) ( not ( = ?auto_171097 ?auto_171092 ) ) ( not ( = ?auto_171097 ?auto_171091 ) ) ( not ( = ?auto_171095 ?auto_171094 ) ) ( not ( = ?auto_171095 ?auto_171096 ) ) ( not ( = ?auto_171095 ?auto_171093 ) ) ( not ( = ?auto_171095 ?auto_171092 ) ) ( not ( = ?auto_171095 ?auto_171091 ) ) ( not ( = ?auto_171094 ?auto_171096 ) ) ( not ( = ?auto_171094 ?auto_171093 ) ) ( not ( = ?auto_171094 ?auto_171092 ) ) ( not ( = ?auto_171094 ?auto_171091 ) ) ( not ( = ?auto_171096 ?auto_171093 ) ) ( not ( = ?auto_171096 ?auto_171092 ) ) ( not ( = ?auto_171096 ?auto_171091 ) ) ( not ( = ?auto_171089 ?auto_171097 ) ) ( not ( = ?auto_171089 ?auto_171095 ) ) ( not ( = ?auto_171089 ?auto_171094 ) ) ( not ( = ?auto_171089 ?auto_171096 ) ) ( not ( = ?auto_171090 ?auto_171097 ) ) ( not ( = ?auto_171090 ?auto_171095 ) ) ( not ( = ?auto_171090 ?auto_171094 ) ) ( not ( = ?auto_171090 ?auto_171096 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171097 ?auto_171095 ?auto_171094 ?auto_171096 ?auto_171093 ?auto_171092 )
      ( MAKE-4PILE ?auto_171089 ?auto_171090 ?auto_171091 ?auto_171092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171098 - BLOCK
      ?auto_171099 - BLOCK
      ?auto_171100 - BLOCK
      ?auto_171101 - BLOCK
    )
    :vars
    (
      ?auto_171106 - BLOCK
      ?auto_171102 - BLOCK
      ?auto_171105 - BLOCK
      ?auto_171104 - BLOCK
      ?auto_171103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171098 ) ( not ( = ?auto_171098 ?auto_171099 ) ) ( not ( = ?auto_171098 ?auto_171100 ) ) ( not ( = ?auto_171098 ?auto_171101 ) ) ( not ( = ?auto_171099 ?auto_171100 ) ) ( not ( = ?auto_171099 ?auto_171101 ) ) ( not ( = ?auto_171100 ?auto_171101 ) ) ( ON ?auto_171101 ?auto_171106 ) ( not ( = ?auto_171098 ?auto_171106 ) ) ( not ( = ?auto_171099 ?auto_171106 ) ) ( not ( = ?auto_171100 ?auto_171106 ) ) ( not ( = ?auto_171101 ?auto_171106 ) ) ( ON ?auto_171100 ?auto_171101 ) ( CLEAR ?auto_171100 ) ( ON-TABLE ?auto_171102 ) ( ON ?auto_171105 ?auto_171102 ) ( ON ?auto_171104 ?auto_171105 ) ( ON ?auto_171103 ?auto_171104 ) ( ON ?auto_171106 ?auto_171103 ) ( not ( = ?auto_171102 ?auto_171105 ) ) ( not ( = ?auto_171102 ?auto_171104 ) ) ( not ( = ?auto_171102 ?auto_171103 ) ) ( not ( = ?auto_171102 ?auto_171106 ) ) ( not ( = ?auto_171102 ?auto_171101 ) ) ( not ( = ?auto_171102 ?auto_171100 ) ) ( not ( = ?auto_171105 ?auto_171104 ) ) ( not ( = ?auto_171105 ?auto_171103 ) ) ( not ( = ?auto_171105 ?auto_171106 ) ) ( not ( = ?auto_171105 ?auto_171101 ) ) ( not ( = ?auto_171105 ?auto_171100 ) ) ( not ( = ?auto_171104 ?auto_171103 ) ) ( not ( = ?auto_171104 ?auto_171106 ) ) ( not ( = ?auto_171104 ?auto_171101 ) ) ( not ( = ?auto_171104 ?auto_171100 ) ) ( not ( = ?auto_171103 ?auto_171106 ) ) ( not ( = ?auto_171103 ?auto_171101 ) ) ( not ( = ?auto_171103 ?auto_171100 ) ) ( not ( = ?auto_171098 ?auto_171102 ) ) ( not ( = ?auto_171098 ?auto_171105 ) ) ( not ( = ?auto_171098 ?auto_171104 ) ) ( not ( = ?auto_171098 ?auto_171103 ) ) ( not ( = ?auto_171099 ?auto_171102 ) ) ( not ( = ?auto_171099 ?auto_171105 ) ) ( not ( = ?auto_171099 ?auto_171104 ) ) ( not ( = ?auto_171099 ?auto_171103 ) ) ( HOLDING ?auto_171099 ) ( CLEAR ?auto_171098 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171098 ?auto_171099 )
      ( MAKE-4PILE ?auto_171098 ?auto_171099 ?auto_171100 ?auto_171101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171107 - BLOCK
      ?auto_171108 - BLOCK
      ?auto_171109 - BLOCK
      ?auto_171110 - BLOCK
    )
    :vars
    (
      ?auto_171112 - BLOCK
      ?auto_171115 - BLOCK
      ?auto_171111 - BLOCK
      ?auto_171113 - BLOCK
      ?auto_171114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171107 ) ( not ( = ?auto_171107 ?auto_171108 ) ) ( not ( = ?auto_171107 ?auto_171109 ) ) ( not ( = ?auto_171107 ?auto_171110 ) ) ( not ( = ?auto_171108 ?auto_171109 ) ) ( not ( = ?auto_171108 ?auto_171110 ) ) ( not ( = ?auto_171109 ?auto_171110 ) ) ( ON ?auto_171110 ?auto_171112 ) ( not ( = ?auto_171107 ?auto_171112 ) ) ( not ( = ?auto_171108 ?auto_171112 ) ) ( not ( = ?auto_171109 ?auto_171112 ) ) ( not ( = ?auto_171110 ?auto_171112 ) ) ( ON ?auto_171109 ?auto_171110 ) ( ON-TABLE ?auto_171115 ) ( ON ?auto_171111 ?auto_171115 ) ( ON ?auto_171113 ?auto_171111 ) ( ON ?auto_171114 ?auto_171113 ) ( ON ?auto_171112 ?auto_171114 ) ( not ( = ?auto_171115 ?auto_171111 ) ) ( not ( = ?auto_171115 ?auto_171113 ) ) ( not ( = ?auto_171115 ?auto_171114 ) ) ( not ( = ?auto_171115 ?auto_171112 ) ) ( not ( = ?auto_171115 ?auto_171110 ) ) ( not ( = ?auto_171115 ?auto_171109 ) ) ( not ( = ?auto_171111 ?auto_171113 ) ) ( not ( = ?auto_171111 ?auto_171114 ) ) ( not ( = ?auto_171111 ?auto_171112 ) ) ( not ( = ?auto_171111 ?auto_171110 ) ) ( not ( = ?auto_171111 ?auto_171109 ) ) ( not ( = ?auto_171113 ?auto_171114 ) ) ( not ( = ?auto_171113 ?auto_171112 ) ) ( not ( = ?auto_171113 ?auto_171110 ) ) ( not ( = ?auto_171113 ?auto_171109 ) ) ( not ( = ?auto_171114 ?auto_171112 ) ) ( not ( = ?auto_171114 ?auto_171110 ) ) ( not ( = ?auto_171114 ?auto_171109 ) ) ( not ( = ?auto_171107 ?auto_171115 ) ) ( not ( = ?auto_171107 ?auto_171111 ) ) ( not ( = ?auto_171107 ?auto_171113 ) ) ( not ( = ?auto_171107 ?auto_171114 ) ) ( not ( = ?auto_171108 ?auto_171115 ) ) ( not ( = ?auto_171108 ?auto_171111 ) ) ( not ( = ?auto_171108 ?auto_171113 ) ) ( not ( = ?auto_171108 ?auto_171114 ) ) ( CLEAR ?auto_171107 ) ( ON ?auto_171108 ?auto_171109 ) ( CLEAR ?auto_171108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171115 ?auto_171111 ?auto_171113 ?auto_171114 ?auto_171112 ?auto_171110 ?auto_171109 )
      ( MAKE-4PILE ?auto_171107 ?auto_171108 ?auto_171109 ?auto_171110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171116 - BLOCK
      ?auto_171117 - BLOCK
      ?auto_171118 - BLOCK
      ?auto_171119 - BLOCK
    )
    :vars
    (
      ?auto_171124 - BLOCK
      ?auto_171123 - BLOCK
      ?auto_171122 - BLOCK
      ?auto_171121 - BLOCK
      ?auto_171120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171116 ?auto_171117 ) ) ( not ( = ?auto_171116 ?auto_171118 ) ) ( not ( = ?auto_171116 ?auto_171119 ) ) ( not ( = ?auto_171117 ?auto_171118 ) ) ( not ( = ?auto_171117 ?auto_171119 ) ) ( not ( = ?auto_171118 ?auto_171119 ) ) ( ON ?auto_171119 ?auto_171124 ) ( not ( = ?auto_171116 ?auto_171124 ) ) ( not ( = ?auto_171117 ?auto_171124 ) ) ( not ( = ?auto_171118 ?auto_171124 ) ) ( not ( = ?auto_171119 ?auto_171124 ) ) ( ON ?auto_171118 ?auto_171119 ) ( ON-TABLE ?auto_171123 ) ( ON ?auto_171122 ?auto_171123 ) ( ON ?auto_171121 ?auto_171122 ) ( ON ?auto_171120 ?auto_171121 ) ( ON ?auto_171124 ?auto_171120 ) ( not ( = ?auto_171123 ?auto_171122 ) ) ( not ( = ?auto_171123 ?auto_171121 ) ) ( not ( = ?auto_171123 ?auto_171120 ) ) ( not ( = ?auto_171123 ?auto_171124 ) ) ( not ( = ?auto_171123 ?auto_171119 ) ) ( not ( = ?auto_171123 ?auto_171118 ) ) ( not ( = ?auto_171122 ?auto_171121 ) ) ( not ( = ?auto_171122 ?auto_171120 ) ) ( not ( = ?auto_171122 ?auto_171124 ) ) ( not ( = ?auto_171122 ?auto_171119 ) ) ( not ( = ?auto_171122 ?auto_171118 ) ) ( not ( = ?auto_171121 ?auto_171120 ) ) ( not ( = ?auto_171121 ?auto_171124 ) ) ( not ( = ?auto_171121 ?auto_171119 ) ) ( not ( = ?auto_171121 ?auto_171118 ) ) ( not ( = ?auto_171120 ?auto_171124 ) ) ( not ( = ?auto_171120 ?auto_171119 ) ) ( not ( = ?auto_171120 ?auto_171118 ) ) ( not ( = ?auto_171116 ?auto_171123 ) ) ( not ( = ?auto_171116 ?auto_171122 ) ) ( not ( = ?auto_171116 ?auto_171121 ) ) ( not ( = ?auto_171116 ?auto_171120 ) ) ( not ( = ?auto_171117 ?auto_171123 ) ) ( not ( = ?auto_171117 ?auto_171122 ) ) ( not ( = ?auto_171117 ?auto_171121 ) ) ( not ( = ?auto_171117 ?auto_171120 ) ) ( ON ?auto_171117 ?auto_171118 ) ( CLEAR ?auto_171117 ) ( HOLDING ?auto_171116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171116 )
      ( MAKE-4PILE ?auto_171116 ?auto_171117 ?auto_171118 ?auto_171119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171125 - BLOCK
      ?auto_171126 - BLOCK
      ?auto_171127 - BLOCK
      ?auto_171128 - BLOCK
    )
    :vars
    (
      ?auto_171131 - BLOCK
      ?auto_171133 - BLOCK
      ?auto_171130 - BLOCK
      ?auto_171129 - BLOCK
      ?auto_171132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171125 ?auto_171126 ) ) ( not ( = ?auto_171125 ?auto_171127 ) ) ( not ( = ?auto_171125 ?auto_171128 ) ) ( not ( = ?auto_171126 ?auto_171127 ) ) ( not ( = ?auto_171126 ?auto_171128 ) ) ( not ( = ?auto_171127 ?auto_171128 ) ) ( ON ?auto_171128 ?auto_171131 ) ( not ( = ?auto_171125 ?auto_171131 ) ) ( not ( = ?auto_171126 ?auto_171131 ) ) ( not ( = ?auto_171127 ?auto_171131 ) ) ( not ( = ?auto_171128 ?auto_171131 ) ) ( ON ?auto_171127 ?auto_171128 ) ( ON-TABLE ?auto_171133 ) ( ON ?auto_171130 ?auto_171133 ) ( ON ?auto_171129 ?auto_171130 ) ( ON ?auto_171132 ?auto_171129 ) ( ON ?auto_171131 ?auto_171132 ) ( not ( = ?auto_171133 ?auto_171130 ) ) ( not ( = ?auto_171133 ?auto_171129 ) ) ( not ( = ?auto_171133 ?auto_171132 ) ) ( not ( = ?auto_171133 ?auto_171131 ) ) ( not ( = ?auto_171133 ?auto_171128 ) ) ( not ( = ?auto_171133 ?auto_171127 ) ) ( not ( = ?auto_171130 ?auto_171129 ) ) ( not ( = ?auto_171130 ?auto_171132 ) ) ( not ( = ?auto_171130 ?auto_171131 ) ) ( not ( = ?auto_171130 ?auto_171128 ) ) ( not ( = ?auto_171130 ?auto_171127 ) ) ( not ( = ?auto_171129 ?auto_171132 ) ) ( not ( = ?auto_171129 ?auto_171131 ) ) ( not ( = ?auto_171129 ?auto_171128 ) ) ( not ( = ?auto_171129 ?auto_171127 ) ) ( not ( = ?auto_171132 ?auto_171131 ) ) ( not ( = ?auto_171132 ?auto_171128 ) ) ( not ( = ?auto_171132 ?auto_171127 ) ) ( not ( = ?auto_171125 ?auto_171133 ) ) ( not ( = ?auto_171125 ?auto_171130 ) ) ( not ( = ?auto_171125 ?auto_171129 ) ) ( not ( = ?auto_171125 ?auto_171132 ) ) ( not ( = ?auto_171126 ?auto_171133 ) ) ( not ( = ?auto_171126 ?auto_171130 ) ) ( not ( = ?auto_171126 ?auto_171129 ) ) ( not ( = ?auto_171126 ?auto_171132 ) ) ( ON ?auto_171126 ?auto_171127 ) ( ON ?auto_171125 ?auto_171126 ) ( CLEAR ?auto_171125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171133 ?auto_171130 ?auto_171129 ?auto_171132 ?auto_171131 ?auto_171128 ?auto_171127 ?auto_171126 )
      ( MAKE-4PILE ?auto_171125 ?auto_171126 ?auto_171127 ?auto_171128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171138 - BLOCK
      ?auto_171139 - BLOCK
      ?auto_171140 - BLOCK
      ?auto_171141 - BLOCK
    )
    :vars
    (
      ?auto_171142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171142 ?auto_171141 ) ( CLEAR ?auto_171142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171138 ) ( ON ?auto_171139 ?auto_171138 ) ( ON ?auto_171140 ?auto_171139 ) ( ON ?auto_171141 ?auto_171140 ) ( not ( = ?auto_171138 ?auto_171139 ) ) ( not ( = ?auto_171138 ?auto_171140 ) ) ( not ( = ?auto_171138 ?auto_171141 ) ) ( not ( = ?auto_171138 ?auto_171142 ) ) ( not ( = ?auto_171139 ?auto_171140 ) ) ( not ( = ?auto_171139 ?auto_171141 ) ) ( not ( = ?auto_171139 ?auto_171142 ) ) ( not ( = ?auto_171140 ?auto_171141 ) ) ( not ( = ?auto_171140 ?auto_171142 ) ) ( not ( = ?auto_171141 ?auto_171142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171142 ?auto_171141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171143 - BLOCK
      ?auto_171144 - BLOCK
      ?auto_171145 - BLOCK
      ?auto_171146 - BLOCK
    )
    :vars
    (
      ?auto_171147 - BLOCK
      ?auto_171148 - BLOCK
      ?auto_171149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171147 ?auto_171146 ) ( CLEAR ?auto_171147 ) ( ON-TABLE ?auto_171143 ) ( ON ?auto_171144 ?auto_171143 ) ( ON ?auto_171145 ?auto_171144 ) ( ON ?auto_171146 ?auto_171145 ) ( not ( = ?auto_171143 ?auto_171144 ) ) ( not ( = ?auto_171143 ?auto_171145 ) ) ( not ( = ?auto_171143 ?auto_171146 ) ) ( not ( = ?auto_171143 ?auto_171147 ) ) ( not ( = ?auto_171144 ?auto_171145 ) ) ( not ( = ?auto_171144 ?auto_171146 ) ) ( not ( = ?auto_171144 ?auto_171147 ) ) ( not ( = ?auto_171145 ?auto_171146 ) ) ( not ( = ?auto_171145 ?auto_171147 ) ) ( not ( = ?auto_171146 ?auto_171147 ) ) ( HOLDING ?auto_171148 ) ( CLEAR ?auto_171149 ) ( not ( = ?auto_171143 ?auto_171148 ) ) ( not ( = ?auto_171143 ?auto_171149 ) ) ( not ( = ?auto_171144 ?auto_171148 ) ) ( not ( = ?auto_171144 ?auto_171149 ) ) ( not ( = ?auto_171145 ?auto_171148 ) ) ( not ( = ?auto_171145 ?auto_171149 ) ) ( not ( = ?auto_171146 ?auto_171148 ) ) ( not ( = ?auto_171146 ?auto_171149 ) ) ( not ( = ?auto_171147 ?auto_171148 ) ) ( not ( = ?auto_171147 ?auto_171149 ) ) ( not ( = ?auto_171148 ?auto_171149 ) ) )
    :subtasks
    ( ( !STACK ?auto_171148 ?auto_171149 )
      ( MAKE-4PILE ?auto_171143 ?auto_171144 ?auto_171145 ?auto_171146 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171150 - BLOCK
      ?auto_171151 - BLOCK
      ?auto_171152 - BLOCK
      ?auto_171153 - BLOCK
    )
    :vars
    (
      ?auto_171155 - BLOCK
      ?auto_171154 - BLOCK
      ?auto_171156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171155 ?auto_171153 ) ( ON-TABLE ?auto_171150 ) ( ON ?auto_171151 ?auto_171150 ) ( ON ?auto_171152 ?auto_171151 ) ( ON ?auto_171153 ?auto_171152 ) ( not ( = ?auto_171150 ?auto_171151 ) ) ( not ( = ?auto_171150 ?auto_171152 ) ) ( not ( = ?auto_171150 ?auto_171153 ) ) ( not ( = ?auto_171150 ?auto_171155 ) ) ( not ( = ?auto_171151 ?auto_171152 ) ) ( not ( = ?auto_171151 ?auto_171153 ) ) ( not ( = ?auto_171151 ?auto_171155 ) ) ( not ( = ?auto_171152 ?auto_171153 ) ) ( not ( = ?auto_171152 ?auto_171155 ) ) ( not ( = ?auto_171153 ?auto_171155 ) ) ( CLEAR ?auto_171154 ) ( not ( = ?auto_171150 ?auto_171156 ) ) ( not ( = ?auto_171150 ?auto_171154 ) ) ( not ( = ?auto_171151 ?auto_171156 ) ) ( not ( = ?auto_171151 ?auto_171154 ) ) ( not ( = ?auto_171152 ?auto_171156 ) ) ( not ( = ?auto_171152 ?auto_171154 ) ) ( not ( = ?auto_171153 ?auto_171156 ) ) ( not ( = ?auto_171153 ?auto_171154 ) ) ( not ( = ?auto_171155 ?auto_171156 ) ) ( not ( = ?auto_171155 ?auto_171154 ) ) ( not ( = ?auto_171156 ?auto_171154 ) ) ( ON ?auto_171156 ?auto_171155 ) ( CLEAR ?auto_171156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171150 ?auto_171151 ?auto_171152 ?auto_171153 ?auto_171155 )
      ( MAKE-4PILE ?auto_171150 ?auto_171151 ?auto_171152 ?auto_171153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171157 - BLOCK
      ?auto_171158 - BLOCK
      ?auto_171159 - BLOCK
      ?auto_171160 - BLOCK
    )
    :vars
    (
      ?auto_171163 - BLOCK
      ?auto_171162 - BLOCK
      ?auto_171161 - BLOCK
      ?auto_171164 - BLOCK
      ?auto_171165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171163 ?auto_171160 ) ( ON-TABLE ?auto_171157 ) ( ON ?auto_171158 ?auto_171157 ) ( ON ?auto_171159 ?auto_171158 ) ( ON ?auto_171160 ?auto_171159 ) ( not ( = ?auto_171157 ?auto_171158 ) ) ( not ( = ?auto_171157 ?auto_171159 ) ) ( not ( = ?auto_171157 ?auto_171160 ) ) ( not ( = ?auto_171157 ?auto_171163 ) ) ( not ( = ?auto_171158 ?auto_171159 ) ) ( not ( = ?auto_171158 ?auto_171160 ) ) ( not ( = ?auto_171158 ?auto_171163 ) ) ( not ( = ?auto_171159 ?auto_171160 ) ) ( not ( = ?auto_171159 ?auto_171163 ) ) ( not ( = ?auto_171160 ?auto_171163 ) ) ( not ( = ?auto_171157 ?auto_171162 ) ) ( not ( = ?auto_171157 ?auto_171161 ) ) ( not ( = ?auto_171158 ?auto_171162 ) ) ( not ( = ?auto_171158 ?auto_171161 ) ) ( not ( = ?auto_171159 ?auto_171162 ) ) ( not ( = ?auto_171159 ?auto_171161 ) ) ( not ( = ?auto_171160 ?auto_171162 ) ) ( not ( = ?auto_171160 ?auto_171161 ) ) ( not ( = ?auto_171163 ?auto_171162 ) ) ( not ( = ?auto_171163 ?auto_171161 ) ) ( not ( = ?auto_171162 ?auto_171161 ) ) ( ON ?auto_171162 ?auto_171163 ) ( CLEAR ?auto_171162 ) ( HOLDING ?auto_171161 ) ( CLEAR ?auto_171164 ) ( ON-TABLE ?auto_171165 ) ( ON ?auto_171164 ?auto_171165 ) ( not ( = ?auto_171165 ?auto_171164 ) ) ( not ( = ?auto_171165 ?auto_171161 ) ) ( not ( = ?auto_171164 ?auto_171161 ) ) ( not ( = ?auto_171157 ?auto_171164 ) ) ( not ( = ?auto_171157 ?auto_171165 ) ) ( not ( = ?auto_171158 ?auto_171164 ) ) ( not ( = ?auto_171158 ?auto_171165 ) ) ( not ( = ?auto_171159 ?auto_171164 ) ) ( not ( = ?auto_171159 ?auto_171165 ) ) ( not ( = ?auto_171160 ?auto_171164 ) ) ( not ( = ?auto_171160 ?auto_171165 ) ) ( not ( = ?auto_171163 ?auto_171164 ) ) ( not ( = ?auto_171163 ?auto_171165 ) ) ( not ( = ?auto_171162 ?auto_171164 ) ) ( not ( = ?auto_171162 ?auto_171165 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171165 ?auto_171164 ?auto_171161 )
      ( MAKE-4PILE ?auto_171157 ?auto_171158 ?auto_171159 ?auto_171160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171166 - BLOCK
      ?auto_171167 - BLOCK
      ?auto_171168 - BLOCK
      ?auto_171169 - BLOCK
    )
    :vars
    (
      ?auto_171174 - BLOCK
      ?auto_171173 - BLOCK
      ?auto_171170 - BLOCK
      ?auto_171172 - BLOCK
      ?auto_171171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171174 ?auto_171169 ) ( ON-TABLE ?auto_171166 ) ( ON ?auto_171167 ?auto_171166 ) ( ON ?auto_171168 ?auto_171167 ) ( ON ?auto_171169 ?auto_171168 ) ( not ( = ?auto_171166 ?auto_171167 ) ) ( not ( = ?auto_171166 ?auto_171168 ) ) ( not ( = ?auto_171166 ?auto_171169 ) ) ( not ( = ?auto_171166 ?auto_171174 ) ) ( not ( = ?auto_171167 ?auto_171168 ) ) ( not ( = ?auto_171167 ?auto_171169 ) ) ( not ( = ?auto_171167 ?auto_171174 ) ) ( not ( = ?auto_171168 ?auto_171169 ) ) ( not ( = ?auto_171168 ?auto_171174 ) ) ( not ( = ?auto_171169 ?auto_171174 ) ) ( not ( = ?auto_171166 ?auto_171173 ) ) ( not ( = ?auto_171166 ?auto_171170 ) ) ( not ( = ?auto_171167 ?auto_171173 ) ) ( not ( = ?auto_171167 ?auto_171170 ) ) ( not ( = ?auto_171168 ?auto_171173 ) ) ( not ( = ?auto_171168 ?auto_171170 ) ) ( not ( = ?auto_171169 ?auto_171173 ) ) ( not ( = ?auto_171169 ?auto_171170 ) ) ( not ( = ?auto_171174 ?auto_171173 ) ) ( not ( = ?auto_171174 ?auto_171170 ) ) ( not ( = ?auto_171173 ?auto_171170 ) ) ( ON ?auto_171173 ?auto_171174 ) ( CLEAR ?auto_171172 ) ( ON-TABLE ?auto_171171 ) ( ON ?auto_171172 ?auto_171171 ) ( not ( = ?auto_171171 ?auto_171172 ) ) ( not ( = ?auto_171171 ?auto_171170 ) ) ( not ( = ?auto_171172 ?auto_171170 ) ) ( not ( = ?auto_171166 ?auto_171172 ) ) ( not ( = ?auto_171166 ?auto_171171 ) ) ( not ( = ?auto_171167 ?auto_171172 ) ) ( not ( = ?auto_171167 ?auto_171171 ) ) ( not ( = ?auto_171168 ?auto_171172 ) ) ( not ( = ?auto_171168 ?auto_171171 ) ) ( not ( = ?auto_171169 ?auto_171172 ) ) ( not ( = ?auto_171169 ?auto_171171 ) ) ( not ( = ?auto_171174 ?auto_171172 ) ) ( not ( = ?auto_171174 ?auto_171171 ) ) ( not ( = ?auto_171173 ?auto_171172 ) ) ( not ( = ?auto_171173 ?auto_171171 ) ) ( ON ?auto_171170 ?auto_171173 ) ( CLEAR ?auto_171170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171166 ?auto_171167 ?auto_171168 ?auto_171169 ?auto_171174 ?auto_171173 )
      ( MAKE-4PILE ?auto_171166 ?auto_171167 ?auto_171168 ?auto_171169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171175 - BLOCK
      ?auto_171176 - BLOCK
      ?auto_171177 - BLOCK
      ?auto_171178 - BLOCK
    )
    :vars
    (
      ?auto_171182 - BLOCK
      ?auto_171180 - BLOCK
      ?auto_171183 - BLOCK
      ?auto_171181 - BLOCK
      ?auto_171179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171182 ?auto_171178 ) ( ON-TABLE ?auto_171175 ) ( ON ?auto_171176 ?auto_171175 ) ( ON ?auto_171177 ?auto_171176 ) ( ON ?auto_171178 ?auto_171177 ) ( not ( = ?auto_171175 ?auto_171176 ) ) ( not ( = ?auto_171175 ?auto_171177 ) ) ( not ( = ?auto_171175 ?auto_171178 ) ) ( not ( = ?auto_171175 ?auto_171182 ) ) ( not ( = ?auto_171176 ?auto_171177 ) ) ( not ( = ?auto_171176 ?auto_171178 ) ) ( not ( = ?auto_171176 ?auto_171182 ) ) ( not ( = ?auto_171177 ?auto_171178 ) ) ( not ( = ?auto_171177 ?auto_171182 ) ) ( not ( = ?auto_171178 ?auto_171182 ) ) ( not ( = ?auto_171175 ?auto_171180 ) ) ( not ( = ?auto_171175 ?auto_171183 ) ) ( not ( = ?auto_171176 ?auto_171180 ) ) ( not ( = ?auto_171176 ?auto_171183 ) ) ( not ( = ?auto_171177 ?auto_171180 ) ) ( not ( = ?auto_171177 ?auto_171183 ) ) ( not ( = ?auto_171178 ?auto_171180 ) ) ( not ( = ?auto_171178 ?auto_171183 ) ) ( not ( = ?auto_171182 ?auto_171180 ) ) ( not ( = ?auto_171182 ?auto_171183 ) ) ( not ( = ?auto_171180 ?auto_171183 ) ) ( ON ?auto_171180 ?auto_171182 ) ( ON-TABLE ?auto_171181 ) ( not ( = ?auto_171181 ?auto_171179 ) ) ( not ( = ?auto_171181 ?auto_171183 ) ) ( not ( = ?auto_171179 ?auto_171183 ) ) ( not ( = ?auto_171175 ?auto_171179 ) ) ( not ( = ?auto_171175 ?auto_171181 ) ) ( not ( = ?auto_171176 ?auto_171179 ) ) ( not ( = ?auto_171176 ?auto_171181 ) ) ( not ( = ?auto_171177 ?auto_171179 ) ) ( not ( = ?auto_171177 ?auto_171181 ) ) ( not ( = ?auto_171178 ?auto_171179 ) ) ( not ( = ?auto_171178 ?auto_171181 ) ) ( not ( = ?auto_171182 ?auto_171179 ) ) ( not ( = ?auto_171182 ?auto_171181 ) ) ( not ( = ?auto_171180 ?auto_171179 ) ) ( not ( = ?auto_171180 ?auto_171181 ) ) ( ON ?auto_171183 ?auto_171180 ) ( CLEAR ?auto_171183 ) ( HOLDING ?auto_171179 ) ( CLEAR ?auto_171181 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171181 ?auto_171179 )
      ( MAKE-4PILE ?auto_171175 ?auto_171176 ?auto_171177 ?auto_171178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171184 - BLOCK
      ?auto_171185 - BLOCK
      ?auto_171186 - BLOCK
      ?auto_171187 - BLOCK
    )
    :vars
    (
      ?auto_171188 - BLOCK
      ?auto_171190 - BLOCK
      ?auto_171192 - BLOCK
      ?auto_171191 - BLOCK
      ?auto_171189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171188 ?auto_171187 ) ( ON-TABLE ?auto_171184 ) ( ON ?auto_171185 ?auto_171184 ) ( ON ?auto_171186 ?auto_171185 ) ( ON ?auto_171187 ?auto_171186 ) ( not ( = ?auto_171184 ?auto_171185 ) ) ( not ( = ?auto_171184 ?auto_171186 ) ) ( not ( = ?auto_171184 ?auto_171187 ) ) ( not ( = ?auto_171184 ?auto_171188 ) ) ( not ( = ?auto_171185 ?auto_171186 ) ) ( not ( = ?auto_171185 ?auto_171187 ) ) ( not ( = ?auto_171185 ?auto_171188 ) ) ( not ( = ?auto_171186 ?auto_171187 ) ) ( not ( = ?auto_171186 ?auto_171188 ) ) ( not ( = ?auto_171187 ?auto_171188 ) ) ( not ( = ?auto_171184 ?auto_171190 ) ) ( not ( = ?auto_171184 ?auto_171192 ) ) ( not ( = ?auto_171185 ?auto_171190 ) ) ( not ( = ?auto_171185 ?auto_171192 ) ) ( not ( = ?auto_171186 ?auto_171190 ) ) ( not ( = ?auto_171186 ?auto_171192 ) ) ( not ( = ?auto_171187 ?auto_171190 ) ) ( not ( = ?auto_171187 ?auto_171192 ) ) ( not ( = ?auto_171188 ?auto_171190 ) ) ( not ( = ?auto_171188 ?auto_171192 ) ) ( not ( = ?auto_171190 ?auto_171192 ) ) ( ON ?auto_171190 ?auto_171188 ) ( ON-TABLE ?auto_171191 ) ( not ( = ?auto_171191 ?auto_171189 ) ) ( not ( = ?auto_171191 ?auto_171192 ) ) ( not ( = ?auto_171189 ?auto_171192 ) ) ( not ( = ?auto_171184 ?auto_171189 ) ) ( not ( = ?auto_171184 ?auto_171191 ) ) ( not ( = ?auto_171185 ?auto_171189 ) ) ( not ( = ?auto_171185 ?auto_171191 ) ) ( not ( = ?auto_171186 ?auto_171189 ) ) ( not ( = ?auto_171186 ?auto_171191 ) ) ( not ( = ?auto_171187 ?auto_171189 ) ) ( not ( = ?auto_171187 ?auto_171191 ) ) ( not ( = ?auto_171188 ?auto_171189 ) ) ( not ( = ?auto_171188 ?auto_171191 ) ) ( not ( = ?auto_171190 ?auto_171189 ) ) ( not ( = ?auto_171190 ?auto_171191 ) ) ( ON ?auto_171192 ?auto_171190 ) ( CLEAR ?auto_171191 ) ( ON ?auto_171189 ?auto_171192 ) ( CLEAR ?auto_171189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171184 ?auto_171185 ?auto_171186 ?auto_171187 ?auto_171188 ?auto_171190 ?auto_171192 )
      ( MAKE-4PILE ?auto_171184 ?auto_171185 ?auto_171186 ?auto_171187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171193 - BLOCK
      ?auto_171194 - BLOCK
      ?auto_171195 - BLOCK
      ?auto_171196 - BLOCK
    )
    :vars
    (
      ?auto_171197 - BLOCK
      ?auto_171199 - BLOCK
      ?auto_171201 - BLOCK
      ?auto_171198 - BLOCK
      ?auto_171200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171197 ?auto_171196 ) ( ON-TABLE ?auto_171193 ) ( ON ?auto_171194 ?auto_171193 ) ( ON ?auto_171195 ?auto_171194 ) ( ON ?auto_171196 ?auto_171195 ) ( not ( = ?auto_171193 ?auto_171194 ) ) ( not ( = ?auto_171193 ?auto_171195 ) ) ( not ( = ?auto_171193 ?auto_171196 ) ) ( not ( = ?auto_171193 ?auto_171197 ) ) ( not ( = ?auto_171194 ?auto_171195 ) ) ( not ( = ?auto_171194 ?auto_171196 ) ) ( not ( = ?auto_171194 ?auto_171197 ) ) ( not ( = ?auto_171195 ?auto_171196 ) ) ( not ( = ?auto_171195 ?auto_171197 ) ) ( not ( = ?auto_171196 ?auto_171197 ) ) ( not ( = ?auto_171193 ?auto_171199 ) ) ( not ( = ?auto_171193 ?auto_171201 ) ) ( not ( = ?auto_171194 ?auto_171199 ) ) ( not ( = ?auto_171194 ?auto_171201 ) ) ( not ( = ?auto_171195 ?auto_171199 ) ) ( not ( = ?auto_171195 ?auto_171201 ) ) ( not ( = ?auto_171196 ?auto_171199 ) ) ( not ( = ?auto_171196 ?auto_171201 ) ) ( not ( = ?auto_171197 ?auto_171199 ) ) ( not ( = ?auto_171197 ?auto_171201 ) ) ( not ( = ?auto_171199 ?auto_171201 ) ) ( ON ?auto_171199 ?auto_171197 ) ( not ( = ?auto_171198 ?auto_171200 ) ) ( not ( = ?auto_171198 ?auto_171201 ) ) ( not ( = ?auto_171200 ?auto_171201 ) ) ( not ( = ?auto_171193 ?auto_171200 ) ) ( not ( = ?auto_171193 ?auto_171198 ) ) ( not ( = ?auto_171194 ?auto_171200 ) ) ( not ( = ?auto_171194 ?auto_171198 ) ) ( not ( = ?auto_171195 ?auto_171200 ) ) ( not ( = ?auto_171195 ?auto_171198 ) ) ( not ( = ?auto_171196 ?auto_171200 ) ) ( not ( = ?auto_171196 ?auto_171198 ) ) ( not ( = ?auto_171197 ?auto_171200 ) ) ( not ( = ?auto_171197 ?auto_171198 ) ) ( not ( = ?auto_171199 ?auto_171200 ) ) ( not ( = ?auto_171199 ?auto_171198 ) ) ( ON ?auto_171201 ?auto_171199 ) ( ON ?auto_171200 ?auto_171201 ) ( CLEAR ?auto_171200 ) ( HOLDING ?auto_171198 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171198 )
      ( MAKE-4PILE ?auto_171193 ?auto_171194 ?auto_171195 ?auto_171196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171202 - BLOCK
      ?auto_171203 - BLOCK
      ?auto_171204 - BLOCK
      ?auto_171205 - BLOCK
    )
    :vars
    (
      ?auto_171207 - BLOCK
      ?auto_171206 - BLOCK
      ?auto_171210 - BLOCK
      ?auto_171208 - BLOCK
      ?auto_171209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171207 ?auto_171205 ) ( ON-TABLE ?auto_171202 ) ( ON ?auto_171203 ?auto_171202 ) ( ON ?auto_171204 ?auto_171203 ) ( ON ?auto_171205 ?auto_171204 ) ( not ( = ?auto_171202 ?auto_171203 ) ) ( not ( = ?auto_171202 ?auto_171204 ) ) ( not ( = ?auto_171202 ?auto_171205 ) ) ( not ( = ?auto_171202 ?auto_171207 ) ) ( not ( = ?auto_171203 ?auto_171204 ) ) ( not ( = ?auto_171203 ?auto_171205 ) ) ( not ( = ?auto_171203 ?auto_171207 ) ) ( not ( = ?auto_171204 ?auto_171205 ) ) ( not ( = ?auto_171204 ?auto_171207 ) ) ( not ( = ?auto_171205 ?auto_171207 ) ) ( not ( = ?auto_171202 ?auto_171206 ) ) ( not ( = ?auto_171202 ?auto_171210 ) ) ( not ( = ?auto_171203 ?auto_171206 ) ) ( not ( = ?auto_171203 ?auto_171210 ) ) ( not ( = ?auto_171204 ?auto_171206 ) ) ( not ( = ?auto_171204 ?auto_171210 ) ) ( not ( = ?auto_171205 ?auto_171206 ) ) ( not ( = ?auto_171205 ?auto_171210 ) ) ( not ( = ?auto_171207 ?auto_171206 ) ) ( not ( = ?auto_171207 ?auto_171210 ) ) ( not ( = ?auto_171206 ?auto_171210 ) ) ( ON ?auto_171206 ?auto_171207 ) ( not ( = ?auto_171208 ?auto_171209 ) ) ( not ( = ?auto_171208 ?auto_171210 ) ) ( not ( = ?auto_171209 ?auto_171210 ) ) ( not ( = ?auto_171202 ?auto_171209 ) ) ( not ( = ?auto_171202 ?auto_171208 ) ) ( not ( = ?auto_171203 ?auto_171209 ) ) ( not ( = ?auto_171203 ?auto_171208 ) ) ( not ( = ?auto_171204 ?auto_171209 ) ) ( not ( = ?auto_171204 ?auto_171208 ) ) ( not ( = ?auto_171205 ?auto_171209 ) ) ( not ( = ?auto_171205 ?auto_171208 ) ) ( not ( = ?auto_171207 ?auto_171209 ) ) ( not ( = ?auto_171207 ?auto_171208 ) ) ( not ( = ?auto_171206 ?auto_171209 ) ) ( not ( = ?auto_171206 ?auto_171208 ) ) ( ON ?auto_171210 ?auto_171206 ) ( ON ?auto_171209 ?auto_171210 ) ( ON ?auto_171208 ?auto_171209 ) ( CLEAR ?auto_171208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171202 ?auto_171203 ?auto_171204 ?auto_171205 ?auto_171207 ?auto_171206 ?auto_171210 ?auto_171209 )
      ( MAKE-4PILE ?auto_171202 ?auto_171203 ?auto_171204 ?auto_171205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171216 - BLOCK
      ?auto_171217 - BLOCK
      ?auto_171218 - BLOCK
      ?auto_171219 - BLOCK
      ?auto_171220 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_171220 ) ( CLEAR ?auto_171219 ) ( ON-TABLE ?auto_171216 ) ( ON ?auto_171217 ?auto_171216 ) ( ON ?auto_171218 ?auto_171217 ) ( ON ?auto_171219 ?auto_171218 ) ( not ( = ?auto_171216 ?auto_171217 ) ) ( not ( = ?auto_171216 ?auto_171218 ) ) ( not ( = ?auto_171216 ?auto_171219 ) ) ( not ( = ?auto_171216 ?auto_171220 ) ) ( not ( = ?auto_171217 ?auto_171218 ) ) ( not ( = ?auto_171217 ?auto_171219 ) ) ( not ( = ?auto_171217 ?auto_171220 ) ) ( not ( = ?auto_171218 ?auto_171219 ) ) ( not ( = ?auto_171218 ?auto_171220 ) ) ( not ( = ?auto_171219 ?auto_171220 ) ) )
    :subtasks
    ( ( !STACK ?auto_171220 ?auto_171219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171221 - BLOCK
      ?auto_171222 - BLOCK
      ?auto_171223 - BLOCK
      ?auto_171224 - BLOCK
      ?auto_171225 - BLOCK
    )
    :vars
    (
      ?auto_171226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171224 ) ( ON-TABLE ?auto_171221 ) ( ON ?auto_171222 ?auto_171221 ) ( ON ?auto_171223 ?auto_171222 ) ( ON ?auto_171224 ?auto_171223 ) ( not ( = ?auto_171221 ?auto_171222 ) ) ( not ( = ?auto_171221 ?auto_171223 ) ) ( not ( = ?auto_171221 ?auto_171224 ) ) ( not ( = ?auto_171221 ?auto_171225 ) ) ( not ( = ?auto_171222 ?auto_171223 ) ) ( not ( = ?auto_171222 ?auto_171224 ) ) ( not ( = ?auto_171222 ?auto_171225 ) ) ( not ( = ?auto_171223 ?auto_171224 ) ) ( not ( = ?auto_171223 ?auto_171225 ) ) ( not ( = ?auto_171224 ?auto_171225 ) ) ( ON ?auto_171225 ?auto_171226 ) ( CLEAR ?auto_171225 ) ( HAND-EMPTY ) ( not ( = ?auto_171221 ?auto_171226 ) ) ( not ( = ?auto_171222 ?auto_171226 ) ) ( not ( = ?auto_171223 ?auto_171226 ) ) ( not ( = ?auto_171224 ?auto_171226 ) ) ( not ( = ?auto_171225 ?auto_171226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171225 ?auto_171226 )
      ( MAKE-5PILE ?auto_171221 ?auto_171222 ?auto_171223 ?auto_171224 ?auto_171225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171227 - BLOCK
      ?auto_171228 - BLOCK
      ?auto_171229 - BLOCK
      ?auto_171230 - BLOCK
      ?auto_171231 - BLOCK
    )
    :vars
    (
      ?auto_171232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171227 ) ( ON ?auto_171228 ?auto_171227 ) ( ON ?auto_171229 ?auto_171228 ) ( not ( = ?auto_171227 ?auto_171228 ) ) ( not ( = ?auto_171227 ?auto_171229 ) ) ( not ( = ?auto_171227 ?auto_171230 ) ) ( not ( = ?auto_171227 ?auto_171231 ) ) ( not ( = ?auto_171228 ?auto_171229 ) ) ( not ( = ?auto_171228 ?auto_171230 ) ) ( not ( = ?auto_171228 ?auto_171231 ) ) ( not ( = ?auto_171229 ?auto_171230 ) ) ( not ( = ?auto_171229 ?auto_171231 ) ) ( not ( = ?auto_171230 ?auto_171231 ) ) ( ON ?auto_171231 ?auto_171232 ) ( CLEAR ?auto_171231 ) ( not ( = ?auto_171227 ?auto_171232 ) ) ( not ( = ?auto_171228 ?auto_171232 ) ) ( not ( = ?auto_171229 ?auto_171232 ) ) ( not ( = ?auto_171230 ?auto_171232 ) ) ( not ( = ?auto_171231 ?auto_171232 ) ) ( HOLDING ?auto_171230 ) ( CLEAR ?auto_171229 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171227 ?auto_171228 ?auto_171229 ?auto_171230 )
      ( MAKE-5PILE ?auto_171227 ?auto_171228 ?auto_171229 ?auto_171230 ?auto_171231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171233 - BLOCK
      ?auto_171234 - BLOCK
      ?auto_171235 - BLOCK
      ?auto_171236 - BLOCK
      ?auto_171237 - BLOCK
    )
    :vars
    (
      ?auto_171238 - BLOCK
      ?auto_171239 - BLOCK
      ?auto_171241 - BLOCK
      ?auto_171240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171233 ) ( ON ?auto_171234 ?auto_171233 ) ( ON ?auto_171235 ?auto_171234 ) ( not ( = ?auto_171233 ?auto_171234 ) ) ( not ( = ?auto_171233 ?auto_171235 ) ) ( not ( = ?auto_171233 ?auto_171236 ) ) ( not ( = ?auto_171233 ?auto_171237 ) ) ( not ( = ?auto_171234 ?auto_171235 ) ) ( not ( = ?auto_171234 ?auto_171236 ) ) ( not ( = ?auto_171234 ?auto_171237 ) ) ( not ( = ?auto_171235 ?auto_171236 ) ) ( not ( = ?auto_171235 ?auto_171237 ) ) ( not ( = ?auto_171236 ?auto_171237 ) ) ( ON ?auto_171237 ?auto_171238 ) ( not ( = ?auto_171233 ?auto_171238 ) ) ( not ( = ?auto_171234 ?auto_171238 ) ) ( not ( = ?auto_171235 ?auto_171238 ) ) ( not ( = ?auto_171236 ?auto_171238 ) ) ( not ( = ?auto_171237 ?auto_171238 ) ) ( CLEAR ?auto_171235 ) ( ON ?auto_171236 ?auto_171237 ) ( CLEAR ?auto_171236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171239 ) ( ON ?auto_171241 ?auto_171239 ) ( ON ?auto_171240 ?auto_171241 ) ( ON ?auto_171238 ?auto_171240 ) ( not ( = ?auto_171239 ?auto_171241 ) ) ( not ( = ?auto_171239 ?auto_171240 ) ) ( not ( = ?auto_171239 ?auto_171238 ) ) ( not ( = ?auto_171239 ?auto_171237 ) ) ( not ( = ?auto_171239 ?auto_171236 ) ) ( not ( = ?auto_171241 ?auto_171240 ) ) ( not ( = ?auto_171241 ?auto_171238 ) ) ( not ( = ?auto_171241 ?auto_171237 ) ) ( not ( = ?auto_171241 ?auto_171236 ) ) ( not ( = ?auto_171240 ?auto_171238 ) ) ( not ( = ?auto_171240 ?auto_171237 ) ) ( not ( = ?auto_171240 ?auto_171236 ) ) ( not ( = ?auto_171233 ?auto_171239 ) ) ( not ( = ?auto_171233 ?auto_171241 ) ) ( not ( = ?auto_171233 ?auto_171240 ) ) ( not ( = ?auto_171234 ?auto_171239 ) ) ( not ( = ?auto_171234 ?auto_171241 ) ) ( not ( = ?auto_171234 ?auto_171240 ) ) ( not ( = ?auto_171235 ?auto_171239 ) ) ( not ( = ?auto_171235 ?auto_171241 ) ) ( not ( = ?auto_171235 ?auto_171240 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171239 ?auto_171241 ?auto_171240 ?auto_171238 ?auto_171237 )
      ( MAKE-5PILE ?auto_171233 ?auto_171234 ?auto_171235 ?auto_171236 ?auto_171237 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171242 - BLOCK
      ?auto_171243 - BLOCK
      ?auto_171244 - BLOCK
      ?auto_171245 - BLOCK
      ?auto_171246 - BLOCK
    )
    :vars
    (
      ?auto_171249 - BLOCK
      ?auto_171248 - BLOCK
      ?auto_171247 - BLOCK
      ?auto_171250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171242 ) ( ON ?auto_171243 ?auto_171242 ) ( not ( = ?auto_171242 ?auto_171243 ) ) ( not ( = ?auto_171242 ?auto_171244 ) ) ( not ( = ?auto_171242 ?auto_171245 ) ) ( not ( = ?auto_171242 ?auto_171246 ) ) ( not ( = ?auto_171243 ?auto_171244 ) ) ( not ( = ?auto_171243 ?auto_171245 ) ) ( not ( = ?auto_171243 ?auto_171246 ) ) ( not ( = ?auto_171244 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171246 ) ) ( not ( = ?auto_171245 ?auto_171246 ) ) ( ON ?auto_171246 ?auto_171249 ) ( not ( = ?auto_171242 ?auto_171249 ) ) ( not ( = ?auto_171243 ?auto_171249 ) ) ( not ( = ?auto_171244 ?auto_171249 ) ) ( not ( = ?auto_171245 ?auto_171249 ) ) ( not ( = ?auto_171246 ?auto_171249 ) ) ( ON ?auto_171245 ?auto_171246 ) ( CLEAR ?auto_171245 ) ( ON-TABLE ?auto_171248 ) ( ON ?auto_171247 ?auto_171248 ) ( ON ?auto_171250 ?auto_171247 ) ( ON ?auto_171249 ?auto_171250 ) ( not ( = ?auto_171248 ?auto_171247 ) ) ( not ( = ?auto_171248 ?auto_171250 ) ) ( not ( = ?auto_171248 ?auto_171249 ) ) ( not ( = ?auto_171248 ?auto_171246 ) ) ( not ( = ?auto_171248 ?auto_171245 ) ) ( not ( = ?auto_171247 ?auto_171250 ) ) ( not ( = ?auto_171247 ?auto_171249 ) ) ( not ( = ?auto_171247 ?auto_171246 ) ) ( not ( = ?auto_171247 ?auto_171245 ) ) ( not ( = ?auto_171250 ?auto_171249 ) ) ( not ( = ?auto_171250 ?auto_171246 ) ) ( not ( = ?auto_171250 ?auto_171245 ) ) ( not ( = ?auto_171242 ?auto_171248 ) ) ( not ( = ?auto_171242 ?auto_171247 ) ) ( not ( = ?auto_171242 ?auto_171250 ) ) ( not ( = ?auto_171243 ?auto_171248 ) ) ( not ( = ?auto_171243 ?auto_171247 ) ) ( not ( = ?auto_171243 ?auto_171250 ) ) ( not ( = ?auto_171244 ?auto_171248 ) ) ( not ( = ?auto_171244 ?auto_171247 ) ) ( not ( = ?auto_171244 ?auto_171250 ) ) ( HOLDING ?auto_171244 ) ( CLEAR ?auto_171243 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171242 ?auto_171243 ?auto_171244 )
      ( MAKE-5PILE ?auto_171242 ?auto_171243 ?auto_171244 ?auto_171245 ?auto_171246 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171251 - BLOCK
      ?auto_171252 - BLOCK
      ?auto_171253 - BLOCK
      ?auto_171254 - BLOCK
      ?auto_171255 - BLOCK
    )
    :vars
    (
      ?auto_171258 - BLOCK
      ?auto_171257 - BLOCK
      ?auto_171259 - BLOCK
      ?auto_171256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171251 ) ( ON ?auto_171252 ?auto_171251 ) ( not ( = ?auto_171251 ?auto_171252 ) ) ( not ( = ?auto_171251 ?auto_171253 ) ) ( not ( = ?auto_171251 ?auto_171254 ) ) ( not ( = ?auto_171251 ?auto_171255 ) ) ( not ( = ?auto_171252 ?auto_171253 ) ) ( not ( = ?auto_171252 ?auto_171254 ) ) ( not ( = ?auto_171252 ?auto_171255 ) ) ( not ( = ?auto_171253 ?auto_171254 ) ) ( not ( = ?auto_171253 ?auto_171255 ) ) ( not ( = ?auto_171254 ?auto_171255 ) ) ( ON ?auto_171255 ?auto_171258 ) ( not ( = ?auto_171251 ?auto_171258 ) ) ( not ( = ?auto_171252 ?auto_171258 ) ) ( not ( = ?auto_171253 ?auto_171258 ) ) ( not ( = ?auto_171254 ?auto_171258 ) ) ( not ( = ?auto_171255 ?auto_171258 ) ) ( ON ?auto_171254 ?auto_171255 ) ( ON-TABLE ?auto_171257 ) ( ON ?auto_171259 ?auto_171257 ) ( ON ?auto_171256 ?auto_171259 ) ( ON ?auto_171258 ?auto_171256 ) ( not ( = ?auto_171257 ?auto_171259 ) ) ( not ( = ?auto_171257 ?auto_171256 ) ) ( not ( = ?auto_171257 ?auto_171258 ) ) ( not ( = ?auto_171257 ?auto_171255 ) ) ( not ( = ?auto_171257 ?auto_171254 ) ) ( not ( = ?auto_171259 ?auto_171256 ) ) ( not ( = ?auto_171259 ?auto_171258 ) ) ( not ( = ?auto_171259 ?auto_171255 ) ) ( not ( = ?auto_171259 ?auto_171254 ) ) ( not ( = ?auto_171256 ?auto_171258 ) ) ( not ( = ?auto_171256 ?auto_171255 ) ) ( not ( = ?auto_171256 ?auto_171254 ) ) ( not ( = ?auto_171251 ?auto_171257 ) ) ( not ( = ?auto_171251 ?auto_171259 ) ) ( not ( = ?auto_171251 ?auto_171256 ) ) ( not ( = ?auto_171252 ?auto_171257 ) ) ( not ( = ?auto_171252 ?auto_171259 ) ) ( not ( = ?auto_171252 ?auto_171256 ) ) ( not ( = ?auto_171253 ?auto_171257 ) ) ( not ( = ?auto_171253 ?auto_171259 ) ) ( not ( = ?auto_171253 ?auto_171256 ) ) ( CLEAR ?auto_171252 ) ( ON ?auto_171253 ?auto_171254 ) ( CLEAR ?auto_171253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171257 ?auto_171259 ?auto_171256 ?auto_171258 ?auto_171255 ?auto_171254 )
      ( MAKE-5PILE ?auto_171251 ?auto_171252 ?auto_171253 ?auto_171254 ?auto_171255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171260 - BLOCK
      ?auto_171261 - BLOCK
      ?auto_171262 - BLOCK
      ?auto_171263 - BLOCK
      ?auto_171264 - BLOCK
    )
    :vars
    (
      ?auto_171266 - BLOCK
      ?auto_171265 - BLOCK
      ?auto_171267 - BLOCK
      ?auto_171268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171260 ) ( not ( = ?auto_171260 ?auto_171261 ) ) ( not ( = ?auto_171260 ?auto_171262 ) ) ( not ( = ?auto_171260 ?auto_171263 ) ) ( not ( = ?auto_171260 ?auto_171264 ) ) ( not ( = ?auto_171261 ?auto_171262 ) ) ( not ( = ?auto_171261 ?auto_171263 ) ) ( not ( = ?auto_171261 ?auto_171264 ) ) ( not ( = ?auto_171262 ?auto_171263 ) ) ( not ( = ?auto_171262 ?auto_171264 ) ) ( not ( = ?auto_171263 ?auto_171264 ) ) ( ON ?auto_171264 ?auto_171266 ) ( not ( = ?auto_171260 ?auto_171266 ) ) ( not ( = ?auto_171261 ?auto_171266 ) ) ( not ( = ?auto_171262 ?auto_171266 ) ) ( not ( = ?auto_171263 ?auto_171266 ) ) ( not ( = ?auto_171264 ?auto_171266 ) ) ( ON ?auto_171263 ?auto_171264 ) ( ON-TABLE ?auto_171265 ) ( ON ?auto_171267 ?auto_171265 ) ( ON ?auto_171268 ?auto_171267 ) ( ON ?auto_171266 ?auto_171268 ) ( not ( = ?auto_171265 ?auto_171267 ) ) ( not ( = ?auto_171265 ?auto_171268 ) ) ( not ( = ?auto_171265 ?auto_171266 ) ) ( not ( = ?auto_171265 ?auto_171264 ) ) ( not ( = ?auto_171265 ?auto_171263 ) ) ( not ( = ?auto_171267 ?auto_171268 ) ) ( not ( = ?auto_171267 ?auto_171266 ) ) ( not ( = ?auto_171267 ?auto_171264 ) ) ( not ( = ?auto_171267 ?auto_171263 ) ) ( not ( = ?auto_171268 ?auto_171266 ) ) ( not ( = ?auto_171268 ?auto_171264 ) ) ( not ( = ?auto_171268 ?auto_171263 ) ) ( not ( = ?auto_171260 ?auto_171265 ) ) ( not ( = ?auto_171260 ?auto_171267 ) ) ( not ( = ?auto_171260 ?auto_171268 ) ) ( not ( = ?auto_171261 ?auto_171265 ) ) ( not ( = ?auto_171261 ?auto_171267 ) ) ( not ( = ?auto_171261 ?auto_171268 ) ) ( not ( = ?auto_171262 ?auto_171265 ) ) ( not ( = ?auto_171262 ?auto_171267 ) ) ( not ( = ?auto_171262 ?auto_171268 ) ) ( ON ?auto_171262 ?auto_171263 ) ( CLEAR ?auto_171262 ) ( HOLDING ?auto_171261 ) ( CLEAR ?auto_171260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171260 ?auto_171261 )
      ( MAKE-5PILE ?auto_171260 ?auto_171261 ?auto_171262 ?auto_171263 ?auto_171264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171269 - BLOCK
      ?auto_171270 - BLOCK
      ?auto_171271 - BLOCK
      ?auto_171272 - BLOCK
      ?auto_171273 - BLOCK
    )
    :vars
    (
      ?auto_171276 - BLOCK
      ?auto_171275 - BLOCK
      ?auto_171274 - BLOCK
      ?auto_171277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171269 ) ( not ( = ?auto_171269 ?auto_171270 ) ) ( not ( = ?auto_171269 ?auto_171271 ) ) ( not ( = ?auto_171269 ?auto_171272 ) ) ( not ( = ?auto_171269 ?auto_171273 ) ) ( not ( = ?auto_171270 ?auto_171271 ) ) ( not ( = ?auto_171270 ?auto_171272 ) ) ( not ( = ?auto_171270 ?auto_171273 ) ) ( not ( = ?auto_171271 ?auto_171272 ) ) ( not ( = ?auto_171271 ?auto_171273 ) ) ( not ( = ?auto_171272 ?auto_171273 ) ) ( ON ?auto_171273 ?auto_171276 ) ( not ( = ?auto_171269 ?auto_171276 ) ) ( not ( = ?auto_171270 ?auto_171276 ) ) ( not ( = ?auto_171271 ?auto_171276 ) ) ( not ( = ?auto_171272 ?auto_171276 ) ) ( not ( = ?auto_171273 ?auto_171276 ) ) ( ON ?auto_171272 ?auto_171273 ) ( ON-TABLE ?auto_171275 ) ( ON ?auto_171274 ?auto_171275 ) ( ON ?auto_171277 ?auto_171274 ) ( ON ?auto_171276 ?auto_171277 ) ( not ( = ?auto_171275 ?auto_171274 ) ) ( not ( = ?auto_171275 ?auto_171277 ) ) ( not ( = ?auto_171275 ?auto_171276 ) ) ( not ( = ?auto_171275 ?auto_171273 ) ) ( not ( = ?auto_171275 ?auto_171272 ) ) ( not ( = ?auto_171274 ?auto_171277 ) ) ( not ( = ?auto_171274 ?auto_171276 ) ) ( not ( = ?auto_171274 ?auto_171273 ) ) ( not ( = ?auto_171274 ?auto_171272 ) ) ( not ( = ?auto_171277 ?auto_171276 ) ) ( not ( = ?auto_171277 ?auto_171273 ) ) ( not ( = ?auto_171277 ?auto_171272 ) ) ( not ( = ?auto_171269 ?auto_171275 ) ) ( not ( = ?auto_171269 ?auto_171274 ) ) ( not ( = ?auto_171269 ?auto_171277 ) ) ( not ( = ?auto_171270 ?auto_171275 ) ) ( not ( = ?auto_171270 ?auto_171274 ) ) ( not ( = ?auto_171270 ?auto_171277 ) ) ( not ( = ?auto_171271 ?auto_171275 ) ) ( not ( = ?auto_171271 ?auto_171274 ) ) ( not ( = ?auto_171271 ?auto_171277 ) ) ( ON ?auto_171271 ?auto_171272 ) ( CLEAR ?auto_171269 ) ( ON ?auto_171270 ?auto_171271 ) ( CLEAR ?auto_171270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171275 ?auto_171274 ?auto_171277 ?auto_171276 ?auto_171273 ?auto_171272 ?auto_171271 )
      ( MAKE-5PILE ?auto_171269 ?auto_171270 ?auto_171271 ?auto_171272 ?auto_171273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171278 - BLOCK
      ?auto_171279 - BLOCK
      ?auto_171280 - BLOCK
      ?auto_171281 - BLOCK
      ?auto_171282 - BLOCK
    )
    :vars
    (
      ?auto_171283 - BLOCK
      ?auto_171286 - BLOCK
      ?auto_171284 - BLOCK
      ?auto_171285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171278 ?auto_171279 ) ) ( not ( = ?auto_171278 ?auto_171280 ) ) ( not ( = ?auto_171278 ?auto_171281 ) ) ( not ( = ?auto_171278 ?auto_171282 ) ) ( not ( = ?auto_171279 ?auto_171280 ) ) ( not ( = ?auto_171279 ?auto_171281 ) ) ( not ( = ?auto_171279 ?auto_171282 ) ) ( not ( = ?auto_171280 ?auto_171281 ) ) ( not ( = ?auto_171280 ?auto_171282 ) ) ( not ( = ?auto_171281 ?auto_171282 ) ) ( ON ?auto_171282 ?auto_171283 ) ( not ( = ?auto_171278 ?auto_171283 ) ) ( not ( = ?auto_171279 ?auto_171283 ) ) ( not ( = ?auto_171280 ?auto_171283 ) ) ( not ( = ?auto_171281 ?auto_171283 ) ) ( not ( = ?auto_171282 ?auto_171283 ) ) ( ON ?auto_171281 ?auto_171282 ) ( ON-TABLE ?auto_171286 ) ( ON ?auto_171284 ?auto_171286 ) ( ON ?auto_171285 ?auto_171284 ) ( ON ?auto_171283 ?auto_171285 ) ( not ( = ?auto_171286 ?auto_171284 ) ) ( not ( = ?auto_171286 ?auto_171285 ) ) ( not ( = ?auto_171286 ?auto_171283 ) ) ( not ( = ?auto_171286 ?auto_171282 ) ) ( not ( = ?auto_171286 ?auto_171281 ) ) ( not ( = ?auto_171284 ?auto_171285 ) ) ( not ( = ?auto_171284 ?auto_171283 ) ) ( not ( = ?auto_171284 ?auto_171282 ) ) ( not ( = ?auto_171284 ?auto_171281 ) ) ( not ( = ?auto_171285 ?auto_171283 ) ) ( not ( = ?auto_171285 ?auto_171282 ) ) ( not ( = ?auto_171285 ?auto_171281 ) ) ( not ( = ?auto_171278 ?auto_171286 ) ) ( not ( = ?auto_171278 ?auto_171284 ) ) ( not ( = ?auto_171278 ?auto_171285 ) ) ( not ( = ?auto_171279 ?auto_171286 ) ) ( not ( = ?auto_171279 ?auto_171284 ) ) ( not ( = ?auto_171279 ?auto_171285 ) ) ( not ( = ?auto_171280 ?auto_171286 ) ) ( not ( = ?auto_171280 ?auto_171284 ) ) ( not ( = ?auto_171280 ?auto_171285 ) ) ( ON ?auto_171280 ?auto_171281 ) ( ON ?auto_171279 ?auto_171280 ) ( CLEAR ?auto_171279 ) ( HOLDING ?auto_171278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171278 )
      ( MAKE-5PILE ?auto_171278 ?auto_171279 ?auto_171280 ?auto_171281 ?auto_171282 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171287 - BLOCK
      ?auto_171288 - BLOCK
      ?auto_171289 - BLOCK
      ?auto_171290 - BLOCK
      ?auto_171291 - BLOCK
    )
    :vars
    (
      ?auto_171294 - BLOCK
      ?auto_171293 - BLOCK
      ?auto_171292 - BLOCK
      ?auto_171295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171287 ?auto_171288 ) ) ( not ( = ?auto_171287 ?auto_171289 ) ) ( not ( = ?auto_171287 ?auto_171290 ) ) ( not ( = ?auto_171287 ?auto_171291 ) ) ( not ( = ?auto_171288 ?auto_171289 ) ) ( not ( = ?auto_171288 ?auto_171290 ) ) ( not ( = ?auto_171288 ?auto_171291 ) ) ( not ( = ?auto_171289 ?auto_171290 ) ) ( not ( = ?auto_171289 ?auto_171291 ) ) ( not ( = ?auto_171290 ?auto_171291 ) ) ( ON ?auto_171291 ?auto_171294 ) ( not ( = ?auto_171287 ?auto_171294 ) ) ( not ( = ?auto_171288 ?auto_171294 ) ) ( not ( = ?auto_171289 ?auto_171294 ) ) ( not ( = ?auto_171290 ?auto_171294 ) ) ( not ( = ?auto_171291 ?auto_171294 ) ) ( ON ?auto_171290 ?auto_171291 ) ( ON-TABLE ?auto_171293 ) ( ON ?auto_171292 ?auto_171293 ) ( ON ?auto_171295 ?auto_171292 ) ( ON ?auto_171294 ?auto_171295 ) ( not ( = ?auto_171293 ?auto_171292 ) ) ( not ( = ?auto_171293 ?auto_171295 ) ) ( not ( = ?auto_171293 ?auto_171294 ) ) ( not ( = ?auto_171293 ?auto_171291 ) ) ( not ( = ?auto_171293 ?auto_171290 ) ) ( not ( = ?auto_171292 ?auto_171295 ) ) ( not ( = ?auto_171292 ?auto_171294 ) ) ( not ( = ?auto_171292 ?auto_171291 ) ) ( not ( = ?auto_171292 ?auto_171290 ) ) ( not ( = ?auto_171295 ?auto_171294 ) ) ( not ( = ?auto_171295 ?auto_171291 ) ) ( not ( = ?auto_171295 ?auto_171290 ) ) ( not ( = ?auto_171287 ?auto_171293 ) ) ( not ( = ?auto_171287 ?auto_171292 ) ) ( not ( = ?auto_171287 ?auto_171295 ) ) ( not ( = ?auto_171288 ?auto_171293 ) ) ( not ( = ?auto_171288 ?auto_171292 ) ) ( not ( = ?auto_171288 ?auto_171295 ) ) ( not ( = ?auto_171289 ?auto_171293 ) ) ( not ( = ?auto_171289 ?auto_171292 ) ) ( not ( = ?auto_171289 ?auto_171295 ) ) ( ON ?auto_171289 ?auto_171290 ) ( ON ?auto_171288 ?auto_171289 ) ( ON ?auto_171287 ?auto_171288 ) ( CLEAR ?auto_171287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171293 ?auto_171292 ?auto_171295 ?auto_171294 ?auto_171291 ?auto_171290 ?auto_171289 ?auto_171288 )
      ( MAKE-5PILE ?auto_171287 ?auto_171288 ?auto_171289 ?auto_171290 ?auto_171291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171299 - BLOCK
      ?auto_171300 - BLOCK
      ?auto_171301 - BLOCK
    )
    :vars
    (
      ?auto_171302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171302 ?auto_171301 ) ( CLEAR ?auto_171302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171299 ) ( ON ?auto_171300 ?auto_171299 ) ( ON ?auto_171301 ?auto_171300 ) ( not ( = ?auto_171299 ?auto_171300 ) ) ( not ( = ?auto_171299 ?auto_171301 ) ) ( not ( = ?auto_171299 ?auto_171302 ) ) ( not ( = ?auto_171300 ?auto_171301 ) ) ( not ( = ?auto_171300 ?auto_171302 ) ) ( not ( = ?auto_171301 ?auto_171302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171302 ?auto_171301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171303 - BLOCK
      ?auto_171304 - BLOCK
      ?auto_171305 - BLOCK
    )
    :vars
    (
      ?auto_171306 - BLOCK
      ?auto_171307 - BLOCK
      ?auto_171308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171306 ?auto_171305 ) ( CLEAR ?auto_171306 ) ( ON-TABLE ?auto_171303 ) ( ON ?auto_171304 ?auto_171303 ) ( ON ?auto_171305 ?auto_171304 ) ( not ( = ?auto_171303 ?auto_171304 ) ) ( not ( = ?auto_171303 ?auto_171305 ) ) ( not ( = ?auto_171303 ?auto_171306 ) ) ( not ( = ?auto_171304 ?auto_171305 ) ) ( not ( = ?auto_171304 ?auto_171306 ) ) ( not ( = ?auto_171305 ?auto_171306 ) ) ( HOLDING ?auto_171307 ) ( CLEAR ?auto_171308 ) ( not ( = ?auto_171303 ?auto_171307 ) ) ( not ( = ?auto_171303 ?auto_171308 ) ) ( not ( = ?auto_171304 ?auto_171307 ) ) ( not ( = ?auto_171304 ?auto_171308 ) ) ( not ( = ?auto_171305 ?auto_171307 ) ) ( not ( = ?auto_171305 ?auto_171308 ) ) ( not ( = ?auto_171306 ?auto_171307 ) ) ( not ( = ?auto_171306 ?auto_171308 ) ) ( not ( = ?auto_171307 ?auto_171308 ) ) )
    :subtasks
    ( ( !STACK ?auto_171307 ?auto_171308 )
      ( MAKE-3PILE ?auto_171303 ?auto_171304 ?auto_171305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171309 - BLOCK
      ?auto_171310 - BLOCK
      ?auto_171311 - BLOCK
    )
    :vars
    (
      ?auto_171313 - BLOCK
      ?auto_171314 - BLOCK
      ?auto_171312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171313 ?auto_171311 ) ( ON-TABLE ?auto_171309 ) ( ON ?auto_171310 ?auto_171309 ) ( ON ?auto_171311 ?auto_171310 ) ( not ( = ?auto_171309 ?auto_171310 ) ) ( not ( = ?auto_171309 ?auto_171311 ) ) ( not ( = ?auto_171309 ?auto_171313 ) ) ( not ( = ?auto_171310 ?auto_171311 ) ) ( not ( = ?auto_171310 ?auto_171313 ) ) ( not ( = ?auto_171311 ?auto_171313 ) ) ( CLEAR ?auto_171314 ) ( not ( = ?auto_171309 ?auto_171312 ) ) ( not ( = ?auto_171309 ?auto_171314 ) ) ( not ( = ?auto_171310 ?auto_171312 ) ) ( not ( = ?auto_171310 ?auto_171314 ) ) ( not ( = ?auto_171311 ?auto_171312 ) ) ( not ( = ?auto_171311 ?auto_171314 ) ) ( not ( = ?auto_171313 ?auto_171312 ) ) ( not ( = ?auto_171313 ?auto_171314 ) ) ( not ( = ?auto_171312 ?auto_171314 ) ) ( ON ?auto_171312 ?auto_171313 ) ( CLEAR ?auto_171312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171309 ?auto_171310 ?auto_171311 ?auto_171313 )
      ( MAKE-3PILE ?auto_171309 ?auto_171310 ?auto_171311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171315 - BLOCK
      ?auto_171316 - BLOCK
      ?auto_171317 - BLOCK
    )
    :vars
    (
      ?auto_171318 - BLOCK
      ?auto_171319 - BLOCK
      ?auto_171320 - BLOCK
      ?auto_171322 - BLOCK
      ?auto_171323 - BLOCK
      ?auto_171321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171318 ?auto_171317 ) ( ON-TABLE ?auto_171315 ) ( ON ?auto_171316 ?auto_171315 ) ( ON ?auto_171317 ?auto_171316 ) ( not ( = ?auto_171315 ?auto_171316 ) ) ( not ( = ?auto_171315 ?auto_171317 ) ) ( not ( = ?auto_171315 ?auto_171318 ) ) ( not ( = ?auto_171316 ?auto_171317 ) ) ( not ( = ?auto_171316 ?auto_171318 ) ) ( not ( = ?auto_171317 ?auto_171318 ) ) ( not ( = ?auto_171315 ?auto_171319 ) ) ( not ( = ?auto_171315 ?auto_171320 ) ) ( not ( = ?auto_171316 ?auto_171319 ) ) ( not ( = ?auto_171316 ?auto_171320 ) ) ( not ( = ?auto_171317 ?auto_171319 ) ) ( not ( = ?auto_171317 ?auto_171320 ) ) ( not ( = ?auto_171318 ?auto_171319 ) ) ( not ( = ?auto_171318 ?auto_171320 ) ) ( not ( = ?auto_171319 ?auto_171320 ) ) ( ON ?auto_171319 ?auto_171318 ) ( CLEAR ?auto_171319 ) ( HOLDING ?auto_171320 ) ( CLEAR ?auto_171322 ) ( ON-TABLE ?auto_171323 ) ( ON ?auto_171321 ?auto_171323 ) ( ON ?auto_171322 ?auto_171321 ) ( not ( = ?auto_171323 ?auto_171321 ) ) ( not ( = ?auto_171323 ?auto_171322 ) ) ( not ( = ?auto_171323 ?auto_171320 ) ) ( not ( = ?auto_171321 ?auto_171322 ) ) ( not ( = ?auto_171321 ?auto_171320 ) ) ( not ( = ?auto_171322 ?auto_171320 ) ) ( not ( = ?auto_171315 ?auto_171322 ) ) ( not ( = ?auto_171315 ?auto_171323 ) ) ( not ( = ?auto_171315 ?auto_171321 ) ) ( not ( = ?auto_171316 ?auto_171322 ) ) ( not ( = ?auto_171316 ?auto_171323 ) ) ( not ( = ?auto_171316 ?auto_171321 ) ) ( not ( = ?auto_171317 ?auto_171322 ) ) ( not ( = ?auto_171317 ?auto_171323 ) ) ( not ( = ?auto_171317 ?auto_171321 ) ) ( not ( = ?auto_171318 ?auto_171322 ) ) ( not ( = ?auto_171318 ?auto_171323 ) ) ( not ( = ?auto_171318 ?auto_171321 ) ) ( not ( = ?auto_171319 ?auto_171322 ) ) ( not ( = ?auto_171319 ?auto_171323 ) ) ( not ( = ?auto_171319 ?auto_171321 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171323 ?auto_171321 ?auto_171322 ?auto_171320 )
      ( MAKE-3PILE ?auto_171315 ?auto_171316 ?auto_171317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171324 - BLOCK
      ?auto_171325 - BLOCK
      ?auto_171326 - BLOCK
    )
    :vars
    (
      ?auto_171331 - BLOCK
      ?auto_171329 - BLOCK
      ?auto_171327 - BLOCK
      ?auto_171330 - BLOCK
      ?auto_171328 - BLOCK
      ?auto_171332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171331 ?auto_171326 ) ( ON-TABLE ?auto_171324 ) ( ON ?auto_171325 ?auto_171324 ) ( ON ?auto_171326 ?auto_171325 ) ( not ( = ?auto_171324 ?auto_171325 ) ) ( not ( = ?auto_171324 ?auto_171326 ) ) ( not ( = ?auto_171324 ?auto_171331 ) ) ( not ( = ?auto_171325 ?auto_171326 ) ) ( not ( = ?auto_171325 ?auto_171331 ) ) ( not ( = ?auto_171326 ?auto_171331 ) ) ( not ( = ?auto_171324 ?auto_171329 ) ) ( not ( = ?auto_171324 ?auto_171327 ) ) ( not ( = ?auto_171325 ?auto_171329 ) ) ( not ( = ?auto_171325 ?auto_171327 ) ) ( not ( = ?auto_171326 ?auto_171329 ) ) ( not ( = ?auto_171326 ?auto_171327 ) ) ( not ( = ?auto_171331 ?auto_171329 ) ) ( not ( = ?auto_171331 ?auto_171327 ) ) ( not ( = ?auto_171329 ?auto_171327 ) ) ( ON ?auto_171329 ?auto_171331 ) ( CLEAR ?auto_171330 ) ( ON-TABLE ?auto_171328 ) ( ON ?auto_171332 ?auto_171328 ) ( ON ?auto_171330 ?auto_171332 ) ( not ( = ?auto_171328 ?auto_171332 ) ) ( not ( = ?auto_171328 ?auto_171330 ) ) ( not ( = ?auto_171328 ?auto_171327 ) ) ( not ( = ?auto_171332 ?auto_171330 ) ) ( not ( = ?auto_171332 ?auto_171327 ) ) ( not ( = ?auto_171330 ?auto_171327 ) ) ( not ( = ?auto_171324 ?auto_171330 ) ) ( not ( = ?auto_171324 ?auto_171328 ) ) ( not ( = ?auto_171324 ?auto_171332 ) ) ( not ( = ?auto_171325 ?auto_171330 ) ) ( not ( = ?auto_171325 ?auto_171328 ) ) ( not ( = ?auto_171325 ?auto_171332 ) ) ( not ( = ?auto_171326 ?auto_171330 ) ) ( not ( = ?auto_171326 ?auto_171328 ) ) ( not ( = ?auto_171326 ?auto_171332 ) ) ( not ( = ?auto_171331 ?auto_171330 ) ) ( not ( = ?auto_171331 ?auto_171328 ) ) ( not ( = ?auto_171331 ?auto_171332 ) ) ( not ( = ?auto_171329 ?auto_171330 ) ) ( not ( = ?auto_171329 ?auto_171328 ) ) ( not ( = ?auto_171329 ?auto_171332 ) ) ( ON ?auto_171327 ?auto_171329 ) ( CLEAR ?auto_171327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171324 ?auto_171325 ?auto_171326 ?auto_171331 ?auto_171329 )
      ( MAKE-3PILE ?auto_171324 ?auto_171325 ?auto_171326 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171333 - BLOCK
      ?auto_171334 - BLOCK
      ?auto_171335 - BLOCK
    )
    :vars
    (
      ?auto_171339 - BLOCK
      ?auto_171341 - BLOCK
      ?auto_171336 - BLOCK
      ?auto_171337 - BLOCK
      ?auto_171340 - BLOCK
      ?auto_171338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171339 ?auto_171335 ) ( ON-TABLE ?auto_171333 ) ( ON ?auto_171334 ?auto_171333 ) ( ON ?auto_171335 ?auto_171334 ) ( not ( = ?auto_171333 ?auto_171334 ) ) ( not ( = ?auto_171333 ?auto_171335 ) ) ( not ( = ?auto_171333 ?auto_171339 ) ) ( not ( = ?auto_171334 ?auto_171335 ) ) ( not ( = ?auto_171334 ?auto_171339 ) ) ( not ( = ?auto_171335 ?auto_171339 ) ) ( not ( = ?auto_171333 ?auto_171341 ) ) ( not ( = ?auto_171333 ?auto_171336 ) ) ( not ( = ?auto_171334 ?auto_171341 ) ) ( not ( = ?auto_171334 ?auto_171336 ) ) ( not ( = ?auto_171335 ?auto_171341 ) ) ( not ( = ?auto_171335 ?auto_171336 ) ) ( not ( = ?auto_171339 ?auto_171341 ) ) ( not ( = ?auto_171339 ?auto_171336 ) ) ( not ( = ?auto_171341 ?auto_171336 ) ) ( ON ?auto_171341 ?auto_171339 ) ( ON-TABLE ?auto_171337 ) ( ON ?auto_171340 ?auto_171337 ) ( not ( = ?auto_171337 ?auto_171340 ) ) ( not ( = ?auto_171337 ?auto_171338 ) ) ( not ( = ?auto_171337 ?auto_171336 ) ) ( not ( = ?auto_171340 ?auto_171338 ) ) ( not ( = ?auto_171340 ?auto_171336 ) ) ( not ( = ?auto_171338 ?auto_171336 ) ) ( not ( = ?auto_171333 ?auto_171338 ) ) ( not ( = ?auto_171333 ?auto_171337 ) ) ( not ( = ?auto_171333 ?auto_171340 ) ) ( not ( = ?auto_171334 ?auto_171338 ) ) ( not ( = ?auto_171334 ?auto_171337 ) ) ( not ( = ?auto_171334 ?auto_171340 ) ) ( not ( = ?auto_171335 ?auto_171338 ) ) ( not ( = ?auto_171335 ?auto_171337 ) ) ( not ( = ?auto_171335 ?auto_171340 ) ) ( not ( = ?auto_171339 ?auto_171338 ) ) ( not ( = ?auto_171339 ?auto_171337 ) ) ( not ( = ?auto_171339 ?auto_171340 ) ) ( not ( = ?auto_171341 ?auto_171338 ) ) ( not ( = ?auto_171341 ?auto_171337 ) ) ( not ( = ?auto_171341 ?auto_171340 ) ) ( ON ?auto_171336 ?auto_171341 ) ( CLEAR ?auto_171336 ) ( HOLDING ?auto_171338 ) ( CLEAR ?auto_171340 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171337 ?auto_171340 ?auto_171338 )
      ( MAKE-3PILE ?auto_171333 ?auto_171334 ?auto_171335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171342 - BLOCK
      ?auto_171343 - BLOCK
      ?auto_171344 - BLOCK
    )
    :vars
    (
      ?auto_171347 - BLOCK
      ?auto_171348 - BLOCK
      ?auto_171350 - BLOCK
      ?auto_171349 - BLOCK
      ?auto_171346 - BLOCK
      ?auto_171345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171347 ?auto_171344 ) ( ON-TABLE ?auto_171342 ) ( ON ?auto_171343 ?auto_171342 ) ( ON ?auto_171344 ?auto_171343 ) ( not ( = ?auto_171342 ?auto_171343 ) ) ( not ( = ?auto_171342 ?auto_171344 ) ) ( not ( = ?auto_171342 ?auto_171347 ) ) ( not ( = ?auto_171343 ?auto_171344 ) ) ( not ( = ?auto_171343 ?auto_171347 ) ) ( not ( = ?auto_171344 ?auto_171347 ) ) ( not ( = ?auto_171342 ?auto_171348 ) ) ( not ( = ?auto_171342 ?auto_171350 ) ) ( not ( = ?auto_171343 ?auto_171348 ) ) ( not ( = ?auto_171343 ?auto_171350 ) ) ( not ( = ?auto_171344 ?auto_171348 ) ) ( not ( = ?auto_171344 ?auto_171350 ) ) ( not ( = ?auto_171347 ?auto_171348 ) ) ( not ( = ?auto_171347 ?auto_171350 ) ) ( not ( = ?auto_171348 ?auto_171350 ) ) ( ON ?auto_171348 ?auto_171347 ) ( ON-TABLE ?auto_171349 ) ( ON ?auto_171346 ?auto_171349 ) ( not ( = ?auto_171349 ?auto_171346 ) ) ( not ( = ?auto_171349 ?auto_171345 ) ) ( not ( = ?auto_171349 ?auto_171350 ) ) ( not ( = ?auto_171346 ?auto_171345 ) ) ( not ( = ?auto_171346 ?auto_171350 ) ) ( not ( = ?auto_171345 ?auto_171350 ) ) ( not ( = ?auto_171342 ?auto_171345 ) ) ( not ( = ?auto_171342 ?auto_171349 ) ) ( not ( = ?auto_171342 ?auto_171346 ) ) ( not ( = ?auto_171343 ?auto_171345 ) ) ( not ( = ?auto_171343 ?auto_171349 ) ) ( not ( = ?auto_171343 ?auto_171346 ) ) ( not ( = ?auto_171344 ?auto_171345 ) ) ( not ( = ?auto_171344 ?auto_171349 ) ) ( not ( = ?auto_171344 ?auto_171346 ) ) ( not ( = ?auto_171347 ?auto_171345 ) ) ( not ( = ?auto_171347 ?auto_171349 ) ) ( not ( = ?auto_171347 ?auto_171346 ) ) ( not ( = ?auto_171348 ?auto_171345 ) ) ( not ( = ?auto_171348 ?auto_171349 ) ) ( not ( = ?auto_171348 ?auto_171346 ) ) ( ON ?auto_171350 ?auto_171348 ) ( CLEAR ?auto_171346 ) ( ON ?auto_171345 ?auto_171350 ) ( CLEAR ?auto_171345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171342 ?auto_171343 ?auto_171344 ?auto_171347 ?auto_171348 ?auto_171350 )
      ( MAKE-3PILE ?auto_171342 ?auto_171343 ?auto_171344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171351 - BLOCK
      ?auto_171352 - BLOCK
      ?auto_171353 - BLOCK
    )
    :vars
    (
      ?auto_171358 - BLOCK
      ?auto_171359 - BLOCK
      ?auto_171354 - BLOCK
      ?auto_171356 - BLOCK
      ?auto_171355 - BLOCK
      ?auto_171357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171358 ?auto_171353 ) ( ON-TABLE ?auto_171351 ) ( ON ?auto_171352 ?auto_171351 ) ( ON ?auto_171353 ?auto_171352 ) ( not ( = ?auto_171351 ?auto_171352 ) ) ( not ( = ?auto_171351 ?auto_171353 ) ) ( not ( = ?auto_171351 ?auto_171358 ) ) ( not ( = ?auto_171352 ?auto_171353 ) ) ( not ( = ?auto_171352 ?auto_171358 ) ) ( not ( = ?auto_171353 ?auto_171358 ) ) ( not ( = ?auto_171351 ?auto_171359 ) ) ( not ( = ?auto_171351 ?auto_171354 ) ) ( not ( = ?auto_171352 ?auto_171359 ) ) ( not ( = ?auto_171352 ?auto_171354 ) ) ( not ( = ?auto_171353 ?auto_171359 ) ) ( not ( = ?auto_171353 ?auto_171354 ) ) ( not ( = ?auto_171358 ?auto_171359 ) ) ( not ( = ?auto_171358 ?auto_171354 ) ) ( not ( = ?auto_171359 ?auto_171354 ) ) ( ON ?auto_171359 ?auto_171358 ) ( ON-TABLE ?auto_171356 ) ( not ( = ?auto_171356 ?auto_171355 ) ) ( not ( = ?auto_171356 ?auto_171357 ) ) ( not ( = ?auto_171356 ?auto_171354 ) ) ( not ( = ?auto_171355 ?auto_171357 ) ) ( not ( = ?auto_171355 ?auto_171354 ) ) ( not ( = ?auto_171357 ?auto_171354 ) ) ( not ( = ?auto_171351 ?auto_171357 ) ) ( not ( = ?auto_171351 ?auto_171356 ) ) ( not ( = ?auto_171351 ?auto_171355 ) ) ( not ( = ?auto_171352 ?auto_171357 ) ) ( not ( = ?auto_171352 ?auto_171356 ) ) ( not ( = ?auto_171352 ?auto_171355 ) ) ( not ( = ?auto_171353 ?auto_171357 ) ) ( not ( = ?auto_171353 ?auto_171356 ) ) ( not ( = ?auto_171353 ?auto_171355 ) ) ( not ( = ?auto_171358 ?auto_171357 ) ) ( not ( = ?auto_171358 ?auto_171356 ) ) ( not ( = ?auto_171358 ?auto_171355 ) ) ( not ( = ?auto_171359 ?auto_171357 ) ) ( not ( = ?auto_171359 ?auto_171356 ) ) ( not ( = ?auto_171359 ?auto_171355 ) ) ( ON ?auto_171354 ?auto_171359 ) ( ON ?auto_171357 ?auto_171354 ) ( CLEAR ?auto_171357 ) ( HOLDING ?auto_171355 ) ( CLEAR ?auto_171356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171356 ?auto_171355 )
      ( MAKE-3PILE ?auto_171351 ?auto_171352 ?auto_171353 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171360 - BLOCK
      ?auto_171361 - BLOCK
      ?auto_171362 - BLOCK
    )
    :vars
    (
      ?auto_171366 - BLOCK
      ?auto_171368 - BLOCK
      ?auto_171364 - BLOCK
      ?auto_171367 - BLOCK
      ?auto_171363 - BLOCK
      ?auto_171365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171366 ?auto_171362 ) ( ON-TABLE ?auto_171360 ) ( ON ?auto_171361 ?auto_171360 ) ( ON ?auto_171362 ?auto_171361 ) ( not ( = ?auto_171360 ?auto_171361 ) ) ( not ( = ?auto_171360 ?auto_171362 ) ) ( not ( = ?auto_171360 ?auto_171366 ) ) ( not ( = ?auto_171361 ?auto_171362 ) ) ( not ( = ?auto_171361 ?auto_171366 ) ) ( not ( = ?auto_171362 ?auto_171366 ) ) ( not ( = ?auto_171360 ?auto_171368 ) ) ( not ( = ?auto_171360 ?auto_171364 ) ) ( not ( = ?auto_171361 ?auto_171368 ) ) ( not ( = ?auto_171361 ?auto_171364 ) ) ( not ( = ?auto_171362 ?auto_171368 ) ) ( not ( = ?auto_171362 ?auto_171364 ) ) ( not ( = ?auto_171366 ?auto_171368 ) ) ( not ( = ?auto_171366 ?auto_171364 ) ) ( not ( = ?auto_171368 ?auto_171364 ) ) ( ON ?auto_171368 ?auto_171366 ) ( ON-TABLE ?auto_171367 ) ( not ( = ?auto_171367 ?auto_171363 ) ) ( not ( = ?auto_171367 ?auto_171365 ) ) ( not ( = ?auto_171367 ?auto_171364 ) ) ( not ( = ?auto_171363 ?auto_171365 ) ) ( not ( = ?auto_171363 ?auto_171364 ) ) ( not ( = ?auto_171365 ?auto_171364 ) ) ( not ( = ?auto_171360 ?auto_171365 ) ) ( not ( = ?auto_171360 ?auto_171367 ) ) ( not ( = ?auto_171360 ?auto_171363 ) ) ( not ( = ?auto_171361 ?auto_171365 ) ) ( not ( = ?auto_171361 ?auto_171367 ) ) ( not ( = ?auto_171361 ?auto_171363 ) ) ( not ( = ?auto_171362 ?auto_171365 ) ) ( not ( = ?auto_171362 ?auto_171367 ) ) ( not ( = ?auto_171362 ?auto_171363 ) ) ( not ( = ?auto_171366 ?auto_171365 ) ) ( not ( = ?auto_171366 ?auto_171367 ) ) ( not ( = ?auto_171366 ?auto_171363 ) ) ( not ( = ?auto_171368 ?auto_171365 ) ) ( not ( = ?auto_171368 ?auto_171367 ) ) ( not ( = ?auto_171368 ?auto_171363 ) ) ( ON ?auto_171364 ?auto_171368 ) ( ON ?auto_171365 ?auto_171364 ) ( CLEAR ?auto_171367 ) ( ON ?auto_171363 ?auto_171365 ) ( CLEAR ?auto_171363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171360 ?auto_171361 ?auto_171362 ?auto_171366 ?auto_171368 ?auto_171364 ?auto_171365 )
      ( MAKE-3PILE ?auto_171360 ?auto_171361 ?auto_171362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171369 - BLOCK
      ?auto_171370 - BLOCK
      ?auto_171371 - BLOCK
    )
    :vars
    (
      ?auto_171373 - BLOCK
      ?auto_171376 - BLOCK
      ?auto_171372 - BLOCK
      ?auto_171375 - BLOCK
      ?auto_171377 - BLOCK
      ?auto_171374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171373 ?auto_171371 ) ( ON-TABLE ?auto_171369 ) ( ON ?auto_171370 ?auto_171369 ) ( ON ?auto_171371 ?auto_171370 ) ( not ( = ?auto_171369 ?auto_171370 ) ) ( not ( = ?auto_171369 ?auto_171371 ) ) ( not ( = ?auto_171369 ?auto_171373 ) ) ( not ( = ?auto_171370 ?auto_171371 ) ) ( not ( = ?auto_171370 ?auto_171373 ) ) ( not ( = ?auto_171371 ?auto_171373 ) ) ( not ( = ?auto_171369 ?auto_171376 ) ) ( not ( = ?auto_171369 ?auto_171372 ) ) ( not ( = ?auto_171370 ?auto_171376 ) ) ( not ( = ?auto_171370 ?auto_171372 ) ) ( not ( = ?auto_171371 ?auto_171376 ) ) ( not ( = ?auto_171371 ?auto_171372 ) ) ( not ( = ?auto_171373 ?auto_171376 ) ) ( not ( = ?auto_171373 ?auto_171372 ) ) ( not ( = ?auto_171376 ?auto_171372 ) ) ( ON ?auto_171376 ?auto_171373 ) ( not ( = ?auto_171375 ?auto_171377 ) ) ( not ( = ?auto_171375 ?auto_171374 ) ) ( not ( = ?auto_171375 ?auto_171372 ) ) ( not ( = ?auto_171377 ?auto_171374 ) ) ( not ( = ?auto_171377 ?auto_171372 ) ) ( not ( = ?auto_171374 ?auto_171372 ) ) ( not ( = ?auto_171369 ?auto_171374 ) ) ( not ( = ?auto_171369 ?auto_171375 ) ) ( not ( = ?auto_171369 ?auto_171377 ) ) ( not ( = ?auto_171370 ?auto_171374 ) ) ( not ( = ?auto_171370 ?auto_171375 ) ) ( not ( = ?auto_171370 ?auto_171377 ) ) ( not ( = ?auto_171371 ?auto_171374 ) ) ( not ( = ?auto_171371 ?auto_171375 ) ) ( not ( = ?auto_171371 ?auto_171377 ) ) ( not ( = ?auto_171373 ?auto_171374 ) ) ( not ( = ?auto_171373 ?auto_171375 ) ) ( not ( = ?auto_171373 ?auto_171377 ) ) ( not ( = ?auto_171376 ?auto_171374 ) ) ( not ( = ?auto_171376 ?auto_171375 ) ) ( not ( = ?auto_171376 ?auto_171377 ) ) ( ON ?auto_171372 ?auto_171376 ) ( ON ?auto_171374 ?auto_171372 ) ( ON ?auto_171377 ?auto_171374 ) ( CLEAR ?auto_171377 ) ( HOLDING ?auto_171375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171375 )
      ( MAKE-3PILE ?auto_171369 ?auto_171370 ?auto_171371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171378 - BLOCK
      ?auto_171379 - BLOCK
      ?auto_171380 - BLOCK
    )
    :vars
    (
      ?auto_171384 - BLOCK
      ?auto_171385 - BLOCK
      ?auto_171382 - BLOCK
      ?auto_171383 - BLOCK
      ?auto_171386 - BLOCK
      ?auto_171381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171384 ?auto_171380 ) ( ON-TABLE ?auto_171378 ) ( ON ?auto_171379 ?auto_171378 ) ( ON ?auto_171380 ?auto_171379 ) ( not ( = ?auto_171378 ?auto_171379 ) ) ( not ( = ?auto_171378 ?auto_171380 ) ) ( not ( = ?auto_171378 ?auto_171384 ) ) ( not ( = ?auto_171379 ?auto_171380 ) ) ( not ( = ?auto_171379 ?auto_171384 ) ) ( not ( = ?auto_171380 ?auto_171384 ) ) ( not ( = ?auto_171378 ?auto_171385 ) ) ( not ( = ?auto_171378 ?auto_171382 ) ) ( not ( = ?auto_171379 ?auto_171385 ) ) ( not ( = ?auto_171379 ?auto_171382 ) ) ( not ( = ?auto_171380 ?auto_171385 ) ) ( not ( = ?auto_171380 ?auto_171382 ) ) ( not ( = ?auto_171384 ?auto_171385 ) ) ( not ( = ?auto_171384 ?auto_171382 ) ) ( not ( = ?auto_171385 ?auto_171382 ) ) ( ON ?auto_171385 ?auto_171384 ) ( not ( = ?auto_171383 ?auto_171386 ) ) ( not ( = ?auto_171383 ?auto_171381 ) ) ( not ( = ?auto_171383 ?auto_171382 ) ) ( not ( = ?auto_171386 ?auto_171381 ) ) ( not ( = ?auto_171386 ?auto_171382 ) ) ( not ( = ?auto_171381 ?auto_171382 ) ) ( not ( = ?auto_171378 ?auto_171381 ) ) ( not ( = ?auto_171378 ?auto_171383 ) ) ( not ( = ?auto_171378 ?auto_171386 ) ) ( not ( = ?auto_171379 ?auto_171381 ) ) ( not ( = ?auto_171379 ?auto_171383 ) ) ( not ( = ?auto_171379 ?auto_171386 ) ) ( not ( = ?auto_171380 ?auto_171381 ) ) ( not ( = ?auto_171380 ?auto_171383 ) ) ( not ( = ?auto_171380 ?auto_171386 ) ) ( not ( = ?auto_171384 ?auto_171381 ) ) ( not ( = ?auto_171384 ?auto_171383 ) ) ( not ( = ?auto_171384 ?auto_171386 ) ) ( not ( = ?auto_171385 ?auto_171381 ) ) ( not ( = ?auto_171385 ?auto_171383 ) ) ( not ( = ?auto_171385 ?auto_171386 ) ) ( ON ?auto_171382 ?auto_171385 ) ( ON ?auto_171381 ?auto_171382 ) ( ON ?auto_171386 ?auto_171381 ) ( ON ?auto_171383 ?auto_171386 ) ( CLEAR ?auto_171383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171378 ?auto_171379 ?auto_171380 ?auto_171384 ?auto_171385 ?auto_171382 ?auto_171381 ?auto_171386 )
      ( MAKE-3PILE ?auto_171378 ?auto_171379 ?auto_171380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171393 - BLOCK
      ?auto_171394 - BLOCK
      ?auto_171395 - BLOCK
      ?auto_171396 - BLOCK
      ?auto_171397 - BLOCK
      ?auto_171398 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_171398 ) ( CLEAR ?auto_171397 ) ( ON-TABLE ?auto_171393 ) ( ON ?auto_171394 ?auto_171393 ) ( ON ?auto_171395 ?auto_171394 ) ( ON ?auto_171396 ?auto_171395 ) ( ON ?auto_171397 ?auto_171396 ) ( not ( = ?auto_171393 ?auto_171394 ) ) ( not ( = ?auto_171393 ?auto_171395 ) ) ( not ( = ?auto_171393 ?auto_171396 ) ) ( not ( = ?auto_171393 ?auto_171397 ) ) ( not ( = ?auto_171393 ?auto_171398 ) ) ( not ( = ?auto_171394 ?auto_171395 ) ) ( not ( = ?auto_171394 ?auto_171396 ) ) ( not ( = ?auto_171394 ?auto_171397 ) ) ( not ( = ?auto_171394 ?auto_171398 ) ) ( not ( = ?auto_171395 ?auto_171396 ) ) ( not ( = ?auto_171395 ?auto_171397 ) ) ( not ( = ?auto_171395 ?auto_171398 ) ) ( not ( = ?auto_171396 ?auto_171397 ) ) ( not ( = ?auto_171396 ?auto_171398 ) ) ( not ( = ?auto_171397 ?auto_171398 ) ) )
    :subtasks
    ( ( !STACK ?auto_171398 ?auto_171397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171399 - BLOCK
      ?auto_171400 - BLOCK
      ?auto_171401 - BLOCK
      ?auto_171402 - BLOCK
      ?auto_171403 - BLOCK
      ?auto_171404 - BLOCK
    )
    :vars
    (
      ?auto_171405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171403 ) ( ON-TABLE ?auto_171399 ) ( ON ?auto_171400 ?auto_171399 ) ( ON ?auto_171401 ?auto_171400 ) ( ON ?auto_171402 ?auto_171401 ) ( ON ?auto_171403 ?auto_171402 ) ( not ( = ?auto_171399 ?auto_171400 ) ) ( not ( = ?auto_171399 ?auto_171401 ) ) ( not ( = ?auto_171399 ?auto_171402 ) ) ( not ( = ?auto_171399 ?auto_171403 ) ) ( not ( = ?auto_171399 ?auto_171404 ) ) ( not ( = ?auto_171400 ?auto_171401 ) ) ( not ( = ?auto_171400 ?auto_171402 ) ) ( not ( = ?auto_171400 ?auto_171403 ) ) ( not ( = ?auto_171400 ?auto_171404 ) ) ( not ( = ?auto_171401 ?auto_171402 ) ) ( not ( = ?auto_171401 ?auto_171403 ) ) ( not ( = ?auto_171401 ?auto_171404 ) ) ( not ( = ?auto_171402 ?auto_171403 ) ) ( not ( = ?auto_171402 ?auto_171404 ) ) ( not ( = ?auto_171403 ?auto_171404 ) ) ( ON ?auto_171404 ?auto_171405 ) ( CLEAR ?auto_171404 ) ( HAND-EMPTY ) ( not ( = ?auto_171399 ?auto_171405 ) ) ( not ( = ?auto_171400 ?auto_171405 ) ) ( not ( = ?auto_171401 ?auto_171405 ) ) ( not ( = ?auto_171402 ?auto_171405 ) ) ( not ( = ?auto_171403 ?auto_171405 ) ) ( not ( = ?auto_171404 ?auto_171405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171404 ?auto_171405 )
      ( MAKE-6PILE ?auto_171399 ?auto_171400 ?auto_171401 ?auto_171402 ?auto_171403 ?auto_171404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171406 - BLOCK
      ?auto_171407 - BLOCK
      ?auto_171408 - BLOCK
      ?auto_171409 - BLOCK
      ?auto_171410 - BLOCK
      ?auto_171411 - BLOCK
    )
    :vars
    (
      ?auto_171412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171406 ) ( ON ?auto_171407 ?auto_171406 ) ( ON ?auto_171408 ?auto_171407 ) ( ON ?auto_171409 ?auto_171408 ) ( not ( = ?auto_171406 ?auto_171407 ) ) ( not ( = ?auto_171406 ?auto_171408 ) ) ( not ( = ?auto_171406 ?auto_171409 ) ) ( not ( = ?auto_171406 ?auto_171410 ) ) ( not ( = ?auto_171406 ?auto_171411 ) ) ( not ( = ?auto_171407 ?auto_171408 ) ) ( not ( = ?auto_171407 ?auto_171409 ) ) ( not ( = ?auto_171407 ?auto_171410 ) ) ( not ( = ?auto_171407 ?auto_171411 ) ) ( not ( = ?auto_171408 ?auto_171409 ) ) ( not ( = ?auto_171408 ?auto_171410 ) ) ( not ( = ?auto_171408 ?auto_171411 ) ) ( not ( = ?auto_171409 ?auto_171410 ) ) ( not ( = ?auto_171409 ?auto_171411 ) ) ( not ( = ?auto_171410 ?auto_171411 ) ) ( ON ?auto_171411 ?auto_171412 ) ( CLEAR ?auto_171411 ) ( not ( = ?auto_171406 ?auto_171412 ) ) ( not ( = ?auto_171407 ?auto_171412 ) ) ( not ( = ?auto_171408 ?auto_171412 ) ) ( not ( = ?auto_171409 ?auto_171412 ) ) ( not ( = ?auto_171410 ?auto_171412 ) ) ( not ( = ?auto_171411 ?auto_171412 ) ) ( HOLDING ?auto_171410 ) ( CLEAR ?auto_171409 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171406 ?auto_171407 ?auto_171408 ?auto_171409 ?auto_171410 )
      ( MAKE-6PILE ?auto_171406 ?auto_171407 ?auto_171408 ?auto_171409 ?auto_171410 ?auto_171411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171413 - BLOCK
      ?auto_171414 - BLOCK
      ?auto_171415 - BLOCK
      ?auto_171416 - BLOCK
      ?auto_171417 - BLOCK
      ?auto_171418 - BLOCK
    )
    :vars
    (
      ?auto_171419 - BLOCK
      ?auto_171421 - BLOCK
      ?auto_171420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171413 ) ( ON ?auto_171414 ?auto_171413 ) ( ON ?auto_171415 ?auto_171414 ) ( ON ?auto_171416 ?auto_171415 ) ( not ( = ?auto_171413 ?auto_171414 ) ) ( not ( = ?auto_171413 ?auto_171415 ) ) ( not ( = ?auto_171413 ?auto_171416 ) ) ( not ( = ?auto_171413 ?auto_171417 ) ) ( not ( = ?auto_171413 ?auto_171418 ) ) ( not ( = ?auto_171414 ?auto_171415 ) ) ( not ( = ?auto_171414 ?auto_171416 ) ) ( not ( = ?auto_171414 ?auto_171417 ) ) ( not ( = ?auto_171414 ?auto_171418 ) ) ( not ( = ?auto_171415 ?auto_171416 ) ) ( not ( = ?auto_171415 ?auto_171417 ) ) ( not ( = ?auto_171415 ?auto_171418 ) ) ( not ( = ?auto_171416 ?auto_171417 ) ) ( not ( = ?auto_171416 ?auto_171418 ) ) ( not ( = ?auto_171417 ?auto_171418 ) ) ( ON ?auto_171418 ?auto_171419 ) ( not ( = ?auto_171413 ?auto_171419 ) ) ( not ( = ?auto_171414 ?auto_171419 ) ) ( not ( = ?auto_171415 ?auto_171419 ) ) ( not ( = ?auto_171416 ?auto_171419 ) ) ( not ( = ?auto_171417 ?auto_171419 ) ) ( not ( = ?auto_171418 ?auto_171419 ) ) ( CLEAR ?auto_171416 ) ( ON ?auto_171417 ?auto_171418 ) ( CLEAR ?auto_171417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171421 ) ( ON ?auto_171420 ?auto_171421 ) ( ON ?auto_171419 ?auto_171420 ) ( not ( = ?auto_171421 ?auto_171420 ) ) ( not ( = ?auto_171421 ?auto_171419 ) ) ( not ( = ?auto_171421 ?auto_171418 ) ) ( not ( = ?auto_171421 ?auto_171417 ) ) ( not ( = ?auto_171420 ?auto_171419 ) ) ( not ( = ?auto_171420 ?auto_171418 ) ) ( not ( = ?auto_171420 ?auto_171417 ) ) ( not ( = ?auto_171413 ?auto_171421 ) ) ( not ( = ?auto_171413 ?auto_171420 ) ) ( not ( = ?auto_171414 ?auto_171421 ) ) ( not ( = ?auto_171414 ?auto_171420 ) ) ( not ( = ?auto_171415 ?auto_171421 ) ) ( not ( = ?auto_171415 ?auto_171420 ) ) ( not ( = ?auto_171416 ?auto_171421 ) ) ( not ( = ?auto_171416 ?auto_171420 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171421 ?auto_171420 ?auto_171419 ?auto_171418 )
      ( MAKE-6PILE ?auto_171413 ?auto_171414 ?auto_171415 ?auto_171416 ?auto_171417 ?auto_171418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171422 - BLOCK
      ?auto_171423 - BLOCK
      ?auto_171424 - BLOCK
      ?auto_171425 - BLOCK
      ?auto_171426 - BLOCK
      ?auto_171427 - BLOCK
    )
    :vars
    (
      ?auto_171428 - BLOCK
      ?auto_171430 - BLOCK
      ?auto_171429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171422 ) ( ON ?auto_171423 ?auto_171422 ) ( ON ?auto_171424 ?auto_171423 ) ( not ( = ?auto_171422 ?auto_171423 ) ) ( not ( = ?auto_171422 ?auto_171424 ) ) ( not ( = ?auto_171422 ?auto_171425 ) ) ( not ( = ?auto_171422 ?auto_171426 ) ) ( not ( = ?auto_171422 ?auto_171427 ) ) ( not ( = ?auto_171423 ?auto_171424 ) ) ( not ( = ?auto_171423 ?auto_171425 ) ) ( not ( = ?auto_171423 ?auto_171426 ) ) ( not ( = ?auto_171423 ?auto_171427 ) ) ( not ( = ?auto_171424 ?auto_171425 ) ) ( not ( = ?auto_171424 ?auto_171426 ) ) ( not ( = ?auto_171424 ?auto_171427 ) ) ( not ( = ?auto_171425 ?auto_171426 ) ) ( not ( = ?auto_171425 ?auto_171427 ) ) ( not ( = ?auto_171426 ?auto_171427 ) ) ( ON ?auto_171427 ?auto_171428 ) ( not ( = ?auto_171422 ?auto_171428 ) ) ( not ( = ?auto_171423 ?auto_171428 ) ) ( not ( = ?auto_171424 ?auto_171428 ) ) ( not ( = ?auto_171425 ?auto_171428 ) ) ( not ( = ?auto_171426 ?auto_171428 ) ) ( not ( = ?auto_171427 ?auto_171428 ) ) ( ON ?auto_171426 ?auto_171427 ) ( CLEAR ?auto_171426 ) ( ON-TABLE ?auto_171430 ) ( ON ?auto_171429 ?auto_171430 ) ( ON ?auto_171428 ?auto_171429 ) ( not ( = ?auto_171430 ?auto_171429 ) ) ( not ( = ?auto_171430 ?auto_171428 ) ) ( not ( = ?auto_171430 ?auto_171427 ) ) ( not ( = ?auto_171430 ?auto_171426 ) ) ( not ( = ?auto_171429 ?auto_171428 ) ) ( not ( = ?auto_171429 ?auto_171427 ) ) ( not ( = ?auto_171429 ?auto_171426 ) ) ( not ( = ?auto_171422 ?auto_171430 ) ) ( not ( = ?auto_171422 ?auto_171429 ) ) ( not ( = ?auto_171423 ?auto_171430 ) ) ( not ( = ?auto_171423 ?auto_171429 ) ) ( not ( = ?auto_171424 ?auto_171430 ) ) ( not ( = ?auto_171424 ?auto_171429 ) ) ( not ( = ?auto_171425 ?auto_171430 ) ) ( not ( = ?auto_171425 ?auto_171429 ) ) ( HOLDING ?auto_171425 ) ( CLEAR ?auto_171424 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171422 ?auto_171423 ?auto_171424 ?auto_171425 )
      ( MAKE-6PILE ?auto_171422 ?auto_171423 ?auto_171424 ?auto_171425 ?auto_171426 ?auto_171427 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171431 - BLOCK
      ?auto_171432 - BLOCK
      ?auto_171433 - BLOCK
      ?auto_171434 - BLOCK
      ?auto_171435 - BLOCK
      ?auto_171436 - BLOCK
    )
    :vars
    (
      ?auto_171438 - BLOCK
      ?auto_171439 - BLOCK
      ?auto_171437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171431 ) ( ON ?auto_171432 ?auto_171431 ) ( ON ?auto_171433 ?auto_171432 ) ( not ( = ?auto_171431 ?auto_171432 ) ) ( not ( = ?auto_171431 ?auto_171433 ) ) ( not ( = ?auto_171431 ?auto_171434 ) ) ( not ( = ?auto_171431 ?auto_171435 ) ) ( not ( = ?auto_171431 ?auto_171436 ) ) ( not ( = ?auto_171432 ?auto_171433 ) ) ( not ( = ?auto_171432 ?auto_171434 ) ) ( not ( = ?auto_171432 ?auto_171435 ) ) ( not ( = ?auto_171432 ?auto_171436 ) ) ( not ( = ?auto_171433 ?auto_171434 ) ) ( not ( = ?auto_171433 ?auto_171435 ) ) ( not ( = ?auto_171433 ?auto_171436 ) ) ( not ( = ?auto_171434 ?auto_171435 ) ) ( not ( = ?auto_171434 ?auto_171436 ) ) ( not ( = ?auto_171435 ?auto_171436 ) ) ( ON ?auto_171436 ?auto_171438 ) ( not ( = ?auto_171431 ?auto_171438 ) ) ( not ( = ?auto_171432 ?auto_171438 ) ) ( not ( = ?auto_171433 ?auto_171438 ) ) ( not ( = ?auto_171434 ?auto_171438 ) ) ( not ( = ?auto_171435 ?auto_171438 ) ) ( not ( = ?auto_171436 ?auto_171438 ) ) ( ON ?auto_171435 ?auto_171436 ) ( ON-TABLE ?auto_171439 ) ( ON ?auto_171437 ?auto_171439 ) ( ON ?auto_171438 ?auto_171437 ) ( not ( = ?auto_171439 ?auto_171437 ) ) ( not ( = ?auto_171439 ?auto_171438 ) ) ( not ( = ?auto_171439 ?auto_171436 ) ) ( not ( = ?auto_171439 ?auto_171435 ) ) ( not ( = ?auto_171437 ?auto_171438 ) ) ( not ( = ?auto_171437 ?auto_171436 ) ) ( not ( = ?auto_171437 ?auto_171435 ) ) ( not ( = ?auto_171431 ?auto_171439 ) ) ( not ( = ?auto_171431 ?auto_171437 ) ) ( not ( = ?auto_171432 ?auto_171439 ) ) ( not ( = ?auto_171432 ?auto_171437 ) ) ( not ( = ?auto_171433 ?auto_171439 ) ) ( not ( = ?auto_171433 ?auto_171437 ) ) ( not ( = ?auto_171434 ?auto_171439 ) ) ( not ( = ?auto_171434 ?auto_171437 ) ) ( CLEAR ?auto_171433 ) ( ON ?auto_171434 ?auto_171435 ) ( CLEAR ?auto_171434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171439 ?auto_171437 ?auto_171438 ?auto_171436 ?auto_171435 )
      ( MAKE-6PILE ?auto_171431 ?auto_171432 ?auto_171433 ?auto_171434 ?auto_171435 ?auto_171436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171440 - BLOCK
      ?auto_171441 - BLOCK
      ?auto_171442 - BLOCK
      ?auto_171443 - BLOCK
      ?auto_171444 - BLOCK
      ?auto_171445 - BLOCK
    )
    :vars
    (
      ?auto_171446 - BLOCK
      ?auto_171448 - BLOCK
      ?auto_171447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171440 ) ( ON ?auto_171441 ?auto_171440 ) ( not ( = ?auto_171440 ?auto_171441 ) ) ( not ( = ?auto_171440 ?auto_171442 ) ) ( not ( = ?auto_171440 ?auto_171443 ) ) ( not ( = ?auto_171440 ?auto_171444 ) ) ( not ( = ?auto_171440 ?auto_171445 ) ) ( not ( = ?auto_171441 ?auto_171442 ) ) ( not ( = ?auto_171441 ?auto_171443 ) ) ( not ( = ?auto_171441 ?auto_171444 ) ) ( not ( = ?auto_171441 ?auto_171445 ) ) ( not ( = ?auto_171442 ?auto_171443 ) ) ( not ( = ?auto_171442 ?auto_171444 ) ) ( not ( = ?auto_171442 ?auto_171445 ) ) ( not ( = ?auto_171443 ?auto_171444 ) ) ( not ( = ?auto_171443 ?auto_171445 ) ) ( not ( = ?auto_171444 ?auto_171445 ) ) ( ON ?auto_171445 ?auto_171446 ) ( not ( = ?auto_171440 ?auto_171446 ) ) ( not ( = ?auto_171441 ?auto_171446 ) ) ( not ( = ?auto_171442 ?auto_171446 ) ) ( not ( = ?auto_171443 ?auto_171446 ) ) ( not ( = ?auto_171444 ?auto_171446 ) ) ( not ( = ?auto_171445 ?auto_171446 ) ) ( ON ?auto_171444 ?auto_171445 ) ( ON-TABLE ?auto_171448 ) ( ON ?auto_171447 ?auto_171448 ) ( ON ?auto_171446 ?auto_171447 ) ( not ( = ?auto_171448 ?auto_171447 ) ) ( not ( = ?auto_171448 ?auto_171446 ) ) ( not ( = ?auto_171448 ?auto_171445 ) ) ( not ( = ?auto_171448 ?auto_171444 ) ) ( not ( = ?auto_171447 ?auto_171446 ) ) ( not ( = ?auto_171447 ?auto_171445 ) ) ( not ( = ?auto_171447 ?auto_171444 ) ) ( not ( = ?auto_171440 ?auto_171448 ) ) ( not ( = ?auto_171440 ?auto_171447 ) ) ( not ( = ?auto_171441 ?auto_171448 ) ) ( not ( = ?auto_171441 ?auto_171447 ) ) ( not ( = ?auto_171442 ?auto_171448 ) ) ( not ( = ?auto_171442 ?auto_171447 ) ) ( not ( = ?auto_171443 ?auto_171448 ) ) ( not ( = ?auto_171443 ?auto_171447 ) ) ( ON ?auto_171443 ?auto_171444 ) ( CLEAR ?auto_171443 ) ( HOLDING ?auto_171442 ) ( CLEAR ?auto_171441 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171440 ?auto_171441 ?auto_171442 )
      ( MAKE-6PILE ?auto_171440 ?auto_171441 ?auto_171442 ?auto_171443 ?auto_171444 ?auto_171445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171449 - BLOCK
      ?auto_171450 - BLOCK
      ?auto_171451 - BLOCK
      ?auto_171452 - BLOCK
      ?auto_171453 - BLOCK
      ?auto_171454 - BLOCK
    )
    :vars
    (
      ?auto_171457 - BLOCK
      ?auto_171456 - BLOCK
      ?auto_171455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171449 ) ( ON ?auto_171450 ?auto_171449 ) ( not ( = ?auto_171449 ?auto_171450 ) ) ( not ( = ?auto_171449 ?auto_171451 ) ) ( not ( = ?auto_171449 ?auto_171452 ) ) ( not ( = ?auto_171449 ?auto_171453 ) ) ( not ( = ?auto_171449 ?auto_171454 ) ) ( not ( = ?auto_171450 ?auto_171451 ) ) ( not ( = ?auto_171450 ?auto_171452 ) ) ( not ( = ?auto_171450 ?auto_171453 ) ) ( not ( = ?auto_171450 ?auto_171454 ) ) ( not ( = ?auto_171451 ?auto_171452 ) ) ( not ( = ?auto_171451 ?auto_171453 ) ) ( not ( = ?auto_171451 ?auto_171454 ) ) ( not ( = ?auto_171452 ?auto_171453 ) ) ( not ( = ?auto_171452 ?auto_171454 ) ) ( not ( = ?auto_171453 ?auto_171454 ) ) ( ON ?auto_171454 ?auto_171457 ) ( not ( = ?auto_171449 ?auto_171457 ) ) ( not ( = ?auto_171450 ?auto_171457 ) ) ( not ( = ?auto_171451 ?auto_171457 ) ) ( not ( = ?auto_171452 ?auto_171457 ) ) ( not ( = ?auto_171453 ?auto_171457 ) ) ( not ( = ?auto_171454 ?auto_171457 ) ) ( ON ?auto_171453 ?auto_171454 ) ( ON-TABLE ?auto_171456 ) ( ON ?auto_171455 ?auto_171456 ) ( ON ?auto_171457 ?auto_171455 ) ( not ( = ?auto_171456 ?auto_171455 ) ) ( not ( = ?auto_171456 ?auto_171457 ) ) ( not ( = ?auto_171456 ?auto_171454 ) ) ( not ( = ?auto_171456 ?auto_171453 ) ) ( not ( = ?auto_171455 ?auto_171457 ) ) ( not ( = ?auto_171455 ?auto_171454 ) ) ( not ( = ?auto_171455 ?auto_171453 ) ) ( not ( = ?auto_171449 ?auto_171456 ) ) ( not ( = ?auto_171449 ?auto_171455 ) ) ( not ( = ?auto_171450 ?auto_171456 ) ) ( not ( = ?auto_171450 ?auto_171455 ) ) ( not ( = ?auto_171451 ?auto_171456 ) ) ( not ( = ?auto_171451 ?auto_171455 ) ) ( not ( = ?auto_171452 ?auto_171456 ) ) ( not ( = ?auto_171452 ?auto_171455 ) ) ( ON ?auto_171452 ?auto_171453 ) ( CLEAR ?auto_171450 ) ( ON ?auto_171451 ?auto_171452 ) ( CLEAR ?auto_171451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171456 ?auto_171455 ?auto_171457 ?auto_171454 ?auto_171453 ?auto_171452 )
      ( MAKE-6PILE ?auto_171449 ?auto_171450 ?auto_171451 ?auto_171452 ?auto_171453 ?auto_171454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171458 - BLOCK
      ?auto_171459 - BLOCK
      ?auto_171460 - BLOCK
      ?auto_171461 - BLOCK
      ?auto_171462 - BLOCK
      ?auto_171463 - BLOCK
    )
    :vars
    (
      ?auto_171466 - BLOCK
      ?auto_171464 - BLOCK
      ?auto_171465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171458 ) ( not ( = ?auto_171458 ?auto_171459 ) ) ( not ( = ?auto_171458 ?auto_171460 ) ) ( not ( = ?auto_171458 ?auto_171461 ) ) ( not ( = ?auto_171458 ?auto_171462 ) ) ( not ( = ?auto_171458 ?auto_171463 ) ) ( not ( = ?auto_171459 ?auto_171460 ) ) ( not ( = ?auto_171459 ?auto_171461 ) ) ( not ( = ?auto_171459 ?auto_171462 ) ) ( not ( = ?auto_171459 ?auto_171463 ) ) ( not ( = ?auto_171460 ?auto_171461 ) ) ( not ( = ?auto_171460 ?auto_171462 ) ) ( not ( = ?auto_171460 ?auto_171463 ) ) ( not ( = ?auto_171461 ?auto_171462 ) ) ( not ( = ?auto_171461 ?auto_171463 ) ) ( not ( = ?auto_171462 ?auto_171463 ) ) ( ON ?auto_171463 ?auto_171466 ) ( not ( = ?auto_171458 ?auto_171466 ) ) ( not ( = ?auto_171459 ?auto_171466 ) ) ( not ( = ?auto_171460 ?auto_171466 ) ) ( not ( = ?auto_171461 ?auto_171466 ) ) ( not ( = ?auto_171462 ?auto_171466 ) ) ( not ( = ?auto_171463 ?auto_171466 ) ) ( ON ?auto_171462 ?auto_171463 ) ( ON-TABLE ?auto_171464 ) ( ON ?auto_171465 ?auto_171464 ) ( ON ?auto_171466 ?auto_171465 ) ( not ( = ?auto_171464 ?auto_171465 ) ) ( not ( = ?auto_171464 ?auto_171466 ) ) ( not ( = ?auto_171464 ?auto_171463 ) ) ( not ( = ?auto_171464 ?auto_171462 ) ) ( not ( = ?auto_171465 ?auto_171466 ) ) ( not ( = ?auto_171465 ?auto_171463 ) ) ( not ( = ?auto_171465 ?auto_171462 ) ) ( not ( = ?auto_171458 ?auto_171464 ) ) ( not ( = ?auto_171458 ?auto_171465 ) ) ( not ( = ?auto_171459 ?auto_171464 ) ) ( not ( = ?auto_171459 ?auto_171465 ) ) ( not ( = ?auto_171460 ?auto_171464 ) ) ( not ( = ?auto_171460 ?auto_171465 ) ) ( not ( = ?auto_171461 ?auto_171464 ) ) ( not ( = ?auto_171461 ?auto_171465 ) ) ( ON ?auto_171461 ?auto_171462 ) ( ON ?auto_171460 ?auto_171461 ) ( CLEAR ?auto_171460 ) ( HOLDING ?auto_171459 ) ( CLEAR ?auto_171458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171458 ?auto_171459 )
      ( MAKE-6PILE ?auto_171458 ?auto_171459 ?auto_171460 ?auto_171461 ?auto_171462 ?auto_171463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171467 - BLOCK
      ?auto_171468 - BLOCK
      ?auto_171469 - BLOCK
      ?auto_171470 - BLOCK
      ?auto_171471 - BLOCK
      ?auto_171472 - BLOCK
    )
    :vars
    (
      ?auto_171473 - BLOCK
      ?auto_171475 - BLOCK
      ?auto_171474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171467 ) ( not ( = ?auto_171467 ?auto_171468 ) ) ( not ( = ?auto_171467 ?auto_171469 ) ) ( not ( = ?auto_171467 ?auto_171470 ) ) ( not ( = ?auto_171467 ?auto_171471 ) ) ( not ( = ?auto_171467 ?auto_171472 ) ) ( not ( = ?auto_171468 ?auto_171469 ) ) ( not ( = ?auto_171468 ?auto_171470 ) ) ( not ( = ?auto_171468 ?auto_171471 ) ) ( not ( = ?auto_171468 ?auto_171472 ) ) ( not ( = ?auto_171469 ?auto_171470 ) ) ( not ( = ?auto_171469 ?auto_171471 ) ) ( not ( = ?auto_171469 ?auto_171472 ) ) ( not ( = ?auto_171470 ?auto_171471 ) ) ( not ( = ?auto_171470 ?auto_171472 ) ) ( not ( = ?auto_171471 ?auto_171472 ) ) ( ON ?auto_171472 ?auto_171473 ) ( not ( = ?auto_171467 ?auto_171473 ) ) ( not ( = ?auto_171468 ?auto_171473 ) ) ( not ( = ?auto_171469 ?auto_171473 ) ) ( not ( = ?auto_171470 ?auto_171473 ) ) ( not ( = ?auto_171471 ?auto_171473 ) ) ( not ( = ?auto_171472 ?auto_171473 ) ) ( ON ?auto_171471 ?auto_171472 ) ( ON-TABLE ?auto_171475 ) ( ON ?auto_171474 ?auto_171475 ) ( ON ?auto_171473 ?auto_171474 ) ( not ( = ?auto_171475 ?auto_171474 ) ) ( not ( = ?auto_171475 ?auto_171473 ) ) ( not ( = ?auto_171475 ?auto_171472 ) ) ( not ( = ?auto_171475 ?auto_171471 ) ) ( not ( = ?auto_171474 ?auto_171473 ) ) ( not ( = ?auto_171474 ?auto_171472 ) ) ( not ( = ?auto_171474 ?auto_171471 ) ) ( not ( = ?auto_171467 ?auto_171475 ) ) ( not ( = ?auto_171467 ?auto_171474 ) ) ( not ( = ?auto_171468 ?auto_171475 ) ) ( not ( = ?auto_171468 ?auto_171474 ) ) ( not ( = ?auto_171469 ?auto_171475 ) ) ( not ( = ?auto_171469 ?auto_171474 ) ) ( not ( = ?auto_171470 ?auto_171475 ) ) ( not ( = ?auto_171470 ?auto_171474 ) ) ( ON ?auto_171470 ?auto_171471 ) ( ON ?auto_171469 ?auto_171470 ) ( CLEAR ?auto_171467 ) ( ON ?auto_171468 ?auto_171469 ) ( CLEAR ?auto_171468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171475 ?auto_171474 ?auto_171473 ?auto_171472 ?auto_171471 ?auto_171470 ?auto_171469 )
      ( MAKE-6PILE ?auto_171467 ?auto_171468 ?auto_171469 ?auto_171470 ?auto_171471 ?auto_171472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171476 - BLOCK
      ?auto_171477 - BLOCK
      ?auto_171478 - BLOCK
      ?auto_171479 - BLOCK
      ?auto_171480 - BLOCK
      ?auto_171481 - BLOCK
    )
    :vars
    (
      ?auto_171483 - BLOCK
      ?auto_171484 - BLOCK
      ?auto_171482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171476 ?auto_171477 ) ) ( not ( = ?auto_171476 ?auto_171478 ) ) ( not ( = ?auto_171476 ?auto_171479 ) ) ( not ( = ?auto_171476 ?auto_171480 ) ) ( not ( = ?auto_171476 ?auto_171481 ) ) ( not ( = ?auto_171477 ?auto_171478 ) ) ( not ( = ?auto_171477 ?auto_171479 ) ) ( not ( = ?auto_171477 ?auto_171480 ) ) ( not ( = ?auto_171477 ?auto_171481 ) ) ( not ( = ?auto_171478 ?auto_171479 ) ) ( not ( = ?auto_171478 ?auto_171480 ) ) ( not ( = ?auto_171478 ?auto_171481 ) ) ( not ( = ?auto_171479 ?auto_171480 ) ) ( not ( = ?auto_171479 ?auto_171481 ) ) ( not ( = ?auto_171480 ?auto_171481 ) ) ( ON ?auto_171481 ?auto_171483 ) ( not ( = ?auto_171476 ?auto_171483 ) ) ( not ( = ?auto_171477 ?auto_171483 ) ) ( not ( = ?auto_171478 ?auto_171483 ) ) ( not ( = ?auto_171479 ?auto_171483 ) ) ( not ( = ?auto_171480 ?auto_171483 ) ) ( not ( = ?auto_171481 ?auto_171483 ) ) ( ON ?auto_171480 ?auto_171481 ) ( ON-TABLE ?auto_171484 ) ( ON ?auto_171482 ?auto_171484 ) ( ON ?auto_171483 ?auto_171482 ) ( not ( = ?auto_171484 ?auto_171482 ) ) ( not ( = ?auto_171484 ?auto_171483 ) ) ( not ( = ?auto_171484 ?auto_171481 ) ) ( not ( = ?auto_171484 ?auto_171480 ) ) ( not ( = ?auto_171482 ?auto_171483 ) ) ( not ( = ?auto_171482 ?auto_171481 ) ) ( not ( = ?auto_171482 ?auto_171480 ) ) ( not ( = ?auto_171476 ?auto_171484 ) ) ( not ( = ?auto_171476 ?auto_171482 ) ) ( not ( = ?auto_171477 ?auto_171484 ) ) ( not ( = ?auto_171477 ?auto_171482 ) ) ( not ( = ?auto_171478 ?auto_171484 ) ) ( not ( = ?auto_171478 ?auto_171482 ) ) ( not ( = ?auto_171479 ?auto_171484 ) ) ( not ( = ?auto_171479 ?auto_171482 ) ) ( ON ?auto_171479 ?auto_171480 ) ( ON ?auto_171478 ?auto_171479 ) ( ON ?auto_171477 ?auto_171478 ) ( CLEAR ?auto_171477 ) ( HOLDING ?auto_171476 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171476 )
      ( MAKE-6PILE ?auto_171476 ?auto_171477 ?auto_171478 ?auto_171479 ?auto_171480 ?auto_171481 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_171485 - BLOCK
      ?auto_171486 - BLOCK
      ?auto_171487 - BLOCK
      ?auto_171488 - BLOCK
      ?auto_171489 - BLOCK
      ?auto_171490 - BLOCK
    )
    :vars
    (
      ?auto_171492 - BLOCK
      ?auto_171491 - BLOCK
      ?auto_171493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171485 ?auto_171486 ) ) ( not ( = ?auto_171485 ?auto_171487 ) ) ( not ( = ?auto_171485 ?auto_171488 ) ) ( not ( = ?auto_171485 ?auto_171489 ) ) ( not ( = ?auto_171485 ?auto_171490 ) ) ( not ( = ?auto_171486 ?auto_171487 ) ) ( not ( = ?auto_171486 ?auto_171488 ) ) ( not ( = ?auto_171486 ?auto_171489 ) ) ( not ( = ?auto_171486 ?auto_171490 ) ) ( not ( = ?auto_171487 ?auto_171488 ) ) ( not ( = ?auto_171487 ?auto_171489 ) ) ( not ( = ?auto_171487 ?auto_171490 ) ) ( not ( = ?auto_171488 ?auto_171489 ) ) ( not ( = ?auto_171488 ?auto_171490 ) ) ( not ( = ?auto_171489 ?auto_171490 ) ) ( ON ?auto_171490 ?auto_171492 ) ( not ( = ?auto_171485 ?auto_171492 ) ) ( not ( = ?auto_171486 ?auto_171492 ) ) ( not ( = ?auto_171487 ?auto_171492 ) ) ( not ( = ?auto_171488 ?auto_171492 ) ) ( not ( = ?auto_171489 ?auto_171492 ) ) ( not ( = ?auto_171490 ?auto_171492 ) ) ( ON ?auto_171489 ?auto_171490 ) ( ON-TABLE ?auto_171491 ) ( ON ?auto_171493 ?auto_171491 ) ( ON ?auto_171492 ?auto_171493 ) ( not ( = ?auto_171491 ?auto_171493 ) ) ( not ( = ?auto_171491 ?auto_171492 ) ) ( not ( = ?auto_171491 ?auto_171490 ) ) ( not ( = ?auto_171491 ?auto_171489 ) ) ( not ( = ?auto_171493 ?auto_171492 ) ) ( not ( = ?auto_171493 ?auto_171490 ) ) ( not ( = ?auto_171493 ?auto_171489 ) ) ( not ( = ?auto_171485 ?auto_171491 ) ) ( not ( = ?auto_171485 ?auto_171493 ) ) ( not ( = ?auto_171486 ?auto_171491 ) ) ( not ( = ?auto_171486 ?auto_171493 ) ) ( not ( = ?auto_171487 ?auto_171491 ) ) ( not ( = ?auto_171487 ?auto_171493 ) ) ( not ( = ?auto_171488 ?auto_171491 ) ) ( not ( = ?auto_171488 ?auto_171493 ) ) ( ON ?auto_171488 ?auto_171489 ) ( ON ?auto_171487 ?auto_171488 ) ( ON ?auto_171486 ?auto_171487 ) ( ON ?auto_171485 ?auto_171486 ) ( CLEAR ?auto_171485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171491 ?auto_171493 ?auto_171492 ?auto_171490 ?auto_171489 ?auto_171488 ?auto_171487 ?auto_171486 )
      ( MAKE-6PILE ?auto_171485 ?auto_171486 ?auto_171487 ?auto_171488 ?auto_171489 ?auto_171490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171496 - BLOCK
      ?auto_171497 - BLOCK
    )
    :vars
    (
      ?auto_171498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171498 ?auto_171497 ) ( CLEAR ?auto_171498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171496 ) ( ON ?auto_171497 ?auto_171496 ) ( not ( = ?auto_171496 ?auto_171497 ) ) ( not ( = ?auto_171496 ?auto_171498 ) ) ( not ( = ?auto_171497 ?auto_171498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171498 ?auto_171497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171499 - BLOCK
      ?auto_171500 - BLOCK
    )
    :vars
    (
      ?auto_171501 - BLOCK
      ?auto_171502 - BLOCK
      ?auto_171503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171501 ?auto_171500 ) ( CLEAR ?auto_171501 ) ( ON-TABLE ?auto_171499 ) ( ON ?auto_171500 ?auto_171499 ) ( not ( = ?auto_171499 ?auto_171500 ) ) ( not ( = ?auto_171499 ?auto_171501 ) ) ( not ( = ?auto_171500 ?auto_171501 ) ) ( HOLDING ?auto_171502 ) ( CLEAR ?auto_171503 ) ( not ( = ?auto_171499 ?auto_171502 ) ) ( not ( = ?auto_171499 ?auto_171503 ) ) ( not ( = ?auto_171500 ?auto_171502 ) ) ( not ( = ?auto_171500 ?auto_171503 ) ) ( not ( = ?auto_171501 ?auto_171502 ) ) ( not ( = ?auto_171501 ?auto_171503 ) ) ( not ( = ?auto_171502 ?auto_171503 ) ) )
    :subtasks
    ( ( !STACK ?auto_171502 ?auto_171503 )
      ( MAKE-2PILE ?auto_171499 ?auto_171500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171504 - BLOCK
      ?auto_171505 - BLOCK
    )
    :vars
    (
      ?auto_171507 - BLOCK
      ?auto_171506 - BLOCK
      ?auto_171508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171507 ?auto_171505 ) ( ON-TABLE ?auto_171504 ) ( ON ?auto_171505 ?auto_171504 ) ( not ( = ?auto_171504 ?auto_171505 ) ) ( not ( = ?auto_171504 ?auto_171507 ) ) ( not ( = ?auto_171505 ?auto_171507 ) ) ( CLEAR ?auto_171506 ) ( not ( = ?auto_171504 ?auto_171508 ) ) ( not ( = ?auto_171504 ?auto_171506 ) ) ( not ( = ?auto_171505 ?auto_171508 ) ) ( not ( = ?auto_171505 ?auto_171506 ) ) ( not ( = ?auto_171507 ?auto_171508 ) ) ( not ( = ?auto_171507 ?auto_171506 ) ) ( not ( = ?auto_171508 ?auto_171506 ) ) ( ON ?auto_171508 ?auto_171507 ) ( CLEAR ?auto_171508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171504 ?auto_171505 ?auto_171507 )
      ( MAKE-2PILE ?auto_171504 ?auto_171505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171509 - BLOCK
      ?auto_171510 - BLOCK
    )
    :vars
    (
      ?auto_171513 - BLOCK
      ?auto_171512 - BLOCK
      ?auto_171511 - BLOCK
      ?auto_171514 - BLOCK
      ?auto_171516 - BLOCK
      ?auto_171517 - BLOCK
      ?auto_171515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171513 ?auto_171510 ) ( ON-TABLE ?auto_171509 ) ( ON ?auto_171510 ?auto_171509 ) ( not ( = ?auto_171509 ?auto_171510 ) ) ( not ( = ?auto_171509 ?auto_171513 ) ) ( not ( = ?auto_171510 ?auto_171513 ) ) ( not ( = ?auto_171509 ?auto_171512 ) ) ( not ( = ?auto_171509 ?auto_171511 ) ) ( not ( = ?auto_171510 ?auto_171512 ) ) ( not ( = ?auto_171510 ?auto_171511 ) ) ( not ( = ?auto_171513 ?auto_171512 ) ) ( not ( = ?auto_171513 ?auto_171511 ) ) ( not ( = ?auto_171512 ?auto_171511 ) ) ( ON ?auto_171512 ?auto_171513 ) ( CLEAR ?auto_171512 ) ( HOLDING ?auto_171511 ) ( CLEAR ?auto_171514 ) ( ON-TABLE ?auto_171516 ) ( ON ?auto_171517 ?auto_171516 ) ( ON ?auto_171515 ?auto_171517 ) ( ON ?auto_171514 ?auto_171515 ) ( not ( = ?auto_171516 ?auto_171517 ) ) ( not ( = ?auto_171516 ?auto_171515 ) ) ( not ( = ?auto_171516 ?auto_171514 ) ) ( not ( = ?auto_171516 ?auto_171511 ) ) ( not ( = ?auto_171517 ?auto_171515 ) ) ( not ( = ?auto_171517 ?auto_171514 ) ) ( not ( = ?auto_171517 ?auto_171511 ) ) ( not ( = ?auto_171515 ?auto_171514 ) ) ( not ( = ?auto_171515 ?auto_171511 ) ) ( not ( = ?auto_171514 ?auto_171511 ) ) ( not ( = ?auto_171509 ?auto_171514 ) ) ( not ( = ?auto_171509 ?auto_171516 ) ) ( not ( = ?auto_171509 ?auto_171517 ) ) ( not ( = ?auto_171509 ?auto_171515 ) ) ( not ( = ?auto_171510 ?auto_171514 ) ) ( not ( = ?auto_171510 ?auto_171516 ) ) ( not ( = ?auto_171510 ?auto_171517 ) ) ( not ( = ?auto_171510 ?auto_171515 ) ) ( not ( = ?auto_171513 ?auto_171514 ) ) ( not ( = ?auto_171513 ?auto_171516 ) ) ( not ( = ?auto_171513 ?auto_171517 ) ) ( not ( = ?auto_171513 ?auto_171515 ) ) ( not ( = ?auto_171512 ?auto_171514 ) ) ( not ( = ?auto_171512 ?auto_171516 ) ) ( not ( = ?auto_171512 ?auto_171517 ) ) ( not ( = ?auto_171512 ?auto_171515 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171516 ?auto_171517 ?auto_171515 ?auto_171514 ?auto_171511 )
      ( MAKE-2PILE ?auto_171509 ?auto_171510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171518 - BLOCK
      ?auto_171519 - BLOCK
    )
    :vars
    (
      ?auto_171523 - BLOCK
      ?auto_171526 - BLOCK
      ?auto_171522 - BLOCK
      ?auto_171520 - BLOCK
      ?auto_171525 - BLOCK
      ?auto_171521 - BLOCK
      ?auto_171524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171523 ?auto_171519 ) ( ON-TABLE ?auto_171518 ) ( ON ?auto_171519 ?auto_171518 ) ( not ( = ?auto_171518 ?auto_171519 ) ) ( not ( = ?auto_171518 ?auto_171523 ) ) ( not ( = ?auto_171519 ?auto_171523 ) ) ( not ( = ?auto_171518 ?auto_171526 ) ) ( not ( = ?auto_171518 ?auto_171522 ) ) ( not ( = ?auto_171519 ?auto_171526 ) ) ( not ( = ?auto_171519 ?auto_171522 ) ) ( not ( = ?auto_171523 ?auto_171526 ) ) ( not ( = ?auto_171523 ?auto_171522 ) ) ( not ( = ?auto_171526 ?auto_171522 ) ) ( ON ?auto_171526 ?auto_171523 ) ( CLEAR ?auto_171520 ) ( ON-TABLE ?auto_171525 ) ( ON ?auto_171521 ?auto_171525 ) ( ON ?auto_171524 ?auto_171521 ) ( ON ?auto_171520 ?auto_171524 ) ( not ( = ?auto_171525 ?auto_171521 ) ) ( not ( = ?auto_171525 ?auto_171524 ) ) ( not ( = ?auto_171525 ?auto_171520 ) ) ( not ( = ?auto_171525 ?auto_171522 ) ) ( not ( = ?auto_171521 ?auto_171524 ) ) ( not ( = ?auto_171521 ?auto_171520 ) ) ( not ( = ?auto_171521 ?auto_171522 ) ) ( not ( = ?auto_171524 ?auto_171520 ) ) ( not ( = ?auto_171524 ?auto_171522 ) ) ( not ( = ?auto_171520 ?auto_171522 ) ) ( not ( = ?auto_171518 ?auto_171520 ) ) ( not ( = ?auto_171518 ?auto_171525 ) ) ( not ( = ?auto_171518 ?auto_171521 ) ) ( not ( = ?auto_171518 ?auto_171524 ) ) ( not ( = ?auto_171519 ?auto_171520 ) ) ( not ( = ?auto_171519 ?auto_171525 ) ) ( not ( = ?auto_171519 ?auto_171521 ) ) ( not ( = ?auto_171519 ?auto_171524 ) ) ( not ( = ?auto_171523 ?auto_171520 ) ) ( not ( = ?auto_171523 ?auto_171525 ) ) ( not ( = ?auto_171523 ?auto_171521 ) ) ( not ( = ?auto_171523 ?auto_171524 ) ) ( not ( = ?auto_171526 ?auto_171520 ) ) ( not ( = ?auto_171526 ?auto_171525 ) ) ( not ( = ?auto_171526 ?auto_171521 ) ) ( not ( = ?auto_171526 ?auto_171524 ) ) ( ON ?auto_171522 ?auto_171526 ) ( CLEAR ?auto_171522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171518 ?auto_171519 ?auto_171523 ?auto_171526 )
      ( MAKE-2PILE ?auto_171518 ?auto_171519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171527 - BLOCK
      ?auto_171528 - BLOCK
    )
    :vars
    (
      ?auto_171533 - BLOCK
      ?auto_171529 - BLOCK
      ?auto_171535 - BLOCK
      ?auto_171530 - BLOCK
      ?auto_171532 - BLOCK
      ?auto_171534 - BLOCK
      ?auto_171531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171533 ?auto_171528 ) ( ON-TABLE ?auto_171527 ) ( ON ?auto_171528 ?auto_171527 ) ( not ( = ?auto_171527 ?auto_171528 ) ) ( not ( = ?auto_171527 ?auto_171533 ) ) ( not ( = ?auto_171528 ?auto_171533 ) ) ( not ( = ?auto_171527 ?auto_171529 ) ) ( not ( = ?auto_171527 ?auto_171535 ) ) ( not ( = ?auto_171528 ?auto_171529 ) ) ( not ( = ?auto_171528 ?auto_171535 ) ) ( not ( = ?auto_171533 ?auto_171529 ) ) ( not ( = ?auto_171533 ?auto_171535 ) ) ( not ( = ?auto_171529 ?auto_171535 ) ) ( ON ?auto_171529 ?auto_171533 ) ( ON-TABLE ?auto_171530 ) ( ON ?auto_171532 ?auto_171530 ) ( ON ?auto_171534 ?auto_171532 ) ( not ( = ?auto_171530 ?auto_171532 ) ) ( not ( = ?auto_171530 ?auto_171534 ) ) ( not ( = ?auto_171530 ?auto_171531 ) ) ( not ( = ?auto_171530 ?auto_171535 ) ) ( not ( = ?auto_171532 ?auto_171534 ) ) ( not ( = ?auto_171532 ?auto_171531 ) ) ( not ( = ?auto_171532 ?auto_171535 ) ) ( not ( = ?auto_171534 ?auto_171531 ) ) ( not ( = ?auto_171534 ?auto_171535 ) ) ( not ( = ?auto_171531 ?auto_171535 ) ) ( not ( = ?auto_171527 ?auto_171531 ) ) ( not ( = ?auto_171527 ?auto_171530 ) ) ( not ( = ?auto_171527 ?auto_171532 ) ) ( not ( = ?auto_171527 ?auto_171534 ) ) ( not ( = ?auto_171528 ?auto_171531 ) ) ( not ( = ?auto_171528 ?auto_171530 ) ) ( not ( = ?auto_171528 ?auto_171532 ) ) ( not ( = ?auto_171528 ?auto_171534 ) ) ( not ( = ?auto_171533 ?auto_171531 ) ) ( not ( = ?auto_171533 ?auto_171530 ) ) ( not ( = ?auto_171533 ?auto_171532 ) ) ( not ( = ?auto_171533 ?auto_171534 ) ) ( not ( = ?auto_171529 ?auto_171531 ) ) ( not ( = ?auto_171529 ?auto_171530 ) ) ( not ( = ?auto_171529 ?auto_171532 ) ) ( not ( = ?auto_171529 ?auto_171534 ) ) ( ON ?auto_171535 ?auto_171529 ) ( CLEAR ?auto_171535 ) ( HOLDING ?auto_171531 ) ( CLEAR ?auto_171534 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171530 ?auto_171532 ?auto_171534 ?auto_171531 )
      ( MAKE-2PILE ?auto_171527 ?auto_171528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171536 - BLOCK
      ?auto_171537 - BLOCK
    )
    :vars
    (
      ?auto_171543 - BLOCK
      ?auto_171541 - BLOCK
      ?auto_171542 - BLOCK
      ?auto_171538 - BLOCK
      ?auto_171540 - BLOCK
      ?auto_171539 - BLOCK
      ?auto_171544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171543 ?auto_171537 ) ( ON-TABLE ?auto_171536 ) ( ON ?auto_171537 ?auto_171536 ) ( not ( = ?auto_171536 ?auto_171537 ) ) ( not ( = ?auto_171536 ?auto_171543 ) ) ( not ( = ?auto_171537 ?auto_171543 ) ) ( not ( = ?auto_171536 ?auto_171541 ) ) ( not ( = ?auto_171536 ?auto_171542 ) ) ( not ( = ?auto_171537 ?auto_171541 ) ) ( not ( = ?auto_171537 ?auto_171542 ) ) ( not ( = ?auto_171543 ?auto_171541 ) ) ( not ( = ?auto_171543 ?auto_171542 ) ) ( not ( = ?auto_171541 ?auto_171542 ) ) ( ON ?auto_171541 ?auto_171543 ) ( ON-TABLE ?auto_171538 ) ( ON ?auto_171540 ?auto_171538 ) ( ON ?auto_171539 ?auto_171540 ) ( not ( = ?auto_171538 ?auto_171540 ) ) ( not ( = ?auto_171538 ?auto_171539 ) ) ( not ( = ?auto_171538 ?auto_171544 ) ) ( not ( = ?auto_171538 ?auto_171542 ) ) ( not ( = ?auto_171540 ?auto_171539 ) ) ( not ( = ?auto_171540 ?auto_171544 ) ) ( not ( = ?auto_171540 ?auto_171542 ) ) ( not ( = ?auto_171539 ?auto_171544 ) ) ( not ( = ?auto_171539 ?auto_171542 ) ) ( not ( = ?auto_171544 ?auto_171542 ) ) ( not ( = ?auto_171536 ?auto_171544 ) ) ( not ( = ?auto_171536 ?auto_171538 ) ) ( not ( = ?auto_171536 ?auto_171540 ) ) ( not ( = ?auto_171536 ?auto_171539 ) ) ( not ( = ?auto_171537 ?auto_171544 ) ) ( not ( = ?auto_171537 ?auto_171538 ) ) ( not ( = ?auto_171537 ?auto_171540 ) ) ( not ( = ?auto_171537 ?auto_171539 ) ) ( not ( = ?auto_171543 ?auto_171544 ) ) ( not ( = ?auto_171543 ?auto_171538 ) ) ( not ( = ?auto_171543 ?auto_171540 ) ) ( not ( = ?auto_171543 ?auto_171539 ) ) ( not ( = ?auto_171541 ?auto_171544 ) ) ( not ( = ?auto_171541 ?auto_171538 ) ) ( not ( = ?auto_171541 ?auto_171540 ) ) ( not ( = ?auto_171541 ?auto_171539 ) ) ( ON ?auto_171542 ?auto_171541 ) ( CLEAR ?auto_171539 ) ( ON ?auto_171544 ?auto_171542 ) ( CLEAR ?auto_171544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171536 ?auto_171537 ?auto_171543 ?auto_171541 ?auto_171542 )
      ( MAKE-2PILE ?auto_171536 ?auto_171537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171545 - BLOCK
      ?auto_171546 - BLOCK
    )
    :vars
    (
      ?auto_171548 - BLOCK
      ?auto_171547 - BLOCK
      ?auto_171552 - BLOCK
      ?auto_171551 - BLOCK
      ?auto_171549 - BLOCK
      ?auto_171550 - BLOCK
      ?auto_171553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171548 ?auto_171546 ) ( ON-TABLE ?auto_171545 ) ( ON ?auto_171546 ?auto_171545 ) ( not ( = ?auto_171545 ?auto_171546 ) ) ( not ( = ?auto_171545 ?auto_171548 ) ) ( not ( = ?auto_171546 ?auto_171548 ) ) ( not ( = ?auto_171545 ?auto_171547 ) ) ( not ( = ?auto_171545 ?auto_171552 ) ) ( not ( = ?auto_171546 ?auto_171547 ) ) ( not ( = ?auto_171546 ?auto_171552 ) ) ( not ( = ?auto_171548 ?auto_171547 ) ) ( not ( = ?auto_171548 ?auto_171552 ) ) ( not ( = ?auto_171547 ?auto_171552 ) ) ( ON ?auto_171547 ?auto_171548 ) ( ON-TABLE ?auto_171551 ) ( ON ?auto_171549 ?auto_171551 ) ( not ( = ?auto_171551 ?auto_171549 ) ) ( not ( = ?auto_171551 ?auto_171550 ) ) ( not ( = ?auto_171551 ?auto_171553 ) ) ( not ( = ?auto_171551 ?auto_171552 ) ) ( not ( = ?auto_171549 ?auto_171550 ) ) ( not ( = ?auto_171549 ?auto_171553 ) ) ( not ( = ?auto_171549 ?auto_171552 ) ) ( not ( = ?auto_171550 ?auto_171553 ) ) ( not ( = ?auto_171550 ?auto_171552 ) ) ( not ( = ?auto_171553 ?auto_171552 ) ) ( not ( = ?auto_171545 ?auto_171553 ) ) ( not ( = ?auto_171545 ?auto_171551 ) ) ( not ( = ?auto_171545 ?auto_171549 ) ) ( not ( = ?auto_171545 ?auto_171550 ) ) ( not ( = ?auto_171546 ?auto_171553 ) ) ( not ( = ?auto_171546 ?auto_171551 ) ) ( not ( = ?auto_171546 ?auto_171549 ) ) ( not ( = ?auto_171546 ?auto_171550 ) ) ( not ( = ?auto_171548 ?auto_171553 ) ) ( not ( = ?auto_171548 ?auto_171551 ) ) ( not ( = ?auto_171548 ?auto_171549 ) ) ( not ( = ?auto_171548 ?auto_171550 ) ) ( not ( = ?auto_171547 ?auto_171553 ) ) ( not ( = ?auto_171547 ?auto_171551 ) ) ( not ( = ?auto_171547 ?auto_171549 ) ) ( not ( = ?auto_171547 ?auto_171550 ) ) ( ON ?auto_171552 ?auto_171547 ) ( ON ?auto_171553 ?auto_171552 ) ( CLEAR ?auto_171553 ) ( HOLDING ?auto_171550 ) ( CLEAR ?auto_171549 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171551 ?auto_171549 ?auto_171550 )
      ( MAKE-2PILE ?auto_171545 ?auto_171546 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171554 - BLOCK
      ?auto_171555 - BLOCK
    )
    :vars
    (
      ?auto_171562 - BLOCK
      ?auto_171557 - BLOCK
      ?auto_171556 - BLOCK
      ?auto_171559 - BLOCK
      ?auto_171560 - BLOCK
      ?auto_171561 - BLOCK
      ?auto_171558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171562 ?auto_171555 ) ( ON-TABLE ?auto_171554 ) ( ON ?auto_171555 ?auto_171554 ) ( not ( = ?auto_171554 ?auto_171555 ) ) ( not ( = ?auto_171554 ?auto_171562 ) ) ( not ( = ?auto_171555 ?auto_171562 ) ) ( not ( = ?auto_171554 ?auto_171557 ) ) ( not ( = ?auto_171554 ?auto_171556 ) ) ( not ( = ?auto_171555 ?auto_171557 ) ) ( not ( = ?auto_171555 ?auto_171556 ) ) ( not ( = ?auto_171562 ?auto_171557 ) ) ( not ( = ?auto_171562 ?auto_171556 ) ) ( not ( = ?auto_171557 ?auto_171556 ) ) ( ON ?auto_171557 ?auto_171562 ) ( ON-TABLE ?auto_171559 ) ( ON ?auto_171560 ?auto_171559 ) ( not ( = ?auto_171559 ?auto_171560 ) ) ( not ( = ?auto_171559 ?auto_171561 ) ) ( not ( = ?auto_171559 ?auto_171558 ) ) ( not ( = ?auto_171559 ?auto_171556 ) ) ( not ( = ?auto_171560 ?auto_171561 ) ) ( not ( = ?auto_171560 ?auto_171558 ) ) ( not ( = ?auto_171560 ?auto_171556 ) ) ( not ( = ?auto_171561 ?auto_171558 ) ) ( not ( = ?auto_171561 ?auto_171556 ) ) ( not ( = ?auto_171558 ?auto_171556 ) ) ( not ( = ?auto_171554 ?auto_171558 ) ) ( not ( = ?auto_171554 ?auto_171559 ) ) ( not ( = ?auto_171554 ?auto_171560 ) ) ( not ( = ?auto_171554 ?auto_171561 ) ) ( not ( = ?auto_171555 ?auto_171558 ) ) ( not ( = ?auto_171555 ?auto_171559 ) ) ( not ( = ?auto_171555 ?auto_171560 ) ) ( not ( = ?auto_171555 ?auto_171561 ) ) ( not ( = ?auto_171562 ?auto_171558 ) ) ( not ( = ?auto_171562 ?auto_171559 ) ) ( not ( = ?auto_171562 ?auto_171560 ) ) ( not ( = ?auto_171562 ?auto_171561 ) ) ( not ( = ?auto_171557 ?auto_171558 ) ) ( not ( = ?auto_171557 ?auto_171559 ) ) ( not ( = ?auto_171557 ?auto_171560 ) ) ( not ( = ?auto_171557 ?auto_171561 ) ) ( ON ?auto_171556 ?auto_171557 ) ( ON ?auto_171558 ?auto_171556 ) ( CLEAR ?auto_171560 ) ( ON ?auto_171561 ?auto_171558 ) ( CLEAR ?auto_171561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171554 ?auto_171555 ?auto_171562 ?auto_171557 ?auto_171556 ?auto_171558 )
      ( MAKE-2PILE ?auto_171554 ?auto_171555 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171563 - BLOCK
      ?auto_171564 - BLOCK
    )
    :vars
    (
      ?auto_171565 - BLOCK
      ?auto_171567 - BLOCK
      ?auto_171566 - BLOCK
      ?auto_171569 - BLOCK
      ?auto_171568 - BLOCK
      ?auto_171570 - BLOCK
      ?auto_171571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171565 ?auto_171564 ) ( ON-TABLE ?auto_171563 ) ( ON ?auto_171564 ?auto_171563 ) ( not ( = ?auto_171563 ?auto_171564 ) ) ( not ( = ?auto_171563 ?auto_171565 ) ) ( not ( = ?auto_171564 ?auto_171565 ) ) ( not ( = ?auto_171563 ?auto_171567 ) ) ( not ( = ?auto_171563 ?auto_171566 ) ) ( not ( = ?auto_171564 ?auto_171567 ) ) ( not ( = ?auto_171564 ?auto_171566 ) ) ( not ( = ?auto_171565 ?auto_171567 ) ) ( not ( = ?auto_171565 ?auto_171566 ) ) ( not ( = ?auto_171567 ?auto_171566 ) ) ( ON ?auto_171567 ?auto_171565 ) ( ON-TABLE ?auto_171569 ) ( not ( = ?auto_171569 ?auto_171568 ) ) ( not ( = ?auto_171569 ?auto_171570 ) ) ( not ( = ?auto_171569 ?auto_171571 ) ) ( not ( = ?auto_171569 ?auto_171566 ) ) ( not ( = ?auto_171568 ?auto_171570 ) ) ( not ( = ?auto_171568 ?auto_171571 ) ) ( not ( = ?auto_171568 ?auto_171566 ) ) ( not ( = ?auto_171570 ?auto_171571 ) ) ( not ( = ?auto_171570 ?auto_171566 ) ) ( not ( = ?auto_171571 ?auto_171566 ) ) ( not ( = ?auto_171563 ?auto_171571 ) ) ( not ( = ?auto_171563 ?auto_171569 ) ) ( not ( = ?auto_171563 ?auto_171568 ) ) ( not ( = ?auto_171563 ?auto_171570 ) ) ( not ( = ?auto_171564 ?auto_171571 ) ) ( not ( = ?auto_171564 ?auto_171569 ) ) ( not ( = ?auto_171564 ?auto_171568 ) ) ( not ( = ?auto_171564 ?auto_171570 ) ) ( not ( = ?auto_171565 ?auto_171571 ) ) ( not ( = ?auto_171565 ?auto_171569 ) ) ( not ( = ?auto_171565 ?auto_171568 ) ) ( not ( = ?auto_171565 ?auto_171570 ) ) ( not ( = ?auto_171567 ?auto_171571 ) ) ( not ( = ?auto_171567 ?auto_171569 ) ) ( not ( = ?auto_171567 ?auto_171568 ) ) ( not ( = ?auto_171567 ?auto_171570 ) ) ( ON ?auto_171566 ?auto_171567 ) ( ON ?auto_171571 ?auto_171566 ) ( ON ?auto_171570 ?auto_171571 ) ( CLEAR ?auto_171570 ) ( HOLDING ?auto_171568 ) ( CLEAR ?auto_171569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171569 ?auto_171568 )
      ( MAKE-2PILE ?auto_171563 ?auto_171564 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171572 - BLOCK
      ?auto_171573 - BLOCK
    )
    :vars
    (
      ?auto_171580 - BLOCK
      ?auto_171577 - BLOCK
      ?auto_171578 - BLOCK
      ?auto_171574 - BLOCK
      ?auto_171579 - BLOCK
      ?auto_171575 - BLOCK
      ?auto_171576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171580 ?auto_171573 ) ( ON-TABLE ?auto_171572 ) ( ON ?auto_171573 ?auto_171572 ) ( not ( = ?auto_171572 ?auto_171573 ) ) ( not ( = ?auto_171572 ?auto_171580 ) ) ( not ( = ?auto_171573 ?auto_171580 ) ) ( not ( = ?auto_171572 ?auto_171577 ) ) ( not ( = ?auto_171572 ?auto_171578 ) ) ( not ( = ?auto_171573 ?auto_171577 ) ) ( not ( = ?auto_171573 ?auto_171578 ) ) ( not ( = ?auto_171580 ?auto_171577 ) ) ( not ( = ?auto_171580 ?auto_171578 ) ) ( not ( = ?auto_171577 ?auto_171578 ) ) ( ON ?auto_171577 ?auto_171580 ) ( ON-TABLE ?auto_171574 ) ( not ( = ?auto_171574 ?auto_171579 ) ) ( not ( = ?auto_171574 ?auto_171575 ) ) ( not ( = ?auto_171574 ?auto_171576 ) ) ( not ( = ?auto_171574 ?auto_171578 ) ) ( not ( = ?auto_171579 ?auto_171575 ) ) ( not ( = ?auto_171579 ?auto_171576 ) ) ( not ( = ?auto_171579 ?auto_171578 ) ) ( not ( = ?auto_171575 ?auto_171576 ) ) ( not ( = ?auto_171575 ?auto_171578 ) ) ( not ( = ?auto_171576 ?auto_171578 ) ) ( not ( = ?auto_171572 ?auto_171576 ) ) ( not ( = ?auto_171572 ?auto_171574 ) ) ( not ( = ?auto_171572 ?auto_171579 ) ) ( not ( = ?auto_171572 ?auto_171575 ) ) ( not ( = ?auto_171573 ?auto_171576 ) ) ( not ( = ?auto_171573 ?auto_171574 ) ) ( not ( = ?auto_171573 ?auto_171579 ) ) ( not ( = ?auto_171573 ?auto_171575 ) ) ( not ( = ?auto_171580 ?auto_171576 ) ) ( not ( = ?auto_171580 ?auto_171574 ) ) ( not ( = ?auto_171580 ?auto_171579 ) ) ( not ( = ?auto_171580 ?auto_171575 ) ) ( not ( = ?auto_171577 ?auto_171576 ) ) ( not ( = ?auto_171577 ?auto_171574 ) ) ( not ( = ?auto_171577 ?auto_171579 ) ) ( not ( = ?auto_171577 ?auto_171575 ) ) ( ON ?auto_171578 ?auto_171577 ) ( ON ?auto_171576 ?auto_171578 ) ( ON ?auto_171575 ?auto_171576 ) ( CLEAR ?auto_171574 ) ( ON ?auto_171579 ?auto_171575 ) ( CLEAR ?auto_171579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171572 ?auto_171573 ?auto_171580 ?auto_171577 ?auto_171578 ?auto_171576 ?auto_171575 )
      ( MAKE-2PILE ?auto_171572 ?auto_171573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171581 - BLOCK
      ?auto_171582 - BLOCK
    )
    :vars
    (
      ?auto_171586 - BLOCK
      ?auto_171585 - BLOCK
      ?auto_171587 - BLOCK
      ?auto_171589 - BLOCK
      ?auto_171588 - BLOCK
      ?auto_171583 - BLOCK
      ?auto_171584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171586 ?auto_171582 ) ( ON-TABLE ?auto_171581 ) ( ON ?auto_171582 ?auto_171581 ) ( not ( = ?auto_171581 ?auto_171582 ) ) ( not ( = ?auto_171581 ?auto_171586 ) ) ( not ( = ?auto_171582 ?auto_171586 ) ) ( not ( = ?auto_171581 ?auto_171585 ) ) ( not ( = ?auto_171581 ?auto_171587 ) ) ( not ( = ?auto_171582 ?auto_171585 ) ) ( not ( = ?auto_171582 ?auto_171587 ) ) ( not ( = ?auto_171586 ?auto_171585 ) ) ( not ( = ?auto_171586 ?auto_171587 ) ) ( not ( = ?auto_171585 ?auto_171587 ) ) ( ON ?auto_171585 ?auto_171586 ) ( not ( = ?auto_171589 ?auto_171588 ) ) ( not ( = ?auto_171589 ?auto_171583 ) ) ( not ( = ?auto_171589 ?auto_171584 ) ) ( not ( = ?auto_171589 ?auto_171587 ) ) ( not ( = ?auto_171588 ?auto_171583 ) ) ( not ( = ?auto_171588 ?auto_171584 ) ) ( not ( = ?auto_171588 ?auto_171587 ) ) ( not ( = ?auto_171583 ?auto_171584 ) ) ( not ( = ?auto_171583 ?auto_171587 ) ) ( not ( = ?auto_171584 ?auto_171587 ) ) ( not ( = ?auto_171581 ?auto_171584 ) ) ( not ( = ?auto_171581 ?auto_171589 ) ) ( not ( = ?auto_171581 ?auto_171588 ) ) ( not ( = ?auto_171581 ?auto_171583 ) ) ( not ( = ?auto_171582 ?auto_171584 ) ) ( not ( = ?auto_171582 ?auto_171589 ) ) ( not ( = ?auto_171582 ?auto_171588 ) ) ( not ( = ?auto_171582 ?auto_171583 ) ) ( not ( = ?auto_171586 ?auto_171584 ) ) ( not ( = ?auto_171586 ?auto_171589 ) ) ( not ( = ?auto_171586 ?auto_171588 ) ) ( not ( = ?auto_171586 ?auto_171583 ) ) ( not ( = ?auto_171585 ?auto_171584 ) ) ( not ( = ?auto_171585 ?auto_171589 ) ) ( not ( = ?auto_171585 ?auto_171588 ) ) ( not ( = ?auto_171585 ?auto_171583 ) ) ( ON ?auto_171587 ?auto_171585 ) ( ON ?auto_171584 ?auto_171587 ) ( ON ?auto_171583 ?auto_171584 ) ( ON ?auto_171588 ?auto_171583 ) ( CLEAR ?auto_171588 ) ( HOLDING ?auto_171589 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171589 )
      ( MAKE-2PILE ?auto_171581 ?auto_171582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171590 - BLOCK
      ?auto_171591 - BLOCK
    )
    :vars
    (
      ?auto_171592 - BLOCK
      ?auto_171597 - BLOCK
      ?auto_171595 - BLOCK
      ?auto_171593 - BLOCK
      ?auto_171596 - BLOCK
      ?auto_171594 - BLOCK
      ?auto_171598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171592 ?auto_171591 ) ( ON-TABLE ?auto_171590 ) ( ON ?auto_171591 ?auto_171590 ) ( not ( = ?auto_171590 ?auto_171591 ) ) ( not ( = ?auto_171590 ?auto_171592 ) ) ( not ( = ?auto_171591 ?auto_171592 ) ) ( not ( = ?auto_171590 ?auto_171597 ) ) ( not ( = ?auto_171590 ?auto_171595 ) ) ( not ( = ?auto_171591 ?auto_171597 ) ) ( not ( = ?auto_171591 ?auto_171595 ) ) ( not ( = ?auto_171592 ?auto_171597 ) ) ( not ( = ?auto_171592 ?auto_171595 ) ) ( not ( = ?auto_171597 ?auto_171595 ) ) ( ON ?auto_171597 ?auto_171592 ) ( not ( = ?auto_171593 ?auto_171596 ) ) ( not ( = ?auto_171593 ?auto_171594 ) ) ( not ( = ?auto_171593 ?auto_171598 ) ) ( not ( = ?auto_171593 ?auto_171595 ) ) ( not ( = ?auto_171596 ?auto_171594 ) ) ( not ( = ?auto_171596 ?auto_171598 ) ) ( not ( = ?auto_171596 ?auto_171595 ) ) ( not ( = ?auto_171594 ?auto_171598 ) ) ( not ( = ?auto_171594 ?auto_171595 ) ) ( not ( = ?auto_171598 ?auto_171595 ) ) ( not ( = ?auto_171590 ?auto_171598 ) ) ( not ( = ?auto_171590 ?auto_171593 ) ) ( not ( = ?auto_171590 ?auto_171596 ) ) ( not ( = ?auto_171590 ?auto_171594 ) ) ( not ( = ?auto_171591 ?auto_171598 ) ) ( not ( = ?auto_171591 ?auto_171593 ) ) ( not ( = ?auto_171591 ?auto_171596 ) ) ( not ( = ?auto_171591 ?auto_171594 ) ) ( not ( = ?auto_171592 ?auto_171598 ) ) ( not ( = ?auto_171592 ?auto_171593 ) ) ( not ( = ?auto_171592 ?auto_171596 ) ) ( not ( = ?auto_171592 ?auto_171594 ) ) ( not ( = ?auto_171597 ?auto_171598 ) ) ( not ( = ?auto_171597 ?auto_171593 ) ) ( not ( = ?auto_171597 ?auto_171596 ) ) ( not ( = ?auto_171597 ?auto_171594 ) ) ( ON ?auto_171595 ?auto_171597 ) ( ON ?auto_171598 ?auto_171595 ) ( ON ?auto_171594 ?auto_171598 ) ( ON ?auto_171596 ?auto_171594 ) ( ON ?auto_171593 ?auto_171596 ) ( CLEAR ?auto_171593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171590 ?auto_171591 ?auto_171592 ?auto_171597 ?auto_171595 ?auto_171598 ?auto_171594 ?auto_171596 )
      ( MAKE-2PILE ?auto_171590 ?auto_171591 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171606 - BLOCK
      ?auto_171607 - BLOCK
      ?auto_171608 - BLOCK
      ?auto_171609 - BLOCK
      ?auto_171610 - BLOCK
      ?auto_171611 - BLOCK
      ?auto_171612 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_171612 ) ( CLEAR ?auto_171611 ) ( ON-TABLE ?auto_171606 ) ( ON ?auto_171607 ?auto_171606 ) ( ON ?auto_171608 ?auto_171607 ) ( ON ?auto_171609 ?auto_171608 ) ( ON ?auto_171610 ?auto_171609 ) ( ON ?auto_171611 ?auto_171610 ) ( not ( = ?auto_171606 ?auto_171607 ) ) ( not ( = ?auto_171606 ?auto_171608 ) ) ( not ( = ?auto_171606 ?auto_171609 ) ) ( not ( = ?auto_171606 ?auto_171610 ) ) ( not ( = ?auto_171606 ?auto_171611 ) ) ( not ( = ?auto_171606 ?auto_171612 ) ) ( not ( = ?auto_171607 ?auto_171608 ) ) ( not ( = ?auto_171607 ?auto_171609 ) ) ( not ( = ?auto_171607 ?auto_171610 ) ) ( not ( = ?auto_171607 ?auto_171611 ) ) ( not ( = ?auto_171607 ?auto_171612 ) ) ( not ( = ?auto_171608 ?auto_171609 ) ) ( not ( = ?auto_171608 ?auto_171610 ) ) ( not ( = ?auto_171608 ?auto_171611 ) ) ( not ( = ?auto_171608 ?auto_171612 ) ) ( not ( = ?auto_171609 ?auto_171610 ) ) ( not ( = ?auto_171609 ?auto_171611 ) ) ( not ( = ?auto_171609 ?auto_171612 ) ) ( not ( = ?auto_171610 ?auto_171611 ) ) ( not ( = ?auto_171610 ?auto_171612 ) ) ( not ( = ?auto_171611 ?auto_171612 ) ) )
    :subtasks
    ( ( !STACK ?auto_171612 ?auto_171611 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171613 - BLOCK
      ?auto_171614 - BLOCK
      ?auto_171615 - BLOCK
      ?auto_171616 - BLOCK
      ?auto_171617 - BLOCK
      ?auto_171618 - BLOCK
      ?auto_171619 - BLOCK
    )
    :vars
    (
      ?auto_171620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171618 ) ( ON-TABLE ?auto_171613 ) ( ON ?auto_171614 ?auto_171613 ) ( ON ?auto_171615 ?auto_171614 ) ( ON ?auto_171616 ?auto_171615 ) ( ON ?auto_171617 ?auto_171616 ) ( ON ?auto_171618 ?auto_171617 ) ( not ( = ?auto_171613 ?auto_171614 ) ) ( not ( = ?auto_171613 ?auto_171615 ) ) ( not ( = ?auto_171613 ?auto_171616 ) ) ( not ( = ?auto_171613 ?auto_171617 ) ) ( not ( = ?auto_171613 ?auto_171618 ) ) ( not ( = ?auto_171613 ?auto_171619 ) ) ( not ( = ?auto_171614 ?auto_171615 ) ) ( not ( = ?auto_171614 ?auto_171616 ) ) ( not ( = ?auto_171614 ?auto_171617 ) ) ( not ( = ?auto_171614 ?auto_171618 ) ) ( not ( = ?auto_171614 ?auto_171619 ) ) ( not ( = ?auto_171615 ?auto_171616 ) ) ( not ( = ?auto_171615 ?auto_171617 ) ) ( not ( = ?auto_171615 ?auto_171618 ) ) ( not ( = ?auto_171615 ?auto_171619 ) ) ( not ( = ?auto_171616 ?auto_171617 ) ) ( not ( = ?auto_171616 ?auto_171618 ) ) ( not ( = ?auto_171616 ?auto_171619 ) ) ( not ( = ?auto_171617 ?auto_171618 ) ) ( not ( = ?auto_171617 ?auto_171619 ) ) ( not ( = ?auto_171618 ?auto_171619 ) ) ( ON ?auto_171619 ?auto_171620 ) ( CLEAR ?auto_171619 ) ( HAND-EMPTY ) ( not ( = ?auto_171613 ?auto_171620 ) ) ( not ( = ?auto_171614 ?auto_171620 ) ) ( not ( = ?auto_171615 ?auto_171620 ) ) ( not ( = ?auto_171616 ?auto_171620 ) ) ( not ( = ?auto_171617 ?auto_171620 ) ) ( not ( = ?auto_171618 ?auto_171620 ) ) ( not ( = ?auto_171619 ?auto_171620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171619 ?auto_171620 )
      ( MAKE-7PILE ?auto_171613 ?auto_171614 ?auto_171615 ?auto_171616 ?auto_171617 ?auto_171618 ?auto_171619 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171621 - BLOCK
      ?auto_171622 - BLOCK
      ?auto_171623 - BLOCK
      ?auto_171624 - BLOCK
      ?auto_171625 - BLOCK
      ?auto_171626 - BLOCK
      ?auto_171627 - BLOCK
    )
    :vars
    (
      ?auto_171628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171621 ) ( ON ?auto_171622 ?auto_171621 ) ( ON ?auto_171623 ?auto_171622 ) ( ON ?auto_171624 ?auto_171623 ) ( ON ?auto_171625 ?auto_171624 ) ( not ( = ?auto_171621 ?auto_171622 ) ) ( not ( = ?auto_171621 ?auto_171623 ) ) ( not ( = ?auto_171621 ?auto_171624 ) ) ( not ( = ?auto_171621 ?auto_171625 ) ) ( not ( = ?auto_171621 ?auto_171626 ) ) ( not ( = ?auto_171621 ?auto_171627 ) ) ( not ( = ?auto_171622 ?auto_171623 ) ) ( not ( = ?auto_171622 ?auto_171624 ) ) ( not ( = ?auto_171622 ?auto_171625 ) ) ( not ( = ?auto_171622 ?auto_171626 ) ) ( not ( = ?auto_171622 ?auto_171627 ) ) ( not ( = ?auto_171623 ?auto_171624 ) ) ( not ( = ?auto_171623 ?auto_171625 ) ) ( not ( = ?auto_171623 ?auto_171626 ) ) ( not ( = ?auto_171623 ?auto_171627 ) ) ( not ( = ?auto_171624 ?auto_171625 ) ) ( not ( = ?auto_171624 ?auto_171626 ) ) ( not ( = ?auto_171624 ?auto_171627 ) ) ( not ( = ?auto_171625 ?auto_171626 ) ) ( not ( = ?auto_171625 ?auto_171627 ) ) ( not ( = ?auto_171626 ?auto_171627 ) ) ( ON ?auto_171627 ?auto_171628 ) ( CLEAR ?auto_171627 ) ( not ( = ?auto_171621 ?auto_171628 ) ) ( not ( = ?auto_171622 ?auto_171628 ) ) ( not ( = ?auto_171623 ?auto_171628 ) ) ( not ( = ?auto_171624 ?auto_171628 ) ) ( not ( = ?auto_171625 ?auto_171628 ) ) ( not ( = ?auto_171626 ?auto_171628 ) ) ( not ( = ?auto_171627 ?auto_171628 ) ) ( HOLDING ?auto_171626 ) ( CLEAR ?auto_171625 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171621 ?auto_171622 ?auto_171623 ?auto_171624 ?auto_171625 ?auto_171626 )
      ( MAKE-7PILE ?auto_171621 ?auto_171622 ?auto_171623 ?auto_171624 ?auto_171625 ?auto_171626 ?auto_171627 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171629 - BLOCK
      ?auto_171630 - BLOCK
      ?auto_171631 - BLOCK
      ?auto_171632 - BLOCK
      ?auto_171633 - BLOCK
      ?auto_171634 - BLOCK
      ?auto_171635 - BLOCK
    )
    :vars
    (
      ?auto_171636 - BLOCK
      ?auto_171637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171629 ) ( ON ?auto_171630 ?auto_171629 ) ( ON ?auto_171631 ?auto_171630 ) ( ON ?auto_171632 ?auto_171631 ) ( ON ?auto_171633 ?auto_171632 ) ( not ( = ?auto_171629 ?auto_171630 ) ) ( not ( = ?auto_171629 ?auto_171631 ) ) ( not ( = ?auto_171629 ?auto_171632 ) ) ( not ( = ?auto_171629 ?auto_171633 ) ) ( not ( = ?auto_171629 ?auto_171634 ) ) ( not ( = ?auto_171629 ?auto_171635 ) ) ( not ( = ?auto_171630 ?auto_171631 ) ) ( not ( = ?auto_171630 ?auto_171632 ) ) ( not ( = ?auto_171630 ?auto_171633 ) ) ( not ( = ?auto_171630 ?auto_171634 ) ) ( not ( = ?auto_171630 ?auto_171635 ) ) ( not ( = ?auto_171631 ?auto_171632 ) ) ( not ( = ?auto_171631 ?auto_171633 ) ) ( not ( = ?auto_171631 ?auto_171634 ) ) ( not ( = ?auto_171631 ?auto_171635 ) ) ( not ( = ?auto_171632 ?auto_171633 ) ) ( not ( = ?auto_171632 ?auto_171634 ) ) ( not ( = ?auto_171632 ?auto_171635 ) ) ( not ( = ?auto_171633 ?auto_171634 ) ) ( not ( = ?auto_171633 ?auto_171635 ) ) ( not ( = ?auto_171634 ?auto_171635 ) ) ( ON ?auto_171635 ?auto_171636 ) ( not ( = ?auto_171629 ?auto_171636 ) ) ( not ( = ?auto_171630 ?auto_171636 ) ) ( not ( = ?auto_171631 ?auto_171636 ) ) ( not ( = ?auto_171632 ?auto_171636 ) ) ( not ( = ?auto_171633 ?auto_171636 ) ) ( not ( = ?auto_171634 ?auto_171636 ) ) ( not ( = ?auto_171635 ?auto_171636 ) ) ( CLEAR ?auto_171633 ) ( ON ?auto_171634 ?auto_171635 ) ( CLEAR ?auto_171634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171637 ) ( ON ?auto_171636 ?auto_171637 ) ( not ( = ?auto_171637 ?auto_171636 ) ) ( not ( = ?auto_171637 ?auto_171635 ) ) ( not ( = ?auto_171637 ?auto_171634 ) ) ( not ( = ?auto_171629 ?auto_171637 ) ) ( not ( = ?auto_171630 ?auto_171637 ) ) ( not ( = ?auto_171631 ?auto_171637 ) ) ( not ( = ?auto_171632 ?auto_171637 ) ) ( not ( = ?auto_171633 ?auto_171637 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171637 ?auto_171636 ?auto_171635 )
      ( MAKE-7PILE ?auto_171629 ?auto_171630 ?auto_171631 ?auto_171632 ?auto_171633 ?auto_171634 ?auto_171635 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171638 - BLOCK
      ?auto_171639 - BLOCK
      ?auto_171640 - BLOCK
      ?auto_171641 - BLOCK
      ?auto_171642 - BLOCK
      ?auto_171643 - BLOCK
      ?auto_171644 - BLOCK
    )
    :vars
    (
      ?auto_171646 - BLOCK
      ?auto_171645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171638 ) ( ON ?auto_171639 ?auto_171638 ) ( ON ?auto_171640 ?auto_171639 ) ( ON ?auto_171641 ?auto_171640 ) ( not ( = ?auto_171638 ?auto_171639 ) ) ( not ( = ?auto_171638 ?auto_171640 ) ) ( not ( = ?auto_171638 ?auto_171641 ) ) ( not ( = ?auto_171638 ?auto_171642 ) ) ( not ( = ?auto_171638 ?auto_171643 ) ) ( not ( = ?auto_171638 ?auto_171644 ) ) ( not ( = ?auto_171639 ?auto_171640 ) ) ( not ( = ?auto_171639 ?auto_171641 ) ) ( not ( = ?auto_171639 ?auto_171642 ) ) ( not ( = ?auto_171639 ?auto_171643 ) ) ( not ( = ?auto_171639 ?auto_171644 ) ) ( not ( = ?auto_171640 ?auto_171641 ) ) ( not ( = ?auto_171640 ?auto_171642 ) ) ( not ( = ?auto_171640 ?auto_171643 ) ) ( not ( = ?auto_171640 ?auto_171644 ) ) ( not ( = ?auto_171641 ?auto_171642 ) ) ( not ( = ?auto_171641 ?auto_171643 ) ) ( not ( = ?auto_171641 ?auto_171644 ) ) ( not ( = ?auto_171642 ?auto_171643 ) ) ( not ( = ?auto_171642 ?auto_171644 ) ) ( not ( = ?auto_171643 ?auto_171644 ) ) ( ON ?auto_171644 ?auto_171646 ) ( not ( = ?auto_171638 ?auto_171646 ) ) ( not ( = ?auto_171639 ?auto_171646 ) ) ( not ( = ?auto_171640 ?auto_171646 ) ) ( not ( = ?auto_171641 ?auto_171646 ) ) ( not ( = ?auto_171642 ?auto_171646 ) ) ( not ( = ?auto_171643 ?auto_171646 ) ) ( not ( = ?auto_171644 ?auto_171646 ) ) ( ON ?auto_171643 ?auto_171644 ) ( CLEAR ?auto_171643 ) ( ON-TABLE ?auto_171645 ) ( ON ?auto_171646 ?auto_171645 ) ( not ( = ?auto_171645 ?auto_171646 ) ) ( not ( = ?auto_171645 ?auto_171644 ) ) ( not ( = ?auto_171645 ?auto_171643 ) ) ( not ( = ?auto_171638 ?auto_171645 ) ) ( not ( = ?auto_171639 ?auto_171645 ) ) ( not ( = ?auto_171640 ?auto_171645 ) ) ( not ( = ?auto_171641 ?auto_171645 ) ) ( not ( = ?auto_171642 ?auto_171645 ) ) ( HOLDING ?auto_171642 ) ( CLEAR ?auto_171641 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171638 ?auto_171639 ?auto_171640 ?auto_171641 ?auto_171642 )
      ( MAKE-7PILE ?auto_171638 ?auto_171639 ?auto_171640 ?auto_171641 ?auto_171642 ?auto_171643 ?auto_171644 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171647 - BLOCK
      ?auto_171648 - BLOCK
      ?auto_171649 - BLOCK
      ?auto_171650 - BLOCK
      ?auto_171651 - BLOCK
      ?auto_171652 - BLOCK
      ?auto_171653 - BLOCK
    )
    :vars
    (
      ?auto_171655 - BLOCK
      ?auto_171654 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171647 ) ( ON ?auto_171648 ?auto_171647 ) ( ON ?auto_171649 ?auto_171648 ) ( ON ?auto_171650 ?auto_171649 ) ( not ( = ?auto_171647 ?auto_171648 ) ) ( not ( = ?auto_171647 ?auto_171649 ) ) ( not ( = ?auto_171647 ?auto_171650 ) ) ( not ( = ?auto_171647 ?auto_171651 ) ) ( not ( = ?auto_171647 ?auto_171652 ) ) ( not ( = ?auto_171647 ?auto_171653 ) ) ( not ( = ?auto_171648 ?auto_171649 ) ) ( not ( = ?auto_171648 ?auto_171650 ) ) ( not ( = ?auto_171648 ?auto_171651 ) ) ( not ( = ?auto_171648 ?auto_171652 ) ) ( not ( = ?auto_171648 ?auto_171653 ) ) ( not ( = ?auto_171649 ?auto_171650 ) ) ( not ( = ?auto_171649 ?auto_171651 ) ) ( not ( = ?auto_171649 ?auto_171652 ) ) ( not ( = ?auto_171649 ?auto_171653 ) ) ( not ( = ?auto_171650 ?auto_171651 ) ) ( not ( = ?auto_171650 ?auto_171652 ) ) ( not ( = ?auto_171650 ?auto_171653 ) ) ( not ( = ?auto_171651 ?auto_171652 ) ) ( not ( = ?auto_171651 ?auto_171653 ) ) ( not ( = ?auto_171652 ?auto_171653 ) ) ( ON ?auto_171653 ?auto_171655 ) ( not ( = ?auto_171647 ?auto_171655 ) ) ( not ( = ?auto_171648 ?auto_171655 ) ) ( not ( = ?auto_171649 ?auto_171655 ) ) ( not ( = ?auto_171650 ?auto_171655 ) ) ( not ( = ?auto_171651 ?auto_171655 ) ) ( not ( = ?auto_171652 ?auto_171655 ) ) ( not ( = ?auto_171653 ?auto_171655 ) ) ( ON ?auto_171652 ?auto_171653 ) ( ON-TABLE ?auto_171654 ) ( ON ?auto_171655 ?auto_171654 ) ( not ( = ?auto_171654 ?auto_171655 ) ) ( not ( = ?auto_171654 ?auto_171653 ) ) ( not ( = ?auto_171654 ?auto_171652 ) ) ( not ( = ?auto_171647 ?auto_171654 ) ) ( not ( = ?auto_171648 ?auto_171654 ) ) ( not ( = ?auto_171649 ?auto_171654 ) ) ( not ( = ?auto_171650 ?auto_171654 ) ) ( not ( = ?auto_171651 ?auto_171654 ) ) ( CLEAR ?auto_171650 ) ( ON ?auto_171651 ?auto_171652 ) ( CLEAR ?auto_171651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171654 ?auto_171655 ?auto_171653 ?auto_171652 )
      ( MAKE-7PILE ?auto_171647 ?auto_171648 ?auto_171649 ?auto_171650 ?auto_171651 ?auto_171652 ?auto_171653 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171656 - BLOCK
      ?auto_171657 - BLOCK
      ?auto_171658 - BLOCK
      ?auto_171659 - BLOCK
      ?auto_171660 - BLOCK
      ?auto_171661 - BLOCK
      ?auto_171662 - BLOCK
    )
    :vars
    (
      ?auto_171663 - BLOCK
      ?auto_171664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171656 ) ( ON ?auto_171657 ?auto_171656 ) ( ON ?auto_171658 ?auto_171657 ) ( not ( = ?auto_171656 ?auto_171657 ) ) ( not ( = ?auto_171656 ?auto_171658 ) ) ( not ( = ?auto_171656 ?auto_171659 ) ) ( not ( = ?auto_171656 ?auto_171660 ) ) ( not ( = ?auto_171656 ?auto_171661 ) ) ( not ( = ?auto_171656 ?auto_171662 ) ) ( not ( = ?auto_171657 ?auto_171658 ) ) ( not ( = ?auto_171657 ?auto_171659 ) ) ( not ( = ?auto_171657 ?auto_171660 ) ) ( not ( = ?auto_171657 ?auto_171661 ) ) ( not ( = ?auto_171657 ?auto_171662 ) ) ( not ( = ?auto_171658 ?auto_171659 ) ) ( not ( = ?auto_171658 ?auto_171660 ) ) ( not ( = ?auto_171658 ?auto_171661 ) ) ( not ( = ?auto_171658 ?auto_171662 ) ) ( not ( = ?auto_171659 ?auto_171660 ) ) ( not ( = ?auto_171659 ?auto_171661 ) ) ( not ( = ?auto_171659 ?auto_171662 ) ) ( not ( = ?auto_171660 ?auto_171661 ) ) ( not ( = ?auto_171660 ?auto_171662 ) ) ( not ( = ?auto_171661 ?auto_171662 ) ) ( ON ?auto_171662 ?auto_171663 ) ( not ( = ?auto_171656 ?auto_171663 ) ) ( not ( = ?auto_171657 ?auto_171663 ) ) ( not ( = ?auto_171658 ?auto_171663 ) ) ( not ( = ?auto_171659 ?auto_171663 ) ) ( not ( = ?auto_171660 ?auto_171663 ) ) ( not ( = ?auto_171661 ?auto_171663 ) ) ( not ( = ?auto_171662 ?auto_171663 ) ) ( ON ?auto_171661 ?auto_171662 ) ( ON-TABLE ?auto_171664 ) ( ON ?auto_171663 ?auto_171664 ) ( not ( = ?auto_171664 ?auto_171663 ) ) ( not ( = ?auto_171664 ?auto_171662 ) ) ( not ( = ?auto_171664 ?auto_171661 ) ) ( not ( = ?auto_171656 ?auto_171664 ) ) ( not ( = ?auto_171657 ?auto_171664 ) ) ( not ( = ?auto_171658 ?auto_171664 ) ) ( not ( = ?auto_171659 ?auto_171664 ) ) ( not ( = ?auto_171660 ?auto_171664 ) ) ( ON ?auto_171660 ?auto_171661 ) ( CLEAR ?auto_171660 ) ( HOLDING ?auto_171659 ) ( CLEAR ?auto_171658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171656 ?auto_171657 ?auto_171658 ?auto_171659 )
      ( MAKE-7PILE ?auto_171656 ?auto_171657 ?auto_171658 ?auto_171659 ?auto_171660 ?auto_171661 ?auto_171662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171665 - BLOCK
      ?auto_171666 - BLOCK
      ?auto_171667 - BLOCK
      ?auto_171668 - BLOCK
      ?auto_171669 - BLOCK
      ?auto_171670 - BLOCK
      ?auto_171671 - BLOCK
    )
    :vars
    (
      ?auto_171673 - BLOCK
      ?auto_171672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171665 ) ( ON ?auto_171666 ?auto_171665 ) ( ON ?auto_171667 ?auto_171666 ) ( not ( = ?auto_171665 ?auto_171666 ) ) ( not ( = ?auto_171665 ?auto_171667 ) ) ( not ( = ?auto_171665 ?auto_171668 ) ) ( not ( = ?auto_171665 ?auto_171669 ) ) ( not ( = ?auto_171665 ?auto_171670 ) ) ( not ( = ?auto_171665 ?auto_171671 ) ) ( not ( = ?auto_171666 ?auto_171667 ) ) ( not ( = ?auto_171666 ?auto_171668 ) ) ( not ( = ?auto_171666 ?auto_171669 ) ) ( not ( = ?auto_171666 ?auto_171670 ) ) ( not ( = ?auto_171666 ?auto_171671 ) ) ( not ( = ?auto_171667 ?auto_171668 ) ) ( not ( = ?auto_171667 ?auto_171669 ) ) ( not ( = ?auto_171667 ?auto_171670 ) ) ( not ( = ?auto_171667 ?auto_171671 ) ) ( not ( = ?auto_171668 ?auto_171669 ) ) ( not ( = ?auto_171668 ?auto_171670 ) ) ( not ( = ?auto_171668 ?auto_171671 ) ) ( not ( = ?auto_171669 ?auto_171670 ) ) ( not ( = ?auto_171669 ?auto_171671 ) ) ( not ( = ?auto_171670 ?auto_171671 ) ) ( ON ?auto_171671 ?auto_171673 ) ( not ( = ?auto_171665 ?auto_171673 ) ) ( not ( = ?auto_171666 ?auto_171673 ) ) ( not ( = ?auto_171667 ?auto_171673 ) ) ( not ( = ?auto_171668 ?auto_171673 ) ) ( not ( = ?auto_171669 ?auto_171673 ) ) ( not ( = ?auto_171670 ?auto_171673 ) ) ( not ( = ?auto_171671 ?auto_171673 ) ) ( ON ?auto_171670 ?auto_171671 ) ( ON-TABLE ?auto_171672 ) ( ON ?auto_171673 ?auto_171672 ) ( not ( = ?auto_171672 ?auto_171673 ) ) ( not ( = ?auto_171672 ?auto_171671 ) ) ( not ( = ?auto_171672 ?auto_171670 ) ) ( not ( = ?auto_171665 ?auto_171672 ) ) ( not ( = ?auto_171666 ?auto_171672 ) ) ( not ( = ?auto_171667 ?auto_171672 ) ) ( not ( = ?auto_171668 ?auto_171672 ) ) ( not ( = ?auto_171669 ?auto_171672 ) ) ( ON ?auto_171669 ?auto_171670 ) ( CLEAR ?auto_171667 ) ( ON ?auto_171668 ?auto_171669 ) ( CLEAR ?auto_171668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171672 ?auto_171673 ?auto_171671 ?auto_171670 ?auto_171669 )
      ( MAKE-7PILE ?auto_171665 ?auto_171666 ?auto_171667 ?auto_171668 ?auto_171669 ?auto_171670 ?auto_171671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171674 - BLOCK
      ?auto_171675 - BLOCK
      ?auto_171676 - BLOCK
      ?auto_171677 - BLOCK
      ?auto_171678 - BLOCK
      ?auto_171679 - BLOCK
      ?auto_171680 - BLOCK
    )
    :vars
    (
      ?auto_171682 - BLOCK
      ?auto_171681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171674 ) ( ON ?auto_171675 ?auto_171674 ) ( not ( = ?auto_171674 ?auto_171675 ) ) ( not ( = ?auto_171674 ?auto_171676 ) ) ( not ( = ?auto_171674 ?auto_171677 ) ) ( not ( = ?auto_171674 ?auto_171678 ) ) ( not ( = ?auto_171674 ?auto_171679 ) ) ( not ( = ?auto_171674 ?auto_171680 ) ) ( not ( = ?auto_171675 ?auto_171676 ) ) ( not ( = ?auto_171675 ?auto_171677 ) ) ( not ( = ?auto_171675 ?auto_171678 ) ) ( not ( = ?auto_171675 ?auto_171679 ) ) ( not ( = ?auto_171675 ?auto_171680 ) ) ( not ( = ?auto_171676 ?auto_171677 ) ) ( not ( = ?auto_171676 ?auto_171678 ) ) ( not ( = ?auto_171676 ?auto_171679 ) ) ( not ( = ?auto_171676 ?auto_171680 ) ) ( not ( = ?auto_171677 ?auto_171678 ) ) ( not ( = ?auto_171677 ?auto_171679 ) ) ( not ( = ?auto_171677 ?auto_171680 ) ) ( not ( = ?auto_171678 ?auto_171679 ) ) ( not ( = ?auto_171678 ?auto_171680 ) ) ( not ( = ?auto_171679 ?auto_171680 ) ) ( ON ?auto_171680 ?auto_171682 ) ( not ( = ?auto_171674 ?auto_171682 ) ) ( not ( = ?auto_171675 ?auto_171682 ) ) ( not ( = ?auto_171676 ?auto_171682 ) ) ( not ( = ?auto_171677 ?auto_171682 ) ) ( not ( = ?auto_171678 ?auto_171682 ) ) ( not ( = ?auto_171679 ?auto_171682 ) ) ( not ( = ?auto_171680 ?auto_171682 ) ) ( ON ?auto_171679 ?auto_171680 ) ( ON-TABLE ?auto_171681 ) ( ON ?auto_171682 ?auto_171681 ) ( not ( = ?auto_171681 ?auto_171682 ) ) ( not ( = ?auto_171681 ?auto_171680 ) ) ( not ( = ?auto_171681 ?auto_171679 ) ) ( not ( = ?auto_171674 ?auto_171681 ) ) ( not ( = ?auto_171675 ?auto_171681 ) ) ( not ( = ?auto_171676 ?auto_171681 ) ) ( not ( = ?auto_171677 ?auto_171681 ) ) ( not ( = ?auto_171678 ?auto_171681 ) ) ( ON ?auto_171678 ?auto_171679 ) ( ON ?auto_171677 ?auto_171678 ) ( CLEAR ?auto_171677 ) ( HOLDING ?auto_171676 ) ( CLEAR ?auto_171675 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171674 ?auto_171675 ?auto_171676 )
      ( MAKE-7PILE ?auto_171674 ?auto_171675 ?auto_171676 ?auto_171677 ?auto_171678 ?auto_171679 ?auto_171680 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171683 - BLOCK
      ?auto_171684 - BLOCK
      ?auto_171685 - BLOCK
      ?auto_171686 - BLOCK
      ?auto_171687 - BLOCK
      ?auto_171688 - BLOCK
      ?auto_171689 - BLOCK
    )
    :vars
    (
      ?auto_171690 - BLOCK
      ?auto_171691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171683 ) ( ON ?auto_171684 ?auto_171683 ) ( not ( = ?auto_171683 ?auto_171684 ) ) ( not ( = ?auto_171683 ?auto_171685 ) ) ( not ( = ?auto_171683 ?auto_171686 ) ) ( not ( = ?auto_171683 ?auto_171687 ) ) ( not ( = ?auto_171683 ?auto_171688 ) ) ( not ( = ?auto_171683 ?auto_171689 ) ) ( not ( = ?auto_171684 ?auto_171685 ) ) ( not ( = ?auto_171684 ?auto_171686 ) ) ( not ( = ?auto_171684 ?auto_171687 ) ) ( not ( = ?auto_171684 ?auto_171688 ) ) ( not ( = ?auto_171684 ?auto_171689 ) ) ( not ( = ?auto_171685 ?auto_171686 ) ) ( not ( = ?auto_171685 ?auto_171687 ) ) ( not ( = ?auto_171685 ?auto_171688 ) ) ( not ( = ?auto_171685 ?auto_171689 ) ) ( not ( = ?auto_171686 ?auto_171687 ) ) ( not ( = ?auto_171686 ?auto_171688 ) ) ( not ( = ?auto_171686 ?auto_171689 ) ) ( not ( = ?auto_171687 ?auto_171688 ) ) ( not ( = ?auto_171687 ?auto_171689 ) ) ( not ( = ?auto_171688 ?auto_171689 ) ) ( ON ?auto_171689 ?auto_171690 ) ( not ( = ?auto_171683 ?auto_171690 ) ) ( not ( = ?auto_171684 ?auto_171690 ) ) ( not ( = ?auto_171685 ?auto_171690 ) ) ( not ( = ?auto_171686 ?auto_171690 ) ) ( not ( = ?auto_171687 ?auto_171690 ) ) ( not ( = ?auto_171688 ?auto_171690 ) ) ( not ( = ?auto_171689 ?auto_171690 ) ) ( ON ?auto_171688 ?auto_171689 ) ( ON-TABLE ?auto_171691 ) ( ON ?auto_171690 ?auto_171691 ) ( not ( = ?auto_171691 ?auto_171690 ) ) ( not ( = ?auto_171691 ?auto_171689 ) ) ( not ( = ?auto_171691 ?auto_171688 ) ) ( not ( = ?auto_171683 ?auto_171691 ) ) ( not ( = ?auto_171684 ?auto_171691 ) ) ( not ( = ?auto_171685 ?auto_171691 ) ) ( not ( = ?auto_171686 ?auto_171691 ) ) ( not ( = ?auto_171687 ?auto_171691 ) ) ( ON ?auto_171687 ?auto_171688 ) ( ON ?auto_171686 ?auto_171687 ) ( CLEAR ?auto_171684 ) ( ON ?auto_171685 ?auto_171686 ) ( CLEAR ?auto_171685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171691 ?auto_171690 ?auto_171689 ?auto_171688 ?auto_171687 ?auto_171686 )
      ( MAKE-7PILE ?auto_171683 ?auto_171684 ?auto_171685 ?auto_171686 ?auto_171687 ?auto_171688 ?auto_171689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171692 - BLOCK
      ?auto_171693 - BLOCK
      ?auto_171694 - BLOCK
      ?auto_171695 - BLOCK
      ?auto_171696 - BLOCK
      ?auto_171697 - BLOCK
      ?auto_171698 - BLOCK
    )
    :vars
    (
      ?auto_171700 - BLOCK
      ?auto_171699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171692 ) ( not ( = ?auto_171692 ?auto_171693 ) ) ( not ( = ?auto_171692 ?auto_171694 ) ) ( not ( = ?auto_171692 ?auto_171695 ) ) ( not ( = ?auto_171692 ?auto_171696 ) ) ( not ( = ?auto_171692 ?auto_171697 ) ) ( not ( = ?auto_171692 ?auto_171698 ) ) ( not ( = ?auto_171693 ?auto_171694 ) ) ( not ( = ?auto_171693 ?auto_171695 ) ) ( not ( = ?auto_171693 ?auto_171696 ) ) ( not ( = ?auto_171693 ?auto_171697 ) ) ( not ( = ?auto_171693 ?auto_171698 ) ) ( not ( = ?auto_171694 ?auto_171695 ) ) ( not ( = ?auto_171694 ?auto_171696 ) ) ( not ( = ?auto_171694 ?auto_171697 ) ) ( not ( = ?auto_171694 ?auto_171698 ) ) ( not ( = ?auto_171695 ?auto_171696 ) ) ( not ( = ?auto_171695 ?auto_171697 ) ) ( not ( = ?auto_171695 ?auto_171698 ) ) ( not ( = ?auto_171696 ?auto_171697 ) ) ( not ( = ?auto_171696 ?auto_171698 ) ) ( not ( = ?auto_171697 ?auto_171698 ) ) ( ON ?auto_171698 ?auto_171700 ) ( not ( = ?auto_171692 ?auto_171700 ) ) ( not ( = ?auto_171693 ?auto_171700 ) ) ( not ( = ?auto_171694 ?auto_171700 ) ) ( not ( = ?auto_171695 ?auto_171700 ) ) ( not ( = ?auto_171696 ?auto_171700 ) ) ( not ( = ?auto_171697 ?auto_171700 ) ) ( not ( = ?auto_171698 ?auto_171700 ) ) ( ON ?auto_171697 ?auto_171698 ) ( ON-TABLE ?auto_171699 ) ( ON ?auto_171700 ?auto_171699 ) ( not ( = ?auto_171699 ?auto_171700 ) ) ( not ( = ?auto_171699 ?auto_171698 ) ) ( not ( = ?auto_171699 ?auto_171697 ) ) ( not ( = ?auto_171692 ?auto_171699 ) ) ( not ( = ?auto_171693 ?auto_171699 ) ) ( not ( = ?auto_171694 ?auto_171699 ) ) ( not ( = ?auto_171695 ?auto_171699 ) ) ( not ( = ?auto_171696 ?auto_171699 ) ) ( ON ?auto_171696 ?auto_171697 ) ( ON ?auto_171695 ?auto_171696 ) ( ON ?auto_171694 ?auto_171695 ) ( CLEAR ?auto_171694 ) ( HOLDING ?auto_171693 ) ( CLEAR ?auto_171692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171692 ?auto_171693 )
      ( MAKE-7PILE ?auto_171692 ?auto_171693 ?auto_171694 ?auto_171695 ?auto_171696 ?auto_171697 ?auto_171698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171701 - BLOCK
      ?auto_171702 - BLOCK
      ?auto_171703 - BLOCK
      ?auto_171704 - BLOCK
      ?auto_171705 - BLOCK
      ?auto_171706 - BLOCK
      ?auto_171707 - BLOCK
    )
    :vars
    (
      ?auto_171708 - BLOCK
      ?auto_171709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171701 ) ( not ( = ?auto_171701 ?auto_171702 ) ) ( not ( = ?auto_171701 ?auto_171703 ) ) ( not ( = ?auto_171701 ?auto_171704 ) ) ( not ( = ?auto_171701 ?auto_171705 ) ) ( not ( = ?auto_171701 ?auto_171706 ) ) ( not ( = ?auto_171701 ?auto_171707 ) ) ( not ( = ?auto_171702 ?auto_171703 ) ) ( not ( = ?auto_171702 ?auto_171704 ) ) ( not ( = ?auto_171702 ?auto_171705 ) ) ( not ( = ?auto_171702 ?auto_171706 ) ) ( not ( = ?auto_171702 ?auto_171707 ) ) ( not ( = ?auto_171703 ?auto_171704 ) ) ( not ( = ?auto_171703 ?auto_171705 ) ) ( not ( = ?auto_171703 ?auto_171706 ) ) ( not ( = ?auto_171703 ?auto_171707 ) ) ( not ( = ?auto_171704 ?auto_171705 ) ) ( not ( = ?auto_171704 ?auto_171706 ) ) ( not ( = ?auto_171704 ?auto_171707 ) ) ( not ( = ?auto_171705 ?auto_171706 ) ) ( not ( = ?auto_171705 ?auto_171707 ) ) ( not ( = ?auto_171706 ?auto_171707 ) ) ( ON ?auto_171707 ?auto_171708 ) ( not ( = ?auto_171701 ?auto_171708 ) ) ( not ( = ?auto_171702 ?auto_171708 ) ) ( not ( = ?auto_171703 ?auto_171708 ) ) ( not ( = ?auto_171704 ?auto_171708 ) ) ( not ( = ?auto_171705 ?auto_171708 ) ) ( not ( = ?auto_171706 ?auto_171708 ) ) ( not ( = ?auto_171707 ?auto_171708 ) ) ( ON ?auto_171706 ?auto_171707 ) ( ON-TABLE ?auto_171709 ) ( ON ?auto_171708 ?auto_171709 ) ( not ( = ?auto_171709 ?auto_171708 ) ) ( not ( = ?auto_171709 ?auto_171707 ) ) ( not ( = ?auto_171709 ?auto_171706 ) ) ( not ( = ?auto_171701 ?auto_171709 ) ) ( not ( = ?auto_171702 ?auto_171709 ) ) ( not ( = ?auto_171703 ?auto_171709 ) ) ( not ( = ?auto_171704 ?auto_171709 ) ) ( not ( = ?auto_171705 ?auto_171709 ) ) ( ON ?auto_171705 ?auto_171706 ) ( ON ?auto_171704 ?auto_171705 ) ( ON ?auto_171703 ?auto_171704 ) ( CLEAR ?auto_171701 ) ( ON ?auto_171702 ?auto_171703 ) ( CLEAR ?auto_171702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171709 ?auto_171708 ?auto_171707 ?auto_171706 ?auto_171705 ?auto_171704 ?auto_171703 )
      ( MAKE-7PILE ?auto_171701 ?auto_171702 ?auto_171703 ?auto_171704 ?auto_171705 ?auto_171706 ?auto_171707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171710 - BLOCK
      ?auto_171711 - BLOCK
      ?auto_171712 - BLOCK
      ?auto_171713 - BLOCK
      ?auto_171714 - BLOCK
      ?auto_171715 - BLOCK
      ?auto_171716 - BLOCK
    )
    :vars
    (
      ?auto_171717 - BLOCK
      ?auto_171718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171710 ?auto_171711 ) ) ( not ( = ?auto_171710 ?auto_171712 ) ) ( not ( = ?auto_171710 ?auto_171713 ) ) ( not ( = ?auto_171710 ?auto_171714 ) ) ( not ( = ?auto_171710 ?auto_171715 ) ) ( not ( = ?auto_171710 ?auto_171716 ) ) ( not ( = ?auto_171711 ?auto_171712 ) ) ( not ( = ?auto_171711 ?auto_171713 ) ) ( not ( = ?auto_171711 ?auto_171714 ) ) ( not ( = ?auto_171711 ?auto_171715 ) ) ( not ( = ?auto_171711 ?auto_171716 ) ) ( not ( = ?auto_171712 ?auto_171713 ) ) ( not ( = ?auto_171712 ?auto_171714 ) ) ( not ( = ?auto_171712 ?auto_171715 ) ) ( not ( = ?auto_171712 ?auto_171716 ) ) ( not ( = ?auto_171713 ?auto_171714 ) ) ( not ( = ?auto_171713 ?auto_171715 ) ) ( not ( = ?auto_171713 ?auto_171716 ) ) ( not ( = ?auto_171714 ?auto_171715 ) ) ( not ( = ?auto_171714 ?auto_171716 ) ) ( not ( = ?auto_171715 ?auto_171716 ) ) ( ON ?auto_171716 ?auto_171717 ) ( not ( = ?auto_171710 ?auto_171717 ) ) ( not ( = ?auto_171711 ?auto_171717 ) ) ( not ( = ?auto_171712 ?auto_171717 ) ) ( not ( = ?auto_171713 ?auto_171717 ) ) ( not ( = ?auto_171714 ?auto_171717 ) ) ( not ( = ?auto_171715 ?auto_171717 ) ) ( not ( = ?auto_171716 ?auto_171717 ) ) ( ON ?auto_171715 ?auto_171716 ) ( ON-TABLE ?auto_171718 ) ( ON ?auto_171717 ?auto_171718 ) ( not ( = ?auto_171718 ?auto_171717 ) ) ( not ( = ?auto_171718 ?auto_171716 ) ) ( not ( = ?auto_171718 ?auto_171715 ) ) ( not ( = ?auto_171710 ?auto_171718 ) ) ( not ( = ?auto_171711 ?auto_171718 ) ) ( not ( = ?auto_171712 ?auto_171718 ) ) ( not ( = ?auto_171713 ?auto_171718 ) ) ( not ( = ?auto_171714 ?auto_171718 ) ) ( ON ?auto_171714 ?auto_171715 ) ( ON ?auto_171713 ?auto_171714 ) ( ON ?auto_171712 ?auto_171713 ) ( ON ?auto_171711 ?auto_171712 ) ( CLEAR ?auto_171711 ) ( HOLDING ?auto_171710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171710 )
      ( MAKE-7PILE ?auto_171710 ?auto_171711 ?auto_171712 ?auto_171713 ?auto_171714 ?auto_171715 ?auto_171716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_171719 - BLOCK
      ?auto_171720 - BLOCK
      ?auto_171721 - BLOCK
      ?auto_171722 - BLOCK
      ?auto_171723 - BLOCK
      ?auto_171724 - BLOCK
      ?auto_171725 - BLOCK
    )
    :vars
    (
      ?auto_171727 - BLOCK
      ?auto_171726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171719 ?auto_171720 ) ) ( not ( = ?auto_171719 ?auto_171721 ) ) ( not ( = ?auto_171719 ?auto_171722 ) ) ( not ( = ?auto_171719 ?auto_171723 ) ) ( not ( = ?auto_171719 ?auto_171724 ) ) ( not ( = ?auto_171719 ?auto_171725 ) ) ( not ( = ?auto_171720 ?auto_171721 ) ) ( not ( = ?auto_171720 ?auto_171722 ) ) ( not ( = ?auto_171720 ?auto_171723 ) ) ( not ( = ?auto_171720 ?auto_171724 ) ) ( not ( = ?auto_171720 ?auto_171725 ) ) ( not ( = ?auto_171721 ?auto_171722 ) ) ( not ( = ?auto_171721 ?auto_171723 ) ) ( not ( = ?auto_171721 ?auto_171724 ) ) ( not ( = ?auto_171721 ?auto_171725 ) ) ( not ( = ?auto_171722 ?auto_171723 ) ) ( not ( = ?auto_171722 ?auto_171724 ) ) ( not ( = ?auto_171722 ?auto_171725 ) ) ( not ( = ?auto_171723 ?auto_171724 ) ) ( not ( = ?auto_171723 ?auto_171725 ) ) ( not ( = ?auto_171724 ?auto_171725 ) ) ( ON ?auto_171725 ?auto_171727 ) ( not ( = ?auto_171719 ?auto_171727 ) ) ( not ( = ?auto_171720 ?auto_171727 ) ) ( not ( = ?auto_171721 ?auto_171727 ) ) ( not ( = ?auto_171722 ?auto_171727 ) ) ( not ( = ?auto_171723 ?auto_171727 ) ) ( not ( = ?auto_171724 ?auto_171727 ) ) ( not ( = ?auto_171725 ?auto_171727 ) ) ( ON ?auto_171724 ?auto_171725 ) ( ON-TABLE ?auto_171726 ) ( ON ?auto_171727 ?auto_171726 ) ( not ( = ?auto_171726 ?auto_171727 ) ) ( not ( = ?auto_171726 ?auto_171725 ) ) ( not ( = ?auto_171726 ?auto_171724 ) ) ( not ( = ?auto_171719 ?auto_171726 ) ) ( not ( = ?auto_171720 ?auto_171726 ) ) ( not ( = ?auto_171721 ?auto_171726 ) ) ( not ( = ?auto_171722 ?auto_171726 ) ) ( not ( = ?auto_171723 ?auto_171726 ) ) ( ON ?auto_171723 ?auto_171724 ) ( ON ?auto_171722 ?auto_171723 ) ( ON ?auto_171721 ?auto_171722 ) ( ON ?auto_171720 ?auto_171721 ) ( ON ?auto_171719 ?auto_171720 ) ( CLEAR ?auto_171719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171726 ?auto_171727 ?auto_171725 ?auto_171724 ?auto_171723 ?auto_171722 ?auto_171721 ?auto_171720 )
      ( MAKE-7PILE ?auto_171719 ?auto_171720 ?auto_171721 ?auto_171722 ?auto_171723 ?auto_171724 ?auto_171725 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171729 - BLOCK
    )
    :vars
    (
      ?auto_171730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171730 ?auto_171729 ) ( CLEAR ?auto_171730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171729 ) ( not ( = ?auto_171729 ?auto_171730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171730 ?auto_171729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171731 - BLOCK
    )
    :vars
    (
      ?auto_171732 - BLOCK
      ?auto_171733 - BLOCK
      ?auto_171734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171732 ?auto_171731 ) ( CLEAR ?auto_171732 ) ( ON-TABLE ?auto_171731 ) ( not ( = ?auto_171731 ?auto_171732 ) ) ( HOLDING ?auto_171733 ) ( CLEAR ?auto_171734 ) ( not ( = ?auto_171731 ?auto_171733 ) ) ( not ( = ?auto_171731 ?auto_171734 ) ) ( not ( = ?auto_171732 ?auto_171733 ) ) ( not ( = ?auto_171732 ?auto_171734 ) ) ( not ( = ?auto_171733 ?auto_171734 ) ) )
    :subtasks
    ( ( !STACK ?auto_171733 ?auto_171734 )
      ( MAKE-1PILE ?auto_171731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171735 - BLOCK
    )
    :vars
    (
      ?auto_171736 - BLOCK
      ?auto_171738 - BLOCK
      ?auto_171737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171736 ?auto_171735 ) ( ON-TABLE ?auto_171735 ) ( not ( = ?auto_171735 ?auto_171736 ) ) ( CLEAR ?auto_171738 ) ( not ( = ?auto_171735 ?auto_171737 ) ) ( not ( = ?auto_171735 ?auto_171738 ) ) ( not ( = ?auto_171736 ?auto_171737 ) ) ( not ( = ?auto_171736 ?auto_171738 ) ) ( not ( = ?auto_171737 ?auto_171738 ) ) ( ON ?auto_171737 ?auto_171736 ) ( CLEAR ?auto_171737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171735 ?auto_171736 )
      ( MAKE-1PILE ?auto_171735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171739 - BLOCK
    )
    :vars
    (
      ?auto_171740 - BLOCK
      ?auto_171741 - BLOCK
      ?auto_171742 - BLOCK
      ?auto_171746 - BLOCK
      ?auto_171744 - BLOCK
      ?auto_171745 - BLOCK
      ?auto_171743 - BLOCK
      ?auto_171747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171740 ?auto_171739 ) ( ON-TABLE ?auto_171739 ) ( not ( = ?auto_171739 ?auto_171740 ) ) ( not ( = ?auto_171739 ?auto_171741 ) ) ( not ( = ?auto_171739 ?auto_171742 ) ) ( not ( = ?auto_171740 ?auto_171741 ) ) ( not ( = ?auto_171740 ?auto_171742 ) ) ( not ( = ?auto_171741 ?auto_171742 ) ) ( ON ?auto_171741 ?auto_171740 ) ( CLEAR ?auto_171741 ) ( HOLDING ?auto_171742 ) ( CLEAR ?auto_171746 ) ( ON-TABLE ?auto_171744 ) ( ON ?auto_171745 ?auto_171744 ) ( ON ?auto_171743 ?auto_171745 ) ( ON ?auto_171747 ?auto_171743 ) ( ON ?auto_171746 ?auto_171747 ) ( not ( = ?auto_171744 ?auto_171745 ) ) ( not ( = ?auto_171744 ?auto_171743 ) ) ( not ( = ?auto_171744 ?auto_171747 ) ) ( not ( = ?auto_171744 ?auto_171746 ) ) ( not ( = ?auto_171744 ?auto_171742 ) ) ( not ( = ?auto_171745 ?auto_171743 ) ) ( not ( = ?auto_171745 ?auto_171747 ) ) ( not ( = ?auto_171745 ?auto_171746 ) ) ( not ( = ?auto_171745 ?auto_171742 ) ) ( not ( = ?auto_171743 ?auto_171747 ) ) ( not ( = ?auto_171743 ?auto_171746 ) ) ( not ( = ?auto_171743 ?auto_171742 ) ) ( not ( = ?auto_171747 ?auto_171746 ) ) ( not ( = ?auto_171747 ?auto_171742 ) ) ( not ( = ?auto_171746 ?auto_171742 ) ) ( not ( = ?auto_171739 ?auto_171746 ) ) ( not ( = ?auto_171739 ?auto_171744 ) ) ( not ( = ?auto_171739 ?auto_171745 ) ) ( not ( = ?auto_171739 ?auto_171743 ) ) ( not ( = ?auto_171739 ?auto_171747 ) ) ( not ( = ?auto_171740 ?auto_171746 ) ) ( not ( = ?auto_171740 ?auto_171744 ) ) ( not ( = ?auto_171740 ?auto_171745 ) ) ( not ( = ?auto_171740 ?auto_171743 ) ) ( not ( = ?auto_171740 ?auto_171747 ) ) ( not ( = ?auto_171741 ?auto_171746 ) ) ( not ( = ?auto_171741 ?auto_171744 ) ) ( not ( = ?auto_171741 ?auto_171745 ) ) ( not ( = ?auto_171741 ?auto_171743 ) ) ( not ( = ?auto_171741 ?auto_171747 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171744 ?auto_171745 ?auto_171743 ?auto_171747 ?auto_171746 ?auto_171742 )
      ( MAKE-1PILE ?auto_171739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171748 - BLOCK
    )
    :vars
    (
      ?auto_171754 - BLOCK
      ?auto_171756 - BLOCK
      ?auto_171755 - BLOCK
      ?auto_171750 - BLOCK
      ?auto_171749 - BLOCK
      ?auto_171752 - BLOCK
      ?auto_171751 - BLOCK
      ?auto_171753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171754 ?auto_171748 ) ( ON-TABLE ?auto_171748 ) ( not ( = ?auto_171748 ?auto_171754 ) ) ( not ( = ?auto_171748 ?auto_171756 ) ) ( not ( = ?auto_171748 ?auto_171755 ) ) ( not ( = ?auto_171754 ?auto_171756 ) ) ( not ( = ?auto_171754 ?auto_171755 ) ) ( not ( = ?auto_171756 ?auto_171755 ) ) ( ON ?auto_171756 ?auto_171754 ) ( CLEAR ?auto_171750 ) ( ON-TABLE ?auto_171749 ) ( ON ?auto_171752 ?auto_171749 ) ( ON ?auto_171751 ?auto_171752 ) ( ON ?auto_171753 ?auto_171751 ) ( ON ?auto_171750 ?auto_171753 ) ( not ( = ?auto_171749 ?auto_171752 ) ) ( not ( = ?auto_171749 ?auto_171751 ) ) ( not ( = ?auto_171749 ?auto_171753 ) ) ( not ( = ?auto_171749 ?auto_171750 ) ) ( not ( = ?auto_171749 ?auto_171755 ) ) ( not ( = ?auto_171752 ?auto_171751 ) ) ( not ( = ?auto_171752 ?auto_171753 ) ) ( not ( = ?auto_171752 ?auto_171750 ) ) ( not ( = ?auto_171752 ?auto_171755 ) ) ( not ( = ?auto_171751 ?auto_171753 ) ) ( not ( = ?auto_171751 ?auto_171750 ) ) ( not ( = ?auto_171751 ?auto_171755 ) ) ( not ( = ?auto_171753 ?auto_171750 ) ) ( not ( = ?auto_171753 ?auto_171755 ) ) ( not ( = ?auto_171750 ?auto_171755 ) ) ( not ( = ?auto_171748 ?auto_171750 ) ) ( not ( = ?auto_171748 ?auto_171749 ) ) ( not ( = ?auto_171748 ?auto_171752 ) ) ( not ( = ?auto_171748 ?auto_171751 ) ) ( not ( = ?auto_171748 ?auto_171753 ) ) ( not ( = ?auto_171754 ?auto_171750 ) ) ( not ( = ?auto_171754 ?auto_171749 ) ) ( not ( = ?auto_171754 ?auto_171752 ) ) ( not ( = ?auto_171754 ?auto_171751 ) ) ( not ( = ?auto_171754 ?auto_171753 ) ) ( not ( = ?auto_171756 ?auto_171750 ) ) ( not ( = ?auto_171756 ?auto_171749 ) ) ( not ( = ?auto_171756 ?auto_171752 ) ) ( not ( = ?auto_171756 ?auto_171751 ) ) ( not ( = ?auto_171756 ?auto_171753 ) ) ( ON ?auto_171755 ?auto_171756 ) ( CLEAR ?auto_171755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171748 ?auto_171754 ?auto_171756 )
      ( MAKE-1PILE ?auto_171748 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171757 - BLOCK
    )
    :vars
    (
      ?auto_171764 - BLOCK
      ?auto_171760 - BLOCK
      ?auto_171761 - BLOCK
      ?auto_171759 - BLOCK
      ?auto_171758 - BLOCK
      ?auto_171762 - BLOCK
      ?auto_171765 - BLOCK
      ?auto_171763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171764 ?auto_171757 ) ( ON-TABLE ?auto_171757 ) ( not ( = ?auto_171757 ?auto_171764 ) ) ( not ( = ?auto_171757 ?auto_171760 ) ) ( not ( = ?auto_171757 ?auto_171761 ) ) ( not ( = ?auto_171764 ?auto_171760 ) ) ( not ( = ?auto_171764 ?auto_171761 ) ) ( not ( = ?auto_171760 ?auto_171761 ) ) ( ON ?auto_171760 ?auto_171764 ) ( ON-TABLE ?auto_171759 ) ( ON ?auto_171758 ?auto_171759 ) ( ON ?auto_171762 ?auto_171758 ) ( ON ?auto_171765 ?auto_171762 ) ( not ( = ?auto_171759 ?auto_171758 ) ) ( not ( = ?auto_171759 ?auto_171762 ) ) ( not ( = ?auto_171759 ?auto_171765 ) ) ( not ( = ?auto_171759 ?auto_171763 ) ) ( not ( = ?auto_171759 ?auto_171761 ) ) ( not ( = ?auto_171758 ?auto_171762 ) ) ( not ( = ?auto_171758 ?auto_171765 ) ) ( not ( = ?auto_171758 ?auto_171763 ) ) ( not ( = ?auto_171758 ?auto_171761 ) ) ( not ( = ?auto_171762 ?auto_171765 ) ) ( not ( = ?auto_171762 ?auto_171763 ) ) ( not ( = ?auto_171762 ?auto_171761 ) ) ( not ( = ?auto_171765 ?auto_171763 ) ) ( not ( = ?auto_171765 ?auto_171761 ) ) ( not ( = ?auto_171763 ?auto_171761 ) ) ( not ( = ?auto_171757 ?auto_171763 ) ) ( not ( = ?auto_171757 ?auto_171759 ) ) ( not ( = ?auto_171757 ?auto_171758 ) ) ( not ( = ?auto_171757 ?auto_171762 ) ) ( not ( = ?auto_171757 ?auto_171765 ) ) ( not ( = ?auto_171764 ?auto_171763 ) ) ( not ( = ?auto_171764 ?auto_171759 ) ) ( not ( = ?auto_171764 ?auto_171758 ) ) ( not ( = ?auto_171764 ?auto_171762 ) ) ( not ( = ?auto_171764 ?auto_171765 ) ) ( not ( = ?auto_171760 ?auto_171763 ) ) ( not ( = ?auto_171760 ?auto_171759 ) ) ( not ( = ?auto_171760 ?auto_171758 ) ) ( not ( = ?auto_171760 ?auto_171762 ) ) ( not ( = ?auto_171760 ?auto_171765 ) ) ( ON ?auto_171761 ?auto_171760 ) ( CLEAR ?auto_171761 ) ( HOLDING ?auto_171763 ) ( CLEAR ?auto_171765 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171759 ?auto_171758 ?auto_171762 ?auto_171765 ?auto_171763 )
      ( MAKE-1PILE ?auto_171757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171766 - BLOCK
    )
    :vars
    (
      ?auto_171769 - BLOCK
      ?auto_171767 - BLOCK
      ?auto_171771 - BLOCK
      ?auto_171772 - BLOCK
      ?auto_171774 - BLOCK
      ?auto_171768 - BLOCK
      ?auto_171773 - BLOCK
      ?auto_171770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171769 ?auto_171766 ) ( ON-TABLE ?auto_171766 ) ( not ( = ?auto_171766 ?auto_171769 ) ) ( not ( = ?auto_171766 ?auto_171767 ) ) ( not ( = ?auto_171766 ?auto_171771 ) ) ( not ( = ?auto_171769 ?auto_171767 ) ) ( not ( = ?auto_171769 ?auto_171771 ) ) ( not ( = ?auto_171767 ?auto_171771 ) ) ( ON ?auto_171767 ?auto_171769 ) ( ON-TABLE ?auto_171772 ) ( ON ?auto_171774 ?auto_171772 ) ( ON ?auto_171768 ?auto_171774 ) ( ON ?auto_171773 ?auto_171768 ) ( not ( = ?auto_171772 ?auto_171774 ) ) ( not ( = ?auto_171772 ?auto_171768 ) ) ( not ( = ?auto_171772 ?auto_171773 ) ) ( not ( = ?auto_171772 ?auto_171770 ) ) ( not ( = ?auto_171772 ?auto_171771 ) ) ( not ( = ?auto_171774 ?auto_171768 ) ) ( not ( = ?auto_171774 ?auto_171773 ) ) ( not ( = ?auto_171774 ?auto_171770 ) ) ( not ( = ?auto_171774 ?auto_171771 ) ) ( not ( = ?auto_171768 ?auto_171773 ) ) ( not ( = ?auto_171768 ?auto_171770 ) ) ( not ( = ?auto_171768 ?auto_171771 ) ) ( not ( = ?auto_171773 ?auto_171770 ) ) ( not ( = ?auto_171773 ?auto_171771 ) ) ( not ( = ?auto_171770 ?auto_171771 ) ) ( not ( = ?auto_171766 ?auto_171770 ) ) ( not ( = ?auto_171766 ?auto_171772 ) ) ( not ( = ?auto_171766 ?auto_171774 ) ) ( not ( = ?auto_171766 ?auto_171768 ) ) ( not ( = ?auto_171766 ?auto_171773 ) ) ( not ( = ?auto_171769 ?auto_171770 ) ) ( not ( = ?auto_171769 ?auto_171772 ) ) ( not ( = ?auto_171769 ?auto_171774 ) ) ( not ( = ?auto_171769 ?auto_171768 ) ) ( not ( = ?auto_171769 ?auto_171773 ) ) ( not ( = ?auto_171767 ?auto_171770 ) ) ( not ( = ?auto_171767 ?auto_171772 ) ) ( not ( = ?auto_171767 ?auto_171774 ) ) ( not ( = ?auto_171767 ?auto_171768 ) ) ( not ( = ?auto_171767 ?auto_171773 ) ) ( ON ?auto_171771 ?auto_171767 ) ( CLEAR ?auto_171773 ) ( ON ?auto_171770 ?auto_171771 ) ( CLEAR ?auto_171770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171766 ?auto_171769 ?auto_171767 ?auto_171771 )
      ( MAKE-1PILE ?auto_171766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171775 - BLOCK
    )
    :vars
    (
      ?auto_171782 - BLOCK
      ?auto_171783 - BLOCK
      ?auto_171777 - BLOCK
      ?auto_171778 - BLOCK
      ?auto_171779 - BLOCK
      ?auto_171781 - BLOCK
      ?auto_171780 - BLOCK
      ?auto_171776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171782 ?auto_171775 ) ( ON-TABLE ?auto_171775 ) ( not ( = ?auto_171775 ?auto_171782 ) ) ( not ( = ?auto_171775 ?auto_171783 ) ) ( not ( = ?auto_171775 ?auto_171777 ) ) ( not ( = ?auto_171782 ?auto_171783 ) ) ( not ( = ?auto_171782 ?auto_171777 ) ) ( not ( = ?auto_171783 ?auto_171777 ) ) ( ON ?auto_171783 ?auto_171782 ) ( ON-TABLE ?auto_171778 ) ( ON ?auto_171779 ?auto_171778 ) ( ON ?auto_171781 ?auto_171779 ) ( not ( = ?auto_171778 ?auto_171779 ) ) ( not ( = ?auto_171778 ?auto_171781 ) ) ( not ( = ?auto_171778 ?auto_171780 ) ) ( not ( = ?auto_171778 ?auto_171776 ) ) ( not ( = ?auto_171778 ?auto_171777 ) ) ( not ( = ?auto_171779 ?auto_171781 ) ) ( not ( = ?auto_171779 ?auto_171780 ) ) ( not ( = ?auto_171779 ?auto_171776 ) ) ( not ( = ?auto_171779 ?auto_171777 ) ) ( not ( = ?auto_171781 ?auto_171780 ) ) ( not ( = ?auto_171781 ?auto_171776 ) ) ( not ( = ?auto_171781 ?auto_171777 ) ) ( not ( = ?auto_171780 ?auto_171776 ) ) ( not ( = ?auto_171780 ?auto_171777 ) ) ( not ( = ?auto_171776 ?auto_171777 ) ) ( not ( = ?auto_171775 ?auto_171776 ) ) ( not ( = ?auto_171775 ?auto_171778 ) ) ( not ( = ?auto_171775 ?auto_171779 ) ) ( not ( = ?auto_171775 ?auto_171781 ) ) ( not ( = ?auto_171775 ?auto_171780 ) ) ( not ( = ?auto_171782 ?auto_171776 ) ) ( not ( = ?auto_171782 ?auto_171778 ) ) ( not ( = ?auto_171782 ?auto_171779 ) ) ( not ( = ?auto_171782 ?auto_171781 ) ) ( not ( = ?auto_171782 ?auto_171780 ) ) ( not ( = ?auto_171783 ?auto_171776 ) ) ( not ( = ?auto_171783 ?auto_171778 ) ) ( not ( = ?auto_171783 ?auto_171779 ) ) ( not ( = ?auto_171783 ?auto_171781 ) ) ( not ( = ?auto_171783 ?auto_171780 ) ) ( ON ?auto_171777 ?auto_171783 ) ( ON ?auto_171776 ?auto_171777 ) ( CLEAR ?auto_171776 ) ( HOLDING ?auto_171780 ) ( CLEAR ?auto_171781 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171778 ?auto_171779 ?auto_171781 ?auto_171780 )
      ( MAKE-1PILE ?auto_171775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171784 - BLOCK
    )
    :vars
    (
      ?auto_171787 - BLOCK
      ?auto_171788 - BLOCK
      ?auto_171789 - BLOCK
      ?auto_171785 - BLOCK
      ?auto_171791 - BLOCK
      ?auto_171790 - BLOCK
      ?auto_171792 - BLOCK
      ?auto_171786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171787 ?auto_171784 ) ( ON-TABLE ?auto_171784 ) ( not ( = ?auto_171784 ?auto_171787 ) ) ( not ( = ?auto_171784 ?auto_171788 ) ) ( not ( = ?auto_171784 ?auto_171789 ) ) ( not ( = ?auto_171787 ?auto_171788 ) ) ( not ( = ?auto_171787 ?auto_171789 ) ) ( not ( = ?auto_171788 ?auto_171789 ) ) ( ON ?auto_171788 ?auto_171787 ) ( ON-TABLE ?auto_171785 ) ( ON ?auto_171791 ?auto_171785 ) ( ON ?auto_171790 ?auto_171791 ) ( not ( = ?auto_171785 ?auto_171791 ) ) ( not ( = ?auto_171785 ?auto_171790 ) ) ( not ( = ?auto_171785 ?auto_171792 ) ) ( not ( = ?auto_171785 ?auto_171786 ) ) ( not ( = ?auto_171785 ?auto_171789 ) ) ( not ( = ?auto_171791 ?auto_171790 ) ) ( not ( = ?auto_171791 ?auto_171792 ) ) ( not ( = ?auto_171791 ?auto_171786 ) ) ( not ( = ?auto_171791 ?auto_171789 ) ) ( not ( = ?auto_171790 ?auto_171792 ) ) ( not ( = ?auto_171790 ?auto_171786 ) ) ( not ( = ?auto_171790 ?auto_171789 ) ) ( not ( = ?auto_171792 ?auto_171786 ) ) ( not ( = ?auto_171792 ?auto_171789 ) ) ( not ( = ?auto_171786 ?auto_171789 ) ) ( not ( = ?auto_171784 ?auto_171786 ) ) ( not ( = ?auto_171784 ?auto_171785 ) ) ( not ( = ?auto_171784 ?auto_171791 ) ) ( not ( = ?auto_171784 ?auto_171790 ) ) ( not ( = ?auto_171784 ?auto_171792 ) ) ( not ( = ?auto_171787 ?auto_171786 ) ) ( not ( = ?auto_171787 ?auto_171785 ) ) ( not ( = ?auto_171787 ?auto_171791 ) ) ( not ( = ?auto_171787 ?auto_171790 ) ) ( not ( = ?auto_171787 ?auto_171792 ) ) ( not ( = ?auto_171788 ?auto_171786 ) ) ( not ( = ?auto_171788 ?auto_171785 ) ) ( not ( = ?auto_171788 ?auto_171791 ) ) ( not ( = ?auto_171788 ?auto_171790 ) ) ( not ( = ?auto_171788 ?auto_171792 ) ) ( ON ?auto_171789 ?auto_171788 ) ( ON ?auto_171786 ?auto_171789 ) ( CLEAR ?auto_171790 ) ( ON ?auto_171792 ?auto_171786 ) ( CLEAR ?auto_171792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171784 ?auto_171787 ?auto_171788 ?auto_171789 ?auto_171786 )
      ( MAKE-1PILE ?auto_171784 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171793 - BLOCK
    )
    :vars
    (
      ?auto_171800 - BLOCK
      ?auto_171796 - BLOCK
      ?auto_171798 - BLOCK
      ?auto_171797 - BLOCK
      ?auto_171794 - BLOCK
      ?auto_171795 - BLOCK
      ?auto_171801 - BLOCK
      ?auto_171799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171800 ?auto_171793 ) ( ON-TABLE ?auto_171793 ) ( not ( = ?auto_171793 ?auto_171800 ) ) ( not ( = ?auto_171793 ?auto_171796 ) ) ( not ( = ?auto_171793 ?auto_171798 ) ) ( not ( = ?auto_171800 ?auto_171796 ) ) ( not ( = ?auto_171800 ?auto_171798 ) ) ( not ( = ?auto_171796 ?auto_171798 ) ) ( ON ?auto_171796 ?auto_171800 ) ( ON-TABLE ?auto_171797 ) ( ON ?auto_171794 ?auto_171797 ) ( not ( = ?auto_171797 ?auto_171794 ) ) ( not ( = ?auto_171797 ?auto_171795 ) ) ( not ( = ?auto_171797 ?auto_171801 ) ) ( not ( = ?auto_171797 ?auto_171799 ) ) ( not ( = ?auto_171797 ?auto_171798 ) ) ( not ( = ?auto_171794 ?auto_171795 ) ) ( not ( = ?auto_171794 ?auto_171801 ) ) ( not ( = ?auto_171794 ?auto_171799 ) ) ( not ( = ?auto_171794 ?auto_171798 ) ) ( not ( = ?auto_171795 ?auto_171801 ) ) ( not ( = ?auto_171795 ?auto_171799 ) ) ( not ( = ?auto_171795 ?auto_171798 ) ) ( not ( = ?auto_171801 ?auto_171799 ) ) ( not ( = ?auto_171801 ?auto_171798 ) ) ( not ( = ?auto_171799 ?auto_171798 ) ) ( not ( = ?auto_171793 ?auto_171799 ) ) ( not ( = ?auto_171793 ?auto_171797 ) ) ( not ( = ?auto_171793 ?auto_171794 ) ) ( not ( = ?auto_171793 ?auto_171795 ) ) ( not ( = ?auto_171793 ?auto_171801 ) ) ( not ( = ?auto_171800 ?auto_171799 ) ) ( not ( = ?auto_171800 ?auto_171797 ) ) ( not ( = ?auto_171800 ?auto_171794 ) ) ( not ( = ?auto_171800 ?auto_171795 ) ) ( not ( = ?auto_171800 ?auto_171801 ) ) ( not ( = ?auto_171796 ?auto_171799 ) ) ( not ( = ?auto_171796 ?auto_171797 ) ) ( not ( = ?auto_171796 ?auto_171794 ) ) ( not ( = ?auto_171796 ?auto_171795 ) ) ( not ( = ?auto_171796 ?auto_171801 ) ) ( ON ?auto_171798 ?auto_171796 ) ( ON ?auto_171799 ?auto_171798 ) ( ON ?auto_171801 ?auto_171799 ) ( CLEAR ?auto_171801 ) ( HOLDING ?auto_171795 ) ( CLEAR ?auto_171794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171797 ?auto_171794 ?auto_171795 )
      ( MAKE-1PILE ?auto_171793 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171802 - BLOCK
    )
    :vars
    (
      ?auto_171805 - BLOCK
      ?auto_171808 - BLOCK
      ?auto_171810 - BLOCK
      ?auto_171806 - BLOCK
      ?auto_171803 - BLOCK
      ?auto_171804 - BLOCK
      ?auto_171807 - BLOCK
      ?auto_171809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171805 ?auto_171802 ) ( ON-TABLE ?auto_171802 ) ( not ( = ?auto_171802 ?auto_171805 ) ) ( not ( = ?auto_171802 ?auto_171808 ) ) ( not ( = ?auto_171802 ?auto_171810 ) ) ( not ( = ?auto_171805 ?auto_171808 ) ) ( not ( = ?auto_171805 ?auto_171810 ) ) ( not ( = ?auto_171808 ?auto_171810 ) ) ( ON ?auto_171808 ?auto_171805 ) ( ON-TABLE ?auto_171806 ) ( ON ?auto_171803 ?auto_171806 ) ( not ( = ?auto_171806 ?auto_171803 ) ) ( not ( = ?auto_171806 ?auto_171804 ) ) ( not ( = ?auto_171806 ?auto_171807 ) ) ( not ( = ?auto_171806 ?auto_171809 ) ) ( not ( = ?auto_171806 ?auto_171810 ) ) ( not ( = ?auto_171803 ?auto_171804 ) ) ( not ( = ?auto_171803 ?auto_171807 ) ) ( not ( = ?auto_171803 ?auto_171809 ) ) ( not ( = ?auto_171803 ?auto_171810 ) ) ( not ( = ?auto_171804 ?auto_171807 ) ) ( not ( = ?auto_171804 ?auto_171809 ) ) ( not ( = ?auto_171804 ?auto_171810 ) ) ( not ( = ?auto_171807 ?auto_171809 ) ) ( not ( = ?auto_171807 ?auto_171810 ) ) ( not ( = ?auto_171809 ?auto_171810 ) ) ( not ( = ?auto_171802 ?auto_171809 ) ) ( not ( = ?auto_171802 ?auto_171806 ) ) ( not ( = ?auto_171802 ?auto_171803 ) ) ( not ( = ?auto_171802 ?auto_171804 ) ) ( not ( = ?auto_171802 ?auto_171807 ) ) ( not ( = ?auto_171805 ?auto_171809 ) ) ( not ( = ?auto_171805 ?auto_171806 ) ) ( not ( = ?auto_171805 ?auto_171803 ) ) ( not ( = ?auto_171805 ?auto_171804 ) ) ( not ( = ?auto_171805 ?auto_171807 ) ) ( not ( = ?auto_171808 ?auto_171809 ) ) ( not ( = ?auto_171808 ?auto_171806 ) ) ( not ( = ?auto_171808 ?auto_171803 ) ) ( not ( = ?auto_171808 ?auto_171804 ) ) ( not ( = ?auto_171808 ?auto_171807 ) ) ( ON ?auto_171810 ?auto_171808 ) ( ON ?auto_171809 ?auto_171810 ) ( ON ?auto_171807 ?auto_171809 ) ( CLEAR ?auto_171803 ) ( ON ?auto_171804 ?auto_171807 ) ( CLEAR ?auto_171804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171802 ?auto_171805 ?auto_171808 ?auto_171810 ?auto_171809 ?auto_171807 )
      ( MAKE-1PILE ?auto_171802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171811 - BLOCK
    )
    :vars
    (
      ?auto_171814 - BLOCK
      ?auto_171812 - BLOCK
      ?auto_171815 - BLOCK
      ?auto_171816 - BLOCK
      ?auto_171813 - BLOCK
      ?auto_171818 - BLOCK
      ?auto_171819 - BLOCK
      ?auto_171817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171814 ?auto_171811 ) ( ON-TABLE ?auto_171811 ) ( not ( = ?auto_171811 ?auto_171814 ) ) ( not ( = ?auto_171811 ?auto_171812 ) ) ( not ( = ?auto_171811 ?auto_171815 ) ) ( not ( = ?auto_171814 ?auto_171812 ) ) ( not ( = ?auto_171814 ?auto_171815 ) ) ( not ( = ?auto_171812 ?auto_171815 ) ) ( ON ?auto_171812 ?auto_171814 ) ( ON-TABLE ?auto_171816 ) ( not ( = ?auto_171816 ?auto_171813 ) ) ( not ( = ?auto_171816 ?auto_171818 ) ) ( not ( = ?auto_171816 ?auto_171819 ) ) ( not ( = ?auto_171816 ?auto_171817 ) ) ( not ( = ?auto_171816 ?auto_171815 ) ) ( not ( = ?auto_171813 ?auto_171818 ) ) ( not ( = ?auto_171813 ?auto_171819 ) ) ( not ( = ?auto_171813 ?auto_171817 ) ) ( not ( = ?auto_171813 ?auto_171815 ) ) ( not ( = ?auto_171818 ?auto_171819 ) ) ( not ( = ?auto_171818 ?auto_171817 ) ) ( not ( = ?auto_171818 ?auto_171815 ) ) ( not ( = ?auto_171819 ?auto_171817 ) ) ( not ( = ?auto_171819 ?auto_171815 ) ) ( not ( = ?auto_171817 ?auto_171815 ) ) ( not ( = ?auto_171811 ?auto_171817 ) ) ( not ( = ?auto_171811 ?auto_171816 ) ) ( not ( = ?auto_171811 ?auto_171813 ) ) ( not ( = ?auto_171811 ?auto_171818 ) ) ( not ( = ?auto_171811 ?auto_171819 ) ) ( not ( = ?auto_171814 ?auto_171817 ) ) ( not ( = ?auto_171814 ?auto_171816 ) ) ( not ( = ?auto_171814 ?auto_171813 ) ) ( not ( = ?auto_171814 ?auto_171818 ) ) ( not ( = ?auto_171814 ?auto_171819 ) ) ( not ( = ?auto_171812 ?auto_171817 ) ) ( not ( = ?auto_171812 ?auto_171816 ) ) ( not ( = ?auto_171812 ?auto_171813 ) ) ( not ( = ?auto_171812 ?auto_171818 ) ) ( not ( = ?auto_171812 ?auto_171819 ) ) ( ON ?auto_171815 ?auto_171812 ) ( ON ?auto_171817 ?auto_171815 ) ( ON ?auto_171819 ?auto_171817 ) ( ON ?auto_171818 ?auto_171819 ) ( CLEAR ?auto_171818 ) ( HOLDING ?auto_171813 ) ( CLEAR ?auto_171816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171816 ?auto_171813 )
      ( MAKE-1PILE ?auto_171811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171820 - BLOCK
    )
    :vars
    (
      ?auto_171821 - BLOCK
      ?auto_171822 - BLOCK
      ?auto_171825 - BLOCK
      ?auto_171827 - BLOCK
      ?auto_171826 - BLOCK
      ?auto_171823 - BLOCK
      ?auto_171824 - BLOCK
      ?auto_171828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171821 ?auto_171820 ) ( ON-TABLE ?auto_171820 ) ( not ( = ?auto_171820 ?auto_171821 ) ) ( not ( = ?auto_171820 ?auto_171822 ) ) ( not ( = ?auto_171820 ?auto_171825 ) ) ( not ( = ?auto_171821 ?auto_171822 ) ) ( not ( = ?auto_171821 ?auto_171825 ) ) ( not ( = ?auto_171822 ?auto_171825 ) ) ( ON ?auto_171822 ?auto_171821 ) ( ON-TABLE ?auto_171827 ) ( not ( = ?auto_171827 ?auto_171826 ) ) ( not ( = ?auto_171827 ?auto_171823 ) ) ( not ( = ?auto_171827 ?auto_171824 ) ) ( not ( = ?auto_171827 ?auto_171828 ) ) ( not ( = ?auto_171827 ?auto_171825 ) ) ( not ( = ?auto_171826 ?auto_171823 ) ) ( not ( = ?auto_171826 ?auto_171824 ) ) ( not ( = ?auto_171826 ?auto_171828 ) ) ( not ( = ?auto_171826 ?auto_171825 ) ) ( not ( = ?auto_171823 ?auto_171824 ) ) ( not ( = ?auto_171823 ?auto_171828 ) ) ( not ( = ?auto_171823 ?auto_171825 ) ) ( not ( = ?auto_171824 ?auto_171828 ) ) ( not ( = ?auto_171824 ?auto_171825 ) ) ( not ( = ?auto_171828 ?auto_171825 ) ) ( not ( = ?auto_171820 ?auto_171828 ) ) ( not ( = ?auto_171820 ?auto_171827 ) ) ( not ( = ?auto_171820 ?auto_171826 ) ) ( not ( = ?auto_171820 ?auto_171823 ) ) ( not ( = ?auto_171820 ?auto_171824 ) ) ( not ( = ?auto_171821 ?auto_171828 ) ) ( not ( = ?auto_171821 ?auto_171827 ) ) ( not ( = ?auto_171821 ?auto_171826 ) ) ( not ( = ?auto_171821 ?auto_171823 ) ) ( not ( = ?auto_171821 ?auto_171824 ) ) ( not ( = ?auto_171822 ?auto_171828 ) ) ( not ( = ?auto_171822 ?auto_171827 ) ) ( not ( = ?auto_171822 ?auto_171826 ) ) ( not ( = ?auto_171822 ?auto_171823 ) ) ( not ( = ?auto_171822 ?auto_171824 ) ) ( ON ?auto_171825 ?auto_171822 ) ( ON ?auto_171828 ?auto_171825 ) ( ON ?auto_171824 ?auto_171828 ) ( ON ?auto_171823 ?auto_171824 ) ( CLEAR ?auto_171827 ) ( ON ?auto_171826 ?auto_171823 ) ( CLEAR ?auto_171826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171820 ?auto_171821 ?auto_171822 ?auto_171825 ?auto_171828 ?auto_171824 ?auto_171823 )
      ( MAKE-1PILE ?auto_171820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171829 - BLOCK
    )
    :vars
    (
      ?auto_171832 - BLOCK
      ?auto_171833 - BLOCK
      ?auto_171834 - BLOCK
      ?auto_171836 - BLOCK
      ?auto_171835 - BLOCK
      ?auto_171830 - BLOCK
      ?auto_171837 - BLOCK
      ?auto_171831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171832 ?auto_171829 ) ( ON-TABLE ?auto_171829 ) ( not ( = ?auto_171829 ?auto_171832 ) ) ( not ( = ?auto_171829 ?auto_171833 ) ) ( not ( = ?auto_171829 ?auto_171834 ) ) ( not ( = ?auto_171832 ?auto_171833 ) ) ( not ( = ?auto_171832 ?auto_171834 ) ) ( not ( = ?auto_171833 ?auto_171834 ) ) ( ON ?auto_171833 ?auto_171832 ) ( not ( = ?auto_171836 ?auto_171835 ) ) ( not ( = ?auto_171836 ?auto_171830 ) ) ( not ( = ?auto_171836 ?auto_171837 ) ) ( not ( = ?auto_171836 ?auto_171831 ) ) ( not ( = ?auto_171836 ?auto_171834 ) ) ( not ( = ?auto_171835 ?auto_171830 ) ) ( not ( = ?auto_171835 ?auto_171837 ) ) ( not ( = ?auto_171835 ?auto_171831 ) ) ( not ( = ?auto_171835 ?auto_171834 ) ) ( not ( = ?auto_171830 ?auto_171837 ) ) ( not ( = ?auto_171830 ?auto_171831 ) ) ( not ( = ?auto_171830 ?auto_171834 ) ) ( not ( = ?auto_171837 ?auto_171831 ) ) ( not ( = ?auto_171837 ?auto_171834 ) ) ( not ( = ?auto_171831 ?auto_171834 ) ) ( not ( = ?auto_171829 ?auto_171831 ) ) ( not ( = ?auto_171829 ?auto_171836 ) ) ( not ( = ?auto_171829 ?auto_171835 ) ) ( not ( = ?auto_171829 ?auto_171830 ) ) ( not ( = ?auto_171829 ?auto_171837 ) ) ( not ( = ?auto_171832 ?auto_171831 ) ) ( not ( = ?auto_171832 ?auto_171836 ) ) ( not ( = ?auto_171832 ?auto_171835 ) ) ( not ( = ?auto_171832 ?auto_171830 ) ) ( not ( = ?auto_171832 ?auto_171837 ) ) ( not ( = ?auto_171833 ?auto_171831 ) ) ( not ( = ?auto_171833 ?auto_171836 ) ) ( not ( = ?auto_171833 ?auto_171835 ) ) ( not ( = ?auto_171833 ?auto_171830 ) ) ( not ( = ?auto_171833 ?auto_171837 ) ) ( ON ?auto_171834 ?auto_171833 ) ( ON ?auto_171831 ?auto_171834 ) ( ON ?auto_171837 ?auto_171831 ) ( ON ?auto_171830 ?auto_171837 ) ( ON ?auto_171835 ?auto_171830 ) ( CLEAR ?auto_171835 ) ( HOLDING ?auto_171836 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171836 )
      ( MAKE-1PILE ?auto_171829 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_171838 - BLOCK
    )
    :vars
    (
      ?auto_171846 - BLOCK
      ?auto_171843 - BLOCK
      ?auto_171844 - BLOCK
      ?auto_171841 - BLOCK
      ?auto_171839 - BLOCK
      ?auto_171845 - BLOCK
      ?auto_171842 - BLOCK
      ?auto_171840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171846 ?auto_171838 ) ( ON-TABLE ?auto_171838 ) ( not ( = ?auto_171838 ?auto_171846 ) ) ( not ( = ?auto_171838 ?auto_171843 ) ) ( not ( = ?auto_171838 ?auto_171844 ) ) ( not ( = ?auto_171846 ?auto_171843 ) ) ( not ( = ?auto_171846 ?auto_171844 ) ) ( not ( = ?auto_171843 ?auto_171844 ) ) ( ON ?auto_171843 ?auto_171846 ) ( not ( = ?auto_171841 ?auto_171839 ) ) ( not ( = ?auto_171841 ?auto_171845 ) ) ( not ( = ?auto_171841 ?auto_171842 ) ) ( not ( = ?auto_171841 ?auto_171840 ) ) ( not ( = ?auto_171841 ?auto_171844 ) ) ( not ( = ?auto_171839 ?auto_171845 ) ) ( not ( = ?auto_171839 ?auto_171842 ) ) ( not ( = ?auto_171839 ?auto_171840 ) ) ( not ( = ?auto_171839 ?auto_171844 ) ) ( not ( = ?auto_171845 ?auto_171842 ) ) ( not ( = ?auto_171845 ?auto_171840 ) ) ( not ( = ?auto_171845 ?auto_171844 ) ) ( not ( = ?auto_171842 ?auto_171840 ) ) ( not ( = ?auto_171842 ?auto_171844 ) ) ( not ( = ?auto_171840 ?auto_171844 ) ) ( not ( = ?auto_171838 ?auto_171840 ) ) ( not ( = ?auto_171838 ?auto_171841 ) ) ( not ( = ?auto_171838 ?auto_171839 ) ) ( not ( = ?auto_171838 ?auto_171845 ) ) ( not ( = ?auto_171838 ?auto_171842 ) ) ( not ( = ?auto_171846 ?auto_171840 ) ) ( not ( = ?auto_171846 ?auto_171841 ) ) ( not ( = ?auto_171846 ?auto_171839 ) ) ( not ( = ?auto_171846 ?auto_171845 ) ) ( not ( = ?auto_171846 ?auto_171842 ) ) ( not ( = ?auto_171843 ?auto_171840 ) ) ( not ( = ?auto_171843 ?auto_171841 ) ) ( not ( = ?auto_171843 ?auto_171839 ) ) ( not ( = ?auto_171843 ?auto_171845 ) ) ( not ( = ?auto_171843 ?auto_171842 ) ) ( ON ?auto_171844 ?auto_171843 ) ( ON ?auto_171840 ?auto_171844 ) ( ON ?auto_171842 ?auto_171840 ) ( ON ?auto_171845 ?auto_171842 ) ( ON ?auto_171839 ?auto_171845 ) ( ON ?auto_171841 ?auto_171839 ) ( CLEAR ?auto_171841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171838 ?auto_171846 ?auto_171843 ?auto_171844 ?auto_171840 ?auto_171842 ?auto_171845 ?auto_171839 )
      ( MAKE-1PILE ?auto_171838 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171855 - BLOCK
      ?auto_171856 - BLOCK
      ?auto_171857 - BLOCK
      ?auto_171858 - BLOCK
      ?auto_171859 - BLOCK
      ?auto_171860 - BLOCK
      ?auto_171861 - BLOCK
      ?auto_171862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_171862 ) ( CLEAR ?auto_171861 ) ( ON-TABLE ?auto_171855 ) ( ON ?auto_171856 ?auto_171855 ) ( ON ?auto_171857 ?auto_171856 ) ( ON ?auto_171858 ?auto_171857 ) ( ON ?auto_171859 ?auto_171858 ) ( ON ?auto_171860 ?auto_171859 ) ( ON ?auto_171861 ?auto_171860 ) ( not ( = ?auto_171855 ?auto_171856 ) ) ( not ( = ?auto_171855 ?auto_171857 ) ) ( not ( = ?auto_171855 ?auto_171858 ) ) ( not ( = ?auto_171855 ?auto_171859 ) ) ( not ( = ?auto_171855 ?auto_171860 ) ) ( not ( = ?auto_171855 ?auto_171861 ) ) ( not ( = ?auto_171855 ?auto_171862 ) ) ( not ( = ?auto_171856 ?auto_171857 ) ) ( not ( = ?auto_171856 ?auto_171858 ) ) ( not ( = ?auto_171856 ?auto_171859 ) ) ( not ( = ?auto_171856 ?auto_171860 ) ) ( not ( = ?auto_171856 ?auto_171861 ) ) ( not ( = ?auto_171856 ?auto_171862 ) ) ( not ( = ?auto_171857 ?auto_171858 ) ) ( not ( = ?auto_171857 ?auto_171859 ) ) ( not ( = ?auto_171857 ?auto_171860 ) ) ( not ( = ?auto_171857 ?auto_171861 ) ) ( not ( = ?auto_171857 ?auto_171862 ) ) ( not ( = ?auto_171858 ?auto_171859 ) ) ( not ( = ?auto_171858 ?auto_171860 ) ) ( not ( = ?auto_171858 ?auto_171861 ) ) ( not ( = ?auto_171858 ?auto_171862 ) ) ( not ( = ?auto_171859 ?auto_171860 ) ) ( not ( = ?auto_171859 ?auto_171861 ) ) ( not ( = ?auto_171859 ?auto_171862 ) ) ( not ( = ?auto_171860 ?auto_171861 ) ) ( not ( = ?auto_171860 ?auto_171862 ) ) ( not ( = ?auto_171861 ?auto_171862 ) ) )
    :subtasks
    ( ( !STACK ?auto_171862 ?auto_171861 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171863 - BLOCK
      ?auto_171864 - BLOCK
      ?auto_171865 - BLOCK
      ?auto_171866 - BLOCK
      ?auto_171867 - BLOCK
      ?auto_171868 - BLOCK
      ?auto_171869 - BLOCK
      ?auto_171870 - BLOCK
    )
    :vars
    (
      ?auto_171871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_171869 ) ( ON-TABLE ?auto_171863 ) ( ON ?auto_171864 ?auto_171863 ) ( ON ?auto_171865 ?auto_171864 ) ( ON ?auto_171866 ?auto_171865 ) ( ON ?auto_171867 ?auto_171866 ) ( ON ?auto_171868 ?auto_171867 ) ( ON ?auto_171869 ?auto_171868 ) ( not ( = ?auto_171863 ?auto_171864 ) ) ( not ( = ?auto_171863 ?auto_171865 ) ) ( not ( = ?auto_171863 ?auto_171866 ) ) ( not ( = ?auto_171863 ?auto_171867 ) ) ( not ( = ?auto_171863 ?auto_171868 ) ) ( not ( = ?auto_171863 ?auto_171869 ) ) ( not ( = ?auto_171863 ?auto_171870 ) ) ( not ( = ?auto_171864 ?auto_171865 ) ) ( not ( = ?auto_171864 ?auto_171866 ) ) ( not ( = ?auto_171864 ?auto_171867 ) ) ( not ( = ?auto_171864 ?auto_171868 ) ) ( not ( = ?auto_171864 ?auto_171869 ) ) ( not ( = ?auto_171864 ?auto_171870 ) ) ( not ( = ?auto_171865 ?auto_171866 ) ) ( not ( = ?auto_171865 ?auto_171867 ) ) ( not ( = ?auto_171865 ?auto_171868 ) ) ( not ( = ?auto_171865 ?auto_171869 ) ) ( not ( = ?auto_171865 ?auto_171870 ) ) ( not ( = ?auto_171866 ?auto_171867 ) ) ( not ( = ?auto_171866 ?auto_171868 ) ) ( not ( = ?auto_171866 ?auto_171869 ) ) ( not ( = ?auto_171866 ?auto_171870 ) ) ( not ( = ?auto_171867 ?auto_171868 ) ) ( not ( = ?auto_171867 ?auto_171869 ) ) ( not ( = ?auto_171867 ?auto_171870 ) ) ( not ( = ?auto_171868 ?auto_171869 ) ) ( not ( = ?auto_171868 ?auto_171870 ) ) ( not ( = ?auto_171869 ?auto_171870 ) ) ( ON ?auto_171870 ?auto_171871 ) ( CLEAR ?auto_171870 ) ( HAND-EMPTY ) ( not ( = ?auto_171863 ?auto_171871 ) ) ( not ( = ?auto_171864 ?auto_171871 ) ) ( not ( = ?auto_171865 ?auto_171871 ) ) ( not ( = ?auto_171866 ?auto_171871 ) ) ( not ( = ?auto_171867 ?auto_171871 ) ) ( not ( = ?auto_171868 ?auto_171871 ) ) ( not ( = ?auto_171869 ?auto_171871 ) ) ( not ( = ?auto_171870 ?auto_171871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171870 ?auto_171871 )
      ( MAKE-8PILE ?auto_171863 ?auto_171864 ?auto_171865 ?auto_171866 ?auto_171867 ?auto_171868 ?auto_171869 ?auto_171870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171872 - BLOCK
      ?auto_171873 - BLOCK
      ?auto_171874 - BLOCK
      ?auto_171875 - BLOCK
      ?auto_171876 - BLOCK
      ?auto_171877 - BLOCK
      ?auto_171878 - BLOCK
      ?auto_171879 - BLOCK
    )
    :vars
    (
      ?auto_171880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171872 ) ( ON ?auto_171873 ?auto_171872 ) ( ON ?auto_171874 ?auto_171873 ) ( ON ?auto_171875 ?auto_171874 ) ( ON ?auto_171876 ?auto_171875 ) ( ON ?auto_171877 ?auto_171876 ) ( not ( = ?auto_171872 ?auto_171873 ) ) ( not ( = ?auto_171872 ?auto_171874 ) ) ( not ( = ?auto_171872 ?auto_171875 ) ) ( not ( = ?auto_171872 ?auto_171876 ) ) ( not ( = ?auto_171872 ?auto_171877 ) ) ( not ( = ?auto_171872 ?auto_171878 ) ) ( not ( = ?auto_171872 ?auto_171879 ) ) ( not ( = ?auto_171873 ?auto_171874 ) ) ( not ( = ?auto_171873 ?auto_171875 ) ) ( not ( = ?auto_171873 ?auto_171876 ) ) ( not ( = ?auto_171873 ?auto_171877 ) ) ( not ( = ?auto_171873 ?auto_171878 ) ) ( not ( = ?auto_171873 ?auto_171879 ) ) ( not ( = ?auto_171874 ?auto_171875 ) ) ( not ( = ?auto_171874 ?auto_171876 ) ) ( not ( = ?auto_171874 ?auto_171877 ) ) ( not ( = ?auto_171874 ?auto_171878 ) ) ( not ( = ?auto_171874 ?auto_171879 ) ) ( not ( = ?auto_171875 ?auto_171876 ) ) ( not ( = ?auto_171875 ?auto_171877 ) ) ( not ( = ?auto_171875 ?auto_171878 ) ) ( not ( = ?auto_171875 ?auto_171879 ) ) ( not ( = ?auto_171876 ?auto_171877 ) ) ( not ( = ?auto_171876 ?auto_171878 ) ) ( not ( = ?auto_171876 ?auto_171879 ) ) ( not ( = ?auto_171877 ?auto_171878 ) ) ( not ( = ?auto_171877 ?auto_171879 ) ) ( not ( = ?auto_171878 ?auto_171879 ) ) ( ON ?auto_171879 ?auto_171880 ) ( CLEAR ?auto_171879 ) ( not ( = ?auto_171872 ?auto_171880 ) ) ( not ( = ?auto_171873 ?auto_171880 ) ) ( not ( = ?auto_171874 ?auto_171880 ) ) ( not ( = ?auto_171875 ?auto_171880 ) ) ( not ( = ?auto_171876 ?auto_171880 ) ) ( not ( = ?auto_171877 ?auto_171880 ) ) ( not ( = ?auto_171878 ?auto_171880 ) ) ( not ( = ?auto_171879 ?auto_171880 ) ) ( HOLDING ?auto_171878 ) ( CLEAR ?auto_171877 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 )
      ( MAKE-8PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ?auto_171877 ?auto_171878 ?auto_171879 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171881 - BLOCK
      ?auto_171882 - BLOCK
      ?auto_171883 - BLOCK
      ?auto_171884 - BLOCK
      ?auto_171885 - BLOCK
      ?auto_171886 - BLOCK
      ?auto_171887 - BLOCK
      ?auto_171888 - BLOCK
    )
    :vars
    (
      ?auto_171889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171881 ) ( ON ?auto_171882 ?auto_171881 ) ( ON ?auto_171883 ?auto_171882 ) ( ON ?auto_171884 ?auto_171883 ) ( ON ?auto_171885 ?auto_171884 ) ( ON ?auto_171886 ?auto_171885 ) ( not ( = ?auto_171881 ?auto_171882 ) ) ( not ( = ?auto_171881 ?auto_171883 ) ) ( not ( = ?auto_171881 ?auto_171884 ) ) ( not ( = ?auto_171881 ?auto_171885 ) ) ( not ( = ?auto_171881 ?auto_171886 ) ) ( not ( = ?auto_171881 ?auto_171887 ) ) ( not ( = ?auto_171881 ?auto_171888 ) ) ( not ( = ?auto_171882 ?auto_171883 ) ) ( not ( = ?auto_171882 ?auto_171884 ) ) ( not ( = ?auto_171882 ?auto_171885 ) ) ( not ( = ?auto_171882 ?auto_171886 ) ) ( not ( = ?auto_171882 ?auto_171887 ) ) ( not ( = ?auto_171882 ?auto_171888 ) ) ( not ( = ?auto_171883 ?auto_171884 ) ) ( not ( = ?auto_171883 ?auto_171885 ) ) ( not ( = ?auto_171883 ?auto_171886 ) ) ( not ( = ?auto_171883 ?auto_171887 ) ) ( not ( = ?auto_171883 ?auto_171888 ) ) ( not ( = ?auto_171884 ?auto_171885 ) ) ( not ( = ?auto_171884 ?auto_171886 ) ) ( not ( = ?auto_171884 ?auto_171887 ) ) ( not ( = ?auto_171884 ?auto_171888 ) ) ( not ( = ?auto_171885 ?auto_171886 ) ) ( not ( = ?auto_171885 ?auto_171887 ) ) ( not ( = ?auto_171885 ?auto_171888 ) ) ( not ( = ?auto_171886 ?auto_171887 ) ) ( not ( = ?auto_171886 ?auto_171888 ) ) ( not ( = ?auto_171887 ?auto_171888 ) ) ( ON ?auto_171888 ?auto_171889 ) ( not ( = ?auto_171881 ?auto_171889 ) ) ( not ( = ?auto_171882 ?auto_171889 ) ) ( not ( = ?auto_171883 ?auto_171889 ) ) ( not ( = ?auto_171884 ?auto_171889 ) ) ( not ( = ?auto_171885 ?auto_171889 ) ) ( not ( = ?auto_171886 ?auto_171889 ) ) ( not ( = ?auto_171887 ?auto_171889 ) ) ( not ( = ?auto_171888 ?auto_171889 ) ) ( CLEAR ?auto_171886 ) ( ON ?auto_171887 ?auto_171888 ) ( CLEAR ?auto_171887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171889 ?auto_171888 )
      ( MAKE-8PILE ?auto_171881 ?auto_171882 ?auto_171883 ?auto_171884 ?auto_171885 ?auto_171886 ?auto_171887 ?auto_171888 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171890 - BLOCK
      ?auto_171891 - BLOCK
      ?auto_171892 - BLOCK
      ?auto_171893 - BLOCK
      ?auto_171894 - BLOCK
      ?auto_171895 - BLOCK
      ?auto_171896 - BLOCK
      ?auto_171897 - BLOCK
    )
    :vars
    (
      ?auto_171898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171890 ) ( ON ?auto_171891 ?auto_171890 ) ( ON ?auto_171892 ?auto_171891 ) ( ON ?auto_171893 ?auto_171892 ) ( ON ?auto_171894 ?auto_171893 ) ( not ( = ?auto_171890 ?auto_171891 ) ) ( not ( = ?auto_171890 ?auto_171892 ) ) ( not ( = ?auto_171890 ?auto_171893 ) ) ( not ( = ?auto_171890 ?auto_171894 ) ) ( not ( = ?auto_171890 ?auto_171895 ) ) ( not ( = ?auto_171890 ?auto_171896 ) ) ( not ( = ?auto_171890 ?auto_171897 ) ) ( not ( = ?auto_171891 ?auto_171892 ) ) ( not ( = ?auto_171891 ?auto_171893 ) ) ( not ( = ?auto_171891 ?auto_171894 ) ) ( not ( = ?auto_171891 ?auto_171895 ) ) ( not ( = ?auto_171891 ?auto_171896 ) ) ( not ( = ?auto_171891 ?auto_171897 ) ) ( not ( = ?auto_171892 ?auto_171893 ) ) ( not ( = ?auto_171892 ?auto_171894 ) ) ( not ( = ?auto_171892 ?auto_171895 ) ) ( not ( = ?auto_171892 ?auto_171896 ) ) ( not ( = ?auto_171892 ?auto_171897 ) ) ( not ( = ?auto_171893 ?auto_171894 ) ) ( not ( = ?auto_171893 ?auto_171895 ) ) ( not ( = ?auto_171893 ?auto_171896 ) ) ( not ( = ?auto_171893 ?auto_171897 ) ) ( not ( = ?auto_171894 ?auto_171895 ) ) ( not ( = ?auto_171894 ?auto_171896 ) ) ( not ( = ?auto_171894 ?auto_171897 ) ) ( not ( = ?auto_171895 ?auto_171896 ) ) ( not ( = ?auto_171895 ?auto_171897 ) ) ( not ( = ?auto_171896 ?auto_171897 ) ) ( ON ?auto_171897 ?auto_171898 ) ( not ( = ?auto_171890 ?auto_171898 ) ) ( not ( = ?auto_171891 ?auto_171898 ) ) ( not ( = ?auto_171892 ?auto_171898 ) ) ( not ( = ?auto_171893 ?auto_171898 ) ) ( not ( = ?auto_171894 ?auto_171898 ) ) ( not ( = ?auto_171895 ?auto_171898 ) ) ( not ( = ?auto_171896 ?auto_171898 ) ) ( not ( = ?auto_171897 ?auto_171898 ) ) ( ON ?auto_171896 ?auto_171897 ) ( CLEAR ?auto_171896 ) ( ON-TABLE ?auto_171898 ) ( HOLDING ?auto_171895 ) ( CLEAR ?auto_171894 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171890 ?auto_171891 ?auto_171892 ?auto_171893 ?auto_171894 ?auto_171895 )
      ( MAKE-8PILE ?auto_171890 ?auto_171891 ?auto_171892 ?auto_171893 ?auto_171894 ?auto_171895 ?auto_171896 ?auto_171897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171899 - BLOCK
      ?auto_171900 - BLOCK
      ?auto_171901 - BLOCK
      ?auto_171902 - BLOCK
      ?auto_171903 - BLOCK
      ?auto_171904 - BLOCK
      ?auto_171905 - BLOCK
      ?auto_171906 - BLOCK
    )
    :vars
    (
      ?auto_171907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171899 ) ( ON ?auto_171900 ?auto_171899 ) ( ON ?auto_171901 ?auto_171900 ) ( ON ?auto_171902 ?auto_171901 ) ( ON ?auto_171903 ?auto_171902 ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171901 ) ) ( not ( = ?auto_171899 ?auto_171902 ) ) ( not ( = ?auto_171899 ?auto_171903 ) ) ( not ( = ?auto_171899 ?auto_171904 ) ) ( not ( = ?auto_171899 ?auto_171905 ) ) ( not ( = ?auto_171899 ?auto_171906 ) ) ( not ( = ?auto_171900 ?auto_171901 ) ) ( not ( = ?auto_171900 ?auto_171902 ) ) ( not ( = ?auto_171900 ?auto_171903 ) ) ( not ( = ?auto_171900 ?auto_171904 ) ) ( not ( = ?auto_171900 ?auto_171905 ) ) ( not ( = ?auto_171900 ?auto_171906 ) ) ( not ( = ?auto_171901 ?auto_171902 ) ) ( not ( = ?auto_171901 ?auto_171903 ) ) ( not ( = ?auto_171901 ?auto_171904 ) ) ( not ( = ?auto_171901 ?auto_171905 ) ) ( not ( = ?auto_171901 ?auto_171906 ) ) ( not ( = ?auto_171902 ?auto_171903 ) ) ( not ( = ?auto_171902 ?auto_171904 ) ) ( not ( = ?auto_171902 ?auto_171905 ) ) ( not ( = ?auto_171902 ?auto_171906 ) ) ( not ( = ?auto_171903 ?auto_171904 ) ) ( not ( = ?auto_171903 ?auto_171905 ) ) ( not ( = ?auto_171903 ?auto_171906 ) ) ( not ( = ?auto_171904 ?auto_171905 ) ) ( not ( = ?auto_171904 ?auto_171906 ) ) ( not ( = ?auto_171905 ?auto_171906 ) ) ( ON ?auto_171906 ?auto_171907 ) ( not ( = ?auto_171899 ?auto_171907 ) ) ( not ( = ?auto_171900 ?auto_171907 ) ) ( not ( = ?auto_171901 ?auto_171907 ) ) ( not ( = ?auto_171902 ?auto_171907 ) ) ( not ( = ?auto_171903 ?auto_171907 ) ) ( not ( = ?auto_171904 ?auto_171907 ) ) ( not ( = ?auto_171905 ?auto_171907 ) ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( ON ?auto_171905 ?auto_171906 ) ( ON-TABLE ?auto_171907 ) ( CLEAR ?auto_171903 ) ( ON ?auto_171904 ?auto_171905 ) ( CLEAR ?auto_171904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171907 ?auto_171906 ?auto_171905 )
      ( MAKE-8PILE ?auto_171899 ?auto_171900 ?auto_171901 ?auto_171902 ?auto_171903 ?auto_171904 ?auto_171905 ?auto_171906 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171908 - BLOCK
      ?auto_171909 - BLOCK
      ?auto_171910 - BLOCK
      ?auto_171911 - BLOCK
      ?auto_171912 - BLOCK
      ?auto_171913 - BLOCK
      ?auto_171914 - BLOCK
      ?auto_171915 - BLOCK
    )
    :vars
    (
      ?auto_171916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171908 ) ( ON ?auto_171909 ?auto_171908 ) ( ON ?auto_171910 ?auto_171909 ) ( ON ?auto_171911 ?auto_171910 ) ( not ( = ?auto_171908 ?auto_171909 ) ) ( not ( = ?auto_171908 ?auto_171910 ) ) ( not ( = ?auto_171908 ?auto_171911 ) ) ( not ( = ?auto_171908 ?auto_171912 ) ) ( not ( = ?auto_171908 ?auto_171913 ) ) ( not ( = ?auto_171908 ?auto_171914 ) ) ( not ( = ?auto_171908 ?auto_171915 ) ) ( not ( = ?auto_171909 ?auto_171910 ) ) ( not ( = ?auto_171909 ?auto_171911 ) ) ( not ( = ?auto_171909 ?auto_171912 ) ) ( not ( = ?auto_171909 ?auto_171913 ) ) ( not ( = ?auto_171909 ?auto_171914 ) ) ( not ( = ?auto_171909 ?auto_171915 ) ) ( not ( = ?auto_171910 ?auto_171911 ) ) ( not ( = ?auto_171910 ?auto_171912 ) ) ( not ( = ?auto_171910 ?auto_171913 ) ) ( not ( = ?auto_171910 ?auto_171914 ) ) ( not ( = ?auto_171910 ?auto_171915 ) ) ( not ( = ?auto_171911 ?auto_171912 ) ) ( not ( = ?auto_171911 ?auto_171913 ) ) ( not ( = ?auto_171911 ?auto_171914 ) ) ( not ( = ?auto_171911 ?auto_171915 ) ) ( not ( = ?auto_171912 ?auto_171913 ) ) ( not ( = ?auto_171912 ?auto_171914 ) ) ( not ( = ?auto_171912 ?auto_171915 ) ) ( not ( = ?auto_171913 ?auto_171914 ) ) ( not ( = ?auto_171913 ?auto_171915 ) ) ( not ( = ?auto_171914 ?auto_171915 ) ) ( ON ?auto_171915 ?auto_171916 ) ( not ( = ?auto_171908 ?auto_171916 ) ) ( not ( = ?auto_171909 ?auto_171916 ) ) ( not ( = ?auto_171910 ?auto_171916 ) ) ( not ( = ?auto_171911 ?auto_171916 ) ) ( not ( = ?auto_171912 ?auto_171916 ) ) ( not ( = ?auto_171913 ?auto_171916 ) ) ( not ( = ?auto_171914 ?auto_171916 ) ) ( not ( = ?auto_171915 ?auto_171916 ) ) ( ON ?auto_171914 ?auto_171915 ) ( ON-TABLE ?auto_171916 ) ( ON ?auto_171913 ?auto_171914 ) ( CLEAR ?auto_171913 ) ( HOLDING ?auto_171912 ) ( CLEAR ?auto_171911 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171908 ?auto_171909 ?auto_171910 ?auto_171911 ?auto_171912 )
      ( MAKE-8PILE ?auto_171908 ?auto_171909 ?auto_171910 ?auto_171911 ?auto_171912 ?auto_171913 ?auto_171914 ?auto_171915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171917 - BLOCK
      ?auto_171918 - BLOCK
      ?auto_171919 - BLOCK
      ?auto_171920 - BLOCK
      ?auto_171921 - BLOCK
      ?auto_171922 - BLOCK
      ?auto_171923 - BLOCK
      ?auto_171924 - BLOCK
    )
    :vars
    (
      ?auto_171925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171917 ) ( ON ?auto_171918 ?auto_171917 ) ( ON ?auto_171919 ?auto_171918 ) ( ON ?auto_171920 ?auto_171919 ) ( not ( = ?auto_171917 ?auto_171918 ) ) ( not ( = ?auto_171917 ?auto_171919 ) ) ( not ( = ?auto_171917 ?auto_171920 ) ) ( not ( = ?auto_171917 ?auto_171921 ) ) ( not ( = ?auto_171917 ?auto_171922 ) ) ( not ( = ?auto_171917 ?auto_171923 ) ) ( not ( = ?auto_171917 ?auto_171924 ) ) ( not ( = ?auto_171918 ?auto_171919 ) ) ( not ( = ?auto_171918 ?auto_171920 ) ) ( not ( = ?auto_171918 ?auto_171921 ) ) ( not ( = ?auto_171918 ?auto_171922 ) ) ( not ( = ?auto_171918 ?auto_171923 ) ) ( not ( = ?auto_171918 ?auto_171924 ) ) ( not ( = ?auto_171919 ?auto_171920 ) ) ( not ( = ?auto_171919 ?auto_171921 ) ) ( not ( = ?auto_171919 ?auto_171922 ) ) ( not ( = ?auto_171919 ?auto_171923 ) ) ( not ( = ?auto_171919 ?auto_171924 ) ) ( not ( = ?auto_171920 ?auto_171921 ) ) ( not ( = ?auto_171920 ?auto_171922 ) ) ( not ( = ?auto_171920 ?auto_171923 ) ) ( not ( = ?auto_171920 ?auto_171924 ) ) ( not ( = ?auto_171921 ?auto_171922 ) ) ( not ( = ?auto_171921 ?auto_171923 ) ) ( not ( = ?auto_171921 ?auto_171924 ) ) ( not ( = ?auto_171922 ?auto_171923 ) ) ( not ( = ?auto_171922 ?auto_171924 ) ) ( not ( = ?auto_171923 ?auto_171924 ) ) ( ON ?auto_171924 ?auto_171925 ) ( not ( = ?auto_171917 ?auto_171925 ) ) ( not ( = ?auto_171918 ?auto_171925 ) ) ( not ( = ?auto_171919 ?auto_171925 ) ) ( not ( = ?auto_171920 ?auto_171925 ) ) ( not ( = ?auto_171921 ?auto_171925 ) ) ( not ( = ?auto_171922 ?auto_171925 ) ) ( not ( = ?auto_171923 ?auto_171925 ) ) ( not ( = ?auto_171924 ?auto_171925 ) ) ( ON ?auto_171923 ?auto_171924 ) ( ON-TABLE ?auto_171925 ) ( ON ?auto_171922 ?auto_171923 ) ( CLEAR ?auto_171920 ) ( ON ?auto_171921 ?auto_171922 ) ( CLEAR ?auto_171921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171925 ?auto_171924 ?auto_171923 ?auto_171922 )
      ( MAKE-8PILE ?auto_171917 ?auto_171918 ?auto_171919 ?auto_171920 ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171926 - BLOCK
      ?auto_171927 - BLOCK
      ?auto_171928 - BLOCK
      ?auto_171929 - BLOCK
      ?auto_171930 - BLOCK
      ?auto_171931 - BLOCK
      ?auto_171932 - BLOCK
      ?auto_171933 - BLOCK
    )
    :vars
    (
      ?auto_171934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171926 ) ( ON ?auto_171927 ?auto_171926 ) ( ON ?auto_171928 ?auto_171927 ) ( not ( = ?auto_171926 ?auto_171927 ) ) ( not ( = ?auto_171926 ?auto_171928 ) ) ( not ( = ?auto_171926 ?auto_171929 ) ) ( not ( = ?auto_171926 ?auto_171930 ) ) ( not ( = ?auto_171926 ?auto_171931 ) ) ( not ( = ?auto_171926 ?auto_171932 ) ) ( not ( = ?auto_171926 ?auto_171933 ) ) ( not ( = ?auto_171927 ?auto_171928 ) ) ( not ( = ?auto_171927 ?auto_171929 ) ) ( not ( = ?auto_171927 ?auto_171930 ) ) ( not ( = ?auto_171927 ?auto_171931 ) ) ( not ( = ?auto_171927 ?auto_171932 ) ) ( not ( = ?auto_171927 ?auto_171933 ) ) ( not ( = ?auto_171928 ?auto_171929 ) ) ( not ( = ?auto_171928 ?auto_171930 ) ) ( not ( = ?auto_171928 ?auto_171931 ) ) ( not ( = ?auto_171928 ?auto_171932 ) ) ( not ( = ?auto_171928 ?auto_171933 ) ) ( not ( = ?auto_171929 ?auto_171930 ) ) ( not ( = ?auto_171929 ?auto_171931 ) ) ( not ( = ?auto_171929 ?auto_171932 ) ) ( not ( = ?auto_171929 ?auto_171933 ) ) ( not ( = ?auto_171930 ?auto_171931 ) ) ( not ( = ?auto_171930 ?auto_171932 ) ) ( not ( = ?auto_171930 ?auto_171933 ) ) ( not ( = ?auto_171931 ?auto_171932 ) ) ( not ( = ?auto_171931 ?auto_171933 ) ) ( not ( = ?auto_171932 ?auto_171933 ) ) ( ON ?auto_171933 ?auto_171934 ) ( not ( = ?auto_171926 ?auto_171934 ) ) ( not ( = ?auto_171927 ?auto_171934 ) ) ( not ( = ?auto_171928 ?auto_171934 ) ) ( not ( = ?auto_171929 ?auto_171934 ) ) ( not ( = ?auto_171930 ?auto_171934 ) ) ( not ( = ?auto_171931 ?auto_171934 ) ) ( not ( = ?auto_171932 ?auto_171934 ) ) ( not ( = ?auto_171933 ?auto_171934 ) ) ( ON ?auto_171932 ?auto_171933 ) ( ON-TABLE ?auto_171934 ) ( ON ?auto_171931 ?auto_171932 ) ( ON ?auto_171930 ?auto_171931 ) ( CLEAR ?auto_171930 ) ( HOLDING ?auto_171929 ) ( CLEAR ?auto_171928 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171926 ?auto_171927 ?auto_171928 ?auto_171929 )
      ( MAKE-8PILE ?auto_171926 ?auto_171927 ?auto_171928 ?auto_171929 ?auto_171930 ?auto_171931 ?auto_171932 ?auto_171933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171935 - BLOCK
      ?auto_171936 - BLOCK
      ?auto_171937 - BLOCK
      ?auto_171938 - BLOCK
      ?auto_171939 - BLOCK
      ?auto_171940 - BLOCK
      ?auto_171941 - BLOCK
      ?auto_171942 - BLOCK
    )
    :vars
    (
      ?auto_171943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171935 ) ( ON ?auto_171936 ?auto_171935 ) ( ON ?auto_171937 ?auto_171936 ) ( not ( = ?auto_171935 ?auto_171936 ) ) ( not ( = ?auto_171935 ?auto_171937 ) ) ( not ( = ?auto_171935 ?auto_171938 ) ) ( not ( = ?auto_171935 ?auto_171939 ) ) ( not ( = ?auto_171935 ?auto_171940 ) ) ( not ( = ?auto_171935 ?auto_171941 ) ) ( not ( = ?auto_171935 ?auto_171942 ) ) ( not ( = ?auto_171936 ?auto_171937 ) ) ( not ( = ?auto_171936 ?auto_171938 ) ) ( not ( = ?auto_171936 ?auto_171939 ) ) ( not ( = ?auto_171936 ?auto_171940 ) ) ( not ( = ?auto_171936 ?auto_171941 ) ) ( not ( = ?auto_171936 ?auto_171942 ) ) ( not ( = ?auto_171937 ?auto_171938 ) ) ( not ( = ?auto_171937 ?auto_171939 ) ) ( not ( = ?auto_171937 ?auto_171940 ) ) ( not ( = ?auto_171937 ?auto_171941 ) ) ( not ( = ?auto_171937 ?auto_171942 ) ) ( not ( = ?auto_171938 ?auto_171939 ) ) ( not ( = ?auto_171938 ?auto_171940 ) ) ( not ( = ?auto_171938 ?auto_171941 ) ) ( not ( = ?auto_171938 ?auto_171942 ) ) ( not ( = ?auto_171939 ?auto_171940 ) ) ( not ( = ?auto_171939 ?auto_171941 ) ) ( not ( = ?auto_171939 ?auto_171942 ) ) ( not ( = ?auto_171940 ?auto_171941 ) ) ( not ( = ?auto_171940 ?auto_171942 ) ) ( not ( = ?auto_171941 ?auto_171942 ) ) ( ON ?auto_171942 ?auto_171943 ) ( not ( = ?auto_171935 ?auto_171943 ) ) ( not ( = ?auto_171936 ?auto_171943 ) ) ( not ( = ?auto_171937 ?auto_171943 ) ) ( not ( = ?auto_171938 ?auto_171943 ) ) ( not ( = ?auto_171939 ?auto_171943 ) ) ( not ( = ?auto_171940 ?auto_171943 ) ) ( not ( = ?auto_171941 ?auto_171943 ) ) ( not ( = ?auto_171942 ?auto_171943 ) ) ( ON ?auto_171941 ?auto_171942 ) ( ON-TABLE ?auto_171943 ) ( ON ?auto_171940 ?auto_171941 ) ( ON ?auto_171939 ?auto_171940 ) ( CLEAR ?auto_171937 ) ( ON ?auto_171938 ?auto_171939 ) ( CLEAR ?auto_171938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171943 ?auto_171942 ?auto_171941 ?auto_171940 ?auto_171939 )
      ( MAKE-8PILE ?auto_171935 ?auto_171936 ?auto_171937 ?auto_171938 ?auto_171939 ?auto_171940 ?auto_171941 ?auto_171942 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171944 - BLOCK
      ?auto_171945 - BLOCK
      ?auto_171946 - BLOCK
      ?auto_171947 - BLOCK
      ?auto_171948 - BLOCK
      ?auto_171949 - BLOCK
      ?auto_171950 - BLOCK
      ?auto_171951 - BLOCK
    )
    :vars
    (
      ?auto_171952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171944 ) ( ON ?auto_171945 ?auto_171944 ) ( not ( = ?auto_171944 ?auto_171945 ) ) ( not ( = ?auto_171944 ?auto_171946 ) ) ( not ( = ?auto_171944 ?auto_171947 ) ) ( not ( = ?auto_171944 ?auto_171948 ) ) ( not ( = ?auto_171944 ?auto_171949 ) ) ( not ( = ?auto_171944 ?auto_171950 ) ) ( not ( = ?auto_171944 ?auto_171951 ) ) ( not ( = ?auto_171945 ?auto_171946 ) ) ( not ( = ?auto_171945 ?auto_171947 ) ) ( not ( = ?auto_171945 ?auto_171948 ) ) ( not ( = ?auto_171945 ?auto_171949 ) ) ( not ( = ?auto_171945 ?auto_171950 ) ) ( not ( = ?auto_171945 ?auto_171951 ) ) ( not ( = ?auto_171946 ?auto_171947 ) ) ( not ( = ?auto_171946 ?auto_171948 ) ) ( not ( = ?auto_171946 ?auto_171949 ) ) ( not ( = ?auto_171946 ?auto_171950 ) ) ( not ( = ?auto_171946 ?auto_171951 ) ) ( not ( = ?auto_171947 ?auto_171948 ) ) ( not ( = ?auto_171947 ?auto_171949 ) ) ( not ( = ?auto_171947 ?auto_171950 ) ) ( not ( = ?auto_171947 ?auto_171951 ) ) ( not ( = ?auto_171948 ?auto_171949 ) ) ( not ( = ?auto_171948 ?auto_171950 ) ) ( not ( = ?auto_171948 ?auto_171951 ) ) ( not ( = ?auto_171949 ?auto_171950 ) ) ( not ( = ?auto_171949 ?auto_171951 ) ) ( not ( = ?auto_171950 ?auto_171951 ) ) ( ON ?auto_171951 ?auto_171952 ) ( not ( = ?auto_171944 ?auto_171952 ) ) ( not ( = ?auto_171945 ?auto_171952 ) ) ( not ( = ?auto_171946 ?auto_171952 ) ) ( not ( = ?auto_171947 ?auto_171952 ) ) ( not ( = ?auto_171948 ?auto_171952 ) ) ( not ( = ?auto_171949 ?auto_171952 ) ) ( not ( = ?auto_171950 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171952 ) ) ( ON ?auto_171950 ?auto_171951 ) ( ON-TABLE ?auto_171952 ) ( ON ?auto_171949 ?auto_171950 ) ( ON ?auto_171948 ?auto_171949 ) ( ON ?auto_171947 ?auto_171948 ) ( CLEAR ?auto_171947 ) ( HOLDING ?auto_171946 ) ( CLEAR ?auto_171945 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171944 ?auto_171945 ?auto_171946 )
      ( MAKE-8PILE ?auto_171944 ?auto_171945 ?auto_171946 ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171950 ?auto_171951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171953 - BLOCK
      ?auto_171954 - BLOCK
      ?auto_171955 - BLOCK
      ?auto_171956 - BLOCK
      ?auto_171957 - BLOCK
      ?auto_171958 - BLOCK
      ?auto_171959 - BLOCK
      ?auto_171960 - BLOCK
    )
    :vars
    (
      ?auto_171961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171953 ) ( ON ?auto_171954 ?auto_171953 ) ( not ( = ?auto_171953 ?auto_171954 ) ) ( not ( = ?auto_171953 ?auto_171955 ) ) ( not ( = ?auto_171953 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171957 ) ) ( not ( = ?auto_171953 ?auto_171958 ) ) ( not ( = ?auto_171953 ?auto_171959 ) ) ( not ( = ?auto_171953 ?auto_171960 ) ) ( not ( = ?auto_171954 ?auto_171955 ) ) ( not ( = ?auto_171954 ?auto_171956 ) ) ( not ( = ?auto_171954 ?auto_171957 ) ) ( not ( = ?auto_171954 ?auto_171958 ) ) ( not ( = ?auto_171954 ?auto_171959 ) ) ( not ( = ?auto_171954 ?auto_171960 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( not ( = ?auto_171955 ?auto_171957 ) ) ( not ( = ?auto_171955 ?auto_171958 ) ) ( not ( = ?auto_171955 ?auto_171959 ) ) ( not ( = ?auto_171955 ?auto_171960 ) ) ( not ( = ?auto_171956 ?auto_171957 ) ) ( not ( = ?auto_171956 ?auto_171958 ) ) ( not ( = ?auto_171956 ?auto_171959 ) ) ( not ( = ?auto_171956 ?auto_171960 ) ) ( not ( = ?auto_171957 ?auto_171958 ) ) ( not ( = ?auto_171957 ?auto_171959 ) ) ( not ( = ?auto_171957 ?auto_171960 ) ) ( not ( = ?auto_171958 ?auto_171959 ) ) ( not ( = ?auto_171958 ?auto_171960 ) ) ( not ( = ?auto_171959 ?auto_171960 ) ) ( ON ?auto_171960 ?auto_171961 ) ( not ( = ?auto_171953 ?auto_171961 ) ) ( not ( = ?auto_171954 ?auto_171961 ) ) ( not ( = ?auto_171955 ?auto_171961 ) ) ( not ( = ?auto_171956 ?auto_171961 ) ) ( not ( = ?auto_171957 ?auto_171961 ) ) ( not ( = ?auto_171958 ?auto_171961 ) ) ( not ( = ?auto_171959 ?auto_171961 ) ) ( not ( = ?auto_171960 ?auto_171961 ) ) ( ON ?auto_171959 ?auto_171960 ) ( ON-TABLE ?auto_171961 ) ( ON ?auto_171958 ?auto_171959 ) ( ON ?auto_171957 ?auto_171958 ) ( ON ?auto_171956 ?auto_171957 ) ( CLEAR ?auto_171954 ) ( ON ?auto_171955 ?auto_171956 ) ( CLEAR ?auto_171955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171961 ?auto_171960 ?auto_171959 ?auto_171958 ?auto_171957 ?auto_171956 )
      ( MAKE-8PILE ?auto_171953 ?auto_171954 ?auto_171955 ?auto_171956 ?auto_171957 ?auto_171958 ?auto_171959 ?auto_171960 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171962 - BLOCK
      ?auto_171963 - BLOCK
      ?auto_171964 - BLOCK
      ?auto_171965 - BLOCK
      ?auto_171966 - BLOCK
      ?auto_171967 - BLOCK
      ?auto_171968 - BLOCK
      ?auto_171969 - BLOCK
    )
    :vars
    (
      ?auto_171970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171962 ) ( not ( = ?auto_171962 ?auto_171963 ) ) ( not ( = ?auto_171962 ?auto_171964 ) ) ( not ( = ?auto_171962 ?auto_171965 ) ) ( not ( = ?auto_171962 ?auto_171966 ) ) ( not ( = ?auto_171962 ?auto_171967 ) ) ( not ( = ?auto_171962 ?auto_171968 ) ) ( not ( = ?auto_171962 ?auto_171969 ) ) ( not ( = ?auto_171963 ?auto_171964 ) ) ( not ( = ?auto_171963 ?auto_171965 ) ) ( not ( = ?auto_171963 ?auto_171966 ) ) ( not ( = ?auto_171963 ?auto_171967 ) ) ( not ( = ?auto_171963 ?auto_171968 ) ) ( not ( = ?auto_171963 ?auto_171969 ) ) ( not ( = ?auto_171964 ?auto_171965 ) ) ( not ( = ?auto_171964 ?auto_171966 ) ) ( not ( = ?auto_171964 ?auto_171967 ) ) ( not ( = ?auto_171964 ?auto_171968 ) ) ( not ( = ?auto_171964 ?auto_171969 ) ) ( not ( = ?auto_171965 ?auto_171966 ) ) ( not ( = ?auto_171965 ?auto_171967 ) ) ( not ( = ?auto_171965 ?auto_171968 ) ) ( not ( = ?auto_171965 ?auto_171969 ) ) ( not ( = ?auto_171966 ?auto_171967 ) ) ( not ( = ?auto_171966 ?auto_171968 ) ) ( not ( = ?auto_171966 ?auto_171969 ) ) ( not ( = ?auto_171967 ?auto_171968 ) ) ( not ( = ?auto_171967 ?auto_171969 ) ) ( not ( = ?auto_171968 ?auto_171969 ) ) ( ON ?auto_171969 ?auto_171970 ) ( not ( = ?auto_171962 ?auto_171970 ) ) ( not ( = ?auto_171963 ?auto_171970 ) ) ( not ( = ?auto_171964 ?auto_171970 ) ) ( not ( = ?auto_171965 ?auto_171970 ) ) ( not ( = ?auto_171966 ?auto_171970 ) ) ( not ( = ?auto_171967 ?auto_171970 ) ) ( not ( = ?auto_171968 ?auto_171970 ) ) ( not ( = ?auto_171969 ?auto_171970 ) ) ( ON ?auto_171968 ?auto_171969 ) ( ON-TABLE ?auto_171970 ) ( ON ?auto_171967 ?auto_171968 ) ( ON ?auto_171966 ?auto_171967 ) ( ON ?auto_171965 ?auto_171966 ) ( ON ?auto_171964 ?auto_171965 ) ( CLEAR ?auto_171964 ) ( HOLDING ?auto_171963 ) ( CLEAR ?auto_171962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171962 ?auto_171963 )
      ( MAKE-8PILE ?auto_171962 ?auto_171963 ?auto_171964 ?auto_171965 ?auto_171966 ?auto_171967 ?auto_171968 ?auto_171969 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171971 - BLOCK
      ?auto_171972 - BLOCK
      ?auto_171973 - BLOCK
      ?auto_171974 - BLOCK
      ?auto_171975 - BLOCK
      ?auto_171976 - BLOCK
      ?auto_171977 - BLOCK
      ?auto_171978 - BLOCK
    )
    :vars
    (
      ?auto_171979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171971 ) ( not ( = ?auto_171971 ?auto_171972 ) ) ( not ( = ?auto_171971 ?auto_171973 ) ) ( not ( = ?auto_171971 ?auto_171974 ) ) ( not ( = ?auto_171971 ?auto_171975 ) ) ( not ( = ?auto_171971 ?auto_171976 ) ) ( not ( = ?auto_171971 ?auto_171977 ) ) ( not ( = ?auto_171971 ?auto_171978 ) ) ( not ( = ?auto_171972 ?auto_171973 ) ) ( not ( = ?auto_171972 ?auto_171974 ) ) ( not ( = ?auto_171972 ?auto_171975 ) ) ( not ( = ?auto_171972 ?auto_171976 ) ) ( not ( = ?auto_171972 ?auto_171977 ) ) ( not ( = ?auto_171972 ?auto_171978 ) ) ( not ( = ?auto_171973 ?auto_171974 ) ) ( not ( = ?auto_171973 ?auto_171975 ) ) ( not ( = ?auto_171973 ?auto_171976 ) ) ( not ( = ?auto_171973 ?auto_171977 ) ) ( not ( = ?auto_171973 ?auto_171978 ) ) ( not ( = ?auto_171974 ?auto_171975 ) ) ( not ( = ?auto_171974 ?auto_171976 ) ) ( not ( = ?auto_171974 ?auto_171977 ) ) ( not ( = ?auto_171974 ?auto_171978 ) ) ( not ( = ?auto_171975 ?auto_171976 ) ) ( not ( = ?auto_171975 ?auto_171977 ) ) ( not ( = ?auto_171975 ?auto_171978 ) ) ( not ( = ?auto_171976 ?auto_171977 ) ) ( not ( = ?auto_171976 ?auto_171978 ) ) ( not ( = ?auto_171977 ?auto_171978 ) ) ( ON ?auto_171978 ?auto_171979 ) ( not ( = ?auto_171971 ?auto_171979 ) ) ( not ( = ?auto_171972 ?auto_171979 ) ) ( not ( = ?auto_171973 ?auto_171979 ) ) ( not ( = ?auto_171974 ?auto_171979 ) ) ( not ( = ?auto_171975 ?auto_171979 ) ) ( not ( = ?auto_171976 ?auto_171979 ) ) ( not ( = ?auto_171977 ?auto_171979 ) ) ( not ( = ?auto_171978 ?auto_171979 ) ) ( ON ?auto_171977 ?auto_171978 ) ( ON-TABLE ?auto_171979 ) ( ON ?auto_171976 ?auto_171977 ) ( ON ?auto_171975 ?auto_171976 ) ( ON ?auto_171974 ?auto_171975 ) ( ON ?auto_171973 ?auto_171974 ) ( CLEAR ?auto_171971 ) ( ON ?auto_171972 ?auto_171973 ) ( CLEAR ?auto_171972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171979 ?auto_171978 ?auto_171977 ?auto_171976 ?auto_171975 ?auto_171974 ?auto_171973 )
      ( MAKE-8PILE ?auto_171971 ?auto_171972 ?auto_171973 ?auto_171974 ?auto_171975 ?auto_171976 ?auto_171977 ?auto_171978 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171980 - BLOCK
      ?auto_171981 - BLOCK
      ?auto_171982 - BLOCK
      ?auto_171983 - BLOCK
      ?auto_171984 - BLOCK
      ?auto_171985 - BLOCK
      ?auto_171986 - BLOCK
      ?auto_171987 - BLOCK
    )
    :vars
    (
      ?auto_171988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171980 ?auto_171981 ) ) ( not ( = ?auto_171980 ?auto_171982 ) ) ( not ( = ?auto_171980 ?auto_171983 ) ) ( not ( = ?auto_171980 ?auto_171984 ) ) ( not ( = ?auto_171980 ?auto_171985 ) ) ( not ( = ?auto_171980 ?auto_171986 ) ) ( not ( = ?auto_171980 ?auto_171987 ) ) ( not ( = ?auto_171981 ?auto_171982 ) ) ( not ( = ?auto_171981 ?auto_171983 ) ) ( not ( = ?auto_171981 ?auto_171984 ) ) ( not ( = ?auto_171981 ?auto_171985 ) ) ( not ( = ?auto_171981 ?auto_171986 ) ) ( not ( = ?auto_171981 ?auto_171987 ) ) ( not ( = ?auto_171982 ?auto_171983 ) ) ( not ( = ?auto_171982 ?auto_171984 ) ) ( not ( = ?auto_171982 ?auto_171985 ) ) ( not ( = ?auto_171982 ?auto_171986 ) ) ( not ( = ?auto_171982 ?auto_171987 ) ) ( not ( = ?auto_171983 ?auto_171984 ) ) ( not ( = ?auto_171983 ?auto_171985 ) ) ( not ( = ?auto_171983 ?auto_171986 ) ) ( not ( = ?auto_171983 ?auto_171987 ) ) ( not ( = ?auto_171984 ?auto_171985 ) ) ( not ( = ?auto_171984 ?auto_171986 ) ) ( not ( = ?auto_171984 ?auto_171987 ) ) ( not ( = ?auto_171985 ?auto_171986 ) ) ( not ( = ?auto_171985 ?auto_171987 ) ) ( not ( = ?auto_171986 ?auto_171987 ) ) ( ON ?auto_171987 ?auto_171988 ) ( not ( = ?auto_171980 ?auto_171988 ) ) ( not ( = ?auto_171981 ?auto_171988 ) ) ( not ( = ?auto_171982 ?auto_171988 ) ) ( not ( = ?auto_171983 ?auto_171988 ) ) ( not ( = ?auto_171984 ?auto_171988 ) ) ( not ( = ?auto_171985 ?auto_171988 ) ) ( not ( = ?auto_171986 ?auto_171988 ) ) ( not ( = ?auto_171987 ?auto_171988 ) ) ( ON ?auto_171986 ?auto_171987 ) ( ON-TABLE ?auto_171988 ) ( ON ?auto_171985 ?auto_171986 ) ( ON ?auto_171984 ?auto_171985 ) ( ON ?auto_171983 ?auto_171984 ) ( ON ?auto_171982 ?auto_171983 ) ( ON ?auto_171981 ?auto_171982 ) ( CLEAR ?auto_171981 ) ( HOLDING ?auto_171980 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171980 )
      ( MAKE-8PILE ?auto_171980 ?auto_171981 ?auto_171982 ?auto_171983 ?auto_171984 ?auto_171985 ?auto_171986 ?auto_171987 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_171989 - BLOCK
      ?auto_171990 - BLOCK
      ?auto_171991 - BLOCK
      ?auto_171992 - BLOCK
      ?auto_171993 - BLOCK
      ?auto_171994 - BLOCK
      ?auto_171995 - BLOCK
      ?auto_171996 - BLOCK
    )
    :vars
    (
      ?auto_171997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171989 ?auto_171990 ) ) ( not ( = ?auto_171989 ?auto_171991 ) ) ( not ( = ?auto_171989 ?auto_171992 ) ) ( not ( = ?auto_171989 ?auto_171993 ) ) ( not ( = ?auto_171989 ?auto_171994 ) ) ( not ( = ?auto_171989 ?auto_171995 ) ) ( not ( = ?auto_171989 ?auto_171996 ) ) ( not ( = ?auto_171990 ?auto_171991 ) ) ( not ( = ?auto_171990 ?auto_171992 ) ) ( not ( = ?auto_171990 ?auto_171993 ) ) ( not ( = ?auto_171990 ?auto_171994 ) ) ( not ( = ?auto_171990 ?auto_171995 ) ) ( not ( = ?auto_171990 ?auto_171996 ) ) ( not ( = ?auto_171991 ?auto_171992 ) ) ( not ( = ?auto_171991 ?auto_171993 ) ) ( not ( = ?auto_171991 ?auto_171994 ) ) ( not ( = ?auto_171991 ?auto_171995 ) ) ( not ( = ?auto_171991 ?auto_171996 ) ) ( not ( = ?auto_171992 ?auto_171993 ) ) ( not ( = ?auto_171992 ?auto_171994 ) ) ( not ( = ?auto_171992 ?auto_171995 ) ) ( not ( = ?auto_171992 ?auto_171996 ) ) ( not ( = ?auto_171993 ?auto_171994 ) ) ( not ( = ?auto_171993 ?auto_171995 ) ) ( not ( = ?auto_171993 ?auto_171996 ) ) ( not ( = ?auto_171994 ?auto_171995 ) ) ( not ( = ?auto_171994 ?auto_171996 ) ) ( not ( = ?auto_171995 ?auto_171996 ) ) ( ON ?auto_171996 ?auto_171997 ) ( not ( = ?auto_171989 ?auto_171997 ) ) ( not ( = ?auto_171990 ?auto_171997 ) ) ( not ( = ?auto_171991 ?auto_171997 ) ) ( not ( = ?auto_171992 ?auto_171997 ) ) ( not ( = ?auto_171993 ?auto_171997 ) ) ( not ( = ?auto_171994 ?auto_171997 ) ) ( not ( = ?auto_171995 ?auto_171997 ) ) ( not ( = ?auto_171996 ?auto_171997 ) ) ( ON ?auto_171995 ?auto_171996 ) ( ON-TABLE ?auto_171997 ) ( ON ?auto_171994 ?auto_171995 ) ( ON ?auto_171993 ?auto_171994 ) ( ON ?auto_171992 ?auto_171993 ) ( ON ?auto_171991 ?auto_171992 ) ( ON ?auto_171990 ?auto_171991 ) ( ON ?auto_171989 ?auto_171990 ) ( CLEAR ?auto_171989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171997 ?auto_171996 ?auto_171995 ?auto_171994 ?auto_171993 ?auto_171992 ?auto_171991 ?auto_171990 )
      ( MAKE-8PILE ?auto_171989 ?auto_171990 ?auto_171991 ?auto_171992 ?auto_171993 ?auto_171994 ?auto_171995 ?auto_171996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172005 - BLOCK
      ?auto_172006 - BLOCK
      ?auto_172007 - BLOCK
      ?auto_172008 - BLOCK
      ?auto_172009 - BLOCK
      ?auto_172010 - BLOCK
      ?auto_172011 - BLOCK
    )
    :vars
    (
      ?auto_172012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172012 ?auto_172011 ) ( CLEAR ?auto_172012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172005 ) ( ON ?auto_172006 ?auto_172005 ) ( ON ?auto_172007 ?auto_172006 ) ( ON ?auto_172008 ?auto_172007 ) ( ON ?auto_172009 ?auto_172008 ) ( ON ?auto_172010 ?auto_172009 ) ( ON ?auto_172011 ?auto_172010 ) ( not ( = ?auto_172005 ?auto_172006 ) ) ( not ( = ?auto_172005 ?auto_172007 ) ) ( not ( = ?auto_172005 ?auto_172008 ) ) ( not ( = ?auto_172005 ?auto_172009 ) ) ( not ( = ?auto_172005 ?auto_172010 ) ) ( not ( = ?auto_172005 ?auto_172011 ) ) ( not ( = ?auto_172005 ?auto_172012 ) ) ( not ( = ?auto_172006 ?auto_172007 ) ) ( not ( = ?auto_172006 ?auto_172008 ) ) ( not ( = ?auto_172006 ?auto_172009 ) ) ( not ( = ?auto_172006 ?auto_172010 ) ) ( not ( = ?auto_172006 ?auto_172011 ) ) ( not ( = ?auto_172006 ?auto_172012 ) ) ( not ( = ?auto_172007 ?auto_172008 ) ) ( not ( = ?auto_172007 ?auto_172009 ) ) ( not ( = ?auto_172007 ?auto_172010 ) ) ( not ( = ?auto_172007 ?auto_172011 ) ) ( not ( = ?auto_172007 ?auto_172012 ) ) ( not ( = ?auto_172008 ?auto_172009 ) ) ( not ( = ?auto_172008 ?auto_172010 ) ) ( not ( = ?auto_172008 ?auto_172011 ) ) ( not ( = ?auto_172008 ?auto_172012 ) ) ( not ( = ?auto_172009 ?auto_172010 ) ) ( not ( = ?auto_172009 ?auto_172011 ) ) ( not ( = ?auto_172009 ?auto_172012 ) ) ( not ( = ?auto_172010 ?auto_172011 ) ) ( not ( = ?auto_172010 ?auto_172012 ) ) ( not ( = ?auto_172011 ?auto_172012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172012 ?auto_172011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172030 - BLOCK
      ?auto_172031 - BLOCK
      ?auto_172032 - BLOCK
      ?auto_172033 - BLOCK
      ?auto_172034 - BLOCK
      ?auto_172035 - BLOCK
      ?auto_172036 - BLOCK
    )
    :vars
    (
      ?auto_172037 - BLOCK
      ?auto_172038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172030 ) ( ON ?auto_172031 ?auto_172030 ) ( ON ?auto_172032 ?auto_172031 ) ( ON ?auto_172033 ?auto_172032 ) ( ON ?auto_172034 ?auto_172033 ) ( ON ?auto_172035 ?auto_172034 ) ( not ( = ?auto_172030 ?auto_172031 ) ) ( not ( = ?auto_172030 ?auto_172032 ) ) ( not ( = ?auto_172030 ?auto_172033 ) ) ( not ( = ?auto_172030 ?auto_172034 ) ) ( not ( = ?auto_172030 ?auto_172035 ) ) ( not ( = ?auto_172030 ?auto_172036 ) ) ( not ( = ?auto_172030 ?auto_172037 ) ) ( not ( = ?auto_172031 ?auto_172032 ) ) ( not ( = ?auto_172031 ?auto_172033 ) ) ( not ( = ?auto_172031 ?auto_172034 ) ) ( not ( = ?auto_172031 ?auto_172035 ) ) ( not ( = ?auto_172031 ?auto_172036 ) ) ( not ( = ?auto_172031 ?auto_172037 ) ) ( not ( = ?auto_172032 ?auto_172033 ) ) ( not ( = ?auto_172032 ?auto_172034 ) ) ( not ( = ?auto_172032 ?auto_172035 ) ) ( not ( = ?auto_172032 ?auto_172036 ) ) ( not ( = ?auto_172032 ?auto_172037 ) ) ( not ( = ?auto_172033 ?auto_172034 ) ) ( not ( = ?auto_172033 ?auto_172035 ) ) ( not ( = ?auto_172033 ?auto_172036 ) ) ( not ( = ?auto_172033 ?auto_172037 ) ) ( not ( = ?auto_172034 ?auto_172035 ) ) ( not ( = ?auto_172034 ?auto_172036 ) ) ( not ( = ?auto_172034 ?auto_172037 ) ) ( not ( = ?auto_172035 ?auto_172036 ) ) ( not ( = ?auto_172035 ?auto_172037 ) ) ( not ( = ?auto_172036 ?auto_172037 ) ) ( ON ?auto_172037 ?auto_172038 ) ( CLEAR ?auto_172037 ) ( not ( = ?auto_172030 ?auto_172038 ) ) ( not ( = ?auto_172031 ?auto_172038 ) ) ( not ( = ?auto_172032 ?auto_172038 ) ) ( not ( = ?auto_172033 ?auto_172038 ) ) ( not ( = ?auto_172034 ?auto_172038 ) ) ( not ( = ?auto_172035 ?auto_172038 ) ) ( not ( = ?auto_172036 ?auto_172038 ) ) ( not ( = ?auto_172037 ?auto_172038 ) ) ( HOLDING ?auto_172036 ) ( CLEAR ?auto_172035 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172030 ?auto_172031 ?auto_172032 ?auto_172033 ?auto_172034 ?auto_172035 ?auto_172036 ?auto_172037 )
      ( MAKE-7PILE ?auto_172030 ?auto_172031 ?auto_172032 ?auto_172033 ?auto_172034 ?auto_172035 ?auto_172036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172039 - BLOCK
      ?auto_172040 - BLOCK
      ?auto_172041 - BLOCK
      ?auto_172042 - BLOCK
      ?auto_172043 - BLOCK
      ?auto_172044 - BLOCK
      ?auto_172045 - BLOCK
    )
    :vars
    (
      ?auto_172047 - BLOCK
      ?auto_172046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172039 ) ( ON ?auto_172040 ?auto_172039 ) ( ON ?auto_172041 ?auto_172040 ) ( ON ?auto_172042 ?auto_172041 ) ( ON ?auto_172043 ?auto_172042 ) ( ON ?auto_172044 ?auto_172043 ) ( not ( = ?auto_172039 ?auto_172040 ) ) ( not ( = ?auto_172039 ?auto_172041 ) ) ( not ( = ?auto_172039 ?auto_172042 ) ) ( not ( = ?auto_172039 ?auto_172043 ) ) ( not ( = ?auto_172039 ?auto_172044 ) ) ( not ( = ?auto_172039 ?auto_172045 ) ) ( not ( = ?auto_172039 ?auto_172047 ) ) ( not ( = ?auto_172040 ?auto_172041 ) ) ( not ( = ?auto_172040 ?auto_172042 ) ) ( not ( = ?auto_172040 ?auto_172043 ) ) ( not ( = ?auto_172040 ?auto_172044 ) ) ( not ( = ?auto_172040 ?auto_172045 ) ) ( not ( = ?auto_172040 ?auto_172047 ) ) ( not ( = ?auto_172041 ?auto_172042 ) ) ( not ( = ?auto_172041 ?auto_172043 ) ) ( not ( = ?auto_172041 ?auto_172044 ) ) ( not ( = ?auto_172041 ?auto_172045 ) ) ( not ( = ?auto_172041 ?auto_172047 ) ) ( not ( = ?auto_172042 ?auto_172043 ) ) ( not ( = ?auto_172042 ?auto_172044 ) ) ( not ( = ?auto_172042 ?auto_172045 ) ) ( not ( = ?auto_172042 ?auto_172047 ) ) ( not ( = ?auto_172043 ?auto_172044 ) ) ( not ( = ?auto_172043 ?auto_172045 ) ) ( not ( = ?auto_172043 ?auto_172047 ) ) ( not ( = ?auto_172044 ?auto_172045 ) ) ( not ( = ?auto_172044 ?auto_172047 ) ) ( not ( = ?auto_172045 ?auto_172047 ) ) ( ON ?auto_172047 ?auto_172046 ) ( not ( = ?auto_172039 ?auto_172046 ) ) ( not ( = ?auto_172040 ?auto_172046 ) ) ( not ( = ?auto_172041 ?auto_172046 ) ) ( not ( = ?auto_172042 ?auto_172046 ) ) ( not ( = ?auto_172043 ?auto_172046 ) ) ( not ( = ?auto_172044 ?auto_172046 ) ) ( not ( = ?auto_172045 ?auto_172046 ) ) ( not ( = ?auto_172047 ?auto_172046 ) ) ( CLEAR ?auto_172044 ) ( ON ?auto_172045 ?auto_172047 ) ( CLEAR ?auto_172045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172046 ?auto_172047 )
      ( MAKE-7PILE ?auto_172039 ?auto_172040 ?auto_172041 ?auto_172042 ?auto_172043 ?auto_172044 ?auto_172045 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172048 - BLOCK
      ?auto_172049 - BLOCK
      ?auto_172050 - BLOCK
      ?auto_172051 - BLOCK
      ?auto_172052 - BLOCK
      ?auto_172053 - BLOCK
      ?auto_172054 - BLOCK
    )
    :vars
    (
      ?auto_172056 - BLOCK
      ?auto_172055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172048 ) ( ON ?auto_172049 ?auto_172048 ) ( ON ?auto_172050 ?auto_172049 ) ( ON ?auto_172051 ?auto_172050 ) ( ON ?auto_172052 ?auto_172051 ) ( not ( = ?auto_172048 ?auto_172049 ) ) ( not ( = ?auto_172048 ?auto_172050 ) ) ( not ( = ?auto_172048 ?auto_172051 ) ) ( not ( = ?auto_172048 ?auto_172052 ) ) ( not ( = ?auto_172048 ?auto_172053 ) ) ( not ( = ?auto_172048 ?auto_172054 ) ) ( not ( = ?auto_172048 ?auto_172056 ) ) ( not ( = ?auto_172049 ?auto_172050 ) ) ( not ( = ?auto_172049 ?auto_172051 ) ) ( not ( = ?auto_172049 ?auto_172052 ) ) ( not ( = ?auto_172049 ?auto_172053 ) ) ( not ( = ?auto_172049 ?auto_172054 ) ) ( not ( = ?auto_172049 ?auto_172056 ) ) ( not ( = ?auto_172050 ?auto_172051 ) ) ( not ( = ?auto_172050 ?auto_172052 ) ) ( not ( = ?auto_172050 ?auto_172053 ) ) ( not ( = ?auto_172050 ?auto_172054 ) ) ( not ( = ?auto_172050 ?auto_172056 ) ) ( not ( = ?auto_172051 ?auto_172052 ) ) ( not ( = ?auto_172051 ?auto_172053 ) ) ( not ( = ?auto_172051 ?auto_172054 ) ) ( not ( = ?auto_172051 ?auto_172056 ) ) ( not ( = ?auto_172052 ?auto_172053 ) ) ( not ( = ?auto_172052 ?auto_172054 ) ) ( not ( = ?auto_172052 ?auto_172056 ) ) ( not ( = ?auto_172053 ?auto_172054 ) ) ( not ( = ?auto_172053 ?auto_172056 ) ) ( not ( = ?auto_172054 ?auto_172056 ) ) ( ON ?auto_172056 ?auto_172055 ) ( not ( = ?auto_172048 ?auto_172055 ) ) ( not ( = ?auto_172049 ?auto_172055 ) ) ( not ( = ?auto_172050 ?auto_172055 ) ) ( not ( = ?auto_172051 ?auto_172055 ) ) ( not ( = ?auto_172052 ?auto_172055 ) ) ( not ( = ?auto_172053 ?auto_172055 ) ) ( not ( = ?auto_172054 ?auto_172055 ) ) ( not ( = ?auto_172056 ?auto_172055 ) ) ( ON ?auto_172054 ?auto_172056 ) ( CLEAR ?auto_172054 ) ( ON-TABLE ?auto_172055 ) ( HOLDING ?auto_172053 ) ( CLEAR ?auto_172052 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172048 ?auto_172049 ?auto_172050 ?auto_172051 ?auto_172052 ?auto_172053 )
      ( MAKE-7PILE ?auto_172048 ?auto_172049 ?auto_172050 ?auto_172051 ?auto_172052 ?auto_172053 ?auto_172054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172057 - BLOCK
      ?auto_172058 - BLOCK
      ?auto_172059 - BLOCK
      ?auto_172060 - BLOCK
      ?auto_172061 - BLOCK
      ?auto_172062 - BLOCK
      ?auto_172063 - BLOCK
    )
    :vars
    (
      ?auto_172065 - BLOCK
      ?auto_172064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172057 ) ( ON ?auto_172058 ?auto_172057 ) ( ON ?auto_172059 ?auto_172058 ) ( ON ?auto_172060 ?auto_172059 ) ( ON ?auto_172061 ?auto_172060 ) ( not ( = ?auto_172057 ?auto_172058 ) ) ( not ( = ?auto_172057 ?auto_172059 ) ) ( not ( = ?auto_172057 ?auto_172060 ) ) ( not ( = ?auto_172057 ?auto_172061 ) ) ( not ( = ?auto_172057 ?auto_172062 ) ) ( not ( = ?auto_172057 ?auto_172063 ) ) ( not ( = ?auto_172057 ?auto_172065 ) ) ( not ( = ?auto_172058 ?auto_172059 ) ) ( not ( = ?auto_172058 ?auto_172060 ) ) ( not ( = ?auto_172058 ?auto_172061 ) ) ( not ( = ?auto_172058 ?auto_172062 ) ) ( not ( = ?auto_172058 ?auto_172063 ) ) ( not ( = ?auto_172058 ?auto_172065 ) ) ( not ( = ?auto_172059 ?auto_172060 ) ) ( not ( = ?auto_172059 ?auto_172061 ) ) ( not ( = ?auto_172059 ?auto_172062 ) ) ( not ( = ?auto_172059 ?auto_172063 ) ) ( not ( = ?auto_172059 ?auto_172065 ) ) ( not ( = ?auto_172060 ?auto_172061 ) ) ( not ( = ?auto_172060 ?auto_172062 ) ) ( not ( = ?auto_172060 ?auto_172063 ) ) ( not ( = ?auto_172060 ?auto_172065 ) ) ( not ( = ?auto_172061 ?auto_172062 ) ) ( not ( = ?auto_172061 ?auto_172063 ) ) ( not ( = ?auto_172061 ?auto_172065 ) ) ( not ( = ?auto_172062 ?auto_172063 ) ) ( not ( = ?auto_172062 ?auto_172065 ) ) ( not ( = ?auto_172063 ?auto_172065 ) ) ( ON ?auto_172065 ?auto_172064 ) ( not ( = ?auto_172057 ?auto_172064 ) ) ( not ( = ?auto_172058 ?auto_172064 ) ) ( not ( = ?auto_172059 ?auto_172064 ) ) ( not ( = ?auto_172060 ?auto_172064 ) ) ( not ( = ?auto_172061 ?auto_172064 ) ) ( not ( = ?auto_172062 ?auto_172064 ) ) ( not ( = ?auto_172063 ?auto_172064 ) ) ( not ( = ?auto_172065 ?auto_172064 ) ) ( ON ?auto_172063 ?auto_172065 ) ( ON-TABLE ?auto_172064 ) ( CLEAR ?auto_172061 ) ( ON ?auto_172062 ?auto_172063 ) ( CLEAR ?auto_172062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172064 ?auto_172065 ?auto_172063 )
      ( MAKE-7PILE ?auto_172057 ?auto_172058 ?auto_172059 ?auto_172060 ?auto_172061 ?auto_172062 ?auto_172063 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172066 - BLOCK
      ?auto_172067 - BLOCK
      ?auto_172068 - BLOCK
      ?auto_172069 - BLOCK
      ?auto_172070 - BLOCK
      ?auto_172071 - BLOCK
      ?auto_172072 - BLOCK
    )
    :vars
    (
      ?auto_172073 - BLOCK
      ?auto_172074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172066 ) ( ON ?auto_172067 ?auto_172066 ) ( ON ?auto_172068 ?auto_172067 ) ( ON ?auto_172069 ?auto_172068 ) ( not ( = ?auto_172066 ?auto_172067 ) ) ( not ( = ?auto_172066 ?auto_172068 ) ) ( not ( = ?auto_172066 ?auto_172069 ) ) ( not ( = ?auto_172066 ?auto_172070 ) ) ( not ( = ?auto_172066 ?auto_172071 ) ) ( not ( = ?auto_172066 ?auto_172072 ) ) ( not ( = ?auto_172066 ?auto_172073 ) ) ( not ( = ?auto_172067 ?auto_172068 ) ) ( not ( = ?auto_172067 ?auto_172069 ) ) ( not ( = ?auto_172067 ?auto_172070 ) ) ( not ( = ?auto_172067 ?auto_172071 ) ) ( not ( = ?auto_172067 ?auto_172072 ) ) ( not ( = ?auto_172067 ?auto_172073 ) ) ( not ( = ?auto_172068 ?auto_172069 ) ) ( not ( = ?auto_172068 ?auto_172070 ) ) ( not ( = ?auto_172068 ?auto_172071 ) ) ( not ( = ?auto_172068 ?auto_172072 ) ) ( not ( = ?auto_172068 ?auto_172073 ) ) ( not ( = ?auto_172069 ?auto_172070 ) ) ( not ( = ?auto_172069 ?auto_172071 ) ) ( not ( = ?auto_172069 ?auto_172072 ) ) ( not ( = ?auto_172069 ?auto_172073 ) ) ( not ( = ?auto_172070 ?auto_172071 ) ) ( not ( = ?auto_172070 ?auto_172072 ) ) ( not ( = ?auto_172070 ?auto_172073 ) ) ( not ( = ?auto_172071 ?auto_172072 ) ) ( not ( = ?auto_172071 ?auto_172073 ) ) ( not ( = ?auto_172072 ?auto_172073 ) ) ( ON ?auto_172073 ?auto_172074 ) ( not ( = ?auto_172066 ?auto_172074 ) ) ( not ( = ?auto_172067 ?auto_172074 ) ) ( not ( = ?auto_172068 ?auto_172074 ) ) ( not ( = ?auto_172069 ?auto_172074 ) ) ( not ( = ?auto_172070 ?auto_172074 ) ) ( not ( = ?auto_172071 ?auto_172074 ) ) ( not ( = ?auto_172072 ?auto_172074 ) ) ( not ( = ?auto_172073 ?auto_172074 ) ) ( ON ?auto_172072 ?auto_172073 ) ( ON-TABLE ?auto_172074 ) ( ON ?auto_172071 ?auto_172072 ) ( CLEAR ?auto_172071 ) ( HOLDING ?auto_172070 ) ( CLEAR ?auto_172069 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172066 ?auto_172067 ?auto_172068 ?auto_172069 ?auto_172070 )
      ( MAKE-7PILE ?auto_172066 ?auto_172067 ?auto_172068 ?auto_172069 ?auto_172070 ?auto_172071 ?auto_172072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172075 - BLOCK
      ?auto_172076 - BLOCK
      ?auto_172077 - BLOCK
      ?auto_172078 - BLOCK
      ?auto_172079 - BLOCK
      ?auto_172080 - BLOCK
      ?auto_172081 - BLOCK
    )
    :vars
    (
      ?auto_172083 - BLOCK
      ?auto_172082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172075 ) ( ON ?auto_172076 ?auto_172075 ) ( ON ?auto_172077 ?auto_172076 ) ( ON ?auto_172078 ?auto_172077 ) ( not ( = ?auto_172075 ?auto_172076 ) ) ( not ( = ?auto_172075 ?auto_172077 ) ) ( not ( = ?auto_172075 ?auto_172078 ) ) ( not ( = ?auto_172075 ?auto_172079 ) ) ( not ( = ?auto_172075 ?auto_172080 ) ) ( not ( = ?auto_172075 ?auto_172081 ) ) ( not ( = ?auto_172075 ?auto_172083 ) ) ( not ( = ?auto_172076 ?auto_172077 ) ) ( not ( = ?auto_172076 ?auto_172078 ) ) ( not ( = ?auto_172076 ?auto_172079 ) ) ( not ( = ?auto_172076 ?auto_172080 ) ) ( not ( = ?auto_172076 ?auto_172081 ) ) ( not ( = ?auto_172076 ?auto_172083 ) ) ( not ( = ?auto_172077 ?auto_172078 ) ) ( not ( = ?auto_172077 ?auto_172079 ) ) ( not ( = ?auto_172077 ?auto_172080 ) ) ( not ( = ?auto_172077 ?auto_172081 ) ) ( not ( = ?auto_172077 ?auto_172083 ) ) ( not ( = ?auto_172078 ?auto_172079 ) ) ( not ( = ?auto_172078 ?auto_172080 ) ) ( not ( = ?auto_172078 ?auto_172081 ) ) ( not ( = ?auto_172078 ?auto_172083 ) ) ( not ( = ?auto_172079 ?auto_172080 ) ) ( not ( = ?auto_172079 ?auto_172081 ) ) ( not ( = ?auto_172079 ?auto_172083 ) ) ( not ( = ?auto_172080 ?auto_172081 ) ) ( not ( = ?auto_172080 ?auto_172083 ) ) ( not ( = ?auto_172081 ?auto_172083 ) ) ( ON ?auto_172083 ?auto_172082 ) ( not ( = ?auto_172075 ?auto_172082 ) ) ( not ( = ?auto_172076 ?auto_172082 ) ) ( not ( = ?auto_172077 ?auto_172082 ) ) ( not ( = ?auto_172078 ?auto_172082 ) ) ( not ( = ?auto_172079 ?auto_172082 ) ) ( not ( = ?auto_172080 ?auto_172082 ) ) ( not ( = ?auto_172081 ?auto_172082 ) ) ( not ( = ?auto_172083 ?auto_172082 ) ) ( ON ?auto_172081 ?auto_172083 ) ( ON-TABLE ?auto_172082 ) ( ON ?auto_172080 ?auto_172081 ) ( CLEAR ?auto_172078 ) ( ON ?auto_172079 ?auto_172080 ) ( CLEAR ?auto_172079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172082 ?auto_172083 ?auto_172081 ?auto_172080 )
      ( MAKE-7PILE ?auto_172075 ?auto_172076 ?auto_172077 ?auto_172078 ?auto_172079 ?auto_172080 ?auto_172081 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172084 - BLOCK
      ?auto_172085 - BLOCK
      ?auto_172086 - BLOCK
      ?auto_172087 - BLOCK
      ?auto_172088 - BLOCK
      ?auto_172089 - BLOCK
      ?auto_172090 - BLOCK
    )
    :vars
    (
      ?auto_172092 - BLOCK
      ?auto_172091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172084 ) ( ON ?auto_172085 ?auto_172084 ) ( ON ?auto_172086 ?auto_172085 ) ( not ( = ?auto_172084 ?auto_172085 ) ) ( not ( = ?auto_172084 ?auto_172086 ) ) ( not ( = ?auto_172084 ?auto_172087 ) ) ( not ( = ?auto_172084 ?auto_172088 ) ) ( not ( = ?auto_172084 ?auto_172089 ) ) ( not ( = ?auto_172084 ?auto_172090 ) ) ( not ( = ?auto_172084 ?auto_172092 ) ) ( not ( = ?auto_172085 ?auto_172086 ) ) ( not ( = ?auto_172085 ?auto_172087 ) ) ( not ( = ?auto_172085 ?auto_172088 ) ) ( not ( = ?auto_172085 ?auto_172089 ) ) ( not ( = ?auto_172085 ?auto_172090 ) ) ( not ( = ?auto_172085 ?auto_172092 ) ) ( not ( = ?auto_172086 ?auto_172087 ) ) ( not ( = ?auto_172086 ?auto_172088 ) ) ( not ( = ?auto_172086 ?auto_172089 ) ) ( not ( = ?auto_172086 ?auto_172090 ) ) ( not ( = ?auto_172086 ?auto_172092 ) ) ( not ( = ?auto_172087 ?auto_172088 ) ) ( not ( = ?auto_172087 ?auto_172089 ) ) ( not ( = ?auto_172087 ?auto_172090 ) ) ( not ( = ?auto_172087 ?auto_172092 ) ) ( not ( = ?auto_172088 ?auto_172089 ) ) ( not ( = ?auto_172088 ?auto_172090 ) ) ( not ( = ?auto_172088 ?auto_172092 ) ) ( not ( = ?auto_172089 ?auto_172090 ) ) ( not ( = ?auto_172089 ?auto_172092 ) ) ( not ( = ?auto_172090 ?auto_172092 ) ) ( ON ?auto_172092 ?auto_172091 ) ( not ( = ?auto_172084 ?auto_172091 ) ) ( not ( = ?auto_172085 ?auto_172091 ) ) ( not ( = ?auto_172086 ?auto_172091 ) ) ( not ( = ?auto_172087 ?auto_172091 ) ) ( not ( = ?auto_172088 ?auto_172091 ) ) ( not ( = ?auto_172089 ?auto_172091 ) ) ( not ( = ?auto_172090 ?auto_172091 ) ) ( not ( = ?auto_172092 ?auto_172091 ) ) ( ON ?auto_172090 ?auto_172092 ) ( ON-TABLE ?auto_172091 ) ( ON ?auto_172089 ?auto_172090 ) ( ON ?auto_172088 ?auto_172089 ) ( CLEAR ?auto_172088 ) ( HOLDING ?auto_172087 ) ( CLEAR ?auto_172086 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172084 ?auto_172085 ?auto_172086 ?auto_172087 )
      ( MAKE-7PILE ?auto_172084 ?auto_172085 ?auto_172086 ?auto_172087 ?auto_172088 ?auto_172089 ?auto_172090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172093 - BLOCK
      ?auto_172094 - BLOCK
      ?auto_172095 - BLOCK
      ?auto_172096 - BLOCK
      ?auto_172097 - BLOCK
      ?auto_172098 - BLOCK
      ?auto_172099 - BLOCK
    )
    :vars
    (
      ?auto_172101 - BLOCK
      ?auto_172100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172093 ) ( ON ?auto_172094 ?auto_172093 ) ( ON ?auto_172095 ?auto_172094 ) ( not ( = ?auto_172093 ?auto_172094 ) ) ( not ( = ?auto_172093 ?auto_172095 ) ) ( not ( = ?auto_172093 ?auto_172096 ) ) ( not ( = ?auto_172093 ?auto_172097 ) ) ( not ( = ?auto_172093 ?auto_172098 ) ) ( not ( = ?auto_172093 ?auto_172099 ) ) ( not ( = ?auto_172093 ?auto_172101 ) ) ( not ( = ?auto_172094 ?auto_172095 ) ) ( not ( = ?auto_172094 ?auto_172096 ) ) ( not ( = ?auto_172094 ?auto_172097 ) ) ( not ( = ?auto_172094 ?auto_172098 ) ) ( not ( = ?auto_172094 ?auto_172099 ) ) ( not ( = ?auto_172094 ?auto_172101 ) ) ( not ( = ?auto_172095 ?auto_172096 ) ) ( not ( = ?auto_172095 ?auto_172097 ) ) ( not ( = ?auto_172095 ?auto_172098 ) ) ( not ( = ?auto_172095 ?auto_172099 ) ) ( not ( = ?auto_172095 ?auto_172101 ) ) ( not ( = ?auto_172096 ?auto_172097 ) ) ( not ( = ?auto_172096 ?auto_172098 ) ) ( not ( = ?auto_172096 ?auto_172099 ) ) ( not ( = ?auto_172096 ?auto_172101 ) ) ( not ( = ?auto_172097 ?auto_172098 ) ) ( not ( = ?auto_172097 ?auto_172099 ) ) ( not ( = ?auto_172097 ?auto_172101 ) ) ( not ( = ?auto_172098 ?auto_172099 ) ) ( not ( = ?auto_172098 ?auto_172101 ) ) ( not ( = ?auto_172099 ?auto_172101 ) ) ( ON ?auto_172101 ?auto_172100 ) ( not ( = ?auto_172093 ?auto_172100 ) ) ( not ( = ?auto_172094 ?auto_172100 ) ) ( not ( = ?auto_172095 ?auto_172100 ) ) ( not ( = ?auto_172096 ?auto_172100 ) ) ( not ( = ?auto_172097 ?auto_172100 ) ) ( not ( = ?auto_172098 ?auto_172100 ) ) ( not ( = ?auto_172099 ?auto_172100 ) ) ( not ( = ?auto_172101 ?auto_172100 ) ) ( ON ?auto_172099 ?auto_172101 ) ( ON-TABLE ?auto_172100 ) ( ON ?auto_172098 ?auto_172099 ) ( ON ?auto_172097 ?auto_172098 ) ( CLEAR ?auto_172095 ) ( ON ?auto_172096 ?auto_172097 ) ( CLEAR ?auto_172096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172100 ?auto_172101 ?auto_172099 ?auto_172098 ?auto_172097 )
      ( MAKE-7PILE ?auto_172093 ?auto_172094 ?auto_172095 ?auto_172096 ?auto_172097 ?auto_172098 ?auto_172099 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172102 - BLOCK
      ?auto_172103 - BLOCK
      ?auto_172104 - BLOCK
      ?auto_172105 - BLOCK
      ?auto_172106 - BLOCK
      ?auto_172107 - BLOCK
      ?auto_172108 - BLOCK
    )
    :vars
    (
      ?auto_172109 - BLOCK
      ?auto_172110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172102 ) ( ON ?auto_172103 ?auto_172102 ) ( not ( = ?auto_172102 ?auto_172103 ) ) ( not ( = ?auto_172102 ?auto_172104 ) ) ( not ( = ?auto_172102 ?auto_172105 ) ) ( not ( = ?auto_172102 ?auto_172106 ) ) ( not ( = ?auto_172102 ?auto_172107 ) ) ( not ( = ?auto_172102 ?auto_172108 ) ) ( not ( = ?auto_172102 ?auto_172109 ) ) ( not ( = ?auto_172103 ?auto_172104 ) ) ( not ( = ?auto_172103 ?auto_172105 ) ) ( not ( = ?auto_172103 ?auto_172106 ) ) ( not ( = ?auto_172103 ?auto_172107 ) ) ( not ( = ?auto_172103 ?auto_172108 ) ) ( not ( = ?auto_172103 ?auto_172109 ) ) ( not ( = ?auto_172104 ?auto_172105 ) ) ( not ( = ?auto_172104 ?auto_172106 ) ) ( not ( = ?auto_172104 ?auto_172107 ) ) ( not ( = ?auto_172104 ?auto_172108 ) ) ( not ( = ?auto_172104 ?auto_172109 ) ) ( not ( = ?auto_172105 ?auto_172106 ) ) ( not ( = ?auto_172105 ?auto_172107 ) ) ( not ( = ?auto_172105 ?auto_172108 ) ) ( not ( = ?auto_172105 ?auto_172109 ) ) ( not ( = ?auto_172106 ?auto_172107 ) ) ( not ( = ?auto_172106 ?auto_172108 ) ) ( not ( = ?auto_172106 ?auto_172109 ) ) ( not ( = ?auto_172107 ?auto_172108 ) ) ( not ( = ?auto_172107 ?auto_172109 ) ) ( not ( = ?auto_172108 ?auto_172109 ) ) ( ON ?auto_172109 ?auto_172110 ) ( not ( = ?auto_172102 ?auto_172110 ) ) ( not ( = ?auto_172103 ?auto_172110 ) ) ( not ( = ?auto_172104 ?auto_172110 ) ) ( not ( = ?auto_172105 ?auto_172110 ) ) ( not ( = ?auto_172106 ?auto_172110 ) ) ( not ( = ?auto_172107 ?auto_172110 ) ) ( not ( = ?auto_172108 ?auto_172110 ) ) ( not ( = ?auto_172109 ?auto_172110 ) ) ( ON ?auto_172108 ?auto_172109 ) ( ON-TABLE ?auto_172110 ) ( ON ?auto_172107 ?auto_172108 ) ( ON ?auto_172106 ?auto_172107 ) ( ON ?auto_172105 ?auto_172106 ) ( CLEAR ?auto_172105 ) ( HOLDING ?auto_172104 ) ( CLEAR ?auto_172103 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172102 ?auto_172103 ?auto_172104 )
      ( MAKE-7PILE ?auto_172102 ?auto_172103 ?auto_172104 ?auto_172105 ?auto_172106 ?auto_172107 ?auto_172108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172111 - BLOCK
      ?auto_172112 - BLOCK
      ?auto_172113 - BLOCK
      ?auto_172114 - BLOCK
      ?auto_172115 - BLOCK
      ?auto_172116 - BLOCK
      ?auto_172117 - BLOCK
    )
    :vars
    (
      ?auto_172119 - BLOCK
      ?auto_172118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172111 ) ( ON ?auto_172112 ?auto_172111 ) ( not ( = ?auto_172111 ?auto_172112 ) ) ( not ( = ?auto_172111 ?auto_172113 ) ) ( not ( = ?auto_172111 ?auto_172114 ) ) ( not ( = ?auto_172111 ?auto_172115 ) ) ( not ( = ?auto_172111 ?auto_172116 ) ) ( not ( = ?auto_172111 ?auto_172117 ) ) ( not ( = ?auto_172111 ?auto_172119 ) ) ( not ( = ?auto_172112 ?auto_172113 ) ) ( not ( = ?auto_172112 ?auto_172114 ) ) ( not ( = ?auto_172112 ?auto_172115 ) ) ( not ( = ?auto_172112 ?auto_172116 ) ) ( not ( = ?auto_172112 ?auto_172117 ) ) ( not ( = ?auto_172112 ?auto_172119 ) ) ( not ( = ?auto_172113 ?auto_172114 ) ) ( not ( = ?auto_172113 ?auto_172115 ) ) ( not ( = ?auto_172113 ?auto_172116 ) ) ( not ( = ?auto_172113 ?auto_172117 ) ) ( not ( = ?auto_172113 ?auto_172119 ) ) ( not ( = ?auto_172114 ?auto_172115 ) ) ( not ( = ?auto_172114 ?auto_172116 ) ) ( not ( = ?auto_172114 ?auto_172117 ) ) ( not ( = ?auto_172114 ?auto_172119 ) ) ( not ( = ?auto_172115 ?auto_172116 ) ) ( not ( = ?auto_172115 ?auto_172117 ) ) ( not ( = ?auto_172115 ?auto_172119 ) ) ( not ( = ?auto_172116 ?auto_172117 ) ) ( not ( = ?auto_172116 ?auto_172119 ) ) ( not ( = ?auto_172117 ?auto_172119 ) ) ( ON ?auto_172119 ?auto_172118 ) ( not ( = ?auto_172111 ?auto_172118 ) ) ( not ( = ?auto_172112 ?auto_172118 ) ) ( not ( = ?auto_172113 ?auto_172118 ) ) ( not ( = ?auto_172114 ?auto_172118 ) ) ( not ( = ?auto_172115 ?auto_172118 ) ) ( not ( = ?auto_172116 ?auto_172118 ) ) ( not ( = ?auto_172117 ?auto_172118 ) ) ( not ( = ?auto_172119 ?auto_172118 ) ) ( ON ?auto_172117 ?auto_172119 ) ( ON-TABLE ?auto_172118 ) ( ON ?auto_172116 ?auto_172117 ) ( ON ?auto_172115 ?auto_172116 ) ( ON ?auto_172114 ?auto_172115 ) ( CLEAR ?auto_172112 ) ( ON ?auto_172113 ?auto_172114 ) ( CLEAR ?auto_172113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172118 ?auto_172119 ?auto_172117 ?auto_172116 ?auto_172115 ?auto_172114 )
      ( MAKE-7PILE ?auto_172111 ?auto_172112 ?auto_172113 ?auto_172114 ?auto_172115 ?auto_172116 ?auto_172117 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172120 - BLOCK
      ?auto_172121 - BLOCK
      ?auto_172122 - BLOCK
      ?auto_172123 - BLOCK
      ?auto_172124 - BLOCK
      ?auto_172125 - BLOCK
      ?auto_172126 - BLOCK
    )
    :vars
    (
      ?auto_172128 - BLOCK
      ?auto_172127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172120 ) ( not ( = ?auto_172120 ?auto_172121 ) ) ( not ( = ?auto_172120 ?auto_172122 ) ) ( not ( = ?auto_172120 ?auto_172123 ) ) ( not ( = ?auto_172120 ?auto_172124 ) ) ( not ( = ?auto_172120 ?auto_172125 ) ) ( not ( = ?auto_172120 ?auto_172126 ) ) ( not ( = ?auto_172120 ?auto_172128 ) ) ( not ( = ?auto_172121 ?auto_172122 ) ) ( not ( = ?auto_172121 ?auto_172123 ) ) ( not ( = ?auto_172121 ?auto_172124 ) ) ( not ( = ?auto_172121 ?auto_172125 ) ) ( not ( = ?auto_172121 ?auto_172126 ) ) ( not ( = ?auto_172121 ?auto_172128 ) ) ( not ( = ?auto_172122 ?auto_172123 ) ) ( not ( = ?auto_172122 ?auto_172124 ) ) ( not ( = ?auto_172122 ?auto_172125 ) ) ( not ( = ?auto_172122 ?auto_172126 ) ) ( not ( = ?auto_172122 ?auto_172128 ) ) ( not ( = ?auto_172123 ?auto_172124 ) ) ( not ( = ?auto_172123 ?auto_172125 ) ) ( not ( = ?auto_172123 ?auto_172126 ) ) ( not ( = ?auto_172123 ?auto_172128 ) ) ( not ( = ?auto_172124 ?auto_172125 ) ) ( not ( = ?auto_172124 ?auto_172126 ) ) ( not ( = ?auto_172124 ?auto_172128 ) ) ( not ( = ?auto_172125 ?auto_172126 ) ) ( not ( = ?auto_172125 ?auto_172128 ) ) ( not ( = ?auto_172126 ?auto_172128 ) ) ( ON ?auto_172128 ?auto_172127 ) ( not ( = ?auto_172120 ?auto_172127 ) ) ( not ( = ?auto_172121 ?auto_172127 ) ) ( not ( = ?auto_172122 ?auto_172127 ) ) ( not ( = ?auto_172123 ?auto_172127 ) ) ( not ( = ?auto_172124 ?auto_172127 ) ) ( not ( = ?auto_172125 ?auto_172127 ) ) ( not ( = ?auto_172126 ?auto_172127 ) ) ( not ( = ?auto_172128 ?auto_172127 ) ) ( ON ?auto_172126 ?auto_172128 ) ( ON-TABLE ?auto_172127 ) ( ON ?auto_172125 ?auto_172126 ) ( ON ?auto_172124 ?auto_172125 ) ( ON ?auto_172123 ?auto_172124 ) ( ON ?auto_172122 ?auto_172123 ) ( CLEAR ?auto_172122 ) ( HOLDING ?auto_172121 ) ( CLEAR ?auto_172120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172120 ?auto_172121 )
      ( MAKE-7PILE ?auto_172120 ?auto_172121 ?auto_172122 ?auto_172123 ?auto_172124 ?auto_172125 ?auto_172126 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172129 - BLOCK
      ?auto_172130 - BLOCK
      ?auto_172131 - BLOCK
      ?auto_172132 - BLOCK
      ?auto_172133 - BLOCK
      ?auto_172134 - BLOCK
      ?auto_172135 - BLOCK
    )
    :vars
    (
      ?auto_172137 - BLOCK
      ?auto_172136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172129 ) ( not ( = ?auto_172129 ?auto_172130 ) ) ( not ( = ?auto_172129 ?auto_172131 ) ) ( not ( = ?auto_172129 ?auto_172132 ) ) ( not ( = ?auto_172129 ?auto_172133 ) ) ( not ( = ?auto_172129 ?auto_172134 ) ) ( not ( = ?auto_172129 ?auto_172135 ) ) ( not ( = ?auto_172129 ?auto_172137 ) ) ( not ( = ?auto_172130 ?auto_172131 ) ) ( not ( = ?auto_172130 ?auto_172132 ) ) ( not ( = ?auto_172130 ?auto_172133 ) ) ( not ( = ?auto_172130 ?auto_172134 ) ) ( not ( = ?auto_172130 ?auto_172135 ) ) ( not ( = ?auto_172130 ?auto_172137 ) ) ( not ( = ?auto_172131 ?auto_172132 ) ) ( not ( = ?auto_172131 ?auto_172133 ) ) ( not ( = ?auto_172131 ?auto_172134 ) ) ( not ( = ?auto_172131 ?auto_172135 ) ) ( not ( = ?auto_172131 ?auto_172137 ) ) ( not ( = ?auto_172132 ?auto_172133 ) ) ( not ( = ?auto_172132 ?auto_172134 ) ) ( not ( = ?auto_172132 ?auto_172135 ) ) ( not ( = ?auto_172132 ?auto_172137 ) ) ( not ( = ?auto_172133 ?auto_172134 ) ) ( not ( = ?auto_172133 ?auto_172135 ) ) ( not ( = ?auto_172133 ?auto_172137 ) ) ( not ( = ?auto_172134 ?auto_172135 ) ) ( not ( = ?auto_172134 ?auto_172137 ) ) ( not ( = ?auto_172135 ?auto_172137 ) ) ( ON ?auto_172137 ?auto_172136 ) ( not ( = ?auto_172129 ?auto_172136 ) ) ( not ( = ?auto_172130 ?auto_172136 ) ) ( not ( = ?auto_172131 ?auto_172136 ) ) ( not ( = ?auto_172132 ?auto_172136 ) ) ( not ( = ?auto_172133 ?auto_172136 ) ) ( not ( = ?auto_172134 ?auto_172136 ) ) ( not ( = ?auto_172135 ?auto_172136 ) ) ( not ( = ?auto_172137 ?auto_172136 ) ) ( ON ?auto_172135 ?auto_172137 ) ( ON-TABLE ?auto_172136 ) ( ON ?auto_172134 ?auto_172135 ) ( ON ?auto_172133 ?auto_172134 ) ( ON ?auto_172132 ?auto_172133 ) ( ON ?auto_172131 ?auto_172132 ) ( CLEAR ?auto_172129 ) ( ON ?auto_172130 ?auto_172131 ) ( CLEAR ?auto_172130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172136 ?auto_172137 ?auto_172135 ?auto_172134 ?auto_172133 ?auto_172132 ?auto_172131 )
      ( MAKE-7PILE ?auto_172129 ?auto_172130 ?auto_172131 ?auto_172132 ?auto_172133 ?auto_172134 ?auto_172135 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172138 - BLOCK
      ?auto_172139 - BLOCK
      ?auto_172140 - BLOCK
      ?auto_172141 - BLOCK
      ?auto_172142 - BLOCK
      ?auto_172143 - BLOCK
      ?auto_172144 - BLOCK
    )
    :vars
    (
      ?auto_172146 - BLOCK
      ?auto_172145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172138 ?auto_172139 ) ) ( not ( = ?auto_172138 ?auto_172140 ) ) ( not ( = ?auto_172138 ?auto_172141 ) ) ( not ( = ?auto_172138 ?auto_172142 ) ) ( not ( = ?auto_172138 ?auto_172143 ) ) ( not ( = ?auto_172138 ?auto_172144 ) ) ( not ( = ?auto_172138 ?auto_172146 ) ) ( not ( = ?auto_172139 ?auto_172140 ) ) ( not ( = ?auto_172139 ?auto_172141 ) ) ( not ( = ?auto_172139 ?auto_172142 ) ) ( not ( = ?auto_172139 ?auto_172143 ) ) ( not ( = ?auto_172139 ?auto_172144 ) ) ( not ( = ?auto_172139 ?auto_172146 ) ) ( not ( = ?auto_172140 ?auto_172141 ) ) ( not ( = ?auto_172140 ?auto_172142 ) ) ( not ( = ?auto_172140 ?auto_172143 ) ) ( not ( = ?auto_172140 ?auto_172144 ) ) ( not ( = ?auto_172140 ?auto_172146 ) ) ( not ( = ?auto_172141 ?auto_172142 ) ) ( not ( = ?auto_172141 ?auto_172143 ) ) ( not ( = ?auto_172141 ?auto_172144 ) ) ( not ( = ?auto_172141 ?auto_172146 ) ) ( not ( = ?auto_172142 ?auto_172143 ) ) ( not ( = ?auto_172142 ?auto_172144 ) ) ( not ( = ?auto_172142 ?auto_172146 ) ) ( not ( = ?auto_172143 ?auto_172144 ) ) ( not ( = ?auto_172143 ?auto_172146 ) ) ( not ( = ?auto_172144 ?auto_172146 ) ) ( ON ?auto_172146 ?auto_172145 ) ( not ( = ?auto_172138 ?auto_172145 ) ) ( not ( = ?auto_172139 ?auto_172145 ) ) ( not ( = ?auto_172140 ?auto_172145 ) ) ( not ( = ?auto_172141 ?auto_172145 ) ) ( not ( = ?auto_172142 ?auto_172145 ) ) ( not ( = ?auto_172143 ?auto_172145 ) ) ( not ( = ?auto_172144 ?auto_172145 ) ) ( not ( = ?auto_172146 ?auto_172145 ) ) ( ON ?auto_172144 ?auto_172146 ) ( ON-TABLE ?auto_172145 ) ( ON ?auto_172143 ?auto_172144 ) ( ON ?auto_172142 ?auto_172143 ) ( ON ?auto_172141 ?auto_172142 ) ( ON ?auto_172140 ?auto_172141 ) ( ON ?auto_172139 ?auto_172140 ) ( CLEAR ?auto_172139 ) ( HOLDING ?auto_172138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172138 )
      ( MAKE-7PILE ?auto_172138 ?auto_172139 ?auto_172140 ?auto_172141 ?auto_172142 ?auto_172143 ?auto_172144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172147 - BLOCK
      ?auto_172148 - BLOCK
      ?auto_172149 - BLOCK
      ?auto_172150 - BLOCK
      ?auto_172151 - BLOCK
      ?auto_172152 - BLOCK
      ?auto_172153 - BLOCK
    )
    :vars
    (
      ?auto_172154 - BLOCK
      ?auto_172155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172147 ?auto_172148 ) ) ( not ( = ?auto_172147 ?auto_172149 ) ) ( not ( = ?auto_172147 ?auto_172150 ) ) ( not ( = ?auto_172147 ?auto_172151 ) ) ( not ( = ?auto_172147 ?auto_172152 ) ) ( not ( = ?auto_172147 ?auto_172153 ) ) ( not ( = ?auto_172147 ?auto_172154 ) ) ( not ( = ?auto_172148 ?auto_172149 ) ) ( not ( = ?auto_172148 ?auto_172150 ) ) ( not ( = ?auto_172148 ?auto_172151 ) ) ( not ( = ?auto_172148 ?auto_172152 ) ) ( not ( = ?auto_172148 ?auto_172153 ) ) ( not ( = ?auto_172148 ?auto_172154 ) ) ( not ( = ?auto_172149 ?auto_172150 ) ) ( not ( = ?auto_172149 ?auto_172151 ) ) ( not ( = ?auto_172149 ?auto_172152 ) ) ( not ( = ?auto_172149 ?auto_172153 ) ) ( not ( = ?auto_172149 ?auto_172154 ) ) ( not ( = ?auto_172150 ?auto_172151 ) ) ( not ( = ?auto_172150 ?auto_172152 ) ) ( not ( = ?auto_172150 ?auto_172153 ) ) ( not ( = ?auto_172150 ?auto_172154 ) ) ( not ( = ?auto_172151 ?auto_172152 ) ) ( not ( = ?auto_172151 ?auto_172153 ) ) ( not ( = ?auto_172151 ?auto_172154 ) ) ( not ( = ?auto_172152 ?auto_172153 ) ) ( not ( = ?auto_172152 ?auto_172154 ) ) ( not ( = ?auto_172153 ?auto_172154 ) ) ( ON ?auto_172154 ?auto_172155 ) ( not ( = ?auto_172147 ?auto_172155 ) ) ( not ( = ?auto_172148 ?auto_172155 ) ) ( not ( = ?auto_172149 ?auto_172155 ) ) ( not ( = ?auto_172150 ?auto_172155 ) ) ( not ( = ?auto_172151 ?auto_172155 ) ) ( not ( = ?auto_172152 ?auto_172155 ) ) ( not ( = ?auto_172153 ?auto_172155 ) ) ( not ( = ?auto_172154 ?auto_172155 ) ) ( ON ?auto_172153 ?auto_172154 ) ( ON-TABLE ?auto_172155 ) ( ON ?auto_172152 ?auto_172153 ) ( ON ?auto_172151 ?auto_172152 ) ( ON ?auto_172150 ?auto_172151 ) ( ON ?auto_172149 ?auto_172150 ) ( ON ?auto_172148 ?auto_172149 ) ( ON ?auto_172147 ?auto_172148 ) ( CLEAR ?auto_172147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172155 ?auto_172154 ?auto_172153 ?auto_172152 ?auto_172151 ?auto_172150 ?auto_172149 ?auto_172148 )
      ( MAKE-7PILE ?auto_172147 ?auto_172148 ?auto_172149 ?auto_172150 ?auto_172151 ?auto_172152 ?auto_172153 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_172157 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_172157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172158 - BLOCK
    )
    :vars
    (
      ?auto_172159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172158 ?auto_172159 ) ( CLEAR ?auto_172158 ) ( HAND-EMPTY ) ( not ( = ?auto_172158 ?auto_172159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172158 ?auto_172159 )
      ( MAKE-1PILE ?auto_172158 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172160 - BLOCK
    )
    :vars
    (
      ?auto_172161 - BLOCK
      ?auto_172164 - BLOCK
      ?auto_172162 - BLOCK
      ?auto_172167 - BLOCK
      ?auto_172163 - BLOCK
      ?auto_172166 - BLOCK
      ?auto_172165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172160 ?auto_172161 ) ) ( HOLDING ?auto_172160 ) ( CLEAR ?auto_172161 ) ( ON-TABLE ?auto_172164 ) ( ON ?auto_172162 ?auto_172164 ) ( ON ?auto_172167 ?auto_172162 ) ( ON ?auto_172163 ?auto_172167 ) ( ON ?auto_172166 ?auto_172163 ) ( ON ?auto_172165 ?auto_172166 ) ( ON ?auto_172161 ?auto_172165 ) ( not ( = ?auto_172164 ?auto_172162 ) ) ( not ( = ?auto_172164 ?auto_172167 ) ) ( not ( = ?auto_172164 ?auto_172163 ) ) ( not ( = ?auto_172164 ?auto_172166 ) ) ( not ( = ?auto_172164 ?auto_172165 ) ) ( not ( = ?auto_172164 ?auto_172161 ) ) ( not ( = ?auto_172164 ?auto_172160 ) ) ( not ( = ?auto_172162 ?auto_172167 ) ) ( not ( = ?auto_172162 ?auto_172163 ) ) ( not ( = ?auto_172162 ?auto_172166 ) ) ( not ( = ?auto_172162 ?auto_172165 ) ) ( not ( = ?auto_172162 ?auto_172161 ) ) ( not ( = ?auto_172162 ?auto_172160 ) ) ( not ( = ?auto_172167 ?auto_172163 ) ) ( not ( = ?auto_172167 ?auto_172166 ) ) ( not ( = ?auto_172167 ?auto_172165 ) ) ( not ( = ?auto_172167 ?auto_172161 ) ) ( not ( = ?auto_172167 ?auto_172160 ) ) ( not ( = ?auto_172163 ?auto_172166 ) ) ( not ( = ?auto_172163 ?auto_172165 ) ) ( not ( = ?auto_172163 ?auto_172161 ) ) ( not ( = ?auto_172163 ?auto_172160 ) ) ( not ( = ?auto_172166 ?auto_172165 ) ) ( not ( = ?auto_172166 ?auto_172161 ) ) ( not ( = ?auto_172166 ?auto_172160 ) ) ( not ( = ?auto_172165 ?auto_172161 ) ) ( not ( = ?auto_172165 ?auto_172160 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172164 ?auto_172162 ?auto_172167 ?auto_172163 ?auto_172166 ?auto_172165 ?auto_172161 ?auto_172160 )
      ( MAKE-1PILE ?auto_172160 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172168 - BLOCK
    )
    :vars
    (
      ?auto_172172 - BLOCK
      ?auto_172169 - BLOCK
      ?auto_172170 - BLOCK
      ?auto_172173 - BLOCK
      ?auto_172171 - BLOCK
      ?auto_172174 - BLOCK
      ?auto_172175 - BLOCK
      ?auto_172176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172168 ?auto_172172 ) ) ( CLEAR ?auto_172172 ) ( ON-TABLE ?auto_172169 ) ( ON ?auto_172170 ?auto_172169 ) ( ON ?auto_172173 ?auto_172170 ) ( ON ?auto_172171 ?auto_172173 ) ( ON ?auto_172174 ?auto_172171 ) ( ON ?auto_172175 ?auto_172174 ) ( ON ?auto_172172 ?auto_172175 ) ( not ( = ?auto_172169 ?auto_172170 ) ) ( not ( = ?auto_172169 ?auto_172173 ) ) ( not ( = ?auto_172169 ?auto_172171 ) ) ( not ( = ?auto_172169 ?auto_172174 ) ) ( not ( = ?auto_172169 ?auto_172175 ) ) ( not ( = ?auto_172169 ?auto_172172 ) ) ( not ( = ?auto_172169 ?auto_172168 ) ) ( not ( = ?auto_172170 ?auto_172173 ) ) ( not ( = ?auto_172170 ?auto_172171 ) ) ( not ( = ?auto_172170 ?auto_172174 ) ) ( not ( = ?auto_172170 ?auto_172175 ) ) ( not ( = ?auto_172170 ?auto_172172 ) ) ( not ( = ?auto_172170 ?auto_172168 ) ) ( not ( = ?auto_172173 ?auto_172171 ) ) ( not ( = ?auto_172173 ?auto_172174 ) ) ( not ( = ?auto_172173 ?auto_172175 ) ) ( not ( = ?auto_172173 ?auto_172172 ) ) ( not ( = ?auto_172173 ?auto_172168 ) ) ( not ( = ?auto_172171 ?auto_172174 ) ) ( not ( = ?auto_172171 ?auto_172175 ) ) ( not ( = ?auto_172171 ?auto_172172 ) ) ( not ( = ?auto_172171 ?auto_172168 ) ) ( not ( = ?auto_172174 ?auto_172175 ) ) ( not ( = ?auto_172174 ?auto_172172 ) ) ( not ( = ?auto_172174 ?auto_172168 ) ) ( not ( = ?auto_172175 ?auto_172172 ) ) ( not ( = ?auto_172175 ?auto_172168 ) ) ( ON ?auto_172168 ?auto_172176 ) ( CLEAR ?auto_172168 ) ( HAND-EMPTY ) ( not ( = ?auto_172168 ?auto_172176 ) ) ( not ( = ?auto_172172 ?auto_172176 ) ) ( not ( = ?auto_172169 ?auto_172176 ) ) ( not ( = ?auto_172170 ?auto_172176 ) ) ( not ( = ?auto_172173 ?auto_172176 ) ) ( not ( = ?auto_172171 ?auto_172176 ) ) ( not ( = ?auto_172174 ?auto_172176 ) ) ( not ( = ?auto_172175 ?auto_172176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172168 ?auto_172176 )
      ( MAKE-1PILE ?auto_172168 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172177 - BLOCK
    )
    :vars
    (
      ?auto_172181 - BLOCK
      ?auto_172178 - BLOCK
      ?auto_172185 - BLOCK
      ?auto_172183 - BLOCK
      ?auto_172182 - BLOCK
      ?auto_172179 - BLOCK
      ?auto_172180 - BLOCK
      ?auto_172184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172177 ?auto_172181 ) ) ( ON-TABLE ?auto_172178 ) ( ON ?auto_172185 ?auto_172178 ) ( ON ?auto_172183 ?auto_172185 ) ( ON ?auto_172182 ?auto_172183 ) ( ON ?auto_172179 ?auto_172182 ) ( ON ?auto_172180 ?auto_172179 ) ( not ( = ?auto_172178 ?auto_172185 ) ) ( not ( = ?auto_172178 ?auto_172183 ) ) ( not ( = ?auto_172178 ?auto_172182 ) ) ( not ( = ?auto_172178 ?auto_172179 ) ) ( not ( = ?auto_172178 ?auto_172180 ) ) ( not ( = ?auto_172178 ?auto_172181 ) ) ( not ( = ?auto_172178 ?auto_172177 ) ) ( not ( = ?auto_172185 ?auto_172183 ) ) ( not ( = ?auto_172185 ?auto_172182 ) ) ( not ( = ?auto_172185 ?auto_172179 ) ) ( not ( = ?auto_172185 ?auto_172180 ) ) ( not ( = ?auto_172185 ?auto_172181 ) ) ( not ( = ?auto_172185 ?auto_172177 ) ) ( not ( = ?auto_172183 ?auto_172182 ) ) ( not ( = ?auto_172183 ?auto_172179 ) ) ( not ( = ?auto_172183 ?auto_172180 ) ) ( not ( = ?auto_172183 ?auto_172181 ) ) ( not ( = ?auto_172183 ?auto_172177 ) ) ( not ( = ?auto_172182 ?auto_172179 ) ) ( not ( = ?auto_172182 ?auto_172180 ) ) ( not ( = ?auto_172182 ?auto_172181 ) ) ( not ( = ?auto_172182 ?auto_172177 ) ) ( not ( = ?auto_172179 ?auto_172180 ) ) ( not ( = ?auto_172179 ?auto_172181 ) ) ( not ( = ?auto_172179 ?auto_172177 ) ) ( not ( = ?auto_172180 ?auto_172181 ) ) ( not ( = ?auto_172180 ?auto_172177 ) ) ( ON ?auto_172177 ?auto_172184 ) ( CLEAR ?auto_172177 ) ( not ( = ?auto_172177 ?auto_172184 ) ) ( not ( = ?auto_172181 ?auto_172184 ) ) ( not ( = ?auto_172178 ?auto_172184 ) ) ( not ( = ?auto_172185 ?auto_172184 ) ) ( not ( = ?auto_172183 ?auto_172184 ) ) ( not ( = ?auto_172182 ?auto_172184 ) ) ( not ( = ?auto_172179 ?auto_172184 ) ) ( not ( = ?auto_172180 ?auto_172184 ) ) ( HOLDING ?auto_172181 ) ( CLEAR ?auto_172180 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172178 ?auto_172185 ?auto_172183 ?auto_172182 ?auto_172179 ?auto_172180 ?auto_172181 )
      ( MAKE-1PILE ?auto_172177 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172186 - BLOCK
    )
    :vars
    (
      ?auto_172187 - BLOCK
      ?auto_172190 - BLOCK
      ?auto_172191 - BLOCK
      ?auto_172192 - BLOCK
      ?auto_172189 - BLOCK
      ?auto_172194 - BLOCK
      ?auto_172188 - BLOCK
      ?auto_172193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172186 ?auto_172187 ) ) ( ON-TABLE ?auto_172190 ) ( ON ?auto_172191 ?auto_172190 ) ( ON ?auto_172192 ?auto_172191 ) ( ON ?auto_172189 ?auto_172192 ) ( ON ?auto_172194 ?auto_172189 ) ( ON ?auto_172188 ?auto_172194 ) ( not ( = ?auto_172190 ?auto_172191 ) ) ( not ( = ?auto_172190 ?auto_172192 ) ) ( not ( = ?auto_172190 ?auto_172189 ) ) ( not ( = ?auto_172190 ?auto_172194 ) ) ( not ( = ?auto_172190 ?auto_172188 ) ) ( not ( = ?auto_172190 ?auto_172187 ) ) ( not ( = ?auto_172190 ?auto_172186 ) ) ( not ( = ?auto_172191 ?auto_172192 ) ) ( not ( = ?auto_172191 ?auto_172189 ) ) ( not ( = ?auto_172191 ?auto_172194 ) ) ( not ( = ?auto_172191 ?auto_172188 ) ) ( not ( = ?auto_172191 ?auto_172187 ) ) ( not ( = ?auto_172191 ?auto_172186 ) ) ( not ( = ?auto_172192 ?auto_172189 ) ) ( not ( = ?auto_172192 ?auto_172194 ) ) ( not ( = ?auto_172192 ?auto_172188 ) ) ( not ( = ?auto_172192 ?auto_172187 ) ) ( not ( = ?auto_172192 ?auto_172186 ) ) ( not ( = ?auto_172189 ?auto_172194 ) ) ( not ( = ?auto_172189 ?auto_172188 ) ) ( not ( = ?auto_172189 ?auto_172187 ) ) ( not ( = ?auto_172189 ?auto_172186 ) ) ( not ( = ?auto_172194 ?auto_172188 ) ) ( not ( = ?auto_172194 ?auto_172187 ) ) ( not ( = ?auto_172194 ?auto_172186 ) ) ( not ( = ?auto_172188 ?auto_172187 ) ) ( not ( = ?auto_172188 ?auto_172186 ) ) ( ON ?auto_172186 ?auto_172193 ) ( not ( = ?auto_172186 ?auto_172193 ) ) ( not ( = ?auto_172187 ?auto_172193 ) ) ( not ( = ?auto_172190 ?auto_172193 ) ) ( not ( = ?auto_172191 ?auto_172193 ) ) ( not ( = ?auto_172192 ?auto_172193 ) ) ( not ( = ?auto_172189 ?auto_172193 ) ) ( not ( = ?auto_172194 ?auto_172193 ) ) ( not ( = ?auto_172188 ?auto_172193 ) ) ( CLEAR ?auto_172188 ) ( ON ?auto_172187 ?auto_172186 ) ( CLEAR ?auto_172187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172193 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172193 ?auto_172186 )
      ( MAKE-1PILE ?auto_172186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172195 - BLOCK
    )
    :vars
    (
      ?auto_172198 - BLOCK
      ?auto_172200 - BLOCK
      ?auto_172203 - BLOCK
      ?auto_172199 - BLOCK
      ?auto_172196 - BLOCK
      ?auto_172202 - BLOCK
      ?auto_172197 - BLOCK
      ?auto_172201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172195 ?auto_172198 ) ) ( ON-TABLE ?auto_172200 ) ( ON ?auto_172203 ?auto_172200 ) ( ON ?auto_172199 ?auto_172203 ) ( ON ?auto_172196 ?auto_172199 ) ( ON ?auto_172202 ?auto_172196 ) ( not ( = ?auto_172200 ?auto_172203 ) ) ( not ( = ?auto_172200 ?auto_172199 ) ) ( not ( = ?auto_172200 ?auto_172196 ) ) ( not ( = ?auto_172200 ?auto_172202 ) ) ( not ( = ?auto_172200 ?auto_172197 ) ) ( not ( = ?auto_172200 ?auto_172198 ) ) ( not ( = ?auto_172200 ?auto_172195 ) ) ( not ( = ?auto_172203 ?auto_172199 ) ) ( not ( = ?auto_172203 ?auto_172196 ) ) ( not ( = ?auto_172203 ?auto_172202 ) ) ( not ( = ?auto_172203 ?auto_172197 ) ) ( not ( = ?auto_172203 ?auto_172198 ) ) ( not ( = ?auto_172203 ?auto_172195 ) ) ( not ( = ?auto_172199 ?auto_172196 ) ) ( not ( = ?auto_172199 ?auto_172202 ) ) ( not ( = ?auto_172199 ?auto_172197 ) ) ( not ( = ?auto_172199 ?auto_172198 ) ) ( not ( = ?auto_172199 ?auto_172195 ) ) ( not ( = ?auto_172196 ?auto_172202 ) ) ( not ( = ?auto_172196 ?auto_172197 ) ) ( not ( = ?auto_172196 ?auto_172198 ) ) ( not ( = ?auto_172196 ?auto_172195 ) ) ( not ( = ?auto_172202 ?auto_172197 ) ) ( not ( = ?auto_172202 ?auto_172198 ) ) ( not ( = ?auto_172202 ?auto_172195 ) ) ( not ( = ?auto_172197 ?auto_172198 ) ) ( not ( = ?auto_172197 ?auto_172195 ) ) ( ON ?auto_172195 ?auto_172201 ) ( not ( = ?auto_172195 ?auto_172201 ) ) ( not ( = ?auto_172198 ?auto_172201 ) ) ( not ( = ?auto_172200 ?auto_172201 ) ) ( not ( = ?auto_172203 ?auto_172201 ) ) ( not ( = ?auto_172199 ?auto_172201 ) ) ( not ( = ?auto_172196 ?auto_172201 ) ) ( not ( = ?auto_172202 ?auto_172201 ) ) ( not ( = ?auto_172197 ?auto_172201 ) ) ( ON ?auto_172198 ?auto_172195 ) ( CLEAR ?auto_172198 ) ( ON-TABLE ?auto_172201 ) ( HOLDING ?auto_172197 ) ( CLEAR ?auto_172202 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172200 ?auto_172203 ?auto_172199 ?auto_172196 ?auto_172202 ?auto_172197 )
      ( MAKE-1PILE ?auto_172195 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172204 - BLOCK
    )
    :vars
    (
      ?auto_172210 - BLOCK
      ?auto_172209 - BLOCK
      ?auto_172207 - BLOCK
      ?auto_172206 - BLOCK
      ?auto_172211 - BLOCK
      ?auto_172212 - BLOCK
      ?auto_172205 - BLOCK
      ?auto_172208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172204 ?auto_172210 ) ) ( ON-TABLE ?auto_172209 ) ( ON ?auto_172207 ?auto_172209 ) ( ON ?auto_172206 ?auto_172207 ) ( ON ?auto_172211 ?auto_172206 ) ( ON ?auto_172212 ?auto_172211 ) ( not ( = ?auto_172209 ?auto_172207 ) ) ( not ( = ?auto_172209 ?auto_172206 ) ) ( not ( = ?auto_172209 ?auto_172211 ) ) ( not ( = ?auto_172209 ?auto_172212 ) ) ( not ( = ?auto_172209 ?auto_172205 ) ) ( not ( = ?auto_172209 ?auto_172210 ) ) ( not ( = ?auto_172209 ?auto_172204 ) ) ( not ( = ?auto_172207 ?auto_172206 ) ) ( not ( = ?auto_172207 ?auto_172211 ) ) ( not ( = ?auto_172207 ?auto_172212 ) ) ( not ( = ?auto_172207 ?auto_172205 ) ) ( not ( = ?auto_172207 ?auto_172210 ) ) ( not ( = ?auto_172207 ?auto_172204 ) ) ( not ( = ?auto_172206 ?auto_172211 ) ) ( not ( = ?auto_172206 ?auto_172212 ) ) ( not ( = ?auto_172206 ?auto_172205 ) ) ( not ( = ?auto_172206 ?auto_172210 ) ) ( not ( = ?auto_172206 ?auto_172204 ) ) ( not ( = ?auto_172211 ?auto_172212 ) ) ( not ( = ?auto_172211 ?auto_172205 ) ) ( not ( = ?auto_172211 ?auto_172210 ) ) ( not ( = ?auto_172211 ?auto_172204 ) ) ( not ( = ?auto_172212 ?auto_172205 ) ) ( not ( = ?auto_172212 ?auto_172210 ) ) ( not ( = ?auto_172212 ?auto_172204 ) ) ( not ( = ?auto_172205 ?auto_172210 ) ) ( not ( = ?auto_172205 ?auto_172204 ) ) ( ON ?auto_172204 ?auto_172208 ) ( not ( = ?auto_172204 ?auto_172208 ) ) ( not ( = ?auto_172210 ?auto_172208 ) ) ( not ( = ?auto_172209 ?auto_172208 ) ) ( not ( = ?auto_172207 ?auto_172208 ) ) ( not ( = ?auto_172206 ?auto_172208 ) ) ( not ( = ?auto_172211 ?auto_172208 ) ) ( not ( = ?auto_172212 ?auto_172208 ) ) ( not ( = ?auto_172205 ?auto_172208 ) ) ( ON ?auto_172210 ?auto_172204 ) ( ON-TABLE ?auto_172208 ) ( CLEAR ?auto_172212 ) ( ON ?auto_172205 ?auto_172210 ) ( CLEAR ?auto_172205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172208 ?auto_172204 ?auto_172210 )
      ( MAKE-1PILE ?auto_172204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172213 - BLOCK
    )
    :vars
    (
      ?auto_172220 - BLOCK
      ?auto_172217 - BLOCK
      ?auto_172219 - BLOCK
      ?auto_172215 - BLOCK
      ?auto_172218 - BLOCK
      ?auto_172214 - BLOCK
      ?auto_172216 - BLOCK
      ?auto_172221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172213 ?auto_172220 ) ) ( ON-TABLE ?auto_172217 ) ( ON ?auto_172219 ?auto_172217 ) ( ON ?auto_172215 ?auto_172219 ) ( ON ?auto_172218 ?auto_172215 ) ( not ( = ?auto_172217 ?auto_172219 ) ) ( not ( = ?auto_172217 ?auto_172215 ) ) ( not ( = ?auto_172217 ?auto_172218 ) ) ( not ( = ?auto_172217 ?auto_172214 ) ) ( not ( = ?auto_172217 ?auto_172216 ) ) ( not ( = ?auto_172217 ?auto_172220 ) ) ( not ( = ?auto_172217 ?auto_172213 ) ) ( not ( = ?auto_172219 ?auto_172215 ) ) ( not ( = ?auto_172219 ?auto_172218 ) ) ( not ( = ?auto_172219 ?auto_172214 ) ) ( not ( = ?auto_172219 ?auto_172216 ) ) ( not ( = ?auto_172219 ?auto_172220 ) ) ( not ( = ?auto_172219 ?auto_172213 ) ) ( not ( = ?auto_172215 ?auto_172218 ) ) ( not ( = ?auto_172215 ?auto_172214 ) ) ( not ( = ?auto_172215 ?auto_172216 ) ) ( not ( = ?auto_172215 ?auto_172220 ) ) ( not ( = ?auto_172215 ?auto_172213 ) ) ( not ( = ?auto_172218 ?auto_172214 ) ) ( not ( = ?auto_172218 ?auto_172216 ) ) ( not ( = ?auto_172218 ?auto_172220 ) ) ( not ( = ?auto_172218 ?auto_172213 ) ) ( not ( = ?auto_172214 ?auto_172216 ) ) ( not ( = ?auto_172214 ?auto_172220 ) ) ( not ( = ?auto_172214 ?auto_172213 ) ) ( not ( = ?auto_172216 ?auto_172220 ) ) ( not ( = ?auto_172216 ?auto_172213 ) ) ( ON ?auto_172213 ?auto_172221 ) ( not ( = ?auto_172213 ?auto_172221 ) ) ( not ( = ?auto_172220 ?auto_172221 ) ) ( not ( = ?auto_172217 ?auto_172221 ) ) ( not ( = ?auto_172219 ?auto_172221 ) ) ( not ( = ?auto_172215 ?auto_172221 ) ) ( not ( = ?auto_172218 ?auto_172221 ) ) ( not ( = ?auto_172214 ?auto_172221 ) ) ( not ( = ?auto_172216 ?auto_172221 ) ) ( ON ?auto_172220 ?auto_172213 ) ( ON-TABLE ?auto_172221 ) ( ON ?auto_172216 ?auto_172220 ) ( CLEAR ?auto_172216 ) ( HOLDING ?auto_172214 ) ( CLEAR ?auto_172218 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172217 ?auto_172219 ?auto_172215 ?auto_172218 ?auto_172214 )
      ( MAKE-1PILE ?auto_172213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172222 - BLOCK
    )
    :vars
    (
      ?auto_172230 - BLOCK
      ?auto_172224 - BLOCK
      ?auto_172226 - BLOCK
      ?auto_172227 - BLOCK
      ?auto_172225 - BLOCK
      ?auto_172228 - BLOCK
      ?auto_172223 - BLOCK
      ?auto_172229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172222 ?auto_172230 ) ) ( ON-TABLE ?auto_172224 ) ( ON ?auto_172226 ?auto_172224 ) ( ON ?auto_172227 ?auto_172226 ) ( ON ?auto_172225 ?auto_172227 ) ( not ( = ?auto_172224 ?auto_172226 ) ) ( not ( = ?auto_172224 ?auto_172227 ) ) ( not ( = ?auto_172224 ?auto_172225 ) ) ( not ( = ?auto_172224 ?auto_172228 ) ) ( not ( = ?auto_172224 ?auto_172223 ) ) ( not ( = ?auto_172224 ?auto_172230 ) ) ( not ( = ?auto_172224 ?auto_172222 ) ) ( not ( = ?auto_172226 ?auto_172227 ) ) ( not ( = ?auto_172226 ?auto_172225 ) ) ( not ( = ?auto_172226 ?auto_172228 ) ) ( not ( = ?auto_172226 ?auto_172223 ) ) ( not ( = ?auto_172226 ?auto_172230 ) ) ( not ( = ?auto_172226 ?auto_172222 ) ) ( not ( = ?auto_172227 ?auto_172225 ) ) ( not ( = ?auto_172227 ?auto_172228 ) ) ( not ( = ?auto_172227 ?auto_172223 ) ) ( not ( = ?auto_172227 ?auto_172230 ) ) ( not ( = ?auto_172227 ?auto_172222 ) ) ( not ( = ?auto_172225 ?auto_172228 ) ) ( not ( = ?auto_172225 ?auto_172223 ) ) ( not ( = ?auto_172225 ?auto_172230 ) ) ( not ( = ?auto_172225 ?auto_172222 ) ) ( not ( = ?auto_172228 ?auto_172223 ) ) ( not ( = ?auto_172228 ?auto_172230 ) ) ( not ( = ?auto_172228 ?auto_172222 ) ) ( not ( = ?auto_172223 ?auto_172230 ) ) ( not ( = ?auto_172223 ?auto_172222 ) ) ( ON ?auto_172222 ?auto_172229 ) ( not ( = ?auto_172222 ?auto_172229 ) ) ( not ( = ?auto_172230 ?auto_172229 ) ) ( not ( = ?auto_172224 ?auto_172229 ) ) ( not ( = ?auto_172226 ?auto_172229 ) ) ( not ( = ?auto_172227 ?auto_172229 ) ) ( not ( = ?auto_172225 ?auto_172229 ) ) ( not ( = ?auto_172228 ?auto_172229 ) ) ( not ( = ?auto_172223 ?auto_172229 ) ) ( ON ?auto_172230 ?auto_172222 ) ( ON-TABLE ?auto_172229 ) ( ON ?auto_172223 ?auto_172230 ) ( CLEAR ?auto_172225 ) ( ON ?auto_172228 ?auto_172223 ) ( CLEAR ?auto_172228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172229 ?auto_172222 ?auto_172230 ?auto_172223 )
      ( MAKE-1PILE ?auto_172222 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172231 - BLOCK
    )
    :vars
    (
      ?auto_172233 - BLOCK
      ?auto_172239 - BLOCK
      ?auto_172237 - BLOCK
      ?auto_172236 - BLOCK
      ?auto_172232 - BLOCK
      ?auto_172238 - BLOCK
      ?auto_172234 - BLOCK
      ?auto_172235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172231 ?auto_172233 ) ) ( ON-TABLE ?auto_172239 ) ( ON ?auto_172237 ?auto_172239 ) ( ON ?auto_172236 ?auto_172237 ) ( not ( = ?auto_172239 ?auto_172237 ) ) ( not ( = ?auto_172239 ?auto_172236 ) ) ( not ( = ?auto_172239 ?auto_172232 ) ) ( not ( = ?auto_172239 ?auto_172238 ) ) ( not ( = ?auto_172239 ?auto_172234 ) ) ( not ( = ?auto_172239 ?auto_172233 ) ) ( not ( = ?auto_172239 ?auto_172231 ) ) ( not ( = ?auto_172237 ?auto_172236 ) ) ( not ( = ?auto_172237 ?auto_172232 ) ) ( not ( = ?auto_172237 ?auto_172238 ) ) ( not ( = ?auto_172237 ?auto_172234 ) ) ( not ( = ?auto_172237 ?auto_172233 ) ) ( not ( = ?auto_172237 ?auto_172231 ) ) ( not ( = ?auto_172236 ?auto_172232 ) ) ( not ( = ?auto_172236 ?auto_172238 ) ) ( not ( = ?auto_172236 ?auto_172234 ) ) ( not ( = ?auto_172236 ?auto_172233 ) ) ( not ( = ?auto_172236 ?auto_172231 ) ) ( not ( = ?auto_172232 ?auto_172238 ) ) ( not ( = ?auto_172232 ?auto_172234 ) ) ( not ( = ?auto_172232 ?auto_172233 ) ) ( not ( = ?auto_172232 ?auto_172231 ) ) ( not ( = ?auto_172238 ?auto_172234 ) ) ( not ( = ?auto_172238 ?auto_172233 ) ) ( not ( = ?auto_172238 ?auto_172231 ) ) ( not ( = ?auto_172234 ?auto_172233 ) ) ( not ( = ?auto_172234 ?auto_172231 ) ) ( ON ?auto_172231 ?auto_172235 ) ( not ( = ?auto_172231 ?auto_172235 ) ) ( not ( = ?auto_172233 ?auto_172235 ) ) ( not ( = ?auto_172239 ?auto_172235 ) ) ( not ( = ?auto_172237 ?auto_172235 ) ) ( not ( = ?auto_172236 ?auto_172235 ) ) ( not ( = ?auto_172232 ?auto_172235 ) ) ( not ( = ?auto_172238 ?auto_172235 ) ) ( not ( = ?auto_172234 ?auto_172235 ) ) ( ON ?auto_172233 ?auto_172231 ) ( ON-TABLE ?auto_172235 ) ( ON ?auto_172234 ?auto_172233 ) ( ON ?auto_172238 ?auto_172234 ) ( CLEAR ?auto_172238 ) ( HOLDING ?auto_172232 ) ( CLEAR ?auto_172236 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172239 ?auto_172237 ?auto_172236 ?auto_172232 )
      ( MAKE-1PILE ?auto_172231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172240 - BLOCK
    )
    :vars
    (
      ?auto_172242 - BLOCK
      ?auto_172243 - BLOCK
      ?auto_172241 - BLOCK
      ?auto_172248 - BLOCK
      ?auto_172245 - BLOCK
      ?auto_172244 - BLOCK
      ?auto_172246 - BLOCK
      ?auto_172247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172240 ?auto_172242 ) ) ( ON-TABLE ?auto_172243 ) ( ON ?auto_172241 ?auto_172243 ) ( ON ?auto_172248 ?auto_172241 ) ( not ( = ?auto_172243 ?auto_172241 ) ) ( not ( = ?auto_172243 ?auto_172248 ) ) ( not ( = ?auto_172243 ?auto_172245 ) ) ( not ( = ?auto_172243 ?auto_172244 ) ) ( not ( = ?auto_172243 ?auto_172246 ) ) ( not ( = ?auto_172243 ?auto_172242 ) ) ( not ( = ?auto_172243 ?auto_172240 ) ) ( not ( = ?auto_172241 ?auto_172248 ) ) ( not ( = ?auto_172241 ?auto_172245 ) ) ( not ( = ?auto_172241 ?auto_172244 ) ) ( not ( = ?auto_172241 ?auto_172246 ) ) ( not ( = ?auto_172241 ?auto_172242 ) ) ( not ( = ?auto_172241 ?auto_172240 ) ) ( not ( = ?auto_172248 ?auto_172245 ) ) ( not ( = ?auto_172248 ?auto_172244 ) ) ( not ( = ?auto_172248 ?auto_172246 ) ) ( not ( = ?auto_172248 ?auto_172242 ) ) ( not ( = ?auto_172248 ?auto_172240 ) ) ( not ( = ?auto_172245 ?auto_172244 ) ) ( not ( = ?auto_172245 ?auto_172246 ) ) ( not ( = ?auto_172245 ?auto_172242 ) ) ( not ( = ?auto_172245 ?auto_172240 ) ) ( not ( = ?auto_172244 ?auto_172246 ) ) ( not ( = ?auto_172244 ?auto_172242 ) ) ( not ( = ?auto_172244 ?auto_172240 ) ) ( not ( = ?auto_172246 ?auto_172242 ) ) ( not ( = ?auto_172246 ?auto_172240 ) ) ( ON ?auto_172240 ?auto_172247 ) ( not ( = ?auto_172240 ?auto_172247 ) ) ( not ( = ?auto_172242 ?auto_172247 ) ) ( not ( = ?auto_172243 ?auto_172247 ) ) ( not ( = ?auto_172241 ?auto_172247 ) ) ( not ( = ?auto_172248 ?auto_172247 ) ) ( not ( = ?auto_172245 ?auto_172247 ) ) ( not ( = ?auto_172244 ?auto_172247 ) ) ( not ( = ?auto_172246 ?auto_172247 ) ) ( ON ?auto_172242 ?auto_172240 ) ( ON-TABLE ?auto_172247 ) ( ON ?auto_172246 ?auto_172242 ) ( ON ?auto_172244 ?auto_172246 ) ( CLEAR ?auto_172248 ) ( ON ?auto_172245 ?auto_172244 ) ( CLEAR ?auto_172245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172247 ?auto_172240 ?auto_172242 ?auto_172246 ?auto_172244 )
      ( MAKE-1PILE ?auto_172240 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172249 - BLOCK
    )
    :vars
    (
      ?auto_172257 - BLOCK
      ?auto_172256 - BLOCK
      ?auto_172251 - BLOCK
      ?auto_172254 - BLOCK
      ?auto_172250 - BLOCK
      ?auto_172255 - BLOCK
      ?auto_172252 - BLOCK
      ?auto_172253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172249 ?auto_172257 ) ) ( ON-TABLE ?auto_172256 ) ( ON ?auto_172251 ?auto_172256 ) ( not ( = ?auto_172256 ?auto_172251 ) ) ( not ( = ?auto_172256 ?auto_172254 ) ) ( not ( = ?auto_172256 ?auto_172250 ) ) ( not ( = ?auto_172256 ?auto_172255 ) ) ( not ( = ?auto_172256 ?auto_172252 ) ) ( not ( = ?auto_172256 ?auto_172257 ) ) ( not ( = ?auto_172256 ?auto_172249 ) ) ( not ( = ?auto_172251 ?auto_172254 ) ) ( not ( = ?auto_172251 ?auto_172250 ) ) ( not ( = ?auto_172251 ?auto_172255 ) ) ( not ( = ?auto_172251 ?auto_172252 ) ) ( not ( = ?auto_172251 ?auto_172257 ) ) ( not ( = ?auto_172251 ?auto_172249 ) ) ( not ( = ?auto_172254 ?auto_172250 ) ) ( not ( = ?auto_172254 ?auto_172255 ) ) ( not ( = ?auto_172254 ?auto_172252 ) ) ( not ( = ?auto_172254 ?auto_172257 ) ) ( not ( = ?auto_172254 ?auto_172249 ) ) ( not ( = ?auto_172250 ?auto_172255 ) ) ( not ( = ?auto_172250 ?auto_172252 ) ) ( not ( = ?auto_172250 ?auto_172257 ) ) ( not ( = ?auto_172250 ?auto_172249 ) ) ( not ( = ?auto_172255 ?auto_172252 ) ) ( not ( = ?auto_172255 ?auto_172257 ) ) ( not ( = ?auto_172255 ?auto_172249 ) ) ( not ( = ?auto_172252 ?auto_172257 ) ) ( not ( = ?auto_172252 ?auto_172249 ) ) ( ON ?auto_172249 ?auto_172253 ) ( not ( = ?auto_172249 ?auto_172253 ) ) ( not ( = ?auto_172257 ?auto_172253 ) ) ( not ( = ?auto_172256 ?auto_172253 ) ) ( not ( = ?auto_172251 ?auto_172253 ) ) ( not ( = ?auto_172254 ?auto_172253 ) ) ( not ( = ?auto_172250 ?auto_172253 ) ) ( not ( = ?auto_172255 ?auto_172253 ) ) ( not ( = ?auto_172252 ?auto_172253 ) ) ( ON ?auto_172257 ?auto_172249 ) ( ON-TABLE ?auto_172253 ) ( ON ?auto_172252 ?auto_172257 ) ( ON ?auto_172255 ?auto_172252 ) ( ON ?auto_172250 ?auto_172255 ) ( CLEAR ?auto_172250 ) ( HOLDING ?auto_172254 ) ( CLEAR ?auto_172251 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172256 ?auto_172251 ?auto_172254 )
      ( MAKE-1PILE ?auto_172249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172258 - BLOCK
    )
    :vars
    (
      ?auto_172264 - BLOCK
      ?auto_172265 - BLOCK
      ?auto_172260 - BLOCK
      ?auto_172263 - BLOCK
      ?auto_172259 - BLOCK
      ?auto_172262 - BLOCK
      ?auto_172261 - BLOCK
      ?auto_172266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172258 ?auto_172264 ) ) ( ON-TABLE ?auto_172265 ) ( ON ?auto_172260 ?auto_172265 ) ( not ( = ?auto_172265 ?auto_172260 ) ) ( not ( = ?auto_172265 ?auto_172263 ) ) ( not ( = ?auto_172265 ?auto_172259 ) ) ( not ( = ?auto_172265 ?auto_172262 ) ) ( not ( = ?auto_172265 ?auto_172261 ) ) ( not ( = ?auto_172265 ?auto_172264 ) ) ( not ( = ?auto_172265 ?auto_172258 ) ) ( not ( = ?auto_172260 ?auto_172263 ) ) ( not ( = ?auto_172260 ?auto_172259 ) ) ( not ( = ?auto_172260 ?auto_172262 ) ) ( not ( = ?auto_172260 ?auto_172261 ) ) ( not ( = ?auto_172260 ?auto_172264 ) ) ( not ( = ?auto_172260 ?auto_172258 ) ) ( not ( = ?auto_172263 ?auto_172259 ) ) ( not ( = ?auto_172263 ?auto_172262 ) ) ( not ( = ?auto_172263 ?auto_172261 ) ) ( not ( = ?auto_172263 ?auto_172264 ) ) ( not ( = ?auto_172263 ?auto_172258 ) ) ( not ( = ?auto_172259 ?auto_172262 ) ) ( not ( = ?auto_172259 ?auto_172261 ) ) ( not ( = ?auto_172259 ?auto_172264 ) ) ( not ( = ?auto_172259 ?auto_172258 ) ) ( not ( = ?auto_172262 ?auto_172261 ) ) ( not ( = ?auto_172262 ?auto_172264 ) ) ( not ( = ?auto_172262 ?auto_172258 ) ) ( not ( = ?auto_172261 ?auto_172264 ) ) ( not ( = ?auto_172261 ?auto_172258 ) ) ( ON ?auto_172258 ?auto_172266 ) ( not ( = ?auto_172258 ?auto_172266 ) ) ( not ( = ?auto_172264 ?auto_172266 ) ) ( not ( = ?auto_172265 ?auto_172266 ) ) ( not ( = ?auto_172260 ?auto_172266 ) ) ( not ( = ?auto_172263 ?auto_172266 ) ) ( not ( = ?auto_172259 ?auto_172266 ) ) ( not ( = ?auto_172262 ?auto_172266 ) ) ( not ( = ?auto_172261 ?auto_172266 ) ) ( ON ?auto_172264 ?auto_172258 ) ( ON-TABLE ?auto_172266 ) ( ON ?auto_172261 ?auto_172264 ) ( ON ?auto_172262 ?auto_172261 ) ( ON ?auto_172259 ?auto_172262 ) ( CLEAR ?auto_172260 ) ( ON ?auto_172263 ?auto_172259 ) ( CLEAR ?auto_172263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172266 ?auto_172258 ?auto_172264 ?auto_172261 ?auto_172262 ?auto_172259 )
      ( MAKE-1PILE ?auto_172258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172267 - BLOCK
    )
    :vars
    (
      ?auto_172269 - BLOCK
      ?auto_172274 - BLOCK
      ?auto_172275 - BLOCK
      ?auto_172272 - BLOCK
      ?auto_172271 - BLOCK
      ?auto_172270 - BLOCK
      ?auto_172273 - BLOCK
      ?auto_172268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172267 ?auto_172269 ) ) ( ON-TABLE ?auto_172274 ) ( not ( = ?auto_172274 ?auto_172275 ) ) ( not ( = ?auto_172274 ?auto_172272 ) ) ( not ( = ?auto_172274 ?auto_172271 ) ) ( not ( = ?auto_172274 ?auto_172270 ) ) ( not ( = ?auto_172274 ?auto_172273 ) ) ( not ( = ?auto_172274 ?auto_172269 ) ) ( not ( = ?auto_172274 ?auto_172267 ) ) ( not ( = ?auto_172275 ?auto_172272 ) ) ( not ( = ?auto_172275 ?auto_172271 ) ) ( not ( = ?auto_172275 ?auto_172270 ) ) ( not ( = ?auto_172275 ?auto_172273 ) ) ( not ( = ?auto_172275 ?auto_172269 ) ) ( not ( = ?auto_172275 ?auto_172267 ) ) ( not ( = ?auto_172272 ?auto_172271 ) ) ( not ( = ?auto_172272 ?auto_172270 ) ) ( not ( = ?auto_172272 ?auto_172273 ) ) ( not ( = ?auto_172272 ?auto_172269 ) ) ( not ( = ?auto_172272 ?auto_172267 ) ) ( not ( = ?auto_172271 ?auto_172270 ) ) ( not ( = ?auto_172271 ?auto_172273 ) ) ( not ( = ?auto_172271 ?auto_172269 ) ) ( not ( = ?auto_172271 ?auto_172267 ) ) ( not ( = ?auto_172270 ?auto_172273 ) ) ( not ( = ?auto_172270 ?auto_172269 ) ) ( not ( = ?auto_172270 ?auto_172267 ) ) ( not ( = ?auto_172273 ?auto_172269 ) ) ( not ( = ?auto_172273 ?auto_172267 ) ) ( ON ?auto_172267 ?auto_172268 ) ( not ( = ?auto_172267 ?auto_172268 ) ) ( not ( = ?auto_172269 ?auto_172268 ) ) ( not ( = ?auto_172274 ?auto_172268 ) ) ( not ( = ?auto_172275 ?auto_172268 ) ) ( not ( = ?auto_172272 ?auto_172268 ) ) ( not ( = ?auto_172271 ?auto_172268 ) ) ( not ( = ?auto_172270 ?auto_172268 ) ) ( not ( = ?auto_172273 ?auto_172268 ) ) ( ON ?auto_172269 ?auto_172267 ) ( ON-TABLE ?auto_172268 ) ( ON ?auto_172273 ?auto_172269 ) ( ON ?auto_172270 ?auto_172273 ) ( ON ?auto_172271 ?auto_172270 ) ( ON ?auto_172272 ?auto_172271 ) ( CLEAR ?auto_172272 ) ( HOLDING ?auto_172275 ) ( CLEAR ?auto_172274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172274 ?auto_172275 )
      ( MAKE-1PILE ?auto_172267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172276 - BLOCK
    )
    :vars
    (
      ?auto_172284 - BLOCK
      ?auto_172279 - BLOCK
      ?auto_172282 - BLOCK
      ?auto_172283 - BLOCK
      ?auto_172281 - BLOCK
      ?auto_172280 - BLOCK
      ?auto_172277 - BLOCK
      ?auto_172278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172276 ?auto_172284 ) ) ( ON-TABLE ?auto_172279 ) ( not ( = ?auto_172279 ?auto_172282 ) ) ( not ( = ?auto_172279 ?auto_172283 ) ) ( not ( = ?auto_172279 ?auto_172281 ) ) ( not ( = ?auto_172279 ?auto_172280 ) ) ( not ( = ?auto_172279 ?auto_172277 ) ) ( not ( = ?auto_172279 ?auto_172284 ) ) ( not ( = ?auto_172279 ?auto_172276 ) ) ( not ( = ?auto_172282 ?auto_172283 ) ) ( not ( = ?auto_172282 ?auto_172281 ) ) ( not ( = ?auto_172282 ?auto_172280 ) ) ( not ( = ?auto_172282 ?auto_172277 ) ) ( not ( = ?auto_172282 ?auto_172284 ) ) ( not ( = ?auto_172282 ?auto_172276 ) ) ( not ( = ?auto_172283 ?auto_172281 ) ) ( not ( = ?auto_172283 ?auto_172280 ) ) ( not ( = ?auto_172283 ?auto_172277 ) ) ( not ( = ?auto_172283 ?auto_172284 ) ) ( not ( = ?auto_172283 ?auto_172276 ) ) ( not ( = ?auto_172281 ?auto_172280 ) ) ( not ( = ?auto_172281 ?auto_172277 ) ) ( not ( = ?auto_172281 ?auto_172284 ) ) ( not ( = ?auto_172281 ?auto_172276 ) ) ( not ( = ?auto_172280 ?auto_172277 ) ) ( not ( = ?auto_172280 ?auto_172284 ) ) ( not ( = ?auto_172280 ?auto_172276 ) ) ( not ( = ?auto_172277 ?auto_172284 ) ) ( not ( = ?auto_172277 ?auto_172276 ) ) ( ON ?auto_172276 ?auto_172278 ) ( not ( = ?auto_172276 ?auto_172278 ) ) ( not ( = ?auto_172284 ?auto_172278 ) ) ( not ( = ?auto_172279 ?auto_172278 ) ) ( not ( = ?auto_172282 ?auto_172278 ) ) ( not ( = ?auto_172283 ?auto_172278 ) ) ( not ( = ?auto_172281 ?auto_172278 ) ) ( not ( = ?auto_172280 ?auto_172278 ) ) ( not ( = ?auto_172277 ?auto_172278 ) ) ( ON ?auto_172284 ?auto_172276 ) ( ON-TABLE ?auto_172278 ) ( ON ?auto_172277 ?auto_172284 ) ( ON ?auto_172280 ?auto_172277 ) ( ON ?auto_172281 ?auto_172280 ) ( ON ?auto_172283 ?auto_172281 ) ( CLEAR ?auto_172279 ) ( ON ?auto_172282 ?auto_172283 ) ( CLEAR ?auto_172282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172278 ?auto_172276 ?auto_172284 ?auto_172277 ?auto_172280 ?auto_172281 ?auto_172283 )
      ( MAKE-1PILE ?auto_172276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172285 - BLOCK
    )
    :vars
    (
      ?auto_172293 - BLOCK
      ?auto_172291 - BLOCK
      ?auto_172292 - BLOCK
      ?auto_172290 - BLOCK
      ?auto_172286 - BLOCK
      ?auto_172288 - BLOCK
      ?auto_172289 - BLOCK
      ?auto_172287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172285 ?auto_172293 ) ) ( not ( = ?auto_172291 ?auto_172292 ) ) ( not ( = ?auto_172291 ?auto_172290 ) ) ( not ( = ?auto_172291 ?auto_172286 ) ) ( not ( = ?auto_172291 ?auto_172288 ) ) ( not ( = ?auto_172291 ?auto_172289 ) ) ( not ( = ?auto_172291 ?auto_172293 ) ) ( not ( = ?auto_172291 ?auto_172285 ) ) ( not ( = ?auto_172292 ?auto_172290 ) ) ( not ( = ?auto_172292 ?auto_172286 ) ) ( not ( = ?auto_172292 ?auto_172288 ) ) ( not ( = ?auto_172292 ?auto_172289 ) ) ( not ( = ?auto_172292 ?auto_172293 ) ) ( not ( = ?auto_172292 ?auto_172285 ) ) ( not ( = ?auto_172290 ?auto_172286 ) ) ( not ( = ?auto_172290 ?auto_172288 ) ) ( not ( = ?auto_172290 ?auto_172289 ) ) ( not ( = ?auto_172290 ?auto_172293 ) ) ( not ( = ?auto_172290 ?auto_172285 ) ) ( not ( = ?auto_172286 ?auto_172288 ) ) ( not ( = ?auto_172286 ?auto_172289 ) ) ( not ( = ?auto_172286 ?auto_172293 ) ) ( not ( = ?auto_172286 ?auto_172285 ) ) ( not ( = ?auto_172288 ?auto_172289 ) ) ( not ( = ?auto_172288 ?auto_172293 ) ) ( not ( = ?auto_172288 ?auto_172285 ) ) ( not ( = ?auto_172289 ?auto_172293 ) ) ( not ( = ?auto_172289 ?auto_172285 ) ) ( ON ?auto_172285 ?auto_172287 ) ( not ( = ?auto_172285 ?auto_172287 ) ) ( not ( = ?auto_172293 ?auto_172287 ) ) ( not ( = ?auto_172291 ?auto_172287 ) ) ( not ( = ?auto_172292 ?auto_172287 ) ) ( not ( = ?auto_172290 ?auto_172287 ) ) ( not ( = ?auto_172286 ?auto_172287 ) ) ( not ( = ?auto_172288 ?auto_172287 ) ) ( not ( = ?auto_172289 ?auto_172287 ) ) ( ON ?auto_172293 ?auto_172285 ) ( ON-TABLE ?auto_172287 ) ( ON ?auto_172289 ?auto_172293 ) ( ON ?auto_172288 ?auto_172289 ) ( ON ?auto_172286 ?auto_172288 ) ( ON ?auto_172290 ?auto_172286 ) ( ON ?auto_172292 ?auto_172290 ) ( CLEAR ?auto_172292 ) ( HOLDING ?auto_172291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172291 )
      ( MAKE-1PILE ?auto_172285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172294 - BLOCK
    )
    :vars
    (
      ?auto_172302 - BLOCK
      ?auto_172298 - BLOCK
      ?auto_172296 - BLOCK
      ?auto_172297 - BLOCK
      ?auto_172301 - BLOCK
      ?auto_172300 - BLOCK
      ?auto_172299 - BLOCK
      ?auto_172295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172294 ?auto_172302 ) ) ( not ( = ?auto_172298 ?auto_172296 ) ) ( not ( = ?auto_172298 ?auto_172297 ) ) ( not ( = ?auto_172298 ?auto_172301 ) ) ( not ( = ?auto_172298 ?auto_172300 ) ) ( not ( = ?auto_172298 ?auto_172299 ) ) ( not ( = ?auto_172298 ?auto_172302 ) ) ( not ( = ?auto_172298 ?auto_172294 ) ) ( not ( = ?auto_172296 ?auto_172297 ) ) ( not ( = ?auto_172296 ?auto_172301 ) ) ( not ( = ?auto_172296 ?auto_172300 ) ) ( not ( = ?auto_172296 ?auto_172299 ) ) ( not ( = ?auto_172296 ?auto_172302 ) ) ( not ( = ?auto_172296 ?auto_172294 ) ) ( not ( = ?auto_172297 ?auto_172301 ) ) ( not ( = ?auto_172297 ?auto_172300 ) ) ( not ( = ?auto_172297 ?auto_172299 ) ) ( not ( = ?auto_172297 ?auto_172302 ) ) ( not ( = ?auto_172297 ?auto_172294 ) ) ( not ( = ?auto_172301 ?auto_172300 ) ) ( not ( = ?auto_172301 ?auto_172299 ) ) ( not ( = ?auto_172301 ?auto_172302 ) ) ( not ( = ?auto_172301 ?auto_172294 ) ) ( not ( = ?auto_172300 ?auto_172299 ) ) ( not ( = ?auto_172300 ?auto_172302 ) ) ( not ( = ?auto_172300 ?auto_172294 ) ) ( not ( = ?auto_172299 ?auto_172302 ) ) ( not ( = ?auto_172299 ?auto_172294 ) ) ( ON ?auto_172294 ?auto_172295 ) ( not ( = ?auto_172294 ?auto_172295 ) ) ( not ( = ?auto_172302 ?auto_172295 ) ) ( not ( = ?auto_172298 ?auto_172295 ) ) ( not ( = ?auto_172296 ?auto_172295 ) ) ( not ( = ?auto_172297 ?auto_172295 ) ) ( not ( = ?auto_172301 ?auto_172295 ) ) ( not ( = ?auto_172300 ?auto_172295 ) ) ( not ( = ?auto_172299 ?auto_172295 ) ) ( ON ?auto_172302 ?auto_172294 ) ( ON-TABLE ?auto_172295 ) ( ON ?auto_172299 ?auto_172302 ) ( ON ?auto_172300 ?auto_172299 ) ( ON ?auto_172301 ?auto_172300 ) ( ON ?auto_172297 ?auto_172301 ) ( ON ?auto_172296 ?auto_172297 ) ( ON ?auto_172298 ?auto_172296 ) ( CLEAR ?auto_172298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172295 ?auto_172294 ?auto_172302 ?auto_172299 ?auto_172300 ?auto_172301 ?auto_172297 ?auto_172296 )
      ( MAKE-1PILE ?auto_172294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172309 - BLOCK
      ?auto_172310 - BLOCK
      ?auto_172311 - BLOCK
      ?auto_172312 - BLOCK
      ?auto_172313 - BLOCK
      ?auto_172314 - BLOCK
    )
    :vars
    (
      ?auto_172315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172315 ?auto_172314 ) ( CLEAR ?auto_172315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172309 ) ( ON ?auto_172310 ?auto_172309 ) ( ON ?auto_172311 ?auto_172310 ) ( ON ?auto_172312 ?auto_172311 ) ( ON ?auto_172313 ?auto_172312 ) ( ON ?auto_172314 ?auto_172313 ) ( not ( = ?auto_172309 ?auto_172310 ) ) ( not ( = ?auto_172309 ?auto_172311 ) ) ( not ( = ?auto_172309 ?auto_172312 ) ) ( not ( = ?auto_172309 ?auto_172313 ) ) ( not ( = ?auto_172309 ?auto_172314 ) ) ( not ( = ?auto_172309 ?auto_172315 ) ) ( not ( = ?auto_172310 ?auto_172311 ) ) ( not ( = ?auto_172310 ?auto_172312 ) ) ( not ( = ?auto_172310 ?auto_172313 ) ) ( not ( = ?auto_172310 ?auto_172314 ) ) ( not ( = ?auto_172310 ?auto_172315 ) ) ( not ( = ?auto_172311 ?auto_172312 ) ) ( not ( = ?auto_172311 ?auto_172313 ) ) ( not ( = ?auto_172311 ?auto_172314 ) ) ( not ( = ?auto_172311 ?auto_172315 ) ) ( not ( = ?auto_172312 ?auto_172313 ) ) ( not ( = ?auto_172312 ?auto_172314 ) ) ( not ( = ?auto_172312 ?auto_172315 ) ) ( not ( = ?auto_172313 ?auto_172314 ) ) ( not ( = ?auto_172313 ?auto_172315 ) ) ( not ( = ?auto_172314 ?auto_172315 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172315 ?auto_172314 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172316 - BLOCK
      ?auto_172317 - BLOCK
      ?auto_172318 - BLOCK
      ?auto_172319 - BLOCK
      ?auto_172320 - BLOCK
      ?auto_172321 - BLOCK
    )
    :vars
    (
      ?auto_172322 - BLOCK
      ?auto_172323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172322 ?auto_172321 ) ( CLEAR ?auto_172322 ) ( ON-TABLE ?auto_172316 ) ( ON ?auto_172317 ?auto_172316 ) ( ON ?auto_172318 ?auto_172317 ) ( ON ?auto_172319 ?auto_172318 ) ( ON ?auto_172320 ?auto_172319 ) ( ON ?auto_172321 ?auto_172320 ) ( not ( = ?auto_172316 ?auto_172317 ) ) ( not ( = ?auto_172316 ?auto_172318 ) ) ( not ( = ?auto_172316 ?auto_172319 ) ) ( not ( = ?auto_172316 ?auto_172320 ) ) ( not ( = ?auto_172316 ?auto_172321 ) ) ( not ( = ?auto_172316 ?auto_172322 ) ) ( not ( = ?auto_172317 ?auto_172318 ) ) ( not ( = ?auto_172317 ?auto_172319 ) ) ( not ( = ?auto_172317 ?auto_172320 ) ) ( not ( = ?auto_172317 ?auto_172321 ) ) ( not ( = ?auto_172317 ?auto_172322 ) ) ( not ( = ?auto_172318 ?auto_172319 ) ) ( not ( = ?auto_172318 ?auto_172320 ) ) ( not ( = ?auto_172318 ?auto_172321 ) ) ( not ( = ?auto_172318 ?auto_172322 ) ) ( not ( = ?auto_172319 ?auto_172320 ) ) ( not ( = ?auto_172319 ?auto_172321 ) ) ( not ( = ?auto_172319 ?auto_172322 ) ) ( not ( = ?auto_172320 ?auto_172321 ) ) ( not ( = ?auto_172320 ?auto_172322 ) ) ( not ( = ?auto_172321 ?auto_172322 ) ) ( HOLDING ?auto_172323 ) ( not ( = ?auto_172316 ?auto_172323 ) ) ( not ( = ?auto_172317 ?auto_172323 ) ) ( not ( = ?auto_172318 ?auto_172323 ) ) ( not ( = ?auto_172319 ?auto_172323 ) ) ( not ( = ?auto_172320 ?auto_172323 ) ) ( not ( = ?auto_172321 ?auto_172323 ) ) ( not ( = ?auto_172322 ?auto_172323 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_172323 )
      ( MAKE-6PILE ?auto_172316 ?auto_172317 ?auto_172318 ?auto_172319 ?auto_172320 ?auto_172321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172324 - BLOCK
      ?auto_172325 - BLOCK
      ?auto_172326 - BLOCK
      ?auto_172327 - BLOCK
      ?auto_172328 - BLOCK
      ?auto_172329 - BLOCK
    )
    :vars
    (
      ?auto_172331 - BLOCK
      ?auto_172330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172331 ?auto_172329 ) ( ON-TABLE ?auto_172324 ) ( ON ?auto_172325 ?auto_172324 ) ( ON ?auto_172326 ?auto_172325 ) ( ON ?auto_172327 ?auto_172326 ) ( ON ?auto_172328 ?auto_172327 ) ( ON ?auto_172329 ?auto_172328 ) ( not ( = ?auto_172324 ?auto_172325 ) ) ( not ( = ?auto_172324 ?auto_172326 ) ) ( not ( = ?auto_172324 ?auto_172327 ) ) ( not ( = ?auto_172324 ?auto_172328 ) ) ( not ( = ?auto_172324 ?auto_172329 ) ) ( not ( = ?auto_172324 ?auto_172331 ) ) ( not ( = ?auto_172325 ?auto_172326 ) ) ( not ( = ?auto_172325 ?auto_172327 ) ) ( not ( = ?auto_172325 ?auto_172328 ) ) ( not ( = ?auto_172325 ?auto_172329 ) ) ( not ( = ?auto_172325 ?auto_172331 ) ) ( not ( = ?auto_172326 ?auto_172327 ) ) ( not ( = ?auto_172326 ?auto_172328 ) ) ( not ( = ?auto_172326 ?auto_172329 ) ) ( not ( = ?auto_172326 ?auto_172331 ) ) ( not ( = ?auto_172327 ?auto_172328 ) ) ( not ( = ?auto_172327 ?auto_172329 ) ) ( not ( = ?auto_172327 ?auto_172331 ) ) ( not ( = ?auto_172328 ?auto_172329 ) ) ( not ( = ?auto_172328 ?auto_172331 ) ) ( not ( = ?auto_172329 ?auto_172331 ) ) ( not ( = ?auto_172324 ?auto_172330 ) ) ( not ( = ?auto_172325 ?auto_172330 ) ) ( not ( = ?auto_172326 ?auto_172330 ) ) ( not ( = ?auto_172327 ?auto_172330 ) ) ( not ( = ?auto_172328 ?auto_172330 ) ) ( not ( = ?auto_172329 ?auto_172330 ) ) ( not ( = ?auto_172331 ?auto_172330 ) ) ( ON ?auto_172330 ?auto_172331 ) ( CLEAR ?auto_172330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172324 ?auto_172325 ?auto_172326 ?auto_172327 ?auto_172328 ?auto_172329 ?auto_172331 )
      ( MAKE-6PILE ?auto_172324 ?auto_172325 ?auto_172326 ?auto_172327 ?auto_172328 ?auto_172329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172332 - BLOCK
      ?auto_172333 - BLOCK
      ?auto_172334 - BLOCK
      ?auto_172335 - BLOCK
      ?auto_172336 - BLOCK
      ?auto_172337 - BLOCK
    )
    :vars
    (
      ?auto_172338 - BLOCK
      ?auto_172339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172338 ?auto_172337 ) ( ON-TABLE ?auto_172332 ) ( ON ?auto_172333 ?auto_172332 ) ( ON ?auto_172334 ?auto_172333 ) ( ON ?auto_172335 ?auto_172334 ) ( ON ?auto_172336 ?auto_172335 ) ( ON ?auto_172337 ?auto_172336 ) ( not ( = ?auto_172332 ?auto_172333 ) ) ( not ( = ?auto_172332 ?auto_172334 ) ) ( not ( = ?auto_172332 ?auto_172335 ) ) ( not ( = ?auto_172332 ?auto_172336 ) ) ( not ( = ?auto_172332 ?auto_172337 ) ) ( not ( = ?auto_172332 ?auto_172338 ) ) ( not ( = ?auto_172333 ?auto_172334 ) ) ( not ( = ?auto_172333 ?auto_172335 ) ) ( not ( = ?auto_172333 ?auto_172336 ) ) ( not ( = ?auto_172333 ?auto_172337 ) ) ( not ( = ?auto_172333 ?auto_172338 ) ) ( not ( = ?auto_172334 ?auto_172335 ) ) ( not ( = ?auto_172334 ?auto_172336 ) ) ( not ( = ?auto_172334 ?auto_172337 ) ) ( not ( = ?auto_172334 ?auto_172338 ) ) ( not ( = ?auto_172335 ?auto_172336 ) ) ( not ( = ?auto_172335 ?auto_172337 ) ) ( not ( = ?auto_172335 ?auto_172338 ) ) ( not ( = ?auto_172336 ?auto_172337 ) ) ( not ( = ?auto_172336 ?auto_172338 ) ) ( not ( = ?auto_172337 ?auto_172338 ) ) ( not ( = ?auto_172332 ?auto_172339 ) ) ( not ( = ?auto_172333 ?auto_172339 ) ) ( not ( = ?auto_172334 ?auto_172339 ) ) ( not ( = ?auto_172335 ?auto_172339 ) ) ( not ( = ?auto_172336 ?auto_172339 ) ) ( not ( = ?auto_172337 ?auto_172339 ) ) ( not ( = ?auto_172338 ?auto_172339 ) ) ( HOLDING ?auto_172339 ) ( CLEAR ?auto_172338 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172332 ?auto_172333 ?auto_172334 ?auto_172335 ?auto_172336 ?auto_172337 ?auto_172338 ?auto_172339 )
      ( MAKE-6PILE ?auto_172332 ?auto_172333 ?auto_172334 ?auto_172335 ?auto_172336 ?auto_172337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172340 - BLOCK
      ?auto_172341 - BLOCK
      ?auto_172342 - BLOCK
      ?auto_172343 - BLOCK
      ?auto_172344 - BLOCK
      ?auto_172345 - BLOCK
    )
    :vars
    (
      ?auto_172346 - BLOCK
      ?auto_172347 - BLOCK
      ?auto_172348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172346 ?auto_172345 ) ( ON-TABLE ?auto_172340 ) ( ON ?auto_172341 ?auto_172340 ) ( ON ?auto_172342 ?auto_172341 ) ( ON ?auto_172343 ?auto_172342 ) ( ON ?auto_172344 ?auto_172343 ) ( ON ?auto_172345 ?auto_172344 ) ( not ( = ?auto_172340 ?auto_172341 ) ) ( not ( = ?auto_172340 ?auto_172342 ) ) ( not ( = ?auto_172340 ?auto_172343 ) ) ( not ( = ?auto_172340 ?auto_172344 ) ) ( not ( = ?auto_172340 ?auto_172345 ) ) ( not ( = ?auto_172340 ?auto_172346 ) ) ( not ( = ?auto_172341 ?auto_172342 ) ) ( not ( = ?auto_172341 ?auto_172343 ) ) ( not ( = ?auto_172341 ?auto_172344 ) ) ( not ( = ?auto_172341 ?auto_172345 ) ) ( not ( = ?auto_172341 ?auto_172346 ) ) ( not ( = ?auto_172342 ?auto_172343 ) ) ( not ( = ?auto_172342 ?auto_172344 ) ) ( not ( = ?auto_172342 ?auto_172345 ) ) ( not ( = ?auto_172342 ?auto_172346 ) ) ( not ( = ?auto_172343 ?auto_172344 ) ) ( not ( = ?auto_172343 ?auto_172345 ) ) ( not ( = ?auto_172343 ?auto_172346 ) ) ( not ( = ?auto_172344 ?auto_172345 ) ) ( not ( = ?auto_172344 ?auto_172346 ) ) ( not ( = ?auto_172345 ?auto_172346 ) ) ( not ( = ?auto_172340 ?auto_172347 ) ) ( not ( = ?auto_172341 ?auto_172347 ) ) ( not ( = ?auto_172342 ?auto_172347 ) ) ( not ( = ?auto_172343 ?auto_172347 ) ) ( not ( = ?auto_172344 ?auto_172347 ) ) ( not ( = ?auto_172345 ?auto_172347 ) ) ( not ( = ?auto_172346 ?auto_172347 ) ) ( CLEAR ?auto_172346 ) ( ON ?auto_172347 ?auto_172348 ) ( CLEAR ?auto_172347 ) ( HAND-EMPTY ) ( not ( = ?auto_172340 ?auto_172348 ) ) ( not ( = ?auto_172341 ?auto_172348 ) ) ( not ( = ?auto_172342 ?auto_172348 ) ) ( not ( = ?auto_172343 ?auto_172348 ) ) ( not ( = ?auto_172344 ?auto_172348 ) ) ( not ( = ?auto_172345 ?auto_172348 ) ) ( not ( = ?auto_172346 ?auto_172348 ) ) ( not ( = ?auto_172347 ?auto_172348 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172347 ?auto_172348 )
      ( MAKE-6PILE ?auto_172340 ?auto_172341 ?auto_172342 ?auto_172343 ?auto_172344 ?auto_172345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172367 - BLOCK
      ?auto_172368 - BLOCK
      ?auto_172369 - BLOCK
      ?auto_172370 - BLOCK
      ?auto_172371 - BLOCK
      ?auto_172372 - BLOCK
    )
    :vars
    (
      ?auto_172375 - BLOCK
      ?auto_172373 - BLOCK
      ?auto_172374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172367 ) ( ON ?auto_172368 ?auto_172367 ) ( ON ?auto_172369 ?auto_172368 ) ( ON ?auto_172370 ?auto_172369 ) ( ON ?auto_172371 ?auto_172370 ) ( not ( = ?auto_172367 ?auto_172368 ) ) ( not ( = ?auto_172367 ?auto_172369 ) ) ( not ( = ?auto_172367 ?auto_172370 ) ) ( not ( = ?auto_172367 ?auto_172371 ) ) ( not ( = ?auto_172367 ?auto_172372 ) ) ( not ( = ?auto_172367 ?auto_172375 ) ) ( not ( = ?auto_172368 ?auto_172369 ) ) ( not ( = ?auto_172368 ?auto_172370 ) ) ( not ( = ?auto_172368 ?auto_172371 ) ) ( not ( = ?auto_172368 ?auto_172372 ) ) ( not ( = ?auto_172368 ?auto_172375 ) ) ( not ( = ?auto_172369 ?auto_172370 ) ) ( not ( = ?auto_172369 ?auto_172371 ) ) ( not ( = ?auto_172369 ?auto_172372 ) ) ( not ( = ?auto_172369 ?auto_172375 ) ) ( not ( = ?auto_172370 ?auto_172371 ) ) ( not ( = ?auto_172370 ?auto_172372 ) ) ( not ( = ?auto_172370 ?auto_172375 ) ) ( not ( = ?auto_172371 ?auto_172372 ) ) ( not ( = ?auto_172371 ?auto_172375 ) ) ( not ( = ?auto_172372 ?auto_172375 ) ) ( not ( = ?auto_172367 ?auto_172373 ) ) ( not ( = ?auto_172368 ?auto_172373 ) ) ( not ( = ?auto_172369 ?auto_172373 ) ) ( not ( = ?auto_172370 ?auto_172373 ) ) ( not ( = ?auto_172371 ?auto_172373 ) ) ( not ( = ?auto_172372 ?auto_172373 ) ) ( not ( = ?auto_172375 ?auto_172373 ) ) ( ON ?auto_172373 ?auto_172374 ) ( not ( = ?auto_172367 ?auto_172374 ) ) ( not ( = ?auto_172368 ?auto_172374 ) ) ( not ( = ?auto_172369 ?auto_172374 ) ) ( not ( = ?auto_172370 ?auto_172374 ) ) ( not ( = ?auto_172371 ?auto_172374 ) ) ( not ( = ?auto_172372 ?auto_172374 ) ) ( not ( = ?auto_172375 ?auto_172374 ) ) ( not ( = ?auto_172373 ?auto_172374 ) ) ( ON ?auto_172375 ?auto_172373 ) ( CLEAR ?auto_172375 ) ( HOLDING ?auto_172372 ) ( CLEAR ?auto_172371 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172367 ?auto_172368 ?auto_172369 ?auto_172370 ?auto_172371 ?auto_172372 ?auto_172375 )
      ( MAKE-6PILE ?auto_172367 ?auto_172368 ?auto_172369 ?auto_172370 ?auto_172371 ?auto_172372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172376 - BLOCK
      ?auto_172377 - BLOCK
      ?auto_172378 - BLOCK
      ?auto_172379 - BLOCK
      ?auto_172380 - BLOCK
      ?auto_172381 - BLOCK
    )
    :vars
    (
      ?auto_172383 - BLOCK
      ?auto_172382 - BLOCK
      ?auto_172384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172376 ) ( ON ?auto_172377 ?auto_172376 ) ( ON ?auto_172378 ?auto_172377 ) ( ON ?auto_172379 ?auto_172378 ) ( ON ?auto_172380 ?auto_172379 ) ( not ( = ?auto_172376 ?auto_172377 ) ) ( not ( = ?auto_172376 ?auto_172378 ) ) ( not ( = ?auto_172376 ?auto_172379 ) ) ( not ( = ?auto_172376 ?auto_172380 ) ) ( not ( = ?auto_172376 ?auto_172381 ) ) ( not ( = ?auto_172376 ?auto_172383 ) ) ( not ( = ?auto_172377 ?auto_172378 ) ) ( not ( = ?auto_172377 ?auto_172379 ) ) ( not ( = ?auto_172377 ?auto_172380 ) ) ( not ( = ?auto_172377 ?auto_172381 ) ) ( not ( = ?auto_172377 ?auto_172383 ) ) ( not ( = ?auto_172378 ?auto_172379 ) ) ( not ( = ?auto_172378 ?auto_172380 ) ) ( not ( = ?auto_172378 ?auto_172381 ) ) ( not ( = ?auto_172378 ?auto_172383 ) ) ( not ( = ?auto_172379 ?auto_172380 ) ) ( not ( = ?auto_172379 ?auto_172381 ) ) ( not ( = ?auto_172379 ?auto_172383 ) ) ( not ( = ?auto_172380 ?auto_172381 ) ) ( not ( = ?auto_172380 ?auto_172383 ) ) ( not ( = ?auto_172381 ?auto_172383 ) ) ( not ( = ?auto_172376 ?auto_172382 ) ) ( not ( = ?auto_172377 ?auto_172382 ) ) ( not ( = ?auto_172378 ?auto_172382 ) ) ( not ( = ?auto_172379 ?auto_172382 ) ) ( not ( = ?auto_172380 ?auto_172382 ) ) ( not ( = ?auto_172381 ?auto_172382 ) ) ( not ( = ?auto_172383 ?auto_172382 ) ) ( ON ?auto_172382 ?auto_172384 ) ( not ( = ?auto_172376 ?auto_172384 ) ) ( not ( = ?auto_172377 ?auto_172384 ) ) ( not ( = ?auto_172378 ?auto_172384 ) ) ( not ( = ?auto_172379 ?auto_172384 ) ) ( not ( = ?auto_172380 ?auto_172384 ) ) ( not ( = ?auto_172381 ?auto_172384 ) ) ( not ( = ?auto_172383 ?auto_172384 ) ) ( not ( = ?auto_172382 ?auto_172384 ) ) ( ON ?auto_172383 ?auto_172382 ) ( CLEAR ?auto_172380 ) ( ON ?auto_172381 ?auto_172383 ) ( CLEAR ?auto_172381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172384 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172384 ?auto_172382 ?auto_172383 )
      ( MAKE-6PILE ?auto_172376 ?auto_172377 ?auto_172378 ?auto_172379 ?auto_172380 ?auto_172381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172385 - BLOCK
      ?auto_172386 - BLOCK
      ?auto_172387 - BLOCK
      ?auto_172388 - BLOCK
      ?auto_172389 - BLOCK
      ?auto_172390 - BLOCK
    )
    :vars
    (
      ?auto_172393 - BLOCK
      ?auto_172392 - BLOCK
      ?auto_172391 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172385 ) ( ON ?auto_172386 ?auto_172385 ) ( ON ?auto_172387 ?auto_172386 ) ( ON ?auto_172388 ?auto_172387 ) ( not ( = ?auto_172385 ?auto_172386 ) ) ( not ( = ?auto_172385 ?auto_172387 ) ) ( not ( = ?auto_172385 ?auto_172388 ) ) ( not ( = ?auto_172385 ?auto_172389 ) ) ( not ( = ?auto_172385 ?auto_172390 ) ) ( not ( = ?auto_172385 ?auto_172393 ) ) ( not ( = ?auto_172386 ?auto_172387 ) ) ( not ( = ?auto_172386 ?auto_172388 ) ) ( not ( = ?auto_172386 ?auto_172389 ) ) ( not ( = ?auto_172386 ?auto_172390 ) ) ( not ( = ?auto_172386 ?auto_172393 ) ) ( not ( = ?auto_172387 ?auto_172388 ) ) ( not ( = ?auto_172387 ?auto_172389 ) ) ( not ( = ?auto_172387 ?auto_172390 ) ) ( not ( = ?auto_172387 ?auto_172393 ) ) ( not ( = ?auto_172388 ?auto_172389 ) ) ( not ( = ?auto_172388 ?auto_172390 ) ) ( not ( = ?auto_172388 ?auto_172393 ) ) ( not ( = ?auto_172389 ?auto_172390 ) ) ( not ( = ?auto_172389 ?auto_172393 ) ) ( not ( = ?auto_172390 ?auto_172393 ) ) ( not ( = ?auto_172385 ?auto_172392 ) ) ( not ( = ?auto_172386 ?auto_172392 ) ) ( not ( = ?auto_172387 ?auto_172392 ) ) ( not ( = ?auto_172388 ?auto_172392 ) ) ( not ( = ?auto_172389 ?auto_172392 ) ) ( not ( = ?auto_172390 ?auto_172392 ) ) ( not ( = ?auto_172393 ?auto_172392 ) ) ( ON ?auto_172392 ?auto_172391 ) ( not ( = ?auto_172385 ?auto_172391 ) ) ( not ( = ?auto_172386 ?auto_172391 ) ) ( not ( = ?auto_172387 ?auto_172391 ) ) ( not ( = ?auto_172388 ?auto_172391 ) ) ( not ( = ?auto_172389 ?auto_172391 ) ) ( not ( = ?auto_172390 ?auto_172391 ) ) ( not ( = ?auto_172393 ?auto_172391 ) ) ( not ( = ?auto_172392 ?auto_172391 ) ) ( ON ?auto_172393 ?auto_172392 ) ( ON ?auto_172390 ?auto_172393 ) ( CLEAR ?auto_172390 ) ( ON-TABLE ?auto_172391 ) ( HOLDING ?auto_172389 ) ( CLEAR ?auto_172388 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172385 ?auto_172386 ?auto_172387 ?auto_172388 ?auto_172389 )
      ( MAKE-6PILE ?auto_172385 ?auto_172386 ?auto_172387 ?auto_172388 ?auto_172389 ?auto_172390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172394 - BLOCK
      ?auto_172395 - BLOCK
      ?auto_172396 - BLOCK
      ?auto_172397 - BLOCK
      ?auto_172398 - BLOCK
      ?auto_172399 - BLOCK
    )
    :vars
    (
      ?auto_172402 - BLOCK
      ?auto_172400 - BLOCK
      ?auto_172401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172394 ) ( ON ?auto_172395 ?auto_172394 ) ( ON ?auto_172396 ?auto_172395 ) ( ON ?auto_172397 ?auto_172396 ) ( not ( = ?auto_172394 ?auto_172395 ) ) ( not ( = ?auto_172394 ?auto_172396 ) ) ( not ( = ?auto_172394 ?auto_172397 ) ) ( not ( = ?auto_172394 ?auto_172398 ) ) ( not ( = ?auto_172394 ?auto_172399 ) ) ( not ( = ?auto_172394 ?auto_172402 ) ) ( not ( = ?auto_172395 ?auto_172396 ) ) ( not ( = ?auto_172395 ?auto_172397 ) ) ( not ( = ?auto_172395 ?auto_172398 ) ) ( not ( = ?auto_172395 ?auto_172399 ) ) ( not ( = ?auto_172395 ?auto_172402 ) ) ( not ( = ?auto_172396 ?auto_172397 ) ) ( not ( = ?auto_172396 ?auto_172398 ) ) ( not ( = ?auto_172396 ?auto_172399 ) ) ( not ( = ?auto_172396 ?auto_172402 ) ) ( not ( = ?auto_172397 ?auto_172398 ) ) ( not ( = ?auto_172397 ?auto_172399 ) ) ( not ( = ?auto_172397 ?auto_172402 ) ) ( not ( = ?auto_172398 ?auto_172399 ) ) ( not ( = ?auto_172398 ?auto_172402 ) ) ( not ( = ?auto_172399 ?auto_172402 ) ) ( not ( = ?auto_172394 ?auto_172400 ) ) ( not ( = ?auto_172395 ?auto_172400 ) ) ( not ( = ?auto_172396 ?auto_172400 ) ) ( not ( = ?auto_172397 ?auto_172400 ) ) ( not ( = ?auto_172398 ?auto_172400 ) ) ( not ( = ?auto_172399 ?auto_172400 ) ) ( not ( = ?auto_172402 ?auto_172400 ) ) ( ON ?auto_172400 ?auto_172401 ) ( not ( = ?auto_172394 ?auto_172401 ) ) ( not ( = ?auto_172395 ?auto_172401 ) ) ( not ( = ?auto_172396 ?auto_172401 ) ) ( not ( = ?auto_172397 ?auto_172401 ) ) ( not ( = ?auto_172398 ?auto_172401 ) ) ( not ( = ?auto_172399 ?auto_172401 ) ) ( not ( = ?auto_172402 ?auto_172401 ) ) ( not ( = ?auto_172400 ?auto_172401 ) ) ( ON ?auto_172402 ?auto_172400 ) ( ON ?auto_172399 ?auto_172402 ) ( ON-TABLE ?auto_172401 ) ( CLEAR ?auto_172397 ) ( ON ?auto_172398 ?auto_172399 ) ( CLEAR ?auto_172398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172401 ?auto_172400 ?auto_172402 ?auto_172399 )
      ( MAKE-6PILE ?auto_172394 ?auto_172395 ?auto_172396 ?auto_172397 ?auto_172398 ?auto_172399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172403 - BLOCK
      ?auto_172404 - BLOCK
      ?auto_172405 - BLOCK
      ?auto_172406 - BLOCK
      ?auto_172407 - BLOCK
      ?auto_172408 - BLOCK
    )
    :vars
    (
      ?auto_172409 - BLOCK
      ?auto_172411 - BLOCK
      ?auto_172410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172403 ) ( ON ?auto_172404 ?auto_172403 ) ( ON ?auto_172405 ?auto_172404 ) ( not ( = ?auto_172403 ?auto_172404 ) ) ( not ( = ?auto_172403 ?auto_172405 ) ) ( not ( = ?auto_172403 ?auto_172406 ) ) ( not ( = ?auto_172403 ?auto_172407 ) ) ( not ( = ?auto_172403 ?auto_172408 ) ) ( not ( = ?auto_172403 ?auto_172409 ) ) ( not ( = ?auto_172404 ?auto_172405 ) ) ( not ( = ?auto_172404 ?auto_172406 ) ) ( not ( = ?auto_172404 ?auto_172407 ) ) ( not ( = ?auto_172404 ?auto_172408 ) ) ( not ( = ?auto_172404 ?auto_172409 ) ) ( not ( = ?auto_172405 ?auto_172406 ) ) ( not ( = ?auto_172405 ?auto_172407 ) ) ( not ( = ?auto_172405 ?auto_172408 ) ) ( not ( = ?auto_172405 ?auto_172409 ) ) ( not ( = ?auto_172406 ?auto_172407 ) ) ( not ( = ?auto_172406 ?auto_172408 ) ) ( not ( = ?auto_172406 ?auto_172409 ) ) ( not ( = ?auto_172407 ?auto_172408 ) ) ( not ( = ?auto_172407 ?auto_172409 ) ) ( not ( = ?auto_172408 ?auto_172409 ) ) ( not ( = ?auto_172403 ?auto_172411 ) ) ( not ( = ?auto_172404 ?auto_172411 ) ) ( not ( = ?auto_172405 ?auto_172411 ) ) ( not ( = ?auto_172406 ?auto_172411 ) ) ( not ( = ?auto_172407 ?auto_172411 ) ) ( not ( = ?auto_172408 ?auto_172411 ) ) ( not ( = ?auto_172409 ?auto_172411 ) ) ( ON ?auto_172411 ?auto_172410 ) ( not ( = ?auto_172403 ?auto_172410 ) ) ( not ( = ?auto_172404 ?auto_172410 ) ) ( not ( = ?auto_172405 ?auto_172410 ) ) ( not ( = ?auto_172406 ?auto_172410 ) ) ( not ( = ?auto_172407 ?auto_172410 ) ) ( not ( = ?auto_172408 ?auto_172410 ) ) ( not ( = ?auto_172409 ?auto_172410 ) ) ( not ( = ?auto_172411 ?auto_172410 ) ) ( ON ?auto_172409 ?auto_172411 ) ( ON ?auto_172408 ?auto_172409 ) ( ON-TABLE ?auto_172410 ) ( ON ?auto_172407 ?auto_172408 ) ( CLEAR ?auto_172407 ) ( HOLDING ?auto_172406 ) ( CLEAR ?auto_172405 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172403 ?auto_172404 ?auto_172405 ?auto_172406 )
      ( MAKE-6PILE ?auto_172403 ?auto_172404 ?auto_172405 ?auto_172406 ?auto_172407 ?auto_172408 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172412 - BLOCK
      ?auto_172413 - BLOCK
      ?auto_172414 - BLOCK
      ?auto_172415 - BLOCK
      ?auto_172416 - BLOCK
      ?auto_172417 - BLOCK
    )
    :vars
    (
      ?auto_172418 - BLOCK
      ?auto_172419 - BLOCK
      ?auto_172420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172412 ) ( ON ?auto_172413 ?auto_172412 ) ( ON ?auto_172414 ?auto_172413 ) ( not ( = ?auto_172412 ?auto_172413 ) ) ( not ( = ?auto_172412 ?auto_172414 ) ) ( not ( = ?auto_172412 ?auto_172415 ) ) ( not ( = ?auto_172412 ?auto_172416 ) ) ( not ( = ?auto_172412 ?auto_172417 ) ) ( not ( = ?auto_172412 ?auto_172418 ) ) ( not ( = ?auto_172413 ?auto_172414 ) ) ( not ( = ?auto_172413 ?auto_172415 ) ) ( not ( = ?auto_172413 ?auto_172416 ) ) ( not ( = ?auto_172413 ?auto_172417 ) ) ( not ( = ?auto_172413 ?auto_172418 ) ) ( not ( = ?auto_172414 ?auto_172415 ) ) ( not ( = ?auto_172414 ?auto_172416 ) ) ( not ( = ?auto_172414 ?auto_172417 ) ) ( not ( = ?auto_172414 ?auto_172418 ) ) ( not ( = ?auto_172415 ?auto_172416 ) ) ( not ( = ?auto_172415 ?auto_172417 ) ) ( not ( = ?auto_172415 ?auto_172418 ) ) ( not ( = ?auto_172416 ?auto_172417 ) ) ( not ( = ?auto_172416 ?auto_172418 ) ) ( not ( = ?auto_172417 ?auto_172418 ) ) ( not ( = ?auto_172412 ?auto_172419 ) ) ( not ( = ?auto_172413 ?auto_172419 ) ) ( not ( = ?auto_172414 ?auto_172419 ) ) ( not ( = ?auto_172415 ?auto_172419 ) ) ( not ( = ?auto_172416 ?auto_172419 ) ) ( not ( = ?auto_172417 ?auto_172419 ) ) ( not ( = ?auto_172418 ?auto_172419 ) ) ( ON ?auto_172419 ?auto_172420 ) ( not ( = ?auto_172412 ?auto_172420 ) ) ( not ( = ?auto_172413 ?auto_172420 ) ) ( not ( = ?auto_172414 ?auto_172420 ) ) ( not ( = ?auto_172415 ?auto_172420 ) ) ( not ( = ?auto_172416 ?auto_172420 ) ) ( not ( = ?auto_172417 ?auto_172420 ) ) ( not ( = ?auto_172418 ?auto_172420 ) ) ( not ( = ?auto_172419 ?auto_172420 ) ) ( ON ?auto_172418 ?auto_172419 ) ( ON ?auto_172417 ?auto_172418 ) ( ON-TABLE ?auto_172420 ) ( ON ?auto_172416 ?auto_172417 ) ( CLEAR ?auto_172414 ) ( ON ?auto_172415 ?auto_172416 ) ( CLEAR ?auto_172415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172420 ?auto_172419 ?auto_172418 ?auto_172417 ?auto_172416 )
      ( MAKE-6PILE ?auto_172412 ?auto_172413 ?auto_172414 ?auto_172415 ?auto_172416 ?auto_172417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172421 - BLOCK
      ?auto_172422 - BLOCK
      ?auto_172423 - BLOCK
      ?auto_172424 - BLOCK
      ?auto_172425 - BLOCK
      ?auto_172426 - BLOCK
    )
    :vars
    (
      ?auto_172428 - BLOCK
      ?auto_172429 - BLOCK
      ?auto_172427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172421 ) ( ON ?auto_172422 ?auto_172421 ) ( not ( = ?auto_172421 ?auto_172422 ) ) ( not ( = ?auto_172421 ?auto_172423 ) ) ( not ( = ?auto_172421 ?auto_172424 ) ) ( not ( = ?auto_172421 ?auto_172425 ) ) ( not ( = ?auto_172421 ?auto_172426 ) ) ( not ( = ?auto_172421 ?auto_172428 ) ) ( not ( = ?auto_172422 ?auto_172423 ) ) ( not ( = ?auto_172422 ?auto_172424 ) ) ( not ( = ?auto_172422 ?auto_172425 ) ) ( not ( = ?auto_172422 ?auto_172426 ) ) ( not ( = ?auto_172422 ?auto_172428 ) ) ( not ( = ?auto_172423 ?auto_172424 ) ) ( not ( = ?auto_172423 ?auto_172425 ) ) ( not ( = ?auto_172423 ?auto_172426 ) ) ( not ( = ?auto_172423 ?auto_172428 ) ) ( not ( = ?auto_172424 ?auto_172425 ) ) ( not ( = ?auto_172424 ?auto_172426 ) ) ( not ( = ?auto_172424 ?auto_172428 ) ) ( not ( = ?auto_172425 ?auto_172426 ) ) ( not ( = ?auto_172425 ?auto_172428 ) ) ( not ( = ?auto_172426 ?auto_172428 ) ) ( not ( = ?auto_172421 ?auto_172429 ) ) ( not ( = ?auto_172422 ?auto_172429 ) ) ( not ( = ?auto_172423 ?auto_172429 ) ) ( not ( = ?auto_172424 ?auto_172429 ) ) ( not ( = ?auto_172425 ?auto_172429 ) ) ( not ( = ?auto_172426 ?auto_172429 ) ) ( not ( = ?auto_172428 ?auto_172429 ) ) ( ON ?auto_172429 ?auto_172427 ) ( not ( = ?auto_172421 ?auto_172427 ) ) ( not ( = ?auto_172422 ?auto_172427 ) ) ( not ( = ?auto_172423 ?auto_172427 ) ) ( not ( = ?auto_172424 ?auto_172427 ) ) ( not ( = ?auto_172425 ?auto_172427 ) ) ( not ( = ?auto_172426 ?auto_172427 ) ) ( not ( = ?auto_172428 ?auto_172427 ) ) ( not ( = ?auto_172429 ?auto_172427 ) ) ( ON ?auto_172428 ?auto_172429 ) ( ON ?auto_172426 ?auto_172428 ) ( ON-TABLE ?auto_172427 ) ( ON ?auto_172425 ?auto_172426 ) ( ON ?auto_172424 ?auto_172425 ) ( CLEAR ?auto_172424 ) ( HOLDING ?auto_172423 ) ( CLEAR ?auto_172422 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172421 ?auto_172422 ?auto_172423 )
      ( MAKE-6PILE ?auto_172421 ?auto_172422 ?auto_172423 ?auto_172424 ?auto_172425 ?auto_172426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172430 - BLOCK
      ?auto_172431 - BLOCK
      ?auto_172432 - BLOCK
      ?auto_172433 - BLOCK
      ?auto_172434 - BLOCK
      ?auto_172435 - BLOCK
    )
    :vars
    (
      ?auto_172438 - BLOCK
      ?auto_172437 - BLOCK
      ?auto_172436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172430 ) ( ON ?auto_172431 ?auto_172430 ) ( not ( = ?auto_172430 ?auto_172431 ) ) ( not ( = ?auto_172430 ?auto_172432 ) ) ( not ( = ?auto_172430 ?auto_172433 ) ) ( not ( = ?auto_172430 ?auto_172434 ) ) ( not ( = ?auto_172430 ?auto_172435 ) ) ( not ( = ?auto_172430 ?auto_172438 ) ) ( not ( = ?auto_172431 ?auto_172432 ) ) ( not ( = ?auto_172431 ?auto_172433 ) ) ( not ( = ?auto_172431 ?auto_172434 ) ) ( not ( = ?auto_172431 ?auto_172435 ) ) ( not ( = ?auto_172431 ?auto_172438 ) ) ( not ( = ?auto_172432 ?auto_172433 ) ) ( not ( = ?auto_172432 ?auto_172434 ) ) ( not ( = ?auto_172432 ?auto_172435 ) ) ( not ( = ?auto_172432 ?auto_172438 ) ) ( not ( = ?auto_172433 ?auto_172434 ) ) ( not ( = ?auto_172433 ?auto_172435 ) ) ( not ( = ?auto_172433 ?auto_172438 ) ) ( not ( = ?auto_172434 ?auto_172435 ) ) ( not ( = ?auto_172434 ?auto_172438 ) ) ( not ( = ?auto_172435 ?auto_172438 ) ) ( not ( = ?auto_172430 ?auto_172437 ) ) ( not ( = ?auto_172431 ?auto_172437 ) ) ( not ( = ?auto_172432 ?auto_172437 ) ) ( not ( = ?auto_172433 ?auto_172437 ) ) ( not ( = ?auto_172434 ?auto_172437 ) ) ( not ( = ?auto_172435 ?auto_172437 ) ) ( not ( = ?auto_172438 ?auto_172437 ) ) ( ON ?auto_172437 ?auto_172436 ) ( not ( = ?auto_172430 ?auto_172436 ) ) ( not ( = ?auto_172431 ?auto_172436 ) ) ( not ( = ?auto_172432 ?auto_172436 ) ) ( not ( = ?auto_172433 ?auto_172436 ) ) ( not ( = ?auto_172434 ?auto_172436 ) ) ( not ( = ?auto_172435 ?auto_172436 ) ) ( not ( = ?auto_172438 ?auto_172436 ) ) ( not ( = ?auto_172437 ?auto_172436 ) ) ( ON ?auto_172438 ?auto_172437 ) ( ON ?auto_172435 ?auto_172438 ) ( ON-TABLE ?auto_172436 ) ( ON ?auto_172434 ?auto_172435 ) ( ON ?auto_172433 ?auto_172434 ) ( CLEAR ?auto_172431 ) ( ON ?auto_172432 ?auto_172433 ) ( CLEAR ?auto_172432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172436 ?auto_172437 ?auto_172438 ?auto_172435 ?auto_172434 ?auto_172433 )
      ( MAKE-6PILE ?auto_172430 ?auto_172431 ?auto_172432 ?auto_172433 ?auto_172434 ?auto_172435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172439 - BLOCK
      ?auto_172440 - BLOCK
      ?auto_172441 - BLOCK
      ?auto_172442 - BLOCK
      ?auto_172443 - BLOCK
      ?auto_172444 - BLOCK
    )
    :vars
    (
      ?auto_172445 - BLOCK
      ?auto_172446 - BLOCK
      ?auto_172447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172439 ) ( not ( = ?auto_172439 ?auto_172440 ) ) ( not ( = ?auto_172439 ?auto_172441 ) ) ( not ( = ?auto_172439 ?auto_172442 ) ) ( not ( = ?auto_172439 ?auto_172443 ) ) ( not ( = ?auto_172439 ?auto_172444 ) ) ( not ( = ?auto_172439 ?auto_172445 ) ) ( not ( = ?auto_172440 ?auto_172441 ) ) ( not ( = ?auto_172440 ?auto_172442 ) ) ( not ( = ?auto_172440 ?auto_172443 ) ) ( not ( = ?auto_172440 ?auto_172444 ) ) ( not ( = ?auto_172440 ?auto_172445 ) ) ( not ( = ?auto_172441 ?auto_172442 ) ) ( not ( = ?auto_172441 ?auto_172443 ) ) ( not ( = ?auto_172441 ?auto_172444 ) ) ( not ( = ?auto_172441 ?auto_172445 ) ) ( not ( = ?auto_172442 ?auto_172443 ) ) ( not ( = ?auto_172442 ?auto_172444 ) ) ( not ( = ?auto_172442 ?auto_172445 ) ) ( not ( = ?auto_172443 ?auto_172444 ) ) ( not ( = ?auto_172443 ?auto_172445 ) ) ( not ( = ?auto_172444 ?auto_172445 ) ) ( not ( = ?auto_172439 ?auto_172446 ) ) ( not ( = ?auto_172440 ?auto_172446 ) ) ( not ( = ?auto_172441 ?auto_172446 ) ) ( not ( = ?auto_172442 ?auto_172446 ) ) ( not ( = ?auto_172443 ?auto_172446 ) ) ( not ( = ?auto_172444 ?auto_172446 ) ) ( not ( = ?auto_172445 ?auto_172446 ) ) ( ON ?auto_172446 ?auto_172447 ) ( not ( = ?auto_172439 ?auto_172447 ) ) ( not ( = ?auto_172440 ?auto_172447 ) ) ( not ( = ?auto_172441 ?auto_172447 ) ) ( not ( = ?auto_172442 ?auto_172447 ) ) ( not ( = ?auto_172443 ?auto_172447 ) ) ( not ( = ?auto_172444 ?auto_172447 ) ) ( not ( = ?auto_172445 ?auto_172447 ) ) ( not ( = ?auto_172446 ?auto_172447 ) ) ( ON ?auto_172445 ?auto_172446 ) ( ON ?auto_172444 ?auto_172445 ) ( ON-TABLE ?auto_172447 ) ( ON ?auto_172443 ?auto_172444 ) ( ON ?auto_172442 ?auto_172443 ) ( ON ?auto_172441 ?auto_172442 ) ( CLEAR ?auto_172441 ) ( HOLDING ?auto_172440 ) ( CLEAR ?auto_172439 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172439 ?auto_172440 )
      ( MAKE-6PILE ?auto_172439 ?auto_172440 ?auto_172441 ?auto_172442 ?auto_172443 ?auto_172444 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172448 - BLOCK
      ?auto_172449 - BLOCK
      ?auto_172450 - BLOCK
      ?auto_172451 - BLOCK
      ?auto_172452 - BLOCK
      ?auto_172453 - BLOCK
    )
    :vars
    (
      ?auto_172454 - BLOCK
      ?auto_172456 - BLOCK
      ?auto_172455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172448 ) ( not ( = ?auto_172448 ?auto_172449 ) ) ( not ( = ?auto_172448 ?auto_172450 ) ) ( not ( = ?auto_172448 ?auto_172451 ) ) ( not ( = ?auto_172448 ?auto_172452 ) ) ( not ( = ?auto_172448 ?auto_172453 ) ) ( not ( = ?auto_172448 ?auto_172454 ) ) ( not ( = ?auto_172449 ?auto_172450 ) ) ( not ( = ?auto_172449 ?auto_172451 ) ) ( not ( = ?auto_172449 ?auto_172452 ) ) ( not ( = ?auto_172449 ?auto_172453 ) ) ( not ( = ?auto_172449 ?auto_172454 ) ) ( not ( = ?auto_172450 ?auto_172451 ) ) ( not ( = ?auto_172450 ?auto_172452 ) ) ( not ( = ?auto_172450 ?auto_172453 ) ) ( not ( = ?auto_172450 ?auto_172454 ) ) ( not ( = ?auto_172451 ?auto_172452 ) ) ( not ( = ?auto_172451 ?auto_172453 ) ) ( not ( = ?auto_172451 ?auto_172454 ) ) ( not ( = ?auto_172452 ?auto_172453 ) ) ( not ( = ?auto_172452 ?auto_172454 ) ) ( not ( = ?auto_172453 ?auto_172454 ) ) ( not ( = ?auto_172448 ?auto_172456 ) ) ( not ( = ?auto_172449 ?auto_172456 ) ) ( not ( = ?auto_172450 ?auto_172456 ) ) ( not ( = ?auto_172451 ?auto_172456 ) ) ( not ( = ?auto_172452 ?auto_172456 ) ) ( not ( = ?auto_172453 ?auto_172456 ) ) ( not ( = ?auto_172454 ?auto_172456 ) ) ( ON ?auto_172456 ?auto_172455 ) ( not ( = ?auto_172448 ?auto_172455 ) ) ( not ( = ?auto_172449 ?auto_172455 ) ) ( not ( = ?auto_172450 ?auto_172455 ) ) ( not ( = ?auto_172451 ?auto_172455 ) ) ( not ( = ?auto_172452 ?auto_172455 ) ) ( not ( = ?auto_172453 ?auto_172455 ) ) ( not ( = ?auto_172454 ?auto_172455 ) ) ( not ( = ?auto_172456 ?auto_172455 ) ) ( ON ?auto_172454 ?auto_172456 ) ( ON ?auto_172453 ?auto_172454 ) ( ON-TABLE ?auto_172455 ) ( ON ?auto_172452 ?auto_172453 ) ( ON ?auto_172451 ?auto_172452 ) ( ON ?auto_172450 ?auto_172451 ) ( CLEAR ?auto_172448 ) ( ON ?auto_172449 ?auto_172450 ) ( CLEAR ?auto_172449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172455 ?auto_172456 ?auto_172454 ?auto_172453 ?auto_172452 ?auto_172451 ?auto_172450 )
      ( MAKE-6PILE ?auto_172448 ?auto_172449 ?auto_172450 ?auto_172451 ?auto_172452 ?auto_172453 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172457 - BLOCK
      ?auto_172458 - BLOCK
      ?auto_172459 - BLOCK
      ?auto_172460 - BLOCK
      ?auto_172461 - BLOCK
      ?auto_172462 - BLOCK
    )
    :vars
    (
      ?auto_172463 - BLOCK
      ?auto_172465 - BLOCK
      ?auto_172464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172457 ?auto_172458 ) ) ( not ( = ?auto_172457 ?auto_172459 ) ) ( not ( = ?auto_172457 ?auto_172460 ) ) ( not ( = ?auto_172457 ?auto_172461 ) ) ( not ( = ?auto_172457 ?auto_172462 ) ) ( not ( = ?auto_172457 ?auto_172463 ) ) ( not ( = ?auto_172458 ?auto_172459 ) ) ( not ( = ?auto_172458 ?auto_172460 ) ) ( not ( = ?auto_172458 ?auto_172461 ) ) ( not ( = ?auto_172458 ?auto_172462 ) ) ( not ( = ?auto_172458 ?auto_172463 ) ) ( not ( = ?auto_172459 ?auto_172460 ) ) ( not ( = ?auto_172459 ?auto_172461 ) ) ( not ( = ?auto_172459 ?auto_172462 ) ) ( not ( = ?auto_172459 ?auto_172463 ) ) ( not ( = ?auto_172460 ?auto_172461 ) ) ( not ( = ?auto_172460 ?auto_172462 ) ) ( not ( = ?auto_172460 ?auto_172463 ) ) ( not ( = ?auto_172461 ?auto_172462 ) ) ( not ( = ?auto_172461 ?auto_172463 ) ) ( not ( = ?auto_172462 ?auto_172463 ) ) ( not ( = ?auto_172457 ?auto_172465 ) ) ( not ( = ?auto_172458 ?auto_172465 ) ) ( not ( = ?auto_172459 ?auto_172465 ) ) ( not ( = ?auto_172460 ?auto_172465 ) ) ( not ( = ?auto_172461 ?auto_172465 ) ) ( not ( = ?auto_172462 ?auto_172465 ) ) ( not ( = ?auto_172463 ?auto_172465 ) ) ( ON ?auto_172465 ?auto_172464 ) ( not ( = ?auto_172457 ?auto_172464 ) ) ( not ( = ?auto_172458 ?auto_172464 ) ) ( not ( = ?auto_172459 ?auto_172464 ) ) ( not ( = ?auto_172460 ?auto_172464 ) ) ( not ( = ?auto_172461 ?auto_172464 ) ) ( not ( = ?auto_172462 ?auto_172464 ) ) ( not ( = ?auto_172463 ?auto_172464 ) ) ( not ( = ?auto_172465 ?auto_172464 ) ) ( ON ?auto_172463 ?auto_172465 ) ( ON ?auto_172462 ?auto_172463 ) ( ON-TABLE ?auto_172464 ) ( ON ?auto_172461 ?auto_172462 ) ( ON ?auto_172460 ?auto_172461 ) ( ON ?auto_172459 ?auto_172460 ) ( ON ?auto_172458 ?auto_172459 ) ( CLEAR ?auto_172458 ) ( HOLDING ?auto_172457 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172457 )
      ( MAKE-6PILE ?auto_172457 ?auto_172458 ?auto_172459 ?auto_172460 ?auto_172461 ?auto_172462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172466 - BLOCK
      ?auto_172467 - BLOCK
      ?auto_172468 - BLOCK
      ?auto_172469 - BLOCK
      ?auto_172470 - BLOCK
      ?auto_172471 - BLOCK
    )
    :vars
    (
      ?auto_172474 - BLOCK
      ?auto_172473 - BLOCK
      ?auto_172472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172466 ?auto_172467 ) ) ( not ( = ?auto_172466 ?auto_172468 ) ) ( not ( = ?auto_172466 ?auto_172469 ) ) ( not ( = ?auto_172466 ?auto_172470 ) ) ( not ( = ?auto_172466 ?auto_172471 ) ) ( not ( = ?auto_172466 ?auto_172474 ) ) ( not ( = ?auto_172467 ?auto_172468 ) ) ( not ( = ?auto_172467 ?auto_172469 ) ) ( not ( = ?auto_172467 ?auto_172470 ) ) ( not ( = ?auto_172467 ?auto_172471 ) ) ( not ( = ?auto_172467 ?auto_172474 ) ) ( not ( = ?auto_172468 ?auto_172469 ) ) ( not ( = ?auto_172468 ?auto_172470 ) ) ( not ( = ?auto_172468 ?auto_172471 ) ) ( not ( = ?auto_172468 ?auto_172474 ) ) ( not ( = ?auto_172469 ?auto_172470 ) ) ( not ( = ?auto_172469 ?auto_172471 ) ) ( not ( = ?auto_172469 ?auto_172474 ) ) ( not ( = ?auto_172470 ?auto_172471 ) ) ( not ( = ?auto_172470 ?auto_172474 ) ) ( not ( = ?auto_172471 ?auto_172474 ) ) ( not ( = ?auto_172466 ?auto_172473 ) ) ( not ( = ?auto_172467 ?auto_172473 ) ) ( not ( = ?auto_172468 ?auto_172473 ) ) ( not ( = ?auto_172469 ?auto_172473 ) ) ( not ( = ?auto_172470 ?auto_172473 ) ) ( not ( = ?auto_172471 ?auto_172473 ) ) ( not ( = ?auto_172474 ?auto_172473 ) ) ( ON ?auto_172473 ?auto_172472 ) ( not ( = ?auto_172466 ?auto_172472 ) ) ( not ( = ?auto_172467 ?auto_172472 ) ) ( not ( = ?auto_172468 ?auto_172472 ) ) ( not ( = ?auto_172469 ?auto_172472 ) ) ( not ( = ?auto_172470 ?auto_172472 ) ) ( not ( = ?auto_172471 ?auto_172472 ) ) ( not ( = ?auto_172474 ?auto_172472 ) ) ( not ( = ?auto_172473 ?auto_172472 ) ) ( ON ?auto_172474 ?auto_172473 ) ( ON ?auto_172471 ?auto_172474 ) ( ON-TABLE ?auto_172472 ) ( ON ?auto_172470 ?auto_172471 ) ( ON ?auto_172469 ?auto_172470 ) ( ON ?auto_172468 ?auto_172469 ) ( ON ?auto_172467 ?auto_172468 ) ( ON ?auto_172466 ?auto_172467 ) ( CLEAR ?auto_172466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172472 ?auto_172473 ?auto_172474 ?auto_172471 ?auto_172470 ?auto_172469 ?auto_172468 ?auto_172467 )
      ( MAKE-6PILE ?auto_172466 ?auto_172467 ?auto_172468 ?auto_172469 ?auto_172470 ?auto_172471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172477 - BLOCK
      ?auto_172478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_172478 ) ( CLEAR ?auto_172477 ) ( ON-TABLE ?auto_172477 ) ( not ( = ?auto_172477 ?auto_172478 ) ) )
    :subtasks
    ( ( !STACK ?auto_172478 ?auto_172477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172479 - BLOCK
      ?auto_172480 - BLOCK
    )
    :vars
    (
      ?auto_172481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172479 ) ( ON-TABLE ?auto_172479 ) ( not ( = ?auto_172479 ?auto_172480 ) ) ( ON ?auto_172480 ?auto_172481 ) ( CLEAR ?auto_172480 ) ( HAND-EMPTY ) ( not ( = ?auto_172479 ?auto_172481 ) ) ( not ( = ?auto_172480 ?auto_172481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172480 ?auto_172481 )
      ( MAKE-2PILE ?auto_172479 ?auto_172480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172482 - BLOCK
      ?auto_172483 - BLOCK
    )
    :vars
    (
      ?auto_172484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172482 ?auto_172483 ) ) ( ON ?auto_172483 ?auto_172484 ) ( CLEAR ?auto_172483 ) ( not ( = ?auto_172482 ?auto_172484 ) ) ( not ( = ?auto_172483 ?auto_172484 ) ) ( HOLDING ?auto_172482 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172482 )
      ( MAKE-2PILE ?auto_172482 ?auto_172483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172485 - BLOCK
      ?auto_172486 - BLOCK
    )
    :vars
    (
      ?auto_172487 - BLOCK
      ?auto_172490 - BLOCK
      ?auto_172488 - BLOCK
      ?auto_172492 - BLOCK
      ?auto_172491 - BLOCK
      ?auto_172489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172485 ?auto_172486 ) ) ( ON ?auto_172486 ?auto_172487 ) ( not ( = ?auto_172485 ?auto_172487 ) ) ( not ( = ?auto_172486 ?auto_172487 ) ) ( ON ?auto_172485 ?auto_172486 ) ( CLEAR ?auto_172485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172490 ) ( ON ?auto_172488 ?auto_172490 ) ( ON ?auto_172492 ?auto_172488 ) ( ON ?auto_172491 ?auto_172492 ) ( ON ?auto_172489 ?auto_172491 ) ( ON ?auto_172487 ?auto_172489 ) ( not ( = ?auto_172490 ?auto_172488 ) ) ( not ( = ?auto_172490 ?auto_172492 ) ) ( not ( = ?auto_172490 ?auto_172491 ) ) ( not ( = ?auto_172490 ?auto_172489 ) ) ( not ( = ?auto_172490 ?auto_172487 ) ) ( not ( = ?auto_172490 ?auto_172486 ) ) ( not ( = ?auto_172490 ?auto_172485 ) ) ( not ( = ?auto_172488 ?auto_172492 ) ) ( not ( = ?auto_172488 ?auto_172491 ) ) ( not ( = ?auto_172488 ?auto_172489 ) ) ( not ( = ?auto_172488 ?auto_172487 ) ) ( not ( = ?auto_172488 ?auto_172486 ) ) ( not ( = ?auto_172488 ?auto_172485 ) ) ( not ( = ?auto_172492 ?auto_172491 ) ) ( not ( = ?auto_172492 ?auto_172489 ) ) ( not ( = ?auto_172492 ?auto_172487 ) ) ( not ( = ?auto_172492 ?auto_172486 ) ) ( not ( = ?auto_172492 ?auto_172485 ) ) ( not ( = ?auto_172491 ?auto_172489 ) ) ( not ( = ?auto_172491 ?auto_172487 ) ) ( not ( = ?auto_172491 ?auto_172486 ) ) ( not ( = ?auto_172491 ?auto_172485 ) ) ( not ( = ?auto_172489 ?auto_172487 ) ) ( not ( = ?auto_172489 ?auto_172486 ) ) ( not ( = ?auto_172489 ?auto_172485 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172490 ?auto_172488 ?auto_172492 ?auto_172491 ?auto_172489 ?auto_172487 ?auto_172486 )
      ( MAKE-2PILE ?auto_172485 ?auto_172486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172493 - BLOCK
      ?auto_172494 - BLOCK
    )
    :vars
    (
      ?auto_172499 - BLOCK
      ?auto_172496 - BLOCK
      ?auto_172495 - BLOCK
      ?auto_172497 - BLOCK
      ?auto_172498 - BLOCK
      ?auto_172500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172493 ?auto_172494 ) ) ( ON ?auto_172494 ?auto_172499 ) ( not ( = ?auto_172493 ?auto_172499 ) ) ( not ( = ?auto_172494 ?auto_172499 ) ) ( ON-TABLE ?auto_172496 ) ( ON ?auto_172495 ?auto_172496 ) ( ON ?auto_172497 ?auto_172495 ) ( ON ?auto_172498 ?auto_172497 ) ( ON ?auto_172500 ?auto_172498 ) ( ON ?auto_172499 ?auto_172500 ) ( not ( = ?auto_172496 ?auto_172495 ) ) ( not ( = ?auto_172496 ?auto_172497 ) ) ( not ( = ?auto_172496 ?auto_172498 ) ) ( not ( = ?auto_172496 ?auto_172500 ) ) ( not ( = ?auto_172496 ?auto_172499 ) ) ( not ( = ?auto_172496 ?auto_172494 ) ) ( not ( = ?auto_172496 ?auto_172493 ) ) ( not ( = ?auto_172495 ?auto_172497 ) ) ( not ( = ?auto_172495 ?auto_172498 ) ) ( not ( = ?auto_172495 ?auto_172500 ) ) ( not ( = ?auto_172495 ?auto_172499 ) ) ( not ( = ?auto_172495 ?auto_172494 ) ) ( not ( = ?auto_172495 ?auto_172493 ) ) ( not ( = ?auto_172497 ?auto_172498 ) ) ( not ( = ?auto_172497 ?auto_172500 ) ) ( not ( = ?auto_172497 ?auto_172499 ) ) ( not ( = ?auto_172497 ?auto_172494 ) ) ( not ( = ?auto_172497 ?auto_172493 ) ) ( not ( = ?auto_172498 ?auto_172500 ) ) ( not ( = ?auto_172498 ?auto_172499 ) ) ( not ( = ?auto_172498 ?auto_172494 ) ) ( not ( = ?auto_172498 ?auto_172493 ) ) ( not ( = ?auto_172500 ?auto_172499 ) ) ( not ( = ?auto_172500 ?auto_172494 ) ) ( not ( = ?auto_172500 ?auto_172493 ) ) ( HOLDING ?auto_172493 ) ( CLEAR ?auto_172494 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172496 ?auto_172495 ?auto_172497 ?auto_172498 ?auto_172500 ?auto_172499 ?auto_172494 ?auto_172493 )
      ( MAKE-2PILE ?auto_172493 ?auto_172494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172501 - BLOCK
      ?auto_172502 - BLOCK
    )
    :vars
    (
      ?auto_172505 - BLOCK
      ?auto_172507 - BLOCK
      ?auto_172506 - BLOCK
      ?auto_172504 - BLOCK
      ?auto_172503 - BLOCK
      ?auto_172508 - BLOCK
      ?auto_172509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172501 ?auto_172502 ) ) ( ON ?auto_172502 ?auto_172505 ) ( not ( = ?auto_172501 ?auto_172505 ) ) ( not ( = ?auto_172502 ?auto_172505 ) ) ( ON-TABLE ?auto_172507 ) ( ON ?auto_172506 ?auto_172507 ) ( ON ?auto_172504 ?auto_172506 ) ( ON ?auto_172503 ?auto_172504 ) ( ON ?auto_172508 ?auto_172503 ) ( ON ?auto_172505 ?auto_172508 ) ( not ( = ?auto_172507 ?auto_172506 ) ) ( not ( = ?auto_172507 ?auto_172504 ) ) ( not ( = ?auto_172507 ?auto_172503 ) ) ( not ( = ?auto_172507 ?auto_172508 ) ) ( not ( = ?auto_172507 ?auto_172505 ) ) ( not ( = ?auto_172507 ?auto_172502 ) ) ( not ( = ?auto_172507 ?auto_172501 ) ) ( not ( = ?auto_172506 ?auto_172504 ) ) ( not ( = ?auto_172506 ?auto_172503 ) ) ( not ( = ?auto_172506 ?auto_172508 ) ) ( not ( = ?auto_172506 ?auto_172505 ) ) ( not ( = ?auto_172506 ?auto_172502 ) ) ( not ( = ?auto_172506 ?auto_172501 ) ) ( not ( = ?auto_172504 ?auto_172503 ) ) ( not ( = ?auto_172504 ?auto_172508 ) ) ( not ( = ?auto_172504 ?auto_172505 ) ) ( not ( = ?auto_172504 ?auto_172502 ) ) ( not ( = ?auto_172504 ?auto_172501 ) ) ( not ( = ?auto_172503 ?auto_172508 ) ) ( not ( = ?auto_172503 ?auto_172505 ) ) ( not ( = ?auto_172503 ?auto_172502 ) ) ( not ( = ?auto_172503 ?auto_172501 ) ) ( not ( = ?auto_172508 ?auto_172505 ) ) ( not ( = ?auto_172508 ?auto_172502 ) ) ( not ( = ?auto_172508 ?auto_172501 ) ) ( CLEAR ?auto_172502 ) ( ON ?auto_172501 ?auto_172509 ) ( CLEAR ?auto_172501 ) ( HAND-EMPTY ) ( not ( = ?auto_172501 ?auto_172509 ) ) ( not ( = ?auto_172502 ?auto_172509 ) ) ( not ( = ?auto_172505 ?auto_172509 ) ) ( not ( = ?auto_172507 ?auto_172509 ) ) ( not ( = ?auto_172506 ?auto_172509 ) ) ( not ( = ?auto_172504 ?auto_172509 ) ) ( not ( = ?auto_172503 ?auto_172509 ) ) ( not ( = ?auto_172508 ?auto_172509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172501 ?auto_172509 )
      ( MAKE-2PILE ?auto_172501 ?auto_172502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172510 - BLOCK
      ?auto_172511 - BLOCK
    )
    :vars
    (
      ?auto_172514 - BLOCK
      ?auto_172518 - BLOCK
      ?auto_172516 - BLOCK
      ?auto_172513 - BLOCK
      ?auto_172515 - BLOCK
      ?auto_172517 - BLOCK
      ?auto_172512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172510 ?auto_172511 ) ) ( not ( = ?auto_172510 ?auto_172514 ) ) ( not ( = ?auto_172511 ?auto_172514 ) ) ( ON-TABLE ?auto_172518 ) ( ON ?auto_172516 ?auto_172518 ) ( ON ?auto_172513 ?auto_172516 ) ( ON ?auto_172515 ?auto_172513 ) ( ON ?auto_172517 ?auto_172515 ) ( ON ?auto_172514 ?auto_172517 ) ( not ( = ?auto_172518 ?auto_172516 ) ) ( not ( = ?auto_172518 ?auto_172513 ) ) ( not ( = ?auto_172518 ?auto_172515 ) ) ( not ( = ?auto_172518 ?auto_172517 ) ) ( not ( = ?auto_172518 ?auto_172514 ) ) ( not ( = ?auto_172518 ?auto_172511 ) ) ( not ( = ?auto_172518 ?auto_172510 ) ) ( not ( = ?auto_172516 ?auto_172513 ) ) ( not ( = ?auto_172516 ?auto_172515 ) ) ( not ( = ?auto_172516 ?auto_172517 ) ) ( not ( = ?auto_172516 ?auto_172514 ) ) ( not ( = ?auto_172516 ?auto_172511 ) ) ( not ( = ?auto_172516 ?auto_172510 ) ) ( not ( = ?auto_172513 ?auto_172515 ) ) ( not ( = ?auto_172513 ?auto_172517 ) ) ( not ( = ?auto_172513 ?auto_172514 ) ) ( not ( = ?auto_172513 ?auto_172511 ) ) ( not ( = ?auto_172513 ?auto_172510 ) ) ( not ( = ?auto_172515 ?auto_172517 ) ) ( not ( = ?auto_172515 ?auto_172514 ) ) ( not ( = ?auto_172515 ?auto_172511 ) ) ( not ( = ?auto_172515 ?auto_172510 ) ) ( not ( = ?auto_172517 ?auto_172514 ) ) ( not ( = ?auto_172517 ?auto_172511 ) ) ( not ( = ?auto_172517 ?auto_172510 ) ) ( ON ?auto_172510 ?auto_172512 ) ( CLEAR ?auto_172510 ) ( not ( = ?auto_172510 ?auto_172512 ) ) ( not ( = ?auto_172511 ?auto_172512 ) ) ( not ( = ?auto_172514 ?auto_172512 ) ) ( not ( = ?auto_172518 ?auto_172512 ) ) ( not ( = ?auto_172516 ?auto_172512 ) ) ( not ( = ?auto_172513 ?auto_172512 ) ) ( not ( = ?auto_172515 ?auto_172512 ) ) ( not ( = ?auto_172517 ?auto_172512 ) ) ( HOLDING ?auto_172511 ) ( CLEAR ?auto_172514 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172518 ?auto_172516 ?auto_172513 ?auto_172515 ?auto_172517 ?auto_172514 ?auto_172511 )
      ( MAKE-2PILE ?auto_172510 ?auto_172511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172519 - BLOCK
      ?auto_172520 - BLOCK
    )
    :vars
    (
      ?auto_172522 - BLOCK
      ?auto_172524 - BLOCK
      ?auto_172521 - BLOCK
      ?auto_172523 - BLOCK
      ?auto_172526 - BLOCK
      ?auto_172525 - BLOCK
      ?auto_172527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172519 ?auto_172520 ) ) ( not ( = ?auto_172519 ?auto_172522 ) ) ( not ( = ?auto_172520 ?auto_172522 ) ) ( ON-TABLE ?auto_172524 ) ( ON ?auto_172521 ?auto_172524 ) ( ON ?auto_172523 ?auto_172521 ) ( ON ?auto_172526 ?auto_172523 ) ( ON ?auto_172525 ?auto_172526 ) ( ON ?auto_172522 ?auto_172525 ) ( not ( = ?auto_172524 ?auto_172521 ) ) ( not ( = ?auto_172524 ?auto_172523 ) ) ( not ( = ?auto_172524 ?auto_172526 ) ) ( not ( = ?auto_172524 ?auto_172525 ) ) ( not ( = ?auto_172524 ?auto_172522 ) ) ( not ( = ?auto_172524 ?auto_172520 ) ) ( not ( = ?auto_172524 ?auto_172519 ) ) ( not ( = ?auto_172521 ?auto_172523 ) ) ( not ( = ?auto_172521 ?auto_172526 ) ) ( not ( = ?auto_172521 ?auto_172525 ) ) ( not ( = ?auto_172521 ?auto_172522 ) ) ( not ( = ?auto_172521 ?auto_172520 ) ) ( not ( = ?auto_172521 ?auto_172519 ) ) ( not ( = ?auto_172523 ?auto_172526 ) ) ( not ( = ?auto_172523 ?auto_172525 ) ) ( not ( = ?auto_172523 ?auto_172522 ) ) ( not ( = ?auto_172523 ?auto_172520 ) ) ( not ( = ?auto_172523 ?auto_172519 ) ) ( not ( = ?auto_172526 ?auto_172525 ) ) ( not ( = ?auto_172526 ?auto_172522 ) ) ( not ( = ?auto_172526 ?auto_172520 ) ) ( not ( = ?auto_172526 ?auto_172519 ) ) ( not ( = ?auto_172525 ?auto_172522 ) ) ( not ( = ?auto_172525 ?auto_172520 ) ) ( not ( = ?auto_172525 ?auto_172519 ) ) ( ON ?auto_172519 ?auto_172527 ) ( not ( = ?auto_172519 ?auto_172527 ) ) ( not ( = ?auto_172520 ?auto_172527 ) ) ( not ( = ?auto_172522 ?auto_172527 ) ) ( not ( = ?auto_172524 ?auto_172527 ) ) ( not ( = ?auto_172521 ?auto_172527 ) ) ( not ( = ?auto_172523 ?auto_172527 ) ) ( not ( = ?auto_172526 ?auto_172527 ) ) ( not ( = ?auto_172525 ?auto_172527 ) ) ( CLEAR ?auto_172522 ) ( ON ?auto_172520 ?auto_172519 ) ( CLEAR ?auto_172520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172527 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172527 ?auto_172519 )
      ( MAKE-2PILE ?auto_172519 ?auto_172520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172528 - BLOCK
      ?auto_172529 - BLOCK
    )
    :vars
    (
      ?auto_172530 - BLOCK
      ?auto_172534 - BLOCK
      ?auto_172532 - BLOCK
      ?auto_172533 - BLOCK
      ?auto_172535 - BLOCK
      ?auto_172536 - BLOCK
      ?auto_172531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172528 ?auto_172529 ) ) ( not ( = ?auto_172528 ?auto_172530 ) ) ( not ( = ?auto_172529 ?auto_172530 ) ) ( ON-TABLE ?auto_172534 ) ( ON ?auto_172532 ?auto_172534 ) ( ON ?auto_172533 ?auto_172532 ) ( ON ?auto_172535 ?auto_172533 ) ( ON ?auto_172536 ?auto_172535 ) ( not ( = ?auto_172534 ?auto_172532 ) ) ( not ( = ?auto_172534 ?auto_172533 ) ) ( not ( = ?auto_172534 ?auto_172535 ) ) ( not ( = ?auto_172534 ?auto_172536 ) ) ( not ( = ?auto_172534 ?auto_172530 ) ) ( not ( = ?auto_172534 ?auto_172529 ) ) ( not ( = ?auto_172534 ?auto_172528 ) ) ( not ( = ?auto_172532 ?auto_172533 ) ) ( not ( = ?auto_172532 ?auto_172535 ) ) ( not ( = ?auto_172532 ?auto_172536 ) ) ( not ( = ?auto_172532 ?auto_172530 ) ) ( not ( = ?auto_172532 ?auto_172529 ) ) ( not ( = ?auto_172532 ?auto_172528 ) ) ( not ( = ?auto_172533 ?auto_172535 ) ) ( not ( = ?auto_172533 ?auto_172536 ) ) ( not ( = ?auto_172533 ?auto_172530 ) ) ( not ( = ?auto_172533 ?auto_172529 ) ) ( not ( = ?auto_172533 ?auto_172528 ) ) ( not ( = ?auto_172535 ?auto_172536 ) ) ( not ( = ?auto_172535 ?auto_172530 ) ) ( not ( = ?auto_172535 ?auto_172529 ) ) ( not ( = ?auto_172535 ?auto_172528 ) ) ( not ( = ?auto_172536 ?auto_172530 ) ) ( not ( = ?auto_172536 ?auto_172529 ) ) ( not ( = ?auto_172536 ?auto_172528 ) ) ( ON ?auto_172528 ?auto_172531 ) ( not ( = ?auto_172528 ?auto_172531 ) ) ( not ( = ?auto_172529 ?auto_172531 ) ) ( not ( = ?auto_172530 ?auto_172531 ) ) ( not ( = ?auto_172534 ?auto_172531 ) ) ( not ( = ?auto_172532 ?auto_172531 ) ) ( not ( = ?auto_172533 ?auto_172531 ) ) ( not ( = ?auto_172535 ?auto_172531 ) ) ( not ( = ?auto_172536 ?auto_172531 ) ) ( ON ?auto_172529 ?auto_172528 ) ( CLEAR ?auto_172529 ) ( ON-TABLE ?auto_172531 ) ( HOLDING ?auto_172530 ) ( CLEAR ?auto_172536 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172534 ?auto_172532 ?auto_172533 ?auto_172535 ?auto_172536 ?auto_172530 )
      ( MAKE-2PILE ?auto_172528 ?auto_172529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172537 - BLOCK
      ?auto_172538 - BLOCK
    )
    :vars
    (
      ?auto_172542 - BLOCK
      ?auto_172544 - BLOCK
      ?auto_172543 - BLOCK
      ?auto_172545 - BLOCK
      ?auto_172539 - BLOCK
      ?auto_172541 - BLOCK
      ?auto_172540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172537 ?auto_172538 ) ) ( not ( = ?auto_172537 ?auto_172542 ) ) ( not ( = ?auto_172538 ?auto_172542 ) ) ( ON-TABLE ?auto_172544 ) ( ON ?auto_172543 ?auto_172544 ) ( ON ?auto_172545 ?auto_172543 ) ( ON ?auto_172539 ?auto_172545 ) ( ON ?auto_172541 ?auto_172539 ) ( not ( = ?auto_172544 ?auto_172543 ) ) ( not ( = ?auto_172544 ?auto_172545 ) ) ( not ( = ?auto_172544 ?auto_172539 ) ) ( not ( = ?auto_172544 ?auto_172541 ) ) ( not ( = ?auto_172544 ?auto_172542 ) ) ( not ( = ?auto_172544 ?auto_172538 ) ) ( not ( = ?auto_172544 ?auto_172537 ) ) ( not ( = ?auto_172543 ?auto_172545 ) ) ( not ( = ?auto_172543 ?auto_172539 ) ) ( not ( = ?auto_172543 ?auto_172541 ) ) ( not ( = ?auto_172543 ?auto_172542 ) ) ( not ( = ?auto_172543 ?auto_172538 ) ) ( not ( = ?auto_172543 ?auto_172537 ) ) ( not ( = ?auto_172545 ?auto_172539 ) ) ( not ( = ?auto_172545 ?auto_172541 ) ) ( not ( = ?auto_172545 ?auto_172542 ) ) ( not ( = ?auto_172545 ?auto_172538 ) ) ( not ( = ?auto_172545 ?auto_172537 ) ) ( not ( = ?auto_172539 ?auto_172541 ) ) ( not ( = ?auto_172539 ?auto_172542 ) ) ( not ( = ?auto_172539 ?auto_172538 ) ) ( not ( = ?auto_172539 ?auto_172537 ) ) ( not ( = ?auto_172541 ?auto_172542 ) ) ( not ( = ?auto_172541 ?auto_172538 ) ) ( not ( = ?auto_172541 ?auto_172537 ) ) ( ON ?auto_172537 ?auto_172540 ) ( not ( = ?auto_172537 ?auto_172540 ) ) ( not ( = ?auto_172538 ?auto_172540 ) ) ( not ( = ?auto_172542 ?auto_172540 ) ) ( not ( = ?auto_172544 ?auto_172540 ) ) ( not ( = ?auto_172543 ?auto_172540 ) ) ( not ( = ?auto_172545 ?auto_172540 ) ) ( not ( = ?auto_172539 ?auto_172540 ) ) ( not ( = ?auto_172541 ?auto_172540 ) ) ( ON ?auto_172538 ?auto_172537 ) ( ON-TABLE ?auto_172540 ) ( CLEAR ?auto_172541 ) ( ON ?auto_172542 ?auto_172538 ) ( CLEAR ?auto_172542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172540 ?auto_172537 ?auto_172538 )
      ( MAKE-2PILE ?auto_172537 ?auto_172538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172546 - BLOCK
      ?auto_172547 - BLOCK
    )
    :vars
    (
      ?auto_172553 - BLOCK
      ?auto_172549 - BLOCK
      ?auto_172551 - BLOCK
      ?auto_172550 - BLOCK
      ?auto_172554 - BLOCK
      ?auto_172548 - BLOCK
      ?auto_172552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172546 ?auto_172547 ) ) ( not ( = ?auto_172546 ?auto_172553 ) ) ( not ( = ?auto_172547 ?auto_172553 ) ) ( ON-TABLE ?auto_172549 ) ( ON ?auto_172551 ?auto_172549 ) ( ON ?auto_172550 ?auto_172551 ) ( ON ?auto_172554 ?auto_172550 ) ( not ( = ?auto_172549 ?auto_172551 ) ) ( not ( = ?auto_172549 ?auto_172550 ) ) ( not ( = ?auto_172549 ?auto_172554 ) ) ( not ( = ?auto_172549 ?auto_172548 ) ) ( not ( = ?auto_172549 ?auto_172553 ) ) ( not ( = ?auto_172549 ?auto_172547 ) ) ( not ( = ?auto_172549 ?auto_172546 ) ) ( not ( = ?auto_172551 ?auto_172550 ) ) ( not ( = ?auto_172551 ?auto_172554 ) ) ( not ( = ?auto_172551 ?auto_172548 ) ) ( not ( = ?auto_172551 ?auto_172553 ) ) ( not ( = ?auto_172551 ?auto_172547 ) ) ( not ( = ?auto_172551 ?auto_172546 ) ) ( not ( = ?auto_172550 ?auto_172554 ) ) ( not ( = ?auto_172550 ?auto_172548 ) ) ( not ( = ?auto_172550 ?auto_172553 ) ) ( not ( = ?auto_172550 ?auto_172547 ) ) ( not ( = ?auto_172550 ?auto_172546 ) ) ( not ( = ?auto_172554 ?auto_172548 ) ) ( not ( = ?auto_172554 ?auto_172553 ) ) ( not ( = ?auto_172554 ?auto_172547 ) ) ( not ( = ?auto_172554 ?auto_172546 ) ) ( not ( = ?auto_172548 ?auto_172553 ) ) ( not ( = ?auto_172548 ?auto_172547 ) ) ( not ( = ?auto_172548 ?auto_172546 ) ) ( ON ?auto_172546 ?auto_172552 ) ( not ( = ?auto_172546 ?auto_172552 ) ) ( not ( = ?auto_172547 ?auto_172552 ) ) ( not ( = ?auto_172553 ?auto_172552 ) ) ( not ( = ?auto_172549 ?auto_172552 ) ) ( not ( = ?auto_172551 ?auto_172552 ) ) ( not ( = ?auto_172550 ?auto_172552 ) ) ( not ( = ?auto_172554 ?auto_172552 ) ) ( not ( = ?auto_172548 ?auto_172552 ) ) ( ON ?auto_172547 ?auto_172546 ) ( ON-TABLE ?auto_172552 ) ( ON ?auto_172553 ?auto_172547 ) ( CLEAR ?auto_172553 ) ( HOLDING ?auto_172548 ) ( CLEAR ?auto_172554 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172549 ?auto_172551 ?auto_172550 ?auto_172554 ?auto_172548 )
      ( MAKE-2PILE ?auto_172546 ?auto_172547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172555 - BLOCK
      ?auto_172556 - BLOCK
    )
    :vars
    (
      ?auto_172557 - BLOCK
      ?auto_172560 - BLOCK
      ?auto_172558 - BLOCK
      ?auto_172562 - BLOCK
      ?auto_172563 - BLOCK
      ?auto_172561 - BLOCK
      ?auto_172559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172555 ?auto_172556 ) ) ( not ( = ?auto_172555 ?auto_172557 ) ) ( not ( = ?auto_172556 ?auto_172557 ) ) ( ON-TABLE ?auto_172560 ) ( ON ?auto_172558 ?auto_172560 ) ( ON ?auto_172562 ?auto_172558 ) ( ON ?auto_172563 ?auto_172562 ) ( not ( = ?auto_172560 ?auto_172558 ) ) ( not ( = ?auto_172560 ?auto_172562 ) ) ( not ( = ?auto_172560 ?auto_172563 ) ) ( not ( = ?auto_172560 ?auto_172561 ) ) ( not ( = ?auto_172560 ?auto_172557 ) ) ( not ( = ?auto_172560 ?auto_172556 ) ) ( not ( = ?auto_172560 ?auto_172555 ) ) ( not ( = ?auto_172558 ?auto_172562 ) ) ( not ( = ?auto_172558 ?auto_172563 ) ) ( not ( = ?auto_172558 ?auto_172561 ) ) ( not ( = ?auto_172558 ?auto_172557 ) ) ( not ( = ?auto_172558 ?auto_172556 ) ) ( not ( = ?auto_172558 ?auto_172555 ) ) ( not ( = ?auto_172562 ?auto_172563 ) ) ( not ( = ?auto_172562 ?auto_172561 ) ) ( not ( = ?auto_172562 ?auto_172557 ) ) ( not ( = ?auto_172562 ?auto_172556 ) ) ( not ( = ?auto_172562 ?auto_172555 ) ) ( not ( = ?auto_172563 ?auto_172561 ) ) ( not ( = ?auto_172563 ?auto_172557 ) ) ( not ( = ?auto_172563 ?auto_172556 ) ) ( not ( = ?auto_172563 ?auto_172555 ) ) ( not ( = ?auto_172561 ?auto_172557 ) ) ( not ( = ?auto_172561 ?auto_172556 ) ) ( not ( = ?auto_172561 ?auto_172555 ) ) ( ON ?auto_172555 ?auto_172559 ) ( not ( = ?auto_172555 ?auto_172559 ) ) ( not ( = ?auto_172556 ?auto_172559 ) ) ( not ( = ?auto_172557 ?auto_172559 ) ) ( not ( = ?auto_172560 ?auto_172559 ) ) ( not ( = ?auto_172558 ?auto_172559 ) ) ( not ( = ?auto_172562 ?auto_172559 ) ) ( not ( = ?auto_172563 ?auto_172559 ) ) ( not ( = ?auto_172561 ?auto_172559 ) ) ( ON ?auto_172556 ?auto_172555 ) ( ON-TABLE ?auto_172559 ) ( ON ?auto_172557 ?auto_172556 ) ( CLEAR ?auto_172563 ) ( ON ?auto_172561 ?auto_172557 ) ( CLEAR ?auto_172561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172559 ?auto_172555 ?auto_172556 ?auto_172557 )
      ( MAKE-2PILE ?auto_172555 ?auto_172556 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172564 - BLOCK
      ?auto_172565 - BLOCK
    )
    :vars
    (
      ?auto_172572 - BLOCK
      ?auto_172568 - BLOCK
      ?auto_172567 - BLOCK
      ?auto_172570 - BLOCK
      ?auto_172569 - BLOCK
      ?auto_172566 - BLOCK
      ?auto_172571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172564 ?auto_172565 ) ) ( not ( = ?auto_172564 ?auto_172572 ) ) ( not ( = ?auto_172565 ?auto_172572 ) ) ( ON-TABLE ?auto_172568 ) ( ON ?auto_172567 ?auto_172568 ) ( ON ?auto_172570 ?auto_172567 ) ( not ( = ?auto_172568 ?auto_172567 ) ) ( not ( = ?auto_172568 ?auto_172570 ) ) ( not ( = ?auto_172568 ?auto_172569 ) ) ( not ( = ?auto_172568 ?auto_172566 ) ) ( not ( = ?auto_172568 ?auto_172572 ) ) ( not ( = ?auto_172568 ?auto_172565 ) ) ( not ( = ?auto_172568 ?auto_172564 ) ) ( not ( = ?auto_172567 ?auto_172570 ) ) ( not ( = ?auto_172567 ?auto_172569 ) ) ( not ( = ?auto_172567 ?auto_172566 ) ) ( not ( = ?auto_172567 ?auto_172572 ) ) ( not ( = ?auto_172567 ?auto_172565 ) ) ( not ( = ?auto_172567 ?auto_172564 ) ) ( not ( = ?auto_172570 ?auto_172569 ) ) ( not ( = ?auto_172570 ?auto_172566 ) ) ( not ( = ?auto_172570 ?auto_172572 ) ) ( not ( = ?auto_172570 ?auto_172565 ) ) ( not ( = ?auto_172570 ?auto_172564 ) ) ( not ( = ?auto_172569 ?auto_172566 ) ) ( not ( = ?auto_172569 ?auto_172572 ) ) ( not ( = ?auto_172569 ?auto_172565 ) ) ( not ( = ?auto_172569 ?auto_172564 ) ) ( not ( = ?auto_172566 ?auto_172572 ) ) ( not ( = ?auto_172566 ?auto_172565 ) ) ( not ( = ?auto_172566 ?auto_172564 ) ) ( ON ?auto_172564 ?auto_172571 ) ( not ( = ?auto_172564 ?auto_172571 ) ) ( not ( = ?auto_172565 ?auto_172571 ) ) ( not ( = ?auto_172572 ?auto_172571 ) ) ( not ( = ?auto_172568 ?auto_172571 ) ) ( not ( = ?auto_172567 ?auto_172571 ) ) ( not ( = ?auto_172570 ?auto_172571 ) ) ( not ( = ?auto_172569 ?auto_172571 ) ) ( not ( = ?auto_172566 ?auto_172571 ) ) ( ON ?auto_172565 ?auto_172564 ) ( ON-TABLE ?auto_172571 ) ( ON ?auto_172572 ?auto_172565 ) ( ON ?auto_172566 ?auto_172572 ) ( CLEAR ?auto_172566 ) ( HOLDING ?auto_172569 ) ( CLEAR ?auto_172570 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172568 ?auto_172567 ?auto_172570 ?auto_172569 )
      ( MAKE-2PILE ?auto_172564 ?auto_172565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172573 - BLOCK
      ?auto_172574 - BLOCK
    )
    :vars
    (
      ?auto_172580 - BLOCK
      ?auto_172579 - BLOCK
      ?auto_172578 - BLOCK
      ?auto_172576 - BLOCK
      ?auto_172581 - BLOCK
      ?auto_172575 - BLOCK
      ?auto_172577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172573 ?auto_172574 ) ) ( not ( = ?auto_172573 ?auto_172580 ) ) ( not ( = ?auto_172574 ?auto_172580 ) ) ( ON-TABLE ?auto_172579 ) ( ON ?auto_172578 ?auto_172579 ) ( ON ?auto_172576 ?auto_172578 ) ( not ( = ?auto_172579 ?auto_172578 ) ) ( not ( = ?auto_172579 ?auto_172576 ) ) ( not ( = ?auto_172579 ?auto_172581 ) ) ( not ( = ?auto_172579 ?auto_172575 ) ) ( not ( = ?auto_172579 ?auto_172580 ) ) ( not ( = ?auto_172579 ?auto_172574 ) ) ( not ( = ?auto_172579 ?auto_172573 ) ) ( not ( = ?auto_172578 ?auto_172576 ) ) ( not ( = ?auto_172578 ?auto_172581 ) ) ( not ( = ?auto_172578 ?auto_172575 ) ) ( not ( = ?auto_172578 ?auto_172580 ) ) ( not ( = ?auto_172578 ?auto_172574 ) ) ( not ( = ?auto_172578 ?auto_172573 ) ) ( not ( = ?auto_172576 ?auto_172581 ) ) ( not ( = ?auto_172576 ?auto_172575 ) ) ( not ( = ?auto_172576 ?auto_172580 ) ) ( not ( = ?auto_172576 ?auto_172574 ) ) ( not ( = ?auto_172576 ?auto_172573 ) ) ( not ( = ?auto_172581 ?auto_172575 ) ) ( not ( = ?auto_172581 ?auto_172580 ) ) ( not ( = ?auto_172581 ?auto_172574 ) ) ( not ( = ?auto_172581 ?auto_172573 ) ) ( not ( = ?auto_172575 ?auto_172580 ) ) ( not ( = ?auto_172575 ?auto_172574 ) ) ( not ( = ?auto_172575 ?auto_172573 ) ) ( ON ?auto_172573 ?auto_172577 ) ( not ( = ?auto_172573 ?auto_172577 ) ) ( not ( = ?auto_172574 ?auto_172577 ) ) ( not ( = ?auto_172580 ?auto_172577 ) ) ( not ( = ?auto_172579 ?auto_172577 ) ) ( not ( = ?auto_172578 ?auto_172577 ) ) ( not ( = ?auto_172576 ?auto_172577 ) ) ( not ( = ?auto_172581 ?auto_172577 ) ) ( not ( = ?auto_172575 ?auto_172577 ) ) ( ON ?auto_172574 ?auto_172573 ) ( ON-TABLE ?auto_172577 ) ( ON ?auto_172580 ?auto_172574 ) ( ON ?auto_172575 ?auto_172580 ) ( CLEAR ?auto_172576 ) ( ON ?auto_172581 ?auto_172575 ) ( CLEAR ?auto_172581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172577 ?auto_172573 ?auto_172574 ?auto_172580 ?auto_172575 )
      ( MAKE-2PILE ?auto_172573 ?auto_172574 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172582 - BLOCK
      ?auto_172583 - BLOCK
    )
    :vars
    (
      ?auto_172587 - BLOCK
      ?auto_172586 - BLOCK
      ?auto_172590 - BLOCK
      ?auto_172589 - BLOCK
      ?auto_172585 - BLOCK
      ?auto_172588 - BLOCK
      ?auto_172584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172582 ?auto_172583 ) ) ( not ( = ?auto_172582 ?auto_172587 ) ) ( not ( = ?auto_172583 ?auto_172587 ) ) ( ON-TABLE ?auto_172586 ) ( ON ?auto_172590 ?auto_172586 ) ( not ( = ?auto_172586 ?auto_172590 ) ) ( not ( = ?auto_172586 ?auto_172589 ) ) ( not ( = ?auto_172586 ?auto_172585 ) ) ( not ( = ?auto_172586 ?auto_172588 ) ) ( not ( = ?auto_172586 ?auto_172587 ) ) ( not ( = ?auto_172586 ?auto_172583 ) ) ( not ( = ?auto_172586 ?auto_172582 ) ) ( not ( = ?auto_172590 ?auto_172589 ) ) ( not ( = ?auto_172590 ?auto_172585 ) ) ( not ( = ?auto_172590 ?auto_172588 ) ) ( not ( = ?auto_172590 ?auto_172587 ) ) ( not ( = ?auto_172590 ?auto_172583 ) ) ( not ( = ?auto_172590 ?auto_172582 ) ) ( not ( = ?auto_172589 ?auto_172585 ) ) ( not ( = ?auto_172589 ?auto_172588 ) ) ( not ( = ?auto_172589 ?auto_172587 ) ) ( not ( = ?auto_172589 ?auto_172583 ) ) ( not ( = ?auto_172589 ?auto_172582 ) ) ( not ( = ?auto_172585 ?auto_172588 ) ) ( not ( = ?auto_172585 ?auto_172587 ) ) ( not ( = ?auto_172585 ?auto_172583 ) ) ( not ( = ?auto_172585 ?auto_172582 ) ) ( not ( = ?auto_172588 ?auto_172587 ) ) ( not ( = ?auto_172588 ?auto_172583 ) ) ( not ( = ?auto_172588 ?auto_172582 ) ) ( ON ?auto_172582 ?auto_172584 ) ( not ( = ?auto_172582 ?auto_172584 ) ) ( not ( = ?auto_172583 ?auto_172584 ) ) ( not ( = ?auto_172587 ?auto_172584 ) ) ( not ( = ?auto_172586 ?auto_172584 ) ) ( not ( = ?auto_172590 ?auto_172584 ) ) ( not ( = ?auto_172589 ?auto_172584 ) ) ( not ( = ?auto_172585 ?auto_172584 ) ) ( not ( = ?auto_172588 ?auto_172584 ) ) ( ON ?auto_172583 ?auto_172582 ) ( ON-TABLE ?auto_172584 ) ( ON ?auto_172587 ?auto_172583 ) ( ON ?auto_172588 ?auto_172587 ) ( ON ?auto_172585 ?auto_172588 ) ( CLEAR ?auto_172585 ) ( HOLDING ?auto_172589 ) ( CLEAR ?auto_172590 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172586 ?auto_172590 ?auto_172589 )
      ( MAKE-2PILE ?auto_172582 ?auto_172583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172591 - BLOCK
      ?auto_172592 - BLOCK
    )
    :vars
    (
      ?auto_172596 - BLOCK
      ?auto_172594 - BLOCK
      ?auto_172593 - BLOCK
      ?auto_172598 - BLOCK
      ?auto_172599 - BLOCK
      ?auto_172595 - BLOCK
      ?auto_172597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172591 ?auto_172592 ) ) ( not ( = ?auto_172591 ?auto_172596 ) ) ( not ( = ?auto_172592 ?auto_172596 ) ) ( ON-TABLE ?auto_172594 ) ( ON ?auto_172593 ?auto_172594 ) ( not ( = ?auto_172594 ?auto_172593 ) ) ( not ( = ?auto_172594 ?auto_172598 ) ) ( not ( = ?auto_172594 ?auto_172599 ) ) ( not ( = ?auto_172594 ?auto_172595 ) ) ( not ( = ?auto_172594 ?auto_172596 ) ) ( not ( = ?auto_172594 ?auto_172592 ) ) ( not ( = ?auto_172594 ?auto_172591 ) ) ( not ( = ?auto_172593 ?auto_172598 ) ) ( not ( = ?auto_172593 ?auto_172599 ) ) ( not ( = ?auto_172593 ?auto_172595 ) ) ( not ( = ?auto_172593 ?auto_172596 ) ) ( not ( = ?auto_172593 ?auto_172592 ) ) ( not ( = ?auto_172593 ?auto_172591 ) ) ( not ( = ?auto_172598 ?auto_172599 ) ) ( not ( = ?auto_172598 ?auto_172595 ) ) ( not ( = ?auto_172598 ?auto_172596 ) ) ( not ( = ?auto_172598 ?auto_172592 ) ) ( not ( = ?auto_172598 ?auto_172591 ) ) ( not ( = ?auto_172599 ?auto_172595 ) ) ( not ( = ?auto_172599 ?auto_172596 ) ) ( not ( = ?auto_172599 ?auto_172592 ) ) ( not ( = ?auto_172599 ?auto_172591 ) ) ( not ( = ?auto_172595 ?auto_172596 ) ) ( not ( = ?auto_172595 ?auto_172592 ) ) ( not ( = ?auto_172595 ?auto_172591 ) ) ( ON ?auto_172591 ?auto_172597 ) ( not ( = ?auto_172591 ?auto_172597 ) ) ( not ( = ?auto_172592 ?auto_172597 ) ) ( not ( = ?auto_172596 ?auto_172597 ) ) ( not ( = ?auto_172594 ?auto_172597 ) ) ( not ( = ?auto_172593 ?auto_172597 ) ) ( not ( = ?auto_172598 ?auto_172597 ) ) ( not ( = ?auto_172599 ?auto_172597 ) ) ( not ( = ?auto_172595 ?auto_172597 ) ) ( ON ?auto_172592 ?auto_172591 ) ( ON-TABLE ?auto_172597 ) ( ON ?auto_172596 ?auto_172592 ) ( ON ?auto_172595 ?auto_172596 ) ( ON ?auto_172599 ?auto_172595 ) ( CLEAR ?auto_172593 ) ( ON ?auto_172598 ?auto_172599 ) ( CLEAR ?auto_172598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172597 ?auto_172591 ?auto_172592 ?auto_172596 ?auto_172595 ?auto_172599 )
      ( MAKE-2PILE ?auto_172591 ?auto_172592 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172600 - BLOCK
      ?auto_172601 - BLOCK
    )
    :vars
    (
      ?auto_172603 - BLOCK
      ?auto_172605 - BLOCK
      ?auto_172608 - BLOCK
      ?auto_172602 - BLOCK
      ?auto_172607 - BLOCK
      ?auto_172606 - BLOCK
      ?auto_172604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172600 ?auto_172601 ) ) ( not ( = ?auto_172600 ?auto_172603 ) ) ( not ( = ?auto_172601 ?auto_172603 ) ) ( ON-TABLE ?auto_172605 ) ( not ( = ?auto_172605 ?auto_172608 ) ) ( not ( = ?auto_172605 ?auto_172602 ) ) ( not ( = ?auto_172605 ?auto_172607 ) ) ( not ( = ?auto_172605 ?auto_172606 ) ) ( not ( = ?auto_172605 ?auto_172603 ) ) ( not ( = ?auto_172605 ?auto_172601 ) ) ( not ( = ?auto_172605 ?auto_172600 ) ) ( not ( = ?auto_172608 ?auto_172602 ) ) ( not ( = ?auto_172608 ?auto_172607 ) ) ( not ( = ?auto_172608 ?auto_172606 ) ) ( not ( = ?auto_172608 ?auto_172603 ) ) ( not ( = ?auto_172608 ?auto_172601 ) ) ( not ( = ?auto_172608 ?auto_172600 ) ) ( not ( = ?auto_172602 ?auto_172607 ) ) ( not ( = ?auto_172602 ?auto_172606 ) ) ( not ( = ?auto_172602 ?auto_172603 ) ) ( not ( = ?auto_172602 ?auto_172601 ) ) ( not ( = ?auto_172602 ?auto_172600 ) ) ( not ( = ?auto_172607 ?auto_172606 ) ) ( not ( = ?auto_172607 ?auto_172603 ) ) ( not ( = ?auto_172607 ?auto_172601 ) ) ( not ( = ?auto_172607 ?auto_172600 ) ) ( not ( = ?auto_172606 ?auto_172603 ) ) ( not ( = ?auto_172606 ?auto_172601 ) ) ( not ( = ?auto_172606 ?auto_172600 ) ) ( ON ?auto_172600 ?auto_172604 ) ( not ( = ?auto_172600 ?auto_172604 ) ) ( not ( = ?auto_172601 ?auto_172604 ) ) ( not ( = ?auto_172603 ?auto_172604 ) ) ( not ( = ?auto_172605 ?auto_172604 ) ) ( not ( = ?auto_172608 ?auto_172604 ) ) ( not ( = ?auto_172602 ?auto_172604 ) ) ( not ( = ?auto_172607 ?auto_172604 ) ) ( not ( = ?auto_172606 ?auto_172604 ) ) ( ON ?auto_172601 ?auto_172600 ) ( ON-TABLE ?auto_172604 ) ( ON ?auto_172603 ?auto_172601 ) ( ON ?auto_172606 ?auto_172603 ) ( ON ?auto_172607 ?auto_172606 ) ( ON ?auto_172602 ?auto_172607 ) ( CLEAR ?auto_172602 ) ( HOLDING ?auto_172608 ) ( CLEAR ?auto_172605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172605 ?auto_172608 )
      ( MAKE-2PILE ?auto_172600 ?auto_172601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172609 - BLOCK
      ?auto_172610 - BLOCK
    )
    :vars
    (
      ?auto_172611 - BLOCK
      ?auto_172612 - BLOCK
      ?auto_172613 - BLOCK
      ?auto_172616 - BLOCK
      ?auto_172615 - BLOCK
      ?auto_172614 - BLOCK
      ?auto_172617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172609 ?auto_172610 ) ) ( not ( = ?auto_172609 ?auto_172611 ) ) ( not ( = ?auto_172610 ?auto_172611 ) ) ( ON-TABLE ?auto_172612 ) ( not ( = ?auto_172612 ?auto_172613 ) ) ( not ( = ?auto_172612 ?auto_172616 ) ) ( not ( = ?auto_172612 ?auto_172615 ) ) ( not ( = ?auto_172612 ?auto_172614 ) ) ( not ( = ?auto_172612 ?auto_172611 ) ) ( not ( = ?auto_172612 ?auto_172610 ) ) ( not ( = ?auto_172612 ?auto_172609 ) ) ( not ( = ?auto_172613 ?auto_172616 ) ) ( not ( = ?auto_172613 ?auto_172615 ) ) ( not ( = ?auto_172613 ?auto_172614 ) ) ( not ( = ?auto_172613 ?auto_172611 ) ) ( not ( = ?auto_172613 ?auto_172610 ) ) ( not ( = ?auto_172613 ?auto_172609 ) ) ( not ( = ?auto_172616 ?auto_172615 ) ) ( not ( = ?auto_172616 ?auto_172614 ) ) ( not ( = ?auto_172616 ?auto_172611 ) ) ( not ( = ?auto_172616 ?auto_172610 ) ) ( not ( = ?auto_172616 ?auto_172609 ) ) ( not ( = ?auto_172615 ?auto_172614 ) ) ( not ( = ?auto_172615 ?auto_172611 ) ) ( not ( = ?auto_172615 ?auto_172610 ) ) ( not ( = ?auto_172615 ?auto_172609 ) ) ( not ( = ?auto_172614 ?auto_172611 ) ) ( not ( = ?auto_172614 ?auto_172610 ) ) ( not ( = ?auto_172614 ?auto_172609 ) ) ( ON ?auto_172609 ?auto_172617 ) ( not ( = ?auto_172609 ?auto_172617 ) ) ( not ( = ?auto_172610 ?auto_172617 ) ) ( not ( = ?auto_172611 ?auto_172617 ) ) ( not ( = ?auto_172612 ?auto_172617 ) ) ( not ( = ?auto_172613 ?auto_172617 ) ) ( not ( = ?auto_172616 ?auto_172617 ) ) ( not ( = ?auto_172615 ?auto_172617 ) ) ( not ( = ?auto_172614 ?auto_172617 ) ) ( ON ?auto_172610 ?auto_172609 ) ( ON-TABLE ?auto_172617 ) ( ON ?auto_172611 ?auto_172610 ) ( ON ?auto_172614 ?auto_172611 ) ( ON ?auto_172615 ?auto_172614 ) ( ON ?auto_172616 ?auto_172615 ) ( CLEAR ?auto_172612 ) ( ON ?auto_172613 ?auto_172616 ) ( CLEAR ?auto_172613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172617 ?auto_172609 ?auto_172610 ?auto_172611 ?auto_172614 ?auto_172615 ?auto_172616 )
      ( MAKE-2PILE ?auto_172609 ?auto_172610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172618 - BLOCK
      ?auto_172619 - BLOCK
    )
    :vars
    (
      ?auto_172621 - BLOCK
      ?auto_172625 - BLOCK
      ?auto_172622 - BLOCK
      ?auto_172620 - BLOCK
      ?auto_172624 - BLOCK
      ?auto_172623 - BLOCK
      ?auto_172626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172618 ?auto_172619 ) ) ( not ( = ?auto_172618 ?auto_172621 ) ) ( not ( = ?auto_172619 ?auto_172621 ) ) ( not ( = ?auto_172625 ?auto_172622 ) ) ( not ( = ?auto_172625 ?auto_172620 ) ) ( not ( = ?auto_172625 ?auto_172624 ) ) ( not ( = ?auto_172625 ?auto_172623 ) ) ( not ( = ?auto_172625 ?auto_172621 ) ) ( not ( = ?auto_172625 ?auto_172619 ) ) ( not ( = ?auto_172625 ?auto_172618 ) ) ( not ( = ?auto_172622 ?auto_172620 ) ) ( not ( = ?auto_172622 ?auto_172624 ) ) ( not ( = ?auto_172622 ?auto_172623 ) ) ( not ( = ?auto_172622 ?auto_172621 ) ) ( not ( = ?auto_172622 ?auto_172619 ) ) ( not ( = ?auto_172622 ?auto_172618 ) ) ( not ( = ?auto_172620 ?auto_172624 ) ) ( not ( = ?auto_172620 ?auto_172623 ) ) ( not ( = ?auto_172620 ?auto_172621 ) ) ( not ( = ?auto_172620 ?auto_172619 ) ) ( not ( = ?auto_172620 ?auto_172618 ) ) ( not ( = ?auto_172624 ?auto_172623 ) ) ( not ( = ?auto_172624 ?auto_172621 ) ) ( not ( = ?auto_172624 ?auto_172619 ) ) ( not ( = ?auto_172624 ?auto_172618 ) ) ( not ( = ?auto_172623 ?auto_172621 ) ) ( not ( = ?auto_172623 ?auto_172619 ) ) ( not ( = ?auto_172623 ?auto_172618 ) ) ( ON ?auto_172618 ?auto_172626 ) ( not ( = ?auto_172618 ?auto_172626 ) ) ( not ( = ?auto_172619 ?auto_172626 ) ) ( not ( = ?auto_172621 ?auto_172626 ) ) ( not ( = ?auto_172625 ?auto_172626 ) ) ( not ( = ?auto_172622 ?auto_172626 ) ) ( not ( = ?auto_172620 ?auto_172626 ) ) ( not ( = ?auto_172624 ?auto_172626 ) ) ( not ( = ?auto_172623 ?auto_172626 ) ) ( ON ?auto_172619 ?auto_172618 ) ( ON-TABLE ?auto_172626 ) ( ON ?auto_172621 ?auto_172619 ) ( ON ?auto_172623 ?auto_172621 ) ( ON ?auto_172624 ?auto_172623 ) ( ON ?auto_172620 ?auto_172624 ) ( ON ?auto_172622 ?auto_172620 ) ( CLEAR ?auto_172622 ) ( HOLDING ?auto_172625 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172625 )
      ( MAKE-2PILE ?auto_172618 ?auto_172619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172627 - BLOCK
      ?auto_172628 - BLOCK
    )
    :vars
    (
      ?auto_172633 - BLOCK
      ?auto_172629 - BLOCK
      ?auto_172632 - BLOCK
      ?auto_172635 - BLOCK
      ?auto_172634 - BLOCK
      ?auto_172631 - BLOCK
      ?auto_172630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172627 ?auto_172628 ) ) ( not ( = ?auto_172627 ?auto_172633 ) ) ( not ( = ?auto_172628 ?auto_172633 ) ) ( not ( = ?auto_172629 ?auto_172632 ) ) ( not ( = ?auto_172629 ?auto_172635 ) ) ( not ( = ?auto_172629 ?auto_172634 ) ) ( not ( = ?auto_172629 ?auto_172631 ) ) ( not ( = ?auto_172629 ?auto_172633 ) ) ( not ( = ?auto_172629 ?auto_172628 ) ) ( not ( = ?auto_172629 ?auto_172627 ) ) ( not ( = ?auto_172632 ?auto_172635 ) ) ( not ( = ?auto_172632 ?auto_172634 ) ) ( not ( = ?auto_172632 ?auto_172631 ) ) ( not ( = ?auto_172632 ?auto_172633 ) ) ( not ( = ?auto_172632 ?auto_172628 ) ) ( not ( = ?auto_172632 ?auto_172627 ) ) ( not ( = ?auto_172635 ?auto_172634 ) ) ( not ( = ?auto_172635 ?auto_172631 ) ) ( not ( = ?auto_172635 ?auto_172633 ) ) ( not ( = ?auto_172635 ?auto_172628 ) ) ( not ( = ?auto_172635 ?auto_172627 ) ) ( not ( = ?auto_172634 ?auto_172631 ) ) ( not ( = ?auto_172634 ?auto_172633 ) ) ( not ( = ?auto_172634 ?auto_172628 ) ) ( not ( = ?auto_172634 ?auto_172627 ) ) ( not ( = ?auto_172631 ?auto_172633 ) ) ( not ( = ?auto_172631 ?auto_172628 ) ) ( not ( = ?auto_172631 ?auto_172627 ) ) ( ON ?auto_172627 ?auto_172630 ) ( not ( = ?auto_172627 ?auto_172630 ) ) ( not ( = ?auto_172628 ?auto_172630 ) ) ( not ( = ?auto_172633 ?auto_172630 ) ) ( not ( = ?auto_172629 ?auto_172630 ) ) ( not ( = ?auto_172632 ?auto_172630 ) ) ( not ( = ?auto_172635 ?auto_172630 ) ) ( not ( = ?auto_172634 ?auto_172630 ) ) ( not ( = ?auto_172631 ?auto_172630 ) ) ( ON ?auto_172628 ?auto_172627 ) ( ON-TABLE ?auto_172630 ) ( ON ?auto_172633 ?auto_172628 ) ( ON ?auto_172631 ?auto_172633 ) ( ON ?auto_172634 ?auto_172631 ) ( ON ?auto_172635 ?auto_172634 ) ( ON ?auto_172632 ?auto_172635 ) ( ON ?auto_172629 ?auto_172632 ) ( CLEAR ?auto_172629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172630 ?auto_172627 ?auto_172628 ?auto_172633 ?auto_172631 ?auto_172634 ?auto_172635 ?auto_172632 )
      ( MAKE-2PILE ?auto_172627 ?auto_172628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172641 - BLOCK
      ?auto_172642 - BLOCK
      ?auto_172643 - BLOCK
      ?auto_172644 - BLOCK
      ?auto_172645 - BLOCK
    )
    :vars
    (
      ?auto_172646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172646 ?auto_172645 ) ( CLEAR ?auto_172646 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172641 ) ( ON ?auto_172642 ?auto_172641 ) ( ON ?auto_172643 ?auto_172642 ) ( ON ?auto_172644 ?auto_172643 ) ( ON ?auto_172645 ?auto_172644 ) ( not ( = ?auto_172641 ?auto_172642 ) ) ( not ( = ?auto_172641 ?auto_172643 ) ) ( not ( = ?auto_172641 ?auto_172644 ) ) ( not ( = ?auto_172641 ?auto_172645 ) ) ( not ( = ?auto_172641 ?auto_172646 ) ) ( not ( = ?auto_172642 ?auto_172643 ) ) ( not ( = ?auto_172642 ?auto_172644 ) ) ( not ( = ?auto_172642 ?auto_172645 ) ) ( not ( = ?auto_172642 ?auto_172646 ) ) ( not ( = ?auto_172643 ?auto_172644 ) ) ( not ( = ?auto_172643 ?auto_172645 ) ) ( not ( = ?auto_172643 ?auto_172646 ) ) ( not ( = ?auto_172644 ?auto_172645 ) ) ( not ( = ?auto_172644 ?auto_172646 ) ) ( not ( = ?auto_172645 ?auto_172646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172646 ?auto_172645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172647 - BLOCK
      ?auto_172648 - BLOCK
      ?auto_172649 - BLOCK
      ?auto_172650 - BLOCK
      ?auto_172651 - BLOCK
    )
    :vars
    (
      ?auto_172652 - BLOCK
      ?auto_172653 - BLOCK
      ?auto_172654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172652 ?auto_172651 ) ( CLEAR ?auto_172652 ) ( ON-TABLE ?auto_172647 ) ( ON ?auto_172648 ?auto_172647 ) ( ON ?auto_172649 ?auto_172648 ) ( ON ?auto_172650 ?auto_172649 ) ( ON ?auto_172651 ?auto_172650 ) ( not ( = ?auto_172647 ?auto_172648 ) ) ( not ( = ?auto_172647 ?auto_172649 ) ) ( not ( = ?auto_172647 ?auto_172650 ) ) ( not ( = ?auto_172647 ?auto_172651 ) ) ( not ( = ?auto_172647 ?auto_172652 ) ) ( not ( = ?auto_172648 ?auto_172649 ) ) ( not ( = ?auto_172648 ?auto_172650 ) ) ( not ( = ?auto_172648 ?auto_172651 ) ) ( not ( = ?auto_172648 ?auto_172652 ) ) ( not ( = ?auto_172649 ?auto_172650 ) ) ( not ( = ?auto_172649 ?auto_172651 ) ) ( not ( = ?auto_172649 ?auto_172652 ) ) ( not ( = ?auto_172650 ?auto_172651 ) ) ( not ( = ?auto_172650 ?auto_172652 ) ) ( not ( = ?auto_172651 ?auto_172652 ) ) ( HOLDING ?auto_172653 ) ( CLEAR ?auto_172654 ) ( not ( = ?auto_172647 ?auto_172653 ) ) ( not ( = ?auto_172647 ?auto_172654 ) ) ( not ( = ?auto_172648 ?auto_172653 ) ) ( not ( = ?auto_172648 ?auto_172654 ) ) ( not ( = ?auto_172649 ?auto_172653 ) ) ( not ( = ?auto_172649 ?auto_172654 ) ) ( not ( = ?auto_172650 ?auto_172653 ) ) ( not ( = ?auto_172650 ?auto_172654 ) ) ( not ( = ?auto_172651 ?auto_172653 ) ) ( not ( = ?auto_172651 ?auto_172654 ) ) ( not ( = ?auto_172652 ?auto_172653 ) ) ( not ( = ?auto_172652 ?auto_172654 ) ) ( not ( = ?auto_172653 ?auto_172654 ) ) )
    :subtasks
    ( ( !STACK ?auto_172653 ?auto_172654 )
      ( MAKE-5PILE ?auto_172647 ?auto_172648 ?auto_172649 ?auto_172650 ?auto_172651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172655 - BLOCK
      ?auto_172656 - BLOCK
      ?auto_172657 - BLOCK
      ?auto_172658 - BLOCK
      ?auto_172659 - BLOCK
    )
    :vars
    (
      ?auto_172661 - BLOCK
      ?auto_172662 - BLOCK
      ?auto_172660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172661 ?auto_172659 ) ( ON-TABLE ?auto_172655 ) ( ON ?auto_172656 ?auto_172655 ) ( ON ?auto_172657 ?auto_172656 ) ( ON ?auto_172658 ?auto_172657 ) ( ON ?auto_172659 ?auto_172658 ) ( not ( = ?auto_172655 ?auto_172656 ) ) ( not ( = ?auto_172655 ?auto_172657 ) ) ( not ( = ?auto_172655 ?auto_172658 ) ) ( not ( = ?auto_172655 ?auto_172659 ) ) ( not ( = ?auto_172655 ?auto_172661 ) ) ( not ( = ?auto_172656 ?auto_172657 ) ) ( not ( = ?auto_172656 ?auto_172658 ) ) ( not ( = ?auto_172656 ?auto_172659 ) ) ( not ( = ?auto_172656 ?auto_172661 ) ) ( not ( = ?auto_172657 ?auto_172658 ) ) ( not ( = ?auto_172657 ?auto_172659 ) ) ( not ( = ?auto_172657 ?auto_172661 ) ) ( not ( = ?auto_172658 ?auto_172659 ) ) ( not ( = ?auto_172658 ?auto_172661 ) ) ( not ( = ?auto_172659 ?auto_172661 ) ) ( CLEAR ?auto_172662 ) ( not ( = ?auto_172655 ?auto_172660 ) ) ( not ( = ?auto_172655 ?auto_172662 ) ) ( not ( = ?auto_172656 ?auto_172660 ) ) ( not ( = ?auto_172656 ?auto_172662 ) ) ( not ( = ?auto_172657 ?auto_172660 ) ) ( not ( = ?auto_172657 ?auto_172662 ) ) ( not ( = ?auto_172658 ?auto_172660 ) ) ( not ( = ?auto_172658 ?auto_172662 ) ) ( not ( = ?auto_172659 ?auto_172660 ) ) ( not ( = ?auto_172659 ?auto_172662 ) ) ( not ( = ?auto_172661 ?auto_172660 ) ) ( not ( = ?auto_172661 ?auto_172662 ) ) ( not ( = ?auto_172660 ?auto_172662 ) ) ( ON ?auto_172660 ?auto_172661 ) ( CLEAR ?auto_172660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172655 ?auto_172656 ?auto_172657 ?auto_172658 ?auto_172659 ?auto_172661 )
      ( MAKE-5PILE ?auto_172655 ?auto_172656 ?auto_172657 ?auto_172658 ?auto_172659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172663 - BLOCK
      ?auto_172664 - BLOCK
      ?auto_172665 - BLOCK
      ?auto_172666 - BLOCK
      ?auto_172667 - BLOCK
    )
    :vars
    (
      ?auto_172668 - BLOCK
      ?auto_172670 - BLOCK
      ?auto_172669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172668 ?auto_172667 ) ( ON-TABLE ?auto_172663 ) ( ON ?auto_172664 ?auto_172663 ) ( ON ?auto_172665 ?auto_172664 ) ( ON ?auto_172666 ?auto_172665 ) ( ON ?auto_172667 ?auto_172666 ) ( not ( = ?auto_172663 ?auto_172664 ) ) ( not ( = ?auto_172663 ?auto_172665 ) ) ( not ( = ?auto_172663 ?auto_172666 ) ) ( not ( = ?auto_172663 ?auto_172667 ) ) ( not ( = ?auto_172663 ?auto_172668 ) ) ( not ( = ?auto_172664 ?auto_172665 ) ) ( not ( = ?auto_172664 ?auto_172666 ) ) ( not ( = ?auto_172664 ?auto_172667 ) ) ( not ( = ?auto_172664 ?auto_172668 ) ) ( not ( = ?auto_172665 ?auto_172666 ) ) ( not ( = ?auto_172665 ?auto_172667 ) ) ( not ( = ?auto_172665 ?auto_172668 ) ) ( not ( = ?auto_172666 ?auto_172667 ) ) ( not ( = ?auto_172666 ?auto_172668 ) ) ( not ( = ?auto_172667 ?auto_172668 ) ) ( not ( = ?auto_172663 ?auto_172670 ) ) ( not ( = ?auto_172663 ?auto_172669 ) ) ( not ( = ?auto_172664 ?auto_172670 ) ) ( not ( = ?auto_172664 ?auto_172669 ) ) ( not ( = ?auto_172665 ?auto_172670 ) ) ( not ( = ?auto_172665 ?auto_172669 ) ) ( not ( = ?auto_172666 ?auto_172670 ) ) ( not ( = ?auto_172666 ?auto_172669 ) ) ( not ( = ?auto_172667 ?auto_172670 ) ) ( not ( = ?auto_172667 ?auto_172669 ) ) ( not ( = ?auto_172668 ?auto_172670 ) ) ( not ( = ?auto_172668 ?auto_172669 ) ) ( not ( = ?auto_172670 ?auto_172669 ) ) ( ON ?auto_172670 ?auto_172668 ) ( CLEAR ?auto_172670 ) ( HOLDING ?auto_172669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172669 )
      ( MAKE-5PILE ?auto_172663 ?auto_172664 ?auto_172665 ?auto_172666 ?auto_172667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172671 - BLOCK
      ?auto_172672 - BLOCK
      ?auto_172673 - BLOCK
      ?auto_172674 - BLOCK
      ?auto_172675 - BLOCK
    )
    :vars
    (
      ?auto_172677 - BLOCK
      ?auto_172678 - BLOCK
      ?auto_172676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172677 ?auto_172675 ) ( ON-TABLE ?auto_172671 ) ( ON ?auto_172672 ?auto_172671 ) ( ON ?auto_172673 ?auto_172672 ) ( ON ?auto_172674 ?auto_172673 ) ( ON ?auto_172675 ?auto_172674 ) ( not ( = ?auto_172671 ?auto_172672 ) ) ( not ( = ?auto_172671 ?auto_172673 ) ) ( not ( = ?auto_172671 ?auto_172674 ) ) ( not ( = ?auto_172671 ?auto_172675 ) ) ( not ( = ?auto_172671 ?auto_172677 ) ) ( not ( = ?auto_172672 ?auto_172673 ) ) ( not ( = ?auto_172672 ?auto_172674 ) ) ( not ( = ?auto_172672 ?auto_172675 ) ) ( not ( = ?auto_172672 ?auto_172677 ) ) ( not ( = ?auto_172673 ?auto_172674 ) ) ( not ( = ?auto_172673 ?auto_172675 ) ) ( not ( = ?auto_172673 ?auto_172677 ) ) ( not ( = ?auto_172674 ?auto_172675 ) ) ( not ( = ?auto_172674 ?auto_172677 ) ) ( not ( = ?auto_172675 ?auto_172677 ) ) ( not ( = ?auto_172671 ?auto_172678 ) ) ( not ( = ?auto_172671 ?auto_172676 ) ) ( not ( = ?auto_172672 ?auto_172678 ) ) ( not ( = ?auto_172672 ?auto_172676 ) ) ( not ( = ?auto_172673 ?auto_172678 ) ) ( not ( = ?auto_172673 ?auto_172676 ) ) ( not ( = ?auto_172674 ?auto_172678 ) ) ( not ( = ?auto_172674 ?auto_172676 ) ) ( not ( = ?auto_172675 ?auto_172678 ) ) ( not ( = ?auto_172675 ?auto_172676 ) ) ( not ( = ?auto_172677 ?auto_172678 ) ) ( not ( = ?auto_172677 ?auto_172676 ) ) ( not ( = ?auto_172678 ?auto_172676 ) ) ( ON ?auto_172678 ?auto_172677 ) ( ON ?auto_172676 ?auto_172678 ) ( CLEAR ?auto_172676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172671 ?auto_172672 ?auto_172673 ?auto_172674 ?auto_172675 ?auto_172677 ?auto_172678 )
      ( MAKE-5PILE ?auto_172671 ?auto_172672 ?auto_172673 ?auto_172674 ?auto_172675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172679 - BLOCK
      ?auto_172680 - BLOCK
      ?auto_172681 - BLOCK
      ?auto_172682 - BLOCK
      ?auto_172683 - BLOCK
    )
    :vars
    (
      ?auto_172684 - BLOCK
      ?auto_172686 - BLOCK
      ?auto_172685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172684 ?auto_172683 ) ( ON-TABLE ?auto_172679 ) ( ON ?auto_172680 ?auto_172679 ) ( ON ?auto_172681 ?auto_172680 ) ( ON ?auto_172682 ?auto_172681 ) ( ON ?auto_172683 ?auto_172682 ) ( not ( = ?auto_172679 ?auto_172680 ) ) ( not ( = ?auto_172679 ?auto_172681 ) ) ( not ( = ?auto_172679 ?auto_172682 ) ) ( not ( = ?auto_172679 ?auto_172683 ) ) ( not ( = ?auto_172679 ?auto_172684 ) ) ( not ( = ?auto_172680 ?auto_172681 ) ) ( not ( = ?auto_172680 ?auto_172682 ) ) ( not ( = ?auto_172680 ?auto_172683 ) ) ( not ( = ?auto_172680 ?auto_172684 ) ) ( not ( = ?auto_172681 ?auto_172682 ) ) ( not ( = ?auto_172681 ?auto_172683 ) ) ( not ( = ?auto_172681 ?auto_172684 ) ) ( not ( = ?auto_172682 ?auto_172683 ) ) ( not ( = ?auto_172682 ?auto_172684 ) ) ( not ( = ?auto_172683 ?auto_172684 ) ) ( not ( = ?auto_172679 ?auto_172686 ) ) ( not ( = ?auto_172679 ?auto_172685 ) ) ( not ( = ?auto_172680 ?auto_172686 ) ) ( not ( = ?auto_172680 ?auto_172685 ) ) ( not ( = ?auto_172681 ?auto_172686 ) ) ( not ( = ?auto_172681 ?auto_172685 ) ) ( not ( = ?auto_172682 ?auto_172686 ) ) ( not ( = ?auto_172682 ?auto_172685 ) ) ( not ( = ?auto_172683 ?auto_172686 ) ) ( not ( = ?auto_172683 ?auto_172685 ) ) ( not ( = ?auto_172684 ?auto_172686 ) ) ( not ( = ?auto_172684 ?auto_172685 ) ) ( not ( = ?auto_172686 ?auto_172685 ) ) ( ON ?auto_172686 ?auto_172684 ) ( HOLDING ?auto_172685 ) ( CLEAR ?auto_172686 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172679 ?auto_172680 ?auto_172681 ?auto_172682 ?auto_172683 ?auto_172684 ?auto_172686 ?auto_172685 )
      ( MAKE-5PILE ?auto_172679 ?auto_172680 ?auto_172681 ?auto_172682 ?auto_172683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172687 - BLOCK
      ?auto_172688 - BLOCK
      ?auto_172689 - BLOCK
      ?auto_172690 - BLOCK
      ?auto_172691 - BLOCK
    )
    :vars
    (
      ?auto_172693 - BLOCK
      ?auto_172694 - BLOCK
      ?auto_172692 - BLOCK
      ?auto_172695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172693 ?auto_172691 ) ( ON-TABLE ?auto_172687 ) ( ON ?auto_172688 ?auto_172687 ) ( ON ?auto_172689 ?auto_172688 ) ( ON ?auto_172690 ?auto_172689 ) ( ON ?auto_172691 ?auto_172690 ) ( not ( = ?auto_172687 ?auto_172688 ) ) ( not ( = ?auto_172687 ?auto_172689 ) ) ( not ( = ?auto_172687 ?auto_172690 ) ) ( not ( = ?auto_172687 ?auto_172691 ) ) ( not ( = ?auto_172687 ?auto_172693 ) ) ( not ( = ?auto_172688 ?auto_172689 ) ) ( not ( = ?auto_172688 ?auto_172690 ) ) ( not ( = ?auto_172688 ?auto_172691 ) ) ( not ( = ?auto_172688 ?auto_172693 ) ) ( not ( = ?auto_172689 ?auto_172690 ) ) ( not ( = ?auto_172689 ?auto_172691 ) ) ( not ( = ?auto_172689 ?auto_172693 ) ) ( not ( = ?auto_172690 ?auto_172691 ) ) ( not ( = ?auto_172690 ?auto_172693 ) ) ( not ( = ?auto_172691 ?auto_172693 ) ) ( not ( = ?auto_172687 ?auto_172694 ) ) ( not ( = ?auto_172687 ?auto_172692 ) ) ( not ( = ?auto_172688 ?auto_172694 ) ) ( not ( = ?auto_172688 ?auto_172692 ) ) ( not ( = ?auto_172689 ?auto_172694 ) ) ( not ( = ?auto_172689 ?auto_172692 ) ) ( not ( = ?auto_172690 ?auto_172694 ) ) ( not ( = ?auto_172690 ?auto_172692 ) ) ( not ( = ?auto_172691 ?auto_172694 ) ) ( not ( = ?auto_172691 ?auto_172692 ) ) ( not ( = ?auto_172693 ?auto_172694 ) ) ( not ( = ?auto_172693 ?auto_172692 ) ) ( not ( = ?auto_172694 ?auto_172692 ) ) ( ON ?auto_172694 ?auto_172693 ) ( CLEAR ?auto_172694 ) ( ON ?auto_172692 ?auto_172695 ) ( CLEAR ?auto_172692 ) ( HAND-EMPTY ) ( not ( = ?auto_172687 ?auto_172695 ) ) ( not ( = ?auto_172688 ?auto_172695 ) ) ( not ( = ?auto_172689 ?auto_172695 ) ) ( not ( = ?auto_172690 ?auto_172695 ) ) ( not ( = ?auto_172691 ?auto_172695 ) ) ( not ( = ?auto_172693 ?auto_172695 ) ) ( not ( = ?auto_172694 ?auto_172695 ) ) ( not ( = ?auto_172692 ?auto_172695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172692 ?auto_172695 )
      ( MAKE-5PILE ?auto_172687 ?auto_172688 ?auto_172689 ?auto_172690 ?auto_172691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172696 - BLOCK
      ?auto_172697 - BLOCK
      ?auto_172698 - BLOCK
      ?auto_172699 - BLOCK
      ?auto_172700 - BLOCK
    )
    :vars
    (
      ?auto_172703 - BLOCK
      ?auto_172704 - BLOCK
      ?auto_172702 - BLOCK
      ?auto_172701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172703 ?auto_172700 ) ( ON-TABLE ?auto_172696 ) ( ON ?auto_172697 ?auto_172696 ) ( ON ?auto_172698 ?auto_172697 ) ( ON ?auto_172699 ?auto_172698 ) ( ON ?auto_172700 ?auto_172699 ) ( not ( = ?auto_172696 ?auto_172697 ) ) ( not ( = ?auto_172696 ?auto_172698 ) ) ( not ( = ?auto_172696 ?auto_172699 ) ) ( not ( = ?auto_172696 ?auto_172700 ) ) ( not ( = ?auto_172696 ?auto_172703 ) ) ( not ( = ?auto_172697 ?auto_172698 ) ) ( not ( = ?auto_172697 ?auto_172699 ) ) ( not ( = ?auto_172697 ?auto_172700 ) ) ( not ( = ?auto_172697 ?auto_172703 ) ) ( not ( = ?auto_172698 ?auto_172699 ) ) ( not ( = ?auto_172698 ?auto_172700 ) ) ( not ( = ?auto_172698 ?auto_172703 ) ) ( not ( = ?auto_172699 ?auto_172700 ) ) ( not ( = ?auto_172699 ?auto_172703 ) ) ( not ( = ?auto_172700 ?auto_172703 ) ) ( not ( = ?auto_172696 ?auto_172704 ) ) ( not ( = ?auto_172696 ?auto_172702 ) ) ( not ( = ?auto_172697 ?auto_172704 ) ) ( not ( = ?auto_172697 ?auto_172702 ) ) ( not ( = ?auto_172698 ?auto_172704 ) ) ( not ( = ?auto_172698 ?auto_172702 ) ) ( not ( = ?auto_172699 ?auto_172704 ) ) ( not ( = ?auto_172699 ?auto_172702 ) ) ( not ( = ?auto_172700 ?auto_172704 ) ) ( not ( = ?auto_172700 ?auto_172702 ) ) ( not ( = ?auto_172703 ?auto_172704 ) ) ( not ( = ?auto_172703 ?auto_172702 ) ) ( not ( = ?auto_172704 ?auto_172702 ) ) ( ON ?auto_172702 ?auto_172701 ) ( CLEAR ?auto_172702 ) ( not ( = ?auto_172696 ?auto_172701 ) ) ( not ( = ?auto_172697 ?auto_172701 ) ) ( not ( = ?auto_172698 ?auto_172701 ) ) ( not ( = ?auto_172699 ?auto_172701 ) ) ( not ( = ?auto_172700 ?auto_172701 ) ) ( not ( = ?auto_172703 ?auto_172701 ) ) ( not ( = ?auto_172704 ?auto_172701 ) ) ( not ( = ?auto_172702 ?auto_172701 ) ) ( HOLDING ?auto_172704 ) ( CLEAR ?auto_172703 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172696 ?auto_172697 ?auto_172698 ?auto_172699 ?auto_172700 ?auto_172703 ?auto_172704 )
      ( MAKE-5PILE ?auto_172696 ?auto_172697 ?auto_172698 ?auto_172699 ?auto_172700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172705 - BLOCK
      ?auto_172706 - BLOCK
      ?auto_172707 - BLOCK
      ?auto_172708 - BLOCK
      ?auto_172709 - BLOCK
    )
    :vars
    (
      ?auto_172713 - BLOCK
      ?auto_172710 - BLOCK
      ?auto_172712 - BLOCK
      ?auto_172711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172713 ?auto_172709 ) ( ON-TABLE ?auto_172705 ) ( ON ?auto_172706 ?auto_172705 ) ( ON ?auto_172707 ?auto_172706 ) ( ON ?auto_172708 ?auto_172707 ) ( ON ?auto_172709 ?auto_172708 ) ( not ( = ?auto_172705 ?auto_172706 ) ) ( not ( = ?auto_172705 ?auto_172707 ) ) ( not ( = ?auto_172705 ?auto_172708 ) ) ( not ( = ?auto_172705 ?auto_172709 ) ) ( not ( = ?auto_172705 ?auto_172713 ) ) ( not ( = ?auto_172706 ?auto_172707 ) ) ( not ( = ?auto_172706 ?auto_172708 ) ) ( not ( = ?auto_172706 ?auto_172709 ) ) ( not ( = ?auto_172706 ?auto_172713 ) ) ( not ( = ?auto_172707 ?auto_172708 ) ) ( not ( = ?auto_172707 ?auto_172709 ) ) ( not ( = ?auto_172707 ?auto_172713 ) ) ( not ( = ?auto_172708 ?auto_172709 ) ) ( not ( = ?auto_172708 ?auto_172713 ) ) ( not ( = ?auto_172709 ?auto_172713 ) ) ( not ( = ?auto_172705 ?auto_172710 ) ) ( not ( = ?auto_172705 ?auto_172712 ) ) ( not ( = ?auto_172706 ?auto_172710 ) ) ( not ( = ?auto_172706 ?auto_172712 ) ) ( not ( = ?auto_172707 ?auto_172710 ) ) ( not ( = ?auto_172707 ?auto_172712 ) ) ( not ( = ?auto_172708 ?auto_172710 ) ) ( not ( = ?auto_172708 ?auto_172712 ) ) ( not ( = ?auto_172709 ?auto_172710 ) ) ( not ( = ?auto_172709 ?auto_172712 ) ) ( not ( = ?auto_172713 ?auto_172710 ) ) ( not ( = ?auto_172713 ?auto_172712 ) ) ( not ( = ?auto_172710 ?auto_172712 ) ) ( ON ?auto_172712 ?auto_172711 ) ( not ( = ?auto_172705 ?auto_172711 ) ) ( not ( = ?auto_172706 ?auto_172711 ) ) ( not ( = ?auto_172707 ?auto_172711 ) ) ( not ( = ?auto_172708 ?auto_172711 ) ) ( not ( = ?auto_172709 ?auto_172711 ) ) ( not ( = ?auto_172713 ?auto_172711 ) ) ( not ( = ?auto_172710 ?auto_172711 ) ) ( not ( = ?auto_172712 ?auto_172711 ) ) ( CLEAR ?auto_172713 ) ( ON ?auto_172710 ?auto_172712 ) ( CLEAR ?auto_172710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172711 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172711 ?auto_172712 )
      ( MAKE-5PILE ?auto_172705 ?auto_172706 ?auto_172707 ?auto_172708 ?auto_172709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172732 - BLOCK
      ?auto_172733 - BLOCK
      ?auto_172734 - BLOCK
      ?auto_172735 - BLOCK
      ?auto_172736 - BLOCK
    )
    :vars
    (
      ?auto_172740 - BLOCK
      ?auto_172737 - BLOCK
      ?auto_172738 - BLOCK
      ?auto_172739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172732 ) ( ON ?auto_172733 ?auto_172732 ) ( ON ?auto_172734 ?auto_172733 ) ( ON ?auto_172735 ?auto_172734 ) ( not ( = ?auto_172732 ?auto_172733 ) ) ( not ( = ?auto_172732 ?auto_172734 ) ) ( not ( = ?auto_172732 ?auto_172735 ) ) ( not ( = ?auto_172732 ?auto_172736 ) ) ( not ( = ?auto_172732 ?auto_172740 ) ) ( not ( = ?auto_172733 ?auto_172734 ) ) ( not ( = ?auto_172733 ?auto_172735 ) ) ( not ( = ?auto_172733 ?auto_172736 ) ) ( not ( = ?auto_172733 ?auto_172740 ) ) ( not ( = ?auto_172734 ?auto_172735 ) ) ( not ( = ?auto_172734 ?auto_172736 ) ) ( not ( = ?auto_172734 ?auto_172740 ) ) ( not ( = ?auto_172735 ?auto_172736 ) ) ( not ( = ?auto_172735 ?auto_172740 ) ) ( not ( = ?auto_172736 ?auto_172740 ) ) ( not ( = ?auto_172732 ?auto_172737 ) ) ( not ( = ?auto_172732 ?auto_172738 ) ) ( not ( = ?auto_172733 ?auto_172737 ) ) ( not ( = ?auto_172733 ?auto_172738 ) ) ( not ( = ?auto_172734 ?auto_172737 ) ) ( not ( = ?auto_172734 ?auto_172738 ) ) ( not ( = ?auto_172735 ?auto_172737 ) ) ( not ( = ?auto_172735 ?auto_172738 ) ) ( not ( = ?auto_172736 ?auto_172737 ) ) ( not ( = ?auto_172736 ?auto_172738 ) ) ( not ( = ?auto_172740 ?auto_172737 ) ) ( not ( = ?auto_172740 ?auto_172738 ) ) ( not ( = ?auto_172737 ?auto_172738 ) ) ( ON ?auto_172738 ?auto_172739 ) ( not ( = ?auto_172732 ?auto_172739 ) ) ( not ( = ?auto_172733 ?auto_172739 ) ) ( not ( = ?auto_172734 ?auto_172739 ) ) ( not ( = ?auto_172735 ?auto_172739 ) ) ( not ( = ?auto_172736 ?auto_172739 ) ) ( not ( = ?auto_172740 ?auto_172739 ) ) ( not ( = ?auto_172737 ?auto_172739 ) ) ( not ( = ?auto_172738 ?auto_172739 ) ) ( ON ?auto_172737 ?auto_172738 ) ( ON-TABLE ?auto_172739 ) ( ON ?auto_172740 ?auto_172737 ) ( CLEAR ?auto_172740 ) ( HOLDING ?auto_172736 ) ( CLEAR ?auto_172735 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172732 ?auto_172733 ?auto_172734 ?auto_172735 ?auto_172736 ?auto_172740 )
      ( MAKE-5PILE ?auto_172732 ?auto_172733 ?auto_172734 ?auto_172735 ?auto_172736 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172741 - BLOCK
      ?auto_172742 - BLOCK
      ?auto_172743 - BLOCK
      ?auto_172744 - BLOCK
      ?auto_172745 - BLOCK
    )
    :vars
    (
      ?auto_172748 - BLOCK
      ?auto_172749 - BLOCK
      ?auto_172746 - BLOCK
      ?auto_172747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172741 ) ( ON ?auto_172742 ?auto_172741 ) ( ON ?auto_172743 ?auto_172742 ) ( ON ?auto_172744 ?auto_172743 ) ( not ( = ?auto_172741 ?auto_172742 ) ) ( not ( = ?auto_172741 ?auto_172743 ) ) ( not ( = ?auto_172741 ?auto_172744 ) ) ( not ( = ?auto_172741 ?auto_172745 ) ) ( not ( = ?auto_172741 ?auto_172748 ) ) ( not ( = ?auto_172742 ?auto_172743 ) ) ( not ( = ?auto_172742 ?auto_172744 ) ) ( not ( = ?auto_172742 ?auto_172745 ) ) ( not ( = ?auto_172742 ?auto_172748 ) ) ( not ( = ?auto_172743 ?auto_172744 ) ) ( not ( = ?auto_172743 ?auto_172745 ) ) ( not ( = ?auto_172743 ?auto_172748 ) ) ( not ( = ?auto_172744 ?auto_172745 ) ) ( not ( = ?auto_172744 ?auto_172748 ) ) ( not ( = ?auto_172745 ?auto_172748 ) ) ( not ( = ?auto_172741 ?auto_172749 ) ) ( not ( = ?auto_172741 ?auto_172746 ) ) ( not ( = ?auto_172742 ?auto_172749 ) ) ( not ( = ?auto_172742 ?auto_172746 ) ) ( not ( = ?auto_172743 ?auto_172749 ) ) ( not ( = ?auto_172743 ?auto_172746 ) ) ( not ( = ?auto_172744 ?auto_172749 ) ) ( not ( = ?auto_172744 ?auto_172746 ) ) ( not ( = ?auto_172745 ?auto_172749 ) ) ( not ( = ?auto_172745 ?auto_172746 ) ) ( not ( = ?auto_172748 ?auto_172749 ) ) ( not ( = ?auto_172748 ?auto_172746 ) ) ( not ( = ?auto_172749 ?auto_172746 ) ) ( ON ?auto_172746 ?auto_172747 ) ( not ( = ?auto_172741 ?auto_172747 ) ) ( not ( = ?auto_172742 ?auto_172747 ) ) ( not ( = ?auto_172743 ?auto_172747 ) ) ( not ( = ?auto_172744 ?auto_172747 ) ) ( not ( = ?auto_172745 ?auto_172747 ) ) ( not ( = ?auto_172748 ?auto_172747 ) ) ( not ( = ?auto_172749 ?auto_172747 ) ) ( not ( = ?auto_172746 ?auto_172747 ) ) ( ON ?auto_172749 ?auto_172746 ) ( ON-TABLE ?auto_172747 ) ( ON ?auto_172748 ?auto_172749 ) ( CLEAR ?auto_172744 ) ( ON ?auto_172745 ?auto_172748 ) ( CLEAR ?auto_172745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172747 ?auto_172746 ?auto_172749 ?auto_172748 )
      ( MAKE-5PILE ?auto_172741 ?auto_172742 ?auto_172743 ?auto_172744 ?auto_172745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172750 - BLOCK
      ?auto_172751 - BLOCK
      ?auto_172752 - BLOCK
      ?auto_172753 - BLOCK
      ?auto_172754 - BLOCK
    )
    :vars
    (
      ?auto_172757 - BLOCK
      ?auto_172756 - BLOCK
      ?auto_172755 - BLOCK
      ?auto_172758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172750 ) ( ON ?auto_172751 ?auto_172750 ) ( ON ?auto_172752 ?auto_172751 ) ( not ( = ?auto_172750 ?auto_172751 ) ) ( not ( = ?auto_172750 ?auto_172752 ) ) ( not ( = ?auto_172750 ?auto_172753 ) ) ( not ( = ?auto_172750 ?auto_172754 ) ) ( not ( = ?auto_172750 ?auto_172757 ) ) ( not ( = ?auto_172751 ?auto_172752 ) ) ( not ( = ?auto_172751 ?auto_172753 ) ) ( not ( = ?auto_172751 ?auto_172754 ) ) ( not ( = ?auto_172751 ?auto_172757 ) ) ( not ( = ?auto_172752 ?auto_172753 ) ) ( not ( = ?auto_172752 ?auto_172754 ) ) ( not ( = ?auto_172752 ?auto_172757 ) ) ( not ( = ?auto_172753 ?auto_172754 ) ) ( not ( = ?auto_172753 ?auto_172757 ) ) ( not ( = ?auto_172754 ?auto_172757 ) ) ( not ( = ?auto_172750 ?auto_172756 ) ) ( not ( = ?auto_172750 ?auto_172755 ) ) ( not ( = ?auto_172751 ?auto_172756 ) ) ( not ( = ?auto_172751 ?auto_172755 ) ) ( not ( = ?auto_172752 ?auto_172756 ) ) ( not ( = ?auto_172752 ?auto_172755 ) ) ( not ( = ?auto_172753 ?auto_172756 ) ) ( not ( = ?auto_172753 ?auto_172755 ) ) ( not ( = ?auto_172754 ?auto_172756 ) ) ( not ( = ?auto_172754 ?auto_172755 ) ) ( not ( = ?auto_172757 ?auto_172756 ) ) ( not ( = ?auto_172757 ?auto_172755 ) ) ( not ( = ?auto_172756 ?auto_172755 ) ) ( ON ?auto_172755 ?auto_172758 ) ( not ( = ?auto_172750 ?auto_172758 ) ) ( not ( = ?auto_172751 ?auto_172758 ) ) ( not ( = ?auto_172752 ?auto_172758 ) ) ( not ( = ?auto_172753 ?auto_172758 ) ) ( not ( = ?auto_172754 ?auto_172758 ) ) ( not ( = ?auto_172757 ?auto_172758 ) ) ( not ( = ?auto_172756 ?auto_172758 ) ) ( not ( = ?auto_172755 ?auto_172758 ) ) ( ON ?auto_172756 ?auto_172755 ) ( ON-TABLE ?auto_172758 ) ( ON ?auto_172757 ?auto_172756 ) ( ON ?auto_172754 ?auto_172757 ) ( CLEAR ?auto_172754 ) ( HOLDING ?auto_172753 ) ( CLEAR ?auto_172752 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172750 ?auto_172751 ?auto_172752 ?auto_172753 )
      ( MAKE-5PILE ?auto_172750 ?auto_172751 ?auto_172752 ?auto_172753 ?auto_172754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172759 - BLOCK
      ?auto_172760 - BLOCK
      ?auto_172761 - BLOCK
      ?auto_172762 - BLOCK
      ?auto_172763 - BLOCK
    )
    :vars
    (
      ?auto_172766 - BLOCK
      ?auto_172765 - BLOCK
      ?auto_172767 - BLOCK
      ?auto_172764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172759 ) ( ON ?auto_172760 ?auto_172759 ) ( ON ?auto_172761 ?auto_172760 ) ( not ( = ?auto_172759 ?auto_172760 ) ) ( not ( = ?auto_172759 ?auto_172761 ) ) ( not ( = ?auto_172759 ?auto_172762 ) ) ( not ( = ?auto_172759 ?auto_172763 ) ) ( not ( = ?auto_172759 ?auto_172766 ) ) ( not ( = ?auto_172760 ?auto_172761 ) ) ( not ( = ?auto_172760 ?auto_172762 ) ) ( not ( = ?auto_172760 ?auto_172763 ) ) ( not ( = ?auto_172760 ?auto_172766 ) ) ( not ( = ?auto_172761 ?auto_172762 ) ) ( not ( = ?auto_172761 ?auto_172763 ) ) ( not ( = ?auto_172761 ?auto_172766 ) ) ( not ( = ?auto_172762 ?auto_172763 ) ) ( not ( = ?auto_172762 ?auto_172766 ) ) ( not ( = ?auto_172763 ?auto_172766 ) ) ( not ( = ?auto_172759 ?auto_172765 ) ) ( not ( = ?auto_172759 ?auto_172767 ) ) ( not ( = ?auto_172760 ?auto_172765 ) ) ( not ( = ?auto_172760 ?auto_172767 ) ) ( not ( = ?auto_172761 ?auto_172765 ) ) ( not ( = ?auto_172761 ?auto_172767 ) ) ( not ( = ?auto_172762 ?auto_172765 ) ) ( not ( = ?auto_172762 ?auto_172767 ) ) ( not ( = ?auto_172763 ?auto_172765 ) ) ( not ( = ?auto_172763 ?auto_172767 ) ) ( not ( = ?auto_172766 ?auto_172765 ) ) ( not ( = ?auto_172766 ?auto_172767 ) ) ( not ( = ?auto_172765 ?auto_172767 ) ) ( ON ?auto_172767 ?auto_172764 ) ( not ( = ?auto_172759 ?auto_172764 ) ) ( not ( = ?auto_172760 ?auto_172764 ) ) ( not ( = ?auto_172761 ?auto_172764 ) ) ( not ( = ?auto_172762 ?auto_172764 ) ) ( not ( = ?auto_172763 ?auto_172764 ) ) ( not ( = ?auto_172766 ?auto_172764 ) ) ( not ( = ?auto_172765 ?auto_172764 ) ) ( not ( = ?auto_172767 ?auto_172764 ) ) ( ON ?auto_172765 ?auto_172767 ) ( ON-TABLE ?auto_172764 ) ( ON ?auto_172766 ?auto_172765 ) ( ON ?auto_172763 ?auto_172766 ) ( CLEAR ?auto_172761 ) ( ON ?auto_172762 ?auto_172763 ) ( CLEAR ?auto_172762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172764 ?auto_172767 ?auto_172765 ?auto_172766 ?auto_172763 )
      ( MAKE-5PILE ?auto_172759 ?auto_172760 ?auto_172761 ?auto_172762 ?auto_172763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172768 - BLOCK
      ?auto_172769 - BLOCK
      ?auto_172770 - BLOCK
      ?auto_172771 - BLOCK
      ?auto_172772 - BLOCK
    )
    :vars
    (
      ?auto_172774 - BLOCK
      ?auto_172776 - BLOCK
      ?auto_172773 - BLOCK
      ?auto_172775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172768 ) ( ON ?auto_172769 ?auto_172768 ) ( not ( = ?auto_172768 ?auto_172769 ) ) ( not ( = ?auto_172768 ?auto_172770 ) ) ( not ( = ?auto_172768 ?auto_172771 ) ) ( not ( = ?auto_172768 ?auto_172772 ) ) ( not ( = ?auto_172768 ?auto_172774 ) ) ( not ( = ?auto_172769 ?auto_172770 ) ) ( not ( = ?auto_172769 ?auto_172771 ) ) ( not ( = ?auto_172769 ?auto_172772 ) ) ( not ( = ?auto_172769 ?auto_172774 ) ) ( not ( = ?auto_172770 ?auto_172771 ) ) ( not ( = ?auto_172770 ?auto_172772 ) ) ( not ( = ?auto_172770 ?auto_172774 ) ) ( not ( = ?auto_172771 ?auto_172772 ) ) ( not ( = ?auto_172771 ?auto_172774 ) ) ( not ( = ?auto_172772 ?auto_172774 ) ) ( not ( = ?auto_172768 ?auto_172776 ) ) ( not ( = ?auto_172768 ?auto_172773 ) ) ( not ( = ?auto_172769 ?auto_172776 ) ) ( not ( = ?auto_172769 ?auto_172773 ) ) ( not ( = ?auto_172770 ?auto_172776 ) ) ( not ( = ?auto_172770 ?auto_172773 ) ) ( not ( = ?auto_172771 ?auto_172776 ) ) ( not ( = ?auto_172771 ?auto_172773 ) ) ( not ( = ?auto_172772 ?auto_172776 ) ) ( not ( = ?auto_172772 ?auto_172773 ) ) ( not ( = ?auto_172774 ?auto_172776 ) ) ( not ( = ?auto_172774 ?auto_172773 ) ) ( not ( = ?auto_172776 ?auto_172773 ) ) ( ON ?auto_172773 ?auto_172775 ) ( not ( = ?auto_172768 ?auto_172775 ) ) ( not ( = ?auto_172769 ?auto_172775 ) ) ( not ( = ?auto_172770 ?auto_172775 ) ) ( not ( = ?auto_172771 ?auto_172775 ) ) ( not ( = ?auto_172772 ?auto_172775 ) ) ( not ( = ?auto_172774 ?auto_172775 ) ) ( not ( = ?auto_172776 ?auto_172775 ) ) ( not ( = ?auto_172773 ?auto_172775 ) ) ( ON ?auto_172776 ?auto_172773 ) ( ON-TABLE ?auto_172775 ) ( ON ?auto_172774 ?auto_172776 ) ( ON ?auto_172772 ?auto_172774 ) ( ON ?auto_172771 ?auto_172772 ) ( CLEAR ?auto_172771 ) ( HOLDING ?auto_172770 ) ( CLEAR ?auto_172769 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172768 ?auto_172769 ?auto_172770 )
      ( MAKE-5PILE ?auto_172768 ?auto_172769 ?auto_172770 ?auto_172771 ?auto_172772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172777 - BLOCK
      ?auto_172778 - BLOCK
      ?auto_172779 - BLOCK
      ?auto_172780 - BLOCK
      ?auto_172781 - BLOCK
    )
    :vars
    (
      ?auto_172785 - BLOCK
      ?auto_172783 - BLOCK
      ?auto_172782 - BLOCK
      ?auto_172784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172777 ) ( ON ?auto_172778 ?auto_172777 ) ( not ( = ?auto_172777 ?auto_172778 ) ) ( not ( = ?auto_172777 ?auto_172779 ) ) ( not ( = ?auto_172777 ?auto_172780 ) ) ( not ( = ?auto_172777 ?auto_172781 ) ) ( not ( = ?auto_172777 ?auto_172785 ) ) ( not ( = ?auto_172778 ?auto_172779 ) ) ( not ( = ?auto_172778 ?auto_172780 ) ) ( not ( = ?auto_172778 ?auto_172781 ) ) ( not ( = ?auto_172778 ?auto_172785 ) ) ( not ( = ?auto_172779 ?auto_172780 ) ) ( not ( = ?auto_172779 ?auto_172781 ) ) ( not ( = ?auto_172779 ?auto_172785 ) ) ( not ( = ?auto_172780 ?auto_172781 ) ) ( not ( = ?auto_172780 ?auto_172785 ) ) ( not ( = ?auto_172781 ?auto_172785 ) ) ( not ( = ?auto_172777 ?auto_172783 ) ) ( not ( = ?auto_172777 ?auto_172782 ) ) ( not ( = ?auto_172778 ?auto_172783 ) ) ( not ( = ?auto_172778 ?auto_172782 ) ) ( not ( = ?auto_172779 ?auto_172783 ) ) ( not ( = ?auto_172779 ?auto_172782 ) ) ( not ( = ?auto_172780 ?auto_172783 ) ) ( not ( = ?auto_172780 ?auto_172782 ) ) ( not ( = ?auto_172781 ?auto_172783 ) ) ( not ( = ?auto_172781 ?auto_172782 ) ) ( not ( = ?auto_172785 ?auto_172783 ) ) ( not ( = ?auto_172785 ?auto_172782 ) ) ( not ( = ?auto_172783 ?auto_172782 ) ) ( ON ?auto_172782 ?auto_172784 ) ( not ( = ?auto_172777 ?auto_172784 ) ) ( not ( = ?auto_172778 ?auto_172784 ) ) ( not ( = ?auto_172779 ?auto_172784 ) ) ( not ( = ?auto_172780 ?auto_172784 ) ) ( not ( = ?auto_172781 ?auto_172784 ) ) ( not ( = ?auto_172785 ?auto_172784 ) ) ( not ( = ?auto_172783 ?auto_172784 ) ) ( not ( = ?auto_172782 ?auto_172784 ) ) ( ON ?auto_172783 ?auto_172782 ) ( ON-TABLE ?auto_172784 ) ( ON ?auto_172785 ?auto_172783 ) ( ON ?auto_172781 ?auto_172785 ) ( ON ?auto_172780 ?auto_172781 ) ( CLEAR ?auto_172778 ) ( ON ?auto_172779 ?auto_172780 ) ( CLEAR ?auto_172779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172784 ?auto_172782 ?auto_172783 ?auto_172785 ?auto_172781 ?auto_172780 )
      ( MAKE-5PILE ?auto_172777 ?auto_172778 ?auto_172779 ?auto_172780 ?auto_172781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172786 - BLOCK
      ?auto_172787 - BLOCK
      ?auto_172788 - BLOCK
      ?auto_172789 - BLOCK
      ?auto_172790 - BLOCK
    )
    :vars
    (
      ?auto_172791 - BLOCK
      ?auto_172793 - BLOCK
      ?auto_172792 - BLOCK
      ?auto_172794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172786 ) ( not ( = ?auto_172786 ?auto_172787 ) ) ( not ( = ?auto_172786 ?auto_172788 ) ) ( not ( = ?auto_172786 ?auto_172789 ) ) ( not ( = ?auto_172786 ?auto_172790 ) ) ( not ( = ?auto_172786 ?auto_172791 ) ) ( not ( = ?auto_172787 ?auto_172788 ) ) ( not ( = ?auto_172787 ?auto_172789 ) ) ( not ( = ?auto_172787 ?auto_172790 ) ) ( not ( = ?auto_172787 ?auto_172791 ) ) ( not ( = ?auto_172788 ?auto_172789 ) ) ( not ( = ?auto_172788 ?auto_172790 ) ) ( not ( = ?auto_172788 ?auto_172791 ) ) ( not ( = ?auto_172789 ?auto_172790 ) ) ( not ( = ?auto_172789 ?auto_172791 ) ) ( not ( = ?auto_172790 ?auto_172791 ) ) ( not ( = ?auto_172786 ?auto_172793 ) ) ( not ( = ?auto_172786 ?auto_172792 ) ) ( not ( = ?auto_172787 ?auto_172793 ) ) ( not ( = ?auto_172787 ?auto_172792 ) ) ( not ( = ?auto_172788 ?auto_172793 ) ) ( not ( = ?auto_172788 ?auto_172792 ) ) ( not ( = ?auto_172789 ?auto_172793 ) ) ( not ( = ?auto_172789 ?auto_172792 ) ) ( not ( = ?auto_172790 ?auto_172793 ) ) ( not ( = ?auto_172790 ?auto_172792 ) ) ( not ( = ?auto_172791 ?auto_172793 ) ) ( not ( = ?auto_172791 ?auto_172792 ) ) ( not ( = ?auto_172793 ?auto_172792 ) ) ( ON ?auto_172792 ?auto_172794 ) ( not ( = ?auto_172786 ?auto_172794 ) ) ( not ( = ?auto_172787 ?auto_172794 ) ) ( not ( = ?auto_172788 ?auto_172794 ) ) ( not ( = ?auto_172789 ?auto_172794 ) ) ( not ( = ?auto_172790 ?auto_172794 ) ) ( not ( = ?auto_172791 ?auto_172794 ) ) ( not ( = ?auto_172793 ?auto_172794 ) ) ( not ( = ?auto_172792 ?auto_172794 ) ) ( ON ?auto_172793 ?auto_172792 ) ( ON-TABLE ?auto_172794 ) ( ON ?auto_172791 ?auto_172793 ) ( ON ?auto_172790 ?auto_172791 ) ( ON ?auto_172789 ?auto_172790 ) ( ON ?auto_172788 ?auto_172789 ) ( CLEAR ?auto_172788 ) ( HOLDING ?auto_172787 ) ( CLEAR ?auto_172786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172786 ?auto_172787 )
      ( MAKE-5PILE ?auto_172786 ?auto_172787 ?auto_172788 ?auto_172789 ?auto_172790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172795 - BLOCK
      ?auto_172796 - BLOCK
      ?auto_172797 - BLOCK
      ?auto_172798 - BLOCK
      ?auto_172799 - BLOCK
    )
    :vars
    (
      ?auto_172800 - BLOCK
      ?auto_172801 - BLOCK
      ?auto_172803 - BLOCK
      ?auto_172802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172795 ) ( not ( = ?auto_172795 ?auto_172796 ) ) ( not ( = ?auto_172795 ?auto_172797 ) ) ( not ( = ?auto_172795 ?auto_172798 ) ) ( not ( = ?auto_172795 ?auto_172799 ) ) ( not ( = ?auto_172795 ?auto_172800 ) ) ( not ( = ?auto_172796 ?auto_172797 ) ) ( not ( = ?auto_172796 ?auto_172798 ) ) ( not ( = ?auto_172796 ?auto_172799 ) ) ( not ( = ?auto_172796 ?auto_172800 ) ) ( not ( = ?auto_172797 ?auto_172798 ) ) ( not ( = ?auto_172797 ?auto_172799 ) ) ( not ( = ?auto_172797 ?auto_172800 ) ) ( not ( = ?auto_172798 ?auto_172799 ) ) ( not ( = ?auto_172798 ?auto_172800 ) ) ( not ( = ?auto_172799 ?auto_172800 ) ) ( not ( = ?auto_172795 ?auto_172801 ) ) ( not ( = ?auto_172795 ?auto_172803 ) ) ( not ( = ?auto_172796 ?auto_172801 ) ) ( not ( = ?auto_172796 ?auto_172803 ) ) ( not ( = ?auto_172797 ?auto_172801 ) ) ( not ( = ?auto_172797 ?auto_172803 ) ) ( not ( = ?auto_172798 ?auto_172801 ) ) ( not ( = ?auto_172798 ?auto_172803 ) ) ( not ( = ?auto_172799 ?auto_172801 ) ) ( not ( = ?auto_172799 ?auto_172803 ) ) ( not ( = ?auto_172800 ?auto_172801 ) ) ( not ( = ?auto_172800 ?auto_172803 ) ) ( not ( = ?auto_172801 ?auto_172803 ) ) ( ON ?auto_172803 ?auto_172802 ) ( not ( = ?auto_172795 ?auto_172802 ) ) ( not ( = ?auto_172796 ?auto_172802 ) ) ( not ( = ?auto_172797 ?auto_172802 ) ) ( not ( = ?auto_172798 ?auto_172802 ) ) ( not ( = ?auto_172799 ?auto_172802 ) ) ( not ( = ?auto_172800 ?auto_172802 ) ) ( not ( = ?auto_172801 ?auto_172802 ) ) ( not ( = ?auto_172803 ?auto_172802 ) ) ( ON ?auto_172801 ?auto_172803 ) ( ON-TABLE ?auto_172802 ) ( ON ?auto_172800 ?auto_172801 ) ( ON ?auto_172799 ?auto_172800 ) ( ON ?auto_172798 ?auto_172799 ) ( ON ?auto_172797 ?auto_172798 ) ( CLEAR ?auto_172795 ) ( ON ?auto_172796 ?auto_172797 ) ( CLEAR ?auto_172796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172802 ?auto_172803 ?auto_172801 ?auto_172800 ?auto_172799 ?auto_172798 ?auto_172797 )
      ( MAKE-5PILE ?auto_172795 ?auto_172796 ?auto_172797 ?auto_172798 ?auto_172799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172804 - BLOCK
      ?auto_172805 - BLOCK
      ?auto_172806 - BLOCK
      ?auto_172807 - BLOCK
      ?auto_172808 - BLOCK
    )
    :vars
    (
      ?auto_172812 - BLOCK
      ?auto_172810 - BLOCK
      ?auto_172811 - BLOCK
      ?auto_172809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172804 ?auto_172805 ) ) ( not ( = ?auto_172804 ?auto_172806 ) ) ( not ( = ?auto_172804 ?auto_172807 ) ) ( not ( = ?auto_172804 ?auto_172808 ) ) ( not ( = ?auto_172804 ?auto_172812 ) ) ( not ( = ?auto_172805 ?auto_172806 ) ) ( not ( = ?auto_172805 ?auto_172807 ) ) ( not ( = ?auto_172805 ?auto_172808 ) ) ( not ( = ?auto_172805 ?auto_172812 ) ) ( not ( = ?auto_172806 ?auto_172807 ) ) ( not ( = ?auto_172806 ?auto_172808 ) ) ( not ( = ?auto_172806 ?auto_172812 ) ) ( not ( = ?auto_172807 ?auto_172808 ) ) ( not ( = ?auto_172807 ?auto_172812 ) ) ( not ( = ?auto_172808 ?auto_172812 ) ) ( not ( = ?auto_172804 ?auto_172810 ) ) ( not ( = ?auto_172804 ?auto_172811 ) ) ( not ( = ?auto_172805 ?auto_172810 ) ) ( not ( = ?auto_172805 ?auto_172811 ) ) ( not ( = ?auto_172806 ?auto_172810 ) ) ( not ( = ?auto_172806 ?auto_172811 ) ) ( not ( = ?auto_172807 ?auto_172810 ) ) ( not ( = ?auto_172807 ?auto_172811 ) ) ( not ( = ?auto_172808 ?auto_172810 ) ) ( not ( = ?auto_172808 ?auto_172811 ) ) ( not ( = ?auto_172812 ?auto_172810 ) ) ( not ( = ?auto_172812 ?auto_172811 ) ) ( not ( = ?auto_172810 ?auto_172811 ) ) ( ON ?auto_172811 ?auto_172809 ) ( not ( = ?auto_172804 ?auto_172809 ) ) ( not ( = ?auto_172805 ?auto_172809 ) ) ( not ( = ?auto_172806 ?auto_172809 ) ) ( not ( = ?auto_172807 ?auto_172809 ) ) ( not ( = ?auto_172808 ?auto_172809 ) ) ( not ( = ?auto_172812 ?auto_172809 ) ) ( not ( = ?auto_172810 ?auto_172809 ) ) ( not ( = ?auto_172811 ?auto_172809 ) ) ( ON ?auto_172810 ?auto_172811 ) ( ON-TABLE ?auto_172809 ) ( ON ?auto_172812 ?auto_172810 ) ( ON ?auto_172808 ?auto_172812 ) ( ON ?auto_172807 ?auto_172808 ) ( ON ?auto_172806 ?auto_172807 ) ( ON ?auto_172805 ?auto_172806 ) ( CLEAR ?auto_172805 ) ( HOLDING ?auto_172804 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172804 )
      ( MAKE-5PILE ?auto_172804 ?auto_172805 ?auto_172806 ?auto_172807 ?auto_172808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172813 - BLOCK
      ?auto_172814 - BLOCK
      ?auto_172815 - BLOCK
      ?auto_172816 - BLOCK
      ?auto_172817 - BLOCK
    )
    :vars
    (
      ?auto_172820 - BLOCK
      ?auto_172818 - BLOCK
      ?auto_172819 - BLOCK
      ?auto_172821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172813 ?auto_172814 ) ) ( not ( = ?auto_172813 ?auto_172815 ) ) ( not ( = ?auto_172813 ?auto_172816 ) ) ( not ( = ?auto_172813 ?auto_172817 ) ) ( not ( = ?auto_172813 ?auto_172820 ) ) ( not ( = ?auto_172814 ?auto_172815 ) ) ( not ( = ?auto_172814 ?auto_172816 ) ) ( not ( = ?auto_172814 ?auto_172817 ) ) ( not ( = ?auto_172814 ?auto_172820 ) ) ( not ( = ?auto_172815 ?auto_172816 ) ) ( not ( = ?auto_172815 ?auto_172817 ) ) ( not ( = ?auto_172815 ?auto_172820 ) ) ( not ( = ?auto_172816 ?auto_172817 ) ) ( not ( = ?auto_172816 ?auto_172820 ) ) ( not ( = ?auto_172817 ?auto_172820 ) ) ( not ( = ?auto_172813 ?auto_172818 ) ) ( not ( = ?auto_172813 ?auto_172819 ) ) ( not ( = ?auto_172814 ?auto_172818 ) ) ( not ( = ?auto_172814 ?auto_172819 ) ) ( not ( = ?auto_172815 ?auto_172818 ) ) ( not ( = ?auto_172815 ?auto_172819 ) ) ( not ( = ?auto_172816 ?auto_172818 ) ) ( not ( = ?auto_172816 ?auto_172819 ) ) ( not ( = ?auto_172817 ?auto_172818 ) ) ( not ( = ?auto_172817 ?auto_172819 ) ) ( not ( = ?auto_172820 ?auto_172818 ) ) ( not ( = ?auto_172820 ?auto_172819 ) ) ( not ( = ?auto_172818 ?auto_172819 ) ) ( ON ?auto_172819 ?auto_172821 ) ( not ( = ?auto_172813 ?auto_172821 ) ) ( not ( = ?auto_172814 ?auto_172821 ) ) ( not ( = ?auto_172815 ?auto_172821 ) ) ( not ( = ?auto_172816 ?auto_172821 ) ) ( not ( = ?auto_172817 ?auto_172821 ) ) ( not ( = ?auto_172820 ?auto_172821 ) ) ( not ( = ?auto_172818 ?auto_172821 ) ) ( not ( = ?auto_172819 ?auto_172821 ) ) ( ON ?auto_172818 ?auto_172819 ) ( ON-TABLE ?auto_172821 ) ( ON ?auto_172820 ?auto_172818 ) ( ON ?auto_172817 ?auto_172820 ) ( ON ?auto_172816 ?auto_172817 ) ( ON ?auto_172815 ?auto_172816 ) ( ON ?auto_172814 ?auto_172815 ) ( ON ?auto_172813 ?auto_172814 ) ( CLEAR ?auto_172813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172821 ?auto_172819 ?auto_172818 ?auto_172820 ?auto_172817 ?auto_172816 ?auto_172815 ?auto_172814 )
      ( MAKE-5PILE ?auto_172813 ?auto_172814 ?auto_172815 ?auto_172816 ?auto_172817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172825 - BLOCK
      ?auto_172826 - BLOCK
      ?auto_172827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_172827 ) ( CLEAR ?auto_172826 ) ( ON-TABLE ?auto_172825 ) ( ON ?auto_172826 ?auto_172825 ) ( not ( = ?auto_172825 ?auto_172826 ) ) ( not ( = ?auto_172825 ?auto_172827 ) ) ( not ( = ?auto_172826 ?auto_172827 ) ) )
    :subtasks
    ( ( !STACK ?auto_172827 ?auto_172826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172828 - BLOCK
      ?auto_172829 - BLOCK
      ?auto_172830 - BLOCK
    )
    :vars
    (
      ?auto_172831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172829 ) ( ON-TABLE ?auto_172828 ) ( ON ?auto_172829 ?auto_172828 ) ( not ( = ?auto_172828 ?auto_172829 ) ) ( not ( = ?auto_172828 ?auto_172830 ) ) ( not ( = ?auto_172829 ?auto_172830 ) ) ( ON ?auto_172830 ?auto_172831 ) ( CLEAR ?auto_172830 ) ( HAND-EMPTY ) ( not ( = ?auto_172828 ?auto_172831 ) ) ( not ( = ?auto_172829 ?auto_172831 ) ) ( not ( = ?auto_172830 ?auto_172831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172830 ?auto_172831 )
      ( MAKE-3PILE ?auto_172828 ?auto_172829 ?auto_172830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172832 - BLOCK
      ?auto_172833 - BLOCK
      ?auto_172834 - BLOCK
    )
    :vars
    (
      ?auto_172835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172832 ) ( not ( = ?auto_172832 ?auto_172833 ) ) ( not ( = ?auto_172832 ?auto_172834 ) ) ( not ( = ?auto_172833 ?auto_172834 ) ) ( ON ?auto_172834 ?auto_172835 ) ( CLEAR ?auto_172834 ) ( not ( = ?auto_172832 ?auto_172835 ) ) ( not ( = ?auto_172833 ?auto_172835 ) ) ( not ( = ?auto_172834 ?auto_172835 ) ) ( HOLDING ?auto_172833 ) ( CLEAR ?auto_172832 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172832 ?auto_172833 )
      ( MAKE-3PILE ?auto_172832 ?auto_172833 ?auto_172834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172836 - BLOCK
      ?auto_172837 - BLOCK
      ?auto_172838 - BLOCK
    )
    :vars
    (
      ?auto_172839 - BLOCK
      ?auto_172841 - BLOCK
      ?auto_172840 - BLOCK
      ?auto_172842 - BLOCK
      ?auto_172843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172836 ) ( not ( = ?auto_172836 ?auto_172837 ) ) ( not ( = ?auto_172836 ?auto_172838 ) ) ( not ( = ?auto_172837 ?auto_172838 ) ) ( ON ?auto_172838 ?auto_172839 ) ( not ( = ?auto_172836 ?auto_172839 ) ) ( not ( = ?auto_172837 ?auto_172839 ) ) ( not ( = ?auto_172838 ?auto_172839 ) ) ( CLEAR ?auto_172836 ) ( ON ?auto_172837 ?auto_172838 ) ( CLEAR ?auto_172837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172841 ) ( ON ?auto_172840 ?auto_172841 ) ( ON ?auto_172842 ?auto_172840 ) ( ON ?auto_172843 ?auto_172842 ) ( ON ?auto_172839 ?auto_172843 ) ( not ( = ?auto_172841 ?auto_172840 ) ) ( not ( = ?auto_172841 ?auto_172842 ) ) ( not ( = ?auto_172841 ?auto_172843 ) ) ( not ( = ?auto_172841 ?auto_172839 ) ) ( not ( = ?auto_172841 ?auto_172838 ) ) ( not ( = ?auto_172841 ?auto_172837 ) ) ( not ( = ?auto_172840 ?auto_172842 ) ) ( not ( = ?auto_172840 ?auto_172843 ) ) ( not ( = ?auto_172840 ?auto_172839 ) ) ( not ( = ?auto_172840 ?auto_172838 ) ) ( not ( = ?auto_172840 ?auto_172837 ) ) ( not ( = ?auto_172842 ?auto_172843 ) ) ( not ( = ?auto_172842 ?auto_172839 ) ) ( not ( = ?auto_172842 ?auto_172838 ) ) ( not ( = ?auto_172842 ?auto_172837 ) ) ( not ( = ?auto_172843 ?auto_172839 ) ) ( not ( = ?auto_172843 ?auto_172838 ) ) ( not ( = ?auto_172843 ?auto_172837 ) ) ( not ( = ?auto_172836 ?auto_172841 ) ) ( not ( = ?auto_172836 ?auto_172840 ) ) ( not ( = ?auto_172836 ?auto_172842 ) ) ( not ( = ?auto_172836 ?auto_172843 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172841 ?auto_172840 ?auto_172842 ?auto_172843 ?auto_172839 ?auto_172838 )
      ( MAKE-3PILE ?auto_172836 ?auto_172837 ?auto_172838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172844 - BLOCK
      ?auto_172845 - BLOCK
      ?auto_172846 - BLOCK
    )
    :vars
    (
      ?auto_172850 - BLOCK
      ?auto_172851 - BLOCK
      ?auto_172847 - BLOCK
      ?auto_172848 - BLOCK
      ?auto_172849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172844 ?auto_172845 ) ) ( not ( = ?auto_172844 ?auto_172846 ) ) ( not ( = ?auto_172845 ?auto_172846 ) ) ( ON ?auto_172846 ?auto_172850 ) ( not ( = ?auto_172844 ?auto_172850 ) ) ( not ( = ?auto_172845 ?auto_172850 ) ) ( not ( = ?auto_172846 ?auto_172850 ) ) ( ON ?auto_172845 ?auto_172846 ) ( CLEAR ?auto_172845 ) ( ON-TABLE ?auto_172851 ) ( ON ?auto_172847 ?auto_172851 ) ( ON ?auto_172848 ?auto_172847 ) ( ON ?auto_172849 ?auto_172848 ) ( ON ?auto_172850 ?auto_172849 ) ( not ( = ?auto_172851 ?auto_172847 ) ) ( not ( = ?auto_172851 ?auto_172848 ) ) ( not ( = ?auto_172851 ?auto_172849 ) ) ( not ( = ?auto_172851 ?auto_172850 ) ) ( not ( = ?auto_172851 ?auto_172846 ) ) ( not ( = ?auto_172851 ?auto_172845 ) ) ( not ( = ?auto_172847 ?auto_172848 ) ) ( not ( = ?auto_172847 ?auto_172849 ) ) ( not ( = ?auto_172847 ?auto_172850 ) ) ( not ( = ?auto_172847 ?auto_172846 ) ) ( not ( = ?auto_172847 ?auto_172845 ) ) ( not ( = ?auto_172848 ?auto_172849 ) ) ( not ( = ?auto_172848 ?auto_172850 ) ) ( not ( = ?auto_172848 ?auto_172846 ) ) ( not ( = ?auto_172848 ?auto_172845 ) ) ( not ( = ?auto_172849 ?auto_172850 ) ) ( not ( = ?auto_172849 ?auto_172846 ) ) ( not ( = ?auto_172849 ?auto_172845 ) ) ( not ( = ?auto_172844 ?auto_172851 ) ) ( not ( = ?auto_172844 ?auto_172847 ) ) ( not ( = ?auto_172844 ?auto_172848 ) ) ( not ( = ?auto_172844 ?auto_172849 ) ) ( HOLDING ?auto_172844 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172844 )
      ( MAKE-3PILE ?auto_172844 ?auto_172845 ?auto_172846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172852 - BLOCK
      ?auto_172853 - BLOCK
      ?auto_172854 - BLOCK
    )
    :vars
    (
      ?auto_172858 - BLOCK
      ?auto_172855 - BLOCK
      ?auto_172856 - BLOCK
      ?auto_172857 - BLOCK
      ?auto_172859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172852 ?auto_172853 ) ) ( not ( = ?auto_172852 ?auto_172854 ) ) ( not ( = ?auto_172853 ?auto_172854 ) ) ( ON ?auto_172854 ?auto_172858 ) ( not ( = ?auto_172852 ?auto_172858 ) ) ( not ( = ?auto_172853 ?auto_172858 ) ) ( not ( = ?auto_172854 ?auto_172858 ) ) ( ON ?auto_172853 ?auto_172854 ) ( ON-TABLE ?auto_172855 ) ( ON ?auto_172856 ?auto_172855 ) ( ON ?auto_172857 ?auto_172856 ) ( ON ?auto_172859 ?auto_172857 ) ( ON ?auto_172858 ?auto_172859 ) ( not ( = ?auto_172855 ?auto_172856 ) ) ( not ( = ?auto_172855 ?auto_172857 ) ) ( not ( = ?auto_172855 ?auto_172859 ) ) ( not ( = ?auto_172855 ?auto_172858 ) ) ( not ( = ?auto_172855 ?auto_172854 ) ) ( not ( = ?auto_172855 ?auto_172853 ) ) ( not ( = ?auto_172856 ?auto_172857 ) ) ( not ( = ?auto_172856 ?auto_172859 ) ) ( not ( = ?auto_172856 ?auto_172858 ) ) ( not ( = ?auto_172856 ?auto_172854 ) ) ( not ( = ?auto_172856 ?auto_172853 ) ) ( not ( = ?auto_172857 ?auto_172859 ) ) ( not ( = ?auto_172857 ?auto_172858 ) ) ( not ( = ?auto_172857 ?auto_172854 ) ) ( not ( = ?auto_172857 ?auto_172853 ) ) ( not ( = ?auto_172859 ?auto_172858 ) ) ( not ( = ?auto_172859 ?auto_172854 ) ) ( not ( = ?auto_172859 ?auto_172853 ) ) ( not ( = ?auto_172852 ?auto_172855 ) ) ( not ( = ?auto_172852 ?auto_172856 ) ) ( not ( = ?auto_172852 ?auto_172857 ) ) ( not ( = ?auto_172852 ?auto_172859 ) ) ( ON ?auto_172852 ?auto_172853 ) ( CLEAR ?auto_172852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172855 ?auto_172856 ?auto_172857 ?auto_172859 ?auto_172858 ?auto_172854 ?auto_172853 )
      ( MAKE-3PILE ?auto_172852 ?auto_172853 ?auto_172854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172860 - BLOCK
      ?auto_172861 - BLOCK
      ?auto_172862 - BLOCK
    )
    :vars
    (
      ?auto_172866 - BLOCK
      ?auto_172865 - BLOCK
      ?auto_172864 - BLOCK
      ?auto_172867 - BLOCK
      ?auto_172863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172860 ?auto_172861 ) ) ( not ( = ?auto_172860 ?auto_172862 ) ) ( not ( = ?auto_172861 ?auto_172862 ) ) ( ON ?auto_172862 ?auto_172866 ) ( not ( = ?auto_172860 ?auto_172866 ) ) ( not ( = ?auto_172861 ?auto_172866 ) ) ( not ( = ?auto_172862 ?auto_172866 ) ) ( ON ?auto_172861 ?auto_172862 ) ( ON-TABLE ?auto_172865 ) ( ON ?auto_172864 ?auto_172865 ) ( ON ?auto_172867 ?auto_172864 ) ( ON ?auto_172863 ?auto_172867 ) ( ON ?auto_172866 ?auto_172863 ) ( not ( = ?auto_172865 ?auto_172864 ) ) ( not ( = ?auto_172865 ?auto_172867 ) ) ( not ( = ?auto_172865 ?auto_172863 ) ) ( not ( = ?auto_172865 ?auto_172866 ) ) ( not ( = ?auto_172865 ?auto_172862 ) ) ( not ( = ?auto_172865 ?auto_172861 ) ) ( not ( = ?auto_172864 ?auto_172867 ) ) ( not ( = ?auto_172864 ?auto_172863 ) ) ( not ( = ?auto_172864 ?auto_172866 ) ) ( not ( = ?auto_172864 ?auto_172862 ) ) ( not ( = ?auto_172864 ?auto_172861 ) ) ( not ( = ?auto_172867 ?auto_172863 ) ) ( not ( = ?auto_172867 ?auto_172866 ) ) ( not ( = ?auto_172867 ?auto_172862 ) ) ( not ( = ?auto_172867 ?auto_172861 ) ) ( not ( = ?auto_172863 ?auto_172866 ) ) ( not ( = ?auto_172863 ?auto_172862 ) ) ( not ( = ?auto_172863 ?auto_172861 ) ) ( not ( = ?auto_172860 ?auto_172865 ) ) ( not ( = ?auto_172860 ?auto_172864 ) ) ( not ( = ?auto_172860 ?auto_172867 ) ) ( not ( = ?auto_172860 ?auto_172863 ) ) ( HOLDING ?auto_172860 ) ( CLEAR ?auto_172861 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172865 ?auto_172864 ?auto_172867 ?auto_172863 ?auto_172866 ?auto_172862 ?auto_172861 ?auto_172860 )
      ( MAKE-3PILE ?auto_172860 ?auto_172861 ?auto_172862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172868 - BLOCK
      ?auto_172869 - BLOCK
      ?auto_172870 - BLOCK
    )
    :vars
    (
      ?auto_172873 - BLOCK
      ?auto_172874 - BLOCK
      ?auto_172871 - BLOCK
      ?auto_172875 - BLOCK
      ?auto_172872 - BLOCK
      ?auto_172876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172868 ?auto_172869 ) ) ( not ( = ?auto_172868 ?auto_172870 ) ) ( not ( = ?auto_172869 ?auto_172870 ) ) ( ON ?auto_172870 ?auto_172873 ) ( not ( = ?auto_172868 ?auto_172873 ) ) ( not ( = ?auto_172869 ?auto_172873 ) ) ( not ( = ?auto_172870 ?auto_172873 ) ) ( ON ?auto_172869 ?auto_172870 ) ( ON-TABLE ?auto_172874 ) ( ON ?auto_172871 ?auto_172874 ) ( ON ?auto_172875 ?auto_172871 ) ( ON ?auto_172872 ?auto_172875 ) ( ON ?auto_172873 ?auto_172872 ) ( not ( = ?auto_172874 ?auto_172871 ) ) ( not ( = ?auto_172874 ?auto_172875 ) ) ( not ( = ?auto_172874 ?auto_172872 ) ) ( not ( = ?auto_172874 ?auto_172873 ) ) ( not ( = ?auto_172874 ?auto_172870 ) ) ( not ( = ?auto_172874 ?auto_172869 ) ) ( not ( = ?auto_172871 ?auto_172875 ) ) ( not ( = ?auto_172871 ?auto_172872 ) ) ( not ( = ?auto_172871 ?auto_172873 ) ) ( not ( = ?auto_172871 ?auto_172870 ) ) ( not ( = ?auto_172871 ?auto_172869 ) ) ( not ( = ?auto_172875 ?auto_172872 ) ) ( not ( = ?auto_172875 ?auto_172873 ) ) ( not ( = ?auto_172875 ?auto_172870 ) ) ( not ( = ?auto_172875 ?auto_172869 ) ) ( not ( = ?auto_172872 ?auto_172873 ) ) ( not ( = ?auto_172872 ?auto_172870 ) ) ( not ( = ?auto_172872 ?auto_172869 ) ) ( not ( = ?auto_172868 ?auto_172874 ) ) ( not ( = ?auto_172868 ?auto_172871 ) ) ( not ( = ?auto_172868 ?auto_172875 ) ) ( not ( = ?auto_172868 ?auto_172872 ) ) ( CLEAR ?auto_172869 ) ( ON ?auto_172868 ?auto_172876 ) ( CLEAR ?auto_172868 ) ( HAND-EMPTY ) ( not ( = ?auto_172868 ?auto_172876 ) ) ( not ( = ?auto_172869 ?auto_172876 ) ) ( not ( = ?auto_172870 ?auto_172876 ) ) ( not ( = ?auto_172873 ?auto_172876 ) ) ( not ( = ?auto_172874 ?auto_172876 ) ) ( not ( = ?auto_172871 ?auto_172876 ) ) ( not ( = ?auto_172875 ?auto_172876 ) ) ( not ( = ?auto_172872 ?auto_172876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172868 ?auto_172876 )
      ( MAKE-3PILE ?auto_172868 ?auto_172869 ?auto_172870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172877 - BLOCK
      ?auto_172878 - BLOCK
      ?auto_172879 - BLOCK
    )
    :vars
    (
      ?auto_172884 - BLOCK
      ?auto_172880 - BLOCK
      ?auto_172882 - BLOCK
      ?auto_172885 - BLOCK
      ?auto_172881 - BLOCK
      ?auto_172883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172877 ?auto_172878 ) ) ( not ( = ?auto_172877 ?auto_172879 ) ) ( not ( = ?auto_172878 ?auto_172879 ) ) ( ON ?auto_172879 ?auto_172884 ) ( not ( = ?auto_172877 ?auto_172884 ) ) ( not ( = ?auto_172878 ?auto_172884 ) ) ( not ( = ?auto_172879 ?auto_172884 ) ) ( ON-TABLE ?auto_172880 ) ( ON ?auto_172882 ?auto_172880 ) ( ON ?auto_172885 ?auto_172882 ) ( ON ?auto_172881 ?auto_172885 ) ( ON ?auto_172884 ?auto_172881 ) ( not ( = ?auto_172880 ?auto_172882 ) ) ( not ( = ?auto_172880 ?auto_172885 ) ) ( not ( = ?auto_172880 ?auto_172881 ) ) ( not ( = ?auto_172880 ?auto_172884 ) ) ( not ( = ?auto_172880 ?auto_172879 ) ) ( not ( = ?auto_172880 ?auto_172878 ) ) ( not ( = ?auto_172882 ?auto_172885 ) ) ( not ( = ?auto_172882 ?auto_172881 ) ) ( not ( = ?auto_172882 ?auto_172884 ) ) ( not ( = ?auto_172882 ?auto_172879 ) ) ( not ( = ?auto_172882 ?auto_172878 ) ) ( not ( = ?auto_172885 ?auto_172881 ) ) ( not ( = ?auto_172885 ?auto_172884 ) ) ( not ( = ?auto_172885 ?auto_172879 ) ) ( not ( = ?auto_172885 ?auto_172878 ) ) ( not ( = ?auto_172881 ?auto_172884 ) ) ( not ( = ?auto_172881 ?auto_172879 ) ) ( not ( = ?auto_172881 ?auto_172878 ) ) ( not ( = ?auto_172877 ?auto_172880 ) ) ( not ( = ?auto_172877 ?auto_172882 ) ) ( not ( = ?auto_172877 ?auto_172885 ) ) ( not ( = ?auto_172877 ?auto_172881 ) ) ( ON ?auto_172877 ?auto_172883 ) ( CLEAR ?auto_172877 ) ( not ( = ?auto_172877 ?auto_172883 ) ) ( not ( = ?auto_172878 ?auto_172883 ) ) ( not ( = ?auto_172879 ?auto_172883 ) ) ( not ( = ?auto_172884 ?auto_172883 ) ) ( not ( = ?auto_172880 ?auto_172883 ) ) ( not ( = ?auto_172882 ?auto_172883 ) ) ( not ( = ?auto_172885 ?auto_172883 ) ) ( not ( = ?auto_172881 ?auto_172883 ) ) ( HOLDING ?auto_172878 ) ( CLEAR ?auto_172879 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172880 ?auto_172882 ?auto_172885 ?auto_172881 ?auto_172884 ?auto_172879 ?auto_172878 )
      ( MAKE-3PILE ?auto_172877 ?auto_172878 ?auto_172879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172886 - BLOCK
      ?auto_172887 - BLOCK
      ?auto_172888 - BLOCK
    )
    :vars
    (
      ?auto_172891 - BLOCK
      ?auto_172890 - BLOCK
      ?auto_172889 - BLOCK
      ?auto_172893 - BLOCK
      ?auto_172892 - BLOCK
      ?auto_172894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172886 ?auto_172887 ) ) ( not ( = ?auto_172886 ?auto_172888 ) ) ( not ( = ?auto_172887 ?auto_172888 ) ) ( ON ?auto_172888 ?auto_172891 ) ( not ( = ?auto_172886 ?auto_172891 ) ) ( not ( = ?auto_172887 ?auto_172891 ) ) ( not ( = ?auto_172888 ?auto_172891 ) ) ( ON-TABLE ?auto_172890 ) ( ON ?auto_172889 ?auto_172890 ) ( ON ?auto_172893 ?auto_172889 ) ( ON ?auto_172892 ?auto_172893 ) ( ON ?auto_172891 ?auto_172892 ) ( not ( = ?auto_172890 ?auto_172889 ) ) ( not ( = ?auto_172890 ?auto_172893 ) ) ( not ( = ?auto_172890 ?auto_172892 ) ) ( not ( = ?auto_172890 ?auto_172891 ) ) ( not ( = ?auto_172890 ?auto_172888 ) ) ( not ( = ?auto_172890 ?auto_172887 ) ) ( not ( = ?auto_172889 ?auto_172893 ) ) ( not ( = ?auto_172889 ?auto_172892 ) ) ( not ( = ?auto_172889 ?auto_172891 ) ) ( not ( = ?auto_172889 ?auto_172888 ) ) ( not ( = ?auto_172889 ?auto_172887 ) ) ( not ( = ?auto_172893 ?auto_172892 ) ) ( not ( = ?auto_172893 ?auto_172891 ) ) ( not ( = ?auto_172893 ?auto_172888 ) ) ( not ( = ?auto_172893 ?auto_172887 ) ) ( not ( = ?auto_172892 ?auto_172891 ) ) ( not ( = ?auto_172892 ?auto_172888 ) ) ( not ( = ?auto_172892 ?auto_172887 ) ) ( not ( = ?auto_172886 ?auto_172890 ) ) ( not ( = ?auto_172886 ?auto_172889 ) ) ( not ( = ?auto_172886 ?auto_172893 ) ) ( not ( = ?auto_172886 ?auto_172892 ) ) ( ON ?auto_172886 ?auto_172894 ) ( not ( = ?auto_172886 ?auto_172894 ) ) ( not ( = ?auto_172887 ?auto_172894 ) ) ( not ( = ?auto_172888 ?auto_172894 ) ) ( not ( = ?auto_172891 ?auto_172894 ) ) ( not ( = ?auto_172890 ?auto_172894 ) ) ( not ( = ?auto_172889 ?auto_172894 ) ) ( not ( = ?auto_172893 ?auto_172894 ) ) ( not ( = ?auto_172892 ?auto_172894 ) ) ( CLEAR ?auto_172888 ) ( ON ?auto_172887 ?auto_172886 ) ( CLEAR ?auto_172887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172894 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172894 ?auto_172886 )
      ( MAKE-3PILE ?auto_172886 ?auto_172887 ?auto_172888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172895 - BLOCK
      ?auto_172896 - BLOCK
      ?auto_172897 - BLOCK
    )
    :vars
    (
      ?auto_172900 - BLOCK
      ?auto_172898 - BLOCK
      ?auto_172899 - BLOCK
      ?auto_172901 - BLOCK
      ?auto_172903 - BLOCK
      ?auto_172902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172895 ?auto_172896 ) ) ( not ( = ?auto_172895 ?auto_172897 ) ) ( not ( = ?auto_172896 ?auto_172897 ) ) ( not ( = ?auto_172895 ?auto_172900 ) ) ( not ( = ?auto_172896 ?auto_172900 ) ) ( not ( = ?auto_172897 ?auto_172900 ) ) ( ON-TABLE ?auto_172898 ) ( ON ?auto_172899 ?auto_172898 ) ( ON ?auto_172901 ?auto_172899 ) ( ON ?auto_172903 ?auto_172901 ) ( ON ?auto_172900 ?auto_172903 ) ( not ( = ?auto_172898 ?auto_172899 ) ) ( not ( = ?auto_172898 ?auto_172901 ) ) ( not ( = ?auto_172898 ?auto_172903 ) ) ( not ( = ?auto_172898 ?auto_172900 ) ) ( not ( = ?auto_172898 ?auto_172897 ) ) ( not ( = ?auto_172898 ?auto_172896 ) ) ( not ( = ?auto_172899 ?auto_172901 ) ) ( not ( = ?auto_172899 ?auto_172903 ) ) ( not ( = ?auto_172899 ?auto_172900 ) ) ( not ( = ?auto_172899 ?auto_172897 ) ) ( not ( = ?auto_172899 ?auto_172896 ) ) ( not ( = ?auto_172901 ?auto_172903 ) ) ( not ( = ?auto_172901 ?auto_172900 ) ) ( not ( = ?auto_172901 ?auto_172897 ) ) ( not ( = ?auto_172901 ?auto_172896 ) ) ( not ( = ?auto_172903 ?auto_172900 ) ) ( not ( = ?auto_172903 ?auto_172897 ) ) ( not ( = ?auto_172903 ?auto_172896 ) ) ( not ( = ?auto_172895 ?auto_172898 ) ) ( not ( = ?auto_172895 ?auto_172899 ) ) ( not ( = ?auto_172895 ?auto_172901 ) ) ( not ( = ?auto_172895 ?auto_172903 ) ) ( ON ?auto_172895 ?auto_172902 ) ( not ( = ?auto_172895 ?auto_172902 ) ) ( not ( = ?auto_172896 ?auto_172902 ) ) ( not ( = ?auto_172897 ?auto_172902 ) ) ( not ( = ?auto_172900 ?auto_172902 ) ) ( not ( = ?auto_172898 ?auto_172902 ) ) ( not ( = ?auto_172899 ?auto_172902 ) ) ( not ( = ?auto_172901 ?auto_172902 ) ) ( not ( = ?auto_172903 ?auto_172902 ) ) ( ON ?auto_172896 ?auto_172895 ) ( CLEAR ?auto_172896 ) ( ON-TABLE ?auto_172902 ) ( HOLDING ?auto_172897 ) ( CLEAR ?auto_172900 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172898 ?auto_172899 ?auto_172901 ?auto_172903 ?auto_172900 ?auto_172897 )
      ( MAKE-3PILE ?auto_172895 ?auto_172896 ?auto_172897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172904 - BLOCK
      ?auto_172905 - BLOCK
      ?auto_172906 - BLOCK
    )
    :vars
    (
      ?auto_172912 - BLOCK
      ?auto_172909 - BLOCK
      ?auto_172908 - BLOCK
      ?auto_172910 - BLOCK
      ?auto_172911 - BLOCK
      ?auto_172907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172904 ?auto_172905 ) ) ( not ( = ?auto_172904 ?auto_172906 ) ) ( not ( = ?auto_172905 ?auto_172906 ) ) ( not ( = ?auto_172904 ?auto_172912 ) ) ( not ( = ?auto_172905 ?auto_172912 ) ) ( not ( = ?auto_172906 ?auto_172912 ) ) ( ON-TABLE ?auto_172909 ) ( ON ?auto_172908 ?auto_172909 ) ( ON ?auto_172910 ?auto_172908 ) ( ON ?auto_172911 ?auto_172910 ) ( ON ?auto_172912 ?auto_172911 ) ( not ( = ?auto_172909 ?auto_172908 ) ) ( not ( = ?auto_172909 ?auto_172910 ) ) ( not ( = ?auto_172909 ?auto_172911 ) ) ( not ( = ?auto_172909 ?auto_172912 ) ) ( not ( = ?auto_172909 ?auto_172906 ) ) ( not ( = ?auto_172909 ?auto_172905 ) ) ( not ( = ?auto_172908 ?auto_172910 ) ) ( not ( = ?auto_172908 ?auto_172911 ) ) ( not ( = ?auto_172908 ?auto_172912 ) ) ( not ( = ?auto_172908 ?auto_172906 ) ) ( not ( = ?auto_172908 ?auto_172905 ) ) ( not ( = ?auto_172910 ?auto_172911 ) ) ( not ( = ?auto_172910 ?auto_172912 ) ) ( not ( = ?auto_172910 ?auto_172906 ) ) ( not ( = ?auto_172910 ?auto_172905 ) ) ( not ( = ?auto_172911 ?auto_172912 ) ) ( not ( = ?auto_172911 ?auto_172906 ) ) ( not ( = ?auto_172911 ?auto_172905 ) ) ( not ( = ?auto_172904 ?auto_172909 ) ) ( not ( = ?auto_172904 ?auto_172908 ) ) ( not ( = ?auto_172904 ?auto_172910 ) ) ( not ( = ?auto_172904 ?auto_172911 ) ) ( ON ?auto_172904 ?auto_172907 ) ( not ( = ?auto_172904 ?auto_172907 ) ) ( not ( = ?auto_172905 ?auto_172907 ) ) ( not ( = ?auto_172906 ?auto_172907 ) ) ( not ( = ?auto_172912 ?auto_172907 ) ) ( not ( = ?auto_172909 ?auto_172907 ) ) ( not ( = ?auto_172908 ?auto_172907 ) ) ( not ( = ?auto_172910 ?auto_172907 ) ) ( not ( = ?auto_172911 ?auto_172907 ) ) ( ON ?auto_172905 ?auto_172904 ) ( ON-TABLE ?auto_172907 ) ( CLEAR ?auto_172912 ) ( ON ?auto_172906 ?auto_172905 ) ( CLEAR ?auto_172906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172907 ?auto_172904 ?auto_172905 )
      ( MAKE-3PILE ?auto_172904 ?auto_172905 ?auto_172906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172913 - BLOCK
      ?auto_172914 - BLOCK
      ?auto_172915 - BLOCK
    )
    :vars
    (
      ?auto_172919 - BLOCK
      ?auto_172920 - BLOCK
      ?auto_172917 - BLOCK
      ?auto_172918 - BLOCK
      ?auto_172916 - BLOCK
      ?auto_172921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172913 ?auto_172914 ) ) ( not ( = ?auto_172913 ?auto_172915 ) ) ( not ( = ?auto_172914 ?auto_172915 ) ) ( not ( = ?auto_172913 ?auto_172919 ) ) ( not ( = ?auto_172914 ?auto_172919 ) ) ( not ( = ?auto_172915 ?auto_172919 ) ) ( ON-TABLE ?auto_172920 ) ( ON ?auto_172917 ?auto_172920 ) ( ON ?auto_172918 ?auto_172917 ) ( ON ?auto_172916 ?auto_172918 ) ( not ( = ?auto_172920 ?auto_172917 ) ) ( not ( = ?auto_172920 ?auto_172918 ) ) ( not ( = ?auto_172920 ?auto_172916 ) ) ( not ( = ?auto_172920 ?auto_172919 ) ) ( not ( = ?auto_172920 ?auto_172915 ) ) ( not ( = ?auto_172920 ?auto_172914 ) ) ( not ( = ?auto_172917 ?auto_172918 ) ) ( not ( = ?auto_172917 ?auto_172916 ) ) ( not ( = ?auto_172917 ?auto_172919 ) ) ( not ( = ?auto_172917 ?auto_172915 ) ) ( not ( = ?auto_172917 ?auto_172914 ) ) ( not ( = ?auto_172918 ?auto_172916 ) ) ( not ( = ?auto_172918 ?auto_172919 ) ) ( not ( = ?auto_172918 ?auto_172915 ) ) ( not ( = ?auto_172918 ?auto_172914 ) ) ( not ( = ?auto_172916 ?auto_172919 ) ) ( not ( = ?auto_172916 ?auto_172915 ) ) ( not ( = ?auto_172916 ?auto_172914 ) ) ( not ( = ?auto_172913 ?auto_172920 ) ) ( not ( = ?auto_172913 ?auto_172917 ) ) ( not ( = ?auto_172913 ?auto_172918 ) ) ( not ( = ?auto_172913 ?auto_172916 ) ) ( ON ?auto_172913 ?auto_172921 ) ( not ( = ?auto_172913 ?auto_172921 ) ) ( not ( = ?auto_172914 ?auto_172921 ) ) ( not ( = ?auto_172915 ?auto_172921 ) ) ( not ( = ?auto_172919 ?auto_172921 ) ) ( not ( = ?auto_172920 ?auto_172921 ) ) ( not ( = ?auto_172917 ?auto_172921 ) ) ( not ( = ?auto_172918 ?auto_172921 ) ) ( not ( = ?auto_172916 ?auto_172921 ) ) ( ON ?auto_172914 ?auto_172913 ) ( ON-TABLE ?auto_172921 ) ( ON ?auto_172915 ?auto_172914 ) ( CLEAR ?auto_172915 ) ( HOLDING ?auto_172919 ) ( CLEAR ?auto_172916 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172920 ?auto_172917 ?auto_172918 ?auto_172916 ?auto_172919 )
      ( MAKE-3PILE ?auto_172913 ?auto_172914 ?auto_172915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172922 - BLOCK
      ?auto_172923 - BLOCK
      ?auto_172924 - BLOCK
    )
    :vars
    (
      ?auto_172929 - BLOCK
      ?auto_172928 - BLOCK
      ?auto_172927 - BLOCK
      ?auto_172926 - BLOCK
      ?auto_172930 - BLOCK
      ?auto_172925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172922 ?auto_172923 ) ) ( not ( = ?auto_172922 ?auto_172924 ) ) ( not ( = ?auto_172923 ?auto_172924 ) ) ( not ( = ?auto_172922 ?auto_172929 ) ) ( not ( = ?auto_172923 ?auto_172929 ) ) ( not ( = ?auto_172924 ?auto_172929 ) ) ( ON-TABLE ?auto_172928 ) ( ON ?auto_172927 ?auto_172928 ) ( ON ?auto_172926 ?auto_172927 ) ( ON ?auto_172930 ?auto_172926 ) ( not ( = ?auto_172928 ?auto_172927 ) ) ( not ( = ?auto_172928 ?auto_172926 ) ) ( not ( = ?auto_172928 ?auto_172930 ) ) ( not ( = ?auto_172928 ?auto_172929 ) ) ( not ( = ?auto_172928 ?auto_172924 ) ) ( not ( = ?auto_172928 ?auto_172923 ) ) ( not ( = ?auto_172927 ?auto_172926 ) ) ( not ( = ?auto_172927 ?auto_172930 ) ) ( not ( = ?auto_172927 ?auto_172929 ) ) ( not ( = ?auto_172927 ?auto_172924 ) ) ( not ( = ?auto_172927 ?auto_172923 ) ) ( not ( = ?auto_172926 ?auto_172930 ) ) ( not ( = ?auto_172926 ?auto_172929 ) ) ( not ( = ?auto_172926 ?auto_172924 ) ) ( not ( = ?auto_172926 ?auto_172923 ) ) ( not ( = ?auto_172930 ?auto_172929 ) ) ( not ( = ?auto_172930 ?auto_172924 ) ) ( not ( = ?auto_172930 ?auto_172923 ) ) ( not ( = ?auto_172922 ?auto_172928 ) ) ( not ( = ?auto_172922 ?auto_172927 ) ) ( not ( = ?auto_172922 ?auto_172926 ) ) ( not ( = ?auto_172922 ?auto_172930 ) ) ( ON ?auto_172922 ?auto_172925 ) ( not ( = ?auto_172922 ?auto_172925 ) ) ( not ( = ?auto_172923 ?auto_172925 ) ) ( not ( = ?auto_172924 ?auto_172925 ) ) ( not ( = ?auto_172929 ?auto_172925 ) ) ( not ( = ?auto_172928 ?auto_172925 ) ) ( not ( = ?auto_172927 ?auto_172925 ) ) ( not ( = ?auto_172926 ?auto_172925 ) ) ( not ( = ?auto_172930 ?auto_172925 ) ) ( ON ?auto_172923 ?auto_172922 ) ( ON-TABLE ?auto_172925 ) ( ON ?auto_172924 ?auto_172923 ) ( CLEAR ?auto_172930 ) ( ON ?auto_172929 ?auto_172924 ) ( CLEAR ?auto_172929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172925 ?auto_172922 ?auto_172923 ?auto_172924 )
      ( MAKE-3PILE ?auto_172922 ?auto_172923 ?auto_172924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172931 - BLOCK
      ?auto_172932 - BLOCK
      ?auto_172933 - BLOCK
    )
    :vars
    (
      ?auto_172938 - BLOCK
      ?auto_172935 - BLOCK
      ?auto_172937 - BLOCK
      ?auto_172934 - BLOCK
      ?auto_172939 - BLOCK
      ?auto_172936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172931 ?auto_172932 ) ) ( not ( = ?auto_172931 ?auto_172933 ) ) ( not ( = ?auto_172932 ?auto_172933 ) ) ( not ( = ?auto_172931 ?auto_172938 ) ) ( not ( = ?auto_172932 ?auto_172938 ) ) ( not ( = ?auto_172933 ?auto_172938 ) ) ( ON-TABLE ?auto_172935 ) ( ON ?auto_172937 ?auto_172935 ) ( ON ?auto_172934 ?auto_172937 ) ( not ( = ?auto_172935 ?auto_172937 ) ) ( not ( = ?auto_172935 ?auto_172934 ) ) ( not ( = ?auto_172935 ?auto_172939 ) ) ( not ( = ?auto_172935 ?auto_172938 ) ) ( not ( = ?auto_172935 ?auto_172933 ) ) ( not ( = ?auto_172935 ?auto_172932 ) ) ( not ( = ?auto_172937 ?auto_172934 ) ) ( not ( = ?auto_172937 ?auto_172939 ) ) ( not ( = ?auto_172937 ?auto_172938 ) ) ( not ( = ?auto_172937 ?auto_172933 ) ) ( not ( = ?auto_172937 ?auto_172932 ) ) ( not ( = ?auto_172934 ?auto_172939 ) ) ( not ( = ?auto_172934 ?auto_172938 ) ) ( not ( = ?auto_172934 ?auto_172933 ) ) ( not ( = ?auto_172934 ?auto_172932 ) ) ( not ( = ?auto_172939 ?auto_172938 ) ) ( not ( = ?auto_172939 ?auto_172933 ) ) ( not ( = ?auto_172939 ?auto_172932 ) ) ( not ( = ?auto_172931 ?auto_172935 ) ) ( not ( = ?auto_172931 ?auto_172937 ) ) ( not ( = ?auto_172931 ?auto_172934 ) ) ( not ( = ?auto_172931 ?auto_172939 ) ) ( ON ?auto_172931 ?auto_172936 ) ( not ( = ?auto_172931 ?auto_172936 ) ) ( not ( = ?auto_172932 ?auto_172936 ) ) ( not ( = ?auto_172933 ?auto_172936 ) ) ( not ( = ?auto_172938 ?auto_172936 ) ) ( not ( = ?auto_172935 ?auto_172936 ) ) ( not ( = ?auto_172937 ?auto_172936 ) ) ( not ( = ?auto_172934 ?auto_172936 ) ) ( not ( = ?auto_172939 ?auto_172936 ) ) ( ON ?auto_172932 ?auto_172931 ) ( ON-TABLE ?auto_172936 ) ( ON ?auto_172933 ?auto_172932 ) ( ON ?auto_172938 ?auto_172933 ) ( CLEAR ?auto_172938 ) ( HOLDING ?auto_172939 ) ( CLEAR ?auto_172934 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172935 ?auto_172937 ?auto_172934 ?auto_172939 )
      ( MAKE-3PILE ?auto_172931 ?auto_172932 ?auto_172933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172940 - BLOCK
      ?auto_172941 - BLOCK
      ?auto_172942 - BLOCK
    )
    :vars
    (
      ?auto_172943 - BLOCK
      ?auto_172947 - BLOCK
      ?auto_172946 - BLOCK
      ?auto_172945 - BLOCK
      ?auto_172944 - BLOCK
      ?auto_172948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172940 ?auto_172941 ) ) ( not ( = ?auto_172940 ?auto_172942 ) ) ( not ( = ?auto_172941 ?auto_172942 ) ) ( not ( = ?auto_172940 ?auto_172943 ) ) ( not ( = ?auto_172941 ?auto_172943 ) ) ( not ( = ?auto_172942 ?auto_172943 ) ) ( ON-TABLE ?auto_172947 ) ( ON ?auto_172946 ?auto_172947 ) ( ON ?auto_172945 ?auto_172946 ) ( not ( = ?auto_172947 ?auto_172946 ) ) ( not ( = ?auto_172947 ?auto_172945 ) ) ( not ( = ?auto_172947 ?auto_172944 ) ) ( not ( = ?auto_172947 ?auto_172943 ) ) ( not ( = ?auto_172947 ?auto_172942 ) ) ( not ( = ?auto_172947 ?auto_172941 ) ) ( not ( = ?auto_172946 ?auto_172945 ) ) ( not ( = ?auto_172946 ?auto_172944 ) ) ( not ( = ?auto_172946 ?auto_172943 ) ) ( not ( = ?auto_172946 ?auto_172942 ) ) ( not ( = ?auto_172946 ?auto_172941 ) ) ( not ( = ?auto_172945 ?auto_172944 ) ) ( not ( = ?auto_172945 ?auto_172943 ) ) ( not ( = ?auto_172945 ?auto_172942 ) ) ( not ( = ?auto_172945 ?auto_172941 ) ) ( not ( = ?auto_172944 ?auto_172943 ) ) ( not ( = ?auto_172944 ?auto_172942 ) ) ( not ( = ?auto_172944 ?auto_172941 ) ) ( not ( = ?auto_172940 ?auto_172947 ) ) ( not ( = ?auto_172940 ?auto_172946 ) ) ( not ( = ?auto_172940 ?auto_172945 ) ) ( not ( = ?auto_172940 ?auto_172944 ) ) ( ON ?auto_172940 ?auto_172948 ) ( not ( = ?auto_172940 ?auto_172948 ) ) ( not ( = ?auto_172941 ?auto_172948 ) ) ( not ( = ?auto_172942 ?auto_172948 ) ) ( not ( = ?auto_172943 ?auto_172948 ) ) ( not ( = ?auto_172947 ?auto_172948 ) ) ( not ( = ?auto_172946 ?auto_172948 ) ) ( not ( = ?auto_172945 ?auto_172948 ) ) ( not ( = ?auto_172944 ?auto_172948 ) ) ( ON ?auto_172941 ?auto_172940 ) ( ON-TABLE ?auto_172948 ) ( ON ?auto_172942 ?auto_172941 ) ( ON ?auto_172943 ?auto_172942 ) ( CLEAR ?auto_172945 ) ( ON ?auto_172944 ?auto_172943 ) ( CLEAR ?auto_172944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172948 ?auto_172940 ?auto_172941 ?auto_172942 ?auto_172943 )
      ( MAKE-3PILE ?auto_172940 ?auto_172941 ?auto_172942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172949 - BLOCK
      ?auto_172950 - BLOCK
      ?auto_172951 - BLOCK
    )
    :vars
    (
      ?auto_172952 - BLOCK
      ?auto_172953 - BLOCK
      ?auto_172956 - BLOCK
      ?auto_172955 - BLOCK
      ?auto_172954 - BLOCK
      ?auto_172957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172949 ?auto_172950 ) ) ( not ( = ?auto_172949 ?auto_172951 ) ) ( not ( = ?auto_172950 ?auto_172951 ) ) ( not ( = ?auto_172949 ?auto_172952 ) ) ( not ( = ?auto_172950 ?auto_172952 ) ) ( not ( = ?auto_172951 ?auto_172952 ) ) ( ON-TABLE ?auto_172953 ) ( ON ?auto_172956 ?auto_172953 ) ( not ( = ?auto_172953 ?auto_172956 ) ) ( not ( = ?auto_172953 ?auto_172955 ) ) ( not ( = ?auto_172953 ?auto_172954 ) ) ( not ( = ?auto_172953 ?auto_172952 ) ) ( not ( = ?auto_172953 ?auto_172951 ) ) ( not ( = ?auto_172953 ?auto_172950 ) ) ( not ( = ?auto_172956 ?auto_172955 ) ) ( not ( = ?auto_172956 ?auto_172954 ) ) ( not ( = ?auto_172956 ?auto_172952 ) ) ( not ( = ?auto_172956 ?auto_172951 ) ) ( not ( = ?auto_172956 ?auto_172950 ) ) ( not ( = ?auto_172955 ?auto_172954 ) ) ( not ( = ?auto_172955 ?auto_172952 ) ) ( not ( = ?auto_172955 ?auto_172951 ) ) ( not ( = ?auto_172955 ?auto_172950 ) ) ( not ( = ?auto_172954 ?auto_172952 ) ) ( not ( = ?auto_172954 ?auto_172951 ) ) ( not ( = ?auto_172954 ?auto_172950 ) ) ( not ( = ?auto_172949 ?auto_172953 ) ) ( not ( = ?auto_172949 ?auto_172956 ) ) ( not ( = ?auto_172949 ?auto_172955 ) ) ( not ( = ?auto_172949 ?auto_172954 ) ) ( ON ?auto_172949 ?auto_172957 ) ( not ( = ?auto_172949 ?auto_172957 ) ) ( not ( = ?auto_172950 ?auto_172957 ) ) ( not ( = ?auto_172951 ?auto_172957 ) ) ( not ( = ?auto_172952 ?auto_172957 ) ) ( not ( = ?auto_172953 ?auto_172957 ) ) ( not ( = ?auto_172956 ?auto_172957 ) ) ( not ( = ?auto_172955 ?auto_172957 ) ) ( not ( = ?auto_172954 ?auto_172957 ) ) ( ON ?auto_172950 ?auto_172949 ) ( ON-TABLE ?auto_172957 ) ( ON ?auto_172951 ?auto_172950 ) ( ON ?auto_172952 ?auto_172951 ) ( ON ?auto_172954 ?auto_172952 ) ( CLEAR ?auto_172954 ) ( HOLDING ?auto_172955 ) ( CLEAR ?auto_172956 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172953 ?auto_172956 ?auto_172955 )
      ( MAKE-3PILE ?auto_172949 ?auto_172950 ?auto_172951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172958 - BLOCK
      ?auto_172959 - BLOCK
      ?auto_172960 - BLOCK
    )
    :vars
    (
      ?auto_172964 - BLOCK
      ?auto_172963 - BLOCK
      ?auto_172965 - BLOCK
      ?auto_172962 - BLOCK
      ?auto_172961 - BLOCK
      ?auto_172966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172958 ?auto_172959 ) ) ( not ( = ?auto_172958 ?auto_172960 ) ) ( not ( = ?auto_172959 ?auto_172960 ) ) ( not ( = ?auto_172958 ?auto_172964 ) ) ( not ( = ?auto_172959 ?auto_172964 ) ) ( not ( = ?auto_172960 ?auto_172964 ) ) ( ON-TABLE ?auto_172963 ) ( ON ?auto_172965 ?auto_172963 ) ( not ( = ?auto_172963 ?auto_172965 ) ) ( not ( = ?auto_172963 ?auto_172962 ) ) ( not ( = ?auto_172963 ?auto_172961 ) ) ( not ( = ?auto_172963 ?auto_172964 ) ) ( not ( = ?auto_172963 ?auto_172960 ) ) ( not ( = ?auto_172963 ?auto_172959 ) ) ( not ( = ?auto_172965 ?auto_172962 ) ) ( not ( = ?auto_172965 ?auto_172961 ) ) ( not ( = ?auto_172965 ?auto_172964 ) ) ( not ( = ?auto_172965 ?auto_172960 ) ) ( not ( = ?auto_172965 ?auto_172959 ) ) ( not ( = ?auto_172962 ?auto_172961 ) ) ( not ( = ?auto_172962 ?auto_172964 ) ) ( not ( = ?auto_172962 ?auto_172960 ) ) ( not ( = ?auto_172962 ?auto_172959 ) ) ( not ( = ?auto_172961 ?auto_172964 ) ) ( not ( = ?auto_172961 ?auto_172960 ) ) ( not ( = ?auto_172961 ?auto_172959 ) ) ( not ( = ?auto_172958 ?auto_172963 ) ) ( not ( = ?auto_172958 ?auto_172965 ) ) ( not ( = ?auto_172958 ?auto_172962 ) ) ( not ( = ?auto_172958 ?auto_172961 ) ) ( ON ?auto_172958 ?auto_172966 ) ( not ( = ?auto_172958 ?auto_172966 ) ) ( not ( = ?auto_172959 ?auto_172966 ) ) ( not ( = ?auto_172960 ?auto_172966 ) ) ( not ( = ?auto_172964 ?auto_172966 ) ) ( not ( = ?auto_172963 ?auto_172966 ) ) ( not ( = ?auto_172965 ?auto_172966 ) ) ( not ( = ?auto_172962 ?auto_172966 ) ) ( not ( = ?auto_172961 ?auto_172966 ) ) ( ON ?auto_172959 ?auto_172958 ) ( ON-TABLE ?auto_172966 ) ( ON ?auto_172960 ?auto_172959 ) ( ON ?auto_172964 ?auto_172960 ) ( ON ?auto_172961 ?auto_172964 ) ( CLEAR ?auto_172965 ) ( ON ?auto_172962 ?auto_172961 ) ( CLEAR ?auto_172962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172966 ?auto_172958 ?auto_172959 ?auto_172960 ?auto_172964 ?auto_172961 )
      ( MAKE-3PILE ?auto_172958 ?auto_172959 ?auto_172960 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172967 - BLOCK
      ?auto_172968 - BLOCK
      ?auto_172969 - BLOCK
    )
    :vars
    (
      ?auto_172970 - BLOCK
      ?auto_172975 - BLOCK
      ?auto_172971 - BLOCK
      ?auto_172972 - BLOCK
      ?auto_172974 - BLOCK
      ?auto_172973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172967 ?auto_172968 ) ) ( not ( = ?auto_172967 ?auto_172969 ) ) ( not ( = ?auto_172968 ?auto_172969 ) ) ( not ( = ?auto_172967 ?auto_172970 ) ) ( not ( = ?auto_172968 ?auto_172970 ) ) ( not ( = ?auto_172969 ?auto_172970 ) ) ( ON-TABLE ?auto_172975 ) ( not ( = ?auto_172975 ?auto_172971 ) ) ( not ( = ?auto_172975 ?auto_172972 ) ) ( not ( = ?auto_172975 ?auto_172974 ) ) ( not ( = ?auto_172975 ?auto_172970 ) ) ( not ( = ?auto_172975 ?auto_172969 ) ) ( not ( = ?auto_172975 ?auto_172968 ) ) ( not ( = ?auto_172971 ?auto_172972 ) ) ( not ( = ?auto_172971 ?auto_172974 ) ) ( not ( = ?auto_172971 ?auto_172970 ) ) ( not ( = ?auto_172971 ?auto_172969 ) ) ( not ( = ?auto_172971 ?auto_172968 ) ) ( not ( = ?auto_172972 ?auto_172974 ) ) ( not ( = ?auto_172972 ?auto_172970 ) ) ( not ( = ?auto_172972 ?auto_172969 ) ) ( not ( = ?auto_172972 ?auto_172968 ) ) ( not ( = ?auto_172974 ?auto_172970 ) ) ( not ( = ?auto_172974 ?auto_172969 ) ) ( not ( = ?auto_172974 ?auto_172968 ) ) ( not ( = ?auto_172967 ?auto_172975 ) ) ( not ( = ?auto_172967 ?auto_172971 ) ) ( not ( = ?auto_172967 ?auto_172972 ) ) ( not ( = ?auto_172967 ?auto_172974 ) ) ( ON ?auto_172967 ?auto_172973 ) ( not ( = ?auto_172967 ?auto_172973 ) ) ( not ( = ?auto_172968 ?auto_172973 ) ) ( not ( = ?auto_172969 ?auto_172973 ) ) ( not ( = ?auto_172970 ?auto_172973 ) ) ( not ( = ?auto_172975 ?auto_172973 ) ) ( not ( = ?auto_172971 ?auto_172973 ) ) ( not ( = ?auto_172972 ?auto_172973 ) ) ( not ( = ?auto_172974 ?auto_172973 ) ) ( ON ?auto_172968 ?auto_172967 ) ( ON-TABLE ?auto_172973 ) ( ON ?auto_172969 ?auto_172968 ) ( ON ?auto_172970 ?auto_172969 ) ( ON ?auto_172974 ?auto_172970 ) ( ON ?auto_172972 ?auto_172974 ) ( CLEAR ?auto_172972 ) ( HOLDING ?auto_172971 ) ( CLEAR ?auto_172975 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172975 ?auto_172971 )
      ( MAKE-3PILE ?auto_172967 ?auto_172968 ?auto_172969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172976 - BLOCK
      ?auto_172977 - BLOCK
      ?auto_172978 - BLOCK
    )
    :vars
    (
      ?auto_172980 - BLOCK
      ?auto_172979 - BLOCK
      ?auto_172982 - BLOCK
      ?auto_172983 - BLOCK
      ?auto_172981 - BLOCK
      ?auto_172984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172976 ?auto_172977 ) ) ( not ( = ?auto_172976 ?auto_172978 ) ) ( not ( = ?auto_172977 ?auto_172978 ) ) ( not ( = ?auto_172976 ?auto_172980 ) ) ( not ( = ?auto_172977 ?auto_172980 ) ) ( not ( = ?auto_172978 ?auto_172980 ) ) ( ON-TABLE ?auto_172979 ) ( not ( = ?auto_172979 ?auto_172982 ) ) ( not ( = ?auto_172979 ?auto_172983 ) ) ( not ( = ?auto_172979 ?auto_172981 ) ) ( not ( = ?auto_172979 ?auto_172980 ) ) ( not ( = ?auto_172979 ?auto_172978 ) ) ( not ( = ?auto_172979 ?auto_172977 ) ) ( not ( = ?auto_172982 ?auto_172983 ) ) ( not ( = ?auto_172982 ?auto_172981 ) ) ( not ( = ?auto_172982 ?auto_172980 ) ) ( not ( = ?auto_172982 ?auto_172978 ) ) ( not ( = ?auto_172982 ?auto_172977 ) ) ( not ( = ?auto_172983 ?auto_172981 ) ) ( not ( = ?auto_172983 ?auto_172980 ) ) ( not ( = ?auto_172983 ?auto_172978 ) ) ( not ( = ?auto_172983 ?auto_172977 ) ) ( not ( = ?auto_172981 ?auto_172980 ) ) ( not ( = ?auto_172981 ?auto_172978 ) ) ( not ( = ?auto_172981 ?auto_172977 ) ) ( not ( = ?auto_172976 ?auto_172979 ) ) ( not ( = ?auto_172976 ?auto_172982 ) ) ( not ( = ?auto_172976 ?auto_172983 ) ) ( not ( = ?auto_172976 ?auto_172981 ) ) ( ON ?auto_172976 ?auto_172984 ) ( not ( = ?auto_172976 ?auto_172984 ) ) ( not ( = ?auto_172977 ?auto_172984 ) ) ( not ( = ?auto_172978 ?auto_172984 ) ) ( not ( = ?auto_172980 ?auto_172984 ) ) ( not ( = ?auto_172979 ?auto_172984 ) ) ( not ( = ?auto_172982 ?auto_172984 ) ) ( not ( = ?auto_172983 ?auto_172984 ) ) ( not ( = ?auto_172981 ?auto_172984 ) ) ( ON ?auto_172977 ?auto_172976 ) ( ON-TABLE ?auto_172984 ) ( ON ?auto_172978 ?auto_172977 ) ( ON ?auto_172980 ?auto_172978 ) ( ON ?auto_172981 ?auto_172980 ) ( ON ?auto_172983 ?auto_172981 ) ( CLEAR ?auto_172979 ) ( ON ?auto_172982 ?auto_172983 ) ( CLEAR ?auto_172982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172984 ?auto_172976 ?auto_172977 ?auto_172978 ?auto_172980 ?auto_172981 ?auto_172983 )
      ( MAKE-3PILE ?auto_172976 ?auto_172977 ?auto_172978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172985 - BLOCK
      ?auto_172986 - BLOCK
      ?auto_172987 - BLOCK
    )
    :vars
    (
      ?auto_172991 - BLOCK
      ?auto_172992 - BLOCK
      ?auto_172988 - BLOCK
      ?auto_172989 - BLOCK
      ?auto_172990 - BLOCK
      ?auto_172993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172985 ?auto_172986 ) ) ( not ( = ?auto_172985 ?auto_172987 ) ) ( not ( = ?auto_172986 ?auto_172987 ) ) ( not ( = ?auto_172985 ?auto_172991 ) ) ( not ( = ?auto_172986 ?auto_172991 ) ) ( not ( = ?auto_172987 ?auto_172991 ) ) ( not ( = ?auto_172992 ?auto_172988 ) ) ( not ( = ?auto_172992 ?auto_172989 ) ) ( not ( = ?auto_172992 ?auto_172990 ) ) ( not ( = ?auto_172992 ?auto_172991 ) ) ( not ( = ?auto_172992 ?auto_172987 ) ) ( not ( = ?auto_172992 ?auto_172986 ) ) ( not ( = ?auto_172988 ?auto_172989 ) ) ( not ( = ?auto_172988 ?auto_172990 ) ) ( not ( = ?auto_172988 ?auto_172991 ) ) ( not ( = ?auto_172988 ?auto_172987 ) ) ( not ( = ?auto_172988 ?auto_172986 ) ) ( not ( = ?auto_172989 ?auto_172990 ) ) ( not ( = ?auto_172989 ?auto_172991 ) ) ( not ( = ?auto_172989 ?auto_172987 ) ) ( not ( = ?auto_172989 ?auto_172986 ) ) ( not ( = ?auto_172990 ?auto_172991 ) ) ( not ( = ?auto_172990 ?auto_172987 ) ) ( not ( = ?auto_172990 ?auto_172986 ) ) ( not ( = ?auto_172985 ?auto_172992 ) ) ( not ( = ?auto_172985 ?auto_172988 ) ) ( not ( = ?auto_172985 ?auto_172989 ) ) ( not ( = ?auto_172985 ?auto_172990 ) ) ( ON ?auto_172985 ?auto_172993 ) ( not ( = ?auto_172985 ?auto_172993 ) ) ( not ( = ?auto_172986 ?auto_172993 ) ) ( not ( = ?auto_172987 ?auto_172993 ) ) ( not ( = ?auto_172991 ?auto_172993 ) ) ( not ( = ?auto_172992 ?auto_172993 ) ) ( not ( = ?auto_172988 ?auto_172993 ) ) ( not ( = ?auto_172989 ?auto_172993 ) ) ( not ( = ?auto_172990 ?auto_172993 ) ) ( ON ?auto_172986 ?auto_172985 ) ( ON-TABLE ?auto_172993 ) ( ON ?auto_172987 ?auto_172986 ) ( ON ?auto_172991 ?auto_172987 ) ( ON ?auto_172990 ?auto_172991 ) ( ON ?auto_172989 ?auto_172990 ) ( ON ?auto_172988 ?auto_172989 ) ( CLEAR ?auto_172988 ) ( HOLDING ?auto_172992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172992 )
      ( MAKE-3PILE ?auto_172985 ?auto_172986 ?auto_172987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_172994 - BLOCK
      ?auto_172995 - BLOCK
      ?auto_172996 - BLOCK
    )
    :vars
    (
      ?auto_172997 - BLOCK
      ?auto_173002 - BLOCK
      ?auto_172998 - BLOCK
      ?auto_173001 - BLOCK
      ?auto_173000 - BLOCK
      ?auto_172999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172994 ?auto_172995 ) ) ( not ( = ?auto_172994 ?auto_172996 ) ) ( not ( = ?auto_172995 ?auto_172996 ) ) ( not ( = ?auto_172994 ?auto_172997 ) ) ( not ( = ?auto_172995 ?auto_172997 ) ) ( not ( = ?auto_172996 ?auto_172997 ) ) ( not ( = ?auto_173002 ?auto_172998 ) ) ( not ( = ?auto_173002 ?auto_173001 ) ) ( not ( = ?auto_173002 ?auto_173000 ) ) ( not ( = ?auto_173002 ?auto_172997 ) ) ( not ( = ?auto_173002 ?auto_172996 ) ) ( not ( = ?auto_173002 ?auto_172995 ) ) ( not ( = ?auto_172998 ?auto_173001 ) ) ( not ( = ?auto_172998 ?auto_173000 ) ) ( not ( = ?auto_172998 ?auto_172997 ) ) ( not ( = ?auto_172998 ?auto_172996 ) ) ( not ( = ?auto_172998 ?auto_172995 ) ) ( not ( = ?auto_173001 ?auto_173000 ) ) ( not ( = ?auto_173001 ?auto_172997 ) ) ( not ( = ?auto_173001 ?auto_172996 ) ) ( not ( = ?auto_173001 ?auto_172995 ) ) ( not ( = ?auto_173000 ?auto_172997 ) ) ( not ( = ?auto_173000 ?auto_172996 ) ) ( not ( = ?auto_173000 ?auto_172995 ) ) ( not ( = ?auto_172994 ?auto_173002 ) ) ( not ( = ?auto_172994 ?auto_172998 ) ) ( not ( = ?auto_172994 ?auto_173001 ) ) ( not ( = ?auto_172994 ?auto_173000 ) ) ( ON ?auto_172994 ?auto_172999 ) ( not ( = ?auto_172994 ?auto_172999 ) ) ( not ( = ?auto_172995 ?auto_172999 ) ) ( not ( = ?auto_172996 ?auto_172999 ) ) ( not ( = ?auto_172997 ?auto_172999 ) ) ( not ( = ?auto_173002 ?auto_172999 ) ) ( not ( = ?auto_172998 ?auto_172999 ) ) ( not ( = ?auto_173001 ?auto_172999 ) ) ( not ( = ?auto_173000 ?auto_172999 ) ) ( ON ?auto_172995 ?auto_172994 ) ( ON-TABLE ?auto_172999 ) ( ON ?auto_172996 ?auto_172995 ) ( ON ?auto_172997 ?auto_172996 ) ( ON ?auto_173000 ?auto_172997 ) ( ON ?auto_173001 ?auto_173000 ) ( ON ?auto_172998 ?auto_173001 ) ( ON ?auto_173002 ?auto_172998 ) ( CLEAR ?auto_173002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172999 ?auto_172994 ?auto_172995 ?auto_172996 ?auto_172997 ?auto_173000 ?auto_173001 ?auto_172998 )
      ( MAKE-3PILE ?auto_172994 ?auto_172995 ?auto_172996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173007 - BLOCK
      ?auto_173008 - BLOCK
      ?auto_173009 - BLOCK
      ?auto_173010 - BLOCK
    )
    :vars
    (
      ?auto_173011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173011 ?auto_173010 ) ( CLEAR ?auto_173011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173007 ) ( ON ?auto_173008 ?auto_173007 ) ( ON ?auto_173009 ?auto_173008 ) ( ON ?auto_173010 ?auto_173009 ) ( not ( = ?auto_173007 ?auto_173008 ) ) ( not ( = ?auto_173007 ?auto_173009 ) ) ( not ( = ?auto_173007 ?auto_173010 ) ) ( not ( = ?auto_173007 ?auto_173011 ) ) ( not ( = ?auto_173008 ?auto_173009 ) ) ( not ( = ?auto_173008 ?auto_173010 ) ) ( not ( = ?auto_173008 ?auto_173011 ) ) ( not ( = ?auto_173009 ?auto_173010 ) ) ( not ( = ?auto_173009 ?auto_173011 ) ) ( not ( = ?auto_173010 ?auto_173011 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173011 ?auto_173010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173012 - BLOCK
      ?auto_173013 - BLOCK
      ?auto_173014 - BLOCK
      ?auto_173015 - BLOCK
    )
    :vars
    (
      ?auto_173016 - BLOCK
      ?auto_173017 - BLOCK
      ?auto_173018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173016 ?auto_173015 ) ( CLEAR ?auto_173016 ) ( ON-TABLE ?auto_173012 ) ( ON ?auto_173013 ?auto_173012 ) ( ON ?auto_173014 ?auto_173013 ) ( ON ?auto_173015 ?auto_173014 ) ( not ( = ?auto_173012 ?auto_173013 ) ) ( not ( = ?auto_173012 ?auto_173014 ) ) ( not ( = ?auto_173012 ?auto_173015 ) ) ( not ( = ?auto_173012 ?auto_173016 ) ) ( not ( = ?auto_173013 ?auto_173014 ) ) ( not ( = ?auto_173013 ?auto_173015 ) ) ( not ( = ?auto_173013 ?auto_173016 ) ) ( not ( = ?auto_173014 ?auto_173015 ) ) ( not ( = ?auto_173014 ?auto_173016 ) ) ( not ( = ?auto_173015 ?auto_173016 ) ) ( HOLDING ?auto_173017 ) ( CLEAR ?auto_173018 ) ( not ( = ?auto_173012 ?auto_173017 ) ) ( not ( = ?auto_173012 ?auto_173018 ) ) ( not ( = ?auto_173013 ?auto_173017 ) ) ( not ( = ?auto_173013 ?auto_173018 ) ) ( not ( = ?auto_173014 ?auto_173017 ) ) ( not ( = ?auto_173014 ?auto_173018 ) ) ( not ( = ?auto_173015 ?auto_173017 ) ) ( not ( = ?auto_173015 ?auto_173018 ) ) ( not ( = ?auto_173016 ?auto_173017 ) ) ( not ( = ?auto_173016 ?auto_173018 ) ) ( not ( = ?auto_173017 ?auto_173018 ) ) )
    :subtasks
    ( ( !STACK ?auto_173017 ?auto_173018 )
      ( MAKE-4PILE ?auto_173012 ?auto_173013 ?auto_173014 ?auto_173015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173019 - BLOCK
      ?auto_173020 - BLOCK
      ?auto_173021 - BLOCK
      ?auto_173022 - BLOCK
    )
    :vars
    (
      ?auto_173025 - BLOCK
      ?auto_173023 - BLOCK
      ?auto_173024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173025 ?auto_173022 ) ( ON-TABLE ?auto_173019 ) ( ON ?auto_173020 ?auto_173019 ) ( ON ?auto_173021 ?auto_173020 ) ( ON ?auto_173022 ?auto_173021 ) ( not ( = ?auto_173019 ?auto_173020 ) ) ( not ( = ?auto_173019 ?auto_173021 ) ) ( not ( = ?auto_173019 ?auto_173022 ) ) ( not ( = ?auto_173019 ?auto_173025 ) ) ( not ( = ?auto_173020 ?auto_173021 ) ) ( not ( = ?auto_173020 ?auto_173022 ) ) ( not ( = ?auto_173020 ?auto_173025 ) ) ( not ( = ?auto_173021 ?auto_173022 ) ) ( not ( = ?auto_173021 ?auto_173025 ) ) ( not ( = ?auto_173022 ?auto_173025 ) ) ( CLEAR ?auto_173023 ) ( not ( = ?auto_173019 ?auto_173024 ) ) ( not ( = ?auto_173019 ?auto_173023 ) ) ( not ( = ?auto_173020 ?auto_173024 ) ) ( not ( = ?auto_173020 ?auto_173023 ) ) ( not ( = ?auto_173021 ?auto_173024 ) ) ( not ( = ?auto_173021 ?auto_173023 ) ) ( not ( = ?auto_173022 ?auto_173024 ) ) ( not ( = ?auto_173022 ?auto_173023 ) ) ( not ( = ?auto_173025 ?auto_173024 ) ) ( not ( = ?auto_173025 ?auto_173023 ) ) ( not ( = ?auto_173024 ?auto_173023 ) ) ( ON ?auto_173024 ?auto_173025 ) ( CLEAR ?auto_173024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173019 ?auto_173020 ?auto_173021 ?auto_173022 ?auto_173025 )
      ( MAKE-4PILE ?auto_173019 ?auto_173020 ?auto_173021 ?auto_173022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173026 - BLOCK
      ?auto_173027 - BLOCK
      ?auto_173028 - BLOCK
      ?auto_173029 - BLOCK
    )
    :vars
    (
      ?auto_173031 - BLOCK
      ?auto_173032 - BLOCK
      ?auto_173030 - BLOCK
      ?auto_173033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173031 ?auto_173029 ) ( ON-TABLE ?auto_173026 ) ( ON ?auto_173027 ?auto_173026 ) ( ON ?auto_173028 ?auto_173027 ) ( ON ?auto_173029 ?auto_173028 ) ( not ( = ?auto_173026 ?auto_173027 ) ) ( not ( = ?auto_173026 ?auto_173028 ) ) ( not ( = ?auto_173026 ?auto_173029 ) ) ( not ( = ?auto_173026 ?auto_173031 ) ) ( not ( = ?auto_173027 ?auto_173028 ) ) ( not ( = ?auto_173027 ?auto_173029 ) ) ( not ( = ?auto_173027 ?auto_173031 ) ) ( not ( = ?auto_173028 ?auto_173029 ) ) ( not ( = ?auto_173028 ?auto_173031 ) ) ( not ( = ?auto_173029 ?auto_173031 ) ) ( not ( = ?auto_173026 ?auto_173032 ) ) ( not ( = ?auto_173026 ?auto_173030 ) ) ( not ( = ?auto_173027 ?auto_173032 ) ) ( not ( = ?auto_173027 ?auto_173030 ) ) ( not ( = ?auto_173028 ?auto_173032 ) ) ( not ( = ?auto_173028 ?auto_173030 ) ) ( not ( = ?auto_173029 ?auto_173032 ) ) ( not ( = ?auto_173029 ?auto_173030 ) ) ( not ( = ?auto_173031 ?auto_173032 ) ) ( not ( = ?auto_173031 ?auto_173030 ) ) ( not ( = ?auto_173032 ?auto_173030 ) ) ( ON ?auto_173032 ?auto_173031 ) ( CLEAR ?auto_173032 ) ( HOLDING ?auto_173030 ) ( CLEAR ?auto_173033 ) ( ON-TABLE ?auto_173033 ) ( not ( = ?auto_173033 ?auto_173030 ) ) ( not ( = ?auto_173026 ?auto_173033 ) ) ( not ( = ?auto_173027 ?auto_173033 ) ) ( not ( = ?auto_173028 ?auto_173033 ) ) ( not ( = ?auto_173029 ?auto_173033 ) ) ( not ( = ?auto_173031 ?auto_173033 ) ) ( not ( = ?auto_173032 ?auto_173033 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173033 ?auto_173030 )
      ( MAKE-4PILE ?auto_173026 ?auto_173027 ?auto_173028 ?auto_173029 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173034 - BLOCK
      ?auto_173035 - BLOCK
      ?auto_173036 - BLOCK
      ?auto_173037 - BLOCK
    )
    :vars
    (
      ?auto_173040 - BLOCK
      ?auto_173038 - BLOCK
      ?auto_173039 - BLOCK
      ?auto_173041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173040 ?auto_173037 ) ( ON-TABLE ?auto_173034 ) ( ON ?auto_173035 ?auto_173034 ) ( ON ?auto_173036 ?auto_173035 ) ( ON ?auto_173037 ?auto_173036 ) ( not ( = ?auto_173034 ?auto_173035 ) ) ( not ( = ?auto_173034 ?auto_173036 ) ) ( not ( = ?auto_173034 ?auto_173037 ) ) ( not ( = ?auto_173034 ?auto_173040 ) ) ( not ( = ?auto_173035 ?auto_173036 ) ) ( not ( = ?auto_173035 ?auto_173037 ) ) ( not ( = ?auto_173035 ?auto_173040 ) ) ( not ( = ?auto_173036 ?auto_173037 ) ) ( not ( = ?auto_173036 ?auto_173040 ) ) ( not ( = ?auto_173037 ?auto_173040 ) ) ( not ( = ?auto_173034 ?auto_173038 ) ) ( not ( = ?auto_173034 ?auto_173039 ) ) ( not ( = ?auto_173035 ?auto_173038 ) ) ( not ( = ?auto_173035 ?auto_173039 ) ) ( not ( = ?auto_173036 ?auto_173038 ) ) ( not ( = ?auto_173036 ?auto_173039 ) ) ( not ( = ?auto_173037 ?auto_173038 ) ) ( not ( = ?auto_173037 ?auto_173039 ) ) ( not ( = ?auto_173040 ?auto_173038 ) ) ( not ( = ?auto_173040 ?auto_173039 ) ) ( not ( = ?auto_173038 ?auto_173039 ) ) ( ON ?auto_173038 ?auto_173040 ) ( CLEAR ?auto_173041 ) ( ON-TABLE ?auto_173041 ) ( not ( = ?auto_173041 ?auto_173039 ) ) ( not ( = ?auto_173034 ?auto_173041 ) ) ( not ( = ?auto_173035 ?auto_173041 ) ) ( not ( = ?auto_173036 ?auto_173041 ) ) ( not ( = ?auto_173037 ?auto_173041 ) ) ( not ( = ?auto_173040 ?auto_173041 ) ) ( not ( = ?auto_173038 ?auto_173041 ) ) ( ON ?auto_173039 ?auto_173038 ) ( CLEAR ?auto_173039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173034 ?auto_173035 ?auto_173036 ?auto_173037 ?auto_173040 ?auto_173038 )
      ( MAKE-4PILE ?auto_173034 ?auto_173035 ?auto_173036 ?auto_173037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173042 - BLOCK
      ?auto_173043 - BLOCK
      ?auto_173044 - BLOCK
      ?auto_173045 - BLOCK
    )
    :vars
    (
      ?auto_173047 - BLOCK
      ?auto_173048 - BLOCK
      ?auto_173049 - BLOCK
      ?auto_173046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173047 ?auto_173045 ) ( ON-TABLE ?auto_173042 ) ( ON ?auto_173043 ?auto_173042 ) ( ON ?auto_173044 ?auto_173043 ) ( ON ?auto_173045 ?auto_173044 ) ( not ( = ?auto_173042 ?auto_173043 ) ) ( not ( = ?auto_173042 ?auto_173044 ) ) ( not ( = ?auto_173042 ?auto_173045 ) ) ( not ( = ?auto_173042 ?auto_173047 ) ) ( not ( = ?auto_173043 ?auto_173044 ) ) ( not ( = ?auto_173043 ?auto_173045 ) ) ( not ( = ?auto_173043 ?auto_173047 ) ) ( not ( = ?auto_173044 ?auto_173045 ) ) ( not ( = ?auto_173044 ?auto_173047 ) ) ( not ( = ?auto_173045 ?auto_173047 ) ) ( not ( = ?auto_173042 ?auto_173048 ) ) ( not ( = ?auto_173042 ?auto_173049 ) ) ( not ( = ?auto_173043 ?auto_173048 ) ) ( not ( = ?auto_173043 ?auto_173049 ) ) ( not ( = ?auto_173044 ?auto_173048 ) ) ( not ( = ?auto_173044 ?auto_173049 ) ) ( not ( = ?auto_173045 ?auto_173048 ) ) ( not ( = ?auto_173045 ?auto_173049 ) ) ( not ( = ?auto_173047 ?auto_173048 ) ) ( not ( = ?auto_173047 ?auto_173049 ) ) ( not ( = ?auto_173048 ?auto_173049 ) ) ( ON ?auto_173048 ?auto_173047 ) ( not ( = ?auto_173046 ?auto_173049 ) ) ( not ( = ?auto_173042 ?auto_173046 ) ) ( not ( = ?auto_173043 ?auto_173046 ) ) ( not ( = ?auto_173044 ?auto_173046 ) ) ( not ( = ?auto_173045 ?auto_173046 ) ) ( not ( = ?auto_173047 ?auto_173046 ) ) ( not ( = ?auto_173048 ?auto_173046 ) ) ( ON ?auto_173049 ?auto_173048 ) ( CLEAR ?auto_173049 ) ( HOLDING ?auto_173046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173046 )
      ( MAKE-4PILE ?auto_173042 ?auto_173043 ?auto_173044 ?auto_173045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173050 - BLOCK
      ?auto_173051 - BLOCK
      ?auto_173052 - BLOCK
      ?auto_173053 - BLOCK
    )
    :vars
    (
      ?auto_173057 - BLOCK
      ?auto_173054 - BLOCK
      ?auto_173055 - BLOCK
      ?auto_173056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173057 ?auto_173053 ) ( ON-TABLE ?auto_173050 ) ( ON ?auto_173051 ?auto_173050 ) ( ON ?auto_173052 ?auto_173051 ) ( ON ?auto_173053 ?auto_173052 ) ( not ( = ?auto_173050 ?auto_173051 ) ) ( not ( = ?auto_173050 ?auto_173052 ) ) ( not ( = ?auto_173050 ?auto_173053 ) ) ( not ( = ?auto_173050 ?auto_173057 ) ) ( not ( = ?auto_173051 ?auto_173052 ) ) ( not ( = ?auto_173051 ?auto_173053 ) ) ( not ( = ?auto_173051 ?auto_173057 ) ) ( not ( = ?auto_173052 ?auto_173053 ) ) ( not ( = ?auto_173052 ?auto_173057 ) ) ( not ( = ?auto_173053 ?auto_173057 ) ) ( not ( = ?auto_173050 ?auto_173054 ) ) ( not ( = ?auto_173050 ?auto_173055 ) ) ( not ( = ?auto_173051 ?auto_173054 ) ) ( not ( = ?auto_173051 ?auto_173055 ) ) ( not ( = ?auto_173052 ?auto_173054 ) ) ( not ( = ?auto_173052 ?auto_173055 ) ) ( not ( = ?auto_173053 ?auto_173054 ) ) ( not ( = ?auto_173053 ?auto_173055 ) ) ( not ( = ?auto_173057 ?auto_173054 ) ) ( not ( = ?auto_173057 ?auto_173055 ) ) ( not ( = ?auto_173054 ?auto_173055 ) ) ( ON ?auto_173054 ?auto_173057 ) ( not ( = ?auto_173056 ?auto_173055 ) ) ( not ( = ?auto_173050 ?auto_173056 ) ) ( not ( = ?auto_173051 ?auto_173056 ) ) ( not ( = ?auto_173052 ?auto_173056 ) ) ( not ( = ?auto_173053 ?auto_173056 ) ) ( not ( = ?auto_173057 ?auto_173056 ) ) ( not ( = ?auto_173054 ?auto_173056 ) ) ( ON ?auto_173055 ?auto_173054 ) ( ON ?auto_173056 ?auto_173055 ) ( CLEAR ?auto_173056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173050 ?auto_173051 ?auto_173052 ?auto_173053 ?auto_173057 ?auto_173054 ?auto_173055 )
      ( MAKE-4PILE ?auto_173050 ?auto_173051 ?auto_173052 ?auto_173053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173058 - BLOCK
      ?auto_173059 - BLOCK
      ?auto_173060 - BLOCK
      ?auto_173061 - BLOCK
    )
    :vars
    (
      ?auto_173064 - BLOCK
      ?auto_173063 - BLOCK
      ?auto_173062 - BLOCK
      ?auto_173065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173064 ?auto_173061 ) ( ON-TABLE ?auto_173058 ) ( ON ?auto_173059 ?auto_173058 ) ( ON ?auto_173060 ?auto_173059 ) ( ON ?auto_173061 ?auto_173060 ) ( not ( = ?auto_173058 ?auto_173059 ) ) ( not ( = ?auto_173058 ?auto_173060 ) ) ( not ( = ?auto_173058 ?auto_173061 ) ) ( not ( = ?auto_173058 ?auto_173064 ) ) ( not ( = ?auto_173059 ?auto_173060 ) ) ( not ( = ?auto_173059 ?auto_173061 ) ) ( not ( = ?auto_173059 ?auto_173064 ) ) ( not ( = ?auto_173060 ?auto_173061 ) ) ( not ( = ?auto_173060 ?auto_173064 ) ) ( not ( = ?auto_173061 ?auto_173064 ) ) ( not ( = ?auto_173058 ?auto_173063 ) ) ( not ( = ?auto_173058 ?auto_173062 ) ) ( not ( = ?auto_173059 ?auto_173063 ) ) ( not ( = ?auto_173059 ?auto_173062 ) ) ( not ( = ?auto_173060 ?auto_173063 ) ) ( not ( = ?auto_173060 ?auto_173062 ) ) ( not ( = ?auto_173061 ?auto_173063 ) ) ( not ( = ?auto_173061 ?auto_173062 ) ) ( not ( = ?auto_173064 ?auto_173063 ) ) ( not ( = ?auto_173064 ?auto_173062 ) ) ( not ( = ?auto_173063 ?auto_173062 ) ) ( ON ?auto_173063 ?auto_173064 ) ( not ( = ?auto_173065 ?auto_173062 ) ) ( not ( = ?auto_173058 ?auto_173065 ) ) ( not ( = ?auto_173059 ?auto_173065 ) ) ( not ( = ?auto_173060 ?auto_173065 ) ) ( not ( = ?auto_173061 ?auto_173065 ) ) ( not ( = ?auto_173064 ?auto_173065 ) ) ( not ( = ?auto_173063 ?auto_173065 ) ) ( ON ?auto_173062 ?auto_173063 ) ( HOLDING ?auto_173065 ) ( CLEAR ?auto_173062 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173058 ?auto_173059 ?auto_173060 ?auto_173061 ?auto_173064 ?auto_173063 ?auto_173062 ?auto_173065 )
      ( MAKE-4PILE ?auto_173058 ?auto_173059 ?auto_173060 ?auto_173061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173066 - BLOCK
      ?auto_173067 - BLOCK
      ?auto_173068 - BLOCK
      ?auto_173069 - BLOCK
    )
    :vars
    (
      ?auto_173072 - BLOCK
      ?auto_173071 - BLOCK
      ?auto_173070 - BLOCK
      ?auto_173073 - BLOCK
      ?auto_173074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173072 ?auto_173069 ) ( ON-TABLE ?auto_173066 ) ( ON ?auto_173067 ?auto_173066 ) ( ON ?auto_173068 ?auto_173067 ) ( ON ?auto_173069 ?auto_173068 ) ( not ( = ?auto_173066 ?auto_173067 ) ) ( not ( = ?auto_173066 ?auto_173068 ) ) ( not ( = ?auto_173066 ?auto_173069 ) ) ( not ( = ?auto_173066 ?auto_173072 ) ) ( not ( = ?auto_173067 ?auto_173068 ) ) ( not ( = ?auto_173067 ?auto_173069 ) ) ( not ( = ?auto_173067 ?auto_173072 ) ) ( not ( = ?auto_173068 ?auto_173069 ) ) ( not ( = ?auto_173068 ?auto_173072 ) ) ( not ( = ?auto_173069 ?auto_173072 ) ) ( not ( = ?auto_173066 ?auto_173071 ) ) ( not ( = ?auto_173066 ?auto_173070 ) ) ( not ( = ?auto_173067 ?auto_173071 ) ) ( not ( = ?auto_173067 ?auto_173070 ) ) ( not ( = ?auto_173068 ?auto_173071 ) ) ( not ( = ?auto_173068 ?auto_173070 ) ) ( not ( = ?auto_173069 ?auto_173071 ) ) ( not ( = ?auto_173069 ?auto_173070 ) ) ( not ( = ?auto_173072 ?auto_173071 ) ) ( not ( = ?auto_173072 ?auto_173070 ) ) ( not ( = ?auto_173071 ?auto_173070 ) ) ( ON ?auto_173071 ?auto_173072 ) ( not ( = ?auto_173073 ?auto_173070 ) ) ( not ( = ?auto_173066 ?auto_173073 ) ) ( not ( = ?auto_173067 ?auto_173073 ) ) ( not ( = ?auto_173068 ?auto_173073 ) ) ( not ( = ?auto_173069 ?auto_173073 ) ) ( not ( = ?auto_173072 ?auto_173073 ) ) ( not ( = ?auto_173071 ?auto_173073 ) ) ( ON ?auto_173070 ?auto_173071 ) ( CLEAR ?auto_173070 ) ( ON ?auto_173073 ?auto_173074 ) ( CLEAR ?auto_173073 ) ( HAND-EMPTY ) ( not ( = ?auto_173066 ?auto_173074 ) ) ( not ( = ?auto_173067 ?auto_173074 ) ) ( not ( = ?auto_173068 ?auto_173074 ) ) ( not ( = ?auto_173069 ?auto_173074 ) ) ( not ( = ?auto_173072 ?auto_173074 ) ) ( not ( = ?auto_173071 ?auto_173074 ) ) ( not ( = ?auto_173070 ?auto_173074 ) ) ( not ( = ?auto_173073 ?auto_173074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173073 ?auto_173074 )
      ( MAKE-4PILE ?auto_173066 ?auto_173067 ?auto_173068 ?auto_173069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173075 - BLOCK
      ?auto_173076 - BLOCK
      ?auto_173077 - BLOCK
      ?auto_173078 - BLOCK
    )
    :vars
    (
      ?auto_173079 - BLOCK
      ?auto_173083 - BLOCK
      ?auto_173080 - BLOCK
      ?auto_173081 - BLOCK
      ?auto_173082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173079 ?auto_173078 ) ( ON-TABLE ?auto_173075 ) ( ON ?auto_173076 ?auto_173075 ) ( ON ?auto_173077 ?auto_173076 ) ( ON ?auto_173078 ?auto_173077 ) ( not ( = ?auto_173075 ?auto_173076 ) ) ( not ( = ?auto_173075 ?auto_173077 ) ) ( not ( = ?auto_173075 ?auto_173078 ) ) ( not ( = ?auto_173075 ?auto_173079 ) ) ( not ( = ?auto_173076 ?auto_173077 ) ) ( not ( = ?auto_173076 ?auto_173078 ) ) ( not ( = ?auto_173076 ?auto_173079 ) ) ( not ( = ?auto_173077 ?auto_173078 ) ) ( not ( = ?auto_173077 ?auto_173079 ) ) ( not ( = ?auto_173078 ?auto_173079 ) ) ( not ( = ?auto_173075 ?auto_173083 ) ) ( not ( = ?auto_173075 ?auto_173080 ) ) ( not ( = ?auto_173076 ?auto_173083 ) ) ( not ( = ?auto_173076 ?auto_173080 ) ) ( not ( = ?auto_173077 ?auto_173083 ) ) ( not ( = ?auto_173077 ?auto_173080 ) ) ( not ( = ?auto_173078 ?auto_173083 ) ) ( not ( = ?auto_173078 ?auto_173080 ) ) ( not ( = ?auto_173079 ?auto_173083 ) ) ( not ( = ?auto_173079 ?auto_173080 ) ) ( not ( = ?auto_173083 ?auto_173080 ) ) ( ON ?auto_173083 ?auto_173079 ) ( not ( = ?auto_173081 ?auto_173080 ) ) ( not ( = ?auto_173075 ?auto_173081 ) ) ( not ( = ?auto_173076 ?auto_173081 ) ) ( not ( = ?auto_173077 ?auto_173081 ) ) ( not ( = ?auto_173078 ?auto_173081 ) ) ( not ( = ?auto_173079 ?auto_173081 ) ) ( not ( = ?auto_173083 ?auto_173081 ) ) ( ON ?auto_173081 ?auto_173082 ) ( CLEAR ?auto_173081 ) ( not ( = ?auto_173075 ?auto_173082 ) ) ( not ( = ?auto_173076 ?auto_173082 ) ) ( not ( = ?auto_173077 ?auto_173082 ) ) ( not ( = ?auto_173078 ?auto_173082 ) ) ( not ( = ?auto_173079 ?auto_173082 ) ) ( not ( = ?auto_173083 ?auto_173082 ) ) ( not ( = ?auto_173080 ?auto_173082 ) ) ( not ( = ?auto_173081 ?auto_173082 ) ) ( HOLDING ?auto_173080 ) ( CLEAR ?auto_173083 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173075 ?auto_173076 ?auto_173077 ?auto_173078 ?auto_173079 ?auto_173083 ?auto_173080 )
      ( MAKE-4PILE ?auto_173075 ?auto_173076 ?auto_173077 ?auto_173078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173084 - BLOCK
      ?auto_173085 - BLOCK
      ?auto_173086 - BLOCK
      ?auto_173087 - BLOCK
    )
    :vars
    (
      ?auto_173091 - BLOCK
      ?auto_173088 - BLOCK
      ?auto_173090 - BLOCK
      ?auto_173092 - BLOCK
      ?auto_173089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173091 ?auto_173087 ) ( ON-TABLE ?auto_173084 ) ( ON ?auto_173085 ?auto_173084 ) ( ON ?auto_173086 ?auto_173085 ) ( ON ?auto_173087 ?auto_173086 ) ( not ( = ?auto_173084 ?auto_173085 ) ) ( not ( = ?auto_173084 ?auto_173086 ) ) ( not ( = ?auto_173084 ?auto_173087 ) ) ( not ( = ?auto_173084 ?auto_173091 ) ) ( not ( = ?auto_173085 ?auto_173086 ) ) ( not ( = ?auto_173085 ?auto_173087 ) ) ( not ( = ?auto_173085 ?auto_173091 ) ) ( not ( = ?auto_173086 ?auto_173087 ) ) ( not ( = ?auto_173086 ?auto_173091 ) ) ( not ( = ?auto_173087 ?auto_173091 ) ) ( not ( = ?auto_173084 ?auto_173088 ) ) ( not ( = ?auto_173084 ?auto_173090 ) ) ( not ( = ?auto_173085 ?auto_173088 ) ) ( not ( = ?auto_173085 ?auto_173090 ) ) ( not ( = ?auto_173086 ?auto_173088 ) ) ( not ( = ?auto_173086 ?auto_173090 ) ) ( not ( = ?auto_173087 ?auto_173088 ) ) ( not ( = ?auto_173087 ?auto_173090 ) ) ( not ( = ?auto_173091 ?auto_173088 ) ) ( not ( = ?auto_173091 ?auto_173090 ) ) ( not ( = ?auto_173088 ?auto_173090 ) ) ( ON ?auto_173088 ?auto_173091 ) ( not ( = ?auto_173092 ?auto_173090 ) ) ( not ( = ?auto_173084 ?auto_173092 ) ) ( not ( = ?auto_173085 ?auto_173092 ) ) ( not ( = ?auto_173086 ?auto_173092 ) ) ( not ( = ?auto_173087 ?auto_173092 ) ) ( not ( = ?auto_173091 ?auto_173092 ) ) ( not ( = ?auto_173088 ?auto_173092 ) ) ( ON ?auto_173092 ?auto_173089 ) ( not ( = ?auto_173084 ?auto_173089 ) ) ( not ( = ?auto_173085 ?auto_173089 ) ) ( not ( = ?auto_173086 ?auto_173089 ) ) ( not ( = ?auto_173087 ?auto_173089 ) ) ( not ( = ?auto_173091 ?auto_173089 ) ) ( not ( = ?auto_173088 ?auto_173089 ) ) ( not ( = ?auto_173090 ?auto_173089 ) ) ( not ( = ?auto_173092 ?auto_173089 ) ) ( CLEAR ?auto_173088 ) ( ON ?auto_173090 ?auto_173092 ) ( CLEAR ?auto_173090 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173089 ?auto_173092 )
      ( MAKE-4PILE ?auto_173084 ?auto_173085 ?auto_173086 ?auto_173087 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173093 - BLOCK
      ?auto_173094 - BLOCK
      ?auto_173095 - BLOCK
      ?auto_173096 - BLOCK
    )
    :vars
    (
      ?auto_173100 - BLOCK
      ?auto_173097 - BLOCK
      ?auto_173099 - BLOCK
      ?auto_173101 - BLOCK
      ?auto_173098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173100 ?auto_173096 ) ( ON-TABLE ?auto_173093 ) ( ON ?auto_173094 ?auto_173093 ) ( ON ?auto_173095 ?auto_173094 ) ( ON ?auto_173096 ?auto_173095 ) ( not ( = ?auto_173093 ?auto_173094 ) ) ( not ( = ?auto_173093 ?auto_173095 ) ) ( not ( = ?auto_173093 ?auto_173096 ) ) ( not ( = ?auto_173093 ?auto_173100 ) ) ( not ( = ?auto_173094 ?auto_173095 ) ) ( not ( = ?auto_173094 ?auto_173096 ) ) ( not ( = ?auto_173094 ?auto_173100 ) ) ( not ( = ?auto_173095 ?auto_173096 ) ) ( not ( = ?auto_173095 ?auto_173100 ) ) ( not ( = ?auto_173096 ?auto_173100 ) ) ( not ( = ?auto_173093 ?auto_173097 ) ) ( not ( = ?auto_173093 ?auto_173099 ) ) ( not ( = ?auto_173094 ?auto_173097 ) ) ( not ( = ?auto_173094 ?auto_173099 ) ) ( not ( = ?auto_173095 ?auto_173097 ) ) ( not ( = ?auto_173095 ?auto_173099 ) ) ( not ( = ?auto_173096 ?auto_173097 ) ) ( not ( = ?auto_173096 ?auto_173099 ) ) ( not ( = ?auto_173100 ?auto_173097 ) ) ( not ( = ?auto_173100 ?auto_173099 ) ) ( not ( = ?auto_173097 ?auto_173099 ) ) ( not ( = ?auto_173101 ?auto_173099 ) ) ( not ( = ?auto_173093 ?auto_173101 ) ) ( not ( = ?auto_173094 ?auto_173101 ) ) ( not ( = ?auto_173095 ?auto_173101 ) ) ( not ( = ?auto_173096 ?auto_173101 ) ) ( not ( = ?auto_173100 ?auto_173101 ) ) ( not ( = ?auto_173097 ?auto_173101 ) ) ( ON ?auto_173101 ?auto_173098 ) ( not ( = ?auto_173093 ?auto_173098 ) ) ( not ( = ?auto_173094 ?auto_173098 ) ) ( not ( = ?auto_173095 ?auto_173098 ) ) ( not ( = ?auto_173096 ?auto_173098 ) ) ( not ( = ?auto_173100 ?auto_173098 ) ) ( not ( = ?auto_173097 ?auto_173098 ) ) ( not ( = ?auto_173099 ?auto_173098 ) ) ( not ( = ?auto_173101 ?auto_173098 ) ) ( ON ?auto_173099 ?auto_173101 ) ( CLEAR ?auto_173099 ) ( ON-TABLE ?auto_173098 ) ( HOLDING ?auto_173097 ) ( CLEAR ?auto_173100 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173093 ?auto_173094 ?auto_173095 ?auto_173096 ?auto_173100 ?auto_173097 )
      ( MAKE-4PILE ?auto_173093 ?auto_173094 ?auto_173095 ?auto_173096 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173102 - BLOCK
      ?auto_173103 - BLOCK
      ?auto_173104 - BLOCK
      ?auto_173105 - BLOCK
    )
    :vars
    (
      ?auto_173108 - BLOCK
      ?auto_173109 - BLOCK
      ?auto_173106 - BLOCK
      ?auto_173107 - BLOCK
      ?auto_173110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173108 ?auto_173105 ) ( ON-TABLE ?auto_173102 ) ( ON ?auto_173103 ?auto_173102 ) ( ON ?auto_173104 ?auto_173103 ) ( ON ?auto_173105 ?auto_173104 ) ( not ( = ?auto_173102 ?auto_173103 ) ) ( not ( = ?auto_173102 ?auto_173104 ) ) ( not ( = ?auto_173102 ?auto_173105 ) ) ( not ( = ?auto_173102 ?auto_173108 ) ) ( not ( = ?auto_173103 ?auto_173104 ) ) ( not ( = ?auto_173103 ?auto_173105 ) ) ( not ( = ?auto_173103 ?auto_173108 ) ) ( not ( = ?auto_173104 ?auto_173105 ) ) ( not ( = ?auto_173104 ?auto_173108 ) ) ( not ( = ?auto_173105 ?auto_173108 ) ) ( not ( = ?auto_173102 ?auto_173109 ) ) ( not ( = ?auto_173102 ?auto_173106 ) ) ( not ( = ?auto_173103 ?auto_173109 ) ) ( not ( = ?auto_173103 ?auto_173106 ) ) ( not ( = ?auto_173104 ?auto_173109 ) ) ( not ( = ?auto_173104 ?auto_173106 ) ) ( not ( = ?auto_173105 ?auto_173109 ) ) ( not ( = ?auto_173105 ?auto_173106 ) ) ( not ( = ?auto_173108 ?auto_173109 ) ) ( not ( = ?auto_173108 ?auto_173106 ) ) ( not ( = ?auto_173109 ?auto_173106 ) ) ( not ( = ?auto_173107 ?auto_173106 ) ) ( not ( = ?auto_173102 ?auto_173107 ) ) ( not ( = ?auto_173103 ?auto_173107 ) ) ( not ( = ?auto_173104 ?auto_173107 ) ) ( not ( = ?auto_173105 ?auto_173107 ) ) ( not ( = ?auto_173108 ?auto_173107 ) ) ( not ( = ?auto_173109 ?auto_173107 ) ) ( ON ?auto_173107 ?auto_173110 ) ( not ( = ?auto_173102 ?auto_173110 ) ) ( not ( = ?auto_173103 ?auto_173110 ) ) ( not ( = ?auto_173104 ?auto_173110 ) ) ( not ( = ?auto_173105 ?auto_173110 ) ) ( not ( = ?auto_173108 ?auto_173110 ) ) ( not ( = ?auto_173109 ?auto_173110 ) ) ( not ( = ?auto_173106 ?auto_173110 ) ) ( not ( = ?auto_173107 ?auto_173110 ) ) ( ON ?auto_173106 ?auto_173107 ) ( ON-TABLE ?auto_173110 ) ( CLEAR ?auto_173108 ) ( ON ?auto_173109 ?auto_173106 ) ( CLEAR ?auto_173109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173110 ?auto_173107 ?auto_173106 )
      ( MAKE-4PILE ?auto_173102 ?auto_173103 ?auto_173104 ?auto_173105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173129 - BLOCK
      ?auto_173130 - BLOCK
      ?auto_173131 - BLOCK
      ?auto_173132 - BLOCK
    )
    :vars
    (
      ?auto_173133 - BLOCK
      ?auto_173136 - BLOCK
      ?auto_173135 - BLOCK
      ?auto_173137 - BLOCK
      ?auto_173134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173129 ) ( ON ?auto_173130 ?auto_173129 ) ( ON ?auto_173131 ?auto_173130 ) ( not ( = ?auto_173129 ?auto_173130 ) ) ( not ( = ?auto_173129 ?auto_173131 ) ) ( not ( = ?auto_173129 ?auto_173132 ) ) ( not ( = ?auto_173129 ?auto_173133 ) ) ( not ( = ?auto_173130 ?auto_173131 ) ) ( not ( = ?auto_173130 ?auto_173132 ) ) ( not ( = ?auto_173130 ?auto_173133 ) ) ( not ( = ?auto_173131 ?auto_173132 ) ) ( not ( = ?auto_173131 ?auto_173133 ) ) ( not ( = ?auto_173132 ?auto_173133 ) ) ( not ( = ?auto_173129 ?auto_173136 ) ) ( not ( = ?auto_173129 ?auto_173135 ) ) ( not ( = ?auto_173130 ?auto_173136 ) ) ( not ( = ?auto_173130 ?auto_173135 ) ) ( not ( = ?auto_173131 ?auto_173136 ) ) ( not ( = ?auto_173131 ?auto_173135 ) ) ( not ( = ?auto_173132 ?auto_173136 ) ) ( not ( = ?auto_173132 ?auto_173135 ) ) ( not ( = ?auto_173133 ?auto_173136 ) ) ( not ( = ?auto_173133 ?auto_173135 ) ) ( not ( = ?auto_173136 ?auto_173135 ) ) ( not ( = ?auto_173137 ?auto_173135 ) ) ( not ( = ?auto_173129 ?auto_173137 ) ) ( not ( = ?auto_173130 ?auto_173137 ) ) ( not ( = ?auto_173131 ?auto_173137 ) ) ( not ( = ?auto_173132 ?auto_173137 ) ) ( not ( = ?auto_173133 ?auto_173137 ) ) ( not ( = ?auto_173136 ?auto_173137 ) ) ( ON ?auto_173137 ?auto_173134 ) ( not ( = ?auto_173129 ?auto_173134 ) ) ( not ( = ?auto_173130 ?auto_173134 ) ) ( not ( = ?auto_173131 ?auto_173134 ) ) ( not ( = ?auto_173132 ?auto_173134 ) ) ( not ( = ?auto_173133 ?auto_173134 ) ) ( not ( = ?auto_173136 ?auto_173134 ) ) ( not ( = ?auto_173135 ?auto_173134 ) ) ( not ( = ?auto_173137 ?auto_173134 ) ) ( ON ?auto_173135 ?auto_173137 ) ( ON-TABLE ?auto_173134 ) ( ON ?auto_173136 ?auto_173135 ) ( ON ?auto_173133 ?auto_173136 ) ( CLEAR ?auto_173133 ) ( HOLDING ?auto_173132 ) ( CLEAR ?auto_173131 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173129 ?auto_173130 ?auto_173131 ?auto_173132 ?auto_173133 )
      ( MAKE-4PILE ?auto_173129 ?auto_173130 ?auto_173131 ?auto_173132 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173138 - BLOCK
      ?auto_173139 - BLOCK
      ?auto_173140 - BLOCK
      ?auto_173141 - BLOCK
    )
    :vars
    (
      ?auto_173143 - BLOCK
      ?auto_173142 - BLOCK
      ?auto_173146 - BLOCK
      ?auto_173144 - BLOCK
      ?auto_173145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173138 ) ( ON ?auto_173139 ?auto_173138 ) ( ON ?auto_173140 ?auto_173139 ) ( not ( = ?auto_173138 ?auto_173139 ) ) ( not ( = ?auto_173138 ?auto_173140 ) ) ( not ( = ?auto_173138 ?auto_173141 ) ) ( not ( = ?auto_173138 ?auto_173143 ) ) ( not ( = ?auto_173139 ?auto_173140 ) ) ( not ( = ?auto_173139 ?auto_173141 ) ) ( not ( = ?auto_173139 ?auto_173143 ) ) ( not ( = ?auto_173140 ?auto_173141 ) ) ( not ( = ?auto_173140 ?auto_173143 ) ) ( not ( = ?auto_173141 ?auto_173143 ) ) ( not ( = ?auto_173138 ?auto_173142 ) ) ( not ( = ?auto_173138 ?auto_173146 ) ) ( not ( = ?auto_173139 ?auto_173142 ) ) ( not ( = ?auto_173139 ?auto_173146 ) ) ( not ( = ?auto_173140 ?auto_173142 ) ) ( not ( = ?auto_173140 ?auto_173146 ) ) ( not ( = ?auto_173141 ?auto_173142 ) ) ( not ( = ?auto_173141 ?auto_173146 ) ) ( not ( = ?auto_173143 ?auto_173142 ) ) ( not ( = ?auto_173143 ?auto_173146 ) ) ( not ( = ?auto_173142 ?auto_173146 ) ) ( not ( = ?auto_173144 ?auto_173146 ) ) ( not ( = ?auto_173138 ?auto_173144 ) ) ( not ( = ?auto_173139 ?auto_173144 ) ) ( not ( = ?auto_173140 ?auto_173144 ) ) ( not ( = ?auto_173141 ?auto_173144 ) ) ( not ( = ?auto_173143 ?auto_173144 ) ) ( not ( = ?auto_173142 ?auto_173144 ) ) ( ON ?auto_173144 ?auto_173145 ) ( not ( = ?auto_173138 ?auto_173145 ) ) ( not ( = ?auto_173139 ?auto_173145 ) ) ( not ( = ?auto_173140 ?auto_173145 ) ) ( not ( = ?auto_173141 ?auto_173145 ) ) ( not ( = ?auto_173143 ?auto_173145 ) ) ( not ( = ?auto_173142 ?auto_173145 ) ) ( not ( = ?auto_173146 ?auto_173145 ) ) ( not ( = ?auto_173144 ?auto_173145 ) ) ( ON ?auto_173146 ?auto_173144 ) ( ON-TABLE ?auto_173145 ) ( ON ?auto_173142 ?auto_173146 ) ( ON ?auto_173143 ?auto_173142 ) ( CLEAR ?auto_173140 ) ( ON ?auto_173141 ?auto_173143 ) ( CLEAR ?auto_173141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173145 ?auto_173144 ?auto_173146 ?auto_173142 ?auto_173143 )
      ( MAKE-4PILE ?auto_173138 ?auto_173139 ?auto_173140 ?auto_173141 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173147 - BLOCK
      ?auto_173148 - BLOCK
      ?auto_173149 - BLOCK
      ?auto_173150 - BLOCK
    )
    :vars
    (
      ?auto_173152 - BLOCK
      ?auto_173154 - BLOCK
      ?auto_173153 - BLOCK
      ?auto_173151 - BLOCK
      ?auto_173155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173147 ) ( ON ?auto_173148 ?auto_173147 ) ( not ( = ?auto_173147 ?auto_173148 ) ) ( not ( = ?auto_173147 ?auto_173149 ) ) ( not ( = ?auto_173147 ?auto_173150 ) ) ( not ( = ?auto_173147 ?auto_173152 ) ) ( not ( = ?auto_173148 ?auto_173149 ) ) ( not ( = ?auto_173148 ?auto_173150 ) ) ( not ( = ?auto_173148 ?auto_173152 ) ) ( not ( = ?auto_173149 ?auto_173150 ) ) ( not ( = ?auto_173149 ?auto_173152 ) ) ( not ( = ?auto_173150 ?auto_173152 ) ) ( not ( = ?auto_173147 ?auto_173154 ) ) ( not ( = ?auto_173147 ?auto_173153 ) ) ( not ( = ?auto_173148 ?auto_173154 ) ) ( not ( = ?auto_173148 ?auto_173153 ) ) ( not ( = ?auto_173149 ?auto_173154 ) ) ( not ( = ?auto_173149 ?auto_173153 ) ) ( not ( = ?auto_173150 ?auto_173154 ) ) ( not ( = ?auto_173150 ?auto_173153 ) ) ( not ( = ?auto_173152 ?auto_173154 ) ) ( not ( = ?auto_173152 ?auto_173153 ) ) ( not ( = ?auto_173154 ?auto_173153 ) ) ( not ( = ?auto_173151 ?auto_173153 ) ) ( not ( = ?auto_173147 ?auto_173151 ) ) ( not ( = ?auto_173148 ?auto_173151 ) ) ( not ( = ?auto_173149 ?auto_173151 ) ) ( not ( = ?auto_173150 ?auto_173151 ) ) ( not ( = ?auto_173152 ?auto_173151 ) ) ( not ( = ?auto_173154 ?auto_173151 ) ) ( ON ?auto_173151 ?auto_173155 ) ( not ( = ?auto_173147 ?auto_173155 ) ) ( not ( = ?auto_173148 ?auto_173155 ) ) ( not ( = ?auto_173149 ?auto_173155 ) ) ( not ( = ?auto_173150 ?auto_173155 ) ) ( not ( = ?auto_173152 ?auto_173155 ) ) ( not ( = ?auto_173154 ?auto_173155 ) ) ( not ( = ?auto_173153 ?auto_173155 ) ) ( not ( = ?auto_173151 ?auto_173155 ) ) ( ON ?auto_173153 ?auto_173151 ) ( ON-TABLE ?auto_173155 ) ( ON ?auto_173154 ?auto_173153 ) ( ON ?auto_173152 ?auto_173154 ) ( ON ?auto_173150 ?auto_173152 ) ( CLEAR ?auto_173150 ) ( HOLDING ?auto_173149 ) ( CLEAR ?auto_173148 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173147 ?auto_173148 ?auto_173149 )
      ( MAKE-4PILE ?auto_173147 ?auto_173148 ?auto_173149 ?auto_173150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173156 - BLOCK
      ?auto_173157 - BLOCK
      ?auto_173158 - BLOCK
      ?auto_173159 - BLOCK
    )
    :vars
    (
      ?auto_173162 - BLOCK
      ?auto_173160 - BLOCK
      ?auto_173161 - BLOCK
      ?auto_173163 - BLOCK
      ?auto_173164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173156 ) ( ON ?auto_173157 ?auto_173156 ) ( not ( = ?auto_173156 ?auto_173157 ) ) ( not ( = ?auto_173156 ?auto_173158 ) ) ( not ( = ?auto_173156 ?auto_173159 ) ) ( not ( = ?auto_173156 ?auto_173162 ) ) ( not ( = ?auto_173157 ?auto_173158 ) ) ( not ( = ?auto_173157 ?auto_173159 ) ) ( not ( = ?auto_173157 ?auto_173162 ) ) ( not ( = ?auto_173158 ?auto_173159 ) ) ( not ( = ?auto_173158 ?auto_173162 ) ) ( not ( = ?auto_173159 ?auto_173162 ) ) ( not ( = ?auto_173156 ?auto_173160 ) ) ( not ( = ?auto_173156 ?auto_173161 ) ) ( not ( = ?auto_173157 ?auto_173160 ) ) ( not ( = ?auto_173157 ?auto_173161 ) ) ( not ( = ?auto_173158 ?auto_173160 ) ) ( not ( = ?auto_173158 ?auto_173161 ) ) ( not ( = ?auto_173159 ?auto_173160 ) ) ( not ( = ?auto_173159 ?auto_173161 ) ) ( not ( = ?auto_173162 ?auto_173160 ) ) ( not ( = ?auto_173162 ?auto_173161 ) ) ( not ( = ?auto_173160 ?auto_173161 ) ) ( not ( = ?auto_173163 ?auto_173161 ) ) ( not ( = ?auto_173156 ?auto_173163 ) ) ( not ( = ?auto_173157 ?auto_173163 ) ) ( not ( = ?auto_173158 ?auto_173163 ) ) ( not ( = ?auto_173159 ?auto_173163 ) ) ( not ( = ?auto_173162 ?auto_173163 ) ) ( not ( = ?auto_173160 ?auto_173163 ) ) ( ON ?auto_173163 ?auto_173164 ) ( not ( = ?auto_173156 ?auto_173164 ) ) ( not ( = ?auto_173157 ?auto_173164 ) ) ( not ( = ?auto_173158 ?auto_173164 ) ) ( not ( = ?auto_173159 ?auto_173164 ) ) ( not ( = ?auto_173162 ?auto_173164 ) ) ( not ( = ?auto_173160 ?auto_173164 ) ) ( not ( = ?auto_173161 ?auto_173164 ) ) ( not ( = ?auto_173163 ?auto_173164 ) ) ( ON ?auto_173161 ?auto_173163 ) ( ON-TABLE ?auto_173164 ) ( ON ?auto_173160 ?auto_173161 ) ( ON ?auto_173162 ?auto_173160 ) ( ON ?auto_173159 ?auto_173162 ) ( CLEAR ?auto_173157 ) ( ON ?auto_173158 ?auto_173159 ) ( CLEAR ?auto_173158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173164 ?auto_173163 ?auto_173161 ?auto_173160 ?auto_173162 ?auto_173159 )
      ( MAKE-4PILE ?auto_173156 ?auto_173157 ?auto_173158 ?auto_173159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173165 - BLOCK
      ?auto_173166 - BLOCK
      ?auto_173167 - BLOCK
      ?auto_173168 - BLOCK
    )
    :vars
    (
      ?auto_173170 - BLOCK
      ?auto_173169 - BLOCK
      ?auto_173173 - BLOCK
      ?auto_173172 - BLOCK
      ?auto_173171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173165 ) ( not ( = ?auto_173165 ?auto_173166 ) ) ( not ( = ?auto_173165 ?auto_173167 ) ) ( not ( = ?auto_173165 ?auto_173168 ) ) ( not ( = ?auto_173165 ?auto_173170 ) ) ( not ( = ?auto_173166 ?auto_173167 ) ) ( not ( = ?auto_173166 ?auto_173168 ) ) ( not ( = ?auto_173166 ?auto_173170 ) ) ( not ( = ?auto_173167 ?auto_173168 ) ) ( not ( = ?auto_173167 ?auto_173170 ) ) ( not ( = ?auto_173168 ?auto_173170 ) ) ( not ( = ?auto_173165 ?auto_173169 ) ) ( not ( = ?auto_173165 ?auto_173173 ) ) ( not ( = ?auto_173166 ?auto_173169 ) ) ( not ( = ?auto_173166 ?auto_173173 ) ) ( not ( = ?auto_173167 ?auto_173169 ) ) ( not ( = ?auto_173167 ?auto_173173 ) ) ( not ( = ?auto_173168 ?auto_173169 ) ) ( not ( = ?auto_173168 ?auto_173173 ) ) ( not ( = ?auto_173170 ?auto_173169 ) ) ( not ( = ?auto_173170 ?auto_173173 ) ) ( not ( = ?auto_173169 ?auto_173173 ) ) ( not ( = ?auto_173172 ?auto_173173 ) ) ( not ( = ?auto_173165 ?auto_173172 ) ) ( not ( = ?auto_173166 ?auto_173172 ) ) ( not ( = ?auto_173167 ?auto_173172 ) ) ( not ( = ?auto_173168 ?auto_173172 ) ) ( not ( = ?auto_173170 ?auto_173172 ) ) ( not ( = ?auto_173169 ?auto_173172 ) ) ( ON ?auto_173172 ?auto_173171 ) ( not ( = ?auto_173165 ?auto_173171 ) ) ( not ( = ?auto_173166 ?auto_173171 ) ) ( not ( = ?auto_173167 ?auto_173171 ) ) ( not ( = ?auto_173168 ?auto_173171 ) ) ( not ( = ?auto_173170 ?auto_173171 ) ) ( not ( = ?auto_173169 ?auto_173171 ) ) ( not ( = ?auto_173173 ?auto_173171 ) ) ( not ( = ?auto_173172 ?auto_173171 ) ) ( ON ?auto_173173 ?auto_173172 ) ( ON-TABLE ?auto_173171 ) ( ON ?auto_173169 ?auto_173173 ) ( ON ?auto_173170 ?auto_173169 ) ( ON ?auto_173168 ?auto_173170 ) ( ON ?auto_173167 ?auto_173168 ) ( CLEAR ?auto_173167 ) ( HOLDING ?auto_173166 ) ( CLEAR ?auto_173165 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173165 ?auto_173166 )
      ( MAKE-4PILE ?auto_173165 ?auto_173166 ?auto_173167 ?auto_173168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173174 - BLOCK
      ?auto_173175 - BLOCK
      ?auto_173176 - BLOCK
      ?auto_173177 - BLOCK
    )
    :vars
    (
      ?auto_173182 - BLOCK
      ?auto_173179 - BLOCK
      ?auto_173181 - BLOCK
      ?auto_173180 - BLOCK
      ?auto_173178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173174 ) ( not ( = ?auto_173174 ?auto_173175 ) ) ( not ( = ?auto_173174 ?auto_173176 ) ) ( not ( = ?auto_173174 ?auto_173177 ) ) ( not ( = ?auto_173174 ?auto_173182 ) ) ( not ( = ?auto_173175 ?auto_173176 ) ) ( not ( = ?auto_173175 ?auto_173177 ) ) ( not ( = ?auto_173175 ?auto_173182 ) ) ( not ( = ?auto_173176 ?auto_173177 ) ) ( not ( = ?auto_173176 ?auto_173182 ) ) ( not ( = ?auto_173177 ?auto_173182 ) ) ( not ( = ?auto_173174 ?auto_173179 ) ) ( not ( = ?auto_173174 ?auto_173181 ) ) ( not ( = ?auto_173175 ?auto_173179 ) ) ( not ( = ?auto_173175 ?auto_173181 ) ) ( not ( = ?auto_173176 ?auto_173179 ) ) ( not ( = ?auto_173176 ?auto_173181 ) ) ( not ( = ?auto_173177 ?auto_173179 ) ) ( not ( = ?auto_173177 ?auto_173181 ) ) ( not ( = ?auto_173182 ?auto_173179 ) ) ( not ( = ?auto_173182 ?auto_173181 ) ) ( not ( = ?auto_173179 ?auto_173181 ) ) ( not ( = ?auto_173180 ?auto_173181 ) ) ( not ( = ?auto_173174 ?auto_173180 ) ) ( not ( = ?auto_173175 ?auto_173180 ) ) ( not ( = ?auto_173176 ?auto_173180 ) ) ( not ( = ?auto_173177 ?auto_173180 ) ) ( not ( = ?auto_173182 ?auto_173180 ) ) ( not ( = ?auto_173179 ?auto_173180 ) ) ( ON ?auto_173180 ?auto_173178 ) ( not ( = ?auto_173174 ?auto_173178 ) ) ( not ( = ?auto_173175 ?auto_173178 ) ) ( not ( = ?auto_173176 ?auto_173178 ) ) ( not ( = ?auto_173177 ?auto_173178 ) ) ( not ( = ?auto_173182 ?auto_173178 ) ) ( not ( = ?auto_173179 ?auto_173178 ) ) ( not ( = ?auto_173181 ?auto_173178 ) ) ( not ( = ?auto_173180 ?auto_173178 ) ) ( ON ?auto_173181 ?auto_173180 ) ( ON-TABLE ?auto_173178 ) ( ON ?auto_173179 ?auto_173181 ) ( ON ?auto_173182 ?auto_173179 ) ( ON ?auto_173177 ?auto_173182 ) ( ON ?auto_173176 ?auto_173177 ) ( CLEAR ?auto_173174 ) ( ON ?auto_173175 ?auto_173176 ) ( CLEAR ?auto_173175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173178 ?auto_173180 ?auto_173181 ?auto_173179 ?auto_173182 ?auto_173177 ?auto_173176 )
      ( MAKE-4PILE ?auto_173174 ?auto_173175 ?auto_173176 ?auto_173177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173183 - BLOCK
      ?auto_173184 - BLOCK
      ?auto_173185 - BLOCK
      ?auto_173186 - BLOCK
    )
    :vars
    (
      ?auto_173190 - BLOCK
      ?auto_173191 - BLOCK
      ?auto_173187 - BLOCK
      ?auto_173188 - BLOCK
      ?auto_173189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173183 ?auto_173184 ) ) ( not ( = ?auto_173183 ?auto_173185 ) ) ( not ( = ?auto_173183 ?auto_173186 ) ) ( not ( = ?auto_173183 ?auto_173190 ) ) ( not ( = ?auto_173184 ?auto_173185 ) ) ( not ( = ?auto_173184 ?auto_173186 ) ) ( not ( = ?auto_173184 ?auto_173190 ) ) ( not ( = ?auto_173185 ?auto_173186 ) ) ( not ( = ?auto_173185 ?auto_173190 ) ) ( not ( = ?auto_173186 ?auto_173190 ) ) ( not ( = ?auto_173183 ?auto_173191 ) ) ( not ( = ?auto_173183 ?auto_173187 ) ) ( not ( = ?auto_173184 ?auto_173191 ) ) ( not ( = ?auto_173184 ?auto_173187 ) ) ( not ( = ?auto_173185 ?auto_173191 ) ) ( not ( = ?auto_173185 ?auto_173187 ) ) ( not ( = ?auto_173186 ?auto_173191 ) ) ( not ( = ?auto_173186 ?auto_173187 ) ) ( not ( = ?auto_173190 ?auto_173191 ) ) ( not ( = ?auto_173190 ?auto_173187 ) ) ( not ( = ?auto_173191 ?auto_173187 ) ) ( not ( = ?auto_173188 ?auto_173187 ) ) ( not ( = ?auto_173183 ?auto_173188 ) ) ( not ( = ?auto_173184 ?auto_173188 ) ) ( not ( = ?auto_173185 ?auto_173188 ) ) ( not ( = ?auto_173186 ?auto_173188 ) ) ( not ( = ?auto_173190 ?auto_173188 ) ) ( not ( = ?auto_173191 ?auto_173188 ) ) ( ON ?auto_173188 ?auto_173189 ) ( not ( = ?auto_173183 ?auto_173189 ) ) ( not ( = ?auto_173184 ?auto_173189 ) ) ( not ( = ?auto_173185 ?auto_173189 ) ) ( not ( = ?auto_173186 ?auto_173189 ) ) ( not ( = ?auto_173190 ?auto_173189 ) ) ( not ( = ?auto_173191 ?auto_173189 ) ) ( not ( = ?auto_173187 ?auto_173189 ) ) ( not ( = ?auto_173188 ?auto_173189 ) ) ( ON ?auto_173187 ?auto_173188 ) ( ON-TABLE ?auto_173189 ) ( ON ?auto_173191 ?auto_173187 ) ( ON ?auto_173190 ?auto_173191 ) ( ON ?auto_173186 ?auto_173190 ) ( ON ?auto_173185 ?auto_173186 ) ( ON ?auto_173184 ?auto_173185 ) ( CLEAR ?auto_173184 ) ( HOLDING ?auto_173183 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173183 )
      ( MAKE-4PILE ?auto_173183 ?auto_173184 ?auto_173185 ?auto_173186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173192 - BLOCK
      ?auto_173193 - BLOCK
      ?auto_173194 - BLOCK
      ?auto_173195 - BLOCK
    )
    :vars
    (
      ?auto_173200 - BLOCK
      ?auto_173199 - BLOCK
      ?auto_173198 - BLOCK
      ?auto_173196 - BLOCK
      ?auto_173197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173192 ?auto_173193 ) ) ( not ( = ?auto_173192 ?auto_173194 ) ) ( not ( = ?auto_173192 ?auto_173195 ) ) ( not ( = ?auto_173192 ?auto_173200 ) ) ( not ( = ?auto_173193 ?auto_173194 ) ) ( not ( = ?auto_173193 ?auto_173195 ) ) ( not ( = ?auto_173193 ?auto_173200 ) ) ( not ( = ?auto_173194 ?auto_173195 ) ) ( not ( = ?auto_173194 ?auto_173200 ) ) ( not ( = ?auto_173195 ?auto_173200 ) ) ( not ( = ?auto_173192 ?auto_173199 ) ) ( not ( = ?auto_173192 ?auto_173198 ) ) ( not ( = ?auto_173193 ?auto_173199 ) ) ( not ( = ?auto_173193 ?auto_173198 ) ) ( not ( = ?auto_173194 ?auto_173199 ) ) ( not ( = ?auto_173194 ?auto_173198 ) ) ( not ( = ?auto_173195 ?auto_173199 ) ) ( not ( = ?auto_173195 ?auto_173198 ) ) ( not ( = ?auto_173200 ?auto_173199 ) ) ( not ( = ?auto_173200 ?auto_173198 ) ) ( not ( = ?auto_173199 ?auto_173198 ) ) ( not ( = ?auto_173196 ?auto_173198 ) ) ( not ( = ?auto_173192 ?auto_173196 ) ) ( not ( = ?auto_173193 ?auto_173196 ) ) ( not ( = ?auto_173194 ?auto_173196 ) ) ( not ( = ?auto_173195 ?auto_173196 ) ) ( not ( = ?auto_173200 ?auto_173196 ) ) ( not ( = ?auto_173199 ?auto_173196 ) ) ( ON ?auto_173196 ?auto_173197 ) ( not ( = ?auto_173192 ?auto_173197 ) ) ( not ( = ?auto_173193 ?auto_173197 ) ) ( not ( = ?auto_173194 ?auto_173197 ) ) ( not ( = ?auto_173195 ?auto_173197 ) ) ( not ( = ?auto_173200 ?auto_173197 ) ) ( not ( = ?auto_173199 ?auto_173197 ) ) ( not ( = ?auto_173198 ?auto_173197 ) ) ( not ( = ?auto_173196 ?auto_173197 ) ) ( ON ?auto_173198 ?auto_173196 ) ( ON-TABLE ?auto_173197 ) ( ON ?auto_173199 ?auto_173198 ) ( ON ?auto_173200 ?auto_173199 ) ( ON ?auto_173195 ?auto_173200 ) ( ON ?auto_173194 ?auto_173195 ) ( ON ?auto_173193 ?auto_173194 ) ( ON ?auto_173192 ?auto_173193 ) ( CLEAR ?auto_173192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173197 ?auto_173196 ?auto_173198 ?auto_173199 ?auto_173200 ?auto_173195 ?auto_173194 ?auto_173193 )
      ( MAKE-4PILE ?auto_173192 ?auto_173193 ?auto_173194 ?auto_173195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173205 - BLOCK
      ?auto_173206 - BLOCK
      ?auto_173207 - BLOCK
      ?auto_173208 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173208 ) ( CLEAR ?auto_173207 ) ( ON-TABLE ?auto_173205 ) ( ON ?auto_173206 ?auto_173205 ) ( ON ?auto_173207 ?auto_173206 ) ( not ( = ?auto_173205 ?auto_173206 ) ) ( not ( = ?auto_173205 ?auto_173207 ) ) ( not ( = ?auto_173205 ?auto_173208 ) ) ( not ( = ?auto_173206 ?auto_173207 ) ) ( not ( = ?auto_173206 ?auto_173208 ) ) ( not ( = ?auto_173207 ?auto_173208 ) ) )
    :subtasks
    ( ( !STACK ?auto_173208 ?auto_173207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173209 - BLOCK
      ?auto_173210 - BLOCK
      ?auto_173211 - BLOCK
      ?auto_173212 - BLOCK
    )
    :vars
    (
      ?auto_173213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173211 ) ( ON-TABLE ?auto_173209 ) ( ON ?auto_173210 ?auto_173209 ) ( ON ?auto_173211 ?auto_173210 ) ( not ( = ?auto_173209 ?auto_173210 ) ) ( not ( = ?auto_173209 ?auto_173211 ) ) ( not ( = ?auto_173209 ?auto_173212 ) ) ( not ( = ?auto_173210 ?auto_173211 ) ) ( not ( = ?auto_173210 ?auto_173212 ) ) ( not ( = ?auto_173211 ?auto_173212 ) ) ( ON ?auto_173212 ?auto_173213 ) ( CLEAR ?auto_173212 ) ( HAND-EMPTY ) ( not ( = ?auto_173209 ?auto_173213 ) ) ( not ( = ?auto_173210 ?auto_173213 ) ) ( not ( = ?auto_173211 ?auto_173213 ) ) ( not ( = ?auto_173212 ?auto_173213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173212 ?auto_173213 )
      ( MAKE-4PILE ?auto_173209 ?auto_173210 ?auto_173211 ?auto_173212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173214 - BLOCK
      ?auto_173215 - BLOCK
      ?auto_173216 - BLOCK
      ?auto_173217 - BLOCK
    )
    :vars
    (
      ?auto_173218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173214 ) ( ON ?auto_173215 ?auto_173214 ) ( not ( = ?auto_173214 ?auto_173215 ) ) ( not ( = ?auto_173214 ?auto_173216 ) ) ( not ( = ?auto_173214 ?auto_173217 ) ) ( not ( = ?auto_173215 ?auto_173216 ) ) ( not ( = ?auto_173215 ?auto_173217 ) ) ( not ( = ?auto_173216 ?auto_173217 ) ) ( ON ?auto_173217 ?auto_173218 ) ( CLEAR ?auto_173217 ) ( not ( = ?auto_173214 ?auto_173218 ) ) ( not ( = ?auto_173215 ?auto_173218 ) ) ( not ( = ?auto_173216 ?auto_173218 ) ) ( not ( = ?auto_173217 ?auto_173218 ) ) ( HOLDING ?auto_173216 ) ( CLEAR ?auto_173215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173214 ?auto_173215 ?auto_173216 )
      ( MAKE-4PILE ?auto_173214 ?auto_173215 ?auto_173216 ?auto_173217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173219 - BLOCK
      ?auto_173220 - BLOCK
      ?auto_173221 - BLOCK
      ?auto_173222 - BLOCK
    )
    :vars
    (
      ?auto_173223 - BLOCK
      ?auto_173225 - BLOCK
      ?auto_173226 - BLOCK
      ?auto_173224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173219 ) ( ON ?auto_173220 ?auto_173219 ) ( not ( = ?auto_173219 ?auto_173220 ) ) ( not ( = ?auto_173219 ?auto_173221 ) ) ( not ( = ?auto_173219 ?auto_173222 ) ) ( not ( = ?auto_173220 ?auto_173221 ) ) ( not ( = ?auto_173220 ?auto_173222 ) ) ( not ( = ?auto_173221 ?auto_173222 ) ) ( ON ?auto_173222 ?auto_173223 ) ( not ( = ?auto_173219 ?auto_173223 ) ) ( not ( = ?auto_173220 ?auto_173223 ) ) ( not ( = ?auto_173221 ?auto_173223 ) ) ( not ( = ?auto_173222 ?auto_173223 ) ) ( CLEAR ?auto_173220 ) ( ON ?auto_173221 ?auto_173222 ) ( CLEAR ?auto_173221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173225 ) ( ON ?auto_173226 ?auto_173225 ) ( ON ?auto_173224 ?auto_173226 ) ( ON ?auto_173223 ?auto_173224 ) ( not ( = ?auto_173225 ?auto_173226 ) ) ( not ( = ?auto_173225 ?auto_173224 ) ) ( not ( = ?auto_173225 ?auto_173223 ) ) ( not ( = ?auto_173225 ?auto_173222 ) ) ( not ( = ?auto_173225 ?auto_173221 ) ) ( not ( = ?auto_173226 ?auto_173224 ) ) ( not ( = ?auto_173226 ?auto_173223 ) ) ( not ( = ?auto_173226 ?auto_173222 ) ) ( not ( = ?auto_173226 ?auto_173221 ) ) ( not ( = ?auto_173224 ?auto_173223 ) ) ( not ( = ?auto_173224 ?auto_173222 ) ) ( not ( = ?auto_173224 ?auto_173221 ) ) ( not ( = ?auto_173219 ?auto_173225 ) ) ( not ( = ?auto_173219 ?auto_173226 ) ) ( not ( = ?auto_173219 ?auto_173224 ) ) ( not ( = ?auto_173220 ?auto_173225 ) ) ( not ( = ?auto_173220 ?auto_173226 ) ) ( not ( = ?auto_173220 ?auto_173224 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173225 ?auto_173226 ?auto_173224 ?auto_173223 ?auto_173222 )
      ( MAKE-4PILE ?auto_173219 ?auto_173220 ?auto_173221 ?auto_173222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173227 - BLOCK
      ?auto_173228 - BLOCK
      ?auto_173229 - BLOCK
      ?auto_173230 - BLOCK
    )
    :vars
    (
      ?auto_173231 - BLOCK
      ?auto_173232 - BLOCK
      ?auto_173234 - BLOCK
      ?auto_173233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173227 ) ( not ( = ?auto_173227 ?auto_173228 ) ) ( not ( = ?auto_173227 ?auto_173229 ) ) ( not ( = ?auto_173227 ?auto_173230 ) ) ( not ( = ?auto_173228 ?auto_173229 ) ) ( not ( = ?auto_173228 ?auto_173230 ) ) ( not ( = ?auto_173229 ?auto_173230 ) ) ( ON ?auto_173230 ?auto_173231 ) ( not ( = ?auto_173227 ?auto_173231 ) ) ( not ( = ?auto_173228 ?auto_173231 ) ) ( not ( = ?auto_173229 ?auto_173231 ) ) ( not ( = ?auto_173230 ?auto_173231 ) ) ( ON ?auto_173229 ?auto_173230 ) ( CLEAR ?auto_173229 ) ( ON-TABLE ?auto_173232 ) ( ON ?auto_173234 ?auto_173232 ) ( ON ?auto_173233 ?auto_173234 ) ( ON ?auto_173231 ?auto_173233 ) ( not ( = ?auto_173232 ?auto_173234 ) ) ( not ( = ?auto_173232 ?auto_173233 ) ) ( not ( = ?auto_173232 ?auto_173231 ) ) ( not ( = ?auto_173232 ?auto_173230 ) ) ( not ( = ?auto_173232 ?auto_173229 ) ) ( not ( = ?auto_173234 ?auto_173233 ) ) ( not ( = ?auto_173234 ?auto_173231 ) ) ( not ( = ?auto_173234 ?auto_173230 ) ) ( not ( = ?auto_173234 ?auto_173229 ) ) ( not ( = ?auto_173233 ?auto_173231 ) ) ( not ( = ?auto_173233 ?auto_173230 ) ) ( not ( = ?auto_173233 ?auto_173229 ) ) ( not ( = ?auto_173227 ?auto_173232 ) ) ( not ( = ?auto_173227 ?auto_173234 ) ) ( not ( = ?auto_173227 ?auto_173233 ) ) ( not ( = ?auto_173228 ?auto_173232 ) ) ( not ( = ?auto_173228 ?auto_173234 ) ) ( not ( = ?auto_173228 ?auto_173233 ) ) ( HOLDING ?auto_173228 ) ( CLEAR ?auto_173227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173227 ?auto_173228 )
      ( MAKE-4PILE ?auto_173227 ?auto_173228 ?auto_173229 ?auto_173230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173235 - BLOCK
      ?auto_173236 - BLOCK
      ?auto_173237 - BLOCK
      ?auto_173238 - BLOCK
    )
    :vars
    (
      ?auto_173240 - BLOCK
      ?auto_173242 - BLOCK
      ?auto_173239 - BLOCK
      ?auto_173241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173235 ) ( not ( = ?auto_173235 ?auto_173236 ) ) ( not ( = ?auto_173235 ?auto_173237 ) ) ( not ( = ?auto_173235 ?auto_173238 ) ) ( not ( = ?auto_173236 ?auto_173237 ) ) ( not ( = ?auto_173236 ?auto_173238 ) ) ( not ( = ?auto_173237 ?auto_173238 ) ) ( ON ?auto_173238 ?auto_173240 ) ( not ( = ?auto_173235 ?auto_173240 ) ) ( not ( = ?auto_173236 ?auto_173240 ) ) ( not ( = ?auto_173237 ?auto_173240 ) ) ( not ( = ?auto_173238 ?auto_173240 ) ) ( ON ?auto_173237 ?auto_173238 ) ( ON-TABLE ?auto_173242 ) ( ON ?auto_173239 ?auto_173242 ) ( ON ?auto_173241 ?auto_173239 ) ( ON ?auto_173240 ?auto_173241 ) ( not ( = ?auto_173242 ?auto_173239 ) ) ( not ( = ?auto_173242 ?auto_173241 ) ) ( not ( = ?auto_173242 ?auto_173240 ) ) ( not ( = ?auto_173242 ?auto_173238 ) ) ( not ( = ?auto_173242 ?auto_173237 ) ) ( not ( = ?auto_173239 ?auto_173241 ) ) ( not ( = ?auto_173239 ?auto_173240 ) ) ( not ( = ?auto_173239 ?auto_173238 ) ) ( not ( = ?auto_173239 ?auto_173237 ) ) ( not ( = ?auto_173241 ?auto_173240 ) ) ( not ( = ?auto_173241 ?auto_173238 ) ) ( not ( = ?auto_173241 ?auto_173237 ) ) ( not ( = ?auto_173235 ?auto_173242 ) ) ( not ( = ?auto_173235 ?auto_173239 ) ) ( not ( = ?auto_173235 ?auto_173241 ) ) ( not ( = ?auto_173236 ?auto_173242 ) ) ( not ( = ?auto_173236 ?auto_173239 ) ) ( not ( = ?auto_173236 ?auto_173241 ) ) ( CLEAR ?auto_173235 ) ( ON ?auto_173236 ?auto_173237 ) ( CLEAR ?auto_173236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173242 ?auto_173239 ?auto_173241 ?auto_173240 ?auto_173238 ?auto_173237 )
      ( MAKE-4PILE ?auto_173235 ?auto_173236 ?auto_173237 ?auto_173238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173243 - BLOCK
      ?auto_173244 - BLOCK
      ?auto_173245 - BLOCK
      ?auto_173246 - BLOCK
    )
    :vars
    (
      ?auto_173247 - BLOCK
      ?auto_173250 - BLOCK
      ?auto_173249 - BLOCK
      ?auto_173248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173243 ?auto_173244 ) ) ( not ( = ?auto_173243 ?auto_173245 ) ) ( not ( = ?auto_173243 ?auto_173246 ) ) ( not ( = ?auto_173244 ?auto_173245 ) ) ( not ( = ?auto_173244 ?auto_173246 ) ) ( not ( = ?auto_173245 ?auto_173246 ) ) ( ON ?auto_173246 ?auto_173247 ) ( not ( = ?auto_173243 ?auto_173247 ) ) ( not ( = ?auto_173244 ?auto_173247 ) ) ( not ( = ?auto_173245 ?auto_173247 ) ) ( not ( = ?auto_173246 ?auto_173247 ) ) ( ON ?auto_173245 ?auto_173246 ) ( ON-TABLE ?auto_173250 ) ( ON ?auto_173249 ?auto_173250 ) ( ON ?auto_173248 ?auto_173249 ) ( ON ?auto_173247 ?auto_173248 ) ( not ( = ?auto_173250 ?auto_173249 ) ) ( not ( = ?auto_173250 ?auto_173248 ) ) ( not ( = ?auto_173250 ?auto_173247 ) ) ( not ( = ?auto_173250 ?auto_173246 ) ) ( not ( = ?auto_173250 ?auto_173245 ) ) ( not ( = ?auto_173249 ?auto_173248 ) ) ( not ( = ?auto_173249 ?auto_173247 ) ) ( not ( = ?auto_173249 ?auto_173246 ) ) ( not ( = ?auto_173249 ?auto_173245 ) ) ( not ( = ?auto_173248 ?auto_173247 ) ) ( not ( = ?auto_173248 ?auto_173246 ) ) ( not ( = ?auto_173248 ?auto_173245 ) ) ( not ( = ?auto_173243 ?auto_173250 ) ) ( not ( = ?auto_173243 ?auto_173249 ) ) ( not ( = ?auto_173243 ?auto_173248 ) ) ( not ( = ?auto_173244 ?auto_173250 ) ) ( not ( = ?auto_173244 ?auto_173249 ) ) ( not ( = ?auto_173244 ?auto_173248 ) ) ( ON ?auto_173244 ?auto_173245 ) ( CLEAR ?auto_173244 ) ( HOLDING ?auto_173243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173243 )
      ( MAKE-4PILE ?auto_173243 ?auto_173244 ?auto_173245 ?auto_173246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173251 - BLOCK
      ?auto_173252 - BLOCK
      ?auto_173253 - BLOCK
      ?auto_173254 - BLOCK
    )
    :vars
    (
      ?auto_173256 - BLOCK
      ?auto_173255 - BLOCK
      ?auto_173258 - BLOCK
      ?auto_173257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173251 ?auto_173252 ) ) ( not ( = ?auto_173251 ?auto_173253 ) ) ( not ( = ?auto_173251 ?auto_173254 ) ) ( not ( = ?auto_173252 ?auto_173253 ) ) ( not ( = ?auto_173252 ?auto_173254 ) ) ( not ( = ?auto_173253 ?auto_173254 ) ) ( ON ?auto_173254 ?auto_173256 ) ( not ( = ?auto_173251 ?auto_173256 ) ) ( not ( = ?auto_173252 ?auto_173256 ) ) ( not ( = ?auto_173253 ?auto_173256 ) ) ( not ( = ?auto_173254 ?auto_173256 ) ) ( ON ?auto_173253 ?auto_173254 ) ( ON-TABLE ?auto_173255 ) ( ON ?auto_173258 ?auto_173255 ) ( ON ?auto_173257 ?auto_173258 ) ( ON ?auto_173256 ?auto_173257 ) ( not ( = ?auto_173255 ?auto_173258 ) ) ( not ( = ?auto_173255 ?auto_173257 ) ) ( not ( = ?auto_173255 ?auto_173256 ) ) ( not ( = ?auto_173255 ?auto_173254 ) ) ( not ( = ?auto_173255 ?auto_173253 ) ) ( not ( = ?auto_173258 ?auto_173257 ) ) ( not ( = ?auto_173258 ?auto_173256 ) ) ( not ( = ?auto_173258 ?auto_173254 ) ) ( not ( = ?auto_173258 ?auto_173253 ) ) ( not ( = ?auto_173257 ?auto_173256 ) ) ( not ( = ?auto_173257 ?auto_173254 ) ) ( not ( = ?auto_173257 ?auto_173253 ) ) ( not ( = ?auto_173251 ?auto_173255 ) ) ( not ( = ?auto_173251 ?auto_173258 ) ) ( not ( = ?auto_173251 ?auto_173257 ) ) ( not ( = ?auto_173252 ?auto_173255 ) ) ( not ( = ?auto_173252 ?auto_173258 ) ) ( not ( = ?auto_173252 ?auto_173257 ) ) ( ON ?auto_173252 ?auto_173253 ) ( ON ?auto_173251 ?auto_173252 ) ( CLEAR ?auto_173251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173255 ?auto_173258 ?auto_173257 ?auto_173256 ?auto_173254 ?auto_173253 ?auto_173252 )
      ( MAKE-4PILE ?auto_173251 ?auto_173252 ?auto_173253 ?auto_173254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173259 - BLOCK
      ?auto_173260 - BLOCK
      ?auto_173261 - BLOCK
      ?auto_173262 - BLOCK
    )
    :vars
    (
      ?auto_173264 - BLOCK
      ?auto_173266 - BLOCK
      ?auto_173263 - BLOCK
      ?auto_173265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173259 ?auto_173260 ) ) ( not ( = ?auto_173259 ?auto_173261 ) ) ( not ( = ?auto_173259 ?auto_173262 ) ) ( not ( = ?auto_173260 ?auto_173261 ) ) ( not ( = ?auto_173260 ?auto_173262 ) ) ( not ( = ?auto_173261 ?auto_173262 ) ) ( ON ?auto_173262 ?auto_173264 ) ( not ( = ?auto_173259 ?auto_173264 ) ) ( not ( = ?auto_173260 ?auto_173264 ) ) ( not ( = ?auto_173261 ?auto_173264 ) ) ( not ( = ?auto_173262 ?auto_173264 ) ) ( ON ?auto_173261 ?auto_173262 ) ( ON-TABLE ?auto_173266 ) ( ON ?auto_173263 ?auto_173266 ) ( ON ?auto_173265 ?auto_173263 ) ( ON ?auto_173264 ?auto_173265 ) ( not ( = ?auto_173266 ?auto_173263 ) ) ( not ( = ?auto_173266 ?auto_173265 ) ) ( not ( = ?auto_173266 ?auto_173264 ) ) ( not ( = ?auto_173266 ?auto_173262 ) ) ( not ( = ?auto_173266 ?auto_173261 ) ) ( not ( = ?auto_173263 ?auto_173265 ) ) ( not ( = ?auto_173263 ?auto_173264 ) ) ( not ( = ?auto_173263 ?auto_173262 ) ) ( not ( = ?auto_173263 ?auto_173261 ) ) ( not ( = ?auto_173265 ?auto_173264 ) ) ( not ( = ?auto_173265 ?auto_173262 ) ) ( not ( = ?auto_173265 ?auto_173261 ) ) ( not ( = ?auto_173259 ?auto_173266 ) ) ( not ( = ?auto_173259 ?auto_173263 ) ) ( not ( = ?auto_173259 ?auto_173265 ) ) ( not ( = ?auto_173260 ?auto_173266 ) ) ( not ( = ?auto_173260 ?auto_173263 ) ) ( not ( = ?auto_173260 ?auto_173265 ) ) ( ON ?auto_173260 ?auto_173261 ) ( HOLDING ?auto_173259 ) ( CLEAR ?auto_173260 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173266 ?auto_173263 ?auto_173265 ?auto_173264 ?auto_173262 ?auto_173261 ?auto_173260 ?auto_173259 )
      ( MAKE-4PILE ?auto_173259 ?auto_173260 ?auto_173261 ?auto_173262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173267 - BLOCK
      ?auto_173268 - BLOCK
      ?auto_173269 - BLOCK
      ?auto_173270 - BLOCK
    )
    :vars
    (
      ?auto_173273 - BLOCK
      ?auto_173274 - BLOCK
      ?auto_173271 - BLOCK
      ?auto_173272 - BLOCK
      ?auto_173275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173267 ?auto_173268 ) ) ( not ( = ?auto_173267 ?auto_173269 ) ) ( not ( = ?auto_173267 ?auto_173270 ) ) ( not ( = ?auto_173268 ?auto_173269 ) ) ( not ( = ?auto_173268 ?auto_173270 ) ) ( not ( = ?auto_173269 ?auto_173270 ) ) ( ON ?auto_173270 ?auto_173273 ) ( not ( = ?auto_173267 ?auto_173273 ) ) ( not ( = ?auto_173268 ?auto_173273 ) ) ( not ( = ?auto_173269 ?auto_173273 ) ) ( not ( = ?auto_173270 ?auto_173273 ) ) ( ON ?auto_173269 ?auto_173270 ) ( ON-TABLE ?auto_173274 ) ( ON ?auto_173271 ?auto_173274 ) ( ON ?auto_173272 ?auto_173271 ) ( ON ?auto_173273 ?auto_173272 ) ( not ( = ?auto_173274 ?auto_173271 ) ) ( not ( = ?auto_173274 ?auto_173272 ) ) ( not ( = ?auto_173274 ?auto_173273 ) ) ( not ( = ?auto_173274 ?auto_173270 ) ) ( not ( = ?auto_173274 ?auto_173269 ) ) ( not ( = ?auto_173271 ?auto_173272 ) ) ( not ( = ?auto_173271 ?auto_173273 ) ) ( not ( = ?auto_173271 ?auto_173270 ) ) ( not ( = ?auto_173271 ?auto_173269 ) ) ( not ( = ?auto_173272 ?auto_173273 ) ) ( not ( = ?auto_173272 ?auto_173270 ) ) ( not ( = ?auto_173272 ?auto_173269 ) ) ( not ( = ?auto_173267 ?auto_173274 ) ) ( not ( = ?auto_173267 ?auto_173271 ) ) ( not ( = ?auto_173267 ?auto_173272 ) ) ( not ( = ?auto_173268 ?auto_173274 ) ) ( not ( = ?auto_173268 ?auto_173271 ) ) ( not ( = ?auto_173268 ?auto_173272 ) ) ( ON ?auto_173268 ?auto_173269 ) ( CLEAR ?auto_173268 ) ( ON ?auto_173267 ?auto_173275 ) ( CLEAR ?auto_173267 ) ( HAND-EMPTY ) ( not ( = ?auto_173267 ?auto_173275 ) ) ( not ( = ?auto_173268 ?auto_173275 ) ) ( not ( = ?auto_173269 ?auto_173275 ) ) ( not ( = ?auto_173270 ?auto_173275 ) ) ( not ( = ?auto_173273 ?auto_173275 ) ) ( not ( = ?auto_173274 ?auto_173275 ) ) ( not ( = ?auto_173271 ?auto_173275 ) ) ( not ( = ?auto_173272 ?auto_173275 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173267 ?auto_173275 )
      ( MAKE-4PILE ?auto_173267 ?auto_173268 ?auto_173269 ?auto_173270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173276 - BLOCK
      ?auto_173277 - BLOCK
      ?auto_173278 - BLOCK
      ?auto_173279 - BLOCK
    )
    :vars
    (
      ?auto_173283 - BLOCK
      ?auto_173282 - BLOCK
      ?auto_173280 - BLOCK
      ?auto_173281 - BLOCK
      ?auto_173284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173276 ?auto_173277 ) ) ( not ( = ?auto_173276 ?auto_173278 ) ) ( not ( = ?auto_173276 ?auto_173279 ) ) ( not ( = ?auto_173277 ?auto_173278 ) ) ( not ( = ?auto_173277 ?auto_173279 ) ) ( not ( = ?auto_173278 ?auto_173279 ) ) ( ON ?auto_173279 ?auto_173283 ) ( not ( = ?auto_173276 ?auto_173283 ) ) ( not ( = ?auto_173277 ?auto_173283 ) ) ( not ( = ?auto_173278 ?auto_173283 ) ) ( not ( = ?auto_173279 ?auto_173283 ) ) ( ON ?auto_173278 ?auto_173279 ) ( ON-TABLE ?auto_173282 ) ( ON ?auto_173280 ?auto_173282 ) ( ON ?auto_173281 ?auto_173280 ) ( ON ?auto_173283 ?auto_173281 ) ( not ( = ?auto_173282 ?auto_173280 ) ) ( not ( = ?auto_173282 ?auto_173281 ) ) ( not ( = ?auto_173282 ?auto_173283 ) ) ( not ( = ?auto_173282 ?auto_173279 ) ) ( not ( = ?auto_173282 ?auto_173278 ) ) ( not ( = ?auto_173280 ?auto_173281 ) ) ( not ( = ?auto_173280 ?auto_173283 ) ) ( not ( = ?auto_173280 ?auto_173279 ) ) ( not ( = ?auto_173280 ?auto_173278 ) ) ( not ( = ?auto_173281 ?auto_173283 ) ) ( not ( = ?auto_173281 ?auto_173279 ) ) ( not ( = ?auto_173281 ?auto_173278 ) ) ( not ( = ?auto_173276 ?auto_173282 ) ) ( not ( = ?auto_173276 ?auto_173280 ) ) ( not ( = ?auto_173276 ?auto_173281 ) ) ( not ( = ?auto_173277 ?auto_173282 ) ) ( not ( = ?auto_173277 ?auto_173280 ) ) ( not ( = ?auto_173277 ?auto_173281 ) ) ( ON ?auto_173276 ?auto_173284 ) ( CLEAR ?auto_173276 ) ( not ( = ?auto_173276 ?auto_173284 ) ) ( not ( = ?auto_173277 ?auto_173284 ) ) ( not ( = ?auto_173278 ?auto_173284 ) ) ( not ( = ?auto_173279 ?auto_173284 ) ) ( not ( = ?auto_173283 ?auto_173284 ) ) ( not ( = ?auto_173282 ?auto_173284 ) ) ( not ( = ?auto_173280 ?auto_173284 ) ) ( not ( = ?auto_173281 ?auto_173284 ) ) ( HOLDING ?auto_173277 ) ( CLEAR ?auto_173278 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173282 ?auto_173280 ?auto_173281 ?auto_173283 ?auto_173279 ?auto_173278 ?auto_173277 )
      ( MAKE-4PILE ?auto_173276 ?auto_173277 ?auto_173278 ?auto_173279 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173285 - BLOCK
      ?auto_173286 - BLOCK
      ?auto_173287 - BLOCK
      ?auto_173288 - BLOCK
    )
    :vars
    (
      ?auto_173290 - BLOCK
      ?auto_173291 - BLOCK
      ?auto_173293 - BLOCK
      ?auto_173289 - BLOCK
      ?auto_173292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173285 ?auto_173286 ) ) ( not ( = ?auto_173285 ?auto_173287 ) ) ( not ( = ?auto_173285 ?auto_173288 ) ) ( not ( = ?auto_173286 ?auto_173287 ) ) ( not ( = ?auto_173286 ?auto_173288 ) ) ( not ( = ?auto_173287 ?auto_173288 ) ) ( ON ?auto_173288 ?auto_173290 ) ( not ( = ?auto_173285 ?auto_173290 ) ) ( not ( = ?auto_173286 ?auto_173290 ) ) ( not ( = ?auto_173287 ?auto_173290 ) ) ( not ( = ?auto_173288 ?auto_173290 ) ) ( ON ?auto_173287 ?auto_173288 ) ( ON-TABLE ?auto_173291 ) ( ON ?auto_173293 ?auto_173291 ) ( ON ?auto_173289 ?auto_173293 ) ( ON ?auto_173290 ?auto_173289 ) ( not ( = ?auto_173291 ?auto_173293 ) ) ( not ( = ?auto_173291 ?auto_173289 ) ) ( not ( = ?auto_173291 ?auto_173290 ) ) ( not ( = ?auto_173291 ?auto_173288 ) ) ( not ( = ?auto_173291 ?auto_173287 ) ) ( not ( = ?auto_173293 ?auto_173289 ) ) ( not ( = ?auto_173293 ?auto_173290 ) ) ( not ( = ?auto_173293 ?auto_173288 ) ) ( not ( = ?auto_173293 ?auto_173287 ) ) ( not ( = ?auto_173289 ?auto_173290 ) ) ( not ( = ?auto_173289 ?auto_173288 ) ) ( not ( = ?auto_173289 ?auto_173287 ) ) ( not ( = ?auto_173285 ?auto_173291 ) ) ( not ( = ?auto_173285 ?auto_173293 ) ) ( not ( = ?auto_173285 ?auto_173289 ) ) ( not ( = ?auto_173286 ?auto_173291 ) ) ( not ( = ?auto_173286 ?auto_173293 ) ) ( not ( = ?auto_173286 ?auto_173289 ) ) ( ON ?auto_173285 ?auto_173292 ) ( not ( = ?auto_173285 ?auto_173292 ) ) ( not ( = ?auto_173286 ?auto_173292 ) ) ( not ( = ?auto_173287 ?auto_173292 ) ) ( not ( = ?auto_173288 ?auto_173292 ) ) ( not ( = ?auto_173290 ?auto_173292 ) ) ( not ( = ?auto_173291 ?auto_173292 ) ) ( not ( = ?auto_173293 ?auto_173292 ) ) ( not ( = ?auto_173289 ?auto_173292 ) ) ( CLEAR ?auto_173287 ) ( ON ?auto_173286 ?auto_173285 ) ( CLEAR ?auto_173286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173292 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173292 ?auto_173285 )
      ( MAKE-4PILE ?auto_173285 ?auto_173286 ?auto_173287 ?auto_173288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173294 - BLOCK
      ?auto_173295 - BLOCK
      ?auto_173296 - BLOCK
      ?auto_173297 - BLOCK
    )
    :vars
    (
      ?auto_173300 - BLOCK
      ?auto_173301 - BLOCK
      ?auto_173302 - BLOCK
      ?auto_173298 - BLOCK
      ?auto_173299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173294 ?auto_173295 ) ) ( not ( = ?auto_173294 ?auto_173296 ) ) ( not ( = ?auto_173294 ?auto_173297 ) ) ( not ( = ?auto_173295 ?auto_173296 ) ) ( not ( = ?auto_173295 ?auto_173297 ) ) ( not ( = ?auto_173296 ?auto_173297 ) ) ( ON ?auto_173297 ?auto_173300 ) ( not ( = ?auto_173294 ?auto_173300 ) ) ( not ( = ?auto_173295 ?auto_173300 ) ) ( not ( = ?auto_173296 ?auto_173300 ) ) ( not ( = ?auto_173297 ?auto_173300 ) ) ( ON-TABLE ?auto_173301 ) ( ON ?auto_173302 ?auto_173301 ) ( ON ?auto_173298 ?auto_173302 ) ( ON ?auto_173300 ?auto_173298 ) ( not ( = ?auto_173301 ?auto_173302 ) ) ( not ( = ?auto_173301 ?auto_173298 ) ) ( not ( = ?auto_173301 ?auto_173300 ) ) ( not ( = ?auto_173301 ?auto_173297 ) ) ( not ( = ?auto_173301 ?auto_173296 ) ) ( not ( = ?auto_173302 ?auto_173298 ) ) ( not ( = ?auto_173302 ?auto_173300 ) ) ( not ( = ?auto_173302 ?auto_173297 ) ) ( not ( = ?auto_173302 ?auto_173296 ) ) ( not ( = ?auto_173298 ?auto_173300 ) ) ( not ( = ?auto_173298 ?auto_173297 ) ) ( not ( = ?auto_173298 ?auto_173296 ) ) ( not ( = ?auto_173294 ?auto_173301 ) ) ( not ( = ?auto_173294 ?auto_173302 ) ) ( not ( = ?auto_173294 ?auto_173298 ) ) ( not ( = ?auto_173295 ?auto_173301 ) ) ( not ( = ?auto_173295 ?auto_173302 ) ) ( not ( = ?auto_173295 ?auto_173298 ) ) ( ON ?auto_173294 ?auto_173299 ) ( not ( = ?auto_173294 ?auto_173299 ) ) ( not ( = ?auto_173295 ?auto_173299 ) ) ( not ( = ?auto_173296 ?auto_173299 ) ) ( not ( = ?auto_173297 ?auto_173299 ) ) ( not ( = ?auto_173300 ?auto_173299 ) ) ( not ( = ?auto_173301 ?auto_173299 ) ) ( not ( = ?auto_173302 ?auto_173299 ) ) ( not ( = ?auto_173298 ?auto_173299 ) ) ( ON ?auto_173295 ?auto_173294 ) ( CLEAR ?auto_173295 ) ( ON-TABLE ?auto_173299 ) ( HOLDING ?auto_173296 ) ( CLEAR ?auto_173297 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173301 ?auto_173302 ?auto_173298 ?auto_173300 ?auto_173297 ?auto_173296 )
      ( MAKE-4PILE ?auto_173294 ?auto_173295 ?auto_173296 ?auto_173297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173303 - BLOCK
      ?auto_173304 - BLOCK
      ?auto_173305 - BLOCK
      ?auto_173306 - BLOCK
    )
    :vars
    (
      ?auto_173307 - BLOCK
      ?auto_173308 - BLOCK
      ?auto_173309 - BLOCK
      ?auto_173310 - BLOCK
      ?auto_173311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173303 ?auto_173304 ) ) ( not ( = ?auto_173303 ?auto_173305 ) ) ( not ( = ?auto_173303 ?auto_173306 ) ) ( not ( = ?auto_173304 ?auto_173305 ) ) ( not ( = ?auto_173304 ?auto_173306 ) ) ( not ( = ?auto_173305 ?auto_173306 ) ) ( ON ?auto_173306 ?auto_173307 ) ( not ( = ?auto_173303 ?auto_173307 ) ) ( not ( = ?auto_173304 ?auto_173307 ) ) ( not ( = ?auto_173305 ?auto_173307 ) ) ( not ( = ?auto_173306 ?auto_173307 ) ) ( ON-TABLE ?auto_173308 ) ( ON ?auto_173309 ?auto_173308 ) ( ON ?auto_173310 ?auto_173309 ) ( ON ?auto_173307 ?auto_173310 ) ( not ( = ?auto_173308 ?auto_173309 ) ) ( not ( = ?auto_173308 ?auto_173310 ) ) ( not ( = ?auto_173308 ?auto_173307 ) ) ( not ( = ?auto_173308 ?auto_173306 ) ) ( not ( = ?auto_173308 ?auto_173305 ) ) ( not ( = ?auto_173309 ?auto_173310 ) ) ( not ( = ?auto_173309 ?auto_173307 ) ) ( not ( = ?auto_173309 ?auto_173306 ) ) ( not ( = ?auto_173309 ?auto_173305 ) ) ( not ( = ?auto_173310 ?auto_173307 ) ) ( not ( = ?auto_173310 ?auto_173306 ) ) ( not ( = ?auto_173310 ?auto_173305 ) ) ( not ( = ?auto_173303 ?auto_173308 ) ) ( not ( = ?auto_173303 ?auto_173309 ) ) ( not ( = ?auto_173303 ?auto_173310 ) ) ( not ( = ?auto_173304 ?auto_173308 ) ) ( not ( = ?auto_173304 ?auto_173309 ) ) ( not ( = ?auto_173304 ?auto_173310 ) ) ( ON ?auto_173303 ?auto_173311 ) ( not ( = ?auto_173303 ?auto_173311 ) ) ( not ( = ?auto_173304 ?auto_173311 ) ) ( not ( = ?auto_173305 ?auto_173311 ) ) ( not ( = ?auto_173306 ?auto_173311 ) ) ( not ( = ?auto_173307 ?auto_173311 ) ) ( not ( = ?auto_173308 ?auto_173311 ) ) ( not ( = ?auto_173309 ?auto_173311 ) ) ( not ( = ?auto_173310 ?auto_173311 ) ) ( ON ?auto_173304 ?auto_173303 ) ( ON-TABLE ?auto_173311 ) ( CLEAR ?auto_173306 ) ( ON ?auto_173305 ?auto_173304 ) ( CLEAR ?auto_173305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173311 ?auto_173303 ?auto_173304 )
      ( MAKE-4PILE ?auto_173303 ?auto_173304 ?auto_173305 ?auto_173306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173312 - BLOCK
      ?auto_173313 - BLOCK
      ?auto_173314 - BLOCK
      ?auto_173315 - BLOCK
    )
    :vars
    (
      ?auto_173317 - BLOCK
      ?auto_173319 - BLOCK
      ?auto_173318 - BLOCK
      ?auto_173316 - BLOCK
      ?auto_173320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173312 ?auto_173313 ) ) ( not ( = ?auto_173312 ?auto_173314 ) ) ( not ( = ?auto_173312 ?auto_173315 ) ) ( not ( = ?auto_173313 ?auto_173314 ) ) ( not ( = ?auto_173313 ?auto_173315 ) ) ( not ( = ?auto_173314 ?auto_173315 ) ) ( not ( = ?auto_173312 ?auto_173317 ) ) ( not ( = ?auto_173313 ?auto_173317 ) ) ( not ( = ?auto_173314 ?auto_173317 ) ) ( not ( = ?auto_173315 ?auto_173317 ) ) ( ON-TABLE ?auto_173319 ) ( ON ?auto_173318 ?auto_173319 ) ( ON ?auto_173316 ?auto_173318 ) ( ON ?auto_173317 ?auto_173316 ) ( not ( = ?auto_173319 ?auto_173318 ) ) ( not ( = ?auto_173319 ?auto_173316 ) ) ( not ( = ?auto_173319 ?auto_173317 ) ) ( not ( = ?auto_173319 ?auto_173315 ) ) ( not ( = ?auto_173319 ?auto_173314 ) ) ( not ( = ?auto_173318 ?auto_173316 ) ) ( not ( = ?auto_173318 ?auto_173317 ) ) ( not ( = ?auto_173318 ?auto_173315 ) ) ( not ( = ?auto_173318 ?auto_173314 ) ) ( not ( = ?auto_173316 ?auto_173317 ) ) ( not ( = ?auto_173316 ?auto_173315 ) ) ( not ( = ?auto_173316 ?auto_173314 ) ) ( not ( = ?auto_173312 ?auto_173319 ) ) ( not ( = ?auto_173312 ?auto_173318 ) ) ( not ( = ?auto_173312 ?auto_173316 ) ) ( not ( = ?auto_173313 ?auto_173319 ) ) ( not ( = ?auto_173313 ?auto_173318 ) ) ( not ( = ?auto_173313 ?auto_173316 ) ) ( ON ?auto_173312 ?auto_173320 ) ( not ( = ?auto_173312 ?auto_173320 ) ) ( not ( = ?auto_173313 ?auto_173320 ) ) ( not ( = ?auto_173314 ?auto_173320 ) ) ( not ( = ?auto_173315 ?auto_173320 ) ) ( not ( = ?auto_173317 ?auto_173320 ) ) ( not ( = ?auto_173319 ?auto_173320 ) ) ( not ( = ?auto_173318 ?auto_173320 ) ) ( not ( = ?auto_173316 ?auto_173320 ) ) ( ON ?auto_173313 ?auto_173312 ) ( ON-TABLE ?auto_173320 ) ( ON ?auto_173314 ?auto_173313 ) ( CLEAR ?auto_173314 ) ( HOLDING ?auto_173315 ) ( CLEAR ?auto_173317 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173319 ?auto_173318 ?auto_173316 ?auto_173317 ?auto_173315 )
      ( MAKE-4PILE ?auto_173312 ?auto_173313 ?auto_173314 ?auto_173315 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173321 - BLOCK
      ?auto_173322 - BLOCK
      ?auto_173323 - BLOCK
      ?auto_173324 - BLOCK
    )
    :vars
    (
      ?auto_173328 - BLOCK
      ?auto_173327 - BLOCK
      ?auto_173326 - BLOCK
      ?auto_173325 - BLOCK
      ?auto_173329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173321 ?auto_173322 ) ) ( not ( = ?auto_173321 ?auto_173323 ) ) ( not ( = ?auto_173321 ?auto_173324 ) ) ( not ( = ?auto_173322 ?auto_173323 ) ) ( not ( = ?auto_173322 ?auto_173324 ) ) ( not ( = ?auto_173323 ?auto_173324 ) ) ( not ( = ?auto_173321 ?auto_173328 ) ) ( not ( = ?auto_173322 ?auto_173328 ) ) ( not ( = ?auto_173323 ?auto_173328 ) ) ( not ( = ?auto_173324 ?auto_173328 ) ) ( ON-TABLE ?auto_173327 ) ( ON ?auto_173326 ?auto_173327 ) ( ON ?auto_173325 ?auto_173326 ) ( ON ?auto_173328 ?auto_173325 ) ( not ( = ?auto_173327 ?auto_173326 ) ) ( not ( = ?auto_173327 ?auto_173325 ) ) ( not ( = ?auto_173327 ?auto_173328 ) ) ( not ( = ?auto_173327 ?auto_173324 ) ) ( not ( = ?auto_173327 ?auto_173323 ) ) ( not ( = ?auto_173326 ?auto_173325 ) ) ( not ( = ?auto_173326 ?auto_173328 ) ) ( not ( = ?auto_173326 ?auto_173324 ) ) ( not ( = ?auto_173326 ?auto_173323 ) ) ( not ( = ?auto_173325 ?auto_173328 ) ) ( not ( = ?auto_173325 ?auto_173324 ) ) ( not ( = ?auto_173325 ?auto_173323 ) ) ( not ( = ?auto_173321 ?auto_173327 ) ) ( not ( = ?auto_173321 ?auto_173326 ) ) ( not ( = ?auto_173321 ?auto_173325 ) ) ( not ( = ?auto_173322 ?auto_173327 ) ) ( not ( = ?auto_173322 ?auto_173326 ) ) ( not ( = ?auto_173322 ?auto_173325 ) ) ( ON ?auto_173321 ?auto_173329 ) ( not ( = ?auto_173321 ?auto_173329 ) ) ( not ( = ?auto_173322 ?auto_173329 ) ) ( not ( = ?auto_173323 ?auto_173329 ) ) ( not ( = ?auto_173324 ?auto_173329 ) ) ( not ( = ?auto_173328 ?auto_173329 ) ) ( not ( = ?auto_173327 ?auto_173329 ) ) ( not ( = ?auto_173326 ?auto_173329 ) ) ( not ( = ?auto_173325 ?auto_173329 ) ) ( ON ?auto_173322 ?auto_173321 ) ( ON-TABLE ?auto_173329 ) ( ON ?auto_173323 ?auto_173322 ) ( CLEAR ?auto_173328 ) ( ON ?auto_173324 ?auto_173323 ) ( CLEAR ?auto_173324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173329 ?auto_173321 ?auto_173322 ?auto_173323 )
      ( MAKE-4PILE ?auto_173321 ?auto_173322 ?auto_173323 ?auto_173324 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173330 - BLOCK
      ?auto_173331 - BLOCK
      ?auto_173332 - BLOCK
      ?auto_173333 - BLOCK
    )
    :vars
    (
      ?auto_173338 - BLOCK
      ?auto_173337 - BLOCK
      ?auto_173335 - BLOCK
      ?auto_173336 - BLOCK
      ?auto_173334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173330 ?auto_173331 ) ) ( not ( = ?auto_173330 ?auto_173332 ) ) ( not ( = ?auto_173330 ?auto_173333 ) ) ( not ( = ?auto_173331 ?auto_173332 ) ) ( not ( = ?auto_173331 ?auto_173333 ) ) ( not ( = ?auto_173332 ?auto_173333 ) ) ( not ( = ?auto_173330 ?auto_173338 ) ) ( not ( = ?auto_173331 ?auto_173338 ) ) ( not ( = ?auto_173332 ?auto_173338 ) ) ( not ( = ?auto_173333 ?auto_173338 ) ) ( ON-TABLE ?auto_173337 ) ( ON ?auto_173335 ?auto_173337 ) ( ON ?auto_173336 ?auto_173335 ) ( not ( = ?auto_173337 ?auto_173335 ) ) ( not ( = ?auto_173337 ?auto_173336 ) ) ( not ( = ?auto_173337 ?auto_173338 ) ) ( not ( = ?auto_173337 ?auto_173333 ) ) ( not ( = ?auto_173337 ?auto_173332 ) ) ( not ( = ?auto_173335 ?auto_173336 ) ) ( not ( = ?auto_173335 ?auto_173338 ) ) ( not ( = ?auto_173335 ?auto_173333 ) ) ( not ( = ?auto_173335 ?auto_173332 ) ) ( not ( = ?auto_173336 ?auto_173338 ) ) ( not ( = ?auto_173336 ?auto_173333 ) ) ( not ( = ?auto_173336 ?auto_173332 ) ) ( not ( = ?auto_173330 ?auto_173337 ) ) ( not ( = ?auto_173330 ?auto_173335 ) ) ( not ( = ?auto_173330 ?auto_173336 ) ) ( not ( = ?auto_173331 ?auto_173337 ) ) ( not ( = ?auto_173331 ?auto_173335 ) ) ( not ( = ?auto_173331 ?auto_173336 ) ) ( ON ?auto_173330 ?auto_173334 ) ( not ( = ?auto_173330 ?auto_173334 ) ) ( not ( = ?auto_173331 ?auto_173334 ) ) ( not ( = ?auto_173332 ?auto_173334 ) ) ( not ( = ?auto_173333 ?auto_173334 ) ) ( not ( = ?auto_173338 ?auto_173334 ) ) ( not ( = ?auto_173337 ?auto_173334 ) ) ( not ( = ?auto_173335 ?auto_173334 ) ) ( not ( = ?auto_173336 ?auto_173334 ) ) ( ON ?auto_173331 ?auto_173330 ) ( ON-TABLE ?auto_173334 ) ( ON ?auto_173332 ?auto_173331 ) ( ON ?auto_173333 ?auto_173332 ) ( CLEAR ?auto_173333 ) ( HOLDING ?auto_173338 ) ( CLEAR ?auto_173336 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173337 ?auto_173335 ?auto_173336 ?auto_173338 )
      ( MAKE-4PILE ?auto_173330 ?auto_173331 ?auto_173332 ?auto_173333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173339 - BLOCK
      ?auto_173340 - BLOCK
      ?auto_173341 - BLOCK
      ?auto_173342 - BLOCK
    )
    :vars
    (
      ?auto_173346 - BLOCK
      ?auto_173345 - BLOCK
      ?auto_173343 - BLOCK
      ?auto_173347 - BLOCK
      ?auto_173344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173339 ?auto_173340 ) ) ( not ( = ?auto_173339 ?auto_173341 ) ) ( not ( = ?auto_173339 ?auto_173342 ) ) ( not ( = ?auto_173340 ?auto_173341 ) ) ( not ( = ?auto_173340 ?auto_173342 ) ) ( not ( = ?auto_173341 ?auto_173342 ) ) ( not ( = ?auto_173339 ?auto_173346 ) ) ( not ( = ?auto_173340 ?auto_173346 ) ) ( not ( = ?auto_173341 ?auto_173346 ) ) ( not ( = ?auto_173342 ?auto_173346 ) ) ( ON-TABLE ?auto_173345 ) ( ON ?auto_173343 ?auto_173345 ) ( ON ?auto_173347 ?auto_173343 ) ( not ( = ?auto_173345 ?auto_173343 ) ) ( not ( = ?auto_173345 ?auto_173347 ) ) ( not ( = ?auto_173345 ?auto_173346 ) ) ( not ( = ?auto_173345 ?auto_173342 ) ) ( not ( = ?auto_173345 ?auto_173341 ) ) ( not ( = ?auto_173343 ?auto_173347 ) ) ( not ( = ?auto_173343 ?auto_173346 ) ) ( not ( = ?auto_173343 ?auto_173342 ) ) ( not ( = ?auto_173343 ?auto_173341 ) ) ( not ( = ?auto_173347 ?auto_173346 ) ) ( not ( = ?auto_173347 ?auto_173342 ) ) ( not ( = ?auto_173347 ?auto_173341 ) ) ( not ( = ?auto_173339 ?auto_173345 ) ) ( not ( = ?auto_173339 ?auto_173343 ) ) ( not ( = ?auto_173339 ?auto_173347 ) ) ( not ( = ?auto_173340 ?auto_173345 ) ) ( not ( = ?auto_173340 ?auto_173343 ) ) ( not ( = ?auto_173340 ?auto_173347 ) ) ( ON ?auto_173339 ?auto_173344 ) ( not ( = ?auto_173339 ?auto_173344 ) ) ( not ( = ?auto_173340 ?auto_173344 ) ) ( not ( = ?auto_173341 ?auto_173344 ) ) ( not ( = ?auto_173342 ?auto_173344 ) ) ( not ( = ?auto_173346 ?auto_173344 ) ) ( not ( = ?auto_173345 ?auto_173344 ) ) ( not ( = ?auto_173343 ?auto_173344 ) ) ( not ( = ?auto_173347 ?auto_173344 ) ) ( ON ?auto_173340 ?auto_173339 ) ( ON-TABLE ?auto_173344 ) ( ON ?auto_173341 ?auto_173340 ) ( ON ?auto_173342 ?auto_173341 ) ( CLEAR ?auto_173347 ) ( ON ?auto_173346 ?auto_173342 ) ( CLEAR ?auto_173346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173344 ?auto_173339 ?auto_173340 ?auto_173341 ?auto_173342 )
      ( MAKE-4PILE ?auto_173339 ?auto_173340 ?auto_173341 ?auto_173342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173348 - BLOCK
      ?auto_173349 - BLOCK
      ?auto_173350 - BLOCK
      ?auto_173351 - BLOCK
    )
    :vars
    (
      ?auto_173352 - BLOCK
      ?auto_173356 - BLOCK
      ?auto_173353 - BLOCK
      ?auto_173355 - BLOCK
      ?auto_173354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173348 ?auto_173349 ) ) ( not ( = ?auto_173348 ?auto_173350 ) ) ( not ( = ?auto_173348 ?auto_173351 ) ) ( not ( = ?auto_173349 ?auto_173350 ) ) ( not ( = ?auto_173349 ?auto_173351 ) ) ( not ( = ?auto_173350 ?auto_173351 ) ) ( not ( = ?auto_173348 ?auto_173352 ) ) ( not ( = ?auto_173349 ?auto_173352 ) ) ( not ( = ?auto_173350 ?auto_173352 ) ) ( not ( = ?auto_173351 ?auto_173352 ) ) ( ON-TABLE ?auto_173356 ) ( ON ?auto_173353 ?auto_173356 ) ( not ( = ?auto_173356 ?auto_173353 ) ) ( not ( = ?auto_173356 ?auto_173355 ) ) ( not ( = ?auto_173356 ?auto_173352 ) ) ( not ( = ?auto_173356 ?auto_173351 ) ) ( not ( = ?auto_173356 ?auto_173350 ) ) ( not ( = ?auto_173353 ?auto_173355 ) ) ( not ( = ?auto_173353 ?auto_173352 ) ) ( not ( = ?auto_173353 ?auto_173351 ) ) ( not ( = ?auto_173353 ?auto_173350 ) ) ( not ( = ?auto_173355 ?auto_173352 ) ) ( not ( = ?auto_173355 ?auto_173351 ) ) ( not ( = ?auto_173355 ?auto_173350 ) ) ( not ( = ?auto_173348 ?auto_173356 ) ) ( not ( = ?auto_173348 ?auto_173353 ) ) ( not ( = ?auto_173348 ?auto_173355 ) ) ( not ( = ?auto_173349 ?auto_173356 ) ) ( not ( = ?auto_173349 ?auto_173353 ) ) ( not ( = ?auto_173349 ?auto_173355 ) ) ( ON ?auto_173348 ?auto_173354 ) ( not ( = ?auto_173348 ?auto_173354 ) ) ( not ( = ?auto_173349 ?auto_173354 ) ) ( not ( = ?auto_173350 ?auto_173354 ) ) ( not ( = ?auto_173351 ?auto_173354 ) ) ( not ( = ?auto_173352 ?auto_173354 ) ) ( not ( = ?auto_173356 ?auto_173354 ) ) ( not ( = ?auto_173353 ?auto_173354 ) ) ( not ( = ?auto_173355 ?auto_173354 ) ) ( ON ?auto_173349 ?auto_173348 ) ( ON-TABLE ?auto_173354 ) ( ON ?auto_173350 ?auto_173349 ) ( ON ?auto_173351 ?auto_173350 ) ( ON ?auto_173352 ?auto_173351 ) ( CLEAR ?auto_173352 ) ( HOLDING ?auto_173355 ) ( CLEAR ?auto_173353 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173356 ?auto_173353 ?auto_173355 )
      ( MAKE-4PILE ?auto_173348 ?auto_173349 ?auto_173350 ?auto_173351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173357 - BLOCK
      ?auto_173358 - BLOCK
      ?auto_173359 - BLOCK
      ?auto_173360 - BLOCK
    )
    :vars
    (
      ?auto_173365 - BLOCK
      ?auto_173363 - BLOCK
      ?auto_173362 - BLOCK
      ?auto_173361 - BLOCK
      ?auto_173364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173357 ?auto_173358 ) ) ( not ( = ?auto_173357 ?auto_173359 ) ) ( not ( = ?auto_173357 ?auto_173360 ) ) ( not ( = ?auto_173358 ?auto_173359 ) ) ( not ( = ?auto_173358 ?auto_173360 ) ) ( not ( = ?auto_173359 ?auto_173360 ) ) ( not ( = ?auto_173357 ?auto_173365 ) ) ( not ( = ?auto_173358 ?auto_173365 ) ) ( not ( = ?auto_173359 ?auto_173365 ) ) ( not ( = ?auto_173360 ?auto_173365 ) ) ( ON-TABLE ?auto_173363 ) ( ON ?auto_173362 ?auto_173363 ) ( not ( = ?auto_173363 ?auto_173362 ) ) ( not ( = ?auto_173363 ?auto_173361 ) ) ( not ( = ?auto_173363 ?auto_173365 ) ) ( not ( = ?auto_173363 ?auto_173360 ) ) ( not ( = ?auto_173363 ?auto_173359 ) ) ( not ( = ?auto_173362 ?auto_173361 ) ) ( not ( = ?auto_173362 ?auto_173365 ) ) ( not ( = ?auto_173362 ?auto_173360 ) ) ( not ( = ?auto_173362 ?auto_173359 ) ) ( not ( = ?auto_173361 ?auto_173365 ) ) ( not ( = ?auto_173361 ?auto_173360 ) ) ( not ( = ?auto_173361 ?auto_173359 ) ) ( not ( = ?auto_173357 ?auto_173363 ) ) ( not ( = ?auto_173357 ?auto_173362 ) ) ( not ( = ?auto_173357 ?auto_173361 ) ) ( not ( = ?auto_173358 ?auto_173363 ) ) ( not ( = ?auto_173358 ?auto_173362 ) ) ( not ( = ?auto_173358 ?auto_173361 ) ) ( ON ?auto_173357 ?auto_173364 ) ( not ( = ?auto_173357 ?auto_173364 ) ) ( not ( = ?auto_173358 ?auto_173364 ) ) ( not ( = ?auto_173359 ?auto_173364 ) ) ( not ( = ?auto_173360 ?auto_173364 ) ) ( not ( = ?auto_173365 ?auto_173364 ) ) ( not ( = ?auto_173363 ?auto_173364 ) ) ( not ( = ?auto_173362 ?auto_173364 ) ) ( not ( = ?auto_173361 ?auto_173364 ) ) ( ON ?auto_173358 ?auto_173357 ) ( ON-TABLE ?auto_173364 ) ( ON ?auto_173359 ?auto_173358 ) ( ON ?auto_173360 ?auto_173359 ) ( ON ?auto_173365 ?auto_173360 ) ( CLEAR ?auto_173362 ) ( ON ?auto_173361 ?auto_173365 ) ( CLEAR ?auto_173361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173364 ?auto_173357 ?auto_173358 ?auto_173359 ?auto_173360 ?auto_173365 )
      ( MAKE-4PILE ?auto_173357 ?auto_173358 ?auto_173359 ?auto_173360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173366 - BLOCK
      ?auto_173367 - BLOCK
      ?auto_173368 - BLOCK
      ?auto_173369 - BLOCK
    )
    :vars
    (
      ?auto_173372 - BLOCK
      ?auto_173374 - BLOCK
      ?auto_173370 - BLOCK
      ?auto_173373 - BLOCK
      ?auto_173371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173366 ?auto_173367 ) ) ( not ( = ?auto_173366 ?auto_173368 ) ) ( not ( = ?auto_173366 ?auto_173369 ) ) ( not ( = ?auto_173367 ?auto_173368 ) ) ( not ( = ?auto_173367 ?auto_173369 ) ) ( not ( = ?auto_173368 ?auto_173369 ) ) ( not ( = ?auto_173366 ?auto_173372 ) ) ( not ( = ?auto_173367 ?auto_173372 ) ) ( not ( = ?auto_173368 ?auto_173372 ) ) ( not ( = ?auto_173369 ?auto_173372 ) ) ( ON-TABLE ?auto_173374 ) ( not ( = ?auto_173374 ?auto_173370 ) ) ( not ( = ?auto_173374 ?auto_173373 ) ) ( not ( = ?auto_173374 ?auto_173372 ) ) ( not ( = ?auto_173374 ?auto_173369 ) ) ( not ( = ?auto_173374 ?auto_173368 ) ) ( not ( = ?auto_173370 ?auto_173373 ) ) ( not ( = ?auto_173370 ?auto_173372 ) ) ( not ( = ?auto_173370 ?auto_173369 ) ) ( not ( = ?auto_173370 ?auto_173368 ) ) ( not ( = ?auto_173373 ?auto_173372 ) ) ( not ( = ?auto_173373 ?auto_173369 ) ) ( not ( = ?auto_173373 ?auto_173368 ) ) ( not ( = ?auto_173366 ?auto_173374 ) ) ( not ( = ?auto_173366 ?auto_173370 ) ) ( not ( = ?auto_173366 ?auto_173373 ) ) ( not ( = ?auto_173367 ?auto_173374 ) ) ( not ( = ?auto_173367 ?auto_173370 ) ) ( not ( = ?auto_173367 ?auto_173373 ) ) ( ON ?auto_173366 ?auto_173371 ) ( not ( = ?auto_173366 ?auto_173371 ) ) ( not ( = ?auto_173367 ?auto_173371 ) ) ( not ( = ?auto_173368 ?auto_173371 ) ) ( not ( = ?auto_173369 ?auto_173371 ) ) ( not ( = ?auto_173372 ?auto_173371 ) ) ( not ( = ?auto_173374 ?auto_173371 ) ) ( not ( = ?auto_173370 ?auto_173371 ) ) ( not ( = ?auto_173373 ?auto_173371 ) ) ( ON ?auto_173367 ?auto_173366 ) ( ON-TABLE ?auto_173371 ) ( ON ?auto_173368 ?auto_173367 ) ( ON ?auto_173369 ?auto_173368 ) ( ON ?auto_173372 ?auto_173369 ) ( ON ?auto_173373 ?auto_173372 ) ( CLEAR ?auto_173373 ) ( HOLDING ?auto_173370 ) ( CLEAR ?auto_173374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173374 ?auto_173370 )
      ( MAKE-4PILE ?auto_173366 ?auto_173367 ?auto_173368 ?auto_173369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173375 - BLOCK
      ?auto_173376 - BLOCK
      ?auto_173377 - BLOCK
      ?auto_173378 - BLOCK
    )
    :vars
    (
      ?auto_173381 - BLOCK
      ?auto_173380 - BLOCK
      ?auto_173379 - BLOCK
      ?auto_173383 - BLOCK
      ?auto_173382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173375 ?auto_173376 ) ) ( not ( = ?auto_173375 ?auto_173377 ) ) ( not ( = ?auto_173375 ?auto_173378 ) ) ( not ( = ?auto_173376 ?auto_173377 ) ) ( not ( = ?auto_173376 ?auto_173378 ) ) ( not ( = ?auto_173377 ?auto_173378 ) ) ( not ( = ?auto_173375 ?auto_173381 ) ) ( not ( = ?auto_173376 ?auto_173381 ) ) ( not ( = ?auto_173377 ?auto_173381 ) ) ( not ( = ?auto_173378 ?auto_173381 ) ) ( ON-TABLE ?auto_173380 ) ( not ( = ?auto_173380 ?auto_173379 ) ) ( not ( = ?auto_173380 ?auto_173383 ) ) ( not ( = ?auto_173380 ?auto_173381 ) ) ( not ( = ?auto_173380 ?auto_173378 ) ) ( not ( = ?auto_173380 ?auto_173377 ) ) ( not ( = ?auto_173379 ?auto_173383 ) ) ( not ( = ?auto_173379 ?auto_173381 ) ) ( not ( = ?auto_173379 ?auto_173378 ) ) ( not ( = ?auto_173379 ?auto_173377 ) ) ( not ( = ?auto_173383 ?auto_173381 ) ) ( not ( = ?auto_173383 ?auto_173378 ) ) ( not ( = ?auto_173383 ?auto_173377 ) ) ( not ( = ?auto_173375 ?auto_173380 ) ) ( not ( = ?auto_173375 ?auto_173379 ) ) ( not ( = ?auto_173375 ?auto_173383 ) ) ( not ( = ?auto_173376 ?auto_173380 ) ) ( not ( = ?auto_173376 ?auto_173379 ) ) ( not ( = ?auto_173376 ?auto_173383 ) ) ( ON ?auto_173375 ?auto_173382 ) ( not ( = ?auto_173375 ?auto_173382 ) ) ( not ( = ?auto_173376 ?auto_173382 ) ) ( not ( = ?auto_173377 ?auto_173382 ) ) ( not ( = ?auto_173378 ?auto_173382 ) ) ( not ( = ?auto_173381 ?auto_173382 ) ) ( not ( = ?auto_173380 ?auto_173382 ) ) ( not ( = ?auto_173379 ?auto_173382 ) ) ( not ( = ?auto_173383 ?auto_173382 ) ) ( ON ?auto_173376 ?auto_173375 ) ( ON-TABLE ?auto_173382 ) ( ON ?auto_173377 ?auto_173376 ) ( ON ?auto_173378 ?auto_173377 ) ( ON ?auto_173381 ?auto_173378 ) ( ON ?auto_173383 ?auto_173381 ) ( CLEAR ?auto_173380 ) ( ON ?auto_173379 ?auto_173383 ) ( CLEAR ?auto_173379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173382 ?auto_173375 ?auto_173376 ?auto_173377 ?auto_173378 ?auto_173381 ?auto_173383 )
      ( MAKE-4PILE ?auto_173375 ?auto_173376 ?auto_173377 ?auto_173378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173384 - BLOCK
      ?auto_173385 - BLOCK
      ?auto_173386 - BLOCK
      ?auto_173387 - BLOCK
    )
    :vars
    (
      ?auto_173388 - BLOCK
      ?auto_173390 - BLOCK
      ?auto_173392 - BLOCK
      ?auto_173389 - BLOCK
      ?auto_173391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173384 ?auto_173385 ) ) ( not ( = ?auto_173384 ?auto_173386 ) ) ( not ( = ?auto_173384 ?auto_173387 ) ) ( not ( = ?auto_173385 ?auto_173386 ) ) ( not ( = ?auto_173385 ?auto_173387 ) ) ( not ( = ?auto_173386 ?auto_173387 ) ) ( not ( = ?auto_173384 ?auto_173388 ) ) ( not ( = ?auto_173385 ?auto_173388 ) ) ( not ( = ?auto_173386 ?auto_173388 ) ) ( not ( = ?auto_173387 ?auto_173388 ) ) ( not ( = ?auto_173390 ?auto_173392 ) ) ( not ( = ?auto_173390 ?auto_173389 ) ) ( not ( = ?auto_173390 ?auto_173388 ) ) ( not ( = ?auto_173390 ?auto_173387 ) ) ( not ( = ?auto_173390 ?auto_173386 ) ) ( not ( = ?auto_173392 ?auto_173389 ) ) ( not ( = ?auto_173392 ?auto_173388 ) ) ( not ( = ?auto_173392 ?auto_173387 ) ) ( not ( = ?auto_173392 ?auto_173386 ) ) ( not ( = ?auto_173389 ?auto_173388 ) ) ( not ( = ?auto_173389 ?auto_173387 ) ) ( not ( = ?auto_173389 ?auto_173386 ) ) ( not ( = ?auto_173384 ?auto_173390 ) ) ( not ( = ?auto_173384 ?auto_173392 ) ) ( not ( = ?auto_173384 ?auto_173389 ) ) ( not ( = ?auto_173385 ?auto_173390 ) ) ( not ( = ?auto_173385 ?auto_173392 ) ) ( not ( = ?auto_173385 ?auto_173389 ) ) ( ON ?auto_173384 ?auto_173391 ) ( not ( = ?auto_173384 ?auto_173391 ) ) ( not ( = ?auto_173385 ?auto_173391 ) ) ( not ( = ?auto_173386 ?auto_173391 ) ) ( not ( = ?auto_173387 ?auto_173391 ) ) ( not ( = ?auto_173388 ?auto_173391 ) ) ( not ( = ?auto_173390 ?auto_173391 ) ) ( not ( = ?auto_173392 ?auto_173391 ) ) ( not ( = ?auto_173389 ?auto_173391 ) ) ( ON ?auto_173385 ?auto_173384 ) ( ON-TABLE ?auto_173391 ) ( ON ?auto_173386 ?auto_173385 ) ( ON ?auto_173387 ?auto_173386 ) ( ON ?auto_173388 ?auto_173387 ) ( ON ?auto_173389 ?auto_173388 ) ( ON ?auto_173392 ?auto_173389 ) ( CLEAR ?auto_173392 ) ( HOLDING ?auto_173390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173390 )
      ( MAKE-4PILE ?auto_173384 ?auto_173385 ?auto_173386 ?auto_173387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_173393 - BLOCK
      ?auto_173394 - BLOCK
      ?auto_173395 - BLOCK
      ?auto_173396 - BLOCK
    )
    :vars
    (
      ?auto_173397 - BLOCK
      ?auto_173398 - BLOCK
      ?auto_173399 - BLOCK
      ?auto_173400 - BLOCK
      ?auto_173401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173393 ?auto_173394 ) ) ( not ( = ?auto_173393 ?auto_173395 ) ) ( not ( = ?auto_173393 ?auto_173396 ) ) ( not ( = ?auto_173394 ?auto_173395 ) ) ( not ( = ?auto_173394 ?auto_173396 ) ) ( not ( = ?auto_173395 ?auto_173396 ) ) ( not ( = ?auto_173393 ?auto_173397 ) ) ( not ( = ?auto_173394 ?auto_173397 ) ) ( not ( = ?auto_173395 ?auto_173397 ) ) ( not ( = ?auto_173396 ?auto_173397 ) ) ( not ( = ?auto_173398 ?auto_173399 ) ) ( not ( = ?auto_173398 ?auto_173400 ) ) ( not ( = ?auto_173398 ?auto_173397 ) ) ( not ( = ?auto_173398 ?auto_173396 ) ) ( not ( = ?auto_173398 ?auto_173395 ) ) ( not ( = ?auto_173399 ?auto_173400 ) ) ( not ( = ?auto_173399 ?auto_173397 ) ) ( not ( = ?auto_173399 ?auto_173396 ) ) ( not ( = ?auto_173399 ?auto_173395 ) ) ( not ( = ?auto_173400 ?auto_173397 ) ) ( not ( = ?auto_173400 ?auto_173396 ) ) ( not ( = ?auto_173400 ?auto_173395 ) ) ( not ( = ?auto_173393 ?auto_173398 ) ) ( not ( = ?auto_173393 ?auto_173399 ) ) ( not ( = ?auto_173393 ?auto_173400 ) ) ( not ( = ?auto_173394 ?auto_173398 ) ) ( not ( = ?auto_173394 ?auto_173399 ) ) ( not ( = ?auto_173394 ?auto_173400 ) ) ( ON ?auto_173393 ?auto_173401 ) ( not ( = ?auto_173393 ?auto_173401 ) ) ( not ( = ?auto_173394 ?auto_173401 ) ) ( not ( = ?auto_173395 ?auto_173401 ) ) ( not ( = ?auto_173396 ?auto_173401 ) ) ( not ( = ?auto_173397 ?auto_173401 ) ) ( not ( = ?auto_173398 ?auto_173401 ) ) ( not ( = ?auto_173399 ?auto_173401 ) ) ( not ( = ?auto_173400 ?auto_173401 ) ) ( ON ?auto_173394 ?auto_173393 ) ( ON-TABLE ?auto_173401 ) ( ON ?auto_173395 ?auto_173394 ) ( ON ?auto_173396 ?auto_173395 ) ( ON ?auto_173397 ?auto_173396 ) ( ON ?auto_173400 ?auto_173397 ) ( ON ?auto_173399 ?auto_173400 ) ( ON ?auto_173398 ?auto_173399 ) ( CLEAR ?auto_173398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173401 ?auto_173393 ?auto_173394 ?auto_173395 ?auto_173396 ?auto_173397 ?auto_173400 ?auto_173399 )
      ( MAKE-4PILE ?auto_173393 ?auto_173394 ?auto_173395 ?auto_173396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173405 - BLOCK
      ?auto_173406 - BLOCK
      ?auto_173407 - BLOCK
    )
    :vars
    (
      ?auto_173408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173408 ?auto_173407 ) ( CLEAR ?auto_173408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173405 ) ( ON ?auto_173406 ?auto_173405 ) ( ON ?auto_173407 ?auto_173406 ) ( not ( = ?auto_173405 ?auto_173406 ) ) ( not ( = ?auto_173405 ?auto_173407 ) ) ( not ( = ?auto_173405 ?auto_173408 ) ) ( not ( = ?auto_173406 ?auto_173407 ) ) ( not ( = ?auto_173406 ?auto_173408 ) ) ( not ( = ?auto_173407 ?auto_173408 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173408 ?auto_173407 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173409 - BLOCK
      ?auto_173410 - BLOCK
      ?auto_173411 - BLOCK
    )
    :vars
    (
      ?auto_173412 - BLOCK
      ?auto_173413 - BLOCK
      ?auto_173414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173412 ?auto_173411 ) ( CLEAR ?auto_173412 ) ( ON-TABLE ?auto_173409 ) ( ON ?auto_173410 ?auto_173409 ) ( ON ?auto_173411 ?auto_173410 ) ( not ( = ?auto_173409 ?auto_173410 ) ) ( not ( = ?auto_173409 ?auto_173411 ) ) ( not ( = ?auto_173409 ?auto_173412 ) ) ( not ( = ?auto_173410 ?auto_173411 ) ) ( not ( = ?auto_173410 ?auto_173412 ) ) ( not ( = ?auto_173411 ?auto_173412 ) ) ( HOLDING ?auto_173413 ) ( CLEAR ?auto_173414 ) ( not ( = ?auto_173409 ?auto_173413 ) ) ( not ( = ?auto_173409 ?auto_173414 ) ) ( not ( = ?auto_173410 ?auto_173413 ) ) ( not ( = ?auto_173410 ?auto_173414 ) ) ( not ( = ?auto_173411 ?auto_173413 ) ) ( not ( = ?auto_173411 ?auto_173414 ) ) ( not ( = ?auto_173412 ?auto_173413 ) ) ( not ( = ?auto_173412 ?auto_173414 ) ) ( not ( = ?auto_173413 ?auto_173414 ) ) )
    :subtasks
    ( ( !STACK ?auto_173413 ?auto_173414 )
      ( MAKE-3PILE ?auto_173409 ?auto_173410 ?auto_173411 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173415 - BLOCK
      ?auto_173416 - BLOCK
      ?auto_173417 - BLOCK
    )
    :vars
    (
      ?auto_173420 - BLOCK
      ?auto_173418 - BLOCK
      ?auto_173419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173420 ?auto_173417 ) ( ON-TABLE ?auto_173415 ) ( ON ?auto_173416 ?auto_173415 ) ( ON ?auto_173417 ?auto_173416 ) ( not ( = ?auto_173415 ?auto_173416 ) ) ( not ( = ?auto_173415 ?auto_173417 ) ) ( not ( = ?auto_173415 ?auto_173420 ) ) ( not ( = ?auto_173416 ?auto_173417 ) ) ( not ( = ?auto_173416 ?auto_173420 ) ) ( not ( = ?auto_173417 ?auto_173420 ) ) ( CLEAR ?auto_173418 ) ( not ( = ?auto_173415 ?auto_173419 ) ) ( not ( = ?auto_173415 ?auto_173418 ) ) ( not ( = ?auto_173416 ?auto_173419 ) ) ( not ( = ?auto_173416 ?auto_173418 ) ) ( not ( = ?auto_173417 ?auto_173419 ) ) ( not ( = ?auto_173417 ?auto_173418 ) ) ( not ( = ?auto_173420 ?auto_173419 ) ) ( not ( = ?auto_173420 ?auto_173418 ) ) ( not ( = ?auto_173419 ?auto_173418 ) ) ( ON ?auto_173419 ?auto_173420 ) ( CLEAR ?auto_173419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173415 ?auto_173416 ?auto_173417 ?auto_173420 )
      ( MAKE-3PILE ?auto_173415 ?auto_173416 ?auto_173417 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173421 - BLOCK
      ?auto_173422 - BLOCK
      ?auto_173423 - BLOCK
    )
    :vars
    (
      ?auto_173424 - BLOCK
      ?auto_173425 - BLOCK
      ?auto_173426 - BLOCK
      ?auto_173428 - BLOCK
      ?auto_173427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173424 ?auto_173423 ) ( ON-TABLE ?auto_173421 ) ( ON ?auto_173422 ?auto_173421 ) ( ON ?auto_173423 ?auto_173422 ) ( not ( = ?auto_173421 ?auto_173422 ) ) ( not ( = ?auto_173421 ?auto_173423 ) ) ( not ( = ?auto_173421 ?auto_173424 ) ) ( not ( = ?auto_173422 ?auto_173423 ) ) ( not ( = ?auto_173422 ?auto_173424 ) ) ( not ( = ?auto_173423 ?auto_173424 ) ) ( not ( = ?auto_173421 ?auto_173425 ) ) ( not ( = ?auto_173421 ?auto_173426 ) ) ( not ( = ?auto_173422 ?auto_173425 ) ) ( not ( = ?auto_173422 ?auto_173426 ) ) ( not ( = ?auto_173423 ?auto_173425 ) ) ( not ( = ?auto_173423 ?auto_173426 ) ) ( not ( = ?auto_173424 ?auto_173425 ) ) ( not ( = ?auto_173424 ?auto_173426 ) ) ( not ( = ?auto_173425 ?auto_173426 ) ) ( ON ?auto_173425 ?auto_173424 ) ( CLEAR ?auto_173425 ) ( HOLDING ?auto_173426 ) ( CLEAR ?auto_173428 ) ( ON-TABLE ?auto_173427 ) ( ON ?auto_173428 ?auto_173427 ) ( not ( = ?auto_173427 ?auto_173428 ) ) ( not ( = ?auto_173427 ?auto_173426 ) ) ( not ( = ?auto_173428 ?auto_173426 ) ) ( not ( = ?auto_173421 ?auto_173428 ) ) ( not ( = ?auto_173421 ?auto_173427 ) ) ( not ( = ?auto_173422 ?auto_173428 ) ) ( not ( = ?auto_173422 ?auto_173427 ) ) ( not ( = ?auto_173423 ?auto_173428 ) ) ( not ( = ?auto_173423 ?auto_173427 ) ) ( not ( = ?auto_173424 ?auto_173428 ) ) ( not ( = ?auto_173424 ?auto_173427 ) ) ( not ( = ?auto_173425 ?auto_173428 ) ) ( not ( = ?auto_173425 ?auto_173427 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173427 ?auto_173428 ?auto_173426 )
      ( MAKE-3PILE ?auto_173421 ?auto_173422 ?auto_173423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173429 - BLOCK
      ?auto_173430 - BLOCK
      ?auto_173431 - BLOCK
    )
    :vars
    (
      ?auto_173432 - BLOCK
      ?auto_173433 - BLOCK
      ?auto_173434 - BLOCK
      ?auto_173436 - BLOCK
      ?auto_173435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173432 ?auto_173431 ) ( ON-TABLE ?auto_173429 ) ( ON ?auto_173430 ?auto_173429 ) ( ON ?auto_173431 ?auto_173430 ) ( not ( = ?auto_173429 ?auto_173430 ) ) ( not ( = ?auto_173429 ?auto_173431 ) ) ( not ( = ?auto_173429 ?auto_173432 ) ) ( not ( = ?auto_173430 ?auto_173431 ) ) ( not ( = ?auto_173430 ?auto_173432 ) ) ( not ( = ?auto_173431 ?auto_173432 ) ) ( not ( = ?auto_173429 ?auto_173433 ) ) ( not ( = ?auto_173429 ?auto_173434 ) ) ( not ( = ?auto_173430 ?auto_173433 ) ) ( not ( = ?auto_173430 ?auto_173434 ) ) ( not ( = ?auto_173431 ?auto_173433 ) ) ( not ( = ?auto_173431 ?auto_173434 ) ) ( not ( = ?auto_173432 ?auto_173433 ) ) ( not ( = ?auto_173432 ?auto_173434 ) ) ( not ( = ?auto_173433 ?auto_173434 ) ) ( ON ?auto_173433 ?auto_173432 ) ( CLEAR ?auto_173436 ) ( ON-TABLE ?auto_173435 ) ( ON ?auto_173436 ?auto_173435 ) ( not ( = ?auto_173435 ?auto_173436 ) ) ( not ( = ?auto_173435 ?auto_173434 ) ) ( not ( = ?auto_173436 ?auto_173434 ) ) ( not ( = ?auto_173429 ?auto_173436 ) ) ( not ( = ?auto_173429 ?auto_173435 ) ) ( not ( = ?auto_173430 ?auto_173436 ) ) ( not ( = ?auto_173430 ?auto_173435 ) ) ( not ( = ?auto_173431 ?auto_173436 ) ) ( not ( = ?auto_173431 ?auto_173435 ) ) ( not ( = ?auto_173432 ?auto_173436 ) ) ( not ( = ?auto_173432 ?auto_173435 ) ) ( not ( = ?auto_173433 ?auto_173436 ) ) ( not ( = ?auto_173433 ?auto_173435 ) ) ( ON ?auto_173434 ?auto_173433 ) ( CLEAR ?auto_173434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173429 ?auto_173430 ?auto_173431 ?auto_173432 ?auto_173433 )
      ( MAKE-3PILE ?auto_173429 ?auto_173430 ?auto_173431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173437 - BLOCK
      ?auto_173438 - BLOCK
      ?auto_173439 - BLOCK
    )
    :vars
    (
      ?auto_173442 - BLOCK
      ?auto_173443 - BLOCK
      ?auto_173444 - BLOCK
      ?auto_173441 - BLOCK
      ?auto_173440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173442 ?auto_173439 ) ( ON-TABLE ?auto_173437 ) ( ON ?auto_173438 ?auto_173437 ) ( ON ?auto_173439 ?auto_173438 ) ( not ( = ?auto_173437 ?auto_173438 ) ) ( not ( = ?auto_173437 ?auto_173439 ) ) ( not ( = ?auto_173437 ?auto_173442 ) ) ( not ( = ?auto_173438 ?auto_173439 ) ) ( not ( = ?auto_173438 ?auto_173442 ) ) ( not ( = ?auto_173439 ?auto_173442 ) ) ( not ( = ?auto_173437 ?auto_173443 ) ) ( not ( = ?auto_173437 ?auto_173444 ) ) ( not ( = ?auto_173438 ?auto_173443 ) ) ( not ( = ?auto_173438 ?auto_173444 ) ) ( not ( = ?auto_173439 ?auto_173443 ) ) ( not ( = ?auto_173439 ?auto_173444 ) ) ( not ( = ?auto_173442 ?auto_173443 ) ) ( not ( = ?auto_173442 ?auto_173444 ) ) ( not ( = ?auto_173443 ?auto_173444 ) ) ( ON ?auto_173443 ?auto_173442 ) ( ON-TABLE ?auto_173441 ) ( not ( = ?auto_173441 ?auto_173440 ) ) ( not ( = ?auto_173441 ?auto_173444 ) ) ( not ( = ?auto_173440 ?auto_173444 ) ) ( not ( = ?auto_173437 ?auto_173440 ) ) ( not ( = ?auto_173437 ?auto_173441 ) ) ( not ( = ?auto_173438 ?auto_173440 ) ) ( not ( = ?auto_173438 ?auto_173441 ) ) ( not ( = ?auto_173439 ?auto_173440 ) ) ( not ( = ?auto_173439 ?auto_173441 ) ) ( not ( = ?auto_173442 ?auto_173440 ) ) ( not ( = ?auto_173442 ?auto_173441 ) ) ( not ( = ?auto_173443 ?auto_173440 ) ) ( not ( = ?auto_173443 ?auto_173441 ) ) ( ON ?auto_173444 ?auto_173443 ) ( CLEAR ?auto_173444 ) ( HOLDING ?auto_173440 ) ( CLEAR ?auto_173441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173441 ?auto_173440 )
      ( MAKE-3PILE ?auto_173437 ?auto_173438 ?auto_173439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173445 - BLOCK
      ?auto_173446 - BLOCK
      ?auto_173447 - BLOCK
    )
    :vars
    (
      ?auto_173450 - BLOCK
      ?auto_173451 - BLOCK
      ?auto_173448 - BLOCK
      ?auto_173449 - BLOCK
      ?auto_173452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173450 ?auto_173447 ) ( ON-TABLE ?auto_173445 ) ( ON ?auto_173446 ?auto_173445 ) ( ON ?auto_173447 ?auto_173446 ) ( not ( = ?auto_173445 ?auto_173446 ) ) ( not ( = ?auto_173445 ?auto_173447 ) ) ( not ( = ?auto_173445 ?auto_173450 ) ) ( not ( = ?auto_173446 ?auto_173447 ) ) ( not ( = ?auto_173446 ?auto_173450 ) ) ( not ( = ?auto_173447 ?auto_173450 ) ) ( not ( = ?auto_173445 ?auto_173451 ) ) ( not ( = ?auto_173445 ?auto_173448 ) ) ( not ( = ?auto_173446 ?auto_173451 ) ) ( not ( = ?auto_173446 ?auto_173448 ) ) ( not ( = ?auto_173447 ?auto_173451 ) ) ( not ( = ?auto_173447 ?auto_173448 ) ) ( not ( = ?auto_173450 ?auto_173451 ) ) ( not ( = ?auto_173450 ?auto_173448 ) ) ( not ( = ?auto_173451 ?auto_173448 ) ) ( ON ?auto_173451 ?auto_173450 ) ( ON-TABLE ?auto_173449 ) ( not ( = ?auto_173449 ?auto_173452 ) ) ( not ( = ?auto_173449 ?auto_173448 ) ) ( not ( = ?auto_173452 ?auto_173448 ) ) ( not ( = ?auto_173445 ?auto_173452 ) ) ( not ( = ?auto_173445 ?auto_173449 ) ) ( not ( = ?auto_173446 ?auto_173452 ) ) ( not ( = ?auto_173446 ?auto_173449 ) ) ( not ( = ?auto_173447 ?auto_173452 ) ) ( not ( = ?auto_173447 ?auto_173449 ) ) ( not ( = ?auto_173450 ?auto_173452 ) ) ( not ( = ?auto_173450 ?auto_173449 ) ) ( not ( = ?auto_173451 ?auto_173452 ) ) ( not ( = ?auto_173451 ?auto_173449 ) ) ( ON ?auto_173448 ?auto_173451 ) ( CLEAR ?auto_173449 ) ( ON ?auto_173452 ?auto_173448 ) ( CLEAR ?auto_173452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173445 ?auto_173446 ?auto_173447 ?auto_173450 ?auto_173451 ?auto_173448 )
      ( MAKE-3PILE ?auto_173445 ?auto_173446 ?auto_173447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173453 - BLOCK
      ?auto_173454 - BLOCK
      ?auto_173455 - BLOCK
    )
    :vars
    (
      ?auto_173459 - BLOCK
      ?auto_173457 - BLOCK
      ?auto_173456 - BLOCK
      ?auto_173458 - BLOCK
      ?auto_173460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173459 ?auto_173455 ) ( ON-TABLE ?auto_173453 ) ( ON ?auto_173454 ?auto_173453 ) ( ON ?auto_173455 ?auto_173454 ) ( not ( = ?auto_173453 ?auto_173454 ) ) ( not ( = ?auto_173453 ?auto_173455 ) ) ( not ( = ?auto_173453 ?auto_173459 ) ) ( not ( = ?auto_173454 ?auto_173455 ) ) ( not ( = ?auto_173454 ?auto_173459 ) ) ( not ( = ?auto_173455 ?auto_173459 ) ) ( not ( = ?auto_173453 ?auto_173457 ) ) ( not ( = ?auto_173453 ?auto_173456 ) ) ( not ( = ?auto_173454 ?auto_173457 ) ) ( not ( = ?auto_173454 ?auto_173456 ) ) ( not ( = ?auto_173455 ?auto_173457 ) ) ( not ( = ?auto_173455 ?auto_173456 ) ) ( not ( = ?auto_173459 ?auto_173457 ) ) ( not ( = ?auto_173459 ?auto_173456 ) ) ( not ( = ?auto_173457 ?auto_173456 ) ) ( ON ?auto_173457 ?auto_173459 ) ( not ( = ?auto_173458 ?auto_173460 ) ) ( not ( = ?auto_173458 ?auto_173456 ) ) ( not ( = ?auto_173460 ?auto_173456 ) ) ( not ( = ?auto_173453 ?auto_173460 ) ) ( not ( = ?auto_173453 ?auto_173458 ) ) ( not ( = ?auto_173454 ?auto_173460 ) ) ( not ( = ?auto_173454 ?auto_173458 ) ) ( not ( = ?auto_173455 ?auto_173460 ) ) ( not ( = ?auto_173455 ?auto_173458 ) ) ( not ( = ?auto_173459 ?auto_173460 ) ) ( not ( = ?auto_173459 ?auto_173458 ) ) ( not ( = ?auto_173457 ?auto_173460 ) ) ( not ( = ?auto_173457 ?auto_173458 ) ) ( ON ?auto_173456 ?auto_173457 ) ( ON ?auto_173460 ?auto_173456 ) ( CLEAR ?auto_173460 ) ( HOLDING ?auto_173458 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173458 )
      ( MAKE-3PILE ?auto_173453 ?auto_173454 ?auto_173455 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173461 - BLOCK
      ?auto_173462 - BLOCK
      ?auto_173463 - BLOCK
    )
    :vars
    (
      ?auto_173465 - BLOCK
      ?auto_173468 - BLOCK
      ?auto_173464 - BLOCK
      ?auto_173466 - BLOCK
      ?auto_173467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173465 ?auto_173463 ) ( ON-TABLE ?auto_173461 ) ( ON ?auto_173462 ?auto_173461 ) ( ON ?auto_173463 ?auto_173462 ) ( not ( = ?auto_173461 ?auto_173462 ) ) ( not ( = ?auto_173461 ?auto_173463 ) ) ( not ( = ?auto_173461 ?auto_173465 ) ) ( not ( = ?auto_173462 ?auto_173463 ) ) ( not ( = ?auto_173462 ?auto_173465 ) ) ( not ( = ?auto_173463 ?auto_173465 ) ) ( not ( = ?auto_173461 ?auto_173468 ) ) ( not ( = ?auto_173461 ?auto_173464 ) ) ( not ( = ?auto_173462 ?auto_173468 ) ) ( not ( = ?auto_173462 ?auto_173464 ) ) ( not ( = ?auto_173463 ?auto_173468 ) ) ( not ( = ?auto_173463 ?auto_173464 ) ) ( not ( = ?auto_173465 ?auto_173468 ) ) ( not ( = ?auto_173465 ?auto_173464 ) ) ( not ( = ?auto_173468 ?auto_173464 ) ) ( ON ?auto_173468 ?auto_173465 ) ( not ( = ?auto_173466 ?auto_173467 ) ) ( not ( = ?auto_173466 ?auto_173464 ) ) ( not ( = ?auto_173467 ?auto_173464 ) ) ( not ( = ?auto_173461 ?auto_173467 ) ) ( not ( = ?auto_173461 ?auto_173466 ) ) ( not ( = ?auto_173462 ?auto_173467 ) ) ( not ( = ?auto_173462 ?auto_173466 ) ) ( not ( = ?auto_173463 ?auto_173467 ) ) ( not ( = ?auto_173463 ?auto_173466 ) ) ( not ( = ?auto_173465 ?auto_173467 ) ) ( not ( = ?auto_173465 ?auto_173466 ) ) ( not ( = ?auto_173468 ?auto_173467 ) ) ( not ( = ?auto_173468 ?auto_173466 ) ) ( ON ?auto_173464 ?auto_173468 ) ( ON ?auto_173467 ?auto_173464 ) ( ON ?auto_173466 ?auto_173467 ) ( CLEAR ?auto_173466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173461 ?auto_173462 ?auto_173463 ?auto_173465 ?auto_173468 ?auto_173464 ?auto_173467 )
      ( MAKE-3PILE ?auto_173461 ?auto_173462 ?auto_173463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173469 - BLOCK
      ?auto_173470 - BLOCK
      ?auto_173471 - BLOCK
    )
    :vars
    (
      ?auto_173473 - BLOCK
      ?auto_173472 - BLOCK
      ?auto_173476 - BLOCK
      ?auto_173474 - BLOCK
      ?auto_173475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173473 ?auto_173471 ) ( ON-TABLE ?auto_173469 ) ( ON ?auto_173470 ?auto_173469 ) ( ON ?auto_173471 ?auto_173470 ) ( not ( = ?auto_173469 ?auto_173470 ) ) ( not ( = ?auto_173469 ?auto_173471 ) ) ( not ( = ?auto_173469 ?auto_173473 ) ) ( not ( = ?auto_173470 ?auto_173471 ) ) ( not ( = ?auto_173470 ?auto_173473 ) ) ( not ( = ?auto_173471 ?auto_173473 ) ) ( not ( = ?auto_173469 ?auto_173472 ) ) ( not ( = ?auto_173469 ?auto_173476 ) ) ( not ( = ?auto_173470 ?auto_173472 ) ) ( not ( = ?auto_173470 ?auto_173476 ) ) ( not ( = ?auto_173471 ?auto_173472 ) ) ( not ( = ?auto_173471 ?auto_173476 ) ) ( not ( = ?auto_173473 ?auto_173472 ) ) ( not ( = ?auto_173473 ?auto_173476 ) ) ( not ( = ?auto_173472 ?auto_173476 ) ) ( ON ?auto_173472 ?auto_173473 ) ( not ( = ?auto_173474 ?auto_173475 ) ) ( not ( = ?auto_173474 ?auto_173476 ) ) ( not ( = ?auto_173475 ?auto_173476 ) ) ( not ( = ?auto_173469 ?auto_173475 ) ) ( not ( = ?auto_173469 ?auto_173474 ) ) ( not ( = ?auto_173470 ?auto_173475 ) ) ( not ( = ?auto_173470 ?auto_173474 ) ) ( not ( = ?auto_173471 ?auto_173475 ) ) ( not ( = ?auto_173471 ?auto_173474 ) ) ( not ( = ?auto_173473 ?auto_173475 ) ) ( not ( = ?auto_173473 ?auto_173474 ) ) ( not ( = ?auto_173472 ?auto_173475 ) ) ( not ( = ?auto_173472 ?auto_173474 ) ) ( ON ?auto_173476 ?auto_173472 ) ( ON ?auto_173475 ?auto_173476 ) ( HOLDING ?auto_173474 ) ( CLEAR ?auto_173475 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173469 ?auto_173470 ?auto_173471 ?auto_173473 ?auto_173472 ?auto_173476 ?auto_173475 ?auto_173474 )
      ( MAKE-3PILE ?auto_173469 ?auto_173470 ?auto_173471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173477 - BLOCK
      ?auto_173478 - BLOCK
      ?auto_173479 - BLOCK
    )
    :vars
    (
      ?auto_173480 - BLOCK
      ?auto_173484 - BLOCK
      ?auto_173483 - BLOCK
      ?auto_173481 - BLOCK
      ?auto_173482 - BLOCK
      ?auto_173485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173480 ?auto_173479 ) ( ON-TABLE ?auto_173477 ) ( ON ?auto_173478 ?auto_173477 ) ( ON ?auto_173479 ?auto_173478 ) ( not ( = ?auto_173477 ?auto_173478 ) ) ( not ( = ?auto_173477 ?auto_173479 ) ) ( not ( = ?auto_173477 ?auto_173480 ) ) ( not ( = ?auto_173478 ?auto_173479 ) ) ( not ( = ?auto_173478 ?auto_173480 ) ) ( not ( = ?auto_173479 ?auto_173480 ) ) ( not ( = ?auto_173477 ?auto_173484 ) ) ( not ( = ?auto_173477 ?auto_173483 ) ) ( not ( = ?auto_173478 ?auto_173484 ) ) ( not ( = ?auto_173478 ?auto_173483 ) ) ( not ( = ?auto_173479 ?auto_173484 ) ) ( not ( = ?auto_173479 ?auto_173483 ) ) ( not ( = ?auto_173480 ?auto_173484 ) ) ( not ( = ?auto_173480 ?auto_173483 ) ) ( not ( = ?auto_173484 ?auto_173483 ) ) ( ON ?auto_173484 ?auto_173480 ) ( not ( = ?auto_173481 ?auto_173482 ) ) ( not ( = ?auto_173481 ?auto_173483 ) ) ( not ( = ?auto_173482 ?auto_173483 ) ) ( not ( = ?auto_173477 ?auto_173482 ) ) ( not ( = ?auto_173477 ?auto_173481 ) ) ( not ( = ?auto_173478 ?auto_173482 ) ) ( not ( = ?auto_173478 ?auto_173481 ) ) ( not ( = ?auto_173479 ?auto_173482 ) ) ( not ( = ?auto_173479 ?auto_173481 ) ) ( not ( = ?auto_173480 ?auto_173482 ) ) ( not ( = ?auto_173480 ?auto_173481 ) ) ( not ( = ?auto_173484 ?auto_173482 ) ) ( not ( = ?auto_173484 ?auto_173481 ) ) ( ON ?auto_173483 ?auto_173484 ) ( ON ?auto_173482 ?auto_173483 ) ( CLEAR ?auto_173482 ) ( ON ?auto_173481 ?auto_173485 ) ( CLEAR ?auto_173481 ) ( HAND-EMPTY ) ( not ( = ?auto_173477 ?auto_173485 ) ) ( not ( = ?auto_173478 ?auto_173485 ) ) ( not ( = ?auto_173479 ?auto_173485 ) ) ( not ( = ?auto_173480 ?auto_173485 ) ) ( not ( = ?auto_173484 ?auto_173485 ) ) ( not ( = ?auto_173483 ?auto_173485 ) ) ( not ( = ?auto_173481 ?auto_173485 ) ) ( not ( = ?auto_173482 ?auto_173485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173481 ?auto_173485 )
      ( MAKE-3PILE ?auto_173477 ?auto_173478 ?auto_173479 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173486 - BLOCK
      ?auto_173487 - BLOCK
      ?auto_173488 - BLOCK
    )
    :vars
    (
      ?auto_173492 - BLOCK
      ?auto_173491 - BLOCK
      ?auto_173490 - BLOCK
      ?auto_173493 - BLOCK
      ?auto_173494 - BLOCK
      ?auto_173489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173492 ?auto_173488 ) ( ON-TABLE ?auto_173486 ) ( ON ?auto_173487 ?auto_173486 ) ( ON ?auto_173488 ?auto_173487 ) ( not ( = ?auto_173486 ?auto_173487 ) ) ( not ( = ?auto_173486 ?auto_173488 ) ) ( not ( = ?auto_173486 ?auto_173492 ) ) ( not ( = ?auto_173487 ?auto_173488 ) ) ( not ( = ?auto_173487 ?auto_173492 ) ) ( not ( = ?auto_173488 ?auto_173492 ) ) ( not ( = ?auto_173486 ?auto_173491 ) ) ( not ( = ?auto_173486 ?auto_173490 ) ) ( not ( = ?auto_173487 ?auto_173491 ) ) ( not ( = ?auto_173487 ?auto_173490 ) ) ( not ( = ?auto_173488 ?auto_173491 ) ) ( not ( = ?auto_173488 ?auto_173490 ) ) ( not ( = ?auto_173492 ?auto_173491 ) ) ( not ( = ?auto_173492 ?auto_173490 ) ) ( not ( = ?auto_173491 ?auto_173490 ) ) ( ON ?auto_173491 ?auto_173492 ) ( not ( = ?auto_173493 ?auto_173494 ) ) ( not ( = ?auto_173493 ?auto_173490 ) ) ( not ( = ?auto_173494 ?auto_173490 ) ) ( not ( = ?auto_173486 ?auto_173494 ) ) ( not ( = ?auto_173486 ?auto_173493 ) ) ( not ( = ?auto_173487 ?auto_173494 ) ) ( not ( = ?auto_173487 ?auto_173493 ) ) ( not ( = ?auto_173488 ?auto_173494 ) ) ( not ( = ?auto_173488 ?auto_173493 ) ) ( not ( = ?auto_173492 ?auto_173494 ) ) ( not ( = ?auto_173492 ?auto_173493 ) ) ( not ( = ?auto_173491 ?auto_173494 ) ) ( not ( = ?auto_173491 ?auto_173493 ) ) ( ON ?auto_173490 ?auto_173491 ) ( ON ?auto_173493 ?auto_173489 ) ( CLEAR ?auto_173493 ) ( not ( = ?auto_173486 ?auto_173489 ) ) ( not ( = ?auto_173487 ?auto_173489 ) ) ( not ( = ?auto_173488 ?auto_173489 ) ) ( not ( = ?auto_173492 ?auto_173489 ) ) ( not ( = ?auto_173491 ?auto_173489 ) ) ( not ( = ?auto_173490 ?auto_173489 ) ) ( not ( = ?auto_173493 ?auto_173489 ) ) ( not ( = ?auto_173494 ?auto_173489 ) ) ( HOLDING ?auto_173494 ) ( CLEAR ?auto_173490 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173486 ?auto_173487 ?auto_173488 ?auto_173492 ?auto_173491 ?auto_173490 ?auto_173494 )
      ( MAKE-3PILE ?auto_173486 ?auto_173487 ?auto_173488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173495 - BLOCK
      ?auto_173496 - BLOCK
      ?auto_173497 - BLOCK
    )
    :vars
    (
      ?auto_173500 - BLOCK
      ?auto_173502 - BLOCK
      ?auto_173503 - BLOCK
      ?auto_173499 - BLOCK
      ?auto_173501 - BLOCK
      ?auto_173498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173500 ?auto_173497 ) ( ON-TABLE ?auto_173495 ) ( ON ?auto_173496 ?auto_173495 ) ( ON ?auto_173497 ?auto_173496 ) ( not ( = ?auto_173495 ?auto_173496 ) ) ( not ( = ?auto_173495 ?auto_173497 ) ) ( not ( = ?auto_173495 ?auto_173500 ) ) ( not ( = ?auto_173496 ?auto_173497 ) ) ( not ( = ?auto_173496 ?auto_173500 ) ) ( not ( = ?auto_173497 ?auto_173500 ) ) ( not ( = ?auto_173495 ?auto_173502 ) ) ( not ( = ?auto_173495 ?auto_173503 ) ) ( not ( = ?auto_173496 ?auto_173502 ) ) ( not ( = ?auto_173496 ?auto_173503 ) ) ( not ( = ?auto_173497 ?auto_173502 ) ) ( not ( = ?auto_173497 ?auto_173503 ) ) ( not ( = ?auto_173500 ?auto_173502 ) ) ( not ( = ?auto_173500 ?auto_173503 ) ) ( not ( = ?auto_173502 ?auto_173503 ) ) ( ON ?auto_173502 ?auto_173500 ) ( not ( = ?auto_173499 ?auto_173501 ) ) ( not ( = ?auto_173499 ?auto_173503 ) ) ( not ( = ?auto_173501 ?auto_173503 ) ) ( not ( = ?auto_173495 ?auto_173501 ) ) ( not ( = ?auto_173495 ?auto_173499 ) ) ( not ( = ?auto_173496 ?auto_173501 ) ) ( not ( = ?auto_173496 ?auto_173499 ) ) ( not ( = ?auto_173497 ?auto_173501 ) ) ( not ( = ?auto_173497 ?auto_173499 ) ) ( not ( = ?auto_173500 ?auto_173501 ) ) ( not ( = ?auto_173500 ?auto_173499 ) ) ( not ( = ?auto_173502 ?auto_173501 ) ) ( not ( = ?auto_173502 ?auto_173499 ) ) ( ON ?auto_173503 ?auto_173502 ) ( ON ?auto_173499 ?auto_173498 ) ( not ( = ?auto_173495 ?auto_173498 ) ) ( not ( = ?auto_173496 ?auto_173498 ) ) ( not ( = ?auto_173497 ?auto_173498 ) ) ( not ( = ?auto_173500 ?auto_173498 ) ) ( not ( = ?auto_173502 ?auto_173498 ) ) ( not ( = ?auto_173503 ?auto_173498 ) ) ( not ( = ?auto_173499 ?auto_173498 ) ) ( not ( = ?auto_173501 ?auto_173498 ) ) ( CLEAR ?auto_173503 ) ( ON ?auto_173501 ?auto_173499 ) ( CLEAR ?auto_173501 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173498 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173498 ?auto_173499 )
      ( MAKE-3PILE ?auto_173495 ?auto_173496 ?auto_173497 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173504 - BLOCK
      ?auto_173505 - BLOCK
      ?auto_173506 - BLOCK
    )
    :vars
    (
      ?auto_173507 - BLOCK
      ?auto_173512 - BLOCK
      ?auto_173510 - BLOCK
      ?auto_173509 - BLOCK
      ?auto_173511 - BLOCK
      ?auto_173508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173507 ?auto_173506 ) ( ON-TABLE ?auto_173504 ) ( ON ?auto_173505 ?auto_173504 ) ( ON ?auto_173506 ?auto_173505 ) ( not ( = ?auto_173504 ?auto_173505 ) ) ( not ( = ?auto_173504 ?auto_173506 ) ) ( not ( = ?auto_173504 ?auto_173507 ) ) ( not ( = ?auto_173505 ?auto_173506 ) ) ( not ( = ?auto_173505 ?auto_173507 ) ) ( not ( = ?auto_173506 ?auto_173507 ) ) ( not ( = ?auto_173504 ?auto_173512 ) ) ( not ( = ?auto_173504 ?auto_173510 ) ) ( not ( = ?auto_173505 ?auto_173512 ) ) ( not ( = ?auto_173505 ?auto_173510 ) ) ( not ( = ?auto_173506 ?auto_173512 ) ) ( not ( = ?auto_173506 ?auto_173510 ) ) ( not ( = ?auto_173507 ?auto_173512 ) ) ( not ( = ?auto_173507 ?auto_173510 ) ) ( not ( = ?auto_173512 ?auto_173510 ) ) ( ON ?auto_173512 ?auto_173507 ) ( not ( = ?auto_173509 ?auto_173511 ) ) ( not ( = ?auto_173509 ?auto_173510 ) ) ( not ( = ?auto_173511 ?auto_173510 ) ) ( not ( = ?auto_173504 ?auto_173511 ) ) ( not ( = ?auto_173504 ?auto_173509 ) ) ( not ( = ?auto_173505 ?auto_173511 ) ) ( not ( = ?auto_173505 ?auto_173509 ) ) ( not ( = ?auto_173506 ?auto_173511 ) ) ( not ( = ?auto_173506 ?auto_173509 ) ) ( not ( = ?auto_173507 ?auto_173511 ) ) ( not ( = ?auto_173507 ?auto_173509 ) ) ( not ( = ?auto_173512 ?auto_173511 ) ) ( not ( = ?auto_173512 ?auto_173509 ) ) ( ON ?auto_173509 ?auto_173508 ) ( not ( = ?auto_173504 ?auto_173508 ) ) ( not ( = ?auto_173505 ?auto_173508 ) ) ( not ( = ?auto_173506 ?auto_173508 ) ) ( not ( = ?auto_173507 ?auto_173508 ) ) ( not ( = ?auto_173512 ?auto_173508 ) ) ( not ( = ?auto_173510 ?auto_173508 ) ) ( not ( = ?auto_173509 ?auto_173508 ) ) ( not ( = ?auto_173511 ?auto_173508 ) ) ( ON ?auto_173511 ?auto_173509 ) ( CLEAR ?auto_173511 ) ( ON-TABLE ?auto_173508 ) ( HOLDING ?auto_173510 ) ( CLEAR ?auto_173512 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173504 ?auto_173505 ?auto_173506 ?auto_173507 ?auto_173512 ?auto_173510 )
      ( MAKE-3PILE ?auto_173504 ?auto_173505 ?auto_173506 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173513 - BLOCK
      ?auto_173514 - BLOCK
      ?auto_173515 - BLOCK
    )
    :vars
    (
      ?auto_173520 - BLOCK
      ?auto_173516 - BLOCK
      ?auto_173521 - BLOCK
      ?auto_173519 - BLOCK
      ?auto_173517 - BLOCK
      ?auto_173518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173520 ?auto_173515 ) ( ON-TABLE ?auto_173513 ) ( ON ?auto_173514 ?auto_173513 ) ( ON ?auto_173515 ?auto_173514 ) ( not ( = ?auto_173513 ?auto_173514 ) ) ( not ( = ?auto_173513 ?auto_173515 ) ) ( not ( = ?auto_173513 ?auto_173520 ) ) ( not ( = ?auto_173514 ?auto_173515 ) ) ( not ( = ?auto_173514 ?auto_173520 ) ) ( not ( = ?auto_173515 ?auto_173520 ) ) ( not ( = ?auto_173513 ?auto_173516 ) ) ( not ( = ?auto_173513 ?auto_173521 ) ) ( not ( = ?auto_173514 ?auto_173516 ) ) ( not ( = ?auto_173514 ?auto_173521 ) ) ( not ( = ?auto_173515 ?auto_173516 ) ) ( not ( = ?auto_173515 ?auto_173521 ) ) ( not ( = ?auto_173520 ?auto_173516 ) ) ( not ( = ?auto_173520 ?auto_173521 ) ) ( not ( = ?auto_173516 ?auto_173521 ) ) ( ON ?auto_173516 ?auto_173520 ) ( not ( = ?auto_173519 ?auto_173517 ) ) ( not ( = ?auto_173519 ?auto_173521 ) ) ( not ( = ?auto_173517 ?auto_173521 ) ) ( not ( = ?auto_173513 ?auto_173517 ) ) ( not ( = ?auto_173513 ?auto_173519 ) ) ( not ( = ?auto_173514 ?auto_173517 ) ) ( not ( = ?auto_173514 ?auto_173519 ) ) ( not ( = ?auto_173515 ?auto_173517 ) ) ( not ( = ?auto_173515 ?auto_173519 ) ) ( not ( = ?auto_173520 ?auto_173517 ) ) ( not ( = ?auto_173520 ?auto_173519 ) ) ( not ( = ?auto_173516 ?auto_173517 ) ) ( not ( = ?auto_173516 ?auto_173519 ) ) ( ON ?auto_173519 ?auto_173518 ) ( not ( = ?auto_173513 ?auto_173518 ) ) ( not ( = ?auto_173514 ?auto_173518 ) ) ( not ( = ?auto_173515 ?auto_173518 ) ) ( not ( = ?auto_173520 ?auto_173518 ) ) ( not ( = ?auto_173516 ?auto_173518 ) ) ( not ( = ?auto_173521 ?auto_173518 ) ) ( not ( = ?auto_173519 ?auto_173518 ) ) ( not ( = ?auto_173517 ?auto_173518 ) ) ( ON ?auto_173517 ?auto_173519 ) ( ON-TABLE ?auto_173518 ) ( CLEAR ?auto_173516 ) ( ON ?auto_173521 ?auto_173517 ) ( CLEAR ?auto_173521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173518 ?auto_173519 ?auto_173517 )
      ( MAKE-3PILE ?auto_173513 ?auto_173514 ?auto_173515 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173522 - BLOCK
      ?auto_173523 - BLOCK
      ?auto_173524 - BLOCK
    )
    :vars
    (
      ?auto_173525 - BLOCK
      ?auto_173529 - BLOCK
      ?auto_173527 - BLOCK
      ?auto_173526 - BLOCK
      ?auto_173530 - BLOCK
      ?auto_173528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173525 ?auto_173524 ) ( ON-TABLE ?auto_173522 ) ( ON ?auto_173523 ?auto_173522 ) ( ON ?auto_173524 ?auto_173523 ) ( not ( = ?auto_173522 ?auto_173523 ) ) ( not ( = ?auto_173522 ?auto_173524 ) ) ( not ( = ?auto_173522 ?auto_173525 ) ) ( not ( = ?auto_173523 ?auto_173524 ) ) ( not ( = ?auto_173523 ?auto_173525 ) ) ( not ( = ?auto_173524 ?auto_173525 ) ) ( not ( = ?auto_173522 ?auto_173529 ) ) ( not ( = ?auto_173522 ?auto_173527 ) ) ( not ( = ?auto_173523 ?auto_173529 ) ) ( not ( = ?auto_173523 ?auto_173527 ) ) ( not ( = ?auto_173524 ?auto_173529 ) ) ( not ( = ?auto_173524 ?auto_173527 ) ) ( not ( = ?auto_173525 ?auto_173529 ) ) ( not ( = ?auto_173525 ?auto_173527 ) ) ( not ( = ?auto_173529 ?auto_173527 ) ) ( not ( = ?auto_173526 ?auto_173530 ) ) ( not ( = ?auto_173526 ?auto_173527 ) ) ( not ( = ?auto_173530 ?auto_173527 ) ) ( not ( = ?auto_173522 ?auto_173530 ) ) ( not ( = ?auto_173522 ?auto_173526 ) ) ( not ( = ?auto_173523 ?auto_173530 ) ) ( not ( = ?auto_173523 ?auto_173526 ) ) ( not ( = ?auto_173524 ?auto_173530 ) ) ( not ( = ?auto_173524 ?auto_173526 ) ) ( not ( = ?auto_173525 ?auto_173530 ) ) ( not ( = ?auto_173525 ?auto_173526 ) ) ( not ( = ?auto_173529 ?auto_173530 ) ) ( not ( = ?auto_173529 ?auto_173526 ) ) ( ON ?auto_173526 ?auto_173528 ) ( not ( = ?auto_173522 ?auto_173528 ) ) ( not ( = ?auto_173523 ?auto_173528 ) ) ( not ( = ?auto_173524 ?auto_173528 ) ) ( not ( = ?auto_173525 ?auto_173528 ) ) ( not ( = ?auto_173529 ?auto_173528 ) ) ( not ( = ?auto_173527 ?auto_173528 ) ) ( not ( = ?auto_173526 ?auto_173528 ) ) ( not ( = ?auto_173530 ?auto_173528 ) ) ( ON ?auto_173530 ?auto_173526 ) ( ON-TABLE ?auto_173528 ) ( ON ?auto_173527 ?auto_173530 ) ( CLEAR ?auto_173527 ) ( HOLDING ?auto_173529 ) ( CLEAR ?auto_173525 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173522 ?auto_173523 ?auto_173524 ?auto_173525 ?auto_173529 )
      ( MAKE-3PILE ?auto_173522 ?auto_173523 ?auto_173524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173531 - BLOCK
      ?auto_173532 - BLOCK
      ?auto_173533 - BLOCK
    )
    :vars
    (
      ?auto_173538 - BLOCK
      ?auto_173539 - BLOCK
      ?auto_173535 - BLOCK
      ?auto_173534 - BLOCK
      ?auto_173536 - BLOCK
      ?auto_173537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173538 ?auto_173533 ) ( ON-TABLE ?auto_173531 ) ( ON ?auto_173532 ?auto_173531 ) ( ON ?auto_173533 ?auto_173532 ) ( not ( = ?auto_173531 ?auto_173532 ) ) ( not ( = ?auto_173531 ?auto_173533 ) ) ( not ( = ?auto_173531 ?auto_173538 ) ) ( not ( = ?auto_173532 ?auto_173533 ) ) ( not ( = ?auto_173532 ?auto_173538 ) ) ( not ( = ?auto_173533 ?auto_173538 ) ) ( not ( = ?auto_173531 ?auto_173539 ) ) ( not ( = ?auto_173531 ?auto_173535 ) ) ( not ( = ?auto_173532 ?auto_173539 ) ) ( not ( = ?auto_173532 ?auto_173535 ) ) ( not ( = ?auto_173533 ?auto_173539 ) ) ( not ( = ?auto_173533 ?auto_173535 ) ) ( not ( = ?auto_173538 ?auto_173539 ) ) ( not ( = ?auto_173538 ?auto_173535 ) ) ( not ( = ?auto_173539 ?auto_173535 ) ) ( not ( = ?auto_173534 ?auto_173536 ) ) ( not ( = ?auto_173534 ?auto_173535 ) ) ( not ( = ?auto_173536 ?auto_173535 ) ) ( not ( = ?auto_173531 ?auto_173536 ) ) ( not ( = ?auto_173531 ?auto_173534 ) ) ( not ( = ?auto_173532 ?auto_173536 ) ) ( not ( = ?auto_173532 ?auto_173534 ) ) ( not ( = ?auto_173533 ?auto_173536 ) ) ( not ( = ?auto_173533 ?auto_173534 ) ) ( not ( = ?auto_173538 ?auto_173536 ) ) ( not ( = ?auto_173538 ?auto_173534 ) ) ( not ( = ?auto_173539 ?auto_173536 ) ) ( not ( = ?auto_173539 ?auto_173534 ) ) ( ON ?auto_173534 ?auto_173537 ) ( not ( = ?auto_173531 ?auto_173537 ) ) ( not ( = ?auto_173532 ?auto_173537 ) ) ( not ( = ?auto_173533 ?auto_173537 ) ) ( not ( = ?auto_173538 ?auto_173537 ) ) ( not ( = ?auto_173539 ?auto_173537 ) ) ( not ( = ?auto_173535 ?auto_173537 ) ) ( not ( = ?auto_173534 ?auto_173537 ) ) ( not ( = ?auto_173536 ?auto_173537 ) ) ( ON ?auto_173536 ?auto_173534 ) ( ON-TABLE ?auto_173537 ) ( ON ?auto_173535 ?auto_173536 ) ( CLEAR ?auto_173538 ) ( ON ?auto_173539 ?auto_173535 ) ( CLEAR ?auto_173539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173537 ?auto_173534 ?auto_173536 ?auto_173535 )
      ( MAKE-3PILE ?auto_173531 ?auto_173532 ?auto_173533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173558 - BLOCK
      ?auto_173559 - BLOCK
      ?auto_173560 - BLOCK
    )
    :vars
    (
      ?auto_173565 - BLOCK
      ?auto_173562 - BLOCK
      ?auto_173563 - BLOCK
      ?auto_173566 - BLOCK
      ?auto_173561 - BLOCK
      ?auto_173564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173558 ) ( ON ?auto_173559 ?auto_173558 ) ( not ( = ?auto_173558 ?auto_173559 ) ) ( not ( = ?auto_173558 ?auto_173560 ) ) ( not ( = ?auto_173558 ?auto_173565 ) ) ( not ( = ?auto_173559 ?auto_173560 ) ) ( not ( = ?auto_173559 ?auto_173565 ) ) ( not ( = ?auto_173560 ?auto_173565 ) ) ( not ( = ?auto_173558 ?auto_173562 ) ) ( not ( = ?auto_173558 ?auto_173563 ) ) ( not ( = ?auto_173559 ?auto_173562 ) ) ( not ( = ?auto_173559 ?auto_173563 ) ) ( not ( = ?auto_173560 ?auto_173562 ) ) ( not ( = ?auto_173560 ?auto_173563 ) ) ( not ( = ?auto_173565 ?auto_173562 ) ) ( not ( = ?auto_173565 ?auto_173563 ) ) ( not ( = ?auto_173562 ?auto_173563 ) ) ( not ( = ?auto_173566 ?auto_173561 ) ) ( not ( = ?auto_173566 ?auto_173563 ) ) ( not ( = ?auto_173561 ?auto_173563 ) ) ( not ( = ?auto_173558 ?auto_173561 ) ) ( not ( = ?auto_173558 ?auto_173566 ) ) ( not ( = ?auto_173559 ?auto_173561 ) ) ( not ( = ?auto_173559 ?auto_173566 ) ) ( not ( = ?auto_173560 ?auto_173561 ) ) ( not ( = ?auto_173560 ?auto_173566 ) ) ( not ( = ?auto_173565 ?auto_173561 ) ) ( not ( = ?auto_173565 ?auto_173566 ) ) ( not ( = ?auto_173562 ?auto_173561 ) ) ( not ( = ?auto_173562 ?auto_173566 ) ) ( ON ?auto_173566 ?auto_173564 ) ( not ( = ?auto_173558 ?auto_173564 ) ) ( not ( = ?auto_173559 ?auto_173564 ) ) ( not ( = ?auto_173560 ?auto_173564 ) ) ( not ( = ?auto_173565 ?auto_173564 ) ) ( not ( = ?auto_173562 ?auto_173564 ) ) ( not ( = ?auto_173563 ?auto_173564 ) ) ( not ( = ?auto_173566 ?auto_173564 ) ) ( not ( = ?auto_173561 ?auto_173564 ) ) ( ON ?auto_173561 ?auto_173566 ) ( ON-TABLE ?auto_173564 ) ( ON ?auto_173563 ?auto_173561 ) ( ON ?auto_173562 ?auto_173563 ) ( ON ?auto_173565 ?auto_173562 ) ( CLEAR ?auto_173565 ) ( HOLDING ?auto_173560 ) ( CLEAR ?auto_173559 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173558 ?auto_173559 ?auto_173560 ?auto_173565 )
      ( MAKE-3PILE ?auto_173558 ?auto_173559 ?auto_173560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173567 - BLOCK
      ?auto_173568 - BLOCK
      ?auto_173569 - BLOCK
    )
    :vars
    (
      ?auto_173571 - BLOCK
      ?auto_173570 - BLOCK
      ?auto_173572 - BLOCK
      ?auto_173574 - BLOCK
      ?auto_173575 - BLOCK
      ?auto_173573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173567 ) ( ON ?auto_173568 ?auto_173567 ) ( not ( = ?auto_173567 ?auto_173568 ) ) ( not ( = ?auto_173567 ?auto_173569 ) ) ( not ( = ?auto_173567 ?auto_173571 ) ) ( not ( = ?auto_173568 ?auto_173569 ) ) ( not ( = ?auto_173568 ?auto_173571 ) ) ( not ( = ?auto_173569 ?auto_173571 ) ) ( not ( = ?auto_173567 ?auto_173570 ) ) ( not ( = ?auto_173567 ?auto_173572 ) ) ( not ( = ?auto_173568 ?auto_173570 ) ) ( not ( = ?auto_173568 ?auto_173572 ) ) ( not ( = ?auto_173569 ?auto_173570 ) ) ( not ( = ?auto_173569 ?auto_173572 ) ) ( not ( = ?auto_173571 ?auto_173570 ) ) ( not ( = ?auto_173571 ?auto_173572 ) ) ( not ( = ?auto_173570 ?auto_173572 ) ) ( not ( = ?auto_173574 ?auto_173575 ) ) ( not ( = ?auto_173574 ?auto_173572 ) ) ( not ( = ?auto_173575 ?auto_173572 ) ) ( not ( = ?auto_173567 ?auto_173575 ) ) ( not ( = ?auto_173567 ?auto_173574 ) ) ( not ( = ?auto_173568 ?auto_173575 ) ) ( not ( = ?auto_173568 ?auto_173574 ) ) ( not ( = ?auto_173569 ?auto_173575 ) ) ( not ( = ?auto_173569 ?auto_173574 ) ) ( not ( = ?auto_173571 ?auto_173575 ) ) ( not ( = ?auto_173571 ?auto_173574 ) ) ( not ( = ?auto_173570 ?auto_173575 ) ) ( not ( = ?auto_173570 ?auto_173574 ) ) ( ON ?auto_173574 ?auto_173573 ) ( not ( = ?auto_173567 ?auto_173573 ) ) ( not ( = ?auto_173568 ?auto_173573 ) ) ( not ( = ?auto_173569 ?auto_173573 ) ) ( not ( = ?auto_173571 ?auto_173573 ) ) ( not ( = ?auto_173570 ?auto_173573 ) ) ( not ( = ?auto_173572 ?auto_173573 ) ) ( not ( = ?auto_173574 ?auto_173573 ) ) ( not ( = ?auto_173575 ?auto_173573 ) ) ( ON ?auto_173575 ?auto_173574 ) ( ON-TABLE ?auto_173573 ) ( ON ?auto_173572 ?auto_173575 ) ( ON ?auto_173570 ?auto_173572 ) ( ON ?auto_173571 ?auto_173570 ) ( CLEAR ?auto_173568 ) ( ON ?auto_173569 ?auto_173571 ) ( CLEAR ?auto_173569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173573 ?auto_173574 ?auto_173575 ?auto_173572 ?auto_173570 ?auto_173571 )
      ( MAKE-3PILE ?auto_173567 ?auto_173568 ?auto_173569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173576 - BLOCK
      ?auto_173577 - BLOCK
      ?auto_173578 - BLOCK
    )
    :vars
    (
      ?auto_173580 - BLOCK
      ?auto_173581 - BLOCK
      ?auto_173579 - BLOCK
      ?auto_173584 - BLOCK
      ?auto_173582 - BLOCK
      ?auto_173583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173576 ) ( not ( = ?auto_173576 ?auto_173577 ) ) ( not ( = ?auto_173576 ?auto_173578 ) ) ( not ( = ?auto_173576 ?auto_173580 ) ) ( not ( = ?auto_173577 ?auto_173578 ) ) ( not ( = ?auto_173577 ?auto_173580 ) ) ( not ( = ?auto_173578 ?auto_173580 ) ) ( not ( = ?auto_173576 ?auto_173581 ) ) ( not ( = ?auto_173576 ?auto_173579 ) ) ( not ( = ?auto_173577 ?auto_173581 ) ) ( not ( = ?auto_173577 ?auto_173579 ) ) ( not ( = ?auto_173578 ?auto_173581 ) ) ( not ( = ?auto_173578 ?auto_173579 ) ) ( not ( = ?auto_173580 ?auto_173581 ) ) ( not ( = ?auto_173580 ?auto_173579 ) ) ( not ( = ?auto_173581 ?auto_173579 ) ) ( not ( = ?auto_173584 ?auto_173582 ) ) ( not ( = ?auto_173584 ?auto_173579 ) ) ( not ( = ?auto_173582 ?auto_173579 ) ) ( not ( = ?auto_173576 ?auto_173582 ) ) ( not ( = ?auto_173576 ?auto_173584 ) ) ( not ( = ?auto_173577 ?auto_173582 ) ) ( not ( = ?auto_173577 ?auto_173584 ) ) ( not ( = ?auto_173578 ?auto_173582 ) ) ( not ( = ?auto_173578 ?auto_173584 ) ) ( not ( = ?auto_173580 ?auto_173582 ) ) ( not ( = ?auto_173580 ?auto_173584 ) ) ( not ( = ?auto_173581 ?auto_173582 ) ) ( not ( = ?auto_173581 ?auto_173584 ) ) ( ON ?auto_173584 ?auto_173583 ) ( not ( = ?auto_173576 ?auto_173583 ) ) ( not ( = ?auto_173577 ?auto_173583 ) ) ( not ( = ?auto_173578 ?auto_173583 ) ) ( not ( = ?auto_173580 ?auto_173583 ) ) ( not ( = ?auto_173581 ?auto_173583 ) ) ( not ( = ?auto_173579 ?auto_173583 ) ) ( not ( = ?auto_173584 ?auto_173583 ) ) ( not ( = ?auto_173582 ?auto_173583 ) ) ( ON ?auto_173582 ?auto_173584 ) ( ON-TABLE ?auto_173583 ) ( ON ?auto_173579 ?auto_173582 ) ( ON ?auto_173581 ?auto_173579 ) ( ON ?auto_173580 ?auto_173581 ) ( ON ?auto_173578 ?auto_173580 ) ( CLEAR ?auto_173578 ) ( HOLDING ?auto_173577 ) ( CLEAR ?auto_173576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173576 ?auto_173577 )
      ( MAKE-3PILE ?auto_173576 ?auto_173577 ?auto_173578 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173585 - BLOCK
      ?auto_173586 - BLOCK
      ?auto_173587 - BLOCK
    )
    :vars
    (
      ?auto_173589 - BLOCK
      ?auto_173590 - BLOCK
      ?auto_173588 - BLOCK
      ?auto_173593 - BLOCK
      ?auto_173592 - BLOCK
      ?auto_173591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173585 ) ( not ( = ?auto_173585 ?auto_173586 ) ) ( not ( = ?auto_173585 ?auto_173587 ) ) ( not ( = ?auto_173585 ?auto_173589 ) ) ( not ( = ?auto_173586 ?auto_173587 ) ) ( not ( = ?auto_173586 ?auto_173589 ) ) ( not ( = ?auto_173587 ?auto_173589 ) ) ( not ( = ?auto_173585 ?auto_173590 ) ) ( not ( = ?auto_173585 ?auto_173588 ) ) ( not ( = ?auto_173586 ?auto_173590 ) ) ( not ( = ?auto_173586 ?auto_173588 ) ) ( not ( = ?auto_173587 ?auto_173590 ) ) ( not ( = ?auto_173587 ?auto_173588 ) ) ( not ( = ?auto_173589 ?auto_173590 ) ) ( not ( = ?auto_173589 ?auto_173588 ) ) ( not ( = ?auto_173590 ?auto_173588 ) ) ( not ( = ?auto_173593 ?auto_173592 ) ) ( not ( = ?auto_173593 ?auto_173588 ) ) ( not ( = ?auto_173592 ?auto_173588 ) ) ( not ( = ?auto_173585 ?auto_173592 ) ) ( not ( = ?auto_173585 ?auto_173593 ) ) ( not ( = ?auto_173586 ?auto_173592 ) ) ( not ( = ?auto_173586 ?auto_173593 ) ) ( not ( = ?auto_173587 ?auto_173592 ) ) ( not ( = ?auto_173587 ?auto_173593 ) ) ( not ( = ?auto_173589 ?auto_173592 ) ) ( not ( = ?auto_173589 ?auto_173593 ) ) ( not ( = ?auto_173590 ?auto_173592 ) ) ( not ( = ?auto_173590 ?auto_173593 ) ) ( ON ?auto_173593 ?auto_173591 ) ( not ( = ?auto_173585 ?auto_173591 ) ) ( not ( = ?auto_173586 ?auto_173591 ) ) ( not ( = ?auto_173587 ?auto_173591 ) ) ( not ( = ?auto_173589 ?auto_173591 ) ) ( not ( = ?auto_173590 ?auto_173591 ) ) ( not ( = ?auto_173588 ?auto_173591 ) ) ( not ( = ?auto_173593 ?auto_173591 ) ) ( not ( = ?auto_173592 ?auto_173591 ) ) ( ON ?auto_173592 ?auto_173593 ) ( ON-TABLE ?auto_173591 ) ( ON ?auto_173588 ?auto_173592 ) ( ON ?auto_173590 ?auto_173588 ) ( ON ?auto_173589 ?auto_173590 ) ( ON ?auto_173587 ?auto_173589 ) ( CLEAR ?auto_173585 ) ( ON ?auto_173586 ?auto_173587 ) ( CLEAR ?auto_173586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173591 ?auto_173593 ?auto_173592 ?auto_173588 ?auto_173590 ?auto_173589 ?auto_173587 )
      ( MAKE-3PILE ?auto_173585 ?auto_173586 ?auto_173587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173594 - BLOCK
      ?auto_173595 - BLOCK
      ?auto_173596 - BLOCK
    )
    :vars
    (
      ?auto_173597 - BLOCK
      ?auto_173601 - BLOCK
      ?auto_173599 - BLOCK
      ?auto_173602 - BLOCK
      ?auto_173598 - BLOCK
      ?auto_173600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173594 ?auto_173595 ) ) ( not ( = ?auto_173594 ?auto_173596 ) ) ( not ( = ?auto_173594 ?auto_173597 ) ) ( not ( = ?auto_173595 ?auto_173596 ) ) ( not ( = ?auto_173595 ?auto_173597 ) ) ( not ( = ?auto_173596 ?auto_173597 ) ) ( not ( = ?auto_173594 ?auto_173601 ) ) ( not ( = ?auto_173594 ?auto_173599 ) ) ( not ( = ?auto_173595 ?auto_173601 ) ) ( not ( = ?auto_173595 ?auto_173599 ) ) ( not ( = ?auto_173596 ?auto_173601 ) ) ( not ( = ?auto_173596 ?auto_173599 ) ) ( not ( = ?auto_173597 ?auto_173601 ) ) ( not ( = ?auto_173597 ?auto_173599 ) ) ( not ( = ?auto_173601 ?auto_173599 ) ) ( not ( = ?auto_173602 ?auto_173598 ) ) ( not ( = ?auto_173602 ?auto_173599 ) ) ( not ( = ?auto_173598 ?auto_173599 ) ) ( not ( = ?auto_173594 ?auto_173598 ) ) ( not ( = ?auto_173594 ?auto_173602 ) ) ( not ( = ?auto_173595 ?auto_173598 ) ) ( not ( = ?auto_173595 ?auto_173602 ) ) ( not ( = ?auto_173596 ?auto_173598 ) ) ( not ( = ?auto_173596 ?auto_173602 ) ) ( not ( = ?auto_173597 ?auto_173598 ) ) ( not ( = ?auto_173597 ?auto_173602 ) ) ( not ( = ?auto_173601 ?auto_173598 ) ) ( not ( = ?auto_173601 ?auto_173602 ) ) ( ON ?auto_173602 ?auto_173600 ) ( not ( = ?auto_173594 ?auto_173600 ) ) ( not ( = ?auto_173595 ?auto_173600 ) ) ( not ( = ?auto_173596 ?auto_173600 ) ) ( not ( = ?auto_173597 ?auto_173600 ) ) ( not ( = ?auto_173601 ?auto_173600 ) ) ( not ( = ?auto_173599 ?auto_173600 ) ) ( not ( = ?auto_173602 ?auto_173600 ) ) ( not ( = ?auto_173598 ?auto_173600 ) ) ( ON ?auto_173598 ?auto_173602 ) ( ON-TABLE ?auto_173600 ) ( ON ?auto_173599 ?auto_173598 ) ( ON ?auto_173601 ?auto_173599 ) ( ON ?auto_173597 ?auto_173601 ) ( ON ?auto_173596 ?auto_173597 ) ( ON ?auto_173595 ?auto_173596 ) ( CLEAR ?auto_173595 ) ( HOLDING ?auto_173594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173594 )
      ( MAKE-3PILE ?auto_173594 ?auto_173595 ?auto_173596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_173603 - BLOCK
      ?auto_173604 - BLOCK
      ?auto_173605 - BLOCK
    )
    :vars
    (
      ?auto_173607 - BLOCK
      ?auto_173609 - BLOCK
      ?auto_173611 - BLOCK
      ?auto_173608 - BLOCK
      ?auto_173606 - BLOCK
      ?auto_173610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173603 ?auto_173604 ) ) ( not ( = ?auto_173603 ?auto_173605 ) ) ( not ( = ?auto_173603 ?auto_173607 ) ) ( not ( = ?auto_173604 ?auto_173605 ) ) ( not ( = ?auto_173604 ?auto_173607 ) ) ( not ( = ?auto_173605 ?auto_173607 ) ) ( not ( = ?auto_173603 ?auto_173609 ) ) ( not ( = ?auto_173603 ?auto_173611 ) ) ( not ( = ?auto_173604 ?auto_173609 ) ) ( not ( = ?auto_173604 ?auto_173611 ) ) ( not ( = ?auto_173605 ?auto_173609 ) ) ( not ( = ?auto_173605 ?auto_173611 ) ) ( not ( = ?auto_173607 ?auto_173609 ) ) ( not ( = ?auto_173607 ?auto_173611 ) ) ( not ( = ?auto_173609 ?auto_173611 ) ) ( not ( = ?auto_173608 ?auto_173606 ) ) ( not ( = ?auto_173608 ?auto_173611 ) ) ( not ( = ?auto_173606 ?auto_173611 ) ) ( not ( = ?auto_173603 ?auto_173606 ) ) ( not ( = ?auto_173603 ?auto_173608 ) ) ( not ( = ?auto_173604 ?auto_173606 ) ) ( not ( = ?auto_173604 ?auto_173608 ) ) ( not ( = ?auto_173605 ?auto_173606 ) ) ( not ( = ?auto_173605 ?auto_173608 ) ) ( not ( = ?auto_173607 ?auto_173606 ) ) ( not ( = ?auto_173607 ?auto_173608 ) ) ( not ( = ?auto_173609 ?auto_173606 ) ) ( not ( = ?auto_173609 ?auto_173608 ) ) ( ON ?auto_173608 ?auto_173610 ) ( not ( = ?auto_173603 ?auto_173610 ) ) ( not ( = ?auto_173604 ?auto_173610 ) ) ( not ( = ?auto_173605 ?auto_173610 ) ) ( not ( = ?auto_173607 ?auto_173610 ) ) ( not ( = ?auto_173609 ?auto_173610 ) ) ( not ( = ?auto_173611 ?auto_173610 ) ) ( not ( = ?auto_173608 ?auto_173610 ) ) ( not ( = ?auto_173606 ?auto_173610 ) ) ( ON ?auto_173606 ?auto_173608 ) ( ON-TABLE ?auto_173610 ) ( ON ?auto_173611 ?auto_173606 ) ( ON ?auto_173609 ?auto_173611 ) ( ON ?auto_173607 ?auto_173609 ) ( ON ?auto_173605 ?auto_173607 ) ( ON ?auto_173604 ?auto_173605 ) ( ON ?auto_173603 ?auto_173604 ) ( CLEAR ?auto_173603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173610 ?auto_173608 ?auto_173606 ?auto_173611 ?auto_173609 ?auto_173607 ?auto_173605 ?auto_173604 )
      ( MAKE-3PILE ?auto_173603 ?auto_173604 ?auto_173605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173617 - BLOCK
      ?auto_173618 - BLOCK
      ?auto_173619 - BLOCK
      ?auto_173620 - BLOCK
      ?auto_173621 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_173621 ) ( CLEAR ?auto_173620 ) ( ON-TABLE ?auto_173617 ) ( ON ?auto_173618 ?auto_173617 ) ( ON ?auto_173619 ?auto_173618 ) ( ON ?auto_173620 ?auto_173619 ) ( not ( = ?auto_173617 ?auto_173618 ) ) ( not ( = ?auto_173617 ?auto_173619 ) ) ( not ( = ?auto_173617 ?auto_173620 ) ) ( not ( = ?auto_173617 ?auto_173621 ) ) ( not ( = ?auto_173618 ?auto_173619 ) ) ( not ( = ?auto_173618 ?auto_173620 ) ) ( not ( = ?auto_173618 ?auto_173621 ) ) ( not ( = ?auto_173619 ?auto_173620 ) ) ( not ( = ?auto_173619 ?auto_173621 ) ) ( not ( = ?auto_173620 ?auto_173621 ) ) )
    :subtasks
    ( ( !STACK ?auto_173621 ?auto_173620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173622 - BLOCK
      ?auto_173623 - BLOCK
      ?auto_173624 - BLOCK
      ?auto_173625 - BLOCK
      ?auto_173626 - BLOCK
    )
    :vars
    (
      ?auto_173627 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_173625 ) ( ON-TABLE ?auto_173622 ) ( ON ?auto_173623 ?auto_173622 ) ( ON ?auto_173624 ?auto_173623 ) ( ON ?auto_173625 ?auto_173624 ) ( not ( = ?auto_173622 ?auto_173623 ) ) ( not ( = ?auto_173622 ?auto_173624 ) ) ( not ( = ?auto_173622 ?auto_173625 ) ) ( not ( = ?auto_173622 ?auto_173626 ) ) ( not ( = ?auto_173623 ?auto_173624 ) ) ( not ( = ?auto_173623 ?auto_173625 ) ) ( not ( = ?auto_173623 ?auto_173626 ) ) ( not ( = ?auto_173624 ?auto_173625 ) ) ( not ( = ?auto_173624 ?auto_173626 ) ) ( not ( = ?auto_173625 ?auto_173626 ) ) ( ON ?auto_173626 ?auto_173627 ) ( CLEAR ?auto_173626 ) ( HAND-EMPTY ) ( not ( = ?auto_173622 ?auto_173627 ) ) ( not ( = ?auto_173623 ?auto_173627 ) ) ( not ( = ?auto_173624 ?auto_173627 ) ) ( not ( = ?auto_173625 ?auto_173627 ) ) ( not ( = ?auto_173626 ?auto_173627 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173626 ?auto_173627 )
      ( MAKE-5PILE ?auto_173622 ?auto_173623 ?auto_173624 ?auto_173625 ?auto_173626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173628 - BLOCK
      ?auto_173629 - BLOCK
      ?auto_173630 - BLOCK
      ?auto_173631 - BLOCK
      ?auto_173632 - BLOCK
    )
    :vars
    (
      ?auto_173633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173628 ) ( ON ?auto_173629 ?auto_173628 ) ( ON ?auto_173630 ?auto_173629 ) ( not ( = ?auto_173628 ?auto_173629 ) ) ( not ( = ?auto_173628 ?auto_173630 ) ) ( not ( = ?auto_173628 ?auto_173631 ) ) ( not ( = ?auto_173628 ?auto_173632 ) ) ( not ( = ?auto_173629 ?auto_173630 ) ) ( not ( = ?auto_173629 ?auto_173631 ) ) ( not ( = ?auto_173629 ?auto_173632 ) ) ( not ( = ?auto_173630 ?auto_173631 ) ) ( not ( = ?auto_173630 ?auto_173632 ) ) ( not ( = ?auto_173631 ?auto_173632 ) ) ( ON ?auto_173632 ?auto_173633 ) ( CLEAR ?auto_173632 ) ( not ( = ?auto_173628 ?auto_173633 ) ) ( not ( = ?auto_173629 ?auto_173633 ) ) ( not ( = ?auto_173630 ?auto_173633 ) ) ( not ( = ?auto_173631 ?auto_173633 ) ) ( not ( = ?auto_173632 ?auto_173633 ) ) ( HOLDING ?auto_173631 ) ( CLEAR ?auto_173630 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173628 ?auto_173629 ?auto_173630 ?auto_173631 )
      ( MAKE-5PILE ?auto_173628 ?auto_173629 ?auto_173630 ?auto_173631 ?auto_173632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173634 - BLOCK
      ?auto_173635 - BLOCK
      ?auto_173636 - BLOCK
      ?auto_173637 - BLOCK
      ?auto_173638 - BLOCK
    )
    :vars
    (
      ?auto_173639 - BLOCK
      ?auto_173641 - BLOCK
      ?auto_173640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173634 ) ( ON ?auto_173635 ?auto_173634 ) ( ON ?auto_173636 ?auto_173635 ) ( not ( = ?auto_173634 ?auto_173635 ) ) ( not ( = ?auto_173634 ?auto_173636 ) ) ( not ( = ?auto_173634 ?auto_173637 ) ) ( not ( = ?auto_173634 ?auto_173638 ) ) ( not ( = ?auto_173635 ?auto_173636 ) ) ( not ( = ?auto_173635 ?auto_173637 ) ) ( not ( = ?auto_173635 ?auto_173638 ) ) ( not ( = ?auto_173636 ?auto_173637 ) ) ( not ( = ?auto_173636 ?auto_173638 ) ) ( not ( = ?auto_173637 ?auto_173638 ) ) ( ON ?auto_173638 ?auto_173639 ) ( not ( = ?auto_173634 ?auto_173639 ) ) ( not ( = ?auto_173635 ?auto_173639 ) ) ( not ( = ?auto_173636 ?auto_173639 ) ) ( not ( = ?auto_173637 ?auto_173639 ) ) ( not ( = ?auto_173638 ?auto_173639 ) ) ( CLEAR ?auto_173636 ) ( ON ?auto_173637 ?auto_173638 ) ( CLEAR ?auto_173637 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173641 ) ( ON ?auto_173640 ?auto_173641 ) ( ON ?auto_173639 ?auto_173640 ) ( not ( = ?auto_173641 ?auto_173640 ) ) ( not ( = ?auto_173641 ?auto_173639 ) ) ( not ( = ?auto_173641 ?auto_173638 ) ) ( not ( = ?auto_173641 ?auto_173637 ) ) ( not ( = ?auto_173640 ?auto_173639 ) ) ( not ( = ?auto_173640 ?auto_173638 ) ) ( not ( = ?auto_173640 ?auto_173637 ) ) ( not ( = ?auto_173634 ?auto_173641 ) ) ( not ( = ?auto_173634 ?auto_173640 ) ) ( not ( = ?auto_173635 ?auto_173641 ) ) ( not ( = ?auto_173635 ?auto_173640 ) ) ( not ( = ?auto_173636 ?auto_173641 ) ) ( not ( = ?auto_173636 ?auto_173640 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173641 ?auto_173640 ?auto_173639 ?auto_173638 )
      ( MAKE-5PILE ?auto_173634 ?auto_173635 ?auto_173636 ?auto_173637 ?auto_173638 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173642 - BLOCK
      ?auto_173643 - BLOCK
      ?auto_173644 - BLOCK
      ?auto_173645 - BLOCK
      ?auto_173646 - BLOCK
    )
    :vars
    (
      ?auto_173649 - BLOCK
      ?auto_173647 - BLOCK
      ?auto_173648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173642 ) ( ON ?auto_173643 ?auto_173642 ) ( not ( = ?auto_173642 ?auto_173643 ) ) ( not ( = ?auto_173642 ?auto_173644 ) ) ( not ( = ?auto_173642 ?auto_173645 ) ) ( not ( = ?auto_173642 ?auto_173646 ) ) ( not ( = ?auto_173643 ?auto_173644 ) ) ( not ( = ?auto_173643 ?auto_173645 ) ) ( not ( = ?auto_173643 ?auto_173646 ) ) ( not ( = ?auto_173644 ?auto_173645 ) ) ( not ( = ?auto_173644 ?auto_173646 ) ) ( not ( = ?auto_173645 ?auto_173646 ) ) ( ON ?auto_173646 ?auto_173649 ) ( not ( = ?auto_173642 ?auto_173649 ) ) ( not ( = ?auto_173643 ?auto_173649 ) ) ( not ( = ?auto_173644 ?auto_173649 ) ) ( not ( = ?auto_173645 ?auto_173649 ) ) ( not ( = ?auto_173646 ?auto_173649 ) ) ( ON ?auto_173645 ?auto_173646 ) ( CLEAR ?auto_173645 ) ( ON-TABLE ?auto_173647 ) ( ON ?auto_173648 ?auto_173647 ) ( ON ?auto_173649 ?auto_173648 ) ( not ( = ?auto_173647 ?auto_173648 ) ) ( not ( = ?auto_173647 ?auto_173649 ) ) ( not ( = ?auto_173647 ?auto_173646 ) ) ( not ( = ?auto_173647 ?auto_173645 ) ) ( not ( = ?auto_173648 ?auto_173649 ) ) ( not ( = ?auto_173648 ?auto_173646 ) ) ( not ( = ?auto_173648 ?auto_173645 ) ) ( not ( = ?auto_173642 ?auto_173647 ) ) ( not ( = ?auto_173642 ?auto_173648 ) ) ( not ( = ?auto_173643 ?auto_173647 ) ) ( not ( = ?auto_173643 ?auto_173648 ) ) ( not ( = ?auto_173644 ?auto_173647 ) ) ( not ( = ?auto_173644 ?auto_173648 ) ) ( HOLDING ?auto_173644 ) ( CLEAR ?auto_173643 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173642 ?auto_173643 ?auto_173644 )
      ( MAKE-5PILE ?auto_173642 ?auto_173643 ?auto_173644 ?auto_173645 ?auto_173646 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173650 - BLOCK
      ?auto_173651 - BLOCK
      ?auto_173652 - BLOCK
      ?auto_173653 - BLOCK
      ?auto_173654 - BLOCK
    )
    :vars
    (
      ?auto_173655 - BLOCK
      ?auto_173657 - BLOCK
      ?auto_173656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173650 ) ( ON ?auto_173651 ?auto_173650 ) ( not ( = ?auto_173650 ?auto_173651 ) ) ( not ( = ?auto_173650 ?auto_173652 ) ) ( not ( = ?auto_173650 ?auto_173653 ) ) ( not ( = ?auto_173650 ?auto_173654 ) ) ( not ( = ?auto_173651 ?auto_173652 ) ) ( not ( = ?auto_173651 ?auto_173653 ) ) ( not ( = ?auto_173651 ?auto_173654 ) ) ( not ( = ?auto_173652 ?auto_173653 ) ) ( not ( = ?auto_173652 ?auto_173654 ) ) ( not ( = ?auto_173653 ?auto_173654 ) ) ( ON ?auto_173654 ?auto_173655 ) ( not ( = ?auto_173650 ?auto_173655 ) ) ( not ( = ?auto_173651 ?auto_173655 ) ) ( not ( = ?auto_173652 ?auto_173655 ) ) ( not ( = ?auto_173653 ?auto_173655 ) ) ( not ( = ?auto_173654 ?auto_173655 ) ) ( ON ?auto_173653 ?auto_173654 ) ( ON-TABLE ?auto_173657 ) ( ON ?auto_173656 ?auto_173657 ) ( ON ?auto_173655 ?auto_173656 ) ( not ( = ?auto_173657 ?auto_173656 ) ) ( not ( = ?auto_173657 ?auto_173655 ) ) ( not ( = ?auto_173657 ?auto_173654 ) ) ( not ( = ?auto_173657 ?auto_173653 ) ) ( not ( = ?auto_173656 ?auto_173655 ) ) ( not ( = ?auto_173656 ?auto_173654 ) ) ( not ( = ?auto_173656 ?auto_173653 ) ) ( not ( = ?auto_173650 ?auto_173657 ) ) ( not ( = ?auto_173650 ?auto_173656 ) ) ( not ( = ?auto_173651 ?auto_173657 ) ) ( not ( = ?auto_173651 ?auto_173656 ) ) ( not ( = ?auto_173652 ?auto_173657 ) ) ( not ( = ?auto_173652 ?auto_173656 ) ) ( CLEAR ?auto_173651 ) ( ON ?auto_173652 ?auto_173653 ) ( CLEAR ?auto_173652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173657 ?auto_173656 ?auto_173655 ?auto_173654 ?auto_173653 )
      ( MAKE-5PILE ?auto_173650 ?auto_173651 ?auto_173652 ?auto_173653 ?auto_173654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173658 - BLOCK
      ?auto_173659 - BLOCK
      ?auto_173660 - BLOCK
      ?auto_173661 - BLOCK
      ?auto_173662 - BLOCK
    )
    :vars
    (
      ?auto_173664 - BLOCK
      ?auto_173665 - BLOCK
      ?auto_173663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173658 ) ( not ( = ?auto_173658 ?auto_173659 ) ) ( not ( = ?auto_173658 ?auto_173660 ) ) ( not ( = ?auto_173658 ?auto_173661 ) ) ( not ( = ?auto_173658 ?auto_173662 ) ) ( not ( = ?auto_173659 ?auto_173660 ) ) ( not ( = ?auto_173659 ?auto_173661 ) ) ( not ( = ?auto_173659 ?auto_173662 ) ) ( not ( = ?auto_173660 ?auto_173661 ) ) ( not ( = ?auto_173660 ?auto_173662 ) ) ( not ( = ?auto_173661 ?auto_173662 ) ) ( ON ?auto_173662 ?auto_173664 ) ( not ( = ?auto_173658 ?auto_173664 ) ) ( not ( = ?auto_173659 ?auto_173664 ) ) ( not ( = ?auto_173660 ?auto_173664 ) ) ( not ( = ?auto_173661 ?auto_173664 ) ) ( not ( = ?auto_173662 ?auto_173664 ) ) ( ON ?auto_173661 ?auto_173662 ) ( ON-TABLE ?auto_173665 ) ( ON ?auto_173663 ?auto_173665 ) ( ON ?auto_173664 ?auto_173663 ) ( not ( = ?auto_173665 ?auto_173663 ) ) ( not ( = ?auto_173665 ?auto_173664 ) ) ( not ( = ?auto_173665 ?auto_173662 ) ) ( not ( = ?auto_173665 ?auto_173661 ) ) ( not ( = ?auto_173663 ?auto_173664 ) ) ( not ( = ?auto_173663 ?auto_173662 ) ) ( not ( = ?auto_173663 ?auto_173661 ) ) ( not ( = ?auto_173658 ?auto_173665 ) ) ( not ( = ?auto_173658 ?auto_173663 ) ) ( not ( = ?auto_173659 ?auto_173665 ) ) ( not ( = ?auto_173659 ?auto_173663 ) ) ( not ( = ?auto_173660 ?auto_173665 ) ) ( not ( = ?auto_173660 ?auto_173663 ) ) ( ON ?auto_173660 ?auto_173661 ) ( CLEAR ?auto_173660 ) ( HOLDING ?auto_173659 ) ( CLEAR ?auto_173658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173658 ?auto_173659 )
      ( MAKE-5PILE ?auto_173658 ?auto_173659 ?auto_173660 ?auto_173661 ?auto_173662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173666 - BLOCK
      ?auto_173667 - BLOCK
      ?auto_173668 - BLOCK
      ?auto_173669 - BLOCK
      ?auto_173670 - BLOCK
    )
    :vars
    (
      ?auto_173672 - BLOCK
      ?auto_173673 - BLOCK
      ?auto_173671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_173666 ) ( not ( = ?auto_173666 ?auto_173667 ) ) ( not ( = ?auto_173666 ?auto_173668 ) ) ( not ( = ?auto_173666 ?auto_173669 ) ) ( not ( = ?auto_173666 ?auto_173670 ) ) ( not ( = ?auto_173667 ?auto_173668 ) ) ( not ( = ?auto_173667 ?auto_173669 ) ) ( not ( = ?auto_173667 ?auto_173670 ) ) ( not ( = ?auto_173668 ?auto_173669 ) ) ( not ( = ?auto_173668 ?auto_173670 ) ) ( not ( = ?auto_173669 ?auto_173670 ) ) ( ON ?auto_173670 ?auto_173672 ) ( not ( = ?auto_173666 ?auto_173672 ) ) ( not ( = ?auto_173667 ?auto_173672 ) ) ( not ( = ?auto_173668 ?auto_173672 ) ) ( not ( = ?auto_173669 ?auto_173672 ) ) ( not ( = ?auto_173670 ?auto_173672 ) ) ( ON ?auto_173669 ?auto_173670 ) ( ON-TABLE ?auto_173673 ) ( ON ?auto_173671 ?auto_173673 ) ( ON ?auto_173672 ?auto_173671 ) ( not ( = ?auto_173673 ?auto_173671 ) ) ( not ( = ?auto_173673 ?auto_173672 ) ) ( not ( = ?auto_173673 ?auto_173670 ) ) ( not ( = ?auto_173673 ?auto_173669 ) ) ( not ( = ?auto_173671 ?auto_173672 ) ) ( not ( = ?auto_173671 ?auto_173670 ) ) ( not ( = ?auto_173671 ?auto_173669 ) ) ( not ( = ?auto_173666 ?auto_173673 ) ) ( not ( = ?auto_173666 ?auto_173671 ) ) ( not ( = ?auto_173667 ?auto_173673 ) ) ( not ( = ?auto_173667 ?auto_173671 ) ) ( not ( = ?auto_173668 ?auto_173673 ) ) ( not ( = ?auto_173668 ?auto_173671 ) ) ( ON ?auto_173668 ?auto_173669 ) ( CLEAR ?auto_173666 ) ( ON ?auto_173667 ?auto_173668 ) ( CLEAR ?auto_173667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173673 ?auto_173671 ?auto_173672 ?auto_173670 ?auto_173669 ?auto_173668 )
      ( MAKE-5PILE ?auto_173666 ?auto_173667 ?auto_173668 ?auto_173669 ?auto_173670 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173674 - BLOCK
      ?auto_173675 - BLOCK
      ?auto_173676 - BLOCK
      ?auto_173677 - BLOCK
      ?auto_173678 - BLOCK
    )
    :vars
    (
      ?auto_173679 - BLOCK
      ?auto_173680 - BLOCK
      ?auto_173681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173674 ?auto_173675 ) ) ( not ( = ?auto_173674 ?auto_173676 ) ) ( not ( = ?auto_173674 ?auto_173677 ) ) ( not ( = ?auto_173674 ?auto_173678 ) ) ( not ( = ?auto_173675 ?auto_173676 ) ) ( not ( = ?auto_173675 ?auto_173677 ) ) ( not ( = ?auto_173675 ?auto_173678 ) ) ( not ( = ?auto_173676 ?auto_173677 ) ) ( not ( = ?auto_173676 ?auto_173678 ) ) ( not ( = ?auto_173677 ?auto_173678 ) ) ( ON ?auto_173678 ?auto_173679 ) ( not ( = ?auto_173674 ?auto_173679 ) ) ( not ( = ?auto_173675 ?auto_173679 ) ) ( not ( = ?auto_173676 ?auto_173679 ) ) ( not ( = ?auto_173677 ?auto_173679 ) ) ( not ( = ?auto_173678 ?auto_173679 ) ) ( ON ?auto_173677 ?auto_173678 ) ( ON-TABLE ?auto_173680 ) ( ON ?auto_173681 ?auto_173680 ) ( ON ?auto_173679 ?auto_173681 ) ( not ( = ?auto_173680 ?auto_173681 ) ) ( not ( = ?auto_173680 ?auto_173679 ) ) ( not ( = ?auto_173680 ?auto_173678 ) ) ( not ( = ?auto_173680 ?auto_173677 ) ) ( not ( = ?auto_173681 ?auto_173679 ) ) ( not ( = ?auto_173681 ?auto_173678 ) ) ( not ( = ?auto_173681 ?auto_173677 ) ) ( not ( = ?auto_173674 ?auto_173680 ) ) ( not ( = ?auto_173674 ?auto_173681 ) ) ( not ( = ?auto_173675 ?auto_173680 ) ) ( not ( = ?auto_173675 ?auto_173681 ) ) ( not ( = ?auto_173676 ?auto_173680 ) ) ( not ( = ?auto_173676 ?auto_173681 ) ) ( ON ?auto_173676 ?auto_173677 ) ( ON ?auto_173675 ?auto_173676 ) ( CLEAR ?auto_173675 ) ( HOLDING ?auto_173674 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173674 )
      ( MAKE-5PILE ?auto_173674 ?auto_173675 ?auto_173676 ?auto_173677 ?auto_173678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173682 - BLOCK
      ?auto_173683 - BLOCK
      ?auto_173684 - BLOCK
      ?auto_173685 - BLOCK
      ?auto_173686 - BLOCK
    )
    :vars
    (
      ?auto_173688 - BLOCK
      ?auto_173687 - BLOCK
      ?auto_173689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173682 ?auto_173683 ) ) ( not ( = ?auto_173682 ?auto_173684 ) ) ( not ( = ?auto_173682 ?auto_173685 ) ) ( not ( = ?auto_173682 ?auto_173686 ) ) ( not ( = ?auto_173683 ?auto_173684 ) ) ( not ( = ?auto_173683 ?auto_173685 ) ) ( not ( = ?auto_173683 ?auto_173686 ) ) ( not ( = ?auto_173684 ?auto_173685 ) ) ( not ( = ?auto_173684 ?auto_173686 ) ) ( not ( = ?auto_173685 ?auto_173686 ) ) ( ON ?auto_173686 ?auto_173688 ) ( not ( = ?auto_173682 ?auto_173688 ) ) ( not ( = ?auto_173683 ?auto_173688 ) ) ( not ( = ?auto_173684 ?auto_173688 ) ) ( not ( = ?auto_173685 ?auto_173688 ) ) ( not ( = ?auto_173686 ?auto_173688 ) ) ( ON ?auto_173685 ?auto_173686 ) ( ON-TABLE ?auto_173687 ) ( ON ?auto_173689 ?auto_173687 ) ( ON ?auto_173688 ?auto_173689 ) ( not ( = ?auto_173687 ?auto_173689 ) ) ( not ( = ?auto_173687 ?auto_173688 ) ) ( not ( = ?auto_173687 ?auto_173686 ) ) ( not ( = ?auto_173687 ?auto_173685 ) ) ( not ( = ?auto_173689 ?auto_173688 ) ) ( not ( = ?auto_173689 ?auto_173686 ) ) ( not ( = ?auto_173689 ?auto_173685 ) ) ( not ( = ?auto_173682 ?auto_173687 ) ) ( not ( = ?auto_173682 ?auto_173689 ) ) ( not ( = ?auto_173683 ?auto_173687 ) ) ( not ( = ?auto_173683 ?auto_173689 ) ) ( not ( = ?auto_173684 ?auto_173687 ) ) ( not ( = ?auto_173684 ?auto_173689 ) ) ( ON ?auto_173684 ?auto_173685 ) ( ON ?auto_173683 ?auto_173684 ) ( ON ?auto_173682 ?auto_173683 ) ( CLEAR ?auto_173682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173687 ?auto_173689 ?auto_173688 ?auto_173686 ?auto_173685 ?auto_173684 ?auto_173683 )
      ( MAKE-5PILE ?auto_173682 ?auto_173683 ?auto_173684 ?auto_173685 ?auto_173686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173690 - BLOCK
      ?auto_173691 - BLOCK
      ?auto_173692 - BLOCK
      ?auto_173693 - BLOCK
      ?auto_173694 - BLOCK
    )
    :vars
    (
      ?auto_173695 - BLOCK
      ?auto_173696 - BLOCK
      ?auto_173697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173690 ?auto_173691 ) ) ( not ( = ?auto_173690 ?auto_173692 ) ) ( not ( = ?auto_173690 ?auto_173693 ) ) ( not ( = ?auto_173690 ?auto_173694 ) ) ( not ( = ?auto_173691 ?auto_173692 ) ) ( not ( = ?auto_173691 ?auto_173693 ) ) ( not ( = ?auto_173691 ?auto_173694 ) ) ( not ( = ?auto_173692 ?auto_173693 ) ) ( not ( = ?auto_173692 ?auto_173694 ) ) ( not ( = ?auto_173693 ?auto_173694 ) ) ( ON ?auto_173694 ?auto_173695 ) ( not ( = ?auto_173690 ?auto_173695 ) ) ( not ( = ?auto_173691 ?auto_173695 ) ) ( not ( = ?auto_173692 ?auto_173695 ) ) ( not ( = ?auto_173693 ?auto_173695 ) ) ( not ( = ?auto_173694 ?auto_173695 ) ) ( ON ?auto_173693 ?auto_173694 ) ( ON-TABLE ?auto_173696 ) ( ON ?auto_173697 ?auto_173696 ) ( ON ?auto_173695 ?auto_173697 ) ( not ( = ?auto_173696 ?auto_173697 ) ) ( not ( = ?auto_173696 ?auto_173695 ) ) ( not ( = ?auto_173696 ?auto_173694 ) ) ( not ( = ?auto_173696 ?auto_173693 ) ) ( not ( = ?auto_173697 ?auto_173695 ) ) ( not ( = ?auto_173697 ?auto_173694 ) ) ( not ( = ?auto_173697 ?auto_173693 ) ) ( not ( = ?auto_173690 ?auto_173696 ) ) ( not ( = ?auto_173690 ?auto_173697 ) ) ( not ( = ?auto_173691 ?auto_173696 ) ) ( not ( = ?auto_173691 ?auto_173697 ) ) ( not ( = ?auto_173692 ?auto_173696 ) ) ( not ( = ?auto_173692 ?auto_173697 ) ) ( ON ?auto_173692 ?auto_173693 ) ( ON ?auto_173691 ?auto_173692 ) ( HOLDING ?auto_173690 ) ( CLEAR ?auto_173691 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173696 ?auto_173697 ?auto_173695 ?auto_173694 ?auto_173693 ?auto_173692 ?auto_173691 ?auto_173690 )
      ( MAKE-5PILE ?auto_173690 ?auto_173691 ?auto_173692 ?auto_173693 ?auto_173694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173698 - BLOCK
      ?auto_173699 - BLOCK
      ?auto_173700 - BLOCK
      ?auto_173701 - BLOCK
      ?auto_173702 - BLOCK
    )
    :vars
    (
      ?auto_173703 - BLOCK
      ?auto_173705 - BLOCK
      ?auto_173704 - BLOCK
      ?auto_173706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173698 ?auto_173699 ) ) ( not ( = ?auto_173698 ?auto_173700 ) ) ( not ( = ?auto_173698 ?auto_173701 ) ) ( not ( = ?auto_173698 ?auto_173702 ) ) ( not ( = ?auto_173699 ?auto_173700 ) ) ( not ( = ?auto_173699 ?auto_173701 ) ) ( not ( = ?auto_173699 ?auto_173702 ) ) ( not ( = ?auto_173700 ?auto_173701 ) ) ( not ( = ?auto_173700 ?auto_173702 ) ) ( not ( = ?auto_173701 ?auto_173702 ) ) ( ON ?auto_173702 ?auto_173703 ) ( not ( = ?auto_173698 ?auto_173703 ) ) ( not ( = ?auto_173699 ?auto_173703 ) ) ( not ( = ?auto_173700 ?auto_173703 ) ) ( not ( = ?auto_173701 ?auto_173703 ) ) ( not ( = ?auto_173702 ?auto_173703 ) ) ( ON ?auto_173701 ?auto_173702 ) ( ON-TABLE ?auto_173705 ) ( ON ?auto_173704 ?auto_173705 ) ( ON ?auto_173703 ?auto_173704 ) ( not ( = ?auto_173705 ?auto_173704 ) ) ( not ( = ?auto_173705 ?auto_173703 ) ) ( not ( = ?auto_173705 ?auto_173702 ) ) ( not ( = ?auto_173705 ?auto_173701 ) ) ( not ( = ?auto_173704 ?auto_173703 ) ) ( not ( = ?auto_173704 ?auto_173702 ) ) ( not ( = ?auto_173704 ?auto_173701 ) ) ( not ( = ?auto_173698 ?auto_173705 ) ) ( not ( = ?auto_173698 ?auto_173704 ) ) ( not ( = ?auto_173699 ?auto_173705 ) ) ( not ( = ?auto_173699 ?auto_173704 ) ) ( not ( = ?auto_173700 ?auto_173705 ) ) ( not ( = ?auto_173700 ?auto_173704 ) ) ( ON ?auto_173700 ?auto_173701 ) ( ON ?auto_173699 ?auto_173700 ) ( CLEAR ?auto_173699 ) ( ON ?auto_173698 ?auto_173706 ) ( CLEAR ?auto_173698 ) ( HAND-EMPTY ) ( not ( = ?auto_173698 ?auto_173706 ) ) ( not ( = ?auto_173699 ?auto_173706 ) ) ( not ( = ?auto_173700 ?auto_173706 ) ) ( not ( = ?auto_173701 ?auto_173706 ) ) ( not ( = ?auto_173702 ?auto_173706 ) ) ( not ( = ?auto_173703 ?auto_173706 ) ) ( not ( = ?auto_173705 ?auto_173706 ) ) ( not ( = ?auto_173704 ?auto_173706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173698 ?auto_173706 )
      ( MAKE-5PILE ?auto_173698 ?auto_173699 ?auto_173700 ?auto_173701 ?auto_173702 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173707 - BLOCK
      ?auto_173708 - BLOCK
      ?auto_173709 - BLOCK
      ?auto_173710 - BLOCK
      ?auto_173711 - BLOCK
    )
    :vars
    (
      ?auto_173714 - BLOCK
      ?auto_173715 - BLOCK
      ?auto_173713 - BLOCK
      ?auto_173712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173707 ?auto_173708 ) ) ( not ( = ?auto_173707 ?auto_173709 ) ) ( not ( = ?auto_173707 ?auto_173710 ) ) ( not ( = ?auto_173707 ?auto_173711 ) ) ( not ( = ?auto_173708 ?auto_173709 ) ) ( not ( = ?auto_173708 ?auto_173710 ) ) ( not ( = ?auto_173708 ?auto_173711 ) ) ( not ( = ?auto_173709 ?auto_173710 ) ) ( not ( = ?auto_173709 ?auto_173711 ) ) ( not ( = ?auto_173710 ?auto_173711 ) ) ( ON ?auto_173711 ?auto_173714 ) ( not ( = ?auto_173707 ?auto_173714 ) ) ( not ( = ?auto_173708 ?auto_173714 ) ) ( not ( = ?auto_173709 ?auto_173714 ) ) ( not ( = ?auto_173710 ?auto_173714 ) ) ( not ( = ?auto_173711 ?auto_173714 ) ) ( ON ?auto_173710 ?auto_173711 ) ( ON-TABLE ?auto_173715 ) ( ON ?auto_173713 ?auto_173715 ) ( ON ?auto_173714 ?auto_173713 ) ( not ( = ?auto_173715 ?auto_173713 ) ) ( not ( = ?auto_173715 ?auto_173714 ) ) ( not ( = ?auto_173715 ?auto_173711 ) ) ( not ( = ?auto_173715 ?auto_173710 ) ) ( not ( = ?auto_173713 ?auto_173714 ) ) ( not ( = ?auto_173713 ?auto_173711 ) ) ( not ( = ?auto_173713 ?auto_173710 ) ) ( not ( = ?auto_173707 ?auto_173715 ) ) ( not ( = ?auto_173707 ?auto_173713 ) ) ( not ( = ?auto_173708 ?auto_173715 ) ) ( not ( = ?auto_173708 ?auto_173713 ) ) ( not ( = ?auto_173709 ?auto_173715 ) ) ( not ( = ?auto_173709 ?auto_173713 ) ) ( ON ?auto_173709 ?auto_173710 ) ( ON ?auto_173707 ?auto_173712 ) ( CLEAR ?auto_173707 ) ( not ( = ?auto_173707 ?auto_173712 ) ) ( not ( = ?auto_173708 ?auto_173712 ) ) ( not ( = ?auto_173709 ?auto_173712 ) ) ( not ( = ?auto_173710 ?auto_173712 ) ) ( not ( = ?auto_173711 ?auto_173712 ) ) ( not ( = ?auto_173714 ?auto_173712 ) ) ( not ( = ?auto_173715 ?auto_173712 ) ) ( not ( = ?auto_173713 ?auto_173712 ) ) ( HOLDING ?auto_173708 ) ( CLEAR ?auto_173709 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173715 ?auto_173713 ?auto_173714 ?auto_173711 ?auto_173710 ?auto_173709 ?auto_173708 )
      ( MAKE-5PILE ?auto_173707 ?auto_173708 ?auto_173709 ?auto_173710 ?auto_173711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173716 - BLOCK
      ?auto_173717 - BLOCK
      ?auto_173718 - BLOCK
      ?auto_173719 - BLOCK
      ?auto_173720 - BLOCK
    )
    :vars
    (
      ?auto_173722 - BLOCK
      ?auto_173721 - BLOCK
      ?auto_173723 - BLOCK
      ?auto_173724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173716 ?auto_173717 ) ) ( not ( = ?auto_173716 ?auto_173718 ) ) ( not ( = ?auto_173716 ?auto_173719 ) ) ( not ( = ?auto_173716 ?auto_173720 ) ) ( not ( = ?auto_173717 ?auto_173718 ) ) ( not ( = ?auto_173717 ?auto_173719 ) ) ( not ( = ?auto_173717 ?auto_173720 ) ) ( not ( = ?auto_173718 ?auto_173719 ) ) ( not ( = ?auto_173718 ?auto_173720 ) ) ( not ( = ?auto_173719 ?auto_173720 ) ) ( ON ?auto_173720 ?auto_173722 ) ( not ( = ?auto_173716 ?auto_173722 ) ) ( not ( = ?auto_173717 ?auto_173722 ) ) ( not ( = ?auto_173718 ?auto_173722 ) ) ( not ( = ?auto_173719 ?auto_173722 ) ) ( not ( = ?auto_173720 ?auto_173722 ) ) ( ON ?auto_173719 ?auto_173720 ) ( ON-TABLE ?auto_173721 ) ( ON ?auto_173723 ?auto_173721 ) ( ON ?auto_173722 ?auto_173723 ) ( not ( = ?auto_173721 ?auto_173723 ) ) ( not ( = ?auto_173721 ?auto_173722 ) ) ( not ( = ?auto_173721 ?auto_173720 ) ) ( not ( = ?auto_173721 ?auto_173719 ) ) ( not ( = ?auto_173723 ?auto_173722 ) ) ( not ( = ?auto_173723 ?auto_173720 ) ) ( not ( = ?auto_173723 ?auto_173719 ) ) ( not ( = ?auto_173716 ?auto_173721 ) ) ( not ( = ?auto_173716 ?auto_173723 ) ) ( not ( = ?auto_173717 ?auto_173721 ) ) ( not ( = ?auto_173717 ?auto_173723 ) ) ( not ( = ?auto_173718 ?auto_173721 ) ) ( not ( = ?auto_173718 ?auto_173723 ) ) ( ON ?auto_173718 ?auto_173719 ) ( ON ?auto_173716 ?auto_173724 ) ( not ( = ?auto_173716 ?auto_173724 ) ) ( not ( = ?auto_173717 ?auto_173724 ) ) ( not ( = ?auto_173718 ?auto_173724 ) ) ( not ( = ?auto_173719 ?auto_173724 ) ) ( not ( = ?auto_173720 ?auto_173724 ) ) ( not ( = ?auto_173722 ?auto_173724 ) ) ( not ( = ?auto_173721 ?auto_173724 ) ) ( not ( = ?auto_173723 ?auto_173724 ) ) ( CLEAR ?auto_173718 ) ( ON ?auto_173717 ?auto_173716 ) ( CLEAR ?auto_173717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173724 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173724 ?auto_173716 )
      ( MAKE-5PILE ?auto_173716 ?auto_173717 ?auto_173718 ?auto_173719 ?auto_173720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173725 - BLOCK
      ?auto_173726 - BLOCK
      ?auto_173727 - BLOCK
      ?auto_173728 - BLOCK
      ?auto_173729 - BLOCK
    )
    :vars
    (
      ?auto_173731 - BLOCK
      ?auto_173732 - BLOCK
      ?auto_173730 - BLOCK
      ?auto_173733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173725 ?auto_173726 ) ) ( not ( = ?auto_173725 ?auto_173727 ) ) ( not ( = ?auto_173725 ?auto_173728 ) ) ( not ( = ?auto_173725 ?auto_173729 ) ) ( not ( = ?auto_173726 ?auto_173727 ) ) ( not ( = ?auto_173726 ?auto_173728 ) ) ( not ( = ?auto_173726 ?auto_173729 ) ) ( not ( = ?auto_173727 ?auto_173728 ) ) ( not ( = ?auto_173727 ?auto_173729 ) ) ( not ( = ?auto_173728 ?auto_173729 ) ) ( ON ?auto_173729 ?auto_173731 ) ( not ( = ?auto_173725 ?auto_173731 ) ) ( not ( = ?auto_173726 ?auto_173731 ) ) ( not ( = ?auto_173727 ?auto_173731 ) ) ( not ( = ?auto_173728 ?auto_173731 ) ) ( not ( = ?auto_173729 ?auto_173731 ) ) ( ON ?auto_173728 ?auto_173729 ) ( ON-TABLE ?auto_173732 ) ( ON ?auto_173730 ?auto_173732 ) ( ON ?auto_173731 ?auto_173730 ) ( not ( = ?auto_173732 ?auto_173730 ) ) ( not ( = ?auto_173732 ?auto_173731 ) ) ( not ( = ?auto_173732 ?auto_173729 ) ) ( not ( = ?auto_173732 ?auto_173728 ) ) ( not ( = ?auto_173730 ?auto_173731 ) ) ( not ( = ?auto_173730 ?auto_173729 ) ) ( not ( = ?auto_173730 ?auto_173728 ) ) ( not ( = ?auto_173725 ?auto_173732 ) ) ( not ( = ?auto_173725 ?auto_173730 ) ) ( not ( = ?auto_173726 ?auto_173732 ) ) ( not ( = ?auto_173726 ?auto_173730 ) ) ( not ( = ?auto_173727 ?auto_173732 ) ) ( not ( = ?auto_173727 ?auto_173730 ) ) ( ON ?auto_173725 ?auto_173733 ) ( not ( = ?auto_173725 ?auto_173733 ) ) ( not ( = ?auto_173726 ?auto_173733 ) ) ( not ( = ?auto_173727 ?auto_173733 ) ) ( not ( = ?auto_173728 ?auto_173733 ) ) ( not ( = ?auto_173729 ?auto_173733 ) ) ( not ( = ?auto_173731 ?auto_173733 ) ) ( not ( = ?auto_173732 ?auto_173733 ) ) ( not ( = ?auto_173730 ?auto_173733 ) ) ( ON ?auto_173726 ?auto_173725 ) ( CLEAR ?auto_173726 ) ( ON-TABLE ?auto_173733 ) ( HOLDING ?auto_173727 ) ( CLEAR ?auto_173728 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173732 ?auto_173730 ?auto_173731 ?auto_173729 ?auto_173728 ?auto_173727 )
      ( MAKE-5PILE ?auto_173725 ?auto_173726 ?auto_173727 ?auto_173728 ?auto_173729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173734 - BLOCK
      ?auto_173735 - BLOCK
      ?auto_173736 - BLOCK
      ?auto_173737 - BLOCK
      ?auto_173738 - BLOCK
    )
    :vars
    (
      ?auto_173741 - BLOCK
      ?auto_173742 - BLOCK
      ?auto_173739 - BLOCK
      ?auto_173740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173734 ?auto_173735 ) ) ( not ( = ?auto_173734 ?auto_173736 ) ) ( not ( = ?auto_173734 ?auto_173737 ) ) ( not ( = ?auto_173734 ?auto_173738 ) ) ( not ( = ?auto_173735 ?auto_173736 ) ) ( not ( = ?auto_173735 ?auto_173737 ) ) ( not ( = ?auto_173735 ?auto_173738 ) ) ( not ( = ?auto_173736 ?auto_173737 ) ) ( not ( = ?auto_173736 ?auto_173738 ) ) ( not ( = ?auto_173737 ?auto_173738 ) ) ( ON ?auto_173738 ?auto_173741 ) ( not ( = ?auto_173734 ?auto_173741 ) ) ( not ( = ?auto_173735 ?auto_173741 ) ) ( not ( = ?auto_173736 ?auto_173741 ) ) ( not ( = ?auto_173737 ?auto_173741 ) ) ( not ( = ?auto_173738 ?auto_173741 ) ) ( ON ?auto_173737 ?auto_173738 ) ( ON-TABLE ?auto_173742 ) ( ON ?auto_173739 ?auto_173742 ) ( ON ?auto_173741 ?auto_173739 ) ( not ( = ?auto_173742 ?auto_173739 ) ) ( not ( = ?auto_173742 ?auto_173741 ) ) ( not ( = ?auto_173742 ?auto_173738 ) ) ( not ( = ?auto_173742 ?auto_173737 ) ) ( not ( = ?auto_173739 ?auto_173741 ) ) ( not ( = ?auto_173739 ?auto_173738 ) ) ( not ( = ?auto_173739 ?auto_173737 ) ) ( not ( = ?auto_173734 ?auto_173742 ) ) ( not ( = ?auto_173734 ?auto_173739 ) ) ( not ( = ?auto_173735 ?auto_173742 ) ) ( not ( = ?auto_173735 ?auto_173739 ) ) ( not ( = ?auto_173736 ?auto_173742 ) ) ( not ( = ?auto_173736 ?auto_173739 ) ) ( ON ?auto_173734 ?auto_173740 ) ( not ( = ?auto_173734 ?auto_173740 ) ) ( not ( = ?auto_173735 ?auto_173740 ) ) ( not ( = ?auto_173736 ?auto_173740 ) ) ( not ( = ?auto_173737 ?auto_173740 ) ) ( not ( = ?auto_173738 ?auto_173740 ) ) ( not ( = ?auto_173741 ?auto_173740 ) ) ( not ( = ?auto_173742 ?auto_173740 ) ) ( not ( = ?auto_173739 ?auto_173740 ) ) ( ON ?auto_173735 ?auto_173734 ) ( ON-TABLE ?auto_173740 ) ( CLEAR ?auto_173737 ) ( ON ?auto_173736 ?auto_173735 ) ( CLEAR ?auto_173736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173740 ?auto_173734 ?auto_173735 )
      ( MAKE-5PILE ?auto_173734 ?auto_173735 ?auto_173736 ?auto_173737 ?auto_173738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173743 - BLOCK
      ?auto_173744 - BLOCK
      ?auto_173745 - BLOCK
      ?auto_173746 - BLOCK
      ?auto_173747 - BLOCK
    )
    :vars
    (
      ?auto_173749 - BLOCK
      ?auto_173748 - BLOCK
      ?auto_173751 - BLOCK
      ?auto_173750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173743 ?auto_173744 ) ) ( not ( = ?auto_173743 ?auto_173745 ) ) ( not ( = ?auto_173743 ?auto_173746 ) ) ( not ( = ?auto_173743 ?auto_173747 ) ) ( not ( = ?auto_173744 ?auto_173745 ) ) ( not ( = ?auto_173744 ?auto_173746 ) ) ( not ( = ?auto_173744 ?auto_173747 ) ) ( not ( = ?auto_173745 ?auto_173746 ) ) ( not ( = ?auto_173745 ?auto_173747 ) ) ( not ( = ?auto_173746 ?auto_173747 ) ) ( ON ?auto_173747 ?auto_173749 ) ( not ( = ?auto_173743 ?auto_173749 ) ) ( not ( = ?auto_173744 ?auto_173749 ) ) ( not ( = ?auto_173745 ?auto_173749 ) ) ( not ( = ?auto_173746 ?auto_173749 ) ) ( not ( = ?auto_173747 ?auto_173749 ) ) ( ON-TABLE ?auto_173748 ) ( ON ?auto_173751 ?auto_173748 ) ( ON ?auto_173749 ?auto_173751 ) ( not ( = ?auto_173748 ?auto_173751 ) ) ( not ( = ?auto_173748 ?auto_173749 ) ) ( not ( = ?auto_173748 ?auto_173747 ) ) ( not ( = ?auto_173748 ?auto_173746 ) ) ( not ( = ?auto_173751 ?auto_173749 ) ) ( not ( = ?auto_173751 ?auto_173747 ) ) ( not ( = ?auto_173751 ?auto_173746 ) ) ( not ( = ?auto_173743 ?auto_173748 ) ) ( not ( = ?auto_173743 ?auto_173751 ) ) ( not ( = ?auto_173744 ?auto_173748 ) ) ( not ( = ?auto_173744 ?auto_173751 ) ) ( not ( = ?auto_173745 ?auto_173748 ) ) ( not ( = ?auto_173745 ?auto_173751 ) ) ( ON ?auto_173743 ?auto_173750 ) ( not ( = ?auto_173743 ?auto_173750 ) ) ( not ( = ?auto_173744 ?auto_173750 ) ) ( not ( = ?auto_173745 ?auto_173750 ) ) ( not ( = ?auto_173746 ?auto_173750 ) ) ( not ( = ?auto_173747 ?auto_173750 ) ) ( not ( = ?auto_173749 ?auto_173750 ) ) ( not ( = ?auto_173748 ?auto_173750 ) ) ( not ( = ?auto_173751 ?auto_173750 ) ) ( ON ?auto_173744 ?auto_173743 ) ( ON-TABLE ?auto_173750 ) ( ON ?auto_173745 ?auto_173744 ) ( CLEAR ?auto_173745 ) ( HOLDING ?auto_173746 ) ( CLEAR ?auto_173747 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173748 ?auto_173751 ?auto_173749 ?auto_173747 ?auto_173746 )
      ( MAKE-5PILE ?auto_173743 ?auto_173744 ?auto_173745 ?auto_173746 ?auto_173747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173752 - BLOCK
      ?auto_173753 - BLOCK
      ?auto_173754 - BLOCK
      ?auto_173755 - BLOCK
      ?auto_173756 - BLOCK
    )
    :vars
    (
      ?auto_173759 - BLOCK
      ?auto_173758 - BLOCK
      ?auto_173760 - BLOCK
      ?auto_173757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173752 ?auto_173753 ) ) ( not ( = ?auto_173752 ?auto_173754 ) ) ( not ( = ?auto_173752 ?auto_173755 ) ) ( not ( = ?auto_173752 ?auto_173756 ) ) ( not ( = ?auto_173753 ?auto_173754 ) ) ( not ( = ?auto_173753 ?auto_173755 ) ) ( not ( = ?auto_173753 ?auto_173756 ) ) ( not ( = ?auto_173754 ?auto_173755 ) ) ( not ( = ?auto_173754 ?auto_173756 ) ) ( not ( = ?auto_173755 ?auto_173756 ) ) ( ON ?auto_173756 ?auto_173759 ) ( not ( = ?auto_173752 ?auto_173759 ) ) ( not ( = ?auto_173753 ?auto_173759 ) ) ( not ( = ?auto_173754 ?auto_173759 ) ) ( not ( = ?auto_173755 ?auto_173759 ) ) ( not ( = ?auto_173756 ?auto_173759 ) ) ( ON-TABLE ?auto_173758 ) ( ON ?auto_173760 ?auto_173758 ) ( ON ?auto_173759 ?auto_173760 ) ( not ( = ?auto_173758 ?auto_173760 ) ) ( not ( = ?auto_173758 ?auto_173759 ) ) ( not ( = ?auto_173758 ?auto_173756 ) ) ( not ( = ?auto_173758 ?auto_173755 ) ) ( not ( = ?auto_173760 ?auto_173759 ) ) ( not ( = ?auto_173760 ?auto_173756 ) ) ( not ( = ?auto_173760 ?auto_173755 ) ) ( not ( = ?auto_173752 ?auto_173758 ) ) ( not ( = ?auto_173752 ?auto_173760 ) ) ( not ( = ?auto_173753 ?auto_173758 ) ) ( not ( = ?auto_173753 ?auto_173760 ) ) ( not ( = ?auto_173754 ?auto_173758 ) ) ( not ( = ?auto_173754 ?auto_173760 ) ) ( ON ?auto_173752 ?auto_173757 ) ( not ( = ?auto_173752 ?auto_173757 ) ) ( not ( = ?auto_173753 ?auto_173757 ) ) ( not ( = ?auto_173754 ?auto_173757 ) ) ( not ( = ?auto_173755 ?auto_173757 ) ) ( not ( = ?auto_173756 ?auto_173757 ) ) ( not ( = ?auto_173759 ?auto_173757 ) ) ( not ( = ?auto_173758 ?auto_173757 ) ) ( not ( = ?auto_173760 ?auto_173757 ) ) ( ON ?auto_173753 ?auto_173752 ) ( ON-TABLE ?auto_173757 ) ( ON ?auto_173754 ?auto_173753 ) ( CLEAR ?auto_173756 ) ( ON ?auto_173755 ?auto_173754 ) ( CLEAR ?auto_173755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173757 ?auto_173752 ?auto_173753 ?auto_173754 )
      ( MAKE-5PILE ?auto_173752 ?auto_173753 ?auto_173754 ?auto_173755 ?auto_173756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173761 - BLOCK
      ?auto_173762 - BLOCK
      ?auto_173763 - BLOCK
      ?auto_173764 - BLOCK
      ?auto_173765 - BLOCK
    )
    :vars
    (
      ?auto_173766 - BLOCK
      ?auto_173769 - BLOCK
      ?auto_173767 - BLOCK
      ?auto_173768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173761 ?auto_173762 ) ) ( not ( = ?auto_173761 ?auto_173763 ) ) ( not ( = ?auto_173761 ?auto_173764 ) ) ( not ( = ?auto_173761 ?auto_173765 ) ) ( not ( = ?auto_173762 ?auto_173763 ) ) ( not ( = ?auto_173762 ?auto_173764 ) ) ( not ( = ?auto_173762 ?auto_173765 ) ) ( not ( = ?auto_173763 ?auto_173764 ) ) ( not ( = ?auto_173763 ?auto_173765 ) ) ( not ( = ?auto_173764 ?auto_173765 ) ) ( not ( = ?auto_173761 ?auto_173766 ) ) ( not ( = ?auto_173762 ?auto_173766 ) ) ( not ( = ?auto_173763 ?auto_173766 ) ) ( not ( = ?auto_173764 ?auto_173766 ) ) ( not ( = ?auto_173765 ?auto_173766 ) ) ( ON-TABLE ?auto_173769 ) ( ON ?auto_173767 ?auto_173769 ) ( ON ?auto_173766 ?auto_173767 ) ( not ( = ?auto_173769 ?auto_173767 ) ) ( not ( = ?auto_173769 ?auto_173766 ) ) ( not ( = ?auto_173769 ?auto_173765 ) ) ( not ( = ?auto_173769 ?auto_173764 ) ) ( not ( = ?auto_173767 ?auto_173766 ) ) ( not ( = ?auto_173767 ?auto_173765 ) ) ( not ( = ?auto_173767 ?auto_173764 ) ) ( not ( = ?auto_173761 ?auto_173769 ) ) ( not ( = ?auto_173761 ?auto_173767 ) ) ( not ( = ?auto_173762 ?auto_173769 ) ) ( not ( = ?auto_173762 ?auto_173767 ) ) ( not ( = ?auto_173763 ?auto_173769 ) ) ( not ( = ?auto_173763 ?auto_173767 ) ) ( ON ?auto_173761 ?auto_173768 ) ( not ( = ?auto_173761 ?auto_173768 ) ) ( not ( = ?auto_173762 ?auto_173768 ) ) ( not ( = ?auto_173763 ?auto_173768 ) ) ( not ( = ?auto_173764 ?auto_173768 ) ) ( not ( = ?auto_173765 ?auto_173768 ) ) ( not ( = ?auto_173766 ?auto_173768 ) ) ( not ( = ?auto_173769 ?auto_173768 ) ) ( not ( = ?auto_173767 ?auto_173768 ) ) ( ON ?auto_173762 ?auto_173761 ) ( ON-TABLE ?auto_173768 ) ( ON ?auto_173763 ?auto_173762 ) ( ON ?auto_173764 ?auto_173763 ) ( CLEAR ?auto_173764 ) ( HOLDING ?auto_173765 ) ( CLEAR ?auto_173766 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173769 ?auto_173767 ?auto_173766 ?auto_173765 )
      ( MAKE-5PILE ?auto_173761 ?auto_173762 ?auto_173763 ?auto_173764 ?auto_173765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173770 - BLOCK
      ?auto_173771 - BLOCK
      ?auto_173772 - BLOCK
      ?auto_173773 - BLOCK
      ?auto_173774 - BLOCK
    )
    :vars
    (
      ?auto_173777 - BLOCK
      ?auto_173776 - BLOCK
      ?auto_173775 - BLOCK
      ?auto_173778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173770 ?auto_173771 ) ) ( not ( = ?auto_173770 ?auto_173772 ) ) ( not ( = ?auto_173770 ?auto_173773 ) ) ( not ( = ?auto_173770 ?auto_173774 ) ) ( not ( = ?auto_173771 ?auto_173772 ) ) ( not ( = ?auto_173771 ?auto_173773 ) ) ( not ( = ?auto_173771 ?auto_173774 ) ) ( not ( = ?auto_173772 ?auto_173773 ) ) ( not ( = ?auto_173772 ?auto_173774 ) ) ( not ( = ?auto_173773 ?auto_173774 ) ) ( not ( = ?auto_173770 ?auto_173777 ) ) ( not ( = ?auto_173771 ?auto_173777 ) ) ( not ( = ?auto_173772 ?auto_173777 ) ) ( not ( = ?auto_173773 ?auto_173777 ) ) ( not ( = ?auto_173774 ?auto_173777 ) ) ( ON-TABLE ?auto_173776 ) ( ON ?auto_173775 ?auto_173776 ) ( ON ?auto_173777 ?auto_173775 ) ( not ( = ?auto_173776 ?auto_173775 ) ) ( not ( = ?auto_173776 ?auto_173777 ) ) ( not ( = ?auto_173776 ?auto_173774 ) ) ( not ( = ?auto_173776 ?auto_173773 ) ) ( not ( = ?auto_173775 ?auto_173777 ) ) ( not ( = ?auto_173775 ?auto_173774 ) ) ( not ( = ?auto_173775 ?auto_173773 ) ) ( not ( = ?auto_173770 ?auto_173776 ) ) ( not ( = ?auto_173770 ?auto_173775 ) ) ( not ( = ?auto_173771 ?auto_173776 ) ) ( not ( = ?auto_173771 ?auto_173775 ) ) ( not ( = ?auto_173772 ?auto_173776 ) ) ( not ( = ?auto_173772 ?auto_173775 ) ) ( ON ?auto_173770 ?auto_173778 ) ( not ( = ?auto_173770 ?auto_173778 ) ) ( not ( = ?auto_173771 ?auto_173778 ) ) ( not ( = ?auto_173772 ?auto_173778 ) ) ( not ( = ?auto_173773 ?auto_173778 ) ) ( not ( = ?auto_173774 ?auto_173778 ) ) ( not ( = ?auto_173777 ?auto_173778 ) ) ( not ( = ?auto_173776 ?auto_173778 ) ) ( not ( = ?auto_173775 ?auto_173778 ) ) ( ON ?auto_173771 ?auto_173770 ) ( ON-TABLE ?auto_173778 ) ( ON ?auto_173772 ?auto_173771 ) ( ON ?auto_173773 ?auto_173772 ) ( CLEAR ?auto_173777 ) ( ON ?auto_173774 ?auto_173773 ) ( CLEAR ?auto_173774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173778 ?auto_173770 ?auto_173771 ?auto_173772 ?auto_173773 )
      ( MAKE-5PILE ?auto_173770 ?auto_173771 ?auto_173772 ?auto_173773 ?auto_173774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173779 - BLOCK
      ?auto_173780 - BLOCK
      ?auto_173781 - BLOCK
      ?auto_173782 - BLOCK
      ?auto_173783 - BLOCK
    )
    :vars
    (
      ?auto_173786 - BLOCK
      ?auto_173784 - BLOCK
      ?auto_173785 - BLOCK
      ?auto_173787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173779 ?auto_173780 ) ) ( not ( = ?auto_173779 ?auto_173781 ) ) ( not ( = ?auto_173779 ?auto_173782 ) ) ( not ( = ?auto_173779 ?auto_173783 ) ) ( not ( = ?auto_173780 ?auto_173781 ) ) ( not ( = ?auto_173780 ?auto_173782 ) ) ( not ( = ?auto_173780 ?auto_173783 ) ) ( not ( = ?auto_173781 ?auto_173782 ) ) ( not ( = ?auto_173781 ?auto_173783 ) ) ( not ( = ?auto_173782 ?auto_173783 ) ) ( not ( = ?auto_173779 ?auto_173786 ) ) ( not ( = ?auto_173780 ?auto_173786 ) ) ( not ( = ?auto_173781 ?auto_173786 ) ) ( not ( = ?auto_173782 ?auto_173786 ) ) ( not ( = ?auto_173783 ?auto_173786 ) ) ( ON-TABLE ?auto_173784 ) ( ON ?auto_173785 ?auto_173784 ) ( not ( = ?auto_173784 ?auto_173785 ) ) ( not ( = ?auto_173784 ?auto_173786 ) ) ( not ( = ?auto_173784 ?auto_173783 ) ) ( not ( = ?auto_173784 ?auto_173782 ) ) ( not ( = ?auto_173785 ?auto_173786 ) ) ( not ( = ?auto_173785 ?auto_173783 ) ) ( not ( = ?auto_173785 ?auto_173782 ) ) ( not ( = ?auto_173779 ?auto_173784 ) ) ( not ( = ?auto_173779 ?auto_173785 ) ) ( not ( = ?auto_173780 ?auto_173784 ) ) ( not ( = ?auto_173780 ?auto_173785 ) ) ( not ( = ?auto_173781 ?auto_173784 ) ) ( not ( = ?auto_173781 ?auto_173785 ) ) ( ON ?auto_173779 ?auto_173787 ) ( not ( = ?auto_173779 ?auto_173787 ) ) ( not ( = ?auto_173780 ?auto_173787 ) ) ( not ( = ?auto_173781 ?auto_173787 ) ) ( not ( = ?auto_173782 ?auto_173787 ) ) ( not ( = ?auto_173783 ?auto_173787 ) ) ( not ( = ?auto_173786 ?auto_173787 ) ) ( not ( = ?auto_173784 ?auto_173787 ) ) ( not ( = ?auto_173785 ?auto_173787 ) ) ( ON ?auto_173780 ?auto_173779 ) ( ON-TABLE ?auto_173787 ) ( ON ?auto_173781 ?auto_173780 ) ( ON ?auto_173782 ?auto_173781 ) ( ON ?auto_173783 ?auto_173782 ) ( CLEAR ?auto_173783 ) ( HOLDING ?auto_173786 ) ( CLEAR ?auto_173785 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173784 ?auto_173785 ?auto_173786 )
      ( MAKE-5PILE ?auto_173779 ?auto_173780 ?auto_173781 ?auto_173782 ?auto_173783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173788 - BLOCK
      ?auto_173789 - BLOCK
      ?auto_173790 - BLOCK
      ?auto_173791 - BLOCK
      ?auto_173792 - BLOCK
    )
    :vars
    (
      ?auto_173796 - BLOCK
      ?auto_173795 - BLOCK
      ?auto_173794 - BLOCK
      ?auto_173793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173788 ?auto_173789 ) ) ( not ( = ?auto_173788 ?auto_173790 ) ) ( not ( = ?auto_173788 ?auto_173791 ) ) ( not ( = ?auto_173788 ?auto_173792 ) ) ( not ( = ?auto_173789 ?auto_173790 ) ) ( not ( = ?auto_173789 ?auto_173791 ) ) ( not ( = ?auto_173789 ?auto_173792 ) ) ( not ( = ?auto_173790 ?auto_173791 ) ) ( not ( = ?auto_173790 ?auto_173792 ) ) ( not ( = ?auto_173791 ?auto_173792 ) ) ( not ( = ?auto_173788 ?auto_173796 ) ) ( not ( = ?auto_173789 ?auto_173796 ) ) ( not ( = ?auto_173790 ?auto_173796 ) ) ( not ( = ?auto_173791 ?auto_173796 ) ) ( not ( = ?auto_173792 ?auto_173796 ) ) ( ON-TABLE ?auto_173795 ) ( ON ?auto_173794 ?auto_173795 ) ( not ( = ?auto_173795 ?auto_173794 ) ) ( not ( = ?auto_173795 ?auto_173796 ) ) ( not ( = ?auto_173795 ?auto_173792 ) ) ( not ( = ?auto_173795 ?auto_173791 ) ) ( not ( = ?auto_173794 ?auto_173796 ) ) ( not ( = ?auto_173794 ?auto_173792 ) ) ( not ( = ?auto_173794 ?auto_173791 ) ) ( not ( = ?auto_173788 ?auto_173795 ) ) ( not ( = ?auto_173788 ?auto_173794 ) ) ( not ( = ?auto_173789 ?auto_173795 ) ) ( not ( = ?auto_173789 ?auto_173794 ) ) ( not ( = ?auto_173790 ?auto_173795 ) ) ( not ( = ?auto_173790 ?auto_173794 ) ) ( ON ?auto_173788 ?auto_173793 ) ( not ( = ?auto_173788 ?auto_173793 ) ) ( not ( = ?auto_173789 ?auto_173793 ) ) ( not ( = ?auto_173790 ?auto_173793 ) ) ( not ( = ?auto_173791 ?auto_173793 ) ) ( not ( = ?auto_173792 ?auto_173793 ) ) ( not ( = ?auto_173796 ?auto_173793 ) ) ( not ( = ?auto_173795 ?auto_173793 ) ) ( not ( = ?auto_173794 ?auto_173793 ) ) ( ON ?auto_173789 ?auto_173788 ) ( ON-TABLE ?auto_173793 ) ( ON ?auto_173790 ?auto_173789 ) ( ON ?auto_173791 ?auto_173790 ) ( ON ?auto_173792 ?auto_173791 ) ( CLEAR ?auto_173794 ) ( ON ?auto_173796 ?auto_173792 ) ( CLEAR ?auto_173796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173793 ?auto_173788 ?auto_173789 ?auto_173790 ?auto_173791 ?auto_173792 )
      ( MAKE-5PILE ?auto_173788 ?auto_173789 ?auto_173790 ?auto_173791 ?auto_173792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173797 - BLOCK
      ?auto_173798 - BLOCK
      ?auto_173799 - BLOCK
      ?auto_173800 - BLOCK
      ?auto_173801 - BLOCK
    )
    :vars
    (
      ?auto_173803 - BLOCK
      ?auto_173802 - BLOCK
      ?auto_173804 - BLOCK
      ?auto_173805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173797 ?auto_173798 ) ) ( not ( = ?auto_173797 ?auto_173799 ) ) ( not ( = ?auto_173797 ?auto_173800 ) ) ( not ( = ?auto_173797 ?auto_173801 ) ) ( not ( = ?auto_173798 ?auto_173799 ) ) ( not ( = ?auto_173798 ?auto_173800 ) ) ( not ( = ?auto_173798 ?auto_173801 ) ) ( not ( = ?auto_173799 ?auto_173800 ) ) ( not ( = ?auto_173799 ?auto_173801 ) ) ( not ( = ?auto_173800 ?auto_173801 ) ) ( not ( = ?auto_173797 ?auto_173803 ) ) ( not ( = ?auto_173798 ?auto_173803 ) ) ( not ( = ?auto_173799 ?auto_173803 ) ) ( not ( = ?auto_173800 ?auto_173803 ) ) ( not ( = ?auto_173801 ?auto_173803 ) ) ( ON-TABLE ?auto_173802 ) ( not ( = ?auto_173802 ?auto_173804 ) ) ( not ( = ?auto_173802 ?auto_173803 ) ) ( not ( = ?auto_173802 ?auto_173801 ) ) ( not ( = ?auto_173802 ?auto_173800 ) ) ( not ( = ?auto_173804 ?auto_173803 ) ) ( not ( = ?auto_173804 ?auto_173801 ) ) ( not ( = ?auto_173804 ?auto_173800 ) ) ( not ( = ?auto_173797 ?auto_173802 ) ) ( not ( = ?auto_173797 ?auto_173804 ) ) ( not ( = ?auto_173798 ?auto_173802 ) ) ( not ( = ?auto_173798 ?auto_173804 ) ) ( not ( = ?auto_173799 ?auto_173802 ) ) ( not ( = ?auto_173799 ?auto_173804 ) ) ( ON ?auto_173797 ?auto_173805 ) ( not ( = ?auto_173797 ?auto_173805 ) ) ( not ( = ?auto_173798 ?auto_173805 ) ) ( not ( = ?auto_173799 ?auto_173805 ) ) ( not ( = ?auto_173800 ?auto_173805 ) ) ( not ( = ?auto_173801 ?auto_173805 ) ) ( not ( = ?auto_173803 ?auto_173805 ) ) ( not ( = ?auto_173802 ?auto_173805 ) ) ( not ( = ?auto_173804 ?auto_173805 ) ) ( ON ?auto_173798 ?auto_173797 ) ( ON-TABLE ?auto_173805 ) ( ON ?auto_173799 ?auto_173798 ) ( ON ?auto_173800 ?auto_173799 ) ( ON ?auto_173801 ?auto_173800 ) ( ON ?auto_173803 ?auto_173801 ) ( CLEAR ?auto_173803 ) ( HOLDING ?auto_173804 ) ( CLEAR ?auto_173802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173802 ?auto_173804 )
      ( MAKE-5PILE ?auto_173797 ?auto_173798 ?auto_173799 ?auto_173800 ?auto_173801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173806 - BLOCK
      ?auto_173807 - BLOCK
      ?auto_173808 - BLOCK
      ?auto_173809 - BLOCK
      ?auto_173810 - BLOCK
    )
    :vars
    (
      ?auto_173814 - BLOCK
      ?auto_173813 - BLOCK
      ?auto_173812 - BLOCK
      ?auto_173811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173806 ?auto_173807 ) ) ( not ( = ?auto_173806 ?auto_173808 ) ) ( not ( = ?auto_173806 ?auto_173809 ) ) ( not ( = ?auto_173806 ?auto_173810 ) ) ( not ( = ?auto_173807 ?auto_173808 ) ) ( not ( = ?auto_173807 ?auto_173809 ) ) ( not ( = ?auto_173807 ?auto_173810 ) ) ( not ( = ?auto_173808 ?auto_173809 ) ) ( not ( = ?auto_173808 ?auto_173810 ) ) ( not ( = ?auto_173809 ?auto_173810 ) ) ( not ( = ?auto_173806 ?auto_173814 ) ) ( not ( = ?auto_173807 ?auto_173814 ) ) ( not ( = ?auto_173808 ?auto_173814 ) ) ( not ( = ?auto_173809 ?auto_173814 ) ) ( not ( = ?auto_173810 ?auto_173814 ) ) ( ON-TABLE ?auto_173813 ) ( not ( = ?auto_173813 ?auto_173812 ) ) ( not ( = ?auto_173813 ?auto_173814 ) ) ( not ( = ?auto_173813 ?auto_173810 ) ) ( not ( = ?auto_173813 ?auto_173809 ) ) ( not ( = ?auto_173812 ?auto_173814 ) ) ( not ( = ?auto_173812 ?auto_173810 ) ) ( not ( = ?auto_173812 ?auto_173809 ) ) ( not ( = ?auto_173806 ?auto_173813 ) ) ( not ( = ?auto_173806 ?auto_173812 ) ) ( not ( = ?auto_173807 ?auto_173813 ) ) ( not ( = ?auto_173807 ?auto_173812 ) ) ( not ( = ?auto_173808 ?auto_173813 ) ) ( not ( = ?auto_173808 ?auto_173812 ) ) ( ON ?auto_173806 ?auto_173811 ) ( not ( = ?auto_173806 ?auto_173811 ) ) ( not ( = ?auto_173807 ?auto_173811 ) ) ( not ( = ?auto_173808 ?auto_173811 ) ) ( not ( = ?auto_173809 ?auto_173811 ) ) ( not ( = ?auto_173810 ?auto_173811 ) ) ( not ( = ?auto_173814 ?auto_173811 ) ) ( not ( = ?auto_173813 ?auto_173811 ) ) ( not ( = ?auto_173812 ?auto_173811 ) ) ( ON ?auto_173807 ?auto_173806 ) ( ON-TABLE ?auto_173811 ) ( ON ?auto_173808 ?auto_173807 ) ( ON ?auto_173809 ?auto_173808 ) ( ON ?auto_173810 ?auto_173809 ) ( ON ?auto_173814 ?auto_173810 ) ( CLEAR ?auto_173813 ) ( ON ?auto_173812 ?auto_173814 ) ( CLEAR ?auto_173812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173811 ?auto_173806 ?auto_173807 ?auto_173808 ?auto_173809 ?auto_173810 ?auto_173814 )
      ( MAKE-5PILE ?auto_173806 ?auto_173807 ?auto_173808 ?auto_173809 ?auto_173810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173815 - BLOCK
      ?auto_173816 - BLOCK
      ?auto_173817 - BLOCK
      ?auto_173818 - BLOCK
      ?auto_173819 - BLOCK
    )
    :vars
    (
      ?auto_173823 - BLOCK
      ?auto_173822 - BLOCK
      ?auto_173821 - BLOCK
      ?auto_173820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173815 ?auto_173816 ) ) ( not ( = ?auto_173815 ?auto_173817 ) ) ( not ( = ?auto_173815 ?auto_173818 ) ) ( not ( = ?auto_173815 ?auto_173819 ) ) ( not ( = ?auto_173816 ?auto_173817 ) ) ( not ( = ?auto_173816 ?auto_173818 ) ) ( not ( = ?auto_173816 ?auto_173819 ) ) ( not ( = ?auto_173817 ?auto_173818 ) ) ( not ( = ?auto_173817 ?auto_173819 ) ) ( not ( = ?auto_173818 ?auto_173819 ) ) ( not ( = ?auto_173815 ?auto_173823 ) ) ( not ( = ?auto_173816 ?auto_173823 ) ) ( not ( = ?auto_173817 ?auto_173823 ) ) ( not ( = ?auto_173818 ?auto_173823 ) ) ( not ( = ?auto_173819 ?auto_173823 ) ) ( not ( = ?auto_173822 ?auto_173821 ) ) ( not ( = ?auto_173822 ?auto_173823 ) ) ( not ( = ?auto_173822 ?auto_173819 ) ) ( not ( = ?auto_173822 ?auto_173818 ) ) ( not ( = ?auto_173821 ?auto_173823 ) ) ( not ( = ?auto_173821 ?auto_173819 ) ) ( not ( = ?auto_173821 ?auto_173818 ) ) ( not ( = ?auto_173815 ?auto_173822 ) ) ( not ( = ?auto_173815 ?auto_173821 ) ) ( not ( = ?auto_173816 ?auto_173822 ) ) ( not ( = ?auto_173816 ?auto_173821 ) ) ( not ( = ?auto_173817 ?auto_173822 ) ) ( not ( = ?auto_173817 ?auto_173821 ) ) ( ON ?auto_173815 ?auto_173820 ) ( not ( = ?auto_173815 ?auto_173820 ) ) ( not ( = ?auto_173816 ?auto_173820 ) ) ( not ( = ?auto_173817 ?auto_173820 ) ) ( not ( = ?auto_173818 ?auto_173820 ) ) ( not ( = ?auto_173819 ?auto_173820 ) ) ( not ( = ?auto_173823 ?auto_173820 ) ) ( not ( = ?auto_173822 ?auto_173820 ) ) ( not ( = ?auto_173821 ?auto_173820 ) ) ( ON ?auto_173816 ?auto_173815 ) ( ON-TABLE ?auto_173820 ) ( ON ?auto_173817 ?auto_173816 ) ( ON ?auto_173818 ?auto_173817 ) ( ON ?auto_173819 ?auto_173818 ) ( ON ?auto_173823 ?auto_173819 ) ( ON ?auto_173821 ?auto_173823 ) ( CLEAR ?auto_173821 ) ( HOLDING ?auto_173822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173822 )
      ( MAKE-5PILE ?auto_173815 ?auto_173816 ?auto_173817 ?auto_173818 ?auto_173819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_173824 - BLOCK
      ?auto_173825 - BLOCK
      ?auto_173826 - BLOCK
      ?auto_173827 - BLOCK
      ?auto_173828 - BLOCK
    )
    :vars
    (
      ?auto_173829 - BLOCK
      ?auto_173830 - BLOCK
      ?auto_173832 - BLOCK
      ?auto_173831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173824 ?auto_173825 ) ) ( not ( = ?auto_173824 ?auto_173826 ) ) ( not ( = ?auto_173824 ?auto_173827 ) ) ( not ( = ?auto_173824 ?auto_173828 ) ) ( not ( = ?auto_173825 ?auto_173826 ) ) ( not ( = ?auto_173825 ?auto_173827 ) ) ( not ( = ?auto_173825 ?auto_173828 ) ) ( not ( = ?auto_173826 ?auto_173827 ) ) ( not ( = ?auto_173826 ?auto_173828 ) ) ( not ( = ?auto_173827 ?auto_173828 ) ) ( not ( = ?auto_173824 ?auto_173829 ) ) ( not ( = ?auto_173825 ?auto_173829 ) ) ( not ( = ?auto_173826 ?auto_173829 ) ) ( not ( = ?auto_173827 ?auto_173829 ) ) ( not ( = ?auto_173828 ?auto_173829 ) ) ( not ( = ?auto_173830 ?auto_173832 ) ) ( not ( = ?auto_173830 ?auto_173829 ) ) ( not ( = ?auto_173830 ?auto_173828 ) ) ( not ( = ?auto_173830 ?auto_173827 ) ) ( not ( = ?auto_173832 ?auto_173829 ) ) ( not ( = ?auto_173832 ?auto_173828 ) ) ( not ( = ?auto_173832 ?auto_173827 ) ) ( not ( = ?auto_173824 ?auto_173830 ) ) ( not ( = ?auto_173824 ?auto_173832 ) ) ( not ( = ?auto_173825 ?auto_173830 ) ) ( not ( = ?auto_173825 ?auto_173832 ) ) ( not ( = ?auto_173826 ?auto_173830 ) ) ( not ( = ?auto_173826 ?auto_173832 ) ) ( ON ?auto_173824 ?auto_173831 ) ( not ( = ?auto_173824 ?auto_173831 ) ) ( not ( = ?auto_173825 ?auto_173831 ) ) ( not ( = ?auto_173826 ?auto_173831 ) ) ( not ( = ?auto_173827 ?auto_173831 ) ) ( not ( = ?auto_173828 ?auto_173831 ) ) ( not ( = ?auto_173829 ?auto_173831 ) ) ( not ( = ?auto_173830 ?auto_173831 ) ) ( not ( = ?auto_173832 ?auto_173831 ) ) ( ON ?auto_173825 ?auto_173824 ) ( ON-TABLE ?auto_173831 ) ( ON ?auto_173826 ?auto_173825 ) ( ON ?auto_173827 ?auto_173826 ) ( ON ?auto_173828 ?auto_173827 ) ( ON ?auto_173829 ?auto_173828 ) ( ON ?auto_173832 ?auto_173829 ) ( ON ?auto_173830 ?auto_173832 ) ( CLEAR ?auto_173830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173831 ?auto_173824 ?auto_173825 ?auto_173826 ?auto_173827 ?auto_173828 ?auto_173829 ?auto_173832 )
      ( MAKE-5PILE ?auto_173824 ?auto_173825 ?auto_173826 ?auto_173827 ?auto_173828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173835 - BLOCK
      ?auto_173836 - BLOCK
    )
    :vars
    (
      ?auto_173837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173837 ?auto_173836 ) ( CLEAR ?auto_173837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173835 ) ( ON ?auto_173836 ?auto_173835 ) ( not ( = ?auto_173835 ?auto_173836 ) ) ( not ( = ?auto_173835 ?auto_173837 ) ) ( not ( = ?auto_173836 ?auto_173837 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173837 ?auto_173836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173838 - BLOCK
      ?auto_173839 - BLOCK
    )
    :vars
    (
      ?auto_173840 - BLOCK
      ?auto_173841 - BLOCK
      ?auto_173842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173840 ?auto_173839 ) ( CLEAR ?auto_173840 ) ( ON-TABLE ?auto_173838 ) ( ON ?auto_173839 ?auto_173838 ) ( not ( = ?auto_173838 ?auto_173839 ) ) ( not ( = ?auto_173838 ?auto_173840 ) ) ( not ( = ?auto_173839 ?auto_173840 ) ) ( HOLDING ?auto_173841 ) ( CLEAR ?auto_173842 ) ( not ( = ?auto_173838 ?auto_173841 ) ) ( not ( = ?auto_173838 ?auto_173842 ) ) ( not ( = ?auto_173839 ?auto_173841 ) ) ( not ( = ?auto_173839 ?auto_173842 ) ) ( not ( = ?auto_173840 ?auto_173841 ) ) ( not ( = ?auto_173840 ?auto_173842 ) ) ( not ( = ?auto_173841 ?auto_173842 ) ) )
    :subtasks
    ( ( !STACK ?auto_173841 ?auto_173842 )
      ( MAKE-2PILE ?auto_173838 ?auto_173839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173843 - BLOCK
      ?auto_173844 - BLOCK
    )
    :vars
    (
      ?auto_173847 - BLOCK
      ?auto_173846 - BLOCK
      ?auto_173845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173847 ?auto_173844 ) ( ON-TABLE ?auto_173843 ) ( ON ?auto_173844 ?auto_173843 ) ( not ( = ?auto_173843 ?auto_173844 ) ) ( not ( = ?auto_173843 ?auto_173847 ) ) ( not ( = ?auto_173844 ?auto_173847 ) ) ( CLEAR ?auto_173846 ) ( not ( = ?auto_173843 ?auto_173845 ) ) ( not ( = ?auto_173843 ?auto_173846 ) ) ( not ( = ?auto_173844 ?auto_173845 ) ) ( not ( = ?auto_173844 ?auto_173846 ) ) ( not ( = ?auto_173847 ?auto_173845 ) ) ( not ( = ?auto_173847 ?auto_173846 ) ) ( not ( = ?auto_173845 ?auto_173846 ) ) ( ON ?auto_173845 ?auto_173847 ) ( CLEAR ?auto_173845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173843 ?auto_173844 ?auto_173847 )
      ( MAKE-2PILE ?auto_173843 ?auto_173844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173848 - BLOCK
      ?auto_173849 - BLOCK
    )
    :vars
    (
      ?auto_173852 - BLOCK
      ?auto_173850 - BLOCK
      ?auto_173851 - BLOCK
      ?auto_173854 - BLOCK
      ?auto_173855 - BLOCK
      ?auto_173853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173852 ?auto_173849 ) ( ON-TABLE ?auto_173848 ) ( ON ?auto_173849 ?auto_173848 ) ( not ( = ?auto_173848 ?auto_173849 ) ) ( not ( = ?auto_173848 ?auto_173852 ) ) ( not ( = ?auto_173849 ?auto_173852 ) ) ( not ( = ?auto_173848 ?auto_173850 ) ) ( not ( = ?auto_173848 ?auto_173851 ) ) ( not ( = ?auto_173849 ?auto_173850 ) ) ( not ( = ?auto_173849 ?auto_173851 ) ) ( not ( = ?auto_173852 ?auto_173850 ) ) ( not ( = ?auto_173852 ?auto_173851 ) ) ( not ( = ?auto_173850 ?auto_173851 ) ) ( ON ?auto_173850 ?auto_173852 ) ( CLEAR ?auto_173850 ) ( HOLDING ?auto_173851 ) ( CLEAR ?auto_173854 ) ( ON-TABLE ?auto_173855 ) ( ON ?auto_173853 ?auto_173855 ) ( ON ?auto_173854 ?auto_173853 ) ( not ( = ?auto_173855 ?auto_173853 ) ) ( not ( = ?auto_173855 ?auto_173854 ) ) ( not ( = ?auto_173855 ?auto_173851 ) ) ( not ( = ?auto_173853 ?auto_173854 ) ) ( not ( = ?auto_173853 ?auto_173851 ) ) ( not ( = ?auto_173854 ?auto_173851 ) ) ( not ( = ?auto_173848 ?auto_173854 ) ) ( not ( = ?auto_173848 ?auto_173855 ) ) ( not ( = ?auto_173848 ?auto_173853 ) ) ( not ( = ?auto_173849 ?auto_173854 ) ) ( not ( = ?auto_173849 ?auto_173855 ) ) ( not ( = ?auto_173849 ?auto_173853 ) ) ( not ( = ?auto_173852 ?auto_173854 ) ) ( not ( = ?auto_173852 ?auto_173855 ) ) ( not ( = ?auto_173852 ?auto_173853 ) ) ( not ( = ?auto_173850 ?auto_173854 ) ) ( not ( = ?auto_173850 ?auto_173855 ) ) ( not ( = ?auto_173850 ?auto_173853 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173855 ?auto_173853 ?auto_173854 ?auto_173851 )
      ( MAKE-2PILE ?auto_173848 ?auto_173849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173856 - BLOCK
      ?auto_173857 - BLOCK
    )
    :vars
    (
      ?auto_173863 - BLOCK
      ?auto_173858 - BLOCK
      ?auto_173859 - BLOCK
      ?auto_173861 - BLOCK
      ?auto_173862 - BLOCK
      ?auto_173860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173863 ?auto_173857 ) ( ON-TABLE ?auto_173856 ) ( ON ?auto_173857 ?auto_173856 ) ( not ( = ?auto_173856 ?auto_173857 ) ) ( not ( = ?auto_173856 ?auto_173863 ) ) ( not ( = ?auto_173857 ?auto_173863 ) ) ( not ( = ?auto_173856 ?auto_173858 ) ) ( not ( = ?auto_173856 ?auto_173859 ) ) ( not ( = ?auto_173857 ?auto_173858 ) ) ( not ( = ?auto_173857 ?auto_173859 ) ) ( not ( = ?auto_173863 ?auto_173858 ) ) ( not ( = ?auto_173863 ?auto_173859 ) ) ( not ( = ?auto_173858 ?auto_173859 ) ) ( ON ?auto_173858 ?auto_173863 ) ( CLEAR ?auto_173861 ) ( ON-TABLE ?auto_173862 ) ( ON ?auto_173860 ?auto_173862 ) ( ON ?auto_173861 ?auto_173860 ) ( not ( = ?auto_173862 ?auto_173860 ) ) ( not ( = ?auto_173862 ?auto_173861 ) ) ( not ( = ?auto_173862 ?auto_173859 ) ) ( not ( = ?auto_173860 ?auto_173861 ) ) ( not ( = ?auto_173860 ?auto_173859 ) ) ( not ( = ?auto_173861 ?auto_173859 ) ) ( not ( = ?auto_173856 ?auto_173861 ) ) ( not ( = ?auto_173856 ?auto_173862 ) ) ( not ( = ?auto_173856 ?auto_173860 ) ) ( not ( = ?auto_173857 ?auto_173861 ) ) ( not ( = ?auto_173857 ?auto_173862 ) ) ( not ( = ?auto_173857 ?auto_173860 ) ) ( not ( = ?auto_173863 ?auto_173861 ) ) ( not ( = ?auto_173863 ?auto_173862 ) ) ( not ( = ?auto_173863 ?auto_173860 ) ) ( not ( = ?auto_173858 ?auto_173861 ) ) ( not ( = ?auto_173858 ?auto_173862 ) ) ( not ( = ?auto_173858 ?auto_173860 ) ) ( ON ?auto_173859 ?auto_173858 ) ( CLEAR ?auto_173859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173856 ?auto_173857 ?auto_173863 ?auto_173858 )
      ( MAKE-2PILE ?auto_173856 ?auto_173857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173864 - BLOCK
      ?auto_173865 - BLOCK
    )
    :vars
    (
      ?auto_173866 - BLOCK
      ?auto_173871 - BLOCK
      ?auto_173869 - BLOCK
      ?auto_173870 - BLOCK
      ?auto_173867 - BLOCK
      ?auto_173868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173866 ?auto_173865 ) ( ON-TABLE ?auto_173864 ) ( ON ?auto_173865 ?auto_173864 ) ( not ( = ?auto_173864 ?auto_173865 ) ) ( not ( = ?auto_173864 ?auto_173866 ) ) ( not ( = ?auto_173865 ?auto_173866 ) ) ( not ( = ?auto_173864 ?auto_173871 ) ) ( not ( = ?auto_173864 ?auto_173869 ) ) ( not ( = ?auto_173865 ?auto_173871 ) ) ( not ( = ?auto_173865 ?auto_173869 ) ) ( not ( = ?auto_173866 ?auto_173871 ) ) ( not ( = ?auto_173866 ?auto_173869 ) ) ( not ( = ?auto_173871 ?auto_173869 ) ) ( ON ?auto_173871 ?auto_173866 ) ( ON-TABLE ?auto_173870 ) ( ON ?auto_173867 ?auto_173870 ) ( not ( = ?auto_173870 ?auto_173867 ) ) ( not ( = ?auto_173870 ?auto_173868 ) ) ( not ( = ?auto_173870 ?auto_173869 ) ) ( not ( = ?auto_173867 ?auto_173868 ) ) ( not ( = ?auto_173867 ?auto_173869 ) ) ( not ( = ?auto_173868 ?auto_173869 ) ) ( not ( = ?auto_173864 ?auto_173868 ) ) ( not ( = ?auto_173864 ?auto_173870 ) ) ( not ( = ?auto_173864 ?auto_173867 ) ) ( not ( = ?auto_173865 ?auto_173868 ) ) ( not ( = ?auto_173865 ?auto_173870 ) ) ( not ( = ?auto_173865 ?auto_173867 ) ) ( not ( = ?auto_173866 ?auto_173868 ) ) ( not ( = ?auto_173866 ?auto_173870 ) ) ( not ( = ?auto_173866 ?auto_173867 ) ) ( not ( = ?auto_173871 ?auto_173868 ) ) ( not ( = ?auto_173871 ?auto_173870 ) ) ( not ( = ?auto_173871 ?auto_173867 ) ) ( ON ?auto_173869 ?auto_173871 ) ( CLEAR ?auto_173869 ) ( HOLDING ?auto_173868 ) ( CLEAR ?auto_173867 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173870 ?auto_173867 ?auto_173868 )
      ( MAKE-2PILE ?auto_173864 ?auto_173865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173872 - BLOCK
      ?auto_173873 - BLOCK
    )
    :vars
    (
      ?auto_173876 - BLOCK
      ?auto_173877 - BLOCK
      ?auto_173875 - BLOCK
      ?auto_173878 - BLOCK
      ?auto_173874 - BLOCK
      ?auto_173879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173876 ?auto_173873 ) ( ON-TABLE ?auto_173872 ) ( ON ?auto_173873 ?auto_173872 ) ( not ( = ?auto_173872 ?auto_173873 ) ) ( not ( = ?auto_173872 ?auto_173876 ) ) ( not ( = ?auto_173873 ?auto_173876 ) ) ( not ( = ?auto_173872 ?auto_173877 ) ) ( not ( = ?auto_173872 ?auto_173875 ) ) ( not ( = ?auto_173873 ?auto_173877 ) ) ( not ( = ?auto_173873 ?auto_173875 ) ) ( not ( = ?auto_173876 ?auto_173877 ) ) ( not ( = ?auto_173876 ?auto_173875 ) ) ( not ( = ?auto_173877 ?auto_173875 ) ) ( ON ?auto_173877 ?auto_173876 ) ( ON-TABLE ?auto_173878 ) ( ON ?auto_173874 ?auto_173878 ) ( not ( = ?auto_173878 ?auto_173874 ) ) ( not ( = ?auto_173878 ?auto_173879 ) ) ( not ( = ?auto_173878 ?auto_173875 ) ) ( not ( = ?auto_173874 ?auto_173879 ) ) ( not ( = ?auto_173874 ?auto_173875 ) ) ( not ( = ?auto_173879 ?auto_173875 ) ) ( not ( = ?auto_173872 ?auto_173879 ) ) ( not ( = ?auto_173872 ?auto_173878 ) ) ( not ( = ?auto_173872 ?auto_173874 ) ) ( not ( = ?auto_173873 ?auto_173879 ) ) ( not ( = ?auto_173873 ?auto_173878 ) ) ( not ( = ?auto_173873 ?auto_173874 ) ) ( not ( = ?auto_173876 ?auto_173879 ) ) ( not ( = ?auto_173876 ?auto_173878 ) ) ( not ( = ?auto_173876 ?auto_173874 ) ) ( not ( = ?auto_173877 ?auto_173879 ) ) ( not ( = ?auto_173877 ?auto_173878 ) ) ( not ( = ?auto_173877 ?auto_173874 ) ) ( ON ?auto_173875 ?auto_173877 ) ( CLEAR ?auto_173874 ) ( ON ?auto_173879 ?auto_173875 ) ( CLEAR ?auto_173879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173872 ?auto_173873 ?auto_173876 ?auto_173877 ?auto_173875 )
      ( MAKE-2PILE ?auto_173872 ?auto_173873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173880 - BLOCK
      ?auto_173881 - BLOCK
    )
    :vars
    (
      ?auto_173886 - BLOCK
      ?auto_173887 - BLOCK
      ?auto_173882 - BLOCK
      ?auto_173885 - BLOCK
      ?auto_173883 - BLOCK
      ?auto_173884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173886 ?auto_173881 ) ( ON-TABLE ?auto_173880 ) ( ON ?auto_173881 ?auto_173880 ) ( not ( = ?auto_173880 ?auto_173881 ) ) ( not ( = ?auto_173880 ?auto_173886 ) ) ( not ( = ?auto_173881 ?auto_173886 ) ) ( not ( = ?auto_173880 ?auto_173887 ) ) ( not ( = ?auto_173880 ?auto_173882 ) ) ( not ( = ?auto_173881 ?auto_173887 ) ) ( not ( = ?auto_173881 ?auto_173882 ) ) ( not ( = ?auto_173886 ?auto_173887 ) ) ( not ( = ?auto_173886 ?auto_173882 ) ) ( not ( = ?auto_173887 ?auto_173882 ) ) ( ON ?auto_173887 ?auto_173886 ) ( ON-TABLE ?auto_173885 ) ( not ( = ?auto_173885 ?auto_173883 ) ) ( not ( = ?auto_173885 ?auto_173884 ) ) ( not ( = ?auto_173885 ?auto_173882 ) ) ( not ( = ?auto_173883 ?auto_173884 ) ) ( not ( = ?auto_173883 ?auto_173882 ) ) ( not ( = ?auto_173884 ?auto_173882 ) ) ( not ( = ?auto_173880 ?auto_173884 ) ) ( not ( = ?auto_173880 ?auto_173885 ) ) ( not ( = ?auto_173880 ?auto_173883 ) ) ( not ( = ?auto_173881 ?auto_173884 ) ) ( not ( = ?auto_173881 ?auto_173885 ) ) ( not ( = ?auto_173881 ?auto_173883 ) ) ( not ( = ?auto_173886 ?auto_173884 ) ) ( not ( = ?auto_173886 ?auto_173885 ) ) ( not ( = ?auto_173886 ?auto_173883 ) ) ( not ( = ?auto_173887 ?auto_173884 ) ) ( not ( = ?auto_173887 ?auto_173885 ) ) ( not ( = ?auto_173887 ?auto_173883 ) ) ( ON ?auto_173882 ?auto_173887 ) ( ON ?auto_173884 ?auto_173882 ) ( CLEAR ?auto_173884 ) ( HOLDING ?auto_173883 ) ( CLEAR ?auto_173885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173885 ?auto_173883 )
      ( MAKE-2PILE ?auto_173880 ?auto_173881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173888 - BLOCK
      ?auto_173889 - BLOCK
    )
    :vars
    (
      ?auto_173894 - BLOCK
      ?auto_173892 - BLOCK
      ?auto_173891 - BLOCK
      ?auto_173893 - BLOCK
      ?auto_173890 - BLOCK
      ?auto_173895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173894 ?auto_173889 ) ( ON-TABLE ?auto_173888 ) ( ON ?auto_173889 ?auto_173888 ) ( not ( = ?auto_173888 ?auto_173889 ) ) ( not ( = ?auto_173888 ?auto_173894 ) ) ( not ( = ?auto_173889 ?auto_173894 ) ) ( not ( = ?auto_173888 ?auto_173892 ) ) ( not ( = ?auto_173888 ?auto_173891 ) ) ( not ( = ?auto_173889 ?auto_173892 ) ) ( not ( = ?auto_173889 ?auto_173891 ) ) ( not ( = ?auto_173894 ?auto_173892 ) ) ( not ( = ?auto_173894 ?auto_173891 ) ) ( not ( = ?auto_173892 ?auto_173891 ) ) ( ON ?auto_173892 ?auto_173894 ) ( ON-TABLE ?auto_173893 ) ( not ( = ?auto_173893 ?auto_173890 ) ) ( not ( = ?auto_173893 ?auto_173895 ) ) ( not ( = ?auto_173893 ?auto_173891 ) ) ( not ( = ?auto_173890 ?auto_173895 ) ) ( not ( = ?auto_173890 ?auto_173891 ) ) ( not ( = ?auto_173895 ?auto_173891 ) ) ( not ( = ?auto_173888 ?auto_173895 ) ) ( not ( = ?auto_173888 ?auto_173893 ) ) ( not ( = ?auto_173888 ?auto_173890 ) ) ( not ( = ?auto_173889 ?auto_173895 ) ) ( not ( = ?auto_173889 ?auto_173893 ) ) ( not ( = ?auto_173889 ?auto_173890 ) ) ( not ( = ?auto_173894 ?auto_173895 ) ) ( not ( = ?auto_173894 ?auto_173893 ) ) ( not ( = ?auto_173894 ?auto_173890 ) ) ( not ( = ?auto_173892 ?auto_173895 ) ) ( not ( = ?auto_173892 ?auto_173893 ) ) ( not ( = ?auto_173892 ?auto_173890 ) ) ( ON ?auto_173891 ?auto_173892 ) ( ON ?auto_173895 ?auto_173891 ) ( CLEAR ?auto_173893 ) ( ON ?auto_173890 ?auto_173895 ) ( CLEAR ?auto_173890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173888 ?auto_173889 ?auto_173894 ?auto_173892 ?auto_173891 ?auto_173895 )
      ( MAKE-2PILE ?auto_173888 ?auto_173889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173896 - BLOCK
      ?auto_173897 - BLOCK
    )
    :vars
    (
      ?auto_173901 - BLOCK
      ?auto_173902 - BLOCK
      ?auto_173903 - BLOCK
      ?auto_173899 - BLOCK
      ?auto_173900 - BLOCK
      ?auto_173898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173901 ?auto_173897 ) ( ON-TABLE ?auto_173896 ) ( ON ?auto_173897 ?auto_173896 ) ( not ( = ?auto_173896 ?auto_173897 ) ) ( not ( = ?auto_173896 ?auto_173901 ) ) ( not ( = ?auto_173897 ?auto_173901 ) ) ( not ( = ?auto_173896 ?auto_173902 ) ) ( not ( = ?auto_173896 ?auto_173903 ) ) ( not ( = ?auto_173897 ?auto_173902 ) ) ( not ( = ?auto_173897 ?auto_173903 ) ) ( not ( = ?auto_173901 ?auto_173902 ) ) ( not ( = ?auto_173901 ?auto_173903 ) ) ( not ( = ?auto_173902 ?auto_173903 ) ) ( ON ?auto_173902 ?auto_173901 ) ( not ( = ?auto_173899 ?auto_173900 ) ) ( not ( = ?auto_173899 ?auto_173898 ) ) ( not ( = ?auto_173899 ?auto_173903 ) ) ( not ( = ?auto_173900 ?auto_173898 ) ) ( not ( = ?auto_173900 ?auto_173903 ) ) ( not ( = ?auto_173898 ?auto_173903 ) ) ( not ( = ?auto_173896 ?auto_173898 ) ) ( not ( = ?auto_173896 ?auto_173899 ) ) ( not ( = ?auto_173896 ?auto_173900 ) ) ( not ( = ?auto_173897 ?auto_173898 ) ) ( not ( = ?auto_173897 ?auto_173899 ) ) ( not ( = ?auto_173897 ?auto_173900 ) ) ( not ( = ?auto_173901 ?auto_173898 ) ) ( not ( = ?auto_173901 ?auto_173899 ) ) ( not ( = ?auto_173901 ?auto_173900 ) ) ( not ( = ?auto_173902 ?auto_173898 ) ) ( not ( = ?auto_173902 ?auto_173899 ) ) ( not ( = ?auto_173902 ?auto_173900 ) ) ( ON ?auto_173903 ?auto_173902 ) ( ON ?auto_173898 ?auto_173903 ) ( ON ?auto_173900 ?auto_173898 ) ( CLEAR ?auto_173900 ) ( HOLDING ?auto_173899 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173899 )
      ( MAKE-2PILE ?auto_173896 ?auto_173897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173904 - BLOCK
      ?auto_173905 - BLOCK
    )
    :vars
    (
      ?auto_173909 - BLOCK
      ?auto_173911 - BLOCK
      ?auto_173907 - BLOCK
      ?auto_173910 - BLOCK
      ?auto_173906 - BLOCK
      ?auto_173908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173909 ?auto_173905 ) ( ON-TABLE ?auto_173904 ) ( ON ?auto_173905 ?auto_173904 ) ( not ( = ?auto_173904 ?auto_173905 ) ) ( not ( = ?auto_173904 ?auto_173909 ) ) ( not ( = ?auto_173905 ?auto_173909 ) ) ( not ( = ?auto_173904 ?auto_173911 ) ) ( not ( = ?auto_173904 ?auto_173907 ) ) ( not ( = ?auto_173905 ?auto_173911 ) ) ( not ( = ?auto_173905 ?auto_173907 ) ) ( not ( = ?auto_173909 ?auto_173911 ) ) ( not ( = ?auto_173909 ?auto_173907 ) ) ( not ( = ?auto_173911 ?auto_173907 ) ) ( ON ?auto_173911 ?auto_173909 ) ( not ( = ?auto_173910 ?auto_173906 ) ) ( not ( = ?auto_173910 ?auto_173908 ) ) ( not ( = ?auto_173910 ?auto_173907 ) ) ( not ( = ?auto_173906 ?auto_173908 ) ) ( not ( = ?auto_173906 ?auto_173907 ) ) ( not ( = ?auto_173908 ?auto_173907 ) ) ( not ( = ?auto_173904 ?auto_173908 ) ) ( not ( = ?auto_173904 ?auto_173910 ) ) ( not ( = ?auto_173904 ?auto_173906 ) ) ( not ( = ?auto_173905 ?auto_173908 ) ) ( not ( = ?auto_173905 ?auto_173910 ) ) ( not ( = ?auto_173905 ?auto_173906 ) ) ( not ( = ?auto_173909 ?auto_173908 ) ) ( not ( = ?auto_173909 ?auto_173910 ) ) ( not ( = ?auto_173909 ?auto_173906 ) ) ( not ( = ?auto_173911 ?auto_173908 ) ) ( not ( = ?auto_173911 ?auto_173910 ) ) ( not ( = ?auto_173911 ?auto_173906 ) ) ( ON ?auto_173907 ?auto_173911 ) ( ON ?auto_173908 ?auto_173907 ) ( ON ?auto_173906 ?auto_173908 ) ( ON ?auto_173910 ?auto_173906 ) ( CLEAR ?auto_173910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173904 ?auto_173905 ?auto_173909 ?auto_173911 ?auto_173907 ?auto_173908 ?auto_173906 )
      ( MAKE-2PILE ?auto_173904 ?auto_173905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173912 - BLOCK
      ?auto_173913 - BLOCK
    )
    :vars
    (
      ?auto_173918 - BLOCK
      ?auto_173916 - BLOCK
      ?auto_173915 - BLOCK
      ?auto_173919 - BLOCK
      ?auto_173914 - BLOCK
      ?auto_173917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173918 ?auto_173913 ) ( ON-TABLE ?auto_173912 ) ( ON ?auto_173913 ?auto_173912 ) ( not ( = ?auto_173912 ?auto_173913 ) ) ( not ( = ?auto_173912 ?auto_173918 ) ) ( not ( = ?auto_173913 ?auto_173918 ) ) ( not ( = ?auto_173912 ?auto_173916 ) ) ( not ( = ?auto_173912 ?auto_173915 ) ) ( not ( = ?auto_173913 ?auto_173916 ) ) ( not ( = ?auto_173913 ?auto_173915 ) ) ( not ( = ?auto_173918 ?auto_173916 ) ) ( not ( = ?auto_173918 ?auto_173915 ) ) ( not ( = ?auto_173916 ?auto_173915 ) ) ( ON ?auto_173916 ?auto_173918 ) ( not ( = ?auto_173919 ?auto_173914 ) ) ( not ( = ?auto_173919 ?auto_173917 ) ) ( not ( = ?auto_173919 ?auto_173915 ) ) ( not ( = ?auto_173914 ?auto_173917 ) ) ( not ( = ?auto_173914 ?auto_173915 ) ) ( not ( = ?auto_173917 ?auto_173915 ) ) ( not ( = ?auto_173912 ?auto_173917 ) ) ( not ( = ?auto_173912 ?auto_173919 ) ) ( not ( = ?auto_173912 ?auto_173914 ) ) ( not ( = ?auto_173913 ?auto_173917 ) ) ( not ( = ?auto_173913 ?auto_173919 ) ) ( not ( = ?auto_173913 ?auto_173914 ) ) ( not ( = ?auto_173918 ?auto_173917 ) ) ( not ( = ?auto_173918 ?auto_173919 ) ) ( not ( = ?auto_173918 ?auto_173914 ) ) ( not ( = ?auto_173916 ?auto_173917 ) ) ( not ( = ?auto_173916 ?auto_173919 ) ) ( not ( = ?auto_173916 ?auto_173914 ) ) ( ON ?auto_173915 ?auto_173916 ) ( ON ?auto_173917 ?auto_173915 ) ( ON ?auto_173914 ?auto_173917 ) ( HOLDING ?auto_173919 ) ( CLEAR ?auto_173914 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173912 ?auto_173913 ?auto_173918 ?auto_173916 ?auto_173915 ?auto_173917 ?auto_173914 ?auto_173919 )
      ( MAKE-2PILE ?auto_173912 ?auto_173913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173920 - BLOCK
      ?auto_173921 - BLOCK
    )
    :vars
    (
      ?auto_173922 - BLOCK
      ?auto_173924 - BLOCK
      ?auto_173926 - BLOCK
      ?auto_173923 - BLOCK
      ?auto_173927 - BLOCK
      ?auto_173925 - BLOCK
      ?auto_173928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173922 ?auto_173921 ) ( ON-TABLE ?auto_173920 ) ( ON ?auto_173921 ?auto_173920 ) ( not ( = ?auto_173920 ?auto_173921 ) ) ( not ( = ?auto_173920 ?auto_173922 ) ) ( not ( = ?auto_173921 ?auto_173922 ) ) ( not ( = ?auto_173920 ?auto_173924 ) ) ( not ( = ?auto_173920 ?auto_173926 ) ) ( not ( = ?auto_173921 ?auto_173924 ) ) ( not ( = ?auto_173921 ?auto_173926 ) ) ( not ( = ?auto_173922 ?auto_173924 ) ) ( not ( = ?auto_173922 ?auto_173926 ) ) ( not ( = ?auto_173924 ?auto_173926 ) ) ( ON ?auto_173924 ?auto_173922 ) ( not ( = ?auto_173923 ?auto_173927 ) ) ( not ( = ?auto_173923 ?auto_173925 ) ) ( not ( = ?auto_173923 ?auto_173926 ) ) ( not ( = ?auto_173927 ?auto_173925 ) ) ( not ( = ?auto_173927 ?auto_173926 ) ) ( not ( = ?auto_173925 ?auto_173926 ) ) ( not ( = ?auto_173920 ?auto_173925 ) ) ( not ( = ?auto_173920 ?auto_173923 ) ) ( not ( = ?auto_173920 ?auto_173927 ) ) ( not ( = ?auto_173921 ?auto_173925 ) ) ( not ( = ?auto_173921 ?auto_173923 ) ) ( not ( = ?auto_173921 ?auto_173927 ) ) ( not ( = ?auto_173922 ?auto_173925 ) ) ( not ( = ?auto_173922 ?auto_173923 ) ) ( not ( = ?auto_173922 ?auto_173927 ) ) ( not ( = ?auto_173924 ?auto_173925 ) ) ( not ( = ?auto_173924 ?auto_173923 ) ) ( not ( = ?auto_173924 ?auto_173927 ) ) ( ON ?auto_173926 ?auto_173924 ) ( ON ?auto_173925 ?auto_173926 ) ( ON ?auto_173927 ?auto_173925 ) ( CLEAR ?auto_173927 ) ( ON ?auto_173923 ?auto_173928 ) ( CLEAR ?auto_173923 ) ( HAND-EMPTY ) ( not ( = ?auto_173920 ?auto_173928 ) ) ( not ( = ?auto_173921 ?auto_173928 ) ) ( not ( = ?auto_173922 ?auto_173928 ) ) ( not ( = ?auto_173924 ?auto_173928 ) ) ( not ( = ?auto_173926 ?auto_173928 ) ) ( not ( = ?auto_173923 ?auto_173928 ) ) ( not ( = ?auto_173927 ?auto_173928 ) ) ( not ( = ?auto_173925 ?auto_173928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173923 ?auto_173928 )
      ( MAKE-2PILE ?auto_173920 ?auto_173921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173929 - BLOCK
      ?auto_173930 - BLOCK
    )
    :vars
    (
      ?auto_173932 - BLOCK
      ?auto_173934 - BLOCK
      ?auto_173931 - BLOCK
      ?auto_173933 - BLOCK
      ?auto_173935 - BLOCK
      ?auto_173937 - BLOCK
      ?auto_173936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173932 ?auto_173930 ) ( ON-TABLE ?auto_173929 ) ( ON ?auto_173930 ?auto_173929 ) ( not ( = ?auto_173929 ?auto_173930 ) ) ( not ( = ?auto_173929 ?auto_173932 ) ) ( not ( = ?auto_173930 ?auto_173932 ) ) ( not ( = ?auto_173929 ?auto_173934 ) ) ( not ( = ?auto_173929 ?auto_173931 ) ) ( not ( = ?auto_173930 ?auto_173934 ) ) ( not ( = ?auto_173930 ?auto_173931 ) ) ( not ( = ?auto_173932 ?auto_173934 ) ) ( not ( = ?auto_173932 ?auto_173931 ) ) ( not ( = ?auto_173934 ?auto_173931 ) ) ( ON ?auto_173934 ?auto_173932 ) ( not ( = ?auto_173933 ?auto_173935 ) ) ( not ( = ?auto_173933 ?auto_173937 ) ) ( not ( = ?auto_173933 ?auto_173931 ) ) ( not ( = ?auto_173935 ?auto_173937 ) ) ( not ( = ?auto_173935 ?auto_173931 ) ) ( not ( = ?auto_173937 ?auto_173931 ) ) ( not ( = ?auto_173929 ?auto_173937 ) ) ( not ( = ?auto_173929 ?auto_173933 ) ) ( not ( = ?auto_173929 ?auto_173935 ) ) ( not ( = ?auto_173930 ?auto_173937 ) ) ( not ( = ?auto_173930 ?auto_173933 ) ) ( not ( = ?auto_173930 ?auto_173935 ) ) ( not ( = ?auto_173932 ?auto_173937 ) ) ( not ( = ?auto_173932 ?auto_173933 ) ) ( not ( = ?auto_173932 ?auto_173935 ) ) ( not ( = ?auto_173934 ?auto_173937 ) ) ( not ( = ?auto_173934 ?auto_173933 ) ) ( not ( = ?auto_173934 ?auto_173935 ) ) ( ON ?auto_173931 ?auto_173934 ) ( ON ?auto_173937 ?auto_173931 ) ( ON ?auto_173933 ?auto_173936 ) ( CLEAR ?auto_173933 ) ( not ( = ?auto_173929 ?auto_173936 ) ) ( not ( = ?auto_173930 ?auto_173936 ) ) ( not ( = ?auto_173932 ?auto_173936 ) ) ( not ( = ?auto_173934 ?auto_173936 ) ) ( not ( = ?auto_173931 ?auto_173936 ) ) ( not ( = ?auto_173933 ?auto_173936 ) ) ( not ( = ?auto_173935 ?auto_173936 ) ) ( not ( = ?auto_173937 ?auto_173936 ) ) ( HOLDING ?auto_173935 ) ( CLEAR ?auto_173937 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173929 ?auto_173930 ?auto_173932 ?auto_173934 ?auto_173931 ?auto_173937 ?auto_173935 )
      ( MAKE-2PILE ?auto_173929 ?auto_173930 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173938 - BLOCK
      ?auto_173939 - BLOCK
    )
    :vars
    (
      ?auto_173942 - BLOCK
      ?auto_173945 - BLOCK
      ?auto_173941 - BLOCK
      ?auto_173940 - BLOCK
      ?auto_173946 - BLOCK
      ?auto_173943 - BLOCK
      ?auto_173944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173942 ?auto_173939 ) ( ON-TABLE ?auto_173938 ) ( ON ?auto_173939 ?auto_173938 ) ( not ( = ?auto_173938 ?auto_173939 ) ) ( not ( = ?auto_173938 ?auto_173942 ) ) ( not ( = ?auto_173939 ?auto_173942 ) ) ( not ( = ?auto_173938 ?auto_173945 ) ) ( not ( = ?auto_173938 ?auto_173941 ) ) ( not ( = ?auto_173939 ?auto_173945 ) ) ( not ( = ?auto_173939 ?auto_173941 ) ) ( not ( = ?auto_173942 ?auto_173945 ) ) ( not ( = ?auto_173942 ?auto_173941 ) ) ( not ( = ?auto_173945 ?auto_173941 ) ) ( ON ?auto_173945 ?auto_173942 ) ( not ( = ?auto_173940 ?auto_173946 ) ) ( not ( = ?auto_173940 ?auto_173943 ) ) ( not ( = ?auto_173940 ?auto_173941 ) ) ( not ( = ?auto_173946 ?auto_173943 ) ) ( not ( = ?auto_173946 ?auto_173941 ) ) ( not ( = ?auto_173943 ?auto_173941 ) ) ( not ( = ?auto_173938 ?auto_173943 ) ) ( not ( = ?auto_173938 ?auto_173940 ) ) ( not ( = ?auto_173938 ?auto_173946 ) ) ( not ( = ?auto_173939 ?auto_173943 ) ) ( not ( = ?auto_173939 ?auto_173940 ) ) ( not ( = ?auto_173939 ?auto_173946 ) ) ( not ( = ?auto_173942 ?auto_173943 ) ) ( not ( = ?auto_173942 ?auto_173940 ) ) ( not ( = ?auto_173942 ?auto_173946 ) ) ( not ( = ?auto_173945 ?auto_173943 ) ) ( not ( = ?auto_173945 ?auto_173940 ) ) ( not ( = ?auto_173945 ?auto_173946 ) ) ( ON ?auto_173941 ?auto_173945 ) ( ON ?auto_173943 ?auto_173941 ) ( ON ?auto_173940 ?auto_173944 ) ( not ( = ?auto_173938 ?auto_173944 ) ) ( not ( = ?auto_173939 ?auto_173944 ) ) ( not ( = ?auto_173942 ?auto_173944 ) ) ( not ( = ?auto_173945 ?auto_173944 ) ) ( not ( = ?auto_173941 ?auto_173944 ) ) ( not ( = ?auto_173940 ?auto_173944 ) ) ( not ( = ?auto_173946 ?auto_173944 ) ) ( not ( = ?auto_173943 ?auto_173944 ) ) ( CLEAR ?auto_173943 ) ( ON ?auto_173946 ?auto_173940 ) ( CLEAR ?auto_173946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173944 ?auto_173940 )
      ( MAKE-2PILE ?auto_173938 ?auto_173939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173947 - BLOCK
      ?auto_173948 - BLOCK
    )
    :vars
    (
      ?auto_173949 - BLOCK
      ?auto_173952 - BLOCK
      ?auto_173953 - BLOCK
      ?auto_173955 - BLOCK
      ?auto_173950 - BLOCK
      ?auto_173954 - BLOCK
      ?auto_173951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173949 ?auto_173948 ) ( ON-TABLE ?auto_173947 ) ( ON ?auto_173948 ?auto_173947 ) ( not ( = ?auto_173947 ?auto_173948 ) ) ( not ( = ?auto_173947 ?auto_173949 ) ) ( not ( = ?auto_173948 ?auto_173949 ) ) ( not ( = ?auto_173947 ?auto_173952 ) ) ( not ( = ?auto_173947 ?auto_173953 ) ) ( not ( = ?auto_173948 ?auto_173952 ) ) ( not ( = ?auto_173948 ?auto_173953 ) ) ( not ( = ?auto_173949 ?auto_173952 ) ) ( not ( = ?auto_173949 ?auto_173953 ) ) ( not ( = ?auto_173952 ?auto_173953 ) ) ( ON ?auto_173952 ?auto_173949 ) ( not ( = ?auto_173955 ?auto_173950 ) ) ( not ( = ?auto_173955 ?auto_173954 ) ) ( not ( = ?auto_173955 ?auto_173953 ) ) ( not ( = ?auto_173950 ?auto_173954 ) ) ( not ( = ?auto_173950 ?auto_173953 ) ) ( not ( = ?auto_173954 ?auto_173953 ) ) ( not ( = ?auto_173947 ?auto_173954 ) ) ( not ( = ?auto_173947 ?auto_173955 ) ) ( not ( = ?auto_173947 ?auto_173950 ) ) ( not ( = ?auto_173948 ?auto_173954 ) ) ( not ( = ?auto_173948 ?auto_173955 ) ) ( not ( = ?auto_173948 ?auto_173950 ) ) ( not ( = ?auto_173949 ?auto_173954 ) ) ( not ( = ?auto_173949 ?auto_173955 ) ) ( not ( = ?auto_173949 ?auto_173950 ) ) ( not ( = ?auto_173952 ?auto_173954 ) ) ( not ( = ?auto_173952 ?auto_173955 ) ) ( not ( = ?auto_173952 ?auto_173950 ) ) ( ON ?auto_173953 ?auto_173952 ) ( ON ?auto_173955 ?auto_173951 ) ( not ( = ?auto_173947 ?auto_173951 ) ) ( not ( = ?auto_173948 ?auto_173951 ) ) ( not ( = ?auto_173949 ?auto_173951 ) ) ( not ( = ?auto_173952 ?auto_173951 ) ) ( not ( = ?auto_173953 ?auto_173951 ) ) ( not ( = ?auto_173955 ?auto_173951 ) ) ( not ( = ?auto_173950 ?auto_173951 ) ) ( not ( = ?auto_173954 ?auto_173951 ) ) ( ON ?auto_173950 ?auto_173955 ) ( CLEAR ?auto_173950 ) ( ON-TABLE ?auto_173951 ) ( HOLDING ?auto_173954 ) ( CLEAR ?auto_173953 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173947 ?auto_173948 ?auto_173949 ?auto_173952 ?auto_173953 ?auto_173954 )
      ( MAKE-2PILE ?auto_173947 ?auto_173948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173956 - BLOCK
      ?auto_173957 - BLOCK
    )
    :vars
    (
      ?auto_173958 - BLOCK
      ?auto_173960 - BLOCK
      ?auto_173961 - BLOCK
      ?auto_173963 - BLOCK
      ?auto_173964 - BLOCK
      ?auto_173962 - BLOCK
      ?auto_173959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173958 ?auto_173957 ) ( ON-TABLE ?auto_173956 ) ( ON ?auto_173957 ?auto_173956 ) ( not ( = ?auto_173956 ?auto_173957 ) ) ( not ( = ?auto_173956 ?auto_173958 ) ) ( not ( = ?auto_173957 ?auto_173958 ) ) ( not ( = ?auto_173956 ?auto_173960 ) ) ( not ( = ?auto_173956 ?auto_173961 ) ) ( not ( = ?auto_173957 ?auto_173960 ) ) ( not ( = ?auto_173957 ?auto_173961 ) ) ( not ( = ?auto_173958 ?auto_173960 ) ) ( not ( = ?auto_173958 ?auto_173961 ) ) ( not ( = ?auto_173960 ?auto_173961 ) ) ( ON ?auto_173960 ?auto_173958 ) ( not ( = ?auto_173963 ?auto_173964 ) ) ( not ( = ?auto_173963 ?auto_173962 ) ) ( not ( = ?auto_173963 ?auto_173961 ) ) ( not ( = ?auto_173964 ?auto_173962 ) ) ( not ( = ?auto_173964 ?auto_173961 ) ) ( not ( = ?auto_173962 ?auto_173961 ) ) ( not ( = ?auto_173956 ?auto_173962 ) ) ( not ( = ?auto_173956 ?auto_173963 ) ) ( not ( = ?auto_173956 ?auto_173964 ) ) ( not ( = ?auto_173957 ?auto_173962 ) ) ( not ( = ?auto_173957 ?auto_173963 ) ) ( not ( = ?auto_173957 ?auto_173964 ) ) ( not ( = ?auto_173958 ?auto_173962 ) ) ( not ( = ?auto_173958 ?auto_173963 ) ) ( not ( = ?auto_173958 ?auto_173964 ) ) ( not ( = ?auto_173960 ?auto_173962 ) ) ( not ( = ?auto_173960 ?auto_173963 ) ) ( not ( = ?auto_173960 ?auto_173964 ) ) ( ON ?auto_173961 ?auto_173960 ) ( ON ?auto_173963 ?auto_173959 ) ( not ( = ?auto_173956 ?auto_173959 ) ) ( not ( = ?auto_173957 ?auto_173959 ) ) ( not ( = ?auto_173958 ?auto_173959 ) ) ( not ( = ?auto_173960 ?auto_173959 ) ) ( not ( = ?auto_173961 ?auto_173959 ) ) ( not ( = ?auto_173963 ?auto_173959 ) ) ( not ( = ?auto_173964 ?auto_173959 ) ) ( not ( = ?auto_173962 ?auto_173959 ) ) ( ON ?auto_173964 ?auto_173963 ) ( ON-TABLE ?auto_173959 ) ( CLEAR ?auto_173961 ) ( ON ?auto_173962 ?auto_173964 ) ( CLEAR ?auto_173962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173959 ?auto_173963 ?auto_173964 )
      ( MAKE-2PILE ?auto_173956 ?auto_173957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173965 - BLOCK
      ?auto_173966 - BLOCK
    )
    :vars
    (
      ?auto_173971 - BLOCK
      ?auto_173970 - BLOCK
      ?auto_173967 - BLOCK
      ?auto_173973 - BLOCK
      ?auto_173972 - BLOCK
      ?auto_173969 - BLOCK
      ?auto_173968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173971 ?auto_173966 ) ( ON-TABLE ?auto_173965 ) ( ON ?auto_173966 ?auto_173965 ) ( not ( = ?auto_173965 ?auto_173966 ) ) ( not ( = ?auto_173965 ?auto_173971 ) ) ( not ( = ?auto_173966 ?auto_173971 ) ) ( not ( = ?auto_173965 ?auto_173970 ) ) ( not ( = ?auto_173965 ?auto_173967 ) ) ( not ( = ?auto_173966 ?auto_173970 ) ) ( not ( = ?auto_173966 ?auto_173967 ) ) ( not ( = ?auto_173971 ?auto_173970 ) ) ( not ( = ?auto_173971 ?auto_173967 ) ) ( not ( = ?auto_173970 ?auto_173967 ) ) ( ON ?auto_173970 ?auto_173971 ) ( not ( = ?auto_173973 ?auto_173972 ) ) ( not ( = ?auto_173973 ?auto_173969 ) ) ( not ( = ?auto_173973 ?auto_173967 ) ) ( not ( = ?auto_173972 ?auto_173969 ) ) ( not ( = ?auto_173972 ?auto_173967 ) ) ( not ( = ?auto_173969 ?auto_173967 ) ) ( not ( = ?auto_173965 ?auto_173969 ) ) ( not ( = ?auto_173965 ?auto_173973 ) ) ( not ( = ?auto_173965 ?auto_173972 ) ) ( not ( = ?auto_173966 ?auto_173969 ) ) ( not ( = ?auto_173966 ?auto_173973 ) ) ( not ( = ?auto_173966 ?auto_173972 ) ) ( not ( = ?auto_173971 ?auto_173969 ) ) ( not ( = ?auto_173971 ?auto_173973 ) ) ( not ( = ?auto_173971 ?auto_173972 ) ) ( not ( = ?auto_173970 ?auto_173969 ) ) ( not ( = ?auto_173970 ?auto_173973 ) ) ( not ( = ?auto_173970 ?auto_173972 ) ) ( ON ?auto_173973 ?auto_173968 ) ( not ( = ?auto_173965 ?auto_173968 ) ) ( not ( = ?auto_173966 ?auto_173968 ) ) ( not ( = ?auto_173971 ?auto_173968 ) ) ( not ( = ?auto_173970 ?auto_173968 ) ) ( not ( = ?auto_173967 ?auto_173968 ) ) ( not ( = ?auto_173973 ?auto_173968 ) ) ( not ( = ?auto_173972 ?auto_173968 ) ) ( not ( = ?auto_173969 ?auto_173968 ) ) ( ON ?auto_173972 ?auto_173973 ) ( ON-TABLE ?auto_173968 ) ( ON ?auto_173969 ?auto_173972 ) ( CLEAR ?auto_173969 ) ( HOLDING ?auto_173967 ) ( CLEAR ?auto_173970 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173965 ?auto_173966 ?auto_173971 ?auto_173970 ?auto_173967 )
      ( MAKE-2PILE ?auto_173965 ?auto_173966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173974 - BLOCK
      ?auto_173975 - BLOCK
    )
    :vars
    (
      ?auto_173982 - BLOCK
      ?auto_173978 - BLOCK
      ?auto_173979 - BLOCK
      ?auto_173980 - BLOCK
      ?auto_173981 - BLOCK
      ?auto_173977 - BLOCK
      ?auto_173976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173982 ?auto_173975 ) ( ON-TABLE ?auto_173974 ) ( ON ?auto_173975 ?auto_173974 ) ( not ( = ?auto_173974 ?auto_173975 ) ) ( not ( = ?auto_173974 ?auto_173982 ) ) ( not ( = ?auto_173975 ?auto_173982 ) ) ( not ( = ?auto_173974 ?auto_173978 ) ) ( not ( = ?auto_173974 ?auto_173979 ) ) ( not ( = ?auto_173975 ?auto_173978 ) ) ( not ( = ?auto_173975 ?auto_173979 ) ) ( not ( = ?auto_173982 ?auto_173978 ) ) ( not ( = ?auto_173982 ?auto_173979 ) ) ( not ( = ?auto_173978 ?auto_173979 ) ) ( ON ?auto_173978 ?auto_173982 ) ( not ( = ?auto_173980 ?auto_173981 ) ) ( not ( = ?auto_173980 ?auto_173977 ) ) ( not ( = ?auto_173980 ?auto_173979 ) ) ( not ( = ?auto_173981 ?auto_173977 ) ) ( not ( = ?auto_173981 ?auto_173979 ) ) ( not ( = ?auto_173977 ?auto_173979 ) ) ( not ( = ?auto_173974 ?auto_173977 ) ) ( not ( = ?auto_173974 ?auto_173980 ) ) ( not ( = ?auto_173974 ?auto_173981 ) ) ( not ( = ?auto_173975 ?auto_173977 ) ) ( not ( = ?auto_173975 ?auto_173980 ) ) ( not ( = ?auto_173975 ?auto_173981 ) ) ( not ( = ?auto_173982 ?auto_173977 ) ) ( not ( = ?auto_173982 ?auto_173980 ) ) ( not ( = ?auto_173982 ?auto_173981 ) ) ( not ( = ?auto_173978 ?auto_173977 ) ) ( not ( = ?auto_173978 ?auto_173980 ) ) ( not ( = ?auto_173978 ?auto_173981 ) ) ( ON ?auto_173980 ?auto_173976 ) ( not ( = ?auto_173974 ?auto_173976 ) ) ( not ( = ?auto_173975 ?auto_173976 ) ) ( not ( = ?auto_173982 ?auto_173976 ) ) ( not ( = ?auto_173978 ?auto_173976 ) ) ( not ( = ?auto_173979 ?auto_173976 ) ) ( not ( = ?auto_173980 ?auto_173976 ) ) ( not ( = ?auto_173981 ?auto_173976 ) ) ( not ( = ?auto_173977 ?auto_173976 ) ) ( ON ?auto_173981 ?auto_173980 ) ( ON-TABLE ?auto_173976 ) ( ON ?auto_173977 ?auto_173981 ) ( CLEAR ?auto_173978 ) ( ON ?auto_173979 ?auto_173977 ) ( CLEAR ?auto_173979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173976 ?auto_173980 ?auto_173981 ?auto_173977 )
      ( MAKE-2PILE ?auto_173974 ?auto_173975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173983 - BLOCK
      ?auto_173984 - BLOCK
    )
    :vars
    (
      ?auto_173987 - BLOCK
      ?auto_173986 - BLOCK
      ?auto_173990 - BLOCK
      ?auto_173989 - BLOCK
      ?auto_173985 - BLOCK
      ?auto_173988 - BLOCK
      ?auto_173991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173987 ?auto_173984 ) ( ON-TABLE ?auto_173983 ) ( ON ?auto_173984 ?auto_173983 ) ( not ( = ?auto_173983 ?auto_173984 ) ) ( not ( = ?auto_173983 ?auto_173987 ) ) ( not ( = ?auto_173984 ?auto_173987 ) ) ( not ( = ?auto_173983 ?auto_173986 ) ) ( not ( = ?auto_173983 ?auto_173990 ) ) ( not ( = ?auto_173984 ?auto_173986 ) ) ( not ( = ?auto_173984 ?auto_173990 ) ) ( not ( = ?auto_173987 ?auto_173986 ) ) ( not ( = ?auto_173987 ?auto_173990 ) ) ( not ( = ?auto_173986 ?auto_173990 ) ) ( not ( = ?auto_173989 ?auto_173985 ) ) ( not ( = ?auto_173989 ?auto_173988 ) ) ( not ( = ?auto_173989 ?auto_173990 ) ) ( not ( = ?auto_173985 ?auto_173988 ) ) ( not ( = ?auto_173985 ?auto_173990 ) ) ( not ( = ?auto_173988 ?auto_173990 ) ) ( not ( = ?auto_173983 ?auto_173988 ) ) ( not ( = ?auto_173983 ?auto_173989 ) ) ( not ( = ?auto_173983 ?auto_173985 ) ) ( not ( = ?auto_173984 ?auto_173988 ) ) ( not ( = ?auto_173984 ?auto_173989 ) ) ( not ( = ?auto_173984 ?auto_173985 ) ) ( not ( = ?auto_173987 ?auto_173988 ) ) ( not ( = ?auto_173987 ?auto_173989 ) ) ( not ( = ?auto_173987 ?auto_173985 ) ) ( not ( = ?auto_173986 ?auto_173988 ) ) ( not ( = ?auto_173986 ?auto_173989 ) ) ( not ( = ?auto_173986 ?auto_173985 ) ) ( ON ?auto_173989 ?auto_173991 ) ( not ( = ?auto_173983 ?auto_173991 ) ) ( not ( = ?auto_173984 ?auto_173991 ) ) ( not ( = ?auto_173987 ?auto_173991 ) ) ( not ( = ?auto_173986 ?auto_173991 ) ) ( not ( = ?auto_173990 ?auto_173991 ) ) ( not ( = ?auto_173989 ?auto_173991 ) ) ( not ( = ?auto_173985 ?auto_173991 ) ) ( not ( = ?auto_173988 ?auto_173991 ) ) ( ON ?auto_173985 ?auto_173989 ) ( ON-TABLE ?auto_173991 ) ( ON ?auto_173988 ?auto_173985 ) ( ON ?auto_173990 ?auto_173988 ) ( CLEAR ?auto_173990 ) ( HOLDING ?auto_173986 ) ( CLEAR ?auto_173987 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173983 ?auto_173984 ?auto_173987 ?auto_173986 )
      ( MAKE-2PILE ?auto_173983 ?auto_173984 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_173992 - BLOCK
      ?auto_173993 - BLOCK
    )
    :vars
    (
      ?auto_173994 - BLOCK
      ?auto_173995 - BLOCK
      ?auto_174000 - BLOCK
      ?auto_173997 - BLOCK
      ?auto_173998 - BLOCK
      ?auto_173999 - BLOCK
      ?auto_173996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173994 ?auto_173993 ) ( ON-TABLE ?auto_173992 ) ( ON ?auto_173993 ?auto_173992 ) ( not ( = ?auto_173992 ?auto_173993 ) ) ( not ( = ?auto_173992 ?auto_173994 ) ) ( not ( = ?auto_173993 ?auto_173994 ) ) ( not ( = ?auto_173992 ?auto_173995 ) ) ( not ( = ?auto_173992 ?auto_174000 ) ) ( not ( = ?auto_173993 ?auto_173995 ) ) ( not ( = ?auto_173993 ?auto_174000 ) ) ( not ( = ?auto_173994 ?auto_173995 ) ) ( not ( = ?auto_173994 ?auto_174000 ) ) ( not ( = ?auto_173995 ?auto_174000 ) ) ( not ( = ?auto_173997 ?auto_173998 ) ) ( not ( = ?auto_173997 ?auto_173999 ) ) ( not ( = ?auto_173997 ?auto_174000 ) ) ( not ( = ?auto_173998 ?auto_173999 ) ) ( not ( = ?auto_173998 ?auto_174000 ) ) ( not ( = ?auto_173999 ?auto_174000 ) ) ( not ( = ?auto_173992 ?auto_173999 ) ) ( not ( = ?auto_173992 ?auto_173997 ) ) ( not ( = ?auto_173992 ?auto_173998 ) ) ( not ( = ?auto_173993 ?auto_173999 ) ) ( not ( = ?auto_173993 ?auto_173997 ) ) ( not ( = ?auto_173993 ?auto_173998 ) ) ( not ( = ?auto_173994 ?auto_173999 ) ) ( not ( = ?auto_173994 ?auto_173997 ) ) ( not ( = ?auto_173994 ?auto_173998 ) ) ( not ( = ?auto_173995 ?auto_173999 ) ) ( not ( = ?auto_173995 ?auto_173997 ) ) ( not ( = ?auto_173995 ?auto_173998 ) ) ( ON ?auto_173997 ?auto_173996 ) ( not ( = ?auto_173992 ?auto_173996 ) ) ( not ( = ?auto_173993 ?auto_173996 ) ) ( not ( = ?auto_173994 ?auto_173996 ) ) ( not ( = ?auto_173995 ?auto_173996 ) ) ( not ( = ?auto_174000 ?auto_173996 ) ) ( not ( = ?auto_173997 ?auto_173996 ) ) ( not ( = ?auto_173998 ?auto_173996 ) ) ( not ( = ?auto_173999 ?auto_173996 ) ) ( ON ?auto_173998 ?auto_173997 ) ( ON-TABLE ?auto_173996 ) ( ON ?auto_173999 ?auto_173998 ) ( ON ?auto_174000 ?auto_173999 ) ( CLEAR ?auto_173994 ) ( ON ?auto_173995 ?auto_174000 ) ( CLEAR ?auto_173995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173996 ?auto_173997 ?auto_173998 ?auto_173999 ?auto_174000 )
      ( MAKE-2PILE ?auto_173992 ?auto_173993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174019 - BLOCK
      ?auto_174020 - BLOCK
    )
    :vars
    (
      ?auto_174022 - BLOCK
      ?auto_174025 - BLOCK
      ?auto_174024 - BLOCK
      ?auto_174023 - BLOCK
      ?auto_174021 - BLOCK
      ?auto_174026 - BLOCK
      ?auto_174027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174019 ) ( not ( = ?auto_174019 ?auto_174020 ) ) ( not ( = ?auto_174019 ?auto_174022 ) ) ( not ( = ?auto_174020 ?auto_174022 ) ) ( not ( = ?auto_174019 ?auto_174025 ) ) ( not ( = ?auto_174019 ?auto_174024 ) ) ( not ( = ?auto_174020 ?auto_174025 ) ) ( not ( = ?auto_174020 ?auto_174024 ) ) ( not ( = ?auto_174022 ?auto_174025 ) ) ( not ( = ?auto_174022 ?auto_174024 ) ) ( not ( = ?auto_174025 ?auto_174024 ) ) ( not ( = ?auto_174023 ?auto_174021 ) ) ( not ( = ?auto_174023 ?auto_174026 ) ) ( not ( = ?auto_174023 ?auto_174024 ) ) ( not ( = ?auto_174021 ?auto_174026 ) ) ( not ( = ?auto_174021 ?auto_174024 ) ) ( not ( = ?auto_174026 ?auto_174024 ) ) ( not ( = ?auto_174019 ?auto_174026 ) ) ( not ( = ?auto_174019 ?auto_174023 ) ) ( not ( = ?auto_174019 ?auto_174021 ) ) ( not ( = ?auto_174020 ?auto_174026 ) ) ( not ( = ?auto_174020 ?auto_174023 ) ) ( not ( = ?auto_174020 ?auto_174021 ) ) ( not ( = ?auto_174022 ?auto_174026 ) ) ( not ( = ?auto_174022 ?auto_174023 ) ) ( not ( = ?auto_174022 ?auto_174021 ) ) ( not ( = ?auto_174025 ?auto_174026 ) ) ( not ( = ?auto_174025 ?auto_174023 ) ) ( not ( = ?auto_174025 ?auto_174021 ) ) ( ON ?auto_174023 ?auto_174027 ) ( not ( = ?auto_174019 ?auto_174027 ) ) ( not ( = ?auto_174020 ?auto_174027 ) ) ( not ( = ?auto_174022 ?auto_174027 ) ) ( not ( = ?auto_174025 ?auto_174027 ) ) ( not ( = ?auto_174024 ?auto_174027 ) ) ( not ( = ?auto_174023 ?auto_174027 ) ) ( not ( = ?auto_174021 ?auto_174027 ) ) ( not ( = ?auto_174026 ?auto_174027 ) ) ( ON ?auto_174021 ?auto_174023 ) ( ON-TABLE ?auto_174027 ) ( ON ?auto_174026 ?auto_174021 ) ( ON ?auto_174024 ?auto_174026 ) ( ON ?auto_174025 ?auto_174024 ) ( ON ?auto_174022 ?auto_174025 ) ( CLEAR ?auto_174022 ) ( HOLDING ?auto_174020 ) ( CLEAR ?auto_174019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174019 ?auto_174020 ?auto_174022 )
      ( MAKE-2PILE ?auto_174019 ?auto_174020 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174028 - BLOCK
      ?auto_174029 - BLOCK
    )
    :vars
    (
      ?auto_174032 - BLOCK
      ?auto_174033 - BLOCK
      ?auto_174031 - BLOCK
      ?auto_174035 - BLOCK
      ?auto_174030 - BLOCK
      ?auto_174036 - BLOCK
      ?auto_174034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174028 ) ( not ( = ?auto_174028 ?auto_174029 ) ) ( not ( = ?auto_174028 ?auto_174032 ) ) ( not ( = ?auto_174029 ?auto_174032 ) ) ( not ( = ?auto_174028 ?auto_174033 ) ) ( not ( = ?auto_174028 ?auto_174031 ) ) ( not ( = ?auto_174029 ?auto_174033 ) ) ( not ( = ?auto_174029 ?auto_174031 ) ) ( not ( = ?auto_174032 ?auto_174033 ) ) ( not ( = ?auto_174032 ?auto_174031 ) ) ( not ( = ?auto_174033 ?auto_174031 ) ) ( not ( = ?auto_174035 ?auto_174030 ) ) ( not ( = ?auto_174035 ?auto_174036 ) ) ( not ( = ?auto_174035 ?auto_174031 ) ) ( not ( = ?auto_174030 ?auto_174036 ) ) ( not ( = ?auto_174030 ?auto_174031 ) ) ( not ( = ?auto_174036 ?auto_174031 ) ) ( not ( = ?auto_174028 ?auto_174036 ) ) ( not ( = ?auto_174028 ?auto_174035 ) ) ( not ( = ?auto_174028 ?auto_174030 ) ) ( not ( = ?auto_174029 ?auto_174036 ) ) ( not ( = ?auto_174029 ?auto_174035 ) ) ( not ( = ?auto_174029 ?auto_174030 ) ) ( not ( = ?auto_174032 ?auto_174036 ) ) ( not ( = ?auto_174032 ?auto_174035 ) ) ( not ( = ?auto_174032 ?auto_174030 ) ) ( not ( = ?auto_174033 ?auto_174036 ) ) ( not ( = ?auto_174033 ?auto_174035 ) ) ( not ( = ?auto_174033 ?auto_174030 ) ) ( ON ?auto_174035 ?auto_174034 ) ( not ( = ?auto_174028 ?auto_174034 ) ) ( not ( = ?auto_174029 ?auto_174034 ) ) ( not ( = ?auto_174032 ?auto_174034 ) ) ( not ( = ?auto_174033 ?auto_174034 ) ) ( not ( = ?auto_174031 ?auto_174034 ) ) ( not ( = ?auto_174035 ?auto_174034 ) ) ( not ( = ?auto_174030 ?auto_174034 ) ) ( not ( = ?auto_174036 ?auto_174034 ) ) ( ON ?auto_174030 ?auto_174035 ) ( ON-TABLE ?auto_174034 ) ( ON ?auto_174036 ?auto_174030 ) ( ON ?auto_174031 ?auto_174036 ) ( ON ?auto_174033 ?auto_174031 ) ( ON ?auto_174032 ?auto_174033 ) ( CLEAR ?auto_174028 ) ( ON ?auto_174029 ?auto_174032 ) ( CLEAR ?auto_174029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174034 ?auto_174035 ?auto_174030 ?auto_174036 ?auto_174031 ?auto_174033 ?auto_174032 )
      ( MAKE-2PILE ?auto_174028 ?auto_174029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174037 - BLOCK
      ?auto_174038 - BLOCK
    )
    :vars
    (
      ?auto_174039 - BLOCK
      ?auto_174043 - BLOCK
      ?auto_174040 - BLOCK
      ?auto_174044 - BLOCK
      ?auto_174042 - BLOCK
      ?auto_174045 - BLOCK
      ?auto_174041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174037 ?auto_174038 ) ) ( not ( = ?auto_174037 ?auto_174039 ) ) ( not ( = ?auto_174038 ?auto_174039 ) ) ( not ( = ?auto_174037 ?auto_174043 ) ) ( not ( = ?auto_174037 ?auto_174040 ) ) ( not ( = ?auto_174038 ?auto_174043 ) ) ( not ( = ?auto_174038 ?auto_174040 ) ) ( not ( = ?auto_174039 ?auto_174043 ) ) ( not ( = ?auto_174039 ?auto_174040 ) ) ( not ( = ?auto_174043 ?auto_174040 ) ) ( not ( = ?auto_174044 ?auto_174042 ) ) ( not ( = ?auto_174044 ?auto_174045 ) ) ( not ( = ?auto_174044 ?auto_174040 ) ) ( not ( = ?auto_174042 ?auto_174045 ) ) ( not ( = ?auto_174042 ?auto_174040 ) ) ( not ( = ?auto_174045 ?auto_174040 ) ) ( not ( = ?auto_174037 ?auto_174045 ) ) ( not ( = ?auto_174037 ?auto_174044 ) ) ( not ( = ?auto_174037 ?auto_174042 ) ) ( not ( = ?auto_174038 ?auto_174045 ) ) ( not ( = ?auto_174038 ?auto_174044 ) ) ( not ( = ?auto_174038 ?auto_174042 ) ) ( not ( = ?auto_174039 ?auto_174045 ) ) ( not ( = ?auto_174039 ?auto_174044 ) ) ( not ( = ?auto_174039 ?auto_174042 ) ) ( not ( = ?auto_174043 ?auto_174045 ) ) ( not ( = ?auto_174043 ?auto_174044 ) ) ( not ( = ?auto_174043 ?auto_174042 ) ) ( ON ?auto_174044 ?auto_174041 ) ( not ( = ?auto_174037 ?auto_174041 ) ) ( not ( = ?auto_174038 ?auto_174041 ) ) ( not ( = ?auto_174039 ?auto_174041 ) ) ( not ( = ?auto_174043 ?auto_174041 ) ) ( not ( = ?auto_174040 ?auto_174041 ) ) ( not ( = ?auto_174044 ?auto_174041 ) ) ( not ( = ?auto_174042 ?auto_174041 ) ) ( not ( = ?auto_174045 ?auto_174041 ) ) ( ON ?auto_174042 ?auto_174044 ) ( ON-TABLE ?auto_174041 ) ( ON ?auto_174045 ?auto_174042 ) ( ON ?auto_174040 ?auto_174045 ) ( ON ?auto_174043 ?auto_174040 ) ( ON ?auto_174039 ?auto_174043 ) ( ON ?auto_174038 ?auto_174039 ) ( CLEAR ?auto_174038 ) ( HOLDING ?auto_174037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174037 )
      ( MAKE-2PILE ?auto_174037 ?auto_174038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_174046 - BLOCK
      ?auto_174047 - BLOCK
    )
    :vars
    (
      ?auto_174051 - BLOCK
      ?auto_174049 - BLOCK
      ?auto_174054 - BLOCK
      ?auto_174052 - BLOCK
      ?auto_174050 - BLOCK
      ?auto_174053 - BLOCK
      ?auto_174048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174046 ?auto_174047 ) ) ( not ( = ?auto_174046 ?auto_174051 ) ) ( not ( = ?auto_174047 ?auto_174051 ) ) ( not ( = ?auto_174046 ?auto_174049 ) ) ( not ( = ?auto_174046 ?auto_174054 ) ) ( not ( = ?auto_174047 ?auto_174049 ) ) ( not ( = ?auto_174047 ?auto_174054 ) ) ( not ( = ?auto_174051 ?auto_174049 ) ) ( not ( = ?auto_174051 ?auto_174054 ) ) ( not ( = ?auto_174049 ?auto_174054 ) ) ( not ( = ?auto_174052 ?auto_174050 ) ) ( not ( = ?auto_174052 ?auto_174053 ) ) ( not ( = ?auto_174052 ?auto_174054 ) ) ( not ( = ?auto_174050 ?auto_174053 ) ) ( not ( = ?auto_174050 ?auto_174054 ) ) ( not ( = ?auto_174053 ?auto_174054 ) ) ( not ( = ?auto_174046 ?auto_174053 ) ) ( not ( = ?auto_174046 ?auto_174052 ) ) ( not ( = ?auto_174046 ?auto_174050 ) ) ( not ( = ?auto_174047 ?auto_174053 ) ) ( not ( = ?auto_174047 ?auto_174052 ) ) ( not ( = ?auto_174047 ?auto_174050 ) ) ( not ( = ?auto_174051 ?auto_174053 ) ) ( not ( = ?auto_174051 ?auto_174052 ) ) ( not ( = ?auto_174051 ?auto_174050 ) ) ( not ( = ?auto_174049 ?auto_174053 ) ) ( not ( = ?auto_174049 ?auto_174052 ) ) ( not ( = ?auto_174049 ?auto_174050 ) ) ( ON ?auto_174052 ?auto_174048 ) ( not ( = ?auto_174046 ?auto_174048 ) ) ( not ( = ?auto_174047 ?auto_174048 ) ) ( not ( = ?auto_174051 ?auto_174048 ) ) ( not ( = ?auto_174049 ?auto_174048 ) ) ( not ( = ?auto_174054 ?auto_174048 ) ) ( not ( = ?auto_174052 ?auto_174048 ) ) ( not ( = ?auto_174050 ?auto_174048 ) ) ( not ( = ?auto_174053 ?auto_174048 ) ) ( ON ?auto_174050 ?auto_174052 ) ( ON-TABLE ?auto_174048 ) ( ON ?auto_174053 ?auto_174050 ) ( ON ?auto_174054 ?auto_174053 ) ( ON ?auto_174049 ?auto_174054 ) ( ON ?auto_174051 ?auto_174049 ) ( ON ?auto_174047 ?auto_174051 ) ( ON ?auto_174046 ?auto_174047 ) ( CLEAR ?auto_174046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174048 ?auto_174052 ?auto_174050 ?auto_174053 ?auto_174054 ?auto_174049 ?auto_174051 ?auto_174047 )
      ( MAKE-2PILE ?auto_174046 ?auto_174047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174061 - BLOCK
      ?auto_174062 - BLOCK
      ?auto_174063 - BLOCK
      ?auto_174064 - BLOCK
      ?auto_174065 - BLOCK
      ?auto_174066 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_174066 ) ( CLEAR ?auto_174065 ) ( ON-TABLE ?auto_174061 ) ( ON ?auto_174062 ?auto_174061 ) ( ON ?auto_174063 ?auto_174062 ) ( ON ?auto_174064 ?auto_174063 ) ( ON ?auto_174065 ?auto_174064 ) ( not ( = ?auto_174061 ?auto_174062 ) ) ( not ( = ?auto_174061 ?auto_174063 ) ) ( not ( = ?auto_174061 ?auto_174064 ) ) ( not ( = ?auto_174061 ?auto_174065 ) ) ( not ( = ?auto_174061 ?auto_174066 ) ) ( not ( = ?auto_174062 ?auto_174063 ) ) ( not ( = ?auto_174062 ?auto_174064 ) ) ( not ( = ?auto_174062 ?auto_174065 ) ) ( not ( = ?auto_174062 ?auto_174066 ) ) ( not ( = ?auto_174063 ?auto_174064 ) ) ( not ( = ?auto_174063 ?auto_174065 ) ) ( not ( = ?auto_174063 ?auto_174066 ) ) ( not ( = ?auto_174064 ?auto_174065 ) ) ( not ( = ?auto_174064 ?auto_174066 ) ) ( not ( = ?auto_174065 ?auto_174066 ) ) )
    :subtasks
    ( ( !STACK ?auto_174066 ?auto_174065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174067 - BLOCK
      ?auto_174068 - BLOCK
      ?auto_174069 - BLOCK
      ?auto_174070 - BLOCK
      ?auto_174071 - BLOCK
      ?auto_174072 - BLOCK
    )
    :vars
    (
      ?auto_174073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174071 ) ( ON-TABLE ?auto_174067 ) ( ON ?auto_174068 ?auto_174067 ) ( ON ?auto_174069 ?auto_174068 ) ( ON ?auto_174070 ?auto_174069 ) ( ON ?auto_174071 ?auto_174070 ) ( not ( = ?auto_174067 ?auto_174068 ) ) ( not ( = ?auto_174067 ?auto_174069 ) ) ( not ( = ?auto_174067 ?auto_174070 ) ) ( not ( = ?auto_174067 ?auto_174071 ) ) ( not ( = ?auto_174067 ?auto_174072 ) ) ( not ( = ?auto_174068 ?auto_174069 ) ) ( not ( = ?auto_174068 ?auto_174070 ) ) ( not ( = ?auto_174068 ?auto_174071 ) ) ( not ( = ?auto_174068 ?auto_174072 ) ) ( not ( = ?auto_174069 ?auto_174070 ) ) ( not ( = ?auto_174069 ?auto_174071 ) ) ( not ( = ?auto_174069 ?auto_174072 ) ) ( not ( = ?auto_174070 ?auto_174071 ) ) ( not ( = ?auto_174070 ?auto_174072 ) ) ( not ( = ?auto_174071 ?auto_174072 ) ) ( ON ?auto_174072 ?auto_174073 ) ( CLEAR ?auto_174072 ) ( HAND-EMPTY ) ( not ( = ?auto_174067 ?auto_174073 ) ) ( not ( = ?auto_174068 ?auto_174073 ) ) ( not ( = ?auto_174069 ?auto_174073 ) ) ( not ( = ?auto_174070 ?auto_174073 ) ) ( not ( = ?auto_174071 ?auto_174073 ) ) ( not ( = ?auto_174072 ?auto_174073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174072 ?auto_174073 )
      ( MAKE-6PILE ?auto_174067 ?auto_174068 ?auto_174069 ?auto_174070 ?auto_174071 ?auto_174072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174074 - BLOCK
      ?auto_174075 - BLOCK
      ?auto_174076 - BLOCK
      ?auto_174077 - BLOCK
      ?auto_174078 - BLOCK
      ?auto_174079 - BLOCK
    )
    :vars
    (
      ?auto_174080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174074 ) ( ON ?auto_174075 ?auto_174074 ) ( ON ?auto_174076 ?auto_174075 ) ( ON ?auto_174077 ?auto_174076 ) ( not ( = ?auto_174074 ?auto_174075 ) ) ( not ( = ?auto_174074 ?auto_174076 ) ) ( not ( = ?auto_174074 ?auto_174077 ) ) ( not ( = ?auto_174074 ?auto_174078 ) ) ( not ( = ?auto_174074 ?auto_174079 ) ) ( not ( = ?auto_174075 ?auto_174076 ) ) ( not ( = ?auto_174075 ?auto_174077 ) ) ( not ( = ?auto_174075 ?auto_174078 ) ) ( not ( = ?auto_174075 ?auto_174079 ) ) ( not ( = ?auto_174076 ?auto_174077 ) ) ( not ( = ?auto_174076 ?auto_174078 ) ) ( not ( = ?auto_174076 ?auto_174079 ) ) ( not ( = ?auto_174077 ?auto_174078 ) ) ( not ( = ?auto_174077 ?auto_174079 ) ) ( not ( = ?auto_174078 ?auto_174079 ) ) ( ON ?auto_174079 ?auto_174080 ) ( CLEAR ?auto_174079 ) ( not ( = ?auto_174074 ?auto_174080 ) ) ( not ( = ?auto_174075 ?auto_174080 ) ) ( not ( = ?auto_174076 ?auto_174080 ) ) ( not ( = ?auto_174077 ?auto_174080 ) ) ( not ( = ?auto_174078 ?auto_174080 ) ) ( not ( = ?auto_174079 ?auto_174080 ) ) ( HOLDING ?auto_174078 ) ( CLEAR ?auto_174077 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174074 ?auto_174075 ?auto_174076 ?auto_174077 ?auto_174078 )
      ( MAKE-6PILE ?auto_174074 ?auto_174075 ?auto_174076 ?auto_174077 ?auto_174078 ?auto_174079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174081 - BLOCK
      ?auto_174082 - BLOCK
      ?auto_174083 - BLOCK
      ?auto_174084 - BLOCK
      ?auto_174085 - BLOCK
      ?auto_174086 - BLOCK
    )
    :vars
    (
      ?auto_174087 - BLOCK
      ?auto_174088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174081 ) ( ON ?auto_174082 ?auto_174081 ) ( ON ?auto_174083 ?auto_174082 ) ( ON ?auto_174084 ?auto_174083 ) ( not ( = ?auto_174081 ?auto_174082 ) ) ( not ( = ?auto_174081 ?auto_174083 ) ) ( not ( = ?auto_174081 ?auto_174084 ) ) ( not ( = ?auto_174081 ?auto_174085 ) ) ( not ( = ?auto_174081 ?auto_174086 ) ) ( not ( = ?auto_174082 ?auto_174083 ) ) ( not ( = ?auto_174082 ?auto_174084 ) ) ( not ( = ?auto_174082 ?auto_174085 ) ) ( not ( = ?auto_174082 ?auto_174086 ) ) ( not ( = ?auto_174083 ?auto_174084 ) ) ( not ( = ?auto_174083 ?auto_174085 ) ) ( not ( = ?auto_174083 ?auto_174086 ) ) ( not ( = ?auto_174084 ?auto_174085 ) ) ( not ( = ?auto_174084 ?auto_174086 ) ) ( not ( = ?auto_174085 ?auto_174086 ) ) ( ON ?auto_174086 ?auto_174087 ) ( not ( = ?auto_174081 ?auto_174087 ) ) ( not ( = ?auto_174082 ?auto_174087 ) ) ( not ( = ?auto_174083 ?auto_174087 ) ) ( not ( = ?auto_174084 ?auto_174087 ) ) ( not ( = ?auto_174085 ?auto_174087 ) ) ( not ( = ?auto_174086 ?auto_174087 ) ) ( CLEAR ?auto_174084 ) ( ON ?auto_174085 ?auto_174086 ) ( CLEAR ?auto_174085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174088 ) ( ON ?auto_174087 ?auto_174088 ) ( not ( = ?auto_174088 ?auto_174087 ) ) ( not ( = ?auto_174088 ?auto_174086 ) ) ( not ( = ?auto_174088 ?auto_174085 ) ) ( not ( = ?auto_174081 ?auto_174088 ) ) ( not ( = ?auto_174082 ?auto_174088 ) ) ( not ( = ?auto_174083 ?auto_174088 ) ) ( not ( = ?auto_174084 ?auto_174088 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174088 ?auto_174087 ?auto_174086 )
      ( MAKE-6PILE ?auto_174081 ?auto_174082 ?auto_174083 ?auto_174084 ?auto_174085 ?auto_174086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174089 - BLOCK
      ?auto_174090 - BLOCK
      ?auto_174091 - BLOCK
      ?auto_174092 - BLOCK
      ?auto_174093 - BLOCK
      ?auto_174094 - BLOCK
    )
    :vars
    (
      ?auto_174096 - BLOCK
      ?auto_174095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174089 ) ( ON ?auto_174090 ?auto_174089 ) ( ON ?auto_174091 ?auto_174090 ) ( not ( = ?auto_174089 ?auto_174090 ) ) ( not ( = ?auto_174089 ?auto_174091 ) ) ( not ( = ?auto_174089 ?auto_174092 ) ) ( not ( = ?auto_174089 ?auto_174093 ) ) ( not ( = ?auto_174089 ?auto_174094 ) ) ( not ( = ?auto_174090 ?auto_174091 ) ) ( not ( = ?auto_174090 ?auto_174092 ) ) ( not ( = ?auto_174090 ?auto_174093 ) ) ( not ( = ?auto_174090 ?auto_174094 ) ) ( not ( = ?auto_174091 ?auto_174092 ) ) ( not ( = ?auto_174091 ?auto_174093 ) ) ( not ( = ?auto_174091 ?auto_174094 ) ) ( not ( = ?auto_174092 ?auto_174093 ) ) ( not ( = ?auto_174092 ?auto_174094 ) ) ( not ( = ?auto_174093 ?auto_174094 ) ) ( ON ?auto_174094 ?auto_174096 ) ( not ( = ?auto_174089 ?auto_174096 ) ) ( not ( = ?auto_174090 ?auto_174096 ) ) ( not ( = ?auto_174091 ?auto_174096 ) ) ( not ( = ?auto_174092 ?auto_174096 ) ) ( not ( = ?auto_174093 ?auto_174096 ) ) ( not ( = ?auto_174094 ?auto_174096 ) ) ( ON ?auto_174093 ?auto_174094 ) ( CLEAR ?auto_174093 ) ( ON-TABLE ?auto_174095 ) ( ON ?auto_174096 ?auto_174095 ) ( not ( = ?auto_174095 ?auto_174096 ) ) ( not ( = ?auto_174095 ?auto_174094 ) ) ( not ( = ?auto_174095 ?auto_174093 ) ) ( not ( = ?auto_174089 ?auto_174095 ) ) ( not ( = ?auto_174090 ?auto_174095 ) ) ( not ( = ?auto_174091 ?auto_174095 ) ) ( not ( = ?auto_174092 ?auto_174095 ) ) ( HOLDING ?auto_174092 ) ( CLEAR ?auto_174091 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174089 ?auto_174090 ?auto_174091 ?auto_174092 )
      ( MAKE-6PILE ?auto_174089 ?auto_174090 ?auto_174091 ?auto_174092 ?auto_174093 ?auto_174094 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174097 - BLOCK
      ?auto_174098 - BLOCK
      ?auto_174099 - BLOCK
      ?auto_174100 - BLOCK
      ?auto_174101 - BLOCK
      ?auto_174102 - BLOCK
    )
    :vars
    (
      ?auto_174104 - BLOCK
      ?auto_174103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174097 ) ( ON ?auto_174098 ?auto_174097 ) ( ON ?auto_174099 ?auto_174098 ) ( not ( = ?auto_174097 ?auto_174098 ) ) ( not ( = ?auto_174097 ?auto_174099 ) ) ( not ( = ?auto_174097 ?auto_174100 ) ) ( not ( = ?auto_174097 ?auto_174101 ) ) ( not ( = ?auto_174097 ?auto_174102 ) ) ( not ( = ?auto_174098 ?auto_174099 ) ) ( not ( = ?auto_174098 ?auto_174100 ) ) ( not ( = ?auto_174098 ?auto_174101 ) ) ( not ( = ?auto_174098 ?auto_174102 ) ) ( not ( = ?auto_174099 ?auto_174100 ) ) ( not ( = ?auto_174099 ?auto_174101 ) ) ( not ( = ?auto_174099 ?auto_174102 ) ) ( not ( = ?auto_174100 ?auto_174101 ) ) ( not ( = ?auto_174100 ?auto_174102 ) ) ( not ( = ?auto_174101 ?auto_174102 ) ) ( ON ?auto_174102 ?auto_174104 ) ( not ( = ?auto_174097 ?auto_174104 ) ) ( not ( = ?auto_174098 ?auto_174104 ) ) ( not ( = ?auto_174099 ?auto_174104 ) ) ( not ( = ?auto_174100 ?auto_174104 ) ) ( not ( = ?auto_174101 ?auto_174104 ) ) ( not ( = ?auto_174102 ?auto_174104 ) ) ( ON ?auto_174101 ?auto_174102 ) ( ON-TABLE ?auto_174103 ) ( ON ?auto_174104 ?auto_174103 ) ( not ( = ?auto_174103 ?auto_174104 ) ) ( not ( = ?auto_174103 ?auto_174102 ) ) ( not ( = ?auto_174103 ?auto_174101 ) ) ( not ( = ?auto_174097 ?auto_174103 ) ) ( not ( = ?auto_174098 ?auto_174103 ) ) ( not ( = ?auto_174099 ?auto_174103 ) ) ( not ( = ?auto_174100 ?auto_174103 ) ) ( CLEAR ?auto_174099 ) ( ON ?auto_174100 ?auto_174101 ) ( CLEAR ?auto_174100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174103 ?auto_174104 ?auto_174102 ?auto_174101 )
      ( MAKE-6PILE ?auto_174097 ?auto_174098 ?auto_174099 ?auto_174100 ?auto_174101 ?auto_174102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174105 - BLOCK
      ?auto_174106 - BLOCK
      ?auto_174107 - BLOCK
      ?auto_174108 - BLOCK
      ?auto_174109 - BLOCK
      ?auto_174110 - BLOCK
    )
    :vars
    (
      ?auto_174112 - BLOCK
      ?auto_174111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174105 ) ( ON ?auto_174106 ?auto_174105 ) ( not ( = ?auto_174105 ?auto_174106 ) ) ( not ( = ?auto_174105 ?auto_174107 ) ) ( not ( = ?auto_174105 ?auto_174108 ) ) ( not ( = ?auto_174105 ?auto_174109 ) ) ( not ( = ?auto_174105 ?auto_174110 ) ) ( not ( = ?auto_174106 ?auto_174107 ) ) ( not ( = ?auto_174106 ?auto_174108 ) ) ( not ( = ?auto_174106 ?auto_174109 ) ) ( not ( = ?auto_174106 ?auto_174110 ) ) ( not ( = ?auto_174107 ?auto_174108 ) ) ( not ( = ?auto_174107 ?auto_174109 ) ) ( not ( = ?auto_174107 ?auto_174110 ) ) ( not ( = ?auto_174108 ?auto_174109 ) ) ( not ( = ?auto_174108 ?auto_174110 ) ) ( not ( = ?auto_174109 ?auto_174110 ) ) ( ON ?auto_174110 ?auto_174112 ) ( not ( = ?auto_174105 ?auto_174112 ) ) ( not ( = ?auto_174106 ?auto_174112 ) ) ( not ( = ?auto_174107 ?auto_174112 ) ) ( not ( = ?auto_174108 ?auto_174112 ) ) ( not ( = ?auto_174109 ?auto_174112 ) ) ( not ( = ?auto_174110 ?auto_174112 ) ) ( ON ?auto_174109 ?auto_174110 ) ( ON-TABLE ?auto_174111 ) ( ON ?auto_174112 ?auto_174111 ) ( not ( = ?auto_174111 ?auto_174112 ) ) ( not ( = ?auto_174111 ?auto_174110 ) ) ( not ( = ?auto_174111 ?auto_174109 ) ) ( not ( = ?auto_174105 ?auto_174111 ) ) ( not ( = ?auto_174106 ?auto_174111 ) ) ( not ( = ?auto_174107 ?auto_174111 ) ) ( not ( = ?auto_174108 ?auto_174111 ) ) ( ON ?auto_174108 ?auto_174109 ) ( CLEAR ?auto_174108 ) ( HOLDING ?auto_174107 ) ( CLEAR ?auto_174106 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174105 ?auto_174106 ?auto_174107 )
      ( MAKE-6PILE ?auto_174105 ?auto_174106 ?auto_174107 ?auto_174108 ?auto_174109 ?auto_174110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174113 - BLOCK
      ?auto_174114 - BLOCK
      ?auto_174115 - BLOCK
      ?auto_174116 - BLOCK
      ?auto_174117 - BLOCK
      ?auto_174118 - BLOCK
    )
    :vars
    (
      ?auto_174120 - BLOCK
      ?auto_174119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174113 ) ( ON ?auto_174114 ?auto_174113 ) ( not ( = ?auto_174113 ?auto_174114 ) ) ( not ( = ?auto_174113 ?auto_174115 ) ) ( not ( = ?auto_174113 ?auto_174116 ) ) ( not ( = ?auto_174113 ?auto_174117 ) ) ( not ( = ?auto_174113 ?auto_174118 ) ) ( not ( = ?auto_174114 ?auto_174115 ) ) ( not ( = ?auto_174114 ?auto_174116 ) ) ( not ( = ?auto_174114 ?auto_174117 ) ) ( not ( = ?auto_174114 ?auto_174118 ) ) ( not ( = ?auto_174115 ?auto_174116 ) ) ( not ( = ?auto_174115 ?auto_174117 ) ) ( not ( = ?auto_174115 ?auto_174118 ) ) ( not ( = ?auto_174116 ?auto_174117 ) ) ( not ( = ?auto_174116 ?auto_174118 ) ) ( not ( = ?auto_174117 ?auto_174118 ) ) ( ON ?auto_174118 ?auto_174120 ) ( not ( = ?auto_174113 ?auto_174120 ) ) ( not ( = ?auto_174114 ?auto_174120 ) ) ( not ( = ?auto_174115 ?auto_174120 ) ) ( not ( = ?auto_174116 ?auto_174120 ) ) ( not ( = ?auto_174117 ?auto_174120 ) ) ( not ( = ?auto_174118 ?auto_174120 ) ) ( ON ?auto_174117 ?auto_174118 ) ( ON-TABLE ?auto_174119 ) ( ON ?auto_174120 ?auto_174119 ) ( not ( = ?auto_174119 ?auto_174120 ) ) ( not ( = ?auto_174119 ?auto_174118 ) ) ( not ( = ?auto_174119 ?auto_174117 ) ) ( not ( = ?auto_174113 ?auto_174119 ) ) ( not ( = ?auto_174114 ?auto_174119 ) ) ( not ( = ?auto_174115 ?auto_174119 ) ) ( not ( = ?auto_174116 ?auto_174119 ) ) ( ON ?auto_174116 ?auto_174117 ) ( CLEAR ?auto_174114 ) ( ON ?auto_174115 ?auto_174116 ) ( CLEAR ?auto_174115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174119 ?auto_174120 ?auto_174118 ?auto_174117 ?auto_174116 )
      ( MAKE-6PILE ?auto_174113 ?auto_174114 ?auto_174115 ?auto_174116 ?auto_174117 ?auto_174118 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174121 - BLOCK
      ?auto_174122 - BLOCK
      ?auto_174123 - BLOCK
      ?auto_174124 - BLOCK
      ?auto_174125 - BLOCK
      ?auto_174126 - BLOCK
    )
    :vars
    (
      ?auto_174128 - BLOCK
      ?auto_174127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174121 ) ( not ( = ?auto_174121 ?auto_174122 ) ) ( not ( = ?auto_174121 ?auto_174123 ) ) ( not ( = ?auto_174121 ?auto_174124 ) ) ( not ( = ?auto_174121 ?auto_174125 ) ) ( not ( = ?auto_174121 ?auto_174126 ) ) ( not ( = ?auto_174122 ?auto_174123 ) ) ( not ( = ?auto_174122 ?auto_174124 ) ) ( not ( = ?auto_174122 ?auto_174125 ) ) ( not ( = ?auto_174122 ?auto_174126 ) ) ( not ( = ?auto_174123 ?auto_174124 ) ) ( not ( = ?auto_174123 ?auto_174125 ) ) ( not ( = ?auto_174123 ?auto_174126 ) ) ( not ( = ?auto_174124 ?auto_174125 ) ) ( not ( = ?auto_174124 ?auto_174126 ) ) ( not ( = ?auto_174125 ?auto_174126 ) ) ( ON ?auto_174126 ?auto_174128 ) ( not ( = ?auto_174121 ?auto_174128 ) ) ( not ( = ?auto_174122 ?auto_174128 ) ) ( not ( = ?auto_174123 ?auto_174128 ) ) ( not ( = ?auto_174124 ?auto_174128 ) ) ( not ( = ?auto_174125 ?auto_174128 ) ) ( not ( = ?auto_174126 ?auto_174128 ) ) ( ON ?auto_174125 ?auto_174126 ) ( ON-TABLE ?auto_174127 ) ( ON ?auto_174128 ?auto_174127 ) ( not ( = ?auto_174127 ?auto_174128 ) ) ( not ( = ?auto_174127 ?auto_174126 ) ) ( not ( = ?auto_174127 ?auto_174125 ) ) ( not ( = ?auto_174121 ?auto_174127 ) ) ( not ( = ?auto_174122 ?auto_174127 ) ) ( not ( = ?auto_174123 ?auto_174127 ) ) ( not ( = ?auto_174124 ?auto_174127 ) ) ( ON ?auto_174124 ?auto_174125 ) ( ON ?auto_174123 ?auto_174124 ) ( CLEAR ?auto_174123 ) ( HOLDING ?auto_174122 ) ( CLEAR ?auto_174121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174121 ?auto_174122 )
      ( MAKE-6PILE ?auto_174121 ?auto_174122 ?auto_174123 ?auto_174124 ?auto_174125 ?auto_174126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174129 - BLOCK
      ?auto_174130 - BLOCK
      ?auto_174131 - BLOCK
      ?auto_174132 - BLOCK
      ?auto_174133 - BLOCK
      ?auto_174134 - BLOCK
    )
    :vars
    (
      ?auto_174136 - BLOCK
      ?auto_174135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174129 ) ( not ( = ?auto_174129 ?auto_174130 ) ) ( not ( = ?auto_174129 ?auto_174131 ) ) ( not ( = ?auto_174129 ?auto_174132 ) ) ( not ( = ?auto_174129 ?auto_174133 ) ) ( not ( = ?auto_174129 ?auto_174134 ) ) ( not ( = ?auto_174130 ?auto_174131 ) ) ( not ( = ?auto_174130 ?auto_174132 ) ) ( not ( = ?auto_174130 ?auto_174133 ) ) ( not ( = ?auto_174130 ?auto_174134 ) ) ( not ( = ?auto_174131 ?auto_174132 ) ) ( not ( = ?auto_174131 ?auto_174133 ) ) ( not ( = ?auto_174131 ?auto_174134 ) ) ( not ( = ?auto_174132 ?auto_174133 ) ) ( not ( = ?auto_174132 ?auto_174134 ) ) ( not ( = ?auto_174133 ?auto_174134 ) ) ( ON ?auto_174134 ?auto_174136 ) ( not ( = ?auto_174129 ?auto_174136 ) ) ( not ( = ?auto_174130 ?auto_174136 ) ) ( not ( = ?auto_174131 ?auto_174136 ) ) ( not ( = ?auto_174132 ?auto_174136 ) ) ( not ( = ?auto_174133 ?auto_174136 ) ) ( not ( = ?auto_174134 ?auto_174136 ) ) ( ON ?auto_174133 ?auto_174134 ) ( ON-TABLE ?auto_174135 ) ( ON ?auto_174136 ?auto_174135 ) ( not ( = ?auto_174135 ?auto_174136 ) ) ( not ( = ?auto_174135 ?auto_174134 ) ) ( not ( = ?auto_174135 ?auto_174133 ) ) ( not ( = ?auto_174129 ?auto_174135 ) ) ( not ( = ?auto_174130 ?auto_174135 ) ) ( not ( = ?auto_174131 ?auto_174135 ) ) ( not ( = ?auto_174132 ?auto_174135 ) ) ( ON ?auto_174132 ?auto_174133 ) ( ON ?auto_174131 ?auto_174132 ) ( CLEAR ?auto_174129 ) ( ON ?auto_174130 ?auto_174131 ) ( CLEAR ?auto_174130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174135 ?auto_174136 ?auto_174134 ?auto_174133 ?auto_174132 ?auto_174131 )
      ( MAKE-6PILE ?auto_174129 ?auto_174130 ?auto_174131 ?auto_174132 ?auto_174133 ?auto_174134 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174137 - BLOCK
      ?auto_174138 - BLOCK
      ?auto_174139 - BLOCK
      ?auto_174140 - BLOCK
      ?auto_174141 - BLOCK
      ?auto_174142 - BLOCK
    )
    :vars
    (
      ?auto_174143 - BLOCK
      ?auto_174144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174137 ?auto_174138 ) ) ( not ( = ?auto_174137 ?auto_174139 ) ) ( not ( = ?auto_174137 ?auto_174140 ) ) ( not ( = ?auto_174137 ?auto_174141 ) ) ( not ( = ?auto_174137 ?auto_174142 ) ) ( not ( = ?auto_174138 ?auto_174139 ) ) ( not ( = ?auto_174138 ?auto_174140 ) ) ( not ( = ?auto_174138 ?auto_174141 ) ) ( not ( = ?auto_174138 ?auto_174142 ) ) ( not ( = ?auto_174139 ?auto_174140 ) ) ( not ( = ?auto_174139 ?auto_174141 ) ) ( not ( = ?auto_174139 ?auto_174142 ) ) ( not ( = ?auto_174140 ?auto_174141 ) ) ( not ( = ?auto_174140 ?auto_174142 ) ) ( not ( = ?auto_174141 ?auto_174142 ) ) ( ON ?auto_174142 ?auto_174143 ) ( not ( = ?auto_174137 ?auto_174143 ) ) ( not ( = ?auto_174138 ?auto_174143 ) ) ( not ( = ?auto_174139 ?auto_174143 ) ) ( not ( = ?auto_174140 ?auto_174143 ) ) ( not ( = ?auto_174141 ?auto_174143 ) ) ( not ( = ?auto_174142 ?auto_174143 ) ) ( ON ?auto_174141 ?auto_174142 ) ( ON-TABLE ?auto_174144 ) ( ON ?auto_174143 ?auto_174144 ) ( not ( = ?auto_174144 ?auto_174143 ) ) ( not ( = ?auto_174144 ?auto_174142 ) ) ( not ( = ?auto_174144 ?auto_174141 ) ) ( not ( = ?auto_174137 ?auto_174144 ) ) ( not ( = ?auto_174138 ?auto_174144 ) ) ( not ( = ?auto_174139 ?auto_174144 ) ) ( not ( = ?auto_174140 ?auto_174144 ) ) ( ON ?auto_174140 ?auto_174141 ) ( ON ?auto_174139 ?auto_174140 ) ( ON ?auto_174138 ?auto_174139 ) ( CLEAR ?auto_174138 ) ( HOLDING ?auto_174137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174137 )
      ( MAKE-6PILE ?auto_174137 ?auto_174138 ?auto_174139 ?auto_174140 ?auto_174141 ?auto_174142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174145 - BLOCK
      ?auto_174146 - BLOCK
      ?auto_174147 - BLOCK
      ?auto_174148 - BLOCK
      ?auto_174149 - BLOCK
      ?auto_174150 - BLOCK
    )
    :vars
    (
      ?auto_174152 - BLOCK
      ?auto_174151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174145 ?auto_174146 ) ) ( not ( = ?auto_174145 ?auto_174147 ) ) ( not ( = ?auto_174145 ?auto_174148 ) ) ( not ( = ?auto_174145 ?auto_174149 ) ) ( not ( = ?auto_174145 ?auto_174150 ) ) ( not ( = ?auto_174146 ?auto_174147 ) ) ( not ( = ?auto_174146 ?auto_174148 ) ) ( not ( = ?auto_174146 ?auto_174149 ) ) ( not ( = ?auto_174146 ?auto_174150 ) ) ( not ( = ?auto_174147 ?auto_174148 ) ) ( not ( = ?auto_174147 ?auto_174149 ) ) ( not ( = ?auto_174147 ?auto_174150 ) ) ( not ( = ?auto_174148 ?auto_174149 ) ) ( not ( = ?auto_174148 ?auto_174150 ) ) ( not ( = ?auto_174149 ?auto_174150 ) ) ( ON ?auto_174150 ?auto_174152 ) ( not ( = ?auto_174145 ?auto_174152 ) ) ( not ( = ?auto_174146 ?auto_174152 ) ) ( not ( = ?auto_174147 ?auto_174152 ) ) ( not ( = ?auto_174148 ?auto_174152 ) ) ( not ( = ?auto_174149 ?auto_174152 ) ) ( not ( = ?auto_174150 ?auto_174152 ) ) ( ON ?auto_174149 ?auto_174150 ) ( ON-TABLE ?auto_174151 ) ( ON ?auto_174152 ?auto_174151 ) ( not ( = ?auto_174151 ?auto_174152 ) ) ( not ( = ?auto_174151 ?auto_174150 ) ) ( not ( = ?auto_174151 ?auto_174149 ) ) ( not ( = ?auto_174145 ?auto_174151 ) ) ( not ( = ?auto_174146 ?auto_174151 ) ) ( not ( = ?auto_174147 ?auto_174151 ) ) ( not ( = ?auto_174148 ?auto_174151 ) ) ( ON ?auto_174148 ?auto_174149 ) ( ON ?auto_174147 ?auto_174148 ) ( ON ?auto_174146 ?auto_174147 ) ( ON ?auto_174145 ?auto_174146 ) ( CLEAR ?auto_174145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174151 ?auto_174152 ?auto_174150 ?auto_174149 ?auto_174148 ?auto_174147 ?auto_174146 )
      ( MAKE-6PILE ?auto_174145 ?auto_174146 ?auto_174147 ?auto_174148 ?auto_174149 ?auto_174150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174153 - BLOCK
      ?auto_174154 - BLOCK
      ?auto_174155 - BLOCK
      ?auto_174156 - BLOCK
      ?auto_174157 - BLOCK
      ?auto_174158 - BLOCK
    )
    :vars
    (
      ?auto_174159 - BLOCK
      ?auto_174160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174153 ?auto_174154 ) ) ( not ( = ?auto_174153 ?auto_174155 ) ) ( not ( = ?auto_174153 ?auto_174156 ) ) ( not ( = ?auto_174153 ?auto_174157 ) ) ( not ( = ?auto_174153 ?auto_174158 ) ) ( not ( = ?auto_174154 ?auto_174155 ) ) ( not ( = ?auto_174154 ?auto_174156 ) ) ( not ( = ?auto_174154 ?auto_174157 ) ) ( not ( = ?auto_174154 ?auto_174158 ) ) ( not ( = ?auto_174155 ?auto_174156 ) ) ( not ( = ?auto_174155 ?auto_174157 ) ) ( not ( = ?auto_174155 ?auto_174158 ) ) ( not ( = ?auto_174156 ?auto_174157 ) ) ( not ( = ?auto_174156 ?auto_174158 ) ) ( not ( = ?auto_174157 ?auto_174158 ) ) ( ON ?auto_174158 ?auto_174159 ) ( not ( = ?auto_174153 ?auto_174159 ) ) ( not ( = ?auto_174154 ?auto_174159 ) ) ( not ( = ?auto_174155 ?auto_174159 ) ) ( not ( = ?auto_174156 ?auto_174159 ) ) ( not ( = ?auto_174157 ?auto_174159 ) ) ( not ( = ?auto_174158 ?auto_174159 ) ) ( ON ?auto_174157 ?auto_174158 ) ( ON-TABLE ?auto_174160 ) ( ON ?auto_174159 ?auto_174160 ) ( not ( = ?auto_174160 ?auto_174159 ) ) ( not ( = ?auto_174160 ?auto_174158 ) ) ( not ( = ?auto_174160 ?auto_174157 ) ) ( not ( = ?auto_174153 ?auto_174160 ) ) ( not ( = ?auto_174154 ?auto_174160 ) ) ( not ( = ?auto_174155 ?auto_174160 ) ) ( not ( = ?auto_174156 ?auto_174160 ) ) ( ON ?auto_174156 ?auto_174157 ) ( ON ?auto_174155 ?auto_174156 ) ( ON ?auto_174154 ?auto_174155 ) ( HOLDING ?auto_174153 ) ( CLEAR ?auto_174154 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174160 ?auto_174159 ?auto_174158 ?auto_174157 ?auto_174156 ?auto_174155 ?auto_174154 ?auto_174153 )
      ( MAKE-6PILE ?auto_174153 ?auto_174154 ?auto_174155 ?auto_174156 ?auto_174157 ?auto_174158 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174161 - BLOCK
      ?auto_174162 - BLOCK
      ?auto_174163 - BLOCK
      ?auto_174164 - BLOCK
      ?auto_174165 - BLOCK
      ?auto_174166 - BLOCK
    )
    :vars
    (
      ?auto_174168 - BLOCK
      ?auto_174167 - BLOCK
      ?auto_174169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174161 ?auto_174162 ) ) ( not ( = ?auto_174161 ?auto_174163 ) ) ( not ( = ?auto_174161 ?auto_174164 ) ) ( not ( = ?auto_174161 ?auto_174165 ) ) ( not ( = ?auto_174161 ?auto_174166 ) ) ( not ( = ?auto_174162 ?auto_174163 ) ) ( not ( = ?auto_174162 ?auto_174164 ) ) ( not ( = ?auto_174162 ?auto_174165 ) ) ( not ( = ?auto_174162 ?auto_174166 ) ) ( not ( = ?auto_174163 ?auto_174164 ) ) ( not ( = ?auto_174163 ?auto_174165 ) ) ( not ( = ?auto_174163 ?auto_174166 ) ) ( not ( = ?auto_174164 ?auto_174165 ) ) ( not ( = ?auto_174164 ?auto_174166 ) ) ( not ( = ?auto_174165 ?auto_174166 ) ) ( ON ?auto_174166 ?auto_174168 ) ( not ( = ?auto_174161 ?auto_174168 ) ) ( not ( = ?auto_174162 ?auto_174168 ) ) ( not ( = ?auto_174163 ?auto_174168 ) ) ( not ( = ?auto_174164 ?auto_174168 ) ) ( not ( = ?auto_174165 ?auto_174168 ) ) ( not ( = ?auto_174166 ?auto_174168 ) ) ( ON ?auto_174165 ?auto_174166 ) ( ON-TABLE ?auto_174167 ) ( ON ?auto_174168 ?auto_174167 ) ( not ( = ?auto_174167 ?auto_174168 ) ) ( not ( = ?auto_174167 ?auto_174166 ) ) ( not ( = ?auto_174167 ?auto_174165 ) ) ( not ( = ?auto_174161 ?auto_174167 ) ) ( not ( = ?auto_174162 ?auto_174167 ) ) ( not ( = ?auto_174163 ?auto_174167 ) ) ( not ( = ?auto_174164 ?auto_174167 ) ) ( ON ?auto_174164 ?auto_174165 ) ( ON ?auto_174163 ?auto_174164 ) ( ON ?auto_174162 ?auto_174163 ) ( CLEAR ?auto_174162 ) ( ON ?auto_174161 ?auto_174169 ) ( CLEAR ?auto_174161 ) ( HAND-EMPTY ) ( not ( = ?auto_174161 ?auto_174169 ) ) ( not ( = ?auto_174162 ?auto_174169 ) ) ( not ( = ?auto_174163 ?auto_174169 ) ) ( not ( = ?auto_174164 ?auto_174169 ) ) ( not ( = ?auto_174165 ?auto_174169 ) ) ( not ( = ?auto_174166 ?auto_174169 ) ) ( not ( = ?auto_174168 ?auto_174169 ) ) ( not ( = ?auto_174167 ?auto_174169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174161 ?auto_174169 )
      ( MAKE-6PILE ?auto_174161 ?auto_174162 ?auto_174163 ?auto_174164 ?auto_174165 ?auto_174166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174170 - BLOCK
      ?auto_174171 - BLOCK
      ?auto_174172 - BLOCK
      ?auto_174173 - BLOCK
      ?auto_174174 - BLOCK
      ?auto_174175 - BLOCK
    )
    :vars
    (
      ?auto_174176 - BLOCK
      ?auto_174177 - BLOCK
      ?auto_174178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174170 ?auto_174171 ) ) ( not ( = ?auto_174170 ?auto_174172 ) ) ( not ( = ?auto_174170 ?auto_174173 ) ) ( not ( = ?auto_174170 ?auto_174174 ) ) ( not ( = ?auto_174170 ?auto_174175 ) ) ( not ( = ?auto_174171 ?auto_174172 ) ) ( not ( = ?auto_174171 ?auto_174173 ) ) ( not ( = ?auto_174171 ?auto_174174 ) ) ( not ( = ?auto_174171 ?auto_174175 ) ) ( not ( = ?auto_174172 ?auto_174173 ) ) ( not ( = ?auto_174172 ?auto_174174 ) ) ( not ( = ?auto_174172 ?auto_174175 ) ) ( not ( = ?auto_174173 ?auto_174174 ) ) ( not ( = ?auto_174173 ?auto_174175 ) ) ( not ( = ?auto_174174 ?auto_174175 ) ) ( ON ?auto_174175 ?auto_174176 ) ( not ( = ?auto_174170 ?auto_174176 ) ) ( not ( = ?auto_174171 ?auto_174176 ) ) ( not ( = ?auto_174172 ?auto_174176 ) ) ( not ( = ?auto_174173 ?auto_174176 ) ) ( not ( = ?auto_174174 ?auto_174176 ) ) ( not ( = ?auto_174175 ?auto_174176 ) ) ( ON ?auto_174174 ?auto_174175 ) ( ON-TABLE ?auto_174177 ) ( ON ?auto_174176 ?auto_174177 ) ( not ( = ?auto_174177 ?auto_174176 ) ) ( not ( = ?auto_174177 ?auto_174175 ) ) ( not ( = ?auto_174177 ?auto_174174 ) ) ( not ( = ?auto_174170 ?auto_174177 ) ) ( not ( = ?auto_174171 ?auto_174177 ) ) ( not ( = ?auto_174172 ?auto_174177 ) ) ( not ( = ?auto_174173 ?auto_174177 ) ) ( ON ?auto_174173 ?auto_174174 ) ( ON ?auto_174172 ?auto_174173 ) ( ON ?auto_174170 ?auto_174178 ) ( CLEAR ?auto_174170 ) ( not ( = ?auto_174170 ?auto_174178 ) ) ( not ( = ?auto_174171 ?auto_174178 ) ) ( not ( = ?auto_174172 ?auto_174178 ) ) ( not ( = ?auto_174173 ?auto_174178 ) ) ( not ( = ?auto_174174 ?auto_174178 ) ) ( not ( = ?auto_174175 ?auto_174178 ) ) ( not ( = ?auto_174176 ?auto_174178 ) ) ( not ( = ?auto_174177 ?auto_174178 ) ) ( HOLDING ?auto_174171 ) ( CLEAR ?auto_174172 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174177 ?auto_174176 ?auto_174175 ?auto_174174 ?auto_174173 ?auto_174172 ?auto_174171 )
      ( MAKE-6PILE ?auto_174170 ?auto_174171 ?auto_174172 ?auto_174173 ?auto_174174 ?auto_174175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174179 - BLOCK
      ?auto_174180 - BLOCK
      ?auto_174181 - BLOCK
      ?auto_174182 - BLOCK
      ?auto_174183 - BLOCK
      ?auto_174184 - BLOCK
    )
    :vars
    (
      ?auto_174185 - BLOCK
      ?auto_174186 - BLOCK
      ?auto_174187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174179 ?auto_174180 ) ) ( not ( = ?auto_174179 ?auto_174181 ) ) ( not ( = ?auto_174179 ?auto_174182 ) ) ( not ( = ?auto_174179 ?auto_174183 ) ) ( not ( = ?auto_174179 ?auto_174184 ) ) ( not ( = ?auto_174180 ?auto_174181 ) ) ( not ( = ?auto_174180 ?auto_174182 ) ) ( not ( = ?auto_174180 ?auto_174183 ) ) ( not ( = ?auto_174180 ?auto_174184 ) ) ( not ( = ?auto_174181 ?auto_174182 ) ) ( not ( = ?auto_174181 ?auto_174183 ) ) ( not ( = ?auto_174181 ?auto_174184 ) ) ( not ( = ?auto_174182 ?auto_174183 ) ) ( not ( = ?auto_174182 ?auto_174184 ) ) ( not ( = ?auto_174183 ?auto_174184 ) ) ( ON ?auto_174184 ?auto_174185 ) ( not ( = ?auto_174179 ?auto_174185 ) ) ( not ( = ?auto_174180 ?auto_174185 ) ) ( not ( = ?auto_174181 ?auto_174185 ) ) ( not ( = ?auto_174182 ?auto_174185 ) ) ( not ( = ?auto_174183 ?auto_174185 ) ) ( not ( = ?auto_174184 ?auto_174185 ) ) ( ON ?auto_174183 ?auto_174184 ) ( ON-TABLE ?auto_174186 ) ( ON ?auto_174185 ?auto_174186 ) ( not ( = ?auto_174186 ?auto_174185 ) ) ( not ( = ?auto_174186 ?auto_174184 ) ) ( not ( = ?auto_174186 ?auto_174183 ) ) ( not ( = ?auto_174179 ?auto_174186 ) ) ( not ( = ?auto_174180 ?auto_174186 ) ) ( not ( = ?auto_174181 ?auto_174186 ) ) ( not ( = ?auto_174182 ?auto_174186 ) ) ( ON ?auto_174182 ?auto_174183 ) ( ON ?auto_174181 ?auto_174182 ) ( ON ?auto_174179 ?auto_174187 ) ( not ( = ?auto_174179 ?auto_174187 ) ) ( not ( = ?auto_174180 ?auto_174187 ) ) ( not ( = ?auto_174181 ?auto_174187 ) ) ( not ( = ?auto_174182 ?auto_174187 ) ) ( not ( = ?auto_174183 ?auto_174187 ) ) ( not ( = ?auto_174184 ?auto_174187 ) ) ( not ( = ?auto_174185 ?auto_174187 ) ) ( not ( = ?auto_174186 ?auto_174187 ) ) ( CLEAR ?auto_174181 ) ( ON ?auto_174180 ?auto_174179 ) ( CLEAR ?auto_174180 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174187 ?auto_174179 )
      ( MAKE-6PILE ?auto_174179 ?auto_174180 ?auto_174181 ?auto_174182 ?auto_174183 ?auto_174184 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174188 - BLOCK
      ?auto_174189 - BLOCK
      ?auto_174190 - BLOCK
      ?auto_174191 - BLOCK
      ?auto_174192 - BLOCK
      ?auto_174193 - BLOCK
    )
    :vars
    (
      ?auto_174196 - BLOCK
      ?auto_174195 - BLOCK
      ?auto_174194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174188 ?auto_174189 ) ) ( not ( = ?auto_174188 ?auto_174190 ) ) ( not ( = ?auto_174188 ?auto_174191 ) ) ( not ( = ?auto_174188 ?auto_174192 ) ) ( not ( = ?auto_174188 ?auto_174193 ) ) ( not ( = ?auto_174189 ?auto_174190 ) ) ( not ( = ?auto_174189 ?auto_174191 ) ) ( not ( = ?auto_174189 ?auto_174192 ) ) ( not ( = ?auto_174189 ?auto_174193 ) ) ( not ( = ?auto_174190 ?auto_174191 ) ) ( not ( = ?auto_174190 ?auto_174192 ) ) ( not ( = ?auto_174190 ?auto_174193 ) ) ( not ( = ?auto_174191 ?auto_174192 ) ) ( not ( = ?auto_174191 ?auto_174193 ) ) ( not ( = ?auto_174192 ?auto_174193 ) ) ( ON ?auto_174193 ?auto_174196 ) ( not ( = ?auto_174188 ?auto_174196 ) ) ( not ( = ?auto_174189 ?auto_174196 ) ) ( not ( = ?auto_174190 ?auto_174196 ) ) ( not ( = ?auto_174191 ?auto_174196 ) ) ( not ( = ?auto_174192 ?auto_174196 ) ) ( not ( = ?auto_174193 ?auto_174196 ) ) ( ON ?auto_174192 ?auto_174193 ) ( ON-TABLE ?auto_174195 ) ( ON ?auto_174196 ?auto_174195 ) ( not ( = ?auto_174195 ?auto_174196 ) ) ( not ( = ?auto_174195 ?auto_174193 ) ) ( not ( = ?auto_174195 ?auto_174192 ) ) ( not ( = ?auto_174188 ?auto_174195 ) ) ( not ( = ?auto_174189 ?auto_174195 ) ) ( not ( = ?auto_174190 ?auto_174195 ) ) ( not ( = ?auto_174191 ?auto_174195 ) ) ( ON ?auto_174191 ?auto_174192 ) ( ON ?auto_174188 ?auto_174194 ) ( not ( = ?auto_174188 ?auto_174194 ) ) ( not ( = ?auto_174189 ?auto_174194 ) ) ( not ( = ?auto_174190 ?auto_174194 ) ) ( not ( = ?auto_174191 ?auto_174194 ) ) ( not ( = ?auto_174192 ?auto_174194 ) ) ( not ( = ?auto_174193 ?auto_174194 ) ) ( not ( = ?auto_174196 ?auto_174194 ) ) ( not ( = ?auto_174195 ?auto_174194 ) ) ( ON ?auto_174189 ?auto_174188 ) ( CLEAR ?auto_174189 ) ( ON-TABLE ?auto_174194 ) ( HOLDING ?auto_174190 ) ( CLEAR ?auto_174191 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174195 ?auto_174196 ?auto_174193 ?auto_174192 ?auto_174191 ?auto_174190 )
      ( MAKE-6PILE ?auto_174188 ?auto_174189 ?auto_174190 ?auto_174191 ?auto_174192 ?auto_174193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174197 - BLOCK
      ?auto_174198 - BLOCK
      ?auto_174199 - BLOCK
      ?auto_174200 - BLOCK
      ?auto_174201 - BLOCK
      ?auto_174202 - BLOCK
    )
    :vars
    (
      ?auto_174205 - BLOCK
      ?auto_174204 - BLOCK
      ?auto_174203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174197 ?auto_174198 ) ) ( not ( = ?auto_174197 ?auto_174199 ) ) ( not ( = ?auto_174197 ?auto_174200 ) ) ( not ( = ?auto_174197 ?auto_174201 ) ) ( not ( = ?auto_174197 ?auto_174202 ) ) ( not ( = ?auto_174198 ?auto_174199 ) ) ( not ( = ?auto_174198 ?auto_174200 ) ) ( not ( = ?auto_174198 ?auto_174201 ) ) ( not ( = ?auto_174198 ?auto_174202 ) ) ( not ( = ?auto_174199 ?auto_174200 ) ) ( not ( = ?auto_174199 ?auto_174201 ) ) ( not ( = ?auto_174199 ?auto_174202 ) ) ( not ( = ?auto_174200 ?auto_174201 ) ) ( not ( = ?auto_174200 ?auto_174202 ) ) ( not ( = ?auto_174201 ?auto_174202 ) ) ( ON ?auto_174202 ?auto_174205 ) ( not ( = ?auto_174197 ?auto_174205 ) ) ( not ( = ?auto_174198 ?auto_174205 ) ) ( not ( = ?auto_174199 ?auto_174205 ) ) ( not ( = ?auto_174200 ?auto_174205 ) ) ( not ( = ?auto_174201 ?auto_174205 ) ) ( not ( = ?auto_174202 ?auto_174205 ) ) ( ON ?auto_174201 ?auto_174202 ) ( ON-TABLE ?auto_174204 ) ( ON ?auto_174205 ?auto_174204 ) ( not ( = ?auto_174204 ?auto_174205 ) ) ( not ( = ?auto_174204 ?auto_174202 ) ) ( not ( = ?auto_174204 ?auto_174201 ) ) ( not ( = ?auto_174197 ?auto_174204 ) ) ( not ( = ?auto_174198 ?auto_174204 ) ) ( not ( = ?auto_174199 ?auto_174204 ) ) ( not ( = ?auto_174200 ?auto_174204 ) ) ( ON ?auto_174200 ?auto_174201 ) ( ON ?auto_174197 ?auto_174203 ) ( not ( = ?auto_174197 ?auto_174203 ) ) ( not ( = ?auto_174198 ?auto_174203 ) ) ( not ( = ?auto_174199 ?auto_174203 ) ) ( not ( = ?auto_174200 ?auto_174203 ) ) ( not ( = ?auto_174201 ?auto_174203 ) ) ( not ( = ?auto_174202 ?auto_174203 ) ) ( not ( = ?auto_174205 ?auto_174203 ) ) ( not ( = ?auto_174204 ?auto_174203 ) ) ( ON ?auto_174198 ?auto_174197 ) ( ON-TABLE ?auto_174203 ) ( CLEAR ?auto_174200 ) ( ON ?auto_174199 ?auto_174198 ) ( CLEAR ?auto_174199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174203 ?auto_174197 ?auto_174198 )
      ( MAKE-6PILE ?auto_174197 ?auto_174198 ?auto_174199 ?auto_174200 ?auto_174201 ?auto_174202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174206 - BLOCK
      ?auto_174207 - BLOCK
      ?auto_174208 - BLOCK
      ?auto_174209 - BLOCK
      ?auto_174210 - BLOCK
      ?auto_174211 - BLOCK
    )
    :vars
    (
      ?auto_174214 - BLOCK
      ?auto_174212 - BLOCK
      ?auto_174213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174206 ?auto_174207 ) ) ( not ( = ?auto_174206 ?auto_174208 ) ) ( not ( = ?auto_174206 ?auto_174209 ) ) ( not ( = ?auto_174206 ?auto_174210 ) ) ( not ( = ?auto_174206 ?auto_174211 ) ) ( not ( = ?auto_174207 ?auto_174208 ) ) ( not ( = ?auto_174207 ?auto_174209 ) ) ( not ( = ?auto_174207 ?auto_174210 ) ) ( not ( = ?auto_174207 ?auto_174211 ) ) ( not ( = ?auto_174208 ?auto_174209 ) ) ( not ( = ?auto_174208 ?auto_174210 ) ) ( not ( = ?auto_174208 ?auto_174211 ) ) ( not ( = ?auto_174209 ?auto_174210 ) ) ( not ( = ?auto_174209 ?auto_174211 ) ) ( not ( = ?auto_174210 ?auto_174211 ) ) ( ON ?auto_174211 ?auto_174214 ) ( not ( = ?auto_174206 ?auto_174214 ) ) ( not ( = ?auto_174207 ?auto_174214 ) ) ( not ( = ?auto_174208 ?auto_174214 ) ) ( not ( = ?auto_174209 ?auto_174214 ) ) ( not ( = ?auto_174210 ?auto_174214 ) ) ( not ( = ?auto_174211 ?auto_174214 ) ) ( ON ?auto_174210 ?auto_174211 ) ( ON-TABLE ?auto_174212 ) ( ON ?auto_174214 ?auto_174212 ) ( not ( = ?auto_174212 ?auto_174214 ) ) ( not ( = ?auto_174212 ?auto_174211 ) ) ( not ( = ?auto_174212 ?auto_174210 ) ) ( not ( = ?auto_174206 ?auto_174212 ) ) ( not ( = ?auto_174207 ?auto_174212 ) ) ( not ( = ?auto_174208 ?auto_174212 ) ) ( not ( = ?auto_174209 ?auto_174212 ) ) ( ON ?auto_174206 ?auto_174213 ) ( not ( = ?auto_174206 ?auto_174213 ) ) ( not ( = ?auto_174207 ?auto_174213 ) ) ( not ( = ?auto_174208 ?auto_174213 ) ) ( not ( = ?auto_174209 ?auto_174213 ) ) ( not ( = ?auto_174210 ?auto_174213 ) ) ( not ( = ?auto_174211 ?auto_174213 ) ) ( not ( = ?auto_174214 ?auto_174213 ) ) ( not ( = ?auto_174212 ?auto_174213 ) ) ( ON ?auto_174207 ?auto_174206 ) ( ON-TABLE ?auto_174213 ) ( ON ?auto_174208 ?auto_174207 ) ( CLEAR ?auto_174208 ) ( HOLDING ?auto_174209 ) ( CLEAR ?auto_174210 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174212 ?auto_174214 ?auto_174211 ?auto_174210 ?auto_174209 )
      ( MAKE-6PILE ?auto_174206 ?auto_174207 ?auto_174208 ?auto_174209 ?auto_174210 ?auto_174211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174215 - BLOCK
      ?auto_174216 - BLOCK
      ?auto_174217 - BLOCK
      ?auto_174218 - BLOCK
      ?auto_174219 - BLOCK
      ?auto_174220 - BLOCK
    )
    :vars
    (
      ?auto_174221 - BLOCK
      ?auto_174222 - BLOCK
      ?auto_174223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174215 ?auto_174216 ) ) ( not ( = ?auto_174215 ?auto_174217 ) ) ( not ( = ?auto_174215 ?auto_174218 ) ) ( not ( = ?auto_174215 ?auto_174219 ) ) ( not ( = ?auto_174215 ?auto_174220 ) ) ( not ( = ?auto_174216 ?auto_174217 ) ) ( not ( = ?auto_174216 ?auto_174218 ) ) ( not ( = ?auto_174216 ?auto_174219 ) ) ( not ( = ?auto_174216 ?auto_174220 ) ) ( not ( = ?auto_174217 ?auto_174218 ) ) ( not ( = ?auto_174217 ?auto_174219 ) ) ( not ( = ?auto_174217 ?auto_174220 ) ) ( not ( = ?auto_174218 ?auto_174219 ) ) ( not ( = ?auto_174218 ?auto_174220 ) ) ( not ( = ?auto_174219 ?auto_174220 ) ) ( ON ?auto_174220 ?auto_174221 ) ( not ( = ?auto_174215 ?auto_174221 ) ) ( not ( = ?auto_174216 ?auto_174221 ) ) ( not ( = ?auto_174217 ?auto_174221 ) ) ( not ( = ?auto_174218 ?auto_174221 ) ) ( not ( = ?auto_174219 ?auto_174221 ) ) ( not ( = ?auto_174220 ?auto_174221 ) ) ( ON ?auto_174219 ?auto_174220 ) ( ON-TABLE ?auto_174222 ) ( ON ?auto_174221 ?auto_174222 ) ( not ( = ?auto_174222 ?auto_174221 ) ) ( not ( = ?auto_174222 ?auto_174220 ) ) ( not ( = ?auto_174222 ?auto_174219 ) ) ( not ( = ?auto_174215 ?auto_174222 ) ) ( not ( = ?auto_174216 ?auto_174222 ) ) ( not ( = ?auto_174217 ?auto_174222 ) ) ( not ( = ?auto_174218 ?auto_174222 ) ) ( ON ?auto_174215 ?auto_174223 ) ( not ( = ?auto_174215 ?auto_174223 ) ) ( not ( = ?auto_174216 ?auto_174223 ) ) ( not ( = ?auto_174217 ?auto_174223 ) ) ( not ( = ?auto_174218 ?auto_174223 ) ) ( not ( = ?auto_174219 ?auto_174223 ) ) ( not ( = ?auto_174220 ?auto_174223 ) ) ( not ( = ?auto_174221 ?auto_174223 ) ) ( not ( = ?auto_174222 ?auto_174223 ) ) ( ON ?auto_174216 ?auto_174215 ) ( ON-TABLE ?auto_174223 ) ( ON ?auto_174217 ?auto_174216 ) ( CLEAR ?auto_174219 ) ( ON ?auto_174218 ?auto_174217 ) ( CLEAR ?auto_174218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174223 ?auto_174215 ?auto_174216 ?auto_174217 )
      ( MAKE-6PILE ?auto_174215 ?auto_174216 ?auto_174217 ?auto_174218 ?auto_174219 ?auto_174220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174224 - BLOCK
      ?auto_174225 - BLOCK
      ?auto_174226 - BLOCK
      ?auto_174227 - BLOCK
      ?auto_174228 - BLOCK
      ?auto_174229 - BLOCK
    )
    :vars
    (
      ?auto_174230 - BLOCK
      ?auto_174232 - BLOCK
      ?auto_174231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174224 ?auto_174225 ) ) ( not ( = ?auto_174224 ?auto_174226 ) ) ( not ( = ?auto_174224 ?auto_174227 ) ) ( not ( = ?auto_174224 ?auto_174228 ) ) ( not ( = ?auto_174224 ?auto_174229 ) ) ( not ( = ?auto_174225 ?auto_174226 ) ) ( not ( = ?auto_174225 ?auto_174227 ) ) ( not ( = ?auto_174225 ?auto_174228 ) ) ( not ( = ?auto_174225 ?auto_174229 ) ) ( not ( = ?auto_174226 ?auto_174227 ) ) ( not ( = ?auto_174226 ?auto_174228 ) ) ( not ( = ?auto_174226 ?auto_174229 ) ) ( not ( = ?auto_174227 ?auto_174228 ) ) ( not ( = ?auto_174227 ?auto_174229 ) ) ( not ( = ?auto_174228 ?auto_174229 ) ) ( ON ?auto_174229 ?auto_174230 ) ( not ( = ?auto_174224 ?auto_174230 ) ) ( not ( = ?auto_174225 ?auto_174230 ) ) ( not ( = ?auto_174226 ?auto_174230 ) ) ( not ( = ?auto_174227 ?auto_174230 ) ) ( not ( = ?auto_174228 ?auto_174230 ) ) ( not ( = ?auto_174229 ?auto_174230 ) ) ( ON-TABLE ?auto_174232 ) ( ON ?auto_174230 ?auto_174232 ) ( not ( = ?auto_174232 ?auto_174230 ) ) ( not ( = ?auto_174232 ?auto_174229 ) ) ( not ( = ?auto_174232 ?auto_174228 ) ) ( not ( = ?auto_174224 ?auto_174232 ) ) ( not ( = ?auto_174225 ?auto_174232 ) ) ( not ( = ?auto_174226 ?auto_174232 ) ) ( not ( = ?auto_174227 ?auto_174232 ) ) ( ON ?auto_174224 ?auto_174231 ) ( not ( = ?auto_174224 ?auto_174231 ) ) ( not ( = ?auto_174225 ?auto_174231 ) ) ( not ( = ?auto_174226 ?auto_174231 ) ) ( not ( = ?auto_174227 ?auto_174231 ) ) ( not ( = ?auto_174228 ?auto_174231 ) ) ( not ( = ?auto_174229 ?auto_174231 ) ) ( not ( = ?auto_174230 ?auto_174231 ) ) ( not ( = ?auto_174232 ?auto_174231 ) ) ( ON ?auto_174225 ?auto_174224 ) ( ON-TABLE ?auto_174231 ) ( ON ?auto_174226 ?auto_174225 ) ( ON ?auto_174227 ?auto_174226 ) ( CLEAR ?auto_174227 ) ( HOLDING ?auto_174228 ) ( CLEAR ?auto_174229 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174232 ?auto_174230 ?auto_174229 ?auto_174228 )
      ( MAKE-6PILE ?auto_174224 ?auto_174225 ?auto_174226 ?auto_174227 ?auto_174228 ?auto_174229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174233 - BLOCK
      ?auto_174234 - BLOCK
      ?auto_174235 - BLOCK
      ?auto_174236 - BLOCK
      ?auto_174237 - BLOCK
      ?auto_174238 - BLOCK
    )
    :vars
    (
      ?auto_174240 - BLOCK
      ?auto_174239 - BLOCK
      ?auto_174241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174233 ?auto_174234 ) ) ( not ( = ?auto_174233 ?auto_174235 ) ) ( not ( = ?auto_174233 ?auto_174236 ) ) ( not ( = ?auto_174233 ?auto_174237 ) ) ( not ( = ?auto_174233 ?auto_174238 ) ) ( not ( = ?auto_174234 ?auto_174235 ) ) ( not ( = ?auto_174234 ?auto_174236 ) ) ( not ( = ?auto_174234 ?auto_174237 ) ) ( not ( = ?auto_174234 ?auto_174238 ) ) ( not ( = ?auto_174235 ?auto_174236 ) ) ( not ( = ?auto_174235 ?auto_174237 ) ) ( not ( = ?auto_174235 ?auto_174238 ) ) ( not ( = ?auto_174236 ?auto_174237 ) ) ( not ( = ?auto_174236 ?auto_174238 ) ) ( not ( = ?auto_174237 ?auto_174238 ) ) ( ON ?auto_174238 ?auto_174240 ) ( not ( = ?auto_174233 ?auto_174240 ) ) ( not ( = ?auto_174234 ?auto_174240 ) ) ( not ( = ?auto_174235 ?auto_174240 ) ) ( not ( = ?auto_174236 ?auto_174240 ) ) ( not ( = ?auto_174237 ?auto_174240 ) ) ( not ( = ?auto_174238 ?auto_174240 ) ) ( ON-TABLE ?auto_174239 ) ( ON ?auto_174240 ?auto_174239 ) ( not ( = ?auto_174239 ?auto_174240 ) ) ( not ( = ?auto_174239 ?auto_174238 ) ) ( not ( = ?auto_174239 ?auto_174237 ) ) ( not ( = ?auto_174233 ?auto_174239 ) ) ( not ( = ?auto_174234 ?auto_174239 ) ) ( not ( = ?auto_174235 ?auto_174239 ) ) ( not ( = ?auto_174236 ?auto_174239 ) ) ( ON ?auto_174233 ?auto_174241 ) ( not ( = ?auto_174233 ?auto_174241 ) ) ( not ( = ?auto_174234 ?auto_174241 ) ) ( not ( = ?auto_174235 ?auto_174241 ) ) ( not ( = ?auto_174236 ?auto_174241 ) ) ( not ( = ?auto_174237 ?auto_174241 ) ) ( not ( = ?auto_174238 ?auto_174241 ) ) ( not ( = ?auto_174240 ?auto_174241 ) ) ( not ( = ?auto_174239 ?auto_174241 ) ) ( ON ?auto_174234 ?auto_174233 ) ( ON-TABLE ?auto_174241 ) ( ON ?auto_174235 ?auto_174234 ) ( ON ?auto_174236 ?auto_174235 ) ( CLEAR ?auto_174238 ) ( ON ?auto_174237 ?auto_174236 ) ( CLEAR ?auto_174237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174241 ?auto_174233 ?auto_174234 ?auto_174235 ?auto_174236 )
      ( MAKE-6PILE ?auto_174233 ?auto_174234 ?auto_174235 ?auto_174236 ?auto_174237 ?auto_174238 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174242 - BLOCK
      ?auto_174243 - BLOCK
      ?auto_174244 - BLOCK
      ?auto_174245 - BLOCK
      ?auto_174246 - BLOCK
      ?auto_174247 - BLOCK
    )
    :vars
    (
      ?auto_174248 - BLOCK
      ?auto_174250 - BLOCK
      ?auto_174249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174242 ?auto_174243 ) ) ( not ( = ?auto_174242 ?auto_174244 ) ) ( not ( = ?auto_174242 ?auto_174245 ) ) ( not ( = ?auto_174242 ?auto_174246 ) ) ( not ( = ?auto_174242 ?auto_174247 ) ) ( not ( = ?auto_174243 ?auto_174244 ) ) ( not ( = ?auto_174243 ?auto_174245 ) ) ( not ( = ?auto_174243 ?auto_174246 ) ) ( not ( = ?auto_174243 ?auto_174247 ) ) ( not ( = ?auto_174244 ?auto_174245 ) ) ( not ( = ?auto_174244 ?auto_174246 ) ) ( not ( = ?auto_174244 ?auto_174247 ) ) ( not ( = ?auto_174245 ?auto_174246 ) ) ( not ( = ?auto_174245 ?auto_174247 ) ) ( not ( = ?auto_174246 ?auto_174247 ) ) ( not ( = ?auto_174242 ?auto_174248 ) ) ( not ( = ?auto_174243 ?auto_174248 ) ) ( not ( = ?auto_174244 ?auto_174248 ) ) ( not ( = ?auto_174245 ?auto_174248 ) ) ( not ( = ?auto_174246 ?auto_174248 ) ) ( not ( = ?auto_174247 ?auto_174248 ) ) ( ON-TABLE ?auto_174250 ) ( ON ?auto_174248 ?auto_174250 ) ( not ( = ?auto_174250 ?auto_174248 ) ) ( not ( = ?auto_174250 ?auto_174247 ) ) ( not ( = ?auto_174250 ?auto_174246 ) ) ( not ( = ?auto_174242 ?auto_174250 ) ) ( not ( = ?auto_174243 ?auto_174250 ) ) ( not ( = ?auto_174244 ?auto_174250 ) ) ( not ( = ?auto_174245 ?auto_174250 ) ) ( ON ?auto_174242 ?auto_174249 ) ( not ( = ?auto_174242 ?auto_174249 ) ) ( not ( = ?auto_174243 ?auto_174249 ) ) ( not ( = ?auto_174244 ?auto_174249 ) ) ( not ( = ?auto_174245 ?auto_174249 ) ) ( not ( = ?auto_174246 ?auto_174249 ) ) ( not ( = ?auto_174247 ?auto_174249 ) ) ( not ( = ?auto_174248 ?auto_174249 ) ) ( not ( = ?auto_174250 ?auto_174249 ) ) ( ON ?auto_174243 ?auto_174242 ) ( ON-TABLE ?auto_174249 ) ( ON ?auto_174244 ?auto_174243 ) ( ON ?auto_174245 ?auto_174244 ) ( ON ?auto_174246 ?auto_174245 ) ( CLEAR ?auto_174246 ) ( HOLDING ?auto_174247 ) ( CLEAR ?auto_174248 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174250 ?auto_174248 ?auto_174247 )
      ( MAKE-6PILE ?auto_174242 ?auto_174243 ?auto_174244 ?auto_174245 ?auto_174246 ?auto_174247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174251 - BLOCK
      ?auto_174252 - BLOCK
      ?auto_174253 - BLOCK
      ?auto_174254 - BLOCK
      ?auto_174255 - BLOCK
      ?auto_174256 - BLOCK
    )
    :vars
    (
      ?auto_174259 - BLOCK
      ?auto_174258 - BLOCK
      ?auto_174257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174251 ?auto_174252 ) ) ( not ( = ?auto_174251 ?auto_174253 ) ) ( not ( = ?auto_174251 ?auto_174254 ) ) ( not ( = ?auto_174251 ?auto_174255 ) ) ( not ( = ?auto_174251 ?auto_174256 ) ) ( not ( = ?auto_174252 ?auto_174253 ) ) ( not ( = ?auto_174252 ?auto_174254 ) ) ( not ( = ?auto_174252 ?auto_174255 ) ) ( not ( = ?auto_174252 ?auto_174256 ) ) ( not ( = ?auto_174253 ?auto_174254 ) ) ( not ( = ?auto_174253 ?auto_174255 ) ) ( not ( = ?auto_174253 ?auto_174256 ) ) ( not ( = ?auto_174254 ?auto_174255 ) ) ( not ( = ?auto_174254 ?auto_174256 ) ) ( not ( = ?auto_174255 ?auto_174256 ) ) ( not ( = ?auto_174251 ?auto_174259 ) ) ( not ( = ?auto_174252 ?auto_174259 ) ) ( not ( = ?auto_174253 ?auto_174259 ) ) ( not ( = ?auto_174254 ?auto_174259 ) ) ( not ( = ?auto_174255 ?auto_174259 ) ) ( not ( = ?auto_174256 ?auto_174259 ) ) ( ON-TABLE ?auto_174258 ) ( ON ?auto_174259 ?auto_174258 ) ( not ( = ?auto_174258 ?auto_174259 ) ) ( not ( = ?auto_174258 ?auto_174256 ) ) ( not ( = ?auto_174258 ?auto_174255 ) ) ( not ( = ?auto_174251 ?auto_174258 ) ) ( not ( = ?auto_174252 ?auto_174258 ) ) ( not ( = ?auto_174253 ?auto_174258 ) ) ( not ( = ?auto_174254 ?auto_174258 ) ) ( ON ?auto_174251 ?auto_174257 ) ( not ( = ?auto_174251 ?auto_174257 ) ) ( not ( = ?auto_174252 ?auto_174257 ) ) ( not ( = ?auto_174253 ?auto_174257 ) ) ( not ( = ?auto_174254 ?auto_174257 ) ) ( not ( = ?auto_174255 ?auto_174257 ) ) ( not ( = ?auto_174256 ?auto_174257 ) ) ( not ( = ?auto_174259 ?auto_174257 ) ) ( not ( = ?auto_174258 ?auto_174257 ) ) ( ON ?auto_174252 ?auto_174251 ) ( ON-TABLE ?auto_174257 ) ( ON ?auto_174253 ?auto_174252 ) ( ON ?auto_174254 ?auto_174253 ) ( ON ?auto_174255 ?auto_174254 ) ( CLEAR ?auto_174259 ) ( ON ?auto_174256 ?auto_174255 ) ( CLEAR ?auto_174256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174257 ?auto_174251 ?auto_174252 ?auto_174253 ?auto_174254 ?auto_174255 )
      ( MAKE-6PILE ?auto_174251 ?auto_174252 ?auto_174253 ?auto_174254 ?auto_174255 ?auto_174256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174260 - BLOCK
      ?auto_174261 - BLOCK
      ?auto_174262 - BLOCK
      ?auto_174263 - BLOCK
      ?auto_174264 - BLOCK
      ?auto_174265 - BLOCK
    )
    :vars
    (
      ?auto_174268 - BLOCK
      ?auto_174266 - BLOCK
      ?auto_174267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174260 ?auto_174261 ) ) ( not ( = ?auto_174260 ?auto_174262 ) ) ( not ( = ?auto_174260 ?auto_174263 ) ) ( not ( = ?auto_174260 ?auto_174264 ) ) ( not ( = ?auto_174260 ?auto_174265 ) ) ( not ( = ?auto_174261 ?auto_174262 ) ) ( not ( = ?auto_174261 ?auto_174263 ) ) ( not ( = ?auto_174261 ?auto_174264 ) ) ( not ( = ?auto_174261 ?auto_174265 ) ) ( not ( = ?auto_174262 ?auto_174263 ) ) ( not ( = ?auto_174262 ?auto_174264 ) ) ( not ( = ?auto_174262 ?auto_174265 ) ) ( not ( = ?auto_174263 ?auto_174264 ) ) ( not ( = ?auto_174263 ?auto_174265 ) ) ( not ( = ?auto_174264 ?auto_174265 ) ) ( not ( = ?auto_174260 ?auto_174268 ) ) ( not ( = ?auto_174261 ?auto_174268 ) ) ( not ( = ?auto_174262 ?auto_174268 ) ) ( not ( = ?auto_174263 ?auto_174268 ) ) ( not ( = ?auto_174264 ?auto_174268 ) ) ( not ( = ?auto_174265 ?auto_174268 ) ) ( ON-TABLE ?auto_174266 ) ( not ( = ?auto_174266 ?auto_174268 ) ) ( not ( = ?auto_174266 ?auto_174265 ) ) ( not ( = ?auto_174266 ?auto_174264 ) ) ( not ( = ?auto_174260 ?auto_174266 ) ) ( not ( = ?auto_174261 ?auto_174266 ) ) ( not ( = ?auto_174262 ?auto_174266 ) ) ( not ( = ?auto_174263 ?auto_174266 ) ) ( ON ?auto_174260 ?auto_174267 ) ( not ( = ?auto_174260 ?auto_174267 ) ) ( not ( = ?auto_174261 ?auto_174267 ) ) ( not ( = ?auto_174262 ?auto_174267 ) ) ( not ( = ?auto_174263 ?auto_174267 ) ) ( not ( = ?auto_174264 ?auto_174267 ) ) ( not ( = ?auto_174265 ?auto_174267 ) ) ( not ( = ?auto_174268 ?auto_174267 ) ) ( not ( = ?auto_174266 ?auto_174267 ) ) ( ON ?auto_174261 ?auto_174260 ) ( ON-TABLE ?auto_174267 ) ( ON ?auto_174262 ?auto_174261 ) ( ON ?auto_174263 ?auto_174262 ) ( ON ?auto_174264 ?auto_174263 ) ( ON ?auto_174265 ?auto_174264 ) ( CLEAR ?auto_174265 ) ( HOLDING ?auto_174268 ) ( CLEAR ?auto_174266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174266 ?auto_174268 )
      ( MAKE-6PILE ?auto_174260 ?auto_174261 ?auto_174262 ?auto_174263 ?auto_174264 ?auto_174265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174269 - BLOCK
      ?auto_174270 - BLOCK
      ?auto_174271 - BLOCK
      ?auto_174272 - BLOCK
      ?auto_174273 - BLOCK
      ?auto_174274 - BLOCK
    )
    :vars
    (
      ?auto_174275 - BLOCK
      ?auto_174277 - BLOCK
      ?auto_174276 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174269 ?auto_174270 ) ) ( not ( = ?auto_174269 ?auto_174271 ) ) ( not ( = ?auto_174269 ?auto_174272 ) ) ( not ( = ?auto_174269 ?auto_174273 ) ) ( not ( = ?auto_174269 ?auto_174274 ) ) ( not ( = ?auto_174270 ?auto_174271 ) ) ( not ( = ?auto_174270 ?auto_174272 ) ) ( not ( = ?auto_174270 ?auto_174273 ) ) ( not ( = ?auto_174270 ?auto_174274 ) ) ( not ( = ?auto_174271 ?auto_174272 ) ) ( not ( = ?auto_174271 ?auto_174273 ) ) ( not ( = ?auto_174271 ?auto_174274 ) ) ( not ( = ?auto_174272 ?auto_174273 ) ) ( not ( = ?auto_174272 ?auto_174274 ) ) ( not ( = ?auto_174273 ?auto_174274 ) ) ( not ( = ?auto_174269 ?auto_174275 ) ) ( not ( = ?auto_174270 ?auto_174275 ) ) ( not ( = ?auto_174271 ?auto_174275 ) ) ( not ( = ?auto_174272 ?auto_174275 ) ) ( not ( = ?auto_174273 ?auto_174275 ) ) ( not ( = ?auto_174274 ?auto_174275 ) ) ( ON-TABLE ?auto_174277 ) ( not ( = ?auto_174277 ?auto_174275 ) ) ( not ( = ?auto_174277 ?auto_174274 ) ) ( not ( = ?auto_174277 ?auto_174273 ) ) ( not ( = ?auto_174269 ?auto_174277 ) ) ( not ( = ?auto_174270 ?auto_174277 ) ) ( not ( = ?auto_174271 ?auto_174277 ) ) ( not ( = ?auto_174272 ?auto_174277 ) ) ( ON ?auto_174269 ?auto_174276 ) ( not ( = ?auto_174269 ?auto_174276 ) ) ( not ( = ?auto_174270 ?auto_174276 ) ) ( not ( = ?auto_174271 ?auto_174276 ) ) ( not ( = ?auto_174272 ?auto_174276 ) ) ( not ( = ?auto_174273 ?auto_174276 ) ) ( not ( = ?auto_174274 ?auto_174276 ) ) ( not ( = ?auto_174275 ?auto_174276 ) ) ( not ( = ?auto_174277 ?auto_174276 ) ) ( ON ?auto_174270 ?auto_174269 ) ( ON-TABLE ?auto_174276 ) ( ON ?auto_174271 ?auto_174270 ) ( ON ?auto_174272 ?auto_174271 ) ( ON ?auto_174273 ?auto_174272 ) ( ON ?auto_174274 ?auto_174273 ) ( CLEAR ?auto_174277 ) ( ON ?auto_174275 ?auto_174274 ) ( CLEAR ?auto_174275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174276 ?auto_174269 ?auto_174270 ?auto_174271 ?auto_174272 ?auto_174273 ?auto_174274 )
      ( MAKE-6PILE ?auto_174269 ?auto_174270 ?auto_174271 ?auto_174272 ?auto_174273 ?auto_174274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174278 - BLOCK
      ?auto_174279 - BLOCK
      ?auto_174280 - BLOCK
      ?auto_174281 - BLOCK
      ?auto_174282 - BLOCK
      ?auto_174283 - BLOCK
    )
    :vars
    (
      ?auto_174284 - BLOCK
      ?auto_174285 - BLOCK
      ?auto_174286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174278 ?auto_174279 ) ) ( not ( = ?auto_174278 ?auto_174280 ) ) ( not ( = ?auto_174278 ?auto_174281 ) ) ( not ( = ?auto_174278 ?auto_174282 ) ) ( not ( = ?auto_174278 ?auto_174283 ) ) ( not ( = ?auto_174279 ?auto_174280 ) ) ( not ( = ?auto_174279 ?auto_174281 ) ) ( not ( = ?auto_174279 ?auto_174282 ) ) ( not ( = ?auto_174279 ?auto_174283 ) ) ( not ( = ?auto_174280 ?auto_174281 ) ) ( not ( = ?auto_174280 ?auto_174282 ) ) ( not ( = ?auto_174280 ?auto_174283 ) ) ( not ( = ?auto_174281 ?auto_174282 ) ) ( not ( = ?auto_174281 ?auto_174283 ) ) ( not ( = ?auto_174282 ?auto_174283 ) ) ( not ( = ?auto_174278 ?auto_174284 ) ) ( not ( = ?auto_174279 ?auto_174284 ) ) ( not ( = ?auto_174280 ?auto_174284 ) ) ( not ( = ?auto_174281 ?auto_174284 ) ) ( not ( = ?auto_174282 ?auto_174284 ) ) ( not ( = ?auto_174283 ?auto_174284 ) ) ( not ( = ?auto_174285 ?auto_174284 ) ) ( not ( = ?auto_174285 ?auto_174283 ) ) ( not ( = ?auto_174285 ?auto_174282 ) ) ( not ( = ?auto_174278 ?auto_174285 ) ) ( not ( = ?auto_174279 ?auto_174285 ) ) ( not ( = ?auto_174280 ?auto_174285 ) ) ( not ( = ?auto_174281 ?auto_174285 ) ) ( ON ?auto_174278 ?auto_174286 ) ( not ( = ?auto_174278 ?auto_174286 ) ) ( not ( = ?auto_174279 ?auto_174286 ) ) ( not ( = ?auto_174280 ?auto_174286 ) ) ( not ( = ?auto_174281 ?auto_174286 ) ) ( not ( = ?auto_174282 ?auto_174286 ) ) ( not ( = ?auto_174283 ?auto_174286 ) ) ( not ( = ?auto_174284 ?auto_174286 ) ) ( not ( = ?auto_174285 ?auto_174286 ) ) ( ON ?auto_174279 ?auto_174278 ) ( ON-TABLE ?auto_174286 ) ( ON ?auto_174280 ?auto_174279 ) ( ON ?auto_174281 ?auto_174280 ) ( ON ?auto_174282 ?auto_174281 ) ( ON ?auto_174283 ?auto_174282 ) ( ON ?auto_174284 ?auto_174283 ) ( CLEAR ?auto_174284 ) ( HOLDING ?auto_174285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174285 )
      ( MAKE-6PILE ?auto_174278 ?auto_174279 ?auto_174280 ?auto_174281 ?auto_174282 ?auto_174283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_174287 - BLOCK
      ?auto_174288 - BLOCK
      ?auto_174289 - BLOCK
      ?auto_174290 - BLOCK
      ?auto_174291 - BLOCK
      ?auto_174292 - BLOCK
    )
    :vars
    (
      ?auto_174293 - BLOCK
      ?auto_174295 - BLOCK
      ?auto_174294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174287 ?auto_174288 ) ) ( not ( = ?auto_174287 ?auto_174289 ) ) ( not ( = ?auto_174287 ?auto_174290 ) ) ( not ( = ?auto_174287 ?auto_174291 ) ) ( not ( = ?auto_174287 ?auto_174292 ) ) ( not ( = ?auto_174288 ?auto_174289 ) ) ( not ( = ?auto_174288 ?auto_174290 ) ) ( not ( = ?auto_174288 ?auto_174291 ) ) ( not ( = ?auto_174288 ?auto_174292 ) ) ( not ( = ?auto_174289 ?auto_174290 ) ) ( not ( = ?auto_174289 ?auto_174291 ) ) ( not ( = ?auto_174289 ?auto_174292 ) ) ( not ( = ?auto_174290 ?auto_174291 ) ) ( not ( = ?auto_174290 ?auto_174292 ) ) ( not ( = ?auto_174291 ?auto_174292 ) ) ( not ( = ?auto_174287 ?auto_174293 ) ) ( not ( = ?auto_174288 ?auto_174293 ) ) ( not ( = ?auto_174289 ?auto_174293 ) ) ( not ( = ?auto_174290 ?auto_174293 ) ) ( not ( = ?auto_174291 ?auto_174293 ) ) ( not ( = ?auto_174292 ?auto_174293 ) ) ( not ( = ?auto_174295 ?auto_174293 ) ) ( not ( = ?auto_174295 ?auto_174292 ) ) ( not ( = ?auto_174295 ?auto_174291 ) ) ( not ( = ?auto_174287 ?auto_174295 ) ) ( not ( = ?auto_174288 ?auto_174295 ) ) ( not ( = ?auto_174289 ?auto_174295 ) ) ( not ( = ?auto_174290 ?auto_174295 ) ) ( ON ?auto_174287 ?auto_174294 ) ( not ( = ?auto_174287 ?auto_174294 ) ) ( not ( = ?auto_174288 ?auto_174294 ) ) ( not ( = ?auto_174289 ?auto_174294 ) ) ( not ( = ?auto_174290 ?auto_174294 ) ) ( not ( = ?auto_174291 ?auto_174294 ) ) ( not ( = ?auto_174292 ?auto_174294 ) ) ( not ( = ?auto_174293 ?auto_174294 ) ) ( not ( = ?auto_174295 ?auto_174294 ) ) ( ON ?auto_174288 ?auto_174287 ) ( ON-TABLE ?auto_174294 ) ( ON ?auto_174289 ?auto_174288 ) ( ON ?auto_174290 ?auto_174289 ) ( ON ?auto_174291 ?auto_174290 ) ( ON ?auto_174292 ?auto_174291 ) ( ON ?auto_174293 ?auto_174292 ) ( ON ?auto_174295 ?auto_174293 ) ( CLEAR ?auto_174295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174294 ?auto_174287 ?auto_174288 ?auto_174289 ?auto_174290 ?auto_174291 ?auto_174292 ?auto_174293 )
      ( MAKE-6PILE ?auto_174287 ?auto_174288 ?auto_174289 ?auto_174290 ?auto_174291 ?auto_174292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174297 - BLOCK
    )
    :vars
    (
      ?auto_174298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174298 ?auto_174297 ) ( CLEAR ?auto_174298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174297 ) ( not ( = ?auto_174297 ?auto_174298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174298 ?auto_174297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174299 - BLOCK
    )
    :vars
    (
      ?auto_174300 - BLOCK
      ?auto_174301 - BLOCK
      ?auto_174302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174300 ?auto_174299 ) ( CLEAR ?auto_174300 ) ( ON-TABLE ?auto_174299 ) ( not ( = ?auto_174299 ?auto_174300 ) ) ( HOLDING ?auto_174301 ) ( CLEAR ?auto_174302 ) ( not ( = ?auto_174299 ?auto_174301 ) ) ( not ( = ?auto_174299 ?auto_174302 ) ) ( not ( = ?auto_174300 ?auto_174301 ) ) ( not ( = ?auto_174300 ?auto_174302 ) ) ( not ( = ?auto_174301 ?auto_174302 ) ) )
    :subtasks
    ( ( !STACK ?auto_174301 ?auto_174302 )
      ( MAKE-1PILE ?auto_174299 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174303 - BLOCK
    )
    :vars
    (
      ?auto_174305 - BLOCK
      ?auto_174306 - BLOCK
      ?auto_174304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174305 ?auto_174303 ) ( ON-TABLE ?auto_174303 ) ( not ( = ?auto_174303 ?auto_174305 ) ) ( CLEAR ?auto_174306 ) ( not ( = ?auto_174303 ?auto_174304 ) ) ( not ( = ?auto_174303 ?auto_174306 ) ) ( not ( = ?auto_174305 ?auto_174304 ) ) ( not ( = ?auto_174305 ?auto_174306 ) ) ( not ( = ?auto_174304 ?auto_174306 ) ) ( ON ?auto_174304 ?auto_174305 ) ( CLEAR ?auto_174304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174303 ?auto_174305 )
      ( MAKE-1PILE ?auto_174303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174307 - BLOCK
    )
    :vars
    (
      ?auto_174308 - BLOCK
      ?auto_174309 - BLOCK
      ?auto_174310 - BLOCK
      ?auto_174313 - BLOCK
      ?auto_174312 - BLOCK
      ?auto_174311 - BLOCK
      ?auto_174314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174308 ?auto_174307 ) ( ON-TABLE ?auto_174307 ) ( not ( = ?auto_174307 ?auto_174308 ) ) ( not ( = ?auto_174307 ?auto_174309 ) ) ( not ( = ?auto_174307 ?auto_174310 ) ) ( not ( = ?auto_174308 ?auto_174309 ) ) ( not ( = ?auto_174308 ?auto_174310 ) ) ( not ( = ?auto_174309 ?auto_174310 ) ) ( ON ?auto_174309 ?auto_174308 ) ( CLEAR ?auto_174309 ) ( HOLDING ?auto_174310 ) ( CLEAR ?auto_174313 ) ( ON-TABLE ?auto_174312 ) ( ON ?auto_174311 ?auto_174312 ) ( ON ?auto_174314 ?auto_174311 ) ( ON ?auto_174313 ?auto_174314 ) ( not ( = ?auto_174312 ?auto_174311 ) ) ( not ( = ?auto_174312 ?auto_174314 ) ) ( not ( = ?auto_174312 ?auto_174313 ) ) ( not ( = ?auto_174312 ?auto_174310 ) ) ( not ( = ?auto_174311 ?auto_174314 ) ) ( not ( = ?auto_174311 ?auto_174313 ) ) ( not ( = ?auto_174311 ?auto_174310 ) ) ( not ( = ?auto_174314 ?auto_174313 ) ) ( not ( = ?auto_174314 ?auto_174310 ) ) ( not ( = ?auto_174313 ?auto_174310 ) ) ( not ( = ?auto_174307 ?auto_174313 ) ) ( not ( = ?auto_174307 ?auto_174312 ) ) ( not ( = ?auto_174307 ?auto_174311 ) ) ( not ( = ?auto_174307 ?auto_174314 ) ) ( not ( = ?auto_174308 ?auto_174313 ) ) ( not ( = ?auto_174308 ?auto_174312 ) ) ( not ( = ?auto_174308 ?auto_174311 ) ) ( not ( = ?auto_174308 ?auto_174314 ) ) ( not ( = ?auto_174309 ?auto_174313 ) ) ( not ( = ?auto_174309 ?auto_174312 ) ) ( not ( = ?auto_174309 ?auto_174311 ) ) ( not ( = ?auto_174309 ?auto_174314 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174312 ?auto_174311 ?auto_174314 ?auto_174313 ?auto_174310 )
      ( MAKE-1PILE ?auto_174307 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174315 - BLOCK
    )
    :vars
    (
      ?auto_174316 - BLOCK
      ?auto_174320 - BLOCK
      ?auto_174319 - BLOCK
      ?auto_174321 - BLOCK
      ?auto_174322 - BLOCK
      ?auto_174318 - BLOCK
      ?auto_174317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174316 ?auto_174315 ) ( ON-TABLE ?auto_174315 ) ( not ( = ?auto_174315 ?auto_174316 ) ) ( not ( = ?auto_174315 ?auto_174320 ) ) ( not ( = ?auto_174315 ?auto_174319 ) ) ( not ( = ?auto_174316 ?auto_174320 ) ) ( not ( = ?auto_174316 ?auto_174319 ) ) ( not ( = ?auto_174320 ?auto_174319 ) ) ( ON ?auto_174320 ?auto_174316 ) ( CLEAR ?auto_174321 ) ( ON-TABLE ?auto_174322 ) ( ON ?auto_174318 ?auto_174322 ) ( ON ?auto_174317 ?auto_174318 ) ( ON ?auto_174321 ?auto_174317 ) ( not ( = ?auto_174322 ?auto_174318 ) ) ( not ( = ?auto_174322 ?auto_174317 ) ) ( not ( = ?auto_174322 ?auto_174321 ) ) ( not ( = ?auto_174322 ?auto_174319 ) ) ( not ( = ?auto_174318 ?auto_174317 ) ) ( not ( = ?auto_174318 ?auto_174321 ) ) ( not ( = ?auto_174318 ?auto_174319 ) ) ( not ( = ?auto_174317 ?auto_174321 ) ) ( not ( = ?auto_174317 ?auto_174319 ) ) ( not ( = ?auto_174321 ?auto_174319 ) ) ( not ( = ?auto_174315 ?auto_174321 ) ) ( not ( = ?auto_174315 ?auto_174322 ) ) ( not ( = ?auto_174315 ?auto_174318 ) ) ( not ( = ?auto_174315 ?auto_174317 ) ) ( not ( = ?auto_174316 ?auto_174321 ) ) ( not ( = ?auto_174316 ?auto_174322 ) ) ( not ( = ?auto_174316 ?auto_174318 ) ) ( not ( = ?auto_174316 ?auto_174317 ) ) ( not ( = ?auto_174320 ?auto_174321 ) ) ( not ( = ?auto_174320 ?auto_174322 ) ) ( not ( = ?auto_174320 ?auto_174318 ) ) ( not ( = ?auto_174320 ?auto_174317 ) ) ( ON ?auto_174319 ?auto_174320 ) ( CLEAR ?auto_174319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174315 ?auto_174316 ?auto_174320 )
      ( MAKE-1PILE ?auto_174315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174323 - BLOCK
    )
    :vars
    (
      ?auto_174329 - BLOCK
      ?auto_174330 - BLOCK
      ?auto_174324 - BLOCK
      ?auto_174328 - BLOCK
      ?auto_174325 - BLOCK
      ?auto_174326 - BLOCK
      ?auto_174327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174329 ?auto_174323 ) ( ON-TABLE ?auto_174323 ) ( not ( = ?auto_174323 ?auto_174329 ) ) ( not ( = ?auto_174323 ?auto_174330 ) ) ( not ( = ?auto_174323 ?auto_174324 ) ) ( not ( = ?auto_174329 ?auto_174330 ) ) ( not ( = ?auto_174329 ?auto_174324 ) ) ( not ( = ?auto_174330 ?auto_174324 ) ) ( ON ?auto_174330 ?auto_174329 ) ( ON-TABLE ?auto_174328 ) ( ON ?auto_174325 ?auto_174328 ) ( ON ?auto_174326 ?auto_174325 ) ( not ( = ?auto_174328 ?auto_174325 ) ) ( not ( = ?auto_174328 ?auto_174326 ) ) ( not ( = ?auto_174328 ?auto_174327 ) ) ( not ( = ?auto_174328 ?auto_174324 ) ) ( not ( = ?auto_174325 ?auto_174326 ) ) ( not ( = ?auto_174325 ?auto_174327 ) ) ( not ( = ?auto_174325 ?auto_174324 ) ) ( not ( = ?auto_174326 ?auto_174327 ) ) ( not ( = ?auto_174326 ?auto_174324 ) ) ( not ( = ?auto_174327 ?auto_174324 ) ) ( not ( = ?auto_174323 ?auto_174327 ) ) ( not ( = ?auto_174323 ?auto_174328 ) ) ( not ( = ?auto_174323 ?auto_174325 ) ) ( not ( = ?auto_174323 ?auto_174326 ) ) ( not ( = ?auto_174329 ?auto_174327 ) ) ( not ( = ?auto_174329 ?auto_174328 ) ) ( not ( = ?auto_174329 ?auto_174325 ) ) ( not ( = ?auto_174329 ?auto_174326 ) ) ( not ( = ?auto_174330 ?auto_174327 ) ) ( not ( = ?auto_174330 ?auto_174328 ) ) ( not ( = ?auto_174330 ?auto_174325 ) ) ( not ( = ?auto_174330 ?auto_174326 ) ) ( ON ?auto_174324 ?auto_174330 ) ( CLEAR ?auto_174324 ) ( HOLDING ?auto_174327 ) ( CLEAR ?auto_174326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174328 ?auto_174325 ?auto_174326 ?auto_174327 )
      ( MAKE-1PILE ?auto_174323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174331 - BLOCK
    )
    :vars
    (
      ?auto_174335 - BLOCK
      ?auto_174334 - BLOCK
      ?auto_174332 - BLOCK
      ?auto_174338 - BLOCK
      ?auto_174333 - BLOCK
      ?auto_174336 - BLOCK
      ?auto_174337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174335 ?auto_174331 ) ( ON-TABLE ?auto_174331 ) ( not ( = ?auto_174331 ?auto_174335 ) ) ( not ( = ?auto_174331 ?auto_174334 ) ) ( not ( = ?auto_174331 ?auto_174332 ) ) ( not ( = ?auto_174335 ?auto_174334 ) ) ( not ( = ?auto_174335 ?auto_174332 ) ) ( not ( = ?auto_174334 ?auto_174332 ) ) ( ON ?auto_174334 ?auto_174335 ) ( ON-TABLE ?auto_174338 ) ( ON ?auto_174333 ?auto_174338 ) ( ON ?auto_174336 ?auto_174333 ) ( not ( = ?auto_174338 ?auto_174333 ) ) ( not ( = ?auto_174338 ?auto_174336 ) ) ( not ( = ?auto_174338 ?auto_174337 ) ) ( not ( = ?auto_174338 ?auto_174332 ) ) ( not ( = ?auto_174333 ?auto_174336 ) ) ( not ( = ?auto_174333 ?auto_174337 ) ) ( not ( = ?auto_174333 ?auto_174332 ) ) ( not ( = ?auto_174336 ?auto_174337 ) ) ( not ( = ?auto_174336 ?auto_174332 ) ) ( not ( = ?auto_174337 ?auto_174332 ) ) ( not ( = ?auto_174331 ?auto_174337 ) ) ( not ( = ?auto_174331 ?auto_174338 ) ) ( not ( = ?auto_174331 ?auto_174333 ) ) ( not ( = ?auto_174331 ?auto_174336 ) ) ( not ( = ?auto_174335 ?auto_174337 ) ) ( not ( = ?auto_174335 ?auto_174338 ) ) ( not ( = ?auto_174335 ?auto_174333 ) ) ( not ( = ?auto_174335 ?auto_174336 ) ) ( not ( = ?auto_174334 ?auto_174337 ) ) ( not ( = ?auto_174334 ?auto_174338 ) ) ( not ( = ?auto_174334 ?auto_174333 ) ) ( not ( = ?auto_174334 ?auto_174336 ) ) ( ON ?auto_174332 ?auto_174334 ) ( CLEAR ?auto_174336 ) ( ON ?auto_174337 ?auto_174332 ) ( CLEAR ?auto_174337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174331 ?auto_174335 ?auto_174334 ?auto_174332 )
      ( MAKE-1PILE ?auto_174331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174339 - BLOCK
    )
    :vars
    (
      ?auto_174342 - BLOCK
      ?auto_174340 - BLOCK
      ?auto_174345 - BLOCK
      ?auto_174344 - BLOCK
      ?auto_174346 - BLOCK
      ?auto_174341 - BLOCK
      ?auto_174343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174342 ?auto_174339 ) ( ON-TABLE ?auto_174339 ) ( not ( = ?auto_174339 ?auto_174342 ) ) ( not ( = ?auto_174339 ?auto_174340 ) ) ( not ( = ?auto_174339 ?auto_174345 ) ) ( not ( = ?auto_174342 ?auto_174340 ) ) ( not ( = ?auto_174342 ?auto_174345 ) ) ( not ( = ?auto_174340 ?auto_174345 ) ) ( ON ?auto_174340 ?auto_174342 ) ( ON-TABLE ?auto_174344 ) ( ON ?auto_174346 ?auto_174344 ) ( not ( = ?auto_174344 ?auto_174346 ) ) ( not ( = ?auto_174344 ?auto_174341 ) ) ( not ( = ?auto_174344 ?auto_174343 ) ) ( not ( = ?auto_174344 ?auto_174345 ) ) ( not ( = ?auto_174346 ?auto_174341 ) ) ( not ( = ?auto_174346 ?auto_174343 ) ) ( not ( = ?auto_174346 ?auto_174345 ) ) ( not ( = ?auto_174341 ?auto_174343 ) ) ( not ( = ?auto_174341 ?auto_174345 ) ) ( not ( = ?auto_174343 ?auto_174345 ) ) ( not ( = ?auto_174339 ?auto_174343 ) ) ( not ( = ?auto_174339 ?auto_174344 ) ) ( not ( = ?auto_174339 ?auto_174346 ) ) ( not ( = ?auto_174339 ?auto_174341 ) ) ( not ( = ?auto_174342 ?auto_174343 ) ) ( not ( = ?auto_174342 ?auto_174344 ) ) ( not ( = ?auto_174342 ?auto_174346 ) ) ( not ( = ?auto_174342 ?auto_174341 ) ) ( not ( = ?auto_174340 ?auto_174343 ) ) ( not ( = ?auto_174340 ?auto_174344 ) ) ( not ( = ?auto_174340 ?auto_174346 ) ) ( not ( = ?auto_174340 ?auto_174341 ) ) ( ON ?auto_174345 ?auto_174340 ) ( ON ?auto_174343 ?auto_174345 ) ( CLEAR ?auto_174343 ) ( HOLDING ?auto_174341 ) ( CLEAR ?auto_174346 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174344 ?auto_174346 ?auto_174341 )
      ( MAKE-1PILE ?auto_174339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174347 - BLOCK
    )
    :vars
    (
      ?auto_174352 - BLOCK
      ?auto_174350 - BLOCK
      ?auto_174349 - BLOCK
      ?auto_174351 - BLOCK
      ?auto_174348 - BLOCK
      ?auto_174354 - BLOCK
      ?auto_174353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174352 ?auto_174347 ) ( ON-TABLE ?auto_174347 ) ( not ( = ?auto_174347 ?auto_174352 ) ) ( not ( = ?auto_174347 ?auto_174350 ) ) ( not ( = ?auto_174347 ?auto_174349 ) ) ( not ( = ?auto_174352 ?auto_174350 ) ) ( not ( = ?auto_174352 ?auto_174349 ) ) ( not ( = ?auto_174350 ?auto_174349 ) ) ( ON ?auto_174350 ?auto_174352 ) ( ON-TABLE ?auto_174351 ) ( ON ?auto_174348 ?auto_174351 ) ( not ( = ?auto_174351 ?auto_174348 ) ) ( not ( = ?auto_174351 ?auto_174354 ) ) ( not ( = ?auto_174351 ?auto_174353 ) ) ( not ( = ?auto_174351 ?auto_174349 ) ) ( not ( = ?auto_174348 ?auto_174354 ) ) ( not ( = ?auto_174348 ?auto_174353 ) ) ( not ( = ?auto_174348 ?auto_174349 ) ) ( not ( = ?auto_174354 ?auto_174353 ) ) ( not ( = ?auto_174354 ?auto_174349 ) ) ( not ( = ?auto_174353 ?auto_174349 ) ) ( not ( = ?auto_174347 ?auto_174353 ) ) ( not ( = ?auto_174347 ?auto_174351 ) ) ( not ( = ?auto_174347 ?auto_174348 ) ) ( not ( = ?auto_174347 ?auto_174354 ) ) ( not ( = ?auto_174352 ?auto_174353 ) ) ( not ( = ?auto_174352 ?auto_174351 ) ) ( not ( = ?auto_174352 ?auto_174348 ) ) ( not ( = ?auto_174352 ?auto_174354 ) ) ( not ( = ?auto_174350 ?auto_174353 ) ) ( not ( = ?auto_174350 ?auto_174351 ) ) ( not ( = ?auto_174350 ?auto_174348 ) ) ( not ( = ?auto_174350 ?auto_174354 ) ) ( ON ?auto_174349 ?auto_174350 ) ( ON ?auto_174353 ?auto_174349 ) ( CLEAR ?auto_174348 ) ( ON ?auto_174354 ?auto_174353 ) ( CLEAR ?auto_174354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174347 ?auto_174352 ?auto_174350 ?auto_174349 ?auto_174353 )
      ( MAKE-1PILE ?auto_174347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174355 - BLOCK
    )
    :vars
    (
      ?auto_174359 - BLOCK
      ?auto_174358 - BLOCK
      ?auto_174356 - BLOCK
      ?auto_174361 - BLOCK
      ?auto_174360 - BLOCK
      ?auto_174357 - BLOCK
      ?auto_174362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174359 ?auto_174355 ) ( ON-TABLE ?auto_174355 ) ( not ( = ?auto_174355 ?auto_174359 ) ) ( not ( = ?auto_174355 ?auto_174358 ) ) ( not ( = ?auto_174355 ?auto_174356 ) ) ( not ( = ?auto_174359 ?auto_174358 ) ) ( not ( = ?auto_174359 ?auto_174356 ) ) ( not ( = ?auto_174358 ?auto_174356 ) ) ( ON ?auto_174358 ?auto_174359 ) ( ON-TABLE ?auto_174361 ) ( not ( = ?auto_174361 ?auto_174360 ) ) ( not ( = ?auto_174361 ?auto_174357 ) ) ( not ( = ?auto_174361 ?auto_174362 ) ) ( not ( = ?auto_174361 ?auto_174356 ) ) ( not ( = ?auto_174360 ?auto_174357 ) ) ( not ( = ?auto_174360 ?auto_174362 ) ) ( not ( = ?auto_174360 ?auto_174356 ) ) ( not ( = ?auto_174357 ?auto_174362 ) ) ( not ( = ?auto_174357 ?auto_174356 ) ) ( not ( = ?auto_174362 ?auto_174356 ) ) ( not ( = ?auto_174355 ?auto_174362 ) ) ( not ( = ?auto_174355 ?auto_174361 ) ) ( not ( = ?auto_174355 ?auto_174360 ) ) ( not ( = ?auto_174355 ?auto_174357 ) ) ( not ( = ?auto_174359 ?auto_174362 ) ) ( not ( = ?auto_174359 ?auto_174361 ) ) ( not ( = ?auto_174359 ?auto_174360 ) ) ( not ( = ?auto_174359 ?auto_174357 ) ) ( not ( = ?auto_174358 ?auto_174362 ) ) ( not ( = ?auto_174358 ?auto_174361 ) ) ( not ( = ?auto_174358 ?auto_174360 ) ) ( not ( = ?auto_174358 ?auto_174357 ) ) ( ON ?auto_174356 ?auto_174358 ) ( ON ?auto_174362 ?auto_174356 ) ( ON ?auto_174357 ?auto_174362 ) ( CLEAR ?auto_174357 ) ( HOLDING ?auto_174360 ) ( CLEAR ?auto_174361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174361 ?auto_174360 )
      ( MAKE-1PILE ?auto_174355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174363 - BLOCK
    )
    :vars
    (
      ?auto_174364 - BLOCK
      ?auto_174365 - BLOCK
      ?auto_174366 - BLOCK
      ?auto_174367 - BLOCK
      ?auto_174369 - BLOCK
      ?auto_174370 - BLOCK
      ?auto_174368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174364 ?auto_174363 ) ( ON-TABLE ?auto_174363 ) ( not ( = ?auto_174363 ?auto_174364 ) ) ( not ( = ?auto_174363 ?auto_174365 ) ) ( not ( = ?auto_174363 ?auto_174366 ) ) ( not ( = ?auto_174364 ?auto_174365 ) ) ( not ( = ?auto_174364 ?auto_174366 ) ) ( not ( = ?auto_174365 ?auto_174366 ) ) ( ON ?auto_174365 ?auto_174364 ) ( ON-TABLE ?auto_174367 ) ( not ( = ?auto_174367 ?auto_174369 ) ) ( not ( = ?auto_174367 ?auto_174370 ) ) ( not ( = ?auto_174367 ?auto_174368 ) ) ( not ( = ?auto_174367 ?auto_174366 ) ) ( not ( = ?auto_174369 ?auto_174370 ) ) ( not ( = ?auto_174369 ?auto_174368 ) ) ( not ( = ?auto_174369 ?auto_174366 ) ) ( not ( = ?auto_174370 ?auto_174368 ) ) ( not ( = ?auto_174370 ?auto_174366 ) ) ( not ( = ?auto_174368 ?auto_174366 ) ) ( not ( = ?auto_174363 ?auto_174368 ) ) ( not ( = ?auto_174363 ?auto_174367 ) ) ( not ( = ?auto_174363 ?auto_174369 ) ) ( not ( = ?auto_174363 ?auto_174370 ) ) ( not ( = ?auto_174364 ?auto_174368 ) ) ( not ( = ?auto_174364 ?auto_174367 ) ) ( not ( = ?auto_174364 ?auto_174369 ) ) ( not ( = ?auto_174364 ?auto_174370 ) ) ( not ( = ?auto_174365 ?auto_174368 ) ) ( not ( = ?auto_174365 ?auto_174367 ) ) ( not ( = ?auto_174365 ?auto_174369 ) ) ( not ( = ?auto_174365 ?auto_174370 ) ) ( ON ?auto_174366 ?auto_174365 ) ( ON ?auto_174368 ?auto_174366 ) ( ON ?auto_174370 ?auto_174368 ) ( CLEAR ?auto_174367 ) ( ON ?auto_174369 ?auto_174370 ) ( CLEAR ?auto_174369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174363 ?auto_174364 ?auto_174365 ?auto_174366 ?auto_174368 ?auto_174370 )
      ( MAKE-1PILE ?auto_174363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174371 - BLOCK
    )
    :vars
    (
      ?auto_174378 - BLOCK
      ?auto_174375 - BLOCK
      ?auto_174376 - BLOCK
      ?auto_174374 - BLOCK
      ?auto_174373 - BLOCK
      ?auto_174372 - BLOCK
      ?auto_174377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174378 ?auto_174371 ) ( ON-TABLE ?auto_174371 ) ( not ( = ?auto_174371 ?auto_174378 ) ) ( not ( = ?auto_174371 ?auto_174375 ) ) ( not ( = ?auto_174371 ?auto_174376 ) ) ( not ( = ?auto_174378 ?auto_174375 ) ) ( not ( = ?auto_174378 ?auto_174376 ) ) ( not ( = ?auto_174375 ?auto_174376 ) ) ( ON ?auto_174375 ?auto_174378 ) ( not ( = ?auto_174374 ?auto_174373 ) ) ( not ( = ?auto_174374 ?auto_174372 ) ) ( not ( = ?auto_174374 ?auto_174377 ) ) ( not ( = ?auto_174374 ?auto_174376 ) ) ( not ( = ?auto_174373 ?auto_174372 ) ) ( not ( = ?auto_174373 ?auto_174377 ) ) ( not ( = ?auto_174373 ?auto_174376 ) ) ( not ( = ?auto_174372 ?auto_174377 ) ) ( not ( = ?auto_174372 ?auto_174376 ) ) ( not ( = ?auto_174377 ?auto_174376 ) ) ( not ( = ?auto_174371 ?auto_174377 ) ) ( not ( = ?auto_174371 ?auto_174374 ) ) ( not ( = ?auto_174371 ?auto_174373 ) ) ( not ( = ?auto_174371 ?auto_174372 ) ) ( not ( = ?auto_174378 ?auto_174377 ) ) ( not ( = ?auto_174378 ?auto_174374 ) ) ( not ( = ?auto_174378 ?auto_174373 ) ) ( not ( = ?auto_174378 ?auto_174372 ) ) ( not ( = ?auto_174375 ?auto_174377 ) ) ( not ( = ?auto_174375 ?auto_174374 ) ) ( not ( = ?auto_174375 ?auto_174373 ) ) ( not ( = ?auto_174375 ?auto_174372 ) ) ( ON ?auto_174376 ?auto_174375 ) ( ON ?auto_174377 ?auto_174376 ) ( ON ?auto_174372 ?auto_174377 ) ( ON ?auto_174373 ?auto_174372 ) ( CLEAR ?auto_174373 ) ( HOLDING ?auto_174374 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174374 )
      ( MAKE-1PILE ?auto_174371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174379 - BLOCK
    )
    :vars
    (
      ?auto_174382 - BLOCK
      ?auto_174384 - BLOCK
      ?auto_174383 - BLOCK
      ?auto_174385 - BLOCK
      ?auto_174381 - BLOCK
      ?auto_174386 - BLOCK
      ?auto_174380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174382 ?auto_174379 ) ( ON-TABLE ?auto_174379 ) ( not ( = ?auto_174379 ?auto_174382 ) ) ( not ( = ?auto_174379 ?auto_174384 ) ) ( not ( = ?auto_174379 ?auto_174383 ) ) ( not ( = ?auto_174382 ?auto_174384 ) ) ( not ( = ?auto_174382 ?auto_174383 ) ) ( not ( = ?auto_174384 ?auto_174383 ) ) ( ON ?auto_174384 ?auto_174382 ) ( not ( = ?auto_174385 ?auto_174381 ) ) ( not ( = ?auto_174385 ?auto_174386 ) ) ( not ( = ?auto_174385 ?auto_174380 ) ) ( not ( = ?auto_174385 ?auto_174383 ) ) ( not ( = ?auto_174381 ?auto_174386 ) ) ( not ( = ?auto_174381 ?auto_174380 ) ) ( not ( = ?auto_174381 ?auto_174383 ) ) ( not ( = ?auto_174386 ?auto_174380 ) ) ( not ( = ?auto_174386 ?auto_174383 ) ) ( not ( = ?auto_174380 ?auto_174383 ) ) ( not ( = ?auto_174379 ?auto_174380 ) ) ( not ( = ?auto_174379 ?auto_174385 ) ) ( not ( = ?auto_174379 ?auto_174381 ) ) ( not ( = ?auto_174379 ?auto_174386 ) ) ( not ( = ?auto_174382 ?auto_174380 ) ) ( not ( = ?auto_174382 ?auto_174385 ) ) ( not ( = ?auto_174382 ?auto_174381 ) ) ( not ( = ?auto_174382 ?auto_174386 ) ) ( not ( = ?auto_174384 ?auto_174380 ) ) ( not ( = ?auto_174384 ?auto_174385 ) ) ( not ( = ?auto_174384 ?auto_174381 ) ) ( not ( = ?auto_174384 ?auto_174386 ) ) ( ON ?auto_174383 ?auto_174384 ) ( ON ?auto_174380 ?auto_174383 ) ( ON ?auto_174386 ?auto_174380 ) ( ON ?auto_174381 ?auto_174386 ) ( ON ?auto_174385 ?auto_174381 ) ( CLEAR ?auto_174385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174379 ?auto_174382 ?auto_174384 ?auto_174383 ?auto_174380 ?auto_174386 ?auto_174381 )
      ( MAKE-1PILE ?auto_174379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174387 - BLOCK
    )
    :vars
    (
      ?auto_174393 - BLOCK
      ?auto_174392 - BLOCK
      ?auto_174388 - BLOCK
      ?auto_174389 - BLOCK
      ?auto_174390 - BLOCK
      ?auto_174391 - BLOCK
      ?auto_174394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174393 ?auto_174387 ) ( ON-TABLE ?auto_174387 ) ( not ( = ?auto_174387 ?auto_174393 ) ) ( not ( = ?auto_174387 ?auto_174392 ) ) ( not ( = ?auto_174387 ?auto_174388 ) ) ( not ( = ?auto_174393 ?auto_174392 ) ) ( not ( = ?auto_174393 ?auto_174388 ) ) ( not ( = ?auto_174392 ?auto_174388 ) ) ( ON ?auto_174392 ?auto_174393 ) ( not ( = ?auto_174389 ?auto_174390 ) ) ( not ( = ?auto_174389 ?auto_174391 ) ) ( not ( = ?auto_174389 ?auto_174394 ) ) ( not ( = ?auto_174389 ?auto_174388 ) ) ( not ( = ?auto_174390 ?auto_174391 ) ) ( not ( = ?auto_174390 ?auto_174394 ) ) ( not ( = ?auto_174390 ?auto_174388 ) ) ( not ( = ?auto_174391 ?auto_174394 ) ) ( not ( = ?auto_174391 ?auto_174388 ) ) ( not ( = ?auto_174394 ?auto_174388 ) ) ( not ( = ?auto_174387 ?auto_174394 ) ) ( not ( = ?auto_174387 ?auto_174389 ) ) ( not ( = ?auto_174387 ?auto_174390 ) ) ( not ( = ?auto_174387 ?auto_174391 ) ) ( not ( = ?auto_174393 ?auto_174394 ) ) ( not ( = ?auto_174393 ?auto_174389 ) ) ( not ( = ?auto_174393 ?auto_174390 ) ) ( not ( = ?auto_174393 ?auto_174391 ) ) ( not ( = ?auto_174392 ?auto_174394 ) ) ( not ( = ?auto_174392 ?auto_174389 ) ) ( not ( = ?auto_174392 ?auto_174390 ) ) ( not ( = ?auto_174392 ?auto_174391 ) ) ( ON ?auto_174388 ?auto_174392 ) ( ON ?auto_174394 ?auto_174388 ) ( ON ?auto_174391 ?auto_174394 ) ( ON ?auto_174390 ?auto_174391 ) ( HOLDING ?auto_174389 ) ( CLEAR ?auto_174390 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174387 ?auto_174393 ?auto_174392 ?auto_174388 ?auto_174394 ?auto_174391 ?auto_174390 ?auto_174389 )
      ( MAKE-1PILE ?auto_174387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174395 - BLOCK
    )
    :vars
    (
      ?auto_174396 - BLOCK
      ?auto_174401 - BLOCK
      ?auto_174399 - BLOCK
      ?auto_174397 - BLOCK
      ?auto_174398 - BLOCK
      ?auto_174400 - BLOCK
      ?auto_174402 - BLOCK
      ?auto_174403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174396 ?auto_174395 ) ( ON-TABLE ?auto_174395 ) ( not ( = ?auto_174395 ?auto_174396 ) ) ( not ( = ?auto_174395 ?auto_174401 ) ) ( not ( = ?auto_174395 ?auto_174399 ) ) ( not ( = ?auto_174396 ?auto_174401 ) ) ( not ( = ?auto_174396 ?auto_174399 ) ) ( not ( = ?auto_174401 ?auto_174399 ) ) ( ON ?auto_174401 ?auto_174396 ) ( not ( = ?auto_174397 ?auto_174398 ) ) ( not ( = ?auto_174397 ?auto_174400 ) ) ( not ( = ?auto_174397 ?auto_174402 ) ) ( not ( = ?auto_174397 ?auto_174399 ) ) ( not ( = ?auto_174398 ?auto_174400 ) ) ( not ( = ?auto_174398 ?auto_174402 ) ) ( not ( = ?auto_174398 ?auto_174399 ) ) ( not ( = ?auto_174400 ?auto_174402 ) ) ( not ( = ?auto_174400 ?auto_174399 ) ) ( not ( = ?auto_174402 ?auto_174399 ) ) ( not ( = ?auto_174395 ?auto_174402 ) ) ( not ( = ?auto_174395 ?auto_174397 ) ) ( not ( = ?auto_174395 ?auto_174398 ) ) ( not ( = ?auto_174395 ?auto_174400 ) ) ( not ( = ?auto_174396 ?auto_174402 ) ) ( not ( = ?auto_174396 ?auto_174397 ) ) ( not ( = ?auto_174396 ?auto_174398 ) ) ( not ( = ?auto_174396 ?auto_174400 ) ) ( not ( = ?auto_174401 ?auto_174402 ) ) ( not ( = ?auto_174401 ?auto_174397 ) ) ( not ( = ?auto_174401 ?auto_174398 ) ) ( not ( = ?auto_174401 ?auto_174400 ) ) ( ON ?auto_174399 ?auto_174401 ) ( ON ?auto_174402 ?auto_174399 ) ( ON ?auto_174400 ?auto_174402 ) ( ON ?auto_174398 ?auto_174400 ) ( CLEAR ?auto_174398 ) ( ON ?auto_174397 ?auto_174403 ) ( CLEAR ?auto_174397 ) ( HAND-EMPTY ) ( not ( = ?auto_174395 ?auto_174403 ) ) ( not ( = ?auto_174396 ?auto_174403 ) ) ( not ( = ?auto_174401 ?auto_174403 ) ) ( not ( = ?auto_174399 ?auto_174403 ) ) ( not ( = ?auto_174397 ?auto_174403 ) ) ( not ( = ?auto_174398 ?auto_174403 ) ) ( not ( = ?auto_174400 ?auto_174403 ) ) ( not ( = ?auto_174402 ?auto_174403 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174397 ?auto_174403 )
      ( MAKE-1PILE ?auto_174395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174404 - BLOCK
    )
    :vars
    (
      ?auto_174405 - BLOCK
      ?auto_174408 - BLOCK
      ?auto_174409 - BLOCK
      ?auto_174407 - BLOCK
      ?auto_174410 - BLOCK
      ?auto_174406 - BLOCK
      ?auto_174411 - BLOCK
      ?auto_174412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174405 ?auto_174404 ) ( ON-TABLE ?auto_174404 ) ( not ( = ?auto_174404 ?auto_174405 ) ) ( not ( = ?auto_174404 ?auto_174408 ) ) ( not ( = ?auto_174404 ?auto_174409 ) ) ( not ( = ?auto_174405 ?auto_174408 ) ) ( not ( = ?auto_174405 ?auto_174409 ) ) ( not ( = ?auto_174408 ?auto_174409 ) ) ( ON ?auto_174408 ?auto_174405 ) ( not ( = ?auto_174407 ?auto_174410 ) ) ( not ( = ?auto_174407 ?auto_174406 ) ) ( not ( = ?auto_174407 ?auto_174411 ) ) ( not ( = ?auto_174407 ?auto_174409 ) ) ( not ( = ?auto_174410 ?auto_174406 ) ) ( not ( = ?auto_174410 ?auto_174411 ) ) ( not ( = ?auto_174410 ?auto_174409 ) ) ( not ( = ?auto_174406 ?auto_174411 ) ) ( not ( = ?auto_174406 ?auto_174409 ) ) ( not ( = ?auto_174411 ?auto_174409 ) ) ( not ( = ?auto_174404 ?auto_174411 ) ) ( not ( = ?auto_174404 ?auto_174407 ) ) ( not ( = ?auto_174404 ?auto_174410 ) ) ( not ( = ?auto_174404 ?auto_174406 ) ) ( not ( = ?auto_174405 ?auto_174411 ) ) ( not ( = ?auto_174405 ?auto_174407 ) ) ( not ( = ?auto_174405 ?auto_174410 ) ) ( not ( = ?auto_174405 ?auto_174406 ) ) ( not ( = ?auto_174408 ?auto_174411 ) ) ( not ( = ?auto_174408 ?auto_174407 ) ) ( not ( = ?auto_174408 ?auto_174410 ) ) ( not ( = ?auto_174408 ?auto_174406 ) ) ( ON ?auto_174409 ?auto_174408 ) ( ON ?auto_174411 ?auto_174409 ) ( ON ?auto_174406 ?auto_174411 ) ( ON ?auto_174407 ?auto_174412 ) ( CLEAR ?auto_174407 ) ( not ( = ?auto_174404 ?auto_174412 ) ) ( not ( = ?auto_174405 ?auto_174412 ) ) ( not ( = ?auto_174408 ?auto_174412 ) ) ( not ( = ?auto_174409 ?auto_174412 ) ) ( not ( = ?auto_174407 ?auto_174412 ) ) ( not ( = ?auto_174410 ?auto_174412 ) ) ( not ( = ?auto_174406 ?auto_174412 ) ) ( not ( = ?auto_174411 ?auto_174412 ) ) ( HOLDING ?auto_174410 ) ( CLEAR ?auto_174406 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174404 ?auto_174405 ?auto_174408 ?auto_174409 ?auto_174411 ?auto_174406 ?auto_174410 )
      ( MAKE-1PILE ?auto_174404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174413 - BLOCK
    )
    :vars
    (
      ?auto_174421 - BLOCK
      ?auto_174418 - BLOCK
      ?auto_174420 - BLOCK
      ?auto_174417 - BLOCK
      ?auto_174414 - BLOCK
      ?auto_174415 - BLOCK
      ?auto_174416 - BLOCK
      ?auto_174419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174421 ?auto_174413 ) ( ON-TABLE ?auto_174413 ) ( not ( = ?auto_174413 ?auto_174421 ) ) ( not ( = ?auto_174413 ?auto_174418 ) ) ( not ( = ?auto_174413 ?auto_174420 ) ) ( not ( = ?auto_174421 ?auto_174418 ) ) ( not ( = ?auto_174421 ?auto_174420 ) ) ( not ( = ?auto_174418 ?auto_174420 ) ) ( ON ?auto_174418 ?auto_174421 ) ( not ( = ?auto_174417 ?auto_174414 ) ) ( not ( = ?auto_174417 ?auto_174415 ) ) ( not ( = ?auto_174417 ?auto_174416 ) ) ( not ( = ?auto_174417 ?auto_174420 ) ) ( not ( = ?auto_174414 ?auto_174415 ) ) ( not ( = ?auto_174414 ?auto_174416 ) ) ( not ( = ?auto_174414 ?auto_174420 ) ) ( not ( = ?auto_174415 ?auto_174416 ) ) ( not ( = ?auto_174415 ?auto_174420 ) ) ( not ( = ?auto_174416 ?auto_174420 ) ) ( not ( = ?auto_174413 ?auto_174416 ) ) ( not ( = ?auto_174413 ?auto_174417 ) ) ( not ( = ?auto_174413 ?auto_174414 ) ) ( not ( = ?auto_174413 ?auto_174415 ) ) ( not ( = ?auto_174421 ?auto_174416 ) ) ( not ( = ?auto_174421 ?auto_174417 ) ) ( not ( = ?auto_174421 ?auto_174414 ) ) ( not ( = ?auto_174421 ?auto_174415 ) ) ( not ( = ?auto_174418 ?auto_174416 ) ) ( not ( = ?auto_174418 ?auto_174417 ) ) ( not ( = ?auto_174418 ?auto_174414 ) ) ( not ( = ?auto_174418 ?auto_174415 ) ) ( ON ?auto_174420 ?auto_174418 ) ( ON ?auto_174416 ?auto_174420 ) ( ON ?auto_174415 ?auto_174416 ) ( ON ?auto_174417 ?auto_174419 ) ( not ( = ?auto_174413 ?auto_174419 ) ) ( not ( = ?auto_174421 ?auto_174419 ) ) ( not ( = ?auto_174418 ?auto_174419 ) ) ( not ( = ?auto_174420 ?auto_174419 ) ) ( not ( = ?auto_174417 ?auto_174419 ) ) ( not ( = ?auto_174414 ?auto_174419 ) ) ( not ( = ?auto_174415 ?auto_174419 ) ) ( not ( = ?auto_174416 ?auto_174419 ) ) ( CLEAR ?auto_174415 ) ( ON ?auto_174414 ?auto_174417 ) ( CLEAR ?auto_174414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174419 ?auto_174417 )
      ( MAKE-1PILE ?auto_174413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174422 - BLOCK
    )
    :vars
    (
      ?auto_174426 - BLOCK
      ?auto_174428 - BLOCK
      ?auto_174424 - BLOCK
      ?auto_174427 - BLOCK
      ?auto_174430 - BLOCK
      ?auto_174429 - BLOCK
      ?auto_174425 - BLOCK
      ?auto_174423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174426 ?auto_174422 ) ( ON-TABLE ?auto_174422 ) ( not ( = ?auto_174422 ?auto_174426 ) ) ( not ( = ?auto_174422 ?auto_174428 ) ) ( not ( = ?auto_174422 ?auto_174424 ) ) ( not ( = ?auto_174426 ?auto_174428 ) ) ( not ( = ?auto_174426 ?auto_174424 ) ) ( not ( = ?auto_174428 ?auto_174424 ) ) ( ON ?auto_174428 ?auto_174426 ) ( not ( = ?auto_174427 ?auto_174430 ) ) ( not ( = ?auto_174427 ?auto_174429 ) ) ( not ( = ?auto_174427 ?auto_174425 ) ) ( not ( = ?auto_174427 ?auto_174424 ) ) ( not ( = ?auto_174430 ?auto_174429 ) ) ( not ( = ?auto_174430 ?auto_174425 ) ) ( not ( = ?auto_174430 ?auto_174424 ) ) ( not ( = ?auto_174429 ?auto_174425 ) ) ( not ( = ?auto_174429 ?auto_174424 ) ) ( not ( = ?auto_174425 ?auto_174424 ) ) ( not ( = ?auto_174422 ?auto_174425 ) ) ( not ( = ?auto_174422 ?auto_174427 ) ) ( not ( = ?auto_174422 ?auto_174430 ) ) ( not ( = ?auto_174422 ?auto_174429 ) ) ( not ( = ?auto_174426 ?auto_174425 ) ) ( not ( = ?auto_174426 ?auto_174427 ) ) ( not ( = ?auto_174426 ?auto_174430 ) ) ( not ( = ?auto_174426 ?auto_174429 ) ) ( not ( = ?auto_174428 ?auto_174425 ) ) ( not ( = ?auto_174428 ?auto_174427 ) ) ( not ( = ?auto_174428 ?auto_174430 ) ) ( not ( = ?auto_174428 ?auto_174429 ) ) ( ON ?auto_174424 ?auto_174428 ) ( ON ?auto_174425 ?auto_174424 ) ( ON ?auto_174427 ?auto_174423 ) ( not ( = ?auto_174422 ?auto_174423 ) ) ( not ( = ?auto_174426 ?auto_174423 ) ) ( not ( = ?auto_174428 ?auto_174423 ) ) ( not ( = ?auto_174424 ?auto_174423 ) ) ( not ( = ?auto_174427 ?auto_174423 ) ) ( not ( = ?auto_174430 ?auto_174423 ) ) ( not ( = ?auto_174429 ?auto_174423 ) ) ( not ( = ?auto_174425 ?auto_174423 ) ) ( ON ?auto_174430 ?auto_174427 ) ( CLEAR ?auto_174430 ) ( ON-TABLE ?auto_174423 ) ( HOLDING ?auto_174429 ) ( CLEAR ?auto_174425 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174422 ?auto_174426 ?auto_174428 ?auto_174424 ?auto_174425 ?auto_174429 )
      ( MAKE-1PILE ?auto_174422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174431 - BLOCK
    )
    :vars
    (
      ?auto_174432 - BLOCK
      ?auto_174435 - BLOCK
      ?auto_174438 - BLOCK
      ?auto_174437 - BLOCK
      ?auto_174433 - BLOCK
      ?auto_174436 - BLOCK
      ?auto_174439 - BLOCK
      ?auto_174434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174432 ?auto_174431 ) ( ON-TABLE ?auto_174431 ) ( not ( = ?auto_174431 ?auto_174432 ) ) ( not ( = ?auto_174431 ?auto_174435 ) ) ( not ( = ?auto_174431 ?auto_174438 ) ) ( not ( = ?auto_174432 ?auto_174435 ) ) ( not ( = ?auto_174432 ?auto_174438 ) ) ( not ( = ?auto_174435 ?auto_174438 ) ) ( ON ?auto_174435 ?auto_174432 ) ( not ( = ?auto_174437 ?auto_174433 ) ) ( not ( = ?auto_174437 ?auto_174436 ) ) ( not ( = ?auto_174437 ?auto_174439 ) ) ( not ( = ?auto_174437 ?auto_174438 ) ) ( not ( = ?auto_174433 ?auto_174436 ) ) ( not ( = ?auto_174433 ?auto_174439 ) ) ( not ( = ?auto_174433 ?auto_174438 ) ) ( not ( = ?auto_174436 ?auto_174439 ) ) ( not ( = ?auto_174436 ?auto_174438 ) ) ( not ( = ?auto_174439 ?auto_174438 ) ) ( not ( = ?auto_174431 ?auto_174439 ) ) ( not ( = ?auto_174431 ?auto_174437 ) ) ( not ( = ?auto_174431 ?auto_174433 ) ) ( not ( = ?auto_174431 ?auto_174436 ) ) ( not ( = ?auto_174432 ?auto_174439 ) ) ( not ( = ?auto_174432 ?auto_174437 ) ) ( not ( = ?auto_174432 ?auto_174433 ) ) ( not ( = ?auto_174432 ?auto_174436 ) ) ( not ( = ?auto_174435 ?auto_174439 ) ) ( not ( = ?auto_174435 ?auto_174437 ) ) ( not ( = ?auto_174435 ?auto_174433 ) ) ( not ( = ?auto_174435 ?auto_174436 ) ) ( ON ?auto_174438 ?auto_174435 ) ( ON ?auto_174439 ?auto_174438 ) ( ON ?auto_174437 ?auto_174434 ) ( not ( = ?auto_174431 ?auto_174434 ) ) ( not ( = ?auto_174432 ?auto_174434 ) ) ( not ( = ?auto_174435 ?auto_174434 ) ) ( not ( = ?auto_174438 ?auto_174434 ) ) ( not ( = ?auto_174437 ?auto_174434 ) ) ( not ( = ?auto_174433 ?auto_174434 ) ) ( not ( = ?auto_174436 ?auto_174434 ) ) ( not ( = ?auto_174439 ?auto_174434 ) ) ( ON ?auto_174433 ?auto_174437 ) ( ON-TABLE ?auto_174434 ) ( CLEAR ?auto_174439 ) ( ON ?auto_174436 ?auto_174433 ) ( CLEAR ?auto_174436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174434 ?auto_174437 ?auto_174433 )
      ( MAKE-1PILE ?auto_174431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174440 - BLOCK
    )
    :vars
    (
      ?auto_174443 - BLOCK
      ?auto_174444 - BLOCK
      ?auto_174448 - BLOCK
      ?auto_174442 - BLOCK
      ?auto_174447 - BLOCK
      ?auto_174446 - BLOCK
      ?auto_174441 - BLOCK
      ?auto_174445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174443 ?auto_174440 ) ( ON-TABLE ?auto_174440 ) ( not ( = ?auto_174440 ?auto_174443 ) ) ( not ( = ?auto_174440 ?auto_174444 ) ) ( not ( = ?auto_174440 ?auto_174448 ) ) ( not ( = ?auto_174443 ?auto_174444 ) ) ( not ( = ?auto_174443 ?auto_174448 ) ) ( not ( = ?auto_174444 ?auto_174448 ) ) ( ON ?auto_174444 ?auto_174443 ) ( not ( = ?auto_174442 ?auto_174447 ) ) ( not ( = ?auto_174442 ?auto_174446 ) ) ( not ( = ?auto_174442 ?auto_174441 ) ) ( not ( = ?auto_174442 ?auto_174448 ) ) ( not ( = ?auto_174447 ?auto_174446 ) ) ( not ( = ?auto_174447 ?auto_174441 ) ) ( not ( = ?auto_174447 ?auto_174448 ) ) ( not ( = ?auto_174446 ?auto_174441 ) ) ( not ( = ?auto_174446 ?auto_174448 ) ) ( not ( = ?auto_174441 ?auto_174448 ) ) ( not ( = ?auto_174440 ?auto_174441 ) ) ( not ( = ?auto_174440 ?auto_174442 ) ) ( not ( = ?auto_174440 ?auto_174447 ) ) ( not ( = ?auto_174440 ?auto_174446 ) ) ( not ( = ?auto_174443 ?auto_174441 ) ) ( not ( = ?auto_174443 ?auto_174442 ) ) ( not ( = ?auto_174443 ?auto_174447 ) ) ( not ( = ?auto_174443 ?auto_174446 ) ) ( not ( = ?auto_174444 ?auto_174441 ) ) ( not ( = ?auto_174444 ?auto_174442 ) ) ( not ( = ?auto_174444 ?auto_174447 ) ) ( not ( = ?auto_174444 ?auto_174446 ) ) ( ON ?auto_174448 ?auto_174444 ) ( ON ?auto_174442 ?auto_174445 ) ( not ( = ?auto_174440 ?auto_174445 ) ) ( not ( = ?auto_174443 ?auto_174445 ) ) ( not ( = ?auto_174444 ?auto_174445 ) ) ( not ( = ?auto_174448 ?auto_174445 ) ) ( not ( = ?auto_174442 ?auto_174445 ) ) ( not ( = ?auto_174447 ?auto_174445 ) ) ( not ( = ?auto_174446 ?auto_174445 ) ) ( not ( = ?auto_174441 ?auto_174445 ) ) ( ON ?auto_174447 ?auto_174442 ) ( ON-TABLE ?auto_174445 ) ( ON ?auto_174446 ?auto_174447 ) ( CLEAR ?auto_174446 ) ( HOLDING ?auto_174441 ) ( CLEAR ?auto_174448 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174440 ?auto_174443 ?auto_174444 ?auto_174448 ?auto_174441 )
      ( MAKE-1PILE ?auto_174440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174449 - BLOCK
    )
    :vars
    (
      ?auto_174451 - BLOCK
      ?auto_174453 - BLOCK
      ?auto_174455 - BLOCK
      ?auto_174452 - BLOCK
      ?auto_174450 - BLOCK
      ?auto_174457 - BLOCK
      ?auto_174456 - BLOCK
      ?auto_174454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174451 ?auto_174449 ) ( ON-TABLE ?auto_174449 ) ( not ( = ?auto_174449 ?auto_174451 ) ) ( not ( = ?auto_174449 ?auto_174453 ) ) ( not ( = ?auto_174449 ?auto_174455 ) ) ( not ( = ?auto_174451 ?auto_174453 ) ) ( not ( = ?auto_174451 ?auto_174455 ) ) ( not ( = ?auto_174453 ?auto_174455 ) ) ( ON ?auto_174453 ?auto_174451 ) ( not ( = ?auto_174452 ?auto_174450 ) ) ( not ( = ?auto_174452 ?auto_174457 ) ) ( not ( = ?auto_174452 ?auto_174456 ) ) ( not ( = ?auto_174452 ?auto_174455 ) ) ( not ( = ?auto_174450 ?auto_174457 ) ) ( not ( = ?auto_174450 ?auto_174456 ) ) ( not ( = ?auto_174450 ?auto_174455 ) ) ( not ( = ?auto_174457 ?auto_174456 ) ) ( not ( = ?auto_174457 ?auto_174455 ) ) ( not ( = ?auto_174456 ?auto_174455 ) ) ( not ( = ?auto_174449 ?auto_174456 ) ) ( not ( = ?auto_174449 ?auto_174452 ) ) ( not ( = ?auto_174449 ?auto_174450 ) ) ( not ( = ?auto_174449 ?auto_174457 ) ) ( not ( = ?auto_174451 ?auto_174456 ) ) ( not ( = ?auto_174451 ?auto_174452 ) ) ( not ( = ?auto_174451 ?auto_174450 ) ) ( not ( = ?auto_174451 ?auto_174457 ) ) ( not ( = ?auto_174453 ?auto_174456 ) ) ( not ( = ?auto_174453 ?auto_174452 ) ) ( not ( = ?auto_174453 ?auto_174450 ) ) ( not ( = ?auto_174453 ?auto_174457 ) ) ( ON ?auto_174455 ?auto_174453 ) ( ON ?auto_174452 ?auto_174454 ) ( not ( = ?auto_174449 ?auto_174454 ) ) ( not ( = ?auto_174451 ?auto_174454 ) ) ( not ( = ?auto_174453 ?auto_174454 ) ) ( not ( = ?auto_174455 ?auto_174454 ) ) ( not ( = ?auto_174452 ?auto_174454 ) ) ( not ( = ?auto_174450 ?auto_174454 ) ) ( not ( = ?auto_174457 ?auto_174454 ) ) ( not ( = ?auto_174456 ?auto_174454 ) ) ( ON ?auto_174450 ?auto_174452 ) ( ON-TABLE ?auto_174454 ) ( ON ?auto_174457 ?auto_174450 ) ( CLEAR ?auto_174455 ) ( ON ?auto_174456 ?auto_174457 ) ( CLEAR ?auto_174456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174454 ?auto_174452 ?auto_174450 ?auto_174457 )
      ( MAKE-1PILE ?auto_174449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174458 - BLOCK
    )
    :vars
    (
      ?auto_174459 - BLOCK
      ?auto_174461 - BLOCK
      ?auto_174465 - BLOCK
      ?auto_174466 - BLOCK
      ?auto_174463 - BLOCK
      ?auto_174462 - BLOCK
      ?auto_174464 - BLOCK
      ?auto_174460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174459 ?auto_174458 ) ( ON-TABLE ?auto_174458 ) ( not ( = ?auto_174458 ?auto_174459 ) ) ( not ( = ?auto_174458 ?auto_174461 ) ) ( not ( = ?auto_174458 ?auto_174465 ) ) ( not ( = ?auto_174459 ?auto_174461 ) ) ( not ( = ?auto_174459 ?auto_174465 ) ) ( not ( = ?auto_174461 ?auto_174465 ) ) ( ON ?auto_174461 ?auto_174459 ) ( not ( = ?auto_174466 ?auto_174463 ) ) ( not ( = ?auto_174466 ?auto_174462 ) ) ( not ( = ?auto_174466 ?auto_174464 ) ) ( not ( = ?auto_174466 ?auto_174465 ) ) ( not ( = ?auto_174463 ?auto_174462 ) ) ( not ( = ?auto_174463 ?auto_174464 ) ) ( not ( = ?auto_174463 ?auto_174465 ) ) ( not ( = ?auto_174462 ?auto_174464 ) ) ( not ( = ?auto_174462 ?auto_174465 ) ) ( not ( = ?auto_174464 ?auto_174465 ) ) ( not ( = ?auto_174458 ?auto_174464 ) ) ( not ( = ?auto_174458 ?auto_174466 ) ) ( not ( = ?auto_174458 ?auto_174463 ) ) ( not ( = ?auto_174458 ?auto_174462 ) ) ( not ( = ?auto_174459 ?auto_174464 ) ) ( not ( = ?auto_174459 ?auto_174466 ) ) ( not ( = ?auto_174459 ?auto_174463 ) ) ( not ( = ?auto_174459 ?auto_174462 ) ) ( not ( = ?auto_174461 ?auto_174464 ) ) ( not ( = ?auto_174461 ?auto_174466 ) ) ( not ( = ?auto_174461 ?auto_174463 ) ) ( not ( = ?auto_174461 ?auto_174462 ) ) ( ON ?auto_174466 ?auto_174460 ) ( not ( = ?auto_174458 ?auto_174460 ) ) ( not ( = ?auto_174459 ?auto_174460 ) ) ( not ( = ?auto_174461 ?auto_174460 ) ) ( not ( = ?auto_174465 ?auto_174460 ) ) ( not ( = ?auto_174466 ?auto_174460 ) ) ( not ( = ?auto_174463 ?auto_174460 ) ) ( not ( = ?auto_174462 ?auto_174460 ) ) ( not ( = ?auto_174464 ?auto_174460 ) ) ( ON ?auto_174463 ?auto_174466 ) ( ON-TABLE ?auto_174460 ) ( ON ?auto_174462 ?auto_174463 ) ( ON ?auto_174464 ?auto_174462 ) ( CLEAR ?auto_174464 ) ( HOLDING ?auto_174465 ) ( CLEAR ?auto_174461 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174458 ?auto_174459 ?auto_174461 ?auto_174465 )
      ( MAKE-1PILE ?auto_174458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174467 - BLOCK
    )
    :vars
    (
      ?auto_174468 - BLOCK
      ?auto_174471 - BLOCK
      ?auto_174473 - BLOCK
      ?auto_174475 - BLOCK
      ?auto_174474 - BLOCK
      ?auto_174470 - BLOCK
      ?auto_174472 - BLOCK
      ?auto_174469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174468 ?auto_174467 ) ( ON-TABLE ?auto_174467 ) ( not ( = ?auto_174467 ?auto_174468 ) ) ( not ( = ?auto_174467 ?auto_174471 ) ) ( not ( = ?auto_174467 ?auto_174473 ) ) ( not ( = ?auto_174468 ?auto_174471 ) ) ( not ( = ?auto_174468 ?auto_174473 ) ) ( not ( = ?auto_174471 ?auto_174473 ) ) ( ON ?auto_174471 ?auto_174468 ) ( not ( = ?auto_174475 ?auto_174474 ) ) ( not ( = ?auto_174475 ?auto_174470 ) ) ( not ( = ?auto_174475 ?auto_174472 ) ) ( not ( = ?auto_174475 ?auto_174473 ) ) ( not ( = ?auto_174474 ?auto_174470 ) ) ( not ( = ?auto_174474 ?auto_174472 ) ) ( not ( = ?auto_174474 ?auto_174473 ) ) ( not ( = ?auto_174470 ?auto_174472 ) ) ( not ( = ?auto_174470 ?auto_174473 ) ) ( not ( = ?auto_174472 ?auto_174473 ) ) ( not ( = ?auto_174467 ?auto_174472 ) ) ( not ( = ?auto_174467 ?auto_174475 ) ) ( not ( = ?auto_174467 ?auto_174474 ) ) ( not ( = ?auto_174467 ?auto_174470 ) ) ( not ( = ?auto_174468 ?auto_174472 ) ) ( not ( = ?auto_174468 ?auto_174475 ) ) ( not ( = ?auto_174468 ?auto_174474 ) ) ( not ( = ?auto_174468 ?auto_174470 ) ) ( not ( = ?auto_174471 ?auto_174472 ) ) ( not ( = ?auto_174471 ?auto_174475 ) ) ( not ( = ?auto_174471 ?auto_174474 ) ) ( not ( = ?auto_174471 ?auto_174470 ) ) ( ON ?auto_174475 ?auto_174469 ) ( not ( = ?auto_174467 ?auto_174469 ) ) ( not ( = ?auto_174468 ?auto_174469 ) ) ( not ( = ?auto_174471 ?auto_174469 ) ) ( not ( = ?auto_174473 ?auto_174469 ) ) ( not ( = ?auto_174475 ?auto_174469 ) ) ( not ( = ?auto_174474 ?auto_174469 ) ) ( not ( = ?auto_174470 ?auto_174469 ) ) ( not ( = ?auto_174472 ?auto_174469 ) ) ( ON ?auto_174474 ?auto_174475 ) ( ON-TABLE ?auto_174469 ) ( ON ?auto_174470 ?auto_174474 ) ( ON ?auto_174472 ?auto_174470 ) ( CLEAR ?auto_174471 ) ( ON ?auto_174473 ?auto_174472 ) ( CLEAR ?auto_174473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174469 ?auto_174475 ?auto_174474 ?auto_174470 ?auto_174472 )
      ( MAKE-1PILE ?auto_174467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174476 - BLOCK
    )
    :vars
    (
      ?auto_174479 - BLOCK
      ?auto_174482 - BLOCK
      ?auto_174477 - BLOCK
      ?auto_174478 - BLOCK
      ?auto_174483 - BLOCK
      ?auto_174484 - BLOCK
      ?auto_174481 - BLOCK
      ?auto_174480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174479 ?auto_174476 ) ( ON-TABLE ?auto_174476 ) ( not ( = ?auto_174476 ?auto_174479 ) ) ( not ( = ?auto_174476 ?auto_174482 ) ) ( not ( = ?auto_174476 ?auto_174477 ) ) ( not ( = ?auto_174479 ?auto_174482 ) ) ( not ( = ?auto_174479 ?auto_174477 ) ) ( not ( = ?auto_174482 ?auto_174477 ) ) ( not ( = ?auto_174478 ?auto_174483 ) ) ( not ( = ?auto_174478 ?auto_174484 ) ) ( not ( = ?auto_174478 ?auto_174481 ) ) ( not ( = ?auto_174478 ?auto_174477 ) ) ( not ( = ?auto_174483 ?auto_174484 ) ) ( not ( = ?auto_174483 ?auto_174481 ) ) ( not ( = ?auto_174483 ?auto_174477 ) ) ( not ( = ?auto_174484 ?auto_174481 ) ) ( not ( = ?auto_174484 ?auto_174477 ) ) ( not ( = ?auto_174481 ?auto_174477 ) ) ( not ( = ?auto_174476 ?auto_174481 ) ) ( not ( = ?auto_174476 ?auto_174478 ) ) ( not ( = ?auto_174476 ?auto_174483 ) ) ( not ( = ?auto_174476 ?auto_174484 ) ) ( not ( = ?auto_174479 ?auto_174481 ) ) ( not ( = ?auto_174479 ?auto_174478 ) ) ( not ( = ?auto_174479 ?auto_174483 ) ) ( not ( = ?auto_174479 ?auto_174484 ) ) ( not ( = ?auto_174482 ?auto_174481 ) ) ( not ( = ?auto_174482 ?auto_174478 ) ) ( not ( = ?auto_174482 ?auto_174483 ) ) ( not ( = ?auto_174482 ?auto_174484 ) ) ( ON ?auto_174478 ?auto_174480 ) ( not ( = ?auto_174476 ?auto_174480 ) ) ( not ( = ?auto_174479 ?auto_174480 ) ) ( not ( = ?auto_174482 ?auto_174480 ) ) ( not ( = ?auto_174477 ?auto_174480 ) ) ( not ( = ?auto_174478 ?auto_174480 ) ) ( not ( = ?auto_174483 ?auto_174480 ) ) ( not ( = ?auto_174484 ?auto_174480 ) ) ( not ( = ?auto_174481 ?auto_174480 ) ) ( ON ?auto_174483 ?auto_174478 ) ( ON-TABLE ?auto_174480 ) ( ON ?auto_174484 ?auto_174483 ) ( ON ?auto_174481 ?auto_174484 ) ( ON ?auto_174477 ?auto_174481 ) ( CLEAR ?auto_174477 ) ( HOLDING ?auto_174482 ) ( CLEAR ?auto_174479 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174476 ?auto_174479 ?auto_174482 )
      ( MAKE-1PILE ?auto_174476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174485 - BLOCK
    )
    :vars
    (
      ?auto_174489 - BLOCK
      ?auto_174488 - BLOCK
      ?auto_174487 - BLOCK
      ?auto_174491 - BLOCK
      ?auto_174490 - BLOCK
      ?auto_174486 - BLOCK
      ?auto_174493 - BLOCK
      ?auto_174492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_174489 ?auto_174485 ) ( ON-TABLE ?auto_174485 ) ( not ( = ?auto_174485 ?auto_174489 ) ) ( not ( = ?auto_174485 ?auto_174488 ) ) ( not ( = ?auto_174485 ?auto_174487 ) ) ( not ( = ?auto_174489 ?auto_174488 ) ) ( not ( = ?auto_174489 ?auto_174487 ) ) ( not ( = ?auto_174488 ?auto_174487 ) ) ( not ( = ?auto_174491 ?auto_174490 ) ) ( not ( = ?auto_174491 ?auto_174486 ) ) ( not ( = ?auto_174491 ?auto_174493 ) ) ( not ( = ?auto_174491 ?auto_174487 ) ) ( not ( = ?auto_174490 ?auto_174486 ) ) ( not ( = ?auto_174490 ?auto_174493 ) ) ( not ( = ?auto_174490 ?auto_174487 ) ) ( not ( = ?auto_174486 ?auto_174493 ) ) ( not ( = ?auto_174486 ?auto_174487 ) ) ( not ( = ?auto_174493 ?auto_174487 ) ) ( not ( = ?auto_174485 ?auto_174493 ) ) ( not ( = ?auto_174485 ?auto_174491 ) ) ( not ( = ?auto_174485 ?auto_174490 ) ) ( not ( = ?auto_174485 ?auto_174486 ) ) ( not ( = ?auto_174489 ?auto_174493 ) ) ( not ( = ?auto_174489 ?auto_174491 ) ) ( not ( = ?auto_174489 ?auto_174490 ) ) ( not ( = ?auto_174489 ?auto_174486 ) ) ( not ( = ?auto_174488 ?auto_174493 ) ) ( not ( = ?auto_174488 ?auto_174491 ) ) ( not ( = ?auto_174488 ?auto_174490 ) ) ( not ( = ?auto_174488 ?auto_174486 ) ) ( ON ?auto_174491 ?auto_174492 ) ( not ( = ?auto_174485 ?auto_174492 ) ) ( not ( = ?auto_174489 ?auto_174492 ) ) ( not ( = ?auto_174488 ?auto_174492 ) ) ( not ( = ?auto_174487 ?auto_174492 ) ) ( not ( = ?auto_174491 ?auto_174492 ) ) ( not ( = ?auto_174490 ?auto_174492 ) ) ( not ( = ?auto_174486 ?auto_174492 ) ) ( not ( = ?auto_174493 ?auto_174492 ) ) ( ON ?auto_174490 ?auto_174491 ) ( ON-TABLE ?auto_174492 ) ( ON ?auto_174486 ?auto_174490 ) ( ON ?auto_174493 ?auto_174486 ) ( ON ?auto_174487 ?auto_174493 ) ( CLEAR ?auto_174489 ) ( ON ?auto_174488 ?auto_174487 ) ( CLEAR ?auto_174488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174492 ?auto_174491 ?auto_174490 ?auto_174486 ?auto_174493 ?auto_174487 )
      ( MAKE-1PILE ?auto_174485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174512 - BLOCK
    )
    :vars
    (
      ?auto_174514 - BLOCK
      ?auto_174518 - BLOCK
      ?auto_174516 - BLOCK
      ?auto_174515 - BLOCK
      ?auto_174517 - BLOCK
      ?auto_174520 - BLOCK
      ?auto_174519 - BLOCK
      ?auto_174513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174512 ?auto_174514 ) ) ( not ( = ?auto_174512 ?auto_174518 ) ) ( not ( = ?auto_174512 ?auto_174516 ) ) ( not ( = ?auto_174514 ?auto_174518 ) ) ( not ( = ?auto_174514 ?auto_174516 ) ) ( not ( = ?auto_174518 ?auto_174516 ) ) ( not ( = ?auto_174515 ?auto_174517 ) ) ( not ( = ?auto_174515 ?auto_174520 ) ) ( not ( = ?auto_174515 ?auto_174519 ) ) ( not ( = ?auto_174515 ?auto_174516 ) ) ( not ( = ?auto_174517 ?auto_174520 ) ) ( not ( = ?auto_174517 ?auto_174519 ) ) ( not ( = ?auto_174517 ?auto_174516 ) ) ( not ( = ?auto_174520 ?auto_174519 ) ) ( not ( = ?auto_174520 ?auto_174516 ) ) ( not ( = ?auto_174519 ?auto_174516 ) ) ( not ( = ?auto_174512 ?auto_174519 ) ) ( not ( = ?auto_174512 ?auto_174515 ) ) ( not ( = ?auto_174512 ?auto_174517 ) ) ( not ( = ?auto_174512 ?auto_174520 ) ) ( not ( = ?auto_174514 ?auto_174519 ) ) ( not ( = ?auto_174514 ?auto_174515 ) ) ( not ( = ?auto_174514 ?auto_174517 ) ) ( not ( = ?auto_174514 ?auto_174520 ) ) ( not ( = ?auto_174518 ?auto_174519 ) ) ( not ( = ?auto_174518 ?auto_174515 ) ) ( not ( = ?auto_174518 ?auto_174517 ) ) ( not ( = ?auto_174518 ?auto_174520 ) ) ( ON ?auto_174515 ?auto_174513 ) ( not ( = ?auto_174512 ?auto_174513 ) ) ( not ( = ?auto_174514 ?auto_174513 ) ) ( not ( = ?auto_174518 ?auto_174513 ) ) ( not ( = ?auto_174516 ?auto_174513 ) ) ( not ( = ?auto_174515 ?auto_174513 ) ) ( not ( = ?auto_174517 ?auto_174513 ) ) ( not ( = ?auto_174520 ?auto_174513 ) ) ( not ( = ?auto_174519 ?auto_174513 ) ) ( ON ?auto_174517 ?auto_174515 ) ( ON-TABLE ?auto_174513 ) ( ON ?auto_174520 ?auto_174517 ) ( ON ?auto_174519 ?auto_174520 ) ( ON ?auto_174516 ?auto_174519 ) ( ON ?auto_174518 ?auto_174516 ) ( ON ?auto_174514 ?auto_174518 ) ( CLEAR ?auto_174514 ) ( HOLDING ?auto_174512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174512 ?auto_174514 )
      ( MAKE-1PILE ?auto_174512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174521 - BLOCK
    )
    :vars
    (
      ?auto_174522 - BLOCK
      ?auto_174526 - BLOCK
      ?auto_174523 - BLOCK
      ?auto_174525 - BLOCK
      ?auto_174524 - BLOCK
      ?auto_174527 - BLOCK
      ?auto_174529 - BLOCK
      ?auto_174528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174521 ?auto_174522 ) ) ( not ( = ?auto_174521 ?auto_174526 ) ) ( not ( = ?auto_174521 ?auto_174523 ) ) ( not ( = ?auto_174522 ?auto_174526 ) ) ( not ( = ?auto_174522 ?auto_174523 ) ) ( not ( = ?auto_174526 ?auto_174523 ) ) ( not ( = ?auto_174525 ?auto_174524 ) ) ( not ( = ?auto_174525 ?auto_174527 ) ) ( not ( = ?auto_174525 ?auto_174529 ) ) ( not ( = ?auto_174525 ?auto_174523 ) ) ( not ( = ?auto_174524 ?auto_174527 ) ) ( not ( = ?auto_174524 ?auto_174529 ) ) ( not ( = ?auto_174524 ?auto_174523 ) ) ( not ( = ?auto_174527 ?auto_174529 ) ) ( not ( = ?auto_174527 ?auto_174523 ) ) ( not ( = ?auto_174529 ?auto_174523 ) ) ( not ( = ?auto_174521 ?auto_174529 ) ) ( not ( = ?auto_174521 ?auto_174525 ) ) ( not ( = ?auto_174521 ?auto_174524 ) ) ( not ( = ?auto_174521 ?auto_174527 ) ) ( not ( = ?auto_174522 ?auto_174529 ) ) ( not ( = ?auto_174522 ?auto_174525 ) ) ( not ( = ?auto_174522 ?auto_174524 ) ) ( not ( = ?auto_174522 ?auto_174527 ) ) ( not ( = ?auto_174526 ?auto_174529 ) ) ( not ( = ?auto_174526 ?auto_174525 ) ) ( not ( = ?auto_174526 ?auto_174524 ) ) ( not ( = ?auto_174526 ?auto_174527 ) ) ( ON ?auto_174525 ?auto_174528 ) ( not ( = ?auto_174521 ?auto_174528 ) ) ( not ( = ?auto_174522 ?auto_174528 ) ) ( not ( = ?auto_174526 ?auto_174528 ) ) ( not ( = ?auto_174523 ?auto_174528 ) ) ( not ( = ?auto_174525 ?auto_174528 ) ) ( not ( = ?auto_174524 ?auto_174528 ) ) ( not ( = ?auto_174527 ?auto_174528 ) ) ( not ( = ?auto_174529 ?auto_174528 ) ) ( ON ?auto_174524 ?auto_174525 ) ( ON-TABLE ?auto_174528 ) ( ON ?auto_174527 ?auto_174524 ) ( ON ?auto_174529 ?auto_174527 ) ( ON ?auto_174523 ?auto_174529 ) ( ON ?auto_174526 ?auto_174523 ) ( ON ?auto_174522 ?auto_174526 ) ( ON ?auto_174521 ?auto_174522 ) ( CLEAR ?auto_174521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174528 ?auto_174525 ?auto_174524 ?auto_174527 ?auto_174529 ?auto_174523 ?auto_174526 ?auto_174522 )
      ( MAKE-1PILE ?auto_174521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174537 - BLOCK
      ?auto_174538 - BLOCK
      ?auto_174539 - BLOCK
      ?auto_174540 - BLOCK
      ?auto_174541 - BLOCK
      ?auto_174542 - BLOCK
      ?auto_174543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_174543 ) ( CLEAR ?auto_174542 ) ( ON-TABLE ?auto_174537 ) ( ON ?auto_174538 ?auto_174537 ) ( ON ?auto_174539 ?auto_174538 ) ( ON ?auto_174540 ?auto_174539 ) ( ON ?auto_174541 ?auto_174540 ) ( ON ?auto_174542 ?auto_174541 ) ( not ( = ?auto_174537 ?auto_174538 ) ) ( not ( = ?auto_174537 ?auto_174539 ) ) ( not ( = ?auto_174537 ?auto_174540 ) ) ( not ( = ?auto_174537 ?auto_174541 ) ) ( not ( = ?auto_174537 ?auto_174542 ) ) ( not ( = ?auto_174537 ?auto_174543 ) ) ( not ( = ?auto_174538 ?auto_174539 ) ) ( not ( = ?auto_174538 ?auto_174540 ) ) ( not ( = ?auto_174538 ?auto_174541 ) ) ( not ( = ?auto_174538 ?auto_174542 ) ) ( not ( = ?auto_174538 ?auto_174543 ) ) ( not ( = ?auto_174539 ?auto_174540 ) ) ( not ( = ?auto_174539 ?auto_174541 ) ) ( not ( = ?auto_174539 ?auto_174542 ) ) ( not ( = ?auto_174539 ?auto_174543 ) ) ( not ( = ?auto_174540 ?auto_174541 ) ) ( not ( = ?auto_174540 ?auto_174542 ) ) ( not ( = ?auto_174540 ?auto_174543 ) ) ( not ( = ?auto_174541 ?auto_174542 ) ) ( not ( = ?auto_174541 ?auto_174543 ) ) ( not ( = ?auto_174542 ?auto_174543 ) ) )
    :subtasks
    ( ( !STACK ?auto_174543 ?auto_174542 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174544 - BLOCK
      ?auto_174545 - BLOCK
      ?auto_174546 - BLOCK
      ?auto_174547 - BLOCK
      ?auto_174548 - BLOCK
      ?auto_174549 - BLOCK
      ?auto_174550 - BLOCK
    )
    :vars
    (
      ?auto_174551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174549 ) ( ON-TABLE ?auto_174544 ) ( ON ?auto_174545 ?auto_174544 ) ( ON ?auto_174546 ?auto_174545 ) ( ON ?auto_174547 ?auto_174546 ) ( ON ?auto_174548 ?auto_174547 ) ( ON ?auto_174549 ?auto_174548 ) ( not ( = ?auto_174544 ?auto_174545 ) ) ( not ( = ?auto_174544 ?auto_174546 ) ) ( not ( = ?auto_174544 ?auto_174547 ) ) ( not ( = ?auto_174544 ?auto_174548 ) ) ( not ( = ?auto_174544 ?auto_174549 ) ) ( not ( = ?auto_174544 ?auto_174550 ) ) ( not ( = ?auto_174545 ?auto_174546 ) ) ( not ( = ?auto_174545 ?auto_174547 ) ) ( not ( = ?auto_174545 ?auto_174548 ) ) ( not ( = ?auto_174545 ?auto_174549 ) ) ( not ( = ?auto_174545 ?auto_174550 ) ) ( not ( = ?auto_174546 ?auto_174547 ) ) ( not ( = ?auto_174546 ?auto_174548 ) ) ( not ( = ?auto_174546 ?auto_174549 ) ) ( not ( = ?auto_174546 ?auto_174550 ) ) ( not ( = ?auto_174547 ?auto_174548 ) ) ( not ( = ?auto_174547 ?auto_174549 ) ) ( not ( = ?auto_174547 ?auto_174550 ) ) ( not ( = ?auto_174548 ?auto_174549 ) ) ( not ( = ?auto_174548 ?auto_174550 ) ) ( not ( = ?auto_174549 ?auto_174550 ) ) ( ON ?auto_174550 ?auto_174551 ) ( CLEAR ?auto_174550 ) ( HAND-EMPTY ) ( not ( = ?auto_174544 ?auto_174551 ) ) ( not ( = ?auto_174545 ?auto_174551 ) ) ( not ( = ?auto_174546 ?auto_174551 ) ) ( not ( = ?auto_174547 ?auto_174551 ) ) ( not ( = ?auto_174548 ?auto_174551 ) ) ( not ( = ?auto_174549 ?auto_174551 ) ) ( not ( = ?auto_174550 ?auto_174551 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174550 ?auto_174551 )
      ( MAKE-7PILE ?auto_174544 ?auto_174545 ?auto_174546 ?auto_174547 ?auto_174548 ?auto_174549 ?auto_174550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174552 - BLOCK
      ?auto_174553 - BLOCK
      ?auto_174554 - BLOCK
      ?auto_174555 - BLOCK
      ?auto_174556 - BLOCK
      ?auto_174557 - BLOCK
      ?auto_174558 - BLOCK
    )
    :vars
    (
      ?auto_174559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174552 ) ( ON ?auto_174553 ?auto_174552 ) ( ON ?auto_174554 ?auto_174553 ) ( ON ?auto_174555 ?auto_174554 ) ( ON ?auto_174556 ?auto_174555 ) ( not ( = ?auto_174552 ?auto_174553 ) ) ( not ( = ?auto_174552 ?auto_174554 ) ) ( not ( = ?auto_174552 ?auto_174555 ) ) ( not ( = ?auto_174552 ?auto_174556 ) ) ( not ( = ?auto_174552 ?auto_174557 ) ) ( not ( = ?auto_174552 ?auto_174558 ) ) ( not ( = ?auto_174553 ?auto_174554 ) ) ( not ( = ?auto_174553 ?auto_174555 ) ) ( not ( = ?auto_174553 ?auto_174556 ) ) ( not ( = ?auto_174553 ?auto_174557 ) ) ( not ( = ?auto_174553 ?auto_174558 ) ) ( not ( = ?auto_174554 ?auto_174555 ) ) ( not ( = ?auto_174554 ?auto_174556 ) ) ( not ( = ?auto_174554 ?auto_174557 ) ) ( not ( = ?auto_174554 ?auto_174558 ) ) ( not ( = ?auto_174555 ?auto_174556 ) ) ( not ( = ?auto_174555 ?auto_174557 ) ) ( not ( = ?auto_174555 ?auto_174558 ) ) ( not ( = ?auto_174556 ?auto_174557 ) ) ( not ( = ?auto_174556 ?auto_174558 ) ) ( not ( = ?auto_174557 ?auto_174558 ) ) ( ON ?auto_174558 ?auto_174559 ) ( CLEAR ?auto_174558 ) ( not ( = ?auto_174552 ?auto_174559 ) ) ( not ( = ?auto_174553 ?auto_174559 ) ) ( not ( = ?auto_174554 ?auto_174559 ) ) ( not ( = ?auto_174555 ?auto_174559 ) ) ( not ( = ?auto_174556 ?auto_174559 ) ) ( not ( = ?auto_174557 ?auto_174559 ) ) ( not ( = ?auto_174558 ?auto_174559 ) ) ( HOLDING ?auto_174557 ) ( CLEAR ?auto_174556 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174552 ?auto_174553 ?auto_174554 ?auto_174555 ?auto_174556 ?auto_174557 )
      ( MAKE-7PILE ?auto_174552 ?auto_174553 ?auto_174554 ?auto_174555 ?auto_174556 ?auto_174557 ?auto_174558 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174560 - BLOCK
      ?auto_174561 - BLOCK
      ?auto_174562 - BLOCK
      ?auto_174563 - BLOCK
      ?auto_174564 - BLOCK
      ?auto_174565 - BLOCK
      ?auto_174566 - BLOCK
    )
    :vars
    (
      ?auto_174567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174560 ) ( ON ?auto_174561 ?auto_174560 ) ( ON ?auto_174562 ?auto_174561 ) ( ON ?auto_174563 ?auto_174562 ) ( ON ?auto_174564 ?auto_174563 ) ( not ( = ?auto_174560 ?auto_174561 ) ) ( not ( = ?auto_174560 ?auto_174562 ) ) ( not ( = ?auto_174560 ?auto_174563 ) ) ( not ( = ?auto_174560 ?auto_174564 ) ) ( not ( = ?auto_174560 ?auto_174565 ) ) ( not ( = ?auto_174560 ?auto_174566 ) ) ( not ( = ?auto_174561 ?auto_174562 ) ) ( not ( = ?auto_174561 ?auto_174563 ) ) ( not ( = ?auto_174561 ?auto_174564 ) ) ( not ( = ?auto_174561 ?auto_174565 ) ) ( not ( = ?auto_174561 ?auto_174566 ) ) ( not ( = ?auto_174562 ?auto_174563 ) ) ( not ( = ?auto_174562 ?auto_174564 ) ) ( not ( = ?auto_174562 ?auto_174565 ) ) ( not ( = ?auto_174562 ?auto_174566 ) ) ( not ( = ?auto_174563 ?auto_174564 ) ) ( not ( = ?auto_174563 ?auto_174565 ) ) ( not ( = ?auto_174563 ?auto_174566 ) ) ( not ( = ?auto_174564 ?auto_174565 ) ) ( not ( = ?auto_174564 ?auto_174566 ) ) ( not ( = ?auto_174565 ?auto_174566 ) ) ( ON ?auto_174566 ?auto_174567 ) ( not ( = ?auto_174560 ?auto_174567 ) ) ( not ( = ?auto_174561 ?auto_174567 ) ) ( not ( = ?auto_174562 ?auto_174567 ) ) ( not ( = ?auto_174563 ?auto_174567 ) ) ( not ( = ?auto_174564 ?auto_174567 ) ) ( not ( = ?auto_174565 ?auto_174567 ) ) ( not ( = ?auto_174566 ?auto_174567 ) ) ( CLEAR ?auto_174564 ) ( ON ?auto_174565 ?auto_174566 ) ( CLEAR ?auto_174565 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174567 ?auto_174566 )
      ( MAKE-7PILE ?auto_174560 ?auto_174561 ?auto_174562 ?auto_174563 ?auto_174564 ?auto_174565 ?auto_174566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174568 - BLOCK
      ?auto_174569 - BLOCK
      ?auto_174570 - BLOCK
      ?auto_174571 - BLOCK
      ?auto_174572 - BLOCK
      ?auto_174573 - BLOCK
      ?auto_174574 - BLOCK
    )
    :vars
    (
      ?auto_174575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174568 ) ( ON ?auto_174569 ?auto_174568 ) ( ON ?auto_174570 ?auto_174569 ) ( ON ?auto_174571 ?auto_174570 ) ( not ( = ?auto_174568 ?auto_174569 ) ) ( not ( = ?auto_174568 ?auto_174570 ) ) ( not ( = ?auto_174568 ?auto_174571 ) ) ( not ( = ?auto_174568 ?auto_174572 ) ) ( not ( = ?auto_174568 ?auto_174573 ) ) ( not ( = ?auto_174568 ?auto_174574 ) ) ( not ( = ?auto_174569 ?auto_174570 ) ) ( not ( = ?auto_174569 ?auto_174571 ) ) ( not ( = ?auto_174569 ?auto_174572 ) ) ( not ( = ?auto_174569 ?auto_174573 ) ) ( not ( = ?auto_174569 ?auto_174574 ) ) ( not ( = ?auto_174570 ?auto_174571 ) ) ( not ( = ?auto_174570 ?auto_174572 ) ) ( not ( = ?auto_174570 ?auto_174573 ) ) ( not ( = ?auto_174570 ?auto_174574 ) ) ( not ( = ?auto_174571 ?auto_174572 ) ) ( not ( = ?auto_174571 ?auto_174573 ) ) ( not ( = ?auto_174571 ?auto_174574 ) ) ( not ( = ?auto_174572 ?auto_174573 ) ) ( not ( = ?auto_174572 ?auto_174574 ) ) ( not ( = ?auto_174573 ?auto_174574 ) ) ( ON ?auto_174574 ?auto_174575 ) ( not ( = ?auto_174568 ?auto_174575 ) ) ( not ( = ?auto_174569 ?auto_174575 ) ) ( not ( = ?auto_174570 ?auto_174575 ) ) ( not ( = ?auto_174571 ?auto_174575 ) ) ( not ( = ?auto_174572 ?auto_174575 ) ) ( not ( = ?auto_174573 ?auto_174575 ) ) ( not ( = ?auto_174574 ?auto_174575 ) ) ( ON ?auto_174573 ?auto_174574 ) ( CLEAR ?auto_174573 ) ( ON-TABLE ?auto_174575 ) ( HOLDING ?auto_174572 ) ( CLEAR ?auto_174571 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174568 ?auto_174569 ?auto_174570 ?auto_174571 ?auto_174572 )
      ( MAKE-7PILE ?auto_174568 ?auto_174569 ?auto_174570 ?auto_174571 ?auto_174572 ?auto_174573 ?auto_174574 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174576 - BLOCK
      ?auto_174577 - BLOCK
      ?auto_174578 - BLOCK
      ?auto_174579 - BLOCK
      ?auto_174580 - BLOCK
      ?auto_174581 - BLOCK
      ?auto_174582 - BLOCK
    )
    :vars
    (
      ?auto_174583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174576 ) ( ON ?auto_174577 ?auto_174576 ) ( ON ?auto_174578 ?auto_174577 ) ( ON ?auto_174579 ?auto_174578 ) ( not ( = ?auto_174576 ?auto_174577 ) ) ( not ( = ?auto_174576 ?auto_174578 ) ) ( not ( = ?auto_174576 ?auto_174579 ) ) ( not ( = ?auto_174576 ?auto_174580 ) ) ( not ( = ?auto_174576 ?auto_174581 ) ) ( not ( = ?auto_174576 ?auto_174582 ) ) ( not ( = ?auto_174577 ?auto_174578 ) ) ( not ( = ?auto_174577 ?auto_174579 ) ) ( not ( = ?auto_174577 ?auto_174580 ) ) ( not ( = ?auto_174577 ?auto_174581 ) ) ( not ( = ?auto_174577 ?auto_174582 ) ) ( not ( = ?auto_174578 ?auto_174579 ) ) ( not ( = ?auto_174578 ?auto_174580 ) ) ( not ( = ?auto_174578 ?auto_174581 ) ) ( not ( = ?auto_174578 ?auto_174582 ) ) ( not ( = ?auto_174579 ?auto_174580 ) ) ( not ( = ?auto_174579 ?auto_174581 ) ) ( not ( = ?auto_174579 ?auto_174582 ) ) ( not ( = ?auto_174580 ?auto_174581 ) ) ( not ( = ?auto_174580 ?auto_174582 ) ) ( not ( = ?auto_174581 ?auto_174582 ) ) ( ON ?auto_174582 ?auto_174583 ) ( not ( = ?auto_174576 ?auto_174583 ) ) ( not ( = ?auto_174577 ?auto_174583 ) ) ( not ( = ?auto_174578 ?auto_174583 ) ) ( not ( = ?auto_174579 ?auto_174583 ) ) ( not ( = ?auto_174580 ?auto_174583 ) ) ( not ( = ?auto_174581 ?auto_174583 ) ) ( not ( = ?auto_174582 ?auto_174583 ) ) ( ON ?auto_174581 ?auto_174582 ) ( ON-TABLE ?auto_174583 ) ( CLEAR ?auto_174579 ) ( ON ?auto_174580 ?auto_174581 ) ( CLEAR ?auto_174580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174583 ?auto_174582 ?auto_174581 )
      ( MAKE-7PILE ?auto_174576 ?auto_174577 ?auto_174578 ?auto_174579 ?auto_174580 ?auto_174581 ?auto_174582 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174584 - BLOCK
      ?auto_174585 - BLOCK
      ?auto_174586 - BLOCK
      ?auto_174587 - BLOCK
      ?auto_174588 - BLOCK
      ?auto_174589 - BLOCK
      ?auto_174590 - BLOCK
    )
    :vars
    (
      ?auto_174591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174584 ) ( ON ?auto_174585 ?auto_174584 ) ( ON ?auto_174586 ?auto_174585 ) ( not ( = ?auto_174584 ?auto_174585 ) ) ( not ( = ?auto_174584 ?auto_174586 ) ) ( not ( = ?auto_174584 ?auto_174587 ) ) ( not ( = ?auto_174584 ?auto_174588 ) ) ( not ( = ?auto_174584 ?auto_174589 ) ) ( not ( = ?auto_174584 ?auto_174590 ) ) ( not ( = ?auto_174585 ?auto_174586 ) ) ( not ( = ?auto_174585 ?auto_174587 ) ) ( not ( = ?auto_174585 ?auto_174588 ) ) ( not ( = ?auto_174585 ?auto_174589 ) ) ( not ( = ?auto_174585 ?auto_174590 ) ) ( not ( = ?auto_174586 ?auto_174587 ) ) ( not ( = ?auto_174586 ?auto_174588 ) ) ( not ( = ?auto_174586 ?auto_174589 ) ) ( not ( = ?auto_174586 ?auto_174590 ) ) ( not ( = ?auto_174587 ?auto_174588 ) ) ( not ( = ?auto_174587 ?auto_174589 ) ) ( not ( = ?auto_174587 ?auto_174590 ) ) ( not ( = ?auto_174588 ?auto_174589 ) ) ( not ( = ?auto_174588 ?auto_174590 ) ) ( not ( = ?auto_174589 ?auto_174590 ) ) ( ON ?auto_174590 ?auto_174591 ) ( not ( = ?auto_174584 ?auto_174591 ) ) ( not ( = ?auto_174585 ?auto_174591 ) ) ( not ( = ?auto_174586 ?auto_174591 ) ) ( not ( = ?auto_174587 ?auto_174591 ) ) ( not ( = ?auto_174588 ?auto_174591 ) ) ( not ( = ?auto_174589 ?auto_174591 ) ) ( not ( = ?auto_174590 ?auto_174591 ) ) ( ON ?auto_174589 ?auto_174590 ) ( ON-TABLE ?auto_174591 ) ( ON ?auto_174588 ?auto_174589 ) ( CLEAR ?auto_174588 ) ( HOLDING ?auto_174587 ) ( CLEAR ?auto_174586 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174584 ?auto_174585 ?auto_174586 ?auto_174587 )
      ( MAKE-7PILE ?auto_174584 ?auto_174585 ?auto_174586 ?auto_174587 ?auto_174588 ?auto_174589 ?auto_174590 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174592 - BLOCK
      ?auto_174593 - BLOCK
      ?auto_174594 - BLOCK
      ?auto_174595 - BLOCK
      ?auto_174596 - BLOCK
      ?auto_174597 - BLOCK
      ?auto_174598 - BLOCK
    )
    :vars
    (
      ?auto_174599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174592 ) ( ON ?auto_174593 ?auto_174592 ) ( ON ?auto_174594 ?auto_174593 ) ( not ( = ?auto_174592 ?auto_174593 ) ) ( not ( = ?auto_174592 ?auto_174594 ) ) ( not ( = ?auto_174592 ?auto_174595 ) ) ( not ( = ?auto_174592 ?auto_174596 ) ) ( not ( = ?auto_174592 ?auto_174597 ) ) ( not ( = ?auto_174592 ?auto_174598 ) ) ( not ( = ?auto_174593 ?auto_174594 ) ) ( not ( = ?auto_174593 ?auto_174595 ) ) ( not ( = ?auto_174593 ?auto_174596 ) ) ( not ( = ?auto_174593 ?auto_174597 ) ) ( not ( = ?auto_174593 ?auto_174598 ) ) ( not ( = ?auto_174594 ?auto_174595 ) ) ( not ( = ?auto_174594 ?auto_174596 ) ) ( not ( = ?auto_174594 ?auto_174597 ) ) ( not ( = ?auto_174594 ?auto_174598 ) ) ( not ( = ?auto_174595 ?auto_174596 ) ) ( not ( = ?auto_174595 ?auto_174597 ) ) ( not ( = ?auto_174595 ?auto_174598 ) ) ( not ( = ?auto_174596 ?auto_174597 ) ) ( not ( = ?auto_174596 ?auto_174598 ) ) ( not ( = ?auto_174597 ?auto_174598 ) ) ( ON ?auto_174598 ?auto_174599 ) ( not ( = ?auto_174592 ?auto_174599 ) ) ( not ( = ?auto_174593 ?auto_174599 ) ) ( not ( = ?auto_174594 ?auto_174599 ) ) ( not ( = ?auto_174595 ?auto_174599 ) ) ( not ( = ?auto_174596 ?auto_174599 ) ) ( not ( = ?auto_174597 ?auto_174599 ) ) ( not ( = ?auto_174598 ?auto_174599 ) ) ( ON ?auto_174597 ?auto_174598 ) ( ON-TABLE ?auto_174599 ) ( ON ?auto_174596 ?auto_174597 ) ( CLEAR ?auto_174594 ) ( ON ?auto_174595 ?auto_174596 ) ( CLEAR ?auto_174595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174599 ?auto_174598 ?auto_174597 ?auto_174596 )
      ( MAKE-7PILE ?auto_174592 ?auto_174593 ?auto_174594 ?auto_174595 ?auto_174596 ?auto_174597 ?auto_174598 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174600 - BLOCK
      ?auto_174601 - BLOCK
      ?auto_174602 - BLOCK
      ?auto_174603 - BLOCK
      ?auto_174604 - BLOCK
      ?auto_174605 - BLOCK
      ?auto_174606 - BLOCK
    )
    :vars
    (
      ?auto_174607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174600 ) ( ON ?auto_174601 ?auto_174600 ) ( not ( = ?auto_174600 ?auto_174601 ) ) ( not ( = ?auto_174600 ?auto_174602 ) ) ( not ( = ?auto_174600 ?auto_174603 ) ) ( not ( = ?auto_174600 ?auto_174604 ) ) ( not ( = ?auto_174600 ?auto_174605 ) ) ( not ( = ?auto_174600 ?auto_174606 ) ) ( not ( = ?auto_174601 ?auto_174602 ) ) ( not ( = ?auto_174601 ?auto_174603 ) ) ( not ( = ?auto_174601 ?auto_174604 ) ) ( not ( = ?auto_174601 ?auto_174605 ) ) ( not ( = ?auto_174601 ?auto_174606 ) ) ( not ( = ?auto_174602 ?auto_174603 ) ) ( not ( = ?auto_174602 ?auto_174604 ) ) ( not ( = ?auto_174602 ?auto_174605 ) ) ( not ( = ?auto_174602 ?auto_174606 ) ) ( not ( = ?auto_174603 ?auto_174604 ) ) ( not ( = ?auto_174603 ?auto_174605 ) ) ( not ( = ?auto_174603 ?auto_174606 ) ) ( not ( = ?auto_174604 ?auto_174605 ) ) ( not ( = ?auto_174604 ?auto_174606 ) ) ( not ( = ?auto_174605 ?auto_174606 ) ) ( ON ?auto_174606 ?auto_174607 ) ( not ( = ?auto_174600 ?auto_174607 ) ) ( not ( = ?auto_174601 ?auto_174607 ) ) ( not ( = ?auto_174602 ?auto_174607 ) ) ( not ( = ?auto_174603 ?auto_174607 ) ) ( not ( = ?auto_174604 ?auto_174607 ) ) ( not ( = ?auto_174605 ?auto_174607 ) ) ( not ( = ?auto_174606 ?auto_174607 ) ) ( ON ?auto_174605 ?auto_174606 ) ( ON-TABLE ?auto_174607 ) ( ON ?auto_174604 ?auto_174605 ) ( ON ?auto_174603 ?auto_174604 ) ( CLEAR ?auto_174603 ) ( HOLDING ?auto_174602 ) ( CLEAR ?auto_174601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174600 ?auto_174601 ?auto_174602 )
      ( MAKE-7PILE ?auto_174600 ?auto_174601 ?auto_174602 ?auto_174603 ?auto_174604 ?auto_174605 ?auto_174606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174608 - BLOCK
      ?auto_174609 - BLOCK
      ?auto_174610 - BLOCK
      ?auto_174611 - BLOCK
      ?auto_174612 - BLOCK
      ?auto_174613 - BLOCK
      ?auto_174614 - BLOCK
    )
    :vars
    (
      ?auto_174615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174608 ) ( ON ?auto_174609 ?auto_174608 ) ( not ( = ?auto_174608 ?auto_174609 ) ) ( not ( = ?auto_174608 ?auto_174610 ) ) ( not ( = ?auto_174608 ?auto_174611 ) ) ( not ( = ?auto_174608 ?auto_174612 ) ) ( not ( = ?auto_174608 ?auto_174613 ) ) ( not ( = ?auto_174608 ?auto_174614 ) ) ( not ( = ?auto_174609 ?auto_174610 ) ) ( not ( = ?auto_174609 ?auto_174611 ) ) ( not ( = ?auto_174609 ?auto_174612 ) ) ( not ( = ?auto_174609 ?auto_174613 ) ) ( not ( = ?auto_174609 ?auto_174614 ) ) ( not ( = ?auto_174610 ?auto_174611 ) ) ( not ( = ?auto_174610 ?auto_174612 ) ) ( not ( = ?auto_174610 ?auto_174613 ) ) ( not ( = ?auto_174610 ?auto_174614 ) ) ( not ( = ?auto_174611 ?auto_174612 ) ) ( not ( = ?auto_174611 ?auto_174613 ) ) ( not ( = ?auto_174611 ?auto_174614 ) ) ( not ( = ?auto_174612 ?auto_174613 ) ) ( not ( = ?auto_174612 ?auto_174614 ) ) ( not ( = ?auto_174613 ?auto_174614 ) ) ( ON ?auto_174614 ?auto_174615 ) ( not ( = ?auto_174608 ?auto_174615 ) ) ( not ( = ?auto_174609 ?auto_174615 ) ) ( not ( = ?auto_174610 ?auto_174615 ) ) ( not ( = ?auto_174611 ?auto_174615 ) ) ( not ( = ?auto_174612 ?auto_174615 ) ) ( not ( = ?auto_174613 ?auto_174615 ) ) ( not ( = ?auto_174614 ?auto_174615 ) ) ( ON ?auto_174613 ?auto_174614 ) ( ON-TABLE ?auto_174615 ) ( ON ?auto_174612 ?auto_174613 ) ( ON ?auto_174611 ?auto_174612 ) ( CLEAR ?auto_174609 ) ( ON ?auto_174610 ?auto_174611 ) ( CLEAR ?auto_174610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174615 ?auto_174614 ?auto_174613 ?auto_174612 ?auto_174611 )
      ( MAKE-7PILE ?auto_174608 ?auto_174609 ?auto_174610 ?auto_174611 ?auto_174612 ?auto_174613 ?auto_174614 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174616 - BLOCK
      ?auto_174617 - BLOCK
      ?auto_174618 - BLOCK
      ?auto_174619 - BLOCK
      ?auto_174620 - BLOCK
      ?auto_174621 - BLOCK
      ?auto_174622 - BLOCK
    )
    :vars
    (
      ?auto_174623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174616 ) ( not ( = ?auto_174616 ?auto_174617 ) ) ( not ( = ?auto_174616 ?auto_174618 ) ) ( not ( = ?auto_174616 ?auto_174619 ) ) ( not ( = ?auto_174616 ?auto_174620 ) ) ( not ( = ?auto_174616 ?auto_174621 ) ) ( not ( = ?auto_174616 ?auto_174622 ) ) ( not ( = ?auto_174617 ?auto_174618 ) ) ( not ( = ?auto_174617 ?auto_174619 ) ) ( not ( = ?auto_174617 ?auto_174620 ) ) ( not ( = ?auto_174617 ?auto_174621 ) ) ( not ( = ?auto_174617 ?auto_174622 ) ) ( not ( = ?auto_174618 ?auto_174619 ) ) ( not ( = ?auto_174618 ?auto_174620 ) ) ( not ( = ?auto_174618 ?auto_174621 ) ) ( not ( = ?auto_174618 ?auto_174622 ) ) ( not ( = ?auto_174619 ?auto_174620 ) ) ( not ( = ?auto_174619 ?auto_174621 ) ) ( not ( = ?auto_174619 ?auto_174622 ) ) ( not ( = ?auto_174620 ?auto_174621 ) ) ( not ( = ?auto_174620 ?auto_174622 ) ) ( not ( = ?auto_174621 ?auto_174622 ) ) ( ON ?auto_174622 ?auto_174623 ) ( not ( = ?auto_174616 ?auto_174623 ) ) ( not ( = ?auto_174617 ?auto_174623 ) ) ( not ( = ?auto_174618 ?auto_174623 ) ) ( not ( = ?auto_174619 ?auto_174623 ) ) ( not ( = ?auto_174620 ?auto_174623 ) ) ( not ( = ?auto_174621 ?auto_174623 ) ) ( not ( = ?auto_174622 ?auto_174623 ) ) ( ON ?auto_174621 ?auto_174622 ) ( ON-TABLE ?auto_174623 ) ( ON ?auto_174620 ?auto_174621 ) ( ON ?auto_174619 ?auto_174620 ) ( ON ?auto_174618 ?auto_174619 ) ( CLEAR ?auto_174618 ) ( HOLDING ?auto_174617 ) ( CLEAR ?auto_174616 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174616 ?auto_174617 )
      ( MAKE-7PILE ?auto_174616 ?auto_174617 ?auto_174618 ?auto_174619 ?auto_174620 ?auto_174621 ?auto_174622 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174624 - BLOCK
      ?auto_174625 - BLOCK
      ?auto_174626 - BLOCK
      ?auto_174627 - BLOCK
      ?auto_174628 - BLOCK
      ?auto_174629 - BLOCK
      ?auto_174630 - BLOCK
    )
    :vars
    (
      ?auto_174631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174624 ) ( not ( = ?auto_174624 ?auto_174625 ) ) ( not ( = ?auto_174624 ?auto_174626 ) ) ( not ( = ?auto_174624 ?auto_174627 ) ) ( not ( = ?auto_174624 ?auto_174628 ) ) ( not ( = ?auto_174624 ?auto_174629 ) ) ( not ( = ?auto_174624 ?auto_174630 ) ) ( not ( = ?auto_174625 ?auto_174626 ) ) ( not ( = ?auto_174625 ?auto_174627 ) ) ( not ( = ?auto_174625 ?auto_174628 ) ) ( not ( = ?auto_174625 ?auto_174629 ) ) ( not ( = ?auto_174625 ?auto_174630 ) ) ( not ( = ?auto_174626 ?auto_174627 ) ) ( not ( = ?auto_174626 ?auto_174628 ) ) ( not ( = ?auto_174626 ?auto_174629 ) ) ( not ( = ?auto_174626 ?auto_174630 ) ) ( not ( = ?auto_174627 ?auto_174628 ) ) ( not ( = ?auto_174627 ?auto_174629 ) ) ( not ( = ?auto_174627 ?auto_174630 ) ) ( not ( = ?auto_174628 ?auto_174629 ) ) ( not ( = ?auto_174628 ?auto_174630 ) ) ( not ( = ?auto_174629 ?auto_174630 ) ) ( ON ?auto_174630 ?auto_174631 ) ( not ( = ?auto_174624 ?auto_174631 ) ) ( not ( = ?auto_174625 ?auto_174631 ) ) ( not ( = ?auto_174626 ?auto_174631 ) ) ( not ( = ?auto_174627 ?auto_174631 ) ) ( not ( = ?auto_174628 ?auto_174631 ) ) ( not ( = ?auto_174629 ?auto_174631 ) ) ( not ( = ?auto_174630 ?auto_174631 ) ) ( ON ?auto_174629 ?auto_174630 ) ( ON-TABLE ?auto_174631 ) ( ON ?auto_174628 ?auto_174629 ) ( ON ?auto_174627 ?auto_174628 ) ( ON ?auto_174626 ?auto_174627 ) ( CLEAR ?auto_174624 ) ( ON ?auto_174625 ?auto_174626 ) ( CLEAR ?auto_174625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174631 ?auto_174630 ?auto_174629 ?auto_174628 ?auto_174627 ?auto_174626 )
      ( MAKE-7PILE ?auto_174624 ?auto_174625 ?auto_174626 ?auto_174627 ?auto_174628 ?auto_174629 ?auto_174630 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174632 - BLOCK
      ?auto_174633 - BLOCK
      ?auto_174634 - BLOCK
      ?auto_174635 - BLOCK
      ?auto_174636 - BLOCK
      ?auto_174637 - BLOCK
      ?auto_174638 - BLOCK
    )
    :vars
    (
      ?auto_174639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174632 ?auto_174633 ) ) ( not ( = ?auto_174632 ?auto_174634 ) ) ( not ( = ?auto_174632 ?auto_174635 ) ) ( not ( = ?auto_174632 ?auto_174636 ) ) ( not ( = ?auto_174632 ?auto_174637 ) ) ( not ( = ?auto_174632 ?auto_174638 ) ) ( not ( = ?auto_174633 ?auto_174634 ) ) ( not ( = ?auto_174633 ?auto_174635 ) ) ( not ( = ?auto_174633 ?auto_174636 ) ) ( not ( = ?auto_174633 ?auto_174637 ) ) ( not ( = ?auto_174633 ?auto_174638 ) ) ( not ( = ?auto_174634 ?auto_174635 ) ) ( not ( = ?auto_174634 ?auto_174636 ) ) ( not ( = ?auto_174634 ?auto_174637 ) ) ( not ( = ?auto_174634 ?auto_174638 ) ) ( not ( = ?auto_174635 ?auto_174636 ) ) ( not ( = ?auto_174635 ?auto_174637 ) ) ( not ( = ?auto_174635 ?auto_174638 ) ) ( not ( = ?auto_174636 ?auto_174637 ) ) ( not ( = ?auto_174636 ?auto_174638 ) ) ( not ( = ?auto_174637 ?auto_174638 ) ) ( ON ?auto_174638 ?auto_174639 ) ( not ( = ?auto_174632 ?auto_174639 ) ) ( not ( = ?auto_174633 ?auto_174639 ) ) ( not ( = ?auto_174634 ?auto_174639 ) ) ( not ( = ?auto_174635 ?auto_174639 ) ) ( not ( = ?auto_174636 ?auto_174639 ) ) ( not ( = ?auto_174637 ?auto_174639 ) ) ( not ( = ?auto_174638 ?auto_174639 ) ) ( ON ?auto_174637 ?auto_174638 ) ( ON-TABLE ?auto_174639 ) ( ON ?auto_174636 ?auto_174637 ) ( ON ?auto_174635 ?auto_174636 ) ( ON ?auto_174634 ?auto_174635 ) ( ON ?auto_174633 ?auto_174634 ) ( CLEAR ?auto_174633 ) ( HOLDING ?auto_174632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174632 )
      ( MAKE-7PILE ?auto_174632 ?auto_174633 ?auto_174634 ?auto_174635 ?auto_174636 ?auto_174637 ?auto_174638 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174640 - BLOCK
      ?auto_174641 - BLOCK
      ?auto_174642 - BLOCK
      ?auto_174643 - BLOCK
      ?auto_174644 - BLOCK
      ?auto_174645 - BLOCK
      ?auto_174646 - BLOCK
    )
    :vars
    (
      ?auto_174647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174640 ?auto_174641 ) ) ( not ( = ?auto_174640 ?auto_174642 ) ) ( not ( = ?auto_174640 ?auto_174643 ) ) ( not ( = ?auto_174640 ?auto_174644 ) ) ( not ( = ?auto_174640 ?auto_174645 ) ) ( not ( = ?auto_174640 ?auto_174646 ) ) ( not ( = ?auto_174641 ?auto_174642 ) ) ( not ( = ?auto_174641 ?auto_174643 ) ) ( not ( = ?auto_174641 ?auto_174644 ) ) ( not ( = ?auto_174641 ?auto_174645 ) ) ( not ( = ?auto_174641 ?auto_174646 ) ) ( not ( = ?auto_174642 ?auto_174643 ) ) ( not ( = ?auto_174642 ?auto_174644 ) ) ( not ( = ?auto_174642 ?auto_174645 ) ) ( not ( = ?auto_174642 ?auto_174646 ) ) ( not ( = ?auto_174643 ?auto_174644 ) ) ( not ( = ?auto_174643 ?auto_174645 ) ) ( not ( = ?auto_174643 ?auto_174646 ) ) ( not ( = ?auto_174644 ?auto_174645 ) ) ( not ( = ?auto_174644 ?auto_174646 ) ) ( not ( = ?auto_174645 ?auto_174646 ) ) ( ON ?auto_174646 ?auto_174647 ) ( not ( = ?auto_174640 ?auto_174647 ) ) ( not ( = ?auto_174641 ?auto_174647 ) ) ( not ( = ?auto_174642 ?auto_174647 ) ) ( not ( = ?auto_174643 ?auto_174647 ) ) ( not ( = ?auto_174644 ?auto_174647 ) ) ( not ( = ?auto_174645 ?auto_174647 ) ) ( not ( = ?auto_174646 ?auto_174647 ) ) ( ON ?auto_174645 ?auto_174646 ) ( ON-TABLE ?auto_174647 ) ( ON ?auto_174644 ?auto_174645 ) ( ON ?auto_174643 ?auto_174644 ) ( ON ?auto_174642 ?auto_174643 ) ( ON ?auto_174641 ?auto_174642 ) ( ON ?auto_174640 ?auto_174641 ) ( CLEAR ?auto_174640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174647 ?auto_174646 ?auto_174645 ?auto_174644 ?auto_174643 ?auto_174642 ?auto_174641 )
      ( MAKE-7PILE ?auto_174640 ?auto_174641 ?auto_174642 ?auto_174643 ?auto_174644 ?auto_174645 ?auto_174646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174648 - BLOCK
      ?auto_174649 - BLOCK
      ?auto_174650 - BLOCK
      ?auto_174651 - BLOCK
      ?auto_174652 - BLOCK
      ?auto_174653 - BLOCK
      ?auto_174654 - BLOCK
    )
    :vars
    (
      ?auto_174655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174648 ?auto_174649 ) ) ( not ( = ?auto_174648 ?auto_174650 ) ) ( not ( = ?auto_174648 ?auto_174651 ) ) ( not ( = ?auto_174648 ?auto_174652 ) ) ( not ( = ?auto_174648 ?auto_174653 ) ) ( not ( = ?auto_174648 ?auto_174654 ) ) ( not ( = ?auto_174649 ?auto_174650 ) ) ( not ( = ?auto_174649 ?auto_174651 ) ) ( not ( = ?auto_174649 ?auto_174652 ) ) ( not ( = ?auto_174649 ?auto_174653 ) ) ( not ( = ?auto_174649 ?auto_174654 ) ) ( not ( = ?auto_174650 ?auto_174651 ) ) ( not ( = ?auto_174650 ?auto_174652 ) ) ( not ( = ?auto_174650 ?auto_174653 ) ) ( not ( = ?auto_174650 ?auto_174654 ) ) ( not ( = ?auto_174651 ?auto_174652 ) ) ( not ( = ?auto_174651 ?auto_174653 ) ) ( not ( = ?auto_174651 ?auto_174654 ) ) ( not ( = ?auto_174652 ?auto_174653 ) ) ( not ( = ?auto_174652 ?auto_174654 ) ) ( not ( = ?auto_174653 ?auto_174654 ) ) ( ON ?auto_174654 ?auto_174655 ) ( not ( = ?auto_174648 ?auto_174655 ) ) ( not ( = ?auto_174649 ?auto_174655 ) ) ( not ( = ?auto_174650 ?auto_174655 ) ) ( not ( = ?auto_174651 ?auto_174655 ) ) ( not ( = ?auto_174652 ?auto_174655 ) ) ( not ( = ?auto_174653 ?auto_174655 ) ) ( not ( = ?auto_174654 ?auto_174655 ) ) ( ON ?auto_174653 ?auto_174654 ) ( ON-TABLE ?auto_174655 ) ( ON ?auto_174652 ?auto_174653 ) ( ON ?auto_174651 ?auto_174652 ) ( ON ?auto_174650 ?auto_174651 ) ( ON ?auto_174649 ?auto_174650 ) ( HOLDING ?auto_174648 ) ( CLEAR ?auto_174649 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174655 ?auto_174654 ?auto_174653 ?auto_174652 ?auto_174651 ?auto_174650 ?auto_174649 ?auto_174648 )
      ( MAKE-7PILE ?auto_174648 ?auto_174649 ?auto_174650 ?auto_174651 ?auto_174652 ?auto_174653 ?auto_174654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174656 - BLOCK
      ?auto_174657 - BLOCK
      ?auto_174658 - BLOCK
      ?auto_174659 - BLOCK
      ?auto_174660 - BLOCK
      ?auto_174661 - BLOCK
      ?auto_174662 - BLOCK
    )
    :vars
    (
      ?auto_174663 - BLOCK
      ?auto_174664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174656 ?auto_174657 ) ) ( not ( = ?auto_174656 ?auto_174658 ) ) ( not ( = ?auto_174656 ?auto_174659 ) ) ( not ( = ?auto_174656 ?auto_174660 ) ) ( not ( = ?auto_174656 ?auto_174661 ) ) ( not ( = ?auto_174656 ?auto_174662 ) ) ( not ( = ?auto_174657 ?auto_174658 ) ) ( not ( = ?auto_174657 ?auto_174659 ) ) ( not ( = ?auto_174657 ?auto_174660 ) ) ( not ( = ?auto_174657 ?auto_174661 ) ) ( not ( = ?auto_174657 ?auto_174662 ) ) ( not ( = ?auto_174658 ?auto_174659 ) ) ( not ( = ?auto_174658 ?auto_174660 ) ) ( not ( = ?auto_174658 ?auto_174661 ) ) ( not ( = ?auto_174658 ?auto_174662 ) ) ( not ( = ?auto_174659 ?auto_174660 ) ) ( not ( = ?auto_174659 ?auto_174661 ) ) ( not ( = ?auto_174659 ?auto_174662 ) ) ( not ( = ?auto_174660 ?auto_174661 ) ) ( not ( = ?auto_174660 ?auto_174662 ) ) ( not ( = ?auto_174661 ?auto_174662 ) ) ( ON ?auto_174662 ?auto_174663 ) ( not ( = ?auto_174656 ?auto_174663 ) ) ( not ( = ?auto_174657 ?auto_174663 ) ) ( not ( = ?auto_174658 ?auto_174663 ) ) ( not ( = ?auto_174659 ?auto_174663 ) ) ( not ( = ?auto_174660 ?auto_174663 ) ) ( not ( = ?auto_174661 ?auto_174663 ) ) ( not ( = ?auto_174662 ?auto_174663 ) ) ( ON ?auto_174661 ?auto_174662 ) ( ON-TABLE ?auto_174663 ) ( ON ?auto_174660 ?auto_174661 ) ( ON ?auto_174659 ?auto_174660 ) ( ON ?auto_174658 ?auto_174659 ) ( ON ?auto_174657 ?auto_174658 ) ( CLEAR ?auto_174657 ) ( ON ?auto_174656 ?auto_174664 ) ( CLEAR ?auto_174656 ) ( HAND-EMPTY ) ( not ( = ?auto_174656 ?auto_174664 ) ) ( not ( = ?auto_174657 ?auto_174664 ) ) ( not ( = ?auto_174658 ?auto_174664 ) ) ( not ( = ?auto_174659 ?auto_174664 ) ) ( not ( = ?auto_174660 ?auto_174664 ) ) ( not ( = ?auto_174661 ?auto_174664 ) ) ( not ( = ?auto_174662 ?auto_174664 ) ) ( not ( = ?auto_174663 ?auto_174664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174656 ?auto_174664 )
      ( MAKE-7PILE ?auto_174656 ?auto_174657 ?auto_174658 ?auto_174659 ?auto_174660 ?auto_174661 ?auto_174662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174665 - BLOCK
      ?auto_174666 - BLOCK
      ?auto_174667 - BLOCK
      ?auto_174668 - BLOCK
      ?auto_174669 - BLOCK
      ?auto_174670 - BLOCK
      ?auto_174671 - BLOCK
    )
    :vars
    (
      ?auto_174673 - BLOCK
      ?auto_174672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174665 ?auto_174666 ) ) ( not ( = ?auto_174665 ?auto_174667 ) ) ( not ( = ?auto_174665 ?auto_174668 ) ) ( not ( = ?auto_174665 ?auto_174669 ) ) ( not ( = ?auto_174665 ?auto_174670 ) ) ( not ( = ?auto_174665 ?auto_174671 ) ) ( not ( = ?auto_174666 ?auto_174667 ) ) ( not ( = ?auto_174666 ?auto_174668 ) ) ( not ( = ?auto_174666 ?auto_174669 ) ) ( not ( = ?auto_174666 ?auto_174670 ) ) ( not ( = ?auto_174666 ?auto_174671 ) ) ( not ( = ?auto_174667 ?auto_174668 ) ) ( not ( = ?auto_174667 ?auto_174669 ) ) ( not ( = ?auto_174667 ?auto_174670 ) ) ( not ( = ?auto_174667 ?auto_174671 ) ) ( not ( = ?auto_174668 ?auto_174669 ) ) ( not ( = ?auto_174668 ?auto_174670 ) ) ( not ( = ?auto_174668 ?auto_174671 ) ) ( not ( = ?auto_174669 ?auto_174670 ) ) ( not ( = ?auto_174669 ?auto_174671 ) ) ( not ( = ?auto_174670 ?auto_174671 ) ) ( ON ?auto_174671 ?auto_174673 ) ( not ( = ?auto_174665 ?auto_174673 ) ) ( not ( = ?auto_174666 ?auto_174673 ) ) ( not ( = ?auto_174667 ?auto_174673 ) ) ( not ( = ?auto_174668 ?auto_174673 ) ) ( not ( = ?auto_174669 ?auto_174673 ) ) ( not ( = ?auto_174670 ?auto_174673 ) ) ( not ( = ?auto_174671 ?auto_174673 ) ) ( ON ?auto_174670 ?auto_174671 ) ( ON-TABLE ?auto_174673 ) ( ON ?auto_174669 ?auto_174670 ) ( ON ?auto_174668 ?auto_174669 ) ( ON ?auto_174667 ?auto_174668 ) ( ON ?auto_174665 ?auto_174672 ) ( CLEAR ?auto_174665 ) ( not ( = ?auto_174665 ?auto_174672 ) ) ( not ( = ?auto_174666 ?auto_174672 ) ) ( not ( = ?auto_174667 ?auto_174672 ) ) ( not ( = ?auto_174668 ?auto_174672 ) ) ( not ( = ?auto_174669 ?auto_174672 ) ) ( not ( = ?auto_174670 ?auto_174672 ) ) ( not ( = ?auto_174671 ?auto_174672 ) ) ( not ( = ?auto_174673 ?auto_174672 ) ) ( HOLDING ?auto_174666 ) ( CLEAR ?auto_174667 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174673 ?auto_174671 ?auto_174670 ?auto_174669 ?auto_174668 ?auto_174667 ?auto_174666 )
      ( MAKE-7PILE ?auto_174665 ?auto_174666 ?auto_174667 ?auto_174668 ?auto_174669 ?auto_174670 ?auto_174671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174674 - BLOCK
      ?auto_174675 - BLOCK
      ?auto_174676 - BLOCK
      ?auto_174677 - BLOCK
      ?auto_174678 - BLOCK
      ?auto_174679 - BLOCK
      ?auto_174680 - BLOCK
    )
    :vars
    (
      ?auto_174681 - BLOCK
      ?auto_174682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174674 ?auto_174675 ) ) ( not ( = ?auto_174674 ?auto_174676 ) ) ( not ( = ?auto_174674 ?auto_174677 ) ) ( not ( = ?auto_174674 ?auto_174678 ) ) ( not ( = ?auto_174674 ?auto_174679 ) ) ( not ( = ?auto_174674 ?auto_174680 ) ) ( not ( = ?auto_174675 ?auto_174676 ) ) ( not ( = ?auto_174675 ?auto_174677 ) ) ( not ( = ?auto_174675 ?auto_174678 ) ) ( not ( = ?auto_174675 ?auto_174679 ) ) ( not ( = ?auto_174675 ?auto_174680 ) ) ( not ( = ?auto_174676 ?auto_174677 ) ) ( not ( = ?auto_174676 ?auto_174678 ) ) ( not ( = ?auto_174676 ?auto_174679 ) ) ( not ( = ?auto_174676 ?auto_174680 ) ) ( not ( = ?auto_174677 ?auto_174678 ) ) ( not ( = ?auto_174677 ?auto_174679 ) ) ( not ( = ?auto_174677 ?auto_174680 ) ) ( not ( = ?auto_174678 ?auto_174679 ) ) ( not ( = ?auto_174678 ?auto_174680 ) ) ( not ( = ?auto_174679 ?auto_174680 ) ) ( ON ?auto_174680 ?auto_174681 ) ( not ( = ?auto_174674 ?auto_174681 ) ) ( not ( = ?auto_174675 ?auto_174681 ) ) ( not ( = ?auto_174676 ?auto_174681 ) ) ( not ( = ?auto_174677 ?auto_174681 ) ) ( not ( = ?auto_174678 ?auto_174681 ) ) ( not ( = ?auto_174679 ?auto_174681 ) ) ( not ( = ?auto_174680 ?auto_174681 ) ) ( ON ?auto_174679 ?auto_174680 ) ( ON-TABLE ?auto_174681 ) ( ON ?auto_174678 ?auto_174679 ) ( ON ?auto_174677 ?auto_174678 ) ( ON ?auto_174676 ?auto_174677 ) ( ON ?auto_174674 ?auto_174682 ) ( not ( = ?auto_174674 ?auto_174682 ) ) ( not ( = ?auto_174675 ?auto_174682 ) ) ( not ( = ?auto_174676 ?auto_174682 ) ) ( not ( = ?auto_174677 ?auto_174682 ) ) ( not ( = ?auto_174678 ?auto_174682 ) ) ( not ( = ?auto_174679 ?auto_174682 ) ) ( not ( = ?auto_174680 ?auto_174682 ) ) ( not ( = ?auto_174681 ?auto_174682 ) ) ( CLEAR ?auto_174676 ) ( ON ?auto_174675 ?auto_174674 ) ( CLEAR ?auto_174675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174682 ?auto_174674 )
      ( MAKE-7PILE ?auto_174674 ?auto_174675 ?auto_174676 ?auto_174677 ?auto_174678 ?auto_174679 ?auto_174680 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174683 - BLOCK
      ?auto_174684 - BLOCK
      ?auto_174685 - BLOCK
      ?auto_174686 - BLOCK
      ?auto_174687 - BLOCK
      ?auto_174688 - BLOCK
      ?auto_174689 - BLOCK
    )
    :vars
    (
      ?auto_174691 - BLOCK
      ?auto_174690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174683 ?auto_174684 ) ) ( not ( = ?auto_174683 ?auto_174685 ) ) ( not ( = ?auto_174683 ?auto_174686 ) ) ( not ( = ?auto_174683 ?auto_174687 ) ) ( not ( = ?auto_174683 ?auto_174688 ) ) ( not ( = ?auto_174683 ?auto_174689 ) ) ( not ( = ?auto_174684 ?auto_174685 ) ) ( not ( = ?auto_174684 ?auto_174686 ) ) ( not ( = ?auto_174684 ?auto_174687 ) ) ( not ( = ?auto_174684 ?auto_174688 ) ) ( not ( = ?auto_174684 ?auto_174689 ) ) ( not ( = ?auto_174685 ?auto_174686 ) ) ( not ( = ?auto_174685 ?auto_174687 ) ) ( not ( = ?auto_174685 ?auto_174688 ) ) ( not ( = ?auto_174685 ?auto_174689 ) ) ( not ( = ?auto_174686 ?auto_174687 ) ) ( not ( = ?auto_174686 ?auto_174688 ) ) ( not ( = ?auto_174686 ?auto_174689 ) ) ( not ( = ?auto_174687 ?auto_174688 ) ) ( not ( = ?auto_174687 ?auto_174689 ) ) ( not ( = ?auto_174688 ?auto_174689 ) ) ( ON ?auto_174689 ?auto_174691 ) ( not ( = ?auto_174683 ?auto_174691 ) ) ( not ( = ?auto_174684 ?auto_174691 ) ) ( not ( = ?auto_174685 ?auto_174691 ) ) ( not ( = ?auto_174686 ?auto_174691 ) ) ( not ( = ?auto_174687 ?auto_174691 ) ) ( not ( = ?auto_174688 ?auto_174691 ) ) ( not ( = ?auto_174689 ?auto_174691 ) ) ( ON ?auto_174688 ?auto_174689 ) ( ON-TABLE ?auto_174691 ) ( ON ?auto_174687 ?auto_174688 ) ( ON ?auto_174686 ?auto_174687 ) ( ON ?auto_174683 ?auto_174690 ) ( not ( = ?auto_174683 ?auto_174690 ) ) ( not ( = ?auto_174684 ?auto_174690 ) ) ( not ( = ?auto_174685 ?auto_174690 ) ) ( not ( = ?auto_174686 ?auto_174690 ) ) ( not ( = ?auto_174687 ?auto_174690 ) ) ( not ( = ?auto_174688 ?auto_174690 ) ) ( not ( = ?auto_174689 ?auto_174690 ) ) ( not ( = ?auto_174691 ?auto_174690 ) ) ( ON ?auto_174684 ?auto_174683 ) ( CLEAR ?auto_174684 ) ( ON-TABLE ?auto_174690 ) ( HOLDING ?auto_174685 ) ( CLEAR ?auto_174686 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174691 ?auto_174689 ?auto_174688 ?auto_174687 ?auto_174686 ?auto_174685 )
      ( MAKE-7PILE ?auto_174683 ?auto_174684 ?auto_174685 ?auto_174686 ?auto_174687 ?auto_174688 ?auto_174689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174692 - BLOCK
      ?auto_174693 - BLOCK
      ?auto_174694 - BLOCK
      ?auto_174695 - BLOCK
      ?auto_174696 - BLOCK
      ?auto_174697 - BLOCK
      ?auto_174698 - BLOCK
    )
    :vars
    (
      ?auto_174699 - BLOCK
      ?auto_174700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174692 ?auto_174693 ) ) ( not ( = ?auto_174692 ?auto_174694 ) ) ( not ( = ?auto_174692 ?auto_174695 ) ) ( not ( = ?auto_174692 ?auto_174696 ) ) ( not ( = ?auto_174692 ?auto_174697 ) ) ( not ( = ?auto_174692 ?auto_174698 ) ) ( not ( = ?auto_174693 ?auto_174694 ) ) ( not ( = ?auto_174693 ?auto_174695 ) ) ( not ( = ?auto_174693 ?auto_174696 ) ) ( not ( = ?auto_174693 ?auto_174697 ) ) ( not ( = ?auto_174693 ?auto_174698 ) ) ( not ( = ?auto_174694 ?auto_174695 ) ) ( not ( = ?auto_174694 ?auto_174696 ) ) ( not ( = ?auto_174694 ?auto_174697 ) ) ( not ( = ?auto_174694 ?auto_174698 ) ) ( not ( = ?auto_174695 ?auto_174696 ) ) ( not ( = ?auto_174695 ?auto_174697 ) ) ( not ( = ?auto_174695 ?auto_174698 ) ) ( not ( = ?auto_174696 ?auto_174697 ) ) ( not ( = ?auto_174696 ?auto_174698 ) ) ( not ( = ?auto_174697 ?auto_174698 ) ) ( ON ?auto_174698 ?auto_174699 ) ( not ( = ?auto_174692 ?auto_174699 ) ) ( not ( = ?auto_174693 ?auto_174699 ) ) ( not ( = ?auto_174694 ?auto_174699 ) ) ( not ( = ?auto_174695 ?auto_174699 ) ) ( not ( = ?auto_174696 ?auto_174699 ) ) ( not ( = ?auto_174697 ?auto_174699 ) ) ( not ( = ?auto_174698 ?auto_174699 ) ) ( ON ?auto_174697 ?auto_174698 ) ( ON-TABLE ?auto_174699 ) ( ON ?auto_174696 ?auto_174697 ) ( ON ?auto_174695 ?auto_174696 ) ( ON ?auto_174692 ?auto_174700 ) ( not ( = ?auto_174692 ?auto_174700 ) ) ( not ( = ?auto_174693 ?auto_174700 ) ) ( not ( = ?auto_174694 ?auto_174700 ) ) ( not ( = ?auto_174695 ?auto_174700 ) ) ( not ( = ?auto_174696 ?auto_174700 ) ) ( not ( = ?auto_174697 ?auto_174700 ) ) ( not ( = ?auto_174698 ?auto_174700 ) ) ( not ( = ?auto_174699 ?auto_174700 ) ) ( ON ?auto_174693 ?auto_174692 ) ( ON-TABLE ?auto_174700 ) ( CLEAR ?auto_174695 ) ( ON ?auto_174694 ?auto_174693 ) ( CLEAR ?auto_174694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174700 ?auto_174692 ?auto_174693 )
      ( MAKE-7PILE ?auto_174692 ?auto_174693 ?auto_174694 ?auto_174695 ?auto_174696 ?auto_174697 ?auto_174698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174701 - BLOCK
      ?auto_174702 - BLOCK
      ?auto_174703 - BLOCK
      ?auto_174704 - BLOCK
      ?auto_174705 - BLOCK
      ?auto_174706 - BLOCK
      ?auto_174707 - BLOCK
    )
    :vars
    (
      ?auto_174709 - BLOCK
      ?auto_174708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174701 ?auto_174702 ) ) ( not ( = ?auto_174701 ?auto_174703 ) ) ( not ( = ?auto_174701 ?auto_174704 ) ) ( not ( = ?auto_174701 ?auto_174705 ) ) ( not ( = ?auto_174701 ?auto_174706 ) ) ( not ( = ?auto_174701 ?auto_174707 ) ) ( not ( = ?auto_174702 ?auto_174703 ) ) ( not ( = ?auto_174702 ?auto_174704 ) ) ( not ( = ?auto_174702 ?auto_174705 ) ) ( not ( = ?auto_174702 ?auto_174706 ) ) ( not ( = ?auto_174702 ?auto_174707 ) ) ( not ( = ?auto_174703 ?auto_174704 ) ) ( not ( = ?auto_174703 ?auto_174705 ) ) ( not ( = ?auto_174703 ?auto_174706 ) ) ( not ( = ?auto_174703 ?auto_174707 ) ) ( not ( = ?auto_174704 ?auto_174705 ) ) ( not ( = ?auto_174704 ?auto_174706 ) ) ( not ( = ?auto_174704 ?auto_174707 ) ) ( not ( = ?auto_174705 ?auto_174706 ) ) ( not ( = ?auto_174705 ?auto_174707 ) ) ( not ( = ?auto_174706 ?auto_174707 ) ) ( ON ?auto_174707 ?auto_174709 ) ( not ( = ?auto_174701 ?auto_174709 ) ) ( not ( = ?auto_174702 ?auto_174709 ) ) ( not ( = ?auto_174703 ?auto_174709 ) ) ( not ( = ?auto_174704 ?auto_174709 ) ) ( not ( = ?auto_174705 ?auto_174709 ) ) ( not ( = ?auto_174706 ?auto_174709 ) ) ( not ( = ?auto_174707 ?auto_174709 ) ) ( ON ?auto_174706 ?auto_174707 ) ( ON-TABLE ?auto_174709 ) ( ON ?auto_174705 ?auto_174706 ) ( ON ?auto_174701 ?auto_174708 ) ( not ( = ?auto_174701 ?auto_174708 ) ) ( not ( = ?auto_174702 ?auto_174708 ) ) ( not ( = ?auto_174703 ?auto_174708 ) ) ( not ( = ?auto_174704 ?auto_174708 ) ) ( not ( = ?auto_174705 ?auto_174708 ) ) ( not ( = ?auto_174706 ?auto_174708 ) ) ( not ( = ?auto_174707 ?auto_174708 ) ) ( not ( = ?auto_174709 ?auto_174708 ) ) ( ON ?auto_174702 ?auto_174701 ) ( ON-TABLE ?auto_174708 ) ( ON ?auto_174703 ?auto_174702 ) ( CLEAR ?auto_174703 ) ( HOLDING ?auto_174704 ) ( CLEAR ?auto_174705 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174709 ?auto_174707 ?auto_174706 ?auto_174705 ?auto_174704 )
      ( MAKE-7PILE ?auto_174701 ?auto_174702 ?auto_174703 ?auto_174704 ?auto_174705 ?auto_174706 ?auto_174707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174710 - BLOCK
      ?auto_174711 - BLOCK
      ?auto_174712 - BLOCK
      ?auto_174713 - BLOCK
      ?auto_174714 - BLOCK
      ?auto_174715 - BLOCK
      ?auto_174716 - BLOCK
    )
    :vars
    (
      ?auto_174717 - BLOCK
      ?auto_174718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174710 ?auto_174711 ) ) ( not ( = ?auto_174710 ?auto_174712 ) ) ( not ( = ?auto_174710 ?auto_174713 ) ) ( not ( = ?auto_174710 ?auto_174714 ) ) ( not ( = ?auto_174710 ?auto_174715 ) ) ( not ( = ?auto_174710 ?auto_174716 ) ) ( not ( = ?auto_174711 ?auto_174712 ) ) ( not ( = ?auto_174711 ?auto_174713 ) ) ( not ( = ?auto_174711 ?auto_174714 ) ) ( not ( = ?auto_174711 ?auto_174715 ) ) ( not ( = ?auto_174711 ?auto_174716 ) ) ( not ( = ?auto_174712 ?auto_174713 ) ) ( not ( = ?auto_174712 ?auto_174714 ) ) ( not ( = ?auto_174712 ?auto_174715 ) ) ( not ( = ?auto_174712 ?auto_174716 ) ) ( not ( = ?auto_174713 ?auto_174714 ) ) ( not ( = ?auto_174713 ?auto_174715 ) ) ( not ( = ?auto_174713 ?auto_174716 ) ) ( not ( = ?auto_174714 ?auto_174715 ) ) ( not ( = ?auto_174714 ?auto_174716 ) ) ( not ( = ?auto_174715 ?auto_174716 ) ) ( ON ?auto_174716 ?auto_174717 ) ( not ( = ?auto_174710 ?auto_174717 ) ) ( not ( = ?auto_174711 ?auto_174717 ) ) ( not ( = ?auto_174712 ?auto_174717 ) ) ( not ( = ?auto_174713 ?auto_174717 ) ) ( not ( = ?auto_174714 ?auto_174717 ) ) ( not ( = ?auto_174715 ?auto_174717 ) ) ( not ( = ?auto_174716 ?auto_174717 ) ) ( ON ?auto_174715 ?auto_174716 ) ( ON-TABLE ?auto_174717 ) ( ON ?auto_174714 ?auto_174715 ) ( ON ?auto_174710 ?auto_174718 ) ( not ( = ?auto_174710 ?auto_174718 ) ) ( not ( = ?auto_174711 ?auto_174718 ) ) ( not ( = ?auto_174712 ?auto_174718 ) ) ( not ( = ?auto_174713 ?auto_174718 ) ) ( not ( = ?auto_174714 ?auto_174718 ) ) ( not ( = ?auto_174715 ?auto_174718 ) ) ( not ( = ?auto_174716 ?auto_174718 ) ) ( not ( = ?auto_174717 ?auto_174718 ) ) ( ON ?auto_174711 ?auto_174710 ) ( ON-TABLE ?auto_174718 ) ( ON ?auto_174712 ?auto_174711 ) ( CLEAR ?auto_174714 ) ( ON ?auto_174713 ?auto_174712 ) ( CLEAR ?auto_174713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174718 ?auto_174710 ?auto_174711 ?auto_174712 )
      ( MAKE-7PILE ?auto_174710 ?auto_174711 ?auto_174712 ?auto_174713 ?auto_174714 ?auto_174715 ?auto_174716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174719 - BLOCK
      ?auto_174720 - BLOCK
      ?auto_174721 - BLOCK
      ?auto_174722 - BLOCK
      ?auto_174723 - BLOCK
      ?auto_174724 - BLOCK
      ?auto_174725 - BLOCK
    )
    :vars
    (
      ?auto_174727 - BLOCK
      ?auto_174726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174719 ?auto_174720 ) ) ( not ( = ?auto_174719 ?auto_174721 ) ) ( not ( = ?auto_174719 ?auto_174722 ) ) ( not ( = ?auto_174719 ?auto_174723 ) ) ( not ( = ?auto_174719 ?auto_174724 ) ) ( not ( = ?auto_174719 ?auto_174725 ) ) ( not ( = ?auto_174720 ?auto_174721 ) ) ( not ( = ?auto_174720 ?auto_174722 ) ) ( not ( = ?auto_174720 ?auto_174723 ) ) ( not ( = ?auto_174720 ?auto_174724 ) ) ( not ( = ?auto_174720 ?auto_174725 ) ) ( not ( = ?auto_174721 ?auto_174722 ) ) ( not ( = ?auto_174721 ?auto_174723 ) ) ( not ( = ?auto_174721 ?auto_174724 ) ) ( not ( = ?auto_174721 ?auto_174725 ) ) ( not ( = ?auto_174722 ?auto_174723 ) ) ( not ( = ?auto_174722 ?auto_174724 ) ) ( not ( = ?auto_174722 ?auto_174725 ) ) ( not ( = ?auto_174723 ?auto_174724 ) ) ( not ( = ?auto_174723 ?auto_174725 ) ) ( not ( = ?auto_174724 ?auto_174725 ) ) ( ON ?auto_174725 ?auto_174727 ) ( not ( = ?auto_174719 ?auto_174727 ) ) ( not ( = ?auto_174720 ?auto_174727 ) ) ( not ( = ?auto_174721 ?auto_174727 ) ) ( not ( = ?auto_174722 ?auto_174727 ) ) ( not ( = ?auto_174723 ?auto_174727 ) ) ( not ( = ?auto_174724 ?auto_174727 ) ) ( not ( = ?auto_174725 ?auto_174727 ) ) ( ON ?auto_174724 ?auto_174725 ) ( ON-TABLE ?auto_174727 ) ( ON ?auto_174719 ?auto_174726 ) ( not ( = ?auto_174719 ?auto_174726 ) ) ( not ( = ?auto_174720 ?auto_174726 ) ) ( not ( = ?auto_174721 ?auto_174726 ) ) ( not ( = ?auto_174722 ?auto_174726 ) ) ( not ( = ?auto_174723 ?auto_174726 ) ) ( not ( = ?auto_174724 ?auto_174726 ) ) ( not ( = ?auto_174725 ?auto_174726 ) ) ( not ( = ?auto_174727 ?auto_174726 ) ) ( ON ?auto_174720 ?auto_174719 ) ( ON-TABLE ?auto_174726 ) ( ON ?auto_174721 ?auto_174720 ) ( ON ?auto_174722 ?auto_174721 ) ( CLEAR ?auto_174722 ) ( HOLDING ?auto_174723 ) ( CLEAR ?auto_174724 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174727 ?auto_174725 ?auto_174724 ?auto_174723 )
      ( MAKE-7PILE ?auto_174719 ?auto_174720 ?auto_174721 ?auto_174722 ?auto_174723 ?auto_174724 ?auto_174725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174728 - BLOCK
      ?auto_174729 - BLOCK
      ?auto_174730 - BLOCK
      ?auto_174731 - BLOCK
      ?auto_174732 - BLOCK
      ?auto_174733 - BLOCK
      ?auto_174734 - BLOCK
    )
    :vars
    (
      ?auto_174735 - BLOCK
      ?auto_174736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174728 ?auto_174729 ) ) ( not ( = ?auto_174728 ?auto_174730 ) ) ( not ( = ?auto_174728 ?auto_174731 ) ) ( not ( = ?auto_174728 ?auto_174732 ) ) ( not ( = ?auto_174728 ?auto_174733 ) ) ( not ( = ?auto_174728 ?auto_174734 ) ) ( not ( = ?auto_174729 ?auto_174730 ) ) ( not ( = ?auto_174729 ?auto_174731 ) ) ( not ( = ?auto_174729 ?auto_174732 ) ) ( not ( = ?auto_174729 ?auto_174733 ) ) ( not ( = ?auto_174729 ?auto_174734 ) ) ( not ( = ?auto_174730 ?auto_174731 ) ) ( not ( = ?auto_174730 ?auto_174732 ) ) ( not ( = ?auto_174730 ?auto_174733 ) ) ( not ( = ?auto_174730 ?auto_174734 ) ) ( not ( = ?auto_174731 ?auto_174732 ) ) ( not ( = ?auto_174731 ?auto_174733 ) ) ( not ( = ?auto_174731 ?auto_174734 ) ) ( not ( = ?auto_174732 ?auto_174733 ) ) ( not ( = ?auto_174732 ?auto_174734 ) ) ( not ( = ?auto_174733 ?auto_174734 ) ) ( ON ?auto_174734 ?auto_174735 ) ( not ( = ?auto_174728 ?auto_174735 ) ) ( not ( = ?auto_174729 ?auto_174735 ) ) ( not ( = ?auto_174730 ?auto_174735 ) ) ( not ( = ?auto_174731 ?auto_174735 ) ) ( not ( = ?auto_174732 ?auto_174735 ) ) ( not ( = ?auto_174733 ?auto_174735 ) ) ( not ( = ?auto_174734 ?auto_174735 ) ) ( ON ?auto_174733 ?auto_174734 ) ( ON-TABLE ?auto_174735 ) ( ON ?auto_174728 ?auto_174736 ) ( not ( = ?auto_174728 ?auto_174736 ) ) ( not ( = ?auto_174729 ?auto_174736 ) ) ( not ( = ?auto_174730 ?auto_174736 ) ) ( not ( = ?auto_174731 ?auto_174736 ) ) ( not ( = ?auto_174732 ?auto_174736 ) ) ( not ( = ?auto_174733 ?auto_174736 ) ) ( not ( = ?auto_174734 ?auto_174736 ) ) ( not ( = ?auto_174735 ?auto_174736 ) ) ( ON ?auto_174729 ?auto_174728 ) ( ON-TABLE ?auto_174736 ) ( ON ?auto_174730 ?auto_174729 ) ( ON ?auto_174731 ?auto_174730 ) ( CLEAR ?auto_174733 ) ( ON ?auto_174732 ?auto_174731 ) ( CLEAR ?auto_174732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174736 ?auto_174728 ?auto_174729 ?auto_174730 ?auto_174731 )
      ( MAKE-7PILE ?auto_174728 ?auto_174729 ?auto_174730 ?auto_174731 ?auto_174732 ?auto_174733 ?auto_174734 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174737 - BLOCK
      ?auto_174738 - BLOCK
      ?auto_174739 - BLOCK
      ?auto_174740 - BLOCK
      ?auto_174741 - BLOCK
      ?auto_174742 - BLOCK
      ?auto_174743 - BLOCK
    )
    :vars
    (
      ?auto_174744 - BLOCK
      ?auto_174745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174737 ?auto_174738 ) ) ( not ( = ?auto_174737 ?auto_174739 ) ) ( not ( = ?auto_174737 ?auto_174740 ) ) ( not ( = ?auto_174737 ?auto_174741 ) ) ( not ( = ?auto_174737 ?auto_174742 ) ) ( not ( = ?auto_174737 ?auto_174743 ) ) ( not ( = ?auto_174738 ?auto_174739 ) ) ( not ( = ?auto_174738 ?auto_174740 ) ) ( not ( = ?auto_174738 ?auto_174741 ) ) ( not ( = ?auto_174738 ?auto_174742 ) ) ( not ( = ?auto_174738 ?auto_174743 ) ) ( not ( = ?auto_174739 ?auto_174740 ) ) ( not ( = ?auto_174739 ?auto_174741 ) ) ( not ( = ?auto_174739 ?auto_174742 ) ) ( not ( = ?auto_174739 ?auto_174743 ) ) ( not ( = ?auto_174740 ?auto_174741 ) ) ( not ( = ?auto_174740 ?auto_174742 ) ) ( not ( = ?auto_174740 ?auto_174743 ) ) ( not ( = ?auto_174741 ?auto_174742 ) ) ( not ( = ?auto_174741 ?auto_174743 ) ) ( not ( = ?auto_174742 ?auto_174743 ) ) ( ON ?auto_174743 ?auto_174744 ) ( not ( = ?auto_174737 ?auto_174744 ) ) ( not ( = ?auto_174738 ?auto_174744 ) ) ( not ( = ?auto_174739 ?auto_174744 ) ) ( not ( = ?auto_174740 ?auto_174744 ) ) ( not ( = ?auto_174741 ?auto_174744 ) ) ( not ( = ?auto_174742 ?auto_174744 ) ) ( not ( = ?auto_174743 ?auto_174744 ) ) ( ON-TABLE ?auto_174744 ) ( ON ?auto_174737 ?auto_174745 ) ( not ( = ?auto_174737 ?auto_174745 ) ) ( not ( = ?auto_174738 ?auto_174745 ) ) ( not ( = ?auto_174739 ?auto_174745 ) ) ( not ( = ?auto_174740 ?auto_174745 ) ) ( not ( = ?auto_174741 ?auto_174745 ) ) ( not ( = ?auto_174742 ?auto_174745 ) ) ( not ( = ?auto_174743 ?auto_174745 ) ) ( not ( = ?auto_174744 ?auto_174745 ) ) ( ON ?auto_174738 ?auto_174737 ) ( ON-TABLE ?auto_174745 ) ( ON ?auto_174739 ?auto_174738 ) ( ON ?auto_174740 ?auto_174739 ) ( ON ?auto_174741 ?auto_174740 ) ( CLEAR ?auto_174741 ) ( HOLDING ?auto_174742 ) ( CLEAR ?auto_174743 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174744 ?auto_174743 ?auto_174742 )
      ( MAKE-7PILE ?auto_174737 ?auto_174738 ?auto_174739 ?auto_174740 ?auto_174741 ?auto_174742 ?auto_174743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174746 - BLOCK
      ?auto_174747 - BLOCK
      ?auto_174748 - BLOCK
      ?auto_174749 - BLOCK
      ?auto_174750 - BLOCK
      ?auto_174751 - BLOCK
      ?auto_174752 - BLOCK
    )
    :vars
    (
      ?auto_174753 - BLOCK
      ?auto_174754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174746 ?auto_174747 ) ) ( not ( = ?auto_174746 ?auto_174748 ) ) ( not ( = ?auto_174746 ?auto_174749 ) ) ( not ( = ?auto_174746 ?auto_174750 ) ) ( not ( = ?auto_174746 ?auto_174751 ) ) ( not ( = ?auto_174746 ?auto_174752 ) ) ( not ( = ?auto_174747 ?auto_174748 ) ) ( not ( = ?auto_174747 ?auto_174749 ) ) ( not ( = ?auto_174747 ?auto_174750 ) ) ( not ( = ?auto_174747 ?auto_174751 ) ) ( not ( = ?auto_174747 ?auto_174752 ) ) ( not ( = ?auto_174748 ?auto_174749 ) ) ( not ( = ?auto_174748 ?auto_174750 ) ) ( not ( = ?auto_174748 ?auto_174751 ) ) ( not ( = ?auto_174748 ?auto_174752 ) ) ( not ( = ?auto_174749 ?auto_174750 ) ) ( not ( = ?auto_174749 ?auto_174751 ) ) ( not ( = ?auto_174749 ?auto_174752 ) ) ( not ( = ?auto_174750 ?auto_174751 ) ) ( not ( = ?auto_174750 ?auto_174752 ) ) ( not ( = ?auto_174751 ?auto_174752 ) ) ( ON ?auto_174752 ?auto_174753 ) ( not ( = ?auto_174746 ?auto_174753 ) ) ( not ( = ?auto_174747 ?auto_174753 ) ) ( not ( = ?auto_174748 ?auto_174753 ) ) ( not ( = ?auto_174749 ?auto_174753 ) ) ( not ( = ?auto_174750 ?auto_174753 ) ) ( not ( = ?auto_174751 ?auto_174753 ) ) ( not ( = ?auto_174752 ?auto_174753 ) ) ( ON-TABLE ?auto_174753 ) ( ON ?auto_174746 ?auto_174754 ) ( not ( = ?auto_174746 ?auto_174754 ) ) ( not ( = ?auto_174747 ?auto_174754 ) ) ( not ( = ?auto_174748 ?auto_174754 ) ) ( not ( = ?auto_174749 ?auto_174754 ) ) ( not ( = ?auto_174750 ?auto_174754 ) ) ( not ( = ?auto_174751 ?auto_174754 ) ) ( not ( = ?auto_174752 ?auto_174754 ) ) ( not ( = ?auto_174753 ?auto_174754 ) ) ( ON ?auto_174747 ?auto_174746 ) ( ON-TABLE ?auto_174754 ) ( ON ?auto_174748 ?auto_174747 ) ( ON ?auto_174749 ?auto_174748 ) ( ON ?auto_174750 ?auto_174749 ) ( CLEAR ?auto_174752 ) ( ON ?auto_174751 ?auto_174750 ) ( CLEAR ?auto_174751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174754 ?auto_174746 ?auto_174747 ?auto_174748 ?auto_174749 ?auto_174750 )
      ( MAKE-7PILE ?auto_174746 ?auto_174747 ?auto_174748 ?auto_174749 ?auto_174750 ?auto_174751 ?auto_174752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174755 - BLOCK
      ?auto_174756 - BLOCK
      ?auto_174757 - BLOCK
      ?auto_174758 - BLOCK
      ?auto_174759 - BLOCK
      ?auto_174760 - BLOCK
      ?auto_174761 - BLOCK
    )
    :vars
    (
      ?auto_174763 - BLOCK
      ?auto_174762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174755 ?auto_174756 ) ) ( not ( = ?auto_174755 ?auto_174757 ) ) ( not ( = ?auto_174755 ?auto_174758 ) ) ( not ( = ?auto_174755 ?auto_174759 ) ) ( not ( = ?auto_174755 ?auto_174760 ) ) ( not ( = ?auto_174755 ?auto_174761 ) ) ( not ( = ?auto_174756 ?auto_174757 ) ) ( not ( = ?auto_174756 ?auto_174758 ) ) ( not ( = ?auto_174756 ?auto_174759 ) ) ( not ( = ?auto_174756 ?auto_174760 ) ) ( not ( = ?auto_174756 ?auto_174761 ) ) ( not ( = ?auto_174757 ?auto_174758 ) ) ( not ( = ?auto_174757 ?auto_174759 ) ) ( not ( = ?auto_174757 ?auto_174760 ) ) ( not ( = ?auto_174757 ?auto_174761 ) ) ( not ( = ?auto_174758 ?auto_174759 ) ) ( not ( = ?auto_174758 ?auto_174760 ) ) ( not ( = ?auto_174758 ?auto_174761 ) ) ( not ( = ?auto_174759 ?auto_174760 ) ) ( not ( = ?auto_174759 ?auto_174761 ) ) ( not ( = ?auto_174760 ?auto_174761 ) ) ( not ( = ?auto_174755 ?auto_174763 ) ) ( not ( = ?auto_174756 ?auto_174763 ) ) ( not ( = ?auto_174757 ?auto_174763 ) ) ( not ( = ?auto_174758 ?auto_174763 ) ) ( not ( = ?auto_174759 ?auto_174763 ) ) ( not ( = ?auto_174760 ?auto_174763 ) ) ( not ( = ?auto_174761 ?auto_174763 ) ) ( ON-TABLE ?auto_174763 ) ( ON ?auto_174755 ?auto_174762 ) ( not ( = ?auto_174755 ?auto_174762 ) ) ( not ( = ?auto_174756 ?auto_174762 ) ) ( not ( = ?auto_174757 ?auto_174762 ) ) ( not ( = ?auto_174758 ?auto_174762 ) ) ( not ( = ?auto_174759 ?auto_174762 ) ) ( not ( = ?auto_174760 ?auto_174762 ) ) ( not ( = ?auto_174761 ?auto_174762 ) ) ( not ( = ?auto_174763 ?auto_174762 ) ) ( ON ?auto_174756 ?auto_174755 ) ( ON-TABLE ?auto_174762 ) ( ON ?auto_174757 ?auto_174756 ) ( ON ?auto_174758 ?auto_174757 ) ( ON ?auto_174759 ?auto_174758 ) ( ON ?auto_174760 ?auto_174759 ) ( CLEAR ?auto_174760 ) ( HOLDING ?auto_174761 ) ( CLEAR ?auto_174763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174763 ?auto_174761 )
      ( MAKE-7PILE ?auto_174755 ?auto_174756 ?auto_174757 ?auto_174758 ?auto_174759 ?auto_174760 ?auto_174761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174764 - BLOCK
      ?auto_174765 - BLOCK
      ?auto_174766 - BLOCK
      ?auto_174767 - BLOCK
      ?auto_174768 - BLOCK
      ?auto_174769 - BLOCK
      ?auto_174770 - BLOCK
    )
    :vars
    (
      ?auto_174772 - BLOCK
      ?auto_174771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174764 ?auto_174765 ) ) ( not ( = ?auto_174764 ?auto_174766 ) ) ( not ( = ?auto_174764 ?auto_174767 ) ) ( not ( = ?auto_174764 ?auto_174768 ) ) ( not ( = ?auto_174764 ?auto_174769 ) ) ( not ( = ?auto_174764 ?auto_174770 ) ) ( not ( = ?auto_174765 ?auto_174766 ) ) ( not ( = ?auto_174765 ?auto_174767 ) ) ( not ( = ?auto_174765 ?auto_174768 ) ) ( not ( = ?auto_174765 ?auto_174769 ) ) ( not ( = ?auto_174765 ?auto_174770 ) ) ( not ( = ?auto_174766 ?auto_174767 ) ) ( not ( = ?auto_174766 ?auto_174768 ) ) ( not ( = ?auto_174766 ?auto_174769 ) ) ( not ( = ?auto_174766 ?auto_174770 ) ) ( not ( = ?auto_174767 ?auto_174768 ) ) ( not ( = ?auto_174767 ?auto_174769 ) ) ( not ( = ?auto_174767 ?auto_174770 ) ) ( not ( = ?auto_174768 ?auto_174769 ) ) ( not ( = ?auto_174768 ?auto_174770 ) ) ( not ( = ?auto_174769 ?auto_174770 ) ) ( not ( = ?auto_174764 ?auto_174772 ) ) ( not ( = ?auto_174765 ?auto_174772 ) ) ( not ( = ?auto_174766 ?auto_174772 ) ) ( not ( = ?auto_174767 ?auto_174772 ) ) ( not ( = ?auto_174768 ?auto_174772 ) ) ( not ( = ?auto_174769 ?auto_174772 ) ) ( not ( = ?auto_174770 ?auto_174772 ) ) ( ON-TABLE ?auto_174772 ) ( ON ?auto_174764 ?auto_174771 ) ( not ( = ?auto_174764 ?auto_174771 ) ) ( not ( = ?auto_174765 ?auto_174771 ) ) ( not ( = ?auto_174766 ?auto_174771 ) ) ( not ( = ?auto_174767 ?auto_174771 ) ) ( not ( = ?auto_174768 ?auto_174771 ) ) ( not ( = ?auto_174769 ?auto_174771 ) ) ( not ( = ?auto_174770 ?auto_174771 ) ) ( not ( = ?auto_174772 ?auto_174771 ) ) ( ON ?auto_174765 ?auto_174764 ) ( ON-TABLE ?auto_174771 ) ( ON ?auto_174766 ?auto_174765 ) ( ON ?auto_174767 ?auto_174766 ) ( ON ?auto_174768 ?auto_174767 ) ( ON ?auto_174769 ?auto_174768 ) ( CLEAR ?auto_174772 ) ( ON ?auto_174770 ?auto_174769 ) ( CLEAR ?auto_174770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174771 ?auto_174764 ?auto_174765 ?auto_174766 ?auto_174767 ?auto_174768 ?auto_174769 )
      ( MAKE-7PILE ?auto_174764 ?auto_174765 ?auto_174766 ?auto_174767 ?auto_174768 ?auto_174769 ?auto_174770 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174773 - BLOCK
      ?auto_174774 - BLOCK
      ?auto_174775 - BLOCK
      ?auto_174776 - BLOCK
      ?auto_174777 - BLOCK
      ?auto_174778 - BLOCK
      ?auto_174779 - BLOCK
    )
    :vars
    (
      ?auto_174781 - BLOCK
      ?auto_174780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174773 ?auto_174774 ) ) ( not ( = ?auto_174773 ?auto_174775 ) ) ( not ( = ?auto_174773 ?auto_174776 ) ) ( not ( = ?auto_174773 ?auto_174777 ) ) ( not ( = ?auto_174773 ?auto_174778 ) ) ( not ( = ?auto_174773 ?auto_174779 ) ) ( not ( = ?auto_174774 ?auto_174775 ) ) ( not ( = ?auto_174774 ?auto_174776 ) ) ( not ( = ?auto_174774 ?auto_174777 ) ) ( not ( = ?auto_174774 ?auto_174778 ) ) ( not ( = ?auto_174774 ?auto_174779 ) ) ( not ( = ?auto_174775 ?auto_174776 ) ) ( not ( = ?auto_174775 ?auto_174777 ) ) ( not ( = ?auto_174775 ?auto_174778 ) ) ( not ( = ?auto_174775 ?auto_174779 ) ) ( not ( = ?auto_174776 ?auto_174777 ) ) ( not ( = ?auto_174776 ?auto_174778 ) ) ( not ( = ?auto_174776 ?auto_174779 ) ) ( not ( = ?auto_174777 ?auto_174778 ) ) ( not ( = ?auto_174777 ?auto_174779 ) ) ( not ( = ?auto_174778 ?auto_174779 ) ) ( not ( = ?auto_174773 ?auto_174781 ) ) ( not ( = ?auto_174774 ?auto_174781 ) ) ( not ( = ?auto_174775 ?auto_174781 ) ) ( not ( = ?auto_174776 ?auto_174781 ) ) ( not ( = ?auto_174777 ?auto_174781 ) ) ( not ( = ?auto_174778 ?auto_174781 ) ) ( not ( = ?auto_174779 ?auto_174781 ) ) ( ON ?auto_174773 ?auto_174780 ) ( not ( = ?auto_174773 ?auto_174780 ) ) ( not ( = ?auto_174774 ?auto_174780 ) ) ( not ( = ?auto_174775 ?auto_174780 ) ) ( not ( = ?auto_174776 ?auto_174780 ) ) ( not ( = ?auto_174777 ?auto_174780 ) ) ( not ( = ?auto_174778 ?auto_174780 ) ) ( not ( = ?auto_174779 ?auto_174780 ) ) ( not ( = ?auto_174781 ?auto_174780 ) ) ( ON ?auto_174774 ?auto_174773 ) ( ON-TABLE ?auto_174780 ) ( ON ?auto_174775 ?auto_174774 ) ( ON ?auto_174776 ?auto_174775 ) ( ON ?auto_174777 ?auto_174776 ) ( ON ?auto_174778 ?auto_174777 ) ( ON ?auto_174779 ?auto_174778 ) ( CLEAR ?auto_174779 ) ( HOLDING ?auto_174781 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174781 )
      ( MAKE-7PILE ?auto_174773 ?auto_174774 ?auto_174775 ?auto_174776 ?auto_174777 ?auto_174778 ?auto_174779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_174782 - BLOCK
      ?auto_174783 - BLOCK
      ?auto_174784 - BLOCK
      ?auto_174785 - BLOCK
      ?auto_174786 - BLOCK
      ?auto_174787 - BLOCK
      ?auto_174788 - BLOCK
    )
    :vars
    (
      ?auto_174790 - BLOCK
      ?auto_174789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174782 ?auto_174783 ) ) ( not ( = ?auto_174782 ?auto_174784 ) ) ( not ( = ?auto_174782 ?auto_174785 ) ) ( not ( = ?auto_174782 ?auto_174786 ) ) ( not ( = ?auto_174782 ?auto_174787 ) ) ( not ( = ?auto_174782 ?auto_174788 ) ) ( not ( = ?auto_174783 ?auto_174784 ) ) ( not ( = ?auto_174783 ?auto_174785 ) ) ( not ( = ?auto_174783 ?auto_174786 ) ) ( not ( = ?auto_174783 ?auto_174787 ) ) ( not ( = ?auto_174783 ?auto_174788 ) ) ( not ( = ?auto_174784 ?auto_174785 ) ) ( not ( = ?auto_174784 ?auto_174786 ) ) ( not ( = ?auto_174784 ?auto_174787 ) ) ( not ( = ?auto_174784 ?auto_174788 ) ) ( not ( = ?auto_174785 ?auto_174786 ) ) ( not ( = ?auto_174785 ?auto_174787 ) ) ( not ( = ?auto_174785 ?auto_174788 ) ) ( not ( = ?auto_174786 ?auto_174787 ) ) ( not ( = ?auto_174786 ?auto_174788 ) ) ( not ( = ?auto_174787 ?auto_174788 ) ) ( not ( = ?auto_174782 ?auto_174790 ) ) ( not ( = ?auto_174783 ?auto_174790 ) ) ( not ( = ?auto_174784 ?auto_174790 ) ) ( not ( = ?auto_174785 ?auto_174790 ) ) ( not ( = ?auto_174786 ?auto_174790 ) ) ( not ( = ?auto_174787 ?auto_174790 ) ) ( not ( = ?auto_174788 ?auto_174790 ) ) ( ON ?auto_174782 ?auto_174789 ) ( not ( = ?auto_174782 ?auto_174789 ) ) ( not ( = ?auto_174783 ?auto_174789 ) ) ( not ( = ?auto_174784 ?auto_174789 ) ) ( not ( = ?auto_174785 ?auto_174789 ) ) ( not ( = ?auto_174786 ?auto_174789 ) ) ( not ( = ?auto_174787 ?auto_174789 ) ) ( not ( = ?auto_174788 ?auto_174789 ) ) ( not ( = ?auto_174790 ?auto_174789 ) ) ( ON ?auto_174783 ?auto_174782 ) ( ON-TABLE ?auto_174789 ) ( ON ?auto_174784 ?auto_174783 ) ( ON ?auto_174785 ?auto_174784 ) ( ON ?auto_174786 ?auto_174785 ) ( ON ?auto_174787 ?auto_174786 ) ( ON ?auto_174788 ?auto_174787 ) ( ON ?auto_174790 ?auto_174788 ) ( CLEAR ?auto_174790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174789 ?auto_174782 ?auto_174783 ?auto_174784 ?auto_174785 ?auto_174786 ?auto_174787 ?auto_174788 )
      ( MAKE-7PILE ?auto_174782 ?auto_174783 ?auto_174784 ?auto_174785 ?auto_174786 ?auto_174787 ?auto_174788 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174799 - BLOCK
      ?auto_174800 - BLOCK
      ?auto_174801 - BLOCK
      ?auto_174802 - BLOCK
      ?auto_174803 - BLOCK
      ?auto_174804 - BLOCK
      ?auto_174805 - BLOCK
      ?auto_174806 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_174806 ) ( CLEAR ?auto_174805 ) ( ON-TABLE ?auto_174799 ) ( ON ?auto_174800 ?auto_174799 ) ( ON ?auto_174801 ?auto_174800 ) ( ON ?auto_174802 ?auto_174801 ) ( ON ?auto_174803 ?auto_174802 ) ( ON ?auto_174804 ?auto_174803 ) ( ON ?auto_174805 ?auto_174804 ) ( not ( = ?auto_174799 ?auto_174800 ) ) ( not ( = ?auto_174799 ?auto_174801 ) ) ( not ( = ?auto_174799 ?auto_174802 ) ) ( not ( = ?auto_174799 ?auto_174803 ) ) ( not ( = ?auto_174799 ?auto_174804 ) ) ( not ( = ?auto_174799 ?auto_174805 ) ) ( not ( = ?auto_174799 ?auto_174806 ) ) ( not ( = ?auto_174800 ?auto_174801 ) ) ( not ( = ?auto_174800 ?auto_174802 ) ) ( not ( = ?auto_174800 ?auto_174803 ) ) ( not ( = ?auto_174800 ?auto_174804 ) ) ( not ( = ?auto_174800 ?auto_174805 ) ) ( not ( = ?auto_174800 ?auto_174806 ) ) ( not ( = ?auto_174801 ?auto_174802 ) ) ( not ( = ?auto_174801 ?auto_174803 ) ) ( not ( = ?auto_174801 ?auto_174804 ) ) ( not ( = ?auto_174801 ?auto_174805 ) ) ( not ( = ?auto_174801 ?auto_174806 ) ) ( not ( = ?auto_174802 ?auto_174803 ) ) ( not ( = ?auto_174802 ?auto_174804 ) ) ( not ( = ?auto_174802 ?auto_174805 ) ) ( not ( = ?auto_174802 ?auto_174806 ) ) ( not ( = ?auto_174803 ?auto_174804 ) ) ( not ( = ?auto_174803 ?auto_174805 ) ) ( not ( = ?auto_174803 ?auto_174806 ) ) ( not ( = ?auto_174804 ?auto_174805 ) ) ( not ( = ?auto_174804 ?auto_174806 ) ) ( not ( = ?auto_174805 ?auto_174806 ) ) )
    :subtasks
    ( ( !STACK ?auto_174806 ?auto_174805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174807 - BLOCK
      ?auto_174808 - BLOCK
      ?auto_174809 - BLOCK
      ?auto_174810 - BLOCK
      ?auto_174811 - BLOCK
      ?auto_174812 - BLOCK
      ?auto_174813 - BLOCK
      ?auto_174814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_174813 ) ( ON-TABLE ?auto_174807 ) ( ON ?auto_174808 ?auto_174807 ) ( ON ?auto_174809 ?auto_174808 ) ( ON ?auto_174810 ?auto_174809 ) ( ON ?auto_174811 ?auto_174810 ) ( ON ?auto_174812 ?auto_174811 ) ( ON ?auto_174813 ?auto_174812 ) ( not ( = ?auto_174807 ?auto_174808 ) ) ( not ( = ?auto_174807 ?auto_174809 ) ) ( not ( = ?auto_174807 ?auto_174810 ) ) ( not ( = ?auto_174807 ?auto_174811 ) ) ( not ( = ?auto_174807 ?auto_174812 ) ) ( not ( = ?auto_174807 ?auto_174813 ) ) ( not ( = ?auto_174807 ?auto_174814 ) ) ( not ( = ?auto_174808 ?auto_174809 ) ) ( not ( = ?auto_174808 ?auto_174810 ) ) ( not ( = ?auto_174808 ?auto_174811 ) ) ( not ( = ?auto_174808 ?auto_174812 ) ) ( not ( = ?auto_174808 ?auto_174813 ) ) ( not ( = ?auto_174808 ?auto_174814 ) ) ( not ( = ?auto_174809 ?auto_174810 ) ) ( not ( = ?auto_174809 ?auto_174811 ) ) ( not ( = ?auto_174809 ?auto_174812 ) ) ( not ( = ?auto_174809 ?auto_174813 ) ) ( not ( = ?auto_174809 ?auto_174814 ) ) ( not ( = ?auto_174810 ?auto_174811 ) ) ( not ( = ?auto_174810 ?auto_174812 ) ) ( not ( = ?auto_174810 ?auto_174813 ) ) ( not ( = ?auto_174810 ?auto_174814 ) ) ( not ( = ?auto_174811 ?auto_174812 ) ) ( not ( = ?auto_174811 ?auto_174813 ) ) ( not ( = ?auto_174811 ?auto_174814 ) ) ( not ( = ?auto_174812 ?auto_174813 ) ) ( not ( = ?auto_174812 ?auto_174814 ) ) ( not ( = ?auto_174813 ?auto_174814 ) ) ( ON-TABLE ?auto_174814 ) ( CLEAR ?auto_174814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_174814 )
      ( MAKE-8PILE ?auto_174807 ?auto_174808 ?auto_174809 ?auto_174810 ?auto_174811 ?auto_174812 ?auto_174813 ?auto_174814 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174815 - BLOCK
      ?auto_174816 - BLOCK
      ?auto_174817 - BLOCK
      ?auto_174818 - BLOCK
      ?auto_174819 - BLOCK
      ?auto_174820 - BLOCK
      ?auto_174821 - BLOCK
      ?auto_174822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174815 ) ( ON ?auto_174816 ?auto_174815 ) ( ON ?auto_174817 ?auto_174816 ) ( ON ?auto_174818 ?auto_174817 ) ( ON ?auto_174819 ?auto_174818 ) ( ON ?auto_174820 ?auto_174819 ) ( not ( = ?auto_174815 ?auto_174816 ) ) ( not ( = ?auto_174815 ?auto_174817 ) ) ( not ( = ?auto_174815 ?auto_174818 ) ) ( not ( = ?auto_174815 ?auto_174819 ) ) ( not ( = ?auto_174815 ?auto_174820 ) ) ( not ( = ?auto_174815 ?auto_174821 ) ) ( not ( = ?auto_174815 ?auto_174822 ) ) ( not ( = ?auto_174816 ?auto_174817 ) ) ( not ( = ?auto_174816 ?auto_174818 ) ) ( not ( = ?auto_174816 ?auto_174819 ) ) ( not ( = ?auto_174816 ?auto_174820 ) ) ( not ( = ?auto_174816 ?auto_174821 ) ) ( not ( = ?auto_174816 ?auto_174822 ) ) ( not ( = ?auto_174817 ?auto_174818 ) ) ( not ( = ?auto_174817 ?auto_174819 ) ) ( not ( = ?auto_174817 ?auto_174820 ) ) ( not ( = ?auto_174817 ?auto_174821 ) ) ( not ( = ?auto_174817 ?auto_174822 ) ) ( not ( = ?auto_174818 ?auto_174819 ) ) ( not ( = ?auto_174818 ?auto_174820 ) ) ( not ( = ?auto_174818 ?auto_174821 ) ) ( not ( = ?auto_174818 ?auto_174822 ) ) ( not ( = ?auto_174819 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174821 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) ( not ( = ?auto_174820 ?auto_174821 ) ) ( not ( = ?auto_174820 ?auto_174822 ) ) ( not ( = ?auto_174821 ?auto_174822 ) ) ( ON-TABLE ?auto_174822 ) ( CLEAR ?auto_174822 ) ( HOLDING ?auto_174821 ) ( CLEAR ?auto_174820 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174815 ?auto_174816 ?auto_174817 ?auto_174818 ?auto_174819 ?auto_174820 ?auto_174821 )
      ( MAKE-8PILE ?auto_174815 ?auto_174816 ?auto_174817 ?auto_174818 ?auto_174819 ?auto_174820 ?auto_174821 ?auto_174822 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174823 - BLOCK
      ?auto_174824 - BLOCK
      ?auto_174825 - BLOCK
      ?auto_174826 - BLOCK
      ?auto_174827 - BLOCK
      ?auto_174828 - BLOCK
      ?auto_174829 - BLOCK
      ?auto_174830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174823 ) ( ON ?auto_174824 ?auto_174823 ) ( ON ?auto_174825 ?auto_174824 ) ( ON ?auto_174826 ?auto_174825 ) ( ON ?auto_174827 ?auto_174826 ) ( ON ?auto_174828 ?auto_174827 ) ( not ( = ?auto_174823 ?auto_174824 ) ) ( not ( = ?auto_174823 ?auto_174825 ) ) ( not ( = ?auto_174823 ?auto_174826 ) ) ( not ( = ?auto_174823 ?auto_174827 ) ) ( not ( = ?auto_174823 ?auto_174828 ) ) ( not ( = ?auto_174823 ?auto_174829 ) ) ( not ( = ?auto_174823 ?auto_174830 ) ) ( not ( = ?auto_174824 ?auto_174825 ) ) ( not ( = ?auto_174824 ?auto_174826 ) ) ( not ( = ?auto_174824 ?auto_174827 ) ) ( not ( = ?auto_174824 ?auto_174828 ) ) ( not ( = ?auto_174824 ?auto_174829 ) ) ( not ( = ?auto_174824 ?auto_174830 ) ) ( not ( = ?auto_174825 ?auto_174826 ) ) ( not ( = ?auto_174825 ?auto_174827 ) ) ( not ( = ?auto_174825 ?auto_174828 ) ) ( not ( = ?auto_174825 ?auto_174829 ) ) ( not ( = ?auto_174825 ?auto_174830 ) ) ( not ( = ?auto_174826 ?auto_174827 ) ) ( not ( = ?auto_174826 ?auto_174828 ) ) ( not ( = ?auto_174826 ?auto_174829 ) ) ( not ( = ?auto_174826 ?auto_174830 ) ) ( not ( = ?auto_174827 ?auto_174828 ) ) ( not ( = ?auto_174827 ?auto_174829 ) ) ( not ( = ?auto_174827 ?auto_174830 ) ) ( not ( = ?auto_174828 ?auto_174829 ) ) ( not ( = ?auto_174828 ?auto_174830 ) ) ( not ( = ?auto_174829 ?auto_174830 ) ) ( ON-TABLE ?auto_174830 ) ( CLEAR ?auto_174828 ) ( ON ?auto_174829 ?auto_174830 ) ( CLEAR ?auto_174829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174830 )
      ( MAKE-8PILE ?auto_174823 ?auto_174824 ?auto_174825 ?auto_174826 ?auto_174827 ?auto_174828 ?auto_174829 ?auto_174830 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174831 - BLOCK
      ?auto_174832 - BLOCK
      ?auto_174833 - BLOCK
      ?auto_174834 - BLOCK
      ?auto_174835 - BLOCK
      ?auto_174836 - BLOCK
      ?auto_174837 - BLOCK
      ?auto_174838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174831 ) ( ON ?auto_174832 ?auto_174831 ) ( ON ?auto_174833 ?auto_174832 ) ( ON ?auto_174834 ?auto_174833 ) ( ON ?auto_174835 ?auto_174834 ) ( not ( = ?auto_174831 ?auto_174832 ) ) ( not ( = ?auto_174831 ?auto_174833 ) ) ( not ( = ?auto_174831 ?auto_174834 ) ) ( not ( = ?auto_174831 ?auto_174835 ) ) ( not ( = ?auto_174831 ?auto_174836 ) ) ( not ( = ?auto_174831 ?auto_174837 ) ) ( not ( = ?auto_174831 ?auto_174838 ) ) ( not ( = ?auto_174832 ?auto_174833 ) ) ( not ( = ?auto_174832 ?auto_174834 ) ) ( not ( = ?auto_174832 ?auto_174835 ) ) ( not ( = ?auto_174832 ?auto_174836 ) ) ( not ( = ?auto_174832 ?auto_174837 ) ) ( not ( = ?auto_174832 ?auto_174838 ) ) ( not ( = ?auto_174833 ?auto_174834 ) ) ( not ( = ?auto_174833 ?auto_174835 ) ) ( not ( = ?auto_174833 ?auto_174836 ) ) ( not ( = ?auto_174833 ?auto_174837 ) ) ( not ( = ?auto_174833 ?auto_174838 ) ) ( not ( = ?auto_174834 ?auto_174835 ) ) ( not ( = ?auto_174834 ?auto_174836 ) ) ( not ( = ?auto_174834 ?auto_174837 ) ) ( not ( = ?auto_174834 ?auto_174838 ) ) ( not ( = ?auto_174835 ?auto_174836 ) ) ( not ( = ?auto_174835 ?auto_174837 ) ) ( not ( = ?auto_174835 ?auto_174838 ) ) ( not ( = ?auto_174836 ?auto_174837 ) ) ( not ( = ?auto_174836 ?auto_174838 ) ) ( not ( = ?auto_174837 ?auto_174838 ) ) ( ON-TABLE ?auto_174838 ) ( ON ?auto_174837 ?auto_174838 ) ( CLEAR ?auto_174837 ) ( HOLDING ?auto_174836 ) ( CLEAR ?auto_174835 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174831 ?auto_174832 ?auto_174833 ?auto_174834 ?auto_174835 ?auto_174836 )
      ( MAKE-8PILE ?auto_174831 ?auto_174832 ?auto_174833 ?auto_174834 ?auto_174835 ?auto_174836 ?auto_174837 ?auto_174838 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174839 - BLOCK
      ?auto_174840 - BLOCK
      ?auto_174841 - BLOCK
      ?auto_174842 - BLOCK
      ?auto_174843 - BLOCK
      ?auto_174844 - BLOCK
      ?auto_174845 - BLOCK
      ?auto_174846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174839 ) ( ON ?auto_174840 ?auto_174839 ) ( ON ?auto_174841 ?auto_174840 ) ( ON ?auto_174842 ?auto_174841 ) ( ON ?auto_174843 ?auto_174842 ) ( not ( = ?auto_174839 ?auto_174840 ) ) ( not ( = ?auto_174839 ?auto_174841 ) ) ( not ( = ?auto_174839 ?auto_174842 ) ) ( not ( = ?auto_174839 ?auto_174843 ) ) ( not ( = ?auto_174839 ?auto_174844 ) ) ( not ( = ?auto_174839 ?auto_174845 ) ) ( not ( = ?auto_174839 ?auto_174846 ) ) ( not ( = ?auto_174840 ?auto_174841 ) ) ( not ( = ?auto_174840 ?auto_174842 ) ) ( not ( = ?auto_174840 ?auto_174843 ) ) ( not ( = ?auto_174840 ?auto_174844 ) ) ( not ( = ?auto_174840 ?auto_174845 ) ) ( not ( = ?auto_174840 ?auto_174846 ) ) ( not ( = ?auto_174841 ?auto_174842 ) ) ( not ( = ?auto_174841 ?auto_174843 ) ) ( not ( = ?auto_174841 ?auto_174844 ) ) ( not ( = ?auto_174841 ?auto_174845 ) ) ( not ( = ?auto_174841 ?auto_174846 ) ) ( not ( = ?auto_174842 ?auto_174843 ) ) ( not ( = ?auto_174842 ?auto_174844 ) ) ( not ( = ?auto_174842 ?auto_174845 ) ) ( not ( = ?auto_174842 ?auto_174846 ) ) ( not ( = ?auto_174843 ?auto_174844 ) ) ( not ( = ?auto_174843 ?auto_174845 ) ) ( not ( = ?auto_174843 ?auto_174846 ) ) ( not ( = ?auto_174844 ?auto_174845 ) ) ( not ( = ?auto_174844 ?auto_174846 ) ) ( not ( = ?auto_174845 ?auto_174846 ) ) ( ON-TABLE ?auto_174846 ) ( ON ?auto_174845 ?auto_174846 ) ( CLEAR ?auto_174843 ) ( ON ?auto_174844 ?auto_174845 ) ( CLEAR ?auto_174844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174846 ?auto_174845 )
      ( MAKE-8PILE ?auto_174839 ?auto_174840 ?auto_174841 ?auto_174842 ?auto_174843 ?auto_174844 ?auto_174845 ?auto_174846 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174847 - BLOCK
      ?auto_174848 - BLOCK
      ?auto_174849 - BLOCK
      ?auto_174850 - BLOCK
      ?auto_174851 - BLOCK
      ?auto_174852 - BLOCK
      ?auto_174853 - BLOCK
      ?auto_174854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174847 ) ( ON ?auto_174848 ?auto_174847 ) ( ON ?auto_174849 ?auto_174848 ) ( ON ?auto_174850 ?auto_174849 ) ( not ( = ?auto_174847 ?auto_174848 ) ) ( not ( = ?auto_174847 ?auto_174849 ) ) ( not ( = ?auto_174847 ?auto_174850 ) ) ( not ( = ?auto_174847 ?auto_174851 ) ) ( not ( = ?auto_174847 ?auto_174852 ) ) ( not ( = ?auto_174847 ?auto_174853 ) ) ( not ( = ?auto_174847 ?auto_174854 ) ) ( not ( = ?auto_174848 ?auto_174849 ) ) ( not ( = ?auto_174848 ?auto_174850 ) ) ( not ( = ?auto_174848 ?auto_174851 ) ) ( not ( = ?auto_174848 ?auto_174852 ) ) ( not ( = ?auto_174848 ?auto_174853 ) ) ( not ( = ?auto_174848 ?auto_174854 ) ) ( not ( = ?auto_174849 ?auto_174850 ) ) ( not ( = ?auto_174849 ?auto_174851 ) ) ( not ( = ?auto_174849 ?auto_174852 ) ) ( not ( = ?auto_174849 ?auto_174853 ) ) ( not ( = ?auto_174849 ?auto_174854 ) ) ( not ( = ?auto_174850 ?auto_174851 ) ) ( not ( = ?auto_174850 ?auto_174852 ) ) ( not ( = ?auto_174850 ?auto_174853 ) ) ( not ( = ?auto_174850 ?auto_174854 ) ) ( not ( = ?auto_174851 ?auto_174852 ) ) ( not ( = ?auto_174851 ?auto_174853 ) ) ( not ( = ?auto_174851 ?auto_174854 ) ) ( not ( = ?auto_174852 ?auto_174853 ) ) ( not ( = ?auto_174852 ?auto_174854 ) ) ( not ( = ?auto_174853 ?auto_174854 ) ) ( ON-TABLE ?auto_174854 ) ( ON ?auto_174853 ?auto_174854 ) ( ON ?auto_174852 ?auto_174853 ) ( CLEAR ?auto_174852 ) ( HOLDING ?auto_174851 ) ( CLEAR ?auto_174850 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174847 ?auto_174848 ?auto_174849 ?auto_174850 ?auto_174851 )
      ( MAKE-8PILE ?auto_174847 ?auto_174848 ?auto_174849 ?auto_174850 ?auto_174851 ?auto_174852 ?auto_174853 ?auto_174854 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174855 - BLOCK
      ?auto_174856 - BLOCK
      ?auto_174857 - BLOCK
      ?auto_174858 - BLOCK
      ?auto_174859 - BLOCK
      ?auto_174860 - BLOCK
      ?auto_174861 - BLOCK
      ?auto_174862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174855 ) ( ON ?auto_174856 ?auto_174855 ) ( ON ?auto_174857 ?auto_174856 ) ( ON ?auto_174858 ?auto_174857 ) ( not ( = ?auto_174855 ?auto_174856 ) ) ( not ( = ?auto_174855 ?auto_174857 ) ) ( not ( = ?auto_174855 ?auto_174858 ) ) ( not ( = ?auto_174855 ?auto_174859 ) ) ( not ( = ?auto_174855 ?auto_174860 ) ) ( not ( = ?auto_174855 ?auto_174861 ) ) ( not ( = ?auto_174855 ?auto_174862 ) ) ( not ( = ?auto_174856 ?auto_174857 ) ) ( not ( = ?auto_174856 ?auto_174858 ) ) ( not ( = ?auto_174856 ?auto_174859 ) ) ( not ( = ?auto_174856 ?auto_174860 ) ) ( not ( = ?auto_174856 ?auto_174861 ) ) ( not ( = ?auto_174856 ?auto_174862 ) ) ( not ( = ?auto_174857 ?auto_174858 ) ) ( not ( = ?auto_174857 ?auto_174859 ) ) ( not ( = ?auto_174857 ?auto_174860 ) ) ( not ( = ?auto_174857 ?auto_174861 ) ) ( not ( = ?auto_174857 ?auto_174862 ) ) ( not ( = ?auto_174858 ?auto_174859 ) ) ( not ( = ?auto_174858 ?auto_174860 ) ) ( not ( = ?auto_174858 ?auto_174861 ) ) ( not ( = ?auto_174858 ?auto_174862 ) ) ( not ( = ?auto_174859 ?auto_174860 ) ) ( not ( = ?auto_174859 ?auto_174861 ) ) ( not ( = ?auto_174859 ?auto_174862 ) ) ( not ( = ?auto_174860 ?auto_174861 ) ) ( not ( = ?auto_174860 ?auto_174862 ) ) ( not ( = ?auto_174861 ?auto_174862 ) ) ( ON-TABLE ?auto_174862 ) ( ON ?auto_174861 ?auto_174862 ) ( ON ?auto_174860 ?auto_174861 ) ( CLEAR ?auto_174858 ) ( ON ?auto_174859 ?auto_174860 ) ( CLEAR ?auto_174859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174862 ?auto_174861 ?auto_174860 )
      ( MAKE-8PILE ?auto_174855 ?auto_174856 ?auto_174857 ?auto_174858 ?auto_174859 ?auto_174860 ?auto_174861 ?auto_174862 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174863 - BLOCK
      ?auto_174864 - BLOCK
      ?auto_174865 - BLOCK
      ?auto_174866 - BLOCK
      ?auto_174867 - BLOCK
      ?auto_174868 - BLOCK
      ?auto_174869 - BLOCK
      ?auto_174870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174863 ) ( ON ?auto_174864 ?auto_174863 ) ( ON ?auto_174865 ?auto_174864 ) ( not ( = ?auto_174863 ?auto_174864 ) ) ( not ( = ?auto_174863 ?auto_174865 ) ) ( not ( = ?auto_174863 ?auto_174866 ) ) ( not ( = ?auto_174863 ?auto_174867 ) ) ( not ( = ?auto_174863 ?auto_174868 ) ) ( not ( = ?auto_174863 ?auto_174869 ) ) ( not ( = ?auto_174863 ?auto_174870 ) ) ( not ( = ?auto_174864 ?auto_174865 ) ) ( not ( = ?auto_174864 ?auto_174866 ) ) ( not ( = ?auto_174864 ?auto_174867 ) ) ( not ( = ?auto_174864 ?auto_174868 ) ) ( not ( = ?auto_174864 ?auto_174869 ) ) ( not ( = ?auto_174864 ?auto_174870 ) ) ( not ( = ?auto_174865 ?auto_174866 ) ) ( not ( = ?auto_174865 ?auto_174867 ) ) ( not ( = ?auto_174865 ?auto_174868 ) ) ( not ( = ?auto_174865 ?auto_174869 ) ) ( not ( = ?auto_174865 ?auto_174870 ) ) ( not ( = ?auto_174866 ?auto_174867 ) ) ( not ( = ?auto_174866 ?auto_174868 ) ) ( not ( = ?auto_174866 ?auto_174869 ) ) ( not ( = ?auto_174866 ?auto_174870 ) ) ( not ( = ?auto_174867 ?auto_174868 ) ) ( not ( = ?auto_174867 ?auto_174869 ) ) ( not ( = ?auto_174867 ?auto_174870 ) ) ( not ( = ?auto_174868 ?auto_174869 ) ) ( not ( = ?auto_174868 ?auto_174870 ) ) ( not ( = ?auto_174869 ?auto_174870 ) ) ( ON-TABLE ?auto_174870 ) ( ON ?auto_174869 ?auto_174870 ) ( ON ?auto_174868 ?auto_174869 ) ( ON ?auto_174867 ?auto_174868 ) ( CLEAR ?auto_174867 ) ( HOLDING ?auto_174866 ) ( CLEAR ?auto_174865 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174863 ?auto_174864 ?auto_174865 ?auto_174866 )
      ( MAKE-8PILE ?auto_174863 ?auto_174864 ?auto_174865 ?auto_174866 ?auto_174867 ?auto_174868 ?auto_174869 ?auto_174870 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174871 - BLOCK
      ?auto_174872 - BLOCK
      ?auto_174873 - BLOCK
      ?auto_174874 - BLOCK
      ?auto_174875 - BLOCK
      ?auto_174876 - BLOCK
      ?auto_174877 - BLOCK
      ?auto_174878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174871 ) ( ON ?auto_174872 ?auto_174871 ) ( ON ?auto_174873 ?auto_174872 ) ( not ( = ?auto_174871 ?auto_174872 ) ) ( not ( = ?auto_174871 ?auto_174873 ) ) ( not ( = ?auto_174871 ?auto_174874 ) ) ( not ( = ?auto_174871 ?auto_174875 ) ) ( not ( = ?auto_174871 ?auto_174876 ) ) ( not ( = ?auto_174871 ?auto_174877 ) ) ( not ( = ?auto_174871 ?auto_174878 ) ) ( not ( = ?auto_174872 ?auto_174873 ) ) ( not ( = ?auto_174872 ?auto_174874 ) ) ( not ( = ?auto_174872 ?auto_174875 ) ) ( not ( = ?auto_174872 ?auto_174876 ) ) ( not ( = ?auto_174872 ?auto_174877 ) ) ( not ( = ?auto_174872 ?auto_174878 ) ) ( not ( = ?auto_174873 ?auto_174874 ) ) ( not ( = ?auto_174873 ?auto_174875 ) ) ( not ( = ?auto_174873 ?auto_174876 ) ) ( not ( = ?auto_174873 ?auto_174877 ) ) ( not ( = ?auto_174873 ?auto_174878 ) ) ( not ( = ?auto_174874 ?auto_174875 ) ) ( not ( = ?auto_174874 ?auto_174876 ) ) ( not ( = ?auto_174874 ?auto_174877 ) ) ( not ( = ?auto_174874 ?auto_174878 ) ) ( not ( = ?auto_174875 ?auto_174876 ) ) ( not ( = ?auto_174875 ?auto_174877 ) ) ( not ( = ?auto_174875 ?auto_174878 ) ) ( not ( = ?auto_174876 ?auto_174877 ) ) ( not ( = ?auto_174876 ?auto_174878 ) ) ( not ( = ?auto_174877 ?auto_174878 ) ) ( ON-TABLE ?auto_174878 ) ( ON ?auto_174877 ?auto_174878 ) ( ON ?auto_174876 ?auto_174877 ) ( ON ?auto_174875 ?auto_174876 ) ( CLEAR ?auto_174873 ) ( ON ?auto_174874 ?auto_174875 ) ( CLEAR ?auto_174874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174878 ?auto_174877 ?auto_174876 ?auto_174875 )
      ( MAKE-8PILE ?auto_174871 ?auto_174872 ?auto_174873 ?auto_174874 ?auto_174875 ?auto_174876 ?auto_174877 ?auto_174878 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174879 - BLOCK
      ?auto_174880 - BLOCK
      ?auto_174881 - BLOCK
      ?auto_174882 - BLOCK
      ?auto_174883 - BLOCK
      ?auto_174884 - BLOCK
      ?auto_174885 - BLOCK
      ?auto_174886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174879 ) ( ON ?auto_174880 ?auto_174879 ) ( not ( = ?auto_174879 ?auto_174880 ) ) ( not ( = ?auto_174879 ?auto_174881 ) ) ( not ( = ?auto_174879 ?auto_174882 ) ) ( not ( = ?auto_174879 ?auto_174883 ) ) ( not ( = ?auto_174879 ?auto_174884 ) ) ( not ( = ?auto_174879 ?auto_174885 ) ) ( not ( = ?auto_174879 ?auto_174886 ) ) ( not ( = ?auto_174880 ?auto_174881 ) ) ( not ( = ?auto_174880 ?auto_174882 ) ) ( not ( = ?auto_174880 ?auto_174883 ) ) ( not ( = ?auto_174880 ?auto_174884 ) ) ( not ( = ?auto_174880 ?auto_174885 ) ) ( not ( = ?auto_174880 ?auto_174886 ) ) ( not ( = ?auto_174881 ?auto_174882 ) ) ( not ( = ?auto_174881 ?auto_174883 ) ) ( not ( = ?auto_174881 ?auto_174884 ) ) ( not ( = ?auto_174881 ?auto_174885 ) ) ( not ( = ?auto_174881 ?auto_174886 ) ) ( not ( = ?auto_174882 ?auto_174883 ) ) ( not ( = ?auto_174882 ?auto_174884 ) ) ( not ( = ?auto_174882 ?auto_174885 ) ) ( not ( = ?auto_174882 ?auto_174886 ) ) ( not ( = ?auto_174883 ?auto_174884 ) ) ( not ( = ?auto_174883 ?auto_174885 ) ) ( not ( = ?auto_174883 ?auto_174886 ) ) ( not ( = ?auto_174884 ?auto_174885 ) ) ( not ( = ?auto_174884 ?auto_174886 ) ) ( not ( = ?auto_174885 ?auto_174886 ) ) ( ON-TABLE ?auto_174886 ) ( ON ?auto_174885 ?auto_174886 ) ( ON ?auto_174884 ?auto_174885 ) ( ON ?auto_174883 ?auto_174884 ) ( ON ?auto_174882 ?auto_174883 ) ( CLEAR ?auto_174882 ) ( HOLDING ?auto_174881 ) ( CLEAR ?auto_174880 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174879 ?auto_174880 ?auto_174881 )
      ( MAKE-8PILE ?auto_174879 ?auto_174880 ?auto_174881 ?auto_174882 ?auto_174883 ?auto_174884 ?auto_174885 ?auto_174886 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174887 - BLOCK
      ?auto_174888 - BLOCK
      ?auto_174889 - BLOCK
      ?auto_174890 - BLOCK
      ?auto_174891 - BLOCK
      ?auto_174892 - BLOCK
      ?auto_174893 - BLOCK
      ?auto_174894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174887 ) ( ON ?auto_174888 ?auto_174887 ) ( not ( = ?auto_174887 ?auto_174888 ) ) ( not ( = ?auto_174887 ?auto_174889 ) ) ( not ( = ?auto_174887 ?auto_174890 ) ) ( not ( = ?auto_174887 ?auto_174891 ) ) ( not ( = ?auto_174887 ?auto_174892 ) ) ( not ( = ?auto_174887 ?auto_174893 ) ) ( not ( = ?auto_174887 ?auto_174894 ) ) ( not ( = ?auto_174888 ?auto_174889 ) ) ( not ( = ?auto_174888 ?auto_174890 ) ) ( not ( = ?auto_174888 ?auto_174891 ) ) ( not ( = ?auto_174888 ?auto_174892 ) ) ( not ( = ?auto_174888 ?auto_174893 ) ) ( not ( = ?auto_174888 ?auto_174894 ) ) ( not ( = ?auto_174889 ?auto_174890 ) ) ( not ( = ?auto_174889 ?auto_174891 ) ) ( not ( = ?auto_174889 ?auto_174892 ) ) ( not ( = ?auto_174889 ?auto_174893 ) ) ( not ( = ?auto_174889 ?auto_174894 ) ) ( not ( = ?auto_174890 ?auto_174891 ) ) ( not ( = ?auto_174890 ?auto_174892 ) ) ( not ( = ?auto_174890 ?auto_174893 ) ) ( not ( = ?auto_174890 ?auto_174894 ) ) ( not ( = ?auto_174891 ?auto_174892 ) ) ( not ( = ?auto_174891 ?auto_174893 ) ) ( not ( = ?auto_174891 ?auto_174894 ) ) ( not ( = ?auto_174892 ?auto_174893 ) ) ( not ( = ?auto_174892 ?auto_174894 ) ) ( not ( = ?auto_174893 ?auto_174894 ) ) ( ON-TABLE ?auto_174894 ) ( ON ?auto_174893 ?auto_174894 ) ( ON ?auto_174892 ?auto_174893 ) ( ON ?auto_174891 ?auto_174892 ) ( ON ?auto_174890 ?auto_174891 ) ( CLEAR ?auto_174888 ) ( ON ?auto_174889 ?auto_174890 ) ( CLEAR ?auto_174889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174894 ?auto_174893 ?auto_174892 ?auto_174891 ?auto_174890 )
      ( MAKE-8PILE ?auto_174887 ?auto_174888 ?auto_174889 ?auto_174890 ?auto_174891 ?auto_174892 ?auto_174893 ?auto_174894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174895 - BLOCK
      ?auto_174896 - BLOCK
      ?auto_174897 - BLOCK
      ?auto_174898 - BLOCK
      ?auto_174899 - BLOCK
      ?auto_174900 - BLOCK
      ?auto_174901 - BLOCK
      ?auto_174902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174895 ) ( not ( = ?auto_174895 ?auto_174896 ) ) ( not ( = ?auto_174895 ?auto_174897 ) ) ( not ( = ?auto_174895 ?auto_174898 ) ) ( not ( = ?auto_174895 ?auto_174899 ) ) ( not ( = ?auto_174895 ?auto_174900 ) ) ( not ( = ?auto_174895 ?auto_174901 ) ) ( not ( = ?auto_174895 ?auto_174902 ) ) ( not ( = ?auto_174896 ?auto_174897 ) ) ( not ( = ?auto_174896 ?auto_174898 ) ) ( not ( = ?auto_174896 ?auto_174899 ) ) ( not ( = ?auto_174896 ?auto_174900 ) ) ( not ( = ?auto_174896 ?auto_174901 ) ) ( not ( = ?auto_174896 ?auto_174902 ) ) ( not ( = ?auto_174897 ?auto_174898 ) ) ( not ( = ?auto_174897 ?auto_174899 ) ) ( not ( = ?auto_174897 ?auto_174900 ) ) ( not ( = ?auto_174897 ?auto_174901 ) ) ( not ( = ?auto_174897 ?auto_174902 ) ) ( not ( = ?auto_174898 ?auto_174899 ) ) ( not ( = ?auto_174898 ?auto_174900 ) ) ( not ( = ?auto_174898 ?auto_174901 ) ) ( not ( = ?auto_174898 ?auto_174902 ) ) ( not ( = ?auto_174899 ?auto_174900 ) ) ( not ( = ?auto_174899 ?auto_174901 ) ) ( not ( = ?auto_174899 ?auto_174902 ) ) ( not ( = ?auto_174900 ?auto_174901 ) ) ( not ( = ?auto_174900 ?auto_174902 ) ) ( not ( = ?auto_174901 ?auto_174902 ) ) ( ON-TABLE ?auto_174902 ) ( ON ?auto_174901 ?auto_174902 ) ( ON ?auto_174900 ?auto_174901 ) ( ON ?auto_174899 ?auto_174900 ) ( ON ?auto_174898 ?auto_174899 ) ( ON ?auto_174897 ?auto_174898 ) ( CLEAR ?auto_174897 ) ( HOLDING ?auto_174896 ) ( CLEAR ?auto_174895 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174895 ?auto_174896 )
      ( MAKE-8PILE ?auto_174895 ?auto_174896 ?auto_174897 ?auto_174898 ?auto_174899 ?auto_174900 ?auto_174901 ?auto_174902 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174903 - BLOCK
      ?auto_174904 - BLOCK
      ?auto_174905 - BLOCK
      ?auto_174906 - BLOCK
      ?auto_174907 - BLOCK
      ?auto_174908 - BLOCK
      ?auto_174909 - BLOCK
      ?auto_174910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_174903 ) ( not ( = ?auto_174903 ?auto_174904 ) ) ( not ( = ?auto_174903 ?auto_174905 ) ) ( not ( = ?auto_174903 ?auto_174906 ) ) ( not ( = ?auto_174903 ?auto_174907 ) ) ( not ( = ?auto_174903 ?auto_174908 ) ) ( not ( = ?auto_174903 ?auto_174909 ) ) ( not ( = ?auto_174903 ?auto_174910 ) ) ( not ( = ?auto_174904 ?auto_174905 ) ) ( not ( = ?auto_174904 ?auto_174906 ) ) ( not ( = ?auto_174904 ?auto_174907 ) ) ( not ( = ?auto_174904 ?auto_174908 ) ) ( not ( = ?auto_174904 ?auto_174909 ) ) ( not ( = ?auto_174904 ?auto_174910 ) ) ( not ( = ?auto_174905 ?auto_174906 ) ) ( not ( = ?auto_174905 ?auto_174907 ) ) ( not ( = ?auto_174905 ?auto_174908 ) ) ( not ( = ?auto_174905 ?auto_174909 ) ) ( not ( = ?auto_174905 ?auto_174910 ) ) ( not ( = ?auto_174906 ?auto_174907 ) ) ( not ( = ?auto_174906 ?auto_174908 ) ) ( not ( = ?auto_174906 ?auto_174909 ) ) ( not ( = ?auto_174906 ?auto_174910 ) ) ( not ( = ?auto_174907 ?auto_174908 ) ) ( not ( = ?auto_174907 ?auto_174909 ) ) ( not ( = ?auto_174907 ?auto_174910 ) ) ( not ( = ?auto_174908 ?auto_174909 ) ) ( not ( = ?auto_174908 ?auto_174910 ) ) ( not ( = ?auto_174909 ?auto_174910 ) ) ( ON-TABLE ?auto_174910 ) ( ON ?auto_174909 ?auto_174910 ) ( ON ?auto_174908 ?auto_174909 ) ( ON ?auto_174907 ?auto_174908 ) ( ON ?auto_174906 ?auto_174907 ) ( ON ?auto_174905 ?auto_174906 ) ( CLEAR ?auto_174903 ) ( ON ?auto_174904 ?auto_174905 ) ( CLEAR ?auto_174904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174910 ?auto_174909 ?auto_174908 ?auto_174907 ?auto_174906 ?auto_174905 )
      ( MAKE-8PILE ?auto_174903 ?auto_174904 ?auto_174905 ?auto_174906 ?auto_174907 ?auto_174908 ?auto_174909 ?auto_174910 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174911 - BLOCK
      ?auto_174912 - BLOCK
      ?auto_174913 - BLOCK
      ?auto_174914 - BLOCK
      ?auto_174915 - BLOCK
      ?auto_174916 - BLOCK
      ?auto_174917 - BLOCK
      ?auto_174918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174911 ?auto_174912 ) ) ( not ( = ?auto_174911 ?auto_174913 ) ) ( not ( = ?auto_174911 ?auto_174914 ) ) ( not ( = ?auto_174911 ?auto_174915 ) ) ( not ( = ?auto_174911 ?auto_174916 ) ) ( not ( = ?auto_174911 ?auto_174917 ) ) ( not ( = ?auto_174911 ?auto_174918 ) ) ( not ( = ?auto_174912 ?auto_174913 ) ) ( not ( = ?auto_174912 ?auto_174914 ) ) ( not ( = ?auto_174912 ?auto_174915 ) ) ( not ( = ?auto_174912 ?auto_174916 ) ) ( not ( = ?auto_174912 ?auto_174917 ) ) ( not ( = ?auto_174912 ?auto_174918 ) ) ( not ( = ?auto_174913 ?auto_174914 ) ) ( not ( = ?auto_174913 ?auto_174915 ) ) ( not ( = ?auto_174913 ?auto_174916 ) ) ( not ( = ?auto_174913 ?auto_174917 ) ) ( not ( = ?auto_174913 ?auto_174918 ) ) ( not ( = ?auto_174914 ?auto_174915 ) ) ( not ( = ?auto_174914 ?auto_174916 ) ) ( not ( = ?auto_174914 ?auto_174917 ) ) ( not ( = ?auto_174914 ?auto_174918 ) ) ( not ( = ?auto_174915 ?auto_174916 ) ) ( not ( = ?auto_174915 ?auto_174917 ) ) ( not ( = ?auto_174915 ?auto_174918 ) ) ( not ( = ?auto_174916 ?auto_174917 ) ) ( not ( = ?auto_174916 ?auto_174918 ) ) ( not ( = ?auto_174917 ?auto_174918 ) ) ( ON-TABLE ?auto_174918 ) ( ON ?auto_174917 ?auto_174918 ) ( ON ?auto_174916 ?auto_174917 ) ( ON ?auto_174915 ?auto_174916 ) ( ON ?auto_174914 ?auto_174915 ) ( ON ?auto_174913 ?auto_174914 ) ( ON ?auto_174912 ?auto_174913 ) ( CLEAR ?auto_174912 ) ( HOLDING ?auto_174911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_174911 )
      ( MAKE-8PILE ?auto_174911 ?auto_174912 ?auto_174913 ?auto_174914 ?auto_174915 ?auto_174916 ?auto_174917 ?auto_174918 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174919 - BLOCK
      ?auto_174920 - BLOCK
      ?auto_174921 - BLOCK
      ?auto_174922 - BLOCK
      ?auto_174923 - BLOCK
      ?auto_174924 - BLOCK
      ?auto_174925 - BLOCK
      ?auto_174926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174919 ?auto_174920 ) ) ( not ( = ?auto_174919 ?auto_174921 ) ) ( not ( = ?auto_174919 ?auto_174922 ) ) ( not ( = ?auto_174919 ?auto_174923 ) ) ( not ( = ?auto_174919 ?auto_174924 ) ) ( not ( = ?auto_174919 ?auto_174925 ) ) ( not ( = ?auto_174919 ?auto_174926 ) ) ( not ( = ?auto_174920 ?auto_174921 ) ) ( not ( = ?auto_174920 ?auto_174922 ) ) ( not ( = ?auto_174920 ?auto_174923 ) ) ( not ( = ?auto_174920 ?auto_174924 ) ) ( not ( = ?auto_174920 ?auto_174925 ) ) ( not ( = ?auto_174920 ?auto_174926 ) ) ( not ( = ?auto_174921 ?auto_174922 ) ) ( not ( = ?auto_174921 ?auto_174923 ) ) ( not ( = ?auto_174921 ?auto_174924 ) ) ( not ( = ?auto_174921 ?auto_174925 ) ) ( not ( = ?auto_174921 ?auto_174926 ) ) ( not ( = ?auto_174922 ?auto_174923 ) ) ( not ( = ?auto_174922 ?auto_174924 ) ) ( not ( = ?auto_174922 ?auto_174925 ) ) ( not ( = ?auto_174922 ?auto_174926 ) ) ( not ( = ?auto_174923 ?auto_174924 ) ) ( not ( = ?auto_174923 ?auto_174925 ) ) ( not ( = ?auto_174923 ?auto_174926 ) ) ( not ( = ?auto_174924 ?auto_174925 ) ) ( not ( = ?auto_174924 ?auto_174926 ) ) ( not ( = ?auto_174925 ?auto_174926 ) ) ( ON-TABLE ?auto_174926 ) ( ON ?auto_174925 ?auto_174926 ) ( ON ?auto_174924 ?auto_174925 ) ( ON ?auto_174923 ?auto_174924 ) ( ON ?auto_174922 ?auto_174923 ) ( ON ?auto_174921 ?auto_174922 ) ( ON ?auto_174920 ?auto_174921 ) ( ON ?auto_174919 ?auto_174920 ) ( CLEAR ?auto_174919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174926 ?auto_174925 ?auto_174924 ?auto_174923 ?auto_174922 ?auto_174921 ?auto_174920 )
      ( MAKE-8PILE ?auto_174919 ?auto_174920 ?auto_174921 ?auto_174922 ?auto_174923 ?auto_174924 ?auto_174925 ?auto_174926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174927 - BLOCK
      ?auto_174928 - BLOCK
      ?auto_174929 - BLOCK
      ?auto_174930 - BLOCK
      ?auto_174931 - BLOCK
      ?auto_174932 - BLOCK
      ?auto_174933 - BLOCK
      ?auto_174934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174927 ?auto_174928 ) ) ( not ( = ?auto_174927 ?auto_174929 ) ) ( not ( = ?auto_174927 ?auto_174930 ) ) ( not ( = ?auto_174927 ?auto_174931 ) ) ( not ( = ?auto_174927 ?auto_174932 ) ) ( not ( = ?auto_174927 ?auto_174933 ) ) ( not ( = ?auto_174927 ?auto_174934 ) ) ( not ( = ?auto_174928 ?auto_174929 ) ) ( not ( = ?auto_174928 ?auto_174930 ) ) ( not ( = ?auto_174928 ?auto_174931 ) ) ( not ( = ?auto_174928 ?auto_174932 ) ) ( not ( = ?auto_174928 ?auto_174933 ) ) ( not ( = ?auto_174928 ?auto_174934 ) ) ( not ( = ?auto_174929 ?auto_174930 ) ) ( not ( = ?auto_174929 ?auto_174931 ) ) ( not ( = ?auto_174929 ?auto_174932 ) ) ( not ( = ?auto_174929 ?auto_174933 ) ) ( not ( = ?auto_174929 ?auto_174934 ) ) ( not ( = ?auto_174930 ?auto_174931 ) ) ( not ( = ?auto_174930 ?auto_174932 ) ) ( not ( = ?auto_174930 ?auto_174933 ) ) ( not ( = ?auto_174930 ?auto_174934 ) ) ( not ( = ?auto_174931 ?auto_174932 ) ) ( not ( = ?auto_174931 ?auto_174933 ) ) ( not ( = ?auto_174931 ?auto_174934 ) ) ( not ( = ?auto_174932 ?auto_174933 ) ) ( not ( = ?auto_174932 ?auto_174934 ) ) ( not ( = ?auto_174933 ?auto_174934 ) ) ( ON-TABLE ?auto_174934 ) ( ON ?auto_174933 ?auto_174934 ) ( ON ?auto_174932 ?auto_174933 ) ( ON ?auto_174931 ?auto_174932 ) ( ON ?auto_174930 ?auto_174931 ) ( ON ?auto_174929 ?auto_174930 ) ( ON ?auto_174928 ?auto_174929 ) ( HOLDING ?auto_174927 ) ( CLEAR ?auto_174928 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_174934 ?auto_174933 ?auto_174932 ?auto_174931 ?auto_174930 ?auto_174929 ?auto_174928 ?auto_174927 )
      ( MAKE-8PILE ?auto_174927 ?auto_174928 ?auto_174929 ?auto_174930 ?auto_174931 ?auto_174932 ?auto_174933 ?auto_174934 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174935 - BLOCK
      ?auto_174936 - BLOCK
      ?auto_174937 - BLOCK
      ?auto_174938 - BLOCK
      ?auto_174939 - BLOCK
      ?auto_174940 - BLOCK
      ?auto_174941 - BLOCK
      ?auto_174942 - BLOCK
    )
    :vars
    (
      ?auto_174943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174935 ?auto_174936 ) ) ( not ( = ?auto_174935 ?auto_174937 ) ) ( not ( = ?auto_174935 ?auto_174938 ) ) ( not ( = ?auto_174935 ?auto_174939 ) ) ( not ( = ?auto_174935 ?auto_174940 ) ) ( not ( = ?auto_174935 ?auto_174941 ) ) ( not ( = ?auto_174935 ?auto_174942 ) ) ( not ( = ?auto_174936 ?auto_174937 ) ) ( not ( = ?auto_174936 ?auto_174938 ) ) ( not ( = ?auto_174936 ?auto_174939 ) ) ( not ( = ?auto_174936 ?auto_174940 ) ) ( not ( = ?auto_174936 ?auto_174941 ) ) ( not ( = ?auto_174936 ?auto_174942 ) ) ( not ( = ?auto_174937 ?auto_174938 ) ) ( not ( = ?auto_174937 ?auto_174939 ) ) ( not ( = ?auto_174937 ?auto_174940 ) ) ( not ( = ?auto_174937 ?auto_174941 ) ) ( not ( = ?auto_174937 ?auto_174942 ) ) ( not ( = ?auto_174938 ?auto_174939 ) ) ( not ( = ?auto_174938 ?auto_174940 ) ) ( not ( = ?auto_174938 ?auto_174941 ) ) ( not ( = ?auto_174938 ?auto_174942 ) ) ( not ( = ?auto_174939 ?auto_174940 ) ) ( not ( = ?auto_174939 ?auto_174941 ) ) ( not ( = ?auto_174939 ?auto_174942 ) ) ( not ( = ?auto_174940 ?auto_174941 ) ) ( not ( = ?auto_174940 ?auto_174942 ) ) ( not ( = ?auto_174941 ?auto_174942 ) ) ( ON-TABLE ?auto_174942 ) ( ON ?auto_174941 ?auto_174942 ) ( ON ?auto_174940 ?auto_174941 ) ( ON ?auto_174939 ?auto_174940 ) ( ON ?auto_174938 ?auto_174939 ) ( ON ?auto_174937 ?auto_174938 ) ( ON ?auto_174936 ?auto_174937 ) ( CLEAR ?auto_174936 ) ( ON ?auto_174935 ?auto_174943 ) ( CLEAR ?auto_174935 ) ( HAND-EMPTY ) ( not ( = ?auto_174935 ?auto_174943 ) ) ( not ( = ?auto_174936 ?auto_174943 ) ) ( not ( = ?auto_174937 ?auto_174943 ) ) ( not ( = ?auto_174938 ?auto_174943 ) ) ( not ( = ?auto_174939 ?auto_174943 ) ) ( not ( = ?auto_174940 ?auto_174943 ) ) ( not ( = ?auto_174941 ?auto_174943 ) ) ( not ( = ?auto_174942 ?auto_174943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_174935 ?auto_174943 )
      ( MAKE-8PILE ?auto_174935 ?auto_174936 ?auto_174937 ?auto_174938 ?auto_174939 ?auto_174940 ?auto_174941 ?auto_174942 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174944 - BLOCK
      ?auto_174945 - BLOCK
      ?auto_174946 - BLOCK
      ?auto_174947 - BLOCK
      ?auto_174948 - BLOCK
      ?auto_174949 - BLOCK
      ?auto_174950 - BLOCK
      ?auto_174951 - BLOCK
    )
    :vars
    (
      ?auto_174952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174944 ?auto_174945 ) ) ( not ( = ?auto_174944 ?auto_174946 ) ) ( not ( = ?auto_174944 ?auto_174947 ) ) ( not ( = ?auto_174944 ?auto_174948 ) ) ( not ( = ?auto_174944 ?auto_174949 ) ) ( not ( = ?auto_174944 ?auto_174950 ) ) ( not ( = ?auto_174944 ?auto_174951 ) ) ( not ( = ?auto_174945 ?auto_174946 ) ) ( not ( = ?auto_174945 ?auto_174947 ) ) ( not ( = ?auto_174945 ?auto_174948 ) ) ( not ( = ?auto_174945 ?auto_174949 ) ) ( not ( = ?auto_174945 ?auto_174950 ) ) ( not ( = ?auto_174945 ?auto_174951 ) ) ( not ( = ?auto_174946 ?auto_174947 ) ) ( not ( = ?auto_174946 ?auto_174948 ) ) ( not ( = ?auto_174946 ?auto_174949 ) ) ( not ( = ?auto_174946 ?auto_174950 ) ) ( not ( = ?auto_174946 ?auto_174951 ) ) ( not ( = ?auto_174947 ?auto_174948 ) ) ( not ( = ?auto_174947 ?auto_174949 ) ) ( not ( = ?auto_174947 ?auto_174950 ) ) ( not ( = ?auto_174947 ?auto_174951 ) ) ( not ( = ?auto_174948 ?auto_174949 ) ) ( not ( = ?auto_174948 ?auto_174950 ) ) ( not ( = ?auto_174948 ?auto_174951 ) ) ( not ( = ?auto_174949 ?auto_174950 ) ) ( not ( = ?auto_174949 ?auto_174951 ) ) ( not ( = ?auto_174950 ?auto_174951 ) ) ( ON-TABLE ?auto_174951 ) ( ON ?auto_174950 ?auto_174951 ) ( ON ?auto_174949 ?auto_174950 ) ( ON ?auto_174948 ?auto_174949 ) ( ON ?auto_174947 ?auto_174948 ) ( ON ?auto_174946 ?auto_174947 ) ( ON ?auto_174944 ?auto_174952 ) ( CLEAR ?auto_174944 ) ( not ( = ?auto_174944 ?auto_174952 ) ) ( not ( = ?auto_174945 ?auto_174952 ) ) ( not ( = ?auto_174946 ?auto_174952 ) ) ( not ( = ?auto_174947 ?auto_174952 ) ) ( not ( = ?auto_174948 ?auto_174952 ) ) ( not ( = ?auto_174949 ?auto_174952 ) ) ( not ( = ?auto_174950 ?auto_174952 ) ) ( not ( = ?auto_174951 ?auto_174952 ) ) ( HOLDING ?auto_174945 ) ( CLEAR ?auto_174946 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_174951 ?auto_174950 ?auto_174949 ?auto_174948 ?auto_174947 ?auto_174946 ?auto_174945 )
      ( MAKE-8PILE ?auto_174944 ?auto_174945 ?auto_174946 ?auto_174947 ?auto_174948 ?auto_174949 ?auto_174950 ?auto_174951 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174953 - BLOCK
      ?auto_174954 - BLOCK
      ?auto_174955 - BLOCK
      ?auto_174956 - BLOCK
      ?auto_174957 - BLOCK
      ?auto_174958 - BLOCK
      ?auto_174959 - BLOCK
      ?auto_174960 - BLOCK
    )
    :vars
    (
      ?auto_174961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174953 ?auto_174954 ) ) ( not ( = ?auto_174953 ?auto_174955 ) ) ( not ( = ?auto_174953 ?auto_174956 ) ) ( not ( = ?auto_174953 ?auto_174957 ) ) ( not ( = ?auto_174953 ?auto_174958 ) ) ( not ( = ?auto_174953 ?auto_174959 ) ) ( not ( = ?auto_174953 ?auto_174960 ) ) ( not ( = ?auto_174954 ?auto_174955 ) ) ( not ( = ?auto_174954 ?auto_174956 ) ) ( not ( = ?auto_174954 ?auto_174957 ) ) ( not ( = ?auto_174954 ?auto_174958 ) ) ( not ( = ?auto_174954 ?auto_174959 ) ) ( not ( = ?auto_174954 ?auto_174960 ) ) ( not ( = ?auto_174955 ?auto_174956 ) ) ( not ( = ?auto_174955 ?auto_174957 ) ) ( not ( = ?auto_174955 ?auto_174958 ) ) ( not ( = ?auto_174955 ?auto_174959 ) ) ( not ( = ?auto_174955 ?auto_174960 ) ) ( not ( = ?auto_174956 ?auto_174957 ) ) ( not ( = ?auto_174956 ?auto_174958 ) ) ( not ( = ?auto_174956 ?auto_174959 ) ) ( not ( = ?auto_174956 ?auto_174960 ) ) ( not ( = ?auto_174957 ?auto_174958 ) ) ( not ( = ?auto_174957 ?auto_174959 ) ) ( not ( = ?auto_174957 ?auto_174960 ) ) ( not ( = ?auto_174958 ?auto_174959 ) ) ( not ( = ?auto_174958 ?auto_174960 ) ) ( not ( = ?auto_174959 ?auto_174960 ) ) ( ON-TABLE ?auto_174960 ) ( ON ?auto_174959 ?auto_174960 ) ( ON ?auto_174958 ?auto_174959 ) ( ON ?auto_174957 ?auto_174958 ) ( ON ?auto_174956 ?auto_174957 ) ( ON ?auto_174955 ?auto_174956 ) ( ON ?auto_174953 ?auto_174961 ) ( not ( = ?auto_174953 ?auto_174961 ) ) ( not ( = ?auto_174954 ?auto_174961 ) ) ( not ( = ?auto_174955 ?auto_174961 ) ) ( not ( = ?auto_174956 ?auto_174961 ) ) ( not ( = ?auto_174957 ?auto_174961 ) ) ( not ( = ?auto_174958 ?auto_174961 ) ) ( not ( = ?auto_174959 ?auto_174961 ) ) ( not ( = ?auto_174960 ?auto_174961 ) ) ( CLEAR ?auto_174955 ) ( ON ?auto_174954 ?auto_174953 ) ( CLEAR ?auto_174954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_174961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_174961 ?auto_174953 )
      ( MAKE-8PILE ?auto_174953 ?auto_174954 ?auto_174955 ?auto_174956 ?auto_174957 ?auto_174958 ?auto_174959 ?auto_174960 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174962 - BLOCK
      ?auto_174963 - BLOCK
      ?auto_174964 - BLOCK
      ?auto_174965 - BLOCK
      ?auto_174966 - BLOCK
      ?auto_174967 - BLOCK
      ?auto_174968 - BLOCK
      ?auto_174969 - BLOCK
    )
    :vars
    (
      ?auto_174970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174962 ?auto_174963 ) ) ( not ( = ?auto_174962 ?auto_174964 ) ) ( not ( = ?auto_174962 ?auto_174965 ) ) ( not ( = ?auto_174962 ?auto_174966 ) ) ( not ( = ?auto_174962 ?auto_174967 ) ) ( not ( = ?auto_174962 ?auto_174968 ) ) ( not ( = ?auto_174962 ?auto_174969 ) ) ( not ( = ?auto_174963 ?auto_174964 ) ) ( not ( = ?auto_174963 ?auto_174965 ) ) ( not ( = ?auto_174963 ?auto_174966 ) ) ( not ( = ?auto_174963 ?auto_174967 ) ) ( not ( = ?auto_174963 ?auto_174968 ) ) ( not ( = ?auto_174963 ?auto_174969 ) ) ( not ( = ?auto_174964 ?auto_174965 ) ) ( not ( = ?auto_174964 ?auto_174966 ) ) ( not ( = ?auto_174964 ?auto_174967 ) ) ( not ( = ?auto_174964 ?auto_174968 ) ) ( not ( = ?auto_174964 ?auto_174969 ) ) ( not ( = ?auto_174965 ?auto_174966 ) ) ( not ( = ?auto_174965 ?auto_174967 ) ) ( not ( = ?auto_174965 ?auto_174968 ) ) ( not ( = ?auto_174965 ?auto_174969 ) ) ( not ( = ?auto_174966 ?auto_174967 ) ) ( not ( = ?auto_174966 ?auto_174968 ) ) ( not ( = ?auto_174966 ?auto_174969 ) ) ( not ( = ?auto_174967 ?auto_174968 ) ) ( not ( = ?auto_174967 ?auto_174969 ) ) ( not ( = ?auto_174968 ?auto_174969 ) ) ( ON-TABLE ?auto_174969 ) ( ON ?auto_174968 ?auto_174969 ) ( ON ?auto_174967 ?auto_174968 ) ( ON ?auto_174966 ?auto_174967 ) ( ON ?auto_174965 ?auto_174966 ) ( ON ?auto_174962 ?auto_174970 ) ( not ( = ?auto_174962 ?auto_174970 ) ) ( not ( = ?auto_174963 ?auto_174970 ) ) ( not ( = ?auto_174964 ?auto_174970 ) ) ( not ( = ?auto_174965 ?auto_174970 ) ) ( not ( = ?auto_174966 ?auto_174970 ) ) ( not ( = ?auto_174967 ?auto_174970 ) ) ( not ( = ?auto_174968 ?auto_174970 ) ) ( not ( = ?auto_174969 ?auto_174970 ) ) ( ON ?auto_174963 ?auto_174962 ) ( CLEAR ?auto_174963 ) ( ON-TABLE ?auto_174970 ) ( HOLDING ?auto_174964 ) ( CLEAR ?auto_174965 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_174969 ?auto_174968 ?auto_174967 ?auto_174966 ?auto_174965 ?auto_174964 )
      ( MAKE-8PILE ?auto_174962 ?auto_174963 ?auto_174964 ?auto_174965 ?auto_174966 ?auto_174967 ?auto_174968 ?auto_174969 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174971 - BLOCK
      ?auto_174972 - BLOCK
      ?auto_174973 - BLOCK
      ?auto_174974 - BLOCK
      ?auto_174975 - BLOCK
      ?auto_174976 - BLOCK
      ?auto_174977 - BLOCK
      ?auto_174978 - BLOCK
    )
    :vars
    (
      ?auto_174979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174971 ?auto_174972 ) ) ( not ( = ?auto_174971 ?auto_174973 ) ) ( not ( = ?auto_174971 ?auto_174974 ) ) ( not ( = ?auto_174971 ?auto_174975 ) ) ( not ( = ?auto_174971 ?auto_174976 ) ) ( not ( = ?auto_174971 ?auto_174977 ) ) ( not ( = ?auto_174971 ?auto_174978 ) ) ( not ( = ?auto_174972 ?auto_174973 ) ) ( not ( = ?auto_174972 ?auto_174974 ) ) ( not ( = ?auto_174972 ?auto_174975 ) ) ( not ( = ?auto_174972 ?auto_174976 ) ) ( not ( = ?auto_174972 ?auto_174977 ) ) ( not ( = ?auto_174972 ?auto_174978 ) ) ( not ( = ?auto_174973 ?auto_174974 ) ) ( not ( = ?auto_174973 ?auto_174975 ) ) ( not ( = ?auto_174973 ?auto_174976 ) ) ( not ( = ?auto_174973 ?auto_174977 ) ) ( not ( = ?auto_174973 ?auto_174978 ) ) ( not ( = ?auto_174974 ?auto_174975 ) ) ( not ( = ?auto_174974 ?auto_174976 ) ) ( not ( = ?auto_174974 ?auto_174977 ) ) ( not ( = ?auto_174974 ?auto_174978 ) ) ( not ( = ?auto_174975 ?auto_174976 ) ) ( not ( = ?auto_174975 ?auto_174977 ) ) ( not ( = ?auto_174975 ?auto_174978 ) ) ( not ( = ?auto_174976 ?auto_174977 ) ) ( not ( = ?auto_174976 ?auto_174978 ) ) ( not ( = ?auto_174977 ?auto_174978 ) ) ( ON-TABLE ?auto_174978 ) ( ON ?auto_174977 ?auto_174978 ) ( ON ?auto_174976 ?auto_174977 ) ( ON ?auto_174975 ?auto_174976 ) ( ON ?auto_174974 ?auto_174975 ) ( ON ?auto_174971 ?auto_174979 ) ( not ( = ?auto_174971 ?auto_174979 ) ) ( not ( = ?auto_174972 ?auto_174979 ) ) ( not ( = ?auto_174973 ?auto_174979 ) ) ( not ( = ?auto_174974 ?auto_174979 ) ) ( not ( = ?auto_174975 ?auto_174979 ) ) ( not ( = ?auto_174976 ?auto_174979 ) ) ( not ( = ?auto_174977 ?auto_174979 ) ) ( not ( = ?auto_174978 ?auto_174979 ) ) ( ON ?auto_174972 ?auto_174971 ) ( ON-TABLE ?auto_174979 ) ( CLEAR ?auto_174974 ) ( ON ?auto_174973 ?auto_174972 ) ( CLEAR ?auto_174973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_174979 ?auto_174971 ?auto_174972 )
      ( MAKE-8PILE ?auto_174971 ?auto_174972 ?auto_174973 ?auto_174974 ?auto_174975 ?auto_174976 ?auto_174977 ?auto_174978 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174980 - BLOCK
      ?auto_174981 - BLOCK
      ?auto_174982 - BLOCK
      ?auto_174983 - BLOCK
      ?auto_174984 - BLOCK
      ?auto_174985 - BLOCK
      ?auto_174986 - BLOCK
      ?auto_174987 - BLOCK
    )
    :vars
    (
      ?auto_174988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174980 ?auto_174981 ) ) ( not ( = ?auto_174980 ?auto_174982 ) ) ( not ( = ?auto_174980 ?auto_174983 ) ) ( not ( = ?auto_174980 ?auto_174984 ) ) ( not ( = ?auto_174980 ?auto_174985 ) ) ( not ( = ?auto_174980 ?auto_174986 ) ) ( not ( = ?auto_174980 ?auto_174987 ) ) ( not ( = ?auto_174981 ?auto_174982 ) ) ( not ( = ?auto_174981 ?auto_174983 ) ) ( not ( = ?auto_174981 ?auto_174984 ) ) ( not ( = ?auto_174981 ?auto_174985 ) ) ( not ( = ?auto_174981 ?auto_174986 ) ) ( not ( = ?auto_174981 ?auto_174987 ) ) ( not ( = ?auto_174982 ?auto_174983 ) ) ( not ( = ?auto_174982 ?auto_174984 ) ) ( not ( = ?auto_174982 ?auto_174985 ) ) ( not ( = ?auto_174982 ?auto_174986 ) ) ( not ( = ?auto_174982 ?auto_174987 ) ) ( not ( = ?auto_174983 ?auto_174984 ) ) ( not ( = ?auto_174983 ?auto_174985 ) ) ( not ( = ?auto_174983 ?auto_174986 ) ) ( not ( = ?auto_174983 ?auto_174987 ) ) ( not ( = ?auto_174984 ?auto_174985 ) ) ( not ( = ?auto_174984 ?auto_174986 ) ) ( not ( = ?auto_174984 ?auto_174987 ) ) ( not ( = ?auto_174985 ?auto_174986 ) ) ( not ( = ?auto_174985 ?auto_174987 ) ) ( not ( = ?auto_174986 ?auto_174987 ) ) ( ON-TABLE ?auto_174987 ) ( ON ?auto_174986 ?auto_174987 ) ( ON ?auto_174985 ?auto_174986 ) ( ON ?auto_174984 ?auto_174985 ) ( ON ?auto_174980 ?auto_174988 ) ( not ( = ?auto_174980 ?auto_174988 ) ) ( not ( = ?auto_174981 ?auto_174988 ) ) ( not ( = ?auto_174982 ?auto_174988 ) ) ( not ( = ?auto_174983 ?auto_174988 ) ) ( not ( = ?auto_174984 ?auto_174988 ) ) ( not ( = ?auto_174985 ?auto_174988 ) ) ( not ( = ?auto_174986 ?auto_174988 ) ) ( not ( = ?auto_174987 ?auto_174988 ) ) ( ON ?auto_174981 ?auto_174980 ) ( ON-TABLE ?auto_174988 ) ( ON ?auto_174982 ?auto_174981 ) ( CLEAR ?auto_174982 ) ( HOLDING ?auto_174983 ) ( CLEAR ?auto_174984 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_174987 ?auto_174986 ?auto_174985 ?auto_174984 ?auto_174983 )
      ( MAKE-8PILE ?auto_174980 ?auto_174981 ?auto_174982 ?auto_174983 ?auto_174984 ?auto_174985 ?auto_174986 ?auto_174987 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174989 - BLOCK
      ?auto_174990 - BLOCK
      ?auto_174991 - BLOCK
      ?auto_174992 - BLOCK
      ?auto_174993 - BLOCK
      ?auto_174994 - BLOCK
      ?auto_174995 - BLOCK
      ?auto_174996 - BLOCK
    )
    :vars
    (
      ?auto_174997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174989 ?auto_174990 ) ) ( not ( = ?auto_174989 ?auto_174991 ) ) ( not ( = ?auto_174989 ?auto_174992 ) ) ( not ( = ?auto_174989 ?auto_174993 ) ) ( not ( = ?auto_174989 ?auto_174994 ) ) ( not ( = ?auto_174989 ?auto_174995 ) ) ( not ( = ?auto_174989 ?auto_174996 ) ) ( not ( = ?auto_174990 ?auto_174991 ) ) ( not ( = ?auto_174990 ?auto_174992 ) ) ( not ( = ?auto_174990 ?auto_174993 ) ) ( not ( = ?auto_174990 ?auto_174994 ) ) ( not ( = ?auto_174990 ?auto_174995 ) ) ( not ( = ?auto_174990 ?auto_174996 ) ) ( not ( = ?auto_174991 ?auto_174992 ) ) ( not ( = ?auto_174991 ?auto_174993 ) ) ( not ( = ?auto_174991 ?auto_174994 ) ) ( not ( = ?auto_174991 ?auto_174995 ) ) ( not ( = ?auto_174991 ?auto_174996 ) ) ( not ( = ?auto_174992 ?auto_174993 ) ) ( not ( = ?auto_174992 ?auto_174994 ) ) ( not ( = ?auto_174992 ?auto_174995 ) ) ( not ( = ?auto_174992 ?auto_174996 ) ) ( not ( = ?auto_174993 ?auto_174994 ) ) ( not ( = ?auto_174993 ?auto_174995 ) ) ( not ( = ?auto_174993 ?auto_174996 ) ) ( not ( = ?auto_174994 ?auto_174995 ) ) ( not ( = ?auto_174994 ?auto_174996 ) ) ( not ( = ?auto_174995 ?auto_174996 ) ) ( ON-TABLE ?auto_174996 ) ( ON ?auto_174995 ?auto_174996 ) ( ON ?auto_174994 ?auto_174995 ) ( ON ?auto_174993 ?auto_174994 ) ( ON ?auto_174989 ?auto_174997 ) ( not ( = ?auto_174989 ?auto_174997 ) ) ( not ( = ?auto_174990 ?auto_174997 ) ) ( not ( = ?auto_174991 ?auto_174997 ) ) ( not ( = ?auto_174992 ?auto_174997 ) ) ( not ( = ?auto_174993 ?auto_174997 ) ) ( not ( = ?auto_174994 ?auto_174997 ) ) ( not ( = ?auto_174995 ?auto_174997 ) ) ( not ( = ?auto_174996 ?auto_174997 ) ) ( ON ?auto_174990 ?auto_174989 ) ( ON-TABLE ?auto_174997 ) ( ON ?auto_174991 ?auto_174990 ) ( CLEAR ?auto_174993 ) ( ON ?auto_174992 ?auto_174991 ) ( CLEAR ?auto_174992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_174997 ?auto_174989 ?auto_174990 ?auto_174991 )
      ( MAKE-8PILE ?auto_174989 ?auto_174990 ?auto_174991 ?auto_174992 ?auto_174993 ?auto_174994 ?auto_174995 ?auto_174996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_174998 - BLOCK
      ?auto_174999 - BLOCK
      ?auto_175000 - BLOCK
      ?auto_175001 - BLOCK
      ?auto_175002 - BLOCK
      ?auto_175003 - BLOCK
      ?auto_175004 - BLOCK
      ?auto_175005 - BLOCK
    )
    :vars
    (
      ?auto_175006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_174998 ?auto_174999 ) ) ( not ( = ?auto_174998 ?auto_175000 ) ) ( not ( = ?auto_174998 ?auto_175001 ) ) ( not ( = ?auto_174998 ?auto_175002 ) ) ( not ( = ?auto_174998 ?auto_175003 ) ) ( not ( = ?auto_174998 ?auto_175004 ) ) ( not ( = ?auto_174998 ?auto_175005 ) ) ( not ( = ?auto_174999 ?auto_175000 ) ) ( not ( = ?auto_174999 ?auto_175001 ) ) ( not ( = ?auto_174999 ?auto_175002 ) ) ( not ( = ?auto_174999 ?auto_175003 ) ) ( not ( = ?auto_174999 ?auto_175004 ) ) ( not ( = ?auto_174999 ?auto_175005 ) ) ( not ( = ?auto_175000 ?auto_175001 ) ) ( not ( = ?auto_175000 ?auto_175002 ) ) ( not ( = ?auto_175000 ?auto_175003 ) ) ( not ( = ?auto_175000 ?auto_175004 ) ) ( not ( = ?auto_175000 ?auto_175005 ) ) ( not ( = ?auto_175001 ?auto_175002 ) ) ( not ( = ?auto_175001 ?auto_175003 ) ) ( not ( = ?auto_175001 ?auto_175004 ) ) ( not ( = ?auto_175001 ?auto_175005 ) ) ( not ( = ?auto_175002 ?auto_175003 ) ) ( not ( = ?auto_175002 ?auto_175004 ) ) ( not ( = ?auto_175002 ?auto_175005 ) ) ( not ( = ?auto_175003 ?auto_175004 ) ) ( not ( = ?auto_175003 ?auto_175005 ) ) ( not ( = ?auto_175004 ?auto_175005 ) ) ( ON-TABLE ?auto_175005 ) ( ON ?auto_175004 ?auto_175005 ) ( ON ?auto_175003 ?auto_175004 ) ( ON ?auto_174998 ?auto_175006 ) ( not ( = ?auto_174998 ?auto_175006 ) ) ( not ( = ?auto_174999 ?auto_175006 ) ) ( not ( = ?auto_175000 ?auto_175006 ) ) ( not ( = ?auto_175001 ?auto_175006 ) ) ( not ( = ?auto_175002 ?auto_175006 ) ) ( not ( = ?auto_175003 ?auto_175006 ) ) ( not ( = ?auto_175004 ?auto_175006 ) ) ( not ( = ?auto_175005 ?auto_175006 ) ) ( ON ?auto_174999 ?auto_174998 ) ( ON-TABLE ?auto_175006 ) ( ON ?auto_175000 ?auto_174999 ) ( ON ?auto_175001 ?auto_175000 ) ( CLEAR ?auto_175001 ) ( HOLDING ?auto_175002 ) ( CLEAR ?auto_175003 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_175005 ?auto_175004 ?auto_175003 ?auto_175002 )
      ( MAKE-8PILE ?auto_174998 ?auto_174999 ?auto_175000 ?auto_175001 ?auto_175002 ?auto_175003 ?auto_175004 ?auto_175005 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175007 - BLOCK
      ?auto_175008 - BLOCK
      ?auto_175009 - BLOCK
      ?auto_175010 - BLOCK
      ?auto_175011 - BLOCK
      ?auto_175012 - BLOCK
      ?auto_175013 - BLOCK
      ?auto_175014 - BLOCK
    )
    :vars
    (
      ?auto_175015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175007 ?auto_175008 ) ) ( not ( = ?auto_175007 ?auto_175009 ) ) ( not ( = ?auto_175007 ?auto_175010 ) ) ( not ( = ?auto_175007 ?auto_175011 ) ) ( not ( = ?auto_175007 ?auto_175012 ) ) ( not ( = ?auto_175007 ?auto_175013 ) ) ( not ( = ?auto_175007 ?auto_175014 ) ) ( not ( = ?auto_175008 ?auto_175009 ) ) ( not ( = ?auto_175008 ?auto_175010 ) ) ( not ( = ?auto_175008 ?auto_175011 ) ) ( not ( = ?auto_175008 ?auto_175012 ) ) ( not ( = ?auto_175008 ?auto_175013 ) ) ( not ( = ?auto_175008 ?auto_175014 ) ) ( not ( = ?auto_175009 ?auto_175010 ) ) ( not ( = ?auto_175009 ?auto_175011 ) ) ( not ( = ?auto_175009 ?auto_175012 ) ) ( not ( = ?auto_175009 ?auto_175013 ) ) ( not ( = ?auto_175009 ?auto_175014 ) ) ( not ( = ?auto_175010 ?auto_175011 ) ) ( not ( = ?auto_175010 ?auto_175012 ) ) ( not ( = ?auto_175010 ?auto_175013 ) ) ( not ( = ?auto_175010 ?auto_175014 ) ) ( not ( = ?auto_175011 ?auto_175012 ) ) ( not ( = ?auto_175011 ?auto_175013 ) ) ( not ( = ?auto_175011 ?auto_175014 ) ) ( not ( = ?auto_175012 ?auto_175013 ) ) ( not ( = ?auto_175012 ?auto_175014 ) ) ( not ( = ?auto_175013 ?auto_175014 ) ) ( ON-TABLE ?auto_175014 ) ( ON ?auto_175013 ?auto_175014 ) ( ON ?auto_175012 ?auto_175013 ) ( ON ?auto_175007 ?auto_175015 ) ( not ( = ?auto_175007 ?auto_175015 ) ) ( not ( = ?auto_175008 ?auto_175015 ) ) ( not ( = ?auto_175009 ?auto_175015 ) ) ( not ( = ?auto_175010 ?auto_175015 ) ) ( not ( = ?auto_175011 ?auto_175015 ) ) ( not ( = ?auto_175012 ?auto_175015 ) ) ( not ( = ?auto_175013 ?auto_175015 ) ) ( not ( = ?auto_175014 ?auto_175015 ) ) ( ON ?auto_175008 ?auto_175007 ) ( ON-TABLE ?auto_175015 ) ( ON ?auto_175009 ?auto_175008 ) ( ON ?auto_175010 ?auto_175009 ) ( CLEAR ?auto_175012 ) ( ON ?auto_175011 ?auto_175010 ) ( CLEAR ?auto_175011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_175015 ?auto_175007 ?auto_175008 ?auto_175009 ?auto_175010 )
      ( MAKE-8PILE ?auto_175007 ?auto_175008 ?auto_175009 ?auto_175010 ?auto_175011 ?auto_175012 ?auto_175013 ?auto_175014 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175016 - BLOCK
      ?auto_175017 - BLOCK
      ?auto_175018 - BLOCK
      ?auto_175019 - BLOCK
      ?auto_175020 - BLOCK
      ?auto_175021 - BLOCK
      ?auto_175022 - BLOCK
      ?auto_175023 - BLOCK
    )
    :vars
    (
      ?auto_175024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175016 ?auto_175017 ) ) ( not ( = ?auto_175016 ?auto_175018 ) ) ( not ( = ?auto_175016 ?auto_175019 ) ) ( not ( = ?auto_175016 ?auto_175020 ) ) ( not ( = ?auto_175016 ?auto_175021 ) ) ( not ( = ?auto_175016 ?auto_175022 ) ) ( not ( = ?auto_175016 ?auto_175023 ) ) ( not ( = ?auto_175017 ?auto_175018 ) ) ( not ( = ?auto_175017 ?auto_175019 ) ) ( not ( = ?auto_175017 ?auto_175020 ) ) ( not ( = ?auto_175017 ?auto_175021 ) ) ( not ( = ?auto_175017 ?auto_175022 ) ) ( not ( = ?auto_175017 ?auto_175023 ) ) ( not ( = ?auto_175018 ?auto_175019 ) ) ( not ( = ?auto_175018 ?auto_175020 ) ) ( not ( = ?auto_175018 ?auto_175021 ) ) ( not ( = ?auto_175018 ?auto_175022 ) ) ( not ( = ?auto_175018 ?auto_175023 ) ) ( not ( = ?auto_175019 ?auto_175020 ) ) ( not ( = ?auto_175019 ?auto_175021 ) ) ( not ( = ?auto_175019 ?auto_175022 ) ) ( not ( = ?auto_175019 ?auto_175023 ) ) ( not ( = ?auto_175020 ?auto_175021 ) ) ( not ( = ?auto_175020 ?auto_175022 ) ) ( not ( = ?auto_175020 ?auto_175023 ) ) ( not ( = ?auto_175021 ?auto_175022 ) ) ( not ( = ?auto_175021 ?auto_175023 ) ) ( not ( = ?auto_175022 ?auto_175023 ) ) ( ON-TABLE ?auto_175023 ) ( ON ?auto_175022 ?auto_175023 ) ( ON ?auto_175016 ?auto_175024 ) ( not ( = ?auto_175016 ?auto_175024 ) ) ( not ( = ?auto_175017 ?auto_175024 ) ) ( not ( = ?auto_175018 ?auto_175024 ) ) ( not ( = ?auto_175019 ?auto_175024 ) ) ( not ( = ?auto_175020 ?auto_175024 ) ) ( not ( = ?auto_175021 ?auto_175024 ) ) ( not ( = ?auto_175022 ?auto_175024 ) ) ( not ( = ?auto_175023 ?auto_175024 ) ) ( ON ?auto_175017 ?auto_175016 ) ( ON-TABLE ?auto_175024 ) ( ON ?auto_175018 ?auto_175017 ) ( ON ?auto_175019 ?auto_175018 ) ( ON ?auto_175020 ?auto_175019 ) ( CLEAR ?auto_175020 ) ( HOLDING ?auto_175021 ) ( CLEAR ?auto_175022 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_175023 ?auto_175022 ?auto_175021 )
      ( MAKE-8PILE ?auto_175016 ?auto_175017 ?auto_175018 ?auto_175019 ?auto_175020 ?auto_175021 ?auto_175022 ?auto_175023 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175025 - BLOCK
      ?auto_175026 - BLOCK
      ?auto_175027 - BLOCK
      ?auto_175028 - BLOCK
      ?auto_175029 - BLOCK
      ?auto_175030 - BLOCK
      ?auto_175031 - BLOCK
      ?auto_175032 - BLOCK
    )
    :vars
    (
      ?auto_175033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175025 ?auto_175026 ) ) ( not ( = ?auto_175025 ?auto_175027 ) ) ( not ( = ?auto_175025 ?auto_175028 ) ) ( not ( = ?auto_175025 ?auto_175029 ) ) ( not ( = ?auto_175025 ?auto_175030 ) ) ( not ( = ?auto_175025 ?auto_175031 ) ) ( not ( = ?auto_175025 ?auto_175032 ) ) ( not ( = ?auto_175026 ?auto_175027 ) ) ( not ( = ?auto_175026 ?auto_175028 ) ) ( not ( = ?auto_175026 ?auto_175029 ) ) ( not ( = ?auto_175026 ?auto_175030 ) ) ( not ( = ?auto_175026 ?auto_175031 ) ) ( not ( = ?auto_175026 ?auto_175032 ) ) ( not ( = ?auto_175027 ?auto_175028 ) ) ( not ( = ?auto_175027 ?auto_175029 ) ) ( not ( = ?auto_175027 ?auto_175030 ) ) ( not ( = ?auto_175027 ?auto_175031 ) ) ( not ( = ?auto_175027 ?auto_175032 ) ) ( not ( = ?auto_175028 ?auto_175029 ) ) ( not ( = ?auto_175028 ?auto_175030 ) ) ( not ( = ?auto_175028 ?auto_175031 ) ) ( not ( = ?auto_175028 ?auto_175032 ) ) ( not ( = ?auto_175029 ?auto_175030 ) ) ( not ( = ?auto_175029 ?auto_175031 ) ) ( not ( = ?auto_175029 ?auto_175032 ) ) ( not ( = ?auto_175030 ?auto_175031 ) ) ( not ( = ?auto_175030 ?auto_175032 ) ) ( not ( = ?auto_175031 ?auto_175032 ) ) ( ON-TABLE ?auto_175032 ) ( ON ?auto_175031 ?auto_175032 ) ( ON ?auto_175025 ?auto_175033 ) ( not ( = ?auto_175025 ?auto_175033 ) ) ( not ( = ?auto_175026 ?auto_175033 ) ) ( not ( = ?auto_175027 ?auto_175033 ) ) ( not ( = ?auto_175028 ?auto_175033 ) ) ( not ( = ?auto_175029 ?auto_175033 ) ) ( not ( = ?auto_175030 ?auto_175033 ) ) ( not ( = ?auto_175031 ?auto_175033 ) ) ( not ( = ?auto_175032 ?auto_175033 ) ) ( ON ?auto_175026 ?auto_175025 ) ( ON-TABLE ?auto_175033 ) ( ON ?auto_175027 ?auto_175026 ) ( ON ?auto_175028 ?auto_175027 ) ( ON ?auto_175029 ?auto_175028 ) ( CLEAR ?auto_175031 ) ( ON ?auto_175030 ?auto_175029 ) ( CLEAR ?auto_175030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_175033 ?auto_175025 ?auto_175026 ?auto_175027 ?auto_175028 ?auto_175029 )
      ( MAKE-8PILE ?auto_175025 ?auto_175026 ?auto_175027 ?auto_175028 ?auto_175029 ?auto_175030 ?auto_175031 ?auto_175032 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175034 - BLOCK
      ?auto_175035 - BLOCK
      ?auto_175036 - BLOCK
      ?auto_175037 - BLOCK
      ?auto_175038 - BLOCK
      ?auto_175039 - BLOCK
      ?auto_175040 - BLOCK
      ?auto_175041 - BLOCK
    )
    :vars
    (
      ?auto_175042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175034 ?auto_175035 ) ) ( not ( = ?auto_175034 ?auto_175036 ) ) ( not ( = ?auto_175034 ?auto_175037 ) ) ( not ( = ?auto_175034 ?auto_175038 ) ) ( not ( = ?auto_175034 ?auto_175039 ) ) ( not ( = ?auto_175034 ?auto_175040 ) ) ( not ( = ?auto_175034 ?auto_175041 ) ) ( not ( = ?auto_175035 ?auto_175036 ) ) ( not ( = ?auto_175035 ?auto_175037 ) ) ( not ( = ?auto_175035 ?auto_175038 ) ) ( not ( = ?auto_175035 ?auto_175039 ) ) ( not ( = ?auto_175035 ?auto_175040 ) ) ( not ( = ?auto_175035 ?auto_175041 ) ) ( not ( = ?auto_175036 ?auto_175037 ) ) ( not ( = ?auto_175036 ?auto_175038 ) ) ( not ( = ?auto_175036 ?auto_175039 ) ) ( not ( = ?auto_175036 ?auto_175040 ) ) ( not ( = ?auto_175036 ?auto_175041 ) ) ( not ( = ?auto_175037 ?auto_175038 ) ) ( not ( = ?auto_175037 ?auto_175039 ) ) ( not ( = ?auto_175037 ?auto_175040 ) ) ( not ( = ?auto_175037 ?auto_175041 ) ) ( not ( = ?auto_175038 ?auto_175039 ) ) ( not ( = ?auto_175038 ?auto_175040 ) ) ( not ( = ?auto_175038 ?auto_175041 ) ) ( not ( = ?auto_175039 ?auto_175040 ) ) ( not ( = ?auto_175039 ?auto_175041 ) ) ( not ( = ?auto_175040 ?auto_175041 ) ) ( ON-TABLE ?auto_175041 ) ( ON ?auto_175034 ?auto_175042 ) ( not ( = ?auto_175034 ?auto_175042 ) ) ( not ( = ?auto_175035 ?auto_175042 ) ) ( not ( = ?auto_175036 ?auto_175042 ) ) ( not ( = ?auto_175037 ?auto_175042 ) ) ( not ( = ?auto_175038 ?auto_175042 ) ) ( not ( = ?auto_175039 ?auto_175042 ) ) ( not ( = ?auto_175040 ?auto_175042 ) ) ( not ( = ?auto_175041 ?auto_175042 ) ) ( ON ?auto_175035 ?auto_175034 ) ( ON-TABLE ?auto_175042 ) ( ON ?auto_175036 ?auto_175035 ) ( ON ?auto_175037 ?auto_175036 ) ( ON ?auto_175038 ?auto_175037 ) ( ON ?auto_175039 ?auto_175038 ) ( CLEAR ?auto_175039 ) ( HOLDING ?auto_175040 ) ( CLEAR ?auto_175041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_175041 ?auto_175040 )
      ( MAKE-8PILE ?auto_175034 ?auto_175035 ?auto_175036 ?auto_175037 ?auto_175038 ?auto_175039 ?auto_175040 ?auto_175041 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175043 - BLOCK
      ?auto_175044 - BLOCK
      ?auto_175045 - BLOCK
      ?auto_175046 - BLOCK
      ?auto_175047 - BLOCK
      ?auto_175048 - BLOCK
      ?auto_175049 - BLOCK
      ?auto_175050 - BLOCK
    )
    :vars
    (
      ?auto_175051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175043 ?auto_175044 ) ) ( not ( = ?auto_175043 ?auto_175045 ) ) ( not ( = ?auto_175043 ?auto_175046 ) ) ( not ( = ?auto_175043 ?auto_175047 ) ) ( not ( = ?auto_175043 ?auto_175048 ) ) ( not ( = ?auto_175043 ?auto_175049 ) ) ( not ( = ?auto_175043 ?auto_175050 ) ) ( not ( = ?auto_175044 ?auto_175045 ) ) ( not ( = ?auto_175044 ?auto_175046 ) ) ( not ( = ?auto_175044 ?auto_175047 ) ) ( not ( = ?auto_175044 ?auto_175048 ) ) ( not ( = ?auto_175044 ?auto_175049 ) ) ( not ( = ?auto_175044 ?auto_175050 ) ) ( not ( = ?auto_175045 ?auto_175046 ) ) ( not ( = ?auto_175045 ?auto_175047 ) ) ( not ( = ?auto_175045 ?auto_175048 ) ) ( not ( = ?auto_175045 ?auto_175049 ) ) ( not ( = ?auto_175045 ?auto_175050 ) ) ( not ( = ?auto_175046 ?auto_175047 ) ) ( not ( = ?auto_175046 ?auto_175048 ) ) ( not ( = ?auto_175046 ?auto_175049 ) ) ( not ( = ?auto_175046 ?auto_175050 ) ) ( not ( = ?auto_175047 ?auto_175048 ) ) ( not ( = ?auto_175047 ?auto_175049 ) ) ( not ( = ?auto_175047 ?auto_175050 ) ) ( not ( = ?auto_175048 ?auto_175049 ) ) ( not ( = ?auto_175048 ?auto_175050 ) ) ( not ( = ?auto_175049 ?auto_175050 ) ) ( ON-TABLE ?auto_175050 ) ( ON ?auto_175043 ?auto_175051 ) ( not ( = ?auto_175043 ?auto_175051 ) ) ( not ( = ?auto_175044 ?auto_175051 ) ) ( not ( = ?auto_175045 ?auto_175051 ) ) ( not ( = ?auto_175046 ?auto_175051 ) ) ( not ( = ?auto_175047 ?auto_175051 ) ) ( not ( = ?auto_175048 ?auto_175051 ) ) ( not ( = ?auto_175049 ?auto_175051 ) ) ( not ( = ?auto_175050 ?auto_175051 ) ) ( ON ?auto_175044 ?auto_175043 ) ( ON-TABLE ?auto_175051 ) ( ON ?auto_175045 ?auto_175044 ) ( ON ?auto_175046 ?auto_175045 ) ( ON ?auto_175047 ?auto_175046 ) ( ON ?auto_175048 ?auto_175047 ) ( CLEAR ?auto_175050 ) ( ON ?auto_175049 ?auto_175048 ) ( CLEAR ?auto_175049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_175051 ?auto_175043 ?auto_175044 ?auto_175045 ?auto_175046 ?auto_175047 ?auto_175048 )
      ( MAKE-8PILE ?auto_175043 ?auto_175044 ?auto_175045 ?auto_175046 ?auto_175047 ?auto_175048 ?auto_175049 ?auto_175050 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175052 - BLOCK
      ?auto_175053 - BLOCK
      ?auto_175054 - BLOCK
      ?auto_175055 - BLOCK
      ?auto_175056 - BLOCK
      ?auto_175057 - BLOCK
      ?auto_175058 - BLOCK
      ?auto_175059 - BLOCK
    )
    :vars
    (
      ?auto_175060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175052 ?auto_175053 ) ) ( not ( = ?auto_175052 ?auto_175054 ) ) ( not ( = ?auto_175052 ?auto_175055 ) ) ( not ( = ?auto_175052 ?auto_175056 ) ) ( not ( = ?auto_175052 ?auto_175057 ) ) ( not ( = ?auto_175052 ?auto_175058 ) ) ( not ( = ?auto_175052 ?auto_175059 ) ) ( not ( = ?auto_175053 ?auto_175054 ) ) ( not ( = ?auto_175053 ?auto_175055 ) ) ( not ( = ?auto_175053 ?auto_175056 ) ) ( not ( = ?auto_175053 ?auto_175057 ) ) ( not ( = ?auto_175053 ?auto_175058 ) ) ( not ( = ?auto_175053 ?auto_175059 ) ) ( not ( = ?auto_175054 ?auto_175055 ) ) ( not ( = ?auto_175054 ?auto_175056 ) ) ( not ( = ?auto_175054 ?auto_175057 ) ) ( not ( = ?auto_175054 ?auto_175058 ) ) ( not ( = ?auto_175054 ?auto_175059 ) ) ( not ( = ?auto_175055 ?auto_175056 ) ) ( not ( = ?auto_175055 ?auto_175057 ) ) ( not ( = ?auto_175055 ?auto_175058 ) ) ( not ( = ?auto_175055 ?auto_175059 ) ) ( not ( = ?auto_175056 ?auto_175057 ) ) ( not ( = ?auto_175056 ?auto_175058 ) ) ( not ( = ?auto_175056 ?auto_175059 ) ) ( not ( = ?auto_175057 ?auto_175058 ) ) ( not ( = ?auto_175057 ?auto_175059 ) ) ( not ( = ?auto_175058 ?auto_175059 ) ) ( ON ?auto_175052 ?auto_175060 ) ( not ( = ?auto_175052 ?auto_175060 ) ) ( not ( = ?auto_175053 ?auto_175060 ) ) ( not ( = ?auto_175054 ?auto_175060 ) ) ( not ( = ?auto_175055 ?auto_175060 ) ) ( not ( = ?auto_175056 ?auto_175060 ) ) ( not ( = ?auto_175057 ?auto_175060 ) ) ( not ( = ?auto_175058 ?auto_175060 ) ) ( not ( = ?auto_175059 ?auto_175060 ) ) ( ON ?auto_175053 ?auto_175052 ) ( ON-TABLE ?auto_175060 ) ( ON ?auto_175054 ?auto_175053 ) ( ON ?auto_175055 ?auto_175054 ) ( ON ?auto_175056 ?auto_175055 ) ( ON ?auto_175057 ?auto_175056 ) ( ON ?auto_175058 ?auto_175057 ) ( CLEAR ?auto_175058 ) ( HOLDING ?auto_175059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_175059 )
      ( MAKE-8PILE ?auto_175052 ?auto_175053 ?auto_175054 ?auto_175055 ?auto_175056 ?auto_175057 ?auto_175058 ?auto_175059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_175061 - BLOCK
      ?auto_175062 - BLOCK
      ?auto_175063 - BLOCK
      ?auto_175064 - BLOCK
      ?auto_175065 - BLOCK
      ?auto_175066 - BLOCK
      ?auto_175067 - BLOCK
      ?auto_175068 - BLOCK
    )
    :vars
    (
      ?auto_175069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_175061 ?auto_175062 ) ) ( not ( = ?auto_175061 ?auto_175063 ) ) ( not ( = ?auto_175061 ?auto_175064 ) ) ( not ( = ?auto_175061 ?auto_175065 ) ) ( not ( = ?auto_175061 ?auto_175066 ) ) ( not ( = ?auto_175061 ?auto_175067 ) ) ( not ( = ?auto_175061 ?auto_175068 ) ) ( not ( = ?auto_175062 ?auto_175063 ) ) ( not ( = ?auto_175062 ?auto_175064 ) ) ( not ( = ?auto_175062 ?auto_175065 ) ) ( not ( = ?auto_175062 ?auto_175066 ) ) ( not ( = ?auto_175062 ?auto_175067 ) ) ( not ( = ?auto_175062 ?auto_175068 ) ) ( not ( = ?auto_175063 ?auto_175064 ) ) ( not ( = ?auto_175063 ?auto_175065 ) ) ( not ( = ?auto_175063 ?auto_175066 ) ) ( not ( = ?auto_175063 ?auto_175067 ) ) ( not ( = ?auto_175063 ?auto_175068 ) ) ( not ( = ?auto_175064 ?auto_175065 ) ) ( not ( = ?auto_175064 ?auto_175066 ) ) ( not ( = ?auto_175064 ?auto_175067 ) ) ( not ( = ?auto_175064 ?auto_175068 ) ) ( not ( = ?auto_175065 ?auto_175066 ) ) ( not ( = ?auto_175065 ?auto_175067 ) ) ( not ( = ?auto_175065 ?auto_175068 ) ) ( not ( = ?auto_175066 ?auto_175067 ) ) ( not ( = ?auto_175066 ?auto_175068 ) ) ( not ( = ?auto_175067 ?auto_175068 ) ) ( ON ?auto_175061 ?auto_175069 ) ( not ( = ?auto_175061 ?auto_175069 ) ) ( not ( = ?auto_175062 ?auto_175069 ) ) ( not ( = ?auto_175063 ?auto_175069 ) ) ( not ( = ?auto_175064 ?auto_175069 ) ) ( not ( = ?auto_175065 ?auto_175069 ) ) ( not ( = ?auto_175066 ?auto_175069 ) ) ( not ( = ?auto_175067 ?auto_175069 ) ) ( not ( = ?auto_175068 ?auto_175069 ) ) ( ON ?auto_175062 ?auto_175061 ) ( ON-TABLE ?auto_175069 ) ( ON ?auto_175063 ?auto_175062 ) ( ON ?auto_175064 ?auto_175063 ) ( ON ?auto_175065 ?auto_175064 ) ( ON ?auto_175066 ?auto_175065 ) ( ON ?auto_175067 ?auto_175066 ) ( ON ?auto_175068 ?auto_175067 ) ( CLEAR ?auto_175068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_175069 ?auto_175061 ?auto_175062 ?auto_175063 ?auto_175064 ?auto_175065 ?auto_175066 ?auto_175067 )
      ( MAKE-8PILE ?auto_175061 ?auto_175062 ?auto_175063 ?auto_175064 ?auto_175065 ?auto_175066 ?auto_175067 ?auto_175068 ) )
  )

)

