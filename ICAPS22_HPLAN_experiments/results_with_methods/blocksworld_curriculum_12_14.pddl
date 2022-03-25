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
      ?auto_188867 - BLOCK
    )
    :vars
    (
      ?auto_188868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188867 ?auto_188868 ) ( CLEAR ?auto_188867 ) ( HAND-EMPTY ) ( not ( = ?auto_188867 ?auto_188868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188867 ?auto_188868 )
      ( !PUTDOWN ?auto_188867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_188870 - BLOCK
    )
    :vars
    (
      ?auto_188871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188870 ?auto_188871 ) ( CLEAR ?auto_188870 ) ( HAND-EMPTY ) ( not ( = ?auto_188870 ?auto_188871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188870 ?auto_188871 )
      ( !PUTDOWN ?auto_188870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188874 - BLOCK
      ?auto_188875 - BLOCK
    )
    :vars
    (
      ?auto_188876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188874 ) ( ON ?auto_188875 ?auto_188876 ) ( CLEAR ?auto_188875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188874 ) ( not ( = ?auto_188874 ?auto_188875 ) ) ( not ( = ?auto_188874 ?auto_188876 ) ) ( not ( = ?auto_188875 ?auto_188876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188875 ?auto_188876 )
      ( !STACK ?auto_188875 ?auto_188874 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188879 - BLOCK
      ?auto_188880 - BLOCK
    )
    :vars
    (
      ?auto_188881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188879 ) ( ON ?auto_188880 ?auto_188881 ) ( CLEAR ?auto_188880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188879 ) ( not ( = ?auto_188879 ?auto_188880 ) ) ( not ( = ?auto_188879 ?auto_188881 ) ) ( not ( = ?auto_188880 ?auto_188881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188880 ?auto_188881 )
      ( !STACK ?auto_188880 ?auto_188879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188884 - BLOCK
      ?auto_188885 - BLOCK
    )
    :vars
    (
      ?auto_188886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188885 ?auto_188886 ) ( not ( = ?auto_188884 ?auto_188885 ) ) ( not ( = ?auto_188884 ?auto_188886 ) ) ( not ( = ?auto_188885 ?auto_188886 ) ) ( ON ?auto_188884 ?auto_188885 ) ( CLEAR ?auto_188884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188884 )
      ( MAKE-2PILE ?auto_188884 ?auto_188885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_188889 - BLOCK
      ?auto_188890 - BLOCK
    )
    :vars
    (
      ?auto_188891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188890 ?auto_188891 ) ( not ( = ?auto_188889 ?auto_188890 ) ) ( not ( = ?auto_188889 ?auto_188891 ) ) ( not ( = ?auto_188890 ?auto_188891 ) ) ( ON ?auto_188889 ?auto_188890 ) ( CLEAR ?auto_188889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188889 )
      ( MAKE-2PILE ?auto_188889 ?auto_188890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188895 - BLOCK
      ?auto_188896 - BLOCK
      ?auto_188897 - BLOCK
    )
    :vars
    (
      ?auto_188898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188896 ) ( ON ?auto_188897 ?auto_188898 ) ( CLEAR ?auto_188897 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188895 ) ( ON ?auto_188896 ?auto_188895 ) ( not ( = ?auto_188895 ?auto_188896 ) ) ( not ( = ?auto_188895 ?auto_188897 ) ) ( not ( = ?auto_188895 ?auto_188898 ) ) ( not ( = ?auto_188896 ?auto_188897 ) ) ( not ( = ?auto_188896 ?auto_188898 ) ) ( not ( = ?auto_188897 ?auto_188898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188897 ?auto_188898 )
      ( !STACK ?auto_188897 ?auto_188896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188902 - BLOCK
      ?auto_188903 - BLOCK
      ?auto_188904 - BLOCK
    )
    :vars
    (
      ?auto_188905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188903 ) ( ON ?auto_188904 ?auto_188905 ) ( CLEAR ?auto_188904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188902 ) ( ON ?auto_188903 ?auto_188902 ) ( not ( = ?auto_188902 ?auto_188903 ) ) ( not ( = ?auto_188902 ?auto_188904 ) ) ( not ( = ?auto_188902 ?auto_188905 ) ) ( not ( = ?auto_188903 ?auto_188904 ) ) ( not ( = ?auto_188903 ?auto_188905 ) ) ( not ( = ?auto_188904 ?auto_188905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188904 ?auto_188905 )
      ( !STACK ?auto_188904 ?auto_188903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188909 - BLOCK
      ?auto_188910 - BLOCK
      ?auto_188911 - BLOCK
    )
    :vars
    (
      ?auto_188912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188911 ?auto_188912 ) ( ON-TABLE ?auto_188909 ) ( not ( = ?auto_188909 ?auto_188910 ) ) ( not ( = ?auto_188909 ?auto_188911 ) ) ( not ( = ?auto_188909 ?auto_188912 ) ) ( not ( = ?auto_188910 ?auto_188911 ) ) ( not ( = ?auto_188910 ?auto_188912 ) ) ( not ( = ?auto_188911 ?auto_188912 ) ) ( CLEAR ?auto_188909 ) ( ON ?auto_188910 ?auto_188911 ) ( CLEAR ?auto_188910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188909 ?auto_188910 )
      ( MAKE-3PILE ?auto_188909 ?auto_188910 ?auto_188911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188916 - BLOCK
      ?auto_188917 - BLOCK
      ?auto_188918 - BLOCK
    )
    :vars
    (
      ?auto_188919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188918 ?auto_188919 ) ( ON-TABLE ?auto_188916 ) ( not ( = ?auto_188916 ?auto_188917 ) ) ( not ( = ?auto_188916 ?auto_188918 ) ) ( not ( = ?auto_188916 ?auto_188919 ) ) ( not ( = ?auto_188917 ?auto_188918 ) ) ( not ( = ?auto_188917 ?auto_188919 ) ) ( not ( = ?auto_188918 ?auto_188919 ) ) ( CLEAR ?auto_188916 ) ( ON ?auto_188917 ?auto_188918 ) ( CLEAR ?auto_188917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188916 ?auto_188917 )
      ( MAKE-3PILE ?auto_188916 ?auto_188917 ?auto_188918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188923 - BLOCK
      ?auto_188924 - BLOCK
      ?auto_188925 - BLOCK
    )
    :vars
    (
      ?auto_188926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188925 ?auto_188926 ) ( not ( = ?auto_188923 ?auto_188924 ) ) ( not ( = ?auto_188923 ?auto_188925 ) ) ( not ( = ?auto_188923 ?auto_188926 ) ) ( not ( = ?auto_188924 ?auto_188925 ) ) ( not ( = ?auto_188924 ?auto_188926 ) ) ( not ( = ?auto_188925 ?auto_188926 ) ) ( ON ?auto_188924 ?auto_188925 ) ( ON ?auto_188923 ?auto_188924 ) ( CLEAR ?auto_188923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188923 )
      ( MAKE-3PILE ?auto_188923 ?auto_188924 ?auto_188925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_188930 - BLOCK
      ?auto_188931 - BLOCK
      ?auto_188932 - BLOCK
    )
    :vars
    (
      ?auto_188933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188932 ?auto_188933 ) ( not ( = ?auto_188930 ?auto_188931 ) ) ( not ( = ?auto_188930 ?auto_188932 ) ) ( not ( = ?auto_188930 ?auto_188933 ) ) ( not ( = ?auto_188931 ?auto_188932 ) ) ( not ( = ?auto_188931 ?auto_188933 ) ) ( not ( = ?auto_188932 ?auto_188933 ) ) ( ON ?auto_188931 ?auto_188932 ) ( ON ?auto_188930 ?auto_188931 ) ( CLEAR ?auto_188930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188930 )
      ( MAKE-3PILE ?auto_188930 ?auto_188931 ?auto_188932 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188938 - BLOCK
      ?auto_188939 - BLOCK
      ?auto_188940 - BLOCK
      ?auto_188941 - BLOCK
    )
    :vars
    (
      ?auto_188942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188940 ) ( ON ?auto_188941 ?auto_188942 ) ( CLEAR ?auto_188941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188938 ) ( ON ?auto_188939 ?auto_188938 ) ( ON ?auto_188940 ?auto_188939 ) ( not ( = ?auto_188938 ?auto_188939 ) ) ( not ( = ?auto_188938 ?auto_188940 ) ) ( not ( = ?auto_188938 ?auto_188941 ) ) ( not ( = ?auto_188938 ?auto_188942 ) ) ( not ( = ?auto_188939 ?auto_188940 ) ) ( not ( = ?auto_188939 ?auto_188941 ) ) ( not ( = ?auto_188939 ?auto_188942 ) ) ( not ( = ?auto_188940 ?auto_188941 ) ) ( not ( = ?auto_188940 ?auto_188942 ) ) ( not ( = ?auto_188941 ?auto_188942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188941 ?auto_188942 )
      ( !STACK ?auto_188941 ?auto_188940 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188947 - BLOCK
      ?auto_188948 - BLOCK
      ?auto_188949 - BLOCK
      ?auto_188950 - BLOCK
    )
    :vars
    (
      ?auto_188951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_188949 ) ( ON ?auto_188950 ?auto_188951 ) ( CLEAR ?auto_188950 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188947 ) ( ON ?auto_188948 ?auto_188947 ) ( ON ?auto_188949 ?auto_188948 ) ( not ( = ?auto_188947 ?auto_188948 ) ) ( not ( = ?auto_188947 ?auto_188949 ) ) ( not ( = ?auto_188947 ?auto_188950 ) ) ( not ( = ?auto_188947 ?auto_188951 ) ) ( not ( = ?auto_188948 ?auto_188949 ) ) ( not ( = ?auto_188948 ?auto_188950 ) ) ( not ( = ?auto_188948 ?auto_188951 ) ) ( not ( = ?auto_188949 ?auto_188950 ) ) ( not ( = ?auto_188949 ?auto_188951 ) ) ( not ( = ?auto_188950 ?auto_188951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188950 ?auto_188951 )
      ( !STACK ?auto_188950 ?auto_188949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188956 - BLOCK
      ?auto_188957 - BLOCK
      ?auto_188958 - BLOCK
      ?auto_188959 - BLOCK
    )
    :vars
    (
      ?auto_188960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188959 ?auto_188960 ) ( ON-TABLE ?auto_188956 ) ( ON ?auto_188957 ?auto_188956 ) ( not ( = ?auto_188956 ?auto_188957 ) ) ( not ( = ?auto_188956 ?auto_188958 ) ) ( not ( = ?auto_188956 ?auto_188959 ) ) ( not ( = ?auto_188956 ?auto_188960 ) ) ( not ( = ?auto_188957 ?auto_188958 ) ) ( not ( = ?auto_188957 ?auto_188959 ) ) ( not ( = ?auto_188957 ?auto_188960 ) ) ( not ( = ?auto_188958 ?auto_188959 ) ) ( not ( = ?auto_188958 ?auto_188960 ) ) ( not ( = ?auto_188959 ?auto_188960 ) ) ( CLEAR ?auto_188957 ) ( ON ?auto_188958 ?auto_188959 ) ( CLEAR ?auto_188958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188956 ?auto_188957 ?auto_188958 )
      ( MAKE-4PILE ?auto_188956 ?auto_188957 ?auto_188958 ?auto_188959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188965 - BLOCK
      ?auto_188966 - BLOCK
      ?auto_188967 - BLOCK
      ?auto_188968 - BLOCK
    )
    :vars
    (
      ?auto_188969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188968 ?auto_188969 ) ( ON-TABLE ?auto_188965 ) ( ON ?auto_188966 ?auto_188965 ) ( not ( = ?auto_188965 ?auto_188966 ) ) ( not ( = ?auto_188965 ?auto_188967 ) ) ( not ( = ?auto_188965 ?auto_188968 ) ) ( not ( = ?auto_188965 ?auto_188969 ) ) ( not ( = ?auto_188966 ?auto_188967 ) ) ( not ( = ?auto_188966 ?auto_188968 ) ) ( not ( = ?auto_188966 ?auto_188969 ) ) ( not ( = ?auto_188967 ?auto_188968 ) ) ( not ( = ?auto_188967 ?auto_188969 ) ) ( not ( = ?auto_188968 ?auto_188969 ) ) ( CLEAR ?auto_188966 ) ( ON ?auto_188967 ?auto_188968 ) ( CLEAR ?auto_188967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188965 ?auto_188966 ?auto_188967 )
      ( MAKE-4PILE ?auto_188965 ?auto_188966 ?auto_188967 ?auto_188968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188974 - BLOCK
      ?auto_188975 - BLOCK
      ?auto_188976 - BLOCK
      ?auto_188977 - BLOCK
    )
    :vars
    (
      ?auto_188978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188977 ?auto_188978 ) ( ON-TABLE ?auto_188974 ) ( not ( = ?auto_188974 ?auto_188975 ) ) ( not ( = ?auto_188974 ?auto_188976 ) ) ( not ( = ?auto_188974 ?auto_188977 ) ) ( not ( = ?auto_188974 ?auto_188978 ) ) ( not ( = ?auto_188975 ?auto_188976 ) ) ( not ( = ?auto_188975 ?auto_188977 ) ) ( not ( = ?auto_188975 ?auto_188978 ) ) ( not ( = ?auto_188976 ?auto_188977 ) ) ( not ( = ?auto_188976 ?auto_188978 ) ) ( not ( = ?auto_188977 ?auto_188978 ) ) ( ON ?auto_188976 ?auto_188977 ) ( CLEAR ?auto_188974 ) ( ON ?auto_188975 ?auto_188976 ) ( CLEAR ?auto_188975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188974 ?auto_188975 )
      ( MAKE-4PILE ?auto_188974 ?auto_188975 ?auto_188976 ?auto_188977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188983 - BLOCK
      ?auto_188984 - BLOCK
      ?auto_188985 - BLOCK
      ?auto_188986 - BLOCK
    )
    :vars
    (
      ?auto_188987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188986 ?auto_188987 ) ( ON-TABLE ?auto_188983 ) ( not ( = ?auto_188983 ?auto_188984 ) ) ( not ( = ?auto_188983 ?auto_188985 ) ) ( not ( = ?auto_188983 ?auto_188986 ) ) ( not ( = ?auto_188983 ?auto_188987 ) ) ( not ( = ?auto_188984 ?auto_188985 ) ) ( not ( = ?auto_188984 ?auto_188986 ) ) ( not ( = ?auto_188984 ?auto_188987 ) ) ( not ( = ?auto_188985 ?auto_188986 ) ) ( not ( = ?auto_188985 ?auto_188987 ) ) ( not ( = ?auto_188986 ?auto_188987 ) ) ( ON ?auto_188985 ?auto_188986 ) ( CLEAR ?auto_188983 ) ( ON ?auto_188984 ?auto_188985 ) ( CLEAR ?auto_188984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188983 ?auto_188984 )
      ( MAKE-4PILE ?auto_188983 ?auto_188984 ?auto_188985 ?auto_188986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_188992 - BLOCK
      ?auto_188993 - BLOCK
      ?auto_188994 - BLOCK
      ?auto_188995 - BLOCK
    )
    :vars
    (
      ?auto_188996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_188995 ?auto_188996 ) ( not ( = ?auto_188992 ?auto_188993 ) ) ( not ( = ?auto_188992 ?auto_188994 ) ) ( not ( = ?auto_188992 ?auto_188995 ) ) ( not ( = ?auto_188992 ?auto_188996 ) ) ( not ( = ?auto_188993 ?auto_188994 ) ) ( not ( = ?auto_188993 ?auto_188995 ) ) ( not ( = ?auto_188993 ?auto_188996 ) ) ( not ( = ?auto_188994 ?auto_188995 ) ) ( not ( = ?auto_188994 ?auto_188996 ) ) ( not ( = ?auto_188995 ?auto_188996 ) ) ( ON ?auto_188994 ?auto_188995 ) ( ON ?auto_188993 ?auto_188994 ) ( ON ?auto_188992 ?auto_188993 ) ( CLEAR ?auto_188992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188992 )
      ( MAKE-4PILE ?auto_188992 ?auto_188993 ?auto_188994 ?auto_188995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_189001 - BLOCK
      ?auto_189002 - BLOCK
      ?auto_189003 - BLOCK
      ?auto_189004 - BLOCK
    )
    :vars
    (
      ?auto_189005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189004 ?auto_189005 ) ( not ( = ?auto_189001 ?auto_189002 ) ) ( not ( = ?auto_189001 ?auto_189003 ) ) ( not ( = ?auto_189001 ?auto_189004 ) ) ( not ( = ?auto_189001 ?auto_189005 ) ) ( not ( = ?auto_189002 ?auto_189003 ) ) ( not ( = ?auto_189002 ?auto_189004 ) ) ( not ( = ?auto_189002 ?auto_189005 ) ) ( not ( = ?auto_189003 ?auto_189004 ) ) ( not ( = ?auto_189003 ?auto_189005 ) ) ( not ( = ?auto_189004 ?auto_189005 ) ) ( ON ?auto_189003 ?auto_189004 ) ( ON ?auto_189002 ?auto_189003 ) ( ON ?auto_189001 ?auto_189002 ) ( CLEAR ?auto_189001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189001 )
      ( MAKE-4PILE ?auto_189001 ?auto_189002 ?auto_189003 ?auto_189004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189011 - BLOCK
      ?auto_189012 - BLOCK
      ?auto_189013 - BLOCK
      ?auto_189014 - BLOCK
      ?auto_189015 - BLOCK
    )
    :vars
    (
      ?auto_189016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189014 ) ( ON ?auto_189015 ?auto_189016 ) ( CLEAR ?auto_189015 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189011 ) ( ON ?auto_189012 ?auto_189011 ) ( ON ?auto_189013 ?auto_189012 ) ( ON ?auto_189014 ?auto_189013 ) ( not ( = ?auto_189011 ?auto_189012 ) ) ( not ( = ?auto_189011 ?auto_189013 ) ) ( not ( = ?auto_189011 ?auto_189014 ) ) ( not ( = ?auto_189011 ?auto_189015 ) ) ( not ( = ?auto_189011 ?auto_189016 ) ) ( not ( = ?auto_189012 ?auto_189013 ) ) ( not ( = ?auto_189012 ?auto_189014 ) ) ( not ( = ?auto_189012 ?auto_189015 ) ) ( not ( = ?auto_189012 ?auto_189016 ) ) ( not ( = ?auto_189013 ?auto_189014 ) ) ( not ( = ?auto_189013 ?auto_189015 ) ) ( not ( = ?auto_189013 ?auto_189016 ) ) ( not ( = ?auto_189014 ?auto_189015 ) ) ( not ( = ?auto_189014 ?auto_189016 ) ) ( not ( = ?auto_189015 ?auto_189016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189015 ?auto_189016 )
      ( !STACK ?auto_189015 ?auto_189014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189022 - BLOCK
      ?auto_189023 - BLOCK
      ?auto_189024 - BLOCK
      ?auto_189025 - BLOCK
      ?auto_189026 - BLOCK
    )
    :vars
    (
      ?auto_189027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189025 ) ( ON ?auto_189026 ?auto_189027 ) ( CLEAR ?auto_189026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189022 ) ( ON ?auto_189023 ?auto_189022 ) ( ON ?auto_189024 ?auto_189023 ) ( ON ?auto_189025 ?auto_189024 ) ( not ( = ?auto_189022 ?auto_189023 ) ) ( not ( = ?auto_189022 ?auto_189024 ) ) ( not ( = ?auto_189022 ?auto_189025 ) ) ( not ( = ?auto_189022 ?auto_189026 ) ) ( not ( = ?auto_189022 ?auto_189027 ) ) ( not ( = ?auto_189023 ?auto_189024 ) ) ( not ( = ?auto_189023 ?auto_189025 ) ) ( not ( = ?auto_189023 ?auto_189026 ) ) ( not ( = ?auto_189023 ?auto_189027 ) ) ( not ( = ?auto_189024 ?auto_189025 ) ) ( not ( = ?auto_189024 ?auto_189026 ) ) ( not ( = ?auto_189024 ?auto_189027 ) ) ( not ( = ?auto_189025 ?auto_189026 ) ) ( not ( = ?auto_189025 ?auto_189027 ) ) ( not ( = ?auto_189026 ?auto_189027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189026 ?auto_189027 )
      ( !STACK ?auto_189026 ?auto_189025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189033 - BLOCK
      ?auto_189034 - BLOCK
      ?auto_189035 - BLOCK
      ?auto_189036 - BLOCK
      ?auto_189037 - BLOCK
    )
    :vars
    (
      ?auto_189038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189037 ?auto_189038 ) ( ON-TABLE ?auto_189033 ) ( ON ?auto_189034 ?auto_189033 ) ( ON ?auto_189035 ?auto_189034 ) ( not ( = ?auto_189033 ?auto_189034 ) ) ( not ( = ?auto_189033 ?auto_189035 ) ) ( not ( = ?auto_189033 ?auto_189036 ) ) ( not ( = ?auto_189033 ?auto_189037 ) ) ( not ( = ?auto_189033 ?auto_189038 ) ) ( not ( = ?auto_189034 ?auto_189035 ) ) ( not ( = ?auto_189034 ?auto_189036 ) ) ( not ( = ?auto_189034 ?auto_189037 ) ) ( not ( = ?auto_189034 ?auto_189038 ) ) ( not ( = ?auto_189035 ?auto_189036 ) ) ( not ( = ?auto_189035 ?auto_189037 ) ) ( not ( = ?auto_189035 ?auto_189038 ) ) ( not ( = ?auto_189036 ?auto_189037 ) ) ( not ( = ?auto_189036 ?auto_189038 ) ) ( not ( = ?auto_189037 ?auto_189038 ) ) ( CLEAR ?auto_189035 ) ( ON ?auto_189036 ?auto_189037 ) ( CLEAR ?auto_189036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189033 ?auto_189034 ?auto_189035 ?auto_189036 )
      ( MAKE-5PILE ?auto_189033 ?auto_189034 ?auto_189035 ?auto_189036 ?auto_189037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189044 - BLOCK
      ?auto_189045 - BLOCK
      ?auto_189046 - BLOCK
      ?auto_189047 - BLOCK
      ?auto_189048 - BLOCK
    )
    :vars
    (
      ?auto_189049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189048 ?auto_189049 ) ( ON-TABLE ?auto_189044 ) ( ON ?auto_189045 ?auto_189044 ) ( ON ?auto_189046 ?auto_189045 ) ( not ( = ?auto_189044 ?auto_189045 ) ) ( not ( = ?auto_189044 ?auto_189046 ) ) ( not ( = ?auto_189044 ?auto_189047 ) ) ( not ( = ?auto_189044 ?auto_189048 ) ) ( not ( = ?auto_189044 ?auto_189049 ) ) ( not ( = ?auto_189045 ?auto_189046 ) ) ( not ( = ?auto_189045 ?auto_189047 ) ) ( not ( = ?auto_189045 ?auto_189048 ) ) ( not ( = ?auto_189045 ?auto_189049 ) ) ( not ( = ?auto_189046 ?auto_189047 ) ) ( not ( = ?auto_189046 ?auto_189048 ) ) ( not ( = ?auto_189046 ?auto_189049 ) ) ( not ( = ?auto_189047 ?auto_189048 ) ) ( not ( = ?auto_189047 ?auto_189049 ) ) ( not ( = ?auto_189048 ?auto_189049 ) ) ( CLEAR ?auto_189046 ) ( ON ?auto_189047 ?auto_189048 ) ( CLEAR ?auto_189047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189044 ?auto_189045 ?auto_189046 ?auto_189047 )
      ( MAKE-5PILE ?auto_189044 ?auto_189045 ?auto_189046 ?auto_189047 ?auto_189048 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189055 - BLOCK
      ?auto_189056 - BLOCK
      ?auto_189057 - BLOCK
      ?auto_189058 - BLOCK
      ?auto_189059 - BLOCK
    )
    :vars
    (
      ?auto_189060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189059 ?auto_189060 ) ( ON-TABLE ?auto_189055 ) ( ON ?auto_189056 ?auto_189055 ) ( not ( = ?auto_189055 ?auto_189056 ) ) ( not ( = ?auto_189055 ?auto_189057 ) ) ( not ( = ?auto_189055 ?auto_189058 ) ) ( not ( = ?auto_189055 ?auto_189059 ) ) ( not ( = ?auto_189055 ?auto_189060 ) ) ( not ( = ?auto_189056 ?auto_189057 ) ) ( not ( = ?auto_189056 ?auto_189058 ) ) ( not ( = ?auto_189056 ?auto_189059 ) ) ( not ( = ?auto_189056 ?auto_189060 ) ) ( not ( = ?auto_189057 ?auto_189058 ) ) ( not ( = ?auto_189057 ?auto_189059 ) ) ( not ( = ?auto_189057 ?auto_189060 ) ) ( not ( = ?auto_189058 ?auto_189059 ) ) ( not ( = ?auto_189058 ?auto_189060 ) ) ( not ( = ?auto_189059 ?auto_189060 ) ) ( ON ?auto_189058 ?auto_189059 ) ( CLEAR ?auto_189056 ) ( ON ?auto_189057 ?auto_189058 ) ( CLEAR ?auto_189057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189055 ?auto_189056 ?auto_189057 )
      ( MAKE-5PILE ?auto_189055 ?auto_189056 ?auto_189057 ?auto_189058 ?auto_189059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189066 - BLOCK
      ?auto_189067 - BLOCK
      ?auto_189068 - BLOCK
      ?auto_189069 - BLOCK
      ?auto_189070 - BLOCK
    )
    :vars
    (
      ?auto_189071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189070 ?auto_189071 ) ( ON-TABLE ?auto_189066 ) ( ON ?auto_189067 ?auto_189066 ) ( not ( = ?auto_189066 ?auto_189067 ) ) ( not ( = ?auto_189066 ?auto_189068 ) ) ( not ( = ?auto_189066 ?auto_189069 ) ) ( not ( = ?auto_189066 ?auto_189070 ) ) ( not ( = ?auto_189066 ?auto_189071 ) ) ( not ( = ?auto_189067 ?auto_189068 ) ) ( not ( = ?auto_189067 ?auto_189069 ) ) ( not ( = ?auto_189067 ?auto_189070 ) ) ( not ( = ?auto_189067 ?auto_189071 ) ) ( not ( = ?auto_189068 ?auto_189069 ) ) ( not ( = ?auto_189068 ?auto_189070 ) ) ( not ( = ?auto_189068 ?auto_189071 ) ) ( not ( = ?auto_189069 ?auto_189070 ) ) ( not ( = ?auto_189069 ?auto_189071 ) ) ( not ( = ?auto_189070 ?auto_189071 ) ) ( ON ?auto_189069 ?auto_189070 ) ( CLEAR ?auto_189067 ) ( ON ?auto_189068 ?auto_189069 ) ( CLEAR ?auto_189068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189066 ?auto_189067 ?auto_189068 )
      ( MAKE-5PILE ?auto_189066 ?auto_189067 ?auto_189068 ?auto_189069 ?auto_189070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189077 - BLOCK
      ?auto_189078 - BLOCK
      ?auto_189079 - BLOCK
      ?auto_189080 - BLOCK
      ?auto_189081 - BLOCK
    )
    :vars
    (
      ?auto_189082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189081 ?auto_189082 ) ( ON-TABLE ?auto_189077 ) ( not ( = ?auto_189077 ?auto_189078 ) ) ( not ( = ?auto_189077 ?auto_189079 ) ) ( not ( = ?auto_189077 ?auto_189080 ) ) ( not ( = ?auto_189077 ?auto_189081 ) ) ( not ( = ?auto_189077 ?auto_189082 ) ) ( not ( = ?auto_189078 ?auto_189079 ) ) ( not ( = ?auto_189078 ?auto_189080 ) ) ( not ( = ?auto_189078 ?auto_189081 ) ) ( not ( = ?auto_189078 ?auto_189082 ) ) ( not ( = ?auto_189079 ?auto_189080 ) ) ( not ( = ?auto_189079 ?auto_189081 ) ) ( not ( = ?auto_189079 ?auto_189082 ) ) ( not ( = ?auto_189080 ?auto_189081 ) ) ( not ( = ?auto_189080 ?auto_189082 ) ) ( not ( = ?auto_189081 ?auto_189082 ) ) ( ON ?auto_189080 ?auto_189081 ) ( ON ?auto_189079 ?auto_189080 ) ( CLEAR ?auto_189077 ) ( ON ?auto_189078 ?auto_189079 ) ( CLEAR ?auto_189078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189077 ?auto_189078 )
      ( MAKE-5PILE ?auto_189077 ?auto_189078 ?auto_189079 ?auto_189080 ?auto_189081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189088 - BLOCK
      ?auto_189089 - BLOCK
      ?auto_189090 - BLOCK
      ?auto_189091 - BLOCK
      ?auto_189092 - BLOCK
    )
    :vars
    (
      ?auto_189093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189092 ?auto_189093 ) ( ON-TABLE ?auto_189088 ) ( not ( = ?auto_189088 ?auto_189089 ) ) ( not ( = ?auto_189088 ?auto_189090 ) ) ( not ( = ?auto_189088 ?auto_189091 ) ) ( not ( = ?auto_189088 ?auto_189092 ) ) ( not ( = ?auto_189088 ?auto_189093 ) ) ( not ( = ?auto_189089 ?auto_189090 ) ) ( not ( = ?auto_189089 ?auto_189091 ) ) ( not ( = ?auto_189089 ?auto_189092 ) ) ( not ( = ?auto_189089 ?auto_189093 ) ) ( not ( = ?auto_189090 ?auto_189091 ) ) ( not ( = ?auto_189090 ?auto_189092 ) ) ( not ( = ?auto_189090 ?auto_189093 ) ) ( not ( = ?auto_189091 ?auto_189092 ) ) ( not ( = ?auto_189091 ?auto_189093 ) ) ( not ( = ?auto_189092 ?auto_189093 ) ) ( ON ?auto_189091 ?auto_189092 ) ( ON ?auto_189090 ?auto_189091 ) ( CLEAR ?auto_189088 ) ( ON ?auto_189089 ?auto_189090 ) ( CLEAR ?auto_189089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189088 ?auto_189089 )
      ( MAKE-5PILE ?auto_189088 ?auto_189089 ?auto_189090 ?auto_189091 ?auto_189092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189099 - BLOCK
      ?auto_189100 - BLOCK
      ?auto_189101 - BLOCK
      ?auto_189102 - BLOCK
      ?auto_189103 - BLOCK
    )
    :vars
    (
      ?auto_189104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189103 ?auto_189104 ) ( not ( = ?auto_189099 ?auto_189100 ) ) ( not ( = ?auto_189099 ?auto_189101 ) ) ( not ( = ?auto_189099 ?auto_189102 ) ) ( not ( = ?auto_189099 ?auto_189103 ) ) ( not ( = ?auto_189099 ?auto_189104 ) ) ( not ( = ?auto_189100 ?auto_189101 ) ) ( not ( = ?auto_189100 ?auto_189102 ) ) ( not ( = ?auto_189100 ?auto_189103 ) ) ( not ( = ?auto_189100 ?auto_189104 ) ) ( not ( = ?auto_189101 ?auto_189102 ) ) ( not ( = ?auto_189101 ?auto_189103 ) ) ( not ( = ?auto_189101 ?auto_189104 ) ) ( not ( = ?auto_189102 ?auto_189103 ) ) ( not ( = ?auto_189102 ?auto_189104 ) ) ( not ( = ?auto_189103 ?auto_189104 ) ) ( ON ?auto_189102 ?auto_189103 ) ( ON ?auto_189101 ?auto_189102 ) ( ON ?auto_189100 ?auto_189101 ) ( ON ?auto_189099 ?auto_189100 ) ( CLEAR ?auto_189099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189099 )
      ( MAKE-5PILE ?auto_189099 ?auto_189100 ?auto_189101 ?auto_189102 ?auto_189103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_189110 - BLOCK
      ?auto_189111 - BLOCK
      ?auto_189112 - BLOCK
      ?auto_189113 - BLOCK
      ?auto_189114 - BLOCK
    )
    :vars
    (
      ?auto_189115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189114 ?auto_189115 ) ( not ( = ?auto_189110 ?auto_189111 ) ) ( not ( = ?auto_189110 ?auto_189112 ) ) ( not ( = ?auto_189110 ?auto_189113 ) ) ( not ( = ?auto_189110 ?auto_189114 ) ) ( not ( = ?auto_189110 ?auto_189115 ) ) ( not ( = ?auto_189111 ?auto_189112 ) ) ( not ( = ?auto_189111 ?auto_189113 ) ) ( not ( = ?auto_189111 ?auto_189114 ) ) ( not ( = ?auto_189111 ?auto_189115 ) ) ( not ( = ?auto_189112 ?auto_189113 ) ) ( not ( = ?auto_189112 ?auto_189114 ) ) ( not ( = ?auto_189112 ?auto_189115 ) ) ( not ( = ?auto_189113 ?auto_189114 ) ) ( not ( = ?auto_189113 ?auto_189115 ) ) ( not ( = ?auto_189114 ?auto_189115 ) ) ( ON ?auto_189113 ?auto_189114 ) ( ON ?auto_189112 ?auto_189113 ) ( ON ?auto_189111 ?auto_189112 ) ( ON ?auto_189110 ?auto_189111 ) ( CLEAR ?auto_189110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189110 )
      ( MAKE-5PILE ?auto_189110 ?auto_189111 ?auto_189112 ?auto_189113 ?auto_189114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189122 - BLOCK
      ?auto_189123 - BLOCK
      ?auto_189124 - BLOCK
      ?auto_189125 - BLOCK
      ?auto_189126 - BLOCK
      ?auto_189127 - BLOCK
    )
    :vars
    (
      ?auto_189128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189126 ) ( ON ?auto_189127 ?auto_189128 ) ( CLEAR ?auto_189127 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189122 ) ( ON ?auto_189123 ?auto_189122 ) ( ON ?auto_189124 ?auto_189123 ) ( ON ?auto_189125 ?auto_189124 ) ( ON ?auto_189126 ?auto_189125 ) ( not ( = ?auto_189122 ?auto_189123 ) ) ( not ( = ?auto_189122 ?auto_189124 ) ) ( not ( = ?auto_189122 ?auto_189125 ) ) ( not ( = ?auto_189122 ?auto_189126 ) ) ( not ( = ?auto_189122 ?auto_189127 ) ) ( not ( = ?auto_189122 ?auto_189128 ) ) ( not ( = ?auto_189123 ?auto_189124 ) ) ( not ( = ?auto_189123 ?auto_189125 ) ) ( not ( = ?auto_189123 ?auto_189126 ) ) ( not ( = ?auto_189123 ?auto_189127 ) ) ( not ( = ?auto_189123 ?auto_189128 ) ) ( not ( = ?auto_189124 ?auto_189125 ) ) ( not ( = ?auto_189124 ?auto_189126 ) ) ( not ( = ?auto_189124 ?auto_189127 ) ) ( not ( = ?auto_189124 ?auto_189128 ) ) ( not ( = ?auto_189125 ?auto_189126 ) ) ( not ( = ?auto_189125 ?auto_189127 ) ) ( not ( = ?auto_189125 ?auto_189128 ) ) ( not ( = ?auto_189126 ?auto_189127 ) ) ( not ( = ?auto_189126 ?auto_189128 ) ) ( not ( = ?auto_189127 ?auto_189128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189127 ?auto_189128 )
      ( !STACK ?auto_189127 ?auto_189126 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189135 - BLOCK
      ?auto_189136 - BLOCK
      ?auto_189137 - BLOCK
      ?auto_189138 - BLOCK
      ?auto_189139 - BLOCK
      ?auto_189140 - BLOCK
    )
    :vars
    (
      ?auto_189141 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189139 ) ( ON ?auto_189140 ?auto_189141 ) ( CLEAR ?auto_189140 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189135 ) ( ON ?auto_189136 ?auto_189135 ) ( ON ?auto_189137 ?auto_189136 ) ( ON ?auto_189138 ?auto_189137 ) ( ON ?auto_189139 ?auto_189138 ) ( not ( = ?auto_189135 ?auto_189136 ) ) ( not ( = ?auto_189135 ?auto_189137 ) ) ( not ( = ?auto_189135 ?auto_189138 ) ) ( not ( = ?auto_189135 ?auto_189139 ) ) ( not ( = ?auto_189135 ?auto_189140 ) ) ( not ( = ?auto_189135 ?auto_189141 ) ) ( not ( = ?auto_189136 ?auto_189137 ) ) ( not ( = ?auto_189136 ?auto_189138 ) ) ( not ( = ?auto_189136 ?auto_189139 ) ) ( not ( = ?auto_189136 ?auto_189140 ) ) ( not ( = ?auto_189136 ?auto_189141 ) ) ( not ( = ?auto_189137 ?auto_189138 ) ) ( not ( = ?auto_189137 ?auto_189139 ) ) ( not ( = ?auto_189137 ?auto_189140 ) ) ( not ( = ?auto_189137 ?auto_189141 ) ) ( not ( = ?auto_189138 ?auto_189139 ) ) ( not ( = ?auto_189138 ?auto_189140 ) ) ( not ( = ?auto_189138 ?auto_189141 ) ) ( not ( = ?auto_189139 ?auto_189140 ) ) ( not ( = ?auto_189139 ?auto_189141 ) ) ( not ( = ?auto_189140 ?auto_189141 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189140 ?auto_189141 )
      ( !STACK ?auto_189140 ?auto_189139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189148 - BLOCK
      ?auto_189149 - BLOCK
      ?auto_189150 - BLOCK
      ?auto_189151 - BLOCK
      ?auto_189152 - BLOCK
      ?auto_189153 - BLOCK
    )
    :vars
    (
      ?auto_189154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189153 ?auto_189154 ) ( ON-TABLE ?auto_189148 ) ( ON ?auto_189149 ?auto_189148 ) ( ON ?auto_189150 ?auto_189149 ) ( ON ?auto_189151 ?auto_189150 ) ( not ( = ?auto_189148 ?auto_189149 ) ) ( not ( = ?auto_189148 ?auto_189150 ) ) ( not ( = ?auto_189148 ?auto_189151 ) ) ( not ( = ?auto_189148 ?auto_189152 ) ) ( not ( = ?auto_189148 ?auto_189153 ) ) ( not ( = ?auto_189148 ?auto_189154 ) ) ( not ( = ?auto_189149 ?auto_189150 ) ) ( not ( = ?auto_189149 ?auto_189151 ) ) ( not ( = ?auto_189149 ?auto_189152 ) ) ( not ( = ?auto_189149 ?auto_189153 ) ) ( not ( = ?auto_189149 ?auto_189154 ) ) ( not ( = ?auto_189150 ?auto_189151 ) ) ( not ( = ?auto_189150 ?auto_189152 ) ) ( not ( = ?auto_189150 ?auto_189153 ) ) ( not ( = ?auto_189150 ?auto_189154 ) ) ( not ( = ?auto_189151 ?auto_189152 ) ) ( not ( = ?auto_189151 ?auto_189153 ) ) ( not ( = ?auto_189151 ?auto_189154 ) ) ( not ( = ?auto_189152 ?auto_189153 ) ) ( not ( = ?auto_189152 ?auto_189154 ) ) ( not ( = ?auto_189153 ?auto_189154 ) ) ( CLEAR ?auto_189151 ) ( ON ?auto_189152 ?auto_189153 ) ( CLEAR ?auto_189152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189148 ?auto_189149 ?auto_189150 ?auto_189151 ?auto_189152 )
      ( MAKE-6PILE ?auto_189148 ?auto_189149 ?auto_189150 ?auto_189151 ?auto_189152 ?auto_189153 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189161 - BLOCK
      ?auto_189162 - BLOCK
      ?auto_189163 - BLOCK
      ?auto_189164 - BLOCK
      ?auto_189165 - BLOCK
      ?auto_189166 - BLOCK
    )
    :vars
    (
      ?auto_189167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189166 ?auto_189167 ) ( ON-TABLE ?auto_189161 ) ( ON ?auto_189162 ?auto_189161 ) ( ON ?auto_189163 ?auto_189162 ) ( ON ?auto_189164 ?auto_189163 ) ( not ( = ?auto_189161 ?auto_189162 ) ) ( not ( = ?auto_189161 ?auto_189163 ) ) ( not ( = ?auto_189161 ?auto_189164 ) ) ( not ( = ?auto_189161 ?auto_189165 ) ) ( not ( = ?auto_189161 ?auto_189166 ) ) ( not ( = ?auto_189161 ?auto_189167 ) ) ( not ( = ?auto_189162 ?auto_189163 ) ) ( not ( = ?auto_189162 ?auto_189164 ) ) ( not ( = ?auto_189162 ?auto_189165 ) ) ( not ( = ?auto_189162 ?auto_189166 ) ) ( not ( = ?auto_189162 ?auto_189167 ) ) ( not ( = ?auto_189163 ?auto_189164 ) ) ( not ( = ?auto_189163 ?auto_189165 ) ) ( not ( = ?auto_189163 ?auto_189166 ) ) ( not ( = ?auto_189163 ?auto_189167 ) ) ( not ( = ?auto_189164 ?auto_189165 ) ) ( not ( = ?auto_189164 ?auto_189166 ) ) ( not ( = ?auto_189164 ?auto_189167 ) ) ( not ( = ?auto_189165 ?auto_189166 ) ) ( not ( = ?auto_189165 ?auto_189167 ) ) ( not ( = ?auto_189166 ?auto_189167 ) ) ( CLEAR ?auto_189164 ) ( ON ?auto_189165 ?auto_189166 ) ( CLEAR ?auto_189165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189161 ?auto_189162 ?auto_189163 ?auto_189164 ?auto_189165 )
      ( MAKE-6PILE ?auto_189161 ?auto_189162 ?auto_189163 ?auto_189164 ?auto_189165 ?auto_189166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189174 - BLOCK
      ?auto_189175 - BLOCK
      ?auto_189176 - BLOCK
      ?auto_189177 - BLOCK
      ?auto_189178 - BLOCK
      ?auto_189179 - BLOCK
    )
    :vars
    (
      ?auto_189180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189179 ?auto_189180 ) ( ON-TABLE ?auto_189174 ) ( ON ?auto_189175 ?auto_189174 ) ( ON ?auto_189176 ?auto_189175 ) ( not ( = ?auto_189174 ?auto_189175 ) ) ( not ( = ?auto_189174 ?auto_189176 ) ) ( not ( = ?auto_189174 ?auto_189177 ) ) ( not ( = ?auto_189174 ?auto_189178 ) ) ( not ( = ?auto_189174 ?auto_189179 ) ) ( not ( = ?auto_189174 ?auto_189180 ) ) ( not ( = ?auto_189175 ?auto_189176 ) ) ( not ( = ?auto_189175 ?auto_189177 ) ) ( not ( = ?auto_189175 ?auto_189178 ) ) ( not ( = ?auto_189175 ?auto_189179 ) ) ( not ( = ?auto_189175 ?auto_189180 ) ) ( not ( = ?auto_189176 ?auto_189177 ) ) ( not ( = ?auto_189176 ?auto_189178 ) ) ( not ( = ?auto_189176 ?auto_189179 ) ) ( not ( = ?auto_189176 ?auto_189180 ) ) ( not ( = ?auto_189177 ?auto_189178 ) ) ( not ( = ?auto_189177 ?auto_189179 ) ) ( not ( = ?auto_189177 ?auto_189180 ) ) ( not ( = ?auto_189178 ?auto_189179 ) ) ( not ( = ?auto_189178 ?auto_189180 ) ) ( not ( = ?auto_189179 ?auto_189180 ) ) ( ON ?auto_189178 ?auto_189179 ) ( CLEAR ?auto_189176 ) ( ON ?auto_189177 ?auto_189178 ) ( CLEAR ?auto_189177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189174 ?auto_189175 ?auto_189176 ?auto_189177 )
      ( MAKE-6PILE ?auto_189174 ?auto_189175 ?auto_189176 ?auto_189177 ?auto_189178 ?auto_189179 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189187 - BLOCK
      ?auto_189188 - BLOCK
      ?auto_189189 - BLOCK
      ?auto_189190 - BLOCK
      ?auto_189191 - BLOCK
      ?auto_189192 - BLOCK
    )
    :vars
    (
      ?auto_189193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189192 ?auto_189193 ) ( ON-TABLE ?auto_189187 ) ( ON ?auto_189188 ?auto_189187 ) ( ON ?auto_189189 ?auto_189188 ) ( not ( = ?auto_189187 ?auto_189188 ) ) ( not ( = ?auto_189187 ?auto_189189 ) ) ( not ( = ?auto_189187 ?auto_189190 ) ) ( not ( = ?auto_189187 ?auto_189191 ) ) ( not ( = ?auto_189187 ?auto_189192 ) ) ( not ( = ?auto_189187 ?auto_189193 ) ) ( not ( = ?auto_189188 ?auto_189189 ) ) ( not ( = ?auto_189188 ?auto_189190 ) ) ( not ( = ?auto_189188 ?auto_189191 ) ) ( not ( = ?auto_189188 ?auto_189192 ) ) ( not ( = ?auto_189188 ?auto_189193 ) ) ( not ( = ?auto_189189 ?auto_189190 ) ) ( not ( = ?auto_189189 ?auto_189191 ) ) ( not ( = ?auto_189189 ?auto_189192 ) ) ( not ( = ?auto_189189 ?auto_189193 ) ) ( not ( = ?auto_189190 ?auto_189191 ) ) ( not ( = ?auto_189190 ?auto_189192 ) ) ( not ( = ?auto_189190 ?auto_189193 ) ) ( not ( = ?auto_189191 ?auto_189192 ) ) ( not ( = ?auto_189191 ?auto_189193 ) ) ( not ( = ?auto_189192 ?auto_189193 ) ) ( ON ?auto_189191 ?auto_189192 ) ( CLEAR ?auto_189189 ) ( ON ?auto_189190 ?auto_189191 ) ( CLEAR ?auto_189190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189187 ?auto_189188 ?auto_189189 ?auto_189190 )
      ( MAKE-6PILE ?auto_189187 ?auto_189188 ?auto_189189 ?auto_189190 ?auto_189191 ?auto_189192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189200 - BLOCK
      ?auto_189201 - BLOCK
      ?auto_189202 - BLOCK
      ?auto_189203 - BLOCK
      ?auto_189204 - BLOCK
      ?auto_189205 - BLOCK
    )
    :vars
    (
      ?auto_189206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189205 ?auto_189206 ) ( ON-TABLE ?auto_189200 ) ( ON ?auto_189201 ?auto_189200 ) ( not ( = ?auto_189200 ?auto_189201 ) ) ( not ( = ?auto_189200 ?auto_189202 ) ) ( not ( = ?auto_189200 ?auto_189203 ) ) ( not ( = ?auto_189200 ?auto_189204 ) ) ( not ( = ?auto_189200 ?auto_189205 ) ) ( not ( = ?auto_189200 ?auto_189206 ) ) ( not ( = ?auto_189201 ?auto_189202 ) ) ( not ( = ?auto_189201 ?auto_189203 ) ) ( not ( = ?auto_189201 ?auto_189204 ) ) ( not ( = ?auto_189201 ?auto_189205 ) ) ( not ( = ?auto_189201 ?auto_189206 ) ) ( not ( = ?auto_189202 ?auto_189203 ) ) ( not ( = ?auto_189202 ?auto_189204 ) ) ( not ( = ?auto_189202 ?auto_189205 ) ) ( not ( = ?auto_189202 ?auto_189206 ) ) ( not ( = ?auto_189203 ?auto_189204 ) ) ( not ( = ?auto_189203 ?auto_189205 ) ) ( not ( = ?auto_189203 ?auto_189206 ) ) ( not ( = ?auto_189204 ?auto_189205 ) ) ( not ( = ?auto_189204 ?auto_189206 ) ) ( not ( = ?auto_189205 ?auto_189206 ) ) ( ON ?auto_189204 ?auto_189205 ) ( ON ?auto_189203 ?auto_189204 ) ( CLEAR ?auto_189201 ) ( ON ?auto_189202 ?auto_189203 ) ( CLEAR ?auto_189202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189200 ?auto_189201 ?auto_189202 )
      ( MAKE-6PILE ?auto_189200 ?auto_189201 ?auto_189202 ?auto_189203 ?auto_189204 ?auto_189205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189213 - BLOCK
      ?auto_189214 - BLOCK
      ?auto_189215 - BLOCK
      ?auto_189216 - BLOCK
      ?auto_189217 - BLOCK
      ?auto_189218 - BLOCK
    )
    :vars
    (
      ?auto_189219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189218 ?auto_189219 ) ( ON-TABLE ?auto_189213 ) ( ON ?auto_189214 ?auto_189213 ) ( not ( = ?auto_189213 ?auto_189214 ) ) ( not ( = ?auto_189213 ?auto_189215 ) ) ( not ( = ?auto_189213 ?auto_189216 ) ) ( not ( = ?auto_189213 ?auto_189217 ) ) ( not ( = ?auto_189213 ?auto_189218 ) ) ( not ( = ?auto_189213 ?auto_189219 ) ) ( not ( = ?auto_189214 ?auto_189215 ) ) ( not ( = ?auto_189214 ?auto_189216 ) ) ( not ( = ?auto_189214 ?auto_189217 ) ) ( not ( = ?auto_189214 ?auto_189218 ) ) ( not ( = ?auto_189214 ?auto_189219 ) ) ( not ( = ?auto_189215 ?auto_189216 ) ) ( not ( = ?auto_189215 ?auto_189217 ) ) ( not ( = ?auto_189215 ?auto_189218 ) ) ( not ( = ?auto_189215 ?auto_189219 ) ) ( not ( = ?auto_189216 ?auto_189217 ) ) ( not ( = ?auto_189216 ?auto_189218 ) ) ( not ( = ?auto_189216 ?auto_189219 ) ) ( not ( = ?auto_189217 ?auto_189218 ) ) ( not ( = ?auto_189217 ?auto_189219 ) ) ( not ( = ?auto_189218 ?auto_189219 ) ) ( ON ?auto_189217 ?auto_189218 ) ( ON ?auto_189216 ?auto_189217 ) ( CLEAR ?auto_189214 ) ( ON ?auto_189215 ?auto_189216 ) ( CLEAR ?auto_189215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189213 ?auto_189214 ?auto_189215 )
      ( MAKE-6PILE ?auto_189213 ?auto_189214 ?auto_189215 ?auto_189216 ?auto_189217 ?auto_189218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189226 - BLOCK
      ?auto_189227 - BLOCK
      ?auto_189228 - BLOCK
      ?auto_189229 - BLOCK
      ?auto_189230 - BLOCK
      ?auto_189231 - BLOCK
    )
    :vars
    (
      ?auto_189232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189231 ?auto_189232 ) ( ON-TABLE ?auto_189226 ) ( not ( = ?auto_189226 ?auto_189227 ) ) ( not ( = ?auto_189226 ?auto_189228 ) ) ( not ( = ?auto_189226 ?auto_189229 ) ) ( not ( = ?auto_189226 ?auto_189230 ) ) ( not ( = ?auto_189226 ?auto_189231 ) ) ( not ( = ?auto_189226 ?auto_189232 ) ) ( not ( = ?auto_189227 ?auto_189228 ) ) ( not ( = ?auto_189227 ?auto_189229 ) ) ( not ( = ?auto_189227 ?auto_189230 ) ) ( not ( = ?auto_189227 ?auto_189231 ) ) ( not ( = ?auto_189227 ?auto_189232 ) ) ( not ( = ?auto_189228 ?auto_189229 ) ) ( not ( = ?auto_189228 ?auto_189230 ) ) ( not ( = ?auto_189228 ?auto_189231 ) ) ( not ( = ?auto_189228 ?auto_189232 ) ) ( not ( = ?auto_189229 ?auto_189230 ) ) ( not ( = ?auto_189229 ?auto_189231 ) ) ( not ( = ?auto_189229 ?auto_189232 ) ) ( not ( = ?auto_189230 ?auto_189231 ) ) ( not ( = ?auto_189230 ?auto_189232 ) ) ( not ( = ?auto_189231 ?auto_189232 ) ) ( ON ?auto_189230 ?auto_189231 ) ( ON ?auto_189229 ?auto_189230 ) ( ON ?auto_189228 ?auto_189229 ) ( CLEAR ?auto_189226 ) ( ON ?auto_189227 ?auto_189228 ) ( CLEAR ?auto_189227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189226 ?auto_189227 )
      ( MAKE-6PILE ?auto_189226 ?auto_189227 ?auto_189228 ?auto_189229 ?auto_189230 ?auto_189231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189239 - BLOCK
      ?auto_189240 - BLOCK
      ?auto_189241 - BLOCK
      ?auto_189242 - BLOCK
      ?auto_189243 - BLOCK
      ?auto_189244 - BLOCK
    )
    :vars
    (
      ?auto_189245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189244 ?auto_189245 ) ( ON-TABLE ?auto_189239 ) ( not ( = ?auto_189239 ?auto_189240 ) ) ( not ( = ?auto_189239 ?auto_189241 ) ) ( not ( = ?auto_189239 ?auto_189242 ) ) ( not ( = ?auto_189239 ?auto_189243 ) ) ( not ( = ?auto_189239 ?auto_189244 ) ) ( not ( = ?auto_189239 ?auto_189245 ) ) ( not ( = ?auto_189240 ?auto_189241 ) ) ( not ( = ?auto_189240 ?auto_189242 ) ) ( not ( = ?auto_189240 ?auto_189243 ) ) ( not ( = ?auto_189240 ?auto_189244 ) ) ( not ( = ?auto_189240 ?auto_189245 ) ) ( not ( = ?auto_189241 ?auto_189242 ) ) ( not ( = ?auto_189241 ?auto_189243 ) ) ( not ( = ?auto_189241 ?auto_189244 ) ) ( not ( = ?auto_189241 ?auto_189245 ) ) ( not ( = ?auto_189242 ?auto_189243 ) ) ( not ( = ?auto_189242 ?auto_189244 ) ) ( not ( = ?auto_189242 ?auto_189245 ) ) ( not ( = ?auto_189243 ?auto_189244 ) ) ( not ( = ?auto_189243 ?auto_189245 ) ) ( not ( = ?auto_189244 ?auto_189245 ) ) ( ON ?auto_189243 ?auto_189244 ) ( ON ?auto_189242 ?auto_189243 ) ( ON ?auto_189241 ?auto_189242 ) ( CLEAR ?auto_189239 ) ( ON ?auto_189240 ?auto_189241 ) ( CLEAR ?auto_189240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189239 ?auto_189240 )
      ( MAKE-6PILE ?auto_189239 ?auto_189240 ?auto_189241 ?auto_189242 ?auto_189243 ?auto_189244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189252 - BLOCK
      ?auto_189253 - BLOCK
      ?auto_189254 - BLOCK
      ?auto_189255 - BLOCK
      ?auto_189256 - BLOCK
      ?auto_189257 - BLOCK
    )
    :vars
    (
      ?auto_189258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189257 ?auto_189258 ) ( not ( = ?auto_189252 ?auto_189253 ) ) ( not ( = ?auto_189252 ?auto_189254 ) ) ( not ( = ?auto_189252 ?auto_189255 ) ) ( not ( = ?auto_189252 ?auto_189256 ) ) ( not ( = ?auto_189252 ?auto_189257 ) ) ( not ( = ?auto_189252 ?auto_189258 ) ) ( not ( = ?auto_189253 ?auto_189254 ) ) ( not ( = ?auto_189253 ?auto_189255 ) ) ( not ( = ?auto_189253 ?auto_189256 ) ) ( not ( = ?auto_189253 ?auto_189257 ) ) ( not ( = ?auto_189253 ?auto_189258 ) ) ( not ( = ?auto_189254 ?auto_189255 ) ) ( not ( = ?auto_189254 ?auto_189256 ) ) ( not ( = ?auto_189254 ?auto_189257 ) ) ( not ( = ?auto_189254 ?auto_189258 ) ) ( not ( = ?auto_189255 ?auto_189256 ) ) ( not ( = ?auto_189255 ?auto_189257 ) ) ( not ( = ?auto_189255 ?auto_189258 ) ) ( not ( = ?auto_189256 ?auto_189257 ) ) ( not ( = ?auto_189256 ?auto_189258 ) ) ( not ( = ?auto_189257 ?auto_189258 ) ) ( ON ?auto_189256 ?auto_189257 ) ( ON ?auto_189255 ?auto_189256 ) ( ON ?auto_189254 ?auto_189255 ) ( ON ?auto_189253 ?auto_189254 ) ( ON ?auto_189252 ?auto_189253 ) ( CLEAR ?auto_189252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189252 )
      ( MAKE-6PILE ?auto_189252 ?auto_189253 ?auto_189254 ?auto_189255 ?auto_189256 ?auto_189257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_189265 - BLOCK
      ?auto_189266 - BLOCK
      ?auto_189267 - BLOCK
      ?auto_189268 - BLOCK
      ?auto_189269 - BLOCK
      ?auto_189270 - BLOCK
    )
    :vars
    (
      ?auto_189271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189270 ?auto_189271 ) ( not ( = ?auto_189265 ?auto_189266 ) ) ( not ( = ?auto_189265 ?auto_189267 ) ) ( not ( = ?auto_189265 ?auto_189268 ) ) ( not ( = ?auto_189265 ?auto_189269 ) ) ( not ( = ?auto_189265 ?auto_189270 ) ) ( not ( = ?auto_189265 ?auto_189271 ) ) ( not ( = ?auto_189266 ?auto_189267 ) ) ( not ( = ?auto_189266 ?auto_189268 ) ) ( not ( = ?auto_189266 ?auto_189269 ) ) ( not ( = ?auto_189266 ?auto_189270 ) ) ( not ( = ?auto_189266 ?auto_189271 ) ) ( not ( = ?auto_189267 ?auto_189268 ) ) ( not ( = ?auto_189267 ?auto_189269 ) ) ( not ( = ?auto_189267 ?auto_189270 ) ) ( not ( = ?auto_189267 ?auto_189271 ) ) ( not ( = ?auto_189268 ?auto_189269 ) ) ( not ( = ?auto_189268 ?auto_189270 ) ) ( not ( = ?auto_189268 ?auto_189271 ) ) ( not ( = ?auto_189269 ?auto_189270 ) ) ( not ( = ?auto_189269 ?auto_189271 ) ) ( not ( = ?auto_189270 ?auto_189271 ) ) ( ON ?auto_189269 ?auto_189270 ) ( ON ?auto_189268 ?auto_189269 ) ( ON ?auto_189267 ?auto_189268 ) ( ON ?auto_189266 ?auto_189267 ) ( ON ?auto_189265 ?auto_189266 ) ( CLEAR ?auto_189265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189265 )
      ( MAKE-6PILE ?auto_189265 ?auto_189266 ?auto_189267 ?auto_189268 ?auto_189269 ?auto_189270 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189279 - BLOCK
      ?auto_189280 - BLOCK
      ?auto_189281 - BLOCK
      ?auto_189282 - BLOCK
      ?auto_189283 - BLOCK
      ?auto_189284 - BLOCK
      ?auto_189285 - BLOCK
    )
    :vars
    (
      ?auto_189286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189284 ) ( ON ?auto_189285 ?auto_189286 ) ( CLEAR ?auto_189285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189279 ) ( ON ?auto_189280 ?auto_189279 ) ( ON ?auto_189281 ?auto_189280 ) ( ON ?auto_189282 ?auto_189281 ) ( ON ?auto_189283 ?auto_189282 ) ( ON ?auto_189284 ?auto_189283 ) ( not ( = ?auto_189279 ?auto_189280 ) ) ( not ( = ?auto_189279 ?auto_189281 ) ) ( not ( = ?auto_189279 ?auto_189282 ) ) ( not ( = ?auto_189279 ?auto_189283 ) ) ( not ( = ?auto_189279 ?auto_189284 ) ) ( not ( = ?auto_189279 ?auto_189285 ) ) ( not ( = ?auto_189279 ?auto_189286 ) ) ( not ( = ?auto_189280 ?auto_189281 ) ) ( not ( = ?auto_189280 ?auto_189282 ) ) ( not ( = ?auto_189280 ?auto_189283 ) ) ( not ( = ?auto_189280 ?auto_189284 ) ) ( not ( = ?auto_189280 ?auto_189285 ) ) ( not ( = ?auto_189280 ?auto_189286 ) ) ( not ( = ?auto_189281 ?auto_189282 ) ) ( not ( = ?auto_189281 ?auto_189283 ) ) ( not ( = ?auto_189281 ?auto_189284 ) ) ( not ( = ?auto_189281 ?auto_189285 ) ) ( not ( = ?auto_189281 ?auto_189286 ) ) ( not ( = ?auto_189282 ?auto_189283 ) ) ( not ( = ?auto_189282 ?auto_189284 ) ) ( not ( = ?auto_189282 ?auto_189285 ) ) ( not ( = ?auto_189282 ?auto_189286 ) ) ( not ( = ?auto_189283 ?auto_189284 ) ) ( not ( = ?auto_189283 ?auto_189285 ) ) ( not ( = ?auto_189283 ?auto_189286 ) ) ( not ( = ?auto_189284 ?auto_189285 ) ) ( not ( = ?auto_189284 ?auto_189286 ) ) ( not ( = ?auto_189285 ?auto_189286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189285 ?auto_189286 )
      ( !STACK ?auto_189285 ?auto_189284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189294 - BLOCK
      ?auto_189295 - BLOCK
      ?auto_189296 - BLOCK
      ?auto_189297 - BLOCK
      ?auto_189298 - BLOCK
      ?auto_189299 - BLOCK
      ?auto_189300 - BLOCK
    )
    :vars
    (
      ?auto_189301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189299 ) ( ON ?auto_189300 ?auto_189301 ) ( CLEAR ?auto_189300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189294 ) ( ON ?auto_189295 ?auto_189294 ) ( ON ?auto_189296 ?auto_189295 ) ( ON ?auto_189297 ?auto_189296 ) ( ON ?auto_189298 ?auto_189297 ) ( ON ?auto_189299 ?auto_189298 ) ( not ( = ?auto_189294 ?auto_189295 ) ) ( not ( = ?auto_189294 ?auto_189296 ) ) ( not ( = ?auto_189294 ?auto_189297 ) ) ( not ( = ?auto_189294 ?auto_189298 ) ) ( not ( = ?auto_189294 ?auto_189299 ) ) ( not ( = ?auto_189294 ?auto_189300 ) ) ( not ( = ?auto_189294 ?auto_189301 ) ) ( not ( = ?auto_189295 ?auto_189296 ) ) ( not ( = ?auto_189295 ?auto_189297 ) ) ( not ( = ?auto_189295 ?auto_189298 ) ) ( not ( = ?auto_189295 ?auto_189299 ) ) ( not ( = ?auto_189295 ?auto_189300 ) ) ( not ( = ?auto_189295 ?auto_189301 ) ) ( not ( = ?auto_189296 ?auto_189297 ) ) ( not ( = ?auto_189296 ?auto_189298 ) ) ( not ( = ?auto_189296 ?auto_189299 ) ) ( not ( = ?auto_189296 ?auto_189300 ) ) ( not ( = ?auto_189296 ?auto_189301 ) ) ( not ( = ?auto_189297 ?auto_189298 ) ) ( not ( = ?auto_189297 ?auto_189299 ) ) ( not ( = ?auto_189297 ?auto_189300 ) ) ( not ( = ?auto_189297 ?auto_189301 ) ) ( not ( = ?auto_189298 ?auto_189299 ) ) ( not ( = ?auto_189298 ?auto_189300 ) ) ( not ( = ?auto_189298 ?auto_189301 ) ) ( not ( = ?auto_189299 ?auto_189300 ) ) ( not ( = ?auto_189299 ?auto_189301 ) ) ( not ( = ?auto_189300 ?auto_189301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189300 ?auto_189301 )
      ( !STACK ?auto_189300 ?auto_189299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189309 - BLOCK
      ?auto_189310 - BLOCK
      ?auto_189311 - BLOCK
      ?auto_189312 - BLOCK
      ?auto_189313 - BLOCK
      ?auto_189314 - BLOCK
      ?auto_189315 - BLOCK
    )
    :vars
    (
      ?auto_189316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189315 ?auto_189316 ) ( ON-TABLE ?auto_189309 ) ( ON ?auto_189310 ?auto_189309 ) ( ON ?auto_189311 ?auto_189310 ) ( ON ?auto_189312 ?auto_189311 ) ( ON ?auto_189313 ?auto_189312 ) ( not ( = ?auto_189309 ?auto_189310 ) ) ( not ( = ?auto_189309 ?auto_189311 ) ) ( not ( = ?auto_189309 ?auto_189312 ) ) ( not ( = ?auto_189309 ?auto_189313 ) ) ( not ( = ?auto_189309 ?auto_189314 ) ) ( not ( = ?auto_189309 ?auto_189315 ) ) ( not ( = ?auto_189309 ?auto_189316 ) ) ( not ( = ?auto_189310 ?auto_189311 ) ) ( not ( = ?auto_189310 ?auto_189312 ) ) ( not ( = ?auto_189310 ?auto_189313 ) ) ( not ( = ?auto_189310 ?auto_189314 ) ) ( not ( = ?auto_189310 ?auto_189315 ) ) ( not ( = ?auto_189310 ?auto_189316 ) ) ( not ( = ?auto_189311 ?auto_189312 ) ) ( not ( = ?auto_189311 ?auto_189313 ) ) ( not ( = ?auto_189311 ?auto_189314 ) ) ( not ( = ?auto_189311 ?auto_189315 ) ) ( not ( = ?auto_189311 ?auto_189316 ) ) ( not ( = ?auto_189312 ?auto_189313 ) ) ( not ( = ?auto_189312 ?auto_189314 ) ) ( not ( = ?auto_189312 ?auto_189315 ) ) ( not ( = ?auto_189312 ?auto_189316 ) ) ( not ( = ?auto_189313 ?auto_189314 ) ) ( not ( = ?auto_189313 ?auto_189315 ) ) ( not ( = ?auto_189313 ?auto_189316 ) ) ( not ( = ?auto_189314 ?auto_189315 ) ) ( not ( = ?auto_189314 ?auto_189316 ) ) ( not ( = ?auto_189315 ?auto_189316 ) ) ( CLEAR ?auto_189313 ) ( ON ?auto_189314 ?auto_189315 ) ( CLEAR ?auto_189314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189309 ?auto_189310 ?auto_189311 ?auto_189312 ?auto_189313 ?auto_189314 )
      ( MAKE-7PILE ?auto_189309 ?auto_189310 ?auto_189311 ?auto_189312 ?auto_189313 ?auto_189314 ?auto_189315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189324 - BLOCK
      ?auto_189325 - BLOCK
      ?auto_189326 - BLOCK
      ?auto_189327 - BLOCK
      ?auto_189328 - BLOCK
      ?auto_189329 - BLOCK
      ?auto_189330 - BLOCK
    )
    :vars
    (
      ?auto_189331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189330 ?auto_189331 ) ( ON-TABLE ?auto_189324 ) ( ON ?auto_189325 ?auto_189324 ) ( ON ?auto_189326 ?auto_189325 ) ( ON ?auto_189327 ?auto_189326 ) ( ON ?auto_189328 ?auto_189327 ) ( not ( = ?auto_189324 ?auto_189325 ) ) ( not ( = ?auto_189324 ?auto_189326 ) ) ( not ( = ?auto_189324 ?auto_189327 ) ) ( not ( = ?auto_189324 ?auto_189328 ) ) ( not ( = ?auto_189324 ?auto_189329 ) ) ( not ( = ?auto_189324 ?auto_189330 ) ) ( not ( = ?auto_189324 ?auto_189331 ) ) ( not ( = ?auto_189325 ?auto_189326 ) ) ( not ( = ?auto_189325 ?auto_189327 ) ) ( not ( = ?auto_189325 ?auto_189328 ) ) ( not ( = ?auto_189325 ?auto_189329 ) ) ( not ( = ?auto_189325 ?auto_189330 ) ) ( not ( = ?auto_189325 ?auto_189331 ) ) ( not ( = ?auto_189326 ?auto_189327 ) ) ( not ( = ?auto_189326 ?auto_189328 ) ) ( not ( = ?auto_189326 ?auto_189329 ) ) ( not ( = ?auto_189326 ?auto_189330 ) ) ( not ( = ?auto_189326 ?auto_189331 ) ) ( not ( = ?auto_189327 ?auto_189328 ) ) ( not ( = ?auto_189327 ?auto_189329 ) ) ( not ( = ?auto_189327 ?auto_189330 ) ) ( not ( = ?auto_189327 ?auto_189331 ) ) ( not ( = ?auto_189328 ?auto_189329 ) ) ( not ( = ?auto_189328 ?auto_189330 ) ) ( not ( = ?auto_189328 ?auto_189331 ) ) ( not ( = ?auto_189329 ?auto_189330 ) ) ( not ( = ?auto_189329 ?auto_189331 ) ) ( not ( = ?auto_189330 ?auto_189331 ) ) ( CLEAR ?auto_189328 ) ( ON ?auto_189329 ?auto_189330 ) ( CLEAR ?auto_189329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189324 ?auto_189325 ?auto_189326 ?auto_189327 ?auto_189328 ?auto_189329 )
      ( MAKE-7PILE ?auto_189324 ?auto_189325 ?auto_189326 ?auto_189327 ?auto_189328 ?auto_189329 ?auto_189330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189339 - BLOCK
      ?auto_189340 - BLOCK
      ?auto_189341 - BLOCK
      ?auto_189342 - BLOCK
      ?auto_189343 - BLOCK
      ?auto_189344 - BLOCK
      ?auto_189345 - BLOCK
    )
    :vars
    (
      ?auto_189346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189345 ?auto_189346 ) ( ON-TABLE ?auto_189339 ) ( ON ?auto_189340 ?auto_189339 ) ( ON ?auto_189341 ?auto_189340 ) ( ON ?auto_189342 ?auto_189341 ) ( not ( = ?auto_189339 ?auto_189340 ) ) ( not ( = ?auto_189339 ?auto_189341 ) ) ( not ( = ?auto_189339 ?auto_189342 ) ) ( not ( = ?auto_189339 ?auto_189343 ) ) ( not ( = ?auto_189339 ?auto_189344 ) ) ( not ( = ?auto_189339 ?auto_189345 ) ) ( not ( = ?auto_189339 ?auto_189346 ) ) ( not ( = ?auto_189340 ?auto_189341 ) ) ( not ( = ?auto_189340 ?auto_189342 ) ) ( not ( = ?auto_189340 ?auto_189343 ) ) ( not ( = ?auto_189340 ?auto_189344 ) ) ( not ( = ?auto_189340 ?auto_189345 ) ) ( not ( = ?auto_189340 ?auto_189346 ) ) ( not ( = ?auto_189341 ?auto_189342 ) ) ( not ( = ?auto_189341 ?auto_189343 ) ) ( not ( = ?auto_189341 ?auto_189344 ) ) ( not ( = ?auto_189341 ?auto_189345 ) ) ( not ( = ?auto_189341 ?auto_189346 ) ) ( not ( = ?auto_189342 ?auto_189343 ) ) ( not ( = ?auto_189342 ?auto_189344 ) ) ( not ( = ?auto_189342 ?auto_189345 ) ) ( not ( = ?auto_189342 ?auto_189346 ) ) ( not ( = ?auto_189343 ?auto_189344 ) ) ( not ( = ?auto_189343 ?auto_189345 ) ) ( not ( = ?auto_189343 ?auto_189346 ) ) ( not ( = ?auto_189344 ?auto_189345 ) ) ( not ( = ?auto_189344 ?auto_189346 ) ) ( not ( = ?auto_189345 ?auto_189346 ) ) ( ON ?auto_189344 ?auto_189345 ) ( CLEAR ?auto_189342 ) ( ON ?auto_189343 ?auto_189344 ) ( CLEAR ?auto_189343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189339 ?auto_189340 ?auto_189341 ?auto_189342 ?auto_189343 )
      ( MAKE-7PILE ?auto_189339 ?auto_189340 ?auto_189341 ?auto_189342 ?auto_189343 ?auto_189344 ?auto_189345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189354 - BLOCK
      ?auto_189355 - BLOCK
      ?auto_189356 - BLOCK
      ?auto_189357 - BLOCK
      ?auto_189358 - BLOCK
      ?auto_189359 - BLOCK
      ?auto_189360 - BLOCK
    )
    :vars
    (
      ?auto_189361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189360 ?auto_189361 ) ( ON-TABLE ?auto_189354 ) ( ON ?auto_189355 ?auto_189354 ) ( ON ?auto_189356 ?auto_189355 ) ( ON ?auto_189357 ?auto_189356 ) ( not ( = ?auto_189354 ?auto_189355 ) ) ( not ( = ?auto_189354 ?auto_189356 ) ) ( not ( = ?auto_189354 ?auto_189357 ) ) ( not ( = ?auto_189354 ?auto_189358 ) ) ( not ( = ?auto_189354 ?auto_189359 ) ) ( not ( = ?auto_189354 ?auto_189360 ) ) ( not ( = ?auto_189354 ?auto_189361 ) ) ( not ( = ?auto_189355 ?auto_189356 ) ) ( not ( = ?auto_189355 ?auto_189357 ) ) ( not ( = ?auto_189355 ?auto_189358 ) ) ( not ( = ?auto_189355 ?auto_189359 ) ) ( not ( = ?auto_189355 ?auto_189360 ) ) ( not ( = ?auto_189355 ?auto_189361 ) ) ( not ( = ?auto_189356 ?auto_189357 ) ) ( not ( = ?auto_189356 ?auto_189358 ) ) ( not ( = ?auto_189356 ?auto_189359 ) ) ( not ( = ?auto_189356 ?auto_189360 ) ) ( not ( = ?auto_189356 ?auto_189361 ) ) ( not ( = ?auto_189357 ?auto_189358 ) ) ( not ( = ?auto_189357 ?auto_189359 ) ) ( not ( = ?auto_189357 ?auto_189360 ) ) ( not ( = ?auto_189357 ?auto_189361 ) ) ( not ( = ?auto_189358 ?auto_189359 ) ) ( not ( = ?auto_189358 ?auto_189360 ) ) ( not ( = ?auto_189358 ?auto_189361 ) ) ( not ( = ?auto_189359 ?auto_189360 ) ) ( not ( = ?auto_189359 ?auto_189361 ) ) ( not ( = ?auto_189360 ?auto_189361 ) ) ( ON ?auto_189359 ?auto_189360 ) ( CLEAR ?auto_189357 ) ( ON ?auto_189358 ?auto_189359 ) ( CLEAR ?auto_189358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189354 ?auto_189355 ?auto_189356 ?auto_189357 ?auto_189358 )
      ( MAKE-7PILE ?auto_189354 ?auto_189355 ?auto_189356 ?auto_189357 ?auto_189358 ?auto_189359 ?auto_189360 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189369 - BLOCK
      ?auto_189370 - BLOCK
      ?auto_189371 - BLOCK
      ?auto_189372 - BLOCK
      ?auto_189373 - BLOCK
      ?auto_189374 - BLOCK
      ?auto_189375 - BLOCK
    )
    :vars
    (
      ?auto_189376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189375 ?auto_189376 ) ( ON-TABLE ?auto_189369 ) ( ON ?auto_189370 ?auto_189369 ) ( ON ?auto_189371 ?auto_189370 ) ( not ( = ?auto_189369 ?auto_189370 ) ) ( not ( = ?auto_189369 ?auto_189371 ) ) ( not ( = ?auto_189369 ?auto_189372 ) ) ( not ( = ?auto_189369 ?auto_189373 ) ) ( not ( = ?auto_189369 ?auto_189374 ) ) ( not ( = ?auto_189369 ?auto_189375 ) ) ( not ( = ?auto_189369 ?auto_189376 ) ) ( not ( = ?auto_189370 ?auto_189371 ) ) ( not ( = ?auto_189370 ?auto_189372 ) ) ( not ( = ?auto_189370 ?auto_189373 ) ) ( not ( = ?auto_189370 ?auto_189374 ) ) ( not ( = ?auto_189370 ?auto_189375 ) ) ( not ( = ?auto_189370 ?auto_189376 ) ) ( not ( = ?auto_189371 ?auto_189372 ) ) ( not ( = ?auto_189371 ?auto_189373 ) ) ( not ( = ?auto_189371 ?auto_189374 ) ) ( not ( = ?auto_189371 ?auto_189375 ) ) ( not ( = ?auto_189371 ?auto_189376 ) ) ( not ( = ?auto_189372 ?auto_189373 ) ) ( not ( = ?auto_189372 ?auto_189374 ) ) ( not ( = ?auto_189372 ?auto_189375 ) ) ( not ( = ?auto_189372 ?auto_189376 ) ) ( not ( = ?auto_189373 ?auto_189374 ) ) ( not ( = ?auto_189373 ?auto_189375 ) ) ( not ( = ?auto_189373 ?auto_189376 ) ) ( not ( = ?auto_189374 ?auto_189375 ) ) ( not ( = ?auto_189374 ?auto_189376 ) ) ( not ( = ?auto_189375 ?auto_189376 ) ) ( ON ?auto_189374 ?auto_189375 ) ( ON ?auto_189373 ?auto_189374 ) ( CLEAR ?auto_189371 ) ( ON ?auto_189372 ?auto_189373 ) ( CLEAR ?auto_189372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189369 ?auto_189370 ?auto_189371 ?auto_189372 )
      ( MAKE-7PILE ?auto_189369 ?auto_189370 ?auto_189371 ?auto_189372 ?auto_189373 ?auto_189374 ?auto_189375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189384 - BLOCK
      ?auto_189385 - BLOCK
      ?auto_189386 - BLOCK
      ?auto_189387 - BLOCK
      ?auto_189388 - BLOCK
      ?auto_189389 - BLOCK
      ?auto_189390 - BLOCK
    )
    :vars
    (
      ?auto_189391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189390 ?auto_189391 ) ( ON-TABLE ?auto_189384 ) ( ON ?auto_189385 ?auto_189384 ) ( ON ?auto_189386 ?auto_189385 ) ( not ( = ?auto_189384 ?auto_189385 ) ) ( not ( = ?auto_189384 ?auto_189386 ) ) ( not ( = ?auto_189384 ?auto_189387 ) ) ( not ( = ?auto_189384 ?auto_189388 ) ) ( not ( = ?auto_189384 ?auto_189389 ) ) ( not ( = ?auto_189384 ?auto_189390 ) ) ( not ( = ?auto_189384 ?auto_189391 ) ) ( not ( = ?auto_189385 ?auto_189386 ) ) ( not ( = ?auto_189385 ?auto_189387 ) ) ( not ( = ?auto_189385 ?auto_189388 ) ) ( not ( = ?auto_189385 ?auto_189389 ) ) ( not ( = ?auto_189385 ?auto_189390 ) ) ( not ( = ?auto_189385 ?auto_189391 ) ) ( not ( = ?auto_189386 ?auto_189387 ) ) ( not ( = ?auto_189386 ?auto_189388 ) ) ( not ( = ?auto_189386 ?auto_189389 ) ) ( not ( = ?auto_189386 ?auto_189390 ) ) ( not ( = ?auto_189386 ?auto_189391 ) ) ( not ( = ?auto_189387 ?auto_189388 ) ) ( not ( = ?auto_189387 ?auto_189389 ) ) ( not ( = ?auto_189387 ?auto_189390 ) ) ( not ( = ?auto_189387 ?auto_189391 ) ) ( not ( = ?auto_189388 ?auto_189389 ) ) ( not ( = ?auto_189388 ?auto_189390 ) ) ( not ( = ?auto_189388 ?auto_189391 ) ) ( not ( = ?auto_189389 ?auto_189390 ) ) ( not ( = ?auto_189389 ?auto_189391 ) ) ( not ( = ?auto_189390 ?auto_189391 ) ) ( ON ?auto_189389 ?auto_189390 ) ( ON ?auto_189388 ?auto_189389 ) ( CLEAR ?auto_189386 ) ( ON ?auto_189387 ?auto_189388 ) ( CLEAR ?auto_189387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189384 ?auto_189385 ?auto_189386 ?auto_189387 )
      ( MAKE-7PILE ?auto_189384 ?auto_189385 ?auto_189386 ?auto_189387 ?auto_189388 ?auto_189389 ?auto_189390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189399 - BLOCK
      ?auto_189400 - BLOCK
      ?auto_189401 - BLOCK
      ?auto_189402 - BLOCK
      ?auto_189403 - BLOCK
      ?auto_189404 - BLOCK
      ?auto_189405 - BLOCK
    )
    :vars
    (
      ?auto_189406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189405 ?auto_189406 ) ( ON-TABLE ?auto_189399 ) ( ON ?auto_189400 ?auto_189399 ) ( not ( = ?auto_189399 ?auto_189400 ) ) ( not ( = ?auto_189399 ?auto_189401 ) ) ( not ( = ?auto_189399 ?auto_189402 ) ) ( not ( = ?auto_189399 ?auto_189403 ) ) ( not ( = ?auto_189399 ?auto_189404 ) ) ( not ( = ?auto_189399 ?auto_189405 ) ) ( not ( = ?auto_189399 ?auto_189406 ) ) ( not ( = ?auto_189400 ?auto_189401 ) ) ( not ( = ?auto_189400 ?auto_189402 ) ) ( not ( = ?auto_189400 ?auto_189403 ) ) ( not ( = ?auto_189400 ?auto_189404 ) ) ( not ( = ?auto_189400 ?auto_189405 ) ) ( not ( = ?auto_189400 ?auto_189406 ) ) ( not ( = ?auto_189401 ?auto_189402 ) ) ( not ( = ?auto_189401 ?auto_189403 ) ) ( not ( = ?auto_189401 ?auto_189404 ) ) ( not ( = ?auto_189401 ?auto_189405 ) ) ( not ( = ?auto_189401 ?auto_189406 ) ) ( not ( = ?auto_189402 ?auto_189403 ) ) ( not ( = ?auto_189402 ?auto_189404 ) ) ( not ( = ?auto_189402 ?auto_189405 ) ) ( not ( = ?auto_189402 ?auto_189406 ) ) ( not ( = ?auto_189403 ?auto_189404 ) ) ( not ( = ?auto_189403 ?auto_189405 ) ) ( not ( = ?auto_189403 ?auto_189406 ) ) ( not ( = ?auto_189404 ?auto_189405 ) ) ( not ( = ?auto_189404 ?auto_189406 ) ) ( not ( = ?auto_189405 ?auto_189406 ) ) ( ON ?auto_189404 ?auto_189405 ) ( ON ?auto_189403 ?auto_189404 ) ( ON ?auto_189402 ?auto_189403 ) ( CLEAR ?auto_189400 ) ( ON ?auto_189401 ?auto_189402 ) ( CLEAR ?auto_189401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189399 ?auto_189400 ?auto_189401 )
      ( MAKE-7PILE ?auto_189399 ?auto_189400 ?auto_189401 ?auto_189402 ?auto_189403 ?auto_189404 ?auto_189405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189414 - BLOCK
      ?auto_189415 - BLOCK
      ?auto_189416 - BLOCK
      ?auto_189417 - BLOCK
      ?auto_189418 - BLOCK
      ?auto_189419 - BLOCK
      ?auto_189420 - BLOCK
    )
    :vars
    (
      ?auto_189421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189420 ?auto_189421 ) ( ON-TABLE ?auto_189414 ) ( ON ?auto_189415 ?auto_189414 ) ( not ( = ?auto_189414 ?auto_189415 ) ) ( not ( = ?auto_189414 ?auto_189416 ) ) ( not ( = ?auto_189414 ?auto_189417 ) ) ( not ( = ?auto_189414 ?auto_189418 ) ) ( not ( = ?auto_189414 ?auto_189419 ) ) ( not ( = ?auto_189414 ?auto_189420 ) ) ( not ( = ?auto_189414 ?auto_189421 ) ) ( not ( = ?auto_189415 ?auto_189416 ) ) ( not ( = ?auto_189415 ?auto_189417 ) ) ( not ( = ?auto_189415 ?auto_189418 ) ) ( not ( = ?auto_189415 ?auto_189419 ) ) ( not ( = ?auto_189415 ?auto_189420 ) ) ( not ( = ?auto_189415 ?auto_189421 ) ) ( not ( = ?auto_189416 ?auto_189417 ) ) ( not ( = ?auto_189416 ?auto_189418 ) ) ( not ( = ?auto_189416 ?auto_189419 ) ) ( not ( = ?auto_189416 ?auto_189420 ) ) ( not ( = ?auto_189416 ?auto_189421 ) ) ( not ( = ?auto_189417 ?auto_189418 ) ) ( not ( = ?auto_189417 ?auto_189419 ) ) ( not ( = ?auto_189417 ?auto_189420 ) ) ( not ( = ?auto_189417 ?auto_189421 ) ) ( not ( = ?auto_189418 ?auto_189419 ) ) ( not ( = ?auto_189418 ?auto_189420 ) ) ( not ( = ?auto_189418 ?auto_189421 ) ) ( not ( = ?auto_189419 ?auto_189420 ) ) ( not ( = ?auto_189419 ?auto_189421 ) ) ( not ( = ?auto_189420 ?auto_189421 ) ) ( ON ?auto_189419 ?auto_189420 ) ( ON ?auto_189418 ?auto_189419 ) ( ON ?auto_189417 ?auto_189418 ) ( CLEAR ?auto_189415 ) ( ON ?auto_189416 ?auto_189417 ) ( CLEAR ?auto_189416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189414 ?auto_189415 ?auto_189416 )
      ( MAKE-7PILE ?auto_189414 ?auto_189415 ?auto_189416 ?auto_189417 ?auto_189418 ?auto_189419 ?auto_189420 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189429 - BLOCK
      ?auto_189430 - BLOCK
      ?auto_189431 - BLOCK
      ?auto_189432 - BLOCK
      ?auto_189433 - BLOCK
      ?auto_189434 - BLOCK
      ?auto_189435 - BLOCK
    )
    :vars
    (
      ?auto_189436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189435 ?auto_189436 ) ( ON-TABLE ?auto_189429 ) ( not ( = ?auto_189429 ?auto_189430 ) ) ( not ( = ?auto_189429 ?auto_189431 ) ) ( not ( = ?auto_189429 ?auto_189432 ) ) ( not ( = ?auto_189429 ?auto_189433 ) ) ( not ( = ?auto_189429 ?auto_189434 ) ) ( not ( = ?auto_189429 ?auto_189435 ) ) ( not ( = ?auto_189429 ?auto_189436 ) ) ( not ( = ?auto_189430 ?auto_189431 ) ) ( not ( = ?auto_189430 ?auto_189432 ) ) ( not ( = ?auto_189430 ?auto_189433 ) ) ( not ( = ?auto_189430 ?auto_189434 ) ) ( not ( = ?auto_189430 ?auto_189435 ) ) ( not ( = ?auto_189430 ?auto_189436 ) ) ( not ( = ?auto_189431 ?auto_189432 ) ) ( not ( = ?auto_189431 ?auto_189433 ) ) ( not ( = ?auto_189431 ?auto_189434 ) ) ( not ( = ?auto_189431 ?auto_189435 ) ) ( not ( = ?auto_189431 ?auto_189436 ) ) ( not ( = ?auto_189432 ?auto_189433 ) ) ( not ( = ?auto_189432 ?auto_189434 ) ) ( not ( = ?auto_189432 ?auto_189435 ) ) ( not ( = ?auto_189432 ?auto_189436 ) ) ( not ( = ?auto_189433 ?auto_189434 ) ) ( not ( = ?auto_189433 ?auto_189435 ) ) ( not ( = ?auto_189433 ?auto_189436 ) ) ( not ( = ?auto_189434 ?auto_189435 ) ) ( not ( = ?auto_189434 ?auto_189436 ) ) ( not ( = ?auto_189435 ?auto_189436 ) ) ( ON ?auto_189434 ?auto_189435 ) ( ON ?auto_189433 ?auto_189434 ) ( ON ?auto_189432 ?auto_189433 ) ( ON ?auto_189431 ?auto_189432 ) ( CLEAR ?auto_189429 ) ( ON ?auto_189430 ?auto_189431 ) ( CLEAR ?auto_189430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189429 ?auto_189430 )
      ( MAKE-7PILE ?auto_189429 ?auto_189430 ?auto_189431 ?auto_189432 ?auto_189433 ?auto_189434 ?auto_189435 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189444 - BLOCK
      ?auto_189445 - BLOCK
      ?auto_189446 - BLOCK
      ?auto_189447 - BLOCK
      ?auto_189448 - BLOCK
      ?auto_189449 - BLOCK
      ?auto_189450 - BLOCK
    )
    :vars
    (
      ?auto_189451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189450 ?auto_189451 ) ( ON-TABLE ?auto_189444 ) ( not ( = ?auto_189444 ?auto_189445 ) ) ( not ( = ?auto_189444 ?auto_189446 ) ) ( not ( = ?auto_189444 ?auto_189447 ) ) ( not ( = ?auto_189444 ?auto_189448 ) ) ( not ( = ?auto_189444 ?auto_189449 ) ) ( not ( = ?auto_189444 ?auto_189450 ) ) ( not ( = ?auto_189444 ?auto_189451 ) ) ( not ( = ?auto_189445 ?auto_189446 ) ) ( not ( = ?auto_189445 ?auto_189447 ) ) ( not ( = ?auto_189445 ?auto_189448 ) ) ( not ( = ?auto_189445 ?auto_189449 ) ) ( not ( = ?auto_189445 ?auto_189450 ) ) ( not ( = ?auto_189445 ?auto_189451 ) ) ( not ( = ?auto_189446 ?auto_189447 ) ) ( not ( = ?auto_189446 ?auto_189448 ) ) ( not ( = ?auto_189446 ?auto_189449 ) ) ( not ( = ?auto_189446 ?auto_189450 ) ) ( not ( = ?auto_189446 ?auto_189451 ) ) ( not ( = ?auto_189447 ?auto_189448 ) ) ( not ( = ?auto_189447 ?auto_189449 ) ) ( not ( = ?auto_189447 ?auto_189450 ) ) ( not ( = ?auto_189447 ?auto_189451 ) ) ( not ( = ?auto_189448 ?auto_189449 ) ) ( not ( = ?auto_189448 ?auto_189450 ) ) ( not ( = ?auto_189448 ?auto_189451 ) ) ( not ( = ?auto_189449 ?auto_189450 ) ) ( not ( = ?auto_189449 ?auto_189451 ) ) ( not ( = ?auto_189450 ?auto_189451 ) ) ( ON ?auto_189449 ?auto_189450 ) ( ON ?auto_189448 ?auto_189449 ) ( ON ?auto_189447 ?auto_189448 ) ( ON ?auto_189446 ?auto_189447 ) ( CLEAR ?auto_189444 ) ( ON ?auto_189445 ?auto_189446 ) ( CLEAR ?auto_189445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189444 ?auto_189445 )
      ( MAKE-7PILE ?auto_189444 ?auto_189445 ?auto_189446 ?auto_189447 ?auto_189448 ?auto_189449 ?auto_189450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189459 - BLOCK
      ?auto_189460 - BLOCK
      ?auto_189461 - BLOCK
      ?auto_189462 - BLOCK
      ?auto_189463 - BLOCK
      ?auto_189464 - BLOCK
      ?auto_189465 - BLOCK
    )
    :vars
    (
      ?auto_189466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189465 ?auto_189466 ) ( not ( = ?auto_189459 ?auto_189460 ) ) ( not ( = ?auto_189459 ?auto_189461 ) ) ( not ( = ?auto_189459 ?auto_189462 ) ) ( not ( = ?auto_189459 ?auto_189463 ) ) ( not ( = ?auto_189459 ?auto_189464 ) ) ( not ( = ?auto_189459 ?auto_189465 ) ) ( not ( = ?auto_189459 ?auto_189466 ) ) ( not ( = ?auto_189460 ?auto_189461 ) ) ( not ( = ?auto_189460 ?auto_189462 ) ) ( not ( = ?auto_189460 ?auto_189463 ) ) ( not ( = ?auto_189460 ?auto_189464 ) ) ( not ( = ?auto_189460 ?auto_189465 ) ) ( not ( = ?auto_189460 ?auto_189466 ) ) ( not ( = ?auto_189461 ?auto_189462 ) ) ( not ( = ?auto_189461 ?auto_189463 ) ) ( not ( = ?auto_189461 ?auto_189464 ) ) ( not ( = ?auto_189461 ?auto_189465 ) ) ( not ( = ?auto_189461 ?auto_189466 ) ) ( not ( = ?auto_189462 ?auto_189463 ) ) ( not ( = ?auto_189462 ?auto_189464 ) ) ( not ( = ?auto_189462 ?auto_189465 ) ) ( not ( = ?auto_189462 ?auto_189466 ) ) ( not ( = ?auto_189463 ?auto_189464 ) ) ( not ( = ?auto_189463 ?auto_189465 ) ) ( not ( = ?auto_189463 ?auto_189466 ) ) ( not ( = ?auto_189464 ?auto_189465 ) ) ( not ( = ?auto_189464 ?auto_189466 ) ) ( not ( = ?auto_189465 ?auto_189466 ) ) ( ON ?auto_189464 ?auto_189465 ) ( ON ?auto_189463 ?auto_189464 ) ( ON ?auto_189462 ?auto_189463 ) ( ON ?auto_189461 ?auto_189462 ) ( ON ?auto_189460 ?auto_189461 ) ( ON ?auto_189459 ?auto_189460 ) ( CLEAR ?auto_189459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189459 )
      ( MAKE-7PILE ?auto_189459 ?auto_189460 ?auto_189461 ?auto_189462 ?auto_189463 ?auto_189464 ?auto_189465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_189474 - BLOCK
      ?auto_189475 - BLOCK
      ?auto_189476 - BLOCK
      ?auto_189477 - BLOCK
      ?auto_189478 - BLOCK
      ?auto_189479 - BLOCK
      ?auto_189480 - BLOCK
    )
    :vars
    (
      ?auto_189481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189480 ?auto_189481 ) ( not ( = ?auto_189474 ?auto_189475 ) ) ( not ( = ?auto_189474 ?auto_189476 ) ) ( not ( = ?auto_189474 ?auto_189477 ) ) ( not ( = ?auto_189474 ?auto_189478 ) ) ( not ( = ?auto_189474 ?auto_189479 ) ) ( not ( = ?auto_189474 ?auto_189480 ) ) ( not ( = ?auto_189474 ?auto_189481 ) ) ( not ( = ?auto_189475 ?auto_189476 ) ) ( not ( = ?auto_189475 ?auto_189477 ) ) ( not ( = ?auto_189475 ?auto_189478 ) ) ( not ( = ?auto_189475 ?auto_189479 ) ) ( not ( = ?auto_189475 ?auto_189480 ) ) ( not ( = ?auto_189475 ?auto_189481 ) ) ( not ( = ?auto_189476 ?auto_189477 ) ) ( not ( = ?auto_189476 ?auto_189478 ) ) ( not ( = ?auto_189476 ?auto_189479 ) ) ( not ( = ?auto_189476 ?auto_189480 ) ) ( not ( = ?auto_189476 ?auto_189481 ) ) ( not ( = ?auto_189477 ?auto_189478 ) ) ( not ( = ?auto_189477 ?auto_189479 ) ) ( not ( = ?auto_189477 ?auto_189480 ) ) ( not ( = ?auto_189477 ?auto_189481 ) ) ( not ( = ?auto_189478 ?auto_189479 ) ) ( not ( = ?auto_189478 ?auto_189480 ) ) ( not ( = ?auto_189478 ?auto_189481 ) ) ( not ( = ?auto_189479 ?auto_189480 ) ) ( not ( = ?auto_189479 ?auto_189481 ) ) ( not ( = ?auto_189480 ?auto_189481 ) ) ( ON ?auto_189479 ?auto_189480 ) ( ON ?auto_189478 ?auto_189479 ) ( ON ?auto_189477 ?auto_189478 ) ( ON ?auto_189476 ?auto_189477 ) ( ON ?auto_189475 ?auto_189476 ) ( ON ?auto_189474 ?auto_189475 ) ( CLEAR ?auto_189474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189474 )
      ( MAKE-7PILE ?auto_189474 ?auto_189475 ?auto_189476 ?auto_189477 ?auto_189478 ?auto_189479 ?auto_189480 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189490 - BLOCK
      ?auto_189491 - BLOCK
      ?auto_189492 - BLOCK
      ?auto_189493 - BLOCK
      ?auto_189494 - BLOCK
      ?auto_189495 - BLOCK
      ?auto_189496 - BLOCK
      ?auto_189497 - BLOCK
    )
    :vars
    (
      ?auto_189498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189496 ) ( ON ?auto_189497 ?auto_189498 ) ( CLEAR ?auto_189497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189490 ) ( ON ?auto_189491 ?auto_189490 ) ( ON ?auto_189492 ?auto_189491 ) ( ON ?auto_189493 ?auto_189492 ) ( ON ?auto_189494 ?auto_189493 ) ( ON ?auto_189495 ?auto_189494 ) ( ON ?auto_189496 ?auto_189495 ) ( not ( = ?auto_189490 ?auto_189491 ) ) ( not ( = ?auto_189490 ?auto_189492 ) ) ( not ( = ?auto_189490 ?auto_189493 ) ) ( not ( = ?auto_189490 ?auto_189494 ) ) ( not ( = ?auto_189490 ?auto_189495 ) ) ( not ( = ?auto_189490 ?auto_189496 ) ) ( not ( = ?auto_189490 ?auto_189497 ) ) ( not ( = ?auto_189490 ?auto_189498 ) ) ( not ( = ?auto_189491 ?auto_189492 ) ) ( not ( = ?auto_189491 ?auto_189493 ) ) ( not ( = ?auto_189491 ?auto_189494 ) ) ( not ( = ?auto_189491 ?auto_189495 ) ) ( not ( = ?auto_189491 ?auto_189496 ) ) ( not ( = ?auto_189491 ?auto_189497 ) ) ( not ( = ?auto_189491 ?auto_189498 ) ) ( not ( = ?auto_189492 ?auto_189493 ) ) ( not ( = ?auto_189492 ?auto_189494 ) ) ( not ( = ?auto_189492 ?auto_189495 ) ) ( not ( = ?auto_189492 ?auto_189496 ) ) ( not ( = ?auto_189492 ?auto_189497 ) ) ( not ( = ?auto_189492 ?auto_189498 ) ) ( not ( = ?auto_189493 ?auto_189494 ) ) ( not ( = ?auto_189493 ?auto_189495 ) ) ( not ( = ?auto_189493 ?auto_189496 ) ) ( not ( = ?auto_189493 ?auto_189497 ) ) ( not ( = ?auto_189493 ?auto_189498 ) ) ( not ( = ?auto_189494 ?auto_189495 ) ) ( not ( = ?auto_189494 ?auto_189496 ) ) ( not ( = ?auto_189494 ?auto_189497 ) ) ( not ( = ?auto_189494 ?auto_189498 ) ) ( not ( = ?auto_189495 ?auto_189496 ) ) ( not ( = ?auto_189495 ?auto_189497 ) ) ( not ( = ?auto_189495 ?auto_189498 ) ) ( not ( = ?auto_189496 ?auto_189497 ) ) ( not ( = ?auto_189496 ?auto_189498 ) ) ( not ( = ?auto_189497 ?auto_189498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189497 ?auto_189498 )
      ( !STACK ?auto_189497 ?auto_189496 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189507 - BLOCK
      ?auto_189508 - BLOCK
      ?auto_189509 - BLOCK
      ?auto_189510 - BLOCK
      ?auto_189511 - BLOCK
      ?auto_189512 - BLOCK
      ?auto_189513 - BLOCK
      ?auto_189514 - BLOCK
    )
    :vars
    (
      ?auto_189515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189513 ) ( ON ?auto_189514 ?auto_189515 ) ( CLEAR ?auto_189514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189507 ) ( ON ?auto_189508 ?auto_189507 ) ( ON ?auto_189509 ?auto_189508 ) ( ON ?auto_189510 ?auto_189509 ) ( ON ?auto_189511 ?auto_189510 ) ( ON ?auto_189512 ?auto_189511 ) ( ON ?auto_189513 ?auto_189512 ) ( not ( = ?auto_189507 ?auto_189508 ) ) ( not ( = ?auto_189507 ?auto_189509 ) ) ( not ( = ?auto_189507 ?auto_189510 ) ) ( not ( = ?auto_189507 ?auto_189511 ) ) ( not ( = ?auto_189507 ?auto_189512 ) ) ( not ( = ?auto_189507 ?auto_189513 ) ) ( not ( = ?auto_189507 ?auto_189514 ) ) ( not ( = ?auto_189507 ?auto_189515 ) ) ( not ( = ?auto_189508 ?auto_189509 ) ) ( not ( = ?auto_189508 ?auto_189510 ) ) ( not ( = ?auto_189508 ?auto_189511 ) ) ( not ( = ?auto_189508 ?auto_189512 ) ) ( not ( = ?auto_189508 ?auto_189513 ) ) ( not ( = ?auto_189508 ?auto_189514 ) ) ( not ( = ?auto_189508 ?auto_189515 ) ) ( not ( = ?auto_189509 ?auto_189510 ) ) ( not ( = ?auto_189509 ?auto_189511 ) ) ( not ( = ?auto_189509 ?auto_189512 ) ) ( not ( = ?auto_189509 ?auto_189513 ) ) ( not ( = ?auto_189509 ?auto_189514 ) ) ( not ( = ?auto_189509 ?auto_189515 ) ) ( not ( = ?auto_189510 ?auto_189511 ) ) ( not ( = ?auto_189510 ?auto_189512 ) ) ( not ( = ?auto_189510 ?auto_189513 ) ) ( not ( = ?auto_189510 ?auto_189514 ) ) ( not ( = ?auto_189510 ?auto_189515 ) ) ( not ( = ?auto_189511 ?auto_189512 ) ) ( not ( = ?auto_189511 ?auto_189513 ) ) ( not ( = ?auto_189511 ?auto_189514 ) ) ( not ( = ?auto_189511 ?auto_189515 ) ) ( not ( = ?auto_189512 ?auto_189513 ) ) ( not ( = ?auto_189512 ?auto_189514 ) ) ( not ( = ?auto_189512 ?auto_189515 ) ) ( not ( = ?auto_189513 ?auto_189514 ) ) ( not ( = ?auto_189513 ?auto_189515 ) ) ( not ( = ?auto_189514 ?auto_189515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189514 ?auto_189515 )
      ( !STACK ?auto_189514 ?auto_189513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189524 - BLOCK
      ?auto_189525 - BLOCK
      ?auto_189526 - BLOCK
      ?auto_189527 - BLOCK
      ?auto_189528 - BLOCK
      ?auto_189529 - BLOCK
      ?auto_189530 - BLOCK
      ?auto_189531 - BLOCK
    )
    :vars
    (
      ?auto_189532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189531 ?auto_189532 ) ( ON-TABLE ?auto_189524 ) ( ON ?auto_189525 ?auto_189524 ) ( ON ?auto_189526 ?auto_189525 ) ( ON ?auto_189527 ?auto_189526 ) ( ON ?auto_189528 ?auto_189527 ) ( ON ?auto_189529 ?auto_189528 ) ( not ( = ?auto_189524 ?auto_189525 ) ) ( not ( = ?auto_189524 ?auto_189526 ) ) ( not ( = ?auto_189524 ?auto_189527 ) ) ( not ( = ?auto_189524 ?auto_189528 ) ) ( not ( = ?auto_189524 ?auto_189529 ) ) ( not ( = ?auto_189524 ?auto_189530 ) ) ( not ( = ?auto_189524 ?auto_189531 ) ) ( not ( = ?auto_189524 ?auto_189532 ) ) ( not ( = ?auto_189525 ?auto_189526 ) ) ( not ( = ?auto_189525 ?auto_189527 ) ) ( not ( = ?auto_189525 ?auto_189528 ) ) ( not ( = ?auto_189525 ?auto_189529 ) ) ( not ( = ?auto_189525 ?auto_189530 ) ) ( not ( = ?auto_189525 ?auto_189531 ) ) ( not ( = ?auto_189525 ?auto_189532 ) ) ( not ( = ?auto_189526 ?auto_189527 ) ) ( not ( = ?auto_189526 ?auto_189528 ) ) ( not ( = ?auto_189526 ?auto_189529 ) ) ( not ( = ?auto_189526 ?auto_189530 ) ) ( not ( = ?auto_189526 ?auto_189531 ) ) ( not ( = ?auto_189526 ?auto_189532 ) ) ( not ( = ?auto_189527 ?auto_189528 ) ) ( not ( = ?auto_189527 ?auto_189529 ) ) ( not ( = ?auto_189527 ?auto_189530 ) ) ( not ( = ?auto_189527 ?auto_189531 ) ) ( not ( = ?auto_189527 ?auto_189532 ) ) ( not ( = ?auto_189528 ?auto_189529 ) ) ( not ( = ?auto_189528 ?auto_189530 ) ) ( not ( = ?auto_189528 ?auto_189531 ) ) ( not ( = ?auto_189528 ?auto_189532 ) ) ( not ( = ?auto_189529 ?auto_189530 ) ) ( not ( = ?auto_189529 ?auto_189531 ) ) ( not ( = ?auto_189529 ?auto_189532 ) ) ( not ( = ?auto_189530 ?auto_189531 ) ) ( not ( = ?auto_189530 ?auto_189532 ) ) ( not ( = ?auto_189531 ?auto_189532 ) ) ( CLEAR ?auto_189529 ) ( ON ?auto_189530 ?auto_189531 ) ( CLEAR ?auto_189530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189524 ?auto_189525 ?auto_189526 ?auto_189527 ?auto_189528 ?auto_189529 ?auto_189530 )
      ( MAKE-8PILE ?auto_189524 ?auto_189525 ?auto_189526 ?auto_189527 ?auto_189528 ?auto_189529 ?auto_189530 ?auto_189531 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189541 - BLOCK
      ?auto_189542 - BLOCK
      ?auto_189543 - BLOCK
      ?auto_189544 - BLOCK
      ?auto_189545 - BLOCK
      ?auto_189546 - BLOCK
      ?auto_189547 - BLOCK
      ?auto_189548 - BLOCK
    )
    :vars
    (
      ?auto_189549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189548 ?auto_189549 ) ( ON-TABLE ?auto_189541 ) ( ON ?auto_189542 ?auto_189541 ) ( ON ?auto_189543 ?auto_189542 ) ( ON ?auto_189544 ?auto_189543 ) ( ON ?auto_189545 ?auto_189544 ) ( ON ?auto_189546 ?auto_189545 ) ( not ( = ?auto_189541 ?auto_189542 ) ) ( not ( = ?auto_189541 ?auto_189543 ) ) ( not ( = ?auto_189541 ?auto_189544 ) ) ( not ( = ?auto_189541 ?auto_189545 ) ) ( not ( = ?auto_189541 ?auto_189546 ) ) ( not ( = ?auto_189541 ?auto_189547 ) ) ( not ( = ?auto_189541 ?auto_189548 ) ) ( not ( = ?auto_189541 ?auto_189549 ) ) ( not ( = ?auto_189542 ?auto_189543 ) ) ( not ( = ?auto_189542 ?auto_189544 ) ) ( not ( = ?auto_189542 ?auto_189545 ) ) ( not ( = ?auto_189542 ?auto_189546 ) ) ( not ( = ?auto_189542 ?auto_189547 ) ) ( not ( = ?auto_189542 ?auto_189548 ) ) ( not ( = ?auto_189542 ?auto_189549 ) ) ( not ( = ?auto_189543 ?auto_189544 ) ) ( not ( = ?auto_189543 ?auto_189545 ) ) ( not ( = ?auto_189543 ?auto_189546 ) ) ( not ( = ?auto_189543 ?auto_189547 ) ) ( not ( = ?auto_189543 ?auto_189548 ) ) ( not ( = ?auto_189543 ?auto_189549 ) ) ( not ( = ?auto_189544 ?auto_189545 ) ) ( not ( = ?auto_189544 ?auto_189546 ) ) ( not ( = ?auto_189544 ?auto_189547 ) ) ( not ( = ?auto_189544 ?auto_189548 ) ) ( not ( = ?auto_189544 ?auto_189549 ) ) ( not ( = ?auto_189545 ?auto_189546 ) ) ( not ( = ?auto_189545 ?auto_189547 ) ) ( not ( = ?auto_189545 ?auto_189548 ) ) ( not ( = ?auto_189545 ?auto_189549 ) ) ( not ( = ?auto_189546 ?auto_189547 ) ) ( not ( = ?auto_189546 ?auto_189548 ) ) ( not ( = ?auto_189546 ?auto_189549 ) ) ( not ( = ?auto_189547 ?auto_189548 ) ) ( not ( = ?auto_189547 ?auto_189549 ) ) ( not ( = ?auto_189548 ?auto_189549 ) ) ( CLEAR ?auto_189546 ) ( ON ?auto_189547 ?auto_189548 ) ( CLEAR ?auto_189547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189541 ?auto_189542 ?auto_189543 ?auto_189544 ?auto_189545 ?auto_189546 ?auto_189547 )
      ( MAKE-8PILE ?auto_189541 ?auto_189542 ?auto_189543 ?auto_189544 ?auto_189545 ?auto_189546 ?auto_189547 ?auto_189548 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189558 - BLOCK
      ?auto_189559 - BLOCK
      ?auto_189560 - BLOCK
      ?auto_189561 - BLOCK
      ?auto_189562 - BLOCK
      ?auto_189563 - BLOCK
      ?auto_189564 - BLOCK
      ?auto_189565 - BLOCK
    )
    :vars
    (
      ?auto_189566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189565 ?auto_189566 ) ( ON-TABLE ?auto_189558 ) ( ON ?auto_189559 ?auto_189558 ) ( ON ?auto_189560 ?auto_189559 ) ( ON ?auto_189561 ?auto_189560 ) ( ON ?auto_189562 ?auto_189561 ) ( not ( = ?auto_189558 ?auto_189559 ) ) ( not ( = ?auto_189558 ?auto_189560 ) ) ( not ( = ?auto_189558 ?auto_189561 ) ) ( not ( = ?auto_189558 ?auto_189562 ) ) ( not ( = ?auto_189558 ?auto_189563 ) ) ( not ( = ?auto_189558 ?auto_189564 ) ) ( not ( = ?auto_189558 ?auto_189565 ) ) ( not ( = ?auto_189558 ?auto_189566 ) ) ( not ( = ?auto_189559 ?auto_189560 ) ) ( not ( = ?auto_189559 ?auto_189561 ) ) ( not ( = ?auto_189559 ?auto_189562 ) ) ( not ( = ?auto_189559 ?auto_189563 ) ) ( not ( = ?auto_189559 ?auto_189564 ) ) ( not ( = ?auto_189559 ?auto_189565 ) ) ( not ( = ?auto_189559 ?auto_189566 ) ) ( not ( = ?auto_189560 ?auto_189561 ) ) ( not ( = ?auto_189560 ?auto_189562 ) ) ( not ( = ?auto_189560 ?auto_189563 ) ) ( not ( = ?auto_189560 ?auto_189564 ) ) ( not ( = ?auto_189560 ?auto_189565 ) ) ( not ( = ?auto_189560 ?auto_189566 ) ) ( not ( = ?auto_189561 ?auto_189562 ) ) ( not ( = ?auto_189561 ?auto_189563 ) ) ( not ( = ?auto_189561 ?auto_189564 ) ) ( not ( = ?auto_189561 ?auto_189565 ) ) ( not ( = ?auto_189561 ?auto_189566 ) ) ( not ( = ?auto_189562 ?auto_189563 ) ) ( not ( = ?auto_189562 ?auto_189564 ) ) ( not ( = ?auto_189562 ?auto_189565 ) ) ( not ( = ?auto_189562 ?auto_189566 ) ) ( not ( = ?auto_189563 ?auto_189564 ) ) ( not ( = ?auto_189563 ?auto_189565 ) ) ( not ( = ?auto_189563 ?auto_189566 ) ) ( not ( = ?auto_189564 ?auto_189565 ) ) ( not ( = ?auto_189564 ?auto_189566 ) ) ( not ( = ?auto_189565 ?auto_189566 ) ) ( ON ?auto_189564 ?auto_189565 ) ( CLEAR ?auto_189562 ) ( ON ?auto_189563 ?auto_189564 ) ( CLEAR ?auto_189563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189558 ?auto_189559 ?auto_189560 ?auto_189561 ?auto_189562 ?auto_189563 )
      ( MAKE-8PILE ?auto_189558 ?auto_189559 ?auto_189560 ?auto_189561 ?auto_189562 ?auto_189563 ?auto_189564 ?auto_189565 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189575 - BLOCK
      ?auto_189576 - BLOCK
      ?auto_189577 - BLOCK
      ?auto_189578 - BLOCK
      ?auto_189579 - BLOCK
      ?auto_189580 - BLOCK
      ?auto_189581 - BLOCK
      ?auto_189582 - BLOCK
    )
    :vars
    (
      ?auto_189583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189582 ?auto_189583 ) ( ON-TABLE ?auto_189575 ) ( ON ?auto_189576 ?auto_189575 ) ( ON ?auto_189577 ?auto_189576 ) ( ON ?auto_189578 ?auto_189577 ) ( ON ?auto_189579 ?auto_189578 ) ( not ( = ?auto_189575 ?auto_189576 ) ) ( not ( = ?auto_189575 ?auto_189577 ) ) ( not ( = ?auto_189575 ?auto_189578 ) ) ( not ( = ?auto_189575 ?auto_189579 ) ) ( not ( = ?auto_189575 ?auto_189580 ) ) ( not ( = ?auto_189575 ?auto_189581 ) ) ( not ( = ?auto_189575 ?auto_189582 ) ) ( not ( = ?auto_189575 ?auto_189583 ) ) ( not ( = ?auto_189576 ?auto_189577 ) ) ( not ( = ?auto_189576 ?auto_189578 ) ) ( not ( = ?auto_189576 ?auto_189579 ) ) ( not ( = ?auto_189576 ?auto_189580 ) ) ( not ( = ?auto_189576 ?auto_189581 ) ) ( not ( = ?auto_189576 ?auto_189582 ) ) ( not ( = ?auto_189576 ?auto_189583 ) ) ( not ( = ?auto_189577 ?auto_189578 ) ) ( not ( = ?auto_189577 ?auto_189579 ) ) ( not ( = ?auto_189577 ?auto_189580 ) ) ( not ( = ?auto_189577 ?auto_189581 ) ) ( not ( = ?auto_189577 ?auto_189582 ) ) ( not ( = ?auto_189577 ?auto_189583 ) ) ( not ( = ?auto_189578 ?auto_189579 ) ) ( not ( = ?auto_189578 ?auto_189580 ) ) ( not ( = ?auto_189578 ?auto_189581 ) ) ( not ( = ?auto_189578 ?auto_189582 ) ) ( not ( = ?auto_189578 ?auto_189583 ) ) ( not ( = ?auto_189579 ?auto_189580 ) ) ( not ( = ?auto_189579 ?auto_189581 ) ) ( not ( = ?auto_189579 ?auto_189582 ) ) ( not ( = ?auto_189579 ?auto_189583 ) ) ( not ( = ?auto_189580 ?auto_189581 ) ) ( not ( = ?auto_189580 ?auto_189582 ) ) ( not ( = ?auto_189580 ?auto_189583 ) ) ( not ( = ?auto_189581 ?auto_189582 ) ) ( not ( = ?auto_189581 ?auto_189583 ) ) ( not ( = ?auto_189582 ?auto_189583 ) ) ( ON ?auto_189581 ?auto_189582 ) ( CLEAR ?auto_189579 ) ( ON ?auto_189580 ?auto_189581 ) ( CLEAR ?auto_189580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189575 ?auto_189576 ?auto_189577 ?auto_189578 ?auto_189579 ?auto_189580 )
      ( MAKE-8PILE ?auto_189575 ?auto_189576 ?auto_189577 ?auto_189578 ?auto_189579 ?auto_189580 ?auto_189581 ?auto_189582 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189592 - BLOCK
      ?auto_189593 - BLOCK
      ?auto_189594 - BLOCK
      ?auto_189595 - BLOCK
      ?auto_189596 - BLOCK
      ?auto_189597 - BLOCK
      ?auto_189598 - BLOCK
      ?auto_189599 - BLOCK
    )
    :vars
    (
      ?auto_189600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189599 ?auto_189600 ) ( ON-TABLE ?auto_189592 ) ( ON ?auto_189593 ?auto_189592 ) ( ON ?auto_189594 ?auto_189593 ) ( ON ?auto_189595 ?auto_189594 ) ( not ( = ?auto_189592 ?auto_189593 ) ) ( not ( = ?auto_189592 ?auto_189594 ) ) ( not ( = ?auto_189592 ?auto_189595 ) ) ( not ( = ?auto_189592 ?auto_189596 ) ) ( not ( = ?auto_189592 ?auto_189597 ) ) ( not ( = ?auto_189592 ?auto_189598 ) ) ( not ( = ?auto_189592 ?auto_189599 ) ) ( not ( = ?auto_189592 ?auto_189600 ) ) ( not ( = ?auto_189593 ?auto_189594 ) ) ( not ( = ?auto_189593 ?auto_189595 ) ) ( not ( = ?auto_189593 ?auto_189596 ) ) ( not ( = ?auto_189593 ?auto_189597 ) ) ( not ( = ?auto_189593 ?auto_189598 ) ) ( not ( = ?auto_189593 ?auto_189599 ) ) ( not ( = ?auto_189593 ?auto_189600 ) ) ( not ( = ?auto_189594 ?auto_189595 ) ) ( not ( = ?auto_189594 ?auto_189596 ) ) ( not ( = ?auto_189594 ?auto_189597 ) ) ( not ( = ?auto_189594 ?auto_189598 ) ) ( not ( = ?auto_189594 ?auto_189599 ) ) ( not ( = ?auto_189594 ?auto_189600 ) ) ( not ( = ?auto_189595 ?auto_189596 ) ) ( not ( = ?auto_189595 ?auto_189597 ) ) ( not ( = ?auto_189595 ?auto_189598 ) ) ( not ( = ?auto_189595 ?auto_189599 ) ) ( not ( = ?auto_189595 ?auto_189600 ) ) ( not ( = ?auto_189596 ?auto_189597 ) ) ( not ( = ?auto_189596 ?auto_189598 ) ) ( not ( = ?auto_189596 ?auto_189599 ) ) ( not ( = ?auto_189596 ?auto_189600 ) ) ( not ( = ?auto_189597 ?auto_189598 ) ) ( not ( = ?auto_189597 ?auto_189599 ) ) ( not ( = ?auto_189597 ?auto_189600 ) ) ( not ( = ?auto_189598 ?auto_189599 ) ) ( not ( = ?auto_189598 ?auto_189600 ) ) ( not ( = ?auto_189599 ?auto_189600 ) ) ( ON ?auto_189598 ?auto_189599 ) ( ON ?auto_189597 ?auto_189598 ) ( CLEAR ?auto_189595 ) ( ON ?auto_189596 ?auto_189597 ) ( CLEAR ?auto_189596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189592 ?auto_189593 ?auto_189594 ?auto_189595 ?auto_189596 )
      ( MAKE-8PILE ?auto_189592 ?auto_189593 ?auto_189594 ?auto_189595 ?auto_189596 ?auto_189597 ?auto_189598 ?auto_189599 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189609 - BLOCK
      ?auto_189610 - BLOCK
      ?auto_189611 - BLOCK
      ?auto_189612 - BLOCK
      ?auto_189613 - BLOCK
      ?auto_189614 - BLOCK
      ?auto_189615 - BLOCK
      ?auto_189616 - BLOCK
    )
    :vars
    (
      ?auto_189617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189616 ?auto_189617 ) ( ON-TABLE ?auto_189609 ) ( ON ?auto_189610 ?auto_189609 ) ( ON ?auto_189611 ?auto_189610 ) ( ON ?auto_189612 ?auto_189611 ) ( not ( = ?auto_189609 ?auto_189610 ) ) ( not ( = ?auto_189609 ?auto_189611 ) ) ( not ( = ?auto_189609 ?auto_189612 ) ) ( not ( = ?auto_189609 ?auto_189613 ) ) ( not ( = ?auto_189609 ?auto_189614 ) ) ( not ( = ?auto_189609 ?auto_189615 ) ) ( not ( = ?auto_189609 ?auto_189616 ) ) ( not ( = ?auto_189609 ?auto_189617 ) ) ( not ( = ?auto_189610 ?auto_189611 ) ) ( not ( = ?auto_189610 ?auto_189612 ) ) ( not ( = ?auto_189610 ?auto_189613 ) ) ( not ( = ?auto_189610 ?auto_189614 ) ) ( not ( = ?auto_189610 ?auto_189615 ) ) ( not ( = ?auto_189610 ?auto_189616 ) ) ( not ( = ?auto_189610 ?auto_189617 ) ) ( not ( = ?auto_189611 ?auto_189612 ) ) ( not ( = ?auto_189611 ?auto_189613 ) ) ( not ( = ?auto_189611 ?auto_189614 ) ) ( not ( = ?auto_189611 ?auto_189615 ) ) ( not ( = ?auto_189611 ?auto_189616 ) ) ( not ( = ?auto_189611 ?auto_189617 ) ) ( not ( = ?auto_189612 ?auto_189613 ) ) ( not ( = ?auto_189612 ?auto_189614 ) ) ( not ( = ?auto_189612 ?auto_189615 ) ) ( not ( = ?auto_189612 ?auto_189616 ) ) ( not ( = ?auto_189612 ?auto_189617 ) ) ( not ( = ?auto_189613 ?auto_189614 ) ) ( not ( = ?auto_189613 ?auto_189615 ) ) ( not ( = ?auto_189613 ?auto_189616 ) ) ( not ( = ?auto_189613 ?auto_189617 ) ) ( not ( = ?auto_189614 ?auto_189615 ) ) ( not ( = ?auto_189614 ?auto_189616 ) ) ( not ( = ?auto_189614 ?auto_189617 ) ) ( not ( = ?auto_189615 ?auto_189616 ) ) ( not ( = ?auto_189615 ?auto_189617 ) ) ( not ( = ?auto_189616 ?auto_189617 ) ) ( ON ?auto_189615 ?auto_189616 ) ( ON ?auto_189614 ?auto_189615 ) ( CLEAR ?auto_189612 ) ( ON ?auto_189613 ?auto_189614 ) ( CLEAR ?auto_189613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189609 ?auto_189610 ?auto_189611 ?auto_189612 ?auto_189613 )
      ( MAKE-8PILE ?auto_189609 ?auto_189610 ?auto_189611 ?auto_189612 ?auto_189613 ?auto_189614 ?auto_189615 ?auto_189616 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189626 - BLOCK
      ?auto_189627 - BLOCK
      ?auto_189628 - BLOCK
      ?auto_189629 - BLOCK
      ?auto_189630 - BLOCK
      ?auto_189631 - BLOCK
      ?auto_189632 - BLOCK
      ?auto_189633 - BLOCK
    )
    :vars
    (
      ?auto_189634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189633 ?auto_189634 ) ( ON-TABLE ?auto_189626 ) ( ON ?auto_189627 ?auto_189626 ) ( ON ?auto_189628 ?auto_189627 ) ( not ( = ?auto_189626 ?auto_189627 ) ) ( not ( = ?auto_189626 ?auto_189628 ) ) ( not ( = ?auto_189626 ?auto_189629 ) ) ( not ( = ?auto_189626 ?auto_189630 ) ) ( not ( = ?auto_189626 ?auto_189631 ) ) ( not ( = ?auto_189626 ?auto_189632 ) ) ( not ( = ?auto_189626 ?auto_189633 ) ) ( not ( = ?auto_189626 ?auto_189634 ) ) ( not ( = ?auto_189627 ?auto_189628 ) ) ( not ( = ?auto_189627 ?auto_189629 ) ) ( not ( = ?auto_189627 ?auto_189630 ) ) ( not ( = ?auto_189627 ?auto_189631 ) ) ( not ( = ?auto_189627 ?auto_189632 ) ) ( not ( = ?auto_189627 ?auto_189633 ) ) ( not ( = ?auto_189627 ?auto_189634 ) ) ( not ( = ?auto_189628 ?auto_189629 ) ) ( not ( = ?auto_189628 ?auto_189630 ) ) ( not ( = ?auto_189628 ?auto_189631 ) ) ( not ( = ?auto_189628 ?auto_189632 ) ) ( not ( = ?auto_189628 ?auto_189633 ) ) ( not ( = ?auto_189628 ?auto_189634 ) ) ( not ( = ?auto_189629 ?auto_189630 ) ) ( not ( = ?auto_189629 ?auto_189631 ) ) ( not ( = ?auto_189629 ?auto_189632 ) ) ( not ( = ?auto_189629 ?auto_189633 ) ) ( not ( = ?auto_189629 ?auto_189634 ) ) ( not ( = ?auto_189630 ?auto_189631 ) ) ( not ( = ?auto_189630 ?auto_189632 ) ) ( not ( = ?auto_189630 ?auto_189633 ) ) ( not ( = ?auto_189630 ?auto_189634 ) ) ( not ( = ?auto_189631 ?auto_189632 ) ) ( not ( = ?auto_189631 ?auto_189633 ) ) ( not ( = ?auto_189631 ?auto_189634 ) ) ( not ( = ?auto_189632 ?auto_189633 ) ) ( not ( = ?auto_189632 ?auto_189634 ) ) ( not ( = ?auto_189633 ?auto_189634 ) ) ( ON ?auto_189632 ?auto_189633 ) ( ON ?auto_189631 ?auto_189632 ) ( ON ?auto_189630 ?auto_189631 ) ( CLEAR ?auto_189628 ) ( ON ?auto_189629 ?auto_189630 ) ( CLEAR ?auto_189629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189626 ?auto_189627 ?auto_189628 ?auto_189629 )
      ( MAKE-8PILE ?auto_189626 ?auto_189627 ?auto_189628 ?auto_189629 ?auto_189630 ?auto_189631 ?auto_189632 ?auto_189633 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189643 - BLOCK
      ?auto_189644 - BLOCK
      ?auto_189645 - BLOCK
      ?auto_189646 - BLOCK
      ?auto_189647 - BLOCK
      ?auto_189648 - BLOCK
      ?auto_189649 - BLOCK
      ?auto_189650 - BLOCK
    )
    :vars
    (
      ?auto_189651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189650 ?auto_189651 ) ( ON-TABLE ?auto_189643 ) ( ON ?auto_189644 ?auto_189643 ) ( ON ?auto_189645 ?auto_189644 ) ( not ( = ?auto_189643 ?auto_189644 ) ) ( not ( = ?auto_189643 ?auto_189645 ) ) ( not ( = ?auto_189643 ?auto_189646 ) ) ( not ( = ?auto_189643 ?auto_189647 ) ) ( not ( = ?auto_189643 ?auto_189648 ) ) ( not ( = ?auto_189643 ?auto_189649 ) ) ( not ( = ?auto_189643 ?auto_189650 ) ) ( not ( = ?auto_189643 ?auto_189651 ) ) ( not ( = ?auto_189644 ?auto_189645 ) ) ( not ( = ?auto_189644 ?auto_189646 ) ) ( not ( = ?auto_189644 ?auto_189647 ) ) ( not ( = ?auto_189644 ?auto_189648 ) ) ( not ( = ?auto_189644 ?auto_189649 ) ) ( not ( = ?auto_189644 ?auto_189650 ) ) ( not ( = ?auto_189644 ?auto_189651 ) ) ( not ( = ?auto_189645 ?auto_189646 ) ) ( not ( = ?auto_189645 ?auto_189647 ) ) ( not ( = ?auto_189645 ?auto_189648 ) ) ( not ( = ?auto_189645 ?auto_189649 ) ) ( not ( = ?auto_189645 ?auto_189650 ) ) ( not ( = ?auto_189645 ?auto_189651 ) ) ( not ( = ?auto_189646 ?auto_189647 ) ) ( not ( = ?auto_189646 ?auto_189648 ) ) ( not ( = ?auto_189646 ?auto_189649 ) ) ( not ( = ?auto_189646 ?auto_189650 ) ) ( not ( = ?auto_189646 ?auto_189651 ) ) ( not ( = ?auto_189647 ?auto_189648 ) ) ( not ( = ?auto_189647 ?auto_189649 ) ) ( not ( = ?auto_189647 ?auto_189650 ) ) ( not ( = ?auto_189647 ?auto_189651 ) ) ( not ( = ?auto_189648 ?auto_189649 ) ) ( not ( = ?auto_189648 ?auto_189650 ) ) ( not ( = ?auto_189648 ?auto_189651 ) ) ( not ( = ?auto_189649 ?auto_189650 ) ) ( not ( = ?auto_189649 ?auto_189651 ) ) ( not ( = ?auto_189650 ?auto_189651 ) ) ( ON ?auto_189649 ?auto_189650 ) ( ON ?auto_189648 ?auto_189649 ) ( ON ?auto_189647 ?auto_189648 ) ( CLEAR ?auto_189645 ) ( ON ?auto_189646 ?auto_189647 ) ( CLEAR ?auto_189646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189643 ?auto_189644 ?auto_189645 ?auto_189646 )
      ( MAKE-8PILE ?auto_189643 ?auto_189644 ?auto_189645 ?auto_189646 ?auto_189647 ?auto_189648 ?auto_189649 ?auto_189650 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189660 - BLOCK
      ?auto_189661 - BLOCK
      ?auto_189662 - BLOCK
      ?auto_189663 - BLOCK
      ?auto_189664 - BLOCK
      ?auto_189665 - BLOCK
      ?auto_189666 - BLOCK
      ?auto_189667 - BLOCK
    )
    :vars
    (
      ?auto_189668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189667 ?auto_189668 ) ( ON-TABLE ?auto_189660 ) ( ON ?auto_189661 ?auto_189660 ) ( not ( = ?auto_189660 ?auto_189661 ) ) ( not ( = ?auto_189660 ?auto_189662 ) ) ( not ( = ?auto_189660 ?auto_189663 ) ) ( not ( = ?auto_189660 ?auto_189664 ) ) ( not ( = ?auto_189660 ?auto_189665 ) ) ( not ( = ?auto_189660 ?auto_189666 ) ) ( not ( = ?auto_189660 ?auto_189667 ) ) ( not ( = ?auto_189660 ?auto_189668 ) ) ( not ( = ?auto_189661 ?auto_189662 ) ) ( not ( = ?auto_189661 ?auto_189663 ) ) ( not ( = ?auto_189661 ?auto_189664 ) ) ( not ( = ?auto_189661 ?auto_189665 ) ) ( not ( = ?auto_189661 ?auto_189666 ) ) ( not ( = ?auto_189661 ?auto_189667 ) ) ( not ( = ?auto_189661 ?auto_189668 ) ) ( not ( = ?auto_189662 ?auto_189663 ) ) ( not ( = ?auto_189662 ?auto_189664 ) ) ( not ( = ?auto_189662 ?auto_189665 ) ) ( not ( = ?auto_189662 ?auto_189666 ) ) ( not ( = ?auto_189662 ?auto_189667 ) ) ( not ( = ?auto_189662 ?auto_189668 ) ) ( not ( = ?auto_189663 ?auto_189664 ) ) ( not ( = ?auto_189663 ?auto_189665 ) ) ( not ( = ?auto_189663 ?auto_189666 ) ) ( not ( = ?auto_189663 ?auto_189667 ) ) ( not ( = ?auto_189663 ?auto_189668 ) ) ( not ( = ?auto_189664 ?auto_189665 ) ) ( not ( = ?auto_189664 ?auto_189666 ) ) ( not ( = ?auto_189664 ?auto_189667 ) ) ( not ( = ?auto_189664 ?auto_189668 ) ) ( not ( = ?auto_189665 ?auto_189666 ) ) ( not ( = ?auto_189665 ?auto_189667 ) ) ( not ( = ?auto_189665 ?auto_189668 ) ) ( not ( = ?auto_189666 ?auto_189667 ) ) ( not ( = ?auto_189666 ?auto_189668 ) ) ( not ( = ?auto_189667 ?auto_189668 ) ) ( ON ?auto_189666 ?auto_189667 ) ( ON ?auto_189665 ?auto_189666 ) ( ON ?auto_189664 ?auto_189665 ) ( ON ?auto_189663 ?auto_189664 ) ( CLEAR ?auto_189661 ) ( ON ?auto_189662 ?auto_189663 ) ( CLEAR ?auto_189662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189660 ?auto_189661 ?auto_189662 )
      ( MAKE-8PILE ?auto_189660 ?auto_189661 ?auto_189662 ?auto_189663 ?auto_189664 ?auto_189665 ?auto_189666 ?auto_189667 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189677 - BLOCK
      ?auto_189678 - BLOCK
      ?auto_189679 - BLOCK
      ?auto_189680 - BLOCK
      ?auto_189681 - BLOCK
      ?auto_189682 - BLOCK
      ?auto_189683 - BLOCK
      ?auto_189684 - BLOCK
    )
    :vars
    (
      ?auto_189685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189684 ?auto_189685 ) ( ON-TABLE ?auto_189677 ) ( ON ?auto_189678 ?auto_189677 ) ( not ( = ?auto_189677 ?auto_189678 ) ) ( not ( = ?auto_189677 ?auto_189679 ) ) ( not ( = ?auto_189677 ?auto_189680 ) ) ( not ( = ?auto_189677 ?auto_189681 ) ) ( not ( = ?auto_189677 ?auto_189682 ) ) ( not ( = ?auto_189677 ?auto_189683 ) ) ( not ( = ?auto_189677 ?auto_189684 ) ) ( not ( = ?auto_189677 ?auto_189685 ) ) ( not ( = ?auto_189678 ?auto_189679 ) ) ( not ( = ?auto_189678 ?auto_189680 ) ) ( not ( = ?auto_189678 ?auto_189681 ) ) ( not ( = ?auto_189678 ?auto_189682 ) ) ( not ( = ?auto_189678 ?auto_189683 ) ) ( not ( = ?auto_189678 ?auto_189684 ) ) ( not ( = ?auto_189678 ?auto_189685 ) ) ( not ( = ?auto_189679 ?auto_189680 ) ) ( not ( = ?auto_189679 ?auto_189681 ) ) ( not ( = ?auto_189679 ?auto_189682 ) ) ( not ( = ?auto_189679 ?auto_189683 ) ) ( not ( = ?auto_189679 ?auto_189684 ) ) ( not ( = ?auto_189679 ?auto_189685 ) ) ( not ( = ?auto_189680 ?auto_189681 ) ) ( not ( = ?auto_189680 ?auto_189682 ) ) ( not ( = ?auto_189680 ?auto_189683 ) ) ( not ( = ?auto_189680 ?auto_189684 ) ) ( not ( = ?auto_189680 ?auto_189685 ) ) ( not ( = ?auto_189681 ?auto_189682 ) ) ( not ( = ?auto_189681 ?auto_189683 ) ) ( not ( = ?auto_189681 ?auto_189684 ) ) ( not ( = ?auto_189681 ?auto_189685 ) ) ( not ( = ?auto_189682 ?auto_189683 ) ) ( not ( = ?auto_189682 ?auto_189684 ) ) ( not ( = ?auto_189682 ?auto_189685 ) ) ( not ( = ?auto_189683 ?auto_189684 ) ) ( not ( = ?auto_189683 ?auto_189685 ) ) ( not ( = ?auto_189684 ?auto_189685 ) ) ( ON ?auto_189683 ?auto_189684 ) ( ON ?auto_189682 ?auto_189683 ) ( ON ?auto_189681 ?auto_189682 ) ( ON ?auto_189680 ?auto_189681 ) ( CLEAR ?auto_189678 ) ( ON ?auto_189679 ?auto_189680 ) ( CLEAR ?auto_189679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189677 ?auto_189678 ?auto_189679 )
      ( MAKE-8PILE ?auto_189677 ?auto_189678 ?auto_189679 ?auto_189680 ?auto_189681 ?auto_189682 ?auto_189683 ?auto_189684 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189694 - BLOCK
      ?auto_189695 - BLOCK
      ?auto_189696 - BLOCK
      ?auto_189697 - BLOCK
      ?auto_189698 - BLOCK
      ?auto_189699 - BLOCK
      ?auto_189700 - BLOCK
      ?auto_189701 - BLOCK
    )
    :vars
    (
      ?auto_189702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189701 ?auto_189702 ) ( ON-TABLE ?auto_189694 ) ( not ( = ?auto_189694 ?auto_189695 ) ) ( not ( = ?auto_189694 ?auto_189696 ) ) ( not ( = ?auto_189694 ?auto_189697 ) ) ( not ( = ?auto_189694 ?auto_189698 ) ) ( not ( = ?auto_189694 ?auto_189699 ) ) ( not ( = ?auto_189694 ?auto_189700 ) ) ( not ( = ?auto_189694 ?auto_189701 ) ) ( not ( = ?auto_189694 ?auto_189702 ) ) ( not ( = ?auto_189695 ?auto_189696 ) ) ( not ( = ?auto_189695 ?auto_189697 ) ) ( not ( = ?auto_189695 ?auto_189698 ) ) ( not ( = ?auto_189695 ?auto_189699 ) ) ( not ( = ?auto_189695 ?auto_189700 ) ) ( not ( = ?auto_189695 ?auto_189701 ) ) ( not ( = ?auto_189695 ?auto_189702 ) ) ( not ( = ?auto_189696 ?auto_189697 ) ) ( not ( = ?auto_189696 ?auto_189698 ) ) ( not ( = ?auto_189696 ?auto_189699 ) ) ( not ( = ?auto_189696 ?auto_189700 ) ) ( not ( = ?auto_189696 ?auto_189701 ) ) ( not ( = ?auto_189696 ?auto_189702 ) ) ( not ( = ?auto_189697 ?auto_189698 ) ) ( not ( = ?auto_189697 ?auto_189699 ) ) ( not ( = ?auto_189697 ?auto_189700 ) ) ( not ( = ?auto_189697 ?auto_189701 ) ) ( not ( = ?auto_189697 ?auto_189702 ) ) ( not ( = ?auto_189698 ?auto_189699 ) ) ( not ( = ?auto_189698 ?auto_189700 ) ) ( not ( = ?auto_189698 ?auto_189701 ) ) ( not ( = ?auto_189698 ?auto_189702 ) ) ( not ( = ?auto_189699 ?auto_189700 ) ) ( not ( = ?auto_189699 ?auto_189701 ) ) ( not ( = ?auto_189699 ?auto_189702 ) ) ( not ( = ?auto_189700 ?auto_189701 ) ) ( not ( = ?auto_189700 ?auto_189702 ) ) ( not ( = ?auto_189701 ?auto_189702 ) ) ( ON ?auto_189700 ?auto_189701 ) ( ON ?auto_189699 ?auto_189700 ) ( ON ?auto_189698 ?auto_189699 ) ( ON ?auto_189697 ?auto_189698 ) ( ON ?auto_189696 ?auto_189697 ) ( CLEAR ?auto_189694 ) ( ON ?auto_189695 ?auto_189696 ) ( CLEAR ?auto_189695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189694 ?auto_189695 )
      ( MAKE-8PILE ?auto_189694 ?auto_189695 ?auto_189696 ?auto_189697 ?auto_189698 ?auto_189699 ?auto_189700 ?auto_189701 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189711 - BLOCK
      ?auto_189712 - BLOCK
      ?auto_189713 - BLOCK
      ?auto_189714 - BLOCK
      ?auto_189715 - BLOCK
      ?auto_189716 - BLOCK
      ?auto_189717 - BLOCK
      ?auto_189718 - BLOCK
    )
    :vars
    (
      ?auto_189719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189718 ?auto_189719 ) ( ON-TABLE ?auto_189711 ) ( not ( = ?auto_189711 ?auto_189712 ) ) ( not ( = ?auto_189711 ?auto_189713 ) ) ( not ( = ?auto_189711 ?auto_189714 ) ) ( not ( = ?auto_189711 ?auto_189715 ) ) ( not ( = ?auto_189711 ?auto_189716 ) ) ( not ( = ?auto_189711 ?auto_189717 ) ) ( not ( = ?auto_189711 ?auto_189718 ) ) ( not ( = ?auto_189711 ?auto_189719 ) ) ( not ( = ?auto_189712 ?auto_189713 ) ) ( not ( = ?auto_189712 ?auto_189714 ) ) ( not ( = ?auto_189712 ?auto_189715 ) ) ( not ( = ?auto_189712 ?auto_189716 ) ) ( not ( = ?auto_189712 ?auto_189717 ) ) ( not ( = ?auto_189712 ?auto_189718 ) ) ( not ( = ?auto_189712 ?auto_189719 ) ) ( not ( = ?auto_189713 ?auto_189714 ) ) ( not ( = ?auto_189713 ?auto_189715 ) ) ( not ( = ?auto_189713 ?auto_189716 ) ) ( not ( = ?auto_189713 ?auto_189717 ) ) ( not ( = ?auto_189713 ?auto_189718 ) ) ( not ( = ?auto_189713 ?auto_189719 ) ) ( not ( = ?auto_189714 ?auto_189715 ) ) ( not ( = ?auto_189714 ?auto_189716 ) ) ( not ( = ?auto_189714 ?auto_189717 ) ) ( not ( = ?auto_189714 ?auto_189718 ) ) ( not ( = ?auto_189714 ?auto_189719 ) ) ( not ( = ?auto_189715 ?auto_189716 ) ) ( not ( = ?auto_189715 ?auto_189717 ) ) ( not ( = ?auto_189715 ?auto_189718 ) ) ( not ( = ?auto_189715 ?auto_189719 ) ) ( not ( = ?auto_189716 ?auto_189717 ) ) ( not ( = ?auto_189716 ?auto_189718 ) ) ( not ( = ?auto_189716 ?auto_189719 ) ) ( not ( = ?auto_189717 ?auto_189718 ) ) ( not ( = ?auto_189717 ?auto_189719 ) ) ( not ( = ?auto_189718 ?auto_189719 ) ) ( ON ?auto_189717 ?auto_189718 ) ( ON ?auto_189716 ?auto_189717 ) ( ON ?auto_189715 ?auto_189716 ) ( ON ?auto_189714 ?auto_189715 ) ( ON ?auto_189713 ?auto_189714 ) ( CLEAR ?auto_189711 ) ( ON ?auto_189712 ?auto_189713 ) ( CLEAR ?auto_189712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_189711 ?auto_189712 )
      ( MAKE-8PILE ?auto_189711 ?auto_189712 ?auto_189713 ?auto_189714 ?auto_189715 ?auto_189716 ?auto_189717 ?auto_189718 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189728 - BLOCK
      ?auto_189729 - BLOCK
      ?auto_189730 - BLOCK
      ?auto_189731 - BLOCK
      ?auto_189732 - BLOCK
      ?auto_189733 - BLOCK
      ?auto_189734 - BLOCK
      ?auto_189735 - BLOCK
    )
    :vars
    (
      ?auto_189736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189735 ?auto_189736 ) ( not ( = ?auto_189728 ?auto_189729 ) ) ( not ( = ?auto_189728 ?auto_189730 ) ) ( not ( = ?auto_189728 ?auto_189731 ) ) ( not ( = ?auto_189728 ?auto_189732 ) ) ( not ( = ?auto_189728 ?auto_189733 ) ) ( not ( = ?auto_189728 ?auto_189734 ) ) ( not ( = ?auto_189728 ?auto_189735 ) ) ( not ( = ?auto_189728 ?auto_189736 ) ) ( not ( = ?auto_189729 ?auto_189730 ) ) ( not ( = ?auto_189729 ?auto_189731 ) ) ( not ( = ?auto_189729 ?auto_189732 ) ) ( not ( = ?auto_189729 ?auto_189733 ) ) ( not ( = ?auto_189729 ?auto_189734 ) ) ( not ( = ?auto_189729 ?auto_189735 ) ) ( not ( = ?auto_189729 ?auto_189736 ) ) ( not ( = ?auto_189730 ?auto_189731 ) ) ( not ( = ?auto_189730 ?auto_189732 ) ) ( not ( = ?auto_189730 ?auto_189733 ) ) ( not ( = ?auto_189730 ?auto_189734 ) ) ( not ( = ?auto_189730 ?auto_189735 ) ) ( not ( = ?auto_189730 ?auto_189736 ) ) ( not ( = ?auto_189731 ?auto_189732 ) ) ( not ( = ?auto_189731 ?auto_189733 ) ) ( not ( = ?auto_189731 ?auto_189734 ) ) ( not ( = ?auto_189731 ?auto_189735 ) ) ( not ( = ?auto_189731 ?auto_189736 ) ) ( not ( = ?auto_189732 ?auto_189733 ) ) ( not ( = ?auto_189732 ?auto_189734 ) ) ( not ( = ?auto_189732 ?auto_189735 ) ) ( not ( = ?auto_189732 ?auto_189736 ) ) ( not ( = ?auto_189733 ?auto_189734 ) ) ( not ( = ?auto_189733 ?auto_189735 ) ) ( not ( = ?auto_189733 ?auto_189736 ) ) ( not ( = ?auto_189734 ?auto_189735 ) ) ( not ( = ?auto_189734 ?auto_189736 ) ) ( not ( = ?auto_189735 ?auto_189736 ) ) ( ON ?auto_189734 ?auto_189735 ) ( ON ?auto_189733 ?auto_189734 ) ( ON ?auto_189732 ?auto_189733 ) ( ON ?auto_189731 ?auto_189732 ) ( ON ?auto_189730 ?auto_189731 ) ( ON ?auto_189729 ?auto_189730 ) ( ON ?auto_189728 ?auto_189729 ) ( CLEAR ?auto_189728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189728 )
      ( MAKE-8PILE ?auto_189728 ?auto_189729 ?auto_189730 ?auto_189731 ?auto_189732 ?auto_189733 ?auto_189734 ?auto_189735 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_189745 - BLOCK
      ?auto_189746 - BLOCK
      ?auto_189747 - BLOCK
      ?auto_189748 - BLOCK
      ?auto_189749 - BLOCK
      ?auto_189750 - BLOCK
      ?auto_189751 - BLOCK
      ?auto_189752 - BLOCK
    )
    :vars
    (
      ?auto_189753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189752 ?auto_189753 ) ( not ( = ?auto_189745 ?auto_189746 ) ) ( not ( = ?auto_189745 ?auto_189747 ) ) ( not ( = ?auto_189745 ?auto_189748 ) ) ( not ( = ?auto_189745 ?auto_189749 ) ) ( not ( = ?auto_189745 ?auto_189750 ) ) ( not ( = ?auto_189745 ?auto_189751 ) ) ( not ( = ?auto_189745 ?auto_189752 ) ) ( not ( = ?auto_189745 ?auto_189753 ) ) ( not ( = ?auto_189746 ?auto_189747 ) ) ( not ( = ?auto_189746 ?auto_189748 ) ) ( not ( = ?auto_189746 ?auto_189749 ) ) ( not ( = ?auto_189746 ?auto_189750 ) ) ( not ( = ?auto_189746 ?auto_189751 ) ) ( not ( = ?auto_189746 ?auto_189752 ) ) ( not ( = ?auto_189746 ?auto_189753 ) ) ( not ( = ?auto_189747 ?auto_189748 ) ) ( not ( = ?auto_189747 ?auto_189749 ) ) ( not ( = ?auto_189747 ?auto_189750 ) ) ( not ( = ?auto_189747 ?auto_189751 ) ) ( not ( = ?auto_189747 ?auto_189752 ) ) ( not ( = ?auto_189747 ?auto_189753 ) ) ( not ( = ?auto_189748 ?auto_189749 ) ) ( not ( = ?auto_189748 ?auto_189750 ) ) ( not ( = ?auto_189748 ?auto_189751 ) ) ( not ( = ?auto_189748 ?auto_189752 ) ) ( not ( = ?auto_189748 ?auto_189753 ) ) ( not ( = ?auto_189749 ?auto_189750 ) ) ( not ( = ?auto_189749 ?auto_189751 ) ) ( not ( = ?auto_189749 ?auto_189752 ) ) ( not ( = ?auto_189749 ?auto_189753 ) ) ( not ( = ?auto_189750 ?auto_189751 ) ) ( not ( = ?auto_189750 ?auto_189752 ) ) ( not ( = ?auto_189750 ?auto_189753 ) ) ( not ( = ?auto_189751 ?auto_189752 ) ) ( not ( = ?auto_189751 ?auto_189753 ) ) ( not ( = ?auto_189752 ?auto_189753 ) ) ( ON ?auto_189751 ?auto_189752 ) ( ON ?auto_189750 ?auto_189751 ) ( ON ?auto_189749 ?auto_189750 ) ( ON ?auto_189748 ?auto_189749 ) ( ON ?auto_189747 ?auto_189748 ) ( ON ?auto_189746 ?auto_189747 ) ( ON ?auto_189745 ?auto_189746 ) ( CLEAR ?auto_189745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_189745 )
      ( MAKE-8PILE ?auto_189745 ?auto_189746 ?auto_189747 ?auto_189748 ?auto_189749 ?auto_189750 ?auto_189751 ?auto_189752 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189763 - BLOCK
      ?auto_189764 - BLOCK
      ?auto_189765 - BLOCK
      ?auto_189766 - BLOCK
      ?auto_189767 - BLOCK
      ?auto_189768 - BLOCK
      ?auto_189769 - BLOCK
      ?auto_189770 - BLOCK
      ?auto_189771 - BLOCK
    )
    :vars
    (
      ?auto_189772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189770 ) ( ON ?auto_189771 ?auto_189772 ) ( CLEAR ?auto_189771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189763 ) ( ON ?auto_189764 ?auto_189763 ) ( ON ?auto_189765 ?auto_189764 ) ( ON ?auto_189766 ?auto_189765 ) ( ON ?auto_189767 ?auto_189766 ) ( ON ?auto_189768 ?auto_189767 ) ( ON ?auto_189769 ?auto_189768 ) ( ON ?auto_189770 ?auto_189769 ) ( not ( = ?auto_189763 ?auto_189764 ) ) ( not ( = ?auto_189763 ?auto_189765 ) ) ( not ( = ?auto_189763 ?auto_189766 ) ) ( not ( = ?auto_189763 ?auto_189767 ) ) ( not ( = ?auto_189763 ?auto_189768 ) ) ( not ( = ?auto_189763 ?auto_189769 ) ) ( not ( = ?auto_189763 ?auto_189770 ) ) ( not ( = ?auto_189763 ?auto_189771 ) ) ( not ( = ?auto_189763 ?auto_189772 ) ) ( not ( = ?auto_189764 ?auto_189765 ) ) ( not ( = ?auto_189764 ?auto_189766 ) ) ( not ( = ?auto_189764 ?auto_189767 ) ) ( not ( = ?auto_189764 ?auto_189768 ) ) ( not ( = ?auto_189764 ?auto_189769 ) ) ( not ( = ?auto_189764 ?auto_189770 ) ) ( not ( = ?auto_189764 ?auto_189771 ) ) ( not ( = ?auto_189764 ?auto_189772 ) ) ( not ( = ?auto_189765 ?auto_189766 ) ) ( not ( = ?auto_189765 ?auto_189767 ) ) ( not ( = ?auto_189765 ?auto_189768 ) ) ( not ( = ?auto_189765 ?auto_189769 ) ) ( not ( = ?auto_189765 ?auto_189770 ) ) ( not ( = ?auto_189765 ?auto_189771 ) ) ( not ( = ?auto_189765 ?auto_189772 ) ) ( not ( = ?auto_189766 ?auto_189767 ) ) ( not ( = ?auto_189766 ?auto_189768 ) ) ( not ( = ?auto_189766 ?auto_189769 ) ) ( not ( = ?auto_189766 ?auto_189770 ) ) ( not ( = ?auto_189766 ?auto_189771 ) ) ( not ( = ?auto_189766 ?auto_189772 ) ) ( not ( = ?auto_189767 ?auto_189768 ) ) ( not ( = ?auto_189767 ?auto_189769 ) ) ( not ( = ?auto_189767 ?auto_189770 ) ) ( not ( = ?auto_189767 ?auto_189771 ) ) ( not ( = ?auto_189767 ?auto_189772 ) ) ( not ( = ?auto_189768 ?auto_189769 ) ) ( not ( = ?auto_189768 ?auto_189770 ) ) ( not ( = ?auto_189768 ?auto_189771 ) ) ( not ( = ?auto_189768 ?auto_189772 ) ) ( not ( = ?auto_189769 ?auto_189770 ) ) ( not ( = ?auto_189769 ?auto_189771 ) ) ( not ( = ?auto_189769 ?auto_189772 ) ) ( not ( = ?auto_189770 ?auto_189771 ) ) ( not ( = ?auto_189770 ?auto_189772 ) ) ( not ( = ?auto_189771 ?auto_189772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189771 ?auto_189772 )
      ( !STACK ?auto_189771 ?auto_189770 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189782 - BLOCK
      ?auto_189783 - BLOCK
      ?auto_189784 - BLOCK
      ?auto_189785 - BLOCK
      ?auto_189786 - BLOCK
      ?auto_189787 - BLOCK
      ?auto_189788 - BLOCK
      ?auto_189789 - BLOCK
      ?auto_189790 - BLOCK
    )
    :vars
    (
      ?auto_189791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_189789 ) ( ON ?auto_189790 ?auto_189791 ) ( CLEAR ?auto_189790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_189782 ) ( ON ?auto_189783 ?auto_189782 ) ( ON ?auto_189784 ?auto_189783 ) ( ON ?auto_189785 ?auto_189784 ) ( ON ?auto_189786 ?auto_189785 ) ( ON ?auto_189787 ?auto_189786 ) ( ON ?auto_189788 ?auto_189787 ) ( ON ?auto_189789 ?auto_189788 ) ( not ( = ?auto_189782 ?auto_189783 ) ) ( not ( = ?auto_189782 ?auto_189784 ) ) ( not ( = ?auto_189782 ?auto_189785 ) ) ( not ( = ?auto_189782 ?auto_189786 ) ) ( not ( = ?auto_189782 ?auto_189787 ) ) ( not ( = ?auto_189782 ?auto_189788 ) ) ( not ( = ?auto_189782 ?auto_189789 ) ) ( not ( = ?auto_189782 ?auto_189790 ) ) ( not ( = ?auto_189782 ?auto_189791 ) ) ( not ( = ?auto_189783 ?auto_189784 ) ) ( not ( = ?auto_189783 ?auto_189785 ) ) ( not ( = ?auto_189783 ?auto_189786 ) ) ( not ( = ?auto_189783 ?auto_189787 ) ) ( not ( = ?auto_189783 ?auto_189788 ) ) ( not ( = ?auto_189783 ?auto_189789 ) ) ( not ( = ?auto_189783 ?auto_189790 ) ) ( not ( = ?auto_189783 ?auto_189791 ) ) ( not ( = ?auto_189784 ?auto_189785 ) ) ( not ( = ?auto_189784 ?auto_189786 ) ) ( not ( = ?auto_189784 ?auto_189787 ) ) ( not ( = ?auto_189784 ?auto_189788 ) ) ( not ( = ?auto_189784 ?auto_189789 ) ) ( not ( = ?auto_189784 ?auto_189790 ) ) ( not ( = ?auto_189784 ?auto_189791 ) ) ( not ( = ?auto_189785 ?auto_189786 ) ) ( not ( = ?auto_189785 ?auto_189787 ) ) ( not ( = ?auto_189785 ?auto_189788 ) ) ( not ( = ?auto_189785 ?auto_189789 ) ) ( not ( = ?auto_189785 ?auto_189790 ) ) ( not ( = ?auto_189785 ?auto_189791 ) ) ( not ( = ?auto_189786 ?auto_189787 ) ) ( not ( = ?auto_189786 ?auto_189788 ) ) ( not ( = ?auto_189786 ?auto_189789 ) ) ( not ( = ?auto_189786 ?auto_189790 ) ) ( not ( = ?auto_189786 ?auto_189791 ) ) ( not ( = ?auto_189787 ?auto_189788 ) ) ( not ( = ?auto_189787 ?auto_189789 ) ) ( not ( = ?auto_189787 ?auto_189790 ) ) ( not ( = ?auto_189787 ?auto_189791 ) ) ( not ( = ?auto_189788 ?auto_189789 ) ) ( not ( = ?auto_189788 ?auto_189790 ) ) ( not ( = ?auto_189788 ?auto_189791 ) ) ( not ( = ?auto_189789 ?auto_189790 ) ) ( not ( = ?auto_189789 ?auto_189791 ) ) ( not ( = ?auto_189790 ?auto_189791 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_189790 ?auto_189791 )
      ( !STACK ?auto_189790 ?auto_189789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189801 - BLOCK
      ?auto_189802 - BLOCK
      ?auto_189803 - BLOCK
      ?auto_189804 - BLOCK
      ?auto_189805 - BLOCK
      ?auto_189806 - BLOCK
      ?auto_189807 - BLOCK
      ?auto_189808 - BLOCK
      ?auto_189809 - BLOCK
    )
    :vars
    (
      ?auto_189810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189809 ?auto_189810 ) ( ON-TABLE ?auto_189801 ) ( ON ?auto_189802 ?auto_189801 ) ( ON ?auto_189803 ?auto_189802 ) ( ON ?auto_189804 ?auto_189803 ) ( ON ?auto_189805 ?auto_189804 ) ( ON ?auto_189806 ?auto_189805 ) ( ON ?auto_189807 ?auto_189806 ) ( not ( = ?auto_189801 ?auto_189802 ) ) ( not ( = ?auto_189801 ?auto_189803 ) ) ( not ( = ?auto_189801 ?auto_189804 ) ) ( not ( = ?auto_189801 ?auto_189805 ) ) ( not ( = ?auto_189801 ?auto_189806 ) ) ( not ( = ?auto_189801 ?auto_189807 ) ) ( not ( = ?auto_189801 ?auto_189808 ) ) ( not ( = ?auto_189801 ?auto_189809 ) ) ( not ( = ?auto_189801 ?auto_189810 ) ) ( not ( = ?auto_189802 ?auto_189803 ) ) ( not ( = ?auto_189802 ?auto_189804 ) ) ( not ( = ?auto_189802 ?auto_189805 ) ) ( not ( = ?auto_189802 ?auto_189806 ) ) ( not ( = ?auto_189802 ?auto_189807 ) ) ( not ( = ?auto_189802 ?auto_189808 ) ) ( not ( = ?auto_189802 ?auto_189809 ) ) ( not ( = ?auto_189802 ?auto_189810 ) ) ( not ( = ?auto_189803 ?auto_189804 ) ) ( not ( = ?auto_189803 ?auto_189805 ) ) ( not ( = ?auto_189803 ?auto_189806 ) ) ( not ( = ?auto_189803 ?auto_189807 ) ) ( not ( = ?auto_189803 ?auto_189808 ) ) ( not ( = ?auto_189803 ?auto_189809 ) ) ( not ( = ?auto_189803 ?auto_189810 ) ) ( not ( = ?auto_189804 ?auto_189805 ) ) ( not ( = ?auto_189804 ?auto_189806 ) ) ( not ( = ?auto_189804 ?auto_189807 ) ) ( not ( = ?auto_189804 ?auto_189808 ) ) ( not ( = ?auto_189804 ?auto_189809 ) ) ( not ( = ?auto_189804 ?auto_189810 ) ) ( not ( = ?auto_189805 ?auto_189806 ) ) ( not ( = ?auto_189805 ?auto_189807 ) ) ( not ( = ?auto_189805 ?auto_189808 ) ) ( not ( = ?auto_189805 ?auto_189809 ) ) ( not ( = ?auto_189805 ?auto_189810 ) ) ( not ( = ?auto_189806 ?auto_189807 ) ) ( not ( = ?auto_189806 ?auto_189808 ) ) ( not ( = ?auto_189806 ?auto_189809 ) ) ( not ( = ?auto_189806 ?auto_189810 ) ) ( not ( = ?auto_189807 ?auto_189808 ) ) ( not ( = ?auto_189807 ?auto_189809 ) ) ( not ( = ?auto_189807 ?auto_189810 ) ) ( not ( = ?auto_189808 ?auto_189809 ) ) ( not ( = ?auto_189808 ?auto_189810 ) ) ( not ( = ?auto_189809 ?auto_189810 ) ) ( CLEAR ?auto_189807 ) ( ON ?auto_189808 ?auto_189809 ) ( CLEAR ?auto_189808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189801 ?auto_189802 ?auto_189803 ?auto_189804 ?auto_189805 ?auto_189806 ?auto_189807 ?auto_189808 )
      ( MAKE-9PILE ?auto_189801 ?auto_189802 ?auto_189803 ?auto_189804 ?auto_189805 ?auto_189806 ?auto_189807 ?auto_189808 ?auto_189809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189820 - BLOCK
      ?auto_189821 - BLOCK
      ?auto_189822 - BLOCK
      ?auto_189823 - BLOCK
      ?auto_189824 - BLOCK
      ?auto_189825 - BLOCK
      ?auto_189826 - BLOCK
      ?auto_189827 - BLOCK
      ?auto_189828 - BLOCK
    )
    :vars
    (
      ?auto_189829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189828 ?auto_189829 ) ( ON-TABLE ?auto_189820 ) ( ON ?auto_189821 ?auto_189820 ) ( ON ?auto_189822 ?auto_189821 ) ( ON ?auto_189823 ?auto_189822 ) ( ON ?auto_189824 ?auto_189823 ) ( ON ?auto_189825 ?auto_189824 ) ( ON ?auto_189826 ?auto_189825 ) ( not ( = ?auto_189820 ?auto_189821 ) ) ( not ( = ?auto_189820 ?auto_189822 ) ) ( not ( = ?auto_189820 ?auto_189823 ) ) ( not ( = ?auto_189820 ?auto_189824 ) ) ( not ( = ?auto_189820 ?auto_189825 ) ) ( not ( = ?auto_189820 ?auto_189826 ) ) ( not ( = ?auto_189820 ?auto_189827 ) ) ( not ( = ?auto_189820 ?auto_189828 ) ) ( not ( = ?auto_189820 ?auto_189829 ) ) ( not ( = ?auto_189821 ?auto_189822 ) ) ( not ( = ?auto_189821 ?auto_189823 ) ) ( not ( = ?auto_189821 ?auto_189824 ) ) ( not ( = ?auto_189821 ?auto_189825 ) ) ( not ( = ?auto_189821 ?auto_189826 ) ) ( not ( = ?auto_189821 ?auto_189827 ) ) ( not ( = ?auto_189821 ?auto_189828 ) ) ( not ( = ?auto_189821 ?auto_189829 ) ) ( not ( = ?auto_189822 ?auto_189823 ) ) ( not ( = ?auto_189822 ?auto_189824 ) ) ( not ( = ?auto_189822 ?auto_189825 ) ) ( not ( = ?auto_189822 ?auto_189826 ) ) ( not ( = ?auto_189822 ?auto_189827 ) ) ( not ( = ?auto_189822 ?auto_189828 ) ) ( not ( = ?auto_189822 ?auto_189829 ) ) ( not ( = ?auto_189823 ?auto_189824 ) ) ( not ( = ?auto_189823 ?auto_189825 ) ) ( not ( = ?auto_189823 ?auto_189826 ) ) ( not ( = ?auto_189823 ?auto_189827 ) ) ( not ( = ?auto_189823 ?auto_189828 ) ) ( not ( = ?auto_189823 ?auto_189829 ) ) ( not ( = ?auto_189824 ?auto_189825 ) ) ( not ( = ?auto_189824 ?auto_189826 ) ) ( not ( = ?auto_189824 ?auto_189827 ) ) ( not ( = ?auto_189824 ?auto_189828 ) ) ( not ( = ?auto_189824 ?auto_189829 ) ) ( not ( = ?auto_189825 ?auto_189826 ) ) ( not ( = ?auto_189825 ?auto_189827 ) ) ( not ( = ?auto_189825 ?auto_189828 ) ) ( not ( = ?auto_189825 ?auto_189829 ) ) ( not ( = ?auto_189826 ?auto_189827 ) ) ( not ( = ?auto_189826 ?auto_189828 ) ) ( not ( = ?auto_189826 ?auto_189829 ) ) ( not ( = ?auto_189827 ?auto_189828 ) ) ( not ( = ?auto_189827 ?auto_189829 ) ) ( not ( = ?auto_189828 ?auto_189829 ) ) ( CLEAR ?auto_189826 ) ( ON ?auto_189827 ?auto_189828 ) ( CLEAR ?auto_189827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_189820 ?auto_189821 ?auto_189822 ?auto_189823 ?auto_189824 ?auto_189825 ?auto_189826 ?auto_189827 )
      ( MAKE-9PILE ?auto_189820 ?auto_189821 ?auto_189822 ?auto_189823 ?auto_189824 ?auto_189825 ?auto_189826 ?auto_189827 ?auto_189828 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189839 - BLOCK
      ?auto_189840 - BLOCK
      ?auto_189841 - BLOCK
      ?auto_189842 - BLOCK
      ?auto_189843 - BLOCK
      ?auto_189844 - BLOCK
      ?auto_189845 - BLOCK
      ?auto_189846 - BLOCK
      ?auto_189847 - BLOCK
    )
    :vars
    (
      ?auto_189848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189847 ?auto_189848 ) ( ON-TABLE ?auto_189839 ) ( ON ?auto_189840 ?auto_189839 ) ( ON ?auto_189841 ?auto_189840 ) ( ON ?auto_189842 ?auto_189841 ) ( ON ?auto_189843 ?auto_189842 ) ( ON ?auto_189844 ?auto_189843 ) ( not ( = ?auto_189839 ?auto_189840 ) ) ( not ( = ?auto_189839 ?auto_189841 ) ) ( not ( = ?auto_189839 ?auto_189842 ) ) ( not ( = ?auto_189839 ?auto_189843 ) ) ( not ( = ?auto_189839 ?auto_189844 ) ) ( not ( = ?auto_189839 ?auto_189845 ) ) ( not ( = ?auto_189839 ?auto_189846 ) ) ( not ( = ?auto_189839 ?auto_189847 ) ) ( not ( = ?auto_189839 ?auto_189848 ) ) ( not ( = ?auto_189840 ?auto_189841 ) ) ( not ( = ?auto_189840 ?auto_189842 ) ) ( not ( = ?auto_189840 ?auto_189843 ) ) ( not ( = ?auto_189840 ?auto_189844 ) ) ( not ( = ?auto_189840 ?auto_189845 ) ) ( not ( = ?auto_189840 ?auto_189846 ) ) ( not ( = ?auto_189840 ?auto_189847 ) ) ( not ( = ?auto_189840 ?auto_189848 ) ) ( not ( = ?auto_189841 ?auto_189842 ) ) ( not ( = ?auto_189841 ?auto_189843 ) ) ( not ( = ?auto_189841 ?auto_189844 ) ) ( not ( = ?auto_189841 ?auto_189845 ) ) ( not ( = ?auto_189841 ?auto_189846 ) ) ( not ( = ?auto_189841 ?auto_189847 ) ) ( not ( = ?auto_189841 ?auto_189848 ) ) ( not ( = ?auto_189842 ?auto_189843 ) ) ( not ( = ?auto_189842 ?auto_189844 ) ) ( not ( = ?auto_189842 ?auto_189845 ) ) ( not ( = ?auto_189842 ?auto_189846 ) ) ( not ( = ?auto_189842 ?auto_189847 ) ) ( not ( = ?auto_189842 ?auto_189848 ) ) ( not ( = ?auto_189843 ?auto_189844 ) ) ( not ( = ?auto_189843 ?auto_189845 ) ) ( not ( = ?auto_189843 ?auto_189846 ) ) ( not ( = ?auto_189843 ?auto_189847 ) ) ( not ( = ?auto_189843 ?auto_189848 ) ) ( not ( = ?auto_189844 ?auto_189845 ) ) ( not ( = ?auto_189844 ?auto_189846 ) ) ( not ( = ?auto_189844 ?auto_189847 ) ) ( not ( = ?auto_189844 ?auto_189848 ) ) ( not ( = ?auto_189845 ?auto_189846 ) ) ( not ( = ?auto_189845 ?auto_189847 ) ) ( not ( = ?auto_189845 ?auto_189848 ) ) ( not ( = ?auto_189846 ?auto_189847 ) ) ( not ( = ?auto_189846 ?auto_189848 ) ) ( not ( = ?auto_189847 ?auto_189848 ) ) ( ON ?auto_189846 ?auto_189847 ) ( CLEAR ?auto_189844 ) ( ON ?auto_189845 ?auto_189846 ) ( CLEAR ?auto_189845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189839 ?auto_189840 ?auto_189841 ?auto_189842 ?auto_189843 ?auto_189844 ?auto_189845 )
      ( MAKE-9PILE ?auto_189839 ?auto_189840 ?auto_189841 ?auto_189842 ?auto_189843 ?auto_189844 ?auto_189845 ?auto_189846 ?auto_189847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189858 - BLOCK
      ?auto_189859 - BLOCK
      ?auto_189860 - BLOCK
      ?auto_189861 - BLOCK
      ?auto_189862 - BLOCK
      ?auto_189863 - BLOCK
      ?auto_189864 - BLOCK
      ?auto_189865 - BLOCK
      ?auto_189866 - BLOCK
    )
    :vars
    (
      ?auto_189867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189866 ?auto_189867 ) ( ON-TABLE ?auto_189858 ) ( ON ?auto_189859 ?auto_189858 ) ( ON ?auto_189860 ?auto_189859 ) ( ON ?auto_189861 ?auto_189860 ) ( ON ?auto_189862 ?auto_189861 ) ( ON ?auto_189863 ?auto_189862 ) ( not ( = ?auto_189858 ?auto_189859 ) ) ( not ( = ?auto_189858 ?auto_189860 ) ) ( not ( = ?auto_189858 ?auto_189861 ) ) ( not ( = ?auto_189858 ?auto_189862 ) ) ( not ( = ?auto_189858 ?auto_189863 ) ) ( not ( = ?auto_189858 ?auto_189864 ) ) ( not ( = ?auto_189858 ?auto_189865 ) ) ( not ( = ?auto_189858 ?auto_189866 ) ) ( not ( = ?auto_189858 ?auto_189867 ) ) ( not ( = ?auto_189859 ?auto_189860 ) ) ( not ( = ?auto_189859 ?auto_189861 ) ) ( not ( = ?auto_189859 ?auto_189862 ) ) ( not ( = ?auto_189859 ?auto_189863 ) ) ( not ( = ?auto_189859 ?auto_189864 ) ) ( not ( = ?auto_189859 ?auto_189865 ) ) ( not ( = ?auto_189859 ?auto_189866 ) ) ( not ( = ?auto_189859 ?auto_189867 ) ) ( not ( = ?auto_189860 ?auto_189861 ) ) ( not ( = ?auto_189860 ?auto_189862 ) ) ( not ( = ?auto_189860 ?auto_189863 ) ) ( not ( = ?auto_189860 ?auto_189864 ) ) ( not ( = ?auto_189860 ?auto_189865 ) ) ( not ( = ?auto_189860 ?auto_189866 ) ) ( not ( = ?auto_189860 ?auto_189867 ) ) ( not ( = ?auto_189861 ?auto_189862 ) ) ( not ( = ?auto_189861 ?auto_189863 ) ) ( not ( = ?auto_189861 ?auto_189864 ) ) ( not ( = ?auto_189861 ?auto_189865 ) ) ( not ( = ?auto_189861 ?auto_189866 ) ) ( not ( = ?auto_189861 ?auto_189867 ) ) ( not ( = ?auto_189862 ?auto_189863 ) ) ( not ( = ?auto_189862 ?auto_189864 ) ) ( not ( = ?auto_189862 ?auto_189865 ) ) ( not ( = ?auto_189862 ?auto_189866 ) ) ( not ( = ?auto_189862 ?auto_189867 ) ) ( not ( = ?auto_189863 ?auto_189864 ) ) ( not ( = ?auto_189863 ?auto_189865 ) ) ( not ( = ?auto_189863 ?auto_189866 ) ) ( not ( = ?auto_189863 ?auto_189867 ) ) ( not ( = ?auto_189864 ?auto_189865 ) ) ( not ( = ?auto_189864 ?auto_189866 ) ) ( not ( = ?auto_189864 ?auto_189867 ) ) ( not ( = ?auto_189865 ?auto_189866 ) ) ( not ( = ?auto_189865 ?auto_189867 ) ) ( not ( = ?auto_189866 ?auto_189867 ) ) ( ON ?auto_189865 ?auto_189866 ) ( CLEAR ?auto_189863 ) ( ON ?auto_189864 ?auto_189865 ) ( CLEAR ?auto_189864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_189858 ?auto_189859 ?auto_189860 ?auto_189861 ?auto_189862 ?auto_189863 ?auto_189864 )
      ( MAKE-9PILE ?auto_189858 ?auto_189859 ?auto_189860 ?auto_189861 ?auto_189862 ?auto_189863 ?auto_189864 ?auto_189865 ?auto_189866 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189877 - BLOCK
      ?auto_189878 - BLOCK
      ?auto_189879 - BLOCK
      ?auto_189880 - BLOCK
      ?auto_189881 - BLOCK
      ?auto_189882 - BLOCK
      ?auto_189883 - BLOCK
      ?auto_189884 - BLOCK
      ?auto_189885 - BLOCK
    )
    :vars
    (
      ?auto_189886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189885 ?auto_189886 ) ( ON-TABLE ?auto_189877 ) ( ON ?auto_189878 ?auto_189877 ) ( ON ?auto_189879 ?auto_189878 ) ( ON ?auto_189880 ?auto_189879 ) ( ON ?auto_189881 ?auto_189880 ) ( not ( = ?auto_189877 ?auto_189878 ) ) ( not ( = ?auto_189877 ?auto_189879 ) ) ( not ( = ?auto_189877 ?auto_189880 ) ) ( not ( = ?auto_189877 ?auto_189881 ) ) ( not ( = ?auto_189877 ?auto_189882 ) ) ( not ( = ?auto_189877 ?auto_189883 ) ) ( not ( = ?auto_189877 ?auto_189884 ) ) ( not ( = ?auto_189877 ?auto_189885 ) ) ( not ( = ?auto_189877 ?auto_189886 ) ) ( not ( = ?auto_189878 ?auto_189879 ) ) ( not ( = ?auto_189878 ?auto_189880 ) ) ( not ( = ?auto_189878 ?auto_189881 ) ) ( not ( = ?auto_189878 ?auto_189882 ) ) ( not ( = ?auto_189878 ?auto_189883 ) ) ( not ( = ?auto_189878 ?auto_189884 ) ) ( not ( = ?auto_189878 ?auto_189885 ) ) ( not ( = ?auto_189878 ?auto_189886 ) ) ( not ( = ?auto_189879 ?auto_189880 ) ) ( not ( = ?auto_189879 ?auto_189881 ) ) ( not ( = ?auto_189879 ?auto_189882 ) ) ( not ( = ?auto_189879 ?auto_189883 ) ) ( not ( = ?auto_189879 ?auto_189884 ) ) ( not ( = ?auto_189879 ?auto_189885 ) ) ( not ( = ?auto_189879 ?auto_189886 ) ) ( not ( = ?auto_189880 ?auto_189881 ) ) ( not ( = ?auto_189880 ?auto_189882 ) ) ( not ( = ?auto_189880 ?auto_189883 ) ) ( not ( = ?auto_189880 ?auto_189884 ) ) ( not ( = ?auto_189880 ?auto_189885 ) ) ( not ( = ?auto_189880 ?auto_189886 ) ) ( not ( = ?auto_189881 ?auto_189882 ) ) ( not ( = ?auto_189881 ?auto_189883 ) ) ( not ( = ?auto_189881 ?auto_189884 ) ) ( not ( = ?auto_189881 ?auto_189885 ) ) ( not ( = ?auto_189881 ?auto_189886 ) ) ( not ( = ?auto_189882 ?auto_189883 ) ) ( not ( = ?auto_189882 ?auto_189884 ) ) ( not ( = ?auto_189882 ?auto_189885 ) ) ( not ( = ?auto_189882 ?auto_189886 ) ) ( not ( = ?auto_189883 ?auto_189884 ) ) ( not ( = ?auto_189883 ?auto_189885 ) ) ( not ( = ?auto_189883 ?auto_189886 ) ) ( not ( = ?auto_189884 ?auto_189885 ) ) ( not ( = ?auto_189884 ?auto_189886 ) ) ( not ( = ?auto_189885 ?auto_189886 ) ) ( ON ?auto_189884 ?auto_189885 ) ( ON ?auto_189883 ?auto_189884 ) ( CLEAR ?auto_189881 ) ( ON ?auto_189882 ?auto_189883 ) ( CLEAR ?auto_189882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189877 ?auto_189878 ?auto_189879 ?auto_189880 ?auto_189881 ?auto_189882 )
      ( MAKE-9PILE ?auto_189877 ?auto_189878 ?auto_189879 ?auto_189880 ?auto_189881 ?auto_189882 ?auto_189883 ?auto_189884 ?auto_189885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189896 - BLOCK
      ?auto_189897 - BLOCK
      ?auto_189898 - BLOCK
      ?auto_189899 - BLOCK
      ?auto_189900 - BLOCK
      ?auto_189901 - BLOCK
      ?auto_189902 - BLOCK
      ?auto_189903 - BLOCK
      ?auto_189904 - BLOCK
    )
    :vars
    (
      ?auto_189905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189904 ?auto_189905 ) ( ON-TABLE ?auto_189896 ) ( ON ?auto_189897 ?auto_189896 ) ( ON ?auto_189898 ?auto_189897 ) ( ON ?auto_189899 ?auto_189898 ) ( ON ?auto_189900 ?auto_189899 ) ( not ( = ?auto_189896 ?auto_189897 ) ) ( not ( = ?auto_189896 ?auto_189898 ) ) ( not ( = ?auto_189896 ?auto_189899 ) ) ( not ( = ?auto_189896 ?auto_189900 ) ) ( not ( = ?auto_189896 ?auto_189901 ) ) ( not ( = ?auto_189896 ?auto_189902 ) ) ( not ( = ?auto_189896 ?auto_189903 ) ) ( not ( = ?auto_189896 ?auto_189904 ) ) ( not ( = ?auto_189896 ?auto_189905 ) ) ( not ( = ?auto_189897 ?auto_189898 ) ) ( not ( = ?auto_189897 ?auto_189899 ) ) ( not ( = ?auto_189897 ?auto_189900 ) ) ( not ( = ?auto_189897 ?auto_189901 ) ) ( not ( = ?auto_189897 ?auto_189902 ) ) ( not ( = ?auto_189897 ?auto_189903 ) ) ( not ( = ?auto_189897 ?auto_189904 ) ) ( not ( = ?auto_189897 ?auto_189905 ) ) ( not ( = ?auto_189898 ?auto_189899 ) ) ( not ( = ?auto_189898 ?auto_189900 ) ) ( not ( = ?auto_189898 ?auto_189901 ) ) ( not ( = ?auto_189898 ?auto_189902 ) ) ( not ( = ?auto_189898 ?auto_189903 ) ) ( not ( = ?auto_189898 ?auto_189904 ) ) ( not ( = ?auto_189898 ?auto_189905 ) ) ( not ( = ?auto_189899 ?auto_189900 ) ) ( not ( = ?auto_189899 ?auto_189901 ) ) ( not ( = ?auto_189899 ?auto_189902 ) ) ( not ( = ?auto_189899 ?auto_189903 ) ) ( not ( = ?auto_189899 ?auto_189904 ) ) ( not ( = ?auto_189899 ?auto_189905 ) ) ( not ( = ?auto_189900 ?auto_189901 ) ) ( not ( = ?auto_189900 ?auto_189902 ) ) ( not ( = ?auto_189900 ?auto_189903 ) ) ( not ( = ?auto_189900 ?auto_189904 ) ) ( not ( = ?auto_189900 ?auto_189905 ) ) ( not ( = ?auto_189901 ?auto_189902 ) ) ( not ( = ?auto_189901 ?auto_189903 ) ) ( not ( = ?auto_189901 ?auto_189904 ) ) ( not ( = ?auto_189901 ?auto_189905 ) ) ( not ( = ?auto_189902 ?auto_189903 ) ) ( not ( = ?auto_189902 ?auto_189904 ) ) ( not ( = ?auto_189902 ?auto_189905 ) ) ( not ( = ?auto_189903 ?auto_189904 ) ) ( not ( = ?auto_189903 ?auto_189905 ) ) ( not ( = ?auto_189904 ?auto_189905 ) ) ( ON ?auto_189903 ?auto_189904 ) ( ON ?auto_189902 ?auto_189903 ) ( CLEAR ?auto_189900 ) ( ON ?auto_189901 ?auto_189902 ) ( CLEAR ?auto_189901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_189896 ?auto_189897 ?auto_189898 ?auto_189899 ?auto_189900 ?auto_189901 )
      ( MAKE-9PILE ?auto_189896 ?auto_189897 ?auto_189898 ?auto_189899 ?auto_189900 ?auto_189901 ?auto_189902 ?auto_189903 ?auto_189904 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189915 - BLOCK
      ?auto_189916 - BLOCK
      ?auto_189917 - BLOCK
      ?auto_189918 - BLOCK
      ?auto_189919 - BLOCK
      ?auto_189920 - BLOCK
      ?auto_189921 - BLOCK
      ?auto_189922 - BLOCK
      ?auto_189923 - BLOCK
    )
    :vars
    (
      ?auto_189924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189923 ?auto_189924 ) ( ON-TABLE ?auto_189915 ) ( ON ?auto_189916 ?auto_189915 ) ( ON ?auto_189917 ?auto_189916 ) ( ON ?auto_189918 ?auto_189917 ) ( not ( = ?auto_189915 ?auto_189916 ) ) ( not ( = ?auto_189915 ?auto_189917 ) ) ( not ( = ?auto_189915 ?auto_189918 ) ) ( not ( = ?auto_189915 ?auto_189919 ) ) ( not ( = ?auto_189915 ?auto_189920 ) ) ( not ( = ?auto_189915 ?auto_189921 ) ) ( not ( = ?auto_189915 ?auto_189922 ) ) ( not ( = ?auto_189915 ?auto_189923 ) ) ( not ( = ?auto_189915 ?auto_189924 ) ) ( not ( = ?auto_189916 ?auto_189917 ) ) ( not ( = ?auto_189916 ?auto_189918 ) ) ( not ( = ?auto_189916 ?auto_189919 ) ) ( not ( = ?auto_189916 ?auto_189920 ) ) ( not ( = ?auto_189916 ?auto_189921 ) ) ( not ( = ?auto_189916 ?auto_189922 ) ) ( not ( = ?auto_189916 ?auto_189923 ) ) ( not ( = ?auto_189916 ?auto_189924 ) ) ( not ( = ?auto_189917 ?auto_189918 ) ) ( not ( = ?auto_189917 ?auto_189919 ) ) ( not ( = ?auto_189917 ?auto_189920 ) ) ( not ( = ?auto_189917 ?auto_189921 ) ) ( not ( = ?auto_189917 ?auto_189922 ) ) ( not ( = ?auto_189917 ?auto_189923 ) ) ( not ( = ?auto_189917 ?auto_189924 ) ) ( not ( = ?auto_189918 ?auto_189919 ) ) ( not ( = ?auto_189918 ?auto_189920 ) ) ( not ( = ?auto_189918 ?auto_189921 ) ) ( not ( = ?auto_189918 ?auto_189922 ) ) ( not ( = ?auto_189918 ?auto_189923 ) ) ( not ( = ?auto_189918 ?auto_189924 ) ) ( not ( = ?auto_189919 ?auto_189920 ) ) ( not ( = ?auto_189919 ?auto_189921 ) ) ( not ( = ?auto_189919 ?auto_189922 ) ) ( not ( = ?auto_189919 ?auto_189923 ) ) ( not ( = ?auto_189919 ?auto_189924 ) ) ( not ( = ?auto_189920 ?auto_189921 ) ) ( not ( = ?auto_189920 ?auto_189922 ) ) ( not ( = ?auto_189920 ?auto_189923 ) ) ( not ( = ?auto_189920 ?auto_189924 ) ) ( not ( = ?auto_189921 ?auto_189922 ) ) ( not ( = ?auto_189921 ?auto_189923 ) ) ( not ( = ?auto_189921 ?auto_189924 ) ) ( not ( = ?auto_189922 ?auto_189923 ) ) ( not ( = ?auto_189922 ?auto_189924 ) ) ( not ( = ?auto_189923 ?auto_189924 ) ) ( ON ?auto_189922 ?auto_189923 ) ( ON ?auto_189921 ?auto_189922 ) ( ON ?auto_189920 ?auto_189921 ) ( CLEAR ?auto_189918 ) ( ON ?auto_189919 ?auto_189920 ) ( CLEAR ?auto_189919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189915 ?auto_189916 ?auto_189917 ?auto_189918 ?auto_189919 )
      ( MAKE-9PILE ?auto_189915 ?auto_189916 ?auto_189917 ?auto_189918 ?auto_189919 ?auto_189920 ?auto_189921 ?auto_189922 ?auto_189923 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189934 - BLOCK
      ?auto_189935 - BLOCK
      ?auto_189936 - BLOCK
      ?auto_189937 - BLOCK
      ?auto_189938 - BLOCK
      ?auto_189939 - BLOCK
      ?auto_189940 - BLOCK
      ?auto_189941 - BLOCK
      ?auto_189942 - BLOCK
    )
    :vars
    (
      ?auto_189943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189942 ?auto_189943 ) ( ON-TABLE ?auto_189934 ) ( ON ?auto_189935 ?auto_189934 ) ( ON ?auto_189936 ?auto_189935 ) ( ON ?auto_189937 ?auto_189936 ) ( not ( = ?auto_189934 ?auto_189935 ) ) ( not ( = ?auto_189934 ?auto_189936 ) ) ( not ( = ?auto_189934 ?auto_189937 ) ) ( not ( = ?auto_189934 ?auto_189938 ) ) ( not ( = ?auto_189934 ?auto_189939 ) ) ( not ( = ?auto_189934 ?auto_189940 ) ) ( not ( = ?auto_189934 ?auto_189941 ) ) ( not ( = ?auto_189934 ?auto_189942 ) ) ( not ( = ?auto_189934 ?auto_189943 ) ) ( not ( = ?auto_189935 ?auto_189936 ) ) ( not ( = ?auto_189935 ?auto_189937 ) ) ( not ( = ?auto_189935 ?auto_189938 ) ) ( not ( = ?auto_189935 ?auto_189939 ) ) ( not ( = ?auto_189935 ?auto_189940 ) ) ( not ( = ?auto_189935 ?auto_189941 ) ) ( not ( = ?auto_189935 ?auto_189942 ) ) ( not ( = ?auto_189935 ?auto_189943 ) ) ( not ( = ?auto_189936 ?auto_189937 ) ) ( not ( = ?auto_189936 ?auto_189938 ) ) ( not ( = ?auto_189936 ?auto_189939 ) ) ( not ( = ?auto_189936 ?auto_189940 ) ) ( not ( = ?auto_189936 ?auto_189941 ) ) ( not ( = ?auto_189936 ?auto_189942 ) ) ( not ( = ?auto_189936 ?auto_189943 ) ) ( not ( = ?auto_189937 ?auto_189938 ) ) ( not ( = ?auto_189937 ?auto_189939 ) ) ( not ( = ?auto_189937 ?auto_189940 ) ) ( not ( = ?auto_189937 ?auto_189941 ) ) ( not ( = ?auto_189937 ?auto_189942 ) ) ( not ( = ?auto_189937 ?auto_189943 ) ) ( not ( = ?auto_189938 ?auto_189939 ) ) ( not ( = ?auto_189938 ?auto_189940 ) ) ( not ( = ?auto_189938 ?auto_189941 ) ) ( not ( = ?auto_189938 ?auto_189942 ) ) ( not ( = ?auto_189938 ?auto_189943 ) ) ( not ( = ?auto_189939 ?auto_189940 ) ) ( not ( = ?auto_189939 ?auto_189941 ) ) ( not ( = ?auto_189939 ?auto_189942 ) ) ( not ( = ?auto_189939 ?auto_189943 ) ) ( not ( = ?auto_189940 ?auto_189941 ) ) ( not ( = ?auto_189940 ?auto_189942 ) ) ( not ( = ?auto_189940 ?auto_189943 ) ) ( not ( = ?auto_189941 ?auto_189942 ) ) ( not ( = ?auto_189941 ?auto_189943 ) ) ( not ( = ?auto_189942 ?auto_189943 ) ) ( ON ?auto_189941 ?auto_189942 ) ( ON ?auto_189940 ?auto_189941 ) ( ON ?auto_189939 ?auto_189940 ) ( CLEAR ?auto_189937 ) ( ON ?auto_189938 ?auto_189939 ) ( CLEAR ?auto_189938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_189934 ?auto_189935 ?auto_189936 ?auto_189937 ?auto_189938 )
      ( MAKE-9PILE ?auto_189934 ?auto_189935 ?auto_189936 ?auto_189937 ?auto_189938 ?auto_189939 ?auto_189940 ?auto_189941 ?auto_189942 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189953 - BLOCK
      ?auto_189954 - BLOCK
      ?auto_189955 - BLOCK
      ?auto_189956 - BLOCK
      ?auto_189957 - BLOCK
      ?auto_189958 - BLOCK
      ?auto_189959 - BLOCK
      ?auto_189960 - BLOCK
      ?auto_189961 - BLOCK
    )
    :vars
    (
      ?auto_189962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189961 ?auto_189962 ) ( ON-TABLE ?auto_189953 ) ( ON ?auto_189954 ?auto_189953 ) ( ON ?auto_189955 ?auto_189954 ) ( not ( = ?auto_189953 ?auto_189954 ) ) ( not ( = ?auto_189953 ?auto_189955 ) ) ( not ( = ?auto_189953 ?auto_189956 ) ) ( not ( = ?auto_189953 ?auto_189957 ) ) ( not ( = ?auto_189953 ?auto_189958 ) ) ( not ( = ?auto_189953 ?auto_189959 ) ) ( not ( = ?auto_189953 ?auto_189960 ) ) ( not ( = ?auto_189953 ?auto_189961 ) ) ( not ( = ?auto_189953 ?auto_189962 ) ) ( not ( = ?auto_189954 ?auto_189955 ) ) ( not ( = ?auto_189954 ?auto_189956 ) ) ( not ( = ?auto_189954 ?auto_189957 ) ) ( not ( = ?auto_189954 ?auto_189958 ) ) ( not ( = ?auto_189954 ?auto_189959 ) ) ( not ( = ?auto_189954 ?auto_189960 ) ) ( not ( = ?auto_189954 ?auto_189961 ) ) ( not ( = ?auto_189954 ?auto_189962 ) ) ( not ( = ?auto_189955 ?auto_189956 ) ) ( not ( = ?auto_189955 ?auto_189957 ) ) ( not ( = ?auto_189955 ?auto_189958 ) ) ( not ( = ?auto_189955 ?auto_189959 ) ) ( not ( = ?auto_189955 ?auto_189960 ) ) ( not ( = ?auto_189955 ?auto_189961 ) ) ( not ( = ?auto_189955 ?auto_189962 ) ) ( not ( = ?auto_189956 ?auto_189957 ) ) ( not ( = ?auto_189956 ?auto_189958 ) ) ( not ( = ?auto_189956 ?auto_189959 ) ) ( not ( = ?auto_189956 ?auto_189960 ) ) ( not ( = ?auto_189956 ?auto_189961 ) ) ( not ( = ?auto_189956 ?auto_189962 ) ) ( not ( = ?auto_189957 ?auto_189958 ) ) ( not ( = ?auto_189957 ?auto_189959 ) ) ( not ( = ?auto_189957 ?auto_189960 ) ) ( not ( = ?auto_189957 ?auto_189961 ) ) ( not ( = ?auto_189957 ?auto_189962 ) ) ( not ( = ?auto_189958 ?auto_189959 ) ) ( not ( = ?auto_189958 ?auto_189960 ) ) ( not ( = ?auto_189958 ?auto_189961 ) ) ( not ( = ?auto_189958 ?auto_189962 ) ) ( not ( = ?auto_189959 ?auto_189960 ) ) ( not ( = ?auto_189959 ?auto_189961 ) ) ( not ( = ?auto_189959 ?auto_189962 ) ) ( not ( = ?auto_189960 ?auto_189961 ) ) ( not ( = ?auto_189960 ?auto_189962 ) ) ( not ( = ?auto_189961 ?auto_189962 ) ) ( ON ?auto_189960 ?auto_189961 ) ( ON ?auto_189959 ?auto_189960 ) ( ON ?auto_189958 ?auto_189959 ) ( ON ?auto_189957 ?auto_189958 ) ( CLEAR ?auto_189955 ) ( ON ?auto_189956 ?auto_189957 ) ( CLEAR ?auto_189956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189953 ?auto_189954 ?auto_189955 ?auto_189956 )
      ( MAKE-9PILE ?auto_189953 ?auto_189954 ?auto_189955 ?auto_189956 ?auto_189957 ?auto_189958 ?auto_189959 ?auto_189960 ?auto_189961 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189972 - BLOCK
      ?auto_189973 - BLOCK
      ?auto_189974 - BLOCK
      ?auto_189975 - BLOCK
      ?auto_189976 - BLOCK
      ?auto_189977 - BLOCK
      ?auto_189978 - BLOCK
      ?auto_189979 - BLOCK
      ?auto_189980 - BLOCK
    )
    :vars
    (
      ?auto_189981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189980 ?auto_189981 ) ( ON-TABLE ?auto_189972 ) ( ON ?auto_189973 ?auto_189972 ) ( ON ?auto_189974 ?auto_189973 ) ( not ( = ?auto_189972 ?auto_189973 ) ) ( not ( = ?auto_189972 ?auto_189974 ) ) ( not ( = ?auto_189972 ?auto_189975 ) ) ( not ( = ?auto_189972 ?auto_189976 ) ) ( not ( = ?auto_189972 ?auto_189977 ) ) ( not ( = ?auto_189972 ?auto_189978 ) ) ( not ( = ?auto_189972 ?auto_189979 ) ) ( not ( = ?auto_189972 ?auto_189980 ) ) ( not ( = ?auto_189972 ?auto_189981 ) ) ( not ( = ?auto_189973 ?auto_189974 ) ) ( not ( = ?auto_189973 ?auto_189975 ) ) ( not ( = ?auto_189973 ?auto_189976 ) ) ( not ( = ?auto_189973 ?auto_189977 ) ) ( not ( = ?auto_189973 ?auto_189978 ) ) ( not ( = ?auto_189973 ?auto_189979 ) ) ( not ( = ?auto_189973 ?auto_189980 ) ) ( not ( = ?auto_189973 ?auto_189981 ) ) ( not ( = ?auto_189974 ?auto_189975 ) ) ( not ( = ?auto_189974 ?auto_189976 ) ) ( not ( = ?auto_189974 ?auto_189977 ) ) ( not ( = ?auto_189974 ?auto_189978 ) ) ( not ( = ?auto_189974 ?auto_189979 ) ) ( not ( = ?auto_189974 ?auto_189980 ) ) ( not ( = ?auto_189974 ?auto_189981 ) ) ( not ( = ?auto_189975 ?auto_189976 ) ) ( not ( = ?auto_189975 ?auto_189977 ) ) ( not ( = ?auto_189975 ?auto_189978 ) ) ( not ( = ?auto_189975 ?auto_189979 ) ) ( not ( = ?auto_189975 ?auto_189980 ) ) ( not ( = ?auto_189975 ?auto_189981 ) ) ( not ( = ?auto_189976 ?auto_189977 ) ) ( not ( = ?auto_189976 ?auto_189978 ) ) ( not ( = ?auto_189976 ?auto_189979 ) ) ( not ( = ?auto_189976 ?auto_189980 ) ) ( not ( = ?auto_189976 ?auto_189981 ) ) ( not ( = ?auto_189977 ?auto_189978 ) ) ( not ( = ?auto_189977 ?auto_189979 ) ) ( not ( = ?auto_189977 ?auto_189980 ) ) ( not ( = ?auto_189977 ?auto_189981 ) ) ( not ( = ?auto_189978 ?auto_189979 ) ) ( not ( = ?auto_189978 ?auto_189980 ) ) ( not ( = ?auto_189978 ?auto_189981 ) ) ( not ( = ?auto_189979 ?auto_189980 ) ) ( not ( = ?auto_189979 ?auto_189981 ) ) ( not ( = ?auto_189980 ?auto_189981 ) ) ( ON ?auto_189979 ?auto_189980 ) ( ON ?auto_189978 ?auto_189979 ) ( ON ?auto_189977 ?auto_189978 ) ( ON ?auto_189976 ?auto_189977 ) ( CLEAR ?auto_189974 ) ( ON ?auto_189975 ?auto_189976 ) ( CLEAR ?auto_189975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_189972 ?auto_189973 ?auto_189974 ?auto_189975 )
      ( MAKE-9PILE ?auto_189972 ?auto_189973 ?auto_189974 ?auto_189975 ?auto_189976 ?auto_189977 ?auto_189978 ?auto_189979 ?auto_189980 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_189991 - BLOCK
      ?auto_189992 - BLOCK
      ?auto_189993 - BLOCK
      ?auto_189994 - BLOCK
      ?auto_189995 - BLOCK
      ?auto_189996 - BLOCK
      ?auto_189997 - BLOCK
      ?auto_189998 - BLOCK
      ?auto_189999 - BLOCK
    )
    :vars
    (
      ?auto_190000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_189999 ?auto_190000 ) ( ON-TABLE ?auto_189991 ) ( ON ?auto_189992 ?auto_189991 ) ( not ( = ?auto_189991 ?auto_189992 ) ) ( not ( = ?auto_189991 ?auto_189993 ) ) ( not ( = ?auto_189991 ?auto_189994 ) ) ( not ( = ?auto_189991 ?auto_189995 ) ) ( not ( = ?auto_189991 ?auto_189996 ) ) ( not ( = ?auto_189991 ?auto_189997 ) ) ( not ( = ?auto_189991 ?auto_189998 ) ) ( not ( = ?auto_189991 ?auto_189999 ) ) ( not ( = ?auto_189991 ?auto_190000 ) ) ( not ( = ?auto_189992 ?auto_189993 ) ) ( not ( = ?auto_189992 ?auto_189994 ) ) ( not ( = ?auto_189992 ?auto_189995 ) ) ( not ( = ?auto_189992 ?auto_189996 ) ) ( not ( = ?auto_189992 ?auto_189997 ) ) ( not ( = ?auto_189992 ?auto_189998 ) ) ( not ( = ?auto_189992 ?auto_189999 ) ) ( not ( = ?auto_189992 ?auto_190000 ) ) ( not ( = ?auto_189993 ?auto_189994 ) ) ( not ( = ?auto_189993 ?auto_189995 ) ) ( not ( = ?auto_189993 ?auto_189996 ) ) ( not ( = ?auto_189993 ?auto_189997 ) ) ( not ( = ?auto_189993 ?auto_189998 ) ) ( not ( = ?auto_189993 ?auto_189999 ) ) ( not ( = ?auto_189993 ?auto_190000 ) ) ( not ( = ?auto_189994 ?auto_189995 ) ) ( not ( = ?auto_189994 ?auto_189996 ) ) ( not ( = ?auto_189994 ?auto_189997 ) ) ( not ( = ?auto_189994 ?auto_189998 ) ) ( not ( = ?auto_189994 ?auto_189999 ) ) ( not ( = ?auto_189994 ?auto_190000 ) ) ( not ( = ?auto_189995 ?auto_189996 ) ) ( not ( = ?auto_189995 ?auto_189997 ) ) ( not ( = ?auto_189995 ?auto_189998 ) ) ( not ( = ?auto_189995 ?auto_189999 ) ) ( not ( = ?auto_189995 ?auto_190000 ) ) ( not ( = ?auto_189996 ?auto_189997 ) ) ( not ( = ?auto_189996 ?auto_189998 ) ) ( not ( = ?auto_189996 ?auto_189999 ) ) ( not ( = ?auto_189996 ?auto_190000 ) ) ( not ( = ?auto_189997 ?auto_189998 ) ) ( not ( = ?auto_189997 ?auto_189999 ) ) ( not ( = ?auto_189997 ?auto_190000 ) ) ( not ( = ?auto_189998 ?auto_189999 ) ) ( not ( = ?auto_189998 ?auto_190000 ) ) ( not ( = ?auto_189999 ?auto_190000 ) ) ( ON ?auto_189998 ?auto_189999 ) ( ON ?auto_189997 ?auto_189998 ) ( ON ?auto_189996 ?auto_189997 ) ( ON ?auto_189995 ?auto_189996 ) ( ON ?auto_189994 ?auto_189995 ) ( CLEAR ?auto_189992 ) ( ON ?auto_189993 ?auto_189994 ) ( CLEAR ?auto_189993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_189991 ?auto_189992 ?auto_189993 )
      ( MAKE-9PILE ?auto_189991 ?auto_189992 ?auto_189993 ?auto_189994 ?auto_189995 ?auto_189996 ?auto_189997 ?auto_189998 ?auto_189999 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_190010 - BLOCK
      ?auto_190011 - BLOCK
      ?auto_190012 - BLOCK
      ?auto_190013 - BLOCK
      ?auto_190014 - BLOCK
      ?auto_190015 - BLOCK
      ?auto_190016 - BLOCK
      ?auto_190017 - BLOCK
      ?auto_190018 - BLOCK
    )
    :vars
    (
      ?auto_190019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190018 ?auto_190019 ) ( ON-TABLE ?auto_190010 ) ( ON ?auto_190011 ?auto_190010 ) ( not ( = ?auto_190010 ?auto_190011 ) ) ( not ( = ?auto_190010 ?auto_190012 ) ) ( not ( = ?auto_190010 ?auto_190013 ) ) ( not ( = ?auto_190010 ?auto_190014 ) ) ( not ( = ?auto_190010 ?auto_190015 ) ) ( not ( = ?auto_190010 ?auto_190016 ) ) ( not ( = ?auto_190010 ?auto_190017 ) ) ( not ( = ?auto_190010 ?auto_190018 ) ) ( not ( = ?auto_190010 ?auto_190019 ) ) ( not ( = ?auto_190011 ?auto_190012 ) ) ( not ( = ?auto_190011 ?auto_190013 ) ) ( not ( = ?auto_190011 ?auto_190014 ) ) ( not ( = ?auto_190011 ?auto_190015 ) ) ( not ( = ?auto_190011 ?auto_190016 ) ) ( not ( = ?auto_190011 ?auto_190017 ) ) ( not ( = ?auto_190011 ?auto_190018 ) ) ( not ( = ?auto_190011 ?auto_190019 ) ) ( not ( = ?auto_190012 ?auto_190013 ) ) ( not ( = ?auto_190012 ?auto_190014 ) ) ( not ( = ?auto_190012 ?auto_190015 ) ) ( not ( = ?auto_190012 ?auto_190016 ) ) ( not ( = ?auto_190012 ?auto_190017 ) ) ( not ( = ?auto_190012 ?auto_190018 ) ) ( not ( = ?auto_190012 ?auto_190019 ) ) ( not ( = ?auto_190013 ?auto_190014 ) ) ( not ( = ?auto_190013 ?auto_190015 ) ) ( not ( = ?auto_190013 ?auto_190016 ) ) ( not ( = ?auto_190013 ?auto_190017 ) ) ( not ( = ?auto_190013 ?auto_190018 ) ) ( not ( = ?auto_190013 ?auto_190019 ) ) ( not ( = ?auto_190014 ?auto_190015 ) ) ( not ( = ?auto_190014 ?auto_190016 ) ) ( not ( = ?auto_190014 ?auto_190017 ) ) ( not ( = ?auto_190014 ?auto_190018 ) ) ( not ( = ?auto_190014 ?auto_190019 ) ) ( not ( = ?auto_190015 ?auto_190016 ) ) ( not ( = ?auto_190015 ?auto_190017 ) ) ( not ( = ?auto_190015 ?auto_190018 ) ) ( not ( = ?auto_190015 ?auto_190019 ) ) ( not ( = ?auto_190016 ?auto_190017 ) ) ( not ( = ?auto_190016 ?auto_190018 ) ) ( not ( = ?auto_190016 ?auto_190019 ) ) ( not ( = ?auto_190017 ?auto_190018 ) ) ( not ( = ?auto_190017 ?auto_190019 ) ) ( not ( = ?auto_190018 ?auto_190019 ) ) ( ON ?auto_190017 ?auto_190018 ) ( ON ?auto_190016 ?auto_190017 ) ( ON ?auto_190015 ?auto_190016 ) ( ON ?auto_190014 ?auto_190015 ) ( ON ?auto_190013 ?auto_190014 ) ( CLEAR ?auto_190011 ) ( ON ?auto_190012 ?auto_190013 ) ( CLEAR ?auto_190012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190010 ?auto_190011 ?auto_190012 )
      ( MAKE-9PILE ?auto_190010 ?auto_190011 ?auto_190012 ?auto_190013 ?auto_190014 ?auto_190015 ?auto_190016 ?auto_190017 ?auto_190018 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_190029 - BLOCK
      ?auto_190030 - BLOCK
      ?auto_190031 - BLOCK
      ?auto_190032 - BLOCK
      ?auto_190033 - BLOCK
      ?auto_190034 - BLOCK
      ?auto_190035 - BLOCK
      ?auto_190036 - BLOCK
      ?auto_190037 - BLOCK
    )
    :vars
    (
      ?auto_190038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190037 ?auto_190038 ) ( ON-TABLE ?auto_190029 ) ( not ( = ?auto_190029 ?auto_190030 ) ) ( not ( = ?auto_190029 ?auto_190031 ) ) ( not ( = ?auto_190029 ?auto_190032 ) ) ( not ( = ?auto_190029 ?auto_190033 ) ) ( not ( = ?auto_190029 ?auto_190034 ) ) ( not ( = ?auto_190029 ?auto_190035 ) ) ( not ( = ?auto_190029 ?auto_190036 ) ) ( not ( = ?auto_190029 ?auto_190037 ) ) ( not ( = ?auto_190029 ?auto_190038 ) ) ( not ( = ?auto_190030 ?auto_190031 ) ) ( not ( = ?auto_190030 ?auto_190032 ) ) ( not ( = ?auto_190030 ?auto_190033 ) ) ( not ( = ?auto_190030 ?auto_190034 ) ) ( not ( = ?auto_190030 ?auto_190035 ) ) ( not ( = ?auto_190030 ?auto_190036 ) ) ( not ( = ?auto_190030 ?auto_190037 ) ) ( not ( = ?auto_190030 ?auto_190038 ) ) ( not ( = ?auto_190031 ?auto_190032 ) ) ( not ( = ?auto_190031 ?auto_190033 ) ) ( not ( = ?auto_190031 ?auto_190034 ) ) ( not ( = ?auto_190031 ?auto_190035 ) ) ( not ( = ?auto_190031 ?auto_190036 ) ) ( not ( = ?auto_190031 ?auto_190037 ) ) ( not ( = ?auto_190031 ?auto_190038 ) ) ( not ( = ?auto_190032 ?auto_190033 ) ) ( not ( = ?auto_190032 ?auto_190034 ) ) ( not ( = ?auto_190032 ?auto_190035 ) ) ( not ( = ?auto_190032 ?auto_190036 ) ) ( not ( = ?auto_190032 ?auto_190037 ) ) ( not ( = ?auto_190032 ?auto_190038 ) ) ( not ( = ?auto_190033 ?auto_190034 ) ) ( not ( = ?auto_190033 ?auto_190035 ) ) ( not ( = ?auto_190033 ?auto_190036 ) ) ( not ( = ?auto_190033 ?auto_190037 ) ) ( not ( = ?auto_190033 ?auto_190038 ) ) ( not ( = ?auto_190034 ?auto_190035 ) ) ( not ( = ?auto_190034 ?auto_190036 ) ) ( not ( = ?auto_190034 ?auto_190037 ) ) ( not ( = ?auto_190034 ?auto_190038 ) ) ( not ( = ?auto_190035 ?auto_190036 ) ) ( not ( = ?auto_190035 ?auto_190037 ) ) ( not ( = ?auto_190035 ?auto_190038 ) ) ( not ( = ?auto_190036 ?auto_190037 ) ) ( not ( = ?auto_190036 ?auto_190038 ) ) ( not ( = ?auto_190037 ?auto_190038 ) ) ( ON ?auto_190036 ?auto_190037 ) ( ON ?auto_190035 ?auto_190036 ) ( ON ?auto_190034 ?auto_190035 ) ( ON ?auto_190033 ?auto_190034 ) ( ON ?auto_190032 ?auto_190033 ) ( ON ?auto_190031 ?auto_190032 ) ( CLEAR ?auto_190029 ) ( ON ?auto_190030 ?auto_190031 ) ( CLEAR ?auto_190030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190029 ?auto_190030 )
      ( MAKE-9PILE ?auto_190029 ?auto_190030 ?auto_190031 ?auto_190032 ?auto_190033 ?auto_190034 ?auto_190035 ?auto_190036 ?auto_190037 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_190048 - BLOCK
      ?auto_190049 - BLOCK
      ?auto_190050 - BLOCK
      ?auto_190051 - BLOCK
      ?auto_190052 - BLOCK
      ?auto_190053 - BLOCK
      ?auto_190054 - BLOCK
      ?auto_190055 - BLOCK
      ?auto_190056 - BLOCK
    )
    :vars
    (
      ?auto_190057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190056 ?auto_190057 ) ( ON-TABLE ?auto_190048 ) ( not ( = ?auto_190048 ?auto_190049 ) ) ( not ( = ?auto_190048 ?auto_190050 ) ) ( not ( = ?auto_190048 ?auto_190051 ) ) ( not ( = ?auto_190048 ?auto_190052 ) ) ( not ( = ?auto_190048 ?auto_190053 ) ) ( not ( = ?auto_190048 ?auto_190054 ) ) ( not ( = ?auto_190048 ?auto_190055 ) ) ( not ( = ?auto_190048 ?auto_190056 ) ) ( not ( = ?auto_190048 ?auto_190057 ) ) ( not ( = ?auto_190049 ?auto_190050 ) ) ( not ( = ?auto_190049 ?auto_190051 ) ) ( not ( = ?auto_190049 ?auto_190052 ) ) ( not ( = ?auto_190049 ?auto_190053 ) ) ( not ( = ?auto_190049 ?auto_190054 ) ) ( not ( = ?auto_190049 ?auto_190055 ) ) ( not ( = ?auto_190049 ?auto_190056 ) ) ( not ( = ?auto_190049 ?auto_190057 ) ) ( not ( = ?auto_190050 ?auto_190051 ) ) ( not ( = ?auto_190050 ?auto_190052 ) ) ( not ( = ?auto_190050 ?auto_190053 ) ) ( not ( = ?auto_190050 ?auto_190054 ) ) ( not ( = ?auto_190050 ?auto_190055 ) ) ( not ( = ?auto_190050 ?auto_190056 ) ) ( not ( = ?auto_190050 ?auto_190057 ) ) ( not ( = ?auto_190051 ?auto_190052 ) ) ( not ( = ?auto_190051 ?auto_190053 ) ) ( not ( = ?auto_190051 ?auto_190054 ) ) ( not ( = ?auto_190051 ?auto_190055 ) ) ( not ( = ?auto_190051 ?auto_190056 ) ) ( not ( = ?auto_190051 ?auto_190057 ) ) ( not ( = ?auto_190052 ?auto_190053 ) ) ( not ( = ?auto_190052 ?auto_190054 ) ) ( not ( = ?auto_190052 ?auto_190055 ) ) ( not ( = ?auto_190052 ?auto_190056 ) ) ( not ( = ?auto_190052 ?auto_190057 ) ) ( not ( = ?auto_190053 ?auto_190054 ) ) ( not ( = ?auto_190053 ?auto_190055 ) ) ( not ( = ?auto_190053 ?auto_190056 ) ) ( not ( = ?auto_190053 ?auto_190057 ) ) ( not ( = ?auto_190054 ?auto_190055 ) ) ( not ( = ?auto_190054 ?auto_190056 ) ) ( not ( = ?auto_190054 ?auto_190057 ) ) ( not ( = ?auto_190055 ?auto_190056 ) ) ( not ( = ?auto_190055 ?auto_190057 ) ) ( not ( = ?auto_190056 ?auto_190057 ) ) ( ON ?auto_190055 ?auto_190056 ) ( ON ?auto_190054 ?auto_190055 ) ( ON ?auto_190053 ?auto_190054 ) ( ON ?auto_190052 ?auto_190053 ) ( ON ?auto_190051 ?auto_190052 ) ( ON ?auto_190050 ?auto_190051 ) ( CLEAR ?auto_190048 ) ( ON ?auto_190049 ?auto_190050 ) ( CLEAR ?auto_190049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190048 ?auto_190049 )
      ( MAKE-9PILE ?auto_190048 ?auto_190049 ?auto_190050 ?auto_190051 ?auto_190052 ?auto_190053 ?auto_190054 ?auto_190055 ?auto_190056 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_190067 - BLOCK
      ?auto_190068 - BLOCK
      ?auto_190069 - BLOCK
      ?auto_190070 - BLOCK
      ?auto_190071 - BLOCK
      ?auto_190072 - BLOCK
      ?auto_190073 - BLOCK
      ?auto_190074 - BLOCK
      ?auto_190075 - BLOCK
    )
    :vars
    (
      ?auto_190076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190075 ?auto_190076 ) ( not ( = ?auto_190067 ?auto_190068 ) ) ( not ( = ?auto_190067 ?auto_190069 ) ) ( not ( = ?auto_190067 ?auto_190070 ) ) ( not ( = ?auto_190067 ?auto_190071 ) ) ( not ( = ?auto_190067 ?auto_190072 ) ) ( not ( = ?auto_190067 ?auto_190073 ) ) ( not ( = ?auto_190067 ?auto_190074 ) ) ( not ( = ?auto_190067 ?auto_190075 ) ) ( not ( = ?auto_190067 ?auto_190076 ) ) ( not ( = ?auto_190068 ?auto_190069 ) ) ( not ( = ?auto_190068 ?auto_190070 ) ) ( not ( = ?auto_190068 ?auto_190071 ) ) ( not ( = ?auto_190068 ?auto_190072 ) ) ( not ( = ?auto_190068 ?auto_190073 ) ) ( not ( = ?auto_190068 ?auto_190074 ) ) ( not ( = ?auto_190068 ?auto_190075 ) ) ( not ( = ?auto_190068 ?auto_190076 ) ) ( not ( = ?auto_190069 ?auto_190070 ) ) ( not ( = ?auto_190069 ?auto_190071 ) ) ( not ( = ?auto_190069 ?auto_190072 ) ) ( not ( = ?auto_190069 ?auto_190073 ) ) ( not ( = ?auto_190069 ?auto_190074 ) ) ( not ( = ?auto_190069 ?auto_190075 ) ) ( not ( = ?auto_190069 ?auto_190076 ) ) ( not ( = ?auto_190070 ?auto_190071 ) ) ( not ( = ?auto_190070 ?auto_190072 ) ) ( not ( = ?auto_190070 ?auto_190073 ) ) ( not ( = ?auto_190070 ?auto_190074 ) ) ( not ( = ?auto_190070 ?auto_190075 ) ) ( not ( = ?auto_190070 ?auto_190076 ) ) ( not ( = ?auto_190071 ?auto_190072 ) ) ( not ( = ?auto_190071 ?auto_190073 ) ) ( not ( = ?auto_190071 ?auto_190074 ) ) ( not ( = ?auto_190071 ?auto_190075 ) ) ( not ( = ?auto_190071 ?auto_190076 ) ) ( not ( = ?auto_190072 ?auto_190073 ) ) ( not ( = ?auto_190072 ?auto_190074 ) ) ( not ( = ?auto_190072 ?auto_190075 ) ) ( not ( = ?auto_190072 ?auto_190076 ) ) ( not ( = ?auto_190073 ?auto_190074 ) ) ( not ( = ?auto_190073 ?auto_190075 ) ) ( not ( = ?auto_190073 ?auto_190076 ) ) ( not ( = ?auto_190074 ?auto_190075 ) ) ( not ( = ?auto_190074 ?auto_190076 ) ) ( not ( = ?auto_190075 ?auto_190076 ) ) ( ON ?auto_190074 ?auto_190075 ) ( ON ?auto_190073 ?auto_190074 ) ( ON ?auto_190072 ?auto_190073 ) ( ON ?auto_190071 ?auto_190072 ) ( ON ?auto_190070 ?auto_190071 ) ( ON ?auto_190069 ?auto_190070 ) ( ON ?auto_190068 ?auto_190069 ) ( ON ?auto_190067 ?auto_190068 ) ( CLEAR ?auto_190067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190067 )
      ( MAKE-9PILE ?auto_190067 ?auto_190068 ?auto_190069 ?auto_190070 ?auto_190071 ?auto_190072 ?auto_190073 ?auto_190074 ?auto_190075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_190086 - BLOCK
      ?auto_190087 - BLOCK
      ?auto_190088 - BLOCK
      ?auto_190089 - BLOCK
      ?auto_190090 - BLOCK
      ?auto_190091 - BLOCK
      ?auto_190092 - BLOCK
      ?auto_190093 - BLOCK
      ?auto_190094 - BLOCK
    )
    :vars
    (
      ?auto_190095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190094 ?auto_190095 ) ( not ( = ?auto_190086 ?auto_190087 ) ) ( not ( = ?auto_190086 ?auto_190088 ) ) ( not ( = ?auto_190086 ?auto_190089 ) ) ( not ( = ?auto_190086 ?auto_190090 ) ) ( not ( = ?auto_190086 ?auto_190091 ) ) ( not ( = ?auto_190086 ?auto_190092 ) ) ( not ( = ?auto_190086 ?auto_190093 ) ) ( not ( = ?auto_190086 ?auto_190094 ) ) ( not ( = ?auto_190086 ?auto_190095 ) ) ( not ( = ?auto_190087 ?auto_190088 ) ) ( not ( = ?auto_190087 ?auto_190089 ) ) ( not ( = ?auto_190087 ?auto_190090 ) ) ( not ( = ?auto_190087 ?auto_190091 ) ) ( not ( = ?auto_190087 ?auto_190092 ) ) ( not ( = ?auto_190087 ?auto_190093 ) ) ( not ( = ?auto_190087 ?auto_190094 ) ) ( not ( = ?auto_190087 ?auto_190095 ) ) ( not ( = ?auto_190088 ?auto_190089 ) ) ( not ( = ?auto_190088 ?auto_190090 ) ) ( not ( = ?auto_190088 ?auto_190091 ) ) ( not ( = ?auto_190088 ?auto_190092 ) ) ( not ( = ?auto_190088 ?auto_190093 ) ) ( not ( = ?auto_190088 ?auto_190094 ) ) ( not ( = ?auto_190088 ?auto_190095 ) ) ( not ( = ?auto_190089 ?auto_190090 ) ) ( not ( = ?auto_190089 ?auto_190091 ) ) ( not ( = ?auto_190089 ?auto_190092 ) ) ( not ( = ?auto_190089 ?auto_190093 ) ) ( not ( = ?auto_190089 ?auto_190094 ) ) ( not ( = ?auto_190089 ?auto_190095 ) ) ( not ( = ?auto_190090 ?auto_190091 ) ) ( not ( = ?auto_190090 ?auto_190092 ) ) ( not ( = ?auto_190090 ?auto_190093 ) ) ( not ( = ?auto_190090 ?auto_190094 ) ) ( not ( = ?auto_190090 ?auto_190095 ) ) ( not ( = ?auto_190091 ?auto_190092 ) ) ( not ( = ?auto_190091 ?auto_190093 ) ) ( not ( = ?auto_190091 ?auto_190094 ) ) ( not ( = ?auto_190091 ?auto_190095 ) ) ( not ( = ?auto_190092 ?auto_190093 ) ) ( not ( = ?auto_190092 ?auto_190094 ) ) ( not ( = ?auto_190092 ?auto_190095 ) ) ( not ( = ?auto_190093 ?auto_190094 ) ) ( not ( = ?auto_190093 ?auto_190095 ) ) ( not ( = ?auto_190094 ?auto_190095 ) ) ( ON ?auto_190093 ?auto_190094 ) ( ON ?auto_190092 ?auto_190093 ) ( ON ?auto_190091 ?auto_190092 ) ( ON ?auto_190090 ?auto_190091 ) ( ON ?auto_190089 ?auto_190090 ) ( ON ?auto_190088 ?auto_190089 ) ( ON ?auto_190087 ?auto_190088 ) ( ON ?auto_190086 ?auto_190087 ) ( CLEAR ?auto_190086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190086 )
      ( MAKE-9PILE ?auto_190086 ?auto_190087 ?auto_190088 ?auto_190089 ?auto_190090 ?auto_190091 ?auto_190092 ?auto_190093 ?auto_190094 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190106 - BLOCK
      ?auto_190107 - BLOCK
      ?auto_190108 - BLOCK
      ?auto_190109 - BLOCK
      ?auto_190110 - BLOCK
      ?auto_190111 - BLOCK
      ?auto_190112 - BLOCK
      ?auto_190113 - BLOCK
      ?auto_190114 - BLOCK
      ?auto_190115 - BLOCK
    )
    :vars
    (
      ?auto_190116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190114 ) ( ON ?auto_190115 ?auto_190116 ) ( CLEAR ?auto_190115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190106 ) ( ON ?auto_190107 ?auto_190106 ) ( ON ?auto_190108 ?auto_190107 ) ( ON ?auto_190109 ?auto_190108 ) ( ON ?auto_190110 ?auto_190109 ) ( ON ?auto_190111 ?auto_190110 ) ( ON ?auto_190112 ?auto_190111 ) ( ON ?auto_190113 ?auto_190112 ) ( ON ?auto_190114 ?auto_190113 ) ( not ( = ?auto_190106 ?auto_190107 ) ) ( not ( = ?auto_190106 ?auto_190108 ) ) ( not ( = ?auto_190106 ?auto_190109 ) ) ( not ( = ?auto_190106 ?auto_190110 ) ) ( not ( = ?auto_190106 ?auto_190111 ) ) ( not ( = ?auto_190106 ?auto_190112 ) ) ( not ( = ?auto_190106 ?auto_190113 ) ) ( not ( = ?auto_190106 ?auto_190114 ) ) ( not ( = ?auto_190106 ?auto_190115 ) ) ( not ( = ?auto_190106 ?auto_190116 ) ) ( not ( = ?auto_190107 ?auto_190108 ) ) ( not ( = ?auto_190107 ?auto_190109 ) ) ( not ( = ?auto_190107 ?auto_190110 ) ) ( not ( = ?auto_190107 ?auto_190111 ) ) ( not ( = ?auto_190107 ?auto_190112 ) ) ( not ( = ?auto_190107 ?auto_190113 ) ) ( not ( = ?auto_190107 ?auto_190114 ) ) ( not ( = ?auto_190107 ?auto_190115 ) ) ( not ( = ?auto_190107 ?auto_190116 ) ) ( not ( = ?auto_190108 ?auto_190109 ) ) ( not ( = ?auto_190108 ?auto_190110 ) ) ( not ( = ?auto_190108 ?auto_190111 ) ) ( not ( = ?auto_190108 ?auto_190112 ) ) ( not ( = ?auto_190108 ?auto_190113 ) ) ( not ( = ?auto_190108 ?auto_190114 ) ) ( not ( = ?auto_190108 ?auto_190115 ) ) ( not ( = ?auto_190108 ?auto_190116 ) ) ( not ( = ?auto_190109 ?auto_190110 ) ) ( not ( = ?auto_190109 ?auto_190111 ) ) ( not ( = ?auto_190109 ?auto_190112 ) ) ( not ( = ?auto_190109 ?auto_190113 ) ) ( not ( = ?auto_190109 ?auto_190114 ) ) ( not ( = ?auto_190109 ?auto_190115 ) ) ( not ( = ?auto_190109 ?auto_190116 ) ) ( not ( = ?auto_190110 ?auto_190111 ) ) ( not ( = ?auto_190110 ?auto_190112 ) ) ( not ( = ?auto_190110 ?auto_190113 ) ) ( not ( = ?auto_190110 ?auto_190114 ) ) ( not ( = ?auto_190110 ?auto_190115 ) ) ( not ( = ?auto_190110 ?auto_190116 ) ) ( not ( = ?auto_190111 ?auto_190112 ) ) ( not ( = ?auto_190111 ?auto_190113 ) ) ( not ( = ?auto_190111 ?auto_190114 ) ) ( not ( = ?auto_190111 ?auto_190115 ) ) ( not ( = ?auto_190111 ?auto_190116 ) ) ( not ( = ?auto_190112 ?auto_190113 ) ) ( not ( = ?auto_190112 ?auto_190114 ) ) ( not ( = ?auto_190112 ?auto_190115 ) ) ( not ( = ?auto_190112 ?auto_190116 ) ) ( not ( = ?auto_190113 ?auto_190114 ) ) ( not ( = ?auto_190113 ?auto_190115 ) ) ( not ( = ?auto_190113 ?auto_190116 ) ) ( not ( = ?auto_190114 ?auto_190115 ) ) ( not ( = ?auto_190114 ?auto_190116 ) ) ( not ( = ?auto_190115 ?auto_190116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190115 ?auto_190116 )
      ( !STACK ?auto_190115 ?auto_190114 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190127 - BLOCK
      ?auto_190128 - BLOCK
      ?auto_190129 - BLOCK
      ?auto_190130 - BLOCK
      ?auto_190131 - BLOCK
      ?auto_190132 - BLOCK
      ?auto_190133 - BLOCK
      ?auto_190134 - BLOCK
      ?auto_190135 - BLOCK
      ?auto_190136 - BLOCK
    )
    :vars
    (
      ?auto_190137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190135 ) ( ON ?auto_190136 ?auto_190137 ) ( CLEAR ?auto_190136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190127 ) ( ON ?auto_190128 ?auto_190127 ) ( ON ?auto_190129 ?auto_190128 ) ( ON ?auto_190130 ?auto_190129 ) ( ON ?auto_190131 ?auto_190130 ) ( ON ?auto_190132 ?auto_190131 ) ( ON ?auto_190133 ?auto_190132 ) ( ON ?auto_190134 ?auto_190133 ) ( ON ?auto_190135 ?auto_190134 ) ( not ( = ?auto_190127 ?auto_190128 ) ) ( not ( = ?auto_190127 ?auto_190129 ) ) ( not ( = ?auto_190127 ?auto_190130 ) ) ( not ( = ?auto_190127 ?auto_190131 ) ) ( not ( = ?auto_190127 ?auto_190132 ) ) ( not ( = ?auto_190127 ?auto_190133 ) ) ( not ( = ?auto_190127 ?auto_190134 ) ) ( not ( = ?auto_190127 ?auto_190135 ) ) ( not ( = ?auto_190127 ?auto_190136 ) ) ( not ( = ?auto_190127 ?auto_190137 ) ) ( not ( = ?auto_190128 ?auto_190129 ) ) ( not ( = ?auto_190128 ?auto_190130 ) ) ( not ( = ?auto_190128 ?auto_190131 ) ) ( not ( = ?auto_190128 ?auto_190132 ) ) ( not ( = ?auto_190128 ?auto_190133 ) ) ( not ( = ?auto_190128 ?auto_190134 ) ) ( not ( = ?auto_190128 ?auto_190135 ) ) ( not ( = ?auto_190128 ?auto_190136 ) ) ( not ( = ?auto_190128 ?auto_190137 ) ) ( not ( = ?auto_190129 ?auto_190130 ) ) ( not ( = ?auto_190129 ?auto_190131 ) ) ( not ( = ?auto_190129 ?auto_190132 ) ) ( not ( = ?auto_190129 ?auto_190133 ) ) ( not ( = ?auto_190129 ?auto_190134 ) ) ( not ( = ?auto_190129 ?auto_190135 ) ) ( not ( = ?auto_190129 ?auto_190136 ) ) ( not ( = ?auto_190129 ?auto_190137 ) ) ( not ( = ?auto_190130 ?auto_190131 ) ) ( not ( = ?auto_190130 ?auto_190132 ) ) ( not ( = ?auto_190130 ?auto_190133 ) ) ( not ( = ?auto_190130 ?auto_190134 ) ) ( not ( = ?auto_190130 ?auto_190135 ) ) ( not ( = ?auto_190130 ?auto_190136 ) ) ( not ( = ?auto_190130 ?auto_190137 ) ) ( not ( = ?auto_190131 ?auto_190132 ) ) ( not ( = ?auto_190131 ?auto_190133 ) ) ( not ( = ?auto_190131 ?auto_190134 ) ) ( not ( = ?auto_190131 ?auto_190135 ) ) ( not ( = ?auto_190131 ?auto_190136 ) ) ( not ( = ?auto_190131 ?auto_190137 ) ) ( not ( = ?auto_190132 ?auto_190133 ) ) ( not ( = ?auto_190132 ?auto_190134 ) ) ( not ( = ?auto_190132 ?auto_190135 ) ) ( not ( = ?auto_190132 ?auto_190136 ) ) ( not ( = ?auto_190132 ?auto_190137 ) ) ( not ( = ?auto_190133 ?auto_190134 ) ) ( not ( = ?auto_190133 ?auto_190135 ) ) ( not ( = ?auto_190133 ?auto_190136 ) ) ( not ( = ?auto_190133 ?auto_190137 ) ) ( not ( = ?auto_190134 ?auto_190135 ) ) ( not ( = ?auto_190134 ?auto_190136 ) ) ( not ( = ?auto_190134 ?auto_190137 ) ) ( not ( = ?auto_190135 ?auto_190136 ) ) ( not ( = ?auto_190135 ?auto_190137 ) ) ( not ( = ?auto_190136 ?auto_190137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190136 ?auto_190137 )
      ( !STACK ?auto_190136 ?auto_190135 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190148 - BLOCK
      ?auto_190149 - BLOCK
      ?auto_190150 - BLOCK
      ?auto_190151 - BLOCK
      ?auto_190152 - BLOCK
      ?auto_190153 - BLOCK
      ?auto_190154 - BLOCK
      ?auto_190155 - BLOCK
      ?auto_190156 - BLOCK
      ?auto_190157 - BLOCK
    )
    :vars
    (
      ?auto_190158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190157 ?auto_190158 ) ( ON-TABLE ?auto_190148 ) ( ON ?auto_190149 ?auto_190148 ) ( ON ?auto_190150 ?auto_190149 ) ( ON ?auto_190151 ?auto_190150 ) ( ON ?auto_190152 ?auto_190151 ) ( ON ?auto_190153 ?auto_190152 ) ( ON ?auto_190154 ?auto_190153 ) ( ON ?auto_190155 ?auto_190154 ) ( not ( = ?auto_190148 ?auto_190149 ) ) ( not ( = ?auto_190148 ?auto_190150 ) ) ( not ( = ?auto_190148 ?auto_190151 ) ) ( not ( = ?auto_190148 ?auto_190152 ) ) ( not ( = ?auto_190148 ?auto_190153 ) ) ( not ( = ?auto_190148 ?auto_190154 ) ) ( not ( = ?auto_190148 ?auto_190155 ) ) ( not ( = ?auto_190148 ?auto_190156 ) ) ( not ( = ?auto_190148 ?auto_190157 ) ) ( not ( = ?auto_190148 ?auto_190158 ) ) ( not ( = ?auto_190149 ?auto_190150 ) ) ( not ( = ?auto_190149 ?auto_190151 ) ) ( not ( = ?auto_190149 ?auto_190152 ) ) ( not ( = ?auto_190149 ?auto_190153 ) ) ( not ( = ?auto_190149 ?auto_190154 ) ) ( not ( = ?auto_190149 ?auto_190155 ) ) ( not ( = ?auto_190149 ?auto_190156 ) ) ( not ( = ?auto_190149 ?auto_190157 ) ) ( not ( = ?auto_190149 ?auto_190158 ) ) ( not ( = ?auto_190150 ?auto_190151 ) ) ( not ( = ?auto_190150 ?auto_190152 ) ) ( not ( = ?auto_190150 ?auto_190153 ) ) ( not ( = ?auto_190150 ?auto_190154 ) ) ( not ( = ?auto_190150 ?auto_190155 ) ) ( not ( = ?auto_190150 ?auto_190156 ) ) ( not ( = ?auto_190150 ?auto_190157 ) ) ( not ( = ?auto_190150 ?auto_190158 ) ) ( not ( = ?auto_190151 ?auto_190152 ) ) ( not ( = ?auto_190151 ?auto_190153 ) ) ( not ( = ?auto_190151 ?auto_190154 ) ) ( not ( = ?auto_190151 ?auto_190155 ) ) ( not ( = ?auto_190151 ?auto_190156 ) ) ( not ( = ?auto_190151 ?auto_190157 ) ) ( not ( = ?auto_190151 ?auto_190158 ) ) ( not ( = ?auto_190152 ?auto_190153 ) ) ( not ( = ?auto_190152 ?auto_190154 ) ) ( not ( = ?auto_190152 ?auto_190155 ) ) ( not ( = ?auto_190152 ?auto_190156 ) ) ( not ( = ?auto_190152 ?auto_190157 ) ) ( not ( = ?auto_190152 ?auto_190158 ) ) ( not ( = ?auto_190153 ?auto_190154 ) ) ( not ( = ?auto_190153 ?auto_190155 ) ) ( not ( = ?auto_190153 ?auto_190156 ) ) ( not ( = ?auto_190153 ?auto_190157 ) ) ( not ( = ?auto_190153 ?auto_190158 ) ) ( not ( = ?auto_190154 ?auto_190155 ) ) ( not ( = ?auto_190154 ?auto_190156 ) ) ( not ( = ?auto_190154 ?auto_190157 ) ) ( not ( = ?auto_190154 ?auto_190158 ) ) ( not ( = ?auto_190155 ?auto_190156 ) ) ( not ( = ?auto_190155 ?auto_190157 ) ) ( not ( = ?auto_190155 ?auto_190158 ) ) ( not ( = ?auto_190156 ?auto_190157 ) ) ( not ( = ?auto_190156 ?auto_190158 ) ) ( not ( = ?auto_190157 ?auto_190158 ) ) ( CLEAR ?auto_190155 ) ( ON ?auto_190156 ?auto_190157 ) ( CLEAR ?auto_190156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_190148 ?auto_190149 ?auto_190150 ?auto_190151 ?auto_190152 ?auto_190153 ?auto_190154 ?auto_190155 ?auto_190156 )
      ( MAKE-10PILE ?auto_190148 ?auto_190149 ?auto_190150 ?auto_190151 ?auto_190152 ?auto_190153 ?auto_190154 ?auto_190155 ?auto_190156 ?auto_190157 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190169 - BLOCK
      ?auto_190170 - BLOCK
      ?auto_190171 - BLOCK
      ?auto_190172 - BLOCK
      ?auto_190173 - BLOCK
      ?auto_190174 - BLOCK
      ?auto_190175 - BLOCK
      ?auto_190176 - BLOCK
      ?auto_190177 - BLOCK
      ?auto_190178 - BLOCK
    )
    :vars
    (
      ?auto_190179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190178 ?auto_190179 ) ( ON-TABLE ?auto_190169 ) ( ON ?auto_190170 ?auto_190169 ) ( ON ?auto_190171 ?auto_190170 ) ( ON ?auto_190172 ?auto_190171 ) ( ON ?auto_190173 ?auto_190172 ) ( ON ?auto_190174 ?auto_190173 ) ( ON ?auto_190175 ?auto_190174 ) ( ON ?auto_190176 ?auto_190175 ) ( not ( = ?auto_190169 ?auto_190170 ) ) ( not ( = ?auto_190169 ?auto_190171 ) ) ( not ( = ?auto_190169 ?auto_190172 ) ) ( not ( = ?auto_190169 ?auto_190173 ) ) ( not ( = ?auto_190169 ?auto_190174 ) ) ( not ( = ?auto_190169 ?auto_190175 ) ) ( not ( = ?auto_190169 ?auto_190176 ) ) ( not ( = ?auto_190169 ?auto_190177 ) ) ( not ( = ?auto_190169 ?auto_190178 ) ) ( not ( = ?auto_190169 ?auto_190179 ) ) ( not ( = ?auto_190170 ?auto_190171 ) ) ( not ( = ?auto_190170 ?auto_190172 ) ) ( not ( = ?auto_190170 ?auto_190173 ) ) ( not ( = ?auto_190170 ?auto_190174 ) ) ( not ( = ?auto_190170 ?auto_190175 ) ) ( not ( = ?auto_190170 ?auto_190176 ) ) ( not ( = ?auto_190170 ?auto_190177 ) ) ( not ( = ?auto_190170 ?auto_190178 ) ) ( not ( = ?auto_190170 ?auto_190179 ) ) ( not ( = ?auto_190171 ?auto_190172 ) ) ( not ( = ?auto_190171 ?auto_190173 ) ) ( not ( = ?auto_190171 ?auto_190174 ) ) ( not ( = ?auto_190171 ?auto_190175 ) ) ( not ( = ?auto_190171 ?auto_190176 ) ) ( not ( = ?auto_190171 ?auto_190177 ) ) ( not ( = ?auto_190171 ?auto_190178 ) ) ( not ( = ?auto_190171 ?auto_190179 ) ) ( not ( = ?auto_190172 ?auto_190173 ) ) ( not ( = ?auto_190172 ?auto_190174 ) ) ( not ( = ?auto_190172 ?auto_190175 ) ) ( not ( = ?auto_190172 ?auto_190176 ) ) ( not ( = ?auto_190172 ?auto_190177 ) ) ( not ( = ?auto_190172 ?auto_190178 ) ) ( not ( = ?auto_190172 ?auto_190179 ) ) ( not ( = ?auto_190173 ?auto_190174 ) ) ( not ( = ?auto_190173 ?auto_190175 ) ) ( not ( = ?auto_190173 ?auto_190176 ) ) ( not ( = ?auto_190173 ?auto_190177 ) ) ( not ( = ?auto_190173 ?auto_190178 ) ) ( not ( = ?auto_190173 ?auto_190179 ) ) ( not ( = ?auto_190174 ?auto_190175 ) ) ( not ( = ?auto_190174 ?auto_190176 ) ) ( not ( = ?auto_190174 ?auto_190177 ) ) ( not ( = ?auto_190174 ?auto_190178 ) ) ( not ( = ?auto_190174 ?auto_190179 ) ) ( not ( = ?auto_190175 ?auto_190176 ) ) ( not ( = ?auto_190175 ?auto_190177 ) ) ( not ( = ?auto_190175 ?auto_190178 ) ) ( not ( = ?auto_190175 ?auto_190179 ) ) ( not ( = ?auto_190176 ?auto_190177 ) ) ( not ( = ?auto_190176 ?auto_190178 ) ) ( not ( = ?auto_190176 ?auto_190179 ) ) ( not ( = ?auto_190177 ?auto_190178 ) ) ( not ( = ?auto_190177 ?auto_190179 ) ) ( not ( = ?auto_190178 ?auto_190179 ) ) ( CLEAR ?auto_190176 ) ( ON ?auto_190177 ?auto_190178 ) ( CLEAR ?auto_190177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_190169 ?auto_190170 ?auto_190171 ?auto_190172 ?auto_190173 ?auto_190174 ?auto_190175 ?auto_190176 ?auto_190177 )
      ( MAKE-10PILE ?auto_190169 ?auto_190170 ?auto_190171 ?auto_190172 ?auto_190173 ?auto_190174 ?auto_190175 ?auto_190176 ?auto_190177 ?auto_190178 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190190 - BLOCK
      ?auto_190191 - BLOCK
      ?auto_190192 - BLOCK
      ?auto_190193 - BLOCK
      ?auto_190194 - BLOCK
      ?auto_190195 - BLOCK
      ?auto_190196 - BLOCK
      ?auto_190197 - BLOCK
      ?auto_190198 - BLOCK
      ?auto_190199 - BLOCK
    )
    :vars
    (
      ?auto_190200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190199 ?auto_190200 ) ( ON-TABLE ?auto_190190 ) ( ON ?auto_190191 ?auto_190190 ) ( ON ?auto_190192 ?auto_190191 ) ( ON ?auto_190193 ?auto_190192 ) ( ON ?auto_190194 ?auto_190193 ) ( ON ?auto_190195 ?auto_190194 ) ( ON ?auto_190196 ?auto_190195 ) ( not ( = ?auto_190190 ?auto_190191 ) ) ( not ( = ?auto_190190 ?auto_190192 ) ) ( not ( = ?auto_190190 ?auto_190193 ) ) ( not ( = ?auto_190190 ?auto_190194 ) ) ( not ( = ?auto_190190 ?auto_190195 ) ) ( not ( = ?auto_190190 ?auto_190196 ) ) ( not ( = ?auto_190190 ?auto_190197 ) ) ( not ( = ?auto_190190 ?auto_190198 ) ) ( not ( = ?auto_190190 ?auto_190199 ) ) ( not ( = ?auto_190190 ?auto_190200 ) ) ( not ( = ?auto_190191 ?auto_190192 ) ) ( not ( = ?auto_190191 ?auto_190193 ) ) ( not ( = ?auto_190191 ?auto_190194 ) ) ( not ( = ?auto_190191 ?auto_190195 ) ) ( not ( = ?auto_190191 ?auto_190196 ) ) ( not ( = ?auto_190191 ?auto_190197 ) ) ( not ( = ?auto_190191 ?auto_190198 ) ) ( not ( = ?auto_190191 ?auto_190199 ) ) ( not ( = ?auto_190191 ?auto_190200 ) ) ( not ( = ?auto_190192 ?auto_190193 ) ) ( not ( = ?auto_190192 ?auto_190194 ) ) ( not ( = ?auto_190192 ?auto_190195 ) ) ( not ( = ?auto_190192 ?auto_190196 ) ) ( not ( = ?auto_190192 ?auto_190197 ) ) ( not ( = ?auto_190192 ?auto_190198 ) ) ( not ( = ?auto_190192 ?auto_190199 ) ) ( not ( = ?auto_190192 ?auto_190200 ) ) ( not ( = ?auto_190193 ?auto_190194 ) ) ( not ( = ?auto_190193 ?auto_190195 ) ) ( not ( = ?auto_190193 ?auto_190196 ) ) ( not ( = ?auto_190193 ?auto_190197 ) ) ( not ( = ?auto_190193 ?auto_190198 ) ) ( not ( = ?auto_190193 ?auto_190199 ) ) ( not ( = ?auto_190193 ?auto_190200 ) ) ( not ( = ?auto_190194 ?auto_190195 ) ) ( not ( = ?auto_190194 ?auto_190196 ) ) ( not ( = ?auto_190194 ?auto_190197 ) ) ( not ( = ?auto_190194 ?auto_190198 ) ) ( not ( = ?auto_190194 ?auto_190199 ) ) ( not ( = ?auto_190194 ?auto_190200 ) ) ( not ( = ?auto_190195 ?auto_190196 ) ) ( not ( = ?auto_190195 ?auto_190197 ) ) ( not ( = ?auto_190195 ?auto_190198 ) ) ( not ( = ?auto_190195 ?auto_190199 ) ) ( not ( = ?auto_190195 ?auto_190200 ) ) ( not ( = ?auto_190196 ?auto_190197 ) ) ( not ( = ?auto_190196 ?auto_190198 ) ) ( not ( = ?auto_190196 ?auto_190199 ) ) ( not ( = ?auto_190196 ?auto_190200 ) ) ( not ( = ?auto_190197 ?auto_190198 ) ) ( not ( = ?auto_190197 ?auto_190199 ) ) ( not ( = ?auto_190197 ?auto_190200 ) ) ( not ( = ?auto_190198 ?auto_190199 ) ) ( not ( = ?auto_190198 ?auto_190200 ) ) ( not ( = ?auto_190199 ?auto_190200 ) ) ( ON ?auto_190198 ?auto_190199 ) ( CLEAR ?auto_190196 ) ( ON ?auto_190197 ?auto_190198 ) ( CLEAR ?auto_190197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190190 ?auto_190191 ?auto_190192 ?auto_190193 ?auto_190194 ?auto_190195 ?auto_190196 ?auto_190197 )
      ( MAKE-10PILE ?auto_190190 ?auto_190191 ?auto_190192 ?auto_190193 ?auto_190194 ?auto_190195 ?auto_190196 ?auto_190197 ?auto_190198 ?auto_190199 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190211 - BLOCK
      ?auto_190212 - BLOCK
      ?auto_190213 - BLOCK
      ?auto_190214 - BLOCK
      ?auto_190215 - BLOCK
      ?auto_190216 - BLOCK
      ?auto_190217 - BLOCK
      ?auto_190218 - BLOCK
      ?auto_190219 - BLOCK
      ?auto_190220 - BLOCK
    )
    :vars
    (
      ?auto_190221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190220 ?auto_190221 ) ( ON-TABLE ?auto_190211 ) ( ON ?auto_190212 ?auto_190211 ) ( ON ?auto_190213 ?auto_190212 ) ( ON ?auto_190214 ?auto_190213 ) ( ON ?auto_190215 ?auto_190214 ) ( ON ?auto_190216 ?auto_190215 ) ( ON ?auto_190217 ?auto_190216 ) ( not ( = ?auto_190211 ?auto_190212 ) ) ( not ( = ?auto_190211 ?auto_190213 ) ) ( not ( = ?auto_190211 ?auto_190214 ) ) ( not ( = ?auto_190211 ?auto_190215 ) ) ( not ( = ?auto_190211 ?auto_190216 ) ) ( not ( = ?auto_190211 ?auto_190217 ) ) ( not ( = ?auto_190211 ?auto_190218 ) ) ( not ( = ?auto_190211 ?auto_190219 ) ) ( not ( = ?auto_190211 ?auto_190220 ) ) ( not ( = ?auto_190211 ?auto_190221 ) ) ( not ( = ?auto_190212 ?auto_190213 ) ) ( not ( = ?auto_190212 ?auto_190214 ) ) ( not ( = ?auto_190212 ?auto_190215 ) ) ( not ( = ?auto_190212 ?auto_190216 ) ) ( not ( = ?auto_190212 ?auto_190217 ) ) ( not ( = ?auto_190212 ?auto_190218 ) ) ( not ( = ?auto_190212 ?auto_190219 ) ) ( not ( = ?auto_190212 ?auto_190220 ) ) ( not ( = ?auto_190212 ?auto_190221 ) ) ( not ( = ?auto_190213 ?auto_190214 ) ) ( not ( = ?auto_190213 ?auto_190215 ) ) ( not ( = ?auto_190213 ?auto_190216 ) ) ( not ( = ?auto_190213 ?auto_190217 ) ) ( not ( = ?auto_190213 ?auto_190218 ) ) ( not ( = ?auto_190213 ?auto_190219 ) ) ( not ( = ?auto_190213 ?auto_190220 ) ) ( not ( = ?auto_190213 ?auto_190221 ) ) ( not ( = ?auto_190214 ?auto_190215 ) ) ( not ( = ?auto_190214 ?auto_190216 ) ) ( not ( = ?auto_190214 ?auto_190217 ) ) ( not ( = ?auto_190214 ?auto_190218 ) ) ( not ( = ?auto_190214 ?auto_190219 ) ) ( not ( = ?auto_190214 ?auto_190220 ) ) ( not ( = ?auto_190214 ?auto_190221 ) ) ( not ( = ?auto_190215 ?auto_190216 ) ) ( not ( = ?auto_190215 ?auto_190217 ) ) ( not ( = ?auto_190215 ?auto_190218 ) ) ( not ( = ?auto_190215 ?auto_190219 ) ) ( not ( = ?auto_190215 ?auto_190220 ) ) ( not ( = ?auto_190215 ?auto_190221 ) ) ( not ( = ?auto_190216 ?auto_190217 ) ) ( not ( = ?auto_190216 ?auto_190218 ) ) ( not ( = ?auto_190216 ?auto_190219 ) ) ( not ( = ?auto_190216 ?auto_190220 ) ) ( not ( = ?auto_190216 ?auto_190221 ) ) ( not ( = ?auto_190217 ?auto_190218 ) ) ( not ( = ?auto_190217 ?auto_190219 ) ) ( not ( = ?auto_190217 ?auto_190220 ) ) ( not ( = ?auto_190217 ?auto_190221 ) ) ( not ( = ?auto_190218 ?auto_190219 ) ) ( not ( = ?auto_190218 ?auto_190220 ) ) ( not ( = ?auto_190218 ?auto_190221 ) ) ( not ( = ?auto_190219 ?auto_190220 ) ) ( not ( = ?auto_190219 ?auto_190221 ) ) ( not ( = ?auto_190220 ?auto_190221 ) ) ( ON ?auto_190219 ?auto_190220 ) ( CLEAR ?auto_190217 ) ( ON ?auto_190218 ?auto_190219 ) ( CLEAR ?auto_190218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190211 ?auto_190212 ?auto_190213 ?auto_190214 ?auto_190215 ?auto_190216 ?auto_190217 ?auto_190218 )
      ( MAKE-10PILE ?auto_190211 ?auto_190212 ?auto_190213 ?auto_190214 ?auto_190215 ?auto_190216 ?auto_190217 ?auto_190218 ?auto_190219 ?auto_190220 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190232 - BLOCK
      ?auto_190233 - BLOCK
      ?auto_190234 - BLOCK
      ?auto_190235 - BLOCK
      ?auto_190236 - BLOCK
      ?auto_190237 - BLOCK
      ?auto_190238 - BLOCK
      ?auto_190239 - BLOCK
      ?auto_190240 - BLOCK
      ?auto_190241 - BLOCK
    )
    :vars
    (
      ?auto_190242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190241 ?auto_190242 ) ( ON-TABLE ?auto_190232 ) ( ON ?auto_190233 ?auto_190232 ) ( ON ?auto_190234 ?auto_190233 ) ( ON ?auto_190235 ?auto_190234 ) ( ON ?auto_190236 ?auto_190235 ) ( ON ?auto_190237 ?auto_190236 ) ( not ( = ?auto_190232 ?auto_190233 ) ) ( not ( = ?auto_190232 ?auto_190234 ) ) ( not ( = ?auto_190232 ?auto_190235 ) ) ( not ( = ?auto_190232 ?auto_190236 ) ) ( not ( = ?auto_190232 ?auto_190237 ) ) ( not ( = ?auto_190232 ?auto_190238 ) ) ( not ( = ?auto_190232 ?auto_190239 ) ) ( not ( = ?auto_190232 ?auto_190240 ) ) ( not ( = ?auto_190232 ?auto_190241 ) ) ( not ( = ?auto_190232 ?auto_190242 ) ) ( not ( = ?auto_190233 ?auto_190234 ) ) ( not ( = ?auto_190233 ?auto_190235 ) ) ( not ( = ?auto_190233 ?auto_190236 ) ) ( not ( = ?auto_190233 ?auto_190237 ) ) ( not ( = ?auto_190233 ?auto_190238 ) ) ( not ( = ?auto_190233 ?auto_190239 ) ) ( not ( = ?auto_190233 ?auto_190240 ) ) ( not ( = ?auto_190233 ?auto_190241 ) ) ( not ( = ?auto_190233 ?auto_190242 ) ) ( not ( = ?auto_190234 ?auto_190235 ) ) ( not ( = ?auto_190234 ?auto_190236 ) ) ( not ( = ?auto_190234 ?auto_190237 ) ) ( not ( = ?auto_190234 ?auto_190238 ) ) ( not ( = ?auto_190234 ?auto_190239 ) ) ( not ( = ?auto_190234 ?auto_190240 ) ) ( not ( = ?auto_190234 ?auto_190241 ) ) ( not ( = ?auto_190234 ?auto_190242 ) ) ( not ( = ?auto_190235 ?auto_190236 ) ) ( not ( = ?auto_190235 ?auto_190237 ) ) ( not ( = ?auto_190235 ?auto_190238 ) ) ( not ( = ?auto_190235 ?auto_190239 ) ) ( not ( = ?auto_190235 ?auto_190240 ) ) ( not ( = ?auto_190235 ?auto_190241 ) ) ( not ( = ?auto_190235 ?auto_190242 ) ) ( not ( = ?auto_190236 ?auto_190237 ) ) ( not ( = ?auto_190236 ?auto_190238 ) ) ( not ( = ?auto_190236 ?auto_190239 ) ) ( not ( = ?auto_190236 ?auto_190240 ) ) ( not ( = ?auto_190236 ?auto_190241 ) ) ( not ( = ?auto_190236 ?auto_190242 ) ) ( not ( = ?auto_190237 ?auto_190238 ) ) ( not ( = ?auto_190237 ?auto_190239 ) ) ( not ( = ?auto_190237 ?auto_190240 ) ) ( not ( = ?auto_190237 ?auto_190241 ) ) ( not ( = ?auto_190237 ?auto_190242 ) ) ( not ( = ?auto_190238 ?auto_190239 ) ) ( not ( = ?auto_190238 ?auto_190240 ) ) ( not ( = ?auto_190238 ?auto_190241 ) ) ( not ( = ?auto_190238 ?auto_190242 ) ) ( not ( = ?auto_190239 ?auto_190240 ) ) ( not ( = ?auto_190239 ?auto_190241 ) ) ( not ( = ?auto_190239 ?auto_190242 ) ) ( not ( = ?auto_190240 ?auto_190241 ) ) ( not ( = ?auto_190240 ?auto_190242 ) ) ( not ( = ?auto_190241 ?auto_190242 ) ) ( ON ?auto_190240 ?auto_190241 ) ( ON ?auto_190239 ?auto_190240 ) ( CLEAR ?auto_190237 ) ( ON ?auto_190238 ?auto_190239 ) ( CLEAR ?auto_190238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190232 ?auto_190233 ?auto_190234 ?auto_190235 ?auto_190236 ?auto_190237 ?auto_190238 )
      ( MAKE-10PILE ?auto_190232 ?auto_190233 ?auto_190234 ?auto_190235 ?auto_190236 ?auto_190237 ?auto_190238 ?auto_190239 ?auto_190240 ?auto_190241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190253 - BLOCK
      ?auto_190254 - BLOCK
      ?auto_190255 - BLOCK
      ?auto_190256 - BLOCK
      ?auto_190257 - BLOCK
      ?auto_190258 - BLOCK
      ?auto_190259 - BLOCK
      ?auto_190260 - BLOCK
      ?auto_190261 - BLOCK
      ?auto_190262 - BLOCK
    )
    :vars
    (
      ?auto_190263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190262 ?auto_190263 ) ( ON-TABLE ?auto_190253 ) ( ON ?auto_190254 ?auto_190253 ) ( ON ?auto_190255 ?auto_190254 ) ( ON ?auto_190256 ?auto_190255 ) ( ON ?auto_190257 ?auto_190256 ) ( ON ?auto_190258 ?auto_190257 ) ( not ( = ?auto_190253 ?auto_190254 ) ) ( not ( = ?auto_190253 ?auto_190255 ) ) ( not ( = ?auto_190253 ?auto_190256 ) ) ( not ( = ?auto_190253 ?auto_190257 ) ) ( not ( = ?auto_190253 ?auto_190258 ) ) ( not ( = ?auto_190253 ?auto_190259 ) ) ( not ( = ?auto_190253 ?auto_190260 ) ) ( not ( = ?auto_190253 ?auto_190261 ) ) ( not ( = ?auto_190253 ?auto_190262 ) ) ( not ( = ?auto_190253 ?auto_190263 ) ) ( not ( = ?auto_190254 ?auto_190255 ) ) ( not ( = ?auto_190254 ?auto_190256 ) ) ( not ( = ?auto_190254 ?auto_190257 ) ) ( not ( = ?auto_190254 ?auto_190258 ) ) ( not ( = ?auto_190254 ?auto_190259 ) ) ( not ( = ?auto_190254 ?auto_190260 ) ) ( not ( = ?auto_190254 ?auto_190261 ) ) ( not ( = ?auto_190254 ?auto_190262 ) ) ( not ( = ?auto_190254 ?auto_190263 ) ) ( not ( = ?auto_190255 ?auto_190256 ) ) ( not ( = ?auto_190255 ?auto_190257 ) ) ( not ( = ?auto_190255 ?auto_190258 ) ) ( not ( = ?auto_190255 ?auto_190259 ) ) ( not ( = ?auto_190255 ?auto_190260 ) ) ( not ( = ?auto_190255 ?auto_190261 ) ) ( not ( = ?auto_190255 ?auto_190262 ) ) ( not ( = ?auto_190255 ?auto_190263 ) ) ( not ( = ?auto_190256 ?auto_190257 ) ) ( not ( = ?auto_190256 ?auto_190258 ) ) ( not ( = ?auto_190256 ?auto_190259 ) ) ( not ( = ?auto_190256 ?auto_190260 ) ) ( not ( = ?auto_190256 ?auto_190261 ) ) ( not ( = ?auto_190256 ?auto_190262 ) ) ( not ( = ?auto_190256 ?auto_190263 ) ) ( not ( = ?auto_190257 ?auto_190258 ) ) ( not ( = ?auto_190257 ?auto_190259 ) ) ( not ( = ?auto_190257 ?auto_190260 ) ) ( not ( = ?auto_190257 ?auto_190261 ) ) ( not ( = ?auto_190257 ?auto_190262 ) ) ( not ( = ?auto_190257 ?auto_190263 ) ) ( not ( = ?auto_190258 ?auto_190259 ) ) ( not ( = ?auto_190258 ?auto_190260 ) ) ( not ( = ?auto_190258 ?auto_190261 ) ) ( not ( = ?auto_190258 ?auto_190262 ) ) ( not ( = ?auto_190258 ?auto_190263 ) ) ( not ( = ?auto_190259 ?auto_190260 ) ) ( not ( = ?auto_190259 ?auto_190261 ) ) ( not ( = ?auto_190259 ?auto_190262 ) ) ( not ( = ?auto_190259 ?auto_190263 ) ) ( not ( = ?auto_190260 ?auto_190261 ) ) ( not ( = ?auto_190260 ?auto_190262 ) ) ( not ( = ?auto_190260 ?auto_190263 ) ) ( not ( = ?auto_190261 ?auto_190262 ) ) ( not ( = ?auto_190261 ?auto_190263 ) ) ( not ( = ?auto_190262 ?auto_190263 ) ) ( ON ?auto_190261 ?auto_190262 ) ( ON ?auto_190260 ?auto_190261 ) ( CLEAR ?auto_190258 ) ( ON ?auto_190259 ?auto_190260 ) ( CLEAR ?auto_190259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190253 ?auto_190254 ?auto_190255 ?auto_190256 ?auto_190257 ?auto_190258 ?auto_190259 )
      ( MAKE-10PILE ?auto_190253 ?auto_190254 ?auto_190255 ?auto_190256 ?auto_190257 ?auto_190258 ?auto_190259 ?auto_190260 ?auto_190261 ?auto_190262 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190274 - BLOCK
      ?auto_190275 - BLOCK
      ?auto_190276 - BLOCK
      ?auto_190277 - BLOCK
      ?auto_190278 - BLOCK
      ?auto_190279 - BLOCK
      ?auto_190280 - BLOCK
      ?auto_190281 - BLOCK
      ?auto_190282 - BLOCK
      ?auto_190283 - BLOCK
    )
    :vars
    (
      ?auto_190284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190283 ?auto_190284 ) ( ON-TABLE ?auto_190274 ) ( ON ?auto_190275 ?auto_190274 ) ( ON ?auto_190276 ?auto_190275 ) ( ON ?auto_190277 ?auto_190276 ) ( ON ?auto_190278 ?auto_190277 ) ( not ( = ?auto_190274 ?auto_190275 ) ) ( not ( = ?auto_190274 ?auto_190276 ) ) ( not ( = ?auto_190274 ?auto_190277 ) ) ( not ( = ?auto_190274 ?auto_190278 ) ) ( not ( = ?auto_190274 ?auto_190279 ) ) ( not ( = ?auto_190274 ?auto_190280 ) ) ( not ( = ?auto_190274 ?auto_190281 ) ) ( not ( = ?auto_190274 ?auto_190282 ) ) ( not ( = ?auto_190274 ?auto_190283 ) ) ( not ( = ?auto_190274 ?auto_190284 ) ) ( not ( = ?auto_190275 ?auto_190276 ) ) ( not ( = ?auto_190275 ?auto_190277 ) ) ( not ( = ?auto_190275 ?auto_190278 ) ) ( not ( = ?auto_190275 ?auto_190279 ) ) ( not ( = ?auto_190275 ?auto_190280 ) ) ( not ( = ?auto_190275 ?auto_190281 ) ) ( not ( = ?auto_190275 ?auto_190282 ) ) ( not ( = ?auto_190275 ?auto_190283 ) ) ( not ( = ?auto_190275 ?auto_190284 ) ) ( not ( = ?auto_190276 ?auto_190277 ) ) ( not ( = ?auto_190276 ?auto_190278 ) ) ( not ( = ?auto_190276 ?auto_190279 ) ) ( not ( = ?auto_190276 ?auto_190280 ) ) ( not ( = ?auto_190276 ?auto_190281 ) ) ( not ( = ?auto_190276 ?auto_190282 ) ) ( not ( = ?auto_190276 ?auto_190283 ) ) ( not ( = ?auto_190276 ?auto_190284 ) ) ( not ( = ?auto_190277 ?auto_190278 ) ) ( not ( = ?auto_190277 ?auto_190279 ) ) ( not ( = ?auto_190277 ?auto_190280 ) ) ( not ( = ?auto_190277 ?auto_190281 ) ) ( not ( = ?auto_190277 ?auto_190282 ) ) ( not ( = ?auto_190277 ?auto_190283 ) ) ( not ( = ?auto_190277 ?auto_190284 ) ) ( not ( = ?auto_190278 ?auto_190279 ) ) ( not ( = ?auto_190278 ?auto_190280 ) ) ( not ( = ?auto_190278 ?auto_190281 ) ) ( not ( = ?auto_190278 ?auto_190282 ) ) ( not ( = ?auto_190278 ?auto_190283 ) ) ( not ( = ?auto_190278 ?auto_190284 ) ) ( not ( = ?auto_190279 ?auto_190280 ) ) ( not ( = ?auto_190279 ?auto_190281 ) ) ( not ( = ?auto_190279 ?auto_190282 ) ) ( not ( = ?auto_190279 ?auto_190283 ) ) ( not ( = ?auto_190279 ?auto_190284 ) ) ( not ( = ?auto_190280 ?auto_190281 ) ) ( not ( = ?auto_190280 ?auto_190282 ) ) ( not ( = ?auto_190280 ?auto_190283 ) ) ( not ( = ?auto_190280 ?auto_190284 ) ) ( not ( = ?auto_190281 ?auto_190282 ) ) ( not ( = ?auto_190281 ?auto_190283 ) ) ( not ( = ?auto_190281 ?auto_190284 ) ) ( not ( = ?auto_190282 ?auto_190283 ) ) ( not ( = ?auto_190282 ?auto_190284 ) ) ( not ( = ?auto_190283 ?auto_190284 ) ) ( ON ?auto_190282 ?auto_190283 ) ( ON ?auto_190281 ?auto_190282 ) ( ON ?auto_190280 ?auto_190281 ) ( CLEAR ?auto_190278 ) ( ON ?auto_190279 ?auto_190280 ) ( CLEAR ?auto_190279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190274 ?auto_190275 ?auto_190276 ?auto_190277 ?auto_190278 ?auto_190279 )
      ( MAKE-10PILE ?auto_190274 ?auto_190275 ?auto_190276 ?auto_190277 ?auto_190278 ?auto_190279 ?auto_190280 ?auto_190281 ?auto_190282 ?auto_190283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190295 - BLOCK
      ?auto_190296 - BLOCK
      ?auto_190297 - BLOCK
      ?auto_190298 - BLOCK
      ?auto_190299 - BLOCK
      ?auto_190300 - BLOCK
      ?auto_190301 - BLOCK
      ?auto_190302 - BLOCK
      ?auto_190303 - BLOCK
      ?auto_190304 - BLOCK
    )
    :vars
    (
      ?auto_190305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190304 ?auto_190305 ) ( ON-TABLE ?auto_190295 ) ( ON ?auto_190296 ?auto_190295 ) ( ON ?auto_190297 ?auto_190296 ) ( ON ?auto_190298 ?auto_190297 ) ( ON ?auto_190299 ?auto_190298 ) ( not ( = ?auto_190295 ?auto_190296 ) ) ( not ( = ?auto_190295 ?auto_190297 ) ) ( not ( = ?auto_190295 ?auto_190298 ) ) ( not ( = ?auto_190295 ?auto_190299 ) ) ( not ( = ?auto_190295 ?auto_190300 ) ) ( not ( = ?auto_190295 ?auto_190301 ) ) ( not ( = ?auto_190295 ?auto_190302 ) ) ( not ( = ?auto_190295 ?auto_190303 ) ) ( not ( = ?auto_190295 ?auto_190304 ) ) ( not ( = ?auto_190295 ?auto_190305 ) ) ( not ( = ?auto_190296 ?auto_190297 ) ) ( not ( = ?auto_190296 ?auto_190298 ) ) ( not ( = ?auto_190296 ?auto_190299 ) ) ( not ( = ?auto_190296 ?auto_190300 ) ) ( not ( = ?auto_190296 ?auto_190301 ) ) ( not ( = ?auto_190296 ?auto_190302 ) ) ( not ( = ?auto_190296 ?auto_190303 ) ) ( not ( = ?auto_190296 ?auto_190304 ) ) ( not ( = ?auto_190296 ?auto_190305 ) ) ( not ( = ?auto_190297 ?auto_190298 ) ) ( not ( = ?auto_190297 ?auto_190299 ) ) ( not ( = ?auto_190297 ?auto_190300 ) ) ( not ( = ?auto_190297 ?auto_190301 ) ) ( not ( = ?auto_190297 ?auto_190302 ) ) ( not ( = ?auto_190297 ?auto_190303 ) ) ( not ( = ?auto_190297 ?auto_190304 ) ) ( not ( = ?auto_190297 ?auto_190305 ) ) ( not ( = ?auto_190298 ?auto_190299 ) ) ( not ( = ?auto_190298 ?auto_190300 ) ) ( not ( = ?auto_190298 ?auto_190301 ) ) ( not ( = ?auto_190298 ?auto_190302 ) ) ( not ( = ?auto_190298 ?auto_190303 ) ) ( not ( = ?auto_190298 ?auto_190304 ) ) ( not ( = ?auto_190298 ?auto_190305 ) ) ( not ( = ?auto_190299 ?auto_190300 ) ) ( not ( = ?auto_190299 ?auto_190301 ) ) ( not ( = ?auto_190299 ?auto_190302 ) ) ( not ( = ?auto_190299 ?auto_190303 ) ) ( not ( = ?auto_190299 ?auto_190304 ) ) ( not ( = ?auto_190299 ?auto_190305 ) ) ( not ( = ?auto_190300 ?auto_190301 ) ) ( not ( = ?auto_190300 ?auto_190302 ) ) ( not ( = ?auto_190300 ?auto_190303 ) ) ( not ( = ?auto_190300 ?auto_190304 ) ) ( not ( = ?auto_190300 ?auto_190305 ) ) ( not ( = ?auto_190301 ?auto_190302 ) ) ( not ( = ?auto_190301 ?auto_190303 ) ) ( not ( = ?auto_190301 ?auto_190304 ) ) ( not ( = ?auto_190301 ?auto_190305 ) ) ( not ( = ?auto_190302 ?auto_190303 ) ) ( not ( = ?auto_190302 ?auto_190304 ) ) ( not ( = ?auto_190302 ?auto_190305 ) ) ( not ( = ?auto_190303 ?auto_190304 ) ) ( not ( = ?auto_190303 ?auto_190305 ) ) ( not ( = ?auto_190304 ?auto_190305 ) ) ( ON ?auto_190303 ?auto_190304 ) ( ON ?auto_190302 ?auto_190303 ) ( ON ?auto_190301 ?auto_190302 ) ( CLEAR ?auto_190299 ) ( ON ?auto_190300 ?auto_190301 ) ( CLEAR ?auto_190300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190295 ?auto_190296 ?auto_190297 ?auto_190298 ?auto_190299 ?auto_190300 )
      ( MAKE-10PILE ?auto_190295 ?auto_190296 ?auto_190297 ?auto_190298 ?auto_190299 ?auto_190300 ?auto_190301 ?auto_190302 ?auto_190303 ?auto_190304 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190316 - BLOCK
      ?auto_190317 - BLOCK
      ?auto_190318 - BLOCK
      ?auto_190319 - BLOCK
      ?auto_190320 - BLOCK
      ?auto_190321 - BLOCK
      ?auto_190322 - BLOCK
      ?auto_190323 - BLOCK
      ?auto_190324 - BLOCK
      ?auto_190325 - BLOCK
    )
    :vars
    (
      ?auto_190326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190325 ?auto_190326 ) ( ON-TABLE ?auto_190316 ) ( ON ?auto_190317 ?auto_190316 ) ( ON ?auto_190318 ?auto_190317 ) ( ON ?auto_190319 ?auto_190318 ) ( not ( = ?auto_190316 ?auto_190317 ) ) ( not ( = ?auto_190316 ?auto_190318 ) ) ( not ( = ?auto_190316 ?auto_190319 ) ) ( not ( = ?auto_190316 ?auto_190320 ) ) ( not ( = ?auto_190316 ?auto_190321 ) ) ( not ( = ?auto_190316 ?auto_190322 ) ) ( not ( = ?auto_190316 ?auto_190323 ) ) ( not ( = ?auto_190316 ?auto_190324 ) ) ( not ( = ?auto_190316 ?auto_190325 ) ) ( not ( = ?auto_190316 ?auto_190326 ) ) ( not ( = ?auto_190317 ?auto_190318 ) ) ( not ( = ?auto_190317 ?auto_190319 ) ) ( not ( = ?auto_190317 ?auto_190320 ) ) ( not ( = ?auto_190317 ?auto_190321 ) ) ( not ( = ?auto_190317 ?auto_190322 ) ) ( not ( = ?auto_190317 ?auto_190323 ) ) ( not ( = ?auto_190317 ?auto_190324 ) ) ( not ( = ?auto_190317 ?auto_190325 ) ) ( not ( = ?auto_190317 ?auto_190326 ) ) ( not ( = ?auto_190318 ?auto_190319 ) ) ( not ( = ?auto_190318 ?auto_190320 ) ) ( not ( = ?auto_190318 ?auto_190321 ) ) ( not ( = ?auto_190318 ?auto_190322 ) ) ( not ( = ?auto_190318 ?auto_190323 ) ) ( not ( = ?auto_190318 ?auto_190324 ) ) ( not ( = ?auto_190318 ?auto_190325 ) ) ( not ( = ?auto_190318 ?auto_190326 ) ) ( not ( = ?auto_190319 ?auto_190320 ) ) ( not ( = ?auto_190319 ?auto_190321 ) ) ( not ( = ?auto_190319 ?auto_190322 ) ) ( not ( = ?auto_190319 ?auto_190323 ) ) ( not ( = ?auto_190319 ?auto_190324 ) ) ( not ( = ?auto_190319 ?auto_190325 ) ) ( not ( = ?auto_190319 ?auto_190326 ) ) ( not ( = ?auto_190320 ?auto_190321 ) ) ( not ( = ?auto_190320 ?auto_190322 ) ) ( not ( = ?auto_190320 ?auto_190323 ) ) ( not ( = ?auto_190320 ?auto_190324 ) ) ( not ( = ?auto_190320 ?auto_190325 ) ) ( not ( = ?auto_190320 ?auto_190326 ) ) ( not ( = ?auto_190321 ?auto_190322 ) ) ( not ( = ?auto_190321 ?auto_190323 ) ) ( not ( = ?auto_190321 ?auto_190324 ) ) ( not ( = ?auto_190321 ?auto_190325 ) ) ( not ( = ?auto_190321 ?auto_190326 ) ) ( not ( = ?auto_190322 ?auto_190323 ) ) ( not ( = ?auto_190322 ?auto_190324 ) ) ( not ( = ?auto_190322 ?auto_190325 ) ) ( not ( = ?auto_190322 ?auto_190326 ) ) ( not ( = ?auto_190323 ?auto_190324 ) ) ( not ( = ?auto_190323 ?auto_190325 ) ) ( not ( = ?auto_190323 ?auto_190326 ) ) ( not ( = ?auto_190324 ?auto_190325 ) ) ( not ( = ?auto_190324 ?auto_190326 ) ) ( not ( = ?auto_190325 ?auto_190326 ) ) ( ON ?auto_190324 ?auto_190325 ) ( ON ?auto_190323 ?auto_190324 ) ( ON ?auto_190322 ?auto_190323 ) ( ON ?auto_190321 ?auto_190322 ) ( CLEAR ?auto_190319 ) ( ON ?auto_190320 ?auto_190321 ) ( CLEAR ?auto_190320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190316 ?auto_190317 ?auto_190318 ?auto_190319 ?auto_190320 )
      ( MAKE-10PILE ?auto_190316 ?auto_190317 ?auto_190318 ?auto_190319 ?auto_190320 ?auto_190321 ?auto_190322 ?auto_190323 ?auto_190324 ?auto_190325 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190337 - BLOCK
      ?auto_190338 - BLOCK
      ?auto_190339 - BLOCK
      ?auto_190340 - BLOCK
      ?auto_190341 - BLOCK
      ?auto_190342 - BLOCK
      ?auto_190343 - BLOCK
      ?auto_190344 - BLOCK
      ?auto_190345 - BLOCK
      ?auto_190346 - BLOCK
    )
    :vars
    (
      ?auto_190347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190346 ?auto_190347 ) ( ON-TABLE ?auto_190337 ) ( ON ?auto_190338 ?auto_190337 ) ( ON ?auto_190339 ?auto_190338 ) ( ON ?auto_190340 ?auto_190339 ) ( not ( = ?auto_190337 ?auto_190338 ) ) ( not ( = ?auto_190337 ?auto_190339 ) ) ( not ( = ?auto_190337 ?auto_190340 ) ) ( not ( = ?auto_190337 ?auto_190341 ) ) ( not ( = ?auto_190337 ?auto_190342 ) ) ( not ( = ?auto_190337 ?auto_190343 ) ) ( not ( = ?auto_190337 ?auto_190344 ) ) ( not ( = ?auto_190337 ?auto_190345 ) ) ( not ( = ?auto_190337 ?auto_190346 ) ) ( not ( = ?auto_190337 ?auto_190347 ) ) ( not ( = ?auto_190338 ?auto_190339 ) ) ( not ( = ?auto_190338 ?auto_190340 ) ) ( not ( = ?auto_190338 ?auto_190341 ) ) ( not ( = ?auto_190338 ?auto_190342 ) ) ( not ( = ?auto_190338 ?auto_190343 ) ) ( not ( = ?auto_190338 ?auto_190344 ) ) ( not ( = ?auto_190338 ?auto_190345 ) ) ( not ( = ?auto_190338 ?auto_190346 ) ) ( not ( = ?auto_190338 ?auto_190347 ) ) ( not ( = ?auto_190339 ?auto_190340 ) ) ( not ( = ?auto_190339 ?auto_190341 ) ) ( not ( = ?auto_190339 ?auto_190342 ) ) ( not ( = ?auto_190339 ?auto_190343 ) ) ( not ( = ?auto_190339 ?auto_190344 ) ) ( not ( = ?auto_190339 ?auto_190345 ) ) ( not ( = ?auto_190339 ?auto_190346 ) ) ( not ( = ?auto_190339 ?auto_190347 ) ) ( not ( = ?auto_190340 ?auto_190341 ) ) ( not ( = ?auto_190340 ?auto_190342 ) ) ( not ( = ?auto_190340 ?auto_190343 ) ) ( not ( = ?auto_190340 ?auto_190344 ) ) ( not ( = ?auto_190340 ?auto_190345 ) ) ( not ( = ?auto_190340 ?auto_190346 ) ) ( not ( = ?auto_190340 ?auto_190347 ) ) ( not ( = ?auto_190341 ?auto_190342 ) ) ( not ( = ?auto_190341 ?auto_190343 ) ) ( not ( = ?auto_190341 ?auto_190344 ) ) ( not ( = ?auto_190341 ?auto_190345 ) ) ( not ( = ?auto_190341 ?auto_190346 ) ) ( not ( = ?auto_190341 ?auto_190347 ) ) ( not ( = ?auto_190342 ?auto_190343 ) ) ( not ( = ?auto_190342 ?auto_190344 ) ) ( not ( = ?auto_190342 ?auto_190345 ) ) ( not ( = ?auto_190342 ?auto_190346 ) ) ( not ( = ?auto_190342 ?auto_190347 ) ) ( not ( = ?auto_190343 ?auto_190344 ) ) ( not ( = ?auto_190343 ?auto_190345 ) ) ( not ( = ?auto_190343 ?auto_190346 ) ) ( not ( = ?auto_190343 ?auto_190347 ) ) ( not ( = ?auto_190344 ?auto_190345 ) ) ( not ( = ?auto_190344 ?auto_190346 ) ) ( not ( = ?auto_190344 ?auto_190347 ) ) ( not ( = ?auto_190345 ?auto_190346 ) ) ( not ( = ?auto_190345 ?auto_190347 ) ) ( not ( = ?auto_190346 ?auto_190347 ) ) ( ON ?auto_190345 ?auto_190346 ) ( ON ?auto_190344 ?auto_190345 ) ( ON ?auto_190343 ?auto_190344 ) ( ON ?auto_190342 ?auto_190343 ) ( CLEAR ?auto_190340 ) ( ON ?auto_190341 ?auto_190342 ) ( CLEAR ?auto_190341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190337 ?auto_190338 ?auto_190339 ?auto_190340 ?auto_190341 )
      ( MAKE-10PILE ?auto_190337 ?auto_190338 ?auto_190339 ?auto_190340 ?auto_190341 ?auto_190342 ?auto_190343 ?auto_190344 ?auto_190345 ?auto_190346 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190358 - BLOCK
      ?auto_190359 - BLOCK
      ?auto_190360 - BLOCK
      ?auto_190361 - BLOCK
      ?auto_190362 - BLOCK
      ?auto_190363 - BLOCK
      ?auto_190364 - BLOCK
      ?auto_190365 - BLOCK
      ?auto_190366 - BLOCK
      ?auto_190367 - BLOCK
    )
    :vars
    (
      ?auto_190368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190367 ?auto_190368 ) ( ON-TABLE ?auto_190358 ) ( ON ?auto_190359 ?auto_190358 ) ( ON ?auto_190360 ?auto_190359 ) ( not ( = ?auto_190358 ?auto_190359 ) ) ( not ( = ?auto_190358 ?auto_190360 ) ) ( not ( = ?auto_190358 ?auto_190361 ) ) ( not ( = ?auto_190358 ?auto_190362 ) ) ( not ( = ?auto_190358 ?auto_190363 ) ) ( not ( = ?auto_190358 ?auto_190364 ) ) ( not ( = ?auto_190358 ?auto_190365 ) ) ( not ( = ?auto_190358 ?auto_190366 ) ) ( not ( = ?auto_190358 ?auto_190367 ) ) ( not ( = ?auto_190358 ?auto_190368 ) ) ( not ( = ?auto_190359 ?auto_190360 ) ) ( not ( = ?auto_190359 ?auto_190361 ) ) ( not ( = ?auto_190359 ?auto_190362 ) ) ( not ( = ?auto_190359 ?auto_190363 ) ) ( not ( = ?auto_190359 ?auto_190364 ) ) ( not ( = ?auto_190359 ?auto_190365 ) ) ( not ( = ?auto_190359 ?auto_190366 ) ) ( not ( = ?auto_190359 ?auto_190367 ) ) ( not ( = ?auto_190359 ?auto_190368 ) ) ( not ( = ?auto_190360 ?auto_190361 ) ) ( not ( = ?auto_190360 ?auto_190362 ) ) ( not ( = ?auto_190360 ?auto_190363 ) ) ( not ( = ?auto_190360 ?auto_190364 ) ) ( not ( = ?auto_190360 ?auto_190365 ) ) ( not ( = ?auto_190360 ?auto_190366 ) ) ( not ( = ?auto_190360 ?auto_190367 ) ) ( not ( = ?auto_190360 ?auto_190368 ) ) ( not ( = ?auto_190361 ?auto_190362 ) ) ( not ( = ?auto_190361 ?auto_190363 ) ) ( not ( = ?auto_190361 ?auto_190364 ) ) ( not ( = ?auto_190361 ?auto_190365 ) ) ( not ( = ?auto_190361 ?auto_190366 ) ) ( not ( = ?auto_190361 ?auto_190367 ) ) ( not ( = ?auto_190361 ?auto_190368 ) ) ( not ( = ?auto_190362 ?auto_190363 ) ) ( not ( = ?auto_190362 ?auto_190364 ) ) ( not ( = ?auto_190362 ?auto_190365 ) ) ( not ( = ?auto_190362 ?auto_190366 ) ) ( not ( = ?auto_190362 ?auto_190367 ) ) ( not ( = ?auto_190362 ?auto_190368 ) ) ( not ( = ?auto_190363 ?auto_190364 ) ) ( not ( = ?auto_190363 ?auto_190365 ) ) ( not ( = ?auto_190363 ?auto_190366 ) ) ( not ( = ?auto_190363 ?auto_190367 ) ) ( not ( = ?auto_190363 ?auto_190368 ) ) ( not ( = ?auto_190364 ?auto_190365 ) ) ( not ( = ?auto_190364 ?auto_190366 ) ) ( not ( = ?auto_190364 ?auto_190367 ) ) ( not ( = ?auto_190364 ?auto_190368 ) ) ( not ( = ?auto_190365 ?auto_190366 ) ) ( not ( = ?auto_190365 ?auto_190367 ) ) ( not ( = ?auto_190365 ?auto_190368 ) ) ( not ( = ?auto_190366 ?auto_190367 ) ) ( not ( = ?auto_190366 ?auto_190368 ) ) ( not ( = ?auto_190367 ?auto_190368 ) ) ( ON ?auto_190366 ?auto_190367 ) ( ON ?auto_190365 ?auto_190366 ) ( ON ?auto_190364 ?auto_190365 ) ( ON ?auto_190363 ?auto_190364 ) ( ON ?auto_190362 ?auto_190363 ) ( CLEAR ?auto_190360 ) ( ON ?auto_190361 ?auto_190362 ) ( CLEAR ?auto_190361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190358 ?auto_190359 ?auto_190360 ?auto_190361 )
      ( MAKE-10PILE ?auto_190358 ?auto_190359 ?auto_190360 ?auto_190361 ?auto_190362 ?auto_190363 ?auto_190364 ?auto_190365 ?auto_190366 ?auto_190367 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190379 - BLOCK
      ?auto_190380 - BLOCK
      ?auto_190381 - BLOCK
      ?auto_190382 - BLOCK
      ?auto_190383 - BLOCK
      ?auto_190384 - BLOCK
      ?auto_190385 - BLOCK
      ?auto_190386 - BLOCK
      ?auto_190387 - BLOCK
      ?auto_190388 - BLOCK
    )
    :vars
    (
      ?auto_190389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190388 ?auto_190389 ) ( ON-TABLE ?auto_190379 ) ( ON ?auto_190380 ?auto_190379 ) ( ON ?auto_190381 ?auto_190380 ) ( not ( = ?auto_190379 ?auto_190380 ) ) ( not ( = ?auto_190379 ?auto_190381 ) ) ( not ( = ?auto_190379 ?auto_190382 ) ) ( not ( = ?auto_190379 ?auto_190383 ) ) ( not ( = ?auto_190379 ?auto_190384 ) ) ( not ( = ?auto_190379 ?auto_190385 ) ) ( not ( = ?auto_190379 ?auto_190386 ) ) ( not ( = ?auto_190379 ?auto_190387 ) ) ( not ( = ?auto_190379 ?auto_190388 ) ) ( not ( = ?auto_190379 ?auto_190389 ) ) ( not ( = ?auto_190380 ?auto_190381 ) ) ( not ( = ?auto_190380 ?auto_190382 ) ) ( not ( = ?auto_190380 ?auto_190383 ) ) ( not ( = ?auto_190380 ?auto_190384 ) ) ( not ( = ?auto_190380 ?auto_190385 ) ) ( not ( = ?auto_190380 ?auto_190386 ) ) ( not ( = ?auto_190380 ?auto_190387 ) ) ( not ( = ?auto_190380 ?auto_190388 ) ) ( not ( = ?auto_190380 ?auto_190389 ) ) ( not ( = ?auto_190381 ?auto_190382 ) ) ( not ( = ?auto_190381 ?auto_190383 ) ) ( not ( = ?auto_190381 ?auto_190384 ) ) ( not ( = ?auto_190381 ?auto_190385 ) ) ( not ( = ?auto_190381 ?auto_190386 ) ) ( not ( = ?auto_190381 ?auto_190387 ) ) ( not ( = ?auto_190381 ?auto_190388 ) ) ( not ( = ?auto_190381 ?auto_190389 ) ) ( not ( = ?auto_190382 ?auto_190383 ) ) ( not ( = ?auto_190382 ?auto_190384 ) ) ( not ( = ?auto_190382 ?auto_190385 ) ) ( not ( = ?auto_190382 ?auto_190386 ) ) ( not ( = ?auto_190382 ?auto_190387 ) ) ( not ( = ?auto_190382 ?auto_190388 ) ) ( not ( = ?auto_190382 ?auto_190389 ) ) ( not ( = ?auto_190383 ?auto_190384 ) ) ( not ( = ?auto_190383 ?auto_190385 ) ) ( not ( = ?auto_190383 ?auto_190386 ) ) ( not ( = ?auto_190383 ?auto_190387 ) ) ( not ( = ?auto_190383 ?auto_190388 ) ) ( not ( = ?auto_190383 ?auto_190389 ) ) ( not ( = ?auto_190384 ?auto_190385 ) ) ( not ( = ?auto_190384 ?auto_190386 ) ) ( not ( = ?auto_190384 ?auto_190387 ) ) ( not ( = ?auto_190384 ?auto_190388 ) ) ( not ( = ?auto_190384 ?auto_190389 ) ) ( not ( = ?auto_190385 ?auto_190386 ) ) ( not ( = ?auto_190385 ?auto_190387 ) ) ( not ( = ?auto_190385 ?auto_190388 ) ) ( not ( = ?auto_190385 ?auto_190389 ) ) ( not ( = ?auto_190386 ?auto_190387 ) ) ( not ( = ?auto_190386 ?auto_190388 ) ) ( not ( = ?auto_190386 ?auto_190389 ) ) ( not ( = ?auto_190387 ?auto_190388 ) ) ( not ( = ?auto_190387 ?auto_190389 ) ) ( not ( = ?auto_190388 ?auto_190389 ) ) ( ON ?auto_190387 ?auto_190388 ) ( ON ?auto_190386 ?auto_190387 ) ( ON ?auto_190385 ?auto_190386 ) ( ON ?auto_190384 ?auto_190385 ) ( ON ?auto_190383 ?auto_190384 ) ( CLEAR ?auto_190381 ) ( ON ?auto_190382 ?auto_190383 ) ( CLEAR ?auto_190382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190379 ?auto_190380 ?auto_190381 ?auto_190382 )
      ( MAKE-10PILE ?auto_190379 ?auto_190380 ?auto_190381 ?auto_190382 ?auto_190383 ?auto_190384 ?auto_190385 ?auto_190386 ?auto_190387 ?auto_190388 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190400 - BLOCK
      ?auto_190401 - BLOCK
      ?auto_190402 - BLOCK
      ?auto_190403 - BLOCK
      ?auto_190404 - BLOCK
      ?auto_190405 - BLOCK
      ?auto_190406 - BLOCK
      ?auto_190407 - BLOCK
      ?auto_190408 - BLOCK
      ?auto_190409 - BLOCK
    )
    :vars
    (
      ?auto_190410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190409 ?auto_190410 ) ( ON-TABLE ?auto_190400 ) ( ON ?auto_190401 ?auto_190400 ) ( not ( = ?auto_190400 ?auto_190401 ) ) ( not ( = ?auto_190400 ?auto_190402 ) ) ( not ( = ?auto_190400 ?auto_190403 ) ) ( not ( = ?auto_190400 ?auto_190404 ) ) ( not ( = ?auto_190400 ?auto_190405 ) ) ( not ( = ?auto_190400 ?auto_190406 ) ) ( not ( = ?auto_190400 ?auto_190407 ) ) ( not ( = ?auto_190400 ?auto_190408 ) ) ( not ( = ?auto_190400 ?auto_190409 ) ) ( not ( = ?auto_190400 ?auto_190410 ) ) ( not ( = ?auto_190401 ?auto_190402 ) ) ( not ( = ?auto_190401 ?auto_190403 ) ) ( not ( = ?auto_190401 ?auto_190404 ) ) ( not ( = ?auto_190401 ?auto_190405 ) ) ( not ( = ?auto_190401 ?auto_190406 ) ) ( not ( = ?auto_190401 ?auto_190407 ) ) ( not ( = ?auto_190401 ?auto_190408 ) ) ( not ( = ?auto_190401 ?auto_190409 ) ) ( not ( = ?auto_190401 ?auto_190410 ) ) ( not ( = ?auto_190402 ?auto_190403 ) ) ( not ( = ?auto_190402 ?auto_190404 ) ) ( not ( = ?auto_190402 ?auto_190405 ) ) ( not ( = ?auto_190402 ?auto_190406 ) ) ( not ( = ?auto_190402 ?auto_190407 ) ) ( not ( = ?auto_190402 ?auto_190408 ) ) ( not ( = ?auto_190402 ?auto_190409 ) ) ( not ( = ?auto_190402 ?auto_190410 ) ) ( not ( = ?auto_190403 ?auto_190404 ) ) ( not ( = ?auto_190403 ?auto_190405 ) ) ( not ( = ?auto_190403 ?auto_190406 ) ) ( not ( = ?auto_190403 ?auto_190407 ) ) ( not ( = ?auto_190403 ?auto_190408 ) ) ( not ( = ?auto_190403 ?auto_190409 ) ) ( not ( = ?auto_190403 ?auto_190410 ) ) ( not ( = ?auto_190404 ?auto_190405 ) ) ( not ( = ?auto_190404 ?auto_190406 ) ) ( not ( = ?auto_190404 ?auto_190407 ) ) ( not ( = ?auto_190404 ?auto_190408 ) ) ( not ( = ?auto_190404 ?auto_190409 ) ) ( not ( = ?auto_190404 ?auto_190410 ) ) ( not ( = ?auto_190405 ?auto_190406 ) ) ( not ( = ?auto_190405 ?auto_190407 ) ) ( not ( = ?auto_190405 ?auto_190408 ) ) ( not ( = ?auto_190405 ?auto_190409 ) ) ( not ( = ?auto_190405 ?auto_190410 ) ) ( not ( = ?auto_190406 ?auto_190407 ) ) ( not ( = ?auto_190406 ?auto_190408 ) ) ( not ( = ?auto_190406 ?auto_190409 ) ) ( not ( = ?auto_190406 ?auto_190410 ) ) ( not ( = ?auto_190407 ?auto_190408 ) ) ( not ( = ?auto_190407 ?auto_190409 ) ) ( not ( = ?auto_190407 ?auto_190410 ) ) ( not ( = ?auto_190408 ?auto_190409 ) ) ( not ( = ?auto_190408 ?auto_190410 ) ) ( not ( = ?auto_190409 ?auto_190410 ) ) ( ON ?auto_190408 ?auto_190409 ) ( ON ?auto_190407 ?auto_190408 ) ( ON ?auto_190406 ?auto_190407 ) ( ON ?auto_190405 ?auto_190406 ) ( ON ?auto_190404 ?auto_190405 ) ( ON ?auto_190403 ?auto_190404 ) ( CLEAR ?auto_190401 ) ( ON ?auto_190402 ?auto_190403 ) ( CLEAR ?auto_190402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190400 ?auto_190401 ?auto_190402 )
      ( MAKE-10PILE ?auto_190400 ?auto_190401 ?auto_190402 ?auto_190403 ?auto_190404 ?auto_190405 ?auto_190406 ?auto_190407 ?auto_190408 ?auto_190409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190421 - BLOCK
      ?auto_190422 - BLOCK
      ?auto_190423 - BLOCK
      ?auto_190424 - BLOCK
      ?auto_190425 - BLOCK
      ?auto_190426 - BLOCK
      ?auto_190427 - BLOCK
      ?auto_190428 - BLOCK
      ?auto_190429 - BLOCK
      ?auto_190430 - BLOCK
    )
    :vars
    (
      ?auto_190431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190430 ?auto_190431 ) ( ON-TABLE ?auto_190421 ) ( ON ?auto_190422 ?auto_190421 ) ( not ( = ?auto_190421 ?auto_190422 ) ) ( not ( = ?auto_190421 ?auto_190423 ) ) ( not ( = ?auto_190421 ?auto_190424 ) ) ( not ( = ?auto_190421 ?auto_190425 ) ) ( not ( = ?auto_190421 ?auto_190426 ) ) ( not ( = ?auto_190421 ?auto_190427 ) ) ( not ( = ?auto_190421 ?auto_190428 ) ) ( not ( = ?auto_190421 ?auto_190429 ) ) ( not ( = ?auto_190421 ?auto_190430 ) ) ( not ( = ?auto_190421 ?auto_190431 ) ) ( not ( = ?auto_190422 ?auto_190423 ) ) ( not ( = ?auto_190422 ?auto_190424 ) ) ( not ( = ?auto_190422 ?auto_190425 ) ) ( not ( = ?auto_190422 ?auto_190426 ) ) ( not ( = ?auto_190422 ?auto_190427 ) ) ( not ( = ?auto_190422 ?auto_190428 ) ) ( not ( = ?auto_190422 ?auto_190429 ) ) ( not ( = ?auto_190422 ?auto_190430 ) ) ( not ( = ?auto_190422 ?auto_190431 ) ) ( not ( = ?auto_190423 ?auto_190424 ) ) ( not ( = ?auto_190423 ?auto_190425 ) ) ( not ( = ?auto_190423 ?auto_190426 ) ) ( not ( = ?auto_190423 ?auto_190427 ) ) ( not ( = ?auto_190423 ?auto_190428 ) ) ( not ( = ?auto_190423 ?auto_190429 ) ) ( not ( = ?auto_190423 ?auto_190430 ) ) ( not ( = ?auto_190423 ?auto_190431 ) ) ( not ( = ?auto_190424 ?auto_190425 ) ) ( not ( = ?auto_190424 ?auto_190426 ) ) ( not ( = ?auto_190424 ?auto_190427 ) ) ( not ( = ?auto_190424 ?auto_190428 ) ) ( not ( = ?auto_190424 ?auto_190429 ) ) ( not ( = ?auto_190424 ?auto_190430 ) ) ( not ( = ?auto_190424 ?auto_190431 ) ) ( not ( = ?auto_190425 ?auto_190426 ) ) ( not ( = ?auto_190425 ?auto_190427 ) ) ( not ( = ?auto_190425 ?auto_190428 ) ) ( not ( = ?auto_190425 ?auto_190429 ) ) ( not ( = ?auto_190425 ?auto_190430 ) ) ( not ( = ?auto_190425 ?auto_190431 ) ) ( not ( = ?auto_190426 ?auto_190427 ) ) ( not ( = ?auto_190426 ?auto_190428 ) ) ( not ( = ?auto_190426 ?auto_190429 ) ) ( not ( = ?auto_190426 ?auto_190430 ) ) ( not ( = ?auto_190426 ?auto_190431 ) ) ( not ( = ?auto_190427 ?auto_190428 ) ) ( not ( = ?auto_190427 ?auto_190429 ) ) ( not ( = ?auto_190427 ?auto_190430 ) ) ( not ( = ?auto_190427 ?auto_190431 ) ) ( not ( = ?auto_190428 ?auto_190429 ) ) ( not ( = ?auto_190428 ?auto_190430 ) ) ( not ( = ?auto_190428 ?auto_190431 ) ) ( not ( = ?auto_190429 ?auto_190430 ) ) ( not ( = ?auto_190429 ?auto_190431 ) ) ( not ( = ?auto_190430 ?auto_190431 ) ) ( ON ?auto_190429 ?auto_190430 ) ( ON ?auto_190428 ?auto_190429 ) ( ON ?auto_190427 ?auto_190428 ) ( ON ?auto_190426 ?auto_190427 ) ( ON ?auto_190425 ?auto_190426 ) ( ON ?auto_190424 ?auto_190425 ) ( CLEAR ?auto_190422 ) ( ON ?auto_190423 ?auto_190424 ) ( CLEAR ?auto_190423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190421 ?auto_190422 ?auto_190423 )
      ( MAKE-10PILE ?auto_190421 ?auto_190422 ?auto_190423 ?auto_190424 ?auto_190425 ?auto_190426 ?auto_190427 ?auto_190428 ?auto_190429 ?auto_190430 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190442 - BLOCK
      ?auto_190443 - BLOCK
      ?auto_190444 - BLOCK
      ?auto_190445 - BLOCK
      ?auto_190446 - BLOCK
      ?auto_190447 - BLOCK
      ?auto_190448 - BLOCK
      ?auto_190449 - BLOCK
      ?auto_190450 - BLOCK
      ?auto_190451 - BLOCK
    )
    :vars
    (
      ?auto_190452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190451 ?auto_190452 ) ( ON-TABLE ?auto_190442 ) ( not ( = ?auto_190442 ?auto_190443 ) ) ( not ( = ?auto_190442 ?auto_190444 ) ) ( not ( = ?auto_190442 ?auto_190445 ) ) ( not ( = ?auto_190442 ?auto_190446 ) ) ( not ( = ?auto_190442 ?auto_190447 ) ) ( not ( = ?auto_190442 ?auto_190448 ) ) ( not ( = ?auto_190442 ?auto_190449 ) ) ( not ( = ?auto_190442 ?auto_190450 ) ) ( not ( = ?auto_190442 ?auto_190451 ) ) ( not ( = ?auto_190442 ?auto_190452 ) ) ( not ( = ?auto_190443 ?auto_190444 ) ) ( not ( = ?auto_190443 ?auto_190445 ) ) ( not ( = ?auto_190443 ?auto_190446 ) ) ( not ( = ?auto_190443 ?auto_190447 ) ) ( not ( = ?auto_190443 ?auto_190448 ) ) ( not ( = ?auto_190443 ?auto_190449 ) ) ( not ( = ?auto_190443 ?auto_190450 ) ) ( not ( = ?auto_190443 ?auto_190451 ) ) ( not ( = ?auto_190443 ?auto_190452 ) ) ( not ( = ?auto_190444 ?auto_190445 ) ) ( not ( = ?auto_190444 ?auto_190446 ) ) ( not ( = ?auto_190444 ?auto_190447 ) ) ( not ( = ?auto_190444 ?auto_190448 ) ) ( not ( = ?auto_190444 ?auto_190449 ) ) ( not ( = ?auto_190444 ?auto_190450 ) ) ( not ( = ?auto_190444 ?auto_190451 ) ) ( not ( = ?auto_190444 ?auto_190452 ) ) ( not ( = ?auto_190445 ?auto_190446 ) ) ( not ( = ?auto_190445 ?auto_190447 ) ) ( not ( = ?auto_190445 ?auto_190448 ) ) ( not ( = ?auto_190445 ?auto_190449 ) ) ( not ( = ?auto_190445 ?auto_190450 ) ) ( not ( = ?auto_190445 ?auto_190451 ) ) ( not ( = ?auto_190445 ?auto_190452 ) ) ( not ( = ?auto_190446 ?auto_190447 ) ) ( not ( = ?auto_190446 ?auto_190448 ) ) ( not ( = ?auto_190446 ?auto_190449 ) ) ( not ( = ?auto_190446 ?auto_190450 ) ) ( not ( = ?auto_190446 ?auto_190451 ) ) ( not ( = ?auto_190446 ?auto_190452 ) ) ( not ( = ?auto_190447 ?auto_190448 ) ) ( not ( = ?auto_190447 ?auto_190449 ) ) ( not ( = ?auto_190447 ?auto_190450 ) ) ( not ( = ?auto_190447 ?auto_190451 ) ) ( not ( = ?auto_190447 ?auto_190452 ) ) ( not ( = ?auto_190448 ?auto_190449 ) ) ( not ( = ?auto_190448 ?auto_190450 ) ) ( not ( = ?auto_190448 ?auto_190451 ) ) ( not ( = ?auto_190448 ?auto_190452 ) ) ( not ( = ?auto_190449 ?auto_190450 ) ) ( not ( = ?auto_190449 ?auto_190451 ) ) ( not ( = ?auto_190449 ?auto_190452 ) ) ( not ( = ?auto_190450 ?auto_190451 ) ) ( not ( = ?auto_190450 ?auto_190452 ) ) ( not ( = ?auto_190451 ?auto_190452 ) ) ( ON ?auto_190450 ?auto_190451 ) ( ON ?auto_190449 ?auto_190450 ) ( ON ?auto_190448 ?auto_190449 ) ( ON ?auto_190447 ?auto_190448 ) ( ON ?auto_190446 ?auto_190447 ) ( ON ?auto_190445 ?auto_190446 ) ( ON ?auto_190444 ?auto_190445 ) ( CLEAR ?auto_190442 ) ( ON ?auto_190443 ?auto_190444 ) ( CLEAR ?auto_190443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190442 ?auto_190443 )
      ( MAKE-10PILE ?auto_190442 ?auto_190443 ?auto_190444 ?auto_190445 ?auto_190446 ?auto_190447 ?auto_190448 ?auto_190449 ?auto_190450 ?auto_190451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190463 - BLOCK
      ?auto_190464 - BLOCK
      ?auto_190465 - BLOCK
      ?auto_190466 - BLOCK
      ?auto_190467 - BLOCK
      ?auto_190468 - BLOCK
      ?auto_190469 - BLOCK
      ?auto_190470 - BLOCK
      ?auto_190471 - BLOCK
      ?auto_190472 - BLOCK
    )
    :vars
    (
      ?auto_190473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190472 ?auto_190473 ) ( ON-TABLE ?auto_190463 ) ( not ( = ?auto_190463 ?auto_190464 ) ) ( not ( = ?auto_190463 ?auto_190465 ) ) ( not ( = ?auto_190463 ?auto_190466 ) ) ( not ( = ?auto_190463 ?auto_190467 ) ) ( not ( = ?auto_190463 ?auto_190468 ) ) ( not ( = ?auto_190463 ?auto_190469 ) ) ( not ( = ?auto_190463 ?auto_190470 ) ) ( not ( = ?auto_190463 ?auto_190471 ) ) ( not ( = ?auto_190463 ?auto_190472 ) ) ( not ( = ?auto_190463 ?auto_190473 ) ) ( not ( = ?auto_190464 ?auto_190465 ) ) ( not ( = ?auto_190464 ?auto_190466 ) ) ( not ( = ?auto_190464 ?auto_190467 ) ) ( not ( = ?auto_190464 ?auto_190468 ) ) ( not ( = ?auto_190464 ?auto_190469 ) ) ( not ( = ?auto_190464 ?auto_190470 ) ) ( not ( = ?auto_190464 ?auto_190471 ) ) ( not ( = ?auto_190464 ?auto_190472 ) ) ( not ( = ?auto_190464 ?auto_190473 ) ) ( not ( = ?auto_190465 ?auto_190466 ) ) ( not ( = ?auto_190465 ?auto_190467 ) ) ( not ( = ?auto_190465 ?auto_190468 ) ) ( not ( = ?auto_190465 ?auto_190469 ) ) ( not ( = ?auto_190465 ?auto_190470 ) ) ( not ( = ?auto_190465 ?auto_190471 ) ) ( not ( = ?auto_190465 ?auto_190472 ) ) ( not ( = ?auto_190465 ?auto_190473 ) ) ( not ( = ?auto_190466 ?auto_190467 ) ) ( not ( = ?auto_190466 ?auto_190468 ) ) ( not ( = ?auto_190466 ?auto_190469 ) ) ( not ( = ?auto_190466 ?auto_190470 ) ) ( not ( = ?auto_190466 ?auto_190471 ) ) ( not ( = ?auto_190466 ?auto_190472 ) ) ( not ( = ?auto_190466 ?auto_190473 ) ) ( not ( = ?auto_190467 ?auto_190468 ) ) ( not ( = ?auto_190467 ?auto_190469 ) ) ( not ( = ?auto_190467 ?auto_190470 ) ) ( not ( = ?auto_190467 ?auto_190471 ) ) ( not ( = ?auto_190467 ?auto_190472 ) ) ( not ( = ?auto_190467 ?auto_190473 ) ) ( not ( = ?auto_190468 ?auto_190469 ) ) ( not ( = ?auto_190468 ?auto_190470 ) ) ( not ( = ?auto_190468 ?auto_190471 ) ) ( not ( = ?auto_190468 ?auto_190472 ) ) ( not ( = ?auto_190468 ?auto_190473 ) ) ( not ( = ?auto_190469 ?auto_190470 ) ) ( not ( = ?auto_190469 ?auto_190471 ) ) ( not ( = ?auto_190469 ?auto_190472 ) ) ( not ( = ?auto_190469 ?auto_190473 ) ) ( not ( = ?auto_190470 ?auto_190471 ) ) ( not ( = ?auto_190470 ?auto_190472 ) ) ( not ( = ?auto_190470 ?auto_190473 ) ) ( not ( = ?auto_190471 ?auto_190472 ) ) ( not ( = ?auto_190471 ?auto_190473 ) ) ( not ( = ?auto_190472 ?auto_190473 ) ) ( ON ?auto_190471 ?auto_190472 ) ( ON ?auto_190470 ?auto_190471 ) ( ON ?auto_190469 ?auto_190470 ) ( ON ?auto_190468 ?auto_190469 ) ( ON ?auto_190467 ?auto_190468 ) ( ON ?auto_190466 ?auto_190467 ) ( ON ?auto_190465 ?auto_190466 ) ( CLEAR ?auto_190463 ) ( ON ?auto_190464 ?auto_190465 ) ( CLEAR ?auto_190464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190463 ?auto_190464 )
      ( MAKE-10PILE ?auto_190463 ?auto_190464 ?auto_190465 ?auto_190466 ?auto_190467 ?auto_190468 ?auto_190469 ?auto_190470 ?auto_190471 ?auto_190472 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190484 - BLOCK
      ?auto_190485 - BLOCK
      ?auto_190486 - BLOCK
      ?auto_190487 - BLOCK
      ?auto_190488 - BLOCK
      ?auto_190489 - BLOCK
      ?auto_190490 - BLOCK
      ?auto_190491 - BLOCK
      ?auto_190492 - BLOCK
      ?auto_190493 - BLOCK
    )
    :vars
    (
      ?auto_190494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190493 ?auto_190494 ) ( not ( = ?auto_190484 ?auto_190485 ) ) ( not ( = ?auto_190484 ?auto_190486 ) ) ( not ( = ?auto_190484 ?auto_190487 ) ) ( not ( = ?auto_190484 ?auto_190488 ) ) ( not ( = ?auto_190484 ?auto_190489 ) ) ( not ( = ?auto_190484 ?auto_190490 ) ) ( not ( = ?auto_190484 ?auto_190491 ) ) ( not ( = ?auto_190484 ?auto_190492 ) ) ( not ( = ?auto_190484 ?auto_190493 ) ) ( not ( = ?auto_190484 ?auto_190494 ) ) ( not ( = ?auto_190485 ?auto_190486 ) ) ( not ( = ?auto_190485 ?auto_190487 ) ) ( not ( = ?auto_190485 ?auto_190488 ) ) ( not ( = ?auto_190485 ?auto_190489 ) ) ( not ( = ?auto_190485 ?auto_190490 ) ) ( not ( = ?auto_190485 ?auto_190491 ) ) ( not ( = ?auto_190485 ?auto_190492 ) ) ( not ( = ?auto_190485 ?auto_190493 ) ) ( not ( = ?auto_190485 ?auto_190494 ) ) ( not ( = ?auto_190486 ?auto_190487 ) ) ( not ( = ?auto_190486 ?auto_190488 ) ) ( not ( = ?auto_190486 ?auto_190489 ) ) ( not ( = ?auto_190486 ?auto_190490 ) ) ( not ( = ?auto_190486 ?auto_190491 ) ) ( not ( = ?auto_190486 ?auto_190492 ) ) ( not ( = ?auto_190486 ?auto_190493 ) ) ( not ( = ?auto_190486 ?auto_190494 ) ) ( not ( = ?auto_190487 ?auto_190488 ) ) ( not ( = ?auto_190487 ?auto_190489 ) ) ( not ( = ?auto_190487 ?auto_190490 ) ) ( not ( = ?auto_190487 ?auto_190491 ) ) ( not ( = ?auto_190487 ?auto_190492 ) ) ( not ( = ?auto_190487 ?auto_190493 ) ) ( not ( = ?auto_190487 ?auto_190494 ) ) ( not ( = ?auto_190488 ?auto_190489 ) ) ( not ( = ?auto_190488 ?auto_190490 ) ) ( not ( = ?auto_190488 ?auto_190491 ) ) ( not ( = ?auto_190488 ?auto_190492 ) ) ( not ( = ?auto_190488 ?auto_190493 ) ) ( not ( = ?auto_190488 ?auto_190494 ) ) ( not ( = ?auto_190489 ?auto_190490 ) ) ( not ( = ?auto_190489 ?auto_190491 ) ) ( not ( = ?auto_190489 ?auto_190492 ) ) ( not ( = ?auto_190489 ?auto_190493 ) ) ( not ( = ?auto_190489 ?auto_190494 ) ) ( not ( = ?auto_190490 ?auto_190491 ) ) ( not ( = ?auto_190490 ?auto_190492 ) ) ( not ( = ?auto_190490 ?auto_190493 ) ) ( not ( = ?auto_190490 ?auto_190494 ) ) ( not ( = ?auto_190491 ?auto_190492 ) ) ( not ( = ?auto_190491 ?auto_190493 ) ) ( not ( = ?auto_190491 ?auto_190494 ) ) ( not ( = ?auto_190492 ?auto_190493 ) ) ( not ( = ?auto_190492 ?auto_190494 ) ) ( not ( = ?auto_190493 ?auto_190494 ) ) ( ON ?auto_190492 ?auto_190493 ) ( ON ?auto_190491 ?auto_190492 ) ( ON ?auto_190490 ?auto_190491 ) ( ON ?auto_190489 ?auto_190490 ) ( ON ?auto_190488 ?auto_190489 ) ( ON ?auto_190487 ?auto_190488 ) ( ON ?auto_190486 ?auto_190487 ) ( ON ?auto_190485 ?auto_190486 ) ( ON ?auto_190484 ?auto_190485 ) ( CLEAR ?auto_190484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190484 )
      ( MAKE-10PILE ?auto_190484 ?auto_190485 ?auto_190486 ?auto_190487 ?auto_190488 ?auto_190489 ?auto_190490 ?auto_190491 ?auto_190492 ?auto_190493 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_190505 - BLOCK
      ?auto_190506 - BLOCK
      ?auto_190507 - BLOCK
      ?auto_190508 - BLOCK
      ?auto_190509 - BLOCK
      ?auto_190510 - BLOCK
      ?auto_190511 - BLOCK
      ?auto_190512 - BLOCK
      ?auto_190513 - BLOCK
      ?auto_190514 - BLOCK
    )
    :vars
    (
      ?auto_190515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190514 ?auto_190515 ) ( not ( = ?auto_190505 ?auto_190506 ) ) ( not ( = ?auto_190505 ?auto_190507 ) ) ( not ( = ?auto_190505 ?auto_190508 ) ) ( not ( = ?auto_190505 ?auto_190509 ) ) ( not ( = ?auto_190505 ?auto_190510 ) ) ( not ( = ?auto_190505 ?auto_190511 ) ) ( not ( = ?auto_190505 ?auto_190512 ) ) ( not ( = ?auto_190505 ?auto_190513 ) ) ( not ( = ?auto_190505 ?auto_190514 ) ) ( not ( = ?auto_190505 ?auto_190515 ) ) ( not ( = ?auto_190506 ?auto_190507 ) ) ( not ( = ?auto_190506 ?auto_190508 ) ) ( not ( = ?auto_190506 ?auto_190509 ) ) ( not ( = ?auto_190506 ?auto_190510 ) ) ( not ( = ?auto_190506 ?auto_190511 ) ) ( not ( = ?auto_190506 ?auto_190512 ) ) ( not ( = ?auto_190506 ?auto_190513 ) ) ( not ( = ?auto_190506 ?auto_190514 ) ) ( not ( = ?auto_190506 ?auto_190515 ) ) ( not ( = ?auto_190507 ?auto_190508 ) ) ( not ( = ?auto_190507 ?auto_190509 ) ) ( not ( = ?auto_190507 ?auto_190510 ) ) ( not ( = ?auto_190507 ?auto_190511 ) ) ( not ( = ?auto_190507 ?auto_190512 ) ) ( not ( = ?auto_190507 ?auto_190513 ) ) ( not ( = ?auto_190507 ?auto_190514 ) ) ( not ( = ?auto_190507 ?auto_190515 ) ) ( not ( = ?auto_190508 ?auto_190509 ) ) ( not ( = ?auto_190508 ?auto_190510 ) ) ( not ( = ?auto_190508 ?auto_190511 ) ) ( not ( = ?auto_190508 ?auto_190512 ) ) ( not ( = ?auto_190508 ?auto_190513 ) ) ( not ( = ?auto_190508 ?auto_190514 ) ) ( not ( = ?auto_190508 ?auto_190515 ) ) ( not ( = ?auto_190509 ?auto_190510 ) ) ( not ( = ?auto_190509 ?auto_190511 ) ) ( not ( = ?auto_190509 ?auto_190512 ) ) ( not ( = ?auto_190509 ?auto_190513 ) ) ( not ( = ?auto_190509 ?auto_190514 ) ) ( not ( = ?auto_190509 ?auto_190515 ) ) ( not ( = ?auto_190510 ?auto_190511 ) ) ( not ( = ?auto_190510 ?auto_190512 ) ) ( not ( = ?auto_190510 ?auto_190513 ) ) ( not ( = ?auto_190510 ?auto_190514 ) ) ( not ( = ?auto_190510 ?auto_190515 ) ) ( not ( = ?auto_190511 ?auto_190512 ) ) ( not ( = ?auto_190511 ?auto_190513 ) ) ( not ( = ?auto_190511 ?auto_190514 ) ) ( not ( = ?auto_190511 ?auto_190515 ) ) ( not ( = ?auto_190512 ?auto_190513 ) ) ( not ( = ?auto_190512 ?auto_190514 ) ) ( not ( = ?auto_190512 ?auto_190515 ) ) ( not ( = ?auto_190513 ?auto_190514 ) ) ( not ( = ?auto_190513 ?auto_190515 ) ) ( not ( = ?auto_190514 ?auto_190515 ) ) ( ON ?auto_190513 ?auto_190514 ) ( ON ?auto_190512 ?auto_190513 ) ( ON ?auto_190511 ?auto_190512 ) ( ON ?auto_190510 ?auto_190511 ) ( ON ?auto_190509 ?auto_190510 ) ( ON ?auto_190508 ?auto_190509 ) ( ON ?auto_190507 ?auto_190508 ) ( ON ?auto_190506 ?auto_190507 ) ( ON ?auto_190505 ?auto_190506 ) ( CLEAR ?auto_190505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190505 )
      ( MAKE-10PILE ?auto_190505 ?auto_190506 ?auto_190507 ?auto_190508 ?auto_190509 ?auto_190510 ?auto_190511 ?auto_190512 ?auto_190513 ?auto_190514 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190527 - BLOCK
      ?auto_190528 - BLOCK
      ?auto_190529 - BLOCK
      ?auto_190530 - BLOCK
      ?auto_190531 - BLOCK
      ?auto_190532 - BLOCK
      ?auto_190533 - BLOCK
      ?auto_190534 - BLOCK
      ?auto_190535 - BLOCK
      ?auto_190536 - BLOCK
      ?auto_190537 - BLOCK
    )
    :vars
    (
      ?auto_190538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190536 ) ( ON ?auto_190537 ?auto_190538 ) ( CLEAR ?auto_190537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190527 ) ( ON ?auto_190528 ?auto_190527 ) ( ON ?auto_190529 ?auto_190528 ) ( ON ?auto_190530 ?auto_190529 ) ( ON ?auto_190531 ?auto_190530 ) ( ON ?auto_190532 ?auto_190531 ) ( ON ?auto_190533 ?auto_190532 ) ( ON ?auto_190534 ?auto_190533 ) ( ON ?auto_190535 ?auto_190534 ) ( ON ?auto_190536 ?auto_190535 ) ( not ( = ?auto_190527 ?auto_190528 ) ) ( not ( = ?auto_190527 ?auto_190529 ) ) ( not ( = ?auto_190527 ?auto_190530 ) ) ( not ( = ?auto_190527 ?auto_190531 ) ) ( not ( = ?auto_190527 ?auto_190532 ) ) ( not ( = ?auto_190527 ?auto_190533 ) ) ( not ( = ?auto_190527 ?auto_190534 ) ) ( not ( = ?auto_190527 ?auto_190535 ) ) ( not ( = ?auto_190527 ?auto_190536 ) ) ( not ( = ?auto_190527 ?auto_190537 ) ) ( not ( = ?auto_190527 ?auto_190538 ) ) ( not ( = ?auto_190528 ?auto_190529 ) ) ( not ( = ?auto_190528 ?auto_190530 ) ) ( not ( = ?auto_190528 ?auto_190531 ) ) ( not ( = ?auto_190528 ?auto_190532 ) ) ( not ( = ?auto_190528 ?auto_190533 ) ) ( not ( = ?auto_190528 ?auto_190534 ) ) ( not ( = ?auto_190528 ?auto_190535 ) ) ( not ( = ?auto_190528 ?auto_190536 ) ) ( not ( = ?auto_190528 ?auto_190537 ) ) ( not ( = ?auto_190528 ?auto_190538 ) ) ( not ( = ?auto_190529 ?auto_190530 ) ) ( not ( = ?auto_190529 ?auto_190531 ) ) ( not ( = ?auto_190529 ?auto_190532 ) ) ( not ( = ?auto_190529 ?auto_190533 ) ) ( not ( = ?auto_190529 ?auto_190534 ) ) ( not ( = ?auto_190529 ?auto_190535 ) ) ( not ( = ?auto_190529 ?auto_190536 ) ) ( not ( = ?auto_190529 ?auto_190537 ) ) ( not ( = ?auto_190529 ?auto_190538 ) ) ( not ( = ?auto_190530 ?auto_190531 ) ) ( not ( = ?auto_190530 ?auto_190532 ) ) ( not ( = ?auto_190530 ?auto_190533 ) ) ( not ( = ?auto_190530 ?auto_190534 ) ) ( not ( = ?auto_190530 ?auto_190535 ) ) ( not ( = ?auto_190530 ?auto_190536 ) ) ( not ( = ?auto_190530 ?auto_190537 ) ) ( not ( = ?auto_190530 ?auto_190538 ) ) ( not ( = ?auto_190531 ?auto_190532 ) ) ( not ( = ?auto_190531 ?auto_190533 ) ) ( not ( = ?auto_190531 ?auto_190534 ) ) ( not ( = ?auto_190531 ?auto_190535 ) ) ( not ( = ?auto_190531 ?auto_190536 ) ) ( not ( = ?auto_190531 ?auto_190537 ) ) ( not ( = ?auto_190531 ?auto_190538 ) ) ( not ( = ?auto_190532 ?auto_190533 ) ) ( not ( = ?auto_190532 ?auto_190534 ) ) ( not ( = ?auto_190532 ?auto_190535 ) ) ( not ( = ?auto_190532 ?auto_190536 ) ) ( not ( = ?auto_190532 ?auto_190537 ) ) ( not ( = ?auto_190532 ?auto_190538 ) ) ( not ( = ?auto_190533 ?auto_190534 ) ) ( not ( = ?auto_190533 ?auto_190535 ) ) ( not ( = ?auto_190533 ?auto_190536 ) ) ( not ( = ?auto_190533 ?auto_190537 ) ) ( not ( = ?auto_190533 ?auto_190538 ) ) ( not ( = ?auto_190534 ?auto_190535 ) ) ( not ( = ?auto_190534 ?auto_190536 ) ) ( not ( = ?auto_190534 ?auto_190537 ) ) ( not ( = ?auto_190534 ?auto_190538 ) ) ( not ( = ?auto_190535 ?auto_190536 ) ) ( not ( = ?auto_190535 ?auto_190537 ) ) ( not ( = ?auto_190535 ?auto_190538 ) ) ( not ( = ?auto_190536 ?auto_190537 ) ) ( not ( = ?auto_190536 ?auto_190538 ) ) ( not ( = ?auto_190537 ?auto_190538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190537 ?auto_190538 )
      ( !STACK ?auto_190537 ?auto_190536 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190550 - BLOCK
      ?auto_190551 - BLOCK
      ?auto_190552 - BLOCK
      ?auto_190553 - BLOCK
      ?auto_190554 - BLOCK
      ?auto_190555 - BLOCK
      ?auto_190556 - BLOCK
      ?auto_190557 - BLOCK
      ?auto_190558 - BLOCK
      ?auto_190559 - BLOCK
      ?auto_190560 - BLOCK
    )
    :vars
    (
      ?auto_190561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_190559 ) ( ON ?auto_190560 ?auto_190561 ) ( CLEAR ?auto_190560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_190550 ) ( ON ?auto_190551 ?auto_190550 ) ( ON ?auto_190552 ?auto_190551 ) ( ON ?auto_190553 ?auto_190552 ) ( ON ?auto_190554 ?auto_190553 ) ( ON ?auto_190555 ?auto_190554 ) ( ON ?auto_190556 ?auto_190555 ) ( ON ?auto_190557 ?auto_190556 ) ( ON ?auto_190558 ?auto_190557 ) ( ON ?auto_190559 ?auto_190558 ) ( not ( = ?auto_190550 ?auto_190551 ) ) ( not ( = ?auto_190550 ?auto_190552 ) ) ( not ( = ?auto_190550 ?auto_190553 ) ) ( not ( = ?auto_190550 ?auto_190554 ) ) ( not ( = ?auto_190550 ?auto_190555 ) ) ( not ( = ?auto_190550 ?auto_190556 ) ) ( not ( = ?auto_190550 ?auto_190557 ) ) ( not ( = ?auto_190550 ?auto_190558 ) ) ( not ( = ?auto_190550 ?auto_190559 ) ) ( not ( = ?auto_190550 ?auto_190560 ) ) ( not ( = ?auto_190550 ?auto_190561 ) ) ( not ( = ?auto_190551 ?auto_190552 ) ) ( not ( = ?auto_190551 ?auto_190553 ) ) ( not ( = ?auto_190551 ?auto_190554 ) ) ( not ( = ?auto_190551 ?auto_190555 ) ) ( not ( = ?auto_190551 ?auto_190556 ) ) ( not ( = ?auto_190551 ?auto_190557 ) ) ( not ( = ?auto_190551 ?auto_190558 ) ) ( not ( = ?auto_190551 ?auto_190559 ) ) ( not ( = ?auto_190551 ?auto_190560 ) ) ( not ( = ?auto_190551 ?auto_190561 ) ) ( not ( = ?auto_190552 ?auto_190553 ) ) ( not ( = ?auto_190552 ?auto_190554 ) ) ( not ( = ?auto_190552 ?auto_190555 ) ) ( not ( = ?auto_190552 ?auto_190556 ) ) ( not ( = ?auto_190552 ?auto_190557 ) ) ( not ( = ?auto_190552 ?auto_190558 ) ) ( not ( = ?auto_190552 ?auto_190559 ) ) ( not ( = ?auto_190552 ?auto_190560 ) ) ( not ( = ?auto_190552 ?auto_190561 ) ) ( not ( = ?auto_190553 ?auto_190554 ) ) ( not ( = ?auto_190553 ?auto_190555 ) ) ( not ( = ?auto_190553 ?auto_190556 ) ) ( not ( = ?auto_190553 ?auto_190557 ) ) ( not ( = ?auto_190553 ?auto_190558 ) ) ( not ( = ?auto_190553 ?auto_190559 ) ) ( not ( = ?auto_190553 ?auto_190560 ) ) ( not ( = ?auto_190553 ?auto_190561 ) ) ( not ( = ?auto_190554 ?auto_190555 ) ) ( not ( = ?auto_190554 ?auto_190556 ) ) ( not ( = ?auto_190554 ?auto_190557 ) ) ( not ( = ?auto_190554 ?auto_190558 ) ) ( not ( = ?auto_190554 ?auto_190559 ) ) ( not ( = ?auto_190554 ?auto_190560 ) ) ( not ( = ?auto_190554 ?auto_190561 ) ) ( not ( = ?auto_190555 ?auto_190556 ) ) ( not ( = ?auto_190555 ?auto_190557 ) ) ( not ( = ?auto_190555 ?auto_190558 ) ) ( not ( = ?auto_190555 ?auto_190559 ) ) ( not ( = ?auto_190555 ?auto_190560 ) ) ( not ( = ?auto_190555 ?auto_190561 ) ) ( not ( = ?auto_190556 ?auto_190557 ) ) ( not ( = ?auto_190556 ?auto_190558 ) ) ( not ( = ?auto_190556 ?auto_190559 ) ) ( not ( = ?auto_190556 ?auto_190560 ) ) ( not ( = ?auto_190556 ?auto_190561 ) ) ( not ( = ?auto_190557 ?auto_190558 ) ) ( not ( = ?auto_190557 ?auto_190559 ) ) ( not ( = ?auto_190557 ?auto_190560 ) ) ( not ( = ?auto_190557 ?auto_190561 ) ) ( not ( = ?auto_190558 ?auto_190559 ) ) ( not ( = ?auto_190558 ?auto_190560 ) ) ( not ( = ?auto_190558 ?auto_190561 ) ) ( not ( = ?auto_190559 ?auto_190560 ) ) ( not ( = ?auto_190559 ?auto_190561 ) ) ( not ( = ?auto_190560 ?auto_190561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_190560 ?auto_190561 )
      ( !STACK ?auto_190560 ?auto_190559 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190573 - BLOCK
      ?auto_190574 - BLOCK
      ?auto_190575 - BLOCK
      ?auto_190576 - BLOCK
      ?auto_190577 - BLOCK
      ?auto_190578 - BLOCK
      ?auto_190579 - BLOCK
      ?auto_190580 - BLOCK
      ?auto_190581 - BLOCK
      ?auto_190582 - BLOCK
      ?auto_190583 - BLOCK
    )
    :vars
    (
      ?auto_190584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190583 ?auto_190584 ) ( ON-TABLE ?auto_190573 ) ( ON ?auto_190574 ?auto_190573 ) ( ON ?auto_190575 ?auto_190574 ) ( ON ?auto_190576 ?auto_190575 ) ( ON ?auto_190577 ?auto_190576 ) ( ON ?auto_190578 ?auto_190577 ) ( ON ?auto_190579 ?auto_190578 ) ( ON ?auto_190580 ?auto_190579 ) ( ON ?auto_190581 ?auto_190580 ) ( not ( = ?auto_190573 ?auto_190574 ) ) ( not ( = ?auto_190573 ?auto_190575 ) ) ( not ( = ?auto_190573 ?auto_190576 ) ) ( not ( = ?auto_190573 ?auto_190577 ) ) ( not ( = ?auto_190573 ?auto_190578 ) ) ( not ( = ?auto_190573 ?auto_190579 ) ) ( not ( = ?auto_190573 ?auto_190580 ) ) ( not ( = ?auto_190573 ?auto_190581 ) ) ( not ( = ?auto_190573 ?auto_190582 ) ) ( not ( = ?auto_190573 ?auto_190583 ) ) ( not ( = ?auto_190573 ?auto_190584 ) ) ( not ( = ?auto_190574 ?auto_190575 ) ) ( not ( = ?auto_190574 ?auto_190576 ) ) ( not ( = ?auto_190574 ?auto_190577 ) ) ( not ( = ?auto_190574 ?auto_190578 ) ) ( not ( = ?auto_190574 ?auto_190579 ) ) ( not ( = ?auto_190574 ?auto_190580 ) ) ( not ( = ?auto_190574 ?auto_190581 ) ) ( not ( = ?auto_190574 ?auto_190582 ) ) ( not ( = ?auto_190574 ?auto_190583 ) ) ( not ( = ?auto_190574 ?auto_190584 ) ) ( not ( = ?auto_190575 ?auto_190576 ) ) ( not ( = ?auto_190575 ?auto_190577 ) ) ( not ( = ?auto_190575 ?auto_190578 ) ) ( not ( = ?auto_190575 ?auto_190579 ) ) ( not ( = ?auto_190575 ?auto_190580 ) ) ( not ( = ?auto_190575 ?auto_190581 ) ) ( not ( = ?auto_190575 ?auto_190582 ) ) ( not ( = ?auto_190575 ?auto_190583 ) ) ( not ( = ?auto_190575 ?auto_190584 ) ) ( not ( = ?auto_190576 ?auto_190577 ) ) ( not ( = ?auto_190576 ?auto_190578 ) ) ( not ( = ?auto_190576 ?auto_190579 ) ) ( not ( = ?auto_190576 ?auto_190580 ) ) ( not ( = ?auto_190576 ?auto_190581 ) ) ( not ( = ?auto_190576 ?auto_190582 ) ) ( not ( = ?auto_190576 ?auto_190583 ) ) ( not ( = ?auto_190576 ?auto_190584 ) ) ( not ( = ?auto_190577 ?auto_190578 ) ) ( not ( = ?auto_190577 ?auto_190579 ) ) ( not ( = ?auto_190577 ?auto_190580 ) ) ( not ( = ?auto_190577 ?auto_190581 ) ) ( not ( = ?auto_190577 ?auto_190582 ) ) ( not ( = ?auto_190577 ?auto_190583 ) ) ( not ( = ?auto_190577 ?auto_190584 ) ) ( not ( = ?auto_190578 ?auto_190579 ) ) ( not ( = ?auto_190578 ?auto_190580 ) ) ( not ( = ?auto_190578 ?auto_190581 ) ) ( not ( = ?auto_190578 ?auto_190582 ) ) ( not ( = ?auto_190578 ?auto_190583 ) ) ( not ( = ?auto_190578 ?auto_190584 ) ) ( not ( = ?auto_190579 ?auto_190580 ) ) ( not ( = ?auto_190579 ?auto_190581 ) ) ( not ( = ?auto_190579 ?auto_190582 ) ) ( not ( = ?auto_190579 ?auto_190583 ) ) ( not ( = ?auto_190579 ?auto_190584 ) ) ( not ( = ?auto_190580 ?auto_190581 ) ) ( not ( = ?auto_190580 ?auto_190582 ) ) ( not ( = ?auto_190580 ?auto_190583 ) ) ( not ( = ?auto_190580 ?auto_190584 ) ) ( not ( = ?auto_190581 ?auto_190582 ) ) ( not ( = ?auto_190581 ?auto_190583 ) ) ( not ( = ?auto_190581 ?auto_190584 ) ) ( not ( = ?auto_190582 ?auto_190583 ) ) ( not ( = ?auto_190582 ?auto_190584 ) ) ( not ( = ?auto_190583 ?auto_190584 ) ) ( CLEAR ?auto_190581 ) ( ON ?auto_190582 ?auto_190583 ) ( CLEAR ?auto_190582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_190573 ?auto_190574 ?auto_190575 ?auto_190576 ?auto_190577 ?auto_190578 ?auto_190579 ?auto_190580 ?auto_190581 ?auto_190582 )
      ( MAKE-11PILE ?auto_190573 ?auto_190574 ?auto_190575 ?auto_190576 ?auto_190577 ?auto_190578 ?auto_190579 ?auto_190580 ?auto_190581 ?auto_190582 ?auto_190583 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190596 - BLOCK
      ?auto_190597 - BLOCK
      ?auto_190598 - BLOCK
      ?auto_190599 - BLOCK
      ?auto_190600 - BLOCK
      ?auto_190601 - BLOCK
      ?auto_190602 - BLOCK
      ?auto_190603 - BLOCK
      ?auto_190604 - BLOCK
      ?auto_190605 - BLOCK
      ?auto_190606 - BLOCK
    )
    :vars
    (
      ?auto_190607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190606 ?auto_190607 ) ( ON-TABLE ?auto_190596 ) ( ON ?auto_190597 ?auto_190596 ) ( ON ?auto_190598 ?auto_190597 ) ( ON ?auto_190599 ?auto_190598 ) ( ON ?auto_190600 ?auto_190599 ) ( ON ?auto_190601 ?auto_190600 ) ( ON ?auto_190602 ?auto_190601 ) ( ON ?auto_190603 ?auto_190602 ) ( ON ?auto_190604 ?auto_190603 ) ( not ( = ?auto_190596 ?auto_190597 ) ) ( not ( = ?auto_190596 ?auto_190598 ) ) ( not ( = ?auto_190596 ?auto_190599 ) ) ( not ( = ?auto_190596 ?auto_190600 ) ) ( not ( = ?auto_190596 ?auto_190601 ) ) ( not ( = ?auto_190596 ?auto_190602 ) ) ( not ( = ?auto_190596 ?auto_190603 ) ) ( not ( = ?auto_190596 ?auto_190604 ) ) ( not ( = ?auto_190596 ?auto_190605 ) ) ( not ( = ?auto_190596 ?auto_190606 ) ) ( not ( = ?auto_190596 ?auto_190607 ) ) ( not ( = ?auto_190597 ?auto_190598 ) ) ( not ( = ?auto_190597 ?auto_190599 ) ) ( not ( = ?auto_190597 ?auto_190600 ) ) ( not ( = ?auto_190597 ?auto_190601 ) ) ( not ( = ?auto_190597 ?auto_190602 ) ) ( not ( = ?auto_190597 ?auto_190603 ) ) ( not ( = ?auto_190597 ?auto_190604 ) ) ( not ( = ?auto_190597 ?auto_190605 ) ) ( not ( = ?auto_190597 ?auto_190606 ) ) ( not ( = ?auto_190597 ?auto_190607 ) ) ( not ( = ?auto_190598 ?auto_190599 ) ) ( not ( = ?auto_190598 ?auto_190600 ) ) ( not ( = ?auto_190598 ?auto_190601 ) ) ( not ( = ?auto_190598 ?auto_190602 ) ) ( not ( = ?auto_190598 ?auto_190603 ) ) ( not ( = ?auto_190598 ?auto_190604 ) ) ( not ( = ?auto_190598 ?auto_190605 ) ) ( not ( = ?auto_190598 ?auto_190606 ) ) ( not ( = ?auto_190598 ?auto_190607 ) ) ( not ( = ?auto_190599 ?auto_190600 ) ) ( not ( = ?auto_190599 ?auto_190601 ) ) ( not ( = ?auto_190599 ?auto_190602 ) ) ( not ( = ?auto_190599 ?auto_190603 ) ) ( not ( = ?auto_190599 ?auto_190604 ) ) ( not ( = ?auto_190599 ?auto_190605 ) ) ( not ( = ?auto_190599 ?auto_190606 ) ) ( not ( = ?auto_190599 ?auto_190607 ) ) ( not ( = ?auto_190600 ?auto_190601 ) ) ( not ( = ?auto_190600 ?auto_190602 ) ) ( not ( = ?auto_190600 ?auto_190603 ) ) ( not ( = ?auto_190600 ?auto_190604 ) ) ( not ( = ?auto_190600 ?auto_190605 ) ) ( not ( = ?auto_190600 ?auto_190606 ) ) ( not ( = ?auto_190600 ?auto_190607 ) ) ( not ( = ?auto_190601 ?auto_190602 ) ) ( not ( = ?auto_190601 ?auto_190603 ) ) ( not ( = ?auto_190601 ?auto_190604 ) ) ( not ( = ?auto_190601 ?auto_190605 ) ) ( not ( = ?auto_190601 ?auto_190606 ) ) ( not ( = ?auto_190601 ?auto_190607 ) ) ( not ( = ?auto_190602 ?auto_190603 ) ) ( not ( = ?auto_190602 ?auto_190604 ) ) ( not ( = ?auto_190602 ?auto_190605 ) ) ( not ( = ?auto_190602 ?auto_190606 ) ) ( not ( = ?auto_190602 ?auto_190607 ) ) ( not ( = ?auto_190603 ?auto_190604 ) ) ( not ( = ?auto_190603 ?auto_190605 ) ) ( not ( = ?auto_190603 ?auto_190606 ) ) ( not ( = ?auto_190603 ?auto_190607 ) ) ( not ( = ?auto_190604 ?auto_190605 ) ) ( not ( = ?auto_190604 ?auto_190606 ) ) ( not ( = ?auto_190604 ?auto_190607 ) ) ( not ( = ?auto_190605 ?auto_190606 ) ) ( not ( = ?auto_190605 ?auto_190607 ) ) ( not ( = ?auto_190606 ?auto_190607 ) ) ( CLEAR ?auto_190604 ) ( ON ?auto_190605 ?auto_190606 ) ( CLEAR ?auto_190605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_190596 ?auto_190597 ?auto_190598 ?auto_190599 ?auto_190600 ?auto_190601 ?auto_190602 ?auto_190603 ?auto_190604 ?auto_190605 )
      ( MAKE-11PILE ?auto_190596 ?auto_190597 ?auto_190598 ?auto_190599 ?auto_190600 ?auto_190601 ?auto_190602 ?auto_190603 ?auto_190604 ?auto_190605 ?auto_190606 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190619 - BLOCK
      ?auto_190620 - BLOCK
      ?auto_190621 - BLOCK
      ?auto_190622 - BLOCK
      ?auto_190623 - BLOCK
      ?auto_190624 - BLOCK
      ?auto_190625 - BLOCK
      ?auto_190626 - BLOCK
      ?auto_190627 - BLOCK
      ?auto_190628 - BLOCK
      ?auto_190629 - BLOCK
    )
    :vars
    (
      ?auto_190630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190629 ?auto_190630 ) ( ON-TABLE ?auto_190619 ) ( ON ?auto_190620 ?auto_190619 ) ( ON ?auto_190621 ?auto_190620 ) ( ON ?auto_190622 ?auto_190621 ) ( ON ?auto_190623 ?auto_190622 ) ( ON ?auto_190624 ?auto_190623 ) ( ON ?auto_190625 ?auto_190624 ) ( ON ?auto_190626 ?auto_190625 ) ( not ( = ?auto_190619 ?auto_190620 ) ) ( not ( = ?auto_190619 ?auto_190621 ) ) ( not ( = ?auto_190619 ?auto_190622 ) ) ( not ( = ?auto_190619 ?auto_190623 ) ) ( not ( = ?auto_190619 ?auto_190624 ) ) ( not ( = ?auto_190619 ?auto_190625 ) ) ( not ( = ?auto_190619 ?auto_190626 ) ) ( not ( = ?auto_190619 ?auto_190627 ) ) ( not ( = ?auto_190619 ?auto_190628 ) ) ( not ( = ?auto_190619 ?auto_190629 ) ) ( not ( = ?auto_190619 ?auto_190630 ) ) ( not ( = ?auto_190620 ?auto_190621 ) ) ( not ( = ?auto_190620 ?auto_190622 ) ) ( not ( = ?auto_190620 ?auto_190623 ) ) ( not ( = ?auto_190620 ?auto_190624 ) ) ( not ( = ?auto_190620 ?auto_190625 ) ) ( not ( = ?auto_190620 ?auto_190626 ) ) ( not ( = ?auto_190620 ?auto_190627 ) ) ( not ( = ?auto_190620 ?auto_190628 ) ) ( not ( = ?auto_190620 ?auto_190629 ) ) ( not ( = ?auto_190620 ?auto_190630 ) ) ( not ( = ?auto_190621 ?auto_190622 ) ) ( not ( = ?auto_190621 ?auto_190623 ) ) ( not ( = ?auto_190621 ?auto_190624 ) ) ( not ( = ?auto_190621 ?auto_190625 ) ) ( not ( = ?auto_190621 ?auto_190626 ) ) ( not ( = ?auto_190621 ?auto_190627 ) ) ( not ( = ?auto_190621 ?auto_190628 ) ) ( not ( = ?auto_190621 ?auto_190629 ) ) ( not ( = ?auto_190621 ?auto_190630 ) ) ( not ( = ?auto_190622 ?auto_190623 ) ) ( not ( = ?auto_190622 ?auto_190624 ) ) ( not ( = ?auto_190622 ?auto_190625 ) ) ( not ( = ?auto_190622 ?auto_190626 ) ) ( not ( = ?auto_190622 ?auto_190627 ) ) ( not ( = ?auto_190622 ?auto_190628 ) ) ( not ( = ?auto_190622 ?auto_190629 ) ) ( not ( = ?auto_190622 ?auto_190630 ) ) ( not ( = ?auto_190623 ?auto_190624 ) ) ( not ( = ?auto_190623 ?auto_190625 ) ) ( not ( = ?auto_190623 ?auto_190626 ) ) ( not ( = ?auto_190623 ?auto_190627 ) ) ( not ( = ?auto_190623 ?auto_190628 ) ) ( not ( = ?auto_190623 ?auto_190629 ) ) ( not ( = ?auto_190623 ?auto_190630 ) ) ( not ( = ?auto_190624 ?auto_190625 ) ) ( not ( = ?auto_190624 ?auto_190626 ) ) ( not ( = ?auto_190624 ?auto_190627 ) ) ( not ( = ?auto_190624 ?auto_190628 ) ) ( not ( = ?auto_190624 ?auto_190629 ) ) ( not ( = ?auto_190624 ?auto_190630 ) ) ( not ( = ?auto_190625 ?auto_190626 ) ) ( not ( = ?auto_190625 ?auto_190627 ) ) ( not ( = ?auto_190625 ?auto_190628 ) ) ( not ( = ?auto_190625 ?auto_190629 ) ) ( not ( = ?auto_190625 ?auto_190630 ) ) ( not ( = ?auto_190626 ?auto_190627 ) ) ( not ( = ?auto_190626 ?auto_190628 ) ) ( not ( = ?auto_190626 ?auto_190629 ) ) ( not ( = ?auto_190626 ?auto_190630 ) ) ( not ( = ?auto_190627 ?auto_190628 ) ) ( not ( = ?auto_190627 ?auto_190629 ) ) ( not ( = ?auto_190627 ?auto_190630 ) ) ( not ( = ?auto_190628 ?auto_190629 ) ) ( not ( = ?auto_190628 ?auto_190630 ) ) ( not ( = ?auto_190629 ?auto_190630 ) ) ( ON ?auto_190628 ?auto_190629 ) ( CLEAR ?auto_190626 ) ( ON ?auto_190627 ?auto_190628 ) ( CLEAR ?auto_190627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_190619 ?auto_190620 ?auto_190621 ?auto_190622 ?auto_190623 ?auto_190624 ?auto_190625 ?auto_190626 ?auto_190627 )
      ( MAKE-11PILE ?auto_190619 ?auto_190620 ?auto_190621 ?auto_190622 ?auto_190623 ?auto_190624 ?auto_190625 ?auto_190626 ?auto_190627 ?auto_190628 ?auto_190629 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190642 - BLOCK
      ?auto_190643 - BLOCK
      ?auto_190644 - BLOCK
      ?auto_190645 - BLOCK
      ?auto_190646 - BLOCK
      ?auto_190647 - BLOCK
      ?auto_190648 - BLOCK
      ?auto_190649 - BLOCK
      ?auto_190650 - BLOCK
      ?auto_190651 - BLOCK
      ?auto_190652 - BLOCK
    )
    :vars
    (
      ?auto_190653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190652 ?auto_190653 ) ( ON-TABLE ?auto_190642 ) ( ON ?auto_190643 ?auto_190642 ) ( ON ?auto_190644 ?auto_190643 ) ( ON ?auto_190645 ?auto_190644 ) ( ON ?auto_190646 ?auto_190645 ) ( ON ?auto_190647 ?auto_190646 ) ( ON ?auto_190648 ?auto_190647 ) ( ON ?auto_190649 ?auto_190648 ) ( not ( = ?auto_190642 ?auto_190643 ) ) ( not ( = ?auto_190642 ?auto_190644 ) ) ( not ( = ?auto_190642 ?auto_190645 ) ) ( not ( = ?auto_190642 ?auto_190646 ) ) ( not ( = ?auto_190642 ?auto_190647 ) ) ( not ( = ?auto_190642 ?auto_190648 ) ) ( not ( = ?auto_190642 ?auto_190649 ) ) ( not ( = ?auto_190642 ?auto_190650 ) ) ( not ( = ?auto_190642 ?auto_190651 ) ) ( not ( = ?auto_190642 ?auto_190652 ) ) ( not ( = ?auto_190642 ?auto_190653 ) ) ( not ( = ?auto_190643 ?auto_190644 ) ) ( not ( = ?auto_190643 ?auto_190645 ) ) ( not ( = ?auto_190643 ?auto_190646 ) ) ( not ( = ?auto_190643 ?auto_190647 ) ) ( not ( = ?auto_190643 ?auto_190648 ) ) ( not ( = ?auto_190643 ?auto_190649 ) ) ( not ( = ?auto_190643 ?auto_190650 ) ) ( not ( = ?auto_190643 ?auto_190651 ) ) ( not ( = ?auto_190643 ?auto_190652 ) ) ( not ( = ?auto_190643 ?auto_190653 ) ) ( not ( = ?auto_190644 ?auto_190645 ) ) ( not ( = ?auto_190644 ?auto_190646 ) ) ( not ( = ?auto_190644 ?auto_190647 ) ) ( not ( = ?auto_190644 ?auto_190648 ) ) ( not ( = ?auto_190644 ?auto_190649 ) ) ( not ( = ?auto_190644 ?auto_190650 ) ) ( not ( = ?auto_190644 ?auto_190651 ) ) ( not ( = ?auto_190644 ?auto_190652 ) ) ( not ( = ?auto_190644 ?auto_190653 ) ) ( not ( = ?auto_190645 ?auto_190646 ) ) ( not ( = ?auto_190645 ?auto_190647 ) ) ( not ( = ?auto_190645 ?auto_190648 ) ) ( not ( = ?auto_190645 ?auto_190649 ) ) ( not ( = ?auto_190645 ?auto_190650 ) ) ( not ( = ?auto_190645 ?auto_190651 ) ) ( not ( = ?auto_190645 ?auto_190652 ) ) ( not ( = ?auto_190645 ?auto_190653 ) ) ( not ( = ?auto_190646 ?auto_190647 ) ) ( not ( = ?auto_190646 ?auto_190648 ) ) ( not ( = ?auto_190646 ?auto_190649 ) ) ( not ( = ?auto_190646 ?auto_190650 ) ) ( not ( = ?auto_190646 ?auto_190651 ) ) ( not ( = ?auto_190646 ?auto_190652 ) ) ( not ( = ?auto_190646 ?auto_190653 ) ) ( not ( = ?auto_190647 ?auto_190648 ) ) ( not ( = ?auto_190647 ?auto_190649 ) ) ( not ( = ?auto_190647 ?auto_190650 ) ) ( not ( = ?auto_190647 ?auto_190651 ) ) ( not ( = ?auto_190647 ?auto_190652 ) ) ( not ( = ?auto_190647 ?auto_190653 ) ) ( not ( = ?auto_190648 ?auto_190649 ) ) ( not ( = ?auto_190648 ?auto_190650 ) ) ( not ( = ?auto_190648 ?auto_190651 ) ) ( not ( = ?auto_190648 ?auto_190652 ) ) ( not ( = ?auto_190648 ?auto_190653 ) ) ( not ( = ?auto_190649 ?auto_190650 ) ) ( not ( = ?auto_190649 ?auto_190651 ) ) ( not ( = ?auto_190649 ?auto_190652 ) ) ( not ( = ?auto_190649 ?auto_190653 ) ) ( not ( = ?auto_190650 ?auto_190651 ) ) ( not ( = ?auto_190650 ?auto_190652 ) ) ( not ( = ?auto_190650 ?auto_190653 ) ) ( not ( = ?auto_190651 ?auto_190652 ) ) ( not ( = ?auto_190651 ?auto_190653 ) ) ( not ( = ?auto_190652 ?auto_190653 ) ) ( ON ?auto_190651 ?auto_190652 ) ( CLEAR ?auto_190649 ) ( ON ?auto_190650 ?auto_190651 ) ( CLEAR ?auto_190650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_190642 ?auto_190643 ?auto_190644 ?auto_190645 ?auto_190646 ?auto_190647 ?auto_190648 ?auto_190649 ?auto_190650 )
      ( MAKE-11PILE ?auto_190642 ?auto_190643 ?auto_190644 ?auto_190645 ?auto_190646 ?auto_190647 ?auto_190648 ?auto_190649 ?auto_190650 ?auto_190651 ?auto_190652 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190665 - BLOCK
      ?auto_190666 - BLOCK
      ?auto_190667 - BLOCK
      ?auto_190668 - BLOCK
      ?auto_190669 - BLOCK
      ?auto_190670 - BLOCK
      ?auto_190671 - BLOCK
      ?auto_190672 - BLOCK
      ?auto_190673 - BLOCK
      ?auto_190674 - BLOCK
      ?auto_190675 - BLOCK
    )
    :vars
    (
      ?auto_190676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190675 ?auto_190676 ) ( ON-TABLE ?auto_190665 ) ( ON ?auto_190666 ?auto_190665 ) ( ON ?auto_190667 ?auto_190666 ) ( ON ?auto_190668 ?auto_190667 ) ( ON ?auto_190669 ?auto_190668 ) ( ON ?auto_190670 ?auto_190669 ) ( ON ?auto_190671 ?auto_190670 ) ( not ( = ?auto_190665 ?auto_190666 ) ) ( not ( = ?auto_190665 ?auto_190667 ) ) ( not ( = ?auto_190665 ?auto_190668 ) ) ( not ( = ?auto_190665 ?auto_190669 ) ) ( not ( = ?auto_190665 ?auto_190670 ) ) ( not ( = ?auto_190665 ?auto_190671 ) ) ( not ( = ?auto_190665 ?auto_190672 ) ) ( not ( = ?auto_190665 ?auto_190673 ) ) ( not ( = ?auto_190665 ?auto_190674 ) ) ( not ( = ?auto_190665 ?auto_190675 ) ) ( not ( = ?auto_190665 ?auto_190676 ) ) ( not ( = ?auto_190666 ?auto_190667 ) ) ( not ( = ?auto_190666 ?auto_190668 ) ) ( not ( = ?auto_190666 ?auto_190669 ) ) ( not ( = ?auto_190666 ?auto_190670 ) ) ( not ( = ?auto_190666 ?auto_190671 ) ) ( not ( = ?auto_190666 ?auto_190672 ) ) ( not ( = ?auto_190666 ?auto_190673 ) ) ( not ( = ?auto_190666 ?auto_190674 ) ) ( not ( = ?auto_190666 ?auto_190675 ) ) ( not ( = ?auto_190666 ?auto_190676 ) ) ( not ( = ?auto_190667 ?auto_190668 ) ) ( not ( = ?auto_190667 ?auto_190669 ) ) ( not ( = ?auto_190667 ?auto_190670 ) ) ( not ( = ?auto_190667 ?auto_190671 ) ) ( not ( = ?auto_190667 ?auto_190672 ) ) ( not ( = ?auto_190667 ?auto_190673 ) ) ( not ( = ?auto_190667 ?auto_190674 ) ) ( not ( = ?auto_190667 ?auto_190675 ) ) ( not ( = ?auto_190667 ?auto_190676 ) ) ( not ( = ?auto_190668 ?auto_190669 ) ) ( not ( = ?auto_190668 ?auto_190670 ) ) ( not ( = ?auto_190668 ?auto_190671 ) ) ( not ( = ?auto_190668 ?auto_190672 ) ) ( not ( = ?auto_190668 ?auto_190673 ) ) ( not ( = ?auto_190668 ?auto_190674 ) ) ( not ( = ?auto_190668 ?auto_190675 ) ) ( not ( = ?auto_190668 ?auto_190676 ) ) ( not ( = ?auto_190669 ?auto_190670 ) ) ( not ( = ?auto_190669 ?auto_190671 ) ) ( not ( = ?auto_190669 ?auto_190672 ) ) ( not ( = ?auto_190669 ?auto_190673 ) ) ( not ( = ?auto_190669 ?auto_190674 ) ) ( not ( = ?auto_190669 ?auto_190675 ) ) ( not ( = ?auto_190669 ?auto_190676 ) ) ( not ( = ?auto_190670 ?auto_190671 ) ) ( not ( = ?auto_190670 ?auto_190672 ) ) ( not ( = ?auto_190670 ?auto_190673 ) ) ( not ( = ?auto_190670 ?auto_190674 ) ) ( not ( = ?auto_190670 ?auto_190675 ) ) ( not ( = ?auto_190670 ?auto_190676 ) ) ( not ( = ?auto_190671 ?auto_190672 ) ) ( not ( = ?auto_190671 ?auto_190673 ) ) ( not ( = ?auto_190671 ?auto_190674 ) ) ( not ( = ?auto_190671 ?auto_190675 ) ) ( not ( = ?auto_190671 ?auto_190676 ) ) ( not ( = ?auto_190672 ?auto_190673 ) ) ( not ( = ?auto_190672 ?auto_190674 ) ) ( not ( = ?auto_190672 ?auto_190675 ) ) ( not ( = ?auto_190672 ?auto_190676 ) ) ( not ( = ?auto_190673 ?auto_190674 ) ) ( not ( = ?auto_190673 ?auto_190675 ) ) ( not ( = ?auto_190673 ?auto_190676 ) ) ( not ( = ?auto_190674 ?auto_190675 ) ) ( not ( = ?auto_190674 ?auto_190676 ) ) ( not ( = ?auto_190675 ?auto_190676 ) ) ( ON ?auto_190674 ?auto_190675 ) ( ON ?auto_190673 ?auto_190674 ) ( CLEAR ?auto_190671 ) ( ON ?auto_190672 ?auto_190673 ) ( CLEAR ?auto_190672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190665 ?auto_190666 ?auto_190667 ?auto_190668 ?auto_190669 ?auto_190670 ?auto_190671 ?auto_190672 )
      ( MAKE-11PILE ?auto_190665 ?auto_190666 ?auto_190667 ?auto_190668 ?auto_190669 ?auto_190670 ?auto_190671 ?auto_190672 ?auto_190673 ?auto_190674 ?auto_190675 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190688 - BLOCK
      ?auto_190689 - BLOCK
      ?auto_190690 - BLOCK
      ?auto_190691 - BLOCK
      ?auto_190692 - BLOCK
      ?auto_190693 - BLOCK
      ?auto_190694 - BLOCK
      ?auto_190695 - BLOCK
      ?auto_190696 - BLOCK
      ?auto_190697 - BLOCK
      ?auto_190698 - BLOCK
    )
    :vars
    (
      ?auto_190699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190698 ?auto_190699 ) ( ON-TABLE ?auto_190688 ) ( ON ?auto_190689 ?auto_190688 ) ( ON ?auto_190690 ?auto_190689 ) ( ON ?auto_190691 ?auto_190690 ) ( ON ?auto_190692 ?auto_190691 ) ( ON ?auto_190693 ?auto_190692 ) ( ON ?auto_190694 ?auto_190693 ) ( not ( = ?auto_190688 ?auto_190689 ) ) ( not ( = ?auto_190688 ?auto_190690 ) ) ( not ( = ?auto_190688 ?auto_190691 ) ) ( not ( = ?auto_190688 ?auto_190692 ) ) ( not ( = ?auto_190688 ?auto_190693 ) ) ( not ( = ?auto_190688 ?auto_190694 ) ) ( not ( = ?auto_190688 ?auto_190695 ) ) ( not ( = ?auto_190688 ?auto_190696 ) ) ( not ( = ?auto_190688 ?auto_190697 ) ) ( not ( = ?auto_190688 ?auto_190698 ) ) ( not ( = ?auto_190688 ?auto_190699 ) ) ( not ( = ?auto_190689 ?auto_190690 ) ) ( not ( = ?auto_190689 ?auto_190691 ) ) ( not ( = ?auto_190689 ?auto_190692 ) ) ( not ( = ?auto_190689 ?auto_190693 ) ) ( not ( = ?auto_190689 ?auto_190694 ) ) ( not ( = ?auto_190689 ?auto_190695 ) ) ( not ( = ?auto_190689 ?auto_190696 ) ) ( not ( = ?auto_190689 ?auto_190697 ) ) ( not ( = ?auto_190689 ?auto_190698 ) ) ( not ( = ?auto_190689 ?auto_190699 ) ) ( not ( = ?auto_190690 ?auto_190691 ) ) ( not ( = ?auto_190690 ?auto_190692 ) ) ( not ( = ?auto_190690 ?auto_190693 ) ) ( not ( = ?auto_190690 ?auto_190694 ) ) ( not ( = ?auto_190690 ?auto_190695 ) ) ( not ( = ?auto_190690 ?auto_190696 ) ) ( not ( = ?auto_190690 ?auto_190697 ) ) ( not ( = ?auto_190690 ?auto_190698 ) ) ( not ( = ?auto_190690 ?auto_190699 ) ) ( not ( = ?auto_190691 ?auto_190692 ) ) ( not ( = ?auto_190691 ?auto_190693 ) ) ( not ( = ?auto_190691 ?auto_190694 ) ) ( not ( = ?auto_190691 ?auto_190695 ) ) ( not ( = ?auto_190691 ?auto_190696 ) ) ( not ( = ?auto_190691 ?auto_190697 ) ) ( not ( = ?auto_190691 ?auto_190698 ) ) ( not ( = ?auto_190691 ?auto_190699 ) ) ( not ( = ?auto_190692 ?auto_190693 ) ) ( not ( = ?auto_190692 ?auto_190694 ) ) ( not ( = ?auto_190692 ?auto_190695 ) ) ( not ( = ?auto_190692 ?auto_190696 ) ) ( not ( = ?auto_190692 ?auto_190697 ) ) ( not ( = ?auto_190692 ?auto_190698 ) ) ( not ( = ?auto_190692 ?auto_190699 ) ) ( not ( = ?auto_190693 ?auto_190694 ) ) ( not ( = ?auto_190693 ?auto_190695 ) ) ( not ( = ?auto_190693 ?auto_190696 ) ) ( not ( = ?auto_190693 ?auto_190697 ) ) ( not ( = ?auto_190693 ?auto_190698 ) ) ( not ( = ?auto_190693 ?auto_190699 ) ) ( not ( = ?auto_190694 ?auto_190695 ) ) ( not ( = ?auto_190694 ?auto_190696 ) ) ( not ( = ?auto_190694 ?auto_190697 ) ) ( not ( = ?auto_190694 ?auto_190698 ) ) ( not ( = ?auto_190694 ?auto_190699 ) ) ( not ( = ?auto_190695 ?auto_190696 ) ) ( not ( = ?auto_190695 ?auto_190697 ) ) ( not ( = ?auto_190695 ?auto_190698 ) ) ( not ( = ?auto_190695 ?auto_190699 ) ) ( not ( = ?auto_190696 ?auto_190697 ) ) ( not ( = ?auto_190696 ?auto_190698 ) ) ( not ( = ?auto_190696 ?auto_190699 ) ) ( not ( = ?auto_190697 ?auto_190698 ) ) ( not ( = ?auto_190697 ?auto_190699 ) ) ( not ( = ?auto_190698 ?auto_190699 ) ) ( ON ?auto_190697 ?auto_190698 ) ( ON ?auto_190696 ?auto_190697 ) ( CLEAR ?auto_190694 ) ( ON ?auto_190695 ?auto_190696 ) ( CLEAR ?auto_190695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_190688 ?auto_190689 ?auto_190690 ?auto_190691 ?auto_190692 ?auto_190693 ?auto_190694 ?auto_190695 )
      ( MAKE-11PILE ?auto_190688 ?auto_190689 ?auto_190690 ?auto_190691 ?auto_190692 ?auto_190693 ?auto_190694 ?auto_190695 ?auto_190696 ?auto_190697 ?auto_190698 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190711 - BLOCK
      ?auto_190712 - BLOCK
      ?auto_190713 - BLOCK
      ?auto_190714 - BLOCK
      ?auto_190715 - BLOCK
      ?auto_190716 - BLOCK
      ?auto_190717 - BLOCK
      ?auto_190718 - BLOCK
      ?auto_190719 - BLOCK
      ?auto_190720 - BLOCK
      ?auto_190721 - BLOCK
    )
    :vars
    (
      ?auto_190722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190721 ?auto_190722 ) ( ON-TABLE ?auto_190711 ) ( ON ?auto_190712 ?auto_190711 ) ( ON ?auto_190713 ?auto_190712 ) ( ON ?auto_190714 ?auto_190713 ) ( ON ?auto_190715 ?auto_190714 ) ( ON ?auto_190716 ?auto_190715 ) ( not ( = ?auto_190711 ?auto_190712 ) ) ( not ( = ?auto_190711 ?auto_190713 ) ) ( not ( = ?auto_190711 ?auto_190714 ) ) ( not ( = ?auto_190711 ?auto_190715 ) ) ( not ( = ?auto_190711 ?auto_190716 ) ) ( not ( = ?auto_190711 ?auto_190717 ) ) ( not ( = ?auto_190711 ?auto_190718 ) ) ( not ( = ?auto_190711 ?auto_190719 ) ) ( not ( = ?auto_190711 ?auto_190720 ) ) ( not ( = ?auto_190711 ?auto_190721 ) ) ( not ( = ?auto_190711 ?auto_190722 ) ) ( not ( = ?auto_190712 ?auto_190713 ) ) ( not ( = ?auto_190712 ?auto_190714 ) ) ( not ( = ?auto_190712 ?auto_190715 ) ) ( not ( = ?auto_190712 ?auto_190716 ) ) ( not ( = ?auto_190712 ?auto_190717 ) ) ( not ( = ?auto_190712 ?auto_190718 ) ) ( not ( = ?auto_190712 ?auto_190719 ) ) ( not ( = ?auto_190712 ?auto_190720 ) ) ( not ( = ?auto_190712 ?auto_190721 ) ) ( not ( = ?auto_190712 ?auto_190722 ) ) ( not ( = ?auto_190713 ?auto_190714 ) ) ( not ( = ?auto_190713 ?auto_190715 ) ) ( not ( = ?auto_190713 ?auto_190716 ) ) ( not ( = ?auto_190713 ?auto_190717 ) ) ( not ( = ?auto_190713 ?auto_190718 ) ) ( not ( = ?auto_190713 ?auto_190719 ) ) ( not ( = ?auto_190713 ?auto_190720 ) ) ( not ( = ?auto_190713 ?auto_190721 ) ) ( not ( = ?auto_190713 ?auto_190722 ) ) ( not ( = ?auto_190714 ?auto_190715 ) ) ( not ( = ?auto_190714 ?auto_190716 ) ) ( not ( = ?auto_190714 ?auto_190717 ) ) ( not ( = ?auto_190714 ?auto_190718 ) ) ( not ( = ?auto_190714 ?auto_190719 ) ) ( not ( = ?auto_190714 ?auto_190720 ) ) ( not ( = ?auto_190714 ?auto_190721 ) ) ( not ( = ?auto_190714 ?auto_190722 ) ) ( not ( = ?auto_190715 ?auto_190716 ) ) ( not ( = ?auto_190715 ?auto_190717 ) ) ( not ( = ?auto_190715 ?auto_190718 ) ) ( not ( = ?auto_190715 ?auto_190719 ) ) ( not ( = ?auto_190715 ?auto_190720 ) ) ( not ( = ?auto_190715 ?auto_190721 ) ) ( not ( = ?auto_190715 ?auto_190722 ) ) ( not ( = ?auto_190716 ?auto_190717 ) ) ( not ( = ?auto_190716 ?auto_190718 ) ) ( not ( = ?auto_190716 ?auto_190719 ) ) ( not ( = ?auto_190716 ?auto_190720 ) ) ( not ( = ?auto_190716 ?auto_190721 ) ) ( not ( = ?auto_190716 ?auto_190722 ) ) ( not ( = ?auto_190717 ?auto_190718 ) ) ( not ( = ?auto_190717 ?auto_190719 ) ) ( not ( = ?auto_190717 ?auto_190720 ) ) ( not ( = ?auto_190717 ?auto_190721 ) ) ( not ( = ?auto_190717 ?auto_190722 ) ) ( not ( = ?auto_190718 ?auto_190719 ) ) ( not ( = ?auto_190718 ?auto_190720 ) ) ( not ( = ?auto_190718 ?auto_190721 ) ) ( not ( = ?auto_190718 ?auto_190722 ) ) ( not ( = ?auto_190719 ?auto_190720 ) ) ( not ( = ?auto_190719 ?auto_190721 ) ) ( not ( = ?auto_190719 ?auto_190722 ) ) ( not ( = ?auto_190720 ?auto_190721 ) ) ( not ( = ?auto_190720 ?auto_190722 ) ) ( not ( = ?auto_190721 ?auto_190722 ) ) ( ON ?auto_190720 ?auto_190721 ) ( ON ?auto_190719 ?auto_190720 ) ( ON ?auto_190718 ?auto_190719 ) ( CLEAR ?auto_190716 ) ( ON ?auto_190717 ?auto_190718 ) ( CLEAR ?auto_190717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190711 ?auto_190712 ?auto_190713 ?auto_190714 ?auto_190715 ?auto_190716 ?auto_190717 )
      ( MAKE-11PILE ?auto_190711 ?auto_190712 ?auto_190713 ?auto_190714 ?auto_190715 ?auto_190716 ?auto_190717 ?auto_190718 ?auto_190719 ?auto_190720 ?auto_190721 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190734 - BLOCK
      ?auto_190735 - BLOCK
      ?auto_190736 - BLOCK
      ?auto_190737 - BLOCK
      ?auto_190738 - BLOCK
      ?auto_190739 - BLOCK
      ?auto_190740 - BLOCK
      ?auto_190741 - BLOCK
      ?auto_190742 - BLOCK
      ?auto_190743 - BLOCK
      ?auto_190744 - BLOCK
    )
    :vars
    (
      ?auto_190745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190744 ?auto_190745 ) ( ON-TABLE ?auto_190734 ) ( ON ?auto_190735 ?auto_190734 ) ( ON ?auto_190736 ?auto_190735 ) ( ON ?auto_190737 ?auto_190736 ) ( ON ?auto_190738 ?auto_190737 ) ( ON ?auto_190739 ?auto_190738 ) ( not ( = ?auto_190734 ?auto_190735 ) ) ( not ( = ?auto_190734 ?auto_190736 ) ) ( not ( = ?auto_190734 ?auto_190737 ) ) ( not ( = ?auto_190734 ?auto_190738 ) ) ( not ( = ?auto_190734 ?auto_190739 ) ) ( not ( = ?auto_190734 ?auto_190740 ) ) ( not ( = ?auto_190734 ?auto_190741 ) ) ( not ( = ?auto_190734 ?auto_190742 ) ) ( not ( = ?auto_190734 ?auto_190743 ) ) ( not ( = ?auto_190734 ?auto_190744 ) ) ( not ( = ?auto_190734 ?auto_190745 ) ) ( not ( = ?auto_190735 ?auto_190736 ) ) ( not ( = ?auto_190735 ?auto_190737 ) ) ( not ( = ?auto_190735 ?auto_190738 ) ) ( not ( = ?auto_190735 ?auto_190739 ) ) ( not ( = ?auto_190735 ?auto_190740 ) ) ( not ( = ?auto_190735 ?auto_190741 ) ) ( not ( = ?auto_190735 ?auto_190742 ) ) ( not ( = ?auto_190735 ?auto_190743 ) ) ( not ( = ?auto_190735 ?auto_190744 ) ) ( not ( = ?auto_190735 ?auto_190745 ) ) ( not ( = ?auto_190736 ?auto_190737 ) ) ( not ( = ?auto_190736 ?auto_190738 ) ) ( not ( = ?auto_190736 ?auto_190739 ) ) ( not ( = ?auto_190736 ?auto_190740 ) ) ( not ( = ?auto_190736 ?auto_190741 ) ) ( not ( = ?auto_190736 ?auto_190742 ) ) ( not ( = ?auto_190736 ?auto_190743 ) ) ( not ( = ?auto_190736 ?auto_190744 ) ) ( not ( = ?auto_190736 ?auto_190745 ) ) ( not ( = ?auto_190737 ?auto_190738 ) ) ( not ( = ?auto_190737 ?auto_190739 ) ) ( not ( = ?auto_190737 ?auto_190740 ) ) ( not ( = ?auto_190737 ?auto_190741 ) ) ( not ( = ?auto_190737 ?auto_190742 ) ) ( not ( = ?auto_190737 ?auto_190743 ) ) ( not ( = ?auto_190737 ?auto_190744 ) ) ( not ( = ?auto_190737 ?auto_190745 ) ) ( not ( = ?auto_190738 ?auto_190739 ) ) ( not ( = ?auto_190738 ?auto_190740 ) ) ( not ( = ?auto_190738 ?auto_190741 ) ) ( not ( = ?auto_190738 ?auto_190742 ) ) ( not ( = ?auto_190738 ?auto_190743 ) ) ( not ( = ?auto_190738 ?auto_190744 ) ) ( not ( = ?auto_190738 ?auto_190745 ) ) ( not ( = ?auto_190739 ?auto_190740 ) ) ( not ( = ?auto_190739 ?auto_190741 ) ) ( not ( = ?auto_190739 ?auto_190742 ) ) ( not ( = ?auto_190739 ?auto_190743 ) ) ( not ( = ?auto_190739 ?auto_190744 ) ) ( not ( = ?auto_190739 ?auto_190745 ) ) ( not ( = ?auto_190740 ?auto_190741 ) ) ( not ( = ?auto_190740 ?auto_190742 ) ) ( not ( = ?auto_190740 ?auto_190743 ) ) ( not ( = ?auto_190740 ?auto_190744 ) ) ( not ( = ?auto_190740 ?auto_190745 ) ) ( not ( = ?auto_190741 ?auto_190742 ) ) ( not ( = ?auto_190741 ?auto_190743 ) ) ( not ( = ?auto_190741 ?auto_190744 ) ) ( not ( = ?auto_190741 ?auto_190745 ) ) ( not ( = ?auto_190742 ?auto_190743 ) ) ( not ( = ?auto_190742 ?auto_190744 ) ) ( not ( = ?auto_190742 ?auto_190745 ) ) ( not ( = ?auto_190743 ?auto_190744 ) ) ( not ( = ?auto_190743 ?auto_190745 ) ) ( not ( = ?auto_190744 ?auto_190745 ) ) ( ON ?auto_190743 ?auto_190744 ) ( ON ?auto_190742 ?auto_190743 ) ( ON ?auto_190741 ?auto_190742 ) ( CLEAR ?auto_190739 ) ( ON ?auto_190740 ?auto_190741 ) ( CLEAR ?auto_190740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_190734 ?auto_190735 ?auto_190736 ?auto_190737 ?auto_190738 ?auto_190739 ?auto_190740 )
      ( MAKE-11PILE ?auto_190734 ?auto_190735 ?auto_190736 ?auto_190737 ?auto_190738 ?auto_190739 ?auto_190740 ?auto_190741 ?auto_190742 ?auto_190743 ?auto_190744 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190757 - BLOCK
      ?auto_190758 - BLOCK
      ?auto_190759 - BLOCK
      ?auto_190760 - BLOCK
      ?auto_190761 - BLOCK
      ?auto_190762 - BLOCK
      ?auto_190763 - BLOCK
      ?auto_190764 - BLOCK
      ?auto_190765 - BLOCK
      ?auto_190766 - BLOCK
      ?auto_190767 - BLOCK
    )
    :vars
    (
      ?auto_190768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190767 ?auto_190768 ) ( ON-TABLE ?auto_190757 ) ( ON ?auto_190758 ?auto_190757 ) ( ON ?auto_190759 ?auto_190758 ) ( ON ?auto_190760 ?auto_190759 ) ( ON ?auto_190761 ?auto_190760 ) ( not ( = ?auto_190757 ?auto_190758 ) ) ( not ( = ?auto_190757 ?auto_190759 ) ) ( not ( = ?auto_190757 ?auto_190760 ) ) ( not ( = ?auto_190757 ?auto_190761 ) ) ( not ( = ?auto_190757 ?auto_190762 ) ) ( not ( = ?auto_190757 ?auto_190763 ) ) ( not ( = ?auto_190757 ?auto_190764 ) ) ( not ( = ?auto_190757 ?auto_190765 ) ) ( not ( = ?auto_190757 ?auto_190766 ) ) ( not ( = ?auto_190757 ?auto_190767 ) ) ( not ( = ?auto_190757 ?auto_190768 ) ) ( not ( = ?auto_190758 ?auto_190759 ) ) ( not ( = ?auto_190758 ?auto_190760 ) ) ( not ( = ?auto_190758 ?auto_190761 ) ) ( not ( = ?auto_190758 ?auto_190762 ) ) ( not ( = ?auto_190758 ?auto_190763 ) ) ( not ( = ?auto_190758 ?auto_190764 ) ) ( not ( = ?auto_190758 ?auto_190765 ) ) ( not ( = ?auto_190758 ?auto_190766 ) ) ( not ( = ?auto_190758 ?auto_190767 ) ) ( not ( = ?auto_190758 ?auto_190768 ) ) ( not ( = ?auto_190759 ?auto_190760 ) ) ( not ( = ?auto_190759 ?auto_190761 ) ) ( not ( = ?auto_190759 ?auto_190762 ) ) ( not ( = ?auto_190759 ?auto_190763 ) ) ( not ( = ?auto_190759 ?auto_190764 ) ) ( not ( = ?auto_190759 ?auto_190765 ) ) ( not ( = ?auto_190759 ?auto_190766 ) ) ( not ( = ?auto_190759 ?auto_190767 ) ) ( not ( = ?auto_190759 ?auto_190768 ) ) ( not ( = ?auto_190760 ?auto_190761 ) ) ( not ( = ?auto_190760 ?auto_190762 ) ) ( not ( = ?auto_190760 ?auto_190763 ) ) ( not ( = ?auto_190760 ?auto_190764 ) ) ( not ( = ?auto_190760 ?auto_190765 ) ) ( not ( = ?auto_190760 ?auto_190766 ) ) ( not ( = ?auto_190760 ?auto_190767 ) ) ( not ( = ?auto_190760 ?auto_190768 ) ) ( not ( = ?auto_190761 ?auto_190762 ) ) ( not ( = ?auto_190761 ?auto_190763 ) ) ( not ( = ?auto_190761 ?auto_190764 ) ) ( not ( = ?auto_190761 ?auto_190765 ) ) ( not ( = ?auto_190761 ?auto_190766 ) ) ( not ( = ?auto_190761 ?auto_190767 ) ) ( not ( = ?auto_190761 ?auto_190768 ) ) ( not ( = ?auto_190762 ?auto_190763 ) ) ( not ( = ?auto_190762 ?auto_190764 ) ) ( not ( = ?auto_190762 ?auto_190765 ) ) ( not ( = ?auto_190762 ?auto_190766 ) ) ( not ( = ?auto_190762 ?auto_190767 ) ) ( not ( = ?auto_190762 ?auto_190768 ) ) ( not ( = ?auto_190763 ?auto_190764 ) ) ( not ( = ?auto_190763 ?auto_190765 ) ) ( not ( = ?auto_190763 ?auto_190766 ) ) ( not ( = ?auto_190763 ?auto_190767 ) ) ( not ( = ?auto_190763 ?auto_190768 ) ) ( not ( = ?auto_190764 ?auto_190765 ) ) ( not ( = ?auto_190764 ?auto_190766 ) ) ( not ( = ?auto_190764 ?auto_190767 ) ) ( not ( = ?auto_190764 ?auto_190768 ) ) ( not ( = ?auto_190765 ?auto_190766 ) ) ( not ( = ?auto_190765 ?auto_190767 ) ) ( not ( = ?auto_190765 ?auto_190768 ) ) ( not ( = ?auto_190766 ?auto_190767 ) ) ( not ( = ?auto_190766 ?auto_190768 ) ) ( not ( = ?auto_190767 ?auto_190768 ) ) ( ON ?auto_190766 ?auto_190767 ) ( ON ?auto_190765 ?auto_190766 ) ( ON ?auto_190764 ?auto_190765 ) ( ON ?auto_190763 ?auto_190764 ) ( CLEAR ?auto_190761 ) ( ON ?auto_190762 ?auto_190763 ) ( CLEAR ?auto_190762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190757 ?auto_190758 ?auto_190759 ?auto_190760 ?auto_190761 ?auto_190762 )
      ( MAKE-11PILE ?auto_190757 ?auto_190758 ?auto_190759 ?auto_190760 ?auto_190761 ?auto_190762 ?auto_190763 ?auto_190764 ?auto_190765 ?auto_190766 ?auto_190767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190780 - BLOCK
      ?auto_190781 - BLOCK
      ?auto_190782 - BLOCK
      ?auto_190783 - BLOCK
      ?auto_190784 - BLOCK
      ?auto_190785 - BLOCK
      ?auto_190786 - BLOCK
      ?auto_190787 - BLOCK
      ?auto_190788 - BLOCK
      ?auto_190789 - BLOCK
      ?auto_190790 - BLOCK
    )
    :vars
    (
      ?auto_190791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190790 ?auto_190791 ) ( ON-TABLE ?auto_190780 ) ( ON ?auto_190781 ?auto_190780 ) ( ON ?auto_190782 ?auto_190781 ) ( ON ?auto_190783 ?auto_190782 ) ( ON ?auto_190784 ?auto_190783 ) ( not ( = ?auto_190780 ?auto_190781 ) ) ( not ( = ?auto_190780 ?auto_190782 ) ) ( not ( = ?auto_190780 ?auto_190783 ) ) ( not ( = ?auto_190780 ?auto_190784 ) ) ( not ( = ?auto_190780 ?auto_190785 ) ) ( not ( = ?auto_190780 ?auto_190786 ) ) ( not ( = ?auto_190780 ?auto_190787 ) ) ( not ( = ?auto_190780 ?auto_190788 ) ) ( not ( = ?auto_190780 ?auto_190789 ) ) ( not ( = ?auto_190780 ?auto_190790 ) ) ( not ( = ?auto_190780 ?auto_190791 ) ) ( not ( = ?auto_190781 ?auto_190782 ) ) ( not ( = ?auto_190781 ?auto_190783 ) ) ( not ( = ?auto_190781 ?auto_190784 ) ) ( not ( = ?auto_190781 ?auto_190785 ) ) ( not ( = ?auto_190781 ?auto_190786 ) ) ( not ( = ?auto_190781 ?auto_190787 ) ) ( not ( = ?auto_190781 ?auto_190788 ) ) ( not ( = ?auto_190781 ?auto_190789 ) ) ( not ( = ?auto_190781 ?auto_190790 ) ) ( not ( = ?auto_190781 ?auto_190791 ) ) ( not ( = ?auto_190782 ?auto_190783 ) ) ( not ( = ?auto_190782 ?auto_190784 ) ) ( not ( = ?auto_190782 ?auto_190785 ) ) ( not ( = ?auto_190782 ?auto_190786 ) ) ( not ( = ?auto_190782 ?auto_190787 ) ) ( not ( = ?auto_190782 ?auto_190788 ) ) ( not ( = ?auto_190782 ?auto_190789 ) ) ( not ( = ?auto_190782 ?auto_190790 ) ) ( not ( = ?auto_190782 ?auto_190791 ) ) ( not ( = ?auto_190783 ?auto_190784 ) ) ( not ( = ?auto_190783 ?auto_190785 ) ) ( not ( = ?auto_190783 ?auto_190786 ) ) ( not ( = ?auto_190783 ?auto_190787 ) ) ( not ( = ?auto_190783 ?auto_190788 ) ) ( not ( = ?auto_190783 ?auto_190789 ) ) ( not ( = ?auto_190783 ?auto_190790 ) ) ( not ( = ?auto_190783 ?auto_190791 ) ) ( not ( = ?auto_190784 ?auto_190785 ) ) ( not ( = ?auto_190784 ?auto_190786 ) ) ( not ( = ?auto_190784 ?auto_190787 ) ) ( not ( = ?auto_190784 ?auto_190788 ) ) ( not ( = ?auto_190784 ?auto_190789 ) ) ( not ( = ?auto_190784 ?auto_190790 ) ) ( not ( = ?auto_190784 ?auto_190791 ) ) ( not ( = ?auto_190785 ?auto_190786 ) ) ( not ( = ?auto_190785 ?auto_190787 ) ) ( not ( = ?auto_190785 ?auto_190788 ) ) ( not ( = ?auto_190785 ?auto_190789 ) ) ( not ( = ?auto_190785 ?auto_190790 ) ) ( not ( = ?auto_190785 ?auto_190791 ) ) ( not ( = ?auto_190786 ?auto_190787 ) ) ( not ( = ?auto_190786 ?auto_190788 ) ) ( not ( = ?auto_190786 ?auto_190789 ) ) ( not ( = ?auto_190786 ?auto_190790 ) ) ( not ( = ?auto_190786 ?auto_190791 ) ) ( not ( = ?auto_190787 ?auto_190788 ) ) ( not ( = ?auto_190787 ?auto_190789 ) ) ( not ( = ?auto_190787 ?auto_190790 ) ) ( not ( = ?auto_190787 ?auto_190791 ) ) ( not ( = ?auto_190788 ?auto_190789 ) ) ( not ( = ?auto_190788 ?auto_190790 ) ) ( not ( = ?auto_190788 ?auto_190791 ) ) ( not ( = ?auto_190789 ?auto_190790 ) ) ( not ( = ?auto_190789 ?auto_190791 ) ) ( not ( = ?auto_190790 ?auto_190791 ) ) ( ON ?auto_190789 ?auto_190790 ) ( ON ?auto_190788 ?auto_190789 ) ( ON ?auto_190787 ?auto_190788 ) ( ON ?auto_190786 ?auto_190787 ) ( CLEAR ?auto_190784 ) ( ON ?auto_190785 ?auto_190786 ) ( CLEAR ?auto_190785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_190780 ?auto_190781 ?auto_190782 ?auto_190783 ?auto_190784 ?auto_190785 )
      ( MAKE-11PILE ?auto_190780 ?auto_190781 ?auto_190782 ?auto_190783 ?auto_190784 ?auto_190785 ?auto_190786 ?auto_190787 ?auto_190788 ?auto_190789 ?auto_190790 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190803 - BLOCK
      ?auto_190804 - BLOCK
      ?auto_190805 - BLOCK
      ?auto_190806 - BLOCK
      ?auto_190807 - BLOCK
      ?auto_190808 - BLOCK
      ?auto_190809 - BLOCK
      ?auto_190810 - BLOCK
      ?auto_190811 - BLOCK
      ?auto_190812 - BLOCK
      ?auto_190813 - BLOCK
    )
    :vars
    (
      ?auto_190814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190813 ?auto_190814 ) ( ON-TABLE ?auto_190803 ) ( ON ?auto_190804 ?auto_190803 ) ( ON ?auto_190805 ?auto_190804 ) ( ON ?auto_190806 ?auto_190805 ) ( not ( = ?auto_190803 ?auto_190804 ) ) ( not ( = ?auto_190803 ?auto_190805 ) ) ( not ( = ?auto_190803 ?auto_190806 ) ) ( not ( = ?auto_190803 ?auto_190807 ) ) ( not ( = ?auto_190803 ?auto_190808 ) ) ( not ( = ?auto_190803 ?auto_190809 ) ) ( not ( = ?auto_190803 ?auto_190810 ) ) ( not ( = ?auto_190803 ?auto_190811 ) ) ( not ( = ?auto_190803 ?auto_190812 ) ) ( not ( = ?auto_190803 ?auto_190813 ) ) ( not ( = ?auto_190803 ?auto_190814 ) ) ( not ( = ?auto_190804 ?auto_190805 ) ) ( not ( = ?auto_190804 ?auto_190806 ) ) ( not ( = ?auto_190804 ?auto_190807 ) ) ( not ( = ?auto_190804 ?auto_190808 ) ) ( not ( = ?auto_190804 ?auto_190809 ) ) ( not ( = ?auto_190804 ?auto_190810 ) ) ( not ( = ?auto_190804 ?auto_190811 ) ) ( not ( = ?auto_190804 ?auto_190812 ) ) ( not ( = ?auto_190804 ?auto_190813 ) ) ( not ( = ?auto_190804 ?auto_190814 ) ) ( not ( = ?auto_190805 ?auto_190806 ) ) ( not ( = ?auto_190805 ?auto_190807 ) ) ( not ( = ?auto_190805 ?auto_190808 ) ) ( not ( = ?auto_190805 ?auto_190809 ) ) ( not ( = ?auto_190805 ?auto_190810 ) ) ( not ( = ?auto_190805 ?auto_190811 ) ) ( not ( = ?auto_190805 ?auto_190812 ) ) ( not ( = ?auto_190805 ?auto_190813 ) ) ( not ( = ?auto_190805 ?auto_190814 ) ) ( not ( = ?auto_190806 ?auto_190807 ) ) ( not ( = ?auto_190806 ?auto_190808 ) ) ( not ( = ?auto_190806 ?auto_190809 ) ) ( not ( = ?auto_190806 ?auto_190810 ) ) ( not ( = ?auto_190806 ?auto_190811 ) ) ( not ( = ?auto_190806 ?auto_190812 ) ) ( not ( = ?auto_190806 ?auto_190813 ) ) ( not ( = ?auto_190806 ?auto_190814 ) ) ( not ( = ?auto_190807 ?auto_190808 ) ) ( not ( = ?auto_190807 ?auto_190809 ) ) ( not ( = ?auto_190807 ?auto_190810 ) ) ( not ( = ?auto_190807 ?auto_190811 ) ) ( not ( = ?auto_190807 ?auto_190812 ) ) ( not ( = ?auto_190807 ?auto_190813 ) ) ( not ( = ?auto_190807 ?auto_190814 ) ) ( not ( = ?auto_190808 ?auto_190809 ) ) ( not ( = ?auto_190808 ?auto_190810 ) ) ( not ( = ?auto_190808 ?auto_190811 ) ) ( not ( = ?auto_190808 ?auto_190812 ) ) ( not ( = ?auto_190808 ?auto_190813 ) ) ( not ( = ?auto_190808 ?auto_190814 ) ) ( not ( = ?auto_190809 ?auto_190810 ) ) ( not ( = ?auto_190809 ?auto_190811 ) ) ( not ( = ?auto_190809 ?auto_190812 ) ) ( not ( = ?auto_190809 ?auto_190813 ) ) ( not ( = ?auto_190809 ?auto_190814 ) ) ( not ( = ?auto_190810 ?auto_190811 ) ) ( not ( = ?auto_190810 ?auto_190812 ) ) ( not ( = ?auto_190810 ?auto_190813 ) ) ( not ( = ?auto_190810 ?auto_190814 ) ) ( not ( = ?auto_190811 ?auto_190812 ) ) ( not ( = ?auto_190811 ?auto_190813 ) ) ( not ( = ?auto_190811 ?auto_190814 ) ) ( not ( = ?auto_190812 ?auto_190813 ) ) ( not ( = ?auto_190812 ?auto_190814 ) ) ( not ( = ?auto_190813 ?auto_190814 ) ) ( ON ?auto_190812 ?auto_190813 ) ( ON ?auto_190811 ?auto_190812 ) ( ON ?auto_190810 ?auto_190811 ) ( ON ?auto_190809 ?auto_190810 ) ( ON ?auto_190808 ?auto_190809 ) ( CLEAR ?auto_190806 ) ( ON ?auto_190807 ?auto_190808 ) ( CLEAR ?auto_190807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190803 ?auto_190804 ?auto_190805 ?auto_190806 ?auto_190807 )
      ( MAKE-11PILE ?auto_190803 ?auto_190804 ?auto_190805 ?auto_190806 ?auto_190807 ?auto_190808 ?auto_190809 ?auto_190810 ?auto_190811 ?auto_190812 ?auto_190813 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190826 - BLOCK
      ?auto_190827 - BLOCK
      ?auto_190828 - BLOCK
      ?auto_190829 - BLOCK
      ?auto_190830 - BLOCK
      ?auto_190831 - BLOCK
      ?auto_190832 - BLOCK
      ?auto_190833 - BLOCK
      ?auto_190834 - BLOCK
      ?auto_190835 - BLOCK
      ?auto_190836 - BLOCK
    )
    :vars
    (
      ?auto_190837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190836 ?auto_190837 ) ( ON-TABLE ?auto_190826 ) ( ON ?auto_190827 ?auto_190826 ) ( ON ?auto_190828 ?auto_190827 ) ( ON ?auto_190829 ?auto_190828 ) ( not ( = ?auto_190826 ?auto_190827 ) ) ( not ( = ?auto_190826 ?auto_190828 ) ) ( not ( = ?auto_190826 ?auto_190829 ) ) ( not ( = ?auto_190826 ?auto_190830 ) ) ( not ( = ?auto_190826 ?auto_190831 ) ) ( not ( = ?auto_190826 ?auto_190832 ) ) ( not ( = ?auto_190826 ?auto_190833 ) ) ( not ( = ?auto_190826 ?auto_190834 ) ) ( not ( = ?auto_190826 ?auto_190835 ) ) ( not ( = ?auto_190826 ?auto_190836 ) ) ( not ( = ?auto_190826 ?auto_190837 ) ) ( not ( = ?auto_190827 ?auto_190828 ) ) ( not ( = ?auto_190827 ?auto_190829 ) ) ( not ( = ?auto_190827 ?auto_190830 ) ) ( not ( = ?auto_190827 ?auto_190831 ) ) ( not ( = ?auto_190827 ?auto_190832 ) ) ( not ( = ?auto_190827 ?auto_190833 ) ) ( not ( = ?auto_190827 ?auto_190834 ) ) ( not ( = ?auto_190827 ?auto_190835 ) ) ( not ( = ?auto_190827 ?auto_190836 ) ) ( not ( = ?auto_190827 ?auto_190837 ) ) ( not ( = ?auto_190828 ?auto_190829 ) ) ( not ( = ?auto_190828 ?auto_190830 ) ) ( not ( = ?auto_190828 ?auto_190831 ) ) ( not ( = ?auto_190828 ?auto_190832 ) ) ( not ( = ?auto_190828 ?auto_190833 ) ) ( not ( = ?auto_190828 ?auto_190834 ) ) ( not ( = ?auto_190828 ?auto_190835 ) ) ( not ( = ?auto_190828 ?auto_190836 ) ) ( not ( = ?auto_190828 ?auto_190837 ) ) ( not ( = ?auto_190829 ?auto_190830 ) ) ( not ( = ?auto_190829 ?auto_190831 ) ) ( not ( = ?auto_190829 ?auto_190832 ) ) ( not ( = ?auto_190829 ?auto_190833 ) ) ( not ( = ?auto_190829 ?auto_190834 ) ) ( not ( = ?auto_190829 ?auto_190835 ) ) ( not ( = ?auto_190829 ?auto_190836 ) ) ( not ( = ?auto_190829 ?auto_190837 ) ) ( not ( = ?auto_190830 ?auto_190831 ) ) ( not ( = ?auto_190830 ?auto_190832 ) ) ( not ( = ?auto_190830 ?auto_190833 ) ) ( not ( = ?auto_190830 ?auto_190834 ) ) ( not ( = ?auto_190830 ?auto_190835 ) ) ( not ( = ?auto_190830 ?auto_190836 ) ) ( not ( = ?auto_190830 ?auto_190837 ) ) ( not ( = ?auto_190831 ?auto_190832 ) ) ( not ( = ?auto_190831 ?auto_190833 ) ) ( not ( = ?auto_190831 ?auto_190834 ) ) ( not ( = ?auto_190831 ?auto_190835 ) ) ( not ( = ?auto_190831 ?auto_190836 ) ) ( not ( = ?auto_190831 ?auto_190837 ) ) ( not ( = ?auto_190832 ?auto_190833 ) ) ( not ( = ?auto_190832 ?auto_190834 ) ) ( not ( = ?auto_190832 ?auto_190835 ) ) ( not ( = ?auto_190832 ?auto_190836 ) ) ( not ( = ?auto_190832 ?auto_190837 ) ) ( not ( = ?auto_190833 ?auto_190834 ) ) ( not ( = ?auto_190833 ?auto_190835 ) ) ( not ( = ?auto_190833 ?auto_190836 ) ) ( not ( = ?auto_190833 ?auto_190837 ) ) ( not ( = ?auto_190834 ?auto_190835 ) ) ( not ( = ?auto_190834 ?auto_190836 ) ) ( not ( = ?auto_190834 ?auto_190837 ) ) ( not ( = ?auto_190835 ?auto_190836 ) ) ( not ( = ?auto_190835 ?auto_190837 ) ) ( not ( = ?auto_190836 ?auto_190837 ) ) ( ON ?auto_190835 ?auto_190836 ) ( ON ?auto_190834 ?auto_190835 ) ( ON ?auto_190833 ?auto_190834 ) ( ON ?auto_190832 ?auto_190833 ) ( ON ?auto_190831 ?auto_190832 ) ( CLEAR ?auto_190829 ) ( ON ?auto_190830 ?auto_190831 ) ( CLEAR ?auto_190830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_190826 ?auto_190827 ?auto_190828 ?auto_190829 ?auto_190830 )
      ( MAKE-11PILE ?auto_190826 ?auto_190827 ?auto_190828 ?auto_190829 ?auto_190830 ?auto_190831 ?auto_190832 ?auto_190833 ?auto_190834 ?auto_190835 ?auto_190836 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190849 - BLOCK
      ?auto_190850 - BLOCK
      ?auto_190851 - BLOCK
      ?auto_190852 - BLOCK
      ?auto_190853 - BLOCK
      ?auto_190854 - BLOCK
      ?auto_190855 - BLOCK
      ?auto_190856 - BLOCK
      ?auto_190857 - BLOCK
      ?auto_190858 - BLOCK
      ?auto_190859 - BLOCK
    )
    :vars
    (
      ?auto_190860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190859 ?auto_190860 ) ( ON-TABLE ?auto_190849 ) ( ON ?auto_190850 ?auto_190849 ) ( ON ?auto_190851 ?auto_190850 ) ( not ( = ?auto_190849 ?auto_190850 ) ) ( not ( = ?auto_190849 ?auto_190851 ) ) ( not ( = ?auto_190849 ?auto_190852 ) ) ( not ( = ?auto_190849 ?auto_190853 ) ) ( not ( = ?auto_190849 ?auto_190854 ) ) ( not ( = ?auto_190849 ?auto_190855 ) ) ( not ( = ?auto_190849 ?auto_190856 ) ) ( not ( = ?auto_190849 ?auto_190857 ) ) ( not ( = ?auto_190849 ?auto_190858 ) ) ( not ( = ?auto_190849 ?auto_190859 ) ) ( not ( = ?auto_190849 ?auto_190860 ) ) ( not ( = ?auto_190850 ?auto_190851 ) ) ( not ( = ?auto_190850 ?auto_190852 ) ) ( not ( = ?auto_190850 ?auto_190853 ) ) ( not ( = ?auto_190850 ?auto_190854 ) ) ( not ( = ?auto_190850 ?auto_190855 ) ) ( not ( = ?auto_190850 ?auto_190856 ) ) ( not ( = ?auto_190850 ?auto_190857 ) ) ( not ( = ?auto_190850 ?auto_190858 ) ) ( not ( = ?auto_190850 ?auto_190859 ) ) ( not ( = ?auto_190850 ?auto_190860 ) ) ( not ( = ?auto_190851 ?auto_190852 ) ) ( not ( = ?auto_190851 ?auto_190853 ) ) ( not ( = ?auto_190851 ?auto_190854 ) ) ( not ( = ?auto_190851 ?auto_190855 ) ) ( not ( = ?auto_190851 ?auto_190856 ) ) ( not ( = ?auto_190851 ?auto_190857 ) ) ( not ( = ?auto_190851 ?auto_190858 ) ) ( not ( = ?auto_190851 ?auto_190859 ) ) ( not ( = ?auto_190851 ?auto_190860 ) ) ( not ( = ?auto_190852 ?auto_190853 ) ) ( not ( = ?auto_190852 ?auto_190854 ) ) ( not ( = ?auto_190852 ?auto_190855 ) ) ( not ( = ?auto_190852 ?auto_190856 ) ) ( not ( = ?auto_190852 ?auto_190857 ) ) ( not ( = ?auto_190852 ?auto_190858 ) ) ( not ( = ?auto_190852 ?auto_190859 ) ) ( not ( = ?auto_190852 ?auto_190860 ) ) ( not ( = ?auto_190853 ?auto_190854 ) ) ( not ( = ?auto_190853 ?auto_190855 ) ) ( not ( = ?auto_190853 ?auto_190856 ) ) ( not ( = ?auto_190853 ?auto_190857 ) ) ( not ( = ?auto_190853 ?auto_190858 ) ) ( not ( = ?auto_190853 ?auto_190859 ) ) ( not ( = ?auto_190853 ?auto_190860 ) ) ( not ( = ?auto_190854 ?auto_190855 ) ) ( not ( = ?auto_190854 ?auto_190856 ) ) ( not ( = ?auto_190854 ?auto_190857 ) ) ( not ( = ?auto_190854 ?auto_190858 ) ) ( not ( = ?auto_190854 ?auto_190859 ) ) ( not ( = ?auto_190854 ?auto_190860 ) ) ( not ( = ?auto_190855 ?auto_190856 ) ) ( not ( = ?auto_190855 ?auto_190857 ) ) ( not ( = ?auto_190855 ?auto_190858 ) ) ( not ( = ?auto_190855 ?auto_190859 ) ) ( not ( = ?auto_190855 ?auto_190860 ) ) ( not ( = ?auto_190856 ?auto_190857 ) ) ( not ( = ?auto_190856 ?auto_190858 ) ) ( not ( = ?auto_190856 ?auto_190859 ) ) ( not ( = ?auto_190856 ?auto_190860 ) ) ( not ( = ?auto_190857 ?auto_190858 ) ) ( not ( = ?auto_190857 ?auto_190859 ) ) ( not ( = ?auto_190857 ?auto_190860 ) ) ( not ( = ?auto_190858 ?auto_190859 ) ) ( not ( = ?auto_190858 ?auto_190860 ) ) ( not ( = ?auto_190859 ?auto_190860 ) ) ( ON ?auto_190858 ?auto_190859 ) ( ON ?auto_190857 ?auto_190858 ) ( ON ?auto_190856 ?auto_190857 ) ( ON ?auto_190855 ?auto_190856 ) ( ON ?auto_190854 ?auto_190855 ) ( ON ?auto_190853 ?auto_190854 ) ( CLEAR ?auto_190851 ) ( ON ?auto_190852 ?auto_190853 ) ( CLEAR ?auto_190852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190849 ?auto_190850 ?auto_190851 ?auto_190852 )
      ( MAKE-11PILE ?auto_190849 ?auto_190850 ?auto_190851 ?auto_190852 ?auto_190853 ?auto_190854 ?auto_190855 ?auto_190856 ?auto_190857 ?auto_190858 ?auto_190859 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190872 - BLOCK
      ?auto_190873 - BLOCK
      ?auto_190874 - BLOCK
      ?auto_190875 - BLOCK
      ?auto_190876 - BLOCK
      ?auto_190877 - BLOCK
      ?auto_190878 - BLOCK
      ?auto_190879 - BLOCK
      ?auto_190880 - BLOCK
      ?auto_190881 - BLOCK
      ?auto_190882 - BLOCK
    )
    :vars
    (
      ?auto_190883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190882 ?auto_190883 ) ( ON-TABLE ?auto_190872 ) ( ON ?auto_190873 ?auto_190872 ) ( ON ?auto_190874 ?auto_190873 ) ( not ( = ?auto_190872 ?auto_190873 ) ) ( not ( = ?auto_190872 ?auto_190874 ) ) ( not ( = ?auto_190872 ?auto_190875 ) ) ( not ( = ?auto_190872 ?auto_190876 ) ) ( not ( = ?auto_190872 ?auto_190877 ) ) ( not ( = ?auto_190872 ?auto_190878 ) ) ( not ( = ?auto_190872 ?auto_190879 ) ) ( not ( = ?auto_190872 ?auto_190880 ) ) ( not ( = ?auto_190872 ?auto_190881 ) ) ( not ( = ?auto_190872 ?auto_190882 ) ) ( not ( = ?auto_190872 ?auto_190883 ) ) ( not ( = ?auto_190873 ?auto_190874 ) ) ( not ( = ?auto_190873 ?auto_190875 ) ) ( not ( = ?auto_190873 ?auto_190876 ) ) ( not ( = ?auto_190873 ?auto_190877 ) ) ( not ( = ?auto_190873 ?auto_190878 ) ) ( not ( = ?auto_190873 ?auto_190879 ) ) ( not ( = ?auto_190873 ?auto_190880 ) ) ( not ( = ?auto_190873 ?auto_190881 ) ) ( not ( = ?auto_190873 ?auto_190882 ) ) ( not ( = ?auto_190873 ?auto_190883 ) ) ( not ( = ?auto_190874 ?auto_190875 ) ) ( not ( = ?auto_190874 ?auto_190876 ) ) ( not ( = ?auto_190874 ?auto_190877 ) ) ( not ( = ?auto_190874 ?auto_190878 ) ) ( not ( = ?auto_190874 ?auto_190879 ) ) ( not ( = ?auto_190874 ?auto_190880 ) ) ( not ( = ?auto_190874 ?auto_190881 ) ) ( not ( = ?auto_190874 ?auto_190882 ) ) ( not ( = ?auto_190874 ?auto_190883 ) ) ( not ( = ?auto_190875 ?auto_190876 ) ) ( not ( = ?auto_190875 ?auto_190877 ) ) ( not ( = ?auto_190875 ?auto_190878 ) ) ( not ( = ?auto_190875 ?auto_190879 ) ) ( not ( = ?auto_190875 ?auto_190880 ) ) ( not ( = ?auto_190875 ?auto_190881 ) ) ( not ( = ?auto_190875 ?auto_190882 ) ) ( not ( = ?auto_190875 ?auto_190883 ) ) ( not ( = ?auto_190876 ?auto_190877 ) ) ( not ( = ?auto_190876 ?auto_190878 ) ) ( not ( = ?auto_190876 ?auto_190879 ) ) ( not ( = ?auto_190876 ?auto_190880 ) ) ( not ( = ?auto_190876 ?auto_190881 ) ) ( not ( = ?auto_190876 ?auto_190882 ) ) ( not ( = ?auto_190876 ?auto_190883 ) ) ( not ( = ?auto_190877 ?auto_190878 ) ) ( not ( = ?auto_190877 ?auto_190879 ) ) ( not ( = ?auto_190877 ?auto_190880 ) ) ( not ( = ?auto_190877 ?auto_190881 ) ) ( not ( = ?auto_190877 ?auto_190882 ) ) ( not ( = ?auto_190877 ?auto_190883 ) ) ( not ( = ?auto_190878 ?auto_190879 ) ) ( not ( = ?auto_190878 ?auto_190880 ) ) ( not ( = ?auto_190878 ?auto_190881 ) ) ( not ( = ?auto_190878 ?auto_190882 ) ) ( not ( = ?auto_190878 ?auto_190883 ) ) ( not ( = ?auto_190879 ?auto_190880 ) ) ( not ( = ?auto_190879 ?auto_190881 ) ) ( not ( = ?auto_190879 ?auto_190882 ) ) ( not ( = ?auto_190879 ?auto_190883 ) ) ( not ( = ?auto_190880 ?auto_190881 ) ) ( not ( = ?auto_190880 ?auto_190882 ) ) ( not ( = ?auto_190880 ?auto_190883 ) ) ( not ( = ?auto_190881 ?auto_190882 ) ) ( not ( = ?auto_190881 ?auto_190883 ) ) ( not ( = ?auto_190882 ?auto_190883 ) ) ( ON ?auto_190881 ?auto_190882 ) ( ON ?auto_190880 ?auto_190881 ) ( ON ?auto_190879 ?auto_190880 ) ( ON ?auto_190878 ?auto_190879 ) ( ON ?auto_190877 ?auto_190878 ) ( ON ?auto_190876 ?auto_190877 ) ( CLEAR ?auto_190874 ) ( ON ?auto_190875 ?auto_190876 ) ( CLEAR ?auto_190875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_190872 ?auto_190873 ?auto_190874 ?auto_190875 )
      ( MAKE-11PILE ?auto_190872 ?auto_190873 ?auto_190874 ?auto_190875 ?auto_190876 ?auto_190877 ?auto_190878 ?auto_190879 ?auto_190880 ?auto_190881 ?auto_190882 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190895 - BLOCK
      ?auto_190896 - BLOCK
      ?auto_190897 - BLOCK
      ?auto_190898 - BLOCK
      ?auto_190899 - BLOCK
      ?auto_190900 - BLOCK
      ?auto_190901 - BLOCK
      ?auto_190902 - BLOCK
      ?auto_190903 - BLOCK
      ?auto_190904 - BLOCK
      ?auto_190905 - BLOCK
    )
    :vars
    (
      ?auto_190906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190905 ?auto_190906 ) ( ON-TABLE ?auto_190895 ) ( ON ?auto_190896 ?auto_190895 ) ( not ( = ?auto_190895 ?auto_190896 ) ) ( not ( = ?auto_190895 ?auto_190897 ) ) ( not ( = ?auto_190895 ?auto_190898 ) ) ( not ( = ?auto_190895 ?auto_190899 ) ) ( not ( = ?auto_190895 ?auto_190900 ) ) ( not ( = ?auto_190895 ?auto_190901 ) ) ( not ( = ?auto_190895 ?auto_190902 ) ) ( not ( = ?auto_190895 ?auto_190903 ) ) ( not ( = ?auto_190895 ?auto_190904 ) ) ( not ( = ?auto_190895 ?auto_190905 ) ) ( not ( = ?auto_190895 ?auto_190906 ) ) ( not ( = ?auto_190896 ?auto_190897 ) ) ( not ( = ?auto_190896 ?auto_190898 ) ) ( not ( = ?auto_190896 ?auto_190899 ) ) ( not ( = ?auto_190896 ?auto_190900 ) ) ( not ( = ?auto_190896 ?auto_190901 ) ) ( not ( = ?auto_190896 ?auto_190902 ) ) ( not ( = ?auto_190896 ?auto_190903 ) ) ( not ( = ?auto_190896 ?auto_190904 ) ) ( not ( = ?auto_190896 ?auto_190905 ) ) ( not ( = ?auto_190896 ?auto_190906 ) ) ( not ( = ?auto_190897 ?auto_190898 ) ) ( not ( = ?auto_190897 ?auto_190899 ) ) ( not ( = ?auto_190897 ?auto_190900 ) ) ( not ( = ?auto_190897 ?auto_190901 ) ) ( not ( = ?auto_190897 ?auto_190902 ) ) ( not ( = ?auto_190897 ?auto_190903 ) ) ( not ( = ?auto_190897 ?auto_190904 ) ) ( not ( = ?auto_190897 ?auto_190905 ) ) ( not ( = ?auto_190897 ?auto_190906 ) ) ( not ( = ?auto_190898 ?auto_190899 ) ) ( not ( = ?auto_190898 ?auto_190900 ) ) ( not ( = ?auto_190898 ?auto_190901 ) ) ( not ( = ?auto_190898 ?auto_190902 ) ) ( not ( = ?auto_190898 ?auto_190903 ) ) ( not ( = ?auto_190898 ?auto_190904 ) ) ( not ( = ?auto_190898 ?auto_190905 ) ) ( not ( = ?auto_190898 ?auto_190906 ) ) ( not ( = ?auto_190899 ?auto_190900 ) ) ( not ( = ?auto_190899 ?auto_190901 ) ) ( not ( = ?auto_190899 ?auto_190902 ) ) ( not ( = ?auto_190899 ?auto_190903 ) ) ( not ( = ?auto_190899 ?auto_190904 ) ) ( not ( = ?auto_190899 ?auto_190905 ) ) ( not ( = ?auto_190899 ?auto_190906 ) ) ( not ( = ?auto_190900 ?auto_190901 ) ) ( not ( = ?auto_190900 ?auto_190902 ) ) ( not ( = ?auto_190900 ?auto_190903 ) ) ( not ( = ?auto_190900 ?auto_190904 ) ) ( not ( = ?auto_190900 ?auto_190905 ) ) ( not ( = ?auto_190900 ?auto_190906 ) ) ( not ( = ?auto_190901 ?auto_190902 ) ) ( not ( = ?auto_190901 ?auto_190903 ) ) ( not ( = ?auto_190901 ?auto_190904 ) ) ( not ( = ?auto_190901 ?auto_190905 ) ) ( not ( = ?auto_190901 ?auto_190906 ) ) ( not ( = ?auto_190902 ?auto_190903 ) ) ( not ( = ?auto_190902 ?auto_190904 ) ) ( not ( = ?auto_190902 ?auto_190905 ) ) ( not ( = ?auto_190902 ?auto_190906 ) ) ( not ( = ?auto_190903 ?auto_190904 ) ) ( not ( = ?auto_190903 ?auto_190905 ) ) ( not ( = ?auto_190903 ?auto_190906 ) ) ( not ( = ?auto_190904 ?auto_190905 ) ) ( not ( = ?auto_190904 ?auto_190906 ) ) ( not ( = ?auto_190905 ?auto_190906 ) ) ( ON ?auto_190904 ?auto_190905 ) ( ON ?auto_190903 ?auto_190904 ) ( ON ?auto_190902 ?auto_190903 ) ( ON ?auto_190901 ?auto_190902 ) ( ON ?auto_190900 ?auto_190901 ) ( ON ?auto_190899 ?auto_190900 ) ( ON ?auto_190898 ?auto_190899 ) ( CLEAR ?auto_190896 ) ( ON ?auto_190897 ?auto_190898 ) ( CLEAR ?auto_190897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190895 ?auto_190896 ?auto_190897 )
      ( MAKE-11PILE ?auto_190895 ?auto_190896 ?auto_190897 ?auto_190898 ?auto_190899 ?auto_190900 ?auto_190901 ?auto_190902 ?auto_190903 ?auto_190904 ?auto_190905 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190918 - BLOCK
      ?auto_190919 - BLOCK
      ?auto_190920 - BLOCK
      ?auto_190921 - BLOCK
      ?auto_190922 - BLOCK
      ?auto_190923 - BLOCK
      ?auto_190924 - BLOCK
      ?auto_190925 - BLOCK
      ?auto_190926 - BLOCK
      ?auto_190927 - BLOCK
      ?auto_190928 - BLOCK
    )
    :vars
    (
      ?auto_190929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190928 ?auto_190929 ) ( ON-TABLE ?auto_190918 ) ( ON ?auto_190919 ?auto_190918 ) ( not ( = ?auto_190918 ?auto_190919 ) ) ( not ( = ?auto_190918 ?auto_190920 ) ) ( not ( = ?auto_190918 ?auto_190921 ) ) ( not ( = ?auto_190918 ?auto_190922 ) ) ( not ( = ?auto_190918 ?auto_190923 ) ) ( not ( = ?auto_190918 ?auto_190924 ) ) ( not ( = ?auto_190918 ?auto_190925 ) ) ( not ( = ?auto_190918 ?auto_190926 ) ) ( not ( = ?auto_190918 ?auto_190927 ) ) ( not ( = ?auto_190918 ?auto_190928 ) ) ( not ( = ?auto_190918 ?auto_190929 ) ) ( not ( = ?auto_190919 ?auto_190920 ) ) ( not ( = ?auto_190919 ?auto_190921 ) ) ( not ( = ?auto_190919 ?auto_190922 ) ) ( not ( = ?auto_190919 ?auto_190923 ) ) ( not ( = ?auto_190919 ?auto_190924 ) ) ( not ( = ?auto_190919 ?auto_190925 ) ) ( not ( = ?auto_190919 ?auto_190926 ) ) ( not ( = ?auto_190919 ?auto_190927 ) ) ( not ( = ?auto_190919 ?auto_190928 ) ) ( not ( = ?auto_190919 ?auto_190929 ) ) ( not ( = ?auto_190920 ?auto_190921 ) ) ( not ( = ?auto_190920 ?auto_190922 ) ) ( not ( = ?auto_190920 ?auto_190923 ) ) ( not ( = ?auto_190920 ?auto_190924 ) ) ( not ( = ?auto_190920 ?auto_190925 ) ) ( not ( = ?auto_190920 ?auto_190926 ) ) ( not ( = ?auto_190920 ?auto_190927 ) ) ( not ( = ?auto_190920 ?auto_190928 ) ) ( not ( = ?auto_190920 ?auto_190929 ) ) ( not ( = ?auto_190921 ?auto_190922 ) ) ( not ( = ?auto_190921 ?auto_190923 ) ) ( not ( = ?auto_190921 ?auto_190924 ) ) ( not ( = ?auto_190921 ?auto_190925 ) ) ( not ( = ?auto_190921 ?auto_190926 ) ) ( not ( = ?auto_190921 ?auto_190927 ) ) ( not ( = ?auto_190921 ?auto_190928 ) ) ( not ( = ?auto_190921 ?auto_190929 ) ) ( not ( = ?auto_190922 ?auto_190923 ) ) ( not ( = ?auto_190922 ?auto_190924 ) ) ( not ( = ?auto_190922 ?auto_190925 ) ) ( not ( = ?auto_190922 ?auto_190926 ) ) ( not ( = ?auto_190922 ?auto_190927 ) ) ( not ( = ?auto_190922 ?auto_190928 ) ) ( not ( = ?auto_190922 ?auto_190929 ) ) ( not ( = ?auto_190923 ?auto_190924 ) ) ( not ( = ?auto_190923 ?auto_190925 ) ) ( not ( = ?auto_190923 ?auto_190926 ) ) ( not ( = ?auto_190923 ?auto_190927 ) ) ( not ( = ?auto_190923 ?auto_190928 ) ) ( not ( = ?auto_190923 ?auto_190929 ) ) ( not ( = ?auto_190924 ?auto_190925 ) ) ( not ( = ?auto_190924 ?auto_190926 ) ) ( not ( = ?auto_190924 ?auto_190927 ) ) ( not ( = ?auto_190924 ?auto_190928 ) ) ( not ( = ?auto_190924 ?auto_190929 ) ) ( not ( = ?auto_190925 ?auto_190926 ) ) ( not ( = ?auto_190925 ?auto_190927 ) ) ( not ( = ?auto_190925 ?auto_190928 ) ) ( not ( = ?auto_190925 ?auto_190929 ) ) ( not ( = ?auto_190926 ?auto_190927 ) ) ( not ( = ?auto_190926 ?auto_190928 ) ) ( not ( = ?auto_190926 ?auto_190929 ) ) ( not ( = ?auto_190927 ?auto_190928 ) ) ( not ( = ?auto_190927 ?auto_190929 ) ) ( not ( = ?auto_190928 ?auto_190929 ) ) ( ON ?auto_190927 ?auto_190928 ) ( ON ?auto_190926 ?auto_190927 ) ( ON ?auto_190925 ?auto_190926 ) ( ON ?auto_190924 ?auto_190925 ) ( ON ?auto_190923 ?auto_190924 ) ( ON ?auto_190922 ?auto_190923 ) ( ON ?auto_190921 ?auto_190922 ) ( CLEAR ?auto_190919 ) ( ON ?auto_190920 ?auto_190921 ) ( CLEAR ?auto_190920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_190918 ?auto_190919 ?auto_190920 )
      ( MAKE-11PILE ?auto_190918 ?auto_190919 ?auto_190920 ?auto_190921 ?auto_190922 ?auto_190923 ?auto_190924 ?auto_190925 ?auto_190926 ?auto_190927 ?auto_190928 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190941 - BLOCK
      ?auto_190942 - BLOCK
      ?auto_190943 - BLOCK
      ?auto_190944 - BLOCK
      ?auto_190945 - BLOCK
      ?auto_190946 - BLOCK
      ?auto_190947 - BLOCK
      ?auto_190948 - BLOCK
      ?auto_190949 - BLOCK
      ?auto_190950 - BLOCK
      ?auto_190951 - BLOCK
    )
    :vars
    (
      ?auto_190952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190951 ?auto_190952 ) ( ON-TABLE ?auto_190941 ) ( not ( = ?auto_190941 ?auto_190942 ) ) ( not ( = ?auto_190941 ?auto_190943 ) ) ( not ( = ?auto_190941 ?auto_190944 ) ) ( not ( = ?auto_190941 ?auto_190945 ) ) ( not ( = ?auto_190941 ?auto_190946 ) ) ( not ( = ?auto_190941 ?auto_190947 ) ) ( not ( = ?auto_190941 ?auto_190948 ) ) ( not ( = ?auto_190941 ?auto_190949 ) ) ( not ( = ?auto_190941 ?auto_190950 ) ) ( not ( = ?auto_190941 ?auto_190951 ) ) ( not ( = ?auto_190941 ?auto_190952 ) ) ( not ( = ?auto_190942 ?auto_190943 ) ) ( not ( = ?auto_190942 ?auto_190944 ) ) ( not ( = ?auto_190942 ?auto_190945 ) ) ( not ( = ?auto_190942 ?auto_190946 ) ) ( not ( = ?auto_190942 ?auto_190947 ) ) ( not ( = ?auto_190942 ?auto_190948 ) ) ( not ( = ?auto_190942 ?auto_190949 ) ) ( not ( = ?auto_190942 ?auto_190950 ) ) ( not ( = ?auto_190942 ?auto_190951 ) ) ( not ( = ?auto_190942 ?auto_190952 ) ) ( not ( = ?auto_190943 ?auto_190944 ) ) ( not ( = ?auto_190943 ?auto_190945 ) ) ( not ( = ?auto_190943 ?auto_190946 ) ) ( not ( = ?auto_190943 ?auto_190947 ) ) ( not ( = ?auto_190943 ?auto_190948 ) ) ( not ( = ?auto_190943 ?auto_190949 ) ) ( not ( = ?auto_190943 ?auto_190950 ) ) ( not ( = ?auto_190943 ?auto_190951 ) ) ( not ( = ?auto_190943 ?auto_190952 ) ) ( not ( = ?auto_190944 ?auto_190945 ) ) ( not ( = ?auto_190944 ?auto_190946 ) ) ( not ( = ?auto_190944 ?auto_190947 ) ) ( not ( = ?auto_190944 ?auto_190948 ) ) ( not ( = ?auto_190944 ?auto_190949 ) ) ( not ( = ?auto_190944 ?auto_190950 ) ) ( not ( = ?auto_190944 ?auto_190951 ) ) ( not ( = ?auto_190944 ?auto_190952 ) ) ( not ( = ?auto_190945 ?auto_190946 ) ) ( not ( = ?auto_190945 ?auto_190947 ) ) ( not ( = ?auto_190945 ?auto_190948 ) ) ( not ( = ?auto_190945 ?auto_190949 ) ) ( not ( = ?auto_190945 ?auto_190950 ) ) ( not ( = ?auto_190945 ?auto_190951 ) ) ( not ( = ?auto_190945 ?auto_190952 ) ) ( not ( = ?auto_190946 ?auto_190947 ) ) ( not ( = ?auto_190946 ?auto_190948 ) ) ( not ( = ?auto_190946 ?auto_190949 ) ) ( not ( = ?auto_190946 ?auto_190950 ) ) ( not ( = ?auto_190946 ?auto_190951 ) ) ( not ( = ?auto_190946 ?auto_190952 ) ) ( not ( = ?auto_190947 ?auto_190948 ) ) ( not ( = ?auto_190947 ?auto_190949 ) ) ( not ( = ?auto_190947 ?auto_190950 ) ) ( not ( = ?auto_190947 ?auto_190951 ) ) ( not ( = ?auto_190947 ?auto_190952 ) ) ( not ( = ?auto_190948 ?auto_190949 ) ) ( not ( = ?auto_190948 ?auto_190950 ) ) ( not ( = ?auto_190948 ?auto_190951 ) ) ( not ( = ?auto_190948 ?auto_190952 ) ) ( not ( = ?auto_190949 ?auto_190950 ) ) ( not ( = ?auto_190949 ?auto_190951 ) ) ( not ( = ?auto_190949 ?auto_190952 ) ) ( not ( = ?auto_190950 ?auto_190951 ) ) ( not ( = ?auto_190950 ?auto_190952 ) ) ( not ( = ?auto_190951 ?auto_190952 ) ) ( ON ?auto_190950 ?auto_190951 ) ( ON ?auto_190949 ?auto_190950 ) ( ON ?auto_190948 ?auto_190949 ) ( ON ?auto_190947 ?auto_190948 ) ( ON ?auto_190946 ?auto_190947 ) ( ON ?auto_190945 ?auto_190946 ) ( ON ?auto_190944 ?auto_190945 ) ( ON ?auto_190943 ?auto_190944 ) ( CLEAR ?auto_190941 ) ( ON ?auto_190942 ?auto_190943 ) ( CLEAR ?auto_190942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190941 ?auto_190942 )
      ( MAKE-11PILE ?auto_190941 ?auto_190942 ?auto_190943 ?auto_190944 ?auto_190945 ?auto_190946 ?auto_190947 ?auto_190948 ?auto_190949 ?auto_190950 ?auto_190951 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190964 - BLOCK
      ?auto_190965 - BLOCK
      ?auto_190966 - BLOCK
      ?auto_190967 - BLOCK
      ?auto_190968 - BLOCK
      ?auto_190969 - BLOCK
      ?auto_190970 - BLOCK
      ?auto_190971 - BLOCK
      ?auto_190972 - BLOCK
      ?auto_190973 - BLOCK
      ?auto_190974 - BLOCK
    )
    :vars
    (
      ?auto_190975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190974 ?auto_190975 ) ( ON-TABLE ?auto_190964 ) ( not ( = ?auto_190964 ?auto_190965 ) ) ( not ( = ?auto_190964 ?auto_190966 ) ) ( not ( = ?auto_190964 ?auto_190967 ) ) ( not ( = ?auto_190964 ?auto_190968 ) ) ( not ( = ?auto_190964 ?auto_190969 ) ) ( not ( = ?auto_190964 ?auto_190970 ) ) ( not ( = ?auto_190964 ?auto_190971 ) ) ( not ( = ?auto_190964 ?auto_190972 ) ) ( not ( = ?auto_190964 ?auto_190973 ) ) ( not ( = ?auto_190964 ?auto_190974 ) ) ( not ( = ?auto_190964 ?auto_190975 ) ) ( not ( = ?auto_190965 ?auto_190966 ) ) ( not ( = ?auto_190965 ?auto_190967 ) ) ( not ( = ?auto_190965 ?auto_190968 ) ) ( not ( = ?auto_190965 ?auto_190969 ) ) ( not ( = ?auto_190965 ?auto_190970 ) ) ( not ( = ?auto_190965 ?auto_190971 ) ) ( not ( = ?auto_190965 ?auto_190972 ) ) ( not ( = ?auto_190965 ?auto_190973 ) ) ( not ( = ?auto_190965 ?auto_190974 ) ) ( not ( = ?auto_190965 ?auto_190975 ) ) ( not ( = ?auto_190966 ?auto_190967 ) ) ( not ( = ?auto_190966 ?auto_190968 ) ) ( not ( = ?auto_190966 ?auto_190969 ) ) ( not ( = ?auto_190966 ?auto_190970 ) ) ( not ( = ?auto_190966 ?auto_190971 ) ) ( not ( = ?auto_190966 ?auto_190972 ) ) ( not ( = ?auto_190966 ?auto_190973 ) ) ( not ( = ?auto_190966 ?auto_190974 ) ) ( not ( = ?auto_190966 ?auto_190975 ) ) ( not ( = ?auto_190967 ?auto_190968 ) ) ( not ( = ?auto_190967 ?auto_190969 ) ) ( not ( = ?auto_190967 ?auto_190970 ) ) ( not ( = ?auto_190967 ?auto_190971 ) ) ( not ( = ?auto_190967 ?auto_190972 ) ) ( not ( = ?auto_190967 ?auto_190973 ) ) ( not ( = ?auto_190967 ?auto_190974 ) ) ( not ( = ?auto_190967 ?auto_190975 ) ) ( not ( = ?auto_190968 ?auto_190969 ) ) ( not ( = ?auto_190968 ?auto_190970 ) ) ( not ( = ?auto_190968 ?auto_190971 ) ) ( not ( = ?auto_190968 ?auto_190972 ) ) ( not ( = ?auto_190968 ?auto_190973 ) ) ( not ( = ?auto_190968 ?auto_190974 ) ) ( not ( = ?auto_190968 ?auto_190975 ) ) ( not ( = ?auto_190969 ?auto_190970 ) ) ( not ( = ?auto_190969 ?auto_190971 ) ) ( not ( = ?auto_190969 ?auto_190972 ) ) ( not ( = ?auto_190969 ?auto_190973 ) ) ( not ( = ?auto_190969 ?auto_190974 ) ) ( not ( = ?auto_190969 ?auto_190975 ) ) ( not ( = ?auto_190970 ?auto_190971 ) ) ( not ( = ?auto_190970 ?auto_190972 ) ) ( not ( = ?auto_190970 ?auto_190973 ) ) ( not ( = ?auto_190970 ?auto_190974 ) ) ( not ( = ?auto_190970 ?auto_190975 ) ) ( not ( = ?auto_190971 ?auto_190972 ) ) ( not ( = ?auto_190971 ?auto_190973 ) ) ( not ( = ?auto_190971 ?auto_190974 ) ) ( not ( = ?auto_190971 ?auto_190975 ) ) ( not ( = ?auto_190972 ?auto_190973 ) ) ( not ( = ?auto_190972 ?auto_190974 ) ) ( not ( = ?auto_190972 ?auto_190975 ) ) ( not ( = ?auto_190973 ?auto_190974 ) ) ( not ( = ?auto_190973 ?auto_190975 ) ) ( not ( = ?auto_190974 ?auto_190975 ) ) ( ON ?auto_190973 ?auto_190974 ) ( ON ?auto_190972 ?auto_190973 ) ( ON ?auto_190971 ?auto_190972 ) ( ON ?auto_190970 ?auto_190971 ) ( ON ?auto_190969 ?auto_190970 ) ( ON ?auto_190968 ?auto_190969 ) ( ON ?auto_190967 ?auto_190968 ) ( ON ?auto_190966 ?auto_190967 ) ( CLEAR ?auto_190964 ) ( ON ?auto_190965 ?auto_190966 ) ( CLEAR ?auto_190965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_190964 ?auto_190965 )
      ( MAKE-11PILE ?auto_190964 ?auto_190965 ?auto_190966 ?auto_190967 ?auto_190968 ?auto_190969 ?auto_190970 ?auto_190971 ?auto_190972 ?auto_190973 ?auto_190974 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_190987 - BLOCK
      ?auto_190988 - BLOCK
      ?auto_190989 - BLOCK
      ?auto_190990 - BLOCK
      ?auto_190991 - BLOCK
      ?auto_190992 - BLOCK
      ?auto_190993 - BLOCK
      ?auto_190994 - BLOCK
      ?auto_190995 - BLOCK
      ?auto_190996 - BLOCK
      ?auto_190997 - BLOCK
    )
    :vars
    (
      ?auto_190998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_190997 ?auto_190998 ) ( not ( = ?auto_190987 ?auto_190988 ) ) ( not ( = ?auto_190987 ?auto_190989 ) ) ( not ( = ?auto_190987 ?auto_190990 ) ) ( not ( = ?auto_190987 ?auto_190991 ) ) ( not ( = ?auto_190987 ?auto_190992 ) ) ( not ( = ?auto_190987 ?auto_190993 ) ) ( not ( = ?auto_190987 ?auto_190994 ) ) ( not ( = ?auto_190987 ?auto_190995 ) ) ( not ( = ?auto_190987 ?auto_190996 ) ) ( not ( = ?auto_190987 ?auto_190997 ) ) ( not ( = ?auto_190987 ?auto_190998 ) ) ( not ( = ?auto_190988 ?auto_190989 ) ) ( not ( = ?auto_190988 ?auto_190990 ) ) ( not ( = ?auto_190988 ?auto_190991 ) ) ( not ( = ?auto_190988 ?auto_190992 ) ) ( not ( = ?auto_190988 ?auto_190993 ) ) ( not ( = ?auto_190988 ?auto_190994 ) ) ( not ( = ?auto_190988 ?auto_190995 ) ) ( not ( = ?auto_190988 ?auto_190996 ) ) ( not ( = ?auto_190988 ?auto_190997 ) ) ( not ( = ?auto_190988 ?auto_190998 ) ) ( not ( = ?auto_190989 ?auto_190990 ) ) ( not ( = ?auto_190989 ?auto_190991 ) ) ( not ( = ?auto_190989 ?auto_190992 ) ) ( not ( = ?auto_190989 ?auto_190993 ) ) ( not ( = ?auto_190989 ?auto_190994 ) ) ( not ( = ?auto_190989 ?auto_190995 ) ) ( not ( = ?auto_190989 ?auto_190996 ) ) ( not ( = ?auto_190989 ?auto_190997 ) ) ( not ( = ?auto_190989 ?auto_190998 ) ) ( not ( = ?auto_190990 ?auto_190991 ) ) ( not ( = ?auto_190990 ?auto_190992 ) ) ( not ( = ?auto_190990 ?auto_190993 ) ) ( not ( = ?auto_190990 ?auto_190994 ) ) ( not ( = ?auto_190990 ?auto_190995 ) ) ( not ( = ?auto_190990 ?auto_190996 ) ) ( not ( = ?auto_190990 ?auto_190997 ) ) ( not ( = ?auto_190990 ?auto_190998 ) ) ( not ( = ?auto_190991 ?auto_190992 ) ) ( not ( = ?auto_190991 ?auto_190993 ) ) ( not ( = ?auto_190991 ?auto_190994 ) ) ( not ( = ?auto_190991 ?auto_190995 ) ) ( not ( = ?auto_190991 ?auto_190996 ) ) ( not ( = ?auto_190991 ?auto_190997 ) ) ( not ( = ?auto_190991 ?auto_190998 ) ) ( not ( = ?auto_190992 ?auto_190993 ) ) ( not ( = ?auto_190992 ?auto_190994 ) ) ( not ( = ?auto_190992 ?auto_190995 ) ) ( not ( = ?auto_190992 ?auto_190996 ) ) ( not ( = ?auto_190992 ?auto_190997 ) ) ( not ( = ?auto_190992 ?auto_190998 ) ) ( not ( = ?auto_190993 ?auto_190994 ) ) ( not ( = ?auto_190993 ?auto_190995 ) ) ( not ( = ?auto_190993 ?auto_190996 ) ) ( not ( = ?auto_190993 ?auto_190997 ) ) ( not ( = ?auto_190993 ?auto_190998 ) ) ( not ( = ?auto_190994 ?auto_190995 ) ) ( not ( = ?auto_190994 ?auto_190996 ) ) ( not ( = ?auto_190994 ?auto_190997 ) ) ( not ( = ?auto_190994 ?auto_190998 ) ) ( not ( = ?auto_190995 ?auto_190996 ) ) ( not ( = ?auto_190995 ?auto_190997 ) ) ( not ( = ?auto_190995 ?auto_190998 ) ) ( not ( = ?auto_190996 ?auto_190997 ) ) ( not ( = ?auto_190996 ?auto_190998 ) ) ( not ( = ?auto_190997 ?auto_190998 ) ) ( ON ?auto_190996 ?auto_190997 ) ( ON ?auto_190995 ?auto_190996 ) ( ON ?auto_190994 ?auto_190995 ) ( ON ?auto_190993 ?auto_190994 ) ( ON ?auto_190992 ?auto_190993 ) ( ON ?auto_190991 ?auto_190992 ) ( ON ?auto_190990 ?auto_190991 ) ( ON ?auto_190989 ?auto_190990 ) ( ON ?auto_190988 ?auto_190989 ) ( ON ?auto_190987 ?auto_190988 ) ( CLEAR ?auto_190987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_190987 )
      ( MAKE-11PILE ?auto_190987 ?auto_190988 ?auto_190989 ?auto_190990 ?auto_190991 ?auto_190992 ?auto_190993 ?auto_190994 ?auto_190995 ?auto_190996 ?auto_190997 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_191010 - BLOCK
      ?auto_191011 - BLOCK
      ?auto_191012 - BLOCK
      ?auto_191013 - BLOCK
      ?auto_191014 - BLOCK
      ?auto_191015 - BLOCK
      ?auto_191016 - BLOCK
      ?auto_191017 - BLOCK
      ?auto_191018 - BLOCK
      ?auto_191019 - BLOCK
      ?auto_191020 - BLOCK
    )
    :vars
    (
      ?auto_191021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191020 ?auto_191021 ) ( not ( = ?auto_191010 ?auto_191011 ) ) ( not ( = ?auto_191010 ?auto_191012 ) ) ( not ( = ?auto_191010 ?auto_191013 ) ) ( not ( = ?auto_191010 ?auto_191014 ) ) ( not ( = ?auto_191010 ?auto_191015 ) ) ( not ( = ?auto_191010 ?auto_191016 ) ) ( not ( = ?auto_191010 ?auto_191017 ) ) ( not ( = ?auto_191010 ?auto_191018 ) ) ( not ( = ?auto_191010 ?auto_191019 ) ) ( not ( = ?auto_191010 ?auto_191020 ) ) ( not ( = ?auto_191010 ?auto_191021 ) ) ( not ( = ?auto_191011 ?auto_191012 ) ) ( not ( = ?auto_191011 ?auto_191013 ) ) ( not ( = ?auto_191011 ?auto_191014 ) ) ( not ( = ?auto_191011 ?auto_191015 ) ) ( not ( = ?auto_191011 ?auto_191016 ) ) ( not ( = ?auto_191011 ?auto_191017 ) ) ( not ( = ?auto_191011 ?auto_191018 ) ) ( not ( = ?auto_191011 ?auto_191019 ) ) ( not ( = ?auto_191011 ?auto_191020 ) ) ( not ( = ?auto_191011 ?auto_191021 ) ) ( not ( = ?auto_191012 ?auto_191013 ) ) ( not ( = ?auto_191012 ?auto_191014 ) ) ( not ( = ?auto_191012 ?auto_191015 ) ) ( not ( = ?auto_191012 ?auto_191016 ) ) ( not ( = ?auto_191012 ?auto_191017 ) ) ( not ( = ?auto_191012 ?auto_191018 ) ) ( not ( = ?auto_191012 ?auto_191019 ) ) ( not ( = ?auto_191012 ?auto_191020 ) ) ( not ( = ?auto_191012 ?auto_191021 ) ) ( not ( = ?auto_191013 ?auto_191014 ) ) ( not ( = ?auto_191013 ?auto_191015 ) ) ( not ( = ?auto_191013 ?auto_191016 ) ) ( not ( = ?auto_191013 ?auto_191017 ) ) ( not ( = ?auto_191013 ?auto_191018 ) ) ( not ( = ?auto_191013 ?auto_191019 ) ) ( not ( = ?auto_191013 ?auto_191020 ) ) ( not ( = ?auto_191013 ?auto_191021 ) ) ( not ( = ?auto_191014 ?auto_191015 ) ) ( not ( = ?auto_191014 ?auto_191016 ) ) ( not ( = ?auto_191014 ?auto_191017 ) ) ( not ( = ?auto_191014 ?auto_191018 ) ) ( not ( = ?auto_191014 ?auto_191019 ) ) ( not ( = ?auto_191014 ?auto_191020 ) ) ( not ( = ?auto_191014 ?auto_191021 ) ) ( not ( = ?auto_191015 ?auto_191016 ) ) ( not ( = ?auto_191015 ?auto_191017 ) ) ( not ( = ?auto_191015 ?auto_191018 ) ) ( not ( = ?auto_191015 ?auto_191019 ) ) ( not ( = ?auto_191015 ?auto_191020 ) ) ( not ( = ?auto_191015 ?auto_191021 ) ) ( not ( = ?auto_191016 ?auto_191017 ) ) ( not ( = ?auto_191016 ?auto_191018 ) ) ( not ( = ?auto_191016 ?auto_191019 ) ) ( not ( = ?auto_191016 ?auto_191020 ) ) ( not ( = ?auto_191016 ?auto_191021 ) ) ( not ( = ?auto_191017 ?auto_191018 ) ) ( not ( = ?auto_191017 ?auto_191019 ) ) ( not ( = ?auto_191017 ?auto_191020 ) ) ( not ( = ?auto_191017 ?auto_191021 ) ) ( not ( = ?auto_191018 ?auto_191019 ) ) ( not ( = ?auto_191018 ?auto_191020 ) ) ( not ( = ?auto_191018 ?auto_191021 ) ) ( not ( = ?auto_191019 ?auto_191020 ) ) ( not ( = ?auto_191019 ?auto_191021 ) ) ( not ( = ?auto_191020 ?auto_191021 ) ) ( ON ?auto_191019 ?auto_191020 ) ( ON ?auto_191018 ?auto_191019 ) ( ON ?auto_191017 ?auto_191018 ) ( ON ?auto_191016 ?auto_191017 ) ( ON ?auto_191015 ?auto_191016 ) ( ON ?auto_191014 ?auto_191015 ) ( ON ?auto_191013 ?auto_191014 ) ( ON ?auto_191012 ?auto_191013 ) ( ON ?auto_191011 ?auto_191012 ) ( ON ?auto_191010 ?auto_191011 ) ( CLEAR ?auto_191010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191010 )
      ( MAKE-11PILE ?auto_191010 ?auto_191011 ?auto_191012 ?auto_191013 ?auto_191014 ?auto_191015 ?auto_191016 ?auto_191017 ?auto_191018 ?auto_191019 ?auto_191020 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191034 - BLOCK
      ?auto_191035 - BLOCK
      ?auto_191036 - BLOCK
      ?auto_191037 - BLOCK
      ?auto_191038 - BLOCK
      ?auto_191039 - BLOCK
      ?auto_191040 - BLOCK
      ?auto_191041 - BLOCK
      ?auto_191042 - BLOCK
      ?auto_191043 - BLOCK
      ?auto_191044 - BLOCK
      ?auto_191045 - BLOCK
    )
    :vars
    (
      ?auto_191046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191044 ) ( ON ?auto_191045 ?auto_191046 ) ( CLEAR ?auto_191045 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191034 ) ( ON ?auto_191035 ?auto_191034 ) ( ON ?auto_191036 ?auto_191035 ) ( ON ?auto_191037 ?auto_191036 ) ( ON ?auto_191038 ?auto_191037 ) ( ON ?auto_191039 ?auto_191038 ) ( ON ?auto_191040 ?auto_191039 ) ( ON ?auto_191041 ?auto_191040 ) ( ON ?auto_191042 ?auto_191041 ) ( ON ?auto_191043 ?auto_191042 ) ( ON ?auto_191044 ?auto_191043 ) ( not ( = ?auto_191034 ?auto_191035 ) ) ( not ( = ?auto_191034 ?auto_191036 ) ) ( not ( = ?auto_191034 ?auto_191037 ) ) ( not ( = ?auto_191034 ?auto_191038 ) ) ( not ( = ?auto_191034 ?auto_191039 ) ) ( not ( = ?auto_191034 ?auto_191040 ) ) ( not ( = ?auto_191034 ?auto_191041 ) ) ( not ( = ?auto_191034 ?auto_191042 ) ) ( not ( = ?auto_191034 ?auto_191043 ) ) ( not ( = ?auto_191034 ?auto_191044 ) ) ( not ( = ?auto_191034 ?auto_191045 ) ) ( not ( = ?auto_191034 ?auto_191046 ) ) ( not ( = ?auto_191035 ?auto_191036 ) ) ( not ( = ?auto_191035 ?auto_191037 ) ) ( not ( = ?auto_191035 ?auto_191038 ) ) ( not ( = ?auto_191035 ?auto_191039 ) ) ( not ( = ?auto_191035 ?auto_191040 ) ) ( not ( = ?auto_191035 ?auto_191041 ) ) ( not ( = ?auto_191035 ?auto_191042 ) ) ( not ( = ?auto_191035 ?auto_191043 ) ) ( not ( = ?auto_191035 ?auto_191044 ) ) ( not ( = ?auto_191035 ?auto_191045 ) ) ( not ( = ?auto_191035 ?auto_191046 ) ) ( not ( = ?auto_191036 ?auto_191037 ) ) ( not ( = ?auto_191036 ?auto_191038 ) ) ( not ( = ?auto_191036 ?auto_191039 ) ) ( not ( = ?auto_191036 ?auto_191040 ) ) ( not ( = ?auto_191036 ?auto_191041 ) ) ( not ( = ?auto_191036 ?auto_191042 ) ) ( not ( = ?auto_191036 ?auto_191043 ) ) ( not ( = ?auto_191036 ?auto_191044 ) ) ( not ( = ?auto_191036 ?auto_191045 ) ) ( not ( = ?auto_191036 ?auto_191046 ) ) ( not ( = ?auto_191037 ?auto_191038 ) ) ( not ( = ?auto_191037 ?auto_191039 ) ) ( not ( = ?auto_191037 ?auto_191040 ) ) ( not ( = ?auto_191037 ?auto_191041 ) ) ( not ( = ?auto_191037 ?auto_191042 ) ) ( not ( = ?auto_191037 ?auto_191043 ) ) ( not ( = ?auto_191037 ?auto_191044 ) ) ( not ( = ?auto_191037 ?auto_191045 ) ) ( not ( = ?auto_191037 ?auto_191046 ) ) ( not ( = ?auto_191038 ?auto_191039 ) ) ( not ( = ?auto_191038 ?auto_191040 ) ) ( not ( = ?auto_191038 ?auto_191041 ) ) ( not ( = ?auto_191038 ?auto_191042 ) ) ( not ( = ?auto_191038 ?auto_191043 ) ) ( not ( = ?auto_191038 ?auto_191044 ) ) ( not ( = ?auto_191038 ?auto_191045 ) ) ( not ( = ?auto_191038 ?auto_191046 ) ) ( not ( = ?auto_191039 ?auto_191040 ) ) ( not ( = ?auto_191039 ?auto_191041 ) ) ( not ( = ?auto_191039 ?auto_191042 ) ) ( not ( = ?auto_191039 ?auto_191043 ) ) ( not ( = ?auto_191039 ?auto_191044 ) ) ( not ( = ?auto_191039 ?auto_191045 ) ) ( not ( = ?auto_191039 ?auto_191046 ) ) ( not ( = ?auto_191040 ?auto_191041 ) ) ( not ( = ?auto_191040 ?auto_191042 ) ) ( not ( = ?auto_191040 ?auto_191043 ) ) ( not ( = ?auto_191040 ?auto_191044 ) ) ( not ( = ?auto_191040 ?auto_191045 ) ) ( not ( = ?auto_191040 ?auto_191046 ) ) ( not ( = ?auto_191041 ?auto_191042 ) ) ( not ( = ?auto_191041 ?auto_191043 ) ) ( not ( = ?auto_191041 ?auto_191044 ) ) ( not ( = ?auto_191041 ?auto_191045 ) ) ( not ( = ?auto_191041 ?auto_191046 ) ) ( not ( = ?auto_191042 ?auto_191043 ) ) ( not ( = ?auto_191042 ?auto_191044 ) ) ( not ( = ?auto_191042 ?auto_191045 ) ) ( not ( = ?auto_191042 ?auto_191046 ) ) ( not ( = ?auto_191043 ?auto_191044 ) ) ( not ( = ?auto_191043 ?auto_191045 ) ) ( not ( = ?auto_191043 ?auto_191046 ) ) ( not ( = ?auto_191044 ?auto_191045 ) ) ( not ( = ?auto_191044 ?auto_191046 ) ) ( not ( = ?auto_191045 ?auto_191046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191045 ?auto_191046 )
      ( !STACK ?auto_191045 ?auto_191044 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191059 - BLOCK
      ?auto_191060 - BLOCK
      ?auto_191061 - BLOCK
      ?auto_191062 - BLOCK
      ?auto_191063 - BLOCK
      ?auto_191064 - BLOCK
      ?auto_191065 - BLOCK
      ?auto_191066 - BLOCK
      ?auto_191067 - BLOCK
      ?auto_191068 - BLOCK
      ?auto_191069 - BLOCK
      ?auto_191070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_191069 ) ( ON-TABLE ?auto_191070 ) ( CLEAR ?auto_191070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191059 ) ( ON ?auto_191060 ?auto_191059 ) ( ON ?auto_191061 ?auto_191060 ) ( ON ?auto_191062 ?auto_191061 ) ( ON ?auto_191063 ?auto_191062 ) ( ON ?auto_191064 ?auto_191063 ) ( ON ?auto_191065 ?auto_191064 ) ( ON ?auto_191066 ?auto_191065 ) ( ON ?auto_191067 ?auto_191066 ) ( ON ?auto_191068 ?auto_191067 ) ( ON ?auto_191069 ?auto_191068 ) ( not ( = ?auto_191059 ?auto_191060 ) ) ( not ( = ?auto_191059 ?auto_191061 ) ) ( not ( = ?auto_191059 ?auto_191062 ) ) ( not ( = ?auto_191059 ?auto_191063 ) ) ( not ( = ?auto_191059 ?auto_191064 ) ) ( not ( = ?auto_191059 ?auto_191065 ) ) ( not ( = ?auto_191059 ?auto_191066 ) ) ( not ( = ?auto_191059 ?auto_191067 ) ) ( not ( = ?auto_191059 ?auto_191068 ) ) ( not ( = ?auto_191059 ?auto_191069 ) ) ( not ( = ?auto_191059 ?auto_191070 ) ) ( not ( = ?auto_191060 ?auto_191061 ) ) ( not ( = ?auto_191060 ?auto_191062 ) ) ( not ( = ?auto_191060 ?auto_191063 ) ) ( not ( = ?auto_191060 ?auto_191064 ) ) ( not ( = ?auto_191060 ?auto_191065 ) ) ( not ( = ?auto_191060 ?auto_191066 ) ) ( not ( = ?auto_191060 ?auto_191067 ) ) ( not ( = ?auto_191060 ?auto_191068 ) ) ( not ( = ?auto_191060 ?auto_191069 ) ) ( not ( = ?auto_191060 ?auto_191070 ) ) ( not ( = ?auto_191061 ?auto_191062 ) ) ( not ( = ?auto_191061 ?auto_191063 ) ) ( not ( = ?auto_191061 ?auto_191064 ) ) ( not ( = ?auto_191061 ?auto_191065 ) ) ( not ( = ?auto_191061 ?auto_191066 ) ) ( not ( = ?auto_191061 ?auto_191067 ) ) ( not ( = ?auto_191061 ?auto_191068 ) ) ( not ( = ?auto_191061 ?auto_191069 ) ) ( not ( = ?auto_191061 ?auto_191070 ) ) ( not ( = ?auto_191062 ?auto_191063 ) ) ( not ( = ?auto_191062 ?auto_191064 ) ) ( not ( = ?auto_191062 ?auto_191065 ) ) ( not ( = ?auto_191062 ?auto_191066 ) ) ( not ( = ?auto_191062 ?auto_191067 ) ) ( not ( = ?auto_191062 ?auto_191068 ) ) ( not ( = ?auto_191062 ?auto_191069 ) ) ( not ( = ?auto_191062 ?auto_191070 ) ) ( not ( = ?auto_191063 ?auto_191064 ) ) ( not ( = ?auto_191063 ?auto_191065 ) ) ( not ( = ?auto_191063 ?auto_191066 ) ) ( not ( = ?auto_191063 ?auto_191067 ) ) ( not ( = ?auto_191063 ?auto_191068 ) ) ( not ( = ?auto_191063 ?auto_191069 ) ) ( not ( = ?auto_191063 ?auto_191070 ) ) ( not ( = ?auto_191064 ?auto_191065 ) ) ( not ( = ?auto_191064 ?auto_191066 ) ) ( not ( = ?auto_191064 ?auto_191067 ) ) ( not ( = ?auto_191064 ?auto_191068 ) ) ( not ( = ?auto_191064 ?auto_191069 ) ) ( not ( = ?auto_191064 ?auto_191070 ) ) ( not ( = ?auto_191065 ?auto_191066 ) ) ( not ( = ?auto_191065 ?auto_191067 ) ) ( not ( = ?auto_191065 ?auto_191068 ) ) ( not ( = ?auto_191065 ?auto_191069 ) ) ( not ( = ?auto_191065 ?auto_191070 ) ) ( not ( = ?auto_191066 ?auto_191067 ) ) ( not ( = ?auto_191066 ?auto_191068 ) ) ( not ( = ?auto_191066 ?auto_191069 ) ) ( not ( = ?auto_191066 ?auto_191070 ) ) ( not ( = ?auto_191067 ?auto_191068 ) ) ( not ( = ?auto_191067 ?auto_191069 ) ) ( not ( = ?auto_191067 ?auto_191070 ) ) ( not ( = ?auto_191068 ?auto_191069 ) ) ( not ( = ?auto_191068 ?auto_191070 ) ) ( not ( = ?auto_191069 ?auto_191070 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_191070 )
      ( !STACK ?auto_191070 ?auto_191069 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191083 - BLOCK
      ?auto_191084 - BLOCK
      ?auto_191085 - BLOCK
      ?auto_191086 - BLOCK
      ?auto_191087 - BLOCK
      ?auto_191088 - BLOCK
      ?auto_191089 - BLOCK
      ?auto_191090 - BLOCK
      ?auto_191091 - BLOCK
      ?auto_191092 - BLOCK
      ?auto_191093 - BLOCK
      ?auto_191094 - BLOCK
    )
    :vars
    (
      ?auto_191095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191094 ?auto_191095 ) ( ON-TABLE ?auto_191083 ) ( ON ?auto_191084 ?auto_191083 ) ( ON ?auto_191085 ?auto_191084 ) ( ON ?auto_191086 ?auto_191085 ) ( ON ?auto_191087 ?auto_191086 ) ( ON ?auto_191088 ?auto_191087 ) ( ON ?auto_191089 ?auto_191088 ) ( ON ?auto_191090 ?auto_191089 ) ( ON ?auto_191091 ?auto_191090 ) ( ON ?auto_191092 ?auto_191091 ) ( not ( = ?auto_191083 ?auto_191084 ) ) ( not ( = ?auto_191083 ?auto_191085 ) ) ( not ( = ?auto_191083 ?auto_191086 ) ) ( not ( = ?auto_191083 ?auto_191087 ) ) ( not ( = ?auto_191083 ?auto_191088 ) ) ( not ( = ?auto_191083 ?auto_191089 ) ) ( not ( = ?auto_191083 ?auto_191090 ) ) ( not ( = ?auto_191083 ?auto_191091 ) ) ( not ( = ?auto_191083 ?auto_191092 ) ) ( not ( = ?auto_191083 ?auto_191093 ) ) ( not ( = ?auto_191083 ?auto_191094 ) ) ( not ( = ?auto_191083 ?auto_191095 ) ) ( not ( = ?auto_191084 ?auto_191085 ) ) ( not ( = ?auto_191084 ?auto_191086 ) ) ( not ( = ?auto_191084 ?auto_191087 ) ) ( not ( = ?auto_191084 ?auto_191088 ) ) ( not ( = ?auto_191084 ?auto_191089 ) ) ( not ( = ?auto_191084 ?auto_191090 ) ) ( not ( = ?auto_191084 ?auto_191091 ) ) ( not ( = ?auto_191084 ?auto_191092 ) ) ( not ( = ?auto_191084 ?auto_191093 ) ) ( not ( = ?auto_191084 ?auto_191094 ) ) ( not ( = ?auto_191084 ?auto_191095 ) ) ( not ( = ?auto_191085 ?auto_191086 ) ) ( not ( = ?auto_191085 ?auto_191087 ) ) ( not ( = ?auto_191085 ?auto_191088 ) ) ( not ( = ?auto_191085 ?auto_191089 ) ) ( not ( = ?auto_191085 ?auto_191090 ) ) ( not ( = ?auto_191085 ?auto_191091 ) ) ( not ( = ?auto_191085 ?auto_191092 ) ) ( not ( = ?auto_191085 ?auto_191093 ) ) ( not ( = ?auto_191085 ?auto_191094 ) ) ( not ( = ?auto_191085 ?auto_191095 ) ) ( not ( = ?auto_191086 ?auto_191087 ) ) ( not ( = ?auto_191086 ?auto_191088 ) ) ( not ( = ?auto_191086 ?auto_191089 ) ) ( not ( = ?auto_191086 ?auto_191090 ) ) ( not ( = ?auto_191086 ?auto_191091 ) ) ( not ( = ?auto_191086 ?auto_191092 ) ) ( not ( = ?auto_191086 ?auto_191093 ) ) ( not ( = ?auto_191086 ?auto_191094 ) ) ( not ( = ?auto_191086 ?auto_191095 ) ) ( not ( = ?auto_191087 ?auto_191088 ) ) ( not ( = ?auto_191087 ?auto_191089 ) ) ( not ( = ?auto_191087 ?auto_191090 ) ) ( not ( = ?auto_191087 ?auto_191091 ) ) ( not ( = ?auto_191087 ?auto_191092 ) ) ( not ( = ?auto_191087 ?auto_191093 ) ) ( not ( = ?auto_191087 ?auto_191094 ) ) ( not ( = ?auto_191087 ?auto_191095 ) ) ( not ( = ?auto_191088 ?auto_191089 ) ) ( not ( = ?auto_191088 ?auto_191090 ) ) ( not ( = ?auto_191088 ?auto_191091 ) ) ( not ( = ?auto_191088 ?auto_191092 ) ) ( not ( = ?auto_191088 ?auto_191093 ) ) ( not ( = ?auto_191088 ?auto_191094 ) ) ( not ( = ?auto_191088 ?auto_191095 ) ) ( not ( = ?auto_191089 ?auto_191090 ) ) ( not ( = ?auto_191089 ?auto_191091 ) ) ( not ( = ?auto_191089 ?auto_191092 ) ) ( not ( = ?auto_191089 ?auto_191093 ) ) ( not ( = ?auto_191089 ?auto_191094 ) ) ( not ( = ?auto_191089 ?auto_191095 ) ) ( not ( = ?auto_191090 ?auto_191091 ) ) ( not ( = ?auto_191090 ?auto_191092 ) ) ( not ( = ?auto_191090 ?auto_191093 ) ) ( not ( = ?auto_191090 ?auto_191094 ) ) ( not ( = ?auto_191090 ?auto_191095 ) ) ( not ( = ?auto_191091 ?auto_191092 ) ) ( not ( = ?auto_191091 ?auto_191093 ) ) ( not ( = ?auto_191091 ?auto_191094 ) ) ( not ( = ?auto_191091 ?auto_191095 ) ) ( not ( = ?auto_191092 ?auto_191093 ) ) ( not ( = ?auto_191092 ?auto_191094 ) ) ( not ( = ?auto_191092 ?auto_191095 ) ) ( not ( = ?auto_191093 ?auto_191094 ) ) ( not ( = ?auto_191093 ?auto_191095 ) ) ( not ( = ?auto_191094 ?auto_191095 ) ) ( CLEAR ?auto_191092 ) ( ON ?auto_191093 ?auto_191094 ) ( CLEAR ?auto_191093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_191083 ?auto_191084 ?auto_191085 ?auto_191086 ?auto_191087 ?auto_191088 ?auto_191089 ?auto_191090 ?auto_191091 ?auto_191092 ?auto_191093 )
      ( MAKE-12PILE ?auto_191083 ?auto_191084 ?auto_191085 ?auto_191086 ?auto_191087 ?auto_191088 ?auto_191089 ?auto_191090 ?auto_191091 ?auto_191092 ?auto_191093 ?auto_191094 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191108 - BLOCK
      ?auto_191109 - BLOCK
      ?auto_191110 - BLOCK
      ?auto_191111 - BLOCK
      ?auto_191112 - BLOCK
      ?auto_191113 - BLOCK
      ?auto_191114 - BLOCK
      ?auto_191115 - BLOCK
      ?auto_191116 - BLOCK
      ?auto_191117 - BLOCK
      ?auto_191118 - BLOCK
      ?auto_191119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191119 ) ( ON-TABLE ?auto_191108 ) ( ON ?auto_191109 ?auto_191108 ) ( ON ?auto_191110 ?auto_191109 ) ( ON ?auto_191111 ?auto_191110 ) ( ON ?auto_191112 ?auto_191111 ) ( ON ?auto_191113 ?auto_191112 ) ( ON ?auto_191114 ?auto_191113 ) ( ON ?auto_191115 ?auto_191114 ) ( ON ?auto_191116 ?auto_191115 ) ( ON ?auto_191117 ?auto_191116 ) ( not ( = ?auto_191108 ?auto_191109 ) ) ( not ( = ?auto_191108 ?auto_191110 ) ) ( not ( = ?auto_191108 ?auto_191111 ) ) ( not ( = ?auto_191108 ?auto_191112 ) ) ( not ( = ?auto_191108 ?auto_191113 ) ) ( not ( = ?auto_191108 ?auto_191114 ) ) ( not ( = ?auto_191108 ?auto_191115 ) ) ( not ( = ?auto_191108 ?auto_191116 ) ) ( not ( = ?auto_191108 ?auto_191117 ) ) ( not ( = ?auto_191108 ?auto_191118 ) ) ( not ( = ?auto_191108 ?auto_191119 ) ) ( not ( = ?auto_191109 ?auto_191110 ) ) ( not ( = ?auto_191109 ?auto_191111 ) ) ( not ( = ?auto_191109 ?auto_191112 ) ) ( not ( = ?auto_191109 ?auto_191113 ) ) ( not ( = ?auto_191109 ?auto_191114 ) ) ( not ( = ?auto_191109 ?auto_191115 ) ) ( not ( = ?auto_191109 ?auto_191116 ) ) ( not ( = ?auto_191109 ?auto_191117 ) ) ( not ( = ?auto_191109 ?auto_191118 ) ) ( not ( = ?auto_191109 ?auto_191119 ) ) ( not ( = ?auto_191110 ?auto_191111 ) ) ( not ( = ?auto_191110 ?auto_191112 ) ) ( not ( = ?auto_191110 ?auto_191113 ) ) ( not ( = ?auto_191110 ?auto_191114 ) ) ( not ( = ?auto_191110 ?auto_191115 ) ) ( not ( = ?auto_191110 ?auto_191116 ) ) ( not ( = ?auto_191110 ?auto_191117 ) ) ( not ( = ?auto_191110 ?auto_191118 ) ) ( not ( = ?auto_191110 ?auto_191119 ) ) ( not ( = ?auto_191111 ?auto_191112 ) ) ( not ( = ?auto_191111 ?auto_191113 ) ) ( not ( = ?auto_191111 ?auto_191114 ) ) ( not ( = ?auto_191111 ?auto_191115 ) ) ( not ( = ?auto_191111 ?auto_191116 ) ) ( not ( = ?auto_191111 ?auto_191117 ) ) ( not ( = ?auto_191111 ?auto_191118 ) ) ( not ( = ?auto_191111 ?auto_191119 ) ) ( not ( = ?auto_191112 ?auto_191113 ) ) ( not ( = ?auto_191112 ?auto_191114 ) ) ( not ( = ?auto_191112 ?auto_191115 ) ) ( not ( = ?auto_191112 ?auto_191116 ) ) ( not ( = ?auto_191112 ?auto_191117 ) ) ( not ( = ?auto_191112 ?auto_191118 ) ) ( not ( = ?auto_191112 ?auto_191119 ) ) ( not ( = ?auto_191113 ?auto_191114 ) ) ( not ( = ?auto_191113 ?auto_191115 ) ) ( not ( = ?auto_191113 ?auto_191116 ) ) ( not ( = ?auto_191113 ?auto_191117 ) ) ( not ( = ?auto_191113 ?auto_191118 ) ) ( not ( = ?auto_191113 ?auto_191119 ) ) ( not ( = ?auto_191114 ?auto_191115 ) ) ( not ( = ?auto_191114 ?auto_191116 ) ) ( not ( = ?auto_191114 ?auto_191117 ) ) ( not ( = ?auto_191114 ?auto_191118 ) ) ( not ( = ?auto_191114 ?auto_191119 ) ) ( not ( = ?auto_191115 ?auto_191116 ) ) ( not ( = ?auto_191115 ?auto_191117 ) ) ( not ( = ?auto_191115 ?auto_191118 ) ) ( not ( = ?auto_191115 ?auto_191119 ) ) ( not ( = ?auto_191116 ?auto_191117 ) ) ( not ( = ?auto_191116 ?auto_191118 ) ) ( not ( = ?auto_191116 ?auto_191119 ) ) ( not ( = ?auto_191117 ?auto_191118 ) ) ( not ( = ?auto_191117 ?auto_191119 ) ) ( not ( = ?auto_191118 ?auto_191119 ) ) ( CLEAR ?auto_191117 ) ( ON ?auto_191118 ?auto_191119 ) ( CLEAR ?auto_191118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_191108 ?auto_191109 ?auto_191110 ?auto_191111 ?auto_191112 ?auto_191113 ?auto_191114 ?auto_191115 ?auto_191116 ?auto_191117 ?auto_191118 )
      ( MAKE-12PILE ?auto_191108 ?auto_191109 ?auto_191110 ?auto_191111 ?auto_191112 ?auto_191113 ?auto_191114 ?auto_191115 ?auto_191116 ?auto_191117 ?auto_191118 ?auto_191119 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191132 - BLOCK
      ?auto_191133 - BLOCK
      ?auto_191134 - BLOCK
      ?auto_191135 - BLOCK
      ?auto_191136 - BLOCK
      ?auto_191137 - BLOCK
      ?auto_191138 - BLOCK
      ?auto_191139 - BLOCK
      ?auto_191140 - BLOCK
      ?auto_191141 - BLOCK
      ?auto_191142 - BLOCK
      ?auto_191143 - BLOCK
    )
    :vars
    (
      ?auto_191144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191143 ?auto_191144 ) ( ON-TABLE ?auto_191132 ) ( ON ?auto_191133 ?auto_191132 ) ( ON ?auto_191134 ?auto_191133 ) ( ON ?auto_191135 ?auto_191134 ) ( ON ?auto_191136 ?auto_191135 ) ( ON ?auto_191137 ?auto_191136 ) ( ON ?auto_191138 ?auto_191137 ) ( ON ?auto_191139 ?auto_191138 ) ( ON ?auto_191140 ?auto_191139 ) ( not ( = ?auto_191132 ?auto_191133 ) ) ( not ( = ?auto_191132 ?auto_191134 ) ) ( not ( = ?auto_191132 ?auto_191135 ) ) ( not ( = ?auto_191132 ?auto_191136 ) ) ( not ( = ?auto_191132 ?auto_191137 ) ) ( not ( = ?auto_191132 ?auto_191138 ) ) ( not ( = ?auto_191132 ?auto_191139 ) ) ( not ( = ?auto_191132 ?auto_191140 ) ) ( not ( = ?auto_191132 ?auto_191141 ) ) ( not ( = ?auto_191132 ?auto_191142 ) ) ( not ( = ?auto_191132 ?auto_191143 ) ) ( not ( = ?auto_191132 ?auto_191144 ) ) ( not ( = ?auto_191133 ?auto_191134 ) ) ( not ( = ?auto_191133 ?auto_191135 ) ) ( not ( = ?auto_191133 ?auto_191136 ) ) ( not ( = ?auto_191133 ?auto_191137 ) ) ( not ( = ?auto_191133 ?auto_191138 ) ) ( not ( = ?auto_191133 ?auto_191139 ) ) ( not ( = ?auto_191133 ?auto_191140 ) ) ( not ( = ?auto_191133 ?auto_191141 ) ) ( not ( = ?auto_191133 ?auto_191142 ) ) ( not ( = ?auto_191133 ?auto_191143 ) ) ( not ( = ?auto_191133 ?auto_191144 ) ) ( not ( = ?auto_191134 ?auto_191135 ) ) ( not ( = ?auto_191134 ?auto_191136 ) ) ( not ( = ?auto_191134 ?auto_191137 ) ) ( not ( = ?auto_191134 ?auto_191138 ) ) ( not ( = ?auto_191134 ?auto_191139 ) ) ( not ( = ?auto_191134 ?auto_191140 ) ) ( not ( = ?auto_191134 ?auto_191141 ) ) ( not ( = ?auto_191134 ?auto_191142 ) ) ( not ( = ?auto_191134 ?auto_191143 ) ) ( not ( = ?auto_191134 ?auto_191144 ) ) ( not ( = ?auto_191135 ?auto_191136 ) ) ( not ( = ?auto_191135 ?auto_191137 ) ) ( not ( = ?auto_191135 ?auto_191138 ) ) ( not ( = ?auto_191135 ?auto_191139 ) ) ( not ( = ?auto_191135 ?auto_191140 ) ) ( not ( = ?auto_191135 ?auto_191141 ) ) ( not ( = ?auto_191135 ?auto_191142 ) ) ( not ( = ?auto_191135 ?auto_191143 ) ) ( not ( = ?auto_191135 ?auto_191144 ) ) ( not ( = ?auto_191136 ?auto_191137 ) ) ( not ( = ?auto_191136 ?auto_191138 ) ) ( not ( = ?auto_191136 ?auto_191139 ) ) ( not ( = ?auto_191136 ?auto_191140 ) ) ( not ( = ?auto_191136 ?auto_191141 ) ) ( not ( = ?auto_191136 ?auto_191142 ) ) ( not ( = ?auto_191136 ?auto_191143 ) ) ( not ( = ?auto_191136 ?auto_191144 ) ) ( not ( = ?auto_191137 ?auto_191138 ) ) ( not ( = ?auto_191137 ?auto_191139 ) ) ( not ( = ?auto_191137 ?auto_191140 ) ) ( not ( = ?auto_191137 ?auto_191141 ) ) ( not ( = ?auto_191137 ?auto_191142 ) ) ( not ( = ?auto_191137 ?auto_191143 ) ) ( not ( = ?auto_191137 ?auto_191144 ) ) ( not ( = ?auto_191138 ?auto_191139 ) ) ( not ( = ?auto_191138 ?auto_191140 ) ) ( not ( = ?auto_191138 ?auto_191141 ) ) ( not ( = ?auto_191138 ?auto_191142 ) ) ( not ( = ?auto_191138 ?auto_191143 ) ) ( not ( = ?auto_191138 ?auto_191144 ) ) ( not ( = ?auto_191139 ?auto_191140 ) ) ( not ( = ?auto_191139 ?auto_191141 ) ) ( not ( = ?auto_191139 ?auto_191142 ) ) ( not ( = ?auto_191139 ?auto_191143 ) ) ( not ( = ?auto_191139 ?auto_191144 ) ) ( not ( = ?auto_191140 ?auto_191141 ) ) ( not ( = ?auto_191140 ?auto_191142 ) ) ( not ( = ?auto_191140 ?auto_191143 ) ) ( not ( = ?auto_191140 ?auto_191144 ) ) ( not ( = ?auto_191141 ?auto_191142 ) ) ( not ( = ?auto_191141 ?auto_191143 ) ) ( not ( = ?auto_191141 ?auto_191144 ) ) ( not ( = ?auto_191142 ?auto_191143 ) ) ( not ( = ?auto_191142 ?auto_191144 ) ) ( not ( = ?auto_191143 ?auto_191144 ) ) ( ON ?auto_191142 ?auto_191143 ) ( CLEAR ?auto_191140 ) ( ON ?auto_191141 ?auto_191142 ) ( CLEAR ?auto_191141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_191132 ?auto_191133 ?auto_191134 ?auto_191135 ?auto_191136 ?auto_191137 ?auto_191138 ?auto_191139 ?auto_191140 ?auto_191141 )
      ( MAKE-12PILE ?auto_191132 ?auto_191133 ?auto_191134 ?auto_191135 ?auto_191136 ?auto_191137 ?auto_191138 ?auto_191139 ?auto_191140 ?auto_191141 ?auto_191142 ?auto_191143 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191157 - BLOCK
      ?auto_191158 - BLOCK
      ?auto_191159 - BLOCK
      ?auto_191160 - BLOCK
      ?auto_191161 - BLOCK
      ?auto_191162 - BLOCK
      ?auto_191163 - BLOCK
      ?auto_191164 - BLOCK
      ?auto_191165 - BLOCK
      ?auto_191166 - BLOCK
      ?auto_191167 - BLOCK
      ?auto_191168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191168 ) ( ON-TABLE ?auto_191157 ) ( ON ?auto_191158 ?auto_191157 ) ( ON ?auto_191159 ?auto_191158 ) ( ON ?auto_191160 ?auto_191159 ) ( ON ?auto_191161 ?auto_191160 ) ( ON ?auto_191162 ?auto_191161 ) ( ON ?auto_191163 ?auto_191162 ) ( ON ?auto_191164 ?auto_191163 ) ( ON ?auto_191165 ?auto_191164 ) ( not ( = ?auto_191157 ?auto_191158 ) ) ( not ( = ?auto_191157 ?auto_191159 ) ) ( not ( = ?auto_191157 ?auto_191160 ) ) ( not ( = ?auto_191157 ?auto_191161 ) ) ( not ( = ?auto_191157 ?auto_191162 ) ) ( not ( = ?auto_191157 ?auto_191163 ) ) ( not ( = ?auto_191157 ?auto_191164 ) ) ( not ( = ?auto_191157 ?auto_191165 ) ) ( not ( = ?auto_191157 ?auto_191166 ) ) ( not ( = ?auto_191157 ?auto_191167 ) ) ( not ( = ?auto_191157 ?auto_191168 ) ) ( not ( = ?auto_191158 ?auto_191159 ) ) ( not ( = ?auto_191158 ?auto_191160 ) ) ( not ( = ?auto_191158 ?auto_191161 ) ) ( not ( = ?auto_191158 ?auto_191162 ) ) ( not ( = ?auto_191158 ?auto_191163 ) ) ( not ( = ?auto_191158 ?auto_191164 ) ) ( not ( = ?auto_191158 ?auto_191165 ) ) ( not ( = ?auto_191158 ?auto_191166 ) ) ( not ( = ?auto_191158 ?auto_191167 ) ) ( not ( = ?auto_191158 ?auto_191168 ) ) ( not ( = ?auto_191159 ?auto_191160 ) ) ( not ( = ?auto_191159 ?auto_191161 ) ) ( not ( = ?auto_191159 ?auto_191162 ) ) ( not ( = ?auto_191159 ?auto_191163 ) ) ( not ( = ?auto_191159 ?auto_191164 ) ) ( not ( = ?auto_191159 ?auto_191165 ) ) ( not ( = ?auto_191159 ?auto_191166 ) ) ( not ( = ?auto_191159 ?auto_191167 ) ) ( not ( = ?auto_191159 ?auto_191168 ) ) ( not ( = ?auto_191160 ?auto_191161 ) ) ( not ( = ?auto_191160 ?auto_191162 ) ) ( not ( = ?auto_191160 ?auto_191163 ) ) ( not ( = ?auto_191160 ?auto_191164 ) ) ( not ( = ?auto_191160 ?auto_191165 ) ) ( not ( = ?auto_191160 ?auto_191166 ) ) ( not ( = ?auto_191160 ?auto_191167 ) ) ( not ( = ?auto_191160 ?auto_191168 ) ) ( not ( = ?auto_191161 ?auto_191162 ) ) ( not ( = ?auto_191161 ?auto_191163 ) ) ( not ( = ?auto_191161 ?auto_191164 ) ) ( not ( = ?auto_191161 ?auto_191165 ) ) ( not ( = ?auto_191161 ?auto_191166 ) ) ( not ( = ?auto_191161 ?auto_191167 ) ) ( not ( = ?auto_191161 ?auto_191168 ) ) ( not ( = ?auto_191162 ?auto_191163 ) ) ( not ( = ?auto_191162 ?auto_191164 ) ) ( not ( = ?auto_191162 ?auto_191165 ) ) ( not ( = ?auto_191162 ?auto_191166 ) ) ( not ( = ?auto_191162 ?auto_191167 ) ) ( not ( = ?auto_191162 ?auto_191168 ) ) ( not ( = ?auto_191163 ?auto_191164 ) ) ( not ( = ?auto_191163 ?auto_191165 ) ) ( not ( = ?auto_191163 ?auto_191166 ) ) ( not ( = ?auto_191163 ?auto_191167 ) ) ( not ( = ?auto_191163 ?auto_191168 ) ) ( not ( = ?auto_191164 ?auto_191165 ) ) ( not ( = ?auto_191164 ?auto_191166 ) ) ( not ( = ?auto_191164 ?auto_191167 ) ) ( not ( = ?auto_191164 ?auto_191168 ) ) ( not ( = ?auto_191165 ?auto_191166 ) ) ( not ( = ?auto_191165 ?auto_191167 ) ) ( not ( = ?auto_191165 ?auto_191168 ) ) ( not ( = ?auto_191166 ?auto_191167 ) ) ( not ( = ?auto_191166 ?auto_191168 ) ) ( not ( = ?auto_191167 ?auto_191168 ) ) ( ON ?auto_191167 ?auto_191168 ) ( CLEAR ?auto_191165 ) ( ON ?auto_191166 ?auto_191167 ) ( CLEAR ?auto_191166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_191157 ?auto_191158 ?auto_191159 ?auto_191160 ?auto_191161 ?auto_191162 ?auto_191163 ?auto_191164 ?auto_191165 ?auto_191166 )
      ( MAKE-12PILE ?auto_191157 ?auto_191158 ?auto_191159 ?auto_191160 ?auto_191161 ?auto_191162 ?auto_191163 ?auto_191164 ?auto_191165 ?auto_191166 ?auto_191167 ?auto_191168 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191181 - BLOCK
      ?auto_191182 - BLOCK
      ?auto_191183 - BLOCK
      ?auto_191184 - BLOCK
      ?auto_191185 - BLOCK
      ?auto_191186 - BLOCK
      ?auto_191187 - BLOCK
      ?auto_191188 - BLOCK
      ?auto_191189 - BLOCK
      ?auto_191190 - BLOCK
      ?auto_191191 - BLOCK
      ?auto_191192 - BLOCK
    )
    :vars
    (
      ?auto_191193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191192 ?auto_191193 ) ( ON-TABLE ?auto_191181 ) ( ON ?auto_191182 ?auto_191181 ) ( ON ?auto_191183 ?auto_191182 ) ( ON ?auto_191184 ?auto_191183 ) ( ON ?auto_191185 ?auto_191184 ) ( ON ?auto_191186 ?auto_191185 ) ( ON ?auto_191187 ?auto_191186 ) ( ON ?auto_191188 ?auto_191187 ) ( not ( = ?auto_191181 ?auto_191182 ) ) ( not ( = ?auto_191181 ?auto_191183 ) ) ( not ( = ?auto_191181 ?auto_191184 ) ) ( not ( = ?auto_191181 ?auto_191185 ) ) ( not ( = ?auto_191181 ?auto_191186 ) ) ( not ( = ?auto_191181 ?auto_191187 ) ) ( not ( = ?auto_191181 ?auto_191188 ) ) ( not ( = ?auto_191181 ?auto_191189 ) ) ( not ( = ?auto_191181 ?auto_191190 ) ) ( not ( = ?auto_191181 ?auto_191191 ) ) ( not ( = ?auto_191181 ?auto_191192 ) ) ( not ( = ?auto_191181 ?auto_191193 ) ) ( not ( = ?auto_191182 ?auto_191183 ) ) ( not ( = ?auto_191182 ?auto_191184 ) ) ( not ( = ?auto_191182 ?auto_191185 ) ) ( not ( = ?auto_191182 ?auto_191186 ) ) ( not ( = ?auto_191182 ?auto_191187 ) ) ( not ( = ?auto_191182 ?auto_191188 ) ) ( not ( = ?auto_191182 ?auto_191189 ) ) ( not ( = ?auto_191182 ?auto_191190 ) ) ( not ( = ?auto_191182 ?auto_191191 ) ) ( not ( = ?auto_191182 ?auto_191192 ) ) ( not ( = ?auto_191182 ?auto_191193 ) ) ( not ( = ?auto_191183 ?auto_191184 ) ) ( not ( = ?auto_191183 ?auto_191185 ) ) ( not ( = ?auto_191183 ?auto_191186 ) ) ( not ( = ?auto_191183 ?auto_191187 ) ) ( not ( = ?auto_191183 ?auto_191188 ) ) ( not ( = ?auto_191183 ?auto_191189 ) ) ( not ( = ?auto_191183 ?auto_191190 ) ) ( not ( = ?auto_191183 ?auto_191191 ) ) ( not ( = ?auto_191183 ?auto_191192 ) ) ( not ( = ?auto_191183 ?auto_191193 ) ) ( not ( = ?auto_191184 ?auto_191185 ) ) ( not ( = ?auto_191184 ?auto_191186 ) ) ( not ( = ?auto_191184 ?auto_191187 ) ) ( not ( = ?auto_191184 ?auto_191188 ) ) ( not ( = ?auto_191184 ?auto_191189 ) ) ( not ( = ?auto_191184 ?auto_191190 ) ) ( not ( = ?auto_191184 ?auto_191191 ) ) ( not ( = ?auto_191184 ?auto_191192 ) ) ( not ( = ?auto_191184 ?auto_191193 ) ) ( not ( = ?auto_191185 ?auto_191186 ) ) ( not ( = ?auto_191185 ?auto_191187 ) ) ( not ( = ?auto_191185 ?auto_191188 ) ) ( not ( = ?auto_191185 ?auto_191189 ) ) ( not ( = ?auto_191185 ?auto_191190 ) ) ( not ( = ?auto_191185 ?auto_191191 ) ) ( not ( = ?auto_191185 ?auto_191192 ) ) ( not ( = ?auto_191185 ?auto_191193 ) ) ( not ( = ?auto_191186 ?auto_191187 ) ) ( not ( = ?auto_191186 ?auto_191188 ) ) ( not ( = ?auto_191186 ?auto_191189 ) ) ( not ( = ?auto_191186 ?auto_191190 ) ) ( not ( = ?auto_191186 ?auto_191191 ) ) ( not ( = ?auto_191186 ?auto_191192 ) ) ( not ( = ?auto_191186 ?auto_191193 ) ) ( not ( = ?auto_191187 ?auto_191188 ) ) ( not ( = ?auto_191187 ?auto_191189 ) ) ( not ( = ?auto_191187 ?auto_191190 ) ) ( not ( = ?auto_191187 ?auto_191191 ) ) ( not ( = ?auto_191187 ?auto_191192 ) ) ( not ( = ?auto_191187 ?auto_191193 ) ) ( not ( = ?auto_191188 ?auto_191189 ) ) ( not ( = ?auto_191188 ?auto_191190 ) ) ( not ( = ?auto_191188 ?auto_191191 ) ) ( not ( = ?auto_191188 ?auto_191192 ) ) ( not ( = ?auto_191188 ?auto_191193 ) ) ( not ( = ?auto_191189 ?auto_191190 ) ) ( not ( = ?auto_191189 ?auto_191191 ) ) ( not ( = ?auto_191189 ?auto_191192 ) ) ( not ( = ?auto_191189 ?auto_191193 ) ) ( not ( = ?auto_191190 ?auto_191191 ) ) ( not ( = ?auto_191190 ?auto_191192 ) ) ( not ( = ?auto_191190 ?auto_191193 ) ) ( not ( = ?auto_191191 ?auto_191192 ) ) ( not ( = ?auto_191191 ?auto_191193 ) ) ( not ( = ?auto_191192 ?auto_191193 ) ) ( ON ?auto_191191 ?auto_191192 ) ( ON ?auto_191190 ?auto_191191 ) ( CLEAR ?auto_191188 ) ( ON ?auto_191189 ?auto_191190 ) ( CLEAR ?auto_191189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_191181 ?auto_191182 ?auto_191183 ?auto_191184 ?auto_191185 ?auto_191186 ?auto_191187 ?auto_191188 ?auto_191189 )
      ( MAKE-12PILE ?auto_191181 ?auto_191182 ?auto_191183 ?auto_191184 ?auto_191185 ?auto_191186 ?auto_191187 ?auto_191188 ?auto_191189 ?auto_191190 ?auto_191191 ?auto_191192 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191206 - BLOCK
      ?auto_191207 - BLOCK
      ?auto_191208 - BLOCK
      ?auto_191209 - BLOCK
      ?auto_191210 - BLOCK
      ?auto_191211 - BLOCK
      ?auto_191212 - BLOCK
      ?auto_191213 - BLOCK
      ?auto_191214 - BLOCK
      ?auto_191215 - BLOCK
      ?auto_191216 - BLOCK
      ?auto_191217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191217 ) ( ON-TABLE ?auto_191206 ) ( ON ?auto_191207 ?auto_191206 ) ( ON ?auto_191208 ?auto_191207 ) ( ON ?auto_191209 ?auto_191208 ) ( ON ?auto_191210 ?auto_191209 ) ( ON ?auto_191211 ?auto_191210 ) ( ON ?auto_191212 ?auto_191211 ) ( ON ?auto_191213 ?auto_191212 ) ( not ( = ?auto_191206 ?auto_191207 ) ) ( not ( = ?auto_191206 ?auto_191208 ) ) ( not ( = ?auto_191206 ?auto_191209 ) ) ( not ( = ?auto_191206 ?auto_191210 ) ) ( not ( = ?auto_191206 ?auto_191211 ) ) ( not ( = ?auto_191206 ?auto_191212 ) ) ( not ( = ?auto_191206 ?auto_191213 ) ) ( not ( = ?auto_191206 ?auto_191214 ) ) ( not ( = ?auto_191206 ?auto_191215 ) ) ( not ( = ?auto_191206 ?auto_191216 ) ) ( not ( = ?auto_191206 ?auto_191217 ) ) ( not ( = ?auto_191207 ?auto_191208 ) ) ( not ( = ?auto_191207 ?auto_191209 ) ) ( not ( = ?auto_191207 ?auto_191210 ) ) ( not ( = ?auto_191207 ?auto_191211 ) ) ( not ( = ?auto_191207 ?auto_191212 ) ) ( not ( = ?auto_191207 ?auto_191213 ) ) ( not ( = ?auto_191207 ?auto_191214 ) ) ( not ( = ?auto_191207 ?auto_191215 ) ) ( not ( = ?auto_191207 ?auto_191216 ) ) ( not ( = ?auto_191207 ?auto_191217 ) ) ( not ( = ?auto_191208 ?auto_191209 ) ) ( not ( = ?auto_191208 ?auto_191210 ) ) ( not ( = ?auto_191208 ?auto_191211 ) ) ( not ( = ?auto_191208 ?auto_191212 ) ) ( not ( = ?auto_191208 ?auto_191213 ) ) ( not ( = ?auto_191208 ?auto_191214 ) ) ( not ( = ?auto_191208 ?auto_191215 ) ) ( not ( = ?auto_191208 ?auto_191216 ) ) ( not ( = ?auto_191208 ?auto_191217 ) ) ( not ( = ?auto_191209 ?auto_191210 ) ) ( not ( = ?auto_191209 ?auto_191211 ) ) ( not ( = ?auto_191209 ?auto_191212 ) ) ( not ( = ?auto_191209 ?auto_191213 ) ) ( not ( = ?auto_191209 ?auto_191214 ) ) ( not ( = ?auto_191209 ?auto_191215 ) ) ( not ( = ?auto_191209 ?auto_191216 ) ) ( not ( = ?auto_191209 ?auto_191217 ) ) ( not ( = ?auto_191210 ?auto_191211 ) ) ( not ( = ?auto_191210 ?auto_191212 ) ) ( not ( = ?auto_191210 ?auto_191213 ) ) ( not ( = ?auto_191210 ?auto_191214 ) ) ( not ( = ?auto_191210 ?auto_191215 ) ) ( not ( = ?auto_191210 ?auto_191216 ) ) ( not ( = ?auto_191210 ?auto_191217 ) ) ( not ( = ?auto_191211 ?auto_191212 ) ) ( not ( = ?auto_191211 ?auto_191213 ) ) ( not ( = ?auto_191211 ?auto_191214 ) ) ( not ( = ?auto_191211 ?auto_191215 ) ) ( not ( = ?auto_191211 ?auto_191216 ) ) ( not ( = ?auto_191211 ?auto_191217 ) ) ( not ( = ?auto_191212 ?auto_191213 ) ) ( not ( = ?auto_191212 ?auto_191214 ) ) ( not ( = ?auto_191212 ?auto_191215 ) ) ( not ( = ?auto_191212 ?auto_191216 ) ) ( not ( = ?auto_191212 ?auto_191217 ) ) ( not ( = ?auto_191213 ?auto_191214 ) ) ( not ( = ?auto_191213 ?auto_191215 ) ) ( not ( = ?auto_191213 ?auto_191216 ) ) ( not ( = ?auto_191213 ?auto_191217 ) ) ( not ( = ?auto_191214 ?auto_191215 ) ) ( not ( = ?auto_191214 ?auto_191216 ) ) ( not ( = ?auto_191214 ?auto_191217 ) ) ( not ( = ?auto_191215 ?auto_191216 ) ) ( not ( = ?auto_191215 ?auto_191217 ) ) ( not ( = ?auto_191216 ?auto_191217 ) ) ( ON ?auto_191216 ?auto_191217 ) ( ON ?auto_191215 ?auto_191216 ) ( CLEAR ?auto_191213 ) ( ON ?auto_191214 ?auto_191215 ) ( CLEAR ?auto_191214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_191206 ?auto_191207 ?auto_191208 ?auto_191209 ?auto_191210 ?auto_191211 ?auto_191212 ?auto_191213 ?auto_191214 )
      ( MAKE-12PILE ?auto_191206 ?auto_191207 ?auto_191208 ?auto_191209 ?auto_191210 ?auto_191211 ?auto_191212 ?auto_191213 ?auto_191214 ?auto_191215 ?auto_191216 ?auto_191217 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191230 - BLOCK
      ?auto_191231 - BLOCK
      ?auto_191232 - BLOCK
      ?auto_191233 - BLOCK
      ?auto_191234 - BLOCK
      ?auto_191235 - BLOCK
      ?auto_191236 - BLOCK
      ?auto_191237 - BLOCK
      ?auto_191238 - BLOCK
      ?auto_191239 - BLOCK
      ?auto_191240 - BLOCK
      ?auto_191241 - BLOCK
    )
    :vars
    (
      ?auto_191242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191241 ?auto_191242 ) ( ON-TABLE ?auto_191230 ) ( ON ?auto_191231 ?auto_191230 ) ( ON ?auto_191232 ?auto_191231 ) ( ON ?auto_191233 ?auto_191232 ) ( ON ?auto_191234 ?auto_191233 ) ( ON ?auto_191235 ?auto_191234 ) ( ON ?auto_191236 ?auto_191235 ) ( not ( = ?auto_191230 ?auto_191231 ) ) ( not ( = ?auto_191230 ?auto_191232 ) ) ( not ( = ?auto_191230 ?auto_191233 ) ) ( not ( = ?auto_191230 ?auto_191234 ) ) ( not ( = ?auto_191230 ?auto_191235 ) ) ( not ( = ?auto_191230 ?auto_191236 ) ) ( not ( = ?auto_191230 ?auto_191237 ) ) ( not ( = ?auto_191230 ?auto_191238 ) ) ( not ( = ?auto_191230 ?auto_191239 ) ) ( not ( = ?auto_191230 ?auto_191240 ) ) ( not ( = ?auto_191230 ?auto_191241 ) ) ( not ( = ?auto_191230 ?auto_191242 ) ) ( not ( = ?auto_191231 ?auto_191232 ) ) ( not ( = ?auto_191231 ?auto_191233 ) ) ( not ( = ?auto_191231 ?auto_191234 ) ) ( not ( = ?auto_191231 ?auto_191235 ) ) ( not ( = ?auto_191231 ?auto_191236 ) ) ( not ( = ?auto_191231 ?auto_191237 ) ) ( not ( = ?auto_191231 ?auto_191238 ) ) ( not ( = ?auto_191231 ?auto_191239 ) ) ( not ( = ?auto_191231 ?auto_191240 ) ) ( not ( = ?auto_191231 ?auto_191241 ) ) ( not ( = ?auto_191231 ?auto_191242 ) ) ( not ( = ?auto_191232 ?auto_191233 ) ) ( not ( = ?auto_191232 ?auto_191234 ) ) ( not ( = ?auto_191232 ?auto_191235 ) ) ( not ( = ?auto_191232 ?auto_191236 ) ) ( not ( = ?auto_191232 ?auto_191237 ) ) ( not ( = ?auto_191232 ?auto_191238 ) ) ( not ( = ?auto_191232 ?auto_191239 ) ) ( not ( = ?auto_191232 ?auto_191240 ) ) ( not ( = ?auto_191232 ?auto_191241 ) ) ( not ( = ?auto_191232 ?auto_191242 ) ) ( not ( = ?auto_191233 ?auto_191234 ) ) ( not ( = ?auto_191233 ?auto_191235 ) ) ( not ( = ?auto_191233 ?auto_191236 ) ) ( not ( = ?auto_191233 ?auto_191237 ) ) ( not ( = ?auto_191233 ?auto_191238 ) ) ( not ( = ?auto_191233 ?auto_191239 ) ) ( not ( = ?auto_191233 ?auto_191240 ) ) ( not ( = ?auto_191233 ?auto_191241 ) ) ( not ( = ?auto_191233 ?auto_191242 ) ) ( not ( = ?auto_191234 ?auto_191235 ) ) ( not ( = ?auto_191234 ?auto_191236 ) ) ( not ( = ?auto_191234 ?auto_191237 ) ) ( not ( = ?auto_191234 ?auto_191238 ) ) ( not ( = ?auto_191234 ?auto_191239 ) ) ( not ( = ?auto_191234 ?auto_191240 ) ) ( not ( = ?auto_191234 ?auto_191241 ) ) ( not ( = ?auto_191234 ?auto_191242 ) ) ( not ( = ?auto_191235 ?auto_191236 ) ) ( not ( = ?auto_191235 ?auto_191237 ) ) ( not ( = ?auto_191235 ?auto_191238 ) ) ( not ( = ?auto_191235 ?auto_191239 ) ) ( not ( = ?auto_191235 ?auto_191240 ) ) ( not ( = ?auto_191235 ?auto_191241 ) ) ( not ( = ?auto_191235 ?auto_191242 ) ) ( not ( = ?auto_191236 ?auto_191237 ) ) ( not ( = ?auto_191236 ?auto_191238 ) ) ( not ( = ?auto_191236 ?auto_191239 ) ) ( not ( = ?auto_191236 ?auto_191240 ) ) ( not ( = ?auto_191236 ?auto_191241 ) ) ( not ( = ?auto_191236 ?auto_191242 ) ) ( not ( = ?auto_191237 ?auto_191238 ) ) ( not ( = ?auto_191237 ?auto_191239 ) ) ( not ( = ?auto_191237 ?auto_191240 ) ) ( not ( = ?auto_191237 ?auto_191241 ) ) ( not ( = ?auto_191237 ?auto_191242 ) ) ( not ( = ?auto_191238 ?auto_191239 ) ) ( not ( = ?auto_191238 ?auto_191240 ) ) ( not ( = ?auto_191238 ?auto_191241 ) ) ( not ( = ?auto_191238 ?auto_191242 ) ) ( not ( = ?auto_191239 ?auto_191240 ) ) ( not ( = ?auto_191239 ?auto_191241 ) ) ( not ( = ?auto_191239 ?auto_191242 ) ) ( not ( = ?auto_191240 ?auto_191241 ) ) ( not ( = ?auto_191240 ?auto_191242 ) ) ( not ( = ?auto_191241 ?auto_191242 ) ) ( ON ?auto_191240 ?auto_191241 ) ( ON ?auto_191239 ?auto_191240 ) ( ON ?auto_191238 ?auto_191239 ) ( CLEAR ?auto_191236 ) ( ON ?auto_191237 ?auto_191238 ) ( CLEAR ?auto_191237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191230 ?auto_191231 ?auto_191232 ?auto_191233 ?auto_191234 ?auto_191235 ?auto_191236 ?auto_191237 )
      ( MAKE-12PILE ?auto_191230 ?auto_191231 ?auto_191232 ?auto_191233 ?auto_191234 ?auto_191235 ?auto_191236 ?auto_191237 ?auto_191238 ?auto_191239 ?auto_191240 ?auto_191241 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191255 - BLOCK
      ?auto_191256 - BLOCK
      ?auto_191257 - BLOCK
      ?auto_191258 - BLOCK
      ?auto_191259 - BLOCK
      ?auto_191260 - BLOCK
      ?auto_191261 - BLOCK
      ?auto_191262 - BLOCK
      ?auto_191263 - BLOCK
      ?auto_191264 - BLOCK
      ?auto_191265 - BLOCK
      ?auto_191266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191266 ) ( ON-TABLE ?auto_191255 ) ( ON ?auto_191256 ?auto_191255 ) ( ON ?auto_191257 ?auto_191256 ) ( ON ?auto_191258 ?auto_191257 ) ( ON ?auto_191259 ?auto_191258 ) ( ON ?auto_191260 ?auto_191259 ) ( ON ?auto_191261 ?auto_191260 ) ( not ( = ?auto_191255 ?auto_191256 ) ) ( not ( = ?auto_191255 ?auto_191257 ) ) ( not ( = ?auto_191255 ?auto_191258 ) ) ( not ( = ?auto_191255 ?auto_191259 ) ) ( not ( = ?auto_191255 ?auto_191260 ) ) ( not ( = ?auto_191255 ?auto_191261 ) ) ( not ( = ?auto_191255 ?auto_191262 ) ) ( not ( = ?auto_191255 ?auto_191263 ) ) ( not ( = ?auto_191255 ?auto_191264 ) ) ( not ( = ?auto_191255 ?auto_191265 ) ) ( not ( = ?auto_191255 ?auto_191266 ) ) ( not ( = ?auto_191256 ?auto_191257 ) ) ( not ( = ?auto_191256 ?auto_191258 ) ) ( not ( = ?auto_191256 ?auto_191259 ) ) ( not ( = ?auto_191256 ?auto_191260 ) ) ( not ( = ?auto_191256 ?auto_191261 ) ) ( not ( = ?auto_191256 ?auto_191262 ) ) ( not ( = ?auto_191256 ?auto_191263 ) ) ( not ( = ?auto_191256 ?auto_191264 ) ) ( not ( = ?auto_191256 ?auto_191265 ) ) ( not ( = ?auto_191256 ?auto_191266 ) ) ( not ( = ?auto_191257 ?auto_191258 ) ) ( not ( = ?auto_191257 ?auto_191259 ) ) ( not ( = ?auto_191257 ?auto_191260 ) ) ( not ( = ?auto_191257 ?auto_191261 ) ) ( not ( = ?auto_191257 ?auto_191262 ) ) ( not ( = ?auto_191257 ?auto_191263 ) ) ( not ( = ?auto_191257 ?auto_191264 ) ) ( not ( = ?auto_191257 ?auto_191265 ) ) ( not ( = ?auto_191257 ?auto_191266 ) ) ( not ( = ?auto_191258 ?auto_191259 ) ) ( not ( = ?auto_191258 ?auto_191260 ) ) ( not ( = ?auto_191258 ?auto_191261 ) ) ( not ( = ?auto_191258 ?auto_191262 ) ) ( not ( = ?auto_191258 ?auto_191263 ) ) ( not ( = ?auto_191258 ?auto_191264 ) ) ( not ( = ?auto_191258 ?auto_191265 ) ) ( not ( = ?auto_191258 ?auto_191266 ) ) ( not ( = ?auto_191259 ?auto_191260 ) ) ( not ( = ?auto_191259 ?auto_191261 ) ) ( not ( = ?auto_191259 ?auto_191262 ) ) ( not ( = ?auto_191259 ?auto_191263 ) ) ( not ( = ?auto_191259 ?auto_191264 ) ) ( not ( = ?auto_191259 ?auto_191265 ) ) ( not ( = ?auto_191259 ?auto_191266 ) ) ( not ( = ?auto_191260 ?auto_191261 ) ) ( not ( = ?auto_191260 ?auto_191262 ) ) ( not ( = ?auto_191260 ?auto_191263 ) ) ( not ( = ?auto_191260 ?auto_191264 ) ) ( not ( = ?auto_191260 ?auto_191265 ) ) ( not ( = ?auto_191260 ?auto_191266 ) ) ( not ( = ?auto_191261 ?auto_191262 ) ) ( not ( = ?auto_191261 ?auto_191263 ) ) ( not ( = ?auto_191261 ?auto_191264 ) ) ( not ( = ?auto_191261 ?auto_191265 ) ) ( not ( = ?auto_191261 ?auto_191266 ) ) ( not ( = ?auto_191262 ?auto_191263 ) ) ( not ( = ?auto_191262 ?auto_191264 ) ) ( not ( = ?auto_191262 ?auto_191265 ) ) ( not ( = ?auto_191262 ?auto_191266 ) ) ( not ( = ?auto_191263 ?auto_191264 ) ) ( not ( = ?auto_191263 ?auto_191265 ) ) ( not ( = ?auto_191263 ?auto_191266 ) ) ( not ( = ?auto_191264 ?auto_191265 ) ) ( not ( = ?auto_191264 ?auto_191266 ) ) ( not ( = ?auto_191265 ?auto_191266 ) ) ( ON ?auto_191265 ?auto_191266 ) ( ON ?auto_191264 ?auto_191265 ) ( ON ?auto_191263 ?auto_191264 ) ( CLEAR ?auto_191261 ) ( ON ?auto_191262 ?auto_191263 ) ( CLEAR ?auto_191262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_191255 ?auto_191256 ?auto_191257 ?auto_191258 ?auto_191259 ?auto_191260 ?auto_191261 ?auto_191262 )
      ( MAKE-12PILE ?auto_191255 ?auto_191256 ?auto_191257 ?auto_191258 ?auto_191259 ?auto_191260 ?auto_191261 ?auto_191262 ?auto_191263 ?auto_191264 ?auto_191265 ?auto_191266 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191279 - BLOCK
      ?auto_191280 - BLOCK
      ?auto_191281 - BLOCK
      ?auto_191282 - BLOCK
      ?auto_191283 - BLOCK
      ?auto_191284 - BLOCK
      ?auto_191285 - BLOCK
      ?auto_191286 - BLOCK
      ?auto_191287 - BLOCK
      ?auto_191288 - BLOCK
      ?auto_191289 - BLOCK
      ?auto_191290 - BLOCK
    )
    :vars
    (
      ?auto_191291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191290 ?auto_191291 ) ( ON-TABLE ?auto_191279 ) ( ON ?auto_191280 ?auto_191279 ) ( ON ?auto_191281 ?auto_191280 ) ( ON ?auto_191282 ?auto_191281 ) ( ON ?auto_191283 ?auto_191282 ) ( ON ?auto_191284 ?auto_191283 ) ( not ( = ?auto_191279 ?auto_191280 ) ) ( not ( = ?auto_191279 ?auto_191281 ) ) ( not ( = ?auto_191279 ?auto_191282 ) ) ( not ( = ?auto_191279 ?auto_191283 ) ) ( not ( = ?auto_191279 ?auto_191284 ) ) ( not ( = ?auto_191279 ?auto_191285 ) ) ( not ( = ?auto_191279 ?auto_191286 ) ) ( not ( = ?auto_191279 ?auto_191287 ) ) ( not ( = ?auto_191279 ?auto_191288 ) ) ( not ( = ?auto_191279 ?auto_191289 ) ) ( not ( = ?auto_191279 ?auto_191290 ) ) ( not ( = ?auto_191279 ?auto_191291 ) ) ( not ( = ?auto_191280 ?auto_191281 ) ) ( not ( = ?auto_191280 ?auto_191282 ) ) ( not ( = ?auto_191280 ?auto_191283 ) ) ( not ( = ?auto_191280 ?auto_191284 ) ) ( not ( = ?auto_191280 ?auto_191285 ) ) ( not ( = ?auto_191280 ?auto_191286 ) ) ( not ( = ?auto_191280 ?auto_191287 ) ) ( not ( = ?auto_191280 ?auto_191288 ) ) ( not ( = ?auto_191280 ?auto_191289 ) ) ( not ( = ?auto_191280 ?auto_191290 ) ) ( not ( = ?auto_191280 ?auto_191291 ) ) ( not ( = ?auto_191281 ?auto_191282 ) ) ( not ( = ?auto_191281 ?auto_191283 ) ) ( not ( = ?auto_191281 ?auto_191284 ) ) ( not ( = ?auto_191281 ?auto_191285 ) ) ( not ( = ?auto_191281 ?auto_191286 ) ) ( not ( = ?auto_191281 ?auto_191287 ) ) ( not ( = ?auto_191281 ?auto_191288 ) ) ( not ( = ?auto_191281 ?auto_191289 ) ) ( not ( = ?auto_191281 ?auto_191290 ) ) ( not ( = ?auto_191281 ?auto_191291 ) ) ( not ( = ?auto_191282 ?auto_191283 ) ) ( not ( = ?auto_191282 ?auto_191284 ) ) ( not ( = ?auto_191282 ?auto_191285 ) ) ( not ( = ?auto_191282 ?auto_191286 ) ) ( not ( = ?auto_191282 ?auto_191287 ) ) ( not ( = ?auto_191282 ?auto_191288 ) ) ( not ( = ?auto_191282 ?auto_191289 ) ) ( not ( = ?auto_191282 ?auto_191290 ) ) ( not ( = ?auto_191282 ?auto_191291 ) ) ( not ( = ?auto_191283 ?auto_191284 ) ) ( not ( = ?auto_191283 ?auto_191285 ) ) ( not ( = ?auto_191283 ?auto_191286 ) ) ( not ( = ?auto_191283 ?auto_191287 ) ) ( not ( = ?auto_191283 ?auto_191288 ) ) ( not ( = ?auto_191283 ?auto_191289 ) ) ( not ( = ?auto_191283 ?auto_191290 ) ) ( not ( = ?auto_191283 ?auto_191291 ) ) ( not ( = ?auto_191284 ?auto_191285 ) ) ( not ( = ?auto_191284 ?auto_191286 ) ) ( not ( = ?auto_191284 ?auto_191287 ) ) ( not ( = ?auto_191284 ?auto_191288 ) ) ( not ( = ?auto_191284 ?auto_191289 ) ) ( not ( = ?auto_191284 ?auto_191290 ) ) ( not ( = ?auto_191284 ?auto_191291 ) ) ( not ( = ?auto_191285 ?auto_191286 ) ) ( not ( = ?auto_191285 ?auto_191287 ) ) ( not ( = ?auto_191285 ?auto_191288 ) ) ( not ( = ?auto_191285 ?auto_191289 ) ) ( not ( = ?auto_191285 ?auto_191290 ) ) ( not ( = ?auto_191285 ?auto_191291 ) ) ( not ( = ?auto_191286 ?auto_191287 ) ) ( not ( = ?auto_191286 ?auto_191288 ) ) ( not ( = ?auto_191286 ?auto_191289 ) ) ( not ( = ?auto_191286 ?auto_191290 ) ) ( not ( = ?auto_191286 ?auto_191291 ) ) ( not ( = ?auto_191287 ?auto_191288 ) ) ( not ( = ?auto_191287 ?auto_191289 ) ) ( not ( = ?auto_191287 ?auto_191290 ) ) ( not ( = ?auto_191287 ?auto_191291 ) ) ( not ( = ?auto_191288 ?auto_191289 ) ) ( not ( = ?auto_191288 ?auto_191290 ) ) ( not ( = ?auto_191288 ?auto_191291 ) ) ( not ( = ?auto_191289 ?auto_191290 ) ) ( not ( = ?auto_191289 ?auto_191291 ) ) ( not ( = ?auto_191290 ?auto_191291 ) ) ( ON ?auto_191289 ?auto_191290 ) ( ON ?auto_191288 ?auto_191289 ) ( ON ?auto_191287 ?auto_191288 ) ( ON ?auto_191286 ?auto_191287 ) ( CLEAR ?auto_191284 ) ( ON ?auto_191285 ?auto_191286 ) ( CLEAR ?auto_191285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191279 ?auto_191280 ?auto_191281 ?auto_191282 ?auto_191283 ?auto_191284 ?auto_191285 )
      ( MAKE-12PILE ?auto_191279 ?auto_191280 ?auto_191281 ?auto_191282 ?auto_191283 ?auto_191284 ?auto_191285 ?auto_191286 ?auto_191287 ?auto_191288 ?auto_191289 ?auto_191290 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191304 - BLOCK
      ?auto_191305 - BLOCK
      ?auto_191306 - BLOCK
      ?auto_191307 - BLOCK
      ?auto_191308 - BLOCK
      ?auto_191309 - BLOCK
      ?auto_191310 - BLOCK
      ?auto_191311 - BLOCK
      ?auto_191312 - BLOCK
      ?auto_191313 - BLOCK
      ?auto_191314 - BLOCK
      ?auto_191315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191315 ) ( ON-TABLE ?auto_191304 ) ( ON ?auto_191305 ?auto_191304 ) ( ON ?auto_191306 ?auto_191305 ) ( ON ?auto_191307 ?auto_191306 ) ( ON ?auto_191308 ?auto_191307 ) ( ON ?auto_191309 ?auto_191308 ) ( not ( = ?auto_191304 ?auto_191305 ) ) ( not ( = ?auto_191304 ?auto_191306 ) ) ( not ( = ?auto_191304 ?auto_191307 ) ) ( not ( = ?auto_191304 ?auto_191308 ) ) ( not ( = ?auto_191304 ?auto_191309 ) ) ( not ( = ?auto_191304 ?auto_191310 ) ) ( not ( = ?auto_191304 ?auto_191311 ) ) ( not ( = ?auto_191304 ?auto_191312 ) ) ( not ( = ?auto_191304 ?auto_191313 ) ) ( not ( = ?auto_191304 ?auto_191314 ) ) ( not ( = ?auto_191304 ?auto_191315 ) ) ( not ( = ?auto_191305 ?auto_191306 ) ) ( not ( = ?auto_191305 ?auto_191307 ) ) ( not ( = ?auto_191305 ?auto_191308 ) ) ( not ( = ?auto_191305 ?auto_191309 ) ) ( not ( = ?auto_191305 ?auto_191310 ) ) ( not ( = ?auto_191305 ?auto_191311 ) ) ( not ( = ?auto_191305 ?auto_191312 ) ) ( not ( = ?auto_191305 ?auto_191313 ) ) ( not ( = ?auto_191305 ?auto_191314 ) ) ( not ( = ?auto_191305 ?auto_191315 ) ) ( not ( = ?auto_191306 ?auto_191307 ) ) ( not ( = ?auto_191306 ?auto_191308 ) ) ( not ( = ?auto_191306 ?auto_191309 ) ) ( not ( = ?auto_191306 ?auto_191310 ) ) ( not ( = ?auto_191306 ?auto_191311 ) ) ( not ( = ?auto_191306 ?auto_191312 ) ) ( not ( = ?auto_191306 ?auto_191313 ) ) ( not ( = ?auto_191306 ?auto_191314 ) ) ( not ( = ?auto_191306 ?auto_191315 ) ) ( not ( = ?auto_191307 ?auto_191308 ) ) ( not ( = ?auto_191307 ?auto_191309 ) ) ( not ( = ?auto_191307 ?auto_191310 ) ) ( not ( = ?auto_191307 ?auto_191311 ) ) ( not ( = ?auto_191307 ?auto_191312 ) ) ( not ( = ?auto_191307 ?auto_191313 ) ) ( not ( = ?auto_191307 ?auto_191314 ) ) ( not ( = ?auto_191307 ?auto_191315 ) ) ( not ( = ?auto_191308 ?auto_191309 ) ) ( not ( = ?auto_191308 ?auto_191310 ) ) ( not ( = ?auto_191308 ?auto_191311 ) ) ( not ( = ?auto_191308 ?auto_191312 ) ) ( not ( = ?auto_191308 ?auto_191313 ) ) ( not ( = ?auto_191308 ?auto_191314 ) ) ( not ( = ?auto_191308 ?auto_191315 ) ) ( not ( = ?auto_191309 ?auto_191310 ) ) ( not ( = ?auto_191309 ?auto_191311 ) ) ( not ( = ?auto_191309 ?auto_191312 ) ) ( not ( = ?auto_191309 ?auto_191313 ) ) ( not ( = ?auto_191309 ?auto_191314 ) ) ( not ( = ?auto_191309 ?auto_191315 ) ) ( not ( = ?auto_191310 ?auto_191311 ) ) ( not ( = ?auto_191310 ?auto_191312 ) ) ( not ( = ?auto_191310 ?auto_191313 ) ) ( not ( = ?auto_191310 ?auto_191314 ) ) ( not ( = ?auto_191310 ?auto_191315 ) ) ( not ( = ?auto_191311 ?auto_191312 ) ) ( not ( = ?auto_191311 ?auto_191313 ) ) ( not ( = ?auto_191311 ?auto_191314 ) ) ( not ( = ?auto_191311 ?auto_191315 ) ) ( not ( = ?auto_191312 ?auto_191313 ) ) ( not ( = ?auto_191312 ?auto_191314 ) ) ( not ( = ?auto_191312 ?auto_191315 ) ) ( not ( = ?auto_191313 ?auto_191314 ) ) ( not ( = ?auto_191313 ?auto_191315 ) ) ( not ( = ?auto_191314 ?auto_191315 ) ) ( ON ?auto_191314 ?auto_191315 ) ( ON ?auto_191313 ?auto_191314 ) ( ON ?auto_191312 ?auto_191313 ) ( ON ?auto_191311 ?auto_191312 ) ( CLEAR ?auto_191309 ) ( ON ?auto_191310 ?auto_191311 ) ( CLEAR ?auto_191310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_191304 ?auto_191305 ?auto_191306 ?auto_191307 ?auto_191308 ?auto_191309 ?auto_191310 )
      ( MAKE-12PILE ?auto_191304 ?auto_191305 ?auto_191306 ?auto_191307 ?auto_191308 ?auto_191309 ?auto_191310 ?auto_191311 ?auto_191312 ?auto_191313 ?auto_191314 ?auto_191315 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191328 - BLOCK
      ?auto_191329 - BLOCK
      ?auto_191330 - BLOCK
      ?auto_191331 - BLOCK
      ?auto_191332 - BLOCK
      ?auto_191333 - BLOCK
      ?auto_191334 - BLOCK
      ?auto_191335 - BLOCK
      ?auto_191336 - BLOCK
      ?auto_191337 - BLOCK
      ?auto_191338 - BLOCK
      ?auto_191339 - BLOCK
    )
    :vars
    (
      ?auto_191340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191339 ?auto_191340 ) ( ON-TABLE ?auto_191328 ) ( ON ?auto_191329 ?auto_191328 ) ( ON ?auto_191330 ?auto_191329 ) ( ON ?auto_191331 ?auto_191330 ) ( ON ?auto_191332 ?auto_191331 ) ( not ( = ?auto_191328 ?auto_191329 ) ) ( not ( = ?auto_191328 ?auto_191330 ) ) ( not ( = ?auto_191328 ?auto_191331 ) ) ( not ( = ?auto_191328 ?auto_191332 ) ) ( not ( = ?auto_191328 ?auto_191333 ) ) ( not ( = ?auto_191328 ?auto_191334 ) ) ( not ( = ?auto_191328 ?auto_191335 ) ) ( not ( = ?auto_191328 ?auto_191336 ) ) ( not ( = ?auto_191328 ?auto_191337 ) ) ( not ( = ?auto_191328 ?auto_191338 ) ) ( not ( = ?auto_191328 ?auto_191339 ) ) ( not ( = ?auto_191328 ?auto_191340 ) ) ( not ( = ?auto_191329 ?auto_191330 ) ) ( not ( = ?auto_191329 ?auto_191331 ) ) ( not ( = ?auto_191329 ?auto_191332 ) ) ( not ( = ?auto_191329 ?auto_191333 ) ) ( not ( = ?auto_191329 ?auto_191334 ) ) ( not ( = ?auto_191329 ?auto_191335 ) ) ( not ( = ?auto_191329 ?auto_191336 ) ) ( not ( = ?auto_191329 ?auto_191337 ) ) ( not ( = ?auto_191329 ?auto_191338 ) ) ( not ( = ?auto_191329 ?auto_191339 ) ) ( not ( = ?auto_191329 ?auto_191340 ) ) ( not ( = ?auto_191330 ?auto_191331 ) ) ( not ( = ?auto_191330 ?auto_191332 ) ) ( not ( = ?auto_191330 ?auto_191333 ) ) ( not ( = ?auto_191330 ?auto_191334 ) ) ( not ( = ?auto_191330 ?auto_191335 ) ) ( not ( = ?auto_191330 ?auto_191336 ) ) ( not ( = ?auto_191330 ?auto_191337 ) ) ( not ( = ?auto_191330 ?auto_191338 ) ) ( not ( = ?auto_191330 ?auto_191339 ) ) ( not ( = ?auto_191330 ?auto_191340 ) ) ( not ( = ?auto_191331 ?auto_191332 ) ) ( not ( = ?auto_191331 ?auto_191333 ) ) ( not ( = ?auto_191331 ?auto_191334 ) ) ( not ( = ?auto_191331 ?auto_191335 ) ) ( not ( = ?auto_191331 ?auto_191336 ) ) ( not ( = ?auto_191331 ?auto_191337 ) ) ( not ( = ?auto_191331 ?auto_191338 ) ) ( not ( = ?auto_191331 ?auto_191339 ) ) ( not ( = ?auto_191331 ?auto_191340 ) ) ( not ( = ?auto_191332 ?auto_191333 ) ) ( not ( = ?auto_191332 ?auto_191334 ) ) ( not ( = ?auto_191332 ?auto_191335 ) ) ( not ( = ?auto_191332 ?auto_191336 ) ) ( not ( = ?auto_191332 ?auto_191337 ) ) ( not ( = ?auto_191332 ?auto_191338 ) ) ( not ( = ?auto_191332 ?auto_191339 ) ) ( not ( = ?auto_191332 ?auto_191340 ) ) ( not ( = ?auto_191333 ?auto_191334 ) ) ( not ( = ?auto_191333 ?auto_191335 ) ) ( not ( = ?auto_191333 ?auto_191336 ) ) ( not ( = ?auto_191333 ?auto_191337 ) ) ( not ( = ?auto_191333 ?auto_191338 ) ) ( not ( = ?auto_191333 ?auto_191339 ) ) ( not ( = ?auto_191333 ?auto_191340 ) ) ( not ( = ?auto_191334 ?auto_191335 ) ) ( not ( = ?auto_191334 ?auto_191336 ) ) ( not ( = ?auto_191334 ?auto_191337 ) ) ( not ( = ?auto_191334 ?auto_191338 ) ) ( not ( = ?auto_191334 ?auto_191339 ) ) ( not ( = ?auto_191334 ?auto_191340 ) ) ( not ( = ?auto_191335 ?auto_191336 ) ) ( not ( = ?auto_191335 ?auto_191337 ) ) ( not ( = ?auto_191335 ?auto_191338 ) ) ( not ( = ?auto_191335 ?auto_191339 ) ) ( not ( = ?auto_191335 ?auto_191340 ) ) ( not ( = ?auto_191336 ?auto_191337 ) ) ( not ( = ?auto_191336 ?auto_191338 ) ) ( not ( = ?auto_191336 ?auto_191339 ) ) ( not ( = ?auto_191336 ?auto_191340 ) ) ( not ( = ?auto_191337 ?auto_191338 ) ) ( not ( = ?auto_191337 ?auto_191339 ) ) ( not ( = ?auto_191337 ?auto_191340 ) ) ( not ( = ?auto_191338 ?auto_191339 ) ) ( not ( = ?auto_191338 ?auto_191340 ) ) ( not ( = ?auto_191339 ?auto_191340 ) ) ( ON ?auto_191338 ?auto_191339 ) ( ON ?auto_191337 ?auto_191338 ) ( ON ?auto_191336 ?auto_191337 ) ( ON ?auto_191335 ?auto_191336 ) ( ON ?auto_191334 ?auto_191335 ) ( CLEAR ?auto_191332 ) ( ON ?auto_191333 ?auto_191334 ) ( CLEAR ?auto_191333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191328 ?auto_191329 ?auto_191330 ?auto_191331 ?auto_191332 ?auto_191333 )
      ( MAKE-12PILE ?auto_191328 ?auto_191329 ?auto_191330 ?auto_191331 ?auto_191332 ?auto_191333 ?auto_191334 ?auto_191335 ?auto_191336 ?auto_191337 ?auto_191338 ?auto_191339 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191353 - BLOCK
      ?auto_191354 - BLOCK
      ?auto_191355 - BLOCK
      ?auto_191356 - BLOCK
      ?auto_191357 - BLOCK
      ?auto_191358 - BLOCK
      ?auto_191359 - BLOCK
      ?auto_191360 - BLOCK
      ?auto_191361 - BLOCK
      ?auto_191362 - BLOCK
      ?auto_191363 - BLOCK
      ?auto_191364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191364 ) ( ON-TABLE ?auto_191353 ) ( ON ?auto_191354 ?auto_191353 ) ( ON ?auto_191355 ?auto_191354 ) ( ON ?auto_191356 ?auto_191355 ) ( ON ?auto_191357 ?auto_191356 ) ( not ( = ?auto_191353 ?auto_191354 ) ) ( not ( = ?auto_191353 ?auto_191355 ) ) ( not ( = ?auto_191353 ?auto_191356 ) ) ( not ( = ?auto_191353 ?auto_191357 ) ) ( not ( = ?auto_191353 ?auto_191358 ) ) ( not ( = ?auto_191353 ?auto_191359 ) ) ( not ( = ?auto_191353 ?auto_191360 ) ) ( not ( = ?auto_191353 ?auto_191361 ) ) ( not ( = ?auto_191353 ?auto_191362 ) ) ( not ( = ?auto_191353 ?auto_191363 ) ) ( not ( = ?auto_191353 ?auto_191364 ) ) ( not ( = ?auto_191354 ?auto_191355 ) ) ( not ( = ?auto_191354 ?auto_191356 ) ) ( not ( = ?auto_191354 ?auto_191357 ) ) ( not ( = ?auto_191354 ?auto_191358 ) ) ( not ( = ?auto_191354 ?auto_191359 ) ) ( not ( = ?auto_191354 ?auto_191360 ) ) ( not ( = ?auto_191354 ?auto_191361 ) ) ( not ( = ?auto_191354 ?auto_191362 ) ) ( not ( = ?auto_191354 ?auto_191363 ) ) ( not ( = ?auto_191354 ?auto_191364 ) ) ( not ( = ?auto_191355 ?auto_191356 ) ) ( not ( = ?auto_191355 ?auto_191357 ) ) ( not ( = ?auto_191355 ?auto_191358 ) ) ( not ( = ?auto_191355 ?auto_191359 ) ) ( not ( = ?auto_191355 ?auto_191360 ) ) ( not ( = ?auto_191355 ?auto_191361 ) ) ( not ( = ?auto_191355 ?auto_191362 ) ) ( not ( = ?auto_191355 ?auto_191363 ) ) ( not ( = ?auto_191355 ?auto_191364 ) ) ( not ( = ?auto_191356 ?auto_191357 ) ) ( not ( = ?auto_191356 ?auto_191358 ) ) ( not ( = ?auto_191356 ?auto_191359 ) ) ( not ( = ?auto_191356 ?auto_191360 ) ) ( not ( = ?auto_191356 ?auto_191361 ) ) ( not ( = ?auto_191356 ?auto_191362 ) ) ( not ( = ?auto_191356 ?auto_191363 ) ) ( not ( = ?auto_191356 ?auto_191364 ) ) ( not ( = ?auto_191357 ?auto_191358 ) ) ( not ( = ?auto_191357 ?auto_191359 ) ) ( not ( = ?auto_191357 ?auto_191360 ) ) ( not ( = ?auto_191357 ?auto_191361 ) ) ( not ( = ?auto_191357 ?auto_191362 ) ) ( not ( = ?auto_191357 ?auto_191363 ) ) ( not ( = ?auto_191357 ?auto_191364 ) ) ( not ( = ?auto_191358 ?auto_191359 ) ) ( not ( = ?auto_191358 ?auto_191360 ) ) ( not ( = ?auto_191358 ?auto_191361 ) ) ( not ( = ?auto_191358 ?auto_191362 ) ) ( not ( = ?auto_191358 ?auto_191363 ) ) ( not ( = ?auto_191358 ?auto_191364 ) ) ( not ( = ?auto_191359 ?auto_191360 ) ) ( not ( = ?auto_191359 ?auto_191361 ) ) ( not ( = ?auto_191359 ?auto_191362 ) ) ( not ( = ?auto_191359 ?auto_191363 ) ) ( not ( = ?auto_191359 ?auto_191364 ) ) ( not ( = ?auto_191360 ?auto_191361 ) ) ( not ( = ?auto_191360 ?auto_191362 ) ) ( not ( = ?auto_191360 ?auto_191363 ) ) ( not ( = ?auto_191360 ?auto_191364 ) ) ( not ( = ?auto_191361 ?auto_191362 ) ) ( not ( = ?auto_191361 ?auto_191363 ) ) ( not ( = ?auto_191361 ?auto_191364 ) ) ( not ( = ?auto_191362 ?auto_191363 ) ) ( not ( = ?auto_191362 ?auto_191364 ) ) ( not ( = ?auto_191363 ?auto_191364 ) ) ( ON ?auto_191363 ?auto_191364 ) ( ON ?auto_191362 ?auto_191363 ) ( ON ?auto_191361 ?auto_191362 ) ( ON ?auto_191360 ?auto_191361 ) ( ON ?auto_191359 ?auto_191360 ) ( CLEAR ?auto_191357 ) ( ON ?auto_191358 ?auto_191359 ) ( CLEAR ?auto_191358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_191353 ?auto_191354 ?auto_191355 ?auto_191356 ?auto_191357 ?auto_191358 )
      ( MAKE-12PILE ?auto_191353 ?auto_191354 ?auto_191355 ?auto_191356 ?auto_191357 ?auto_191358 ?auto_191359 ?auto_191360 ?auto_191361 ?auto_191362 ?auto_191363 ?auto_191364 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191377 - BLOCK
      ?auto_191378 - BLOCK
      ?auto_191379 - BLOCK
      ?auto_191380 - BLOCK
      ?auto_191381 - BLOCK
      ?auto_191382 - BLOCK
      ?auto_191383 - BLOCK
      ?auto_191384 - BLOCK
      ?auto_191385 - BLOCK
      ?auto_191386 - BLOCK
      ?auto_191387 - BLOCK
      ?auto_191388 - BLOCK
    )
    :vars
    (
      ?auto_191389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191388 ?auto_191389 ) ( ON-TABLE ?auto_191377 ) ( ON ?auto_191378 ?auto_191377 ) ( ON ?auto_191379 ?auto_191378 ) ( ON ?auto_191380 ?auto_191379 ) ( not ( = ?auto_191377 ?auto_191378 ) ) ( not ( = ?auto_191377 ?auto_191379 ) ) ( not ( = ?auto_191377 ?auto_191380 ) ) ( not ( = ?auto_191377 ?auto_191381 ) ) ( not ( = ?auto_191377 ?auto_191382 ) ) ( not ( = ?auto_191377 ?auto_191383 ) ) ( not ( = ?auto_191377 ?auto_191384 ) ) ( not ( = ?auto_191377 ?auto_191385 ) ) ( not ( = ?auto_191377 ?auto_191386 ) ) ( not ( = ?auto_191377 ?auto_191387 ) ) ( not ( = ?auto_191377 ?auto_191388 ) ) ( not ( = ?auto_191377 ?auto_191389 ) ) ( not ( = ?auto_191378 ?auto_191379 ) ) ( not ( = ?auto_191378 ?auto_191380 ) ) ( not ( = ?auto_191378 ?auto_191381 ) ) ( not ( = ?auto_191378 ?auto_191382 ) ) ( not ( = ?auto_191378 ?auto_191383 ) ) ( not ( = ?auto_191378 ?auto_191384 ) ) ( not ( = ?auto_191378 ?auto_191385 ) ) ( not ( = ?auto_191378 ?auto_191386 ) ) ( not ( = ?auto_191378 ?auto_191387 ) ) ( not ( = ?auto_191378 ?auto_191388 ) ) ( not ( = ?auto_191378 ?auto_191389 ) ) ( not ( = ?auto_191379 ?auto_191380 ) ) ( not ( = ?auto_191379 ?auto_191381 ) ) ( not ( = ?auto_191379 ?auto_191382 ) ) ( not ( = ?auto_191379 ?auto_191383 ) ) ( not ( = ?auto_191379 ?auto_191384 ) ) ( not ( = ?auto_191379 ?auto_191385 ) ) ( not ( = ?auto_191379 ?auto_191386 ) ) ( not ( = ?auto_191379 ?auto_191387 ) ) ( not ( = ?auto_191379 ?auto_191388 ) ) ( not ( = ?auto_191379 ?auto_191389 ) ) ( not ( = ?auto_191380 ?auto_191381 ) ) ( not ( = ?auto_191380 ?auto_191382 ) ) ( not ( = ?auto_191380 ?auto_191383 ) ) ( not ( = ?auto_191380 ?auto_191384 ) ) ( not ( = ?auto_191380 ?auto_191385 ) ) ( not ( = ?auto_191380 ?auto_191386 ) ) ( not ( = ?auto_191380 ?auto_191387 ) ) ( not ( = ?auto_191380 ?auto_191388 ) ) ( not ( = ?auto_191380 ?auto_191389 ) ) ( not ( = ?auto_191381 ?auto_191382 ) ) ( not ( = ?auto_191381 ?auto_191383 ) ) ( not ( = ?auto_191381 ?auto_191384 ) ) ( not ( = ?auto_191381 ?auto_191385 ) ) ( not ( = ?auto_191381 ?auto_191386 ) ) ( not ( = ?auto_191381 ?auto_191387 ) ) ( not ( = ?auto_191381 ?auto_191388 ) ) ( not ( = ?auto_191381 ?auto_191389 ) ) ( not ( = ?auto_191382 ?auto_191383 ) ) ( not ( = ?auto_191382 ?auto_191384 ) ) ( not ( = ?auto_191382 ?auto_191385 ) ) ( not ( = ?auto_191382 ?auto_191386 ) ) ( not ( = ?auto_191382 ?auto_191387 ) ) ( not ( = ?auto_191382 ?auto_191388 ) ) ( not ( = ?auto_191382 ?auto_191389 ) ) ( not ( = ?auto_191383 ?auto_191384 ) ) ( not ( = ?auto_191383 ?auto_191385 ) ) ( not ( = ?auto_191383 ?auto_191386 ) ) ( not ( = ?auto_191383 ?auto_191387 ) ) ( not ( = ?auto_191383 ?auto_191388 ) ) ( not ( = ?auto_191383 ?auto_191389 ) ) ( not ( = ?auto_191384 ?auto_191385 ) ) ( not ( = ?auto_191384 ?auto_191386 ) ) ( not ( = ?auto_191384 ?auto_191387 ) ) ( not ( = ?auto_191384 ?auto_191388 ) ) ( not ( = ?auto_191384 ?auto_191389 ) ) ( not ( = ?auto_191385 ?auto_191386 ) ) ( not ( = ?auto_191385 ?auto_191387 ) ) ( not ( = ?auto_191385 ?auto_191388 ) ) ( not ( = ?auto_191385 ?auto_191389 ) ) ( not ( = ?auto_191386 ?auto_191387 ) ) ( not ( = ?auto_191386 ?auto_191388 ) ) ( not ( = ?auto_191386 ?auto_191389 ) ) ( not ( = ?auto_191387 ?auto_191388 ) ) ( not ( = ?auto_191387 ?auto_191389 ) ) ( not ( = ?auto_191388 ?auto_191389 ) ) ( ON ?auto_191387 ?auto_191388 ) ( ON ?auto_191386 ?auto_191387 ) ( ON ?auto_191385 ?auto_191386 ) ( ON ?auto_191384 ?auto_191385 ) ( ON ?auto_191383 ?auto_191384 ) ( ON ?auto_191382 ?auto_191383 ) ( CLEAR ?auto_191380 ) ( ON ?auto_191381 ?auto_191382 ) ( CLEAR ?auto_191381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191377 ?auto_191378 ?auto_191379 ?auto_191380 ?auto_191381 )
      ( MAKE-12PILE ?auto_191377 ?auto_191378 ?auto_191379 ?auto_191380 ?auto_191381 ?auto_191382 ?auto_191383 ?auto_191384 ?auto_191385 ?auto_191386 ?auto_191387 ?auto_191388 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191402 - BLOCK
      ?auto_191403 - BLOCK
      ?auto_191404 - BLOCK
      ?auto_191405 - BLOCK
      ?auto_191406 - BLOCK
      ?auto_191407 - BLOCK
      ?auto_191408 - BLOCK
      ?auto_191409 - BLOCK
      ?auto_191410 - BLOCK
      ?auto_191411 - BLOCK
      ?auto_191412 - BLOCK
      ?auto_191413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191413 ) ( ON-TABLE ?auto_191402 ) ( ON ?auto_191403 ?auto_191402 ) ( ON ?auto_191404 ?auto_191403 ) ( ON ?auto_191405 ?auto_191404 ) ( not ( = ?auto_191402 ?auto_191403 ) ) ( not ( = ?auto_191402 ?auto_191404 ) ) ( not ( = ?auto_191402 ?auto_191405 ) ) ( not ( = ?auto_191402 ?auto_191406 ) ) ( not ( = ?auto_191402 ?auto_191407 ) ) ( not ( = ?auto_191402 ?auto_191408 ) ) ( not ( = ?auto_191402 ?auto_191409 ) ) ( not ( = ?auto_191402 ?auto_191410 ) ) ( not ( = ?auto_191402 ?auto_191411 ) ) ( not ( = ?auto_191402 ?auto_191412 ) ) ( not ( = ?auto_191402 ?auto_191413 ) ) ( not ( = ?auto_191403 ?auto_191404 ) ) ( not ( = ?auto_191403 ?auto_191405 ) ) ( not ( = ?auto_191403 ?auto_191406 ) ) ( not ( = ?auto_191403 ?auto_191407 ) ) ( not ( = ?auto_191403 ?auto_191408 ) ) ( not ( = ?auto_191403 ?auto_191409 ) ) ( not ( = ?auto_191403 ?auto_191410 ) ) ( not ( = ?auto_191403 ?auto_191411 ) ) ( not ( = ?auto_191403 ?auto_191412 ) ) ( not ( = ?auto_191403 ?auto_191413 ) ) ( not ( = ?auto_191404 ?auto_191405 ) ) ( not ( = ?auto_191404 ?auto_191406 ) ) ( not ( = ?auto_191404 ?auto_191407 ) ) ( not ( = ?auto_191404 ?auto_191408 ) ) ( not ( = ?auto_191404 ?auto_191409 ) ) ( not ( = ?auto_191404 ?auto_191410 ) ) ( not ( = ?auto_191404 ?auto_191411 ) ) ( not ( = ?auto_191404 ?auto_191412 ) ) ( not ( = ?auto_191404 ?auto_191413 ) ) ( not ( = ?auto_191405 ?auto_191406 ) ) ( not ( = ?auto_191405 ?auto_191407 ) ) ( not ( = ?auto_191405 ?auto_191408 ) ) ( not ( = ?auto_191405 ?auto_191409 ) ) ( not ( = ?auto_191405 ?auto_191410 ) ) ( not ( = ?auto_191405 ?auto_191411 ) ) ( not ( = ?auto_191405 ?auto_191412 ) ) ( not ( = ?auto_191405 ?auto_191413 ) ) ( not ( = ?auto_191406 ?auto_191407 ) ) ( not ( = ?auto_191406 ?auto_191408 ) ) ( not ( = ?auto_191406 ?auto_191409 ) ) ( not ( = ?auto_191406 ?auto_191410 ) ) ( not ( = ?auto_191406 ?auto_191411 ) ) ( not ( = ?auto_191406 ?auto_191412 ) ) ( not ( = ?auto_191406 ?auto_191413 ) ) ( not ( = ?auto_191407 ?auto_191408 ) ) ( not ( = ?auto_191407 ?auto_191409 ) ) ( not ( = ?auto_191407 ?auto_191410 ) ) ( not ( = ?auto_191407 ?auto_191411 ) ) ( not ( = ?auto_191407 ?auto_191412 ) ) ( not ( = ?auto_191407 ?auto_191413 ) ) ( not ( = ?auto_191408 ?auto_191409 ) ) ( not ( = ?auto_191408 ?auto_191410 ) ) ( not ( = ?auto_191408 ?auto_191411 ) ) ( not ( = ?auto_191408 ?auto_191412 ) ) ( not ( = ?auto_191408 ?auto_191413 ) ) ( not ( = ?auto_191409 ?auto_191410 ) ) ( not ( = ?auto_191409 ?auto_191411 ) ) ( not ( = ?auto_191409 ?auto_191412 ) ) ( not ( = ?auto_191409 ?auto_191413 ) ) ( not ( = ?auto_191410 ?auto_191411 ) ) ( not ( = ?auto_191410 ?auto_191412 ) ) ( not ( = ?auto_191410 ?auto_191413 ) ) ( not ( = ?auto_191411 ?auto_191412 ) ) ( not ( = ?auto_191411 ?auto_191413 ) ) ( not ( = ?auto_191412 ?auto_191413 ) ) ( ON ?auto_191412 ?auto_191413 ) ( ON ?auto_191411 ?auto_191412 ) ( ON ?auto_191410 ?auto_191411 ) ( ON ?auto_191409 ?auto_191410 ) ( ON ?auto_191408 ?auto_191409 ) ( ON ?auto_191407 ?auto_191408 ) ( CLEAR ?auto_191405 ) ( ON ?auto_191406 ?auto_191407 ) ( CLEAR ?auto_191406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_191402 ?auto_191403 ?auto_191404 ?auto_191405 ?auto_191406 )
      ( MAKE-12PILE ?auto_191402 ?auto_191403 ?auto_191404 ?auto_191405 ?auto_191406 ?auto_191407 ?auto_191408 ?auto_191409 ?auto_191410 ?auto_191411 ?auto_191412 ?auto_191413 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191426 - BLOCK
      ?auto_191427 - BLOCK
      ?auto_191428 - BLOCK
      ?auto_191429 - BLOCK
      ?auto_191430 - BLOCK
      ?auto_191431 - BLOCK
      ?auto_191432 - BLOCK
      ?auto_191433 - BLOCK
      ?auto_191434 - BLOCK
      ?auto_191435 - BLOCK
      ?auto_191436 - BLOCK
      ?auto_191437 - BLOCK
    )
    :vars
    (
      ?auto_191438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191437 ?auto_191438 ) ( ON-TABLE ?auto_191426 ) ( ON ?auto_191427 ?auto_191426 ) ( ON ?auto_191428 ?auto_191427 ) ( not ( = ?auto_191426 ?auto_191427 ) ) ( not ( = ?auto_191426 ?auto_191428 ) ) ( not ( = ?auto_191426 ?auto_191429 ) ) ( not ( = ?auto_191426 ?auto_191430 ) ) ( not ( = ?auto_191426 ?auto_191431 ) ) ( not ( = ?auto_191426 ?auto_191432 ) ) ( not ( = ?auto_191426 ?auto_191433 ) ) ( not ( = ?auto_191426 ?auto_191434 ) ) ( not ( = ?auto_191426 ?auto_191435 ) ) ( not ( = ?auto_191426 ?auto_191436 ) ) ( not ( = ?auto_191426 ?auto_191437 ) ) ( not ( = ?auto_191426 ?auto_191438 ) ) ( not ( = ?auto_191427 ?auto_191428 ) ) ( not ( = ?auto_191427 ?auto_191429 ) ) ( not ( = ?auto_191427 ?auto_191430 ) ) ( not ( = ?auto_191427 ?auto_191431 ) ) ( not ( = ?auto_191427 ?auto_191432 ) ) ( not ( = ?auto_191427 ?auto_191433 ) ) ( not ( = ?auto_191427 ?auto_191434 ) ) ( not ( = ?auto_191427 ?auto_191435 ) ) ( not ( = ?auto_191427 ?auto_191436 ) ) ( not ( = ?auto_191427 ?auto_191437 ) ) ( not ( = ?auto_191427 ?auto_191438 ) ) ( not ( = ?auto_191428 ?auto_191429 ) ) ( not ( = ?auto_191428 ?auto_191430 ) ) ( not ( = ?auto_191428 ?auto_191431 ) ) ( not ( = ?auto_191428 ?auto_191432 ) ) ( not ( = ?auto_191428 ?auto_191433 ) ) ( not ( = ?auto_191428 ?auto_191434 ) ) ( not ( = ?auto_191428 ?auto_191435 ) ) ( not ( = ?auto_191428 ?auto_191436 ) ) ( not ( = ?auto_191428 ?auto_191437 ) ) ( not ( = ?auto_191428 ?auto_191438 ) ) ( not ( = ?auto_191429 ?auto_191430 ) ) ( not ( = ?auto_191429 ?auto_191431 ) ) ( not ( = ?auto_191429 ?auto_191432 ) ) ( not ( = ?auto_191429 ?auto_191433 ) ) ( not ( = ?auto_191429 ?auto_191434 ) ) ( not ( = ?auto_191429 ?auto_191435 ) ) ( not ( = ?auto_191429 ?auto_191436 ) ) ( not ( = ?auto_191429 ?auto_191437 ) ) ( not ( = ?auto_191429 ?auto_191438 ) ) ( not ( = ?auto_191430 ?auto_191431 ) ) ( not ( = ?auto_191430 ?auto_191432 ) ) ( not ( = ?auto_191430 ?auto_191433 ) ) ( not ( = ?auto_191430 ?auto_191434 ) ) ( not ( = ?auto_191430 ?auto_191435 ) ) ( not ( = ?auto_191430 ?auto_191436 ) ) ( not ( = ?auto_191430 ?auto_191437 ) ) ( not ( = ?auto_191430 ?auto_191438 ) ) ( not ( = ?auto_191431 ?auto_191432 ) ) ( not ( = ?auto_191431 ?auto_191433 ) ) ( not ( = ?auto_191431 ?auto_191434 ) ) ( not ( = ?auto_191431 ?auto_191435 ) ) ( not ( = ?auto_191431 ?auto_191436 ) ) ( not ( = ?auto_191431 ?auto_191437 ) ) ( not ( = ?auto_191431 ?auto_191438 ) ) ( not ( = ?auto_191432 ?auto_191433 ) ) ( not ( = ?auto_191432 ?auto_191434 ) ) ( not ( = ?auto_191432 ?auto_191435 ) ) ( not ( = ?auto_191432 ?auto_191436 ) ) ( not ( = ?auto_191432 ?auto_191437 ) ) ( not ( = ?auto_191432 ?auto_191438 ) ) ( not ( = ?auto_191433 ?auto_191434 ) ) ( not ( = ?auto_191433 ?auto_191435 ) ) ( not ( = ?auto_191433 ?auto_191436 ) ) ( not ( = ?auto_191433 ?auto_191437 ) ) ( not ( = ?auto_191433 ?auto_191438 ) ) ( not ( = ?auto_191434 ?auto_191435 ) ) ( not ( = ?auto_191434 ?auto_191436 ) ) ( not ( = ?auto_191434 ?auto_191437 ) ) ( not ( = ?auto_191434 ?auto_191438 ) ) ( not ( = ?auto_191435 ?auto_191436 ) ) ( not ( = ?auto_191435 ?auto_191437 ) ) ( not ( = ?auto_191435 ?auto_191438 ) ) ( not ( = ?auto_191436 ?auto_191437 ) ) ( not ( = ?auto_191436 ?auto_191438 ) ) ( not ( = ?auto_191437 ?auto_191438 ) ) ( ON ?auto_191436 ?auto_191437 ) ( ON ?auto_191435 ?auto_191436 ) ( ON ?auto_191434 ?auto_191435 ) ( ON ?auto_191433 ?auto_191434 ) ( ON ?auto_191432 ?auto_191433 ) ( ON ?auto_191431 ?auto_191432 ) ( ON ?auto_191430 ?auto_191431 ) ( CLEAR ?auto_191428 ) ( ON ?auto_191429 ?auto_191430 ) ( CLEAR ?auto_191429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191426 ?auto_191427 ?auto_191428 ?auto_191429 )
      ( MAKE-12PILE ?auto_191426 ?auto_191427 ?auto_191428 ?auto_191429 ?auto_191430 ?auto_191431 ?auto_191432 ?auto_191433 ?auto_191434 ?auto_191435 ?auto_191436 ?auto_191437 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191451 - BLOCK
      ?auto_191452 - BLOCK
      ?auto_191453 - BLOCK
      ?auto_191454 - BLOCK
      ?auto_191455 - BLOCK
      ?auto_191456 - BLOCK
      ?auto_191457 - BLOCK
      ?auto_191458 - BLOCK
      ?auto_191459 - BLOCK
      ?auto_191460 - BLOCK
      ?auto_191461 - BLOCK
      ?auto_191462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191462 ) ( ON-TABLE ?auto_191451 ) ( ON ?auto_191452 ?auto_191451 ) ( ON ?auto_191453 ?auto_191452 ) ( not ( = ?auto_191451 ?auto_191452 ) ) ( not ( = ?auto_191451 ?auto_191453 ) ) ( not ( = ?auto_191451 ?auto_191454 ) ) ( not ( = ?auto_191451 ?auto_191455 ) ) ( not ( = ?auto_191451 ?auto_191456 ) ) ( not ( = ?auto_191451 ?auto_191457 ) ) ( not ( = ?auto_191451 ?auto_191458 ) ) ( not ( = ?auto_191451 ?auto_191459 ) ) ( not ( = ?auto_191451 ?auto_191460 ) ) ( not ( = ?auto_191451 ?auto_191461 ) ) ( not ( = ?auto_191451 ?auto_191462 ) ) ( not ( = ?auto_191452 ?auto_191453 ) ) ( not ( = ?auto_191452 ?auto_191454 ) ) ( not ( = ?auto_191452 ?auto_191455 ) ) ( not ( = ?auto_191452 ?auto_191456 ) ) ( not ( = ?auto_191452 ?auto_191457 ) ) ( not ( = ?auto_191452 ?auto_191458 ) ) ( not ( = ?auto_191452 ?auto_191459 ) ) ( not ( = ?auto_191452 ?auto_191460 ) ) ( not ( = ?auto_191452 ?auto_191461 ) ) ( not ( = ?auto_191452 ?auto_191462 ) ) ( not ( = ?auto_191453 ?auto_191454 ) ) ( not ( = ?auto_191453 ?auto_191455 ) ) ( not ( = ?auto_191453 ?auto_191456 ) ) ( not ( = ?auto_191453 ?auto_191457 ) ) ( not ( = ?auto_191453 ?auto_191458 ) ) ( not ( = ?auto_191453 ?auto_191459 ) ) ( not ( = ?auto_191453 ?auto_191460 ) ) ( not ( = ?auto_191453 ?auto_191461 ) ) ( not ( = ?auto_191453 ?auto_191462 ) ) ( not ( = ?auto_191454 ?auto_191455 ) ) ( not ( = ?auto_191454 ?auto_191456 ) ) ( not ( = ?auto_191454 ?auto_191457 ) ) ( not ( = ?auto_191454 ?auto_191458 ) ) ( not ( = ?auto_191454 ?auto_191459 ) ) ( not ( = ?auto_191454 ?auto_191460 ) ) ( not ( = ?auto_191454 ?auto_191461 ) ) ( not ( = ?auto_191454 ?auto_191462 ) ) ( not ( = ?auto_191455 ?auto_191456 ) ) ( not ( = ?auto_191455 ?auto_191457 ) ) ( not ( = ?auto_191455 ?auto_191458 ) ) ( not ( = ?auto_191455 ?auto_191459 ) ) ( not ( = ?auto_191455 ?auto_191460 ) ) ( not ( = ?auto_191455 ?auto_191461 ) ) ( not ( = ?auto_191455 ?auto_191462 ) ) ( not ( = ?auto_191456 ?auto_191457 ) ) ( not ( = ?auto_191456 ?auto_191458 ) ) ( not ( = ?auto_191456 ?auto_191459 ) ) ( not ( = ?auto_191456 ?auto_191460 ) ) ( not ( = ?auto_191456 ?auto_191461 ) ) ( not ( = ?auto_191456 ?auto_191462 ) ) ( not ( = ?auto_191457 ?auto_191458 ) ) ( not ( = ?auto_191457 ?auto_191459 ) ) ( not ( = ?auto_191457 ?auto_191460 ) ) ( not ( = ?auto_191457 ?auto_191461 ) ) ( not ( = ?auto_191457 ?auto_191462 ) ) ( not ( = ?auto_191458 ?auto_191459 ) ) ( not ( = ?auto_191458 ?auto_191460 ) ) ( not ( = ?auto_191458 ?auto_191461 ) ) ( not ( = ?auto_191458 ?auto_191462 ) ) ( not ( = ?auto_191459 ?auto_191460 ) ) ( not ( = ?auto_191459 ?auto_191461 ) ) ( not ( = ?auto_191459 ?auto_191462 ) ) ( not ( = ?auto_191460 ?auto_191461 ) ) ( not ( = ?auto_191460 ?auto_191462 ) ) ( not ( = ?auto_191461 ?auto_191462 ) ) ( ON ?auto_191461 ?auto_191462 ) ( ON ?auto_191460 ?auto_191461 ) ( ON ?auto_191459 ?auto_191460 ) ( ON ?auto_191458 ?auto_191459 ) ( ON ?auto_191457 ?auto_191458 ) ( ON ?auto_191456 ?auto_191457 ) ( ON ?auto_191455 ?auto_191456 ) ( CLEAR ?auto_191453 ) ( ON ?auto_191454 ?auto_191455 ) ( CLEAR ?auto_191454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_191451 ?auto_191452 ?auto_191453 ?auto_191454 )
      ( MAKE-12PILE ?auto_191451 ?auto_191452 ?auto_191453 ?auto_191454 ?auto_191455 ?auto_191456 ?auto_191457 ?auto_191458 ?auto_191459 ?auto_191460 ?auto_191461 ?auto_191462 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191475 - BLOCK
      ?auto_191476 - BLOCK
      ?auto_191477 - BLOCK
      ?auto_191478 - BLOCK
      ?auto_191479 - BLOCK
      ?auto_191480 - BLOCK
      ?auto_191481 - BLOCK
      ?auto_191482 - BLOCK
      ?auto_191483 - BLOCK
      ?auto_191484 - BLOCK
      ?auto_191485 - BLOCK
      ?auto_191486 - BLOCK
    )
    :vars
    (
      ?auto_191487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191486 ?auto_191487 ) ( ON-TABLE ?auto_191475 ) ( ON ?auto_191476 ?auto_191475 ) ( not ( = ?auto_191475 ?auto_191476 ) ) ( not ( = ?auto_191475 ?auto_191477 ) ) ( not ( = ?auto_191475 ?auto_191478 ) ) ( not ( = ?auto_191475 ?auto_191479 ) ) ( not ( = ?auto_191475 ?auto_191480 ) ) ( not ( = ?auto_191475 ?auto_191481 ) ) ( not ( = ?auto_191475 ?auto_191482 ) ) ( not ( = ?auto_191475 ?auto_191483 ) ) ( not ( = ?auto_191475 ?auto_191484 ) ) ( not ( = ?auto_191475 ?auto_191485 ) ) ( not ( = ?auto_191475 ?auto_191486 ) ) ( not ( = ?auto_191475 ?auto_191487 ) ) ( not ( = ?auto_191476 ?auto_191477 ) ) ( not ( = ?auto_191476 ?auto_191478 ) ) ( not ( = ?auto_191476 ?auto_191479 ) ) ( not ( = ?auto_191476 ?auto_191480 ) ) ( not ( = ?auto_191476 ?auto_191481 ) ) ( not ( = ?auto_191476 ?auto_191482 ) ) ( not ( = ?auto_191476 ?auto_191483 ) ) ( not ( = ?auto_191476 ?auto_191484 ) ) ( not ( = ?auto_191476 ?auto_191485 ) ) ( not ( = ?auto_191476 ?auto_191486 ) ) ( not ( = ?auto_191476 ?auto_191487 ) ) ( not ( = ?auto_191477 ?auto_191478 ) ) ( not ( = ?auto_191477 ?auto_191479 ) ) ( not ( = ?auto_191477 ?auto_191480 ) ) ( not ( = ?auto_191477 ?auto_191481 ) ) ( not ( = ?auto_191477 ?auto_191482 ) ) ( not ( = ?auto_191477 ?auto_191483 ) ) ( not ( = ?auto_191477 ?auto_191484 ) ) ( not ( = ?auto_191477 ?auto_191485 ) ) ( not ( = ?auto_191477 ?auto_191486 ) ) ( not ( = ?auto_191477 ?auto_191487 ) ) ( not ( = ?auto_191478 ?auto_191479 ) ) ( not ( = ?auto_191478 ?auto_191480 ) ) ( not ( = ?auto_191478 ?auto_191481 ) ) ( not ( = ?auto_191478 ?auto_191482 ) ) ( not ( = ?auto_191478 ?auto_191483 ) ) ( not ( = ?auto_191478 ?auto_191484 ) ) ( not ( = ?auto_191478 ?auto_191485 ) ) ( not ( = ?auto_191478 ?auto_191486 ) ) ( not ( = ?auto_191478 ?auto_191487 ) ) ( not ( = ?auto_191479 ?auto_191480 ) ) ( not ( = ?auto_191479 ?auto_191481 ) ) ( not ( = ?auto_191479 ?auto_191482 ) ) ( not ( = ?auto_191479 ?auto_191483 ) ) ( not ( = ?auto_191479 ?auto_191484 ) ) ( not ( = ?auto_191479 ?auto_191485 ) ) ( not ( = ?auto_191479 ?auto_191486 ) ) ( not ( = ?auto_191479 ?auto_191487 ) ) ( not ( = ?auto_191480 ?auto_191481 ) ) ( not ( = ?auto_191480 ?auto_191482 ) ) ( not ( = ?auto_191480 ?auto_191483 ) ) ( not ( = ?auto_191480 ?auto_191484 ) ) ( not ( = ?auto_191480 ?auto_191485 ) ) ( not ( = ?auto_191480 ?auto_191486 ) ) ( not ( = ?auto_191480 ?auto_191487 ) ) ( not ( = ?auto_191481 ?auto_191482 ) ) ( not ( = ?auto_191481 ?auto_191483 ) ) ( not ( = ?auto_191481 ?auto_191484 ) ) ( not ( = ?auto_191481 ?auto_191485 ) ) ( not ( = ?auto_191481 ?auto_191486 ) ) ( not ( = ?auto_191481 ?auto_191487 ) ) ( not ( = ?auto_191482 ?auto_191483 ) ) ( not ( = ?auto_191482 ?auto_191484 ) ) ( not ( = ?auto_191482 ?auto_191485 ) ) ( not ( = ?auto_191482 ?auto_191486 ) ) ( not ( = ?auto_191482 ?auto_191487 ) ) ( not ( = ?auto_191483 ?auto_191484 ) ) ( not ( = ?auto_191483 ?auto_191485 ) ) ( not ( = ?auto_191483 ?auto_191486 ) ) ( not ( = ?auto_191483 ?auto_191487 ) ) ( not ( = ?auto_191484 ?auto_191485 ) ) ( not ( = ?auto_191484 ?auto_191486 ) ) ( not ( = ?auto_191484 ?auto_191487 ) ) ( not ( = ?auto_191485 ?auto_191486 ) ) ( not ( = ?auto_191485 ?auto_191487 ) ) ( not ( = ?auto_191486 ?auto_191487 ) ) ( ON ?auto_191485 ?auto_191486 ) ( ON ?auto_191484 ?auto_191485 ) ( ON ?auto_191483 ?auto_191484 ) ( ON ?auto_191482 ?auto_191483 ) ( ON ?auto_191481 ?auto_191482 ) ( ON ?auto_191480 ?auto_191481 ) ( ON ?auto_191479 ?auto_191480 ) ( ON ?auto_191478 ?auto_191479 ) ( CLEAR ?auto_191476 ) ( ON ?auto_191477 ?auto_191478 ) ( CLEAR ?auto_191477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191475 ?auto_191476 ?auto_191477 )
      ( MAKE-12PILE ?auto_191475 ?auto_191476 ?auto_191477 ?auto_191478 ?auto_191479 ?auto_191480 ?auto_191481 ?auto_191482 ?auto_191483 ?auto_191484 ?auto_191485 ?auto_191486 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191500 - BLOCK
      ?auto_191501 - BLOCK
      ?auto_191502 - BLOCK
      ?auto_191503 - BLOCK
      ?auto_191504 - BLOCK
      ?auto_191505 - BLOCK
      ?auto_191506 - BLOCK
      ?auto_191507 - BLOCK
      ?auto_191508 - BLOCK
      ?auto_191509 - BLOCK
      ?auto_191510 - BLOCK
      ?auto_191511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191511 ) ( ON-TABLE ?auto_191500 ) ( ON ?auto_191501 ?auto_191500 ) ( not ( = ?auto_191500 ?auto_191501 ) ) ( not ( = ?auto_191500 ?auto_191502 ) ) ( not ( = ?auto_191500 ?auto_191503 ) ) ( not ( = ?auto_191500 ?auto_191504 ) ) ( not ( = ?auto_191500 ?auto_191505 ) ) ( not ( = ?auto_191500 ?auto_191506 ) ) ( not ( = ?auto_191500 ?auto_191507 ) ) ( not ( = ?auto_191500 ?auto_191508 ) ) ( not ( = ?auto_191500 ?auto_191509 ) ) ( not ( = ?auto_191500 ?auto_191510 ) ) ( not ( = ?auto_191500 ?auto_191511 ) ) ( not ( = ?auto_191501 ?auto_191502 ) ) ( not ( = ?auto_191501 ?auto_191503 ) ) ( not ( = ?auto_191501 ?auto_191504 ) ) ( not ( = ?auto_191501 ?auto_191505 ) ) ( not ( = ?auto_191501 ?auto_191506 ) ) ( not ( = ?auto_191501 ?auto_191507 ) ) ( not ( = ?auto_191501 ?auto_191508 ) ) ( not ( = ?auto_191501 ?auto_191509 ) ) ( not ( = ?auto_191501 ?auto_191510 ) ) ( not ( = ?auto_191501 ?auto_191511 ) ) ( not ( = ?auto_191502 ?auto_191503 ) ) ( not ( = ?auto_191502 ?auto_191504 ) ) ( not ( = ?auto_191502 ?auto_191505 ) ) ( not ( = ?auto_191502 ?auto_191506 ) ) ( not ( = ?auto_191502 ?auto_191507 ) ) ( not ( = ?auto_191502 ?auto_191508 ) ) ( not ( = ?auto_191502 ?auto_191509 ) ) ( not ( = ?auto_191502 ?auto_191510 ) ) ( not ( = ?auto_191502 ?auto_191511 ) ) ( not ( = ?auto_191503 ?auto_191504 ) ) ( not ( = ?auto_191503 ?auto_191505 ) ) ( not ( = ?auto_191503 ?auto_191506 ) ) ( not ( = ?auto_191503 ?auto_191507 ) ) ( not ( = ?auto_191503 ?auto_191508 ) ) ( not ( = ?auto_191503 ?auto_191509 ) ) ( not ( = ?auto_191503 ?auto_191510 ) ) ( not ( = ?auto_191503 ?auto_191511 ) ) ( not ( = ?auto_191504 ?auto_191505 ) ) ( not ( = ?auto_191504 ?auto_191506 ) ) ( not ( = ?auto_191504 ?auto_191507 ) ) ( not ( = ?auto_191504 ?auto_191508 ) ) ( not ( = ?auto_191504 ?auto_191509 ) ) ( not ( = ?auto_191504 ?auto_191510 ) ) ( not ( = ?auto_191504 ?auto_191511 ) ) ( not ( = ?auto_191505 ?auto_191506 ) ) ( not ( = ?auto_191505 ?auto_191507 ) ) ( not ( = ?auto_191505 ?auto_191508 ) ) ( not ( = ?auto_191505 ?auto_191509 ) ) ( not ( = ?auto_191505 ?auto_191510 ) ) ( not ( = ?auto_191505 ?auto_191511 ) ) ( not ( = ?auto_191506 ?auto_191507 ) ) ( not ( = ?auto_191506 ?auto_191508 ) ) ( not ( = ?auto_191506 ?auto_191509 ) ) ( not ( = ?auto_191506 ?auto_191510 ) ) ( not ( = ?auto_191506 ?auto_191511 ) ) ( not ( = ?auto_191507 ?auto_191508 ) ) ( not ( = ?auto_191507 ?auto_191509 ) ) ( not ( = ?auto_191507 ?auto_191510 ) ) ( not ( = ?auto_191507 ?auto_191511 ) ) ( not ( = ?auto_191508 ?auto_191509 ) ) ( not ( = ?auto_191508 ?auto_191510 ) ) ( not ( = ?auto_191508 ?auto_191511 ) ) ( not ( = ?auto_191509 ?auto_191510 ) ) ( not ( = ?auto_191509 ?auto_191511 ) ) ( not ( = ?auto_191510 ?auto_191511 ) ) ( ON ?auto_191510 ?auto_191511 ) ( ON ?auto_191509 ?auto_191510 ) ( ON ?auto_191508 ?auto_191509 ) ( ON ?auto_191507 ?auto_191508 ) ( ON ?auto_191506 ?auto_191507 ) ( ON ?auto_191505 ?auto_191506 ) ( ON ?auto_191504 ?auto_191505 ) ( ON ?auto_191503 ?auto_191504 ) ( CLEAR ?auto_191501 ) ( ON ?auto_191502 ?auto_191503 ) ( CLEAR ?auto_191502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_191500 ?auto_191501 ?auto_191502 )
      ( MAKE-12PILE ?auto_191500 ?auto_191501 ?auto_191502 ?auto_191503 ?auto_191504 ?auto_191505 ?auto_191506 ?auto_191507 ?auto_191508 ?auto_191509 ?auto_191510 ?auto_191511 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191524 - BLOCK
      ?auto_191525 - BLOCK
      ?auto_191526 - BLOCK
      ?auto_191527 - BLOCK
      ?auto_191528 - BLOCK
      ?auto_191529 - BLOCK
      ?auto_191530 - BLOCK
      ?auto_191531 - BLOCK
      ?auto_191532 - BLOCK
      ?auto_191533 - BLOCK
      ?auto_191534 - BLOCK
      ?auto_191535 - BLOCK
    )
    :vars
    (
      ?auto_191536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191535 ?auto_191536 ) ( ON-TABLE ?auto_191524 ) ( not ( = ?auto_191524 ?auto_191525 ) ) ( not ( = ?auto_191524 ?auto_191526 ) ) ( not ( = ?auto_191524 ?auto_191527 ) ) ( not ( = ?auto_191524 ?auto_191528 ) ) ( not ( = ?auto_191524 ?auto_191529 ) ) ( not ( = ?auto_191524 ?auto_191530 ) ) ( not ( = ?auto_191524 ?auto_191531 ) ) ( not ( = ?auto_191524 ?auto_191532 ) ) ( not ( = ?auto_191524 ?auto_191533 ) ) ( not ( = ?auto_191524 ?auto_191534 ) ) ( not ( = ?auto_191524 ?auto_191535 ) ) ( not ( = ?auto_191524 ?auto_191536 ) ) ( not ( = ?auto_191525 ?auto_191526 ) ) ( not ( = ?auto_191525 ?auto_191527 ) ) ( not ( = ?auto_191525 ?auto_191528 ) ) ( not ( = ?auto_191525 ?auto_191529 ) ) ( not ( = ?auto_191525 ?auto_191530 ) ) ( not ( = ?auto_191525 ?auto_191531 ) ) ( not ( = ?auto_191525 ?auto_191532 ) ) ( not ( = ?auto_191525 ?auto_191533 ) ) ( not ( = ?auto_191525 ?auto_191534 ) ) ( not ( = ?auto_191525 ?auto_191535 ) ) ( not ( = ?auto_191525 ?auto_191536 ) ) ( not ( = ?auto_191526 ?auto_191527 ) ) ( not ( = ?auto_191526 ?auto_191528 ) ) ( not ( = ?auto_191526 ?auto_191529 ) ) ( not ( = ?auto_191526 ?auto_191530 ) ) ( not ( = ?auto_191526 ?auto_191531 ) ) ( not ( = ?auto_191526 ?auto_191532 ) ) ( not ( = ?auto_191526 ?auto_191533 ) ) ( not ( = ?auto_191526 ?auto_191534 ) ) ( not ( = ?auto_191526 ?auto_191535 ) ) ( not ( = ?auto_191526 ?auto_191536 ) ) ( not ( = ?auto_191527 ?auto_191528 ) ) ( not ( = ?auto_191527 ?auto_191529 ) ) ( not ( = ?auto_191527 ?auto_191530 ) ) ( not ( = ?auto_191527 ?auto_191531 ) ) ( not ( = ?auto_191527 ?auto_191532 ) ) ( not ( = ?auto_191527 ?auto_191533 ) ) ( not ( = ?auto_191527 ?auto_191534 ) ) ( not ( = ?auto_191527 ?auto_191535 ) ) ( not ( = ?auto_191527 ?auto_191536 ) ) ( not ( = ?auto_191528 ?auto_191529 ) ) ( not ( = ?auto_191528 ?auto_191530 ) ) ( not ( = ?auto_191528 ?auto_191531 ) ) ( not ( = ?auto_191528 ?auto_191532 ) ) ( not ( = ?auto_191528 ?auto_191533 ) ) ( not ( = ?auto_191528 ?auto_191534 ) ) ( not ( = ?auto_191528 ?auto_191535 ) ) ( not ( = ?auto_191528 ?auto_191536 ) ) ( not ( = ?auto_191529 ?auto_191530 ) ) ( not ( = ?auto_191529 ?auto_191531 ) ) ( not ( = ?auto_191529 ?auto_191532 ) ) ( not ( = ?auto_191529 ?auto_191533 ) ) ( not ( = ?auto_191529 ?auto_191534 ) ) ( not ( = ?auto_191529 ?auto_191535 ) ) ( not ( = ?auto_191529 ?auto_191536 ) ) ( not ( = ?auto_191530 ?auto_191531 ) ) ( not ( = ?auto_191530 ?auto_191532 ) ) ( not ( = ?auto_191530 ?auto_191533 ) ) ( not ( = ?auto_191530 ?auto_191534 ) ) ( not ( = ?auto_191530 ?auto_191535 ) ) ( not ( = ?auto_191530 ?auto_191536 ) ) ( not ( = ?auto_191531 ?auto_191532 ) ) ( not ( = ?auto_191531 ?auto_191533 ) ) ( not ( = ?auto_191531 ?auto_191534 ) ) ( not ( = ?auto_191531 ?auto_191535 ) ) ( not ( = ?auto_191531 ?auto_191536 ) ) ( not ( = ?auto_191532 ?auto_191533 ) ) ( not ( = ?auto_191532 ?auto_191534 ) ) ( not ( = ?auto_191532 ?auto_191535 ) ) ( not ( = ?auto_191532 ?auto_191536 ) ) ( not ( = ?auto_191533 ?auto_191534 ) ) ( not ( = ?auto_191533 ?auto_191535 ) ) ( not ( = ?auto_191533 ?auto_191536 ) ) ( not ( = ?auto_191534 ?auto_191535 ) ) ( not ( = ?auto_191534 ?auto_191536 ) ) ( not ( = ?auto_191535 ?auto_191536 ) ) ( ON ?auto_191534 ?auto_191535 ) ( ON ?auto_191533 ?auto_191534 ) ( ON ?auto_191532 ?auto_191533 ) ( ON ?auto_191531 ?auto_191532 ) ( ON ?auto_191530 ?auto_191531 ) ( ON ?auto_191529 ?auto_191530 ) ( ON ?auto_191528 ?auto_191529 ) ( ON ?auto_191527 ?auto_191528 ) ( ON ?auto_191526 ?auto_191527 ) ( CLEAR ?auto_191524 ) ( ON ?auto_191525 ?auto_191526 ) ( CLEAR ?auto_191525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191524 ?auto_191525 )
      ( MAKE-12PILE ?auto_191524 ?auto_191525 ?auto_191526 ?auto_191527 ?auto_191528 ?auto_191529 ?auto_191530 ?auto_191531 ?auto_191532 ?auto_191533 ?auto_191534 ?auto_191535 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191549 - BLOCK
      ?auto_191550 - BLOCK
      ?auto_191551 - BLOCK
      ?auto_191552 - BLOCK
      ?auto_191553 - BLOCK
      ?auto_191554 - BLOCK
      ?auto_191555 - BLOCK
      ?auto_191556 - BLOCK
      ?auto_191557 - BLOCK
      ?auto_191558 - BLOCK
      ?auto_191559 - BLOCK
      ?auto_191560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191560 ) ( ON-TABLE ?auto_191549 ) ( not ( = ?auto_191549 ?auto_191550 ) ) ( not ( = ?auto_191549 ?auto_191551 ) ) ( not ( = ?auto_191549 ?auto_191552 ) ) ( not ( = ?auto_191549 ?auto_191553 ) ) ( not ( = ?auto_191549 ?auto_191554 ) ) ( not ( = ?auto_191549 ?auto_191555 ) ) ( not ( = ?auto_191549 ?auto_191556 ) ) ( not ( = ?auto_191549 ?auto_191557 ) ) ( not ( = ?auto_191549 ?auto_191558 ) ) ( not ( = ?auto_191549 ?auto_191559 ) ) ( not ( = ?auto_191549 ?auto_191560 ) ) ( not ( = ?auto_191550 ?auto_191551 ) ) ( not ( = ?auto_191550 ?auto_191552 ) ) ( not ( = ?auto_191550 ?auto_191553 ) ) ( not ( = ?auto_191550 ?auto_191554 ) ) ( not ( = ?auto_191550 ?auto_191555 ) ) ( not ( = ?auto_191550 ?auto_191556 ) ) ( not ( = ?auto_191550 ?auto_191557 ) ) ( not ( = ?auto_191550 ?auto_191558 ) ) ( not ( = ?auto_191550 ?auto_191559 ) ) ( not ( = ?auto_191550 ?auto_191560 ) ) ( not ( = ?auto_191551 ?auto_191552 ) ) ( not ( = ?auto_191551 ?auto_191553 ) ) ( not ( = ?auto_191551 ?auto_191554 ) ) ( not ( = ?auto_191551 ?auto_191555 ) ) ( not ( = ?auto_191551 ?auto_191556 ) ) ( not ( = ?auto_191551 ?auto_191557 ) ) ( not ( = ?auto_191551 ?auto_191558 ) ) ( not ( = ?auto_191551 ?auto_191559 ) ) ( not ( = ?auto_191551 ?auto_191560 ) ) ( not ( = ?auto_191552 ?auto_191553 ) ) ( not ( = ?auto_191552 ?auto_191554 ) ) ( not ( = ?auto_191552 ?auto_191555 ) ) ( not ( = ?auto_191552 ?auto_191556 ) ) ( not ( = ?auto_191552 ?auto_191557 ) ) ( not ( = ?auto_191552 ?auto_191558 ) ) ( not ( = ?auto_191552 ?auto_191559 ) ) ( not ( = ?auto_191552 ?auto_191560 ) ) ( not ( = ?auto_191553 ?auto_191554 ) ) ( not ( = ?auto_191553 ?auto_191555 ) ) ( not ( = ?auto_191553 ?auto_191556 ) ) ( not ( = ?auto_191553 ?auto_191557 ) ) ( not ( = ?auto_191553 ?auto_191558 ) ) ( not ( = ?auto_191553 ?auto_191559 ) ) ( not ( = ?auto_191553 ?auto_191560 ) ) ( not ( = ?auto_191554 ?auto_191555 ) ) ( not ( = ?auto_191554 ?auto_191556 ) ) ( not ( = ?auto_191554 ?auto_191557 ) ) ( not ( = ?auto_191554 ?auto_191558 ) ) ( not ( = ?auto_191554 ?auto_191559 ) ) ( not ( = ?auto_191554 ?auto_191560 ) ) ( not ( = ?auto_191555 ?auto_191556 ) ) ( not ( = ?auto_191555 ?auto_191557 ) ) ( not ( = ?auto_191555 ?auto_191558 ) ) ( not ( = ?auto_191555 ?auto_191559 ) ) ( not ( = ?auto_191555 ?auto_191560 ) ) ( not ( = ?auto_191556 ?auto_191557 ) ) ( not ( = ?auto_191556 ?auto_191558 ) ) ( not ( = ?auto_191556 ?auto_191559 ) ) ( not ( = ?auto_191556 ?auto_191560 ) ) ( not ( = ?auto_191557 ?auto_191558 ) ) ( not ( = ?auto_191557 ?auto_191559 ) ) ( not ( = ?auto_191557 ?auto_191560 ) ) ( not ( = ?auto_191558 ?auto_191559 ) ) ( not ( = ?auto_191558 ?auto_191560 ) ) ( not ( = ?auto_191559 ?auto_191560 ) ) ( ON ?auto_191559 ?auto_191560 ) ( ON ?auto_191558 ?auto_191559 ) ( ON ?auto_191557 ?auto_191558 ) ( ON ?auto_191556 ?auto_191557 ) ( ON ?auto_191555 ?auto_191556 ) ( ON ?auto_191554 ?auto_191555 ) ( ON ?auto_191553 ?auto_191554 ) ( ON ?auto_191552 ?auto_191553 ) ( ON ?auto_191551 ?auto_191552 ) ( CLEAR ?auto_191549 ) ( ON ?auto_191550 ?auto_191551 ) ( CLEAR ?auto_191550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_191549 ?auto_191550 )
      ( MAKE-12PILE ?auto_191549 ?auto_191550 ?auto_191551 ?auto_191552 ?auto_191553 ?auto_191554 ?auto_191555 ?auto_191556 ?auto_191557 ?auto_191558 ?auto_191559 ?auto_191560 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191573 - BLOCK
      ?auto_191574 - BLOCK
      ?auto_191575 - BLOCK
      ?auto_191576 - BLOCK
      ?auto_191577 - BLOCK
      ?auto_191578 - BLOCK
      ?auto_191579 - BLOCK
      ?auto_191580 - BLOCK
      ?auto_191581 - BLOCK
      ?auto_191582 - BLOCK
      ?auto_191583 - BLOCK
      ?auto_191584 - BLOCK
    )
    :vars
    (
      ?auto_191585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191584 ?auto_191585 ) ( not ( = ?auto_191573 ?auto_191574 ) ) ( not ( = ?auto_191573 ?auto_191575 ) ) ( not ( = ?auto_191573 ?auto_191576 ) ) ( not ( = ?auto_191573 ?auto_191577 ) ) ( not ( = ?auto_191573 ?auto_191578 ) ) ( not ( = ?auto_191573 ?auto_191579 ) ) ( not ( = ?auto_191573 ?auto_191580 ) ) ( not ( = ?auto_191573 ?auto_191581 ) ) ( not ( = ?auto_191573 ?auto_191582 ) ) ( not ( = ?auto_191573 ?auto_191583 ) ) ( not ( = ?auto_191573 ?auto_191584 ) ) ( not ( = ?auto_191573 ?auto_191585 ) ) ( not ( = ?auto_191574 ?auto_191575 ) ) ( not ( = ?auto_191574 ?auto_191576 ) ) ( not ( = ?auto_191574 ?auto_191577 ) ) ( not ( = ?auto_191574 ?auto_191578 ) ) ( not ( = ?auto_191574 ?auto_191579 ) ) ( not ( = ?auto_191574 ?auto_191580 ) ) ( not ( = ?auto_191574 ?auto_191581 ) ) ( not ( = ?auto_191574 ?auto_191582 ) ) ( not ( = ?auto_191574 ?auto_191583 ) ) ( not ( = ?auto_191574 ?auto_191584 ) ) ( not ( = ?auto_191574 ?auto_191585 ) ) ( not ( = ?auto_191575 ?auto_191576 ) ) ( not ( = ?auto_191575 ?auto_191577 ) ) ( not ( = ?auto_191575 ?auto_191578 ) ) ( not ( = ?auto_191575 ?auto_191579 ) ) ( not ( = ?auto_191575 ?auto_191580 ) ) ( not ( = ?auto_191575 ?auto_191581 ) ) ( not ( = ?auto_191575 ?auto_191582 ) ) ( not ( = ?auto_191575 ?auto_191583 ) ) ( not ( = ?auto_191575 ?auto_191584 ) ) ( not ( = ?auto_191575 ?auto_191585 ) ) ( not ( = ?auto_191576 ?auto_191577 ) ) ( not ( = ?auto_191576 ?auto_191578 ) ) ( not ( = ?auto_191576 ?auto_191579 ) ) ( not ( = ?auto_191576 ?auto_191580 ) ) ( not ( = ?auto_191576 ?auto_191581 ) ) ( not ( = ?auto_191576 ?auto_191582 ) ) ( not ( = ?auto_191576 ?auto_191583 ) ) ( not ( = ?auto_191576 ?auto_191584 ) ) ( not ( = ?auto_191576 ?auto_191585 ) ) ( not ( = ?auto_191577 ?auto_191578 ) ) ( not ( = ?auto_191577 ?auto_191579 ) ) ( not ( = ?auto_191577 ?auto_191580 ) ) ( not ( = ?auto_191577 ?auto_191581 ) ) ( not ( = ?auto_191577 ?auto_191582 ) ) ( not ( = ?auto_191577 ?auto_191583 ) ) ( not ( = ?auto_191577 ?auto_191584 ) ) ( not ( = ?auto_191577 ?auto_191585 ) ) ( not ( = ?auto_191578 ?auto_191579 ) ) ( not ( = ?auto_191578 ?auto_191580 ) ) ( not ( = ?auto_191578 ?auto_191581 ) ) ( not ( = ?auto_191578 ?auto_191582 ) ) ( not ( = ?auto_191578 ?auto_191583 ) ) ( not ( = ?auto_191578 ?auto_191584 ) ) ( not ( = ?auto_191578 ?auto_191585 ) ) ( not ( = ?auto_191579 ?auto_191580 ) ) ( not ( = ?auto_191579 ?auto_191581 ) ) ( not ( = ?auto_191579 ?auto_191582 ) ) ( not ( = ?auto_191579 ?auto_191583 ) ) ( not ( = ?auto_191579 ?auto_191584 ) ) ( not ( = ?auto_191579 ?auto_191585 ) ) ( not ( = ?auto_191580 ?auto_191581 ) ) ( not ( = ?auto_191580 ?auto_191582 ) ) ( not ( = ?auto_191580 ?auto_191583 ) ) ( not ( = ?auto_191580 ?auto_191584 ) ) ( not ( = ?auto_191580 ?auto_191585 ) ) ( not ( = ?auto_191581 ?auto_191582 ) ) ( not ( = ?auto_191581 ?auto_191583 ) ) ( not ( = ?auto_191581 ?auto_191584 ) ) ( not ( = ?auto_191581 ?auto_191585 ) ) ( not ( = ?auto_191582 ?auto_191583 ) ) ( not ( = ?auto_191582 ?auto_191584 ) ) ( not ( = ?auto_191582 ?auto_191585 ) ) ( not ( = ?auto_191583 ?auto_191584 ) ) ( not ( = ?auto_191583 ?auto_191585 ) ) ( not ( = ?auto_191584 ?auto_191585 ) ) ( ON ?auto_191583 ?auto_191584 ) ( ON ?auto_191582 ?auto_191583 ) ( ON ?auto_191581 ?auto_191582 ) ( ON ?auto_191580 ?auto_191581 ) ( ON ?auto_191579 ?auto_191580 ) ( ON ?auto_191578 ?auto_191579 ) ( ON ?auto_191577 ?auto_191578 ) ( ON ?auto_191576 ?auto_191577 ) ( ON ?auto_191575 ?auto_191576 ) ( ON ?auto_191574 ?auto_191575 ) ( ON ?auto_191573 ?auto_191574 ) ( CLEAR ?auto_191573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191573 )
      ( MAKE-12PILE ?auto_191573 ?auto_191574 ?auto_191575 ?auto_191576 ?auto_191577 ?auto_191578 ?auto_191579 ?auto_191580 ?auto_191581 ?auto_191582 ?auto_191583 ?auto_191584 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191598 - BLOCK
      ?auto_191599 - BLOCK
      ?auto_191600 - BLOCK
      ?auto_191601 - BLOCK
      ?auto_191602 - BLOCK
      ?auto_191603 - BLOCK
      ?auto_191604 - BLOCK
      ?auto_191605 - BLOCK
      ?auto_191606 - BLOCK
      ?auto_191607 - BLOCK
      ?auto_191608 - BLOCK
      ?auto_191609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_191609 ) ( not ( = ?auto_191598 ?auto_191599 ) ) ( not ( = ?auto_191598 ?auto_191600 ) ) ( not ( = ?auto_191598 ?auto_191601 ) ) ( not ( = ?auto_191598 ?auto_191602 ) ) ( not ( = ?auto_191598 ?auto_191603 ) ) ( not ( = ?auto_191598 ?auto_191604 ) ) ( not ( = ?auto_191598 ?auto_191605 ) ) ( not ( = ?auto_191598 ?auto_191606 ) ) ( not ( = ?auto_191598 ?auto_191607 ) ) ( not ( = ?auto_191598 ?auto_191608 ) ) ( not ( = ?auto_191598 ?auto_191609 ) ) ( not ( = ?auto_191599 ?auto_191600 ) ) ( not ( = ?auto_191599 ?auto_191601 ) ) ( not ( = ?auto_191599 ?auto_191602 ) ) ( not ( = ?auto_191599 ?auto_191603 ) ) ( not ( = ?auto_191599 ?auto_191604 ) ) ( not ( = ?auto_191599 ?auto_191605 ) ) ( not ( = ?auto_191599 ?auto_191606 ) ) ( not ( = ?auto_191599 ?auto_191607 ) ) ( not ( = ?auto_191599 ?auto_191608 ) ) ( not ( = ?auto_191599 ?auto_191609 ) ) ( not ( = ?auto_191600 ?auto_191601 ) ) ( not ( = ?auto_191600 ?auto_191602 ) ) ( not ( = ?auto_191600 ?auto_191603 ) ) ( not ( = ?auto_191600 ?auto_191604 ) ) ( not ( = ?auto_191600 ?auto_191605 ) ) ( not ( = ?auto_191600 ?auto_191606 ) ) ( not ( = ?auto_191600 ?auto_191607 ) ) ( not ( = ?auto_191600 ?auto_191608 ) ) ( not ( = ?auto_191600 ?auto_191609 ) ) ( not ( = ?auto_191601 ?auto_191602 ) ) ( not ( = ?auto_191601 ?auto_191603 ) ) ( not ( = ?auto_191601 ?auto_191604 ) ) ( not ( = ?auto_191601 ?auto_191605 ) ) ( not ( = ?auto_191601 ?auto_191606 ) ) ( not ( = ?auto_191601 ?auto_191607 ) ) ( not ( = ?auto_191601 ?auto_191608 ) ) ( not ( = ?auto_191601 ?auto_191609 ) ) ( not ( = ?auto_191602 ?auto_191603 ) ) ( not ( = ?auto_191602 ?auto_191604 ) ) ( not ( = ?auto_191602 ?auto_191605 ) ) ( not ( = ?auto_191602 ?auto_191606 ) ) ( not ( = ?auto_191602 ?auto_191607 ) ) ( not ( = ?auto_191602 ?auto_191608 ) ) ( not ( = ?auto_191602 ?auto_191609 ) ) ( not ( = ?auto_191603 ?auto_191604 ) ) ( not ( = ?auto_191603 ?auto_191605 ) ) ( not ( = ?auto_191603 ?auto_191606 ) ) ( not ( = ?auto_191603 ?auto_191607 ) ) ( not ( = ?auto_191603 ?auto_191608 ) ) ( not ( = ?auto_191603 ?auto_191609 ) ) ( not ( = ?auto_191604 ?auto_191605 ) ) ( not ( = ?auto_191604 ?auto_191606 ) ) ( not ( = ?auto_191604 ?auto_191607 ) ) ( not ( = ?auto_191604 ?auto_191608 ) ) ( not ( = ?auto_191604 ?auto_191609 ) ) ( not ( = ?auto_191605 ?auto_191606 ) ) ( not ( = ?auto_191605 ?auto_191607 ) ) ( not ( = ?auto_191605 ?auto_191608 ) ) ( not ( = ?auto_191605 ?auto_191609 ) ) ( not ( = ?auto_191606 ?auto_191607 ) ) ( not ( = ?auto_191606 ?auto_191608 ) ) ( not ( = ?auto_191606 ?auto_191609 ) ) ( not ( = ?auto_191607 ?auto_191608 ) ) ( not ( = ?auto_191607 ?auto_191609 ) ) ( not ( = ?auto_191608 ?auto_191609 ) ) ( ON ?auto_191608 ?auto_191609 ) ( ON ?auto_191607 ?auto_191608 ) ( ON ?auto_191606 ?auto_191607 ) ( ON ?auto_191605 ?auto_191606 ) ( ON ?auto_191604 ?auto_191605 ) ( ON ?auto_191603 ?auto_191604 ) ( ON ?auto_191602 ?auto_191603 ) ( ON ?auto_191601 ?auto_191602 ) ( ON ?auto_191600 ?auto_191601 ) ( ON ?auto_191599 ?auto_191600 ) ( ON ?auto_191598 ?auto_191599 ) ( CLEAR ?auto_191598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_191598 )
      ( MAKE-12PILE ?auto_191598 ?auto_191599 ?auto_191600 ?auto_191601 ?auto_191602 ?auto_191603 ?auto_191604 ?auto_191605 ?auto_191606 ?auto_191607 ?auto_191608 ?auto_191609 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_191622 - BLOCK
      ?auto_191623 - BLOCK
      ?auto_191624 - BLOCK
      ?auto_191625 - BLOCK
      ?auto_191626 - BLOCK
      ?auto_191627 - BLOCK
      ?auto_191628 - BLOCK
      ?auto_191629 - BLOCK
      ?auto_191630 - BLOCK
      ?auto_191631 - BLOCK
      ?auto_191632 - BLOCK
      ?auto_191633 - BLOCK
    )
    :vars
    (
      ?auto_191634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_191622 ?auto_191623 ) ) ( not ( = ?auto_191622 ?auto_191624 ) ) ( not ( = ?auto_191622 ?auto_191625 ) ) ( not ( = ?auto_191622 ?auto_191626 ) ) ( not ( = ?auto_191622 ?auto_191627 ) ) ( not ( = ?auto_191622 ?auto_191628 ) ) ( not ( = ?auto_191622 ?auto_191629 ) ) ( not ( = ?auto_191622 ?auto_191630 ) ) ( not ( = ?auto_191622 ?auto_191631 ) ) ( not ( = ?auto_191622 ?auto_191632 ) ) ( not ( = ?auto_191622 ?auto_191633 ) ) ( not ( = ?auto_191623 ?auto_191624 ) ) ( not ( = ?auto_191623 ?auto_191625 ) ) ( not ( = ?auto_191623 ?auto_191626 ) ) ( not ( = ?auto_191623 ?auto_191627 ) ) ( not ( = ?auto_191623 ?auto_191628 ) ) ( not ( = ?auto_191623 ?auto_191629 ) ) ( not ( = ?auto_191623 ?auto_191630 ) ) ( not ( = ?auto_191623 ?auto_191631 ) ) ( not ( = ?auto_191623 ?auto_191632 ) ) ( not ( = ?auto_191623 ?auto_191633 ) ) ( not ( = ?auto_191624 ?auto_191625 ) ) ( not ( = ?auto_191624 ?auto_191626 ) ) ( not ( = ?auto_191624 ?auto_191627 ) ) ( not ( = ?auto_191624 ?auto_191628 ) ) ( not ( = ?auto_191624 ?auto_191629 ) ) ( not ( = ?auto_191624 ?auto_191630 ) ) ( not ( = ?auto_191624 ?auto_191631 ) ) ( not ( = ?auto_191624 ?auto_191632 ) ) ( not ( = ?auto_191624 ?auto_191633 ) ) ( not ( = ?auto_191625 ?auto_191626 ) ) ( not ( = ?auto_191625 ?auto_191627 ) ) ( not ( = ?auto_191625 ?auto_191628 ) ) ( not ( = ?auto_191625 ?auto_191629 ) ) ( not ( = ?auto_191625 ?auto_191630 ) ) ( not ( = ?auto_191625 ?auto_191631 ) ) ( not ( = ?auto_191625 ?auto_191632 ) ) ( not ( = ?auto_191625 ?auto_191633 ) ) ( not ( = ?auto_191626 ?auto_191627 ) ) ( not ( = ?auto_191626 ?auto_191628 ) ) ( not ( = ?auto_191626 ?auto_191629 ) ) ( not ( = ?auto_191626 ?auto_191630 ) ) ( not ( = ?auto_191626 ?auto_191631 ) ) ( not ( = ?auto_191626 ?auto_191632 ) ) ( not ( = ?auto_191626 ?auto_191633 ) ) ( not ( = ?auto_191627 ?auto_191628 ) ) ( not ( = ?auto_191627 ?auto_191629 ) ) ( not ( = ?auto_191627 ?auto_191630 ) ) ( not ( = ?auto_191627 ?auto_191631 ) ) ( not ( = ?auto_191627 ?auto_191632 ) ) ( not ( = ?auto_191627 ?auto_191633 ) ) ( not ( = ?auto_191628 ?auto_191629 ) ) ( not ( = ?auto_191628 ?auto_191630 ) ) ( not ( = ?auto_191628 ?auto_191631 ) ) ( not ( = ?auto_191628 ?auto_191632 ) ) ( not ( = ?auto_191628 ?auto_191633 ) ) ( not ( = ?auto_191629 ?auto_191630 ) ) ( not ( = ?auto_191629 ?auto_191631 ) ) ( not ( = ?auto_191629 ?auto_191632 ) ) ( not ( = ?auto_191629 ?auto_191633 ) ) ( not ( = ?auto_191630 ?auto_191631 ) ) ( not ( = ?auto_191630 ?auto_191632 ) ) ( not ( = ?auto_191630 ?auto_191633 ) ) ( not ( = ?auto_191631 ?auto_191632 ) ) ( not ( = ?auto_191631 ?auto_191633 ) ) ( not ( = ?auto_191632 ?auto_191633 ) ) ( ON ?auto_191622 ?auto_191634 ) ( not ( = ?auto_191633 ?auto_191634 ) ) ( not ( = ?auto_191632 ?auto_191634 ) ) ( not ( = ?auto_191631 ?auto_191634 ) ) ( not ( = ?auto_191630 ?auto_191634 ) ) ( not ( = ?auto_191629 ?auto_191634 ) ) ( not ( = ?auto_191628 ?auto_191634 ) ) ( not ( = ?auto_191627 ?auto_191634 ) ) ( not ( = ?auto_191626 ?auto_191634 ) ) ( not ( = ?auto_191625 ?auto_191634 ) ) ( not ( = ?auto_191624 ?auto_191634 ) ) ( not ( = ?auto_191623 ?auto_191634 ) ) ( not ( = ?auto_191622 ?auto_191634 ) ) ( ON ?auto_191623 ?auto_191622 ) ( ON ?auto_191624 ?auto_191623 ) ( ON ?auto_191625 ?auto_191624 ) ( ON ?auto_191626 ?auto_191625 ) ( ON ?auto_191627 ?auto_191626 ) ( ON ?auto_191628 ?auto_191627 ) ( ON ?auto_191629 ?auto_191628 ) ( ON ?auto_191630 ?auto_191629 ) ( ON ?auto_191631 ?auto_191630 ) ( ON ?auto_191632 ?auto_191631 ) ( ON ?auto_191633 ?auto_191632 ) ( CLEAR ?auto_191633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_191633 ?auto_191632 ?auto_191631 ?auto_191630 ?auto_191629 ?auto_191628 ?auto_191627 ?auto_191626 ?auto_191625 ?auto_191624 ?auto_191623 ?auto_191622 )
      ( MAKE-12PILE ?auto_191622 ?auto_191623 ?auto_191624 ?auto_191625 ?auto_191626 ?auto_191627 ?auto_191628 ?auto_191629 ?auto_191630 ?auto_191631 ?auto_191632 ?auto_191633 ) )
  )

)
