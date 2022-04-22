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
      ?auto_147933 - BLOCK
    )
    :vars
    (
      ?auto_147934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147933 ?auto_147934 ) ( CLEAR ?auto_147933 ) ( HAND-EMPTY ) ( not ( = ?auto_147933 ?auto_147934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147933 ?auto_147934 )
      ( !PUTDOWN ?auto_147933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_147936 - BLOCK
    )
    :vars
    (
      ?auto_147937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147936 ?auto_147937 ) ( CLEAR ?auto_147936 ) ( HAND-EMPTY ) ( not ( = ?auto_147936 ?auto_147937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147936 ?auto_147937 )
      ( !PUTDOWN ?auto_147936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147940 - BLOCK
      ?auto_147941 - BLOCK
    )
    :vars
    (
      ?auto_147942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147940 ) ( ON ?auto_147941 ?auto_147942 ) ( CLEAR ?auto_147941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147940 ) ( not ( = ?auto_147940 ?auto_147941 ) ) ( not ( = ?auto_147940 ?auto_147942 ) ) ( not ( = ?auto_147941 ?auto_147942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147941 ?auto_147942 )
      ( !STACK ?auto_147941 ?auto_147940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147945 - BLOCK
      ?auto_147946 - BLOCK
    )
    :vars
    (
      ?auto_147947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147945 ) ( ON ?auto_147946 ?auto_147947 ) ( CLEAR ?auto_147946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147945 ) ( not ( = ?auto_147945 ?auto_147946 ) ) ( not ( = ?auto_147945 ?auto_147947 ) ) ( not ( = ?auto_147946 ?auto_147947 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147946 ?auto_147947 )
      ( !STACK ?auto_147946 ?auto_147945 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147950 - BLOCK
      ?auto_147951 - BLOCK
    )
    :vars
    (
      ?auto_147952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147951 ?auto_147952 ) ( not ( = ?auto_147950 ?auto_147951 ) ) ( not ( = ?auto_147950 ?auto_147952 ) ) ( not ( = ?auto_147951 ?auto_147952 ) ) ( ON ?auto_147950 ?auto_147951 ) ( CLEAR ?auto_147950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147950 )
      ( MAKE-2PILE ?auto_147950 ?auto_147951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_147955 - BLOCK
      ?auto_147956 - BLOCK
    )
    :vars
    (
      ?auto_147957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147956 ?auto_147957 ) ( not ( = ?auto_147955 ?auto_147956 ) ) ( not ( = ?auto_147955 ?auto_147957 ) ) ( not ( = ?auto_147956 ?auto_147957 ) ) ( ON ?auto_147955 ?auto_147956 ) ( CLEAR ?auto_147955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147955 )
      ( MAKE-2PILE ?auto_147955 ?auto_147956 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147961 - BLOCK
      ?auto_147962 - BLOCK
      ?auto_147963 - BLOCK
    )
    :vars
    (
      ?auto_147964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147962 ) ( ON ?auto_147963 ?auto_147964 ) ( CLEAR ?auto_147963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147961 ) ( ON ?auto_147962 ?auto_147961 ) ( not ( = ?auto_147961 ?auto_147962 ) ) ( not ( = ?auto_147961 ?auto_147963 ) ) ( not ( = ?auto_147961 ?auto_147964 ) ) ( not ( = ?auto_147962 ?auto_147963 ) ) ( not ( = ?auto_147962 ?auto_147964 ) ) ( not ( = ?auto_147963 ?auto_147964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147963 ?auto_147964 )
      ( !STACK ?auto_147963 ?auto_147962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147968 - BLOCK
      ?auto_147969 - BLOCK
      ?auto_147970 - BLOCK
    )
    :vars
    (
      ?auto_147971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_147969 ) ( ON ?auto_147970 ?auto_147971 ) ( CLEAR ?auto_147970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_147968 ) ( ON ?auto_147969 ?auto_147968 ) ( not ( = ?auto_147968 ?auto_147969 ) ) ( not ( = ?auto_147968 ?auto_147970 ) ) ( not ( = ?auto_147968 ?auto_147971 ) ) ( not ( = ?auto_147969 ?auto_147970 ) ) ( not ( = ?auto_147969 ?auto_147971 ) ) ( not ( = ?auto_147970 ?auto_147971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_147970 ?auto_147971 )
      ( !STACK ?auto_147970 ?auto_147969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147975 - BLOCK
      ?auto_147976 - BLOCK
      ?auto_147977 - BLOCK
    )
    :vars
    (
      ?auto_147978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147977 ?auto_147978 ) ( ON-TABLE ?auto_147975 ) ( not ( = ?auto_147975 ?auto_147976 ) ) ( not ( = ?auto_147975 ?auto_147977 ) ) ( not ( = ?auto_147975 ?auto_147978 ) ) ( not ( = ?auto_147976 ?auto_147977 ) ) ( not ( = ?auto_147976 ?auto_147978 ) ) ( not ( = ?auto_147977 ?auto_147978 ) ) ( CLEAR ?auto_147975 ) ( ON ?auto_147976 ?auto_147977 ) ( CLEAR ?auto_147976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147975 ?auto_147976 )
      ( MAKE-3PILE ?auto_147975 ?auto_147976 ?auto_147977 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147982 - BLOCK
      ?auto_147983 - BLOCK
      ?auto_147984 - BLOCK
    )
    :vars
    (
      ?auto_147985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147984 ?auto_147985 ) ( ON-TABLE ?auto_147982 ) ( not ( = ?auto_147982 ?auto_147983 ) ) ( not ( = ?auto_147982 ?auto_147984 ) ) ( not ( = ?auto_147982 ?auto_147985 ) ) ( not ( = ?auto_147983 ?auto_147984 ) ) ( not ( = ?auto_147983 ?auto_147985 ) ) ( not ( = ?auto_147984 ?auto_147985 ) ) ( CLEAR ?auto_147982 ) ( ON ?auto_147983 ?auto_147984 ) ( CLEAR ?auto_147983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_147982 ?auto_147983 )
      ( MAKE-3PILE ?auto_147982 ?auto_147983 ?auto_147984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147989 - BLOCK
      ?auto_147990 - BLOCK
      ?auto_147991 - BLOCK
    )
    :vars
    (
      ?auto_147992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147991 ?auto_147992 ) ( not ( = ?auto_147989 ?auto_147990 ) ) ( not ( = ?auto_147989 ?auto_147991 ) ) ( not ( = ?auto_147989 ?auto_147992 ) ) ( not ( = ?auto_147990 ?auto_147991 ) ) ( not ( = ?auto_147990 ?auto_147992 ) ) ( not ( = ?auto_147991 ?auto_147992 ) ) ( ON ?auto_147990 ?auto_147991 ) ( ON ?auto_147989 ?auto_147990 ) ( CLEAR ?auto_147989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147989 )
      ( MAKE-3PILE ?auto_147989 ?auto_147990 ?auto_147991 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_147996 - BLOCK
      ?auto_147997 - BLOCK
      ?auto_147998 - BLOCK
    )
    :vars
    (
      ?auto_147999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_147998 ?auto_147999 ) ( not ( = ?auto_147996 ?auto_147997 ) ) ( not ( = ?auto_147996 ?auto_147998 ) ) ( not ( = ?auto_147996 ?auto_147999 ) ) ( not ( = ?auto_147997 ?auto_147998 ) ) ( not ( = ?auto_147997 ?auto_147999 ) ) ( not ( = ?auto_147998 ?auto_147999 ) ) ( ON ?auto_147997 ?auto_147998 ) ( ON ?auto_147996 ?auto_147997 ) ( CLEAR ?auto_147996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_147996 )
      ( MAKE-3PILE ?auto_147996 ?auto_147997 ?auto_147998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148004 - BLOCK
      ?auto_148005 - BLOCK
      ?auto_148006 - BLOCK
      ?auto_148007 - BLOCK
    )
    :vars
    (
      ?auto_148008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148006 ) ( ON ?auto_148007 ?auto_148008 ) ( CLEAR ?auto_148007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148004 ) ( ON ?auto_148005 ?auto_148004 ) ( ON ?auto_148006 ?auto_148005 ) ( not ( = ?auto_148004 ?auto_148005 ) ) ( not ( = ?auto_148004 ?auto_148006 ) ) ( not ( = ?auto_148004 ?auto_148007 ) ) ( not ( = ?auto_148004 ?auto_148008 ) ) ( not ( = ?auto_148005 ?auto_148006 ) ) ( not ( = ?auto_148005 ?auto_148007 ) ) ( not ( = ?auto_148005 ?auto_148008 ) ) ( not ( = ?auto_148006 ?auto_148007 ) ) ( not ( = ?auto_148006 ?auto_148008 ) ) ( not ( = ?auto_148007 ?auto_148008 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148007 ?auto_148008 )
      ( !STACK ?auto_148007 ?auto_148006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148013 - BLOCK
      ?auto_148014 - BLOCK
      ?auto_148015 - BLOCK
      ?auto_148016 - BLOCK
    )
    :vars
    (
      ?auto_148017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148015 ) ( ON ?auto_148016 ?auto_148017 ) ( CLEAR ?auto_148016 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148013 ) ( ON ?auto_148014 ?auto_148013 ) ( ON ?auto_148015 ?auto_148014 ) ( not ( = ?auto_148013 ?auto_148014 ) ) ( not ( = ?auto_148013 ?auto_148015 ) ) ( not ( = ?auto_148013 ?auto_148016 ) ) ( not ( = ?auto_148013 ?auto_148017 ) ) ( not ( = ?auto_148014 ?auto_148015 ) ) ( not ( = ?auto_148014 ?auto_148016 ) ) ( not ( = ?auto_148014 ?auto_148017 ) ) ( not ( = ?auto_148015 ?auto_148016 ) ) ( not ( = ?auto_148015 ?auto_148017 ) ) ( not ( = ?auto_148016 ?auto_148017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148016 ?auto_148017 )
      ( !STACK ?auto_148016 ?auto_148015 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148022 - BLOCK
      ?auto_148023 - BLOCK
      ?auto_148024 - BLOCK
      ?auto_148025 - BLOCK
    )
    :vars
    (
      ?auto_148026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148025 ?auto_148026 ) ( ON-TABLE ?auto_148022 ) ( ON ?auto_148023 ?auto_148022 ) ( not ( = ?auto_148022 ?auto_148023 ) ) ( not ( = ?auto_148022 ?auto_148024 ) ) ( not ( = ?auto_148022 ?auto_148025 ) ) ( not ( = ?auto_148022 ?auto_148026 ) ) ( not ( = ?auto_148023 ?auto_148024 ) ) ( not ( = ?auto_148023 ?auto_148025 ) ) ( not ( = ?auto_148023 ?auto_148026 ) ) ( not ( = ?auto_148024 ?auto_148025 ) ) ( not ( = ?auto_148024 ?auto_148026 ) ) ( not ( = ?auto_148025 ?auto_148026 ) ) ( CLEAR ?auto_148023 ) ( ON ?auto_148024 ?auto_148025 ) ( CLEAR ?auto_148024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148022 ?auto_148023 ?auto_148024 )
      ( MAKE-4PILE ?auto_148022 ?auto_148023 ?auto_148024 ?auto_148025 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148031 - BLOCK
      ?auto_148032 - BLOCK
      ?auto_148033 - BLOCK
      ?auto_148034 - BLOCK
    )
    :vars
    (
      ?auto_148035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148034 ?auto_148035 ) ( ON-TABLE ?auto_148031 ) ( ON ?auto_148032 ?auto_148031 ) ( not ( = ?auto_148031 ?auto_148032 ) ) ( not ( = ?auto_148031 ?auto_148033 ) ) ( not ( = ?auto_148031 ?auto_148034 ) ) ( not ( = ?auto_148031 ?auto_148035 ) ) ( not ( = ?auto_148032 ?auto_148033 ) ) ( not ( = ?auto_148032 ?auto_148034 ) ) ( not ( = ?auto_148032 ?auto_148035 ) ) ( not ( = ?auto_148033 ?auto_148034 ) ) ( not ( = ?auto_148033 ?auto_148035 ) ) ( not ( = ?auto_148034 ?auto_148035 ) ) ( CLEAR ?auto_148032 ) ( ON ?auto_148033 ?auto_148034 ) ( CLEAR ?auto_148033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148031 ?auto_148032 ?auto_148033 )
      ( MAKE-4PILE ?auto_148031 ?auto_148032 ?auto_148033 ?auto_148034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148040 - BLOCK
      ?auto_148041 - BLOCK
      ?auto_148042 - BLOCK
      ?auto_148043 - BLOCK
    )
    :vars
    (
      ?auto_148044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148043 ?auto_148044 ) ( ON-TABLE ?auto_148040 ) ( not ( = ?auto_148040 ?auto_148041 ) ) ( not ( = ?auto_148040 ?auto_148042 ) ) ( not ( = ?auto_148040 ?auto_148043 ) ) ( not ( = ?auto_148040 ?auto_148044 ) ) ( not ( = ?auto_148041 ?auto_148042 ) ) ( not ( = ?auto_148041 ?auto_148043 ) ) ( not ( = ?auto_148041 ?auto_148044 ) ) ( not ( = ?auto_148042 ?auto_148043 ) ) ( not ( = ?auto_148042 ?auto_148044 ) ) ( not ( = ?auto_148043 ?auto_148044 ) ) ( ON ?auto_148042 ?auto_148043 ) ( CLEAR ?auto_148040 ) ( ON ?auto_148041 ?auto_148042 ) ( CLEAR ?auto_148041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148040 ?auto_148041 )
      ( MAKE-4PILE ?auto_148040 ?auto_148041 ?auto_148042 ?auto_148043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148049 - BLOCK
      ?auto_148050 - BLOCK
      ?auto_148051 - BLOCK
      ?auto_148052 - BLOCK
    )
    :vars
    (
      ?auto_148053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148052 ?auto_148053 ) ( ON-TABLE ?auto_148049 ) ( not ( = ?auto_148049 ?auto_148050 ) ) ( not ( = ?auto_148049 ?auto_148051 ) ) ( not ( = ?auto_148049 ?auto_148052 ) ) ( not ( = ?auto_148049 ?auto_148053 ) ) ( not ( = ?auto_148050 ?auto_148051 ) ) ( not ( = ?auto_148050 ?auto_148052 ) ) ( not ( = ?auto_148050 ?auto_148053 ) ) ( not ( = ?auto_148051 ?auto_148052 ) ) ( not ( = ?auto_148051 ?auto_148053 ) ) ( not ( = ?auto_148052 ?auto_148053 ) ) ( ON ?auto_148051 ?auto_148052 ) ( CLEAR ?auto_148049 ) ( ON ?auto_148050 ?auto_148051 ) ( CLEAR ?auto_148050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148049 ?auto_148050 )
      ( MAKE-4PILE ?auto_148049 ?auto_148050 ?auto_148051 ?auto_148052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148058 - BLOCK
      ?auto_148059 - BLOCK
      ?auto_148060 - BLOCK
      ?auto_148061 - BLOCK
    )
    :vars
    (
      ?auto_148062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148061 ?auto_148062 ) ( not ( = ?auto_148058 ?auto_148059 ) ) ( not ( = ?auto_148058 ?auto_148060 ) ) ( not ( = ?auto_148058 ?auto_148061 ) ) ( not ( = ?auto_148058 ?auto_148062 ) ) ( not ( = ?auto_148059 ?auto_148060 ) ) ( not ( = ?auto_148059 ?auto_148061 ) ) ( not ( = ?auto_148059 ?auto_148062 ) ) ( not ( = ?auto_148060 ?auto_148061 ) ) ( not ( = ?auto_148060 ?auto_148062 ) ) ( not ( = ?auto_148061 ?auto_148062 ) ) ( ON ?auto_148060 ?auto_148061 ) ( ON ?auto_148059 ?auto_148060 ) ( ON ?auto_148058 ?auto_148059 ) ( CLEAR ?auto_148058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148058 )
      ( MAKE-4PILE ?auto_148058 ?auto_148059 ?auto_148060 ?auto_148061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_148067 - BLOCK
      ?auto_148068 - BLOCK
      ?auto_148069 - BLOCK
      ?auto_148070 - BLOCK
    )
    :vars
    (
      ?auto_148071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148070 ?auto_148071 ) ( not ( = ?auto_148067 ?auto_148068 ) ) ( not ( = ?auto_148067 ?auto_148069 ) ) ( not ( = ?auto_148067 ?auto_148070 ) ) ( not ( = ?auto_148067 ?auto_148071 ) ) ( not ( = ?auto_148068 ?auto_148069 ) ) ( not ( = ?auto_148068 ?auto_148070 ) ) ( not ( = ?auto_148068 ?auto_148071 ) ) ( not ( = ?auto_148069 ?auto_148070 ) ) ( not ( = ?auto_148069 ?auto_148071 ) ) ( not ( = ?auto_148070 ?auto_148071 ) ) ( ON ?auto_148069 ?auto_148070 ) ( ON ?auto_148068 ?auto_148069 ) ( ON ?auto_148067 ?auto_148068 ) ( CLEAR ?auto_148067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148067 )
      ( MAKE-4PILE ?auto_148067 ?auto_148068 ?auto_148069 ?auto_148070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148077 - BLOCK
      ?auto_148078 - BLOCK
      ?auto_148079 - BLOCK
      ?auto_148080 - BLOCK
      ?auto_148081 - BLOCK
    )
    :vars
    (
      ?auto_148082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148080 ) ( ON ?auto_148081 ?auto_148082 ) ( CLEAR ?auto_148081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148077 ) ( ON ?auto_148078 ?auto_148077 ) ( ON ?auto_148079 ?auto_148078 ) ( ON ?auto_148080 ?auto_148079 ) ( not ( = ?auto_148077 ?auto_148078 ) ) ( not ( = ?auto_148077 ?auto_148079 ) ) ( not ( = ?auto_148077 ?auto_148080 ) ) ( not ( = ?auto_148077 ?auto_148081 ) ) ( not ( = ?auto_148077 ?auto_148082 ) ) ( not ( = ?auto_148078 ?auto_148079 ) ) ( not ( = ?auto_148078 ?auto_148080 ) ) ( not ( = ?auto_148078 ?auto_148081 ) ) ( not ( = ?auto_148078 ?auto_148082 ) ) ( not ( = ?auto_148079 ?auto_148080 ) ) ( not ( = ?auto_148079 ?auto_148081 ) ) ( not ( = ?auto_148079 ?auto_148082 ) ) ( not ( = ?auto_148080 ?auto_148081 ) ) ( not ( = ?auto_148080 ?auto_148082 ) ) ( not ( = ?auto_148081 ?auto_148082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148081 ?auto_148082 )
      ( !STACK ?auto_148081 ?auto_148080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148088 - BLOCK
      ?auto_148089 - BLOCK
      ?auto_148090 - BLOCK
      ?auto_148091 - BLOCK
      ?auto_148092 - BLOCK
    )
    :vars
    (
      ?auto_148093 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148091 ) ( ON ?auto_148092 ?auto_148093 ) ( CLEAR ?auto_148092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148088 ) ( ON ?auto_148089 ?auto_148088 ) ( ON ?auto_148090 ?auto_148089 ) ( ON ?auto_148091 ?auto_148090 ) ( not ( = ?auto_148088 ?auto_148089 ) ) ( not ( = ?auto_148088 ?auto_148090 ) ) ( not ( = ?auto_148088 ?auto_148091 ) ) ( not ( = ?auto_148088 ?auto_148092 ) ) ( not ( = ?auto_148088 ?auto_148093 ) ) ( not ( = ?auto_148089 ?auto_148090 ) ) ( not ( = ?auto_148089 ?auto_148091 ) ) ( not ( = ?auto_148089 ?auto_148092 ) ) ( not ( = ?auto_148089 ?auto_148093 ) ) ( not ( = ?auto_148090 ?auto_148091 ) ) ( not ( = ?auto_148090 ?auto_148092 ) ) ( not ( = ?auto_148090 ?auto_148093 ) ) ( not ( = ?auto_148091 ?auto_148092 ) ) ( not ( = ?auto_148091 ?auto_148093 ) ) ( not ( = ?auto_148092 ?auto_148093 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148092 ?auto_148093 )
      ( !STACK ?auto_148092 ?auto_148091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148099 - BLOCK
      ?auto_148100 - BLOCK
      ?auto_148101 - BLOCK
      ?auto_148102 - BLOCK
      ?auto_148103 - BLOCK
    )
    :vars
    (
      ?auto_148104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148103 ?auto_148104 ) ( ON-TABLE ?auto_148099 ) ( ON ?auto_148100 ?auto_148099 ) ( ON ?auto_148101 ?auto_148100 ) ( not ( = ?auto_148099 ?auto_148100 ) ) ( not ( = ?auto_148099 ?auto_148101 ) ) ( not ( = ?auto_148099 ?auto_148102 ) ) ( not ( = ?auto_148099 ?auto_148103 ) ) ( not ( = ?auto_148099 ?auto_148104 ) ) ( not ( = ?auto_148100 ?auto_148101 ) ) ( not ( = ?auto_148100 ?auto_148102 ) ) ( not ( = ?auto_148100 ?auto_148103 ) ) ( not ( = ?auto_148100 ?auto_148104 ) ) ( not ( = ?auto_148101 ?auto_148102 ) ) ( not ( = ?auto_148101 ?auto_148103 ) ) ( not ( = ?auto_148101 ?auto_148104 ) ) ( not ( = ?auto_148102 ?auto_148103 ) ) ( not ( = ?auto_148102 ?auto_148104 ) ) ( not ( = ?auto_148103 ?auto_148104 ) ) ( CLEAR ?auto_148101 ) ( ON ?auto_148102 ?auto_148103 ) ( CLEAR ?auto_148102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148099 ?auto_148100 ?auto_148101 ?auto_148102 )
      ( MAKE-5PILE ?auto_148099 ?auto_148100 ?auto_148101 ?auto_148102 ?auto_148103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148110 - BLOCK
      ?auto_148111 - BLOCK
      ?auto_148112 - BLOCK
      ?auto_148113 - BLOCK
      ?auto_148114 - BLOCK
    )
    :vars
    (
      ?auto_148115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148114 ?auto_148115 ) ( ON-TABLE ?auto_148110 ) ( ON ?auto_148111 ?auto_148110 ) ( ON ?auto_148112 ?auto_148111 ) ( not ( = ?auto_148110 ?auto_148111 ) ) ( not ( = ?auto_148110 ?auto_148112 ) ) ( not ( = ?auto_148110 ?auto_148113 ) ) ( not ( = ?auto_148110 ?auto_148114 ) ) ( not ( = ?auto_148110 ?auto_148115 ) ) ( not ( = ?auto_148111 ?auto_148112 ) ) ( not ( = ?auto_148111 ?auto_148113 ) ) ( not ( = ?auto_148111 ?auto_148114 ) ) ( not ( = ?auto_148111 ?auto_148115 ) ) ( not ( = ?auto_148112 ?auto_148113 ) ) ( not ( = ?auto_148112 ?auto_148114 ) ) ( not ( = ?auto_148112 ?auto_148115 ) ) ( not ( = ?auto_148113 ?auto_148114 ) ) ( not ( = ?auto_148113 ?auto_148115 ) ) ( not ( = ?auto_148114 ?auto_148115 ) ) ( CLEAR ?auto_148112 ) ( ON ?auto_148113 ?auto_148114 ) ( CLEAR ?auto_148113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148110 ?auto_148111 ?auto_148112 ?auto_148113 )
      ( MAKE-5PILE ?auto_148110 ?auto_148111 ?auto_148112 ?auto_148113 ?auto_148114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148121 - BLOCK
      ?auto_148122 - BLOCK
      ?auto_148123 - BLOCK
      ?auto_148124 - BLOCK
      ?auto_148125 - BLOCK
    )
    :vars
    (
      ?auto_148126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148125 ?auto_148126 ) ( ON-TABLE ?auto_148121 ) ( ON ?auto_148122 ?auto_148121 ) ( not ( = ?auto_148121 ?auto_148122 ) ) ( not ( = ?auto_148121 ?auto_148123 ) ) ( not ( = ?auto_148121 ?auto_148124 ) ) ( not ( = ?auto_148121 ?auto_148125 ) ) ( not ( = ?auto_148121 ?auto_148126 ) ) ( not ( = ?auto_148122 ?auto_148123 ) ) ( not ( = ?auto_148122 ?auto_148124 ) ) ( not ( = ?auto_148122 ?auto_148125 ) ) ( not ( = ?auto_148122 ?auto_148126 ) ) ( not ( = ?auto_148123 ?auto_148124 ) ) ( not ( = ?auto_148123 ?auto_148125 ) ) ( not ( = ?auto_148123 ?auto_148126 ) ) ( not ( = ?auto_148124 ?auto_148125 ) ) ( not ( = ?auto_148124 ?auto_148126 ) ) ( not ( = ?auto_148125 ?auto_148126 ) ) ( ON ?auto_148124 ?auto_148125 ) ( CLEAR ?auto_148122 ) ( ON ?auto_148123 ?auto_148124 ) ( CLEAR ?auto_148123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148121 ?auto_148122 ?auto_148123 )
      ( MAKE-5PILE ?auto_148121 ?auto_148122 ?auto_148123 ?auto_148124 ?auto_148125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148132 - BLOCK
      ?auto_148133 - BLOCK
      ?auto_148134 - BLOCK
      ?auto_148135 - BLOCK
      ?auto_148136 - BLOCK
    )
    :vars
    (
      ?auto_148137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148136 ?auto_148137 ) ( ON-TABLE ?auto_148132 ) ( ON ?auto_148133 ?auto_148132 ) ( not ( = ?auto_148132 ?auto_148133 ) ) ( not ( = ?auto_148132 ?auto_148134 ) ) ( not ( = ?auto_148132 ?auto_148135 ) ) ( not ( = ?auto_148132 ?auto_148136 ) ) ( not ( = ?auto_148132 ?auto_148137 ) ) ( not ( = ?auto_148133 ?auto_148134 ) ) ( not ( = ?auto_148133 ?auto_148135 ) ) ( not ( = ?auto_148133 ?auto_148136 ) ) ( not ( = ?auto_148133 ?auto_148137 ) ) ( not ( = ?auto_148134 ?auto_148135 ) ) ( not ( = ?auto_148134 ?auto_148136 ) ) ( not ( = ?auto_148134 ?auto_148137 ) ) ( not ( = ?auto_148135 ?auto_148136 ) ) ( not ( = ?auto_148135 ?auto_148137 ) ) ( not ( = ?auto_148136 ?auto_148137 ) ) ( ON ?auto_148135 ?auto_148136 ) ( CLEAR ?auto_148133 ) ( ON ?auto_148134 ?auto_148135 ) ( CLEAR ?auto_148134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148132 ?auto_148133 ?auto_148134 )
      ( MAKE-5PILE ?auto_148132 ?auto_148133 ?auto_148134 ?auto_148135 ?auto_148136 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148143 - BLOCK
      ?auto_148144 - BLOCK
      ?auto_148145 - BLOCK
      ?auto_148146 - BLOCK
      ?auto_148147 - BLOCK
    )
    :vars
    (
      ?auto_148148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148147 ?auto_148148 ) ( ON-TABLE ?auto_148143 ) ( not ( = ?auto_148143 ?auto_148144 ) ) ( not ( = ?auto_148143 ?auto_148145 ) ) ( not ( = ?auto_148143 ?auto_148146 ) ) ( not ( = ?auto_148143 ?auto_148147 ) ) ( not ( = ?auto_148143 ?auto_148148 ) ) ( not ( = ?auto_148144 ?auto_148145 ) ) ( not ( = ?auto_148144 ?auto_148146 ) ) ( not ( = ?auto_148144 ?auto_148147 ) ) ( not ( = ?auto_148144 ?auto_148148 ) ) ( not ( = ?auto_148145 ?auto_148146 ) ) ( not ( = ?auto_148145 ?auto_148147 ) ) ( not ( = ?auto_148145 ?auto_148148 ) ) ( not ( = ?auto_148146 ?auto_148147 ) ) ( not ( = ?auto_148146 ?auto_148148 ) ) ( not ( = ?auto_148147 ?auto_148148 ) ) ( ON ?auto_148146 ?auto_148147 ) ( ON ?auto_148145 ?auto_148146 ) ( CLEAR ?auto_148143 ) ( ON ?auto_148144 ?auto_148145 ) ( CLEAR ?auto_148144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148143 ?auto_148144 )
      ( MAKE-5PILE ?auto_148143 ?auto_148144 ?auto_148145 ?auto_148146 ?auto_148147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148154 - BLOCK
      ?auto_148155 - BLOCK
      ?auto_148156 - BLOCK
      ?auto_148157 - BLOCK
      ?auto_148158 - BLOCK
    )
    :vars
    (
      ?auto_148159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148158 ?auto_148159 ) ( ON-TABLE ?auto_148154 ) ( not ( = ?auto_148154 ?auto_148155 ) ) ( not ( = ?auto_148154 ?auto_148156 ) ) ( not ( = ?auto_148154 ?auto_148157 ) ) ( not ( = ?auto_148154 ?auto_148158 ) ) ( not ( = ?auto_148154 ?auto_148159 ) ) ( not ( = ?auto_148155 ?auto_148156 ) ) ( not ( = ?auto_148155 ?auto_148157 ) ) ( not ( = ?auto_148155 ?auto_148158 ) ) ( not ( = ?auto_148155 ?auto_148159 ) ) ( not ( = ?auto_148156 ?auto_148157 ) ) ( not ( = ?auto_148156 ?auto_148158 ) ) ( not ( = ?auto_148156 ?auto_148159 ) ) ( not ( = ?auto_148157 ?auto_148158 ) ) ( not ( = ?auto_148157 ?auto_148159 ) ) ( not ( = ?auto_148158 ?auto_148159 ) ) ( ON ?auto_148157 ?auto_148158 ) ( ON ?auto_148156 ?auto_148157 ) ( CLEAR ?auto_148154 ) ( ON ?auto_148155 ?auto_148156 ) ( CLEAR ?auto_148155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148154 ?auto_148155 )
      ( MAKE-5PILE ?auto_148154 ?auto_148155 ?auto_148156 ?auto_148157 ?auto_148158 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148165 - BLOCK
      ?auto_148166 - BLOCK
      ?auto_148167 - BLOCK
      ?auto_148168 - BLOCK
      ?auto_148169 - BLOCK
    )
    :vars
    (
      ?auto_148170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148169 ?auto_148170 ) ( not ( = ?auto_148165 ?auto_148166 ) ) ( not ( = ?auto_148165 ?auto_148167 ) ) ( not ( = ?auto_148165 ?auto_148168 ) ) ( not ( = ?auto_148165 ?auto_148169 ) ) ( not ( = ?auto_148165 ?auto_148170 ) ) ( not ( = ?auto_148166 ?auto_148167 ) ) ( not ( = ?auto_148166 ?auto_148168 ) ) ( not ( = ?auto_148166 ?auto_148169 ) ) ( not ( = ?auto_148166 ?auto_148170 ) ) ( not ( = ?auto_148167 ?auto_148168 ) ) ( not ( = ?auto_148167 ?auto_148169 ) ) ( not ( = ?auto_148167 ?auto_148170 ) ) ( not ( = ?auto_148168 ?auto_148169 ) ) ( not ( = ?auto_148168 ?auto_148170 ) ) ( not ( = ?auto_148169 ?auto_148170 ) ) ( ON ?auto_148168 ?auto_148169 ) ( ON ?auto_148167 ?auto_148168 ) ( ON ?auto_148166 ?auto_148167 ) ( ON ?auto_148165 ?auto_148166 ) ( CLEAR ?auto_148165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148165 )
      ( MAKE-5PILE ?auto_148165 ?auto_148166 ?auto_148167 ?auto_148168 ?auto_148169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_148176 - BLOCK
      ?auto_148177 - BLOCK
      ?auto_148178 - BLOCK
      ?auto_148179 - BLOCK
      ?auto_148180 - BLOCK
    )
    :vars
    (
      ?auto_148181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148180 ?auto_148181 ) ( not ( = ?auto_148176 ?auto_148177 ) ) ( not ( = ?auto_148176 ?auto_148178 ) ) ( not ( = ?auto_148176 ?auto_148179 ) ) ( not ( = ?auto_148176 ?auto_148180 ) ) ( not ( = ?auto_148176 ?auto_148181 ) ) ( not ( = ?auto_148177 ?auto_148178 ) ) ( not ( = ?auto_148177 ?auto_148179 ) ) ( not ( = ?auto_148177 ?auto_148180 ) ) ( not ( = ?auto_148177 ?auto_148181 ) ) ( not ( = ?auto_148178 ?auto_148179 ) ) ( not ( = ?auto_148178 ?auto_148180 ) ) ( not ( = ?auto_148178 ?auto_148181 ) ) ( not ( = ?auto_148179 ?auto_148180 ) ) ( not ( = ?auto_148179 ?auto_148181 ) ) ( not ( = ?auto_148180 ?auto_148181 ) ) ( ON ?auto_148179 ?auto_148180 ) ( ON ?auto_148178 ?auto_148179 ) ( ON ?auto_148177 ?auto_148178 ) ( ON ?auto_148176 ?auto_148177 ) ( CLEAR ?auto_148176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148176 )
      ( MAKE-5PILE ?auto_148176 ?auto_148177 ?auto_148178 ?auto_148179 ?auto_148180 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148188 - BLOCK
      ?auto_148189 - BLOCK
      ?auto_148190 - BLOCK
      ?auto_148191 - BLOCK
      ?auto_148192 - BLOCK
      ?auto_148193 - BLOCK
    )
    :vars
    (
      ?auto_148194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148192 ) ( ON ?auto_148193 ?auto_148194 ) ( CLEAR ?auto_148193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148188 ) ( ON ?auto_148189 ?auto_148188 ) ( ON ?auto_148190 ?auto_148189 ) ( ON ?auto_148191 ?auto_148190 ) ( ON ?auto_148192 ?auto_148191 ) ( not ( = ?auto_148188 ?auto_148189 ) ) ( not ( = ?auto_148188 ?auto_148190 ) ) ( not ( = ?auto_148188 ?auto_148191 ) ) ( not ( = ?auto_148188 ?auto_148192 ) ) ( not ( = ?auto_148188 ?auto_148193 ) ) ( not ( = ?auto_148188 ?auto_148194 ) ) ( not ( = ?auto_148189 ?auto_148190 ) ) ( not ( = ?auto_148189 ?auto_148191 ) ) ( not ( = ?auto_148189 ?auto_148192 ) ) ( not ( = ?auto_148189 ?auto_148193 ) ) ( not ( = ?auto_148189 ?auto_148194 ) ) ( not ( = ?auto_148190 ?auto_148191 ) ) ( not ( = ?auto_148190 ?auto_148192 ) ) ( not ( = ?auto_148190 ?auto_148193 ) ) ( not ( = ?auto_148190 ?auto_148194 ) ) ( not ( = ?auto_148191 ?auto_148192 ) ) ( not ( = ?auto_148191 ?auto_148193 ) ) ( not ( = ?auto_148191 ?auto_148194 ) ) ( not ( = ?auto_148192 ?auto_148193 ) ) ( not ( = ?auto_148192 ?auto_148194 ) ) ( not ( = ?auto_148193 ?auto_148194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148193 ?auto_148194 )
      ( !STACK ?auto_148193 ?auto_148192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148201 - BLOCK
      ?auto_148202 - BLOCK
      ?auto_148203 - BLOCK
      ?auto_148204 - BLOCK
      ?auto_148205 - BLOCK
      ?auto_148206 - BLOCK
    )
    :vars
    (
      ?auto_148207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148205 ) ( ON ?auto_148206 ?auto_148207 ) ( CLEAR ?auto_148206 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148201 ) ( ON ?auto_148202 ?auto_148201 ) ( ON ?auto_148203 ?auto_148202 ) ( ON ?auto_148204 ?auto_148203 ) ( ON ?auto_148205 ?auto_148204 ) ( not ( = ?auto_148201 ?auto_148202 ) ) ( not ( = ?auto_148201 ?auto_148203 ) ) ( not ( = ?auto_148201 ?auto_148204 ) ) ( not ( = ?auto_148201 ?auto_148205 ) ) ( not ( = ?auto_148201 ?auto_148206 ) ) ( not ( = ?auto_148201 ?auto_148207 ) ) ( not ( = ?auto_148202 ?auto_148203 ) ) ( not ( = ?auto_148202 ?auto_148204 ) ) ( not ( = ?auto_148202 ?auto_148205 ) ) ( not ( = ?auto_148202 ?auto_148206 ) ) ( not ( = ?auto_148202 ?auto_148207 ) ) ( not ( = ?auto_148203 ?auto_148204 ) ) ( not ( = ?auto_148203 ?auto_148205 ) ) ( not ( = ?auto_148203 ?auto_148206 ) ) ( not ( = ?auto_148203 ?auto_148207 ) ) ( not ( = ?auto_148204 ?auto_148205 ) ) ( not ( = ?auto_148204 ?auto_148206 ) ) ( not ( = ?auto_148204 ?auto_148207 ) ) ( not ( = ?auto_148205 ?auto_148206 ) ) ( not ( = ?auto_148205 ?auto_148207 ) ) ( not ( = ?auto_148206 ?auto_148207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148206 ?auto_148207 )
      ( !STACK ?auto_148206 ?auto_148205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148214 - BLOCK
      ?auto_148215 - BLOCK
      ?auto_148216 - BLOCK
      ?auto_148217 - BLOCK
      ?auto_148218 - BLOCK
      ?auto_148219 - BLOCK
    )
    :vars
    (
      ?auto_148220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148219 ?auto_148220 ) ( ON-TABLE ?auto_148214 ) ( ON ?auto_148215 ?auto_148214 ) ( ON ?auto_148216 ?auto_148215 ) ( ON ?auto_148217 ?auto_148216 ) ( not ( = ?auto_148214 ?auto_148215 ) ) ( not ( = ?auto_148214 ?auto_148216 ) ) ( not ( = ?auto_148214 ?auto_148217 ) ) ( not ( = ?auto_148214 ?auto_148218 ) ) ( not ( = ?auto_148214 ?auto_148219 ) ) ( not ( = ?auto_148214 ?auto_148220 ) ) ( not ( = ?auto_148215 ?auto_148216 ) ) ( not ( = ?auto_148215 ?auto_148217 ) ) ( not ( = ?auto_148215 ?auto_148218 ) ) ( not ( = ?auto_148215 ?auto_148219 ) ) ( not ( = ?auto_148215 ?auto_148220 ) ) ( not ( = ?auto_148216 ?auto_148217 ) ) ( not ( = ?auto_148216 ?auto_148218 ) ) ( not ( = ?auto_148216 ?auto_148219 ) ) ( not ( = ?auto_148216 ?auto_148220 ) ) ( not ( = ?auto_148217 ?auto_148218 ) ) ( not ( = ?auto_148217 ?auto_148219 ) ) ( not ( = ?auto_148217 ?auto_148220 ) ) ( not ( = ?auto_148218 ?auto_148219 ) ) ( not ( = ?auto_148218 ?auto_148220 ) ) ( not ( = ?auto_148219 ?auto_148220 ) ) ( CLEAR ?auto_148217 ) ( ON ?auto_148218 ?auto_148219 ) ( CLEAR ?auto_148218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148214 ?auto_148215 ?auto_148216 ?auto_148217 ?auto_148218 )
      ( MAKE-6PILE ?auto_148214 ?auto_148215 ?auto_148216 ?auto_148217 ?auto_148218 ?auto_148219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148227 - BLOCK
      ?auto_148228 - BLOCK
      ?auto_148229 - BLOCK
      ?auto_148230 - BLOCK
      ?auto_148231 - BLOCK
      ?auto_148232 - BLOCK
    )
    :vars
    (
      ?auto_148233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148232 ?auto_148233 ) ( ON-TABLE ?auto_148227 ) ( ON ?auto_148228 ?auto_148227 ) ( ON ?auto_148229 ?auto_148228 ) ( ON ?auto_148230 ?auto_148229 ) ( not ( = ?auto_148227 ?auto_148228 ) ) ( not ( = ?auto_148227 ?auto_148229 ) ) ( not ( = ?auto_148227 ?auto_148230 ) ) ( not ( = ?auto_148227 ?auto_148231 ) ) ( not ( = ?auto_148227 ?auto_148232 ) ) ( not ( = ?auto_148227 ?auto_148233 ) ) ( not ( = ?auto_148228 ?auto_148229 ) ) ( not ( = ?auto_148228 ?auto_148230 ) ) ( not ( = ?auto_148228 ?auto_148231 ) ) ( not ( = ?auto_148228 ?auto_148232 ) ) ( not ( = ?auto_148228 ?auto_148233 ) ) ( not ( = ?auto_148229 ?auto_148230 ) ) ( not ( = ?auto_148229 ?auto_148231 ) ) ( not ( = ?auto_148229 ?auto_148232 ) ) ( not ( = ?auto_148229 ?auto_148233 ) ) ( not ( = ?auto_148230 ?auto_148231 ) ) ( not ( = ?auto_148230 ?auto_148232 ) ) ( not ( = ?auto_148230 ?auto_148233 ) ) ( not ( = ?auto_148231 ?auto_148232 ) ) ( not ( = ?auto_148231 ?auto_148233 ) ) ( not ( = ?auto_148232 ?auto_148233 ) ) ( CLEAR ?auto_148230 ) ( ON ?auto_148231 ?auto_148232 ) ( CLEAR ?auto_148231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148227 ?auto_148228 ?auto_148229 ?auto_148230 ?auto_148231 )
      ( MAKE-6PILE ?auto_148227 ?auto_148228 ?auto_148229 ?auto_148230 ?auto_148231 ?auto_148232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148240 - BLOCK
      ?auto_148241 - BLOCK
      ?auto_148242 - BLOCK
      ?auto_148243 - BLOCK
      ?auto_148244 - BLOCK
      ?auto_148245 - BLOCK
    )
    :vars
    (
      ?auto_148246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148245 ?auto_148246 ) ( ON-TABLE ?auto_148240 ) ( ON ?auto_148241 ?auto_148240 ) ( ON ?auto_148242 ?auto_148241 ) ( not ( = ?auto_148240 ?auto_148241 ) ) ( not ( = ?auto_148240 ?auto_148242 ) ) ( not ( = ?auto_148240 ?auto_148243 ) ) ( not ( = ?auto_148240 ?auto_148244 ) ) ( not ( = ?auto_148240 ?auto_148245 ) ) ( not ( = ?auto_148240 ?auto_148246 ) ) ( not ( = ?auto_148241 ?auto_148242 ) ) ( not ( = ?auto_148241 ?auto_148243 ) ) ( not ( = ?auto_148241 ?auto_148244 ) ) ( not ( = ?auto_148241 ?auto_148245 ) ) ( not ( = ?auto_148241 ?auto_148246 ) ) ( not ( = ?auto_148242 ?auto_148243 ) ) ( not ( = ?auto_148242 ?auto_148244 ) ) ( not ( = ?auto_148242 ?auto_148245 ) ) ( not ( = ?auto_148242 ?auto_148246 ) ) ( not ( = ?auto_148243 ?auto_148244 ) ) ( not ( = ?auto_148243 ?auto_148245 ) ) ( not ( = ?auto_148243 ?auto_148246 ) ) ( not ( = ?auto_148244 ?auto_148245 ) ) ( not ( = ?auto_148244 ?auto_148246 ) ) ( not ( = ?auto_148245 ?auto_148246 ) ) ( ON ?auto_148244 ?auto_148245 ) ( CLEAR ?auto_148242 ) ( ON ?auto_148243 ?auto_148244 ) ( CLEAR ?auto_148243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148240 ?auto_148241 ?auto_148242 ?auto_148243 )
      ( MAKE-6PILE ?auto_148240 ?auto_148241 ?auto_148242 ?auto_148243 ?auto_148244 ?auto_148245 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148253 - BLOCK
      ?auto_148254 - BLOCK
      ?auto_148255 - BLOCK
      ?auto_148256 - BLOCK
      ?auto_148257 - BLOCK
      ?auto_148258 - BLOCK
    )
    :vars
    (
      ?auto_148259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148258 ?auto_148259 ) ( ON-TABLE ?auto_148253 ) ( ON ?auto_148254 ?auto_148253 ) ( ON ?auto_148255 ?auto_148254 ) ( not ( = ?auto_148253 ?auto_148254 ) ) ( not ( = ?auto_148253 ?auto_148255 ) ) ( not ( = ?auto_148253 ?auto_148256 ) ) ( not ( = ?auto_148253 ?auto_148257 ) ) ( not ( = ?auto_148253 ?auto_148258 ) ) ( not ( = ?auto_148253 ?auto_148259 ) ) ( not ( = ?auto_148254 ?auto_148255 ) ) ( not ( = ?auto_148254 ?auto_148256 ) ) ( not ( = ?auto_148254 ?auto_148257 ) ) ( not ( = ?auto_148254 ?auto_148258 ) ) ( not ( = ?auto_148254 ?auto_148259 ) ) ( not ( = ?auto_148255 ?auto_148256 ) ) ( not ( = ?auto_148255 ?auto_148257 ) ) ( not ( = ?auto_148255 ?auto_148258 ) ) ( not ( = ?auto_148255 ?auto_148259 ) ) ( not ( = ?auto_148256 ?auto_148257 ) ) ( not ( = ?auto_148256 ?auto_148258 ) ) ( not ( = ?auto_148256 ?auto_148259 ) ) ( not ( = ?auto_148257 ?auto_148258 ) ) ( not ( = ?auto_148257 ?auto_148259 ) ) ( not ( = ?auto_148258 ?auto_148259 ) ) ( ON ?auto_148257 ?auto_148258 ) ( CLEAR ?auto_148255 ) ( ON ?auto_148256 ?auto_148257 ) ( CLEAR ?auto_148256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148253 ?auto_148254 ?auto_148255 ?auto_148256 )
      ( MAKE-6PILE ?auto_148253 ?auto_148254 ?auto_148255 ?auto_148256 ?auto_148257 ?auto_148258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148266 - BLOCK
      ?auto_148267 - BLOCK
      ?auto_148268 - BLOCK
      ?auto_148269 - BLOCK
      ?auto_148270 - BLOCK
      ?auto_148271 - BLOCK
    )
    :vars
    (
      ?auto_148272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148271 ?auto_148272 ) ( ON-TABLE ?auto_148266 ) ( ON ?auto_148267 ?auto_148266 ) ( not ( = ?auto_148266 ?auto_148267 ) ) ( not ( = ?auto_148266 ?auto_148268 ) ) ( not ( = ?auto_148266 ?auto_148269 ) ) ( not ( = ?auto_148266 ?auto_148270 ) ) ( not ( = ?auto_148266 ?auto_148271 ) ) ( not ( = ?auto_148266 ?auto_148272 ) ) ( not ( = ?auto_148267 ?auto_148268 ) ) ( not ( = ?auto_148267 ?auto_148269 ) ) ( not ( = ?auto_148267 ?auto_148270 ) ) ( not ( = ?auto_148267 ?auto_148271 ) ) ( not ( = ?auto_148267 ?auto_148272 ) ) ( not ( = ?auto_148268 ?auto_148269 ) ) ( not ( = ?auto_148268 ?auto_148270 ) ) ( not ( = ?auto_148268 ?auto_148271 ) ) ( not ( = ?auto_148268 ?auto_148272 ) ) ( not ( = ?auto_148269 ?auto_148270 ) ) ( not ( = ?auto_148269 ?auto_148271 ) ) ( not ( = ?auto_148269 ?auto_148272 ) ) ( not ( = ?auto_148270 ?auto_148271 ) ) ( not ( = ?auto_148270 ?auto_148272 ) ) ( not ( = ?auto_148271 ?auto_148272 ) ) ( ON ?auto_148270 ?auto_148271 ) ( ON ?auto_148269 ?auto_148270 ) ( CLEAR ?auto_148267 ) ( ON ?auto_148268 ?auto_148269 ) ( CLEAR ?auto_148268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148266 ?auto_148267 ?auto_148268 )
      ( MAKE-6PILE ?auto_148266 ?auto_148267 ?auto_148268 ?auto_148269 ?auto_148270 ?auto_148271 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148279 - BLOCK
      ?auto_148280 - BLOCK
      ?auto_148281 - BLOCK
      ?auto_148282 - BLOCK
      ?auto_148283 - BLOCK
      ?auto_148284 - BLOCK
    )
    :vars
    (
      ?auto_148285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148284 ?auto_148285 ) ( ON-TABLE ?auto_148279 ) ( ON ?auto_148280 ?auto_148279 ) ( not ( = ?auto_148279 ?auto_148280 ) ) ( not ( = ?auto_148279 ?auto_148281 ) ) ( not ( = ?auto_148279 ?auto_148282 ) ) ( not ( = ?auto_148279 ?auto_148283 ) ) ( not ( = ?auto_148279 ?auto_148284 ) ) ( not ( = ?auto_148279 ?auto_148285 ) ) ( not ( = ?auto_148280 ?auto_148281 ) ) ( not ( = ?auto_148280 ?auto_148282 ) ) ( not ( = ?auto_148280 ?auto_148283 ) ) ( not ( = ?auto_148280 ?auto_148284 ) ) ( not ( = ?auto_148280 ?auto_148285 ) ) ( not ( = ?auto_148281 ?auto_148282 ) ) ( not ( = ?auto_148281 ?auto_148283 ) ) ( not ( = ?auto_148281 ?auto_148284 ) ) ( not ( = ?auto_148281 ?auto_148285 ) ) ( not ( = ?auto_148282 ?auto_148283 ) ) ( not ( = ?auto_148282 ?auto_148284 ) ) ( not ( = ?auto_148282 ?auto_148285 ) ) ( not ( = ?auto_148283 ?auto_148284 ) ) ( not ( = ?auto_148283 ?auto_148285 ) ) ( not ( = ?auto_148284 ?auto_148285 ) ) ( ON ?auto_148283 ?auto_148284 ) ( ON ?auto_148282 ?auto_148283 ) ( CLEAR ?auto_148280 ) ( ON ?auto_148281 ?auto_148282 ) ( CLEAR ?auto_148281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148279 ?auto_148280 ?auto_148281 )
      ( MAKE-6PILE ?auto_148279 ?auto_148280 ?auto_148281 ?auto_148282 ?auto_148283 ?auto_148284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148292 - BLOCK
      ?auto_148293 - BLOCK
      ?auto_148294 - BLOCK
      ?auto_148295 - BLOCK
      ?auto_148296 - BLOCK
      ?auto_148297 - BLOCK
    )
    :vars
    (
      ?auto_148298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148297 ?auto_148298 ) ( ON-TABLE ?auto_148292 ) ( not ( = ?auto_148292 ?auto_148293 ) ) ( not ( = ?auto_148292 ?auto_148294 ) ) ( not ( = ?auto_148292 ?auto_148295 ) ) ( not ( = ?auto_148292 ?auto_148296 ) ) ( not ( = ?auto_148292 ?auto_148297 ) ) ( not ( = ?auto_148292 ?auto_148298 ) ) ( not ( = ?auto_148293 ?auto_148294 ) ) ( not ( = ?auto_148293 ?auto_148295 ) ) ( not ( = ?auto_148293 ?auto_148296 ) ) ( not ( = ?auto_148293 ?auto_148297 ) ) ( not ( = ?auto_148293 ?auto_148298 ) ) ( not ( = ?auto_148294 ?auto_148295 ) ) ( not ( = ?auto_148294 ?auto_148296 ) ) ( not ( = ?auto_148294 ?auto_148297 ) ) ( not ( = ?auto_148294 ?auto_148298 ) ) ( not ( = ?auto_148295 ?auto_148296 ) ) ( not ( = ?auto_148295 ?auto_148297 ) ) ( not ( = ?auto_148295 ?auto_148298 ) ) ( not ( = ?auto_148296 ?auto_148297 ) ) ( not ( = ?auto_148296 ?auto_148298 ) ) ( not ( = ?auto_148297 ?auto_148298 ) ) ( ON ?auto_148296 ?auto_148297 ) ( ON ?auto_148295 ?auto_148296 ) ( ON ?auto_148294 ?auto_148295 ) ( CLEAR ?auto_148292 ) ( ON ?auto_148293 ?auto_148294 ) ( CLEAR ?auto_148293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148292 ?auto_148293 )
      ( MAKE-6PILE ?auto_148292 ?auto_148293 ?auto_148294 ?auto_148295 ?auto_148296 ?auto_148297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148305 - BLOCK
      ?auto_148306 - BLOCK
      ?auto_148307 - BLOCK
      ?auto_148308 - BLOCK
      ?auto_148309 - BLOCK
      ?auto_148310 - BLOCK
    )
    :vars
    (
      ?auto_148311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148310 ?auto_148311 ) ( ON-TABLE ?auto_148305 ) ( not ( = ?auto_148305 ?auto_148306 ) ) ( not ( = ?auto_148305 ?auto_148307 ) ) ( not ( = ?auto_148305 ?auto_148308 ) ) ( not ( = ?auto_148305 ?auto_148309 ) ) ( not ( = ?auto_148305 ?auto_148310 ) ) ( not ( = ?auto_148305 ?auto_148311 ) ) ( not ( = ?auto_148306 ?auto_148307 ) ) ( not ( = ?auto_148306 ?auto_148308 ) ) ( not ( = ?auto_148306 ?auto_148309 ) ) ( not ( = ?auto_148306 ?auto_148310 ) ) ( not ( = ?auto_148306 ?auto_148311 ) ) ( not ( = ?auto_148307 ?auto_148308 ) ) ( not ( = ?auto_148307 ?auto_148309 ) ) ( not ( = ?auto_148307 ?auto_148310 ) ) ( not ( = ?auto_148307 ?auto_148311 ) ) ( not ( = ?auto_148308 ?auto_148309 ) ) ( not ( = ?auto_148308 ?auto_148310 ) ) ( not ( = ?auto_148308 ?auto_148311 ) ) ( not ( = ?auto_148309 ?auto_148310 ) ) ( not ( = ?auto_148309 ?auto_148311 ) ) ( not ( = ?auto_148310 ?auto_148311 ) ) ( ON ?auto_148309 ?auto_148310 ) ( ON ?auto_148308 ?auto_148309 ) ( ON ?auto_148307 ?auto_148308 ) ( CLEAR ?auto_148305 ) ( ON ?auto_148306 ?auto_148307 ) ( CLEAR ?auto_148306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148305 ?auto_148306 )
      ( MAKE-6PILE ?auto_148305 ?auto_148306 ?auto_148307 ?auto_148308 ?auto_148309 ?auto_148310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148318 - BLOCK
      ?auto_148319 - BLOCK
      ?auto_148320 - BLOCK
      ?auto_148321 - BLOCK
      ?auto_148322 - BLOCK
      ?auto_148323 - BLOCK
    )
    :vars
    (
      ?auto_148324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148323 ?auto_148324 ) ( not ( = ?auto_148318 ?auto_148319 ) ) ( not ( = ?auto_148318 ?auto_148320 ) ) ( not ( = ?auto_148318 ?auto_148321 ) ) ( not ( = ?auto_148318 ?auto_148322 ) ) ( not ( = ?auto_148318 ?auto_148323 ) ) ( not ( = ?auto_148318 ?auto_148324 ) ) ( not ( = ?auto_148319 ?auto_148320 ) ) ( not ( = ?auto_148319 ?auto_148321 ) ) ( not ( = ?auto_148319 ?auto_148322 ) ) ( not ( = ?auto_148319 ?auto_148323 ) ) ( not ( = ?auto_148319 ?auto_148324 ) ) ( not ( = ?auto_148320 ?auto_148321 ) ) ( not ( = ?auto_148320 ?auto_148322 ) ) ( not ( = ?auto_148320 ?auto_148323 ) ) ( not ( = ?auto_148320 ?auto_148324 ) ) ( not ( = ?auto_148321 ?auto_148322 ) ) ( not ( = ?auto_148321 ?auto_148323 ) ) ( not ( = ?auto_148321 ?auto_148324 ) ) ( not ( = ?auto_148322 ?auto_148323 ) ) ( not ( = ?auto_148322 ?auto_148324 ) ) ( not ( = ?auto_148323 ?auto_148324 ) ) ( ON ?auto_148322 ?auto_148323 ) ( ON ?auto_148321 ?auto_148322 ) ( ON ?auto_148320 ?auto_148321 ) ( ON ?auto_148319 ?auto_148320 ) ( ON ?auto_148318 ?auto_148319 ) ( CLEAR ?auto_148318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148318 )
      ( MAKE-6PILE ?auto_148318 ?auto_148319 ?auto_148320 ?auto_148321 ?auto_148322 ?auto_148323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_148331 - BLOCK
      ?auto_148332 - BLOCK
      ?auto_148333 - BLOCK
      ?auto_148334 - BLOCK
      ?auto_148335 - BLOCK
      ?auto_148336 - BLOCK
    )
    :vars
    (
      ?auto_148337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148336 ?auto_148337 ) ( not ( = ?auto_148331 ?auto_148332 ) ) ( not ( = ?auto_148331 ?auto_148333 ) ) ( not ( = ?auto_148331 ?auto_148334 ) ) ( not ( = ?auto_148331 ?auto_148335 ) ) ( not ( = ?auto_148331 ?auto_148336 ) ) ( not ( = ?auto_148331 ?auto_148337 ) ) ( not ( = ?auto_148332 ?auto_148333 ) ) ( not ( = ?auto_148332 ?auto_148334 ) ) ( not ( = ?auto_148332 ?auto_148335 ) ) ( not ( = ?auto_148332 ?auto_148336 ) ) ( not ( = ?auto_148332 ?auto_148337 ) ) ( not ( = ?auto_148333 ?auto_148334 ) ) ( not ( = ?auto_148333 ?auto_148335 ) ) ( not ( = ?auto_148333 ?auto_148336 ) ) ( not ( = ?auto_148333 ?auto_148337 ) ) ( not ( = ?auto_148334 ?auto_148335 ) ) ( not ( = ?auto_148334 ?auto_148336 ) ) ( not ( = ?auto_148334 ?auto_148337 ) ) ( not ( = ?auto_148335 ?auto_148336 ) ) ( not ( = ?auto_148335 ?auto_148337 ) ) ( not ( = ?auto_148336 ?auto_148337 ) ) ( ON ?auto_148335 ?auto_148336 ) ( ON ?auto_148334 ?auto_148335 ) ( ON ?auto_148333 ?auto_148334 ) ( ON ?auto_148332 ?auto_148333 ) ( ON ?auto_148331 ?auto_148332 ) ( CLEAR ?auto_148331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148331 )
      ( MAKE-6PILE ?auto_148331 ?auto_148332 ?auto_148333 ?auto_148334 ?auto_148335 ?auto_148336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148345 - BLOCK
      ?auto_148346 - BLOCK
      ?auto_148347 - BLOCK
      ?auto_148348 - BLOCK
      ?auto_148349 - BLOCK
      ?auto_148350 - BLOCK
      ?auto_148351 - BLOCK
    )
    :vars
    (
      ?auto_148352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148350 ) ( ON ?auto_148351 ?auto_148352 ) ( CLEAR ?auto_148351 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148345 ) ( ON ?auto_148346 ?auto_148345 ) ( ON ?auto_148347 ?auto_148346 ) ( ON ?auto_148348 ?auto_148347 ) ( ON ?auto_148349 ?auto_148348 ) ( ON ?auto_148350 ?auto_148349 ) ( not ( = ?auto_148345 ?auto_148346 ) ) ( not ( = ?auto_148345 ?auto_148347 ) ) ( not ( = ?auto_148345 ?auto_148348 ) ) ( not ( = ?auto_148345 ?auto_148349 ) ) ( not ( = ?auto_148345 ?auto_148350 ) ) ( not ( = ?auto_148345 ?auto_148351 ) ) ( not ( = ?auto_148345 ?auto_148352 ) ) ( not ( = ?auto_148346 ?auto_148347 ) ) ( not ( = ?auto_148346 ?auto_148348 ) ) ( not ( = ?auto_148346 ?auto_148349 ) ) ( not ( = ?auto_148346 ?auto_148350 ) ) ( not ( = ?auto_148346 ?auto_148351 ) ) ( not ( = ?auto_148346 ?auto_148352 ) ) ( not ( = ?auto_148347 ?auto_148348 ) ) ( not ( = ?auto_148347 ?auto_148349 ) ) ( not ( = ?auto_148347 ?auto_148350 ) ) ( not ( = ?auto_148347 ?auto_148351 ) ) ( not ( = ?auto_148347 ?auto_148352 ) ) ( not ( = ?auto_148348 ?auto_148349 ) ) ( not ( = ?auto_148348 ?auto_148350 ) ) ( not ( = ?auto_148348 ?auto_148351 ) ) ( not ( = ?auto_148348 ?auto_148352 ) ) ( not ( = ?auto_148349 ?auto_148350 ) ) ( not ( = ?auto_148349 ?auto_148351 ) ) ( not ( = ?auto_148349 ?auto_148352 ) ) ( not ( = ?auto_148350 ?auto_148351 ) ) ( not ( = ?auto_148350 ?auto_148352 ) ) ( not ( = ?auto_148351 ?auto_148352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148351 ?auto_148352 )
      ( !STACK ?auto_148351 ?auto_148350 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148360 - BLOCK
      ?auto_148361 - BLOCK
      ?auto_148362 - BLOCK
      ?auto_148363 - BLOCK
      ?auto_148364 - BLOCK
      ?auto_148365 - BLOCK
      ?auto_148366 - BLOCK
    )
    :vars
    (
      ?auto_148367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148365 ) ( ON ?auto_148366 ?auto_148367 ) ( CLEAR ?auto_148366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148360 ) ( ON ?auto_148361 ?auto_148360 ) ( ON ?auto_148362 ?auto_148361 ) ( ON ?auto_148363 ?auto_148362 ) ( ON ?auto_148364 ?auto_148363 ) ( ON ?auto_148365 ?auto_148364 ) ( not ( = ?auto_148360 ?auto_148361 ) ) ( not ( = ?auto_148360 ?auto_148362 ) ) ( not ( = ?auto_148360 ?auto_148363 ) ) ( not ( = ?auto_148360 ?auto_148364 ) ) ( not ( = ?auto_148360 ?auto_148365 ) ) ( not ( = ?auto_148360 ?auto_148366 ) ) ( not ( = ?auto_148360 ?auto_148367 ) ) ( not ( = ?auto_148361 ?auto_148362 ) ) ( not ( = ?auto_148361 ?auto_148363 ) ) ( not ( = ?auto_148361 ?auto_148364 ) ) ( not ( = ?auto_148361 ?auto_148365 ) ) ( not ( = ?auto_148361 ?auto_148366 ) ) ( not ( = ?auto_148361 ?auto_148367 ) ) ( not ( = ?auto_148362 ?auto_148363 ) ) ( not ( = ?auto_148362 ?auto_148364 ) ) ( not ( = ?auto_148362 ?auto_148365 ) ) ( not ( = ?auto_148362 ?auto_148366 ) ) ( not ( = ?auto_148362 ?auto_148367 ) ) ( not ( = ?auto_148363 ?auto_148364 ) ) ( not ( = ?auto_148363 ?auto_148365 ) ) ( not ( = ?auto_148363 ?auto_148366 ) ) ( not ( = ?auto_148363 ?auto_148367 ) ) ( not ( = ?auto_148364 ?auto_148365 ) ) ( not ( = ?auto_148364 ?auto_148366 ) ) ( not ( = ?auto_148364 ?auto_148367 ) ) ( not ( = ?auto_148365 ?auto_148366 ) ) ( not ( = ?auto_148365 ?auto_148367 ) ) ( not ( = ?auto_148366 ?auto_148367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148366 ?auto_148367 )
      ( !STACK ?auto_148366 ?auto_148365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148375 - BLOCK
      ?auto_148376 - BLOCK
      ?auto_148377 - BLOCK
      ?auto_148378 - BLOCK
      ?auto_148379 - BLOCK
      ?auto_148380 - BLOCK
      ?auto_148381 - BLOCK
    )
    :vars
    (
      ?auto_148382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148381 ?auto_148382 ) ( ON-TABLE ?auto_148375 ) ( ON ?auto_148376 ?auto_148375 ) ( ON ?auto_148377 ?auto_148376 ) ( ON ?auto_148378 ?auto_148377 ) ( ON ?auto_148379 ?auto_148378 ) ( not ( = ?auto_148375 ?auto_148376 ) ) ( not ( = ?auto_148375 ?auto_148377 ) ) ( not ( = ?auto_148375 ?auto_148378 ) ) ( not ( = ?auto_148375 ?auto_148379 ) ) ( not ( = ?auto_148375 ?auto_148380 ) ) ( not ( = ?auto_148375 ?auto_148381 ) ) ( not ( = ?auto_148375 ?auto_148382 ) ) ( not ( = ?auto_148376 ?auto_148377 ) ) ( not ( = ?auto_148376 ?auto_148378 ) ) ( not ( = ?auto_148376 ?auto_148379 ) ) ( not ( = ?auto_148376 ?auto_148380 ) ) ( not ( = ?auto_148376 ?auto_148381 ) ) ( not ( = ?auto_148376 ?auto_148382 ) ) ( not ( = ?auto_148377 ?auto_148378 ) ) ( not ( = ?auto_148377 ?auto_148379 ) ) ( not ( = ?auto_148377 ?auto_148380 ) ) ( not ( = ?auto_148377 ?auto_148381 ) ) ( not ( = ?auto_148377 ?auto_148382 ) ) ( not ( = ?auto_148378 ?auto_148379 ) ) ( not ( = ?auto_148378 ?auto_148380 ) ) ( not ( = ?auto_148378 ?auto_148381 ) ) ( not ( = ?auto_148378 ?auto_148382 ) ) ( not ( = ?auto_148379 ?auto_148380 ) ) ( not ( = ?auto_148379 ?auto_148381 ) ) ( not ( = ?auto_148379 ?auto_148382 ) ) ( not ( = ?auto_148380 ?auto_148381 ) ) ( not ( = ?auto_148380 ?auto_148382 ) ) ( not ( = ?auto_148381 ?auto_148382 ) ) ( CLEAR ?auto_148379 ) ( ON ?auto_148380 ?auto_148381 ) ( CLEAR ?auto_148380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148375 ?auto_148376 ?auto_148377 ?auto_148378 ?auto_148379 ?auto_148380 )
      ( MAKE-7PILE ?auto_148375 ?auto_148376 ?auto_148377 ?auto_148378 ?auto_148379 ?auto_148380 ?auto_148381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148390 - BLOCK
      ?auto_148391 - BLOCK
      ?auto_148392 - BLOCK
      ?auto_148393 - BLOCK
      ?auto_148394 - BLOCK
      ?auto_148395 - BLOCK
      ?auto_148396 - BLOCK
    )
    :vars
    (
      ?auto_148397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148396 ?auto_148397 ) ( ON-TABLE ?auto_148390 ) ( ON ?auto_148391 ?auto_148390 ) ( ON ?auto_148392 ?auto_148391 ) ( ON ?auto_148393 ?auto_148392 ) ( ON ?auto_148394 ?auto_148393 ) ( not ( = ?auto_148390 ?auto_148391 ) ) ( not ( = ?auto_148390 ?auto_148392 ) ) ( not ( = ?auto_148390 ?auto_148393 ) ) ( not ( = ?auto_148390 ?auto_148394 ) ) ( not ( = ?auto_148390 ?auto_148395 ) ) ( not ( = ?auto_148390 ?auto_148396 ) ) ( not ( = ?auto_148390 ?auto_148397 ) ) ( not ( = ?auto_148391 ?auto_148392 ) ) ( not ( = ?auto_148391 ?auto_148393 ) ) ( not ( = ?auto_148391 ?auto_148394 ) ) ( not ( = ?auto_148391 ?auto_148395 ) ) ( not ( = ?auto_148391 ?auto_148396 ) ) ( not ( = ?auto_148391 ?auto_148397 ) ) ( not ( = ?auto_148392 ?auto_148393 ) ) ( not ( = ?auto_148392 ?auto_148394 ) ) ( not ( = ?auto_148392 ?auto_148395 ) ) ( not ( = ?auto_148392 ?auto_148396 ) ) ( not ( = ?auto_148392 ?auto_148397 ) ) ( not ( = ?auto_148393 ?auto_148394 ) ) ( not ( = ?auto_148393 ?auto_148395 ) ) ( not ( = ?auto_148393 ?auto_148396 ) ) ( not ( = ?auto_148393 ?auto_148397 ) ) ( not ( = ?auto_148394 ?auto_148395 ) ) ( not ( = ?auto_148394 ?auto_148396 ) ) ( not ( = ?auto_148394 ?auto_148397 ) ) ( not ( = ?auto_148395 ?auto_148396 ) ) ( not ( = ?auto_148395 ?auto_148397 ) ) ( not ( = ?auto_148396 ?auto_148397 ) ) ( CLEAR ?auto_148394 ) ( ON ?auto_148395 ?auto_148396 ) ( CLEAR ?auto_148395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148390 ?auto_148391 ?auto_148392 ?auto_148393 ?auto_148394 ?auto_148395 )
      ( MAKE-7PILE ?auto_148390 ?auto_148391 ?auto_148392 ?auto_148393 ?auto_148394 ?auto_148395 ?auto_148396 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148405 - BLOCK
      ?auto_148406 - BLOCK
      ?auto_148407 - BLOCK
      ?auto_148408 - BLOCK
      ?auto_148409 - BLOCK
      ?auto_148410 - BLOCK
      ?auto_148411 - BLOCK
    )
    :vars
    (
      ?auto_148412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148411 ?auto_148412 ) ( ON-TABLE ?auto_148405 ) ( ON ?auto_148406 ?auto_148405 ) ( ON ?auto_148407 ?auto_148406 ) ( ON ?auto_148408 ?auto_148407 ) ( not ( = ?auto_148405 ?auto_148406 ) ) ( not ( = ?auto_148405 ?auto_148407 ) ) ( not ( = ?auto_148405 ?auto_148408 ) ) ( not ( = ?auto_148405 ?auto_148409 ) ) ( not ( = ?auto_148405 ?auto_148410 ) ) ( not ( = ?auto_148405 ?auto_148411 ) ) ( not ( = ?auto_148405 ?auto_148412 ) ) ( not ( = ?auto_148406 ?auto_148407 ) ) ( not ( = ?auto_148406 ?auto_148408 ) ) ( not ( = ?auto_148406 ?auto_148409 ) ) ( not ( = ?auto_148406 ?auto_148410 ) ) ( not ( = ?auto_148406 ?auto_148411 ) ) ( not ( = ?auto_148406 ?auto_148412 ) ) ( not ( = ?auto_148407 ?auto_148408 ) ) ( not ( = ?auto_148407 ?auto_148409 ) ) ( not ( = ?auto_148407 ?auto_148410 ) ) ( not ( = ?auto_148407 ?auto_148411 ) ) ( not ( = ?auto_148407 ?auto_148412 ) ) ( not ( = ?auto_148408 ?auto_148409 ) ) ( not ( = ?auto_148408 ?auto_148410 ) ) ( not ( = ?auto_148408 ?auto_148411 ) ) ( not ( = ?auto_148408 ?auto_148412 ) ) ( not ( = ?auto_148409 ?auto_148410 ) ) ( not ( = ?auto_148409 ?auto_148411 ) ) ( not ( = ?auto_148409 ?auto_148412 ) ) ( not ( = ?auto_148410 ?auto_148411 ) ) ( not ( = ?auto_148410 ?auto_148412 ) ) ( not ( = ?auto_148411 ?auto_148412 ) ) ( ON ?auto_148410 ?auto_148411 ) ( CLEAR ?auto_148408 ) ( ON ?auto_148409 ?auto_148410 ) ( CLEAR ?auto_148409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148405 ?auto_148406 ?auto_148407 ?auto_148408 ?auto_148409 )
      ( MAKE-7PILE ?auto_148405 ?auto_148406 ?auto_148407 ?auto_148408 ?auto_148409 ?auto_148410 ?auto_148411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148420 - BLOCK
      ?auto_148421 - BLOCK
      ?auto_148422 - BLOCK
      ?auto_148423 - BLOCK
      ?auto_148424 - BLOCK
      ?auto_148425 - BLOCK
      ?auto_148426 - BLOCK
    )
    :vars
    (
      ?auto_148427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148426 ?auto_148427 ) ( ON-TABLE ?auto_148420 ) ( ON ?auto_148421 ?auto_148420 ) ( ON ?auto_148422 ?auto_148421 ) ( ON ?auto_148423 ?auto_148422 ) ( not ( = ?auto_148420 ?auto_148421 ) ) ( not ( = ?auto_148420 ?auto_148422 ) ) ( not ( = ?auto_148420 ?auto_148423 ) ) ( not ( = ?auto_148420 ?auto_148424 ) ) ( not ( = ?auto_148420 ?auto_148425 ) ) ( not ( = ?auto_148420 ?auto_148426 ) ) ( not ( = ?auto_148420 ?auto_148427 ) ) ( not ( = ?auto_148421 ?auto_148422 ) ) ( not ( = ?auto_148421 ?auto_148423 ) ) ( not ( = ?auto_148421 ?auto_148424 ) ) ( not ( = ?auto_148421 ?auto_148425 ) ) ( not ( = ?auto_148421 ?auto_148426 ) ) ( not ( = ?auto_148421 ?auto_148427 ) ) ( not ( = ?auto_148422 ?auto_148423 ) ) ( not ( = ?auto_148422 ?auto_148424 ) ) ( not ( = ?auto_148422 ?auto_148425 ) ) ( not ( = ?auto_148422 ?auto_148426 ) ) ( not ( = ?auto_148422 ?auto_148427 ) ) ( not ( = ?auto_148423 ?auto_148424 ) ) ( not ( = ?auto_148423 ?auto_148425 ) ) ( not ( = ?auto_148423 ?auto_148426 ) ) ( not ( = ?auto_148423 ?auto_148427 ) ) ( not ( = ?auto_148424 ?auto_148425 ) ) ( not ( = ?auto_148424 ?auto_148426 ) ) ( not ( = ?auto_148424 ?auto_148427 ) ) ( not ( = ?auto_148425 ?auto_148426 ) ) ( not ( = ?auto_148425 ?auto_148427 ) ) ( not ( = ?auto_148426 ?auto_148427 ) ) ( ON ?auto_148425 ?auto_148426 ) ( CLEAR ?auto_148423 ) ( ON ?auto_148424 ?auto_148425 ) ( CLEAR ?auto_148424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148420 ?auto_148421 ?auto_148422 ?auto_148423 ?auto_148424 )
      ( MAKE-7PILE ?auto_148420 ?auto_148421 ?auto_148422 ?auto_148423 ?auto_148424 ?auto_148425 ?auto_148426 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148435 - BLOCK
      ?auto_148436 - BLOCK
      ?auto_148437 - BLOCK
      ?auto_148438 - BLOCK
      ?auto_148439 - BLOCK
      ?auto_148440 - BLOCK
      ?auto_148441 - BLOCK
    )
    :vars
    (
      ?auto_148442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148441 ?auto_148442 ) ( ON-TABLE ?auto_148435 ) ( ON ?auto_148436 ?auto_148435 ) ( ON ?auto_148437 ?auto_148436 ) ( not ( = ?auto_148435 ?auto_148436 ) ) ( not ( = ?auto_148435 ?auto_148437 ) ) ( not ( = ?auto_148435 ?auto_148438 ) ) ( not ( = ?auto_148435 ?auto_148439 ) ) ( not ( = ?auto_148435 ?auto_148440 ) ) ( not ( = ?auto_148435 ?auto_148441 ) ) ( not ( = ?auto_148435 ?auto_148442 ) ) ( not ( = ?auto_148436 ?auto_148437 ) ) ( not ( = ?auto_148436 ?auto_148438 ) ) ( not ( = ?auto_148436 ?auto_148439 ) ) ( not ( = ?auto_148436 ?auto_148440 ) ) ( not ( = ?auto_148436 ?auto_148441 ) ) ( not ( = ?auto_148436 ?auto_148442 ) ) ( not ( = ?auto_148437 ?auto_148438 ) ) ( not ( = ?auto_148437 ?auto_148439 ) ) ( not ( = ?auto_148437 ?auto_148440 ) ) ( not ( = ?auto_148437 ?auto_148441 ) ) ( not ( = ?auto_148437 ?auto_148442 ) ) ( not ( = ?auto_148438 ?auto_148439 ) ) ( not ( = ?auto_148438 ?auto_148440 ) ) ( not ( = ?auto_148438 ?auto_148441 ) ) ( not ( = ?auto_148438 ?auto_148442 ) ) ( not ( = ?auto_148439 ?auto_148440 ) ) ( not ( = ?auto_148439 ?auto_148441 ) ) ( not ( = ?auto_148439 ?auto_148442 ) ) ( not ( = ?auto_148440 ?auto_148441 ) ) ( not ( = ?auto_148440 ?auto_148442 ) ) ( not ( = ?auto_148441 ?auto_148442 ) ) ( ON ?auto_148440 ?auto_148441 ) ( ON ?auto_148439 ?auto_148440 ) ( CLEAR ?auto_148437 ) ( ON ?auto_148438 ?auto_148439 ) ( CLEAR ?auto_148438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148435 ?auto_148436 ?auto_148437 ?auto_148438 )
      ( MAKE-7PILE ?auto_148435 ?auto_148436 ?auto_148437 ?auto_148438 ?auto_148439 ?auto_148440 ?auto_148441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148450 - BLOCK
      ?auto_148451 - BLOCK
      ?auto_148452 - BLOCK
      ?auto_148453 - BLOCK
      ?auto_148454 - BLOCK
      ?auto_148455 - BLOCK
      ?auto_148456 - BLOCK
    )
    :vars
    (
      ?auto_148457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148456 ?auto_148457 ) ( ON-TABLE ?auto_148450 ) ( ON ?auto_148451 ?auto_148450 ) ( ON ?auto_148452 ?auto_148451 ) ( not ( = ?auto_148450 ?auto_148451 ) ) ( not ( = ?auto_148450 ?auto_148452 ) ) ( not ( = ?auto_148450 ?auto_148453 ) ) ( not ( = ?auto_148450 ?auto_148454 ) ) ( not ( = ?auto_148450 ?auto_148455 ) ) ( not ( = ?auto_148450 ?auto_148456 ) ) ( not ( = ?auto_148450 ?auto_148457 ) ) ( not ( = ?auto_148451 ?auto_148452 ) ) ( not ( = ?auto_148451 ?auto_148453 ) ) ( not ( = ?auto_148451 ?auto_148454 ) ) ( not ( = ?auto_148451 ?auto_148455 ) ) ( not ( = ?auto_148451 ?auto_148456 ) ) ( not ( = ?auto_148451 ?auto_148457 ) ) ( not ( = ?auto_148452 ?auto_148453 ) ) ( not ( = ?auto_148452 ?auto_148454 ) ) ( not ( = ?auto_148452 ?auto_148455 ) ) ( not ( = ?auto_148452 ?auto_148456 ) ) ( not ( = ?auto_148452 ?auto_148457 ) ) ( not ( = ?auto_148453 ?auto_148454 ) ) ( not ( = ?auto_148453 ?auto_148455 ) ) ( not ( = ?auto_148453 ?auto_148456 ) ) ( not ( = ?auto_148453 ?auto_148457 ) ) ( not ( = ?auto_148454 ?auto_148455 ) ) ( not ( = ?auto_148454 ?auto_148456 ) ) ( not ( = ?auto_148454 ?auto_148457 ) ) ( not ( = ?auto_148455 ?auto_148456 ) ) ( not ( = ?auto_148455 ?auto_148457 ) ) ( not ( = ?auto_148456 ?auto_148457 ) ) ( ON ?auto_148455 ?auto_148456 ) ( ON ?auto_148454 ?auto_148455 ) ( CLEAR ?auto_148452 ) ( ON ?auto_148453 ?auto_148454 ) ( CLEAR ?auto_148453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148450 ?auto_148451 ?auto_148452 ?auto_148453 )
      ( MAKE-7PILE ?auto_148450 ?auto_148451 ?auto_148452 ?auto_148453 ?auto_148454 ?auto_148455 ?auto_148456 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148465 - BLOCK
      ?auto_148466 - BLOCK
      ?auto_148467 - BLOCK
      ?auto_148468 - BLOCK
      ?auto_148469 - BLOCK
      ?auto_148470 - BLOCK
      ?auto_148471 - BLOCK
    )
    :vars
    (
      ?auto_148472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148471 ?auto_148472 ) ( ON-TABLE ?auto_148465 ) ( ON ?auto_148466 ?auto_148465 ) ( not ( = ?auto_148465 ?auto_148466 ) ) ( not ( = ?auto_148465 ?auto_148467 ) ) ( not ( = ?auto_148465 ?auto_148468 ) ) ( not ( = ?auto_148465 ?auto_148469 ) ) ( not ( = ?auto_148465 ?auto_148470 ) ) ( not ( = ?auto_148465 ?auto_148471 ) ) ( not ( = ?auto_148465 ?auto_148472 ) ) ( not ( = ?auto_148466 ?auto_148467 ) ) ( not ( = ?auto_148466 ?auto_148468 ) ) ( not ( = ?auto_148466 ?auto_148469 ) ) ( not ( = ?auto_148466 ?auto_148470 ) ) ( not ( = ?auto_148466 ?auto_148471 ) ) ( not ( = ?auto_148466 ?auto_148472 ) ) ( not ( = ?auto_148467 ?auto_148468 ) ) ( not ( = ?auto_148467 ?auto_148469 ) ) ( not ( = ?auto_148467 ?auto_148470 ) ) ( not ( = ?auto_148467 ?auto_148471 ) ) ( not ( = ?auto_148467 ?auto_148472 ) ) ( not ( = ?auto_148468 ?auto_148469 ) ) ( not ( = ?auto_148468 ?auto_148470 ) ) ( not ( = ?auto_148468 ?auto_148471 ) ) ( not ( = ?auto_148468 ?auto_148472 ) ) ( not ( = ?auto_148469 ?auto_148470 ) ) ( not ( = ?auto_148469 ?auto_148471 ) ) ( not ( = ?auto_148469 ?auto_148472 ) ) ( not ( = ?auto_148470 ?auto_148471 ) ) ( not ( = ?auto_148470 ?auto_148472 ) ) ( not ( = ?auto_148471 ?auto_148472 ) ) ( ON ?auto_148470 ?auto_148471 ) ( ON ?auto_148469 ?auto_148470 ) ( ON ?auto_148468 ?auto_148469 ) ( CLEAR ?auto_148466 ) ( ON ?auto_148467 ?auto_148468 ) ( CLEAR ?auto_148467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148465 ?auto_148466 ?auto_148467 )
      ( MAKE-7PILE ?auto_148465 ?auto_148466 ?auto_148467 ?auto_148468 ?auto_148469 ?auto_148470 ?auto_148471 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148480 - BLOCK
      ?auto_148481 - BLOCK
      ?auto_148482 - BLOCK
      ?auto_148483 - BLOCK
      ?auto_148484 - BLOCK
      ?auto_148485 - BLOCK
      ?auto_148486 - BLOCK
    )
    :vars
    (
      ?auto_148487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148486 ?auto_148487 ) ( ON-TABLE ?auto_148480 ) ( ON ?auto_148481 ?auto_148480 ) ( not ( = ?auto_148480 ?auto_148481 ) ) ( not ( = ?auto_148480 ?auto_148482 ) ) ( not ( = ?auto_148480 ?auto_148483 ) ) ( not ( = ?auto_148480 ?auto_148484 ) ) ( not ( = ?auto_148480 ?auto_148485 ) ) ( not ( = ?auto_148480 ?auto_148486 ) ) ( not ( = ?auto_148480 ?auto_148487 ) ) ( not ( = ?auto_148481 ?auto_148482 ) ) ( not ( = ?auto_148481 ?auto_148483 ) ) ( not ( = ?auto_148481 ?auto_148484 ) ) ( not ( = ?auto_148481 ?auto_148485 ) ) ( not ( = ?auto_148481 ?auto_148486 ) ) ( not ( = ?auto_148481 ?auto_148487 ) ) ( not ( = ?auto_148482 ?auto_148483 ) ) ( not ( = ?auto_148482 ?auto_148484 ) ) ( not ( = ?auto_148482 ?auto_148485 ) ) ( not ( = ?auto_148482 ?auto_148486 ) ) ( not ( = ?auto_148482 ?auto_148487 ) ) ( not ( = ?auto_148483 ?auto_148484 ) ) ( not ( = ?auto_148483 ?auto_148485 ) ) ( not ( = ?auto_148483 ?auto_148486 ) ) ( not ( = ?auto_148483 ?auto_148487 ) ) ( not ( = ?auto_148484 ?auto_148485 ) ) ( not ( = ?auto_148484 ?auto_148486 ) ) ( not ( = ?auto_148484 ?auto_148487 ) ) ( not ( = ?auto_148485 ?auto_148486 ) ) ( not ( = ?auto_148485 ?auto_148487 ) ) ( not ( = ?auto_148486 ?auto_148487 ) ) ( ON ?auto_148485 ?auto_148486 ) ( ON ?auto_148484 ?auto_148485 ) ( ON ?auto_148483 ?auto_148484 ) ( CLEAR ?auto_148481 ) ( ON ?auto_148482 ?auto_148483 ) ( CLEAR ?auto_148482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148480 ?auto_148481 ?auto_148482 )
      ( MAKE-7PILE ?auto_148480 ?auto_148481 ?auto_148482 ?auto_148483 ?auto_148484 ?auto_148485 ?auto_148486 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148495 - BLOCK
      ?auto_148496 - BLOCK
      ?auto_148497 - BLOCK
      ?auto_148498 - BLOCK
      ?auto_148499 - BLOCK
      ?auto_148500 - BLOCK
      ?auto_148501 - BLOCK
    )
    :vars
    (
      ?auto_148502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148501 ?auto_148502 ) ( ON-TABLE ?auto_148495 ) ( not ( = ?auto_148495 ?auto_148496 ) ) ( not ( = ?auto_148495 ?auto_148497 ) ) ( not ( = ?auto_148495 ?auto_148498 ) ) ( not ( = ?auto_148495 ?auto_148499 ) ) ( not ( = ?auto_148495 ?auto_148500 ) ) ( not ( = ?auto_148495 ?auto_148501 ) ) ( not ( = ?auto_148495 ?auto_148502 ) ) ( not ( = ?auto_148496 ?auto_148497 ) ) ( not ( = ?auto_148496 ?auto_148498 ) ) ( not ( = ?auto_148496 ?auto_148499 ) ) ( not ( = ?auto_148496 ?auto_148500 ) ) ( not ( = ?auto_148496 ?auto_148501 ) ) ( not ( = ?auto_148496 ?auto_148502 ) ) ( not ( = ?auto_148497 ?auto_148498 ) ) ( not ( = ?auto_148497 ?auto_148499 ) ) ( not ( = ?auto_148497 ?auto_148500 ) ) ( not ( = ?auto_148497 ?auto_148501 ) ) ( not ( = ?auto_148497 ?auto_148502 ) ) ( not ( = ?auto_148498 ?auto_148499 ) ) ( not ( = ?auto_148498 ?auto_148500 ) ) ( not ( = ?auto_148498 ?auto_148501 ) ) ( not ( = ?auto_148498 ?auto_148502 ) ) ( not ( = ?auto_148499 ?auto_148500 ) ) ( not ( = ?auto_148499 ?auto_148501 ) ) ( not ( = ?auto_148499 ?auto_148502 ) ) ( not ( = ?auto_148500 ?auto_148501 ) ) ( not ( = ?auto_148500 ?auto_148502 ) ) ( not ( = ?auto_148501 ?auto_148502 ) ) ( ON ?auto_148500 ?auto_148501 ) ( ON ?auto_148499 ?auto_148500 ) ( ON ?auto_148498 ?auto_148499 ) ( ON ?auto_148497 ?auto_148498 ) ( CLEAR ?auto_148495 ) ( ON ?auto_148496 ?auto_148497 ) ( CLEAR ?auto_148496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148495 ?auto_148496 )
      ( MAKE-7PILE ?auto_148495 ?auto_148496 ?auto_148497 ?auto_148498 ?auto_148499 ?auto_148500 ?auto_148501 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148510 - BLOCK
      ?auto_148511 - BLOCK
      ?auto_148512 - BLOCK
      ?auto_148513 - BLOCK
      ?auto_148514 - BLOCK
      ?auto_148515 - BLOCK
      ?auto_148516 - BLOCK
    )
    :vars
    (
      ?auto_148517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148516 ?auto_148517 ) ( ON-TABLE ?auto_148510 ) ( not ( = ?auto_148510 ?auto_148511 ) ) ( not ( = ?auto_148510 ?auto_148512 ) ) ( not ( = ?auto_148510 ?auto_148513 ) ) ( not ( = ?auto_148510 ?auto_148514 ) ) ( not ( = ?auto_148510 ?auto_148515 ) ) ( not ( = ?auto_148510 ?auto_148516 ) ) ( not ( = ?auto_148510 ?auto_148517 ) ) ( not ( = ?auto_148511 ?auto_148512 ) ) ( not ( = ?auto_148511 ?auto_148513 ) ) ( not ( = ?auto_148511 ?auto_148514 ) ) ( not ( = ?auto_148511 ?auto_148515 ) ) ( not ( = ?auto_148511 ?auto_148516 ) ) ( not ( = ?auto_148511 ?auto_148517 ) ) ( not ( = ?auto_148512 ?auto_148513 ) ) ( not ( = ?auto_148512 ?auto_148514 ) ) ( not ( = ?auto_148512 ?auto_148515 ) ) ( not ( = ?auto_148512 ?auto_148516 ) ) ( not ( = ?auto_148512 ?auto_148517 ) ) ( not ( = ?auto_148513 ?auto_148514 ) ) ( not ( = ?auto_148513 ?auto_148515 ) ) ( not ( = ?auto_148513 ?auto_148516 ) ) ( not ( = ?auto_148513 ?auto_148517 ) ) ( not ( = ?auto_148514 ?auto_148515 ) ) ( not ( = ?auto_148514 ?auto_148516 ) ) ( not ( = ?auto_148514 ?auto_148517 ) ) ( not ( = ?auto_148515 ?auto_148516 ) ) ( not ( = ?auto_148515 ?auto_148517 ) ) ( not ( = ?auto_148516 ?auto_148517 ) ) ( ON ?auto_148515 ?auto_148516 ) ( ON ?auto_148514 ?auto_148515 ) ( ON ?auto_148513 ?auto_148514 ) ( ON ?auto_148512 ?auto_148513 ) ( CLEAR ?auto_148510 ) ( ON ?auto_148511 ?auto_148512 ) ( CLEAR ?auto_148511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148510 ?auto_148511 )
      ( MAKE-7PILE ?auto_148510 ?auto_148511 ?auto_148512 ?auto_148513 ?auto_148514 ?auto_148515 ?auto_148516 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148525 - BLOCK
      ?auto_148526 - BLOCK
      ?auto_148527 - BLOCK
      ?auto_148528 - BLOCK
      ?auto_148529 - BLOCK
      ?auto_148530 - BLOCK
      ?auto_148531 - BLOCK
    )
    :vars
    (
      ?auto_148532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148531 ?auto_148532 ) ( not ( = ?auto_148525 ?auto_148526 ) ) ( not ( = ?auto_148525 ?auto_148527 ) ) ( not ( = ?auto_148525 ?auto_148528 ) ) ( not ( = ?auto_148525 ?auto_148529 ) ) ( not ( = ?auto_148525 ?auto_148530 ) ) ( not ( = ?auto_148525 ?auto_148531 ) ) ( not ( = ?auto_148525 ?auto_148532 ) ) ( not ( = ?auto_148526 ?auto_148527 ) ) ( not ( = ?auto_148526 ?auto_148528 ) ) ( not ( = ?auto_148526 ?auto_148529 ) ) ( not ( = ?auto_148526 ?auto_148530 ) ) ( not ( = ?auto_148526 ?auto_148531 ) ) ( not ( = ?auto_148526 ?auto_148532 ) ) ( not ( = ?auto_148527 ?auto_148528 ) ) ( not ( = ?auto_148527 ?auto_148529 ) ) ( not ( = ?auto_148527 ?auto_148530 ) ) ( not ( = ?auto_148527 ?auto_148531 ) ) ( not ( = ?auto_148527 ?auto_148532 ) ) ( not ( = ?auto_148528 ?auto_148529 ) ) ( not ( = ?auto_148528 ?auto_148530 ) ) ( not ( = ?auto_148528 ?auto_148531 ) ) ( not ( = ?auto_148528 ?auto_148532 ) ) ( not ( = ?auto_148529 ?auto_148530 ) ) ( not ( = ?auto_148529 ?auto_148531 ) ) ( not ( = ?auto_148529 ?auto_148532 ) ) ( not ( = ?auto_148530 ?auto_148531 ) ) ( not ( = ?auto_148530 ?auto_148532 ) ) ( not ( = ?auto_148531 ?auto_148532 ) ) ( ON ?auto_148530 ?auto_148531 ) ( ON ?auto_148529 ?auto_148530 ) ( ON ?auto_148528 ?auto_148529 ) ( ON ?auto_148527 ?auto_148528 ) ( ON ?auto_148526 ?auto_148527 ) ( ON ?auto_148525 ?auto_148526 ) ( CLEAR ?auto_148525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148525 )
      ( MAKE-7PILE ?auto_148525 ?auto_148526 ?auto_148527 ?auto_148528 ?auto_148529 ?auto_148530 ?auto_148531 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_148540 - BLOCK
      ?auto_148541 - BLOCK
      ?auto_148542 - BLOCK
      ?auto_148543 - BLOCK
      ?auto_148544 - BLOCK
      ?auto_148545 - BLOCK
      ?auto_148546 - BLOCK
    )
    :vars
    (
      ?auto_148547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148546 ?auto_148547 ) ( not ( = ?auto_148540 ?auto_148541 ) ) ( not ( = ?auto_148540 ?auto_148542 ) ) ( not ( = ?auto_148540 ?auto_148543 ) ) ( not ( = ?auto_148540 ?auto_148544 ) ) ( not ( = ?auto_148540 ?auto_148545 ) ) ( not ( = ?auto_148540 ?auto_148546 ) ) ( not ( = ?auto_148540 ?auto_148547 ) ) ( not ( = ?auto_148541 ?auto_148542 ) ) ( not ( = ?auto_148541 ?auto_148543 ) ) ( not ( = ?auto_148541 ?auto_148544 ) ) ( not ( = ?auto_148541 ?auto_148545 ) ) ( not ( = ?auto_148541 ?auto_148546 ) ) ( not ( = ?auto_148541 ?auto_148547 ) ) ( not ( = ?auto_148542 ?auto_148543 ) ) ( not ( = ?auto_148542 ?auto_148544 ) ) ( not ( = ?auto_148542 ?auto_148545 ) ) ( not ( = ?auto_148542 ?auto_148546 ) ) ( not ( = ?auto_148542 ?auto_148547 ) ) ( not ( = ?auto_148543 ?auto_148544 ) ) ( not ( = ?auto_148543 ?auto_148545 ) ) ( not ( = ?auto_148543 ?auto_148546 ) ) ( not ( = ?auto_148543 ?auto_148547 ) ) ( not ( = ?auto_148544 ?auto_148545 ) ) ( not ( = ?auto_148544 ?auto_148546 ) ) ( not ( = ?auto_148544 ?auto_148547 ) ) ( not ( = ?auto_148545 ?auto_148546 ) ) ( not ( = ?auto_148545 ?auto_148547 ) ) ( not ( = ?auto_148546 ?auto_148547 ) ) ( ON ?auto_148545 ?auto_148546 ) ( ON ?auto_148544 ?auto_148545 ) ( ON ?auto_148543 ?auto_148544 ) ( ON ?auto_148542 ?auto_148543 ) ( ON ?auto_148541 ?auto_148542 ) ( ON ?auto_148540 ?auto_148541 ) ( CLEAR ?auto_148540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148540 )
      ( MAKE-7PILE ?auto_148540 ?auto_148541 ?auto_148542 ?auto_148543 ?auto_148544 ?auto_148545 ?auto_148546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148556 - BLOCK
      ?auto_148557 - BLOCK
      ?auto_148558 - BLOCK
      ?auto_148559 - BLOCK
      ?auto_148560 - BLOCK
      ?auto_148561 - BLOCK
      ?auto_148562 - BLOCK
      ?auto_148563 - BLOCK
    )
    :vars
    (
      ?auto_148564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148562 ) ( ON ?auto_148563 ?auto_148564 ) ( CLEAR ?auto_148563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148556 ) ( ON ?auto_148557 ?auto_148556 ) ( ON ?auto_148558 ?auto_148557 ) ( ON ?auto_148559 ?auto_148558 ) ( ON ?auto_148560 ?auto_148559 ) ( ON ?auto_148561 ?auto_148560 ) ( ON ?auto_148562 ?auto_148561 ) ( not ( = ?auto_148556 ?auto_148557 ) ) ( not ( = ?auto_148556 ?auto_148558 ) ) ( not ( = ?auto_148556 ?auto_148559 ) ) ( not ( = ?auto_148556 ?auto_148560 ) ) ( not ( = ?auto_148556 ?auto_148561 ) ) ( not ( = ?auto_148556 ?auto_148562 ) ) ( not ( = ?auto_148556 ?auto_148563 ) ) ( not ( = ?auto_148556 ?auto_148564 ) ) ( not ( = ?auto_148557 ?auto_148558 ) ) ( not ( = ?auto_148557 ?auto_148559 ) ) ( not ( = ?auto_148557 ?auto_148560 ) ) ( not ( = ?auto_148557 ?auto_148561 ) ) ( not ( = ?auto_148557 ?auto_148562 ) ) ( not ( = ?auto_148557 ?auto_148563 ) ) ( not ( = ?auto_148557 ?auto_148564 ) ) ( not ( = ?auto_148558 ?auto_148559 ) ) ( not ( = ?auto_148558 ?auto_148560 ) ) ( not ( = ?auto_148558 ?auto_148561 ) ) ( not ( = ?auto_148558 ?auto_148562 ) ) ( not ( = ?auto_148558 ?auto_148563 ) ) ( not ( = ?auto_148558 ?auto_148564 ) ) ( not ( = ?auto_148559 ?auto_148560 ) ) ( not ( = ?auto_148559 ?auto_148561 ) ) ( not ( = ?auto_148559 ?auto_148562 ) ) ( not ( = ?auto_148559 ?auto_148563 ) ) ( not ( = ?auto_148559 ?auto_148564 ) ) ( not ( = ?auto_148560 ?auto_148561 ) ) ( not ( = ?auto_148560 ?auto_148562 ) ) ( not ( = ?auto_148560 ?auto_148563 ) ) ( not ( = ?auto_148560 ?auto_148564 ) ) ( not ( = ?auto_148561 ?auto_148562 ) ) ( not ( = ?auto_148561 ?auto_148563 ) ) ( not ( = ?auto_148561 ?auto_148564 ) ) ( not ( = ?auto_148562 ?auto_148563 ) ) ( not ( = ?auto_148562 ?auto_148564 ) ) ( not ( = ?auto_148563 ?auto_148564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148563 ?auto_148564 )
      ( !STACK ?auto_148563 ?auto_148562 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148573 - BLOCK
      ?auto_148574 - BLOCK
      ?auto_148575 - BLOCK
      ?auto_148576 - BLOCK
      ?auto_148577 - BLOCK
      ?auto_148578 - BLOCK
      ?auto_148579 - BLOCK
      ?auto_148580 - BLOCK
    )
    :vars
    (
      ?auto_148581 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148579 ) ( ON ?auto_148580 ?auto_148581 ) ( CLEAR ?auto_148580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148573 ) ( ON ?auto_148574 ?auto_148573 ) ( ON ?auto_148575 ?auto_148574 ) ( ON ?auto_148576 ?auto_148575 ) ( ON ?auto_148577 ?auto_148576 ) ( ON ?auto_148578 ?auto_148577 ) ( ON ?auto_148579 ?auto_148578 ) ( not ( = ?auto_148573 ?auto_148574 ) ) ( not ( = ?auto_148573 ?auto_148575 ) ) ( not ( = ?auto_148573 ?auto_148576 ) ) ( not ( = ?auto_148573 ?auto_148577 ) ) ( not ( = ?auto_148573 ?auto_148578 ) ) ( not ( = ?auto_148573 ?auto_148579 ) ) ( not ( = ?auto_148573 ?auto_148580 ) ) ( not ( = ?auto_148573 ?auto_148581 ) ) ( not ( = ?auto_148574 ?auto_148575 ) ) ( not ( = ?auto_148574 ?auto_148576 ) ) ( not ( = ?auto_148574 ?auto_148577 ) ) ( not ( = ?auto_148574 ?auto_148578 ) ) ( not ( = ?auto_148574 ?auto_148579 ) ) ( not ( = ?auto_148574 ?auto_148580 ) ) ( not ( = ?auto_148574 ?auto_148581 ) ) ( not ( = ?auto_148575 ?auto_148576 ) ) ( not ( = ?auto_148575 ?auto_148577 ) ) ( not ( = ?auto_148575 ?auto_148578 ) ) ( not ( = ?auto_148575 ?auto_148579 ) ) ( not ( = ?auto_148575 ?auto_148580 ) ) ( not ( = ?auto_148575 ?auto_148581 ) ) ( not ( = ?auto_148576 ?auto_148577 ) ) ( not ( = ?auto_148576 ?auto_148578 ) ) ( not ( = ?auto_148576 ?auto_148579 ) ) ( not ( = ?auto_148576 ?auto_148580 ) ) ( not ( = ?auto_148576 ?auto_148581 ) ) ( not ( = ?auto_148577 ?auto_148578 ) ) ( not ( = ?auto_148577 ?auto_148579 ) ) ( not ( = ?auto_148577 ?auto_148580 ) ) ( not ( = ?auto_148577 ?auto_148581 ) ) ( not ( = ?auto_148578 ?auto_148579 ) ) ( not ( = ?auto_148578 ?auto_148580 ) ) ( not ( = ?auto_148578 ?auto_148581 ) ) ( not ( = ?auto_148579 ?auto_148580 ) ) ( not ( = ?auto_148579 ?auto_148581 ) ) ( not ( = ?auto_148580 ?auto_148581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148580 ?auto_148581 )
      ( !STACK ?auto_148580 ?auto_148579 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148590 - BLOCK
      ?auto_148591 - BLOCK
      ?auto_148592 - BLOCK
      ?auto_148593 - BLOCK
      ?auto_148594 - BLOCK
      ?auto_148595 - BLOCK
      ?auto_148596 - BLOCK
      ?auto_148597 - BLOCK
    )
    :vars
    (
      ?auto_148598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148597 ?auto_148598 ) ( ON-TABLE ?auto_148590 ) ( ON ?auto_148591 ?auto_148590 ) ( ON ?auto_148592 ?auto_148591 ) ( ON ?auto_148593 ?auto_148592 ) ( ON ?auto_148594 ?auto_148593 ) ( ON ?auto_148595 ?auto_148594 ) ( not ( = ?auto_148590 ?auto_148591 ) ) ( not ( = ?auto_148590 ?auto_148592 ) ) ( not ( = ?auto_148590 ?auto_148593 ) ) ( not ( = ?auto_148590 ?auto_148594 ) ) ( not ( = ?auto_148590 ?auto_148595 ) ) ( not ( = ?auto_148590 ?auto_148596 ) ) ( not ( = ?auto_148590 ?auto_148597 ) ) ( not ( = ?auto_148590 ?auto_148598 ) ) ( not ( = ?auto_148591 ?auto_148592 ) ) ( not ( = ?auto_148591 ?auto_148593 ) ) ( not ( = ?auto_148591 ?auto_148594 ) ) ( not ( = ?auto_148591 ?auto_148595 ) ) ( not ( = ?auto_148591 ?auto_148596 ) ) ( not ( = ?auto_148591 ?auto_148597 ) ) ( not ( = ?auto_148591 ?auto_148598 ) ) ( not ( = ?auto_148592 ?auto_148593 ) ) ( not ( = ?auto_148592 ?auto_148594 ) ) ( not ( = ?auto_148592 ?auto_148595 ) ) ( not ( = ?auto_148592 ?auto_148596 ) ) ( not ( = ?auto_148592 ?auto_148597 ) ) ( not ( = ?auto_148592 ?auto_148598 ) ) ( not ( = ?auto_148593 ?auto_148594 ) ) ( not ( = ?auto_148593 ?auto_148595 ) ) ( not ( = ?auto_148593 ?auto_148596 ) ) ( not ( = ?auto_148593 ?auto_148597 ) ) ( not ( = ?auto_148593 ?auto_148598 ) ) ( not ( = ?auto_148594 ?auto_148595 ) ) ( not ( = ?auto_148594 ?auto_148596 ) ) ( not ( = ?auto_148594 ?auto_148597 ) ) ( not ( = ?auto_148594 ?auto_148598 ) ) ( not ( = ?auto_148595 ?auto_148596 ) ) ( not ( = ?auto_148595 ?auto_148597 ) ) ( not ( = ?auto_148595 ?auto_148598 ) ) ( not ( = ?auto_148596 ?auto_148597 ) ) ( not ( = ?auto_148596 ?auto_148598 ) ) ( not ( = ?auto_148597 ?auto_148598 ) ) ( CLEAR ?auto_148595 ) ( ON ?auto_148596 ?auto_148597 ) ( CLEAR ?auto_148596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148590 ?auto_148591 ?auto_148592 ?auto_148593 ?auto_148594 ?auto_148595 ?auto_148596 )
      ( MAKE-8PILE ?auto_148590 ?auto_148591 ?auto_148592 ?auto_148593 ?auto_148594 ?auto_148595 ?auto_148596 ?auto_148597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148607 - BLOCK
      ?auto_148608 - BLOCK
      ?auto_148609 - BLOCK
      ?auto_148610 - BLOCK
      ?auto_148611 - BLOCK
      ?auto_148612 - BLOCK
      ?auto_148613 - BLOCK
      ?auto_148614 - BLOCK
    )
    :vars
    (
      ?auto_148615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148614 ?auto_148615 ) ( ON-TABLE ?auto_148607 ) ( ON ?auto_148608 ?auto_148607 ) ( ON ?auto_148609 ?auto_148608 ) ( ON ?auto_148610 ?auto_148609 ) ( ON ?auto_148611 ?auto_148610 ) ( ON ?auto_148612 ?auto_148611 ) ( not ( = ?auto_148607 ?auto_148608 ) ) ( not ( = ?auto_148607 ?auto_148609 ) ) ( not ( = ?auto_148607 ?auto_148610 ) ) ( not ( = ?auto_148607 ?auto_148611 ) ) ( not ( = ?auto_148607 ?auto_148612 ) ) ( not ( = ?auto_148607 ?auto_148613 ) ) ( not ( = ?auto_148607 ?auto_148614 ) ) ( not ( = ?auto_148607 ?auto_148615 ) ) ( not ( = ?auto_148608 ?auto_148609 ) ) ( not ( = ?auto_148608 ?auto_148610 ) ) ( not ( = ?auto_148608 ?auto_148611 ) ) ( not ( = ?auto_148608 ?auto_148612 ) ) ( not ( = ?auto_148608 ?auto_148613 ) ) ( not ( = ?auto_148608 ?auto_148614 ) ) ( not ( = ?auto_148608 ?auto_148615 ) ) ( not ( = ?auto_148609 ?auto_148610 ) ) ( not ( = ?auto_148609 ?auto_148611 ) ) ( not ( = ?auto_148609 ?auto_148612 ) ) ( not ( = ?auto_148609 ?auto_148613 ) ) ( not ( = ?auto_148609 ?auto_148614 ) ) ( not ( = ?auto_148609 ?auto_148615 ) ) ( not ( = ?auto_148610 ?auto_148611 ) ) ( not ( = ?auto_148610 ?auto_148612 ) ) ( not ( = ?auto_148610 ?auto_148613 ) ) ( not ( = ?auto_148610 ?auto_148614 ) ) ( not ( = ?auto_148610 ?auto_148615 ) ) ( not ( = ?auto_148611 ?auto_148612 ) ) ( not ( = ?auto_148611 ?auto_148613 ) ) ( not ( = ?auto_148611 ?auto_148614 ) ) ( not ( = ?auto_148611 ?auto_148615 ) ) ( not ( = ?auto_148612 ?auto_148613 ) ) ( not ( = ?auto_148612 ?auto_148614 ) ) ( not ( = ?auto_148612 ?auto_148615 ) ) ( not ( = ?auto_148613 ?auto_148614 ) ) ( not ( = ?auto_148613 ?auto_148615 ) ) ( not ( = ?auto_148614 ?auto_148615 ) ) ( CLEAR ?auto_148612 ) ( ON ?auto_148613 ?auto_148614 ) ( CLEAR ?auto_148613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148607 ?auto_148608 ?auto_148609 ?auto_148610 ?auto_148611 ?auto_148612 ?auto_148613 )
      ( MAKE-8PILE ?auto_148607 ?auto_148608 ?auto_148609 ?auto_148610 ?auto_148611 ?auto_148612 ?auto_148613 ?auto_148614 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148624 - BLOCK
      ?auto_148625 - BLOCK
      ?auto_148626 - BLOCK
      ?auto_148627 - BLOCK
      ?auto_148628 - BLOCK
      ?auto_148629 - BLOCK
      ?auto_148630 - BLOCK
      ?auto_148631 - BLOCK
    )
    :vars
    (
      ?auto_148632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148631 ?auto_148632 ) ( ON-TABLE ?auto_148624 ) ( ON ?auto_148625 ?auto_148624 ) ( ON ?auto_148626 ?auto_148625 ) ( ON ?auto_148627 ?auto_148626 ) ( ON ?auto_148628 ?auto_148627 ) ( not ( = ?auto_148624 ?auto_148625 ) ) ( not ( = ?auto_148624 ?auto_148626 ) ) ( not ( = ?auto_148624 ?auto_148627 ) ) ( not ( = ?auto_148624 ?auto_148628 ) ) ( not ( = ?auto_148624 ?auto_148629 ) ) ( not ( = ?auto_148624 ?auto_148630 ) ) ( not ( = ?auto_148624 ?auto_148631 ) ) ( not ( = ?auto_148624 ?auto_148632 ) ) ( not ( = ?auto_148625 ?auto_148626 ) ) ( not ( = ?auto_148625 ?auto_148627 ) ) ( not ( = ?auto_148625 ?auto_148628 ) ) ( not ( = ?auto_148625 ?auto_148629 ) ) ( not ( = ?auto_148625 ?auto_148630 ) ) ( not ( = ?auto_148625 ?auto_148631 ) ) ( not ( = ?auto_148625 ?auto_148632 ) ) ( not ( = ?auto_148626 ?auto_148627 ) ) ( not ( = ?auto_148626 ?auto_148628 ) ) ( not ( = ?auto_148626 ?auto_148629 ) ) ( not ( = ?auto_148626 ?auto_148630 ) ) ( not ( = ?auto_148626 ?auto_148631 ) ) ( not ( = ?auto_148626 ?auto_148632 ) ) ( not ( = ?auto_148627 ?auto_148628 ) ) ( not ( = ?auto_148627 ?auto_148629 ) ) ( not ( = ?auto_148627 ?auto_148630 ) ) ( not ( = ?auto_148627 ?auto_148631 ) ) ( not ( = ?auto_148627 ?auto_148632 ) ) ( not ( = ?auto_148628 ?auto_148629 ) ) ( not ( = ?auto_148628 ?auto_148630 ) ) ( not ( = ?auto_148628 ?auto_148631 ) ) ( not ( = ?auto_148628 ?auto_148632 ) ) ( not ( = ?auto_148629 ?auto_148630 ) ) ( not ( = ?auto_148629 ?auto_148631 ) ) ( not ( = ?auto_148629 ?auto_148632 ) ) ( not ( = ?auto_148630 ?auto_148631 ) ) ( not ( = ?auto_148630 ?auto_148632 ) ) ( not ( = ?auto_148631 ?auto_148632 ) ) ( ON ?auto_148630 ?auto_148631 ) ( CLEAR ?auto_148628 ) ( ON ?auto_148629 ?auto_148630 ) ( CLEAR ?auto_148629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148624 ?auto_148625 ?auto_148626 ?auto_148627 ?auto_148628 ?auto_148629 )
      ( MAKE-8PILE ?auto_148624 ?auto_148625 ?auto_148626 ?auto_148627 ?auto_148628 ?auto_148629 ?auto_148630 ?auto_148631 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148641 - BLOCK
      ?auto_148642 - BLOCK
      ?auto_148643 - BLOCK
      ?auto_148644 - BLOCK
      ?auto_148645 - BLOCK
      ?auto_148646 - BLOCK
      ?auto_148647 - BLOCK
      ?auto_148648 - BLOCK
    )
    :vars
    (
      ?auto_148649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148648 ?auto_148649 ) ( ON-TABLE ?auto_148641 ) ( ON ?auto_148642 ?auto_148641 ) ( ON ?auto_148643 ?auto_148642 ) ( ON ?auto_148644 ?auto_148643 ) ( ON ?auto_148645 ?auto_148644 ) ( not ( = ?auto_148641 ?auto_148642 ) ) ( not ( = ?auto_148641 ?auto_148643 ) ) ( not ( = ?auto_148641 ?auto_148644 ) ) ( not ( = ?auto_148641 ?auto_148645 ) ) ( not ( = ?auto_148641 ?auto_148646 ) ) ( not ( = ?auto_148641 ?auto_148647 ) ) ( not ( = ?auto_148641 ?auto_148648 ) ) ( not ( = ?auto_148641 ?auto_148649 ) ) ( not ( = ?auto_148642 ?auto_148643 ) ) ( not ( = ?auto_148642 ?auto_148644 ) ) ( not ( = ?auto_148642 ?auto_148645 ) ) ( not ( = ?auto_148642 ?auto_148646 ) ) ( not ( = ?auto_148642 ?auto_148647 ) ) ( not ( = ?auto_148642 ?auto_148648 ) ) ( not ( = ?auto_148642 ?auto_148649 ) ) ( not ( = ?auto_148643 ?auto_148644 ) ) ( not ( = ?auto_148643 ?auto_148645 ) ) ( not ( = ?auto_148643 ?auto_148646 ) ) ( not ( = ?auto_148643 ?auto_148647 ) ) ( not ( = ?auto_148643 ?auto_148648 ) ) ( not ( = ?auto_148643 ?auto_148649 ) ) ( not ( = ?auto_148644 ?auto_148645 ) ) ( not ( = ?auto_148644 ?auto_148646 ) ) ( not ( = ?auto_148644 ?auto_148647 ) ) ( not ( = ?auto_148644 ?auto_148648 ) ) ( not ( = ?auto_148644 ?auto_148649 ) ) ( not ( = ?auto_148645 ?auto_148646 ) ) ( not ( = ?auto_148645 ?auto_148647 ) ) ( not ( = ?auto_148645 ?auto_148648 ) ) ( not ( = ?auto_148645 ?auto_148649 ) ) ( not ( = ?auto_148646 ?auto_148647 ) ) ( not ( = ?auto_148646 ?auto_148648 ) ) ( not ( = ?auto_148646 ?auto_148649 ) ) ( not ( = ?auto_148647 ?auto_148648 ) ) ( not ( = ?auto_148647 ?auto_148649 ) ) ( not ( = ?auto_148648 ?auto_148649 ) ) ( ON ?auto_148647 ?auto_148648 ) ( CLEAR ?auto_148645 ) ( ON ?auto_148646 ?auto_148647 ) ( CLEAR ?auto_148646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148641 ?auto_148642 ?auto_148643 ?auto_148644 ?auto_148645 ?auto_148646 )
      ( MAKE-8PILE ?auto_148641 ?auto_148642 ?auto_148643 ?auto_148644 ?auto_148645 ?auto_148646 ?auto_148647 ?auto_148648 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148658 - BLOCK
      ?auto_148659 - BLOCK
      ?auto_148660 - BLOCK
      ?auto_148661 - BLOCK
      ?auto_148662 - BLOCK
      ?auto_148663 - BLOCK
      ?auto_148664 - BLOCK
      ?auto_148665 - BLOCK
    )
    :vars
    (
      ?auto_148666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148665 ?auto_148666 ) ( ON-TABLE ?auto_148658 ) ( ON ?auto_148659 ?auto_148658 ) ( ON ?auto_148660 ?auto_148659 ) ( ON ?auto_148661 ?auto_148660 ) ( not ( = ?auto_148658 ?auto_148659 ) ) ( not ( = ?auto_148658 ?auto_148660 ) ) ( not ( = ?auto_148658 ?auto_148661 ) ) ( not ( = ?auto_148658 ?auto_148662 ) ) ( not ( = ?auto_148658 ?auto_148663 ) ) ( not ( = ?auto_148658 ?auto_148664 ) ) ( not ( = ?auto_148658 ?auto_148665 ) ) ( not ( = ?auto_148658 ?auto_148666 ) ) ( not ( = ?auto_148659 ?auto_148660 ) ) ( not ( = ?auto_148659 ?auto_148661 ) ) ( not ( = ?auto_148659 ?auto_148662 ) ) ( not ( = ?auto_148659 ?auto_148663 ) ) ( not ( = ?auto_148659 ?auto_148664 ) ) ( not ( = ?auto_148659 ?auto_148665 ) ) ( not ( = ?auto_148659 ?auto_148666 ) ) ( not ( = ?auto_148660 ?auto_148661 ) ) ( not ( = ?auto_148660 ?auto_148662 ) ) ( not ( = ?auto_148660 ?auto_148663 ) ) ( not ( = ?auto_148660 ?auto_148664 ) ) ( not ( = ?auto_148660 ?auto_148665 ) ) ( not ( = ?auto_148660 ?auto_148666 ) ) ( not ( = ?auto_148661 ?auto_148662 ) ) ( not ( = ?auto_148661 ?auto_148663 ) ) ( not ( = ?auto_148661 ?auto_148664 ) ) ( not ( = ?auto_148661 ?auto_148665 ) ) ( not ( = ?auto_148661 ?auto_148666 ) ) ( not ( = ?auto_148662 ?auto_148663 ) ) ( not ( = ?auto_148662 ?auto_148664 ) ) ( not ( = ?auto_148662 ?auto_148665 ) ) ( not ( = ?auto_148662 ?auto_148666 ) ) ( not ( = ?auto_148663 ?auto_148664 ) ) ( not ( = ?auto_148663 ?auto_148665 ) ) ( not ( = ?auto_148663 ?auto_148666 ) ) ( not ( = ?auto_148664 ?auto_148665 ) ) ( not ( = ?auto_148664 ?auto_148666 ) ) ( not ( = ?auto_148665 ?auto_148666 ) ) ( ON ?auto_148664 ?auto_148665 ) ( ON ?auto_148663 ?auto_148664 ) ( CLEAR ?auto_148661 ) ( ON ?auto_148662 ?auto_148663 ) ( CLEAR ?auto_148662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148658 ?auto_148659 ?auto_148660 ?auto_148661 ?auto_148662 )
      ( MAKE-8PILE ?auto_148658 ?auto_148659 ?auto_148660 ?auto_148661 ?auto_148662 ?auto_148663 ?auto_148664 ?auto_148665 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148675 - BLOCK
      ?auto_148676 - BLOCK
      ?auto_148677 - BLOCK
      ?auto_148678 - BLOCK
      ?auto_148679 - BLOCK
      ?auto_148680 - BLOCK
      ?auto_148681 - BLOCK
      ?auto_148682 - BLOCK
    )
    :vars
    (
      ?auto_148683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148682 ?auto_148683 ) ( ON-TABLE ?auto_148675 ) ( ON ?auto_148676 ?auto_148675 ) ( ON ?auto_148677 ?auto_148676 ) ( ON ?auto_148678 ?auto_148677 ) ( not ( = ?auto_148675 ?auto_148676 ) ) ( not ( = ?auto_148675 ?auto_148677 ) ) ( not ( = ?auto_148675 ?auto_148678 ) ) ( not ( = ?auto_148675 ?auto_148679 ) ) ( not ( = ?auto_148675 ?auto_148680 ) ) ( not ( = ?auto_148675 ?auto_148681 ) ) ( not ( = ?auto_148675 ?auto_148682 ) ) ( not ( = ?auto_148675 ?auto_148683 ) ) ( not ( = ?auto_148676 ?auto_148677 ) ) ( not ( = ?auto_148676 ?auto_148678 ) ) ( not ( = ?auto_148676 ?auto_148679 ) ) ( not ( = ?auto_148676 ?auto_148680 ) ) ( not ( = ?auto_148676 ?auto_148681 ) ) ( not ( = ?auto_148676 ?auto_148682 ) ) ( not ( = ?auto_148676 ?auto_148683 ) ) ( not ( = ?auto_148677 ?auto_148678 ) ) ( not ( = ?auto_148677 ?auto_148679 ) ) ( not ( = ?auto_148677 ?auto_148680 ) ) ( not ( = ?auto_148677 ?auto_148681 ) ) ( not ( = ?auto_148677 ?auto_148682 ) ) ( not ( = ?auto_148677 ?auto_148683 ) ) ( not ( = ?auto_148678 ?auto_148679 ) ) ( not ( = ?auto_148678 ?auto_148680 ) ) ( not ( = ?auto_148678 ?auto_148681 ) ) ( not ( = ?auto_148678 ?auto_148682 ) ) ( not ( = ?auto_148678 ?auto_148683 ) ) ( not ( = ?auto_148679 ?auto_148680 ) ) ( not ( = ?auto_148679 ?auto_148681 ) ) ( not ( = ?auto_148679 ?auto_148682 ) ) ( not ( = ?auto_148679 ?auto_148683 ) ) ( not ( = ?auto_148680 ?auto_148681 ) ) ( not ( = ?auto_148680 ?auto_148682 ) ) ( not ( = ?auto_148680 ?auto_148683 ) ) ( not ( = ?auto_148681 ?auto_148682 ) ) ( not ( = ?auto_148681 ?auto_148683 ) ) ( not ( = ?auto_148682 ?auto_148683 ) ) ( ON ?auto_148681 ?auto_148682 ) ( ON ?auto_148680 ?auto_148681 ) ( CLEAR ?auto_148678 ) ( ON ?auto_148679 ?auto_148680 ) ( CLEAR ?auto_148679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148675 ?auto_148676 ?auto_148677 ?auto_148678 ?auto_148679 )
      ( MAKE-8PILE ?auto_148675 ?auto_148676 ?auto_148677 ?auto_148678 ?auto_148679 ?auto_148680 ?auto_148681 ?auto_148682 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148692 - BLOCK
      ?auto_148693 - BLOCK
      ?auto_148694 - BLOCK
      ?auto_148695 - BLOCK
      ?auto_148696 - BLOCK
      ?auto_148697 - BLOCK
      ?auto_148698 - BLOCK
      ?auto_148699 - BLOCK
    )
    :vars
    (
      ?auto_148700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148699 ?auto_148700 ) ( ON-TABLE ?auto_148692 ) ( ON ?auto_148693 ?auto_148692 ) ( ON ?auto_148694 ?auto_148693 ) ( not ( = ?auto_148692 ?auto_148693 ) ) ( not ( = ?auto_148692 ?auto_148694 ) ) ( not ( = ?auto_148692 ?auto_148695 ) ) ( not ( = ?auto_148692 ?auto_148696 ) ) ( not ( = ?auto_148692 ?auto_148697 ) ) ( not ( = ?auto_148692 ?auto_148698 ) ) ( not ( = ?auto_148692 ?auto_148699 ) ) ( not ( = ?auto_148692 ?auto_148700 ) ) ( not ( = ?auto_148693 ?auto_148694 ) ) ( not ( = ?auto_148693 ?auto_148695 ) ) ( not ( = ?auto_148693 ?auto_148696 ) ) ( not ( = ?auto_148693 ?auto_148697 ) ) ( not ( = ?auto_148693 ?auto_148698 ) ) ( not ( = ?auto_148693 ?auto_148699 ) ) ( not ( = ?auto_148693 ?auto_148700 ) ) ( not ( = ?auto_148694 ?auto_148695 ) ) ( not ( = ?auto_148694 ?auto_148696 ) ) ( not ( = ?auto_148694 ?auto_148697 ) ) ( not ( = ?auto_148694 ?auto_148698 ) ) ( not ( = ?auto_148694 ?auto_148699 ) ) ( not ( = ?auto_148694 ?auto_148700 ) ) ( not ( = ?auto_148695 ?auto_148696 ) ) ( not ( = ?auto_148695 ?auto_148697 ) ) ( not ( = ?auto_148695 ?auto_148698 ) ) ( not ( = ?auto_148695 ?auto_148699 ) ) ( not ( = ?auto_148695 ?auto_148700 ) ) ( not ( = ?auto_148696 ?auto_148697 ) ) ( not ( = ?auto_148696 ?auto_148698 ) ) ( not ( = ?auto_148696 ?auto_148699 ) ) ( not ( = ?auto_148696 ?auto_148700 ) ) ( not ( = ?auto_148697 ?auto_148698 ) ) ( not ( = ?auto_148697 ?auto_148699 ) ) ( not ( = ?auto_148697 ?auto_148700 ) ) ( not ( = ?auto_148698 ?auto_148699 ) ) ( not ( = ?auto_148698 ?auto_148700 ) ) ( not ( = ?auto_148699 ?auto_148700 ) ) ( ON ?auto_148698 ?auto_148699 ) ( ON ?auto_148697 ?auto_148698 ) ( ON ?auto_148696 ?auto_148697 ) ( CLEAR ?auto_148694 ) ( ON ?auto_148695 ?auto_148696 ) ( CLEAR ?auto_148695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148692 ?auto_148693 ?auto_148694 ?auto_148695 )
      ( MAKE-8PILE ?auto_148692 ?auto_148693 ?auto_148694 ?auto_148695 ?auto_148696 ?auto_148697 ?auto_148698 ?auto_148699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148709 - BLOCK
      ?auto_148710 - BLOCK
      ?auto_148711 - BLOCK
      ?auto_148712 - BLOCK
      ?auto_148713 - BLOCK
      ?auto_148714 - BLOCK
      ?auto_148715 - BLOCK
      ?auto_148716 - BLOCK
    )
    :vars
    (
      ?auto_148717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148716 ?auto_148717 ) ( ON-TABLE ?auto_148709 ) ( ON ?auto_148710 ?auto_148709 ) ( ON ?auto_148711 ?auto_148710 ) ( not ( = ?auto_148709 ?auto_148710 ) ) ( not ( = ?auto_148709 ?auto_148711 ) ) ( not ( = ?auto_148709 ?auto_148712 ) ) ( not ( = ?auto_148709 ?auto_148713 ) ) ( not ( = ?auto_148709 ?auto_148714 ) ) ( not ( = ?auto_148709 ?auto_148715 ) ) ( not ( = ?auto_148709 ?auto_148716 ) ) ( not ( = ?auto_148709 ?auto_148717 ) ) ( not ( = ?auto_148710 ?auto_148711 ) ) ( not ( = ?auto_148710 ?auto_148712 ) ) ( not ( = ?auto_148710 ?auto_148713 ) ) ( not ( = ?auto_148710 ?auto_148714 ) ) ( not ( = ?auto_148710 ?auto_148715 ) ) ( not ( = ?auto_148710 ?auto_148716 ) ) ( not ( = ?auto_148710 ?auto_148717 ) ) ( not ( = ?auto_148711 ?auto_148712 ) ) ( not ( = ?auto_148711 ?auto_148713 ) ) ( not ( = ?auto_148711 ?auto_148714 ) ) ( not ( = ?auto_148711 ?auto_148715 ) ) ( not ( = ?auto_148711 ?auto_148716 ) ) ( not ( = ?auto_148711 ?auto_148717 ) ) ( not ( = ?auto_148712 ?auto_148713 ) ) ( not ( = ?auto_148712 ?auto_148714 ) ) ( not ( = ?auto_148712 ?auto_148715 ) ) ( not ( = ?auto_148712 ?auto_148716 ) ) ( not ( = ?auto_148712 ?auto_148717 ) ) ( not ( = ?auto_148713 ?auto_148714 ) ) ( not ( = ?auto_148713 ?auto_148715 ) ) ( not ( = ?auto_148713 ?auto_148716 ) ) ( not ( = ?auto_148713 ?auto_148717 ) ) ( not ( = ?auto_148714 ?auto_148715 ) ) ( not ( = ?auto_148714 ?auto_148716 ) ) ( not ( = ?auto_148714 ?auto_148717 ) ) ( not ( = ?auto_148715 ?auto_148716 ) ) ( not ( = ?auto_148715 ?auto_148717 ) ) ( not ( = ?auto_148716 ?auto_148717 ) ) ( ON ?auto_148715 ?auto_148716 ) ( ON ?auto_148714 ?auto_148715 ) ( ON ?auto_148713 ?auto_148714 ) ( CLEAR ?auto_148711 ) ( ON ?auto_148712 ?auto_148713 ) ( CLEAR ?auto_148712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_148709 ?auto_148710 ?auto_148711 ?auto_148712 )
      ( MAKE-8PILE ?auto_148709 ?auto_148710 ?auto_148711 ?auto_148712 ?auto_148713 ?auto_148714 ?auto_148715 ?auto_148716 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148726 - BLOCK
      ?auto_148727 - BLOCK
      ?auto_148728 - BLOCK
      ?auto_148729 - BLOCK
      ?auto_148730 - BLOCK
      ?auto_148731 - BLOCK
      ?auto_148732 - BLOCK
      ?auto_148733 - BLOCK
    )
    :vars
    (
      ?auto_148734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148733 ?auto_148734 ) ( ON-TABLE ?auto_148726 ) ( ON ?auto_148727 ?auto_148726 ) ( not ( = ?auto_148726 ?auto_148727 ) ) ( not ( = ?auto_148726 ?auto_148728 ) ) ( not ( = ?auto_148726 ?auto_148729 ) ) ( not ( = ?auto_148726 ?auto_148730 ) ) ( not ( = ?auto_148726 ?auto_148731 ) ) ( not ( = ?auto_148726 ?auto_148732 ) ) ( not ( = ?auto_148726 ?auto_148733 ) ) ( not ( = ?auto_148726 ?auto_148734 ) ) ( not ( = ?auto_148727 ?auto_148728 ) ) ( not ( = ?auto_148727 ?auto_148729 ) ) ( not ( = ?auto_148727 ?auto_148730 ) ) ( not ( = ?auto_148727 ?auto_148731 ) ) ( not ( = ?auto_148727 ?auto_148732 ) ) ( not ( = ?auto_148727 ?auto_148733 ) ) ( not ( = ?auto_148727 ?auto_148734 ) ) ( not ( = ?auto_148728 ?auto_148729 ) ) ( not ( = ?auto_148728 ?auto_148730 ) ) ( not ( = ?auto_148728 ?auto_148731 ) ) ( not ( = ?auto_148728 ?auto_148732 ) ) ( not ( = ?auto_148728 ?auto_148733 ) ) ( not ( = ?auto_148728 ?auto_148734 ) ) ( not ( = ?auto_148729 ?auto_148730 ) ) ( not ( = ?auto_148729 ?auto_148731 ) ) ( not ( = ?auto_148729 ?auto_148732 ) ) ( not ( = ?auto_148729 ?auto_148733 ) ) ( not ( = ?auto_148729 ?auto_148734 ) ) ( not ( = ?auto_148730 ?auto_148731 ) ) ( not ( = ?auto_148730 ?auto_148732 ) ) ( not ( = ?auto_148730 ?auto_148733 ) ) ( not ( = ?auto_148730 ?auto_148734 ) ) ( not ( = ?auto_148731 ?auto_148732 ) ) ( not ( = ?auto_148731 ?auto_148733 ) ) ( not ( = ?auto_148731 ?auto_148734 ) ) ( not ( = ?auto_148732 ?auto_148733 ) ) ( not ( = ?auto_148732 ?auto_148734 ) ) ( not ( = ?auto_148733 ?auto_148734 ) ) ( ON ?auto_148732 ?auto_148733 ) ( ON ?auto_148731 ?auto_148732 ) ( ON ?auto_148730 ?auto_148731 ) ( ON ?auto_148729 ?auto_148730 ) ( CLEAR ?auto_148727 ) ( ON ?auto_148728 ?auto_148729 ) ( CLEAR ?auto_148728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148726 ?auto_148727 ?auto_148728 )
      ( MAKE-8PILE ?auto_148726 ?auto_148727 ?auto_148728 ?auto_148729 ?auto_148730 ?auto_148731 ?auto_148732 ?auto_148733 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148743 - BLOCK
      ?auto_148744 - BLOCK
      ?auto_148745 - BLOCK
      ?auto_148746 - BLOCK
      ?auto_148747 - BLOCK
      ?auto_148748 - BLOCK
      ?auto_148749 - BLOCK
      ?auto_148750 - BLOCK
    )
    :vars
    (
      ?auto_148751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148750 ?auto_148751 ) ( ON-TABLE ?auto_148743 ) ( ON ?auto_148744 ?auto_148743 ) ( not ( = ?auto_148743 ?auto_148744 ) ) ( not ( = ?auto_148743 ?auto_148745 ) ) ( not ( = ?auto_148743 ?auto_148746 ) ) ( not ( = ?auto_148743 ?auto_148747 ) ) ( not ( = ?auto_148743 ?auto_148748 ) ) ( not ( = ?auto_148743 ?auto_148749 ) ) ( not ( = ?auto_148743 ?auto_148750 ) ) ( not ( = ?auto_148743 ?auto_148751 ) ) ( not ( = ?auto_148744 ?auto_148745 ) ) ( not ( = ?auto_148744 ?auto_148746 ) ) ( not ( = ?auto_148744 ?auto_148747 ) ) ( not ( = ?auto_148744 ?auto_148748 ) ) ( not ( = ?auto_148744 ?auto_148749 ) ) ( not ( = ?auto_148744 ?auto_148750 ) ) ( not ( = ?auto_148744 ?auto_148751 ) ) ( not ( = ?auto_148745 ?auto_148746 ) ) ( not ( = ?auto_148745 ?auto_148747 ) ) ( not ( = ?auto_148745 ?auto_148748 ) ) ( not ( = ?auto_148745 ?auto_148749 ) ) ( not ( = ?auto_148745 ?auto_148750 ) ) ( not ( = ?auto_148745 ?auto_148751 ) ) ( not ( = ?auto_148746 ?auto_148747 ) ) ( not ( = ?auto_148746 ?auto_148748 ) ) ( not ( = ?auto_148746 ?auto_148749 ) ) ( not ( = ?auto_148746 ?auto_148750 ) ) ( not ( = ?auto_148746 ?auto_148751 ) ) ( not ( = ?auto_148747 ?auto_148748 ) ) ( not ( = ?auto_148747 ?auto_148749 ) ) ( not ( = ?auto_148747 ?auto_148750 ) ) ( not ( = ?auto_148747 ?auto_148751 ) ) ( not ( = ?auto_148748 ?auto_148749 ) ) ( not ( = ?auto_148748 ?auto_148750 ) ) ( not ( = ?auto_148748 ?auto_148751 ) ) ( not ( = ?auto_148749 ?auto_148750 ) ) ( not ( = ?auto_148749 ?auto_148751 ) ) ( not ( = ?auto_148750 ?auto_148751 ) ) ( ON ?auto_148749 ?auto_148750 ) ( ON ?auto_148748 ?auto_148749 ) ( ON ?auto_148747 ?auto_148748 ) ( ON ?auto_148746 ?auto_148747 ) ( CLEAR ?auto_148744 ) ( ON ?auto_148745 ?auto_148746 ) ( CLEAR ?auto_148745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_148743 ?auto_148744 ?auto_148745 )
      ( MAKE-8PILE ?auto_148743 ?auto_148744 ?auto_148745 ?auto_148746 ?auto_148747 ?auto_148748 ?auto_148749 ?auto_148750 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148760 - BLOCK
      ?auto_148761 - BLOCK
      ?auto_148762 - BLOCK
      ?auto_148763 - BLOCK
      ?auto_148764 - BLOCK
      ?auto_148765 - BLOCK
      ?auto_148766 - BLOCK
      ?auto_148767 - BLOCK
    )
    :vars
    (
      ?auto_148768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148767 ?auto_148768 ) ( ON-TABLE ?auto_148760 ) ( not ( = ?auto_148760 ?auto_148761 ) ) ( not ( = ?auto_148760 ?auto_148762 ) ) ( not ( = ?auto_148760 ?auto_148763 ) ) ( not ( = ?auto_148760 ?auto_148764 ) ) ( not ( = ?auto_148760 ?auto_148765 ) ) ( not ( = ?auto_148760 ?auto_148766 ) ) ( not ( = ?auto_148760 ?auto_148767 ) ) ( not ( = ?auto_148760 ?auto_148768 ) ) ( not ( = ?auto_148761 ?auto_148762 ) ) ( not ( = ?auto_148761 ?auto_148763 ) ) ( not ( = ?auto_148761 ?auto_148764 ) ) ( not ( = ?auto_148761 ?auto_148765 ) ) ( not ( = ?auto_148761 ?auto_148766 ) ) ( not ( = ?auto_148761 ?auto_148767 ) ) ( not ( = ?auto_148761 ?auto_148768 ) ) ( not ( = ?auto_148762 ?auto_148763 ) ) ( not ( = ?auto_148762 ?auto_148764 ) ) ( not ( = ?auto_148762 ?auto_148765 ) ) ( not ( = ?auto_148762 ?auto_148766 ) ) ( not ( = ?auto_148762 ?auto_148767 ) ) ( not ( = ?auto_148762 ?auto_148768 ) ) ( not ( = ?auto_148763 ?auto_148764 ) ) ( not ( = ?auto_148763 ?auto_148765 ) ) ( not ( = ?auto_148763 ?auto_148766 ) ) ( not ( = ?auto_148763 ?auto_148767 ) ) ( not ( = ?auto_148763 ?auto_148768 ) ) ( not ( = ?auto_148764 ?auto_148765 ) ) ( not ( = ?auto_148764 ?auto_148766 ) ) ( not ( = ?auto_148764 ?auto_148767 ) ) ( not ( = ?auto_148764 ?auto_148768 ) ) ( not ( = ?auto_148765 ?auto_148766 ) ) ( not ( = ?auto_148765 ?auto_148767 ) ) ( not ( = ?auto_148765 ?auto_148768 ) ) ( not ( = ?auto_148766 ?auto_148767 ) ) ( not ( = ?auto_148766 ?auto_148768 ) ) ( not ( = ?auto_148767 ?auto_148768 ) ) ( ON ?auto_148766 ?auto_148767 ) ( ON ?auto_148765 ?auto_148766 ) ( ON ?auto_148764 ?auto_148765 ) ( ON ?auto_148763 ?auto_148764 ) ( ON ?auto_148762 ?auto_148763 ) ( CLEAR ?auto_148760 ) ( ON ?auto_148761 ?auto_148762 ) ( CLEAR ?auto_148761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148760 ?auto_148761 )
      ( MAKE-8PILE ?auto_148760 ?auto_148761 ?auto_148762 ?auto_148763 ?auto_148764 ?auto_148765 ?auto_148766 ?auto_148767 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148777 - BLOCK
      ?auto_148778 - BLOCK
      ?auto_148779 - BLOCK
      ?auto_148780 - BLOCK
      ?auto_148781 - BLOCK
      ?auto_148782 - BLOCK
      ?auto_148783 - BLOCK
      ?auto_148784 - BLOCK
    )
    :vars
    (
      ?auto_148785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148784 ?auto_148785 ) ( ON-TABLE ?auto_148777 ) ( not ( = ?auto_148777 ?auto_148778 ) ) ( not ( = ?auto_148777 ?auto_148779 ) ) ( not ( = ?auto_148777 ?auto_148780 ) ) ( not ( = ?auto_148777 ?auto_148781 ) ) ( not ( = ?auto_148777 ?auto_148782 ) ) ( not ( = ?auto_148777 ?auto_148783 ) ) ( not ( = ?auto_148777 ?auto_148784 ) ) ( not ( = ?auto_148777 ?auto_148785 ) ) ( not ( = ?auto_148778 ?auto_148779 ) ) ( not ( = ?auto_148778 ?auto_148780 ) ) ( not ( = ?auto_148778 ?auto_148781 ) ) ( not ( = ?auto_148778 ?auto_148782 ) ) ( not ( = ?auto_148778 ?auto_148783 ) ) ( not ( = ?auto_148778 ?auto_148784 ) ) ( not ( = ?auto_148778 ?auto_148785 ) ) ( not ( = ?auto_148779 ?auto_148780 ) ) ( not ( = ?auto_148779 ?auto_148781 ) ) ( not ( = ?auto_148779 ?auto_148782 ) ) ( not ( = ?auto_148779 ?auto_148783 ) ) ( not ( = ?auto_148779 ?auto_148784 ) ) ( not ( = ?auto_148779 ?auto_148785 ) ) ( not ( = ?auto_148780 ?auto_148781 ) ) ( not ( = ?auto_148780 ?auto_148782 ) ) ( not ( = ?auto_148780 ?auto_148783 ) ) ( not ( = ?auto_148780 ?auto_148784 ) ) ( not ( = ?auto_148780 ?auto_148785 ) ) ( not ( = ?auto_148781 ?auto_148782 ) ) ( not ( = ?auto_148781 ?auto_148783 ) ) ( not ( = ?auto_148781 ?auto_148784 ) ) ( not ( = ?auto_148781 ?auto_148785 ) ) ( not ( = ?auto_148782 ?auto_148783 ) ) ( not ( = ?auto_148782 ?auto_148784 ) ) ( not ( = ?auto_148782 ?auto_148785 ) ) ( not ( = ?auto_148783 ?auto_148784 ) ) ( not ( = ?auto_148783 ?auto_148785 ) ) ( not ( = ?auto_148784 ?auto_148785 ) ) ( ON ?auto_148783 ?auto_148784 ) ( ON ?auto_148782 ?auto_148783 ) ( ON ?auto_148781 ?auto_148782 ) ( ON ?auto_148780 ?auto_148781 ) ( ON ?auto_148779 ?auto_148780 ) ( CLEAR ?auto_148777 ) ( ON ?auto_148778 ?auto_148779 ) ( CLEAR ?auto_148778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_148777 ?auto_148778 )
      ( MAKE-8PILE ?auto_148777 ?auto_148778 ?auto_148779 ?auto_148780 ?auto_148781 ?auto_148782 ?auto_148783 ?auto_148784 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148794 - BLOCK
      ?auto_148795 - BLOCK
      ?auto_148796 - BLOCK
      ?auto_148797 - BLOCK
      ?auto_148798 - BLOCK
      ?auto_148799 - BLOCK
      ?auto_148800 - BLOCK
      ?auto_148801 - BLOCK
    )
    :vars
    (
      ?auto_148802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148801 ?auto_148802 ) ( not ( = ?auto_148794 ?auto_148795 ) ) ( not ( = ?auto_148794 ?auto_148796 ) ) ( not ( = ?auto_148794 ?auto_148797 ) ) ( not ( = ?auto_148794 ?auto_148798 ) ) ( not ( = ?auto_148794 ?auto_148799 ) ) ( not ( = ?auto_148794 ?auto_148800 ) ) ( not ( = ?auto_148794 ?auto_148801 ) ) ( not ( = ?auto_148794 ?auto_148802 ) ) ( not ( = ?auto_148795 ?auto_148796 ) ) ( not ( = ?auto_148795 ?auto_148797 ) ) ( not ( = ?auto_148795 ?auto_148798 ) ) ( not ( = ?auto_148795 ?auto_148799 ) ) ( not ( = ?auto_148795 ?auto_148800 ) ) ( not ( = ?auto_148795 ?auto_148801 ) ) ( not ( = ?auto_148795 ?auto_148802 ) ) ( not ( = ?auto_148796 ?auto_148797 ) ) ( not ( = ?auto_148796 ?auto_148798 ) ) ( not ( = ?auto_148796 ?auto_148799 ) ) ( not ( = ?auto_148796 ?auto_148800 ) ) ( not ( = ?auto_148796 ?auto_148801 ) ) ( not ( = ?auto_148796 ?auto_148802 ) ) ( not ( = ?auto_148797 ?auto_148798 ) ) ( not ( = ?auto_148797 ?auto_148799 ) ) ( not ( = ?auto_148797 ?auto_148800 ) ) ( not ( = ?auto_148797 ?auto_148801 ) ) ( not ( = ?auto_148797 ?auto_148802 ) ) ( not ( = ?auto_148798 ?auto_148799 ) ) ( not ( = ?auto_148798 ?auto_148800 ) ) ( not ( = ?auto_148798 ?auto_148801 ) ) ( not ( = ?auto_148798 ?auto_148802 ) ) ( not ( = ?auto_148799 ?auto_148800 ) ) ( not ( = ?auto_148799 ?auto_148801 ) ) ( not ( = ?auto_148799 ?auto_148802 ) ) ( not ( = ?auto_148800 ?auto_148801 ) ) ( not ( = ?auto_148800 ?auto_148802 ) ) ( not ( = ?auto_148801 ?auto_148802 ) ) ( ON ?auto_148800 ?auto_148801 ) ( ON ?auto_148799 ?auto_148800 ) ( ON ?auto_148798 ?auto_148799 ) ( ON ?auto_148797 ?auto_148798 ) ( ON ?auto_148796 ?auto_148797 ) ( ON ?auto_148795 ?auto_148796 ) ( ON ?auto_148794 ?auto_148795 ) ( CLEAR ?auto_148794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148794 )
      ( MAKE-8PILE ?auto_148794 ?auto_148795 ?auto_148796 ?auto_148797 ?auto_148798 ?auto_148799 ?auto_148800 ?auto_148801 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_148811 - BLOCK
      ?auto_148812 - BLOCK
      ?auto_148813 - BLOCK
      ?auto_148814 - BLOCK
      ?auto_148815 - BLOCK
      ?auto_148816 - BLOCK
      ?auto_148817 - BLOCK
      ?auto_148818 - BLOCK
    )
    :vars
    (
      ?auto_148819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148818 ?auto_148819 ) ( not ( = ?auto_148811 ?auto_148812 ) ) ( not ( = ?auto_148811 ?auto_148813 ) ) ( not ( = ?auto_148811 ?auto_148814 ) ) ( not ( = ?auto_148811 ?auto_148815 ) ) ( not ( = ?auto_148811 ?auto_148816 ) ) ( not ( = ?auto_148811 ?auto_148817 ) ) ( not ( = ?auto_148811 ?auto_148818 ) ) ( not ( = ?auto_148811 ?auto_148819 ) ) ( not ( = ?auto_148812 ?auto_148813 ) ) ( not ( = ?auto_148812 ?auto_148814 ) ) ( not ( = ?auto_148812 ?auto_148815 ) ) ( not ( = ?auto_148812 ?auto_148816 ) ) ( not ( = ?auto_148812 ?auto_148817 ) ) ( not ( = ?auto_148812 ?auto_148818 ) ) ( not ( = ?auto_148812 ?auto_148819 ) ) ( not ( = ?auto_148813 ?auto_148814 ) ) ( not ( = ?auto_148813 ?auto_148815 ) ) ( not ( = ?auto_148813 ?auto_148816 ) ) ( not ( = ?auto_148813 ?auto_148817 ) ) ( not ( = ?auto_148813 ?auto_148818 ) ) ( not ( = ?auto_148813 ?auto_148819 ) ) ( not ( = ?auto_148814 ?auto_148815 ) ) ( not ( = ?auto_148814 ?auto_148816 ) ) ( not ( = ?auto_148814 ?auto_148817 ) ) ( not ( = ?auto_148814 ?auto_148818 ) ) ( not ( = ?auto_148814 ?auto_148819 ) ) ( not ( = ?auto_148815 ?auto_148816 ) ) ( not ( = ?auto_148815 ?auto_148817 ) ) ( not ( = ?auto_148815 ?auto_148818 ) ) ( not ( = ?auto_148815 ?auto_148819 ) ) ( not ( = ?auto_148816 ?auto_148817 ) ) ( not ( = ?auto_148816 ?auto_148818 ) ) ( not ( = ?auto_148816 ?auto_148819 ) ) ( not ( = ?auto_148817 ?auto_148818 ) ) ( not ( = ?auto_148817 ?auto_148819 ) ) ( not ( = ?auto_148818 ?auto_148819 ) ) ( ON ?auto_148817 ?auto_148818 ) ( ON ?auto_148816 ?auto_148817 ) ( ON ?auto_148815 ?auto_148816 ) ( ON ?auto_148814 ?auto_148815 ) ( ON ?auto_148813 ?auto_148814 ) ( ON ?auto_148812 ?auto_148813 ) ( ON ?auto_148811 ?auto_148812 ) ( CLEAR ?auto_148811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_148811 )
      ( MAKE-8PILE ?auto_148811 ?auto_148812 ?auto_148813 ?auto_148814 ?auto_148815 ?auto_148816 ?auto_148817 ?auto_148818 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148829 - BLOCK
      ?auto_148830 - BLOCK
      ?auto_148831 - BLOCK
      ?auto_148832 - BLOCK
      ?auto_148833 - BLOCK
      ?auto_148834 - BLOCK
      ?auto_148835 - BLOCK
      ?auto_148836 - BLOCK
      ?auto_148837 - BLOCK
    )
    :vars
    (
      ?auto_148838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148836 ) ( ON ?auto_148837 ?auto_148838 ) ( CLEAR ?auto_148837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148829 ) ( ON ?auto_148830 ?auto_148829 ) ( ON ?auto_148831 ?auto_148830 ) ( ON ?auto_148832 ?auto_148831 ) ( ON ?auto_148833 ?auto_148832 ) ( ON ?auto_148834 ?auto_148833 ) ( ON ?auto_148835 ?auto_148834 ) ( ON ?auto_148836 ?auto_148835 ) ( not ( = ?auto_148829 ?auto_148830 ) ) ( not ( = ?auto_148829 ?auto_148831 ) ) ( not ( = ?auto_148829 ?auto_148832 ) ) ( not ( = ?auto_148829 ?auto_148833 ) ) ( not ( = ?auto_148829 ?auto_148834 ) ) ( not ( = ?auto_148829 ?auto_148835 ) ) ( not ( = ?auto_148829 ?auto_148836 ) ) ( not ( = ?auto_148829 ?auto_148837 ) ) ( not ( = ?auto_148829 ?auto_148838 ) ) ( not ( = ?auto_148830 ?auto_148831 ) ) ( not ( = ?auto_148830 ?auto_148832 ) ) ( not ( = ?auto_148830 ?auto_148833 ) ) ( not ( = ?auto_148830 ?auto_148834 ) ) ( not ( = ?auto_148830 ?auto_148835 ) ) ( not ( = ?auto_148830 ?auto_148836 ) ) ( not ( = ?auto_148830 ?auto_148837 ) ) ( not ( = ?auto_148830 ?auto_148838 ) ) ( not ( = ?auto_148831 ?auto_148832 ) ) ( not ( = ?auto_148831 ?auto_148833 ) ) ( not ( = ?auto_148831 ?auto_148834 ) ) ( not ( = ?auto_148831 ?auto_148835 ) ) ( not ( = ?auto_148831 ?auto_148836 ) ) ( not ( = ?auto_148831 ?auto_148837 ) ) ( not ( = ?auto_148831 ?auto_148838 ) ) ( not ( = ?auto_148832 ?auto_148833 ) ) ( not ( = ?auto_148832 ?auto_148834 ) ) ( not ( = ?auto_148832 ?auto_148835 ) ) ( not ( = ?auto_148832 ?auto_148836 ) ) ( not ( = ?auto_148832 ?auto_148837 ) ) ( not ( = ?auto_148832 ?auto_148838 ) ) ( not ( = ?auto_148833 ?auto_148834 ) ) ( not ( = ?auto_148833 ?auto_148835 ) ) ( not ( = ?auto_148833 ?auto_148836 ) ) ( not ( = ?auto_148833 ?auto_148837 ) ) ( not ( = ?auto_148833 ?auto_148838 ) ) ( not ( = ?auto_148834 ?auto_148835 ) ) ( not ( = ?auto_148834 ?auto_148836 ) ) ( not ( = ?auto_148834 ?auto_148837 ) ) ( not ( = ?auto_148834 ?auto_148838 ) ) ( not ( = ?auto_148835 ?auto_148836 ) ) ( not ( = ?auto_148835 ?auto_148837 ) ) ( not ( = ?auto_148835 ?auto_148838 ) ) ( not ( = ?auto_148836 ?auto_148837 ) ) ( not ( = ?auto_148836 ?auto_148838 ) ) ( not ( = ?auto_148837 ?auto_148838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148837 ?auto_148838 )
      ( !STACK ?auto_148837 ?auto_148836 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148848 - BLOCK
      ?auto_148849 - BLOCK
      ?auto_148850 - BLOCK
      ?auto_148851 - BLOCK
      ?auto_148852 - BLOCK
      ?auto_148853 - BLOCK
      ?auto_148854 - BLOCK
      ?auto_148855 - BLOCK
      ?auto_148856 - BLOCK
    )
    :vars
    (
      ?auto_148857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_148855 ) ( ON ?auto_148856 ?auto_148857 ) ( CLEAR ?auto_148856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_148848 ) ( ON ?auto_148849 ?auto_148848 ) ( ON ?auto_148850 ?auto_148849 ) ( ON ?auto_148851 ?auto_148850 ) ( ON ?auto_148852 ?auto_148851 ) ( ON ?auto_148853 ?auto_148852 ) ( ON ?auto_148854 ?auto_148853 ) ( ON ?auto_148855 ?auto_148854 ) ( not ( = ?auto_148848 ?auto_148849 ) ) ( not ( = ?auto_148848 ?auto_148850 ) ) ( not ( = ?auto_148848 ?auto_148851 ) ) ( not ( = ?auto_148848 ?auto_148852 ) ) ( not ( = ?auto_148848 ?auto_148853 ) ) ( not ( = ?auto_148848 ?auto_148854 ) ) ( not ( = ?auto_148848 ?auto_148855 ) ) ( not ( = ?auto_148848 ?auto_148856 ) ) ( not ( = ?auto_148848 ?auto_148857 ) ) ( not ( = ?auto_148849 ?auto_148850 ) ) ( not ( = ?auto_148849 ?auto_148851 ) ) ( not ( = ?auto_148849 ?auto_148852 ) ) ( not ( = ?auto_148849 ?auto_148853 ) ) ( not ( = ?auto_148849 ?auto_148854 ) ) ( not ( = ?auto_148849 ?auto_148855 ) ) ( not ( = ?auto_148849 ?auto_148856 ) ) ( not ( = ?auto_148849 ?auto_148857 ) ) ( not ( = ?auto_148850 ?auto_148851 ) ) ( not ( = ?auto_148850 ?auto_148852 ) ) ( not ( = ?auto_148850 ?auto_148853 ) ) ( not ( = ?auto_148850 ?auto_148854 ) ) ( not ( = ?auto_148850 ?auto_148855 ) ) ( not ( = ?auto_148850 ?auto_148856 ) ) ( not ( = ?auto_148850 ?auto_148857 ) ) ( not ( = ?auto_148851 ?auto_148852 ) ) ( not ( = ?auto_148851 ?auto_148853 ) ) ( not ( = ?auto_148851 ?auto_148854 ) ) ( not ( = ?auto_148851 ?auto_148855 ) ) ( not ( = ?auto_148851 ?auto_148856 ) ) ( not ( = ?auto_148851 ?auto_148857 ) ) ( not ( = ?auto_148852 ?auto_148853 ) ) ( not ( = ?auto_148852 ?auto_148854 ) ) ( not ( = ?auto_148852 ?auto_148855 ) ) ( not ( = ?auto_148852 ?auto_148856 ) ) ( not ( = ?auto_148852 ?auto_148857 ) ) ( not ( = ?auto_148853 ?auto_148854 ) ) ( not ( = ?auto_148853 ?auto_148855 ) ) ( not ( = ?auto_148853 ?auto_148856 ) ) ( not ( = ?auto_148853 ?auto_148857 ) ) ( not ( = ?auto_148854 ?auto_148855 ) ) ( not ( = ?auto_148854 ?auto_148856 ) ) ( not ( = ?auto_148854 ?auto_148857 ) ) ( not ( = ?auto_148855 ?auto_148856 ) ) ( not ( = ?auto_148855 ?auto_148857 ) ) ( not ( = ?auto_148856 ?auto_148857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_148856 ?auto_148857 )
      ( !STACK ?auto_148856 ?auto_148855 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148867 - BLOCK
      ?auto_148868 - BLOCK
      ?auto_148869 - BLOCK
      ?auto_148870 - BLOCK
      ?auto_148871 - BLOCK
      ?auto_148872 - BLOCK
      ?auto_148873 - BLOCK
      ?auto_148874 - BLOCK
      ?auto_148875 - BLOCK
    )
    :vars
    (
      ?auto_148876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148875 ?auto_148876 ) ( ON-TABLE ?auto_148867 ) ( ON ?auto_148868 ?auto_148867 ) ( ON ?auto_148869 ?auto_148868 ) ( ON ?auto_148870 ?auto_148869 ) ( ON ?auto_148871 ?auto_148870 ) ( ON ?auto_148872 ?auto_148871 ) ( ON ?auto_148873 ?auto_148872 ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148867 ?auto_148869 ) ) ( not ( = ?auto_148867 ?auto_148870 ) ) ( not ( = ?auto_148867 ?auto_148871 ) ) ( not ( = ?auto_148867 ?auto_148872 ) ) ( not ( = ?auto_148867 ?auto_148873 ) ) ( not ( = ?auto_148867 ?auto_148874 ) ) ( not ( = ?auto_148867 ?auto_148875 ) ) ( not ( = ?auto_148867 ?auto_148876 ) ) ( not ( = ?auto_148868 ?auto_148869 ) ) ( not ( = ?auto_148868 ?auto_148870 ) ) ( not ( = ?auto_148868 ?auto_148871 ) ) ( not ( = ?auto_148868 ?auto_148872 ) ) ( not ( = ?auto_148868 ?auto_148873 ) ) ( not ( = ?auto_148868 ?auto_148874 ) ) ( not ( = ?auto_148868 ?auto_148875 ) ) ( not ( = ?auto_148868 ?auto_148876 ) ) ( not ( = ?auto_148869 ?auto_148870 ) ) ( not ( = ?auto_148869 ?auto_148871 ) ) ( not ( = ?auto_148869 ?auto_148872 ) ) ( not ( = ?auto_148869 ?auto_148873 ) ) ( not ( = ?auto_148869 ?auto_148874 ) ) ( not ( = ?auto_148869 ?auto_148875 ) ) ( not ( = ?auto_148869 ?auto_148876 ) ) ( not ( = ?auto_148870 ?auto_148871 ) ) ( not ( = ?auto_148870 ?auto_148872 ) ) ( not ( = ?auto_148870 ?auto_148873 ) ) ( not ( = ?auto_148870 ?auto_148874 ) ) ( not ( = ?auto_148870 ?auto_148875 ) ) ( not ( = ?auto_148870 ?auto_148876 ) ) ( not ( = ?auto_148871 ?auto_148872 ) ) ( not ( = ?auto_148871 ?auto_148873 ) ) ( not ( = ?auto_148871 ?auto_148874 ) ) ( not ( = ?auto_148871 ?auto_148875 ) ) ( not ( = ?auto_148871 ?auto_148876 ) ) ( not ( = ?auto_148872 ?auto_148873 ) ) ( not ( = ?auto_148872 ?auto_148874 ) ) ( not ( = ?auto_148872 ?auto_148875 ) ) ( not ( = ?auto_148872 ?auto_148876 ) ) ( not ( = ?auto_148873 ?auto_148874 ) ) ( not ( = ?auto_148873 ?auto_148875 ) ) ( not ( = ?auto_148873 ?auto_148876 ) ) ( not ( = ?auto_148874 ?auto_148875 ) ) ( not ( = ?auto_148874 ?auto_148876 ) ) ( not ( = ?auto_148875 ?auto_148876 ) ) ( CLEAR ?auto_148873 ) ( ON ?auto_148874 ?auto_148875 ) ( CLEAR ?auto_148874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148867 ?auto_148868 ?auto_148869 ?auto_148870 ?auto_148871 ?auto_148872 ?auto_148873 ?auto_148874 )
      ( MAKE-9PILE ?auto_148867 ?auto_148868 ?auto_148869 ?auto_148870 ?auto_148871 ?auto_148872 ?auto_148873 ?auto_148874 ?auto_148875 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148886 - BLOCK
      ?auto_148887 - BLOCK
      ?auto_148888 - BLOCK
      ?auto_148889 - BLOCK
      ?auto_148890 - BLOCK
      ?auto_148891 - BLOCK
      ?auto_148892 - BLOCK
      ?auto_148893 - BLOCK
      ?auto_148894 - BLOCK
    )
    :vars
    (
      ?auto_148895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148894 ?auto_148895 ) ( ON-TABLE ?auto_148886 ) ( ON ?auto_148887 ?auto_148886 ) ( ON ?auto_148888 ?auto_148887 ) ( ON ?auto_148889 ?auto_148888 ) ( ON ?auto_148890 ?auto_148889 ) ( ON ?auto_148891 ?auto_148890 ) ( ON ?auto_148892 ?auto_148891 ) ( not ( = ?auto_148886 ?auto_148887 ) ) ( not ( = ?auto_148886 ?auto_148888 ) ) ( not ( = ?auto_148886 ?auto_148889 ) ) ( not ( = ?auto_148886 ?auto_148890 ) ) ( not ( = ?auto_148886 ?auto_148891 ) ) ( not ( = ?auto_148886 ?auto_148892 ) ) ( not ( = ?auto_148886 ?auto_148893 ) ) ( not ( = ?auto_148886 ?auto_148894 ) ) ( not ( = ?auto_148886 ?auto_148895 ) ) ( not ( = ?auto_148887 ?auto_148888 ) ) ( not ( = ?auto_148887 ?auto_148889 ) ) ( not ( = ?auto_148887 ?auto_148890 ) ) ( not ( = ?auto_148887 ?auto_148891 ) ) ( not ( = ?auto_148887 ?auto_148892 ) ) ( not ( = ?auto_148887 ?auto_148893 ) ) ( not ( = ?auto_148887 ?auto_148894 ) ) ( not ( = ?auto_148887 ?auto_148895 ) ) ( not ( = ?auto_148888 ?auto_148889 ) ) ( not ( = ?auto_148888 ?auto_148890 ) ) ( not ( = ?auto_148888 ?auto_148891 ) ) ( not ( = ?auto_148888 ?auto_148892 ) ) ( not ( = ?auto_148888 ?auto_148893 ) ) ( not ( = ?auto_148888 ?auto_148894 ) ) ( not ( = ?auto_148888 ?auto_148895 ) ) ( not ( = ?auto_148889 ?auto_148890 ) ) ( not ( = ?auto_148889 ?auto_148891 ) ) ( not ( = ?auto_148889 ?auto_148892 ) ) ( not ( = ?auto_148889 ?auto_148893 ) ) ( not ( = ?auto_148889 ?auto_148894 ) ) ( not ( = ?auto_148889 ?auto_148895 ) ) ( not ( = ?auto_148890 ?auto_148891 ) ) ( not ( = ?auto_148890 ?auto_148892 ) ) ( not ( = ?auto_148890 ?auto_148893 ) ) ( not ( = ?auto_148890 ?auto_148894 ) ) ( not ( = ?auto_148890 ?auto_148895 ) ) ( not ( = ?auto_148891 ?auto_148892 ) ) ( not ( = ?auto_148891 ?auto_148893 ) ) ( not ( = ?auto_148891 ?auto_148894 ) ) ( not ( = ?auto_148891 ?auto_148895 ) ) ( not ( = ?auto_148892 ?auto_148893 ) ) ( not ( = ?auto_148892 ?auto_148894 ) ) ( not ( = ?auto_148892 ?auto_148895 ) ) ( not ( = ?auto_148893 ?auto_148894 ) ) ( not ( = ?auto_148893 ?auto_148895 ) ) ( not ( = ?auto_148894 ?auto_148895 ) ) ( CLEAR ?auto_148892 ) ( ON ?auto_148893 ?auto_148894 ) ( CLEAR ?auto_148893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_148886 ?auto_148887 ?auto_148888 ?auto_148889 ?auto_148890 ?auto_148891 ?auto_148892 ?auto_148893 )
      ( MAKE-9PILE ?auto_148886 ?auto_148887 ?auto_148888 ?auto_148889 ?auto_148890 ?auto_148891 ?auto_148892 ?auto_148893 ?auto_148894 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148905 - BLOCK
      ?auto_148906 - BLOCK
      ?auto_148907 - BLOCK
      ?auto_148908 - BLOCK
      ?auto_148909 - BLOCK
      ?auto_148910 - BLOCK
      ?auto_148911 - BLOCK
      ?auto_148912 - BLOCK
      ?auto_148913 - BLOCK
    )
    :vars
    (
      ?auto_148914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148913 ?auto_148914 ) ( ON-TABLE ?auto_148905 ) ( ON ?auto_148906 ?auto_148905 ) ( ON ?auto_148907 ?auto_148906 ) ( ON ?auto_148908 ?auto_148907 ) ( ON ?auto_148909 ?auto_148908 ) ( ON ?auto_148910 ?auto_148909 ) ( not ( = ?auto_148905 ?auto_148906 ) ) ( not ( = ?auto_148905 ?auto_148907 ) ) ( not ( = ?auto_148905 ?auto_148908 ) ) ( not ( = ?auto_148905 ?auto_148909 ) ) ( not ( = ?auto_148905 ?auto_148910 ) ) ( not ( = ?auto_148905 ?auto_148911 ) ) ( not ( = ?auto_148905 ?auto_148912 ) ) ( not ( = ?auto_148905 ?auto_148913 ) ) ( not ( = ?auto_148905 ?auto_148914 ) ) ( not ( = ?auto_148906 ?auto_148907 ) ) ( not ( = ?auto_148906 ?auto_148908 ) ) ( not ( = ?auto_148906 ?auto_148909 ) ) ( not ( = ?auto_148906 ?auto_148910 ) ) ( not ( = ?auto_148906 ?auto_148911 ) ) ( not ( = ?auto_148906 ?auto_148912 ) ) ( not ( = ?auto_148906 ?auto_148913 ) ) ( not ( = ?auto_148906 ?auto_148914 ) ) ( not ( = ?auto_148907 ?auto_148908 ) ) ( not ( = ?auto_148907 ?auto_148909 ) ) ( not ( = ?auto_148907 ?auto_148910 ) ) ( not ( = ?auto_148907 ?auto_148911 ) ) ( not ( = ?auto_148907 ?auto_148912 ) ) ( not ( = ?auto_148907 ?auto_148913 ) ) ( not ( = ?auto_148907 ?auto_148914 ) ) ( not ( = ?auto_148908 ?auto_148909 ) ) ( not ( = ?auto_148908 ?auto_148910 ) ) ( not ( = ?auto_148908 ?auto_148911 ) ) ( not ( = ?auto_148908 ?auto_148912 ) ) ( not ( = ?auto_148908 ?auto_148913 ) ) ( not ( = ?auto_148908 ?auto_148914 ) ) ( not ( = ?auto_148909 ?auto_148910 ) ) ( not ( = ?auto_148909 ?auto_148911 ) ) ( not ( = ?auto_148909 ?auto_148912 ) ) ( not ( = ?auto_148909 ?auto_148913 ) ) ( not ( = ?auto_148909 ?auto_148914 ) ) ( not ( = ?auto_148910 ?auto_148911 ) ) ( not ( = ?auto_148910 ?auto_148912 ) ) ( not ( = ?auto_148910 ?auto_148913 ) ) ( not ( = ?auto_148910 ?auto_148914 ) ) ( not ( = ?auto_148911 ?auto_148912 ) ) ( not ( = ?auto_148911 ?auto_148913 ) ) ( not ( = ?auto_148911 ?auto_148914 ) ) ( not ( = ?auto_148912 ?auto_148913 ) ) ( not ( = ?auto_148912 ?auto_148914 ) ) ( not ( = ?auto_148913 ?auto_148914 ) ) ( ON ?auto_148912 ?auto_148913 ) ( CLEAR ?auto_148910 ) ( ON ?auto_148911 ?auto_148912 ) ( CLEAR ?auto_148911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148905 ?auto_148906 ?auto_148907 ?auto_148908 ?auto_148909 ?auto_148910 ?auto_148911 )
      ( MAKE-9PILE ?auto_148905 ?auto_148906 ?auto_148907 ?auto_148908 ?auto_148909 ?auto_148910 ?auto_148911 ?auto_148912 ?auto_148913 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148924 - BLOCK
      ?auto_148925 - BLOCK
      ?auto_148926 - BLOCK
      ?auto_148927 - BLOCK
      ?auto_148928 - BLOCK
      ?auto_148929 - BLOCK
      ?auto_148930 - BLOCK
      ?auto_148931 - BLOCK
      ?auto_148932 - BLOCK
    )
    :vars
    (
      ?auto_148933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148932 ?auto_148933 ) ( ON-TABLE ?auto_148924 ) ( ON ?auto_148925 ?auto_148924 ) ( ON ?auto_148926 ?auto_148925 ) ( ON ?auto_148927 ?auto_148926 ) ( ON ?auto_148928 ?auto_148927 ) ( ON ?auto_148929 ?auto_148928 ) ( not ( = ?auto_148924 ?auto_148925 ) ) ( not ( = ?auto_148924 ?auto_148926 ) ) ( not ( = ?auto_148924 ?auto_148927 ) ) ( not ( = ?auto_148924 ?auto_148928 ) ) ( not ( = ?auto_148924 ?auto_148929 ) ) ( not ( = ?auto_148924 ?auto_148930 ) ) ( not ( = ?auto_148924 ?auto_148931 ) ) ( not ( = ?auto_148924 ?auto_148932 ) ) ( not ( = ?auto_148924 ?auto_148933 ) ) ( not ( = ?auto_148925 ?auto_148926 ) ) ( not ( = ?auto_148925 ?auto_148927 ) ) ( not ( = ?auto_148925 ?auto_148928 ) ) ( not ( = ?auto_148925 ?auto_148929 ) ) ( not ( = ?auto_148925 ?auto_148930 ) ) ( not ( = ?auto_148925 ?auto_148931 ) ) ( not ( = ?auto_148925 ?auto_148932 ) ) ( not ( = ?auto_148925 ?auto_148933 ) ) ( not ( = ?auto_148926 ?auto_148927 ) ) ( not ( = ?auto_148926 ?auto_148928 ) ) ( not ( = ?auto_148926 ?auto_148929 ) ) ( not ( = ?auto_148926 ?auto_148930 ) ) ( not ( = ?auto_148926 ?auto_148931 ) ) ( not ( = ?auto_148926 ?auto_148932 ) ) ( not ( = ?auto_148926 ?auto_148933 ) ) ( not ( = ?auto_148927 ?auto_148928 ) ) ( not ( = ?auto_148927 ?auto_148929 ) ) ( not ( = ?auto_148927 ?auto_148930 ) ) ( not ( = ?auto_148927 ?auto_148931 ) ) ( not ( = ?auto_148927 ?auto_148932 ) ) ( not ( = ?auto_148927 ?auto_148933 ) ) ( not ( = ?auto_148928 ?auto_148929 ) ) ( not ( = ?auto_148928 ?auto_148930 ) ) ( not ( = ?auto_148928 ?auto_148931 ) ) ( not ( = ?auto_148928 ?auto_148932 ) ) ( not ( = ?auto_148928 ?auto_148933 ) ) ( not ( = ?auto_148929 ?auto_148930 ) ) ( not ( = ?auto_148929 ?auto_148931 ) ) ( not ( = ?auto_148929 ?auto_148932 ) ) ( not ( = ?auto_148929 ?auto_148933 ) ) ( not ( = ?auto_148930 ?auto_148931 ) ) ( not ( = ?auto_148930 ?auto_148932 ) ) ( not ( = ?auto_148930 ?auto_148933 ) ) ( not ( = ?auto_148931 ?auto_148932 ) ) ( not ( = ?auto_148931 ?auto_148933 ) ) ( not ( = ?auto_148932 ?auto_148933 ) ) ( ON ?auto_148931 ?auto_148932 ) ( CLEAR ?auto_148929 ) ( ON ?auto_148930 ?auto_148931 ) ( CLEAR ?auto_148930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_148924 ?auto_148925 ?auto_148926 ?auto_148927 ?auto_148928 ?auto_148929 ?auto_148930 )
      ( MAKE-9PILE ?auto_148924 ?auto_148925 ?auto_148926 ?auto_148927 ?auto_148928 ?auto_148929 ?auto_148930 ?auto_148931 ?auto_148932 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148943 - BLOCK
      ?auto_148944 - BLOCK
      ?auto_148945 - BLOCK
      ?auto_148946 - BLOCK
      ?auto_148947 - BLOCK
      ?auto_148948 - BLOCK
      ?auto_148949 - BLOCK
      ?auto_148950 - BLOCK
      ?auto_148951 - BLOCK
    )
    :vars
    (
      ?auto_148952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148951 ?auto_148952 ) ( ON-TABLE ?auto_148943 ) ( ON ?auto_148944 ?auto_148943 ) ( ON ?auto_148945 ?auto_148944 ) ( ON ?auto_148946 ?auto_148945 ) ( ON ?auto_148947 ?auto_148946 ) ( not ( = ?auto_148943 ?auto_148944 ) ) ( not ( = ?auto_148943 ?auto_148945 ) ) ( not ( = ?auto_148943 ?auto_148946 ) ) ( not ( = ?auto_148943 ?auto_148947 ) ) ( not ( = ?auto_148943 ?auto_148948 ) ) ( not ( = ?auto_148943 ?auto_148949 ) ) ( not ( = ?auto_148943 ?auto_148950 ) ) ( not ( = ?auto_148943 ?auto_148951 ) ) ( not ( = ?auto_148943 ?auto_148952 ) ) ( not ( = ?auto_148944 ?auto_148945 ) ) ( not ( = ?auto_148944 ?auto_148946 ) ) ( not ( = ?auto_148944 ?auto_148947 ) ) ( not ( = ?auto_148944 ?auto_148948 ) ) ( not ( = ?auto_148944 ?auto_148949 ) ) ( not ( = ?auto_148944 ?auto_148950 ) ) ( not ( = ?auto_148944 ?auto_148951 ) ) ( not ( = ?auto_148944 ?auto_148952 ) ) ( not ( = ?auto_148945 ?auto_148946 ) ) ( not ( = ?auto_148945 ?auto_148947 ) ) ( not ( = ?auto_148945 ?auto_148948 ) ) ( not ( = ?auto_148945 ?auto_148949 ) ) ( not ( = ?auto_148945 ?auto_148950 ) ) ( not ( = ?auto_148945 ?auto_148951 ) ) ( not ( = ?auto_148945 ?auto_148952 ) ) ( not ( = ?auto_148946 ?auto_148947 ) ) ( not ( = ?auto_148946 ?auto_148948 ) ) ( not ( = ?auto_148946 ?auto_148949 ) ) ( not ( = ?auto_148946 ?auto_148950 ) ) ( not ( = ?auto_148946 ?auto_148951 ) ) ( not ( = ?auto_148946 ?auto_148952 ) ) ( not ( = ?auto_148947 ?auto_148948 ) ) ( not ( = ?auto_148947 ?auto_148949 ) ) ( not ( = ?auto_148947 ?auto_148950 ) ) ( not ( = ?auto_148947 ?auto_148951 ) ) ( not ( = ?auto_148947 ?auto_148952 ) ) ( not ( = ?auto_148948 ?auto_148949 ) ) ( not ( = ?auto_148948 ?auto_148950 ) ) ( not ( = ?auto_148948 ?auto_148951 ) ) ( not ( = ?auto_148948 ?auto_148952 ) ) ( not ( = ?auto_148949 ?auto_148950 ) ) ( not ( = ?auto_148949 ?auto_148951 ) ) ( not ( = ?auto_148949 ?auto_148952 ) ) ( not ( = ?auto_148950 ?auto_148951 ) ) ( not ( = ?auto_148950 ?auto_148952 ) ) ( not ( = ?auto_148951 ?auto_148952 ) ) ( ON ?auto_148950 ?auto_148951 ) ( ON ?auto_148949 ?auto_148950 ) ( CLEAR ?auto_148947 ) ( ON ?auto_148948 ?auto_148949 ) ( CLEAR ?auto_148948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148943 ?auto_148944 ?auto_148945 ?auto_148946 ?auto_148947 ?auto_148948 )
      ( MAKE-9PILE ?auto_148943 ?auto_148944 ?auto_148945 ?auto_148946 ?auto_148947 ?auto_148948 ?auto_148949 ?auto_148950 ?auto_148951 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148962 - BLOCK
      ?auto_148963 - BLOCK
      ?auto_148964 - BLOCK
      ?auto_148965 - BLOCK
      ?auto_148966 - BLOCK
      ?auto_148967 - BLOCK
      ?auto_148968 - BLOCK
      ?auto_148969 - BLOCK
      ?auto_148970 - BLOCK
    )
    :vars
    (
      ?auto_148971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148970 ?auto_148971 ) ( ON-TABLE ?auto_148962 ) ( ON ?auto_148963 ?auto_148962 ) ( ON ?auto_148964 ?auto_148963 ) ( ON ?auto_148965 ?auto_148964 ) ( ON ?auto_148966 ?auto_148965 ) ( not ( = ?auto_148962 ?auto_148963 ) ) ( not ( = ?auto_148962 ?auto_148964 ) ) ( not ( = ?auto_148962 ?auto_148965 ) ) ( not ( = ?auto_148962 ?auto_148966 ) ) ( not ( = ?auto_148962 ?auto_148967 ) ) ( not ( = ?auto_148962 ?auto_148968 ) ) ( not ( = ?auto_148962 ?auto_148969 ) ) ( not ( = ?auto_148962 ?auto_148970 ) ) ( not ( = ?auto_148962 ?auto_148971 ) ) ( not ( = ?auto_148963 ?auto_148964 ) ) ( not ( = ?auto_148963 ?auto_148965 ) ) ( not ( = ?auto_148963 ?auto_148966 ) ) ( not ( = ?auto_148963 ?auto_148967 ) ) ( not ( = ?auto_148963 ?auto_148968 ) ) ( not ( = ?auto_148963 ?auto_148969 ) ) ( not ( = ?auto_148963 ?auto_148970 ) ) ( not ( = ?auto_148963 ?auto_148971 ) ) ( not ( = ?auto_148964 ?auto_148965 ) ) ( not ( = ?auto_148964 ?auto_148966 ) ) ( not ( = ?auto_148964 ?auto_148967 ) ) ( not ( = ?auto_148964 ?auto_148968 ) ) ( not ( = ?auto_148964 ?auto_148969 ) ) ( not ( = ?auto_148964 ?auto_148970 ) ) ( not ( = ?auto_148964 ?auto_148971 ) ) ( not ( = ?auto_148965 ?auto_148966 ) ) ( not ( = ?auto_148965 ?auto_148967 ) ) ( not ( = ?auto_148965 ?auto_148968 ) ) ( not ( = ?auto_148965 ?auto_148969 ) ) ( not ( = ?auto_148965 ?auto_148970 ) ) ( not ( = ?auto_148965 ?auto_148971 ) ) ( not ( = ?auto_148966 ?auto_148967 ) ) ( not ( = ?auto_148966 ?auto_148968 ) ) ( not ( = ?auto_148966 ?auto_148969 ) ) ( not ( = ?auto_148966 ?auto_148970 ) ) ( not ( = ?auto_148966 ?auto_148971 ) ) ( not ( = ?auto_148967 ?auto_148968 ) ) ( not ( = ?auto_148967 ?auto_148969 ) ) ( not ( = ?auto_148967 ?auto_148970 ) ) ( not ( = ?auto_148967 ?auto_148971 ) ) ( not ( = ?auto_148968 ?auto_148969 ) ) ( not ( = ?auto_148968 ?auto_148970 ) ) ( not ( = ?auto_148968 ?auto_148971 ) ) ( not ( = ?auto_148969 ?auto_148970 ) ) ( not ( = ?auto_148969 ?auto_148971 ) ) ( not ( = ?auto_148970 ?auto_148971 ) ) ( ON ?auto_148969 ?auto_148970 ) ( ON ?auto_148968 ?auto_148969 ) ( CLEAR ?auto_148966 ) ( ON ?auto_148967 ?auto_148968 ) ( CLEAR ?auto_148967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_148962 ?auto_148963 ?auto_148964 ?auto_148965 ?auto_148966 ?auto_148967 )
      ( MAKE-9PILE ?auto_148962 ?auto_148963 ?auto_148964 ?auto_148965 ?auto_148966 ?auto_148967 ?auto_148968 ?auto_148969 ?auto_148970 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_148981 - BLOCK
      ?auto_148982 - BLOCK
      ?auto_148983 - BLOCK
      ?auto_148984 - BLOCK
      ?auto_148985 - BLOCK
      ?auto_148986 - BLOCK
      ?auto_148987 - BLOCK
      ?auto_148988 - BLOCK
      ?auto_148989 - BLOCK
    )
    :vars
    (
      ?auto_148990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_148989 ?auto_148990 ) ( ON-TABLE ?auto_148981 ) ( ON ?auto_148982 ?auto_148981 ) ( ON ?auto_148983 ?auto_148982 ) ( ON ?auto_148984 ?auto_148983 ) ( not ( = ?auto_148981 ?auto_148982 ) ) ( not ( = ?auto_148981 ?auto_148983 ) ) ( not ( = ?auto_148981 ?auto_148984 ) ) ( not ( = ?auto_148981 ?auto_148985 ) ) ( not ( = ?auto_148981 ?auto_148986 ) ) ( not ( = ?auto_148981 ?auto_148987 ) ) ( not ( = ?auto_148981 ?auto_148988 ) ) ( not ( = ?auto_148981 ?auto_148989 ) ) ( not ( = ?auto_148981 ?auto_148990 ) ) ( not ( = ?auto_148982 ?auto_148983 ) ) ( not ( = ?auto_148982 ?auto_148984 ) ) ( not ( = ?auto_148982 ?auto_148985 ) ) ( not ( = ?auto_148982 ?auto_148986 ) ) ( not ( = ?auto_148982 ?auto_148987 ) ) ( not ( = ?auto_148982 ?auto_148988 ) ) ( not ( = ?auto_148982 ?auto_148989 ) ) ( not ( = ?auto_148982 ?auto_148990 ) ) ( not ( = ?auto_148983 ?auto_148984 ) ) ( not ( = ?auto_148983 ?auto_148985 ) ) ( not ( = ?auto_148983 ?auto_148986 ) ) ( not ( = ?auto_148983 ?auto_148987 ) ) ( not ( = ?auto_148983 ?auto_148988 ) ) ( not ( = ?auto_148983 ?auto_148989 ) ) ( not ( = ?auto_148983 ?auto_148990 ) ) ( not ( = ?auto_148984 ?auto_148985 ) ) ( not ( = ?auto_148984 ?auto_148986 ) ) ( not ( = ?auto_148984 ?auto_148987 ) ) ( not ( = ?auto_148984 ?auto_148988 ) ) ( not ( = ?auto_148984 ?auto_148989 ) ) ( not ( = ?auto_148984 ?auto_148990 ) ) ( not ( = ?auto_148985 ?auto_148986 ) ) ( not ( = ?auto_148985 ?auto_148987 ) ) ( not ( = ?auto_148985 ?auto_148988 ) ) ( not ( = ?auto_148985 ?auto_148989 ) ) ( not ( = ?auto_148985 ?auto_148990 ) ) ( not ( = ?auto_148986 ?auto_148987 ) ) ( not ( = ?auto_148986 ?auto_148988 ) ) ( not ( = ?auto_148986 ?auto_148989 ) ) ( not ( = ?auto_148986 ?auto_148990 ) ) ( not ( = ?auto_148987 ?auto_148988 ) ) ( not ( = ?auto_148987 ?auto_148989 ) ) ( not ( = ?auto_148987 ?auto_148990 ) ) ( not ( = ?auto_148988 ?auto_148989 ) ) ( not ( = ?auto_148988 ?auto_148990 ) ) ( not ( = ?auto_148989 ?auto_148990 ) ) ( ON ?auto_148988 ?auto_148989 ) ( ON ?auto_148987 ?auto_148988 ) ( ON ?auto_148986 ?auto_148987 ) ( CLEAR ?auto_148984 ) ( ON ?auto_148985 ?auto_148986 ) ( CLEAR ?auto_148985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_148981 ?auto_148982 ?auto_148983 ?auto_148984 ?auto_148985 )
      ( MAKE-9PILE ?auto_148981 ?auto_148982 ?auto_148983 ?auto_148984 ?auto_148985 ?auto_148986 ?auto_148987 ?auto_148988 ?auto_148989 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149000 - BLOCK
      ?auto_149001 - BLOCK
      ?auto_149002 - BLOCK
      ?auto_149003 - BLOCK
      ?auto_149004 - BLOCK
      ?auto_149005 - BLOCK
      ?auto_149006 - BLOCK
      ?auto_149007 - BLOCK
      ?auto_149008 - BLOCK
    )
    :vars
    (
      ?auto_149009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149008 ?auto_149009 ) ( ON-TABLE ?auto_149000 ) ( ON ?auto_149001 ?auto_149000 ) ( ON ?auto_149002 ?auto_149001 ) ( ON ?auto_149003 ?auto_149002 ) ( not ( = ?auto_149000 ?auto_149001 ) ) ( not ( = ?auto_149000 ?auto_149002 ) ) ( not ( = ?auto_149000 ?auto_149003 ) ) ( not ( = ?auto_149000 ?auto_149004 ) ) ( not ( = ?auto_149000 ?auto_149005 ) ) ( not ( = ?auto_149000 ?auto_149006 ) ) ( not ( = ?auto_149000 ?auto_149007 ) ) ( not ( = ?auto_149000 ?auto_149008 ) ) ( not ( = ?auto_149000 ?auto_149009 ) ) ( not ( = ?auto_149001 ?auto_149002 ) ) ( not ( = ?auto_149001 ?auto_149003 ) ) ( not ( = ?auto_149001 ?auto_149004 ) ) ( not ( = ?auto_149001 ?auto_149005 ) ) ( not ( = ?auto_149001 ?auto_149006 ) ) ( not ( = ?auto_149001 ?auto_149007 ) ) ( not ( = ?auto_149001 ?auto_149008 ) ) ( not ( = ?auto_149001 ?auto_149009 ) ) ( not ( = ?auto_149002 ?auto_149003 ) ) ( not ( = ?auto_149002 ?auto_149004 ) ) ( not ( = ?auto_149002 ?auto_149005 ) ) ( not ( = ?auto_149002 ?auto_149006 ) ) ( not ( = ?auto_149002 ?auto_149007 ) ) ( not ( = ?auto_149002 ?auto_149008 ) ) ( not ( = ?auto_149002 ?auto_149009 ) ) ( not ( = ?auto_149003 ?auto_149004 ) ) ( not ( = ?auto_149003 ?auto_149005 ) ) ( not ( = ?auto_149003 ?auto_149006 ) ) ( not ( = ?auto_149003 ?auto_149007 ) ) ( not ( = ?auto_149003 ?auto_149008 ) ) ( not ( = ?auto_149003 ?auto_149009 ) ) ( not ( = ?auto_149004 ?auto_149005 ) ) ( not ( = ?auto_149004 ?auto_149006 ) ) ( not ( = ?auto_149004 ?auto_149007 ) ) ( not ( = ?auto_149004 ?auto_149008 ) ) ( not ( = ?auto_149004 ?auto_149009 ) ) ( not ( = ?auto_149005 ?auto_149006 ) ) ( not ( = ?auto_149005 ?auto_149007 ) ) ( not ( = ?auto_149005 ?auto_149008 ) ) ( not ( = ?auto_149005 ?auto_149009 ) ) ( not ( = ?auto_149006 ?auto_149007 ) ) ( not ( = ?auto_149006 ?auto_149008 ) ) ( not ( = ?auto_149006 ?auto_149009 ) ) ( not ( = ?auto_149007 ?auto_149008 ) ) ( not ( = ?auto_149007 ?auto_149009 ) ) ( not ( = ?auto_149008 ?auto_149009 ) ) ( ON ?auto_149007 ?auto_149008 ) ( ON ?auto_149006 ?auto_149007 ) ( ON ?auto_149005 ?auto_149006 ) ( CLEAR ?auto_149003 ) ( ON ?auto_149004 ?auto_149005 ) ( CLEAR ?auto_149004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149000 ?auto_149001 ?auto_149002 ?auto_149003 ?auto_149004 )
      ( MAKE-9PILE ?auto_149000 ?auto_149001 ?auto_149002 ?auto_149003 ?auto_149004 ?auto_149005 ?auto_149006 ?auto_149007 ?auto_149008 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149019 - BLOCK
      ?auto_149020 - BLOCK
      ?auto_149021 - BLOCK
      ?auto_149022 - BLOCK
      ?auto_149023 - BLOCK
      ?auto_149024 - BLOCK
      ?auto_149025 - BLOCK
      ?auto_149026 - BLOCK
      ?auto_149027 - BLOCK
    )
    :vars
    (
      ?auto_149028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149027 ?auto_149028 ) ( ON-TABLE ?auto_149019 ) ( ON ?auto_149020 ?auto_149019 ) ( ON ?auto_149021 ?auto_149020 ) ( not ( = ?auto_149019 ?auto_149020 ) ) ( not ( = ?auto_149019 ?auto_149021 ) ) ( not ( = ?auto_149019 ?auto_149022 ) ) ( not ( = ?auto_149019 ?auto_149023 ) ) ( not ( = ?auto_149019 ?auto_149024 ) ) ( not ( = ?auto_149019 ?auto_149025 ) ) ( not ( = ?auto_149019 ?auto_149026 ) ) ( not ( = ?auto_149019 ?auto_149027 ) ) ( not ( = ?auto_149019 ?auto_149028 ) ) ( not ( = ?auto_149020 ?auto_149021 ) ) ( not ( = ?auto_149020 ?auto_149022 ) ) ( not ( = ?auto_149020 ?auto_149023 ) ) ( not ( = ?auto_149020 ?auto_149024 ) ) ( not ( = ?auto_149020 ?auto_149025 ) ) ( not ( = ?auto_149020 ?auto_149026 ) ) ( not ( = ?auto_149020 ?auto_149027 ) ) ( not ( = ?auto_149020 ?auto_149028 ) ) ( not ( = ?auto_149021 ?auto_149022 ) ) ( not ( = ?auto_149021 ?auto_149023 ) ) ( not ( = ?auto_149021 ?auto_149024 ) ) ( not ( = ?auto_149021 ?auto_149025 ) ) ( not ( = ?auto_149021 ?auto_149026 ) ) ( not ( = ?auto_149021 ?auto_149027 ) ) ( not ( = ?auto_149021 ?auto_149028 ) ) ( not ( = ?auto_149022 ?auto_149023 ) ) ( not ( = ?auto_149022 ?auto_149024 ) ) ( not ( = ?auto_149022 ?auto_149025 ) ) ( not ( = ?auto_149022 ?auto_149026 ) ) ( not ( = ?auto_149022 ?auto_149027 ) ) ( not ( = ?auto_149022 ?auto_149028 ) ) ( not ( = ?auto_149023 ?auto_149024 ) ) ( not ( = ?auto_149023 ?auto_149025 ) ) ( not ( = ?auto_149023 ?auto_149026 ) ) ( not ( = ?auto_149023 ?auto_149027 ) ) ( not ( = ?auto_149023 ?auto_149028 ) ) ( not ( = ?auto_149024 ?auto_149025 ) ) ( not ( = ?auto_149024 ?auto_149026 ) ) ( not ( = ?auto_149024 ?auto_149027 ) ) ( not ( = ?auto_149024 ?auto_149028 ) ) ( not ( = ?auto_149025 ?auto_149026 ) ) ( not ( = ?auto_149025 ?auto_149027 ) ) ( not ( = ?auto_149025 ?auto_149028 ) ) ( not ( = ?auto_149026 ?auto_149027 ) ) ( not ( = ?auto_149026 ?auto_149028 ) ) ( not ( = ?auto_149027 ?auto_149028 ) ) ( ON ?auto_149026 ?auto_149027 ) ( ON ?auto_149025 ?auto_149026 ) ( ON ?auto_149024 ?auto_149025 ) ( ON ?auto_149023 ?auto_149024 ) ( CLEAR ?auto_149021 ) ( ON ?auto_149022 ?auto_149023 ) ( CLEAR ?auto_149022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149019 ?auto_149020 ?auto_149021 ?auto_149022 )
      ( MAKE-9PILE ?auto_149019 ?auto_149020 ?auto_149021 ?auto_149022 ?auto_149023 ?auto_149024 ?auto_149025 ?auto_149026 ?auto_149027 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149038 - BLOCK
      ?auto_149039 - BLOCK
      ?auto_149040 - BLOCK
      ?auto_149041 - BLOCK
      ?auto_149042 - BLOCK
      ?auto_149043 - BLOCK
      ?auto_149044 - BLOCK
      ?auto_149045 - BLOCK
      ?auto_149046 - BLOCK
    )
    :vars
    (
      ?auto_149047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149046 ?auto_149047 ) ( ON-TABLE ?auto_149038 ) ( ON ?auto_149039 ?auto_149038 ) ( ON ?auto_149040 ?auto_149039 ) ( not ( = ?auto_149038 ?auto_149039 ) ) ( not ( = ?auto_149038 ?auto_149040 ) ) ( not ( = ?auto_149038 ?auto_149041 ) ) ( not ( = ?auto_149038 ?auto_149042 ) ) ( not ( = ?auto_149038 ?auto_149043 ) ) ( not ( = ?auto_149038 ?auto_149044 ) ) ( not ( = ?auto_149038 ?auto_149045 ) ) ( not ( = ?auto_149038 ?auto_149046 ) ) ( not ( = ?auto_149038 ?auto_149047 ) ) ( not ( = ?auto_149039 ?auto_149040 ) ) ( not ( = ?auto_149039 ?auto_149041 ) ) ( not ( = ?auto_149039 ?auto_149042 ) ) ( not ( = ?auto_149039 ?auto_149043 ) ) ( not ( = ?auto_149039 ?auto_149044 ) ) ( not ( = ?auto_149039 ?auto_149045 ) ) ( not ( = ?auto_149039 ?auto_149046 ) ) ( not ( = ?auto_149039 ?auto_149047 ) ) ( not ( = ?auto_149040 ?auto_149041 ) ) ( not ( = ?auto_149040 ?auto_149042 ) ) ( not ( = ?auto_149040 ?auto_149043 ) ) ( not ( = ?auto_149040 ?auto_149044 ) ) ( not ( = ?auto_149040 ?auto_149045 ) ) ( not ( = ?auto_149040 ?auto_149046 ) ) ( not ( = ?auto_149040 ?auto_149047 ) ) ( not ( = ?auto_149041 ?auto_149042 ) ) ( not ( = ?auto_149041 ?auto_149043 ) ) ( not ( = ?auto_149041 ?auto_149044 ) ) ( not ( = ?auto_149041 ?auto_149045 ) ) ( not ( = ?auto_149041 ?auto_149046 ) ) ( not ( = ?auto_149041 ?auto_149047 ) ) ( not ( = ?auto_149042 ?auto_149043 ) ) ( not ( = ?auto_149042 ?auto_149044 ) ) ( not ( = ?auto_149042 ?auto_149045 ) ) ( not ( = ?auto_149042 ?auto_149046 ) ) ( not ( = ?auto_149042 ?auto_149047 ) ) ( not ( = ?auto_149043 ?auto_149044 ) ) ( not ( = ?auto_149043 ?auto_149045 ) ) ( not ( = ?auto_149043 ?auto_149046 ) ) ( not ( = ?auto_149043 ?auto_149047 ) ) ( not ( = ?auto_149044 ?auto_149045 ) ) ( not ( = ?auto_149044 ?auto_149046 ) ) ( not ( = ?auto_149044 ?auto_149047 ) ) ( not ( = ?auto_149045 ?auto_149046 ) ) ( not ( = ?auto_149045 ?auto_149047 ) ) ( not ( = ?auto_149046 ?auto_149047 ) ) ( ON ?auto_149045 ?auto_149046 ) ( ON ?auto_149044 ?auto_149045 ) ( ON ?auto_149043 ?auto_149044 ) ( ON ?auto_149042 ?auto_149043 ) ( CLEAR ?auto_149040 ) ( ON ?auto_149041 ?auto_149042 ) ( CLEAR ?auto_149041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149038 ?auto_149039 ?auto_149040 ?auto_149041 )
      ( MAKE-9PILE ?auto_149038 ?auto_149039 ?auto_149040 ?auto_149041 ?auto_149042 ?auto_149043 ?auto_149044 ?auto_149045 ?auto_149046 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149057 - BLOCK
      ?auto_149058 - BLOCK
      ?auto_149059 - BLOCK
      ?auto_149060 - BLOCK
      ?auto_149061 - BLOCK
      ?auto_149062 - BLOCK
      ?auto_149063 - BLOCK
      ?auto_149064 - BLOCK
      ?auto_149065 - BLOCK
    )
    :vars
    (
      ?auto_149066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149065 ?auto_149066 ) ( ON-TABLE ?auto_149057 ) ( ON ?auto_149058 ?auto_149057 ) ( not ( = ?auto_149057 ?auto_149058 ) ) ( not ( = ?auto_149057 ?auto_149059 ) ) ( not ( = ?auto_149057 ?auto_149060 ) ) ( not ( = ?auto_149057 ?auto_149061 ) ) ( not ( = ?auto_149057 ?auto_149062 ) ) ( not ( = ?auto_149057 ?auto_149063 ) ) ( not ( = ?auto_149057 ?auto_149064 ) ) ( not ( = ?auto_149057 ?auto_149065 ) ) ( not ( = ?auto_149057 ?auto_149066 ) ) ( not ( = ?auto_149058 ?auto_149059 ) ) ( not ( = ?auto_149058 ?auto_149060 ) ) ( not ( = ?auto_149058 ?auto_149061 ) ) ( not ( = ?auto_149058 ?auto_149062 ) ) ( not ( = ?auto_149058 ?auto_149063 ) ) ( not ( = ?auto_149058 ?auto_149064 ) ) ( not ( = ?auto_149058 ?auto_149065 ) ) ( not ( = ?auto_149058 ?auto_149066 ) ) ( not ( = ?auto_149059 ?auto_149060 ) ) ( not ( = ?auto_149059 ?auto_149061 ) ) ( not ( = ?auto_149059 ?auto_149062 ) ) ( not ( = ?auto_149059 ?auto_149063 ) ) ( not ( = ?auto_149059 ?auto_149064 ) ) ( not ( = ?auto_149059 ?auto_149065 ) ) ( not ( = ?auto_149059 ?auto_149066 ) ) ( not ( = ?auto_149060 ?auto_149061 ) ) ( not ( = ?auto_149060 ?auto_149062 ) ) ( not ( = ?auto_149060 ?auto_149063 ) ) ( not ( = ?auto_149060 ?auto_149064 ) ) ( not ( = ?auto_149060 ?auto_149065 ) ) ( not ( = ?auto_149060 ?auto_149066 ) ) ( not ( = ?auto_149061 ?auto_149062 ) ) ( not ( = ?auto_149061 ?auto_149063 ) ) ( not ( = ?auto_149061 ?auto_149064 ) ) ( not ( = ?auto_149061 ?auto_149065 ) ) ( not ( = ?auto_149061 ?auto_149066 ) ) ( not ( = ?auto_149062 ?auto_149063 ) ) ( not ( = ?auto_149062 ?auto_149064 ) ) ( not ( = ?auto_149062 ?auto_149065 ) ) ( not ( = ?auto_149062 ?auto_149066 ) ) ( not ( = ?auto_149063 ?auto_149064 ) ) ( not ( = ?auto_149063 ?auto_149065 ) ) ( not ( = ?auto_149063 ?auto_149066 ) ) ( not ( = ?auto_149064 ?auto_149065 ) ) ( not ( = ?auto_149064 ?auto_149066 ) ) ( not ( = ?auto_149065 ?auto_149066 ) ) ( ON ?auto_149064 ?auto_149065 ) ( ON ?auto_149063 ?auto_149064 ) ( ON ?auto_149062 ?auto_149063 ) ( ON ?auto_149061 ?auto_149062 ) ( ON ?auto_149060 ?auto_149061 ) ( CLEAR ?auto_149058 ) ( ON ?auto_149059 ?auto_149060 ) ( CLEAR ?auto_149059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149057 ?auto_149058 ?auto_149059 )
      ( MAKE-9PILE ?auto_149057 ?auto_149058 ?auto_149059 ?auto_149060 ?auto_149061 ?auto_149062 ?auto_149063 ?auto_149064 ?auto_149065 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149076 - BLOCK
      ?auto_149077 - BLOCK
      ?auto_149078 - BLOCK
      ?auto_149079 - BLOCK
      ?auto_149080 - BLOCK
      ?auto_149081 - BLOCK
      ?auto_149082 - BLOCK
      ?auto_149083 - BLOCK
      ?auto_149084 - BLOCK
    )
    :vars
    (
      ?auto_149085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149084 ?auto_149085 ) ( ON-TABLE ?auto_149076 ) ( ON ?auto_149077 ?auto_149076 ) ( not ( = ?auto_149076 ?auto_149077 ) ) ( not ( = ?auto_149076 ?auto_149078 ) ) ( not ( = ?auto_149076 ?auto_149079 ) ) ( not ( = ?auto_149076 ?auto_149080 ) ) ( not ( = ?auto_149076 ?auto_149081 ) ) ( not ( = ?auto_149076 ?auto_149082 ) ) ( not ( = ?auto_149076 ?auto_149083 ) ) ( not ( = ?auto_149076 ?auto_149084 ) ) ( not ( = ?auto_149076 ?auto_149085 ) ) ( not ( = ?auto_149077 ?auto_149078 ) ) ( not ( = ?auto_149077 ?auto_149079 ) ) ( not ( = ?auto_149077 ?auto_149080 ) ) ( not ( = ?auto_149077 ?auto_149081 ) ) ( not ( = ?auto_149077 ?auto_149082 ) ) ( not ( = ?auto_149077 ?auto_149083 ) ) ( not ( = ?auto_149077 ?auto_149084 ) ) ( not ( = ?auto_149077 ?auto_149085 ) ) ( not ( = ?auto_149078 ?auto_149079 ) ) ( not ( = ?auto_149078 ?auto_149080 ) ) ( not ( = ?auto_149078 ?auto_149081 ) ) ( not ( = ?auto_149078 ?auto_149082 ) ) ( not ( = ?auto_149078 ?auto_149083 ) ) ( not ( = ?auto_149078 ?auto_149084 ) ) ( not ( = ?auto_149078 ?auto_149085 ) ) ( not ( = ?auto_149079 ?auto_149080 ) ) ( not ( = ?auto_149079 ?auto_149081 ) ) ( not ( = ?auto_149079 ?auto_149082 ) ) ( not ( = ?auto_149079 ?auto_149083 ) ) ( not ( = ?auto_149079 ?auto_149084 ) ) ( not ( = ?auto_149079 ?auto_149085 ) ) ( not ( = ?auto_149080 ?auto_149081 ) ) ( not ( = ?auto_149080 ?auto_149082 ) ) ( not ( = ?auto_149080 ?auto_149083 ) ) ( not ( = ?auto_149080 ?auto_149084 ) ) ( not ( = ?auto_149080 ?auto_149085 ) ) ( not ( = ?auto_149081 ?auto_149082 ) ) ( not ( = ?auto_149081 ?auto_149083 ) ) ( not ( = ?auto_149081 ?auto_149084 ) ) ( not ( = ?auto_149081 ?auto_149085 ) ) ( not ( = ?auto_149082 ?auto_149083 ) ) ( not ( = ?auto_149082 ?auto_149084 ) ) ( not ( = ?auto_149082 ?auto_149085 ) ) ( not ( = ?auto_149083 ?auto_149084 ) ) ( not ( = ?auto_149083 ?auto_149085 ) ) ( not ( = ?auto_149084 ?auto_149085 ) ) ( ON ?auto_149083 ?auto_149084 ) ( ON ?auto_149082 ?auto_149083 ) ( ON ?auto_149081 ?auto_149082 ) ( ON ?auto_149080 ?auto_149081 ) ( ON ?auto_149079 ?auto_149080 ) ( CLEAR ?auto_149077 ) ( ON ?auto_149078 ?auto_149079 ) ( CLEAR ?auto_149078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149076 ?auto_149077 ?auto_149078 )
      ( MAKE-9PILE ?auto_149076 ?auto_149077 ?auto_149078 ?auto_149079 ?auto_149080 ?auto_149081 ?auto_149082 ?auto_149083 ?auto_149084 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149095 - BLOCK
      ?auto_149096 - BLOCK
      ?auto_149097 - BLOCK
      ?auto_149098 - BLOCK
      ?auto_149099 - BLOCK
      ?auto_149100 - BLOCK
      ?auto_149101 - BLOCK
      ?auto_149102 - BLOCK
      ?auto_149103 - BLOCK
    )
    :vars
    (
      ?auto_149104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149103 ?auto_149104 ) ( ON-TABLE ?auto_149095 ) ( not ( = ?auto_149095 ?auto_149096 ) ) ( not ( = ?auto_149095 ?auto_149097 ) ) ( not ( = ?auto_149095 ?auto_149098 ) ) ( not ( = ?auto_149095 ?auto_149099 ) ) ( not ( = ?auto_149095 ?auto_149100 ) ) ( not ( = ?auto_149095 ?auto_149101 ) ) ( not ( = ?auto_149095 ?auto_149102 ) ) ( not ( = ?auto_149095 ?auto_149103 ) ) ( not ( = ?auto_149095 ?auto_149104 ) ) ( not ( = ?auto_149096 ?auto_149097 ) ) ( not ( = ?auto_149096 ?auto_149098 ) ) ( not ( = ?auto_149096 ?auto_149099 ) ) ( not ( = ?auto_149096 ?auto_149100 ) ) ( not ( = ?auto_149096 ?auto_149101 ) ) ( not ( = ?auto_149096 ?auto_149102 ) ) ( not ( = ?auto_149096 ?auto_149103 ) ) ( not ( = ?auto_149096 ?auto_149104 ) ) ( not ( = ?auto_149097 ?auto_149098 ) ) ( not ( = ?auto_149097 ?auto_149099 ) ) ( not ( = ?auto_149097 ?auto_149100 ) ) ( not ( = ?auto_149097 ?auto_149101 ) ) ( not ( = ?auto_149097 ?auto_149102 ) ) ( not ( = ?auto_149097 ?auto_149103 ) ) ( not ( = ?auto_149097 ?auto_149104 ) ) ( not ( = ?auto_149098 ?auto_149099 ) ) ( not ( = ?auto_149098 ?auto_149100 ) ) ( not ( = ?auto_149098 ?auto_149101 ) ) ( not ( = ?auto_149098 ?auto_149102 ) ) ( not ( = ?auto_149098 ?auto_149103 ) ) ( not ( = ?auto_149098 ?auto_149104 ) ) ( not ( = ?auto_149099 ?auto_149100 ) ) ( not ( = ?auto_149099 ?auto_149101 ) ) ( not ( = ?auto_149099 ?auto_149102 ) ) ( not ( = ?auto_149099 ?auto_149103 ) ) ( not ( = ?auto_149099 ?auto_149104 ) ) ( not ( = ?auto_149100 ?auto_149101 ) ) ( not ( = ?auto_149100 ?auto_149102 ) ) ( not ( = ?auto_149100 ?auto_149103 ) ) ( not ( = ?auto_149100 ?auto_149104 ) ) ( not ( = ?auto_149101 ?auto_149102 ) ) ( not ( = ?auto_149101 ?auto_149103 ) ) ( not ( = ?auto_149101 ?auto_149104 ) ) ( not ( = ?auto_149102 ?auto_149103 ) ) ( not ( = ?auto_149102 ?auto_149104 ) ) ( not ( = ?auto_149103 ?auto_149104 ) ) ( ON ?auto_149102 ?auto_149103 ) ( ON ?auto_149101 ?auto_149102 ) ( ON ?auto_149100 ?auto_149101 ) ( ON ?auto_149099 ?auto_149100 ) ( ON ?auto_149098 ?auto_149099 ) ( ON ?auto_149097 ?auto_149098 ) ( CLEAR ?auto_149095 ) ( ON ?auto_149096 ?auto_149097 ) ( CLEAR ?auto_149096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149095 ?auto_149096 )
      ( MAKE-9PILE ?auto_149095 ?auto_149096 ?auto_149097 ?auto_149098 ?auto_149099 ?auto_149100 ?auto_149101 ?auto_149102 ?auto_149103 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149114 - BLOCK
      ?auto_149115 - BLOCK
      ?auto_149116 - BLOCK
      ?auto_149117 - BLOCK
      ?auto_149118 - BLOCK
      ?auto_149119 - BLOCK
      ?auto_149120 - BLOCK
      ?auto_149121 - BLOCK
      ?auto_149122 - BLOCK
    )
    :vars
    (
      ?auto_149123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149122 ?auto_149123 ) ( ON-TABLE ?auto_149114 ) ( not ( = ?auto_149114 ?auto_149115 ) ) ( not ( = ?auto_149114 ?auto_149116 ) ) ( not ( = ?auto_149114 ?auto_149117 ) ) ( not ( = ?auto_149114 ?auto_149118 ) ) ( not ( = ?auto_149114 ?auto_149119 ) ) ( not ( = ?auto_149114 ?auto_149120 ) ) ( not ( = ?auto_149114 ?auto_149121 ) ) ( not ( = ?auto_149114 ?auto_149122 ) ) ( not ( = ?auto_149114 ?auto_149123 ) ) ( not ( = ?auto_149115 ?auto_149116 ) ) ( not ( = ?auto_149115 ?auto_149117 ) ) ( not ( = ?auto_149115 ?auto_149118 ) ) ( not ( = ?auto_149115 ?auto_149119 ) ) ( not ( = ?auto_149115 ?auto_149120 ) ) ( not ( = ?auto_149115 ?auto_149121 ) ) ( not ( = ?auto_149115 ?auto_149122 ) ) ( not ( = ?auto_149115 ?auto_149123 ) ) ( not ( = ?auto_149116 ?auto_149117 ) ) ( not ( = ?auto_149116 ?auto_149118 ) ) ( not ( = ?auto_149116 ?auto_149119 ) ) ( not ( = ?auto_149116 ?auto_149120 ) ) ( not ( = ?auto_149116 ?auto_149121 ) ) ( not ( = ?auto_149116 ?auto_149122 ) ) ( not ( = ?auto_149116 ?auto_149123 ) ) ( not ( = ?auto_149117 ?auto_149118 ) ) ( not ( = ?auto_149117 ?auto_149119 ) ) ( not ( = ?auto_149117 ?auto_149120 ) ) ( not ( = ?auto_149117 ?auto_149121 ) ) ( not ( = ?auto_149117 ?auto_149122 ) ) ( not ( = ?auto_149117 ?auto_149123 ) ) ( not ( = ?auto_149118 ?auto_149119 ) ) ( not ( = ?auto_149118 ?auto_149120 ) ) ( not ( = ?auto_149118 ?auto_149121 ) ) ( not ( = ?auto_149118 ?auto_149122 ) ) ( not ( = ?auto_149118 ?auto_149123 ) ) ( not ( = ?auto_149119 ?auto_149120 ) ) ( not ( = ?auto_149119 ?auto_149121 ) ) ( not ( = ?auto_149119 ?auto_149122 ) ) ( not ( = ?auto_149119 ?auto_149123 ) ) ( not ( = ?auto_149120 ?auto_149121 ) ) ( not ( = ?auto_149120 ?auto_149122 ) ) ( not ( = ?auto_149120 ?auto_149123 ) ) ( not ( = ?auto_149121 ?auto_149122 ) ) ( not ( = ?auto_149121 ?auto_149123 ) ) ( not ( = ?auto_149122 ?auto_149123 ) ) ( ON ?auto_149121 ?auto_149122 ) ( ON ?auto_149120 ?auto_149121 ) ( ON ?auto_149119 ?auto_149120 ) ( ON ?auto_149118 ?auto_149119 ) ( ON ?auto_149117 ?auto_149118 ) ( ON ?auto_149116 ?auto_149117 ) ( CLEAR ?auto_149114 ) ( ON ?auto_149115 ?auto_149116 ) ( CLEAR ?auto_149115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149114 ?auto_149115 )
      ( MAKE-9PILE ?auto_149114 ?auto_149115 ?auto_149116 ?auto_149117 ?auto_149118 ?auto_149119 ?auto_149120 ?auto_149121 ?auto_149122 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149133 - BLOCK
      ?auto_149134 - BLOCK
      ?auto_149135 - BLOCK
      ?auto_149136 - BLOCK
      ?auto_149137 - BLOCK
      ?auto_149138 - BLOCK
      ?auto_149139 - BLOCK
      ?auto_149140 - BLOCK
      ?auto_149141 - BLOCK
    )
    :vars
    (
      ?auto_149142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149141 ?auto_149142 ) ( not ( = ?auto_149133 ?auto_149134 ) ) ( not ( = ?auto_149133 ?auto_149135 ) ) ( not ( = ?auto_149133 ?auto_149136 ) ) ( not ( = ?auto_149133 ?auto_149137 ) ) ( not ( = ?auto_149133 ?auto_149138 ) ) ( not ( = ?auto_149133 ?auto_149139 ) ) ( not ( = ?auto_149133 ?auto_149140 ) ) ( not ( = ?auto_149133 ?auto_149141 ) ) ( not ( = ?auto_149133 ?auto_149142 ) ) ( not ( = ?auto_149134 ?auto_149135 ) ) ( not ( = ?auto_149134 ?auto_149136 ) ) ( not ( = ?auto_149134 ?auto_149137 ) ) ( not ( = ?auto_149134 ?auto_149138 ) ) ( not ( = ?auto_149134 ?auto_149139 ) ) ( not ( = ?auto_149134 ?auto_149140 ) ) ( not ( = ?auto_149134 ?auto_149141 ) ) ( not ( = ?auto_149134 ?auto_149142 ) ) ( not ( = ?auto_149135 ?auto_149136 ) ) ( not ( = ?auto_149135 ?auto_149137 ) ) ( not ( = ?auto_149135 ?auto_149138 ) ) ( not ( = ?auto_149135 ?auto_149139 ) ) ( not ( = ?auto_149135 ?auto_149140 ) ) ( not ( = ?auto_149135 ?auto_149141 ) ) ( not ( = ?auto_149135 ?auto_149142 ) ) ( not ( = ?auto_149136 ?auto_149137 ) ) ( not ( = ?auto_149136 ?auto_149138 ) ) ( not ( = ?auto_149136 ?auto_149139 ) ) ( not ( = ?auto_149136 ?auto_149140 ) ) ( not ( = ?auto_149136 ?auto_149141 ) ) ( not ( = ?auto_149136 ?auto_149142 ) ) ( not ( = ?auto_149137 ?auto_149138 ) ) ( not ( = ?auto_149137 ?auto_149139 ) ) ( not ( = ?auto_149137 ?auto_149140 ) ) ( not ( = ?auto_149137 ?auto_149141 ) ) ( not ( = ?auto_149137 ?auto_149142 ) ) ( not ( = ?auto_149138 ?auto_149139 ) ) ( not ( = ?auto_149138 ?auto_149140 ) ) ( not ( = ?auto_149138 ?auto_149141 ) ) ( not ( = ?auto_149138 ?auto_149142 ) ) ( not ( = ?auto_149139 ?auto_149140 ) ) ( not ( = ?auto_149139 ?auto_149141 ) ) ( not ( = ?auto_149139 ?auto_149142 ) ) ( not ( = ?auto_149140 ?auto_149141 ) ) ( not ( = ?auto_149140 ?auto_149142 ) ) ( not ( = ?auto_149141 ?auto_149142 ) ) ( ON ?auto_149140 ?auto_149141 ) ( ON ?auto_149139 ?auto_149140 ) ( ON ?auto_149138 ?auto_149139 ) ( ON ?auto_149137 ?auto_149138 ) ( ON ?auto_149136 ?auto_149137 ) ( ON ?auto_149135 ?auto_149136 ) ( ON ?auto_149134 ?auto_149135 ) ( ON ?auto_149133 ?auto_149134 ) ( CLEAR ?auto_149133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149133 )
      ( MAKE-9PILE ?auto_149133 ?auto_149134 ?auto_149135 ?auto_149136 ?auto_149137 ?auto_149138 ?auto_149139 ?auto_149140 ?auto_149141 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_149152 - BLOCK
      ?auto_149153 - BLOCK
      ?auto_149154 - BLOCK
      ?auto_149155 - BLOCK
      ?auto_149156 - BLOCK
      ?auto_149157 - BLOCK
      ?auto_149158 - BLOCK
      ?auto_149159 - BLOCK
      ?auto_149160 - BLOCK
    )
    :vars
    (
      ?auto_149161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149160 ?auto_149161 ) ( not ( = ?auto_149152 ?auto_149153 ) ) ( not ( = ?auto_149152 ?auto_149154 ) ) ( not ( = ?auto_149152 ?auto_149155 ) ) ( not ( = ?auto_149152 ?auto_149156 ) ) ( not ( = ?auto_149152 ?auto_149157 ) ) ( not ( = ?auto_149152 ?auto_149158 ) ) ( not ( = ?auto_149152 ?auto_149159 ) ) ( not ( = ?auto_149152 ?auto_149160 ) ) ( not ( = ?auto_149152 ?auto_149161 ) ) ( not ( = ?auto_149153 ?auto_149154 ) ) ( not ( = ?auto_149153 ?auto_149155 ) ) ( not ( = ?auto_149153 ?auto_149156 ) ) ( not ( = ?auto_149153 ?auto_149157 ) ) ( not ( = ?auto_149153 ?auto_149158 ) ) ( not ( = ?auto_149153 ?auto_149159 ) ) ( not ( = ?auto_149153 ?auto_149160 ) ) ( not ( = ?auto_149153 ?auto_149161 ) ) ( not ( = ?auto_149154 ?auto_149155 ) ) ( not ( = ?auto_149154 ?auto_149156 ) ) ( not ( = ?auto_149154 ?auto_149157 ) ) ( not ( = ?auto_149154 ?auto_149158 ) ) ( not ( = ?auto_149154 ?auto_149159 ) ) ( not ( = ?auto_149154 ?auto_149160 ) ) ( not ( = ?auto_149154 ?auto_149161 ) ) ( not ( = ?auto_149155 ?auto_149156 ) ) ( not ( = ?auto_149155 ?auto_149157 ) ) ( not ( = ?auto_149155 ?auto_149158 ) ) ( not ( = ?auto_149155 ?auto_149159 ) ) ( not ( = ?auto_149155 ?auto_149160 ) ) ( not ( = ?auto_149155 ?auto_149161 ) ) ( not ( = ?auto_149156 ?auto_149157 ) ) ( not ( = ?auto_149156 ?auto_149158 ) ) ( not ( = ?auto_149156 ?auto_149159 ) ) ( not ( = ?auto_149156 ?auto_149160 ) ) ( not ( = ?auto_149156 ?auto_149161 ) ) ( not ( = ?auto_149157 ?auto_149158 ) ) ( not ( = ?auto_149157 ?auto_149159 ) ) ( not ( = ?auto_149157 ?auto_149160 ) ) ( not ( = ?auto_149157 ?auto_149161 ) ) ( not ( = ?auto_149158 ?auto_149159 ) ) ( not ( = ?auto_149158 ?auto_149160 ) ) ( not ( = ?auto_149158 ?auto_149161 ) ) ( not ( = ?auto_149159 ?auto_149160 ) ) ( not ( = ?auto_149159 ?auto_149161 ) ) ( not ( = ?auto_149160 ?auto_149161 ) ) ( ON ?auto_149159 ?auto_149160 ) ( ON ?auto_149158 ?auto_149159 ) ( ON ?auto_149157 ?auto_149158 ) ( ON ?auto_149156 ?auto_149157 ) ( ON ?auto_149155 ?auto_149156 ) ( ON ?auto_149154 ?auto_149155 ) ( ON ?auto_149153 ?auto_149154 ) ( ON ?auto_149152 ?auto_149153 ) ( CLEAR ?auto_149152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149152 )
      ( MAKE-9PILE ?auto_149152 ?auto_149153 ?auto_149154 ?auto_149155 ?auto_149156 ?auto_149157 ?auto_149158 ?auto_149159 ?auto_149160 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149172 - BLOCK
      ?auto_149173 - BLOCK
      ?auto_149174 - BLOCK
      ?auto_149175 - BLOCK
      ?auto_149176 - BLOCK
      ?auto_149177 - BLOCK
      ?auto_149178 - BLOCK
      ?auto_149179 - BLOCK
      ?auto_149180 - BLOCK
      ?auto_149181 - BLOCK
    )
    :vars
    (
      ?auto_149182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149180 ) ( ON ?auto_149181 ?auto_149182 ) ( CLEAR ?auto_149181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149172 ) ( ON ?auto_149173 ?auto_149172 ) ( ON ?auto_149174 ?auto_149173 ) ( ON ?auto_149175 ?auto_149174 ) ( ON ?auto_149176 ?auto_149175 ) ( ON ?auto_149177 ?auto_149176 ) ( ON ?auto_149178 ?auto_149177 ) ( ON ?auto_149179 ?auto_149178 ) ( ON ?auto_149180 ?auto_149179 ) ( not ( = ?auto_149172 ?auto_149173 ) ) ( not ( = ?auto_149172 ?auto_149174 ) ) ( not ( = ?auto_149172 ?auto_149175 ) ) ( not ( = ?auto_149172 ?auto_149176 ) ) ( not ( = ?auto_149172 ?auto_149177 ) ) ( not ( = ?auto_149172 ?auto_149178 ) ) ( not ( = ?auto_149172 ?auto_149179 ) ) ( not ( = ?auto_149172 ?auto_149180 ) ) ( not ( = ?auto_149172 ?auto_149181 ) ) ( not ( = ?auto_149172 ?auto_149182 ) ) ( not ( = ?auto_149173 ?auto_149174 ) ) ( not ( = ?auto_149173 ?auto_149175 ) ) ( not ( = ?auto_149173 ?auto_149176 ) ) ( not ( = ?auto_149173 ?auto_149177 ) ) ( not ( = ?auto_149173 ?auto_149178 ) ) ( not ( = ?auto_149173 ?auto_149179 ) ) ( not ( = ?auto_149173 ?auto_149180 ) ) ( not ( = ?auto_149173 ?auto_149181 ) ) ( not ( = ?auto_149173 ?auto_149182 ) ) ( not ( = ?auto_149174 ?auto_149175 ) ) ( not ( = ?auto_149174 ?auto_149176 ) ) ( not ( = ?auto_149174 ?auto_149177 ) ) ( not ( = ?auto_149174 ?auto_149178 ) ) ( not ( = ?auto_149174 ?auto_149179 ) ) ( not ( = ?auto_149174 ?auto_149180 ) ) ( not ( = ?auto_149174 ?auto_149181 ) ) ( not ( = ?auto_149174 ?auto_149182 ) ) ( not ( = ?auto_149175 ?auto_149176 ) ) ( not ( = ?auto_149175 ?auto_149177 ) ) ( not ( = ?auto_149175 ?auto_149178 ) ) ( not ( = ?auto_149175 ?auto_149179 ) ) ( not ( = ?auto_149175 ?auto_149180 ) ) ( not ( = ?auto_149175 ?auto_149181 ) ) ( not ( = ?auto_149175 ?auto_149182 ) ) ( not ( = ?auto_149176 ?auto_149177 ) ) ( not ( = ?auto_149176 ?auto_149178 ) ) ( not ( = ?auto_149176 ?auto_149179 ) ) ( not ( = ?auto_149176 ?auto_149180 ) ) ( not ( = ?auto_149176 ?auto_149181 ) ) ( not ( = ?auto_149176 ?auto_149182 ) ) ( not ( = ?auto_149177 ?auto_149178 ) ) ( not ( = ?auto_149177 ?auto_149179 ) ) ( not ( = ?auto_149177 ?auto_149180 ) ) ( not ( = ?auto_149177 ?auto_149181 ) ) ( not ( = ?auto_149177 ?auto_149182 ) ) ( not ( = ?auto_149178 ?auto_149179 ) ) ( not ( = ?auto_149178 ?auto_149180 ) ) ( not ( = ?auto_149178 ?auto_149181 ) ) ( not ( = ?auto_149178 ?auto_149182 ) ) ( not ( = ?auto_149179 ?auto_149180 ) ) ( not ( = ?auto_149179 ?auto_149181 ) ) ( not ( = ?auto_149179 ?auto_149182 ) ) ( not ( = ?auto_149180 ?auto_149181 ) ) ( not ( = ?auto_149180 ?auto_149182 ) ) ( not ( = ?auto_149181 ?auto_149182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149181 ?auto_149182 )
      ( !STACK ?auto_149181 ?auto_149180 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149193 - BLOCK
      ?auto_149194 - BLOCK
      ?auto_149195 - BLOCK
      ?auto_149196 - BLOCK
      ?auto_149197 - BLOCK
      ?auto_149198 - BLOCK
      ?auto_149199 - BLOCK
      ?auto_149200 - BLOCK
      ?auto_149201 - BLOCK
      ?auto_149202 - BLOCK
    )
    :vars
    (
      ?auto_149203 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149201 ) ( ON ?auto_149202 ?auto_149203 ) ( CLEAR ?auto_149202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149193 ) ( ON ?auto_149194 ?auto_149193 ) ( ON ?auto_149195 ?auto_149194 ) ( ON ?auto_149196 ?auto_149195 ) ( ON ?auto_149197 ?auto_149196 ) ( ON ?auto_149198 ?auto_149197 ) ( ON ?auto_149199 ?auto_149198 ) ( ON ?auto_149200 ?auto_149199 ) ( ON ?auto_149201 ?auto_149200 ) ( not ( = ?auto_149193 ?auto_149194 ) ) ( not ( = ?auto_149193 ?auto_149195 ) ) ( not ( = ?auto_149193 ?auto_149196 ) ) ( not ( = ?auto_149193 ?auto_149197 ) ) ( not ( = ?auto_149193 ?auto_149198 ) ) ( not ( = ?auto_149193 ?auto_149199 ) ) ( not ( = ?auto_149193 ?auto_149200 ) ) ( not ( = ?auto_149193 ?auto_149201 ) ) ( not ( = ?auto_149193 ?auto_149202 ) ) ( not ( = ?auto_149193 ?auto_149203 ) ) ( not ( = ?auto_149194 ?auto_149195 ) ) ( not ( = ?auto_149194 ?auto_149196 ) ) ( not ( = ?auto_149194 ?auto_149197 ) ) ( not ( = ?auto_149194 ?auto_149198 ) ) ( not ( = ?auto_149194 ?auto_149199 ) ) ( not ( = ?auto_149194 ?auto_149200 ) ) ( not ( = ?auto_149194 ?auto_149201 ) ) ( not ( = ?auto_149194 ?auto_149202 ) ) ( not ( = ?auto_149194 ?auto_149203 ) ) ( not ( = ?auto_149195 ?auto_149196 ) ) ( not ( = ?auto_149195 ?auto_149197 ) ) ( not ( = ?auto_149195 ?auto_149198 ) ) ( not ( = ?auto_149195 ?auto_149199 ) ) ( not ( = ?auto_149195 ?auto_149200 ) ) ( not ( = ?auto_149195 ?auto_149201 ) ) ( not ( = ?auto_149195 ?auto_149202 ) ) ( not ( = ?auto_149195 ?auto_149203 ) ) ( not ( = ?auto_149196 ?auto_149197 ) ) ( not ( = ?auto_149196 ?auto_149198 ) ) ( not ( = ?auto_149196 ?auto_149199 ) ) ( not ( = ?auto_149196 ?auto_149200 ) ) ( not ( = ?auto_149196 ?auto_149201 ) ) ( not ( = ?auto_149196 ?auto_149202 ) ) ( not ( = ?auto_149196 ?auto_149203 ) ) ( not ( = ?auto_149197 ?auto_149198 ) ) ( not ( = ?auto_149197 ?auto_149199 ) ) ( not ( = ?auto_149197 ?auto_149200 ) ) ( not ( = ?auto_149197 ?auto_149201 ) ) ( not ( = ?auto_149197 ?auto_149202 ) ) ( not ( = ?auto_149197 ?auto_149203 ) ) ( not ( = ?auto_149198 ?auto_149199 ) ) ( not ( = ?auto_149198 ?auto_149200 ) ) ( not ( = ?auto_149198 ?auto_149201 ) ) ( not ( = ?auto_149198 ?auto_149202 ) ) ( not ( = ?auto_149198 ?auto_149203 ) ) ( not ( = ?auto_149199 ?auto_149200 ) ) ( not ( = ?auto_149199 ?auto_149201 ) ) ( not ( = ?auto_149199 ?auto_149202 ) ) ( not ( = ?auto_149199 ?auto_149203 ) ) ( not ( = ?auto_149200 ?auto_149201 ) ) ( not ( = ?auto_149200 ?auto_149202 ) ) ( not ( = ?auto_149200 ?auto_149203 ) ) ( not ( = ?auto_149201 ?auto_149202 ) ) ( not ( = ?auto_149201 ?auto_149203 ) ) ( not ( = ?auto_149202 ?auto_149203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149202 ?auto_149203 )
      ( !STACK ?auto_149202 ?auto_149201 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149214 - BLOCK
      ?auto_149215 - BLOCK
      ?auto_149216 - BLOCK
      ?auto_149217 - BLOCK
      ?auto_149218 - BLOCK
      ?auto_149219 - BLOCK
      ?auto_149220 - BLOCK
      ?auto_149221 - BLOCK
      ?auto_149222 - BLOCK
      ?auto_149223 - BLOCK
    )
    :vars
    (
      ?auto_149224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149223 ?auto_149224 ) ( ON-TABLE ?auto_149214 ) ( ON ?auto_149215 ?auto_149214 ) ( ON ?auto_149216 ?auto_149215 ) ( ON ?auto_149217 ?auto_149216 ) ( ON ?auto_149218 ?auto_149217 ) ( ON ?auto_149219 ?auto_149218 ) ( ON ?auto_149220 ?auto_149219 ) ( ON ?auto_149221 ?auto_149220 ) ( not ( = ?auto_149214 ?auto_149215 ) ) ( not ( = ?auto_149214 ?auto_149216 ) ) ( not ( = ?auto_149214 ?auto_149217 ) ) ( not ( = ?auto_149214 ?auto_149218 ) ) ( not ( = ?auto_149214 ?auto_149219 ) ) ( not ( = ?auto_149214 ?auto_149220 ) ) ( not ( = ?auto_149214 ?auto_149221 ) ) ( not ( = ?auto_149214 ?auto_149222 ) ) ( not ( = ?auto_149214 ?auto_149223 ) ) ( not ( = ?auto_149214 ?auto_149224 ) ) ( not ( = ?auto_149215 ?auto_149216 ) ) ( not ( = ?auto_149215 ?auto_149217 ) ) ( not ( = ?auto_149215 ?auto_149218 ) ) ( not ( = ?auto_149215 ?auto_149219 ) ) ( not ( = ?auto_149215 ?auto_149220 ) ) ( not ( = ?auto_149215 ?auto_149221 ) ) ( not ( = ?auto_149215 ?auto_149222 ) ) ( not ( = ?auto_149215 ?auto_149223 ) ) ( not ( = ?auto_149215 ?auto_149224 ) ) ( not ( = ?auto_149216 ?auto_149217 ) ) ( not ( = ?auto_149216 ?auto_149218 ) ) ( not ( = ?auto_149216 ?auto_149219 ) ) ( not ( = ?auto_149216 ?auto_149220 ) ) ( not ( = ?auto_149216 ?auto_149221 ) ) ( not ( = ?auto_149216 ?auto_149222 ) ) ( not ( = ?auto_149216 ?auto_149223 ) ) ( not ( = ?auto_149216 ?auto_149224 ) ) ( not ( = ?auto_149217 ?auto_149218 ) ) ( not ( = ?auto_149217 ?auto_149219 ) ) ( not ( = ?auto_149217 ?auto_149220 ) ) ( not ( = ?auto_149217 ?auto_149221 ) ) ( not ( = ?auto_149217 ?auto_149222 ) ) ( not ( = ?auto_149217 ?auto_149223 ) ) ( not ( = ?auto_149217 ?auto_149224 ) ) ( not ( = ?auto_149218 ?auto_149219 ) ) ( not ( = ?auto_149218 ?auto_149220 ) ) ( not ( = ?auto_149218 ?auto_149221 ) ) ( not ( = ?auto_149218 ?auto_149222 ) ) ( not ( = ?auto_149218 ?auto_149223 ) ) ( not ( = ?auto_149218 ?auto_149224 ) ) ( not ( = ?auto_149219 ?auto_149220 ) ) ( not ( = ?auto_149219 ?auto_149221 ) ) ( not ( = ?auto_149219 ?auto_149222 ) ) ( not ( = ?auto_149219 ?auto_149223 ) ) ( not ( = ?auto_149219 ?auto_149224 ) ) ( not ( = ?auto_149220 ?auto_149221 ) ) ( not ( = ?auto_149220 ?auto_149222 ) ) ( not ( = ?auto_149220 ?auto_149223 ) ) ( not ( = ?auto_149220 ?auto_149224 ) ) ( not ( = ?auto_149221 ?auto_149222 ) ) ( not ( = ?auto_149221 ?auto_149223 ) ) ( not ( = ?auto_149221 ?auto_149224 ) ) ( not ( = ?auto_149222 ?auto_149223 ) ) ( not ( = ?auto_149222 ?auto_149224 ) ) ( not ( = ?auto_149223 ?auto_149224 ) ) ( CLEAR ?auto_149221 ) ( ON ?auto_149222 ?auto_149223 ) ( CLEAR ?auto_149222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_149214 ?auto_149215 ?auto_149216 ?auto_149217 ?auto_149218 ?auto_149219 ?auto_149220 ?auto_149221 ?auto_149222 )
      ( MAKE-10PILE ?auto_149214 ?auto_149215 ?auto_149216 ?auto_149217 ?auto_149218 ?auto_149219 ?auto_149220 ?auto_149221 ?auto_149222 ?auto_149223 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149235 - BLOCK
      ?auto_149236 - BLOCK
      ?auto_149237 - BLOCK
      ?auto_149238 - BLOCK
      ?auto_149239 - BLOCK
      ?auto_149240 - BLOCK
      ?auto_149241 - BLOCK
      ?auto_149242 - BLOCK
      ?auto_149243 - BLOCK
      ?auto_149244 - BLOCK
    )
    :vars
    (
      ?auto_149245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149244 ?auto_149245 ) ( ON-TABLE ?auto_149235 ) ( ON ?auto_149236 ?auto_149235 ) ( ON ?auto_149237 ?auto_149236 ) ( ON ?auto_149238 ?auto_149237 ) ( ON ?auto_149239 ?auto_149238 ) ( ON ?auto_149240 ?auto_149239 ) ( ON ?auto_149241 ?auto_149240 ) ( ON ?auto_149242 ?auto_149241 ) ( not ( = ?auto_149235 ?auto_149236 ) ) ( not ( = ?auto_149235 ?auto_149237 ) ) ( not ( = ?auto_149235 ?auto_149238 ) ) ( not ( = ?auto_149235 ?auto_149239 ) ) ( not ( = ?auto_149235 ?auto_149240 ) ) ( not ( = ?auto_149235 ?auto_149241 ) ) ( not ( = ?auto_149235 ?auto_149242 ) ) ( not ( = ?auto_149235 ?auto_149243 ) ) ( not ( = ?auto_149235 ?auto_149244 ) ) ( not ( = ?auto_149235 ?auto_149245 ) ) ( not ( = ?auto_149236 ?auto_149237 ) ) ( not ( = ?auto_149236 ?auto_149238 ) ) ( not ( = ?auto_149236 ?auto_149239 ) ) ( not ( = ?auto_149236 ?auto_149240 ) ) ( not ( = ?auto_149236 ?auto_149241 ) ) ( not ( = ?auto_149236 ?auto_149242 ) ) ( not ( = ?auto_149236 ?auto_149243 ) ) ( not ( = ?auto_149236 ?auto_149244 ) ) ( not ( = ?auto_149236 ?auto_149245 ) ) ( not ( = ?auto_149237 ?auto_149238 ) ) ( not ( = ?auto_149237 ?auto_149239 ) ) ( not ( = ?auto_149237 ?auto_149240 ) ) ( not ( = ?auto_149237 ?auto_149241 ) ) ( not ( = ?auto_149237 ?auto_149242 ) ) ( not ( = ?auto_149237 ?auto_149243 ) ) ( not ( = ?auto_149237 ?auto_149244 ) ) ( not ( = ?auto_149237 ?auto_149245 ) ) ( not ( = ?auto_149238 ?auto_149239 ) ) ( not ( = ?auto_149238 ?auto_149240 ) ) ( not ( = ?auto_149238 ?auto_149241 ) ) ( not ( = ?auto_149238 ?auto_149242 ) ) ( not ( = ?auto_149238 ?auto_149243 ) ) ( not ( = ?auto_149238 ?auto_149244 ) ) ( not ( = ?auto_149238 ?auto_149245 ) ) ( not ( = ?auto_149239 ?auto_149240 ) ) ( not ( = ?auto_149239 ?auto_149241 ) ) ( not ( = ?auto_149239 ?auto_149242 ) ) ( not ( = ?auto_149239 ?auto_149243 ) ) ( not ( = ?auto_149239 ?auto_149244 ) ) ( not ( = ?auto_149239 ?auto_149245 ) ) ( not ( = ?auto_149240 ?auto_149241 ) ) ( not ( = ?auto_149240 ?auto_149242 ) ) ( not ( = ?auto_149240 ?auto_149243 ) ) ( not ( = ?auto_149240 ?auto_149244 ) ) ( not ( = ?auto_149240 ?auto_149245 ) ) ( not ( = ?auto_149241 ?auto_149242 ) ) ( not ( = ?auto_149241 ?auto_149243 ) ) ( not ( = ?auto_149241 ?auto_149244 ) ) ( not ( = ?auto_149241 ?auto_149245 ) ) ( not ( = ?auto_149242 ?auto_149243 ) ) ( not ( = ?auto_149242 ?auto_149244 ) ) ( not ( = ?auto_149242 ?auto_149245 ) ) ( not ( = ?auto_149243 ?auto_149244 ) ) ( not ( = ?auto_149243 ?auto_149245 ) ) ( not ( = ?auto_149244 ?auto_149245 ) ) ( CLEAR ?auto_149242 ) ( ON ?auto_149243 ?auto_149244 ) ( CLEAR ?auto_149243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_149235 ?auto_149236 ?auto_149237 ?auto_149238 ?auto_149239 ?auto_149240 ?auto_149241 ?auto_149242 ?auto_149243 )
      ( MAKE-10PILE ?auto_149235 ?auto_149236 ?auto_149237 ?auto_149238 ?auto_149239 ?auto_149240 ?auto_149241 ?auto_149242 ?auto_149243 ?auto_149244 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149256 - BLOCK
      ?auto_149257 - BLOCK
      ?auto_149258 - BLOCK
      ?auto_149259 - BLOCK
      ?auto_149260 - BLOCK
      ?auto_149261 - BLOCK
      ?auto_149262 - BLOCK
      ?auto_149263 - BLOCK
      ?auto_149264 - BLOCK
      ?auto_149265 - BLOCK
    )
    :vars
    (
      ?auto_149266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149265 ?auto_149266 ) ( ON-TABLE ?auto_149256 ) ( ON ?auto_149257 ?auto_149256 ) ( ON ?auto_149258 ?auto_149257 ) ( ON ?auto_149259 ?auto_149258 ) ( ON ?auto_149260 ?auto_149259 ) ( ON ?auto_149261 ?auto_149260 ) ( ON ?auto_149262 ?auto_149261 ) ( not ( = ?auto_149256 ?auto_149257 ) ) ( not ( = ?auto_149256 ?auto_149258 ) ) ( not ( = ?auto_149256 ?auto_149259 ) ) ( not ( = ?auto_149256 ?auto_149260 ) ) ( not ( = ?auto_149256 ?auto_149261 ) ) ( not ( = ?auto_149256 ?auto_149262 ) ) ( not ( = ?auto_149256 ?auto_149263 ) ) ( not ( = ?auto_149256 ?auto_149264 ) ) ( not ( = ?auto_149256 ?auto_149265 ) ) ( not ( = ?auto_149256 ?auto_149266 ) ) ( not ( = ?auto_149257 ?auto_149258 ) ) ( not ( = ?auto_149257 ?auto_149259 ) ) ( not ( = ?auto_149257 ?auto_149260 ) ) ( not ( = ?auto_149257 ?auto_149261 ) ) ( not ( = ?auto_149257 ?auto_149262 ) ) ( not ( = ?auto_149257 ?auto_149263 ) ) ( not ( = ?auto_149257 ?auto_149264 ) ) ( not ( = ?auto_149257 ?auto_149265 ) ) ( not ( = ?auto_149257 ?auto_149266 ) ) ( not ( = ?auto_149258 ?auto_149259 ) ) ( not ( = ?auto_149258 ?auto_149260 ) ) ( not ( = ?auto_149258 ?auto_149261 ) ) ( not ( = ?auto_149258 ?auto_149262 ) ) ( not ( = ?auto_149258 ?auto_149263 ) ) ( not ( = ?auto_149258 ?auto_149264 ) ) ( not ( = ?auto_149258 ?auto_149265 ) ) ( not ( = ?auto_149258 ?auto_149266 ) ) ( not ( = ?auto_149259 ?auto_149260 ) ) ( not ( = ?auto_149259 ?auto_149261 ) ) ( not ( = ?auto_149259 ?auto_149262 ) ) ( not ( = ?auto_149259 ?auto_149263 ) ) ( not ( = ?auto_149259 ?auto_149264 ) ) ( not ( = ?auto_149259 ?auto_149265 ) ) ( not ( = ?auto_149259 ?auto_149266 ) ) ( not ( = ?auto_149260 ?auto_149261 ) ) ( not ( = ?auto_149260 ?auto_149262 ) ) ( not ( = ?auto_149260 ?auto_149263 ) ) ( not ( = ?auto_149260 ?auto_149264 ) ) ( not ( = ?auto_149260 ?auto_149265 ) ) ( not ( = ?auto_149260 ?auto_149266 ) ) ( not ( = ?auto_149261 ?auto_149262 ) ) ( not ( = ?auto_149261 ?auto_149263 ) ) ( not ( = ?auto_149261 ?auto_149264 ) ) ( not ( = ?auto_149261 ?auto_149265 ) ) ( not ( = ?auto_149261 ?auto_149266 ) ) ( not ( = ?auto_149262 ?auto_149263 ) ) ( not ( = ?auto_149262 ?auto_149264 ) ) ( not ( = ?auto_149262 ?auto_149265 ) ) ( not ( = ?auto_149262 ?auto_149266 ) ) ( not ( = ?auto_149263 ?auto_149264 ) ) ( not ( = ?auto_149263 ?auto_149265 ) ) ( not ( = ?auto_149263 ?auto_149266 ) ) ( not ( = ?auto_149264 ?auto_149265 ) ) ( not ( = ?auto_149264 ?auto_149266 ) ) ( not ( = ?auto_149265 ?auto_149266 ) ) ( ON ?auto_149264 ?auto_149265 ) ( CLEAR ?auto_149262 ) ( ON ?auto_149263 ?auto_149264 ) ( CLEAR ?auto_149263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149256 ?auto_149257 ?auto_149258 ?auto_149259 ?auto_149260 ?auto_149261 ?auto_149262 ?auto_149263 )
      ( MAKE-10PILE ?auto_149256 ?auto_149257 ?auto_149258 ?auto_149259 ?auto_149260 ?auto_149261 ?auto_149262 ?auto_149263 ?auto_149264 ?auto_149265 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149277 - BLOCK
      ?auto_149278 - BLOCK
      ?auto_149279 - BLOCK
      ?auto_149280 - BLOCK
      ?auto_149281 - BLOCK
      ?auto_149282 - BLOCK
      ?auto_149283 - BLOCK
      ?auto_149284 - BLOCK
      ?auto_149285 - BLOCK
      ?auto_149286 - BLOCK
    )
    :vars
    (
      ?auto_149287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149286 ?auto_149287 ) ( ON-TABLE ?auto_149277 ) ( ON ?auto_149278 ?auto_149277 ) ( ON ?auto_149279 ?auto_149278 ) ( ON ?auto_149280 ?auto_149279 ) ( ON ?auto_149281 ?auto_149280 ) ( ON ?auto_149282 ?auto_149281 ) ( ON ?auto_149283 ?auto_149282 ) ( not ( = ?auto_149277 ?auto_149278 ) ) ( not ( = ?auto_149277 ?auto_149279 ) ) ( not ( = ?auto_149277 ?auto_149280 ) ) ( not ( = ?auto_149277 ?auto_149281 ) ) ( not ( = ?auto_149277 ?auto_149282 ) ) ( not ( = ?auto_149277 ?auto_149283 ) ) ( not ( = ?auto_149277 ?auto_149284 ) ) ( not ( = ?auto_149277 ?auto_149285 ) ) ( not ( = ?auto_149277 ?auto_149286 ) ) ( not ( = ?auto_149277 ?auto_149287 ) ) ( not ( = ?auto_149278 ?auto_149279 ) ) ( not ( = ?auto_149278 ?auto_149280 ) ) ( not ( = ?auto_149278 ?auto_149281 ) ) ( not ( = ?auto_149278 ?auto_149282 ) ) ( not ( = ?auto_149278 ?auto_149283 ) ) ( not ( = ?auto_149278 ?auto_149284 ) ) ( not ( = ?auto_149278 ?auto_149285 ) ) ( not ( = ?auto_149278 ?auto_149286 ) ) ( not ( = ?auto_149278 ?auto_149287 ) ) ( not ( = ?auto_149279 ?auto_149280 ) ) ( not ( = ?auto_149279 ?auto_149281 ) ) ( not ( = ?auto_149279 ?auto_149282 ) ) ( not ( = ?auto_149279 ?auto_149283 ) ) ( not ( = ?auto_149279 ?auto_149284 ) ) ( not ( = ?auto_149279 ?auto_149285 ) ) ( not ( = ?auto_149279 ?auto_149286 ) ) ( not ( = ?auto_149279 ?auto_149287 ) ) ( not ( = ?auto_149280 ?auto_149281 ) ) ( not ( = ?auto_149280 ?auto_149282 ) ) ( not ( = ?auto_149280 ?auto_149283 ) ) ( not ( = ?auto_149280 ?auto_149284 ) ) ( not ( = ?auto_149280 ?auto_149285 ) ) ( not ( = ?auto_149280 ?auto_149286 ) ) ( not ( = ?auto_149280 ?auto_149287 ) ) ( not ( = ?auto_149281 ?auto_149282 ) ) ( not ( = ?auto_149281 ?auto_149283 ) ) ( not ( = ?auto_149281 ?auto_149284 ) ) ( not ( = ?auto_149281 ?auto_149285 ) ) ( not ( = ?auto_149281 ?auto_149286 ) ) ( not ( = ?auto_149281 ?auto_149287 ) ) ( not ( = ?auto_149282 ?auto_149283 ) ) ( not ( = ?auto_149282 ?auto_149284 ) ) ( not ( = ?auto_149282 ?auto_149285 ) ) ( not ( = ?auto_149282 ?auto_149286 ) ) ( not ( = ?auto_149282 ?auto_149287 ) ) ( not ( = ?auto_149283 ?auto_149284 ) ) ( not ( = ?auto_149283 ?auto_149285 ) ) ( not ( = ?auto_149283 ?auto_149286 ) ) ( not ( = ?auto_149283 ?auto_149287 ) ) ( not ( = ?auto_149284 ?auto_149285 ) ) ( not ( = ?auto_149284 ?auto_149286 ) ) ( not ( = ?auto_149284 ?auto_149287 ) ) ( not ( = ?auto_149285 ?auto_149286 ) ) ( not ( = ?auto_149285 ?auto_149287 ) ) ( not ( = ?auto_149286 ?auto_149287 ) ) ( ON ?auto_149285 ?auto_149286 ) ( CLEAR ?auto_149283 ) ( ON ?auto_149284 ?auto_149285 ) ( CLEAR ?auto_149284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149277 ?auto_149278 ?auto_149279 ?auto_149280 ?auto_149281 ?auto_149282 ?auto_149283 ?auto_149284 )
      ( MAKE-10PILE ?auto_149277 ?auto_149278 ?auto_149279 ?auto_149280 ?auto_149281 ?auto_149282 ?auto_149283 ?auto_149284 ?auto_149285 ?auto_149286 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149298 - BLOCK
      ?auto_149299 - BLOCK
      ?auto_149300 - BLOCK
      ?auto_149301 - BLOCK
      ?auto_149302 - BLOCK
      ?auto_149303 - BLOCK
      ?auto_149304 - BLOCK
      ?auto_149305 - BLOCK
      ?auto_149306 - BLOCK
      ?auto_149307 - BLOCK
    )
    :vars
    (
      ?auto_149308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149307 ?auto_149308 ) ( ON-TABLE ?auto_149298 ) ( ON ?auto_149299 ?auto_149298 ) ( ON ?auto_149300 ?auto_149299 ) ( ON ?auto_149301 ?auto_149300 ) ( ON ?auto_149302 ?auto_149301 ) ( ON ?auto_149303 ?auto_149302 ) ( not ( = ?auto_149298 ?auto_149299 ) ) ( not ( = ?auto_149298 ?auto_149300 ) ) ( not ( = ?auto_149298 ?auto_149301 ) ) ( not ( = ?auto_149298 ?auto_149302 ) ) ( not ( = ?auto_149298 ?auto_149303 ) ) ( not ( = ?auto_149298 ?auto_149304 ) ) ( not ( = ?auto_149298 ?auto_149305 ) ) ( not ( = ?auto_149298 ?auto_149306 ) ) ( not ( = ?auto_149298 ?auto_149307 ) ) ( not ( = ?auto_149298 ?auto_149308 ) ) ( not ( = ?auto_149299 ?auto_149300 ) ) ( not ( = ?auto_149299 ?auto_149301 ) ) ( not ( = ?auto_149299 ?auto_149302 ) ) ( not ( = ?auto_149299 ?auto_149303 ) ) ( not ( = ?auto_149299 ?auto_149304 ) ) ( not ( = ?auto_149299 ?auto_149305 ) ) ( not ( = ?auto_149299 ?auto_149306 ) ) ( not ( = ?auto_149299 ?auto_149307 ) ) ( not ( = ?auto_149299 ?auto_149308 ) ) ( not ( = ?auto_149300 ?auto_149301 ) ) ( not ( = ?auto_149300 ?auto_149302 ) ) ( not ( = ?auto_149300 ?auto_149303 ) ) ( not ( = ?auto_149300 ?auto_149304 ) ) ( not ( = ?auto_149300 ?auto_149305 ) ) ( not ( = ?auto_149300 ?auto_149306 ) ) ( not ( = ?auto_149300 ?auto_149307 ) ) ( not ( = ?auto_149300 ?auto_149308 ) ) ( not ( = ?auto_149301 ?auto_149302 ) ) ( not ( = ?auto_149301 ?auto_149303 ) ) ( not ( = ?auto_149301 ?auto_149304 ) ) ( not ( = ?auto_149301 ?auto_149305 ) ) ( not ( = ?auto_149301 ?auto_149306 ) ) ( not ( = ?auto_149301 ?auto_149307 ) ) ( not ( = ?auto_149301 ?auto_149308 ) ) ( not ( = ?auto_149302 ?auto_149303 ) ) ( not ( = ?auto_149302 ?auto_149304 ) ) ( not ( = ?auto_149302 ?auto_149305 ) ) ( not ( = ?auto_149302 ?auto_149306 ) ) ( not ( = ?auto_149302 ?auto_149307 ) ) ( not ( = ?auto_149302 ?auto_149308 ) ) ( not ( = ?auto_149303 ?auto_149304 ) ) ( not ( = ?auto_149303 ?auto_149305 ) ) ( not ( = ?auto_149303 ?auto_149306 ) ) ( not ( = ?auto_149303 ?auto_149307 ) ) ( not ( = ?auto_149303 ?auto_149308 ) ) ( not ( = ?auto_149304 ?auto_149305 ) ) ( not ( = ?auto_149304 ?auto_149306 ) ) ( not ( = ?auto_149304 ?auto_149307 ) ) ( not ( = ?auto_149304 ?auto_149308 ) ) ( not ( = ?auto_149305 ?auto_149306 ) ) ( not ( = ?auto_149305 ?auto_149307 ) ) ( not ( = ?auto_149305 ?auto_149308 ) ) ( not ( = ?auto_149306 ?auto_149307 ) ) ( not ( = ?auto_149306 ?auto_149308 ) ) ( not ( = ?auto_149307 ?auto_149308 ) ) ( ON ?auto_149306 ?auto_149307 ) ( ON ?auto_149305 ?auto_149306 ) ( CLEAR ?auto_149303 ) ( ON ?auto_149304 ?auto_149305 ) ( CLEAR ?auto_149304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149298 ?auto_149299 ?auto_149300 ?auto_149301 ?auto_149302 ?auto_149303 ?auto_149304 )
      ( MAKE-10PILE ?auto_149298 ?auto_149299 ?auto_149300 ?auto_149301 ?auto_149302 ?auto_149303 ?auto_149304 ?auto_149305 ?auto_149306 ?auto_149307 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149319 - BLOCK
      ?auto_149320 - BLOCK
      ?auto_149321 - BLOCK
      ?auto_149322 - BLOCK
      ?auto_149323 - BLOCK
      ?auto_149324 - BLOCK
      ?auto_149325 - BLOCK
      ?auto_149326 - BLOCK
      ?auto_149327 - BLOCK
      ?auto_149328 - BLOCK
    )
    :vars
    (
      ?auto_149329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149328 ?auto_149329 ) ( ON-TABLE ?auto_149319 ) ( ON ?auto_149320 ?auto_149319 ) ( ON ?auto_149321 ?auto_149320 ) ( ON ?auto_149322 ?auto_149321 ) ( ON ?auto_149323 ?auto_149322 ) ( ON ?auto_149324 ?auto_149323 ) ( not ( = ?auto_149319 ?auto_149320 ) ) ( not ( = ?auto_149319 ?auto_149321 ) ) ( not ( = ?auto_149319 ?auto_149322 ) ) ( not ( = ?auto_149319 ?auto_149323 ) ) ( not ( = ?auto_149319 ?auto_149324 ) ) ( not ( = ?auto_149319 ?auto_149325 ) ) ( not ( = ?auto_149319 ?auto_149326 ) ) ( not ( = ?auto_149319 ?auto_149327 ) ) ( not ( = ?auto_149319 ?auto_149328 ) ) ( not ( = ?auto_149319 ?auto_149329 ) ) ( not ( = ?auto_149320 ?auto_149321 ) ) ( not ( = ?auto_149320 ?auto_149322 ) ) ( not ( = ?auto_149320 ?auto_149323 ) ) ( not ( = ?auto_149320 ?auto_149324 ) ) ( not ( = ?auto_149320 ?auto_149325 ) ) ( not ( = ?auto_149320 ?auto_149326 ) ) ( not ( = ?auto_149320 ?auto_149327 ) ) ( not ( = ?auto_149320 ?auto_149328 ) ) ( not ( = ?auto_149320 ?auto_149329 ) ) ( not ( = ?auto_149321 ?auto_149322 ) ) ( not ( = ?auto_149321 ?auto_149323 ) ) ( not ( = ?auto_149321 ?auto_149324 ) ) ( not ( = ?auto_149321 ?auto_149325 ) ) ( not ( = ?auto_149321 ?auto_149326 ) ) ( not ( = ?auto_149321 ?auto_149327 ) ) ( not ( = ?auto_149321 ?auto_149328 ) ) ( not ( = ?auto_149321 ?auto_149329 ) ) ( not ( = ?auto_149322 ?auto_149323 ) ) ( not ( = ?auto_149322 ?auto_149324 ) ) ( not ( = ?auto_149322 ?auto_149325 ) ) ( not ( = ?auto_149322 ?auto_149326 ) ) ( not ( = ?auto_149322 ?auto_149327 ) ) ( not ( = ?auto_149322 ?auto_149328 ) ) ( not ( = ?auto_149322 ?auto_149329 ) ) ( not ( = ?auto_149323 ?auto_149324 ) ) ( not ( = ?auto_149323 ?auto_149325 ) ) ( not ( = ?auto_149323 ?auto_149326 ) ) ( not ( = ?auto_149323 ?auto_149327 ) ) ( not ( = ?auto_149323 ?auto_149328 ) ) ( not ( = ?auto_149323 ?auto_149329 ) ) ( not ( = ?auto_149324 ?auto_149325 ) ) ( not ( = ?auto_149324 ?auto_149326 ) ) ( not ( = ?auto_149324 ?auto_149327 ) ) ( not ( = ?auto_149324 ?auto_149328 ) ) ( not ( = ?auto_149324 ?auto_149329 ) ) ( not ( = ?auto_149325 ?auto_149326 ) ) ( not ( = ?auto_149325 ?auto_149327 ) ) ( not ( = ?auto_149325 ?auto_149328 ) ) ( not ( = ?auto_149325 ?auto_149329 ) ) ( not ( = ?auto_149326 ?auto_149327 ) ) ( not ( = ?auto_149326 ?auto_149328 ) ) ( not ( = ?auto_149326 ?auto_149329 ) ) ( not ( = ?auto_149327 ?auto_149328 ) ) ( not ( = ?auto_149327 ?auto_149329 ) ) ( not ( = ?auto_149328 ?auto_149329 ) ) ( ON ?auto_149327 ?auto_149328 ) ( ON ?auto_149326 ?auto_149327 ) ( CLEAR ?auto_149324 ) ( ON ?auto_149325 ?auto_149326 ) ( CLEAR ?auto_149325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149319 ?auto_149320 ?auto_149321 ?auto_149322 ?auto_149323 ?auto_149324 ?auto_149325 )
      ( MAKE-10PILE ?auto_149319 ?auto_149320 ?auto_149321 ?auto_149322 ?auto_149323 ?auto_149324 ?auto_149325 ?auto_149326 ?auto_149327 ?auto_149328 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149340 - BLOCK
      ?auto_149341 - BLOCK
      ?auto_149342 - BLOCK
      ?auto_149343 - BLOCK
      ?auto_149344 - BLOCK
      ?auto_149345 - BLOCK
      ?auto_149346 - BLOCK
      ?auto_149347 - BLOCK
      ?auto_149348 - BLOCK
      ?auto_149349 - BLOCK
    )
    :vars
    (
      ?auto_149350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149349 ?auto_149350 ) ( ON-TABLE ?auto_149340 ) ( ON ?auto_149341 ?auto_149340 ) ( ON ?auto_149342 ?auto_149341 ) ( ON ?auto_149343 ?auto_149342 ) ( ON ?auto_149344 ?auto_149343 ) ( not ( = ?auto_149340 ?auto_149341 ) ) ( not ( = ?auto_149340 ?auto_149342 ) ) ( not ( = ?auto_149340 ?auto_149343 ) ) ( not ( = ?auto_149340 ?auto_149344 ) ) ( not ( = ?auto_149340 ?auto_149345 ) ) ( not ( = ?auto_149340 ?auto_149346 ) ) ( not ( = ?auto_149340 ?auto_149347 ) ) ( not ( = ?auto_149340 ?auto_149348 ) ) ( not ( = ?auto_149340 ?auto_149349 ) ) ( not ( = ?auto_149340 ?auto_149350 ) ) ( not ( = ?auto_149341 ?auto_149342 ) ) ( not ( = ?auto_149341 ?auto_149343 ) ) ( not ( = ?auto_149341 ?auto_149344 ) ) ( not ( = ?auto_149341 ?auto_149345 ) ) ( not ( = ?auto_149341 ?auto_149346 ) ) ( not ( = ?auto_149341 ?auto_149347 ) ) ( not ( = ?auto_149341 ?auto_149348 ) ) ( not ( = ?auto_149341 ?auto_149349 ) ) ( not ( = ?auto_149341 ?auto_149350 ) ) ( not ( = ?auto_149342 ?auto_149343 ) ) ( not ( = ?auto_149342 ?auto_149344 ) ) ( not ( = ?auto_149342 ?auto_149345 ) ) ( not ( = ?auto_149342 ?auto_149346 ) ) ( not ( = ?auto_149342 ?auto_149347 ) ) ( not ( = ?auto_149342 ?auto_149348 ) ) ( not ( = ?auto_149342 ?auto_149349 ) ) ( not ( = ?auto_149342 ?auto_149350 ) ) ( not ( = ?auto_149343 ?auto_149344 ) ) ( not ( = ?auto_149343 ?auto_149345 ) ) ( not ( = ?auto_149343 ?auto_149346 ) ) ( not ( = ?auto_149343 ?auto_149347 ) ) ( not ( = ?auto_149343 ?auto_149348 ) ) ( not ( = ?auto_149343 ?auto_149349 ) ) ( not ( = ?auto_149343 ?auto_149350 ) ) ( not ( = ?auto_149344 ?auto_149345 ) ) ( not ( = ?auto_149344 ?auto_149346 ) ) ( not ( = ?auto_149344 ?auto_149347 ) ) ( not ( = ?auto_149344 ?auto_149348 ) ) ( not ( = ?auto_149344 ?auto_149349 ) ) ( not ( = ?auto_149344 ?auto_149350 ) ) ( not ( = ?auto_149345 ?auto_149346 ) ) ( not ( = ?auto_149345 ?auto_149347 ) ) ( not ( = ?auto_149345 ?auto_149348 ) ) ( not ( = ?auto_149345 ?auto_149349 ) ) ( not ( = ?auto_149345 ?auto_149350 ) ) ( not ( = ?auto_149346 ?auto_149347 ) ) ( not ( = ?auto_149346 ?auto_149348 ) ) ( not ( = ?auto_149346 ?auto_149349 ) ) ( not ( = ?auto_149346 ?auto_149350 ) ) ( not ( = ?auto_149347 ?auto_149348 ) ) ( not ( = ?auto_149347 ?auto_149349 ) ) ( not ( = ?auto_149347 ?auto_149350 ) ) ( not ( = ?auto_149348 ?auto_149349 ) ) ( not ( = ?auto_149348 ?auto_149350 ) ) ( not ( = ?auto_149349 ?auto_149350 ) ) ( ON ?auto_149348 ?auto_149349 ) ( ON ?auto_149347 ?auto_149348 ) ( ON ?auto_149346 ?auto_149347 ) ( CLEAR ?auto_149344 ) ( ON ?auto_149345 ?auto_149346 ) ( CLEAR ?auto_149345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149340 ?auto_149341 ?auto_149342 ?auto_149343 ?auto_149344 ?auto_149345 )
      ( MAKE-10PILE ?auto_149340 ?auto_149341 ?auto_149342 ?auto_149343 ?auto_149344 ?auto_149345 ?auto_149346 ?auto_149347 ?auto_149348 ?auto_149349 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149361 - BLOCK
      ?auto_149362 - BLOCK
      ?auto_149363 - BLOCK
      ?auto_149364 - BLOCK
      ?auto_149365 - BLOCK
      ?auto_149366 - BLOCK
      ?auto_149367 - BLOCK
      ?auto_149368 - BLOCK
      ?auto_149369 - BLOCK
      ?auto_149370 - BLOCK
    )
    :vars
    (
      ?auto_149371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149370 ?auto_149371 ) ( ON-TABLE ?auto_149361 ) ( ON ?auto_149362 ?auto_149361 ) ( ON ?auto_149363 ?auto_149362 ) ( ON ?auto_149364 ?auto_149363 ) ( ON ?auto_149365 ?auto_149364 ) ( not ( = ?auto_149361 ?auto_149362 ) ) ( not ( = ?auto_149361 ?auto_149363 ) ) ( not ( = ?auto_149361 ?auto_149364 ) ) ( not ( = ?auto_149361 ?auto_149365 ) ) ( not ( = ?auto_149361 ?auto_149366 ) ) ( not ( = ?auto_149361 ?auto_149367 ) ) ( not ( = ?auto_149361 ?auto_149368 ) ) ( not ( = ?auto_149361 ?auto_149369 ) ) ( not ( = ?auto_149361 ?auto_149370 ) ) ( not ( = ?auto_149361 ?auto_149371 ) ) ( not ( = ?auto_149362 ?auto_149363 ) ) ( not ( = ?auto_149362 ?auto_149364 ) ) ( not ( = ?auto_149362 ?auto_149365 ) ) ( not ( = ?auto_149362 ?auto_149366 ) ) ( not ( = ?auto_149362 ?auto_149367 ) ) ( not ( = ?auto_149362 ?auto_149368 ) ) ( not ( = ?auto_149362 ?auto_149369 ) ) ( not ( = ?auto_149362 ?auto_149370 ) ) ( not ( = ?auto_149362 ?auto_149371 ) ) ( not ( = ?auto_149363 ?auto_149364 ) ) ( not ( = ?auto_149363 ?auto_149365 ) ) ( not ( = ?auto_149363 ?auto_149366 ) ) ( not ( = ?auto_149363 ?auto_149367 ) ) ( not ( = ?auto_149363 ?auto_149368 ) ) ( not ( = ?auto_149363 ?auto_149369 ) ) ( not ( = ?auto_149363 ?auto_149370 ) ) ( not ( = ?auto_149363 ?auto_149371 ) ) ( not ( = ?auto_149364 ?auto_149365 ) ) ( not ( = ?auto_149364 ?auto_149366 ) ) ( not ( = ?auto_149364 ?auto_149367 ) ) ( not ( = ?auto_149364 ?auto_149368 ) ) ( not ( = ?auto_149364 ?auto_149369 ) ) ( not ( = ?auto_149364 ?auto_149370 ) ) ( not ( = ?auto_149364 ?auto_149371 ) ) ( not ( = ?auto_149365 ?auto_149366 ) ) ( not ( = ?auto_149365 ?auto_149367 ) ) ( not ( = ?auto_149365 ?auto_149368 ) ) ( not ( = ?auto_149365 ?auto_149369 ) ) ( not ( = ?auto_149365 ?auto_149370 ) ) ( not ( = ?auto_149365 ?auto_149371 ) ) ( not ( = ?auto_149366 ?auto_149367 ) ) ( not ( = ?auto_149366 ?auto_149368 ) ) ( not ( = ?auto_149366 ?auto_149369 ) ) ( not ( = ?auto_149366 ?auto_149370 ) ) ( not ( = ?auto_149366 ?auto_149371 ) ) ( not ( = ?auto_149367 ?auto_149368 ) ) ( not ( = ?auto_149367 ?auto_149369 ) ) ( not ( = ?auto_149367 ?auto_149370 ) ) ( not ( = ?auto_149367 ?auto_149371 ) ) ( not ( = ?auto_149368 ?auto_149369 ) ) ( not ( = ?auto_149368 ?auto_149370 ) ) ( not ( = ?auto_149368 ?auto_149371 ) ) ( not ( = ?auto_149369 ?auto_149370 ) ) ( not ( = ?auto_149369 ?auto_149371 ) ) ( not ( = ?auto_149370 ?auto_149371 ) ) ( ON ?auto_149369 ?auto_149370 ) ( ON ?auto_149368 ?auto_149369 ) ( ON ?auto_149367 ?auto_149368 ) ( CLEAR ?auto_149365 ) ( ON ?auto_149366 ?auto_149367 ) ( CLEAR ?auto_149366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149361 ?auto_149362 ?auto_149363 ?auto_149364 ?auto_149365 ?auto_149366 )
      ( MAKE-10PILE ?auto_149361 ?auto_149362 ?auto_149363 ?auto_149364 ?auto_149365 ?auto_149366 ?auto_149367 ?auto_149368 ?auto_149369 ?auto_149370 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149382 - BLOCK
      ?auto_149383 - BLOCK
      ?auto_149384 - BLOCK
      ?auto_149385 - BLOCK
      ?auto_149386 - BLOCK
      ?auto_149387 - BLOCK
      ?auto_149388 - BLOCK
      ?auto_149389 - BLOCK
      ?auto_149390 - BLOCK
      ?auto_149391 - BLOCK
    )
    :vars
    (
      ?auto_149392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149391 ?auto_149392 ) ( ON-TABLE ?auto_149382 ) ( ON ?auto_149383 ?auto_149382 ) ( ON ?auto_149384 ?auto_149383 ) ( ON ?auto_149385 ?auto_149384 ) ( not ( = ?auto_149382 ?auto_149383 ) ) ( not ( = ?auto_149382 ?auto_149384 ) ) ( not ( = ?auto_149382 ?auto_149385 ) ) ( not ( = ?auto_149382 ?auto_149386 ) ) ( not ( = ?auto_149382 ?auto_149387 ) ) ( not ( = ?auto_149382 ?auto_149388 ) ) ( not ( = ?auto_149382 ?auto_149389 ) ) ( not ( = ?auto_149382 ?auto_149390 ) ) ( not ( = ?auto_149382 ?auto_149391 ) ) ( not ( = ?auto_149382 ?auto_149392 ) ) ( not ( = ?auto_149383 ?auto_149384 ) ) ( not ( = ?auto_149383 ?auto_149385 ) ) ( not ( = ?auto_149383 ?auto_149386 ) ) ( not ( = ?auto_149383 ?auto_149387 ) ) ( not ( = ?auto_149383 ?auto_149388 ) ) ( not ( = ?auto_149383 ?auto_149389 ) ) ( not ( = ?auto_149383 ?auto_149390 ) ) ( not ( = ?auto_149383 ?auto_149391 ) ) ( not ( = ?auto_149383 ?auto_149392 ) ) ( not ( = ?auto_149384 ?auto_149385 ) ) ( not ( = ?auto_149384 ?auto_149386 ) ) ( not ( = ?auto_149384 ?auto_149387 ) ) ( not ( = ?auto_149384 ?auto_149388 ) ) ( not ( = ?auto_149384 ?auto_149389 ) ) ( not ( = ?auto_149384 ?auto_149390 ) ) ( not ( = ?auto_149384 ?auto_149391 ) ) ( not ( = ?auto_149384 ?auto_149392 ) ) ( not ( = ?auto_149385 ?auto_149386 ) ) ( not ( = ?auto_149385 ?auto_149387 ) ) ( not ( = ?auto_149385 ?auto_149388 ) ) ( not ( = ?auto_149385 ?auto_149389 ) ) ( not ( = ?auto_149385 ?auto_149390 ) ) ( not ( = ?auto_149385 ?auto_149391 ) ) ( not ( = ?auto_149385 ?auto_149392 ) ) ( not ( = ?auto_149386 ?auto_149387 ) ) ( not ( = ?auto_149386 ?auto_149388 ) ) ( not ( = ?auto_149386 ?auto_149389 ) ) ( not ( = ?auto_149386 ?auto_149390 ) ) ( not ( = ?auto_149386 ?auto_149391 ) ) ( not ( = ?auto_149386 ?auto_149392 ) ) ( not ( = ?auto_149387 ?auto_149388 ) ) ( not ( = ?auto_149387 ?auto_149389 ) ) ( not ( = ?auto_149387 ?auto_149390 ) ) ( not ( = ?auto_149387 ?auto_149391 ) ) ( not ( = ?auto_149387 ?auto_149392 ) ) ( not ( = ?auto_149388 ?auto_149389 ) ) ( not ( = ?auto_149388 ?auto_149390 ) ) ( not ( = ?auto_149388 ?auto_149391 ) ) ( not ( = ?auto_149388 ?auto_149392 ) ) ( not ( = ?auto_149389 ?auto_149390 ) ) ( not ( = ?auto_149389 ?auto_149391 ) ) ( not ( = ?auto_149389 ?auto_149392 ) ) ( not ( = ?auto_149390 ?auto_149391 ) ) ( not ( = ?auto_149390 ?auto_149392 ) ) ( not ( = ?auto_149391 ?auto_149392 ) ) ( ON ?auto_149390 ?auto_149391 ) ( ON ?auto_149389 ?auto_149390 ) ( ON ?auto_149388 ?auto_149389 ) ( ON ?auto_149387 ?auto_149388 ) ( CLEAR ?auto_149385 ) ( ON ?auto_149386 ?auto_149387 ) ( CLEAR ?auto_149386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149382 ?auto_149383 ?auto_149384 ?auto_149385 ?auto_149386 )
      ( MAKE-10PILE ?auto_149382 ?auto_149383 ?auto_149384 ?auto_149385 ?auto_149386 ?auto_149387 ?auto_149388 ?auto_149389 ?auto_149390 ?auto_149391 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149403 - BLOCK
      ?auto_149404 - BLOCK
      ?auto_149405 - BLOCK
      ?auto_149406 - BLOCK
      ?auto_149407 - BLOCK
      ?auto_149408 - BLOCK
      ?auto_149409 - BLOCK
      ?auto_149410 - BLOCK
      ?auto_149411 - BLOCK
      ?auto_149412 - BLOCK
    )
    :vars
    (
      ?auto_149413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149412 ?auto_149413 ) ( ON-TABLE ?auto_149403 ) ( ON ?auto_149404 ?auto_149403 ) ( ON ?auto_149405 ?auto_149404 ) ( ON ?auto_149406 ?auto_149405 ) ( not ( = ?auto_149403 ?auto_149404 ) ) ( not ( = ?auto_149403 ?auto_149405 ) ) ( not ( = ?auto_149403 ?auto_149406 ) ) ( not ( = ?auto_149403 ?auto_149407 ) ) ( not ( = ?auto_149403 ?auto_149408 ) ) ( not ( = ?auto_149403 ?auto_149409 ) ) ( not ( = ?auto_149403 ?auto_149410 ) ) ( not ( = ?auto_149403 ?auto_149411 ) ) ( not ( = ?auto_149403 ?auto_149412 ) ) ( not ( = ?auto_149403 ?auto_149413 ) ) ( not ( = ?auto_149404 ?auto_149405 ) ) ( not ( = ?auto_149404 ?auto_149406 ) ) ( not ( = ?auto_149404 ?auto_149407 ) ) ( not ( = ?auto_149404 ?auto_149408 ) ) ( not ( = ?auto_149404 ?auto_149409 ) ) ( not ( = ?auto_149404 ?auto_149410 ) ) ( not ( = ?auto_149404 ?auto_149411 ) ) ( not ( = ?auto_149404 ?auto_149412 ) ) ( not ( = ?auto_149404 ?auto_149413 ) ) ( not ( = ?auto_149405 ?auto_149406 ) ) ( not ( = ?auto_149405 ?auto_149407 ) ) ( not ( = ?auto_149405 ?auto_149408 ) ) ( not ( = ?auto_149405 ?auto_149409 ) ) ( not ( = ?auto_149405 ?auto_149410 ) ) ( not ( = ?auto_149405 ?auto_149411 ) ) ( not ( = ?auto_149405 ?auto_149412 ) ) ( not ( = ?auto_149405 ?auto_149413 ) ) ( not ( = ?auto_149406 ?auto_149407 ) ) ( not ( = ?auto_149406 ?auto_149408 ) ) ( not ( = ?auto_149406 ?auto_149409 ) ) ( not ( = ?auto_149406 ?auto_149410 ) ) ( not ( = ?auto_149406 ?auto_149411 ) ) ( not ( = ?auto_149406 ?auto_149412 ) ) ( not ( = ?auto_149406 ?auto_149413 ) ) ( not ( = ?auto_149407 ?auto_149408 ) ) ( not ( = ?auto_149407 ?auto_149409 ) ) ( not ( = ?auto_149407 ?auto_149410 ) ) ( not ( = ?auto_149407 ?auto_149411 ) ) ( not ( = ?auto_149407 ?auto_149412 ) ) ( not ( = ?auto_149407 ?auto_149413 ) ) ( not ( = ?auto_149408 ?auto_149409 ) ) ( not ( = ?auto_149408 ?auto_149410 ) ) ( not ( = ?auto_149408 ?auto_149411 ) ) ( not ( = ?auto_149408 ?auto_149412 ) ) ( not ( = ?auto_149408 ?auto_149413 ) ) ( not ( = ?auto_149409 ?auto_149410 ) ) ( not ( = ?auto_149409 ?auto_149411 ) ) ( not ( = ?auto_149409 ?auto_149412 ) ) ( not ( = ?auto_149409 ?auto_149413 ) ) ( not ( = ?auto_149410 ?auto_149411 ) ) ( not ( = ?auto_149410 ?auto_149412 ) ) ( not ( = ?auto_149410 ?auto_149413 ) ) ( not ( = ?auto_149411 ?auto_149412 ) ) ( not ( = ?auto_149411 ?auto_149413 ) ) ( not ( = ?auto_149412 ?auto_149413 ) ) ( ON ?auto_149411 ?auto_149412 ) ( ON ?auto_149410 ?auto_149411 ) ( ON ?auto_149409 ?auto_149410 ) ( ON ?auto_149408 ?auto_149409 ) ( CLEAR ?auto_149406 ) ( ON ?auto_149407 ?auto_149408 ) ( CLEAR ?auto_149407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149403 ?auto_149404 ?auto_149405 ?auto_149406 ?auto_149407 )
      ( MAKE-10PILE ?auto_149403 ?auto_149404 ?auto_149405 ?auto_149406 ?auto_149407 ?auto_149408 ?auto_149409 ?auto_149410 ?auto_149411 ?auto_149412 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149424 - BLOCK
      ?auto_149425 - BLOCK
      ?auto_149426 - BLOCK
      ?auto_149427 - BLOCK
      ?auto_149428 - BLOCK
      ?auto_149429 - BLOCK
      ?auto_149430 - BLOCK
      ?auto_149431 - BLOCK
      ?auto_149432 - BLOCK
      ?auto_149433 - BLOCK
    )
    :vars
    (
      ?auto_149434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149433 ?auto_149434 ) ( ON-TABLE ?auto_149424 ) ( ON ?auto_149425 ?auto_149424 ) ( ON ?auto_149426 ?auto_149425 ) ( not ( = ?auto_149424 ?auto_149425 ) ) ( not ( = ?auto_149424 ?auto_149426 ) ) ( not ( = ?auto_149424 ?auto_149427 ) ) ( not ( = ?auto_149424 ?auto_149428 ) ) ( not ( = ?auto_149424 ?auto_149429 ) ) ( not ( = ?auto_149424 ?auto_149430 ) ) ( not ( = ?auto_149424 ?auto_149431 ) ) ( not ( = ?auto_149424 ?auto_149432 ) ) ( not ( = ?auto_149424 ?auto_149433 ) ) ( not ( = ?auto_149424 ?auto_149434 ) ) ( not ( = ?auto_149425 ?auto_149426 ) ) ( not ( = ?auto_149425 ?auto_149427 ) ) ( not ( = ?auto_149425 ?auto_149428 ) ) ( not ( = ?auto_149425 ?auto_149429 ) ) ( not ( = ?auto_149425 ?auto_149430 ) ) ( not ( = ?auto_149425 ?auto_149431 ) ) ( not ( = ?auto_149425 ?auto_149432 ) ) ( not ( = ?auto_149425 ?auto_149433 ) ) ( not ( = ?auto_149425 ?auto_149434 ) ) ( not ( = ?auto_149426 ?auto_149427 ) ) ( not ( = ?auto_149426 ?auto_149428 ) ) ( not ( = ?auto_149426 ?auto_149429 ) ) ( not ( = ?auto_149426 ?auto_149430 ) ) ( not ( = ?auto_149426 ?auto_149431 ) ) ( not ( = ?auto_149426 ?auto_149432 ) ) ( not ( = ?auto_149426 ?auto_149433 ) ) ( not ( = ?auto_149426 ?auto_149434 ) ) ( not ( = ?auto_149427 ?auto_149428 ) ) ( not ( = ?auto_149427 ?auto_149429 ) ) ( not ( = ?auto_149427 ?auto_149430 ) ) ( not ( = ?auto_149427 ?auto_149431 ) ) ( not ( = ?auto_149427 ?auto_149432 ) ) ( not ( = ?auto_149427 ?auto_149433 ) ) ( not ( = ?auto_149427 ?auto_149434 ) ) ( not ( = ?auto_149428 ?auto_149429 ) ) ( not ( = ?auto_149428 ?auto_149430 ) ) ( not ( = ?auto_149428 ?auto_149431 ) ) ( not ( = ?auto_149428 ?auto_149432 ) ) ( not ( = ?auto_149428 ?auto_149433 ) ) ( not ( = ?auto_149428 ?auto_149434 ) ) ( not ( = ?auto_149429 ?auto_149430 ) ) ( not ( = ?auto_149429 ?auto_149431 ) ) ( not ( = ?auto_149429 ?auto_149432 ) ) ( not ( = ?auto_149429 ?auto_149433 ) ) ( not ( = ?auto_149429 ?auto_149434 ) ) ( not ( = ?auto_149430 ?auto_149431 ) ) ( not ( = ?auto_149430 ?auto_149432 ) ) ( not ( = ?auto_149430 ?auto_149433 ) ) ( not ( = ?auto_149430 ?auto_149434 ) ) ( not ( = ?auto_149431 ?auto_149432 ) ) ( not ( = ?auto_149431 ?auto_149433 ) ) ( not ( = ?auto_149431 ?auto_149434 ) ) ( not ( = ?auto_149432 ?auto_149433 ) ) ( not ( = ?auto_149432 ?auto_149434 ) ) ( not ( = ?auto_149433 ?auto_149434 ) ) ( ON ?auto_149432 ?auto_149433 ) ( ON ?auto_149431 ?auto_149432 ) ( ON ?auto_149430 ?auto_149431 ) ( ON ?auto_149429 ?auto_149430 ) ( ON ?auto_149428 ?auto_149429 ) ( CLEAR ?auto_149426 ) ( ON ?auto_149427 ?auto_149428 ) ( CLEAR ?auto_149427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149424 ?auto_149425 ?auto_149426 ?auto_149427 )
      ( MAKE-10PILE ?auto_149424 ?auto_149425 ?auto_149426 ?auto_149427 ?auto_149428 ?auto_149429 ?auto_149430 ?auto_149431 ?auto_149432 ?auto_149433 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149445 - BLOCK
      ?auto_149446 - BLOCK
      ?auto_149447 - BLOCK
      ?auto_149448 - BLOCK
      ?auto_149449 - BLOCK
      ?auto_149450 - BLOCK
      ?auto_149451 - BLOCK
      ?auto_149452 - BLOCK
      ?auto_149453 - BLOCK
      ?auto_149454 - BLOCK
    )
    :vars
    (
      ?auto_149455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149454 ?auto_149455 ) ( ON-TABLE ?auto_149445 ) ( ON ?auto_149446 ?auto_149445 ) ( ON ?auto_149447 ?auto_149446 ) ( not ( = ?auto_149445 ?auto_149446 ) ) ( not ( = ?auto_149445 ?auto_149447 ) ) ( not ( = ?auto_149445 ?auto_149448 ) ) ( not ( = ?auto_149445 ?auto_149449 ) ) ( not ( = ?auto_149445 ?auto_149450 ) ) ( not ( = ?auto_149445 ?auto_149451 ) ) ( not ( = ?auto_149445 ?auto_149452 ) ) ( not ( = ?auto_149445 ?auto_149453 ) ) ( not ( = ?auto_149445 ?auto_149454 ) ) ( not ( = ?auto_149445 ?auto_149455 ) ) ( not ( = ?auto_149446 ?auto_149447 ) ) ( not ( = ?auto_149446 ?auto_149448 ) ) ( not ( = ?auto_149446 ?auto_149449 ) ) ( not ( = ?auto_149446 ?auto_149450 ) ) ( not ( = ?auto_149446 ?auto_149451 ) ) ( not ( = ?auto_149446 ?auto_149452 ) ) ( not ( = ?auto_149446 ?auto_149453 ) ) ( not ( = ?auto_149446 ?auto_149454 ) ) ( not ( = ?auto_149446 ?auto_149455 ) ) ( not ( = ?auto_149447 ?auto_149448 ) ) ( not ( = ?auto_149447 ?auto_149449 ) ) ( not ( = ?auto_149447 ?auto_149450 ) ) ( not ( = ?auto_149447 ?auto_149451 ) ) ( not ( = ?auto_149447 ?auto_149452 ) ) ( not ( = ?auto_149447 ?auto_149453 ) ) ( not ( = ?auto_149447 ?auto_149454 ) ) ( not ( = ?auto_149447 ?auto_149455 ) ) ( not ( = ?auto_149448 ?auto_149449 ) ) ( not ( = ?auto_149448 ?auto_149450 ) ) ( not ( = ?auto_149448 ?auto_149451 ) ) ( not ( = ?auto_149448 ?auto_149452 ) ) ( not ( = ?auto_149448 ?auto_149453 ) ) ( not ( = ?auto_149448 ?auto_149454 ) ) ( not ( = ?auto_149448 ?auto_149455 ) ) ( not ( = ?auto_149449 ?auto_149450 ) ) ( not ( = ?auto_149449 ?auto_149451 ) ) ( not ( = ?auto_149449 ?auto_149452 ) ) ( not ( = ?auto_149449 ?auto_149453 ) ) ( not ( = ?auto_149449 ?auto_149454 ) ) ( not ( = ?auto_149449 ?auto_149455 ) ) ( not ( = ?auto_149450 ?auto_149451 ) ) ( not ( = ?auto_149450 ?auto_149452 ) ) ( not ( = ?auto_149450 ?auto_149453 ) ) ( not ( = ?auto_149450 ?auto_149454 ) ) ( not ( = ?auto_149450 ?auto_149455 ) ) ( not ( = ?auto_149451 ?auto_149452 ) ) ( not ( = ?auto_149451 ?auto_149453 ) ) ( not ( = ?auto_149451 ?auto_149454 ) ) ( not ( = ?auto_149451 ?auto_149455 ) ) ( not ( = ?auto_149452 ?auto_149453 ) ) ( not ( = ?auto_149452 ?auto_149454 ) ) ( not ( = ?auto_149452 ?auto_149455 ) ) ( not ( = ?auto_149453 ?auto_149454 ) ) ( not ( = ?auto_149453 ?auto_149455 ) ) ( not ( = ?auto_149454 ?auto_149455 ) ) ( ON ?auto_149453 ?auto_149454 ) ( ON ?auto_149452 ?auto_149453 ) ( ON ?auto_149451 ?auto_149452 ) ( ON ?auto_149450 ?auto_149451 ) ( ON ?auto_149449 ?auto_149450 ) ( CLEAR ?auto_149447 ) ( ON ?auto_149448 ?auto_149449 ) ( CLEAR ?auto_149448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149445 ?auto_149446 ?auto_149447 ?auto_149448 )
      ( MAKE-10PILE ?auto_149445 ?auto_149446 ?auto_149447 ?auto_149448 ?auto_149449 ?auto_149450 ?auto_149451 ?auto_149452 ?auto_149453 ?auto_149454 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149466 - BLOCK
      ?auto_149467 - BLOCK
      ?auto_149468 - BLOCK
      ?auto_149469 - BLOCK
      ?auto_149470 - BLOCK
      ?auto_149471 - BLOCK
      ?auto_149472 - BLOCK
      ?auto_149473 - BLOCK
      ?auto_149474 - BLOCK
      ?auto_149475 - BLOCK
    )
    :vars
    (
      ?auto_149476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149475 ?auto_149476 ) ( ON-TABLE ?auto_149466 ) ( ON ?auto_149467 ?auto_149466 ) ( not ( = ?auto_149466 ?auto_149467 ) ) ( not ( = ?auto_149466 ?auto_149468 ) ) ( not ( = ?auto_149466 ?auto_149469 ) ) ( not ( = ?auto_149466 ?auto_149470 ) ) ( not ( = ?auto_149466 ?auto_149471 ) ) ( not ( = ?auto_149466 ?auto_149472 ) ) ( not ( = ?auto_149466 ?auto_149473 ) ) ( not ( = ?auto_149466 ?auto_149474 ) ) ( not ( = ?auto_149466 ?auto_149475 ) ) ( not ( = ?auto_149466 ?auto_149476 ) ) ( not ( = ?auto_149467 ?auto_149468 ) ) ( not ( = ?auto_149467 ?auto_149469 ) ) ( not ( = ?auto_149467 ?auto_149470 ) ) ( not ( = ?auto_149467 ?auto_149471 ) ) ( not ( = ?auto_149467 ?auto_149472 ) ) ( not ( = ?auto_149467 ?auto_149473 ) ) ( not ( = ?auto_149467 ?auto_149474 ) ) ( not ( = ?auto_149467 ?auto_149475 ) ) ( not ( = ?auto_149467 ?auto_149476 ) ) ( not ( = ?auto_149468 ?auto_149469 ) ) ( not ( = ?auto_149468 ?auto_149470 ) ) ( not ( = ?auto_149468 ?auto_149471 ) ) ( not ( = ?auto_149468 ?auto_149472 ) ) ( not ( = ?auto_149468 ?auto_149473 ) ) ( not ( = ?auto_149468 ?auto_149474 ) ) ( not ( = ?auto_149468 ?auto_149475 ) ) ( not ( = ?auto_149468 ?auto_149476 ) ) ( not ( = ?auto_149469 ?auto_149470 ) ) ( not ( = ?auto_149469 ?auto_149471 ) ) ( not ( = ?auto_149469 ?auto_149472 ) ) ( not ( = ?auto_149469 ?auto_149473 ) ) ( not ( = ?auto_149469 ?auto_149474 ) ) ( not ( = ?auto_149469 ?auto_149475 ) ) ( not ( = ?auto_149469 ?auto_149476 ) ) ( not ( = ?auto_149470 ?auto_149471 ) ) ( not ( = ?auto_149470 ?auto_149472 ) ) ( not ( = ?auto_149470 ?auto_149473 ) ) ( not ( = ?auto_149470 ?auto_149474 ) ) ( not ( = ?auto_149470 ?auto_149475 ) ) ( not ( = ?auto_149470 ?auto_149476 ) ) ( not ( = ?auto_149471 ?auto_149472 ) ) ( not ( = ?auto_149471 ?auto_149473 ) ) ( not ( = ?auto_149471 ?auto_149474 ) ) ( not ( = ?auto_149471 ?auto_149475 ) ) ( not ( = ?auto_149471 ?auto_149476 ) ) ( not ( = ?auto_149472 ?auto_149473 ) ) ( not ( = ?auto_149472 ?auto_149474 ) ) ( not ( = ?auto_149472 ?auto_149475 ) ) ( not ( = ?auto_149472 ?auto_149476 ) ) ( not ( = ?auto_149473 ?auto_149474 ) ) ( not ( = ?auto_149473 ?auto_149475 ) ) ( not ( = ?auto_149473 ?auto_149476 ) ) ( not ( = ?auto_149474 ?auto_149475 ) ) ( not ( = ?auto_149474 ?auto_149476 ) ) ( not ( = ?auto_149475 ?auto_149476 ) ) ( ON ?auto_149474 ?auto_149475 ) ( ON ?auto_149473 ?auto_149474 ) ( ON ?auto_149472 ?auto_149473 ) ( ON ?auto_149471 ?auto_149472 ) ( ON ?auto_149470 ?auto_149471 ) ( ON ?auto_149469 ?auto_149470 ) ( CLEAR ?auto_149467 ) ( ON ?auto_149468 ?auto_149469 ) ( CLEAR ?auto_149468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149466 ?auto_149467 ?auto_149468 )
      ( MAKE-10PILE ?auto_149466 ?auto_149467 ?auto_149468 ?auto_149469 ?auto_149470 ?auto_149471 ?auto_149472 ?auto_149473 ?auto_149474 ?auto_149475 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149487 - BLOCK
      ?auto_149488 - BLOCK
      ?auto_149489 - BLOCK
      ?auto_149490 - BLOCK
      ?auto_149491 - BLOCK
      ?auto_149492 - BLOCK
      ?auto_149493 - BLOCK
      ?auto_149494 - BLOCK
      ?auto_149495 - BLOCK
      ?auto_149496 - BLOCK
    )
    :vars
    (
      ?auto_149497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149496 ?auto_149497 ) ( ON-TABLE ?auto_149487 ) ( ON ?auto_149488 ?auto_149487 ) ( not ( = ?auto_149487 ?auto_149488 ) ) ( not ( = ?auto_149487 ?auto_149489 ) ) ( not ( = ?auto_149487 ?auto_149490 ) ) ( not ( = ?auto_149487 ?auto_149491 ) ) ( not ( = ?auto_149487 ?auto_149492 ) ) ( not ( = ?auto_149487 ?auto_149493 ) ) ( not ( = ?auto_149487 ?auto_149494 ) ) ( not ( = ?auto_149487 ?auto_149495 ) ) ( not ( = ?auto_149487 ?auto_149496 ) ) ( not ( = ?auto_149487 ?auto_149497 ) ) ( not ( = ?auto_149488 ?auto_149489 ) ) ( not ( = ?auto_149488 ?auto_149490 ) ) ( not ( = ?auto_149488 ?auto_149491 ) ) ( not ( = ?auto_149488 ?auto_149492 ) ) ( not ( = ?auto_149488 ?auto_149493 ) ) ( not ( = ?auto_149488 ?auto_149494 ) ) ( not ( = ?auto_149488 ?auto_149495 ) ) ( not ( = ?auto_149488 ?auto_149496 ) ) ( not ( = ?auto_149488 ?auto_149497 ) ) ( not ( = ?auto_149489 ?auto_149490 ) ) ( not ( = ?auto_149489 ?auto_149491 ) ) ( not ( = ?auto_149489 ?auto_149492 ) ) ( not ( = ?auto_149489 ?auto_149493 ) ) ( not ( = ?auto_149489 ?auto_149494 ) ) ( not ( = ?auto_149489 ?auto_149495 ) ) ( not ( = ?auto_149489 ?auto_149496 ) ) ( not ( = ?auto_149489 ?auto_149497 ) ) ( not ( = ?auto_149490 ?auto_149491 ) ) ( not ( = ?auto_149490 ?auto_149492 ) ) ( not ( = ?auto_149490 ?auto_149493 ) ) ( not ( = ?auto_149490 ?auto_149494 ) ) ( not ( = ?auto_149490 ?auto_149495 ) ) ( not ( = ?auto_149490 ?auto_149496 ) ) ( not ( = ?auto_149490 ?auto_149497 ) ) ( not ( = ?auto_149491 ?auto_149492 ) ) ( not ( = ?auto_149491 ?auto_149493 ) ) ( not ( = ?auto_149491 ?auto_149494 ) ) ( not ( = ?auto_149491 ?auto_149495 ) ) ( not ( = ?auto_149491 ?auto_149496 ) ) ( not ( = ?auto_149491 ?auto_149497 ) ) ( not ( = ?auto_149492 ?auto_149493 ) ) ( not ( = ?auto_149492 ?auto_149494 ) ) ( not ( = ?auto_149492 ?auto_149495 ) ) ( not ( = ?auto_149492 ?auto_149496 ) ) ( not ( = ?auto_149492 ?auto_149497 ) ) ( not ( = ?auto_149493 ?auto_149494 ) ) ( not ( = ?auto_149493 ?auto_149495 ) ) ( not ( = ?auto_149493 ?auto_149496 ) ) ( not ( = ?auto_149493 ?auto_149497 ) ) ( not ( = ?auto_149494 ?auto_149495 ) ) ( not ( = ?auto_149494 ?auto_149496 ) ) ( not ( = ?auto_149494 ?auto_149497 ) ) ( not ( = ?auto_149495 ?auto_149496 ) ) ( not ( = ?auto_149495 ?auto_149497 ) ) ( not ( = ?auto_149496 ?auto_149497 ) ) ( ON ?auto_149495 ?auto_149496 ) ( ON ?auto_149494 ?auto_149495 ) ( ON ?auto_149493 ?auto_149494 ) ( ON ?auto_149492 ?auto_149493 ) ( ON ?auto_149491 ?auto_149492 ) ( ON ?auto_149490 ?auto_149491 ) ( CLEAR ?auto_149488 ) ( ON ?auto_149489 ?auto_149490 ) ( CLEAR ?auto_149489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149487 ?auto_149488 ?auto_149489 )
      ( MAKE-10PILE ?auto_149487 ?auto_149488 ?auto_149489 ?auto_149490 ?auto_149491 ?auto_149492 ?auto_149493 ?auto_149494 ?auto_149495 ?auto_149496 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149508 - BLOCK
      ?auto_149509 - BLOCK
      ?auto_149510 - BLOCK
      ?auto_149511 - BLOCK
      ?auto_149512 - BLOCK
      ?auto_149513 - BLOCK
      ?auto_149514 - BLOCK
      ?auto_149515 - BLOCK
      ?auto_149516 - BLOCK
      ?auto_149517 - BLOCK
    )
    :vars
    (
      ?auto_149518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149517 ?auto_149518 ) ( ON-TABLE ?auto_149508 ) ( not ( = ?auto_149508 ?auto_149509 ) ) ( not ( = ?auto_149508 ?auto_149510 ) ) ( not ( = ?auto_149508 ?auto_149511 ) ) ( not ( = ?auto_149508 ?auto_149512 ) ) ( not ( = ?auto_149508 ?auto_149513 ) ) ( not ( = ?auto_149508 ?auto_149514 ) ) ( not ( = ?auto_149508 ?auto_149515 ) ) ( not ( = ?auto_149508 ?auto_149516 ) ) ( not ( = ?auto_149508 ?auto_149517 ) ) ( not ( = ?auto_149508 ?auto_149518 ) ) ( not ( = ?auto_149509 ?auto_149510 ) ) ( not ( = ?auto_149509 ?auto_149511 ) ) ( not ( = ?auto_149509 ?auto_149512 ) ) ( not ( = ?auto_149509 ?auto_149513 ) ) ( not ( = ?auto_149509 ?auto_149514 ) ) ( not ( = ?auto_149509 ?auto_149515 ) ) ( not ( = ?auto_149509 ?auto_149516 ) ) ( not ( = ?auto_149509 ?auto_149517 ) ) ( not ( = ?auto_149509 ?auto_149518 ) ) ( not ( = ?auto_149510 ?auto_149511 ) ) ( not ( = ?auto_149510 ?auto_149512 ) ) ( not ( = ?auto_149510 ?auto_149513 ) ) ( not ( = ?auto_149510 ?auto_149514 ) ) ( not ( = ?auto_149510 ?auto_149515 ) ) ( not ( = ?auto_149510 ?auto_149516 ) ) ( not ( = ?auto_149510 ?auto_149517 ) ) ( not ( = ?auto_149510 ?auto_149518 ) ) ( not ( = ?auto_149511 ?auto_149512 ) ) ( not ( = ?auto_149511 ?auto_149513 ) ) ( not ( = ?auto_149511 ?auto_149514 ) ) ( not ( = ?auto_149511 ?auto_149515 ) ) ( not ( = ?auto_149511 ?auto_149516 ) ) ( not ( = ?auto_149511 ?auto_149517 ) ) ( not ( = ?auto_149511 ?auto_149518 ) ) ( not ( = ?auto_149512 ?auto_149513 ) ) ( not ( = ?auto_149512 ?auto_149514 ) ) ( not ( = ?auto_149512 ?auto_149515 ) ) ( not ( = ?auto_149512 ?auto_149516 ) ) ( not ( = ?auto_149512 ?auto_149517 ) ) ( not ( = ?auto_149512 ?auto_149518 ) ) ( not ( = ?auto_149513 ?auto_149514 ) ) ( not ( = ?auto_149513 ?auto_149515 ) ) ( not ( = ?auto_149513 ?auto_149516 ) ) ( not ( = ?auto_149513 ?auto_149517 ) ) ( not ( = ?auto_149513 ?auto_149518 ) ) ( not ( = ?auto_149514 ?auto_149515 ) ) ( not ( = ?auto_149514 ?auto_149516 ) ) ( not ( = ?auto_149514 ?auto_149517 ) ) ( not ( = ?auto_149514 ?auto_149518 ) ) ( not ( = ?auto_149515 ?auto_149516 ) ) ( not ( = ?auto_149515 ?auto_149517 ) ) ( not ( = ?auto_149515 ?auto_149518 ) ) ( not ( = ?auto_149516 ?auto_149517 ) ) ( not ( = ?auto_149516 ?auto_149518 ) ) ( not ( = ?auto_149517 ?auto_149518 ) ) ( ON ?auto_149516 ?auto_149517 ) ( ON ?auto_149515 ?auto_149516 ) ( ON ?auto_149514 ?auto_149515 ) ( ON ?auto_149513 ?auto_149514 ) ( ON ?auto_149512 ?auto_149513 ) ( ON ?auto_149511 ?auto_149512 ) ( ON ?auto_149510 ?auto_149511 ) ( CLEAR ?auto_149508 ) ( ON ?auto_149509 ?auto_149510 ) ( CLEAR ?auto_149509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149508 ?auto_149509 )
      ( MAKE-10PILE ?auto_149508 ?auto_149509 ?auto_149510 ?auto_149511 ?auto_149512 ?auto_149513 ?auto_149514 ?auto_149515 ?auto_149516 ?auto_149517 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149529 - BLOCK
      ?auto_149530 - BLOCK
      ?auto_149531 - BLOCK
      ?auto_149532 - BLOCK
      ?auto_149533 - BLOCK
      ?auto_149534 - BLOCK
      ?auto_149535 - BLOCK
      ?auto_149536 - BLOCK
      ?auto_149537 - BLOCK
      ?auto_149538 - BLOCK
    )
    :vars
    (
      ?auto_149539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149538 ?auto_149539 ) ( ON-TABLE ?auto_149529 ) ( not ( = ?auto_149529 ?auto_149530 ) ) ( not ( = ?auto_149529 ?auto_149531 ) ) ( not ( = ?auto_149529 ?auto_149532 ) ) ( not ( = ?auto_149529 ?auto_149533 ) ) ( not ( = ?auto_149529 ?auto_149534 ) ) ( not ( = ?auto_149529 ?auto_149535 ) ) ( not ( = ?auto_149529 ?auto_149536 ) ) ( not ( = ?auto_149529 ?auto_149537 ) ) ( not ( = ?auto_149529 ?auto_149538 ) ) ( not ( = ?auto_149529 ?auto_149539 ) ) ( not ( = ?auto_149530 ?auto_149531 ) ) ( not ( = ?auto_149530 ?auto_149532 ) ) ( not ( = ?auto_149530 ?auto_149533 ) ) ( not ( = ?auto_149530 ?auto_149534 ) ) ( not ( = ?auto_149530 ?auto_149535 ) ) ( not ( = ?auto_149530 ?auto_149536 ) ) ( not ( = ?auto_149530 ?auto_149537 ) ) ( not ( = ?auto_149530 ?auto_149538 ) ) ( not ( = ?auto_149530 ?auto_149539 ) ) ( not ( = ?auto_149531 ?auto_149532 ) ) ( not ( = ?auto_149531 ?auto_149533 ) ) ( not ( = ?auto_149531 ?auto_149534 ) ) ( not ( = ?auto_149531 ?auto_149535 ) ) ( not ( = ?auto_149531 ?auto_149536 ) ) ( not ( = ?auto_149531 ?auto_149537 ) ) ( not ( = ?auto_149531 ?auto_149538 ) ) ( not ( = ?auto_149531 ?auto_149539 ) ) ( not ( = ?auto_149532 ?auto_149533 ) ) ( not ( = ?auto_149532 ?auto_149534 ) ) ( not ( = ?auto_149532 ?auto_149535 ) ) ( not ( = ?auto_149532 ?auto_149536 ) ) ( not ( = ?auto_149532 ?auto_149537 ) ) ( not ( = ?auto_149532 ?auto_149538 ) ) ( not ( = ?auto_149532 ?auto_149539 ) ) ( not ( = ?auto_149533 ?auto_149534 ) ) ( not ( = ?auto_149533 ?auto_149535 ) ) ( not ( = ?auto_149533 ?auto_149536 ) ) ( not ( = ?auto_149533 ?auto_149537 ) ) ( not ( = ?auto_149533 ?auto_149538 ) ) ( not ( = ?auto_149533 ?auto_149539 ) ) ( not ( = ?auto_149534 ?auto_149535 ) ) ( not ( = ?auto_149534 ?auto_149536 ) ) ( not ( = ?auto_149534 ?auto_149537 ) ) ( not ( = ?auto_149534 ?auto_149538 ) ) ( not ( = ?auto_149534 ?auto_149539 ) ) ( not ( = ?auto_149535 ?auto_149536 ) ) ( not ( = ?auto_149535 ?auto_149537 ) ) ( not ( = ?auto_149535 ?auto_149538 ) ) ( not ( = ?auto_149535 ?auto_149539 ) ) ( not ( = ?auto_149536 ?auto_149537 ) ) ( not ( = ?auto_149536 ?auto_149538 ) ) ( not ( = ?auto_149536 ?auto_149539 ) ) ( not ( = ?auto_149537 ?auto_149538 ) ) ( not ( = ?auto_149537 ?auto_149539 ) ) ( not ( = ?auto_149538 ?auto_149539 ) ) ( ON ?auto_149537 ?auto_149538 ) ( ON ?auto_149536 ?auto_149537 ) ( ON ?auto_149535 ?auto_149536 ) ( ON ?auto_149534 ?auto_149535 ) ( ON ?auto_149533 ?auto_149534 ) ( ON ?auto_149532 ?auto_149533 ) ( ON ?auto_149531 ?auto_149532 ) ( CLEAR ?auto_149529 ) ( ON ?auto_149530 ?auto_149531 ) ( CLEAR ?auto_149530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149529 ?auto_149530 )
      ( MAKE-10PILE ?auto_149529 ?auto_149530 ?auto_149531 ?auto_149532 ?auto_149533 ?auto_149534 ?auto_149535 ?auto_149536 ?auto_149537 ?auto_149538 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149550 - BLOCK
      ?auto_149551 - BLOCK
      ?auto_149552 - BLOCK
      ?auto_149553 - BLOCK
      ?auto_149554 - BLOCK
      ?auto_149555 - BLOCK
      ?auto_149556 - BLOCK
      ?auto_149557 - BLOCK
      ?auto_149558 - BLOCK
      ?auto_149559 - BLOCK
    )
    :vars
    (
      ?auto_149560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149559 ?auto_149560 ) ( not ( = ?auto_149550 ?auto_149551 ) ) ( not ( = ?auto_149550 ?auto_149552 ) ) ( not ( = ?auto_149550 ?auto_149553 ) ) ( not ( = ?auto_149550 ?auto_149554 ) ) ( not ( = ?auto_149550 ?auto_149555 ) ) ( not ( = ?auto_149550 ?auto_149556 ) ) ( not ( = ?auto_149550 ?auto_149557 ) ) ( not ( = ?auto_149550 ?auto_149558 ) ) ( not ( = ?auto_149550 ?auto_149559 ) ) ( not ( = ?auto_149550 ?auto_149560 ) ) ( not ( = ?auto_149551 ?auto_149552 ) ) ( not ( = ?auto_149551 ?auto_149553 ) ) ( not ( = ?auto_149551 ?auto_149554 ) ) ( not ( = ?auto_149551 ?auto_149555 ) ) ( not ( = ?auto_149551 ?auto_149556 ) ) ( not ( = ?auto_149551 ?auto_149557 ) ) ( not ( = ?auto_149551 ?auto_149558 ) ) ( not ( = ?auto_149551 ?auto_149559 ) ) ( not ( = ?auto_149551 ?auto_149560 ) ) ( not ( = ?auto_149552 ?auto_149553 ) ) ( not ( = ?auto_149552 ?auto_149554 ) ) ( not ( = ?auto_149552 ?auto_149555 ) ) ( not ( = ?auto_149552 ?auto_149556 ) ) ( not ( = ?auto_149552 ?auto_149557 ) ) ( not ( = ?auto_149552 ?auto_149558 ) ) ( not ( = ?auto_149552 ?auto_149559 ) ) ( not ( = ?auto_149552 ?auto_149560 ) ) ( not ( = ?auto_149553 ?auto_149554 ) ) ( not ( = ?auto_149553 ?auto_149555 ) ) ( not ( = ?auto_149553 ?auto_149556 ) ) ( not ( = ?auto_149553 ?auto_149557 ) ) ( not ( = ?auto_149553 ?auto_149558 ) ) ( not ( = ?auto_149553 ?auto_149559 ) ) ( not ( = ?auto_149553 ?auto_149560 ) ) ( not ( = ?auto_149554 ?auto_149555 ) ) ( not ( = ?auto_149554 ?auto_149556 ) ) ( not ( = ?auto_149554 ?auto_149557 ) ) ( not ( = ?auto_149554 ?auto_149558 ) ) ( not ( = ?auto_149554 ?auto_149559 ) ) ( not ( = ?auto_149554 ?auto_149560 ) ) ( not ( = ?auto_149555 ?auto_149556 ) ) ( not ( = ?auto_149555 ?auto_149557 ) ) ( not ( = ?auto_149555 ?auto_149558 ) ) ( not ( = ?auto_149555 ?auto_149559 ) ) ( not ( = ?auto_149555 ?auto_149560 ) ) ( not ( = ?auto_149556 ?auto_149557 ) ) ( not ( = ?auto_149556 ?auto_149558 ) ) ( not ( = ?auto_149556 ?auto_149559 ) ) ( not ( = ?auto_149556 ?auto_149560 ) ) ( not ( = ?auto_149557 ?auto_149558 ) ) ( not ( = ?auto_149557 ?auto_149559 ) ) ( not ( = ?auto_149557 ?auto_149560 ) ) ( not ( = ?auto_149558 ?auto_149559 ) ) ( not ( = ?auto_149558 ?auto_149560 ) ) ( not ( = ?auto_149559 ?auto_149560 ) ) ( ON ?auto_149558 ?auto_149559 ) ( ON ?auto_149557 ?auto_149558 ) ( ON ?auto_149556 ?auto_149557 ) ( ON ?auto_149555 ?auto_149556 ) ( ON ?auto_149554 ?auto_149555 ) ( ON ?auto_149553 ?auto_149554 ) ( ON ?auto_149552 ?auto_149553 ) ( ON ?auto_149551 ?auto_149552 ) ( ON ?auto_149550 ?auto_149551 ) ( CLEAR ?auto_149550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149550 )
      ( MAKE-10PILE ?auto_149550 ?auto_149551 ?auto_149552 ?auto_149553 ?auto_149554 ?auto_149555 ?auto_149556 ?auto_149557 ?auto_149558 ?auto_149559 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_149571 - BLOCK
      ?auto_149572 - BLOCK
      ?auto_149573 - BLOCK
      ?auto_149574 - BLOCK
      ?auto_149575 - BLOCK
      ?auto_149576 - BLOCK
      ?auto_149577 - BLOCK
      ?auto_149578 - BLOCK
      ?auto_149579 - BLOCK
      ?auto_149580 - BLOCK
    )
    :vars
    (
      ?auto_149581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149580 ?auto_149581 ) ( not ( = ?auto_149571 ?auto_149572 ) ) ( not ( = ?auto_149571 ?auto_149573 ) ) ( not ( = ?auto_149571 ?auto_149574 ) ) ( not ( = ?auto_149571 ?auto_149575 ) ) ( not ( = ?auto_149571 ?auto_149576 ) ) ( not ( = ?auto_149571 ?auto_149577 ) ) ( not ( = ?auto_149571 ?auto_149578 ) ) ( not ( = ?auto_149571 ?auto_149579 ) ) ( not ( = ?auto_149571 ?auto_149580 ) ) ( not ( = ?auto_149571 ?auto_149581 ) ) ( not ( = ?auto_149572 ?auto_149573 ) ) ( not ( = ?auto_149572 ?auto_149574 ) ) ( not ( = ?auto_149572 ?auto_149575 ) ) ( not ( = ?auto_149572 ?auto_149576 ) ) ( not ( = ?auto_149572 ?auto_149577 ) ) ( not ( = ?auto_149572 ?auto_149578 ) ) ( not ( = ?auto_149572 ?auto_149579 ) ) ( not ( = ?auto_149572 ?auto_149580 ) ) ( not ( = ?auto_149572 ?auto_149581 ) ) ( not ( = ?auto_149573 ?auto_149574 ) ) ( not ( = ?auto_149573 ?auto_149575 ) ) ( not ( = ?auto_149573 ?auto_149576 ) ) ( not ( = ?auto_149573 ?auto_149577 ) ) ( not ( = ?auto_149573 ?auto_149578 ) ) ( not ( = ?auto_149573 ?auto_149579 ) ) ( not ( = ?auto_149573 ?auto_149580 ) ) ( not ( = ?auto_149573 ?auto_149581 ) ) ( not ( = ?auto_149574 ?auto_149575 ) ) ( not ( = ?auto_149574 ?auto_149576 ) ) ( not ( = ?auto_149574 ?auto_149577 ) ) ( not ( = ?auto_149574 ?auto_149578 ) ) ( not ( = ?auto_149574 ?auto_149579 ) ) ( not ( = ?auto_149574 ?auto_149580 ) ) ( not ( = ?auto_149574 ?auto_149581 ) ) ( not ( = ?auto_149575 ?auto_149576 ) ) ( not ( = ?auto_149575 ?auto_149577 ) ) ( not ( = ?auto_149575 ?auto_149578 ) ) ( not ( = ?auto_149575 ?auto_149579 ) ) ( not ( = ?auto_149575 ?auto_149580 ) ) ( not ( = ?auto_149575 ?auto_149581 ) ) ( not ( = ?auto_149576 ?auto_149577 ) ) ( not ( = ?auto_149576 ?auto_149578 ) ) ( not ( = ?auto_149576 ?auto_149579 ) ) ( not ( = ?auto_149576 ?auto_149580 ) ) ( not ( = ?auto_149576 ?auto_149581 ) ) ( not ( = ?auto_149577 ?auto_149578 ) ) ( not ( = ?auto_149577 ?auto_149579 ) ) ( not ( = ?auto_149577 ?auto_149580 ) ) ( not ( = ?auto_149577 ?auto_149581 ) ) ( not ( = ?auto_149578 ?auto_149579 ) ) ( not ( = ?auto_149578 ?auto_149580 ) ) ( not ( = ?auto_149578 ?auto_149581 ) ) ( not ( = ?auto_149579 ?auto_149580 ) ) ( not ( = ?auto_149579 ?auto_149581 ) ) ( not ( = ?auto_149580 ?auto_149581 ) ) ( ON ?auto_149579 ?auto_149580 ) ( ON ?auto_149578 ?auto_149579 ) ( ON ?auto_149577 ?auto_149578 ) ( ON ?auto_149576 ?auto_149577 ) ( ON ?auto_149575 ?auto_149576 ) ( ON ?auto_149574 ?auto_149575 ) ( ON ?auto_149573 ?auto_149574 ) ( ON ?auto_149572 ?auto_149573 ) ( ON ?auto_149571 ?auto_149572 ) ( CLEAR ?auto_149571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_149571 )
      ( MAKE-10PILE ?auto_149571 ?auto_149572 ?auto_149573 ?auto_149574 ?auto_149575 ?auto_149576 ?auto_149577 ?auto_149578 ?auto_149579 ?auto_149580 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149593 - BLOCK
      ?auto_149594 - BLOCK
      ?auto_149595 - BLOCK
      ?auto_149596 - BLOCK
      ?auto_149597 - BLOCK
      ?auto_149598 - BLOCK
      ?auto_149599 - BLOCK
      ?auto_149600 - BLOCK
      ?auto_149601 - BLOCK
      ?auto_149602 - BLOCK
      ?auto_149603 - BLOCK
    )
    :vars
    (
      ?auto_149604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149602 ) ( ON ?auto_149603 ?auto_149604 ) ( CLEAR ?auto_149603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149593 ) ( ON ?auto_149594 ?auto_149593 ) ( ON ?auto_149595 ?auto_149594 ) ( ON ?auto_149596 ?auto_149595 ) ( ON ?auto_149597 ?auto_149596 ) ( ON ?auto_149598 ?auto_149597 ) ( ON ?auto_149599 ?auto_149598 ) ( ON ?auto_149600 ?auto_149599 ) ( ON ?auto_149601 ?auto_149600 ) ( ON ?auto_149602 ?auto_149601 ) ( not ( = ?auto_149593 ?auto_149594 ) ) ( not ( = ?auto_149593 ?auto_149595 ) ) ( not ( = ?auto_149593 ?auto_149596 ) ) ( not ( = ?auto_149593 ?auto_149597 ) ) ( not ( = ?auto_149593 ?auto_149598 ) ) ( not ( = ?auto_149593 ?auto_149599 ) ) ( not ( = ?auto_149593 ?auto_149600 ) ) ( not ( = ?auto_149593 ?auto_149601 ) ) ( not ( = ?auto_149593 ?auto_149602 ) ) ( not ( = ?auto_149593 ?auto_149603 ) ) ( not ( = ?auto_149593 ?auto_149604 ) ) ( not ( = ?auto_149594 ?auto_149595 ) ) ( not ( = ?auto_149594 ?auto_149596 ) ) ( not ( = ?auto_149594 ?auto_149597 ) ) ( not ( = ?auto_149594 ?auto_149598 ) ) ( not ( = ?auto_149594 ?auto_149599 ) ) ( not ( = ?auto_149594 ?auto_149600 ) ) ( not ( = ?auto_149594 ?auto_149601 ) ) ( not ( = ?auto_149594 ?auto_149602 ) ) ( not ( = ?auto_149594 ?auto_149603 ) ) ( not ( = ?auto_149594 ?auto_149604 ) ) ( not ( = ?auto_149595 ?auto_149596 ) ) ( not ( = ?auto_149595 ?auto_149597 ) ) ( not ( = ?auto_149595 ?auto_149598 ) ) ( not ( = ?auto_149595 ?auto_149599 ) ) ( not ( = ?auto_149595 ?auto_149600 ) ) ( not ( = ?auto_149595 ?auto_149601 ) ) ( not ( = ?auto_149595 ?auto_149602 ) ) ( not ( = ?auto_149595 ?auto_149603 ) ) ( not ( = ?auto_149595 ?auto_149604 ) ) ( not ( = ?auto_149596 ?auto_149597 ) ) ( not ( = ?auto_149596 ?auto_149598 ) ) ( not ( = ?auto_149596 ?auto_149599 ) ) ( not ( = ?auto_149596 ?auto_149600 ) ) ( not ( = ?auto_149596 ?auto_149601 ) ) ( not ( = ?auto_149596 ?auto_149602 ) ) ( not ( = ?auto_149596 ?auto_149603 ) ) ( not ( = ?auto_149596 ?auto_149604 ) ) ( not ( = ?auto_149597 ?auto_149598 ) ) ( not ( = ?auto_149597 ?auto_149599 ) ) ( not ( = ?auto_149597 ?auto_149600 ) ) ( not ( = ?auto_149597 ?auto_149601 ) ) ( not ( = ?auto_149597 ?auto_149602 ) ) ( not ( = ?auto_149597 ?auto_149603 ) ) ( not ( = ?auto_149597 ?auto_149604 ) ) ( not ( = ?auto_149598 ?auto_149599 ) ) ( not ( = ?auto_149598 ?auto_149600 ) ) ( not ( = ?auto_149598 ?auto_149601 ) ) ( not ( = ?auto_149598 ?auto_149602 ) ) ( not ( = ?auto_149598 ?auto_149603 ) ) ( not ( = ?auto_149598 ?auto_149604 ) ) ( not ( = ?auto_149599 ?auto_149600 ) ) ( not ( = ?auto_149599 ?auto_149601 ) ) ( not ( = ?auto_149599 ?auto_149602 ) ) ( not ( = ?auto_149599 ?auto_149603 ) ) ( not ( = ?auto_149599 ?auto_149604 ) ) ( not ( = ?auto_149600 ?auto_149601 ) ) ( not ( = ?auto_149600 ?auto_149602 ) ) ( not ( = ?auto_149600 ?auto_149603 ) ) ( not ( = ?auto_149600 ?auto_149604 ) ) ( not ( = ?auto_149601 ?auto_149602 ) ) ( not ( = ?auto_149601 ?auto_149603 ) ) ( not ( = ?auto_149601 ?auto_149604 ) ) ( not ( = ?auto_149602 ?auto_149603 ) ) ( not ( = ?auto_149602 ?auto_149604 ) ) ( not ( = ?auto_149603 ?auto_149604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_149603 ?auto_149604 )
      ( !STACK ?auto_149603 ?auto_149602 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149616 - BLOCK
      ?auto_149617 - BLOCK
      ?auto_149618 - BLOCK
      ?auto_149619 - BLOCK
      ?auto_149620 - BLOCK
      ?auto_149621 - BLOCK
      ?auto_149622 - BLOCK
      ?auto_149623 - BLOCK
      ?auto_149624 - BLOCK
      ?auto_149625 - BLOCK
      ?auto_149626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_149625 ) ( ON-TABLE ?auto_149626 ) ( CLEAR ?auto_149626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_149616 ) ( ON ?auto_149617 ?auto_149616 ) ( ON ?auto_149618 ?auto_149617 ) ( ON ?auto_149619 ?auto_149618 ) ( ON ?auto_149620 ?auto_149619 ) ( ON ?auto_149621 ?auto_149620 ) ( ON ?auto_149622 ?auto_149621 ) ( ON ?auto_149623 ?auto_149622 ) ( ON ?auto_149624 ?auto_149623 ) ( ON ?auto_149625 ?auto_149624 ) ( not ( = ?auto_149616 ?auto_149617 ) ) ( not ( = ?auto_149616 ?auto_149618 ) ) ( not ( = ?auto_149616 ?auto_149619 ) ) ( not ( = ?auto_149616 ?auto_149620 ) ) ( not ( = ?auto_149616 ?auto_149621 ) ) ( not ( = ?auto_149616 ?auto_149622 ) ) ( not ( = ?auto_149616 ?auto_149623 ) ) ( not ( = ?auto_149616 ?auto_149624 ) ) ( not ( = ?auto_149616 ?auto_149625 ) ) ( not ( = ?auto_149616 ?auto_149626 ) ) ( not ( = ?auto_149617 ?auto_149618 ) ) ( not ( = ?auto_149617 ?auto_149619 ) ) ( not ( = ?auto_149617 ?auto_149620 ) ) ( not ( = ?auto_149617 ?auto_149621 ) ) ( not ( = ?auto_149617 ?auto_149622 ) ) ( not ( = ?auto_149617 ?auto_149623 ) ) ( not ( = ?auto_149617 ?auto_149624 ) ) ( not ( = ?auto_149617 ?auto_149625 ) ) ( not ( = ?auto_149617 ?auto_149626 ) ) ( not ( = ?auto_149618 ?auto_149619 ) ) ( not ( = ?auto_149618 ?auto_149620 ) ) ( not ( = ?auto_149618 ?auto_149621 ) ) ( not ( = ?auto_149618 ?auto_149622 ) ) ( not ( = ?auto_149618 ?auto_149623 ) ) ( not ( = ?auto_149618 ?auto_149624 ) ) ( not ( = ?auto_149618 ?auto_149625 ) ) ( not ( = ?auto_149618 ?auto_149626 ) ) ( not ( = ?auto_149619 ?auto_149620 ) ) ( not ( = ?auto_149619 ?auto_149621 ) ) ( not ( = ?auto_149619 ?auto_149622 ) ) ( not ( = ?auto_149619 ?auto_149623 ) ) ( not ( = ?auto_149619 ?auto_149624 ) ) ( not ( = ?auto_149619 ?auto_149625 ) ) ( not ( = ?auto_149619 ?auto_149626 ) ) ( not ( = ?auto_149620 ?auto_149621 ) ) ( not ( = ?auto_149620 ?auto_149622 ) ) ( not ( = ?auto_149620 ?auto_149623 ) ) ( not ( = ?auto_149620 ?auto_149624 ) ) ( not ( = ?auto_149620 ?auto_149625 ) ) ( not ( = ?auto_149620 ?auto_149626 ) ) ( not ( = ?auto_149621 ?auto_149622 ) ) ( not ( = ?auto_149621 ?auto_149623 ) ) ( not ( = ?auto_149621 ?auto_149624 ) ) ( not ( = ?auto_149621 ?auto_149625 ) ) ( not ( = ?auto_149621 ?auto_149626 ) ) ( not ( = ?auto_149622 ?auto_149623 ) ) ( not ( = ?auto_149622 ?auto_149624 ) ) ( not ( = ?auto_149622 ?auto_149625 ) ) ( not ( = ?auto_149622 ?auto_149626 ) ) ( not ( = ?auto_149623 ?auto_149624 ) ) ( not ( = ?auto_149623 ?auto_149625 ) ) ( not ( = ?auto_149623 ?auto_149626 ) ) ( not ( = ?auto_149624 ?auto_149625 ) ) ( not ( = ?auto_149624 ?auto_149626 ) ) ( not ( = ?auto_149625 ?auto_149626 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_149626 )
      ( !STACK ?auto_149626 ?auto_149625 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149638 - BLOCK
      ?auto_149639 - BLOCK
      ?auto_149640 - BLOCK
      ?auto_149641 - BLOCK
      ?auto_149642 - BLOCK
      ?auto_149643 - BLOCK
      ?auto_149644 - BLOCK
      ?auto_149645 - BLOCK
      ?auto_149646 - BLOCK
      ?auto_149647 - BLOCK
      ?auto_149648 - BLOCK
    )
    :vars
    (
      ?auto_149649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149648 ?auto_149649 ) ( ON-TABLE ?auto_149638 ) ( ON ?auto_149639 ?auto_149638 ) ( ON ?auto_149640 ?auto_149639 ) ( ON ?auto_149641 ?auto_149640 ) ( ON ?auto_149642 ?auto_149641 ) ( ON ?auto_149643 ?auto_149642 ) ( ON ?auto_149644 ?auto_149643 ) ( ON ?auto_149645 ?auto_149644 ) ( ON ?auto_149646 ?auto_149645 ) ( not ( = ?auto_149638 ?auto_149639 ) ) ( not ( = ?auto_149638 ?auto_149640 ) ) ( not ( = ?auto_149638 ?auto_149641 ) ) ( not ( = ?auto_149638 ?auto_149642 ) ) ( not ( = ?auto_149638 ?auto_149643 ) ) ( not ( = ?auto_149638 ?auto_149644 ) ) ( not ( = ?auto_149638 ?auto_149645 ) ) ( not ( = ?auto_149638 ?auto_149646 ) ) ( not ( = ?auto_149638 ?auto_149647 ) ) ( not ( = ?auto_149638 ?auto_149648 ) ) ( not ( = ?auto_149638 ?auto_149649 ) ) ( not ( = ?auto_149639 ?auto_149640 ) ) ( not ( = ?auto_149639 ?auto_149641 ) ) ( not ( = ?auto_149639 ?auto_149642 ) ) ( not ( = ?auto_149639 ?auto_149643 ) ) ( not ( = ?auto_149639 ?auto_149644 ) ) ( not ( = ?auto_149639 ?auto_149645 ) ) ( not ( = ?auto_149639 ?auto_149646 ) ) ( not ( = ?auto_149639 ?auto_149647 ) ) ( not ( = ?auto_149639 ?auto_149648 ) ) ( not ( = ?auto_149639 ?auto_149649 ) ) ( not ( = ?auto_149640 ?auto_149641 ) ) ( not ( = ?auto_149640 ?auto_149642 ) ) ( not ( = ?auto_149640 ?auto_149643 ) ) ( not ( = ?auto_149640 ?auto_149644 ) ) ( not ( = ?auto_149640 ?auto_149645 ) ) ( not ( = ?auto_149640 ?auto_149646 ) ) ( not ( = ?auto_149640 ?auto_149647 ) ) ( not ( = ?auto_149640 ?auto_149648 ) ) ( not ( = ?auto_149640 ?auto_149649 ) ) ( not ( = ?auto_149641 ?auto_149642 ) ) ( not ( = ?auto_149641 ?auto_149643 ) ) ( not ( = ?auto_149641 ?auto_149644 ) ) ( not ( = ?auto_149641 ?auto_149645 ) ) ( not ( = ?auto_149641 ?auto_149646 ) ) ( not ( = ?auto_149641 ?auto_149647 ) ) ( not ( = ?auto_149641 ?auto_149648 ) ) ( not ( = ?auto_149641 ?auto_149649 ) ) ( not ( = ?auto_149642 ?auto_149643 ) ) ( not ( = ?auto_149642 ?auto_149644 ) ) ( not ( = ?auto_149642 ?auto_149645 ) ) ( not ( = ?auto_149642 ?auto_149646 ) ) ( not ( = ?auto_149642 ?auto_149647 ) ) ( not ( = ?auto_149642 ?auto_149648 ) ) ( not ( = ?auto_149642 ?auto_149649 ) ) ( not ( = ?auto_149643 ?auto_149644 ) ) ( not ( = ?auto_149643 ?auto_149645 ) ) ( not ( = ?auto_149643 ?auto_149646 ) ) ( not ( = ?auto_149643 ?auto_149647 ) ) ( not ( = ?auto_149643 ?auto_149648 ) ) ( not ( = ?auto_149643 ?auto_149649 ) ) ( not ( = ?auto_149644 ?auto_149645 ) ) ( not ( = ?auto_149644 ?auto_149646 ) ) ( not ( = ?auto_149644 ?auto_149647 ) ) ( not ( = ?auto_149644 ?auto_149648 ) ) ( not ( = ?auto_149644 ?auto_149649 ) ) ( not ( = ?auto_149645 ?auto_149646 ) ) ( not ( = ?auto_149645 ?auto_149647 ) ) ( not ( = ?auto_149645 ?auto_149648 ) ) ( not ( = ?auto_149645 ?auto_149649 ) ) ( not ( = ?auto_149646 ?auto_149647 ) ) ( not ( = ?auto_149646 ?auto_149648 ) ) ( not ( = ?auto_149646 ?auto_149649 ) ) ( not ( = ?auto_149647 ?auto_149648 ) ) ( not ( = ?auto_149647 ?auto_149649 ) ) ( not ( = ?auto_149648 ?auto_149649 ) ) ( CLEAR ?auto_149646 ) ( ON ?auto_149647 ?auto_149648 ) ( CLEAR ?auto_149647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_149638 ?auto_149639 ?auto_149640 ?auto_149641 ?auto_149642 ?auto_149643 ?auto_149644 ?auto_149645 ?auto_149646 ?auto_149647 )
      ( MAKE-11PILE ?auto_149638 ?auto_149639 ?auto_149640 ?auto_149641 ?auto_149642 ?auto_149643 ?auto_149644 ?auto_149645 ?auto_149646 ?auto_149647 ?auto_149648 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149661 - BLOCK
      ?auto_149662 - BLOCK
      ?auto_149663 - BLOCK
      ?auto_149664 - BLOCK
      ?auto_149665 - BLOCK
      ?auto_149666 - BLOCK
      ?auto_149667 - BLOCK
      ?auto_149668 - BLOCK
      ?auto_149669 - BLOCK
      ?auto_149670 - BLOCK
      ?auto_149671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149671 ) ( ON-TABLE ?auto_149661 ) ( ON ?auto_149662 ?auto_149661 ) ( ON ?auto_149663 ?auto_149662 ) ( ON ?auto_149664 ?auto_149663 ) ( ON ?auto_149665 ?auto_149664 ) ( ON ?auto_149666 ?auto_149665 ) ( ON ?auto_149667 ?auto_149666 ) ( ON ?auto_149668 ?auto_149667 ) ( ON ?auto_149669 ?auto_149668 ) ( not ( = ?auto_149661 ?auto_149662 ) ) ( not ( = ?auto_149661 ?auto_149663 ) ) ( not ( = ?auto_149661 ?auto_149664 ) ) ( not ( = ?auto_149661 ?auto_149665 ) ) ( not ( = ?auto_149661 ?auto_149666 ) ) ( not ( = ?auto_149661 ?auto_149667 ) ) ( not ( = ?auto_149661 ?auto_149668 ) ) ( not ( = ?auto_149661 ?auto_149669 ) ) ( not ( = ?auto_149661 ?auto_149670 ) ) ( not ( = ?auto_149661 ?auto_149671 ) ) ( not ( = ?auto_149662 ?auto_149663 ) ) ( not ( = ?auto_149662 ?auto_149664 ) ) ( not ( = ?auto_149662 ?auto_149665 ) ) ( not ( = ?auto_149662 ?auto_149666 ) ) ( not ( = ?auto_149662 ?auto_149667 ) ) ( not ( = ?auto_149662 ?auto_149668 ) ) ( not ( = ?auto_149662 ?auto_149669 ) ) ( not ( = ?auto_149662 ?auto_149670 ) ) ( not ( = ?auto_149662 ?auto_149671 ) ) ( not ( = ?auto_149663 ?auto_149664 ) ) ( not ( = ?auto_149663 ?auto_149665 ) ) ( not ( = ?auto_149663 ?auto_149666 ) ) ( not ( = ?auto_149663 ?auto_149667 ) ) ( not ( = ?auto_149663 ?auto_149668 ) ) ( not ( = ?auto_149663 ?auto_149669 ) ) ( not ( = ?auto_149663 ?auto_149670 ) ) ( not ( = ?auto_149663 ?auto_149671 ) ) ( not ( = ?auto_149664 ?auto_149665 ) ) ( not ( = ?auto_149664 ?auto_149666 ) ) ( not ( = ?auto_149664 ?auto_149667 ) ) ( not ( = ?auto_149664 ?auto_149668 ) ) ( not ( = ?auto_149664 ?auto_149669 ) ) ( not ( = ?auto_149664 ?auto_149670 ) ) ( not ( = ?auto_149664 ?auto_149671 ) ) ( not ( = ?auto_149665 ?auto_149666 ) ) ( not ( = ?auto_149665 ?auto_149667 ) ) ( not ( = ?auto_149665 ?auto_149668 ) ) ( not ( = ?auto_149665 ?auto_149669 ) ) ( not ( = ?auto_149665 ?auto_149670 ) ) ( not ( = ?auto_149665 ?auto_149671 ) ) ( not ( = ?auto_149666 ?auto_149667 ) ) ( not ( = ?auto_149666 ?auto_149668 ) ) ( not ( = ?auto_149666 ?auto_149669 ) ) ( not ( = ?auto_149666 ?auto_149670 ) ) ( not ( = ?auto_149666 ?auto_149671 ) ) ( not ( = ?auto_149667 ?auto_149668 ) ) ( not ( = ?auto_149667 ?auto_149669 ) ) ( not ( = ?auto_149667 ?auto_149670 ) ) ( not ( = ?auto_149667 ?auto_149671 ) ) ( not ( = ?auto_149668 ?auto_149669 ) ) ( not ( = ?auto_149668 ?auto_149670 ) ) ( not ( = ?auto_149668 ?auto_149671 ) ) ( not ( = ?auto_149669 ?auto_149670 ) ) ( not ( = ?auto_149669 ?auto_149671 ) ) ( not ( = ?auto_149670 ?auto_149671 ) ) ( CLEAR ?auto_149669 ) ( ON ?auto_149670 ?auto_149671 ) ( CLEAR ?auto_149670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_149661 ?auto_149662 ?auto_149663 ?auto_149664 ?auto_149665 ?auto_149666 ?auto_149667 ?auto_149668 ?auto_149669 ?auto_149670 )
      ( MAKE-11PILE ?auto_149661 ?auto_149662 ?auto_149663 ?auto_149664 ?auto_149665 ?auto_149666 ?auto_149667 ?auto_149668 ?auto_149669 ?auto_149670 ?auto_149671 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149683 - BLOCK
      ?auto_149684 - BLOCK
      ?auto_149685 - BLOCK
      ?auto_149686 - BLOCK
      ?auto_149687 - BLOCK
      ?auto_149688 - BLOCK
      ?auto_149689 - BLOCK
      ?auto_149690 - BLOCK
      ?auto_149691 - BLOCK
      ?auto_149692 - BLOCK
      ?auto_149693 - BLOCK
    )
    :vars
    (
      ?auto_149694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149693 ?auto_149694 ) ( ON-TABLE ?auto_149683 ) ( ON ?auto_149684 ?auto_149683 ) ( ON ?auto_149685 ?auto_149684 ) ( ON ?auto_149686 ?auto_149685 ) ( ON ?auto_149687 ?auto_149686 ) ( ON ?auto_149688 ?auto_149687 ) ( ON ?auto_149689 ?auto_149688 ) ( ON ?auto_149690 ?auto_149689 ) ( not ( = ?auto_149683 ?auto_149684 ) ) ( not ( = ?auto_149683 ?auto_149685 ) ) ( not ( = ?auto_149683 ?auto_149686 ) ) ( not ( = ?auto_149683 ?auto_149687 ) ) ( not ( = ?auto_149683 ?auto_149688 ) ) ( not ( = ?auto_149683 ?auto_149689 ) ) ( not ( = ?auto_149683 ?auto_149690 ) ) ( not ( = ?auto_149683 ?auto_149691 ) ) ( not ( = ?auto_149683 ?auto_149692 ) ) ( not ( = ?auto_149683 ?auto_149693 ) ) ( not ( = ?auto_149683 ?auto_149694 ) ) ( not ( = ?auto_149684 ?auto_149685 ) ) ( not ( = ?auto_149684 ?auto_149686 ) ) ( not ( = ?auto_149684 ?auto_149687 ) ) ( not ( = ?auto_149684 ?auto_149688 ) ) ( not ( = ?auto_149684 ?auto_149689 ) ) ( not ( = ?auto_149684 ?auto_149690 ) ) ( not ( = ?auto_149684 ?auto_149691 ) ) ( not ( = ?auto_149684 ?auto_149692 ) ) ( not ( = ?auto_149684 ?auto_149693 ) ) ( not ( = ?auto_149684 ?auto_149694 ) ) ( not ( = ?auto_149685 ?auto_149686 ) ) ( not ( = ?auto_149685 ?auto_149687 ) ) ( not ( = ?auto_149685 ?auto_149688 ) ) ( not ( = ?auto_149685 ?auto_149689 ) ) ( not ( = ?auto_149685 ?auto_149690 ) ) ( not ( = ?auto_149685 ?auto_149691 ) ) ( not ( = ?auto_149685 ?auto_149692 ) ) ( not ( = ?auto_149685 ?auto_149693 ) ) ( not ( = ?auto_149685 ?auto_149694 ) ) ( not ( = ?auto_149686 ?auto_149687 ) ) ( not ( = ?auto_149686 ?auto_149688 ) ) ( not ( = ?auto_149686 ?auto_149689 ) ) ( not ( = ?auto_149686 ?auto_149690 ) ) ( not ( = ?auto_149686 ?auto_149691 ) ) ( not ( = ?auto_149686 ?auto_149692 ) ) ( not ( = ?auto_149686 ?auto_149693 ) ) ( not ( = ?auto_149686 ?auto_149694 ) ) ( not ( = ?auto_149687 ?auto_149688 ) ) ( not ( = ?auto_149687 ?auto_149689 ) ) ( not ( = ?auto_149687 ?auto_149690 ) ) ( not ( = ?auto_149687 ?auto_149691 ) ) ( not ( = ?auto_149687 ?auto_149692 ) ) ( not ( = ?auto_149687 ?auto_149693 ) ) ( not ( = ?auto_149687 ?auto_149694 ) ) ( not ( = ?auto_149688 ?auto_149689 ) ) ( not ( = ?auto_149688 ?auto_149690 ) ) ( not ( = ?auto_149688 ?auto_149691 ) ) ( not ( = ?auto_149688 ?auto_149692 ) ) ( not ( = ?auto_149688 ?auto_149693 ) ) ( not ( = ?auto_149688 ?auto_149694 ) ) ( not ( = ?auto_149689 ?auto_149690 ) ) ( not ( = ?auto_149689 ?auto_149691 ) ) ( not ( = ?auto_149689 ?auto_149692 ) ) ( not ( = ?auto_149689 ?auto_149693 ) ) ( not ( = ?auto_149689 ?auto_149694 ) ) ( not ( = ?auto_149690 ?auto_149691 ) ) ( not ( = ?auto_149690 ?auto_149692 ) ) ( not ( = ?auto_149690 ?auto_149693 ) ) ( not ( = ?auto_149690 ?auto_149694 ) ) ( not ( = ?auto_149691 ?auto_149692 ) ) ( not ( = ?auto_149691 ?auto_149693 ) ) ( not ( = ?auto_149691 ?auto_149694 ) ) ( not ( = ?auto_149692 ?auto_149693 ) ) ( not ( = ?auto_149692 ?auto_149694 ) ) ( not ( = ?auto_149693 ?auto_149694 ) ) ( ON ?auto_149692 ?auto_149693 ) ( CLEAR ?auto_149690 ) ( ON ?auto_149691 ?auto_149692 ) ( CLEAR ?auto_149691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_149683 ?auto_149684 ?auto_149685 ?auto_149686 ?auto_149687 ?auto_149688 ?auto_149689 ?auto_149690 ?auto_149691 )
      ( MAKE-11PILE ?auto_149683 ?auto_149684 ?auto_149685 ?auto_149686 ?auto_149687 ?auto_149688 ?auto_149689 ?auto_149690 ?auto_149691 ?auto_149692 ?auto_149693 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149706 - BLOCK
      ?auto_149707 - BLOCK
      ?auto_149708 - BLOCK
      ?auto_149709 - BLOCK
      ?auto_149710 - BLOCK
      ?auto_149711 - BLOCK
      ?auto_149712 - BLOCK
      ?auto_149713 - BLOCK
      ?auto_149714 - BLOCK
      ?auto_149715 - BLOCK
      ?auto_149716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149716 ) ( ON-TABLE ?auto_149706 ) ( ON ?auto_149707 ?auto_149706 ) ( ON ?auto_149708 ?auto_149707 ) ( ON ?auto_149709 ?auto_149708 ) ( ON ?auto_149710 ?auto_149709 ) ( ON ?auto_149711 ?auto_149710 ) ( ON ?auto_149712 ?auto_149711 ) ( ON ?auto_149713 ?auto_149712 ) ( not ( = ?auto_149706 ?auto_149707 ) ) ( not ( = ?auto_149706 ?auto_149708 ) ) ( not ( = ?auto_149706 ?auto_149709 ) ) ( not ( = ?auto_149706 ?auto_149710 ) ) ( not ( = ?auto_149706 ?auto_149711 ) ) ( not ( = ?auto_149706 ?auto_149712 ) ) ( not ( = ?auto_149706 ?auto_149713 ) ) ( not ( = ?auto_149706 ?auto_149714 ) ) ( not ( = ?auto_149706 ?auto_149715 ) ) ( not ( = ?auto_149706 ?auto_149716 ) ) ( not ( = ?auto_149707 ?auto_149708 ) ) ( not ( = ?auto_149707 ?auto_149709 ) ) ( not ( = ?auto_149707 ?auto_149710 ) ) ( not ( = ?auto_149707 ?auto_149711 ) ) ( not ( = ?auto_149707 ?auto_149712 ) ) ( not ( = ?auto_149707 ?auto_149713 ) ) ( not ( = ?auto_149707 ?auto_149714 ) ) ( not ( = ?auto_149707 ?auto_149715 ) ) ( not ( = ?auto_149707 ?auto_149716 ) ) ( not ( = ?auto_149708 ?auto_149709 ) ) ( not ( = ?auto_149708 ?auto_149710 ) ) ( not ( = ?auto_149708 ?auto_149711 ) ) ( not ( = ?auto_149708 ?auto_149712 ) ) ( not ( = ?auto_149708 ?auto_149713 ) ) ( not ( = ?auto_149708 ?auto_149714 ) ) ( not ( = ?auto_149708 ?auto_149715 ) ) ( not ( = ?auto_149708 ?auto_149716 ) ) ( not ( = ?auto_149709 ?auto_149710 ) ) ( not ( = ?auto_149709 ?auto_149711 ) ) ( not ( = ?auto_149709 ?auto_149712 ) ) ( not ( = ?auto_149709 ?auto_149713 ) ) ( not ( = ?auto_149709 ?auto_149714 ) ) ( not ( = ?auto_149709 ?auto_149715 ) ) ( not ( = ?auto_149709 ?auto_149716 ) ) ( not ( = ?auto_149710 ?auto_149711 ) ) ( not ( = ?auto_149710 ?auto_149712 ) ) ( not ( = ?auto_149710 ?auto_149713 ) ) ( not ( = ?auto_149710 ?auto_149714 ) ) ( not ( = ?auto_149710 ?auto_149715 ) ) ( not ( = ?auto_149710 ?auto_149716 ) ) ( not ( = ?auto_149711 ?auto_149712 ) ) ( not ( = ?auto_149711 ?auto_149713 ) ) ( not ( = ?auto_149711 ?auto_149714 ) ) ( not ( = ?auto_149711 ?auto_149715 ) ) ( not ( = ?auto_149711 ?auto_149716 ) ) ( not ( = ?auto_149712 ?auto_149713 ) ) ( not ( = ?auto_149712 ?auto_149714 ) ) ( not ( = ?auto_149712 ?auto_149715 ) ) ( not ( = ?auto_149712 ?auto_149716 ) ) ( not ( = ?auto_149713 ?auto_149714 ) ) ( not ( = ?auto_149713 ?auto_149715 ) ) ( not ( = ?auto_149713 ?auto_149716 ) ) ( not ( = ?auto_149714 ?auto_149715 ) ) ( not ( = ?auto_149714 ?auto_149716 ) ) ( not ( = ?auto_149715 ?auto_149716 ) ) ( ON ?auto_149715 ?auto_149716 ) ( CLEAR ?auto_149713 ) ( ON ?auto_149714 ?auto_149715 ) ( CLEAR ?auto_149714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_149706 ?auto_149707 ?auto_149708 ?auto_149709 ?auto_149710 ?auto_149711 ?auto_149712 ?auto_149713 ?auto_149714 )
      ( MAKE-11PILE ?auto_149706 ?auto_149707 ?auto_149708 ?auto_149709 ?auto_149710 ?auto_149711 ?auto_149712 ?auto_149713 ?auto_149714 ?auto_149715 ?auto_149716 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149728 - BLOCK
      ?auto_149729 - BLOCK
      ?auto_149730 - BLOCK
      ?auto_149731 - BLOCK
      ?auto_149732 - BLOCK
      ?auto_149733 - BLOCK
      ?auto_149734 - BLOCK
      ?auto_149735 - BLOCK
      ?auto_149736 - BLOCK
      ?auto_149737 - BLOCK
      ?auto_149738 - BLOCK
    )
    :vars
    (
      ?auto_149739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149738 ?auto_149739 ) ( ON-TABLE ?auto_149728 ) ( ON ?auto_149729 ?auto_149728 ) ( ON ?auto_149730 ?auto_149729 ) ( ON ?auto_149731 ?auto_149730 ) ( ON ?auto_149732 ?auto_149731 ) ( ON ?auto_149733 ?auto_149732 ) ( ON ?auto_149734 ?auto_149733 ) ( not ( = ?auto_149728 ?auto_149729 ) ) ( not ( = ?auto_149728 ?auto_149730 ) ) ( not ( = ?auto_149728 ?auto_149731 ) ) ( not ( = ?auto_149728 ?auto_149732 ) ) ( not ( = ?auto_149728 ?auto_149733 ) ) ( not ( = ?auto_149728 ?auto_149734 ) ) ( not ( = ?auto_149728 ?auto_149735 ) ) ( not ( = ?auto_149728 ?auto_149736 ) ) ( not ( = ?auto_149728 ?auto_149737 ) ) ( not ( = ?auto_149728 ?auto_149738 ) ) ( not ( = ?auto_149728 ?auto_149739 ) ) ( not ( = ?auto_149729 ?auto_149730 ) ) ( not ( = ?auto_149729 ?auto_149731 ) ) ( not ( = ?auto_149729 ?auto_149732 ) ) ( not ( = ?auto_149729 ?auto_149733 ) ) ( not ( = ?auto_149729 ?auto_149734 ) ) ( not ( = ?auto_149729 ?auto_149735 ) ) ( not ( = ?auto_149729 ?auto_149736 ) ) ( not ( = ?auto_149729 ?auto_149737 ) ) ( not ( = ?auto_149729 ?auto_149738 ) ) ( not ( = ?auto_149729 ?auto_149739 ) ) ( not ( = ?auto_149730 ?auto_149731 ) ) ( not ( = ?auto_149730 ?auto_149732 ) ) ( not ( = ?auto_149730 ?auto_149733 ) ) ( not ( = ?auto_149730 ?auto_149734 ) ) ( not ( = ?auto_149730 ?auto_149735 ) ) ( not ( = ?auto_149730 ?auto_149736 ) ) ( not ( = ?auto_149730 ?auto_149737 ) ) ( not ( = ?auto_149730 ?auto_149738 ) ) ( not ( = ?auto_149730 ?auto_149739 ) ) ( not ( = ?auto_149731 ?auto_149732 ) ) ( not ( = ?auto_149731 ?auto_149733 ) ) ( not ( = ?auto_149731 ?auto_149734 ) ) ( not ( = ?auto_149731 ?auto_149735 ) ) ( not ( = ?auto_149731 ?auto_149736 ) ) ( not ( = ?auto_149731 ?auto_149737 ) ) ( not ( = ?auto_149731 ?auto_149738 ) ) ( not ( = ?auto_149731 ?auto_149739 ) ) ( not ( = ?auto_149732 ?auto_149733 ) ) ( not ( = ?auto_149732 ?auto_149734 ) ) ( not ( = ?auto_149732 ?auto_149735 ) ) ( not ( = ?auto_149732 ?auto_149736 ) ) ( not ( = ?auto_149732 ?auto_149737 ) ) ( not ( = ?auto_149732 ?auto_149738 ) ) ( not ( = ?auto_149732 ?auto_149739 ) ) ( not ( = ?auto_149733 ?auto_149734 ) ) ( not ( = ?auto_149733 ?auto_149735 ) ) ( not ( = ?auto_149733 ?auto_149736 ) ) ( not ( = ?auto_149733 ?auto_149737 ) ) ( not ( = ?auto_149733 ?auto_149738 ) ) ( not ( = ?auto_149733 ?auto_149739 ) ) ( not ( = ?auto_149734 ?auto_149735 ) ) ( not ( = ?auto_149734 ?auto_149736 ) ) ( not ( = ?auto_149734 ?auto_149737 ) ) ( not ( = ?auto_149734 ?auto_149738 ) ) ( not ( = ?auto_149734 ?auto_149739 ) ) ( not ( = ?auto_149735 ?auto_149736 ) ) ( not ( = ?auto_149735 ?auto_149737 ) ) ( not ( = ?auto_149735 ?auto_149738 ) ) ( not ( = ?auto_149735 ?auto_149739 ) ) ( not ( = ?auto_149736 ?auto_149737 ) ) ( not ( = ?auto_149736 ?auto_149738 ) ) ( not ( = ?auto_149736 ?auto_149739 ) ) ( not ( = ?auto_149737 ?auto_149738 ) ) ( not ( = ?auto_149737 ?auto_149739 ) ) ( not ( = ?auto_149738 ?auto_149739 ) ) ( ON ?auto_149737 ?auto_149738 ) ( ON ?auto_149736 ?auto_149737 ) ( CLEAR ?auto_149734 ) ( ON ?auto_149735 ?auto_149736 ) ( CLEAR ?auto_149735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149728 ?auto_149729 ?auto_149730 ?auto_149731 ?auto_149732 ?auto_149733 ?auto_149734 ?auto_149735 )
      ( MAKE-11PILE ?auto_149728 ?auto_149729 ?auto_149730 ?auto_149731 ?auto_149732 ?auto_149733 ?auto_149734 ?auto_149735 ?auto_149736 ?auto_149737 ?auto_149738 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149751 - BLOCK
      ?auto_149752 - BLOCK
      ?auto_149753 - BLOCK
      ?auto_149754 - BLOCK
      ?auto_149755 - BLOCK
      ?auto_149756 - BLOCK
      ?auto_149757 - BLOCK
      ?auto_149758 - BLOCK
      ?auto_149759 - BLOCK
      ?auto_149760 - BLOCK
      ?auto_149761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149761 ) ( ON-TABLE ?auto_149751 ) ( ON ?auto_149752 ?auto_149751 ) ( ON ?auto_149753 ?auto_149752 ) ( ON ?auto_149754 ?auto_149753 ) ( ON ?auto_149755 ?auto_149754 ) ( ON ?auto_149756 ?auto_149755 ) ( ON ?auto_149757 ?auto_149756 ) ( not ( = ?auto_149751 ?auto_149752 ) ) ( not ( = ?auto_149751 ?auto_149753 ) ) ( not ( = ?auto_149751 ?auto_149754 ) ) ( not ( = ?auto_149751 ?auto_149755 ) ) ( not ( = ?auto_149751 ?auto_149756 ) ) ( not ( = ?auto_149751 ?auto_149757 ) ) ( not ( = ?auto_149751 ?auto_149758 ) ) ( not ( = ?auto_149751 ?auto_149759 ) ) ( not ( = ?auto_149751 ?auto_149760 ) ) ( not ( = ?auto_149751 ?auto_149761 ) ) ( not ( = ?auto_149752 ?auto_149753 ) ) ( not ( = ?auto_149752 ?auto_149754 ) ) ( not ( = ?auto_149752 ?auto_149755 ) ) ( not ( = ?auto_149752 ?auto_149756 ) ) ( not ( = ?auto_149752 ?auto_149757 ) ) ( not ( = ?auto_149752 ?auto_149758 ) ) ( not ( = ?auto_149752 ?auto_149759 ) ) ( not ( = ?auto_149752 ?auto_149760 ) ) ( not ( = ?auto_149752 ?auto_149761 ) ) ( not ( = ?auto_149753 ?auto_149754 ) ) ( not ( = ?auto_149753 ?auto_149755 ) ) ( not ( = ?auto_149753 ?auto_149756 ) ) ( not ( = ?auto_149753 ?auto_149757 ) ) ( not ( = ?auto_149753 ?auto_149758 ) ) ( not ( = ?auto_149753 ?auto_149759 ) ) ( not ( = ?auto_149753 ?auto_149760 ) ) ( not ( = ?auto_149753 ?auto_149761 ) ) ( not ( = ?auto_149754 ?auto_149755 ) ) ( not ( = ?auto_149754 ?auto_149756 ) ) ( not ( = ?auto_149754 ?auto_149757 ) ) ( not ( = ?auto_149754 ?auto_149758 ) ) ( not ( = ?auto_149754 ?auto_149759 ) ) ( not ( = ?auto_149754 ?auto_149760 ) ) ( not ( = ?auto_149754 ?auto_149761 ) ) ( not ( = ?auto_149755 ?auto_149756 ) ) ( not ( = ?auto_149755 ?auto_149757 ) ) ( not ( = ?auto_149755 ?auto_149758 ) ) ( not ( = ?auto_149755 ?auto_149759 ) ) ( not ( = ?auto_149755 ?auto_149760 ) ) ( not ( = ?auto_149755 ?auto_149761 ) ) ( not ( = ?auto_149756 ?auto_149757 ) ) ( not ( = ?auto_149756 ?auto_149758 ) ) ( not ( = ?auto_149756 ?auto_149759 ) ) ( not ( = ?auto_149756 ?auto_149760 ) ) ( not ( = ?auto_149756 ?auto_149761 ) ) ( not ( = ?auto_149757 ?auto_149758 ) ) ( not ( = ?auto_149757 ?auto_149759 ) ) ( not ( = ?auto_149757 ?auto_149760 ) ) ( not ( = ?auto_149757 ?auto_149761 ) ) ( not ( = ?auto_149758 ?auto_149759 ) ) ( not ( = ?auto_149758 ?auto_149760 ) ) ( not ( = ?auto_149758 ?auto_149761 ) ) ( not ( = ?auto_149759 ?auto_149760 ) ) ( not ( = ?auto_149759 ?auto_149761 ) ) ( not ( = ?auto_149760 ?auto_149761 ) ) ( ON ?auto_149760 ?auto_149761 ) ( ON ?auto_149759 ?auto_149760 ) ( CLEAR ?auto_149757 ) ( ON ?auto_149758 ?auto_149759 ) ( CLEAR ?auto_149758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_149751 ?auto_149752 ?auto_149753 ?auto_149754 ?auto_149755 ?auto_149756 ?auto_149757 ?auto_149758 )
      ( MAKE-11PILE ?auto_149751 ?auto_149752 ?auto_149753 ?auto_149754 ?auto_149755 ?auto_149756 ?auto_149757 ?auto_149758 ?auto_149759 ?auto_149760 ?auto_149761 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149773 - BLOCK
      ?auto_149774 - BLOCK
      ?auto_149775 - BLOCK
      ?auto_149776 - BLOCK
      ?auto_149777 - BLOCK
      ?auto_149778 - BLOCK
      ?auto_149779 - BLOCK
      ?auto_149780 - BLOCK
      ?auto_149781 - BLOCK
      ?auto_149782 - BLOCK
      ?auto_149783 - BLOCK
    )
    :vars
    (
      ?auto_149784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149783 ?auto_149784 ) ( ON-TABLE ?auto_149773 ) ( ON ?auto_149774 ?auto_149773 ) ( ON ?auto_149775 ?auto_149774 ) ( ON ?auto_149776 ?auto_149775 ) ( ON ?auto_149777 ?auto_149776 ) ( ON ?auto_149778 ?auto_149777 ) ( not ( = ?auto_149773 ?auto_149774 ) ) ( not ( = ?auto_149773 ?auto_149775 ) ) ( not ( = ?auto_149773 ?auto_149776 ) ) ( not ( = ?auto_149773 ?auto_149777 ) ) ( not ( = ?auto_149773 ?auto_149778 ) ) ( not ( = ?auto_149773 ?auto_149779 ) ) ( not ( = ?auto_149773 ?auto_149780 ) ) ( not ( = ?auto_149773 ?auto_149781 ) ) ( not ( = ?auto_149773 ?auto_149782 ) ) ( not ( = ?auto_149773 ?auto_149783 ) ) ( not ( = ?auto_149773 ?auto_149784 ) ) ( not ( = ?auto_149774 ?auto_149775 ) ) ( not ( = ?auto_149774 ?auto_149776 ) ) ( not ( = ?auto_149774 ?auto_149777 ) ) ( not ( = ?auto_149774 ?auto_149778 ) ) ( not ( = ?auto_149774 ?auto_149779 ) ) ( not ( = ?auto_149774 ?auto_149780 ) ) ( not ( = ?auto_149774 ?auto_149781 ) ) ( not ( = ?auto_149774 ?auto_149782 ) ) ( not ( = ?auto_149774 ?auto_149783 ) ) ( not ( = ?auto_149774 ?auto_149784 ) ) ( not ( = ?auto_149775 ?auto_149776 ) ) ( not ( = ?auto_149775 ?auto_149777 ) ) ( not ( = ?auto_149775 ?auto_149778 ) ) ( not ( = ?auto_149775 ?auto_149779 ) ) ( not ( = ?auto_149775 ?auto_149780 ) ) ( not ( = ?auto_149775 ?auto_149781 ) ) ( not ( = ?auto_149775 ?auto_149782 ) ) ( not ( = ?auto_149775 ?auto_149783 ) ) ( not ( = ?auto_149775 ?auto_149784 ) ) ( not ( = ?auto_149776 ?auto_149777 ) ) ( not ( = ?auto_149776 ?auto_149778 ) ) ( not ( = ?auto_149776 ?auto_149779 ) ) ( not ( = ?auto_149776 ?auto_149780 ) ) ( not ( = ?auto_149776 ?auto_149781 ) ) ( not ( = ?auto_149776 ?auto_149782 ) ) ( not ( = ?auto_149776 ?auto_149783 ) ) ( not ( = ?auto_149776 ?auto_149784 ) ) ( not ( = ?auto_149777 ?auto_149778 ) ) ( not ( = ?auto_149777 ?auto_149779 ) ) ( not ( = ?auto_149777 ?auto_149780 ) ) ( not ( = ?auto_149777 ?auto_149781 ) ) ( not ( = ?auto_149777 ?auto_149782 ) ) ( not ( = ?auto_149777 ?auto_149783 ) ) ( not ( = ?auto_149777 ?auto_149784 ) ) ( not ( = ?auto_149778 ?auto_149779 ) ) ( not ( = ?auto_149778 ?auto_149780 ) ) ( not ( = ?auto_149778 ?auto_149781 ) ) ( not ( = ?auto_149778 ?auto_149782 ) ) ( not ( = ?auto_149778 ?auto_149783 ) ) ( not ( = ?auto_149778 ?auto_149784 ) ) ( not ( = ?auto_149779 ?auto_149780 ) ) ( not ( = ?auto_149779 ?auto_149781 ) ) ( not ( = ?auto_149779 ?auto_149782 ) ) ( not ( = ?auto_149779 ?auto_149783 ) ) ( not ( = ?auto_149779 ?auto_149784 ) ) ( not ( = ?auto_149780 ?auto_149781 ) ) ( not ( = ?auto_149780 ?auto_149782 ) ) ( not ( = ?auto_149780 ?auto_149783 ) ) ( not ( = ?auto_149780 ?auto_149784 ) ) ( not ( = ?auto_149781 ?auto_149782 ) ) ( not ( = ?auto_149781 ?auto_149783 ) ) ( not ( = ?auto_149781 ?auto_149784 ) ) ( not ( = ?auto_149782 ?auto_149783 ) ) ( not ( = ?auto_149782 ?auto_149784 ) ) ( not ( = ?auto_149783 ?auto_149784 ) ) ( ON ?auto_149782 ?auto_149783 ) ( ON ?auto_149781 ?auto_149782 ) ( ON ?auto_149780 ?auto_149781 ) ( CLEAR ?auto_149778 ) ( ON ?auto_149779 ?auto_149780 ) ( CLEAR ?auto_149779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149773 ?auto_149774 ?auto_149775 ?auto_149776 ?auto_149777 ?auto_149778 ?auto_149779 )
      ( MAKE-11PILE ?auto_149773 ?auto_149774 ?auto_149775 ?auto_149776 ?auto_149777 ?auto_149778 ?auto_149779 ?auto_149780 ?auto_149781 ?auto_149782 ?auto_149783 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149796 - BLOCK
      ?auto_149797 - BLOCK
      ?auto_149798 - BLOCK
      ?auto_149799 - BLOCK
      ?auto_149800 - BLOCK
      ?auto_149801 - BLOCK
      ?auto_149802 - BLOCK
      ?auto_149803 - BLOCK
      ?auto_149804 - BLOCK
      ?auto_149805 - BLOCK
      ?auto_149806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149806 ) ( ON-TABLE ?auto_149796 ) ( ON ?auto_149797 ?auto_149796 ) ( ON ?auto_149798 ?auto_149797 ) ( ON ?auto_149799 ?auto_149798 ) ( ON ?auto_149800 ?auto_149799 ) ( ON ?auto_149801 ?auto_149800 ) ( not ( = ?auto_149796 ?auto_149797 ) ) ( not ( = ?auto_149796 ?auto_149798 ) ) ( not ( = ?auto_149796 ?auto_149799 ) ) ( not ( = ?auto_149796 ?auto_149800 ) ) ( not ( = ?auto_149796 ?auto_149801 ) ) ( not ( = ?auto_149796 ?auto_149802 ) ) ( not ( = ?auto_149796 ?auto_149803 ) ) ( not ( = ?auto_149796 ?auto_149804 ) ) ( not ( = ?auto_149796 ?auto_149805 ) ) ( not ( = ?auto_149796 ?auto_149806 ) ) ( not ( = ?auto_149797 ?auto_149798 ) ) ( not ( = ?auto_149797 ?auto_149799 ) ) ( not ( = ?auto_149797 ?auto_149800 ) ) ( not ( = ?auto_149797 ?auto_149801 ) ) ( not ( = ?auto_149797 ?auto_149802 ) ) ( not ( = ?auto_149797 ?auto_149803 ) ) ( not ( = ?auto_149797 ?auto_149804 ) ) ( not ( = ?auto_149797 ?auto_149805 ) ) ( not ( = ?auto_149797 ?auto_149806 ) ) ( not ( = ?auto_149798 ?auto_149799 ) ) ( not ( = ?auto_149798 ?auto_149800 ) ) ( not ( = ?auto_149798 ?auto_149801 ) ) ( not ( = ?auto_149798 ?auto_149802 ) ) ( not ( = ?auto_149798 ?auto_149803 ) ) ( not ( = ?auto_149798 ?auto_149804 ) ) ( not ( = ?auto_149798 ?auto_149805 ) ) ( not ( = ?auto_149798 ?auto_149806 ) ) ( not ( = ?auto_149799 ?auto_149800 ) ) ( not ( = ?auto_149799 ?auto_149801 ) ) ( not ( = ?auto_149799 ?auto_149802 ) ) ( not ( = ?auto_149799 ?auto_149803 ) ) ( not ( = ?auto_149799 ?auto_149804 ) ) ( not ( = ?auto_149799 ?auto_149805 ) ) ( not ( = ?auto_149799 ?auto_149806 ) ) ( not ( = ?auto_149800 ?auto_149801 ) ) ( not ( = ?auto_149800 ?auto_149802 ) ) ( not ( = ?auto_149800 ?auto_149803 ) ) ( not ( = ?auto_149800 ?auto_149804 ) ) ( not ( = ?auto_149800 ?auto_149805 ) ) ( not ( = ?auto_149800 ?auto_149806 ) ) ( not ( = ?auto_149801 ?auto_149802 ) ) ( not ( = ?auto_149801 ?auto_149803 ) ) ( not ( = ?auto_149801 ?auto_149804 ) ) ( not ( = ?auto_149801 ?auto_149805 ) ) ( not ( = ?auto_149801 ?auto_149806 ) ) ( not ( = ?auto_149802 ?auto_149803 ) ) ( not ( = ?auto_149802 ?auto_149804 ) ) ( not ( = ?auto_149802 ?auto_149805 ) ) ( not ( = ?auto_149802 ?auto_149806 ) ) ( not ( = ?auto_149803 ?auto_149804 ) ) ( not ( = ?auto_149803 ?auto_149805 ) ) ( not ( = ?auto_149803 ?auto_149806 ) ) ( not ( = ?auto_149804 ?auto_149805 ) ) ( not ( = ?auto_149804 ?auto_149806 ) ) ( not ( = ?auto_149805 ?auto_149806 ) ) ( ON ?auto_149805 ?auto_149806 ) ( ON ?auto_149804 ?auto_149805 ) ( ON ?auto_149803 ?auto_149804 ) ( CLEAR ?auto_149801 ) ( ON ?auto_149802 ?auto_149803 ) ( CLEAR ?auto_149802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_149796 ?auto_149797 ?auto_149798 ?auto_149799 ?auto_149800 ?auto_149801 ?auto_149802 )
      ( MAKE-11PILE ?auto_149796 ?auto_149797 ?auto_149798 ?auto_149799 ?auto_149800 ?auto_149801 ?auto_149802 ?auto_149803 ?auto_149804 ?auto_149805 ?auto_149806 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149818 - BLOCK
      ?auto_149819 - BLOCK
      ?auto_149820 - BLOCK
      ?auto_149821 - BLOCK
      ?auto_149822 - BLOCK
      ?auto_149823 - BLOCK
      ?auto_149824 - BLOCK
      ?auto_149825 - BLOCK
      ?auto_149826 - BLOCK
      ?auto_149827 - BLOCK
      ?auto_149828 - BLOCK
    )
    :vars
    (
      ?auto_149829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149828 ?auto_149829 ) ( ON-TABLE ?auto_149818 ) ( ON ?auto_149819 ?auto_149818 ) ( ON ?auto_149820 ?auto_149819 ) ( ON ?auto_149821 ?auto_149820 ) ( ON ?auto_149822 ?auto_149821 ) ( not ( = ?auto_149818 ?auto_149819 ) ) ( not ( = ?auto_149818 ?auto_149820 ) ) ( not ( = ?auto_149818 ?auto_149821 ) ) ( not ( = ?auto_149818 ?auto_149822 ) ) ( not ( = ?auto_149818 ?auto_149823 ) ) ( not ( = ?auto_149818 ?auto_149824 ) ) ( not ( = ?auto_149818 ?auto_149825 ) ) ( not ( = ?auto_149818 ?auto_149826 ) ) ( not ( = ?auto_149818 ?auto_149827 ) ) ( not ( = ?auto_149818 ?auto_149828 ) ) ( not ( = ?auto_149818 ?auto_149829 ) ) ( not ( = ?auto_149819 ?auto_149820 ) ) ( not ( = ?auto_149819 ?auto_149821 ) ) ( not ( = ?auto_149819 ?auto_149822 ) ) ( not ( = ?auto_149819 ?auto_149823 ) ) ( not ( = ?auto_149819 ?auto_149824 ) ) ( not ( = ?auto_149819 ?auto_149825 ) ) ( not ( = ?auto_149819 ?auto_149826 ) ) ( not ( = ?auto_149819 ?auto_149827 ) ) ( not ( = ?auto_149819 ?auto_149828 ) ) ( not ( = ?auto_149819 ?auto_149829 ) ) ( not ( = ?auto_149820 ?auto_149821 ) ) ( not ( = ?auto_149820 ?auto_149822 ) ) ( not ( = ?auto_149820 ?auto_149823 ) ) ( not ( = ?auto_149820 ?auto_149824 ) ) ( not ( = ?auto_149820 ?auto_149825 ) ) ( not ( = ?auto_149820 ?auto_149826 ) ) ( not ( = ?auto_149820 ?auto_149827 ) ) ( not ( = ?auto_149820 ?auto_149828 ) ) ( not ( = ?auto_149820 ?auto_149829 ) ) ( not ( = ?auto_149821 ?auto_149822 ) ) ( not ( = ?auto_149821 ?auto_149823 ) ) ( not ( = ?auto_149821 ?auto_149824 ) ) ( not ( = ?auto_149821 ?auto_149825 ) ) ( not ( = ?auto_149821 ?auto_149826 ) ) ( not ( = ?auto_149821 ?auto_149827 ) ) ( not ( = ?auto_149821 ?auto_149828 ) ) ( not ( = ?auto_149821 ?auto_149829 ) ) ( not ( = ?auto_149822 ?auto_149823 ) ) ( not ( = ?auto_149822 ?auto_149824 ) ) ( not ( = ?auto_149822 ?auto_149825 ) ) ( not ( = ?auto_149822 ?auto_149826 ) ) ( not ( = ?auto_149822 ?auto_149827 ) ) ( not ( = ?auto_149822 ?auto_149828 ) ) ( not ( = ?auto_149822 ?auto_149829 ) ) ( not ( = ?auto_149823 ?auto_149824 ) ) ( not ( = ?auto_149823 ?auto_149825 ) ) ( not ( = ?auto_149823 ?auto_149826 ) ) ( not ( = ?auto_149823 ?auto_149827 ) ) ( not ( = ?auto_149823 ?auto_149828 ) ) ( not ( = ?auto_149823 ?auto_149829 ) ) ( not ( = ?auto_149824 ?auto_149825 ) ) ( not ( = ?auto_149824 ?auto_149826 ) ) ( not ( = ?auto_149824 ?auto_149827 ) ) ( not ( = ?auto_149824 ?auto_149828 ) ) ( not ( = ?auto_149824 ?auto_149829 ) ) ( not ( = ?auto_149825 ?auto_149826 ) ) ( not ( = ?auto_149825 ?auto_149827 ) ) ( not ( = ?auto_149825 ?auto_149828 ) ) ( not ( = ?auto_149825 ?auto_149829 ) ) ( not ( = ?auto_149826 ?auto_149827 ) ) ( not ( = ?auto_149826 ?auto_149828 ) ) ( not ( = ?auto_149826 ?auto_149829 ) ) ( not ( = ?auto_149827 ?auto_149828 ) ) ( not ( = ?auto_149827 ?auto_149829 ) ) ( not ( = ?auto_149828 ?auto_149829 ) ) ( ON ?auto_149827 ?auto_149828 ) ( ON ?auto_149826 ?auto_149827 ) ( ON ?auto_149825 ?auto_149826 ) ( ON ?auto_149824 ?auto_149825 ) ( CLEAR ?auto_149822 ) ( ON ?auto_149823 ?auto_149824 ) ( CLEAR ?auto_149823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149818 ?auto_149819 ?auto_149820 ?auto_149821 ?auto_149822 ?auto_149823 )
      ( MAKE-11PILE ?auto_149818 ?auto_149819 ?auto_149820 ?auto_149821 ?auto_149822 ?auto_149823 ?auto_149824 ?auto_149825 ?auto_149826 ?auto_149827 ?auto_149828 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149841 - BLOCK
      ?auto_149842 - BLOCK
      ?auto_149843 - BLOCK
      ?auto_149844 - BLOCK
      ?auto_149845 - BLOCK
      ?auto_149846 - BLOCK
      ?auto_149847 - BLOCK
      ?auto_149848 - BLOCK
      ?auto_149849 - BLOCK
      ?auto_149850 - BLOCK
      ?auto_149851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149851 ) ( ON-TABLE ?auto_149841 ) ( ON ?auto_149842 ?auto_149841 ) ( ON ?auto_149843 ?auto_149842 ) ( ON ?auto_149844 ?auto_149843 ) ( ON ?auto_149845 ?auto_149844 ) ( not ( = ?auto_149841 ?auto_149842 ) ) ( not ( = ?auto_149841 ?auto_149843 ) ) ( not ( = ?auto_149841 ?auto_149844 ) ) ( not ( = ?auto_149841 ?auto_149845 ) ) ( not ( = ?auto_149841 ?auto_149846 ) ) ( not ( = ?auto_149841 ?auto_149847 ) ) ( not ( = ?auto_149841 ?auto_149848 ) ) ( not ( = ?auto_149841 ?auto_149849 ) ) ( not ( = ?auto_149841 ?auto_149850 ) ) ( not ( = ?auto_149841 ?auto_149851 ) ) ( not ( = ?auto_149842 ?auto_149843 ) ) ( not ( = ?auto_149842 ?auto_149844 ) ) ( not ( = ?auto_149842 ?auto_149845 ) ) ( not ( = ?auto_149842 ?auto_149846 ) ) ( not ( = ?auto_149842 ?auto_149847 ) ) ( not ( = ?auto_149842 ?auto_149848 ) ) ( not ( = ?auto_149842 ?auto_149849 ) ) ( not ( = ?auto_149842 ?auto_149850 ) ) ( not ( = ?auto_149842 ?auto_149851 ) ) ( not ( = ?auto_149843 ?auto_149844 ) ) ( not ( = ?auto_149843 ?auto_149845 ) ) ( not ( = ?auto_149843 ?auto_149846 ) ) ( not ( = ?auto_149843 ?auto_149847 ) ) ( not ( = ?auto_149843 ?auto_149848 ) ) ( not ( = ?auto_149843 ?auto_149849 ) ) ( not ( = ?auto_149843 ?auto_149850 ) ) ( not ( = ?auto_149843 ?auto_149851 ) ) ( not ( = ?auto_149844 ?auto_149845 ) ) ( not ( = ?auto_149844 ?auto_149846 ) ) ( not ( = ?auto_149844 ?auto_149847 ) ) ( not ( = ?auto_149844 ?auto_149848 ) ) ( not ( = ?auto_149844 ?auto_149849 ) ) ( not ( = ?auto_149844 ?auto_149850 ) ) ( not ( = ?auto_149844 ?auto_149851 ) ) ( not ( = ?auto_149845 ?auto_149846 ) ) ( not ( = ?auto_149845 ?auto_149847 ) ) ( not ( = ?auto_149845 ?auto_149848 ) ) ( not ( = ?auto_149845 ?auto_149849 ) ) ( not ( = ?auto_149845 ?auto_149850 ) ) ( not ( = ?auto_149845 ?auto_149851 ) ) ( not ( = ?auto_149846 ?auto_149847 ) ) ( not ( = ?auto_149846 ?auto_149848 ) ) ( not ( = ?auto_149846 ?auto_149849 ) ) ( not ( = ?auto_149846 ?auto_149850 ) ) ( not ( = ?auto_149846 ?auto_149851 ) ) ( not ( = ?auto_149847 ?auto_149848 ) ) ( not ( = ?auto_149847 ?auto_149849 ) ) ( not ( = ?auto_149847 ?auto_149850 ) ) ( not ( = ?auto_149847 ?auto_149851 ) ) ( not ( = ?auto_149848 ?auto_149849 ) ) ( not ( = ?auto_149848 ?auto_149850 ) ) ( not ( = ?auto_149848 ?auto_149851 ) ) ( not ( = ?auto_149849 ?auto_149850 ) ) ( not ( = ?auto_149849 ?auto_149851 ) ) ( not ( = ?auto_149850 ?auto_149851 ) ) ( ON ?auto_149850 ?auto_149851 ) ( ON ?auto_149849 ?auto_149850 ) ( ON ?auto_149848 ?auto_149849 ) ( ON ?auto_149847 ?auto_149848 ) ( CLEAR ?auto_149845 ) ( ON ?auto_149846 ?auto_149847 ) ( CLEAR ?auto_149846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_149841 ?auto_149842 ?auto_149843 ?auto_149844 ?auto_149845 ?auto_149846 )
      ( MAKE-11PILE ?auto_149841 ?auto_149842 ?auto_149843 ?auto_149844 ?auto_149845 ?auto_149846 ?auto_149847 ?auto_149848 ?auto_149849 ?auto_149850 ?auto_149851 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149863 - BLOCK
      ?auto_149864 - BLOCK
      ?auto_149865 - BLOCK
      ?auto_149866 - BLOCK
      ?auto_149867 - BLOCK
      ?auto_149868 - BLOCK
      ?auto_149869 - BLOCK
      ?auto_149870 - BLOCK
      ?auto_149871 - BLOCK
      ?auto_149872 - BLOCK
      ?auto_149873 - BLOCK
    )
    :vars
    (
      ?auto_149874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149873 ?auto_149874 ) ( ON-TABLE ?auto_149863 ) ( ON ?auto_149864 ?auto_149863 ) ( ON ?auto_149865 ?auto_149864 ) ( ON ?auto_149866 ?auto_149865 ) ( not ( = ?auto_149863 ?auto_149864 ) ) ( not ( = ?auto_149863 ?auto_149865 ) ) ( not ( = ?auto_149863 ?auto_149866 ) ) ( not ( = ?auto_149863 ?auto_149867 ) ) ( not ( = ?auto_149863 ?auto_149868 ) ) ( not ( = ?auto_149863 ?auto_149869 ) ) ( not ( = ?auto_149863 ?auto_149870 ) ) ( not ( = ?auto_149863 ?auto_149871 ) ) ( not ( = ?auto_149863 ?auto_149872 ) ) ( not ( = ?auto_149863 ?auto_149873 ) ) ( not ( = ?auto_149863 ?auto_149874 ) ) ( not ( = ?auto_149864 ?auto_149865 ) ) ( not ( = ?auto_149864 ?auto_149866 ) ) ( not ( = ?auto_149864 ?auto_149867 ) ) ( not ( = ?auto_149864 ?auto_149868 ) ) ( not ( = ?auto_149864 ?auto_149869 ) ) ( not ( = ?auto_149864 ?auto_149870 ) ) ( not ( = ?auto_149864 ?auto_149871 ) ) ( not ( = ?auto_149864 ?auto_149872 ) ) ( not ( = ?auto_149864 ?auto_149873 ) ) ( not ( = ?auto_149864 ?auto_149874 ) ) ( not ( = ?auto_149865 ?auto_149866 ) ) ( not ( = ?auto_149865 ?auto_149867 ) ) ( not ( = ?auto_149865 ?auto_149868 ) ) ( not ( = ?auto_149865 ?auto_149869 ) ) ( not ( = ?auto_149865 ?auto_149870 ) ) ( not ( = ?auto_149865 ?auto_149871 ) ) ( not ( = ?auto_149865 ?auto_149872 ) ) ( not ( = ?auto_149865 ?auto_149873 ) ) ( not ( = ?auto_149865 ?auto_149874 ) ) ( not ( = ?auto_149866 ?auto_149867 ) ) ( not ( = ?auto_149866 ?auto_149868 ) ) ( not ( = ?auto_149866 ?auto_149869 ) ) ( not ( = ?auto_149866 ?auto_149870 ) ) ( not ( = ?auto_149866 ?auto_149871 ) ) ( not ( = ?auto_149866 ?auto_149872 ) ) ( not ( = ?auto_149866 ?auto_149873 ) ) ( not ( = ?auto_149866 ?auto_149874 ) ) ( not ( = ?auto_149867 ?auto_149868 ) ) ( not ( = ?auto_149867 ?auto_149869 ) ) ( not ( = ?auto_149867 ?auto_149870 ) ) ( not ( = ?auto_149867 ?auto_149871 ) ) ( not ( = ?auto_149867 ?auto_149872 ) ) ( not ( = ?auto_149867 ?auto_149873 ) ) ( not ( = ?auto_149867 ?auto_149874 ) ) ( not ( = ?auto_149868 ?auto_149869 ) ) ( not ( = ?auto_149868 ?auto_149870 ) ) ( not ( = ?auto_149868 ?auto_149871 ) ) ( not ( = ?auto_149868 ?auto_149872 ) ) ( not ( = ?auto_149868 ?auto_149873 ) ) ( not ( = ?auto_149868 ?auto_149874 ) ) ( not ( = ?auto_149869 ?auto_149870 ) ) ( not ( = ?auto_149869 ?auto_149871 ) ) ( not ( = ?auto_149869 ?auto_149872 ) ) ( not ( = ?auto_149869 ?auto_149873 ) ) ( not ( = ?auto_149869 ?auto_149874 ) ) ( not ( = ?auto_149870 ?auto_149871 ) ) ( not ( = ?auto_149870 ?auto_149872 ) ) ( not ( = ?auto_149870 ?auto_149873 ) ) ( not ( = ?auto_149870 ?auto_149874 ) ) ( not ( = ?auto_149871 ?auto_149872 ) ) ( not ( = ?auto_149871 ?auto_149873 ) ) ( not ( = ?auto_149871 ?auto_149874 ) ) ( not ( = ?auto_149872 ?auto_149873 ) ) ( not ( = ?auto_149872 ?auto_149874 ) ) ( not ( = ?auto_149873 ?auto_149874 ) ) ( ON ?auto_149872 ?auto_149873 ) ( ON ?auto_149871 ?auto_149872 ) ( ON ?auto_149870 ?auto_149871 ) ( ON ?auto_149869 ?auto_149870 ) ( ON ?auto_149868 ?auto_149869 ) ( CLEAR ?auto_149866 ) ( ON ?auto_149867 ?auto_149868 ) ( CLEAR ?auto_149867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149863 ?auto_149864 ?auto_149865 ?auto_149866 ?auto_149867 )
      ( MAKE-11PILE ?auto_149863 ?auto_149864 ?auto_149865 ?auto_149866 ?auto_149867 ?auto_149868 ?auto_149869 ?auto_149870 ?auto_149871 ?auto_149872 ?auto_149873 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149886 - BLOCK
      ?auto_149887 - BLOCK
      ?auto_149888 - BLOCK
      ?auto_149889 - BLOCK
      ?auto_149890 - BLOCK
      ?auto_149891 - BLOCK
      ?auto_149892 - BLOCK
      ?auto_149893 - BLOCK
      ?auto_149894 - BLOCK
      ?auto_149895 - BLOCK
      ?auto_149896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149896 ) ( ON-TABLE ?auto_149886 ) ( ON ?auto_149887 ?auto_149886 ) ( ON ?auto_149888 ?auto_149887 ) ( ON ?auto_149889 ?auto_149888 ) ( not ( = ?auto_149886 ?auto_149887 ) ) ( not ( = ?auto_149886 ?auto_149888 ) ) ( not ( = ?auto_149886 ?auto_149889 ) ) ( not ( = ?auto_149886 ?auto_149890 ) ) ( not ( = ?auto_149886 ?auto_149891 ) ) ( not ( = ?auto_149886 ?auto_149892 ) ) ( not ( = ?auto_149886 ?auto_149893 ) ) ( not ( = ?auto_149886 ?auto_149894 ) ) ( not ( = ?auto_149886 ?auto_149895 ) ) ( not ( = ?auto_149886 ?auto_149896 ) ) ( not ( = ?auto_149887 ?auto_149888 ) ) ( not ( = ?auto_149887 ?auto_149889 ) ) ( not ( = ?auto_149887 ?auto_149890 ) ) ( not ( = ?auto_149887 ?auto_149891 ) ) ( not ( = ?auto_149887 ?auto_149892 ) ) ( not ( = ?auto_149887 ?auto_149893 ) ) ( not ( = ?auto_149887 ?auto_149894 ) ) ( not ( = ?auto_149887 ?auto_149895 ) ) ( not ( = ?auto_149887 ?auto_149896 ) ) ( not ( = ?auto_149888 ?auto_149889 ) ) ( not ( = ?auto_149888 ?auto_149890 ) ) ( not ( = ?auto_149888 ?auto_149891 ) ) ( not ( = ?auto_149888 ?auto_149892 ) ) ( not ( = ?auto_149888 ?auto_149893 ) ) ( not ( = ?auto_149888 ?auto_149894 ) ) ( not ( = ?auto_149888 ?auto_149895 ) ) ( not ( = ?auto_149888 ?auto_149896 ) ) ( not ( = ?auto_149889 ?auto_149890 ) ) ( not ( = ?auto_149889 ?auto_149891 ) ) ( not ( = ?auto_149889 ?auto_149892 ) ) ( not ( = ?auto_149889 ?auto_149893 ) ) ( not ( = ?auto_149889 ?auto_149894 ) ) ( not ( = ?auto_149889 ?auto_149895 ) ) ( not ( = ?auto_149889 ?auto_149896 ) ) ( not ( = ?auto_149890 ?auto_149891 ) ) ( not ( = ?auto_149890 ?auto_149892 ) ) ( not ( = ?auto_149890 ?auto_149893 ) ) ( not ( = ?auto_149890 ?auto_149894 ) ) ( not ( = ?auto_149890 ?auto_149895 ) ) ( not ( = ?auto_149890 ?auto_149896 ) ) ( not ( = ?auto_149891 ?auto_149892 ) ) ( not ( = ?auto_149891 ?auto_149893 ) ) ( not ( = ?auto_149891 ?auto_149894 ) ) ( not ( = ?auto_149891 ?auto_149895 ) ) ( not ( = ?auto_149891 ?auto_149896 ) ) ( not ( = ?auto_149892 ?auto_149893 ) ) ( not ( = ?auto_149892 ?auto_149894 ) ) ( not ( = ?auto_149892 ?auto_149895 ) ) ( not ( = ?auto_149892 ?auto_149896 ) ) ( not ( = ?auto_149893 ?auto_149894 ) ) ( not ( = ?auto_149893 ?auto_149895 ) ) ( not ( = ?auto_149893 ?auto_149896 ) ) ( not ( = ?auto_149894 ?auto_149895 ) ) ( not ( = ?auto_149894 ?auto_149896 ) ) ( not ( = ?auto_149895 ?auto_149896 ) ) ( ON ?auto_149895 ?auto_149896 ) ( ON ?auto_149894 ?auto_149895 ) ( ON ?auto_149893 ?auto_149894 ) ( ON ?auto_149892 ?auto_149893 ) ( ON ?auto_149891 ?auto_149892 ) ( CLEAR ?auto_149889 ) ( ON ?auto_149890 ?auto_149891 ) ( CLEAR ?auto_149890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_149886 ?auto_149887 ?auto_149888 ?auto_149889 ?auto_149890 )
      ( MAKE-11PILE ?auto_149886 ?auto_149887 ?auto_149888 ?auto_149889 ?auto_149890 ?auto_149891 ?auto_149892 ?auto_149893 ?auto_149894 ?auto_149895 ?auto_149896 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149908 - BLOCK
      ?auto_149909 - BLOCK
      ?auto_149910 - BLOCK
      ?auto_149911 - BLOCK
      ?auto_149912 - BLOCK
      ?auto_149913 - BLOCK
      ?auto_149914 - BLOCK
      ?auto_149915 - BLOCK
      ?auto_149916 - BLOCK
      ?auto_149917 - BLOCK
      ?auto_149918 - BLOCK
    )
    :vars
    (
      ?auto_149919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149918 ?auto_149919 ) ( ON-TABLE ?auto_149908 ) ( ON ?auto_149909 ?auto_149908 ) ( ON ?auto_149910 ?auto_149909 ) ( not ( = ?auto_149908 ?auto_149909 ) ) ( not ( = ?auto_149908 ?auto_149910 ) ) ( not ( = ?auto_149908 ?auto_149911 ) ) ( not ( = ?auto_149908 ?auto_149912 ) ) ( not ( = ?auto_149908 ?auto_149913 ) ) ( not ( = ?auto_149908 ?auto_149914 ) ) ( not ( = ?auto_149908 ?auto_149915 ) ) ( not ( = ?auto_149908 ?auto_149916 ) ) ( not ( = ?auto_149908 ?auto_149917 ) ) ( not ( = ?auto_149908 ?auto_149918 ) ) ( not ( = ?auto_149908 ?auto_149919 ) ) ( not ( = ?auto_149909 ?auto_149910 ) ) ( not ( = ?auto_149909 ?auto_149911 ) ) ( not ( = ?auto_149909 ?auto_149912 ) ) ( not ( = ?auto_149909 ?auto_149913 ) ) ( not ( = ?auto_149909 ?auto_149914 ) ) ( not ( = ?auto_149909 ?auto_149915 ) ) ( not ( = ?auto_149909 ?auto_149916 ) ) ( not ( = ?auto_149909 ?auto_149917 ) ) ( not ( = ?auto_149909 ?auto_149918 ) ) ( not ( = ?auto_149909 ?auto_149919 ) ) ( not ( = ?auto_149910 ?auto_149911 ) ) ( not ( = ?auto_149910 ?auto_149912 ) ) ( not ( = ?auto_149910 ?auto_149913 ) ) ( not ( = ?auto_149910 ?auto_149914 ) ) ( not ( = ?auto_149910 ?auto_149915 ) ) ( not ( = ?auto_149910 ?auto_149916 ) ) ( not ( = ?auto_149910 ?auto_149917 ) ) ( not ( = ?auto_149910 ?auto_149918 ) ) ( not ( = ?auto_149910 ?auto_149919 ) ) ( not ( = ?auto_149911 ?auto_149912 ) ) ( not ( = ?auto_149911 ?auto_149913 ) ) ( not ( = ?auto_149911 ?auto_149914 ) ) ( not ( = ?auto_149911 ?auto_149915 ) ) ( not ( = ?auto_149911 ?auto_149916 ) ) ( not ( = ?auto_149911 ?auto_149917 ) ) ( not ( = ?auto_149911 ?auto_149918 ) ) ( not ( = ?auto_149911 ?auto_149919 ) ) ( not ( = ?auto_149912 ?auto_149913 ) ) ( not ( = ?auto_149912 ?auto_149914 ) ) ( not ( = ?auto_149912 ?auto_149915 ) ) ( not ( = ?auto_149912 ?auto_149916 ) ) ( not ( = ?auto_149912 ?auto_149917 ) ) ( not ( = ?auto_149912 ?auto_149918 ) ) ( not ( = ?auto_149912 ?auto_149919 ) ) ( not ( = ?auto_149913 ?auto_149914 ) ) ( not ( = ?auto_149913 ?auto_149915 ) ) ( not ( = ?auto_149913 ?auto_149916 ) ) ( not ( = ?auto_149913 ?auto_149917 ) ) ( not ( = ?auto_149913 ?auto_149918 ) ) ( not ( = ?auto_149913 ?auto_149919 ) ) ( not ( = ?auto_149914 ?auto_149915 ) ) ( not ( = ?auto_149914 ?auto_149916 ) ) ( not ( = ?auto_149914 ?auto_149917 ) ) ( not ( = ?auto_149914 ?auto_149918 ) ) ( not ( = ?auto_149914 ?auto_149919 ) ) ( not ( = ?auto_149915 ?auto_149916 ) ) ( not ( = ?auto_149915 ?auto_149917 ) ) ( not ( = ?auto_149915 ?auto_149918 ) ) ( not ( = ?auto_149915 ?auto_149919 ) ) ( not ( = ?auto_149916 ?auto_149917 ) ) ( not ( = ?auto_149916 ?auto_149918 ) ) ( not ( = ?auto_149916 ?auto_149919 ) ) ( not ( = ?auto_149917 ?auto_149918 ) ) ( not ( = ?auto_149917 ?auto_149919 ) ) ( not ( = ?auto_149918 ?auto_149919 ) ) ( ON ?auto_149917 ?auto_149918 ) ( ON ?auto_149916 ?auto_149917 ) ( ON ?auto_149915 ?auto_149916 ) ( ON ?auto_149914 ?auto_149915 ) ( ON ?auto_149913 ?auto_149914 ) ( ON ?auto_149912 ?auto_149913 ) ( CLEAR ?auto_149910 ) ( ON ?auto_149911 ?auto_149912 ) ( CLEAR ?auto_149911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149908 ?auto_149909 ?auto_149910 ?auto_149911 )
      ( MAKE-11PILE ?auto_149908 ?auto_149909 ?auto_149910 ?auto_149911 ?auto_149912 ?auto_149913 ?auto_149914 ?auto_149915 ?auto_149916 ?auto_149917 ?auto_149918 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149931 - BLOCK
      ?auto_149932 - BLOCK
      ?auto_149933 - BLOCK
      ?auto_149934 - BLOCK
      ?auto_149935 - BLOCK
      ?auto_149936 - BLOCK
      ?auto_149937 - BLOCK
      ?auto_149938 - BLOCK
      ?auto_149939 - BLOCK
      ?auto_149940 - BLOCK
      ?auto_149941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149941 ) ( ON-TABLE ?auto_149931 ) ( ON ?auto_149932 ?auto_149931 ) ( ON ?auto_149933 ?auto_149932 ) ( not ( = ?auto_149931 ?auto_149932 ) ) ( not ( = ?auto_149931 ?auto_149933 ) ) ( not ( = ?auto_149931 ?auto_149934 ) ) ( not ( = ?auto_149931 ?auto_149935 ) ) ( not ( = ?auto_149931 ?auto_149936 ) ) ( not ( = ?auto_149931 ?auto_149937 ) ) ( not ( = ?auto_149931 ?auto_149938 ) ) ( not ( = ?auto_149931 ?auto_149939 ) ) ( not ( = ?auto_149931 ?auto_149940 ) ) ( not ( = ?auto_149931 ?auto_149941 ) ) ( not ( = ?auto_149932 ?auto_149933 ) ) ( not ( = ?auto_149932 ?auto_149934 ) ) ( not ( = ?auto_149932 ?auto_149935 ) ) ( not ( = ?auto_149932 ?auto_149936 ) ) ( not ( = ?auto_149932 ?auto_149937 ) ) ( not ( = ?auto_149932 ?auto_149938 ) ) ( not ( = ?auto_149932 ?auto_149939 ) ) ( not ( = ?auto_149932 ?auto_149940 ) ) ( not ( = ?auto_149932 ?auto_149941 ) ) ( not ( = ?auto_149933 ?auto_149934 ) ) ( not ( = ?auto_149933 ?auto_149935 ) ) ( not ( = ?auto_149933 ?auto_149936 ) ) ( not ( = ?auto_149933 ?auto_149937 ) ) ( not ( = ?auto_149933 ?auto_149938 ) ) ( not ( = ?auto_149933 ?auto_149939 ) ) ( not ( = ?auto_149933 ?auto_149940 ) ) ( not ( = ?auto_149933 ?auto_149941 ) ) ( not ( = ?auto_149934 ?auto_149935 ) ) ( not ( = ?auto_149934 ?auto_149936 ) ) ( not ( = ?auto_149934 ?auto_149937 ) ) ( not ( = ?auto_149934 ?auto_149938 ) ) ( not ( = ?auto_149934 ?auto_149939 ) ) ( not ( = ?auto_149934 ?auto_149940 ) ) ( not ( = ?auto_149934 ?auto_149941 ) ) ( not ( = ?auto_149935 ?auto_149936 ) ) ( not ( = ?auto_149935 ?auto_149937 ) ) ( not ( = ?auto_149935 ?auto_149938 ) ) ( not ( = ?auto_149935 ?auto_149939 ) ) ( not ( = ?auto_149935 ?auto_149940 ) ) ( not ( = ?auto_149935 ?auto_149941 ) ) ( not ( = ?auto_149936 ?auto_149937 ) ) ( not ( = ?auto_149936 ?auto_149938 ) ) ( not ( = ?auto_149936 ?auto_149939 ) ) ( not ( = ?auto_149936 ?auto_149940 ) ) ( not ( = ?auto_149936 ?auto_149941 ) ) ( not ( = ?auto_149937 ?auto_149938 ) ) ( not ( = ?auto_149937 ?auto_149939 ) ) ( not ( = ?auto_149937 ?auto_149940 ) ) ( not ( = ?auto_149937 ?auto_149941 ) ) ( not ( = ?auto_149938 ?auto_149939 ) ) ( not ( = ?auto_149938 ?auto_149940 ) ) ( not ( = ?auto_149938 ?auto_149941 ) ) ( not ( = ?auto_149939 ?auto_149940 ) ) ( not ( = ?auto_149939 ?auto_149941 ) ) ( not ( = ?auto_149940 ?auto_149941 ) ) ( ON ?auto_149940 ?auto_149941 ) ( ON ?auto_149939 ?auto_149940 ) ( ON ?auto_149938 ?auto_149939 ) ( ON ?auto_149937 ?auto_149938 ) ( ON ?auto_149936 ?auto_149937 ) ( ON ?auto_149935 ?auto_149936 ) ( CLEAR ?auto_149933 ) ( ON ?auto_149934 ?auto_149935 ) ( CLEAR ?auto_149934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_149931 ?auto_149932 ?auto_149933 ?auto_149934 )
      ( MAKE-11PILE ?auto_149931 ?auto_149932 ?auto_149933 ?auto_149934 ?auto_149935 ?auto_149936 ?auto_149937 ?auto_149938 ?auto_149939 ?auto_149940 ?auto_149941 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149953 - BLOCK
      ?auto_149954 - BLOCK
      ?auto_149955 - BLOCK
      ?auto_149956 - BLOCK
      ?auto_149957 - BLOCK
      ?auto_149958 - BLOCK
      ?auto_149959 - BLOCK
      ?auto_149960 - BLOCK
      ?auto_149961 - BLOCK
      ?auto_149962 - BLOCK
      ?auto_149963 - BLOCK
    )
    :vars
    (
      ?auto_149964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_149963 ?auto_149964 ) ( ON-TABLE ?auto_149953 ) ( ON ?auto_149954 ?auto_149953 ) ( not ( = ?auto_149953 ?auto_149954 ) ) ( not ( = ?auto_149953 ?auto_149955 ) ) ( not ( = ?auto_149953 ?auto_149956 ) ) ( not ( = ?auto_149953 ?auto_149957 ) ) ( not ( = ?auto_149953 ?auto_149958 ) ) ( not ( = ?auto_149953 ?auto_149959 ) ) ( not ( = ?auto_149953 ?auto_149960 ) ) ( not ( = ?auto_149953 ?auto_149961 ) ) ( not ( = ?auto_149953 ?auto_149962 ) ) ( not ( = ?auto_149953 ?auto_149963 ) ) ( not ( = ?auto_149953 ?auto_149964 ) ) ( not ( = ?auto_149954 ?auto_149955 ) ) ( not ( = ?auto_149954 ?auto_149956 ) ) ( not ( = ?auto_149954 ?auto_149957 ) ) ( not ( = ?auto_149954 ?auto_149958 ) ) ( not ( = ?auto_149954 ?auto_149959 ) ) ( not ( = ?auto_149954 ?auto_149960 ) ) ( not ( = ?auto_149954 ?auto_149961 ) ) ( not ( = ?auto_149954 ?auto_149962 ) ) ( not ( = ?auto_149954 ?auto_149963 ) ) ( not ( = ?auto_149954 ?auto_149964 ) ) ( not ( = ?auto_149955 ?auto_149956 ) ) ( not ( = ?auto_149955 ?auto_149957 ) ) ( not ( = ?auto_149955 ?auto_149958 ) ) ( not ( = ?auto_149955 ?auto_149959 ) ) ( not ( = ?auto_149955 ?auto_149960 ) ) ( not ( = ?auto_149955 ?auto_149961 ) ) ( not ( = ?auto_149955 ?auto_149962 ) ) ( not ( = ?auto_149955 ?auto_149963 ) ) ( not ( = ?auto_149955 ?auto_149964 ) ) ( not ( = ?auto_149956 ?auto_149957 ) ) ( not ( = ?auto_149956 ?auto_149958 ) ) ( not ( = ?auto_149956 ?auto_149959 ) ) ( not ( = ?auto_149956 ?auto_149960 ) ) ( not ( = ?auto_149956 ?auto_149961 ) ) ( not ( = ?auto_149956 ?auto_149962 ) ) ( not ( = ?auto_149956 ?auto_149963 ) ) ( not ( = ?auto_149956 ?auto_149964 ) ) ( not ( = ?auto_149957 ?auto_149958 ) ) ( not ( = ?auto_149957 ?auto_149959 ) ) ( not ( = ?auto_149957 ?auto_149960 ) ) ( not ( = ?auto_149957 ?auto_149961 ) ) ( not ( = ?auto_149957 ?auto_149962 ) ) ( not ( = ?auto_149957 ?auto_149963 ) ) ( not ( = ?auto_149957 ?auto_149964 ) ) ( not ( = ?auto_149958 ?auto_149959 ) ) ( not ( = ?auto_149958 ?auto_149960 ) ) ( not ( = ?auto_149958 ?auto_149961 ) ) ( not ( = ?auto_149958 ?auto_149962 ) ) ( not ( = ?auto_149958 ?auto_149963 ) ) ( not ( = ?auto_149958 ?auto_149964 ) ) ( not ( = ?auto_149959 ?auto_149960 ) ) ( not ( = ?auto_149959 ?auto_149961 ) ) ( not ( = ?auto_149959 ?auto_149962 ) ) ( not ( = ?auto_149959 ?auto_149963 ) ) ( not ( = ?auto_149959 ?auto_149964 ) ) ( not ( = ?auto_149960 ?auto_149961 ) ) ( not ( = ?auto_149960 ?auto_149962 ) ) ( not ( = ?auto_149960 ?auto_149963 ) ) ( not ( = ?auto_149960 ?auto_149964 ) ) ( not ( = ?auto_149961 ?auto_149962 ) ) ( not ( = ?auto_149961 ?auto_149963 ) ) ( not ( = ?auto_149961 ?auto_149964 ) ) ( not ( = ?auto_149962 ?auto_149963 ) ) ( not ( = ?auto_149962 ?auto_149964 ) ) ( not ( = ?auto_149963 ?auto_149964 ) ) ( ON ?auto_149962 ?auto_149963 ) ( ON ?auto_149961 ?auto_149962 ) ( ON ?auto_149960 ?auto_149961 ) ( ON ?auto_149959 ?auto_149960 ) ( ON ?auto_149958 ?auto_149959 ) ( ON ?auto_149957 ?auto_149958 ) ( ON ?auto_149956 ?auto_149957 ) ( CLEAR ?auto_149954 ) ( ON ?auto_149955 ?auto_149956 ) ( CLEAR ?auto_149955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149953 ?auto_149954 ?auto_149955 )
      ( MAKE-11PILE ?auto_149953 ?auto_149954 ?auto_149955 ?auto_149956 ?auto_149957 ?auto_149958 ?auto_149959 ?auto_149960 ?auto_149961 ?auto_149962 ?auto_149963 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149976 - BLOCK
      ?auto_149977 - BLOCK
      ?auto_149978 - BLOCK
      ?auto_149979 - BLOCK
      ?auto_149980 - BLOCK
      ?auto_149981 - BLOCK
      ?auto_149982 - BLOCK
      ?auto_149983 - BLOCK
      ?auto_149984 - BLOCK
      ?auto_149985 - BLOCK
      ?auto_149986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_149986 ) ( ON-TABLE ?auto_149976 ) ( ON ?auto_149977 ?auto_149976 ) ( not ( = ?auto_149976 ?auto_149977 ) ) ( not ( = ?auto_149976 ?auto_149978 ) ) ( not ( = ?auto_149976 ?auto_149979 ) ) ( not ( = ?auto_149976 ?auto_149980 ) ) ( not ( = ?auto_149976 ?auto_149981 ) ) ( not ( = ?auto_149976 ?auto_149982 ) ) ( not ( = ?auto_149976 ?auto_149983 ) ) ( not ( = ?auto_149976 ?auto_149984 ) ) ( not ( = ?auto_149976 ?auto_149985 ) ) ( not ( = ?auto_149976 ?auto_149986 ) ) ( not ( = ?auto_149977 ?auto_149978 ) ) ( not ( = ?auto_149977 ?auto_149979 ) ) ( not ( = ?auto_149977 ?auto_149980 ) ) ( not ( = ?auto_149977 ?auto_149981 ) ) ( not ( = ?auto_149977 ?auto_149982 ) ) ( not ( = ?auto_149977 ?auto_149983 ) ) ( not ( = ?auto_149977 ?auto_149984 ) ) ( not ( = ?auto_149977 ?auto_149985 ) ) ( not ( = ?auto_149977 ?auto_149986 ) ) ( not ( = ?auto_149978 ?auto_149979 ) ) ( not ( = ?auto_149978 ?auto_149980 ) ) ( not ( = ?auto_149978 ?auto_149981 ) ) ( not ( = ?auto_149978 ?auto_149982 ) ) ( not ( = ?auto_149978 ?auto_149983 ) ) ( not ( = ?auto_149978 ?auto_149984 ) ) ( not ( = ?auto_149978 ?auto_149985 ) ) ( not ( = ?auto_149978 ?auto_149986 ) ) ( not ( = ?auto_149979 ?auto_149980 ) ) ( not ( = ?auto_149979 ?auto_149981 ) ) ( not ( = ?auto_149979 ?auto_149982 ) ) ( not ( = ?auto_149979 ?auto_149983 ) ) ( not ( = ?auto_149979 ?auto_149984 ) ) ( not ( = ?auto_149979 ?auto_149985 ) ) ( not ( = ?auto_149979 ?auto_149986 ) ) ( not ( = ?auto_149980 ?auto_149981 ) ) ( not ( = ?auto_149980 ?auto_149982 ) ) ( not ( = ?auto_149980 ?auto_149983 ) ) ( not ( = ?auto_149980 ?auto_149984 ) ) ( not ( = ?auto_149980 ?auto_149985 ) ) ( not ( = ?auto_149980 ?auto_149986 ) ) ( not ( = ?auto_149981 ?auto_149982 ) ) ( not ( = ?auto_149981 ?auto_149983 ) ) ( not ( = ?auto_149981 ?auto_149984 ) ) ( not ( = ?auto_149981 ?auto_149985 ) ) ( not ( = ?auto_149981 ?auto_149986 ) ) ( not ( = ?auto_149982 ?auto_149983 ) ) ( not ( = ?auto_149982 ?auto_149984 ) ) ( not ( = ?auto_149982 ?auto_149985 ) ) ( not ( = ?auto_149982 ?auto_149986 ) ) ( not ( = ?auto_149983 ?auto_149984 ) ) ( not ( = ?auto_149983 ?auto_149985 ) ) ( not ( = ?auto_149983 ?auto_149986 ) ) ( not ( = ?auto_149984 ?auto_149985 ) ) ( not ( = ?auto_149984 ?auto_149986 ) ) ( not ( = ?auto_149985 ?auto_149986 ) ) ( ON ?auto_149985 ?auto_149986 ) ( ON ?auto_149984 ?auto_149985 ) ( ON ?auto_149983 ?auto_149984 ) ( ON ?auto_149982 ?auto_149983 ) ( ON ?auto_149981 ?auto_149982 ) ( ON ?auto_149980 ?auto_149981 ) ( ON ?auto_149979 ?auto_149980 ) ( CLEAR ?auto_149977 ) ( ON ?auto_149978 ?auto_149979 ) ( CLEAR ?auto_149978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_149976 ?auto_149977 ?auto_149978 )
      ( MAKE-11PILE ?auto_149976 ?auto_149977 ?auto_149978 ?auto_149979 ?auto_149980 ?auto_149981 ?auto_149982 ?auto_149983 ?auto_149984 ?auto_149985 ?auto_149986 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_149998 - BLOCK
      ?auto_149999 - BLOCK
      ?auto_150000 - BLOCK
      ?auto_150001 - BLOCK
      ?auto_150002 - BLOCK
      ?auto_150003 - BLOCK
      ?auto_150004 - BLOCK
      ?auto_150005 - BLOCK
      ?auto_150006 - BLOCK
      ?auto_150007 - BLOCK
      ?auto_150008 - BLOCK
    )
    :vars
    (
      ?auto_150009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150008 ?auto_150009 ) ( ON-TABLE ?auto_149998 ) ( not ( = ?auto_149998 ?auto_149999 ) ) ( not ( = ?auto_149998 ?auto_150000 ) ) ( not ( = ?auto_149998 ?auto_150001 ) ) ( not ( = ?auto_149998 ?auto_150002 ) ) ( not ( = ?auto_149998 ?auto_150003 ) ) ( not ( = ?auto_149998 ?auto_150004 ) ) ( not ( = ?auto_149998 ?auto_150005 ) ) ( not ( = ?auto_149998 ?auto_150006 ) ) ( not ( = ?auto_149998 ?auto_150007 ) ) ( not ( = ?auto_149998 ?auto_150008 ) ) ( not ( = ?auto_149998 ?auto_150009 ) ) ( not ( = ?auto_149999 ?auto_150000 ) ) ( not ( = ?auto_149999 ?auto_150001 ) ) ( not ( = ?auto_149999 ?auto_150002 ) ) ( not ( = ?auto_149999 ?auto_150003 ) ) ( not ( = ?auto_149999 ?auto_150004 ) ) ( not ( = ?auto_149999 ?auto_150005 ) ) ( not ( = ?auto_149999 ?auto_150006 ) ) ( not ( = ?auto_149999 ?auto_150007 ) ) ( not ( = ?auto_149999 ?auto_150008 ) ) ( not ( = ?auto_149999 ?auto_150009 ) ) ( not ( = ?auto_150000 ?auto_150001 ) ) ( not ( = ?auto_150000 ?auto_150002 ) ) ( not ( = ?auto_150000 ?auto_150003 ) ) ( not ( = ?auto_150000 ?auto_150004 ) ) ( not ( = ?auto_150000 ?auto_150005 ) ) ( not ( = ?auto_150000 ?auto_150006 ) ) ( not ( = ?auto_150000 ?auto_150007 ) ) ( not ( = ?auto_150000 ?auto_150008 ) ) ( not ( = ?auto_150000 ?auto_150009 ) ) ( not ( = ?auto_150001 ?auto_150002 ) ) ( not ( = ?auto_150001 ?auto_150003 ) ) ( not ( = ?auto_150001 ?auto_150004 ) ) ( not ( = ?auto_150001 ?auto_150005 ) ) ( not ( = ?auto_150001 ?auto_150006 ) ) ( not ( = ?auto_150001 ?auto_150007 ) ) ( not ( = ?auto_150001 ?auto_150008 ) ) ( not ( = ?auto_150001 ?auto_150009 ) ) ( not ( = ?auto_150002 ?auto_150003 ) ) ( not ( = ?auto_150002 ?auto_150004 ) ) ( not ( = ?auto_150002 ?auto_150005 ) ) ( not ( = ?auto_150002 ?auto_150006 ) ) ( not ( = ?auto_150002 ?auto_150007 ) ) ( not ( = ?auto_150002 ?auto_150008 ) ) ( not ( = ?auto_150002 ?auto_150009 ) ) ( not ( = ?auto_150003 ?auto_150004 ) ) ( not ( = ?auto_150003 ?auto_150005 ) ) ( not ( = ?auto_150003 ?auto_150006 ) ) ( not ( = ?auto_150003 ?auto_150007 ) ) ( not ( = ?auto_150003 ?auto_150008 ) ) ( not ( = ?auto_150003 ?auto_150009 ) ) ( not ( = ?auto_150004 ?auto_150005 ) ) ( not ( = ?auto_150004 ?auto_150006 ) ) ( not ( = ?auto_150004 ?auto_150007 ) ) ( not ( = ?auto_150004 ?auto_150008 ) ) ( not ( = ?auto_150004 ?auto_150009 ) ) ( not ( = ?auto_150005 ?auto_150006 ) ) ( not ( = ?auto_150005 ?auto_150007 ) ) ( not ( = ?auto_150005 ?auto_150008 ) ) ( not ( = ?auto_150005 ?auto_150009 ) ) ( not ( = ?auto_150006 ?auto_150007 ) ) ( not ( = ?auto_150006 ?auto_150008 ) ) ( not ( = ?auto_150006 ?auto_150009 ) ) ( not ( = ?auto_150007 ?auto_150008 ) ) ( not ( = ?auto_150007 ?auto_150009 ) ) ( not ( = ?auto_150008 ?auto_150009 ) ) ( ON ?auto_150007 ?auto_150008 ) ( ON ?auto_150006 ?auto_150007 ) ( ON ?auto_150005 ?auto_150006 ) ( ON ?auto_150004 ?auto_150005 ) ( ON ?auto_150003 ?auto_150004 ) ( ON ?auto_150002 ?auto_150003 ) ( ON ?auto_150001 ?auto_150002 ) ( ON ?auto_150000 ?auto_150001 ) ( CLEAR ?auto_149998 ) ( ON ?auto_149999 ?auto_150000 ) ( CLEAR ?auto_149999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_149998 ?auto_149999 )
      ( MAKE-11PILE ?auto_149998 ?auto_149999 ?auto_150000 ?auto_150001 ?auto_150002 ?auto_150003 ?auto_150004 ?auto_150005 ?auto_150006 ?auto_150007 ?auto_150008 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_150021 - BLOCK
      ?auto_150022 - BLOCK
      ?auto_150023 - BLOCK
      ?auto_150024 - BLOCK
      ?auto_150025 - BLOCK
      ?auto_150026 - BLOCK
      ?auto_150027 - BLOCK
      ?auto_150028 - BLOCK
      ?auto_150029 - BLOCK
      ?auto_150030 - BLOCK
      ?auto_150031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150031 ) ( ON-TABLE ?auto_150021 ) ( not ( = ?auto_150021 ?auto_150022 ) ) ( not ( = ?auto_150021 ?auto_150023 ) ) ( not ( = ?auto_150021 ?auto_150024 ) ) ( not ( = ?auto_150021 ?auto_150025 ) ) ( not ( = ?auto_150021 ?auto_150026 ) ) ( not ( = ?auto_150021 ?auto_150027 ) ) ( not ( = ?auto_150021 ?auto_150028 ) ) ( not ( = ?auto_150021 ?auto_150029 ) ) ( not ( = ?auto_150021 ?auto_150030 ) ) ( not ( = ?auto_150021 ?auto_150031 ) ) ( not ( = ?auto_150022 ?auto_150023 ) ) ( not ( = ?auto_150022 ?auto_150024 ) ) ( not ( = ?auto_150022 ?auto_150025 ) ) ( not ( = ?auto_150022 ?auto_150026 ) ) ( not ( = ?auto_150022 ?auto_150027 ) ) ( not ( = ?auto_150022 ?auto_150028 ) ) ( not ( = ?auto_150022 ?auto_150029 ) ) ( not ( = ?auto_150022 ?auto_150030 ) ) ( not ( = ?auto_150022 ?auto_150031 ) ) ( not ( = ?auto_150023 ?auto_150024 ) ) ( not ( = ?auto_150023 ?auto_150025 ) ) ( not ( = ?auto_150023 ?auto_150026 ) ) ( not ( = ?auto_150023 ?auto_150027 ) ) ( not ( = ?auto_150023 ?auto_150028 ) ) ( not ( = ?auto_150023 ?auto_150029 ) ) ( not ( = ?auto_150023 ?auto_150030 ) ) ( not ( = ?auto_150023 ?auto_150031 ) ) ( not ( = ?auto_150024 ?auto_150025 ) ) ( not ( = ?auto_150024 ?auto_150026 ) ) ( not ( = ?auto_150024 ?auto_150027 ) ) ( not ( = ?auto_150024 ?auto_150028 ) ) ( not ( = ?auto_150024 ?auto_150029 ) ) ( not ( = ?auto_150024 ?auto_150030 ) ) ( not ( = ?auto_150024 ?auto_150031 ) ) ( not ( = ?auto_150025 ?auto_150026 ) ) ( not ( = ?auto_150025 ?auto_150027 ) ) ( not ( = ?auto_150025 ?auto_150028 ) ) ( not ( = ?auto_150025 ?auto_150029 ) ) ( not ( = ?auto_150025 ?auto_150030 ) ) ( not ( = ?auto_150025 ?auto_150031 ) ) ( not ( = ?auto_150026 ?auto_150027 ) ) ( not ( = ?auto_150026 ?auto_150028 ) ) ( not ( = ?auto_150026 ?auto_150029 ) ) ( not ( = ?auto_150026 ?auto_150030 ) ) ( not ( = ?auto_150026 ?auto_150031 ) ) ( not ( = ?auto_150027 ?auto_150028 ) ) ( not ( = ?auto_150027 ?auto_150029 ) ) ( not ( = ?auto_150027 ?auto_150030 ) ) ( not ( = ?auto_150027 ?auto_150031 ) ) ( not ( = ?auto_150028 ?auto_150029 ) ) ( not ( = ?auto_150028 ?auto_150030 ) ) ( not ( = ?auto_150028 ?auto_150031 ) ) ( not ( = ?auto_150029 ?auto_150030 ) ) ( not ( = ?auto_150029 ?auto_150031 ) ) ( not ( = ?auto_150030 ?auto_150031 ) ) ( ON ?auto_150030 ?auto_150031 ) ( ON ?auto_150029 ?auto_150030 ) ( ON ?auto_150028 ?auto_150029 ) ( ON ?auto_150027 ?auto_150028 ) ( ON ?auto_150026 ?auto_150027 ) ( ON ?auto_150025 ?auto_150026 ) ( ON ?auto_150024 ?auto_150025 ) ( ON ?auto_150023 ?auto_150024 ) ( CLEAR ?auto_150021 ) ( ON ?auto_150022 ?auto_150023 ) ( CLEAR ?auto_150022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_150021 ?auto_150022 )
      ( MAKE-11PILE ?auto_150021 ?auto_150022 ?auto_150023 ?auto_150024 ?auto_150025 ?auto_150026 ?auto_150027 ?auto_150028 ?auto_150029 ?auto_150030 ?auto_150031 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_150043 - BLOCK
      ?auto_150044 - BLOCK
      ?auto_150045 - BLOCK
      ?auto_150046 - BLOCK
      ?auto_150047 - BLOCK
      ?auto_150048 - BLOCK
      ?auto_150049 - BLOCK
      ?auto_150050 - BLOCK
      ?auto_150051 - BLOCK
      ?auto_150052 - BLOCK
      ?auto_150053 - BLOCK
    )
    :vars
    (
      ?auto_150054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_150053 ?auto_150054 ) ( not ( = ?auto_150043 ?auto_150044 ) ) ( not ( = ?auto_150043 ?auto_150045 ) ) ( not ( = ?auto_150043 ?auto_150046 ) ) ( not ( = ?auto_150043 ?auto_150047 ) ) ( not ( = ?auto_150043 ?auto_150048 ) ) ( not ( = ?auto_150043 ?auto_150049 ) ) ( not ( = ?auto_150043 ?auto_150050 ) ) ( not ( = ?auto_150043 ?auto_150051 ) ) ( not ( = ?auto_150043 ?auto_150052 ) ) ( not ( = ?auto_150043 ?auto_150053 ) ) ( not ( = ?auto_150043 ?auto_150054 ) ) ( not ( = ?auto_150044 ?auto_150045 ) ) ( not ( = ?auto_150044 ?auto_150046 ) ) ( not ( = ?auto_150044 ?auto_150047 ) ) ( not ( = ?auto_150044 ?auto_150048 ) ) ( not ( = ?auto_150044 ?auto_150049 ) ) ( not ( = ?auto_150044 ?auto_150050 ) ) ( not ( = ?auto_150044 ?auto_150051 ) ) ( not ( = ?auto_150044 ?auto_150052 ) ) ( not ( = ?auto_150044 ?auto_150053 ) ) ( not ( = ?auto_150044 ?auto_150054 ) ) ( not ( = ?auto_150045 ?auto_150046 ) ) ( not ( = ?auto_150045 ?auto_150047 ) ) ( not ( = ?auto_150045 ?auto_150048 ) ) ( not ( = ?auto_150045 ?auto_150049 ) ) ( not ( = ?auto_150045 ?auto_150050 ) ) ( not ( = ?auto_150045 ?auto_150051 ) ) ( not ( = ?auto_150045 ?auto_150052 ) ) ( not ( = ?auto_150045 ?auto_150053 ) ) ( not ( = ?auto_150045 ?auto_150054 ) ) ( not ( = ?auto_150046 ?auto_150047 ) ) ( not ( = ?auto_150046 ?auto_150048 ) ) ( not ( = ?auto_150046 ?auto_150049 ) ) ( not ( = ?auto_150046 ?auto_150050 ) ) ( not ( = ?auto_150046 ?auto_150051 ) ) ( not ( = ?auto_150046 ?auto_150052 ) ) ( not ( = ?auto_150046 ?auto_150053 ) ) ( not ( = ?auto_150046 ?auto_150054 ) ) ( not ( = ?auto_150047 ?auto_150048 ) ) ( not ( = ?auto_150047 ?auto_150049 ) ) ( not ( = ?auto_150047 ?auto_150050 ) ) ( not ( = ?auto_150047 ?auto_150051 ) ) ( not ( = ?auto_150047 ?auto_150052 ) ) ( not ( = ?auto_150047 ?auto_150053 ) ) ( not ( = ?auto_150047 ?auto_150054 ) ) ( not ( = ?auto_150048 ?auto_150049 ) ) ( not ( = ?auto_150048 ?auto_150050 ) ) ( not ( = ?auto_150048 ?auto_150051 ) ) ( not ( = ?auto_150048 ?auto_150052 ) ) ( not ( = ?auto_150048 ?auto_150053 ) ) ( not ( = ?auto_150048 ?auto_150054 ) ) ( not ( = ?auto_150049 ?auto_150050 ) ) ( not ( = ?auto_150049 ?auto_150051 ) ) ( not ( = ?auto_150049 ?auto_150052 ) ) ( not ( = ?auto_150049 ?auto_150053 ) ) ( not ( = ?auto_150049 ?auto_150054 ) ) ( not ( = ?auto_150050 ?auto_150051 ) ) ( not ( = ?auto_150050 ?auto_150052 ) ) ( not ( = ?auto_150050 ?auto_150053 ) ) ( not ( = ?auto_150050 ?auto_150054 ) ) ( not ( = ?auto_150051 ?auto_150052 ) ) ( not ( = ?auto_150051 ?auto_150053 ) ) ( not ( = ?auto_150051 ?auto_150054 ) ) ( not ( = ?auto_150052 ?auto_150053 ) ) ( not ( = ?auto_150052 ?auto_150054 ) ) ( not ( = ?auto_150053 ?auto_150054 ) ) ( ON ?auto_150052 ?auto_150053 ) ( ON ?auto_150051 ?auto_150052 ) ( ON ?auto_150050 ?auto_150051 ) ( ON ?auto_150049 ?auto_150050 ) ( ON ?auto_150048 ?auto_150049 ) ( ON ?auto_150047 ?auto_150048 ) ( ON ?auto_150046 ?auto_150047 ) ( ON ?auto_150045 ?auto_150046 ) ( ON ?auto_150044 ?auto_150045 ) ( ON ?auto_150043 ?auto_150044 ) ( CLEAR ?auto_150043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150043 )
      ( MAKE-11PILE ?auto_150043 ?auto_150044 ?auto_150045 ?auto_150046 ?auto_150047 ?auto_150048 ?auto_150049 ?auto_150050 ?auto_150051 ?auto_150052 ?auto_150053 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_150066 - BLOCK
      ?auto_150067 - BLOCK
      ?auto_150068 - BLOCK
      ?auto_150069 - BLOCK
      ?auto_150070 - BLOCK
      ?auto_150071 - BLOCK
      ?auto_150072 - BLOCK
      ?auto_150073 - BLOCK
      ?auto_150074 - BLOCK
      ?auto_150075 - BLOCK
      ?auto_150076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_150076 ) ( not ( = ?auto_150066 ?auto_150067 ) ) ( not ( = ?auto_150066 ?auto_150068 ) ) ( not ( = ?auto_150066 ?auto_150069 ) ) ( not ( = ?auto_150066 ?auto_150070 ) ) ( not ( = ?auto_150066 ?auto_150071 ) ) ( not ( = ?auto_150066 ?auto_150072 ) ) ( not ( = ?auto_150066 ?auto_150073 ) ) ( not ( = ?auto_150066 ?auto_150074 ) ) ( not ( = ?auto_150066 ?auto_150075 ) ) ( not ( = ?auto_150066 ?auto_150076 ) ) ( not ( = ?auto_150067 ?auto_150068 ) ) ( not ( = ?auto_150067 ?auto_150069 ) ) ( not ( = ?auto_150067 ?auto_150070 ) ) ( not ( = ?auto_150067 ?auto_150071 ) ) ( not ( = ?auto_150067 ?auto_150072 ) ) ( not ( = ?auto_150067 ?auto_150073 ) ) ( not ( = ?auto_150067 ?auto_150074 ) ) ( not ( = ?auto_150067 ?auto_150075 ) ) ( not ( = ?auto_150067 ?auto_150076 ) ) ( not ( = ?auto_150068 ?auto_150069 ) ) ( not ( = ?auto_150068 ?auto_150070 ) ) ( not ( = ?auto_150068 ?auto_150071 ) ) ( not ( = ?auto_150068 ?auto_150072 ) ) ( not ( = ?auto_150068 ?auto_150073 ) ) ( not ( = ?auto_150068 ?auto_150074 ) ) ( not ( = ?auto_150068 ?auto_150075 ) ) ( not ( = ?auto_150068 ?auto_150076 ) ) ( not ( = ?auto_150069 ?auto_150070 ) ) ( not ( = ?auto_150069 ?auto_150071 ) ) ( not ( = ?auto_150069 ?auto_150072 ) ) ( not ( = ?auto_150069 ?auto_150073 ) ) ( not ( = ?auto_150069 ?auto_150074 ) ) ( not ( = ?auto_150069 ?auto_150075 ) ) ( not ( = ?auto_150069 ?auto_150076 ) ) ( not ( = ?auto_150070 ?auto_150071 ) ) ( not ( = ?auto_150070 ?auto_150072 ) ) ( not ( = ?auto_150070 ?auto_150073 ) ) ( not ( = ?auto_150070 ?auto_150074 ) ) ( not ( = ?auto_150070 ?auto_150075 ) ) ( not ( = ?auto_150070 ?auto_150076 ) ) ( not ( = ?auto_150071 ?auto_150072 ) ) ( not ( = ?auto_150071 ?auto_150073 ) ) ( not ( = ?auto_150071 ?auto_150074 ) ) ( not ( = ?auto_150071 ?auto_150075 ) ) ( not ( = ?auto_150071 ?auto_150076 ) ) ( not ( = ?auto_150072 ?auto_150073 ) ) ( not ( = ?auto_150072 ?auto_150074 ) ) ( not ( = ?auto_150072 ?auto_150075 ) ) ( not ( = ?auto_150072 ?auto_150076 ) ) ( not ( = ?auto_150073 ?auto_150074 ) ) ( not ( = ?auto_150073 ?auto_150075 ) ) ( not ( = ?auto_150073 ?auto_150076 ) ) ( not ( = ?auto_150074 ?auto_150075 ) ) ( not ( = ?auto_150074 ?auto_150076 ) ) ( not ( = ?auto_150075 ?auto_150076 ) ) ( ON ?auto_150075 ?auto_150076 ) ( ON ?auto_150074 ?auto_150075 ) ( ON ?auto_150073 ?auto_150074 ) ( ON ?auto_150072 ?auto_150073 ) ( ON ?auto_150071 ?auto_150072 ) ( ON ?auto_150070 ?auto_150071 ) ( ON ?auto_150069 ?auto_150070 ) ( ON ?auto_150068 ?auto_150069 ) ( ON ?auto_150067 ?auto_150068 ) ( ON ?auto_150066 ?auto_150067 ) ( CLEAR ?auto_150066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_150066 )
      ( MAKE-11PILE ?auto_150066 ?auto_150067 ?auto_150068 ?auto_150069 ?auto_150070 ?auto_150071 ?auto_150072 ?auto_150073 ?auto_150074 ?auto_150075 ?auto_150076 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_150088 - BLOCK
      ?auto_150089 - BLOCK
      ?auto_150090 - BLOCK
      ?auto_150091 - BLOCK
      ?auto_150092 - BLOCK
      ?auto_150093 - BLOCK
      ?auto_150094 - BLOCK
      ?auto_150095 - BLOCK
      ?auto_150096 - BLOCK
      ?auto_150097 - BLOCK
      ?auto_150098 - BLOCK
    )
    :vars
    (
      ?auto_150099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_150088 ?auto_150089 ) ) ( not ( = ?auto_150088 ?auto_150090 ) ) ( not ( = ?auto_150088 ?auto_150091 ) ) ( not ( = ?auto_150088 ?auto_150092 ) ) ( not ( = ?auto_150088 ?auto_150093 ) ) ( not ( = ?auto_150088 ?auto_150094 ) ) ( not ( = ?auto_150088 ?auto_150095 ) ) ( not ( = ?auto_150088 ?auto_150096 ) ) ( not ( = ?auto_150088 ?auto_150097 ) ) ( not ( = ?auto_150088 ?auto_150098 ) ) ( not ( = ?auto_150089 ?auto_150090 ) ) ( not ( = ?auto_150089 ?auto_150091 ) ) ( not ( = ?auto_150089 ?auto_150092 ) ) ( not ( = ?auto_150089 ?auto_150093 ) ) ( not ( = ?auto_150089 ?auto_150094 ) ) ( not ( = ?auto_150089 ?auto_150095 ) ) ( not ( = ?auto_150089 ?auto_150096 ) ) ( not ( = ?auto_150089 ?auto_150097 ) ) ( not ( = ?auto_150089 ?auto_150098 ) ) ( not ( = ?auto_150090 ?auto_150091 ) ) ( not ( = ?auto_150090 ?auto_150092 ) ) ( not ( = ?auto_150090 ?auto_150093 ) ) ( not ( = ?auto_150090 ?auto_150094 ) ) ( not ( = ?auto_150090 ?auto_150095 ) ) ( not ( = ?auto_150090 ?auto_150096 ) ) ( not ( = ?auto_150090 ?auto_150097 ) ) ( not ( = ?auto_150090 ?auto_150098 ) ) ( not ( = ?auto_150091 ?auto_150092 ) ) ( not ( = ?auto_150091 ?auto_150093 ) ) ( not ( = ?auto_150091 ?auto_150094 ) ) ( not ( = ?auto_150091 ?auto_150095 ) ) ( not ( = ?auto_150091 ?auto_150096 ) ) ( not ( = ?auto_150091 ?auto_150097 ) ) ( not ( = ?auto_150091 ?auto_150098 ) ) ( not ( = ?auto_150092 ?auto_150093 ) ) ( not ( = ?auto_150092 ?auto_150094 ) ) ( not ( = ?auto_150092 ?auto_150095 ) ) ( not ( = ?auto_150092 ?auto_150096 ) ) ( not ( = ?auto_150092 ?auto_150097 ) ) ( not ( = ?auto_150092 ?auto_150098 ) ) ( not ( = ?auto_150093 ?auto_150094 ) ) ( not ( = ?auto_150093 ?auto_150095 ) ) ( not ( = ?auto_150093 ?auto_150096 ) ) ( not ( = ?auto_150093 ?auto_150097 ) ) ( not ( = ?auto_150093 ?auto_150098 ) ) ( not ( = ?auto_150094 ?auto_150095 ) ) ( not ( = ?auto_150094 ?auto_150096 ) ) ( not ( = ?auto_150094 ?auto_150097 ) ) ( not ( = ?auto_150094 ?auto_150098 ) ) ( not ( = ?auto_150095 ?auto_150096 ) ) ( not ( = ?auto_150095 ?auto_150097 ) ) ( not ( = ?auto_150095 ?auto_150098 ) ) ( not ( = ?auto_150096 ?auto_150097 ) ) ( not ( = ?auto_150096 ?auto_150098 ) ) ( not ( = ?auto_150097 ?auto_150098 ) ) ( ON ?auto_150088 ?auto_150099 ) ( not ( = ?auto_150098 ?auto_150099 ) ) ( not ( = ?auto_150097 ?auto_150099 ) ) ( not ( = ?auto_150096 ?auto_150099 ) ) ( not ( = ?auto_150095 ?auto_150099 ) ) ( not ( = ?auto_150094 ?auto_150099 ) ) ( not ( = ?auto_150093 ?auto_150099 ) ) ( not ( = ?auto_150092 ?auto_150099 ) ) ( not ( = ?auto_150091 ?auto_150099 ) ) ( not ( = ?auto_150090 ?auto_150099 ) ) ( not ( = ?auto_150089 ?auto_150099 ) ) ( not ( = ?auto_150088 ?auto_150099 ) ) ( ON ?auto_150089 ?auto_150088 ) ( ON ?auto_150090 ?auto_150089 ) ( ON ?auto_150091 ?auto_150090 ) ( ON ?auto_150092 ?auto_150091 ) ( ON ?auto_150093 ?auto_150092 ) ( ON ?auto_150094 ?auto_150093 ) ( ON ?auto_150095 ?auto_150094 ) ( ON ?auto_150096 ?auto_150095 ) ( ON ?auto_150097 ?auto_150096 ) ( ON ?auto_150098 ?auto_150097 ) ( CLEAR ?auto_150098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_150098 ?auto_150097 ?auto_150096 ?auto_150095 ?auto_150094 ?auto_150093 ?auto_150092 ?auto_150091 ?auto_150090 ?auto_150089 ?auto_150088 )
      ( MAKE-11PILE ?auto_150088 ?auto_150089 ?auto_150090 ?auto_150091 ?auto_150092 ?auto_150093 ?auto_150094 ?auto_150095 ?auto_150096 ?auto_150097 ?auto_150098 ) )
  )

)

