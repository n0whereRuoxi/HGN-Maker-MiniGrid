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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13969 - BLOCK
      ?auto_13970 - BLOCK
      ?auto_13971 - BLOCK
      ?auto_13972 - BLOCK
    )
    :vars
    (
      ?auto_13973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13973 ?auto_13972 ) ( CLEAR ?auto_13973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13969 ) ( ON ?auto_13970 ?auto_13969 ) ( ON ?auto_13971 ?auto_13970 ) ( ON ?auto_13972 ?auto_13971 ) ( not ( = ?auto_13969 ?auto_13970 ) ) ( not ( = ?auto_13969 ?auto_13971 ) ) ( not ( = ?auto_13969 ?auto_13972 ) ) ( not ( = ?auto_13969 ?auto_13973 ) ) ( not ( = ?auto_13970 ?auto_13971 ) ) ( not ( = ?auto_13970 ?auto_13972 ) ) ( not ( = ?auto_13970 ?auto_13973 ) ) ( not ( = ?auto_13971 ?auto_13972 ) ) ( not ( = ?auto_13971 ?auto_13973 ) ) ( not ( = ?auto_13972 ?auto_13973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13973 ?auto_13972 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13975 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13975 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13976 - BLOCK
    )
    :vars
    (
      ?auto_13977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13976 ?auto_13977 ) ( CLEAR ?auto_13976 ) ( HAND-EMPTY ) ( not ( = ?auto_13976 ?auto_13977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13976 ?auto_13977 )
      ( MAKE-1PILE ?auto_13976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13981 - BLOCK
      ?auto_13982 - BLOCK
      ?auto_13983 - BLOCK
    )
    :vars
    (
      ?auto_13984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13984 ?auto_13983 ) ( CLEAR ?auto_13984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13981 ) ( ON ?auto_13982 ?auto_13981 ) ( ON ?auto_13983 ?auto_13982 ) ( not ( = ?auto_13981 ?auto_13982 ) ) ( not ( = ?auto_13981 ?auto_13983 ) ) ( not ( = ?auto_13981 ?auto_13984 ) ) ( not ( = ?auto_13982 ?auto_13983 ) ) ( not ( = ?auto_13982 ?auto_13984 ) ) ( not ( = ?auto_13983 ?auto_13984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13984 ?auto_13983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13985 - BLOCK
      ?auto_13986 - BLOCK
      ?auto_13987 - BLOCK
    )
    :vars
    (
      ?auto_13988 - BLOCK
      ?auto_13989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13988 ?auto_13987 ) ( CLEAR ?auto_13988 ) ( ON-TABLE ?auto_13985 ) ( ON ?auto_13986 ?auto_13985 ) ( ON ?auto_13987 ?auto_13986 ) ( not ( = ?auto_13985 ?auto_13986 ) ) ( not ( = ?auto_13985 ?auto_13987 ) ) ( not ( = ?auto_13985 ?auto_13988 ) ) ( not ( = ?auto_13986 ?auto_13987 ) ) ( not ( = ?auto_13986 ?auto_13988 ) ) ( not ( = ?auto_13987 ?auto_13988 ) ) ( HOLDING ?auto_13989 ) ( not ( = ?auto_13985 ?auto_13989 ) ) ( not ( = ?auto_13986 ?auto_13989 ) ) ( not ( = ?auto_13987 ?auto_13989 ) ) ( not ( = ?auto_13988 ?auto_13989 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13989 )
      ( MAKE-3PILE ?auto_13985 ?auto_13986 ?auto_13987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13990 - BLOCK
      ?auto_13991 - BLOCK
      ?auto_13992 - BLOCK
    )
    :vars
    (
      ?auto_13994 - BLOCK
      ?auto_13993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13994 ?auto_13992 ) ( ON-TABLE ?auto_13990 ) ( ON ?auto_13991 ?auto_13990 ) ( ON ?auto_13992 ?auto_13991 ) ( not ( = ?auto_13990 ?auto_13991 ) ) ( not ( = ?auto_13990 ?auto_13992 ) ) ( not ( = ?auto_13990 ?auto_13994 ) ) ( not ( = ?auto_13991 ?auto_13992 ) ) ( not ( = ?auto_13991 ?auto_13994 ) ) ( not ( = ?auto_13992 ?auto_13994 ) ) ( not ( = ?auto_13990 ?auto_13993 ) ) ( not ( = ?auto_13991 ?auto_13993 ) ) ( not ( = ?auto_13992 ?auto_13993 ) ) ( not ( = ?auto_13994 ?auto_13993 ) ) ( ON ?auto_13993 ?auto_13994 ) ( CLEAR ?auto_13993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13990 ?auto_13991 ?auto_13992 ?auto_13994 )
      ( MAKE-3PILE ?auto_13990 ?auto_13991 ?auto_13992 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13997 - BLOCK
      ?auto_13998 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13998 ) ( CLEAR ?auto_13997 ) ( ON-TABLE ?auto_13997 ) ( not ( = ?auto_13997 ?auto_13998 ) ) )
    :subtasks
    ( ( !STACK ?auto_13998 ?auto_13997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13999 - BLOCK
      ?auto_14000 - BLOCK
    )
    :vars
    (
      ?auto_14001 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13999 ) ( ON-TABLE ?auto_13999 ) ( not ( = ?auto_13999 ?auto_14000 ) ) ( ON ?auto_14000 ?auto_14001 ) ( CLEAR ?auto_14000 ) ( HAND-EMPTY ) ( not ( = ?auto_13999 ?auto_14001 ) ) ( not ( = ?auto_14000 ?auto_14001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14000 ?auto_14001 )
      ( MAKE-2PILE ?auto_13999 ?auto_14000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14002 - BLOCK
      ?auto_14003 - BLOCK
    )
    :vars
    (
      ?auto_14004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14002 ?auto_14003 ) ) ( ON ?auto_14003 ?auto_14004 ) ( CLEAR ?auto_14003 ) ( not ( = ?auto_14002 ?auto_14004 ) ) ( not ( = ?auto_14003 ?auto_14004 ) ) ( HOLDING ?auto_14002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14002 )
      ( MAKE-2PILE ?auto_14002 ?auto_14003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14005 - BLOCK
      ?auto_14006 - BLOCK
    )
    :vars
    (
      ?auto_14007 - BLOCK
      ?auto_14009 - BLOCK
      ?auto_14008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14005 ?auto_14006 ) ) ( ON ?auto_14006 ?auto_14007 ) ( not ( = ?auto_14005 ?auto_14007 ) ) ( not ( = ?auto_14006 ?auto_14007 ) ) ( ON ?auto_14005 ?auto_14006 ) ( CLEAR ?auto_14005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14009 ) ( ON ?auto_14008 ?auto_14009 ) ( ON ?auto_14007 ?auto_14008 ) ( not ( = ?auto_14009 ?auto_14008 ) ) ( not ( = ?auto_14009 ?auto_14007 ) ) ( not ( = ?auto_14009 ?auto_14006 ) ) ( not ( = ?auto_14009 ?auto_14005 ) ) ( not ( = ?auto_14008 ?auto_14007 ) ) ( not ( = ?auto_14008 ?auto_14006 ) ) ( not ( = ?auto_14008 ?auto_14005 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14009 ?auto_14008 ?auto_14007 ?auto_14006 )
      ( MAKE-2PILE ?auto_14005 ?auto_14006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14012 - BLOCK
      ?auto_14013 - BLOCK
    )
    :vars
    (
      ?auto_14014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14014 ?auto_14013 ) ( CLEAR ?auto_14014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14012 ) ( ON ?auto_14013 ?auto_14012 ) ( not ( = ?auto_14012 ?auto_14013 ) ) ( not ( = ?auto_14012 ?auto_14014 ) ) ( not ( = ?auto_14013 ?auto_14014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14014 ?auto_14013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14015 - BLOCK
      ?auto_14016 - BLOCK
    )
    :vars
    (
      ?auto_14017 - BLOCK
      ?auto_14018 - BLOCK
      ?auto_14019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14017 ?auto_14016 ) ( CLEAR ?auto_14017 ) ( ON-TABLE ?auto_14015 ) ( ON ?auto_14016 ?auto_14015 ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14017 ) ) ( not ( = ?auto_14016 ?auto_14017 ) ) ( HOLDING ?auto_14018 ) ( CLEAR ?auto_14019 ) ( not ( = ?auto_14015 ?auto_14018 ) ) ( not ( = ?auto_14015 ?auto_14019 ) ) ( not ( = ?auto_14016 ?auto_14018 ) ) ( not ( = ?auto_14016 ?auto_14019 ) ) ( not ( = ?auto_14017 ?auto_14018 ) ) ( not ( = ?auto_14017 ?auto_14019 ) ) ( not ( = ?auto_14018 ?auto_14019 ) ) )
    :subtasks
    ( ( !STACK ?auto_14018 ?auto_14019 )
      ( MAKE-2PILE ?auto_14015 ?auto_14016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14020 - BLOCK
      ?auto_14021 - BLOCK
    )
    :vars
    (
      ?auto_14023 - BLOCK
      ?auto_14022 - BLOCK
      ?auto_14024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14023 ?auto_14021 ) ( ON-TABLE ?auto_14020 ) ( ON ?auto_14021 ?auto_14020 ) ( not ( = ?auto_14020 ?auto_14021 ) ) ( not ( = ?auto_14020 ?auto_14023 ) ) ( not ( = ?auto_14021 ?auto_14023 ) ) ( CLEAR ?auto_14022 ) ( not ( = ?auto_14020 ?auto_14024 ) ) ( not ( = ?auto_14020 ?auto_14022 ) ) ( not ( = ?auto_14021 ?auto_14024 ) ) ( not ( = ?auto_14021 ?auto_14022 ) ) ( not ( = ?auto_14023 ?auto_14024 ) ) ( not ( = ?auto_14023 ?auto_14022 ) ) ( not ( = ?auto_14024 ?auto_14022 ) ) ( ON ?auto_14024 ?auto_14023 ) ( CLEAR ?auto_14024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14020 ?auto_14021 ?auto_14023 )
      ( MAKE-2PILE ?auto_14020 ?auto_14021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14025 - BLOCK
      ?auto_14026 - BLOCK
    )
    :vars
    (
      ?auto_14027 - BLOCK
      ?auto_14028 - BLOCK
      ?auto_14029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14027 ?auto_14026 ) ( ON-TABLE ?auto_14025 ) ( ON ?auto_14026 ?auto_14025 ) ( not ( = ?auto_14025 ?auto_14026 ) ) ( not ( = ?auto_14025 ?auto_14027 ) ) ( not ( = ?auto_14026 ?auto_14027 ) ) ( not ( = ?auto_14025 ?auto_14028 ) ) ( not ( = ?auto_14025 ?auto_14029 ) ) ( not ( = ?auto_14026 ?auto_14028 ) ) ( not ( = ?auto_14026 ?auto_14029 ) ) ( not ( = ?auto_14027 ?auto_14028 ) ) ( not ( = ?auto_14027 ?auto_14029 ) ) ( not ( = ?auto_14028 ?auto_14029 ) ) ( ON ?auto_14028 ?auto_14027 ) ( CLEAR ?auto_14028 ) ( HOLDING ?auto_14029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14029 )
      ( MAKE-2PILE ?auto_14025 ?auto_14026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14030 - BLOCK
      ?auto_14031 - BLOCK
    )
    :vars
    (
      ?auto_14034 - BLOCK
      ?auto_14033 - BLOCK
      ?auto_14032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14034 ?auto_14031 ) ( ON-TABLE ?auto_14030 ) ( ON ?auto_14031 ?auto_14030 ) ( not ( = ?auto_14030 ?auto_14031 ) ) ( not ( = ?auto_14030 ?auto_14034 ) ) ( not ( = ?auto_14031 ?auto_14034 ) ) ( not ( = ?auto_14030 ?auto_14033 ) ) ( not ( = ?auto_14030 ?auto_14032 ) ) ( not ( = ?auto_14031 ?auto_14033 ) ) ( not ( = ?auto_14031 ?auto_14032 ) ) ( not ( = ?auto_14034 ?auto_14033 ) ) ( not ( = ?auto_14034 ?auto_14032 ) ) ( not ( = ?auto_14033 ?auto_14032 ) ) ( ON ?auto_14033 ?auto_14034 ) ( ON ?auto_14032 ?auto_14033 ) ( CLEAR ?auto_14032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14030 ?auto_14031 ?auto_14034 ?auto_14033 )
      ( MAKE-2PILE ?auto_14030 ?auto_14031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14038 - BLOCK
      ?auto_14039 - BLOCK
      ?auto_14040 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14040 ) ( CLEAR ?auto_14039 ) ( ON-TABLE ?auto_14038 ) ( ON ?auto_14039 ?auto_14038 ) ( not ( = ?auto_14038 ?auto_14039 ) ) ( not ( = ?auto_14038 ?auto_14040 ) ) ( not ( = ?auto_14039 ?auto_14040 ) ) )
    :subtasks
    ( ( !STACK ?auto_14040 ?auto_14039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14041 - BLOCK
      ?auto_14042 - BLOCK
      ?auto_14043 - BLOCK
    )
    :vars
    (
      ?auto_14044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14042 ) ( ON-TABLE ?auto_14041 ) ( ON ?auto_14042 ?auto_14041 ) ( not ( = ?auto_14041 ?auto_14042 ) ) ( not ( = ?auto_14041 ?auto_14043 ) ) ( not ( = ?auto_14042 ?auto_14043 ) ) ( ON ?auto_14043 ?auto_14044 ) ( CLEAR ?auto_14043 ) ( HAND-EMPTY ) ( not ( = ?auto_14041 ?auto_14044 ) ) ( not ( = ?auto_14042 ?auto_14044 ) ) ( not ( = ?auto_14043 ?auto_14044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14043 ?auto_14044 )
      ( MAKE-3PILE ?auto_14041 ?auto_14042 ?auto_14043 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14045 - BLOCK
      ?auto_14046 - BLOCK
      ?auto_14047 - BLOCK
    )
    :vars
    (
      ?auto_14048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14045 ) ( not ( = ?auto_14045 ?auto_14046 ) ) ( not ( = ?auto_14045 ?auto_14047 ) ) ( not ( = ?auto_14046 ?auto_14047 ) ) ( ON ?auto_14047 ?auto_14048 ) ( CLEAR ?auto_14047 ) ( not ( = ?auto_14045 ?auto_14048 ) ) ( not ( = ?auto_14046 ?auto_14048 ) ) ( not ( = ?auto_14047 ?auto_14048 ) ) ( HOLDING ?auto_14046 ) ( CLEAR ?auto_14045 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14045 ?auto_14046 )
      ( MAKE-3PILE ?auto_14045 ?auto_14046 ?auto_14047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14049 - BLOCK
      ?auto_14050 - BLOCK
      ?auto_14051 - BLOCK
    )
    :vars
    (
      ?auto_14052 - BLOCK
      ?auto_14053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14049 ) ( not ( = ?auto_14049 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14051 ) ) ( not ( = ?auto_14050 ?auto_14051 ) ) ( ON ?auto_14051 ?auto_14052 ) ( not ( = ?auto_14049 ?auto_14052 ) ) ( not ( = ?auto_14050 ?auto_14052 ) ) ( not ( = ?auto_14051 ?auto_14052 ) ) ( CLEAR ?auto_14049 ) ( ON ?auto_14050 ?auto_14051 ) ( CLEAR ?auto_14050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14053 ) ( ON ?auto_14052 ?auto_14053 ) ( not ( = ?auto_14053 ?auto_14052 ) ) ( not ( = ?auto_14053 ?auto_14051 ) ) ( not ( = ?auto_14053 ?auto_14050 ) ) ( not ( = ?auto_14049 ?auto_14053 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14053 ?auto_14052 ?auto_14051 )
      ( MAKE-3PILE ?auto_14049 ?auto_14050 ?auto_14051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14054 - BLOCK
      ?auto_14055 - BLOCK
      ?auto_14056 - BLOCK
    )
    :vars
    (
      ?auto_14058 - BLOCK
      ?auto_14057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14054 ?auto_14055 ) ) ( not ( = ?auto_14054 ?auto_14056 ) ) ( not ( = ?auto_14055 ?auto_14056 ) ) ( ON ?auto_14056 ?auto_14058 ) ( not ( = ?auto_14054 ?auto_14058 ) ) ( not ( = ?auto_14055 ?auto_14058 ) ) ( not ( = ?auto_14056 ?auto_14058 ) ) ( ON ?auto_14055 ?auto_14056 ) ( CLEAR ?auto_14055 ) ( ON-TABLE ?auto_14057 ) ( ON ?auto_14058 ?auto_14057 ) ( not ( = ?auto_14057 ?auto_14058 ) ) ( not ( = ?auto_14057 ?auto_14056 ) ) ( not ( = ?auto_14057 ?auto_14055 ) ) ( not ( = ?auto_14054 ?auto_14057 ) ) ( HOLDING ?auto_14054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14054 )
      ( MAKE-3PILE ?auto_14054 ?auto_14055 ?auto_14056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14059 - BLOCK
      ?auto_14060 - BLOCK
      ?auto_14061 - BLOCK
    )
    :vars
    (
      ?auto_14062 - BLOCK
      ?auto_14063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14059 ?auto_14060 ) ) ( not ( = ?auto_14059 ?auto_14061 ) ) ( not ( = ?auto_14060 ?auto_14061 ) ) ( ON ?auto_14061 ?auto_14062 ) ( not ( = ?auto_14059 ?auto_14062 ) ) ( not ( = ?auto_14060 ?auto_14062 ) ) ( not ( = ?auto_14061 ?auto_14062 ) ) ( ON ?auto_14060 ?auto_14061 ) ( ON-TABLE ?auto_14063 ) ( ON ?auto_14062 ?auto_14063 ) ( not ( = ?auto_14063 ?auto_14062 ) ) ( not ( = ?auto_14063 ?auto_14061 ) ) ( not ( = ?auto_14063 ?auto_14060 ) ) ( not ( = ?auto_14059 ?auto_14063 ) ) ( ON ?auto_14059 ?auto_14060 ) ( CLEAR ?auto_14059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14063 ?auto_14062 ?auto_14061 ?auto_14060 )
      ( MAKE-3PILE ?auto_14059 ?auto_14060 ?auto_14061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14065 - BLOCK
    )
    :vars
    (
      ?auto_14066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14066 ?auto_14065 ) ( CLEAR ?auto_14066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14065 ) ( not ( = ?auto_14065 ?auto_14066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14066 ?auto_14065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14067 - BLOCK
    )
    :vars
    (
      ?auto_14068 - BLOCK
      ?auto_14069 - BLOCK
      ?auto_14070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14068 ?auto_14067 ) ( CLEAR ?auto_14068 ) ( ON-TABLE ?auto_14067 ) ( not ( = ?auto_14067 ?auto_14068 ) ) ( HOLDING ?auto_14069 ) ( CLEAR ?auto_14070 ) ( not ( = ?auto_14067 ?auto_14069 ) ) ( not ( = ?auto_14067 ?auto_14070 ) ) ( not ( = ?auto_14068 ?auto_14069 ) ) ( not ( = ?auto_14068 ?auto_14070 ) ) ( not ( = ?auto_14069 ?auto_14070 ) ) )
    :subtasks
    ( ( !STACK ?auto_14069 ?auto_14070 )
      ( MAKE-1PILE ?auto_14067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14071 - BLOCK
    )
    :vars
    (
      ?auto_14073 - BLOCK
      ?auto_14074 - BLOCK
      ?auto_14072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14073 ?auto_14071 ) ( ON-TABLE ?auto_14071 ) ( not ( = ?auto_14071 ?auto_14073 ) ) ( CLEAR ?auto_14074 ) ( not ( = ?auto_14071 ?auto_14072 ) ) ( not ( = ?auto_14071 ?auto_14074 ) ) ( not ( = ?auto_14073 ?auto_14072 ) ) ( not ( = ?auto_14073 ?auto_14074 ) ) ( not ( = ?auto_14072 ?auto_14074 ) ) ( ON ?auto_14072 ?auto_14073 ) ( CLEAR ?auto_14072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14071 ?auto_14073 )
      ( MAKE-1PILE ?auto_14071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14075 - BLOCK
    )
    :vars
    (
      ?auto_14078 - BLOCK
      ?auto_14076 - BLOCK
      ?auto_14077 - BLOCK
      ?auto_14079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14078 ?auto_14075 ) ( ON-TABLE ?auto_14075 ) ( not ( = ?auto_14075 ?auto_14078 ) ) ( not ( = ?auto_14075 ?auto_14076 ) ) ( not ( = ?auto_14075 ?auto_14077 ) ) ( not ( = ?auto_14078 ?auto_14076 ) ) ( not ( = ?auto_14078 ?auto_14077 ) ) ( not ( = ?auto_14076 ?auto_14077 ) ) ( ON ?auto_14076 ?auto_14078 ) ( CLEAR ?auto_14076 ) ( HOLDING ?auto_14077 ) ( CLEAR ?auto_14079 ) ( ON-TABLE ?auto_14079 ) ( not ( = ?auto_14079 ?auto_14077 ) ) ( not ( = ?auto_14075 ?auto_14079 ) ) ( not ( = ?auto_14078 ?auto_14079 ) ) ( not ( = ?auto_14076 ?auto_14079 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14079 ?auto_14077 )
      ( MAKE-1PILE ?auto_14075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14080 - BLOCK
    )
    :vars
    (
      ?auto_14081 - BLOCK
      ?auto_14083 - BLOCK
      ?auto_14084 - BLOCK
      ?auto_14082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14081 ?auto_14080 ) ( ON-TABLE ?auto_14080 ) ( not ( = ?auto_14080 ?auto_14081 ) ) ( not ( = ?auto_14080 ?auto_14083 ) ) ( not ( = ?auto_14080 ?auto_14084 ) ) ( not ( = ?auto_14081 ?auto_14083 ) ) ( not ( = ?auto_14081 ?auto_14084 ) ) ( not ( = ?auto_14083 ?auto_14084 ) ) ( ON ?auto_14083 ?auto_14081 ) ( CLEAR ?auto_14082 ) ( ON-TABLE ?auto_14082 ) ( not ( = ?auto_14082 ?auto_14084 ) ) ( not ( = ?auto_14080 ?auto_14082 ) ) ( not ( = ?auto_14081 ?auto_14082 ) ) ( not ( = ?auto_14083 ?auto_14082 ) ) ( ON ?auto_14084 ?auto_14083 ) ( CLEAR ?auto_14084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14080 ?auto_14081 ?auto_14083 )
      ( MAKE-1PILE ?auto_14080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14085 - BLOCK
    )
    :vars
    (
      ?auto_14087 - BLOCK
      ?auto_14088 - BLOCK
      ?auto_14089 - BLOCK
      ?auto_14086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14087 ?auto_14085 ) ( ON-TABLE ?auto_14085 ) ( not ( = ?auto_14085 ?auto_14087 ) ) ( not ( = ?auto_14085 ?auto_14088 ) ) ( not ( = ?auto_14085 ?auto_14089 ) ) ( not ( = ?auto_14087 ?auto_14088 ) ) ( not ( = ?auto_14087 ?auto_14089 ) ) ( not ( = ?auto_14088 ?auto_14089 ) ) ( ON ?auto_14088 ?auto_14087 ) ( not ( = ?auto_14086 ?auto_14089 ) ) ( not ( = ?auto_14085 ?auto_14086 ) ) ( not ( = ?auto_14087 ?auto_14086 ) ) ( not ( = ?auto_14088 ?auto_14086 ) ) ( ON ?auto_14089 ?auto_14088 ) ( CLEAR ?auto_14089 ) ( HOLDING ?auto_14086 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14086 )
      ( MAKE-1PILE ?auto_14085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14090 - BLOCK
    )
    :vars
    (
      ?auto_14092 - BLOCK
      ?auto_14093 - BLOCK
      ?auto_14091 - BLOCK
      ?auto_14094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14092 ?auto_14090 ) ( ON-TABLE ?auto_14090 ) ( not ( = ?auto_14090 ?auto_14092 ) ) ( not ( = ?auto_14090 ?auto_14093 ) ) ( not ( = ?auto_14090 ?auto_14091 ) ) ( not ( = ?auto_14092 ?auto_14093 ) ) ( not ( = ?auto_14092 ?auto_14091 ) ) ( not ( = ?auto_14093 ?auto_14091 ) ) ( ON ?auto_14093 ?auto_14092 ) ( not ( = ?auto_14094 ?auto_14091 ) ) ( not ( = ?auto_14090 ?auto_14094 ) ) ( not ( = ?auto_14092 ?auto_14094 ) ) ( not ( = ?auto_14093 ?auto_14094 ) ) ( ON ?auto_14091 ?auto_14093 ) ( ON ?auto_14094 ?auto_14091 ) ( CLEAR ?auto_14094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14090 ?auto_14092 ?auto_14093 ?auto_14091 )
      ( MAKE-1PILE ?auto_14090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14099 - BLOCK
      ?auto_14100 - BLOCK
      ?auto_14101 - BLOCK
      ?auto_14102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14102 ) ( CLEAR ?auto_14101 ) ( ON-TABLE ?auto_14099 ) ( ON ?auto_14100 ?auto_14099 ) ( ON ?auto_14101 ?auto_14100 ) ( not ( = ?auto_14099 ?auto_14100 ) ) ( not ( = ?auto_14099 ?auto_14101 ) ) ( not ( = ?auto_14099 ?auto_14102 ) ) ( not ( = ?auto_14100 ?auto_14101 ) ) ( not ( = ?auto_14100 ?auto_14102 ) ) ( not ( = ?auto_14101 ?auto_14102 ) ) )
    :subtasks
    ( ( !STACK ?auto_14102 ?auto_14101 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14103 - BLOCK
      ?auto_14104 - BLOCK
      ?auto_14105 - BLOCK
      ?auto_14106 - BLOCK
    )
    :vars
    (
      ?auto_14107 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14105 ) ( ON-TABLE ?auto_14103 ) ( ON ?auto_14104 ?auto_14103 ) ( ON ?auto_14105 ?auto_14104 ) ( not ( = ?auto_14103 ?auto_14104 ) ) ( not ( = ?auto_14103 ?auto_14105 ) ) ( not ( = ?auto_14103 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( ON ?auto_14106 ?auto_14107 ) ( CLEAR ?auto_14106 ) ( HAND-EMPTY ) ( not ( = ?auto_14103 ?auto_14107 ) ) ( not ( = ?auto_14104 ?auto_14107 ) ) ( not ( = ?auto_14105 ?auto_14107 ) ) ( not ( = ?auto_14106 ?auto_14107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14106 ?auto_14107 )
      ( MAKE-4PILE ?auto_14103 ?auto_14104 ?auto_14105 ?auto_14106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14108 - BLOCK
      ?auto_14109 - BLOCK
      ?auto_14110 - BLOCK
      ?auto_14111 - BLOCK
    )
    :vars
    (
      ?auto_14112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14108 ) ( ON ?auto_14109 ?auto_14108 ) ( not ( = ?auto_14108 ?auto_14109 ) ) ( not ( = ?auto_14108 ?auto_14110 ) ) ( not ( = ?auto_14108 ?auto_14111 ) ) ( not ( = ?auto_14109 ?auto_14110 ) ) ( not ( = ?auto_14109 ?auto_14111 ) ) ( not ( = ?auto_14110 ?auto_14111 ) ) ( ON ?auto_14111 ?auto_14112 ) ( CLEAR ?auto_14111 ) ( not ( = ?auto_14108 ?auto_14112 ) ) ( not ( = ?auto_14109 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14111 ?auto_14112 ) ) ( HOLDING ?auto_14110 ) ( CLEAR ?auto_14109 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14108 ?auto_14109 ?auto_14110 )
      ( MAKE-4PILE ?auto_14108 ?auto_14109 ?auto_14110 ?auto_14111 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14113 - BLOCK
      ?auto_14114 - BLOCK
      ?auto_14115 - BLOCK
      ?auto_14116 - BLOCK
    )
    :vars
    (
      ?auto_14117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14113 ) ( ON ?auto_14114 ?auto_14113 ) ( not ( = ?auto_14113 ?auto_14114 ) ) ( not ( = ?auto_14113 ?auto_14115 ) ) ( not ( = ?auto_14113 ?auto_14116 ) ) ( not ( = ?auto_14114 ?auto_14115 ) ) ( not ( = ?auto_14114 ?auto_14116 ) ) ( not ( = ?auto_14115 ?auto_14116 ) ) ( ON ?auto_14116 ?auto_14117 ) ( not ( = ?auto_14113 ?auto_14117 ) ) ( not ( = ?auto_14114 ?auto_14117 ) ) ( not ( = ?auto_14115 ?auto_14117 ) ) ( not ( = ?auto_14116 ?auto_14117 ) ) ( CLEAR ?auto_14114 ) ( ON ?auto_14115 ?auto_14116 ) ( CLEAR ?auto_14115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14117 ?auto_14116 )
      ( MAKE-4PILE ?auto_14113 ?auto_14114 ?auto_14115 ?auto_14116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14118 - BLOCK
      ?auto_14119 - BLOCK
      ?auto_14120 - BLOCK
      ?auto_14121 - BLOCK
    )
    :vars
    (
      ?auto_14122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14118 ) ( not ( = ?auto_14118 ?auto_14119 ) ) ( not ( = ?auto_14118 ?auto_14120 ) ) ( not ( = ?auto_14118 ?auto_14121 ) ) ( not ( = ?auto_14119 ?auto_14120 ) ) ( not ( = ?auto_14119 ?auto_14121 ) ) ( not ( = ?auto_14120 ?auto_14121 ) ) ( ON ?auto_14121 ?auto_14122 ) ( not ( = ?auto_14118 ?auto_14122 ) ) ( not ( = ?auto_14119 ?auto_14122 ) ) ( not ( = ?auto_14120 ?auto_14122 ) ) ( not ( = ?auto_14121 ?auto_14122 ) ) ( ON ?auto_14120 ?auto_14121 ) ( CLEAR ?auto_14120 ) ( ON-TABLE ?auto_14122 ) ( HOLDING ?auto_14119 ) ( CLEAR ?auto_14118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14118 ?auto_14119 )
      ( MAKE-4PILE ?auto_14118 ?auto_14119 ?auto_14120 ?auto_14121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14123 - BLOCK
      ?auto_14124 - BLOCK
      ?auto_14125 - BLOCK
      ?auto_14126 - BLOCK
    )
    :vars
    (
      ?auto_14127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14123 ) ( not ( = ?auto_14123 ?auto_14124 ) ) ( not ( = ?auto_14123 ?auto_14125 ) ) ( not ( = ?auto_14123 ?auto_14126 ) ) ( not ( = ?auto_14124 ?auto_14125 ) ) ( not ( = ?auto_14124 ?auto_14126 ) ) ( not ( = ?auto_14125 ?auto_14126 ) ) ( ON ?auto_14126 ?auto_14127 ) ( not ( = ?auto_14123 ?auto_14127 ) ) ( not ( = ?auto_14124 ?auto_14127 ) ) ( not ( = ?auto_14125 ?auto_14127 ) ) ( not ( = ?auto_14126 ?auto_14127 ) ) ( ON ?auto_14125 ?auto_14126 ) ( ON-TABLE ?auto_14127 ) ( CLEAR ?auto_14123 ) ( ON ?auto_14124 ?auto_14125 ) ( CLEAR ?auto_14124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14127 ?auto_14126 ?auto_14125 )
      ( MAKE-4PILE ?auto_14123 ?auto_14124 ?auto_14125 ?auto_14126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14128 - BLOCK
      ?auto_14129 - BLOCK
      ?auto_14130 - BLOCK
      ?auto_14131 - BLOCK
    )
    :vars
    (
      ?auto_14132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14128 ?auto_14129 ) ) ( not ( = ?auto_14128 ?auto_14130 ) ) ( not ( = ?auto_14128 ?auto_14131 ) ) ( not ( = ?auto_14129 ?auto_14130 ) ) ( not ( = ?auto_14129 ?auto_14131 ) ) ( not ( = ?auto_14130 ?auto_14131 ) ) ( ON ?auto_14131 ?auto_14132 ) ( not ( = ?auto_14128 ?auto_14132 ) ) ( not ( = ?auto_14129 ?auto_14132 ) ) ( not ( = ?auto_14130 ?auto_14132 ) ) ( not ( = ?auto_14131 ?auto_14132 ) ) ( ON ?auto_14130 ?auto_14131 ) ( ON-TABLE ?auto_14132 ) ( ON ?auto_14129 ?auto_14130 ) ( CLEAR ?auto_14129 ) ( HOLDING ?auto_14128 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14128 )
      ( MAKE-4PILE ?auto_14128 ?auto_14129 ?auto_14130 ?auto_14131 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14133 - BLOCK
      ?auto_14134 - BLOCK
      ?auto_14135 - BLOCK
      ?auto_14136 - BLOCK
    )
    :vars
    (
      ?auto_14137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14133 ?auto_14134 ) ) ( not ( = ?auto_14133 ?auto_14135 ) ) ( not ( = ?auto_14133 ?auto_14136 ) ) ( not ( = ?auto_14134 ?auto_14135 ) ) ( not ( = ?auto_14134 ?auto_14136 ) ) ( not ( = ?auto_14135 ?auto_14136 ) ) ( ON ?auto_14136 ?auto_14137 ) ( not ( = ?auto_14133 ?auto_14137 ) ) ( not ( = ?auto_14134 ?auto_14137 ) ) ( not ( = ?auto_14135 ?auto_14137 ) ) ( not ( = ?auto_14136 ?auto_14137 ) ) ( ON ?auto_14135 ?auto_14136 ) ( ON-TABLE ?auto_14137 ) ( ON ?auto_14134 ?auto_14135 ) ( ON ?auto_14133 ?auto_14134 ) ( CLEAR ?auto_14133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14137 ?auto_14136 ?auto_14135 ?auto_14134 )
      ( MAKE-4PILE ?auto_14133 ?auto_14134 ?auto_14135 ?auto_14136 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14141 - BLOCK
      ?auto_14142 - BLOCK
      ?auto_14143 - BLOCK
    )
    :vars
    (
      ?auto_14144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14144 ?auto_14143 ) ( CLEAR ?auto_14144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14141 ) ( ON ?auto_14142 ?auto_14141 ) ( ON ?auto_14143 ?auto_14142 ) ( not ( = ?auto_14141 ?auto_14142 ) ) ( not ( = ?auto_14141 ?auto_14143 ) ) ( not ( = ?auto_14141 ?auto_14144 ) ) ( not ( = ?auto_14142 ?auto_14143 ) ) ( not ( = ?auto_14142 ?auto_14144 ) ) ( not ( = ?auto_14143 ?auto_14144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14144 ?auto_14143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14154 - BLOCK
      ?auto_14155 - BLOCK
      ?auto_14156 - BLOCK
    )
    :vars
    (
      ?auto_14157 - BLOCK
      ?auto_14158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14154 ) ( ON ?auto_14155 ?auto_14154 ) ( not ( = ?auto_14154 ?auto_14155 ) ) ( not ( = ?auto_14154 ?auto_14156 ) ) ( not ( = ?auto_14154 ?auto_14157 ) ) ( not ( = ?auto_14155 ?auto_14156 ) ) ( not ( = ?auto_14155 ?auto_14157 ) ) ( not ( = ?auto_14156 ?auto_14157 ) ) ( ON ?auto_14157 ?auto_14158 ) ( CLEAR ?auto_14157 ) ( not ( = ?auto_14154 ?auto_14158 ) ) ( not ( = ?auto_14155 ?auto_14158 ) ) ( not ( = ?auto_14156 ?auto_14158 ) ) ( not ( = ?auto_14157 ?auto_14158 ) ) ( HOLDING ?auto_14156 ) ( CLEAR ?auto_14155 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14154 ?auto_14155 ?auto_14156 ?auto_14157 )
      ( MAKE-3PILE ?auto_14154 ?auto_14155 ?auto_14156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14159 - BLOCK
      ?auto_14160 - BLOCK
      ?auto_14161 - BLOCK
    )
    :vars
    (
      ?auto_14162 - BLOCK
      ?auto_14163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14159 ) ( ON ?auto_14160 ?auto_14159 ) ( not ( = ?auto_14159 ?auto_14160 ) ) ( not ( = ?auto_14159 ?auto_14161 ) ) ( not ( = ?auto_14159 ?auto_14162 ) ) ( not ( = ?auto_14160 ?auto_14161 ) ) ( not ( = ?auto_14160 ?auto_14162 ) ) ( not ( = ?auto_14161 ?auto_14162 ) ) ( ON ?auto_14162 ?auto_14163 ) ( not ( = ?auto_14159 ?auto_14163 ) ) ( not ( = ?auto_14160 ?auto_14163 ) ) ( not ( = ?auto_14161 ?auto_14163 ) ) ( not ( = ?auto_14162 ?auto_14163 ) ) ( CLEAR ?auto_14160 ) ( ON ?auto_14161 ?auto_14162 ) ( CLEAR ?auto_14161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14163 ?auto_14162 )
      ( MAKE-3PILE ?auto_14159 ?auto_14160 ?auto_14161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14164 - BLOCK
      ?auto_14165 - BLOCK
      ?auto_14166 - BLOCK
    )
    :vars
    (
      ?auto_14168 - BLOCK
      ?auto_14167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14164 ) ( not ( = ?auto_14164 ?auto_14165 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) ( not ( = ?auto_14164 ?auto_14168 ) ) ( not ( = ?auto_14165 ?auto_14166 ) ) ( not ( = ?auto_14165 ?auto_14168 ) ) ( not ( = ?auto_14166 ?auto_14168 ) ) ( ON ?auto_14168 ?auto_14167 ) ( not ( = ?auto_14164 ?auto_14167 ) ) ( not ( = ?auto_14165 ?auto_14167 ) ) ( not ( = ?auto_14166 ?auto_14167 ) ) ( not ( = ?auto_14168 ?auto_14167 ) ) ( ON ?auto_14166 ?auto_14168 ) ( CLEAR ?auto_14166 ) ( ON-TABLE ?auto_14167 ) ( HOLDING ?auto_14165 ) ( CLEAR ?auto_14164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14164 ?auto_14165 )
      ( MAKE-3PILE ?auto_14164 ?auto_14165 ?auto_14166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14169 - BLOCK
      ?auto_14170 - BLOCK
      ?auto_14171 - BLOCK
    )
    :vars
    (
      ?auto_14173 - BLOCK
      ?auto_14172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14169 ) ( not ( = ?auto_14169 ?auto_14170 ) ) ( not ( = ?auto_14169 ?auto_14171 ) ) ( not ( = ?auto_14169 ?auto_14173 ) ) ( not ( = ?auto_14170 ?auto_14171 ) ) ( not ( = ?auto_14170 ?auto_14173 ) ) ( not ( = ?auto_14171 ?auto_14173 ) ) ( ON ?auto_14173 ?auto_14172 ) ( not ( = ?auto_14169 ?auto_14172 ) ) ( not ( = ?auto_14170 ?auto_14172 ) ) ( not ( = ?auto_14171 ?auto_14172 ) ) ( not ( = ?auto_14173 ?auto_14172 ) ) ( ON ?auto_14171 ?auto_14173 ) ( ON-TABLE ?auto_14172 ) ( CLEAR ?auto_14169 ) ( ON ?auto_14170 ?auto_14171 ) ( CLEAR ?auto_14170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14172 ?auto_14173 ?auto_14171 )
      ( MAKE-3PILE ?auto_14169 ?auto_14170 ?auto_14171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14174 - BLOCK
      ?auto_14175 - BLOCK
      ?auto_14176 - BLOCK
    )
    :vars
    (
      ?auto_14177 - BLOCK
      ?auto_14178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14174 ?auto_14175 ) ) ( not ( = ?auto_14174 ?auto_14176 ) ) ( not ( = ?auto_14174 ?auto_14177 ) ) ( not ( = ?auto_14175 ?auto_14176 ) ) ( not ( = ?auto_14175 ?auto_14177 ) ) ( not ( = ?auto_14176 ?auto_14177 ) ) ( ON ?auto_14177 ?auto_14178 ) ( not ( = ?auto_14174 ?auto_14178 ) ) ( not ( = ?auto_14175 ?auto_14178 ) ) ( not ( = ?auto_14176 ?auto_14178 ) ) ( not ( = ?auto_14177 ?auto_14178 ) ) ( ON ?auto_14176 ?auto_14177 ) ( ON-TABLE ?auto_14178 ) ( ON ?auto_14175 ?auto_14176 ) ( CLEAR ?auto_14175 ) ( HOLDING ?auto_14174 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14174 )
      ( MAKE-3PILE ?auto_14174 ?auto_14175 ?auto_14176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14179 - BLOCK
      ?auto_14180 - BLOCK
      ?auto_14181 - BLOCK
    )
    :vars
    (
      ?auto_14182 - BLOCK
      ?auto_14183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14179 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( not ( = ?auto_14179 ?auto_14182 ) ) ( not ( = ?auto_14180 ?auto_14181 ) ) ( not ( = ?auto_14180 ?auto_14182 ) ) ( not ( = ?auto_14181 ?auto_14182 ) ) ( ON ?auto_14182 ?auto_14183 ) ( not ( = ?auto_14179 ?auto_14183 ) ) ( not ( = ?auto_14180 ?auto_14183 ) ) ( not ( = ?auto_14181 ?auto_14183 ) ) ( not ( = ?auto_14182 ?auto_14183 ) ) ( ON ?auto_14181 ?auto_14182 ) ( ON-TABLE ?auto_14183 ) ( ON ?auto_14180 ?auto_14181 ) ( ON ?auto_14179 ?auto_14180 ) ( CLEAR ?auto_14179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14183 ?auto_14182 ?auto_14181 ?auto_14180 )
      ( MAKE-3PILE ?auto_14179 ?auto_14180 ?auto_14181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14185 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14185 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14186 - BLOCK
    )
    :vars
    (
      ?auto_14187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14186 ?auto_14187 ) ( CLEAR ?auto_14186 ) ( HAND-EMPTY ) ( not ( = ?auto_14186 ?auto_14187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14186 ?auto_14187 )
      ( MAKE-1PILE ?auto_14186 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14188 - BLOCK
    )
    :vars
    (
      ?auto_14189 - BLOCK
      ?auto_14190 - BLOCK
      ?auto_14191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14188 ?auto_14189 ) ) ( HOLDING ?auto_14188 ) ( CLEAR ?auto_14189 ) ( ON-TABLE ?auto_14190 ) ( ON ?auto_14191 ?auto_14190 ) ( ON ?auto_14189 ?auto_14191 ) ( not ( = ?auto_14190 ?auto_14191 ) ) ( not ( = ?auto_14190 ?auto_14189 ) ) ( not ( = ?auto_14190 ?auto_14188 ) ) ( not ( = ?auto_14191 ?auto_14189 ) ) ( not ( = ?auto_14191 ?auto_14188 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14190 ?auto_14191 ?auto_14189 ?auto_14188 )
      ( MAKE-1PILE ?auto_14188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14192 - BLOCK
    )
    :vars
    (
      ?auto_14195 - BLOCK
      ?auto_14194 - BLOCK
      ?auto_14193 - BLOCK
      ?auto_14196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14192 ?auto_14195 ) ) ( CLEAR ?auto_14195 ) ( ON-TABLE ?auto_14194 ) ( ON ?auto_14193 ?auto_14194 ) ( ON ?auto_14195 ?auto_14193 ) ( not ( = ?auto_14194 ?auto_14193 ) ) ( not ( = ?auto_14194 ?auto_14195 ) ) ( not ( = ?auto_14194 ?auto_14192 ) ) ( not ( = ?auto_14193 ?auto_14195 ) ) ( not ( = ?auto_14193 ?auto_14192 ) ) ( ON ?auto_14192 ?auto_14196 ) ( CLEAR ?auto_14192 ) ( HAND-EMPTY ) ( not ( = ?auto_14192 ?auto_14196 ) ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14194 ?auto_14196 ) ) ( not ( = ?auto_14193 ?auto_14196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14192 ?auto_14196 )
      ( MAKE-1PILE ?auto_14192 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14197 - BLOCK
    )
    :vars
    (
      ?auto_14201 - BLOCK
      ?auto_14199 - BLOCK
      ?auto_14200 - BLOCK
      ?auto_14198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14197 ?auto_14201 ) ) ( ON-TABLE ?auto_14199 ) ( ON ?auto_14200 ?auto_14199 ) ( not ( = ?auto_14199 ?auto_14200 ) ) ( not ( = ?auto_14199 ?auto_14201 ) ) ( not ( = ?auto_14199 ?auto_14197 ) ) ( not ( = ?auto_14200 ?auto_14201 ) ) ( not ( = ?auto_14200 ?auto_14197 ) ) ( ON ?auto_14197 ?auto_14198 ) ( CLEAR ?auto_14197 ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14201 ?auto_14198 ) ) ( not ( = ?auto_14199 ?auto_14198 ) ) ( not ( = ?auto_14200 ?auto_14198 ) ) ( HOLDING ?auto_14201 ) ( CLEAR ?auto_14200 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14199 ?auto_14200 ?auto_14201 )
      ( MAKE-1PILE ?auto_14197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14202 - BLOCK
    )
    :vars
    (
      ?auto_14203 - BLOCK
      ?auto_14204 - BLOCK
      ?auto_14205 - BLOCK
      ?auto_14206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14202 ?auto_14203 ) ) ( ON-TABLE ?auto_14204 ) ( ON ?auto_14205 ?auto_14204 ) ( not ( = ?auto_14204 ?auto_14205 ) ) ( not ( = ?auto_14204 ?auto_14203 ) ) ( not ( = ?auto_14204 ?auto_14202 ) ) ( not ( = ?auto_14205 ?auto_14203 ) ) ( not ( = ?auto_14205 ?auto_14202 ) ) ( ON ?auto_14202 ?auto_14206 ) ( not ( = ?auto_14202 ?auto_14206 ) ) ( not ( = ?auto_14203 ?auto_14206 ) ) ( not ( = ?auto_14204 ?auto_14206 ) ) ( not ( = ?auto_14205 ?auto_14206 ) ) ( CLEAR ?auto_14205 ) ( ON ?auto_14203 ?auto_14202 ) ( CLEAR ?auto_14203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14206 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14206 ?auto_14202 )
      ( MAKE-1PILE ?auto_14202 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14207 - BLOCK
    )
    :vars
    (
      ?auto_14209 - BLOCK
      ?auto_14211 - BLOCK
      ?auto_14210 - BLOCK
      ?auto_14208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14207 ?auto_14209 ) ) ( ON-TABLE ?auto_14211 ) ( not ( = ?auto_14211 ?auto_14210 ) ) ( not ( = ?auto_14211 ?auto_14209 ) ) ( not ( = ?auto_14211 ?auto_14207 ) ) ( not ( = ?auto_14210 ?auto_14209 ) ) ( not ( = ?auto_14210 ?auto_14207 ) ) ( ON ?auto_14207 ?auto_14208 ) ( not ( = ?auto_14207 ?auto_14208 ) ) ( not ( = ?auto_14209 ?auto_14208 ) ) ( not ( = ?auto_14211 ?auto_14208 ) ) ( not ( = ?auto_14210 ?auto_14208 ) ) ( ON ?auto_14209 ?auto_14207 ) ( CLEAR ?auto_14209 ) ( ON-TABLE ?auto_14208 ) ( HOLDING ?auto_14210 ) ( CLEAR ?auto_14211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14211 ?auto_14210 )
      ( MAKE-1PILE ?auto_14207 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14212 - BLOCK
    )
    :vars
    (
      ?auto_14216 - BLOCK
      ?auto_14213 - BLOCK
      ?auto_14215 - BLOCK
      ?auto_14214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14212 ?auto_14216 ) ) ( ON-TABLE ?auto_14213 ) ( not ( = ?auto_14213 ?auto_14215 ) ) ( not ( = ?auto_14213 ?auto_14216 ) ) ( not ( = ?auto_14213 ?auto_14212 ) ) ( not ( = ?auto_14215 ?auto_14216 ) ) ( not ( = ?auto_14215 ?auto_14212 ) ) ( ON ?auto_14212 ?auto_14214 ) ( not ( = ?auto_14212 ?auto_14214 ) ) ( not ( = ?auto_14216 ?auto_14214 ) ) ( not ( = ?auto_14213 ?auto_14214 ) ) ( not ( = ?auto_14215 ?auto_14214 ) ) ( ON ?auto_14216 ?auto_14212 ) ( ON-TABLE ?auto_14214 ) ( CLEAR ?auto_14213 ) ( ON ?auto_14215 ?auto_14216 ) ( CLEAR ?auto_14215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14214 ?auto_14212 ?auto_14216 )
      ( MAKE-1PILE ?auto_14212 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14217 - BLOCK
    )
    :vars
    (
      ?auto_14219 - BLOCK
      ?auto_14218 - BLOCK
      ?auto_14220 - BLOCK
      ?auto_14221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14217 ?auto_14219 ) ) ( not ( = ?auto_14218 ?auto_14220 ) ) ( not ( = ?auto_14218 ?auto_14219 ) ) ( not ( = ?auto_14218 ?auto_14217 ) ) ( not ( = ?auto_14220 ?auto_14219 ) ) ( not ( = ?auto_14220 ?auto_14217 ) ) ( ON ?auto_14217 ?auto_14221 ) ( not ( = ?auto_14217 ?auto_14221 ) ) ( not ( = ?auto_14219 ?auto_14221 ) ) ( not ( = ?auto_14218 ?auto_14221 ) ) ( not ( = ?auto_14220 ?auto_14221 ) ) ( ON ?auto_14219 ?auto_14217 ) ( ON-TABLE ?auto_14221 ) ( ON ?auto_14220 ?auto_14219 ) ( CLEAR ?auto_14220 ) ( HOLDING ?auto_14218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14218 )
      ( MAKE-1PILE ?auto_14217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14222 - BLOCK
    )
    :vars
    (
      ?auto_14224 - BLOCK
      ?auto_14225 - BLOCK
      ?auto_14226 - BLOCK
      ?auto_14223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14222 ?auto_14224 ) ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14224 ) ) ( not ( = ?auto_14225 ?auto_14222 ) ) ( not ( = ?auto_14226 ?auto_14224 ) ) ( not ( = ?auto_14226 ?auto_14222 ) ) ( ON ?auto_14222 ?auto_14223 ) ( not ( = ?auto_14222 ?auto_14223 ) ) ( not ( = ?auto_14224 ?auto_14223 ) ) ( not ( = ?auto_14225 ?auto_14223 ) ) ( not ( = ?auto_14226 ?auto_14223 ) ) ( ON ?auto_14224 ?auto_14222 ) ( ON-TABLE ?auto_14223 ) ( ON ?auto_14226 ?auto_14224 ) ( ON ?auto_14225 ?auto_14226 ) ( CLEAR ?auto_14225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14223 ?auto_14222 ?auto_14224 ?auto_14226 )
      ( MAKE-1PILE ?auto_14222 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14229 - BLOCK
      ?auto_14230 - BLOCK
    )
    :vars
    (
      ?auto_14231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14231 ?auto_14230 ) ( CLEAR ?auto_14231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14229 ) ( ON ?auto_14230 ?auto_14229 ) ( not ( = ?auto_14229 ?auto_14230 ) ) ( not ( = ?auto_14229 ?auto_14231 ) ) ( not ( = ?auto_14230 ?auto_14231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14231 ?auto_14230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14232 - BLOCK
      ?auto_14233 - BLOCK
    )
    :vars
    (
      ?auto_14234 - BLOCK
      ?auto_14235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14234 ?auto_14233 ) ( CLEAR ?auto_14234 ) ( ON-TABLE ?auto_14232 ) ( ON ?auto_14233 ?auto_14232 ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14234 ) ) ( not ( = ?auto_14233 ?auto_14234 ) ) ( HOLDING ?auto_14235 ) ( not ( = ?auto_14232 ?auto_14235 ) ) ( not ( = ?auto_14233 ?auto_14235 ) ) ( not ( = ?auto_14234 ?auto_14235 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14235 )
      ( MAKE-2PILE ?auto_14232 ?auto_14233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14236 - BLOCK
      ?auto_14237 - BLOCK
    )
    :vars
    (
      ?auto_14239 - BLOCK
      ?auto_14238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14239 ?auto_14237 ) ( ON-TABLE ?auto_14236 ) ( ON ?auto_14237 ?auto_14236 ) ( not ( = ?auto_14236 ?auto_14237 ) ) ( not ( = ?auto_14236 ?auto_14239 ) ) ( not ( = ?auto_14237 ?auto_14239 ) ) ( not ( = ?auto_14236 ?auto_14238 ) ) ( not ( = ?auto_14237 ?auto_14238 ) ) ( not ( = ?auto_14239 ?auto_14238 ) ) ( ON ?auto_14238 ?auto_14239 ) ( CLEAR ?auto_14238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14236 ?auto_14237 ?auto_14239 )
      ( MAKE-2PILE ?auto_14236 ?auto_14237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14240 - BLOCK
      ?auto_14241 - BLOCK
    )
    :vars
    (
      ?auto_14243 - BLOCK
      ?auto_14242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14243 ?auto_14241 ) ( ON-TABLE ?auto_14240 ) ( ON ?auto_14241 ?auto_14240 ) ( not ( = ?auto_14240 ?auto_14241 ) ) ( not ( = ?auto_14240 ?auto_14243 ) ) ( not ( = ?auto_14241 ?auto_14243 ) ) ( not ( = ?auto_14240 ?auto_14242 ) ) ( not ( = ?auto_14241 ?auto_14242 ) ) ( not ( = ?auto_14243 ?auto_14242 ) ) ( HOLDING ?auto_14242 ) ( CLEAR ?auto_14243 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14240 ?auto_14241 ?auto_14243 ?auto_14242 )
      ( MAKE-2PILE ?auto_14240 ?auto_14241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14244 - BLOCK
      ?auto_14245 - BLOCK
    )
    :vars
    (
      ?auto_14247 - BLOCK
      ?auto_14246 - BLOCK
      ?auto_14248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14247 ?auto_14245 ) ( ON-TABLE ?auto_14244 ) ( ON ?auto_14245 ?auto_14244 ) ( not ( = ?auto_14244 ?auto_14245 ) ) ( not ( = ?auto_14244 ?auto_14247 ) ) ( not ( = ?auto_14245 ?auto_14247 ) ) ( not ( = ?auto_14244 ?auto_14246 ) ) ( not ( = ?auto_14245 ?auto_14246 ) ) ( not ( = ?auto_14247 ?auto_14246 ) ) ( CLEAR ?auto_14247 ) ( ON ?auto_14246 ?auto_14248 ) ( CLEAR ?auto_14246 ) ( HAND-EMPTY ) ( not ( = ?auto_14244 ?auto_14248 ) ) ( not ( = ?auto_14245 ?auto_14248 ) ) ( not ( = ?auto_14247 ?auto_14248 ) ) ( not ( = ?auto_14246 ?auto_14248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14246 ?auto_14248 )
      ( MAKE-2PILE ?auto_14244 ?auto_14245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14259 - BLOCK
      ?auto_14260 - BLOCK
    )
    :vars
    (
      ?auto_14261 - BLOCK
      ?auto_14262 - BLOCK
      ?auto_14263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14259 ) ( not ( = ?auto_14259 ?auto_14260 ) ) ( not ( = ?auto_14259 ?auto_14261 ) ) ( not ( = ?auto_14260 ?auto_14261 ) ) ( not ( = ?auto_14259 ?auto_14262 ) ) ( not ( = ?auto_14260 ?auto_14262 ) ) ( not ( = ?auto_14261 ?auto_14262 ) ) ( ON ?auto_14262 ?auto_14263 ) ( not ( = ?auto_14259 ?auto_14263 ) ) ( not ( = ?auto_14260 ?auto_14263 ) ) ( not ( = ?auto_14261 ?auto_14263 ) ) ( not ( = ?auto_14262 ?auto_14263 ) ) ( ON ?auto_14261 ?auto_14262 ) ( CLEAR ?auto_14261 ) ( HOLDING ?auto_14260 ) ( CLEAR ?auto_14259 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14259 ?auto_14260 ?auto_14261 )
      ( MAKE-2PILE ?auto_14259 ?auto_14260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14264 - BLOCK
      ?auto_14265 - BLOCK
    )
    :vars
    (
      ?auto_14267 - BLOCK
      ?auto_14266 - BLOCK
      ?auto_14268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14264 ) ( not ( = ?auto_14264 ?auto_14265 ) ) ( not ( = ?auto_14264 ?auto_14267 ) ) ( not ( = ?auto_14265 ?auto_14267 ) ) ( not ( = ?auto_14264 ?auto_14266 ) ) ( not ( = ?auto_14265 ?auto_14266 ) ) ( not ( = ?auto_14267 ?auto_14266 ) ) ( ON ?auto_14266 ?auto_14268 ) ( not ( = ?auto_14264 ?auto_14268 ) ) ( not ( = ?auto_14265 ?auto_14268 ) ) ( not ( = ?auto_14267 ?auto_14268 ) ) ( not ( = ?auto_14266 ?auto_14268 ) ) ( ON ?auto_14267 ?auto_14266 ) ( CLEAR ?auto_14264 ) ( ON ?auto_14265 ?auto_14267 ) ( CLEAR ?auto_14265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14268 ?auto_14266 ?auto_14267 )
      ( MAKE-2PILE ?auto_14264 ?auto_14265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14269 - BLOCK
      ?auto_14270 - BLOCK
    )
    :vars
    (
      ?auto_14273 - BLOCK
      ?auto_14272 - BLOCK
      ?auto_14271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14269 ?auto_14270 ) ) ( not ( = ?auto_14269 ?auto_14273 ) ) ( not ( = ?auto_14270 ?auto_14273 ) ) ( not ( = ?auto_14269 ?auto_14272 ) ) ( not ( = ?auto_14270 ?auto_14272 ) ) ( not ( = ?auto_14273 ?auto_14272 ) ) ( ON ?auto_14272 ?auto_14271 ) ( not ( = ?auto_14269 ?auto_14271 ) ) ( not ( = ?auto_14270 ?auto_14271 ) ) ( not ( = ?auto_14273 ?auto_14271 ) ) ( not ( = ?auto_14272 ?auto_14271 ) ) ( ON ?auto_14273 ?auto_14272 ) ( ON ?auto_14270 ?auto_14273 ) ( CLEAR ?auto_14270 ) ( ON-TABLE ?auto_14271 ) ( HOLDING ?auto_14269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14269 )
      ( MAKE-2PILE ?auto_14269 ?auto_14270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14274 - BLOCK
      ?auto_14275 - BLOCK
    )
    :vars
    (
      ?auto_14276 - BLOCK
      ?auto_14277 - BLOCK
      ?auto_14278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14274 ?auto_14275 ) ) ( not ( = ?auto_14274 ?auto_14276 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14274 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( ON ?auto_14277 ?auto_14278 ) ( not ( = ?auto_14274 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14278 ) ) ( not ( = ?auto_14276 ?auto_14278 ) ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( ON ?auto_14276 ?auto_14277 ) ( ON ?auto_14275 ?auto_14276 ) ( ON-TABLE ?auto_14278 ) ( ON ?auto_14274 ?auto_14275 ) ( CLEAR ?auto_14274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14278 ?auto_14277 ?auto_14276 ?auto_14275 )
      ( MAKE-2PILE ?auto_14274 ?auto_14275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14281 - BLOCK
      ?auto_14282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14282 ) ( CLEAR ?auto_14281 ) ( ON-TABLE ?auto_14281 ) ( not ( = ?auto_14281 ?auto_14282 ) ) )
    :subtasks
    ( ( !STACK ?auto_14282 ?auto_14281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14283 - BLOCK
      ?auto_14284 - BLOCK
    )
    :vars
    (
      ?auto_14285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14283 ) ( ON-TABLE ?auto_14283 ) ( not ( = ?auto_14283 ?auto_14284 ) ) ( ON ?auto_14284 ?auto_14285 ) ( CLEAR ?auto_14284 ) ( HAND-EMPTY ) ( not ( = ?auto_14283 ?auto_14285 ) ) ( not ( = ?auto_14284 ?auto_14285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14284 ?auto_14285 )
      ( MAKE-2PILE ?auto_14283 ?auto_14284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14286 - BLOCK
      ?auto_14287 - BLOCK
    )
    :vars
    (
      ?auto_14288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14286 ?auto_14287 ) ) ( ON ?auto_14287 ?auto_14288 ) ( CLEAR ?auto_14287 ) ( not ( = ?auto_14286 ?auto_14288 ) ) ( not ( = ?auto_14287 ?auto_14288 ) ) ( HOLDING ?auto_14286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14286 )
      ( MAKE-2PILE ?auto_14286 ?auto_14287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14289 - BLOCK
      ?auto_14290 - BLOCK
    )
    :vars
    (
      ?auto_14291 - BLOCK
      ?auto_14292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14289 ?auto_14290 ) ) ( ON ?auto_14290 ?auto_14291 ) ( not ( = ?auto_14289 ?auto_14291 ) ) ( not ( = ?auto_14290 ?auto_14291 ) ) ( ON ?auto_14289 ?auto_14290 ) ( CLEAR ?auto_14289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14292 ) ( ON ?auto_14291 ?auto_14292 ) ( not ( = ?auto_14292 ?auto_14291 ) ) ( not ( = ?auto_14292 ?auto_14290 ) ) ( not ( = ?auto_14292 ?auto_14289 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14292 ?auto_14291 ?auto_14290 )
      ( MAKE-2PILE ?auto_14289 ?auto_14290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14293 - BLOCK
      ?auto_14294 - BLOCK
    )
    :vars
    (
      ?auto_14296 - BLOCK
      ?auto_14295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14293 ?auto_14294 ) ) ( ON ?auto_14294 ?auto_14296 ) ( not ( = ?auto_14293 ?auto_14296 ) ) ( not ( = ?auto_14294 ?auto_14296 ) ) ( ON-TABLE ?auto_14295 ) ( ON ?auto_14296 ?auto_14295 ) ( not ( = ?auto_14295 ?auto_14296 ) ) ( not ( = ?auto_14295 ?auto_14294 ) ) ( not ( = ?auto_14295 ?auto_14293 ) ) ( HOLDING ?auto_14293 ) ( CLEAR ?auto_14294 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14295 ?auto_14296 ?auto_14294 ?auto_14293 )
      ( MAKE-2PILE ?auto_14293 ?auto_14294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14297 - BLOCK
      ?auto_14298 - BLOCK
    )
    :vars
    (
      ?auto_14300 - BLOCK
      ?auto_14299 - BLOCK
      ?auto_14301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14297 ?auto_14298 ) ) ( ON ?auto_14298 ?auto_14300 ) ( not ( = ?auto_14297 ?auto_14300 ) ) ( not ( = ?auto_14298 ?auto_14300 ) ) ( ON-TABLE ?auto_14299 ) ( ON ?auto_14300 ?auto_14299 ) ( not ( = ?auto_14299 ?auto_14300 ) ) ( not ( = ?auto_14299 ?auto_14298 ) ) ( not ( = ?auto_14299 ?auto_14297 ) ) ( CLEAR ?auto_14298 ) ( ON ?auto_14297 ?auto_14301 ) ( CLEAR ?auto_14297 ) ( HAND-EMPTY ) ( not ( = ?auto_14297 ?auto_14301 ) ) ( not ( = ?auto_14298 ?auto_14301 ) ) ( not ( = ?auto_14300 ?auto_14301 ) ) ( not ( = ?auto_14299 ?auto_14301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14297 ?auto_14301 )
      ( MAKE-2PILE ?auto_14297 ?auto_14298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14302 - BLOCK
      ?auto_14303 - BLOCK
    )
    :vars
    (
      ?auto_14304 - BLOCK
      ?auto_14305 - BLOCK
      ?auto_14306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14302 ?auto_14303 ) ) ( not ( = ?auto_14302 ?auto_14304 ) ) ( not ( = ?auto_14303 ?auto_14304 ) ) ( ON-TABLE ?auto_14305 ) ( ON ?auto_14304 ?auto_14305 ) ( not ( = ?auto_14305 ?auto_14304 ) ) ( not ( = ?auto_14305 ?auto_14303 ) ) ( not ( = ?auto_14305 ?auto_14302 ) ) ( ON ?auto_14302 ?auto_14306 ) ( CLEAR ?auto_14302 ) ( not ( = ?auto_14302 ?auto_14306 ) ) ( not ( = ?auto_14303 ?auto_14306 ) ) ( not ( = ?auto_14304 ?auto_14306 ) ) ( not ( = ?auto_14305 ?auto_14306 ) ) ( HOLDING ?auto_14303 ) ( CLEAR ?auto_14304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14305 ?auto_14304 ?auto_14303 )
      ( MAKE-2PILE ?auto_14302 ?auto_14303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14307 - BLOCK
      ?auto_14308 - BLOCK
    )
    :vars
    (
      ?auto_14309 - BLOCK
      ?auto_14311 - BLOCK
      ?auto_14310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14307 ?auto_14308 ) ) ( not ( = ?auto_14307 ?auto_14309 ) ) ( not ( = ?auto_14308 ?auto_14309 ) ) ( ON-TABLE ?auto_14311 ) ( ON ?auto_14309 ?auto_14311 ) ( not ( = ?auto_14311 ?auto_14309 ) ) ( not ( = ?auto_14311 ?auto_14308 ) ) ( not ( = ?auto_14311 ?auto_14307 ) ) ( ON ?auto_14307 ?auto_14310 ) ( not ( = ?auto_14307 ?auto_14310 ) ) ( not ( = ?auto_14308 ?auto_14310 ) ) ( not ( = ?auto_14309 ?auto_14310 ) ) ( not ( = ?auto_14311 ?auto_14310 ) ) ( CLEAR ?auto_14309 ) ( ON ?auto_14308 ?auto_14307 ) ( CLEAR ?auto_14308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14310 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14310 ?auto_14307 )
      ( MAKE-2PILE ?auto_14307 ?auto_14308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14312 - BLOCK
      ?auto_14313 - BLOCK
    )
    :vars
    (
      ?auto_14316 - BLOCK
      ?auto_14314 - BLOCK
      ?auto_14315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14312 ?auto_14313 ) ) ( not ( = ?auto_14312 ?auto_14316 ) ) ( not ( = ?auto_14313 ?auto_14316 ) ) ( ON-TABLE ?auto_14314 ) ( not ( = ?auto_14314 ?auto_14316 ) ) ( not ( = ?auto_14314 ?auto_14313 ) ) ( not ( = ?auto_14314 ?auto_14312 ) ) ( ON ?auto_14312 ?auto_14315 ) ( not ( = ?auto_14312 ?auto_14315 ) ) ( not ( = ?auto_14313 ?auto_14315 ) ) ( not ( = ?auto_14316 ?auto_14315 ) ) ( not ( = ?auto_14314 ?auto_14315 ) ) ( ON ?auto_14313 ?auto_14312 ) ( CLEAR ?auto_14313 ) ( ON-TABLE ?auto_14315 ) ( HOLDING ?auto_14316 ) ( CLEAR ?auto_14314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14314 ?auto_14316 )
      ( MAKE-2PILE ?auto_14312 ?auto_14313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14317 - BLOCK
      ?auto_14318 - BLOCK
    )
    :vars
    (
      ?auto_14320 - BLOCK
      ?auto_14321 - BLOCK
      ?auto_14319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14317 ?auto_14318 ) ) ( not ( = ?auto_14317 ?auto_14320 ) ) ( not ( = ?auto_14318 ?auto_14320 ) ) ( ON-TABLE ?auto_14321 ) ( not ( = ?auto_14321 ?auto_14320 ) ) ( not ( = ?auto_14321 ?auto_14318 ) ) ( not ( = ?auto_14321 ?auto_14317 ) ) ( ON ?auto_14317 ?auto_14319 ) ( not ( = ?auto_14317 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( not ( = ?auto_14320 ?auto_14319 ) ) ( not ( = ?auto_14321 ?auto_14319 ) ) ( ON ?auto_14318 ?auto_14317 ) ( ON-TABLE ?auto_14319 ) ( CLEAR ?auto_14321 ) ( ON ?auto_14320 ?auto_14318 ) ( CLEAR ?auto_14320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14319 ?auto_14317 ?auto_14318 )
      ( MAKE-2PILE ?auto_14317 ?auto_14318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14322 - BLOCK
      ?auto_14323 - BLOCK
    )
    :vars
    (
      ?auto_14325 - BLOCK
      ?auto_14326 - BLOCK
      ?auto_14324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14322 ?auto_14323 ) ) ( not ( = ?auto_14322 ?auto_14325 ) ) ( not ( = ?auto_14323 ?auto_14325 ) ) ( not ( = ?auto_14326 ?auto_14325 ) ) ( not ( = ?auto_14326 ?auto_14323 ) ) ( not ( = ?auto_14326 ?auto_14322 ) ) ( ON ?auto_14322 ?auto_14324 ) ( not ( = ?auto_14322 ?auto_14324 ) ) ( not ( = ?auto_14323 ?auto_14324 ) ) ( not ( = ?auto_14325 ?auto_14324 ) ) ( not ( = ?auto_14326 ?auto_14324 ) ) ( ON ?auto_14323 ?auto_14322 ) ( ON-TABLE ?auto_14324 ) ( ON ?auto_14325 ?auto_14323 ) ( CLEAR ?auto_14325 ) ( HOLDING ?auto_14326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14326 )
      ( MAKE-2PILE ?auto_14322 ?auto_14323 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14327 - BLOCK
      ?auto_14328 - BLOCK
    )
    :vars
    (
      ?auto_14331 - BLOCK
      ?auto_14329 - BLOCK
      ?auto_14330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14331 ) ) ( not ( = ?auto_14328 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14331 ) ) ( not ( = ?auto_14329 ?auto_14328 ) ) ( not ( = ?auto_14329 ?auto_14327 ) ) ( ON ?auto_14327 ?auto_14330 ) ( not ( = ?auto_14327 ?auto_14330 ) ) ( not ( = ?auto_14328 ?auto_14330 ) ) ( not ( = ?auto_14331 ?auto_14330 ) ) ( not ( = ?auto_14329 ?auto_14330 ) ) ( ON ?auto_14328 ?auto_14327 ) ( ON-TABLE ?auto_14330 ) ( ON ?auto_14331 ?auto_14328 ) ( ON ?auto_14329 ?auto_14331 ) ( CLEAR ?auto_14329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14330 ?auto_14327 ?auto_14328 ?auto_14331 )
      ( MAKE-2PILE ?auto_14327 ?auto_14328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14333 - BLOCK
    )
    :vars
    (
      ?auto_14334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14334 ?auto_14333 ) ( CLEAR ?auto_14334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14333 ) ( not ( = ?auto_14333 ?auto_14334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14334 ?auto_14333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14335 - BLOCK
    )
    :vars
    (
      ?auto_14336 - BLOCK
      ?auto_14337 - BLOCK
      ?auto_14338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14336 ?auto_14335 ) ( CLEAR ?auto_14336 ) ( ON-TABLE ?auto_14335 ) ( not ( = ?auto_14335 ?auto_14336 ) ) ( HOLDING ?auto_14337 ) ( CLEAR ?auto_14338 ) ( not ( = ?auto_14335 ?auto_14337 ) ) ( not ( = ?auto_14335 ?auto_14338 ) ) ( not ( = ?auto_14336 ?auto_14337 ) ) ( not ( = ?auto_14336 ?auto_14338 ) ) ( not ( = ?auto_14337 ?auto_14338 ) ) )
    :subtasks
    ( ( !STACK ?auto_14337 ?auto_14338 )
      ( MAKE-1PILE ?auto_14335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14339 - BLOCK
    )
    :vars
    (
      ?auto_14342 - BLOCK
      ?auto_14340 - BLOCK
      ?auto_14341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14342 ?auto_14339 ) ( ON-TABLE ?auto_14339 ) ( not ( = ?auto_14339 ?auto_14342 ) ) ( CLEAR ?auto_14340 ) ( not ( = ?auto_14339 ?auto_14341 ) ) ( not ( = ?auto_14339 ?auto_14340 ) ) ( not ( = ?auto_14342 ?auto_14341 ) ) ( not ( = ?auto_14342 ?auto_14340 ) ) ( not ( = ?auto_14341 ?auto_14340 ) ) ( ON ?auto_14341 ?auto_14342 ) ( CLEAR ?auto_14341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14339 ?auto_14342 )
      ( MAKE-1PILE ?auto_14339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14343 - BLOCK
    )
    :vars
    (
      ?auto_14346 - BLOCK
      ?auto_14345 - BLOCK
      ?auto_14344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14346 ?auto_14343 ) ( ON-TABLE ?auto_14343 ) ( not ( = ?auto_14343 ?auto_14346 ) ) ( not ( = ?auto_14343 ?auto_14345 ) ) ( not ( = ?auto_14343 ?auto_14344 ) ) ( not ( = ?auto_14346 ?auto_14345 ) ) ( not ( = ?auto_14346 ?auto_14344 ) ) ( not ( = ?auto_14345 ?auto_14344 ) ) ( ON ?auto_14345 ?auto_14346 ) ( CLEAR ?auto_14345 ) ( HOLDING ?auto_14344 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14344 )
      ( MAKE-1PILE ?auto_14343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14347 - BLOCK
    )
    :vars
    (
      ?auto_14349 - BLOCK
      ?auto_14348 - BLOCK
      ?auto_14350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14349 ?auto_14347 ) ( ON-TABLE ?auto_14347 ) ( not ( = ?auto_14347 ?auto_14349 ) ) ( not ( = ?auto_14347 ?auto_14348 ) ) ( not ( = ?auto_14347 ?auto_14350 ) ) ( not ( = ?auto_14349 ?auto_14348 ) ) ( not ( = ?auto_14349 ?auto_14350 ) ) ( not ( = ?auto_14348 ?auto_14350 ) ) ( ON ?auto_14348 ?auto_14349 ) ( ON ?auto_14350 ?auto_14348 ) ( CLEAR ?auto_14350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14347 ?auto_14349 ?auto_14348 )
      ( MAKE-1PILE ?auto_14347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14351 - BLOCK
    )
    :vars
    (
      ?auto_14354 - BLOCK
      ?auto_14352 - BLOCK
      ?auto_14353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14354 ?auto_14351 ) ( ON-TABLE ?auto_14351 ) ( not ( = ?auto_14351 ?auto_14354 ) ) ( not ( = ?auto_14351 ?auto_14352 ) ) ( not ( = ?auto_14351 ?auto_14353 ) ) ( not ( = ?auto_14354 ?auto_14352 ) ) ( not ( = ?auto_14354 ?auto_14353 ) ) ( not ( = ?auto_14352 ?auto_14353 ) ) ( ON ?auto_14352 ?auto_14354 ) ( HOLDING ?auto_14353 ) ( CLEAR ?auto_14352 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14351 ?auto_14354 ?auto_14352 ?auto_14353 )
      ( MAKE-1PILE ?auto_14351 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14355 - BLOCK
    )
    :vars
    (
      ?auto_14357 - BLOCK
      ?auto_14358 - BLOCK
      ?auto_14356 - BLOCK
      ?auto_14359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14357 ?auto_14355 ) ( ON-TABLE ?auto_14355 ) ( not ( = ?auto_14355 ?auto_14357 ) ) ( not ( = ?auto_14355 ?auto_14358 ) ) ( not ( = ?auto_14355 ?auto_14356 ) ) ( not ( = ?auto_14357 ?auto_14358 ) ) ( not ( = ?auto_14357 ?auto_14356 ) ) ( not ( = ?auto_14358 ?auto_14356 ) ) ( ON ?auto_14358 ?auto_14357 ) ( CLEAR ?auto_14358 ) ( ON ?auto_14356 ?auto_14359 ) ( CLEAR ?auto_14356 ) ( HAND-EMPTY ) ( not ( = ?auto_14355 ?auto_14359 ) ) ( not ( = ?auto_14357 ?auto_14359 ) ) ( not ( = ?auto_14358 ?auto_14359 ) ) ( not ( = ?auto_14356 ?auto_14359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14356 ?auto_14359 )
      ( MAKE-1PILE ?auto_14355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14360 - BLOCK
    )
    :vars
    (
      ?auto_14363 - BLOCK
      ?auto_14362 - BLOCK
      ?auto_14364 - BLOCK
      ?auto_14361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14363 ?auto_14360 ) ( ON-TABLE ?auto_14360 ) ( not ( = ?auto_14360 ?auto_14363 ) ) ( not ( = ?auto_14360 ?auto_14362 ) ) ( not ( = ?auto_14360 ?auto_14364 ) ) ( not ( = ?auto_14363 ?auto_14362 ) ) ( not ( = ?auto_14363 ?auto_14364 ) ) ( not ( = ?auto_14362 ?auto_14364 ) ) ( ON ?auto_14364 ?auto_14361 ) ( CLEAR ?auto_14364 ) ( not ( = ?auto_14360 ?auto_14361 ) ) ( not ( = ?auto_14363 ?auto_14361 ) ) ( not ( = ?auto_14362 ?auto_14361 ) ) ( not ( = ?auto_14364 ?auto_14361 ) ) ( HOLDING ?auto_14362 ) ( CLEAR ?auto_14363 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14360 ?auto_14363 ?auto_14362 )
      ( MAKE-1PILE ?auto_14360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14365 - BLOCK
    )
    :vars
    (
      ?auto_14367 - BLOCK
      ?auto_14366 - BLOCK
      ?auto_14368 - BLOCK
      ?auto_14369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14367 ?auto_14365 ) ( ON-TABLE ?auto_14365 ) ( not ( = ?auto_14365 ?auto_14367 ) ) ( not ( = ?auto_14365 ?auto_14366 ) ) ( not ( = ?auto_14365 ?auto_14368 ) ) ( not ( = ?auto_14367 ?auto_14366 ) ) ( not ( = ?auto_14367 ?auto_14368 ) ) ( not ( = ?auto_14366 ?auto_14368 ) ) ( ON ?auto_14368 ?auto_14369 ) ( not ( = ?auto_14365 ?auto_14369 ) ) ( not ( = ?auto_14367 ?auto_14369 ) ) ( not ( = ?auto_14366 ?auto_14369 ) ) ( not ( = ?auto_14368 ?auto_14369 ) ) ( CLEAR ?auto_14367 ) ( ON ?auto_14366 ?auto_14368 ) ( CLEAR ?auto_14366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14369 ?auto_14368 )
      ( MAKE-1PILE ?auto_14365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14380 - BLOCK
    )
    :vars
    (
      ?auto_14384 - BLOCK
      ?auto_14383 - BLOCK
      ?auto_14381 - BLOCK
      ?auto_14382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14380 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14383 ) ) ( not ( = ?auto_14380 ?auto_14381 ) ) ( not ( = ?auto_14384 ?auto_14383 ) ) ( not ( = ?auto_14384 ?auto_14381 ) ) ( not ( = ?auto_14383 ?auto_14381 ) ) ( ON ?auto_14381 ?auto_14382 ) ( not ( = ?auto_14380 ?auto_14382 ) ) ( not ( = ?auto_14384 ?auto_14382 ) ) ( not ( = ?auto_14383 ?auto_14382 ) ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( ON ?auto_14383 ?auto_14381 ) ( ON-TABLE ?auto_14382 ) ( ON ?auto_14384 ?auto_14383 ) ( CLEAR ?auto_14384 ) ( HOLDING ?auto_14380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14380 ?auto_14384 )
      ( MAKE-1PILE ?auto_14380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14385 - BLOCK
    )
    :vars
    (
      ?auto_14389 - BLOCK
      ?auto_14386 - BLOCK
      ?auto_14388 - BLOCK
      ?auto_14387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14385 ?auto_14389 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( not ( = ?auto_14385 ?auto_14388 ) ) ( not ( = ?auto_14389 ?auto_14386 ) ) ( not ( = ?auto_14389 ?auto_14388 ) ) ( not ( = ?auto_14386 ?auto_14388 ) ) ( ON ?auto_14388 ?auto_14387 ) ( not ( = ?auto_14385 ?auto_14387 ) ) ( not ( = ?auto_14389 ?auto_14387 ) ) ( not ( = ?auto_14386 ?auto_14387 ) ) ( not ( = ?auto_14388 ?auto_14387 ) ) ( ON ?auto_14386 ?auto_14388 ) ( ON-TABLE ?auto_14387 ) ( ON ?auto_14389 ?auto_14386 ) ( ON ?auto_14385 ?auto_14389 ) ( CLEAR ?auto_14385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14387 ?auto_14388 ?auto_14386 ?auto_14389 )
      ( MAKE-1PILE ?auto_14385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14393 - BLOCK
      ?auto_14394 - BLOCK
      ?auto_14395 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14395 ) ( CLEAR ?auto_14394 ) ( ON-TABLE ?auto_14393 ) ( ON ?auto_14394 ?auto_14393 ) ( not ( = ?auto_14393 ?auto_14394 ) ) ( not ( = ?auto_14393 ?auto_14395 ) ) ( not ( = ?auto_14394 ?auto_14395 ) ) )
    :subtasks
    ( ( !STACK ?auto_14395 ?auto_14394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14396 - BLOCK
      ?auto_14397 - BLOCK
      ?auto_14398 - BLOCK
    )
    :vars
    (
      ?auto_14399 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14397 ) ( ON-TABLE ?auto_14396 ) ( ON ?auto_14397 ?auto_14396 ) ( not ( = ?auto_14396 ?auto_14397 ) ) ( not ( = ?auto_14396 ?auto_14398 ) ) ( not ( = ?auto_14397 ?auto_14398 ) ) ( ON ?auto_14398 ?auto_14399 ) ( CLEAR ?auto_14398 ) ( HAND-EMPTY ) ( not ( = ?auto_14396 ?auto_14399 ) ) ( not ( = ?auto_14397 ?auto_14399 ) ) ( not ( = ?auto_14398 ?auto_14399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14398 ?auto_14399 )
      ( MAKE-3PILE ?auto_14396 ?auto_14397 ?auto_14398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14400 - BLOCK
      ?auto_14401 - BLOCK
      ?auto_14402 - BLOCK
    )
    :vars
    (
      ?auto_14403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14400 ) ( not ( = ?auto_14400 ?auto_14401 ) ) ( not ( = ?auto_14400 ?auto_14402 ) ) ( not ( = ?auto_14401 ?auto_14402 ) ) ( ON ?auto_14402 ?auto_14403 ) ( CLEAR ?auto_14402 ) ( not ( = ?auto_14400 ?auto_14403 ) ) ( not ( = ?auto_14401 ?auto_14403 ) ) ( not ( = ?auto_14402 ?auto_14403 ) ) ( HOLDING ?auto_14401 ) ( CLEAR ?auto_14400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14400 ?auto_14401 )
      ( MAKE-3PILE ?auto_14400 ?auto_14401 ?auto_14402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14404 - BLOCK
      ?auto_14405 - BLOCK
      ?auto_14406 - BLOCK
    )
    :vars
    (
      ?auto_14407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14404 ) ( not ( = ?auto_14404 ?auto_14405 ) ) ( not ( = ?auto_14404 ?auto_14406 ) ) ( not ( = ?auto_14405 ?auto_14406 ) ) ( ON ?auto_14406 ?auto_14407 ) ( not ( = ?auto_14404 ?auto_14407 ) ) ( not ( = ?auto_14405 ?auto_14407 ) ) ( not ( = ?auto_14406 ?auto_14407 ) ) ( CLEAR ?auto_14404 ) ( ON ?auto_14405 ?auto_14406 ) ( CLEAR ?auto_14405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14407 ?auto_14406 )
      ( MAKE-3PILE ?auto_14404 ?auto_14405 ?auto_14406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14408 - BLOCK
      ?auto_14409 - BLOCK
      ?auto_14410 - BLOCK
    )
    :vars
    (
      ?auto_14411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14408 ?auto_14409 ) ) ( not ( = ?auto_14408 ?auto_14410 ) ) ( not ( = ?auto_14409 ?auto_14410 ) ) ( ON ?auto_14410 ?auto_14411 ) ( not ( = ?auto_14408 ?auto_14411 ) ) ( not ( = ?auto_14409 ?auto_14411 ) ) ( not ( = ?auto_14410 ?auto_14411 ) ) ( ON ?auto_14409 ?auto_14410 ) ( CLEAR ?auto_14409 ) ( ON-TABLE ?auto_14411 ) ( HOLDING ?auto_14408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14408 )
      ( MAKE-3PILE ?auto_14408 ?auto_14409 ?auto_14410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14412 - BLOCK
      ?auto_14413 - BLOCK
      ?auto_14414 - BLOCK
    )
    :vars
    (
      ?auto_14415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14412 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14414 ) ) ( ON ?auto_14414 ?auto_14415 ) ( not ( = ?auto_14412 ?auto_14415 ) ) ( not ( = ?auto_14413 ?auto_14415 ) ) ( not ( = ?auto_14414 ?auto_14415 ) ) ( ON ?auto_14413 ?auto_14414 ) ( ON-TABLE ?auto_14415 ) ( ON ?auto_14412 ?auto_14413 ) ( CLEAR ?auto_14412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14415 ?auto_14414 ?auto_14413 )
      ( MAKE-3PILE ?auto_14412 ?auto_14413 ?auto_14414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14416 - BLOCK
      ?auto_14417 - BLOCK
      ?auto_14418 - BLOCK
    )
    :vars
    (
      ?auto_14419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14416 ?auto_14417 ) ) ( not ( = ?auto_14416 ?auto_14418 ) ) ( not ( = ?auto_14417 ?auto_14418 ) ) ( ON ?auto_14418 ?auto_14419 ) ( not ( = ?auto_14416 ?auto_14419 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( ON ?auto_14417 ?auto_14418 ) ( ON-TABLE ?auto_14419 ) ( HOLDING ?auto_14416 ) ( CLEAR ?auto_14417 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14419 ?auto_14418 ?auto_14417 ?auto_14416 )
      ( MAKE-3PILE ?auto_14416 ?auto_14417 ?auto_14418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14420 - BLOCK
      ?auto_14421 - BLOCK
      ?auto_14422 - BLOCK
    )
    :vars
    (
      ?auto_14423 - BLOCK
      ?auto_14424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14420 ?auto_14421 ) ) ( not ( = ?auto_14420 ?auto_14422 ) ) ( not ( = ?auto_14421 ?auto_14422 ) ) ( ON ?auto_14422 ?auto_14423 ) ( not ( = ?auto_14420 ?auto_14423 ) ) ( not ( = ?auto_14421 ?auto_14423 ) ) ( not ( = ?auto_14422 ?auto_14423 ) ) ( ON ?auto_14421 ?auto_14422 ) ( ON-TABLE ?auto_14423 ) ( CLEAR ?auto_14421 ) ( ON ?auto_14420 ?auto_14424 ) ( CLEAR ?auto_14420 ) ( HAND-EMPTY ) ( not ( = ?auto_14420 ?auto_14424 ) ) ( not ( = ?auto_14421 ?auto_14424 ) ) ( not ( = ?auto_14422 ?auto_14424 ) ) ( not ( = ?auto_14423 ?auto_14424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14420 ?auto_14424 )
      ( MAKE-3PILE ?auto_14420 ?auto_14421 ?auto_14422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14425 - BLOCK
      ?auto_14426 - BLOCK
      ?auto_14427 - BLOCK
    )
    :vars
    (
      ?auto_14428 - BLOCK
      ?auto_14429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14425 ?auto_14426 ) ) ( not ( = ?auto_14425 ?auto_14427 ) ) ( not ( = ?auto_14426 ?auto_14427 ) ) ( ON ?auto_14427 ?auto_14428 ) ( not ( = ?auto_14425 ?auto_14428 ) ) ( not ( = ?auto_14426 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14428 ) ) ( ON-TABLE ?auto_14428 ) ( ON ?auto_14425 ?auto_14429 ) ( CLEAR ?auto_14425 ) ( not ( = ?auto_14425 ?auto_14429 ) ) ( not ( = ?auto_14426 ?auto_14429 ) ) ( not ( = ?auto_14427 ?auto_14429 ) ) ( not ( = ?auto_14428 ?auto_14429 ) ) ( HOLDING ?auto_14426 ) ( CLEAR ?auto_14427 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14428 ?auto_14427 ?auto_14426 )
      ( MAKE-3PILE ?auto_14425 ?auto_14426 ?auto_14427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14430 - BLOCK
      ?auto_14431 - BLOCK
      ?auto_14432 - BLOCK
    )
    :vars
    (
      ?auto_14434 - BLOCK
      ?auto_14433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14430 ?auto_14432 ) ) ( not ( = ?auto_14431 ?auto_14432 ) ) ( ON ?auto_14432 ?auto_14434 ) ( not ( = ?auto_14430 ?auto_14434 ) ) ( not ( = ?auto_14431 ?auto_14434 ) ) ( not ( = ?auto_14432 ?auto_14434 ) ) ( ON-TABLE ?auto_14434 ) ( ON ?auto_14430 ?auto_14433 ) ( not ( = ?auto_14430 ?auto_14433 ) ) ( not ( = ?auto_14431 ?auto_14433 ) ) ( not ( = ?auto_14432 ?auto_14433 ) ) ( not ( = ?auto_14434 ?auto_14433 ) ) ( CLEAR ?auto_14432 ) ( ON ?auto_14431 ?auto_14430 ) ( CLEAR ?auto_14431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14433 ?auto_14430 )
      ( MAKE-3PILE ?auto_14430 ?auto_14431 ?auto_14432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14435 - BLOCK
      ?auto_14436 - BLOCK
      ?auto_14437 - BLOCK
    )
    :vars
    (
      ?auto_14439 - BLOCK
      ?auto_14438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14435 ?auto_14436 ) ) ( not ( = ?auto_14435 ?auto_14437 ) ) ( not ( = ?auto_14436 ?auto_14437 ) ) ( not ( = ?auto_14435 ?auto_14439 ) ) ( not ( = ?auto_14436 ?auto_14439 ) ) ( not ( = ?auto_14437 ?auto_14439 ) ) ( ON-TABLE ?auto_14439 ) ( ON ?auto_14435 ?auto_14438 ) ( not ( = ?auto_14435 ?auto_14438 ) ) ( not ( = ?auto_14436 ?auto_14438 ) ) ( not ( = ?auto_14437 ?auto_14438 ) ) ( not ( = ?auto_14439 ?auto_14438 ) ) ( ON ?auto_14436 ?auto_14435 ) ( CLEAR ?auto_14436 ) ( ON-TABLE ?auto_14438 ) ( HOLDING ?auto_14437 ) ( CLEAR ?auto_14439 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14439 ?auto_14437 )
      ( MAKE-3PILE ?auto_14435 ?auto_14436 ?auto_14437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14440 - BLOCK
      ?auto_14441 - BLOCK
      ?auto_14442 - BLOCK
    )
    :vars
    (
      ?auto_14444 - BLOCK
      ?auto_14443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14440 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14444 ) ) ( not ( = ?auto_14441 ?auto_14444 ) ) ( not ( = ?auto_14442 ?auto_14444 ) ) ( ON-TABLE ?auto_14444 ) ( ON ?auto_14440 ?auto_14443 ) ( not ( = ?auto_14440 ?auto_14443 ) ) ( not ( = ?auto_14441 ?auto_14443 ) ) ( not ( = ?auto_14442 ?auto_14443 ) ) ( not ( = ?auto_14444 ?auto_14443 ) ) ( ON ?auto_14441 ?auto_14440 ) ( ON-TABLE ?auto_14443 ) ( CLEAR ?auto_14444 ) ( ON ?auto_14442 ?auto_14441 ) ( CLEAR ?auto_14442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14443 ?auto_14440 ?auto_14441 )
      ( MAKE-3PILE ?auto_14440 ?auto_14441 ?auto_14442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14445 - BLOCK
      ?auto_14446 - BLOCK
      ?auto_14447 - BLOCK
    )
    :vars
    (
      ?auto_14448 - BLOCK
      ?auto_14449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14445 ?auto_14446 ) ) ( not ( = ?auto_14445 ?auto_14447 ) ) ( not ( = ?auto_14446 ?auto_14447 ) ) ( not ( = ?auto_14445 ?auto_14448 ) ) ( not ( = ?auto_14446 ?auto_14448 ) ) ( not ( = ?auto_14447 ?auto_14448 ) ) ( ON ?auto_14445 ?auto_14449 ) ( not ( = ?auto_14445 ?auto_14449 ) ) ( not ( = ?auto_14446 ?auto_14449 ) ) ( not ( = ?auto_14447 ?auto_14449 ) ) ( not ( = ?auto_14448 ?auto_14449 ) ) ( ON ?auto_14446 ?auto_14445 ) ( ON-TABLE ?auto_14449 ) ( ON ?auto_14447 ?auto_14446 ) ( CLEAR ?auto_14447 ) ( HOLDING ?auto_14448 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14448 )
      ( MAKE-3PILE ?auto_14445 ?auto_14446 ?auto_14447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14450 - BLOCK
      ?auto_14451 - BLOCK
      ?auto_14452 - BLOCK
    )
    :vars
    (
      ?auto_14453 - BLOCK
      ?auto_14454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14450 ?auto_14451 ) ) ( not ( = ?auto_14450 ?auto_14452 ) ) ( not ( = ?auto_14451 ?auto_14452 ) ) ( not ( = ?auto_14450 ?auto_14453 ) ) ( not ( = ?auto_14451 ?auto_14453 ) ) ( not ( = ?auto_14452 ?auto_14453 ) ) ( ON ?auto_14450 ?auto_14454 ) ( not ( = ?auto_14450 ?auto_14454 ) ) ( not ( = ?auto_14451 ?auto_14454 ) ) ( not ( = ?auto_14452 ?auto_14454 ) ) ( not ( = ?auto_14453 ?auto_14454 ) ) ( ON ?auto_14451 ?auto_14450 ) ( ON-TABLE ?auto_14454 ) ( ON ?auto_14452 ?auto_14451 ) ( ON ?auto_14453 ?auto_14452 ) ( CLEAR ?auto_14453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14454 ?auto_14450 ?auto_14451 ?auto_14452 )
      ( MAKE-3PILE ?auto_14450 ?auto_14451 ?auto_14452 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14459 - BLOCK
      ?auto_14460 - BLOCK
      ?auto_14461 - BLOCK
      ?auto_14462 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14462 ) ( CLEAR ?auto_14461 ) ( ON-TABLE ?auto_14459 ) ( ON ?auto_14460 ?auto_14459 ) ( ON ?auto_14461 ?auto_14460 ) ( not ( = ?auto_14459 ?auto_14460 ) ) ( not ( = ?auto_14459 ?auto_14461 ) ) ( not ( = ?auto_14459 ?auto_14462 ) ) ( not ( = ?auto_14460 ?auto_14461 ) ) ( not ( = ?auto_14460 ?auto_14462 ) ) ( not ( = ?auto_14461 ?auto_14462 ) ) )
    :subtasks
    ( ( !STACK ?auto_14462 ?auto_14461 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14463 - BLOCK
      ?auto_14464 - BLOCK
      ?auto_14465 - BLOCK
      ?auto_14466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14465 ) ( ON-TABLE ?auto_14463 ) ( ON ?auto_14464 ?auto_14463 ) ( ON ?auto_14465 ?auto_14464 ) ( not ( = ?auto_14463 ?auto_14464 ) ) ( not ( = ?auto_14463 ?auto_14465 ) ) ( not ( = ?auto_14463 ?auto_14466 ) ) ( not ( = ?auto_14464 ?auto_14465 ) ) ( not ( = ?auto_14464 ?auto_14466 ) ) ( not ( = ?auto_14465 ?auto_14466 ) ) ( ON-TABLE ?auto_14466 ) ( CLEAR ?auto_14466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_14466 )
      ( MAKE-4PILE ?auto_14463 ?auto_14464 ?auto_14465 ?auto_14466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14467 - BLOCK
      ?auto_14468 - BLOCK
      ?auto_14469 - BLOCK
      ?auto_14470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14467 ) ( ON ?auto_14468 ?auto_14467 ) ( not ( = ?auto_14467 ?auto_14468 ) ) ( not ( = ?auto_14467 ?auto_14469 ) ) ( not ( = ?auto_14467 ?auto_14470 ) ) ( not ( = ?auto_14468 ?auto_14469 ) ) ( not ( = ?auto_14468 ?auto_14470 ) ) ( not ( = ?auto_14469 ?auto_14470 ) ) ( ON-TABLE ?auto_14470 ) ( CLEAR ?auto_14470 ) ( HOLDING ?auto_14469 ) ( CLEAR ?auto_14468 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14467 ?auto_14468 ?auto_14469 )
      ( MAKE-4PILE ?auto_14467 ?auto_14468 ?auto_14469 ?auto_14470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14471 - BLOCK
      ?auto_14472 - BLOCK
      ?auto_14473 - BLOCK
      ?auto_14474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14471 ) ( ON ?auto_14472 ?auto_14471 ) ( not ( = ?auto_14471 ?auto_14472 ) ) ( not ( = ?auto_14471 ?auto_14473 ) ) ( not ( = ?auto_14471 ?auto_14474 ) ) ( not ( = ?auto_14472 ?auto_14473 ) ) ( not ( = ?auto_14472 ?auto_14474 ) ) ( not ( = ?auto_14473 ?auto_14474 ) ) ( ON-TABLE ?auto_14474 ) ( CLEAR ?auto_14472 ) ( ON ?auto_14473 ?auto_14474 ) ( CLEAR ?auto_14473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14474 )
      ( MAKE-4PILE ?auto_14471 ?auto_14472 ?auto_14473 ?auto_14474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14475 - BLOCK
      ?auto_14476 - BLOCK
      ?auto_14477 - BLOCK
      ?auto_14478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14475 ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14475 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14477 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( ON-TABLE ?auto_14478 ) ( ON ?auto_14477 ?auto_14478 ) ( CLEAR ?auto_14477 ) ( HOLDING ?auto_14476 ) ( CLEAR ?auto_14475 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14475 ?auto_14476 )
      ( MAKE-4PILE ?auto_14475 ?auto_14476 ?auto_14477 ?auto_14478 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14479 - BLOCK
      ?auto_14480 - BLOCK
      ?auto_14481 - BLOCK
      ?auto_14482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14479 ) ( not ( = ?auto_14479 ?auto_14480 ) ) ( not ( = ?auto_14479 ?auto_14481 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14480 ?auto_14481 ) ) ( not ( = ?auto_14480 ?auto_14482 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( ON-TABLE ?auto_14482 ) ( ON ?auto_14481 ?auto_14482 ) ( CLEAR ?auto_14479 ) ( ON ?auto_14480 ?auto_14481 ) ( CLEAR ?auto_14480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14482 ?auto_14481 )
      ( MAKE-4PILE ?auto_14479 ?auto_14480 ?auto_14481 ?auto_14482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14483 - BLOCK
      ?auto_14484 - BLOCK
      ?auto_14485 - BLOCK
      ?auto_14486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14483 ?auto_14484 ) ) ( not ( = ?auto_14483 ?auto_14485 ) ) ( not ( = ?auto_14483 ?auto_14486 ) ) ( not ( = ?auto_14484 ?auto_14485 ) ) ( not ( = ?auto_14484 ?auto_14486 ) ) ( not ( = ?auto_14485 ?auto_14486 ) ) ( ON-TABLE ?auto_14486 ) ( ON ?auto_14485 ?auto_14486 ) ( ON ?auto_14484 ?auto_14485 ) ( CLEAR ?auto_14484 ) ( HOLDING ?auto_14483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14483 )
      ( MAKE-4PILE ?auto_14483 ?auto_14484 ?auto_14485 ?auto_14486 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14487 - BLOCK
      ?auto_14488 - BLOCK
      ?auto_14489 - BLOCK
      ?auto_14490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14487 ?auto_14488 ) ) ( not ( = ?auto_14487 ?auto_14489 ) ) ( not ( = ?auto_14487 ?auto_14490 ) ) ( not ( = ?auto_14488 ?auto_14489 ) ) ( not ( = ?auto_14488 ?auto_14490 ) ) ( not ( = ?auto_14489 ?auto_14490 ) ) ( ON-TABLE ?auto_14490 ) ( ON ?auto_14489 ?auto_14490 ) ( ON ?auto_14488 ?auto_14489 ) ( ON ?auto_14487 ?auto_14488 ) ( CLEAR ?auto_14487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14490 ?auto_14489 ?auto_14488 )
      ( MAKE-4PILE ?auto_14487 ?auto_14488 ?auto_14489 ?auto_14490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14491 - BLOCK
      ?auto_14492 - BLOCK
      ?auto_14493 - BLOCK
      ?auto_14494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14491 ?auto_14493 ) ) ( not ( = ?auto_14491 ?auto_14494 ) ) ( not ( = ?auto_14492 ?auto_14493 ) ) ( not ( = ?auto_14492 ?auto_14494 ) ) ( not ( = ?auto_14493 ?auto_14494 ) ) ( ON-TABLE ?auto_14494 ) ( ON ?auto_14493 ?auto_14494 ) ( ON ?auto_14492 ?auto_14493 ) ( HOLDING ?auto_14491 ) ( CLEAR ?auto_14492 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14494 ?auto_14493 ?auto_14492 ?auto_14491 )
      ( MAKE-4PILE ?auto_14491 ?auto_14492 ?auto_14493 ?auto_14494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14495 - BLOCK
      ?auto_14496 - BLOCK
      ?auto_14497 - BLOCK
      ?auto_14498 - BLOCK
    )
    :vars
    (
      ?auto_14499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14495 ?auto_14496 ) ) ( not ( = ?auto_14495 ?auto_14497 ) ) ( not ( = ?auto_14495 ?auto_14498 ) ) ( not ( = ?auto_14496 ?auto_14497 ) ) ( not ( = ?auto_14496 ?auto_14498 ) ) ( not ( = ?auto_14497 ?auto_14498 ) ) ( ON-TABLE ?auto_14498 ) ( ON ?auto_14497 ?auto_14498 ) ( ON ?auto_14496 ?auto_14497 ) ( CLEAR ?auto_14496 ) ( ON ?auto_14495 ?auto_14499 ) ( CLEAR ?auto_14495 ) ( HAND-EMPTY ) ( not ( = ?auto_14495 ?auto_14499 ) ) ( not ( = ?auto_14496 ?auto_14499 ) ) ( not ( = ?auto_14497 ?auto_14499 ) ) ( not ( = ?auto_14498 ?auto_14499 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14495 ?auto_14499 )
      ( MAKE-4PILE ?auto_14495 ?auto_14496 ?auto_14497 ?auto_14498 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14500 - BLOCK
      ?auto_14501 - BLOCK
      ?auto_14502 - BLOCK
      ?auto_14503 - BLOCK
    )
    :vars
    (
      ?auto_14504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14500 ?auto_14501 ) ) ( not ( = ?auto_14500 ?auto_14502 ) ) ( not ( = ?auto_14500 ?auto_14503 ) ) ( not ( = ?auto_14501 ?auto_14502 ) ) ( not ( = ?auto_14501 ?auto_14503 ) ) ( not ( = ?auto_14502 ?auto_14503 ) ) ( ON-TABLE ?auto_14503 ) ( ON ?auto_14502 ?auto_14503 ) ( ON ?auto_14500 ?auto_14504 ) ( CLEAR ?auto_14500 ) ( not ( = ?auto_14500 ?auto_14504 ) ) ( not ( = ?auto_14501 ?auto_14504 ) ) ( not ( = ?auto_14502 ?auto_14504 ) ) ( not ( = ?auto_14503 ?auto_14504 ) ) ( HOLDING ?auto_14501 ) ( CLEAR ?auto_14502 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14503 ?auto_14502 ?auto_14501 )
      ( MAKE-4PILE ?auto_14500 ?auto_14501 ?auto_14502 ?auto_14503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14505 - BLOCK
      ?auto_14506 - BLOCK
      ?auto_14507 - BLOCK
      ?auto_14508 - BLOCK
    )
    :vars
    (
      ?auto_14509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14505 ?auto_14506 ) ) ( not ( = ?auto_14505 ?auto_14507 ) ) ( not ( = ?auto_14505 ?auto_14508 ) ) ( not ( = ?auto_14506 ?auto_14507 ) ) ( not ( = ?auto_14506 ?auto_14508 ) ) ( not ( = ?auto_14507 ?auto_14508 ) ) ( ON-TABLE ?auto_14508 ) ( ON ?auto_14507 ?auto_14508 ) ( ON ?auto_14505 ?auto_14509 ) ( not ( = ?auto_14505 ?auto_14509 ) ) ( not ( = ?auto_14506 ?auto_14509 ) ) ( not ( = ?auto_14507 ?auto_14509 ) ) ( not ( = ?auto_14508 ?auto_14509 ) ) ( CLEAR ?auto_14507 ) ( ON ?auto_14506 ?auto_14505 ) ( CLEAR ?auto_14506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14509 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14509 ?auto_14505 )
      ( MAKE-4PILE ?auto_14505 ?auto_14506 ?auto_14507 ?auto_14508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14510 - BLOCK
      ?auto_14511 - BLOCK
      ?auto_14512 - BLOCK
      ?auto_14513 - BLOCK
    )
    :vars
    (
      ?auto_14514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14510 ?auto_14511 ) ) ( not ( = ?auto_14510 ?auto_14512 ) ) ( not ( = ?auto_14510 ?auto_14513 ) ) ( not ( = ?auto_14511 ?auto_14512 ) ) ( not ( = ?auto_14511 ?auto_14513 ) ) ( not ( = ?auto_14512 ?auto_14513 ) ) ( ON-TABLE ?auto_14513 ) ( ON ?auto_14510 ?auto_14514 ) ( not ( = ?auto_14510 ?auto_14514 ) ) ( not ( = ?auto_14511 ?auto_14514 ) ) ( not ( = ?auto_14512 ?auto_14514 ) ) ( not ( = ?auto_14513 ?auto_14514 ) ) ( ON ?auto_14511 ?auto_14510 ) ( CLEAR ?auto_14511 ) ( ON-TABLE ?auto_14514 ) ( HOLDING ?auto_14512 ) ( CLEAR ?auto_14513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14513 ?auto_14512 )
      ( MAKE-4PILE ?auto_14510 ?auto_14511 ?auto_14512 ?auto_14513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14515 - BLOCK
      ?auto_14516 - BLOCK
      ?auto_14517 - BLOCK
      ?auto_14518 - BLOCK
    )
    :vars
    (
      ?auto_14519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14515 ?auto_14516 ) ) ( not ( = ?auto_14515 ?auto_14517 ) ) ( not ( = ?auto_14515 ?auto_14518 ) ) ( not ( = ?auto_14516 ?auto_14517 ) ) ( not ( = ?auto_14516 ?auto_14518 ) ) ( not ( = ?auto_14517 ?auto_14518 ) ) ( ON-TABLE ?auto_14518 ) ( ON ?auto_14515 ?auto_14519 ) ( not ( = ?auto_14515 ?auto_14519 ) ) ( not ( = ?auto_14516 ?auto_14519 ) ) ( not ( = ?auto_14517 ?auto_14519 ) ) ( not ( = ?auto_14518 ?auto_14519 ) ) ( ON ?auto_14516 ?auto_14515 ) ( ON-TABLE ?auto_14519 ) ( CLEAR ?auto_14518 ) ( ON ?auto_14517 ?auto_14516 ) ( CLEAR ?auto_14517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14519 ?auto_14515 ?auto_14516 )
      ( MAKE-4PILE ?auto_14515 ?auto_14516 ?auto_14517 ?auto_14518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14520 - BLOCK
      ?auto_14521 - BLOCK
      ?auto_14522 - BLOCK
      ?auto_14523 - BLOCK
    )
    :vars
    (
      ?auto_14524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14520 ?auto_14521 ) ) ( not ( = ?auto_14520 ?auto_14522 ) ) ( not ( = ?auto_14520 ?auto_14523 ) ) ( not ( = ?auto_14521 ?auto_14522 ) ) ( not ( = ?auto_14521 ?auto_14523 ) ) ( not ( = ?auto_14522 ?auto_14523 ) ) ( ON ?auto_14520 ?auto_14524 ) ( not ( = ?auto_14520 ?auto_14524 ) ) ( not ( = ?auto_14521 ?auto_14524 ) ) ( not ( = ?auto_14522 ?auto_14524 ) ) ( not ( = ?auto_14523 ?auto_14524 ) ) ( ON ?auto_14521 ?auto_14520 ) ( ON-TABLE ?auto_14524 ) ( ON ?auto_14522 ?auto_14521 ) ( CLEAR ?auto_14522 ) ( HOLDING ?auto_14523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14523 )
      ( MAKE-4PILE ?auto_14520 ?auto_14521 ?auto_14522 ?auto_14523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14525 - BLOCK
      ?auto_14526 - BLOCK
      ?auto_14527 - BLOCK
      ?auto_14528 - BLOCK
    )
    :vars
    (
      ?auto_14529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14525 ?auto_14526 ) ) ( not ( = ?auto_14525 ?auto_14527 ) ) ( not ( = ?auto_14525 ?auto_14528 ) ) ( not ( = ?auto_14526 ?auto_14527 ) ) ( not ( = ?auto_14526 ?auto_14528 ) ) ( not ( = ?auto_14527 ?auto_14528 ) ) ( ON ?auto_14525 ?auto_14529 ) ( not ( = ?auto_14525 ?auto_14529 ) ) ( not ( = ?auto_14526 ?auto_14529 ) ) ( not ( = ?auto_14527 ?auto_14529 ) ) ( not ( = ?auto_14528 ?auto_14529 ) ) ( ON ?auto_14526 ?auto_14525 ) ( ON-TABLE ?auto_14529 ) ( ON ?auto_14527 ?auto_14526 ) ( ON ?auto_14528 ?auto_14527 ) ( CLEAR ?auto_14528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14529 ?auto_14525 ?auto_14526 ?auto_14527 )
      ( MAKE-4PILE ?auto_14525 ?auto_14526 ?auto_14527 ?auto_14528 ) )
  )

)

