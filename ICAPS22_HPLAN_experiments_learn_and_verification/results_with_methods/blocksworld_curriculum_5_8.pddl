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
      ?auto_6969 - BLOCK
    )
    :vars
    (
      ?auto_6970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6969 ?auto_6970 ) ( CLEAR ?auto_6969 ) ( HAND-EMPTY ) ( not ( = ?auto_6969 ?auto_6970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6969 ?auto_6970 )
      ( !PUTDOWN ?auto_6969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6972 - BLOCK
    )
    :vars
    (
      ?auto_6973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6972 ?auto_6973 ) ( CLEAR ?auto_6972 ) ( HAND-EMPTY ) ( not ( = ?auto_6972 ?auto_6973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6972 ?auto_6973 )
      ( !PUTDOWN ?auto_6972 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6976 - BLOCK
      ?auto_6977 - BLOCK
    )
    :vars
    (
      ?auto_6978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6976 ) ( ON ?auto_6977 ?auto_6978 ) ( CLEAR ?auto_6977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6976 ) ( not ( = ?auto_6976 ?auto_6977 ) ) ( not ( = ?auto_6976 ?auto_6978 ) ) ( not ( = ?auto_6977 ?auto_6978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6977 ?auto_6978 )
      ( !STACK ?auto_6977 ?auto_6976 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6981 - BLOCK
      ?auto_6982 - BLOCK
    )
    :vars
    (
      ?auto_6983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6981 ) ( ON ?auto_6982 ?auto_6983 ) ( CLEAR ?auto_6982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6981 ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( not ( = ?auto_6981 ?auto_6983 ) ) ( not ( = ?auto_6982 ?auto_6983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6982 ?auto_6983 )
      ( !STACK ?auto_6982 ?auto_6981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6986 - BLOCK
      ?auto_6987 - BLOCK
    )
    :vars
    (
      ?auto_6988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6987 ?auto_6988 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6986 ?auto_6988 ) ) ( not ( = ?auto_6987 ?auto_6988 ) ) ( ON ?auto_6986 ?auto_6987 ) ( CLEAR ?auto_6986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6986 )
      ( MAKE-2PILE ?auto_6986 ?auto_6987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6991 - BLOCK
      ?auto_6992 - BLOCK
    )
    :vars
    (
      ?auto_6993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6992 ?auto_6993 ) ( not ( = ?auto_6991 ?auto_6992 ) ) ( not ( = ?auto_6991 ?auto_6993 ) ) ( not ( = ?auto_6992 ?auto_6993 ) ) ( ON ?auto_6991 ?auto_6992 ) ( CLEAR ?auto_6991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6991 )
      ( MAKE-2PILE ?auto_6991 ?auto_6992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6997 - BLOCK
      ?auto_6998 - BLOCK
      ?auto_6999 - BLOCK
    )
    :vars
    (
      ?auto_7000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6998 ) ( ON ?auto_6999 ?auto_7000 ) ( CLEAR ?auto_6999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6997 ) ( ON ?auto_6998 ?auto_6997 ) ( not ( = ?auto_6997 ?auto_6998 ) ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_7000 ) ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6998 ?auto_7000 ) ) ( not ( = ?auto_6999 ?auto_7000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6999 ?auto_7000 )
      ( !STACK ?auto_6999 ?auto_6998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7004 - BLOCK
      ?auto_7005 - BLOCK
      ?auto_7006 - BLOCK
    )
    :vars
    (
      ?auto_7007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7005 ) ( ON ?auto_7006 ?auto_7007 ) ( CLEAR ?auto_7006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7004 ) ( ON ?auto_7005 ?auto_7004 ) ( not ( = ?auto_7004 ?auto_7005 ) ) ( not ( = ?auto_7004 ?auto_7006 ) ) ( not ( = ?auto_7004 ?auto_7007 ) ) ( not ( = ?auto_7005 ?auto_7006 ) ) ( not ( = ?auto_7005 ?auto_7007 ) ) ( not ( = ?auto_7006 ?auto_7007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7006 ?auto_7007 )
      ( !STACK ?auto_7006 ?auto_7005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7011 - BLOCK
      ?auto_7012 - BLOCK
      ?auto_7013 - BLOCK
    )
    :vars
    (
      ?auto_7014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7013 ?auto_7014 ) ( ON-TABLE ?auto_7011 ) ( not ( = ?auto_7011 ?auto_7012 ) ) ( not ( = ?auto_7011 ?auto_7013 ) ) ( not ( = ?auto_7011 ?auto_7014 ) ) ( not ( = ?auto_7012 ?auto_7013 ) ) ( not ( = ?auto_7012 ?auto_7014 ) ) ( not ( = ?auto_7013 ?auto_7014 ) ) ( CLEAR ?auto_7011 ) ( ON ?auto_7012 ?auto_7013 ) ( CLEAR ?auto_7012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7011 ?auto_7012 )
      ( MAKE-3PILE ?auto_7011 ?auto_7012 ?auto_7013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7018 - BLOCK
      ?auto_7019 - BLOCK
      ?auto_7020 - BLOCK
    )
    :vars
    (
      ?auto_7021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7020 ?auto_7021 ) ( ON-TABLE ?auto_7018 ) ( not ( = ?auto_7018 ?auto_7019 ) ) ( not ( = ?auto_7018 ?auto_7020 ) ) ( not ( = ?auto_7018 ?auto_7021 ) ) ( not ( = ?auto_7019 ?auto_7020 ) ) ( not ( = ?auto_7019 ?auto_7021 ) ) ( not ( = ?auto_7020 ?auto_7021 ) ) ( CLEAR ?auto_7018 ) ( ON ?auto_7019 ?auto_7020 ) ( CLEAR ?auto_7019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7018 ?auto_7019 )
      ( MAKE-3PILE ?auto_7018 ?auto_7019 ?auto_7020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7025 - BLOCK
      ?auto_7026 - BLOCK
      ?auto_7027 - BLOCK
    )
    :vars
    (
      ?auto_7028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7027 ?auto_7028 ) ( not ( = ?auto_7025 ?auto_7026 ) ) ( not ( = ?auto_7025 ?auto_7027 ) ) ( not ( = ?auto_7025 ?auto_7028 ) ) ( not ( = ?auto_7026 ?auto_7027 ) ) ( not ( = ?auto_7026 ?auto_7028 ) ) ( not ( = ?auto_7027 ?auto_7028 ) ) ( ON ?auto_7026 ?auto_7027 ) ( ON ?auto_7025 ?auto_7026 ) ( CLEAR ?auto_7025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7025 )
      ( MAKE-3PILE ?auto_7025 ?auto_7026 ?auto_7027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_7032 - BLOCK
      ?auto_7033 - BLOCK
      ?auto_7034 - BLOCK
    )
    :vars
    (
      ?auto_7035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7034 ?auto_7035 ) ( not ( = ?auto_7032 ?auto_7033 ) ) ( not ( = ?auto_7032 ?auto_7034 ) ) ( not ( = ?auto_7032 ?auto_7035 ) ) ( not ( = ?auto_7033 ?auto_7034 ) ) ( not ( = ?auto_7033 ?auto_7035 ) ) ( not ( = ?auto_7034 ?auto_7035 ) ) ( ON ?auto_7033 ?auto_7034 ) ( ON ?auto_7032 ?auto_7033 ) ( CLEAR ?auto_7032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7032 )
      ( MAKE-3PILE ?auto_7032 ?auto_7033 ?auto_7034 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7040 - BLOCK
      ?auto_7041 - BLOCK
      ?auto_7042 - BLOCK
      ?auto_7043 - BLOCK
    )
    :vars
    (
      ?auto_7044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7042 ) ( ON ?auto_7043 ?auto_7044 ) ( CLEAR ?auto_7043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7040 ) ( ON ?auto_7041 ?auto_7040 ) ( ON ?auto_7042 ?auto_7041 ) ( not ( = ?auto_7040 ?auto_7041 ) ) ( not ( = ?auto_7040 ?auto_7042 ) ) ( not ( = ?auto_7040 ?auto_7043 ) ) ( not ( = ?auto_7040 ?auto_7044 ) ) ( not ( = ?auto_7041 ?auto_7042 ) ) ( not ( = ?auto_7041 ?auto_7043 ) ) ( not ( = ?auto_7041 ?auto_7044 ) ) ( not ( = ?auto_7042 ?auto_7043 ) ) ( not ( = ?auto_7042 ?auto_7044 ) ) ( not ( = ?auto_7043 ?auto_7044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7043 ?auto_7044 )
      ( !STACK ?auto_7043 ?auto_7042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7049 - BLOCK
      ?auto_7050 - BLOCK
      ?auto_7051 - BLOCK
      ?auto_7052 - BLOCK
    )
    :vars
    (
      ?auto_7053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7051 ) ( ON ?auto_7052 ?auto_7053 ) ( CLEAR ?auto_7052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7049 ) ( ON ?auto_7050 ?auto_7049 ) ( ON ?auto_7051 ?auto_7050 ) ( not ( = ?auto_7049 ?auto_7050 ) ) ( not ( = ?auto_7049 ?auto_7051 ) ) ( not ( = ?auto_7049 ?auto_7052 ) ) ( not ( = ?auto_7049 ?auto_7053 ) ) ( not ( = ?auto_7050 ?auto_7051 ) ) ( not ( = ?auto_7050 ?auto_7052 ) ) ( not ( = ?auto_7050 ?auto_7053 ) ) ( not ( = ?auto_7051 ?auto_7052 ) ) ( not ( = ?auto_7051 ?auto_7053 ) ) ( not ( = ?auto_7052 ?auto_7053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7052 ?auto_7053 )
      ( !STACK ?auto_7052 ?auto_7051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7058 - BLOCK
      ?auto_7059 - BLOCK
      ?auto_7060 - BLOCK
      ?auto_7061 - BLOCK
    )
    :vars
    (
      ?auto_7062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7061 ?auto_7062 ) ( ON-TABLE ?auto_7058 ) ( ON ?auto_7059 ?auto_7058 ) ( not ( = ?auto_7058 ?auto_7059 ) ) ( not ( = ?auto_7058 ?auto_7060 ) ) ( not ( = ?auto_7058 ?auto_7061 ) ) ( not ( = ?auto_7058 ?auto_7062 ) ) ( not ( = ?auto_7059 ?auto_7060 ) ) ( not ( = ?auto_7059 ?auto_7061 ) ) ( not ( = ?auto_7059 ?auto_7062 ) ) ( not ( = ?auto_7060 ?auto_7061 ) ) ( not ( = ?auto_7060 ?auto_7062 ) ) ( not ( = ?auto_7061 ?auto_7062 ) ) ( CLEAR ?auto_7059 ) ( ON ?auto_7060 ?auto_7061 ) ( CLEAR ?auto_7060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7058 ?auto_7059 ?auto_7060 )
      ( MAKE-4PILE ?auto_7058 ?auto_7059 ?auto_7060 ?auto_7061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7067 - BLOCK
      ?auto_7068 - BLOCK
      ?auto_7069 - BLOCK
      ?auto_7070 - BLOCK
    )
    :vars
    (
      ?auto_7071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7070 ?auto_7071 ) ( ON-TABLE ?auto_7067 ) ( ON ?auto_7068 ?auto_7067 ) ( not ( = ?auto_7067 ?auto_7068 ) ) ( not ( = ?auto_7067 ?auto_7069 ) ) ( not ( = ?auto_7067 ?auto_7070 ) ) ( not ( = ?auto_7067 ?auto_7071 ) ) ( not ( = ?auto_7068 ?auto_7069 ) ) ( not ( = ?auto_7068 ?auto_7070 ) ) ( not ( = ?auto_7068 ?auto_7071 ) ) ( not ( = ?auto_7069 ?auto_7070 ) ) ( not ( = ?auto_7069 ?auto_7071 ) ) ( not ( = ?auto_7070 ?auto_7071 ) ) ( CLEAR ?auto_7068 ) ( ON ?auto_7069 ?auto_7070 ) ( CLEAR ?auto_7069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7067 ?auto_7068 ?auto_7069 )
      ( MAKE-4PILE ?auto_7067 ?auto_7068 ?auto_7069 ?auto_7070 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7076 - BLOCK
      ?auto_7077 - BLOCK
      ?auto_7078 - BLOCK
      ?auto_7079 - BLOCK
    )
    :vars
    (
      ?auto_7080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7079 ?auto_7080 ) ( ON-TABLE ?auto_7076 ) ( not ( = ?auto_7076 ?auto_7077 ) ) ( not ( = ?auto_7076 ?auto_7078 ) ) ( not ( = ?auto_7076 ?auto_7079 ) ) ( not ( = ?auto_7076 ?auto_7080 ) ) ( not ( = ?auto_7077 ?auto_7078 ) ) ( not ( = ?auto_7077 ?auto_7079 ) ) ( not ( = ?auto_7077 ?auto_7080 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7080 ) ) ( not ( = ?auto_7079 ?auto_7080 ) ) ( ON ?auto_7078 ?auto_7079 ) ( CLEAR ?auto_7076 ) ( ON ?auto_7077 ?auto_7078 ) ( CLEAR ?auto_7077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7076 ?auto_7077 )
      ( MAKE-4PILE ?auto_7076 ?auto_7077 ?auto_7078 ?auto_7079 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7085 - BLOCK
      ?auto_7086 - BLOCK
      ?auto_7087 - BLOCK
      ?auto_7088 - BLOCK
    )
    :vars
    (
      ?auto_7089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7088 ?auto_7089 ) ( ON-TABLE ?auto_7085 ) ( not ( = ?auto_7085 ?auto_7086 ) ) ( not ( = ?auto_7085 ?auto_7087 ) ) ( not ( = ?auto_7085 ?auto_7088 ) ) ( not ( = ?auto_7085 ?auto_7089 ) ) ( not ( = ?auto_7086 ?auto_7087 ) ) ( not ( = ?auto_7086 ?auto_7088 ) ) ( not ( = ?auto_7086 ?auto_7089 ) ) ( not ( = ?auto_7087 ?auto_7088 ) ) ( not ( = ?auto_7087 ?auto_7089 ) ) ( not ( = ?auto_7088 ?auto_7089 ) ) ( ON ?auto_7087 ?auto_7088 ) ( CLEAR ?auto_7085 ) ( ON ?auto_7086 ?auto_7087 ) ( CLEAR ?auto_7086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7085 ?auto_7086 )
      ( MAKE-4PILE ?auto_7085 ?auto_7086 ?auto_7087 ?auto_7088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7094 - BLOCK
      ?auto_7095 - BLOCK
      ?auto_7096 - BLOCK
      ?auto_7097 - BLOCK
    )
    :vars
    (
      ?auto_7098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7097 ?auto_7098 ) ( not ( = ?auto_7094 ?auto_7095 ) ) ( not ( = ?auto_7094 ?auto_7096 ) ) ( not ( = ?auto_7094 ?auto_7097 ) ) ( not ( = ?auto_7094 ?auto_7098 ) ) ( not ( = ?auto_7095 ?auto_7096 ) ) ( not ( = ?auto_7095 ?auto_7097 ) ) ( not ( = ?auto_7095 ?auto_7098 ) ) ( not ( = ?auto_7096 ?auto_7097 ) ) ( not ( = ?auto_7096 ?auto_7098 ) ) ( not ( = ?auto_7097 ?auto_7098 ) ) ( ON ?auto_7096 ?auto_7097 ) ( ON ?auto_7095 ?auto_7096 ) ( ON ?auto_7094 ?auto_7095 ) ( CLEAR ?auto_7094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7094 )
      ( MAKE-4PILE ?auto_7094 ?auto_7095 ?auto_7096 ?auto_7097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_7103 - BLOCK
      ?auto_7104 - BLOCK
      ?auto_7105 - BLOCK
      ?auto_7106 - BLOCK
    )
    :vars
    (
      ?auto_7107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7106 ?auto_7107 ) ( not ( = ?auto_7103 ?auto_7104 ) ) ( not ( = ?auto_7103 ?auto_7105 ) ) ( not ( = ?auto_7103 ?auto_7106 ) ) ( not ( = ?auto_7103 ?auto_7107 ) ) ( not ( = ?auto_7104 ?auto_7105 ) ) ( not ( = ?auto_7104 ?auto_7106 ) ) ( not ( = ?auto_7104 ?auto_7107 ) ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( not ( = ?auto_7105 ?auto_7107 ) ) ( not ( = ?auto_7106 ?auto_7107 ) ) ( ON ?auto_7105 ?auto_7106 ) ( ON ?auto_7104 ?auto_7105 ) ( ON ?auto_7103 ?auto_7104 ) ( CLEAR ?auto_7103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7103 )
      ( MAKE-4PILE ?auto_7103 ?auto_7104 ?auto_7105 ?auto_7106 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7113 - BLOCK
      ?auto_7114 - BLOCK
      ?auto_7115 - BLOCK
      ?auto_7116 - BLOCK
      ?auto_7117 - BLOCK
    )
    :vars
    (
      ?auto_7118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7116 ) ( ON ?auto_7117 ?auto_7118 ) ( CLEAR ?auto_7117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7113 ) ( ON ?auto_7114 ?auto_7113 ) ( ON ?auto_7115 ?auto_7114 ) ( ON ?auto_7116 ?auto_7115 ) ( not ( = ?auto_7113 ?auto_7114 ) ) ( not ( = ?auto_7113 ?auto_7115 ) ) ( not ( = ?auto_7113 ?auto_7116 ) ) ( not ( = ?auto_7113 ?auto_7117 ) ) ( not ( = ?auto_7113 ?auto_7118 ) ) ( not ( = ?auto_7114 ?auto_7115 ) ) ( not ( = ?auto_7114 ?auto_7116 ) ) ( not ( = ?auto_7114 ?auto_7117 ) ) ( not ( = ?auto_7114 ?auto_7118 ) ) ( not ( = ?auto_7115 ?auto_7116 ) ) ( not ( = ?auto_7115 ?auto_7117 ) ) ( not ( = ?auto_7115 ?auto_7118 ) ) ( not ( = ?auto_7116 ?auto_7117 ) ) ( not ( = ?auto_7116 ?auto_7118 ) ) ( not ( = ?auto_7117 ?auto_7118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7117 ?auto_7118 )
      ( !STACK ?auto_7117 ?auto_7116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7124 - BLOCK
      ?auto_7125 - BLOCK
      ?auto_7126 - BLOCK
      ?auto_7127 - BLOCK
      ?auto_7128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_7127 ) ( ON-TABLE ?auto_7128 ) ( CLEAR ?auto_7128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_7124 ) ( ON ?auto_7125 ?auto_7124 ) ( ON ?auto_7126 ?auto_7125 ) ( ON ?auto_7127 ?auto_7126 ) ( not ( = ?auto_7124 ?auto_7125 ) ) ( not ( = ?auto_7124 ?auto_7126 ) ) ( not ( = ?auto_7124 ?auto_7127 ) ) ( not ( = ?auto_7124 ?auto_7128 ) ) ( not ( = ?auto_7125 ?auto_7126 ) ) ( not ( = ?auto_7125 ?auto_7127 ) ) ( not ( = ?auto_7125 ?auto_7128 ) ) ( not ( = ?auto_7126 ?auto_7127 ) ) ( not ( = ?auto_7126 ?auto_7128 ) ) ( not ( = ?auto_7127 ?auto_7128 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_7128 )
      ( !STACK ?auto_7128 ?auto_7127 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7134 - BLOCK
      ?auto_7135 - BLOCK
      ?auto_7136 - BLOCK
      ?auto_7137 - BLOCK
      ?auto_7138 - BLOCK
    )
    :vars
    (
      ?auto_7139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7138 ?auto_7139 ) ( ON-TABLE ?auto_7134 ) ( ON ?auto_7135 ?auto_7134 ) ( ON ?auto_7136 ?auto_7135 ) ( not ( = ?auto_7134 ?auto_7135 ) ) ( not ( = ?auto_7134 ?auto_7136 ) ) ( not ( = ?auto_7134 ?auto_7137 ) ) ( not ( = ?auto_7134 ?auto_7138 ) ) ( not ( = ?auto_7134 ?auto_7139 ) ) ( not ( = ?auto_7135 ?auto_7136 ) ) ( not ( = ?auto_7135 ?auto_7137 ) ) ( not ( = ?auto_7135 ?auto_7138 ) ) ( not ( = ?auto_7135 ?auto_7139 ) ) ( not ( = ?auto_7136 ?auto_7137 ) ) ( not ( = ?auto_7136 ?auto_7138 ) ) ( not ( = ?auto_7136 ?auto_7139 ) ) ( not ( = ?auto_7137 ?auto_7138 ) ) ( not ( = ?auto_7137 ?auto_7139 ) ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( CLEAR ?auto_7136 ) ( ON ?auto_7137 ?auto_7138 ) ( CLEAR ?auto_7137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7134 ?auto_7135 ?auto_7136 ?auto_7137 )
      ( MAKE-5PILE ?auto_7134 ?auto_7135 ?auto_7136 ?auto_7137 ?auto_7138 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7145 - BLOCK
      ?auto_7146 - BLOCK
      ?auto_7147 - BLOCK
      ?auto_7148 - BLOCK
      ?auto_7149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7149 ) ( ON-TABLE ?auto_7145 ) ( ON ?auto_7146 ?auto_7145 ) ( ON ?auto_7147 ?auto_7146 ) ( not ( = ?auto_7145 ?auto_7146 ) ) ( not ( = ?auto_7145 ?auto_7147 ) ) ( not ( = ?auto_7145 ?auto_7148 ) ) ( not ( = ?auto_7145 ?auto_7149 ) ) ( not ( = ?auto_7146 ?auto_7147 ) ) ( not ( = ?auto_7146 ?auto_7148 ) ) ( not ( = ?auto_7146 ?auto_7149 ) ) ( not ( = ?auto_7147 ?auto_7148 ) ) ( not ( = ?auto_7147 ?auto_7149 ) ) ( not ( = ?auto_7148 ?auto_7149 ) ) ( CLEAR ?auto_7147 ) ( ON ?auto_7148 ?auto_7149 ) ( CLEAR ?auto_7148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_7145 ?auto_7146 ?auto_7147 ?auto_7148 )
      ( MAKE-5PILE ?auto_7145 ?auto_7146 ?auto_7147 ?auto_7148 ?auto_7149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7155 - BLOCK
      ?auto_7156 - BLOCK
      ?auto_7157 - BLOCK
      ?auto_7158 - BLOCK
      ?auto_7159 - BLOCK
    )
    :vars
    (
      ?auto_7160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7159 ?auto_7160 ) ( ON-TABLE ?auto_7155 ) ( ON ?auto_7156 ?auto_7155 ) ( not ( = ?auto_7155 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7157 ) ) ( not ( = ?auto_7155 ?auto_7158 ) ) ( not ( = ?auto_7155 ?auto_7159 ) ) ( not ( = ?auto_7155 ?auto_7160 ) ) ( not ( = ?auto_7156 ?auto_7157 ) ) ( not ( = ?auto_7156 ?auto_7158 ) ) ( not ( = ?auto_7156 ?auto_7159 ) ) ( not ( = ?auto_7156 ?auto_7160 ) ) ( not ( = ?auto_7157 ?auto_7158 ) ) ( not ( = ?auto_7157 ?auto_7159 ) ) ( not ( = ?auto_7157 ?auto_7160 ) ) ( not ( = ?auto_7158 ?auto_7159 ) ) ( not ( = ?auto_7158 ?auto_7160 ) ) ( not ( = ?auto_7159 ?auto_7160 ) ) ( ON ?auto_7158 ?auto_7159 ) ( CLEAR ?auto_7156 ) ( ON ?auto_7157 ?auto_7158 ) ( CLEAR ?auto_7157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7155 ?auto_7156 ?auto_7157 )
      ( MAKE-5PILE ?auto_7155 ?auto_7156 ?auto_7157 ?auto_7158 ?auto_7159 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7166 - BLOCK
      ?auto_7167 - BLOCK
      ?auto_7168 - BLOCK
      ?auto_7169 - BLOCK
      ?auto_7170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7170 ) ( ON-TABLE ?auto_7166 ) ( ON ?auto_7167 ?auto_7166 ) ( not ( = ?auto_7166 ?auto_7167 ) ) ( not ( = ?auto_7166 ?auto_7168 ) ) ( not ( = ?auto_7166 ?auto_7169 ) ) ( not ( = ?auto_7166 ?auto_7170 ) ) ( not ( = ?auto_7167 ?auto_7168 ) ) ( not ( = ?auto_7167 ?auto_7169 ) ) ( not ( = ?auto_7167 ?auto_7170 ) ) ( not ( = ?auto_7168 ?auto_7169 ) ) ( not ( = ?auto_7168 ?auto_7170 ) ) ( not ( = ?auto_7169 ?auto_7170 ) ) ( ON ?auto_7169 ?auto_7170 ) ( CLEAR ?auto_7167 ) ( ON ?auto_7168 ?auto_7169 ) ( CLEAR ?auto_7168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_7166 ?auto_7167 ?auto_7168 )
      ( MAKE-5PILE ?auto_7166 ?auto_7167 ?auto_7168 ?auto_7169 ?auto_7170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7176 - BLOCK
      ?auto_7177 - BLOCK
      ?auto_7178 - BLOCK
      ?auto_7179 - BLOCK
      ?auto_7180 - BLOCK
    )
    :vars
    (
      ?auto_7181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7180 ?auto_7181 ) ( ON-TABLE ?auto_7176 ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( not ( = ?auto_7176 ?auto_7178 ) ) ( not ( = ?auto_7176 ?auto_7179 ) ) ( not ( = ?auto_7176 ?auto_7180 ) ) ( not ( = ?auto_7176 ?auto_7181 ) ) ( not ( = ?auto_7177 ?auto_7178 ) ) ( not ( = ?auto_7177 ?auto_7179 ) ) ( not ( = ?auto_7177 ?auto_7180 ) ) ( not ( = ?auto_7177 ?auto_7181 ) ) ( not ( = ?auto_7178 ?auto_7179 ) ) ( not ( = ?auto_7178 ?auto_7180 ) ) ( not ( = ?auto_7178 ?auto_7181 ) ) ( not ( = ?auto_7179 ?auto_7180 ) ) ( not ( = ?auto_7179 ?auto_7181 ) ) ( not ( = ?auto_7180 ?auto_7181 ) ) ( ON ?auto_7179 ?auto_7180 ) ( ON ?auto_7178 ?auto_7179 ) ( CLEAR ?auto_7176 ) ( ON ?auto_7177 ?auto_7178 ) ( CLEAR ?auto_7177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7176 ?auto_7177 )
      ( MAKE-5PILE ?auto_7176 ?auto_7177 ?auto_7178 ?auto_7179 ?auto_7180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7187 - BLOCK
      ?auto_7188 - BLOCK
      ?auto_7189 - BLOCK
      ?auto_7190 - BLOCK
      ?auto_7191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7191 ) ( ON-TABLE ?auto_7187 ) ( not ( = ?auto_7187 ?auto_7188 ) ) ( not ( = ?auto_7187 ?auto_7189 ) ) ( not ( = ?auto_7187 ?auto_7190 ) ) ( not ( = ?auto_7187 ?auto_7191 ) ) ( not ( = ?auto_7188 ?auto_7189 ) ) ( not ( = ?auto_7188 ?auto_7190 ) ) ( not ( = ?auto_7188 ?auto_7191 ) ) ( not ( = ?auto_7189 ?auto_7190 ) ) ( not ( = ?auto_7189 ?auto_7191 ) ) ( not ( = ?auto_7190 ?auto_7191 ) ) ( ON ?auto_7190 ?auto_7191 ) ( ON ?auto_7189 ?auto_7190 ) ( CLEAR ?auto_7187 ) ( ON ?auto_7188 ?auto_7189 ) ( CLEAR ?auto_7188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_7187 ?auto_7188 )
      ( MAKE-5PILE ?auto_7187 ?auto_7188 ?auto_7189 ?auto_7190 ?auto_7191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7197 - BLOCK
      ?auto_7198 - BLOCK
      ?auto_7199 - BLOCK
      ?auto_7200 - BLOCK
      ?auto_7201 - BLOCK
    )
    :vars
    (
      ?auto_7202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7201 ?auto_7202 ) ( not ( = ?auto_7197 ?auto_7198 ) ) ( not ( = ?auto_7197 ?auto_7199 ) ) ( not ( = ?auto_7197 ?auto_7200 ) ) ( not ( = ?auto_7197 ?auto_7201 ) ) ( not ( = ?auto_7197 ?auto_7202 ) ) ( not ( = ?auto_7198 ?auto_7199 ) ) ( not ( = ?auto_7198 ?auto_7200 ) ) ( not ( = ?auto_7198 ?auto_7201 ) ) ( not ( = ?auto_7198 ?auto_7202 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( not ( = ?auto_7199 ?auto_7201 ) ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7200 ?auto_7201 ) ) ( not ( = ?auto_7200 ?auto_7202 ) ) ( not ( = ?auto_7201 ?auto_7202 ) ) ( ON ?auto_7200 ?auto_7201 ) ( ON ?auto_7199 ?auto_7200 ) ( ON ?auto_7198 ?auto_7199 ) ( ON ?auto_7197 ?auto_7198 ) ( CLEAR ?auto_7197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7197 )
      ( MAKE-5PILE ?auto_7197 ?auto_7198 ?auto_7199 ?auto_7200 ?auto_7201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7208 - BLOCK
      ?auto_7209 - BLOCK
      ?auto_7210 - BLOCK
      ?auto_7211 - BLOCK
      ?auto_7212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_7212 ) ( not ( = ?auto_7208 ?auto_7209 ) ) ( not ( = ?auto_7208 ?auto_7210 ) ) ( not ( = ?auto_7208 ?auto_7211 ) ) ( not ( = ?auto_7208 ?auto_7212 ) ) ( not ( = ?auto_7209 ?auto_7210 ) ) ( not ( = ?auto_7209 ?auto_7211 ) ) ( not ( = ?auto_7209 ?auto_7212 ) ) ( not ( = ?auto_7210 ?auto_7211 ) ) ( not ( = ?auto_7210 ?auto_7212 ) ) ( not ( = ?auto_7211 ?auto_7212 ) ) ( ON ?auto_7211 ?auto_7212 ) ( ON ?auto_7210 ?auto_7211 ) ( ON ?auto_7209 ?auto_7210 ) ( ON ?auto_7208 ?auto_7209 ) ( CLEAR ?auto_7208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_7208 )
      ( MAKE-5PILE ?auto_7208 ?auto_7209 ?auto_7210 ?auto_7211 ?auto_7212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_7218 - BLOCK
      ?auto_7219 - BLOCK
      ?auto_7220 - BLOCK
      ?auto_7221 - BLOCK
      ?auto_7222 - BLOCK
    )
    :vars
    (
      ?auto_7223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_7218 ?auto_7219 ) ) ( not ( = ?auto_7218 ?auto_7220 ) ) ( not ( = ?auto_7218 ?auto_7221 ) ) ( not ( = ?auto_7218 ?auto_7222 ) ) ( not ( = ?auto_7219 ?auto_7220 ) ) ( not ( = ?auto_7219 ?auto_7221 ) ) ( not ( = ?auto_7219 ?auto_7222 ) ) ( not ( = ?auto_7220 ?auto_7221 ) ) ( not ( = ?auto_7220 ?auto_7222 ) ) ( not ( = ?auto_7221 ?auto_7222 ) ) ( ON ?auto_7218 ?auto_7223 ) ( not ( = ?auto_7222 ?auto_7223 ) ) ( not ( = ?auto_7221 ?auto_7223 ) ) ( not ( = ?auto_7220 ?auto_7223 ) ) ( not ( = ?auto_7219 ?auto_7223 ) ) ( not ( = ?auto_7218 ?auto_7223 ) ) ( ON ?auto_7219 ?auto_7218 ) ( ON ?auto_7220 ?auto_7219 ) ( ON ?auto_7221 ?auto_7220 ) ( ON ?auto_7222 ?auto_7221 ) ( CLEAR ?auto_7222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_7222 ?auto_7221 ?auto_7220 ?auto_7219 ?auto_7218 )
      ( MAKE-5PILE ?auto_7218 ?auto_7219 ?auto_7220 ?auto_7221 ?auto_7222 ) )
  )

)

