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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1055 - BLOCK
      ?auto_1056 - BLOCK
    )
    :vars
    (
      ?auto_1057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1057 ?auto_1056 ) ( CLEAR ?auto_1057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1055 ) ( ON ?auto_1056 ?auto_1055 ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( not ( = ?auto_1055 ?auto_1057 ) ) ( not ( = ?auto_1056 ?auto_1057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1057 ?auto_1056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1059 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1059 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1060 - BLOCK
    )
    :vars
    (
      ?auto_1061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1060 ?auto_1061 ) ( CLEAR ?auto_1060 ) ( HAND-EMPTY ) ( not ( = ?auto_1060 ?auto_1061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1060 ?auto_1061 )
      ( MAKE-1PILE ?auto_1060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1063 - BLOCK
    )
    :vars
    (
      ?auto_1064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1064 ?auto_1063 ) ( CLEAR ?auto_1064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1063 ) ( not ( = ?auto_1063 ?auto_1064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1064 ?auto_1063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1065 - BLOCK
    )
    :vars
    (
      ?auto_1066 - BLOCK
      ?auto_1067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1066 ?auto_1065 ) ( CLEAR ?auto_1066 ) ( ON-TABLE ?auto_1065 ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( HOLDING ?auto_1067 ) ( not ( = ?auto_1065 ?auto_1067 ) ) ( not ( = ?auto_1066 ?auto_1067 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1067 )
      ( MAKE-1PILE ?auto_1065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1068 - BLOCK
    )
    :vars
    (
      ?auto_1069 - BLOCK
      ?auto_1070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1069 ?auto_1068 ) ( ON-TABLE ?auto_1068 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( not ( = ?auto_1068 ?auto_1070 ) ) ( not ( = ?auto_1069 ?auto_1070 ) ) ( ON ?auto_1070 ?auto_1069 ) ( CLEAR ?auto_1070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1068 ?auto_1069 )
      ( MAKE-1PILE ?auto_1068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1073 - BLOCK
      ?auto_1074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1074 ) ( CLEAR ?auto_1073 ) ( ON-TABLE ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1074 ) ) )
    :subtasks
    ( ( !STACK ?auto_1074 ?auto_1073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1075 - BLOCK
      ?auto_1076 - BLOCK
    )
    :vars
    (
      ?auto_1077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1075 ) ( ON-TABLE ?auto_1075 ) ( not ( = ?auto_1075 ?auto_1076 ) ) ( ON ?auto_1076 ?auto_1077 ) ( CLEAR ?auto_1076 ) ( HAND-EMPTY ) ( not ( = ?auto_1075 ?auto_1077 ) ) ( not ( = ?auto_1076 ?auto_1077 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1076 ?auto_1077 )
      ( MAKE-2PILE ?auto_1075 ?auto_1076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1078 - BLOCK
      ?auto_1079 - BLOCK
    )
    :vars
    (
      ?auto_1080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1078 ?auto_1079 ) ) ( ON ?auto_1079 ?auto_1080 ) ( CLEAR ?auto_1079 ) ( not ( = ?auto_1078 ?auto_1080 ) ) ( not ( = ?auto_1079 ?auto_1080 ) ) ( HOLDING ?auto_1078 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1078 )
      ( MAKE-2PILE ?auto_1078 ?auto_1079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1081 - BLOCK
      ?auto_1082 - BLOCK
    )
    :vars
    (
      ?auto_1083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1081 ?auto_1082 ) ) ( ON ?auto_1082 ?auto_1083 ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( ON ?auto_1081 ?auto_1082 ) ( CLEAR ?auto_1081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1083 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1083 ?auto_1082 )
      ( MAKE-2PILE ?auto_1081 ?auto_1082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1085 - BLOCK
    )
    :vars
    (
      ?auto_1086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1086 ?auto_1085 ) ( CLEAR ?auto_1086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1085 ) ( not ( = ?auto_1085 ?auto_1086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1086 ?auto_1085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1092 - BLOCK
    )
    :vars
    (
      ?auto_1093 - BLOCK
      ?auto_1094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1092 ?auto_1093 ) ) ( ON ?auto_1093 ?auto_1094 ) ( CLEAR ?auto_1093 ) ( not ( = ?auto_1092 ?auto_1094 ) ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( HOLDING ?auto_1092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1092 ?auto_1093 )
      ( MAKE-1PILE ?auto_1092 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1095 - BLOCK
    )
    :vars
    (
      ?auto_1096 - BLOCK
      ?auto_1097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1095 ?auto_1096 ) ) ( ON ?auto_1096 ?auto_1097 ) ( not ( = ?auto_1095 ?auto_1097 ) ) ( not ( = ?auto_1096 ?auto_1097 ) ) ( ON ?auto_1095 ?auto_1096 ) ( CLEAR ?auto_1095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1097 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1097 ?auto_1096 )
      ( MAKE-1PILE ?auto_1095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1099 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1099 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1099 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1100 - BLOCK
    )
    :vars
    (
      ?auto_1101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1100 ?auto_1101 ) ( CLEAR ?auto_1100 ) ( HAND-EMPTY ) ( not ( = ?auto_1100 ?auto_1101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1100 ?auto_1101 )
      ( MAKE-1PILE ?auto_1100 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1102 - BLOCK
    )
    :vars
    (
      ?auto_1103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1102 ?auto_1103 ) ) ( HOLDING ?auto_1102 ) ( CLEAR ?auto_1103 ) ( ON-TABLE ?auto_1103 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1103 ?auto_1102 )
      ( MAKE-1PILE ?auto_1102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1104 - BLOCK
    )
    :vars
    (
      ?auto_1105 - BLOCK
      ?auto_1106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1104 ?auto_1105 ) ) ( CLEAR ?auto_1105 ) ( ON-TABLE ?auto_1105 ) ( ON ?auto_1104 ?auto_1106 ) ( CLEAR ?auto_1104 ) ( HAND-EMPTY ) ( not ( = ?auto_1104 ?auto_1106 ) ) ( not ( = ?auto_1105 ?auto_1106 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1104 ?auto_1106 )
      ( MAKE-1PILE ?auto_1104 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1107 - BLOCK
    )
    :vars
    (
      ?auto_1108 - BLOCK
      ?auto_1109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1107 ?auto_1108 ) ) ( ON ?auto_1107 ?auto_1109 ) ( CLEAR ?auto_1107 ) ( not ( = ?auto_1107 ?auto_1109 ) ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( HOLDING ?auto_1108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1108 )
      ( MAKE-1PILE ?auto_1107 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1110 - BLOCK
    )
    :vars
    (
      ?auto_1111 - BLOCK
      ?auto_1112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1110 ?auto_1111 ) ) ( ON ?auto_1110 ?auto_1112 ) ( not ( = ?auto_1110 ?auto_1112 ) ) ( not ( = ?auto_1111 ?auto_1112 ) ) ( ON ?auto_1111 ?auto_1110 ) ( CLEAR ?auto_1111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1112 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1112 ?auto_1110 )
      ( MAKE-1PILE ?auto_1110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1115 - BLOCK
      ?auto_1116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1116 ) ( CLEAR ?auto_1115 ) ( ON-TABLE ?auto_1115 ) ( not ( = ?auto_1115 ?auto_1116 ) ) )
    :subtasks
    ( ( !STACK ?auto_1116 ?auto_1115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1117 - BLOCK
      ?auto_1118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1117 ) ( ON-TABLE ?auto_1117 ) ( not ( = ?auto_1117 ?auto_1118 ) ) ( ON-TABLE ?auto_1118 ) ( CLEAR ?auto_1118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1118 )
      ( MAKE-2PILE ?auto_1117 ?auto_1118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1119 - BLOCK
      ?auto_1120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1119 ?auto_1120 ) ) ( ON-TABLE ?auto_1120 ) ( CLEAR ?auto_1120 ) ( HOLDING ?auto_1119 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1119 )
      ( MAKE-2PILE ?auto_1119 ?auto_1120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1121 - BLOCK
      ?auto_1122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1121 ?auto_1122 ) ) ( ON-TABLE ?auto_1122 ) ( ON ?auto_1121 ?auto_1122 ) ( CLEAR ?auto_1121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1122 )
      ( MAKE-2PILE ?auto_1121 ?auto_1122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1123 - BLOCK
      ?auto_1124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1123 ?auto_1124 ) ) ( ON-TABLE ?auto_1124 ) ( HOLDING ?auto_1123 ) ( CLEAR ?auto_1124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1124 ?auto_1123 )
      ( MAKE-2PILE ?auto_1123 ?auto_1124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1125 - BLOCK
      ?auto_1126 - BLOCK
    )
    :vars
    (
      ?auto_1127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1125 ?auto_1126 ) ) ( ON-TABLE ?auto_1126 ) ( CLEAR ?auto_1126 ) ( ON ?auto_1125 ?auto_1127 ) ( CLEAR ?auto_1125 ) ( HAND-EMPTY ) ( not ( = ?auto_1125 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1127 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1125 ?auto_1127 )
      ( MAKE-2PILE ?auto_1125 ?auto_1126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1128 - BLOCK
      ?auto_1129 - BLOCK
    )
    :vars
    (
      ?auto_1130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1128 ?auto_1129 ) ) ( ON ?auto_1128 ?auto_1130 ) ( CLEAR ?auto_1128 ) ( not ( = ?auto_1128 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( HOLDING ?auto_1129 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1129 )
      ( MAKE-2PILE ?auto_1128 ?auto_1129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1131 - BLOCK
      ?auto_1132 - BLOCK
    )
    :vars
    (
      ?auto_1133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1131 ?auto_1132 ) ) ( ON ?auto_1131 ?auto_1133 ) ( not ( = ?auto_1131 ?auto_1133 ) ) ( not ( = ?auto_1132 ?auto_1133 ) ) ( ON ?auto_1132 ?auto_1131 ) ( CLEAR ?auto_1132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1133 ?auto_1131 )
      ( MAKE-2PILE ?auto_1131 ?auto_1132 ) )
  )

)

