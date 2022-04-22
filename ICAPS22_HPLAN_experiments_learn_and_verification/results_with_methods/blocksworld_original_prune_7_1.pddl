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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_68969 - BLOCK
      ?auto_68970 - BLOCK
      ?auto_68971 - BLOCK
      ?auto_68972 - BLOCK
      ?auto_68973 - BLOCK
      ?auto_68974 - BLOCK
      ?auto_68975 - BLOCK
    )
    :vars
    (
      ?auto_68976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68976 ?auto_68975 ) ( CLEAR ?auto_68976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68969 ) ( ON ?auto_68970 ?auto_68969 ) ( ON ?auto_68971 ?auto_68970 ) ( ON ?auto_68972 ?auto_68971 ) ( ON ?auto_68973 ?auto_68972 ) ( ON ?auto_68974 ?auto_68973 ) ( ON ?auto_68975 ?auto_68974 ) ( not ( = ?auto_68969 ?auto_68970 ) ) ( not ( = ?auto_68969 ?auto_68971 ) ) ( not ( = ?auto_68969 ?auto_68972 ) ) ( not ( = ?auto_68969 ?auto_68973 ) ) ( not ( = ?auto_68969 ?auto_68974 ) ) ( not ( = ?auto_68969 ?auto_68975 ) ) ( not ( = ?auto_68969 ?auto_68976 ) ) ( not ( = ?auto_68970 ?auto_68971 ) ) ( not ( = ?auto_68970 ?auto_68972 ) ) ( not ( = ?auto_68970 ?auto_68973 ) ) ( not ( = ?auto_68970 ?auto_68974 ) ) ( not ( = ?auto_68970 ?auto_68975 ) ) ( not ( = ?auto_68970 ?auto_68976 ) ) ( not ( = ?auto_68971 ?auto_68972 ) ) ( not ( = ?auto_68971 ?auto_68973 ) ) ( not ( = ?auto_68971 ?auto_68974 ) ) ( not ( = ?auto_68971 ?auto_68975 ) ) ( not ( = ?auto_68971 ?auto_68976 ) ) ( not ( = ?auto_68972 ?auto_68973 ) ) ( not ( = ?auto_68972 ?auto_68974 ) ) ( not ( = ?auto_68972 ?auto_68975 ) ) ( not ( = ?auto_68972 ?auto_68976 ) ) ( not ( = ?auto_68973 ?auto_68974 ) ) ( not ( = ?auto_68973 ?auto_68975 ) ) ( not ( = ?auto_68973 ?auto_68976 ) ) ( not ( = ?auto_68974 ?auto_68975 ) ) ( not ( = ?auto_68974 ?auto_68976 ) ) ( not ( = ?auto_68975 ?auto_68976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68976 ?auto_68975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68978 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68978 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_68978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68979 - BLOCK
    )
    :vars
    (
      ?auto_68980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68979 ?auto_68980 ) ( CLEAR ?auto_68979 ) ( HAND-EMPTY ) ( not ( = ?auto_68979 ?auto_68980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68979 ?auto_68980 )
      ( MAKE-1PILE ?auto_68979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68987 - BLOCK
      ?auto_68988 - BLOCK
      ?auto_68989 - BLOCK
      ?auto_68990 - BLOCK
      ?auto_68991 - BLOCK
      ?auto_68992 - BLOCK
    )
    :vars
    (
      ?auto_68993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68993 ?auto_68992 ) ( CLEAR ?auto_68993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68987 ) ( ON ?auto_68988 ?auto_68987 ) ( ON ?auto_68989 ?auto_68988 ) ( ON ?auto_68990 ?auto_68989 ) ( ON ?auto_68991 ?auto_68990 ) ( ON ?auto_68992 ?auto_68991 ) ( not ( = ?auto_68987 ?auto_68988 ) ) ( not ( = ?auto_68987 ?auto_68989 ) ) ( not ( = ?auto_68987 ?auto_68990 ) ) ( not ( = ?auto_68987 ?auto_68991 ) ) ( not ( = ?auto_68987 ?auto_68992 ) ) ( not ( = ?auto_68987 ?auto_68993 ) ) ( not ( = ?auto_68988 ?auto_68989 ) ) ( not ( = ?auto_68988 ?auto_68990 ) ) ( not ( = ?auto_68988 ?auto_68991 ) ) ( not ( = ?auto_68988 ?auto_68992 ) ) ( not ( = ?auto_68988 ?auto_68993 ) ) ( not ( = ?auto_68989 ?auto_68990 ) ) ( not ( = ?auto_68989 ?auto_68991 ) ) ( not ( = ?auto_68989 ?auto_68992 ) ) ( not ( = ?auto_68989 ?auto_68993 ) ) ( not ( = ?auto_68990 ?auto_68991 ) ) ( not ( = ?auto_68990 ?auto_68992 ) ) ( not ( = ?auto_68990 ?auto_68993 ) ) ( not ( = ?auto_68991 ?auto_68992 ) ) ( not ( = ?auto_68991 ?auto_68993 ) ) ( not ( = ?auto_68992 ?auto_68993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68993 ?auto_68992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68994 - BLOCK
      ?auto_68995 - BLOCK
      ?auto_68996 - BLOCK
      ?auto_68997 - BLOCK
      ?auto_68998 - BLOCK
      ?auto_68999 - BLOCK
    )
    :vars
    (
      ?auto_69000 - BLOCK
      ?auto_69001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69000 ?auto_68999 ) ( CLEAR ?auto_69000 ) ( ON-TABLE ?auto_68994 ) ( ON ?auto_68995 ?auto_68994 ) ( ON ?auto_68996 ?auto_68995 ) ( ON ?auto_68997 ?auto_68996 ) ( ON ?auto_68998 ?auto_68997 ) ( ON ?auto_68999 ?auto_68998 ) ( not ( = ?auto_68994 ?auto_68995 ) ) ( not ( = ?auto_68994 ?auto_68996 ) ) ( not ( = ?auto_68994 ?auto_68997 ) ) ( not ( = ?auto_68994 ?auto_68998 ) ) ( not ( = ?auto_68994 ?auto_68999 ) ) ( not ( = ?auto_68994 ?auto_69000 ) ) ( not ( = ?auto_68995 ?auto_68996 ) ) ( not ( = ?auto_68995 ?auto_68997 ) ) ( not ( = ?auto_68995 ?auto_68998 ) ) ( not ( = ?auto_68995 ?auto_68999 ) ) ( not ( = ?auto_68995 ?auto_69000 ) ) ( not ( = ?auto_68996 ?auto_68997 ) ) ( not ( = ?auto_68996 ?auto_68998 ) ) ( not ( = ?auto_68996 ?auto_68999 ) ) ( not ( = ?auto_68996 ?auto_69000 ) ) ( not ( = ?auto_68997 ?auto_68998 ) ) ( not ( = ?auto_68997 ?auto_68999 ) ) ( not ( = ?auto_68997 ?auto_69000 ) ) ( not ( = ?auto_68998 ?auto_68999 ) ) ( not ( = ?auto_68998 ?auto_69000 ) ) ( not ( = ?auto_68999 ?auto_69000 ) ) ( HOLDING ?auto_69001 ) ( not ( = ?auto_68994 ?auto_69001 ) ) ( not ( = ?auto_68995 ?auto_69001 ) ) ( not ( = ?auto_68996 ?auto_69001 ) ) ( not ( = ?auto_68997 ?auto_69001 ) ) ( not ( = ?auto_68998 ?auto_69001 ) ) ( not ( = ?auto_68999 ?auto_69001 ) ) ( not ( = ?auto_69000 ?auto_69001 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_69001 )
      ( MAKE-6PILE ?auto_68994 ?auto_68995 ?auto_68996 ?auto_68997 ?auto_68998 ?auto_68999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69002 - BLOCK
      ?auto_69003 - BLOCK
      ?auto_69004 - BLOCK
      ?auto_69005 - BLOCK
      ?auto_69006 - BLOCK
      ?auto_69007 - BLOCK
    )
    :vars
    (
      ?auto_69009 - BLOCK
      ?auto_69008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69009 ?auto_69007 ) ( ON-TABLE ?auto_69002 ) ( ON ?auto_69003 ?auto_69002 ) ( ON ?auto_69004 ?auto_69003 ) ( ON ?auto_69005 ?auto_69004 ) ( ON ?auto_69006 ?auto_69005 ) ( ON ?auto_69007 ?auto_69006 ) ( not ( = ?auto_69002 ?auto_69003 ) ) ( not ( = ?auto_69002 ?auto_69004 ) ) ( not ( = ?auto_69002 ?auto_69005 ) ) ( not ( = ?auto_69002 ?auto_69006 ) ) ( not ( = ?auto_69002 ?auto_69007 ) ) ( not ( = ?auto_69002 ?auto_69009 ) ) ( not ( = ?auto_69003 ?auto_69004 ) ) ( not ( = ?auto_69003 ?auto_69005 ) ) ( not ( = ?auto_69003 ?auto_69006 ) ) ( not ( = ?auto_69003 ?auto_69007 ) ) ( not ( = ?auto_69003 ?auto_69009 ) ) ( not ( = ?auto_69004 ?auto_69005 ) ) ( not ( = ?auto_69004 ?auto_69006 ) ) ( not ( = ?auto_69004 ?auto_69007 ) ) ( not ( = ?auto_69004 ?auto_69009 ) ) ( not ( = ?auto_69005 ?auto_69006 ) ) ( not ( = ?auto_69005 ?auto_69007 ) ) ( not ( = ?auto_69005 ?auto_69009 ) ) ( not ( = ?auto_69006 ?auto_69007 ) ) ( not ( = ?auto_69006 ?auto_69009 ) ) ( not ( = ?auto_69007 ?auto_69009 ) ) ( not ( = ?auto_69002 ?auto_69008 ) ) ( not ( = ?auto_69003 ?auto_69008 ) ) ( not ( = ?auto_69004 ?auto_69008 ) ) ( not ( = ?auto_69005 ?auto_69008 ) ) ( not ( = ?auto_69006 ?auto_69008 ) ) ( not ( = ?auto_69007 ?auto_69008 ) ) ( not ( = ?auto_69009 ?auto_69008 ) ) ( ON ?auto_69008 ?auto_69009 ) ( CLEAR ?auto_69008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69002 ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ?auto_69009 )
      ( MAKE-6PILE ?auto_69002 ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69012 - BLOCK
      ?auto_69013 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69013 ) ( CLEAR ?auto_69012 ) ( ON-TABLE ?auto_69012 ) ( not ( = ?auto_69012 ?auto_69013 ) ) )
    :subtasks
    ( ( !STACK ?auto_69013 ?auto_69012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69014 - BLOCK
      ?auto_69015 - BLOCK
    )
    :vars
    (
      ?auto_69016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69014 ) ( ON-TABLE ?auto_69014 ) ( not ( = ?auto_69014 ?auto_69015 ) ) ( ON ?auto_69015 ?auto_69016 ) ( CLEAR ?auto_69015 ) ( HAND-EMPTY ) ( not ( = ?auto_69014 ?auto_69016 ) ) ( not ( = ?auto_69015 ?auto_69016 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69015 ?auto_69016 )
      ( MAKE-2PILE ?auto_69014 ?auto_69015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69017 - BLOCK
      ?auto_69018 - BLOCK
    )
    :vars
    (
      ?auto_69019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69017 ?auto_69018 ) ) ( ON ?auto_69018 ?auto_69019 ) ( CLEAR ?auto_69018 ) ( not ( = ?auto_69017 ?auto_69019 ) ) ( not ( = ?auto_69018 ?auto_69019 ) ) ( HOLDING ?auto_69017 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69017 )
      ( MAKE-2PILE ?auto_69017 ?auto_69018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69020 - BLOCK
      ?auto_69021 - BLOCK
    )
    :vars
    (
      ?auto_69022 - BLOCK
      ?auto_69023 - BLOCK
      ?auto_69026 - BLOCK
      ?auto_69025 - BLOCK
      ?auto_69027 - BLOCK
      ?auto_69024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69020 ?auto_69021 ) ) ( ON ?auto_69021 ?auto_69022 ) ( not ( = ?auto_69020 ?auto_69022 ) ) ( not ( = ?auto_69021 ?auto_69022 ) ) ( ON ?auto_69020 ?auto_69021 ) ( CLEAR ?auto_69020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69023 ) ( ON ?auto_69026 ?auto_69023 ) ( ON ?auto_69025 ?auto_69026 ) ( ON ?auto_69027 ?auto_69025 ) ( ON ?auto_69024 ?auto_69027 ) ( ON ?auto_69022 ?auto_69024 ) ( not ( = ?auto_69023 ?auto_69026 ) ) ( not ( = ?auto_69023 ?auto_69025 ) ) ( not ( = ?auto_69023 ?auto_69027 ) ) ( not ( = ?auto_69023 ?auto_69024 ) ) ( not ( = ?auto_69023 ?auto_69022 ) ) ( not ( = ?auto_69023 ?auto_69021 ) ) ( not ( = ?auto_69023 ?auto_69020 ) ) ( not ( = ?auto_69026 ?auto_69025 ) ) ( not ( = ?auto_69026 ?auto_69027 ) ) ( not ( = ?auto_69026 ?auto_69024 ) ) ( not ( = ?auto_69026 ?auto_69022 ) ) ( not ( = ?auto_69026 ?auto_69021 ) ) ( not ( = ?auto_69026 ?auto_69020 ) ) ( not ( = ?auto_69025 ?auto_69027 ) ) ( not ( = ?auto_69025 ?auto_69024 ) ) ( not ( = ?auto_69025 ?auto_69022 ) ) ( not ( = ?auto_69025 ?auto_69021 ) ) ( not ( = ?auto_69025 ?auto_69020 ) ) ( not ( = ?auto_69027 ?auto_69024 ) ) ( not ( = ?auto_69027 ?auto_69022 ) ) ( not ( = ?auto_69027 ?auto_69021 ) ) ( not ( = ?auto_69027 ?auto_69020 ) ) ( not ( = ?auto_69024 ?auto_69022 ) ) ( not ( = ?auto_69024 ?auto_69021 ) ) ( not ( = ?auto_69024 ?auto_69020 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69023 ?auto_69026 ?auto_69025 ?auto_69027 ?auto_69024 ?auto_69022 ?auto_69021 )
      ( MAKE-2PILE ?auto_69020 ?auto_69021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69033 - BLOCK
      ?auto_69034 - BLOCK
      ?auto_69035 - BLOCK
      ?auto_69036 - BLOCK
      ?auto_69037 - BLOCK
    )
    :vars
    (
      ?auto_69038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69038 ?auto_69037 ) ( CLEAR ?auto_69038 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69033 ) ( ON ?auto_69034 ?auto_69033 ) ( ON ?auto_69035 ?auto_69034 ) ( ON ?auto_69036 ?auto_69035 ) ( ON ?auto_69037 ?auto_69036 ) ( not ( = ?auto_69033 ?auto_69034 ) ) ( not ( = ?auto_69033 ?auto_69035 ) ) ( not ( = ?auto_69033 ?auto_69036 ) ) ( not ( = ?auto_69033 ?auto_69037 ) ) ( not ( = ?auto_69033 ?auto_69038 ) ) ( not ( = ?auto_69034 ?auto_69035 ) ) ( not ( = ?auto_69034 ?auto_69036 ) ) ( not ( = ?auto_69034 ?auto_69037 ) ) ( not ( = ?auto_69034 ?auto_69038 ) ) ( not ( = ?auto_69035 ?auto_69036 ) ) ( not ( = ?auto_69035 ?auto_69037 ) ) ( not ( = ?auto_69035 ?auto_69038 ) ) ( not ( = ?auto_69036 ?auto_69037 ) ) ( not ( = ?auto_69036 ?auto_69038 ) ) ( not ( = ?auto_69037 ?auto_69038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69038 ?auto_69037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69039 - BLOCK
      ?auto_69040 - BLOCK
      ?auto_69041 - BLOCK
      ?auto_69042 - BLOCK
      ?auto_69043 - BLOCK
    )
    :vars
    (
      ?auto_69044 - BLOCK
      ?auto_69045 - BLOCK
      ?auto_69046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69044 ?auto_69043 ) ( CLEAR ?auto_69044 ) ( ON-TABLE ?auto_69039 ) ( ON ?auto_69040 ?auto_69039 ) ( ON ?auto_69041 ?auto_69040 ) ( ON ?auto_69042 ?auto_69041 ) ( ON ?auto_69043 ?auto_69042 ) ( not ( = ?auto_69039 ?auto_69040 ) ) ( not ( = ?auto_69039 ?auto_69041 ) ) ( not ( = ?auto_69039 ?auto_69042 ) ) ( not ( = ?auto_69039 ?auto_69043 ) ) ( not ( = ?auto_69039 ?auto_69044 ) ) ( not ( = ?auto_69040 ?auto_69041 ) ) ( not ( = ?auto_69040 ?auto_69042 ) ) ( not ( = ?auto_69040 ?auto_69043 ) ) ( not ( = ?auto_69040 ?auto_69044 ) ) ( not ( = ?auto_69041 ?auto_69042 ) ) ( not ( = ?auto_69041 ?auto_69043 ) ) ( not ( = ?auto_69041 ?auto_69044 ) ) ( not ( = ?auto_69042 ?auto_69043 ) ) ( not ( = ?auto_69042 ?auto_69044 ) ) ( not ( = ?auto_69043 ?auto_69044 ) ) ( HOLDING ?auto_69045 ) ( CLEAR ?auto_69046 ) ( not ( = ?auto_69039 ?auto_69045 ) ) ( not ( = ?auto_69039 ?auto_69046 ) ) ( not ( = ?auto_69040 ?auto_69045 ) ) ( not ( = ?auto_69040 ?auto_69046 ) ) ( not ( = ?auto_69041 ?auto_69045 ) ) ( not ( = ?auto_69041 ?auto_69046 ) ) ( not ( = ?auto_69042 ?auto_69045 ) ) ( not ( = ?auto_69042 ?auto_69046 ) ) ( not ( = ?auto_69043 ?auto_69045 ) ) ( not ( = ?auto_69043 ?auto_69046 ) ) ( not ( = ?auto_69044 ?auto_69045 ) ) ( not ( = ?auto_69044 ?auto_69046 ) ) ( not ( = ?auto_69045 ?auto_69046 ) ) )
    :subtasks
    ( ( !STACK ?auto_69045 ?auto_69046 )
      ( MAKE-5PILE ?auto_69039 ?auto_69040 ?auto_69041 ?auto_69042 ?auto_69043 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69965 - BLOCK
      ?auto_69966 - BLOCK
      ?auto_69967 - BLOCK
      ?auto_69968 - BLOCK
      ?auto_69969 - BLOCK
    )
    :vars
    (
      ?auto_69971 - BLOCK
      ?auto_69970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69971 ?auto_69969 ) ( ON-TABLE ?auto_69965 ) ( ON ?auto_69966 ?auto_69965 ) ( ON ?auto_69967 ?auto_69966 ) ( ON ?auto_69968 ?auto_69967 ) ( ON ?auto_69969 ?auto_69968 ) ( not ( = ?auto_69965 ?auto_69966 ) ) ( not ( = ?auto_69965 ?auto_69967 ) ) ( not ( = ?auto_69965 ?auto_69968 ) ) ( not ( = ?auto_69965 ?auto_69969 ) ) ( not ( = ?auto_69965 ?auto_69971 ) ) ( not ( = ?auto_69966 ?auto_69967 ) ) ( not ( = ?auto_69966 ?auto_69968 ) ) ( not ( = ?auto_69966 ?auto_69969 ) ) ( not ( = ?auto_69966 ?auto_69971 ) ) ( not ( = ?auto_69967 ?auto_69968 ) ) ( not ( = ?auto_69967 ?auto_69969 ) ) ( not ( = ?auto_69967 ?auto_69971 ) ) ( not ( = ?auto_69968 ?auto_69969 ) ) ( not ( = ?auto_69968 ?auto_69971 ) ) ( not ( = ?auto_69969 ?auto_69971 ) ) ( not ( = ?auto_69965 ?auto_69970 ) ) ( not ( = ?auto_69966 ?auto_69970 ) ) ( not ( = ?auto_69967 ?auto_69970 ) ) ( not ( = ?auto_69968 ?auto_69970 ) ) ( not ( = ?auto_69969 ?auto_69970 ) ) ( not ( = ?auto_69971 ?auto_69970 ) ) ( ON ?auto_69970 ?auto_69971 ) ( CLEAR ?auto_69970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69965 ?auto_69966 ?auto_69967 ?auto_69968 ?auto_69969 ?auto_69971 )
      ( MAKE-5PILE ?auto_69965 ?auto_69966 ?auto_69967 ?auto_69968 ?auto_69969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69055 - BLOCK
      ?auto_69056 - BLOCK
      ?auto_69057 - BLOCK
      ?auto_69058 - BLOCK
      ?auto_69059 - BLOCK
    )
    :vars
    (
      ?auto_69062 - BLOCK
      ?auto_69060 - BLOCK
      ?auto_69061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69062 ?auto_69059 ) ( ON-TABLE ?auto_69055 ) ( ON ?auto_69056 ?auto_69055 ) ( ON ?auto_69057 ?auto_69056 ) ( ON ?auto_69058 ?auto_69057 ) ( ON ?auto_69059 ?auto_69058 ) ( not ( = ?auto_69055 ?auto_69056 ) ) ( not ( = ?auto_69055 ?auto_69057 ) ) ( not ( = ?auto_69055 ?auto_69058 ) ) ( not ( = ?auto_69055 ?auto_69059 ) ) ( not ( = ?auto_69055 ?auto_69062 ) ) ( not ( = ?auto_69056 ?auto_69057 ) ) ( not ( = ?auto_69056 ?auto_69058 ) ) ( not ( = ?auto_69056 ?auto_69059 ) ) ( not ( = ?auto_69056 ?auto_69062 ) ) ( not ( = ?auto_69057 ?auto_69058 ) ) ( not ( = ?auto_69057 ?auto_69059 ) ) ( not ( = ?auto_69057 ?auto_69062 ) ) ( not ( = ?auto_69058 ?auto_69059 ) ) ( not ( = ?auto_69058 ?auto_69062 ) ) ( not ( = ?auto_69059 ?auto_69062 ) ) ( not ( = ?auto_69055 ?auto_69060 ) ) ( not ( = ?auto_69055 ?auto_69061 ) ) ( not ( = ?auto_69056 ?auto_69060 ) ) ( not ( = ?auto_69056 ?auto_69061 ) ) ( not ( = ?auto_69057 ?auto_69060 ) ) ( not ( = ?auto_69057 ?auto_69061 ) ) ( not ( = ?auto_69058 ?auto_69060 ) ) ( not ( = ?auto_69058 ?auto_69061 ) ) ( not ( = ?auto_69059 ?auto_69060 ) ) ( not ( = ?auto_69059 ?auto_69061 ) ) ( not ( = ?auto_69062 ?auto_69060 ) ) ( not ( = ?auto_69062 ?auto_69061 ) ) ( not ( = ?auto_69060 ?auto_69061 ) ) ( ON ?auto_69060 ?auto_69062 ) ( CLEAR ?auto_69060 ) ( HOLDING ?auto_69061 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69061 )
      ( MAKE-5PILE ?auto_69055 ?auto_69056 ?auto_69057 ?auto_69058 ?auto_69059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69063 - BLOCK
      ?auto_69064 - BLOCK
      ?auto_69065 - BLOCK
      ?auto_69066 - BLOCK
      ?auto_69067 - BLOCK
    )
    :vars
    (
      ?auto_69069 - BLOCK
      ?auto_69070 - BLOCK
      ?auto_69068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69069 ?auto_69067 ) ( ON-TABLE ?auto_69063 ) ( ON ?auto_69064 ?auto_69063 ) ( ON ?auto_69065 ?auto_69064 ) ( ON ?auto_69066 ?auto_69065 ) ( ON ?auto_69067 ?auto_69066 ) ( not ( = ?auto_69063 ?auto_69064 ) ) ( not ( = ?auto_69063 ?auto_69065 ) ) ( not ( = ?auto_69063 ?auto_69066 ) ) ( not ( = ?auto_69063 ?auto_69067 ) ) ( not ( = ?auto_69063 ?auto_69069 ) ) ( not ( = ?auto_69064 ?auto_69065 ) ) ( not ( = ?auto_69064 ?auto_69066 ) ) ( not ( = ?auto_69064 ?auto_69067 ) ) ( not ( = ?auto_69064 ?auto_69069 ) ) ( not ( = ?auto_69065 ?auto_69066 ) ) ( not ( = ?auto_69065 ?auto_69067 ) ) ( not ( = ?auto_69065 ?auto_69069 ) ) ( not ( = ?auto_69066 ?auto_69067 ) ) ( not ( = ?auto_69066 ?auto_69069 ) ) ( not ( = ?auto_69067 ?auto_69069 ) ) ( not ( = ?auto_69063 ?auto_69070 ) ) ( not ( = ?auto_69063 ?auto_69068 ) ) ( not ( = ?auto_69064 ?auto_69070 ) ) ( not ( = ?auto_69064 ?auto_69068 ) ) ( not ( = ?auto_69065 ?auto_69070 ) ) ( not ( = ?auto_69065 ?auto_69068 ) ) ( not ( = ?auto_69066 ?auto_69070 ) ) ( not ( = ?auto_69066 ?auto_69068 ) ) ( not ( = ?auto_69067 ?auto_69070 ) ) ( not ( = ?auto_69067 ?auto_69068 ) ) ( not ( = ?auto_69069 ?auto_69070 ) ) ( not ( = ?auto_69069 ?auto_69068 ) ) ( not ( = ?auto_69070 ?auto_69068 ) ) ( ON ?auto_69070 ?auto_69069 ) ( ON ?auto_69068 ?auto_69070 ) ( CLEAR ?auto_69068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69063 ?auto_69064 ?auto_69065 ?auto_69066 ?auto_69067 ?auto_69069 ?auto_69070 )
      ( MAKE-5PILE ?auto_69063 ?auto_69064 ?auto_69065 ?auto_69066 ?auto_69067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69074 - BLOCK
      ?auto_69075 - BLOCK
      ?auto_69076 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69076 ) ( CLEAR ?auto_69075 ) ( ON-TABLE ?auto_69074 ) ( ON ?auto_69075 ?auto_69074 ) ( not ( = ?auto_69074 ?auto_69075 ) ) ( not ( = ?auto_69074 ?auto_69076 ) ) ( not ( = ?auto_69075 ?auto_69076 ) ) )
    :subtasks
    ( ( !STACK ?auto_69076 ?auto_69075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69077 - BLOCK
      ?auto_69078 - BLOCK
      ?auto_69079 - BLOCK
    )
    :vars
    (
      ?auto_69080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69078 ) ( ON-TABLE ?auto_69077 ) ( ON ?auto_69078 ?auto_69077 ) ( not ( = ?auto_69077 ?auto_69078 ) ) ( not ( = ?auto_69077 ?auto_69079 ) ) ( not ( = ?auto_69078 ?auto_69079 ) ) ( ON ?auto_69079 ?auto_69080 ) ( CLEAR ?auto_69079 ) ( HAND-EMPTY ) ( not ( = ?auto_69077 ?auto_69080 ) ) ( not ( = ?auto_69078 ?auto_69080 ) ) ( not ( = ?auto_69079 ?auto_69080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69079 ?auto_69080 )
      ( MAKE-3PILE ?auto_69077 ?auto_69078 ?auto_69079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69081 - BLOCK
      ?auto_69082 - BLOCK
      ?auto_69083 - BLOCK
    )
    :vars
    (
      ?auto_69084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69081 ) ( not ( = ?auto_69081 ?auto_69082 ) ) ( not ( = ?auto_69081 ?auto_69083 ) ) ( not ( = ?auto_69082 ?auto_69083 ) ) ( ON ?auto_69083 ?auto_69084 ) ( CLEAR ?auto_69083 ) ( not ( = ?auto_69081 ?auto_69084 ) ) ( not ( = ?auto_69082 ?auto_69084 ) ) ( not ( = ?auto_69083 ?auto_69084 ) ) ( HOLDING ?auto_69082 ) ( CLEAR ?auto_69081 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69081 ?auto_69082 )
      ( MAKE-3PILE ?auto_69081 ?auto_69082 ?auto_69083 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69085 - BLOCK
      ?auto_69086 - BLOCK
      ?auto_69087 - BLOCK
    )
    :vars
    (
      ?auto_69088 - BLOCK
      ?auto_69089 - BLOCK
      ?auto_69092 - BLOCK
      ?auto_69091 - BLOCK
      ?auto_69090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69085 ) ( not ( = ?auto_69085 ?auto_69086 ) ) ( not ( = ?auto_69085 ?auto_69087 ) ) ( not ( = ?auto_69086 ?auto_69087 ) ) ( ON ?auto_69087 ?auto_69088 ) ( not ( = ?auto_69085 ?auto_69088 ) ) ( not ( = ?auto_69086 ?auto_69088 ) ) ( not ( = ?auto_69087 ?auto_69088 ) ) ( CLEAR ?auto_69085 ) ( ON ?auto_69086 ?auto_69087 ) ( CLEAR ?auto_69086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69089 ) ( ON ?auto_69092 ?auto_69089 ) ( ON ?auto_69091 ?auto_69092 ) ( ON ?auto_69090 ?auto_69091 ) ( ON ?auto_69088 ?auto_69090 ) ( not ( = ?auto_69089 ?auto_69092 ) ) ( not ( = ?auto_69089 ?auto_69091 ) ) ( not ( = ?auto_69089 ?auto_69090 ) ) ( not ( = ?auto_69089 ?auto_69088 ) ) ( not ( = ?auto_69089 ?auto_69087 ) ) ( not ( = ?auto_69089 ?auto_69086 ) ) ( not ( = ?auto_69092 ?auto_69091 ) ) ( not ( = ?auto_69092 ?auto_69090 ) ) ( not ( = ?auto_69092 ?auto_69088 ) ) ( not ( = ?auto_69092 ?auto_69087 ) ) ( not ( = ?auto_69092 ?auto_69086 ) ) ( not ( = ?auto_69091 ?auto_69090 ) ) ( not ( = ?auto_69091 ?auto_69088 ) ) ( not ( = ?auto_69091 ?auto_69087 ) ) ( not ( = ?auto_69091 ?auto_69086 ) ) ( not ( = ?auto_69090 ?auto_69088 ) ) ( not ( = ?auto_69090 ?auto_69087 ) ) ( not ( = ?auto_69090 ?auto_69086 ) ) ( not ( = ?auto_69085 ?auto_69089 ) ) ( not ( = ?auto_69085 ?auto_69092 ) ) ( not ( = ?auto_69085 ?auto_69091 ) ) ( not ( = ?auto_69085 ?auto_69090 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69089 ?auto_69092 ?auto_69091 ?auto_69090 ?auto_69088 ?auto_69087 )
      ( MAKE-3PILE ?auto_69085 ?auto_69086 ?auto_69087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69093 - BLOCK
      ?auto_69094 - BLOCK
      ?auto_69095 - BLOCK
    )
    :vars
    (
      ?auto_69096 - BLOCK
      ?auto_69098 - BLOCK
      ?auto_69099 - BLOCK
      ?auto_69097 - BLOCK
      ?auto_69100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69093 ?auto_69094 ) ) ( not ( = ?auto_69093 ?auto_69095 ) ) ( not ( = ?auto_69094 ?auto_69095 ) ) ( ON ?auto_69095 ?auto_69096 ) ( not ( = ?auto_69093 ?auto_69096 ) ) ( not ( = ?auto_69094 ?auto_69096 ) ) ( not ( = ?auto_69095 ?auto_69096 ) ) ( ON ?auto_69094 ?auto_69095 ) ( CLEAR ?auto_69094 ) ( ON-TABLE ?auto_69098 ) ( ON ?auto_69099 ?auto_69098 ) ( ON ?auto_69097 ?auto_69099 ) ( ON ?auto_69100 ?auto_69097 ) ( ON ?auto_69096 ?auto_69100 ) ( not ( = ?auto_69098 ?auto_69099 ) ) ( not ( = ?auto_69098 ?auto_69097 ) ) ( not ( = ?auto_69098 ?auto_69100 ) ) ( not ( = ?auto_69098 ?auto_69096 ) ) ( not ( = ?auto_69098 ?auto_69095 ) ) ( not ( = ?auto_69098 ?auto_69094 ) ) ( not ( = ?auto_69099 ?auto_69097 ) ) ( not ( = ?auto_69099 ?auto_69100 ) ) ( not ( = ?auto_69099 ?auto_69096 ) ) ( not ( = ?auto_69099 ?auto_69095 ) ) ( not ( = ?auto_69099 ?auto_69094 ) ) ( not ( = ?auto_69097 ?auto_69100 ) ) ( not ( = ?auto_69097 ?auto_69096 ) ) ( not ( = ?auto_69097 ?auto_69095 ) ) ( not ( = ?auto_69097 ?auto_69094 ) ) ( not ( = ?auto_69100 ?auto_69096 ) ) ( not ( = ?auto_69100 ?auto_69095 ) ) ( not ( = ?auto_69100 ?auto_69094 ) ) ( not ( = ?auto_69093 ?auto_69098 ) ) ( not ( = ?auto_69093 ?auto_69099 ) ) ( not ( = ?auto_69093 ?auto_69097 ) ) ( not ( = ?auto_69093 ?auto_69100 ) ) ( HOLDING ?auto_69093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69093 )
      ( MAKE-3PILE ?auto_69093 ?auto_69094 ?auto_69095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69101 - BLOCK
      ?auto_69102 - BLOCK
      ?auto_69103 - BLOCK
    )
    :vars
    (
      ?auto_69104 - BLOCK
      ?auto_69108 - BLOCK
      ?auto_69107 - BLOCK
      ?auto_69106 - BLOCK
      ?auto_69105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69101 ?auto_69102 ) ) ( not ( = ?auto_69101 ?auto_69103 ) ) ( not ( = ?auto_69102 ?auto_69103 ) ) ( ON ?auto_69103 ?auto_69104 ) ( not ( = ?auto_69101 ?auto_69104 ) ) ( not ( = ?auto_69102 ?auto_69104 ) ) ( not ( = ?auto_69103 ?auto_69104 ) ) ( ON ?auto_69102 ?auto_69103 ) ( ON-TABLE ?auto_69108 ) ( ON ?auto_69107 ?auto_69108 ) ( ON ?auto_69106 ?auto_69107 ) ( ON ?auto_69105 ?auto_69106 ) ( ON ?auto_69104 ?auto_69105 ) ( not ( = ?auto_69108 ?auto_69107 ) ) ( not ( = ?auto_69108 ?auto_69106 ) ) ( not ( = ?auto_69108 ?auto_69105 ) ) ( not ( = ?auto_69108 ?auto_69104 ) ) ( not ( = ?auto_69108 ?auto_69103 ) ) ( not ( = ?auto_69108 ?auto_69102 ) ) ( not ( = ?auto_69107 ?auto_69106 ) ) ( not ( = ?auto_69107 ?auto_69105 ) ) ( not ( = ?auto_69107 ?auto_69104 ) ) ( not ( = ?auto_69107 ?auto_69103 ) ) ( not ( = ?auto_69107 ?auto_69102 ) ) ( not ( = ?auto_69106 ?auto_69105 ) ) ( not ( = ?auto_69106 ?auto_69104 ) ) ( not ( = ?auto_69106 ?auto_69103 ) ) ( not ( = ?auto_69106 ?auto_69102 ) ) ( not ( = ?auto_69105 ?auto_69104 ) ) ( not ( = ?auto_69105 ?auto_69103 ) ) ( not ( = ?auto_69105 ?auto_69102 ) ) ( not ( = ?auto_69101 ?auto_69108 ) ) ( not ( = ?auto_69101 ?auto_69107 ) ) ( not ( = ?auto_69101 ?auto_69106 ) ) ( not ( = ?auto_69101 ?auto_69105 ) ) ( ON ?auto_69101 ?auto_69102 ) ( CLEAR ?auto_69101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69108 ?auto_69107 ?auto_69106 ?auto_69105 ?auto_69104 ?auto_69103 ?auto_69102 )
      ( MAKE-3PILE ?auto_69101 ?auto_69102 ?auto_69103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69113 - BLOCK
      ?auto_69114 - BLOCK
      ?auto_69115 - BLOCK
      ?auto_69116 - BLOCK
    )
    :vars
    (
      ?auto_69117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69117 ?auto_69116 ) ( CLEAR ?auto_69117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69113 ) ( ON ?auto_69114 ?auto_69113 ) ( ON ?auto_69115 ?auto_69114 ) ( ON ?auto_69116 ?auto_69115 ) ( not ( = ?auto_69113 ?auto_69114 ) ) ( not ( = ?auto_69113 ?auto_69115 ) ) ( not ( = ?auto_69113 ?auto_69116 ) ) ( not ( = ?auto_69113 ?auto_69117 ) ) ( not ( = ?auto_69114 ?auto_69115 ) ) ( not ( = ?auto_69114 ?auto_69116 ) ) ( not ( = ?auto_69114 ?auto_69117 ) ) ( not ( = ?auto_69115 ?auto_69116 ) ) ( not ( = ?auto_69115 ?auto_69117 ) ) ( not ( = ?auto_69116 ?auto_69117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69117 ?auto_69116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69118 - BLOCK
      ?auto_69119 - BLOCK
      ?auto_69120 - BLOCK
      ?auto_69121 - BLOCK
    )
    :vars
    (
      ?auto_69122 - BLOCK
      ?auto_69123 - BLOCK
      ?auto_69124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69122 ?auto_69121 ) ( CLEAR ?auto_69122 ) ( ON-TABLE ?auto_69118 ) ( ON ?auto_69119 ?auto_69118 ) ( ON ?auto_69120 ?auto_69119 ) ( ON ?auto_69121 ?auto_69120 ) ( not ( = ?auto_69118 ?auto_69119 ) ) ( not ( = ?auto_69118 ?auto_69120 ) ) ( not ( = ?auto_69118 ?auto_69121 ) ) ( not ( = ?auto_69118 ?auto_69122 ) ) ( not ( = ?auto_69119 ?auto_69120 ) ) ( not ( = ?auto_69119 ?auto_69121 ) ) ( not ( = ?auto_69119 ?auto_69122 ) ) ( not ( = ?auto_69120 ?auto_69121 ) ) ( not ( = ?auto_69120 ?auto_69122 ) ) ( not ( = ?auto_69121 ?auto_69122 ) ) ( HOLDING ?auto_69123 ) ( CLEAR ?auto_69124 ) ( not ( = ?auto_69118 ?auto_69123 ) ) ( not ( = ?auto_69118 ?auto_69124 ) ) ( not ( = ?auto_69119 ?auto_69123 ) ) ( not ( = ?auto_69119 ?auto_69124 ) ) ( not ( = ?auto_69120 ?auto_69123 ) ) ( not ( = ?auto_69120 ?auto_69124 ) ) ( not ( = ?auto_69121 ?auto_69123 ) ) ( not ( = ?auto_69121 ?auto_69124 ) ) ( not ( = ?auto_69122 ?auto_69123 ) ) ( not ( = ?auto_69122 ?auto_69124 ) ) ( not ( = ?auto_69123 ?auto_69124 ) ) )
    :subtasks
    ( ( !STACK ?auto_69123 ?auto_69124 )
      ( MAKE-4PILE ?auto_69118 ?auto_69119 ?auto_69120 ?auto_69121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69125 - BLOCK
      ?auto_69126 - BLOCK
      ?auto_69127 - BLOCK
      ?auto_69128 - BLOCK
    )
    :vars
    (
      ?auto_69131 - BLOCK
      ?auto_69130 - BLOCK
      ?auto_69129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69131 ?auto_69128 ) ( ON-TABLE ?auto_69125 ) ( ON ?auto_69126 ?auto_69125 ) ( ON ?auto_69127 ?auto_69126 ) ( ON ?auto_69128 ?auto_69127 ) ( not ( = ?auto_69125 ?auto_69126 ) ) ( not ( = ?auto_69125 ?auto_69127 ) ) ( not ( = ?auto_69125 ?auto_69128 ) ) ( not ( = ?auto_69125 ?auto_69131 ) ) ( not ( = ?auto_69126 ?auto_69127 ) ) ( not ( = ?auto_69126 ?auto_69128 ) ) ( not ( = ?auto_69126 ?auto_69131 ) ) ( not ( = ?auto_69127 ?auto_69128 ) ) ( not ( = ?auto_69127 ?auto_69131 ) ) ( not ( = ?auto_69128 ?auto_69131 ) ) ( CLEAR ?auto_69130 ) ( not ( = ?auto_69125 ?auto_69129 ) ) ( not ( = ?auto_69125 ?auto_69130 ) ) ( not ( = ?auto_69126 ?auto_69129 ) ) ( not ( = ?auto_69126 ?auto_69130 ) ) ( not ( = ?auto_69127 ?auto_69129 ) ) ( not ( = ?auto_69127 ?auto_69130 ) ) ( not ( = ?auto_69128 ?auto_69129 ) ) ( not ( = ?auto_69128 ?auto_69130 ) ) ( not ( = ?auto_69131 ?auto_69129 ) ) ( not ( = ?auto_69131 ?auto_69130 ) ) ( not ( = ?auto_69129 ?auto_69130 ) ) ( ON ?auto_69129 ?auto_69131 ) ( CLEAR ?auto_69129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69125 ?auto_69126 ?auto_69127 ?auto_69128 ?auto_69131 )
      ( MAKE-4PILE ?auto_69125 ?auto_69126 ?auto_69127 ?auto_69128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69132 - BLOCK
      ?auto_69133 - BLOCK
      ?auto_69134 - BLOCK
      ?auto_69135 - BLOCK
    )
    :vars
    (
      ?auto_69137 - BLOCK
      ?auto_69138 - BLOCK
      ?auto_69136 - BLOCK
      ?auto_69139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69137 ?auto_69135 ) ( ON-TABLE ?auto_69132 ) ( ON ?auto_69133 ?auto_69132 ) ( ON ?auto_69134 ?auto_69133 ) ( ON ?auto_69135 ?auto_69134 ) ( not ( = ?auto_69132 ?auto_69133 ) ) ( not ( = ?auto_69132 ?auto_69134 ) ) ( not ( = ?auto_69132 ?auto_69135 ) ) ( not ( = ?auto_69132 ?auto_69137 ) ) ( not ( = ?auto_69133 ?auto_69134 ) ) ( not ( = ?auto_69133 ?auto_69135 ) ) ( not ( = ?auto_69133 ?auto_69137 ) ) ( not ( = ?auto_69134 ?auto_69135 ) ) ( not ( = ?auto_69134 ?auto_69137 ) ) ( not ( = ?auto_69135 ?auto_69137 ) ) ( not ( = ?auto_69132 ?auto_69138 ) ) ( not ( = ?auto_69132 ?auto_69136 ) ) ( not ( = ?auto_69133 ?auto_69138 ) ) ( not ( = ?auto_69133 ?auto_69136 ) ) ( not ( = ?auto_69134 ?auto_69138 ) ) ( not ( = ?auto_69134 ?auto_69136 ) ) ( not ( = ?auto_69135 ?auto_69138 ) ) ( not ( = ?auto_69135 ?auto_69136 ) ) ( not ( = ?auto_69137 ?auto_69138 ) ) ( not ( = ?auto_69137 ?auto_69136 ) ) ( not ( = ?auto_69138 ?auto_69136 ) ) ( ON ?auto_69138 ?auto_69137 ) ( CLEAR ?auto_69138 ) ( HOLDING ?auto_69136 ) ( CLEAR ?auto_69139 ) ( ON-TABLE ?auto_69139 ) ( not ( = ?auto_69139 ?auto_69136 ) ) ( not ( = ?auto_69132 ?auto_69139 ) ) ( not ( = ?auto_69133 ?auto_69139 ) ) ( not ( = ?auto_69134 ?auto_69139 ) ) ( not ( = ?auto_69135 ?auto_69139 ) ) ( not ( = ?auto_69137 ?auto_69139 ) ) ( not ( = ?auto_69138 ?auto_69139 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69139 ?auto_69136 )
      ( MAKE-4PILE ?auto_69132 ?auto_69133 ?auto_69134 ?auto_69135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70194 - BLOCK
      ?auto_70195 - BLOCK
      ?auto_70196 - BLOCK
      ?auto_70197 - BLOCK
    )
    :vars
    (
      ?auto_70198 - BLOCK
      ?auto_70200 - BLOCK
      ?auto_70199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70198 ?auto_70197 ) ( ON-TABLE ?auto_70194 ) ( ON ?auto_70195 ?auto_70194 ) ( ON ?auto_70196 ?auto_70195 ) ( ON ?auto_70197 ?auto_70196 ) ( not ( = ?auto_70194 ?auto_70195 ) ) ( not ( = ?auto_70194 ?auto_70196 ) ) ( not ( = ?auto_70194 ?auto_70197 ) ) ( not ( = ?auto_70194 ?auto_70198 ) ) ( not ( = ?auto_70195 ?auto_70196 ) ) ( not ( = ?auto_70195 ?auto_70197 ) ) ( not ( = ?auto_70195 ?auto_70198 ) ) ( not ( = ?auto_70196 ?auto_70197 ) ) ( not ( = ?auto_70196 ?auto_70198 ) ) ( not ( = ?auto_70197 ?auto_70198 ) ) ( not ( = ?auto_70194 ?auto_70200 ) ) ( not ( = ?auto_70194 ?auto_70199 ) ) ( not ( = ?auto_70195 ?auto_70200 ) ) ( not ( = ?auto_70195 ?auto_70199 ) ) ( not ( = ?auto_70196 ?auto_70200 ) ) ( not ( = ?auto_70196 ?auto_70199 ) ) ( not ( = ?auto_70197 ?auto_70200 ) ) ( not ( = ?auto_70197 ?auto_70199 ) ) ( not ( = ?auto_70198 ?auto_70200 ) ) ( not ( = ?auto_70198 ?auto_70199 ) ) ( not ( = ?auto_70200 ?auto_70199 ) ) ( ON ?auto_70200 ?auto_70198 ) ( ON ?auto_70199 ?auto_70200 ) ( CLEAR ?auto_70199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70194 ?auto_70195 ?auto_70196 ?auto_70197 ?auto_70198 ?auto_70200 )
      ( MAKE-4PILE ?auto_70194 ?auto_70195 ?auto_70196 ?auto_70197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69148 - BLOCK
      ?auto_69149 - BLOCK
      ?auto_69150 - BLOCK
      ?auto_69151 - BLOCK
    )
    :vars
    (
      ?auto_69154 - BLOCK
      ?auto_69155 - BLOCK
      ?auto_69152 - BLOCK
      ?auto_69153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69154 ?auto_69151 ) ( ON-TABLE ?auto_69148 ) ( ON ?auto_69149 ?auto_69148 ) ( ON ?auto_69150 ?auto_69149 ) ( ON ?auto_69151 ?auto_69150 ) ( not ( = ?auto_69148 ?auto_69149 ) ) ( not ( = ?auto_69148 ?auto_69150 ) ) ( not ( = ?auto_69148 ?auto_69151 ) ) ( not ( = ?auto_69148 ?auto_69154 ) ) ( not ( = ?auto_69149 ?auto_69150 ) ) ( not ( = ?auto_69149 ?auto_69151 ) ) ( not ( = ?auto_69149 ?auto_69154 ) ) ( not ( = ?auto_69150 ?auto_69151 ) ) ( not ( = ?auto_69150 ?auto_69154 ) ) ( not ( = ?auto_69151 ?auto_69154 ) ) ( not ( = ?auto_69148 ?auto_69155 ) ) ( not ( = ?auto_69148 ?auto_69152 ) ) ( not ( = ?auto_69149 ?auto_69155 ) ) ( not ( = ?auto_69149 ?auto_69152 ) ) ( not ( = ?auto_69150 ?auto_69155 ) ) ( not ( = ?auto_69150 ?auto_69152 ) ) ( not ( = ?auto_69151 ?auto_69155 ) ) ( not ( = ?auto_69151 ?auto_69152 ) ) ( not ( = ?auto_69154 ?auto_69155 ) ) ( not ( = ?auto_69154 ?auto_69152 ) ) ( not ( = ?auto_69155 ?auto_69152 ) ) ( ON ?auto_69155 ?auto_69154 ) ( not ( = ?auto_69153 ?auto_69152 ) ) ( not ( = ?auto_69148 ?auto_69153 ) ) ( not ( = ?auto_69149 ?auto_69153 ) ) ( not ( = ?auto_69150 ?auto_69153 ) ) ( not ( = ?auto_69151 ?auto_69153 ) ) ( not ( = ?auto_69154 ?auto_69153 ) ) ( not ( = ?auto_69155 ?auto_69153 ) ) ( ON ?auto_69152 ?auto_69155 ) ( CLEAR ?auto_69152 ) ( HOLDING ?auto_69153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69153 )
      ( MAKE-4PILE ?auto_69148 ?auto_69149 ?auto_69150 ?auto_69151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69156 - BLOCK
      ?auto_69157 - BLOCK
      ?auto_69158 - BLOCK
      ?auto_69159 - BLOCK
    )
    :vars
    (
      ?auto_69162 - BLOCK
      ?auto_69163 - BLOCK
      ?auto_69161 - BLOCK
      ?auto_69160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69162 ?auto_69159 ) ( ON-TABLE ?auto_69156 ) ( ON ?auto_69157 ?auto_69156 ) ( ON ?auto_69158 ?auto_69157 ) ( ON ?auto_69159 ?auto_69158 ) ( not ( = ?auto_69156 ?auto_69157 ) ) ( not ( = ?auto_69156 ?auto_69158 ) ) ( not ( = ?auto_69156 ?auto_69159 ) ) ( not ( = ?auto_69156 ?auto_69162 ) ) ( not ( = ?auto_69157 ?auto_69158 ) ) ( not ( = ?auto_69157 ?auto_69159 ) ) ( not ( = ?auto_69157 ?auto_69162 ) ) ( not ( = ?auto_69158 ?auto_69159 ) ) ( not ( = ?auto_69158 ?auto_69162 ) ) ( not ( = ?auto_69159 ?auto_69162 ) ) ( not ( = ?auto_69156 ?auto_69163 ) ) ( not ( = ?auto_69156 ?auto_69161 ) ) ( not ( = ?auto_69157 ?auto_69163 ) ) ( not ( = ?auto_69157 ?auto_69161 ) ) ( not ( = ?auto_69158 ?auto_69163 ) ) ( not ( = ?auto_69158 ?auto_69161 ) ) ( not ( = ?auto_69159 ?auto_69163 ) ) ( not ( = ?auto_69159 ?auto_69161 ) ) ( not ( = ?auto_69162 ?auto_69163 ) ) ( not ( = ?auto_69162 ?auto_69161 ) ) ( not ( = ?auto_69163 ?auto_69161 ) ) ( ON ?auto_69163 ?auto_69162 ) ( not ( = ?auto_69160 ?auto_69161 ) ) ( not ( = ?auto_69156 ?auto_69160 ) ) ( not ( = ?auto_69157 ?auto_69160 ) ) ( not ( = ?auto_69158 ?auto_69160 ) ) ( not ( = ?auto_69159 ?auto_69160 ) ) ( not ( = ?auto_69162 ?auto_69160 ) ) ( not ( = ?auto_69163 ?auto_69160 ) ) ( ON ?auto_69161 ?auto_69163 ) ( ON ?auto_69160 ?auto_69161 ) ( CLEAR ?auto_69160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69156 ?auto_69157 ?auto_69158 ?auto_69159 ?auto_69162 ?auto_69163 ?auto_69161 )
      ( MAKE-4PILE ?auto_69156 ?auto_69157 ?auto_69158 ?auto_69159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69168 - BLOCK
      ?auto_69169 - BLOCK
      ?auto_69170 - BLOCK
      ?auto_69171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69171 ) ( CLEAR ?auto_69170 ) ( ON-TABLE ?auto_69168 ) ( ON ?auto_69169 ?auto_69168 ) ( ON ?auto_69170 ?auto_69169 ) ( not ( = ?auto_69168 ?auto_69169 ) ) ( not ( = ?auto_69168 ?auto_69170 ) ) ( not ( = ?auto_69168 ?auto_69171 ) ) ( not ( = ?auto_69169 ?auto_69170 ) ) ( not ( = ?auto_69169 ?auto_69171 ) ) ( not ( = ?auto_69170 ?auto_69171 ) ) )
    :subtasks
    ( ( !STACK ?auto_69171 ?auto_69170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69172 - BLOCK
      ?auto_69173 - BLOCK
      ?auto_69174 - BLOCK
      ?auto_69175 - BLOCK
    )
    :vars
    (
      ?auto_69176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69174 ) ( ON-TABLE ?auto_69172 ) ( ON ?auto_69173 ?auto_69172 ) ( ON ?auto_69174 ?auto_69173 ) ( not ( = ?auto_69172 ?auto_69173 ) ) ( not ( = ?auto_69172 ?auto_69174 ) ) ( not ( = ?auto_69172 ?auto_69175 ) ) ( not ( = ?auto_69173 ?auto_69174 ) ) ( not ( = ?auto_69173 ?auto_69175 ) ) ( not ( = ?auto_69174 ?auto_69175 ) ) ( ON ?auto_69175 ?auto_69176 ) ( CLEAR ?auto_69175 ) ( HAND-EMPTY ) ( not ( = ?auto_69172 ?auto_69176 ) ) ( not ( = ?auto_69173 ?auto_69176 ) ) ( not ( = ?auto_69174 ?auto_69176 ) ) ( not ( = ?auto_69175 ?auto_69176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69175 ?auto_69176 )
      ( MAKE-4PILE ?auto_69172 ?auto_69173 ?auto_69174 ?auto_69175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69177 - BLOCK
      ?auto_69178 - BLOCK
      ?auto_69179 - BLOCK
      ?auto_69180 - BLOCK
    )
    :vars
    (
      ?auto_69181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69177 ) ( ON ?auto_69178 ?auto_69177 ) ( not ( = ?auto_69177 ?auto_69178 ) ) ( not ( = ?auto_69177 ?auto_69179 ) ) ( not ( = ?auto_69177 ?auto_69180 ) ) ( not ( = ?auto_69178 ?auto_69179 ) ) ( not ( = ?auto_69178 ?auto_69180 ) ) ( not ( = ?auto_69179 ?auto_69180 ) ) ( ON ?auto_69180 ?auto_69181 ) ( CLEAR ?auto_69180 ) ( not ( = ?auto_69177 ?auto_69181 ) ) ( not ( = ?auto_69178 ?auto_69181 ) ) ( not ( = ?auto_69179 ?auto_69181 ) ) ( not ( = ?auto_69180 ?auto_69181 ) ) ( HOLDING ?auto_69179 ) ( CLEAR ?auto_69178 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69177 ?auto_69178 ?auto_69179 )
      ( MAKE-4PILE ?auto_69177 ?auto_69178 ?auto_69179 ?auto_69180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69182 - BLOCK
      ?auto_69183 - BLOCK
      ?auto_69184 - BLOCK
      ?auto_69185 - BLOCK
    )
    :vars
    (
      ?auto_69186 - BLOCK
      ?auto_69187 - BLOCK
      ?auto_69189 - BLOCK
      ?auto_69188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69182 ) ( ON ?auto_69183 ?auto_69182 ) ( not ( = ?auto_69182 ?auto_69183 ) ) ( not ( = ?auto_69182 ?auto_69184 ) ) ( not ( = ?auto_69182 ?auto_69185 ) ) ( not ( = ?auto_69183 ?auto_69184 ) ) ( not ( = ?auto_69183 ?auto_69185 ) ) ( not ( = ?auto_69184 ?auto_69185 ) ) ( ON ?auto_69185 ?auto_69186 ) ( not ( = ?auto_69182 ?auto_69186 ) ) ( not ( = ?auto_69183 ?auto_69186 ) ) ( not ( = ?auto_69184 ?auto_69186 ) ) ( not ( = ?auto_69185 ?auto_69186 ) ) ( CLEAR ?auto_69183 ) ( ON ?auto_69184 ?auto_69185 ) ( CLEAR ?auto_69184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69187 ) ( ON ?auto_69189 ?auto_69187 ) ( ON ?auto_69188 ?auto_69189 ) ( ON ?auto_69186 ?auto_69188 ) ( not ( = ?auto_69187 ?auto_69189 ) ) ( not ( = ?auto_69187 ?auto_69188 ) ) ( not ( = ?auto_69187 ?auto_69186 ) ) ( not ( = ?auto_69187 ?auto_69185 ) ) ( not ( = ?auto_69187 ?auto_69184 ) ) ( not ( = ?auto_69189 ?auto_69188 ) ) ( not ( = ?auto_69189 ?auto_69186 ) ) ( not ( = ?auto_69189 ?auto_69185 ) ) ( not ( = ?auto_69189 ?auto_69184 ) ) ( not ( = ?auto_69188 ?auto_69186 ) ) ( not ( = ?auto_69188 ?auto_69185 ) ) ( not ( = ?auto_69188 ?auto_69184 ) ) ( not ( = ?auto_69182 ?auto_69187 ) ) ( not ( = ?auto_69182 ?auto_69189 ) ) ( not ( = ?auto_69182 ?auto_69188 ) ) ( not ( = ?auto_69183 ?auto_69187 ) ) ( not ( = ?auto_69183 ?auto_69189 ) ) ( not ( = ?auto_69183 ?auto_69188 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69187 ?auto_69189 ?auto_69188 ?auto_69186 ?auto_69185 )
      ( MAKE-4PILE ?auto_69182 ?auto_69183 ?auto_69184 ?auto_69185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69190 - BLOCK
      ?auto_69191 - BLOCK
      ?auto_69192 - BLOCK
      ?auto_69193 - BLOCK
    )
    :vars
    (
      ?auto_69196 - BLOCK
      ?auto_69194 - BLOCK
      ?auto_69197 - BLOCK
      ?auto_69195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69190 ) ( not ( = ?auto_69190 ?auto_69191 ) ) ( not ( = ?auto_69190 ?auto_69192 ) ) ( not ( = ?auto_69190 ?auto_69193 ) ) ( not ( = ?auto_69191 ?auto_69192 ) ) ( not ( = ?auto_69191 ?auto_69193 ) ) ( not ( = ?auto_69192 ?auto_69193 ) ) ( ON ?auto_69193 ?auto_69196 ) ( not ( = ?auto_69190 ?auto_69196 ) ) ( not ( = ?auto_69191 ?auto_69196 ) ) ( not ( = ?auto_69192 ?auto_69196 ) ) ( not ( = ?auto_69193 ?auto_69196 ) ) ( ON ?auto_69192 ?auto_69193 ) ( CLEAR ?auto_69192 ) ( ON-TABLE ?auto_69194 ) ( ON ?auto_69197 ?auto_69194 ) ( ON ?auto_69195 ?auto_69197 ) ( ON ?auto_69196 ?auto_69195 ) ( not ( = ?auto_69194 ?auto_69197 ) ) ( not ( = ?auto_69194 ?auto_69195 ) ) ( not ( = ?auto_69194 ?auto_69196 ) ) ( not ( = ?auto_69194 ?auto_69193 ) ) ( not ( = ?auto_69194 ?auto_69192 ) ) ( not ( = ?auto_69197 ?auto_69195 ) ) ( not ( = ?auto_69197 ?auto_69196 ) ) ( not ( = ?auto_69197 ?auto_69193 ) ) ( not ( = ?auto_69197 ?auto_69192 ) ) ( not ( = ?auto_69195 ?auto_69196 ) ) ( not ( = ?auto_69195 ?auto_69193 ) ) ( not ( = ?auto_69195 ?auto_69192 ) ) ( not ( = ?auto_69190 ?auto_69194 ) ) ( not ( = ?auto_69190 ?auto_69197 ) ) ( not ( = ?auto_69190 ?auto_69195 ) ) ( not ( = ?auto_69191 ?auto_69194 ) ) ( not ( = ?auto_69191 ?auto_69197 ) ) ( not ( = ?auto_69191 ?auto_69195 ) ) ( HOLDING ?auto_69191 ) ( CLEAR ?auto_69190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69190 ?auto_69191 )
      ( MAKE-4PILE ?auto_69190 ?auto_69191 ?auto_69192 ?auto_69193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69198 - BLOCK
      ?auto_69199 - BLOCK
      ?auto_69200 - BLOCK
      ?auto_69201 - BLOCK
    )
    :vars
    (
      ?auto_69203 - BLOCK
      ?auto_69204 - BLOCK
      ?auto_69205 - BLOCK
      ?auto_69202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69198 ) ( not ( = ?auto_69198 ?auto_69199 ) ) ( not ( = ?auto_69198 ?auto_69200 ) ) ( not ( = ?auto_69198 ?auto_69201 ) ) ( not ( = ?auto_69199 ?auto_69200 ) ) ( not ( = ?auto_69199 ?auto_69201 ) ) ( not ( = ?auto_69200 ?auto_69201 ) ) ( ON ?auto_69201 ?auto_69203 ) ( not ( = ?auto_69198 ?auto_69203 ) ) ( not ( = ?auto_69199 ?auto_69203 ) ) ( not ( = ?auto_69200 ?auto_69203 ) ) ( not ( = ?auto_69201 ?auto_69203 ) ) ( ON ?auto_69200 ?auto_69201 ) ( ON-TABLE ?auto_69204 ) ( ON ?auto_69205 ?auto_69204 ) ( ON ?auto_69202 ?auto_69205 ) ( ON ?auto_69203 ?auto_69202 ) ( not ( = ?auto_69204 ?auto_69205 ) ) ( not ( = ?auto_69204 ?auto_69202 ) ) ( not ( = ?auto_69204 ?auto_69203 ) ) ( not ( = ?auto_69204 ?auto_69201 ) ) ( not ( = ?auto_69204 ?auto_69200 ) ) ( not ( = ?auto_69205 ?auto_69202 ) ) ( not ( = ?auto_69205 ?auto_69203 ) ) ( not ( = ?auto_69205 ?auto_69201 ) ) ( not ( = ?auto_69205 ?auto_69200 ) ) ( not ( = ?auto_69202 ?auto_69203 ) ) ( not ( = ?auto_69202 ?auto_69201 ) ) ( not ( = ?auto_69202 ?auto_69200 ) ) ( not ( = ?auto_69198 ?auto_69204 ) ) ( not ( = ?auto_69198 ?auto_69205 ) ) ( not ( = ?auto_69198 ?auto_69202 ) ) ( not ( = ?auto_69199 ?auto_69204 ) ) ( not ( = ?auto_69199 ?auto_69205 ) ) ( not ( = ?auto_69199 ?auto_69202 ) ) ( CLEAR ?auto_69198 ) ( ON ?auto_69199 ?auto_69200 ) ( CLEAR ?auto_69199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69204 ?auto_69205 ?auto_69202 ?auto_69203 ?auto_69201 ?auto_69200 )
      ( MAKE-4PILE ?auto_69198 ?auto_69199 ?auto_69200 ?auto_69201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69206 - BLOCK
      ?auto_69207 - BLOCK
      ?auto_69208 - BLOCK
      ?auto_69209 - BLOCK
    )
    :vars
    (
      ?auto_69210 - BLOCK
      ?auto_69211 - BLOCK
      ?auto_69212 - BLOCK
      ?auto_69213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69206 ?auto_69207 ) ) ( not ( = ?auto_69206 ?auto_69208 ) ) ( not ( = ?auto_69206 ?auto_69209 ) ) ( not ( = ?auto_69207 ?auto_69208 ) ) ( not ( = ?auto_69207 ?auto_69209 ) ) ( not ( = ?auto_69208 ?auto_69209 ) ) ( ON ?auto_69209 ?auto_69210 ) ( not ( = ?auto_69206 ?auto_69210 ) ) ( not ( = ?auto_69207 ?auto_69210 ) ) ( not ( = ?auto_69208 ?auto_69210 ) ) ( not ( = ?auto_69209 ?auto_69210 ) ) ( ON ?auto_69208 ?auto_69209 ) ( ON-TABLE ?auto_69211 ) ( ON ?auto_69212 ?auto_69211 ) ( ON ?auto_69213 ?auto_69212 ) ( ON ?auto_69210 ?auto_69213 ) ( not ( = ?auto_69211 ?auto_69212 ) ) ( not ( = ?auto_69211 ?auto_69213 ) ) ( not ( = ?auto_69211 ?auto_69210 ) ) ( not ( = ?auto_69211 ?auto_69209 ) ) ( not ( = ?auto_69211 ?auto_69208 ) ) ( not ( = ?auto_69212 ?auto_69213 ) ) ( not ( = ?auto_69212 ?auto_69210 ) ) ( not ( = ?auto_69212 ?auto_69209 ) ) ( not ( = ?auto_69212 ?auto_69208 ) ) ( not ( = ?auto_69213 ?auto_69210 ) ) ( not ( = ?auto_69213 ?auto_69209 ) ) ( not ( = ?auto_69213 ?auto_69208 ) ) ( not ( = ?auto_69206 ?auto_69211 ) ) ( not ( = ?auto_69206 ?auto_69212 ) ) ( not ( = ?auto_69206 ?auto_69213 ) ) ( not ( = ?auto_69207 ?auto_69211 ) ) ( not ( = ?auto_69207 ?auto_69212 ) ) ( not ( = ?auto_69207 ?auto_69213 ) ) ( ON ?auto_69207 ?auto_69208 ) ( CLEAR ?auto_69207 ) ( HOLDING ?auto_69206 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69206 )
      ( MAKE-4PILE ?auto_69206 ?auto_69207 ?auto_69208 ?auto_69209 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69214 - BLOCK
      ?auto_69215 - BLOCK
      ?auto_69216 - BLOCK
      ?auto_69217 - BLOCK
    )
    :vars
    (
      ?auto_69221 - BLOCK
      ?auto_69218 - BLOCK
      ?auto_69219 - BLOCK
      ?auto_69220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69214 ?auto_69215 ) ) ( not ( = ?auto_69214 ?auto_69216 ) ) ( not ( = ?auto_69214 ?auto_69217 ) ) ( not ( = ?auto_69215 ?auto_69216 ) ) ( not ( = ?auto_69215 ?auto_69217 ) ) ( not ( = ?auto_69216 ?auto_69217 ) ) ( ON ?auto_69217 ?auto_69221 ) ( not ( = ?auto_69214 ?auto_69221 ) ) ( not ( = ?auto_69215 ?auto_69221 ) ) ( not ( = ?auto_69216 ?auto_69221 ) ) ( not ( = ?auto_69217 ?auto_69221 ) ) ( ON ?auto_69216 ?auto_69217 ) ( ON-TABLE ?auto_69218 ) ( ON ?auto_69219 ?auto_69218 ) ( ON ?auto_69220 ?auto_69219 ) ( ON ?auto_69221 ?auto_69220 ) ( not ( = ?auto_69218 ?auto_69219 ) ) ( not ( = ?auto_69218 ?auto_69220 ) ) ( not ( = ?auto_69218 ?auto_69221 ) ) ( not ( = ?auto_69218 ?auto_69217 ) ) ( not ( = ?auto_69218 ?auto_69216 ) ) ( not ( = ?auto_69219 ?auto_69220 ) ) ( not ( = ?auto_69219 ?auto_69221 ) ) ( not ( = ?auto_69219 ?auto_69217 ) ) ( not ( = ?auto_69219 ?auto_69216 ) ) ( not ( = ?auto_69220 ?auto_69221 ) ) ( not ( = ?auto_69220 ?auto_69217 ) ) ( not ( = ?auto_69220 ?auto_69216 ) ) ( not ( = ?auto_69214 ?auto_69218 ) ) ( not ( = ?auto_69214 ?auto_69219 ) ) ( not ( = ?auto_69214 ?auto_69220 ) ) ( not ( = ?auto_69215 ?auto_69218 ) ) ( not ( = ?auto_69215 ?auto_69219 ) ) ( not ( = ?auto_69215 ?auto_69220 ) ) ( ON ?auto_69215 ?auto_69216 ) ( ON ?auto_69214 ?auto_69215 ) ( CLEAR ?auto_69214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69218 ?auto_69219 ?auto_69220 ?auto_69221 ?auto_69217 ?auto_69216 ?auto_69215 )
      ( MAKE-4PILE ?auto_69214 ?auto_69215 ?auto_69216 ?auto_69217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69225 - BLOCK
      ?auto_69226 - BLOCK
      ?auto_69227 - BLOCK
    )
    :vars
    (
      ?auto_69228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69228 ?auto_69227 ) ( CLEAR ?auto_69228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69225 ) ( ON ?auto_69226 ?auto_69225 ) ( ON ?auto_69227 ?auto_69226 ) ( not ( = ?auto_69225 ?auto_69226 ) ) ( not ( = ?auto_69225 ?auto_69227 ) ) ( not ( = ?auto_69225 ?auto_69228 ) ) ( not ( = ?auto_69226 ?auto_69227 ) ) ( not ( = ?auto_69226 ?auto_69228 ) ) ( not ( = ?auto_69227 ?auto_69228 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69228 ?auto_69227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69229 - BLOCK
      ?auto_69230 - BLOCK
      ?auto_69231 - BLOCK
    )
    :vars
    (
      ?auto_69232 - BLOCK
      ?auto_69233 - BLOCK
      ?auto_69234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69232 ?auto_69231 ) ( CLEAR ?auto_69232 ) ( ON-TABLE ?auto_69229 ) ( ON ?auto_69230 ?auto_69229 ) ( ON ?auto_69231 ?auto_69230 ) ( not ( = ?auto_69229 ?auto_69230 ) ) ( not ( = ?auto_69229 ?auto_69231 ) ) ( not ( = ?auto_69229 ?auto_69232 ) ) ( not ( = ?auto_69230 ?auto_69231 ) ) ( not ( = ?auto_69230 ?auto_69232 ) ) ( not ( = ?auto_69231 ?auto_69232 ) ) ( HOLDING ?auto_69233 ) ( CLEAR ?auto_69234 ) ( not ( = ?auto_69229 ?auto_69233 ) ) ( not ( = ?auto_69229 ?auto_69234 ) ) ( not ( = ?auto_69230 ?auto_69233 ) ) ( not ( = ?auto_69230 ?auto_69234 ) ) ( not ( = ?auto_69231 ?auto_69233 ) ) ( not ( = ?auto_69231 ?auto_69234 ) ) ( not ( = ?auto_69232 ?auto_69233 ) ) ( not ( = ?auto_69232 ?auto_69234 ) ) ( not ( = ?auto_69233 ?auto_69234 ) ) )
    :subtasks
    ( ( !STACK ?auto_69233 ?auto_69234 )
      ( MAKE-3PILE ?auto_69229 ?auto_69230 ?auto_69231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69235 - BLOCK
      ?auto_69236 - BLOCK
      ?auto_69237 - BLOCK
    )
    :vars
    (
      ?auto_69240 - BLOCK
      ?auto_69238 - BLOCK
      ?auto_69239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69240 ?auto_69237 ) ( ON-TABLE ?auto_69235 ) ( ON ?auto_69236 ?auto_69235 ) ( ON ?auto_69237 ?auto_69236 ) ( not ( = ?auto_69235 ?auto_69236 ) ) ( not ( = ?auto_69235 ?auto_69237 ) ) ( not ( = ?auto_69235 ?auto_69240 ) ) ( not ( = ?auto_69236 ?auto_69237 ) ) ( not ( = ?auto_69236 ?auto_69240 ) ) ( not ( = ?auto_69237 ?auto_69240 ) ) ( CLEAR ?auto_69238 ) ( not ( = ?auto_69235 ?auto_69239 ) ) ( not ( = ?auto_69235 ?auto_69238 ) ) ( not ( = ?auto_69236 ?auto_69239 ) ) ( not ( = ?auto_69236 ?auto_69238 ) ) ( not ( = ?auto_69237 ?auto_69239 ) ) ( not ( = ?auto_69237 ?auto_69238 ) ) ( not ( = ?auto_69240 ?auto_69239 ) ) ( not ( = ?auto_69240 ?auto_69238 ) ) ( not ( = ?auto_69239 ?auto_69238 ) ) ( ON ?auto_69239 ?auto_69240 ) ( CLEAR ?auto_69239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69235 ?auto_69236 ?auto_69237 ?auto_69240 )
      ( MAKE-3PILE ?auto_69235 ?auto_69236 ?auto_69237 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69241 - BLOCK
      ?auto_69242 - BLOCK
      ?auto_69243 - BLOCK
    )
    :vars
    (
      ?auto_69246 - BLOCK
      ?auto_69244 - BLOCK
      ?auto_69245 - BLOCK
      ?auto_69248 - BLOCK
      ?auto_69247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69246 ?auto_69243 ) ( ON-TABLE ?auto_69241 ) ( ON ?auto_69242 ?auto_69241 ) ( ON ?auto_69243 ?auto_69242 ) ( not ( = ?auto_69241 ?auto_69242 ) ) ( not ( = ?auto_69241 ?auto_69243 ) ) ( not ( = ?auto_69241 ?auto_69246 ) ) ( not ( = ?auto_69242 ?auto_69243 ) ) ( not ( = ?auto_69242 ?auto_69246 ) ) ( not ( = ?auto_69243 ?auto_69246 ) ) ( not ( = ?auto_69241 ?auto_69244 ) ) ( not ( = ?auto_69241 ?auto_69245 ) ) ( not ( = ?auto_69242 ?auto_69244 ) ) ( not ( = ?auto_69242 ?auto_69245 ) ) ( not ( = ?auto_69243 ?auto_69244 ) ) ( not ( = ?auto_69243 ?auto_69245 ) ) ( not ( = ?auto_69246 ?auto_69244 ) ) ( not ( = ?auto_69246 ?auto_69245 ) ) ( not ( = ?auto_69244 ?auto_69245 ) ) ( ON ?auto_69244 ?auto_69246 ) ( CLEAR ?auto_69244 ) ( HOLDING ?auto_69245 ) ( CLEAR ?auto_69248 ) ( ON-TABLE ?auto_69247 ) ( ON ?auto_69248 ?auto_69247 ) ( not ( = ?auto_69247 ?auto_69248 ) ) ( not ( = ?auto_69247 ?auto_69245 ) ) ( not ( = ?auto_69248 ?auto_69245 ) ) ( not ( = ?auto_69241 ?auto_69248 ) ) ( not ( = ?auto_69241 ?auto_69247 ) ) ( not ( = ?auto_69242 ?auto_69248 ) ) ( not ( = ?auto_69242 ?auto_69247 ) ) ( not ( = ?auto_69243 ?auto_69248 ) ) ( not ( = ?auto_69243 ?auto_69247 ) ) ( not ( = ?auto_69246 ?auto_69248 ) ) ( not ( = ?auto_69246 ?auto_69247 ) ) ( not ( = ?auto_69244 ?auto_69248 ) ) ( not ( = ?auto_69244 ?auto_69247 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69247 ?auto_69248 ?auto_69245 )
      ( MAKE-3PILE ?auto_69241 ?auto_69242 ?auto_69243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69249 - BLOCK
      ?auto_69250 - BLOCK
      ?auto_69251 - BLOCK
    )
    :vars
    (
      ?auto_69255 - BLOCK
      ?auto_69254 - BLOCK
      ?auto_69256 - BLOCK
      ?auto_69253 - BLOCK
      ?auto_69252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69255 ?auto_69251 ) ( ON-TABLE ?auto_69249 ) ( ON ?auto_69250 ?auto_69249 ) ( ON ?auto_69251 ?auto_69250 ) ( not ( = ?auto_69249 ?auto_69250 ) ) ( not ( = ?auto_69249 ?auto_69251 ) ) ( not ( = ?auto_69249 ?auto_69255 ) ) ( not ( = ?auto_69250 ?auto_69251 ) ) ( not ( = ?auto_69250 ?auto_69255 ) ) ( not ( = ?auto_69251 ?auto_69255 ) ) ( not ( = ?auto_69249 ?auto_69254 ) ) ( not ( = ?auto_69249 ?auto_69256 ) ) ( not ( = ?auto_69250 ?auto_69254 ) ) ( not ( = ?auto_69250 ?auto_69256 ) ) ( not ( = ?auto_69251 ?auto_69254 ) ) ( not ( = ?auto_69251 ?auto_69256 ) ) ( not ( = ?auto_69255 ?auto_69254 ) ) ( not ( = ?auto_69255 ?auto_69256 ) ) ( not ( = ?auto_69254 ?auto_69256 ) ) ( ON ?auto_69254 ?auto_69255 ) ( CLEAR ?auto_69253 ) ( ON-TABLE ?auto_69252 ) ( ON ?auto_69253 ?auto_69252 ) ( not ( = ?auto_69252 ?auto_69253 ) ) ( not ( = ?auto_69252 ?auto_69256 ) ) ( not ( = ?auto_69253 ?auto_69256 ) ) ( not ( = ?auto_69249 ?auto_69253 ) ) ( not ( = ?auto_69249 ?auto_69252 ) ) ( not ( = ?auto_69250 ?auto_69253 ) ) ( not ( = ?auto_69250 ?auto_69252 ) ) ( not ( = ?auto_69251 ?auto_69253 ) ) ( not ( = ?auto_69251 ?auto_69252 ) ) ( not ( = ?auto_69255 ?auto_69253 ) ) ( not ( = ?auto_69255 ?auto_69252 ) ) ( not ( = ?auto_69254 ?auto_69253 ) ) ( not ( = ?auto_69254 ?auto_69252 ) ) ( ON ?auto_69256 ?auto_69254 ) ( CLEAR ?auto_69256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69249 ?auto_69250 ?auto_69251 ?auto_69255 ?auto_69254 )
      ( MAKE-3PILE ?auto_69249 ?auto_69250 ?auto_69251 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69257 - BLOCK
      ?auto_69258 - BLOCK
      ?auto_69259 - BLOCK
    )
    :vars
    (
      ?auto_69263 - BLOCK
      ?auto_69264 - BLOCK
      ?auto_69261 - BLOCK
      ?auto_69262 - BLOCK
      ?auto_69260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69263 ?auto_69259 ) ( ON-TABLE ?auto_69257 ) ( ON ?auto_69258 ?auto_69257 ) ( ON ?auto_69259 ?auto_69258 ) ( not ( = ?auto_69257 ?auto_69258 ) ) ( not ( = ?auto_69257 ?auto_69259 ) ) ( not ( = ?auto_69257 ?auto_69263 ) ) ( not ( = ?auto_69258 ?auto_69259 ) ) ( not ( = ?auto_69258 ?auto_69263 ) ) ( not ( = ?auto_69259 ?auto_69263 ) ) ( not ( = ?auto_69257 ?auto_69264 ) ) ( not ( = ?auto_69257 ?auto_69261 ) ) ( not ( = ?auto_69258 ?auto_69264 ) ) ( not ( = ?auto_69258 ?auto_69261 ) ) ( not ( = ?auto_69259 ?auto_69264 ) ) ( not ( = ?auto_69259 ?auto_69261 ) ) ( not ( = ?auto_69263 ?auto_69264 ) ) ( not ( = ?auto_69263 ?auto_69261 ) ) ( not ( = ?auto_69264 ?auto_69261 ) ) ( ON ?auto_69264 ?auto_69263 ) ( ON-TABLE ?auto_69262 ) ( not ( = ?auto_69262 ?auto_69260 ) ) ( not ( = ?auto_69262 ?auto_69261 ) ) ( not ( = ?auto_69260 ?auto_69261 ) ) ( not ( = ?auto_69257 ?auto_69260 ) ) ( not ( = ?auto_69257 ?auto_69262 ) ) ( not ( = ?auto_69258 ?auto_69260 ) ) ( not ( = ?auto_69258 ?auto_69262 ) ) ( not ( = ?auto_69259 ?auto_69260 ) ) ( not ( = ?auto_69259 ?auto_69262 ) ) ( not ( = ?auto_69263 ?auto_69260 ) ) ( not ( = ?auto_69263 ?auto_69262 ) ) ( not ( = ?auto_69264 ?auto_69260 ) ) ( not ( = ?auto_69264 ?auto_69262 ) ) ( ON ?auto_69261 ?auto_69264 ) ( CLEAR ?auto_69261 ) ( HOLDING ?auto_69260 ) ( CLEAR ?auto_69262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69262 ?auto_69260 )
      ( MAKE-3PILE ?auto_69257 ?auto_69258 ?auto_69259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70442 - BLOCK
      ?auto_70443 - BLOCK
      ?auto_70444 - BLOCK
    )
    :vars
    (
      ?auto_70446 - BLOCK
      ?auto_70448 - BLOCK
      ?auto_70445 - BLOCK
      ?auto_70447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70446 ?auto_70444 ) ( ON-TABLE ?auto_70442 ) ( ON ?auto_70443 ?auto_70442 ) ( ON ?auto_70444 ?auto_70443 ) ( not ( = ?auto_70442 ?auto_70443 ) ) ( not ( = ?auto_70442 ?auto_70444 ) ) ( not ( = ?auto_70442 ?auto_70446 ) ) ( not ( = ?auto_70443 ?auto_70444 ) ) ( not ( = ?auto_70443 ?auto_70446 ) ) ( not ( = ?auto_70444 ?auto_70446 ) ) ( not ( = ?auto_70442 ?auto_70448 ) ) ( not ( = ?auto_70442 ?auto_70445 ) ) ( not ( = ?auto_70443 ?auto_70448 ) ) ( not ( = ?auto_70443 ?auto_70445 ) ) ( not ( = ?auto_70444 ?auto_70448 ) ) ( not ( = ?auto_70444 ?auto_70445 ) ) ( not ( = ?auto_70446 ?auto_70448 ) ) ( not ( = ?auto_70446 ?auto_70445 ) ) ( not ( = ?auto_70448 ?auto_70445 ) ) ( ON ?auto_70448 ?auto_70446 ) ( not ( = ?auto_70447 ?auto_70445 ) ) ( not ( = ?auto_70442 ?auto_70447 ) ) ( not ( = ?auto_70443 ?auto_70447 ) ) ( not ( = ?auto_70444 ?auto_70447 ) ) ( not ( = ?auto_70446 ?auto_70447 ) ) ( not ( = ?auto_70448 ?auto_70447 ) ) ( ON ?auto_70445 ?auto_70448 ) ( ON ?auto_70447 ?auto_70445 ) ( CLEAR ?auto_70447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70442 ?auto_70443 ?auto_70444 ?auto_70446 ?auto_70448 ?auto_70445 )
      ( MAKE-3PILE ?auto_70442 ?auto_70443 ?auto_70444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69273 - BLOCK
      ?auto_69274 - BLOCK
      ?auto_69275 - BLOCK
    )
    :vars
    (
      ?auto_69280 - BLOCK
      ?auto_69278 - BLOCK
      ?auto_69277 - BLOCK
      ?auto_69276 - BLOCK
      ?auto_69279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69280 ?auto_69275 ) ( ON-TABLE ?auto_69273 ) ( ON ?auto_69274 ?auto_69273 ) ( ON ?auto_69275 ?auto_69274 ) ( not ( = ?auto_69273 ?auto_69274 ) ) ( not ( = ?auto_69273 ?auto_69275 ) ) ( not ( = ?auto_69273 ?auto_69280 ) ) ( not ( = ?auto_69274 ?auto_69275 ) ) ( not ( = ?auto_69274 ?auto_69280 ) ) ( not ( = ?auto_69275 ?auto_69280 ) ) ( not ( = ?auto_69273 ?auto_69278 ) ) ( not ( = ?auto_69273 ?auto_69277 ) ) ( not ( = ?auto_69274 ?auto_69278 ) ) ( not ( = ?auto_69274 ?auto_69277 ) ) ( not ( = ?auto_69275 ?auto_69278 ) ) ( not ( = ?auto_69275 ?auto_69277 ) ) ( not ( = ?auto_69280 ?auto_69278 ) ) ( not ( = ?auto_69280 ?auto_69277 ) ) ( not ( = ?auto_69278 ?auto_69277 ) ) ( ON ?auto_69278 ?auto_69280 ) ( not ( = ?auto_69276 ?auto_69279 ) ) ( not ( = ?auto_69276 ?auto_69277 ) ) ( not ( = ?auto_69279 ?auto_69277 ) ) ( not ( = ?auto_69273 ?auto_69279 ) ) ( not ( = ?auto_69273 ?auto_69276 ) ) ( not ( = ?auto_69274 ?auto_69279 ) ) ( not ( = ?auto_69274 ?auto_69276 ) ) ( not ( = ?auto_69275 ?auto_69279 ) ) ( not ( = ?auto_69275 ?auto_69276 ) ) ( not ( = ?auto_69280 ?auto_69279 ) ) ( not ( = ?auto_69280 ?auto_69276 ) ) ( not ( = ?auto_69278 ?auto_69279 ) ) ( not ( = ?auto_69278 ?auto_69276 ) ) ( ON ?auto_69277 ?auto_69278 ) ( ON ?auto_69279 ?auto_69277 ) ( CLEAR ?auto_69279 ) ( HOLDING ?auto_69276 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69276 )
      ( MAKE-3PILE ?auto_69273 ?auto_69274 ?auto_69275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69281 - BLOCK
      ?auto_69282 - BLOCK
      ?auto_69283 - BLOCK
    )
    :vars
    (
      ?auto_69285 - BLOCK
      ?auto_69287 - BLOCK
      ?auto_69288 - BLOCK
      ?auto_69284 - BLOCK
      ?auto_69286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69285 ?auto_69283 ) ( ON-TABLE ?auto_69281 ) ( ON ?auto_69282 ?auto_69281 ) ( ON ?auto_69283 ?auto_69282 ) ( not ( = ?auto_69281 ?auto_69282 ) ) ( not ( = ?auto_69281 ?auto_69283 ) ) ( not ( = ?auto_69281 ?auto_69285 ) ) ( not ( = ?auto_69282 ?auto_69283 ) ) ( not ( = ?auto_69282 ?auto_69285 ) ) ( not ( = ?auto_69283 ?auto_69285 ) ) ( not ( = ?auto_69281 ?auto_69287 ) ) ( not ( = ?auto_69281 ?auto_69288 ) ) ( not ( = ?auto_69282 ?auto_69287 ) ) ( not ( = ?auto_69282 ?auto_69288 ) ) ( not ( = ?auto_69283 ?auto_69287 ) ) ( not ( = ?auto_69283 ?auto_69288 ) ) ( not ( = ?auto_69285 ?auto_69287 ) ) ( not ( = ?auto_69285 ?auto_69288 ) ) ( not ( = ?auto_69287 ?auto_69288 ) ) ( ON ?auto_69287 ?auto_69285 ) ( not ( = ?auto_69284 ?auto_69286 ) ) ( not ( = ?auto_69284 ?auto_69288 ) ) ( not ( = ?auto_69286 ?auto_69288 ) ) ( not ( = ?auto_69281 ?auto_69286 ) ) ( not ( = ?auto_69281 ?auto_69284 ) ) ( not ( = ?auto_69282 ?auto_69286 ) ) ( not ( = ?auto_69282 ?auto_69284 ) ) ( not ( = ?auto_69283 ?auto_69286 ) ) ( not ( = ?auto_69283 ?auto_69284 ) ) ( not ( = ?auto_69285 ?auto_69286 ) ) ( not ( = ?auto_69285 ?auto_69284 ) ) ( not ( = ?auto_69287 ?auto_69286 ) ) ( not ( = ?auto_69287 ?auto_69284 ) ) ( ON ?auto_69288 ?auto_69287 ) ( ON ?auto_69286 ?auto_69288 ) ( ON ?auto_69284 ?auto_69286 ) ( CLEAR ?auto_69284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69281 ?auto_69282 ?auto_69283 ?auto_69285 ?auto_69287 ?auto_69288 ?auto_69286 )
      ( MAKE-3PILE ?auto_69281 ?auto_69282 ?auto_69283 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69294 - BLOCK
      ?auto_69295 - BLOCK
      ?auto_69296 - BLOCK
      ?auto_69297 - BLOCK
      ?auto_69298 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69298 ) ( CLEAR ?auto_69297 ) ( ON-TABLE ?auto_69294 ) ( ON ?auto_69295 ?auto_69294 ) ( ON ?auto_69296 ?auto_69295 ) ( ON ?auto_69297 ?auto_69296 ) ( not ( = ?auto_69294 ?auto_69295 ) ) ( not ( = ?auto_69294 ?auto_69296 ) ) ( not ( = ?auto_69294 ?auto_69297 ) ) ( not ( = ?auto_69294 ?auto_69298 ) ) ( not ( = ?auto_69295 ?auto_69296 ) ) ( not ( = ?auto_69295 ?auto_69297 ) ) ( not ( = ?auto_69295 ?auto_69298 ) ) ( not ( = ?auto_69296 ?auto_69297 ) ) ( not ( = ?auto_69296 ?auto_69298 ) ) ( not ( = ?auto_69297 ?auto_69298 ) ) )
    :subtasks
    ( ( !STACK ?auto_69298 ?auto_69297 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69299 - BLOCK
      ?auto_69300 - BLOCK
      ?auto_69301 - BLOCK
      ?auto_69302 - BLOCK
      ?auto_69303 - BLOCK
    )
    :vars
    (
      ?auto_69304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69302 ) ( ON-TABLE ?auto_69299 ) ( ON ?auto_69300 ?auto_69299 ) ( ON ?auto_69301 ?auto_69300 ) ( ON ?auto_69302 ?auto_69301 ) ( not ( = ?auto_69299 ?auto_69300 ) ) ( not ( = ?auto_69299 ?auto_69301 ) ) ( not ( = ?auto_69299 ?auto_69302 ) ) ( not ( = ?auto_69299 ?auto_69303 ) ) ( not ( = ?auto_69300 ?auto_69301 ) ) ( not ( = ?auto_69300 ?auto_69302 ) ) ( not ( = ?auto_69300 ?auto_69303 ) ) ( not ( = ?auto_69301 ?auto_69302 ) ) ( not ( = ?auto_69301 ?auto_69303 ) ) ( not ( = ?auto_69302 ?auto_69303 ) ) ( ON ?auto_69303 ?auto_69304 ) ( CLEAR ?auto_69303 ) ( HAND-EMPTY ) ( not ( = ?auto_69299 ?auto_69304 ) ) ( not ( = ?auto_69300 ?auto_69304 ) ) ( not ( = ?auto_69301 ?auto_69304 ) ) ( not ( = ?auto_69302 ?auto_69304 ) ) ( not ( = ?auto_69303 ?auto_69304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69303 ?auto_69304 )
      ( MAKE-5PILE ?auto_69299 ?auto_69300 ?auto_69301 ?auto_69302 ?auto_69303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69305 - BLOCK
      ?auto_69306 - BLOCK
      ?auto_69307 - BLOCK
      ?auto_69308 - BLOCK
      ?auto_69309 - BLOCK
    )
    :vars
    (
      ?auto_69310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69305 ) ( ON ?auto_69306 ?auto_69305 ) ( ON ?auto_69307 ?auto_69306 ) ( not ( = ?auto_69305 ?auto_69306 ) ) ( not ( = ?auto_69305 ?auto_69307 ) ) ( not ( = ?auto_69305 ?auto_69308 ) ) ( not ( = ?auto_69305 ?auto_69309 ) ) ( not ( = ?auto_69306 ?auto_69307 ) ) ( not ( = ?auto_69306 ?auto_69308 ) ) ( not ( = ?auto_69306 ?auto_69309 ) ) ( not ( = ?auto_69307 ?auto_69308 ) ) ( not ( = ?auto_69307 ?auto_69309 ) ) ( not ( = ?auto_69308 ?auto_69309 ) ) ( ON ?auto_69309 ?auto_69310 ) ( CLEAR ?auto_69309 ) ( not ( = ?auto_69305 ?auto_69310 ) ) ( not ( = ?auto_69306 ?auto_69310 ) ) ( not ( = ?auto_69307 ?auto_69310 ) ) ( not ( = ?auto_69308 ?auto_69310 ) ) ( not ( = ?auto_69309 ?auto_69310 ) ) ( HOLDING ?auto_69308 ) ( CLEAR ?auto_69307 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69305 ?auto_69306 ?auto_69307 ?auto_69308 )
      ( MAKE-5PILE ?auto_69305 ?auto_69306 ?auto_69307 ?auto_69308 ?auto_69309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69311 - BLOCK
      ?auto_69312 - BLOCK
      ?auto_69313 - BLOCK
      ?auto_69314 - BLOCK
      ?auto_69315 - BLOCK
    )
    :vars
    (
      ?auto_69316 - BLOCK
      ?auto_69317 - BLOCK
      ?auto_69318 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69311 ) ( ON ?auto_69312 ?auto_69311 ) ( ON ?auto_69313 ?auto_69312 ) ( not ( = ?auto_69311 ?auto_69312 ) ) ( not ( = ?auto_69311 ?auto_69313 ) ) ( not ( = ?auto_69311 ?auto_69314 ) ) ( not ( = ?auto_69311 ?auto_69315 ) ) ( not ( = ?auto_69312 ?auto_69313 ) ) ( not ( = ?auto_69312 ?auto_69314 ) ) ( not ( = ?auto_69312 ?auto_69315 ) ) ( not ( = ?auto_69313 ?auto_69314 ) ) ( not ( = ?auto_69313 ?auto_69315 ) ) ( not ( = ?auto_69314 ?auto_69315 ) ) ( ON ?auto_69315 ?auto_69316 ) ( not ( = ?auto_69311 ?auto_69316 ) ) ( not ( = ?auto_69312 ?auto_69316 ) ) ( not ( = ?auto_69313 ?auto_69316 ) ) ( not ( = ?auto_69314 ?auto_69316 ) ) ( not ( = ?auto_69315 ?auto_69316 ) ) ( CLEAR ?auto_69313 ) ( ON ?auto_69314 ?auto_69315 ) ( CLEAR ?auto_69314 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69317 ) ( ON ?auto_69318 ?auto_69317 ) ( ON ?auto_69316 ?auto_69318 ) ( not ( = ?auto_69317 ?auto_69318 ) ) ( not ( = ?auto_69317 ?auto_69316 ) ) ( not ( = ?auto_69317 ?auto_69315 ) ) ( not ( = ?auto_69317 ?auto_69314 ) ) ( not ( = ?auto_69318 ?auto_69316 ) ) ( not ( = ?auto_69318 ?auto_69315 ) ) ( not ( = ?auto_69318 ?auto_69314 ) ) ( not ( = ?auto_69311 ?auto_69317 ) ) ( not ( = ?auto_69311 ?auto_69318 ) ) ( not ( = ?auto_69312 ?auto_69317 ) ) ( not ( = ?auto_69312 ?auto_69318 ) ) ( not ( = ?auto_69313 ?auto_69317 ) ) ( not ( = ?auto_69313 ?auto_69318 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69317 ?auto_69318 ?auto_69316 ?auto_69315 )
      ( MAKE-5PILE ?auto_69311 ?auto_69312 ?auto_69313 ?auto_69314 ?auto_69315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69319 - BLOCK
      ?auto_69320 - BLOCK
      ?auto_69321 - BLOCK
      ?auto_69322 - BLOCK
      ?auto_69323 - BLOCK
    )
    :vars
    (
      ?auto_69326 - BLOCK
      ?auto_69325 - BLOCK
      ?auto_69324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69319 ) ( ON ?auto_69320 ?auto_69319 ) ( not ( = ?auto_69319 ?auto_69320 ) ) ( not ( = ?auto_69319 ?auto_69321 ) ) ( not ( = ?auto_69319 ?auto_69322 ) ) ( not ( = ?auto_69319 ?auto_69323 ) ) ( not ( = ?auto_69320 ?auto_69321 ) ) ( not ( = ?auto_69320 ?auto_69322 ) ) ( not ( = ?auto_69320 ?auto_69323 ) ) ( not ( = ?auto_69321 ?auto_69322 ) ) ( not ( = ?auto_69321 ?auto_69323 ) ) ( not ( = ?auto_69322 ?auto_69323 ) ) ( ON ?auto_69323 ?auto_69326 ) ( not ( = ?auto_69319 ?auto_69326 ) ) ( not ( = ?auto_69320 ?auto_69326 ) ) ( not ( = ?auto_69321 ?auto_69326 ) ) ( not ( = ?auto_69322 ?auto_69326 ) ) ( not ( = ?auto_69323 ?auto_69326 ) ) ( ON ?auto_69322 ?auto_69323 ) ( CLEAR ?auto_69322 ) ( ON-TABLE ?auto_69325 ) ( ON ?auto_69324 ?auto_69325 ) ( ON ?auto_69326 ?auto_69324 ) ( not ( = ?auto_69325 ?auto_69324 ) ) ( not ( = ?auto_69325 ?auto_69326 ) ) ( not ( = ?auto_69325 ?auto_69323 ) ) ( not ( = ?auto_69325 ?auto_69322 ) ) ( not ( = ?auto_69324 ?auto_69326 ) ) ( not ( = ?auto_69324 ?auto_69323 ) ) ( not ( = ?auto_69324 ?auto_69322 ) ) ( not ( = ?auto_69319 ?auto_69325 ) ) ( not ( = ?auto_69319 ?auto_69324 ) ) ( not ( = ?auto_69320 ?auto_69325 ) ) ( not ( = ?auto_69320 ?auto_69324 ) ) ( not ( = ?auto_69321 ?auto_69325 ) ) ( not ( = ?auto_69321 ?auto_69324 ) ) ( HOLDING ?auto_69321 ) ( CLEAR ?auto_69320 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69319 ?auto_69320 ?auto_69321 )
      ( MAKE-5PILE ?auto_69319 ?auto_69320 ?auto_69321 ?auto_69322 ?auto_69323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69327 - BLOCK
      ?auto_69328 - BLOCK
      ?auto_69329 - BLOCK
      ?auto_69330 - BLOCK
      ?auto_69331 - BLOCK
    )
    :vars
    (
      ?auto_69332 - BLOCK
      ?auto_69334 - BLOCK
      ?auto_69333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69327 ) ( ON ?auto_69328 ?auto_69327 ) ( not ( = ?auto_69327 ?auto_69328 ) ) ( not ( = ?auto_69327 ?auto_69329 ) ) ( not ( = ?auto_69327 ?auto_69330 ) ) ( not ( = ?auto_69327 ?auto_69331 ) ) ( not ( = ?auto_69328 ?auto_69329 ) ) ( not ( = ?auto_69328 ?auto_69330 ) ) ( not ( = ?auto_69328 ?auto_69331 ) ) ( not ( = ?auto_69329 ?auto_69330 ) ) ( not ( = ?auto_69329 ?auto_69331 ) ) ( not ( = ?auto_69330 ?auto_69331 ) ) ( ON ?auto_69331 ?auto_69332 ) ( not ( = ?auto_69327 ?auto_69332 ) ) ( not ( = ?auto_69328 ?auto_69332 ) ) ( not ( = ?auto_69329 ?auto_69332 ) ) ( not ( = ?auto_69330 ?auto_69332 ) ) ( not ( = ?auto_69331 ?auto_69332 ) ) ( ON ?auto_69330 ?auto_69331 ) ( ON-TABLE ?auto_69334 ) ( ON ?auto_69333 ?auto_69334 ) ( ON ?auto_69332 ?auto_69333 ) ( not ( = ?auto_69334 ?auto_69333 ) ) ( not ( = ?auto_69334 ?auto_69332 ) ) ( not ( = ?auto_69334 ?auto_69331 ) ) ( not ( = ?auto_69334 ?auto_69330 ) ) ( not ( = ?auto_69333 ?auto_69332 ) ) ( not ( = ?auto_69333 ?auto_69331 ) ) ( not ( = ?auto_69333 ?auto_69330 ) ) ( not ( = ?auto_69327 ?auto_69334 ) ) ( not ( = ?auto_69327 ?auto_69333 ) ) ( not ( = ?auto_69328 ?auto_69334 ) ) ( not ( = ?auto_69328 ?auto_69333 ) ) ( not ( = ?auto_69329 ?auto_69334 ) ) ( not ( = ?auto_69329 ?auto_69333 ) ) ( CLEAR ?auto_69328 ) ( ON ?auto_69329 ?auto_69330 ) ( CLEAR ?auto_69329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69334 ?auto_69333 ?auto_69332 ?auto_69331 ?auto_69330 )
      ( MAKE-5PILE ?auto_69327 ?auto_69328 ?auto_69329 ?auto_69330 ?auto_69331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69335 - BLOCK
      ?auto_69336 - BLOCK
      ?auto_69337 - BLOCK
      ?auto_69338 - BLOCK
      ?auto_69339 - BLOCK
    )
    :vars
    (
      ?auto_69342 - BLOCK
      ?auto_69341 - BLOCK
      ?auto_69340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69335 ) ( not ( = ?auto_69335 ?auto_69336 ) ) ( not ( = ?auto_69335 ?auto_69337 ) ) ( not ( = ?auto_69335 ?auto_69338 ) ) ( not ( = ?auto_69335 ?auto_69339 ) ) ( not ( = ?auto_69336 ?auto_69337 ) ) ( not ( = ?auto_69336 ?auto_69338 ) ) ( not ( = ?auto_69336 ?auto_69339 ) ) ( not ( = ?auto_69337 ?auto_69338 ) ) ( not ( = ?auto_69337 ?auto_69339 ) ) ( not ( = ?auto_69338 ?auto_69339 ) ) ( ON ?auto_69339 ?auto_69342 ) ( not ( = ?auto_69335 ?auto_69342 ) ) ( not ( = ?auto_69336 ?auto_69342 ) ) ( not ( = ?auto_69337 ?auto_69342 ) ) ( not ( = ?auto_69338 ?auto_69342 ) ) ( not ( = ?auto_69339 ?auto_69342 ) ) ( ON ?auto_69338 ?auto_69339 ) ( ON-TABLE ?auto_69341 ) ( ON ?auto_69340 ?auto_69341 ) ( ON ?auto_69342 ?auto_69340 ) ( not ( = ?auto_69341 ?auto_69340 ) ) ( not ( = ?auto_69341 ?auto_69342 ) ) ( not ( = ?auto_69341 ?auto_69339 ) ) ( not ( = ?auto_69341 ?auto_69338 ) ) ( not ( = ?auto_69340 ?auto_69342 ) ) ( not ( = ?auto_69340 ?auto_69339 ) ) ( not ( = ?auto_69340 ?auto_69338 ) ) ( not ( = ?auto_69335 ?auto_69341 ) ) ( not ( = ?auto_69335 ?auto_69340 ) ) ( not ( = ?auto_69336 ?auto_69341 ) ) ( not ( = ?auto_69336 ?auto_69340 ) ) ( not ( = ?auto_69337 ?auto_69341 ) ) ( not ( = ?auto_69337 ?auto_69340 ) ) ( ON ?auto_69337 ?auto_69338 ) ( CLEAR ?auto_69337 ) ( HOLDING ?auto_69336 ) ( CLEAR ?auto_69335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69335 ?auto_69336 )
      ( MAKE-5PILE ?auto_69335 ?auto_69336 ?auto_69337 ?auto_69338 ?auto_69339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69343 - BLOCK
      ?auto_69344 - BLOCK
      ?auto_69345 - BLOCK
      ?auto_69346 - BLOCK
      ?auto_69347 - BLOCK
    )
    :vars
    (
      ?auto_69349 - BLOCK
      ?auto_69350 - BLOCK
      ?auto_69348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69343 ) ( not ( = ?auto_69343 ?auto_69344 ) ) ( not ( = ?auto_69343 ?auto_69345 ) ) ( not ( = ?auto_69343 ?auto_69346 ) ) ( not ( = ?auto_69343 ?auto_69347 ) ) ( not ( = ?auto_69344 ?auto_69345 ) ) ( not ( = ?auto_69344 ?auto_69346 ) ) ( not ( = ?auto_69344 ?auto_69347 ) ) ( not ( = ?auto_69345 ?auto_69346 ) ) ( not ( = ?auto_69345 ?auto_69347 ) ) ( not ( = ?auto_69346 ?auto_69347 ) ) ( ON ?auto_69347 ?auto_69349 ) ( not ( = ?auto_69343 ?auto_69349 ) ) ( not ( = ?auto_69344 ?auto_69349 ) ) ( not ( = ?auto_69345 ?auto_69349 ) ) ( not ( = ?auto_69346 ?auto_69349 ) ) ( not ( = ?auto_69347 ?auto_69349 ) ) ( ON ?auto_69346 ?auto_69347 ) ( ON-TABLE ?auto_69350 ) ( ON ?auto_69348 ?auto_69350 ) ( ON ?auto_69349 ?auto_69348 ) ( not ( = ?auto_69350 ?auto_69348 ) ) ( not ( = ?auto_69350 ?auto_69349 ) ) ( not ( = ?auto_69350 ?auto_69347 ) ) ( not ( = ?auto_69350 ?auto_69346 ) ) ( not ( = ?auto_69348 ?auto_69349 ) ) ( not ( = ?auto_69348 ?auto_69347 ) ) ( not ( = ?auto_69348 ?auto_69346 ) ) ( not ( = ?auto_69343 ?auto_69350 ) ) ( not ( = ?auto_69343 ?auto_69348 ) ) ( not ( = ?auto_69344 ?auto_69350 ) ) ( not ( = ?auto_69344 ?auto_69348 ) ) ( not ( = ?auto_69345 ?auto_69350 ) ) ( not ( = ?auto_69345 ?auto_69348 ) ) ( ON ?auto_69345 ?auto_69346 ) ( CLEAR ?auto_69343 ) ( ON ?auto_69344 ?auto_69345 ) ( CLEAR ?auto_69344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69350 ?auto_69348 ?auto_69349 ?auto_69347 ?auto_69346 ?auto_69345 )
      ( MAKE-5PILE ?auto_69343 ?auto_69344 ?auto_69345 ?auto_69346 ?auto_69347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69351 - BLOCK
      ?auto_69352 - BLOCK
      ?auto_69353 - BLOCK
      ?auto_69354 - BLOCK
      ?auto_69355 - BLOCK
    )
    :vars
    (
      ?auto_69358 - BLOCK
      ?auto_69357 - BLOCK
      ?auto_69356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69351 ?auto_69352 ) ) ( not ( = ?auto_69351 ?auto_69353 ) ) ( not ( = ?auto_69351 ?auto_69354 ) ) ( not ( = ?auto_69351 ?auto_69355 ) ) ( not ( = ?auto_69352 ?auto_69353 ) ) ( not ( = ?auto_69352 ?auto_69354 ) ) ( not ( = ?auto_69352 ?auto_69355 ) ) ( not ( = ?auto_69353 ?auto_69354 ) ) ( not ( = ?auto_69353 ?auto_69355 ) ) ( not ( = ?auto_69354 ?auto_69355 ) ) ( ON ?auto_69355 ?auto_69358 ) ( not ( = ?auto_69351 ?auto_69358 ) ) ( not ( = ?auto_69352 ?auto_69358 ) ) ( not ( = ?auto_69353 ?auto_69358 ) ) ( not ( = ?auto_69354 ?auto_69358 ) ) ( not ( = ?auto_69355 ?auto_69358 ) ) ( ON ?auto_69354 ?auto_69355 ) ( ON-TABLE ?auto_69357 ) ( ON ?auto_69356 ?auto_69357 ) ( ON ?auto_69358 ?auto_69356 ) ( not ( = ?auto_69357 ?auto_69356 ) ) ( not ( = ?auto_69357 ?auto_69358 ) ) ( not ( = ?auto_69357 ?auto_69355 ) ) ( not ( = ?auto_69357 ?auto_69354 ) ) ( not ( = ?auto_69356 ?auto_69358 ) ) ( not ( = ?auto_69356 ?auto_69355 ) ) ( not ( = ?auto_69356 ?auto_69354 ) ) ( not ( = ?auto_69351 ?auto_69357 ) ) ( not ( = ?auto_69351 ?auto_69356 ) ) ( not ( = ?auto_69352 ?auto_69357 ) ) ( not ( = ?auto_69352 ?auto_69356 ) ) ( not ( = ?auto_69353 ?auto_69357 ) ) ( not ( = ?auto_69353 ?auto_69356 ) ) ( ON ?auto_69353 ?auto_69354 ) ( ON ?auto_69352 ?auto_69353 ) ( CLEAR ?auto_69352 ) ( HOLDING ?auto_69351 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69351 )
      ( MAKE-5PILE ?auto_69351 ?auto_69352 ?auto_69353 ?auto_69354 ?auto_69355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69359 - BLOCK
      ?auto_69360 - BLOCK
      ?auto_69361 - BLOCK
      ?auto_69362 - BLOCK
      ?auto_69363 - BLOCK
    )
    :vars
    (
      ?auto_69364 - BLOCK
      ?auto_69365 - BLOCK
      ?auto_69366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69359 ?auto_69360 ) ) ( not ( = ?auto_69359 ?auto_69361 ) ) ( not ( = ?auto_69359 ?auto_69362 ) ) ( not ( = ?auto_69359 ?auto_69363 ) ) ( not ( = ?auto_69360 ?auto_69361 ) ) ( not ( = ?auto_69360 ?auto_69362 ) ) ( not ( = ?auto_69360 ?auto_69363 ) ) ( not ( = ?auto_69361 ?auto_69362 ) ) ( not ( = ?auto_69361 ?auto_69363 ) ) ( not ( = ?auto_69362 ?auto_69363 ) ) ( ON ?auto_69363 ?auto_69364 ) ( not ( = ?auto_69359 ?auto_69364 ) ) ( not ( = ?auto_69360 ?auto_69364 ) ) ( not ( = ?auto_69361 ?auto_69364 ) ) ( not ( = ?auto_69362 ?auto_69364 ) ) ( not ( = ?auto_69363 ?auto_69364 ) ) ( ON ?auto_69362 ?auto_69363 ) ( ON-TABLE ?auto_69365 ) ( ON ?auto_69366 ?auto_69365 ) ( ON ?auto_69364 ?auto_69366 ) ( not ( = ?auto_69365 ?auto_69366 ) ) ( not ( = ?auto_69365 ?auto_69364 ) ) ( not ( = ?auto_69365 ?auto_69363 ) ) ( not ( = ?auto_69365 ?auto_69362 ) ) ( not ( = ?auto_69366 ?auto_69364 ) ) ( not ( = ?auto_69366 ?auto_69363 ) ) ( not ( = ?auto_69366 ?auto_69362 ) ) ( not ( = ?auto_69359 ?auto_69365 ) ) ( not ( = ?auto_69359 ?auto_69366 ) ) ( not ( = ?auto_69360 ?auto_69365 ) ) ( not ( = ?auto_69360 ?auto_69366 ) ) ( not ( = ?auto_69361 ?auto_69365 ) ) ( not ( = ?auto_69361 ?auto_69366 ) ) ( ON ?auto_69361 ?auto_69362 ) ( ON ?auto_69360 ?auto_69361 ) ( ON ?auto_69359 ?auto_69360 ) ( CLEAR ?auto_69359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69365 ?auto_69366 ?auto_69364 ?auto_69363 ?auto_69362 ?auto_69361 ?auto_69360 )
      ( MAKE-5PILE ?auto_69359 ?auto_69360 ?auto_69361 ?auto_69362 ?auto_69363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69369 - BLOCK
      ?auto_69370 - BLOCK
    )
    :vars
    (
      ?auto_69371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69371 ?auto_69370 ) ( CLEAR ?auto_69371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69369 ) ( ON ?auto_69370 ?auto_69369 ) ( not ( = ?auto_69369 ?auto_69370 ) ) ( not ( = ?auto_69369 ?auto_69371 ) ) ( not ( = ?auto_69370 ?auto_69371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69371 ?auto_69370 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69372 - BLOCK
      ?auto_69373 - BLOCK
    )
    :vars
    (
      ?auto_69374 - BLOCK
      ?auto_69375 - BLOCK
      ?auto_69376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69374 ?auto_69373 ) ( CLEAR ?auto_69374 ) ( ON-TABLE ?auto_69372 ) ( ON ?auto_69373 ?auto_69372 ) ( not ( = ?auto_69372 ?auto_69373 ) ) ( not ( = ?auto_69372 ?auto_69374 ) ) ( not ( = ?auto_69373 ?auto_69374 ) ) ( HOLDING ?auto_69375 ) ( CLEAR ?auto_69376 ) ( not ( = ?auto_69372 ?auto_69375 ) ) ( not ( = ?auto_69372 ?auto_69376 ) ) ( not ( = ?auto_69373 ?auto_69375 ) ) ( not ( = ?auto_69373 ?auto_69376 ) ) ( not ( = ?auto_69374 ?auto_69375 ) ) ( not ( = ?auto_69374 ?auto_69376 ) ) ( not ( = ?auto_69375 ?auto_69376 ) ) )
    :subtasks
    ( ( !STACK ?auto_69375 ?auto_69376 )
      ( MAKE-2PILE ?auto_69372 ?auto_69373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69377 - BLOCK
      ?auto_69378 - BLOCK
    )
    :vars
    (
      ?auto_69379 - BLOCK
      ?auto_69380 - BLOCK
      ?auto_69381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69379 ?auto_69378 ) ( ON-TABLE ?auto_69377 ) ( ON ?auto_69378 ?auto_69377 ) ( not ( = ?auto_69377 ?auto_69378 ) ) ( not ( = ?auto_69377 ?auto_69379 ) ) ( not ( = ?auto_69378 ?auto_69379 ) ) ( CLEAR ?auto_69380 ) ( not ( = ?auto_69377 ?auto_69381 ) ) ( not ( = ?auto_69377 ?auto_69380 ) ) ( not ( = ?auto_69378 ?auto_69381 ) ) ( not ( = ?auto_69378 ?auto_69380 ) ) ( not ( = ?auto_69379 ?auto_69381 ) ) ( not ( = ?auto_69379 ?auto_69380 ) ) ( not ( = ?auto_69381 ?auto_69380 ) ) ( ON ?auto_69381 ?auto_69379 ) ( CLEAR ?auto_69381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69377 ?auto_69378 ?auto_69379 )
      ( MAKE-2PILE ?auto_69377 ?auto_69378 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69382 - BLOCK
      ?auto_69383 - BLOCK
    )
    :vars
    (
      ?auto_69385 - BLOCK
      ?auto_69386 - BLOCK
      ?auto_69384 - BLOCK
      ?auto_69389 - BLOCK
      ?auto_69387 - BLOCK
      ?auto_69388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69385 ?auto_69383 ) ( ON-TABLE ?auto_69382 ) ( ON ?auto_69383 ?auto_69382 ) ( not ( = ?auto_69382 ?auto_69383 ) ) ( not ( = ?auto_69382 ?auto_69385 ) ) ( not ( = ?auto_69383 ?auto_69385 ) ) ( not ( = ?auto_69382 ?auto_69386 ) ) ( not ( = ?auto_69382 ?auto_69384 ) ) ( not ( = ?auto_69383 ?auto_69386 ) ) ( not ( = ?auto_69383 ?auto_69384 ) ) ( not ( = ?auto_69385 ?auto_69386 ) ) ( not ( = ?auto_69385 ?auto_69384 ) ) ( not ( = ?auto_69386 ?auto_69384 ) ) ( ON ?auto_69386 ?auto_69385 ) ( CLEAR ?auto_69386 ) ( HOLDING ?auto_69384 ) ( CLEAR ?auto_69389 ) ( ON-TABLE ?auto_69387 ) ( ON ?auto_69388 ?auto_69387 ) ( ON ?auto_69389 ?auto_69388 ) ( not ( = ?auto_69387 ?auto_69388 ) ) ( not ( = ?auto_69387 ?auto_69389 ) ) ( not ( = ?auto_69387 ?auto_69384 ) ) ( not ( = ?auto_69388 ?auto_69389 ) ) ( not ( = ?auto_69388 ?auto_69384 ) ) ( not ( = ?auto_69389 ?auto_69384 ) ) ( not ( = ?auto_69382 ?auto_69389 ) ) ( not ( = ?auto_69382 ?auto_69387 ) ) ( not ( = ?auto_69382 ?auto_69388 ) ) ( not ( = ?auto_69383 ?auto_69389 ) ) ( not ( = ?auto_69383 ?auto_69387 ) ) ( not ( = ?auto_69383 ?auto_69388 ) ) ( not ( = ?auto_69385 ?auto_69389 ) ) ( not ( = ?auto_69385 ?auto_69387 ) ) ( not ( = ?auto_69385 ?auto_69388 ) ) ( not ( = ?auto_69386 ?auto_69389 ) ) ( not ( = ?auto_69386 ?auto_69387 ) ) ( not ( = ?auto_69386 ?auto_69388 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69387 ?auto_69388 ?auto_69389 ?auto_69384 )
      ( MAKE-2PILE ?auto_69382 ?auto_69383 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69390 - BLOCK
      ?auto_69391 - BLOCK
    )
    :vars
    (
      ?auto_69394 - BLOCK
      ?auto_69397 - BLOCK
      ?auto_69395 - BLOCK
      ?auto_69392 - BLOCK
      ?auto_69396 - BLOCK
      ?auto_69393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69394 ?auto_69391 ) ( ON-TABLE ?auto_69390 ) ( ON ?auto_69391 ?auto_69390 ) ( not ( = ?auto_69390 ?auto_69391 ) ) ( not ( = ?auto_69390 ?auto_69394 ) ) ( not ( = ?auto_69391 ?auto_69394 ) ) ( not ( = ?auto_69390 ?auto_69397 ) ) ( not ( = ?auto_69390 ?auto_69395 ) ) ( not ( = ?auto_69391 ?auto_69397 ) ) ( not ( = ?auto_69391 ?auto_69395 ) ) ( not ( = ?auto_69394 ?auto_69397 ) ) ( not ( = ?auto_69394 ?auto_69395 ) ) ( not ( = ?auto_69397 ?auto_69395 ) ) ( ON ?auto_69397 ?auto_69394 ) ( CLEAR ?auto_69392 ) ( ON-TABLE ?auto_69396 ) ( ON ?auto_69393 ?auto_69396 ) ( ON ?auto_69392 ?auto_69393 ) ( not ( = ?auto_69396 ?auto_69393 ) ) ( not ( = ?auto_69396 ?auto_69392 ) ) ( not ( = ?auto_69396 ?auto_69395 ) ) ( not ( = ?auto_69393 ?auto_69392 ) ) ( not ( = ?auto_69393 ?auto_69395 ) ) ( not ( = ?auto_69392 ?auto_69395 ) ) ( not ( = ?auto_69390 ?auto_69392 ) ) ( not ( = ?auto_69390 ?auto_69396 ) ) ( not ( = ?auto_69390 ?auto_69393 ) ) ( not ( = ?auto_69391 ?auto_69392 ) ) ( not ( = ?auto_69391 ?auto_69396 ) ) ( not ( = ?auto_69391 ?auto_69393 ) ) ( not ( = ?auto_69394 ?auto_69392 ) ) ( not ( = ?auto_69394 ?auto_69396 ) ) ( not ( = ?auto_69394 ?auto_69393 ) ) ( not ( = ?auto_69397 ?auto_69392 ) ) ( not ( = ?auto_69397 ?auto_69396 ) ) ( not ( = ?auto_69397 ?auto_69393 ) ) ( ON ?auto_69395 ?auto_69397 ) ( CLEAR ?auto_69395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69390 ?auto_69391 ?auto_69394 ?auto_69397 )
      ( MAKE-2PILE ?auto_69390 ?auto_69391 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69398 - BLOCK
      ?auto_69399 - BLOCK
    )
    :vars
    (
      ?auto_69405 - BLOCK
      ?auto_69403 - BLOCK
      ?auto_69402 - BLOCK
      ?auto_69400 - BLOCK
      ?auto_69404 - BLOCK
      ?auto_69401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69405 ?auto_69399 ) ( ON-TABLE ?auto_69398 ) ( ON ?auto_69399 ?auto_69398 ) ( not ( = ?auto_69398 ?auto_69399 ) ) ( not ( = ?auto_69398 ?auto_69405 ) ) ( not ( = ?auto_69399 ?auto_69405 ) ) ( not ( = ?auto_69398 ?auto_69403 ) ) ( not ( = ?auto_69398 ?auto_69402 ) ) ( not ( = ?auto_69399 ?auto_69403 ) ) ( not ( = ?auto_69399 ?auto_69402 ) ) ( not ( = ?auto_69405 ?auto_69403 ) ) ( not ( = ?auto_69405 ?auto_69402 ) ) ( not ( = ?auto_69403 ?auto_69402 ) ) ( ON ?auto_69403 ?auto_69405 ) ( ON-TABLE ?auto_69400 ) ( ON ?auto_69404 ?auto_69400 ) ( not ( = ?auto_69400 ?auto_69404 ) ) ( not ( = ?auto_69400 ?auto_69401 ) ) ( not ( = ?auto_69400 ?auto_69402 ) ) ( not ( = ?auto_69404 ?auto_69401 ) ) ( not ( = ?auto_69404 ?auto_69402 ) ) ( not ( = ?auto_69401 ?auto_69402 ) ) ( not ( = ?auto_69398 ?auto_69401 ) ) ( not ( = ?auto_69398 ?auto_69400 ) ) ( not ( = ?auto_69398 ?auto_69404 ) ) ( not ( = ?auto_69399 ?auto_69401 ) ) ( not ( = ?auto_69399 ?auto_69400 ) ) ( not ( = ?auto_69399 ?auto_69404 ) ) ( not ( = ?auto_69405 ?auto_69401 ) ) ( not ( = ?auto_69405 ?auto_69400 ) ) ( not ( = ?auto_69405 ?auto_69404 ) ) ( not ( = ?auto_69403 ?auto_69401 ) ) ( not ( = ?auto_69403 ?auto_69400 ) ) ( not ( = ?auto_69403 ?auto_69404 ) ) ( ON ?auto_69402 ?auto_69403 ) ( CLEAR ?auto_69402 ) ( HOLDING ?auto_69401 ) ( CLEAR ?auto_69404 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69400 ?auto_69404 ?auto_69401 )
      ( MAKE-2PILE ?auto_69398 ?auto_69399 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69406 - BLOCK
      ?auto_69407 - BLOCK
    )
    :vars
    (
      ?auto_69413 - BLOCK
      ?auto_69411 - BLOCK
      ?auto_69409 - BLOCK
      ?auto_69410 - BLOCK
      ?auto_69412 - BLOCK
      ?auto_69408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69413 ?auto_69407 ) ( ON-TABLE ?auto_69406 ) ( ON ?auto_69407 ?auto_69406 ) ( not ( = ?auto_69406 ?auto_69407 ) ) ( not ( = ?auto_69406 ?auto_69413 ) ) ( not ( = ?auto_69407 ?auto_69413 ) ) ( not ( = ?auto_69406 ?auto_69411 ) ) ( not ( = ?auto_69406 ?auto_69409 ) ) ( not ( = ?auto_69407 ?auto_69411 ) ) ( not ( = ?auto_69407 ?auto_69409 ) ) ( not ( = ?auto_69413 ?auto_69411 ) ) ( not ( = ?auto_69413 ?auto_69409 ) ) ( not ( = ?auto_69411 ?auto_69409 ) ) ( ON ?auto_69411 ?auto_69413 ) ( ON-TABLE ?auto_69410 ) ( ON ?auto_69412 ?auto_69410 ) ( not ( = ?auto_69410 ?auto_69412 ) ) ( not ( = ?auto_69410 ?auto_69408 ) ) ( not ( = ?auto_69410 ?auto_69409 ) ) ( not ( = ?auto_69412 ?auto_69408 ) ) ( not ( = ?auto_69412 ?auto_69409 ) ) ( not ( = ?auto_69408 ?auto_69409 ) ) ( not ( = ?auto_69406 ?auto_69408 ) ) ( not ( = ?auto_69406 ?auto_69410 ) ) ( not ( = ?auto_69406 ?auto_69412 ) ) ( not ( = ?auto_69407 ?auto_69408 ) ) ( not ( = ?auto_69407 ?auto_69410 ) ) ( not ( = ?auto_69407 ?auto_69412 ) ) ( not ( = ?auto_69413 ?auto_69408 ) ) ( not ( = ?auto_69413 ?auto_69410 ) ) ( not ( = ?auto_69413 ?auto_69412 ) ) ( not ( = ?auto_69411 ?auto_69408 ) ) ( not ( = ?auto_69411 ?auto_69410 ) ) ( not ( = ?auto_69411 ?auto_69412 ) ) ( ON ?auto_69409 ?auto_69411 ) ( CLEAR ?auto_69412 ) ( ON ?auto_69408 ?auto_69409 ) ( CLEAR ?auto_69408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69406 ?auto_69407 ?auto_69413 ?auto_69411 ?auto_69409 )
      ( MAKE-2PILE ?auto_69406 ?auto_69407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69414 - BLOCK
      ?auto_69415 - BLOCK
    )
    :vars
    (
      ?auto_69420 - BLOCK
      ?auto_69417 - BLOCK
      ?auto_69418 - BLOCK
      ?auto_69416 - BLOCK
      ?auto_69419 - BLOCK
      ?auto_69421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69420 ?auto_69415 ) ( ON-TABLE ?auto_69414 ) ( ON ?auto_69415 ?auto_69414 ) ( not ( = ?auto_69414 ?auto_69415 ) ) ( not ( = ?auto_69414 ?auto_69420 ) ) ( not ( = ?auto_69415 ?auto_69420 ) ) ( not ( = ?auto_69414 ?auto_69417 ) ) ( not ( = ?auto_69414 ?auto_69418 ) ) ( not ( = ?auto_69415 ?auto_69417 ) ) ( not ( = ?auto_69415 ?auto_69418 ) ) ( not ( = ?auto_69420 ?auto_69417 ) ) ( not ( = ?auto_69420 ?auto_69418 ) ) ( not ( = ?auto_69417 ?auto_69418 ) ) ( ON ?auto_69417 ?auto_69420 ) ( ON-TABLE ?auto_69416 ) ( not ( = ?auto_69416 ?auto_69419 ) ) ( not ( = ?auto_69416 ?auto_69421 ) ) ( not ( = ?auto_69416 ?auto_69418 ) ) ( not ( = ?auto_69419 ?auto_69421 ) ) ( not ( = ?auto_69419 ?auto_69418 ) ) ( not ( = ?auto_69421 ?auto_69418 ) ) ( not ( = ?auto_69414 ?auto_69421 ) ) ( not ( = ?auto_69414 ?auto_69416 ) ) ( not ( = ?auto_69414 ?auto_69419 ) ) ( not ( = ?auto_69415 ?auto_69421 ) ) ( not ( = ?auto_69415 ?auto_69416 ) ) ( not ( = ?auto_69415 ?auto_69419 ) ) ( not ( = ?auto_69420 ?auto_69421 ) ) ( not ( = ?auto_69420 ?auto_69416 ) ) ( not ( = ?auto_69420 ?auto_69419 ) ) ( not ( = ?auto_69417 ?auto_69421 ) ) ( not ( = ?auto_69417 ?auto_69416 ) ) ( not ( = ?auto_69417 ?auto_69419 ) ) ( ON ?auto_69418 ?auto_69417 ) ( ON ?auto_69421 ?auto_69418 ) ( CLEAR ?auto_69421 ) ( HOLDING ?auto_69419 ) ( CLEAR ?auto_69416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69416 ?auto_69419 )
      ( MAKE-2PILE ?auto_69414 ?auto_69415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70715 - BLOCK
      ?auto_70716 - BLOCK
    )
    :vars
    (
      ?auto_70721 - BLOCK
      ?auto_70720 - BLOCK
      ?auto_70719 - BLOCK
      ?auto_70718 - BLOCK
      ?auto_70717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70721 ?auto_70716 ) ( ON-TABLE ?auto_70715 ) ( ON ?auto_70716 ?auto_70715 ) ( not ( = ?auto_70715 ?auto_70716 ) ) ( not ( = ?auto_70715 ?auto_70721 ) ) ( not ( = ?auto_70716 ?auto_70721 ) ) ( not ( = ?auto_70715 ?auto_70720 ) ) ( not ( = ?auto_70715 ?auto_70719 ) ) ( not ( = ?auto_70716 ?auto_70720 ) ) ( not ( = ?auto_70716 ?auto_70719 ) ) ( not ( = ?auto_70721 ?auto_70720 ) ) ( not ( = ?auto_70721 ?auto_70719 ) ) ( not ( = ?auto_70720 ?auto_70719 ) ) ( ON ?auto_70720 ?auto_70721 ) ( not ( = ?auto_70718 ?auto_70717 ) ) ( not ( = ?auto_70718 ?auto_70719 ) ) ( not ( = ?auto_70717 ?auto_70719 ) ) ( not ( = ?auto_70715 ?auto_70717 ) ) ( not ( = ?auto_70715 ?auto_70718 ) ) ( not ( = ?auto_70716 ?auto_70717 ) ) ( not ( = ?auto_70716 ?auto_70718 ) ) ( not ( = ?auto_70721 ?auto_70717 ) ) ( not ( = ?auto_70721 ?auto_70718 ) ) ( not ( = ?auto_70720 ?auto_70717 ) ) ( not ( = ?auto_70720 ?auto_70718 ) ) ( ON ?auto_70719 ?auto_70720 ) ( ON ?auto_70717 ?auto_70719 ) ( ON ?auto_70718 ?auto_70717 ) ( CLEAR ?auto_70718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70715 ?auto_70716 ?auto_70721 ?auto_70720 ?auto_70719 ?auto_70717 )
      ( MAKE-2PILE ?auto_70715 ?auto_70716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69430 - BLOCK
      ?auto_69431 - BLOCK
    )
    :vars
    (
      ?auto_69436 - BLOCK
      ?auto_69434 - BLOCK
      ?auto_69435 - BLOCK
      ?auto_69437 - BLOCK
      ?auto_69433 - BLOCK
      ?auto_69432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69436 ?auto_69431 ) ( ON-TABLE ?auto_69430 ) ( ON ?auto_69431 ?auto_69430 ) ( not ( = ?auto_69430 ?auto_69431 ) ) ( not ( = ?auto_69430 ?auto_69436 ) ) ( not ( = ?auto_69431 ?auto_69436 ) ) ( not ( = ?auto_69430 ?auto_69434 ) ) ( not ( = ?auto_69430 ?auto_69435 ) ) ( not ( = ?auto_69431 ?auto_69434 ) ) ( not ( = ?auto_69431 ?auto_69435 ) ) ( not ( = ?auto_69436 ?auto_69434 ) ) ( not ( = ?auto_69436 ?auto_69435 ) ) ( not ( = ?auto_69434 ?auto_69435 ) ) ( ON ?auto_69434 ?auto_69436 ) ( not ( = ?auto_69437 ?auto_69433 ) ) ( not ( = ?auto_69437 ?auto_69432 ) ) ( not ( = ?auto_69437 ?auto_69435 ) ) ( not ( = ?auto_69433 ?auto_69432 ) ) ( not ( = ?auto_69433 ?auto_69435 ) ) ( not ( = ?auto_69432 ?auto_69435 ) ) ( not ( = ?auto_69430 ?auto_69432 ) ) ( not ( = ?auto_69430 ?auto_69437 ) ) ( not ( = ?auto_69430 ?auto_69433 ) ) ( not ( = ?auto_69431 ?auto_69432 ) ) ( not ( = ?auto_69431 ?auto_69437 ) ) ( not ( = ?auto_69431 ?auto_69433 ) ) ( not ( = ?auto_69436 ?auto_69432 ) ) ( not ( = ?auto_69436 ?auto_69437 ) ) ( not ( = ?auto_69436 ?auto_69433 ) ) ( not ( = ?auto_69434 ?auto_69432 ) ) ( not ( = ?auto_69434 ?auto_69437 ) ) ( not ( = ?auto_69434 ?auto_69433 ) ) ( ON ?auto_69435 ?auto_69434 ) ( ON ?auto_69432 ?auto_69435 ) ( ON ?auto_69433 ?auto_69432 ) ( CLEAR ?auto_69433 ) ( HOLDING ?auto_69437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69437 )
      ( MAKE-2PILE ?auto_69430 ?auto_69431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69438 - BLOCK
      ?auto_69439 - BLOCK
    )
    :vars
    (
      ?auto_69441 - BLOCK
      ?auto_69443 - BLOCK
      ?auto_69445 - BLOCK
      ?auto_69442 - BLOCK
      ?auto_69444 - BLOCK
      ?auto_69440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69441 ?auto_69439 ) ( ON-TABLE ?auto_69438 ) ( ON ?auto_69439 ?auto_69438 ) ( not ( = ?auto_69438 ?auto_69439 ) ) ( not ( = ?auto_69438 ?auto_69441 ) ) ( not ( = ?auto_69439 ?auto_69441 ) ) ( not ( = ?auto_69438 ?auto_69443 ) ) ( not ( = ?auto_69438 ?auto_69445 ) ) ( not ( = ?auto_69439 ?auto_69443 ) ) ( not ( = ?auto_69439 ?auto_69445 ) ) ( not ( = ?auto_69441 ?auto_69443 ) ) ( not ( = ?auto_69441 ?auto_69445 ) ) ( not ( = ?auto_69443 ?auto_69445 ) ) ( ON ?auto_69443 ?auto_69441 ) ( not ( = ?auto_69442 ?auto_69444 ) ) ( not ( = ?auto_69442 ?auto_69440 ) ) ( not ( = ?auto_69442 ?auto_69445 ) ) ( not ( = ?auto_69444 ?auto_69440 ) ) ( not ( = ?auto_69444 ?auto_69445 ) ) ( not ( = ?auto_69440 ?auto_69445 ) ) ( not ( = ?auto_69438 ?auto_69440 ) ) ( not ( = ?auto_69438 ?auto_69442 ) ) ( not ( = ?auto_69438 ?auto_69444 ) ) ( not ( = ?auto_69439 ?auto_69440 ) ) ( not ( = ?auto_69439 ?auto_69442 ) ) ( not ( = ?auto_69439 ?auto_69444 ) ) ( not ( = ?auto_69441 ?auto_69440 ) ) ( not ( = ?auto_69441 ?auto_69442 ) ) ( not ( = ?auto_69441 ?auto_69444 ) ) ( not ( = ?auto_69443 ?auto_69440 ) ) ( not ( = ?auto_69443 ?auto_69442 ) ) ( not ( = ?auto_69443 ?auto_69444 ) ) ( ON ?auto_69445 ?auto_69443 ) ( ON ?auto_69440 ?auto_69445 ) ( ON ?auto_69444 ?auto_69440 ) ( ON ?auto_69442 ?auto_69444 ) ( CLEAR ?auto_69442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69438 ?auto_69439 ?auto_69441 ?auto_69443 ?auto_69445 ?auto_69440 ?auto_69444 )
      ( MAKE-2PILE ?auto_69438 ?auto_69439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69452 - BLOCK
      ?auto_69453 - BLOCK
      ?auto_69454 - BLOCK
      ?auto_69455 - BLOCK
      ?auto_69456 - BLOCK
      ?auto_69457 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69457 ) ( CLEAR ?auto_69456 ) ( ON-TABLE ?auto_69452 ) ( ON ?auto_69453 ?auto_69452 ) ( ON ?auto_69454 ?auto_69453 ) ( ON ?auto_69455 ?auto_69454 ) ( ON ?auto_69456 ?auto_69455 ) ( not ( = ?auto_69452 ?auto_69453 ) ) ( not ( = ?auto_69452 ?auto_69454 ) ) ( not ( = ?auto_69452 ?auto_69455 ) ) ( not ( = ?auto_69452 ?auto_69456 ) ) ( not ( = ?auto_69452 ?auto_69457 ) ) ( not ( = ?auto_69453 ?auto_69454 ) ) ( not ( = ?auto_69453 ?auto_69455 ) ) ( not ( = ?auto_69453 ?auto_69456 ) ) ( not ( = ?auto_69453 ?auto_69457 ) ) ( not ( = ?auto_69454 ?auto_69455 ) ) ( not ( = ?auto_69454 ?auto_69456 ) ) ( not ( = ?auto_69454 ?auto_69457 ) ) ( not ( = ?auto_69455 ?auto_69456 ) ) ( not ( = ?auto_69455 ?auto_69457 ) ) ( not ( = ?auto_69456 ?auto_69457 ) ) )
    :subtasks
    ( ( !STACK ?auto_69457 ?auto_69456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69458 - BLOCK
      ?auto_69459 - BLOCK
      ?auto_69460 - BLOCK
      ?auto_69461 - BLOCK
      ?auto_69462 - BLOCK
      ?auto_69463 - BLOCK
    )
    :vars
    (
      ?auto_69464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69462 ) ( ON-TABLE ?auto_69458 ) ( ON ?auto_69459 ?auto_69458 ) ( ON ?auto_69460 ?auto_69459 ) ( ON ?auto_69461 ?auto_69460 ) ( ON ?auto_69462 ?auto_69461 ) ( not ( = ?auto_69458 ?auto_69459 ) ) ( not ( = ?auto_69458 ?auto_69460 ) ) ( not ( = ?auto_69458 ?auto_69461 ) ) ( not ( = ?auto_69458 ?auto_69462 ) ) ( not ( = ?auto_69458 ?auto_69463 ) ) ( not ( = ?auto_69459 ?auto_69460 ) ) ( not ( = ?auto_69459 ?auto_69461 ) ) ( not ( = ?auto_69459 ?auto_69462 ) ) ( not ( = ?auto_69459 ?auto_69463 ) ) ( not ( = ?auto_69460 ?auto_69461 ) ) ( not ( = ?auto_69460 ?auto_69462 ) ) ( not ( = ?auto_69460 ?auto_69463 ) ) ( not ( = ?auto_69461 ?auto_69462 ) ) ( not ( = ?auto_69461 ?auto_69463 ) ) ( not ( = ?auto_69462 ?auto_69463 ) ) ( ON ?auto_69463 ?auto_69464 ) ( CLEAR ?auto_69463 ) ( HAND-EMPTY ) ( not ( = ?auto_69458 ?auto_69464 ) ) ( not ( = ?auto_69459 ?auto_69464 ) ) ( not ( = ?auto_69460 ?auto_69464 ) ) ( not ( = ?auto_69461 ?auto_69464 ) ) ( not ( = ?auto_69462 ?auto_69464 ) ) ( not ( = ?auto_69463 ?auto_69464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69463 ?auto_69464 )
      ( MAKE-6PILE ?auto_69458 ?auto_69459 ?auto_69460 ?auto_69461 ?auto_69462 ?auto_69463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69465 - BLOCK
      ?auto_69466 - BLOCK
      ?auto_69467 - BLOCK
      ?auto_69468 - BLOCK
      ?auto_69469 - BLOCK
      ?auto_69470 - BLOCK
    )
    :vars
    (
      ?auto_69471 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69465 ) ( ON ?auto_69466 ?auto_69465 ) ( ON ?auto_69467 ?auto_69466 ) ( ON ?auto_69468 ?auto_69467 ) ( not ( = ?auto_69465 ?auto_69466 ) ) ( not ( = ?auto_69465 ?auto_69467 ) ) ( not ( = ?auto_69465 ?auto_69468 ) ) ( not ( = ?auto_69465 ?auto_69469 ) ) ( not ( = ?auto_69465 ?auto_69470 ) ) ( not ( = ?auto_69466 ?auto_69467 ) ) ( not ( = ?auto_69466 ?auto_69468 ) ) ( not ( = ?auto_69466 ?auto_69469 ) ) ( not ( = ?auto_69466 ?auto_69470 ) ) ( not ( = ?auto_69467 ?auto_69468 ) ) ( not ( = ?auto_69467 ?auto_69469 ) ) ( not ( = ?auto_69467 ?auto_69470 ) ) ( not ( = ?auto_69468 ?auto_69469 ) ) ( not ( = ?auto_69468 ?auto_69470 ) ) ( not ( = ?auto_69469 ?auto_69470 ) ) ( ON ?auto_69470 ?auto_69471 ) ( CLEAR ?auto_69470 ) ( not ( = ?auto_69465 ?auto_69471 ) ) ( not ( = ?auto_69466 ?auto_69471 ) ) ( not ( = ?auto_69467 ?auto_69471 ) ) ( not ( = ?auto_69468 ?auto_69471 ) ) ( not ( = ?auto_69469 ?auto_69471 ) ) ( not ( = ?auto_69470 ?auto_69471 ) ) ( HOLDING ?auto_69469 ) ( CLEAR ?auto_69468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69465 ?auto_69466 ?auto_69467 ?auto_69468 ?auto_69469 )
      ( MAKE-6PILE ?auto_69465 ?auto_69466 ?auto_69467 ?auto_69468 ?auto_69469 ?auto_69470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69472 - BLOCK
      ?auto_69473 - BLOCK
      ?auto_69474 - BLOCK
      ?auto_69475 - BLOCK
      ?auto_69476 - BLOCK
      ?auto_69477 - BLOCK
    )
    :vars
    (
      ?auto_69478 - BLOCK
      ?auto_69479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69472 ) ( ON ?auto_69473 ?auto_69472 ) ( ON ?auto_69474 ?auto_69473 ) ( ON ?auto_69475 ?auto_69474 ) ( not ( = ?auto_69472 ?auto_69473 ) ) ( not ( = ?auto_69472 ?auto_69474 ) ) ( not ( = ?auto_69472 ?auto_69475 ) ) ( not ( = ?auto_69472 ?auto_69476 ) ) ( not ( = ?auto_69472 ?auto_69477 ) ) ( not ( = ?auto_69473 ?auto_69474 ) ) ( not ( = ?auto_69473 ?auto_69475 ) ) ( not ( = ?auto_69473 ?auto_69476 ) ) ( not ( = ?auto_69473 ?auto_69477 ) ) ( not ( = ?auto_69474 ?auto_69475 ) ) ( not ( = ?auto_69474 ?auto_69476 ) ) ( not ( = ?auto_69474 ?auto_69477 ) ) ( not ( = ?auto_69475 ?auto_69476 ) ) ( not ( = ?auto_69475 ?auto_69477 ) ) ( not ( = ?auto_69476 ?auto_69477 ) ) ( ON ?auto_69477 ?auto_69478 ) ( not ( = ?auto_69472 ?auto_69478 ) ) ( not ( = ?auto_69473 ?auto_69478 ) ) ( not ( = ?auto_69474 ?auto_69478 ) ) ( not ( = ?auto_69475 ?auto_69478 ) ) ( not ( = ?auto_69476 ?auto_69478 ) ) ( not ( = ?auto_69477 ?auto_69478 ) ) ( CLEAR ?auto_69475 ) ( ON ?auto_69476 ?auto_69477 ) ( CLEAR ?auto_69476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69479 ) ( ON ?auto_69478 ?auto_69479 ) ( not ( = ?auto_69479 ?auto_69478 ) ) ( not ( = ?auto_69479 ?auto_69477 ) ) ( not ( = ?auto_69479 ?auto_69476 ) ) ( not ( = ?auto_69472 ?auto_69479 ) ) ( not ( = ?auto_69473 ?auto_69479 ) ) ( not ( = ?auto_69474 ?auto_69479 ) ) ( not ( = ?auto_69475 ?auto_69479 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69479 ?auto_69478 ?auto_69477 )
      ( MAKE-6PILE ?auto_69472 ?auto_69473 ?auto_69474 ?auto_69475 ?auto_69476 ?auto_69477 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69480 - BLOCK
      ?auto_69481 - BLOCK
      ?auto_69482 - BLOCK
      ?auto_69483 - BLOCK
      ?auto_69484 - BLOCK
      ?auto_69485 - BLOCK
    )
    :vars
    (
      ?auto_69487 - BLOCK
      ?auto_69486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69480 ) ( ON ?auto_69481 ?auto_69480 ) ( ON ?auto_69482 ?auto_69481 ) ( not ( = ?auto_69480 ?auto_69481 ) ) ( not ( = ?auto_69480 ?auto_69482 ) ) ( not ( = ?auto_69480 ?auto_69483 ) ) ( not ( = ?auto_69480 ?auto_69484 ) ) ( not ( = ?auto_69480 ?auto_69485 ) ) ( not ( = ?auto_69481 ?auto_69482 ) ) ( not ( = ?auto_69481 ?auto_69483 ) ) ( not ( = ?auto_69481 ?auto_69484 ) ) ( not ( = ?auto_69481 ?auto_69485 ) ) ( not ( = ?auto_69482 ?auto_69483 ) ) ( not ( = ?auto_69482 ?auto_69484 ) ) ( not ( = ?auto_69482 ?auto_69485 ) ) ( not ( = ?auto_69483 ?auto_69484 ) ) ( not ( = ?auto_69483 ?auto_69485 ) ) ( not ( = ?auto_69484 ?auto_69485 ) ) ( ON ?auto_69485 ?auto_69487 ) ( not ( = ?auto_69480 ?auto_69487 ) ) ( not ( = ?auto_69481 ?auto_69487 ) ) ( not ( = ?auto_69482 ?auto_69487 ) ) ( not ( = ?auto_69483 ?auto_69487 ) ) ( not ( = ?auto_69484 ?auto_69487 ) ) ( not ( = ?auto_69485 ?auto_69487 ) ) ( ON ?auto_69484 ?auto_69485 ) ( CLEAR ?auto_69484 ) ( ON-TABLE ?auto_69486 ) ( ON ?auto_69487 ?auto_69486 ) ( not ( = ?auto_69486 ?auto_69487 ) ) ( not ( = ?auto_69486 ?auto_69485 ) ) ( not ( = ?auto_69486 ?auto_69484 ) ) ( not ( = ?auto_69480 ?auto_69486 ) ) ( not ( = ?auto_69481 ?auto_69486 ) ) ( not ( = ?auto_69482 ?auto_69486 ) ) ( not ( = ?auto_69483 ?auto_69486 ) ) ( HOLDING ?auto_69483 ) ( CLEAR ?auto_69482 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69480 ?auto_69481 ?auto_69482 ?auto_69483 )
      ( MAKE-6PILE ?auto_69480 ?auto_69481 ?auto_69482 ?auto_69483 ?auto_69484 ?auto_69485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69488 - BLOCK
      ?auto_69489 - BLOCK
      ?auto_69490 - BLOCK
      ?auto_69491 - BLOCK
      ?auto_69492 - BLOCK
      ?auto_69493 - BLOCK
    )
    :vars
    (
      ?auto_69494 - BLOCK
      ?auto_69495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69488 ) ( ON ?auto_69489 ?auto_69488 ) ( ON ?auto_69490 ?auto_69489 ) ( not ( = ?auto_69488 ?auto_69489 ) ) ( not ( = ?auto_69488 ?auto_69490 ) ) ( not ( = ?auto_69488 ?auto_69491 ) ) ( not ( = ?auto_69488 ?auto_69492 ) ) ( not ( = ?auto_69488 ?auto_69493 ) ) ( not ( = ?auto_69489 ?auto_69490 ) ) ( not ( = ?auto_69489 ?auto_69491 ) ) ( not ( = ?auto_69489 ?auto_69492 ) ) ( not ( = ?auto_69489 ?auto_69493 ) ) ( not ( = ?auto_69490 ?auto_69491 ) ) ( not ( = ?auto_69490 ?auto_69492 ) ) ( not ( = ?auto_69490 ?auto_69493 ) ) ( not ( = ?auto_69491 ?auto_69492 ) ) ( not ( = ?auto_69491 ?auto_69493 ) ) ( not ( = ?auto_69492 ?auto_69493 ) ) ( ON ?auto_69493 ?auto_69494 ) ( not ( = ?auto_69488 ?auto_69494 ) ) ( not ( = ?auto_69489 ?auto_69494 ) ) ( not ( = ?auto_69490 ?auto_69494 ) ) ( not ( = ?auto_69491 ?auto_69494 ) ) ( not ( = ?auto_69492 ?auto_69494 ) ) ( not ( = ?auto_69493 ?auto_69494 ) ) ( ON ?auto_69492 ?auto_69493 ) ( ON-TABLE ?auto_69495 ) ( ON ?auto_69494 ?auto_69495 ) ( not ( = ?auto_69495 ?auto_69494 ) ) ( not ( = ?auto_69495 ?auto_69493 ) ) ( not ( = ?auto_69495 ?auto_69492 ) ) ( not ( = ?auto_69488 ?auto_69495 ) ) ( not ( = ?auto_69489 ?auto_69495 ) ) ( not ( = ?auto_69490 ?auto_69495 ) ) ( not ( = ?auto_69491 ?auto_69495 ) ) ( CLEAR ?auto_69490 ) ( ON ?auto_69491 ?auto_69492 ) ( CLEAR ?auto_69491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69495 ?auto_69494 ?auto_69493 ?auto_69492 )
      ( MAKE-6PILE ?auto_69488 ?auto_69489 ?auto_69490 ?auto_69491 ?auto_69492 ?auto_69493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69496 - BLOCK
      ?auto_69497 - BLOCK
      ?auto_69498 - BLOCK
      ?auto_69499 - BLOCK
      ?auto_69500 - BLOCK
      ?auto_69501 - BLOCK
    )
    :vars
    (
      ?auto_69503 - BLOCK
      ?auto_69502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69496 ) ( ON ?auto_69497 ?auto_69496 ) ( not ( = ?auto_69496 ?auto_69497 ) ) ( not ( = ?auto_69496 ?auto_69498 ) ) ( not ( = ?auto_69496 ?auto_69499 ) ) ( not ( = ?auto_69496 ?auto_69500 ) ) ( not ( = ?auto_69496 ?auto_69501 ) ) ( not ( = ?auto_69497 ?auto_69498 ) ) ( not ( = ?auto_69497 ?auto_69499 ) ) ( not ( = ?auto_69497 ?auto_69500 ) ) ( not ( = ?auto_69497 ?auto_69501 ) ) ( not ( = ?auto_69498 ?auto_69499 ) ) ( not ( = ?auto_69498 ?auto_69500 ) ) ( not ( = ?auto_69498 ?auto_69501 ) ) ( not ( = ?auto_69499 ?auto_69500 ) ) ( not ( = ?auto_69499 ?auto_69501 ) ) ( not ( = ?auto_69500 ?auto_69501 ) ) ( ON ?auto_69501 ?auto_69503 ) ( not ( = ?auto_69496 ?auto_69503 ) ) ( not ( = ?auto_69497 ?auto_69503 ) ) ( not ( = ?auto_69498 ?auto_69503 ) ) ( not ( = ?auto_69499 ?auto_69503 ) ) ( not ( = ?auto_69500 ?auto_69503 ) ) ( not ( = ?auto_69501 ?auto_69503 ) ) ( ON ?auto_69500 ?auto_69501 ) ( ON-TABLE ?auto_69502 ) ( ON ?auto_69503 ?auto_69502 ) ( not ( = ?auto_69502 ?auto_69503 ) ) ( not ( = ?auto_69502 ?auto_69501 ) ) ( not ( = ?auto_69502 ?auto_69500 ) ) ( not ( = ?auto_69496 ?auto_69502 ) ) ( not ( = ?auto_69497 ?auto_69502 ) ) ( not ( = ?auto_69498 ?auto_69502 ) ) ( not ( = ?auto_69499 ?auto_69502 ) ) ( ON ?auto_69499 ?auto_69500 ) ( CLEAR ?auto_69499 ) ( HOLDING ?auto_69498 ) ( CLEAR ?auto_69497 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69496 ?auto_69497 ?auto_69498 )
      ( MAKE-6PILE ?auto_69496 ?auto_69497 ?auto_69498 ?auto_69499 ?auto_69500 ?auto_69501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69504 - BLOCK
      ?auto_69505 - BLOCK
      ?auto_69506 - BLOCK
      ?auto_69507 - BLOCK
      ?auto_69508 - BLOCK
      ?auto_69509 - BLOCK
    )
    :vars
    (
      ?auto_69510 - BLOCK
      ?auto_69511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69504 ) ( ON ?auto_69505 ?auto_69504 ) ( not ( = ?auto_69504 ?auto_69505 ) ) ( not ( = ?auto_69504 ?auto_69506 ) ) ( not ( = ?auto_69504 ?auto_69507 ) ) ( not ( = ?auto_69504 ?auto_69508 ) ) ( not ( = ?auto_69504 ?auto_69509 ) ) ( not ( = ?auto_69505 ?auto_69506 ) ) ( not ( = ?auto_69505 ?auto_69507 ) ) ( not ( = ?auto_69505 ?auto_69508 ) ) ( not ( = ?auto_69505 ?auto_69509 ) ) ( not ( = ?auto_69506 ?auto_69507 ) ) ( not ( = ?auto_69506 ?auto_69508 ) ) ( not ( = ?auto_69506 ?auto_69509 ) ) ( not ( = ?auto_69507 ?auto_69508 ) ) ( not ( = ?auto_69507 ?auto_69509 ) ) ( not ( = ?auto_69508 ?auto_69509 ) ) ( ON ?auto_69509 ?auto_69510 ) ( not ( = ?auto_69504 ?auto_69510 ) ) ( not ( = ?auto_69505 ?auto_69510 ) ) ( not ( = ?auto_69506 ?auto_69510 ) ) ( not ( = ?auto_69507 ?auto_69510 ) ) ( not ( = ?auto_69508 ?auto_69510 ) ) ( not ( = ?auto_69509 ?auto_69510 ) ) ( ON ?auto_69508 ?auto_69509 ) ( ON-TABLE ?auto_69511 ) ( ON ?auto_69510 ?auto_69511 ) ( not ( = ?auto_69511 ?auto_69510 ) ) ( not ( = ?auto_69511 ?auto_69509 ) ) ( not ( = ?auto_69511 ?auto_69508 ) ) ( not ( = ?auto_69504 ?auto_69511 ) ) ( not ( = ?auto_69505 ?auto_69511 ) ) ( not ( = ?auto_69506 ?auto_69511 ) ) ( not ( = ?auto_69507 ?auto_69511 ) ) ( ON ?auto_69507 ?auto_69508 ) ( CLEAR ?auto_69505 ) ( ON ?auto_69506 ?auto_69507 ) ( CLEAR ?auto_69506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69511 ?auto_69510 ?auto_69509 ?auto_69508 ?auto_69507 )
      ( MAKE-6PILE ?auto_69504 ?auto_69505 ?auto_69506 ?auto_69507 ?auto_69508 ?auto_69509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69512 - BLOCK
      ?auto_69513 - BLOCK
      ?auto_69514 - BLOCK
      ?auto_69515 - BLOCK
      ?auto_69516 - BLOCK
      ?auto_69517 - BLOCK
    )
    :vars
    (
      ?auto_69518 - BLOCK
      ?auto_69519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69512 ) ( not ( = ?auto_69512 ?auto_69513 ) ) ( not ( = ?auto_69512 ?auto_69514 ) ) ( not ( = ?auto_69512 ?auto_69515 ) ) ( not ( = ?auto_69512 ?auto_69516 ) ) ( not ( = ?auto_69512 ?auto_69517 ) ) ( not ( = ?auto_69513 ?auto_69514 ) ) ( not ( = ?auto_69513 ?auto_69515 ) ) ( not ( = ?auto_69513 ?auto_69516 ) ) ( not ( = ?auto_69513 ?auto_69517 ) ) ( not ( = ?auto_69514 ?auto_69515 ) ) ( not ( = ?auto_69514 ?auto_69516 ) ) ( not ( = ?auto_69514 ?auto_69517 ) ) ( not ( = ?auto_69515 ?auto_69516 ) ) ( not ( = ?auto_69515 ?auto_69517 ) ) ( not ( = ?auto_69516 ?auto_69517 ) ) ( ON ?auto_69517 ?auto_69518 ) ( not ( = ?auto_69512 ?auto_69518 ) ) ( not ( = ?auto_69513 ?auto_69518 ) ) ( not ( = ?auto_69514 ?auto_69518 ) ) ( not ( = ?auto_69515 ?auto_69518 ) ) ( not ( = ?auto_69516 ?auto_69518 ) ) ( not ( = ?auto_69517 ?auto_69518 ) ) ( ON ?auto_69516 ?auto_69517 ) ( ON-TABLE ?auto_69519 ) ( ON ?auto_69518 ?auto_69519 ) ( not ( = ?auto_69519 ?auto_69518 ) ) ( not ( = ?auto_69519 ?auto_69517 ) ) ( not ( = ?auto_69519 ?auto_69516 ) ) ( not ( = ?auto_69512 ?auto_69519 ) ) ( not ( = ?auto_69513 ?auto_69519 ) ) ( not ( = ?auto_69514 ?auto_69519 ) ) ( not ( = ?auto_69515 ?auto_69519 ) ) ( ON ?auto_69515 ?auto_69516 ) ( ON ?auto_69514 ?auto_69515 ) ( CLEAR ?auto_69514 ) ( HOLDING ?auto_69513 ) ( CLEAR ?auto_69512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69512 ?auto_69513 )
      ( MAKE-6PILE ?auto_69512 ?auto_69513 ?auto_69514 ?auto_69515 ?auto_69516 ?auto_69517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69520 - BLOCK
      ?auto_69521 - BLOCK
      ?auto_69522 - BLOCK
      ?auto_69523 - BLOCK
      ?auto_69524 - BLOCK
      ?auto_69525 - BLOCK
    )
    :vars
    (
      ?auto_69527 - BLOCK
      ?auto_69526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69520 ) ( not ( = ?auto_69520 ?auto_69521 ) ) ( not ( = ?auto_69520 ?auto_69522 ) ) ( not ( = ?auto_69520 ?auto_69523 ) ) ( not ( = ?auto_69520 ?auto_69524 ) ) ( not ( = ?auto_69520 ?auto_69525 ) ) ( not ( = ?auto_69521 ?auto_69522 ) ) ( not ( = ?auto_69521 ?auto_69523 ) ) ( not ( = ?auto_69521 ?auto_69524 ) ) ( not ( = ?auto_69521 ?auto_69525 ) ) ( not ( = ?auto_69522 ?auto_69523 ) ) ( not ( = ?auto_69522 ?auto_69524 ) ) ( not ( = ?auto_69522 ?auto_69525 ) ) ( not ( = ?auto_69523 ?auto_69524 ) ) ( not ( = ?auto_69523 ?auto_69525 ) ) ( not ( = ?auto_69524 ?auto_69525 ) ) ( ON ?auto_69525 ?auto_69527 ) ( not ( = ?auto_69520 ?auto_69527 ) ) ( not ( = ?auto_69521 ?auto_69527 ) ) ( not ( = ?auto_69522 ?auto_69527 ) ) ( not ( = ?auto_69523 ?auto_69527 ) ) ( not ( = ?auto_69524 ?auto_69527 ) ) ( not ( = ?auto_69525 ?auto_69527 ) ) ( ON ?auto_69524 ?auto_69525 ) ( ON-TABLE ?auto_69526 ) ( ON ?auto_69527 ?auto_69526 ) ( not ( = ?auto_69526 ?auto_69527 ) ) ( not ( = ?auto_69526 ?auto_69525 ) ) ( not ( = ?auto_69526 ?auto_69524 ) ) ( not ( = ?auto_69520 ?auto_69526 ) ) ( not ( = ?auto_69521 ?auto_69526 ) ) ( not ( = ?auto_69522 ?auto_69526 ) ) ( not ( = ?auto_69523 ?auto_69526 ) ) ( ON ?auto_69523 ?auto_69524 ) ( ON ?auto_69522 ?auto_69523 ) ( CLEAR ?auto_69520 ) ( ON ?auto_69521 ?auto_69522 ) ( CLEAR ?auto_69521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69526 ?auto_69527 ?auto_69525 ?auto_69524 ?auto_69523 ?auto_69522 )
      ( MAKE-6PILE ?auto_69520 ?auto_69521 ?auto_69522 ?auto_69523 ?auto_69524 ?auto_69525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69528 - BLOCK
      ?auto_69529 - BLOCK
      ?auto_69530 - BLOCK
      ?auto_69531 - BLOCK
      ?auto_69532 - BLOCK
      ?auto_69533 - BLOCK
    )
    :vars
    (
      ?auto_69535 - BLOCK
      ?auto_69534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69528 ?auto_69529 ) ) ( not ( = ?auto_69528 ?auto_69530 ) ) ( not ( = ?auto_69528 ?auto_69531 ) ) ( not ( = ?auto_69528 ?auto_69532 ) ) ( not ( = ?auto_69528 ?auto_69533 ) ) ( not ( = ?auto_69529 ?auto_69530 ) ) ( not ( = ?auto_69529 ?auto_69531 ) ) ( not ( = ?auto_69529 ?auto_69532 ) ) ( not ( = ?auto_69529 ?auto_69533 ) ) ( not ( = ?auto_69530 ?auto_69531 ) ) ( not ( = ?auto_69530 ?auto_69532 ) ) ( not ( = ?auto_69530 ?auto_69533 ) ) ( not ( = ?auto_69531 ?auto_69532 ) ) ( not ( = ?auto_69531 ?auto_69533 ) ) ( not ( = ?auto_69532 ?auto_69533 ) ) ( ON ?auto_69533 ?auto_69535 ) ( not ( = ?auto_69528 ?auto_69535 ) ) ( not ( = ?auto_69529 ?auto_69535 ) ) ( not ( = ?auto_69530 ?auto_69535 ) ) ( not ( = ?auto_69531 ?auto_69535 ) ) ( not ( = ?auto_69532 ?auto_69535 ) ) ( not ( = ?auto_69533 ?auto_69535 ) ) ( ON ?auto_69532 ?auto_69533 ) ( ON-TABLE ?auto_69534 ) ( ON ?auto_69535 ?auto_69534 ) ( not ( = ?auto_69534 ?auto_69535 ) ) ( not ( = ?auto_69534 ?auto_69533 ) ) ( not ( = ?auto_69534 ?auto_69532 ) ) ( not ( = ?auto_69528 ?auto_69534 ) ) ( not ( = ?auto_69529 ?auto_69534 ) ) ( not ( = ?auto_69530 ?auto_69534 ) ) ( not ( = ?auto_69531 ?auto_69534 ) ) ( ON ?auto_69531 ?auto_69532 ) ( ON ?auto_69530 ?auto_69531 ) ( ON ?auto_69529 ?auto_69530 ) ( CLEAR ?auto_69529 ) ( HOLDING ?auto_69528 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69528 )
      ( MAKE-6PILE ?auto_69528 ?auto_69529 ?auto_69530 ?auto_69531 ?auto_69532 ?auto_69533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_69536 - BLOCK
      ?auto_69537 - BLOCK
      ?auto_69538 - BLOCK
      ?auto_69539 - BLOCK
      ?auto_69540 - BLOCK
      ?auto_69541 - BLOCK
    )
    :vars
    (
      ?auto_69542 - BLOCK
      ?auto_69543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69536 ?auto_69537 ) ) ( not ( = ?auto_69536 ?auto_69538 ) ) ( not ( = ?auto_69536 ?auto_69539 ) ) ( not ( = ?auto_69536 ?auto_69540 ) ) ( not ( = ?auto_69536 ?auto_69541 ) ) ( not ( = ?auto_69537 ?auto_69538 ) ) ( not ( = ?auto_69537 ?auto_69539 ) ) ( not ( = ?auto_69537 ?auto_69540 ) ) ( not ( = ?auto_69537 ?auto_69541 ) ) ( not ( = ?auto_69538 ?auto_69539 ) ) ( not ( = ?auto_69538 ?auto_69540 ) ) ( not ( = ?auto_69538 ?auto_69541 ) ) ( not ( = ?auto_69539 ?auto_69540 ) ) ( not ( = ?auto_69539 ?auto_69541 ) ) ( not ( = ?auto_69540 ?auto_69541 ) ) ( ON ?auto_69541 ?auto_69542 ) ( not ( = ?auto_69536 ?auto_69542 ) ) ( not ( = ?auto_69537 ?auto_69542 ) ) ( not ( = ?auto_69538 ?auto_69542 ) ) ( not ( = ?auto_69539 ?auto_69542 ) ) ( not ( = ?auto_69540 ?auto_69542 ) ) ( not ( = ?auto_69541 ?auto_69542 ) ) ( ON ?auto_69540 ?auto_69541 ) ( ON-TABLE ?auto_69543 ) ( ON ?auto_69542 ?auto_69543 ) ( not ( = ?auto_69543 ?auto_69542 ) ) ( not ( = ?auto_69543 ?auto_69541 ) ) ( not ( = ?auto_69543 ?auto_69540 ) ) ( not ( = ?auto_69536 ?auto_69543 ) ) ( not ( = ?auto_69537 ?auto_69543 ) ) ( not ( = ?auto_69538 ?auto_69543 ) ) ( not ( = ?auto_69539 ?auto_69543 ) ) ( ON ?auto_69539 ?auto_69540 ) ( ON ?auto_69538 ?auto_69539 ) ( ON ?auto_69537 ?auto_69538 ) ( ON ?auto_69536 ?auto_69537 ) ( CLEAR ?auto_69536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69543 ?auto_69542 ?auto_69541 ?auto_69540 ?auto_69539 ?auto_69538 ?auto_69537 )
      ( MAKE-6PILE ?auto_69536 ?auto_69537 ?auto_69538 ?auto_69539 ?auto_69540 ?auto_69541 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69545 - BLOCK
    )
    :vars
    (
      ?auto_69546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69546 ?auto_69545 ) ( CLEAR ?auto_69546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69545 ) ( not ( = ?auto_69545 ?auto_69546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69546 ?auto_69545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69547 - BLOCK
    )
    :vars
    (
      ?auto_69548 - BLOCK
      ?auto_69549 - BLOCK
      ?auto_69550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69548 ?auto_69547 ) ( CLEAR ?auto_69548 ) ( ON-TABLE ?auto_69547 ) ( not ( = ?auto_69547 ?auto_69548 ) ) ( HOLDING ?auto_69549 ) ( CLEAR ?auto_69550 ) ( not ( = ?auto_69547 ?auto_69549 ) ) ( not ( = ?auto_69547 ?auto_69550 ) ) ( not ( = ?auto_69548 ?auto_69549 ) ) ( not ( = ?auto_69548 ?auto_69550 ) ) ( not ( = ?auto_69549 ?auto_69550 ) ) )
    :subtasks
    ( ( !STACK ?auto_69549 ?auto_69550 )
      ( MAKE-1PILE ?auto_69547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69551 - BLOCK
    )
    :vars
    (
      ?auto_69552 - BLOCK
      ?auto_69554 - BLOCK
      ?auto_69553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69552 ?auto_69551 ) ( ON-TABLE ?auto_69551 ) ( not ( = ?auto_69551 ?auto_69552 ) ) ( CLEAR ?auto_69554 ) ( not ( = ?auto_69551 ?auto_69553 ) ) ( not ( = ?auto_69551 ?auto_69554 ) ) ( not ( = ?auto_69552 ?auto_69553 ) ) ( not ( = ?auto_69552 ?auto_69554 ) ) ( not ( = ?auto_69553 ?auto_69554 ) ) ( ON ?auto_69553 ?auto_69552 ) ( CLEAR ?auto_69553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69551 ?auto_69552 )
      ( MAKE-1PILE ?auto_69551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69555 - BLOCK
    )
    :vars
    (
      ?auto_69557 - BLOCK
      ?auto_69558 - BLOCK
      ?auto_69556 - BLOCK
      ?auto_69561 - BLOCK
      ?auto_69559 - BLOCK
      ?auto_69560 - BLOCK
      ?auto_69562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69557 ?auto_69555 ) ( ON-TABLE ?auto_69555 ) ( not ( = ?auto_69555 ?auto_69557 ) ) ( not ( = ?auto_69555 ?auto_69558 ) ) ( not ( = ?auto_69555 ?auto_69556 ) ) ( not ( = ?auto_69557 ?auto_69558 ) ) ( not ( = ?auto_69557 ?auto_69556 ) ) ( not ( = ?auto_69558 ?auto_69556 ) ) ( ON ?auto_69558 ?auto_69557 ) ( CLEAR ?auto_69558 ) ( HOLDING ?auto_69556 ) ( CLEAR ?auto_69561 ) ( ON-TABLE ?auto_69559 ) ( ON ?auto_69560 ?auto_69559 ) ( ON ?auto_69562 ?auto_69560 ) ( ON ?auto_69561 ?auto_69562 ) ( not ( = ?auto_69559 ?auto_69560 ) ) ( not ( = ?auto_69559 ?auto_69562 ) ) ( not ( = ?auto_69559 ?auto_69561 ) ) ( not ( = ?auto_69559 ?auto_69556 ) ) ( not ( = ?auto_69560 ?auto_69562 ) ) ( not ( = ?auto_69560 ?auto_69561 ) ) ( not ( = ?auto_69560 ?auto_69556 ) ) ( not ( = ?auto_69562 ?auto_69561 ) ) ( not ( = ?auto_69562 ?auto_69556 ) ) ( not ( = ?auto_69561 ?auto_69556 ) ) ( not ( = ?auto_69555 ?auto_69561 ) ) ( not ( = ?auto_69555 ?auto_69559 ) ) ( not ( = ?auto_69555 ?auto_69560 ) ) ( not ( = ?auto_69555 ?auto_69562 ) ) ( not ( = ?auto_69557 ?auto_69561 ) ) ( not ( = ?auto_69557 ?auto_69559 ) ) ( not ( = ?auto_69557 ?auto_69560 ) ) ( not ( = ?auto_69557 ?auto_69562 ) ) ( not ( = ?auto_69558 ?auto_69561 ) ) ( not ( = ?auto_69558 ?auto_69559 ) ) ( not ( = ?auto_69558 ?auto_69560 ) ) ( not ( = ?auto_69558 ?auto_69562 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69559 ?auto_69560 ?auto_69562 ?auto_69561 ?auto_69556 )
      ( MAKE-1PILE ?auto_69555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69563 - BLOCK
    )
    :vars
    (
      ?auto_69569 - BLOCK
      ?auto_69567 - BLOCK
      ?auto_69565 - BLOCK
      ?auto_69570 - BLOCK
      ?auto_69566 - BLOCK
      ?auto_69564 - BLOCK
      ?auto_69568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69569 ?auto_69563 ) ( ON-TABLE ?auto_69563 ) ( not ( = ?auto_69563 ?auto_69569 ) ) ( not ( = ?auto_69563 ?auto_69567 ) ) ( not ( = ?auto_69563 ?auto_69565 ) ) ( not ( = ?auto_69569 ?auto_69567 ) ) ( not ( = ?auto_69569 ?auto_69565 ) ) ( not ( = ?auto_69567 ?auto_69565 ) ) ( ON ?auto_69567 ?auto_69569 ) ( CLEAR ?auto_69570 ) ( ON-TABLE ?auto_69566 ) ( ON ?auto_69564 ?auto_69566 ) ( ON ?auto_69568 ?auto_69564 ) ( ON ?auto_69570 ?auto_69568 ) ( not ( = ?auto_69566 ?auto_69564 ) ) ( not ( = ?auto_69566 ?auto_69568 ) ) ( not ( = ?auto_69566 ?auto_69570 ) ) ( not ( = ?auto_69566 ?auto_69565 ) ) ( not ( = ?auto_69564 ?auto_69568 ) ) ( not ( = ?auto_69564 ?auto_69570 ) ) ( not ( = ?auto_69564 ?auto_69565 ) ) ( not ( = ?auto_69568 ?auto_69570 ) ) ( not ( = ?auto_69568 ?auto_69565 ) ) ( not ( = ?auto_69570 ?auto_69565 ) ) ( not ( = ?auto_69563 ?auto_69570 ) ) ( not ( = ?auto_69563 ?auto_69566 ) ) ( not ( = ?auto_69563 ?auto_69564 ) ) ( not ( = ?auto_69563 ?auto_69568 ) ) ( not ( = ?auto_69569 ?auto_69570 ) ) ( not ( = ?auto_69569 ?auto_69566 ) ) ( not ( = ?auto_69569 ?auto_69564 ) ) ( not ( = ?auto_69569 ?auto_69568 ) ) ( not ( = ?auto_69567 ?auto_69570 ) ) ( not ( = ?auto_69567 ?auto_69566 ) ) ( not ( = ?auto_69567 ?auto_69564 ) ) ( not ( = ?auto_69567 ?auto_69568 ) ) ( ON ?auto_69565 ?auto_69567 ) ( CLEAR ?auto_69565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69563 ?auto_69569 ?auto_69567 )
      ( MAKE-1PILE ?auto_69563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69571 - BLOCK
    )
    :vars
    (
      ?auto_69577 - BLOCK
      ?auto_69575 - BLOCK
      ?auto_69573 - BLOCK
      ?auto_69578 - BLOCK
      ?auto_69576 - BLOCK
      ?auto_69572 - BLOCK
      ?auto_69574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69577 ?auto_69571 ) ( ON-TABLE ?auto_69571 ) ( not ( = ?auto_69571 ?auto_69577 ) ) ( not ( = ?auto_69571 ?auto_69575 ) ) ( not ( = ?auto_69571 ?auto_69573 ) ) ( not ( = ?auto_69577 ?auto_69575 ) ) ( not ( = ?auto_69577 ?auto_69573 ) ) ( not ( = ?auto_69575 ?auto_69573 ) ) ( ON ?auto_69575 ?auto_69577 ) ( ON-TABLE ?auto_69578 ) ( ON ?auto_69576 ?auto_69578 ) ( ON ?auto_69572 ?auto_69576 ) ( not ( = ?auto_69578 ?auto_69576 ) ) ( not ( = ?auto_69578 ?auto_69572 ) ) ( not ( = ?auto_69578 ?auto_69574 ) ) ( not ( = ?auto_69578 ?auto_69573 ) ) ( not ( = ?auto_69576 ?auto_69572 ) ) ( not ( = ?auto_69576 ?auto_69574 ) ) ( not ( = ?auto_69576 ?auto_69573 ) ) ( not ( = ?auto_69572 ?auto_69574 ) ) ( not ( = ?auto_69572 ?auto_69573 ) ) ( not ( = ?auto_69574 ?auto_69573 ) ) ( not ( = ?auto_69571 ?auto_69574 ) ) ( not ( = ?auto_69571 ?auto_69578 ) ) ( not ( = ?auto_69571 ?auto_69576 ) ) ( not ( = ?auto_69571 ?auto_69572 ) ) ( not ( = ?auto_69577 ?auto_69574 ) ) ( not ( = ?auto_69577 ?auto_69578 ) ) ( not ( = ?auto_69577 ?auto_69576 ) ) ( not ( = ?auto_69577 ?auto_69572 ) ) ( not ( = ?auto_69575 ?auto_69574 ) ) ( not ( = ?auto_69575 ?auto_69578 ) ) ( not ( = ?auto_69575 ?auto_69576 ) ) ( not ( = ?auto_69575 ?auto_69572 ) ) ( ON ?auto_69573 ?auto_69575 ) ( CLEAR ?auto_69573 ) ( HOLDING ?auto_69574 ) ( CLEAR ?auto_69572 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69578 ?auto_69576 ?auto_69572 ?auto_69574 )
      ( MAKE-1PILE ?auto_69571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69579 - BLOCK
    )
    :vars
    (
      ?auto_69582 - BLOCK
      ?auto_69586 - BLOCK
      ?auto_69585 - BLOCK
      ?auto_69580 - BLOCK
      ?auto_69584 - BLOCK
      ?auto_69581 - BLOCK
      ?auto_69583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69582 ?auto_69579 ) ( ON-TABLE ?auto_69579 ) ( not ( = ?auto_69579 ?auto_69582 ) ) ( not ( = ?auto_69579 ?auto_69586 ) ) ( not ( = ?auto_69579 ?auto_69585 ) ) ( not ( = ?auto_69582 ?auto_69586 ) ) ( not ( = ?auto_69582 ?auto_69585 ) ) ( not ( = ?auto_69586 ?auto_69585 ) ) ( ON ?auto_69586 ?auto_69582 ) ( ON-TABLE ?auto_69580 ) ( ON ?auto_69584 ?auto_69580 ) ( ON ?auto_69581 ?auto_69584 ) ( not ( = ?auto_69580 ?auto_69584 ) ) ( not ( = ?auto_69580 ?auto_69581 ) ) ( not ( = ?auto_69580 ?auto_69583 ) ) ( not ( = ?auto_69580 ?auto_69585 ) ) ( not ( = ?auto_69584 ?auto_69581 ) ) ( not ( = ?auto_69584 ?auto_69583 ) ) ( not ( = ?auto_69584 ?auto_69585 ) ) ( not ( = ?auto_69581 ?auto_69583 ) ) ( not ( = ?auto_69581 ?auto_69585 ) ) ( not ( = ?auto_69583 ?auto_69585 ) ) ( not ( = ?auto_69579 ?auto_69583 ) ) ( not ( = ?auto_69579 ?auto_69580 ) ) ( not ( = ?auto_69579 ?auto_69584 ) ) ( not ( = ?auto_69579 ?auto_69581 ) ) ( not ( = ?auto_69582 ?auto_69583 ) ) ( not ( = ?auto_69582 ?auto_69580 ) ) ( not ( = ?auto_69582 ?auto_69584 ) ) ( not ( = ?auto_69582 ?auto_69581 ) ) ( not ( = ?auto_69586 ?auto_69583 ) ) ( not ( = ?auto_69586 ?auto_69580 ) ) ( not ( = ?auto_69586 ?auto_69584 ) ) ( not ( = ?auto_69586 ?auto_69581 ) ) ( ON ?auto_69585 ?auto_69586 ) ( CLEAR ?auto_69581 ) ( ON ?auto_69583 ?auto_69585 ) ( CLEAR ?auto_69583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69579 ?auto_69582 ?auto_69586 ?auto_69585 )
      ( MAKE-1PILE ?auto_69579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69587 - BLOCK
    )
    :vars
    (
      ?auto_69591 - BLOCK
      ?auto_69592 - BLOCK
      ?auto_69593 - BLOCK
      ?auto_69594 - BLOCK
      ?auto_69589 - BLOCK
      ?auto_69590 - BLOCK
      ?auto_69588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69591 ?auto_69587 ) ( ON-TABLE ?auto_69587 ) ( not ( = ?auto_69587 ?auto_69591 ) ) ( not ( = ?auto_69587 ?auto_69592 ) ) ( not ( = ?auto_69587 ?auto_69593 ) ) ( not ( = ?auto_69591 ?auto_69592 ) ) ( not ( = ?auto_69591 ?auto_69593 ) ) ( not ( = ?auto_69592 ?auto_69593 ) ) ( ON ?auto_69592 ?auto_69591 ) ( ON-TABLE ?auto_69594 ) ( ON ?auto_69589 ?auto_69594 ) ( not ( = ?auto_69594 ?auto_69589 ) ) ( not ( = ?auto_69594 ?auto_69590 ) ) ( not ( = ?auto_69594 ?auto_69588 ) ) ( not ( = ?auto_69594 ?auto_69593 ) ) ( not ( = ?auto_69589 ?auto_69590 ) ) ( not ( = ?auto_69589 ?auto_69588 ) ) ( not ( = ?auto_69589 ?auto_69593 ) ) ( not ( = ?auto_69590 ?auto_69588 ) ) ( not ( = ?auto_69590 ?auto_69593 ) ) ( not ( = ?auto_69588 ?auto_69593 ) ) ( not ( = ?auto_69587 ?auto_69588 ) ) ( not ( = ?auto_69587 ?auto_69594 ) ) ( not ( = ?auto_69587 ?auto_69589 ) ) ( not ( = ?auto_69587 ?auto_69590 ) ) ( not ( = ?auto_69591 ?auto_69588 ) ) ( not ( = ?auto_69591 ?auto_69594 ) ) ( not ( = ?auto_69591 ?auto_69589 ) ) ( not ( = ?auto_69591 ?auto_69590 ) ) ( not ( = ?auto_69592 ?auto_69588 ) ) ( not ( = ?auto_69592 ?auto_69594 ) ) ( not ( = ?auto_69592 ?auto_69589 ) ) ( not ( = ?auto_69592 ?auto_69590 ) ) ( ON ?auto_69593 ?auto_69592 ) ( ON ?auto_69588 ?auto_69593 ) ( CLEAR ?auto_69588 ) ( HOLDING ?auto_69590 ) ( CLEAR ?auto_69589 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69594 ?auto_69589 ?auto_69590 )
      ( MAKE-1PILE ?auto_69587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69595 - BLOCK
    )
    :vars
    (
      ?auto_69602 - BLOCK
      ?auto_69599 - BLOCK
      ?auto_69601 - BLOCK
      ?auto_69600 - BLOCK
      ?auto_69596 - BLOCK
      ?auto_69597 - BLOCK
      ?auto_69598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69602 ?auto_69595 ) ( ON-TABLE ?auto_69595 ) ( not ( = ?auto_69595 ?auto_69602 ) ) ( not ( = ?auto_69595 ?auto_69599 ) ) ( not ( = ?auto_69595 ?auto_69601 ) ) ( not ( = ?auto_69602 ?auto_69599 ) ) ( not ( = ?auto_69602 ?auto_69601 ) ) ( not ( = ?auto_69599 ?auto_69601 ) ) ( ON ?auto_69599 ?auto_69602 ) ( ON-TABLE ?auto_69600 ) ( ON ?auto_69596 ?auto_69600 ) ( not ( = ?auto_69600 ?auto_69596 ) ) ( not ( = ?auto_69600 ?auto_69597 ) ) ( not ( = ?auto_69600 ?auto_69598 ) ) ( not ( = ?auto_69600 ?auto_69601 ) ) ( not ( = ?auto_69596 ?auto_69597 ) ) ( not ( = ?auto_69596 ?auto_69598 ) ) ( not ( = ?auto_69596 ?auto_69601 ) ) ( not ( = ?auto_69597 ?auto_69598 ) ) ( not ( = ?auto_69597 ?auto_69601 ) ) ( not ( = ?auto_69598 ?auto_69601 ) ) ( not ( = ?auto_69595 ?auto_69598 ) ) ( not ( = ?auto_69595 ?auto_69600 ) ) ( not ( = ?auto_69595 ?auto_69596 ) ) ( not ( = ?auto_69595 ?auto_69597 ) ) ( not ( = ?auto_69602 ?auto_69598 ) ) ( not ( = ?auto_69602 ?auto_69600 ) ) ( not ( = ?auto_69602 ?auto_69596 ) ) ( not ( = ?auto_69602 ?auto_69597 ) ) ( not ( = ?auto_69599 ?auto_69598 ) ) ( not ( = ?auto_69599 ?auto_69600 ) ) ( not ( = ?auto_69599 ?auto_69596 ) ) ( not ( = ?auto_69599 ?auto_69597 ) ) ( ON ?auto_69601 ?auto_69599 ) ( ON ?auto_69598 ?auto_69601 ) ( CLEAR ?auto_69596 ) ( ON ?auto_69597 ?auto_69598 ) ( CLEAR ?auto_69597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69595 ?auto_69602 ?auto_69599 ?auto_69601 ?auto_69598 )
      ( MAKE-1PILE ?auto_69595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69603 - BLOCK
    )
    :vars
    (
      ?auto_69605 - BLOCK
      ?auto_69608 - BLOCK
      ?auto_69610 - BLOCK
      ?auto_69609 - BLOCK
      ?auto_69607 - BLOCK
      ?auto_69604 - BLOCK
      ?auto_69606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69605 ?auto_69603 ) ( ON-TABLE ?auto_69603 ) ( not ( = ?auto_69603 ?auto_69605 ) ) ( not ( = ?auto_69603 ?auto_69608 ) ) ( not ( = ?auto_69603 ?auto_69610 ) ) ( not ( = ?auto_69605 ?auto_69608 ) ) ( not ( = ?auto_69605 ?auto_69610 ) ) ( not ( = ?auto_69608 ?auto_69610 ) ) ( ON ?auto_69608 ?auto_69605 ) ( ON-TABLE ?auto_69609 ) ( not ( = ?auto_69609 ?auto_69607 ) ) ( not ( = ?auto_69609 ?auto_69604 ) ) ( not ( = ?auto_69609 ?auto_69606 ) ) ( not ( = ?auto_69609 ?auto_69610 ) ) ( not ( = ?auto_69607 ?auto_69604 ) ) ( not ( = ?auto_69607 ?auto_69606 ) ) ( not ( = ?auto_69607 ?auto_69610 ) ) ( not ( = ?auto_69604 ?auto_69606 ) ) ( not ( = ?auto_69604 ?auto_69610 ) ) ( not ( = ?auto_69606 ?auto_69610 ) ) ( not ( = ?auto_69603 ?auto_69606 ) ) ( not ( = ?auto_69603 ?auto_69609 ) ) ( not ( = ?auto_69603 ?auto_69607 ) ) ( not ( = ?auto_69603 ?auto_69604 ) ) ( not ( = ?auto_69605 ?auto_69606 ) ) ( not ( = ?auto_69605 ?auto_69609 ) ) ( not ( = ?auto_69605 ?auto_69607 ) ) ( not ( = ?auto_69605 ?auto_69604 ) ) ( not ( = ?auto_69608 ?auto_69606 ) ) ( not ( = ?auto_69608 ?auto_69609 ) ) ( not ( = ?auto_69608 ?auto_69607 ) ) ( not ( = ?auto_69608 ?auto_69604 ) ) ( ON ?auto_69610 ?auto_69608 ) ( ON ?auto_69606 ?auto_69610 ) ( ON ?auto_69604 ?auto_69606 ) ( CLEAR ?auto_69604 ) ( HOLDING ?auto_69607 ) ( CLEAR ?auto_69609 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69609 ?auto_69607 )
      ( MAKE-1PILE ?auto_69603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71017 - BLOCK
    )
    :vars
    (
      ?auto_71020 - BLOCK
      ?auto_71019 - BLOCK
      ?auto_71022 - BLOCK
      ?auto_71021 - BLOCK
      ?auto_71023 - BLOCK
      ?auto_71018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71020 ?auto_71017 ) ( ON-TABLE ?auto_71017 ) ( not ( = ?auto_71017 ?auto_71020 ) ) ( not ( = ?auto_71017 ?auto_71019 ) ) ( not ( = ?auto_71017 ?auto_71022 ) ) ( not ( = ?auto_71020 ?auto_71019 ) ) ( not ( = ?auto_71020 ?auto_71022 ) ) ( not ( = ?auto_71019 ?auto_71022 ) ) ( ON ?auto_71019 ?auto_71020 ) ( not ( = ?auto_71021 ?auto_71023 ) ) ( not ( = ?auto_71021 ?auto_71018 ) ) ( not ( = ?auto_71021 ?auto_71022 ) ) ( not ( = ?auto_71023 ?auto_71018 ) ) ( not ( = ?auto_71023 ?auto_71022 ) ) ( not ( = ?auto_71018 ?auto_71022 ) ) ( not ( = ?auto_71017 ?auto_71018 ) ) ( not ( = ?auto_71017 ?auto_71021 ) ) ( not ( = ?auto_71017 ?auto_71023 ) ) ( not ( = ?auto_71020 ?auto_71018 ) ) ( not ( = ?auto_71020 ?auto_71021 ) ) ( not ( = ?auto_71020 ?auto_71023 ) ) ( not ( = ?auto_71019 ?auto_71018 ) ) ( not ( = ?auto_71019 ?auto_71021 ) ) ( not ( = ?auto_71019 ?auto_71023 ) ) ( ON ?auto_71022 ?auto_71019 ) ( ON ?auto_71018 ?auto_71022 ) ( ON ?auto_71023 ?auto_71018 ) ( ON ?auto_71021 ?auto_71023 ) ( CLEAR ?auto_71021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71017 ?auto_71020 ?auto_71019 ?auto_71022 ?auto_71018 ?auto_71023 )
      ( MAKE-1PILE ?auto_71017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69619 - BLOCK
    )
    :vars
    (
      ?auto_69623 - BLOCK
      ?auto_69626 - BLOCK
      ?auto_69625 - BLOCK
      ?auto_69622 - BLOCK
      ?auto_69624 - BLOCK
      ?auto_69620 - BLOCK
      ?auto_69621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69623 ?auto_69619 ) ( ON-TABLE ?auto_69619 ) ( not ( = ?auto_69619 ?auto_69623 ) ) ( not ( = ?auto_69619 ?auto_69626 ) ) ( not ( = ?auto_69619 ?auto_69625 ) ) ( not ( = ?auto_69623 ?auto_69626 ) ) ( not ( = ?auto_69623 ?auto_69625 ) ) ( not ( = ?auto_69626 ?auto_69625 ) ) ( ON ?auto_69626 ?auto_69623 ) ( not ( = ?auto_69622 ?auto_69624 ) ) ( not ( = ?auto_69622 ?auto_69620 ) ) ( not ( = ?auto_69622 ?auto_69621 ) ) ( not ( = ?auto_69622 ?auto_69625 ) ) ( not ( = ?auto_69624 ?auto_69620 ) ) ( not ( = ?auto_69624 ?auto_69621 ) ) ( not ( = ?auto_69624 ?auto_69625 ) ) ( not ( = ?auto_69620 ?auto_69621 ) ) ( not ( = ?auto_69620 ?auto_69625 ) ) ( not ( = ?auto_69621 ?auto_69625 ) ) ( not ( = ?auto_69619 ?auto_69621 ) ) ( not ( = ?auto_69619 ?auto_69622 ) ) ( not ( = ?auto_69619 ?auto_69624 ) ) ( not ( = ?auto_69619 ?auto_69620 ) ) ( not ( = ?auto_69623 ?auto_69621 ) ) ( not ( = ?auto_69623 ?auto_69622 ) ) ( not ( = ?auto_69623 ?auto_69624 ) ) ( not ( = ?auto_69623 ?auto_69620 ) ) ( not ( = ?auto_69626 ?auto_69621 ) ) ( not ( = ?auto_69626 ?auto_69622 ) ) ( not ( = ?auto_69626 ?auto_69624 ) ) ( not ( = ?auto_69626 ?auto_69620 ) ) ( ON ?auto_69625 ?auto_69626 ) ( ON ?auto_69621 ?auto_69625 ) ( ON ?auto_69620 ?auto_69621 ) ( ON ?auto_69624 ?auto_69620 ) ( CLEAR ?auto_69624 ) ( HOLDING ?auto_69622 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69622 )
      ( MAKE-1PILE ?auto_69619 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69627 - BLOCK
    )
    :vars
    (
      ?auto_69629 - BLOCK
      ?auto_69631 - BLOCK
      ?auto_69628 - BLOCK
      ?auto_69630 - BLOCK
      ?auto_69634 - BLOCK
      ?auto_69632 - BLOCK
      ?auto_69633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69629 ?auto_69627 ) ( ON-TABLE ?auto_69627 ) ( not ( = ?auto_69627 ?auto_69629 ) ) ( not ( = ?auto_69627 ?auto_69631 ) ) ( not ( = ?auto_69627 ?auto_69628 ) ) ( not ( = ?auto_69629 ?auto_69631 ) ) ( not ( = ?auto_69629 ?auto_69628 ) ) ( not ( = ?auto_69631 ?auto_69628 ) ) ( ON ?auto_69631 ?auto_69629 ) ( not ( = ?auto_69630 ?auto_69634 ) ) ( not ( = ?auto_69630 ?auto_69632 ) ) ( not ( = ?auto_69630 ?auto_69633 ) ) ( not ( = ?auto_69630 ?auto_69628 ) ) ( not ( = ?auto_69634 ?auto_69632 ) ) ( not ( = ?auto_69634 ?auto_69633 ) ) ( not ( = ?auto_69634 ?auto_69628 ) ) ( not ( = ?auto_69632 ?auto_69633 ) ) ( not ( = ?auto_69632 ?auto_69628 ) ) ( not ( = ?auto_69633 ?auto_69628 ) ) ( not ( = ?auto_69627 ?auto_69633 ) ) ( not ( = ?auto_69627 ?auto_69630 ) ) ( not ( = ?auto_69627 ?auto_69634 ) ) ( not ( = ?auto_69627 ?auto_69632 ) ) ( not ( = ?auto_69629 ?auto_69633 ) ) ( not ( = ?auto_69629 ?auto_69630 ) ) ( not ( = ?auto_69629 ?auto_69634 ) ) ( not ( = ?auto_69629 ?auto_69632 ) ) ( not ( = ?auto_69631 ?auto_69633 ) ) ( not ( = ?auto_69631 ?auto_69630 ) ) ( not ( = ?auto_69631 ?auto_69634 ) ) ( not ( = ?auto_69631 ?auto_69632 ) ) ( ON ?auto_69628 ?auto_69631 ) ( ON ?auto_69633 ?auto_69628 ) ( ON ?auto_69632 ?auto_69633 ) ( ON ?auto_69634 ?auto_69632 ) ( ON ?auto_69630 ?auto_69634 ) ( CLEAR ?auto_69630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69627 ?auto_69629 ?auto_69631 ?auto_69628 ?auto_69633 ?auto_69632 ?auto_69634 )
      ( MAKE-1PILE ?auto_69627 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69642 - BLOCK
      ?auto_69643 - BLOCK
      ?auto_69644 - BLOCK
      ?auto_69645 - BLOCK
      ?auto_69646 - BLOCK
      ?auto_69647 - BLOCK
      ?auto_69648 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69648 ) ( CLEAR ?auto_69647 ) ( ON-TABLE ?auto_69642 ) ( ON ?auto_69643 ?auto_69642 ) ( ON ?auto_69644 ?auto_69643 ) ( ON ?auto_69645 ?auto_69644 ) ( ON ?auto_69646 ?auto_69645 ) ( ON ?auto_69647 ?auto_69646 ) ( not ( = ?auto_69642 ?auto_69643 ) ) ( not ( = ?auto_69642 ?auto_69644 ) ) ( not ( = ?auto_69642 ?auto_69645 ) ) ( not ( = ?auto_69642 ?auto_69646 ) ) ( not ( = ?auto_69642 ?auto_69647 ) ) ( not ( = ?auto_69642 ?auto_69648 ) ) ( not ( = ?auto_69643 ?auto_69644 ) ) ( not ( = ?auto_69643 ?auto_69645 ) ) ( not ( = ?auto_69643 ?auto_69646 ) ) ( not ( = ?auto_69643 ?auto_69647 ) ) ( not ( = ?auto_69643 ?auto_69648 ) ) ( not ( = ?auto_69644 ?auto_69645 ) ) ( not ( = ?auto_69644 ?auto_69646 ) ) ( not ( = ?auto_69644 ?auto_69647 ) ) ( not ( = ?auto_69644 ?auto_69648 ) ) ( not ( = ?auto_69645 ?auto_69646 ) ) ( not ( = ?auto_69645 ?auto_69647 ) ) ( not ( = ?auto_69645 ?auto_69648 ) ) ( not ( = ?auto_69646 ?auto_69647 ) ) ( not ( = ?auto_69646 ?auto_69648 ) ) ( not ( = ?auto_69647 ?auto_69648 ) ) )
    :subtasks
    ( ( !STACK ?auto_69648 ?auto_69647 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69649 - BLOCK
      ?auto_69650 - BLOCK
      ?auto_69651 - BLOCK
      ?auto_69652 - BLOCK
      ?auto_69653 - BLOCK
      ?auto_69654 - BLOCK
      ?auto_69655 - BLOCK
    )
    :vars
    (
      ?auto_69656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69654 ) ( ON-TABLE ?auto_69649 ) ( ON ?auto_69650 ?auto_69649 ) ( ON ?auto_69651 ?auto_69650 ) ( ON ?auto_69652 ?auto_69651 ) ( ON ?auto_69653 ?auto_69652 ) ( ON ?auto_69654 ?auto_69653 ) ( not ( = ?auto_69649 ?auto_69650 ) ) ( not ( = ?auto_69649 ?auto_69651 ) ) ( not ( = ?auto_69649 ?auto_69652 ) ) ( not ( = ?auto_69649 ?auto_69653 ) ) ( not ( = ?auto_69649 ?auto_69654 ) ) ( not ( = ?auto_69649 ?auto_69655 ) ) ( not ( = ?auto_69650 ?auto_69651 ) ) ( not ( = ?auto_69650 ?auto_69652 ) ) ( not ( = ?auto_69650 ?auto_69653 ) ) ( not ( = ?auto_69650 ?auto_69654 ) ) ( not ( = ?auto_69650 ?auto_69655 ) ) ( not ( = ?auto_69651 ?auto_69652 ) ) ( not ( = ?auto_69651 ?auto_69653 ) ) ( not ( = ?auto_69651 ?auto_69654 ) ) ( not ( = ?auto_69651 ?auto_69655 ) ) ( not ( = ?auto_69652 ?auto_69653 ) ) ( not ( = ?auto_69652 ?auto_69654 ) ) ( not ( = ?auto_69652 ?auto_69655 ) ) ( not ( = ?auto_69653 ?auto_69654 ) ) ( not ( = ?auto_69653 ?auto_69655 ) ) ( not ( = ?auto_69654 ?auto_69655 ) ) ( ON ?auto_69655 ?auto_69656 ) ( CLEAR ?auto_69655 ) ( HAND-EMPTY ) ( not ( = ?auto_69649 ?auto_69656 ) ) ( not ( = ?auto_69650 ?auto_69656 ) ) ( not ( = ?auto_69651 ?auto_69656 ) ) ( not ( = ?auto_69652 ?auto_69656 ) ) ( not ( = ?auto_69653 ?auto_69656 ) ) ( not ( = ?auto_69654 ?auto_69656 ) ) ( not ( = ?auto_69655 ?auto_69656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69655 ?auto_69656 )
      ( MAKE-7PILE ?auto_69649 ?auto_69650 ?auto_69651 ?auto_69652 ?auto_69653 ?auto_69654 ?auto_69655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69657 - BLOCK
      ?auto_69658 - BLOCK
      ?auto_69659 - BLOCK
      ?auto_69660 - BLOCK
      ?auto_69661 - BLOCK
      ?auto_69662 - BLOCK
      ?auto_69663 - BLOCK
    )
    :vars
    (
      ?auto_69664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69657 ) ( ON ?auto_69658 ?auto_69657 ) ( ON ?auto_69659 ?auto_69658 ) ( ON ?auto_69660 ?auto_69659 ) ( ON ?auto_69661 ?auto_69660 ) ( not ( = ?auto_69657 ?auto_69658 ) ) ( not ( = ?auto_69657 ?auto_69659 ) ) ( not ( = ?auto_69657 ?auto_69660 ) ) ( not ( = ?auto_69657 ?auto_69661 ) ) ( not ( = ?auto_69657 ?auto_69662 ) ) ( not ( = ?auto_69657 ?auto_69663 ) ) ( not ( = ?auto_69658 ?auto_69659 ) ) ( not ( = ?auto_69658 ?auto_69660 ) ) ( not ( = ?auto_69658 ?auto_69661 ) ) ( not ( = ?auto_69658 ?auto_69662 ) ) ( not ( = ?auto_69658 ?auto_69663 ) ) ( not ( = ?auto_69659 ?auto_69660 ) ) ( not ( = ?auto_69659 ?auto_69661 ) ) ( not ( = ?auto_69659 ?auto_69662 ) ) ( not ( = ?auto_69659 ?auto_69663 ) ) ( not ( = ?auto_69660 ?auto_69661 ) ) ( not ( = ?auto_69660 ?auto_69662 ) ) ( not ( = ?auto_69660 ?auto_69663 ) ) ( not ( = ?auto_69661 ?auto_69662 ) ) ( not ( = ?auto_69661 ?auto_69663 ) ) ( not ( = ?auto_69662 ?auto_69663 ) ) ( ON ?auto_69663 ?auto_69664 ) ( CLEAR ?auto_69663 ) ( not ( = ?auto_69657 ?auto_69664 ) ) ( not ( = ?auto_69658 ?auto_69664 ) ) ( not ( = ?auto_69659 ?auto_69664 ) ) ( not ( = ?auto_69660 ?auto_69664 ) ) ( not ( = ?auto_69661 ?auto_69664 ) ) ( not ( = ?auto_69662 ?auto_69664 ) ) ( not ( = ?auto_69663 ?auto_69664 ) ) ( HOLDING ?auto_69662 ) ( CLEAR ?auto_69661 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69657 ?auto_69658 ?auto_69659 ?auto_69660 ?auto_69661 ?auto_69662 )
      ( MAKE-7PILE ?auto_69657 ?auto_69658 ?auto_69659 ?auto_69660 ?auto_69661 ?auto_69662 ?auto_69663 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69665 - BLOCK
      ?auto_69666 - BLOCK
      ?auto_69667 - BLOCK
      ?auto_69668 - BLOCK
      ?auto_69669 - BLOCK
      ?auto_69670 - BLOCK
      ?auto_69671 - BLOCK
    )
    :vars
    (
      ?auto_69672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69665 ) ( ON ?auto_69666 ?auto_69665 ) ( ON ?auto_69667 ?auto_69666 ) ( ON ?auto_69668 ?auto_69667 ) ( ON ?auto_69669 ?auto_69668 ) ( not ( = ?auto_69665 ?auto_69666 ) ) ( not ( = ?auto_69665 ?auto_69667 ) ) ( not ( = ?auto_69665 ?auto_69668 ) ) ( not ( = ?auto_69665 ?auto_69669 ) ) ( not ( = ?auto_69665 ?auto_69670 ) ) ( not ( = ?auto_69665 ?auto_69671 ) ) ( not ( = ?auto_69666 ?auto_69667 ) ) ( not ( = ?auto_69666 ?auto_69668 ) ) ( not ( = ?auto_69666 ?auto_69669 ) ) ( not ( = ?auto_69666 ?auto_69670 ) ) ( not ( = ?auto_69666 ?auto_69671 ) ) ( not ( = ?auto_69667 ?auto_69668 ) ) ( not ( = ?auto_69667 ?auto_69669 ) ) ( not ( = ?auto_69667 ?auto_69670 ) ) ( not ( = ?auto_69667 ?auto_69671 ) ) ( not ( = ?auto_69668 ?auto_69669 ) ) ( not ( = ?auto_69668 ?auto_69670 ) ) ( not ( = ?auto_69668 ?auto_69671 ) ) ( not ( = ?auto_69669 ?auto_69670 ) ) ( not ( = ?auto_69669 ?auto_69671 ) ) ( not ( = ?auto_69670 ?auto_69671 ) ) ( ON ?auto_69671 ?auto_69672 ) ( not ( = ?auto_69665 ?auto_69672 ) ) ( not ( = ?auto_69666 ?auto_69672 ) ) ( not ( = ?auto_69667 ?auto_69672 ) ) ( not ( = ?auto_69668 ?auto_69672 ) ) ( not ( = ?auto_69669 ?auto_69672 ) ) ( not ( = ?auto_69670 ?auto_69672 ) ) ( not ( = ?auto_69671 ?auto_69672 ) ) ( CLEAR ?auto_69669 ) ( ON ?auto_69670 ?auto_69671 ) ( CLEAR ?auto_69670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69672 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69672 ?auto_69671 )
      ( MAKE-7PILE ?auto_69665 ?auto_69666 ?auto_69667 ?auto_69668 ?auto_69669 ?auto_69670 ?auto_69671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69673 - BLOCK
      ?auto_69674 - BLOCK
      ?auto_69675 - BLOCK
      ?auto_69676 - BLOCK
      ?auto_69677 - BLOCK
      ?auto_69678 - BLOCK
      ?auto_69679 - BLOCK
    )
    :vars
    (
      ?auto_69680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69673 ) ( ON ?auto_69674 ?auto_69673 ) ( ON ?auto_69675 ?auto_69674 ) ( ON ?auto_69676 ?auto_69675 ) ( not ( = ?auto_69673 ?auto_69674 ) ) ( not ( = ?auto_69673 ?auto_69675 ) ) ( not ( = ?auto_69673 ?auto_69676 ) ) ( not ( = ?auto_69673 ?auto_69677 ) ) ( not ( = ?auto_69673 ?auto_69678 ) ) ( not ( = ?auto_69673 ?auto_69679 ) ) ( not ( = ?auto_69674 ?auto_69675 ) ) ( not ( = ?auto_69674 ?auto_69676 ) ) ( not ( = ?auto_69674 ?auto_69677 ) ) ( not ( = ?auto_69674 ?auto_69678 ) ) ( not ( = ?auto_69674 ?auto_69679 ) ) ( not ( = ?auto_69675 ?auto_69676 ) ) ( not ( = ?auto_69675 ?auto_69677 ) ) ( not ( = ?auto_69675 ?auto_69678 ) ) ( not ( = ?auto_69675 ?auto_69679 ) ) ( not ( = ?auto_69676 ?auto_69677 ) ) ( not ( = ?auto_69676 ?auto_69678 ) ) ( not ( = ?auto_69676 ?auto_69679 ) ) ( not ( = ?auto_69677 ?auto_69678 ) ) ( not ( = ?auto_69677 ?auto_69679 ) ) ( not ( = ?auto_69678 ?auto_69679 ) ) ( ON ?auto_69679 ?auto_69680 ) ( not ( = ?auto_69673 ?auto_69680 ) ) ( not ( = ?auto_69674 ?auto_69680 ) ) ( not ( = ?auto_69675 ?auto_69680 ) ) ( not ( = ?auto_69676 ?auto_69680 ) ) ( not ( = ?auto_69677 ?auto_69680 ) ) ( not ( = ?auto_69678 ?auto_69680 ) ) ( not ( = ?auto_69679 ?auto_69680 ) ) ( ON ?auto_69678 ?auto_69679 ) ( CLEAR ?auto_69678 ) ( ON-TABLE ?auto_69680 ) ( HOLDING ?auto_69677 ) ( CLEAR ?auto_69676 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69673 ?auto_69674 ?auto_69675 ?auto_69676 ?auto_69677 )
      ( MAKE-7PILE ?auto_69673 ?auto_69674 ?auto_69675 ?auto_69676 ?auto_69677 ?auto_69678 ?auto_69679 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69681 - BLOCK
      ?auto_69682 - BLOCK
      ?auto_69683 - BLOCK
      ?auto_69684 - BLOCK
      ?auto_69685 - BLOCK
      ?auto_69686 - BLOCK
      ?auto_69687 - BLOCK
    )
    :vars
    (
      ?auto_69688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69681 ) ( ON ?auto_69682 ?auto_69681 ) ( ON ?auto_69683 ?auto_69682 ) ( ON ?auto_69684 ?auto_69683 ) ( not ( = ?auto_69681 ?auto_69682 ) ) ( not ( = ?auto_69681 ?auto_69683 ) ) ( not ( = ?auto_69681 ?auto_69684 ) ) ( not ( = ?auto_69681 ?auto_69685 ) ) ( not ( = ?auto_69681 ?auto_69686 ) ) ( not ( = ?auto_69681 ?auto_69687 ) ) ( not ( = ?auto_69682 ?auto_69683 ) ) ( not ( = ?auto_69682 ?auto_69684 ) ) ( not ( = ?auto_69682 ?auto_69685 ) ) ( not ( = ?auto_69682 ?auto_69686 ) ) ( not ( = ?auto_69682 ?auto_69687 ) ) ( not ( = ?auto_69683 ?auto_69684 ) ) ( not ( = ?auto_69683 ?auto_69685 ) ) ( not ( = ?auto_69683 ?auto_69686 ) ) ( not ( = ?auto_69683 ?auto_69687 ) ) ( not ( = ?auto_69684 ?auto_69685 ) ) ( not ( = ?auto_69684 ?auto_69686 ) ) ( not ( = ?auto_69684 ?auto_69687 ) ) ( not ( = ?auto_69685 ?auto_69686 ) ) ( not ( = ?auto_69685 ?auto_69687 ) ) ( not ( = ?auto_69686 ?auto_69687 ) ) ( ON ?auto_69687 ?auto_69688 ) ( not ( = ?auto_69681 ?auto_69688 ) ) ( not ( = ?auto_69682 ?auto_69688 ) ) ( not ( = ?auto_69683 ?auto_69688 ) ) ( not ( = ?auto_69684 ?auto_69688 ) ) ( not ( = ?auto_69685 ?auto_69688 ) ) ( not ( = ?auto_69686 ?auto_69688 ) ) ( not ( = ?auto_69687 ?auto_69688 ) ) ( ON ?auto_69686 ?auto_69687 ) ( ON-TABLE ?auto_69688 ) ( CLEAR ?auto_69684 ) ( ON ?auto_69685 ?auto_69686 ) ( CLEAR ?auto_69685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69688 ?auto_69687 ?auto_69686 )
      ( MAKE-7PILE ?auto_69681 ?auto_69682 ?auto_69683 ?auto_69684 ?auto_69685 ?auto_69686 ?auto_69687 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69689 - BLOCK
      ?auto_69690 - BLOCK
      ?auto_69691 - BLOCK
      ?auto_69692 - BLOCK
      ?auto_69693 - BLOCK
      ?auto_69694 - BLOCK
      ?auto_69695 - BLOCK
    )
    :vars
    (
      ?auto_69696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69689 ) ( ON ?auto_69690 ?auto_69689 ) ( ON ?auto_69691 ?auto_69690 ) ( not ( = ?auto_69689 ?auto_69690 ) ) ( not ( = ?auto_69689 ?auto_69691 ) ) ( not ( = ?auto_69689 ?auto_69692 ) ) ( not ( = ?auto_69689 ?auto_69693 ) ) ( not ( = ?auto_69689 ?auto_69694 ) ) ( not ( = ?auto_69689 ?auto_69695 ) ) ( not ( = ?auto_69690 ?auto_69691 ) ) ( not ( = ?auto_69690 ?auto_69692 ) ) ( not ( = ?auto_69690 ?auto_69693 ) ) ( not ( = ?auto_69690 ?auto_69694 ) ) ( not ( = ?auto_69690 ?auto_69695 ) ) ( not ( = ?auto_69691 ?auto_69692 ) ) ( not ( = ?auto_69691 ?auto_69693 ) ) ( not ( = ?auto_69691 ?auto_69694 ) ) ( not ( = ?auto_69691 ?auto_69695 ) ) ( not ( = ?auto_69692 ?auto_69693 ) ) ( not ( = ?auto_69692 ?auto_69694 ) ) ( not ( = ?auto_69692 ?auto_69695 ) ) ( not ( = ?auto_69693 ?auto_69694 ) ) ( not ( = ?auto_69693 ?auto_69695 ) ) ( not ( = ?auto_69694 ?auto_69695 ) ) ( ON ?auto_69695 ?auto_69696 ) ( not ( = ?auto_69689 ?auto_69696 ) ) ( not ( = ?auto_69690 ?auto_69696 ) ) ( not ( = ?auto_69691 ?auto_69696 ) ) ( not ( = ?auto_69692 ?auto_69696 ) ) ( not ( = ?auto_69693 ?auto_69696 ) ) ( not ( = ?auto_69694 ?auto_69696 ) ) ( not ( = ?auto_69695 ?auto_69696 ) ) ( ON ?auto_69694 ?auto_69695 ) ( ON-TABLE ?auto_69696 ) ( ON ?auto_69693 ?auto_69694 ) ( CLEAR ?auto_69693 ) ( HOLDING ?auto_69692 ) ( CLEAR ?auto_69691 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69689 ?auto_69690 ?auto_69691 ?auto_69692 )
      ( MAKE-7PILE ?auto_69689 ?auto_69690 ?auto_69691 ?auto_69692 ?auto_69693 ?auto_69694 ?auto_69695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69697 - BLOCK
      ?auto_69698 - BLOCK
      ?auto_69699 - BLOCK
      ?auto_69700 - BLOCK
      ?auto_69701 - BLOCK
      ?auto_69702 - BLOCK
      ?auto_69703 - BLOCK
    )
    :vars
    (
      ?auto_69704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69697 ) ( ON ?auto_69698 ?auto_69697 ) ( ON ?auto_69699 ?auto_69698 ) ( not ( = ?auto_69697 ?auto_69698 ) ) ( not ( = ?auto_69697 ?auto_69699 ) ) ( not ( = ?auto_69697 ?auto_69700 ) ) ( not ( = ?auto_69697 ?auto_69701 ) ) ( not ( = ?auto_69697 ?auto_69702 ) ) ( not ( = ?auto_69697 ?auto_69703 ) ) ( not ( = ?auto_69698 ?auto_69699 ) ) ( not ( = ?auto_69698 ?auto_69700 ) ) ( not ( = ?auto_69698 ?auto_69701 ) ) ( not ( = ?auto_69698 ?auto_69702 ) ) ( not ( = ?auto_69698 ?auto_69703 ) ) ( not ( = ?auto_69699 ?auto_69700 ) ) ( not ( = ?auto_69699 ?auto_69701 ) ) ( not ( = ?auto_69699 ?auto_69702 ) ) ( not ( = ?auto_69699 ?auto_69703 ) ) ( not ( = ?auto_69700 ?auto_69701 ) ) ( not ( = ?auto_69700 ?auto_69702 ) ) ( not ( = ?auto_69700 ?auto_69703 ) ) ( not ( = ?auto_69701 ?auto_69702 ) ) ( not ( = ?auto_69701 ?auto_69703 ) ) ( not ( = ?auto_69702 ?auto_69703 ) ) ( ON ?auto_69703 ?auto_69704 ) ( not ( = ?auto_69697 ?auto_69704 ) ) ( not ( = ?auto_69698 ?auto_69704 ) ) ( not ( = ?auto_69699 ?auto_69704 ) ) ( not ( = ?auto_69700 ?auto_69704 ) ) ( not ( = ?auto_69701 ?auto_69704 ) ) ( not ( = ?auto_69702 ?auto_69704 ) ) ( not ( = ?auto_69703 ?auto_69704 ) ) ( ON ?auto_69702 ?auto_69703 ) ( ON-TABLE ?auto_69704 ) ( ON ?auto_69701 ?auto_69702 ) ( CLEAR ?auto_69699 ) ( ON ?auto_69700 ?auto_69701 ) ( CLEAR ?auto_69700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69704 ?auto_69703 ?auto_69702 ?auto_69701 )
      ( MAKE-7PILE ?auto_69697 ?auto_69698 ?auto_69699 ?auto_69700 ?auto_69701 ?auto_69702 ?auto_69703 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69705 - BLOCK
      ?auto_69706 - BLOCK
      ?auto_69707 - BLOCK
      ?auto_69708 - BLOCK
      ?auto_69709 - BLOCK
      ?auto_69710 - BLOCK
      ?auto_69711 - BLOCK
    )
    :vars
    (
      ?auto_69712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69705 ) ( ON ?auto_69706 ?auto_69705 ) ( not ( = ?auto_69705 ?auto_69706 ) ) ( not ( = ?auto_69705 ?auto_69707 ) ) ( not ( = ?auto_69705 ?auto_69708 ) ) ( not ( = ?auto_69705 ?auto_69709 ) ) ( not ( = ?auto_69705 ?auto_69710 ) ) ( not ( = ?auto_69705 ?auto_69711 ) ) ( not ( = ?auto_69706 ?auto_69707 ) ) ( not ( = ?auto_69706 ?auto_69708 ) ) ( not ( = ?auto_69706 ?auto_69709 ) ) ( not ( = ?auto_69706 ?auto_69710 ) ) ( not ( = ?auto_69706 ?auto_69711 ) ) ( not ( = ?auto_69707 ?auto_69708 ) ) ( not ( = ?auto_69707 ?auto_69709 ) ) ( not ( = ?auto_69707 ?auto_69710 ) ) ( not ( = ?auto_69707 ?auto_69711 ) ) ( not ( = ?auto_69708 ?auto_69709 ) ) ( not ( = ?auto_69708 ?auto_69710 ) ) ( not ( = ?auto_69708 ?auto_69711 ) ) ( not ( = ?auto_69709 ?auto_69710 ) ) ( not ( = ?auto_69709 ?auto_69711 ) ) ( not ( = ?auto_69710 ?auto_69711 ) ) ( ON ?auto_69711 ?auto_69712 ) ( not ( = ?auto_69705 ?auto_69712 ) ) ( not ( = ?auto_69706 ?auto_69712 ) ) ( not ( = ?auto_69707 ?auto_69712 ) ) ( not ( = ?auto_69708 ?auto_69712 ) ) ( not ( = ?auto_69709 ?auto_69712 ) ) ( not ( = ?auto_69710 ?auto_69712 ) ) ( not ( = ?auto_69711 ?auto_69712 ) ) ( ON ?auto_69710 ?auto_69711 ) ( ON-TABLE ?auto_69712 ) ( ON ?auto_69709 ?auto_69710 ) ( ON ?auto_69708 ?auto_69709 ) ( CLEAR ?auto_69708 ) ( HOLDING ?auto_69707 ) ( CLEAR ?auto_69706 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69705 ?auto_69706 ?auto_69707 )
      ( MAKE-7PILE ?auto_69705 ?auto_69706 ?auto_69707 ?auto_69708 ?auto_69709 ?auto_69710 ?auto_69711 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69713 - BLOCK
      ?auto_69714 - BLOCK
      ?auto_69715 - BLOCK
      ?auto_69716 - BLOCK
      ?auto_69717 - BLOCK
      ?auto_69718 - BLOCK
      ?auto_69719 - BLOCK
    )
    :vars
    (
      ?auto_69720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69713 ) ( ON ?auto_69714 ?auto_69713 ) ( not ( = ?auto_69713 ?auto_69714 ) ) ( not ( = ?auto_69713 ?auto_69715 ) ) ( not ( = ?auto_69713 ?auto_69716 ) ) ( not ( = ?auto_69713 ?auto_69717 ) ) ( not ( = ?auto_69713 ?auto_69718 ) ) ( not ( = ?auto_69713 ?auto_69719 ) ) ( not ( = ?auto_69714 ?auto_69715 ) ) ( not ( = ?auto_69714 ?auto_69716 ) ) ( not ( = ?auto_69714 ?auto_69717 ) ) ( not ( = ?auto_69714 ?auto_69718 ) ) ( not ( = ?auto_69714 ?auto_69719 ) ) ( not ( = ?auto_69715 ?auto_69716 ) ) ( not ( = ?auto_69715 ?auto_69717 ) ) ( not ( = ?auto_69715 ?auto_69718 ) ) ( not ( = ?auto_69715 ?auto_69719 ) ) ( not ( = ?auto_69716 ?auto_69717 ) ) ( not ( = ?auto_69716 ?auto_69718 ) ) ( not ( = ?auto_69716 ?auto_69719 ) ) ( not ( = ?auto_69717 ?auto_69718 ) ) ( not ( = ?auto_69717 ?auto_69719 ) ) ( not ( = ?auto_69718 ?auto_69719 ) ) ( ON ?auto_69719 ?auto_69720 ) ( not ( = ?auto_69713 ?auto_69720 ) ) ( not ( = ?auto_69714 ?auto_69720 ) ) ( not ( = ?auto_69715 ?auto_69720 ) ) ( not ( = ?auto_69716 ?auto_69720 ) ) ( not ( = ?auto_69717 ?auto_69720 ) ) ( not ( = ?auto_69718 ?auto_69720 ) ) ( not ( = ?auto_69719 ?auto_69720 ) ) ( ON ?auto_69718 ?auto_69719 ) ( ON-TABLE ?auto_69720 ) ( ON ?auto_69717 ?auto_69718 ) ( ON ?auto_69716 ?auto_69717 ) ( CLEAR ?auto_69714 ) ( ON ?auto_69715 ?auto_69716 ) ( CLEAR ?auto_69715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69720 ?auto_69719 ?auto_69718 ?auto_69717 ?auto_69716 )
      ( MAKE-7PILE ?auto_69713 ?auto_69714 ?auto_69715 ?auto_69716 ?auto_69717 ?auto_69718 ?auto_69719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69721 - BLOCK
      ?auto_69722 - BLOCK
      ?auto_69723 - BLOCK
      ?auto_69724 - BLOCK
      ?auto_69725 - BLOCK
      ?auto_69726 - BLOCK
      ?auto_69727 - BLOCK
    )
    :vars
    (
      ?auto_69728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69721 ) ( not ( = ?auto_69721 ?auto_69722 ) ) ( not ( = ?auto_69721 ?auto_69723 ) ) ( not ( = ?auto_69721 ?auto_69724 ) ) ( not ( = ?auto_69721 ?auto_69725 ) ) ( not ( = ?auto_69721 ?auto_69726 ) ) ( not ( = ?auto_69721 ?auto_69727 ) ) ( not ( = ?auto_69722 ?auto_69723 ) ) ( not ( = ?auto_69722 ?auto_69724 ) ) ( not ( = ?auto_69722 ?auto_69725 ) ) ( not ( = ?auto_69722 ?auto_69726 ) ) ( not ( = ?auto_69722 ?auto_69727 ) ) ( not ( = ?auto_69723 ?auto_69724 ) ) ( not ( = ?auto_69723 ?auto_69725 ) ) ( not ( = ?auto_69723 ?auto_69726 ) ) ( not ( = ?auto_69723 ?auto_69727 ) ) ( not ( = ?auto_69724 ?auto_69725 ) ) ( not ( = ?auto_69724 ?auto_69726 ) ) ( not ( = ?auto_69724 ?auto_69727 ) ) ( not ( = ?auto_69725 ?auto_69726 ) ) ( not ( = ?auto_69725 ?auto_69727 ) ) ( not ( = ?auto_69726 ?auto_69727 ) ) ( ON ?auto_69727 ?auto_69728 ) ( not ( = ?auto_69721 ?auto_69728 ) ) ( not ( = ?auto_69722 ?auto_69728 ) ) ( not ( = ?auto_69723 ?auto_69728 ) ) ( not ( = ?auto_69724 ?auto_69728 ) ) ( not ( = ?auto_69725 ?auto_69728 ) ) ( not ( = ?auto_69726 ?auto_69728 ) ) ( not ( = ?auto_69727 ?auto_69728 ) ) ( ON ?auto_69726 ?auto_69727 ) ( ON-TABLE ?auto_69728 ) ( ON ?auto_69725 ?auto_69726 ) ( ON ?auto_69724 ?auto_69725 ) ( ON ?auto_69723 ?auto_69724 ) ( CLEAR ?auto_69723 ) ( HOLDING ?auto_69722 ) ( CLEAR ?auto_69721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69721 ?auto_69722 )
      ( MAKE-7PILE ?auto_69721 ?auto_69722 ?auto_69723 ?auto_69724 ?auto_69725 ?auto_69726 ?auto_69727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69729 - BLOCK
      ?auto_69730 - BLOCK
      ?auto_69731 - BLOCK
      ?auto_69732 - BLOCK
      ?auto_69733 - BLOCK
      ?auto_69734 - BLOCK
      ?auto_69735 - BLOCK
    )
    :vars
    (
      ?auto_69736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69729 ) ( not ( = ?auto_69729 ?auto_69730 ) ) ( not ( = ?auto_69729 ?auto_69731 ) ) ( not ( = ?auto_69729 ?auto_69732 ) ) ( not ( = ?auto_69729 ?auto_69733 ) ) ( not ( = ?auto_69729 ?auto_69734 ) ) ( not ( = ?auto_69729 ?auto_69735 ) ) ( not ( = ?auto_69730 ?auto_69731 ) ) ( not ( = ?auto_69730 ?auto_69732 ) ) ( not ( = ?auto_69730 ?auto_69733 ) ) ( not ( = ?auto_69730 ?auto_69734 ) ) ( not ( = ?auto_69730 ?auto_69735 ) ) ( not ( = ?auto_69731 ?auto_69732 ) ) ( not ( = ?auto_69731 ?auto_69733 ) ) ( not ( = ?auto_69731 ?auto_69734 ) ) ( not ( = ?auto_69731 ?auto_69735 ) ) ( not ( = ?auto_69732 ?auto_69733 ) ) ( not ( = ?auto_69732 ?auto_69734 ) ) ( not ( = ?auto_69732 ?auto_69735 ) ) ( not ( = ?auto_69733 ?auto_69734 ) ) ( not ( = ?auto_69733 ?auto_69735 ) ) ( not ( = ?auto_69734 ?auto_69735 ) ) ( ON ?auto_69735 ?auto_69736 ) ( not ( = ?auto_69729 ?auto_69736 ) ) ( not ( = ?auto_69730 ?auto_69736 ) ) ( not ( = ?auto_69731 ?auto_69736 ) ) ( not ( = ?auto_69732 ?auto_69736 ) ) ( not ( = ?auto_69733 ?auto_69736 ) ) ( not ( = ?auto_69734 ?auto_69736 ) ) ( not ( = ?auto_69735 ?auto_69736 ) ) ( ON ?auto_69734 ?auto_69735 ) ( ON-TABLE ?auto_69736 ) ( ON ?auto_69733 ?auto_69734 ) ( ON ?auto_69732 ?auto_69733 ) ( ON ?auto_69731 ?auto_69732 ) ( CLEAR ?auto_69729 ) ( ON ?auto_69730 ?auto_69731 ) ( CLEAR ?auto_69730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69736 ?auto_69735 ?auto_69734 ?auto_69733 ?auto_69732 ?auto_69731 )
      ( MAKE-7PILE ?auto_69729 ?auto_69730 ?auto_69731 ?auto_69732 ?auto_69733 ?auto_69734 ?auto_69735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69737 - BLOCK
      ?auto_69738 - BLOCK
      ?auto_69739 - BLOCK
      ?auto_69740 - BLOCK
      ?auto_69741 - BLOCK
      ?auto_69742 - BLOCK
      ?auto_69743 - BLOCK
    )
    :vars
    (
      ?auto_69744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69737 ?auto_69738 ) ) ( not ( = ?auto_69737 ?auto_69739 ) ) ( not ( = ?auto_69737 ?auto_69740 ) ) ( not ( = ?auto_69737 ?auto_69741 ) ) ( not ( = ?auto_69737 ?auto_69742 ) ) ( not ( = ?auto_69737 ?auto_69743 ) ) ( not ( = ?auto_69738 ?auto_69739 ) ) ( not ( = ?auto_69738 ?auto_69740 ) ) ( not ( = ?auto_69738 ?auto_69741 ) ) ( not ( = ?auto_69738 ?auto_69742 ) ) ( not ( = ?auto_69738 ?auto_69743 ) ) ( not ( = ?auto_69739 ?auto_69740 ) ) ( not ( = ?auto_69739 ?auto_69741 ) ) ( not ( = ?auto_69739 ?auto_69742 ) ) ( not ( = ?auto_69739 ?auto_69743 ) ) ( not ( = ?auto_69740 ?auto_69741 ) ) ( not ( = ?auto_69740 ?auto_69742 ) ) ( not ( = ?auto_69740 ?auto_69743 ) ) ( not ( = ?auto_69741 ?auto_69742 ) ) ( not ( = ?auto_69741 ?auto_69743 ) ) ( not ( = ?auto_69742 ?auto_69743 ) ) ( ON ?auto_69743 ?auto_69744 ) ( not ( = ?auto_69737 ?auto_69744 ) ) ( not ( = ?auto_69738 ?auto_69744 ) ) ( not ( = ?auto_69739 ?auto_69744 ) ) ( not ( = ?auto_69740 ?auto_69744 ) ) ( not ( = ?auto_69741 ?auto_69744 ) ) ( not ( = ?auto_69742 ?auto_69744 ) ) ( not ( = ?auto_69743 ?auto_69744 ) ) ( ON ?auto_69742 ?auto_69743 ) ( ON-TABLE ?auto_69744 ) ( ON ?auto_69741 ?auto_69742 ) ( ON ?auto_69740 ?auto_69741 ) ( ON ?auto_69739 ?auto_69740 ) ( ON ?auto_69738 ?auto_69739 ) ( CLEAR ?auto_69738 ) ( HOLDING ?auto_69737 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69737 )
      ( MAKE-7PILE ?auto_69737 ?auto_69738 ?auto_69739 ?auto_69740 ?auto_69741 ?auto_69742 ?auto_69743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_69745 - BLOCK
      ?auto_69746 - BLOCK
      ?auto_69747 - BLOCK
      ?auto_69748 - BLOCK
      ?auto_69749 - BLOCK
      ?auto_69750 - BLOCK
      ?auto_69751 - BLOCK
    )
    :vars
    (
      ?auto_69752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69745 ?auto_69746 ) ) ( not ( = ?auto_69745 ?auto_69747 ) ) ( not ( = ?auto_69745 ?auto_69748 ) ) ( not ( = ?auto_69745 ?auto_69749 ) ) ( not ( = ?auto_69745 ?auto_69750 ) ) ( not ( = ?auto_69745 ?auto_69751 ) ) ( not ( = ?auto_69746 ?auto_69747 ) ) ( not ( = ?auto_69746 ?auto_69748 ) ) ( not ( = ?auto_69746 ?auto_69749 ) ) ( not ( = ?auto_69746 ?auto_69750 ) ) ( not ( = ?auto_69746 ?auto_69751 ) ) ( not ( = ?auto_69747 ?auto_69748 ) ) ( not ( = ?auto_69747 ?auto_69749 ) ) ( not ( = ?auto_69747 ?auto_69750 ) ) ( not ( = ?auto_69747 ?auto_69751 ) ) ( not ( = ?auto_69748 ?auto_69749 ) ) ( not ( = ?auto_69748 ?auto_69750 ) ) ( not ( = ?auto_69748 ?auto_69751 ) ) ( not ( = ?auto_69749 ?auto_69750 ) ) ( not ( = ?auto_69749 ?auto_69751 ) ) ( not ( = ?auto_69750 ?auto_69751 ) ) ( ON ?auto_69751 ?auto_69752 ) ( not ( = ?auto_69745 ?auto_69752 ) ) ( not ( = ?auto_69746 ?auto_69752 ) ) ( not ( = ?auto_69747 ?auto_69752 ) ) ( not ( = ?auto_69748 ?auto_69752 ) ) ( not ( = ?auto_69749 ?auto_69752 ) ) ( not ( = ?auto_69750 ?auto_69752 ) ) ( not ( = ?auto_69751 ?auto_69752 ) ) ( ON ?auto_69750 ?auto_69751 ) ( ON-TABLE ?auto_69752 ) ( ON ?auto_69749 ?auto_69750 ) ( ON ?auto_69748 ?auto_69749 ) ( ON ?auto_69747 ?auto_69748 ) ( ON ?auto_69746 ?auto_69747 ) ( ON ?auto_69745 ?auto_69746 ) ( CLEAR ?auto_69745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69752 ?auto_69751 ?auto_69750 ?auto_69749 ?auto_69748 ?auto_69747 ?auto_69746 )
      ( MAKE-7PILE ?auto_69745 ?auto_69746 ?auto_69747 ?auto_69748 ?auto_69749 ?auto_69750 ?auto_69751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69859 - BLOCK
    )
    :vars
    (
      ?auto_69860 - BLOCK
      ?auto_69861 - BLOCK
      ?auto_69862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69859 ?auto_69860 ) ( CLEAR ?auto_69859 ) ( not ( = ?auto_69859 ?auto_69860 ) ) ( HOLDING ?auto_69861 ) ( CLEAR ?auto_69862 ) ( not ( = ?auto_69859 ?auto_69861 ) ) ( not ( = ?auto_69859 ?auto_69862 ) ) ( not ( = ?auto_69860 ?auto_69861 ) ) ( not ( = ?auto_69860 ?auto_69862 ) ) ( not ( = ?auto_69861 ?auto_69862 ) ) )
    :subtasks
    ( ( !STACK ?auto_69861 ?auto_69862 )
      ( MAKE-1PILE ?auto_69859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69863 - BLOCK
    )
    :vars
    (
      ?auto_69865 - BLOCK
      ?auto_69864 - BLOCK
      ?auto_69866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69863 ?auto_69865 ) ( not ( = ?auto_69863 ?auto_69865 ) ) ( CLEAR ?auto_69864 ) ( not ( = ?auto_69863 ?auto_69866 ) ) ( not ( = ?auto_69863 ?auto_69864 ) ) ( not ( = ?auto_69865 ?auto_69866 ) ) ( not ( = ?auto_69865 ?auto_69864 ) ) ( not ( = ?auto_69866 ?auto_69864 ) ) ( ON ?auto_69866 ?auto_69863 ) ( CLEAR ?auto_69866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69865 ?auto_69863 )
      ( MAKE-1PILE ?auto_69863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69867 - BLOCK
    )
    :vars
    (
      ?auto_69870 - BLOCK
      ?auto_69868 - BLOCK
      ?auto_69869 - BLOCK
      ?auto_69873 - BLOCK
      ?auto_69871 - BLOCK
      ?auto_69872 - BLOCK
      ?auto_69874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69867 ?auto_69870 ) ( not ( = ?auto_69867 ?auto_69870 ) ) ( not ( = ?auto_69867 ?auto_69868 ) ) ( not ( = ?auto_69867 ?auto_69869 ) ) ( not ( = ?auto_69870 ?auto_69868 ) ) ( not ( = ?auto_69870 ?auto_69869 ) ) ( not ( = ?auto_69868 ?auto_69869 ) ) ( ON ?auto_69868 ?auto_69867 ) ( CLEAR ?auto_69868 ) ( ON-TABLE ?auto_69870 ) ( HOLDING ?auto_69869 ) ( CLEAR ?auto_69873 ) ( ON-TABLE ?auto_69871 ) ( ON ?auto_69872 ?auto_69871 ) ( ON ?auto_69874 ?auto_69872 ) ( ON ?auto_69873 ?auto_69874 ) ( not ( = ?auto_69871 ?auto_69872 ) ) ( not ( = ?auto_69871 ?auto_69874 ) ) ( not ( = ?auto_69871 ?auto_69873 ) ) ( not ( = ?auto_69871 ?auto_69869 ) ) ( not ( = ?auto_69872 ?auto_69874 ) ) ( not ( = ?auto_69872 ?auto_69873 ) ) ( not ( = ?auto_69872 ?auto_69869 ) ) ( not ( = ?auto_69874 ?auto_69873 ) ) ( not ( = ?auto_69874 ?auto_69869 ) ) ( not ( = ?auto_69873 ?auto_69869 ) ) ( not ( = ?auto_69867 ?auto_69873 ) ) ( not ( = ?auto_69867 ?auto_69871 ) ) ( not ( = ?auto_69867 ?auto_69872 ) ) ( not ( = ?auto_69867 ?auto_69874 ) ) ( not ( = ?auto_69870 ?auto_69873 ) ) ( not ( = ?auto_69870 ?auto_69871 ) ) ( not ( = ?auto_69870 ?auto_69872 ) ) ( not ( = ?auto_69870 ?auto_69874 ) ) ( not ( = ?auto_69868 ?auto_69873 ) ) ( not ( = ?auto_69868 ?auto_69871 ) ) ( not ( = ?auto_69868 ?auto_69872 ) ) ( not ( = ?auto_69868 ?auto_69874 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69871 ?auto_69872 ?auto_69874 ?auto_69873 ?auto_69869 )
      ( MAKE-1PILE ?auto_69867 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69875 - BLOCK
    )
    :vars
    (
      ?auto_69882 - BLOCK
      ?auto_69879 - BLOCK
      ?auto_69881 - BLOCK
      ?auto_69880 - BLOCK
      ?auto_69876 - BLOCK
      ?auto_69878 - BLOCK
      ?auto_69877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69875 ?auto_69882 ) ( not ( = ?auto_69875 ?auto_69882 ) ) ( not ( = ?auto_69875 ?auto_69879 ) ) ( not ( = ?auto_69875 ?auto_69881 ) ) ( not ( = ?auto_69882 ?auto_69879 ) ) ( not ( = ?auto_69882 ?auto_69881 ) ) ( not ( = ?auto_69879 ?auto_69881 ) ) ( ON ?auto_69879 ?auto_69875 ) ( ON-TABLE ?auto_69882 ) ( CLEAR ?auto_69880 ) ( ON-TABLE ?auto_69876 ) ( ON ?auto_69878 ?auto_69876 ) ( ON ?auto_69877 ?auto_69878 ) ( ON ?auto_69880 ?auto_69877 ) ( not ( = ?auto_69876 ?auto_69878 ) ) ( not ( = ?auto_69876 ?auto_69877 ) ) ( not ( = ?auto_69876 ?auto_69880 ) ) ( not ( = ?auto_69876 ?auto_69881 ) ) ( not ( = ?auto_69878 ?auto_69877 ) ) ( not ( = ?auto_69878 ?auto_69880 ) ) ( not ( = ?auto_69878 ?auto_69881 ) ) ( not ( = ?auto_69877 ?auto_69880 ) ) ( not ( = ?auto_69877 ?auto_69881 ) ) ( not ( = ?auto_69880 ?auto_69881 ) ) ( not ( = ?auto_69875 ?auto_69880 ) ) ( not ( = ?auto_69875 ?auto_69876 ) ) ( not ( = ?auto_69875 ?auto_69878 ) ) ( not ( = ?auto_69875 ?auto_69877 ) ) ( not ( = ?auto_69882 ?auto_69880 ) ) ( not ( = ?auto_69882 ?auto_69876 ) ) ( not ( = ?auto_69882 ?auto_69878 ) ) ( not ( = ?auto_69882 ?auto_69877 ) ) ( not ( = ?auto_69879 ?auto_69880 ) ) ( not ( = ?auto_69879 ?auto_69876 ) ) ( not ( = ?auto_69879 ?auto_69878 ) ) ( not ( = ?auto_69879 ?auto_69877 ) ) ( ON ?auto_69881 ?auto_69879 ) ( CLEAR ?auto_69881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69882 ?auto_69875 ?auto_69879 )
      ( MAKE-1PILE ?auto_69875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69883 - BLOCK
    )
    :vars
    (
      ?auto_69888 - BLOCK
      ?auto_69885 - BLOCK
      ?auto_69889 - BLOCK
      ?auto_69884 - BLOCK
      ?auto_69890 - BLOCK
      ?auto_69886 - BLOCK
      ?auto_69887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69883 ?auto_69888 ) ( not ( = ?auto_69883 ?auto_69888 ) ) ( not ( = ?auto_69883 ?auto_69885 ) ) ( not ( = ?auto_69883 ?auto_69889 ) ) ( not ( = ?auto_69888 ?auto_69885 ) ) ( not ( = ?auto_69888 ?auto_69889 ) ) ( not ( = ?auto_69885 ?auto_69889 ) ) ( ON ?auto_69885 ?auto_69883 ) ( ON-TABLE ?auto_69888 ) ( ON-TABLE ?auto_69884 ) ( ON ?auto_69890 ?auto_69884 ) ( ON ?auto_69886 ?auto_69890 ) ( not ( = ?auto_69884 ?auto_69890 ) ) ( not ( = ?auto_69884 ?auto_69886 ) ) ( not ( = ?auto_69884 ?auto_69887 ) ) ( not ( = ?auto_69884 ?auto_69889 ) ) ( not ( = ?auto_69890 ?auto_69886 ) ) ( not ( = ?auto_69890 ?auto_69887 ) ) ( not ( = ?auto_69890 ?auto_69889 ) ) ( not ( = ?auto_69886 ?auto_69887 ) ) ( not ( = ?auto_69886 ?auto_69889 ) ) ( not ( = ?auto_69887 ?auto_69889 ) ) ( not ( = ?auto_69883 ?auto_69887 ) ) ( not ( = ?auto_69883 ?auto_69884 ) ) ( not ( = ?auto_69883 ?auto_69890 ) ) ( not ( = ?auto_69883 ?auto_69886 ) ) ( not ( = ?auto_69888 ?auto_69887 ) ) ( not ( = ?auto_69888 ?auto_69884 ) ) ( not ( = ?auto_69888 ?auto_69890 ) ) ( not ( = ?auto_69888 ?auto_69886 ) ) ( not ( = ?auto_69885 ?auto_69887 ) ) ( not ( = ?auto_69885 ?auto_69884 ) ) ( not ( = ?auto_69885 ?auto_69890 ) ) ( not ( = ?auto_69885 ?auto_69886 ) ) ( ON ?auto_69889 ?auto_69885 ) ( CLEAR ?auto_69889 ) ( HOLDING ?auto_69887 ) ( CLEAR ?auto_69886 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69884 ?auto_69890 ?auto_69886 ?auto_69887 )
      ( MAKE-1PILE ?auto_69883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69891 - BLOCK
    )
    :vars
    (
      ?auto_69896 - BLOCK
      ?auto_69895 - BLOCK
      ?auto_69897 - BLOCK
      ?auto_69898 - BLOCK
      ?auto_69893 - BLOCK
      ?auto_69892 - BLOCK
      ?auto_69894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69891 ?auto_69896 ) ( not ( = ?auto_69891 ?auto_69896 ) ) ( not ( = ?auto_69891 ?auto_69895 ) ) ( not ( = ?auto_69891 ?auto_69897 ) ) ( not ( = ?auto_69896 ?auto_69895 ) ) ( not ( = ?auto_69896 ?auto_69897 ) ) ( not ( = ?auto_69895 ?auto_69897 ) ) ( ON ?auto_69895 ?auto_69891 ) ( ON-TABLE ?auto_69896 ) ( ON-TABLE ?auto_69898 ) ( ON ?auto_69893 ?auto_69898 ) ( ON ?auto_69892 ?auto_69893 ) ( not ( = ?auto_69898 ?auto_69893 ) ) ( not ( = ?auto_69898 ?auto_69892 ) ) ( not ( = ?auto_69898 ?auto_69894 ) ) ( not ( = ?auto_69898 ?auto_69897 ) ) ( not ( = ?auto_69893 ?auto_69892 ) ) ( not ( = ?auto_69893 ?auto_69894 ) ) ( not ( = ?auto_69893 ?auto_69897 ) ) ( not ( = ?auto_69892 ?auto_69894 ) ) ( not ( = ?auto_69892 ?auto_69897 ) ) ( not ( = ?auto_69894 ?auto_69897 ) ) ( not ( = ?auto_69891 ?auto_69894 ) ) ( not ( = ?auto_69891 ?auto_69898 ) ) ( not ( = ?auto_69891 ?auto_69893 ) ) ( not ( = ?auto_69891 ?auto_69892 ) ) ( not ( = ?auto_69896 ?auto_69894 ) ) ( not ( = ?auto_69896 ?auto_69898 ) ) ( not ( = ?auto_69896 ?auto_69893 ) ) ( not ( = ?auto_69896 ?auto_69892 ) ) ( not ( = ?auto_69895 ?auto_69894 ) ) ( not ( = ?auto_69895 ?auto_69898 ) ) ( not ( = ?auto_69895 ?auto_69893 ) ) ( not ( = ?auto_69895 ?auto_69892 ) ) ( ON ?auto_69897 ?auto_69895 ) ( CLEAR ?auto_69892 ) ( ON ?auto_69894 ?auto_69897 ) ( CLEAR ?auto_69894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69896 ?auto_69891 ?auto_69895 ?auto_69897 )
      ( MAKE-1PILE ?auto_69891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69899 - BLOCK
    )
    :vars
    (
      ?auto_69906 - BLOCK
      ?auto_69905 - BLOCK
      ?auto_69902 - BLOCK
      ?auto_69904 - BLOCK
      ?auto_69900 - BLOCK
      ?auto_69903 - BLOCK
      ?auto_69901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69899 ?auto_69906 ) ( not ( = ?auto_69899 ?auto_69906 ) ) ( not ( = ?auto_69899 ?auto_69905 ) ) ( not ( = ?auto_69899 ?auto_69902 ) ) ( not ( = ?auto_69906 ?auto_69905 ) ) ( not ( = ?auto_69906 ?auto_69902 ) ) ( not ( = ?auto_69905 ?auto_69902 ) ) ( ON ?auto_69905 ?auto_69899 ) ( ON-TABLE ?auto_69906 ) ( ON-TABLE ?auto_69904 ) ( ON ?auto_69900 ?auto_69904 ) ( not ( = ?auto_69904 ?auto_69900 ) ) ( not ( = ?auto_69904 ?auto_69903 ) ) ( not ( = ?auto_69904 ?auto_69901 ) ) ( not ( = ?auto_69904 ?auto_69902 ) ) ( not ( = ?auto_69900 ?auto_69903 ) ) ( not ( = ?auto_69900 ?auto_69901 ) ) ( not ( = ?auto_69900 ?auto_69902 ) ) ( not ( = ?auto_69903 ?auto_69901 ) ) ( not ( = ?auto_69903 ?auto_69902 ) ) ( not ( = ?auto_69901 ?auto_69902 ) ) ( not ( = ?auto_69899 ?auto_69901 ) ) ( not ( = ?auto_69899 ?auto_69904 ) ) ( not ( = ?auto_69899 ?auto_69900 ) ) ( not ( = ?auto_69899 ?auto_69903 ) ) ( not ( = ?auto_69906 ?auto_69901 ) ) ( not ( = ?auto_69906 ?auto_69904 ) ) ( not ( = ?auto_69906 ?auto_69900 ) ) ( not ( = ?auto_69906 ?auto_69903 ) ) ( not ( = ?auto_69905 ?auto_69901 ) ) ( not ( = ?auto_69905 ?auto_69904 ) ) ( not ( = ?auto_69905 ?auto_69900 ) ) ( not ( = ?auto_69905 ?auto_69903 ) ) ( ON ?auto_69902 ?auto_69905 ) ( ON ?auto_69901 ?auto_69902 ) ( CLEAR ?auto_69901 ) ( HOLDING ?auto_69903 ) ( CLEAR ?auto_69900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69904 ?auto_69900 ?auto_69903 )
      ( MAKE-1PILE ?auto_69899 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69907 - BLOCK
    )
    :vars
    (
      ?auto_69908 - BLOCK
      ?auto_69910 - BLOCK
      ?auto_69909 - BLOCK
      ?auto_69912 - BLOCK
      ?auto_69911 - BLOCK
      ?auto_69914 - BLOCK
      ?auto_69913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69907 ?auto_69908 ) ( not ( = ?auto_69907 ?auto_69908 ) ) ( not ( = ?auto_69907 ?auto_69910 ) ) ( not ( = ?auto_69907 ?auto_69909 ) ) ( not ( = ?auto_69908 ?auto_69910 ) ) ( not ( = ?auto_69908 ?auto_69909 ) ) ( not ( = ?auto_69910 ?auto_69909 ) ) ( ON ?auto_69910 ?auto_69907 ) ( ON-TABLE ?auto_69908 ) ( ON-TABLE ?auto_69912 ) ( ON ?auto_69911 ?auto_69912 ) ( not ( = ?auto_69912 ?auto_69911 ) ) ( not ( = ?auto_69912 ?auto_69914 ) ) ( not ( = ?auto_69912 ?auto_69913 ) ) ( not ( = ?auto_69912 ?auto_69909 ) ) ( not ( = ?auto_69911 ?auto_69914 ) ) ( not ( = ?auto_69911 ?auto_69913 ) ) ( not ( = ?auto_69911 ?auto_69909 ) ) ( not ( = ?auto_69914 ?auto_69913 ) ) ( not ( = ?auto_69914 ?auto_69909 ) ) ( not ( = ?auto_69913 ?auto_69909 ) ) ( not ( = ?auto_69907 ?auto_69913 ) ) ( not ( = ?auto_69907 ?auto_69912 ) ) ( not ( = ?auto_69907 ?auto_69911 ) ) ( not ( = ?auto_69907 ?auto_69914 ) ) ( not ( = ?auto_69908 ?auto_69913 ) ) ( not ( = ?auto_69908 ?auto_69912 ) ) ( not ( = ?auto_69908 ?auto_69911 ) ) ( not ( = ?auto_69908 ?auto_69914 ) ) ( not ( = ?auto_69910 ?auto_69913 ) ) ( not ( = ?auto_69910 ?auto_69912 ) ) ( not ( = ?auto_69910 ?auto_69911 ) ) ( not ( = ?auto_69910 ?auto_69914 ) ) ( ON ?auto_69909 ?auto_69910 ) ( ON ?auto_69913 ?auto_69909 ) ( CLEAR ?auto_69911 ) ( ON ?auto_69914 ?auto_69913 ) ( CLEAR ?auto_69914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69908 ?auto_69907 ?auto_69910 ?auto_69909 ?auto_69913 )
      ( MAKE-1PILE ?auto_69907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69915 - BLOCK
    )
    :vars
    (
      ?auto_69919 - BLOCK
      ?auto_69916 - BLOCK
      ?auto_69918 - BLOCK
      ?auto_69922 - BLOCK
      ?auto_69920 - BLOCK
      ?auto_69917 - BLOCK
      ?auto_69921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69915 ?auto_69919 ) ( not ( = ?auto_69915 ?auto_69919 ) ) ( not ( = ?auto_69915 ?auto_69916 ) ) ( not ( = ?auto_69915 ?auto_69918 ) ) ( not ( = ?auto_69919 ?auto_69916 ) ) ( not ( = ?auto_69919 ?auto_69918 ) ) ( not ( = ?auto_69916 ?auto_69918 ) ) ( ON ?auto_69916 ?auto_69915 ) ( ON-TABLE ?auto_69919 ) ( ON-TABLE ?auto_69922 ) ( not ( = ?auto_69922 ?auto_69920 ) ) ( not ( = ?auto_69922 ?auto_69917 ) ) ( not ( = ?auto_69922 ?auto_69921 ) ) ( not ( = ?auto_69922 ?auto_69918 ) ) ( not ( = ?auto_69920 ?auto_69917 ) ) ( not ( = ?auto_69920 ?auto_69921 ) ) ( not ( = ?auto_69920 ?auto_69918 ) ) ( not ( = ?auto_69917 ?auto_69921 ) ) ( not ( = ?auto_69917 ?auto_69918 ) ) ( not ( = ?auto_69921 ?auto_69918 ) ) ( not ( = ?auto_69915 ?auto_69921 ) ) ( not ( = ?auto_69915 ?auto_69922 ) ) ( not ( = ?auto_69915 ?auto_69920 ) ) ( not ( = ?auto_69915 ?auto_69917 ) ) ( not ( = ?auto_69919 ?auto_69921 ) ) ( not ( = ?auto_69919 ?auto_69922 ) ) ( not ( = ?auto_69919 ?auto_69920 ) ) ( not ( = ?auto_69919 ?auto_69917 ) ) ( not ( = ?auto_69916 ?auto_69921 ) ) ( not ( = ?auto_69916 ?auto_69922 ) ) ( not ( = ?auto_69916 ?auto_69920 ) ) ( not ( = ?auto_69916 ?auto_69917 ) ) ( ON ?auto_69918 ?auto_69916 ) ( ON ?auto_69921 ?auto_69918 ) ( ON ?auto_69917 ?auto_69921 ) ( CLEAR ?auto_69917 ) ( HOLDING ?auto_69920 ) ( CLEAR ?auto_69922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69922 ?auto_69920 )
      ( MAKE-1PILE ?auto_69915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69923 - BLOCK
    )
    :vars
    (
      ?auto_69927 - BLOCK
      ?auto_69928 - BLOCK
      ?auto_69929 - BLOCK
      ?auto_69930 - BLOCK
      ?auto_69925 - BLOCK
      ?auto_69924 - BLOCK
      ?auto_69926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69923 ?auto_69927 ) ( not ( = ?auto_69923 ?auto_69927 ) ) ( not ( = ?auto_69923 ?auto_69928 ) ) ( not ( = ?auto_69923 ?auto_69929 ) ) ( not ( = ?auto_69927 ?auto_69928 ) ) ( not ( = ?auto_69927 ?auto_69929 ) ) ( not ( = ?auto_69928 ?auto_69929 ) ) ( ON ?auto_69928 ?auto_69923 ) ( ON-TABLE ?auto_69927 ) ( ON-TABLE ?auto_69930 ) ( not ( = ?auto_69930 ?auto_69925 ) ) ( not ( = ?auto_69930 ?auto_69924 ) ) ( not ( = ?auto_69930 ?auto_69926 ) ) ( not ( = ?auto_69930 ?auto_69929 ) ) ( not ( = ?auto_69925 ?auto_69924 ) ) ( not ( = ?auto_69925 ?auto_69926 ) ) ( not ( = ?auto_69925 ?auto_69929 ) ) ( not ( = ?auto_69924 ?auto_69926 ) ) ( not ( = ?auto_69924 ?auto_69929 ) ) ( not ( = ?auto_69926 ?auto_69929 ) ) ( not ( = ?auto_69923 ?auto_69926 ) ) ( not ( = ?auto_69923 ?auto_69930 ) ) ( not ( = ?auto_69923 ?auto_69925 ) ) ( not ( = ?auto_69923 ?auto_69924 ) ) ( not ( = ?auto_69927 ?auto_69926 ) ) ( not ( = ?auto_69927 ?auto_69930 ) ) ( not ( = ?auto_69927 ?auto_69925 ) ) ( not ( = ?auto_69927 ?auto_69924 ) ) ( not ( = ?auto_69928 ?auto_69926 ) ) ( not ( = ?auto_69928 ?auto_69930 ) ) ( not ( = ?auto_69928 ?auto_69925 ) ) ( not ( = ?auto_69928 ?auto_69924 ) ) ( ON ?auto_69929 ?auto_69928 ) ( ON ?auto_69926 ?auto_69929 ) ( ON ?auto_69924 ?auto_69926 ) ( CLEAR ?auto_69930 ) ( ON ?auto_69925 ?auto_69924 ) ( CLEAR ?auto_69925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69927 ?auto_69923 ?auto_69928 ?auto_69929 ?auto_69926 ?auto_69924 )
      ( MAKE-1PILE ?auto_69923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69931 - BLOCK
    )
    :vars
    (
      ?auto_69934 - BLOCK
      ?auto_69936 - BLOCK
      ?auto_69938 - BLOCK
      ?auto_69935 - BLOCK
      ?auto_69937 - BLOCK
      ?auto_69932 - BLOCK
      ?auto_69933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69931 ?auto_69934 ) ( not ( = ?auto_69931 ?auto_69934 ) ) ( not ( = ?auto_69931 ?auto_69936 ) ) ( not ( = ?auto_69931 ?auto_69938 ) ) ( not ( = ?auto_69934 ?auto_69936 ) ) ( not ( = ?auto_69934 ?auto_69938 ) ) ( not ( = ?auto_69936 ?auto_69938 ) ) ( ON ?auto_69936 ?auto_69931 ) ( ON-TABLE ?auto_69934 ) ( not ( = ?auto_69935 ?auto_69937 ) ) ( not ( = ?auto_69935 ?auto_69932 ) ) ( not ( = ?auto_69935 ?auto_69933 ) ) ( not ( = ?auto_69935 ?auto_69938 ) ) ( not ( = ?auto_69937 ?auto_69932 ) ) ( not ( = ?auto_69937 ?auto_69933 ) ) ( not ( = ?auto_69937 ?auto_69938 ) ) ( not ( = ?auto_69932 ?auto_69933 ) ) ( not ( = ?auto_69932 ?auto_69938 ) ) ( not ( = ?auto_69933 ?auto_69938 ) ) ( not ( = ?auto_69931 ?auto_69933 ) ) ( not ( = ?auto_69931 ?auto_69935 ) ) ( not ( = ?auto_69931 ?auto_69937 ) ) ( not ( = ?auto_69931 ?auto_69932 ) ) ( not ( = ?auto_69934 ?auto_69933 ) ) ( not ( = ?auto_69934 ?auto_69935 ) ) ( not ( = ?auto_69934 ?auto_69937 ) ) ( not ( = ?auto_69934 ?auto_69932 ) ) ( not ( = ?auto_69936 ?auto_69933 ) ) ( not ( = ?auto_69936 ?auto_69935 ) ) ( not ( = ?auto_69936 ?auto_69937 ) ) ( not ( = ?auto_69936 ?auto_69932 ) ) ( ON ?auto_69938 ?auto_69936 ) ( ON ?auto_69933 ?auto_69938 ) ( ON ?auto_69932 ?auto_69933 ) ( ON ?auto_69937 ?auto_69932 ) ( CLEAR ?auto_69937 ) ( HOLDING ?auto_69935 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69935 )
      ( MAKE-1PILE ?auto_69931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69939 - BLOCK
    )
    :vars
    (
      ?auto_69945 - BLOCK
      ?auto_69942 - BLOCK
      ?auto_69940 - BLOCK
      ?auto_69941 - BLOCK
      ?auto_69943 - BLOCK
      ?auto_69946 - BLOCK
      ?auto_69944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69939 ?auto_69945 ) ( not ( = ?auto_69939 ?auto_69945 ) ) ( not ( = ?auto_69939 ?auto_69942 ) ) ( not ( = ?auto_69939 ?auto_69940 ) ) ( not ( = ?auto_69945 ?auto_69942 ) ) ( not ( = ?auto_69945 ?auto_69940 ) ) ( not ( = ?auto_69942 ?auto_69940 ) ) ( ON ?auto_69942 ?auto_69939 ) ( ON-TABLE ?auto_69945 ) ( not ( = ?auto_69941 ?auto_69943 ) ) ( not ( = ?auto_69941 ?auto_69946 ) ) ( not ( = ?auto_69941 ?auto_69944 ) ) ( not ( = ?auto_69941 ?auto_69940 ) ) ( not ( = ?auto_69943 ?auto_69946 ) ) ( not ( = ?auto_69943 ?auto_69944 ) ) ( not ( = ?auto_69943 ?auto_69940 ) ) ( not ( = ?auto_69946 ?auto_69944 ) ) ( not ( = ?auto_69946 ?auto_69940 ) ) ( not ( = ?auto_69944 ?auto_69940 ) ) ( not ( = ?auto_69939 ?auto_69944 ) ) ( not ( = ?auto_69939 ?auto_69941 ) ) ( not ( = ?auto_69939 ?auto_69943 ) ) ( not ( = ?auto_69939 ?auto_69946 ) ) ( not ( = ?auto_69945 ?auto_69944 ) ) ( not ( = ?auto_69945 ?auto_69941 ) ) ( not ( = ?auto_69945 ?auto_69943 ) ) ( not ( = ?auto_69945 ?auto_69946 ) ) ( not ( = ?auto_69942 ?auto_69944 ) ) ( not ( = ?auto_69942 ?auto_69941 ) ) ( not ( = ?auto_69942 ?auto_69943 ) ) ( not ( = ?auto_69942 ?auto_69946 ) ) ( ON ?auto_69940 ?auto_69942 ) ( ON ?auto_69944 ?auto_69940 ) ( ON ?auto_69946 ?auto_69944 ) ( ON ?auto_69943 ?auto_69946 ) ( ON ?auto_69941 ?auto_69943 ) ( CLEAR ?auto_69941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_69945 ?auto_69939 ?auto_69942 ?auto_69940 ?auto_69944 ?auto_69946 ?auto_69943 )
      ( MAKE-1PILE ?auto_69939 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69958 - BLOCK
      ?auto_69959 - BLOCK
      ?auto_69960 - BLOCK
      ?auto_69961 - BLOCK
      ?auto_69962 - BLOCK
    )
    :vars
    (
      ?auto_69963 - BLOCK
      ?auto_69964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69963 ?auto_69962 ) ( CLEAR ?auto_69963 ) ( ON-TABLE ?auto_69958 ) ( ON ?auto_69959 ?auto_69958 ) ( ON ?auto_69960 ?auto_69959 ) ( ON ?auto_69961 ?auto_69960 ) ( ON ?auto_69962 ?auto_69961 ) ( not ( = ?auto_69958 ?auto_69959 ) ) ( not ( = ?auto_69958 ?auto_69960 ) ) ( not ( = ?auto_69958 ?auto_69961 ) ) ( not ( = ?auto_69958 ?auto_69962 ) ) ( not ( = ?auto_69958 ?auto_69963 ) ) ( not ( = ?auto_69959 ?auto_69960 ) ) ( not ( = ?auto_69959 ?auto_69961 ) ) ( not ( = ?auto_69959 ?auto_69962 ) ) ( not ( = ?auto_69959 ?auto_69963 ) ) ( not ( = ?auto_69960 ?auto_69961 ) ) ( not ( = ?auto_69960 ?auto_69962 ) ) ( not ( = ?auto_69960 ?auto_69963 ) ) ( not ( = ?auto_69961 ?auto_69962 ) ) ( not ( = ?auto_69961 ?auto_69963 ) ) ( not ( = ?auto_69962 ?auto_69963 ) ) ( HOLDING ?auto_69964 ) ( not ( = ?auto_69958 ?auto_69964 ) ) ( not ( = ?auto_69959 ?auto_69964 ) ) ( not ( = ?auto_69960 ?auto_69964 ) ) ( not ( = ?auto_69961 ?auto_69964 ) ) ( not ( = ?auto_69962 ?auto_69964 ) ) ( not ( = ?auto_69963 ?auto_69964 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_69964 )
      ( MAKE-5PILE ?auto_69958 ?auto_69959 ?auto_69960 ?auto_69961 ?auto_69962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70055 - BLOCK
      ?auto_70056 - BLOCK
    )
    :vars
    (
      ?auto_70057 - BLOCK
      ?auto_70058 - BLOCK
      ?auto_70061 - BLOCK
      ?auto_70059 - BLOCK
      ?auto_70060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70055 ?auto_70056 ) ) ( ON ?auto_70056 ?auto_70057 ) ( not ( = ?auto_70055 ?auto_70057 ) ) ( not ( = ?auto_70056 ?auto_70057 ) ) ( ON ?auto_70055 ?auto_70056 ) ( CLEAR ?auto_70055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70058 ) ( ON ?auto_70061 ?auto_70058 ) ( ON ?auto_70059 ?auto_70061 ) ( ON ?auto_70060 ?auto_70059 ) ( ON ?auto_70057 ?auto_70060 ) ( not ( = ?auto_70058 ?auto_70061 ) ) ( not ( = ?auto_70058 ?auto_70059 ) ) ( not ( = ?auto_70058 ?auto_70060 ) ) ( not ( = ?auto_70058 ?auto_70057 ) ) ( not ( = ?auto_70058 ?auto_70056 ) ) ( not ( = ?auto_70058 ?auto_70055 ) ) ( not ( = ?auto_70061 ?auto_70059 ) ) ( not ( = ?auto_70061 ?auto_70060 ) ) ( not ( = ?auto_70061 ?auto_70057 ) ) ( not ( = ?auto_70061 ?auto_70056 ) ) ( not ( = ?auto_70061 ?auto_70055 ) ) ( not ( = ?auto_70059 ?auto_70060 ) ) ( not ( = ?auto_70059 ?auto_70057 ) ) ( not ( = ?auto_70059 ?auto_70056 ) ) ( not ( = ?auto_70059 ?auto_70055 ) ) ( not ( = ?auto_70060 ?auto_70057 ) ) ( not ( = ?auto_70060 ?auto_70056 ) ) ( not ( = ?auto_70060 ?auto_70055 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70058 ?auto_70061 ?auto_70059 ?auto_70060 ?auto_70057 ?auto_70056 )
      ( MAKE-2PILE ?auto_70055 ?auto_70056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70064 - BLOCK
      ?auto_70065 - BLOCK
    )
    :vars
    (
      ?auto_70066 - BLOCK
      ?auto_70067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70064 ?auto_70065 ) ) ( ON ?auto_70065 ?auto_70066 ) ( CLEAR ?auto_70065 ) ( not ( = ?auto_70064 ?auto_70066 ) ) ( not ( = ?auto_70065 ?auto_70066 ) ) ( ON ?auto_70064 ?auto_70067 ) ( CLEAR ?auto_70064 ) ( HAND-EMPTY ) ( not ( = ?auto_70064 ?auto_70067 ) ) ( not ( = ?auto_70065 ?auto_70067 ) ) ( not ( = ?auto_70066 ?auto_70067 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70064 ?auto_70067 )
      ( MAKE-2PILE ?auto_70064 ?auto_70065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70068 - BLOCK
      ?auto_70069 - BLOCK
    )
    :vars
    (
      ?auto_70071 - BLOCK
      ?auto_70070 - BLOCK
      ?auto_70074 - BLOCK
      ?auto_70072 - BLOCK
      ?auto_70073 - BLOCK
      ?auto_70075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70068 ?auto_70069 ) ) ( not ( = ?auto_70068 ?auto_70071 ) ) ( not ( = ?auto_70069 ?auto_70071 ) ) ( ON ?auto_70068 ?auto_70070 ) ( CLEAR ?auto_70068 ) ( not ( = ?auto_70068 ?auto_70070 ) ) ( not ( = ?auto_70069 ?auto_70070 ) ) ( not ( = ?auto_70071 ?auto_70070 ) ) ( HOLDING ?auto_70069 ) ( CLEAR ?auto_70071 ) ( ON-TABLE ?auto_70074 ) ( ON ?auto_70072 ?auto_70074 ) ( ON ?auto_70073 ?auto_70072 ) ( ON ?auto_70075 ?auto_70073 ) ( ON ?auto_70071 ?auto_70075 ) ( not ( = ?auto_70074 ?auto_70072 ) ) ( not ( = ?auto_70074 ?auto_70073 ) ) ( not ( = ?auto_70074 ?auto_70075 ) ) ( not ( = ?auto_70074 ?auto_70071 ) ) ( not ( = ?auto_70074 ?auto_70069 ) ) ( not ( = ?auto_70072 ?auto_70073 ) ) ( not ( = ?auto_70072 ?auto_70075 ) ) ( not ( = ?auto_70072 ?auto_70071 ) ) ( not ( = ?auto_70072 ?auto_70069 ) ) ( not ( = ?auto_70073 ?auto_70075 ) ) ( not ( = ?auto_70073 ?auto_70071 ) ) ( not ( = ?auto_70073 ?auto_70069 ) ) ( not ( = ?auto_70075 ?auto_70071 ) ) ( not ( = ?auto_70075 ?auto_70069 ) ) ( not ( = ?auto_70068 ?auto_70074 ) ) ( not ( = ?auto_70068 ?auto_70072 ) ) ( not ( = ?auto_70068 ?auto_70073 ) ) ( not ( = ?auto_70068 ?auto_70075 ) ) ( not ( = ?auto_70070 ?auto_70074 ) ) ( not ( = ?auto_70070 ?auto_70072 ) ) ( not ( = ?auto_70070 ?auto_70073 ) ) ( not ( = ?auto_70070 ?auto_70075 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70074 ?auto_70072 ?auto_70073 ?auto_70075 ?auto_70071 ?auto_70069 )
      ( MAKE-2PILE ?auto_70068 ?auto_70069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70076 - BLOCK
      ?auto_70077 - BLOCK
    )
    :vars
    (
      ?auto_70083 - BLOCK
      ?auto_70081 - BLOCK
      ?auto_70082 - BLOCK
      ?auto_70080 - BLOCK
      ?auto_70078 - BLOCK
      ?auto_70079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70076 ?auto_70077 ) ) ( not ( = ?auto_70076 ?auto_70083 ) ) ( not ( = ?auto_70077 ?auto_70083 ) ) ( ON ?auto_70076 ?auto_70081 ) ( not ( = ?auto_70076 ?auto_70081 ) ) ( not ( = ?auto_70077 ?auto_70081 ) ) ( not ( = ?auto_70083 ?auto_70081 ) ) ( CLEAR ?auto_70083 ) ( ON-TABLE ?auto_70082 ) ( ON ?auto_70080 ?auto_70082 ) ( ON ?auto_70078 ?auto_70080 ) ( ON ?auto_70079 ?auto_70078 ) ( ON ?auto_70083 ?auto_70079 ) ( not ( = ?auto_70082 ?auto_70080 ) ) ( not ( = ?auto_70082 ?auto_70078 ) ) ( not ( = ?auto_70082 ?auto_70079 ) ) ( not ( = ?auto_70082 ?auto_70083 ) ) ( not ( = ?auto_70082 ?auto_70077 ) ) ( not ( = ?auto_70080 ?auto_70078 ) ) ( not ( = ?auto_70080 ?auto_70079 ) ) ( not ( = ?auto_70080 ?auto_70083 ) ) ( not ( = ?auto_70080 ?auto_70077 ) ) ( not ( = ?auto_70078 ?auto_70079 ) ) ( not ( = ?auto_70078 ?auto_70083 ) ) ( not ( = ?auto_70078 ?auto_70077 ) ) ( not ( = ?auto_70079 ?auto_70083 ) ) ( not ( = ?auto_70079 ?auto_70077 ) ) ( not ( = ?auto_70076 ?auto_70082 ) ) ( not ( = ?auto_70076 ?auto_70080 ) ) ( not ( = ?auto_70076 ?auto_70078 ) ) ( not ( = ?auto_70076 ?auto_70079 ) ) ( not ( = ?auto_70081 ?auto_70082 ) ) ( not ( = ?auto_70081 ?auto_70080 ) ) ( not ( = ?auto_70081 ?auto_70078 ) ) ( not ( = ?auto_70081 ?auto_70079 ) ) ( ON ?auto_70077 ?auto_70076 ) ( CLEAR ?auto_70077 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70081 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70081 ?auto_70076 )
      ( MAKE-2PILE ?auto_70076 ?auto_70077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70084 - BLOCK
      ?auto_70085 - BLOCK
    )
    :vars
    (
      ?auto_70091 - BLOCK
      ?auto_70090 - BLOCK
      ?auto_70088 - BLOCK
      ?auto_70089 - BLOCK
      ?auto_70087 - BLOCK
      ?auto_70086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70084 ?auto_70085 ) ) ( not ( = ?auto_70084 ?auto_70091 ) ) ( not ( = ?auto_70085 ?auto_70091 ) ) ( ON ?auto_70084 ?auto_70090 ) ( not ( = ?auto_70084 ?auto_70090 ) ) ( not ( = ?auto_70085 ?auto_70090 ) ) ( not ( = ?auto_70091 ?auto_70090 ) ) ( ON-TABLE ?auto_70088 ) ( ON ?auto_70089 ?auto_70088 ) ( ON ?auto_70087 ?auto_70089 ) ( ON ?auto_70086 ?auto_70087 ) ( not ( = ?auto_70088 ?auto_70089 ) ) ( not ( = ?auto_70088 ?auto_70087 ) ) ( not ( = ?auto_70088 ?auto_70086 ) ) ( not ( = ?auto_70088 ?auto_70091 ) ) ( not ( = ?auto_70088 ?auto_70085 ) ) ( not ( = ?auto_70089 ?auto_70087 ) ) ( not ( = ?auto_70089 ?auto_70086 ) ) ( not ( = ?auto_70089 ?auto_70091 ) ) ( not ( = ?auto_70089 ?auto_70085 ) ) ( not ( = ?auto_70087 ?auto_70086 ) ) ( not ( = ?auto_70087 ?auto_70091 ) ) ( not ( = ?auto_70087 ?auto_70085 ) ) ( not ( = ?auto_70086 ?auto_70091 ) ) ( not ( = ?auto_70086 ?auto_70085 ) ) ( not ( = ?auto_70084 ?auto_70088 ) ) ( not ( = ?auto_70084 ?auto_70089 ) ) ( not ( = ?auto_70084 ?auto_70087 ) ) ( not ( = ?auto_70084 ?auto_70086 ) ) ( not ( = ?auto_70090 ?auto_70088 ) ) ( not ( = ?auto_70090 ?auto_70089 ) ) ( not ( = ?auto_70090 ?auto_70087 ) ) ( not ( = ?auto_70090 ?auto_70086 ) ) ( ON ?auto_70085 ?auto_70084 ) ( CLEAR ?auto_70085 ) ( ON-TABLE ?auto_70090 ) ( HOLDING ?auto_70091 ) ( CLEAR ?auto_70086 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70088 ?auto_70089 ?auto_70087 ?auto_70086 ?auto_70091 )
      ( MAKE-2PILE ?auto_70084 ?auto_70085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70092 - BLOCK
      ?auto_70093 - BLOCK
    )
    :vars
    (
      ?auto_70095 - BLOCK
      ?auto_70096 - BLOCK
      ?auto_70097 - BLOCK
      ?auto_70094 - BLOCK
      ?auto_70098 - BLOCK
      ?auto_70099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70092 ?auto_70093 ) ) ( not ( = ?auto_70092 ?auto_70095 ) ) ( not ( = ?auto_70093 ?auto_70095 ) ) ( ON ?auto_70092 ?auto_70096 ) ( not ( = ?auto_70092 ?auto_70096 ) ) ( not ( = ?auto_70093 ?auto_70096 ) ) ( not ( = ?auto_70095 ?auto_70096 ) ) ( ON-TABLE ?auto_70097 ) ( ON ?auto_70094 ?auto_70097 ) ( ON ?auto_70098 ?auto_70094 ) ( ON ?auto_70099 ?auto_70098 ) ( not ( = ?auto_70097 ?auto_70094 ) ) ( not ( = ?auto_70097 ?auto_70098 ) ) ( not ( = ?auto_70097 ?auto_70099 ) ) ( not ( = ?auto_70097 ?auto_70095 ) ) ( not ( = ?auto_70097 ?auto_70093 ) ) ( not ( = ?auto_70094 ?auto_70098 ) ) ( not ( = ?auto_70094 ?auto_70099 ) ) ( not ( = ?auto_70094 ?auto_70095 ) ) ( not ( = ?auto_70094 ?auto_70093 ) ) ( not ( = ?auto_70098 ?auto_70099 ) ) ( not ( = ?auto_70098 ?auto_70095 ) ) ( not ( = ?auto_70098 ?auto_70093 ) ) ( not ( = ?auto_70099 ?auto_70095 ) ) ( not ( = ?auto_70099 ?auto_70093 ) ) ( not ( = ?auto_70092 ?auto_70097 ) ) ( not ( = ?auto_70092 ?auto_70094 ) ) ( not ( = ?auto_70092 ?auto_70098 ) ) ( not ( = ?auto_70092 ?auto_70099 ) ) ( not ( = ?auto_70096 ?auto_70097 ) ) ( not ( = ?auto_70096 ?auto_70094 ) ) ( not ( = ?auto_70096 ?auto_70098 ) ) ( not ( = ?auto_70096 ?auto_70099 ) ) ( ON ?auto_70093 ?auto_70092 ) ( ON-TABLE ?auto_70096 ) ( CLEAR ?auto_70099 ) ( ON ?auto_70095 ?auto_70093 ) ( CLEAR ?auto_70095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70096 ?auto_70092 ?auto_70093 )
      ( MAKE-2PILE ?auto_70092 ?auto_70093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70100 - BLOCK
      ?auto_70101 - BLOCK
    )
    :vars
    (
      ?auto_70107 - BLOCK
      ?auto_70102 - BLOCK
      ?auto_70104 - BLOCK
      ?auto_70103 - BLOCK
      ?auto_70105 - BLOCK
      ?auto_70106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70100 ?auto_70101 ) ) ( not ( = ?auto_70100 ?auto_70107 ) ) ( not ( = ?auto_70101 ?auto_70107 ) ) ( ON ?auto_70100 ?auto_70102 ) ( not ( = ?auto_70100 ?auto_70102 ) ) ( not ( = ?auto_70101 ?auto_70102 ) ) ( not ( = ?auto_70107 ?auto_70102 ) ) ( ON-TABLE ?auto_70104 ) ( ON ?auto_70103 ?auto_70104 ) ( ON ?auto_70105 ?auto_70103 ) ( not ( = ?auto_70104 ?auto_70103 ) ) ( not ( = ?auto_70104 ?auto_70105 ) ) ( not ( = ?auto_70104 ?auto_70106 ) ) ( not ( = ?auto_70104 ?auto_70107 ) ) ( not ( = ?auto_70104 ?auto_70101 ) ) ( not ( = ?auto_70103 ?auto_70105 ) ) ( not ( = ?auto_70103 ?auto_70106 ) ) ( not ( = ?auto_70103 ?auto_70107 ) ) ( not ( = ?auto_70103 ?auto_70101 ) ) ( not ( = ?auto_70105 ?auto_70106 ) ) ( not ( = ?auto_70105 ?auto_70107 ) ) ( not ( = ?auto_70105 ?auto_70101 ) ) ( not ( = ?auto_70106 ?auto_70107 ) ) ( not ( = ?auto_70106 ?auto_70101 ) ) ( not ( = ?auto_70100 ?auto_70104 ) ) ( not ( = ?auto_70100 ?auto_70103 ) ) ( not ( = ?auto_70100 ?auto_70105 ) ) ( not ( = ?auto_70100 ?auto_70106 ) ) ( not ( = ?auto_70102 ?auto_70104 ) ) ( not ( = ?auto_70102 ?auto_70103 ) ) ( not ( = ?auto_70102 ?auto_70105 ) ) ( not ( = ?auto_70102 ?auto_70106 ) ) ( ON ?auto_70101 ?auto_70100 ) ( ON-TABLE ?auto_70102 ) ( ON ?auto_70107 ?auto_70101 ) ( CLEAR ?auto_70107 ) ( HOLDING ?auto_70106 ) ( CLEAR ?auto_70105 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70104 ?auto_70103 ?auto_70105 ?auto_70106 )
      ( MAKE-2PILE ?auto_70100 ?auto_70101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70108 - BLOCK
      ?auto_70109 - BLOCK
    )
    :vars
    (
      ?auto_70110 - BLOCK
      ?auto_70111 - BLOCK
      ?auto_70115 - BLOCK
      ?auto_70112 - BLOCK
      ?auto_70113 - BLOCK
      ?auto_70114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70108 ?auto_70109 ) ) ( not ( = ?auto_70108 ?auto_70110 ) ) ( not ( = ?auto_70109 ?auto_70110 ) ) ( ON ?auto_70108 ?auto_70111 ) ( not ( = ?auto_70108 ?auto_70111 ) ) ( not ( = ?auto_70109 ?auto_70111 ) ) ( not ( = ?auto_70110 ?auto_70111 ) ) ( ON-TABLE ?auto_70115 ) ( ON ?auto_70112 ?auto_70115 ) ( ON ?auto_70113 ?auto_70112 ) ( not ( = ?auto_70115 ?auto_70112 ) ) ( not ( = ?auto_70115 ?auto_70113 ) ) ( not ( = ?auto_70115 ?auto_70114 ) ) ( not ( = ?auto_70115 ?auto_70110 ) ) ( not ( = ?auto_70115 ?auto_70109 ) ) ( not ( = ?auto_70112 ?auto_70113 ) ) ( not ( = ?auto_70112 ?auto_70114 ) ) ( not ( = ?auto_70112 ?auto_70110 ) ) ( not ( = ?auto_70112 ?auto_70109 ) ) ( not ( = ?auto_70113 ?auto_70114 ) ) ( not ( = ?auto_70113 ?auto_70110 ) ) ( not ( = ?auto_70113 ?auto_70109 ) ) ( not ( = ?auto_70114 ?auto_70110 ) ) ( not ( = ?auto_70114 ?auto_70109 ) ) ( not ( = ?auto_70108 ?auto_70115 ) ) ( not ( = ?auto_70108 ?auto_70112 ) ) ( not ( = ?auto_70108 ?auto_70113 ) ) ( not ( = ?auto_70108 ?auto_70114 ) ) ( not ( = ?auto_70111 ?auto_70115 ) ) ( not ( = ?auto_70111 ?auto_70112 ) ) ( not ( = ?auto_70111 ?auto_70113 ) ) ( not ( = ?auto_70111 ?auto_70114 ) ) ( ON ?auto_70109 ?auto_70108 ) ( ON-TABLE ?auto_70111 ) ( ON ?auto_70110 ?auto_70109 ) ( CLEAR ?auto_70113 ) ( ON ?auto_70114 ?auto_70110 ) ( CLEAR ?auto_70114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70111 ?auto_70108 ?auto_70109 ?auto_70110 )
      ( MAKE-2PILE ?auto_70108 ?auto_70109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70116 - BLOCK
      ?auto_70117 - BLOCK
    )
    :vars
    (
      ?auto_70118 - BLOCK
      ?auto_70120 - BLOCK
      ?auto_70119 - BLOCK
      ?auto_70121 - BLOCK
      ?auto_70123 - BLOCK
      ?auto_70122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70116 ?auto_70117 ) ) ( not ( = ?auto_70116 ?auto_70118 ) ) ( not ( = ?auto_70117 ?auto_70118 ) ) ( ON ?auto_70116 ?auto_70120 ) ( not ( = ?auto_70116 ?auto_70120 ) ) ( not ( = ?auto_70117 ?auto_70120 ) ) ( not ( = ?auto_70118 ?auto_70120 ) ) ( ON-TABLE ?auto_70119 ) ( ON ?auto_70121 ?auto_70119 ) ( not ( = ?auto_70119 ?auto_70121 ) ) ( not ( = ?auto_70119 ?auto_70123 ) ) ( not ( = ?auto_70119 ?auto_70122 ) ) ( not ( = ?auto_70119 ?auto_70118 ) ) ( not ( = ?auto_70119 ?auto_70117 ) ) ( not ( = ?auto_70121 ?auto_70123 ) ) ( not ( = ?auto_70121 ?auto_70122 ) ) ( not ( = ?auto_70121 ?auto_70118 ) ) ( not ( = ?auto_70121 ?auto_70117 ) ) ( not ( = ?auto_70123 ?auto_70122 ) ) ( not ( = ?auto_70123 ?auto_70118 ) ) ( not ( = ?auto_70123 ?auto_70117 ) ) ( not ( = ?auto_70122 ?auto_70118 ) ) ( not ( = ?auto_70122 ?auto_70117 ) ) ( not ( = ?auto_70116 ?auto_70119 ) ) ( not ( = ?auto_70116 ?auto_70121 ) ) ( not ( = ?auto_70116 ?auto_70123 ) ) ( not ( = ?auto_70116 ?auto_70122 ) ) ( not ( = ?auto_70120 ?auto_70119 ) ) ( not ( = ?auto_70120 ?auto_70121 ) ) ( not ( = ?auto_70120 ?auto_70123 ) ) ( not ( = ?auto_70120 ?auto_70122 ) ) ( ON ?auto_70117 ?auto_70116 ) ( ON-TABLE ?auto_70120 ) ( ON ?auto_70118 ?auto_70117 ) ( ON ?auto_70122 ?auto_70118 ) ( CLEAR ?auto_70122 ) ( HOLDING ?auto_70123 ) ( CLEAR ?auto_70121 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70119 ?auto_70121 ?auto_70123 )
      ( MAKE-2PILE ?auto_70116 ?auto_70117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70124 - BLOCK
      ?auto_70125 - BLOCK
    )
    :vars
    (
      ?auto_70128 - BLOCK
      ?auto_70129 - BLOCK
      ?auto_70127 - BLOCK
      ?auto_70126 - BLOCK
      ?auto_70130 - BLOCK
      ?auto_70131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70124 ?auto_70125 ) ) ( not ( = ?auto_70124 ?auto_70128 ) ) ( not ( = ?auto_70125 ?auto_70128 ) ) ( ON ?auto_70124 ?auto_70129 ) ( not ( = ?auto_70124 ?auto_70129 ) ) ( not ( = ?auto_70125 ?auto_70129 ) ) ( not ( = ?auto_70128 ?auto_70129 ) ) ( ON-TABLE ?auto_70127 ) ( ON ?auto_70126 ?auto_70127 ) ( not ( = ?auto_70127 ?auto_70126 ) ) ( not ( = ?auto_70127 ?auto_70130 ) ) ( not ( = ?auto_70127 ?auto_70131 ) ) ( not ( = ?auto_70127 ?auto_70128 ) ) ( not ( = ?auto_70127 ?auto_70125 ) ) ( not ( = ?auto_70126 ?auto_70130 ) ) ( not ( = ?auto_70126 ?auto_70131 ) ) ( not ( = ?auto_70126 ?auto_70128 ) ) ( not ( = ?auto_70126 ?auto_70125 ) ) ( not ( = ?auto_70130 ?auto_70131 ) ) ( not ( = ?auto_70130 ?auto_70128 ) ) ( not ( = ?auto_70130 ?auto_70125 ) ) ( not ( = ?auto_70131 ?auto_70128 ) ) ( not ( = ?auto_70131 ?auto_70125 ) ) ( not ( = ?auto_70124 ?auto_70127 ) ) ( not ( = ?auto_70124 ?auto_70126 ) ) ( not ( = ?auto_70124 ?auto_70130 ) ) ( not ( = ?auto_70124 ?auto_70131 ) ) ( not ( = ?auto_70129 ?auto_70127 ) ) ( not ( = ?auto_70129 ?auto_70126 ) ) ( not ( = ?auto_70129 ?auto_70130 ) ) ( not ( = ?auto_70129 ?auto_70131 ) ) ( ON ?auto_70125 ?auto_70124 ) ( ON-TABLE ?auto_70129 ) ( ON ?auto_70128 ?auto_70125 ) ( ON ?auto_70131 ?auto_70128 ) ( CLEAR ?auto_70126 ) ( ON ?auto_70130 ?auto_70131 ) ( CLEAR ?auto_70130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70129 ?auto_70124 ?auto_70125 ?auto_70128 ?auto_70131 )
      ( MAKE-2PILE ?auto_70124 ?auto_70125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70132 - BLOCK
      ?auto_70133 - BLOCK
    )
    :vars
    (
      ?auto_70137 - BLOCK
      ?auto_70139 - BLOCK
      ?auto_70134 - BLOCK
      ?auto_70138 - BLOCK
      ?auto_70136 - BLOCK
      ?auto_70135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70132 ?auto_70133 ) ) ( not ( = ?auto_70132 ?auto_70137 ) ) ( not ( = ?auto_70133 ?auto_70137 ) ) ( ON ?auto_70132 ?auto_70139 ) ( not ( = ?auto_70132 ?auto_70139 ) ) ( not ( = ?auto_70133 ?auto_70139 ) ) ( not ( = ?auto_70137 ?auto_70139 ) ) ( ON-TABLE ?auto_70134 ) ( not ( = ?auto_70134 ?auto_70138 ) ) ( not ( = ?auto_70134 ?auto_70136 ) ) ( not ( = ?auto_70134 ?auto_70135 ) ) ( not ( = ?auto_70134 ?auto_70137 ) ) ( not ( = ?auto_70134 ?auto_70133 ) ) ( not ( = ?auto_70138 ?auto_70136 ) ) ( not ( = ?auto_70138 ?auto_70135 ) ) ( not ( = ?auto_70138 ?auto_70137 ) ) ( not ( = ?auto_70138 ?auto_70133 ) ) ( not ( = ?auto_70136 ?auto_70135 ) ) ( not ( = ?auto_70136 ?auto_70137 ) ) ( not ( = ?auto_70136 ?auto_70133 ) ) ( not ( = ?auto_70135 ?auto_70137 ) ) ( not ( = ?auto_70135 ?auto_70133 ) ) ( not ( = ?auto_70132 ?auto_70134 ) ) ( not ( = ?auto_70132 ?auto_70138 ) ) ( not ( = ?auto_70132 ?auto_70136 ) ) ( not ( = ?auto_70132 ?auto_70135 ) ) ( not ( = ?auto_70139 ?auto_70134 ) ) ( not ( = ?auto_70139 ?auto_70138 ) ) ( not ( = ?auto_70139 ?auto_70136 ) ) ( not ( = ?auto_70139 ?auto_70135 ) ) ( ON ?auto_70133 ?auto_70132 ) ( ON-TABLE ?auto_70139 ) ( ON ?auto_70137 ?auto_70133 ) ( ON ?auto_70135 ?auto_70137 ) ( ON ?auto_70136 ?auto_70135 ) ( CLEAR ?auto_70136 ) ( HOLDING ?auto_70138 ) ( CLEAR ?auto_70134 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70134 ?auto_70138 )
      ( MAKE-2PILE ?auto_70132 ?auto_70133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70140 - BLOCK
      ?auto_70141 - BLOCK
    )
    :vars
    (
      ?auto_70144 - BLOCK
      ?auto_70145 - BLOCK
      ?auto_70147 - BLOCK
      ?auto_70143 - BLOCK
      ?auto_70142 - BLOCK
      ?auto_70146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70140 ?auto_70141 ) ) ( not ( = ?auto_70140 ?auto_70144 ) ) ( not ( = ?auto_70141 ?auto_70144 ) ) ( ON ?auto_70140 ?auto_70145 ) ( not ( = ?auto_70140 ?auto_70145 ) ) ( not ( = ?auto_70141 ?auto_70145 ) ) ( not ( = ?auto_70144 ?auto_70145 ) ) ( ON-TABLE ?auto_70147 ) ( not ( = ?auto_70147 ?auto_70143 ) ) ( not ( = ?auto_70147 ?auto_70142 ) ) ( not ( = ?auto_70147 ?auto_70146 ) ) ( not ( = ?auto_70147 ?auto_70144 ) ) ( not ( = ?auto_70147 ?auto_70141 ) ) ( not ( = ?auto_70143 ?auto_70142 ) ) ( not ( = ?auto_70143 ?auto_70146 ) ) ( not ( = ?auto_70143 ?auto_70144 ) ) ( not ( = ?auto_70143 ?auto_70141 ) ) ( not ( = ?auto_70142 ?auto_70146 ) ) ( not ( = ?auto_70142 ?auto_70144 ) ) ( not ( = ?auto_70142 ?auto_70141 ) ) ( not ( = ?auto_70146 ?auto_70144 ) ) ( not ( = ?auto_70146 ?auto_70141 ) ) ( not ( = ?auto_70140 ?auto_70147 ) ) ( not ( = ?auto_70140 ?auto_70143 ) ) ( not ( = ?auto_70140 ?auto_70142 ) ) ( not ( = ?auto_70140 ?auto_70146 ) ) ( not ( = ?auto_70145 ?auto_70147 ) ) ( not ( = ?auto_70145 ?auto_70143 ) ) ( not ( = ?auto_70145 ?auto_70142 ) ) ( not ( = ?auto_70145 ?auto_70146 ) ) ( ON ?auto_70141 ?auto_70140 ) ( ON-TABLE ?auto_70145 ) ( ON ?auto_70144 ?auto_70141 ) ( ON ?auto_70146 ?auto_70144 ) ( ON ?auto_70142 ?auto_70146 ) ( CLEAR ?auto_70147 ) ( ON ?auto_70143 ?auto_70142 ) ( CLEAR ?auto_70143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70145 ?auto_70140 ?auto_70141 ?auto_70144 ?auto_70146 ?auto_70142 )
      ( MAKE-2PILE ?auto_70140 ?auto_70141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70148 - BLOCK
      ?auto_70149 - BLOCK
    )
    :vars
    (
      ?auto_70152 - BLOCK
      ?auto_70153 - BLOCK
      ?auto_70150 - BLOCK
      ?auto_70154 - BLOCK
      ?auto_70151 - BLOCK
      ?auto_70155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70148 ?auto_70149 ) ) ( not ( = ?auto_70148 ?auto_70152 ) ) ( not ( = ?auto_70149 ?auto_70152 ) ) ( ON ?auto_70148 ?auto_70153 ) ( not ( = ?auto_70148 ?auto_70153 ) ) ( not ( = ?auto_70149 ?auto_70153 ) ) ( not ( = ?auto_70152 ?auto_70153 ) ) ( not ( = ?auto_70150 ?auto_70154 ) ) ( not ( = ?auto_70150 ?auto_70151 ) ) ( not ( = ?auto_70150 ?auto_70155 ) ) ( not ( = ?auto_70150 ?auto_70152 ) ) ( not ( = ?auto_70150 ?auto_70149 ) ) ( not ( = ?auto_70154 ?auto_70151 ) ) ( not ( = ?auto_70154 ?auto_70155 ) ) ( not ( = ?auto_70154 ?auto_70152 ) ) ( not ( = ?auto_70154 ?auto_70149 ) ) ( not ( = ?auto_70151 ?auto_70155 ) ) ( not ( = ?auto_70151 ?auto_70152 ) ) ( not ( = ?auto_70151 ?auto_70149 ) ) ( not ( = ?auto_70155 ?auto_70152 ) ) ( not ( = ?auto_70155 ?auto_70149 ) ) ( not ( = ?auto_70148 ?auto_70150 ) ) ( not ( = ?auto_70148 ?auto_70154 ) ) ( not ( = ?auto_70148 ?auto_70151 ) ) ( not ( = ?auto_70148 ?auto_70155 ) ) ( not ( = ?auto_70153 ?auto_70150 ) ) ( not ( = ?auto_70153 ?auto_70154 ) ) ( not ( = ?auto_70153 ?auto_70151 ) ) ( not ( = ?auto_70153 ?auto_70155 ) ) ( ON ?auto_70149 ?auto_70148 ) ( ON-TABLE ?auto_70153 ) ( ON ?auto_70152 ?auto_70149 ) ( ON ?auto_70155 ?auto_70152 ) ( ON ?auto_70151 ?auto_70155 ) ( ON ?auto_70154 ?auto_70151 ) ( CLEAR ?auto_70154 ) ( HOLDING ?auto_70150 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70150 )
      ( MAKE-2PILE ?auto_70148 ?auto_70149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70156 - BLOCK
      ?auto_70157 - BLOCK
    )
    :vars
    (
      ?auto_70160 - BLOCK
      ?auto_70163 - BLOCK
      ?auto_70159 - BLOCK
      ?auto_70162 - BLOCK
      ?auto_70158 - BLOCK
      ?auto_70161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70156 ?auto_70157 ) ) ( not ( = ?auto_70156 ?auto_70160 ) ) ( not ( = ?auto_70157 ?auto_70160 ) ) ( ON ?auto_70156 ?auto_70163 ) ( not ( = ?auto_70156 ?auto_70163 ) ) ( not ( = ?auto_70157 ?auto_70163 ) ) ( not ( = ?auto_70160 ?auto_70163 ) ) ( not ( = ?auto_70159 ?auto_70162 ) ) ( not ( = ?auto_70159 ?auto_70158 ) ) ( not ( = ?auto_70159 ?auto_70161 ) ) ( not ( = ?auto_70159 ?auto_70160 ) ) ( not ( = ?auto_70159 ?auto_70157 ) ) ( not ( = ?auto_70162 ?auto_70158 ) ) ( not ( = ?auto_70162 ?auto_70161 ) ) ( not ( = ?auto_70162 ?auto_70160 ) ) ( not ( = ?auto_70162 ?auto_70157 ) ) ( not ( = ?auto_70158 ?auto_70161 ) ) ( not ( = ?auto_70158 ?auto_70160 ) ) ( not ( = ?auto_70158 ?auto_70157 ) ) ( not ( = ?auto_70161 ?auto_70160 ) ) ( not ( = ?auto_70161 ?auto_70157 ) ) ( not ( = ?auto_70156 ?auto_70159 ) ) ( not ( = ?auto_70156 ?auto_70162 ) ) ( not ( = ?auto_70156 ?auto_70158 ) ) ( not ( = ?auto_70156 ?auto_70161 ) ) ( not ( = ?auto_70163 ?auto_70159 ) ) ( not ( = ?auto_70163 ?auto_70162 ) ) ( not ( = ?auto_70163 ?auto_70158 ) ) ( not ( = ?auto_70163 ?auto_70161 ) ) ( ON ?auto_70157 ?auto_70156 ) ( ON-TABLE ?auto_70163 ) ( ON ?auto_70160 ?auto_70157 ) ( ON ?auto_70161 ?auto_70160 ) ( ON ?auto_70158 ?auto_70161 ) ( ON ?auto_70162 ?auto_70158 ) ( ON ?auto_70159 ?auto_70162 ) ( CLEAR ?auto_70159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70163 ?auto_70156 ?auto_70157 ?auto_70160 ?auto_70161 ?auto_70158 ?auto_70162 )
      ( MAKE-2PILE ?auto_70156 ?auto_70157 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70187 - BLOCK
      ?auto_70188 - BLOCK
      ?auto_70189 - BLOCK
      ?auto_70190 - BLOCK
    )
    :vars
    (
      ?auto_70191 - BLOCK
      ?auto_70193 - BLOCK
      ?auto_70192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70191 ?auto_70190 ) ( ON-TABLE ?auto_70187 ) ( ON ?auto_70188 ?auto_70187 ) ( ON ?auto_70189 ?auto_70188 ) ( ON ?auto_70190 ?auto_70189 ) ( not ( = ?auto_70187 ?auto_70188 ) ) ( not ( = ?auto_70187 ?auto_70189 ) ) ( not ( = ?auto_70187 ?auto_70190 ) ) ( not ( = ?auto_70187 ?auto_70191 ) ) ( not ( = ?auto_70188 ?auto_70189 ) ) ( not ( = ?auto_70188 ?auto_70190 ) ) ( not ( = ?auto_70188 ?auto_70191 ) ) ( not ( = ?auto_70189 ?auto_70190 ) ) ( not ( = ?auto_70189 ?auto_70191 ) ) ( not ( = ?auto_70190 ?auto_70191 ) ) ( not ( = ?auto_70187 ?auto_70193 ) ) ( not ( = ?auto_70187 ?auto_70192 ) ) ( not ( = ?auto_70188 ?auto_70193 ) ) ( not ( = ?auto_70188 ?auto_70192 ) ) ( not ( = ?auto_70189 ?auto_70193 ) ) ( not ( = ?auto_70189 ?auto_70192 ) ) ( not ( = ?auto_70190 ?auto_70193 ) ) ( not ( = ?auto_70190 ?auto_70192 ) ) ( not ( = ?auto_70191 ?auto_70193 ) ) ( not ( = ?auto_70191 ?auto_70192 ) ) ( not ( = ?auto_70193 ?auto_70192 ) ) ( ON ?auto_70193 ?auto_70191 ) ( CLEAR ?auto_70193 ) ( HOLDING ?auto_70192 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70192 )
      ( MAKE-4PILE ?auto_70187 ?auto_70188 ?auto_70189 ?auto_70190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70274 - BLOCK
      ?auto_70275 - BLOCK
      ?auto_70276 - BLOCK
    )
    :vars
    (
      ?auto_70277 - BLOCK
      ?auto_70280 - BLOCK
      ?auto_70279 - BLOCK
      ?auto_70278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70274 ) ( not ( = ?auto_70274 ?auto_70275 ) ) ( not ( = ?auto_70274 ?auto_70276 ) ) ( not ( = ?auto_70275 ?auto_70276 ) ) ( ON ?auto_70276 ?auto_70277 ) ( not ( = ?auto_70274 ?auto_70277 ) ) ( not ( = ?auto_70275 ?auto_70277 ) ) ( not ( = ?auto_70276 ?auto_70277 ) ) ( CLEAR ?auto_70274 ) ( ON ?auto_70275 ?auto_70276 ) ( CLEAR ?auto_70275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70280 ) ( ON ?auto_70279 ?auto_70280 ) ( ON ?auto_70278 ?auto_70279 ) ( ON ?auto_70277 ?auto_70278 ) ( not ( = ?auto_70280 ?auto_70279 ) ) ( not ( = ?auto_70280 ?auto_70278 ) ) ( not ( = ?auto_70280 ?auto_70277 ) ) ( not ( = ?auto_70280 ?auto_70276 ) ) ( not ( = ?auto_70280 ?auto_70275 ) ) ( not ( = ?auto_70279 ?auto_70278 ) ) ( not ( = ?auto_70279 ?auto_70277 ) ) ( not ( = ?auto_70279 ?auto_70276 ) ) ( not ( = ?auto_70279 ?auto_70275 ) ) ( not ( = ?auto_70278 ?auto_70277 ) ) ( not ( = ?auto_70278 ?auto_70276 ) ) ( not ( = ?auto_70278 ?auto_70275 ) ) ( not ( = ?auto_70274 ?auto_70280 ) ) ( not ( = ?auto_70274 ?auto_70279 ) ) ( not ( = ?auto_70274 ?auto_70278 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70280 ?auto_70279 ?auto_70278 ?auto_70277 ?auto_70276 )
      ( MAKE-3PILE ?auto_70274 ?auto_70275 ?auto_70276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70281 - BLOCK
      ?auto_70282 - BLOCK
      ?auto_70283 - BLOCK
    )
    :vars
    (
      ?auto_70284 - BLOCK
      ?auto_70287 - BLOCK
      ?auto_70286 - BLOCK
      ?auto_70285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70281 ?auto_70282 ) ) ( not ( = ?auto_70281 ?auto_70283 ) ) ( not ( = ?auto_70282 ?auto_70283 ) ) ( ON ?auto_70283 ?auto_70284 ) ( not ( = ?auto_70281 ?auto_70284 ) ) ( not ( = ?auto_70282 ?auto_70284 ) ) ( not ( = ?auto_70283 ?auto_70284 ) ) ( ON ?auto_70282 ?auto_70283 ) ( CLEAR ?auto_70282 ) ( ON-TABLE ?auto_70287 ) ( ON ?auto_70286 ?auto_70287 ) ( ON ?auto_70285 ?auto_70286 ) ( ON ?auto_70284 ?auto_70285 ) ( not ( = ?auto_70287 ?auto_70286 ) ) ( not ( = ?auto_70287 ?auto_70285 ) ) ( not ( = ?auto_70287 ?auto_70284 ) ) ( not ( = ?auto_70287 ?auto_70283 ) ) ( not ( = ?auto_70287 ?auto_70282 ) ) ( not ( = ?auto_70286 ?auto_70285 ) ) ( not ( = ?auto_70286 ?auto_70284 ) ) ( not ( = ?auto_70286 ?auto_70283 ) ) ( not ( = ?auto_70286 ?auto_70282 ) ) ( not ( = ?auto_70285 ?auto_70284 ) ) ( not ( = ?auto_70285 ?auto_70283 ) ) ( not ( = ?auto_70285 ?auto_70282 ) ) ( not ( = ?auto_70281 ?auto_70287 ) ) ( not ( = ?auto_70281 ?auto_70286 ) ) ( not ( = ?auto_70281 ?auto_70285 ) ) ( HOLDING ?auto_70281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70281 )
      ( MAKE-3PILE ?auto_70281 ?auto_70282 ?auto_70283 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70288 - BLOCK
      ?auto_70289 - BLOCK
      ?auto_70290 - BLOCK
    )
    :vars
    (
      ?auto_70294 - BLOCK
      ?auto_70292 - BLOCK
      ?auto_70293 - BLOCK
      ?auto_70291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70288 ?auto_70289 ) ) ( not ( = ?auto_70288 ?auto_70290 ) ) ( not ( = ?auto_70289 ?auto_70290 ) ) ( ON ?auto_70290 ?auto_70294 ) ( not ( = ?auto_70288 ?auto_70294 ) ) ( not ( = ?auto_70289 ?auto_70294 ) ) ( not ( = ?auto_70290 ?auto_70294 ) ) ( ON ?auto_70289 ?auto_70290 ) ( ON-TABLE ?auto_70292 ) ( ON ?auto_70293 ?auto_70292 ) ( ON ?auto_70291 ?auto_70293 ) ( ON ?auto_70294 ?auto_70291 ) ( not ( = ?auto_70292 ?auto_70293 ) ) ( not ( = ?auto_70292 ?auto_70291 ) ) ( not ( = ?auto_70292 ?auto_70294 ) ) ( not ( = ?auto_70292 ?auto_70290 ) ) ( not ( = ?auto_70292 ?auto_70289 ) ) ( not ( = ?auto_70293 ?auto_70291 ) ) ( not ( = ?auto_70293 ?auto_70294 ) ) ( not ( = ?auto_70293 ?auto_70290 ) ) ( not ( = ?auto_70293 ?auto_70289 ) ) ( not ( = ?auto_70291 ?auto_70294 ) ) ( not ( = ?auto_70291 ?auto_70290 ) ) ( not ( = ?auto_70291 ?auto_70289 ) ) ( not ( = ?auto_70288 ?auto_70292 ) ) ( not ( = ?auto_70288 ?auto_70293 ) ) ( not ( = ?auto_70288 ?auto_70291 ) ) ( ON ?auto_70288 ?auto_70289 ) ( CLEAR ?auto_70288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70292 ?auto_70293 ?auto_70291 ?auto_70294 ?auto_70290 ?auto_70289 )
      ( MAKE-3PILE ?auto_70288 ?auto_70289 ?auto_70290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70298 - BLOCK
      ?auto_70299 - BLOCK
      ?auto_70300 - BLOCK
    )
    :vars
    (
      ?auto_70302 - BLOCK
      ?auto_70304 - BLOCK
      ?auto_70301 - BLOCK
      ?auto_70303 - BLOCK
      ?auto_70305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70298 ?auto_70299 ) ) ( not ( = ?auto_70298 ?auto_70300 ) ) ( not ( = ?auto_70299 ?auto_70300 ) ) ( ON ?auto_70300 ?auto_70302 ) ( not ( = ?auto_70298 ?auto_70302 ) ) ( not ( = ?auto_70299 ?auto_70302 ) ) ( not ( = ?auto_70300 ?auto_70302 ) ) ( ON ?auto_70299 ?auto_70300 ) ( CLEAR ?auto_70299 ) ( ON-TABLE ?auto_70304 ) ( ON ?auto_70301 ?auto_70304 ) ( ON ?auto_70303 ?auto_70301 ) ( ON ?auto_70302 ?auto_70303 ) ( not ( = ?auto_70304 ?auto_70301 ) ) ( not ( = ?auto_70304 ?auto_70303 ) ) ( not ( = ?auto_70304 ?auto_70302 ) ) ( not ( = ?auto_70304 ?auto_70300 ) ) ( not ( = ?auto_70304 ?auto_70299 ) ) ( not ( = ?auto_70301 ?auto_70303 ) ) ( not ( = ?auto_70301 ?auto_70302 ) ) ( not ( = ?auto_70301 ?auto_70300 ) ) ( not ( = ?auto_70301 ?auto_70299 ) ) ( not ( = ?auto_70303 ?auto_70302 ) ) ( not ( = ?auto_70303 ?auto_70300 ) ) ( not ( = ?auto_70303 ?auto_70299 ) ) ( not ( = ?auto_70298 ?auto_70304 ) ) ( not ( = ?auto_70298 ?auto_70301 ) ) ( not ( = ?auto_70298 ?auto_70303 ) ) ( ON ?auto_70298 ?auto_70305 ) ( CLEAR ?auto_70298 ) ( HAND-EMPTY ) ( not ( = ?auto_70298 ?auto_70305 ) ) ( not ( = ?auto_70299 ?auto_70305 ) ) ( not ( = ?auto_70300 ?auto_70305 ) ) ( not ( = ?auto_70302 ?auto_70305 ) ) ( not ( = ?auto_70304 ?auto_70305 ) ) ( not ( = ?auto_70301 ?auto_70305 ) ) ( not ( = ?auto_70303 ?auto_70305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70298 ?auto_70305 )
      ( MAKE-3PILE ?auto_70298 ?auto_70299 ?auto_70300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70306 - BLOCK
      ?auto_70307 - BLOCK
      ?auto_70308 - BLOCK
    )
    :vars
    (
      ?auto_70311 - BLOCK
      ?auto_70310 - BLOCK
      ?auto_70309 - BLOCK
      ?auto_70312 - BLOCK
      ?auto_70313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70306 ?auto_70307 ) ) ( not ( = ?auto_70306 ?auto_70308 ) ) ( not ( = ?auto_70307 ?auto_70308 ) ) ( ON ?auto_70308 ?auto_70311 ) ( not ( = ?auto_70306 ?auto_70311 ) ) ( not ( = ?auto_70307 ?auto_70311 ) ) ( not ( = ?auto_70308 ?auto_70311 ) ) ( ON-TABLE ?auto_70310 ) ( ON ?auto_70309 ?auto_70310 ) ( ON ?auto_70312 ?auto_70309 ) ( ON ?auto_70311 ?auto_70312 ) ( not ( = ?auto_70310 ?auto_70309 ) ) ( not ( = ?auto_70310 ?auto_70312 ) ) ( not ( = ?auto_70310 ?auto_70311 ) ) ( not ( = ?auto_70310 ?auto_70308 ) ) ( not ( = ?auto_70310 ?auto_70307 ) ) ( not ( = ?auto_70309 ?auto_70312 ) ) ( not ( = ?auto_70309 ?auto_70311 ) ) ( not ( = ?auto_70309 ?auto_70308 ) ) ( not ( = ?auto_70309 ?auto_70307 ) ) ( not ( = ?auto_70312 ?auto_70311 ) ) ( not ( = ?auto_70312 ?auto_70308 ) ) ( not ( = ?auto_70312 ?auto_70307 ) ) ( not ( = ?auto_70306 ?auto_70310 ) ) ( not ( = ?auto_70306 ?auto_70309 ) ) ( not ( = ?auto_70306 ?auto_70312 ) ) ( ON ?auto_70306 ?auto_70313 ) ( CLEAR ?auto_70306 ) ( not ( = ?auto_70306 ?auto_70313 ) ) ( not ( = ?auto_70307 ?auto_70313 ) ) ( not ( = ?auto_70308 ?auto_70313 ) ) ( not ( = ?auto_70311 ?auto_70313 ) ) ( not ( = ?auto_70310 ?auto_70313 ) ) ( not ( = ?auto_70309 ?auto_70313 ) ) ( not ( = ?auto_70312 ?auto_70313 ) ) ( HOLDING ?auto_70307 ) ( CLEAR ?auto_70308 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70310 ?auto_70309 ?auto_70312 ?auto_70311 ?auto_70308 ?auto_70307 )
      ( MAKE-3PILE ?auto_70306 ?auto_70307 ?auto_70308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70314 - BLOCK
      ?auto_70315 - BLOCK
      ?auto_70316 - BLOCK
    )
    :vars
    (
      ?auto_70321 - BLOCK
      ?auto_70320 - BLOCK
      ?auto_70318 - BLOCK
      ?auto_70317 - BLOCK
      ?auto_70319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70314 ?auto_70315 ) ) ( not ( = ?auto_70314 ?auto_70316 ) ) ( not ( = ?auto_70315 ?auto_70316 ) ) ( ON ?auto_70316 ?auto_70321 ) ( not ( = ?auto_70314 ?auto_70321 ) ) ( not ( = ?auto_70315 ?auto_70321 ) ) ( not ( = ?auto_70316 ?auto_70321 ) ) ( ON-TABLE ?auto_70320 ) ( ON ?auto_70318 ?auto_70320 ) ( ON ?auto_70317 ?auto_70318 ) ( ON ?auto_70321 ?auto_70317 ) ( not ( = ?auto_70320 ?auto_70318 ) ) ( not ( = ?auto_70320 ?auto_70317 ) ) ( not ( = ?auto_70320 ?auto_70321 ) ) ( not ( = ?auto_70320 ?auto_70316 ) ) ( not ( = ?auto_70320 ?auto_70315 ) ) ( not ( = ?auto_70318 ?auto_70317 ) ) ( not ( = ?auto_70318 ?auto_70321 ) ) ( not ( = ?auto_70318 ?auto_70316 ) ) ( not ( = ?auto_70318 ?auto_70315 ) ) ( not ( = ?auto_70317 ?auto_70321 ) ) ( not ( = ?auto_70317 ?auto_70316 ) ) ( not ( = ?auto_70317 ?auto_70315 ) ) ( not ( = ?auto_70314 ?auto_70320 ) ) ( not ( = ?auto_70314 ?auto_70318 ) ) ( not ( = ?auto_70314 ?auto_70317 ) ) ( ON ?auto_70314 ?auto_70319 ) ( not ( = ?auto_70314 ?auto_70319 ) ) ( not ( = ?auto_70315 ?auto_70319 ) ) ( not ( = ?auto_70316 ?auto_70319 ) ) ( not ( = ?auto_70321 ?auto_70319 ) ) ( not ( = ?auto_70320 ?auto_70319 ) ) ( not ( = ?auto_70318 ?auto_70319 ) ) ( not ( = ?auto_70317 ?auto_70319 ) ) ( CLEAR ?auto_70316 ) ( ON ?auto_70315 ?auto_70314 ) ( CLEAR ?auto_70315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70319 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70319 ?auto_70314 )
      ( MAKE-3PILE ?auto_70314 ?auto_70315 ?auto_70316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70322 - BLOCK
      ?auto_70323 - BLOCK
      ?auto_70324 - BLOCK
    )
    :vars
    (
      ?auto_70325 - BLOCK
      ?auto_70326 - BLOCK
      ?auto_70327 - BLOCK
      ?auto_70329 - BLOCK
      ?auto_70328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70322 ?auto_70323 ) ) ( not ( = ?auto_70322 ?auto_70324 ) ) ( not ( = ?auto_70323 ?auto_70324 ) ) ( not ( = ?auto_70322 ?auto_70325 ) ) ( not ( = ?auto_70323 ?auto_70325 ) ) ( not ( = ?auto_70324 ?auto_70325 ) ) ( ON-TABLE ?auto_70326 ) ( ON ?auto_70327 ?auto_70326 ) ( ON ?auto_70329 ?auto_70327 ) ( ON ?auto_70325 ?auto_70329 ) ( not ( = ?auto_70326 ?auto_70327 ) ) ( not ( = ?auto_70326 ?auto_70329 ) ) ( not ( = ?auto_70326 ?auto_70325 ) ) ( not ( = ?auto_70326 ?auto_70324 ) ) ( not ( = ?auto_70326 ?auto_70323 ) ) ( not ( = ?auto_70327 ?auto_70329 ) ) ( not ( = ?auto_70327 ?auto_70325 ) ) ( not ( = ?auto_70327 ?auto_70324 ) ) ( not ( = ?auto_70327 ?auto_70323 ) ) ( not ( = ?auto_70329 ?auto_70325 ) ) ( not ( = ?auto_70329 ?auto_70324 ) ) ( not ( = ?auto_70329 ?auto_70323 ) ) ( not ( = ?auto_70322 ?auto_70326 ) ) ( not ( = ?auto_70322 ?auto_70327 ) ) ( not ( = ?auto_70322 ?auto_70329 ) ) ( ON ?auto_70322 ?auto_70328 ) ( not ( = ?auto_70322 ?auto_70328 ) ) ( not ( = ?auto_70323 ?auto_70328 ) ) ( not ( = ?auto_70324 ?auto_70328 ) ) ( not ( = ?auto_70325 ?auto_70328 ) ) ( not ( = ?auto_70326 ?auto_70328 ) ) ( not ( = ?auto_70327 ?auto_70328 ) ) ( not ( = ?auto_70329 ?auto_70328 ) ) ( ON ?auto_70323 ?auto_70322 ) ( CLEAR ?auto_70323 ) ( ON-TABLE ?auto_70328 ) ( HOLDING ?auto_70324 ) ( CLEAR ?auto_70325 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70326 ?auto_70327 ?auto_70329 ?auto_70325 ?auto_70324 )
      ( MAKE-3PILE ?auto_70322 ?auto_70323 ?auto_70324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70330 - BLOCK
      ?auto_70331 - BLOCK
      ?auto_70332 - BLOCK
    )
    :vars
    (
      ?auto_70336 - BLOCK
      ?auto_70335 - BLOCK
      ?auto_70333 - BLOCK
      ?auto_70334 - BLOCK
      ?auto_70337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70330 ?auto_70331 ) ) ( not ( = ?auto_70330 ?auto_70332 ) ) ( not ( = ?auto_70331 ?auto_70332 ) ) ( not ( = ?auto_70330 ?auto_70336 ) ) ( not ( = ?auto_70331 ?auto_70336 ) ) ( not ( = ?auto_70332 ?auto_70336 ) ) ( ON-TABLE ?auto_70335 ) ( ON ?auto_70333 ?auto_70335 ) ( ON ?auto_70334 ?auto_70333 ) ( ON ?auto_70336 ?auto_70334 ) ( not ( = ?auto_70335 ?auto_70333 ) ) ( not ( = ?auto_70335 ?auto_70334 ) ) ( not ( = ?auto_70335 ?auto_70336 ) ) ( not ( = ?auto_70335 ?auto_70332 ) ) ( not ( = ?auto_70335 ?auto_70331 ) ) ( not ( = ?auto_70333 ?auto_70334 ) ) ( not ( = ?auto_70333 ?auto_70336 ) ) ( not ( = ?auto_70333 ?auto_70332 ) ) ( not ( = ?auto_70333 ?auto_70331 ) ) ( not ( = ?auto_70334 ?auto_70336 ) ) ( not ( = ?auto_70334 ?auto_70332 ) ) ( not ( = ?auto_70334 ?auto_70331 ) ) ( not ( = ?auto_70330 ?auto_70335 ) ) ( not ( = ?auto_70330 ?auto_70333 ) ) ( not ( = ?auto_70330 ?auto_70334 ) ) ( ON ?auto_70330 ?auto_70337 ) ( not ( = ?auto_70330 ?auto_70337 ) ) ( not ( = ?auto_70331 ?auto_70337 ) ) ( not ( = ?auto_70332 ?auto_70337 ) ) ( not ( = ?auto_70336 ?auto_70337 ) ) ( not ( = ?auto_70335 ?auto_70337 ) ) ( not ( = ?auto_70333 ?auto_70337 ) ) ( not ( = ?auto_70334 ?auto_70337 ) ) ( ON ?auto_70331 ?auto_70330 ) ( ON-TABLE ?auto_70337 ) ( CLEAR ?auto_70336 ) ( ON ?auto_70332 ?auto_70331 ) ( CLEAR ?auto_70332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70337 ?auto_70330 ?auto_70331 )
      ( MAKE-3PILE ?auto_70330 ?auto_70331 ?auto_70332 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70338 - BLOCK
      ?auto_70339 - BLOCK
      ?auto_70340 - BLOCK
    )
    :vars
    (
      ?auto_70342 - BLOCK
      ?auto_70341 - BLOCK
      ?auto_70343 - BLOCK
      ?auto_70345 - BLOCK
      ?auto_70344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70338 ?auto_70339 ) ) ( not ( = ?auto_70338 ?auto_70340 ) ) ( not ( = ?auto_70339 ?auto_70340 ) ) ( not ( = ?auto_70338 ?auto_70342 ) ) ( not ( = ?auto_70339 ?auto_70342 ) ) ( not ( = ?auto_70340 ?auto_70342 ) ) ( ON-TABLE ?auto_70341 ) ( ON ?auto_70343 ?auto_70341 ) ( ON ?auto_70345 ?auto_70343 ) ( not ( = ?auto_70341 ?auto_70343 ) ) ( not ( = ?auto_70341 ?auto_70345 ) ) ( not ( = ?auto_70341 ?auto_70342 ) ) ( not ( = ?auto_70341 ?auto_70340 ) ) ( not ( = ?auto_70341 ?auto_70339 ) ) ( not ( = ?auto_70343 ?auto_70345 ) ) ( not ( = ?auto_70343 ?auto_70342 ) ) ( not ( = ?auto_70343 ?auto_70340 ) ) ( not ( = ?auto_70343 ?auto_70339 ) ) ( not ( = ?auto_70345 ?auto_70342 ) ) ( not ( = ?auto_70345 ?auto_70340 ) ) ( not ( = ?auto_70345 ?auto_70339 ) ) ( not ( = ?auto_70338 ?auto_70341 ) ) ( not ( = ?auto_70338 ?auto_70343 ) ) ( not ( = ?auto_70338 ?auto_70345 ) ) ( ON ?auto_70338 ?auto_70344 ) ( not ( = ?auto_70338 ?auto_70344 ) ) ( not ( = ?auto_70339 ?auto_70344 ) ) ( not ( = ?auto_70340 ?auto_70344 ) ) ( not ( = ?auto_70342 ?auto_70344 ) ) ( not ( = ?auto_70341 ?auto_70344 ) ) ( not ( = ?auto_70343 ?auto_70344 ) ) ( not ( = ?auto_70345 ?auto_70344 ) ) ( ON ?auto_70339 ?auto_70338 ) ( ON-TABLE ?auto_70344 ) ( ON ?auto_70340 ?auto_70339 ) ( CLEAR ?auto_70340 ) ( HOLDING ?auto_70342 ) ( CLEAR ?auto_70345 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70341 ?auto_70343 ?auto_70345 ?auto_70342 )
      ( MAKE-3PILE ?auto_70338 ?auto_70339 ?auto_70340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70346 - BLOCK
      ?auto_70347 - BLOCK
      ?auto_70348 - BLOCK
    )
    :vars
    (
      ?auto_70352 - BLOCK
      ?auto_70351 - BLOCK
      ?auto_70349 - BLOCK
      ?auto_70350 - BLOCK
      ?auto_70353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70346 ?auto_70347 ) ) ( not ( = ?auto_70346 ?auto_70348 ) ) ( not ( = ?auto_70347 ?auto_70348 ) ) ( not ( = ?auto_70346 ?auto_70352 ) ) ( not ( = ?auto_70347 ?auto_70352 ) ) ( not ( = ?auto_70348 ?auto_70352 ) ) ( ON-TABLE ?auto_70351 ) ( ON ?auto_70349 ?auto_70351 ) ( ON ?auto_70350 ?auto_70349 ) ( not ( = ?auto_70351 ?auto_70349 ) ) ( not ( = ?auto_70351 ?auto_70350 ) ) ( not ( = ?auto_70351 ?auto_70352 ) ) ( not ( = ?auto_70351 ?auto_70348 ) ) ( not ( = ?auto_70351 ?auto_70347 ) ) ( not ( = ?auto_70349 ?auto_70350 ) ) ( not ( = ?auto_70349 ?auto_70352 ) ) ( not ( = ?auto_70349 ?auto_70348 ) ) ( not ( = ?auto_70349 ?auto_70347 ) ) ( not ( = ?auto_70350 ?auto_70352 ) ) ( not ( = ?auto_70350 ?auto_70348 ) ) ( not ( = ?auto_70350 ?auto_70347 ) ) ( not ( = ?auto_70346 ?auto_70351 ) ) ( not ( = ?auto_70346 ?auto_70349 ) ) ( not ( = ?auto_70346 ?auto_70350 ) ) ( ON ?auto_70346 ?auto_70353 ) ( not ( = ?auto_70346 ?auto_70353 ) ) ( not ( = ?auto_70347 ?auto_70353 ) ) ( not ( = ?auto_70348 ?auto_70353 ) ) ( not ( = ?auto_70352 ?auto_70353 ) ) ( not ( = ?auto_70351 ?auto_70353 ) ) ( not ( = ?auto_70349 ?auto_70353 ) ) ( not ( = ?auto_70350 ?auto_70353 ) ) ( ON ?auto_70347 ?auto_70346 ) ( ON-TABLE ?auto_70353 ) ( ON ?auto_70348 ?auto_70347 ) ( CLEAR ?auto_70350 ) ( ON ?auto_70352 ?auto_70348 ) ( CLEAR ?auto_70352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70353 ?auto_70346 ?auto_70347 ?auto_70348 )
      ( MAKE-3PILE ?auto_70346 ?auto_70347 ?auto_70348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70354 - BLOCK
      ?auto_70355 - BLOCK
      ?auto_70356 - BLOCK
    )
    :vars
    (
      ?auto_70361 - BLOCK
      ?auto_70359 - BLOCK
      ?auto_70360 - BLOCK
      ?auto_70357 - BLOCK
      ?auto_70358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70354 ?auto_70355 ) ) ( not ( = ?auto_70354 ?auto_70356 ) ) ( not ( = ?auto_70355 ?auto_70356 ) ) ( not ( = ?auto_70354 ?auto_70361 ) ) ( not ( = ?auto_70355 ?auto_70361 ) ) ( not ( = ?auto_70356 ?auto_70361 ) ) ( ON-TABLE ?auto_70359 ) ( ON ?auto_70360 ?auto_70359 ) ( not ( = ?auto_70359 ?auto_70360 ) ) ( not ( = ?auto_70359 ?auto_70357 ) ) ( not ( = ?auto_70359 ?auto_70361 ) ) ( not ( = ?auto_70359 ?auto_70356 ) ) ( not ( = ?auto_70359 ?auto_70355 ) ) ( not ( = ?auto_70360 ?auto_70357 ) ) ( not ( = ?auto_70360 ?auto_70361 ) ) ( not ( = ?auto_70360 ?auto_70356 ) ) ( not ( = ?auto_70360 ?auto_70355 ) ) ( not ( = ?auto_70357 ?auto_70361 ) ) ( not ( = ?auto_70357 ?auto_70356 ) ) ( not ( = ?auto_70357 ?auto_70355 ) ) ( not ( = ?auto_70354 ?auto_70359 ) ) ( not ( = ?auto_70354 ?auto_70360 ) ) ( not ( = ?auto_70354 ?auto_70357 ) ) ( ON ?auto_70354 ?auto_70358 ) ( not ( = ?auto_70354 ?auto_70358 ) ) ( not ( = ?auto_70355 ?auto_70358 ) ) ( not ( = ?auto_70356 ?auto_70358 ) ) ( not ( = ?auto_70361 ?auto_70358 ) ) ( not ( = ?auto_70359 ?auto_70358 ) ) ( not ( = ?auto_70360 ?auto_70358 ) ) ( not ( = ?auto_70357 ?auto_70358 ) ) ( ON ?auto_70355 ?auto_70354 ) ( ON-TABLE ?auto_70358 ) ( ON ?auto_70356 ?auto_70355 ) ( ON ?auto_70361 ?auto_70356 ) ( CLEAR ?auto_70361 ) ( HOLDING ?auto_70357 ) ( CLEAR ?auto_70360 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70359 ?auto_70360 ?auto_70357 )
      ( MAKE-3PILE ?auto_70354 ?auto_70355 ?auto_70356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70362 - BLOCK
      ?auto_70363 - BLOCK
      ?auto_70364 - BLOCK
    )
    :vars
    (
      ?auto_70368 - BLOCK
      ?auto_70367 - BLOCK
      ?auto_70366 - BLOCK
      ?auto_70365 - BLOCK
      ?auto_70369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70362 ?auto_70363 ) ) ( not ( = ?auto_70362 ?auto_70364 ) ) ( not ( = ?auto_70363 ?auto_70364 ) ) ( not ( = ?auto_70362 ?auto_70368 ) ) ( not ( = ?auto_70363 ?auto_70368 ) ) ( not ( = ?auto_70364 ?auto_70368 ) ) ( ON-TABLE ?auto_70367 ) ( ON ?auto_70366 ?auto_70367 ) ( not ( = ?auto_70367 ?auto_70366 ) ) ( not ( = ?auto_70367 ?auto_70365 ) ) ( not ( = ?auto_70367 ?auto_70368 ) ) ( not ( = ?auto_70367 ?auto_70364 ) ) ( not ( = ?auto_70367 ?auto_70363 ) ) ( not ( = ?auto_70366 ?auto_70365 ) ) ( not ( = ?auto_70366 ?auto_70368 ) ) ( not ( = ?auto_70366 ?auto_70364 ) ) ( not ( = ?auto_70366 ?auto_70363 ) ) ( not ( = ?auto_70365 ?auto_70368 ) ) ( not ( = ?auto_70365 ?auto_70364 ) ) ( not ( = ?auto_70365 ?auto_70363 ) ) ( not ( = ?auto_70362 ?auto_70367 ) ) ( not ( = ?auto_70362 ?auto_70366 ) ) ( not ( = ?auto_70362 ?auto_70365 ) ) ( ON ?auto_70362 ?auto_70369 ) ( not ( = ?auto_70362 ?auto_70369 ) ) ( not ( = ?auto_70363 ?auto_70369 ) ) ( not ( = ?auto_70364 ?auto_70369 ) ) ( not ( = ?auto_70368 ?auto_70369 ) ) ( not ( = ?auto_70367 ?auto_70369 ) ) ( not ( = ?auto_70366 ?auto_70369 ) ) ( not ( = ?auto_70365 ?auto_70369 ) ) ( ON ?auto_70363 ?auto_70362 ) ( ON-TABLE ?auto_70369 ) ( ON ?auto_70364 ?auto_70363 ) ( ON ?auto_70368 ?auto_70364 ) ( CLEAR ?auto_70366 ) ( ON ?auto_70365 ?auto_70368 ) ( CLEAR ?auto_70365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70369 ?auto_70362 ?auto_70363 ?auto_70364 ?auto_70368 )
      ( MAKE-3PILE ?auto_70362 ?auto_70363 ?auto_70364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70370 - BLOCK
      ?auto_70371 - BLOCK
      ?auto_70372 - BLOCK
    )
    :vars
    (
      ?auto_70375 - BLOCK
      ?auto_70374 - BLOCK
      ?auto_70373 - BLOCK
      ?auto_70376 - BLOCK
      ?auto_70377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70370 ?auto_70371 ) ) ( not ( = ?auto_70370 ?auto_70372 ) ) ( not ( = ?auto_70371 ?auto_70372 ) ) ( not ( = ?auto_70370 ?auto_70375 ) ) ( not ( = ?auto_70371 ?auto_70375 ) ) ( not ( = ?auto_70372 ?auto_70375 ) ) ( ON-TABLE ?auto_70374 ) ( not ( = ?auto_70374 ?auto_70373 ) ) ( not ( = ?auto_70374 ?auto_70376 ) ) ( not ( = ?auto_70374 ?auto_70375 ) ) ( not ( = ?auto_70374 ?auto_70372 ) ) ( not ( = ?auto_70374 ?auto_70371 ) ) ( not ( = ?auto_70373 ?auto_70376 ) ) ( not ( = ?auto_70373 ?auto_70375 ) ) ( not ( = ?auto_70373 ?auto_70372 ) ) ( not ( = ?auto_70373 ?auto_70371 ) ) ( not ( = ?auto_70376 ?auto_70375 ) ) ( not ( = ?auto_70376 ?auto_70372 ) ) ( not ( = ?auto_70376 ?auto_70371 ) ) ( not ( = ?auto_70370 ?auto_70374 ) ) ( not ( = ?auto_70370 ?auto_70373 ) ) ( not ( = ?auto_70370 ?auto_70376 ) ) ( ON ?auto_70370 ?auto_70377 ) ( not ( = ?auto_70370 ?auto_70377 ) ) ( not ( = ?auto_70371 ?auto_70377 ) ) ( not ( = ?auto_70372 ?auto_70377 ) ) ( not ( = ?auto_70375 ?auto_70377 ) ) ( not ( = ?auto_70374 ?auto_70377 ) ) ( not ( = ?auto_70373 ?auto_70377 ) ) ( not ( = ?auto_70376 ?auto_70377 ) ) ( ON ?auto_70371 ?auto_70370 ) ( ON-TABLE ?auto_70377 ) ( ON ?auto_70372 ?auto_70371 ) ( ON ?auto_70375 ?auto_70372 ) ( ON ?auto_70376 ?auto_70375 ) ( CLEAR ?auto_70376 ) ( HOLDING ?auto_70373 ) ( CLEAR ?auto_70374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70374 ?auto_70373 )
      ( MAKE-3PILE ?auto_70370 ?auto_70371 ?auto_70372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70378 - BLOCK
      ?auto_70379 - BLOCK
      ?auto_70380 - BLOCK
    )
    :vars
    (
      ?auto_70383 - BLOCK
      ?auto_70384 - BLOCK
      ?auto_70382 - BLOCK
      ?auto_70385 - BLOCK
      ?auto_70381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70378 ?auto_70379 ) ) ( not ( = ?auto_70378 ?auto_70380 ) ) ( not ( = ?auto_70379 ?auto_70380 ) ) ( not ( = ?auto_70378 ?auto_70383 ) ) ( not ( = ?auto_70379 ?auto_70383 ) ) ( not ( = ?auto_70380 ?auto_70383 ) ) ( ON-TABLE ?auto_70384 ) ( not ( = ?auto_70384 ?auto_70382 ) ) ( not ( = ?auto_70384 ?auto_70385 ) ) ( not ( = ?auto_70384 ?auto_70383 ) ) ( not ( = ?auto_70384 ?auto_70380 ) ) ( not ( = ?auto_70384 ?auto_70379 ) ) ( not ( = ?auto_70382 ?auto_70385 ) ) ( not ( = ?auto_70382 ?auto_70383 ) ) ( not ( = ?auto_70382 ?auto_70380 ) ) ( not ( = ?auto_70382 ?auto_70379 ) ) ( not ( = ?auto_70385 ?auto_70383 ) ) ( not ( = ?auto_70385 ?auto_70380 ) ) ( not ( = ?auto_70385 ?auto_70379 ) ) ( not ( = ?auto_70378 ?auto_70384 ) ) ( not ( = ?auto_70378 ?auto_70382 ) ) ( not ( = ?auto_70378 ?auto_70385 ) ) ( ON ?auto_70378 ?auto_70381 ) ( not ( = ?auto_70378 ?auto_70381 ) ) ( not ( = ?auto_70379 ?auto_70381 ) ) ( not ( = ?auto_70380 ?auto_70381 ) ) ( not ( = ?auto_70383 ?auto_70381 ) ) ( not ( = ?auto_70384 ?auto_70381 ) ) ( not ( = ?auto_70382 ?auto_70381 ) ) ( not ( = ?auto_70385 ?auto_70381 ) ) ( ON ?auto_70379 ?auto_70378 ) ( ON-TABLE ?auto_70381 ) ( ON ?auto_70380 ?auto_70379 ) ( ON ?auto_70383 ?auto_70380 ) ( ON ?auto_70385 ?auto_70383 ) ( CLEAR ?auto_70384 ) ( ON ?auto_70382 ?auto_70385 ) ( CLEAR ?auto_70382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70381 ?auto_70378 ?auto_70379 ?auto_70380 ?auto_70383 ?auto_70385 )
      ( MAKE-3PILE ?auto_70378 ?auto_70379 ?auto_70380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70386 - BLOCK
      ?auto_70387 - BLOCK
      ?auto_70388 - BLOCK
    )
    :vars
    (
      ?auto_70389 - BLOCK
      ?auto_70391 - BLOCK
      ?auto_70390 - BLOCK
      ?auto_70392 - BLOCK
      ?auto_70393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70386 ?auto_70387 ) ) ( not ( = ?auto_70386 ?auto_70388 ) ) ( not ( = ?auto_70387 ?auto_70388 ) ) ( not ( = ?auto_70386 ?auto_70389 ) ) ( not ( = ?auto_70387 ?auto_70389 ) ) ( not ( = ?auto_70388 ?auto_70389 ) ) ( not ( = ?auto_70391 ?auto_70390 ) ) ( not ( = ?auto_70391 ?auto_70392 ) ) ( not ( = ?auto_70391 ?auto_70389 ) ) ( not ( = ?auto_70391 ?auto_70388 ) ) ( not ( = ?auto_70391 ?auto_70387 ) ) ( not ( = ?auto_70390 ?auto_70392 ) ) ( not ( = ?auto_70390 ?auto_70389 ) ) ( not ( = ?auto_70390 ?auto_70388 ) ) ( not ( = ?auto_70390 ?auto_70387 ) ) ( not ( = ?auto_70392 ?auto_70389 ) ) ( not ( = ?auto_70392 ?auto_70388 ) ) ( not ( = ?auto_70392 ?auto_70387 ) ) ( not ( = ?auto_70386 ?auto_70391 ) ) ( not ( = ?auto_70386 ?auto_70390 ) ) ( not ( = ?auto_70386 ?auto_70392 ) ) ( ON ?auto_70386 ?auto_70393 ) ( not ( = ?auto_70386 ?auto_70393 ) ) ( not ( = ?auto_70387 ?auto_70393 ) ) ( not ( = ?auto_70388 ?auto_70393 ) ) ( not ( = ?auto_70389 ?auto_70393 ) ) ( not ( = ?auto_70391 ?auto_70393 ) ) ( not ( = ?auto_70390 ?auto_70393 ) ) ( not ( = ?auto_70392 ?auto_70393 ) ) ( ON ?auto_70387 ?auto_70386 ) ( ON-TABLE ?auto_70393 ) ( ON ?auto_70388 ?auto_70387 ) ( ON ?auto_70389 ?auto_70388 ) ( ON ?auto_70392 ?auto_70389 ) ( ON ?auto_70390 ?auto_70392 ) ( CLEAR ?auto_70390 ) ( HOLDING ?auto_70391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70391 )
      ( MAKE-3PILE ?auto_70386 ?auto_70387 ?auto_70388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70394 - BLOCK
      ?auto_70395 - BLOCK
      ?auto_70396 - BLOCK
    )
    :vars
    (
      ?auto_70399 - BLOCK
      ?auto_70397 - BLOCK
      ?auto_70398 - BLOCK
      ?auto_70400 - BLOCK
      ?auto_70401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70394 ?auto_70395 ) ) ( not ( = ?auto_70394 ?auto_70396 ) ) ( not ( = ?auto_70395 ?auto_70396 ) ) ( not ( = ?auto_70394 ?auto_70399 ) ) ( not ( = ?auto_70395 ?auto_70399 ) ) ( not ( = ?auto_70396 ?auto_70399 ) ) ( not ( = ?auto_70397 ?auto_70398 ) ) ( not ( = ?auto_70397 ?auto_70400 ) ) ( not ( = ?auto_70397 ?auto_70399 ) ) ( not ( = ?auto_70397 ?auto_70396 ) ) ( not ( = ?auto_70397 ?auto_70395 ) ) ( not ( = ?auto_70398 ?auto_70400 ) ) ( not ( = ?auto_70398 ?auto_70399 ) ) ( not ( = ?auto_70398 ?auto_70396 ) ) ( not ( = ?auto_70398 ?auto_70395 ) ) ( not ( = ?auto_70400 ?auto_70399 ) ) ( not ( = ?auto_70400 ?auto_70396 ) ) ( not ( = ?auto_70400 ?auto_70395 ) ) ( not ( = ?auto_70394 ?auto_70397 ) ) ( not ( = ?auto_70394 ?auto_70398 ) ) ( not ( = ?auto_70394 ?auto_70400 ) ) ( ON ?auto_70394 ?auto_70401 ) ( not ( = ?auto_70394 ?auto_70401 ) ) ( not ( = ?auto_70395 ?auto_70401 ) ) ( not ( = ?auto_70396 ?auto_70401 ) ) ( not ( = ?auto_70399 ?auto_70401 ) ) ( not ( = ?auto_70397 ?auto_70401 ) ) ( not ( = ?auto_70398 ?auto_70401 ) ) ( not ( = ?auto_70400 ?auto_70401 ) ) ( ON ?auto_70395 ?auto_70394 ) ( ON-TABLE ?auto_70401 ) ( ON ?auto_70396 ?auto_70395 ) ( ON ?auto_70399 ?auto_70396 ) ( ON ?auto_70400 ?auto_70399 ) ( ON ?auto_70398 ?auto_70400 ) ( ON ?auto_70397 ?auto_70398 ) ( CLEAR ?auto_70397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70401 ?auto_70394 ?auto_70395 ?auto_70396 ?auto_70399 ?auto_70400 ?auto_70398 )
      ( MAKE-3PILE ?auto_70394 ?auto_70395 ?auto_70396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70421 - BLOCK
      ?auto_70422 - BLOCK
      ?auto_70423 - BLOCK
    )
    :vars
    (
      ?auto_70425 - BLOCK
      ?auto_70426 - BLOCK
      ?auto_70424 - BLOCK
      ?auto_70427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70425 ?auto_70423 ) ( ON-TABLE ?auto_70421 ) ( ON ?auto_70422 ?auto_70421 ) ( ON ?auto_70423 ?auto_70422 ) ( not ( = ?auto_70421 ?auto_70422 ) ) ( not ( = ?auto_70421 ?auto_70423 ) ) ( not ( = ?auto_70421 ?auto_70425 ) ) ( not ( = ?auto_70422 ?auto_70423 ) ) ( not ( = ?auto_70422 ?auto_70425 ) ) ( not ( = ?auto_70423 ?auto_70425 ) ) ( not ( = ?auto_70421 ?auto_70426 ) ) ( not ( = ?auto_70421 ?auto_70424 ) ) ( not ( = ?auto_70422 ?auto_70426 ) ) ( not ( = ?auto_70422 ?auto_70424 ) ) ( not ( = ?auto_70423 ?auto_70426 ) ) ( not ( = ?auto_70423 ?auto_70424 ) ) ( not ( = ?auto_70425 ?auto_70426 ) ) ( not ( = ?auto_70425 ?auto_70424 ) ) ( not ( = ?auto_70426 ?auto_70424 ) ) ( ON ?auto_70426 ?auto_70425 ) ( CLEAR ?auto_70426 ) ( HOLDING ?auto_70424 ) ( CLEAR ?auto_70427 ) ( ON-TABLE ?auto_70427 ) ( not ( = ?auto_70427 ?auto_70424 ) ) ( not ( = ?auto_70421 ?auto_70427 ) ) ( not ( = ?auto_70422 ?auto_70427 ) ) ( not ( = ?auto_70423 ?auto_70427 ) ) ( not ( = ?auto_70425 ?auto_70427 ) ) ( not ( = ?auto_70426 ?auto_70427 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70427 ?auto_70424 )
      ( MAKE-3PILE ?auto_70421 ?auto_70422 ?auto_70423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70428 - BLOCK
      ?auto_70429 - BLOCK
      ?auto_70430 - BLOCK
    )
    :vars
    (
      ?auto_70434 - BLOCK
      ?auto_70432 - BLOCK
      ?auto_70431 - BLOCK
      ?auto_70433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70434 ?auto_70430 ) ( ON-TABLE ?auto_70428 ) ( ON ?auto_70429 ?auto_70428 ) ( ON ?auto_70430 ?auto_70429 ) ( not ( = ?auto_70428 ?auto_70429 ) ) ( not ( = ?auto_70428 ?auto_70430 ) ) ( not ( = ?auto_70428 ?auto_70434 ) ) ( not ( = ?auto_70429 ?auto_70430 ) ) ( not ( = ?auto_70429 ?auto_70434 ) ) ( not ( = ?auto_70430 ?auto_70434 ) ) ( not ( = ?auto_70428 ?auto_70432 ) ) ( not ( = ?auto_70428 ?auto_70431 ) ) ( not ( = ?auto_70429 ?auto_70432 ) ) ( not ( = ?auto_70429 ?auto_70431 ) ) ( not ( = ?auto_70430 ?auto_70432 ) ) ( not ( = ?auto_70430 ?auto_70431 ) ) ( not ( = ?auto_70434 ?auto_70432 ) ) ( not ( = ?auto_70434 ?auto_70431 ) ) ( not ( = ?auto_70432 ?auto_70431 ) ) ( ON ?auto_70432 ?auto_70434 ) ( CLEAR ?auto_70433 ) ( ON-TABLE ?auto_70433 ) ( not ( = ?auto_70433 ?auto_70431 ) ) ( not ( = ?auto_70428 ?auto_70433 ) ) ( not ( = ?auto_70429 ?auto_70433 ) ) ( not ( = ?auto_70430 ?auto_70433 ) ) ( not ( = ?auto_70434 ?auto_70433 ) ) ( not ( = ?auto_70432 ?auto_70433 ) ) ( ON ?auto_70431 ?auto_70432 ) ( CLEAR ?auto_70431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70428 ?auto_70429 ?auto_70430 ?auto_70434 ?auto_70432 )
      ( MAKE-3PILE ?auto_70428 ?auto_70429 ?auto_70430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70435 - BLOCK
      ?auto_70436 - BLOCK
      ?auto_70437 - BLOCK
    )
    :vars
    (
      ?auto_70440 - BLOCK
      ?auto_70438 - BLOCK
      ?auto_70439 - BLOCK
      ?auto_70441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70440 ?auto_70437 ) ( ON-TABLE ?auto_70435 ) ( ON ?auto_70436 ?auto_70435 ) ( ON ?auto_70437 ?auto_70436 ) ( not ( = ?auto_70435 ?auto_70436 ) ) ( not ( = ?auto_70435 ?auto_70437 ) ) ( not ( = ?auto_70435 ?auto_70440 ) ) ( not ( = ?auto_70436 ?auto_70437 ) ) ( not ( = ?auto_70436 ?auto_70440 ) ) ( not ( = ?auto_70437 ?auto_70440 ) ) ( not ( = ?auto_70435 ?auto_70438 ) ) ( not ( = ?auto_70435 ?auto_70439 ) ) ( not ( = ?auto_70436 ?auto_70438 ) ) ( not ( = ?auto_70436 ?auto_70439 ) ) ( not ( = ?auto_70437 ?auto_70438 ) ) ( not ( = ?auto_70437 ?auto_70439 ) ) ( not ( = ?auto_70440 ?auto_70438 ) ) ( not ( = ?auto_70440 ?auto_70439 ) ) ( not ( = ?auto_70438 ?auto_70439 ) ) ( ON ?auto_70438 ?auto_70440 ) ( not ( = ?auto_70441 ?auto_70439 ) ) ( not ( = ?auto_70435 ?auto_70441 ) ) ( not ( = ?auto_70436 ?auto_70441 ) ) ( not ( = ?auto_70437 ?auto_70441 ) ) ( not ( = ?auto_70440 ?auto_70441 ) ) ( not ( = ?auto_70438 ?auto_70441 ) ) ( ON ?auto_70439 ?auto_70438 ) ( CLEAR ?auto_70439 ) ( HOLDING ?auto_70441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70441 )
      ( MAKE-3PILE ?auto_70435 ?auto_70436 ?auto_70437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70452 - BLOCK
      ?auto_70453 - BLOCK
      ?auto_70454 - BLOCK
    )
    :vars
    (
      ?auto_70456 - BLOCK
      ?auto_70458 - BLOCK
      ?auto_70455 - BLOCK
      ?auto_70457 - BLOCK
      ?auto_70459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70456 ?auto_70454 ) ( ON-TABLE ?auto_70452 ) ( ON ?auto_70453 ?auto_70452 ) ( ON ?auto_70454 ?auto_70453 ) ( not ( = ?auto_70452 ?auto_70453 ) ) ( not ( = ?auto_70452 ?auto_70454 ) ) ( not ( = ?auto_70452 ?auto_70456 ) ) ( not ( = ?auto_70453 ?auto_70454 ) ) ( not ( = ?auto_70453 ?auto_70456 ) ) ( not ( = ?auto_70454 ?auto_70456 ) ) ( not ( = ?auto_70452 ?auto_70458 ) ) ( not ( = ?auto_70452 ?auto_70455 ) ) ( not ( = ?auto_70453 ?auto_70458 ) ) ( not ( = ?auto_70453 ?auto_70455 ) ) ( not ( = ?auto_70454 ?auto_70458 ) ) ( not ( = ?auto_70454 ?auto_70455 ) ) ( not ( = ?auto_70456 ?auto_70458 ) ) ( not ( = ?auto_70456 ?auto_70455 ) ) ( not ( = ?auto_70458 ?auto_70455 ) ) ( ON ?auto_70458 ?auto_70456 ) ( not ( = ?auto_70457 ?auto_70455 ) ) ( not ( = ?auto_70452 ?auto_70457 ) ) ( not ( = ?auto_70453 ?auto_70457 ) ) ( not ( = ?auto_70454 ?auto_70457 ) ) ( not ( = ?auto_70456 ?auto_70457 ) ) ( not ( = ?auto_70458 ?auto_70457 ) ) ( ON ?auto_70455 ?auto_70458 ) ( CLEAR ?auto_70455 ) ( ON ?auto_70457 ?auto_70459 ) ( CLEAR ?auto_70457 ) ( HAND-EMPTY ) ( not ( = ?auto_70452 ?auto_70459 ) ) ( not ( = ?auto_70453 ?auto_70459 ) ) ( not ( = ?auto_70454 ?auto_70459 ) ) ( not ( = ?auto_70456 ?auto_70459 ) ) ( not ( = ?auto_70458 ?auto_70459 ) ) ( not ( = ?auto_70455 ?auto_70459 ) ) ( not ( = ?auto_70457 ?auto_70459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70457 ?auto_70459 )
      ( MAKE-3PILE ?auto_70452 ?auto_70453 ?auto_70454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70460 - BLOCK
      ?auto_70461 - BLOCK
      ?auto_70462 - BLOCK
    )
    :vars
    (
      ?auto_70465 - BLOCK
      ?auto_70466 - BLOCK
      ?auto_70463 - BLOCK
      ?auto_70464 - BLOCK
      ?auto_70467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70465 ?auto_70462 ) ( ON-TABLE ?auto_70460 ) ( ON ?auto_70461 ?auto_70460 ) ( ON ?auto_70462 ?auto_70461 ) ( not ( = ?auto_70460 ?auto_70461 ) ) ( not ( = ?auto_70460 ?auto_70462 ) ) ( not ( = ?auto_70460 ?auto_70465 ) ) ( not ( = ?auto_70461 ?auto_70462 ) ) ( not ( = ?auto_70461 ?auto_70465 ) ) ( not ( = ?auto_70462 ?auto_70465 ) ) ( not ( = ?auto_70460 ?auto_70466 ) ) ( not ( = ?auto_70460 ?auto_70463 ) ) ( not ( = ?auto_70461 ?auto_70466 ) ) ( not ( = ?auto_70461 ?auto_70463 ) ) ( not ( = ?auto_70462 ?auto_70466 ) ) ( not ( = ?auto_70462 ?auto_70463 ) ) ( not ( = ?auto_70465 ?auto_70466 ) ) ( not ( = ?auto_70465 ?auto_70463 ) ) ( not ( = ?auto_70466 ?auto_70463 ) ) ( ON ?auto_70466 ?auto_70465 ) ( not ( = ?auto_70464 ?auto_70463 ) ) ( not ( = ?auto_70460 ?auto_70464 ) ) ( not ( = ?auto_70461 ?auto_70464 ) ) ( not ( = ?auto_70462 ?auto_70464 ) ) ( not ( = ?auto_70465 ?auto_70464 ) ) ( not ( = ?auto_70466 ?auto_70464 ) ) ( ON ?auto_70464 ?auto_70467 ) ( CLEAR ?auto_70464 ) ( not ( = ?auto_70460 ?auto_70467 ) ) ( not ( = ?auto_70461 ?auto_70467 ) ) ( not ( = ?auto_70462 ?auto_70467 ) ) ( not ( = ?auto_70465 ?auto_70467 ) ) ( not ( = ?auto_70466 ?auto_70467 ) ) ( not ( = ?auto_70463 ?auto_70467 ) ) ( not ( = ?auto_70464 ?auto_70467 ) ) ( HOLDING ?auto_70463 ) ( CLEAR ?auto_70466 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70460 ?auto_70461 ?auto_70462 ?auto_70465 ?auto_70466 ?auto_70463 )
      ( MAKE-3PILE ?auto_70460 ?auto_70461 ?auto_70462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70522 - BLOCK
      ?auto_70523 - BLOCK
      ?auto_70524 - BLOCK
      ?auto_70525 - BLOCK
    )
    :vars
    (
      ?auto_70526 - BLOCK
      ?auto_70528 - BLOCK
      ?auto_70527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70522 ) ( ON ?auto_70523 ?auto_70522 ) ( not ( = ?auto_70522 ?auto_70523 ) ) ( not ( = ?auto_70522 ?auto_70524 ) ) ( not ( = ?auto_70522 ?auto_70525 ) ) ( not ( = ?auto_70523 ?auto_70524 ) ) ( not ( = ?auto_70523 ?auto_70525 ) ) ( not ( = ?auto_70524 ?auto_70525 ) ) ( ON ?auto_70525 ?auto_70526 ) ( not ( = ?auto_70522 ?auto_70526 ) ) ( not ( = ?auto_70523 ?auto_70526 ) ) ( not ( = ?auto_70524 ?auto_70526 ) ) ( not ( = ?auto_70525 ?auto_70526 ) ) ( CLEAR ?auto_70523 ) ( ON ?auto_70524 ?auto_70525 ) ( CLEAR ?auto_70524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70528 ) ( ON ?auto_70527 ?auto_70528 ) ( ON ?auto_70526 ?auto_70527 ) ( not ( = ?auto_70528 ?auto_70527 ) ) ( not ( = ?auto_70528 ?auto_70526 ) ) ( not ( = ?auto_70528 ?auto_70525 ) ) ( not ( = ?auto_70528 ?auto_70524 ) ) ( not ( = ?auto_70527 ?auto_70526 ) ) ( not ( = ?auto_70527 ?auto_70525 ) ) ( not ( = ?auto_70527 ?auto_70524 ) ) ( not ( = ?auto_70522 ?auto_70528 ) ) ( not ( = ?auto_70522 ?auto_70527 ) ) ( not ( = ?auto_70523 ?auto_70528 ) ) ( not ( = ?auto_70523 ?auto_70527 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70528 ?auto_70527 ?auto_70526 ?auto_70525 )
      ( MAKE-4PILE ?auto_70522 ?auto_70523 ?auto_70524 ?auto_70525 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70529 - BLOCK
      ?auto_70530 - BLOCK
      ?auto_70531 - BLOCK
      ?auto_70532 - BLOCK
    )
    :vars
    (
      ?auto_70533 - BLOCK
      ?auto_70534 - BLOCK
      ?auto_70535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70529 ) ( not ( = ?auto_70529 ?auto_70530 ) ) ( not ( = ?auto_70529 ?auto_70531 ) ) ( not ( = ?auto_70529 ?auto_70532 ) ) ( not ( = ?auto_70530 ?auto_70531 ) ) ( not ( = ?auto_70530 ?auto_70532 ) ) ( not ( = ?auto_70531 ?auto_70532 ) ) ( ON ?auto_70532 ?auto_70533 ) ( not ( = ?auto_70529 ?auto_70533 ) ) ( not ( = ?auto_70530 ?auto_70533 ) ) ( not ( = ?auto_70531 ?auto_70533 ) ) ( not ( = ?auto_70532 ?auto_70533 ) ) ( ON ?auto_70531 ?auto_70532 ) ( CLEAR ?auto_70531 ) ( ON-TABLE ?auto_70534 ) ( ON ?auto_70535 ?auto_70534 ) ( ON ?auto_70533 ?auto_70535 ) ( not ( = ?auto_70534 ?auto_70535 ) ) ( not ( = ?auto_70534 ?auto_70533 ) ) ( not ( = ?auto_70534 ?auto_70532 ) ) ( not ( = ?auto_70534 ?auto_70531 ) ) ( not ( = ?auto_70535 ?auto_70533 ) ) ( not ( = ?auto_70535 ?auto_70532 ) ) ( not ( = ?auto_70535 ?auto_70531 ) ) ( not ( = ?auto_70529 ?auto_70534 ) ) ( not ( = ?auto_70529 ?auto_70535 ) ) ( not ( = ?auto_70530 ?auto_70534 ) ) ( not ( = ?auto_70530 ?auto_70535 ) ) ( HOLDING ?auto_70530 ) ( CLEAR ?auto_70529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70529 ?auto_70530 )
      ( MAKE-4PILE ?auto_70529 ?auto_70530 ?auto_70531 ?auto_70532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70536 - BLOCK
      ?auto_70537 - BLOCK
      ?auto_70538 - BLOCK
      ?auto_70539 - BLOCK
    )
    :vars
    (
      ?auto_70540 - BLOCK
      ?auto_70541 - BLOCK
      ?auto_70542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70536 ) ( not ( = ?auto_70536 ?auto_70537 ) ) ( not ( = ?auto_70536 ?auto_70538 ) ) ( not ( = ?auto_70536 ?auto_70539 ) ) ( not ( = ?auto_70537 ?auto_70538 ) ) ( not ( = ?auto_70537 ?auto_70539 ) ) ( not ( = ?auto_70538 ?auto_70539 ) ) ( ON ?auto_70539 ?auto_70540 ) ( not ( = ?auto_70536 ?auto_70540 ) ) ( not ( = ?auto_70537 ?auto_70540 ) ) ( not ( = ?auto_70538 ?auto_70540 ) ) ( not ( = ?auto_70539 ?auto_70540 ) ) ( ON ?auto_70538 ?auto_70539 ) ( ON-TABLE ?auto_70541 ) ( ON ?auto_70542 ?auto_70541 ) ( ON ?auto_70540 ?auto_70542 ) ( not ( = ?auto_70541 ?auto_70542 ) ) ( not ( = ?auto_70541 ?auto_70540 ) ) ( not ( = ?auto_70541 ?auto_70539 ) ) ( not ( = ?auto_70541 ?auto_70538 ) ) ( not ( = ?auto_70542 ?auto_70540 ) ) ( not ( = ?auto_70542 ?auto_70539 ) ) ( not ( = ?auto_70542 ?auto_70538 ) ) ( not ( = ?auto_70536 ?auto_70541 ) ) ( not ( = ?auto_70536 ?auto_70542 ) ) ( not ( = ?auto_70537 ?auto_70541 ) ) ( not ( = ?auto_70537 ?auto_70542 ) ) ( CLEAR ?auto_70536 ) ( ON ?auto_70537 ?auto_70538 ) ( CLEAR ?auto_70537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70541 ?auto_70542 ?auto_70540 ?auto_70539 ?auto_70538 )
      ( MAKE-4PILE ?auto_70536 ?auto_70537 ?auto_70538 ?auto_70539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70543 - BLOCK
      ?auto_70544 - BLOCK
      ?auto_70545 - BLOCK
      ?auto_70546 - BLOCK
    )
    :vars
    (
      ?auto_70548 - BLOCK
      ?auto_70547 - BLOCK
      ?auto_70549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70543 ?auto_70544 ) ) ( not ( = ?auto_70543 ?auto_70545 ) ) ( not ( = ?auto_70543 ?auto_70546 ) ) ( not ( = ?auto_70544 ?auto_70545 ) ) ( not ( = ?auto_70544 ?auto_70546 ) ) ( not ( = ?auto_70545 ?auto_70546 ) ) ( ON ?auto_70546 ?auto_70548 ) ( not ( = ?auto_70543 ?auto_70548 ) ) ( not ( = ?auto_70544 ?auto_70548 ) ) ( not ( = ?auto_70545 ?auto_70548 ) ) ( not ( = ?auto_70546 ?auto_70548 ) ) ( ON ?auto_70545 ?auto_70546 ) ( ON-TABLE ?auto_70547 ) ( ON ?auto_70549 ?auto_70547 ) ( ON ?auto_70548 ?auto_70549 ) ( not ( = ?auto_70547 ?auto_70549 ) ) ( not ( = ?auto_70547 ?auto_70548 ) ) ( not ( = ?auto_70547 ?auto_70546 ) ) ( not ( = ?auto_70547 ?auto_70545 ) ) ( not ( = ?auto_70549 ?auto_70548 ) ) ( not ( = ?auto_70549 ?auto_70546 ) ) ( not ( = ?auto_70549 ?auto_70545 ) ) ( not ( = ?auto_70543 ?auto_70547 ) ) ( not ( = ?auto_70543 ?auto_70549 ) ) ( not ( = ?auto_70544 ?auto_70547 ) ) ( not ( = ?auto_70544 ?auto_70549 ) ) ( ON ?auto_70544 ?auto_70545 ) ( CLEAR ?auto_70544 ) ( HOLDING ?auto_70543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70543 )
      ( MAKE-4PILE ?auto_70543 ?auto_70544 ?auto_70545 ?auto_70546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70550 - BLOCK
      ?auto_70551 - BLOCK
      ?auto_70552 - BLOCK
      ?auto_70553 - BLOCK
    )
    :vars
    (
      ?auto_70555 - BLOCK
      ?auto_70554 - BLOCK
      ?auto_70556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70550 ?auto_70551 ) ) ( not ( = ?auto_70550 ?auto_70552 ) ) ( not ( = ?auto_70550 ?auto_70553 ) ) ( not ( = ?auto_70551 ?auto_70552 ) ) ( not ( = ?auto_70551 ?auto_70553 ) ) ( not ( = ?auto_70552 ?auto_70553 ) ) ( ON ?auto_70553 ?auto_70555 ) ( not ( = ?auto_70550 ?auto_70555 ) ) ( not ( = ?auto_70551 ?auto_70555 ) ) ( not ( = ?auto_70552 ?auto_70555 ) ) ( not ( = ?auto_70553 ?auto_70555 ) ) ( ON ?auto_70552 ?auto_70553 ) ( ON-TABLE ?auto_70554 ) ( ON ?auto_70556 ?auto_70554 ) ( ON ?auto_70555 ?auto_70556 ) ( not ( = ?auto_70554 ?auto_70556 ) ) ( not ( = ?auto_70554 ?auto_70555 ) ) ( not ( = ?auto_70554 ?auto_70553 ) ) ( not ( = ?auto_70554 ?auto_70552 ) ) ( not ( = ?auto_70556 ?auto_70555 ) ) ( not ( = ?auto_70556 ?auto_70553 ) ) ( not ( = ?auto_70556 ?auto_70552 ) ) ( not ( = ?auto_70550 ?auto_70554 ) ) ( not ( = ?auto_70550 ?auto_70556 ) ) ( not ( = ?auto_70551 ?auto_70554 ) ) ( not ( = ?auto_70551 ?auto_70556 ) ) ( ON ?auto_70551 ?auto_70552 ) ( ON ?auto_70550 ?auto_70551 ) ( CLEAR ?auto_70550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70554 ?auto_70556 ?auto_70555 ?auto_70553 ?auto_70552 ?auto_70551 )
      ( MAKE-4PILE ?auto_70550 ?auto_70551 ?auto_70552 ?auto_70553 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70561 - BLOCK
      ?auto_70562 - BLOCK
      ?auto_70563 - BLOCK
      ?auto_70564 - BLOCK
    )
    :vars
    (
      ?auto_70566 - BLOCK
      ?auto_70567 - BLOCK
      ?auto_70565 - BLOCK
      ?auto_70568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70561 ?auto_70562 ) ) ( not ( = ?auto_70561 ?auto_70563 ) ) ( not ( = ?auto_70561 ?auto_70564 ) ) ( not ( = ?auto_70562 ?auto_70563 ) ) ( not ( = ?auto_70562 ?auto_70564 ) ) ( not ( = ?auto_70563 ?auto_70564 ) ) ( ON ?auto_70564 ?auto_70566 ) ( not ( = ?auto_70561 ?auto_70566 ) ) ( not ( = ?auto_70562 ?auto_70566 ) ) ( not ( = ?auto_70563 ?auto_70566 ) ) ( not ( = ?auto_70564 ?auto_70566 ) ) ( ON ?auto_70563 ?auto_70564 ) ( ON-TABLE ?auto_70567 ) ( ON ?auto_70565 ?auto_70567 ) ( ON ?auto_70566 ?auto_70565 ) ( not ( = ?auto_70567 ?auto_70565 ) ) ( not ( = ?auto_70567 ?auto_70566 ) ) ( not ( = ?auto_70567 ?auto_70564 ) ) ( not ( = ?auto_70567 ?auto_70563 ) ) ( not ( = ?auto_70565 ?auto_70566 ) ) ( not ( = ?auto_70565 ?auto_70564 ) ) ( not ( = ?auto_70565 ?auto_70563 ) ) ( not ( = ?auto_70561 ?auto_70567 ) ) ( not ( = ?auto_70561 ?auto_70565 ) ) ( not ( = ?auto_70562 ?auto_70567 ) ) ( not ( = ?auto_70562 ?auto_70565 ) ) ( ON ?auto_70562 ?auto_70563 ) ( CLEAR ?auto_70562 ) ( ON ?auto_70561 ?auto_70568 ) ( CLEAR ?auto_70561 ) ( HAND-EMPTY ) ( not ( = ?auto_70561 ?auto_70568 ) ) ( not ( = ?auto_70562 ?auto_70568 ) ) ( not ( = ?auto_70563 ?auto_70568 ) ) ( not ( = ?auto_70564 ?auto_70568 ) ) ( not ( = ?auto_70566 ?auto_70568 ) ) ( not ( = ?auto_70567 ?auto_70568 ) ) ( not ( = ?auto_70565 ?auto_70568 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70561 ?auto_70568 )
      ( MAKE-4PILE ?auto_70561 ?auto_70562 ?auto_70563 ?auto_70564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70569 - BLOCK
      ?auto_70570 - BLOCK
      ?auto_70571 - BLOCK
      ?auto_70572 - BLOCK
    )
    :vars
    (
      ?auto_70576 - BLOCK
      ?auto_70575 - BLOCK
      ?auto_70574 - BLOCK
      ?auto_70573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70569 ?auto_70570 ) ) ( not ( = ?auto_70569 ?auto_70571 ) ) ( not ( = ?auto_70569 ?auto_70572 ) ) ( not ( = ?auto_70570 ?auto_70571 ) ) ( not ( = ?auto_70570 ?auto_70572 ) ) ( not ( = ?auto_70571 ?auto_70572 ) ) ( ON ?auto_70572 ?auto_70576 ) ( not ( = ?auto_70569 ?auto_70576 ) ) ( not ( = ?auto_70570 ?auto_70576 ) ) ( not ( = ?auto_70571 ?auto_70576 ) ) ( not ( = ?auto_70572 ?auto_70576 ) ) ( ON ?auto_70571 ?auto_70572 ) ( ON-TABLE ?auto_70575 ) ( ON ?auto_70574 ?auto_70575 ) ( ON ?auto_70576 ?auto_70574 ) ( not ( = ?auto_70575 ?auto_70574 ) ) ( not ( = ?auto_70575 ?auto_70576 ) ) ( not ( = ?auto_70575 ?auto_70572 ) ) ( not ( = ?auto_70575 ?auto_70571 ) ) ( not ( = ?auto_70574 ?auto_70576 ) ) ( not ( = ?auto_70574 ?auto_70572 ) ) ( not ( = ?auto_70574 ?auto_70571 ) ) ( not ( = ?auto_70569 ?auto_70575 ) ) ( not ( = ?auto_70569 ?auto_70574 ) ) ( not ( = ?auto_70570 ?auto_70575 ) ) ( not ( = ?auto_70570 ?auto_70574 ) ) ( ON ?auto_70569 ?auto_70573 ) ( CLEAR ?auto_70569 ) ( not ( = ?auto_70569 ?auto_70573 ) ) ( not ( = ?auto_70570 ?auto_70573 ) ) ( not ( = ?auto_70571 ?auto_70573 ) ) ( not ( = ?auto_70572 ?auto_70573 ) ) ( not ( = ?auto_70576 ?auto_70573 ) ) ( not ( = ?auto_70575 ?auto_70573 ) ) ( not ( = ?auto_70574 ?auto_70573 ) ) ( HOLDING ?auto_70570 ) ( CLEAR ?auto_70571 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70575 ?auto_70574 ?auto_70576 ?auto_70572 ?auto_70571 ?auto_70570 )
      ( MAKE-4PILE ?auto_70569 ?auto_70570 ?auto_70571 ?auto_70572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70577 - BLOCK
      ?auto_70578 - BLOCK
      ?auto_70579 - BLOCK
      ?auto_70580 - BLOCK
    )
    :vars
    (
      ?auto_70583 - BLOCK
      ?auto_70584 - BLOCK
      ?auto_70581 - BLOCK
      ?auto_70582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70577 ?auto_70578 ) ) ( not ( = ?auto_70577 ?auto_70579 ) ) ( not ( = ?auto_70577 ?auto_70580 ) ) ( not ( = ?auto_70578 ?auto_70579 ) ) ( not ( = ?auto_70578 ?auto_70580 ) ) ( not ( = ?auto_70579 ?auto_70580 ) ) ( ON ?auto_70580 ?auto_70583 ) ( not ( = ?auto_70577 ?auto_70583 ) ) ( not ( = ?auto_70578 ?auto_70583 ) ) ( not ( = ?auto_70579 ?auto_70583 ) ) ( not ( = ?auto_70580 ?auto_70583 ) ) ( ON ?auto_70579 ?auto_70580 ) ( ON-TABLE ?auto_70584 ) ( ON ?auto_70581 ?auto_70584 ) ( ON ?auto_70583 ?auto_70581 ) ( not ( = ?auto_70584 ?auto_70581 ) ) ( not ( = ?auto_70584 ?auto_70583 ) ) ( not ( = ?auto_70584 ?auto_70580 ) ) ( not ( = ?auto_70584 ?auto_70579 ) ) ( not ( = ?auto_70581 ?auto_70583 ) ) ( not ( = ?auto_70581 ?auto_70580 ) ) ( not ( = ?auto_70581 ?auto_70579 ) ) ( not ( = ?auto_70577 ?auto_70584 ) ) ( not ( = ?auto_70577 ?auto_70581 ) ) ( not ( = ?auto_70578 ?auto_70584 ) ) ( not ( = ?auto_70578 ?auto_70581 ) ) ( ON ?auto_70577 ?auto_70582 ) ( not ( = ?auto_70577 ?auto_70582 ) ) ( not ( = ?auto_70578 ?auto_70582 ) ) ( not ( = ?auto_70579 ?auto_70582 ) ) ( not ( = ?auto_70580 ?auto_70582 ) ) ( not ( = ?auto_70583 ?auto_70582 ) ) ( not ( = ?auto_70584 ?auto_70582 ) ) ( not ( = ?auto_70581 ?auto_70582 ) ) ( CLEAR ?auto_70579 ) ( ON ?auto_70578 ?auto_70577 ) ( CLEAR ?auto_70578 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70582 ?auto_70577 )
      ( MAKE-4PILE ?auto_70577 ?auto_70578 ?auto_70579 ?auto_70580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70585 - BLOCK
      ?auto_70586 - BLOCK
      ?auto_70587 - BLOCK
      ?auto_70588 - BLOCK
    )
    :vars
    (
      ?auto_70590 - BLOCK
      ?auto_70591 - BLOCK
      ?auto_70589 - BLOCK
      ?auto_70592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70585 ?auto_70586 ) ) ( not ( = ?auto_70585 ?auto_70587 ) ) ( not ( = ?auto_70585 ?auto_70588 ) ) ( not ( = ?auto_70586 ?auto_70587 ) ) ( not ( = ?auto_70586 ?auto_70588 ) ) ( not ( = ?auto_70587 ?auto_70588 ) ) ( ON ?auto_70588 ?auto_70590 ) ( not ( = ?auto_70585 ?auto_70590 ) ) ( not ( = ?auto_70586 ?auto_70590 ) ) ( not ( = ?auto_70587 ?auto_70590 ) ) ( not ( = ?auto_70588 ?auto_70590 ) ) ( ON-TABLE ?auto_70591 ) ( ON ?auto_70589 ?auto_70591 ) ( ON ?auto_70590 ?auto_70589 ) ( not ( = ?auto_70591 ?auto_70589 ) ) ( not ( = ?auto_70591 ?auto_70590 ) ) ( not ( = ?auto_70591 ?auto_70588 ) ) ( not ( = ?auto_70591 ?auto_70587 ) ) ( not ( = ?auto_70589 ?auto_70590 ) ) ( not ( = ?auto_70589 ?auto_70588 ) ) ( not ( = ?auto_70589 ?auto_70587 ) ) ( not ( = ?auto_70585 ?auto_70591 ) ) ( not ( = ?auto_70585 ?auto_70589 ) ) ( not ( = ?auto_70586 ?auto_70591 ) ) ( not ( = ?auto_70586 ?auto_70589 ) ) ( ON ?auto_70585 ?auto_70592 ) ( not ( = ?auto_70585 ?auto_70592 ) ) ( not ( = ?auto_70586 ?auto_70592 ) ) ( not ( = ?auto_70587 ?auto_70592 ) ) ( not ( = ?auto_70588 ?auto_70592 ) ) ( not ( = ?auto_70590 ?auto_70592 ) ) ( not ( = ?auto_70591 ?auto_70592 ) ) ( not ( = ?auto_70589 ?auto_70592 ) ) ( ON ?auto_70586 ?auto_70585 ) ( CLEAR ?auto_70586 ) ( ON-TABLE ?auto_70592 ) ( HOLDING ?auto_70587 ) ( CLEAR ?auto_70588 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70591 ?auto_70589 ?auto_70590 ?auto_70588 ?auto_70587 )
      ( MAKE-4PILE ?auto_70585 ?auto_70586 ?auto_70587 ?auto_70588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70593 - BLOCK
      ?auto_70594 - BLOCK
      ?auto_70595 - BLOCK
      ?auto_70596 - BLOCK
    )
    :vars
    (
      ?auto_70599 - BLOCK
      ?auto_70600 - BLOCK
      ?auto_70597 - BLOCK
      ?auto_70598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70593 ?auto_70594 ) ) ( not ( = ?auto_70593 ?auto_70595 ) ) ( not ( = ?auto_70593 ?auto_70596 ) ) ( not ( = ?auto_70594 ?auto_70595 ) ) ( not ( = ?auto_70594 ?auto_70596 ) ) ( not ( = ?auto_70595 ?auto_70596 ) ) ( ON ?auto_70596 ?auto_70599 ) ( not ( = ?auto_70593 ?auto_70599 ) ) ( not ( = ?auto_70594 ?auto_70599 ) ) ( not ( = ?auto_70595 ?auto_70599 ) ) ( not ( = ?auto_70596 ?auto_70599 ) ) ( ON-TABLE ?auto_70600 ) ( ON ?auto_70597 ?auto_70600 ) ( ON ?auto_70599 ?auto_70597 ) ( not ( = ?auto_70600 ?auto_70597 ) ) ( not ( = ?auto_70600 ?auto_70599 ) ) ( not ( = ?auto_70600 ?auto_70596 ) ) ( not ( = ?auto_70600 ?auto_70595 ) ) ( not ( = ?auto_70597 ?auto_70599 ) ) ( not ( = ?auto_70597 ?auto_70596 ) ) ( not ( = ?auto_70597 ?auto_70595 ) ) ( not ( = ?auto_70593 ?auto_70600 ) ) ( not ( = ?auto_70593 ?auto_70597 ) ) ( not ( = ?auto_70594 ?auto_70600 ) ) ( not ( = ?auto_70594 ?auto_70597 ) ) ( ON ?auto_70593 ?auto_70598 ) ( not ( = ?auto_70593 ?auto_70598 ) ) ( not ( = ?auto_70594 ?auto_70598 ) ) ( not ( = ?auto_70595 ?auto_70598 ) ) ( not ( = ?auto_70596 ?auto_70598 ) ) ( not ( = ?auto_70599 ?auto_70598 ) ) ( not ( = ?auto_70600 ?auto_70598 ) ) ( not ( = ?auto_70597 ?auto_70598 ) ) ( ON ?auto_70594 ?auto_70593 ) ( ON-TABLE ?auto_70598 ) ( CLEAR ?auto_70596 ) ( ON ?auto_70595 ?auto_70594 ) ( CLEAR ?auto_70595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70598 ?auto_70593 ?auto_70594 )
      ( MAKE-4PILE ?auto_70593 ?auto_70594 ?auto_70595 ?auto_70596 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70601 - BLOCK
      ?auto_70602 - BLOCK
      ?auto_70603 - BLOCK
      ?auto_70604 - BLOCK
    )
    :vars
    (
      ?auto_70607 - BLOCK
      ?auto_70608 - BLOCK
      ?auto_70605 - BLOCK
      ?auto_70606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70601 ?auto_70602 ) ) ( not ( = ?auto_70601 ?auto_70603 ) ) ( not ( = ?auto_70601 ?auto_70604 ) ) ( not ( = ?auto_70602 ?auto_70603 ) ) ( not ( = ?auto_70602 ?auto_70604 ) ) ( not ( = ?auto_70603 ?auto_70604 ) ) ( not ( = ?auto_70601 ?auto_70607 ) ) ( not ( = ?auto_70602 ?auto_70607 ) ) ( not ( = ?auto_70603 ?auto_70607 ) ) ( not ( = ?auto_70604 ?auto_70607 ) ) ( ON-TABLE ?auto_70608 ) ( ON ?auto_70605 ?auto_70608 ) ( ON ?auto_70607 ?auto_70605 ) ( not ( = ?auto_70608 ?auto_70605 ) ) ( not ( = ?auto_70608 ?auto_70607 ) ) ( not ( = ?auto_70608 ?auto_70604 ) ) ( not ( = ?auto_70608 ?auto_70603 ) ) ( not ( = ?auto_70605 ?auto_70607 ) ) ( not ( = ?auto_70605 ?auto_70604 ) ) ( not ( = ?auto_70605 ?auto_70603 ) ) ( not ( = ?auto_70601 ?auto_70608 ) ) ( not ( = ?auto_70601 ?auto_70605 ) ) ( not ( = ?auto_70602 ?auto_70608 ) ) ( not ( = ?auto_70602 ?auto_70605 ) ) ( ON ?auto_70601 ?auto_70606 ) ( not ( = ?auto_70601 ?auto_70606 ) ) ( not ( = ?auto_70602 ?auto_70606 ) ) ( not ( = ?auto_70603 ?auto_70606 ) ) ( not ( = ?auto_70604 ?auto_70606 ) ) ( not ( = ?auto_70607 ?auto_70606 ) ) ( not ( = ?auto_70608 ?auto_70606 ) ) ( not ( = ?auto_70605 ?auto_70606 ) ) ( ON ?auto_70602 ?auto_70601 ) ( ON-TABLE ?auto_70606 ) ( ON ?auto_70603 ?auto_70602 ) ( CLEAR ?auto_70603 ) ( HOLDING ?auto_70604 ) ( CLEAR ?auto_70607 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70608 ?auto_70605 ?auto_70607 ?auto_70604 )
      ( MAKE-4PILE ?auto_70601 ?auto_70602 ?auto_70603 ?auto_70604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70609 - BLOCK
      ?auto_70610 - BLOCK
      ?auto_70611 - BLOCK
      ?auto_70612 - BLOCK
    )
    :vars
    (
      ?auto_70615 - BLOCK
      ?auto_70613 - BLOCK
      ?auto_70614 - BLOCK
      ?auto_70616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70609 ?auto_70610 ) ) ( not ( = ?auto_70609 ?auto_70611 ) ) ( not ( = ?auto_70609 ?auto_70612 ) ) ( not ( = ?auto_70610 ?auto_70611 ) ) ( not ( = ?auto_70610 ?auto_70612 ) ) ( not ( = ?auto_70611 ?auto_70612 ) ) ( not ( = ?auto_70609 ?auto_70615 ) ) ( not ( = ?auto_70610 ?auto_70615 ) ) ( not ( = ?auto_70611 ?auto_70615 ) ) ( not ( = ?auto_70612 ?auto_70615 ) ) ( ON-TABLE ?auto_70613 ) ( ON ?auto_70614 ?auto_70613 ) ( ON ?auto_70615 ?auto_70614 ) ( not ( = ?auto_70613 ?auto_70614 ) ) ( not ( = ?auto_70613 ?auto_70615 ) ) ( not ( = ?auto_70613 ?auto_70612 ) ) ( not ( = ?auto_70613 ?auto_70611 ) ) ( not ( = ?auto_70614 ?auto_70615 ) ) ( not ( = ?auto_70614 ?auto_70612 ) ) ( not ( = ?auto_70614 ?auto_70611 ) ) ( not ( = ?auto_70609 ?auto_70613 ) ) ( not ( = ?auto_70609 ?auto_70614 ) ) ( not ( = ?auto_70610 ?auto_70613 ) ) ( not ( = ?auto_70610 ?auto_70614 ) ) ( ON ?auto_70609 ?auto_70616 ) ( not ( = ?auto_70609 ?auto_70616 ) ) ( not ( = ?auto_70610 ?auto_70616 ) ) ( not ( = ?auto_70611 ?auto_70616 ) ) ( not ( = ?auto_70612 ?auto_70616 ) ) ( not ( = ?auto_70615 ?auto_70616 ) ) ( not ( = ?auto_70613 ?auto_70616 ) ) ( not ( = ?auto_70614 ?auto_70616 ) ) ( ON ?auto_70610 ?auto_70609 ) ( ON-TABLE ?auto_70616 ) ( ON ?auto_70611 ?auto_70610 ) ( CLEAR ?auto_70615 ) ( ON ?auto_70612 ?auto_70611 ) ( CLEAR ?auto_70612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70616 ?auto_70609 ?auto_70610 ?auto_70611 )
      ( MAKE-4PILE ?auto_70609 ?auto_70610 ?auto_70611 ?auto_70612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70617 - BLOCK
      ?auto_70618 - BLOCK
      ?auto_70619 - BLOCK
      ?auto_70620 - BLOCK
    )
    :vars
    (
      ?auto_70621 - BLOCK
      ?auto_70622 - BLOCK
      ?auto_70623 - BLOCK
      ?auto_70624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70617 ?auto_70618 ) ) ( not ( = ?auto_70617 ?auto_70619 ) ) ( not ( = ?auto_70617 ?auto_70620 ) ) ( not ( = ?auto_70618 ?auto_70619 ) ) ( not ( = ?auto_70618 ?auto_70620 ) ) ( not ( = ?auto_70619 ?auto_70620 ) ) ( not ( = ?auto_70617 ?auto_70621 ) ) ( not ( = ?auto_70618 ?auto_70621 ) ) ( not ( = ?auto_70619 ?auto_70621 ) ) ( not ( = ?auto_70620 ?auto_70621 ) ) ( ON-TABLE ?auto_70622 ) ( ON ?auto_70623 ?auto_70622 ) ( not ( = ?auto_70622 ?auto_70623 ) ) ( not ( = ?auto_70622 ?auto_70621 ) ) ( not ( = ?auto_70622 ?auto_70620 ) ) ( not ( = ?auto_70622 ?auto_70619 ) ) ( not ( = ?auto_70623 ?auto_70621 ) ) ( not ( = ?auto_70623 ?auto_70620 ) ) ( not ( = ?auto_70623 ?auto_70619 ) ) ( not ( = ?auto_70617 ?auto_70622 ) ) ( not ( = ?auto_70617 ?auto_70623 ) ) ( not ( = ?auto_70618 ?auto_70622 ) ) ( not ( = ?auto_70618 ?auto_70623 ) ) ( ON ?auto_70617 ?auto_70624 ) ( not ( = ?auto_70617 ?auto_70624 ) ) ( not ( = ?auto_70618 ?auto_70624 ) ) ( not ( = ?auto_70619 ?auto_70624 ) ) ( not ( = ?auto_70620 ?auto_70624 ) ) ( not ( = ?auto_70621 ?auto_70624 ) ) ( not ( = ?auto_70622 ?auto_70624 ) ) ( not ( = ?auto_70623 ?auto_70624 ) ) ( ON ?auto_70618 ?auto_70617 ) ( ON-TABLE ?auto_70624 ) ( ON ?auto_70619 ?auto_70618 ) ( ON ?auto_70620 ?auto_70619 ) ( CLEAR ?auto_70620 ) ( HOLDING ?auto_70621 ) ( CLEAR ?auto_70623 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70622 ?auto_70623 ?auto_70621 )
      ( MAKE-4PILE ?auto_70617 ?auto_70618 ?auto_70619 ?auto_70620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70625 - BLOCK
      ?auto_70626 - BLOCK
      ?auto_70627 - BLOCK
      ?auto_70628 - BLOCK
    )
    :vars
    (
      ?auto_70630 - BLOCK
      ?auto_70631 - BLOCK
      ?auto_70632 - BLOCK
      ?auto_70629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70625 ?auto_70626 ) ) ( not ( = ?auto_70625 ?auto_70627 ) ) ( not ( = ?auto_70625 ?auto_70628 ) ) ( not ( = ?auto_70626 ?auto_70627 ) ) ( not ( = ?auto_70626 ?auto_70628 ) ) ( not ( = ?auto_70627 ?auto_70628 ) ) ( not ( = ?auto_70625 ?auto_70630 ) ) ( not ( = ?auto_70626 ?auto_70630 ) ) ( not ( = ?auto_70627 ?auto_70630 ) ) ( not ( = ?auto_70628 ?auto_70630 ) ) ( ON-TABLE ?auto_70631 ) ( ON ?auto_70632 ?auto_70631 ) ( not ( = ?auto_70631 ?auto_70632 ) ) ( not ( = ?auto_70631 ?auto_70630 ) ) ( not ( = ?auto_70631 ?auto_70628 ) ) ( not ( = ?auto_70631 ?auto_70627 ) ) ( not ( = ?auto_70632 ?auto_70630 ) ) ( not ( = ?auto_70632 ?auto_70628 ) ) ( not ( = ?auto_70632 ?auto_70627 ) ) ( not ( = ?auto_70625 ?auto_70631 ) ) ( not ( = ?auto_70625 ?auto_70632 ) ) ( not ( = ?auto_70626 ?auto_70631 ) ) ( not ( = ?auto_70626 ?auto_70632 ) ) ( ON ?auto_70625 ?auto_70629 ) ( not ( = ?auto_70625 ?auto_70629 ) ) ( not ( = ?auto_70626 ?auto_70629 ) ) ( not ( = ?auto_70627 ?auto_70629 ) ) ( not ( = ?auto_70628 ?auto_70629 ) ) ( not ( = ?auto_70630 ?auto_70629 ) ) ( not ( = ?auto_70631 ?auto_70629 ) ) ( not ( = ?auto_70632 ?auto_70629 ) ) ( ON ?auto_70626 ?auto_70625 ) ( ON-TABLE ?auto_70629 ) ( ON ?auto_70627 ?auto_70626 ) ( ON ?auto_70628 ?auto_70627 ) ( CLEAR ?auto_70632 ) ( ON ?auto_70630 ?auto_70628 ) ( CLEAR ?auto_70630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70629 ?auto_70625 ?auto_70626 ?auto_70627 ?auto_70628 )
      ( MAKE-4PILE ?auto_70625 ?auto_70626 ?auto_70627 ?auto_70628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70633 - BLOCK
      ?auto_70634 - BLOCK
      ?auto_70635 - BLOCK
      ?auto_70636 - BLOCK
    )
    :vars
    (
      ?auto_70640 - BLOCK
      ?auto_70638 - BLOCK
      ?auto_70637 - BLOCK
      ?auto_70639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70633 ?auto_70634 ) ) ( not ( = ?auto_70633 ?auto_70635 ) ) ( not ( = ?auto_70633 ?auto_70636 ) ) ( not ( = ?auto_70634 ?auto_70635 ) ) ( not ( = ?auto_70634 ?auto_70636 ) ) ( not ( = ?auto_70635 ?auto_70636 ) ) ( not ( = ?auto_70633 ?auto_70640 ) ) ( not ( = ?auto_70634 ?auto_70640 ) ) ( not ( = ?auto_70635 ?auto_70640 ) ) ( not ( = ?auto_70636 ?auto_70640 ) ) ( ON-TABLE ?auto_70638 ) ( not ( = ?auto_70638 ?auto_70637 ) ) ( not ( = ?auto_70638 ?auto_70640 ) ) ( not ( = ?auto_70638 ?auto_70636 ) ) ( not ( = ?auto_70638 ?auto_70635 ) ) ( not ( = ?auto_70637 ?auto_70640 ) ) ( not ( = ?auto_70637 ?auto_70636 ) ) ( not ( = ?auto_70637 ?auto_70635 ) ) ( not ( = ?auto_70633 ?auto_70638 ) ) ( not ( = ?auto_70633 ?auto_70637 ) ) ( not ( = ?auto_70634 ?auto_70638 ) ) ( not ( = ?auto_70634 ?auto_70637 ) ) ( ON ?auto_70633 ?auto_70639 ) ( not ( = ?auto_70633 ?auto_70639 ) ) ( not ( = ?auto_70634 ?auto_70639 ) ) ( not ( = ?auto_70635 ?auto_70639 ) ) ( not ( = ?auto_70636 ?auto_70639 ) ) ( not ( = ?auto_70640 ?auto_70639 ) ) ( not ( = ?auto_70638 ?auto_70639 ) ) ( not ( = ?auto_70637 ?auto_70639 ) ) ( ON ?auto_70634 ?auto_70633 ) ( ON-TABLE ?auto_70639 ) ( ON ?auto_70635 ?auto_70634 ) ( ON ?auto_70636 ?auto_70635 ) ( ON ?auto_70640 ?auto_70636 ) ( CLEAR ?auto_70640 ) ( HOLDING ?auto_70637 ) ( CLEAR ?auto_70638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70638 ?auto_70637 )
      ( MAKE-4PILE ?auto_70633 ?auto_70634 ?auto_70635 ?auto_70636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70641 - BLOCK
      ?auto_70642 - BLOCK
      ?auto_70643 - BLOCK
      ?auto_70644 - BLOCK
    )
    :vars
    (
      ?auto_70647 - BLOCK
      ?auto_70646 - BLOCK
      ?auto_70648 - BLOCK
      ?auto_70645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70641 ?auto_70642 ) ) ( not ( = ?auto_70641 ?auto_70643 ) ) ( not ( = ?auto_70641 ?auto_70644 ) ) ( not ( = ?auto_70642 ?auto_70643 ) ) ( not ( = ?auto_70642 ?auto_70644 ) ) ( not ( = ?auto_70643 ?auto_70644 ) ) ( not ( = ?auto_70641 ?auto_70647 ) ) ( not ( = ?auto_70642 ?auto_70647 ) ) ( not ( = ?auto_70643 ?auto_70647 ) ) ( not ( = ?auto_70644 ?auto_70647 ) ) ( ON-TABLE ?auto_70646 ) ( not ( = ?auto_70646 ?auto_70648 ) ) ( not ( = ?auto_70646 ?auto_70647 ) ) ( not ( = ?auto_70646 ?auto_70644 ) ) ( not ( = ?auto_70646 ?auto_70643 ) ) ( not ( = ?auto_70648 ?auto_70647 ) ) ( not ( = ?auto_70648 ?auto_70644 ) ) ( not ( = ?auto_70648 ?auto_70643 ) ) ( not ( = ?auto_70641 ?auto_70646 ) ) ( not ( = ?auto_70641 ?auto_70648 ) ) ( not ( = ?auto_70642 ?auto_70646 ) ) ( not ( = ?auto_70642 ?auto_70648 ) ) ( ON ?auto_70641 ?auto_70645 ) ( not ( = ?auto_70641 ?auto_70645 ) ) ( not ( = ?auto_70642 ?auto_70645 ) ) ( not ( = ?auto_70643 ?auto_70645 ) ) ( not ( = ?auto_70644 ?auto_70645 ) ) ( not ( = ?auto_70647 ?auto_70645 ) ) ( not ( = ?auto_70646 ?auto_70645 ) ) ( not ( = ?auto_70648 ?auto_70645 ) ) ( ON ?auto_70642 ?auto_70641 ) ( ON-TABLE ?auto_70645 ) ( ON ?auto_70643 ?auto_70642 ) ( ON ?auto_70644 ?auto_70643 ) ( ON ?auto_70647 ?auto_70644 ) ( CLEAR ?auto_70646 ) ( ON ?auto_70648 ?auto_70647 ) ( CLEAR ?auto_70648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70645 ?auto_70641 ?auto_70642 ?auto_70643 ?auto_70644 ?auto_70647 )
      ( MAKE-4PILE ?auto_70641 ?auto_70642 ?auto_70643 ?auto_70644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70649 - BLOCK
      ?auto_70650 - BLOCK
      ?auto_70651 - BLOCK
      ?auto_70652 - BLOCK
    )
    :vars
    (
      ?auto_70654 - BLOCK
      ?auto_70653 - BLOCK
      ?auto_70656 - BLOCK
      ?auto_70655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70649 ?auto_70650 ) ) ( not ( = ?auto_70649 ?auto_70651 ) ) ( not ( = ?auto_70649 ?auto_70652 ) ) ( not ( = ?auto_70650 ?auto_70651 ) ) ( not ( = ?auto_70650 ?auto_70652 ) ) ( not ( = ?auto_70651 ?auto_70652 ) ) ( not ( = ?auto_70649 ?auto_70654 ) ) ( not ( = ?auto_70650 ?auto_70654 ) ) ( not ( = ?auto_70651 ?auto_70654 ) ) ( not ( = ?auto_70652 ?auto_70654 ) ) ( not ( = ?auto_70653 ?auto_70656 ) ) ( not ( = ?auto_70653 ?auto_70654 ) ) ( not ( = ?auto_70653 ?auto_70652 ) ) ( not ( = ?auto_70653 ?auto_70651 ) ) ( not ( = ?auto_70656 ?auto_70654 ) ) ( not ( = ?auto_70656 ?auto_70652 ) ) ( not ( = ?auto_70656 ?auto_70651 ) ) ( not ( = ?auto_70649 ?auto_70653 ) ) ( not ( = ?auto_70649 ?auto_70656 ) ) ( not ( = ?auto_70650 ?auto_70653 ) ) ( not ( = ?auto_70650 ?auto_70656 ) ) ( ON ?auto_70649 ?auto_70655 ) ( not ( = ?auto_70649 ?auto_70655 ) ) ( not ( = ?auto_70650 ?auto_70655 ) ) ( not ( = ?auto_70651 ?auto_70655 ) ) ( not ( = ?auto_70652 ?auto_70655 ) ) ( not ( = ?auto_70654 ?auto_70655 ) ) ( not ( = ?auto_70653 ?auto_70655 ) ) ( not ( = ?auto_70656 ?auto_70655 ) ) ( ON ?auto_70650 ?auto_70649 ) ( ON-TABLE ?auto_70655 ) ( ON ?auto_70651 ?auto_70650 ) ( ON ?auto_70652 ?auto_70651 ) ( ON ?auto_70654 ?auto_70652 ) ( ON ?auto_70656 ?auto_70654 ) ( CLEAR ?auto_70656 ) ( HOLDING ?auto_70653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70653 )
      ( MAKE-4PILE ?auto_70649 ?auto_70650 ?auto_70651 ?auto_70652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70657 - BLOCK
      ?auto_70658 - BLOCK
      ?auto_70659 - BLOCK
      ?auto_70660 - BLOCK
    )
    :vars
    (
      ?auto_70662 - BLOCK
      ?auto_70661 - BLOCK
      ?auto_70664 - BLOCK
      ?auto_70663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70657 ?auto_70658 ) ) ( not ( = ?auto_70657 ?auto_70659 ) ) ( not ( = ?auto_70657 ?auto_70660 ) ) ( not ( = ?auto_70658 ?auto_70659 ) ) ( not ( = ?auto_70658 ?auto_70660 ) ) ( not ( = ?auto_70659 ?auto_70660 ) ) ( not ( = ?auto_70657 ?auto_70662 ) ) ( not ( = ?auto_70658 ?auto_70662 ) ) ( not ( = ?auto_70659 ?auto_70662 ) ) ( not ( = ?auto_70660 ?auto_70662 ) ) ( not ( = ?auto_70661 ?auto_70664 ) ) ( not ( = ?auto_70661 ?auto_70662 ) ) ( not ( = ?auto_70661 ?auto_70660 ) ) ( not ( = ?auto_70661 ?auto_70659 ) ) ( not ( = ?auto_70664 ?auto_70662 ) ) ( not ( = ?auto_70664 ?auto_70660 ) ) ( not ( = ?auto_70664 ?auto_70659 ) ) ( not ( = ?auto_70657 ?auto_70661 ) ) ( not ( = ?auto_70657 ?auto_70664 ) ) ( not ( = ?auto_70658 ?auto_70661 ) ) ( not ( = ?auto_70658 ?auto_70664 ) ) ( ON ?auto_70657 ?auto_70663 ) ( not ( = ?auto_70657 ?auto_70663 ) ) ( not ( = ?auto_70658 ?auto_70663 ) ) ( not ( = ?auto_70659 ?auto_70663 ) ) ( not ( = ?auto_70660 ?auto_70663 ) ) ( not ( = ?auto_70662 ?auto_70663 ) ) ( not ( = ?auto_70661 ?auto_70663 ) ) ( not ( = ?auto_70664 ?auto_70663 ) ) ( ON ?auto_70658 ?auto_70657 ) ( ON-TABLE ?auto_70663 ) ( ON ?auto_70659 ?auto_70658 ) ( ON ?auto_70660 ?auto_70659 ) ( ON ?auto_70662 ?auto_70660 ) ( ON ?auto_70664 ?auto_70662 ) ( ON ?auto_70661 ?auto_70664 ) ( CLEAR ?auto_70661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70663 ?auto_70657 ?auto_70658 ?auto_70659 ?auto_70660 ?auto_70662 ?auto_70664 )
      ( MAKE-4PILE ?auto_70657 ?auto_70658 ?auto_70659 ?auto_70660 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70680 - BLOCK
      ?auto_70681 - BLOCK
    )
    :vars
    (
      ?auto_70682 - BLOCK
      ?auto_70684 - BLOCK
      ?auto_70683 - BLOCK
      ?auto_70686 - BLOCK
      ?auto_70685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70682 ?auto_70681 ) ( ON-TABLE ?auto_70680 ) ( ON ?auto_70681 ?auto_70680 ) ( not ( = ?auto_70680 ?auto_70681 ) ) ( not ( = ?auto_70680 ?auto_70682 ) ) ( not ( = ?auto_70681 ?auto_70682 ) ) ( not ( = ?auto_70680 ?auto_70684 ) ) ( not ( = ?auto_70680 ?auto_70683 ) ) ( not ( = ?auto_70681 ?auto_70684 ) ) ( not ( = ?auto_70681 ?auto_70683 ) ) ( not ( = ?auto_70682 ?auto_70684 ) ) ( not ( = ?auto_70682 ?auto_70683 ) ) ( not ( = ?auto_70684 ?auto_70683 ) ) ( ON ?auto_70684 ?auto_70682 ) ( CLEAR ?auto_70684 ) ( HOLDING ?auto_70683 ) ( CLEAR ?auto_70686 ) ( ON-TABLE ?auto_70685 ) ( ON ?auto_70686 ?auto_70685 ) ( not ( = ?auto_70685 ?auto_70686 ) ) ( not ( = ?auto_70685 ?auto_70683 ) ) ( not ( = ?auto_70686 ?auto_70683 ) ) ( not ( = ?auto_70680 ?auto_70686 ) ) ( not ( = ?auto_70680 ?auto_70685 ) ) ( not ( = ?auto_70681 ?auto_70686 ) ) ( not ( = ?auto_70681 ?auto_70685 ) ) ( not ( = ?auto_70682 ?auto_70686 ) ) ( not ( = ?auto_70682 ?auto_70685 ) ) ( not ( = ?auto_70684 ?auto_70686 ) ) ( not ( = ?auto_70684 ?auto_70685 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70685 ?auto_70686 ?auto_70683 )
      ( MAKE-2PILE ?auto_70680 ?auto_70681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70687 - BLOCK
      ?auto_70688 - BLOCK
    )
    :vars
    (
      ?auto_70692 - BLOCK
      ?auto_70690 - BLOCK
      ?auto_70693 - BLOCK
      ?auto_70689 - BLOCK
      ?auto_70691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70692 ?auto_70688 ) ( ON-TABLE ?auto_70687 ) ( ON ?auto_70688 ?auto_70687 ) ( not ( = ?auto_70687 ?auto_70688 ) ) ( not ( = ?auto_70687 ?auto_70692 ) ) ( not ( = ?auto_70688 ?auto_70692 ) ) ( not ( = ?auto_70687 ?auto_70690 ) ) ( not ( = ?auto_70687 ?auto_70693 ) ) ( not ( = ?auto_70688 ?auto_70690 ) ) ( not ( = ?auto_70688 ?auto_70693 ) ) ( not ( = ?auto_70692 ?auto_70690 ) ) ( not ( = ?auto_70692 ?auto_70693 ) ) ( not ( = ?auto_70690 ?auto_70693 ) ) ( ON ?auto_70690 ?auto_70692 ) ( CLEAR ?auto_70689 ) ( ON-TABLE ?auto_70691 ) ( ON ?auto_70689 ?auto_70691 ) ( not ( = ?auto_70691 ?auto_70689 ) ) ( not ( = ?auto_70691 ?auto_70693 ) ) ( not ( = ?auto_70689 ?auto_70693 ) ) ( not ( = ?auto_70687 ?auto_70689 ) ) ( not ( = ?auto_70687 ?auto_70691 ) ) ( not ( = ?auto_70688 ?auto_70689 ) ) ( not ( = ?auto_70688 ?auto_70691 ) ) ( not ( = ?auto_70692 ?auto_70689 ) ) ( not ( = ?auto_70692 ?auto_70691 ) ) ( not ( = ?auto_70690 ?auto_70689 ) ) ( not ( = ?auto_70690 ?auto_70691 ) ) ( ON ?auto_70693 ?auto_70690 ) ( CLEAR ?auto_70693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70687 ?auto_70688 ?auto_70692 ?auto_70690 )
      ( MAKE-2PILE ?auto_70687 ?auto_70688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70694 - BLOCK
      ?auto_70695 - BLOCK
    )
    :vars
    (
      ?auto_70698 - BLOCK
      ?auto_70700 - BLOCK
      ?auto_70696 - BLOCK
      ?auto_70697 - BLOCK
      ?auto_70699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70698 ?auto_70695 ) ( ON-TABLE ?auto_70694 ) ( ON ?auto_70695 ?auto_70694 ) ( not ( = ?auto_70694 ?auto_70695 ) ) ( not ( = ?auto_70694 ?auto_70698 ) ) ( not ( = ?auto_70695 ?auto_70698 ) ) ( not ( = ?auto_70694 ?auto_70700 ) ) ( not ( = ?auto_70694 ?auto_70696 ) ) ( not ( = ?auto_70695 ?auto_70700 ) ) ( not ( = ?auto_70695 ?auto_70696 ) ) ( not ( = ?auto_70698 ?auto_70700 ) ) ( not ( = ?auto_70698 ?auto_70696 ) ) ( not ( = ?auto_70700 ?auto_70696 ) ) ( ON ?auto_70700 ?auto_70698 ) ( ON-TABLE ?auto_70697 ) ( not ( = ?auto_70697 ?auto_70699 ) ) ( not ( = ?auto_70697 ?auto_70696 ) ) ( not ( = ?auto_70699 ?auto_70696 ) ) ( not ( = ?auto_70694 ?auto_70699 ) ) ( not ( = ?auto_70694 ?auto_70697 ) ) ( not ( = ?auto_70695 ?auto_70699 ) ) ( not ( = ?auto_70695 ?auto_70697 ) ) ( not ( = ?auto_70698 ?auto_70699 ) ) ( not ( = ?auto_70698 ?auto_70697 ) ) ( not ( = ?auto_70700 ?auto_70699 ) ) ( not ( = ?auto_70700 ?auto_70697 ) ) ( ON ?auto_70696 ?auto_70700 ) ( CLEAR ?auto_70696 ) ( HOLDING ?auto_70699 ) ( CLEAR ?auto_70697 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70697 ?auto_70699 )
      ( MAKE-2PILE ?auto_70694 ?auto_70695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70701 - BLOCK
      ?auto_70702 - BLOCK
    )
    :vars
    (
      ?auto_70703 - BLOCK
      ?auto_70704 - BLOCK
      ?auto_70706 - BLOCK
      ?auto_70707 - BLOCK
      ?auto_70705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70703 ?auto_70702 ) ( ON-TABLE ?auto_70701 ) ( ON ?auto_70702 ?auto_70701 ) ( not ( = ?auto_70701 ?auto_70702 ) ) ( not ( = ?auto_70701 ?auto_70703 ) ) ( not ( = ?auto_70702 ?auto_70703 ) ) ( not ( = ?auto_70701 ?auto_70704 ) ) ( not ( = ?auto_70701 ?auto_70706 ) ) ( not ( = ?auto_70702 ?auto_70704 ) ) ( not ( = ?auto_70702 ?auto_70706 ) ) ( not ( = ?auto_70703 ?auto_70704 ) ) ( not ( = ?auto_70703 ?auto_70706 ) ) ( not ( = ?auto_70704 ?auto_70706 ) ) ( ON ?auto_70704 ?auto_70703 ) ( ON-TABLE ?auto_70707 ) ( not ( = ?auto_70707 ?auto_70705 ) ) ( not ( = ?auto_70707 ?auto_70706 ) ) ( not ( = ?auto_70705 ?auto_70706 ) ) ( not ( = ?auto_70701 ?auto_70705 ) ) ( not ( = ?auto_70701 ?auto_70707 ) ) ( not ( = ?auto_70702 ?auto_70705 ) ) ( not ( = ?auto_70702 ?auto_70707 ) ) ( not ( = ?auto_70703 ?auto_70705 ) ) ( not ( = ?auto_70703 ?auto_70707 ) ) ( not ( = ?auto_70704 ?auto_70705 ) ) ( not ( = ?auto_70704 ?auto_70707 ) ) ( ON ?auto_70706 ?auto_70704 ) ( CLEAR ?auto_70707 ) ( ON ?auto_70705 ?auto_70706 ) ( CLEAR ?auto_70705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70701 ?auto_70702 ?auto_70703 ?auto_70704 ?auto_70706 )
      ( MAKE-2PILE ?auto_70701 ?auto_70702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70708 - BLOCK
      ?auto_70709 - BLOCK
    )
    :vars
    (
      ?auto_70711 - BLOCK
      ?auto_70713 - BLOCK
      ?auto_70714 - BLOCK
      ?auto_70712 - BLOCK
      ?auto_70710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70711 ?auto_70709 ) ( ON-TABLE ?auto_70708 ) ( ON ?auto_70709 ?auto_70708 ) ( not ( = ?auto_70708 ?auto_70709 ) ) ( not ( = ?auto_70708 ?auto_70711 ) ) ( not ( = ?auto_70709 ?auto_70711 ) ) ( not ( = ?auto_70708 ?auto_70713 ) ) ( not ( = ?auto_70708 ?auto_70714 ) ) ( not ( = ?auto_70709 ?auto_70713 ) ) ( not ( = ?auto_70709 ?auto_70714 ) ) ( not ( = ?auto_70711 ?auto_70713 ) ) ( not ( = ?auto_70711 ?auto_70714 ) ) ( not ( = ?auto_70713 ?auto_70714 ) ) ( ON ?auto_70713 ?auto_70711 ) ( not ( = ?auto_70712 ?auto_70710 ) ) ( not ( = ?auto_70712 ?auto_70714 ) ) ( not ( = ?auto_70710 ?auto_70714 ) ) ( not ( = ?auto_70708 ?auto_70710 ) ) ( not ( = ?auto_70708 ?auto_70712 ) ) ( not ( = ?auto_70709 ?auto_70710 ) ) ( not ( = ?auto_70709 ?auto_70712 ) ) ( not ( = ?auto_70711 ?auto_70710 ) ) ( not ( = ?auto_70711 ?auto_70712 ) ) ( not ( = ?auto_70713 ?auto_70710 ) ) ( not ( = ?auto_70713 ?auto_70712 ) ) ( ON ?auto_70714 ?auto_70713 ) ( ON ?auto_70710 ?auto_70714 ) ( CLEAR ?auto_70710 ) ( HOLDING ?auto_70712 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70712 )
      ( MAKE-2PILE ?auto_70708 ?auto_70709 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70724 - BLOCK
      ?auto_70725 - BLOCK
    )
    :vars
    (
      ?auto_70726 - BLOCK
      ?auto_70730 - BLOCK
      ?auto_70729 - BLOCK
      ?auto_70728 - BLOCK
      ?auto_70727 - BLOCK
      ?auto_70731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70726 ?auto_70725 ) ( ON-TABLE ?auto_70724 ) ( ON ?auto_70725 ?auto_70724 ) ( not ( = ?auto_70724 ?auto_70725 ) ) ( not ( = ?auto_70724 ?auto_70726 ) ) ( not ( = ?auto_70725 ?auto_70726 ) ) ( not ( = ?auto_70724 ?auto_70730 ) ) ( not ( = ?auto_70724 ?auto_70729 ) ) ( not ( = ?auto_70725 ?auto_70730 ) ) ( not ( = ?auto_70725 ?auto_70729 ) ) ( not ( = ?auto_70726 ?auto_70730 ) ) ( not ( = ?auto_70726 ?auto_70729 ) ) ( not ( = ?auto_70730 ?auto_70729 ) ) ( ON ?auto_70730 ?auto_70726 ) ( not ( = ?auto_70728 ?auto_70727 ) ) ( not ( = ?auto_70728 ?auto_70729 ) ) ( not ( = ?auto_70727 ?auto_70729 ) ) ( not ( = ?auto_70724 ?auto_70727 ) ) ( not ( = ?auto_70724 ?auto_70728 ) ) ( not ( = ?auto_70725 ?auto_70727 ) ) ( not ( = ?auto_70725 ?auto_70728 ) ) ( not ( = ?auto_70726 ?auto_70727 ) ) ( not ( = ?auto_70726 ?auto_70728 ) ) ( not ( = ?auto_70730 ?auto_70727 ) ) ( not ( = ?auto_70730 ?auto_70728 ) ) ( ON ?auto_70729 ?auto_70730 ) ( ON ?auto_70727 ?auto_70729 ) ( CLEAR ?auto_70727 ) ( ON ?auto_70728 ?auto_70731 ) ( CLEAR ?auto_70728 ) ( HAND-EMPTY ) ( not ( = ?auto_70724 ?auto_70731 ) ) ( not ( = ?auto_70725 ?auto_70731 ) ) ( not ( = ?auto_70726 ?auto_70731 ) ) ( not ( = ?auto_70730 ?auto_70731 ) ) ( not ( = ?auto_70729 ?auto_70731 ) ) ( not ( = ?auto_70728 ?auto_70731 ) ) ( not ( = ?auto_70727 ?auto_70731 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70728 ?auto_70731 )
      ( MAKE-2PILE ?auto_70724 ?auto_70725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70732 - BLOCK
      ?auto_70733 - BLOCK
    )
    :vars
    (
      ?auto_70737 - BLOCK
      ?auto_70734 - BLOCK
      ?auto_70739 - BLOCK
      ?auto_70735 - BLOCK
      ?auto_70736 - BLOCK
      ?auto_70738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70737 ?auto_70733 ) ( ON-TABLE ?auto_70732 ) ( ON ?auto_70733 ?auto_70732 ) ( not ( = ?auto_70732 ?auto_70733 ) ) ( not ( = ?auto_70732 ?auto_70737 ) ) ( not ( = ?auto_70733 ?auto_70737 ) ) ( not ( = ?auto_70732 ?auto_70734 ) ) ( not ( = ?auto_70732 ?auto_70739 ) ) ( not ( = ?auto_70733 ?auto_70734 ) ) ( not ( = ?auto_70733 ?auto_70739 ) ) ( not ( = ?auto_70737 ?auto_70734 ) ) ( not ( = ?auto_70737 ?auto_70739 ) ) ( not ( = ?auto_70734 ?auto_70739 ) ) ( ON ?auto_70734 ?auto_70737 ) ( not ( = ?auto_70735 ?auto_70736 ) ) ( not ( = ?auto_70735 ?auto_70739 ) ) ( not ( = ?auto_70736 ?auto_70739 ) ) ( not ( = ?auto_70732 ?auto_70736 ) ) ( not ( = ?auto_70732 ?auto_70735 ) ) ( not ( = ?auto_70733 ?auto_70736 ) ) ( not ( = ?auto_70733 ?auto_70735 ) ) ( not ( = ?auto_70737 ?auto_70736 ) ) ( not ( = ?auto_70737 ?auto_70735 ) ) ( not ( = ?auto_70734 ?auto_70736 ) ) ( not ( = ?auto_70734 ?auto_70735 ) ) ( ON ?auto_70739 ?auto_70734 ) ( ON ?auto_70735 ?auto_70738 ) ( CLEAR ?auto_70735 ) ( not ( = ?auto_70732 ?auto_70738 ) ) ( not ( = ?auto_70733 ?auto_70738 ) ) ( not ( = ?auto_70737 ?auto_70738 ) ) ( not ( = ?auto_70734 ?auto_70738 ) ) ( not ( = ?auto_70739 ?auto_70738 ) ) ( not ( = ?auto_70735 ?auto_70738 ) ) ( not ( = ?auto_70736 ?auto_70738 ) ) ( HOLDING ?auto_70736 ) ( CLEAR ?auto_70739 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70732 ?auto_70733 ?auto_70737 ?auto_70734 ?auto_70739 ?auto_70736 )
      ( MAKE-2PILE ?auto_70732 ?auto_70733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70740 - BLOCK
      ?auto_70741 - BLOCK
    )
    :vars
    (
      ?auto_70747 - BLOCK
      ?auto_70745 - BLOCK
      ?auto_70746 - BLOCK
      ?auto_70744 - BLOCK
      ?auto_70742 - BLOCK
      ?auto_70743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70747 ?auto_70741 ) ( ON-TABLE ?auto_70740 ) ( ON ?auto_70741 ?auto_70740 ) ( not ( = ?auto_70740 ?auto_70741 ) ) ( not ( = ?auto_70740 ?auto_70747 ) ) ( not ( = ?auto_70741 ?auto_70747 ) ) ( not ( = ?auto_70740 ?auto_70745 ) ) ( not ( = ?auto_70740 ?auto_70746 ) ) ( not ( = ?auto_70741 ?auto_70745 ) ) ( not ( = ?auto_70741 ?auto_70746 ) ) ( not ( = ?auto_70747 ?auto_70745 ) ) ( not ( = ?auto_70747 ?auto_70746 ) ) ( not ( = ?auto_70745 ?auto_70746 ) ) ( ON ?auto_70745 ?auto_70747 ) ( not ( = ?auto_70744 ?auto_70742 ) ) ( not ( = ?auto_70744 ?auto_70746 ) ) ( not ( = ?auto_70742 ?auto_70746 ) ) ( not ( = ?auto_70740 ?auto_70742 ) ) ( not ( = ?auto_70740 ?auto_70744 ) ) ( not ( = ?auto_70741 ?auto_70742 ) ) ( not ( = ?auto_70741 ?auto_70744 ) ) ( not ( = ?auto_70747 ?auto_70742 ) ) ( not ( = ?auto_70747 ?auto_70744 ) ) ( not ( = ?auto_70745 ?auto_70742 ) ) ( not ( = ?auto_70745 ?auto_70744 ) ) ( ON ?auto_70746 ?auto_70745 ) ( ON ?auto_70744 ?auto_70743 ) ( not ( = ?auto_70740 ?auto_70743 ) ) ( not ( = ?auto_70741 ?auto_70743 ) ) ( not ( = ?auto_70747 ?auto_70743 ) ) ( not ( = ?auto_70745 ?auto_70743 ) ) ( not ( = ?auto_70746 ?auto_70743 ) ) ( not ( = ?auto_70744 ?auto_70743 ) ) ( not ( = ?auto_70742 ?auto_70743 ) ) ( CLEAR ?auto_70746 ) ( ON ?auto_70742 ?auto_70744 ) ( CLEAR ?auto_70742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70743 ?auto_70744 )
      ( MAKE-2PILE ?auto_70740 ?auto_70741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70748 - BLOCK
      ?auto_70749 - BLOCK
    )
    :vars
    (
      ?auto_70753 - BLOCK
      ?auto_70750 - BLOCK
      ?auto_70754 - BLOCK
      ?auto_70755 - BLOCK
      ?auto_70751 - BLOCK
      ?auto_70752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70753 ?auto_70749 ) ( ON-TABLE ?auto_70748 ) ( ON ?auto_70749 ?auto_70748 ) ( not ( = ?auto_70748 ?auto_70749 ) ) ( not ( = ?auto_70748 ?auto_70753 ) ) ( not ( = ?auto_70749 ?auto_70753 ) ) ( not ( = ?auto_70748 ?auto_70750 ) ) ( not ( = ?auto_70748 ?auto_70754 ) ) ( not ( = ?auto_70749 ?auto_70750 ) ) ( not ( = ?auto_70749 ?auto_70754 ) ) ( not ( = ?auto_70753 ?auto_70750 ) ) ( not ( = ?auto_70753 ?auto_70754 ) ) ( not ( = ?auto_70750 ?auto_70754 ) ) ( ON ?auto_70750 ?auto_70753 ) ( not ( = ?auto_70755 ?auto_70751 ) ) ( not ( = ?auto_70755 ?auto_70754 ) ) ( not ( = ?auto_70751 ?auto_70754 ) ) ( not ( = ?auto_70748 ?auto_70751 ) ) ( not ( = ?auto_70748 ?auto_70755 ) ) ( not ( = ?auto_70749 ?auto_70751 ) ) ( not ( = ?auto_70749 ?auto_70755 ) ) ( not ( = ?auto_70753 ?auto_70751 ) ) ( not ( = ?auto_70753 ?auto_70755 ) ) ( not ( = ?auto_70750 ?auto_70751 ) ) ( not ( = ?auto_70750 ?auto_70755 ) ) ( ON ?auto_70755 ?auto_70752 ) ( not ( = ?auto_70748 ?auto_70752 ) ) ( not ( = ?auto_70749 ?auto_70752 ) ) ( not ( = ?auto_70753 ?auto_70752 ) ) ( not ( = ?auto_70750 ?auto_70752 ) ) ( not ( = ?auto_70754 ?auto_70752 ) ) ( not ( = ?auto_70755 ?auto_70752 ) ) ( not ( = ?auto_70751 ?auto_70752 ) ) ( ON ?auto_70751 ?auto_70755 ) ( CLEAR ?auto_70751 ) ( ON-TABLE ?auto_70752 ) ( HOLDING ?auto_70754 ) ( CLEAR ?auto_70750 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70748 ?auto_70749 ?auto_70753 ?auto_70750 ?auto_70754 )
      ( MAKE-2PILE ?auto_70748 ?auto_70749 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70799 - BLOCK
      ?auto_70800 - BLOCK
      ?auto_70801 - BLOCK
      ?auto_70802 - BLOCK
      ?auto_70803 - BLOCK
    )
    :vars
    (
      ?auto_70804 - BLOCK
      ?auto_70805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70799 ) ( ON ?auto_70800 ?auto_70799 ) ( ON ?auto_70801 ?auto_70800 ) ( not ( = ?auto_70799 ?auto_70800 ) ) ( not ( = ?auto_70799 ?auto_70801 ) ) ( not ( = ?auto_70799 ?auto_70802 ) ) ( not ( = ?auto_70799 ?auto_70803 ) ) ( not ( = ?auto_70800 ?auto_70801 ) ) ( not ( = ?auto_70800 ?auto_70802 ) ) ( not ( = ?auto_70800 ?auto_70803 ) ) ( not ( = ?auto_70801 ?auto_70802 ) ) ( not ( = ?auto_70801 ?auto_70803 ) ) ( not ( = ?auto_70802 ?auto_70803 ) ) ( ON ?auto_70803 ?auto_70804 ) ( not ( = ?auto_70799 ?auto_70804 ) ) ( not ( = ?auto_70800 ?auto_70804 ) ) ( not ( = ?auto_70801 ?auto_70804 ) ) ( not ( = ?auto_70802 ?auto_70804 ) ) ( not ( = ?auto_70803 ?auto_70804 ) ) ( CLEAR ?auto_70801 ) ( ON ?auto_70802 ?auto_70803 ) ( CLEAR ?auto_70802 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70805 ) ( ON ?auto_70804 ?auto_70805 ) ( not ( = ?auto_70805 ?auto_70804 ) ) ( not ( = ?auto_70805 ?auto_70803 ) ) ( not ( = ?auto_70805 ?auto_70802 ) ) ( not ( = ?auto_70799 ?auto_70805 ) ) ( not ( = ?auto_70800 ?auto_70805 ) ) ( not ( = ?auto_70801 ?auto_70805 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70805 ?auto_70804 ?auto_70803 )
      ( MAKE-5PILE ?auto_70799 ?auto_70800 ?auto_70801 ?auto_70802 ?auto_70803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70806 - BLOCK
      ?auto_70807 - BLOCK
      ?auto_70808 - BLOCK
      ?auto_70809 - BLOCK
      ?auto_70810 - BLOCK
    )
    :vars
    (
      ?auto_70811 - BLOCK
      ?auto_70812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70806 ) ( ON ?auto_70807 ?auto_70806 ) ( not ( = ?auto_70806 ?auto_70807 ) ) ( not ( = ?auto_70806 ?auto_70808 ) ) ( not ( = ?auto_70806 ?auto_70809 ) ) ( not ( = ?auto_70806 ?auto_70810 ) ) ( not ( = ?auto_70807 ?auto_70808 ) ) ( not ( = ?auto_70807 ?auto_70809 ) ) ( not ( = ?auto_70807 ?auto_70810 ) ) ( not ( = ?auto_70808 ?auto_70809 ) ) ( not ( = ?auto_70808 ?auto_70810 ) ) ( not ( = ?auto_70809 ?auto_70810 ) ) ( ON ?auto_70810 ?auto_70811 ) ( not ( = ?auto_70806 ?auto_70811 ) ) ( not ( = ?auto_70807 ?auto_70811 ) ) ( not ( = ?auto_70808 ?auto_70811 ) ) ( not ( = ?auto_70809 ?auto_70811 ) ) ( not ( = ?auto_70810 ?auto_70811 ) ) ( ON ?auto_70809 ?auto_70810 ) ( CLEAR ?auto_70809 ) ( ON-TABLE ?auto_70812 ) ( ON ?auto_70811 ?auto_70812 ) ( not ( = ?auto_70812 ?auto_70811 ) ) ( not ( = ?auto_70812 ?auto_70810 ) ) ( not ( = ?auto_70812 ?auto_70809 ) ) ( not ( = ?auto_70806 ?auto_70812 ) ) ( not ( = ?auto_70807 ?auto_70812 ) ) ( not ( = ?auto_70808 ?auto_70812 ) ) ( HOLDING ?auto_70808 ) ( CLEAR ?auto_70807 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70806 ?auto_70807 ?auto_70808 )
      ( MAKE-5PILE ?auto_70806 ?auto_70807 ?auto_70808 ?auto_70809 ?auto_70810 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70813 - BLOCK
      ?auto_70814 - BLOCK
      ?auto_70815 - BLOCK
      ?auto_70816 - BLOCK
      ?auto_70817 - BLOCK
    )
    :vars
    (
      ?auto_70818 - BLOCK
      ?auto_70819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70813 ) ( ON ?auto_70814 ?auto_70813 ) ( not ( = ?auto_70813 ?auto_70814 ) ) ( not ( = ?auto_70813 ?auto_70815 ) ) ( not ( = ?auto_70813 ?auto_70816 ) ) ( not ( = ?auto_70813 ?auto_70817 ) ) ( not ( = ?auto_70814 ?auto_70815 ) ) ( not ( = ?auto_70814 ?auto_70816 ) ) ( not ( = ?auto_70814 ?auto_70817 ) ) ( not ( = ?auto_70815 ?auto_70816 ) ) ( not ( = ?auto_70815 ?auto_70817 ) ) ( not ( = ?auto_70816 ?auto_70817 ) ) ( ON ?auto_70817 ?auto_70818 ) ( not ( = ?auto_70813 ?auto_70818 ) ) ( not ( = ?auto_70814 ?auto_70818 ) ) ( not ( = ?auto_70815 ?auto_70818 ) ) ( not ( = ?auto_70816 ?auto_70818 ) ) ( not ( = ?auto_70817 ?auto_70818 ) ) ( ON ?auto_70816 ?auto_70817 ) ( ON-TABLE ?auto_70819 ) ( ON ?auto_70818 ?auto_70819 ) ( not ( = ?auto_70819 ?auto_70818 ) ) ( not ( = ?auto_70819 ?auto_70817 ) ) ( not ( = ?auto_70819 ?auto_70816 ) ) ( not ( = ?auto_70813 ?auto_70819 ) ) ( not ( = ?auto_70814 ?auto_70819 ) ) ( not ( = ?auto_70815 ?auto_70819 ) ) ( CLEAR ?auto_70814 ) ( ON ?auto_70815 ?auto_70816 ) ( CLEAR ?auto_70815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70819 ?auto_70818 ?auto_70817 ?auto_70816 )
      ( MAKE-5PILE ?auto_70813 ?auto_70814 ?auto_70815 ?auto_70816 ?auto_70817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70820 - BLOCK
      ?auto_70821 - BLOCK
      ?auto_70822 - BLOCK
      ?auto_70823 - BLOCK
      ?auto_70824 - BLOCK
    )
    :vars
    (
      ?auto_70825 - BLOCK
      ?auto_70826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70820 ) ( not ( = ?auto_70820 ?auto_70821 ) ) ( not ( = ?auto_70820 ?auto_70822 ) ) ( not ( = ?auto_70820 ?auto_70823 ) ) ( not ( = ?auto_70820 ?auto_70824 ) ) ( not ( = ?auto_70821 ?auto_70822 ) ) ( not ( = ?auto_70821 ?auto_70823 ) ) ( not ( = ?auto_70821 ?auto_70824 ) ) ( not ( = ?auto_70822 ?auto_70823 ) ) ( not ( = ?auto_70822 ?auto_70824 ) ) ( not ( = ?auto_70823 ?auto_70824 ) ) ( ON ?auto_70824 ?auto_70825 ) ( not ( = ?auto_70820 ?auto_70825 ) ) ( not ( = ?auto_70821 ?auto_70825 ) ) ( not ( = ?auto_70822 ?auto_70825 ) ) ( not ( = ?auto_70823 ?auto_70825 ) ) ( not ( = ?auto_70824 ?auto_70825 ) ) ( ON ?auto_70823 ?auto_70824 ) ( ON-TABLE ?auto_70826 ) ( ON ?auto_70825 ?auto_70826 ) ( not ( = ?auto_70826 ?auto_70825 ) ) ( not ( = ?auto_70826 ?auto_70824 ) ) ( not ( = ?auto_70826 ?auto_70823 ) ) ( not ( = ?auto_70820 ?auto_70826 ) ) ( not ( = ?auto_70821 ?auto_70826 ) ) ( not ( = ?auto_70822 ?auto_70826 ) ) ( ON ?auto_70822 ?auto_70823 ) ( CLEAR ?auto_70822 ) ( HOLDING ?auto_70821 ) ( CLEAR ?auto_70820 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70820 ?auto_70821 )
      ( MAKE-5PILE ?auto_70820 ?auto_70821 ?auto_70822 ?auto_70823 ?auto_70824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70827 - BLOCK
      ?auto_70828 - BLOCK
      ?auto_70829 - BLOCK
      ?auto_70830 - BLOCK
      ?auto_70831 - BLOCK
    )
    :vars
    (
      ?auto_70832 - BLOCK
      ?auto_70833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70827 ) ( not ( = ?auto_70827 ?auto_70828 ) ) ( not ( = ?auto_70827 ?auto_70829 ) ) ( not ( = ?auto_70827 ?auto_70830 ) ) ( not ( = ?auto_70827 ?auto_70831 ) ) ( not ( = ?auto_70828 ?auto_70829 ) ) ( not ( = ?auto_70828 ?auto_70830 ) ) ( not ( = ?auto_70828 ?auto_70831 ) ) ( not ( = ?auto_70829 ?auto_70830 ) ) ( not ( = ?auto_70829 ?auto_70831 ) ) ( not ( = ?auto_70830 ?auto_70831 ) ) ( ON ?auto_70831 ?auto_70832 ) ( not ( = ?auto_70827 ?auto_70832 ) ) ( not ( = ?auto_70828 ?auto_70832 ) ) ( not ( = ?auto_70829 ?auto_70832 ) ) ( not ( = ?auto_70830 ?auto_70832 ) ) ( not ( = ?auto_70831 ?auto_70832 ) ) ( ON ?auto_70830 ?auto_70831 ) ( ON-TABLE ?auto_70833 ) ( ON ?auto_70832 ?auto_70833 ) ( not ( = ?auto_70833 ?auto_70832 ) ) ( not ( = ?auto_70833 ?auto_70831 ) ) ( not ( = ?auto_70833 ?auto_70830 ) ) ( not ( = ?auto_70827 ?auto_70833 ) ) ( not ( = ?auto_70828 ?auto_70833 ) ) ( not ( = ?auto_70829 ?auto_70833 ) ) ( ON ?auto_70829 ?auto_70830 ) ( CLEAR ?auto_70827 ) ( ON ?auto_70828 ?auto_70829 ) ( CLEAR ?auto_70828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70833 ?auto_70832 ?auto_70831 ?auto_70830 ?auto_70829 )
      ( MAKE-5PILE ?auto_70827 ?auto_70828 ?auto_70829 ?auto_70830 ?auto_70831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70834 - BLOCK
      ?auto_70835 - BLOCK
      ?auto_70836 - BLOCK
      ?auto_70837 - BLOCK
      ?auto_70838 - BLOCK
    )
    :vars
    (
      ?auto_70840 - BLOCK
      ?auto_70839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70834 ?auto_70835 ) ) ( not ( = ?auto_70834 ?auto_70836 ) ) ( not ( = ?auto_70834 ?auto_70837 ) ) ( not ( = ?auto_70834 ?auto_70838 ) ) ( not ( = ?auto_70835 ?auto_70836 ) ) ( not ( = ?auto_70835 ?auto_70837 ) ) ( not ( = ?auto_70835 ?auto_70838 ) ) ( not ( = ?auto_70836 ?auto_70837 ) ) ( not ( = ?auto_70836 ?auto_70838 ) ) ( not ( = ?auto_70837 ?auto_70838 ) ) ( ON ?auto_70838 ?auto_70840 ) ( not ( = ?auto_70834 ?auto_70840 ) ) ( not ( = ?auto_70835 ?auto_70840 ) ) ( not ( = ?auto_70836 ?auto_70840 ) ) ( not ( = ?auto_70837 ?auto_70840 ) ) ( not ( = ?auto_70838 ?auto_70840 ) ) ( ON ?auto_70837 ?auto_70838 ) ( ON-TABLE ?auto_70839 ) ( ON ?auto_70840 ?auto_70839 ) ( not ( = ?auto_70839 ?auto_70840 ) ) ( not ( = ?auto_70839 ?auto_70838 ) ) ( not ( = ?auto_70839 ?auto_70837 ) ) ( not ( = ?auto_70834 ?auto_70839 ) ) ( not ( = ?auto_70835 ?auto_70839 ) ) ( not ( = ?auto_70836 ?auto_70839 ) ) ( ON ?auto_70836 ?auto_70837 ) ( ON ?auto_70835 ?auto_70836 ) ( CLEAR ?auto_70835 ) ( HOLDING ?auto_70834 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70834 )
      ( MAKE-5PILE ?auto_70834 ?auto_70835 ?auto_70836 ?auto_70837 ?auto_70838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70841 - BLOCK
      ?auto_70842 - BLOCK
      ?auto_70843 - BLOCK
      ?auto_70844 - BLOCK
      ?auto_70845 - BLOCK
    )
    :vars
    (
      ?auto_70846 - BLOCK
      ?auto_70847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70841 ?auto_70842 ) ) ( not ( = ?auto_70841 ?auto_70843 ) ) ( not ( = ?auto_70841 ?auto_70844 ) ) ( not ( = ?auto_70841 ?auto_70845 ) ) ( not ( = ?auto_70842 ?auto_70843 ) ) ( not ( = ?auto_70842 ?auto_70844 ) ) ( not ( = ?auto_70842 ?auto_70845 ) ) ( not ( = ?auto_70843 ?auto_70844 ) ) ( not ( = ?auto_70843 ?auto_70845 ) ) ( not ( = ?auto_70844 ?auto_70845 ) ) ( ON ?auto_70845 ?auto_70846 ) ( not ( = ?auto_70841 ?auto_70846 ) ) ( not ( = ?auto_70842 ?auto_70846 ) ) ( not ( = ?auto_70843 ?auto_70846 ) ) ( not ( = ?auto_70844 ?auto_70846 ) ) ( not ( = ?auto_70845 ?auto_70846 ) ) ( ON ?auto_70844 ?auto_70845 ) ( ON-TABLE ?auto_70847 ) ( ON ?auto_70846 ?auto_70847 ) ( not ( = ?auto_70847 ?auto_70846 ) ) ( not ( = ?auto_70847 ?auto_70845 ) ) ( not ( = ?auto_70847 ?auto_70844 ) ) ( not ( = ?auto_70841 ?auto_70847 ) ) ( not ( = ?auto_70842 ?auto_70847 ) ) ( not ( = ?auto_70843 ?auto_70847 ) ) ( ON ?auto_70843 ?auto_70844 ) ( ON ?auto_70842 ?auto_70843 ) ( ON ?auto_70841 ?auto_70842 ) ( CLEAR ?auto_70841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70847 ?auto_70846 ?auto_70845 ?auto_70844 ?auto_70843 ?auto_70842 )
      ( MAKE-5PILE ?auto_70841 ?auto_70842 ?auto_70843 ?auto_70844 ?auto_70845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70853 - BLOCK
      ?auto_70854 - BLOCK
      ?auto_70855 - BLOCK
      ?auto_70856 - BLOCK
      ?auto_70857 - BLOCK
    )
    :vars
    (
      ?auto_70858 - BLOCK
      ?auto_70859 - BLOCK
      ?auto_70860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70853 ?auto_70854 ) ) ( not ( = ?auto_70853 ?auto_70855 ) ) ( not ( = ?auto_70853 ?auto_70856 ) ) ( not ( = ?auto_70853 ?auto_70857 ) ) ( not ( = ?auto_70854 ?auto_70855 ) ) ( not ( = ?auto_70854 ?auto_70856 ) ) ( not ( = ?auto_70854 ?auto_70857 ) ) ( not ( = ?auto_70855 ?auto_70856 ) ) ( not ( = ?auto_70855 ?auto_70857 ) ) ( not ( = ?auto_70856 ?auto_70857 ) ) ( ON ?auto_70857 ?auto_70858 ) ( not ( = ?auto_70853 ?auto_70858 ) ) ( not ( = ?auto_70854 ?auto_70858 ) ) ( not ( = ?auto_70855 ?auto_70858 ) ) ( not ( = ?auto_70856 ?auto_70858 ) ) ( not ( = ?auto_70857 ?auto_70858 ) ) ( ON ?auto_70856 ?auto_70857 ) ( ON-TABLE ?auto_70859 ) ( ON ?auto_70858 ?auto_70859 ) ( not ( = ?auto_70859 ?auto_70858 ) ) ( not ( = ?auto_70859 ?auto_70857 ) ) ( not ( = ?auto_70859 ?auto_70856 ) ) ( not ( = ?auto_70853 ?auto_70859 ) ) ( not ( = ?auto_70854 ?auto_70859 ) ) ( not ( = ?auto_70855 ?auto_70859 ) ) ( ON ?auto_70855 ?auto_70856 ) ( ON ?auto_70854 ?auto_70855 ) ( CLEAR ?auto_70854 ) ( ON ?auto_70853 ?auto_70860 ) ( CLEAR ?auto_70853 ) ( HAND-EMPTY ) ( not ( = ?auto_70853 ?auto_70860 ) ) ( not ( = ?auto_70854 ?auto_70860 ) ) ( not ( = ?auto_70855 ?auto_70860 ) ) ( not ( = ?auto_70856 ?auto_70860 ) ) ( not ( = ?auto_70857 ?auto_70860 ) ) ( not ( = ?auto_70858 ?auto_70860 ) ) ( not ( = ?auto_70859 ?auto_70860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70853 ?auto_70860 )
      ( MAKE-5PILE ?auto_70853 ?auto_70854 ?auto_70855 ?auto_70856 ?auto_70857 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70861 - BLOCK
      ?auto_70862 - BLOCK
      ?auto_70863 - BLOCK
      ?auto_70864 - BLOCK
      ?auto_70865 - BLOCK
    )
    :vars
    (
      ?auto_70868 - BLOCK
      ?auto_70867 - BLOCK
      ?auto_70866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70861 ?auto_70862 ) ) ( not ( = ?auto_70861 ?auto_70863 ) ) ( not ( = ?auto_70861 ?auto_70864 ) ) ( not ( = ?auto_70861 ?auto_70865 ) ) ( not ( = ?auto_70862 ?auto_70863 ) ) ( not ( = ?auto_70862 ?auto_70864 ) ) ( not ( = ?auto_70862 ?auto_70865 ) ) ( not ( = ?auto_70863 ?auto_70864 ) ) ( not ( = ?auto_70863 ?auto_70865 ) ) ( not ( = ?auto_70864 ?auto_70865 ) ) ( ON ?auto_70865 ?auto_70868 ) ( not ( = ?auto_70861 ?auto_70868 ) ) ( not ( = ?auto_70862 ?auto_70868 ) ) ( not ( = ?auto_70863 ?auto_70868 ) ) ( not ( = ?auto_70864 ?auto_70868 ) ) ( not ( = ?auto_70865 ?auto_70868 ) ) ( ON ?auto_70864 ?auto_70865 ) ( ON-TABLE ?auto_70867 ) ( ON ?auto_70868 ?auto_70867 ) ( not ( = ?auto_70867 ?auto_70868 ) ) ( not ( = ?auto_70867 ?auto_70865 ) ) ( not ( = ?auto_70867 ?auto_70864 ) ) ( not ( = ?auto_70861 ?auto_70867 ) ) ( not ( = ?auto_70862 ?auto_70867 ) ) ( not ( = ?auto_70863 ?auto_70867 ) ) ( ON ?auto_70863 ?auto_70864 ) ( ON ?auto_70861 ?auto_70866 ) ( CLEAR ?auto_70861 ) ( not ( = ?auto_70861 ?auto_70866 ) ) ( not ( = ?auto_70862 ?auto_70866 ) ) ( not ( = ?auto_70863 ?auto_70866 ) ) ( not ( = ?auto_70864 ?auto_70866 ) ) ( not ( = ?auto_70865 ?auto_70866 ) ) ( not ( = ?auto_70868 ?auto_70866 ) ) ( not ( = ?auto_70867 ?auto_70866 ) ) ( HOLDING ?auto_70862 ) ( CLEAR ?auto_70863 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70867 ?auto_70868 ?auto_70865 ?auto_70864 ?auto_70863 ?auto_70862 )
      ( MAKE-5PILE ?auto_70861 ?auto_70862 ?auto_70863 ?auto_70864 ?auto_70865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70869 - BLOCK
      ?auto_70870 - BLOCK
      ?auto_70871 - BLOCK
      ?auto_70872 - BLOCK
      ?auto_70873 - BLOCK
    )
    :vars
    (
      ?auto_70876 - BLOCK
      ?auto_70874 - BLOCK
      ?auto_70875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70869 ?auto_70870 ) ) ( not ( = ?auto_70869 ?auto_70871 ) ) ( not ( = ?auto_70869 ?auto_70872 ) ) ( not ( = ?auto_70869 ?auto_70873 ) ) ( not ( = ?auto_70870 ?auto_70871 ) ) ( not ( = ?auto_70870 ?auto_70872 ) ) ( not ( = ?auto_70870 ?auto_70873 ) ) ( not ( = ?auto_70871 ?auto_70872 ) ) ( not ( = ?auto_70871 ?auto_70873 ) ) ( not ( = ?auto_70872 ?auto_70873 ) ) ( ON ?auto_70873 ?auto_70876 ) ( not ( = ?auto_70869 ?auto_70876 ) ) ( not ( = ?auto_70870 ?auto_70876 ) ) ( not ( = ?auto_70871 ?auto_70876 ) ) ( not ( = ?auto_70872 ?auto_70876 ) ) ( not ( = ?auto_70873 ?auto_70876 ) ) ( ON ?auto_70872 ?auto_70873 ) ( ON-TABLE ?auto_70874 ) ( ON ?auto_70876 ?auto_70874 ) ( not ( = ?auto_70874 ?auto_70876 ) ) ( not ( = ?auto_70874 ?auto_70873 ) ) ( not ( = ?auto_70874 ?auto_70872 ) ) ( not ( = ?auto_70869 ?auto_70874 ) ) ( not ( = ?auto_70870 ?auto_70874 ) ) ( not ( = ?auto_70871 ?auto_70874 ) ) ( ON ?auto_70871 ?auto_70872 ) ( ON ?auto_70869 ?auto_70875 ) ( not ( = ?auto_70869 ?auto_70875 ) ) ( not ( = ?auto_70870 ?auto_70875 ) ) ( not ( = ?auto_70871 ?auto_70875 ) ) ( not ( = ?auto_70872 ?auto_70875 ) ) ( not ( = ?auto_70873 ?auto_70875 ) ) ( not ( = ?auto_70876 ?auto_70875 ) ) ( not ( = ?auto_70874 ?auto_70875 ) ) ( CLEAR ?auto_70871 ) ( ON ?auto_70870 ?auto_70869 ) ( CLEAR ?auto_70870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70875 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70875 ?auto_70869 )
      ( MAKE-5PILE ?auto_70869 ?auto_70870 ?auto_70871 ?auto_70872 ?auto_70873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70877 - BLOCK
      ?auto_70878 - BLOCK
      ?auto_70879 - BLOCK
      ?auto_70880 - BLOCK
      ?auto_70881 - BLOCK
    )
    :vars
    (
      ?auto_70882 - BLOCK
      ?auto_70883 - BLOCK
      ?auto_70884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70877 ?auto_70878 ) ) ( not ( = ?auto_70877 ?auto_70879 ) ) ( not ( = ?auto_70877 ?auto_70880 ) ) ( not ( = ?auto_70877 ?auto_70881 ) ) ( not ( = ?auto_70878 ?auto_70879 ) ) ( not ( = ?auto_70878 ?auto_70880 ) ) ( not ( = ?auto_70878 ?auto_70881 ) ) ( not ( = ?auto_70879 ?auto_70880 ) ) ( not ( = ?auto_70879 ?auto_70881 ) ) ( not ( = ?auto_70880 ?auto_70881 ) ) ( ON ?auto_70881 ?auto_70882 ) ( not ( = ?auto_70877 ?auto_70882 ) ) ( not ( = ?auto_70878 ?auto_70882 ) ) ( not ( = ?auto_70879 ?auto_70882 ) ) ( not ( = ?auto_70880 ?auto_70882 ) ) ( not ( = ?auto_70881 ?auto_70882 ) ) ( ON ?auto_70880 ?auto_70881 ) ( ON-TABLE ?auto_70883 ) ( ON ?auto_70882 ?auto_70883 ) ( not ( = ?auto_70883 ?auto_70882 ) ) ( not ( = ?auto_70883 ?auto_70881 ) ) ( not ( = ?auto_70883 ?auto_70880 ) ) ( not ( = ?auto_70877 ?auto_70883 ) ) ( not ( = ?auto_70878 ?auto_70883 ) ) ( not ( = ?auto_70879 ?auto_70883 ) ) ( ON ?auto_70877 ?auto_70884 ) ( not ( = ?auto_70877 ?auto_70884 ) ) ( not ( = ?auto_70878 ?auto_70884 ) ) ( not ( = ?auto_70879 ?auto_70884 ) ) ( not ( = ?auto_70880 ?auto_70884 ) ) ( not ( = ?auto_70881 ?auto_70884 ) ) ( not ( = ?auto_70882 ?auto_70884 ) ) ( not ( = ?auto_70883 ?auto_70884 ) ) ( ON ?auto_70878 ?auto_70877 ) ( CLEAR ?auto_70878 ) ( ON-TABLE ?auto_70884 ) ( HOLDING ?auto_70879 ) ( CLEAR ?auto_70880 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70883 ?auto_70882 ?auto_70881 ?auto_70880 ?auto_70879 )
      ( MAKE-5PILE ?auto_70877 ?auto_70878 ?auto_70879 ?auto_70880 ?auto_70881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70885 - BLOCK
      ?auto_70886 - BLOCK
      ?auto_70887 - BLOCK
      ?auto_70888 - BLOCK
      ?auto_70889 - BLOCK
    )
    :vars
    (
      ?auto_70890 - BLOCK
      ?auto_70892 - BLOCK
      ?auto_70891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70885 ?auto_70886 ) ) ( not ( = ?auto_70885 ?auto_70887 ) ) ( not ( = ?auto_70885 ?auto_70888 ) ) ( not ( = ?auto_70885 ?auto_70889 ) ) ( not ( = ?auto_70886 ?auto_70887 ) ) ( not ( = ?auto_70886 ?auto_70888 ) ) ( not ( = ?auto_70886 ?auto_70889 ) ) ( not ( = ?auto_70887 ?auto_70888 ) ) ( not ( = ?auto_70887 ?auto_70889 ) ) ( not ( = ?auto_70888 ?auto_70889 ) ) ( ON ?auto_70889 ?auto_70890 ) ( not ( = ?auto_70885 ?auto_70890 ) ) ( not ( = ?auto_70886 ?auto_70890 ) ) ( not ( = ?auto_70887 ?auto_70890 ) ) ( not ( = ?auto_70888 ?auto_70890 ) ) ( not ( = ?auto_70889 ?auto_70890 ) ) ( ON ?auto_70888 ?auto_70889 ) ( ON-TABLE ?auto_70892 ) ( ON ?auto_70890 ?auto_70892 ) ( not ( = ?auto_70892 ?auto_70890 ) ) ( not ( = ?auto_70892 ?auto_70889 ) ) ( not ( = ?auto_70892 ?auto_70888 ) ) ( not ( = ?auto_70885 ?auto_70892 ) ) ( not ( = ?auto_70886 ?auto_70892 ) ) ( not ( = ?auto_70887 ?auto_70892 ) ) ( ON ?auto_70885 ?auto_70891 ) ( not ( = ?auto_70885 ?auto_70891 ) ) ( not ( = ?auto_70886 ?auto_70891 ) ) ( not ( = ?auto_70887 ?auto_70891 ) ) ( not ( = ?auto_70888 ?auto_70891 ) ) ( not ( = ?auto_70889 ?auto_70891 ) ) ( not ( = ?auto_70890 ?auto_70891 ) ) ( not ( = ?auto_70892 ?auto_70891 ) ) ( ON ?auto_70886 ?auto_70885 ) ( ON-TABLE ?auto_70891 ) ( CLEAR ?auto_70888 ) ( ON ?auto_70887 ?auto_70886 ) ( CLEAR ?auto_70887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70891 ?auto_70885 ?auto_70886 )
      ( MAKE-5PILE ?auto_70885 ?auto_70886 ?auto_70887 ?auto_70888 ?auto_70889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70893 - BLOCK
      ?auto_70894 - BLOCK
      ?auto_70895 - BLOCK
      ?auto_70896 - BLOCK
      ?auto_70897 - BLOCK
    )
    :vars
    (
      ?auto_70899 - BLOCK
      ?auto_70898 - BLOCK
      ?auto_70900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70893 ?auto_70894 ) ) ( not ( = ?auto_70893 ?auto_70895 ) ) ( not ( = ?auto_70893 ?auto_70896 ) ) ( not ( = ?auto_70893 ?auto_70897 ) ) ( not ( = ?auto_70894 ?auto_70895 ) ) ( not ( = ?auto_70894 ?auto_70896 ) ) ( not ( = ?auto_70894 ?auto_70897 ) ) ( not ( = ?auto_70895 ?auto_70896 ) ) ( not ( = ?auto_70895 ?auto_70897 ) ) ( not ( = ?auto_70896 ?auto_70897 ) ) ( ON ?auto_70897 ?auto_70899 ) ( not ( = ?auto_70893 ?auto_70899 ) ) ( not ( = ?auto_70894 ?auto_70899 ) ) ( not ( = ?auto_70895 ?auto_70899 ) ) ( not ( = ?auto_70896 ?auto_70899 ) ) ( not ( = ?auto_70897 ?auto_70899 ) ) ( ON-TABLE ?auto_70898 ) ( ON ?auto_70899 ?auto_70898 ) ( not ( = ?auto_70898 ?auto_70899 ) ) ( not ( = ?auto_70898 ?auto_70897 ) ) ( not ( = ?auto_70898 ?auto_70896 ) ) ( not ( = ?auto_70893 ?auto_70898 ) ) ( not ( = ?auto_70894 ?auto_70898 ) ) ( not ( = ?auto_70895 ?auto_70898 ) ) ( ON ?auto_70893 ?auto_70900 ) ( not ( = ?auto_70893 ?auto_70900 ) ) ( not ( = ?auto_70894 ?auto_70900 ) ) ( not ( = ?auto_70895 ?auto_70900 ) ) ( not ( = ?auto_70896 ?auto_70900 ) ) ( not ( = ?auto_70897 ?auto_70900 ) ) ( not ( = ?auto_70899 ?auto_70900 ) ) ( not ( = ?auto_70898 ?auto_70900 ) ) ( ON ?auto_70894 ?auto_70893 ) ( ON-TABLE ?auto_70900 ) ( ON ?auto_70895 ?auto_70894 ) ( CLEAR ?auto_70895 ) ( HOLDING ?auto_70896 ) ( CLEAR ?auto_70897 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70898 ?auto_70899 ?auto_70897 ?auto_70896 )
      ( MAKE-5PILE ?auto_70893 ?auto_70894 ?auto_70895 ?auto_70896 ?auto_70897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70901 - BLOCK
      ?auto_70902 - BLOCK
      ?auto_70903 - BLOCK
      ?auto_70904 - BLOCK
      ?auto_70905 - BLOCK
    )
    :vars
    (
      ?auto_70908 - BLOCK
      ?auto_70907 - BLOCK
      ?auto_70906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70901 ?auto_70902 ) ) ( not ( = ?auto_70901 ?auto_70903 ) ) ( not ( = ?auto_70901 ?auto_70904 ) ) ( not ( = ?auto_70901 ?auto_70905 ) ) ( not ( = ?auto_70902 ?auto_70903 ) ) ( not ( = ?auto_70902 ?auto_70904 ) ) ( not ( = ?auto_70902 ?auto_70905 ) ) ( not ( = ?auto_70903 ?auto_70904 ) ) ( not ( = ?auto_70903 ?auto_70905 ) ) ( not ( = ?auto_70904 ?auto_70905 ) ) ( ON ?auto_70905 ?auto_70908 ) ( not ( = ?auto_70901 ?auto_70908 ) ) ( not ( = ?auto_70902 ?auto_70908 ) ) ( not ( = ?auto_70903 ?auto_70908 ) ) ( not ( = ?auto_70904 ?auto_70908 ) ) ( not ( = ?auto_70905 ?auto_70908 ) ) ( ON-TABLE ?auto_70907 ) ( ON ?auto_70908 ?auto_70907 ) ( not ( = ?auto_70907 ?auto_70908 ) ) ( not ( = ?auto_70907 ?auto_70905 ) ) ( not ( = ?auto_70907 ?auto_70904 ) ) ( not ( = ?auto_70901 ?auto_70907 ) ) ( not ( = ?auto_70902 ?auto_70907 ) ) ( not ( = ?auto_70903 ?auto_70907 ) ) ( ON ?auto_70901 ?auto_70906 ) ( not ( = ?auto_70901 ?auto_70906 ) ) ( not ( = ?auto_70902 ?auto_70906 ) ) ( not ( = ?auto_70903 ?auto_70906 ) ) ( not ( = ?auto_70904 ?auto_70906 ) ) ( not ( = ?auto_70905 ?auto_70906 ) ) ( not ( = ?auto_70908 ?auto_70906 ) ) ( not ( = ?auto_70907 ?auto_70906 ) ) ( ON ?auto_70902 ?auto_70901 ) ( ON-TABLE ?auto_70906 ) ( ON ?auto_70903 ?auto_70902 ) ( CLEAR ?auto_70905 ) ( ON ?auto_70904 ?auto_70903 ) ( CLEAR ?auto_70904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70906 ?auto_70901 ?auto_70902 ?auto_70903 )
      ( MAKE-5PILE ?auto_70901 ?auto_70902 ?auto_70903 ?auto_70904 ?auto_70905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70909 - BLOCK
      ?auto_70910 - BLOCK
      ?auto_70911 - BLOCK
      ?auto_70912 - BLOCK
      ?auto_70913 - BLOCK
    )
    :vars
    (
      ?auto_70916 - BLOCK
      ?auto_70915 - BLOCK
      ?auto_70914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70909 ?auto_70910 ) ) ( not ( = ?auto_70909 ?auto_70911 ) ) ( not ( = ?auto_70909 ?auto_70912 ) ) ( not ( = ?auto_70909 ?auto_70913 ) ) ( not ( = ?auto_70910 ?auto_70911 ) ) ( not ( = ?auto_70910 ?auto_70912 ) ) ( not ( = ?auto_70910 ?auto_70913 ) ) ( not ( = ?auto_70911 ?auto_70912 ) ) ( not ( = ?auto_70911 ?auto_70913 ) ) ( not ( = ?auto_70912 ?auto_70913 ) ) ( not ( = ?auto_70909 ?auto_70916 ) ) ( not ( = ?auto_70910 ?auto_70916 ) ) ( not ( = ?auto_70911 ?auto_70916 ) ) ( not ( = ?auto_70912 ?auto_70916 ) ) ( not ( = ?auto_70913 ?auto_70916 ) ) ( ON-TABLE ?auto_70915 ) ( ON ?auto_70916 ?auto_70915 ) ( not ( = ?auto_70915 ?auto_70916 ) ) ( not ( = ?auto_70915 ?auto_70913 ) ) ( not ( = ?auto_70915 ?auto_70912 ) ) ( not ( = ?auto_70909 ?auto_70915 ) ) ( not ( = ?auto_70910 ?auto_70915 ) ) ( not ( = ?auto_70911 ?auto_70915 ) ) ( ON ?auto_70909 ?auto_70914 ) ( not ( = ?auto_70909 ?auto_70914 ) ) ( not ( = ?auto_70910 ?auto_70914 ) ) ( not ( = ?auto_70911 ?auto_70914 ) ) ( not ( = ?auto_70912 ?auto_70914 ) ) ( not ( = ?auto_70913 ?auto_70914 ) ) ( not ( = ?auto_70916 ?auto_70914 ) ) ( not ( = ?auto_70915 ?auto_70914 ) ) ( ON ?auto_70910 ?auto_70909 ) ( ON-TABLE ?auto_70914 ) ( ON ?auto_70911 ?auto_70910 ) ( ON ?auto_70912 ?auto_70911 ) ( CLEAR ?auto_70912 ) ( HOLDING ?auto_70913 ) ( CLEAR ?auto_70916 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70915 ?auto_70916 ?auto_70913 )
      ( MAKE-5PILE ?auto_70909 ?auto_70910 ?auto_70911 ?auto_70912 ?auto_70913 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70917 - BLOCK
      ?auto_70918 - BLOCK
      ?auto_70919 - BLOCK
      ?auto_70920 - BLOCK
      ?auto_70921 - BLOCK
    )
    :vars
    (
      ?auto_70924 - BLOCK
      ?auto_70922 - BLOCK
      ?auto_70923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70917 ?auto_70918 ) ) ( not ( = ?auto_70917 ?auto_70919 ) ) ( not ( = ?auto_70917 ?auto_70920 ) ) ( not ( = ?auto_70917 ?auto_70921 ) ) ( not ( = ?auto_70918 ?auto_70919 ) ) ( not ( = ?auto_70918 ?auto_70920 ) ) ( not ( = ?auto_70918 ?auto_70921 ) ) ( not ( = ?auto_70919 ?auto_70920 ) ) ( not ( = ?auto_70919 ?auto_70921 ) ) ( not ( = ?auto_70920 ?auto_70921 ) ) ( not ( = ?auto_70917 ?auto_70924 ) ) ( not ( = ?auto_70918 ?auto_70924 ) ) ( not ( = ?auto_70919 ?auto_70924 ) ) ( not ( = ?auto_70920 ?auto_70924 ) ) ( not ( = ?auto_70921 ?auto_70924 ) ) ( ON-TABLE ?auto_70922 ) ( ON ?auto_70924 ?auto_70922 ) ( not ( = ?auto_70922 ?auto_70924 ) ) ( not ( = ?auto_70922 ?auto_70921 ) ) ( not ( = ?auto_70922 ?auto_70920 ) ) ( not ( = ?auto_70917 ?auto_70922 ) ) ( not ( = ?auto_70918 ?auto_70922 ) ) ( not ( = ?auto_70919 ?auto_70922 ) ) ( ON ?auto_70917 ?auto_70923 ) ( not ( = ?auto_70917 ?auto_70923 ) ) ( not ( = ?auto_70918 ?auto_70923 ) ) ( not ( = ?auto_70919 ?auto_70923 ) ) ( not ( = ?auto_70920 ?auto_70923 ) ) ( not ( = ?auto_70921 ?auto_70923 ) ) ( not ( = ?auto_70924 ?auto_70923 ) ) ( not ( = ?auto_70922 ?auto_70923 ) ) ( ON ?auto_70918 ?auto_70917 ) ( ON-TABLE ?auto_70923 ) ( ON ?auto_70919 ?auto_70918 ) ( ON ?auto_70920 ?auto_70919 ) ( CLEAR ?auto_70924 ) ( ON ?auto_70921 ?auto_70920 ) ( CLEAR ?auto_70921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70923 ?auto_70917 ?auto_70918 ?auto_70919 ?auto_70920 )
      ( MAKE-5PILE ?auto_70917 ?auto_70918 ?auto_70919 ?auto_70920 ?auto_70921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70925 - BLOCK
      ?auto_70926 - BLOCK
      ?auto_70927 - BLOCK
      ?auto_70928 - BLOCK
      ?auto_70929 - BLOCK
    )
    :vars
    (
      ?auto_70931 - BLOCK
      ?auto_70930 - BLOCK
      ?auto_70932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70925 ?auto_70926 ) ) ( not ( = ?auto_70925 ?auto_70927 ) ) ( not ( = ?auto_70925 ?auto_70928 ) ) ( not ( = ?auto_70925 ?auto_70929 ) ) ( not ( = ?auto_70926 ?auto_70927 ) ) ( not ( = ?auto_70926 ?auto_70928 ) ) ( not ( = ?auto_70926 ?auto_70929 ) ) ( not ( = ?auto_70927 ?auto_70928 ) ) ( not ( = ?auto_70927 ?auto_70929 ) ) ( not ( = ?auto_70928 ?auto_70929 ) ) ( not ( = ?auto_70925 ?auto_70931 ) ) ( not ( = ?auto_70926 ?auto_70931 ) ) ( not ( = ?auto_70927 ?auto_70931 ) ) ( not ( = ?auto_70928 ?auto_70931 ) ) ( not ( = ?auto_70929 ?auto_70931 ) ) ( ON-TABLE ?auto_70930 ) ( not ( = ?auto_70930 ?auto_70931 ) ) ( not ( = ?auto_70930 ?auto_70929 ) ) ( not ( = ?auto_70930 ?auto_70928 ) ) ( not ( = ?auto_70925 ?auto_70930 ) ) ( not ( = ?auto_70926 ?auto_70930 ) ) ( not ( = ?auto_70927 ?auto_70930 ) ) ( ON ?auto_70925 ?auto_70932 ) ( not ( = ?auto_70925 ?auto_70932 ) ) ( not ( = ?auto_70926 ?auto_70932 ) ) ( not ( = ?auto_70927 ?auto_70932 ) ) ( not ( = ?auto_70928 ?auto_70932 ) ) ( not ( = ?auto_70929 ?auto_70932 ) ) ( not ( = ?auto_70931 ?auto_70932 ) ) ( not ( = ?auto_70930 ?auto_70932 ) ) ( ON ?auto_70926 ?auto_70925 ) ( ON-TABLE ?auto_70932 ) ( ON ?auto_70927 ?auto_70926 ) ( ON ?auto_70928 ?auto_70927 ) ( ON ?auto_70929 ?auto_70928 ) ( CLEAR ?auto_70929 ) ( HOLDING ?auto_70931 ) ( CLEAR ?auto_70930 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70930 ?auto_70931 )
      ( MAKE-5PILE ?auto_70925 ?auto_70926 ?auto_70927 ?auto_70928 ?auto_70929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70933 - BLOCK
      ?auto_70934 - BLOCK
      ?auto_70935 - BLOCK
      ?auto_70936 - BLOCK
      ?auto_70937 - BLOCK
    )
    :vars
    (
      ?auto_70940 - BLOCK
      ?auto_70938 - BLOCK
      ?auto_70939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70933 ?auto_70934 ) ) ( not ( = ?auto_70933 ?auto_70935 ) ) ( not ( = ?auto_70933 ?auto_70936 ) ) ( not ( = ?auto_70933 ?auto_70937 ) ) ( not ( = ?auto_70934 ?auto_70935 ) ) ( not ( = ?auto_70934 ?auto_70936 ) ) ( not ( = ?auto_70934 ?auto_70937 ) ) ( not ( = ?auto_70935 ?auto_70936 ) ) ( not ( = ?auto_70935 ?auto_70937 ) ) ( not ( = ?auto_70936 ?auto_70937 ) ) ( not ( = ?auto_70933 ?auto_70940 ) ) ( not ( = ?auto_70934 ?auto_70940 ) ) ( not ( = ?auto_70935 ?auto_70940 ) ) ( not ( = ?auto_70936 ?auto_70940 ) ) ( not ( = ?auto_70937 ?auto_70940 ) ) ( ON-TABLE ?auto_70938 ) ( not ( = ?auto_70938 ?auto_70940 ) ) ( not ( = ?auto_70938 ?auto_70937 ) ) ( not ( = ?auto_70938 ?auto_70936 ) ) ( not ( = ?auto_70933 ?auto_70938 ) ) ( not ( = ?auto_70934 ?auto_70938 ) ) ( not ( = ?auto_70935 ?auto_70938 ) ) ( ON ?auto_70933 ?auto_70939 ) ( not ( = ?auto_70933 ?auto_70939 ) ) ( not ( = ?auto_70934 ?auto_70939 ) ) ( not ( = ?auto_70935 ?auto_70939 ) ) ( not ( = ?auto_70936 ?auto_70939 ) ) ( not ( = ?auto_70937 ?auto_70939 ) ) ( not ( = ?auto_70940 ?auto_70939 ) ) ( not ( = ?auto_70938 ?auto_70939 ) ) ( ON ?auto_70934 ?auto_70933 ) ( ON-TABLE ?auto_70939 ) ( ON ?auto_70935 ?auto_70934 ) ( ON ?auto_70936 ?auto_70935 ) ( ON ?auto_70937 ?auto_70936 ) ( CLEAR ?auto_70938 ) ( ON ?auto_70940 ?auto_70937 ) ( CLEAR ?auto_70940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70939 ?auto_70933 ?auto_70934 ?auto_70935 ?auto_70936 ?auto_70937 )
      ( MAKE-5PILE ?auto_70933 ?auto_70934 ?auto_70935 ?auto_70936 ?auto_70937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70941 - BLOCK
      ?auto_70942 - BLOCK
      ?auto_70943 - BLOCK
      ?auto_70944 - BLOCK
      ?auto_70945 - BLOCK
    )
    :vars
    (
      ?auto_70947 - BLOCK
      ?auto_70948 - BLOCK
      ?auto_70946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70941 ?auto_70942 ) ) ( not ( = ?auto_70941 ?auto_70943 ) ) ( not ( = ?auto_70941 ?auto_70944 ) ) ( not ( = ?auto_70941 ?auto_70945 ) ) ( not ( = ?auto_70942 ?auto_70943 ) ) ( not ( = ?auto_70942 ?auto_70944 ) ) ( not ( = ?auto_70942 ?auto_70945 ) ) ( not ( = ?auto_70943 ?auto_70944 ) ) ( not ( = ?auto_70943 ?auto_70945 ) ) ( not ( = ?auto_70944 ?auto_70945 ) ) ( not ( = ?auto_70941 ?auto_70947 ) ) ( not ( = ?auto_70942 ?auto_70947 ) ) ( not ( = ?auto_70943 ?auto_70947 ) ) ( not ( = ?auto_70944 ?auto_70947 ) ) ( not ( = ?auto_70945 ?auto_70947 ) ) ( not ( = ?auto_70948 ?auto_70947 ) ) ( not ( = ?auto_70948 ?auto_70945 ) ) ( not ( = ?auto_70948 ?auto_70944 ) ) ( not ( = ?auto_70941 ?auto_70948 ) ) ( not ( = ?auto_70942 ?auto_70948 ) ) ( not ( = ?auto_70943 ?auto_70948 ) ) ( ON ?auto_70941 ?auto_70946 ) ( not ( = ?auto_70941 ?auto_70946 ) ) ( not ( = ?auto_70942 ?auto_70946 ) ) ( not ( = ?auto_70943 ?auto_70946 ) ) ( not ( = ?auto_70944 ?auto_70946 ) ) ( not ( = ?auto_70945 ?auto_70946 ) ) ( not ( = ?auto_70947 ?auto_70946 ) ) ( not ( = ?auto_70948 ?auto_70946 ) ) ( ON ?auto_70942 ?auto_70941 ) ( ON-TABLE ?auto_70946 ) ( ON ?auto_70943 ?auto_70942 ) ( ON ?auto_70944 ?auto_70943 ) ( ON ?auto_70945 ?auto_70944 ) ( ON ?auto_70947 ?auto_70945 ) ( CLEAR ?auto_70947 ) ( HOLDING ?auto_70948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70948 )
      ( MAKE-5PILE ?auto_70941 ?auto_70942 ?auto_70943 ?auto_70944 ?auto_70945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70949 - BLOCK
      ?auto_70950 - BLOCK
      ?auto_70951 - BLOCK
      ?auto_70952 - BLOCK
      ?auto_70953 - BLOCK
    )
    :vars
    (
      ?auto_70955 - BLOCK
      ?auto_70956 - BLOCK
      ?auto_70954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70949 ?auto_70950 ) ) ( not ( = ?auto_70949 ?auto_70951 ) ) ( not ( = ?auto_70949 ?auto_70952 ) ) ( not ( = ?auto_70949 ?auto_70953 ) ) ( not ( = ?auto_70950 ?auto_70951 ) ) ( not ( = ?auto_70950 ?auto_70952 ) ) ( not ( = ?auto_70950 ?auto_70953 ) ) ( not ( = ?auto_70951 ?auto_70952 ) ) ( not ( = ?auto_70951 ?auto_70953 ) ) ( not ( = ?auto_70952 ?auto_70953 ) ) ( not ( = ?auto_70949 ?auto_70955 ) ) ( not ( = ?auto_70950 ?auto_70955 ) ) ( not ( = ?auto_70951 ?auto_70955 ) ) ( not ( = ?auto_70952 ?auto_70955 ) ) ( not ( = ?auto_70953 ?auto_70955 ) ) ( not ( = ?auto_70956 ?auto_70955 ) ) ( not ( = ?auto_70956 ?auto_70953 ) ) ( not ( = ?auto_70956 ?auto_70952 ) ) ( not ( = ?auto_70949 ?auto_70956 ) ) ( not ( = ?auto_70950 ?auto_70956 ) ) ( not ( = ?auto_70951 ?auto_70956 ) ) ( ON ?auto_70949 ?auto_70954 ) ( not ( = ?auto_70949 ?auto_70954 ) ) ( not ( = ?auto_70950 ?auto_70954 ) ) ( not ( = ?auto_70951 ?auto_70954 ) ) ( not ( = ?auto_70952 ?auto_70954 ) ) ( not ( = ?auto_70953 ?auto_70954 ) ) ( not ( = ?auto_70955 ?auto_70954 ) ) ( not ( = ?auto_70956 ?auto_70954 ) ) ( ON ?auto_70950 ?auto_70949 ) ( ON-TABLE ?auto_70954 ) ( ON ?auto_70951 ?auto_70950 ) ( ON ?auto_70952 ?auto_70951 ) ( ON ?auto_70953 ?auto_70952 ) ( ON ?auto_70955 ?auto_70953 ) ( ON ?auto_70956 ?auto_70955 ) ( CLEAR ?auto_70956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_70954 ?auto_70949 ?auto_70950 ?auto_70951 ?auto_70952 ?auto_70953 ?auto_70955 )
      ( MAKE-5PILE ?auto_70949 ?auto_70950 ?auto_70951 ?auto_70952 ?auto_70953 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70968 - BLOCK
    )
    :vars
    (
      ?auto_70969 - BLOCK
      ?auto_70970 - BLOCK
      ?auto_70971 - BLOCK
      ?auto_70974 - BLOCK
      ?auto_70972 - BLOCK
      ?auto_70973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70969 ?auto_70968 ) ( ON-TABLE ?auto_70968 ) ( not ( = ?auto_70968 ?auto_70969 ) ) ( not ( = ?auto_70968 ?auto_70970 ) ) ( not ( = ?auto_70968 ?auto_70971 ) ) ( not ( = ?auto_70969 ?auto_70970 ) ) ( not ( = ?auto_70969 ?auto_70971 ) ) ( not ( = ?auto_70970 ?auto_70971 ) ) ( ON ?auto_70970 ?auto_70969 ) ( CLEAR ?auto_70970 ) ( HOLDING ?auto_70971 ) ( CLEAR ?auto_70974 ) ( ON-TABLE ?auto_70972 ) ( ON ?auto_70973 ?auto_70972 ) ( ON ?auto_70974 ?auto_70973 ) ( not ( = ?auto_70972 ?auto_70973 ) ) ( not ( = ?auto_70972 ?auto_70974 ) ) ( not ( = ?auto_70972 ?auto_70971 ) ) ( not ( = ?auto_70973 ?auto_70974 ) ) ( not ( = ?auto_70973 ?auto_70971 ) ) ( not ( = ?auto_70974 ?auto_70971 ) ) ( not ( = ?auto_70968 ?auto_70974 ) ) ( not ( = ?auto_70968 ?auto_70972 ) ) ( not ( = ?auto_70968 ?auto_70973 ) ) ( not ( = ?auto_70969 ?auto_70974 ) ) ( not ( = ?auto_70969 ?auto_70972 ) ) ( not ( = ?auto_70969 ?auto_70973 ) ) ( not ( = ?auto_70970 ?auto_70974 ) ) ( not ( = ?auto_70970 ?auto_70972 ) ) ( not ( = ?auto_70970 ?auto_70973 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70972 ?auto_70973 ?auto_70974 ?auto_70971 )
      ( MAKE-1PILE ?auto_70968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70975 - BLOCK
    )
    :vars
    (
      ?auto_70979 - BLOCK
      ?auto_70980 - BLOCK
      ?auto_70981 - BLOCK
      ?auto_70976 - BLOCK
      ?auto_70977 - BLOCK
      ?auto_70978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70979 ?auto_70975 ) ( ON-TABLE ?auto_70975 ) ( not ( = ?auto_70975 ?auto_70979 ) ) ( not ( = ?auto_70975 ?auto_70980 ) ) ( not ( = ?auto_70975 ?auto_70981 ) ) ( not ( = ?auto_70979 ?auto_70980 ) ) ( not ( = ?auto_70979 ?auto_70981 ) ) ( not ( = ?auto_70980 ?auto_70981 ) ) ( ON ?auto_70980 ?auto_70979 ) ( CLEAR ?auto_70976 ) ( ON-TABLE ?auto_70977 ) ( ON ?auto_70978 ?auto_70977 ) ( ON ?auto_70976 ?auto_70978 ) ( not ( = ?auto_70977 ?auto_70978 ) ) ( not ( = ?auto_70977 ?auto_70976 ) ) ( not ( = ?auto_70977 ?auto_70981 ) ) ( not ( = ?auto_70978 ?auto_70976 ) ) ( not ( = ?auto_70978 ?auto_70981 ) ) ( not ( = ?auto_70976 ?auto_70981 ) ) ( not ( = ?auto_70975 ?auto_70976 ) ) ( not ( = ?auto_70975 ?auto_70977 ) ) ( not ( = ?auto_70975 ?auto_70978 ) ) ( not ( = ?auto_70979 ?auto_70976 ) ) ( not ( = ?auto_70979 ?auto_70977 ) ) ( not ( = ?auto_70979 ?auto_70978 ) ) ( not ( = ?auto_70980 ?auto_70976 ) ) ( not ( = ?auto_70980 ?auto_70977 ) ) ( not ( = ?auto_70980 ?auto_70978 ) ) ( ON ?auto_70981 ?auto_70980 ) ( CLEAR ?auto_70981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70975 ?auto_70979 ?auto_70980 )
      ( MAKE-1PILE ?auto_70975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70982 - BLOCK
    )
    :vars
    (
      ?auto_70988 - BLOCK
      ?auto_70987 - BLOCK
      ?auto_70986 - BLOCK
      ?auto_70983 - BLOCK
      ?auto_70984 - BLOCK
      ?auto_70985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70988 ?auto_70982 ) ( ON-TABLE ?auto_70982 ) ( not ( = ?auto_70982 ?auto_70988 ) ) ( not ( = ?auto_70982 ?auto_70987 ) ) ( not ( = ?auto_70982 ?auto_70986 ) ) ( not ( = ?auto_70988 ?auto_70987 ) ) ( not ( = ?auto_70988 ?auto_70986 ) ) ( not ( = ?auto_70987 ?auto_70986 ) ) ( ON ?auto_70987 ?auto_70988 ) ( ON-TABLE ?auto_70983 ) ( ON ?auto_70984 ?auto_70983 ) ( not ( = ?auto_70983 ?auto_70984 ) ) ( not ( = ?auto_70983 ?auto_70985 ) ) ( not ( = ?auto_70983 ?auto_70986 ) ) ( not ( = ?auto_70984 ?auto_70985 ) ) ( not ( = ?auto_70984 ?auto_70986 ) ) ( not ( = ?auto_70985 ?auto_70986 ) ) ( not ( = ?auto_70982 ?auto_70985 ) ) ( not ( = ?auto_70982 ?auto_70983 ) ) ( not ( = ?auto_70982 ?auto_70984 ) ) ( not ( = ?auto_70988 ?auto_70985 ) ) ( not ( = ?auto_70988 ?auto_70983 ) ) ( not ( = ?auto_70988 ?auto_70984 ) ) ( not ( = ?auto_70987 ?auto_70985 ) ) ( not ( = ?auto_70987 ?auto_70983 ) ) ( not ( = ?auto_70987 ?auto_70984 ) ) ( ON ?auto_70986 ?auto_70987 ) ( CLEAR ?auto_70986 ) ( HOLDING ?auto_70985 ) ( CLEAR ?auto_70984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70983 ?auto_70984 ?auto_70985 )
      ( MAKE-1PILE ?auto_70982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70989 - BLOCK
    )
    :vars
    (
      ?auto_70992 - BLOCK
      ?auto_70990 - BLOCK
      ?auto_70993 - BLOCK
      ?auto_70991 - BLOCK
      ?auto_70995 - BLOCK
      ?auto_70994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70992 ?auto_70989 ) ( ON-TABLE ?auto_70989 ) ( not ( = ?auto_70989 ?auto_70992 ) ) ( not ( = ?auto_70989 ?auto_70990 ) ) ( not ( = ?auto_70989 ?auto_70993 ) ) ( not ( = ?auto_70992 ?auto_70990 ) ) ( not ( = ?auto_70992 ?auto_70993 ) ) ( not ( = ?auto_70990 ?auto_70993 ) ) ( ON ?auto_70990 ?auto_70992 ) ( ON-TABLE ?auto_70991 ) ( ON ?auto_70995 ?auto_70991 ) ( not ( = ?auto_70991 ?auto_70995 ) ) ( not ( = ?auto_70991 ?auto_70994 ) ) ( not ( = ?auto_70991 ?auto_70993 ) ) ( not ( = ?auto_70995 ?auto_70994 ) ) ( not ( = ?auto_70995 ?auto_70993 ) ) ( not ( = ?auto_70994 ?auto_70993 ) ) ( not ( = ?auto_70989 ?auto_70994 ) ) ( not ( = ?auto_70989 ?auto_70991 ) ) ( not ( = ?auto_70989 ?auto_70995 ) ) ( not ( = ?auto_70992 ?auto_70994 ) ) ( not ( = ?auto_70992 ?auto_70991 ) ) ( not ( = ?auto_70992 ?auto_70995 ) ) ( not ( = ?auto_70990 ?auto_70994 ) ) ( not ( = ?auto_70990 ?auto_70991 ) ) ( not ( = ?auto_70990 ?auto_70995 ) ) ( ON ?auto_70993 ?auto_70990 ) ( CLEAR ?auto_70995 ) ( ON ?auto_70994 ?auto_70993 ) ( CLEAR ?auto_70994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70989 ?auto_70992 ?auto_70990 ?auto_70993 )
      ( MAKE-1PILE ?auto_70989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70996 - BLOCK
    )
    :vars
    (
      ?auto_70997 - BLOCK
      ?auto_70999 - BLOCK
      ?auto_70998 - BLOCK
      ?auto_71001 - BLOCK
      ?auto_71002 - BLOCK
      ?auto_71000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70997 ?auto_70996 ) ( ON-TABLE ?auto_70996 ) ( not ( = ?auto_70996 ?auto_70997 ) ) ( not ( = ?auto_70996 ?auto_70999 ) ) ( not ( = ?auto_70996 ?auto_70998 ) ) ( not ( = ?auto_70997 ?auto_70999 ) ) ( not ( = ?auto_70997 ?auto_70998 ) ) ( not ( = ?auto_70999 ?auto_70998 ) ) ( ON ?auto_70999 ?auto_70997 ) ( ON-TABLE ?auto_71001 ) ( not ( = ?auto_71001 ?auto_71002 ) ) ( not ( = ?auto_71001 ?auto_71000 ) ) ( not ( = ?auto_71001 ?auto_70998 ) ) ( not ( = ?auto_71002 ?auto_71000 ) ) ( not ( = ?auto_71002 ?auto_70998 ) ) ( not ( = ?auto_71000 ?auto_70998 ) ) ( not ( = ?auto_70996 ?auto_71000 ) ) ( not ( = ?auto_70996 ?auto_71001 ) ) ( not ( = ?auto_70996 ?auto_71002 ) ) ( not ( = ?auto_70997 ?auto_71000 ) ) ( not ( = ?auto_70997 ?auto_71001 ) ) ( not ( = ?auto_70997 ?auto_71002 ) ) ( not ( = ?auto_70999 ?auto_71000 ) ) ( not ( = ?auto_70999 ?auto_71001 ) ) ( not ( = ?auto_70999 ?auto_71002 ) ) ( ON ?auto_70998 ?auto_70999 ) ( ON ?auto_71000 ?auto_70998 ) ( CLEAR ?auto_71000 ) ( HOLDING ?auto_71002 ) ( CLEAR ?auto_71001 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71001 ?auto_71002 )
      ( MAKE-1PILE ?auto_70996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71003 - BLOCK
    )
    :vars
    (
      ?auto_71007 - BLOCK
      ?auto_71006 - BLOCK
      ?auto_71009 - BLOCK
      ?auto_71004 - BLOCK
      ?auto_71008 - BLOCK
      ?auto_71005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71007 ?auto_71003 ) ( ON-TABLE ?auto_71003 ) ( not ( = ?auto_71003 ?auto_71007 ) ) ( not ( = ?auto_71003 ?auto_71006 ) ) ( not ( = ?auto_71003 ?auto_71009 ) ) ( not ( = ?auto_71007 ?auto_71006 ) ) ( not ( = ?auto_71007 ?auto_71009 ) ) ( not ( = ?auto_71006 ?auto_71009 ) ) ( ON ?auto_71006 ?auto_71007 ) ( ON-TABLE ?auto_71004 ) ( not ( = ?auto_71004 ?auto_71008 ) ) ( not ( = ?auto_71004 ?auto_71005 ) ) ( not ( = ?auto_71004 ?auto_71009 ) ) ( not ( = ?auto_71008 ?auto_71005 ) ) ( not ( = ?auto_71008 ?auto_71009 ) ) ( not ( = ?auto_71005 ?auto_71009 ) ) ( not ( = ?auto_71003 ?auto_71005 ) ) ( not ( = ?auto_71003 ?auto_71004 ) ) ( not ( = ?auto_71003 ?auto_71008 ) ) ( not ( = ?auto_71007 ?auto_71005 ) ) ( not ( = ?auto_71007 ?auto_71004 ) ) ( not ( = ?auto_71007 ?auto_71008 ) ) ( not ( = ?auto_71006 ?auto_71005 ) ) ( not ( = ?auto_71006 ?auto_71004 ) ) ( not ( = ?auto_71006 ?auto_71008 ) ) ( ON ?auto_71009 ?auto_71006 ) ( ON ?auto_71005 ?auto_71009 ) ( CLEAR ?auto_71004 ) ( ON ?auto_71008 ?auto_71005 ) ( CLEAR ?auto_71008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71003 ?auto_71007 ?auto_71006 ?auto_71009 ?auto_71005 )
      ( MAKE-1PILE ?auto_71003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71010 - BLOCK
    )
    :vars
    (
      ?auto_71014 - BLOCK
      ?auto_71016 - BLOCK
      ?auto_71013 - BLOCK
      ?auto_71011 - BLOCK
      ?auto_71015 - BLOCK
      ?auto_71012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71014 ?auto_71010 ) ( ON-TABLE ?auto_71010 ) ( not ( = ?auto_71010 ?auto_71014 ) ) ( not ( = ?auto_71010 ?auto_71016 ) ) ( not ( = ?auto_71010 ?auto_71013 ) ) ( not ( = ?auto_71014 ?auto_71016 ) ) ( not ( = ?auto_71014 ?auto_71013 ) ) ( not ( = ?auto_71016 ?auto_71013 ) ) ( ON ?auto_71016 ?auto_71014 ) ( not ( = ?auto_71011 ?auto_71015 ) ) ( not ( = ?auto_71011 ?auto_71012 ) ) ( not ( = ?auto_71011 ?auto_71013 ) ) ( not ( = ?auto_71015 ?auto_71012 ) ) ( not ( = ?auto_71015 ?auto_71013 ) ) ( not ( = ?auto_71012 ?auto_71013 ) ) ( not ( = ?auto_71010 ?auto_71012 ) ) ( not ( = ?auto_71010 ?auto_71011 ) ) ( not ( = ?auto_71010 ?auto_71015 ) ) ( not ( = ?auto_71014 ?auto_71012 ) ) ( not ( = ?auto_71014 ?auto_71011 ) ) ( not ( = ?auto_71014 ?auto_71015 ) ) ( not ( = ?auto_71016 ?auto_71012 ) ) ( not ( = ?auto_71016 ?auto_71011 ) ) ( not ( = ?auto_71016 ?auto_71015 ) ) ( ON ?auto_71013 ?auto_71016 ) ( ON ?auto_71012 ?auto_71013 ) ( ON ?auto_71015 ?auto_71012 ) ( CLEAR ?auto_71015 ) ( HOLDING ?auto_71011 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71011 )
      ( MAKE-1PILE ?auto_71010 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71025 - BLOCK
    )
    :vars
    (
      ?auto_71026 - BLOCK
      ?auto_71028 - BLOCK
      ?auto_71031 - BLOCK
      ?auto_71029 - BLOCK
      ?auto_71030 - BLOCK
      ?auto_71027 - BLOCK
      ?auto_71032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71026 ?auto_71025 ) ( ON-TABLE ?auto_71025 ) ( not ( = ?auto_71025 ?auto_71026 ) ) ( not ( = ?auto_71025 ?auto_71028 ) ) ( not ( = ?auto_71025 ?auto_71031 ) ) ( not ( = ?auto_71026 ?auto_71028 ) ) ( not ( = ?auto_71026 ?auto_71031 ) ) ( not ( = ?auto_71028 ?auto_71031 ) ) ( ON ?auto_71028 ?auto_71026 ) ( not ( = ?auto_71029 ?auto_71030 ) ) ( not ( = ?auto_71029 ?auto_71027 ) ) ( not ( = ?auto_71029 ?auto_71031 ) ) ( not ( = ?auto_71030 ?auto_71027 ) ) ( not ( = ?auto_71030 ?auto_71031 ) ) ( not ( = ?auto_71027 ?auto_71031 ) ) ( not ( = ?auto_71025 ?auto_71027 ) ) ( not ( = ?auto_71025 ?auto_71029 ) ) ( not ( = ?auto_71025 ?auto_71030 ) ) ( not ( = ?auto_71026 ?auto_71027 ) ) ( not ( = ?auto_71026 ?auto_71029 ) ) ( not ( = ?auto_71026 ?auto_71030 ) ) ( not ( = ?auto_71028 ?auto_71027 ) ) ( not ( = ?auto_71028 ?auto_71029 ) ) ( not ( = ?auto_71028 ?auto_71030 ) ) ( ON ?auto_71031 ?auto_71028 ) ( ON ?auto_71027 ?auto_71031 ) ( ON ?auto_71030 ?auto_71027 ) ( CLEAR ?auto_71030 ) ( ON ?auto_71029 ?auto_71032 ) ( CLEAR ?auto_71029 ) ( HAND-EMPTY ) ( not ( = ?auto_71025 ?auto_71032 ) ) ( not ( = ?auto_71026 ?auto_71032 ) ) ( not ( = ?auto_71028 ?auto_71032 ) ) ( not ( = ?auto_71031 ?auto_71032 ) ) ( not ( = ?auto_71029 ?auto_71032 ) ) ( not ( = ?auto_71030 ?auto_71032 ) ) ( not ( = ?auto_71027 ?auto_71032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71029 ?auto_71032 )
      ( MAKE-1PILE ?auto_71025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71033 - BLOCK
    )
    :vars
    (
      ?auto_71035 - BLOCK
      ?auto_71039 - BLOCK
      ?auto_71037 - BLOCK
      ?auto_71036 - BLOCK
      ?auto_71040 - BLOCK
      ?auto_71034 - BLOCK
      ?auto_71038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71035 ?auto_71033 ) ( ON-TABLE ?auto_71033 ) ( not ( = ?auto_71033 ?auto_71035 ) ) ( not ( = ?auto_71033 ?auto_71039 ) ) ( not ( = ?auto_71033 ?auto_71037 ) ) ( not ( = ?auto_71035 ?auto_71039 ) ) ( not ( = ?auto_71035 ?auto_71037 ) ) ( not ( = ?auto_71039 ?auto_71037 ) ) ( ON ?auto_71039 ?auto_71035 ) ( not ( = ?auto_71036 ?auto_71040 ) ) ( not ( = ?auto_71036 ?auto_71034 ) ) ( not ( = ?auto_71036 ?auto_71037 ) ) ( not ( = ?auto_71040 ?auto_71034 ) ) ( not ( = ?auto_71040 ?auto_71037 ) ) ( not ( = ?auto_71034 ?auto_71037 ) ) ( not ( = ?auto_71033 ?auto_71034 ) ) ( not ( = ?auto_71033 ?auto_71036 ) ) ( not ( = ?auto_71033 ?auto_71040 ) ) ( not ( = ?auto_71035 ?auto_71034 ) ) ( not ( = ?auto_71035 ?auto_71036 ) ) ( not ( = ?auto_71035 ?auto_71040 ) ) ( not ( = ?auto_71039 ?auto_71034 ) ) ( not ( = ?auto_71039 ?auto_71036 ) ) ( not ( = ?auto_71039 ?auto_71040 ) ) ( ON ?auto_71037 ?auto_71039 ) ( ON ?auto_71034 ?auto_71037 ) ( ON ?auto_71036 ?auto_71038 ) ( CLEAR ?auto_71036 ) ( not ( = ?auto_71033 ?auto_71038 ) ) ( not ( = ?auto_71035 ?auto_71038 ) ) ( not ( = ?auto_71039 ?auto_71038 ) ) ( not ( = ?auto_71037 ?auto_71038 ) ) ( not ( = ?auto_71036 ?auto_71038 ) ) ( not ( = ?auto_71040 ?auto_71038 ) ) ( not ( = ?auto_71034 ?auto_71038 ) ) ( HOLDING ?auto_71040 ) ( CLEAR ?auto_71034 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71033 ?auto_71035 ?auto_71039 ?auto_71037 ?auto_71034 ?auto_71040 )
      ( MAKE-1PILE ?auto_71033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71041 - BLOCK
    )
    :vars
    (
      ?auto_71047 - BLOCK
      ?auto_71045 - BLOCK
      ?auto_71044 - BLOCK
      ?auto_71042 - BLOCK
      ?auto_71048 - BLOCK
      ?auto_71046 - BLOCK
      ?auto_71043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71047 ?auto_71041 ) ( ON-TABLE ?auto_71041 ) ( not ( = ?auto_71041 ?auto_71047 ) ) ( not ( = ?auto_71041 ?auto_71045 ) ) ( not ( = ?auto_71041 ?auto_71044 ) ) ( not ( = ?auto_71047 ?auto_71045 ) ) ( not ( = ?auto_71047 ?auto_71044 ) ) ( not ( = ?auto_71045 ?auto_71044 ) ) ( ON ?auto_71045 ?auto_71047 ) ( not ( = ?auto_71042 ?auto_71048 ) ) ( not ( = ?auto_71042 ?auto_71046 ) ) ( not ( = ?auto_71042 ?auto_71044 ) ) ( not ( = ?auto_71048 ?auto_71046 ) ) ( not ( = ?auto_71048 ?auto_71044 ) ) ( not ( = ?auto_71046 ?auto_71044 ) ) ( not ( = ?auto_71041 ?auto_71046 ) ) ( not ( = ?auto_71041 ?auto_71042 ) ) ( not ( = ?auto_71041 ?auto_71048 ) ) ( not ( = ?auto_71047 ?auto_71046 ) ) ( not ( = ?auto_71047 ?auto_71042 ) ) ( not ( = ?auto_71047 ?auto_71048 ) ) ( not ( = ?auto_71045 ?auto_71046 ) ) ( not ( = ?auto_71045 ?auto_71042 ) ) ( not ( = ?auto_71045 ?auto_71048 ) ) ( ON ?auto_71044 ?auto_71045 ) ( ON ?auto_71046 ?auto_71044 ) ( ON ?auto_71042 ?auto_71043 ) ( not ( = ?auto_71041 ?auto_71043 ) ) ( not ( = ?auto_71047 ?auto_71043 ) ) ( not ( = ?auto_71045 ?auto_71043 ) ) ( not ( = ?auto_71044 ?auto_71043 ) ) ( not ( = ?auto_71042 ?auto_71043 ) ) ( not ( = ?auto_71048 ?auto_71043 ) ) ( not ( = ?auto_71046 ?auto_71043 ) ) ( CLEAR ?auto_71046 ) ( ON ?auto_71048 ?auto_71042 ) ( CLEAR ?auto_71048 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71043 ?auto_71042 )
      ( MAKE-1PILE ?auto_71041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71049 - BLOCK
    )
    :vars
    (
      ?auto_71055 - BLOCK
      ?auto_71053 - BLOCK
      ?auto_71050 - BLOCK
      ?auto_71056 - BLOCK
      ?auto_71054 - BLOCK
      ?auto_71051 - BLOCK
      ?auto_71052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71055 ?auto_71049 ) ( ON-TABLE ?auto_71049 ) ( not ( = ?auto_71049 ?auto_71055 ) ) ( not ( = ?auto_71049 ?auto_71053 ) ) ( not ( = ?auto_71049 ?auto_71050 ) ) ( not ( = ?auto_71055 ?auto_71053 ) ) ( not ( = ?auto_71055 ?auto_71050 ) ) ( not ( = ?auto_71053 ?auto_71050 ) ) ( ON ?auto_71053 ?auto_71055 ) ( not ( = ?auto_71056 ?auto_71054 ) ) ( not ( = ?auto_71056 ?auto_71051 ) ) ( not ( = ?auto_71056 ?auto_71050 ) ) ( not ( = ?auto_71054 ?auto_71051 ) ) ( not ( = ?auto_71054 ?auto_71050 ) ) ( not ( = ?auto_71051 ?auto_71050 ) ) ( not ( = ?auto_71049 ?auto_71051 ) ) ( not ( = ?auto_71049 ?auto_71056 ) ) ( not ( = ?auto_71049 ?auto_71054 ) ) ( not ( = ?auto_71055 ?auto_71051 ) ) ( not ( = ?auto_71055 ?auto_71056 ) ) ( not ( = ?auto_71055 ?auto_71054 ) ) ( not ( = ?auto_71053 ?auto_71051 ) ) ( not ( = ?auto_71053 ?auto_71056 ) ) ( not ( = ?auto_71053 ?auto_71054 ) ) ( ON ?auto_71050 ?auto_71053 ) ( ON ?auto_71056 ?auto_71052 ) ( not ( = ?auto_71049 ?auto_71052 ) ) ( not ( = ?auto_71055 ?auto_71052 ) ) ( not ( = ?auto_71053 ?auto_71052 ) ) ( not ( = ?auto_71050 ?auto_71052 ) ) ( not ( = ?auto_71056 ?auto_71052 ) ) ( not ( = ?auto_71054 ?auto_71052 ) ) ( not ( = ?auto_71051 ?auto_71052 ) ) ( ON ?auto_71054 ?auto_71056 ) ( CLEAR ?auto_71054 ) ( ON-TABLE ?auto_71052 ) ( HOLDING ?auto_71051 ) ( CLEAR ?auto_71050 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71049 ?auto_71055 ?auto_71053 ?auto_71050 ?auto_71051 )
      ( MAKE-1PILE ?auto_71049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71095 - BLOCK
      ?auto_71096 - BLOCK
      ?auto_71097 - BLOCK
      ?auto_71098 - BLOCK
      ?auto_71099 - BLOCK
      ?auto_71100 - BLOCK
    )
    :vars
    (
      ?auto_71101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71095 ) ( ON ?auto_71096 ?auto_71095 ) ( ON ?auto_71097 ?auto_71096 ) ( ON ?auto_71098 ?auto_71097 ) ( not ( = ?auto_71095 ?auto_71096 ) ) ( not ( = ?auto_71095 ?auto_71097 ) ) ( not ( = ?auto_71095 ?auto_71098 ) ) ( not ( = ?auto_71095 ?auto_71099 ) ) ( not ( = ?auto_71095 ?auto_71100 ) ) ( not ( = ?auto_71096 ?auto_71097 ) ) ( not ( = ?auto_71096 ?auto_71098 ) ) ( not ( = ?auto_71096 ?auto_71099 ) ) ( not ( = ?auto_71096 ?auto_71100 ) ) ( not ( = ?auto_71097 ?auto_71098 ) ) ( not ( = ?auto_71097 ?auto_71099 ) ) ( not ( = ?auto_71097 ?auto_71100 ) ) ( not ( = ?auto_71098 ?auto_71099 ) ) ( not ( = ?auto_71098 ?auto_71100 ) ) ( not ( = ?auto_71099 ?auto_71100 ) ) ( ON ?auto_71100 ?auto_71101 ) ( not ( = ?auto_71095 ?auto_71101 ) ) ( not ( = ?auto_71096 ?auto_71101 ) ) ( not ( = ?auto_71097 ?auto_71101 ) ) ( not ( = ?auto_71098 ?auto_71101 ) ) ( not ( = ?auto_71099 ?auto_71101 ) ) ( not ( = ?auto_71100 ?auto_71101 ) ) ( CLEAR ?auto_71098 ) ( ON ?auto_71099 ?auto_71100 ) ( CLEAR ?auto_71099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71101 ?auto_71100 )
      ( MAKE-6PILE ?auto_71095 ?auto_71096 ?auto_71097 ?auto_71098 ?auto_71099 ?auto_71100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71102 - BLOCK
      ?auto_71103 - BLOCK
      ?auto_71104 - BLOCK
      ?auto_71105 - BLOCK
      ?auto_71106 - BLOCK
      ?auto_71107 - BLOCK
    )
    :vars
    (
      ?auto_71108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71102 ) ( ON ?auto_71103 ?auto_71102 ) ( ON ?auto_71104 ?auto_71103 ) ( not ( = ?auto_71102 ?auto_71103 ) ) ( not ( = ?auto_71102 ?auto_71104 ) ) ( not ( = ?auto_71102 ?auto_71105 ) ) ( not ( = ?auto_71102 ?auto_71106 ) ) ( not ( = ?auto_71102 ?auto_71107 ) ) ( not ( = ?auto_71103 ?auto_71104 ) ) ( not ( = ?auto_71103 ?auto_71105 ) ) ( not ( = ?auto_71103 ?auto_71106 ) ) ( not ( = ?auto_71103 ?auto_71107 ) ) ( not ( = ?auto_71104 ?auto_71105 ) ) ( not ( = ?auto_71104 ?auto_71106 ) ) ( not ( = ?auto_71104 ?auto_71107 ) ) ( not ( = ?auto_71105 ?auto_71106 ) ) ( not ( = ?auto_71105 ?auto_71107 ) ) ( not ( = ?auto_71106 ?auto_71107 ) ) ( ON ?auto_71107 ?auto_71108 ) ( not ( = ?auto_71102 ?auto_71108 ) ) ( not ( = ?auto_71103 ?auto_71108 ) ) ( not ( = ?auto_71104 ?auto_71108 ) ) ( not ( = ?auto_71105 ?auto_71108 ) ) ( not ( = ?auto_71106 ?auto_71108 ) ) ( not ( = ?auto_71107 ?auto_71108 ) ) ( ON ?auto_71106 ?auto_71107 ) ( CLEAR ?auto_71106 ) ( ON-TABLE ?auto_71108 ) ( HOLDING ?auto_71105 ) ( CLEAR ?auto_71104 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71102 ?auto_71103 ?auto_71104 ?auto_71105 )
      ( MAKE-6PILE ?auto_71102 ?auto_71103 ?auto_71104 ?auto_71105 ?auto_71106 ?auto_71107 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71109 - BLOCK
      ?auto_71110 - BLOCK
      ?auto_71111 - BLOCK
      ?auto_71112 - BLOCK
      ?auto_71113 - BLOCK
      ?auto_71114 - BLOCK
    )
    :vars
    (
      ?auto_71115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71109 ) ( ON ?auto_71110 ?auto_71109 ) ( ON ?auto_71111 ?auto_71110 ) ( not ( = ?auto_71109 ?auto_71110 ) ) ( not ( = ?auto_71109 ?auto_71111 ) ) ( not ( = ?auto_71109 ?auto_71112 ) ) ( not ( = ?auto_71109 ?auto_71113 ) ) ( not ( = ?auto_71109 ?auto_71114 ) ) ( not ( = ?auto_71110 ?auto_71111 ) ) ( not ( = ?auto_71110 ?auto_71112 ) ) ( not ( = ?auto_71110 ?auto_71113 ) ) ( not ( = ?auto_71110 ?auto_71114 ) ) ( not ( = ?auto_71111 ?auto_71112 ) ) ( not ( = ?auto_71111 ?auto_71113 ) ) ( not ( = ?auto_71111 ?auto_71114 ) ) ( not ( = ?auto_71112 ?auto_71113 ) ) ( not ( = ?auto_71112 ?auto_71114 ) ) ( not ( = ?auto_71113 ?auto_71114 ) ) ( ON ?auto_71114 ?auto_71115 ) ( not ( = ?auto_71109 ?auto_71115 ) ) ( not ( = ?auto_71110 ?auto_71115 ) ) ( not ( = ?auto_71111 ?auto_71115 ) ) ( not ( = ?auto_71112 ?auto_71115 ) ) ( not ( = ?auto_71113 ?auto_71115 ) ) ( not ( = ?auto_71114 ?auto_71115 ) ) ( ON ?auto_71113 ?auto_71114 ) ( ON-TABLE ?auto_71115 ) ( CLEAR ?auto_71111 ) ( ON ?auto_71112 ?auto_71113 ) ( CLEAR ?auto_71112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71115 ?auto_71114 ?auto_71113 )
      ( MAKE-6PILE ?auto_71109 ?auto_71110 ?auto_71111 ?auto_71112 ?auto_71113 ?auto_71114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71116 - BLOCK
      ?auto_71117 - BLOCK
      ?auto_71118 - BLOCK
      ?auto_71119 - BLOCK
      ?auto_71120 - BLOCK
      ?auto_71121 - BLOCK
    )
    :vars
    (
      ?auto_71122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71116 ) ( ON ?auto_71117 ?auto_71116 ) ( not ( = ?auto_71116 ?auto_71117 ) ) ( not ( = ?auto_71116 ?auto_71118 ) ) ( not ( = ?auto_71116 ?auto_71119 ) ) ( not ( = ?auto_71116 ?auto_71120 ) ) ( not ( = ?auto_71116 ?auto_71121 ) ) ( not ( = ?auto_71117 ?auto_71118 ) ) ( not ( = ?auto_71117 ?auto_71119 ) ) ( not ( = ?auto_71117 ?auto_71120 ) ) ( not ( = ?auto_71117 ?auto_71121 ) ) ( not ( = ?auto_71118 ?auto_71119 ) ) ( not ( = ?auto_71118 ?auto_71120 ) ) ( not ( = ?auto_71118 ?auto_71121 ) ) ( not ( = ?auto_71119 ?auto_71120 ) ) ( not ( = ?auto_71119 ?auto_71121 ) ) ( not ( = ?auto_71120 ?auto_71121 ) ) ( ON ?auto_71121 ?auto_71122 ) ( not ( = ?auto_71116 ?auto_71122 ) ) ( not ( = ?auto_71117 ?auto_71122 ) ) ( not ( = ?auto_71118 ?auto_71122 ) ) ( not ( = ?auto_71119 ?auto_71122 ) ) ( not ( = ?auto_71120 ?auto_71122 ) ) ( not ( = ?auto_71121 ?auto_71122 ) ) ( ON ?auto_71120 ?auto_71121 ) ( ON-TABLE ?auto_71122 ) ( ON ?auto_71119 ?auto_71120 ) ( CLEAR ?auto_71119 ) ( HOLDING ?auto_71118 ) ( CLEAR ?auto_71117 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71116 ?auto_71117 ?auto_71118 )
      ( MAKE-6PILE ?auto_71116 ?auto_71117 ?auto_71118 ?auto_71119 ?auto_71120 ?auto_71121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71123 - BLOCK
      ?auto_71124 - BLOCK
      ?auto_71125 - BLOCK
      ?auto_71126 - BLOCK
      ?auto_71127 - BLOCK
      ?auto_71128 - BLOCK
    )
    :vars
    (
      ?auto_71129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71123 ) ( ON ?auto_71124 ?auto_71123 ) ( not ( = ?auto_71123 ?auto_71124 ) ) ( not ( = ?auto_71123 ?auto_71125 ) ) ( not ( = ?auto_71123 ?auto_71126 ) ) ( not ( = ?auto_71123 ?auto_71127 ) ) ( not ( = ?auto_71123 ?auto_71128 ) ) ( not ( = ?auto_71124 ?auto_71125 ) ) ( not ( = ?auto_71124 ?auto_71126 ) ) ( not ( = ?auto_71124 ?auto_71127 ) ) ( not ( = ?auto_71124 ?auto_71128 ) ) ( not ( = ?auto_71125 ?auto_71126 ) ) ( not ( = ?auto_71125 ?auto_71127 ) ) ( not ( = ?auto_71125 ?auto_71128 ) ) ( not ( = ?auto_71126 ?auto_71127 ) ) ( not ( = ?auto_71126 ?auto_71128 ) ) ( not ( = ?auto_71127 ?auto_71128 ) ) ( ON ?auto_71128 ?auto_71129 ) ( not ( = ?auto_71123 ?auto_71129 ) ) ( not ( = ?auto_71124 ?auto_71129 ) ) ( not ( = ?auto_71125 ?auto_71129 ) ) ( not ( = ?auto_71126 ?auto_71129 ) ) ( not ( = ?auto_71127 ?auto_71129 ) ) ( not ( = ?auto_71128 ?auto_71129 ) ) ( ON ?auto_71127 ?auto_71128 ) ( ON-TABLE ?auto_71129 ) ( ON ?auto_71126 ?auto_71127 ) ( CLEAR ?auto_71124 ) ( ON ?auto_71125 ?auto_71126 ) ( CLEAR ?auto_71125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71129 ?auto_71128 ?auto_71127 ?auto_71126 )
      ( MAKE-6PILE ?auto_71123 ?auto_71124 ?auto_71125 ?auto_71126 ?auto_71127 ?auto_71128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71130 - BLOCK
      ?auto_71131 - BLOCK
      ?auto_71132 - BLOCK
      ?auto_71133 - BLOCK
      ?auto_71134 - BLOCK
      ?auto_71135 - BLOCK
    )
    :vars
    (
      ?auto_71136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71130 ) ( not ( = ?auto_71130 ?auto_71131 ) ) ( not ( = ?auto_71130 ?auto_71132 ) ) ( not ( = ?auto_71130 ?auto_71133 ) ) ( not ( = ?auto_71130 ?auto_71134 ) ) ( not ( = ?auto_71130 ?auto_71135 ) ) ( not ( = ?auto_71131 ?auto_71132 ) ) ( not ( = ?auto_71131 ?auto_71133 ) ) ( not ( = ?auto_71131 ?auto_71134 ) ) ( not ( = ?auto_71131 ?auto_71135 ) ) ( not ( = ?auto_71132 ?auto_71133 ) ) ( not ( = ?auto_71132 ?auto_71134 ) ) ( not ( = ?auto_71132 ?auto_71135 ) ) ( not ( = ?auto_71133 ?auto_71134 ) ) ( not ( = ?auto_71133 ?auto_71135 ) ) ( not ( = ?auto_71134 ?auto_71135 ) ) ( ON ?auto_71135 ?auto_71136 ) ( not ( = ?auto_71130 ?auto_71136 ) ) ( not ( = ?auto_71131 ?auto_71136 ) ) ( not ( = ?auto_71132 ?auto_71136 ) ) ( not ( = ?auto_71133 ?auto_71136 ) ) ( not ( = ?auto_71134 ?auto_71136 ) ) ( not ( = ?auto_71135 ?auto_71136 ) ) ( ON ?auto_71134 ?auto_71135 ) ( ON-TABLE ?auto_71136 ) ( ON ?auto_71133 ?auto_71134 ) ( ON ?auto_71132 ?auto_71133 ) ( CLEAR ?auto_71132 ) ( HOLDING ?auto_71131 ) ( CLEAR ?auto_71130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71130 ?auto_71131 )
      ( MAKE-6PILE ?auto_71130 ?auto_71131 ?auto_71132 ?auto_71133 ?auto_71134 ?auto_71135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71137 - BLOCK
      ?auto_71138 - BLOCK
      ?auto_71139 - BLOCK
      ?auto_71140 - BLOCK
      ?auto_71141 - BLOCK
      ?auto_71142 - BLOCK
    )
    :vars
    (
      ?auto_71143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71137 ) ( not ( = ?auto_71137 ?auto_71138 ) ) ( not ( = ?auto_71137 ?auto_71139 ) ) ( not ( = ?auto_71137 ?auto_71140 ) ) ( not ( = ?auto_71137 ?auto_71141 ) ) ( not ( = ?auto_71137 ?auto_71142 ) ) ( not ( = ?auto_71138 ?auto_71139 ) ) ( not ( = ?auto_71138 ?auto_71140 ) ) ( not ( = ?auto_71138 ?auto_71141 ) ) ( not ( = ?auto_71138 ?auto_71142 ) ) ( not ( = ?auto_71139 ?auto_71140 ) ) ( not ( = ?auto_71139 ?auto_71141 ) ) ( not ( = ?auto_71139 ?auto_71142 ) ) ( not ( = ?auto_71140 ?auto_71141 ) ) ( not ( = ?auto_71140 ?auto_71142 ) ) ( not ( = ?auto_71141 ?auto_71142 ) ) ( ON ?auto_71142 ?auto_71143 ) ( not ( = ?auto_71137 ?auto_71143 ) ) ( not ( = ?auto_71138 ?auto_71143 ) ) ( not ( = ?auto_71139 ?auto_71143 ) ) ( not ( = ?auto_71140 ?auto_71143 ) ) ( not ( = ?auto_71141 ?auto_71143 ) ) ( not ( = ?auto_71142 ?auto_71143 ) ) ( ON ?auto_71141 ?auto_71142 ) ( ON-TABLE ?auto_71143 ) ( ON ?auto_71140 ?auto_71141 ) ( ON ?auto_71139 ?auto_71140 ) ( CLEAR ?auto_71137 ) ( ON ?auto_71138 ?auto_71139 ) ( CLEAR ?auto_71138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71143 ?auto_71142 ?auto_71141 ?auto_71140 ?auto_71139 )
      ( MAKE-6PILE ?auto_71137 ?auto_71138 ?auto_71139 ?auto_71140 ?auto_71141 ?auto_71142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71144 - BLOCK
      ?auto_71145 - BLOCK
      ?auto_71146 - BLOCK
      ?auto_71147 - BLOCK
      ?auto_71148 - BLOCK
      ?auto_71149 - BLOCK
    )
    :vars
    (
      ?auto_71150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71144 ?auto_71145 ) ) ( not ( = ?auto_71144 ?auto_71146 ) ) ( not ( = ?auto_71144 ?auto_71147 ) ) ( not ( = ?auto_71144 ?auto_71148 ) ) ( not ( = ?auto_71144 ?auto_71149 ) ) ( not ( = ?auto_71145 ?auto_71146 ) ) ( not ( = ?auto_71145 ?auto_71147 ) ) ( not ( = ?auto_71145 ?auto_71148 ) ) ( not ( = ?auto_71145 ?auto_71149 ) ) ( not ( = ?auto_71146 ?auto_71147 ) ) ( not ( = ?auto_71146 ?auto_71148 ) ) ( not ( = ?auto_71146 ?auto_71149 ) ) ( not ( = ?auto_71147 ?auto_71148 ) ) ( not ( = ?auto_71147 ?auto_71149 ) ) ( not ( = ?auto_71148 ?auto_71149 ) ) ( ON ?auto_71149 ?auto_71150 ) ( not ( = ?auto_71144 ?auto_71150 ) ) ( not ( = ?auto_71145 ?auto_71150 ) ) ( not ( = ?auto_71146 ?auto_71150 ) ) ( not ( = ?auto_71147 ?auto_71150 ) ) ( not ( = ?auto_71148 ?auto_71150 ) ) ( not ( = ?auto_71149 ?auto_71150 ) ) ( ON ?auto_71148 ?auto_71149 ) ( ON-TABLE ?auto_71150 ) ( ON ?auto_71147 ?auto_71148 ) ( ON ?auto_71146 ?auto_71147 ) ( ON ?auto_71145 ?auto_71146 ) ( CLEAR ?auto_71145 ) ( HOLDING ?auto_71144 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71144 )
      ( MAKE-6PILE ?auto_71144 ?auto_71145 ?auto_71146 ?auto_71147 ?auto_71148 ?auto_71149 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71151 - BLOCK
      ?auto_71152 - BLOCK
      ?auto_71153 - BLOCK
      ?auto_71154 - BLOCK
      ?auto_71155 - BLOCK
      ?auto_71156 - BLOCK
    )
    :vars
    (
      ?auto_71157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71151 ?auto_71152 ) ) ( not ( = ?auto_71151 ?auto_71153 ) ) ( not ( = ?auto_71151 ?auto_71154 ) ) ( not ( = ?auto_71151 ?auto_71155 ) ) ( not ( = ?auto_71151 ?auto_71156 ) ) ( not ( = ?auto_71152 ?auto_71153 ) ) ( not ( = ?auto_71152 ?auto_71154 ) ) ( not ( = ?auto_71152 ?auto_71155 ) ) ( not ( = ?auto_71152 ?auto_71156 ) ) ( not ( = ?auto_71153 ?auto_71154 ) ) ( not ( = ?auto_71153 ?auto_71155 ) ) ( not ( = ?auto_71153 ?auto_71156 ) ) ( not ( = ?auto_71154 ?auto_71155 ) ) ( not ( = ?auto_71154 ?auto_71156 ) ) ( not ( = ?auto_71155 ?auto_71156 ) ) ( ON ?auto_71156 ?auto_71157 ) ( not ( = ?auto_71151 ?auto_71157 ) ) ( not ( = ?auto_71152 ?auto_71157 ) ) ( not ( = ?auto_71153 ?auto_71157 ) ) ( not ( = ?auto_71154 ?auto_71157 ) ) ( not ( = ?auto_71155 ?auto_71157 ) ) ( not ( = ?auto_71156 ?auto_71157 ) ) ( ON ?auto_71155 ?auto_71156 ) ( ON-TABLE ?auto_71157 ) ( ON ?auto_71154 ?auto_71155 ) ( ON ?auto_71153 ?auto_71154 ) ( ON ?auto_71152 ?auto_71153 ) ( ON ?auto_71151 ?auto_71152 ) ( CLEAR ?auto_71151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71157 ?auto_71156 ?auto_71155 ?auto_71154 ?auto_71153 ?auto_71152 )
      ( MAKE-6PILE ?auto_71151 ?auto_71152 ?auto_71153 ?auto_71154 ?auto_71155 ?auto_71156 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71164 - BLOCK
      ?auto_71165 - BLOCK
      ?auto_71166 - BLOCK
      ?auto_71167 - BLOCK
      ?auto_71168 - BLOCK
      ?auto_71169 - BLOCK
    )
    :vars
    (
      ?auto_71170 - BLOCK
      ?auto_71171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71164 ?auto_71165 ) ) ( not ( = ?auto_71164 ?auto_71166 ) ) ( not ( = ?auto_71164 ?auto_71167 ) ) ( not ( = ?auto_71164 ?auto_71168 ) ) ( not ( = ?auto_71164 ?auto_71169 ) ) ( not ( = ?auto_71165 ?auto_71166 ) ) ( not ( = ?auto_71165 ?auto_71167 ) ) ( not ( = ?auto_71165 ?auto_71168 ) ) ( not ( = ?auto_71165 ?auto_71169 ) ) ( not ( = ?auto_71166 ?auto_71167 ) ) ( not ( = ?auto_71166 ?auto_71168 ) ) ( not ( = ?auto_71166 ?auto_71169 ) ) ( not ( = ?auto_71167 ?auto_71168 ) ) ( not ( = ?auto_71167 ?auto_71169 ) ) ( not ( = ?auto_71168 ?auto_71169 ) ) ( ON ?auto_71169 ?auto_71170 ) ( not ( = ?auto_71164 ?auto_71170 ) ) ( not ( = ?auto_71165 ?auto_71170 ) ) ( not ( = ?auto_71166 ?auto_71170 ) ) ( not ( = ?auto_71167 ?auto_71170 ) ) ( not ( = ?auto_71168 ?auto_71170 ) ) ( not ( = ?auto_71169 ?auto_71170 ) ) ( ON ?auto_71168 ?auto_71169 ) ( ON-TABLE ?auto_71170 ) ( ON ?auto_71167 ?auto_71168 ) ( ON ?auto_71166 ?auto_71167 ) ( ON ?auto_71165 ?auto_71166 ) ( CLEAR ?auto_71165 ) ( ON ?auto_71164 ?auto_71171 ) ( CLEAR ?auto_71164 ) ( HAND-EMPTY ) ( not ( = ?auto_71164 ?auto_71171 ) ) ( not ( = ?auto_71165 ?auto_71171 ) ) ( not ( = ?auto_71166 ?auto_71171 ) ) ( not ( = ?auto_71167 ?auto_71171 ) ) ( not ( = ?auto_71168 ?auto_71171 ) ) ( not ( = ?auto_71169 ?auto_71171 ) ) ( not ( = ?auto_71170 ?auto_71171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71164 ?auto_71171 )
      ( MAKE-6PILE ?auto_71164 ?auto_71165 ?auto_71166 ?auto_71167 ?auto_71168 ?auto_71169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71172 - BLOCK
      ?auto_71173 - BLOCK
      ?auto_71174 - BLOCK
      ?auto_71175 - BLOCK
      ?auto_71176 - BLOCK
      ?auto_71177 - BLOCK
    )
    :vars
    (
      ?auto_71179 - BLOCK
      ?auto_71178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71172 ?auto_71173 ) ) ( not ( = ?auto_71172 ?auto_71174 ) ) ( not ( = ?auto_71172 ?auto_71175 ) ) ( not ( = ?auto_71172 ?auto_71176 ) ) ( not ( = ?auto_71172 ?auto_71177 ) ) ( not ( = ?auto_71173 ?auto_71174 ) ) ( not ( = ?auto_71173 ?auto_71175 ) ) ( not ( = ?auto_71173 ?auto_71176 ) ) ( not ( = ?auto_71173 ?auto_71177 ) ) ( not ( = ?auto_71174 ?auto_71175 ) ) ( not ( = ?auto_71174 ?auto_71176 ) ) ( not ( = ?auto_71174 ?auto_71177 ) ) ( not ( = ?auto_71175 ?auto_71176 ) ) ( not ( = ?auto_71175 ?auto_71177 ) ) ( not ( = ?auto_71176 ?auto_71177 ) ) ( ON ?auto_71177 ?auto_71179 ) ( not ( = ?auto_71172 ?auto_71179 ) ) ( not ( = ?auto_71173 ?auto_71179 ) ) ( not ( = ?auto_71174 ?auto_71179 ) ) ( not ( = ?auto_71175 ?auto_71179 ) ) ( not ( = ?auto_71176 ?auto_71179 ) ) ( not ( = ?auto_71177 ?auto_71179 ) ) ( ON ?auto_71176 ?auto_71177 ) ( ON-TABLE ?auto_71179 ) ( ON ?auto_71175 ?auto_71176 ) ( ON ?auto_71174 ?auto_71175 ) ( ON ?auto_71172 ?auto_71178 ) ( CLEAR ?auto_71172 ) ( not ( = ?auto_71172 ?auto_71178 ) ) ( not ( = ?auto_71173 ?auto_71178 ) ) ( not ( = ?auto_71174 ?auto_71178 ) ) ( not ( = ?auto_71175 ?auto_71178 ) ) ( not ( = ?auto_71176 ?auto_71178 ) ) ( not ( = ?auto_71177 ?auto_71178 ) ) ( not ( = ?auto_71179 ?auto_71178 ) ) ( HOLDING ?auto_71173 ) ( CLEAR ?auto_71174 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71179 ?auto_71177 ?auto_71176 ?auto_71175 ?auto_71174 ?auto_71173 )
      ( MAKE-6PILE ?auto_71172 ?auto_71173 ?auto_71174 ?auto_71175 ?auto_71176 ?auto_71177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71180 - BLOCK
      ?auto_71181 - BLOCK
      ?auto_71182 - BLOCK
      ?auto_71183 - BLOCK
      ?auto_71184 - BLOCK
      ?auto_71185 - BLOCK
    )
    :vars
    (
      ?auto_71187 - BLOCK
      ?auto_71186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71180 ?auto_71181 ) ) ( not ( = ?auto_71180 ?auto_71182 ) ) ( not ( = ?auto_71180 ?auto_71183 ) ) ( not ( = ?auto_71180 ?auto_71184 ) ) ( not ( = ?auto_71180 ?auto_71185 ) ) ( not ( = ?auto_71181 ?auto_71182 ) ) ( not ( = ?auto_71181 ?auto_71183 ) ) ( not ( = ?auto_71181 ?auto_71184 ) ) ( not ( = ?auto_71181 ?auto_71185 ) ) ( not ( = ?auto_71182 ?auto_71183 ) ) ( not ( = ?auto_71182 ?auto_71184 ) ) ( not ( = ?auto_71182 ?auto_71185 ) ) ( not ( = ?auto_71183 ?auto_71184 ) ) ( not ( = ?auto_71183 ?auto_71185 ) ) ( not ( = ?auto_71184 ?auto_71185 ) ) ( ON ?auto_71185 ?auto_71187 ) ( not ( = ?auto_71180 ?auto_71187 ) ) ( not ( = ?auto_71181 ?auto_71187 ) ) ( not ( = ?auto_71182 ?auto_71187 ) ) ( not ( = ?auto_71183 ?auto_71187 ) ) ( not ( = ?auto_71184 ?auto_71187 ) ) ( not ( = ?auto_71185 ?auto_71187 ) ) ( ON ?auto_71184 ?auto_71185 ) ( ON-TABLE ?auto_71187 ) ( ON ?auto_71183 ?auto_71184 ) ( ON ?auto_71182 ?auto_71183 ) ( ON ?auto_71180 ?auto_71186 ) ( not ( = ?auto_71180 ?auto_71186 ) ) ( not ( = ?auto_71181 ?auto_71186 ) ) ( not ( = ?auto_71182 ?auto_71186 ) ) ( not ( = ?auto_71183 ?auto_71186 ) ) ( not ( = ?auto_71184 ?auto_71186 ) ) ( not ( = ?auto_71185 ?auto_71186 ) ) ( not ( = ?auto_71187 ?auto_71186 ) ) ( CLEAR ?auto_71182 ) ( ON ?auto_71181 ?auto_71180 ) ( CLEAR ?auto_71181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71186 ?auto_71180 )
      ( MAKE-6PILE ?auto_71180 ?auto_71181 ?auto_71182 ?auto_71183 ?auto_71184 ?auto_71185 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71188 - BLOCK
      ?auto_71189 - BLOCK
      ?auto_71190 - BLOCK
      ?auto_71191 - BLOCK
      ?auto_71192 - BLOCK
      ?auto_71193 - BLOCK
    )
    :vars
    (
      ?auto_71194 - BLOCK
      ?auto_71195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71188 ?auto_71189 ) ) ( not ( = ?auto_71188 ?auto_71190 ) ) ( not ( = ?auto_71188 ?auto_71191 ) ) ( not ( = ?auto_71188 ?auto_71192 ) ) ( not ( = ?auto_71188 ?auto_71193 ) ) ( not ( = ?auto_71189 ?auto_71190 ) ) ( not ( = ?auto_71189 ?auto_71191 ) ) ( not ( = ?auto_71189 ?auto_71192 ) ) ( not ( = ?auto_71189 ?auto_71193 ) ) ( not ( = ?auto_71190 ?auto_71191 ) ) ( not ( = ?auto_71190 ?auto_71192 ) ) ( not ( = ?auto_71190 ?auto_71193 ) ) ( not ( = ?auto_71191 ?auto_71192 ) ) ( not ( = ?auto_71191 ?auto_71193 ) ) ( not ( = ?auto_71192 ?auto_71193 ) ) ( ON ?auto_71193 ?auto_71194 ) ( not ( = ?auto_71188 ?auto_71194 ) ) ( not ( = ?auto_71189 ?auto_71194 ) ) ( not ( = ?auto_71190 ?auto_71194 ) ) ( not ( = ?auto_71191 ?auto_71194 ) ) ( not ( = ?auto_71192 ?auto_71194 ) ) ( not ( = ?auto_71193 ?auto_71194 ) ) ( ON ?auto_71192 ?auto_71193 ) ( ON-TABLE ?auto_71194 ) ( ON ?auto_71191 ?auto_71192 ) ( ON ?auto_71188 ?auto_71195 ) ( not ( = ?auto_71188 ?auto_71195 ) ) ( not ( = ?auto_71189 ?auto_71195 ) ) ( not ( = ?auto_71190 ?auto_71195 ) ) ( not ( = ?auto_71191 ?auto_71195 ) ) ( not ( = ?auto_71192 ?auto_71195 ) ) ( not ( = ?auto_71193 ?auto_71195 ) ) ( not ( = ?auto_71194 ?auto_71195 ) ) ( ON ?auto_71189 ?auto_71188 ) ( CLEAR ?auto_71189 ) ( ON-TABLE ?auto_71195 ) ( HOLDING ?auto_71190 ) ( CLEAR ?auto_71191 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71194 ?auto_71193 ?auto_71192 ?auto_71191 ?auto_71190 )
      ( MAKE-6PILE ?auto_71188 ?auto_71189 ?auto_71190 ?auto_71191 ?auto_71192 ?auto_71193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71196 - BLOCK
      ?auto_71197 - BLOCK
      ?auto_71198 - BLOCK
      ?auto_71199 - BLOCK
      ?auto_71200 - BLOCK
      ?auto_71201 - BLOCK
    )
    :vars
    (
      ?auto_71203 - BLOCK
      ?auto_71202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71196 ?auto_71197 ) ) ( not ( = ?auto_71196 ?auto_71198 ) ) ( not ( = ?auto_71196 ?auto_71199 ) ) ( not ( = ?auto_71196 ?auto_71200 ) ) ( not ( = ?auto_71196 ?auto_71201 ) ) ( not ( = ?auto_71197 ?auto_71198 ) ) ( not ( = ?auto_71197 ?auto_71199 ) ) ( not ( = ?auto_71197 ?auto_71200 ) ) ( not ( = ?auto_71197 ?auto_71201 ) ) ( not ( = ?auto_71198 ?auto_71199 ) ) ( not ( = ?auto_71198 ?auto_71200 ) ) ( not ( = ?auto_71198 ?auto_71201 ) ) ( not ( = ?auto_71199 ?auto_71200 ) ) ( not ( = ?auto_71199 ?auto_71201 ) ) ( not ( = ?auto_71200 ?auto_71201 ) ) ( ON ?auto_71201 ?auto_71203 ) ( not ( = ?auto_71196 ?auto_71203 ) ) ( not ( = ?auto_71197 ?auto_71203 ) ) ( not ( = ?auto_71198 ?auto_71203 ) ) ( not ( = ?auto_71199 ?auto_71203 ) ) ( not ( = ?auto_71200 ?auto_71203 ) ) ( not ( = ?auto_71201 ?auto_71203 ) ) ( ON ?auto_71200 ?auto_71201 ) ( ON-TABLE ?auto_71203 ) ( ON ?auto_71199 ?auto_71200 ) ( ON ?auto_71196 ?auto_71202 ) ( not ( = ?auto_71196 ?auto_71202 ) ) ( not ( = ?auto_71197 ?auto_71202 ) ) ( not ( = ?auto_71198 ?auto_71202 ) ) ( not ( = ?auto_71199 ?auto_71202 ) ) ( not ( = ?auto_71200 ?auto_71202 ) ) ( not ( = ?auto_71201 ?auto_71202 ) ) ( not ( = ?auto_71203 ?auto_71202 ) ) ( ON ?auto_71197 ?auto_71196 ) ( ON-TABLE ?auto_71202 ) ( CLEAR ?auto_71199 ) ( ON ?auto_71198 ?auto_71197 ) ( CLEAR ?auto_71198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71202 ?auto_71196 ?auto_71197 )
      ( MAKE-6PILE ?auto_71196 ?auto_71197 ?auto_71198 ?auto_71199 ?auto_71200 ?auto_71201 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71204 - BLOCK
      ?auto_71205 - BLOCK
      ?auto_71206 - BLOCK
      ?auto_71207 - BLOCK
      ?auto_71208 - BLOCK
      ?auto_71209 - BLOCK
    )
    :vars
    (
      ?auto_71211 - BLOCK
      ?auto_71210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71204 ?auto_71205 ) ) ( not ( = ?auto_71204 ?auto_71206 ) ) ( not ( = ?auto_71204 ?auto_71207 ) ) ( not ( = ?auto_71204 ?auto_71208 ) ) ( not ( = ?auto_71204 ?auto_71209 ) ) ( not ( = ?auto_71205 ?auto_71206 ) ) ( not ( = ?auto_71205 ?auto_71207 ) ) ( not ( = ?auto_71205 ?auto_71208 ) ) ( not ( = ?auto_71205 ?auto_71209 ) ) ( not ( = ?auto_71206 ?auto_71207 ) ) ( not ( = ?auto_71206 ?auto_71208 ) ) ( not ( = ?auto_71206 ?auto_71209 ) ) ( not ( = ?auto_71207 ?auto_71208 ) ) ( not ( = ?auto_71207 ?auto_71209 ) ) ( not ( = ?auto_71208 ?auto_71209 ) ) ( ON ?auto_71209 ?auto_71211 ) ( not ( = ?auto_71204 ?auto_71211 ) ) ( not ( = ?auto_71205 ?auto_71211 ) ) ( not ( = ?auto_71206 ?auto_71211 ) ) ( not ( = ?auto_71207 ?auto_71211 ) ) ( not ( = ?auto_71208 ?auto_71211 ) ) ( not ( = ?auto_71209 ?auto_71211 ) ) ( ON ?auto_71208 ?auto_71209 ) ( ON-TABLE ?auto_71211 ) ( ON ?auto_71204 ?auto_71210 ) ( not ( = ?auto_71204 ?auto_71210 ) ) ( not ( = ?auto_71205 ?auto_71210 ) ) ( not ( = ?auto_71206 ?auto_71210 ) ) ( not ( = ?auto_71207 ?auto_71210 ) ) ( not ( = ?auto_71208 ?auto_71210 ) ) ( not ( = ?auto_71209 ?auto_71210 ) ) ( not ( = ?auto_71211 ?auto_71210 ) ) ( ON ?auto_71205 ?auto_71204 ) ( ON-TABLE ?auto_71210 ) ( ON ?auto_71206 ?auto_71205 ) ( CLEAR ?auto_71206 ) ( HOLDING ?auto_71207 ) ( CLEAR ?auto_71208 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71211 ?auto_71209 ?auto_71208 ?auto_71207 )
      ( MAKE-6PILE ?auto_71204 ?auto_71205 ?auto_71206 ?auto_71207 ?auto_71208 ?auto_71209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71212 - BLOCK
      ?auto_71213 - BLOCK
      ?auto_71214 - BLOCK
      ?auto_71215 - BLOCK
      ?auto_71216 - BLOCK
      ?auto_71217 - BLOCK
    )
    :vars
    (
      ?auto_71219 - BLOCK
      ?auto_71218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71212 ?auto_71213 ) ) ( not ( = ?auto_71212 ?auto_71214 ) ) ( not ( = ?auto_71212 ?auto_71215 ) ) ( not ( = ?auto_71212 ?auto_71216 ) ) ( not ( = ?auto_71212 ?auto_71217 ) ) ( not ( = ?auto_71213 ?auto_71214 ) ) ( not ( = ?auto_71213 ?auto_71215 ) ) ( not ( = ?auto_71213 ?auto_71216 ) ) ( not ( = ?auto_71213 ?auto_71217 ) ) ( not ( = ?auto_71214 ?auto_71215 ) ) ( not ( = ?auto_71214 ?auto_71216 ) ) ( not ( = ?auto_71214 ?auto_71217 ) ) ( not ( = ?auto_71215 ?auto_71216 ) ) ( not ( = ?auto_71215 ?auto_71217 ) ) ( not ( = ?auto_71216 ?auto_71217 ) ) ( ON ?auto_71217 ?auto_71219 ) ( not ( = ?auto_71212 ?auto_71219 ) ) ( not ( = ?auto_71213 ?auto_71219 ) ) ( not ( = ?auto_71214 ?auto_71219 ) ) ( not ( = ?auto_71215 ?auto_71219 ) ) ( not ( = ?auto_71216 ?auto_71219 ) ) ( not ( = ?auto_71217 ?auto_71219 ) ) ( ON ?auto_71216 ?auto_71217 ) ( ON-TABLE ?auto_71219 ) ( ON ?auto_71212 ?auto_71218 ) ( not ( = ?auto_71212 ?auto_71218 ) ) ( not ( = ?auto_71213 ?auto_71218 ) ) ( not ( = ?auto_71214 ?auto_71218 ) ) ( not ( = ?auto_71215 ?auto_71218 ) ) ( not ( = ?auto_71216 ?auto_71218 ) ) ( not ( = ?auto_71217 ?auto_71218 ) ) ( not ( = ?auto_71219 ?auto_71218 ) ) ( ON ?auto_71213 ?auto_71212 ) ( ON-TABLE ?auto_71218 ) ( ON ?auto_71214 ?auto_71213 ) ( CLEAR ?auto_71216 ) ( ON ?auto_71215 ?auto_71214 ) ( CLEAR ?auto_71215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71218 ?auto_71212 ?auto_71213 ?auto_71214 )
      ( MAKE-6PILE ?auto_71212 ?auto_71213 ?auto_71214 ?auto_71215 ?auto_71216 ?auto_71217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71220 - BLOCK
      ?auto_71221 - BLOCK
      ?auto_71222 - BLOCK
      ?auto_71223 - BLOCK
      ?auto_71224 - BLOCK
      ?auto_71225 - BLOCK
    )
    :vars
    (
      ?auto_71227 - BLOCK
      ?auto_71226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71220 ?auto_71221 ) ) ( not ( = ?auto_71220 ?auto_71222 ) ) ( not ( = ?auto_71220 ?auto_71223 ) ) ( not ( = ?auto_71220 ?auto_71224 ) ) ( not ( = ?auto_71220 ?auto_71225 ) ) ( not ( = ?auto_71221 ?auto_71222 ) ) ( not ( = ?auto_71221 ?auto_71223 ) ) ( not ( = ?auto_71221 ?auto_71224 ) ) ( not ( = ?auto_71221 ?auto_71225 ) ) ( not ( = ?auto_71222 ?auto_71223 ) ) ( not ( = ?auto_71222 ?auto_71224 ) ) ( not ( = ?auto_71222 ?auto_71225 ) ) ( not ( = ?auto_71223 ?auto_71224 ) ) ( not ( = ?auto_71223 ?auto_71225 ) ) ( not ( = ?auto_71224 ?auto_71225 ) ) ( ON ?auto_71225 ?auto_71227 ) ( not ( = ?auto_71220 ?auto_71227 ) ) ( not ( = ?auto_71221 ?auto_71227 ) ) ( not ( = ?auto_71222 ?auto_71227 ) ) ( not ( = ?auto_71223 ?auto_71227 ) ) ( not ( = ?auto_71224 ?auto_71227 ) ) ( not ( = ?auto_71225 ?auto_71227 ) ) ( ON-TABLE ?auto_71227 ) ( ON ?auto_71220 ?auto_71226 ) ( not ( = ?auto_71220 ?auto_71226 ) ) ( not ( = ?auto_71221 ?auto_71226 ) ) ( not ( = ?auto_71222 ?auto_71226 ) ) ( not ( = ?auto_71223 ?auto_71226 ) ) ( not ( = ?auto_71224 ?auto_71226 ) ) ( not ( = ?auto_71225 ?auto_71226 ) ) ( not ( = ?auto_71227 ?auto_71226 ) ) ( ON ?auto_71221 ?auto_71220 ) ( ON-TABLE ?auto_71226 ) ( ON ?auto_71222 ?auto_71221 ) ( ON ?auto_71223 ?auto_71222 ) ( CLEAR ?auto_71223 ) ( HOLDING ?auto_71224 ) ( CLEAR ?auto_71225 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71227 ?auto_71225 ?auto_71224 )
      ( MAKE-6PILE ?auto_71220 ?auto_71221 ?auto_71222 ?auto_71223 ?auto_71224 ?auto_71225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71228 - BLOCK
      ?auto_71229 - BLOCK
      ?auto_71230 - BLOCK
      ?auto_71231 - BLOCK
      ?auto_71232 - BLOCK
      ?auto_71233 - BLOCK
    )
    :vars
    (
      ?auto_71234 - BLOCK
      ?auto_71235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71228 ?auto_71229 ) ) ( not ( = ?auto_71228 ?auto_71230 ) ) ( not ( = ?auto_71228 ?auto_71231 ) ) ( not ( = ?auto_71228 ?auto_71232 ) ) ( not ( = ?auto_71228 ?auto_71233 ) ) ( not ( = ?auto_71229 ?auto_71230 ) ) ( not ( = ?auto_71229 ?auto_71231 ) ) ( not ( = ?auto_71229 ?auto_71232 ) ) ( not ( = ?auto_71229 ?auto_71233 ) ) ( not ( = ?auto_71230 ?auto_71231 ) ) ( not ( = ?auto_71230 ?auto_71232 ) ) ( not ( = ?auto_71230 ?auto_71233 ) ) ( not ( = ?auto_71231 ?auto_71232 ) ) ( not ( = ?auto_71231 ?auto_71233 ) ) ( not ( = ?auto_71232 ?auto_71233 ) ) ( ON ?auto_71233 ?auto_71234 ) ( not ( = ?auto_71228 ?auto_71234 ) ) ( not ( = ?auto_71229 ?auto_71234 ) ) ( not ( = ?auto_71230 ?auto_71234 ) ) ( not ( = ?auto_71231 ?auto_71234 ) ) ( not ( = ?auto_71232 ?auto_71234 ) ) ( not ( = ?auto_71233 ?auto_71234 ) ) ( ON-TABLE ?auto_71234 ) ( ON ?auto_71228 ?auto_71235 ) ( not ( = ?auto_71228 ?auto_71235 ) ) ( not ( = ?auto_71229 ?auto_71235 ) ) ( not ( = ?auto_71230 ?auto_71235 ) ) ( not ( = ?auto_71231 ?auto_71235 ) ) ( not ( = ?auto_71232 ?auto_71235 ) ) ( not ( = ?auto_71233 ?auto_71235 ) ) ( not ( = ?auto_71234 ?auto_71235 ) ) ( ON ?auto_71229 ?auto_71228 ) ( ON-TABLE ?auto_71235 ) ( ON ?auto_71230 ?auto_71229 ) ( ON ?auto_71231 ?auto_71230 ) ( CLEAR ?auto_71233 ) ( ON ?auto_71232 ?auto_71231 ) ( CLEAR ?auto_71232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71235 ?auto_71228 ?auto_71229 ?auto_71230 ?auto_71231 )
      ( MAKE-6PILE ?auto_71228 ?auto_71229 ?auto_71230 ?auto_71231 ?auto_71232 ?auto_71233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71236 - BLOCK
      ?auto_71237 - BLOCK
      ?auto_71238 - BLOCK
      ?auto_71239 - BLOCK
      ?auto_71240 - BLOCK
      ?auto_71241 - BLOCK
    )
    :vars
    (
      ?auto_71242 - BLOCK
      ?auto_71243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71236 ?auto_71237 ) ) ( not ( = ?auto_71236 ?auto_71238 ) ) ( not ( = ?auto_71236 ?auto_71239 ) ) ( not ( = ?auto_71236 ?auto_71240 ) ) ( not ( = ?auto_71236 ?auto_71241 ) ) ( not ( = ?auto_71237 ?auto_71238 ) ) ( not ( = ?auto_71237 ?auto_71239 ) ) ( not ( = ?auto_71237 ?auto_71240 ) ) ( not ( = ?auto_71237 ?auto_71241 ) ) ( not ( = ?auto_71238 ?auto_71239 ) ) ( not ( = ?auto_71238 ?auto_71240 ) ) ( not ( = ?auto_71238 ?auto_71241 ) ) ( not ( = ?auto_71239 ?auto_71240 ) ) ( not ( = ?auto_71239 ?auto_71241 ) ) ( not ( = ?auto_71240 ?auto_71241 ) ) ( not ( = ?auto_71236 ?auto_71242 ) ) ( not ( = ?auto_71237 ?auto_71242 ) ) ( not ( = ?auto_71238 ?auto_71242 ) ) ( not ( = ?auto_71239 ?auto_71242 ) ) ( not ( = ?auto_71240 ?auto_71242 ) ) ( not ( = ?auto_71241 ?auto_71242 ) ) ( ON-TABLE ?auto_71242 ) ( ON ?auto_71236 ?auto_71243 ) ( not ( = ?auto_71236 ?auto_71243 ) ) ( not ( = ?auto_71237 ?auto_71243 ) ) ( not ( = ?auto_71238 ?auto_71243 ) ) ( not ( = ?auto_71239 ?auto_71243 ) ) ( not ( = ?auto_71240 ?auto_71243 ) ) ( not ( = ?auto_71241 ?auto_71243 ) ) ( not ( = ?auto_71242 ?auto_71243 ) ) ( ON ?auto_71237 ?auto_71236 ) ( ON-TABLE ?auto_71243 ) ( ON ?auto_71238 ?auto_71237 ) ( ON ?auto_71239 ?auto_71238 ) ( ON ?auto_71240 ?auto_71239 ) ( CLEAR ?auto_71240 ) ( HOLDING ?auto_71241 ) ( CLEAR ?auto_71242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71242 ?auto_71241 )
      ( MAKE-6PILE ?auto_71236 ?auto_71237 ?auto_71238 ?auto_71239 ?auto_71240 ?auto_71241 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71244 - BLOCK
      ?auto_71245 - BLOCK
      ?auto_71246 - BLOCK
      ?auto_71247 - BLOCK
      ?auto_71248 - BLOCK
      ?auto_71249 - BLOCK
    )
    :vars
    (
      ?auto_71251 - BLOCK
      ?auto_71250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71244 ?auto_71245 ) ) ( not ( = ?auto_71244 ?auto_71246 ) ) ( not ( = ?auto_71244 ?auto_71247 ) ) ( not ( = ?auto_71244 ?auto_71248 ) ) ( not ( = ?auto_71244 ?auto_71249 ) ) ( not ( = ?auto_71245 ?auto_71246 ) ) ( not ( = ?auto_71245 ?auto_71247 ) ) ( not ( = ?auto_71245 ?auto_71248 ) ) ( not ( = ?auto_71245 ?auto_71249 ) ) ( not ( = ?auto_71246 ?auto_71247 ) ) ( not ( = ?auto_71246 ?auto_71248 ) ) ( not ( = ?auto_71246 ?auto_71249 ) ) ( not ( = ?auto_71247 ?auto_71248 ) ) ( not ( = ?auto_71247 ?auto_71249 ) ) ( not ( = ?auto_71248 ?auto_71249 ) ) ( not ( = ?auto_71244 ?auto_71251 ) ) ( not ( = ?auto_71245 ?auto_71251 ) ) ( not ( = ?auto_71246 ?auto_71251 ) ) ( not ( = ?auto_71247 ?auto_71251 ) ) ( not ( = ?auto_71248 ?auto_71251 ) ) ( not ( = ?auto_71249 ?auto_71251 ) ) ( ON-TABLE ?auto_71251 ) ( ON ?auto_71244 ?auto_71250 ) ( not ( = ?auto_71244 ?auto_71250 ) ) ( not ( = ?auto_71245 ?auto_71250 ) ) ( not ( = ?auto_71246 ?auto_71250 ) ) ( not ( = ?auto_71247 ?auto_71250 ) ) ( not ( = ?auto_71248 ?auto_71250 ) ) ( not ( = ?auto_71249 ?auto_71250 ) ) ( not ( = ?auto_71251 ?auto_71250 ) ) ( ON ?auto_71245 ?auto_71244 ) ( ON-TABLE ?auto_71250 ) ( ON ?auto_71246 ?auto_71245 ) ( ON ?auto_71247 ?auto_71246 ) ( ON ?auto_71248 ?auto_71247 ) ( CLEAR ?auto_71251 ) ( ON ?auto_71249 ?auto_71248 ) ( CLEAR ?auto_71249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71250 ?auto_71244 ?auto_71245 ?auto_71246 ?auto_71247 ?auto_71248 )
      ( MAKE-6PILE ?auto_71244 ?auto_71245 ?auto_71246 ?auto_71247 ?auto_71248 ?auto_71249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71252 - BLOCK
      ?auto_71253 - BLOCK
      ?auto_71254 - BLOCK
      ?auto_71255 - BLOCK
      ?auto_71256 - BLOCK
      ?auto_71257 - BLOCK
    )
    :vars
    (
      ?auto_71258 - BLOCK
      ?auto_71259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71252 ?auto_71253 ) ) ( not ( = ?auto_71252 ?auto_71254 ) ) ( not ( = ?auto_71252 ?auto_71255 ) ) ( not ( = ?auto_71252 ?auto_71256 ) ) ( not ( = ?auto_71252 ?auto_71257 ) ) ( not ( = ?auto_71253 ?auto_71254 ) ) ( not ( = ?auto_71253 ?auto_71255 ) ) ( not ( = ?auto_71253 ?auto_71256 ) ) ( not ( = ?auto_71253 ?auto_71257 ) ) ( not ( = ?auto_71254 ?auto_71255 ) ) ( not ( = ?auto_71254 ?auto_71256 ) ) ( not ( = ?auto_71254 ?auto_71257 ) ) ( not ( = ?auto_71255 ?auto_71256 ) ) ( not ( = ?auto_71255 ?auto_71257 ) ) ( not ( = ?auto_71256 ?auto_71257 ) ) ( not ( = ?auto_71252 ?auto_71258 ) ) ( not ( = ?auto_71253 ?auto_71258 ) ) ( not ( = ?auto_71254 ?auto_71258 ) ) ( not ( = ?auto_71255 ?auto_71258 ) ) ( not ( = ?auto_71256 ?auto_71258 ) ) ( not ( = ?auto_71257 ?auto_71258 ) ) ( ON ?auto_71252 ?auto_71259 ) ( not ( = ?auto_71252 ?auto_71259 ) ) ( not ( = ?auto_71253 ?auto_71259 ) ) ( not ( = ?auto_71254 ?auto_71259 ) ) ( not ( = ?auto_71255 ?auto_71259 ) ) ( not ( = ?auto_71256 ?auto_71259 ) ) ( not ( = ?auto_71257 ?auto_71259 ) ) ( not ( = ?auto_71258 ?auto_71259 ) ) ( ON ?auto_71253 ?auto_71252 ) ( ON-TABLE ?auto_71259 ) ( ON ?auto_71254 ?auto_71253 ) ( ON ?auto_71255 ?auto_71254 ) ( ON ?auto_71256 ?auto_71255 ) ( ON ?auto_71257 ?auto_71256 ) ( CLEAR ?auto_71257 ) ( HOLDING ?auto_71258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71258 )
      ( MAKE-6PILE ?auto_71252 ?auto_71253 ?auto_71254 ?auto_71255 ?auto_71256 ?auto_71257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71260 - BLOCK
      ?auto_71261 - BLOCK
      ?auto_71262 - BLOCK
      ?auto_71263 - BLOCK
      ?auto_71264 - BLOCK
      ?auto_71265 - BLOCK
    )
    :vars
    (
      ?auto_71267 - BLOCK
      ?auto_71266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71260 ?auto_71261 ) ) ( not ( = ?auto_71260 ?auto_71262 ) ) ( not ( = ?auto_71260 ?auto_71263 ) ) ( not ( = ?auto_71260 ?auto_71264 ) ) ( not ( = ?auto_71260 ?auto_71265 ) ) ( not ( = ?auto_71261 ?auto_71262 ) ) ( not ( = ?auto_71261 ?auto_71263 ) ) ( not ( = ?auto_71261 ?auto_71264 ) ) ( not ( = ?auto_71261 ?auto_71265 ) ) ( not ( = ?auto_71262 ?auto_71263 ) ) ( not ( = ?auto_71262 ?auto_71264 ) ) ( not ( = ?auto_71262 ?auto_71265 ) ) ( not ( = ?auto_71263 ?auto_71264 ) ) ( not ( = ?auto_71263 ?auto_71265 ) ) ( not ( = ?auto_71264 ?auto_71265 ) ) ( not ( = ?auto_71260 ?auto_71267 ) ) ( not ( = ?auto_71261 ?auto_71267 ) ) ( not ( = ?auto_71262 ?auto_71267 ) ) ( not ( = ?auto_71263 ?auto_71267 ) ) ( not ( = ?auto_71264 ?auto_71267 ) ) ( not ( = ?auto_71265 ?auto_71267 ) ) ( ON ?auto_71260 ?auto_71266 ) ( not ( = ?auto_71260 ?auto_71266 ) ) ( not ( = ?auto_71261 ?auto_71266 ) ) ( not ( = ?auto_71262 ?auto_71266 ) ) ( not ( = ?auto_71263 ?auto_71266 ) ) ( not ( = ?auto_71264 ?auto_71266 ) ) ( not ( = ?auto_71265 ?auto_71266 ) ) ( not ( = ?auto_71267 ?auto_71266 ) ) ( ON ?auto_71261 ?auto_71260 ) ( ON-TABLE ?auto_71266 ) ( ON ?auto_71262 ?auto_71261 ) ( ON ?auto_71263 ?auto_71262 ) ( ON ?auto_71264 ?auto_71263 ) ( ON ?auto_71265 ?auto_71264 ) ( ON ?auto_71267 ?auto_71265 ) ( CLEAR ?auto_71267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71266 ?auto_71260 ?auto_71261 ?auto_71262 ?auto_71263 ?auto_71264 ?auto_71265 )
      ( MAKE-6PILE ?auto_71260 ?auto_71261 ?auto_71262 ?auto_71263 ?auto_71264 ?auto_71265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71282 - BLOCK
      ?auto_71283 - BLOCK
      ?auto_71284 - BLOCK
      ?auto_71285 - BLOCK
      ?auto_71286 - BLOCK
      ?auto_71287 - BLOCK
      ?auto_71288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71287 ) ( ON-TABLE ?auto_71282 ) ( ON ?auto_71283 ?auto_71282 ) ( ON ?auto_71284 ?auto_71283 ) ( ON ?auto_71285 ?auto_71284 ) ( ON ?auto_71286 ?auto_71285 ) ( ON ?auto_71287 ?auto_71286 ) ( not ( = ?auto_71282 ?auto_71283 ) ) ( not ( = ?auto_71282 ?auto_71284 ) ) ( not ( = ?auto_71282 ?auto_71285 ) ) ( not ( = ?auto_71282 ?auto_71286 ) ) ( not ( = ?auto_71282 ?auto_71287 ) ) ( not ( = ?auto_71282 ?auto_71288 ) ) ( not ( = ?auto_71283 ?auto_71284 ) ) ( not ( = ?auto_71283 ?auto_71285 ) ) ( not ( = ?auto_71283 ?auto_71286 ) ) ( not ( = ?auto_71283 ?auto_71287 ) ) ( not ( = ?auto_71283 ?auto_71288 ) ) ( not ( = ?auto_71284 ?auto_71285 ) ) ( not ( = ?auto_71284 ?auto_71286 ) ) ( not ( = ?auto_71284 ?auto_71287 ) ) ( not ( = ?auto_71284 ?auto_71288 ) ) ( not ( = ?auto_71285 ?auto_71286 ) ) ( not ( = ?auto_71285 ?auto_71287 ) ) ( not ( = ?auto_71285 ?auto_71288 ) ) ( not ( = ?auto_71286 ?auto_71287 ) ) ( not ( = ?auto_71286 ?auto_71288 ) ) ( not ( = ?auto_71287 ?auto_71288 ) ) ( ON-TABLE ?auto_71288 ) ( CLEAR ?auto_71288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_71288 )
      ( MAKE-7PILE ?auto_71282 ?auto_71283 ?auto_71284 ?auto_71285 ?auto_71286 ?auto_71287 ?auto_71288 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71289 - BLOCK
      ?auto_71290 - BLOCK
      ?auto_71291 - BLOCK
      ?auto_71292 - BLOCK
      ?auto_71293 - BLOCK
      ?auto_71294 - BLOCK
      ?auto_71295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71289 ) ( ON ?auto_71290 ?auto_71289 ) ( ON ?auto_71291 ?auto_71290 ) ( ON ?auto_71292 ?auto_71291 ) ( ON ?auto_71293 ?auto_71292 ) ( not ( = ?auto_71289 ?auto_71290 ) ) ( not ( = ?auto_71289 ?auto_71291 ) ) ( not ( = ?auto_71289 ?auto_71292 ) ) ( not ( = ?auto_71289 ?auto_71293 ) ) ( not ( = ?auto_71289 ?auto_71294 ) ) ( not ( = ?auto_71289 ?auto_71295 ) ) ( not ( = ?auto_71290 ?auto_71291 ) ) ( not ( = ?auto_71290 ?auto_71292 ) ) ( not ( = ?auto_71290 ?auto_71293 ) ) ( not ( = ?auto_71290 ?auto_71294 ) ) ( not ( = ?auto_71290 ?auto_71295 ) ) ( not ( = ?auto_71291 ?auto_71292 ) ) ( not ( = ?auto_71291 ?auto_71293 ) ) ( not ( = ?auto_71291 ?auto_71294 ) ) ( not ( = ?auto_71291 ?auto_71295 ) ) ( not ( = ?auto_71292 ?auto_71293 ) ) ( not ( = ?auto_71292 ?auto_71294 ) ) ( not ( = ?auto_71292 ?auto_71295 ) ) ( not ( = ?auto_71293 ?auto_71294 ) ) ( not ( = ?auto_71293 ?auto_71295 ) ) ( not ( = ?auto_71294 ?auto_71295 ) ) ( ON-TABLE ?auto_71295 ) ( CLEAR ?auto_71295 ) ( HOLDING ?auto_71294 ) ( CLEAR ?auto_71293 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71289 ?auto_71290 ?auto_71291 ?auto_71292 ?auto_71293 ?auto_71294 )
      ( MAKE-7PILE ?auto_71289 ?auto_71290 ?auto_71291 ?auto_71292 ?auto_71293 ?auto_71294 ?auto_71295 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71296 - BLOCK
      ?auto_71297 - BLOCK
      ?auto_71298 - BLOCK
      ?auto_71299 - BLOCK
      ?auto_71300 - BLOCK
      ?auto_71301 - BLOCK
      ?auto_71302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71296 ) ( ON ?auto_71297 ?auto_71296 ) ( ON ?auto_71298 ?auto_71297 ) ( ON ?auto_71299 ?auto_71298 ) ( ON ?auto_71300 ?auto_71299 ) ( not ( = ?auto_71296 ?auto_71297 ) ) ( not ( = ?auto_71296 ?auto_71298 ) ) ( not ( = ?auto_71296 ?auto_71299 ) ) ( not ( = ?auto_71296 ?auto_71300 ) ) ( not ( = ?auto_71296 ?auto_71301 ) ) ( not ( = ?auto_71296 ?auto_71302 ) ) ( not ( = ?auto_71297 ?auto_71298 ) ) ( not ( = ?auto_71297 ?auto_71299 ) ) ( not ( = ?auto_71297 ?auto_71300 ) ) ( not ( = ?auto_71297 ?auto_71301 ) ) ( not ( = ?auto_71297 ?auto_71302 ) ) ( not ( = ?auto_71298 ?auto_71299 ) ) ( not ( = ?auto_71298 ?auto_71300 ) ) ( not ( = ?auto_71298 ?auto_71301 ) ) ( not ( = ?auto_71298 ?auto_71302 ) ) ( not ( = ?auto_71299 ?auto_71300 ) ) ( not ( = ?auto_71299 ?auto_71301 ) ) ( not ( = ?auto_71299 ?auto_71302 ) ) ( not ( = ?auto_71300 ?auto_71301 ) ) ( not ( = ?auto_71300 ?auto_71302 ) ) ( not ( = ?auto_71301 ?auto_71302 ) ) ( ON-TABLE ?auto_71302 ) ( CLEAR ?auto_71300 ) ( ON ?auto_71301 ?auto_71302 ) ( CLEAR ?auto_71301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71302 )
      ( MAKE-7PILE ?auto_71296 ?auto_71297 ?auto_71298 ?auto_71299 ?auto_71300 ?auto_71301 ?auto_71302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71303 - BLOCK
      ?auto_71304 - BLOCK
      ?auto_71305 - BLOCK
      ?auto_71306 - BLOCK
      ?auto_71307 - BLOCK
      ?auto_71308 - BLOCK
      ?auto_71309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71303 ) ( ON ?auto_71304 ?auto_71303 ) ( ON ?auto_71305 ?auto_71304 ) ( ON ?auto_71306 ?auto_71305 ) ( not ( = ?auto_71303 ?auto_71304 ) ) ( not ( = ?auto_71303 ?auto_71305 ) ) ( not ( = ?auto_71303 ?auto_71306 ) ) ( not ( = ?auto_71303 ?auto_71307 ) ) ( not ( = ?auto_71303 ?auto_71308 ) ) ( not ( = ?auto_71303 ?auto_71309 ) ) ( not ( = ?auto_71304 ?auto_71305 ) ) ( not ( = ?auto_71304 ?auto_71306 ) ) ( not ( = ?auto_71304 ?auto_71307 ) ) ( not ( = ?auto_71304 ?auto_71308 ) ) ( not ( = ?auto_71304 ?auto_71309 ) ) ( not ( = ?auto_71305 ?auto_71306 ) ) ( not ( = ?auto_71305 ?auto_71307 ) ) ( not ( = ?auto_71305 ?auto_71308 ) ) ( not ( = ?auto_71305 ?auto_71309 ) ) ( not ( = ?auto_71306 ?auto_71307 ) ) ( not ( = ?auto_71306 ?auto_71308 ) ) ( not ( = ?auto_71306 ?auto_71309 ) ) ( not ( = ?auto_71307 ?auto_71308 ) ) ( not ( = ?auto_71307 ?auto_71309 ) ) ( not ( = ?auto_71308 ?auto_71309 ) ) ( ON-TABLE ?auto_71309 ) ( ON ?auto_71308 ?auto_71309 ) ( CLEAR ?auto_71308 ) ( HOLDING ?auto_71307 ) ( CLEAR ?auto_71306 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71303 ?auto_71304 ?auto_71305 ?auto_71306 ?auto_71307 )
      ( MAKE-7PILE ?auto_71303 ?auto_71304 ?auto_71305 ?auto_71306 ?auto_71307 ?auto_71308 ?auto_71309 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71310 - BLOCK
      ?auto_71311 - BLOCK
      ?auto_71312 - BLOCK
      ?auto_71313 - BLOCK
      ?auto_71314 - BLOCK
      ?auto_71315 - BLOCK
      ?auto_71316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71310 ) ( ON ?auto_71311 ?auto_71310 ) ( ON ?auto_71312 ?auto_71311 ) ( ON ?auto_71313 ?auto_71312 ) ( not ( = ?auto_71310 ?auto_71311 ) ) ( not ( = ?auto_71310 ?auto_71312 ) ) ( not ( = ?auto_71310 ?auto_71313 ) ) ( not ( = ?auto_71310 ?auto_71314 ) ) ( not ( = ?auto_71310 ?auto_71315 ) ) ( not ( = ?auto_71310 ?auto_71316 ) ) ( not ( = ?auto_71311 ?auto_71312 ) ) ( not ( = ?auto_71311 ?auto_71313 ) ) ( not ( = ?auto_71311 ?auto_71314 ) ) ( not ( = ?auto_71311 ?auto_71315 ) ) ( not ( = ?auto_71311 ?auto_71316 ) ) ( not ( = ?auto_71312 ?auto_71313 ) ) ( not ( = ?auto_71312 ?auto_71314 ) ) ( not ( = ?auto_71312 ?auto_71315 ) ) ( not ( = ?auto_71312 ?auto_71316 ) ) ( not ( = ?auto_71313 ?auto_71314 ) ) ( not ( = ?auto_71313 ?auto_71315 ) ) ( not ( = ?auto_71313 ?auto_71316 ) ) ( not ( = ?auto_71314 ?auto_71315 ) ) ( not ( = ?auto_71314 ?auto_71316 ) ) ( not ( = ?auto_71315 ?auto_71316 ) ) ( ON-TABLE ?auto_71316 ) ( ON ?auto_71315 ?auto_71316 ) ( CLEAR ?auto_71313 ) ( ON ?auto_71314 ?auto_71315 ) ( CLEAR ?auto_71314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71316 ?auto_71315 )
      ( MAKE-7PILE ?auto_71310 ?auto_71311 ?auto_71312 ?auto_71313 ?auto_71314 ?auto_71315 ?auto_71316 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71317 - BLOCK
      ?auto_71318 - BLOCK
      ?auto_71319 - BLOCK
      ?auto_71320 - BLOCK
      ?auto_71321 - BLOCK
      ?auto_71322 - BLOCK
      ?auto_71323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71317 ) ( ON ?auto_71318 ?auto_71317 ) ( ON ?auto_71319 ?auto_71318 ) ( not ( = ?auto_71317 ?auto_71318 ) ) ( not ( = ?auto_71317 ?auto_71319 ) ) ( not ( = ?auto_71317 ?auto_71320 ) ) ( not ( = ?auto_71317 ?auto_71321 ) ) ( not ( = ?auto_71317 ?auto_71322 ) ) ( not ( = ?auto_71317 ?auto_71323 ) ) ( not ( = ?auto_71318 ?auto_71319 ) ) ( not ( = ?auto_71318 ?auto_71320 ) ) ( not ( = ?auto_71318 ?auto_71321 ) ) ( not ( = ?auto_71318 ?auto_71322 ) ) ( not ( = ?auto_71318 ?auto_71323 ) ) ( not ( = ?auto_71319 ?auto_71320 ) ) ( not ( = ?auto_71319 ?auto_71321 ) ) ( not ( = ?auto_71319 ?auto_71322 ) ) ( not ( = ?auto_71319 ?auto_71323 ) ) ( not ( = ?auto_71320 ?auto_71321 ) ) ( not ( = ?auto_71320 ?auto_71322 ) ) ( not ( = ?auto_71320 ?auto_71323 ) ) ( not ( = ?auto_71321 ?auto_71322 ) ) ( not ( = ?auto_71321 ?auto_71323 ) ) ( not ( = ?auto_71322 ?auto_71323 ) ) ( ON-TABLE ?auto_71323 ) ( ON ?auto_71322 ?auto_71323 ) ( ON ?auto_71321 ?auto_71322 ) ( CLEAR ?auto_71321 ) ( HOLDING ?auto_71320 ) ( CLEAR ?auto_71319 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71317 ?auto_71318 ?auto_71319 ?auto_71320 )
      ( MAKE-7PILE ?auto_71317 ?auto_71318 ?auto_71319 ?auto_71320 ?auto_71321 ?auto_71322 ?auto_71323 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71324 - BLOCK
      ?auto_71325 - BLOCK
      ?auto_71326 - BLOCK
      ?auto_71327 - BLOCK
      ?auto_71328 - BLOCK
      ?auto_71329 - BLOCK
      ?auto_71330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71324 ) ( ON ?auto_71325 ?auto_71324 ) ( ON ?auto_71326 ?auto_71325 ) ( not ( = ?auto_71324 ?auto_71325 ) ) ( not ( = ?auto_71324 ?auto_71326 ) ) ( not ( = ?auto_71324 ?auto_71327 ) ) ( not ( = ?auto_71324 ?auto_71328 ) ) ( not ( = ?auto_71324 ?auto_71329 ) ) ( not ( = ?auto_71324 ?auto_71330 ) ) ( not ( = ?auto_71325 ?auto_71326 ) ) ( not ( = ?auto_71325 ?auto_71327 ) ) ( not ( = ?auto_71325 ?auto_71328 ) ) ( not ( = ?auto_71325 ?auto_71329 ) ) ( not ( = ?auto_71325 ?auto_71330 ) ) ( not ( = ?auto_71326 ?auto_71327 ) ) ( not ( = ?auto_71326 ?auto_71328 ) ) ( not ( = ?auto_71326 ?auto_71329 ) ) ( not ( = ?auto_71326 ?auto_71330 ) ) ( not ( = ?auto_71327 ?auto_71328 ) ) ( not ( = ?auto_71327 ?auto_71329 ) ) ( not ( = ?auto_71327 ?auto_71330 ) ) ( not ( = ?auto_71328 ?auto_71329 ) ) ( not ( = ?auto_71328 ?auto_71330 ) ) ( not ( = ?auto_71329 ?auto_71330 ) ) ( ON-TABLE ?auto_71330 ) ( ON ?auto_71329 ?auto_71330 ) ( ON ?auto_71328 ?auto_71329 ) ( CLEAR ?auto_71326 ) ( ON ?auto_71327 ?auto_71328 ) ( CLEAR ?auto_71327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71330 ?auto_71329 ?auto_71328 )
      ( MAKE-7PILE ?auto_71324 ?auto_71325 ?auto_71326 ?auto_71327 ?auto_71328 ?auto_71329 ?auto_71330 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71331 - BLOCK
      ?auto_71332 - BLOCK
      ?auto_71333 - BLOCK
      ?auto_71334 - BLOCK
      ?auto_71335 - BLOCK
      ?auto_71336 - BLOCK
      ?auto_71337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71331 ) ( ON ?auto_71332 ?auto_71331 ) ( not ( = ?auto_71331 ?auto_71332 ) ) ( not ( = ?auto_71331 ?auto_71333 ) ) ( not ( = ?auto_71331 ?auto_71334 ) ) ( not ( = ?auto_71331 ?auto_71335 ) ) ( not ( = ?auto_71331 ?auto_71336 ) ) ( not ( = ?auto_71331 ?auto_71337 ) ) ( not ( = ?auto_71332 ?auto_71333 ) ) ( not ( = ?auto_71332 ?auto_71334 ) ) ( not ( = ?auto_71332 ?auto_71335 ) ) ( not ( = ?auto_71332 ?auto_71336 ) ) ( not ( = ?auto_71332 ?auto_71337 ) ) ( not ( = ?auto_71333 ?auto_71334 ) ) ( not ( = ?auto_71333 ?auto_71335 ) ) ( not ( = ?auto_71333 ?auto_71336 ) ) ( not ( = ?auto_71333 ?auto_71337 ) ) ( not ( = ?auto_71334 ?auto_71335 ) ) ( not ( = ?auto_71334 ?auto_71336 ) ) ( not ( = ?auto_71334 ?auto_71337 ) ) ( not ( = ?auto_71335 ?auto_71336 ) ) ( not ( = ?auto_71335 ?auto_71337 ) ) ( not ( = ?auto_71336 ?auto_71337 ) ) ( ON-TABLE ?auto_71337 ) ( ON ?auto_71336 ?auto_71337 ) ( ON ?auto_71335 ?auto_71336 ) ( ON ?auto_71334 ?auto_71335 ) ( CLEAR ?auto_71334 ) ( HOLDING ?auto_71333 ) ( CLEAR ?auto_71332 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71331 ?auto_71332 ?auto_71333 )
      ( MAKE-7PILE ?auto_71331 ?auto_71332 ?auto_71333 ?auto_71334 ?auto_71335 ?auto_71336 ?auto_71337 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71338 - BLOCK
      ?auto_71339 - BLOCK
      ?auto_71340 - BLOCK
      ?auto_71341 - BLOCK
      ?auto_71342 - BLOCK
      ?auto_71343 - BLOCK
      ?auto_71344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71338 ) ( ON ?auto_71339 ?auto_71338 ) ( not ( = ?auto_71338 ?auto_71339 ) ) ( not ( = ?auto_71338 ?auto_71340 ) ) ( not ( = ?auto_71338 ?auto_71341 ) ) ( not ( = ?auto_71338 ?auto_71342 ) ) ( not ( = ?auto_71338 ?auto_71343 ) ) ( not ( = ?auto_71338 ?auto_71344 ) ) ( not ( = ?auto_71339 ?auto_71340 ) ) ( not ( = ?auto_71339 ?auto_71341 ) ) ( not ( = ?auto_71339 ?auto_71342 ) ) ( not ( = ?auto_71339 ?auto_71343 ) ) ( not ( = ?auto_71339 ?auto_71344 ) ) ( not ( = ?auto_71340 ?auto_71341 ) ) ( not ( = ?auto_71340 ?auto_71342 ) ) ( not ( = ?auto_71340 ?auto_71343 ) ) ( not ( = ?auto_71340 ?auto_71344 ) ) ( not ( = ?auto_71341 ?auto_71342 ) ) ( not ( = ?auto_71341 ?auto_71343 ) ) ( not ( = ?auto_71341 ?auto_71344 ) ) ( not ( = ?auto_71342 ?auto_71343 ) ) ( not ( = ?auto_71342 ?auto_71344 ) ) ( not ( = ?auto_71343 ?auto_71344 ) ) ( ON-TABLE ?auto_71344 ) ( ON ?auto_71343 ?auto_71344 ) ( ON ?auto_71342 ?auto_71343 ) ( ON ?auto_71341 ?auto_71342 ) ( CLEAR ?auto_71339 ) ( ON ?auto_71340 ?auto_71341 ) ( CLEAR ?auto_71340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71344 ?auto_71343 ?auto_71342 ?auto_71341 )
      ( MAKE-7PILE ?auto_71338 ?auto_71339 ?auto_71340 ?auto_71341 ?auto_71342 ?auto_71343 ?auto_71344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71345 - BLOCK
      ?auto_71346 - BLOCK
      ?auto_71347 - BLOCK
      ?auto_71348 - BLOCK
      ?auto_71349 - BLOCK
      ?auto_71350 - BLOCK
      ?auto_71351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71345 ) ( not ( = ?auto_71345 ?auto_71346 ) ) ( not ( = ?auto_71345 ?auto_71347 ) ) ( not ( = ?auto_71345 ?auto_71348 ) ) ( not ( = ?auto_71345 ?auto_71349 ) ) ( not ( = ?auto_71345 ?auto_71350 ) ) ( not ( = ?auto_71345 ?auto_71351 ) ) ( not ( = ?auto_71346 ?auto_71347 ) ) ( not ( = ?auto_71346 ?auto_71348 ) ) ( not ( = ?auto_71346 ?auto_71349 ) ) ( not ( = ?auto_71346 ?auto_71350 ) ) ( not ( = ?auto_71346 ?auto_71351 ) ) ( not ( = ?auto_71347 ?auto_71348 ) ) ( not ( = ?auto_71347 ?auto_71349 ) ) ( not ( = ?auto_71347 ?auto_71350 ) ) ( not ( = ?auto_71347 ?auto_71351 ) ) ( not ( = ?auto_71348 ?auto_71349 ) ) ( not ( = ?auto_71348 ?auto_71350 ) ) ( not ( = ?auto_71348 ?auto_71351 ) ) ( not ( = ?auto_71349 ?auto_71350 ) ) ( not ( = ?auto_71349 ?auto_71351 ) ) ( not ( = ?auto_71350 ?auto_71351 ) ) ( ON-TABLE ?auto_71351 ) ( ON ?auto_71350 ?auto_71351 ) ( ON ?auto_71349 ?auto_71350 ) ( ON ?auto_71348 ?auto_71349 ) ( ON ?auto_71347 ?auto_71348 ) ( CLEAR ?auto_71347 ) ( HOLDING ?auto_71346 ) ( CLEAR ?auto_71345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71345 ?auto_71346 )
      ( MAKE-7PILE ?auto_71345 ?auto_71346 ?auto_71347 ?auto_71348 ?auto_71349 ?auto_71350 ?auto_71351 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71352 - BLOCK
      ?auto_71353 - BLOCK
      ?auto_71354 - BLOCK
      ?auto_71355 - BLOCK
      ?auto_71356 - BLOCK
      ?auto_71357 - BLOCK
      ?auto_71358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71352 ) ( not ( = ?auto_71352 ?auto_71353 ) ) ( not ( = ?auto_71352 ?auto_71354 ) ) ( not ( = ?auto_71352 ?auto_71355 ) ) ( not ( = ?auto_71352 ?auto_71356 ) ) ( not ( = ?auto_71352 ?auto_71357 ) ) ( not ( = ?auto_71352 ?auto_71358 ) ) ( not ( = ?auto_71353 ?auto_71354 ) ) ( not ( = ?auto_71353 ?auto_71355 ) ) ( not ( = ?auto_71353 ?auto_71356 ) ) ( not ( = ?auto_71353 ?auto_71357 ) ) ( not ( = ?auto_71353 ?auto_71358 ) ) ( not ( = ?auto_71354 ?auto_71355 ) ) ( not ( = ?auto_71354 ?auto_71356 ) ) ( not ( = ?auto_71354 ?auto_71357 ) ) ( not ( = ?auto_71354 ?auto_71358 ) ) ( not ( = ?auto_71355 ?auto_71356 ) ) ( not ( = ?auto_71355 ?auto_71357 ) ) ( not ( = ?auto_71355 ?auto_71358 ) ) ( not ( = ?auto_71356 ?auto_71357 ) ) ( not ( = ?auto_71356 ?auto_71358 ) ) ( not ( = ?auto_71357 ?auto_71358 ) ) ( ON-TABLE ?auto_71358 ) ( ON ?auto_71357 ?auto_71358 ) ( ON ?auto_71356 ?auto_71357 ) ( ON ?auto_71355 ?auto_71356 ) ( ON ?auto_71354 ?auto_71355 ) ( CLEAR ?auto_71352 ) ( ON ?auto_71353 ?auto_71354 ) ( CLEAR ?auto_71353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71358 ?auto_71357 ?auto_71356 ?auto_71355 ?auto_71354 )
      ( MAKE-7PILE ?auto_71352 ?auto_71353 ?auto_71354 ?auto_71355 ?auto_71356 ?auto_71357 ?auto_71358 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71359 - BLOCK
      ?auto_71360 - BLOCK
      ?auto_71361 - BLOCK
      ?auto_71362 - BLOCK
      ?auto_71363 - BLOCK
      ?auto_71364 - BLOCK
      ?auto_71365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71359 ?auto_71360 ) ) ( not ( = ?auto_71359 ?auto_71361 ) ) ( not ( = ?auto_71359 ?auto_71362 ) ) ( not ( = ?auto_71359 ?auto_71363 ) ) ( not ( = ?auto_71359 ?auto_71364 ) ) ( not ( = ?auto_71359 ?auto_71365 ) ) ( not ( = ?auto_71360 ?auto_71361 ) ) ( not ( = ?auto_71360 ?auto_71362 ) ) ( not ( = ?auto_71360 ?auto_71363 ) ) ( not ( = ?auto_71360 ?auto_71364 ) ) ( not ( = ?auto_71360 ?auto_71365 ) ) ( not ( = ?auto_71361 ?auto_71362 ) ) ( not ( = ?auto_71361 ?auto_71363 ) ) ( not ( = ?auto_71361 ?auto_71364 ) ) ( not ( = ?auto_71361 ?auto_71365 ) ) ( not ( = ?auto_71362 ?auto_71363 ) ) ( not ( = ?auto_71362 ?auto_71364 ) ) ( not ( = ?auto_71362 ?auto_71365 ) ) ( not ( = ?auto_71363 ?auto_71364 ) ) ( not ( = ?auto_71363 ?auto_71365 ) ) ( not ( = ?auto_71364 ?auto_71365 ) ) ( ON-TABLE ?auto_71365 ) ( ON ?auto_71364 ?auto_71365 ) ( ON ?auto_71363 ?auto_71364 ) ( ON ?auto_71362 ?auto_71363 ) ( ON ?auto_71361 ?auto_71362 ) ( ON ?auto_71360 ?auto_71361 ) ( CLEAR ?auto_71360 ) ( HOLDING ?auto_71359 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71359 )
      ( MAKE-7PILE ?auto_71359 ?auto_71360 ?auto_71361 ?auto_71362 ?auto_71363 ?auto_71364 ?auto_71365 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71366 - BLOCK
      ?auto_71367 - BLOCK
      ?auto_71368 - BLOCK
      ?auto_71369 - BLOCK
      ?auto_71370 - BLOCK
      ?auto_71371 - BLOCK
      ?auto_71372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71366 ?auto_71367 ) ) ( not ( = ?auto_71366 ?auto_71368 ) ) ( not ( = ?auto_71366 ?auto_71369 ) ) ( not ( = ?auto_71366 ?auto_71370 ) ) ( not ( = ?auto_71366 ?auto_71371 ) ) ( not ( = ?auto_71366 ?auto_71372 ) ) ( not ( = ?auto_71367 ?auto_71368 ) ) ( not ( = ?auto_71367 ?auto_71369 ) ) ( not ( = ?auto_71367 ?auto_71370 ) ) ( not ( = ?auto_71367 ?auto_71371 ) ) ( not ( = ?auto_71367 ?auto_71372 ) ) ( not ( = ?auto_71368 ?auto_71369 ) ) ( not ( = ?auto_71368 ?auto_71370 ) ) ( not ( = ?auto_71368 ?auto_71371 ) ) ( not ( = ?auto_71368 ?auto_71372 ) ) ( not ( = ?auto_71369 ?auto_71370 ) ) ( not ( = ?auto_71369 ?auto_71371 ) ) ( not ( = ?auto_71369 ?auto_71372 ) ) ( not ( = ?auto_71370 ?auto_71371 ) ) ( not ( = ?auto_71370 ?auto_71372 ) ) ( not ( = ?auto_71371 ?auto_71372 ) ) ( ON-TABLE ?auto_71372 ) ( ON ?auto_71371 ?auto_71372 ) ( ON ?auto_71370 ?auto_71371 ) ( ON ?auto_71369 ?auto_71370 ) ( ON ?auto_71368 ?auto_71369 ) ( ON ?auto_71367 ?auto_71368 ) ( ON ?auto_71366 ?auto_71367 ) ( CLEAR ?auto_71366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71372 ?auto_71371 ?auto_71370 ?auto_71369 ?auto_71368 ?auto_71367 )
      ( MAKE-7PILE ?auto_71366 ?auto_71367 ?auto_71368 ?auto_71369 ?auto_71370 ?auto_71371 ?auto_71372 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71380 - BLOCK
      ?auto_71381 - BLOCK
      ?auto_71382 - BLOCK
      ?auto_71383 - BLOCK
      ?auto_71384 - BLOCK
      ?auto_71385 - BLOCK
      ?auto_71386 - BLOCK
    )
    :vars
    (
      ?auto_71387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71380 ?auto_71381 ) ) ( not ( = ?auto_71380 ?auto_71382 ) ) ( not ( = ?auto_71380 ?auto_71383 ) ) ( not ( = ?auto_71380 ?auto_71384 ) ) ( not ( = ?auto_71380 ?auto_71385 ) ) ( not ( = ?auto_71380 ?auto_71386 ) ) ( not ( = ?auto_71381 ?auto_71382 ) ) ( not ( = ?auto_71381 ?auto_71383 ) ) ( not ( = ?auto_71381 ?auto_71384 ) ) ( not ( = ?auto_71381 ?auto_71385 ) ) ( not ( = ?auto_71381 ?auto_71386 ) ) ( not ( = ?auto_71382 ?auto_71383 ) ) ( not ( = ?auto_71382 ?auto_71384 ) ) ( not ( = ?auto_71382 ?auto_71385 ) ) ( not ( = ?auto_71382 ?auto_71386 ) ) ( not ( = ?auto_71383 ?auto_71384 ) ) ( not ( = ?auto_71383 ?auto_71385 ) ) ( not ( = ?auto_71383 ?auto_71386 ) ) ( not ( = ?auto_71384 ?auto_71385 ) ) ( not ( = ?auto_71384 ?auto_71386 ) ) ( not ( = ?auto_71385 ?auto_71386 ) ) ( ON-TABLE ?auto_71386 ) ( ON ?auto_71385 ?auto_71386 ) ( ON ?auto_71384 ?auto_71385 ) ( ON ?auto_71383 ?auto_71384 ) ( ON ?auto_71382 ?auto_71383 ) ( ON ?auto_71381 ?auto_71382 ) ( CLEAR ?auto_71381 ) ( ON ?auto_71380 ?auto_71387 ) ( CLEAR ?auto_71380 ) ( HAND-EMPTY ) ( not ( = ?auto_71380 ?auto_71387 ) ) ( not ( = ?auto_71381 ?auto_71387 ) ) ( not ( = ?auto_71382 ?auto_71387 ) ) ( not ( = ?auto_71383 ?auto_71387 ) ) ( not ( = ?auto_71384 ?auto_71387 ) ) ( not ( = ?auto_71385 ?auto_71387 ) ) ( not ( = ?auto_71386 ?auto_71387 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71380 ?auto_71387 )
      ( MAKE-7PILE ?auto_71380 ?auto_71381 ?auto_71382 ?auto_71383 ?auto_71384 ?auto_71385 ?auto_71386 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71388 - BLOCK
      ?auto_71389 - BLOCK
      ?auto_71390 - BLOCK
      ?auto_71391 - BLOCK
      ?auto_71392 - BLOCK
      ?auto_71393 - BLOCK
      ?auto_71394 - BLOCK
    )
    :vars
    (
      ?auto_71395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71388 ?auto_71389 ) ) ( not ( = ?auto_71388 ?auto_71390 ) ) ( not ( = ?auto_71388 ?auto_71391 ) ) ( not ( = ?auto_71388 ?auto_71392 ) ) ( not ( = ?auto_71388 ?auto_71393 ) ) ( not ( = ?auto_71388 ?auto_71394 ) ) ( not ( = ?auto_71389 ?auto_71390 ) ) ( not ( = ?auto_71389 ?auto_71391 ) ) ( not ( = ?auto_71389 ?auto_71392 ) ) ( not ( = ?auto_71389 ?auto_71393 ) ) ( not ( = ?auto_71389 ?auto_71394 ) ) ( not ( = ?auto_71390 ?auto_71391 ) ) ( not ( = ?auto_71390 ?auto_71392 ) ) ( not ( = ?auto_71390 ?auto_71393 ) ) ( not ( = ?auto_71390 ?auto_71394 ) ) ( not ( = ?auto_71391 ?auto_71392 ) ) ( not ( = ?auto_71391 ?auto_71393 ) ) ( not ( = ?auto_71391 ?auto_71394 ) ) ( not ( = ?auto_71392 ?auto_71393 ) ) ( not ( = ?auto_71392 ?auto_71394 ) ) ( not ( = ?auto_71393 ?auto_71394 ) ) ( ON-TABLE ?auto_71394 ) ( ON ?auto_71393 ?auto_71394 ) ( ON ?auto_71392 ?auto_71393 ) ( ON ?auto_71391 ?auto_71392 ) ( ON ?auto_71390 ?auto_71391 ) ( ON ?auto_71388 ?auto_71395 ) ( CLEAR ?auto_71388 ) ( not ( = ?auto_71388 ?auto_71395 ) ) ( not ( = ?auto_71389 ?auto_71395 ) ) ( not ( = ?auto_71390 ?auto_71395 ) ) ( not ( = ?auto_71391 ?auto_71395 ) ) ( not ( = ?auto_71392 ?auto_71395 ) ) ( not ( = ?auto_71393 ?auto_71395 ) ) ( not ( = ?auto_71394 ?auto_71395 ) ) ( HOLDING ?auto_71389 ) ( CLEAR ?auto_71390 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71394 ?auto_71393 ?auto_71392 ?auto_71391 ?auto_71390 ?auto_71389 )
      ( MAKE-7PILE ?auto_71388 ?auto_71389 ?auto_71390 ?auto_71391 ?auto_71392 ?auto_71393 ?auto_71394 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71396 - BLOCK
      ?auto_71397 - BLOCK
      ?auto_71398 - BLOCK
      ?auto_71399 - BLOCK
      ?auto_71400 - BLOCK
      ?auto_71401 - BLOCK
      ?auto_71402 - BLOCK
    )
    :vars
    (
      ?auto_71403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71396 ?auto_71397 ) ) ( not ( = ?auto_71396 ?auto_71398 ) ) ( not ( = ?auto_71396 ?auto_71399 ) ) ( not ( = ?auto_71396 ?auto_71400 ) ) ( not ( = ?auto_71396 ?auto_71401 ) ) ( not ( = ?auto_71396 ?auto_71402 ) ) ( not ( = ?auto_71397 ?auto_71398 ) ) ( not ( = ?auto_71397 ?auto_71399 ) ) ( not ( = ?auto_71397 ?auto_71400 ) ) ( not ( = ?auto_71397 ?auto_71401 ) ) ( not ( = ?auto_71397 ?auto_71402 ) ) ( not ( = ?auto_71398 ?auto_71399 ) ) ( not ( = ?auto_71398 ?auto_71400 ) ) ( not ( = ?auto_71398 ?auto_71401 ) ) ( not ( = ?auto_71398 ?auto_71402 ) ) ( not ( = ?auto_71399 ?auto_71400 ) ) ( not ( = ?auto_71399 ?auto_71401 ) ) ( not ( = ?auto_71399 ?auto_71402 ) ) ( not ( = ?auto_71400 ?auto_71401 ) ) ( not ( = ?auto_71400 ?auto_71402 ) ) ( not ( = ?auto_71401 ?auto_71402 ) ) ( ON-TABLE ?auto_71402 ) ( ON ?auto_71401 ?auto_71402 ) ( ON ?auto_71400 ?auto_71401 ) ( ON ?auto_71399 ?auto_71400 ) ( ON ?auto_71398 ?auto_71399 ) ( ON ?auto_71396 ?auto_71403 ) ( not ( = ?auto_71396 ?auto_71403 ) ) ( not ( = ?auto_71397 ?auto_71403 ) ) ( not ( = ?auto_71398 ?auto_71403 ) ) ( not ( = ?auto_71399 ?auto_71403 ) ) ( not ( = ?auto_71400 ?auto_71403 ) ) ( not ( = ?auto_71401 ?auto_71403 ) ) ( not ( = ?auto_71402 ?auto_71403 ) ) ( CLEAR ?auto_71398 ) ( ON ?auto_71397 ?auto_71396 ) ( CLEAR ?auto_71397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71403 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71403 ?auto_71396 )
      ( MAKE-7PILE ?auto_71396 ?auto_71397 ?auto_71398 ?auto_71399 ?auto_71400 ?auto_71401 ?auto_71402 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71404 - BLOCK
      ?auto_71405 - BLOCK
      ?auto_71406 - BLOCK
      ?auto_71407 - BLOCK
      ?auto_71408 - BLOCK
      ?auto_71409 - BLOCK
      ?auto_71410 - BLOCK
    )
    :vars
    (
      ?auto_71411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71404 ?auto_71405 ) ) ( not ( = ?auto_71404 ?auto_71406 ) ) ( not ( = ?auto_71404 ?auto_71407 ) ) ( not ( = ?auto_71404 ?auto_71408 ) ) ( not ( = ?auto_71404 ?auto_71409 ) ) ( not ( = ?auto_71404 ?auto_71410 ) ) ( not ( = ?auto_71405 ?auto_71406 ) ) ( not ( = ?auto_71405 ?auto_71407 ) ) ( not ( = ?auto_71405 ?auto_71408 ) ) ( not ( = ?auto_71405 ?auto_71409 ) ) ( not ( = ?auto_71405 ?auto_71410 ) ) ( not ( = ?auto_71406 ?auto_71407 ) ) ( not ( = ?auto_71406 ?auto_71408 ) ) ( not ( = ?auto_71406 ?auto_71409 ) ) ( not ( = ?auto_71406 ?auto_71410 ) ) ( not ( = ?auto_71407 ?auto_71408 ) ) ( not ( = ?auto_71407 ?auto_71409 ) ) ( not ( = ?auto_71407 ?auto_71410 ) ) ( not ( = ?auto_71408 ?auto_71409 ) ) ( not ( = ?auto_71408 ?auto_71410 ) ) ( not ( = ?auto_71409 ?auto_71410 ) ) ( ON-TABLE ?auto_71410 ) ( ON ?auto_71409 ?auto_71410 ) ( ON ?auto_71408 ?auto_71409 ) ( ON ?auto_71407 ?auto_71408 ) ( ON ?auto_71404 ?auto_71411 ) ( not ( = ?auto_71404 ?auto_71411 ) ) ( not ( = ?auto_71405 ?auto_71411 ) ) ( not ( = ?auto_71406 ?auto_71411 ) ) ( not ( = ?auto_71407 ?auto_71411 ) ) ( not ( = ?auto_71408 ?auto_71411 ) ) ( not ( = ?auto_71409 ?auto_71411 ) ) ( not ( = ?auto_71410 ?auto_71411 ) ) ( ON ?auto_71405 ?auto_71404 ) ( CLEAR ?auto_71405 ) ( ON-TABLE ?auto_71411 ) ( HOLDING ?auto_71406 ) ( CLEAR ?auto_71407 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71410 ?auto_71409 ?auto_71408 ?auto_71407 ?auto_71406 )
      ( MAKE-7PILE ?auto_71404 ?auto_71405 ?auto_71406 ?auto_71407 ?auto_71408 ?auto_71409 ?auto_71410 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71412 - BLOCK
      ?auto_71413 - BLOCK
      ?auto_71414 - BLOCK
      ?auto_71415 - BLOCK
      ?auto_71416 - BLOCK
      ?auto_71417 - BLOCK
      ?auto_71418 - BLOCK
    )
    :vars
    (
      ?auto_71419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71412 ?auto_71413 ) ) ( not ( = ?auto_71412 ?auto_71414 ) ) ( not ( = ?auto_71412 ?auto_71415 ) ) ( not ( = ?auto_71412 ?auto_71416 ) ) ( not ( = ?auto_71412 ?auto_71417 ) ) ( not ( = ?auto_71412 ?auto_71418 ) ) ( not ( = ?auto_71413 ?auto_71414 ) ) ( not ( = ?auto_71413 ?auto_71415 ) ) ( not ( = ?auto_71413 ?auto_71416 ) ) ( not ( = ?auto_71413 ?auto_71417 ) ) ( not ( = ?auto_71413 ?auto_71418 ) ) ( not ( = ?auto_71414 ?auto_71415 ) ) ( not ( = ?auto_71414 ?auto_71416 ) ) ( not ( = ?auto_71414 ?auto_71417 ) ) ( not ( = ?auto_71414 ?auto_71418 ) ) ( not ( = ?auto_71415 ?auto_71416 ) ) ( not ( = ?auto_71415 ?auto_71417 ) ) ( not ( = ?auto_71415 ?auto_71418 ) ) ( not ( = ?auto_71416 ?auto_71417 ) ) ( not ( = ?auto_71416 ?auto_71418 ) ) ( not ( = ?auto_71417 ?auto_71418 ) ) ( ON-TABLE ?auto_71418 ) ( ON ?auto_71417 ?auto_71418 ) ( ON ?auto_71416 ?auto_71417 ) ( ON ?auto_71415 ?auto_71416 ) ( ON ?auto_71412 ?auto_71419 ) ( not ( = ?auto_71412 ?auto_71419 ) ) ( not ( = ?auto_71413 ?auto_71419 ) ) ( not ( = ?auto_71414 ?auto_71419 ) ) ( not ( = ?auto_71415 ?auto_71419 ) ) ( not ( = ?auto_71416 ?auto_71419 ) ) ( not ( = ?auto_71417 ?auto_71419 ) ) ( not ( = ?auto_71418 ?auto_71419 ) ) ( ON ?auto_71413 ?auto_71412 ) ( ON-TABLE ?auto_71419 ) ( CLEAR ?auto_71415 ) ( ON ?auto_71414 ?auto_71413 ) ( CLEAR ?auto_71414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71419 ?auto_71412 ?auto_71413 )
      ( MAKE-7PILE ?auto_71412 ?auto_71413 ?auto_71414 ?auto_71415 ?auto_71416 ?auto_71417 ?auto_71418 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71420 - BLOCK
      ?auto_71421 - BLOCK
      ?auto_71422 - BLOCK
      ?auto_71423 - BLOCK
      ?auto_71424 - BLOCK
      ?auto_71425 - BLOCK
      ?auto_71426 - BLOCK
    )
    :vars
    (
      ?auto_71427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71420 ?auto_71421 ) ) ( not ( = ?auto_71420 ?auto_71422 ) ) ( not ( = ?auto_71420 ?auto_71423 ) ) ( not ( = ?auto_71420 ?auto_71424 ) ) ( not ( = ?auto_71420 ?auto_71425 ) ) ( not ( = ?auto_71420 ?auto_71426 ) ) ( not ( = ?auto_71421 ?auto_71422 ) ) ( not ( = ?auto_71421 ?auto_71423 ) ) ( not ( = ?auto_71421 ?auto_71424 ) ) ( not ( = ?auto_71421 ?auto_71425 ) ) ( not ( = ?auto_71421 ?auto_71426 ) ) ( not ( = ?auto_71422 ?auto_71423 ) ) ( not ( = ?auto_71422 ?auto_71424 ) ) ( not ( = ?auto_71422 ?auto_71425 ) ) ( not ( = ?auto_71422 ?auto_71426 ) ) ( not ( = ?auto_71423 ?auto_71424 ) ) ( not ( = ?auto_71423 ?auto_71425 ) ) ( not ( = ?auto_71423 ?auto_71426 ) ) ( not ( = ?auto_71424 ?auto_71425 ) ) ( not ( = ?auto_71424 ?auto_71426 ) ) ( not ( = ?auto_71425 ?auto_71426 ) ) ( ON-TABLE ?auto_71426 ) ( ON ?auto_71425 ?auto_71426 ) ( ON ?auto_71424 ?auto_71425 ) ( ON ?auto_71420 ?auto_71427 ) ( not ( = ?auto_71420 ?auto_71427 ) ) ( not ( = ?auto_71421 ?auto_71427 ) ) ( not ( = ?auto_71422 ?auto_71427 ) ) ( not ( = ?auto_71423 ?auto_71427 ) ) ( not ( = ?auto_71424 ?auto_71427 ) ) ( not ( = ?auto_71425 ?auto_71427 ) ) ( not ( = ?auto_71426 ?auto_71427 ) ) ( ON ?auto_71421 ?auto_71420 ) ( ON-TABLE ?auto_71427 ) ( ON ?auto_71422 ?auto_71421 ) ( CLEAR ?auto_71422 ) ( HOLDING ?auto_71423 ) ( CLEAR ?auto_71424 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71426 ?auto_71425 ?auto_71424 ?auto_71423 )
      ( MAKE-7PILE ?auto_71420 ?auto_71421 ?auto_71422 ?auto_71423 ?auto_71424 ?auto_71425 ?auto_71426 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71428 - BLOCK
      ?auto_71429 - BLOCK
      ?auto_71430 - BLOCK
      ?auto_71431 - BLOCK
      ?auto_71432 - BLOCK
      ?auto_71433 - BLOCK
      ?auto_71434 - BLOCK
    )
    :vars
    (
      ?auto_71435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71428 ?auto_71429 ) ) ( not ( = ?auto_71428 ?auto_71430 ) ) ( not ( = ?auto_71428 ?auto_71431 ) ) ( not ( = ?auto_71428 ?auto_71432 ) ) ( not ( = ?auto_71428 ?auto_71433 ) ) ( not ( = ?auto_71428 ?auto_71434 ) ) ( not ( = ?auto_71429 ?auto_71430 ) ) ( not ( = ?auto_71429 ?auto_71431 ) ) ( not ( = ?auto_71429 ?auto_71432 ) ) ( not ( = ?auto_71429 ?auto_71433 ) ) ( not ( = ?auto_71429 ?auto_71434 ) ) ( not ( = ?auto_71430 ?auto_71431 ) ) ( not ( = ?auto_71430 ?auto_71432 ) ) ( not ( = ?auto_71430 ?auto_71433 ) ) ( not ( = ?auto_71430 ?auto_71434 ) ) ( not ( = ?auto_71431 ?auto_71432 ) ) ( not ( = ?auto_71431 ?auto_71433 ) ) ( not ( = ?auto_71431 ?auto_71434 ) ) ( not ( = ?auto_71432 ?auto_71433 ) ) ( not ( = ?auto_71432 ?auto_71434 ) ) ( not ( = ?auto_71433 ?auto_71434 ) ) ( ON-TABLE ?auto_71434 ) ( ON ?auto_71433 ?auto_71434 ) ( ON ?auto_71432 ?auto_71433 ) ( ON ?auto_71428 ?auto_71435 ) ( not ( = ?auto_71428 ?auto_71435 ) ) ( not ( = ?auto_71429 ?auto_71435 ) ) ( not ( = ?auto_71430 ?auto_71435 ) ) ( not ( = ?auto_71431 ?auto_71435 ) ) ( not ( = ?auto_71432 ?auto_71435 ) ) ( not ( = ?auto_71433 ?auto_71435 ) ) ( not ( = ?auto_71434 ?auto_71435 ) ) ( ON ?auto_71429 ?auto_71428 ) ( ON-TABLE ?auto_71435 ) ( ON ?auto_71430 ?auto_71429 ) ( CLEAR ?auto_71432 ) ( ON ?auto_71431 ?auto_71430 ) ( CLEAR ?auto_71431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71435 ?auto_71428 ?auto_71429 ?auto_71430 )
      ( MAKE-7PILE ?auto_71428 ?auto_71429 ?auto_71430 ?auto_71431 ?auto_71432 ?auto_71433 ?auto_71434 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71436 - BLOCK
      ?auto_71437 - BLOCK
      ?auto_71438 - BLOCK
      ?auto_71439 - BLOCK
      ?auto_71440 - BLOCK
      ?auto_71441 - BLOCK
      ?auto_71442 - BLOCK
    )
    :vars
    (
      ?auto_71443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71436 ?auto_71437 ) ) ( not ( = ?auto_71436 ?auto_71438 ) ) ( not ( = ?auto_71436 ?auto_71439 ) ) ( not ( = ?auto_71436 ?auto_71440 ) ) ( not ( = ?auto_71436 ?auto_71441 ) ) ( not ( = ?auto_71436 ?auto_71442 ) ) ( not ( = ?auto_71437 ?auto_71438 ) ) ( not ( = ?auto_71437 ?auto_71439 ) ) ( not ( = ?auto_71437 ?auto_71440 ) ) ( not ( = ?auto_71437 ?auto_71441 ) ) ( not ( = ?auto_71437 ?auto_71442 ) ) ( not ( = ?auto_71438 ?auto_71439 ) ) ( not ( = ?auto_71438 ?auto_71440 ) ) ( not ( = ?auto_71438 ?auto_71441 ) ) ( not ( = ?auto_71438 ?auto_71442 ) ) ( not ( = ?auto_71439 ?auto_71440 ) ) ( not ( = ?auto_71439 ?auto_71441 ) ) ( not ( = ?auto_71439 ?auto_71442 ) ) ( not ( = ?auto_71440 ?auto_71441 ) ) ( not ( = ?auto_71440 ?auto_71442 ) ) ( not ( = ?auto_71441 ?auto_71442 ) ) ( ON-TABLE ?auto_71442 ) ( ON ?auto_71441 ?auto_71442 ) ( ON ?auto_71436 ?auto_71443 ) ( not ( = ?auto_71436 ?auto_71443 ) ) ( not ( = ?auto_71437 ?auto_71443 ) ) ( not ( = ?auto_71438 ?auto_71443 ) ) ( not ( = ?auto_71439 ?auto_71443 ) ) ( not ( = ?auto_71440 ?auto_71443 ) ) ( not ( = ?auto_71441 ?auto_71443 ) ) ( not ( = ?auto_71442 ?auto_71443 ) ) ( ON ?auto_71437 ?auto_71436 ) ( ON-TABLE ?auto_71443 ) ( ON ?auto_71438 ?auto_71437 ) ( ON ?auto_71439 ?auto_71438 ) ( CLEAR ?auto_71439 ) ( HOLDING ?auto_71440 ) ( CLEAR ?auto_71441 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71442 ?auto_71441 ?auto_71440 )
      ( MAKE-7PILE ?auto_71436 ?auto_71437 ?auto_71438 ?auto_71439 ?auto_71440 ?auto_71441 ?auto_71442 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71444 - BLOCK
      ?auto_71445 - BLOCK
      ?auto_71446 - BLOCK
      ?auto_71447 - BLOCK
      ?auto_71448 - BLOCK
      ?auto_71449 - BLOCK
      ?auto_71450 - BLOCK
    )
    :vars
    (
      ?auto_71451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71444 ?auto_71445 ) ) ( not ( = ?auto_71444 ?auto_71446 ) ) ( not ( = ?auto_71444 ?auto_71447 ) ) ( not ( = ?auto_71444 ?auto_71448 ) ) ( not ( = ?auto_71444 ?auto_71449 ) ) ( not ( = ?auto_71444 ?auto_71450 ) ) ( not ( = ?auto_71445 ?auto_71446 ) ) ( not ( = ?auto_71445 ?auto_71447 ) ) ( not ( = ?auto_71445 ?auto_71448 ) ) ( not ( = ?auto_71445 ?auto_71449 ) ) ( not ( = ?auto_71445 ?auto_71450 ) ) ( not ( = ?auto_71446 ?auto_71447 ) ) ( not ( = ?auto_71446 ?auto_71448 ) ) ( not ( = ?auto_71446 ?auto_71449 ) ) ( not ( = ?auto_71446 ?auto_71450 ) ) ( not ( = ?auto_71447 ?auto_71448 ) ) ( not ( = ?auto_71447 ?auto_71449 ) ) ( not ( = ?auto_71447 ?auto_71450 ) ) ( not ( = ?auto_71448 ?auto_71449 ) ) ( not ( = ?auto_71448 ?auto_71450 ) ) ( not ( = ?auto_71449 ?auto_71450 ) ) ( ON-TABLE ?auto_71450 ) ( ON ?auto_71449 ?auto_71450 ) ( ON ?auto_71444 ?auto_71451 ) ( not ( = ?auto_71444 ?auto_71451 ) ) ( not ( = ?auto_71445 ?auto_71451 ) ) ( not ( = ?auto_71446 ?auto_71451 ) ) ( not ( = ?auto_71447 ?auto_71451 ) ) ( not ( = ?auto_71448 ?auto_71451 ) ) ( not ( = ?auto_71449 ?auto_71451 ) ) ( not ( = ?auto_71450 ?auto_71451 ) ) ( ON ?auto_71445 ?auto_71444 ) ( ON-TABLE ?auto_71451 ) ( ON ?auto_71446 ?auto_71445 ) ( ON ?auto_71447 ?auto_71446 ) ( CLEAR ?auto_71449 ) ( ON ?auto_71448 ?auto_71447 ) ( CLEAR ?auto_71448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71451 ?auto_71444 ?auto_71445 ?auto_71446 ?auto_71447 )
      ( MAKE-7PILE ?auto_71444 ?auto_71445 ?auto_71446 ?auto_71447 ?auto_71448 ?auto_71449 ?auto_71450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71452 - BLOCK
      ?auto_71453 - BLOCK
      ?auto_71454 - BLOCK
      ?auto_71455 - BLOCK
      ?auto_71456 - BLOCK
      ?auto_71457 - BLOCK
      ?auto_71458 - BLOCK
    )
    :vars
    (
      ?auto_71459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71452 ?auto_71453 ) ) ( not ( = ?auto_71452 ?auto_71454 ) ) ( not ( = ?auto_71452 ?auto_71455 ) ) ( not ( = ?auto_71452 ?auto_71456 ) ) ( not ( = ?auto_71452 ?auto_71457 ) ) ( not ( = ?auto_71452 ?auto_71458 ) ) ( not ( = ?auto_71453 ?auto_71454 ) ) ( not ( = ?auto_71453 ?auto_71455 ) ) ( not ( = ?auto_71453 ?auto_71456 ) ) ( not ( = ?auto_71453 ?auto_71457 ) ) ( not ( = ?auto_71453 ?auto_71458 ) ) ( not ( = ?auto_71454 ?auto_71455 ) ) ( not ( = ?auto_71454 ?auto_71456 ) ) ( not ( = ?auto_71454 ?auto_71457 ) ) ( not ( = ?auto_71454 ?auto_71458 ) ) ( not ( = ?auto_71455 ?auto_71456 ) ) ( not ( = ?auto_71455 ?auto_71457 ) ) ( not ( = ?auto_71455 ?auto_71458 ) ) ( not ( = ?auto_71456 ?auto_71457 ) ) ( not ( = ?auto_71456 ?auto_71458 ) ) ( not ( = ?auto_71457 ?auto_71458 ) ) ( ON-TABLE ?auto_71458 ) ( ON ?auto_71452 ?auto_71459 ) ( not ( = ?auto_71452 ?auto_71459 ) ) ( not ( = ?auto_71453 ?auto_71459 ) ) ( not ( = ?auto_71454 ?auto_71459 ) ) ( not ( = ?auto_71455 ?auto_71459 ) ) ( not ( = ?auto_71456 ?auto_71459 ) ) ( not ( = ?auto_71457 ?auto_71459 ) ) ( not ( = ?auto_71458 ?auto_71459 ) ) ( ON ?auto_71453 ?auto_71452 ) ( ON-TABLE ?auto_71459 ) ( ON ?auto_71454 ?auto_71453 ) ( ON ?auto_71455 ?auto_71454 ) ( ON ?auto_71456 ?auto_71455 ) ( CLEAR ?auto_71456 ) ( HOLDING ?auto_71457 ) ( CLEAR ?auto_71458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71458 ?auto_71457 )
      ( MAKE-7PILE ?auto_71452 ?auto_71453 ?auto_71454 ?auto_71455 ?auto_71456 ?auto_71457 ?auto_71458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71460 - BLOCK
      ?auto_71461 - BLOCK
      ?auto_71462 - BLOCK
      ?auto_71463 - BLOCK
      ?auto_71464 - BLOCK
      ?auto_71465 - BLOCK
      ?auto_71466 - BLOCK
    )
    :vars
    (
      ?auto_71467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71460 ?auto_71461 ) ) ( not ( = ?auto_71460 ?auto_71462 ) ) ( not ( = ?auto_71460 ?auto_71463 ) ) ( not ( = ?auto_71460 ?auto_71464 ) ) ( not ( = ?auto_71460 ?auto_71465 ) ) ( not ( = ?auto_71460 ?auto_71466 ) ) ( not ( = ?auto_71461 ?auto_71462 ) ) ( not ( = ?auto_71461 ?auto_71463 ) ) ( not ( = ?auto_71461 ?auto_71464 ) ) ( not ( = ?auto_71461 ?auto_71465 ) ) ( not ( = ?auto_71461 ?auto_71466 ) ) ( not ( = ?auto_71462 ?auto_71463 ) ) ( not ( = ?auto_71462 ?auto_71464 ) ) ( not ( = ?auto_71462 ?auto_71465 ) ) ( not ( = ?auto_71462 ?auto_71466 ) ) ( not ( = ?auto_71463 ?auto_71464 ) ) ( not ( = ?auto_71463 ?auto_71465 ) ) ( not ( = ?auto_71463 ?auto_71466 ) ) ( not ( = ?auto_71464 ?auto_71465 ) ) ( not ( = ?auto_71464 ?auto_71466 ) ) ( not ( = ?auto_71465 ?auto_71466 ) ) ( ON-TABLE ?auto_71466 ) ( ON ?auto_71460 ?auto_71467 ) ( not ( = ?auto_71460 ?auto_71467 ) ) ( not ( = ?auto_71461 ?auto_71467 ) ) ( not ( = ?auto_71462 ?auto_71467 ) ) ( not ( = ?auto_71463 ?auto_71467 ) ) ( not ( = ?auto_71464 ?auto_71467 ) ) ( not ( = ?auto_71465 ?auto_71467 ) ) ( not ( = ?auto_71466 ?auto_71467 ) ) ( ON ?auto_71461 ?auto_71460 ) ( ON-TABLE ?auto_71467 ) ( ON ?auto_71462 ?auto_71461 ) ( ON ?auto_71463 ?auto_71462 ) ( ON ?auto_71464 ?auto_71463 ) ( CLEAR ?auto_71466 ) ( ON ?auto_71465 ?auto_71464 ) ( CLEAR ?auto_71465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71467 ?auto_71460 ?auto_71461 ?auto_71462 ?auto_71463 ?auto_71464 )
      ( MAKE-7PILE ?auto_71460 ?auto_71461 ?auto_71462 ?auto_71463 ?auto_71464 ?auto_71465 ?auto_71466 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71468 - BLOCK
      ?auto_71469 - BLOCK
      ?auto_71470 - BLOCK
      ?auto_71471 - BLOCK
      ?auto_71472 - BLOCK
      ?auto_71473 - BLOCK
      ?auto_71474 - BLOCK
    )
    :vars
    (
      ?auto_71475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71468 ?auto_71469 ) ) ( not ( = ?auto_71468 ?auto_71470 ) ) ( not ( = ?auto_71468 ?auto_71471 ) ) ( not ( = ?auto_71468 ?auto_71472 ) ) ( not ( = ?auto_71468 ?auto_71473 ) ) ( not ( = ?auto_71468 ?auto_71474 ) ) ( not ( = ?auto_71469 ?auto_71470 ) ) ( not ( = ?auto_71469 ?auto_71471 ) ) ( not ( = ?auto_71469 ?auto_71472 ) ) ( not ( = ?auto_71469 ?auto_71473 ) ) ( not ( = ?auto_71469 ?auto_71474 ) ) ( not ( = ?auto_71470 ?auto_71471 ) ) ( not ( = ?auto_71470 ?auto_71472 ) ) ( not ( = ?auto_71470 ?auto_71473 ) ) ( not ( = ?auto_71470 ?auto_71474 ) ) ( not ( = ?auto_71471 ?auto_71472 ) ) ( not ( = ?auto_71471 ?auto_71473 ) ) ( not ( = ?auto_71471 ?auto_71474 ) ) ( not ( = ?auto_71472 ?auto_71473 ) ) ( not ( = ?auto_71472 ?auto_71474 ) ) ( not ( = ?auto_71473 ?auto_71474 ) ) ( ON ?auto_71468 ?auto_71475 ) ( not ( = ?auto_71468 ?auto_71475 ) ) ( not ( = ?auto_71469 ?auto_71475 ) ) ( not ( = ?auto_71470 ?auto_71475 ) ) ( not ( = ?auto_71471 ?auto_71475 ) ) ( not ( = ?auto_71472 ?auto_71475 ) ) ( not ( = ?auto_71473 ?auto_71475 ) ) ( not ( = ?auto_71474 ?auto_71475 ) ) ( ON ?auto_71469 ?auto_71468 ) ( ON-TABLE ?auto_71475 ) ( ON ?auto_71470 ?auto_71469 ) ( ON ?auto_71471 ?auto_71470 ) ( ON ?auto_71472 ?auto_71471 ) ( ON ?auto_71473 ?auto_71472 ) ( CLEAR ?auto_71473 ) ( HOLDING ?auto_71474 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71474 )
      ( MAKE-7PILE ?auto_71468 ?auto_71469 ?auto_71470 ?auto_71471 ?auto_71472 ?auto_71473 ?auto_71474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71476 - BLOCK
      ?auto_71477 - BLOCK
      ?auto_71478 - BLOCK
      ?auto_71479 - BLOCK
      ?auto_71480 - BLOCK
      ?auto_71481 - BLOCK
      ?auto_71482 - BLOCK
    )
    :vars
    (
      ?auto_71483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71476 ?auto_71477 ) ) ( not ( = ?auto_71476 ?auto_71478 ) ) ( not ( = ?auto_71476 ?auto_71479 ) ) ( not ( = ?auto_71476 ?auto_71480 ) ) ( not ( = ?auto_71476 ?auto_71481 ) ) ( not ( = ?auto_71476 ?auto_71482 ) ) ( not ( = ?auto_71477 ?auto_71478 ) ) ( not ( = ?auto_71477 ?auto_71479 ) ) ( not ( = ?auto_71477 ?auto_71480 ) ) ( not ( = ?auto_71477 ?auto_71481 ) ) ( not ( = ?auto_71477 ?auto_71482 ) ) ( not ( = ?auto_71478 ?auto_71479 ) ) ( not ( = ?auto_71478 ?auto_71480 ) ) ( not ( = ?auto_71478 ?auto_71481 ) ) ( not ( = ?auto_71478 ?auto_71482 ) ) ( not ( = ?auto_71479 ?auto_71480 ) ) ( not ( = ?auto_71479 ?auto_71481 ) ) ( not ( = ?auto_71479 ?auto_71482 ) ) ( not ( = ?auto_71480 ?auto_71481 ) ) ( not ( = ?auto_71480 ?auto_71482 ) ) ( not ( = ?auto_71481 ?auto_71482 ) ) ( ON ?auto_71476 ?auto_71483 ) ( not ( = ?auto_71476 ?auto_71483 ) ) ( not ( = ?auto_71477 ?auto_71483 ) ) ( not ( = ?auto_71478 ?auto_71483 ) ) ( not ( = ?auto_71479 ?auto_71483 ) ) ( not ( = ?auto_71480 ?auto_71483 ) ) ( not ( = ?auto_71481 ?auto_71483 ) ) ( not ( = ?auto_71482 ?auto_71483 ) ) ( ON ?auto_71477 ?auto_71476 ) ( ON-TABLE ?auto_71483 ) ( ON ?auto_71478 ?auto_71477 ) ( ON ?auto_71479 ?auto_71478 ) ( ON ?auto_71480 ?auto_71479 ) ( ON ?auto_71481 ?auto_71480 ) ( ON ?auto_71482 ?auto_71481 ) ( CLEAR ?auto_71482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71483 ?auto_71476 ?auto_71477 ?auto_71478 ?auto_71479 ?auto_71480 ?auto_71481 )
      ( MAKE-7PILE ?auto_71476 ?auto_71477 ?auto_71478 ?auto_71479 ?auto_71480 ?auto_71481 ?auto_71482 ) )
  )

)

