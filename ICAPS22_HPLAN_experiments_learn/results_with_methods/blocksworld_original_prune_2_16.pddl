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
      ?auto_1186 - BLOCK
      ?auto_1187 - BLOCK
    )
    :vars
    (
      ?auto_1188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1188 ?auto_1187 ) ( CLEAR ?auto_1188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1186 ) ( ON ?auto_1187 ?auto_1186 ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1187 ?auto_1188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1188 ?auto_1187 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1190 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1190 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1190 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1191 - BLOCK
    )
    :vars
    (
      ?auto_1192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1191 ?auto_1192 ) ( CLEAR ?auto_1191 ) ( HAND-EMPTY ) ( not ( = ?auto_1191 ?auto_1192 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1191 ?auto_1192 )
      ( MAKE-1PILE ?auto_1191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1194 - BLOCK
    )
    :vars
    (
      ?auto_1195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1195 ?auto_1194 ) ( CLEAR ?auto_1195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1194 ) ( not ( = ?auto_1194 ?auto_1195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1195 ?auto_1194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1196 - BLOCK
    )
    :vars
    (
      ?auto_1197 - BLOCK
      ?auto_1198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1197 ?auto_1196 ) ( CLEAR ?auto_1197 ) ( ON-TABLE ?auto_1196 ) ( not ( = ?auto_1196 ?auto_1197 ) ) ( HOLDING ?auto_1198 ) ( not ( = ?auto_1196 ?auto_1198 ) ) ( not ( = ?auto_1197 ?auto_1198 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1198 )
      ( MAKE-1PILE ?auto_1196 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1199 - BLOCK
    )
    :vars
    (
      ?auto_1200 - BLOCK
      ?auto_1201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1200 ?auto_1199 ) ( ON-TABLE ?auto_1199 ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( not ( = ?auto_1199 ?auto_1201 ) ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( ON ?auto_1201 ?auto_1200 ) ( CLEAR ?auto_1201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1199 ?auto_1200 )
      ( MAKE-1PILE ?auto_1199 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1204 - BLOCK
      ?auto_1205 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1205 ) ( CLEAR ?auto_1204 ) ( ON-TABLE ?auto_1204 ) ( not ( = ?auto_1204 ?auto_1205 ) ) )
    :subtasks
    ( ( !STACK ?auto_1205 ?auto_1204 ) )
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
    ( and ( CLEAR ?auto_1206 ) ( ON-TABLE ?auto_1206 ) ( not ( = ?auto_1206 ?auto_1207 ) ) ( ON ?auto_1207 ?auto_1208 ) ( CLEAR ?auto_1207 ) ( HAND-EMPTY ) ( not ( = ?auto_1206 ?auto_1208 ) ) ( not ( = ?auto_1207 ?auto_1208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1207 ?auto_1208 )
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
    ( and ( not ( = ?auto_1209 ?auto_1210 ) ) ( ON ?auto_1210 ?auto_1211 ) ( CLEAR ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1211 ) ) ( not ( = ?auto_1210 ?auto_1211 ) ) ( HOLDING ?auto_1209 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1209 )
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
    ( and ( not ( = ?auto_1212 ?auto_1213 ) ) ( ON ?auto_1213 ?auto_1214 ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( ON ?auto_1212 ?auto_1213 ) ( CLEAR ?auto_1212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1214 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1214 ?auto_1213 )
      ( MAKE-2PILE ?auto_1212 ?auto_1213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1231 - BLOCK
    )
    :vars
    (
      ?auto_1232 - BLOCK
      ?auto_1233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1231 ?auto_1232 ) ( CLEAR ?auto_1231 ) ( not ( = ?auto_1231 ?auto_1232 ) ) ( HOLDING ?auto_1233 ) ( not ( = ?auto_1231 ?auto_1233 ) ) ( not ( = ?auto_1232 ?auto_1233 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1233 )
      ( MAKE-1PILE ?auto_1231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1234 - BLOCK
    )
    :vars
    (
      ?auto_1235 - BLOCK
      ?auto_1236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1234 ?auto_1235 ) ( not ( = ?auto_1234 ?auto_1235 ) ) ( not ( = ?auto_1234 ?auto_1236 ) ) ( not ( = ?auto_1235 ?auto_1236 ) ) ( ON ?auto_1236 ?auto_1234 ) ( CLEAR ?auto_1236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1235 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1235 ?auto_1234 )
      ( MAKE-1PILE ?auto_1234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1241 - BLOCK
      ?auto_1242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1241 ) ( ON-TABLE ?auto_1241 ) ( not ( = ?auto_1241 ?auto_1242 ) ) ( ON-TABLE ?auto_1242 ) ( CLEAR ?auto_1242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1242 )
      ( MAKE-2PILE ?auto_1241 ?auto_1242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1243 - BLOCK
      ?auto_1244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1243 ?auto_1244 ) ) ( ON-TABLE ?auto_1244 ) ( CLEAR ?auto_1244 ) ( HOLDING ?auto_1243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1243 )
      ( MAKE-2PILE ?auto_1243 ?auto_1244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1245 - BLOCK
      ?auto_1246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1245 ?auto_1246 ) ) ( ON-TABLE ?auto_1246 ) ( ON ?auto_1245 ?auto_1246 ) ( CLEAR ?auto_1245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1246 )
      ( MAKE-2PILE ?auto_1245 ?auto_1246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1249 - BLOCK
      ?auto_1250 - BLOCK
    )
    :vars
    (
      ?auto_1251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1249 ?auto_1250 ) ) ( ON-TABLE ?auto_1250 ) ( CLEAR ?auto_1250 ) ( ON ?auto_1249 ?auto_1251 ) ( CLEAR ?auto_1249 ) ( HAND-EMPTY ) ( not ( = ?auto_1249 ?auto_1251 ) ) ( not ( = ?auto_1250 ?auto_1251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1249 ?auto_1251 )
      ( MAKE-2PILE ?auto_1249 ?auto_1250 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1252 - BLOCK
      ?auto_1253 - BLOCK
    )
    :vars
    (
      ?auto_1254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1252 ?auto_1253 ) ) ( ON ?auto_1252 ?auto_1254 ) ( CLEAR ?auto_1252 ) ( not ( = ?auto_1252 ?auto_1254 ) ) ( not ( = ?auto_1253 ?auto_1254 ) ) ( HOLDING ?auto_1253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1253 )
      ( MAKE-2PILE ?auto_1252 ?auto_1253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1255 - BLOCK
      ?auto_1256 - BLOCK
    )
    :vars
    (
      ?auto_1257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1255 ?auto_1256 ) ) ( ON ?auto_1255 ?auto_1257 ) ( not ( = ?auto_1255 ?auto_1257 ) ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( ON ?auto_1256 ?auto_1255 ) ( CLEAR ?auto_1256 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1257 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1257 ?auto_1255 )
      ( MAKE-2PILE ?auto_1255 ?auto_1256 ) )
  )

)

