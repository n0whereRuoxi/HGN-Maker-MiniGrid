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
      ?auto_1136 - BLOCK
      ?auto_1137 - BLOCK
    )
    :vars
    (
      ?auto_1138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1138 ?auto_1137 ) ( CLEAR ?auto_1138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1136 ) ( ON ?auto_1137 ?auto_1136 ) ( not ( = ?auto_1136 ?auto_1137 ) ) ( not ( = ?auto_1136 ?auto_1138 ) ) ( not ( = ?auto_1137 ?auto_1138 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1138 ?auto_1137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1140 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1140 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1140 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1141 - BLOCK
    )
    :vars
    (
      ?auto_1142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1141 ?auto_1142 ) ( CLEAR ?auto_1141 ) ( HAND-EMPTY ) ( not ( = ?auto_1141 ?auto_1142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1141 ?auto_1142 )
      ( MAKE-1PILE ?auto_1141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1144 - BLOCK
    )
    :vars
    (
      ?auto_1145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1145 ?auto_1144 ) ( CLEAR ?auto_1145 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1144 ) ( not ( = ?auto_1144 ?auto_1145 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1145 ?auto_1144 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1146 - BLOCK
    )
    :vars
    (
      ?auto_1147 - BLOCK
      ?auto_1148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1147 ?auto_1146 ) ( CLEAR ?auto_1147 ) ( ON-TABLE ?auto_1146 ) ( not ( = ?auto_1146 ?auto_1147 ) ) ( HOLDING ?auto_1148 ) ( not ( = ?auto_1146 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1148 )
      ( MAKE-1PILE ?auto_1146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1149 - BLOCK
    )
    :vars
    (
      ?auto_1151 - BLOCK
      ?auto_1150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1151 ?auto_1149 ) ( ON-TABLE ?auto_1149 ) ( not ( = ?auto_1149 ?auto_1151 ) ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( not ( = ?auto_1151 ?auto_1150 ) ) ( ON ?auto_1150 ?auto_1151 ) ( CLEAR ?auto_1150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1149 ?auto_1151 )
      ( MAKE-1PILE ?auto_1149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1154 - BLOCK
      ?auto_1155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1155 ) ( CLEAR ?auto_1154 ) ( ON-TABLE ?auto_1154 ) ( not ( = ?auto_1154 ?auto_1155 ) ) )
    :subtasks
    ( ( !STACK ?auto_1155 ?auto_1154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1156 - BLOCK
      ?auto_1157 - BLOCK
    )
    :vars
    (
      ?auto_1158 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1156 ) ( ON-TABLE ?auto_1156 ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( ON ?auto_1157 ?auto_1158 ) ( CLEAR ?auto_1157 ) ( HAND-EMPTY ) ( not ( = ?auto_1156 ?auto_1158 ) ) ( not ( = ?auto_1157 ?auto_1158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1157 ?auto_1158 )
      ( MAKE-2PILE ?auto_1156 ?auto_1157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1159 - BLOCK
      ?auto_1160 - BLOCK
    )
    :vars
    (
      ?auto_1161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1159 ?auto_1160 ) ) ( ON ?auto_1160 ?auto_1161 ) ( CLEAR ?auto_1160 ) ( not ( = ?auto_1159 ?auto_1161 ) ) ( not ( = ?auto_1160 ?auto_1161 ) ) ( HOLDING ?auto_1159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1159 )
      ( MAKE-2PILE ?auto_1159 ?auto_1160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1162 - BLOCK
      ?auto_1163 - BLOCK
    )
    :vars
    (
      ?auto_1164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1162 ?auto_1163 ) ) ( ON ?auto_1163 ?auto_1164 ) ( not ( = ?auto_1162 ?auto_1164 ) ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( ON ?auto_1162 ?auto_1163 ) ( CLEAR ?auto_1162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1164 ?auto_1163 )
      ( MAKE-2PILE ?auto_1162 ?auto_1163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1166 - BLOCK
    )
    :vars
    (
      ?auto_1167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1167 ?auto_1166 ) ( CLEAR ?auto_1167 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1166 ) ( not ( = ?auto_1166 ?auto_1167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1167 ?auto_1166 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1173 - BLOCK
    )
    :vars
    (
      ?auto_1174 - BLOCK
      ?auto_1175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1173 ?auto_1174 ) ) ( ON ?auto_1174 ?auto_1175 ) ( CLEAR ?auto_1174 ) ( not ( = ?auto_1173 ?auto_1175 ) ) ( not ( = ?auto_1174 ?auto_1175 ) ) ( HOLDING ?auto_1173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1173 ?auto_1174 )
      ( MAKE-1PILE ?auto_1173 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1176 - BLOCK
    )
    :vars
    (
      ?auto_1177 - BLOCK
      ?auto_1178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1176 ?auto_1177 ) ) ( ON ?auto_1177 ?auto_1178 ) ( not ( = ?auto_1176 ?auto_1178 ) ) ( not ( = ?auto_1177 ?auto_1178 ) ) ( ON ?auto_1176 ?auto_1177 ) ( CLEAR ?auto_1176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1178 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1178 ?auto_1177 )
      ( MAKE-1PILE ?auto_1176 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1180 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1180 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1180 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1181 - BLOCK
    )
    :vars
    (
      ?auto_1182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1181 ?auto_1182 ) ( CLEAR ?auto_1181 ) ( HAND-EMPTY ) ( not ( = ?auto_1181 ?auto_1182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1181 ?auto_1182 )
      ( MAKE-1PILE ?auto_1181 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1183 - BLOCK
    )
    :vars
    (
      ?auto_1184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1183 ?auto_1184 ) ) ( HOLDING ?auto_1183 ) ( CLEAR ?auto_1184 ) ( ON-TABLE ?auto_1184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1184 ?auto_1183 )
      ( MAKE-1PILE ?auto_1183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1185 - BLOCK
    )
    :vars
    (
      ?auto_1186 - BLOCK
      ?auto_1187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1185 ?auto_1186 ) ) ( CLEAR ?auto_1186 ) ( ON-TABLE ?auto_1186 ) ( ON ?auto_1185 ?auto_1187 ) ( CLEAR ?auto_1185 ) ( HAND-EMPTY ) ( not ( = ?auto_1185 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1187 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1185 ?auto_1187 )
      ( MAKE-1PILE ?auto_1185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1188 - BLOCK
    )
    :vars
    (
      ?auto_1190 - BLOCK
      ?auto_1189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1188 ?auto_1190 ) ) ( ON ?auto_1188 ?auto_1189 ) ( CLEAR ?auto_1188 ) ( not ( = ?auto_1188 ?auto_1189 ) ) ( not ( = ?auto_1190 ?auto_1189 ) ) ( HOLDING ?auto_1190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1190 )
      ( MAKE-1PILE ?auto_1188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1191 - BLOCK
    )
    :vars
    (
      ?auto_1193 - BLOCK
      ?auto_1192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1191 ?auto_1193 ) ) ( ON ?auto_1191 ?auto_1192 ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( not ( = ?auto_1193 ?auto_1192 ) ) ( ON ?auto_1193 ?auto_1191 ) ( CLEAR ?auto_1193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1192 ?auto_1191 )
      ( MAKE-1PILE ?auto_1191 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1196 - BLOCK
      ?auto_1197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1197 ) ( CLEAR ?auto_1196 ) ( ON-TABLE ?auto_1196 ) ( not ( = ?auto_1196 ?auto_1197 ) ) )
    :subtasks
    ( ( !STACK ?auto_1197 ?auto_1196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1198 - BLOCK
      ?auto_1199 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1198 ) ( ON-TABLE ?auto_1198 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( ON-TABLE ?auto_1199 ) ( CLEAR ?auto_1199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1199 )
      ( MAKE-2PILE ?auto_1198 ?auto_1199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1200 - BLOCK
      ?auto_1201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1200 ?auto_1201 ) ) ( ON-TABLE ?auto_1201 ) ( CLEAR ?auto_1201 ) ( HOLDING ?auto_1200 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1200 )
      ( MAKE-2PILE ?auto_1200 ?auto_1201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1202 - BLOCK
      ?auto_1203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1202 ?auto_1203 ) ) ( ON-TABLE ?auto_1203 ) ( ON ?auto_1202 ?auto_1203 ) ( CLEAR ?auto_1202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1203 )
      ( MAKE-2PILE ?auto_1202 ?auto_1203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1204 - BLOCK
      ?auto_1205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1204 ?auto_1205 ) ) ( ON-TABLE ?auto_1205 ) ( HOLDING ?auto_1204 ) ( CLEAR ?auto_1205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1205 ?auto_1204 )
      ( MAKE-2PILE ?auto_1204 ?auto_1205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1206 - BLOCK
      ?auto_1207 - BLOCK
    )
    :vars
    (
      ?auto_1208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1206 ?auto_1207 ) ) ( ON-TABLE ?auto_1207 ) ( CLEAR ?auto_1207 ) ( ON ?auto_1206 ?auto_1208 ) ( CLEAR ?auto_1206 ) ( HAND-EMPTY ) ( not ( = ?auto_1206 ?auto_1208 ) ) ( not ( = ?auto_1207 ?auto_1208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1206 ?auto_1208 )
      ( MAKE-2PILE ?auto_1206 ?auto_1207 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1209 - BLOCK
      ?auto_1210 - BLOCK
    )
    :vars
    (
      ?auto_1211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1209 ?auto_1210 ) ) ( ON ?auto_1209 ?auto_1211 ) ( CLEAR ?auto_1209 ) ( not ( = ?auto_1209 ?auto_1211 ) ) ( not ( = ?auto_1210 ?auto_1211 ) ) ( HOLDING ?auto_1210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1210 )
      ( MAKE-2PILE ?auto_1209 ?auto_1210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1212 - BLOCK
      ?auto_1213 - BLOCK
    )
    :vars
    (
      ?auto_1214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1212 ?auto_1213 ) ) ( ON ?auto_1212 ?auto_1214 ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( ON ?auto_1213 ?auto_1212 ) ( CLEAR ?auto_1213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1214 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1214 ?auto_1212 )
      ( MAKE-2PILE ?auto_1212 ?auto_1213 ) )
  )

)

