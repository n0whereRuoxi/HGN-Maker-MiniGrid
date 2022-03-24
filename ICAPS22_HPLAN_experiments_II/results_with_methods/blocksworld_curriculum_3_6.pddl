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
      ?auto_1013 - BLOCK
    )
    :vars
    (
      ?auto_1014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1013 ?auto_1014 ) ( CLEAR ?auto_1013 ) ( HAND-EMPTY ) ( not ( = ?auto_1013 ?auto_1014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1013 ?auto_1014 )
      ( !PUTDOWN ?auto_1013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1016 - BLOCK
    )
    :vars
    (
      ?auto_1017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1016 ?auto_1017 ) ( CLEAR ?auto_1016 ) ( HAND-EMPTY ) ( not ( = ?auto_1016 ?auto_1017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1016 ?auto_1017 )
      ( !PUTDOWN ?auto_1016 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1020 - BLOCK
      ?auto_1021 - BLOCK
    )
    :vars
    (
      ?auto_1022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1020 ) ( ON ?auto_1021 ?auto_1022 ) ( CLEAR ?auto_1021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1020 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( not ( = ?auto_1021 ?auto_1022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1021 ?auto_1022 )
      ( !STACK ?auto_1021 ?auto_1020 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1025 - BLOCK
      ?auto_1026 - BLOCK
    )
    :vars
    (
      ?auto_1027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1025 ) ( ON ?auto_1026 ?auto_1027 ) ( CLEAR ?auto_1026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1025 ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( not ( = ?auto_1025 ?auto_1027 ) ) ( not ( = ?auto_1026 ?auto_1027 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1026 ?auto_1027 )
      ( !STACK ?auto_1026 ?auto_1025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1030 - BLOCK
      ?auto_1031 - BLOCK
    )
    :vars
    (
      ?auto_1032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1031 ?auto_1032 ) ( not ( = ?auto_1030 ?auto_1031 ) ) ( not ( = ?auto_1030 ?auto_1032 ) ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( ON ?auto_1030 ?auto_1031 ) ( CLEAR ?auto_1030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1030 )
      ( MAKE-2PILE ?auto_1030 ?auto_1031 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1035 - BLOCK
      ?auto_1036 - BLOCK
    )
    :vars
    (
      ?auto_1037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1036 ?auto_1037 ) ( not ( = ?auto_1035 ?auto_1036 ) ) ( not ( = ?auto_1035 ?auto_1037 ) ) ( not ( = ?auto_1036 ?auto_1037 ) ) ( ON ?auto_1035 ?auto_1036 ) ( CLEAR ?auto_1035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1035 )
      ( MAKE-2PILE ?auto_1035 ?auto_1036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1041 - BLOCK
      ?auto_1042 - BLOCK
      ?auto_1043 - BLOCK
    )
    :vars
    (
      ?auto_1044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1042 ) ( ON ?auto_1043 ?auto_1044 ) ( CLEAR ?auto_1043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1041 ) ( ON ?auto_1042 ?auto_1041 ) ( not ( = ?auto_1041 ?auto_1042 ) ) ( not ( = ?auto_1041 ?auto_1043 ) ) ( not ( = ?auto_1041 ?auto_1044 ) ) ( not ( = ?auto_1042 ?auto_1043 ) ) ( not ( = ?auto_1042 ?auto_1044 ) ) ( not ( = ?auto_1043 ?auto_1044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1043 ?auto_1044 )
      ( !STACK ?auto_1043 ?auto_1042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1048 - BLOCK
      ?auto_1049 - BLOCK
      ?auto_1050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1049 ) ( ON-TABLE ?auto_1050 ) ( CLEAR ?auto_1050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1048 ) ( ON ?auto_1049 ?auto_1048 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1050 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1050 )
      ( !STACK ?auto_1050 ?auto_1049 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1054 - BLOCK
      ?auto_1055 - BLOCK
      ?auto_1056 - BLOCK
    )
    :vars
    (
      ?auto_1057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1056 ?auto_1057 ) ( ON-TABLE ?auto_1054 ) ( not ( = ?auto_1054 ?auto_1055 ) ) ( not ( = ?auto_1054 ?auto_1056 ) ) ( not ( = ?auto_1054 ?auto_1057 ) ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( not ( = ?auto_1055 ?auto_1057 ) ) ( not ( = ?auto_1056 ?auto_1057 ) ) ( CLEAR ?auto_1054 ) ( ON ?auto_1055 ?auto_1056 ) ( CLEAR ?auto_1055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1054 ?auto_1055 )
      ( MAKE-3PILE ?auto_1054 ?auto_1055 ?auto_1056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1061 - BLOCK
      ?auto_1062 - BLOCK
      ?auto_1063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1063 ) ( ON-TABLE ?auto_1061 ) ( not ( = ?auto_1061 ?auto_1062 ) ) ( not ( = ?auto_1061 ?auto_1063 ) ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( CLEAR ?auto_1061 ) ( ON ?auto_1062 ?auto_1063 ) ( CLEAR ?auto_1062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1061 ?auto_1062 )
      ( MAKE-3PILE ?auto_1061 ?auto_1062 ?auto_1063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1067 - BLOCK
      ?auto_1068 - BLOCK
      ?auto_1069 - BLOCK
    )
    :vars
    (
      ?auto_1070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1069 ?auto_1070 ) ( not ( = ?auto_1067 ?auto_1068 ) ) ( not ( = ?auto_1067 ?auto_1069 ) ) ( not ( = ?auto_1067 ?auto_1070 ) ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( not ( = ?auto_1068 ?auto_1070 ) ) ( not ( = ?auto_1069 ?auto_1070 ) ) ( ON ?auto_1068 ?auto_1069 ) ( ON ?auto_1067 ?auto_1068 ) ( CLEAR ?auto_1067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1067 )
      ( MAKE-3PILE ?auto_1067 ?auto_1068 ?auto_1069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1074 - BLOCK
      ?auto_1075 - BLOCK
      ?auto_1076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1076 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( not ( = ?auto_1074 ?auto_1076 ) ) ( not ( = ?auto_1075 ?auto_1076 ) ) ( ON ?auto_1075 ?auto_1076 ) ( ON ?auto_1074 ?auto_1075 ) ( CLEAR ?auto_1074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1074 )
      ( MAKE-3PILE ?auto_1074 ?auto_1075 ?auto_1076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1080 - BLOCK
      ?auto_1081 - BLOCK
      ?auto_1082 - BLOCK
    )
    :vars
    (
      ?auto_1083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1080 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( ON ?auto_1080 ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( ON ?auto_1081 ?auto_1080 ) ( ON ?auto_1082 ?auto_1081 ) ( CLEAR ?auto_1082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1082 ?auto_1081 ?auto_1080 )
      ( MAKE-3PILE ?auto_1080 ?auto_1081 ?auto_1082 ) )
  )

)

