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
      ?auto_1157 - BLOCK
    )
    :vars
    (
      ?auto_1158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1157 ?auto_1158 ) ( CLEAR ?auto_1157 ) ( HAND-EMPTY ) ( not ( = ?auto_1157 ?auto_1158 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1157 ?auto_1158 )
      ( !PUTDOWN ?auto_1157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1160 - BLOCK
    )
    :vars
    (
      ?auto_1161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1160 ?auto_1161 ) ( CLEAR ?auto_1160 ) ( HAND-EMPTY ) ( not ( = ?auto_1160 ?auto_1161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1160 ?auto_1161 )
      ( !PUTDOWN ?auto_1160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1164 - BLOCK
      ?auto_1165 - BLOCK
    )
    :vars
    (
      ?auto_1166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1164 ) ( ON ?auto_1165 ?auto_1166 ) ( CLEAR ?auto_1165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1164 ) ( not ( = ?auto_1164 ?auto_1165 ) ) ( not ( = ?auto_1164 ?auto_1166 ) ) ( not ( = ?auto_1165 ?auto_1166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1165 ?auto_1166 )
      ( !STACK ?auto_1165 ?auto_1164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1169 - BLOCK
      ?auto_1170 - BLOCK
    )
    :vars
    (
      ?auto_1171 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1169 ) ( ON ?auto_1170 ?auto_1171 ) ( CLEAR ?auto_1170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1169 ) ( not ( = ?auto_1169 ?auto_1170 ) ) ( not ( = ?auto_1169 ?auto_1171 ) ) ( not ( = ?auto_1170 ?auto_1171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1170 ?auto_1171 )
      ( !STACK ?auto_1170 ?auto_1169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1174 - BLOCK
      ?auto_1175 - BLOCK
    )
    :vars
    (
      ?auto_1176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1175 ?auto_1176 ) ( not ( = ?auto_1174 ?auto_1175 ) ) ( not ( = ?auto_1174 ?auto_1176 ) ) ( not ( = ?auto_1175 ?auto_1176 ) ) ( ON ?auto_1174 ?auto_1175 ) ( CLEAR ?auto_1174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1174 )
      ( MAKE-2PILE ?auto_1174 ?auto_1175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1179 - BLOCK
      ?auto_1180 - BLOCK
    )
    :vars
    (
      ?auto_1181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1180 ?auto_1181 ) ( not ( = ?auto_1179 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( not ( = ?auto_1180 ?auto_1181 ) ) ( ON ?auto_1179 ?auto_1180 ) ( CLEAR ?auto_1179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1179 )
      ( MAKE-2PILE ?auto_1179 ?auto_1180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1185 - BLOCK
      ?auto_1186 - BLOCK
      ?auto_1187 - BLOCK
    )
    :vars
    (
      ?auto_1188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1186 ) ( ON ?auto_1187 ?auto_1188 ) ( CLEAR ?auto_1187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1185 ) ( ON ?auto_1186 ?auto_1185 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( not ( = ?auto_1185 ?auto_1187 ) ) ( not ( = ?auto_1185 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1187 ?auto_1188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1187 ?auto_1188 )
      ( !STACK ?auto_1187 ?auto_1186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1192 - BLOCK
      ?auto_1193 - BLOCK
      ?auto_1194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1193 ) ( ON-TABLE ?auto_1194 ) ( CLEAR ?auto_1194 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1192 ) ( ON ?auto_1193 ?auto_1192 ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( not ( = ?auto_1192 ?auto_1194 ) ) ( not ( = ?auto_1193 ?auto_1194 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1194 )
      ( !STACK ?auto_1194 ?auto_1193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1198 - BLOCK
      ?auto_1199 - BLOCK
      ?auto_1200 - BLOCK
    )
    :vars
    (
      ?auto_1201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1200 ?auto_1201 ) ( ON-TABLE ?auto_1198 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( not ( = ?auto_1198 ?auto_1200 ) ) ( not ( = ?auto_1198 ?auto_1201 ) ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( not ( = ?auto_1199 ?auto_1201 ) ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( CLEAR ?auto_1198 ) ( ON ?auto_1199 ?auto_1200 ) ( CLEAR ?auto_1199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1198 ?auto_1199 )
      ( MAKE-3PILE ?auto_1198 ?auto_1199 ?auto_1200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1205 - BLOCK
      ?auto_1206 - BLOCK
      ?auto_1207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1207 ) ( ON-TABLE ?auto_1205 ) ( not ( = ?auto_1205 ?auto_1206 ) ) ( not ( = ?auto_1205 ?auto_1207 ) ) ( not ( = ?auto_1206 ?auto_1207 ) ) ( CLEAR ?auto_1205 ) ( ON ?auto_1206 ?auto_1207 ) ( CLEAR ?auto_1206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1205 ?auto_1206 )
      ( MAKE-3PILE ?auto_1205 ?auto_1206 ?auto_1207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1211 - BLOCK
      ?auto_1212 - BLOCK
      ?auto_1213 - BLOCK
    )
    :vars
    (
      ?auto_1214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1213 ?auto_1214 ) ( not ( = ?auto_1211 ?auto_1212 ) ) ( not ( = ?auto_1211 ?auto_1213 ) ) ( not ( = ?auto_1211 ?auto_1214 ) ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( ON ?auto_1212 ?auto_1213 ) ( ON ?auto_1211 ?auto_1212 ) ( CLEAR ?auto_1211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1211 )
      ( MAKE-3PILE ?auto_1211 ?auto_1212 ?auto_1213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1218 - BLOCK
      ?auto_1219 - BLOCK
      ?auto_1220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1220 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( ON ?auto_1219 ?auto_1220 ) ( ON ?auto_1218 ?auto_1219 ) ( CLEAR ?auto_1218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1218 )
      ( MAKE-3PILE ?auto_1218 ?auto_1219 ?auto_1220 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1224 - BLOCK
      ?auto_1225 - BLOCK
      ?auto_1226 - BLOCK
    )
    :vars
    (
      ?auto_1227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1224 ?auto_1225 ) ) ( not ( = ?auto_1224 ?auto_1226 ) ) ( not ( = ?auto_1225 ?auto_1226 ) ) ( ON ?auto_1224 ?auto_1227 ) ( not ( = ?auto_1226 ?auto_1227 ) ) ( not ( = ?auto_1225 ?auto_1227 ) ) ( not ( = ?auto_1224 ?auto_1227 ) ) ( ON ?auto_1225 ?auto_1224 ) ( ON ?auto_1226 ?auto_1225 ) ( CLEAR ?auto_1226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1226 ?auto_1225 ?auto_1224 )
      ( MAKE-3PILE ?auto_1224 ?auto_1225 ?auto_1226 ) )
  )

)

