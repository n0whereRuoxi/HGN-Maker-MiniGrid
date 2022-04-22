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
      ?auto_49961 - BLOCK
    )
    :vars
    (
      ?auto_49962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49961 ?auto_49962 ) ( CLEAR ?auto_49961 ) ( HAND-EMPTY ) ( not ( = ?auto_49961 ?auto_49962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49961 ?auto_49962 )
      ( !PUTDOWN ?auto_49961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49964 - BLOCK
    )
    :vars
    (
      ?auto_49965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49964 ?auto_49965 ) ( CLEAR ?auto_49964 ) ( HAND-EMPTY ) ( not ( = ?auto_49964 ?auto_49965 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49964 ?auto_49965 )
      ( !PUTDOWN ?auto_49964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49968 - BLOCK
      ?auto_49969 - BLOCK
    )
    :vars
    (
      ?auto_49970 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49968 ) ( ON ?auto_49969 ?auto_49970 ) ( CLEAR ?auto_49969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49968 ) ( not ( = ?auto_49968 ?auto_49969 ) ) ( not ( = ?auto_49968 ?auto_49970 ) ) ( not ( = ?auto_49969 ?auto_49970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49969 ?auto_49970 )
      ( !STACK ?auto_49969 ?auto_49968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49973 - BLOCK
      ?auto_49974 - BLOCK
    )
    :vars
    (
      ?auto_49975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49973 ) ( ON ?auto_49974 ?auto_49975 ) ( CLEAR ?auto_49974 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49973 ) ( not ( = ?auto_49973 ?auto_49974 ) ) ( not ( = ?auto_49973 ?auto_49975 ) ) ( not ( = ?auto_49974 ?auto_49975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49974 ?auto_49975 )
      ( !STACK ?auto_49974 ?auto_49973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49978 - BLOCK
      ?auto_49979 - BLOCK
    )
    :vars
    (
      ?auto_49980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49979 ?auto_49980 ) ( not ( = ?auto_49978 ?auto_49979 ) ) ( not ( = ?auto_49978 ?auto_49980 ) ) ( not ( = ?auto_49979 ?auto_49980 ) ) ( ON ?auto_49978 ?auto_49979 ) ( CLEAR ?auto_49978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49978 )
      ( MAKE-2PILE ?auto_49978 ?auto_49979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_49983 - BLOCK
      ?auto_49984 - BLOCK
    )
    :vars
    (
      ?auto_49985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49984 ?auto_49985 ) ( not ( = ?auto_49983 ?auto_49984 ) ) ( not ( = ?auto_49983 ?auto_49985 ) ) ( not ( = ?auto_49984 ?auto_49985 ) ) ( ON ?auto_49983 ?auto_49984 ) ( CLEAR ?auto_49983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_49983 )
      ( MAKE-2PILE ?auto_49983 ?auto_49984 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49989 - BLOCK
      ?auto_49990 - BLOCK
      ?auto_49991 - BLOCK
    )
    :vars
    (
      ?auto_49992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49990 ) ( ON ?auto_49991 ?auto_49992 ) ( CLEAR ?auto_49991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49989 ) ( ON ?auto_49990 ?auto_49989 ) ( not ( = ?auto_49989 ?auto_49990 ) ) ( not ( = ?auto_49989 ?auto_49991 ) ) ( not ( = ?auto_49989 ?auto_49992 ) ) ( not ( = ?auto_49990 ?auto_49991 ) ) ( not ( = ?auto_49990 ?auto_49992 ) ) ( not ( = ?auto_49991 ?auto_49992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49991 ?auto_49992 )
      ( !STACK ?auto_49991 ?auto_49990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_49996 - BLOCK
      ?auto_49997 - BLOCK
      ?auto_49998 - BLOCK
    )
    :vars
    (
      ?auto_49999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_49997 ) ( ON ?auto_49998 ?auto_49999 ) ( CLEAR ?auto_49998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_49996 ) ( ON ?auto_49997 ?auto_49996 ) ( not ( = ?auto_49996 ?auto_49997 ) ) ( not ( = ?auto_49996 ?auto_49998 ) ) ( not ( = ?auto_49996 ?auto_49999 ) ) ( not ( = ?auto_49997 ?auto_49998 ) ) ( not ( = ?auto_49997 ?auto_49999 ) ) ( not ( = ?auto_49998 ?auto_49999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_49998 ?auto_49999 )
      ( !STACK ?auto_49998 ?auto_49997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50003 - BLOCK
      ?auto_50004 - BLOCK
      ?auto_50005 - BLOCK
    )
    :vars
    (
      ?auto_50006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50005 ?auto_50006 ) ( ON-TABLE ?auto_50003 ) ( not ( = ?auto_50003 ?auto_50004 ) ) ( not ( = ?auto_50003 ?auto_50005 ) ) ( not ( = ?auto_50003 ?auto_50006 ) ) ( not ( = ?auto_50004 ?auto_50005 ) ) ( not ( = ?auto_50004 ?auto_50006 ) ) ( not ( = ?auto_50005 ?auto_50006 ) ) ( CLEAR ?auto_50003 ) ( ON ?auto_50004 ?auto_50005 ) ( CLEAR ?auto_50004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50003 ?auto_50004 )
      ( MAKE-3PILE ?auto_50003 ?auto_50004 ?auto_50005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50010 - BLOCK
      ?auto_50011 - BLOCK
      ?auto_50012 - BLOCK
    )
    :vars
    (
      ?auto_50013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50012 ?auto_50013 ) ( ON-TABLE ?auto_50010 ) ( not ( = ?auto_50010 ?auto_50011 ) ) ( not ( = ?auto_50010 ?auto_50012 ) ) ( not ( = ?auto_50010 ?auto_50013 ) ) ( not ( = ?auto_50011 ?auto_50012 ) ) ( not ( = ?auto_50011 ?auto_50013 ) ) ( not ( = ?auto_50012 ?auto_50013 ) ) ( CLEAR ?auto_50010 ) ( ON ?auto_50011 ?auto_50012 ) ( CLEAR ?auto_50011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50010 ?auto_50011 )
      ( MAKE-3PILE ?auto_50010 ?auto_50011 ?auto_50012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50017 - BLOCK
      ?auto_50018 - BLOCK
      ?auto_50019 - BLOCK
    )
    :vars
    (
      ?auto_50020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50019 ?auto_50020 ) ( not ( = ?auto_50017 ?auto_50018 ) ) ( not ( = ?auto_50017 ?auto_50019 ) ) ( not ( = ?auto_50017 ?auto_50020 ) ) ( not ( = ?auto_50018 ?auto_50019 ) ) ( not ( = ?auto_50018 ?auto_50020 ) ) ( not ( = ?auto_50019 ?auto_50020 ) ) ( ON ?auto_50018 ?auto_50019 ) ( ON ?auto_50017 ?auto_50018 ) ( CLEAR ?auto_50017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50017 )
      ( MAKE-3PILE ?auto_50017 ?auto_50018 ?auto_50019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50024 - BLOCK
      ?auto_50025 - BLOCK
      ?auto_50026 - BLOCK
    )
    :vars
    (
      ?auto_50027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50026 ?auto_50027 ) ( not ( = ?auto_50024 ?auto_50025 ) ) ( not ( = ?auto_50024 ?auto_50026 ) ) ( not ( = ?auto_50024 ?auto_50027 ) ) ( not ( = ?auto_50025 ?auto_50026 ) ) ( not ( = ?auto_50025 ?auto_50027 ) ) ( not ( = ?auto_50026 ?auto_50027 ) ) ( ON ?auto_50025 ?auto_50026 ) ( ON ?auto_50024 ?auto_50025 ) ( CLEAR ?auto_50024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50024 )
      ( MAKE-3PILE ?auto_50024 ?auto_50025 ?auto_50026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50032 - BLOCK
      ?auto_50033 - BLOCK
      ?auto_50034 - BLOCK
      ?auto_50035 - BLOCK
    )
    :vars
    (
      ?auto_50036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50034 ) ( ON ?auto_50035 ?auto_50036 ) ( CLEAR ?auto_50035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50032 ) ( ON ?auto_50033 ?auto_50032 ) ( ON ?auto_50034 ?auto_50033 ) ( not ( = ?auto_50032 ?auto_50033 ) ) ( not ( = ?auto_50032 ?auto_50034 ) ) ( not ( = ?auto_50032 ?auto_50035 ) ) ( not ( = ?auto_50032 ?auto_50036 ) ) ( not ( = ?auto_50033 ?auto_50034 ) ) ( not ( = ?auto_50033 ?auto_50035 ) ) ( not ( = ?auto_50033 ?auto_50036 ) ) ( not ( = ?auto_50034 ?auto_50035 ) ) ( not ( = ?auto_50034 ?auto_50036 ) ) ( not ( = ?auto_50035 ?auto_50036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50035 ?auto_50036 )
      ( !STACK ?auto_50035 ?auto_50034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50041 - BLOCK
      ?auto_50042 - BLOCK
      ?auto_50043 - BLOCK
      ?auto_50044 - BLOCK
    )
    :vars
    (
      ?auto_50045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50043 ) ( ON ?auto_50044 ?auto_50045 ) ( CLEAR ?auto_50044 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50041 ) ( ON ?auto_50042 ?auto_50041 ) ( ON ?auto_50043 ?auto_50042 ) ( not ( = ?auto_50041 ?auto_50042 ) ) ( not ( = ?auto_50041 ?auto_50043 ) ) ( not ( = ?auto_50041 ?auto_50044 ) ) ( not ( = ?auto_50041 ?auto_50045 ) ) ( not ( = ?auto_50042 ?auto_50043 ) ) ( not ( = ?auto_50042 ?auto_50044 ) ) ( not ( = ?auto_50042 ?auto_50045 ) ) ( not ( = ?auto_50043 ?auto_50044 ) ) ( not ( = ?auto_50043 ?auto_50045 ) ) ( not ( = ?auto_50044 ?auto_50045 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50044 ?auto_50045 )
      ( !STACK ?auto_50044 ?auto_50043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50050 - BLOCK
      ?auto_50051 - BLOCK
      ?auto_50052 - BLOCK
      ?auto_50053 - BLOCK
    )
    :vars
    (
      ?auto_50054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50053 ?auto_50054 ) ( ON-TABLE ?auto_50050 ) ( ON ?auto_50051 ?auto_50050 ) ( not ( = ?auto_50050 ?auto_50051 ) ) ( not ( = ?auto_50050 ?auto_50052 ) ) ( not ( = ?auto_50050 ?auto_50053 ) ) ( not ( = ?auto_50050 ?auto_50054 ) ) ( not ( = ?auto_50051 ?auto_50052 ) ) ( not ( = ?auto_50051 ?auto_50053 ) ) ( not ( = ?auto_50051 ?auto_50054 ) ) ( not ( = ?auto_50052 ?auto_50053 ) ) ( not ( = ?auto_50052 ?auto_50054 ) ) ( not ( = ?auto_50053 ?auto_50054 ) ) ( CLEAR ?auto_50051 ) ( ON ?auto_50052 ?auto_50053 ) ( CLEAR ?auto_50052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50050 ?auto_50051 ?auto_50052 )
      ( MAKE-4PILE ?auto_50050 ?auto_50051 ?auto_50052 ?auto_50053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50059 - BLOCK
      ?auto_50060 - BLOCK
      ?auto_50061 - BLOCK
      ?auto_50062 - BLOCK
    )
    :vars
    (
      ?auto_50063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50062 ?auto_50063 ) ( ON-TABLE ?auto_50059 ) ( ON ?auto_50060 ?auto_50059 ) ( not ( = ?auto_50059 ?auto_50060 ) ) ( not ( = ?auto_50059 ?auto_50061 ) ) ( not ( = ?auto_50059 ?auto_50062 ) ) ( not ( = ?auto_50059 ?auto_50063 ) ) ( not ( = ?auto_50060 ?auto_50061 ) ) ( not ( = ?auto_50060 ?auto_50062 ) ) ( not ( = ?auto_50060 ?auto_50063 ) ) ( not ( = ?auto_50061 ?auto_50062 ) ) ( not ( = ?auto_50061 ?auto_50063 ) ) ( not ( = ?auto_50062 ?auto_50063 ) ) ( CLEAR ?auto_50060 ) ( ON ?auto_50061 ?auto_50062 ) ( CLEAR ?auto_50061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50059 ?auto_50060 ?auto_50061 )
      ( MAKE-4PILE ?auto_50059 ?auto_50060 ?auto_50061 ?auto_50062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50068 - BLOCK
      ?auto_50069 - BLOCK
      ?auto_50070 - BLOCK
      ?auto_50071 - BLOCK
    )
    :vars
    (
      ?auto_50072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50071 ?auto_50072 ) ( ON-TABLE ?auto_50068 ) ( not ( = ?auto_50068 ?auto_50069 ) ) ( not ( = ?auto_50068 ?auto_50070 ) ) ( not ( = ?auto_50068 ?auto_50071 ) ) ( not ( = ?auto_50068 ?auto_50072 ) ) ( not ( = ?auto_50069 ?auto_50070 ) ) ( not ( = ?auto_50069 ?auto_50071 ) ) ( not ( = ?auto_50069 ?auto_50072 ) ) ( not ( = ?auto_50070 ?auto_50071 ) ) ( not ( = ?auto_50070 ?auto_50072 ) ) ( not ( = ?auto_50071 ?auto_50072 ) ) ( ON ?auto_50070 ?auto_50071 ) ( CLEAR ?auto_50068 ) ( ON ?auto_50069 ?auto_50070 ) ( CLEAR ?auto_50069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50068 ?auto_50069 )
      ( MAKE-4PILE ?auto_50068 ?auto_50069 ?auto_50070 ?auto_50071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50077 - BLOCK
      ?auto_50078 - BLOCK
      ?auto_50079 - BLOCK
      ?auto_50080 - BLOCK
    )
    :vars
    (
      ?auto_50081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50080 ?auto_50081 ) ( ON-TABLE ?auto_50077 ) ( not ( = ?auto_50077 ?auto_50078 ) ) ( not ( = ?auto_50077 ?auto_50079 ) ) ( not ( = ?auto_50077 ?auto_50080 ) ) ( not ( = ?auto_50077 ?auto_50081 ) ) ( not ( = ?auto_50078 ?auto_50079 ) ) ( not ( = ?auto_50078 ?auto_50080 ) ) ( not ( = ?auto_50078 ?auto_50081 ) ) ( not ( = ?auto_50079 ?auto_50080 ) ) ( not ( = ?auto_50079 ?auto_50081 ) ) ( not ( = ?auto_50080 ?auto_50081 ) ) ( ON ?auto_50079 ?auto_50080 ) ( CLEAR ?auto_50077 ) ( ON ?auto_50078 ?auto_50079 ) ( CLEAR ?auto_50078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50077 ?auto_50078 )
      ( MAKE-4PILE ?auto_50077 ?auto_50078 ?auto_50079 ?auto_50080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50086 - BLOCK
      ?auto_50087 - BLOCK
      ?auto_50088 - BLOCK
      ?auto_50089 - BLOCK
    )
    :vars
    (
      ?auto_50090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50089 ?auto_50090 ) ( not ( = ?auto_50086 ?auto_50087 ) ) ( not ( = ?auto_50086 ?auto_50088 ) ) ( not ( = ?auto_50086 ?auto_50089 ) ) ( not ( = ?auto_50086 ?auto_50090 ) ) ( not ( = ?auto_50087 ?auto_50088 ) ) ( not ( = ?auto_50087 ?auto_50089 ) ) ( not ( = ?auto_50087 ?auto_50090 ) ) ( not ( = ?auto_50088 ?auto_50089 ) ) ( not ( = ?auto_50088 ?auto_50090 ) ) ( not ( = ?auto_50089 ?auto_50090 ) ) ( ON ?auto_50088 ?auto_50089 ) ( ON ?auto_50087 ?auto_50088 ) ( ON ?auto_50086 ?auto_50087 ) ( CLEAR ?auto_50086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50086 )
      ( MAKE-4PILE ?auto_50086 ?auto_50087 ?auto_50088 ?auto_50089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50095 - BLOCK
      ?auto_50096 - BLOCK
      ?auto_50097 - BLOCK
      ?auto_50098 - BLOCK
    )
    :vars
    (
      ?auto_50099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50098 ?auto_50099 ) ( not ( = ?auto_50095 ?auto_50096 ) ) ( not ( = ?auto_50095 ?auto_50097 ) ) ( not ( = ?auto_50095 ?auto_50098 ) ) ( not ( = ?auto_50095 ?auto_50099 ) ) ( not ( = ?auto_50096 ?auto_50097 ) ) ( not ( = ?auto_50096 ?auto_50098 ) ) ( not ( = ?auto_50096 ?auto_50099 ) ) ( not ( = ?auto_50097 ?auto_50098 ) ) ( not ( = ?auto_50097 ?auto_50099 ) ) ( not ( = ?auto_50098 ?auto_50099 ) ) ( ON ?auto_50097 ?auto_50098 ) ( ON ?auto_50096 ?auto_50097 ) ( ON ?auto_50095 ?auto_50096 ) ( CLEAR ?auto_50095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50095 )
      ( MAKE-4PILE ?auto_50095 ?auto_50096 ?auto_50097 ?auto_50098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50105 - BLOCK
      ?auto_50106 - BLOCK
      ?auto_50107 - BLOCK
      ?auto_50108 - BLOCK
      ?auto_50109 - BLOCK
    )
    :vars
    (
      ?auto_50110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50108 ) ( ON ?auto_50109 ?auto_50110 ) ( CLEAR ?auto_50109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50105 ) ( ON ?auto_50106 ?auto_50105 ) ( ON ?auto_50107 ?auto_50106 ) ( ON ?auto_50108 ?auto_50107 ) ( not ( = ?auto_50105 ?auto_50106 ) ) ( not ( = ?auto_50105 ?auto_50107 ) ) ( not ( = ?auto_50105 ?auto_50108 ) ) ( not ( = ?auto_50105 ?auto_50109 ) ) ( not ( = ?auto_50105 ?auto_50110 ) ) ( not ( = ?auto_50106 ?auto_50107 ) ) ( not ( = ?auto_50106 ?auto_50108 ) ) ( not ( = ?auto_50106 ?auto_50109 ) ) ( not ( = ?auto_50106 ?auto_50110 ) ) ( not ( = ?auto_50107 ?auto_50108 ) ) ( not ( = ?auto_50107 ?auto_50109 ) ) ( not ( = ?auto_50107 ?auto_50110 ) ) ( not ( = ?auto_50108 ?auto_50109 ) ) ( not ( = ?auto_50108 ?auto_50110 ) ) ( not ( = ?auto_50109 ?auto_50110 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50109 ?auto_50110 )
      ( !STACK ?auto_50109 ?auto_50108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50116 - BLOCK
      ?auto_50117 - BLOCK
      ?auto_50118 - BLOCK
      ?auto_50119 - BLOCK
      ?auto_50120 - BLOCK
    )
    :vars
    (
      ?auto_50121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50119 ) ( ON ?auto_50120 ?auto_50121 ) ( CLEAR ?auto_50120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50116 ) ( ON ?auto_50117 ?auto_50116 ) ( ON ?auto_50118 ?auto_50117 ) ( ON ?auto_50119 ?auto_50118 ) ( not ( = ?auto_50116 ?auto_50117 ) ) ( not ( = ?auto_50116 ?auto_50118 ) ) ( not ( = ?auto_50116 ?auto_50119 ) ) ( not ( = ?auto_50116 ?auto_50120 ) ) ( not ( = ?auto_50116 ?auto_50121 ) ) ( not ( = ?auto_50117 ?auto_50118 ) ) ( not ( = ?auto_50117 ?auto_50119 ) ) ( not ( = ?auto_50117 ?auto_50120 ) ) ( not ( = ?auto_50117 ?auto_50121 ) ) ( not ( = ?auto_50118 ?auto_50119 ) ) ( not ( = ?auto_50118 ?auto_50120 ) ) ( not ( = ?auto_50118 ?auto_50121 ) ) ( not ( = ?auto_50119 ?auto_50120 ) ) ( not ( = ?auto_50119 ?auto_50121 ) ) ( not ( = ?auto_50120 ?auto_50121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50120 ?auto_50121 )
      ( !STACK ?auto_50120 ?auto_50119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50127 - BLOCK
      ?auto_50128 - BLOCK
      ?auto_50129 - BLOCK
      ?auto_50130 - BLOCK
      ?auto_50131 - BLOCK
    )
    :vars
    (
      ?auto_50132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50131 ?auto_50132 ) ( ON-TABLE ?auto_50127 ) ( ON ?auto_50128 ?auto_50127 ) ( ON ?auto_50129 ?auto_50128 ) ( not ( = ?auto_50127 ?auto_50128 ) ) ( not ( = ?auto_50127 ?auto_50129 ) ) ( not ( = ?auto_50127 ?auto_50130 ) ) ( not ( = ?auto_50127 ?auto_50131 ) ) ( not ( = ?auto_50127 ?auto_50132 ) ) ( not ( = ?auto_50128 ?auto_50129 ) ) ( not ( = ?auto_50128 ?auto_50130 ) ) ( not ( = ?auto_50128 ?auto_50131 ) ) ( not ( = ?auto_50128 ?auto_50132 ) ) ( not ( = ?auto_50129 ?auto_50130 ) ) ( not ( = ?auto_50129 ?auto_50131 ) ) ( not ( = ?auto_50129 ?auto_50132 ) ) ( not ( = ?auto_50130 ?auto_50131 ) ) ( not ( = ?auto_50130 ?auto_50132 ) ) ( not ( = ?auto_50131 ?auto_50132 ) ) ( CLEAR ?auto_50129 ) ( ON ?auto_50130 ?auto_50131 ) ( CLEAR ?auto_50130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50127 ?auto_50128 ?auto_50129 ?auto_50130 )
      ( MAKE-5PILE ?auto_50127 ?auto_50128 ?auto_50129 ?auto_50130 ?auto_50131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50138 - BLOCK
      ?auto_50139 - BLOCK
      ?auto_50140 - BLOCK
      ?auto_50141 - BLOCK
      ?auto_50142 - BLOCK
    )
    :vars
    (
      ?auto_50143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50142 ?auto_50143 ) ( ON-TABLE ?auto_50138 ) ( ON ?auto_50139 ?auto_50138 ) ( ON ?auto_50140 ?auto_50139 ) ( not ( = ?auto_50138 ?auto_50139 ) ) ( not ( = ?auto_50138 ?auto_50140 ) ) ( not ( = ?auto_50138 ?auto_50141 ) ) ( not ( = ?auto_50138 ?auto_50142 ) ) ( not ( = ?auto_50138 ?auto_50143 ) ) ( not ( = ?auto_50139 ?auto_50140 ) ) ( not ( = ?auto_50139 ?auto_50141 ) ) ( not ( = ?auto_50139 ?auto_50142 ) ) ( not ( = ?auto_50139 ?auto_50143 ) ) ( not ( = ?auto_50140 ?auto_50141 ) ) ( not ( = ?auto_50140 ?auto_50142 ) ) ( not ( = ?auto_50140 ?auto_50143 ) ) ( not ( = ?auto_50141 ?auto_50142 ) ) ( not ( = ?auto_50141 ?auto_50143 ) ) ( not ( = ?auto_50142 ?auto_50143 ) ) ( CLEAR ?auto_50140 ) ( ON ?auto_50141 ?auto_50142 ) ( CLEAR ?auto_50141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50138 ?auto_50139 ?auto_50140 ?auto_50141 )
      ( MAKE-5PILE ?auto_50138 ?auto_50139 ?auto_50140 ?auto_50141 ?auto_50142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50149 - BLOCK
      ?auto_50150 - BLOCK
      ?auto_50151 - BLOCK
      ?auto_50152 - BLOCK
      ?auto_50153 - BLOCK
    )
    :vars
    (
      ?auto_50154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50153 ?auto_50154 ) ( ON-TABLE ?auto_50149 ) ( ON ?auto_50150 ?auto_50149 ) ( not ( = ?auto_50149 ?auto_50150 ) ) ( not ( = ?auto_50149 ?auto_50151 ) ) ( not ( = ?auto_50149 ?auto_50152 ) ) ( not ( = ?auto_50149 ?auto_50153 ) ) ( not ( = ?auto_50149 ?auto_50154 ) ) ( not ( = ?auto_50150 ?auto_50151 ) ) ( not ( = ?auto_50150 ?auto_50152 ) ) ( not ( = ?auto_50150 ?auto_50153 ) ) ( not ( = ?auto_50150 ?auto_50154 ) ) ( not ( = ?auto_50151 ?auto_50152 ) ) ( not ( = ?auto_50151 ?auto_50153 ) ) ( not ( = ?auto_50151 ?auto_50154 ) ) ( not ( = ?auto_50152 ?auto_50153 ) ) ( not ( = ?auto_50152 ?auto_50154 ) ) ( not ( = ?auto_50153 ?auto_50154 ) ) ( ON ?auto_50152 ?auto_50153 ) ( CLEAR ?auto_50150 ) ( ON ?auto_50151 ?auto_50152 ) ( CLEAR ?auto_50151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50149 ?auto_50150 ?auto_50151 )
      ( MAKE-5PILE ?auto_50149 ?auto_50150 ?auto_50151 ?auto_50152 ?auto_50153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50160 - BLOCK
      ?auto_50161 - BLOCK
      ?auto_50162 - BLOCK
      ?auto_50163 - BLOCK
      ?auto_50164 - BLOCK
    )
    :vars
    (
      ?auto_50165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50164 ?auto_50165 ) ( ON-TABLE ?auto_50160 ) ( ON ?auto_50161 ?auto_50160 ) ( not ( = ?auto_50160 ?auto_50161 ) ) ( not ( = ?auto_50160 ?auto_50162 ) ) ( not ( = ?auto_50160 ?auto_50163 ) ) ( not ( = ?auto_50160 ?auto_50164 ) ) ( not ( = ?auto_50160 ?auto_50165 ) ) ( not ( = ?auto_50161 ?auto_50162 ) ) ( not ( = ?auto_50161 ?auto_50163 ) ) ( not ( = ?auto_50161 ?auto_50164 ) ) ( not ( = ?auto_50161 ?auto_50165 ) ) ( not ( = ?auto_50162 ?auto_50163 ) ) ( not ( = ?auto_50162 ?auto_50164 ) ) ( not ( = ?auto_50162 ?auto_50165 ) ) ( not ( = ?auto_50163 ?auto_50164 ) ) ( not ( = ?auto_50163 ?auto_50165 ) ) ( not ( = ?auto_50164 ?auto_50165 ) ) ( ON ?auto_50163 ?auto_50164 ) ( CLEAR ?auto_50161 ) ( ON ?auto_50162 ?auto_50163 ) ( CLEAR ?auto_50162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50160 ?auto_50161 ?auto_50162 )
      ( MAKE-5PILE ?auto_50160 ?auto_50161 ?auto_50162 ?auto_50163 ?auto_50164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50171 - BLOCK
      ?auto_50172 - BLOCK
      ?auto_50173 - BLOCK
      ?auto_50174 - BLOCK
      ?auto_50175 - BLOCK
    )
    :vars
    (
      ?auto_50176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50175 ?auto_50176 ) ( ON-TABLE ?auto_50171 ) ( not ( = ?auto_50171 ?auto_50172 ) ) ( not ( = ?auto_50171 ?auto_50173 ) ) ( not ( = ?auto_50171 ?auto_50174 ) ) ( not ( = ?auto_50171 ?auto_50175 ) ) ( not ( = ?auto_50171 ?auto_50176 ) ) ( not ( = ?auto_50172 ?auto_50173 ) ) ( not ( = ?auto_50172 ?auto_50174 ) ) ( not ( = ?auto_50172 ?auto_50175 ) ) ( not ( = ?auto_50172 ?auto_50176 ) ) ( not ( = ?auto_50173 ?auto_50174 ) ) ( not ( = ?auto_50173 ?auto_50175 ) ) ( not ( = ?auto_50173 ?auto_50176 ) ) ( not ( = ?auto_50174 ?auto_50175 ) ) ( not ( = ?auto_50174 ?auto_50176 ) ) ( not ( = ?auto_50175 ?auto_50176 ) ) ( ON ?auto_50174 ?auto_50175 ) ( ON ?auto_50173 ?auto_50174 ) ( CLEAR ?auto_50171 ) ( ON ?auto_50172 ?auto_50173 ) ( CLEAR ?auto_50172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50171 ?auto_50172 )
      ( MAKE-5PILE ?auto_50171 ?auto_50172 ?auto_50173 ?auto_50174 ?auto_50175 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50182 - BLOCK
      ?auto_50183 - BLOCK
      ?auto_50184 - BLOCK
      ?auto_50185 - BLOCK
      ?auto_50186 - BLOCK
    )
    :vars
    (
      ?auto_50187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50186 ?auto_50187 ) ( ON-TABLE ?auto_50182 ) ( not ( = ?auto_50182 ?auto_50183 ) ) ( not ( = ?auto_50182 ?auto_50184 ) ) ( not ( = ?auto_50182 ?auto_50185 ) ) ( not ( = ?auto_50182 ?auto_50186 ) ) ( not ( = ?auto_50182 ?auto_50187 ) ) ( not ( = ?auto_50183 ?auto_50184 ) ) ( not ( = ?auto_50183 ?auto_50185 ) ) ( not ( = ?auto_50183 ?auto_50186 ) ) ( not ( = ?auto_50183 ?auto_50187 ) ) ( not ( = ?auto_50184 ?auto_50185 ) ) ( not ( = ?auto_50184 ?auto_50186 ) ) ( not ( = ?auto_50184 ?auto_50187 ) ) ( not ( = ?auto_50185 ?auto_50186 ) ) ( not ( = ?auto_50185 ?auto_50187 ) ) ( not ( = ?auto_50186 ?auto_50187 ) ) ( ON ?auto_50185 ?auto_50186 ) ( ON ?auto_50184 ?auto_50185 ) ( CLEAR ?auto_50182 ) ( ON ?auto_50183 ?auto_50184 ) ( CLEAR ?auto_50183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50182 ?auto_50183 )
      ( MAKE-5PILE ?auto_50182 ?auto_50183 ?auto_50184 ?auto_50185 ?auto_50186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50193 - BLOCK
      ?auto_50194 - BLOCK
      ?auto_50195 - BLOCK
      ?auto_50196 - BLOCK
      ?auto_50197 - BLOCK
    )
    :vars
    (
      ?auto_50198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50197 ?auto_50198 ) ( not ( = ?auto_50193 ?auto_50194 ) ) ( not ( = ?auto_50193 ?auto_50195 ) ) ( not ( = ?auto_50193 ?auto_50196 ) ) ( not ( = ?auto_50193 ?auto_50197 ) ) ( not ( = ?auto_50193 ?auto_50198 ) ) ( not ( = ?auto_50194 ?auto_50195 ) ) ( not ( = ?auto_50194 ?auto_50196 ) ) ( not ( = ?auto_50194 ?auto_50197 ) ) ( not ( = ?auto_50194 ?auto_50198 ) ) ( not ( = ?auto_50195 ?auto_50196 ) ) ( not ( = ?auto_50195 ?auto_50197 ) ) ( not ( = ?auto_50195 ?auto_50198 ) ) ( not ( = ?auto_50196 ?auto_50197 ) ) ( not ( = ?auto_50196 ?auto_50198 ) ) ( not ( = ?auto_50197 ?auto_50198 ) ) ( ON ?auto_50196 ?auto_50197 ) ( ON ?auto_50195 ?auto_50196 ) ( ON ?auto_50194 ?auto_50195 ) ( ON ?auto_50193 ?auto_50194 ) ( CLEAR ?auto_50193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50193 )
      ( MAKE-5PILE ?auto_50193 ?auto_50194 ?auto_50195 ?auto_50196 ?auto_50197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50204 - BLOCK
      ?auto_50205 - BLOCK
      ?auto_50206 - BLOCK
      ?auto_50207 - BLOCK
      ?auto_50208 - BLOCK
    )
    :vars
    (
      ?auto_50209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50208 ?auto_50209 ) ( not ( = ?auto_50204 ?auto_50205 ) ) ( not ( = ?auto_50204 ?auto_50206 ) ) ( not ( = ?auto_50204 ?auto_50207 ) ) ( not ( = ?auto_50204 ?auto_50208 ) ) ( not ( = ?auto_50204 ?auto_50209 ) ) ( not ( = ?auto_50205 ?auto_50206 ) ) ( not ( = ?auto_50205 ?auto_50207 ) ) ( not ( = ?auto_50205 ?auto_50208 ) ) ( not ( = ?auto_50205 ?auto_50209 ) ) ( not ( = ?auto_50206 ?auto_50207 ) ) ( not ( = ?auto_50206 ?auto_50208 ) ) ( not ( = ?auto_50206 ?auto_50209 ) ) ( not ( = ?auto_50207 ?auto_50208 ) ) ( not ( = ?auto_50207 ?auto_50209 ) ) ( not ( = ?auto_50208 ?auto_50209 ) ) ( ON ?auto_50207 ?auto_50208 ) ( ON ?auto_50206 ?auto_50207 ) ( ON ?auto_50205 ?auto_50206 ) ( ON ?auto_50204 ?auto_50205 ) ( CLEAR ?auto_50204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50204 )
      ( MAKE-5PILE ?auto_50204 ?auto_50205 ?auto_50206 ?auto_50207 ?auto_50208 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50216 - BLOCK
      ?auto_50217 - BLOCK
      ?auto_50218 - BLOCK
      ?auto_50219 - BLOCK
      ?auto_50220 - BLOCK
      ?auto_50221 - BLOCK
    )
    :vars
    (
      ?auto_50222 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50220 ) ( ON ?auto_50221 ?auto_50222 ) ( CLEAR ?auto_50221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50216 ) ( ON ?auto_50217 ?auto_50216 ) ( ON ?auto_50218 ?auto_50217 ) ( ON ?auto_50219 ?auto_50218 ) ( ON ?auto_50220 ?auto_50219 ) ( not ( = ?auto_50216 ?auto_50217 ) ) ( not ( = ?auto_50216 ?auto_50218 ) ) ( not ( = ?auto_50216 ?auto_50219 ) ) ( not ( = ?auto_50216 ?auto_50220 ) ) ( not ( = ?auto_50216 ?auto_50221 ) ) ( not ( = ?auto_50216 ?auto_50222 ) ) ( not ( = ?auto_50217 ?auto_50218 ) ) ( not ( = ?auto_50217 ?auto_50219 ) ) ( not ( = ?auto_50217 ?auto_50220 ) ) ( not ( = ?auto_50217 ?auto_50221 ) ) ( not ( = ?auto_50217 ?auto_50222 ) ) ( not ( = ?auto_50218 ?auto_50219 ) ) ( not ( = ?auto_50218 ?auto_50220 ) ) ( not ( = ?auto_50218 ?auto_50221 ) ) ( not ( = ?auto_50218 ?auto_50222 ) ) ( not ( = ?auto_50219 ?auto_50220 ) ) ( not ( = ?auto_50219 ?auto_50221 ) ) ( not ( = ?auto_50219 ?auto_50222 ) ) ( not ( = ?auto_50220 ?auto_50221 ) ) ( not ( = ?auto_50220 ?auto_50222 ) ) ( not ( = ?auto_50221 ?auto_50222 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50221 ?auto_50222 )
      ( !STACK ?auto_50221 ?auto_50220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50229 - BLOCK
      ?auto_50230 - BLOCK
      ?auto_50231 - BLOCK
      ?auto_50232 - BLOCK
      ?auto_50233 - BLOCK
      ?auto_50234 - BLOCK
    )
    :vars
    (
      ?auto_50235 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50233 ) ( ON ?auto_50234 ?auto_50235 ) ( CLEAR ?auto_50234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50229 ) ( ON ?auto_50230 ?auto_50229 ) ( ON ?auto_50231 ?auto_50230 ) ( ON ?auto_50232 ?auto_50231 ) ( ON ?auto_50233 ?auto_50232 ) ( not ( = ?auto_50229 ?auto_50230 ) ) ( not ( = ?auto_50229 ?auto_50231 ) ) ( not ( = ?auto_50229 ?auto_50232 ) ) ( not ( = ?auto_50229 ?auto_50233 ) ) ( not ( = ?auto_50229 ?auto_50234 ) ) ( not ( = ?auto_50229 ?auto_50235 ) ) ( not ( = ?auto_50230 ?auto_50231 ) ) ( not ( = ?auto_50230 ?auto_50232 ) ) ( not ( = ?auto_50230 ?auto_50233 ) ) ( not ( = ?auto_50230 ?auto_50234 ) ) ( not ( = ?auto_50230 ?auto_50235 ) ) ( not ( = ?auto_50231 ?auto_50232 ) ) ( not ( = ?auto_50231 ?auto_50233 ) ) ( not ( = ?auto_50231 ?auto_50234 ) ) ( not ( = ?auto_50231 ?auto_50235 ) ) ( not ( = ?auto_50232 ?auto_50233 ) ) ( not ( = ?auto_50232 ?auto_50234 ) ) ( not ( = ?auto_50232 ?auto_50235 ) ) ( not ( = ?auto_50233 ?auto_50234 ) ) ( not ( = ?auto_50233 ?auto_50235 ) ) ( not ( = ?auto_50234 ?auto_50235 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50234 ?auto_50235 )
      ( !STACK ?auto_50234 ?auto_50233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50242 - BLOCK
      ?auto_50243 - BLOCK
      ?auto_50244 - BLOCK
      ?auto_50245 - BLOCK
      ?auto_50246 - BLOCK
      ?auto_50247 - BLOCK
    )
    :vars
    (
      ?auto_50248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50247 ?auto_50248 ) ( ON-TABLE ?auto_50242 ) ( ON ?auto_50243 ?auto_50242 ) ( ON ?auto_50244 ?auto_50243 ) ( ON ?auto_50245 ?auto_50244 ) ( not ( = ?auto_50242 ?auto_50243 ) ) ( not ( = ?auto_50242 ?auto_50244 ) ) ( not ( = ?auto_50242 ?auto_50245 ) ) ( not ( = ?auto_50242 ?auto_50246 ) ) ( not ( = ?auto_50242 ?auto_50247 ) ) ( not ( = ?auto_50242 ?auto_50248 ) ) ( not ( = ?auto_50243 ?auto_50244 ) ) ( not ( = ?auto_50243 ?auto_50245 ) ) ( not ( = ?auto_50243 ?auto_50246 ) ) ( not ( = ?auto_50243 ?auto_50247 ) ) ( not ( = ?auto_50243 ?auto_50248 ) ) ( not ( = ?auto_50244 ?auto_50245 ) ) ( not ( = ?auto_50244 ?auto_50246 ) ) ( not ( = ?auto_50244 ?auto_50247 ) ) ( not ( = ?auto_50244 ?auto_50248 ) ) ( not ( = ?auto_50245 ?auto_50246 ) ) ( not ( = ?auto_50245 ?auto_50247 ) ) ( not ( = ?auto_50245 ?auto_50248 ) ) ( not ( = ?auto_50246 ?auto_50247 ) ) ( not ( = ?auto_50246 ?auto_50248 ) ) ( not ( = ?auto_50247 ?auto_50248 ) ) ( CLEAR ?auto_50245 ) ( ON ?auto_50246 ?auto_50247 ) ( CLEAR ?auto_50246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50242 ?auto_50243 ?auto_50244 ?auto_50245 ?auto_50246 )
      ( MAKE-6PILE ?auto_50242 ?auto_50243 ?auto_50244 ?auto_50245 ?auto_50246 ?auto_50247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50255 - BLOCK
      ?auto_50256 - BLOCK
      ?auto_50257 - BLOCK
      ?auto_50258 - BLOCK
      ?auto_50259 - BLOCK
      ?auto_50260 - BLOCK
    )
    :vars
    (
      ?auto_50261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50260 ?auto_50261 ) ( ON-TABLE ?auto_50255 ) ( ON ?auto_50256 ?auto_50255 ) ( ON ?auto_50257 ?auto_50256 ) ( ON ?auto_50258 ?auto_50257 ) ( not ( = ?auto_50255 ?auto_50256 ) ) ( not ( = ?auto_50255 ?auto_50257 ) ) ( not ( = ?auto_50255 ?auto_50258 ) ) ( not ( = ?auto_50255 ?auto_50259 ) ) ( not ( = ?auto_50255 ?auto_50260 ) ) ( not ( = ?auto_50255 ?auto_50261 ) ) ( not ( = ?auto_50256 ?auto_50257 ) ) ( not ( = ?auto_50256 ?auto_50258 ) ) ( not ( = ?auto_50256 ?auto_50259 ) ) ( not ( = ?auto_50256 ?auto_50260 ) ) ( not ( = ?auto_50256 ?auto_50261 ) ) ( not ( = ?auto_50257 ?auto_50258 ) ) ( not ( = ?auto_50257 ?auto_50259 ) ) ( not ( = ?auto_50257 ?auto_50260 ) ) ( not ( = ?auto_50257 ?auto_50261 ) ) ( not ( = ?auto_50258 ?auto_50259 ) ) ( not ( = ?auto_50258 ?auto_50260 ) ) ( not ( = ?auto_50258 ?auto_50261 ) ) ( not ( = ?auto_50259 ?auto_50260 ) ) ( not ( = ?auto_50259 ?auto_50261 ) ) ( not ( = ?auto_50260 ?auto_50261 ) ) ( CLEAR ?auto_50258 ) ( ON ?auto_50259 ?auto_50260 ) ( CLEAR ?auto_50259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50255 ?auto_50256 ?auto_50257 ?auto_50258 ?auto_50259 )
      ( MAKE-6PILE ?auto_50255 ?auto_50256 ?auto_50257 ?auto_50258 ?auto_50259 ?auto_50260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50268 - BLOCK
      ?auto_50269 - BLOCK
      ?auto_50270 - BLOCK
      ?auto_50271 - BLOCK
      ?auto_50272 - BLOCK
      ?auto_50273 - BLOCK
    )
    :vars
    (
      ?auto_50274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50273 ?auto_50274 ) ( ON-TABLE ?auto_50268 ) ( ON ?auto_50269 ?auto_50268 ) ( ON ?auto_50270 ?auto_50269 ) ( not ( = ?auto_50268 ?auto_50269 ) ) ( not ( = ?auto_50268 ?auto_50270 ) ) ( not ( = ?auto_50268 ?auto_50271 ) ) ( not ( = ?auto_50268 ?auto_50272 ) ) ( not ( = ?auto_50268 ?auto_50273 ) ) ( not ( = ?auto_50268 ?auto_50274 ) ) ( not ( = ?auto_50269 ?auto_50270 ) ) ( not ( = ?auto_50269 ?auto_50271 ) ) ( not ( = ?auto_50269 ?auto_50272 ) ) ( not ( = ?auto_50269 ?auto_50273 ) ) ( not ( = ?auto_50269 ?auto_50274 ) ) ( not ( = ?auto_50270 ?auto_50271 ) ) ( not ( = ?auto_50270 ?auto_50272 ) ) ( not ( = ?auto_50270 ?auto_50273 ) ) ( not ( = ?auto_50270 ?auto_50274 ) ) ( not ( = ?auto_50271 ?auto_50272 ) ) ( not ( = ?auto_50271 ?auto_50273 ) ) ( not ( = ?auto_50271 ?auto_50274 ) ) ( not ( = ?auto_50272 ?auto_50273 ) ) ( not ( = ?auto_50272 ?auto_50274 ) ) ( not ( = ?auto_50273 ?auto_50274 ) ) ( ON ?auto_50272 ?auto_50273 ) ( CLEAR ?auto_50270 ) ( ON ?auto_50271 ?auto_50272 ) ( CLEAR ?auto_50271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50271 )
      ( MAKE-6PILE ?auto_50268 ?auto_50269 ?auto_50270 ?auto_50271 ?auto_50272 ?auto_50273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50281 - BLOCK
      ?auto_50282 - BLOCK
      ?auto_50283 - BLOCK
      ?auto_50284 - BLOCK
      ?auto_50285 - BLOCK
      ?auto_50286 - BLOCK
    )
    :vars
    (
      ?auto_50287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50286 ?auto_50287 ) ( ON-TABLE ?auto_50281 ) ( ON ?auto_50282 ?auto_50281 ) ( ON ?auto_50283 ?auto_50282 ) ( not ( = ?auto_50281 ?auto_50282 ) ) ( not ( = ?auto_50281 ?auto_50283 ) ) ( not ( = ?auto_50281 ?auto_50284 ) ) ( not ( = ?auto_50281 ?auto_50285 ) ) ( not ( = ?auto_50281 ?auto_50286 ) ) ( not ( = ?auto_50281 ?auto_50287 ) ) ( not ( = ?auto_50282 ?auto_50283 ) ) ( not ( = ?auto_50282 ?auto_50284 ) ) ( not ( = ?auto_50282 ?auto_50285 ) ) ( not ( = ?auto_50282 ?auto_50286 ) ) ( not ( = ?auto_50282 ?auto_50287 ) ) ( not ( = ?auto_50283 ?auto_50284 ) ) ( not ( = ?auto_50283 ?auto_50285 ) ) ( not ( = ?auto_50283 ?auto_50286 ) ) ( not ( = ?auto_50283 ?auto_50287 ) ) ( not ( = ?auto_50284 ?auto_50285 ) ) ( not ( = ?auto_50284 ?auto_50286 ) ) ( not ( = ?auto_50284 ?auto_50287 ) ) ( not ( = ?auto_50285 ?auto_50286 ) ) ( not ( = ?auto_50285 ?auto_50287 ) ) ( not ( = ?auto_50286 ?auto_50287 ) ) ( ON ?auto_50285 ?auto_50286 ) ( CLEAR ?auto_50283 ) ( ON ?auto_50284 ?auto_50285 ) ( CLEAR ?auto_50284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50281 ?auto_50282 ?auto_50283 ?auto_50284 )
      ( MAKE-6PILE ?auto_50281 ?auto_50282 ?auto_50283 ?auto_50284 ?auto_50285 ?auto_50286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50294 - BLOCK
      ?auto_50295 - BLOCK
      ?auto_50296 - BLOCK
      ?auto_50297 - BLOCK
      ?auto_50298 - BLOCK
      ?auto_50299 - BLOCK
    )
    :vars
    (
      ?auto_50300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50299 ?auto_50300 ) ( ON-TABLE ?auto_50294 ) ( ON ?auto_50295 ?auto_50294 ) ( not ( = ?auto_50294 ?auto_50295 ) ) ( not ( = ?auto_50294 ?auto_50296 ) ) ( not ( = ?auto_50294 ?auto_50297 ) ) ( not ( = ?auto_50294 ?auto_50298 ) ) ( not ( = ?auto_50294 ?auto_50299 ) ) ( not ( = ?auto_50294 ?auto_50300 ) ) ( not ( = ?auto_50295 ?auto_50296 ) ) ( not ( = ?auto_50295 ?auto_50297 ) ) ( not ( = ?auto_50295 ?auto_50298 ) ) ( not ( = ?auto_50295 ?auto_50299 ) ) ( not ( = ?auto_50295 ?auto_50300 ) ) ( not ( = ?auto_50296 ?auto_50297 ) ) ( not ( = ?auto_50296 ?auto_50298 ) ) ( not ( = ?auto_50296 ?auto_50299 ) ) ( not ( = ?auto_50296 ?auto_50300 ) ) ( not ( = ?auto_50297 ?auto_50298 ) ) ( not ( = ?auto_50297 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50300 ) ) ( not ( = ?auto_50298 ?auto_50299 ) ) ( not ( = ?auto_50298 ?auto_50300 ) ) ( not ( = ?auto_50299 ?auto_50300 ) ) ( ON ?auto_50298 ?auto_50299 ) ( ON ?auto_50297 ?auto_50298 ) ( CLEAR ?auto_50295 ) ( ON ?auto_50296 ?auto_50297 ) ( CLEAR ?auto_50296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50294 ?auto_50295 ?auto_50296 )
      ( MAKE-6PILE ?auto_50294 ?auto_50295 ?auto_50296 ?auto_50297 ?auto_50298 ?auto_50299 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50307 - BLOCK
      ?auto_50308 - BLOCK
      ?auto_50309 - BLOCK
      ?auto_50310 - BLOCK
      ?auto_50311 - BLOCK
      ?auto_50312 - BLOCK
    )
    :vars
    (
      ?auto_50313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50312 ?auto_50313 ) ( ON-TABLE ?auto_50307 ) ( ON ?auto_50308 ?auto_50307 ) ( not ( = ?auto_50307 ?auto_50308 ) ) ( not ( = ?auto_50307 ?auto_50309 ) ) ( not ( = ?auto_50307 ?auto_50310 ) ) ( not ( = ?auto_50307 ?auto_50311 ) ) ( not ( = ?auto_50307 ?auto_50312 ) ) ( not ( = ?auto_50307 ?auto_50313 ) ) ( not ( = ?auto_50308 ?auto_50309 ) ) ( not ( = ?auto_50308 ?auto_50310 ) ) ( not ( = ?auto_50308 ?auto_50311 ) ) ( not ( = ?auto_50308 ?auto_50312 ) ) ( not ( = ?auto_50308 ?auto_50313 ) ) ( not ( = ?auto_50309 ?auto_50310 ) ) ( not ( = ?auto_50309 ?auto_50311 ) ) ( not ( = ?auto_50309 ?auto_50312 ) ) ( not ( = ?auto_50309 ?auto_50313 ) ) ( not ( = ?auto_50310 ?auto_50311 ) ) ( not ( = ?auto_50310 ?auto_50312 ) ) ( not ( = ?auto_50310 ?auto_50313 ) ) ( not ( = ?auto_50311 ?auto_50312 ) ) ( not ( = ?auto_50311 ?auto_50313 ) ) ( not ( = ?auto_50312 ?auto_50313 ) ) ( ON ?auto_50311 ?auto_50312 ) ( ON ?auto_50310 ?auto_50311 ) ( CLEAR ?auto_50308 ) ( ON ?auto_50309 ?auto_50310 ) ( CLEAR ?auto_50309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50307 ?auto_50308 ?auto_50309 )
      ( MAKE-6PILE ?auto_50307 ?auto_50308 ?auto_50309 ?auto_50310 ?auto_50311 ?auto_50312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50320 - BLOCK
      ?auto_50321 - BLOCK
      ?auto_50322 - BLOCK
      ?auto_50323 - BLOCK
      ?auto_50324 - BLOCK
      ?auto_50325 - BLOCK
    )
    :vars
    (
      ?auto_50326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50325 ?auto_50326 ) ( ON-TABLE ?auto_50320 ) ( not ( = ?auto_50320 ?auto_50321 ) ) ( not ( = ?auto_50320 ?auto_50322 ) ) ( not ( = ?auto_50320 ?auto_50323 ) ) ( not ( = ?auto_50320 ?auto_50324 ) ) ( not ( = ?auto_50320 ?auto_50325 ) ) ( not ( = ?auto_50320 ?auto_50326 ) ) ( not ( = ?auto_50321 ?auto_50322 ) ) ( not ( = ?auto_50321 ?auto_50323 ) ) ( not ( = ?auto_50321 ?auto_50324 ) ) ( not ( = ?auto_50321 ?auto_50325 ) ) ( not ( = ?auto_50321 ?auto_50326 ) ) ( not ( = ?auto_50322 ?auto_50323 ) ) ( not ( = ?auto_50322 ?auto_50324 ) ) ( not ( = ?auto_50322 ?auto_50325 ) ) ( not ( = ?auto_50322 ?auto_50326 ) ) ( not ( = ?auto_50323 ?auto_50324 ) ) ( not ( = ?auto_50323 ?auto_50325 ) ) ( not ( = ?auto_50323 ?auto_50326 ) ) ( not ( = ?auto_50324 ?auto_50325 ) ) ( not ( = ?auto_50324 ?auto_50326 ) ) ( not ( = ?auto_50325 ?auto_50326 ) ) ( ON ?auto_50324 ?auto_50325 ) ( ON ?auto_50323 ?auto_50324 ) ( ON ?auto_50322 ?auto_50323 ) ( CLEAR ?auto_50320 ) ( ON ?auto_50321 ?auto_50322 ) ( CLEAR ?auto_50321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50320 ?auto_50321 )
      ( MAKE-6PILE ?auto_50320 ?auto_50321 ?auto_50322 ?auto_50323 ?auto_50324 ?auto_50325 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50333 - BLOCK
      ?auto_50334 - BLOCK
      ?auto_50335 - BLOCK
      ?auto_50336 - BLOCK
      ?auto_50337 - BLOCK
      ?auto_50338 - BLOCK
    )
    :vars
    (
      ?auto_50339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50338 ?auto_50339 ) ( ON-TABLE ?auto_50333 ) ( not ( = ?auto_50333 ?auto_50334 ) ) ( not ( = ?auto_50333 ?auto_50335 ) ) ( not ( = ?auto_50333 ?auto_50336 ) ) ( not ( = ?auto_50333 ?auto_50337 ) ) ( not ( = ?auto_50333 ?auto_50338 ) ) ( not ( = ?auto_50333 ?auto_50339 ) ) ( not ( = ?auto_50334 ?auto_50335 ) ) ( not ( = ?auto_50334 ?auto_50336 ) ) ( not ( = ?auto_50334 ?auto_50337 ) ) ( not ( = ?auto_50334 ?auto_50338 ) ) ( not ( = ?auto_50334 ?auto_50339 ) ) ( not ( = ?auto_50335 ?auto_50336 ) ) ( not ( = ?auto_50335 ?auto_50337 ) ) ( not ( = ?auto_50335 ?auto_50338 ) ) ( not ( = ?auto_50335 ?auto_50339 ) ) ( not ( = ?auto_50336 ?auto_50337 ) ) ( not ( = ?auto_50336 ?auto_50338 ) ) ( not ( = ?auto_50336 ?auto_50339 ) ) ( not ( = ?auto_50337 ?auto_50338 ) ) ( not ( = ?auto_50337 ?auto_50339 ) ) ( not ( = ?auto_50338 ?auto_50339 ) ) ( ON ?auto_50337 ?auto_50338 ) ( ON ?auto_50336 ?auto_50337 ) ( ON ?auto_50335 ?auto_50336 ) ( CLEAR ?auto_50333 ) ( ON ?auto_50334 ?auto_50335 ) ( CLEAR ?auto_50334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50333 ?auto_50334 )
      ( MAKE-6PILE ?auto_50333 ?auto_50334 ?auto_50335 ?auto_50336 ?auto_50337 ?auto_50338 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50346 - BLOCK
      ?auto_50347 - BLOCK
      ?auto_50348 - BLOCK
      ?auto_50349 - BLOCK
      ?auto_50350 - BLOCK
      ?auto_50351 - BLOCK
    )
    :vars
    (
      ?auto_50352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50351 ?auto_50352 ) ( not ( = ?auto_50346 ?auto_50347 ) ) ( not ( = ?auto_50346 ?auto_50348 ) ) ( not ( = ?auto_50346 ?auto_50349 ) ) ( not ( = ?auto_50346 ?auto_50350 ) ) ( not ( = ?auto_50346 ?auto_50351 ) ) ( not ( = ?auto_50346 ?auto_50352 ) ) ( not ( = ?auto_50347 ?auto_50348 ) ) ( not ( = ?auto_50347 ?auto_50349 ) ) ( not ( = ?auto_50347 ?auto_50350 ) ) ( not ( = ?auto_50347 ?auto_50351 ) ) ( not ( = ?auto_50347 ?auto_50352 ) ) ( not ( = ?auto_50348 ?auto_50349 ) ) ( not ( = ?auto_50348 ?auto_50350 ) ) ( not ( = ?auto_50348 ?auto_50351 ) ) ( not ( = ?auto_50348 ?auto_50352 ) ) ( not ( = ?auto_50349 ?auto_50350 ) ) ( not ( = ?auto_50349 ?auto_50351 ) ) ( not ( = ?auto_50349 ?auto_50352 ) ) ( not ( = ?auto_50350 ?auto_50351 ) ) ( not ( = ?auto_50350 ?auto_50352 ) ) ( not ( = ?auto_50351 ?auto_50352 ) ) ( ON ?auto_50350 ?auto_50351 ) ( ON ?auto_50349 ?auto_50350 ) ( ON ?auto_50348 ?auto_50349 ) ( ON ?auto_50347 ?auto_50348 ) ( ON ?auto_50346 ?auto_50347 ) ( CLEAR ?auto_50346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50346 )
      ( MAKE-6PILE ?auto_50346 ?auto_50347 ?auto_50348 ?auto_50349 ?auto_50350 ?auto_50351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50359 - BLOCK
      ?auto_50360 - BLOCK
      ?auto_50361 - BLOCK
      ?auto_50362 - BLOCK
      ?auto_50363 - BLOCK
      ?auto_50364 - BLOCK
    )
    :vars
    (
      ?auto_50365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50364 ?auto_50365 ) ( not ( = ?auto_50359 ?auto_50360 ) ) ( not ( = ?auto_50359 ?auto_50361 ) ) ( not ( = ?auto_50359 ?auto_50362 ) ) ( not ( = ?auto_50359 ?auto_50363 ) ) ( not ( = ?auto_50359 ?auto_50364 ) ) ( not ( = ?auto_50359 ?auto_50365 ) ) ( not ( = ?auto_50360 ?auto_50361 ) ) ( not ( = ?auto_50360 ?auto_50362 ) ) ( not ( = ?auto_50360 ?auto_50363 ) ) ( not ( = ?auto_50360 ?auto_50364 ) ) ( not ( = ?auto_50360 ?auto_50365 ) ) ( not ( = ?auto_50361 ?auto_50362 ) ) ( not ( = ?auto_50361 ?auto_50363 ) ) ( not ( = ?auto_50361 ?auto_50364 ) ) ( not ( = ?auto_50361 ?auto_50365 ) ) ( not ( = ?auto_50362 ?auto_50363 ) ) ( not ( = ?auto_50362 ?auto_50364 ) ) ( not ( = ?auto_50362 ?auto_50365 ) ) ( not ( = ?auto_50363 ?auto_50364 ) ) ( not ( = ?auto_50363 ?auto_50365 ) ) ( not ( = ?auto_50364 ?auto_50365 ) ) ( ON ?auto_50363 ?auto_50364 ) ( ON ?auto_50362 ?auto_50363 ) ( ON ?auto_50361 ?auto_50362 ) ( ON ?auto_50360 ?auto_50361 ) ( ON ?auto_50359 ?auto_50360 ) ( CLEAR ?auto_50359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50359 )
      ( MAKE-6PILE ?auto_50359 ?auto_50360 ?auto_50361 ?auto_50362 ?auto_50363 ?auto_50364 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50373 - BLOCK
      ?auto_50374 - BLOCK
      ?auto_50375 - BLOCK
      ?auto_50376 - BLOCK
      ?auto_50377 - BLOCK
      ?auto_50378 - BLOCK
      ?auto_50379 - BLOCK
    )
    :vars
    (
      ?auto_50380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50378 ) ( ON ?auto_50379 ?auto_50380 ) ( CLEAR ?auto_50379 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50373 ) ( ON ?auto_50374 ?auto_50373 ) ( ON ?auto_50375 ?auto_50374 ) ( ON ?auto_50376 ?auto_50375 ) ( ON ?auto_50377 ?auto_50376 ) ( ON ?auto_50378 ?auto_50377 ) ( not ( = ?auto_50373 ?auto_50374 ) ) ( not ( = ?auto_50373 ?auto_50375 ) ) ( not ( = ?auto_50373 ?auto_50376 ) ) ( not ( = ?auto_50373 ?auto_50377 ) ) ( not ( = ?auto_50373 ?auto_50378 ) ) ( not ( = ?auto_50373 ?auto_50379 ) ) ( not ( = ?auto_50373 ?auto_50380 ) ) ( not ( = ?auto_50374 ?auto_50375 ) ) ( not ( = ?auto_50374 ?auto_50376 ) ) ( not ( = ?auto_50374 ?auto_50377 ) ) ( not ( = ?auto_50374 ?auto_50378 ) ) ( not ( = ?auto_50374 ?auto_50379 ) ) ( not ( = ?auto_50374 ?auto_50380 ) ) ( not ( = ?auto_50375 ?auto_50376 ) ) ( not ( = ?auto_50375 ?auto_50377 ) ) ( not ( = ?auto_50375 ?auto_50378 ) ) ( not ( = ?auto_50375 ?auto_50379 ) ) ( not ( = ?auto_50375 ?auto_50380 ) ) ( not ( = ?auto_50376 ?auto_50377 ) ) ( not ( = ?auto_50376 ?auto_50378 ) ) ( not ( = ?auto_50376 ?auto_50379 ) ) ( not ( = ?auto_50376 ?auto_50380 ) ) ( not ( = ?auto_50377 ?auto_50378 ) ) ( not ( = ?auto_50377 ?auto_50379 ) ) ( not ( = ?auto_50377 ?auto_50380 ) ) ( not ( = ?auto_50378 ?auto_50379 ) ) ( not ( = ?auto_50378 ?auto_50380 ) ) ( not ( = ?auto_50379 ?auto_50380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50379 ?auto_50380 )
      ( !STACK ?auto_50379 ?auto_50378 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50388 - BLOCK
      ?auto_50389 - BLOCK
      ?auto_50390 - BLOCK
      ?auto_50391 - BLOCK
      ?auto_50392 - BLOCK
      ?auto_50393 - BLOCK
      ?auto_50394 - BLOCK
    )
    :vars
    (
      ?auto_50395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50393 ) ( ON ?auto_50394 ?auto_50395 ) ( CLEAR ?auto_50394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50388 ) ( ON ?auto_50389 ?auto_50388 ) ( ON ?auto_50390 ?auto_50389 ) ( ON ?auto_50391 ?auto_50390 ) ( ON ?auto_50392 ?auto_50391 ) ( ON ?auto_50393 ?auto_50392 ) ( not ( = ?auto_50388 ?auto_50389 ) ) ( not ( = ?auto_50388 ?auto_50390 ) ) ( not ( = ?auto_50388 ?auto_50391 ) ) ( not ( = ?auto_50388 ?auto_50392 ) ) ( not ( = ?auto_50388 ?auto_50393 ) ) ( not ( = ?auto_50388 ?auto_50394 ) ) ( not ( = ?auto_50388 ?auto_50395 ) ) ( not ( = ?auto_50389 ?auto_50390 ) ) ( not ( = ?auto_50389 ?auto_50391 ) ) ( not ( = ?auto_50389 ?auto_50392 ) ) ( not ( = ?auto_50389 ?auto_50393 ) ) ( not ( = ?auto_50389 ?auto_50394 ) ) ( not ( = ?auto_50389 ?auto_50395 ) ) ( not ( = ?auto_50390 ?auto_50391 ) ) ( not ( = ?auto_50390 ?auto_50392 ) ) ( not ( = ?auto_50390 ?auto_50393 ) ) ( not ( = ?auto_50390 ?auto_50394 ) ) ( not ( = ?auto_50390 ?auto_50395 ) ) ( not ( = ?auto_50391 ?auto_50392 ) ) ( not ( = ?auto_50391 ?auto_50393 ) ) ( not ( = ?auto_50391 ?auto_50394 ) ) ( not ( = ?auto_50391 ?auto_50395 ) ) ( not ( = ?auto_50392 ?auto_50393 ) ) ( not ( = ?auto_50392 ?auto_50394 ) ) ( not ( = ?auto_50392 ?auto_50395 ) ) ( not ( = ?auto_50393 ?auto_50394 ) ) ( not ( = ?auto_50393 ?auto_50395 ) ) ( not ( = ?auto_50394 ?auto_50395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50394 ?auto_50395 )
      ( !STACK ?auto_50394 ?auto_50393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50403 - BLOCK
      ?auto_50404 - BLOCK
      ?auto_50405 - BLOCK
      ?auto_50406 - BLOCK
      ?auto_50407 - BLOCK
      ?auto_50408 - BLOCK
      ?auto_50409 - BLOCK
    )
    :vars
    (
      ?auto_50410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50409 ?auto_50410 ) ( ON-TABLE ?auto_50403 ) ( ON ?auto_50404 ?auto_50403 ) ( ON ?auto_50405 ?auto_50404 ) ( ON ?auto_50406 ?auto_50405 ) ( ON ?auto_50407 ?auto_50406 ) ( not ( = ?auto_50403 ?auto_50404 ) ) ( not ( = ?auto_50403 ?auto_50405 ) ) ( not ( = ?auto_50403 ?auto_50406 ) ) ( not ( = ?auto_50403 ?auto_50407 ) ) ( not ( = ?auto_50403 ?auto_50408 ) ) ( not ( = ?auto_50403 ?auto_50409 ) ) ( not ( = ?auto_50403 ?auto_50410 ) ) ( not ( = ?auto_50404 ?auto_50405 ) ) ( not ( = ?auto_50404 ?auto_50406 ) ) ( not ( = ?auto_50404 ?auto_50407 ) ) ( not ( = ?auto_50404 ?auto_50408 ) ) ( not ( = ?auto_50404 ?auto_50409 ) ) ( not ( = ?auto_50404 ?auto_50410 ) ) ( not ( = ?auto_50405 ?auto_50406 ) ) ( not ( = ?auto_50405 ?auto_50407 ) ) ( not ( = ?auto_50405 ?auto_50408 ) ) ( not ( = ?auto_50405 ?auto_50409 ) ) ( not ( = ?auto_50405 ?auto_50410 ) ) ( not ( = ?auto_50406 ?auto_50407 ) ) ( not ( = ?auto_50406 ?auto_50408 ) ) ( not ( = ?auto_50406 ?auto_50409 ) ) ( not ( = ?auto_50406 ?auto_50410 ) ) ( not ( = ?auto_50407 ?auto_50408 ) ) ( not ( = ?auto_50407 ?auto_50409 ) ) ( not ( = ?auto_50407 ?auto_50410 ) ) ( not ( = ?auto_50408 ?auto_50409 ) ) ( not ( = ?auto_50408 ?auto_50410 ) ) ( not ( = ?auto_50409 ?auto_50410 ) ) ( CLEAR ?auto_50407 ) ( ON ?auto_50408 ?auto_50409 ) ( CLEAR ?auto_50408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50403 ?auto_50404 ?auto_50405 ?auto_50406 ?auto_50407 ?auto_50408 )
      ( MAKE-7PILE ?auto_50403 ?auto_50404 ?auto_50405 ?auto_50406 ?auto_50407 ?auto_50408 ?auto_50409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50418 - BLOCK
      ?auto_50419 - BLOCK
      ?auto_50420 - BLOCK
      ?auto_50421 - BLOCK
      ?auto_50422 - BLOCK
      ?auto_50423 - BLOCK
      ?auto_50424 - BLOCK
    )
    :vars
    (
      ?auto_50425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50424 ?auto_50425 ) ( ON-TABLE ?auto_50418 ) ( ON ?auto_50419 ?auto_50418 ) ( ON ?auto_50420 ?auto_50419 ) ( ON ?auto_50421 ?auto_50420 ) ( ON ?auto_50422 ?auto_50421 ) ( not ( = ?auto_50418 ?auto_50419 ) ) ( not ( = ?auto_50418 ?auto_50420 ) ) ( not ( = ?auto_50418 ?auto_50421 ) ) ( not ( = ?auto_50418 ?auto_50422 ) ) ( not ( = ?auto_50418 ?auto_50423 ) ) ( not ( = ?auto_50418 ?auto_50424 ) ) ( not ( = ?auto_50418 ?auto_50425 ) ) ( not ( = ?auto_50419 ?auto_50420 ) ) ( not ( = ?auto_50419 ?auto_50421 ) ) ( not ( = ?auto_50419 ?auto_50422 ) ) ( not ( = ?auto_50419 ?auto_50423 ) ) ( not ( = ?auto_50419 ?auto_50424 ) ) ( not ( = ?auto_50419 ?auto_50425 ) ) ( not ( = ?auto_50420 ?auto_50421 ) ) ( not ( = ?auto_50420 ?auto_50422 ) ) ( not ( = ?auto_50420 ?auto_50423 ) ) ( not ( = ?auto_50420 ?auto_50424 ) ) ( not ( = ?auto_50420 ?auto_50425 ) ) ( not ( = ?auto_50421 ?auto_50422 ) ) ( not ( = ?auto_50421 ?auto_50423 ) ) ( not ( = ?auto_50421 ?auto_50424 ) ) ( not ( = ?auto_50421 ?auto_50425 ) ) ( not ( = ?auto_50422 ?auto_50423 ) ) ( not ( = ?auto_50422 ?auto_50424 ) ) ( not ( = ?auto_50422 ?auto_50425 ) ) ( not ( = ?auto_50423 ?auto_50424 ) ) ( not ( = ?auto_50423 ?auto_50425 ) ) ( not ( = ?auto_50424 ?auto_50425 ) ) ( CLEAR ?auto_50422 ) ( ON ?auto_50423 ?auto_50424 ) ( CLEAR ?auto_50423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50418 ?auto_50419 ?auto_50420 ?auto_50421 ?auto_50422 ?auto_50423 )
      ( MAKE-7PILE ?auto_50418 ?auto_50419 ?auto_50420 ?auto_50421 ?auto_50422 ?auto_50423 ?auto_50424 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50433 - BLOCK
      ?auto_50434 - BLOCK
      ?auto_50435 - BLOCK
      ?auto_50436 - BLOCK
      ?auto_50437 - BLOCK
      ?auto_50438 - BLOCK
      ?auto_50439 - BLOCK
    )
    :vars
    (
      ?auto_50440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50439 ?auto_50440 ) ( ON-TABLE ?auto_50433 ) ( ON ?auto_50434 ?auto_50433 ) ( ON ?auto_50435 ?auto_50434 ) ( ON ?auto_50436 ?auto_50435 ) ( not ( = ?auto_50433 ?auto_50434 ) ) ( not ( = ?auto_50433 ?auto_50435 ) ) ( not ( = ?auto_50433 ?auto_50436 ) ) ( not ( = ?auto_50433 ?auto_50437 ) ) ( not ( = ?auto_50433 ?auto_50438 ) ) ( not ( = ?auto_50433 ?auto_50439 ) ) ( not ( = ?auto_50433 ?auto_50440 ) ) ( not ( = ?auto_50434 ?auto_50435 ) ) ( not ( = ?auto_50434 ?auto_50436 ) ) ( not ( = ?auto_50434 ?auto_50437 ) ) ( not ( = ?auto_50434 ?auto_50438 ) ) ( not ( = ?auto_50434 ?auto_50439 ) ) ( not ( = ?auto_50434 ?auto_50440 ) ) ( not ( = ?auto_50435 ?auto_50436 ) ) ( not ( = ?auto_50435 ?auto_50437 ) ) ( not ( = ?auto_50435 ?auto_50438 ) ) ( not ( = ?auto_50435 ?auto_50439 ) ) ( not ( = ?auto_50435 ?auto_50440 ) ) ( not ( = ?auto_50436 ?auto_50437 ) ) ( not ( = ?auto_50436 ?auto_50438 ) ) ( not ( = ?auto_50436 ?auto_50439 ) ) ( not ( = ?auto_50436 ?auto_50440 ) ) ( not ( = ?auto_50437 ?auto_50438 ) ) ( not ( = ?auto_50437 ?auto_50439 ) ) ( not ( = ?auto_50437 ?auto_50440 ) ) ( not ( = ?auto_50438 ?auto_50439 ) ) ( not ( = ?auto_50438 ?auto_50440 ) ) ( not ( = ?auto_50439 ?auto_50440 ) ) ( ON ?auto_50438 ?auto_50439 ) ( CLEAR ?auto_50436 ) ( ON ?auto_50437 ?auto_50438 ) ( CLEAR ?auto_50437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50433 ?auto_50434 ?auto_50435 ?auto_50436 ?auto_50437 )
      ( MAKE-7PILE ?auto_50433 ?auto_50434 ?auto_50435 ?auto_50436 ?auto_50437 ?auto_50438 ?auto_50439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50448 - BLOCK
      ?auto_50449 - BLOCK
      ?auto_50450 - BLOCK
      ?auto_50451 - BLOCK
      ?auto_50452 - BLOCK
      ?auto_50453 - BLOCK
      ?auto_50454 - BLOCK
    )
    :vars
    (
      ?auto_50455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50454 ?auto_50455 ) ( ON-TABLE ?auto_50448 ) ( ON ?auto_50449 ?auto_50448 ) ( ON ?auto_50450 ?auto_50449 ) ( ON ?auto_50451 ?auto_50450 ) ( not ( = ?auto_50448 ?auto_50449 ) ) ( not ( = ?auto_50448 ?auto_50450 ) ) ( not ( = ?auto_50448 ?auto_50451 ) ) ( not ( = ?auto_50448 ?auto_50452 ) ) ( not ( = ?auto_50448 ?auto_50453 ) ) ( not ( = ?auto_50448 ?auto_50454 ) ) ( not ( = ?auto_50448 ?auto_50455 ) ) ( not ( = ?auto_50449 ?auto_50450 ) ) ( not ( = ?auto_50449 ?auto_50451 ) ) ( not ( = ?auto_50449 ?auto_50452 ) ) ( not ( = ?auto_50449 ?auto_50453 ) ) ( not ( = ?auto_50449 ?auto_50454 ) ) ( not ( = ?auto_50449 ?auto_50455 ) ) ( not ( = ?auto_50450 ?auto_50451 ) ) ( not ( = ?auto_50450 ?auto_50452 ) ) ( not ( = ?auto_50450 ?auto_50453 ) ) ( not ( = ?auto_50450 ?auto_50454 ) ) ( not ( = ?auto_50450 ?auto_50455 ) ) ( not ( = ?auto_50451 ?auto_50452 ) ) ( not ( = ?auto_50451 ?auto_50453 ) ) ( not ( = ?auto_50451 ?auto_50454 ) ) ( not ( = ?auto_50451 ?auto_50455 ) ) ( not ( = ?auto_50452 ?auto_50453 ) ) ( not ( = ?auto_50452 ?auto_50454 ) ) ( not ( = ?auto_50452 ?auto_50455 ) ) ( not ( = ?auto_50453 ?auto_50454 ) ) ( not ( = ?auto_50453 ?auto_50455 ) ) ( not ( = ?auto_50454 ?auto_50455 ) ) ( ON ?auto_50453 ?auto_50454 ) ( CLEAR ?auto_50451 ) ( ON ?auto_50452 ?auto_50453 ) ( CLEAR ?auto_50452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50448 ?auto_50449 ?auto_50450 ?auto_50451 ?auto_50452 )
      ( MAKE-7PILE ?auto_50448 ?auto_50449 ?auto_50450 ?auto_50451 ?auto_50452 ?auto_50453 ?auto_50454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50463 - BLOCK
      ?auto_50464 - BLOCK
      ?auto_50465 - BLOCK
      ?auto_50466 - BLOCK
      ?auto_50467 - BLOCK
      ?auto_50468 - BLOCK
      ?auto_50469 - BLOCK
    )
    :vars
    (
      ?auto_50470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50469 ?auto_50470 ) ( ON-TABLE ?auto_50463 ) ( ON ?auto_50464 ?auto_50463 ) ( ON ?auto_50465 ?auto_50464 ) ( not ( = ?auto_50463 ?auto_50464 ) ) ( not ( = ?auto_50463 ?auto_50465 ) ) ( not ( = ?auto_50463 ?auto_50466 ) ) ( not ( = ?auto_50463 ?auto_50467 ) ) ( not ( = ?auto_50463 ?auto_50468 ) ) ( not ( = ?auto_50463 ?auto_50469 ) ) ( not ( = ?auto_50463 ?auto_50470 ) ) ( not ( = ?auto_50464 ?auto_50465 ) ) ( not ( = ?auto_50464 ?auto_50466 ) ) ( not ( = ?auto_50464 ?auto_50467 ) ) ( not ( = ?auto_50464 ?auto_50468 ) ) ( not ( = ?auto_50464 ?auto_50469 ) ) ( not ( = ?auto_50464 ?auto_50470 ) ) ( not ( = ?auto_50465 ?auto_50466 ) ) ( not ( = ?auto_50465 ?auto_50467 ) ) ( not ( = ?auto_50465 ?auto_50468 ) ) ( not ( = ?auto_50465 ?auto_50469 ) ) ( not ( = ?auto_50465 ?auto_50470 ) ) ( not ( = ?auto_50466 ?auto_50467 ) ) ( not ( = ?auto_50466 ?auto_50468 ) ) ( not ( = ?auto_50466 ?auto_50469 ) ) ( not ( = ?auto_50466 ?auto_50470 ) ) ( not ( = ?auto_50467 ?auto_50468 ) ) ( not ( = ?auto_50467 ?auto_50469 ) ) ( not ( = ?auto_50467 ?auto_50470 ) ) ( not ( = ?auto_50468 ?auto_50469 ) ) ( not ( = ?auto_50468 ?auto_50470 ) ) ( not ( = ?auto_50469 ?auto_50470 ) ) ( ON ?auto_50468 ?auto_50469 ) ( ON ?auto_50467 ?auto_50468 ) ( CLEAR ?auto_50465 ) ( ON ?auto_50466 ?auto_50467 ) ( CLEAR ?auto_50466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50463 ?auto_50464 ?auto_50465 ?auto_50466 )
      ( MAKE-7PILE ?auto_50463 ?auto_50464 ?auto_50465 ?auto_50466 ?auto_50467 ?auto_50468 ?auto_50469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50478 - BLOCK
      ?auto_50479 - BLOCK
      ?auto_50480 - BLOCK
      ?auto_50481 - BLOCK
      ?auto_50482 - BLOCK
      ?auto_50483 - BLOCK
      ?auto_50484 - BLOCK
    )
    :vars
    (
      ?auto_50485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50484 ?auto_50485 ) ( ON-TABLE ?auto_50478 ) ( ON ?auto_50479 ?auto_50478 ) ( ON ?auto_50480 ?auto_50479 ) ( not ( = ?auto_50478 ?auto_50479 ) ) ( not ( = ?auto_50478 ?auto_50480 ) ) ( not ( = ?auto_50478 ?auto_50481 ) ) ( not ( = ?auto_50478 ?auto_50482 ) ) ( not ( = ?auto_50478 ?auto_50483 ) ) ( not ( = ?auto_50478 ?auto_50484 ) ) ( not ( = ?auto_50478 ?auto_50485 ) ) ( not ( = ?auto_50479 ?auto_50480 ) ) ( not ( = ?auto_50479 ?auto_50481 ) ) ( not ( = ?auto_50479 ?auto_50482 ) ) ( not ( = ?auto_50479 ?auto_50483 ) ) ( not ( = ?auto_50479 ?auto_50484 ) ) ( not ( = ?auto_50479 ?auto_50485 ) ) ( not ( = ?auto_50480 ?auto_50481 ) ) ( not ( = ?auto_50480 ?auto_50482 ) ) ( not ( = ?auto_50480 ?auto_50483 ) ) ( not ( = ?auto_50480 ?auto_50484 ) ) ( not ( = ?auto_50480 ?auto_50485 ) ) ( not ( = ?auto_50481 ?auto_50482 ) ) ( not ( = ?auto_50481 ?auto_50483 ) ) ( not ( = ?auto_50481 ?auto_50484 ) ) ( not ( = ?auto_50481 ?auto_50485 ) ) ( not ( = ?auto_50482 ?auto_50483 ) ) ( not ( = ?auto_50482 ?auto_50484 ) ) ( not ( = ?auto_50482 ?auto_50485 ) ) ( not ( = ?auto_50483 ?auto_50484 ) ) ( not ( = ?auto_50483 ?auto_50485 ) ) ( not ( = ?auto_50484 ?auto_50485 ) ) ( ON ?auto_50483 ?auto_50484 ) ( ON ?auto_50482 ?auto_50483 ) ( CLEAR ?auto_50480 ) ( ON ?auto_50481 ?auto_50482 ) ( CLEAR ?auto_50481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50478 ?auto_50479 ?auto_50480 ?auto_50481 )
      ( MAKE-7PILE ?auto_50478 ?auto_50479 ?auto_50480 ?auto_50481 ?auto_50482 ?auto_50483 ?auto_50484 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50493 - BLOCK
      ?auto_50494 - BLOCK
      ?auto_50495 - BLOCK
      ?auto_50496 - BLOCK
      ?auto_50497 - BLOCK
      ?auto_50498 - BLOCK
      ?auto_50499 - BLOCK
    )
    :vars
    (
      ?auto_50500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50499 ?auto_50500 ) ( ON-TABLE ?auto_50493 ) ( ON ?auto_50494 ?auto_50493 ) ( not ( = ?auto_50493 ?auto_50494 ) ) ( not ( = ?auto_50493 ?auto_50495 ) ) ( not ( = ?auto_50493 ?auto_50496 ) ) ( not ( = ?auto_50493 ?auto_50497 ) ) ( not ( = ?auto_50493 ?auto_50498 ) ) ( not ( = ?auto_50493 ?auto_50499 ) ) ( not ( = ?auto_50493 ?auto_50500 ) ) ( not ( = ?auto_50494 ?auto_50495 ) ) ( not ( = ?auto_50494 ?auto_50496 ) ) ( not ( = ?auto_50494 ?auto_50497 ) ) ( not ( = ?auto_50494 ?auto_50498 ) ) ( not ( = ?auto_50494 ?auto_50499 ) ) ( not ( = ?auto_50494 ?auto_50500 ) ) ( not ( = ?auto_50495 ?auto_50496 ) ) ( not ( = ?auto_50495 ?auto_50497 ) ) ( not ( = ?auto_50495 ?auto_50498 ) ) ( not ( = ?auto_50495 ?auto_50499 ) ) ( not ( = ?auto_50495 ?auto_50500 ) ) ( not ( = ?auto_50496 ?auto_50497 ) ) ( not ( = ?auto_50496 ?auto_50498 ) ) ( not ( = ?auto_50496 ?auto_50499 ) ) ( not ( = ?auto_50496 ?auto_50500 ) ) ( not ( = ?auto_50497 ?auto_50498 ) ) ( not ( = ?auto_50497 ?auto_50499 ) ) ( not ( = ?auto_50497 ?auto_50500 ) ) ( not ( = ?auto_50498 ?auto_50499 ) ) ( not ( = ?auto_50498 ?auto_50500 ) ) ( not ( = ?auto_50499 ?auto_50500 ) ) ( ON ?auto_50498 ?auto_50499 ) ( ON ?auto_50497 ?auto_50498 ) ( ON ?auto_50496 ?auto_50497 ) ( CLEAR ?auto_50494 ) ( ON ?auto_50495 ?auto_50496 ) ( CLEAR ?auto_50495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50493 ?auto_50494 ?auto_50495 )
      ( MAKE-7PILE ?auto_50493 ?auto_50494 ?auto_50495 ?auto_50496 ?auto_50497 ?auto_50498 ?auto_50499 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50508 - BLOCK
      ?auto_50509 - BLOCK
      ?auto_50510 - BLOCK
      ?auto_50511 - BLOCK
      ?auto_50512 - BLOCK
      ?auto_50513 - BLOCK
      ?auto_50514 - BLOCK
    )
    :vars
    (
      ?auto_50515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50514 ?auto_50515 ) ( ON-TABLE ?auto_50508 ) ( ON ?auto_50509 ?auto_50508 ) ( not ( = ?auto_50508 ?auto_50509 ) ) ( not ( = ?auto_50508 ?auto_50510 ) ) ( not ( = ?auto_50508 ?auto_50511 ) ) ( not ( = ?auto_50508 ?auto_50512 ) ) ( not ( = ?auto_50508 ?auto_50513 ) ) ( not ( = ?auto_50508 ?auto_50514 ) ) ( not ( = ?auto_50508 ?auto_50515 ) ) ( not ( = ?auto_50509 ?auto_50510 ) ) ( not ( = ?auto_50509 ?auto_50511 ) ) ( not ( = ?auto_50509 ?auto_50512 ) ) ( not ( = ?auto_50509 ?auto_50513 ) ) ( not ( = ?auto_50509 ?auto_50514 ) ) ( not ( = ?auto_50509 ?auto_50515 ) ) ( not ( = ?auto_50510 ?auto_50511 ) ) ( not ( = ?auto_50510 ?auto_50512 ) ) ( not ( = ?auto_50510 ?auto_50513 ) ) ( not ( = ?auto_50510 ?auto_50514 ) ) ( not ( = ?auto_50510 ?auto_50515 ) ) ( not ( = ?auto_50511 ?auto_50512 ) ) ( not ( = ?auto_50511 ?auto_50513 ) ) ( not ( = ?auto_50511 ?auto_50514 ) ) ( not ( = ?auto_50511 ?auto_50515 ) ) ( not ( = ?auto_50512 ?auto_50513 ) ) ( not ( = ?auto_50512 ?auto_50514 ) ) ( not ( = ?auto_50512 ?auto_50515 ) ) ( not ( = ?auto_50513 ?auto_50514 ) ) ( not ( = ?auto_50513 ?auto_50515 ) ) ( not ( = ?auto_50514 ?auto_50515 ) ) ( ON ?auto_50513 ?auto_50514 ) ( ON ?auto_50512 ?auto_50513 ) ( ON ?auto_50511 ?auto_50512 ) ( CLEAR ?auto_50509 ) ( ON ?auto_50510 ?auto_50511 ) ( CLEAR ?auto_50510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50508 ?auto_50509 ?auto_50510 )
      ( MAKE-7PILE ?auto_50508 ?auto_50509 ?auto_50510 ?auto_50511 ?auto_50512 ?auto_50513 ?auto_50514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50523 - BLOCK
      ?auto_50524 - BLOCK
      ?auto_50525 - BLOCK
      ?auto_50526 - BLOCK
      ?auto_50527 - BLOCK
      ?auto_50528 - BLOCK
      ?auto_50529 - BLOCK
    )
    :vars
    (
      ?auto_50530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50529 ?auto_50530 ) ( ON-TABLE ?auto_50523 ) ( not ( = ?auto_50523 ?auto_50524 ) ) ( not ( = ?auto_50523 ?auto_50525 ) ) ( not ( = ?auto_50523 ?auto_50526 ) ) ( not ( = ?auto_50523 ?auto_50527 ) ) ( not ( = ?auto_50523 ?auto_50528 ) ) ( not ( = ?auto_50523 ?auto_50529 ) ) ( not ( = ?auto_50523 ?auto_50530 ) ) ( not ( = ?auto_50524 ?auto_50525 ) ) ( not ( = ?auto_50524 ?auto_50526 ) ) ( not ( = ?auto_50524 ?auto_50527 ) ) ( not ( = ?auto_50524 ?auto_50528 ) ) ( not ( = ?auto_50524 ?auto_50529 ) ) ( not ( = ?auto_50524 ?auto_50530 ) ) ( not ( = ?auto_50525 ?auto_50526 ) ) ( not ( = ?auto_50525 ?auto_50527 ) ) ( not ( = ?auto_50525 ?auto_50528 ) ) ( not ( = ?auto_50525 ?auto_50529 ) ) ( not ( = ?auto_50525 ?auto_50530 ) ) ( not ( = ?auto_50526 ?auto_50527 ) ) ( not ( = ?auto_50526 ?auto_50528 ) ) ( not ( = ?auto_50526 ?auto_50529 ) ) ( not ( = ?auto_50526 ?auto_50530 ) ) ( not ( = ?auto_50527 ?auto_50528 ) ) ( not ( = ?auto_50527 ?auto_50529 ) ) ( not ( = ?auto_50527 ?auto_50530 ) ) ( not ( = ?auto_50528 ?auto_50529 ) ) ( not ( = ?auto_50528 ?auto_50530 ) ) ( not ( = ?auto_50529 ?auto_50530 ) ) ( ON ?auto_50528 ?auto_50529 ) ( ON ?auto_50527 ?auto_50528 ) ( ON ?auto_50526 ?auto_50527 ) ( ON ?auto_50525 ?auto_50526 ) ( CLEAR ?auto_50523 ) ( ON ?auto_50524 ?auto_50525 ) ( CLEAR ?auto_50524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50523 ?auto_50524 )
      ( MAKE-7PILE ?auto_50523 ?auto_50524 ?auto_50525 ?auto_50526 ?auto_50527 ?auto_50528 ?auto_50529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50538 - BLOCK
      ?auto_50539 - BLOCK
      ?auto_50540 - BLOCK
      ?auto_50541 - BLOCK
      ?auto_50542 - BLOCK
      ?auto_50543 - BLOCK
      ?auto_50544 - BLOCK
    )
    :vars
    (
      ?auto_50545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50544 ?auto_50545 ) ( ON-TABLE ?auto_50538 ) ( not ( = ?auto_50538 ?auto_50539 ) ) ( not ( = ?auto_50538 ?auto_50540 ) ) ( not ( = ?auto_50538 ?auto_50541 ) ) ( not ( = ?auto_50538 ?auto_50542 ) ) ( not ( = ?auto_50538 ?auto_50543 ) ) ( not ( = ?auto_50538 ?auto_50544 ) ) ( not ( = ?auto_50538 ?auto_50545 ) ) ( not ( = ?auto_50539 ?auto_50540 ) ) ( not ( = ?auto_50539 ?auto_50541 ) ) ( not ( = ?auto_50539 ?auto_50542 ) ) ( not ( = ?auto_50539 ?auto_50543 ) ) ( not ( = ?auto_50539 ?auto_50544 ) ) ( not ( = ?auto_50539 ?auto_50545 ) ) ( not ( = ?auto_50540 ?auto_50541 ) ) ( not ( = ?auto_50540 ?auto_50542 ) ) ( not ( = ?auto_50540 ?auto_50543 ) ) ( not ( = ?auto_50540 ?auto_50544 ) ) ( not ( = ?auto_50540 ?auto_50545 ) ) ( not ( = ?auto_50541 ?auto_50542 ) ) ( not ( = ?auto_50541 ?auto_50543 ) ) ( not ( = ?auto_50541 ?auto_50544 ) ) ( not ( = ?auto_50541 ?auto_50545 ) ) ( not ( = ?auto_50542 ?auto_50543 ) ) ( not ( = ?auto_50542 ?auto_50544 ) ) ( not ( = ?auto_50542 ?auto_50545 ) ) ( not ( = ?auto_50543 ?auto_50544 ) ) ( not ( = ?auto_50543 ?auto_50545 ) ) ( not ( = ?auto_50544 ?auto_50545 ) ) ( ON ?auto_50543 ?auto_50544 ) ( ON ?auto_50542 ?auto_50543 ) ( ON ?auto_50541 ?auto_50542 ) ( ON ?auto_50540 ?auto_50541 ) ( CLEAR ?auto_50538 ) ( ON ?auto_50539 ?auto_50540 ) ( CLEAR ?auto_50539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50538 ?auto_50539 )
      ( MAKE-7PILE ?auto_50538 ?auto_50539 ?auto_50540 ?auto_50541 ?auto_50542 ?auto_50543 ?auto_50544 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50553 - BLOCK
      ?auto_50554 - BLOCK
      ?auto_50555 - BLOCK
      ?auto_50556 - BLOCK
      ?auto_50557 - BLOCK
      ?auto_50558 - BLOCK
      ?auto_50559 - BLOCK
    )
    :vars
    (
      ?auto_50560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50559 ?auto_50560 ) ( not ( = ?auto_50553 ?auto_50554 ) ) ( not ( = ?auto_50553 ?auto_50555 ) ) ( not ( = ?auto_50553 ?auto_50556 ) ) ( not ( = ?auto_50553 ?auto_50557 ) ) ( not ( = ?auto_50553 ?auto_50558 ) ) ( not ( = ?auto_50553 ?auto_50559 ) ) ( not ( = ?auto_50553 ?auto_50560 ) ) ( not ( = ?auto_50554 ?auto_50555 ) ) ( not ( = ?auto_50554 ?auto_50556 ) ) ( not ( = ?auto_50554 ?auto_50557 ) ) ( not ( = ?auto_50554 ?auto_50558 ) ) ( not ( = ?auto_50554 ?auto_50559 ) ) ( not ( = ?auto_50554 ?auto_50560 ) ) ( not ( = ?auto_50555 ?auto_50556 ) ) ( not ( = ?auto_50555 ?auto_50557 ) ) ( not ( = ?auto_50555 ?auto_50558 ) ) ( not ( = ?auto_50555 ?auto_50559 ) ) ( not ( = ?auto_50555 ?auto_50560 ) ) ( not ( = ?auto_50556 ?auto_50557 ) ) ( not ( = ?auto_50556 ?auto_50558 ) ) ( not ( = ?auto_50556 ?auto_50559 ) ) ( not ( = ?auto_50556 ?auto_50560 ) ) ( not ( = ?auto_50557 ?auto_50558 ) ) ( not ( = ?auto_50557 ?auto_50559 ) ) ( not ( = ?auto_50557 ?auto_50560 ) ) ( not ( = ?auto_50558 ?auto_50559 ) ) ( not ( = ?auto_50558 ?auto_50560 ) ) ( not ( = ?auto_50559 ?auto_50560 ) ) ( ON ?auto_50558 ?auto_50559 ) ( ON ?auto_50557 ?auto_50558 ) ( ON ?auto_50556 ?auto_50557 ) ( ON ?auto_50555 ?auto_50556 ) ( ON ?auto_50554 ?auto_50555 ) ( ON ?auto_50553 ?auto_50554 ) ( CLEAR ?auto_50553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50553 )
      ( MAKE-7PILE ?auto_50553 ?auto_50554 ?auto_50555 ?auto_50556 ?auto_50557 ?auto_50558 ?auto_50559 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_50568 - BLOCK
      ?auto_50569 - BLOCK
      ?auto_50570 - BLOCK
      ?auto_50571 - BLOCK
      ?auto_50572 - BLOCK
      ?auto_50573 - BLOCK
      ?auto_50574 - BLOCK
    )
    :vars
    (
      ?auto_50575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50574 ?auto_50575 ) ( not ( = ?auto_50568 ?auto_50569 ) ) ( not ( = ?auto_50568 ?auto_50570 ) ) ( not ( = ?auto_50568 ?auto_50571 ) ) ( not ( = ?auto_50568 ?auto_50572 ) ) ( not ( = ?auto_50568 ?auto_50573 ) ) ( not ( = ?auto_50568 ?auto_50574 ) ) ( not ( = ?auto_50568 ?auto_50575 ) ) ( not ( = ?auto_50569 ?auto_50570 ) ) ( not ( = ?auto_50569 ?auto_50571 ) ) ( not ( = ?auto_50569 ?auto_50572 ) ) ( not ( = ?auto_50569 ?auto_50573 ) ) ( not ( = ?auto_50569 ?auto_50574 ) ) ( not ( = ?auto_50569 ?auto_50575 ) ) ( not ( = ?auto_50570 ?auto_50571 ) ) ( not ( = ?auto_50570 ?auto_50572 ) ) ( not ( = ?auto_50570 ?auto_50573 ) ) ( not ( = ?auto_50570 ?auto_50574 ) ) ( not ( = ?auto_50570 ?auto_50575 ) ) ( not ( = ?auto_50571 ?auto_50572 ) ) ( not ( = ?auto_50571 ?auto_50573 ) ) ( not ( = ?auto_50571 ?auto_50574 ) ) ( not ( = ?auto_50571 ?auto_50575 ) ) ( not ( = ?auto_50572 ?auto_50573 ) ) ( not ( = ?auto_50572 ?auto_50574 ) ) ( not ( = ?auto_50572 ?auto_50575 ) ) ( not ( = ?auto_50573 ?auto_50574 ) ) ( not ( = ?auto_50573 ?auto_50575 ) ) ( not ( = ?auto_50574 ?auto_50575 ) ) ( ON ?auto_50573 ?auto_50574 ) ( ON ?auto_50572 ?auto_50573 ) ( ON ?auto_50571 ?auto_50572 ) ( ON ?auto_50570 ?auto_50571 ) ( ON ?auto_50569 ?auto_50570 ) ( ON ?auto_50568 ?auto_50569 ) ( CLEAR ?auto_50568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50568 )
      ( MAKE-7PILE ?auto_50568 ?auto_50569 ?auto_50570 ?auto_50571 ?auto_50572 ?auto_50573 ?auto_50574 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50584 - BLOCK
      ?auto_50585 - BLOCK
      ?auto_50586 - BLOCK
      ?auto_50587 - BLOCK
      ?auto_50588 - BLOCK
      ?auto_50589 - BLOCK
      ?auto_50590 - BLOCK
      ?auto_50591 - BLOCK
    )
    :vars
    (
      ?auto_50592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50590 ) ( ON ?auto_50591 ?auto_50592 ) ( CLEAR ?auto_50591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50584 ) ( ON ?auto_50585 ?auto_50584 ) ( ON ?auto_50586 ?auto_50585 ) ( ON ?auto_50587 ?auto_50586 ) ( ON ?auto_50588 ?auto_50587 ) ( ON ?auto_50589 ?auto_50588 ) ( ON ?auto_50590 ?auto_50589 ) ( not ( = ?auto_50584 ?auto_50585 ) ) ( not ( = ?auto_50584 ?auto_50586 ) ) ( not ( = ?auto_50584 ?auto_50587 ) ) ( not ( = ?auto_50584 ?auto_50588 ) ) ( not ( = ?auto_50584 ?auto_50589 ) ) ( not ( = ?auto_50584 ?auto_50590 ) ) ( not ( = ?auto_50584 ?auto_50591 ) ) ( not ( = ?auto_50584 ?auto_50592 ) ) ( not ( = ?auto_50585 ?auto_50586 ) ) ( not ( = ?auto_50585 ?auto_50587 ) ) ( not ( = ?auto_50585 ?auto_50588 ) ) ( not ( = ?auto_50585 ?auto_50589 ) ) ( not ( = ?auto_50585 ?auto_50590 ) ) ( not ( = ?auto_50585 ?auto_50591 ) ) ( not ( = ?auto_50585 ?auto_50592 ) ) ( not ( = ?auto_50586 ?auto_50587 ) ) ( not ( = ?auto_50586 ?auto_50588 ) ) ( not ( = ?auto_50586 ?auto_50589 ) ) ( not ( = ?auto_50586 ?auto_50590 ) ) ( not ( = ?auto_50586 ?auto_50591 ) ) ( not ( = ?auto_50586 ?auto_50592 ) ) ( not ( = ?auto_50587 ?auto_50588 ) ) ( not ( = ?auto_50587 ?auto_50589 ) ) ( not ( = ?auto_50587 ?auto_50590 ) ) ( not ( = ?auto_50587 ?auto_50591 ) ) ( not ( = ?auto_50587 ?auto_50592 ) ) ( not ( = ?auto_50588 ?auto_50589 ) ) ( not ( = ?auto_50588 ?auto_50590 ) ) ( not ( = ?auto_50588 ?auto_50591 ) ) ( not ( = ?auto_50588 ?auto_50592 ) ) ( not ( = ?auto_50589 ?auto_50590 ) ) ( not ( = ?auto_50589 ?auto_50591 ) ) ( not ( = ?auto_50589 ?auto_50592 ) ) ( not ( = ?auto_50590 ?auto_50591 ) ) ( not ( = ?auto_50590 ?auto_50592 ) ) ( not ( = ?auto_50591 ?auto_50592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50591 ?auto_50592 )
      ( !STACK ?auto_50591 ?auto_50590 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50601 - BLOCK
      ?auto_50602 - BLOCK
      ?auto_50603 - BLOCK
      ?auto_50604 - BLOCK
      ?auto_50605 - BLOCK
      ?auto_50606 - BLOCK
      ?auto_50607 - BLOCK
      ?auto_50608 - BLOCK
    )
    :vars
    (
      ?auto_50609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50607 ) ( ON ?auto_50608 ?auto_50609 ) ( CLEAR ?auto_50608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50601 ) ( ON ?auto_50602 ?auto_50601 ) ( ON ?auto_50603 ?auto_50602 ) ( ON ?auto_50604 ?auto_50603 ) ( ON ?auto_50605 ?auto_50604 ) ( ON ?auto_50606 ?auto_50605 ) ( ON ?auto_50607 ?auto_50606 ) ( not ( = ?auto_50601 ?auto_50602 ) ) ( not ( = ?auto_50601 ?auto_50603 ) ) ( not ( = ?auto_50601 ?auto_50604 ) ) ( not ( = ?auto_50601 ?auto_50605 ) ) ( not ( = ?auto_50601 ?auto_50606 ) ) ( not ( = ?auto_50601 ?auto_50607 ) ) ( not ( = ?auto_50601 ?auto_50608 ) ) ( not ( = ?auto_50601 ?auto_50609 ) ) ( not ( = ?auto_50602 ?auto_50603 ) ) ( not ( = ?auto_50602 ?auto_50604 ) ) ( not ( = ?auto_50602 ?auto_50605 ) ) ( not ( = ?auto_50602 ?auto_50606 ) ) ( not ( = ?auto_50602 ?auto_50607 ) ) ( not ( = ?auto_50602 ?auto_50608 ) ) ( not ( = ?auto_50602 ?auto_50609 ) ) ( not ( = ?auto_50603 ?auto_50604 ) ) ( not ( = ?auto_50603 ?auto_50605 ) ) ( not ( = ?auto_50603 ?auto_50606 ) ) ( not ( = ?auto_50603 ?auto_50607 ) ) ( not ( = ?auto_50603 ?auto_50608 ) ) ( not ( = ?auto_50603 ?auto_50609 ) ) ( not ( = ?auto_50604 ?auto_50605 ) ) ( not ( = ?auto_50604 ?auto_50606 ) ) ( not ( = ?auto_50604 ?auto_50607 ) ) ( not ( = ?auto_50604 ?auto_50608 ) ) ( not ( = ?auto_50604 ?auto_50609 ) ) ( not ( = ?auto_50605 ?auto_50606 ) ) ( not ( = ?auto_50605 ?auto_50607 ) ) ( not ( = ?auto_50605 ?auto_50608 ) ) ( not ( = ?auto_50605 ?auto_50609 ) ) ( not ( = ?auto_50606 ?auto_50607 ) ) ( not ( = ?auto_50606 ?auto_50608 ) ) ( not ( = ?auto_50606 ?auto_50609 ) ) ( not ( = ?auto_50607 ?auto_50608 ) ) ( not ( = ?auto_50607 ?auto_50609 ) ) ( not ( = ?auto_50608 ?auto_50609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50608 ?auto_50609 )
      ( !STACK ?auto_50608 ?auto_50607 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50618 - BLOCK
      ?auto_50619 - BLOCK
      ?auto_50620 - BLOCK
      ?auto_50621 - BLOCK
      ?auto_50622 - BLOCK
      ?auto_50623 - BLOCK
      ?auto_50624 - BLOCK
      ?auto_50625 - BLOCK
    )
    :vars
    (
      ?auto_50626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50625 ?auto_50626 ) ( ON-TABLE ?auto_50618 ) ( ON ?auto_50619 ?auto_50618 ) ( ON ?auto_50620 ?auto_50619 ) ( ON ?auto_50621 ?auto_50620 ) ( ON ?auto_50622 ?auto_50621 ) ( ON ?auto_50623 ?auto_50622 ) ( not ( = ?auto_50618 ?auto_50619 ) ) ( not ( = ?auto_50618 ?auto_50620 ) ) ( not ( = ?auto_50618 ?auto_50621 ) ) ( not ( = ?auto_50618 ?auto_50622 ) ) ( not ( = ?auto_50618 ?auto_50623 ) ) ( not ( = ?auto_50618 ?auto_50624 ) ) ( not ( = ?auto_50618 ?auto_50625 ) ) ( not ( = ?auto_50618 ?auto_50626 ) ) ( not ( = ?auto_50619 ?auto_50620 ) ) ( not ( = ?auto_50619 ?auto_50621 ) ) ( not ( = ?auto_50619 ?auto_50622 ) ) ( not ( = ?auto_50619 ?auto_50623 ) ) ( not ( = ?auto_50619 ?auto_50624 ) ) ( not ( = ?auto_50619 ?auto_50625 ) ) ( not ( = ?auto_50619 ?auto_50626 ) ) ( not ( = ?auto_50620 ?auto_50621 ) ) ( not ( = ?auto_50620 ?auto_50622 ) ) ( not ( = ?auto_50620 ?auto_50623 ) ) ( not ( = ?auto_50620 ?auto_50624 ) ) ( not ( = ?auto_50620 ?auto_50625 ) ) ( not ( = ?auto_50620 ?auto_50626 ) ) ( not ( = ?auto_50621 ?auto_50622 ) ) ( not ( = ?auto_50621 ?auto_50623 ) ) ( not ( = ?auto_50621 ?auto_50624 ) ) ( not ( = ?auto_50621 ?auto_50625 ) ) ( not ( = ?auto_50621 ?auto_50626 ) ) ( not ( = ?auto_50622 ?auto_50623 ) ) ( not ( = ?auto_50622 ?auto_50624 ) ) ( not ( = ?auto_50622 ?auto_50625 ) ) ( not ( = ?auto_50622 ?auto_50626 ) ) ( not ( = ?auto_50623 ?auto_50624 ) ) ( not ( = ?auto_50623 ?auto_50625 ) ) ( not ( = ?auto_50623 ?auto_50626 ) ) ( not ( = ?auto_50624 ?auto_50625 ) ) ( not ( = ?auto_50624 ?auto_50626 ) ) ( not ( = ?auto_50625 ?auto_50626 ) ) ( CLEAR ?auto_50623 ) ( ON ?auto_50624 ?auto_50625 ) ( CLEAR ?auto_50624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_50618 ?auto_50619 ?auto_50620 ?auto_50621 ?auto_50622 ?auto_50623 ?auto_50624 )
      ( MAKE-8PILE ?auto_50618 ?auto_50619 ?auto_50620 ?auto_50621 ?auto_50622 ?auto_50623 ?auto_50624 ?auto_50625 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50635 - BLOCK
      ?auto_50636 - BLOCK
      ?auto_50637 - BLOCK
      ?auto_50638 - BLOCK
      ?auto_50639 - BLOCK
      ?auto_50640 - BLOCK
      ?auto_50641 - BLOCK
      ?auto_50642 - BLOCK
    )
    :vars
    (
      ?auto_50643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50642 ?auto_50643 ) ( ON-TABLE ?auto_50635 ) ( ON ?auto_50636 ?auto_50635 ) ( ON ?auto_50637 ?auto_50636 ) ( ON ?auto_50638 ?auto_50637 ) ( ON ?auto_50639 ?auto_50638 ) ( ON ?auto_50640 ?auto_50639 ) ( not ( = ?auto_50635 ?auto_50636 ) ) ( not ( = ?auto_50635 ?auto_50637 ) ) ( not ( = ?auto_50635 ?auto_50638 ) ) ( not ( = ?auto_50635 ?auto_50639 ) ) ( not ( = ?auto_50635 ?auto_50640 ) ) ( not ( = ?auto_50635 ?auto_50641 ) ) ( not ( = ?auto_50635 ?auto_50642 ) ) ( not ( = ?auto_50635 ?auto_50643 ) ) ( not ( = ?auto_50636 ?auto_50637 ) ) ( not ( = ?auto_50636 ?auto_50638 ) ) ( not ( = ?auto_50636 ?auto_50639 ) ) ( not ( = ?auto_50636 ?auto_50640 ) ) ( not ( = ?auto_50636 ?auto_50641 ) ) ( not ( = ?auto_50636 ?auto_50642 ) ) ( not ( = ?auto_50636 ?auto_50643 ) ) ( not ( = ?auto_50637 ?auto_50638 ) ) ( not ( = ?auto_50637 ?auto_50639 ) ) ( not ( = ?auto_50637 ?auto_50640 ) ) ( not ( = ?auto_50637 ?auto_50641 ) ) ( not ( = ?auto_50637 ?auto_50642 ) ) ( not ( = ?auto_50637 ?auto_50643 ) ) ( not ( = ?auto_50638 ?auto_50639 ) ) ( not ( = ?auto_50638 ?auto_50640 ) ) ( not ( = ?auto_50638 ?auto_50641 ) ) ( not ( = ?auto_50638 ?auto_50642 ) ) ( not ( = ?auto_50638 ?auto_50643 ) ) ( not ( = ?auto_50639 ?auto_50640 ) ) ( not ( = ?auto_50639 ?auto_50641 ) ) ( not ( = ?auto_50639 ?auto_50642 ) ) ( not ( = ?auto_50639 ?auto_50643 ) ) ( not ( = ?auto_50640 ?auto_50641 ) ) ( not ( = ?auto_50640 ?auto_50642 ) ) ( not ( = ?auto_50640 ?auto_50643 ) ) ( not ( = ?auto_50641 ?auto_50642 ) ) ( not ( = ?auto_50641 ?auto_50643 ) ) ( not ( = ?auto_50642 ?auto_50643 ) ) ( CLEAR ?auto_50640 ) ( ON ?auto_50641 ?auto_50642 ) ( CLEAR ?auto_50641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_50635 ?auto_50636 ?auto_50637 ?auto_50638 ?auto_50639 ?auto_50640 ?auto_50641 )
      ( MAKE-8PILE ?auto_50635 ?auto_50636 ?auto_50637 ?auto_50638 ?auto_50639 ?auto_50640 ?auto_50641 ?auto_50642 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50652 - BLOCK
      ?auto_50653 - BLOCK
      ?auto_50654 - BLOCK
      ?auto_50655 - BLOCK
      ?auto_50656 - BLOCK
      ?auto_50657 - BLOCK
      ?auto_50658 - BLOCK
      ?auto_50659 - BLOCK
    )
    :vars
    (
      ?auto_50660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50659 ?auto_50660 ) ( ON-TABLE ?auto_50652 ) ( ON ?auto_50653 ?auto_50652 ) ( ON ?auto_50654 ?auto_50653 ) ( ON ?auto_50655 ?auto_50654 ) ( ON ?auto_50656 ?auto_50655 ) ( not ( = ?auto_50652 ?auto_50653 ) ) ( not ( = ?auto_50652 ?auto_50654 ) ) ( not ( = ?auto_50652 ?auto_50655 ) ) ( not ( = ?auto_50652 ?auto_50656 ) ) ( not ( = ?auto_50652 ?auto_50657 ) ) ( not ( = ?auto_50652 ?auto_50658 ) ) ( not ( = ?auto_50652 ?auto_50659 ) ) ( not ( = ?auto_50652 ?auto_50660 ) ) ( not ( = ?auto_50653 ?auto_50654 ) ) ( not ( = ?auto_50653 ?auto_50655 ) ) ( not ( = ?auto_50653 ?auto_50656 ) ) ( not ( = ?auto_50653 ?auto_50657 ) ) ( not ( = ?auto_50653 ?auto_50658 ) ) ( not ( = ?auto_50653 ?auto_50659 ) ) ( not ( = ?auto_50653 ?auto_50660 ) ) ( not ( = ?auto_50654 ?auto_50655 ) ) ( not ( = ?auto_50654 ?auto_50656 ) ) ( not ( = ?auto_50654 ?auto_50657 ) ) ( not ( = ?auto_50654 ?auto_50658 ) ) ( not ( = ?auto_50654 ?auto_50659 ) ) ( not ( = ?auto_50654 ?auto_50660 ) ) ( not ( = ?auto_50655 ?auto_50656 ) ) ( not ( = ?auto_50655 ?auto_50657 ) ) ( not ( = ?auto_50655 ?auto_50658 ) ) ( not ( = ?auto_50655 ?auto_50659 ) ) ( not ( = ?auto_50655 ?auto_50660 ) ) ( not ( = ?auto_50656 ?auto_50657 ) ) ( not ( = ?auto_50656 ?auto_50658 ) ) ( not ( = ?auto_50656 ?auto_50659 ) ) ( not ( = ?auto_50656 ?auto_50660 ) ) ( not ( = ?auto_50657 ?auto_50658 ) ) ( not ( = ?auto_50657 ?auto_50659 ) ) ( not ( = ?auto_50657 ?auto_50660 ) ) ( not ( = ?auto_50658 ?auto_50659 ) ) ( not ( = ?auto_50658 ?auto_50660 ) ) ( not ( = ?auto_50659 ?auto_50660 ) ) ( ON ?auto_50658 ?auto_50659 ) ( CLEAR ?auto_50656 ) ( ON ?auto_50657 ?auto_50658 ) ( CLEAR ?auto_50657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50652 ?auto_50653 ?auto_50654 ?auto_50655 ?auto_50656 ?auto_50657 )
      ( MAKE-8PILE ?auto_50652 ?auto_50653 ?auto_50654 ?auto_50655 ?auto_50656 ?auto_50657 ?auto_50658 ?auto_50659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50669 - BLOCK
      ?auto_50670 - BLOCK
      ?auto_50671 - BLOCK
      ?auto_50672 - BLOCK
      ?auto_50673 - BLOCK
      ?auto_50674 - BLOCK
      ?auto_50675 - BLOCK
      ?auto_50676 - BLOCK
    )
    :vars
    (
      ?auto_50677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50676 ?auto_50677 ) ( ON-TABLE ?auto_50669 ) ( ON ?auto_50670 ?auto_50669 ) ( ON ?auto_50671 ?auto_50670 ) ( ON ?auto_50672 ?auto_50671 ) ( ON ?auto_50673 ?auto_50672 ) ( not ( = ?auto_50669 ?auto_50670 ) ) ( not ( = ?auto_50669 ?auto_50671 ) ) ( not ( = ?auto_50669 ?auto_50672 ) ) ( not ( = ?auto_50669 ?auto_50673 ) ) ( not ( = ?auto_50669 ?auto_50674 ) ) ( not ( = ?auto_50669 ?auto_50675 ) ) ( not ( = ?auto_50669 ?auto_50676 ) ) ( not ( = ?auto_50669 ?auto_50677 ) ) ( not ( = ?auto_50670 ?auto_50671 ) ) ( not ( = ?auto_50670 ?auto_50672 ) ) ( not ( = ?auto_50670 ?auto_50673 ) ) ( not ( = ?auto_50670 ?auto_50674 ) ) ( not ( = ?auto_50670 ?auto_50675 ) ) ( not ( = ?auto_50670 ?auto_50676 ) ) ( not ( = ?auto_50670 ?auto_50677 ) ) ( not ( = ?auto_50671 ?auto_50672 ) ) ( not ( = ?auto_50671 ?auto_50673 ) ) ( not ( = ?auto_50671 ?auto_50674 ) ) ( not ( = ?auto_50671 ?auto_50675 ) ) ( not ( = ?auto_50671 ?auto_50676 ) ) ( not ( = ?auto_50671 ?auto_50677 ) ) ( not ( = ?auto_50672 ?auto_50673 ) ) ( not ( = ?auto_50672 ?auto_50674 ) ) ( not ( = ?auto_50672 ?auto_50675 ) ) ( not ( = ?auto_50672 ?auto_50676 ) ) ( not ( = ?auto_50672 ?auto_50677 ) ) ( not ( = ?auto_50673 ?auto_50674 ) ) ( not ( = ?auto_50673 ?auto_50675 ) ) ( not ( = ?auto_50673 ?auto_50676 ) ) ( not ( = ?auto_50673 ?auto_50677 ) ) ( not ( = ?auto_50674 ?auto_50675 ) ) ( not ( = ?auto_50674 ?auto_50676 ) ) ( not ( = ?auto_50674 ?auto_50677 ) ) ( not ( = ?auto_50675 ?auto_50676 ) ) ( not ( = ?auto_50675 ?auto_50677 ) ) ( not ( = ?auto_50676 ?auto_50677 ) ) ( ON ?auto_50675 ?auto_50676 ) ( CLEAR ?auto_50673 ) ( ON ?auto_50674 ?auto_50675 ) ( CLEAR ?auto_50674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50669 ?auto_50670 ?auto_50671 ?auto_50672 ?auto_50673 ?auto_50674 )
      ( MAKE-8PILE ?auto_50669 ?auto_50670 ?auto_50671 ?auto_50672 ?auto_50673 ?auto_50674 ?auto_50675 ?auto_50676 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50686 - BLOCK
      ?auto_50687 - BLOCK
      ?auto_50688 - BLOCK
      ?auto_50689 - BLOCK
      ?auto_50690 - BLOCK
      ?auto_50691 - BLOCK
      ?auto_50692 - BLOCK
      ?auto_50693 - BLOCK
    )
    :vars
    (
      ?auto_50694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50693 ?auto_50694 ) ( ON-TABLE ?auto_50686 ) ( ON ?auto_50687 ?auto_50686 ) ( ON ?auto_50688 ?auto_50687 ) ( ON ?auto_50689 ?auto_50688 ) ( not ( = ?auto_50686 ?auto_50687 ) ) ( not ( = ?auto_50686 ?auto_50688 ) ) ( not ( = ?auto_50686 ?auto_50689 ) ) ( not ( = ?auto_50686 ?auto_50690 ) ) ( not ( = ?auto_50686 ?auto_50691 ) ) ( not ( = ?auto_50686 ?auto_50692 ) ) ( not ( = ?auto_50686 ?auto_50693 ) ) ( not ( = ?auto_50686 ?auto_50694 ) ) ( not ( = ?auto_50687 ?auto_50688 ) ) ( not ( = ?auto_50687 ?auto_50689 ) ) ( not ( = ?auto_50687 ?auto_50690 ) ) ( not ( = ?auto_50687 ?auto_50691 ) ) ( not ( = ?auto_50687 ?auto_50692 ) ) ( not ( = ?auto_50687 ?auto_50693 ) ) ( not ( = ?auto_50687 ?auto_50694 ) ) ( not ( = ?auto_50688 ?auto_50689 ) ) ( not ( = ?auto_50688 ?auto_50690 ) ) ( not ( = ?auto_50688 ?auto_50691 ) ) ( not ( = ?auto_50688 ?auto_50692 ) ) ( not ( = ?auto_50688 ?auto_50693 ) ) ( not ( = ?auto_50688 ?auto_50694 ) ) ( not ( = ?auto_50689 ?auto_50690 ) ) ( not ( = ?auto_50689 ?auto_50691 ) ) ( not ( = ?auto_50689 ?auto_50692 ) ) ( not ( = ?auto_50689 ?auto_50693 ) ) ( not ( = ?auto_50689 ?auto_50694 ) ) ( not ( = ?auto_50690 ?auto_50691 ) ) ( not ( = ?auto_50690 ?auto_50692 ) ) ( not ( = ?auto_50690 ?auto_50693 ) ) ( not ( = ?auto_50690 ?auto_50694 ) ) ( not ( = ?auto_50691 ?auto_50692 ) ) ( not ( = ?auto_50691 ?auto_50693 ) ) ( not ( = ?auto_50691 ?auto_50694 ) ) ( not ( = ?auto_50692 ?auto_50693 ) ) ( not ( = ?auto_50692 ?auto_50694 ) ) ( not ( = ?auto_50693 ?auto_50694 ) ) ( ON ?auto_50692 ?auto_50693 ) ( ON ?auto_50691 ?auto_50692 ) ( CLEAR ?auto_50689 ) ( ON ?auto_50690 ?auto_50691 ) ( CLEAR ?auto_50690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50686 ?auto_50687 ?auto_50688 ?auto_50689 ?auto_50690 )
      ( MAKE-8PILE ?auto_50686 ?auto_50687 ?auto_50688 ?auto_50689 ?auto_50690 ?auto_50691 ?auto_50692 ?auto_50693 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50703 - BLOCK
      ?auto_50704 - BLOCK
      ?auto_50705 - BLOCK
      ?auto_50706 - BLOCK
      ?auto_50707 - BLOCK
      ?auto_50708 - BLOCK
      ?auto_50709 - BLOCK
      ?auto_50710 - BLOCK
    )
    :vars
    (
      ?auto_50711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50710 ?auto_50711 ) ( ON-TABLE ?auto_50703 ) ( ON ?auto_50704 ?auto_50703 ) ( ON ?auto_50705 ?auto_50704 ) ( ON ?auto_50706 ?auto_50705 ) ( not ( = ?auto_50703 ?auto_50704 ) ) ( not ( = ?auto_50703 ?auto_50705 ) ) ( not ( = ?auto_50703 ?auto_50706 ) ) ( not ( = ?auto_50703 ?auto_50707 ) ) ( not ( = ?auto_50703 ?auto_50708 ) ) ( not ( = ?auto_50703 ?auto_50709 ) ) ( not ( = ?auto_50703 ?auto_50710 ) ) ( not ( = ?auto_50703 ?auto_50711 ) ) ( not ( = ?auto_50704 ?auto_50705 ) ) ( not ( = ?auto_50704 ?auto_50706 ) ) ( not ( = ?auto_50704 ?auto_50707 ) ) ( not ( = ?auto_50704 ?auto_50708 ) ) ( not ( = ?auto_50704 ?auto_50709 ) ) ( not ( = ?auto_50704 ?auto_50710 ) ) ( not ( = ?auto_50704 ?auto_50711 ) ) ( not ( = ?auto_50705 ?auto_50706 ) ) ( not ( = ?auto_50705 ?auto_50707 ) ) ( not ( = ?auto_50705 ?auto_50708 ) ) ( not ( = ?auto_50705 ?auto_50709 ) ) ( not ( = ?auto_50705 ?auto_50710 ) ) ( not ( = ?auto_50705 ?auto_50711 ) ) ( not ( = ?auto_50706 ?auto_50707 ) ) ( not ( = ?auto_50706 ?auto_50708 ) ) ( not ( = ?auto_50706 ?auto_50709 ) ) ( not ( = ?auto_50706 ?auto_50710 ) ) ( not ( = ?auto_50706 ?auto_50711 ) ) ( not ( = ?auto_50707 ?auto_50708 ) ) ( not ( = ?auto_50707 ?auto_50709 ) ) ( not ( = ?auto_50707 ?auto_50710 ) ) ( not ( = ?auto_50707 ?auto_50711 ) ) ( not ( = ?auto_50708 ?auto_50709 ) ) ( not ( = ?auto_50708 ?auto_50710 ) ) ( not ( = ?auto_50708 ?auto_50711 ) ) ( not ( = ?auto_50709 ?auto_50710 ) ) ( not ( = ?auto_50709 ?auto_50711 ) ) ( not ( = ?auto_50710 ?auto_50711 ) ) ( ON ?auto_50709 ?auto_50710 ) ( ON ?auto_50708 ?auto_50709 ) ( CLEAR ?auto_50706 ) ( ON ?auto_50707 ?auto_50708 ) ( CLEAR ?auto_50707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50703 ?auto_50704 ?auto_50705 ?auto_50706 ?auto_50707 )
      ( MAKE-8PILE ?auto_50703 ?auto_50704 ?auto_50705 ?auto_50706 ?auto_50707 ?auto_50708 ?auto_50709 ?auto_50710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50720 - BLOCK
      ?auto_50721 - BLOCK
      ?auto_50722 - BLOCK
      ?auto_50723 - BLOCK
      ?auto_50724 - BLOCK
      ?auto_50725 - BLOCK
      ?auto_50726 - BLOCK
      ?auto_50727 - BLOCK
    )
    :vars
    (
      ?auto_50728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50727 ?auto_50728 ) ( ON-TABLE ?auto_50720 ) ( ON ?auto_50721 ?auto_50720 ) ( ON ?auto_50722 ?auto_50721 ) ( not ( = ?auto_50720 ?auto_50721 ) ) ( not ( = ?auto_50720 ?auto_50722 ) ) ( not ( = ?auto_50720 ?auto_50723 ) ) ( not ( = ?auto_50720 ?auto_50724 ) ) ( not ( = ?auto_50720 ?auto_50725 ) ) ( not ( = ?auto_50720 ?auto_50726 ) ) ( not ( = ?auto_50720 ?auto_50727 ) ) ( not ( = ?auto_50720 ?auto_50728 ) ) ( not ( = ?auto_50721 ?auto_50722 ) ) ( not ( = ?auto_50721 ?auto_50723 ) ) ( not ( = ?auto_50721 ?auto_50724 ) ) ( not ( = ?auto_50721 ?auto_50725 ) ) ( not ( = ?auto_50721 ?auto_50726 ) ) ( not ( = ?auto_50721 ?auto_50727 ) ) ( not ( = ?auto_50721 ?auto_50728 ) ) ( not ( = ?auto_50722 ?auto_50723 ) ) ( not ( = ?auto_50722 ?auto_50724 ) ) ( not ( = ?auto_50722 ?auto_50725 ) ) ( not ( = ?auto_50722 ?auto_50726 ) ) ( not ( = ?auto_50722 ?auto_50727 ) ) ( not ( = ?auto_50722 ?auto_50728 ) ) ( not ( = ?auto_50723 ?auto_50724 ) ) ( not ( = ?auto_50723 ?auto_50725 ) ) ( not ( = ?auto_50723 ?auto_50726 ) ) ( not ( = ?auto_50723 ?auto_50727 ) ) ( not ( = ?auto_50723 ?auto_50728 ) ) ( not ( = ?auto_50724 ?auto_50725 ) ) ( not ( = ?auto_50724 ?auto_50726 ) ) ( not ( = ?auto_50724 ?auto_50727 ) ) ( not ( = ?auto_50724 ?auto_50728 ) ) ( not ( = ?auto_50725 ?auto_50726 ) ) ( not ( = ?auto_50725 ?auto_50727 ) ) ( not ( = ?auto_50725 ?auto_50728 ) ) ( not ( = ?auto_50726 ?auto_50727 ) ) ( not ( = ?auto_50726 ?auto_50728 ) ) ( not ( = ?auto_50727 ?auto_50728 ) ) ( ON ?auto_50726 ?auto_50727 ) ( ON ?auto_50725 ?auto_50726 ) ( ON ?auto_50724 ?auto_50725 ) ( CLEAR ?auto_50722 ) ( ON ?auto_50723 ?auto_50724 ) ( CLEAR ?auto_50723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50720 ?auto_50721 ?auto_50722 ?auto_50723 )
      ( MAKE-8PILE ?auto_50720 ?auto_50721 ?auto_50722 ?auto_50723 ?auto_50724 ?auto_50725 ?auto_50726 ?auto_50727 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50737 - BLOCK
      ?auto_50738 - BLOCK
      ?auto_50739 - BLOCK
      ?auto_50740 - BLOCK
      ?auto_50741 - BLOCK
      ?auto_50742 - BLOCK
      ?auto_50743 - BLOCK
      ?auto_50744 - BLOCK
    )
    :vars
    (
      ?auto_50745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50744 ?auto_50745 ) ( ON-TABLE ?auto_50737 ) ( ON ?auto_50738 ?auto_50737 ) ( ON ?auto_50739 ?auto_50738 ) ( not ( = ?auto_50737 ?auto_50738 ) ) ( not ( = ?auto_50737 ?auto_50739 ) ) ( not ( = ?auto_50737 ?auto_50740 ) ) ( not ( = ?auto_50737 ?auto_50741 ) ) ( not ( = ?auto_50737 ?auto_50742 ) ) ( not ( = ?auto_50737 ?auto_50743 ) ) ( not ( = ?auto_50737 ?auto_50744 ) ) ( not ( = ?auto_50737 ?auto_50745 ) ) ( not ( = ?auto_50738 ?auto_50739 ) ) ( not ( = ?auto_50738 ?auto_50740 ) ) ( not ( = ?auto_50738 ?auto_50741 ) ) ( not ( = ?auto_50738 ?auto_50742 ) ) ( not ( = ?auto_50738 ?auto_50743 ) ) ( not ( = ?auto_50738 ?auto_50744 ) ) ( not ( = ?auto_50738 ?auto_50745 ) ) ( not ( = ?auto_50739 ?auto_50740 ) ) ( not ( = ?auto_50739 ?auto_50741 ) ) ( not ( = ?auto_50739 ?auto_50742 ) ) ( not ( = ?auto_50739 ?auto_50743 ) ) ( not ( = ?auto_50739 ?auto_50744 ) ) ( not ( = ?auto_50739 ?auto_50745 ) ) ( not ( = ?auto_50740 ?auto_50741 ) ) ( not ( = ?auto_50740 ?auto_50742 ) ) ( not ( = ?auto_50740 ?auto_50743 ) ) ( not ( = ?auto_50740 ?auto_50744 ) ) ( not ( = ?auto_50740 ?auto_50745 ) ) ( not ( = ?auto_50741 ?auto_50742 ) ) ( not ( = ?auto_50741 ?auto_50743 ) ) ( not ( = ?auto_50741 ?auto_50744 ) ) ( not ( = ?auto_50741 ?auto_50745 ) ) ( not ( = ?auto_50742 ?auto_50743 ) ) ( not ( = ?auto_50742 ?auto_50744 ) ) ( not ( = ?auto_50742 ?auto_50745 ) ) ( not ( = ?auto_50743 ?auto_50744 ) ) ( not ( = ?auto_50743 ?auto_50745 ) ) ( not ( = ?auto_50744 ?auto_50745 ) ) ( ON ?auto_50743 ?auto_50744 ) ( ON ?auto_50742 ?auto_50743 ) ( ON ?auto_50741 ?auto_50742 ) ( CLEAR ?auto_50739 ) ( ON ?auto_50740 ?auto_50741 ) ( CLEAR ?auto_50740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50737 ?auto_50738 ?auto_50739 ?auto_50740 )
      ( MAKE-8PILE ?auto_50737 ?auto_50738 ?auto_50739 ?auto_50740 ?auto_50741 ?auto_50742 ?auto_50743 ?auto_50744 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50754 - BLOCK
      ?auto_50755 - BLOCK
      ?auto_50756 - BLOCK
      ?auto_50757 - BLOCK
      ?auto_50758 - BLOCK
      ?auto_50759 - BLOCK
      ?auto_50760 - BLOCK
      ?auto_50761 - BLOCK
    )
    :vars
    (
      ?auto_50762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50761 ?auto_50762 ) ( ON-TABLE ?auto_50754 ) ( ON ?auto_50755 ?auto_50754 ) ( not ( = ?auto_50754 ?auto_50755 ) ) ( not ( = ?auto_50754 ?auto_50756 ) ) ( not ( = ?auto_50754 ?auto_50757 ) ) ( not ( = ?auto_50754 ?auto_50758 ) ) ( not ( = ?auto_50754 ?auto_50759 ) ) ( not ( = ?auto_50754 ?auto_50760 ) ) ( not ( = ?auto_50754 ?auto_50761 ) ) ( not ( = ?auto_50754 ?auto_50762 ) ) ( not ( = ?auto_50755 ?auto_50756 ) ) ( not ( = ?auto_50755 ?auto_50757 ) ) ( not ( = ?auto_50755 ?auto_50758 ) ) ( not ( = ?auto_50755 ?auto_50759 ) ) ( not ( = ?auto_50755 ?auto_50760 ) ) ( not ( = ?auto_50755 ?auto_50761 ) ) ( not ( = ?auto_50755 ?auto_50762 ) ) ( not ( = ?auto_50756 ?auto_50757 ) ) ( not ( = ?auto_50756 ?auto_50758 ) ) ( not ( = ?auto_50756 ?auto_50759 ) ) ( not ( = ?auto_50756 ?auto_50760 ) ) ( not ( = ?auto_50756 ?auto_50761 ) ) ( not ( = ?auto_50756 ?auto_50762 ) ) ( not ( = ?auto_50757 ?auto_50758 ) ) ( not ( = ?auto_50757 ?auto_50759 ) ) ( not ( = ?auto_50757 ?auto_50760 ) ) ( not ( = ?auto_50757 ?auto_50761 ) ) ( not ( = ?auto_50757 ?auto_50762 ) ) ( not ( = ?auto_50758 ?auto_50759 ) ) ( not ( = ?auto_50758 ?auto_50760 ) ) ( not ( = ?auto_50758 ?auto_50761 ) ) ( not ( = ?auto_50758 ?auto_50762 ) ) ( not ( = ?auto_50759 ?auto_50760 ) ) ( not ( = ?auto_50759 ?auto_50761 ) ) ( not ( = ?auto_50759 ?auto_50762 ) ) ( not ( = ?auto_50760 ?auto_50761 ) ) ( not ( = ?auto_50760 ?auto_50762 ) ) ( not ( = ?auto_50761 ?auto_50762 ) ) ( ON ?auto_50760 ?auto_50761 ) ( ON ?auto_50759 ?auto_50760 ) ( ON ?auto_50758 ?auto_50759 ) ( ON ?auto_50757 ?auto_50758 ) ( CLEAR ?auto_50755 ) ( ON ?auto_50756 ?auto_50757 ) ( CLEAR ?auto_50756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50754 ?auto_50755 ?auto_50756 )
      ( MAKE-8PILE ?auto_50754 ?auto_50755 ?auto_50756 ?auto_50757 ?auto_50758 ?auto_50759 ?auto_50760 ?auto_50761 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50771 - BLOCK
      ?auto_50772 - BLOCK
      ?auto_50773 - BLOCK
      ?auto_50774 - BLOCK
      ?auto_50775 - BLOCK
      ?auto_50776 - BLOCK
      ?auto_50777 - BLOCK
      ?auto_50778 - BLOCK
    )
    :vars
    (
      ?auto_50779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50778 ?auto_50779 ) ( ON-TABLE ?auto_50771 ) ( ON ?auto_50772 ?auto_50771 ) ( not ( = ?auto_50771 ?auto_50772 ) ) ( not ( = ?auto_50771 ?auto_50773 ) ) ( not ( = ?auto_50771 ?auto_50774 ) ) ( not ( = ?auto_50771 ?auto_50775 ) ) ( not ( = ?auto_50771 ?auto_50776 ) ) ( not ( = ?auto_50771 ?auto_50777 ) ) ( not ( = ?auto_50771 ?auto_50778 ) ) ( not ( = ?auto_50771 ?auto_50779 ) ) ( not ( = ?auto_50772 ?auto_50773 ) ) ( not ( = ?auto_50772 ?auto_50774 ) ) ( not ( = ?auto_50772 ?auto_50775 ) ) ( not ( = ?auto_50772 ?auto_50776 ) ) ( not ( = ?auto_50772 ?auto_50777 ) ) ( not ( = ?auto_50772 ?auto_50778 ) ) ( not ( = ?auto_50772 ?auto_50779 ) ) ( not ( = ?auto_50773 ?auto_50774 ) ) ( not ( = ?auto_50773 ?auto_50775 ) ) ( not ( = ?auto_50773 ?auto_50776 ) ) ( not ( = ?auto_50773 ?auto_50777 ) ) ( not ( = ?auto_50773 ?auto_50778 ) ) ( not ( = ?auto_50773 ?auto_50779 ) ) ( not ( = ?auto_50774 ?auto_50775 ) ) ( not ( = ?auto_50774 ?auto_50776 ) ) ( not ( = ?auto_50774 ?auto_50777 ) ) ( not ( = ?auto_50774 ?auto_50778 ) ) ( not ( = ?auto_50774 ?auto_50779 ) ) ( not ( = ?auto_50775 ?auto_50776 ) ) ( not ( = ?auto_50775 ?auto_50777 ) ) ( not ( = ?auto_50775 ?auto_50778 ) ) ( not ( = ?auto_50775 ?auto_50779 ) ) ( not ( = ?auto_50776 ?auto_50777 ) ) ( not ( = ?auto_50776 ?auto_50778 ) ) ( not ( = ?auto_50776 ?auto_50779 ) ) ( not ( = ?auto_50777 ?auto_50778 ) ) ( not ( = ?auto_50777 ?auto_50779 ) ) ( not ( = ?auto_50778 ?auto_50779 ) ) ( ON ?auto_50777 ?auto_50778 ) ( ON ?auto_50776 ?auto_50777 ) ( ON ?auto_50775 ?auto_50776 ) ( ON ?auto_50774 ?auto_50775 ) ( CLEAR ?auto_50772 ) ( ON ?auto_50773 ?auto_50774 ) ( CLEAR ?auto_50773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50771 ?auto_50772 ?auto_50773 )
      ( MAKE-8PILE ?auto_50771 ?auto_50772 ?auto_50773 ?auto_50774 ?auto_50775 ?auto_50776 ?auto_50777 ?auto_50778 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50788 - BLOCK
      ?auto_50789 - BLOCK
      ?auto_50790 - BLOCK
      ?auto_50791 - BLOCK
      ?auto_50792 - BLOCK
      ?auto_50793 - BLOCK
      ?auto_50794 - BLOCK
      ?auto_50795 - BLOCK
    )
    :vars
    (
      ?auto_50796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50795 ?auto_50796 ) ( ON-TABLE ?auto_50788 ) ( not ( = ?auto_50788 ?auto_50789 ) ) ( not ( = ?auto_50788 ?auto_50790 ) ) ( not ( = ?auto_50788 ?auto_50791 ) ) ( not ( = ?auto_50788 ?auto_50792 ) ) ( not ( = ?auto_50788 ?auto_50793 ) ) ( not ( = ?auto_50788 ?auto_50794 ) ) ( not ( = ?auto_50788 ?auto_50795 ) ) ( not ( = ?auto_50788 ?auto_50796 ) ) ( not ( = ?auto_50789 ?auto_50790 ) ) ( not ( = ?auto_50789 ?auto_50791 ) ) ( not ( = ?auto_50789 ?auto_50792 ) ) ( not ( = ?auto_50789 ?auto_50793 ) ) ( not ( = ?auto_50789 ?auto_50794 ) ) ( not ( = ?auto_50789 ?auto_50795 ) ) ( not ( = ?auto_50789 ?auto_50796 ) ) ( not ( = ?auto_50790 ?auto_50791 ) ) ( not ( = ?auto_50790 ?auto_50792 ) ) ( not ( = ?auto_50790 ?auto_50793 ) ) ( not ( = ?auto_50790 ?auto_50794 ) ) ( not ( = ?auto_50790 ?auto_50795 ) ) ( not ( = ?auto_50790 ?auto_50796 ) ) ( not ( = ?auto_50791 ?auto_50792 ) ) ( not ( = ?auto_50791 ?auto_50793 ) ) ( not ( = ?auto_50791 ?auto_50794 ) ) ( not ( = ?auto_50791 ?auto_50795 ) ) ( not ( = ?auto_50791 ?auto_50796 ) ) ( not ( = ?auto_50792 ?auto_50793 ) ) ( not ( = ?auto_50792 ?auto_50794 ) ) ( not ( = ?auto_50792 ?auto_50795 ) ) ( not ( = ?auto_50792 ?auto_50796 ) ) ( not ( = ?auto_50793 ?auto_50794 ) ) ( not ( = ?auto_50793 ?auto_50795 ) ) ( not ( = ?auto_50793 ?auto_50796 ) ) ( not ( = ?auto_50794 ?auto_50795 ) ) ( not ( = ?auto_50794 ?auto_50796 ) ) ( not ( = ?auto_50795 ?auto_50796 ) ) ( ON ?auto_50794 ?auto_50795 ) ( ON ?auto_50793 ?auto_50794 ) ( ON ?auto_50792 ?auto_50793 ) ( ON ?auto_50791 ?auto_50792 ) ( ON ?auto_50790 ?auto_50791 ) ( CLEAR ?auto_50788 ) ( ON ?auto_50789 ?auto_50790 ) ( CLEAR ?auto_50789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50788 ?auto_50789 )
      ( MAKE-8PILE ?auto_50788 ?auto_50789 ?auto_50790 ?auto_50791 ?auto_50792 ?auto_50793 ?auto_50794 ?auto_50795 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50805 - BLOCK
      ?auto_50806 - BLOCK
      ?auto_50807 - BLOCK
      ?auto_50808 - BLOCK
      ?auto_50809 - BLOCK
      ?auto_50810 - BLOCK
      ?auto_50811 - BLOCK
      ?auto_50812 - BLOCK
    )
    :vars
    (
      ?auto_50813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50812 ?auto_50813 ) ( ON-TABLE ?auto_50805 ) ( not ( = ?auto_50805 ?auto_50806 ) ) ( not ( = ?auto_50805 ?auto_50807 ) ) ( not ( = ?auto_50805 ?auto_50808 ) ) ( not ( = ?auto_50805 ?auto_50809 ) ) ( not ( = ?auto_50805 ?auto_50810 ) ) ( not ( = ?auto_50805 ?auto_50811 ) ) ( not ( = ?auto_50805 ?auto_50812 ) ) ( not ( = ?auto_50805 ?auto_50813 ) ) ( not ( = ?auto_50806 ?auto_50807 ) ) ( not ( = ?auto_50806 ?auto_50808 ) ) ( not ( = ?auto_50806 ?auto_50809 ) ) ( not ( = ?auto_50806 ?auto_50810 ) ) ( not ( = ?auto_50806 ?auto_50811 ) ) ( not ( = ?auto_50806 ?auto_50812 ) ) ( not ( = ?auto_50806 ?auto_50813 ) ) ( not ( = ?auto_50807 ?auto_50808 ) ) ( not ( = ?auto_50807 ?auto_50809 ) ) ( not ( = ?auto_50807 ?auto_50810 ) ) ( not ( = ?auto_50807 ?auto_50811 ) ) ( not ( = ?auto_50807 ?auto_50812 ) ) ( not ( = ?auto_50807 ?auto_50813 ) ) ( not ( = ?auto_50808 ?auto_50809 ) ) ( not ( = ?auto_50808 ?auto_50810 ) ) ( not ( = ?auto_50808 ?auto_50811 ) ) ( not ( = ?auto_50808 ?auto_50812 ) ) ( not ( = ?auto_50808 ?auto_50813 ) ) ( not ( = ?auto_50809 ?auto_50810 ) ) ( not ( = ?auto_50809 ?auto_50811 ) ) ( not ( = ?auto_50809 ?auto_50812 ) ) ( not ( = ?auto_50809 ?auto_50813 ) ) ( not ( = ?auto_50810 ?auto_50811 ) ) ( not ( = ?auto_50810 ?auto_50812 ) ) ( not ( = ?auto_50810 ?auto_50813 ) ) ( not ( = ?auto_50811 ?auto_50812 ) ) ( not ( = ?auto_50811 ?auto_50813 ) ) ( not ( = ?auto_50812 ?auto_50813 ) ) ( ON ?auto_50811 ?auto_50812 ) ( ON ?auto_50810 ?auto_50811 ) ( ON ?auto_50809 ?auto_50810 ) ( ON ?auto_50808 ?auto_50809 ) ( ON ?auto_50807 ?auto_50808 ) ( CLEAR ?auto_50805 ) ( ON ?auto_50806 ?auto_50807 ) ( CLEAR ?auto_50806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50805 ?auto_50806 )
      ( MAKE-8PILE ?auto_50805 ?auto_50806 ?auto_50807 ?auto_50808 ?auto_50809 ?auto_50810 ?auto_50811 ?auto_50812 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50822 - BLOCK
      ?auto_50823 - BLOCK
      ?auto_50824 - BLOCK
      ?auto_50825 - BLOCK
      ?auto_50826 - BLOCK
      ?auto_50827 - BLOCK
      ?auto_50828 - BLOCK
      ?auto_50829 - BLOCK
    )
    :vars
    (
      ?auto_50830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50829 ?auto_50830 ) ( not ( = ?auto_50822 ?auto_50823 ) ) ( not ( = ?auto_50822 ?auto_50824 ) ) ( not ( = ?auto_50822 ?auto_50825 ) ) ( not ( = ?auto_50822 ?auto_50826 ) ) ( not ( = ?auto_50822 ?auto_50827 ) ) ( not ( = ?auto_50822 ?auto_50828 ) ) ( not ( = ?auto_50822 ?auto_50829 ) ) ( not ( = ?auto_50822 ?auto_50830 ) ) ( not ( = ?auto_50823 ?auto_50824 ) ) ( not ( = ?auto_50823 ?auto_50825 ) ) ( not ( = ?auto_50823 ?auto_50826 ) ) ( not ( = ?auto_50823 ?auto_50827 ) ) ( not ( = ?auto_50823 ?auto_50828 ) ) ( not ( = ?auto_50823 ?auto_50829 ) ) ( not ( = ?auto_50823 ?auto_50830 ) ) ( not ( = ?auto_50824 ?auto_50825 ) ) ( not ( = ?auto_50824 ?auto_50826 ) ) ( not ( = ?auto_50824 ?auto_50827 ) ) ( not ( = ?auto_50824 ?auto_50828 ) ) ( not ( = ?auto_50824 ?auto_50829 ) ) ( not ( = ?auto_50824 ?auto_50830 ) ) ( not ( = ?auto_50825 ?auto_50826 ) ) ( not ( = ?auto_50825 ?auto_50827 ) ) ( not ( = ?auto_50825 ?auto_50828 ) ) ( not ( = ?auto_50825 ?auto_50829 ) ) ( not ( = ?auto_50825 ?auto_50830 ) ) ( not ( = ?auto_50826 ?auto_50827 ) ) ( not ( = ?auto_50826 ?auto_50828 ) ) ( not ( = ?auto_50826 ?auto_50829 ) ) ( not ( = ?auto_50826 ?auto_50830 ) ) ( not ( = ?auto_50827 ?auto_50828 ) ) ( not ( = ?auto_50827 ?auto_50829 ) ) ( not ( = ?auto_50827 ?auto_50830 ) ) ( not ( = ?auto_50828 ?auto_50829 ) ) ( not ( = ?auto_50828 ?auto_50830 ) ) ( not ( = ?auto_50829 ?auto_50830 ) ) ( ON ?auto_50828 ?auto_50829 ) ( ON ?auto_50827 ?auto_50828 ) ( ON ?auto_50826 ?auto_50827 ) ( ON ?auto_50825 ?auto_50826 ) ( ON ?auto_50824 ?auto_50825 ) ( ON ?auto_50823 ?auto_50824 ) ( ON ?auto_50822 ?auto_50823 ) ( CLEAR ?auto_50822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50822 )
      ( MAKE-8PILE ?auto_50822 ?auto_50823 ?auto_50824 ?auto_50825 ?auto_50826 ?auto_50827 ?auto_50828 ?auto_50829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_50839 - BLOCK
      ?auto_50840 - BLOCK
      ?auto_50841 - BLOCK
      ?auto_50842 - BLOCK
      ?auto_50843 - BLOCK
      ?auto_50844 - BLOCK
      ?auto_50845 - BLOCK
      ?auto_50846 - BLOCK
    )
    :vars
    (
      ?auto_50847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50846 ?auto_50847 ) ( not ( = ?auto_50839 ?auto_50840 ) ) ( not ( = ?auto_50839 ?auto_50841 ) ) ( not ( = ?auto_50839 ?auto_50842 ) ) ( not ( = ?auto_50839 ?auto_50843 ) ) ( not ( = ?auto_50839 ?auto_50844 ) ) ( not ( = ?auto_50839 ?auto_50845 ) ) ( not ( = ?auto_50839 ?auto_50846 ) ) ( not ( = ?auto_50839 ?auto_50847 ) ) ( not ( = ?auto_50840 ?auto_50841 ) ) ( not ( = ?auto_50840 ?auto_50842 ) ) ( not ( = ?auto_50840 ?auto_50843 ) ) ( not ( = ?auto_50840 ?auto_50844 ) ) ( not ( = ?auto_50840 ?auto_50845 ) ) ( not ( = ?auto_50840 ?auto_50846 ) ) ( not ( = ?auto_50840 ?auto_50847 ) ) ( not ( = ?auto_50841 ?auto_50842 ) ) ( not ( = ?auto_50841 ?auto_50843 ) ) ( not ( = ?auto_50841 ?auto_50844 ) ) ( not ( = ?auto_50841 ?auto_50845 ) ) ( not ( = ?auto_50841 ?auto_50846 ) ) ( not ( = ?auto_50841 ?auto_50847 ) ) ( not ( = ?auto_50842 ?auto_50843 ) ) ( not ( = ?auto_50842 ?auto_50844 ) ) ( not ( = ?auto_50842 ?auto_50845 ) ) ( not ( = ?auto_50842 ?auto_50846 ) ) ( not ( = ?auto_50842 ?auto_50847 ) ) ( not ( = ?auto_50843 ?auto_50844 ) ) ( not ( = ?auto_50843 ?auto_50845 ) ) ( not ( = ?auto_50843 ?auto_50846 ) ) ( not ( = ?auto_50843 ?auto_50847 ) ) ( not ( = ?auto_50844 ?auto_50845 ) ) ( not ( = ?auto_50844 ?auto_50846 ) ) ( not ( = ?auto_50844 ?auto_50847 ) ) ( not ( = ?auto_50845 ?auto_50846 ) ) ( not ( = ?auto_50845 ?auto_50847 ) ) ( not ( = ?auto_50846 ?auto_50847 ) ) ( ON ?auto_50845 ?auto_50846 ) ( ON ?auto_50844 ?auto_50845 ) ( ON ?auto_50843 ?auto_50844 ) ( ON ?auto_50842 ?auto_50843 ) ( ON ?auto_50841 ?auto_50842 ) ( ON ?auto_50840 ?auto_50841 ) ( ON ?auto_50839 ?auto_50840 ) ( CLEAR ?auto_50839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50839 )
      ( MAKE-8PILE ?auto_50839 ?auto_50840 ?auto_50841 ?auto_50842 ?auto_50843 ?auto_50844 ?auto_50845 ?auto_50846 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50857 - BLOCK
      ?auto_50858 - BLOCK
      ?auto_50859 - BLOCK
      ?auto_50860 - BLOCK
      ?auto_50861 - BLOCK
      ?auto_50862 - BLOCK
      ?auto_50863 - BLOCK
      ?auto_50864 - BLOCK
      ?auto_50865 - BLOCK
    )
    :vars
    (
      ?auto_50866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50864 ) ( ON ?auto_50865 ?auto_50866 ) ( CLEAR ?auto_50865 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50857 ) ( ON ?auto_50858 ?auto_50857 ) ( ON ?auto_50859 ?auto_50858 ) ( ON ?auto_50860 ?auto_50859 ) ( ON ?auto_50861 ?auto_50860 ) ( ON ?auto_50862 ?auto_50861 ) ( ON ?auto_50863 ?auto_50862 ) ( ON ?auto_50864 ?auto_50863 ) ( not ( = ?auto_50857 ?auto_50858 ) ) ( not ( = ?auto_50857 ?auto_50859 ) ) ( not ( = ?auto_50857 ?auto_50860 ) ) ( not ( = ?auto_50857 ?auto_50861 ) ) ( not ( = ?auto_50857 ?auto_50862 ) ) ( not ( = ?auto_50857 ?auto_50863 ) ) ( not ( = ?auto_50857 ?auto_50864 ) ) ( not ( = ?auto_50857 ?auto_50865 ) ) ( not ( = ?auto_50857 ?auto_50866 ) ) ( not ( = ?auto_50858 ?auto_50859 ) ) ( not ( = ?auto_50858 ?auto_50860 ) ) ( not ( = ?auto_50858 ?auto_50861 ) ) ( not ( = ?auto_50858 ?auto_50862 ) ) ( not ( = ?auto_50858 ?auto_50863 ) ) ( not ( = ?auto_50858 ?auto_50864 ) ) ( not ( = ?auto_50858 ?auto_50865 ) ) ( not ( = ?auto_50858 ?auto_50866 ) ) ( not ( = ?auto_50859 ?auto_50860 ) ) ( not ( = ?auto_50859 ?auto_50861 ) ) ( not ( = ?auto_50859 ?auto_50862 ) ) ( not ( = ?auto_50859 ?auto_50863 ) ) ( not ( = ?auto_50859 ?auto_50864 ) ) ( not ( = ?auto_50859 ?auto_50865 ) ) ( not ( = ?auto_50859 ?auto_50866 ) ) ( not ( = ?auto_50860 ?auto_50861 ) ) ( not ( = ?auto_50860 ?auto_50862 ) ) ( not ( = ?auto_50860 ?auto_50863 ) ) ( not ( = ?auto_50860 ?auto_50864 ) ) ( not ( = ?auto_50860 ?auto_50865 ) ) ( not ( = ?auto_50860 ?auto_50866 ) ) ( not ( = ?auto_50861 ?auto_50862 ) ) ( not ( = ?auto_50861 ?auto_50863 ) ) ( not ( = ?auto_50861 ?auto_50864 ) ) ( not ( = ?auto_50861 ?auto_50865 ) ) ( not ( = ?auto_50861 ?auto_50866 ) ) ( not ( = ?auto_50862 ?auto_50863 ) ) ( not ( = ?auto_50862 ?auto_50864 ) ) ( not ( = ?auto_50862 ?auto_50865 ) ) ( not ( = ?auto_50862 ?auto_50866 ) ) ( not ( = ?auto_50863 ?auto_50864 ) ) ( not ( = ?auto_50863 ?auto_50865 ) ) ( not ( = ?auto_50863 ?auto_50866 ) ) ( not ( = ?auto_50864 ?auto_50865 ) ) ( not ( = ?auto_50864 ?auto_50866 ) ) ( not ( = ?auto_50865 ?auto_50866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50865 ?auto_50866 )
      ( !STACK ?auto_50865 ?auto_50864 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50876 - BLOCK
      ?auto_50877 - BLOCK
      ?auto_50878 - BLOCK
      ?auto_50879 - BLOCK
      ?auto_50880 - BLOCK
      ?auto_50881 - BLOCK
      ?auto_50882 - BLOCK
      ?auto_50883 - BLOCK
      ?auto_50884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50883 ) ( ON-TABLE ?auto_50884 ) ( CLEAR ?auto_50884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50876 ) ( ON ?auto_50877 ?auto_50876 ) ( ON ?auto_50878 ?auto_50877 ) ( ON ?auto_50879 ?auto_50878 ) ( ON ?auto_50880 ?auto_50879 ) ( ON ?auto_50881 ?auto_50880 ) ( ON ?auto_50882 ?auto_50881 ) ( ON ?auto_50883 ?auto_50882 ) ( not ( = ?auto_50876 ?auto_50877 ) ) ( not ( = ?auto_50876 ?auto_50878 ) ) ( not ( = ?auto_50876 ?auto_50879 ) ) ( not ( = ?auto_50876 ?auto_50880 ) ) ( not ( = ?auto_50876 ?auto_50881 ) ) ( not ( = ?auto_50876 ?auto_50882 ) ) ( not ( = ?auto_50876 ?auto_50883 ) ) ( not ( = ?auto_50876 ?auto_50884 ) ) ( not ( = ?auto_50877 ?auto_50878 ) ) ( not ( = ?auto_50877 ?auto_50879 ) ) ( not ( = ?auto_50877 ?auto_50880 ) ) ( not ( = ?auto_50877 ?auto_50881 ) ) ( not ( = ?auto_50877 ?auto_50882 ) ) ( not ( = ?auto_50877 ?auto_50883 ) ) ( not ( = ?auto_50877 ?auto_50884 ) ) ( not ( = ?auto_50878 ?auto_50879 ) ) ( not ( = ?auto_50878 ?auto_50880 ) ) ( not ( = ?auto_50878 ?auto_50881 ) ) ( not ( = ?auto_50878 ?auto_50882 ) ) ( not ( = ?auto_50878 ?auto_50883 ) ) ( not ( = ?auto_50878 ?auto_50884 ) ) ( not ( = ?auto_50879 ?auto_50880 ) ) ( not ( = ?auto_50879 ?auto_50881 ) ) ( not ( = ?auto_50879 ?auto_50882 ) ) ( not ( = ?auto_50879 ?auto_50883 ) ) ( not ( = ?auto_50879 ?auto_50884 ) ) ( not ( = ?auto_50880 ?auto_50881 ) ) ( not ( = ?auto_50880 ?auto_50882 ) ) ( not ( = ?auto_50880 ?auto_50883 ) ) ( not ( = ?auto_50880 ?auto_50884 ) ) ( not ( = ?auto_50881 ?auto_50882 ) ) ( not ( = ?auto_50881 ?auto_50883 ) ) ( not ( = ?auto_50881 ?auto_50884 ) ) ( not ( = ?auto_50882 ?auto_50883 ) ) ( not ( = ?auto_50882 ?auto_50884 ) ) ( not ( = ?auto_50883 ?auto_50884 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_50884 )
      ( !STACK ?auto_50884 ?auto_50883 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50894 - BLOCK
      ?auto_50895 - BLOCK
      ?auto_50896 - BLOCK
      ?auto_50897 - BLOCK
      ?auto_50898 - BLOCK
      ?auto_50899 - BLOCK
      ?auto_50900 - BLOCK
      ?auto_50901 - BLOCK
      ?auto_50902 - BLOCK
    )
    :vars
    (
      ?auto_50903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50902 ?auto_50903 ) ( ON-TABLE ?auto_50894 ) ( ON ?auto_50895 ?auto_50894 ) ( ON ?auto_50896 ?auto_50895 ) ( ON ?auto_50897 ?auto_50896 ) ( ON ?auto_50898 ?auto_50897 ) ( ON ?auto_50899 ?auto_50898 ) ( ON ?auto_50900 ?auto_50899 ) ( not ( = ?auto_50894 ?auto_50895 ) ) ( not ( = ?auto_50894 ?auto_50896 ) ) ( not ( = ?auto_50894 ?auto_50897 ) ) ( not ( = ?auto_50894 ?auto_50898 ) ) ( not ( = ?auto_50894 ?auto_50899 ) ) ( not ( = ?auto_50894 ?auto_50900 ) ) ( not ( = ?auto_50894 ?auto_50901 ) ) ( not ( = ?auto_50894 ?auto_50902 ) ) ( not ( = ?auto_50894 ?auto_50903 ) ) ( not ( = ?auto_50895 ?auto_50896 ) ) ( not ( = ?auto_50895 ?auto_50897 ) ) ( not ( = ?auto_50895 ?auto_50898 ) ) ( not ( = ?auto_50895 ?auto_50899 ) ) ( not ( = ?auto_50895 ?auto_50900 ) ) ( not ( = ?auto_50895 ?auto_50901 ) ) ( not ( = ?auto_50895 ?auto_50902 ) ) ( not ( = ?auto_50895 ?auto_50903 ) ) ( not ( = ?auto_50896 ?auto_50897 ) ) ( not ( = ?auto_50896 ?auto_50898 ) ) ( not ( = ?auto_50896 ?auto_50899 ) ) ( not ( = ?auto_50896 ?auto_50900 ) ) ( not ( = ?auto_50896 ?auto_50901 ) ) ( not ( = ?auto_50896 ?auto_50902 ) ) ( not ( = ?auto_50896 ?auto_50903 ) ) ( not ( = ?auto_50897 ?auto_50898 ) ) ( not ( = ?auto_50897 ?auto_50899 ) ) ( not ( = ?auto_50897 ?auto_50900 ) ) ( not ( = ?auto_50897 ?auto_50901 ) ) ( not ( = ?auto_50897 ?auto_50902 ) ) ( not ( = ?auto_50897 ?auto_50903 ) ) ( not ( = ?auto_50898 ?auto_50899 ) ) ( not ( = ?auto_50898 ?auto_50900 ) ) ( not ( = ?auto_50898 ?auto_50901 ) ) ( not ( = ?auto_50898 ?auto_50902 ) ) ( not ( = ?auto_50898 ?auto_50903 ) ) ( not ( = ?auto_50899 ?auto_50900 ) ) ( not ( = ?auto_50899 ?auto_50901 ) ) ( not ( = ?auto_50899 ?auto_50902 ) ) ( not ( = ?auto_50899 ?auto_50903 ) ) ( not ( = ?auto_50900 ?auto_50901 ) ) ( not ( = ?auto_50900 ?auto_50902 ) ) ( not ( = ?auto_50900 ?auto_50903 ) ) ( not ( = ?auto_50901 ?auto_50902 ) ) ( not ( = ?auto_50901 ?auto_50903 ) ) ( not ( = ?auto_50902 ?auto_50903 ) ) ( CLEAR ?auto_50900 ) ( ON ?auto_50901 ?auto_50902 ) ( CLEAR ?auto_50901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_50894 ?auto_50895 ?auto_50896 ?auto_50897 ?auto_50898 ?auto_50899 ?auto_50900 ?auto_50901 )
      ( MAKE-9PILE ?auto_50894 ?auto_50895 ?auto_50896 ?auto_50897 ?auto_50898 ?auto_50899 ?auto_50900 ?auto_50901 ?auto_50902 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50913 - BLOCK
      ?auto_50914 - BLOCK
      ?auto_50915 - BLOCK
      ?auto_50916 - BLOCK
      ?auto_50917 - BLOCK
      ?auto_50918 - BLOCK
      ?auto_50919 - BLOCK
      ?auto_50920 - BLOCK
      ?auto_50921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50921 ) ( ON-TABLE ?auto_50913 ) ( ON ?auto_50914 ?auto_50913 ) ( ON ?auto_50915 ?auto_50914 ) ( ON ?auto_50916 ?auto_50915 ) ( ON ?auto_50917 ?auto_50916 ) ( ON ?auto_50918 ?auto_50917 ) ( ON ?auto_50919 ?auto_50918 ) ( not ( = ?auto_50913 ?auto_50914 ) ) ( not ( = ?auto_50913 ?auto_50915 ) ) ( not ( = ?auto_50913 ?auto_50916 ) ) ( not ( = ?auto_50913 ?auto_50917 ) ) ( not ( = ?auto_50913 ?auto_50918 ) ) ( not ( = ?auto_50913 ?auto_50919 ) ) ( not ( = ?auto_50913 ?auto_50920 ) ) ( not ( = ?auto_50913 ?auto_50921 ) ) ( not ( = ?auto_50914 ?auto_50915 ) ) ( not ( = ?auto_50914 ?auto_50916 ) ) ( not ( = ?auto_50914 ?auto_50917 ) ) ( not ( = ?auto_50914 ?auto_50918 ) ) ( not ( = ?auto_50914 ?auto_50919 ) ) ( not ( = ?auto_50914 ?auto_50920 ) ) ( not ( = ?auto_50914 ?auto_50921 ) ) ( not ( = ?auto_50915 ?auto_50916 ) ) ( not ( = ?auto_50915 ?auto_50917 ) ) ( not ( = ?auto_50915 ?auto_50918 ) ) ( not ( = ?auto_50915 ?auto_50919 ) ) ( not ( = ?auto_50915 ?auto_50920 ) ) ( not ( = ?auto_50915 ?auto_50921 ) ) ( not ( = ?auto_50916 ?auto_50917 ) ) ( not ( = ?auto_50916 ?auto_50918 ) ) ( not ( = ?auto_50916 ?auto_50919 ) ) ( not ( = ?auto_50916 ?auto_50920 ) ) ( not ( = ?auto_50916 ?auto_50921 ) ) ( not ( = ?auto_50917 ?auto_50918 ) ) ( not ( = ?auto_50917 ?auto_50919 ) ) ( not ( = ?auto_50917 ?auto_50920 ) ) ( not ( = ?auto_50917 ?auto_50921 ) ) ( not ( = ?auto_50918 ?auto_50919 ) ) ( not ( = ?auto_50918 ?auto_50920 ) ) ( not ( = ?auto_50918 ?auto_50921 ) ) ( not ( = ?auto_50919 ?auto_50920 ) ) ( not ( = ?auto_50919 ?auto_50921 ) ) ( not ( = ?auto_50920 ?auto_50921 ) ) ( CLEAR ?auto_50919 ) ( ON ?auto_50920 ?auto_50921 ) ( CLEAR ?auto_50920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_50913 ?auto_50914 ?auto_50915 ?auto_50916 ?auto_50917 ?auto_50918 ?auto_50919 ?auto_50920 )
      ( MAKE-9PILE ?auto_50913 ?auto_50914 ?auto_50915 ?auto_50916 ?auto_50917 ?auto_50918 ?auto_50919 ?auto_50920 ?auto_50921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50931 - BLOCK
      ?auto_50932 - BLOCK
      ?auto_50933 - BLOCK
      ?auto_50934 - BLOCK
      ?auto_50935 - BLOCK
      ?auto_50936 - BLOCK
      ?auto_50937 - BLOCK
      ?auto_50938 - BLOCK
      ?auto_50939 - BLOCK
    )
    :vars
    (
      ?auto_50940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50939 ?auto_50940 ) ( ON-TABLE ?auto_50931 ) ( ON ?auto_50932 ?auto_50931 ) ( ON ?auto_50933 ?auto_50932 ) ( ON ?auto_50934 ?auto_50933 ) ( ON ?auto_50935 ?auto_50934 ) ( ON ?auto_50936 ?auto_50935 ) ( not ( = ?auto_50931 ?auto_50932 ) ) ( not ( = ?auto_50931 ?auto_50933 ) ) ( not ( = ?auto_50931 ?auto_50934 ) ) ( not ( = ?auto_50931 ?auto_50935 ) ) ( not ( = ?auto_50931 ?auto_50936 ) ) ( not ( = ?auto_50931 ?auto_50937 ) ) ( not ( = ?auto_50931 ?auto_50938 ) ) ( not ( = ?auto_50931 ?auto_50939 ) ) ( not ( = ?auto_50931 ?auto_50940 ) ) ( not ( = ?auto_50932 ?auto_50933 ) ) ( not ( = ?auto_50932 ?auto_50934 ) ) ( not ( = ?auto_50932 ?auto_50935 ) ) ( not ( = ?auto_50932 ?auto_50936 ) ) ( not ( = ?auto_50932 ?auto_50937 ) ) ( not ( = ?auto_50932 ?auto_50938 ) ) ( not ( = ?auto_50932 ?auto_50939 ) ) ( not ( = ?auto_50932 ?auto_50940 ) ) ( not ( = ?auto_50933 ?auto_50934 ) ) ( not ( = ?auto_50933 ?auto_50935 ) ) ( not ( = ?auto_50933 ?auto_50936 ) ) ( not ( = ?auto_50933 ?auto_50937 ) ) ( not ( = ?auto_50933 ?auto_50938 ) ) ( not ( = ?auto_50933 ?auto_50939 ) ) ( not ( = ?auto_50933 ?auto_50940 ) ) ( not ( = ?auto_50934 ?auto_50935 ) ) ( not ( = ?auto_50934 ?auto_50936 ) ) ( not ( = ?auto_50934 ?auto_50937 ) ) ( not ( = ?auto_50934 ?auto_50938 ) ) ( not ( = ?auto_50934 ?auto_50939 ) ) ( not ( = ?auto_50934 ?auto_50940 ) ) ( not ( = ?auto_50935 ?auto_50936 ) ) ( not ( = ?auto_50935 ?auto_50937 ) ) ( not ( = ?auto_50935 ?auto_50938 ) ) ( not ( = ?auto_50935 ?auto_50939 ) ) ( not ( = ?auto_50935 ?auto_50940 ) ) ( not ( = ?auto_50936 ?auto_50937 ) ) ( not ( = ?auto_50936 ?auto_50938 ) ) ( not ( = ?auto_50936 ?auto_50939 ) ) ( not ( = ?auto_50936 ?auto_50940 ) ) ( not ( = ?auto_50937 ?auto_50938 ) ) ( not ( = ?auto_50937 ?auto_50939 ) ) ( not ( = ?auto_50937 ?auto_50940 ) ) ( not ( = ?auto_50938 ?auto_50939 ) ) ( not ( = ?auto_50938 ?auto_50940 ) ) ( not ( = ?auto_50939 ?auto_50940 ) ) ( ON ?auto_50938 ?auto_50939 ) ( CLEAR ?auto_50936 ) ( ON ?auto_50937 ?auto_50938 ) ( CLEAR ?auto_50937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_50931 ?auto_50932 ?auto_50933 ?auto_50934 ?auto_50935 ?auto_50936 ?auto_50937 )
      ( MAKE-9PILE ?auto_50931 ?auto_50932 ?auto_50933 ?auto_50934 ?auto_50935 ?auto_50936 ?auto_50937 ?auto_50938 ?auto_50939 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50950 - BLOCK
      ?auto_50951 - BLOCK
      ?auto_50952 - BLOCK
      ?auto_50953 - BLOCK
      ?auto_50954 - BLOCK
      ?auto_50955 - BLOCK
      ?auto_50956 - BLOCK
      ?auto_50957 - BLOCK
      ?auto_50958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50958 ) ( ON-TABLE ?auto_50950 ) ( ON ?auto_50951 ?auto_50950 ) ( ON ?auto_50952 ?auto_50951 ) ( ON ?auto_50953 ?auto_50952 ) ( ON ?auto_50954 ?auto_50953 ) ( ON ?auto_50955 ?auto_50954 ) ( not ( = ?auto_50950 ?auto_50951 ) ) ( not ( = ?auto_50950 ?auto_50952 ) ) ( not ( = ?auto_50950 ?auto_50953 ) ) ( not ( = ?auto_50950 ?auto_50954 ) ) ( not ( = ?auto_50950 ?auto_50955 ) ) ( not ( = ?auto_50950 ?auto_50956 ) ) ( not ( = ?auto_50950 ?auto_50957 ) ) ( not ( = ?auto_50950 ?auto_50958 ) ) ( not ( = ?auto_50951 ?auto_50952 ) ) ( not ( = ?auto_50951 ?auto_50953 ) ) ( not ( = ?auto_50951 ?auto_50954 ) ) ( not ( = ?auto_50951 ?auto_50955 ) ) ( not ( = ?auto_50951 ?auto_50956 ) ) ( not ( = ?auto_50951 ?auto_50957 ) ) ( not ( = ?auto_50951 ?auto_50958 ) ) ( not ( = ?auto_50952 ?auto_50953 ) ) ( not ( = ?auto_50952 ?auto_50954 ) ) ( not ( = ?auto_50952 ?auto_50955 ) ) ( not ( = ?auto_50952 ?auto_50956 ) ) ( not ( = ?auto_50952 ?auto_50957 ) ) ( not ( = ?auto_50952 ?auto_50958 ) ) ( not ( = ?auto_50953 ?auto_50954 ) ) ( not ( = ?auto_50953 ?auto_50955 ) ) ( not ( = ?auto_50953 ?auto_50956 ) ) ( not ( = ?auto_50953 ?auto_50957 ) ) ( not ( = ?auto_50953 ?auto_50958 ) ) ( not ( = ?auto_50954 ?auto_50955 ) ) ( not ( = ?auto_50954 ?auto_50956 ) ) ( not ( = ?auto_50954 ?auto_50957 ) ) ( not ( = ?auto_50954 ?auto_50958 ) ) ( not ( = ?auto_50955 ?auto_50956 ) ) ( not ( = ?auto_50955 ?auto_50957 ) ) ( not ( = ?auto_50955 ?auto_50958 ) ) ( not ( = ?auto_50956 ?auto_50957 ) ) ( not ( = ?auto_50956 ?auto_50958 ) ) ( not ( = ?auto_50957 ?auto_50958 ) ) ( ON ?auto_50957 ?auto_50958 ) ( CLEAR ?auto_50955 ) ( ON ?auto_50956 ?auto_50957 ) ( CLEAR ?auto_50956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_50950 ?auto_50951 ?auto_50952 ?auto_50953 ?auto_50954 ?auto_50955 ?auto_50956 )
      ( MAKE-9PILE ?auto_50950 ?auto_50951 ?auto_50952 ?auto_50953 ?auto_50954 ?auto_50955 ?auto_50956 ?auto_50957 ?auto_50958 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50968 - BLOCK
      ?auto_50969 - BLOCK
      ?auto_50970 - BLOCK
      ?auto_50971 - BLOCK
      ?auto_50972 - BLOCK
      ?auto_50973 - BLOCK
      ?auto_50974 - BLOCK
      ?auto_50975 - BLOCK
      ?auto_50976 - BLOCK
    )
    :vars
    (
      ?auto_50977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50976 ?auto_50977 ) ( ON-TABLE ?auto_50968 ) ( ON ?auto_50969 ?auto_50968 ) ( ON ?auto_50970 ?auto_50969 ) ( ON ?auto_50971 ?auto_50970 ) ( ON ?auto_50972 ?auto_50971 ) ( not ( = ?auto_50968 ?auto_50969 ) ) ( not ( = ?auto_50968 ?auto_50970 ) ) ( not ( = ?auto_50968 ?auto_50971 ) ) ( not ( = ?auto_50968 ?auto_50972 ) ) ( not ( = ?auto_50968 ?auto_50973 ) ) ( not ( = ?auto_50968 ?auto_50974 ) ) ( not ( = ?auto_50968 ?auto_50975 ) ) ( not ( = ?auto_50968 ?auto_50976 ) ) ( not ( = ?auto_50968 ?auto_50977 ) ) ( not ( = ?auto_50969 ?auto_50970 ) ) ( not ( = ?auto_50969 ?auto_50971 ) ) ( not ( = ?auto_50969 ?auto_50972 ) ) ( not ( = ?auto_50969 ?auto_50973 ) ) ( not ( = ?auto_50969 ?auto_50974 ) ) ( not ( = ?auto_50969 ?auto_50975 ) ) ( not ( = ?auto_50969 ?auto_50976 ) ) ( not ( = ?auto_50969 ?auto_50977 ) ) ( not ( = ?auto_50970 ?auto_50971 ) ) ( not ( = ?auto_50970 ?auto_50972 ) ) ( not ( = ?auto_50970 ?auto_50973 ) ) ( not ( = ?auto_50970 ?auto_50974 ) ) ( not ( = ?auto_50970 ?auto_50975 ) ) ( not ( = ?auto_50970 ?auto_50976 ) ) ( not ( = ?auto_50970 ?auto_50977 ) ) ( not ( = ?auto_50971 ?auto_50972 ) ) ( not ( = ?auto_50971 ?auto_50973 ) ) ( not ( = ?auto_50971 ?auto_50974 ) ) ( not ( = ?auto_50971 ?auto_50975 ) ) ( not ( = ?auto_50971 ?auto_50976 ) ) ( not ( = ?auto_50971 ?auto_50977 ) ) ( not ( = ?auto_50972 ?auto_50973 ) ) ( not ( = ?auto_50972 ?auto_50974 ) ) ( not ( = ?auto_50972 ?auto_50975 ) ) ( not ( = ?auto_50972 ?auto_50976 ) ) ( not ( = ?auto_50972 ?auto_50977 ) ) ( not ( = ?auto_50973 ?auto_50974 ) ) ( not ( = ?auto_50973 ?auto_50975 ) ) ( not ( = ?auto_50973 ?auto_50976 ) ) ( not ( = ?auto_50973 ?auto_50977 ) ) ( not ( = ?auto_50974 ?auto_50975 ) ) ( not ( = ?auto_50974 ?auto_50976 ) ) ( not ( = ?auto_50974 ?auto_50977 ) ) ( not ( = ?auto_50975 ?auto_50976 ) ) ( not ( = ?auto_50975 ?auto_50977 ) ) ( not ( = ?auto_50976 ?auto_50977 ) ) ( ON ?auto_50975 ?auto_50976 ) ( ON ?auto_50974 ?auto_50975 ) ( CLEAR ?auto_50972 ) ( ON ?auto_50973 ?auto_50974 ) ( CLEAR ?auto_50973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50968 ?auto_50969 ?auto_50970 ?auto_50971 ?auto_50972 ?auto_50973 )
      ( MAKE-9PILE ?auto_50968 ?auto_50969 ?auto_50970 ?auto_50971 ?auto_50972 ?auto_50973 ?auto_50974 ?auto_50975 ?auto_50976 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_50987 - BLOCK
      ?auto_50988 - BLOCK
      ?auto_50989 - BLOCK
      ?auto_50990 - BLOCK
      ?auto_50991 - BLOCK
      ?auto_50992 - BLOCK
      ?auto_50993 - BLOCK
      ?auto_50994 - BLOCK
      ?auto_50995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50995 ) ( ON-TABLE ?auto_50987 ) ( ON ?auto_50988 ?auto_50987 ) ( ON ?auto_50989 ?auto_50988 ) ( ON ?auto_50990 ?auto_50989 ) ( ON ?auto_50991 ?auto_50990 ) ( not ( = ?auto_50987 ?auto_50988 ) ) ( not ( = ?auto_50987 ?auto_50989 ) ) ( not ( = ?auto_50987 ?auto_50990 ) ) ( not ( = ?auto_50987 ?auto_50991 ) ) ( not ( = ?auto_50987 ?auto_50992 ) ) ( not ( = ?auto_50987 ?auto_50993 ) ) ( not ( = ?auto_50987 ?auto_50994 ) ) ( not ( = ?auto_50987 ?auto_50995 ) ) ( not ( = ?auto_50988 ?auto_50989 ) ) ( not ( = ?auto_50988 ?auto_50990 ) ) ( not ( = ?auto_50988 ?auto_50991 ) ) ( not ( = ?auto_50988 ?auto_50992 ) ) ( not ( = ?auto_50988 ?auto_50993 ) ) ( not ( = ?auto_50988 ?auto_50994 ) ) ( not ( = ?auto_50988 ?auto_50995 ) ) ( not ( = ?auto_50989 ?auto_50990 ) ) ( not ( = ?auto_50989 ?auto_50991 ) ) ( not ( = ?auto_50989 ?auto_50992 ) ) ( not ( = ?auto_50989 ?auto_50993 ) ) ( not ( = ?auto_50989 ?auto_50994 ) ) ( not ( = ?auto_50989 ?auto_50995 ) ) ( not ( = ?auto_50990 ?auto_50991 ) ) ( not ( = ?auto_50990 ?auto_50992 ) ) ( not ( = ?auto_50990 ?auto_50993 ) ) ( not ( = ?auto_50990 ?auto_50994 ) ) ( not ( = ?auto_50990 ?auto_50995 ) ) ( not ( = ?auto_50991 ?auto_50992 ) ) ( not ( = ?auto_50991 ?auto_50993 ) ) ( not ( = ?auto_50991 ?auto_50994 ) ) ( not ( = ?auto_50991 ?auto_50995 ) ) ( not ( = ?auto_50992 ?auto_50993 ) ) ( not ( = ?auto_50992 ?auto_50994 ) ) ( not ( = ?auto_50992 ?auto_50995 ) ) ( not ( = ?auto_50993 ?auto_50994 ) ) ( not ( = ?auto_50993 ?auto_50995 ) ) ( not ( = ?auto_50994 ?auto_50995 ) ) ( ON ?auto_50994 ?auto_50995 ) ( ON ?auto_50993 ?auto_50994 ) ( CLEAR ?auto_50991 ) ( ON ?auto_50992 ?auto_50993 ) ( CLEAR ?auto_50992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50987 ?auto_50988 ?auto_50989 ?auto_50990 ?auto_50991 ?auto_50992 )
      ( MAKE-9PILE ?auto_50987 ?auto_50988 ?auto_50989 ?auto_50990 ?auto_50991 ?auto_50992 ?auto_50993 ?auto_50994 ?auto_50995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51005 - BLOCK
      ?auto_51006 - BLOCK
      ?auto_51007 - BLOCK
      ?auto_51008 - BLOCK
      ?auto_51009 - BLOCK
      ?auto_51010 - BLOCK
      ?auto_51011 - BLOCK
      ?auto_51012 - BLOCK
      ?auto_51013 - BLOCK
    )
    :vars
    (
      ?auto_51014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51013 ?auto_51014 ) ( ON-TABLE ?auto_51005 ) ( ON ?auto_51006 ?auto_51005 ) ( ON ?auto_51007 ?auto_51006 ) ( ON ?auto_51008 ?auto_51007 ) ( not ( = ?auto_51005 ?auto_51006 ) ) ( not ( = ?auto_51005 ?auto_51007 ) ) ( not ( = ?auto_51005 ?auto_51008 ) ) ( not ( = ?auto_51005 ?auto_51009 ) ) ( not ( = ?auto_51005 ?auto_51010 ) ) ( not ( = ?auto_51005 ?auto_51011 ) ) ( not ( = ?auto_51005 ?auto_51012 ) ) ( not ( = ?auto_51005 ?auto_51013 ) ) ( not ( = ?auto_51005 ?auto_51014 ) ) ( not ( = ?auto_51006 ?auto_51007 ) ) ( not ( = ?auto_51006 ?auto_51008 ) ) ( not ( = ?auto_51006 ?auto_51009 ) ) ( not ( = ?auto_51006 ?auto_51010 ) ) ( not ( = ?auto_51006 ?auto_51011 ) ) ( not ( = ?auto_51006 ?auto_51012 ) ) ( not ( = ?auto_51006 ?auto_51013 ) ) ( not ( = ?auto_51006 ?auto_51014 ) ) ( not ( = ?auto_51007 ?auto_51008 ) ) ( not ( = ?auto_51007 ?auto_51009 ) ) ( not ( = ?auto_51007 ?auto_51010 ) ) ( not ( = ?auto_51007 ?auto_51011 ) ) ( not ( = ?auto_51007 ?auto_51012 ) ) ( not ( = ?auto_51007 ?auto_51013 ) ) ( not ( = ?auto_51007 ?auto_51014 ) ) ( not ( = ?auto_51008 ?auto_51009 ) ) ( not ( = ?auto_51008 ?auto_51010 ) ) ( not ( = ?auto_51008 ?auto_51011 ) ) ( not ( = ?auto_51008 ?auto_51012 ) ) ( not ( = ?auto_51008 ?auto_51013 ) ) ( not ( = ?auto_51008 ?auto_51014 ) ) ( not ( = ?auto_51009 ?auto_51010 ) ) ( not ( = ?auto_51009 ?auto_51011 ) ) ( not ( = ?auto_51009 ?auto_51012 ) ) ( not ( = ?auto_51009 ?auto_51013 ) ) ( not ( = ?auto_51009 ?auto_51014 ) ) ( not ( = ?auto_51010 ?auto_51011 ) ) ( not ( = ?auto_51010 ?auto_51012 ) ) ( not ( = ?auto_51010 ?auto_51013 ) ) ( not ( = ?auto_51010 ?auto_51014 ) ) ( not ( = ?auto_51011 ?auto_51012 ) ) ( not ( = ?auto_51011 ?auto_51013 ) ) ( not ( = ?auto_51011 ?auto_51014 ) ) ( not ( = ?auto_51012 ?auto_51013 ) ) ( not ( = ?auto_51012 ?auto_51014 ) ) ( not ( = ?auto_51013 ?auto_51014 ) ) ( ON ?auto_51012 ?auto_51013 ) ( ON ?auto_51011 ?auto_51012 ) ( ON ?auto_51010 ?auto_51011 ) ( CLEAR ?auto_51008 ) ( ON ?auto_51009 ?auto_51010 ) ( CLEAR ?auto_51009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51005 ?auto_51006 ?auto_51007 ?auto_51008 ?auto_51009 )
      ( MAKE-9PILE ?auto_51005 ?auto_51006 ?auto_51007 ?auto_51008 ?auto_51009 ?auto_51010 ?auto_51011 ?auto_51012 ?auto_51013 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51024 - BLOCK
      ?auto_51025 - BLOCK
      ?auto_51026 - BLOCK
      ?auto_51027 - BLOCK
      ?auto_51028 - BLOCK
      ?auto_51029 - BLOCK
      ?auto_51030 - BLOCK
      ?auto_51031 - BLOCK
      ?auto_51032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51032 ) ( ON-TABLE ?auto_51024 ) ( ON ?auto_51025 ?auto_51024 ) ( ON ?auto_51026 ?auto_51025 ) ( ON ?auto_51027 ?auto_51026 ) ( not ( = ?auto_51024 ?auto_51025 ) ) ( not ( = ?auto_51024 ?auto_51026 ) ) ( not ( = ?auto_51024 ?auto_51027 ) ) ( not ( = ?auto_51024 ?auto_51028 ) ) ( not ( = ?auto_51024 ?auto_51029 ) ) ( not ( = ?auto_51024 ?auto_51030 ) ) ( not ( = ?auto_51024 ?auto_51031 ) ) ( not ( = ?auto_51024 ?auto_51032 ) ) ( not ( = ?auto_51025 ?auto_51026 ) ) ( not ( = ?auto_51025 ?auto_51027 ) ) ( not ( = ?auto_51025 ?auto_51028 ) ) ( not ( = ?auto_51025 ?auto_51029 ) ) ( not ( = ?auto_51025 ?auto_51030 ) ) ( not ( = ?auto_51025 ?auto_51031 ) ) ( not ( = ?auto_51025 ?auto_51032 ) ) ( not ( = ?auto_51026 ?auto_51027 ) ) ( not ( = ?auto_51026 ?auto_51028 ) ) ( not ( = ?auto_51026 ?auto_51029 ) ) ( not ( = ?auto_51026 ?auto_51030 ) ) ( not ( = ?auto_51026 ?auto_51031 ) ) ( not ( = ?auto_51026 ?auto_51032 ) ) ( not ( = ?auto_51027 ?auto_51028 ) ) ( not ( = ?auto_51027 ?auto_51029 ) ) ( not ( = ?auto_51027 ?auto_51030 ) ) ( not ( = ?auto_51027 ?auto_51031 ) ) ( not ( = ?auto_51027 ?auto_51032 ) ) ( not ( = ?auto_51028 ?auto_51029 ) ) ( not ( = ?auto_51028 ?auto_51030 ) ) ( not ( = ?auto_51028 ?auto_51031 ) ) ( not ( = ?auto_51028 ?auto_51032 ) ) ( not ( = ?auto_51029 ?auto_51030 ) ) ( not ( = ?auto_51029 ?auto_51031 ) ) ( not ( = ?auto_51029 ?auto_51032 ) ) ( not ( = ?auto_51030 ?auto_51031 ) ) ( not ( = ?auto_51030 ?auto_51032 ) ) ( not ( = ?auto_51031 ?auto_51032 ) ) ( ON ?auto_51031 ?auto_51032 ) ( ON ?auto_51030 ?auto_51031 ) ( ON ?auto_51029 ?auto_51030 ) ( CLEAR ?auto_51027 ) ( ON ?auto_51028 ?auto_51029 ) ( CLEAR ?auto_51028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51024 ?auto_51025 ?auto_51026 ?auto_51027 ?auto_51028 )
      ( MAKE-9PILE ?auto_51024 ?auto_51025 ?auto_51026 ?auto_51027 ?auto_51028 ?auto_51029 ?auto_51030 ?auto_51031 ?auto_51032 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51042 - BLOCK
      ?auto_51043 - BLOCK
      ?auto_51044 - BLOCK
      ?auto_51045 - BLOCK
      ?auto_51046 - BLOCK
      ?auto_51047 - BLOCK
      ?auto_51048 - BLOCK
      ?auto_51049 - BLOCK
      ?auto_51050 - BLOCK
    )
    :vars
    (
      ?auto_51051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51050 ?auto_51051 ) ( ON-TABLE ?auto_51042 ) ( ON ?auto_51043 ?auto_51042 ) ( ON ?auto_51044 ?auto_51043 ) ( not ( = ?auto_51042 ?auto_51043 ) ) ( not ( = ?auto_51042 ?auto_51044 ) ) ( not ( = ?auto_51042 ?auto_51045 ) ) ( not ( = ?auto_51042 ?auto_51046 ) ) ( not ( = ?auto_51042 ?auto_51047 ) ) ( not ( = ?auto_51042 ?auto_51048 ) ) ( not ( = ?auto_51042 ?auto_51049 ) ) ( not ( = ?auto_51042 ?auto_51050 ) ) ( not ( = ?auto_51042 ?auto_51051 ) ) ( not ( = ?auto_51043 ?auto_51044 ) ) ( not ( = ?auto_51043 ?auto_51045 ) ) ( not ( = ?auto_51043 ?auto_51046 ) ) ( not ( = ?auto_51043 ?auto_51047 ) ) ( not ( = ?auto_51043 ?auto_51048 ) ) ( not ( = ?auto_51043 ?auto_51049 ) ) ( not ( = ?auto_51043 ?auto_51050 ) ) ( not ( = ?auto_51043 ?auto_51051 ) ) ( not ( = ?auto_51044 ?auto_51045 ) ) ( not ( = ?auto_51044 ?auto_51046 ) ) ( not ( = ?auto_51044 ?auto_51047 ) ) ( not ( = ?auto_51044 ?auto_51048 ) ) ( not ( = ?auto_51044 ?auto_51049 ) ) ( not ( = ?auto_51044 ?auto_51050 ) ) ( not ( = ?auto_51044 ?auto_51051 ) ) ( not ( = ?auto_51045 ?auto_51046 ) ) ( not ( = ?auto_51045 ?auto_51047 ) ) ( not ( = ?auto_51045 ?auto_51048 ) ) ( not ( = ?auto_51045 ?auto_51049 ) ) ( not ( = ?auto_51045 ?auto_51050 ) ) ( not ( = ?auto_51045 ?auto_51051 ) ) ( not ( = ?auto_51046 ?auto_51047 ) ) ( not ( = ?auto_51046 ?auto_51048 ) ) ( not ( = ?auto_51046 ?auto_51049 ) ) ( not ( = ?auto_51046 ?auto_51050 ) ) ( not ( = ?auto_51046 ?auto_51051 ) ) ( not ( = ?auto_51047 ?auto_51048 ) ) ( not ( = ?auto_51047 ?auto_51049 ) ) ( not ( = ?auto_51047 ?auto_51050 ) ) ( not ( = ?auto_51047 ?auto_51051 ) ) ( not ( = ?auto_51048 ?auto_51049 ) ) ( not ( = ?auto_51048 ?auto_51050 ) ) ( not ( = ?auto_51048 ?auto_51051 ) ) ( not ( = ?auto_51049 ?auto_51050 ) ) ( not ( = ?auto_51049 ?auto_51051 ) ) ( not ( = ?auto_51050 ?auto_51051 ) ) ( ON ?auto_51049 ?auto_51050 ) ( ON ?auto_51048 ?auto_51049 ) ( ON ?auto_51047 ?auto_51048 ) ( ON ?auto_51046 ?auto_51047 ) ( CLEAR ?auto_51044 ) ( ON ?auto_51045 ?auto_51046 ) ( CLEAR ?auto_51045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51042 ?auto_51043 ?auto_51044 ?auto_51045 )
      ( MAKE-9PILE ?auto_51042 ?auto_51043 ?auto_51044 ?auto_51045 ?auto_51046 ?auto_51047 ?auto_51048 ?auto_51049 ?auto_51050 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51061 - BLOCK
      ?auto_51062 - BLOCK
      ?auto_51063 - BLOCK
      ?auto_51064 - BLOCK
      ?auto_51065 - BLOCK
      ?auto_51066 - BLOCK
      ?auto_51067 - BLOCK
      ?auto_51068 - BLOCK
      ?auto_51069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51069 ) ( ON-TABLE ?auto_51061 ) ( ON ?auto_51062 ?auto_51061 ) ( ON ?auto_51063 ?auto_51062 ) ( not ( = ?auto_51061 ?auto_51062 ) ) ( not ( = ?auto_51061 ?auto_51063 ) ) ( not ( = ?auto_51061 ?auto_51064 ) ) ( not ( = ?auto_51061 ?auto_51065 ) ) ( not ( = ?auto_51061 ?auto_51066 ) ) ( not ( = ?auto_51061 ?auto_51067 ) ) ( not ( = ?auto_51061 ?auto_51068 ) ) ( not ( = ?auto_51061 ?auto_51069 ) ) ( not ( = ?auto_51062 ?auto_51063 ) ) ( not ( = ?auto_51062 ?auto_51064 ) ) ( not ( = ?auto_51062 ?auto_51065 ) ) ( not ( = ?auto_51062 ?auto_51066 ) ) ( not ( = ?auto_51062 ?auto_51067 ) ) ( not ( = ?auto_51062 ?auto_51068 ) ) ( not ( = ?auto_51062 ?auto_51069 ) ) ( not ( = ?auto_51063 ?auto_51064 ) ) ( not ( = ?auto_51063 ?auto_51065 ) ) ( not ( = ?auto_51063 ?auto_51066 ) ) ( not ( = ?auto_51063 ?auto_51067 ) ) ( not ( = ?auto_51063 ?auto_51068 ) ) ( not ( = ?auto_51063 ?auto_51069 ) ) ( not ( = ?auto_51064 ?auto_51065 ) ) ( not ( = ?auto_51064 ?auto_51066 ) ) ( not ( = ?auto_51064 ?auto_51067 ) ) ( not ( = ?auto_51064 ?auto_51068 ) ) ( not ( = ?auto_51064 ?auto_51069 ) ) ( not ( = ?auto_51065 ?auto_51066 ) ) ( not ( = ?auto_51065 ?auto_51067 ) ) ( not ( = ?auto_51065 ?auto_51068 ) ) ( not ( = ?auto_51065 ?auto_51069 ) ) ( not ( = ?auto_51066 ?auto_51067 ) ) ( not ( = ?auto_51066 ?auto_51068 ) ) ( not ( = ?auto_51066 ?auto_51069 ) ) ( not ( = ?auto_51067 ?auto_51068 ) ) ( not ( = ?auto_51067 ?auto_51069 ) ) ( not ( = ?auto_51068 ?auto_51069 ) ) ( ON ?auto_51068 ?auto_51069 ) ( ON ?auto_51067 ?auto_51068 ) ( ON ?auto_51066 ?auto_51067 ) ( ON ?auto_51065 ?auto_51066 ) ( CLEAR ?auto_51063 ) ( ON ?auto_51064 ?auto_51065 ) ( CLEAR ?auto_51064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51061 ?auto_51062 ?auto_51063 ?auto_51064 )
      ( MAKE-9PILE ?auto_51061 ?auto_51062 ?auto_51063 ?auto_51064 ?auto_51065 ?auto_51066 ?auto_51067 ?auto_51068 ?auto_51069 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51079 - BLOCK
      ?auto_51080 - BLOCK
      ?auto_51081 - BLOCK
      ?auto_51082 - BLOCK
      ?auto_51083 - BLOCK
      ?auto_51084 - BLOCK
      ?auto_51085 - BLOCK
      ?auto_51086 - BLOCK
      ?auto_51087 - BLOCK
    )
    :vars
    (
      ?auto_51088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51087 ?auto_51088 ) ( ON-TABLE ?auto_51079 ) ( ON ?auto_51080 ?auto_51079 ) ( not ( = ?auto_51079 ?auto_51080 ) ) ( not ( = ?auto_51079 ?auto_51081 ) ) ( not ( = ?auto_51079 ?auto_51082 ) ) ( not ( = ?auto_51079 ?auto_51083 ) ) ( not ( = ?auto_51079 ?auto_51084 ) ) ( not ( = ?auto_51079 ?auto_51085 ) ) ( not ( = ?auto_51079 ?auto_51086 ) ) ( not ( = ?auto_51079 ?auto_51087 ) ) ( not ( = ?auto_51079 ?auto_51088 ) ) ( not ( = ?auto_51080 ?auto_51081 ) ) ( not ( = ?auto_51080 ?auto_51082 ) ) ( not ( = ?auto_51080 ?auto_51083 ) ) ( not ( = ?auto_51080 ?auto_51084 ) ) ( not ( = ?auto_51080 ?auto_51085 ) ) ( not ( = ?auto_51080 ?auto_51086 ) ) ( not ( = ?auto_51080 ?auto_51087 ) ) ( not ( = ?auto_51080 ?auto_51088 ) ) ( not ( = ?auto_51081 ?auto_51082 ) ) ( not ( = ?auto_51081 ?auto_51083 ) ) ( not ( = ?auto_51081 ?auto_51084 ) ) ( not ( = ?auto_51081 ?auto_51085 ) ) ( not ( = ?auto_51081 ?auto_51086 ) ) ( not ( = ?auto_51081 ?auto_51087 ) ) ( not ( = ?auto_51081 ?auto_51088 ) ) ( not ( = ?auto_51082 ?auto_51083 ) ) ( not ( = ?auto_51082 ?auto_51084 ) ) ( not ( = ?auto_51082 ?auto_51085 ) ) ( not ( = ?auto_51082 ?auto_51086 ) ) ( not ( = ?auto_51082 ?auto_51087 ) ) ( not ( = ?auto_51082 ?auto_51088 ) ) ( not ( = ?auto_51083 ?auto_51084 ) ) ( not ( = ?auto_51083 ?auto_51085 ) ) ( not ( = ?auto_51083 ?auto_51086 ) ) ( not ( = ?auto_51083 ?auto_51087 ) ) ( not ( = ?auto_51083 ?auto_51088 ) ) ( not ( = ?auto_51084 ?auto_51085 ) ) ( not ( = ?auto_51084 ?auto_51086 ) ) ( not ( = ?auto_51084 ?auto_51087 ) ) ( not ( = ?auto_51084 ?auto_51088 ) ) ( not ( = ?auto_51085 ?auto_51086 ) ) ( not ( = ?auto_51085 ?auto_51087 ) ) ( not ( = ?auto_51085 ?auto_51088 ) ) ( not ( = ?auto_51086 ?auto_51087 ) ) ( not ( = ?auto_51086 ?auto_51088 ) ) ( not ( = ?auto_51087 ?auto_51088 ) ) ( ON ?auto_51086 ?auto_51087 ) ( ON ?auto_51085 ?auto_51086 ) ( ON ?auto_51084 ?auto_51085 ) ( ON ?auto_51083 ?auto_51084 ) ( ON ?auto_51082 ?auto_51083 ) ( CLEAR ?auto_51080 ) ( ON ?auto_51081 ?auto_51082 ) ( CLEAR ?auto_51081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51079 ?auto_51080 ?auto_51081 )
      ( MAKE-9PILE ?auto_51079 ?auto_51080 ?auto_51081 ?auto_51082 ?auto_51083 ?auto_51084 ?auto_51085 ?auto_51086 ?auto_51087 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51098 - BLOCK
      ?auto_51099 - BLOCK
      ?auto_51100 - BLOCK
      ?auto_51101 - BLOCK
      ?auto_51102 - BLOCK
      ?auto_51103 - BLOCK
      ?auto_51104 - BLOCK
      ?auto_51105 - BLOCK
      ?auto_51106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51106 ) ( ON-TABLE ?auto_51098 ) ( ON ?auto_51099 ?auto_51098 ) ( not ( = ?auto_51098 ?auto_51099 ) ) ( not ( = ?auto_51098 ?auto_51100 ) ) ( not ( = ?auto_51098 ?auto_51101 ) ) ( not ( = ?auto_51098 ?auto_51102 ) ) ( not ( = ?auto_51098 ?auto_51103 ) ) ( not ( = ?auto_51098 ?auto_51104 ) ) ( not ( = ?auto_51098 ?auto_51105 ) ) ( not ( = ?auto_51098 ?auto_51106 ) ) ( not ( = ?auto_51099 ?auto_51100 ) ) ( not ( = ?auto_51099 ?auto_51101 ) ) ( not ( = ?auto_51099 ?auto_51102 ) ) ( not ( = ?auto_51099 ?auto_51103 ) ) ( not ( = ?auto_51099 ?auto_51104 ) ) ( not ( = ?auto_51099 ?auto_51105 ) ) ( not ( = ?auto_51099 ?auto_51106 ) ) ( not ( = ?auto_51100 ?auto_51101 ) ) ( not ( = ?auto_51100 ?auto_51102 ) ) ( not ( = ?auto_51100 ?auto_51103 ) ) ( not ( = ?auto_51100 ?auto_51104 ) ) ( not ( = ?auto_51100 ?auto_51105 ) ) ( not ( = ?auto_51100 ?auto_51106 ) ) ( not ( = ?auto_51101 ?auto_51102 ) ) ( not ( = ?auto_51101 ?auto_51103 ) ) ( not ( = ?auto_51101 ?auto_51104 ) ) ( not ( = ?auto_51101 ?auto_51105 ) ) ( not ( = ?auto_51101 ?auto_51106 ) ) ( not ( = ?auto_51102 ?auto_51103 ) ) ( not ( = ?auto_51102 ?auto_51104 ) ) ( not ( = ?auto_51102 ?auto_51105 ) ) ( not ( = ?auto_51102 ?auto_51106 ) ) ( not ( = ?auto_51103 ?auto_51104 ) ) ( not ( = ?auto_51103 ?auto_51105 ) ) ( not ( = ?auto_51103 ?auto_51106 ) ) ( not ( = ?auto_51104 ?auto_51105 ) ) ( not ( = ?auto_51104 ?auto_51106 ) ) ( not ( = ?auto_51105 ?auto_51106 ) ) ( ON ?auto_51105 ?auto_51106 ) ( ON ?auto_51104 ?auto_51105 ) ( ON ?auto_51103 ?auto_51104 ) ( ON ?auto_51102 ?auto_51103 ) ( ON ?auto_51101 ?auto_51102 ) ( CLEAR ?auto_51099 ) ( ON ?auto_51100 ?auto_51101 ) ( CLEAR ?auto_51100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51098 ?auto_51099 ?auto_51100 )
      ( MAKE-9PILE ?auto_51098 ?auto_51099 ?auto_51100 ?auto_51101 ?auto_51102 ?auto_51103 ?auto_51104 ?auto_51105 ?auto_51106 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51116 - BLOCK
      ?auto_51117 - BLOCK
      ?auto_51118 - BLOCK
      ?auto_51119 - BLOCK
      ?auto_51120 - BLOCK
      ?auto_51121 - BLOCK
      ?auto_51122 - BLOCK
      ?auto_51123 - BLOCK
      ?auto_51124 - BLOCK
    )
    :vars
    (
      ?auto_51125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51124 ?auto_51125 ) ( ON-TABLE ?auto_51116 ) ( not ( = ?auto_51116 ?auto_51117 ) ) ( not ( = ?auto_51116 ?auto_51118 ) ) ( not ( = ?auto_51116 ?auto_51119 ) ) ( not ( = ?auto_51116 ?auto_51120 ) ) ( not ( = ?auto_51116 ?auto_51121 ) ) ( not ( = ?auto_51116 ?auto_51122 ) ) ( not ( = ?auto_51116 ?auto_51123 ) ) ( not ( = ?auto_51116 ?auto_51124 ) ) ( not ( = ?auto_51116 ?auto_51125 ) ) ( not ( = ?auto_51117 ?auto_51118 ) ) ( not ( = ?auto_51117 ?auto_51119 ) ) ( not ( = ?auto_51117 ?auto_51120 ) ) ( not ( = ?auto_51117 ?auto_51121 ) ) ( not ( = ?auto_51117 ?auto_51122 ) ) ( not ( = ?auto_51117 ?auto_51123 ) ) ( not ( = ?auto_51117 ?auto_51124 ) ) ( not ( = ?auto_51117 ?auto_51125 ) ) ( not ( = ?auto_51118 ?auto_51119 ) ) ( not ( = ?auto_51118 ?auto_51120 ) ) ( not ( = ?auto_51118 ?auto_51121 ) ) ( not ( = ?auto_51118 ?auto_51122 ) ) ( not ( = ?auto_51118 ?auto_51123 ) ) ( not ( = ?auto_51118 ?auto_51124 ) ) ( not ( = ?auto_51118 ?auto_51125 ) ) ( not ( = ?auto_51119 ?auto_51120 ) ) ( not ( = ?auto_51119 ?auto_51121 ) ) ( not ( = ?auto_51119 ?auto_51122 ) ) ( not ( = ?auto_51119 ?auto_51123 ) ) ( not ( = ?auto_51119 ?auto_51124 ) ) ( not ( = ?auto_51119 ?auto_51125 ) ) ( not ( = ?auto_51120 ?auto_51121 ) ) ( not ( = ?auto_51120 ?auto_51122 ) ) ( not ( = ?auto_51120 ?auto_51123 ) ) ( not ( = ?auto_51120 ?auto_51124 ) ) ( not ( = ?auto_51120 ?auto_51125 ) ) ( not ( = ?auto_51121 ?auto_51122 ) ) ( not ( = ?auto_51121 ?auto_51123 ) ) ( not ( = ?auto_51121 ?auto_51124 ) ) ( not ( = ?auto_51121 ?auto_51125 ) ) ( not ( = ?auto_51122 ?auto_51123 ) ) ( not ( = ?auto_51122 ?auto_51124 ) ) ( not ( = ?auto_51122 ?auto_51125 ) ) ( not ( = ?auto_51123 ?auto_51124 ) ) ( not ( = ?auto_51123 ?auto_51125 ) ) ( not ( = ?auto_51124 ?auto_51125 ) ) ( ON ?auto_51123 ?auto_51124 ) ( ON ?auto_51122 ?auto_51123 ) ( ON ?auto_51121 ?auto_51122 ) ( ON ?auto_51120 ?auto_51121 ) ( ON ?auto_51119 ?auto_51120 ) ( ON ?auto_51118 ?auto_51119 ) ( CLEAR ?auto_51116 ) ( ON ?auto_51117 ?auto_51118 ) ( CLEAR ?auto_51117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51116 ?auto_51117 )
      ( MAKE-9PILE ?auto_51116 ?auto_51117 ?auto_51118 ?auto_51119 ?auto_51120 ?auto_51121 ?auto_51122 ?auto_51123 ?auto_51124 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51135 - BLOCK
      ?auto_51136 - BLOCK
      ?auto_51137 - BLOCK
      ?auto_51138 - BLOCK
      ?auto_51139 - BLOCK
      ?auto_51140 - BLOCK
      ?auto_51141 - BLOCK
      ?auto_51142 - BLOCK
      ?auto_51143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51143 ) ( ON-TABLE ?auto_51135 ) ( not ( = ?auto_51135 ?auto_51136 ) ) ( not ( = ?auto_51135 ?auto_51137 ) ) ( not ( = ?auto_51135 ?auto_51138 ) ) ( not ( = ?auto_51135 ?auto_51139 ) ) ( not ( = ?auto_51135 ?auto_51140 ) ) ( not ( = ?auto_51135 ?auto_51141 ) ) ( not ( = ?auto_51135 ?auto_51142 ) ) ( not ( = ?auto_51135 ?auto_51143 ) ) ( not ( = ?auto_51136 ?auto_51137 ) ) ( not ( = ?auto_51136 ?auto_51138 ) ) ( not ( = ?auto_51136 ?auto_51139 ) ) ( not ( = ?auto_51136 ?auto_51140 ) ) ( not ( = ?auto_51136 ?auto_51141 ) ) ( not ( = ?auto_51136 ?auto_51142 ) ) ( not ( = ?auto_51136 ?auto_51143 ) ) ( not ( = ?auto_51137 ?auto_51138 ) ) ( not ( = ?auto_51137 ?auto_51139 ) ) ( not ( = ?auto_51137 ?auto_51140 ) ) ( not ( = ?auto_51137 ?auto_51141 ) ) ( not ( = ?auto_51137 ?auto_51142 ) ) ( not ( = ?auto_51137 ?auto_51143 ) ) ( not ( = ?auto_51138 ?auto_51139 ) ) ( not ( = ?auto_51138 ?auto_51140 ) ) ( not ( = ?auto_51138 ?auto_51141 ) ) ( not ( = ?auto_51138 ?auto_51142 ) ) ( not ( = ?auto_51138 ?auto_51143 ) ) ( not ( = ?auto_51139 ?auto_51140 ) ) ( not ( = ?auto_51139 ?auto_51141 ) ) ( not ( = ?auto_51139 ?auto_51142 ) ) ( not ( = ?auto_51139 ?auto_51143 ) ) ( not ( = ?auto_51140 ?auto_51141 ) ) ( not ( = ?auto_51140 ?auto_51142 ) ) ( not ( = ?auto_51140 ?auto_51143 ) ) ( not ( = ?auto_51141 ?auto_51142 ) ) ( not ( = ?auto_51141 ?auto_51143 ) ) ( not ( = ?auto_51142 ?auto_51143 ) ) ( ON ?auto_51142 ?auto_51143 ) ( ON ?auto_51141 ?auto_51142 ) ( ON ?auto_51140 ?auto_51141 ) ( ON ?auto_51139 ?auto_51140 ) ( ON ?auto_51138 ?auto_51139 ) ( ON ?auto_51137 ?auto_51138 ) ( CLEAR ?auto_51135 ) ( ON ?auto_51136 ?auto_51137 ) ( CLEAR ?auto_51136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51135 ?auto_51136 )
      ( MAKE-9PILE ?auto_51135 ?auto_51136 ?auto_51137 ?auto_51138 ?auto_51139 ?auto_51140 ?auto_51141 ?auto_51142 ?auto_51143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51153 - BLOCK
      ?auto_51154 - BLOCK
      ?auto_51155 - BLOCK
      ?auto_51156 - BLOCK
      ?auto_51157 - BLOCK
      ?auto_51158 - BLOCK
      ?auto_51159 - BLOCK
      ?auto_51160 - BLOCK
      ?auto_51161 - BLOCK
    )
    :vars
    (
      ?auto_51162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51161 ?auto_51162 ) ( not ( = ?auto_51153 ?auto_51154 ) ) ( not ( = ?auto_51153 ?auto_51155 ) ) ( not ( = ?auto_51153 ?auto_51156 ) ) ( not ( = ?auto_51153 ?auto_51157 ) ) ( not ( = ?auto_51153 ?auto_51158 ) ) ( not ( = ?auto_51153 ?auto_51159 ) ) ( not ( = ?auto_51153 ?auto_51160 ) ) ( not ( = ?auto_51153 ?auto_51161 ) ) ( not ( = ?auto_51153 ?auto_51162 ) ) ( not ( = ?auto_51154 ?auto_51155 ) ) ( not ( = ?auto_51154 ?auto_51156 ) ) ( not ( = ?auto_51154 ?auto_51157 ) ) ( not ( = ?auto_51154 ?auto_51158 ) ) ( not ( = ?auto_51154 ?auto_51159 ) ) ( not ( = ?auto_51154 ?auto_51160 ) ) ( not ( = ?auto_51154 ?auto_51161 ) ) ( not ( = ?auto_51154 ?auto_51162 ) ) ( not ( = ?auto_51155 ?auto_51156 ) ) ( not ( = ?auto_51155 ?auto_51157 ) ) ( not ( = ?auto_51155 ?auto_51158 ) ) ( not ( = ?auto_51155 ?auto_51159 ) ) ( not ( = ?auto_51155 ?auto_51160 ) ) ( not ( = ?auto_51155 ?auto_51161 ) ) ( not ( = ?auto_51155 ?auto_51162 ) ) ( not ( = ?auto_51156 ?auto_51157 ) ) ( not ( = ?auto_51156 ?auto_51158 ) ) ( not ( = ?auto_51156 ?auto_51159 ) ) ( not ( = ?auto_51156 ?auto_51160 ) ) ( not ( = ?auto_51156 ?auto_51161 ) ) ( not ( = ?auto_51156 ?auto_51162 ) ) ( not ( = ?auto_51157 ?auto_51158 ) ) ( not ( = ?auto_51157 ?auto_51159 ) ) ( not ( = ?auto_51157 ?auto_51160 ) ) ( not ( = ?auto_51157 ?auto_51161 ) ) ( not ( = ?auto_51157 ?auto_51162 ) ) ( not ( = ?auto_51158 ?auto_51159 ) ) ( not ( = ?auto_51158 ?auto_51160 ) ) ( not ( = ?auto_51158 ?auto_51161 ) ) ( not ( = ?auto_51158 ?auto_51162 ) ) ( not ( = ?auto_51159 ?auto_51160 ) ) ( not ( = ?auto_51159 ?auto_51161 ) ) ( not ( = ?auto_51159 ?auto_51162 ) ) ( not ( = ?auto_51160 ?auto_51161 ) ) ( not ( = ?auto_51160 ?auto_51162 ) ) ( not ( = ?auto_51161 ?auto_51162 ) ) ( ON ?auto_51160 ?auto_51161 ) ( ON ?auto_51159 ?auto_51160 ) ( ON ?auto_51158 ?auto_51159 ) ( ON ?auto_51157 ?auto_51158 ) ( ON ?auto_51156 ?auto_51157 ) ( ON ?auto_51155 ?auto_51156 ) ( ON ?auto_51154 ?auto_51155 ) ( ON ?auto_51153 ?auto_51154 ) ( CLEAR ?auto_51153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51153 )
      ( MAKE-9PILE ?auto_51153 ?auto_51154 ?auto_51155 ?auto_51156 ?auto_51157 ?auto_51158 ?auto_51159 ?auto_51160 ?auto_51161 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51172 - BLOCK
      ?auto_51173 - BLOCK
      ?auto_51174 - BLOCK
      ?auto_51175 - BLOCK
      ?auto_51176 - BLOCK
      ?auto_51177 - BLOCK
      ?auto_51178 - BLOCK
      ?auto_51179 - BLOCK
      ?auto_51180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51180 ) ( not ( = ?auto_51172 ?auto_51173 ) ) ( not ( = ?auto_51172 ?auto_51174 ) ) ( not ( = ?auto_51172 ?auto_51175 ) ) ( not ( = ?auto_51172 ?auto_51176 ) ) ( not ( = ?auto_51172 ?auto_51177 ) ) ( not ( = ?auto_51172 ?auto_51178 ) ) ( not ( = ?auto_51172 ?auto_51179 ) ) ( not ( = ?auto_51172 ?auto_51180 ) ) ( not ( = ?auto_51173 ?auto_51174 ) ) ( not ( = ?auto_51173 ?auto_51175 ) ) ( not ( = ?auto_51173 ?auto_51176 ) ) ( not ( = ?auto_51173 ?auto_51177 ) ) ( not ( = ?auto_51173 ?auto_51178 ) ) ( not ( = ?auto_51173 ?auto_51179 ) ) ( not ( = ?auto_51173 ?auto_51180 ) ) ( not ( = ?auto_51174 ?auto_51175 ) ) ( not ( = ?auto_51174 ?auto_51176 ) ) ( not ( = ?auto_51174 ?auto_51177 ) ) ( not ( = ?auto_51174 ?auto_51178 ) ) ( not ( = ?auto_51174 ?auto_51179 ) ) ( not ( = ?auto_51174 ?auto_51180 ) ) ( not ( = ?auto_51175 ?auto_51176 ) ) ( not ( = ?auto_51175 ?auto_51177 ) ) ( not ( = ?auto_51175 ?auto_51178 ) ) ( not ( = ?auto_51175 ?auto_51179 ) ) ( not ( = ?auto_51175 ?auto_51180 ) ) ( not ( = ?auto_51176 ?auto_51177 ) ) ( not ( = ?auto_51176 ?auto_51178 ) ) ( not ( = ?auto_51176 ?auto_51179 ) ) ( not ( = ?auto_51176 ?auto_51180 ) ) ( not ( = ?auto_51177 ?auto_51178 ) ) ( not ( = ?auto_51177 ?auto_51179 ) ) ( not ( = ?auto_51177 ?auto_51180 ) ) ( not ( = ?auto_51178 ?auto_51179 ) ) ( not ( = ?auto_51178 ?auto_51180 ) ) ( not ( = ?auto_51179 ?auto_51180 ) ) ( ON ?auto_51179 ?auto_51180 ) ( ON ?auto_51178 ?auto_51179 ) ( ON ?auto_51177 ?auto_51178 ) ( ON ?auto_51176 ?auto_51177 ) ( ON ?auto_51175 ?auto_51176 ) ( ON ?auto_51174 ?auto_51175 ) ( ON ?auto_51173 ?auto_51174 ) ( ON ?auto_51172 ?auto_51173 ) ( CLEAR ?auto_51172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51172 )
      ( MAKE-9PILE ?auto_51172 ?auto_51173 ?auto_51174 ?auto_51175 ?auto_51176 ?auto_51177 ?auto_51178 ?auto_51179 ?auto_51180 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_51190 - BLOCK
      ?auto_51191 - BLOCK
      ?auto_51192 - BLOCK
      ?auto_51193 - BLOCK
      ?auto_51194 - BLOCK
      ?auto_51195 - BLOCK
      ?auto_51196 - BLOCK
      ?auto_51197 - BLOCK
      ?auto_51198 - BLOCK
    )
    :vars
    (
      ?auto_51199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51190 ?auto_51191 ) ) ( not ( = ?auto_51190 ?auto_51192 ) ) ( not ( = ?auto_51190 ?auto_51193 ) ) ( not ( = ?auto_51190 ?auto_51194 ) ) ( not ( = ?auto_51190 ?auto_51195 ) ) ( not ( = ?auto_51190 ?auto_51196 ) ) ( not ( = ?auto_51190 ?auto_51197 ) ) ( not ( = ?auto_51190 ?auto_51198 ) ) ( not ( = ?auto_51191 ?auto_51192 ) ) ( not ( = ?auto_51191 ?auto_51193 ) ) ( not ( = ?auto_51191 ?auto_51194 ) ) ( not ( = ?auto_51191 ?auto_51195 ) ) ( not ( = ?auto_51191 ?auto_51196 ) ) ( not ( = ?auto_51191 ?auto_51197 ) ) ( not ( = ?auto_51191 ?auto_51198 ) ) ( not ( = ?auto_51192 ?auto_51193 ) ) ( not ( = ?auto_51192 ?auto_51194 ) ) ( not ( = ?auto_51192 ?auto_51195 ) ) ( not ( = ?auto_51192 ?auto_51196 ) ) ( not ( = ?auto_51192 ?auto_51197 ) ) ( not ( = ?auto_51192 ?auto_51198 ) ) ( not ( = ?auto_51193 ?auto_51194 ) ) ( not ( = ?auto_51193 ?auto_51195 ) ) ( not ( = ?auto_51193 ?auto_51196 ) ) ( not ( = ?auto_51193 ?auto_51197 ) ) ( not ( = ?auto_51193 ?auto_51198 ) ) ( not ( = ?auto_51194 ?auto_51195 ) ) ( not ( = ?auto_51194 ?auto_51196 ) ) ( not ( = ?auto_51194 ?auto_51197 ) ) ( not ( = ?auto_51194 ?auto_51198 ) ) ( not ( = ?auto_51195 ?auto_51196 ) ) ( not ( = ?auto_51195 ?auto_51197 ) ) ( not ( = ?auto_51195 ?auto_51198 ) ) ( not ( = ?auto_51196 ?auto_51197 ) ) ( not ( = ?auto_51196 ?auto_51198 ) ) ( not ( = ?auto_51197 ?auto_51198 ) ) ( ON ?auto_51190 ?auto_51199 ) ( not ( = ?auto_51198 ?auto_51199 ) ) ( not ( = ?auto_51197 ?auto_51199 ) ) ( not ( = ?auto_51196 ?auto_51199 ) ) ( not ( = ?auto_51195 ?auto_51199 ) ) ( not ( = ?auto_51194 ?auto_51199 ) ) ( not ( = ?auto_51193 ?auto_51199 ) ) ( not ( = ?auto_51192 ?auto_51199 ) ) ( not ( = ?auto_51191 ?auto_51199 ) ) ( not ( = ?auto_51190 ?auto_51199 ) ) ( ON ?auto_51191 ?auto_51190 ) ( ON ?auto_51192 ?auto_51191 ) ( ON ?auto_51193 ?auto_51192 ) ( ON ?auto_51194 ?auto_51193 ) ( ON ?auto_51195 ?auto_51194 ) ( ON ?auto_51196 ?auto_51195 ) ( ON ?auto_51197 ?auto_51196 ) ( ON ?auto_51198 ?auto_51197 ) ( CLEAR ?auto_51198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_51198 ?auto_51197 ?auto_51196 ?auto_51195 ?auto_51194 ?auto_51193 ?auto_51192 ?auto_51191 ?auto_51190 )
      ( MAKE-9PILE ?auto_51190 ?auto_51191 ?auto_51192 ?auto_51193 ?auto_51194 ?auto_51195 ?auto_51196 ?auto_51197 ?auto_51198 ) )
  )

)

