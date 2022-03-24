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
      ?auto_1112 - BLOCK
      ?auto_1113 - BLOCK
    )
    :vars
    (
      ?auto_1114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1114 ?auto_1113 ) ( CLEAR ?auto_1114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1112 ) ( ON ?auto_1113 ?auto_1112 ) ( not ( = ?auto_1112 ?auto_1113 ) ) ( not ( = ?auto_1112 ?auto_1114 ) ) ( not ( = ?auto_1113 ?auto_1114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1114 ?auto_1113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1116 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1117 - BLOCK
    )
    :vars
    (
      ?auto_1118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1117 ?auto_1118 ) ( CLEAR ?auto_1117 ) ( HAND-EMPTY ) ( not ( = ?auto_1117 ?auto_1118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1117 ?auto_1118 )
      ( MAKE-1PILE ?auto_1117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1120 - BLOCK
    )
    :vars
    (
      ?auto_1121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1121 ?auto_1120 ) ( CLEAR ?auto_1121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1120 ) ( not ( = ?auto_1120 ?auto_1121 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1121 ?auto_1120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1122 - BLOCK
    )
    :vars
    (
      ?auto_1123 - BLOCK
      ?auto_1124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1123 ?auto_1122 ) ( CLEAR ?auto_1123 ) ( ON-TABLE ?auto_1122 ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( HOLDING ?auto_1124 ) ( not ( = ?auto_1122 ?auto_1124 ) ) ( not ( = ?auto_1123 ?auto_1124 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1124 )
      ( MAKE-1PILE ?auto_1122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1125 - BLOCK
    )
    :vars
    (
      ?auto_1126 - BLOCK
      ?auto_1127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1126 ?auto_1125 ) ( ON-TABLE ?auto_1125 ) ( not ( = ?auto_1125 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1127 ) ) ( ON ?auto_1127 ?auto_1126 ) ( CLEAR ?auto_1127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1125 ?auto_1126 )
      ( MAKE-1PILE ?auto_1125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1130 - BLOCK
      ?auto_1131 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1131 ) ( CLEAR ?auto_1130 ) ( ON-TABLE ?auto_1130 ) ( not ( = ?auto_1130 ?auto_1131 ) ) )
    :subtasks
    ( ( !STACK ?auto_1131 ?auto_1130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1132 - BLOCK
      ?auto_1133 - BLOCK
    )
    :vars
    (
      ?auto_1134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1132 ) ( ON-TABLE ?auto_1132 ) ( not ( = ?auto_1132 ?auto_1133 ) ) ( ON ?auto_1133 ?auto_1134 ) ( CLEAR ?auto_1133 ) ( HAND-EMPTY ) ( not ( = ?auto_1132 ?auto_1134 ) ) ( not ( = ?auto_1133 ?auto_1134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1133 ?auto_1134 )
      ( MAKE-2PILE ?auto_1132 ?auto_1133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1135 - BLOCK
      ?auto_1136 - BLOCK
    )
    :vars
    (
      ?auto_1137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1135 ?auto_1136 ) ) ( ON ?auto_1136 ?auto_1137 ) ( CLEAR ?auto_1136 ) ( not ( = ?auto_1135 ?auto_1137 ) ) ( not ( = ?auto_1136 ?auto_1137 ) ) ( HOLDING ?auto_1135 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1135 )
      ( MAKE-2PILE ?auto_1135 ?auto_1136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1138 - BLOCK
      ?auto_1139 - BLOCK
    )
    :vars
    (
      ?auto_1140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1138 ?auto_1139 ) ) ( ON ?auto_1139 ?auto_1140 ) ( not ( = ?auto_1138 ?auto_1140 ) ) ( not ( = ?auto_1139 ?auto_1140 ) ) ( ON ?auto_1138 ?auto_1139 ) ( CLEAR ?auto_1138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1140 ?auto_1139 )
      ( MAKE-2PILE ?auto_1138 ?auto_1139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1157 - BLOCK
    )
    :vars
    (
      ?auto_1158 - BLOCK
      ?auto_1159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1157 ?auto_1158 ) ( CLEAR ?auto_1157 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( HOLDING ?auto_1159 ) ( not ( = ?auto_1157 ?auto_1159 ) ) ( not ( = ?auto_1158 ?auto_1159 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1159 )
      ( MAKE-1PILE ?auto_1157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1160 - BLOCK
    )
    :vars
    (
      ?auto_1161 - BLOCK
      ?auto_1162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1160 ?auto_1161 ) ( not ( = ?auto_1160 ?auto_1161 ) ) ( not ( = ?auto_1160 ?auto_1162 ) ) ( not ( = ?auto_1161 ?auto_1162 ) ) ( ON ?auto_1162 ?auto_1160 ) ( CLEAR ?auto_1162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1161 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1161 ?auto_1160 )
      ( MAKE-1PILE ?auto_1160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1167 - BLOCK
      ?auto_1168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1167 ) ( ON-TABLE ?auto_1167 ) ( not ( = ?auto_1167 ?auto_1168 ) ) ( ON-TABLE ?auto_1168 ) ( CLEAR ?auto_1168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1168 )
      ( MAKE-2PILE ?auto_1167 ?auto_1168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1169 - BLOCK
      ?auto_1170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1169 ?auto_1170 ) ) ( ON-TABLE ?auto_1170 ) ( CLEAR ?auto_1170 ) ( HOLDING ?auto_1169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1169 )
      ( MAKE-2PILE ?auto_1169 ?auto_1170 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1171 - BLOCK
      ?auto_1172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1171 ?auto_1172 ) ) ( ON-TABLE ?auto_1172 ) ( ON ?auto_1171 ?auto_1172 ) ( CLEAR ?auto_1171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1172 )
      ( MAKE-2PILE ?auto_1171 ?auto_1172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1175 - BLOCK
      ?auto_1176 - BLOCK
    )
    :vars
    (
      ?auto_1177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1175 ?auto_1176 ) ) ( ON-TABLE ?auto_1176 ) ( CLEAR ?auto_1176 ) ( ON ?auto_1175 ?auto_1177 ) ( CLEAR ?auto_1175 ) ( HAND-EMPTY ) ( not ( = ?auto_1175 ?auto_1177 ) ) ( not ( = ?auto_1176 ?auto_1177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1175 ?auto_1177 )
      ( MAKE-2PILE ?auto_1175 ?auto_1176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1178 - BLOCK
      ?auto_1179 - BLOCK
    )
    :vars
    (
      ?auto_1180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1178 ?auto_1179 ) ) ( ON ?auto_1178 ?auto_1180 ) ( CLEAR ?auto_1178 ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1180 ) ) ( HOLDING ?auto_1179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1179 )
      ( MAKE-2PILE ?auto_1178 ?auto_1179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1181 - BLOCK
      ?auto_1182 - BLOCK
    )
    :vars
    (
      ?auto_1183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1181 ?auto_1182 ) ) ( ON ?auto_1181 ?auto_1183 ) ( not ( = ?auto_1181 ?auto_1183 ) ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( ON ?auto_1182 ?auto_1181 ) ( CLEAR ?auto_1182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1183 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1183 ?auto_1181 )
      ( MAKE-2PILE ?auto_1181 ?auto_1182 ) )
  )

)

