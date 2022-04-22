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
      ?auto_665041 - BLOCK
    )
    :vars
    (
      ?auto_665042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665041 ?auto_665042 ) ( CLEAR ?auto_665041 ) ( HAND-EMPTY ) ( not ( = ?auto_665041 ?auto_665042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665041 ?auto_665042 )
      ( !PUTDOWN ?auto_665041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_665048 - BLOCK
      ?auto_665049 - BLOCK
    )
    :vars
    (
      ?auto_665050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665048 ) ( ON ?auto_665049 ?auto_665050 ) ( CLEAR ?auto_665049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665048 ) ( not ( = ?auto_665048 ?auto_665049 ) ) ( not ( = ?auto_665048 ?auto_665050 ) ) ( not ( = ?auto_665049 ?auto_665050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665049 ?auto_665050 )
      ( !STACK ?auto_665049 ?auto_665048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_665058 - BLOCK
      ?auto_665059 - BLOCK
    )
    :vars
    (
      ?auto_665060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665059 ?auto_665060 ) ( not ( = ?auto_665058 ?auto_665059 ) ) ( not ( = ?auto_665058 ?auto_665060 ) ) ( not ( = ?auto_665059 ?auto_665060 ) ) ( ON ?auto_665058 ?auto_665059 ) ( CLEAR ?auto_665058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665058 )
      ( MAKE-2PILE ?auto_665058 ?auto_665059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_665069 - BLOCK
      ?auto_665070 - BLOCK
      ?auto_665071 - BLOCK
    )
    :vars
    (
      ?auto_665072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665070 ) ( ON ?auto_665071 ?auto_665072 ) ( CLEAR ?auto_665071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665069 ) ( ON ?auto_665070 ?auto_665069 ) ( not ( = ?auto_665069 ?auto_665070 ) ) ( not ( = ?auto_665069 ?auto_665071 ) ) ( not ( = ?auto_665069 ?auto_665072 ) ) ( not ( = ?auto_665070 ?auto_665071 ) ) ( not ( = ?auto_665070 ?auto_665072 ) ) ( not ( = ?auto_665071 ?auto_665072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665071 ?auto_665072 )
      ( !STACK ?auto_665071 ?auto_665070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_665083 - BLOCK
      ?auto_665084 - BLOCK
      ?auto_665085 - BLOCK
    )
    :vars
    (
      ?auto_665086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665085 ?auto_665086 ) ( ON-TABLE ?auto_665083 ) ( not ( = ?auto_665083 ?auto_665084 ) ) ( not ( = ?auto_665083 ?auto_665085 ) ) ( not ( = ?auto_665083 ?auto_665086 ) ) ( not ( = ?auto_665084 ?auto_665085 ) ) ( not ( = ?auto_665084 ?auto_665086 ) ) ( not ( = ?auto_665085 ?auto_665086 ) ) ( CLEAR ?auto_665083 ) ( ON ?auto_665084 ?auto_665085 ) ( CLEAR ?auto_665084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665083 ?auto_665084 )
      ( MAKE-3PILE ?auto_665083 ?auto_665084 ?auto_665085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_665097 - BLOCK
      ?auto_665098 - BLOCK
      ?auto_665099 - BLOCK
    )
    :vars
    (
      ?auto_665100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665099 ?auto_665100 ) ( not ( = ?auto_665097 ?auto_665098 ) ) ( not ( = ?auto_665097 ?auto_665099 ) ) ( not ( = ?auto_665097 ?auto_665100 ) ) ( not ( = ?auto_665098 ?auto_665099 ) ) ( not ( = ?auto_665098 ?auto_665100 ) ) ( not ( = ?auto_665099 ?auto_665100 ) ) ( ON ?auto_665098 ?auto_665099 ) ( ON ?auto_665097 ?auto_665098 ) ( CLEAR ?auto_665097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665097 )
      ( MAKE-3PILE ?auto_665097 ?auto_665098 ?auto_665099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_665112 - BLOCK
      ?auto_665113 - BLOCK
      ?auto_665114 - BLOCK
      ?auto_665115 - BLOCK
    )
    :vars
    (
      ?auto_665116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665114 ) ( ON ?auto_665115 ?auto_665116 ) ( CLEAR ?auto_665115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665112 ) ( ON ?auto_665113 ?auto_665112 ) ( ON ?auto_665114 ?auto_665113 ) ( not ( = ?auto_665112 ?auto_665113 ) ) ( not ( = ?auto_665112 ?auto_665114 ) ) ( not ( = ?auto_665112 ?auto_665115 ) ) ( not ( = ?auto_665112 ?auto_665116 ) ) ( not ( = ?auto_665113 ?auto_665114 ) ) ( not ( = ?auto_665113 ?auto_665115 ) ) ( not ( = ?auto_665113 ?auto_665116 ) ) ( not ( = ?auto_665114 ?auto_665115 ) ) ( not ( = ?auto_665114 ?auto_665116 ) ) ( not ( = ?auto_665115 ?auto_665116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665115 ?auto_665116 )
      ( !STACK ?auto_665115 ?auto_665114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_665130 - BLOCK
      ?auto_665131 - BLOCK
      ?auto_665132 - BLOCK
      ?auto_665133 - BLOCK
    )
    :vars
    (
      ?auto_665134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665133 ?auto_665134 ) ( ON-TABLE ?auto_665130 ) ( ON ?auto_665131 ?auto_665130 ) ( not ( = ?auto_665130 ?auto_665131 ) ) ( not ( = ?auto_665130 ?auto_665132 ) ) ( not ( = ?auto_665130 ?auto_665133 ) ) ( not ( = ?auto_665130 ?auto_665134 ) ) ( not ( = ?auto_665131 ?auto_665132 ) ) ( not ( = ?auto_665131 ?auto_665133 ) ) ( not ( = ?auto_665131 ?auto_665134 ) ) ( not ( = ?auto_665132 ?auto_665133 ) ) ( not ( = ?auto_665132 ?auto_665134 ) ) ( not ( = ?auto_665133 ?auto_665134 ) ) ( CLEAR ?auto_665131 ) ( ON ?auto_665132 ?auto_665133 ) ( CLEAR ?auto_665132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_665130 ?auto_665131 ?auto_665132 )
      ( MAKE-4PILE ?auto_665130 ?auto_665131 ?auto_665132 ?auto_665133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_665148 - BLOCK
      ?auto_665149 - BLOCK
      ?auto_665150 - BLOCK
      ?auto_665151 - BLOCK
    )
    :vars
    (
      ?auto_665152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665151 ?auto_665152 ) ( ON-TABLE ?auto_665148 ) ( not ( = ?auto_665148 ?auto_665149 ) ) ( not ( = ?auto_665148 ?auto_665150 ) ) ( not ( = ?auto_665148 ?auto_665151 ) ) ( not ( = ?auto_665148 ?auto_665152 ) ) ( not ( = ?auto_665149 ?auto_665150 ) ) ( not ( = ?auto_665149 ?auto_665151 ) ) ( not ( = ?auto_665149 ?auto_665152 ) ) ( not ( = ?auto_665150 ?auto_665151 ) ) ( not ( = ?auto_665150 ?auto_665152 ) ) ( not ( = ?auto_665151 ?auto_665152 ) ) ( ON ?auto_665150 ?auto_665151 ) ( CLEAR ?auto_665148 ) ( ON ?auto_665149 ?auto_665150 ) ( CLEAR ?auto_665149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665148 ?auto_665149 )
      ( MAKE-4PILE ?auto_665148 ?auto_665149 ?auto_665150 ?auto_665151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_665166 - BLOCK
      ?auto_665167 - BLOCK
      ?auto_665168 - BLOCK
      ?auto_665169 - BLOCK
    )
    :vars
    (
      ?auto_665170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665169 ?auto_665170 ) ( not ( = ?auto_665166 ?auto_665167 ) ) ( not ( = ?auto_665166 ?auto_665168 ) ) ( not ( = ?auto_665166 ?auto_665169 ) ) ( not ( = ?auto_665166 ?auto_665170 ) ) ( not ( = ?auto_665167 ?auto_665168 ) ) ( not ( = ?auto_665167 ?auto_665169 ) ) ( not ( = ?auto_665167 ?auto_665170 ) ) ( not ( = ?auto_665168 ?auto_665169 ) ) ( not ( = ?auto_665168 ?auto_665170 ) ) ( not ( = ?auto_665169 ?auto_665170 ) ) ( ON ?auto_665168 ?auto_665169 ) ( ON ?auto_665167 ?auto_665168 ) ( ON ?auto_665166 ?auto_665167 ) ( CLEAR ?auto_665166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665166 )
      ( MAKE-4PILE ?auto_665166 ?auto_665167 ?auto_665168 ?auto_665169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_665185 - BLOCK
      ?auto_665186 - BLOCK
      ?auto_665187 - BLOCK
      ?auto_665188 - BLOCK
      ?auto_665189 - BLOCK
    )
    :vars
    (
      ?auto_665190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665188 ) ( ON ?auto_665189 ?auto_665190 ) ( CLEAR ?auto_665189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665185 ) ( ON ?auto_665186 ?auto_665185 ) ( ON ?auto_665187 ?auto_665186 ) ( ON ?auto_665188 ?auto_665187 ) ( not ( = ?auto_665185 ?auto_665186 ) ) ( not ( = ?auto_665185 ?auto_665187 ) ) ( not ( = ?auto_665185 ?auto_665188 ) ) ( not ( = ?auto_665185 ?auto_665189 ) ) ( not ( = ?auto_665185 ?auto_665190 ) ) ( not ( = ?auto_665186 ?auto_665187 ) ) ( not ( = ?auto_665186 ?auto_665188 ) ) ( not ( = ?auto_665186 ?auto_665189 ) ) ( not ( = ?auto_665186 ?auto_665190 ) ) ( not ( = ?auto_665187 ?auto_665188 ) ) ( not ( = ?auto_665187 ?auto_665189 ) ) ( not ( = ?auto_665187 ?auto_665190 ) ) ( not ( = ?auto_665188 ?auto_665189 ) ) ( not ( = ?auto_665188 ?auto_665190 ) ) ( not ( = ?auto_665189 ?auto_665190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665189 ?auto_665190 )
      ( !STACK ?auto_665189 ?auto_665188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_665207 - BLOCK
      ?auto_665208 - BLOCK
      ?auto_665209 - BLOCK
      ?auto_665210 - BLOCK
      ?auto_665211 - BLOCK
    )
    :vars
    (
      ?auto_665212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665211 ?auto_665212 ) ( ON-TABLE ?auto_665207 ) ( ON ?auto_665208 ?auto_665207 ) ( ON ?auto_665209 ?auto_665208 ) ( not ( = ?auto_665207 ?auto_665208 ) ) ( not ( = ?auto_665207 ?auto_665209 ) ) ( not ( = ?auto_665207 ?auto_665210 ) ) ( not ( = ?auto_665207 ?auto_665211 ) ) ( not ( = ?auto_665207 ?auto_665212 ) ) ( not ( = ?auto_665208 ?auto_665209 ) ) ( not ( = ?auto_665208 ?auto_665210 ) ) ( not ( = ?auto_665208 ?auto_665211 ) ) ( not ( = ?auto_665208 ?auto_665212 ) ) ( not ( = ?auto_665209 ?auto_665210 ) ) ( not ( = ?auto_665209 ?auto_665211 ) ) ( not ( = ?auto_665209 ?auto_665212 ) ) ( not ( = ?auto_665210 ?auto_665211 ) ) ( not ( = ?auto_665210 ?auto_665212 ) ) ( not ( = ?auto_665211 ?auto_665212 ) ) ( CLEAR ?auto_665209 ) ( ON ?auto_665210 ?auto_665211 ) ( CLEAR ?auto_665210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_665207 ?auto_665208 ?auto_665209 ?auto_665210 )
      ( MAKE-5PILE ?auto_665207 ?auto_665208 ?auto_665209 ?auto_665210 ?auto_665211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_665229 - BLOCK
      ?auto_665230 - BLOCK
      ?auto_665231 - BLOCK
      ?auto_665232 - BLOCK
      ?auto_665233 - BLOCK
    )
    :vars
    (
      ?auto_665234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665233 ?auto_665234 ) ( ON-TABLE ?auto_665229 ) ( ON ?auto_665230 ?auto_665229 ) ( not ( = ?auto_665229 ?auto_665230 ) ) ( not ( = ?auto_665229 ?auto_665231 ) ) ( not ( = ?auto_665229 ?auto_665232 ) ) ( not ( = ?auto_665229 ?auto_665233 ) ) ( not ( = ?auto_665229 ?auto_665234 ) ) ( not ( = ?auto_665230 ?auto_665231 ) ) ( not ( = ?auto_665230 ?auto_665232 ) ) ( not ( = ?auto_665230 ?auto_665233 ) ) ( not ( = ?auto_665230 ?auto_665234 ) ) ( not ( = ?auto_665231 ?auto_665232 ) ) ( not ( = ?auto_665231 ?auto_665233 ) ) ( not ( = ?auto_665231 ?auto_665234 ) ) ( not ( = ?auto_665232 ?auto_665233 ) ) ( not ( = ?auto_665232 ?auto_665234 ) ) ( not ( = ?auto_665233 ?auto_665234 ) ) ( ON ?auto_665232 ?auto_665233 ) ( CLEAR ?auto_665230 ) ( ON ?auto_665231 ?auto_665232 ) ( CLEAR ?auto_665231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_665229 ?auto_665230 ?auto_665231 )
      ( MAKE-5PILE ?auto_665229 ?auto_665230 ?auto_665231 ?auto_665232 ?auto_665233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_665251 - BLOCK
      ?auto_665252 - BLOCK
      ?auto_665253 - BLOCK
      ?auto_665254 - BLOCK
      ?auto_665255 - BLOCK
    )
    :vars
    (
      ?auto_665256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665255 ?auto_665256 ) ( ON-TABLE ?auto_665251 ) ( not ( = ?auto_665251 ?auto_665252 ) ) ( not ( = ?auto_665251 ?auto_665253 ) ) ( not ( = ?auto_665251 ?auto_665254 ) ) ( not ( = ?auto_665251 ?auto_665255 ) ) ( not ( = ?auto_665251 ?auto_665256 ) ) ( not ( = ?auto_665252 ?auto_665253 ) ) ( not ( = ?auto_665252 ?auto_665254 ) ) ( not ( = ?auto_665252 ?auto_665255 ) ) ( not ( = ?auto_665252 ?auto_665256 ) ) ( not ( = ?auto_665253 ?auto_665254 ) ) ( not ( = ?auto_665253 ?auto_665255 ) ) ( not ( = ?auto_665253 ?auto_665256 ) ) ( not ( = ?auto_665254 ?auto_665255 ) ) ( not ( = ?auto_665254 ?auto_665256 ) ) ( not ( = ?auto_665255 ?auto_665256 ) ) ( ON ?auto_665254 ?auto_665255 ) ( ON ?auto_665253 ?auto_665254 ) ( CLEAR ?auto_665251 ) ( ON ?auto_665252 ?auto_665253 ) ( CLEAR ?auto_665252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665251 ?auto_665252 )
      ( MAKE-5PILE ?auto_665251 ?auto_665252 ?auto_665253 ?auto_665254 ?auto_665255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_665273 - BLOCK
      ?auto_665274 - BLOCK
      ?auto_665275 - BLOCK
      ?auto_665276 - BLOCK
      ?auto_665277 - BLOCK
    )
    :vars
    (
      ?auto_665278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665277 ?auto_665278 ) ( not ( = ?auto_665273 ?auto_665274 ) ) ( not ( = ?auto_665273 ?auto_665275 ) ) ( not ( = ?auto_665273 ?auto_665276 ) ) ( not ( = ?auto_665273 ?auto_665277 ) ) ( not ( = ?auto_665273 ?auto_665278 ) ) ( not ( = ?auto_665274 ?auto_665275 ) ) ( not ( = ?auto_665274 ?auto_665276 ) ) ( not ( = ?auto_665274 ?auto_665277 ) ) ( not ( = ?auto_665274 ?auto_665278 ) ) ( not ( = ?auto_665275 ?auto_665276 ) ) ( not ( = ?auto_665275 ?auto_665277 ) ) ( not ( = ?auto_665275 ?auto_665278 ) ) ( not ( = ?auto_665276 ?auto_665277 ) ) ( not ( = ?auto_665276 ?auto_665278 ) ) ( not ( = ?auto_665277 ?auto_665278 ) ) ( ON ?auto_665276 ?auto_665277 ) ( ON ?auto_665275 ?auto_665276 ) ( ON ?auto_665274 ?auto_665275 ) ( ON ?auto_665273 ?auto_665274 ) ( CLEAR ?auto_665273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665273 )
      ( MAKE-5PILE ?auto_665273 ?auto_665274 ?auto_665275 ?auto_665276 ?auto_665277 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665296 - BLOCK
      ?auto_665297 - BLOCK
      ?auto_665298 - BLOCK
      ?auto_665299 - BLOCK
      ?auto_665300 - BLOCK
      ?auto_665301 - BLOCK
    )
    :vars
    (
      ?auto_665302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665300 ) ( ON ?auto_665301 ?auto_665302 ) ( CLEAR ?auto_665301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665296 ) ( ON ?auto_665297 ?auto_665296 ) ( ON ?auto_665298 ?auto_665297 ) ( ON ?auto_665299 ?auto_665298 ) ( ON ?auto_665300 ?auto_665299 ) ( not ( = ?auto_665296 ?auto_665297 ) ) ( not ( = ?auto_665296 ?auto_665298 ) ) ( not ( = ?auto_665296 ?auto_665299 ) ) ( not ( = ?auto_665296 ?auto_665300 ) ) ( not ( = ?auto_665296 ?auto_665301 ) ) ( not ( = ?auto_665296 ?auto_665302 ) ) ( not ( = ?auto_665297 ?auto_665298 ) ) ( not ( = ?auto_665297 ?auto_665299 ) ) ( not ( = ?auto_665297 ?auto_665300 ) ) ( not ( = ?auto_665297 ?auto_665301 ) ) ( not ( = ?auto_665297 ?auto_665302 ) ) ( not ( = ?auto_665298 ?auto_665299 ) ) ( not ( = ?auto_665298 ?auto_665300 ) ) ( not ( = ?auto_665298 ?auto_665301 ) ) ( not ( = ?auto_665298 ?auto_665302 ) ) ( not ( = ?auto_665299 ?auto_665300 ) ) ( not ( = ?auto_665299 ?auto_665301 ) ) ( not ( = ?auto_665299 ?auto_665302 ) ) ( not ( = ?auto_665300 ?auto_665301 ) ) ( not ( = ?auto_665300 ?auto_665302 ) ) ( not ( = ?auto_665301 ?auto_665302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665301 ?auto_665302 )
      ( !STACK ?auto_665301 ?auto_665300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665322 - BLOCK
      ?auto_665323 - BLOCK
      ?auto_665324 - BLOCK
      ?auto_665325 - BLOCK
      ?auto_665326 - BLOCK
      ?auto_665327 - BLOCK
    )
    :vars
    (
      ?auto_665328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665327 ?auto_665328 ) ( ON-TABLE ?auto_665322 ) ( ON ?auto_665323 ?auto_665322 ) ( ON ?auto_665324 ?auto_665323 ) ( ON ?auto_665325 ?auto_665324 ) ( not ( = ?auto_665322 ?auto_665323 ) ) ( not ( = ?auto_665322 ?auto_665324 ) ) ( not ( = ?auto_665322 ?auto_665325 ) ) ( not ( = ?auto_665322 ?auto_665326 ) ) ( not ( = ?auto_665322 ?auto_665327 ) ) ( not ( = ?auto_665322 ?auto_665328 ) ) ( not ( = ?auto_665323 ?auto_665324 ) ) ( not ( = ?auto_665323 ?auto_665325 ) ) ( not ( = ?auto_665323 ?auto_665326 ) ) ( not ( = ?auto_665323 ?auto_665327 ) ) ( not ( = ?auto_665323 ?auto_665328 ) ) ( not ( = ?auto_665324 ?auto_665325 ) ) ( not ( = ?auto_665324 ?auto_665326 ) ) ( not ( = ?auto_665324 ?auto_665327 ) ) ( not ( = ?auto_665324 ?auto_665328 ) ) ( not ( = ?auto_665325 ?auto_665326 ) ) ( not ( = ?auto_665325 ?auto_665327 ) ) ( not ( = ?auto_665325 ?auto_665328 ) ) ( not ( = ?auto_665326 ?auto_665327 ) ) ( not ( = ?auto_665326 ?auto_665328 ) ) ( not ( = ?auto_665327 ?auto_665328 ) ) ( CLEAR ?auto_665325 ) ( ON ?auto_665326 ?auto_665327 ) ( CLEAR ?auto_665326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_665322 ?auto_665323 ?auto_665324 ?auto_665325 ?auto_665326 )
      ( MAKE-6PILE ?auto_665322 ?auto_665323 ?auto_665324 ?auto_665325 ?auto_665326 ?auto_665327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665348 - BLOCK
      ?auto_665349 - BLOCK
      ?auto_665350 - BLOCK
      ?auto_665351 - BLOCK
      ?auto_665352 - BLOCK
      ?auto_665353 - BLOCK
    )
    :vars
    (
      ?auto_665354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665353 ?auto_665354 ) ( ON-TABLE ?auto_665348 ) ( ON ?auto_665349 ?auto_665348 ) ( ON ?auto_665350 ?auto_665349 ) ( not ( = ?auto_665348 ?auto_665349 ) ) ( not ( = ?auto_665348 ?auto_665350 ) ) ( not ( = ?auto_665348 ?auto_665351 ) ) ( not ( = ?auto_665348 ?auto_665352 ) ) ( not ( = ?auto_665348 ?auto_665353 ) ) ( not ( = ?auto_665348 ?auto_665354 ) ) ( not ( = ?auto_665349 ?auto_665350 ) ) ( not ( = ?auto_665349 ?auto_665351 ) ) ( not ( = ?auto_665349 ?auto_665352 ) ) ( not ( = ?auto_665349 ?auto_665353 ) ) ( not ( = ?auto_665349 ?auto_665354 ) ) ( not ( = ?auto_665350 ?auto_665351 ) ) ( not ( = ?auto_665350 ?auto_665352 ) ) ( not ( = ?auto_665350 ?auto_665353 ) ) ( not ( = ?auto_665350 ?auto_665354 ) ) ( not ( = ?auto_665351 ?auto_665352 ) ) ( not ( = ?auto_665351 ?auto_665353 ) ) ( not ( = ?auto_665351 ?auto_665354 ) ) ( not ( = ?auto_665352 ?auto_665353 ) ) ( not ( = ?auto_665352 ?auto_665354 ) ) ( not ( = ?auto_665353 ?auto_665354 ) ) ( ON ?auto_665352 ?auto_665353 ) ( CLEAR ?auto_665350 ) ( ON ?auto_665351 ?auto_665352 ) ( CLEAR ?auto_665351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_665348 ?auto_665349 ?auto_665350 ?auto_665351 )
      ( MAKE-6PILE ?auto_665348 ?auto_665349 ?auto_665350 ?auto_665351 ?auto_665352 ?auto_665353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665374 - BLOCK
      ?auto_665375 - BLOCK
      ?auto_665376 - BLOCK
      ?auto_665377 - BLOCK
      ?auto_665378 - BLOCK
      ?auto_665379 - BLOCK
    )
    :vars
    (
      ?auto_665380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665379 ?auto_665380 ) ( ON-TABLE ?auto_665374 ) ( ON ?auto_665375 ?auto_665374 ) ( not ( = ?auto_665374 ?auto_665375 ) ) ( not ( = ?auto_665374 ?auto_665376 ) ) ( not ( = ?auto_665374 ?auto_665377 ) ) ( not ( = ?auto_665374 ?auto_665378 ) ) ( not ( = ?auto_665374 ?auto_665379 ) ) ( not ( = ?auto_665374 ?auto_665380 ) ) ( not ( = ?auto_665375 ?auto_665376 ) ) ( not ( = ?auto_665375 ?auto_665377 ) ) ( not ( = ?auto_665375 ?auto_665378 ) ) ( not ( = ?auto_665375 ?auto_665379 ) ) ( not ( = ?auto_665375 ?auto_665380 ) ) ( not ( = ?auto_665376 ?auto_665377 ) ) ( not ( = ?auto_665376 ?auto_665378 ) ) ( not ( = ?auto_665376 ?auto_665379 ) ) ( not ( = ?auto_665376 ?auto_665380 ) ) ( not ( = ?auto_665377 ?auto_665378 ) ) ( not ( = ?auto_665377 ?auto_665379 ) ) ( not ( = ?auto_665377 ?auto_665380 ) ) ( not ( = ?auto_665378 ?auto_665379 ) ) ( not ( = ?auto_665378 ?auto_665380 ) ) ( not ( = ?auto_665379 ?auto_665380 ) ) ( ON ?auto_665378 ?auto_665379 ) ( ON ?auto_665377 ?auto_665378 ) ( CLEAR ?auto_665375 ) ( ON ?auto_665376 ?auto_665377 ) ( CLEAR ?auto_665376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_665374 ?auto_665375 ?auto_665376 )
      ( MAKE-6PILE ?auto_665374 ?auto_665375 ?auto_665376 ?auto_665377 ?auto_665378 ?auto_665379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665400 - BLOCK
      ?auto_665401 - BLOCK
      ?auto_665402 - BLOCK
      ?auto_665403 - BLOCK
      ?auto_665404 - BLOCK
      ?auto_665405 - BLOCK
    )
    :vars
    (
      ?auto_665406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665405 ?auto_665406 ) ( ON-TABLE ?auto_665400 ) ( not ( = ?auto_665400 ?auto_665401 ) ) ( not ( = ?auto_665400 ?auto_665402 ) ) ( not ( = ?auto_665400 ?auto_665403 ) ) ( not ( = ?auto_665400 ?auto_665404 ) ) ( not ( = ?auto_665400 ?auto_665405 ) ) ( not ( = ?auto_665400 ?auto_665406 ) ) ( not ( = ?auto_665401 ?auto_665402 ) ) ( not ( = ?auto_665401 ?auto_665403 ) ) ( not ( = ?auto_665401 ?auto_665404 ) ) ( not ( = ?auto_665401 ?auto_665405 ) ) ( not ( = ?auto_665401 ?auto_665406 ) ) ( not ( = ?auto_665402 ?auto_665403 ) ) ( not ( = ?auto_665402 ?auto_665404 ) ) ( not ( = ?auto_665402 ?auto_665405 ) ) ( not ( = ?auto_665402 ?auto_665406 ) ) ( not ( = ?auto_665403 ?auto_665404 ) ) ( not ( = ?auto_665403 ?auto_665405 ) ) ( not ( = ?auto_665403 ?auto_665406 ) ) ( not ( = ?auto_665404 ?auto_665405 ) ) ( not ( = ?auto_665404 ?auto_665406 ) ) ( not ( = ?auto_665405 ?auto_665406 ) ) ( ON ?auto_665404 ?auto_665405 ) ( ON ?auto_665403 ?auto_665404 ) ( ON ?auto_665402 ?auto_665403 ) ( CLEAR ?auto_665400 ) ( ON ?auto_665401 ?auto_665402 ) ( CLEAR ?auto_665401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665400 ?auto_665401 )
      ( MAKE-6PILE ?auto_665400 ?auto_665401 ?auto_665402 ?auto_665403 ?auto_665404 ?auto_665405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_665426 - BLOCK
      ?auto_665427 - BLOCK
      ?auto_665428 - BLOCK
      ?auto_665429 - BLOCK
      ?auto_665430 - BLOCK
      ?auto_665431 - BLOCK
    )
    :vars
    (
      ?auto_665432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665431 ?auto_665432 ) ( not ( = ?auto_665426 ?auto_665427 ) ) ( not ( = ?auto_665426 ?auto_665428 ) ) ( not ( = ?auto_665426 ?auto_665429 ) ) ( not ( = ?auto_665426 ?auto_665430 ) ) ( not ( = ?auto_665426 ?auto_665431 ) ) ( not ( = ?auto_665426 ?auto_665432 ) ) ( not ( = ?auto_665427 ?auto_665428 ) ) ( not ( = ?auto_665427 ?auto_665429 ) ) ( not ( = ?auto_665427 ?auto_665430 ) ) ( not ( = ?auto_665427 ?auto_665431 ) ) ( not ( = ?auto_665427 ?auto_665432 ) ) ( not ( = ?auto_665428 ?auto_665429 ) ) ( not ( = ?auto_665428 ?auto_665430 ) ) ( not ( = ?auto_665428 ?auto_665431 ) ) ( not ( = ?auto_665428 ?auto_665432 ) ) ( not ( = ?auto_665429 ?auto_665430 ) ) ( not ( = ?auto_665429 ?auto_665431 ) ) ( not ( = ?auto_665429 ?auto_665432 ) ) ( not ( = ?auto_665430 ?auto_665431 ) ) ( not ( = ?auto_665430 ?auto_665432 ) ) ( not ( = ?auto_665431 ?auto_665432 ) ) ( ON ?auto_665430 ?auto_665431 ) ( ON ?auto_665429 ?auto_665430 ) ( ON ?auto_665428 ?auto_665429 ) ( ON ?auto_665427 ?auto_665428 ) ( ON ?auto_665426 ?auto_665427 ) ( CLEAR ?auto_665426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665426 )
      ( MAKE-6PILE ?auto_665426 ?auto_665427 ?auto_665428 ?auto_665429 ?auto_665430 ?auto_665431 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665453 - BLOCK
      ?auto_665454 - BLOCK
      ?auto_665455 - BLOCK
      ?auto_665456 - BLOCK
      ?auto_665457 - BLOCK
      ?auto_665458 - BLOCK
      ?auto_665459 - BLOCK
    )
    :vars
    (
      ?auto_665460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665458 ) ( ON ?auto_665459 ?auto_665460 ) ( CLEAR ?auto_665459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665453 ) ( ON ?auto_665454 ?auto_665453 ) ( ON ?auto_665455 ?auto_665454 ) ( ON ?auto_665456 ?auto_665455 ) ( ON ?auto_665457 ?auto_665456 ) ( ON ?auto_665458 ?auto_665457 ) ( not ( = ?auto_665453 ?auto_665454 ) ) ( not ( = ?auto_665453 ?auto_665455 ) ) ( not ( = ?auto_665453 ?auto_665456 ) ) ( not ( = ?auto_665453 ?auto_665457 ) ) ( not ( = ?auto_665453 ?auto_665458 ) ) ( not ( = ?auto_665453 ?auto_665459 ) ) ( not ( = ?auto_665453 ?auto_665460 ) ) ( not ( = ?auto_665454 ?auto_665455 ) ) ( not ( = ?auto_665454 ?auto_665456 ) ) ( not ( = ?auto_665454 ?auto_665457 ) ) ( not ( = ?auto_665454 ?auto_665458 ) ) ( not ( = ?auto_665454 ?auto_665459 ) ) ( not ( = ?auto_665454 ?auto_665460 ) ) ( not ( = ?auto_665455 ?auto_665456 ) ) ( not ( = ?auto_665455 ?auto_665457 ) ) ( not ( = ?auto_665455 ?auto_665458 ) ) ( not ( = ?auto_665455 ?auto_665459 ) ) ( not ( = ?auto_665455 ?auto_665460 ) ) ( not ( = ?auto_665456 ?auto_665457 ) ) ( not ( = ?auto_665456 ?auto_665458 ) ) ( not ( = ?auto_665456 ?auto_665459 ) ) ( not ( = ?auto_665456 ?auto_665460 ) ) ( not ( = ?auto_665457 ?auto_665458 ) ) ( not ( = ?auto_665457 ?auto_665459 ) ) ( not ( = ?auto_665457 ?auto_665460 ) ) ( not ( = ?auto_665458 ?auto_665459 ) ) ( not ( = ?auto_665458 ?auto_665460 ) ) ( not ( = ?auto_665459 ?auto_665460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665459 ?auto_665460 )
      ( !STACK ?auto_665459 ?auto_665458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665483 - BLOCK
      ?auto_665484 - BLOCK
      ?auto_665485 - BLOCK
      ?auto_665486 - BLOCK
      ?auto_665487 - BLOCK
      ?auto_665488 - BLOCK
      ?auto_665489 - BLOCK
    )
    :vars
    (
      ?auto_665490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665489 ?auto_665490 ) ( ON-TABLE ?auto_665483 ) ( ON ?auto_665484 ?auto_665483 ) ( ON ?auto_665485 ?auto_665484 ) ( ON ?auto_665486 ?auto_665485 ) ( ON ?auto_665487 ?auto_665486 ) ( not ( = ?auto_665483 ?auto_665484 ) ) ( not ( = ?auto_665483 ?auto_665485 ) ) ( not ( = ?auto_665483 ?auto_665486 ) ) ( not ( = ?auto_665483 ?auto_665487 ) ) ( not ( = ?auto_665483 ?auto_665488 ) ) ( not ( = ?auto_665483 ?auto_665489 ) ) ( not ( = ?auto_665483 ?auto_665490 ) ) ( not ( = ?auto_665484 ?auto_665485 ) ) ( not ( = ?auto_665484 ?auto_665486 ) ) ( not ( = ?auto_665484 ?auto_665487 ) ) ( not ( = ?auto_665484 ?auto_665488 ) ) ( not ( = ?auto_665484 ?auto_665489 ) ) ( not ( = ?auto_665484 ?auto_665490 ) ) ( not ( = ?auto_665485 ?auto_665486 ) ) ( not ( = ?auto_665485 ?auto_665487 ) ) ( not ( = ?auto_665485 ?auto_665488 ) ) ( not ( = ?auto_665485 ?auto_665489 ) ) ( not ( = ?auto_665485 ?auto_665490 ) ) ( not ( = ?auto_665486 ?auto_665487 ) ) ( not ( = ?auto_665486 ?auto_665488 ) ) ( not ( = ?auto_665486 ?auto_665489 ) ) ( not ( = ?auto_665486 ?auto_665490 ) ) ( not ( = ?auto_665487 ?auto_665488 ) ) ( not ( = ?auto_665487 ?auto_665489 ) ) ( not ( = ?auto_665487 ?auto_665490 ) ) ( not ( = ?auto_665488 ?auto_665489 ) ) ( not ( = ?auto_665488 ?auto_665490 ) ) ( not ( = ?auto_665489 ?auto_665490 ) ) ( CLEAR ?auto_665487 ) ( ON ?auto_665488 ?auto_665489 ) ( CLEAR ?auto_665488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_665483 ?auto_665484 ?auto_665485 ?auto_665486 ?auto_665487 ?auto_665488 )
      ( MAKE-7PILE ?auto_665483 ?auto_665484 ?auto_665485 ?auto_665486 ?auto_665487 ?auto_665488 ?auto_665489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665513 - BLOCK
      ?auto_665514 - BLOCK
      ?auto_665515 - BLOCK
      ?auto_665516 - BLOCK
      ?auto_665517 - BLOCK
      ?auto_665518 - BLOCK
      ?auto_665519 - BLOCK
    )
    :vars
    (
      ?auto_665520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665519 ?auto_665520 ) ( ON-TABLE ?auto_665513 ) ( ON ?auto_665514 ?auto_665513 ) ( ON ?auto_665515 ?auto_665514 ) ( ON ?auto_665516 ?auto_665515 ) ( not ( = ?auto_665513 ?auto_665514 ) ) ( not ( = ?auto_665513 ?auto_665515 ) ) ( not ( = ?auto_665513 ?auto_665516 ) ) ( not ( = ?auto_665513 ?auto_665517 ) ) ( not ( = ?auto_665513 ?auto_665518 ) ) ( not ( = ?auto_665513 ?auto_665519 ) ) ( not ( = ?auto_665513 ?auto_665520 ) ) ( not ( = ?auto_665514 ?auto_665515 ) ) ( not ( = ?auto_665514 ?auto_665516 ) ) ( not ( = ?auto_665514 ?auto_665517 ) ) ( not ( = ?auto_665514 ?auto_665518 ) ) ( not ( = ?auto_665514 ?auto_665519 ) ) ( not ( = ?auto_665514 ?auto_665520 ) ) ( not ( = ?auto_665515 ?auto_665516 ) ) ( not ( = ?auto_665515 ?auto_665517 ) ) ( not ( = ?auto_665515 ?auto_665518 ) ) ( not ( = ?auto_665515 ?auto_665519 ) ) ( not ( = ?auto_665515 ?auto_665520 ) ) ( not ( = ?auto_665516 ?auto_665517 ) ) ( not ( = ?auto_665516 ?auto_665518 ) ) ( not ( = ?auto_665516 ?auto_665519 ) ) ( not ( = ?auto_665516 ?auto_665520 ) ) ( not ( = ?auto_665517 ?auto_665518 ) ) ( not ( = ?auto_665517 ?auto_665519 ) ) ( not ( = ?auto_665517 ?auto_665520 ) ) ( not ( = ?auto_665518 ?auto_665519 ) ) ( not ( = ?auto_665518 ?auto_665520 ) ) ( not ( = ?auto_665519 ?auto_665520 ) ) ( ON ?auto_665518 ?auto_665519 ) ( CLEAR ?auto_665516 ) ( ON ?auto_665517 ?auto_665518 ) ( CLEAR ?auto_665517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_665513 ?auto_665514 ?auto_665515 ?auto_665516 ?auto_665517 )
      ( MAKE-7PILE ?auto_665513 ?auto_665514 ?auto_665515 ?auto_665516 ?auto_665517 ?auto_665518 ?auto_665519 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665543 - BLOCK
      ?auto_665544 - BLOCK
      ?auto_665545 - BLOCK
      ?auto_665546 - BLOCK
      ?auto_665547 - BLOCK
      ?auto_665548 - BLOCK
      ?auto_665549 - BLOCK
    )
    :vars
    (
      ?auto_665550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665549 ?auto_665550 ) ( ON-TABLE ?auto_665543 ) ( ON ?auto_665544 ?auto_665543 ) ( ON ?auto_665545 ?auto_665544 ) ( not ( = ?auto_665543 ?auto_665544 ) ) ( not ( = ?auto_665543 ?auto_665545 ) ) ( not ( = ?auto_665543 ?auto_665546 ) ) ( not ( = ?auto_665543 ?auto_665547 ) ) ( not ( = ?auto_665543 ?auto_665548 ) ) ( not ( = ?auto_665543 ?auto_665549 ) ) ( not ( = ?auto_665543 ?auto_665550 ) ) ( not ( = ?auto_665544 ?auto_665545 ) ) ( not ( = ?auto_665544 ?auto_665546 ) ) ( not ( = ?auto_665544 ?auto_665547 ) ) ( not ( = ?auto_665544 ?auto_665548 ) ) ( not ( = ?auto_665544 ?auto_665549 ) ) ( not ( = ?auto_665544 ?auto_665550 ) ) ( not ( = ?auto_665545 ?auto_665546 ) ) ( not ( = ?auto_665545 ?auto_665547 ) ) ( not ( = ?auto_665545 ?auto_665548 ) ) ( not ( = ?auto_665545 ?auto_665549 ) ) ( not ( = ?auto_665545 ?auto_665550 ) ) ( not ( = ?auto_665546 ?auto_665547 ) ) ( not ( = ?auto_665546 ?auto_665548 ) ) ( not ( = ?auto_665546 ?auto_665549 ) ) ( not ( = ?auto_665546 ?auto_665550 ) ) ( not ( = ?auto_665547 ?auto_665548 ) ) ( not ( = ?auto_665547 ?auto_665549 ) ) ( not ( = ?auto_665547 ?auto_665550 ) ) ( not ( = ?auto_665548 ?auto_665549 ) ) ( not ( = ?auto_665548 ?auto_665550 ) ) ( not ( = ?auto_665549 ?auto_665550 ) ) ( ON ?auto_665548 ?auto_665549 ) ( ON ?auto_665547 ?auto_665548 ) ( CLEAR ?auto_665545 ) ( ON ?auto_665546 ?auto_665547 ) ( CLEAR ?auto_665546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_665543 ?auto_665544 ?auto_665545 ?auto_665546 )
      ( MAKE-7PILE ?auto_665543 ?auto_665544 ?auto_665545 ?auto_665546 ?auto_665547 ?auto_665548 ?auto_665549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665573 - BLOCK
      ?auto_665574 - BLOCK
      ?auto_665575 - BLOCK
      ?auto_665576 - BLOCK
      ?auto_665577 - BLOCK
      ?auto_665578 - BLOCK
      ?auto_665579 - BLOCK
    )
    :vars
    (
      ?auto_665580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665579 ?auto_665580 ) ( ON-TABLE ?auto_665573 ) ( ON ?auto_665574 ?auto_665573 ) ( not ( = ?auto_665573 ?auto_665574 ) ) ( not ( = ?auto_665573 ?auto_665575 ) ) ( not ( = ?auto_665573 ?auto_665576 ) ) ( not ( = ?auto_665573 ?auto_665577 ) ) ( not ( = ?auto_665573 ?auto_665578 ) ) ( not ( = ?auto_665573 ?auto_665579 ) ) ( not ( = ?auto_665573 ?auto_665580 ) ) ( not ( = ?auto_665574 ?auto_665575 ) ) ( not ( = ?auto_665574 ?auto_665576 ) ) ( not ( = ?auto_665574 ?auto_665577 ) ) ( not ( = ?auto_665574 ?auto_665578 ) ) ( not ( = ?auto_665574 ?auto_665579 ) ) ( not ( = ?auto_665574 ?auto_665580 ) ) ( not ( = ?auto_665575 ?auto_665576 ) ) ( not ( = ?auto_665575 ?auto_665577 ) ) ( not ( = ?auto_665575 ?auto_665578 ) ) ( not ( = ?auto_665575 ?auto_665579 ) ) ( not ( = ?auto_665575 ?auto_665580 ) ) ( not ( = ?auto_665576 ?auto_665577 ) ) ( not ( = ?auto_665576 ?auto_665578 ) ) ( not ( = ?auto_665576 ?auto_665579 ) ) ( not ( = ?auto_665576 ?auto_665580 ) ) ( not ( = ?auto_665577 ?auto_665578 ) ) ( not ( = ?auto_665577 ?auto_665579 ) ) ( not ( = ?auto_665577 ?auto_665580 ) ) ( not ( = ?auto_665578 ?auto_665579 ) ) ( not ( = ?auto_665578 ?auto_665580 ) ) ( not ( = ?auto_665579 ?auto_665580 ) ) ( ON ?auto_665578 ?auto_665579 ) ( ON ?auto_665577 ?auto_665578 ) ( ON ?auto_665576 ?auto_665577 ) ( CLEAR ?auto_665574 ) ( ON ?auto_665575 ?auto_665576 ) ( CLEAR ?auto_665575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_665573 ?auto_665574 ?auto_665575 )
      ( MAKE-7PILE ?auto_665573 ?auto_665574 ?auto_665575 ?auto_665576 ?auto_665577 ?auto_665578 ?auto_665579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665603 - BLOCK
      ?auto_665604 - BLOCK
      ?auto_665605 - BLOCK
      ?auto_665606 - BLOCK
      ?auto_665607 - BLOCK
      ?auto_665608 - BLOCK
      ?auto_665609 - BLOCK
    )
    :vars
    (
      ?auto_665610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665609 ?auto_665610 ) ( ON-TABLE ?auto_665603 ) ( not ( = ?auto_665603 ?auto_665604 ) ) ( not ( = ?auto_665603 ?auto_665605 ) ) ( not ( = ?auto_665603 ?auto_665606 ) ) ( not ( = ?auto_665603 ?auto_665607 ) ) ( not ( = ?auto_665603 ?auto_665608 ) ) ( not ( = ?auto_665603 ?auto_665609 ) ) ( not ( = ?auto_665603 ?auto_665610 ) ) ( not ( = ?auto_665604 ?auto_665605 ) ) ( not ( = ?auto_665604 ?auto_665606 ) ) ( not ( = ?auto_665604 ?auto_665607 ) ) ( not ( = ?auto_665604 ?auto_665608 ) ) ( not ( = ?auto_665604 ?auto_665609 ) ) ( not ( = ?auto_665604 ?auto_665610 ) ) ( not ( = ?auto_665605 ?auto_665606 ) ) ( not ( = ?auto_665605 ?auto_665607 ) ) ( not ( = ?auto_665605 ?auto_665608 ) ) ( not ( = ?auto_665605 ?auto_665609 ) ) ( not ( = ?auto_665605 ?auto_665610 ) ) ( not ( = ?auto_665606 ?auto_665607 ) ) ( not ( = ?auto_665606 ?auto_665608 ) ) ( not ( = ?auto_665606 ?auto_665609 ) ) ( not ( = ?auto_665606 ?auto_665610 ) ) ( not ( = ?auto_665607 ?auto_665608 ) ) ( not ( = ?auto_665607 ?auto_665609 ) ) ( not ( = ?auto_665607 ?auto_665610 ) ) ( not ( = ?auto_665608 ?auto_665609 ) ) ( not ( = ?auto_665608 ?auto_665610 ) ) ( not ( = ?auto_665609 ?auto_665610 ) ) ( ON ?auto_665608 ?auto_665609 ) ( ON ?auto_665607 ?auto_665608 ) ( ON ?auto_665606 ?auto_665607 ) ( ON ?auto_665605 ?auto_665606 ) ( CLEAR ?auto_665603 ) ( ON ?auto_665604 ?auto_665605 ) ( CLEAR ?auto_665604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665603 ?auto_665604 )
      ( MAKE-7PILE ?auto_665603 ?auto_665604 ?auto_665605 ?auto_665606 ?auto_665607 ?auto_665608 ?auto_665609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_665633 - BLOCK
      ?auto_665634 - BLOCK
      ?auto_665635 - BLOCK
      ?auto_665636 - BLOCK
      ?auto_665637 - BLOCK
      ?auto_665638 - BLOCK
      ?auto_665639 - BLOCK
    )
    :vars
    (
      ?auto_665640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665639 ?auto_665640 ) ( not ( = ?auto_665633 ?auto_665634 ) ) ( not ( = ?auto_665633 ?auto_665635 ) ) ( not ( = ?auto_665633 ?auto_665636 ) ) ( not ( = ?auto_665633 ?auto_665637 ) ) ( not ( = ?auto_665633 ?auto_665638 ) ) ( not ( = ?auto_665633 ?auto_665639 ) ) ( not ( = ?auto_665633 ?auto_665640 ) ) ( not ( = ?auto_665634 ?auto_665635 ) ) ( not ( = ?auto_665634 ?auto_665636 ) ) ( not ( = ?auto_665634 ?auto_665637 ) ) ( not ( = ?auto_665634 ?auto_665638 ) ) ( not ( = ?auto_665634 ?auto_665639 ) ) ( not ( = ?auto_665634 ?auto_665640 ) ) ( not ( = ?auto_665635 ?auto_665636 ) ) ( not ( = ?auto_665635 ?auto_665637 ) ) ( not ( = ?auto_665635 ?auto_665638 ) ) ( not ( = ?auto_665635 ?auto_665639 ) ) ( not ( = ?auto_665635 ?auto_665640 ) ) ( not ( = ?auto_665636 ?auto_665637 ) ) ( not ( = ?auto_665636 ?auto_665638 ) ) ( not ( = ?auto_665636 ?auto_665639 ) ) ( not ( = ?auto_665636 ?auto_665640 ) ) ( not ( = ?auto_665637 ?auto_665638 ) ) ( not ( = ?auto_665637 ?auto_665639 ) ) ( not ( = ?auto_665637 ?auto_665640 ) ) ( not ( = ?auto_665638 ?auto_665639 ) ) ( not ( = ?auto_665638 ?auto_665640 ) ) ( not ( = ?auto_665639 ?auto_665640 ) ) ( ON ?auto_665638 ?auto_665639 ) ( ON ?auto_665637 ?auto_665638 ) ( ON ?auto_665636 ?auto_665637 ) ( ON ?auto_665635 ?auto_665636 ) ( ON ?auto_665634 ?auto_665635 ) ( ON ?auto_665633 ?auto_665634 ) ( CLEAR ?auto_665633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665633 )
      ( MAKE-7PILE ?auto_665633 ?auto_665634 ?auto_665635 ?auto_665636 ?auto_665637 ?auto_665638 ?auto_665639 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665664 - BLOCK
      ?auto_665665 - BLOCK
      ?auto_665666 - BLOCK
      ?auto_665667 - BLOCK
      ?auto_665668 - BLOCK
      ?auto_665669 - BLOCK
      ?auto_665670 - BLOCK
      ?auto_665671 - BLOCK
    )
    :vars
    (
      ?auto_665672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665670 ) ( ON ?auto_665671 ?auto_665672 ) ( CLEAR ?auto_665671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665664 ) ( ON ?auto_665665 ?auto_665664 ) ( ON ?auto_665666 ?auto_665665 ) ( ON ?auto_665667 ?auto_665666 ) ( ON ?auto_665668 ?auto_665667 ) ( ON ?auto_665669 ?auto_665668 ) ( ON ?auto_665670 ?auto_665669 ) ( not ( = ?auto_665664 ?auto_665665 ) ) ( not ( = ?auto_665664 ?auto_665666 ) ) ( not ( = ?auto_665664 ?auto_665667 ) ) ( not ( = ?auto_665664 ?auto_665668 ) ) ( not ( = ?auto_665664 ?auto_665669 ) ) ( not ( = ?auto_665664 ?auto_665670 ) ) ( not ( = ?auto_665664 ?auto_665671 ) ) ( not ( = ?auto_665664 ?auto_665672 ) ) ( not ( = ?auto_665665 ?auto_665666 ) ) ( not ( = ?auto_665665 ?auto_665667 ) ) ( not ( = ?auto_665665 ?auto_665668 ) ) ( not ( = ?auto_665665 ?auto_665669 ) ) ( not ( = ?auto_665665 ?auto_665670 ) ) ( not ( = ?auto_665665 ?auto_665671 ) ) ( not ( = ?auto_665665 ?auto_665672 ) ) ( not ( = ?auto_665666 ?auto_665667 ) ) ( not ( = ?auto_665666 ?auto_665668 ) ) ( not ( = ?auto_665666 ?auto_665669 ) ) ( not ( = ?auto_665666 ?auto_665670 ) ) ( not ( = ?auto_665666 ?auto_665671 ) ) ( not ( = ?auto_665666 ?auto_665672 ) ) ( not ( = ?auto_665667 ?auto_665668 ) ) ( not ( = ?auto_665667 ?auto_665669 ) ) ( not ( = ?auto_665667 ?auto_665670 ) ) ( not ( = ?auto_665667 ?auto_665671 ) ) ( not ( = ?auto_665667 ?auto_665672 ) ) ( not ( = ?auto_665668 ?auto_665669 ) ) ( not ( = ?auto_665668 ?auto_665670 ) ) ( not ( = ?auto_665668 ?auto_665671 ) ) ( not ( = ?auto_665668 ?auto_665672 ) ) ( not ( = ?auto_665669 ?auto_665670 ) ) ( not ( = ?auto_665669 ?auto_665671 ) ) ( not ( = ?auto_665669 ?auto_665672 ) ) ( not ( = ?auto_665670 ?auto_665671 ) ) ( not ( = ?auto_665670 ?auto_665672 ) ) ( not ( = ?auto_665671 ?auto_665672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665671 ?auto_665672 )
      ( !STACK ?auto_665671 ?auto_665670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665698 - BLOCK
      ?auto_665699 - BLOCK
      ?auto_665700 - BLOCK
      ?auto_665701 - BLOCK
      ?auto_665702 - BLOCK
      ?auto_665703 - BLOCK
      ?auto_665704 - BLOCK
      ?auto_665705 - BLOCK
    )
    :vars
    (
      ?auto_665706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665705 ?auto_665706 ) ( ON-TABLE ?auto_665698 ) ( ON ?auto_665699 ?auto_665698 ) ( ON ?auto_665700 ?auto_665699 ) ( ON ?auto_665701 ?auto_665700 ) ( ON ?auto_665702 ?auto_665701 ) ( ON ?auto_665703 ?auto_665702 ) ( not ( = ?auto_665698 ?auto_665699 ) ) ( not ( = ?auto_665698 ?auto_665700 ) ) ( not ( = ?auto_665698 ?auto_665701 ) ) ( not ( = ?auto_665698 ?auto_665702 ) ) ( not ( = ?auto_665698 ?auto_665703 ) ) ( not ( = ?auto_665698 ?auto_665704 ) ) ( not ( = ?auto_665698 ?auto_665705 ) ) ( not ( = ?auto_665698 ?auto_665706 ) ) ( not ( = ?auto_665699 ?auto_665700 ) ) ( not ( = ?auto_665699 ?auto_665701 ) ) ( not ( = ?auto_665699 ?auto_665702 ) ) ( not ( = ?auto_665699 ?auto_665703 ) ) ( not ( = ?auto_665699 ?auto_665704 ) ) ( not ( = ?auto_665699 ?auto_665705 ) ) ( not ( = ?auto_665699 ?auto_665706 ) ) ( not ( = ?auto_665700 ?auto_665701 ) ) ( not ( = ?auto_665700 ?auto_665702 ) ) ( not ( = ?auto_665700 ?auto_665703 ) ) ( not ( = ?auto_665700 ?auto_665704 ) ) ( not ( = ?auto_665700 ?auto_665705 ) ) ( not ( = ?auto_665700 ?auto_665706 ) ) ( not ( = ?auto_665701 ?auto_665702 ) ) ( not ( = ?auto_665701 ?auto_665703 ) ) ( not ( = ?auto_665701 ?auto_665704 ) ) ( not ( = ?auto_665701 ?auto_665705 ) ) ( not ( = ?auto_665701 ?auto_665706 ) ) ( not ( = ?auto_665702 ?auto_665703 ) ) ( not ( = ?auto_665702 ?auto_665704 ) ) ( not ( = ?auto_665702 ?auto_665705 ) ) ( not ( = ?auto_665702 ?auto_665706 ) ) ( not ( = ?auto_665703 ?auto_665704 ) ) ( not ( = ?auto_665703 ?auto_665705 ) ) ( not ( = ?auto_665703 ?auto_665706 ) ) ( not ( = ?auto_665704 ?auto_665705 ) ) ( not ( = ?auto_665704 ?auto_665706 ) ) ( not ( = ?auto_665705 ?auto_665706 ) ) ( CLEAR ?auto_665703 ) ( ON ?auto_665704 ?auto_665705 ) ( CLEAR ?auto_665704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_665698 ?auto_665699 ?auto_665700 ?auto_665701 ?auto_665702 ?auto_665703 ?auto_665704 )
      ( MAKE-8PILE ?auto_665698 ?auto_665699 ?auto_665700 ?auto_665701 ?auto_665702 ?auto_665703 ?auto_665704 ?auto_665705 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665732 - BLOCK
      ?auto_665733 - BLOCK
      ?auto_665734 - BLOCK
      ?auto_665735 - BLOCK
      ?auto_665736 - BLOCK
      ?auto_665737 - BLOCK
      ?auto_665738 - BLOCK
      ?auto_665739 - BLOCK
    )
    :vars
    (
      ?auto_665740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665739 ?auto_665740 ) ( ON-TABLE ?auto_665732 ) ( ON ?auto_665733 ?auto_665732 ) ( ON ?auto_665734 ?auto_665733 ) ( ON ?auto_665735 ?auto_665734 ) ( ON ?auto_665736 ?auto_665735 ) ( not ( = ?auto_665732 ?auto_665733 ) ) ( not ( = ?auto_665732 ?auto_665734 ) ) ( not ( = ?auto_665732 ?auto_665735 ) ) ( not ( = ?auto_665732 ?auto_665736 ) ) ( not ( = ?auto_665732 ?auto_665737 ) ) ( not ( = ?auto_665732 ?auto_665738 ) ) ( not ( = ?auto_665732 ?auto_665739 ) ) ( not ( = ?auto_665732 ?auto_665740 ) ) ( not ( = ?auto_665733 ?auto_665734 ) ) ( not ( = ?auto_665733 ?auto_665735 ) ) ( not ( = ?auto_665733 ?auto_665736 ) ) ( not ( = ?auto_665733 ?auto_665737 ) ) ( not ( = ?auto_665733 ?auto_665738 ) ) ( not ( = ?auto_665733 ?auto_665739 ) ) ( not ( = ?auto_665733 ?auto_665740 ) ) ( not ( = ?auto_665734 ?auto_665735 ) ) ( not ( = ?auto_665734 ?auto_665736 ) ) ( not ( = ?auto_665734 ?auto_665737 ) ) ( not ( = ?auto_665734 ?auto_665738 ) ) ( not ( = ?auto_665734 ?auto_665739 ) ) ( not ( = ?auto_665734 ?auto_665740 ) ) ( not ( = ?auto_665735 ?auto_665736 ) ) ( not ( = ?auto_665735 ?auto_665737 ) ) ( not ( = ?auto_665735 ?auto_665738 ) ) ( not ( = ?auto_665735 ?auto_665739 ) ) ( not ( = ?auto_665735 ?auto_665740 ) ) ( not ( = ?auto_665736 ?auto_665737 ) ) ( not ( = ?auto_665736 ?auto_665738 ) ) ( not ( = ?auto_665736 ?auto_665739 ) ) ( not ( = ?auto_665736 ?auto_665740 ) ) ( not ( = ?auto_665737 ?auto_665738 ) ) ( not ( = ?auto_665737 ?auto_665739 ) ) ( not ( = ?auto_665737 ?auto_665740 ) ) ( not ( = ?auto_665738 ?auto_665739 ) ) ( not ( = ?auto_665738 ?auto_665740 ) ) ( not ( = ?auto_665739 ?auto_665740 ) ) ( ON ?auto_665738 ?auto_665739 ) ( CLEAR ?auto_665736 ) ( ON ?auto_665737 ?auto_665738 ) ( CLEAR ?auto_665737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_665732 ?auto_665733 ?auto_665734 ?auto_665735 ?auto_665736 ?auto_665737 )
      ( MAKE-8PILE ?auto_665732 ?auto_665733 ?auto_665734 ?auto_665735 ?auto_665736 ?auto_665737 ?auto_665738 ?auto_665739 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665766 - BLOCK
      ?auto_665767 - BLOCK
      ?auto_665768 - BLOCK
      ?auto_665769 - BLOCK
      ?auto_665770 - BLOCK
      ?auto_665771 - BLOCK
      ?auto_665772 - BLOCK
      ?auto_665773 - BLOCK
    )
    :vars
    (
      ?auto_665774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665773 ?auto_665774 ) ( ON-TABLE ?auto_665766 ) ( ON ?auto_665767 ?auto_665766 ) ( ON ?auto_665768 ?auto_665767 ) ( ON ?auto_665769 ?auto_665768 ) ( not ( = ?auto_665766 ?auto_665767 ) ) ( not ( = ?auto_665766 ?auto_665768 ) ) ( not ( = ?auto_665766 ?auto_665769 ) ) ( not ( = ?auto_665766 ?auto_665770 ) ) ( not ( = ?auto_665766 ?auto_665771 ) ) ( not ( = ?auto_665766 ?auto_665772 ) ) ( not ( = ?auto_665766 ?auto_665773 ) ) ( not ( = ?auto_665766 ?auto_665774 ) ) ( not ( = ?auto_665767 ?auto_665768 ) ) ( not ( = ?auto_665767 ?auto_665769 ) ) ( not ( = ?auto_665767 ?auto_665770 ) ) ( not ( = ?auto_665767 ?auto_665771 ) ) ( not ( = ?auto_665767 ?auto_665772 ) ) ( not ( = ?auto_665767 ?auto_665773 ) ) ( not ( = ?auto_665767 ?auto_665774 ) ) ( not ( = ?auto_665768 ?auto_665769 ) ) ( not ( = ?auto_665768 ?auto_665770 ) ) ( not ( = ?auto_665768 ?auto_665771 ) ) ( not ( = ?auto_665768 ?auto_665772 ) ) ( not ( = ?auto_665768 ?auto_665773 ) ) ( not ( = ?auto_665768 ?auto_665774 ) ) ( not ( = ?auto_665769 ?auto_665770 ) ) ( not ( = ?auto_665769 ?auto_665771 ) ) ( not ( = ?auto_665769 ?auto_665772 ) ) ( not ( = ?auto_665769 ?auto_665773 ) ) ( not ( = ?auto_665769 ?auto_665774 ) ) ( not ( = ?auto_665770 ?auto_665771 ) ) ( not ( = ?auto_665770 ?auto_665772 ) ) ( not ( = ?auto_665770 ?auto_665773 ) ) ( not ( = ?auto_665770 ?auto_665774 ) ) ( not ( = ?auto_665771 ?auto_665772 ) ) ( not ( = ?auto_665771 ?auto_665773 ) ) ( not ( = ?auto_665771 ?auto_665774 ) ) ( not ( = ?auto_665772 ?auto_665773 ) ) ( not ( = ?auto_665772 ?auto_665774 ) ) ( not ( = ?auto_665773 ?auto_665774 ) ) ( ON ?auto_665772 ?auto_665773 ) ( ON ?auto_665771 ?auto_665772 ) ( CLEAR ?auto_665769 ) ( ON ?auto_665770 ?auto_665771 ) ( CLEAR ?auto_665770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_665766 ?auto_665767 ?auto_665768 ?auto_665769 ?auto_665770 )
      ( MAKE-8PILE ?auto_665766 ?auto_665767 ?auto_665768 ?auto_665769 ?auto_665770 ?auto_665771 ?auto_665772 ?auto_665773 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665800 - BLOCK
      ?auto_665801 - BLOCK
      ?auto_665802 - BLOCK
      ?auto_665803 - BLOCK
      ?auto_665804 - BLOCK
      ?auto_665805 - BLOCK
      ?auto_665806 - BLOCK
      ?auto_665807 - BLOCK
    )
    :vars
    (
      ?auto_665808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665807 ?auto_665808 ) ( ON-TABLE ?auto_665800 ) ( ON ?auto_665801 ?auto_665800 ) ( ON ?auto_665802 ?auto_665801 ) ( not ( = ?auto_665800 ?auto_665801 ) ) ( not ( = ?auto_665800 ?auto_665802 ) ) ( not ( = ?auto_665800 ?auto_665803 ) ) ( not ( = ?auto_665800 ?auto_665804 ) ) ( not ( = ?auto_665800 ?auto_665805 ) ) ( not ( = ?auto_665800 ?auto_665806 ) ) ( not ( = ?auto_665800 ?auto_665807 ) ) ( not ( = ?auto_665800 ?auto_665808 ) ) ( not ( = ?auto_665801 ?auto_665802 ) ) ( not ( = ?auto_665801 ?auto_665803 ) ) ( not ( = ?auto_665801 ?auto_665804 ) ) ( not ( = ?auto_665801 ?auto_665805 ) ) ( not ( = ?auto_665801 ?auto_665806 ) ) ( not ( = ?auto_665801 ?auto_665807 ) ) ( not ( = ?auto_665801 ?auto_665808 ) ) ( not ( = ?auto_665802 ?auto_665803 ) ) ( not ( = ?auto_665802 ?auto_665804 ) ) ( not ( = ?auto_665802 ?auto_665805 ) ) ( not ( = ?auto_665802 ?auto_665806 ) ) ( not ( = ?auto_665802 ?auto_665807 ) ) ( not ( = ?auto_665802 ?auto_665808 ) ) ( not ( = ?auto_665803 ?auto_665804 ) ) ( not ( = ?auto_665803 ?auto_665805 ) ) ( not ( = ?auto_665803 ?auto_665806 ) ) ( not ( = ?auto_665803 ?auto_665807 ) ) ( not ( = ?auto_665803 ?auto_665808 ) ) ( not ( = ?auto_665804 ?auto_665805 ) ) ( not ( = ?auto_665804 ?auto_665806 ) ) ( not ( = ?auto_665804 ?auto_665807 ) ) ( not ( = ?auto_665804 ?auto_665808 ) ) ( not ( = ?auto_665805 ?auto_665806 ) ) ( not ( = ?auto_665805 ?auto_665807 ) ) ( not ( = ?auto_665805 ?auto_665808 ) ) ( not ( = ?auto_665806 ?auto_665807 ) ) ( not ( = ?auto_665806 ?auto_665808 ) ) ( not ( = ?auto_665807 ?auto_665808 ) ) ( ON ?auto_665806 ?auto_665807 ) ( ON ?auto_665805 ?auto_665806 ) ( ON ?auto_665804 ?auto_665805 ) ( CLEAR ?auto_665802 ) ( ON ?auto_665803 ?auto_665804 ) ( CLEAR ?auto_665803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_665800 ?auto_665801 ?auto_665802 ?auto_665803 )
      ( MAKE-8PILE ?auto_665800 ?auto_665801 ?auto_665802 ?auto_665803 ?auto_665804 ?auto_665805 ?auto_665806 ?auto_665807 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665834 - BLOCK
      ?auto_665835 - BLOCK
      ?auto_665836 - BLOCK
      ?auto_665837 - BLOCK
      ?auto_665838 - BLOCK
      ?auto_665839 - BLOCK
      ?auto_665840 - BLOCK
      ?auto_665841 - BLOCK
    )
    :vars
    (
      ?auto_665842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665841 ?auto_665842 ) ( ON-TABLE ?auto_665834 ) ( ON ?auto_665835 ?auto_665834 ) ( not ( = ?auto_665834 ?auto_665835 ) ) ( not ( = ?auto_665834 ?auto_665836 ) ) ( not ( = ?auto_665834 ?auto_665837 ) ) ( not ( = ?auto_665834 ?auto_665838 ) ) ( not ( = ?auto_665834 ?auto_665839 ) ) ( not ( = ?auto_665834 ?auto_665840 ) ) ( not ( = ?auto_665834 ?auto_665841 ) ) ( not ( = ?auto_665834 ?auto_665842 ) ) ( not ( = ?auto_665835 ?auto_665836 ) ) ( not ( = ?auto_665835 ?auto_665837 ) ) ( not ( = ?auto_665835 ?auto_665838 ) ) ( not ( = ?auto_665835 ?auto_665839 ) ) ( not ( = ?auto_665835 ?auto_665840 ) ) ( not ( = ?auto_665835 ?auto_665841 ) ) ( not ( = ?auto_665835 ?auto_665842 ) ) ( not ( = ?auto_665836 ?auto_665837 ) ) ( not ( = ?auto_665836 ?auto_665838 ) ) ( not ( = ?auto_665836 ?auto_665839 ) ) ( not ( = ?auto_665836 ?auto_665840 ) ) ( not ( = ?auto_665836 ?auto_665841 ) ) ( not ( = ?auto_665836 ?auto_665842 ) ) ( not ( = ?auto_665837 ?auto_665838 ) ) ( not ( = ?auto_665837 ?auto_665839 ) ) ( not ( = ?auto_665837 ?auto_665840 ) ) ( not ( = ?auto_665837 ?auto_665841 ) ) ( not ( = ?auto_665837 ?auto_665842 ) ) ( not ( = ?auto_665838 ?auto_665839 ) ) ( not ( = ?auto_665838 ?auto_665840 ) ) ( not ( = ?auto_665838 ?auto_665841 ) ) ( not ( = ?auto_665838 ?auto_665842 ) ) ( not ( = ?auto_665839 ?auto_665840 ) ) ( not ( = ?auto_665839 ?auto_665841 ) ) ( not ( = ?auto_665839 ?auto_665842 ) ) ( not ( = ?auto_665840 ?auto_665841 ) ) ( not ( = ?auto_665840 ?auto_665842 ) ) ( not ( = ?auto_665841 ?auto_665842 ) ) ( ON ?auto_665840 ?auto_665841 ) ( ON ?auto_665839 ?auto_665840 ) ( ON ?auto_665838 ?auto_665839 ) ( ON ?auto_665837 ?auto_665838 ) ( CLEAR ?auto_665835 ) ( ON ?auto_665836 ?auto_665837 ) ( CLEAR ?auto_665836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_665834 ?auto_665835 ?auto_665836 )
      ( MAKE-8PILE ?auto_665834 ?auto_665835 ?auto_665836 ?auto_665837 ?auto_665838 ?auto_665839 ?auto_665840 ?auto_665841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665868 - BLOCK
      ?auto_665869 - BLOCK
      ?auto_665870 - BLOCK
      ?auto_665871 - BLOCK
      ?auto_665872 - BLOCK
      ?auto_665873 - BLOCK
      ?auto_665874 - BLOCK
      ?auto_665875 - BLOCK
    )
    :vars
    (
      ?auto_665876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665875 ?auto_665876 ) ( ON-TABLE ?auto_665868 ) ( not ( = ?auto_665868 ?auto_665869 ) ) ( not ( = ?auto_665868 ?auto_665870 ) ) ( not ( = ?auto_665868 ?auto_665871 ) ) ( not ( = ?auto_665868 ?auto_665872 ) ) ( not ( = ?auto_665868 ?auto_665873 ) ) ( not ( = ?auto_665868 ?auto_665874 ) ) ( not ( = ?auto_665868 ?auto_665875 ) ) ( not ( = ?auto_665868 ?auto_665876 ) ) ( not ( = ?auto_665869 ?auto_665870 ) ) ( not ( = ?auto_665869 ?auto_665871 ) ) ( not ( = ?auto_665869 ?auto_665872 ) ) ( not ( = ?auto_665869 ?auto_665873 ) ) ( not ( = ?auto_665869 ?auto_665874 ) ) ( not ( = ?auto_665869 ?auto_665875 ) ) ( not ( = ?auto_665869 ?auto_665876 ) ) ( not ( = ?auto_665870 ?auto_665871 ) ) ( not ( = ?auto_665870 ?auto_665872 ) ) ( not ( = ?auto_665870 ?auto_665873 ) ) ( not ( = ?auto_665870 ?auto_665874 ) ) ( not ( = ?auto_665870 ?auto_665875 ) ) ( not ( = ?auto_665870 ?auto_665876 ) ) ( not ( = ?auto_665871 ?auto_665872 ) ) ( not ( = ?auto_665871 ?auto_665873 ) ) ( not ( = ?auto_665871 ?auto_665874 ) ) ( not ( = ?auto_665871 ?auto_665875 ) ) ( not ( = ?auto_665871 ?auto_665876 ) ) ( not ( = ?auto_665872 ?auto_665873 ) ) ( not ( = ?auto_665872 ?auto_665874 ) ) ( not ( = ?auto_665872 ?auto_665875 ) ) ( not ( = ?auto_665872 ?auto_665876 ) ) ( not ( = ?auto_665873 ?auto_665874 ) ) ( not ( = ?auto_665873 ?auto_665875 ) ) ( not ( = ?auto_665873 ?auto_665876 ) ) ( not ( = ?auto_665874 ?auto_665875 ) ) ( not ( = ?auto_665874 ?auto_665876 ) ) ( not ( = ?auto_665875 ?auto_665876 ) ) ( ON ?auto_665874 ?auto_665875 ) ( ON ?auto_665873 ?auto_665874 ) ( ON ?auto_665872 ?auto_665873 ) ( ON ?auto_665871 ?auto_665872 ) ( ON ?auto_665870 ?auto_665871 ) ( CLEAR ?auto_665868 ) ( ON ?auto_665869 ?auto_665870 ) ( CLEAR ?auto_665869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_665868 ?auto_665869 )
      ( MAKE-8PILE ?auto_665868 ?auto_665869 ?auto_665870 ?auto_665871 ?auto_665872 ?auto_665873 ?auto_665874 ?auto_665875 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_665902 - BLOCK
      ?auto_665903 - BLOCK
      ?auto_665904 - BLOCK
      ?auto_665905 - BLOCK
      ?auto_665906 - BLOCK
      ?auto_665907 - BLOCK
      ?auto_665908 - BLOCK
      ?auto_665909 - BLOCK
    )
    :vars
    (
      ?auto_665910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665909 ?auto_665910 ) ( not ( = ?auto_665902 ?auto_665903 ) ) ( not ( = ?auto_665902 ?auto_665904 ) ) ( not ( = ?auto_665902 ?auto_665905 ) ) ( not ( = ?auto_665902 ?auto_665906 ) ) ( not ( = ?auto_665902 ?auto_665907 ) ) ( not ( = ?auto_665902 ?auto_665908 ) ) ( not ( = ?auto_665902 ?auto_665909 ) ) ( not ( = ?auto_665902 ?auto_665910 ) ) ( not ( = ?auto_665903 ?auto_665904 ) ) ( not ( = ?auto_665903 ?auto_665905 ) ) ( not ( = ?auto_665903 ?auto_665906 ) ) ( not ( = ?auto_665903 ?auto_665907 ) ) ( not ( = ?auto_665903 ?auto_665908 ) ) ( not ( = ?auto_665903 ?auto_665909 ) ) ( not ( = ?auto_665903 ?auto_665910 ) ) ( not ( = ?auto_665904 ?auto_665905 ) ) ( not ( = ?auto_665904 ?auto_665906 ) ) ( not ( = ?auto_665904 ?auto_665907 ) ) ( not ( = ?auto_665904 ?auto_665908 ) ) ( not ( = ?auto_665904 ?auto_665909 ) ) ( not ( = ?auto_665904 ?auto_665910 ) ) ( not ( = ?auto_665905 ?auto_665906 ) ) ( not ( = ?auto_665905 ?auto_665907 ) ) ( not ( = ?auto_665905 ?auto_665908 ) ) ( not ( = ?auto_665905 ?auto_665909 ) ) ( not ( = ?auto_665905 ?auto_665910 ) ) ( not ( = ?auto_665906 ?auto_665907 ) ) ( not ( = ?auto_665906 ?auto_665908 ) ) ( not ( = ?auto_665906 ?auto_665909 ) ) ( not ( = ?auto_665906 ?auto_665910 ) ) ( not ( = ?auto_665907 ?auto_665908 ) ) ( not ( = ?auto_665907 ?auto_665909 ) ) ( not ( = ?auto_665907 ?auto_665910 ) ) ( not ( = ?auto_665908 ?auto_665909 ) ) ( not ( = ?auto_665908 ?auto_665910 ) ) ( not ( = ?auto_665909 ?auto_665910 ) ) ( ON ?auto_665908 ?auto_665909 ) ( ON ?auto_665907 ?auto_665908 ) ( ON ?auto_665906 ?auto_665907 ) ( ON ?auto_665905 ?auto_665906 ) ( ON ?auto_665904 ?auto_665905 ) ( ON ?auto_665903 ?auto_665904 ) ( ON ?auto_665902 ?auto_665903 ) ( CLEAR ?auto_665902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_665902 )
      ( MAKE-8PILE ?auto_665902 ?auto_665903 ?auto_665904 ?auto_665905 ?auto_665906 ?auto_665907 ?auto_665908 ?auto_665909 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_665937 - BLOCK
      ?auto_665938 - BLOCK
      ?auto_665939 - BLOCK
      ?auto_665940 - BLOCK
      ?auto_665941 - BLOCK
      ?auto_665942 - BLOCK
      ?auto_665943 - BLOCK
      ?auto_665944 - BLOCK
      ?auto_665945 - BLOCK
    )
    :vars
    (
      ?auto_665946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_665944 ) ( ON ?auto_665945 ?auto_665946 ) ( CLEAR ?auto_665945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_665937 ) ( ON ?auto_665938 ?auto_665937 ) ( ON ?auto_665939 ?auto_665938 ) ( ON ?auto_665940 ?auto_665939 ) ( ON ?auto_665941 ?auto_665940 ) ( ON ?auto_665942 ?auto_665941 ) ( ON ?auto_665943 ?auto_665942 ) ( ON ?auto_665944 ?auto_665943 ) ( not ( = ?auto_665937 ?auto_665938 ) ) ( not ( = ?auto_665937 ?auto_665939 ) ) ( not ( = ?auto_665937 ?auto_665940 ) ) ( not ( = ?auto_665937 ?auto_665941 ) ) ( not ( = ?auto_665937 ?auto_665942 ) ) ( not ( = ?auto_665937 ?auto_665943 ) ) ( not ( = ?auto_665937 ?auto_665944 ) ) ( not ( = ?auto_665937 ?auto_665945 ) ) ( not ( = ?auto_665937 ?auto_665946 ) ) ( not ( = ?auto_665938 ?auto_665939 ) ) ( not ( = ?auto_665938 ?auto_665940 ) ) ( not ( = ?auto_665938 ?auto_665941 ) ) ( not ( = ?auto_665938 ?auto_665942 ) ) ( not ( = ?auto_665938 ?auto_665943 ) ) ( not ( = ?auto_665938 ?auto_665944 ) ) ( not ( = ?auto_665938 ?auto_665945 ) ) ( not ( = ?auto_665938 ?auto_665946 ) ) ( not ( = ?auto_665939 ?auto_665940 ) ) ( not ( = ?auto_665939 ?auto_665941 ) ) ( not ( = ?auto_665939 ?auto_665942 ) ) ( not ( = ?auto_665939 ?auto_665943 ) ) ( not ( = ?auto_665939 ?auto_665944 ) ) ( not ( = ?auto_665939 ?auto_665945 ) ) ( not ( = ?auto_665939 ?auto_665946 ) ) ( not ( = ?auto_665940 ?auto_665941 ) ) ( not ( = ?auto_665940 ?auto_665942 ) ) ( not ( = ?auto_665940 ?auto_665943 ) ) ( not ( = ?auto_665940 ?auto_665944 ) ) ( not ( = ?auto_665940 ?auto_665945 ) ) ( not ( = ?auto_665940 ?auto_665946 ) ) ( not ( = ?auto_665941 ?auto_665942 ) ) ( not ( = ?auto_665941 ?auto_665943 ) ) ( not ( = ?auto_665941 ?auto_665944 ) ) ( not ( = ?auto_665941 ?auto_665945 ) ) ( not ( = ?auto_665941 ?auto_665946 ) ) ( not ( = ?auto_665942 ?auto_665943 ) ) ( not ( = ?auto_665942 ?auto_665944 ) ) ( not ( = ?auto_665942 ?auto_665945 ) ) ( not ( = ?auto_665942 ?auto_665946 ) ) ( not ( = ?auto_665943 ?auto_665944 ) ) ( not ( = ?auto_665943 ?auto_665945 ) ) ( not ( = ?auto_665943 ?auto_665946 ) ) ( not ( = ?auto_665944 ?auto_665945 ) ) ( not ( = ?auto_665944 ?auto_665946 ) ) ( not ( = ?auto_665945 ?auto_665946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_665945 ?auto_665946 )
      ( !STACK ?auto_665945 ?auto_665944 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_665975 - BLOCK
      ?auto_665976 - BLOCK
      ?auto_665977 - BLOCK
      ?auto_665978 - BLOCK
      ?auto_665979 - BLOCK
      ?auto_665980 - BLOCK
      ?auto_665981 - BLOCK
      ?auto_665982 - BLOCK
      ?auto_665983 - BLOCK
    )
    :vars
    (
      ?auto_665984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_665983 ?auto_665984 ) ( ON-TABLE ?auto_665975 ) ( ON ?auto_665976 ?auto_665975 ) ( ON ?auto_665977 ?auto_665976 ) ( ON ?auto_665978 ?auto_665977 ) ( ON ?auto_665979 ?auto_665978 ) ( ON ?auto_665980 ?auto_665979 ) ( ON ?auto_665981 ?auto_665980 ) ( not ( = ?auto_665975 ?auto_665976 ) ) ( not ( = ?auto_665975 ?auto_665977 ) ) ( not ( = ?auto_665975 ?auto_665978 ) ) ( not ( = ?auto_665975 ?auto_665979 ) ) ( not ( = ?auto_665975 ?auto_665980 ) ) ( not ( = ?auto_665975 ?auto_665981 ) ) ( not ( = ?auto_665975 ?auto_665982 ) ) ( not ( = ?auto_665975 ?auto_665983 ) ) ( not ( = ?auto_665975 ?auto_665984 ) ) ( not ( = ?auto_665976 ?auto_665977 ) ) ( not ( = ?auto_665976 ?auto_665978 ) ) ( not ( = ?auto_665976 ?auto_665979 ) ) ( not ( = ?auto_665976 ?auto_665980 ) ) ( not ( = ?auto_665976 ?auto_665981 ) ) ( not ( = ?auto_665976 ?auto_665982 ) ) ( not ( = ?auto_665976 ?auto_665983 ) ) ( not ( = ?auto_665976 ?auto_665984 ) ) ( not ( = ?auto_665977 ?auto_665978 ) ) ( not ( = ?auto_665977 ?auto_665979 ) ) ( not ( = ?auto_665977 ?auto_665980 ) ) ( not ( = ?auto_665977 ?auto_665981 ) ) ( not ( = ?auto_665977 ?auto_665982 ) ) ( not ( = ?auto_665977 ?auto_665983 ) ) ( not ( = ?auto_665977 ?auto_665984 ) ) ( not ( = ?auto_665978 ?auto_665979 ) ) ( not ( = ?auto_665978 ?auto_665980 ) ) ( not ( = ?auto_665978 ?auto_665981 ) ) ( not ( = ?auto_665978 ?auto_665982 ) ) ( not ( = ?auto_665978 ?auto_665983 ) ) ( not ( = ?auto_665978 ?auto_665984 ) ) ( not ( = ?auto_665979 ?auto_665980 ) ) ( not ( = ?auto_665979 ?auto_665981 ) ) ( not ( = ?auto_665979 ?auto_665982 ) ) ( not ( = ?auto_665979 ?auto_665983 ) ) ( not ( = ?auto_665979 ?auto_665984 ) ) ( not ( = ?auto_665980 ?auto_665981 ) ) ( not ( = ?auto_665980 ?auto_665982 ) ) ( not ( = ?auto_665980 ?auto_665983 ) ) ( not ( = ?auto_665980 ?auto_665984 ) ) ( not ( = ?auto_665981 ?auto_665982 ) ) ( not ( = ?auto_665981 ?auto_665983 ) ) ( not ( = ?auto_665981 ?auto_665984 ) ) ( not ( = ?auto_665982 ?auto_665983 ) ) ( not ( = ?auto_665982 ?auto_665984 ) ) ( not ( = ?auto_665983 ?auto_665984 ) ) ( CLEAR ?auto_665981 ) ( ON ?auto_665982 ?auto_665983 ) ( CLEAR ?auto_665982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_665975 ?auto_665976 ?auto_665977 ?auto_665978 ?auto_665979 ?auto_665980 ?auto_665981 ?auto_665982 )
      ( MAKE-9PILE ?auto_665975 ?auto_665976 ?auto_665977 ?auto_665978 ?auto_665979 ?auto_665980 ?auto_665981 ?auto_665982 ?auto_665983 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666013 - BLOCK
      ?auto_666014 - BLOCK
      ?auto_666015 - BLOCK
      ?auto_666016 - BLOCK
      ?auto_666017 - BLOCK
      ?auto_666018 - BLOCK
      ?auto_666019 - BLOCK
      ?auto_666020 - BLOCK
      ?auto_666021 - BLOCK
    )
    :vars
    (
      ?auto_666022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666021 ?auto_666022 ) ( ON-TABLE ?auto_666013 ) ( ON ?auto_666014 ?auto_666013 ) ( ON ?auto_666015 ?auto_666014 ) ( ON ?auto_666016 ?auto_666015 ) ( ON ?auto_666017 ?auto_666016 ) ( ON ?auto_666018 ?auto_666017 ) ( not ( = ?auto_666013 ?auto_666014 ) ) ( not ( = ?auto_666013 ?auto_666015 ) ) ( not ( = ?auto_666013 ?auto_666016 ) ) ( not ( = ?auto_666013 ?auto_666017 ) ) ( not ( = ?auto_666013 ?auto_666018 ) ) ( not ( = ?auto_666013 ?auto_666019 ) ) ( not ( = ?auto_666013 ?auto_666020 ) ) ( not ( = ?auto_666013 ?auto_666021 ) ) ( not ( = ?auto_666013 ?auto_666022 ) ) ( not ( = ?auto_666014 ?auto_666015 ) ) ( not ( = ?auto_666014 ?auto_666016 ) ) ( not ( = ?auto_666014 ?auto_666017 ) ) ( not ( = ?auto_666014 ?auto_666018 ) ) ( not ( = ?auto_666014 ?auto_666019 ) ) ( not ( = ?auto_666014 ?auto_666020 ) ) ( not ( = ?auto_666014 ?auto_666021 ) ) ( not ( = ?auto_666014 ?auto_666022 ) ) ( not ( = ?auto_666015 ?auto_666016 ) ) ( not ( = ?auto_666015 ?auto_666017 ) ) ( not ( = ?auto_666015 ?auto_666018 ) ) ( not ( = ?auto_666015 ?auto_666019 ) ) ( not ( = ?auto_666015 ?auto_666020 ) ) ( not ( = ?auto_666015 ?auto_666021 ) ) ( not ( = ?auto_666015 ?auto_666022 ) ) ( not ( = ?auto_666016 ?auto_666017 ) ) ( not ( = ?auto_666016 ?auto_666018 ) ) ( not ( = ?auto_666016 ?auto_666019 ) ) ( not ( = ?auto_666016 ?auto_666020 ) ) ( not ( = ?auto_666016 ?auto_666021 ) ) ( not ( = ?auto_666016 ?auto_666022 ) ) ( not ( = ?auto_666017 ?auto_666018 ) ) ( not ( = ?auto_666017 ?auto_666019 ) ) ( not ( = ?auto_666017 ?auto_666020 ) ) ( not ( = ?auto_666017 ?auto_666021 ) ) ( not ( = ?auto_666017 ?auto_666022 ) ) ( not ( = ?auto_666018 ?auto_666019 ) ) ( not ( = ?auto_666018 ?auto_666020 ) ) ( not ( = ?auto_666018 ?auto_666021 ) ) ( not ( = ?auto_666018 ?auto_666022 ) ) ( not ( = ?auto_666019 ?auto_666020 ) ) ( not ( = ?auto_666019 ?auto_666021 ) ) ( not ( = ?auto_666019 ?auto_666022 ) ) ( not ( = ?auto_666020 ?auto_666021 ) ) ( not ( = ?auto_666020 ?auto_666022 ) ) ( not ( = ?auto_666021 ?auto_666022 ) ) ( ON ?auto_666020 ?auto_666021 ) ( CLEAR ?auto_666018 ) ( ON ?auto_666019 ?auto_666020 ) ( CLEAR ?auto_666019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_666013 ?auto_666014 ?auto_666015 ?auto_666016 ?auto_666017 ?auto_666018 ?auto_666019 )
      ( MAKE-9PILE ?auto_666013 ?auto_666014 ?auto_666015 ?auto_666016 ?auto_666017 ?auto_666018 ?auto_666019 ?auto_666020 ?auto_666021 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666051 - BLOCK
      ?auto_666052 - BLOCK
      ?auto_666053 - BLOCK
      ?auto_666054 - BLOCK
      ?auto_666055 - BLOCK
      ?auto_666056 - BLOCK
      ?auto_666057 - BLOCK
      ?auto_666058 - BLOCK
      ?auto_666059 - BLOCK
    )
    :vars
    (
      ?auto_666060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666059 ?auto_666060 ) ( ON-TABLE ?auto_666051 ) ( ON ?auto_666052 ?auto_666051 ) ( ON ?auto_666053 ?auto_666052 ) ( ON ?auto_666054 ?auto_666053 ) ( ON ?auto_666055 ?auto_666054 ) ( not ( = ?auto_666051 ?auto_666052 ) ) ( not ( = ?auto_666051 ?auto_666053 ) ) ( not ( = ?auto_666051 ?auto_666054 ) ) ( not ( = ?auto_666051 ?auto_666055 ) ) ( not ( = ?auto_666051 ?auto_666056 ) ) ( not ( = ?auto_666051 ?auto_666057 ) ) ( not ( = ?auto_666051 ?auto_666058 ) ) ( not ( = ?auto_666051 ?auto_666059 ) ) ( not ( = ?auto_666051 ?auto_666060 ) ) ( not ( = ?auto_666052 ?auto_666053 ) ) ( not ( = ?auto_666052 ?auto_666054 ) ) ( not ( = ?auto_666052 ?auto_666055 ) ) ( not ( = ?auto_666052 ?auto_666056 ) ) ( not ( = ?auto_666052 ?auto_666057 ) ) ( not ( = ?auto_666052 ?auto_666058 ) ) ( not ( = ?auto_666052 ?auto_666059 ) ) ( not ( = ?auto_666052 ?auto_666060 ) ) ( not ( = ?auto_666053 ?auto_666054 ) ) ( not ( = ?auto_666053 ?auto_666055 ) ) ( not ( = ?auto_666053 ?auto_666056 ) ) ( not ( = ?auto_666053 ?auto_666057 ) ) ( not ( = ?auto_666053 ?auto_666058 ) ) ( not ( = ?auto_666053 ?auto_666059 ) ) ( not ( = ?auto_666053 ?auto_666060 ) ) ( not ( = ?auto_666054 ?auto_666055 ) ) ( not ( = ?auto_666054 ?auto_666056 ) ) ( not ( = ?auto_666054 ?auto_666057 ) ) ( not ( = ?auto_666054 ?auto_666058 ) ) ( not ( = ?auto_666054 ?auto_666059 ) ) ( not ( = ?auto_666054 ?auto_666060 ) ) ( not ( = ?auto_666055 ?auto_666056 ) ) ( not ( = ?auto_666055 ?auto_666057 ) ) ( not ( = ?auto_666055 ?auto_666058 ) ) ( not ( = ?auto_666055 ?auto_666059 ) ) ( not ( = ?auto_666055 ?auto_666060 ) ) ( not ( = ?auto_666056 ?auto_666057 ) ) ( not ( = ?auto_666056 ?auto_666058 ) ) ( not ( = ?auto_666056 ?auto_666059 ) ) ( not ( = ?auto_666056 ?auto_666060 ) ) ( not ( = ?auto_666057 ?auto_666058 ) ) ( not ( = ?auto_666057 ?auto_666059 ) ) ( not ( = ?auto_666057 ?auto_666060 ) ) ( not ( = ?auto_666058 ?auto_666059 ) ) ( not ( = ?auto_666058 ?auto_666060 ) ) ( not ( = ?auto_666059 ?auto_666060 ) ) ( ON ?auto_666058 ?auto_666059 ) ( ON ?auto_666057 ?auto_666058 ) ( CLEAR ?auto_666055 ) ( ON ?auto_666056 ?auto_666057 ) ( CLEAR ?auto_666056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_666051 ?auto_666052 ?auto_666053 ?auto_666054 ?auto_666055 ?auto_666056 )
      ( MAKE-9PILE ?auto_666051 ?auto_666052 ?auto_666053 ?auto_666054 ?auto_666055 ?auto_666056 ?auto_666057 ?auto_666058 ?auto_666059 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666089 - BLOCK
      ?auto_666090 - BLOCK
      ?auto_666091 - BLOCK
      ?auto_666092 - BLOCK
      ?auto_666093 - BLOCK
      ?auto_666094 - BLOCK
      ?auto_666095 - BLOCK
      ?auto_666096 - BLOCK
      ?auto_666097 - BLOCK
    )
    :vars
    (
      ?auto_666098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666097 ?auto_666098 ) ( ON-TABLE ?auto_666089 ) ( ON ?auto_666090 ?auto_666089 ) ( ON ?auto_666091 ?auto_666090 ) ( ON ?auto_666092 ?auto_666091 ) ( not ( = ?auto_666089 ?auto_666090 ) ) ( not ( = ?auto_666089 ?auto_666091 ) ) ( not ( = ?auto_666089 ?auto_666092 ) ) ( not ( = ?auto_666089 ?auto_666093 ) ) ( not ( = ?auto_666089 ?auto_666094 ) ) ( not ( = ?auto_666089 ?auto_666095 ) ) ( not ( = ?auto_666089 ?auto_666096 ) ) ( not ( = ?auto_666089 ?auto_666097 ) ) ( not ( = ?auto_666089 ?auto_666098 ) ) ( not ( = ?auto_666090 ?auto_666091 ) ) ( not ( = ?auto_666090 ?auto_666092 ) ) ( not ( = ?auto_666090 ?auto_666093 ) ) ( not ( = ?auto_666090 ?auto_666094 ) ) ( not ( = ?auto_666090 ?auto_666095 ) ) ( not ( = ?auto_666090 ?auto_666096 ) ) ( not ( = ?auto_666090 ?auto_666097 ) ) ( not ( = ?auto_666090 ?auto_666098 ) ) ( not ( = ?auto_666091 ?auto_666092 ) ) ( not ( = ?auto_666091 ?auto_666093 ) ) ( not ( = ?auto_666091 ?auto_666094 ) ) ( not ( = ?auto_666091 ?auto_666095 ) ) ( not ( = ?auto_666091 ?auto_666096 ) ) ( not ( = ?auto_666091 ?auto_666097 ) ) ( not ( = ?auto_666091 ?auto_666098 ) ) ( not ( = ?auto_666092 ?auto_666093 ) ) ( not ( = ?auto_666092 ?auto_666094 ) ) ( not ( = ?auto_666092 ?auto_666095 ) ) ( not ( = ?auto_666092 ?auto_666096 ) ) ( not ( = ?auto_666092 ?auto_666097 ) ) ( not ( = ?auto_666092 ?auto_666098 ) ) ( not ( = ?auto_666093 ?auto_666094 ) ) ( not ( = ?auto_666093 ?auto_666095 ) ) ( not ( = ?auto_666093 ?auto_666096 ) ) ( not ( = ?auto_666093 ?auto_666097 ) ) ( not ( = ?auto_666093 ?auto_666098 ) ) ( not ( = ?auto_666094 ?auto_666095 ) ) ( not ( = ?auto_666094 ?auto_666096 ) ) ( not ( = ?auto_666094 ?auto_666097 ) ) ( not ( = ?auto_666094 ?auto_666098 ) ) ( not ( = ?auto_666095 ?auto_666096 ) ) ( not ( = ?auto_666095 ?auto_666097 ) ) ( not ( = ?auto_666095 ?auto_666098 ) ) ( not ( = ?auto_666096 ?auto_666097 ) ) ( not ( = ?auto_666096 ?auto_666098 ) ) ( not ( = ?auto_666097 ?auto_666098 ) ) ( ON ?auto_666096 ?auto_666097 ) ( ON ?auto_666095 ?auto_666096 ) ( ON ?auto_666094 ?auto_666095 ) ( CLEAR ?auto_666092 ) ( ON ?auto_666093 ?auto_666094 ) ( CLEAR ?auto_666093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_666089 ?auto_666090 ?auto_666091 ?auto_666092 ?auto_666093 )
      ( MAKE-9PILE ?auto_666089 ?auto_666090 ?auto_666091 ?auto_666092 ?auto_666093 ?auto_666094 ?auto_666095 ?auto_666096 ?auto_666097 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666127 - BLOCK
      ?auto_666128 - BLOCK
      ?auto_666129 - BLOCK
      ?auto_666130 - BLOCK
      ?auto_666131 - BLOCK
      ?auto_666132 - BLOCK
      ?auto_666133 - BLOCK
      ?auto_666134 - BLOCK
      ?auto_666135 - BLOCK
    )
    :vars
    (
      ?auto_666136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666135 ?auto_666136 ) ( ON-TABLE ?auto_666127 ) ( ON ?auto_666128 ?auto_666127 ) ( ON ?auto_666129 ?auto_666128 ) ( not ( = ?auto_666127 ?auto_666128 ) ) ( not ( = ?auto_666127 ?auto_666129 ) ) ( not ( = ?auto_666127 ?auto_666130 ) ) ( not ( = ?auto_666127 ?auto_666131 ) ) ( not ( = ?auto_666127 ?auto_666132 ) ) ( not ( = ?auto_666127 ?auto_666133 ) ) ( not ( = ?auto_666127 ?auto_666134 ) ) ( not ( = ?auto_666127 ?auto_666135 ) ) ( not ( = ?auto_666127 ?auto_666136 ) ) ( not ( = ?auto_666128 ?auto_666129 ) ) ( not ( = ?auto_666128 ?auto_666130 ) ) ( not ( = ?auto_666128 ?auto_666131 ) ) ( not ( = ?auto_666128 ?auto_666132 ) ) ( not ( = ?auto_666128 ?auto_666133 ) ) ( not ( = ?auto_666128 ?auto_666134 ) ) ( not ( = ?auto_666128 ?auto_666135 ) ) ( not ( = ?auto_666128 ?auto_666136 ) ) ( not ( = ?auto_666129 ?auto_666130 ) ) ( not ( = ?auto_666129 ?auto_666131 ) ) ( not ( = ?auto_666129 ?auto_666132 ) ) ( not ( = ?auto_666129 ?auto_666133 ) ) ( not ( = ?auto_666129 ?auto_666134 ) ) ( not ( = ?auto_666129 ?auto_666135 ) ) ( not ( = ?auto_666129 ?auto_666136 ) ) ( not ( = ?auto_666130 ?auto_666131 ) ) ( not ( = ?auto_666130 ?auto_666132 ) ) ( not ( = ?auto_666130 ?auto_666133 ) ) ( not ( = ?auto_666130 ?auto_666134 ) ) ( not ( = ?auto_666130 ?auto_666135 ) ) ( not ( = ?auto_666130 ?auto_666136 ) ) ( not ( = ?auto_666131 ?auto_666132 ) ) ( not ( = ?auto_666131 ?auto_666133 ) ) ( not ( = ?auto_666131 ?auto_666134 ) ) ( not ( = ?auto_666131 ?auto_666135 ) ) ( not ( = ?auto_666131 ?auto_666136 ) ) ( not ( = ?auto_666132 ?auto_666133 ) ) ( not ( = ?auto_666132 ?auto_666134 ) ) ( not ( = ?auto_666132 ?auto_666135 ) ) ( not ( = ?auto_666132 ?auto_666136 ) ) ( not ( = ?auto_666133 ?auto_666134 ) ) ( not ( = ?auto_666133 ?auto_666135 ) ) ( not ( = ?auto_666133 ?auto_666136 ) ) ( not ( = ?auto_666134 ?auto_666135 ) ) ( not ( = ?auto_666134 ?auto_666136 ) ) ( not ( = ?auto_666135 ?auto_666136 ) ) ( ON ?auto_666134 ?auto_666135 ) ( ON ?auto_666133 ?auto_666134 ) ( ON ?auto_666132 ?auto_666133 ) ( ON ?auto_666131 ?auto_666132 ) ( CLEAR ?auto_666129 ) ( ON ?auto_666130 ?auto_666131 ) ( CLEAR ?auto_666130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_666127 ?auto_666128 ?auto_666129 ?auto_666130 )
      ( MAKE-9PILE ?auto_666127 ?auto_666128 ?auto_666129 ?auto_666130 ?auto_666131 ?auto_666132 ?auto_666133 ?auto_666134 ?auto_666135 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666165 - BLOCK
      ?auto_666166 - BLOCK
      ?auto_666167 - BLOCK
      ?auto_666168 - BLOCK
      ?auto_666169 - BLOCK
      ?auto_666170 - BLOCK
      ?auto_666171 - BLOCK
      ?auto_666172 - BLOCK
      ?auto_666173 - BLOCK
    )
    :vars
    (
      ?auto_666174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666173 ?auto_666174 ) ( ON-TABLE ?auto_666165 ) ( ON ?auto_666166 ?auto_666165 ) ( not ( = ?auto_666165 ?auto_666166 ) ) ( not ( = ?auto_666165 ?auto_666167 ) ) ( not ( = ?auto_666165 ?auto_666168 ) ) ( not ( = ?auto_666165 ?auto_666169 ) ) ( not ( = ?auto_666165 ?auto_666170 ) ) ( not ( = ?auto_666165 ?auto_666171 ) ) ( not ( = ?auto_666165 ?auto_666172 ) ) ( not ( = ?auto_666165 ?auto_666173 ) ) ( not ( = ?auto_666165 ?auto_666174 ) ) ( not ( = ?auto_666166 ?auto_666167 ) ) ( not ( = ?auto_666166 ?auto_666168 ) ) ( not ( = ?auto_666166 ?auto_666169 ) ) ( not ( = ?auto_666166 ?auto_666170 ) ) ( not ( = ?auto_666166 ?auto_666171 ) ) ( not ( = ?auto_666166 ?auto_666172 ) ) ( not ( = ?auto_666166 ?auto_666173 ) ) ( not ( = ?auto_666166 ?auto_666174 ) ) ( not ( = ?auto_666167 ?auto_666168 ) ) ( not ( = ?auto_666167 ?auto_666169 ) ) ( not ( = ?auto_666167 ?auto_666170 ) ) ( not ( = ?auto_666167 ?auto_666171 ) ) ( not ( = ?auto_666167 ?auto_666172 ) ) ( not ( = ?auto_666167 ?auto_666173 ) ) ( not ( = ?auto_666167 ?auto_666174 ) ) ( not ( = ?auto_666168 ?auto_666169 ) ) ( not ( = ?auto_666168 ?auto_666170 ) ) ( not ( = ?auto_666168 ?auto_666171 ) ) ( not ( = ?auto_666168 ?auto_666172 ) ) ( not ( = ?auto_666168 ?auto_666173 ) ) ( not ( = ?auto_666168 ?auto_666174 ) ) ( not ( = ?auto_666169 ?auto_666170 ) ) ( not ( = ?auto_666169 ?auto_666171 ) ) ( not ( = ?auto_666169 ?auto_666172 ) ) ( not ( = ?auto_666169 ?auto_666173 ) ) ( not ( = ?auto_666169 ?auto_666174 ) ) ( not ( = ?auto_666170 ?auto_666171 ) ) ( not ( = ?auto_666170 ?auto_666172 ) ) ( not ( = ?auto_666170 ?auto_666173 ) ) ( not ( = ?auto_666170 ?auto_666174 ) ) ( not ( = ?auto_666171 ?auto_666172 ) ) ( not ( = ?auto_666171 ?auto_666173 ) ) ( not ( = ?auto_666171 ?auto_666174 ) ) ( not ( = ?auto_666172 ?auto_666173 ) ) ( not ( = ?auto_666172 ?auto_666174 ) ) ( not ( = ?auto_666173 ?auto_666174 ) ) ( ON ?auto_666172 ?auto_666173 ) ( ON ?auto_666171 ?auto_666172 ) ( ON ?auto_666170 ?auto_666171 ) ( ON ?auto_666169 ?auto_666170 ) ( ON ?auto_666168 ?auto_666169 ) ( CLEAR ?auto_666166 ) ( ON ?auto_666167 ?auto_666168 ) ( CLEAR ?auto_666167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_666165 ?auto_666166 ?auto_666167 )
      ( MAKE-9PILE ?auto_666165 ?auto_666166 ?auto_666167 ?auto_666168 ?auto_666169 ?auto_666170 ?auto_666171 ?auto_666172 ?auto_666173 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666203 - BLOCK
      ?auto_666204 - BLOCK
      ?auto_666205 - BLOCK
      ?auto_666206 - BLOCK
      ?auto_666207 - BLOCK
      ?auto_666208 - BLOCK
      ?auto_666209 - BLOCK
      ?auto_666210 - BLOCK
      ?auto_666211 - BLOCK
    )
    :vars
    (
      ?auto_666212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666211 ?auto_666212 ) ( ON-TABLE ?auto_666203 ) ( not ( = ?auto_666203 ?auto_666204 ) ) ( not ( = ?auto_666203 ?auto_666205 ) ) ( not ( = ?auto_666203 ?auto_666206 ) ) ( not ( = ?auto_666203 ?auto_666207 ) ) ( not ( = ?auto_666203 ?auto_666208 ) ) ( not ( = ?auto_666203 ?auto_666209 ) ) ( not ( = ?auto_666203 ?auto_666210 ) ) ( not ( = ?auto_666203 ?auto_666211 ) ) ( not ( = ?auto_666203 ?auto_666212 ) ) ( not ( = ?auto_666204 ?auto_666205 ) ) ( not ( = ?auto_666204 ?auto_666206 ) ) ( not ( = ?auto_666204 ?auto_666207 ) ) ( not ( = ?auto_666204 ?auto_666208 ) ) ( not ( = ?auto_666204 ?auto_666209 ) ) ( not ( = ?auto_666204 ?auto_666210 ) ) ( not ( = ?auto_666204 ?auto_666211 ) ) ( not ( = ?auto_666204 ?auto_666212 ) ) ( not ( = ?auto_666205 ?auto_666206 ) ) ( not ( = ?auto_666205 ?auto_666207 ) ) ( not ( = ?auto_666205 ?auto_666208 ) ) ( not ( = ?auto_666205 ?auto_666209 ) ) ( not ( = ?auto_666205 ?auto_666210 ) ) ( not ( = ?auto_666205 ?auto_666211 ) ) ( not ( = ?auto_666205 ?auto_666212 ) ) ( not ( = ?auto_666206 ?auto_666207 ) ) ( not ( = ?auto_666206 ?auto_666208 ) ) ( not ( = ?auto_666206 ?auto_666209 ) ) ( not ( = ?auto_666206 ?auto_666210 ) ) ( not ( = ?auto_666206 ?auto_666211 ) ) ( not ( = ?auto_666206 ?auto_666212 ) ) ( not ( = ?auto_666207 ?auto_666208 ) ) ( not ( = ?auto_666207 ?auto_666209 ) ) ( not ( = ?auto_666207 ?auto_666210 ) ) ( not ( = ?auto_666207 ?auto_666211 ) ) ( not ( = ?auto_666207 ?auto_666212 ) ) ( not ( = ?auto_666208 ?auto_666209 ) ) ( not ( = ?auto_666208 ?auto_666210 ) ) ( not ( = ?auto_666208 ?auto_666211 ) ) ( not ( = ?auto_666208 ?auto_666212 ) ) ( not ( = ?auto_666209 ?auto_666210 ) ) ( not ( = ?auto_666209 ?auto_666211 ) ) ( not ( = ?auto_666209 ?auto_666212 ) ) ( not ( = ?auto_666210 ?auto_666211 ) ) ( not ( = ?auto_666210 ?auto_666212 ) ) ( not ( = ?auto_666211 ?auto_666212 ) ) ( ON ?auto_666210 ?auto_666211 ) ( ON ?auto_666209 ?auto_666210 ) ( ON ?auto_666208 ?auto_666209 ) ( ON ?auto_666207 ?auto_666208 ) ( ON ?auto_666206 ?auto_666207 ) ( ON ?auto_666205 ?auto_666206 ) ( CLEAR ?auto_666203 ) ( ON ?auto_666204 ?auto_666205 ) ( CLEAR ?auto_666204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_666203 ?auto_666204 )
      ( MAKE-9PILE ?auto_666203 ?auto_666204 ?auto_666205 ?auto_666206 ?auto_666207 ?auto_666208 ?auto_666209 ?auto_666210 ?auto_666211 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_666241 - BLOCK
      ?auto_666242 - BLOCK
      ?auto_666243 - BLOCK
      ?auto_666244 - BLOCK
      ?auto_666245 - BLOCK
      ?auto_666246 - BLOCK
      ?auto_666247 - BLOCK
      ?auto_666248 - BLOCK
      ?auto_666249 - BLOCK
    )
    :vars
    (
      ?auto_666250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666249 ?auto_666250 ) ( not ( = ?auto_666241 ?auto_666242 ) ) ( not ( = ?auto_666241 ?auto_666243 ) ) ( not ( = ?auto_666241 ?auto_666244 ) ) ( not ( = ?auto_666241 ?auto_666245 ) ) ( not ( = ?auto_666241 ?auto_666246 ) ) ( not ( = ?auto_666241 ?auto_666247 ) ) ( not ( = ?auto_666241 ?auto_666248 ) ) ( not ( = ?auto_666241 ?auto_666249 ) ) ( not ( = ?auto_666241 ?auto_666250 ) ) ( not ( = ?auto_666242 ?auto_666243 ) ) ( not ( = ?auto_666242 ?auto_666244 ) ) ( not ( = ?auto_666242 ?auto_666245 ) ) ( not ( = ?auto_666242 ?auto_666246 ) ) ( not ( = ?auto_666242 ?auto_666247 ) ) ( not ( = ?auto_666242 ?auto_666248 ) ) ( not ( = ?auto_666242 ?auto_666249 ) ) ( not ( = ?auto_666242 ?auto_666250 ) ) ( not ( = ?auto_666243 ?auto_666244 ) ) ( not ( = ?auto_666243 ?auto_666245 ) ) ( not ( = ?auto_666243 ?auto_666246 ) ) ( not ( = ?auto_666243 ?auto_666247 ) ) ( not ( = ?auto_666243 ?auto_666248 ) ) ( not ( = ?auto_666243 ?auto_666249 ) ) ( not ( = ?auto_666243 ?auto_666250 ) ) ( not ( = ?auto_666244 ?auto_666245 ) ) ( not ( = ?auto_666244 ?auto_666246 ) ) ( not ( = ?auto_666244 ?auto_666247 ) ) ( not ( = ?auto_666244 ?auto_666248 ) ) ( not ( = ?auto_666244 ?auto_666249 ) ) ( not ( = ?auto_666244 ?auto_666250 ) ) ( not ( = ?auto_666245 ?auto_666246 ) ) ( not ( = ?auto_666245 ?auto_666247 ) ) ( not ( = ?auto_666245 ?auto_666248 ) ) ( not ( = ?auto_666245 ?auto_666249 ) ) ( not ( = ?auto_666245 ?auto_666250 ) ) ( not ( = ?auto_666246 ?auto_666247 ) ) ( not ( = ?auto_666246 ?auto_666248 ) ) ( not ( = ?auto_666246 ?auto_666249 ) ) ( not ( = ?auto_666246 ?auto_666250 ) ) ( not ( = ?auto_666247 ?auto_666248 ) ) ( not ( = ?auto_666247 ?auto_666249 ) ) ( not ( = ?auto_666247 ?auto_666250 ) ) ( not ( = ?auto_666248 ?auto_666249 ) ) ( not ( = ?auto_666248 ?auto_666250 ) ) ( not ( = ?auto_666249 ?auto_666250 ) ) ( ON ?auto_666248 ?auto_666249 ) ( ON ?auto_666247 ?auto_666248 ) ( ON ?auto_666246 ?auto_666247 ) ( ON ?auto_666245 ?auto_666246 ) ( ON ?auto_666244 ?auto_666245 ) ( ON ?auto_666243 ?auto_666244 ) ( ON ?auto_666242 ?auto_666243 ) ( ON ?auto_666241 ?auto_666242 ) ( CLEAR ?auto_666241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_666241 )
      ( MAKE-9PILE ?auto_666241 ?auto_666242 ?auto_666243 ?auto_666244 ?auto_666245 ?auto_666246 ?auto_666247 ?auto_666248 ?auto_666249 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666280 - BLOCK
      ?auto_666281 - BLOCK
      ?auto_666282 - BLOCK
      ?auto_666283 - BLOCK
      ?auto_666284 - BLOCK
      ?auto_666285 - BLOCK
      ?auto_666286 - BLOCK
      ?auto_666287 - BLOCK
      ?auto_666288 - BLOCK
      ?auto_666289 - BLOCK
    )
    :vars
    (
      ?auto_666290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_666288 ) ( ON ?auto_666289 ?auto_666290 ) ( CLEAR ?auto_666289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_666280 ) ( ON ?auto_666281 ?auto_666280 ) ( ON ?auto_666282 ?auto_666281 ) ( ON ?auto_666283 ?auto_666282 ) ( ON ?auto_666284 ?auto_666283 ) ( ON ?auto_666285 ?auto_666284 ) ( ON ?auto_666286 ?auto_666285 ) ( ON ?auto_666287 ?auto_666286 ) ( ON ?auto_666288 ?auto_666287 ) ( not ( = ?auto_666280 ?auto_666281 ) ) ( not ( = ?auto_666280 ?auto_666282 ) ) ( not ( = ?auto_666280 ?auto_666283 ) ) ( not ( = ?auto_666280 ?auto_666284 ) ) ( not ( = ?auto_666280 ?auto_666285 ) ) ( not ( = ?auto_666280 ?auto_666286 ) ) ( not ( = ?auto_666280 ?auto_666287 ) ) ( not ( = ?auto_666280 ?auto_666288 ) ) ( not ( = ?auto_666280 ?auto_666289 ) ) ( not ( = ?auto_666280 ?auto_666290 ) ) ( not ( = ?auto_666281 ?auto_666282 ) ) ( not ( = ?auto_666281 ?auto_666283 ) ) ( not ( = ?auto_666281 ?auto_666284 ) ) ( not ( = ?auto_666281 ?auto_666285 ) ) ( not ( = ?auto_666281 ?auto_666286 ) ) ( not ( = ?auto_666281 ?auto_666287 ) ) ( not ( = ?auto_666281 ?auto_666288 ) ) ( not ( = ?auto_666281 ?auto_666289 ) ) ( not ( = ?auto_666281 ?auto_666290 ) ) ( not ( = ?auto_666282 ?auto_666283 ) ) ( not ( = ?auto_666282 ?auto_666284 ) ) ( not ( = ?auto_666282 ?auto_666285 ) ) ( not ( = ?auto_666282 ?auto_666286 ) ) ( not ( = ?auto_666282 ?auto_666287 ) ) ( not ( = ?auto_666282 ?auto_666288 ) ) ( not ( = ?auto_666282 ?auto_666289 ) ) ( not ( = ?auto_666282 ?auto_666290 ) ) ( not ( = ?auto_666283 ?auto_666284 ) ) ( not ( = ?auto_666283 ?auto_666285 ) ) ( not ( = ?auto_666283 ?auto_666286 ) ) ( not ( = ?auto_666283 ?auto_666287 ) ) ( not ( = ?auto_666283 ?auto_666288 ) ) ( not ( = ?auto_666283 ?auto_666289 ) ) ( not ( = ?auto_666283 ?auto_666290 ) ) ( not ( = ?auto_666284 ?auto_666285 ) ) ( not ( = ?auto_666284 ?auto_666286 ) ) ( not ( = ?auto_666284 ?auto_666287 ) ) ( not ( = ?auto_666284 ?auto_666288 ) ) ( not ( = ?auto_666284 ?auto_666289 ) ) ( not ( = ?auto_666284 ?auto_666290 ) ) ( not ( = ?auto_666285 ?auto_666286 ) ) ( not ( = ?auto_666285 ?auto_666287 ) ) ( not ( = ?auto_666285 ?auto_666288 ) ) ( not ( = ?auto_666285 ?auto_666289 ) ) ( not ( = ?auto_666285 ?auto_666290 ) ) ( not ( = ?auto_666286 ?auto_666287 ) ) ( not ( = ?auto_666286 ?auto_666288 ) ) ( not ( = ?auto_666286 ?auto_666289 ) ) ( not ( = ?auto_666286 ?auto_666290 ) ) ( not ( = ?auto_666287 ?auto_666288 ) ) ( not ( = ?auto_666287 ?auto_666289 ) ) ( not ( = ?auto_666287 ?auto_666290 ) ) ( not ( = ?auto_666288 ?auto_666289 ) ) ( not ( = ?auto_666288 ?auto_666290 ) ) ( not ( = ?auto_666289 ?auto_666290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_666289 ?auto_666290 )
      ( !STACK ?auto_666289 ?auto_666288 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666322 - BLOCK
      ?auto_666323 - BLOCK
      ?auto_666324 - BLOCK
      ?auto_666325 - BLOCK
      ?auto_666326 - BLOCK
      ?auto_666327 - BLOCK
      ?auto_666328 - BLOCK
      ?auto_666329 - BLOCK
      ?auto_666330 - BLOCK
      ?auto_666331 - BLOCK
    )
    :vars
    (
      ?auto_666332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666331 ?auto_666332 ) ( ON-TABLE ?auto_666322 ) ( ON ?auto_666323 ?auto_666322 ) ( ON ?auto_666324 ?auto_666323 ) ( ON ?auto_666325 ?auto_666324 ) ( ON ?auto_666326 ?auto_666325 ) ( ON ?auto_666327 ?auto_666326 ) ( ON ?auto_666328 ?auto_666327 ) ( ON ?auto_666329 ?auto_666328 ) ( not ( = ?auto_666322 ?auto_666323 ) ) ( not ( = ?auto_666322 ?auto_666324 ) ) ( not ( = ?auto_666322 ?auto_666325 ) ) ( not ( = ?auto_666322 ?auto_666326 ) ) ( not ( = ?auto_666322 ?auto_666327 ) ) ( not ( = ?auto_666322 ?auto_666328 ) ) ( not ( = ?auto_666322 ?auto_666329 ) ) ( not ( = ?auto_666322 ?auto_666330 ) ) ( not ( = ?auto_666322 ?auto_666331 ) ) ( not ( = ?auto_666322 ?auto_666332 ) ) ( not ( = ?auto_666323 ?auto_666324 ) ) ( not ( = ?auto_666323 ?auto_666325 ) ) ( not ( = ?auto_666323 ?auto_666326 ) ) ( not ( = ?auto_666323 ?auto_666327 ) ) ( not ( = ?auto_666323 ?auto_666328 ) ) ( not ( = ?auto_666323 ?auto_666329 ) ) ( not ( = ?auto_666323 ?auto_666330 ) ) ( not ( = ?auto_666323 ?auto_666331 ) ) ( not ( = ?auto_666323 ?auto_666332 ) ) ( not ( = ?auto_666324 ?auto_666325 ) ) ( not ( = ?auto_666324 ?auto_666326 ) ) ( not ( = ?auto_666324 ?auto_666327 ) ) ( not ( = ?auto_666324 ?auto_666328 ) ) ( not ( = ?auto_666324 ?auto_666329 ) ) ( not ( = ?auto_666324 ?auto_666330 ) ) ( not ( = ?auto_666324 ?auto_666331 ) ) ( not ( = ?auto_666324 ?auto_666332 ) ) ( not ( = ?auto_666325 ?auto_666326 ) ) ( not ( = ?auto_666325 ?auto_666327 ) ) ( not ( = ?auto_666325 ?auto_666328 ) ) ( not ( = ?auto_666325 ?auto_666329 ) ) ( not ( = ?auto_666325 ?auto_666330 ) ) ( not ( = ?auto_666325 ?auto_666331 ) ) ( not ( = ?auto_666325 ?auto_666332 ) ) ( not ( = ?auto_666326 ?auto_666327 ) ) ( not ( = ?auto_666326 ?auto_666328 ) ) ( not ( = ?auto_666326 ?auto_666329 ) ) ( not ( = ?auto_666326 ?auto_666330 ) ) ( not ( = ?auto_666326 ?auto_666331 ) ) ( not ( = ?auto_666326 ?auto_666332 ) ) ( not ( = ?auto_666327 ?auto_666328 ) ) ( not ( = ?auto_666327 ?auto_666329 ) ) ( not ( = ?auto_666327 ?auto_666330 ) ) ( not ( = ?auto_666327 ?auto_666331 ) ) ( not ( = ?auto_666327 ?auto_666332 ) ) ( not ( = ?auto_666328 ?auto_666329 ) ) ( not ( = ?auto_666328 ?auto_666330 ) ) ( not ( = ?auto_666328 ?auto_666331 ) ) ( not ( = ?auto_666328 ?auto_666332 ) ) ( not ( = ?auto_666329 ?auto_666330 ) ) ( not ( = ?auto_666329 ?auto_666331 ) ) ( not ( = ?auto_666329 ?auto_666332 ) ) ( not ( = ?auto_666330 ?auto_666331 ) ) ( not ( = ?auto_666330 ?auto_666332 ) ) ( not ( = ?auto_666331 ?auto_666332 ) ) ( CLEAR ?auto_666329 ) ( ON ?auto_666330 ?auto_666331 ) ( CLEAR ?auto_666330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_666322 ?auto_666323 ?auto_666324 ?auto_666325 ?auto_666326 ?auto_666327 ?auto_666328 ?auto_666329 ?auto_666330 )
      ( MAKE-10PILE ?auto_666322 ?auto_666323 ?auto_666324 ?auto_666325 ?auto_666326 ?auto_666327 ?auto_666328 ?auto_666329 ?auto_666330 ?auto_666331 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666364 - BLOCK
      ?auto_666365 - BLOCK
      ?auto_666366 - BLOCK
      ?auto_666367 - BLOCK
      ?auto_666368 - BLOCK
      ?auto_666369 - BLOCK
      ?auto_666370 - BLOCK
      ?auto_666371 - BLOCK
      ?auto_666372 - BLOCK
      ?auto_666373 - BLOCK
    )
    :vars
    (
      ?auto_666374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666373 ?auto_666374 ) ( ON-TABLE ?auto_666364 ) ( ON ?auto_666365 ?auto_666364 ) ( ON ?auto_666366 ?auto_666365 ) ( ON ?auto_666367 ?auto_666366 ) ( ON ?auto_666368 ?auto_666367 ) ( ON ?auto_666369 ?auto_666368 ) ( ON ?auto_666370 ?auto_666369 ) ( not ( = ?auto_666364 ?auto_666365 ) ) ( not ( = ?auto_666364 ?auto_666366 ) ) ( not ( = ?auto_666364 ?auto_666367 ) ) ( not ( = ?auto_666364 ?auto_666368 ) ) ( not ( = ?auto_666364 ?auto_666369 ) ) ( not ( = ?auto_666364 ?auto_666370 ) ) ( not ( = ?auto_666364 ?auto_666371 ) ) ( not ( = ?auto_666364 ?auto_666372 ) ) ( not ( = ?auto_666364 ?auto_666373 ) ) ( not ( = ?auto_666364 ?auto_666374 ) ) ( not ( = ?auto_666365 ?auto_666366 ) ) ( not ( = ?auto_666365 ?auto_666367 ) ) ( not ( = ?auto_666365 ?auto_666368 ) ) ( not ( = ?auto_666365 ?auto_666369 ) ) ( not ( = ?auto_666365 ?auto_666370 ) ) ( not ( = ?auto_666365 ?auto_666371 ) ) ( not ( = ?auto_666365 ?auto_666372 ) ) ( not ( = ?auto_666365 ?auto_666373 ) ) ( not ( = ?auto_666365 ?auto_666374 ) ) ( not ( = ?auto_666366 ?auto_666367 ) ) ( not ( = ?auto_666366 ?auto_666368 ) ) ( not ( = ?auto_666366 ?auto_666369 ) ) ( not ( = ?auto_666366 ?auto_666370 ) ) ( not ( = ?auto_666366 ?auto_666371 ) ) ( not ( = ?auto_666366 ?auto_666372 ) ) ( not ( = ?auto_666366 ?auto_666373 ) ) ( not ( = ?auto_666366 ?auto_666374 ) ) ( not ( = ?auto_666367 ?auto_666368 ) ) ( not ( = ?auto_666367 ?auto_666369 ) ) ( not ( = ?auto_666367 ?auto_666370 ) ) ( not ( = ?auto_666367 ?auto_666371 ) ) ( not ( = ?auto_666367 ?auto_666372 ) ) ( not ( = ?auto_666367 ?auto_666373 ) ) ( not ( = ?auto_666367 ?auto_666374 ) ) ( not ( = ?auto_666368 ?auto_666369 ) ) ( not ( = ?auto_666368 ?auto_666370 ) ) ( not ( = ?auto_666368 ?auto_666371 ) ) ( not ( = ?auto_666368 ?auto_666372 ) ) ( not ( = ?auto_666368 ?auto_666373 ) ) ( not ( = ?auto_666368 ?auto_666374 ) ) ( not ( = ?auto_666369 ?auto_666370 ) ) ( not ( = ?auto_666369 ?auto_666371 ) ) ( not ( = ?auto_666369 ?auto_666372 ) ) ( not ( = ?auto_666369 ?auto_666373 ) ) ( not ( = ?auto_666369 ?auto_666374 ) ) ( not ( = ?auto_666370 ?auto_666371 ) ) ( not ( = ?auto_666370 ?auto_666372 ) ) ( not ( = ?auto_666370 ?auto_666373 ) ) ( not ( = ?auto_666370 ?auto_666374 ) ) ( not ( = ?auto_666371 ?auto_666372 ) ) ( not ( = ?auto_666371 ?auto_666373 ) ) ( not ( = ?auto_666371 ?auto_666374 ) ) ( not ( = ?auto_666372 ?auto_666373 ) ) ( not ( = ?auto_666372 ?auto_666374 ) ) ( not ( = ?auto_666373 ?auto_666374 ) ) ( ON ?auto_666372 ?auto_666373 ) ( CLEAR ?auto_666370 ) ( ON ?auto_666371 ?auto_666372 ) ( CLEAR ?auto_666371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_666364 ?auto_666365 ?auto_666366 ?auto_666367 ?auto_666368 ?auto_666369 ?auto_666370 ?auto_666371 )
      ( MAKE-10PILE ?auto_666364 ?auto_666365 ?auto_666366 ?auto_666367 ?auto_666368 ?auto_666369 ?auto_666370 ?auto_666371 ?auto_666372 ?auto_666373 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666406 - BLOCK
      ?auto_666407 - BLOCK
      ?auto_666408 - BLOCK
      ?auto_666409 - BLOCK
      ?auto_666410 - BLOCK
      ?auto_666411 - BLOCK
      ?auto_666412 - BLOCK
      ?auto_666413 - BLOCK
      ?auto_666414 - BLOCK
      ?auto_666415 - BLOCK
    )
    :vars
    (
      ?auto_666416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666415 ?auto_666416 ) ( ON-TABLE ?auto_666406 ) ( ON ?auto_666407 ?auto_666406 ) ( ON ?auto_666408 ?auto_666407 ) ( ON ?auto_666409 ?auto_666408 ) ( ON ?auto_666410 ?auto_666409 ) ( ON ?auto_666411 ?auto_666410 ) ( not ( = ?auto_666406 ?auto_666407 ) ) ( not ( = ?auto_666406 ?auto_666408 ) ) ( not ( = ?auto_666406 ?auto_666409 ) ) ( not ( = ?auto_666406 ?auto_666410 ) ) ( not ( = ?auto_666406 ?auto_666411 ) ) ( not ( = ?auto_666406 ?auto_666412 ) ) ( not ( = ?auto_666406 ?auto_666413 ) ) ( not ( = ?auto_666406 ?auto_666414 ) ) ( not ( = ?auto_666406 ?auto_666415 ) ) ( not ( = ?auto_666406 ?auto_666416 ) ) ( not ( = ?auto_666407 ?auto_666408 ) ) ( not ( = ?auto_666407 ?auto_666409 ) ) ( not ( = ?auto_666407 ?auto_666410 ) ) ( not ( = ?auto_666407 ?auto_666411 ) ) ( not ( = ?auto_666407 ?auto_666412 ) ) ( not ( = ?auto_666407 ?auto_666413 ) ) ( not ( = ?auto_666407 ?auto_666414 ) ) ( not ( = ?auto_666407 ?auto_666415 ) ) ( not ( = ?auto_666407 ?auto_666416 ) ) ( not ( = ?auto_666408 ?auto_666409 ) ) ( not ( = ?auto_666408 ?auto_666410 ) ) ( not ( = ?auto_666408 ?auto_666411 ) ) ( not ( = ?auto_666408 ?auto_666412 ) ) ( not ( = ?auto_666408 ?auto_666413 ) ) ( not ( = ?auto_666408 ?auto_666414 ) ) ( not ( = ?auto_666408 ?auto_666415 ) ) ( not ( = ?auto_666408 ?auto_666416 ) ) ( not ( = ?auto_666409 ?auto_666410 ) ) ( not ( = ?auto_666409 ?auto_666411 ) ) ( not ( = ?auto_666409 ?auto_666412 ) ) ( not ( = ?auto_666409 ?auto_666413 ) ) ( not ( = ?auto_666409 ?auto_666414 ) ) ( not ( = ?auto_666409 ?auto_666415 ) ) ( not ( = ?auto_666409 ?auto_666416 ) ) ( not ( = ?auto_666410 ?auto_666411 ) ) ( not ( = ?auto_666410 ?auto_666412 ) ) ( not ( = ?auto_666410 ?auto_666413 ) ) ( not ( = ?auto_666410 ?auto_666414 ) ) ( not ( = ?auto_666410 ?auto_666415 ) ) ( not ( = ?auto_666410 ?auto_666416 ) ) ( not ( = ?auto_666411 ?auto_666412 ) ) ( not ( = ?auto_666411 ?auto_666413 ) ) ( not ( = ?auto_666411 ?auto_666414 ) ) ( not ( = ?auto_666411 ?auto_666415 ) ) ( not ( = ?auto_666411 ?auto_666416 ) ) ( not ( = ?auto_666412 ?auto_666413 ) ) ( not ( = ?auto_666412 ?auto_666414 ) ) ( not ( = ?auto_666412 ?auto_666415 ) ) ( not ( = ?auto_666412 ?auto_666416 ) ) ( not ( = ?auto_666413 ?auto_666414 ) ) ( not ( = ?auto_666413 ?auto_666415 ) ) ( not ( = ?auto_666413 ?auto_666416 ) ) ( not ( = ?auto_666414 ?auto_666415 ) ) ( not ( = ?auto_666414 ?auto_666416 ) ) ( not ( = ?auto_666415 ?auto_666416 ) ) ( ON ?auto_666414 ?auto_666415 ) ( ON ?auto_666413 ?auto_666414 ) ( CLEAR ?auto_666411 ) ( ON ?auto_666412 ?auto_666413 ) ( CLEAR ?auto_666412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_666406 ?auto_666407 ?auto_666408 ?auto_666409 ?auto_666410 ?auto_666411 ?auto_666412 )
      ( MAKE-10PILE ?auto_666406 ?auto_666407 ?auto_666408 ?auto_666409 ?auto_666410 ?auto_666411 ?auto_666412 ?auto_666413 ?auto_666414 ?auto_666415 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666448 - BLOCK
      ?auto_666449 - BLOCK
      ?auto_666450 - BLOCK
      ?auto_666451 - BLOCK
      ?auto_666452 - BLOCK
      ?auto_666453 - BLOCK
      ?auto_666454 - BLOCK
      ?auto_666455 - BLOCK
      ?auto_666456 - BLOCK
      ?auto_666457 - BLOCK
    )
    :vars
    (
      ?auto_666458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666457 ?auto_666458 ) ( ON-TABLE ?auto_666448 ) ( ON ?auto_666449 ?auto_666448 ) ( ON ?auto_666450 ?auto_666449 ) ( ON ?auto_666451 ?auto_666450 ) ( ON ?auto_666452 ?auto_666451 ) ( not ( = ?auto_666448 ?auto_666449 ) ) ( not ( = ?auto_666448 ?auto_666450 ) ) ( not ( = ?auto_666448 ?auto_666451 ) ) ( not ( = ?auto_666448 ?auto_666452 ) ) ( not ( = ?auto_666448 ?auto_666453 ) ) ( not ( = ?auto_666448 ?auto_666454 ) ) ( not ( = ?auto_666448 ?auto_666455 ) ) ( not ( = ?auto_666448 ?auto_666456 ) ) ( not ( = ?auto_666448 ?auto_666457 ) ) ( not ( = ?auto_666448 ?auto_666458 ) ) ( not ( = ?auto_666449 ?auto_666450 ) ) ( not ( = ?auto_666449 ?auto_666451 ) ) ( not ( = ?auto_666449 ?auto_666452 ) ) ( not ( = ?auto_666449 ?auto_666453 ) ) ( not ( = ?auto_666449 ?auto_666454 ) ) ( not ( = ?auto_666449 ?auto_666455 ) ) ( not ( = ?auto_666449 ?auto_666456 ) ) ( not ( = ?auto_666449 ?auto_666457 ) ) ( not ( = ?auto_666449 ?auto_666458 ) ) ( not ( = ?auto_666450 ?auto_666451 ) ) ( not ( = ?auto_666450 ?auto_666452 ) ) ( not ( = ?auto_666450 ?auto_666453 ) ) ( not ( = ?auto_666450 ?auto_666454 ) ) ( not ( = ?auto_666450 ?auto_666455 ) ) ( not ( = ?auto_666450 ?auto_666456 ) ) ( not ( = ?auto_666450 ?auto_666457 ) ) ( not ( = ?auto_666450 ?auto_666458 ) ) ( not ( = ?auto_666451 ?auto_666452 ) ) ( not ( = ?auto_666451 ?auto_666453 ) ) ( not ( = ?auto_666451 ?auto_666454 ) ) ( not ( = ?auto_666451 ?auto_666455 ) ) ( not ( = ?auto_666451 ?auto_666456 ) ) ( not ( = ?auto_666451 ?auto_666457 ) ) ( not ( = ?auto_666451 ?auto_666458 ) ) ( not ( = ?auto_666452 ?auto_666453 ) ) ( not ( = ?auto_666452 ?auto_666454 ) ) ( not ( = ?auto_666452 ?auto_666455 ) ) ( not ( = ?auto_666452 ?auto_666456 ) ) ( not ( = ?auto_666452 ?auto_666457 ) ) ( not ( = ?auto_666452 ?auto_666458 ) ) ( not ( = ?auto_666453 ?auto_666454 ) ) ( not ( = ?auto_666453 ?auto_666455 ) ) ( not ( = ?auto_666453 ?auto_666456 ) ) ( not ( = ?auto_666453 ?auto_666457 ) ) ( not ( = ?auto_666453 ?auto_666458 ) ) ( not ( = ?auto_666454 ?auto_666455 ) ) ( not ( = ?auto_666454 ?auto_666456 ) ) ( not ( = ?auto_666454 ?auto_666457 ) ) ( not ( = ?auto_666454 ?auto_666458 ) ) ( not ( = ?auto_666455 ?auto_666456 ) ) ( not ( = ?auto_666455 ?auto_666457 ) ) ( not ( = ?auto_666455 ?auto_666458 ) ) ( not ( = ?auto_666456 ?auto_666457 ) ) ( not ( = ?auto_666456 ?auto_666458 ) ) ( not ( = ?auto_666457 ?auto_666458 ) ) ( ON ?auto_666456 ?auto_666457 ) ( ON ?auto_666455 ?auto_666456 ) ( ON ?auto_666454 ?auto_666455 ) ( CLEAR ?auto_666452 ) ( ON ?auto_666453 ?auto_666454 ) ( CLEAR ?auto_666453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_666448 ?auto_666449 ?auto_666450 ?auto_666451 ?auto_666452 ?auto_666453 )
      ( MAKE-10PILE ?auto_666448 ?auto_666449 ?auto_666450 ?auto_666451 ?auto_666452 ?auto_666453 ?auto_666454 ?auto_666455 ?auto_666456 ?auto_666457 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666490 - BLOCK
      ?auto_666491 - BLOCK
      ?auto_666492 - BLOCK
      ?auto_666493 - BLOCK
      ?auto_666494 - BLOCK
      ?auto_666495 - BLOCK
      ?auto_666496 - BLOCK
      ?auto_666497 - BLOCK
      ?auto_666498 - BLOCK
      ?auto_666499 - BLOCK
    )
    :vars
    (
      ?auto_666500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666499 ?auto_666500 ) ( ON-TABLE ?auto_666490 ) ( ON ?auto_666491 ?auto_666490 ) ( ON ?auto_666492 ?auto_666491 ) ( ON ?auto_666493 ?auto_666492 ) ( not ( = ?auto_666490 ?auto_666491 ) ) ( not ( = ?auto_666490 ?auto_666492 ) ) ( not ( = ?auto_666490 ?auto_666493 ) ) ( not ( = ?auto_666490 ?auto_666494 ) ) ( not ( = ?auto_666490 ?auto_666495 ) ) ( not ( = ?auto_666490 ?auto_666496 ) ) ( not ( = ?auto_666490 ?auto_666497 ) ) ( not ( = ?auto_666490 ?auto_666498 ) ) ( not ( = ?auto_666490 ?auto_666499 ) ) ( not ( = ?auto_666490 ?auto_666500 ) ) ( not ( = ?auto_666491 ?auto_666492 ) ) ( not ( = ?auto_666491 ?auto_666493 ) ) ( not ( = ?auto_666491 ?auto_666494 ) ) ( not ( = ?auto_666491 ?auto_666495 ) ) ( not ( = ?auto_666491 ?auto_666496 ) ) ( not ( = ?auto_666491 ?auto_666497 ) ) ( not ( = ?auto_666491 ?auto_666498 ) ) ( not ( = ?auto_666491 ?auto_666499 ) ) ( not ( = ?auto_666491 ?auto_666500 ) ) ( not ( = ?auto_666492 ?auto_666493 ) ) ( not ( = ?auto_666492 ?auto_666494 ) ) ( not ( = ?auto_666492 ?auto_666495 ) ) ( not ( = ?auto_666492 ?auto_666496 ) ) ( not ( = ?auto_666492 ?auto_666497 ) ) ( not ( = ?auto_666492 ?auto_666498 ) ) ( not ( = ?auto_666492 ?auto_666499 ) ) ( not ( = ?auto_666492 ?auto_666500 ) ) ( not ( = ?auto_666493 ?auto_666494 ) ) ( not ( = ?auto_666493 ?auto_666495 ) ) ( not ( = ?auto_666493 ?auto_666496 ) ) ( not ( = ?auto_666493 ?auto_666497 ) ) ( not ( = ?auto_666493 ?auto_666498 ) ) ( not ( = ?auto_666493 ?auto_666499 ) ) ( not ( = ?auto_666493 ?auto_666500 ) ) ( not ( = ?auto_666494 ?auto_666495 ) ) ( not ( = ?auto_666494 ?auto_666496 ) ) ( not ( = ?auto_666494 ?auto_666497 ) ) ( not ( = ?auto_666494 ?auto_666498 ) ) ( not ( = ?auto_666494 ?auto_666499 ) ) ( not ( = ?auto_666494 ?auto_666500 ) ) ( not ( = ?auto_666495 ?auto_666496 ) ) ( not ( = ?auto_666495 ?auto_666497 ) ) ( not ( = ?auto_666495 ?auto_666498 ) ) ( not ( = ?auto_666495 ?auto_666499 ) ) ( not ( = ?auto_666495 ?auto_666500 ) ) ( not ( = ?auto_666496 ?auto_666497 ) ) ( not ( = ?auto_666496 ?auto_666498 ) ) ( not ( = ?auto_666496 ?auto_666499 ) ) ( not ( = ?auto_666496 ?auto_666500 ) ) ( not ( = ?auto_666497 ?auto_666498 ) ) ( not ( = ?auto_666497 ?auto_666499 ) ) ( not ( = ?auto_666497 ?auto_666500 ) ) ( not ( = ?auto_666498 ?auto_666499 ) ) ( not ( = ?auto_666498 ?auto_666500 ) ) ( not ( = ?auto_666499 ?auto_666500 ) ) ( ON ?auto_666498 ?auto_666499 ) ( ON ?auto_666497 ?auto_666498 ) ( ON ?auto_666496 ?auto_666497 ) ( ON ?auto_666495 ?auto_666496 ) ( CLEAR ?auto_666493 ) ( ON ?auto_666494 ?auto_666495 ) ( CLEAR ?auto_666494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_666490 ?auto_666491 ?auto_666492 ?auto_666493 ?auto_666494 )
      ( MAKE-10PILE ?auto_666490 ?auto_666491 ?auto_666492 ?auto_666493 ?auto_666494 ?auto_666495 ?auto_666496 ?auto_666497 ?auto_666498 ?auto_666499 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666532 - BLOCK
      ?auto_666533 - BLOCK
      ?auto_666534 - BLOCK
      ?auto_666535 - BLOCK
      ?auto_666536 - BLOCK
      ?auto_666537 - BLOCK
      ?auto_666538 - BLOCK
      ?auto_666539 - BLOCK
      ?auto_666540 - BLOCK
      ?auto_666541 - BLOCK
    )
    :vars
    (
      ?auto_666542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666541 ?auto_666542 ) ( ON-TABLE ?auto_666532 ) ( ON ?auto_666533 ?auto_666532 ) ( ON ?auto_666534 ?auto_666533 ) ( not ( = ?auto_666532 ?auto_666533 ) ) ( not ( = ?auto_666532 ?auto_666534 ) ) ( not ( = ?auto_666532 ?auto_666535 ) ) ( not ( = ?auto_666532 ?auto_666536 ) ) ( not ( = ?auto_666532 ?auto_666537 ) ) ( not ( = ?auto_666532 ?auto_666538 ) ) ( not ( = ?auto_666532 ?auto_666539 ) ) ( not ( = ?auto_666532 ?auto_666540 ) ) ( not ( = ?auto_666532 ?auto_666541 ) ) ( not ( = ?auto_666532 ?auto_666542 ) ) ( not ( = ?auto_666533 ?auto_666534 ) ) ( not ( = ?auto_666533 ?auto_666535 ) ) ( not ( = ?auto_666533 ?auto_666536 ) ) ( not ( = ?auto_666533 ?auto_666537 ) ) ( not ( = ?auto_666533 ?auto_666538 ) ) ( not ( = ?auto_666533 ?auto_666539 ) ) ( not ( = ?auto_666533 ?auto_666540 ) ) ( not ( = ?auto_666533 ?auto_666541 ) ) ( not ( = ?auto_666533 ?auto_666542 ) ) ( not ( = ?auto_666534 ?auto_666535 ) ) ( not ( = ?auto_666534 ?auto_666536 ) ) ( not ( = ?auto_666534 ?auto_666537 ) ) ( not ( = ?auto_666534 ?auto_666538 ) ) ( not ( = ?auto_666534 ?auto_666539 ) ) ( not ( = ?auto_666534 ?auto_666540 ) ) ( not ( = ?auto_666534 ?auto_666541 ) ) ( not ( = ?auto_666534 ?auto_666542 ) ) ( not ( = ?auto_666535 ?auto_666536 ) ) ( not ( = ?auto_666535 ?auto_666537 ) ) ( not ( = ?auto_666535 ?auto_666538 ) ) ( not ( = ?auto_666535 ?auto_666539 ) ) ( not ( = ?auto_666535 ?auto_666540 ) ) ( not ( = ?auto_666535 ?auto_666541 ) ) ( not ( = ?auto_666535 ?auto_666542 ) ) ( not ( = ?auto_666536 ?auto_666537 ) ) ( not ( = ?auto_666536 ?auto_666538 ) ) ( not ( = ?auto_666536 ?auto_666539 ) ) ( not ( = ?auto_666536 ?auto_666540 ) ) ( not ( = ?auto_666536 ?auto_666541 ) ) ( not ( = ?auto_666536 ?auto_666542 ) ) ( not ( = ?auto_666537 ?auto_666538 ) ) ( not ( = ?auto_666537 ?auto_666539 ) ) ( not ( = ?auto_666537 ?auto_666540 ) ) ( not ( = ?auto_666537 ?auto_666541 ) ) ( not ( = ?auto_666537 ?auto_666542 ) ) ( not ( = ?auto_666538 ?auto_666539 ) ) ( not ( = ?auto_666538 ?auto_666540 ) ) ( not ( = ?auto_666538 ?auto_666541 ) ) ( not ( = ?auto_666538 ?auto_666542 ) ) ( not ( = ?auto_666539 ?auto_666540 ) ) ( not ( = ?auto_666539 ?auto_666541 ) ) ( not ( = ?auto_666539 ?auto_666542 ) ) ( not ( = ?auto_666540 ?auto_666541 ) ) ( not ( = ?auto_666540 ?auto_666542 ) ) ( not ( = ?auto_666541 ?auto_666542 ) ) ( ON ?auto_666540 ?auto_666541 ) ( ON ?auto_666539 ?auto_666540 ) ( ON ?auto_666538 ?auto_666539 ) ( ON ?auto_666537 ?auto_666538 ) ( ON ?auto_666536 ?auto_666537 ) ( CLEAR ?auto_666534 ) ( ON ?auto_666535 ?auto_666536 ) ( CLEAR ?auto_666535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_666532 ?auto_666533 ?auto_666534 ?auto_666535 )
      ( MAKE-10PILE ?auto_666532 ?auto_666533 ?auto_666534 ?auto_666535 ?auto_666536 ?auto_666537 ?auto_666538 ?auto_666539 ?auto_666540 ?auto_666541 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666574 - BLOCK
      ?auto_666575 - BLOCK
      ?auto_666576 - BLOCK
      ?auto_666577 - BLOCK
      ?auto_666578 - BLOCK
      ?auto_666579 - BLOCK
      ?auto_666580 - BLOCK
      ?auto_666581 - BLOCK
      ?auto_666582 - BLOCK
      ?auto_666583 - BLOCK
    )
    :vars
    (
      ?auto_666584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666583 ?auto_666584 ) ( ON-TABLE ?auto_666574 ) ( ON ?auto_666575 ?auto_666574 ) ( not ( = ?auto_666574 ?auto_666575 ) ) ( not ( = ?auto_666574 ?auto_666576 ) ) ( not ( = ?auto_666574 ?auto_666577 ) ) ( not ( = ?auto_666574 ?auto_666578 ) ) ( not ( = ?auto_666574 ?auto_666579 ) ) ( not ( = ?auto_666574 ?auto_666580 ) ) ( not ( = ?auto_666574 ?auto_666581 ) ) ( not ( = ?auto_666574 ?auto_666582 ) ) ( not ( = ?auto_666574 ?auto_666583 ) ) ( not ( = ?auto_666574 ?auto_666584 ) ) ( not ( = ?auto_666575 ?auto_666576 ) ) ( not ( = ?auto_666575 ?auto_666577 ) ) ( not ( = ?auto_666575 ?auto_666578 ) ) ( not ( = ?auto_666575 ?auto_666579 ) ) ( not ( = ?auto_666575 ?auto_666580 ) ) ( not ( = ?auto_666575 ?auto_666581 ) ) ( not ( = ?auto_666575 ?auto_666582 ) ) ( not ( = ?auto_666575 ?auto_666583 ) ) ( not ( = ?auto_666575 ?auto_666584 ) ) ( not ( = ?auto_666576 ?auto_666577 ) ) ( not ( = ?auto_666576 ?auto_666578 ) ) ( not ( = ?auto_666576 ?auto_666579 ) ) ( not ( = ?auto_666576 ?auto_666580 ) ) ( not ( = ?auto_666576 ?auto_666581 ) ) ( not ( = ?auto_666576 ?auto_666582 ) ) ( not ( = ?auto_666576 ?auto_666583 ) ) ( not ( = ?auto_666576 ?auto_666584 ) ) ( not ( = ?auto_666577 ?auto_666578 ) ) ( not ( = ?auto_666577 ?auto_666579 ) ) ( not ( = ?auto_666577 ?auto_666580 ) ) ( not ( = ?auto_666577 ?auto_666581 ) ) ( not ( = ?auto_666577 ?auto_666582 ) ) ( not ( = ?auto_666577 ?auto_666583 ) ) ( not ( = ?auto_666577 ?auto_666584 ) ) ( not ( = ?auto_666578 ?auto_666579 ) ) ( not ( = ?auto_666578 ?auto_666580 ) ) ( not ( = ?auto_666578 ?auto_666581 ) ) ( not ( = ?auto_666578 ?auto_666582 ) ) ( not ( = ?auto_666578 ?auto_666583 ) ) ( not ( = ?auto_666578 ?auto_666584 ) ) ( not ( = ?auto_666579 ?auto_666580 ) ) ( not ( = ?auto_666579 ?auto_666581 ) ) ( not ( = ?auto_666579 ?auto_666582 ) ) ( not ( = ?auto_666579 ?auto_666583 ) ) ( not ( = ?auto_666579 ?auto_666584 ) ) ( not ( = ?auto_666580 ?auto_666581 ) ) ( not ( = ?auto_666580 ?auto_666582 ) ) ( not ( = ?auto_666580 ?auto_666583 ) ) ( not ( = ?auto_666580 ?auto_666584 ) ) ( not ( = ?auto_666581 ?auto_666582 ) ) ( not ( = ?auto_666581 ?auto_666583 ) ) ( not ( = ?auto_666581 ?auto_666584 ) ) ( not ( = ?auto_666582 ?auto_666583 ) ) ( not ( = ?auto_666582 ?auto_666584 ) ) ( not ( = ?auto_666583 ?auto_666584 ) ) ( ON ?auto_666582 ?auto_666583 ) ( ON ?auto_666581 ?auto_666582 ) ( ON ?auto_666580 ?auto_666581 ) ( ON ?auto_666579 ?auto_666580 ) ( ON ?auto_666578 ?auto_666579 ) ( ON ?auto_666577 ?auto_666578 ) ( CLEAR ?auto_666575 ) ( ON ?auto_666576 ?auto_666577 ) ( CLEAR ?auto_666576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_666574 ?auto_666575 ?auto_666576 )
      ( MAKE-10PILE ?auto_666574 ?auto_666575 ?auto_666576 ?auto_666577 ?auto_666578 ?auto_666579 ?auto_666580 ?auto_666581 ?auto_666582 ?auto_666583 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666616 - BLOCK
      ?auto_666617 - BLOCK
      ?auto_666618 - BLOCK
      ?auto_666619 - BLOCK
      ?auto_666620 - BLOCK
      ?auto_666621 - BLOCK
      ?auto_666622 - BLOCK
      ?auto_666623 - BLOCK
      ?auto_666624 - BLOCK
      ?auto_666625 - BLOCK
    )
    :vars
    (
      ?auto_666626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666625 ?auto_666626 ) ( ON-TABLE ?auto_666616 ) ( not ( = ?auto_666616 ?auto_666617 ) ) ( not ( = ?auto_666616 ?auto_666618 ) ) ( not ( = ?auto_666616 ?auto_666619 ) ) ( not ( = ?auto_666616 ?auto_666620 ) ) ( not ( = ?auto_666616 ?auto_666621 ) ) ( not ( = ?auto_666616 ?auto_666622 ) ) ( not ( = ?auto_666616 ?auto_666623 ) ) ( not ( = ?auto_666616 ?auto_666624 ) ) ( not ( = ?auto_666616 ?auto_666625 ) ) ( not ( = ?auto_666616 ?auto_666626 ) ) ( not ( = ?auto_666617 ?auto_666618 ) ) ( not ( = ?auto_666617 ?auto_666619 ) ) ( not ( = ?auto_666617 ?auto_666620 ) ) ( not ( = ?auto_666617 ?auto_666621 ) ) ( not ( = ?auto_666617 ?auto_666622 ) ) ( not ( = ?auto_666617 ?auto_666623 ) ) ( not ( = ?auto_666617 ?auto_666624 ) ) ( not ( = ?auto_666617 ?auto_666625 ) ) ( not ( = ?auto_666617 ?auto_666626 ) ) ( not ( = ?auto_666618 ?auto_666619 ) ) ( not ( = ?auto_666618 ?auto_666620 ) ) ( not ( = ?auto_666618 ?auto_666621 ) ) ( not ( = ?auto_666618 ?auto_666622 ) ) ( not ( = ?auto_666618 ?auto_666623 ) ) ( not ( = ?auto_666618 ?auto_666624 ) ) ( not ( = ?auto_666618 ?auto_666625 ) ) ( not ( = ?auto_666618 ?auto_666626 ) ) ( not ( = ?auto_666619 ?auto_666620 ) ) ( not ( = ?auto_666619 ?auto_666621 ) ) ( not ( = ?auto_666619 ?auto_666622 ) ) ( not ( = ?auto_666619 ?auto_666623 ) ) ( not ( = ?auto_666619 ?auto_666624 ) ) ( not ( = ?auto_666619 ?auto_666625 ) ) ( not ( = ?auto_666619 ?auto_666626 ) ) ( not ( = ?auto_666620 ?auto_666621 ) ) ( not ( = ?auto_666620 ?auto_666622 ) ) ( not ( = ?auto_666620 ?auto_666623 ) ) ( not ( = ?auto_666620 ?auto_666624 ) ) ( not ( = ?auto_666620 ?auto_666625 ) ) ( not ( = ?auto_666620 ?auto_666626 ) ) ( not ( = ?auto_666621 ?auto_666622 ) ) ( not ( = ?auto_666621 ?auto_666623 ) ) ( not ( = ?auto_666621 ?auto_666624 ) ) ( not ( = ?auto_666621 ?auto_666625 ) ) ( not ( = ?auto_666621 ?auto_666626 ) ) ( not ( = ?auto_666622 ?auto_666623 ) ) ( not ( = ?auto_666622 ?auto_666624 ) ) ( not ( = ?auto_666622 ?auto_666625 ) ) ( not ( = ?auto_666622 ?auto_666626 ) ) ( not ( = ?auto_666623 ?auto_666624 ) ) ( not ( = ?auto_666623 ?auto_666625 ) ) ( not ( = ?auto_666623 ?auto_666626 ) ) ( not ( = ?auto_666624 ?auto_666625 ) ) ( not ( = ?auto_666624 ?auto_666626 ) ) ( not ( = ?auto_666625 ?auto_666626 ) ) ( ON ?auto_666624 ?auto_666625 ) ( ON ?auto_666623 ?auto_666624 ) ( ON ?auto_666622 ?auto_666623 ) ( ON ?auto_666621 ?auto_666622 ) ( ON ?auto_666620 ?auto_666621 ) ( ON ?auto_666619 ?auto_666620 ) ( ON ?auto_666618 ?auto_666619 ) ( CLEAR ?auto_666616 ) ( ON ?auto_666617 ?auto_666618 ) ( CLEAR ?auto_666617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_666616 ?auto_666617 )
      ( MAKE-10PILE ?auto_666616 ?auto_666617 ?auto_666618 ?auto_666619 ?auto_666620 ?auto_666621 ?auto_666622 ?auto_666623 ?auto_666624 ?auto_666625 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_666658 - BLOCK
      ?auto_666659 - BLOCK
      ?auto_666660 - BLOCK
      ?auto_666661 - BLOCK
      ?auto_666662 - BLOCK
      ?auto_666663 - BLOCK
      ?auto_666664 - BLOCK
      ?auto_666665 - BLOCK
      ?auto_666666 - BLOCK
      ?auto_666667 - BLOCK
    )
    :vars
    (
      ?auto_666668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666667 ?auto_666668 ) ( not ( = ?auto_666658 ?auto_666659 ) ) ( not ( = ?auto_666658 ?auto_666660 ) ) ( not ( = ?auto_666658 ?auto_666661 ) ) ( not ( = ?auto_666658 ?auto_666662 ) ) ( not ( = ?auto_666658 ?auto_666663 ) ) ( not ( = ?auto_666658 ?auto_666664 ) ) ( not ( = ?auto_666658 ?auto_666665 ) ) ( not ( = ?auto_666658 ?auto_666666 ) ) ( not ( = ?auto_666658 ?auto_666667 ) ) ( not ( = ?auto_666658 ?auto_666668 ) ) ( not ( = ?auto_666659 ?auto_666660 ) ) ( not ( = ?auto_666659 ?auto_666661 ) ) ( not ( = ?auto_666659 ?auto_666662 ) ) ( not ( = ?auto_666659 ?auto_666663 ) ) ( not ( = ?auto_666659 ?auto_666664 ) ) ( not ( = ?auto_666659 ?auto_666665 ) ) ( not ( = ?auto_666659 ?auto_666666 ) ) ( not ( = ?auto_666659 ?auto_666667 ) ) ( not ( = ?auto_666659 ?auto_666668 ) ) ( not ( = ?auto_666660 ?auto_666661 ) ) ( not ( = ?auto_666660 ?auto_666662 ) ) ( not ( = ?auto_666660 ?auto_666663 ) ) ( not ( = ?auto_666660 ?auto_666664 ) ) ( not ( = ?auto_666660 ?auto_666665 ) ) ( not ( = ?auto_666660 ?auto_666666 ) ) ( not ( = ?auto_666660 ?auto_666667 ) ) ( not ( = ?auto_666660 ?auto_666668 ) ) ( not ( = ?auto_666661 ?auto_666662 ) ) ( not ( = ?auto_666661 ?auto_666663 ) ) ( not ( = ?auto_666661 ?auto_666664 ) ) ( not ( = ?auto_666661 ?auto_666665 ) ) ( not ( = ?auto_666661 ?auto_666666 ) ) ( not ( = ?auto_666661 ?auto_666667 ) ) ( not ( = ?auto_666661 ?auto_666668 ) ) ( not ( = ?auto_666662 ?auto_666663 ) ) ( not ( = ?auto_666662 ?auto_666664 ) ) ( not ( = ?auto_666662 ?auto_666665 ) ) ( not ( = ?auto_666662 ?auto_666666 ) ) ( not ( = ?auto_666662 ?auto_666667 ) ) ( not ( = ?auto_666662 ?auto_666668 ) ) ( not ( = ?auto_666663 ?auto_666664 ) ) ( not ( = ?auto_666663 ?auto_666665 ) ) ( not ( = ?auto_666663 ?auto_666666 ) ) ( not ( = ?auto_666663 ?auto_666667 ) ) ( not ( = ?auto_666663 ?auto_666668 ) ) ( not ( = ?auto_666664 ?auto_666665 ) ) ( not ( = ?auto_666664 ?auto_666666 ) ) ( not ( = ?auto_666664 ?auto_666667 ) ) ( not ( = ?auto_666664 ?auto_666668 ) ) ( not ( = ?auto_666665 ?auto_666666 ) ) ( not ( = ?auto_666665 ?auto_666667 ) ) ( not ( = ?auto_666665 ?auto_666668 ) ) ( not ( = ?auto_666666 ?auto_666667 ) ) ( not ( = ?auto_666666 ?auto_666668 ) ) ( not ( = ?auto_666667 ?auto_666668 ) ) ( ON ?auto_666666 ?auto_666667 ) ( ON ?auto_666665 ?auto_666666 ) ( ON ?auto_666664 ?auto_666665 ) ( ON ?auto_666663 ?auto_666664 ) ( ON ?auto_666662 ?auto_666663 ) ( ON ?auto_666661 ?auto_666662 ) ( ON ?auto_666660 ?auto_666661 ) ( ON ?auto_666659 ?auto_666660 ) ( ON ?auto_666658 ?auto_666659 ) ( CLEAR ?auto_666658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_666658 )
      ( MAKE-10PILE ?auto_666658 ?auto_666659 ?auto_666660 ?auto_666661 ?auto_666662 ?auto_666663 ?auto_666664 ?auto_666665 ?auto_666666 ?auto_666667 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666701 - BLOCK
      ?auto_666702 - BLOCK
      ?auto_666703 - BLOCK
      ?auto_666704 - BLOCK
      ?auto_666705 - BLOCK
      ?auto_666706 - BLOCK
      ?auto_666707 - BLOCK
      ?auto_666708 - BLOCK
      ?auto_666709 - BLOCK
      ?auto_666710 - BLOCK
      ?auto_666711 - BLOCK
    )
    :vars
    (
      ?auto_666712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_666710 ) ( ON ?auto_666711 ?auto_666712 ) ( CLEAR ?auto_666711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_666701 ) ( ON ?auto_666702 ?auto_666701 ) ( ON ?auto_666703 ?auto_666702 ) ( ON ?auto_666704 ?auto_666703 ) ( ON ?auto_666705 ?auto_666704 ) ( ON ?auto_666706 ?auto_666705 ) ( ON ?auto_666707 ?auto_666706 ) ( ON ?auto_666708 ?auto_666707 ) ( ON ?auto_666709 ?auto_666708 ) ( ON ?auto_666710 ?auto_666709 ) ( not ( = ?auto_666701 ?auto_666702 ) ) ( not ( = ?auto_666701 ?auto_666703 ) ) ( not ( = ?auto_666701 ?auto_666704 ) ) ( not ( = ?auto_666701 ?auto_666705 ) ) ( not ( = ?auto_666701 ?auto_666706 ) ) ( not ( = ?auto_666701 ?auto_666707 ) ) ( not ( = ?auto_666701 ?auto_666708 ) ) ( not ( = ?auto_666701 ?auto_666709 ) ) ( not ( = ?auto_666701 ?auto_666710 ) ) ( not ( = ?auto_666701 ?auto_666711 ) ) ( not ( = ?auto_666701 ?auto_666712 ) ) ( not ( = ?auto_666702 ?auto_666703 ) ) ( not ( = ?auto_666702 ?auto_666704 ) ) ( not ( = ?auto_666702 ?auto_666705 ) ) ( not ( = ?auto_666702 ?auto_666706 ) ) ( not ( = ?auto_666702 ?auto_666707 ) ) ( not ( = ?auto_666702 ?auto_666708 ) ) ( not ( = ?auto_666702 ?auto_666709 ) ) ( not ( = ?auto_666702 ?auto_666710 ) ) ( not ( = ?auto_666702 ?auto_666711 ) ) ( not ( = ?auto_666702 ?auto_666712 ) ) ( not ( = ?auto_666703 ?auto_666704 ) ) ( not ( = ?auto_666703 ?auto_666705 ) ) ( not ( = ?auto_666703 ?auto_666706 ) ) ( not ( = ?auto_666703 ?auto_666707 ) ) ( not ( = ?auto_666703 ?auto_666708 ) ) ( not ( = ?auto_666703 ?auto_666709 ) ) ( not ( = ?auto_666703 ?auto_666710 ) ) ( not ( = ?auto_666703 ?auto_666711 ) ) ( not ( = ?auto_666703 ?auto_666712 ) ) ( not ( = ?auto_666704 ?auto_666705 ) ) ( not ( = ?auto_666704 ?auto_666706 ) ) ( not ( = ?auto_666704 ?auto_666707 ) ) ( not ( = ?auto_666704 ?auto_666708 ) ) ( not ( = ?auto_666704 ?auto_666709 ) ) ( not ( = ?auto_666704 ?auto_666710 ) ) ( not ( = ?auto_666704 ?auto_666711 ) ) ( not ( = ?auto_666704 ?auto_666712 ) ) ( not ( = ?auto_666705 ?auto_666706 ) ) ( not ( = ?auto_666705 ?auto_666707 ) ) ( not ( = ?auto_666705 ?auto_666708 ) ) ( not ( = ?auto_666705 ?auto_666709 ) ) ( not ( = ?auto_666705 ?auto_666710 ) ) ( not ( = ?auto_666705 ?auto_666711 ) ) ( not ( = ?auto_666705 ?auto_666712 ) ) ( not ( = ?auto_666706 ?auto_666707 ) ) ( not ( = ?auto_666706 ?auto_666708 ) ) ( not ( = ?auto_666706 ?auto_666709 ) ) ( not ( = ?auto_666706 ?auto_666710 ) ) ( not ( = ?auto_666706 ?auto_666711 ) ) ( not ( = ?auto_666706 ?auto_666712 ) ) ( not ( = ?auto_666707 ?auto_666708 ) ) ( not ( = ?auto_666707 ?auto_666709 ) ) ( not ( = ?auto_666707 ?auto_666710 ) ) ( not ( = ?auto_666707 ?auto_666711 ) ) ( not ( = ?auto_666707 ?auto_666712 ) ) ( not ( = ?auto_666708 ?auto_666709 ) ) ( not ( = ?auto_666708 ?auto_666710 ) ) ( not ( = ?auto_666708 ?auto_666711 ) ) ( not ( = ?auto_666708 ?auto_666712 ) ) ( not ( = ?auto_666709 ?auto_666710 ) ) ( not ( = ?auto_666709 ?auto_666711 ) ) ( not ( = ?auto_666709 ?auto_666712 ) ) ( not ( = ?auto_666710 ?auto_666711 ) ) ( not ( = ?auto_666710 ?auto_666712 ) ) ( not ( = ?auto_666711 ?auto_666712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_666711 ?auto_666712 )
      ( !STACK ?auto_666711 ?auto_666710 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666747 - BLOCK
      ?auto_666748 - BLOCK
      ?auto_666749 - BLOCK
      ?auto_666750 - BLOCK
      ?auto_666751 - BLOCK
      ?auto_666752 - BLOCK
      ?auto_666753 - BLOCK
      ?auto_666754 - BLOCK
      ?auto_666755 - BLOCK
      ?auto_666756 - BLOCK
      ?auto_666757 - BLOCK
    )
    :vars
    (
      ?auto_666758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666757 ?auto_666758 ) ( ON-TABLE ?auto_666747 ) ( ON ?auto_666748 ?auto_666747 ) ( ON ?auto_666749 ?auto_666748 ) ( ON ?auto_666750 ?auto_666749 ) ( ON ?auto_666751 ?auto_666750 ) ( ON ?auto_666752 ?auto_666751 ) ( ON ?auto_666753 ?auto_666752 ) ( ON ?auto_666754 ?auto_666753 ) ( ON ?auto_666755 ?auto_666754 ) ( not ( = ?auto_666747 ?auto_666748 ) ) ( not ( = ?auto_666747 ?auto_666749 ) ) ( not ( = ?auto_666747 ?auto_666750 ) ) ( not ( = ?auto_666747 ?auto_666751 ) ) ( not ( = ?auto_666747 ?auto_666752 ) ) ( not ( = ?auto_666747 ?auto_666753 ) ) ( not ( = ?auto_666747 ?auto_666754 ) ) ( not ( = ?auto_666747 ?auto_666755 ) ) ( not ( = ?auto_666747 ?auto_666756 ) ) ( not ( = ?auto_666747 ?auto_666757 ) ) ( not ( = ?auto_666747 ?auto_666758 ) ) ( not ( = ?auto_666748 ?auto_666749 ) ) ( not ( = ?auto_666748 ?auto_666750 ) ) ( not ( = ?auto_666748 ?auto_666751 ) ) ( not ( = ?auto_666748 ?auto_666752 ) ) ( not ( = ?auto_666748 ?auto_666753 ) ) ( not ( = ?auto_666748 ?auto_666754 ) ) ( not ( = ?auto_666748 ?auto_666755 ) ) ( not ( = ?auto_666748 ?auto_666756 ) ) ( not ( = ?auto_666748 ?auto_666757 ) ) ( not ( = ?auto_666748 ?auto_666758 ) ) ( not ( = ?auto_666749 ?auto_666750 ) ) ( not ( = ?auto_666749 ?auto_666751 ) ) ( not ( = ?auto_666749 ?auto_666752 ) ) ( not ( = ?auto_666749 ?auto_666753 ) ) ( not ( = ?auto_666749 ?auto_666754 ) ) ( not ( = ?auto_666749 ?auto_666755 ) ) ( not ( = ?auto_666749 ?auto_666756 ) ) ( not ( = ?auto_666749 ?auto_666757 ) ) ( not ( = ?auto_666749 ?auto_666758 ) ) ( not ( = ?auto_666750 ?auto_666751 ) ) ( not ( = ?auto_666750 ?auto_666752 ) ) ( not ( = ?auto_666750 ?auto_666753 ) ) ( not ( = ?auto_666750 ?auto_666754 ) ) ( not ( = ?auto_666750 ?auto_666755 ) ) ( not ( = ?auto_666750 ?auto_666756 ) ) ( not ( = ?auto_666750 ?auto_666757 ) ) ( not ( = ?auto_666750 ?auto_666758 ) ) ( not ( = ?auto_666751 ?auto_666752 ) ) ( not ( = ?auto_666751 ?auto_666753 ) ) ( not ( = ?auto_666751 ?auto_666754 ) ) ( not ( = ?auto_666751 ?auto_666755 ) ) ( not ( = ?auto_666751 ?auto_666756 ) ) ( not ( = ?auto_666751 ?auto_666757 ) ) ( not ( = ?auto_666751 ?auto_666758 ) ) ( not ( = ?auto_666752 ?auto_666753 ) ) ( not ( = ?auto_666752 ?auto_666754 ) ) ( not ( = ?auto_666752 ?auto_666755 ) ) ( not ( = ?auto_666752 ?auto_666756 ) ) ( not ( = ?auto_666752 ?auto_666757 ) ) ( not ( = ?auto_666752 ?auto_666758 ) ) ( not ( = ?auto_666753 ?auto_666754 ) ) ( not ( = ?auto_666753 ?auto_666755 ) ) ( not ( = ?auto_666753 ?auto_666756 ) ) ( not ( = ?auto_666753 ?auto_666757 ) ) ( not ( = ?auto_666753 ?auto_666758 ) ) ( not ( = ?auto_666754 ?auto_666755 ) ) ( not ( = ?auto_666754 ?auto_666756 ) ) ( not ( = ?auto_666754 ?auto_666757 ) ) ( not ( = ?auto_666754 ?auto_666758 ) ) ( not ( = ?auto_666755 ?auto_666756 ) ) ( not ( = ?auto_666755 ?auto_666757 ) ) ( not ( = ?auto_666755 ?auto_666758 ) ) ( not ( = ?auto_666756 ?auto_666757 ) ) ( not ( = ?auto_666756 ?auto_666758 ) ) ( not ( = ?auto_666757 ?auto_666758 ) ) ( CLEAR ?auto_666755 ) ( ON ?auto_666756 ?auto_666757 ) ( CLEAR ?auto_666756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_666747 ?auto_666748 ?auto_666749 ?auto_666750 ?auto_666751 ?auto_666752 ?auto_666753 ?auto_666754 ?auto_666755 ?auto_666756 )
      ( MAKE-11PILE ?auto_666747 ?auto_666748 ?auto_666749 ?auto_666750 ?auto_666751 ?auto_666752 ?auto_666753 ?auto_666754 ?auto_666755 ?auto_666756 ?auto_666757 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666793 - BLOCK
      ?auto_666794 - BLOCK
      ?auto_666795 - BLOCK
      ?auto_666796 - BLOCK
      ?auto_666797 - BLOCK
      ?auto_666798 - BLOCK
      ?auto_666799 - BLOCK
      ?auto_666800 - BLOCK
      ?auto_666801 - BLOCK
      ?auto_666802 - BLOCK
      ?auto_666803 - BLOCK
    )
    :vars
    (
      ?auto_666804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666803 ?auto_666804 ) ( ON-TABLE ?auto_666793 ) ( ON ?auto_666794 ?auto_666793 ) ( ON ?auto_666795 ?auto_666794 ) ( ON ?auto_666796 ?auto_666795 ) ( ON ?auto_666797 ?auto_666796 ) ( ON ?auto_666798 ?auto_666797 ) ( ON ?auto_666799 ?auto_666798 ) ( ON ?auto_666800 ?auto_666799 ) ( not ( = ?auto_666793 ?auto_666794 ) ) ( not ( = ?auto_666793 ?auto_666795 ) ) ( not ( = ?auto_666793 ?auto_666796 ) ) ( not ( = ?auto_666793 ?auto_666797 ) ) ( not ( = ?auto_666793 ?auto_666798 ) ) ( not ( = ?auto_666793 ?auto_666799 ) ) ( not ( = ?auto_666793 ?auto_666800 ) ) ( not ( = ?auto_666793 ?auto_666801 ) ) ( not ( = ?auto_666793 ?auto_666802 ) ) ( not ( = ?auto_666793 ?auto_666803 ) ) ( not ( = ?auto_666793 ?auto_666804 ) ) ( not ( = ?auto_666794 ?auto_666795 ) ) ( not ( = ?auto_666794 ?auto_666796 ) ) ( not ( = ?auto_666794 ?auto_666797 ) ) ( not ( = ?auto_666794 ?auto_666798 ) ) ( not ( = ?auto_666794 ?auto_666799 ) ) ( not ( = ?auto_666794 ?auto_666800 ) ) ( not ( = ?auto_666794 ?auto_666801 ) ) ( not ( = ?auto_666794 ?auto_666802 ) ) ( not ( = ?auto_666794 ?auto_666803 ) ) ( not ( = ?auto_666794 ?auto_666804 ) ) ( not ( = ?auto_666795 ?auto_666796 ) ) ( not ( = ?auto_666795 ?auto_666797 ) ) ( not ( = ?auto_666795 ?auto_666798 ) ) ( not ( = ?auto_666795 ?auto_666799 ) ) ( not ( = ?auto_666795 ?auto_666800 ) ) ( not ( = ?auto_666795 ?auto_666801 ) ) ( not ( = ?auto_666795 ?auto_666802 ) ) ( not ( = ?auto_666795 ?auto_666803 ) ) ( not ( = ?auto_666795 ?auto_666804 ) ) ( not ( = ?auto_666796 ?auto_666797 ) ) ( not ( = ?auto_666796 ?auto_666798 ) ) ( not ( = ?auto_666796 ?auto_666799 ) ) ( not ( = ?auto_666796 ?auto_666800 ) ) ( not ( = ?auto_666796 ?auto_666801 ) ) ( not ( = ?auto_666796 ?auto_666802 ) ) ( not ( = ?auto_666796 ?auto_666803 ) ) ( not ( = ?auto_666796 ?auto_666804 ) ) ( not ( = ?auto_666797 ?auto_666798 ) ) ( not ( = ?auto_666797 ?auto_666799 ) ) ( not ( = ?auto_666797 ?auto_666800 ) ) ( not ( = ?auto_666797 ?auto_666801 ) ) ( not ( = ?auto_666797 ?auto_666802 ) ) ( not ( = ?auto_666797 ?auto_666803 ) ) ( not ( = ?auto_666797 ?auto_666804 ) ) ( not ( = ?auto_666798 ?auto_666799 ) ) ( not ( = ?auto_666798 ?auto_666800 ) ) ( not ( = ?auto_666798 ?auto_666801 ) ) ( not ( = ?auto_666798 ?auto_666802 ) ) ( not ( = ?auto_666798 ?auto_666803 ) ) ( not ( = ?auto_666798 ?auto_666804 ) ) ( not ( = ?auto_666799 ?auto_666800 ) ) ( not ( = ?auto_666799 ?auto_666801 ) ) ( not ( = ?auto_666799 ?auto_666802 ) ) ( not ( = ?auto_666799 ?auto_666803 ) ) ( not ( = ?auto_666799 ?auto_666804 ) ) ( not ( = ?auto_666800 ?auto_666801 ) ) ( not ( = ?auto_666800 ?auto_666802 ) ) ( not ( = ?auto_666800 ?auto_666803 ) ) ( not ( = ?auto_666800 ?auto_666804 ) ) ( not ( = ?auto_666801 ?auto_666802 ) ) ( not ( = ?auto_666801 ?auto_666803 ) ) ( not ( = ?auto_666801 ?auto_666804 ) ) ( not ( = ?auto_666802 ?auto_666803 ) ) ( not ( = ?auto_666802 ?auto_666804 ) ) ( not ( = ?auto_666803 ?auto_666804 ) ) ( ON ?auto_666802 ?auto_666803 ) ( CLEAR ?auto_666800 ) ( ON ?auto_666801 ?auto_666802 ) ( CLEAR ?auto_666801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_666793 ?auto_666794 ?auto_666795 ?auto_666796 ?auto_666797 ?auto_666798 ?auto_666799 ?auto_666800 ?auto_666801 )
      ( MAKE-11PILE ?auto_666793 ?auto_666794 ?auto_666795 ?auto_666796 ?auto_666797 ?auto_666798 ?auto_666799 ?auto_666800 ?auto_666801 ?auto_666802 ?auto_666803 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666839 - BLOCK
      ?auto_666840 - BLOCK
      ?auto_666841 - BLOCK
      ?auto_666842 - BLOCK
      ?auto_666843 - BLOCK
      ?auto_666844 - BLOCK
      ?auto_666845 - BLOCK
      ?auto_666846 - BLOCK
      ?auto_666847 - BLOCK
      ?auto_666848 - BLOCK
      ?auto_666849 - BLOCK
    )
    :vars
    (
      ?auto_666850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666849 ?auto_666850 ) ( ON-TABLE ?auto_666839 ) ( ON ?auto_666840 ?auto_666839 ) ( ON ?auto_666841 ?auto_666840 ) ( ON ?auto_666842 ?auto_666841 ) ( ON ?auto_666843 ?auto_666842 ) ( ON ?auto_666844 ?auto_666843 ) ( ON ?auto_666845 ?auto_666844 ) ( not ( = ?auto_666839 ?auto_666840 ) ) ( not ( = ?auto_666839 ?auto_666841 ) ) ( not ( = ?auto_666839 ?auto_666842 ) ) ( not ( = ?auto_666839 ?auto_666843 ) ) ( not ( = ?auto_666839 ?auto_666844 ) ) ( not ( = ?auto_666839 ?auto_666845 ) ) ( not ( = ?auto_666839 ?auto_666846 ) ) ( not ( = ?auto_666839 ?auto_666847 ) ) ( not ( = ?auto_666839 ?auto_666848 ) ) ( not ( = ?auto_666839 ?auto_666849 ) ) ( not ( = ?auto_666839 ?auto_666850 ) ) ( not ( = ?auto_666840 ?auto_666841 ) ) ( not ( = ?auto_666840 ?auto_666842 ) ) ( not ( = ?auto_666840 ?auto_666843 ) ) ( not ( = ?auto_666840 ?auto_666844 ) ) ( not ( = ?auto_666840 ?auto_666845 ) ) ( not ( = ?auto_666840 ?auto_666846 ) ) ( not ( = ?auto_666840 ?auto_666847 ) ) ( not ( = ?auto_666840 ?auto_666848 ) ) ( not ( = ?auto_666840 ?auto_666849 ) ) ( not ( = ?auto_666840 ?auto_666850 ) ) ( not ( = ?auto_666841 ?auto_666842 ) ) ( not ( = ?auto_666841 ?auto_666843 ) ) ( not ( = ?auto_666841 ?auto_666844 ) ) ( not ( = ?auto_666841 ?auto_666845 ) ) ( not ( = ?auto_666841 ?auto_666846 ) ) ( not ( = ?auto_666841 ?auto_666847 ) ) ( not ( = ?auto_666841 ?auto_666848 ) ) ( not ( = ?auto_666841 ?auto_666849 ) ) ( not ( = ?auto_666841 ?auto_666850 ) ) ( not ( = ?auto_666842 ?auto_666843 ) ) ( not ( = ?auto_666842 ?auto_666844 ) ) ( not ( = ?auto_666842 ?auto_666845 ) ) ( not ( = ?auto_666842 ?auto_666846 ) ) ( not ( = ?auto_666842 ?auto_666847 ) ) ( not ( = ?auto_666842 ?auto_666848 ) ) ( not ( = ?auto_666842 ?auto_666849 ) ) ( not ( = ?auto_666842 ?auto_666850 ) ) ( not ( = ?auto_666843 ?auto_666844 ) ) ( not ( = ?auto_666843 ?auto_666845 ) ) ( not ( = ?auto_666843 ?auto_666846 ) ) ( not ( = ?auto_666843 ?auto_666847 ) ) ( not ( = ?auto_666843 ?auto_666848 ) ) ( not ( = ?auto_666843 ?auto_666849 ) ) ( not ( = ?auto_666843 ?auto_666850 ) ) ( not ( = ?auto_666844 ?auto_666845 ) ) ( not ( = ?auto_666844 ?auto_666846 ) ) ( not ( = ?auto_666844 ?auto_666847 ) ) ( not ( = ?auto_666844 ?auto_666848 ) ) ( not ( = ?auto_666844 ?auto_666849 ) ) ( not ( = ?auto_666844 ?auto_666850 ) ) ( not ( = ?auto_666845 ?auto_666846 ) ) ( not ( = ?auto_666845 ?auto_666847 ) ) ( not ( = ?auto_666845 ?auto_666848 ) ) ( not ( = ?auto_666845 ?auto_666849 ) ) ( not ( = ?auto_666845 ?auto_666850 ) ) ( not ( = ?auto_666846 ?auto_666847 ) ) ( not ( = ?auto_666846 ?auto_666848 ) ) ( not ( = ?auto_666846 ?auto_666849 ) ) ( not ( = ?auto_666846 ?auto_666850 ) ) ( not ( = ?auto_666847 ?auto_666848 ) ) ( not ( = ?auto_666847 ?auto_666849 ) ) ( not ( = ?auto_666847 ?auto_666850 ) ) ( not ( = ?auto_666848 ?auto_666849 ) ) ( not ( = ?auto_666848 ?auto_666850 ) ) ( not ( = ?auto_666849 ?auto_666850 ) ) ( ON ?auto_666848 ?auto_666849 ) ( ON ?auto_666847 ?auto_666848 ) ( CLEAR ?auto_666845 ) ( ON ?auto_666846 ?auto_666847 ) ( CLEAR ?auto_666846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_666839 ?auto_666840 ?auto_666841 ?auto_666842 ?auto_666843 ?auto_666844 ?auto_666845 ?auto_666846 )
      ( MAKE-11PILE ?auto_666839 ?auto_666840 ?auto_666841 ?auto_666842 ?auto_666843 ?auto_666844 ?auto_666845 ?auto_666846 ?auto_666847 ?auto_666848 ?auto_666849 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666885 - BLOCK
      ?auto_666886 - BLOCK
      ?auto_666887 - BLOCK
      ?auto_666888 - BLOCK
      ?auto_666889 - BLOCK
      ?auto_666890 - BLOCK
      ?auto_666891 - BLOCK
      ?auto_666892 - BLOCK
      ?auto_666893 - BLOCK
      ?auto_666894 - BLOCK
      ?auto_666895 - BLOCK
    )
    :vars
    (
      ?auto_666896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666895 ?auto_666896 ) ( ON-TABLE ?auto_666885 ) ( ON ?auto_666886 ?auto_666885 ) ( ON ?auto_666887 ?auto_666886 ) ( ON ?auto_666888 ?auto_666887 ) ( ON ?auto_666889 ?auto_666888 ) ( ON ?auto_666890 ?auto_666889 ) ( not ( = ?auto_666885 ?auto_666886 ) ) ( not ( = ?auto_666885 ?auto_666887 ) ) ( not ( = ?auto_666885 ?auto_666888 ) ) ( not ( = ?auto_666885 ?auto_666889 ) ) ( not ( = ?auto_666885 ?auto_666890 ) ) ( not ( = ?auto_666885 ?auto_666891 ) ) ( not ( = ?auto_666885 ?auto_666892 ) ) ( not ( = ?auto_666885 ?auto_666893 ) ) ( not ( = ?auto_666885 ?auto_666894 ) ) ( not ( = ?auto_666885 ?auto_666895 ) ) ( not ( = ?auto_666885 ?auto_666896 ) ) ( not ( = ?auto_666886 ?auto_666887 ) ) ( not ( = ?auto_666886 ?auto_666888 ) ) ( not ( = ?auto_666886 ?auto_666889 ) ) ( not ( = ?auto_666886 ?auto_666890 ) ) ( not ( = ?auto_666886 ?auto_666891 ) ) ( not ( = ?auto_666886 ?auto_666892 ) ) ( not ( = ?auto_666886 ?auto_666893 ) ) ( not ( = ?auto_666886 ?auto_666894 ) ) ( not ( = ?auto_666886 ?auto_666895 ) ) ( not ( = ?auto_666886 ?auto_666896 ) ) ( not ( = ?auto_666887 ?auto_666888 ) ) ( not ( = ?auto_666887 ?auto_666889 ) ) ( not ( = ?auto_666887 ?auto_666890 ) ) ( not ( = ?auto_666887 ?auto_666891 ) ) ( not ( = ?auto_666887 ?auto_666892 ) ) ( not ( = ?auto_666887 ?auto_666893 ) ) ( not ( = ?auto_666887 ?auto_666894 ) ) ( not ( = ?auto_666887 ?auto_666895 ) ) ( not ( = ?auto_666887 ?auto_666896 ) ) ( not ( = ?auto_666888 ?auto_666889 ) ) ( not ( = ?auto_666888 ?auto_666890 ) ) ( not ( = ?auto_666888 ?auto_666891 ) ) ( not ( = ?auto_666888 ?auto_666892 ) ) ( not ( = ?auto_666888 ?auto_666893 ) ) ( not ( = ?auto_666888 ?auto_666894 ) ) ( not ( = ?auto_666888 ?auto_666895 ) ) ( not ( = ?auto_666888 ?auto_666896 ) ) ( not ( = ?auto_666889 ?auto_666890 ) ) ( not ( = ?auto_666889 ?auto_666891 ) ) ( not ( = ?auto_666889 ?auto_666892 ) ) ( not ( = ?auto_666889 ?auto_666893 ) ) ( not ( = ?auto_666889 ?auto_666894 ) ) ( not ( = ?auto_666889 ?auto_666895 ) ) ( not ( = ?auto_666889 ?auto_666896 ) ) ( not ( = ?auto_666890 ?auto_666891 ) ) ( not ( = ?auto_666890 ?auto_666892 ) ) ( not ( = ?auto_666890 ?auto_666893 ) ) ( not ( = ?auto_666890 ?auto_666894 ) ) ( not ( = ?auto_666890 ?auto_666895 ) ) ( not ( = ?auto_666890 ?auto_666896 ) ) ( not ( = ?auto_666891 ?auto_666892 ) ) ( not ( = ?auto_666891 ?auto_666893 ) ) ( not ( = ?auto_666891 ?auto_666894 ) ) ( not ( = ?auto_666891 ?auto_666895 ) ) ( not ( = ?auto_666891 ?auto_666896 ) ) ( not ( = ?auto_666892 ?auto_666893 ) ) ( not ( = ?auto_666892 ?auto_666894 ) ) ( not ( = ?auto_666892 ?auto_666895 ) ) ( not ( = ?auto_666892 ?auto_666896 ) ) ( not ( = ?auto_666893 ?auto_666894 ) ) ( not ( = ?auto_666893 ?auto_666895 ) ) ( not ( = ?auto_666893 ?auto_666896 ) ) ( not ( = ?auto_666894 ?auto_666895 ) ) ( not ( = ?auto_666894 ?auto_666896 ) ) ( not ( = ?auto_666895 ?auto_666896 ) ) ( ON ?auto_666894 ?auto_666895 ) ( ON ?auto_666893 ?auto_666894 ) ( ON ?auto_666892 ?auto_666893 ) ( CLEAR ?auto_666890 ) ( ON ?auto_666891 ?auto_666892 ) ( CLEAR ?auto_666891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_666885 ?auto_666886 ?auto_666887 ?auto_666888 ?auto_666889 ?auto_666890 ?auto_666891 )
      ( MAKE-11PILE ?auto_666885 ?auto_666886 ?auto_666887 ?auto_666888 ?auto_666889 ?auto_666890 ?auto_666891 ?auto_666892 ?auto_666893 ?auto_666894 ?auto_666895 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666931 - BLOCK
      ?auto_666932 - BLOCK
      ?auto_666933 - BLOCK
      ?auto_666934 - BLOCK
      ?auto_666935 - BLOCK
      ?auto_666936 - BLOCK
      ?auto_666937 - BLOCK
      ?auto_666938 - BLOCK
      ?auto_666939 - BLOCK
      ?auto_666940 - BLOCK
      ?auto_666941 - BLOCK
    )
    :vars
    (
      ?auto_666942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666941 ?auto_666942 ) ( ON-TABLE ?auto_666931 ) ( ON ?auto_666932 ?auto_666931 ) ( ON ?auto_666933 ?auto_666932 ) ( ON ?auto_666934 ?auto_666933 ) ( ON ?auto_666935 ?auto_666934 ) ( not ( = ?auto_666931 ?auto_666932 ) ) ( not ( = ?auto_666931 ?auto_666933 ) ) ( not ( = ?auto_666931 ?auto_666934 ) ) ( not ( = ?auto_666931 ?auto_666935 ) ) ( not ( = ?auto_666931 ?auto_666936 ) ) ( not ( = ?auto_666931 ?auto_666937 ) ) ( not ( = ?auto_666931 ?auto_666938 ) ) ( not ( = ?auto_666931 ?auto_666939 ) ) ( not ( = ?auto_666931 ?auto_666940 ) ) ( not ( = ?auto_666931 ?auto_666941 ) ) ( not ( = ?auto_666931 ?auto_666942 ) ) ( not ( = ?auto_666932 ?auto_666933 ) ) ( not ( = ?auto_666932 ?auto_666934 ) ) ( not ( = ?auto_666932 ?auto_666935 ) ) ( not ( = ?auto_666932 ?auto_666936 ) ) ( not ( = ?auto_666932 ?auto_666937 ) ) ( not ( = ?auto_666932 ?auto_666938 ) ) ( not ( = ?auto_666932 ?auto_666939 ) ) ( not ( = ?auto_666932 ?auto_666940 ) ) ( not ( = ?auto_666932 ?auto_666941 ) ) ( not ( = ?auto_666932 ?auto_666942 ) ) ( not ( = ?auto_666933 ?auto_666934 ) ) ( not ( = ?auto_666933 ?auto_666935 ) ) ( not ( = ?auto_666933 ?auto_666936 ) ) ( not ( = ?auto_666933 ?auto_666937 ) ) ( not ( = ?auto_666933 ?auto_666938 ) ) ( not ( = ?auto_666933 ?auto_666939 ) ) ( not ( = ?auto_666933 ?auto_666940 ) ) ( not ( = ?auto_666933 ?auto_666941 ) ) ( not ( = ?auto_666933 ?auto_666942 ) ) ( not ( = ?auto_666934 ?auto_666935 ) ) ( not ( = ?auto_666934 ?auto_666936 ) ) ( not ( = ?auto_666934 ?auto_666937 ) ) ( not ( = ?auto_666934 ?auto_666938 ) ) ( not ( = ?auto_666934 ?auto_666939 ) ) ( not ( = ?auto_666934 ?auto_666940 ) ) ( not ( = ?auto_666934 ?auto_666941 ) ) ( not ( = ?auto_666934 ?auto_666942 ) ) ( not ( = ?auto_666935 ?auto_666936 ) ) ( not ( = ?auto_666935 ?auto_666937 ) ) ( not ( = ?auto_666935 ?auto_666938 ) ) ( not ( = ?auto_666935 ?auto_666939 ) ) ( not ( = ?auto_666935 ?auto_666940 ) ) ( not ( = ?auto_666935 ?auto_666941 ) ) ( not ( = ?auto_666935 ?auto_666942 ) ) ( not ( = ?auto_666936 ?auto_666937 ) ) ( not ( = ?auto_666936 ?auto_666938 ) ) ( not ( = ?auto_666936 ?auto_666939 ) ) ( not ( = ?auto_666936 ?auto_666940 ) ) ( not ( = ?auto_666936 ?auto_666941 ) ) ( not ( = ?auto_666936 ?auto_666942 ) ) ( not ( = ?auto_666937 ?auto_666938 ) ) ( not ( = ?auto_666937 ?auto_666939 ) ) ( not ( = ?auto_666937 ?auto_666940 ) ) ( not ( = ?auto_666937 ?auto_666941 ) ) ( not ( = ?auto_666937 ?auto_666942 ) ) ( not ( = ?auto_666938 ?auto_666939 ) ) ( not ( = ?auto_666938 ?auto_666940 ) ) ( not ( = ?auto_666938 ?auto_666941 ) ) ( not ( = ?auto_666938 ?auto_666942 ) ) ( not ( = ?auto_666939 ?auto_666940 ) ) ( not ( = ?auto_666939 ?auto_666941 ) ) ( not ( = ?auto_666939 ?auto_666942 ) ) ( not ( = ?auto_666940 ?auto_666941 ) ) ( not ( = ?auto_666940 ?auto_666942 ) ) ( not ( = ?auto_666941 ?auto_666942 ) ) ( ON ?auto_666940 ?auto_666941 ) ( ON ?auto_666939 ?auto_666940 ) ( ON ?auto_666938 ?auto_666939 ) ( ON ?auto_666937 ?auto_666938 ) ( CLEAR ?auto_666935 ) ( ON ?auto_666936 ?auto_666937 ) ( CLEAR ?auto_666936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_666931 ?auto_666932 ?auto_666933 ?auto_666934 ?auto_666935 ?auto_666936 )
      ( MAKE-11PILE ?auto_666931 ?auto_666932 ?auto_666933 ?auto_666934 ?auto_666935 ?auto_666936 ?auto_666937 ?auto_666938 ?auto_666939 ?auto_666940 ?auto_666941 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_666977 - BLOCK
      ?auto_666978 - BLOCK
      ?auto_666979 - BLOCK
      ?auto_666980 - BLOCK
      ?auto_666981 - BLOCK
      ?auto_666982 - BLOCK
      ?auto_666983 - BLOCK
      ?auto_666984 - BLOCK
      ?auto_666985 - BLOCK
      ?auto_666986 - BLOCK
      ?auto_666987 - BLOCK
    )
    :vars
    (
      ?auto_666988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_666987 ?auto_666988 ) ( ON-TABLE ?auto_666977 ) ( ON ?auto_666978 ?auto_666977 ) ( ON ?auto_666979 ?auto_666978 ) ( ON ?auto_666980 ?auto_666979 ) ( not ( = ?auto_666977 ?auto_666978 ) ) ( not ( = ?auto_666977 ?auto_666979 ) ) ( not ( = ?auto_666977 ?auto_666980 ) ) ( not ( = ?auto_666977 ?auto_666981 ) ) ( not ( = ?auto_666977 ?auto_666982 ) ) ( not ( = ?auto_666977 ?auto_666983 ) ) ( not ( = ?auto_666977 ?auto_666984 ) ) ( not ( = ?auto_666977 ?auto_666985 ) ) ( not ( = ?auto_666977 ?auto_666986 ) ) ( not ( = ?auto_666977 ?auto_666987 ) ) ( not ( = ?auto_666977 ?auto_666988 ) ) ( not ( = ?auto_666978 ?auto_666979 ) ) ( not ( = ?auto_666978 ?auto_666980 ) ) ( not ( = ?auto_666978 ?auto_666981 ) ) ( not ( = ?auto_666978 ?auto_666982 ) ) ( not ( = ?auto_666978 ?auto_666983 ) ) ( not ( = ?auto_666978 ?auto_666984 ) ) ( not ( = ?auto_666978 ?auto_666985 ) ) ( not ( = ?auto_666978 ?auto_666986 ) ) ( not ( = ?auto_666978 ?auto_666987 ) ) ( not ( = ?auto_666978 ?auto_666988 ) ) ( not ( = ?auto_666979 ?auto_666980 ) ) ( not ( = ?auto_666979 ?auto_666981 ) ) ( not ( = ?auto_666979 ?auto_666982 ) ) ( not ( = ?auto_666979 ?auto_666983 ) ) ( not ( = ?auto_666979 ?auto_666984 ) ) ( not ( = ?auto_666979 ?auto_666985 ) ) ( not ( = ?auto_666979 ?auto_666986 ) ) ( not ( = ?auto_666979 ?auto_666987 ) ) ( not ( = ?auto_666979 ?auto_666988 ) ) ( not ( = ?auto_666980 ?auto_666981 ) ) ( not ( = ?auto_666980 ?auto_666982 ) ) ( not ( = ?auto_666980 ?auto_666983 ) ) ( not ( = ?auto_666980 ?auto_666984 ) ) ( not ( = ?auto_666980 ?auto_666985 ) ) ( not ( = ?auto_666980 ?auto_666986 ) ) ( not ( = ?auto_666980 ?auto_666987 ) ) ( not ( = ?auto_666980 ?auto_666988 ) ) ( not ( = ?auto_666981 ?auto_666982 ) ) ( not ( = ?auto_666981 ?auto_666983 ) ) ( not ( = ?auto_666981 ?auto_666984 ) ) ( not ( = ?auto_666981 ?auto_666985 ) ) ( not ( = ?auto_666981 ?auto_666986 ) ) ( not ( = ?auto_666981 ?auto_666987 ) ) ( not ( = ?auto_666981 ?auto_666988 ) ) ( not ( = ?auto_666982 ?auto_666983 ) ) ( not ( = ?auto_666982 ?auto_666984 ) ) ( not ( = ?auto_666982 ?auto_666985 ) ) ( not ( = ?auto_666982 ?auto_666986 ) ) ( not ( = ?auto_666982 ?auto_666987 ) ) ( not ( = ?auto_666982 ?auto_666988 ) ) ( not ( = ?auto_666983 ?auto_666984 ) ) ( not ( = ?auto_666983 ?auto_666985 ) ) ( not ( = ?auto_666983 ?auto_666986 ) ) ( not ( = ?auto_666983 ?auto_666987 ) ) ( not ( = ?auto_666983 ?auto_666988 ) ) ( not ( = ?auto_666984 ?auto_666985 ) ) ( not ( = ?auto_666984 ?auto_666986 ) ) ( not ( = ?auto_666984 ?auto_666987 ) ) ( not ( = ?auto_666984 ?auto_666988 ) ) ( not ( = ?auto_666985 ?auto_666986 ) ) ( not ( = ?auto_666985 ?auto_666987 ) ) ( not ( = ?auto_666985 ?auto_666988 ) ) ( not ( = ?auto_666986 ?auto_666987 ) ) ( not ( = ?auto_666986 ?auto_666988 ) ) ( not ( = ?auto_666987 ?auto_666988 ) ) ( ON ?auto_666986 ?auto_666987 ) ( ON ?auto_666985 ?auto_666986 ) ( ON ?auto_666984 ?auto_666985 ) ( ON ?auto_666983 ?auto_666984 ) ( ON ?auto_666982 ?auto_666983 ) ( CLEAR ?auto_666980 ) ( ON ?auto_666981 ?auto_666982 ) ( CLEAR ?auto_666981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_666977 ?auto_666978 ?auto_666979 ?auto_666980 ?auto_666981 )
      ( MAKE-11PILE ?auto_666977 ?auto_666978 ?auto_666979 ?auto_666980 ?auto_666981 ?auto_666982 ?auto_666983 ?auto_666984 ?auto_666985 ?auto_666986 ?auto_666987 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_667023 - BLOCK
      ?auto_667024 - BLOCK
      ?auto_667025 - BLOCK
      ?auto_667026 - BLOCK
      ?auto_667027 - BLOCK
      ?auto_667028 - BLOCK
      ?auto_667029 - BLOCK
      ?auto_667030 - BLOCK
      ?auto_667031 - BLOCK
      ?auto_667032 - BLOCK
      ?auto_667033 - BLOCK
    )
    :vars
    (
      ?auto_667034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667033 ?auto_667034 ) ( ON-TABLE ?auto_667023 ) ( ON ?auto_667024 ?auto_667023 ) ( ON ?auto_667025 ?auto_667024 ) ( not ( = ?auto_667023 ?auto_667024 ) ) ( not ( = ?auto_667023 ?auto_667025 ) ) ( not ( = ?auto_667023 ?auto_667026 ) ) ( not ( = ?auto_667023 ?auto_667027 ) ) ( not ( = ?auto_667023 ?auto_667028 ) ) ( not ( = ?auto_667023 ?auto_667029 ) ) ( not ( = ?auto_667023 ?auto_667030 ) ) ( not ( = ?auto_667023 ?auto_667031 ) ) ( not ( = ?auto_667023 ?auto_667032 ) ) ( not ( = ?auto_667023 ?auto_667033 ) ) ( not ( = ?auto_667023 ?auto_667034 ) ) ( not ( = ?auto_667024 ?auto_667025 ) ) ( not ( = ?auto_667024 ?auto_667026 ) ) ( not ( = ?auto_667024 ?auto_667027 ) ) ( not ( = ?auto_667024 ?auto_667028 ) ) ( not ( = ?auto_667024 ?auto_667029 ) ) ( not ( = ?auto_667024 ?auto_667030 ) ) ( not ( = ?auto_667024 ?auto_667031 ) ) ( not ( = ?auto_667024 ?auto_667032 ) ) ( not ( = ?auto_667024 ?auto_667033 ) ) ( not ( = ?auto_667024 ?auto_667034 ) ) ( not ( = ?auto_667025 ?auto_667026 ) ) ( not ( = ?auto_667025 ?auto_667027 ) ) ( not ( = ?auto_667025 ?auto_667028 ) ) ( not ( = ?auto_667025 ?auto_667029 ) ) ( not ( = ?auto_667025 ?auto_667030 ) ) ( not ( = ?auto_667025 ?auto_667031 ) ) ( not ( = ?auto_667025 ?auto_667032 ) ) ( not ( = ?auto_667025 ?auto_667033 ) ) ( not ( = ?auto_667025 ?auto_667034 ) ) ( not ( = ?auto_667026 ?auto_667027 ) ) ( not ( = ?auto_667026 ?auto_667028 ) ) ( not ( = ?auto_667026 ?auto_667029 ) ) ( not ( = ?auto_667026 ?auto_667030 ) ) ( not ( = ?auto_667026 ?auto_667031 ) ) ( not ( = ?auto_667026 ?auto_667032 ) ) ( not ( = ?auto_667026 ?auto_667033 ) ) ( not ( = ?auto_667026 ?auto_667034 ) ) ( not ( = ?auto_667027 ?auto_667028 ) ) ( not ( = ?auto_667027 ?auto_667029 ) ) ( not ( = ?auto_667027 ?auto_667030 ) ) ( not ( = ?auto_667027 ?auto_667031 ) ) ( not ( = ?auto_667027 ?auto_667032 ) ) ( not ( = ?auto_667027 ?auto_667033 ) ) ( not ( = ?auto_667027 ?auto_667034 ) ) ( not ( = ?auto_667028 ?auto_667029 ) ) ( not ( = ?auto_667028 ?auto_667030 ) ) ( not ( = ?auto_667028 ?auto_667031 ) ) ( not ( = ?auto_667028 ?auto_667032 ) ) ( not ( = ?auto_667028 ?auto_667033 ) ) ( not ( = ?auto_667028 ?auto_667034 ) ) ( not ( = ?auto_667029 ?auto_667030 ) ) ( not ( = ?auto_667029 ?auto_667031 ) ) ( not ( = ?auto_667029 ?auto_667032 ) ) ( not ( = ?auto_667029 ?auto_667033 ) ) ( not ( = ?auto_667029 ?auto_667034 ) ) ( not ( = ?auto_667030 ?auto_667031 ) ) ( not ( = ?auto_667030 ?auto_667032 ) ) ( not ( = ?auto_667030 ?auto_667033 ) ) ( not ( = ?auto_667030 ?auto_667034 ) ) ( not ( = ?auto_667031 ?auto_667032 ) ) ( not ( = ?auto_667031 ?auto_667033 ) ) ( not ( = ?auto_667031 ?auto_667034 ) ) ( not ( = ?auto_667032 ?auto_667033 ) ) ( not ( = ?auto_667032 ?auto_667034 ) ) ( not ( = ?auto_667033 ?auto_667034 ) ) ( ON ?auto_667032 ?auto_667033 ) ( ON ?auto_667031 ?auto_667032 ) ( ON ?auto_667030 ?auto_667031 ) ( ON ?auto_667029 ?auto_667030 ) ( ON ?auto_667028 ?auto_667029 ) ( ON ?auto_667027 ?auto_667028 ) ( CLEAR ?auto_667025 ) ( ON ?auto_667026 ?auto_667027 ) ( CLEAR ?auto_667026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_667023 ?auto_667024 ?auto_667025 ?auto_667026 )
      ( MAKE-11PILE ?auto_667023 ?auto_667024 ?auto_667025 ?auto_667026 ?auto_667027 ?auto_667028 ?auto_667029 ?auto_667030 ?auto_667031 ?auto_667032 ?auto_667033 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_667069 - BLOCK
      ?auto_667070 - BLOCK
      ?auto_667071 - BLOCK
      ?auto_667072 - BLOCK
      ?auto_667073 - BLOCK
      ?auto_667074 - BLOCK
      ?auto_667075 - BLOCK
      ?auto_667076 - BLOCK
      ?auto_667077 - BLOCK
      ?auto_667078 - BLOCK
      ?auto_667079 - BLOCK
    )
    :vars
    (
      ?auto_667080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667079 ?auto_667080 ) ( ON-TABLE ?auto_667069 ) ( ON ?auto_667070 ?auto_667069 ) ( not ( = ?auto_667069 ?auto_667070 ) ) ( not ( = ?auto_667069 ?auto_667071 ) ) ( not ( = ?auto_667069 ?auto_667072 ) ) ( not ( = ?auto_667069 ?auto_667073 ) ) ( not ( = ?auto_667069 ?auto_667074 ) ) ( not ( = ?auto_667069 ?auto_667075 ) ) ( not ( = ?auto_667069 ?auto_667076 ) ) ( not ( = ?auto_667069 ?auto_667077 ) ) ( not ( = ?auto_667069 ?auto_667078 ) ) ( not ( = ?auto_667069 ?auto_667079 ) ) ( not ( = ?auto_667069 ?auto_667080 ) ) ( not ( = ?auto_667070 ?auto_667071 ) ) ( not ( = ?auto_667070 ?auto_667072 ) ) ( not ( = ?auto_667070 ?auto_667073 ) ) ( not ( = ?auto_667070 ?auto_667074 ) ) ( not ( = ?auto_667070 ?auto_667075 ) ) ( not ( = ?auto_667070 ?auto_667076 ) ) ( not ( = ?auto_667070 ?auto_667077 ) ) ( not ( = ?auto_667070 ?auto_667078 ) ) ( not ( = ?auto_667070 ?auto_667079 ) ) ( not ( = ?auto_667070 ?auto_667080 ) ) ( not ( = ?auto_667071 ?auto_667072 ) ) ( not ( = ?auto_667071 ?auto_667073 ) ) ( not ( = ?auto_667071 ?auto_667074 ) ) ( not ( = ?auto_667071 ?auto_667075 ) ) ( not ( = ?auto_667071 ?auto_667076 ) ) ( not ( = ?auto_667071 ?auto_667077 ) ) ( not ( = ?auto_667071 ?auto_667078 ) ) ( not ( = ?auto_667071 ?auto_667079 ) ) ( not ( = ?auto_667071 ?auto_667080 ) ) ( not ( = ?auto_667072 ?auto_667073 ) ) ( not ( = ?auto_667072 ?auto_667074 ) ) ( not ( = ?auto_667072 ?auto_667075 ) ) ( not ( = ?auto_667072 ?auto_667076 ) ) ( not ( = ?auto_667072 ?auto_667077 ) ) ( not ( = ?auto_667072 ?auto_667078 ) ) ( not ( = ?auto_667072 ?auto_667079 ) ) ( not ( = ?auto_667072 ?auto_667080 ) ) ( not ( = ?auto_667073 ?auto_667074 ) ) ( not ( = ?auto_667073 ?auto_667075 ) ) ( not ( = ?auto_667073 ?auto_667076 ) ) ( not ( = ?auto_667073 ?auto_667077 ) ) ( not ( = ?auto_667073 ?auto_667078 ) ) ( not ( = ?auto_667073 ?auto_667079 ) ) ( not ( = ?auto_667073 ?auto_667080 ) ) ( not ( = ?auto_667074 ?auto_667075 ) ) ( not ( = ?auto_667074 ?auto_667076 ) ) ( not ( = ?auto_667074 ?auto_667077 ) ) ( not ( = ?auto_667074 ?auto_667078 ) ) ( not ( = ?auto_667074 ?auto_667079 ) ) ( not ( = ?auto_667074 ?auto_667080 ) ) ( not ( = ?auto_667075 ?auto_667076 ) ) ( not ( = ?auto_667075 ?auto_667077 ) ) ( not ( = ?auto_667075 ?auto_667078 ) ) ( not ( = ?auto_667075 ?auto_667079 ) ) ( not ( = ?auto_667075 ?auto_667080 ) ) ( not ( = ?auto_667076 ?auto_667077 ) ) ( not ( = ?auto_667076 ?auto_667078 ) ) ( not ( = ?auto_667076 ?auto_667079 ) ) ( not ( = ?auto_667076 ?auto_667080 ) ) ( not ( = ?auto_667077 ?auto_667078 ) ) ( not ( = ?auto_667077 ?auto_667079 ) ) ( not ( = ?auto_667077 ?auto_667080 ) ) ( not ( = ?auto_667078 ?auto_667079 ) ) ( not ( = ?auto_667078 ?auto_667080 ) ) ( not ( = ?auto_667079 ?auto_667080 ) ) ( ON ?auto_667078 ?auto_667079 ) ( ON ?auto_667077 ?auto_667078 ) ( ON ?auto_667076 ?auto_667077 ) ( ON ?auto_667075 ?auto_667076 ) ( ON ?auto_667074 ?auto_667075 ) ( ON ?auto_667073 ?auto_667074 ) ( ON ?auto_667072 ?auto_667073 ) ( CLEAR ?auto_667070 ) ( ON ?auto_667071 ?auto_667072 ) ( CLEAR ?auto_667071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_667069 ?auto_667070 ?auto_667071 )
      ( MAKE-11PILE ?auto_667069 ?auto_667070 ?auto_667071 ?auto_667072 ?auto_667073 ?auto_667074 ?auto_667075 ?auto_667076 ?auto_667077 ?auto_667078 ?auto_667079 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_667115 - BLOCK
      ?auto_667116 - BLOCK
      ?auto_667117 - BLOCK
      ?auto_667118 - BLOCK
      ?auto_667119 - BLOCK
      ?auto_667120 - BLOCK
      ?auto_667121 - BLOCK
      ?auto_667122 - BLOCK
      ?auto_667123 - BLOCK
      ?auto_667124 - BLOCK
      ?auto_667125 - BLOCK
    )
    :vars
    (
      ?auto_667126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667125 ?auto_667126 ) ( ON-TABLE ?auto_667115 ) ( not ( = ?auto_667115 ?auto_667116 ) ) ( not ( = ?auto_667115 ?auto_667117 ) ) ( not ( = ?auto_667115 ?auto_667118 ) ) ( not ( = ?auto_667115 ?auto_667119 ) ) ( not ( = ?auto_667115 ?auto_667120 ) ) ( not ( = ?auto_667115 ?auto_667121 ) ) ( not ( = ?auto_667115 ?auto_667122 ) ) ( not ( = ?auto_667115 ?auto_667123 ) ) ( not ( = ?auto_667115 ?auto_667124 ) ) ( not ( = ?auto_667115 ?auto_667125 ) ) ( not ( = ?auto_667115 ?auto_667126 ) ) ( not ( = ?auto_667116 ?auto_667117 ) ) ( not ( = ?auto_667116 ?auto_667118 ) ) ( not ( = ?auto_667116 ?auto_667119 ) ) ( not ( = ?auto_667116 ?auto_667120 ) ) ( not ( = ?auto_667116 ?auto_667121 ) ) ( not ( = ?auto_667116 ?auto_667122 ) ) ( not ( = ?auto_667116 ?auto_667123 ) ) ( not ( = ?auto_667116 ?auto_667124 ) ) ( not ( = ?auto_667116 ?auto_667125 ) ) ( not ( = ?auto_667116 ?auto_667126 ) ) ( not ( = ?auto_667117 ?auto_667118 ) ) ( not ( = ?auto_667117 ?auto_667119 ) ) ( not ( = ?auto_667117 ?auto_667120 ) ) ( not ( = ?auto_667117 ?auto_667121 ) ) ( not ( = ?auto_667117 ?auto_667122 ) ) ( not ( = ?auto_667117 ?auto_667123 ) ) ( not ( = ?auto_667117 ?auto_667124 ) ) ( not ( = ?auto_667117 ?auto_667125 ) ) ( not ( = ?auto_667117 ?auto_667126 ) ) ( not ( = ?auto_667118 ?auto_667119 ) ) ( not ( = ?auto_667118 ?auto_667120 ) ) ( not ( = ?auto_667118 ?auto_667121 ) ) ( not ( = ?auto_667118 ?auto_667122 ) ) ( not ( = ?auto_667118 ?auto_667123 ) ) ( not ( = ?auto_667118 ?auto_667124 ) ) ( not ( = ?auto_667118 ?auto_667125 ) ) ( not ( = ?auto_667118 ?auto_667126 ) ) ( not ( = ?auto_667119 ?auto_667120 ) ) ( not ( = ?auto_667119 ?auto_667121 ) ) ( not ( = ?auto_667119 ?auto_667122 ) ) ( not ( = ?auto_667119 ?auto_667123 ) ) ( not ( = ?auto_667119 ?auto_667124 ) ) ( not ( = ?auto_667119 ?auto_667125 ) ) ( not ( = ?auto_667119 ?auto_667126 ) ) ( not ( = ?auto_667120 ?auto_667121 ) ) ( not ( = ?auto_667120 ?auto_667122 ) ) ( not ( = ?auto_667120 ?auto_667123 ) ) ( not ( = ?auto_667120 ?auto_667124 ) ) ( not ( = ?auto_667120 ?auto_667125 ) ) ( not ( = ?auto_667120 ?auto_667126 ) ) ( not ( = ?auto_667121 ?auto_667122 ) ) ( not ( = ?auto_667121 ?auto_667123 ) ) ( not ( = ?auto_667121 ?auto_667124 ) ) ( not ( = ?auto_667121 ?auto_667125 ) ) ( not ( = ?auto_667121 ?auto_667126 ) ) ( not ( = ?auto_667122 ?auto_667123 ) ) ( not ( = ?auto_667122 ?auto_667124 ) ) ( not ( = ?auto_667122 ?auto_667125 ) ) ( not ( = ?auto_667122 ?auto_667126 ) ) ( not ( = ?auto_667123 ?auto_667124 ) ) ( not ( = ?auto_667123 ?auto_667125 ) ) ( not ( = ?auto_667123 ?auto_667126 ) ) ( not ( = ?auto_667124 ?auto_667125 ) ) ( not ( = ?auto_667124 ?auto_667126 ) ) ( not ( = ?auto_667125 ?auto_667126 ) ) ( ON ?auto_667124 ?auto_667125 ) ( ON ?auto_667123 ?auto_667124 ) ( ON ?auto_667122 ?auto_667123 ) ( ON ?auto_667121 ?auto_667122 ) ( ON ?auto_667120 ?auto_667121 ) ( ON ?auto_667119 ?auto_667120 ) ( ON ?auto_667118 ?auto_667119 ) ( ON ?auto_667117 ?auto_667118 ) ( CLEAR ?auto_667115 ) ( ON ?auto_667116 ?auto_667117 ) ( CLEAR ?auto_667116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_667115 ?auto_667116 )
      ( MAKE-11PILE ?auto_667115 ?auto_667116 ?auto_667117 ?auto_667118 ?auto_667119 ?auto_667120 ?auto_667121 ?auto_667122 ?auto_667123 ?auto_667124 ?auto_667125 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_667161 - BLOCK
      ?auto_667162 - BLOCK
      ?auto_667163 - BLOCK
      ?auto_667164 - BLOCK
      ?auto_667165 - BLOCK
      ?auto_667166 - BLOCK
      ?auto_667167 - BLOCK
      ?auto_667168 - BLOCK
      ?auto_667169 - BLOCK
      ?auto_667170 - BLOCK
      ?auto_667171 - BLOCK
    )
    :vars
    (
      ?auto_667172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667171 ?auto_667172 ) ( not ( = ?auto_667161 ?auto_667162 ) ) ( not ( = ?auto_667161 ?auto_667163 ) ) ( not ( = ?auto_667161 ?auto_667164 ) ) ( not ( = ?auto_667161 ?auto_667165 ) ) ( not ( = ?auto_667161 ?auto_667166 ) ) ( not ( = ?auto_667161 ?auto_667167 ) ) ( not ( = ?auto_667161 ?auto_667168 ) ) ( not ( = ?auto_667161 ?auto_667169 ) ) ( not ( = ?auto_667161 ?auto_667170 ) ) ( not ( = ?auto_667161 ?auto_667171 ) ) ( not ( = ?auto_667161 ?auto_667172 ) ) ( not ( = ?auto_667162 ?auto_667163 ) ) ( not ( = ?auto_667162 ?auto_667164 ) ) ( not ( = ?auto_667162 ?auto_667165 ) ) ( not ( = ?auto_667162 ?auto_667166 ) ) ( not ( = ?auto_667162 ?auto_667167 ) ) ( not ( = ?auto_667162 ?auto_667168 ) ) ( not ( = ?auto_667162 ?auto_667169 ) ) ( not ( = ?auto_667162 ?auto_667170 ) ) ( not ( = ?auto_667162 ?auto_667171 ) ) ( not ( = ?auto_667162 ?auto_667172 ) ) ( not ( = ?auto_667163 ?auto_667164 ) ) ( not ( = ?auto_667163 ?auto_667165 ) ) ( not ( = ?auto_667163 ?auto_667166 ) ) ( not ( = ?auto_667163 ?auto_667167 ) ) ( not ( = ?auto_667163 ?auto_667168 ) ) ( not ( = ?auto_667163 ?auto_667169 ) ) ( not ( = ?auto_667163 ?auto_667170 ) ) ( not ( = ?auto_667163 ?auto_667171 ) ) ( not ( = ?auto_667163 ?auto_667172 ) ) ( not ( = ?auto_667164 ?auto_667165 ) ) ( not ( = ?auto_667164 ?auto_667166 ) ) ( not ( = ?auto_667164 ?auto_667167 ) ) ( not ( = ?auto_667164 ?auto_667168 ) ) ( not ( = ?auto_667164 ?auto_667169 ) ) ( not ( = ?auto_667164 ?auto_667170 ) ) ( not ( = ?auto_667164 ?auto_667171 ) ) ( not ( = ?auto_667164 ?auto_667172 ) ) ( not ( = ?auto_667165 ?auto_667166 ) ) ( not ( = ?auto_667165 ?auto_667167 ) ) ( not ( = ?auto_667165 ?auto_667168 ) ) ( not ( = ?auto_667165 ?auto_667169 ) ) ( not ( = ?auto_667165 ?auto_667170 ) ) ( not ( = ?auto_667165 ?auto_667171 ) ) ( not ( = ?auto_667165 ?auto_667172 ) ) ( not ( = ?auto_667166 ?auto_667167 ) ) ( not ( = ?auto_667166 ?auto_667168 ) ) ( not ( = ?auto_667166 ?auto_667169 ) ) ( not ( = ?auto_667166 ?auto_667170 ) ) ( not ( = ?auto_667166 ?auto_667171 ) ) ( not ( = ?auto_667166 ?auto_667172 ) ) ( not ( = ?auto_667167 ?auto_667168 ) ) ( not ( = ?auto_667167 ?auto_667169 ) ) ( not ( = ?auto_667167 ?auto_667170 ) ) ( not ( = ?auto_667167 ?auto_667171 ) ) ( not ( = ?auto_667167 ?auto_667172 ) ) ( not ( = ?auto_667168 ?auto_667169 ) ) ( not ( = ?auto_667168 ?auto_667170 ) ) ( not ( = ?auto_667168 ?auto_667171 ) ) ( not ( = ?auto_667168 ?auto_667172 ) ) ( not ( = ?auto_667169 ?auto_667170 ) ) ( not ( = ?auto_667169 ?auto_667171 ) ) ( not ( = ?auto_667169 ?auto_667172 ) ) ( not ( = ?auto_667170 ?auto_667171 ) ) ( not ( = ?auto_667170 ?auto_667172 ) ) ( not ( = ?auto_667171 ?auto_667172 ) ) ( ON ?auto_667170 ?auto_667171 ) ( ON ?auto_667169 ?auto_667170 ) ( ON ?auto_667168 ?auto_667169 ) ( ON ?auto_667167 ?auto_667168 ) ( ON ?auto_667166 ?auto_667167 ) ( ON ?auto_667165 ?auto_667166 ) ( ON ?auto_667164 ?auto_667165 ) ( ON ?auto_667163 ?auto_667164 ) ( ON ?auto_667162 ?auto_667163 ) ( ON ?auto_667161 ?auto_667162 ) ( CLEAR ?auto_667161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_667161 )
      ( MAKE-11PILE ?auto_667161 ?auto_667162 ?auto_667163 ?auto_667164 ?auto_667165 ?auto_667166 ?auto_667167 ?auto_667168 ?auto_667169 ?auto_667170 ?auto_667171 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667208 - BLOCK
      ?auto_667209 - BLOCK
      ?auto_667210 - BLOCK
      ?auto_667211 - BLOCK
      ?auto_667212 - BLOCK
      ?auto_667213 - BLOCK
      ?auto_667214 - BLOCK
      ?auto_667215 - BLOCK
      ?auto_667216 - BLOCK
      ?auto_667217 - BLOCK
      ?auto_667218 - BLOCK
      ?auto_667219 - BLOCK
    )
    :vars
    (
      ?auto_667220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_667218 ) ( ON ?auto_667219 ?auto_667220 ) ( CLEAR ?auto_667219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_667208 ) ( ON ?auto_667209 ?auto_667208 ) ( ON ?auto_667210 ?auto_667209 ) ( ON ?auto_667211 ?auto_667210 ) ( ON ?auto_667212 ?auto_667211 ) ( ON ?auto_667213 ?auto_667212 ) ( ON ?auto_667214 ?auto_667213 ) ( ON ?auto_667215 ?auto_667214 ) ( ON ?auto_667216 ?auto_667215 ) ( ON ?auto_667217 ?auto_667216 ) ( ON ?auto_667218 ?auto_667217 ) ( not ( = ?auto_667208 ?auto_667209 ) ) ( not ( = ?auto_667208 ?auto_667210 ) ) ( not ( = ?auto_667208 ?auto_667211 ) ) ( not ( = ?auto_667208 ?auto_667212 ) ) ( not ( = ?auto_667208 ?auto_667213 ) ) ( not ( = ?auto_667208 ?auto_667214 ) ) ( not ( = ?auto_667208 ?auto_667215 ) ) ( not ( = ?auto_667208 ?auto_667216 ) ) ( not ( = ?auto_667208 ?auto_667217 ) ) ( not ( = ?auto_667208 ?auto_667218 ) ) ( not ( = ?auto_667208 ?auto_667219 ) ) ( not ( = ?auto_667208 ?auto_667220 ) ) ( not ( = ?auto_667209 ?auto_667210 ) ) ( not ( = ?auto_667209 ?auto_667211 ) ) ( not ( = ?auto_667209 ?auto_667212 ) ) ( not ( = ?auto_667209 ?auto_667213 ) ) ( not ( = ?auto_667209 ?auto_667214 ) ) ( not ( = ?auto_667209 ?auto_667215 ) ) ( not ( = ?auto_667209 ?auto_667216 ) ) ( not ( = ?auto_667209 ?auto_667217 ) ) ( not ( = ?auto_667209 ?auto_667218 ) ) ( not ( = ?auto_667209 ?auto_667219 ) ) ( not ( = ?auto_667209 ?auto_667220 ) ) ( not ( = ?auto_667210 ?auto_667211 ) ) ( not ( = ?auto_667210 ?auto_667212 ) ) ( not ( = ?auto_667210 ?auto_667213 ) ) ( not ( = ?auto_667210 ?auto_667214 ) ) ( not ( = ?auto_667210 ?auto_667215 ) ) ( not ( = ?auto_667210 ?auto_667216 ) ) ( not ( = ?auto_667210 ?auto_667217 ) ) ( not ( = ?auto_667210 ?auto_667218 ) ) ( not ( = ?auto_667210 ?auto_667219 ) ) ( not ( = ?auto_667210 ?auto_667220 ) ) ( not ( = ?auto_667211 ?auto_667212 ) ) ( not ( = ?auto_667211 ?auto_667213 ) ) ( not ( = ?auto_667211 ?auto_667214 ) ) ( not ( = ?auto_667211 ?auto_667215 ) ) ( not ( = ?auto_667211 ?auto_667216 ) ) ( not ( = ?auto_667211 ?auto_667217 ) ) ( not ( = ?auto_667211 ?auto_667218 ) ) ( not ( = ?auto_667211 ?auto_667219 ) ) ( not ( = ?auto_667211 ?auto_667220 ) ) ( not ( = ?auto_667212 ?auto_667213 ) ) ( not ( = ?auto_667212 ?auto_667214 ) ) ( not ( = ?auto_667212 ?auto_667215 ) ) ( not ( = ?auto_667212 ?auto_667216 ) ) ( not ( = ?auto_667212 ?auto_667217 ) ) ( not ( = ?auto_667212 ?auto_667218 ) ) ( not ( = ?auto_667212 ?auto_667219 ) ) ( not ( = ?auto_667212 ?auto_667220 ) ) ( not ( = ?auto_667213 ?auto_667214 ) ) ( not ( = ?auto_667213 ?auto_667215 ) ) ( not ( = ?auto_667213 ?auto_667216 ) ) ( not ( = ?auto_667213 ?auto_667217 ) ) ( not ( = ?auto_667213 ?auto_667218 ) ) ( not ( = ?auto_667213 ?auto_667219 ) ) ( not ( = ?auto_667213 ?auto_667220 ) ) ( not ( = ?auto_667214 ?auto_667215 ) ) ( not ( = ?auto_667214 ?auto_667216 ) ) ( not ( = ?auto_667214 ?auto_667217 ) ) ( not ( = ?auto_667214 ?auto_667218 ) ) ( not ( = ?auto_667214 ?auto_667219 ) ) ( not ( = ?auto_667214 ?auto_667220 ) ) ( not ( = ?auto_667215 ?auto_667216 ) ) ( not ( = ?auto_667215 ?auto_667217 ) ) ( not ( = ?auto_667215 ?auto_667218 ) ) ( not ( = ?auto_667215 ?auto_667219 ) ) ( not ( = ?auto_667215 ?auto_667220 ) ) ( not ( = ?auto_667216 ?auto_667217 ) ) ( not ( = ?auto_667216 ?auto_667218 ) ) ( not ( = ?auto_667216 ?auto_667219 ) ) ( not ( = ?auto_667216 ?auto_667220 ) ) ( not ( = ?auto_667217 ?auto_667218 ) ) ( not ( = ?auto_667217 ?auto_667219 ) ) ( not ( = ?auto_667217 ?auto_667220 ) ) ( not ( = ?auto_667218 ?auto_667219 ) ) ( not ( = ?auto_667218 ?auto_667220 ) ) ( not ( = ?auto_667219 ?auto_667220 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_667219 ?auto_667220 )
      ( !STACK ?auto_667219 ?auto_667218 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667258 - BLOCK
      ?auto_667259 - BLOCK
      ?auto_667260 - BLOCK
      ?auto_667261 - BLOCK
      ?auto_667262 - BLOCK
      ?auto_667263 - BLOCK
      ?auto_667264 - BLOCK
      ?auto_667265 - BLOCK
      ?auto_667266 - BLOCK
      ?auto_667267 - BLOCK
      ?auto_667268 - BLOCK
      ?auto_667269 - BLOCK
    )
    :vars
    (
      ?auto_667270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667269 ?auto_667270 ) ( ON-TABLE ?auto_667258 ) ( ON ?auto_667259 ?auto_667258 ) ( ON ?auto_667260 ?auto_667259 ) ( ON ?auto_667261 ?auto_667260 ) ( ON ?auto_667262 ?auto_667261 ) ( ON ?auto_667263 ?auto_667262 ) ( ON ?auto_667264 ?auto_667263 ) ( ON ?auto_667265 ?auto_667264 ) ( ON ?auto_667266 ?auto_667265 ) ( ON ?auto_667267 ?auto_667266 ) ( not ( = ?auto_667258 ?auto_667259 ) ) ( not ( = ?auto_667258 ?auto_667260 ) ) ( not ( = ?auto_667258 ?auto_667261 ) ) ( not ( = ?auto_667258 ?auto_667262 ) ) ( not ( = ?auto_667258 ?auto_667263 ) ) ( not ( = ?auto_667258 ?auto_667264 ) ) ( not ( = ?auto_667258 ?auto_667265 ) ) ( not ( = ?auto_667258 ?auto_667266 ) ) ( not ( = ?auto_667258 ?auto_667267 ) ) ( not ( = ?auto_667258 ?auto_667268 ) ) ( not ( = ?auto_667258 ?auto_667269 ) ) ( not ( = ?auto_667258 ?auto_667270 ) ) ( not ( = ?auto_667259 ?auto_667260 ) ) ( not ( = ?auto_667259 ?auto_667261 ) ) ( not ( = ?auto_667259 ?auto_667262 ) ) ( not ( = ?auto_667259 ?auto_667263 ) ) ( not ( = ?auto_667259 ?auto_667264 ) ) ( not ( = ?auto_667259 ?auto_667265 ) ) ( not ( = ?auto_667259 ?auto_667266 ) ) ( not ( = ?auto_667259 ?auto_667267 ) ) ( not ( = ?auto_667259 ?auto_667268 ) ) ( not ( = ?auto_667259 ?auto_667269 ) ) ( not ( = ?auto_667259 ?auto_667270 ) ) ( not ( = ?auto_667260 ?auto_667261 ) ) ( not ( = ?auto_667260 ?auto_667262 ) ) ( not ( = ?auto_667260 ?auto_667263 ) ) ( not ( = ?auto_667260 ?auto_667264 ) ) ( not ( = ?auto_667260 ?auto_667265 ) ) ( not ( = ?auto_667260 ?auto_667266 ) ) ( not ( = ?auto_667260 ?auto_667267 ) ) ( not ( = ?auto_667260 ?auto_667268 ) ) ( not ( = ?auto_667260 ?auto_667269 ) ) ( not ( = ?auto_667260 ?auto_667270 ) ) ( not ( = ?auto_667261 ?auto_667262 ) ) ( not ( = ?auto_667261 ?auto_667263 ) ) ( not ( = ?auto_667261 ?auto_667264 ) ) ( not ( = ?auto_667261 ?auto_667265 ) ) ( not ( = ?auto_667261 ?auto_667266 ) ) ( not ( = ?auto_667261 ?auto_667267 ) ) ( not ( = ?auto_667261 ?auto_667268 ) ) ( not ( = ?auto_667261 ?auto_667269 ) ) ( not ( = ?auto_667261 ?auto_667270 ) ) ( not ( = ?auto_667262 ?auto_667263 ) ) ( not ( = ?auto_667262 ?auto_667264 ) ) ( not ( = ?auto_667262 ?auto_667265 ) ) ( not ( = ?auto_667262 ?auto_667266 ) ) ( not ( = ?auto_667262 ?auto_667267 ) ) ( not ( = ?auto_667262 ?auto_667268 ) ) ( not ( = ?auto_667262 ?auto_667269 ) ) ( not ( = ?auto_667262 ?auto_667270 ) ) ( not ( = ?auto_667263 ?auto_667264 ) ) ( not ( = ?auto_667263 ?auto_667265 ) ) ( not ( = ?auto_667263 ?auto_667266 ) ) ( not ( = ?auto_667263 ?auto_667267 ) ) ( not ( = ?auto_667263 ?auto_667268 ) ) ( not ( = ?auto_667263 ?auto_667269 ) ) ( not ( = ?auto_667263 ?auto_667270 ) ) ( not ( = ?auto_667264 ?auto_667265 ) ) ( not ( = ?auto_667264 ?auto_667266 ) ) ( not ( = ?auto_667264 ?auto_667267 ) ) ( not ( = ?auto_667264 ?auto_667268 ) ) ( not ( = ?auto_667264 ?auto_667269 ) ) ( not ( = ?auto_667264 ?auto_667270 ) ) ( not ( = ?auto_667265 ?auto_667266 ) ) ( not ( = ?auto_667265 ?auto_667267 ) ) ( not ( = ?auto_667265 ?auto_667268 ) ) ( not ( = ?auto_667265 ?auto_667269 ) ) ( not ( = ?auto_667265 ?auto_667270 ) ) ( not ( = ?auto_667266 ?auto_667267 ) ) ( not ( = ?auto_667266 ?auto_667268 ) ) ( not ( = ?auto_667266 ?auto_667269 ) ) ( not ( = ?auto_667266 ?auto_667270 ) ) ( not ( = ?auto_667267 ?auto_667268 ) ) ( not ( = ?auto_667267 ?auto_667269 ) ) ( not ( = ?auto_667267 ?auto_667270 ) ) ( not ( = ?auto_667268 ?auto_667269 ) ) ( not ( = ?auto_667268 ?auto_667270 ) ) ( not ( = ?auto_667269 ?auto_667270 ) ) ( CLEAR ?auto_667267 ) ( ON ?auto_667268 ?auto_667269 ) ( CLEAR ?auto_667268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_667258 ?auto_667259 ?auto_667260 ?auto_667261 ?auto_667262 ?auto_667263 ?auto_667264 ?auto_667265 ?auto_667266 ?auto_667267 ?auto_667268 )
      ( MAKE-12PILE ?auto_667258 ?auto_667259 ?auto_667260 ?auto_667261 ?auto_667262 ?auto_667263 ?auto_667264 ?auto_667265 ?auto_667266 ?auto_667267 ?auto_667268 ?auto_667269 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667308 - BLOCK
      ?auto_667309 - BLOCK
      ?auto_667310 - BLOCK
      ?auto_667311 - BLOCK
      ?auto_667312 - BLOCK
      ?auto_667313 - BLOCK
      ?auto_667314 - BLOCK
      ?auto_667315 - BLOCK
      ?auto_667316 - BLOCK
      ?auto_667317 - BLOCK
      ?auto_667318 - BLOCK
      ?auto_667319 - BLOCK
    )
    :vars
    (
      ?auto_667320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667319 ?auto_667320 ) ( ON-TABLE ?auto_667308 ) ( ON ?auto_667309 ?auto_667308 ) ( ON ?auto_667310 ?auto_667309 ) ( ON ?auto_667311 ?auto_667310 ) ( ON ?auto_667312 ?auto_667311 ) ( ON ?auto_667313 ?auto_667312 ) ( ON ?auto_667314 ?auto_667313 ) ( ON ?auto_667315 ?auto_667314 ) ( ON ?auto_667316 ?auto_667315 ) ( not ( = ?auto_667308 ?auto_667309 ) ) ( not ( = ?auto_667308 ?auto_667310 ) ) ( not ( = ?auto_667308 ?auto_667311 ) ) ( not ( = ?auto_667308 ?auto_667312 ) ) ( not ( = ?auto_667308 ?auto_667313 ) ) ( not ( = ?auto_667308 ?auto_667314 ) ) ( not ( = ?auto_667308 ?auto_667315 ) ) ( not ( = ?auto_667308 ?auto_667316 ) ) ( not ( = ?auto_667308 ?auto_667317 ) ) ( not ( = ?auto_667308 ?auto_667318 ) ) ( not ( = ?auto_667308 ?auto_667319 ) ) ( not ( = ?auto_667308 ?auto_667320 ) ) ( not ( = ?auto_667309 ?auto_667310 ) ) ( not ( = ?auto_667309 ?auto_667311 ) ) ( not ( = ?auto_667309 ?auto_667312 ) ) ( not ( = ?auto_667309 ?auto_667313 ) ) ( not ( = ?auto_667309 ?auto_667314 ) ) ( not ( = ?auto_667309 ?auto_667315 ) ) ( not ( = ?auto_667309 ?auto_667316 ) ) ( not ( = ?auto_667309 ?auto_667317 ) ) ( not ( = ?auto_667309 ?auto_667318 ) ) ( not ( = ?auto_667309 ?auto_667319 ) ) ( not ( = ?auto_667309 ?auto_667320 ) ) ( not ( = ?auto_667310 ?auto_667311 ) ) ( not ( = ?auto_667310 ?auto_667312 ) ) ( not ( = ?auto_667310 ?auto_667313 ) ) ( not ( = ?auto_667310 ?auto_667314 ) ) ( not ( = ?auto_667310 ?auto_667315 ) ) ( not ( = ?auto_667310 ?auto_667316 ) ) ( not ( = ?auto_667310 ?auto_667317 ) ) ( not ( = ?auto_667310 ?auto_667318 ) ) ( not ( = ?auto_667310 ?auto_667319 ) ) ( not ( = ?auto_667310 ?auto_667320 ) ) ( not ( = ?auto_667311 ?auto_667312 ) ) ( not ( = ?auto_667311 ?auto_667313 ) ) ( not ( = ?auto_667311 ?auto_667314 ) ) ( not ( = ?auto_667311 ?auto_667315 ) ) ( not ( = ?auto_667311 ?auto_667316 ) ) ( not ( = ?auto_667311 ?auto_667317 ) ) ( not ( = ?auto_667311 ?auto_667318 ) ) ( not ( = ?auto_667311 ?auto_667319 ) ) ( not ( = ?auto_667311 ?auto_667320 ) ) ( not ( = ?auto_667312 ?auto_667313 ) ) ( not ( = ?auto_667312 ?auto_667314 ) ) ( not ( = ?auto_667312 ?auto_667315 ) ) ( not ( = ?auto_667312 ?auto_667316 ) ) ( not ( = ?auto_667312 ?auto_667317 ) ) ( not ( = ?auto_667312 ?auto_667318 ) ) ( not ( = ?auto_667312 ?auto_667319 ) ) ( not ( = ?auto_667312 ?auto_667320 ) ) ( not ( = ?auto_667313 ?auto_667314 ) ) ( not ( = ?auto_667313 ?auto_667315 ) ) ( not ( = ?auto_667313 ?auto_667316 ) ) ( not ( = ?auto_667313 ?auto_667317 ) ) ( not ( = ?auto_667313 ?auto_667318 ) ) ( not ( = ?auto_667313 ?auto_667319 ) ) ( not ( = ?auto_667313 ?auto_667320 ) ) ( not ( = ?auto_667314 ?auto_667315 ) ) ( not ( = ?auto_667314 ?auto_667316 ) ) ( not ( = ?auto_667314 ?auto_667317 ) ) ( not ( = ?auto_667314 ?auto_667318 ) ) ( not ( = ?auto_667314 ?auto_667319 ) ) ( not ( = ?auto_667314 ?auto_667320 ) ) ( not ( = ?auto_667315 ?auto_667316 ) ) ( not ( = ?auto_667315 ?auto_667317 ) ) ( not ( = ?auto_667315 ?auto_667318 ) ) ( not ( = ?auto_667315 ?auto_667319 ) ) ( not ( = ?auto_667315 ?auto_667320 ) ) ( not ( = ?auto_667316 ?auto_667317 ) ) ( not ( = ?auto_667316 ?auto_667318 ) ) ( not ( = ?auto_667316 ?auto_667319 ) ) ( not ( = ?auto_667316 ?auto_667320 ) ) ( not ( = ?auto_667317 ?auto_667318 ) ) ( not ( = ?auto_667317 ?auto_667319 ) ) ( not ( = ?auto_667317 ?auto_667320 ) ) ( not ( = ?auto_667318 ?auto_667319 ) ) ( not ( = ?auto_667318 ?auto_667320 ) ) ( not ( = ?auto_667319 ?auto_667320 ) ) ( ON ?auto_667318 ?auto_667319 ) ( CLEAR ?auto_667316 ) ( ON ?auto_667317 ?auto_667318 ) ( CLEAR ?auto_667317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_667308 ?auto_667309 ?auto_667310 ?auto_667311 ?auto_667312 ?auto_667313 ?auto_667314 ?auto_667315 ?auto_667316 ?auto_667317 )
      ( MAKE-12PILE ?auto_667308 ?auto_667309 ?auto_667310 ?auto_667311 ?auto_667312 ?auto_667313 ?auto_667314 ?auto_667315 ?auto_667316 ?auto_667317 ?auto_667318 ?auto_667319 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667358 - BLOCK
      ?auto_667359 - BLOCK
      ?auto_667360 - BLOCK
      ?auto_667361 - BLOCK
      ?auto_667362 - BLOCK
      ?auto_667363 - BLOCK
      ?auto_667364 - BLOCK
      ?auto_667365 - BLOCK
      ?auto_667366 - BLOCK
      ?auto_667367 - BLOCK
      ?auto_667368 - BLOCK
      ?auto_667369 - BLOCK
    )
    :vars
    (
      ?auto_667370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667369 ?auto_667370 ) ( ON-TABLE ?auto_667358 ) ( ON ?auto_667359 ?auto_667358 ) ( ON ?auto_667360 ?auto_667359 ) ( ON ?auto_667361 ?auto_667360 ) ( ON ?auto_667362 ?auto_667361 ) ( ON ?auto_667363 ?auto_667362 ) ( ON ?auto_667364 ?auto_667363 ) ( ON ?auto_667365 ?auto_667364 ) ( not ( = ?auto_667358 ?auto_667359 ) ) ( not ( = ?auto_667358 ?auto_667360 ) ) ( not ( = ?auto_667358 ?auto_667361 ) ) ( not ( = ?auto_667358 ?auto_667362 ) ) ( not ( = ?auto_667358 ?auto_667363 ) ) ( not ( = ?auto_667358 ?auto_667364 ) ) ( not ( = ?auto_667358 ?auto_667365 ) ) ( not ( = ?auto_667358 ?auto_667366 ) ) ( not ( = ?auto_667358 ?auto_667367 ) ) ( not ( = ?auto_667358 ?auto_667368 ) ) ( not ( = ?auto_667358 ?auto_667369 ) ) ( not ( = ?auto_667358 ?auto_667370 ) ) ( not ( = ?auto_667359 ?auto_667360 ) ) ( not ( = ?auto_667359 ?auto_667361 ) ) ( not ( = ?auto_667359 ?auto_667362 ) ) ( not ( = ?auto_667359 ?auto_667363 ) ) ( not ( = ?auto_667359 ?auto_667364 ) ) ( not ( = ?auto_667359 ?auto_667365 ) ) ( not ( = ?auto_667359 ?auto_667366 ) ) ( not ( = ?auto_667359 ?auto_667367 ) ) ( not ( = ?auto_667359 ?auto_667368 ) ) ( not ( = ?auto_667359 ?auto_667369 ) ) ( not ( = ?auto_667359 ?auto_667370 ) ) ( not ( = ?auto_667360 ?auto_667361 ) ) ( not ( = ?auto_667360 ?auto_667362 ) ) ( not ( = ?auto_667360 ?auto_667363 ) ) ( not ( = ?auto_667360 ?auto_667364 ) ) ( not ( = ?auto_667360 ?auto_667365 ) ) ( not ( = ?auto_667360 ?auto_667366 ) ) ( not ( = ?auto_667360 ?auto_667367 ) ) ( not ( = ?auto_667360 ?auto_667368 ) ) ( not ( = ?auto_667360 ?auto_667369 ) ) ( not ( = ?auto_667360 ?auto_667370 ) ) ( not ( = ?auto_667361 ?auto_667362 ) ) ( not ( = ?auto_667361 ?auto_667363 ) ) ( not ( = ?auto_667361 ?auto_667364 ) ) ( not ( = ?auto_667361 ?auto_667365 ) ) ( not ( = ?auto_667361 ?auto_667366 ) ) ( not ( = ?auto_667361 ?auto_667367 ) ) ( not ( = ?auto_667361 ?auto_667368 ) ) ( not ( = ?auto_667361 ?auto_667369 ) ) ( not ( = ?auto_667361 ?auto_667370 ) ) ( not ( = ?auto_667362 ?auto_667363 ) ) ( not ( = ?auto_667362 ?auto_667364 ) ) ( not ( = ?auto_667362 ?auto_667365 ) ) ( not ( = ?auto_667362 ?auto_667366 ) ) ( not ( = ?auto_667362 ?auto_667367 ) ) ( not ( = ?auto_667362 ?auto_667368 ) ) ( not ( = ?auto_667362 ?auto_667369 ) ) ( not ( = ?auto_667362 ?auto_667370 ) ) ( not ( = ?auto_667363 ?auto_667364 ) ) ( not ( = ?auto_667363 ?auto_667365 ) ) ( not ( = ?auto_667363 ?auto_667366 ) ) ( not ( = ?auto_667363 ?auto_667367 ) ) ( not ( = ?auto_667363 ?auto_667368 ) ) ( not ( = ?auto_667363 ?auto_667369 ) ) ( not ( = ?auto_667363 ?auto_667370 ) ) ( not ( = ?auto_667364 ?auto_667365 ) ) ( not ( = ?auto_667364 ?auto_667366 ) ) ( not ( = ?auto_667364 ?auto_667367 ) ) ( not ( = ?auto_667364 ?auto_667368 ) ) ( not ( = ?auto_667364 ?auto_667369 ) ) ( not ( = ?auto_667364 ?auto_667370 ) ) ( not ( = ?auto_667365 ?auto_667366 ) ) ( not ( = ?auto_667365 ?auto_667367 ) ) ( not ( = ?auto_667365 ?auto_667368 ) ) ( not ( = ?auto_667365 ?auto_667369 ) ) ( not ( = ?auto_667365 ?auto_667370 ) ) ( not ( = ?auto_667366 ?auto_667367 ) ) ( not ( = ?auto_667366 ?auto_667368 ) ) ( not ( = ?auto_667366 ?auto_667369 ) ) ( not ( = ?auto_667366 ?auto_667370 ) ) ( not ( = ?auto_667367 ?auto_667368 ) ) ( not ( = ?auto_667367 ?auto_667369 ) ) ( not ( = ?auto_667367 ?auto_667370 ) ) ( not ( = ?auto_667368 ?auto_667369 ) ) ( not ( = ?auto_667368 ?auto_667370 ) ) ( not ( = ?auto_667369 ?auto_667370 ) ) ( ON ?auto_667368 ?auto_667369 ) ( ON ?auto_667367 ?auto_667368 ) ( CLEAR ?auto_667365 ) ( ON ?auto_667366 ?auto_667367 ) ( CLEAR ?auto_667366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_667358 ?auto_667359 ?auto_667360 ?auto_667361 ?auto_667362 ?auto_667363 ?auto_667364 ?auto_667365 ?auto_667366 )
      ( MAKE-12PILE ?auto_667358 ?auto_667359 ?auto_667360 ?auto_667361 ?auto_667362 ?auto_667363 ?auto_667364 ?auto_667365 ?auto_667366 ?auto_667367 ?auto_667368 ?auto_667369 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667408 - BLOCK
      ?auto_667409 - BLOCK
      ?auto_667410 - BLOCK
      ?auto_667411 - BLOCK
      ?auto_667412 - BLOCK
      ?auto_667413 - BLOCK
      ?auto_667414 - BLOCK
      ?auto_667415 - BLOCK
      ?auto_667416 - BLOCK
      ?auto_667417 - BLOCK
      ?auto_667418 - BLOCK
      ?auto_667419 - BLOCK
    )
    :vars
    (
      ?auto_667420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667419 ?auto_667420 ) ( ON-TABLE ?auto_667408 ) ( ON ?auto_667409 ?auto_667408 ) ( ON ?auto_667410 ?auto_667409 ) ( ON ?auto_667411 ?auto_667410 ) ( ON ?auto_667412 ?auto_667411 ) ( ON ?auto_667413 ?auto_667412 ) ( ON ?auto_667414 ?auto_667413 ) ( not ( = ?auto_667408 ?auto_667409 ) ) ( not ( = ?auto_667408 ?auto_667410 ) ) ( not ( = ?auto_667408 ?auto_667411 ) ) ( not ( = ?auto_667408 ?auto_667412 ) ) ( not ( = ?auto_667408 ?auto_667413 ) ) ( not ( = ?auto_667408 ?auto_667414 ) ) ( not ( = ?auto_667408 ?auto_667415 ) ) ( not ( = ?auto_667408 ?auto_667416 ) ) ( not ( = ?auto_667408 ?auto_667417 ) ) ( not ( = ?auto_667408 ?auto_667418 ) ) ( not ( = ?auto_667408 ?auto_667419 ) ) ( not ( = ?auto_667408 ?auto_667420 ) ) ( not ( = ?auto_667409 ?auto_667410 ) ) ( not ( = ?auto_667409 ?auto_667411 ) ) ( not ( = ?auto_667409 ?auto_667412 ) ) ( not ( = ?auto_667409 ?auto_667413 ) ) ( not ( = ?auto_667409 ?auto_667414 ) ) ( not ( = ?auto_667409 ?auto_667415 ) ) ( not ( = ?auto_667409 ?auto_667416 ) ) ( not ( = ?auto_667409 ?auto_667417 ) ) ( not ( = ?auto_667409 ?auto_667418 ) ) ( not ( = ?auto_667409 ?auto_667419 ) ) ( not ( = ?auto_667409 ?auto_667420 ) ) ( not ( = ?auto_667410 ?auto_667411 ) ) ( not ( = ?auto_667410 ?auto_667412 ) ) ( not ( = ?auto_667410 ?auto_667413 ) ) ( not ( = ?auto_667410 ?auto_667414 ) ) ( not ( = ?auto_667410 ?auto_667415 ) ) ( not ( = ?auto_667410 ?auto_667416 ) ) ( not ( = ?auto_667410 ?auto_667417 ) ) ( not ( = ?auto_667410 ?auto_667418 ) ) ( not ( = ?auto_667410 ?auto_667419 ) ) ( not ( = ?auto_667410 ?auto_667420 ) ) ( not ( = ?auto_667411 ?auto_667412 ) ) ( not ( = ?auto_667411 ?auto_667413 ) ) ( not ( = ?auto_667411 ?auto_667414 ) ) ( not ( = ?auto_667411 ?auto_667415 ) ) ( not ( = ?auto_667411 ?auto_667416 ) ) ( not ( = ?auto_667411 ?auto_667417 ) ) ( not ( = ?auto_667411 ?auto_667418 ) ) ( not ( = ?auto_667411 ?auto_667419 ) ) ( not ( = ?auto_667411 ?auto_667420 ) ) ( not ( = ?auto_667412 ?auto_667413 ) ) ( not ( = ?auto_667412 ?auto_667414 ) ) ( not ( = ?auto_667412 ?auto_667415 ) ) ( not ( = ?auto_667412 ?auto_667416 ) ) ( not ( = ?auto_667412 ?auto_667417 ) ) ( not ( = ?auto_667412 ?auto_667418 ) ) ( not ( = ?auto_667412 ?auto_667419 ) ) ( not ( = ?auto_667412 ?auto_667420 ) ) ( not ( = ?auto_667413 ?auto_667414 ) ) ( not ( = ?auto_667413 ?auto_667415 ) ) ( not ( = ?auto_667413 ?auto_667416 ) ) ( not ( = ?auto_667413 ?auto_667417 ) ) ( not ( = ?auto_667413 ?auto_667418 ) ) ( not ( = ?auto_667413 ?auto_667419 ) ) ( not ( = ?auto_667413 ?auto_667420 ) ) ( not ( = ?auto_667414 ?auto_667415 ) ) ( not ( = ?auto_667414 ?auto_667416 ) ) ( not ( = ?auto_667414 ?auto_667417 ) ) ( not ( = ?auto_667414 ?auto_667418 ) ) ( not ( = ?auto_667414 ?auto_667419 ) ) ( not ( = ?auto_667414 ?auto_667420 ) ) ( not ( = ?auto_667415 ?auto_667416 ) ) ( not ( = ?auto_667415 ?auto_667417 ) ) ( not ( = ?auto_667415 ?auto_667418 ) ) ( not ( = ?auto_667415 ?auto_667419 ) ) ( not ( = ?auto_667415 ?auto_667420 ) ) ( not ( = ?auto_667416 ?auto_667417 ) ) ( not ( = ?auto_667416 ?auto_667418 ) ) ( not ( = ?auto_667416 ?auto_667419 ) ) ( not ( = ?auto_667416 ?auto_667420 ) ) ( not ( = ?auto_667417 ?auto_667418 ) ) ( not ( = ?auto_667417 ?auto_667419 ) ) ( not ( = ?auto_667417 ?auto_667420 ) ) ( not ( = ?auto_667418 ?auto_667419 ) ) ( not ( = ?auto_667418 ?auto_667420 ) ) ( not ( = ?auto_667419 ?auto_667420 ) ) ( ON ?auto_667418 ?auto_667419 ) ( ON ?auto_667417 ?auto_667418 ) ( ON ?auto_667416 ?auto_667417 ) ( CLEAR ?auto_667414 ) ( ON ?auto_667415 ?auto_667416 ) ( CLEAR ?auto_667415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_667408 ?auto_667409 ?auto_667410 ?auto_667411 ?auto_667412 ?auto_667413 ?auto_667414 ?auto_667415 )
      ( MAKE-12PILE ?auto_667408 ?auto_667409 ?auto_667410 ?auto_667411 ?auto_667412 ?auto_667413 ?auto_667414 ?auto_667415 ?auto_667416 ?auto_667417 ?auto_667418 ?auto_667419 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667458 - BLOCK
      ?auto_667459 - BLOCK
      ?auto_667460 - BLOCK
      ?auto_667461 - BLOCK
      ?auto_667462 - BLOCK
      ?auto_667463 - BLOCK
      ?auto_667464 - BLOCK
      ?auto_667465 - BLOCK
      ?auto_667466 - BLOCK
      ?auto_667467 - BLOCK
      ?auto_667468 - BLOCK
      ?auto_667469 - BLOCK
    )
    :vars
    (
      ?auto_667470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667469 ?auto_667470 ) ( ON-TABLE ?auto_667458 ) ( ON ?auto_667459 ?auto_667458 ) ( ON ?auto_667460 ?auto_667459 ) ( ON ?auto_667461 ?auto_667460 ) ( ON ?auto_667462 ?auto_667461 ) ( ON ?auto_667463 ?auto_667462 ) ( not ( = ?auto_667458 ?auto_667459 ) ) ( not ( = ?auto_667458 ?auto_667460 ) ) ( not ( = ?auto_667458 ?auto_667461 ) ) ( not ( = ?auto_667458 ?auto_667462 ) ) ( not ( = ?auto_667458 ?auto_667463 ) ) ( not ( = ?auto_667458 ?auto_667464 ) ) ( not ( = ?auto_667458 ?auto_667465 ) ) ( not ( = ?auto_667458 ?auto_667466 ) ) ( not ( = ?auto_667458 ?auto_667467 ) ) ( not ( = ?auto_667458 ?auto_667468 ) ) ( not ( = ?auto_667458 ?auto_667469 ) ) ( not ( = ?auto_667458 ?auto_667470 ) ) ( not ( = ?auto_667459 ?auto_667460 ) ) ( not ( = ?auto_667459 ?auto_667461 ) ) ( not ( = ?auto_667459 ?auto_667462 ) ) ( not ( = ?auto_667459 ?auto_667463 ) ) ( not ( = ?auto_667459 ?auto_667464 ) ) ( not ( = ?auto_667459 ?auto_667465 ) ) ( not ( = ?auto_667459 ?auto_667466 ) ) ( not ( = ?auto_667459 ?auto_667467 ) ) ( not ( = ?auto_667459 ?auto_667468 ) ) ( not ( = ?auto_667459 ?auto_667469 ) ) ( not ( = ?auto_667459 ?auto_667470 ) ) ( not ( = ?auto_667460 ?auto_667461 ) ) ( not ( = ?auto_667460 ?auto_667462 ) ) ( not ( = ?auto_667460 ?auto_667463 ) ) ( not ( = ?auto_667460 ?auto_667464 ) ) ( not ( = ?auto_667460 ?auto_667465 ) ) ( not ( = ?auto_667460 ?auto_667466 ) ) ( not ( = ?auto_667460 ?auto_667467 ) ) ( not ( = ?auto_667460 ?auto_667468 ) ) ( not ( = ?auto_667460 ?auto_667469 ) ) ( not ( = ?auto_667460 ?auto_667470 ) ) ( not ( = ?auto_667461 ?auto_667462 ) ) ( not ( = ?auto_667461 ?auto_667463 ) ) ( not ( = ?auto_667461 ?auto_667464 ) ) ( not ( = ?auto_667461 ?auto_667465 ) ) ( not ( = ?auto_667461 ?auto_667466 ) ) ( not ( = ?auto_667461 ?auto_667467 ) ) ( not ( = ?auto_667461 ?auto_667468 ) ) ( not ( = ?auto_667461 ?auto_667469 ) ) ( not ( = ?auto_667461 ?auto_667470 ) ) ( not ( = ?auto_667462 ?auto_667463 ) ) ( not ( = ?auto_667462 ?auto_667464 ) ) ( not ( = ?auto_667462 ?auto_667465 ) ) ( not ( = ?auto_667462 ?auto_667466 ) ) ( not ( = ?auto_667462 ?auto_667467 ) ) ( not ( = ?auto_667462 ?auto_667468 ) ) ( not ( = ?auto_667462 ?auto_667469 ) ) ( not ( = ?auto_667462 ?auto_667470 ) ) ( not ( = ?auto_667463 ?auto_667464 ) ) ( not ( = ?auto_667463 ?auto_667465 ) ) ( not ( = ?auto_667463 ?auto_667466 ) ) ( not ( = ?auto_667463 ?auto_667467 ) ) ( not ( = ?auto_667463 ?auto_667468 ) ) ( not ( = ?auto_667463 ?auto_667469 ) ) ( not ( = ?auto_667463 ?auto_667470 ) ) ( not ( = ?auto_667464 ?auto_667465 ) ) ( not ( = ?auto_667464 ?auto_667466 ) ) ( not ( = ?auto_667464 ?auto_667467 ) ) ( not ( = ?auto_667464 ?auto_667468 ) ) ( not ( = ?auto_667464 ?auto_667469 ) ) ( not ( = ?auto_667464 ?auto_667470 ) ) ( not ( = ?auto_667465 ?auto_667466 ) ) ( not ( = ?auto_667465 ?auto_667467 ) ) ( not ( = ?auto_667465 ?auto_667468 ) ) ( not ( = ?auto_667465 ?auto_667469 ) ) ( not ( = ?auto_667465 ?auto_667470 ) ) ( not ( = ?auto_667466 ?auto_667467 ) ) ( not ( = ?auto_667466 ?auto_667468 ) ) ( not ( = ?auto_667466 ?auto_667469 ) ) ( not ( = ?auto_667466 ?auto_667470 ) ) ( not ( = ?auto_667467 ?auto_667468 ) ) ( not ( = ?auto_667467 ?auto_667469 ) ) ( not ( = ?auto_667467 ?auto_667470 ) ) ( not ( = ?auto_667468 ?auto_667469 ) ) ( not ( = ?auto_667468 ?auto_667470 ) ) ( not ( = ?auto_667469 ?auto_667470 ) ) ( ON ?auto_667468 ?auto_667469 ) ( ON ?auto_667467 ?auto_667468 ) ( ON ?auto_667466 ?auto_667467 ) ( ON ?auto_667465 ?auto_667466 ) ( CLEAR ?auto_667463 ) ( ON ?auto_667464 ?auto_667465 ) ( CLEAR ?auto_667464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_667458 ?auto_667459 ?auto_667460 ?auto_667461 ?auto_667462 ?auto_667463 ?auto_667464 )
      ( MAKE-12PILE ?auto_667458 ?auto_667459 ?auto_667460 ?auto_667461 ?auto_667462 ?auto_667463 ?auto_667464 ?auto_667465 ?auto_667466 ?auto_667467 ?auto_667468 ?auto_667469 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667508 - BLOCK
      ?auto_667509 - BLOCK
      ?auto_667510 - BLOCK
      ?auto_667511 - BLOCK
      ?auto_667512 - BLOCK
      ?auto_667513 - BLOCK
      ?auto_667514 - BLOCK
      ?auto_667515 - BLOCK
      ?auto_667516 - BLOCK
      ?auto_667517 - BLOCK
      ?auto_667518 - BLOCK
      ?auto_667519 - BLOCK
    )
    :vars
    (
      ?auto_667520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667519 ?auto_667520 ) ( ON-TABLE ?auto_667508 ) ( ON ?auto_667509 ?auto_667508 ) ( ON ?auto_667510 ?auto_667509 ) ( ON ?auto_667511 ?auto_667510 ) ( ON ?auto_667512 ?auto_667511 ) ( not ( = ?auto_667508 ?auto_667509 ) ) ( not ( = ?auto_667508 ?auto_667510 ) ) ( not ( = ?auto_667508 ?auto_667511 ) ) ( not ( = ?auto_667508 ?auto_667512 ) ) ( not ( = ?auto_667508 ?auto_667513 ) ) ( not ( = ?auto_667508 ?auto_667514 ) ) ( not ( = ?auto_667508 ?auto_667515 ) ) ( not ( = ?auto_667508 ?auto_667516 ) ) ( not ( = ?auto_667508 ?auto_667517 ) ) ( not ( = ?auto_667508 ?auto_667518 ) ) ( not ( = ?auto_667508 ?auto_667519 ) ) ( not ( = ?auto_667508 ?auto_667520 ) ) ( not ( = ?auto_667509 ?auto_667510 ) ) ( not ( = ?auto_667509 ?auto_667511 ) ) ( not ( = ?auto_667509 ?auto_667512 ) ) ( not ( = ?auto_667509 ?auto_667513 ) ) ( not ( = ?auto_667509 ?auto_667514 ) ) ( not ( = ?auto_667509 ?auto_667515 ) ) ( not ( = ?auto_667509 ?auto_667516 ) ) ( not ( = ?auto_667509 ?auto_667517 ) ) ( not ( = ?auto_667509 ?auto_667518 ) ) ( not ( = ?auto_667509 ?auto_667519 ) ) ( not ( = ?auto_667509 ?auto_667520 ) ) ( not ( = ?auto_667510 ?auto_667511 ) ) ( not ( = ?auto_667510 ?auto_667512 ) ) ( not ( = ?auto_667510 ?auto_667513 ) ) ( not ( = ?auto_667510 ?auto_667514 ) ) ( not ( = ?auto_667510 ?auto_667515 ) ) ( not ( = ?auto_667510 ?auto_667516 ) ) ( not ( = ?auto_667510 ?auto_667517 ) ) ( not ( = ?auto_667510 ?auto_667518 ) ) ( not ( = ?auto_667510 ?auto_667519 ) ) ( not ( = ?auto_667510 ?auto_667520 ) ) ( not ( = ?auto_667511 ?auto_667512 ) ) ( not ( = ?auto_667511 ?auto_667513 ) ) ( not ( = ?auto_667511 ?auto_667514 ) ) ( not ( = ?auto_667511 ?auto_667515 ) ) ( not ( = ?auto_667511 ?auto_667516 ) ) ( not ( = ?auto_667511 ?auto_667517 ) ) ( not ( = ?auto_667511 ?auto_667518 ) ) ( not ( = ?auto_667511 ?auto_667519 ) ) ( not ( = ?auto_667511 ?auto_667520 ) ) ( not ( = ?auto_667512 ?auto_667513 ) ) ( not ( = ?auto_667512 ?auto_667514 ) ) ( not ( = ?auto_667512 ?auto_667515 ) ) ( not ( = ?auto_667512 ?auto_667516 ) ) ( not ( = ?auto_667512 ?auto_667517 ) ) ( not ( = ?auto_667512 ?auto_667518 ) ) ( not ( = ?auto_667512 ?auto_667519 ) ) ( not ( = ?auto_667512 ?auto_667520 ) ) ( not ( = ?auto_667513 ?auto_667514 ) ) ( not ( = ?auto_667513 ?auto_667515 ) ) ( not ( = ?auto_667513 ?auto_667516 ) ) ( not ( = ?auto_667513 ?auto_667517 ) ) ( not ( = ?auto_667513 ?auto_667518 ) ) ( not ( = ?auto_667513 ?auto_667519 ) ) ( not ( = ?auto_667513 ?auto_667520 ) ) ( not ( = ?auto_667514 ?auto_667515 ) ) ( not ( = ?auto_667514 ?auto_667516 ) ) ( not ( = ?auto_667514 ?auto_667517 ) ) ( not ( = ?auto_667514 ?auto_667518 ) ) ( not ( = ?auto_667514 ?auto_667519 ) ) ( not ( = ?auto_667514 ?auto_667520 ) ) ( not ( = ?auto_667515 ?auto_667516 ) ) ( not ( = ?auto_667515 ?auto_667517 ) ) ( not ( = ?auto_667515 ?auto_667518 ) ) ( not ( = ?auto_667515 ?auto_667519 ) ) ( not ( = ?auto_667515 ?auto_667520 ) ) ( not ( = ?auto_667516 ?auto_667517 ) ) ( not ( = ?auto_667516 ?auto_667518 ) ) ( not ( = ?auto_667516 ?auto_667519 ) ) ( not ( = ?auto_667516 ?auto_667520 ) ) ( not ( = ?auto_667517 ?auto_667518 ) ) ( not ( = ?auto_667517 ?auto_667519 ) ) ( not ( = ?auto_667517 ?auto_667520 ) ) ( not ( = ?auto_667518 ?auto_667519 ) ) ( not ( = ?auto_667518 ?auto_667520 ) ) ( not ( = ?auto_667519 ?auto_667520 ) ) ( ON ?auto_667518 ?auto_667519 ) ( ON ?auto_667517 ?auto_667518 ) ( ON ?auto_667516 ?auto_667517 ) ( ON ?auto_667515 ?auto_667516 ) ( ON ?auto_667514 ?auto_667515 ) ( CLEAR ?auto_667512 ) ( ON ?auto_667513 ?auto_667514 ) ( CLEAR ?auto_667513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_667508 ?auto_667509 ?auto_667510 ?auto_667511 ?auto_667512 ?auto_667513 )
      ( MAKE-12PILE ?auto_667508 ?auto_667509 ?auto_667510 ?auto_667511 ?auto_667512 ?auto_667513 ?auto_667514 ?auto_667515 ?auto_667516 ?auto_667517 ?auto_667518 ?auto_667519 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667558 - BLOCK
      ?auto_667559 - BLOCK
      ?auto_667560 - BLOCK
      ?auto_667561 - BLOCK
      ?auto_667562 - BLOCK
      ?auto_667563 - BLOCK
      ?auto_667564 - BLOCK
      ?auto_667565 - BLOCK
      ?auto_667566 - BLOCK
      ?auto_667567 - BLOCK
      ?auto_667568 - BLOCK
      ?auto_667569 - BLOCK
    )
    :vars
    (
      ?auto_667570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667569 ?auto_667570 ) ( ON-TABLE ?auto_667558 ) ( ON ?auto_667559 ?auto_667558 ) ( ON ?auto_667560 ?auto_667559 ) ( ON ?auto_667561 ?auto_667560 ) ( not ( = ?auto_667558 ?auto_667559 ) ) ( not ( = ?auto_667558 ?auto_667560 ) ) ( not ( = ?auto_667558 ?auto_667561 ) ) ( not ( = ?auto_667558 ?auto_667562 ) ) ( not ( = ?auto_667558 ?auto_667563 ) ) ( not ( = ?auto_667558 ?auto_667564 ) ) ( not ( = ?auto_667558 ?auto_667565 ) ) ( not ( = ?auto_667558 ?auto_667566 ) ) ( not ( = ?auto_667558 ?auto_667567 ) ) ( not ( = ?auto_667558 ?auto_667568 ) ) ( not ( = ?auto_667558 ?auto_667569 ) ) ( not ( = ?auto_667558 ?auto_667570 ) ) ( not ( = ?auto_667559 ?auto_667560 ) ) ( not ( = ?auto_667559 ?auto_667561 ) ) ( not ( = ?auto_667559 ?auto_667562 ) ) ( not ( = ?auto_667559 ?auto_667563 ) ) ( not ( = ?auto_667559 ?auto_667564 ) ) ( not ( = ?auto_667559 ?auto_667565 ) ) ( not ( = ?auto_667559 ?auto_667566 ) ) ( not ( = ?auto_667559 ?auto_667567 ) ) ( not ( = ?auto_667559 ?auto_667568 ) ) ( not ( = ?auto_667559 ?auto_667569 ) ) ( not ( = ?auto_667559 ?auto_667570 ) ) ( not ( = ?auto_667560 ?auto_667561 ) ) ( not ( = ?auto_667560 ?auto_667562 ) ) ( not ( = ?auto_667560 ?auto_667563 ) ) ( not ( = ?auto_667560 ?auto_667564 ) ) ( not ( = ?auto_667560 ?auto_667565 ) ) ( not ( = ?auto_667560 ?auto_667566 ) ) ( not ( = ?auto_667560 ?auto_667567 ) ) ( not ( = ?auto_667560 ?auto_667568 ) ) ( not ( = ?auto_667560 ?auto_667569 ) ) ( not ( = ?auto_667560 ?auto_667570 ) ) ( not ( = ?auto_667561 ?auto_667562 ) ) ( not ( = ?auto_667561 ?auto_667563 ) ) ( not ( = ?auto_667561 ?auto_667564 ) ) ( not ( = ?auto_667561 ?auto_667565 ) ) ( not ( = ?auto_667561 ?auto_667566 ) ) ( not ( = ?auto_667561 ?auto_667567 ) ) ( not ( = ?auto_667561 ?auto_667568 ) ) ( not ( = ?auto_667561 ?auto_667569 ) ) ( not ( = ?auto_667561 ?auto_667570 ) ) ( not ( = ?auto_667562 ?auto_667563 ) ) ( not ( = ?auto_667562 ?auto_667564 ) ) ( not ( = ?auto_667562 ?auto_667565 ) ) ( not ( = ?auto_667562 ?auto_667566 ) ) ( not ( = ?auto_667562 ?auto_667567 ) ) ( not ( = ?auto_667562 ?auto_667568 ) ) ( not ( = ?auto_667562 ?auto_667569 ) ) ( not ( = ?auto_667562 ?auto_667570 ) ) ( not ( = ?auto_667563 ?auto_667564 ) ) ( not ( = ?auto_667563 ?auto_667565 ) ) ( not ( = ?auto_667563 ?auto_667566 ) ) ( not ( = ?auto_667563 ?auto_667567 ) ) ( not ( = ?auto_667563 ?auto_667568 ) ) ( not ( = ?auto_667563 ?auto_667569 ) ) ( not ( = ?auto_667563 ?auto_667570 ) ) ( not ( = ?auto_667564 ?auto_667565 ) ) ( not ( = ?auto_667564 ?auto_667566 ) ) ( not ( = ?auto_667564 ?auto_667567 ) ) ( not ( = ?auto_667564 ?auto_667568 ) ) ( not ( = ?auto_667564 ?auto_667569 ) ) ( not ( = ?auto_667564 ?auto_667570 ) ) ( not ( = ?auto_667565 ?auto_667566 ) ) ( not ( = ?auto_667565 ?auto_667567 ) ) ( not ( = ?auto_667565 ?auto_667568 ) ) ( not ( = ?auto_667565 ?auto_667569 ) ) ( not ( = ?auto_667565 ?auto_667570 ) ) ( not ( = ?auto_667566 ?auto_667567 ) ) ( not ( = ?auto_667566 ?auto_667568 ) ) ( not ( = ?auto_667566 ?auto_667569 ) ) ( not ( = ?auto_667566 ?auto_667570 ) ) ( not ( = ?auto_667567 ?auto_667568 ) ) ( not ( = ?auto_667567 ?auto_667569 ) ) ( not ( = ?auto_667567 ?auto_667570 ) ) ( not ( = ?auto_667568 ?auto_667569 ) ) ( not ( = ?auto_667568 ?auto_667570 ) ) ( not ( = ?auto_667569 ?auto_667570 ) ) ( ON ?auto_667568 ?auto_667569 ) ( ON ?auto_667567 ?auto_667568 ) ( ON ?auto_667566 ?auto_667567 ) ( ON ?auto_667565 ?auto_667566 ) ( ON ?auto_667564 ?auto_667565 ) ( ON ?auto_667563 ?auto_667564 ) ( CLEAR ?auto_667561 ) ( ON ?auto_667562 ?auto_667563 ) ( CLEAR ?auto_667562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_667558 ?auto_667559 ?auto_667560 ?auto_667561 ?auto_667562 )
      ( MAKE-12PILE ?auto_667558 ?auto_667559 ?auto_667560 ?auto_667561 ?auto_667562 ?auto_667563 ?auto_667564 ?auto_667565 ?auto_667566 ?auto_667567 ?auto_667568 ?auto_667569 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667608 - BLOCK
      ?auto_667609 - BLOCK
      ?auto_667610 - BLOCK
      ?auto_667611 - BLOCK
      ?auto_667612 - BLOCK
      ?auto_667613 - BLOCK
      ?auto_667614 - BLOCK
      ?auto_667615 - BLOCK
      ?auto_667616 - BLOCK
      ?auto_667617 - BLOCK
      ?auto_667618 - BLOCK
      ?auto_667619 - BLOCK
    )
    :vars
    (
      ?auto_667620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667619 ?auto_667620 ) ( ON-TABLE ?auto_667608 ) ( ON ?auto_667609 ?auto_667608 ) ( ON ?auto_667610 ?auto_667609 ) ( not ( = ?auto_667608 ?auto_667609 ) ) ( not ( = ?auto_667608 ?auto_667610 ) ) ( not ( = ?auto_667608 ?auto_667611 ) ) ( not ( = ?auto_667608 ?auto_667612 ) ) ( not ( = ?auto_667608 ?auto_667613 ) ) ( not ( = ?auto_667608 ?auto_667614 ) ) ( not ( = ?auto_667608 ?auto_667615 ) ) ( not ( = ?auto_667608 ?auto_667616 ) ) ( not ( = ?auto_667608 ?auto_667617 ) ) ( not ( = ?auto_667608 ?auto_667618 ) ) ( not ( = ?auto_667608 ?auto_667619 ) ) ( not ( = ?auto_667608 ?auto_667620 ) ) ( not ( = ?auto_667609 ?auto_667610 ) ) ( not ( = ?auto_667609 ?auto_667611 ) ) ( not ( = ?auto_667609 ?auto_667612 ) ) ( not ( = ?auto_667609 ?auto_667613 ) ) ( not ( = ?auto_667609 ?auto_667614 ) ) ( not ( = ?auto_667609 ?auto_667615 ) ) ( not ( = ?auto_667609 ?auto_667616 ) ) ( not ( = ?auto_667609 ?auto_667617 ) ) ( not ( = ?auto_667609 ?auto_667618 ) ) ( not ( = ?auto_667609 ?auto_667619 ) ) ( not ( = ?auto_667609 ?auto_667620 ) ) ( not ( = ?auto_667610 ?auto_667611 ) ) ( not ( = ?auto_667610 ?auto_667612 ) ) ( not ( = ?auto_667610 ?auto_667613 ) ) ( not ( = ?auto_667610 ?auto_667614 ) ) ( not ( = ?auto_667610 ?auto_667615 ) ) ( not ( = ?auto_667610 ?auto_667616 ) ) ( not ( = ?auto_667610 ?auto_667617 ) ) ( not ( = ?auto_667610 ?auto_667618 ) ) ( not ( = ?auto_667610 ?auto_667619 ) ) ( not ( = ?auto_667610 ?auto_667620 ) ) ( not ( = ?auto_667611 ?auto_667612 ) ) ( not ( = ?auto_667611 ?auto_667613 ) ) ( not ( = ?auto_667611 ?auto_667614 ) ) ( not ( = ?auto_667611 ?auto_667615 ) ) ( not ( = ?auto_667611 ?auto_667616 ) ) ( not ( = ?auto_667611 ?auto_667617 ) ) ( not ( = ?auto_667611 ?auto_667618 ) ) ( not ( = ?auto_667611 ?auto_667619 ) ) ( not ( = ?auto_667611 ?auto_667620 ) ) ( not ( = ?auto_667612 ?auto_667613 ) ) ( not ( = ?auto_667612 ?auto_667614 ) ) ( not ( = ?auto_667612 ?auto_667615 ) ) ( not ( = ?auto_667612 ?auto_667616 ) ) ( not ( = ?auto_667612 ?auto_667617 ) ) ( not ( = ?auto_667612 ?auto_667618 ) ) ( not ( = ?auto_667612 ?auto_667619 ) ) ( not ( = ?auto_667612 ?auto_667620 ) ) ( not ( = ?auto_667613 ?auto_667614 ) ) ( not ( = ?auto_667613 ?auto_667615 ) ) ( not ( = ?auto_667613 ?auto_667616 ) ) ( not ( = ?auto_667613 ?auto_667617 ) ) ( not ( = ?auto_667613 ?auto_667618 ) ) ( not ( = ?auto_667613 ?auto_667619 ) ) ( not ( = ?auto_667613 ?auto_667620 ) ) ( not ( = ?auto_667614 ?auto_667615 ) ) ( not ( = ?auto_667614 ?auto_667616 ) ) ( not ( = ?auto_667614 ?auto_667617 ) ) ( not ( = ?auto_667614 ?auto_667618 ) ) ( not ( = ?auto_667614 ?auto_667619 ) ) ( not ( = ?auto_667614 ?auto_667620 ) ) ( not ( = ?auto_667615 ?auto_667616 ) ) ( not ( = ?auto_667615 ?auto_667617 ) ) ( not ( = ?auto_667615 ?auto_667618 ) ) ( not ( = ?auto_667615 ?auto_667619 ) ) ( not ( = ?auto_667615 ?auto_667620 ) ) ( not ( = ?auto_667616 ?auto_667617 ) ) ( not ( = ?auto_667616 ?auto_667618 ) ) ( not ( = ?auto_667616 ?auto_667619 ) ) ( not ( = ?auto_667616 ?auto_667620 ) ) ( not ( = ?auto_667617 ?auto_667618 ) ) ( not ( = ?auto_667617 ?auto_667619 ) ) ( not ( = ?auto_667617 ?auto_667620 ) ) ( not ( = ?auto_667618 ?auto_667619 ) ) ( not ( = ?auto_667618 ?auto_667620 ) ) ( not ( = ?auto_667619 ?auto_667620 ) ) ( ON ?auto_667618 ?auto_667619 ) ( ON ?auto_667617 ?auto_667618 ) ( ON ?auto_667616 ?auto_667617 ) ( ON ?auto_667615 ?auto_667616 ) ( ON ?auto_667614 ?auto_667615 ) ( ON ?auto_667613 ?auto_667614 ) ( ON ?auto_667612 ?auto_667613 ) ( CLEAR ?auto_667610 ) ( ON ?auto_667611 ?auto_667612 ) ( CLEAR ?auto_667611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_667608 ?auto_667609 ?auto_667610 ?auto_667611 )
      ( MAKE-12PILE ?auto_667608 ?auto_667609 ?auto_667610 ?auto_667611 ?auto_667612 ?auto_667613 ?auto_667614 ?auto_667615 ?auto_667616 ?auto_667617 ?auto_667618 ?auto_667619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667658 - BLOCK
      ?auto_667659 - BLOCK
      ?auto_667660 - BLOCK
      ?auto_667661 - BLOCK
      ?auto_667662 - BLOCK
      ?auto_667663 - BLOCK
      ?auto_667664 - BLOCK
      ?auto_667665 - BLOCK
      ?auto_667666 - BLOCK
      ?auto_667667 - BLOCK
      ?auto_667668 - BLOCK
      ?auto_667669 - BLOCK
    )
    :vars
    (
      ?auto_667670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667669 ?auto_667670 ) ( ON-TABLE ?auto_667658 ) ( ON ?auto_667659 ?auto_667658 ) ( not ( = ?auto_667658 ?auto_667659 ) ) ( not ( = ?auto_667658 ?auto_667660 ) ) ( not ( = ?auto_667658 ?auto_667661 ) ) ( not ( = ?auto_667658 ?auto_667662 ) ) ( not ( = ?auto_667658 ?auto_667663 ) ) ( not ( = ?auto_667658 ?auto_667664 ) ) ( not ( = ?auto_667658 ?auto_667665 ) ) ( not ( = ?auto_667658 ?auto_667666 ) ) ( not ( = ?auto_667658 ?auto_667667 ) ) ( not ( = ?auto_667658 ?auto_667668 ) ) ( not ( = ?auto_667658 ?auto_667669 ) ) ( not ( = ?auto_667658 ?auto_667670 ) ) ( not ( = ?auto_667659 ?auto_667660 ) ) ( not ( = ?auto_667659 ?auto_667661 ) ) ( not ( = ?auto_667659 ?auto_667662 ) ) ( not ( = ?auto_667659 ?auto_667663 ) ) ( not ( = ?auto_667659 ?auto_667664 ) ) ( not ( = ?auto_667659 ?auto_667665 ) ) ( not ( = ?auto_667659 ?auto_667666 ) ) ( not ( = ?auto_667659 ?auto_667667 ) ) ( not ( = ?auto_667659 ?auto_667668 ) ) ( not ( = ?auto_667659 ?auto_667669 ) ) ( not ( = ?auto_667659 ?auto_667670 ) ) ( not ( = ?auto_667660 ?auto_667661 ) ) ( not ( = ?auto_667660 ?auto_667662 ) ) ( not ( = ?auto_667660 ?auto_667663 ) ) ( not ( = ?auto_667660 ?auto_667664 ) ) ( not ( = ?auto_667660 ?auto_667665 ) ) ( not ( = ?auto_667660 ?auto_667666 ) ) ( not ( = ?auto_667660 ?auto_667667 ) ) ( not ( = ?auto_667660 ?auto_667668 ) ) ( not ( = ?auto_667660 ?auto_667669 ) ) ( not ( = ?auto_667660 ?auto_667670 ) ) ( not ( = ?auto_667661 ?auto_667662 ) ) ( not ( = ?auto_667661 ?auto_667663 ) ) ( not ( = ?auto_667661 ?auto_667664 ) ) ( not ( = ?auto_667661 ?auto_667665 ) ) ( not ( = ?auto_667661 ?auto_667666 ) ) ( not ( = ?auto_667661 ?auto_667667 ) ) ( not ( = ?auto_667661 ?auto_667668 ) ) ( not ( = ?auto_667661 ?auto_667669 ) ) ( not ( = ?auto_667661 ?auto_667670 ) ) ( not ( = ?auto_667662 ?auto_667663 ) ) ( not ( = ?auto_667662 ?auto_667664 ) ) ( not ( = ?auto_667662 ?auto_667665 ) ) ( not ( = ?auto_667662 ?auto_667666 ) ) ( not ( = ?auto_667662 ?auto_667667 ) ) ( not ( = ?auto_667662 ?auto_667668 ) ) ( not ( = ?auto_667662 ?auto_667669 ) ) ( not ( = ?auto_667662 ?auto_667670 ) ) ( not ( = ?auto_667663 ?auto_667664 ) ) ( not ( = ?auto_667663 ?auto_667665 ) ) ( not ( = ?auto_667663 ?auto_667666 ) ) ( not ( = ?auto_667663 ?auto_667667 ) ) ( not ( = ?auto_667663 ?auto_667668 ) ) ( not ( = ?auto_667663 ?auto_667669 ) ) ( not ( = ?auto_667663 ?auto_667670 ) ) ( not ( = ?auto_667664 ?auto_667665 ) ) ( not ( = ?auto_667664 ?auto_667666 ) ) ( not ( = ?auto_667664 ?auto_667667 ) ) ( not ( = ?auto_667664 ?auto_667668 ) ) ( not ( = ?auto_667664 ?auto_667669 ) ) ( not ( = ?auto_667664 ?auto_667670 ) ) ( not ( = ?auto_667665 ?auto_667666 ) ) ( not ( = ?auto_667665 ?auto_667667 ) ) ( not ( = ?auto_667665 ?auto_667668 ) ) ( not ( = ?auto_667665 ?auto_667669 ) ) ( not ( = ?auto_667665 ?auto_667670 ) ) ( not ( = ?auto_667666 ?auto_667667 ) ) ( not ( = ?auto_667666 ?auto_667668 ) ) ( not ( = ?auto_667666 ?auto_667669 ) ) ( not ( = ?auto_667666 ?auto_667670 ) ) ( not ( = ?auto_667667 ?auto_667668 ) ) ( not ( = ?auto_667667 ?auto_667669 ) ) ( not ( = ?auto_667667 ?auto_667670 ) ) ( not ( = ?auto_667668 ?auto_667669 ) ) ( not ( = ?auto_667668 ?auto_667670 ) ) ( not ( = ?auto_667669 ?auto_667670 ) ) ( ON ?auto_667668 ?auto_667669 ) ( ON ?auto_667667 ?auto_667668 ) ( ON ?auto_667666 ?auto_667667 ) ( ON ?auto_667665 ?auto_667666 ) ( ON ?auto_667664 ?auto_667665 ) ( ON ?auto_667663 ?auto_667664 ) ( ON ?auto_667662 ?auto_667663 ) ( ON ?auto_667661 ?auto_667662 ) ( CLEAR ?auto_667659 ) ( ON ?auto_667660 ?auto_667661 ) ( CLEAR ?auto_667660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_667658 ?auto_667659 ?auto_667660 )
      ( MAKE-12PILE ?auto_667658 ?auto_667659 ?auto_667660 ?auto_667661 ?auto_667662 ?auto_667663 ?auto_667664 ?auto_667665 ?auto_667666 ?auto_667667 ?auto_667668 ?auto_667669 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667708 - BLOCK
      ?auto_667709 - BLOCK
      ?auto_667710 - BLOCK
      ?auto_667711 - BLOCK
      ?auto_667712 - BLOCK
      ?auto_667713 - BLOCK
      ?auto_667714 - BLOCK
      ?auto_667715 - BLOCK
      ?auto_667716 - BLOCK
      ?auto_667717 - BLOCK
      ?auto_667718 - BLOCK
      ?auto_667719 - BLOCK
    )
    :vars
    (
      ?auto_667720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667719 ?auto_667720 ) ( ON-TABLE ?auto_667708 ) ( not ( = ?auto_667708 ?auto_667709 ) ) ( not ( = ?auto_667708 ?auto_667710 ) ) ( not ( = ?auto_667708 ?auto_667711 ) ) ( not ( = ?auto_667708 ?auto_667712 ) ) ( not ( = ?auto_667708 ?auto_667713 ) ) ( not ( = ?auto_667708 ?auto_667714 ) ) ( not ( = ?auto_667708 ?auto_667715 ) ) ( not ( = ?auto_667708 ?auto_667716 ) ) ( not ( = ?auto_667708 ?auto_667717 ) ) ( not ( = ?auto_667708 ?auto_667718 ) ) ( not ( = ?auto_667708 ?auto_667719 ) ) ( not ( = ?auto_667708 ?auto_667720 ) ) ( not ( = ?auto_667709 ?auto_667710 ) ) ( not ( = ?auto_667709 ?auto_667711 ) ) ( not ( = ?auto_667709 ?auto_667712 ) ) ( not ( = ?auto_667709 ?auto_667713 ) ) ( not ( = ?auto_667709 ?auto_667714 ) ) ( not ( = ?auto_667709 ?auto_667715 ) ) ( not ( = ?auto_667709 ?auto_667716 ) ) ( not ( = ?auto_667709 ?auto_667717 ) ) ( not ( = ?auto_667709 ?auto_667718 ) ) ( not ( = ?auto_667709 ?auto_667719 ) ) ( not ( = ?auto_667709 ?auto_667720 ) ) ( not ( = ?auto_667710 ?auto_667711 ) ) ( not ( = ?auto_667710 ?auto_667712 ) ) ( not ( = ?auto_667710 ?auto_667713 ) ) ( not ( = ?auto_667710 ?auto_667714 ) ) ( not ( = ?auto_667710 ?auto_667715 ) ) ( not ( = ?auto_667710 ?auto_667716 ) ) ( not ( = ?auto_667710 ?auto_667717 ) ) ( not ( = ?auto_667710 ?auto_667718 ) ) ( not ( = ?auto_667710 ?auto_667719 ) ) ( not ( = ?auto_667710 ?auto_667720 ) ) ( not ( = ?auto_667711 ?auto_667712 ) ) ( not ( = ?auto_667711 ?auto_667713 ) ) ( not ( = ?auto_667711 ?auto_667714 ) ) ( not ( = ?auto_667711 ?auto_667715 ) ) ( not ( = ?auto_667711 ?auto_667716 ) ) ( not ( = ?auto_667711 ?auto_667717 ) ) ( not ( = ?auto_667711 ?auto_667718 ) ) ( not ( = ?auto_667711 ?auto_667719 ) ) ( not ( = ?auto_667711 ?auto_667720 ) ) ( not ( = ?auto_667712 ?auto_667713 ) ) ( not ( = ?auto_667712 ?auto_667714 ) ) ( not ( = ?auto_667712 ?auto_667715 ) ) ( not ( = ?auto_667712 ?auto_667716 ) ) ( not ( = ?auto_667712 ?auto_667717 ) ) ( not ( = ?auto_667712 ?auto_667718 ) ) ( not ( = ?auto_667712 ?auto_667719 ) ) ( not ( = ?auto_667712 ?auto_667720 ) ) ( not ( = ?auto_667713 ?auto_667714 ) ) ( not ( = ?auto_667713 ?auto_667715 ) ) ( not ( = ?auto_667713 ?auto_667716 ) ) ( not ( = ?auto_667713 ?auto_667717 ) ) ( not ( = ?auto_667713 ?auto_667718 ) ) ( not ( = ?auto_667713 ?auto_667719 ) ) ( not ( = ?auto_667713 ?auto_667720 ) ) ( not ( = ?auto_667714 ?auto_667715 ) ) ( not ( = ?auto_667714 ?auto_667716 ) ) ( not ( = ?auto_667714 ?auto_667717 ) ) ( not ( = ?auto_667714 ?auto_667718 ) ) ( not ( = ?auto_667714 ?auto_667719 ) ) ( not ( = ?auto_667714 ?auto_667720 ) ) ( not ( = ?auto_667715 ?auto_667716 ) ) ( not ( = ?auto_667715 ?auto_667717 ) ) ( not ( = ?auto_667715 ?auto_667718 ) ) ( not ( = ?auto_667715 ?auto_667719 ) ) ( not ( = ?auto_667715 ?auto_667720 ) ) ( not ( = ?auto_667716 ?auto_667717 ) ) ( not ( = ?auto_667716 ?auto_667718 ) ) ( not ( = ?auto_667716 ?auto_667719 ) ) ( not ( = ?auto_667716 ?auto_667720 ) ) ( not ( = ?auto_667717 ?auto_667718 ) ) ( not ( = ?auto_667717 ?auto_667719 ) ) ( not ( = ?auto_667717 ?auto_667720 ) ) ( not ( = ?auto_667718 ?auto_667719 ) ) ( not ( = ?auto_667718 ?auto_667720 ) ) ( not ( = ?auto_667719 ?auto_667720 ) ) ( ON ?auto_667718 ?auto_667719 ) ( ON ?auto_667717 ?auto_667718 ) ( ON ?auto_667716 ?auto_667717 ) ( ON ?auto_667715 ?auto_667716 ) ( ON ?auto_667714 ?auto_667715 ) ( ON ?auto_667713 ?auto_667714 ) ( ON ?auto_667712 ?auto_667713 ) ( ON ?auto_667711 ?auto_667712 ) ( ON ?auto_667710 ?auto_667711 ) ( CLEAR ?auto_667708 ) ( ON ?auto_667709 ?auto_667710 ) ( CLEAR ?auto_667709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_667708 ?auto_667709 )
      ( MAKE-12PILE ?auto_667708 ?auto_667709 ?auto_667710 ?auto_667711 ?auto_667712 ?auto_667713 ?auto_667714 ?auto_667715 ?auto_667716 ?auto_667717 ?auto_667718 ?auto_667719 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_667758 - BLOCK
      ?auto_667759 - BLOCK
      ?auto_667760 - BLOCK
      ?auto_667761 - BLOCK
      ?auto_667762 - BLOCK
      ?auto_667763 - BLOCK
      ?auto_667764 - BLOCK
      ?auto_667765 - BLOCK
      ?auto_667766 - BLOCK
      ?auto_667767 - BLOCK
      ?auto_667768 - BLOCK
      ?auto_667769 - BLOCK
    )
    :vars
    (
      ?auto_667770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667769 ?auto_667770 ) ( not ( = ?auto_667758 ?auto_667759 ) ) ( not ( = ?auto_667758 ?auto_667760 ) ) ( not ( = ?auto_667758 ?auto_667761 ) ) ( not ( = ?auto_667758 ?auto_667762 ) ) ( not ( = ?auto_667758 ?auto_667763 ) ) ( not ( = ?auto_667758 ?auto_667764 ) ) ( not ( = ?auto_667758 ?auto_667765 ) ) ( not ( = ?auto_667758 ?auto_667766 ) ) ( not ( = ?auto_667758 ?auto_667767 ) ) ( not ( = ?auto_667758 ?auto_667768 ) ) ( not ( = ?auto_667758 ?auto_667769 ) ) ( not ( = ?auto_667758 ?auto_667770 ) ) ( not ( = ?auto_667759 ?auto_667760 ) ) ( not ( = ?auto_667759 ?auto_667761 ) ) ( not ( = ?auto_667759 ?auto_667762 ) ) ( not ( = ?auto_667759 ?auto_667763 ) ) ( not ( = ?auto_667759 ?auto_667764 ) ) ( not ( = ?auto_667759 ?auto_667765 ) ) ( not ( = ?auto_667759 ?auto_667766 ) ) ( not ( = ?auto_667759 ?auto_667767 ) ) ( not ( = ?auto_667759 ?auto_667768 ) ) ( not ( = ?auto_667759 ?auto_667769 ) ) ( not ( = ?auto_667759 ?auto_667770 ) ) ( not ( = ?auto_667760 ?auto_667761 ) ) ( not ( = ?auto_667760 ?auto_667762 ) ) ( not ( = ?auto_667760 ?auto_667763 ) ) ( not ( = ?auto_667760 ?auto_667764 ) ) ( not ( = ?auto_667760 ?auto_667765 ) ) ( not ( = ?auto_667760 ?auto_667766 ) ) ( not ( = ?auto_667760 ?auto_667767 ) ) ( not ( = ?auto_667760 ?auto_667768 ) ) ( not ( = ?auto_667760 ?auto_667769 ) ) ( not ( = ?auto_667760 ?auto_667770 ) ) ( not ( = ?auto_667761 ?auto_667762 ) ) ( not ( = ?auto_667761 ?auto_667763 ) ) ( not ( = ?auto_667761 ?auto_667764 ) ) ( not ( = ?auto_667761 ?auto_667765 ) ) ( not ( = ?auto_667761 ?auto_667766 ) ) ( not ( = ?auto_667761 ?auto_667767 ) ) ( not ( = ?auto_667761 ?auto_667768 ) ) ( not ( = ?auto_667761 ?auto_667769 ) ) ( not ( = ?auto_667761 ?auto_667770 ) ) ( not ( = ?auto_667762 ?auto_667763 ) ) ( not ( = ?auto_667762 ?auto_667764 ) ) ( not ( = ?auto_667762 ?auto_667765 ) ) ( not ( = ?auto_667762 ?auto_667766 ) ) ( not ( = ?auto_667762 ?auto_667767 ) ) ( not ( = ?auto_667762 ?auto_667768 ) ) ( not ( = ?auto_667762 ?auto_667769 ) ) ( not ( = ?auto_667762 ?auto_667770 ) ) ( not ( = ?auto_667763 ?auto_667764 ) ) ( not ( = ?auto_667763 ?auto_667765 ) ) ( not ( = ?auto_667763 ?auto_667766 ) ) ( not ( = ?auto_667763 ?auto_667767 ) ) ( not ( = ?auto_667763 ?auto_667768 ) ) ( not ( = ?auto_667763 ?auto_667769 ) ) ( not ( = ?auto_667763 ?auto_667770 ) ) ( not ( = ?auto_667764 ?auto_667765 ) ) ( not ( = ?auto_667764 ?auto_667766 ) ) ( not ( = ?auto_667764 ?auto_667767 ) ) ( not ( = ?auto_667764 ?auto_667768 ) ) ( not ( = ?auto_667764 ?auto_667769 ) ) ( not ( = ?auto_667764 ?auto_667770 ) ) ( not ( = ?auto_667765 ?auto_667766 ) ) ( not ( = ?auto_667765 ?auto_667767 ) ) ( not ( = ?auto_667765 ?auto_667768 ) ) ( not ( = ?auto_667765 ?auto_667769 ) ) ( not ( = ?auto_667765 ?auto_667770 ) ) ( not ( = ?auto_667766 ?auto_667767 ) ) ( not ( = ?auto_667766 ?auto_667768 ) ) ( not ( = ?auto_667766 ?auto_667769 ) ) ( not ( = ?auto_667766 ?auto_667770 ) ) ( not ( = ?auto_667767 ?auto_667768 ) ) ( not ( = ?auto_667767 ?auto_667769 ) ) ( not ( = ?auto_667767 ?auto_667770 ) ) ( not ( = ?auto_667768 ?auto_667769 ) ) ( not ( = ?auto_667768 ?auto_667770 ) ) ( not ( = ?auto_667769 ?auto_667770 ) ) ( ON ?auto_667768 ?auto_667769 ) ( ON ?auto_667767 ?auto_667768 ) ( ON ?auto_667766 ?auto_667767 ) ( ON ?auto_667765 ?auto_667766 ) ( ON ?auto_667764 ?auto_667765 ) ( ON ?auto_667763 ?auto_667764 ) ( ON ?auto_667762 ?auto_667763 ) ( ON ?auto_667761 ?auto_667762 ) ( ON ?auto_667760 ?auto_667761 ) ( ON ?auto_667759 ?auto_667760 ) ( ON ?auto_667758 ?auto_667759 ) ( CLEAR ?auto_667758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_667758 )
      ( MAKE-12PILE ?auto_667758 ?auto_667759 ?auto_667760 ?auto_667761 ?auto_667762 ?auto_667763 ?auto_667764 ?auto_667765 ?auto_667766 ?auto_667767 ?auto_667768 ?auto_667769 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_667809 - BLOCK
      ?auto_667810 - BLOCK
      ?auto_667811 - BLOCK
      ?auto_667812 - BLOCK
      ?auto_667813 - BLOCK
      ?auto_667814 - BLOCK
      ?auto_667815 - BLOCK
      ?auto_667816 - BLOCK
      ?auto_667817 - BLOCK
      ?auto_667818 - BLOCK
      ?auto_667819 - BLOCK
      ?auto_667820 - BLOCK
      ?auto_667821 - BLOCK
    )
    :vars
    (
      ?auto_667822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_667820 ) ( ON ?auto_667821 ?auto_667822 ) ( CLEAR ?auto_667821 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_667809 ) ( ON ?auto_667810 ?auto_667809 ) ( ON ?auto_667811 ?auto_667810 ) ( ON ?auto_667812 ?auto_667811 ) ( ON ?auto_667813 ?auto_667812 ) ( ON ?auto_667814 ?auto_667813 ) ( ON ?auto_667815 ?auto_667814 ) ( ON ?auto_667816 ?auto_667815 ) ( ON ?auto_667817 ?auto_667816 ) ( ON ?auto_667818 ?auto_667817 ) ( ON ?auto_667819 ?auto_667818 ) ( ON ?auto_667820 ?auto_667819 ) ( not ( = ?auto_667809 ?auto_667810 ) ) ( not ( = ?auto_667809 ?auto_667811 ) ) ( not ( = ?auto_667809 ?auto_667812 ) ) ( not ( = ?auto_667809 ?auto_667813 ) ) ( not ( = ?auto_667809 ?auto_667814 ) ) ( not ( = ?auto_667809 ?auto_667815 ) ) ( not ( = ?auto_667809 ?auto_667816 ) ) ( not ( = ?auto_667809 ?auto_667817 ) ) ( not ( = ?auto_667809 ?auto_667818 ) ) ( not ( = ?auto_667809 ?auto_667819 ) ) ( not ( = ?auto_667809 ?auto_667820 ) ) ( not ( = ?auto_667809 ?auto_667821 ) ) ( not ( = ?auto_667809 ?auto_667822 ) ) ( not ( = ?auto_667810 ?auto_667811 ) ) ( not ( = ?auto_667810 ?auto_667812 ) ) ( not ( = ?auto_667810 ?auto_667813 ) ) ( not ( = ?auto_667810 ?auto_667814 ) ) ( not ( = ?auto_667810 ?auto_667815 ) ) ( not ( = ?auto_667810 ?auto_667816 ) ) ( not ( = ?auto_667810 ?auto_667817 ) ) ( not ( = ?auto_667810 ?auto_667818 ) ) ( not ( = ?auto_667810 ?auto_667819 ) ) ( not ( = ?auto_667810 ?auto_667820 ) ) ( not ( = ?auto_667810 ?auto_667821 ) ) ( not ( = ?auto_667810 ?auto_667822 ) ) ( not ( = ?auto_667811 ?auto_667812 ) ) ( not ( = ?auto_667811 ?auto_667813 ) ) ( not ( = ?auto_667811 ?auto_667814 ) ) ( not ( = ?auto_667811 ?auto_667815 ) ) ( not ( = ?auto_667811 ?auto_667816 ) ) ( not ( = ?auto_667811 ?auto_667817 ) ) ( not ( = ?auto_667811 ?auto_667818 ) ) ( not ( = ?auto_667811 ?auto_667819 ) ) ( not ( = ?auto_667811 ?auto_667820 ) ) ( not ( = ?auto_667811 ?auto_667821 ) ) ( not ( = ?auto_667811 ?auto_667822 ) ) ( not ( = ?auto_667812 ?auto_667813 ) ) ( not ( = ?auto_667812 ?auto_667814 ) ) ( not ( = ?auto_667812 ?auto_667815 ) ) ( not ( = ?auto_667812 ?auto_667816 ) ) ( not ( = ?auto_667812 ?auto_667817 ) ) ( not ( = ?auto_667812 ?auto_667818 ) ) ( not ( = ?auto_667812 ?auto_667819 ) ) ( not ( = ?auto_667812 ?auto_667820 ) ) ( not ( = ?auto_667812 ?auto_667821 ) ) ( not ( = ?auto_667812 ?auto_667822 ) ) ( not ( = ?auto_667813 ?auto_667814 ) ) ( not ( = ?auto_667813 ?auto_667815 ) ) ( not ( = ?auto_667813 ?auto_667816 ) ) ( not ( = ?auto_667813 ?auto_667817 ) ) ( not ( = ?auto_667813 ?auto_667818 ) ) ( not ( = ?auto_667813 ?auto_667819 ) ) ( not ( = ?auto_667813 ?auto_667820 ) ) ( not ( = ?auto_667813 ?auto_667821 ) ) ( not ( = ?auto_667813 ?auto_667822 ) ) ( not ( = ?auto_667814 ?auto_667815 ) ) ( not ( = ?auto_667814 ?auto_667816 ) ) ( not ( = ?auto_667814 ?auto_667817 ) ) ( not ( = ?auto_667814 ?auto_667818 ) ) ( not ( = ?auto_667814 ?auto_667819 ) ) ( not ( = ?auto_667814 ?auto_667820 ) ) ( not ( = ?auto_667814 ?auto_667821 ) ) ( not ( = ?auto_667814 ?auto_667822 ) ) ( not ( = ?auto_667815 ?auto_667816 ) ) ( not ( = ?auto_667815 ?auto_667817 ) ) ( not ( = ?auto_667815 ?auto_667818 ) ) ( not ( = ?auto_667815 ?auto_667819 ) ) ( not ( = ?auto_667815 ?auto_667820 ) ) ( not ( = ?auto_667815 ?auto_667821 ) ) ( not ( = ?auto_667815 ?auto_667822 ) ) ( not ( = ?auto_667816 ?auto_667817 ) ) ( not ( = ?auto_667816 ?auto_667818 ) ) ( not ( = ?auto_667816 ?auto_667819 ) ) ( not ( = ?auto_667816 ?auto_667820 ) ) ( not ( = ?auto_667816 ?auto_667821 ) ) ( not ( = ?auto_667816 ?auto_667822 ) ) ( not ( = ?auto_667817 ?auto_667818 ) ) ( not ( = ?auto_667817 ?auto_667819 ) ) ( not ( = ?auto_667817 ?auto_667820 ) ) ( not ( = ?auto_667817 ?auto_667821 ) ) ( not ( = ?auto_667817 ?auto_667822 ) ) ( not ( = ?auto_667818 ?auto_667819 ) ) ( not ( = ?auto_667818 ?auto_667820 ) ) ( not ( = ?auto_667818 ?auto_667821 ) ) ( not ( = ?auto_667818 ?auto_667822 ) ) ( not ( = ?auto_667819 ?auto_667820 ) ) ( not ( = ?auto_667819 ?auto_667821 ) ) ( not ( = ?auto_667819 ?auto_667822 ) ) ( not ( = ?auto_667820 ?auto_667821 ) ) ( not ( = ?auto_667820 ?auto_667822 ) ) ( not ( = ?auto_667821 ?auto_667822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_667821 ?auto_667822 )
      ( !STACK ?auto_667821 ?auto_667820 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_667863 - BLOCK
      ?auto_667864 - BLOCK
      ?auto_667865 - BLOCK
      ?auto_667866 - BLOCK
      ?auto_667867 - BLOCK
      ?auto_667868 - BLOCK
      ?auto_667869 - BLOCK
      ?auto_667870 - BLOCK
      ?auto_667871 - BLOCK
      ?auto_667872 - BLOCK
      ?auto_667873 - BLOCK
      ?auto_667874 - BLOCK
      ?auto_667875 - BLOCK
    )
    :vars
    (
      ?auto_667876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667875 ?auto_667876 ) ( ON-TABLE ?auto_667863 ) ( ON ?auto_667864 ?auto_667863 ) ( ON ?auto_667865 ?auto_667864 ) ( ON ?auto_667866 ?auto_667865 ) ( ON ?auto_667867 ?auto_667866 ) ( ON ?auto_667868 ?auto_667867 ) ( ON ?auto_667869 ?auto_667868 ) ( ON ?auto_667870 ?auto_667869 ) ( ON ?auto_667871 ?auto_667870 ) ( ON ?auto_667872 ?auto_667871 ) ( ON ?auto_667873 ?auto_667872 ) ( not ( = ?auto_667863 ?auto_667864 ) ) ( not ( = ?auto_667863 ?auto_667865 ) ) ( not ( = ?auto_667863 ?auto_667866 ) ) ( not ( = ?auto_667863 ?auto_667867 ) ) ( not ( = ?auto_667863 ?auto_667868 ) ) ( not ( = ?auto_667863 ?auto_667869 ) ) ( not ( = ?auto_667863 ?auto_667870 ) ) ( not ( = ?auto_667863 ?auto_667871 ) ) ( not ( = ?auto_667863 ?auto_667872 ) ) ( not ( = ?auto_667863 ?auto_667873 ) ) ( not ( = ?auto_667863 ?auto_667874 ) ) ( not ( = ?auto_667863 ?auto_667875 ) ) ( not ( = ?auto_667863 ?auto_667876 ) ) ( not ( = ?auto_667864 ?auto_667865 ) ) ( not ( = ?auto_667864 ?auto_667866 ) ) ( not ( = ?auto_667864 ?auto_667867 ) ) ( not ( = ?auto_667864 ?auto_667868 ) ) ( not ( = ?auto_667864 ?auto_667869 ) ) ( not ( = ?auto_667864 ?auto_667870 ) ) ( not ( = ?auto_667864 ?auto_667871 ) ) ( not ( = ?auto_667864 ?auto_667872 ) ) ( not ( = ?auto_667864 ?auto_667873 ) ) ( not ( = ?auto_667864 ?auto_667874 ) ) ( not ( = ?auto_667864 ?auto_667875 ) ) ( not ( = ?auto_667864 ?auto_667876 ) ) ( not ( = ?auto_667865 ?auto_667866 ) ) ( not ( = ?auto_667865 ?auto_667867 ) ) ( not ( = ?auto_667865 ?auto_667868 ) ) ( not ( = ?auto_667865 ?auto_667869 ) ) ( not ( = ?auto_667865 ?auto_667870 ) ) ( not ( = ?auto_667865 ?auto_667871 ) ) ( not ( = ?auto_667865 ?auto_667872 ) ) ( not ( = ?auto_667865 ?auto_667873 ) ) ( not ( = ?auto_667865 ?auto_667874 ) ) ( not ( = ?auto_667865 ?auto_667875 ) ) ( not ( = ?auto_667865 ?auto_667876 ) ) ( not ( = ?auto_667866 ?auto_667867 ) ) ( not ( = ?auto_667866 ?auto_667868 ) ) ( not ( = ?auto_667866 ?auto_667869 ) ) ( not ( = ?auto_667866 ?auto_667870 ) ) ( not ( = ?auto_667866 ?auto_667871 ) ) ( not ( = ?auto_667866 ?auto_667872 ) ) ( not ( = ?auto_667866 ?auto_667873 ) ) ( not ( = ?auto_667866 ?auto_667874 ) ) ( not ( = ?auto_667866 ?auto_667875 ) ) ( not ( = ?auto_667866 ?auto_667876 ) ) ( not ( = ?auto_667867 ?auto_667868 ) ) ( not ( = ?auto_667867 ?auto_667869 ) ) ( not ( = ?auto_667867 ?auto_667870 ) ) ( not ( = ?auto_667867 ?auto_667871 ) ) ( not ( = ?auto_667867 ?auto_667872 ) ) ( not ( = ?auto_667867 ?auto_667873 ) ) ( not ( = ?auto_667867 ?auto_667874 ) ) ( not ( = ?auto_667867 ?auto_667875 ) ) ( not ( = ?auto_667867 ?auto_667876 ) ) ( not ( = ?auto_667868 ?auto_667869 ) ) ( not ( = ?auto_667868 ?auto_667870 ) ) ( not ( = ?auto_667868 ?auto_667871 ) ) ( not ( = ?auto_667868 ?auto_667872 ) ) ( not ( = ?auto_667868 ?auto_667873 ) ) ( not ( = ?auto_667868 ?auto_667874 ) ) ( not ( = ?auto_667868 ?auto_667875 ) ) ( not ( = ?auto_667868 ?auto_667876 ) ) ( not ( = ?auto_667869 ?auto_667870 ) ) ( not ( = ?auto_667869 ?auto_667871 ) ) ( not ( = ?auto_667869 ?auto_667872 ) ) ( not ( = ?auto_667869 ?auto_667873 ) ) ( not ( = ?auto_667869 ?auto_667874 ) ) ( not ( = ?auto_667869 ?auto_667875 ) ) ( not ( = ?auto_667869 ?auto_667876 ) ) ( not ( = ?auto_667870 ?auto_667871 ) ) ( not ( = ?auto_667870 ?auto_667872 ) ) ( not ( = ?auto_667870 ?auto_667873 ) ) ( not ( = ?auto_667870 ?auto_667874 ) ) ( not ( = ?auto_667870 ?auto_667875 ) ) ( not ( = ?auto_667870 ?auto_667876 ) ) ( not ( = ?auto_667871 ?auto_667872 ) ) ( not ( = ?auto_667871 ?auto_667873 ) ) ( not ( = ?auto_667871 ?auto_667874 ) ) ( not ( = ?auto_667871 ?auto_667875 ) ) ( not ( = ?auto_667871 ?auto_667876 ) ) ( not ( = ?auto_667872 ?auto_667873 ) ) ( not ( = ?auto_667872 ?auto_667874 ) ) ( not ( = ?auto_667872 ?auto_667875 ) ) ( not ( = ?auto_667872 ?auto_667876 ) ) ( not ( = ?auto_667873 ?auto_667874 ) ) ( not ( = ?auto_667873 ?auto_667875 ) ) ( not ( = ?auto_667873 ?auto_667876 ) ) ( not ( = ?auto_667874 ?auto_667875 ) ) ( not ( = ?auto_667874 ?auto_667876 ) ) ( not ( = ?auto_667875 ?auto_667876 ) ) ( CLEAR ?auto_667873 ) ( ON ?auto_667874 ?auto_667875 ) ( CLEAR ?auto_667874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_667863 ?auto_667864 ?auto_667865 ?auto_667866 ?auto_667867 ?auto_667868 ?auto_667869 ?auto_667870 ?auto_667871 ?auto_667872 ?auto_667873 ?auto_667874 )
      ( MAKE-13PILE ?auto_667863 ?auto_667864 ?auto_667865 ?auto_667866 ?auto_667867 ?auto_667868 ?auto_667869 ?auto_667870 ?auto_667871 ?auto_667872 ?auto_667873 ?auto_667874 ?auto_667875 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_667917 - BLOCK
      ?auto_667918 - BLOCK
      ?auto_667919 - BLOCK
      ?auto_667920 - BLOCK
      ?auto_667921 - BLOCK
      ?auto_667922 - BLOCK
      ?auto_667923 - BLOCK
      ?auto_667924 - BLOCK
      ?auto_667925 - BLOCK
      ?auto_667926 - BLOCK
      ?auto_667927 - BLOCK
      ?auto_667928 - BLOCK
      ?auto_667929 - BLOCK
    )
    :vars
    (
      ?auto_667930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667929 ?auto_667930 ) ( ON-TABLE ?auto_667917 ) ( ON ?auto_667918 ?auto_667917 ) ( ON ?auto_667919 ?auto_667918 ) ( ON ?auto_667920 ?auto_667919 ) ( ON ?auto_667921 ?auto_667920 ) ( ON ?auto_667922 ?auto_667921 ) ( ON ?auto_667923 ?auto_667922 ) ( ON ?auto_667924 ?auto_667923 ) ( ON ?auto_667925 ?auto_667924 ) ( ON ?auto_667926 ?auto_667925 ) ( not ( = ?auto_667917 ?auto_667918 ) ) ( not ( = ?auto_667917 ?auto_667919 ) ) ( not ( = ?auto_667917 ?auto_667920 ) ) ( not ( = ?auto_667917 ?auto_667921 ) ) ( not ( = ?auto_667917 ?auto_667922 ) ) ( not ( = ?auto_667917 ?auto_667923 ) ) ( not ( = ?auto_667917 ?auto_667924 ) ) ( not ( = ?auto_667917 ?auto_667925 ) ) ( not ( = ?auto_667917 ?auto_667926 ) ) ( not ( = ?auto_667917 ?auto_667927 ) ) ( not ( = ?auto_667917 ?auto_667928 ) ) ( not ( = ?auto_667917 ?auto_667929 ) ) ( not ( = ?auto_667917 ?auto_667930 ) ) ( not ( = ?auto_667918 ?auto_667919 ) ) ( not ( = ?auto_667918 ?auto_667920 ) ) ( not ( = ?auto_667918 ?auto_667921 ) ) ( not ( = ?auto_667918 ?auto_667922 ) ) ( not ( = ?auto_667918 ?auto_667923 ) ) ( not ( = ?auto_667918 ?auto_667924 ) ) ( not ( = ?auto_667918 ?auto_667925 ) ) ( not ( = ?auto_667918 ?auto_667926 ) ) ( not ( = ?auto_667918 ?auto_667927 ) ) ( not ( = ?auto_667918 ?auto_667928 ) ) ( not ( = ?auto_667918 ?auto_667929 ) ) ( not ( = ?auto_667918 ?auto_667930 ) ) ( not ( = ?auto_667919 ?auto_667920 ) ) ( not ( = ?auto_667919 ?auto_667921 ) ) ( not ( = ?auto_667919 ?auto_667922 ) ) ( not ( = ?auto_667919 ?auto_667923 ) ) ( not ( = ?auto_667919 ?auto_667924 ) ) ( not ( = ?auto_667919 ?auto_667925 ) ) ( not ( = ?auto_667919 ?auto_667926 ) ) ( not ( = ?auto_667919 ?auto_667927 ) ) ( not ( = ?auto_667919 ?auto_667928 ) ) ( not ( = ?auto_667919 ?auto_667929 ) ) ( not ( = ?auto_667919 ?auto_667930 ) ) ( not ( = ?auto_667920 ?auto_667921 ) ) ( not ( = ?auto_667920 ?auto_667922 ) ) ( not ( = ?auto_667920 ?auto_667923 ) ) ( not ( = ?auto_667920 ?auto_667924 ) ) ( not ( = ?auto_667920 ?auto_667925 ) ) ( not ( = ?auto_667920 ?auto_667926 ) ) ( not ( = ?auto_667920 ?auto_667927 ) ) ( not ( = ?auto_667920 ?auto_667928 ) ) ( not ( = ?auto_667920 ?auto_667929 ) ) ( not ( = ?auto_667920 ?auto_667930 ) ) ( not ( = ?auto_667921 ?auto_667922 ) ) ( not ( = ?auto_667921 ?auto_667923 ) ) ( not ( = ?auto_667921 ?auto_667924 ) ) ( not ( = ?auto_667921 ?auto_667925 ) ) ( not ( = ?auto_667921 ?auto_667926 ) ) ( not ( = ?auto_667921 ?auto_667927 ) ) ( not ( = ?auto_667921 ?auto_667928 ) ) ( not ( = ?auto_667921 ?auto_667929 ) ) ( not ( = ?auto_667921 ?auto_667930 ) ) ( not ( = ?auto_667922 ?auto_667923 ) ) ( not ( = ?auto_667922 ?auto_667924 ) ) ( not ( = ?auto_667922 ?auto_667925 ) ) ( not ( = ?auto_667922 ?auto_667926 ) ) ( not ( = ?auto_667922 ?auto_667927 ) ) ( not ( = ?auto_667922 ?auto_667928 ) ) ( not ( = ?auto_667922 ?auto_667929 ) ) ( not ( = ?auto_667922 ?auto_667930 ) ) ( not ( = ?auto_667923 ?auto_667924 ) ) ( not ( = ?auto_667923 ?auto_667925 ) ) ( not ( = ?auto_667923 ?auto_667926 ) ) ( not ( = ?auto_667923 ?auto_667927 ) ) ( not ( = ?auto_667923 ?auto_667928 ) ) ( not ( = ?auto_667923 ?auto_667929 ) ) ( not ( = ?auto_667923 ?auto_667930 ) ) ( not ( = ?auto_667924 ?auto_667925 ) ) ( not ( = ?auto_667924 ?auto_667926 ) ) ( not ( = ?auto_667924 ?auto_667927 ) ) ( not ( = ?auto_667924 ?auto_667928 ) ) ( not ( = ?auto_667924 ?auto_667929 ) ) ( not ( = ?auto_667924 ?auto_667930 ) ) ( not ( = ?auto_667925 ?auto_667926 ) ) ( not ( = ?auto_667925 ?auto_667927 ) ) ( not ( = ?auto_667925 ?auto_667928 ) ) ( not ( = ?auto_667925 ?auto_667929 ) ) ( not ( = ?auto_667925 ?auto_667930 ) ) ( not ( = ?auto_667926 ?auto_667927 ) ) ( not ( = ?auto_667926 ?auto_667928 ) ) ( not ( = ?auto_667926 ?auto_667929 ) ) ( not ( = ?auto_667926 ?auto_667930 ) ) ( not ( = ?auto_667927 ?auto_667928 ) ) ( not ( = ?auto_667927 ?auto_667929 ) ) ( not ( = ?auto_667927 ?auto_667930 ) ) ( not ( = ?auto_667928 ?auto_667929 ) ) ( not ( = ?auto_667928 ?auto_667930 ) ) ( not ( = ?auto_667929 ?auto_667930 ) ) ( ON ?auto_667928 ?auto_667929 ) ( CLEAR ?auto_667926 ) ( ON ?auto_667927 ?auto_667928 ) ( CLEAR ?auto_667927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_667917 ?auto_667918 ?auto_667919 ?auto_667920 ?auto_667921 ?auto_667922 ?auto_667923 ?auto_667924 ?auto_667925 ?auto_667926 ?auto_667927 )
      ( MAKE-13PILE ?auto_667917 ?auto_667918 ?auto_667919 ?auto_667920 ?auto_667921 ?auto_667922 ?auto_667923 ?auto_667924 ?auto_667925 ?auto_667926 ?auto_667927 ?auto_667928 ?auto_667929 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_667971 - BLOCK
      ?auto_667972 - BLOCK
      ?auto_667973 - BLOCK
      ?auto_667974 - BLOCK
      ?auto_667975 - BLOCK
      ?auto_667976 - BLOCK
      ?auto_667977 - BLOCK
      ?auto_667978 - BLOCK
      ?auto_667979 - BLOCK
      ?auto_667980 - BLOCK
      ?auto_667981 - BLOCK
      ?auto_667982 - BLOCK
      ?auto_667983 - BLOCK
    )
    :vars
    (
      ?auto_667984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_667983 ?auto_667984 ) ( ON-TABLE ?auto_667971 ) ( ON ?auto_667972 ?auto_667971 ) ( ON ?auto_667973 ?auto_667972 ) ( ON ?auto_667974 ?auto_667973 ) ( ON ?auto_667975 ?auto_667974 ) ( ON ?auto_667976 ?auto_667975 ) ( ON ?auto_667977 ?auto_667976 ) ( ON ?auto_667978 ?auto_667977 ) ( ON ?auto_667979 ?auto_667978 ) ( not ( = ?auto_667971 ?auto_667972 ) ) ( not ( = ?auto_667971 ?auto_667973 ) ) ( not ( = ?auto_667971 ?auto_667974 ) ) ( not ( = ?auto_667971 ?auto_667975 ) ) ( not ( = ?auto_667971 ?auto_667976 ) ) ( not ( = ?auto_667971 ?auto_667977 ) ) ( not ( = ?auto_667971 ?auto_667978 ) ) ( not ( = ?auto_667971 ?auto_667979 ) ) ( not ( = ?auto_667971 ?auto_667980 ) ) ( not ( = ?auto_667971 ?auto_667981 ) ) ( not ( = ?auto_667971 ?auto_667982 ) ) ( not ( = ?auto_667971 ?auto_667983 ) ) ( not ( = ?auto_667971 ?auto_667984 ) ) ( not ( = ?auto_667972 ?auto_667973 ) ) ( not ( = ?auto_667972 ?auto_667974 ) ) ( not ( = ?auto_667972 ?auto_667975 ) ) ( not ( = ?auto_667972 ?auto_667976 ) ) ( not ( = ?auto_667972 ?auto_667977 ) ) ( not ( = ?auto_667972 ?auto_667978 ) ) ( not ( = ?auto_667972 ?auto_667979 ) ) ( not ( = ?auto_667972 ?auto_667980 ) ) ( not ( = ?auto_667972 ?auto_667981 ) ) ( not ( = ?auto_667972 ?auto_667982 ) ) ( not ( = ?auto_667972 ?auto_667983 ) ) ( not ( = ?auto_667972 ?auto_667984 ) ) ( not ( = ?auto_667973 ?auto_667974 ) ) ( not ( = ?auto_667973 ?auto_667975 ) ) ( not ( = ?auto_667973 ?auto_667976 ) ) ( not ( = ?auto_667973 ?auto_667977 ) ) ( not ( = ?auto_667973 ?auto_667978 ) ) ( not ( = ?auto_667973 ?auto_667979 ) ) ( not ( = ?auto_667973 ?auto_667980 ) ) ( not ( = ?auto_667973 ?auto_667981 ) ) ( not ( = ?auto_667973 ?auto_667982 ) ) ( not ( = ?auto_667973 ?auto_667983 ) ) ( not ( = ?auto_667973 ?auto_667984 ) ) ( not ( = ?auto_667974 ?auto_667975 ) ) ( not ( = ?auto_667974 ?auto_667976 ) ) ( not ( = ?auto_667974 ?auto_667977 ) ) ( not ( = ?auto_667974 ?auto_667978 ) ) ( not ( = ?auto_667974 ?auto_667979 ) ) ( not ( = ?auto_667974 ?auto_667980 ) ) ( not ( = ?auto_667974 ?auto_667981 ) ) ( not ( = ?auto_667974 ?auto_667982 ) ) ( not ( = ?auto_667974 ?auto_667983 ) ) ( not ( = ?auto_667974 ?auto_667984 ) ) ( not ( = ?auto_667975 ?auto_667976 ) ) ( not ( = ?auto_667975 ?auto_667977 ) ) ( not ( = ?auto_667975 ?auto_667978 ) ) ( not ( = ?auto_667975 ?auto_667979 ) ) ( not ( = ?auto_667975 ?auto_667980 ) ) ( not ( = ?auto_667975 ?auto_667981 ) ) ( not ( = ?auto_667975 ?auto_667982 ) ) ( not ( = ?auto_667975 ?auto_667983 ) ) ( not ( = ?auto_667975 ?auto_667984 ) ) ( not ( = ?auto_667976 ?auto_667977 ) ) ( not ( = ?auto_667976 ?auto_667978 ) ) ( not ( = ?auto_667976 ?auto_667979 ) ) ( not ( = ?auto_667976 ?auto_667980 ) ) ( not ( = ?auto_667976 ?auto_667981 ) ) ( not ( = ?auto_667976 ?auto_667982 ) ) ( not ( = ?auto_667976 ?auto_667983 ) ) ( not ( = ?auto_667976 ?auto_667984 ) ) ( not ( = ?auto_667977 ?auto_667978 ) ) ( not ( = ?auto_667977 ?auto_667979 ) ) ( not ( = ?auto_667977 ?auto_667980 ) ) ( not ( = ?auto_667977 ?auto_667981 ) ) ( not ( = ?auto_667977 ?auto_667982 ) ) ( not ( = ?auto_667977 ?auto_667983 ) ) ( not ( = ?auto_667977 ?auto_667984 ) ) ( not ( = ?auto_667978 ?auto_667979 ) ) ( not ( = ?auto_667978 ?auto_667980 ) ) ( not ( = ?auto_667978 ?auto_667981 ) ) ( not ( = ?auto_667978 ?auto_667982 ) ) ( not ( = ?auto_667978 ?auto_667983 ) ) ( not ( = ?auto_667978 ?auto_667984 ) ) ( not ( = ?auto_667979 ?auto_667980 ) ) ( not ( = ?auto_667979 ?auto_667981 ) ) ( not ( = ?auto_667979 ?auto_667982 ) ) ( not ( = ?auto_667979 ?auto_667983 ) ) ( not ( = ?auto_667979 ?auto_667984 ) ) ( not ( = ?auto_667980 ?auto_667981 ) ) ( not ( = ?auto_667980 ?auto_667982 ) ) ( not ( = ?auto_667980 ?auto_667983 ) ) ( not ( = ?auto_667980 ?auto_667984 ) ) ( not ( = ?auto_667981 ?auto_667982 ) ) ( not ( = ?auto_667981 ?auto_667983 ) ) ( not ( = ?auto_667981 ?auto_667984 ) ) ( not ( = ?auto_667982 ?auto_667983 ) ) ( not ( = ?auto_667982 ?auto_667984 ) ) ( not ( = ?auto_667983 ?auto_667984 ) ) ( ON ?auto_667982 ?auto_667983 ) ( ON ?auto_667981 ?auto_667982 ) ( CLEAR ?auto_667979 ) ( ON ?auto_667980 ?auto_667981 ) ( CLEAR ?auto_667980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_667971 ?auto_667972 ?auto_667973 ?auto_667974 ?auto_667975 ?auto_667976 ?auto_667977 ?auto_667978 ?auto_667979 ?auto_667980 )
      ( MAKE-13PILE ?auto_667971 ?auto_667972 ?auto_667973 ?auto_667974 ?auto_667975 ?auto_667976 ?auto_667977 ?auto_667978 ?auto_667979 ?auto_667980 ?auto_667981 ?auto_667982 ?auto_667983 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668025 - BLOCK
      ?auto_668026 - BLOCK
      ?auto_668027 - BLOCK
      ?auto_668028 - BLOCK
      ?auto_668029 - BLOCK
      ?auto_668030 - BLOCK
      ?auto_668031 - BLOCK
      ?auto_668032 - BLOCK
      ?auto_668033 - BLOCK
      ?auto_668034 - BLOCK
      ?auto_668035 - BLOCK
      ?auto_668036 - BLOCK
      ?auto_668037 - BLOCK
    )
    :vars
    (
      ?auto_668038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668037 ?auto_668038 ) ( ON-TABLE ?auto_668025 ) ( ON ?auto_668026 ?auto_668025 ) ( ON ?auto_668027 ?auto_668026 ) ( ON ?auto_668028 ?auto_668027 ) ( ON ?auto_668029 ?auto_668028 ) ( ON ?auto_668030 ?auto_668029 ) ( ON ?auto_668031 ?auto_668030 ) ( ON ?auto_668032 ?auto_668031 ) ( not ( = ?auto_668025 ?auto_668026 ) ) ( not ( = ?auto_668025 ?auto_668027 ) ) ( not ( = ?auto_668025 ?auto_668028 ) ) ( not ( = ?auto_668025 ?auto_668029 ) ) ( not ( = ?auto_668025 ?auto_668030 ) ) ( not ( = ?auto_668025 ?auto_668031 ) ) ( not ( = ?auto_668025 ?auto_668032 ) ) ( not ( = ?auto_668025 ?auto_668033 ) ) ( not ( = ?auto_668025 ?auto_668034 ) ) ( not ( = ?auto_668025 ?auto_668035 ) ) ( not ( = ?auto_668025 ?auto_668036 ) ) ( not ( = ?auto_668025 ?auto_668037 ) ) ( not ( = ?auto_668025 ?auto_668038 ) ) ( not ( = ?auto_668026 ?auto_668027 ) ) ( not ( = ?auto_668026 ?auto_668028 ) ) ( not ( = ?auto_668026 ?auto_668029 ) ) ( not ( = ?auto_668026 ?auto_668030 ) ) ( not ( = ?auto_668026 ?auto_668031 ) ) ( not ( = ?auto_668026 ?auto_668032 ) ) ( not ( = ?auto_668026 ?auto_668033 ) ) ( not ( = ?auto_668026 ?auto_668034 ) ) ( not ( = ?auto_668026 ?auto_668035 ) ) ( not ( = ?auto_668026 ?auto_668036 ) ) ( not ( = ?auto_668026 ?auto_668037 ) ) ( not ( = ?auto_668026 ?auto_668038 ) ) ( not ( = ?auto_668027 ?auto_668028 ) ) ( not ( = ?auto_668027 ?auto_668029 ) ) ( not ( = ?auto_668027 ?auto_668030 ) ) ( not ( = ?auto_668027 ?auto_668031 ) ) ( not ( = ?auto_668027 ?auto_668032 ) ) ( not ( = ?auto_668027 ?auto_668033 ) ) ( not ( = ?auto_668027 ?auto_668034 ) ) ( not ( = ?auto_668027 ?auto_668035 ) ) ( not ( = ?auto_668027 ?auto_668036 ) ) ( not ( = ?auto_668027 ?auto_668037 ) ) ( not ( = ?auto_668027 ?auto_668038 ) ) ( not ( = ?auto_668028 ?auto_668029 ) ) ( not ( = ?auto_668028 ?auto_668030 ) ) ( not ( = ?auto_668028 ?auto_668031 ) ) ( not ( = ?auto_668028 ?auto_668032 ) ) ( not ( = ?auto_668028 ?auto_668033 ) ) ( not ( = ?auto_668028 ?auto_668034 ) ) ( not ( = ?auto_668028 ?auto_668035 ) ) ( not ( = ?auto_668028 ?auto_668036 ) ) ( not ( = ?auto_668028 ?auto_668037 ) ) ( not ( = ?auto_668028 ?auto_668038 ) ) ( not ( = ?auto_668029 ?auto_668030 ) ) ( not ( = ?auto_668029 ?auto_668031 ) ) ( not ( = ?auto_668029 ?auto_668032 ) ) ( not ( = ?auto_668029 ?auto_668033 ) ) ( not ( = ?auto_668029 ?auto_668034 ) ) ( not ( = ?auto_668029 ?auto_668035 ) ) ( not ( = ?auto_668029 ?auto_668036 ) ) ( not ( = ?auto_668029 ?auto_668037 ) ) ( not ( = ?auto_668029 ?auto_668038 ) ) ( not ( = ?auto_668030 ?auto_668031 ) ) ( not ( = ?auto_668030 ?auto_668032 ) ) ( not ( = ?auto_668030 ?auto_668033 ) ) ( not ( = ?auto_668030 ?auto_668034 ) ) ( not ( = ?auto_668030 ?auto_668035 ) ) ( not ( = ?auto_668030 ?auto_668036 ) ) ( not ( = ?auto_668030 ?auto_668037 ) ) ( not ( = ?auto_668030 ?auto_668038 ) ) ( not ( = ?auto_668031 ?auto_668032 ) ) ( not ( = ?auto_668031 ?auto_668033 ) ) ( not ( = ?auto_668031 ?auto_668034 ) ) ( not ( = ?auto_668031 ?auto_668035 ) ) ( not ( = ?auto_668031 ?auto_668036 ) ) ( not ( = ?auto_668031 ?auto_668037 ) ) ( not ( = ?auto_668031 ?auto_668038 ) ) ( not ( = ?auto_668032 ?auto_668033 ) ) ( not ( = ?auto_668032 ?auto_668034 ) ) ( not ( = ?auto_668032 ?auto_668035 ) ) ( not ( = ?auto_668032 ?auto_668036 ) ) ( not ( = ?auto_668032 ?auto_668037 ) ) ( not ( = ?auto_668032 ?auto_668038 ) ) ( not ( = ?auto_668033 ?auto_668034 ) ) ( not ( = ?auto_668033 ?auto_668035 ) ) ( not ( = ?auto_668033 ?auto_668036 ) ) ( not ( = ?auto_668033 ?auto_668037 ) ) ( not ( = ?auto_668033 ?auto_668038 ) ) ( not ( = ?auto_668034 ?auto_668035 ) ) ( not ( = ?auto_668034 ?auto_668036 ) ) ( not ( = ?auto_668034 ?auto_668037 ) ) ( not ( = ?auto_668034 ?auto_668038 ) ) ( not ( = ?auto_668035 ?auto_668036 ) ) ( not ( = ?auto_668035 ?auto_668037 ) ) ( not ( = ?auto_668035 ?auto_668038 ) ) ( not ( = ?auto_668036 ?auto_668037 ) ) ( not ( = ?auto_668036 ?auto_668038 ) ) ( not ( = ?auto_668037 ?auto_668038 ) ) ( ON ?auto_668036 ?auto_668037 ) ( ON ?auto_668035 ?auto_668036 ) ( ON ?auto_668034 ?auto_668035 ) ( CLEAR ?auto_668032 ) ( ON ?auto_668033 ?auto_668034 ) ( CLEAR ?auto_668033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_668025 ?auto_668026 ?auto_668027 ?auto_668028 ?auto_668029 ?auto_668030 ?auto_668031 ?auto_668032 ?auto_668033 )
      ( MAKE-13PILE ?auto_668025 ?auto_668026 ?auto_668027 ?auto_668028 ?auto_668029 ?auto_668030 ?auto_668031 ?auto_668032 ?auto_668033 ?auto_668034 ?auto_668035 ?auto_668036 ?auto_668037 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668079 - BLOCK
      ?auto_668080 - BLOCK
      ?auto_668081 - BLOCK
      ?auto_668082 - BLOCK
      ?auto_668083 - BLOCK
      ?auto_668084 - BLOCK
      ?auto_668085 - BLOCK
      ?auto_668086 - BLOCK
      ?auto_668087 - BLOCK
      ?auto_668088 - BLOCK
      ?auto_668089 - BLOCK
      ?auto_668090 - BLOCK
      ?auto_668091 - BLOCK
    )
    :vars
    (
      ?auto_668092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668091 ?auto_668092 ) ( ON-TABLE ?auto_668079 ) ( ON ?auto_668080 ?auto_668079 ) ( ON ?auto_668081 ?auto_668080 ) ( ON ?auto_668082 ?auto_668081 ) ( ON ?auto_668083 ?auto_668082 ) ( ON ?auto_668084 ?auto_668083 ) ( ON ?auto_668085 ?auto_668084 ) ( not ( = ?auto_668079 ?auto_668080 ) ) ( not ( = ?auto_668079 ?auto_668081 ) ) ( not ( = ?auto_668079 ?auto_668082 ) ) ( not ( = ?auto_668079 ?auto_668083 ) ) ( not ( = ?auto_668079 ?auto_668084 ) ) ( not ( = ?auto_668079 ?auto_668085 ) ) ( not ( = ?auto_668079 ?auto_668086 ) ) ( not ( = ?auto_668079 ?auto_668087 ) ) ( not ( = ?auto_668079 ?auto_668088 ) ) ( not ( = ?auto_668079 ?auto_668089 ) ) ( not ( = ?auto_668079 ?auto_668090 ) ) ( not ( = ?auto_668079 ?auto_668091 ) ) ( not ( = ?auto_668079 ?auto_668092 ) ) ( not ( = ?auto_668080 ?auto_668081 ) ) ( not ( = ?auto_668080 ?auto_668082 ) ) ( not ( = ?auto_668080 ?auto_668083 ) ) ( not ( = ?auto_668080 ?auto_668084 ) ) ( not ( = ?auto_668080 ?auto_668085 ) ) ( not ( = ?auto_668080 ?auto_668086 ) ) ( not ( = ?auto_668080 ?auto_668087 ) ) ( not ( = ?auto_668080 ?auto_668088 ) ) ( not ( = ?auto_668080 ?auto_668089 ) ) ( not ( = ?auto_668080 ?auto_668090 ) ) ( not ( = ?auto_668080 ?auto_668091 ) ) ( not ( = ?auto_668080 ?auto_668092 ) ) ( not ( = ?auto_668081 ?auto_668082 ) ) ( not ( = ?auto_668081 ?auto_668083 ) ) ( not ( = ?auto_668081 ?auto_668084 ) ) ( not ( = ?auto_668081 ?auto_668085 ) ) ( not ( = ?auto_668081 ?auto_668086 ) ) ( not ( = ?auto_668081 ?auto_668087 ) ) ( not ( = ?auto_668081 ?auto_668088 ) ) ( not ( = ?auto_668081 ?auto_668089 ) ) ( not ( = ?auto_668081 ?auto_668090 ) ) ( not ( = ?auto_668081 ?auto_668091 ) ) ( not ( = ?auto_668081 ?auto_668092 ) ) ( not ( = ?auto_668082 ?auto_668083 ) ) ( not ( = ?auto_668082 ?auto_668084 ) ) ( not ( = ?auto_668082 ?auto_668085 ) ) ( not ( = ?auto_668082 ?auto_668086 ) ) ( not ( = ?auto_668082 ?auto_668087 ) ) ( not ( = ?auto_668082 ?auto_668088 ) ) ( not ( = ?auto_668082 ?auto_668089 ) ) ( not ( = ?auto_668082 ?auto_668090 ) ) ( not ( = ?auto_668082 ?auto_668091 ) ) ( not ( = ?auto_668082 ?auto_668092 ) ) ( not ( = ?auto_668083 ?auto_668084 ) ) ( not ( = ?auto_668083 ?auto_668085 ) ) ( not ( = ?auto_668083 ?auto_668086 ) ) ( not ( = ?auto_668083 ?auto_668087 ) ) ( not ( = ?auto_668083 ?auto_668088 ) ) ( not ( = ?auto_668083 ?auto_668089 ) ) ( not ( = ?auto_668083 ?auto_668090 ) ) ( not ( = ?auto_668083 ?auto_668091 ) ) ( not ( = ?auto_668083 ?auto_668092 ) ) ( not ( = ?auto_668084 ?auto_668085 ) ) ( not ( = ?auto_668084 ?auto_668086 ) ) ( not ( = ?auto_668084 ?auto_668087 ) ) ( not ( = ?auto_668084 ?auto_668088 ) ) ( not ( = ?auto_668084 ?auto_668089 ) ) ( not ( = ?auto_668084 ?auto_668090 ) ) ( not ( = ?auto_668084 ?auto_668091 ) ) ( not ( = ?auto_668084 ?auto_668092 ) ) ( not ( = ?auto_668085 ?auto_668086 ) ) ( not ( = ?auto_668085 ?auto_668087 ) ) ( not ( = ?auto_668085 ?auto_668088 ) ) ( not ( = ?auto_668085 ?auto_668089 ) ) ( not ( = ?auto_668085 ?auto_668090 ) ) ( not ( = ?auto_668085 ?auto_668091 ) ) ( not ( = ?auto_668085 ?auto_668092 ) ) ( not ( = ?auto_668086 ?auto_668087 ) ) ( not ( = ?auto_668086 ?auto_668088 ) ) ( not ( = ?auto_668086 ?auto_668089 ) ) ( not ( = ?auto_668086 ?auto_668090 ) ) ( not ( = ?auto_668086 ?auto_668091 ) ) ( not ( = ?auto_668086 ?auto_668092 ) ) ( not ( = ?auto_668087 ?auto_668088 ) ) ( not ( = ?auto_668087 ?auto_668089 ) ) ( not ( = ?auto_668087 ?auto_668090 ) ) ( not ( = ?auto_668087 ?auto_668091 ) ) ( not ( = ?auto_668087 ?auto_668092 ) ) ( not ( = ?auto_668088 ?auto_668089 ) ) ( not ( = ?auto_668088 ?auto_668090 ) ) ( not ( = ?auto_668088 ?auto_668091 ) ) ( not ( = ?auto_668088 ?auto_668092 ) ) ( not ( = ?auto_668089 ?auto_668090 ) ) ( not ( = ?auto_668089 ?auto_668091 ) ) ( not ( = ?auto_668089 ?auto_668092 ) ) ( not ( = ?auto_668090 ?auto_668091 ) ) ( not ( = ?auto_668090 ?auto_668092 ) ) ( not ( = ?auto_668091 ?auto_668092 ) ) ( ON ?auto_668090 ?auto_668091 ) ( ON ?auto_668089 ?auto_668090 ) ( ON ?auto_668088 ?auto_668089 ) ( ON ?auto_668087 ?auto_668088 ) ( CLEAR ?auto_668085 ) ( ON ?auto_668086 ?auto_668087 ) ( CLEAR ?auto_668086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_668079 ?auto_668080 ?auto_668081 ?auto_668082 ?auto_668083 ?auto_668084 ?auto_668085 ?auto_668086 )
      ( MAKE-13PILE ?auto_668079 ?auto_668080 ?auto_668081 ?auto_668082 ?auto_668083 ?auto_668084 ?auto_668085 ?auto_668086 ?auto_668087 ?auto_668088 ?auto_668089 ?auto_668090 ?auto_668091 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668133 - BLOCK
      ?auto_668134 - BLOCK
      ?auto_668135 - BLOCK
      ?auto_668136 - BLOCK
      ?auto_668137 - BLOCK
      ?auto_668138 - BLOCK
      ?auto_668139 - BLOCK
      ?auto_668140 - BLOCK
      ?auto_668141 - BLOCK
      ?auto_668142 - BLOCK
      ?auto_668143 - BLOCK
      ?auto_668144 - BLOCK
      ?auto_668145 - BLOCK
    )
    :vars
    (
      ?auto_668146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668145 ?auto_668146 ) ( ON-TABLE ?auto_668133 ) ( ON ?auto_668134 ?auto_668133 ) ( ON ?auto_668135 ?auto_668134 ) ( ON ?auto_668136 ?auto_668135 ) ( ON ?auto_668137 ?auto_668136 ) ( ON ?auto_668138 ?auto_668137 ) ( not ( = ?auto_668133 ?auto_668134 ) ) ( not ( = ?auto_668133 ?auto_668135 ) ) ( not ( = ?auto_668133 ?auto_668136 ) ) ( not ( = ?auto_668133 ?auto_668137 ) ) ( not ( = ?auto_668133 ?auto_668138 ) ) ( not ( = ?auto_668133 ?auto_668139 ) ) ( not ( = ?auto_668133 ?auto_668140 ) ) ( not ( = ?auto_668133 ?auto_668141 ) ) ( not ( = ?auto_668133 ?auto_668142 ) ) ( not ( = ?auto_668133 ?auto_668143 ) ) ( not ( = ?auto_668133 ?auto_668144 ) ) ( not ( = ?auto_668133 ?auto_668145 ) ) ( not ( = ?auto_668133 ?auto_668146 ) ) ( not ( = ?auto_668134 ?auto_668135 ) ) ( not ( = ?auto_668134 ?auto_668136 ) ) ( not ( = ?auto_668134 ?auto_668137 ) ) ( not ( = ?auto_668134 ?auto_668138 ) ) ( not ( = ?auto_668134 ?auto_668139 ) ) ( not ( = ?auto_668134 ?auto_668140 ) ) ( not ( = ?auto_668134 ?auto_668141 ) ) ( not ( = ?auto_668134 ?auto_668142 ) ) ( not ( = ?auto_668134 ?auto_668143 ) ) ( not ( = ?auto_668134 ?auto_668144 ) ) ( not ( = ?auto_668134 ?auto_668145 ) ) ( not ( = ?auto_668134 ?auto_668146 ) ) ( not ( = ?auto_668135 ?auto_668136 ) ) ( not ( = ?auto_668135 ?auto_668137 ) ) ( not ( = ?auto_668135 ?auto_668138 ) ) ( not ( = ?auto_668135 ?auto_668139 ) ) ( not ( = ?auto_668135 ?auto_668140 ) ) ( not ( = ?auto_668135 ?auto_668141 ) ) ( not ( = ?auto_668135 ?auto_668142 ) ) ( not ( = ?auto_668135 ?auto_668143 ) ) ( not ( = ?auto_668135 ?auto_668144 ) ) ( not ( = ?auto_668135 ?auto_668145 ) ) ( not ( = ?auto_668135 ?auto_668146 ) ) ( not ( = ?auto_668136 ?auto_668137 ) ) ( not ( = ?auto_668136 ?auto_668138 ) ) ( not ( = ?auto_668136 ?auto_668139 ) ) ( not ( = ?auto_668136 ?auto_668140 ) ) ( not ( = ?auto_668136 ?auto_668141 ) ) ( not ( = ?auto_668136 ?auto_668142 ) ) ( not ( = ?auto_668136 ?auto_668143 ) ) ( not ( = ?auto_668136 ?auto_668144 ) ) ( not ( = ?auto_668136 ?auto_668145 ) ) ( not ( = ?auto_668136 ?auto_668146 ) ) ( not ( = ?auto_668137 ?auto_668138 ) ) ( not ( = ?auto_668137 ?auto_668139 ) ) ( not ( = ?auto_668137 ?auto_668140 ) ) ( not ( = ?auto_668137 ?auto_668141 ) ) ( not ( = ?auto_668137 ?auto_668142 ) ) ( not ( = ?auto_668137 ?auto_668143 ) ) ( not ( = ?auto_668137 ?auto_668144 ) ) ( not ( = ?auto_668137 ?auto_668145 ) ) ( not ( = ?auto_668137 ?auto_668146 ) ) ( not ( = ?auto_668138 ?auto_668139 ) ) ( not ( = ?auto_668138 ?auto_668140 ) ) ( not ( = ?auto_668138 ?auto_668141 ) ) ( not ( = ?auto_668138 ?auto_668142 ) ) ( not ( = ?auto_668138 ?auto_668143 ) ) ( not ( = ?auto_668138 ?auto_668144 ) ) ( not ( = ?auto_668138 ?auto_668145 ) ) ( not ( = ?auto_668138 ?auto_668146 ) ) ( not ( = ?auto_668139 ?auto_668140 ) ) ( not ( = ?auto_668139 ?auto_668141 ) ) ( not ( = ?auto_668139 ?auto_668142 ) ) ( not ( = ?auto_668139 ?auto_668143 ) ) ( not ( = ?auto_668139 ?auto_668144 ) ) ( not ( = ?auto_668139 ?auto_668145 ) ) ( not ( = ?auto_668139 ?auto_668146 ) ) ( not ( = ?auto_668140 ?auto_668141 ) ) ( not ( = ?auto_668140 ?auto_668142 ) ) ( not ( = ?auto_668140 ?auto_668143 ) ) ( not ( = ?auto_668140 ?auto_668144 ) ) ( not ( = ?auto_668140 ?auto_668145 ) ) ( not ( = ?auto_668140 ?auto_668146 ) ) ( not ( = ?auto_668141 ?auto_668142 ) ) ( not ( = ?auto_668141 ?auto_668143 ) ) ( not ( = ?auto_668141 ?auto_668144 ) ) ( not ( = ?auto_668141 ?auto_668145 ) ) ( not ( = ?auto_668141 ?auto_668146 ) ) ( not ( = ?auto_668142 ?auto_668143 ) ) ( not ( = ?auto_668142 ?auto_668144 ) ) ( not ( = ?auto_668142 ?auto_668145 ) ) ( not ( = ?auto_668142 ?auto_668146 ) ) ( not ( = ?auto_668143 ?auto_668144 ) ) ( not ( = ?auto_668143 ?auto_668145 ) ) ( not ( = ?auto_668143 ?auto_668146 ) ) ( not ( = ?auto_668144 ?auto_668145 ) ) ( not ( = ?auto_668144 ?auto_668146 ) ) ( not ( = ?auto_668145 ?auto_668146 ) ) ( ON ?auto_668144 ?auto_668145 ) ( ON ?auto_668143 ?auto_668144 ) ( ON ?auto_668142 ?auto_668143 ) ( ON ?auto_668141 ?auto_668142 ) ( ON ?auto_668140 ?auto_668141 ) ( CLEAR ?auto_668138 ) ( ON ?auto_668139 ?auto_668140 ) ( CLEAR ?auto_668139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_668133 ?auto_668134 ?auto_668135 ?auto_668136 ?auto_668137 ?auto_668138 ?auto_668139 )
      ( MAKE-13PILE ?auto_668133 ?auto_668134 ?auto_668135 ?auto_668136 ?auto_668137 ?auto_668138 ?auto_668139 ?auto_668140 ?auto_668141 ?auto_668142 ?auto_668143 ?auto_668144 ?auto_668145 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668187 - BLOCK
      ?auto_668188 - BLOCK
      ?auto_668189 - BLOCK
      ?auto_668190 - BLOCK
      ?auto_668191 - BLOCK
      ?auto_668192 - BLOCK
      ?auto_668193 - BLOCK
      ?auto_668194 - BLOCK
      ?auto_668195 - BLOCK
      ?auto_668196 - BLOCK
      ?auto_668197 - BLOCK
      ?auto_668198 - BLOCK
      ?auto_668199 - BLOCK
    )
    :vars
    (
      ?auto_668200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668199 ?auto_668200 ) ( ON-TABLE ?auto_668187 ) ( ON ?auto_668188 ?auto_668187 ) ( ON ?auto_668189 ?auto_668188 ) ( ON ?auto_668190 ?auto_668189 ) ( ON ?auto_668191 ?auto_668190 ) ( not ( = ?auto_668187 ?auto_668188 ) ) ( not ( = ?auto_668187 ?auto_668189 ) ) ( not ( = ?auto_668187 ?auto_668190 ) ) ( not ( = ?auto_668187 ?auto_668191 ) ) ( not ( = ?auto_668187 ?auto_668192 ) ) ( not ( = ?auto_668187 ?auto_668193 ) ) ( not ( = ?auto_668187 ?auto_668194 ) ) ( not ( = ?auto_668187 ?auto_668195 ) ) ( not ( = ?auto_668187 ?auto_668196 ) ) ( not ( = ?auto_668187 ?auto_668197 ) ) ( not ( = ?auto_668187 ?auto_668198 ) ) ( not ( = ?auto_668187 ?auto_668199 ) ) ( not ( = ?auto_668187 ?auto_668200 ) ) ( not ( = ?auto_668188 ?auto_668189 ) ) ( not ( = ?auto_668188 ?auto_668190 ) ) ( not ( = ?auto_668188 ?auto_668191 ) ) ( not ( = ?auto_668188 ?auto_668192 ) ) ( not ( = ?auto_668188 ?auto_668193 ) ) ( not ( = ?auto_668188 ?auto_668194 ) ) ( not ( = ?auto_668188 ?auto_668195 ) ) ( not ( = ?auto_668188 ?auto_668196 ) ) ( not ( = ?auto_668188 ?auto_668197 ) ) ( not ( = ?auto_668188 ?auto_668198 ) ) ( not ( = ?auto_668188 ?auto_668199 ) ) ( not ( = ?auto_668188 ?auto_668200 ) ) ( not ( = ?auto_668189 ?auto_668190 ) ) ( not ( = ?auto_668189 ?auto_668191 ) ) ( not ( = ?auto_668189 ?auto_668192 ) ) ( not ( = ?auto_668189 ?auto_668193 ) ) ( not ( = ?auto_668189 ?auto_668194 ) ) ( not ( = ?auto_668189 ?auto_668195 ) ) ( not ( = ?auto_668189 ?auto_668196 ) ) ( not ( = ?auto_668189 ?auto_668197 ) ) ( not ( = ?auto_668189 ?auto_668198 ) ) ( not ( = ?auto_668189 ?auto_668199 ) ) ( not ( = ?auto_668189 ?auto_668200 ) ) ( not ( = ?auto_668190 ?auto_668191 ) ) ( not ( = ?auto_668190 ?auto_668192 ) ) ( not ( = ?auto_668190 ?auto_668193 ) ) ( not ( = ?auto_668190 ?auto_668194 ) ) ( not ( = ?auto_668190 ?auto_668195 ) ) ( not ( = ?auto_668190 ?auto_668196 ) ) ( not ( = ?auto_668190 ?auto_668197 ) ) ( not ( = ?auto_668190 ?auto_668198 ) ) ( not ( = ?auto_668190 ?auto_668199 ) ) ( not ( = ?auto_668190 ?auto_668200 ) ) ( not ( = ?auto_668191 ?auto_668192 ) ) ( not ( = ?auto_668191 ?auto_668193 ) ) ( not ( = ?auto_668191 ?auto_668194 ) ) ( not ( = ?auto_668191 ?auto_668195 ) ) ( not ( = ?auto_668191 ?auto_668196 ) ) ( not ( = ?auto_668191 ?auto_668197 ) ) ( not ( = ?auto_668191 ?auto_668198 ) ) ( not ( = ?auto_668191 ?auto_668199 ) ) ( not ( = ?auto_668191 ?auto_668200 ) ) ( not ( = ?auto_668192 ?auto_668193 ) ) ( not ( = ?auto_668192 ?auto_668194 ) ) ( not ( = ?auto_668192 ?auto_668195 ) ) ( not ( = ?auto_668192 ?auto_668196 ) ) ( not ( = ?auto_668192 ?auto_668197 ) ) ( not ( = ?auto_668192 ?auto_668198 ) ) ( not ( = ?auto_668192 ?auto_668199 ) ) ( not ( = ?auto_668192 ?auto_668200 ) ) ( not ( = ?auto_668193 ?auto_668194 ) ) ( not ( = ?auto_668193 ?auto_668195 ) ) ( not ( = ?auto_668193 ?auto_668196 ) ) ( not ( = ?auto_668193 ?auto_668197 ) ) ( not ( = ?auto_668193 ?auto_668198 ) ) ( not ( = ?auto_668193 ?auto_668199 ) ) ( not ( = ?auto_668193 ?auto_668200 ) ) ( not ( = ?auto_668194 ?auto_668195 ) ) ( not ( = ?auto_668194 ?auto_668196 ) ) ( not ( = ?auto_668194 ?auto_668197 ) ) ( not ( = ?auto_668194 ?auto_668198 ) ) ( not ( = ?auto_668194 ?auto_668199 ) ) ( not ( = ?auto_668194 ?auto_668200 ) ) ( not ( = ?auto_668195 ?auto_668196 ) ) ( not ( = ?auto_668195 ?auto_668197 ) ) ( not ( = ?auto_668195 ?auto_668198 ) ) ( not ( = ?auto_668195 ?auto_668199 ) ) ( not ( = ?auto_668195 ?auto_668200 ) ) ( not ( = ?auto_668196 ?auto_668197 ) ) ( not ( = ?auto_668196 ?auto_668198 ) ) ( not ( = ?auto_668196 ?auto_668199 ) ) ( not ( = ?auto_668196 ?auto_668200 ) ) ( not ( = ?auto_668197 ?auto_668198 ) ) ( not ( = ?auto_668197 ?auto_668199 ) ) ( not ( = ?auto_668197 ?auto_668200 ) ) ( not ( = ?auto_668198 ?auto_668199 ) ) ( not ( = ?auto_668198 ?auto_668200 ) ) ( not ( = ?auto_668199 ?auto_668200 ) ) ( ON ?auto_668198 ?auto_668199 ) ( ON ?auto_668197 ?auto_668198 ) ( ON ?auto_668196 ?auto_668197 ) ( ON ?auto_668195 ?auto_668196 ) ( ON ?auto_668194 ?auto_668195 ) ( ON ?auto_668193 ?auto_668194 ) ( CLEAR ?auto_668191 ) ( ON ?auto_668192 ?auto_668193 ) ( CLEAR ?auto_668192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_668187 ?auto_668188 ?auto_668189 ?auto_668190 ?auto_668191 ?auto_668192 )
      ( MAKE-13PILE ?auto_668187 ?auto_668188 ?auto_668189 ?auto_668190 ?auto_668191 ?auto_668192 ?auto_668193 ?auto_668194 ?auto_668195 ?auto_668196 ?auto_668197 ?auto_668198 ?auto_668199 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668241 - BLOCK
      ?auto_668242 - BLOCK
      ?auto_668243 - BLOCK
      ?auto_668244 - BLOCK
      ?auto_668245 - BLOCK
      ?auto_668246 - BLOCK
      ?auto_668247 - BLOCK
      ?auto_668248 - BLOCK
      ?auto_668249 - BLOCK
      ?auto_668250 - BLOCK
      ?auto_668251 - BLOCK
      ?auto_668252 - BLOCK
      ?auto_668253 - BLOCK
    )
    :vars
    (
      ?auto_668254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668253 ?auto_668254 ) ( ON-TABLE ?auto_668241 ) ( ON ?auto_668242 ?auto_668241 ) ( ON ?auto_668243 ?auto_668242 ) ( ON ?auto_668244 ?auto_668243 ) ( not ( = ?auto_668241 ?auto_668242 ) ) ( not ( = ?auto_668241 ?auto_668243 ) ) ( not ( = ?auto_668241 ?auto_668244 ) ) ( not ( = ?auto_668241 ?auto_668245 ) ) ( not ( = ?auto_668241 ?auto_668246 ) ) ( not ( = ?auto_668241 ?auto_668247 ) ) ( not ( = ?auto_668241 ?auto_668248 ) ) ( not ( = ?auto_668241 ?auto_668249 ) ) ( not ( = ?auto_668241 ?auto_668250 ) ) ( not ( = ?auto_668241 ?auto_668251 ) ) ( not ( = ?auto_668241 ?auto_668252 ) ) ( not ( = ?auto_668241 ?auto_668253 ) ) ( not ( = ?auto_668241 ?auto_668254 ) ) ( not ( = ?auto_668242 ?auto_668243 ) ) ( not ( = ?auto_668242 ?auto_668244 ) ) ( not ( = ?auto_668242 ?auto_668245 ) ) ( not ( = ?auto_668242 ?auto_668246 ) ) ( not ( = ?auto_668242 ?auto_668247 ) ) ( not ( = ?auto_668242 ?auto_668248 ) ) ( not ( = ?auto_668242 ?auto_668249 ) ) ( not ( = ?auto_668242 ?auto_668250 ) ) ( not ( = ?auto_668242 ?auto_668251 ) ) ( not ( = ?auto_668242 ?auto_668252 ) ) ( not ( = ?auto_668242 ?auto_668253 ) ) ( not ( = ?auto_668242 ?auto_668254 ) ) ( not ( = ?auto_668243 ?auto_668244 ) ) ( not ( = ?auto_668243 ?auto_668245 ) ) ( not ( = ?auto_668243 ?auto_668246 ) ) ( not ( = ?auto_668243 ?auto_668247 ) ) ( not ( = ?auto_668243 ?auto_668248 ) ) ( not ( = ?auto_668243 ?auto_668249 ) ) ( not ( = ?auto_668243 ?auto_668250 ) ) ( not ( = ?auto_668243 ?auto_668251 ) ) ( not ( = ?auto_668243 ?auto_668252 ) ) ( not ( = ?auto_668243 ?auto_668253 ) ) ( not ( = ?auto_668243 ?auto_668254 ) ) ( not ( = ?auto_668244 ?auto_668245 ) ) ( not ( = ?auto_668244 ?auto_668246 ) ) ( not ( = ?auto_668244 ?auto_668247 ) ) ( not ( = ?auto_668244 ?auto_668248 ) ) ( not ( = ?auto_668244 ?auto_668249 ) ) ( not ( = ?auto_668244 ?auto_668250 ) ) ( not ( = ?auto_668244 ?auto_668251 ) ) ( not ( = ?auto_668244 ?auto_668252 ) ) ( not ( = ?auto_668244 ?auto_668253 ) ) ( not ( = ?auto_668244 ?auto_668254 ) ) ( not ( = ?auto_668245 ?auto_668246 ) ) ( not ( = ?auto_668245 ?auto_668247 ) ) ( not ( = ?auto_668245 ?auto_668248 ) ) ( not ( = ?auto_668245 ?auto_668249 ) ) ( not ( = ?auto_668245 ?auto_668250 ) ) ( not ( = ?auto_668245 ?auto_668251 ) ) ( not ( = ?auto_668245 ?auto_668252 ) ) ( not ( = ?auto_668245 ?auto_668253 ) ) ( not ( = ?auto_668245 ?auto_668254 ) ) ( not ( = ?auto_668246 ?auto_668247 ) ) ( not ( = ?auto_668246 ?auto_668248 ) ) ( not ( = ?auto_668246 ?auto_668249 ) ) ( not ( = ?auto_668246 ?auto_668250 ) ) ( not ( = ?auto_668246 ?auto_668251 ) ) ( not ( = ?auto_668246 ?auto_668252 ) ) ( not ( = ?auto_668246 ?auto_668253 ) ) ( not ( = ?auto_668246 ?auto_668254 ) ) ( not ( = ?auto_668247 ?auto_668248 ) ) ( not ( = ?auto_668247 ?auto_668249 ) ) ( not ( = ?auto_668247 ?auto_668250 ) ) ( not ( = ?auto_668247 ?auto_668251 ) ) ( not ( = ?auto_668247 ?auto_668252 ) ) ( not ( = ?auto_668247 ?auto_668253 ) ) ( not ( = ?auto_668247 ?auto_668254 ) ) ( not ( = ?auto_668248 ?auto_668249 ) ) ( not ( = ?auto_668248 ?auto_668250 ) ) ( not ( = ?auto_668248 ?auto_668251 ) ) ( not ( = ?auto_668248 ?auto_668252 ) ) ( not ( = ?auto_668248 ?auto_668253 ) ) ( not ( = ?auto_668248 ?auto_668254 ) ) ( not ( = ?auto_668249 ?auto_668250 ) ) ( not ( = ?auto_668249 ?auto_668251 ) ) ( not ( = ?auto_668249 ?auto_668252 ) ) ( not ( = ?auto_668249 ?auto_668253 ) ) ( not ( = ?auto_668249 ?auto_668254 ) ) ( not ( = ?auto_668250 ?auto_668251 ) ) ( not ( = ?auto_668250 ?auto_668252 ) ) ( not ( = ?auto_668250 ?auto_668253 ) ) ( not ( = ?auto_668250 ?auto_668254 ) ) ( not ( = ?auto_668251 ?auto_668252 ) ) ( not ( = ?auto_668251 ?auto_668253 ) ) ( not ( = ?auto_668251 ?auto_668254 ) ) ( not ( = ?auto_668252 ?auto_668253 ) ) ( not ( = ?auto_668252 ?auto_668254 ) ) ( not ( = ?auto_668253 ?auto_668254 ) ) ( ON ?auto_668252 ?auto_668253 ) ( ON ?auto_668251 ?auto_668252 ) ( ON ?auto_668250 ?auto_668251 ) ( ON ?auto_668249 ?auto_668250 ) ( ON ?auto_668248 ?auto_668249 ) ( ON ?auto_668247 ?auto_668248 ) ( ON ?auto_668246 ?auto_668247 ) ( CLEAR ?auto_668244 ) ( ON ?auto_668245 ?auto_668246 ) ( CLEAR ?auto_668245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_668241 ?auto_668242 ?auto_668243 ?auto_668244 ?auto_668245 )
      ( MAKE-13PILE ?auto_668241 ?auto_668242 ?auto_668243 ?auto_668244 ?auto_668245 ?auto_668246 ?auto_668247 ?auto_668248 ?auto_668249 ?auto_668250 ?auto_668251 ?auto_668252 ?auto_668253 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668295 - BLOCK
      ?auto_668296 - BLOCK
      ?auto_668297 - BLOCK
      ?auto_668298 - BLOCK
      ?auto_668299 - BLOCK
      ?auto_668300 - BLOCK
      ?auto_668301 - BLOCK
      ?auto_668302 - BLOCK
      ?auto_668303 - BLOCK
      ?auto_668304 - BLOCK
      ?auto_668305 - BLOCK
      ?auto_668306 - BLOCK
      ?auto_668307 - BLOCK
    )
    :vars
    (
      ?auto_668308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668307 ?auto_668308 ) ( ON-TABLE ?auto_668295 ) ( ON ?auto_668296 ?auto_668295 ) ( ON ?auto_668297 ?auto_668296 ) ( not ( = ?auto_668295 ?auto_668296 ) ) ( not ( = ?auto_668295 ?auto_668297 ) ) ( not ( = ?auto_668295 ?auto_668298 ) ) ( not ( = ?auto_668295 ?auto_668299 ) ) ( not ( = ?auto_668295 ?auto_668300 ) ) ( not ( = ?auto_668295 ?auto_668301 ) ) ( not ( = ?auto_668295 ?auto_668302 ) ) ( not ( = ?auto_668295 ?auto_668303 ) ) ( not ( = ?auto_668295 ?auto_668304 ) ) ( not ( = ?auto_668295 ?auto_668305 ) ) ( not ( = ?auto_668295 ?auto_668306 ) ) ( not ( = ?auto_668295 ?auto_668307 ) ) ( not ( = ?auto_668295 ?auto_668308 ) ) ( not ( = ?auto_668296 ?auto_668297 ) ) ( not ( = ?auto_668296 ?auto_668298 ) ) ( not ( = ?auto_668296 ?auto_668299 ) ) ( not ( = ?auto_668296 ?auto_668300 ) ) ( not ( = ?auto_668296 ?auto_668301 ) ) ( not ( = ?auto_668296 ?auto_668302 ) ) ( not ( = ?auto_668296 ?auto_668303 ) ) ( not ( = ?auto_668296 ?auto_668304 ) ) ( not ( = ?auto_668296 ?auto_668305 ) ) ( not ( = ?auto_668296 ?auto_668306 ) ) ( not ( = ?auto_668296 ?auto_668307 ) ) ( not ( = ?auto_668296 ?auto_668308 ) ) ( not ( = ?auto_668297 ?auto_668298 ) ) ( not ( = ?auto_668297 ?auto_668299 ) ) ( not ( = ?auto_668297 ?auto_668300 ) ) ( not ( = ?auto_668297 ?auto_668301 ) ) ( not ( = ?auto_668297 ?auto_668302 ) ) ( not ( = ?auto_668297 ?auto_668303 ) ) ( not ( = ?auto_668297 ?auto_668304 ) ) ( not ( = ?auto_668297 ?auto_668305 ) ) ( not ( = ?auto_668297 ?auto_668306 ) ) ( not ( = ?auto_668297 ?auto_668307 ) ) ( not ( = ?auto_668297 ?auto_668308 ) ) ( not ( = ?auto_668298 ?auto_668299 ) ) ( not ( = ?auto_668298 ?auto_668300 ) ) ( not ( = ?auto_668298 ?auto_668301 ) ) ( not ( = ?auto_668298 ?auto_668302 ) ) ( not ( = ?auto_668298 ?auto_668303 ) ) ( not ( = ?auto_668298 ?auto_668304 ) ) ( not ( = ?auto_668298 ?auto_668305 ) ) ( not ( = ?auto_668298 ?auto_668306 ) ) ( not ( = ?auto_668298 ?auto_668307 ) ) ( not ( = ?auto_668298 ?auto_668308 ) ) ( not ( = ?auto_668299 ?auto_668300 ) ) ( not ( = ?auto_668299 ?auto_668301 ) ) ( not ( = ?auto_668299 ?auto_668302 ) ) ( not ( = ?auto_668299 ?auto_668303 ) ) ( not ( = ?auto_668299 ?auto_668304 ) ) ( not ( = ?auto_668299 ?auto_668305 ) ) ( not ( = ?auto_668299 ?auto_668306 ) ) ( not ( = ?auto_668299 ?auto_668307 ) ) ( not ( = ?auto_668299 ?auto_668308 ) ) ( not ( = ?auto_668300 ?auto_668301 ) ) ( not ( = ?auto_668300 ?auto_668302 ) ) ( not ( = ?auto_668300 ?auto_668303 ) ) ( not ( = ?auto_668300 ?auto_668304 ) ) ( not ( = ?auto_668300 ?auto_668305 ) ) ( not ( = ?auto_668300 ?auto_668306 ) ) ( not ( = ?auto_668300 ?auto_668307 ) ) ( not ( = ?auto_668300 ?auto_668308 ) ) ( not ( = ?auto_668301 ?auto_668302 ) ) ( not ( = ?auto_668301 ?auto_668303 ) ) ( not ( = ?auto_668301 ?auto_668304 ) ) ( not ( = ?auto_668301 ?auto_668305 ) ) ( not ( = ?auto_668301 ?auto_668306 ) ) ( not ( = ?auto_668301 ?auto_668307 ) ) ( not ( = ?auto_668301 ?auto_668308 ) ) ( not ( = ?auto_668302 ?auto_668303 ) ) ( not ( = ?auto_668302 ?auto_668304 ) ) ( not ( = ?auto_668302 ?auto_668305 ) ) ( not ( = ?auto_668302 ?auto_668306 ) ) ( not ( = ?auto_668302 ?auto_668307 ) ) ( not ( = ?auto_668302 ?auto_668308 ) ) ( not ( = ?auto_668303 ?auto_668304 ) ) ( not ( = ?auto_668303 ?auto_668305 ) ) ( not ( = ?auto_668303 ?auto_668306 ) ) ( not ( = ?auto_668303 ?auto_668307 ) ) ( not ( = ?auto_668303 ?auto_668308 ) ) ( not ( = ?auto_668304 ?auto_668305 ) ) ( not ( = ?auto_668304 ?auto_668306 ) ) ( not ( = ?auto_668304 ?auto_668307 ) ) ( not ( = ?auto_668304 ?auto_668308 ) ) ( not ( = ?auto_668305 ?auto_668306 ) ) ( not ( = ?auto_668305 ?auto_668307 ) ) ( not ( = ?auto_668305 ?auto_668308 ) ) ( not ( = ?auto_668306 ?auto_668307 ) ) ( not ( = ?auto_668306 ?auto_668308 ) ) ( not ( = ?auto_668307 ?auto_668308 ) ) ( ON ?auto_668306 ?auto_668307 ) ( ON ?auto_668305 ?auto_668306 ) ( ON ?auto_668304 ?auto_668305 ) ( ON ?auto_668303 ?auto_668304 ) ( ON ?auto_668302 ?auto_668303 ) ( ON ?auto_668301 ?auto_668302 ) ( ON ?auto_668300 ?auto_668301 ) ( ON ?auto_668299 ?auto_668300 ) ( CLEAR ?auto_668297 ) ( ON ?auto_668298 ?auto_668299 ) ( CLEAR ?auto_668298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_668295 ?auto_668296 ?auto_668297 ?auto_668298 )
      ( MAKE-13PILE ?auto_668295 ?auto_668296 ?auto_668297 ?auto_668298 ?auto_668299 ?auto_668300 ?auto_668301 ?auto_668302 ?auto_668303 ?auto_668304 ?auto_668305 ?auto_668306 ?auto_668307 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668349 - BLOCK
      ?auto_668350 - BLOCK
      ?auto_668351 - BLOCK
      ?auto_668352 - BLOCK
      ?auto_668353 - BLOCK
      ?auto_668354 - BLOCK
      ?auto_668355 - BLOCK
      ?auto_668356 - BLOCK
      ?auto_668357 - BLOCK
      ?auto_668358 - BLOCK
      ?auto_668359 - BLOCK
      ?auto_668360 - BLOCK
      ?auto_668361 - BLOCK
    )
    :vars
    (
      ?auto_668362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668361 ?auto_668362 ) ( ON-TABLE ?auto_668349 ) ( ON ?auto_668350 ?auto_668349 ) ( not ( = ?auto_668349 ?auto_668350 ) ) ( not ( = ?auto_668349 ?auto_668351 ) ) ( not ( = ?auto_668349 ?auto_668352 ) ) ( not ( = ?auto_668349 ?auto_668353 ) ) ( not ( = ?auto_668349 ?auto_668354 ) ) ( not ( = ?auto_668349 ?auto_668355 ) ) ( not ( = ?auto_668349 ?auto_668356 ) ) ( not ( = ?auto_668349 ?auto_668357 ) ) ( not ( = ?auto_668349 ?auto_668358 ) ) ( not ( = ?auto_668349 ?auto_668359 ) ) ( not ( = ?auto_668349 ?auto_668360 ) ) ( not ( = ?auto_668349 ?auto_668361 ) ) ( not ( = ?auto_668349 ?auto_668362 ) ) ( not ( = ?auto_668350 ?auto_668351 ) ) ( not ( = ?auto_668350 ?auto_668352 ) ) ( not ( = ?auto_668350 ?auto_668353 ) ) ( not ( = ?auto_668350 ?auto_668354 ) ) ( not ( = ?auto_668350 ?auto_668355 ) ) ( not ( = ?auto_668350 ?auto_668356 ) ) ( not ( = ?auto_668350 ?auto_668357 ) ) ( not ( = ?auto_668350 ?auto_668358 ) ) ( not ( = ?auto_668350 ?auto_668359 ) ) ( not ( = ?auto_668350 ?auto_668360 ) ) ( not ( = ?auto_668350 ?auto_668361 ) ) ( not ( = ?auto_668350 ?auto_668362 ) ) ( not ( = ?auto_668351 ?auto_668352 ) ) ( not ( = ?auto_668351 ?auto_668353 ) ) ( not ( = ?auto_668351 ?auto_668354 ) ) ( not ( = ?auto_668351 ?auto_668355 ) ) ( not ( = ?auto_668351 ?auto_668356 ) ) ( not ( = ?auto_668351 ?auto_668357 ) ) ( not ( = ?auto_668351 ?auto_668358 ) ) ( not ( = ?auto_668351 ?auto_668359 ) ) ( not ( = ?auto_668351 ?auto_668360 ) ) ( not ( = ?auto_668351 ?auto_668361 ) ) ( not ( = ?auto_668351 ?auto_668362 ) ) ( not ( = ?auto_668352 ?auto_668353 ) ) ( not ( = ?auto_668352 ?auto_668354 ) ) ( not ( = ?auto_668352 ?auto_668355 ) ) ( not ( = ?auto_668352 ?auto_668356 ) ) ( not ( = ?auto_668352 ?auto_668357 ) ) ( not ( = ?auto_668352 ?auto_668358 ) ) ( not ( = ?auto_668352 ?auto_668359 ) ) ( not ( = ?auto_668352 ?auto_668360 ) ) ( not ( = ?auto_668352 ?auto_668361 ) ) ( not ( = ?auto_668352 ?auto_668362 ) ) ( not ( = ?auto_668353 ?auto_668354 ) ) ( not ( = ?auto_668353 ?auto_668355 ) ) ( not ( = ?auto_668353 ?auto_668356 ) ) ( not ( = ?auto_668353 ?auto_668357 ) ) ( not ( = ?auto_668353 ?auto_668358 ) ) ( not ( = ?auto_668353 ?auto_668359 ) ) ( not ( = ?auto_668353 ?auto_668360 ) ) ( not ( = ?auto_668353 ?auto_668361 ) ) ( not ( = ?auto_668353 ?auto_668362 ) ) ( not ( = ?auto_668354 ?auto_668355 ) ) ( not ( = ?auto_668354 ?auto_668356 ) ) ( not ( = ?auto_668354 ?auto_668357 ) ) ( not ( = ?auto_668354 ?auto_668358 ) ) ( not ( = ?auto_668354 ?auto_668359 ) ) ( not ( = ?auto_668354 ?auto_668360 ) ) ( not ( = ?auto_668354 ?auto_668361 ) ) ( not ( = ?auto_668354 ?auto_668362 ) ) ( not ( = ?auto_668355 ?auto_668356 ) ) ( not ( = ?auto_668355 ?auto_668357 ) ) ( not ( = ?auto_668355 ?auto_668358 ) ) ( not ( = ?auto_668355 ?auto_668359 ) ) ( not ( = ?auto_668355 ?auto_668360 ) ) ( not ( = ?auto_668355 ?auto_668361 ) ) ( not ( = ?auto_668355 ?auto_668362 ) ) ( not ( = ?auto_668356 ?auto_668357 ) ) ( not ( = ?auto_668356 ?auto_668358 ) ) ( not ( = ?auto_668356 ?auto_668359 ) ) ( not ( = ?auto_668356 ?auto_668360 ) ) ( not ( = ?auto_668356 ?auto_668361 ) ) ( not ( = ?auto_668356 ?auto_668362 ) ) ( not ( = ?auto_668357 ?auto_668358 ) ) ( not ( = ?auto_668357 ?auto_668359 ) ) ( not ( = ?auto_668357 ?auto_668360 ) ) ( not ( = ?auto_668357 ?auto_668361 ) ) ( not ( = ?auto_668357 ?auto_668362 ) ) ( not ( = ?auto_668358 ?auto_668359 ) ) ( not ( = ?auto_668358 ?auto_668360 ) ) ( not ( = ?auto_668358 ?auto_668361 ) ) ( not ( = ?auto_668358 ?auto_668362 ) ) ( not ( = ?auto_668359 ?auto_668360 ) ) ( not ( = ?auto_668359 ?auto_668361 ) ) ( not ( = ?auto_668359 ?auto_668362 ) ) ( not ( = ?auto_668360 ?auto_668361 ) ) ( not ( = ?auto_668360 ?auto_668362 ) ) ( not ( = ?auto_668361 ?auto_668362 ) ) ( ON ?auto_668360 ?auto_668361 ) ( ON ?auto_668359 ?auto_668360 ) ( ON ?auto_668358 ?auto_668359 ) ( ON ?auto_668357 ?auto_668358 ) ( ON ?auto_668356 ?auto_668357 ) ( ON ?auto_668355 ?auto_668356 ) ( ON ?auto_668354 ?auto_668355 ) ( ON ?auto_668353 ?auto_668354 ) ( ON ?auto_668352 ?auto_668353 ) ( CLEAR ?auto_668350 ) ( ON ?auto_668351 ?auto_668352 ) ( CLEAR ?auto_668351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_668349 ?auto_668350 ?auto_668351 )
      ( MAKE-13PILE ?auto_668349 ?auto_668350 ?auto_668351 ?auto_668352 ?auto_668353 ?auto_668354 ?auto_668355 ?auto_668356 ?auto_668357 ?auto_668358 ?auto_668359 ?auto_668360 ?auto_668361 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668403 - BLOCK
      ?auto_668404 - BLOCK
      ?auto_668405 - BLOCK
      ?auto_668406 - BLOCK
      ?auto_668407 - BLOCK
      ?auto_668408 - BLOCK
      ?auto_668409 - BLOCK
      ?auto_668410 - BLOCK
      ?auto_668411 - BLOCK
      ?auto_668412 - BLOCK
      ?auto_668413 - BLOCK
      ?auto_668414 - BLOCK
      ?auto_668415 - BLOCK
    )
    :vars
    (
      ?auto_668416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668415 ?auto_668416 ) ( ON-TABLE ?auto_668403 ) ( not ( = ?auto_668403 ?auto_668404 ) ) ( not ( = ?auto_668403 ?auto_668405 ) ) ( not ( = ?auto_668403 ?auto_668406 ) ) ( not ( = ?auto_668403 ?auto_668407 ) ) ( not ( = ?auto_668403 ?auto_668408 ) ) ( not ( = ?auto_668403 ?auto_668409 ) ) ( not ( = ?auto_668403 ?auto_668410 ) ) ( not ( = ?auto_668403 ?auto_668411 ) ) ( not ( = ?auto_668403 ?auto_668412 ) ) ( not ( = ?auto_668403 ?auto_668413 ) ) ( not ( = ?auto_668403 ?auto_668414 ) ) ( not ( = ?auto_668403 ?auto_668415 ) ) ( not ( = ?auto_668403 ?auto_668416 ) ) ( not ( = ?auto_668404 ?auto_668405 ) ) ( not ( = ?auto_668404 ?auto_668406 ) ) ( not ( = ?auto_668404 ?auto_668407 ) ) ( not ( = ?auto_668404 ?auto_668408 ) ) ( not ( = ?auto_668404 ?auto_668409 ) ) ( not ( = ?auto_668404 ?auto_668410 ) ) ( not ( = ?auto_668404 ?auto_668411 ) ) ( not ( = ?auto_668404 ?auto_668412 ) ) ( not ( = ?auto_668404 ?auto_668413 ) ) ( not ( = ?auto_668404 ?auto_668414 ) ) ( not ( = ?auto_668404 ?auto_668415 ) ) ( not ( = ?auto_668404 ?auto_668416 ) ) ( not ( = ?auto_668405 ?auto_668406 ) ) ( not ( = ?auto_668405 ?auto_668407 ) ) ( not ( = ?auto_668405 ?auto_668408 ) ) ( not ( = ?auto_668405 ?auto_668409 ) ) ( not ( = ?auto_668405 ?auto_668410 ) ) ( not ( = ?auto_668405 ?auto_668411 ) ) ( not ( = ?auto_668405 ?auto_668412 ) ) ( not ( = ?auto_668405 ?auto_668413 ) ) ( not ( = ?auto_668405 ?auto_668414 ) ) ( not ( = ?auto_668405 ?auto_668415 ) ) ( not ( = ?auto_668405 ?auto_668416 ) ) ( not ( = ?auto_668406 ?auto_668407 ) ) ( not ( = ?auto_668406 ?auto_668408 ) ) ( not ( = ?auto_668406 ?auto_668409 ) ) ( not ( = ?auto_668406 ?auto_668410 ) ) ( not ( = ?auto_668406 ?auto_668411 ) ) ( not ( = ?auto_668406 ?auto_668412 ) ) ( not ( = ?auto_668406 ?auto_668413 ) ) ( not ( = ?auto_668406 ?auto_668414 ) ) ( not ( = ?auto_668406 ?auto_668415 ) ) ( not ( = ?auto_668406 ?auto_668416 ) ) ( not ( = ?auto_668407 ?auto_668408 ) ) ( not ( = ?auto_668407 ?auto_668409 ) ) ( not ( = ?auto_668407 ?auto_668410 ) ) ( not ( = ?auto_668407 ?auto_668411 ) ) ( not ( = ?auto_668407 ?auto_668412 ) ) ( not ( = ?auto_668407 ?auto_668413 ) ) ( not ( = ?auto_668407 ?auto_668414 ) ) ( not ( = ?auto_668407 ?auto_668415 ) ) ( not ( = ?auto_668407 ?auto_668416 ) ) ( not ( = ?auto_668408 ?auto_668409 ) ) ( not ( = ?auto_668408 ?auto_668410 ) ) ( not ( = ?auto_668408 ?auto_668411 ) ) ( not ( = ?auto_668408 ?auto_668412 ) ) ( not ( = ?auto_668408 ?auto_668413 ) ) ( not ( = ?auto_668408 ?auto_668414 ) ) ( not ( = ?auto_668408 ?auto_668415 ) ) ( not ( = ?auto_668408 ?auto_668416 ) ) ( not ( = ?auto_668409 ?auto_668410 ) ) ( not ( = ?auto_668409 ?auto_668411 ) ) ( not ( = ?auto_668409 ?auto_668412 ) ) ( not ( = ?auto_668409 ?auto_668413 ) ) ( not ( = ?auto_668409 ?auto_668414 ) ) ( not ( = ?auto_668409 ?auto_668415 ) ) ( not ( = ?auto_668409 ?auto_668416 ) ) ( not ( = ?auto_668410 ?auto_668411 ) ) ( not ( = ?auto_668410 ?auto_668412 ) ) ( not ( = ?auto_668410 ?auto_668413 ) ) ( not ( = ?auto_668410 ?auto_668414 ) ) ( not ( = ?auto_668410 ?auto_668415 ) ) ( not ( = ?auto_668410 ?auto_668416 ) ) ( not ( = ?auto_668411 ?auto_668412 ) ) ( not ( = ?auto_668411 ?auto_668413 ) ) ( not ( = ?auto_668411 ?auto_668414 ) ) ( not ( = ?auto_668411 ?auto_668415 ) ) ( not ( = ?auto_668411 ?auto_668416 ) ) ( not ( = ?auto_668412 ?auto_668413 ) ) ( not ( = ?auto_668412 ?auto_668414 ) ) ( not ( = ?auto_668412 ?auto_668415 ) ) ( not ( = ?auto_668412 ?auto_668416 ) ) ( not ( = ?auto_668413 ?auto_668414 ) ) ( not ( = ?auto_668413 ?auto_668415 ) ) ( not ( = ?auto_668413 ?auto_668416 ) ) ( not ( = ?auto_668414 ?auto_668415 ) ) ( not ( = ?auto_668414 ?auto_668416 ) ) ( not ( = ?auto_668415 ?auto_668416 ) ) ( ON ?auto_668414 ?auto_668415 ) ( ON ?auto_668413 ?auto_668414 ) ( ON ?auto_668412 ?auto_668413 ) ( ON ?auto_668411 ?auto_668412 ) ( ON ?auto_668410 ?auto_668411 ) ( ON ?auto_668409 ?auto_668410 ) ( ON ?auto_668408 ?auto_668409 ) ( ON ?auto_668407 ?auto_668408 ) ( ON ?auto_668406 ?auto_668407 ) ( ON ?auto_668405 ?auto_668406 ) ( CLEAR ?auto_668403 ) ( ON ?auto_668404 ?auto_668405 ) ( CLEAR ?auto_668404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_668403 ?auto_668404 )
      ( MAKE-13PILE ?auto_668403 ?auto_668404 ?auto_668405 ?auto_668406 ?auto_668407 ?auto_668408 ?auto_668409 ?auto_668410 ?auto_668411 ?auto_668412 ?auto_668413 ?auto_668414 ?auto_668415 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_668457 - BLOCK
      ?auto_668458 - BLOCK
      ?auto_668459 - BLOCK
      ?auto_668460 - BLOCK
      ?auto_668461 - BLOCK
      ?auto_668462 - BLOCK
      ?auto_668463 - BLOCK
      ?auto_668464 - BLOCK
      ?auto_668465 - BLOCK
      ?auto_668466 - BLOCK
      ?auto_668467 - BLOCK
      ?auto_668468 - BLOCK
      ?auto_668469 - BLOCK
    )
    :vars
    (
      ?auto_668470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668469 ?auto_668470 ) ( not ( = ?auto_668457 ?auto_668458 ) ) ( not ( = ?auto_668457 ?auto_668459 ) ) ( not ( = ?auto_668457 ?auto_668460 ) ) ( not ( = ?auto_668457 ?auto_668461 ) ) ( not ( = ?auto_668457 ?auto_668462 ) ) ( not ( = ?auto_668457 ?auto_668463 ) ) ( not ( = ?auto_668457 ?auto_668464 ) ) ( not ( = ?auto_668457 ?auto_668465 ) ) ( not ( = ?auto_668457 ?auto_668466 ) ) ( not ( = ?auto_668457 ?auto_668467 ) ) ( not ( = ?auto_668457 ?auto_668468 ) ) ( not ( = ?auto_668457 ?auto_668469 ) ) ( not ( = ?auto_668457 ?auto_668470 ) ) ( not ( = ?auto_668458 ?auto_668459 ) ) ( not ( = ?auto_668458 ?auto_668460 ) ) ( not ( = ?auto_668458 ?auto_668461 ) ) ( not ( = ?auto_668458 ?auto_668462 ) ) ( not ( = ?auto_668458 ?auto_668463 ) ) ( not ( = ?auto_668458 ?auto_668464 ) ) ( not ( = ?auto_668458 ?auto_668465 ) ) ( not ( = ?auto_668458 ?auto_668466 ) ) ( not ( = ?auto_668458 ?auto_668467 ) ) ( not ( = ?auto_668458 ?auto_668468 ) ) ( not ( = ?auto_668458 ?auto_668469 ) ) ( not ( = ?auto_668458 ?auto_668470 ) ) ( not ( = ?auto_668459 ?auto_668460 ) ) ( not ( = ?auto_668459 ?auto_668461 ) ) ( not ( = ?auto_668459 ?auto_668462 ) ) ( not ( = ?auto_668459 ?auto_668463 ) ) ( not ( = ?auto_668459 ?auto_668464 ) ) ( not ( = ?auto_668459 ?auto_668465 ) ) ( not ( = ?auto_668459 ?auto_668466 ) ) ( not ( = ?auto_668459 ?auto_668467 ) ) ( not ( = ?auto_668459 ?auto_668468 ) ) ( not ( = ?auto_668459 ?auto_668469 ) ) ( not ( = ?auto_668459 ?auto_668470 ) ) ( not ( = ?auto_668460 ?auto_668461 ) ) ( not ( = ?auto_668460 ?auto_668462 ) ) ( not ( = ?auto_668460 ?auto_668463 ) ) ( not ( = ?auto_668460 ?auto_668464 ) ) ( not ( = ?auto_668460 ?auto_668465 ) ) ( not ( = ?auto_668460 ?auto_668466 ) ) ( not ( = ?auto_668460 ?auto_668467 ) ) ( not ( = ?auto_668460 ?auto_668468 ) ) ( not ( = ?auto_668460 ?auto_668469 ) ) ( not ( = ?auto_668460 ?auto_668470 ) ) ( not ( = ?auto_668461 ?auto_668462 ) ) ( not ( = ?auto_668461 ?auto_668463 ) ) ( not ( = ?auto_668461 ?auto_668464 ) ) ( not ( = ?auto_668461 ?auto_668465 ) ) ( not ( = ?auto_668461 ?auto_668466 ) ) ( not ( = ?auto_668461 ?auto_668467 ) ) ( not ( = ?auto_668461 ?auto_668468 ) ) ( not ( = ?auto_668461 ?auto_668469 ) ) ( not ( = ?auto_668461 ?auto_668470 ) ) ( not ( = ?auto_668462 ?auto_668463 ) ) ( not ( = ?auto_668462 ?auto_668464 ) ) ( not ( = ?auto_668462 ?auto_668465 ) ) ( not ( = ?auto_668462 ?auto_668466 ) ) ( not ( = ?auto_668462 ?auto_668467 ) ) ( not ( = ?auto_668462 ?auto_668468 ) ) ( not ( = ?auto_668462 ?auto_668469 ) ) ( not ( = ?auto_668462 ?auto_668470 ) ) ( not ( = ?auto_668463 ?auto_668464 ) ) ( not ( = ?auto_668463 ?auto_668465 ) ) ( not ( = ?auto_668463 ?auto_668466 ) ) ( not ( = ?auto_668463 ?auto_668467 ) ) ( not ( = ?auto_668463 ?auto_668468 ) ) ( not ( = ?auto_668463 ?auto_668469 ) ) ( not ( = ?auto_668463 ?auto_668470 ) ) ( not ( = ?auto_668464 ?auto_668465 ) ) ( not ( = ?auto_668464 ?auto_668466 ) ) ( not ( = ?auto_668464 ?auto_668467 ) ) ( not ( = ?auto_668464 ?auto_668468 ) ) ( not ( = ?auto_668464 ?auto_668469 ) ) ( not ( = ?auto_668464 ?auto_668470 ) ) ( not ( = ?auto_668465 ?auto_668466 ) ) ( not ( = ?auto_668465 ?auto_668467 ) ) ( not ( = ?auto_668465 ?auto_668468 ) ) ( not ( = ?auto_668465 ?auto_668469 ) ) ( not ( = ?auto_668465 ?auto_668470 ) ) ( not ( = ?auto_668466 ?auto_668467 ) ) ( not ( = ?auto_668466 ?auto_668468 ) ) ( not ( = ?auto_668466 ?auto_668469 ) ) ( not ( = ?auto_668466 ?auto_668470 ) ) ( not ( = ?auto_668467 ?auto_668468 ) ) ( not ( = ?auto_668467 ?auto_668469 ) ) ( not ( = ?auto_668467 ?auto_668470 ) ) ( not ( = ?auto_668468 ?auto_668469 ) ) ( not ( = ?auto_668468 ?auto_668470 ) ) ( not ( = ?auto_668469 ?auto_668470 ) ) ( ON ?auto_668468 ?auto_668469 ) ( ON ?auto_668467 ?auto_668468 ) ( ON ?auto_668466 ?auto_668467 ) ( ON ?auto_668465 ?auto_668466 ) ( ON ?auto_668464 ?auto_668465 ) ( ON ?auto_668463 ?auto_668464 ) ( ON ?auto_668462 ?auto_668463 ) ( ON ?auto_668461 ?auto_668462 ) ( ON ?auto_668460 ?auto_668461 ) ( ON ?auto_668459 ?auto_668460 ) ( ON ?auto_668458 ?auto_668459 ) ( ON ?auto_668457 ?auto_668458 ) ( CLEAR ?auto_668457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_668457 )
      ( MAKE-13PILE ?auto_668457 ?auto_668458 ?auto_668459 ?auto_668460 ?auto_668461 ?auto_668462 ?auto_668463 ?auto_668464 ?auto_668465 ?auto_668466 ?auto_668467 ?auto_668468 ?auto_668469 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668512 - BLOCK
      ?auto_668513 - BLOCK
      ?auto_668514 - BLOCK
      ?auto_668515 - BLOCK
      ?auto_668516 - BLOCK
      ?auto_668517 - BLOCK
      ?auto_668518 - BLOCK
      ?auto_668519 - BLOCK
      ?auto_668520 - BLOCK
      ?auto_668521 - BLOCK
      ?auto_668522 - BLOCK
      ?auto_668523 - BLOCK
      ?auto_668524 - BLOCK
      ?auto_668525 - BLOCK
    )
    :vars
    (
      ?auto_668526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_668524 ) ( ON ?auto_668525 ?auto_668526 ) ( CLEAR ?auto_668525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_668512 ) ( ON ?auto_668513 ?auto_668512 ) ( ON ?auto_668514 ?auto_668513 ) ( ON ?auto_668515 ?auto_668514 ) ( ON ?auto_668516 ?auto_668515 ) ( ON ?auto_668517 ?auto_668516 ) ( ON ?auto_668518 ?auto_668517 ) ( ON ?auto_668519 ?auto_668518 ) ( ON ?auto_668520 ?auto_668519 ) ( ON ?auto_668521 ?auto_668520 ) ( ON ?auto_668522 ?auto_668521 ) ( ON ?auto_668523 ?auto_668522 ) ( ON ?auto_668524 ?auto_668523 ) ( not ( = ?auto_668512 ?auto_668513 ) ) ( not ( = ?auto_668512 ?auto_668514 ) ) ( not ( = ?auto_668512 ?auto_668515 ) ) ( not ( = ?auto_668512 ?auto_668516 ) ) ( not ( = ?auto_668512 ?auto_668517 ) ) ( not ( = ?auto_668512 ?auto_668518 ) ) ( not ( = ?auto_668512 ?auto_668519 ) ) ( not ( = ?auto_668512 ?auto_668520 ) ) ( not ( = ?auto_668512 ?auto_668521 ) ) ( not ( = ?auto_668512 ?auto_668522 ) ) ( not ( = ?auto_668512 ?auto_668523 ) ) ( not ( = ?auto_668512 ?auto_668524 ) ) ( not ( = ?auto_668512 ?auto_668525 ) ) ( not ( = ?auto_668512 ?auto_668526 ) ) ( not ( = ?auto_668513 ?auto_668514 ) ) ( not ( = ?auto_668513 ?auto_668515 ) ) ( not ( = ?auto_668513 ?auto_668516 ) ) ( not ( = ?auto_668513 ?auto_668517 ) ) ( not ( = ?auto_668513 ?auto_668518 ) ) ( not ( = ?auto_668513 ?auto_668519 ) ) ( not ( = ?auto_668513 ?auto_668520 ) ) ( not ( = ?auto_668513 ?auto_668521 ) ) ( not ( = ?auto_668513 ?auto_668522 ) ) ( not ( = ?auto_668513 ?auto_668523 ) ) ( not ( = ?auto_668513 ?auto_668524 ) ) ( not ( = ?auto_668513 ?auto_668525 ) ) ( not ( = ?auto_668513 ?auto_668526 ) ) ( not ( = ?auto_668514 ?auto_668515 ) ) ( not ( = ?auto_668514 ?auto_668516 ) ) ( not ( = ?auto_668514 ?auto_668517 ) ) ( not ( = ?auto_668514 ?auto_668518 ) ) ( not ( = ?auto_668514 ?auto_668519 ) ) ( not ( = ?auto_668514 ?auto_668520 ) ) ( not ( = ?auto_668514 ?auto_668521 ) ) ( not ( = ?auto_668514 ?auto_668522 ) ) ( not ( = ?auto_668514 ?auto_668523 ) ) ( not ( = ?auto_668514 ?auto_668524 ) ) ( not ( = ?auto_668514 ?auto_668525 ) ) ( not ( = ?auto_668514 ?auto_668526 ) ) ( not ( = ?auto_668515 ?auto_668516 ) ) ( not ( = ?auto_668515 ?auto_668517 ) ) ( not ( = ?auto_668515 ?auto_668518 ) ) ( not ( = ?auto_668515 ?auto_668519 ) ) ( not ( = ?auto_668515 ?auto_668520 ) ) ( not ( = ?auto_668515 ?auto_668521 ) ) ( not ( = ?auto_668515 ?auto_668522 ) ) ( not ( = ?auto_668515 ?auto_668523 ) ) ( not ( = ?auto_668515 ?auto_668524 ) ) ( not ( = ?auto_668515 ?auto_668525 ) ) ( not ( = ?auto_668515 ?auto_668526 ) ) ( not ( = ?auto_668516 ?auto_668517 ) ) ( not ( = ?auto_668516 ?auto_668518 ) ) ( not ( = ?auto_668516 ?auto_668519 ) ) ( not ( = ?auto_668516 ?auto_668520 ) ) ( not ( = ?auto_668516 ?auto_668521 ) ) ( not ( = ?auto_668516 ?auto_668522 ) ) ( not ( = ?auto_668516 ?auto_668523 ) ) ( not ( = ?auto_668516 ?auto_668524 ) ) ( not ( = ?auto_668516 ?auto_668525 ) ) ( not ( = ?auto_668516 ?auto_668526 ) ) ( not ( = ?auto_668517 ?auto_668518 ) ) ( not ( = ?auto_668517 ?auto_668519 ) ) ( not ( = ?auto_668517 ?auto_668520 ) ) ( not ( = ?auto_668517 ?auto_668521 ) ) ( not ( = ?auto_668517 ?auto_668522 ) ) ( not ( = ?auto_668517 ?auto_668523 ) ) ( not ( = ?auto_668517 ?auto_668524 ) ) ( not ( = ?auto_668517 ?auto_668525 ) ) ( not ( = ?auto_668517 ?auto_668526 ) ) ( not ( = ?auto_668518 ?auto_668519 ) ) ( not ( = ?auto_668518 ?auto_668520 ) ) ( not ( = ?auto_668518 ?auto_668521 ) ) ( not ( = ?auto_668518 ?auto_668522 ) ) ( not ( = ?auto_668518 ?auto_668523 ) ) ( not ( = ?auto_668518 ?auto_668524 ) ) ( not ( = ?auto_668518 ?auto_668525 ) ) ( not ( = ?auto_668518 ?auto_668526 ) ) ( not ( = ?auto_668519 ?auto_668520 ) ) ( not ( = ?auto_668519 ?auto_668521 ) ) ( not ( = ?auto_668519 ?auto_668522 ) ) ( not ( = ?auto_668519 ?auto_668523 ) ) ( not ( = ?auto_668519 ?auto_668524 ) ) ( not ( = ?auto_668519 ?auto_668525 ) ) ( not ( = ?auto_668519 ?auto_668526 ) ) ( not ( = ?auto_668520 ?auto_668521 ) ) ( not ( = ?auto_668520 ?auto_668522 ) ) ( not ( = ?auto_668520 ?auto_668523 ) ) ( not ( = ?auto_668520 ?auto_668524 ) ) ( not ( = ?auto_668520 ?auto_668525 ) ) ( not ( = ?auto_668520 ?auto_668526 ) ) ( not ( = ?auto_668521 ?auto_668522 ) ) ( not ( = ?auto_668521 ?auto_668523 ) ) ( not ( = ?auto_668521 ?auto_668524 ) ) ( not ( = ?auto_668521 ?auto_668525 ) ) ( not ( = ?auto_668521 ?auto_668526 ) ) ( not ( = ?auto_668522 ?auto_668523 ) ) ( not ( = ?auto_668522 ?auto_668524 ) ) ( not ( = ?auto_668522 ?auto_668525 ) ) ( not ( = ?auto_668522 ?auto_668526 ) ) ( not ( = ?auto_668523 ?auto_668524 ) ) ( not ( = ?auto_668523 ?auto_668525 ) ) ( not ( = ?auto_668523 ?auto_668526 ) ) ( not ( = ?auto_668524 ?auto_668525 ) ) ( not ( = ?auto_668524 ?auto_668526 ) ) ( not ( = ?auto_668525 ?auto_668526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_668525 ?auto_668526 )
      ( !STACK ?auto_668525 ?auto_668524 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668570 - BLOCK
      ?auto_668571 - BLOCK
      ?auto_668572 - BLOCK
      ?auto_668573 - BLOCK
      ?auto_668574 - BLOCK
      ?auto_668575 - BLOCK
      ?auto_668576 - BLOCK
      ?auto_668577 - BLOCK
      ?auto_668578 - BLOCK
      ?auto_668579 - BLOCK
      ?auto_668580 - BLOCK
      ?auto_668581 - BLOCK
      ?auto_668582 - BLOCK
      ?auto_668583 - BLOCK
    )
    :vars
    (
      ?auto_668584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668583 ?auto_668584 ) ( ON-TABLE ?auto_668570 ) ( ON ?auto_668571 ?auto_668570 ) ( ON ?auto_668572 ?auto_668571 ) ( ON ?auto_668573 ?auto_668572 ) ( ON ?auto_668574 ?auto_668573 ) ( ON ?auto_668575 ?auto_668574 ) ( ON ?auto_668576 ?auto_668575 ) ( ON ?auto_668577 ?auto_668576 ) ( ON ?auto_668578 ?auto_668577 ) ( ON ?auto_668579 ?auto_668578 ) ( ON ?auto_668580 ?auto_668579 ) ( ON ?auto_668581 ?auto_668580 ) ( not ( = ?auto_668570 ?auto_668571 ) ) ( not ( = ?auto_668570 ?auto_668572 ) ) ( not ( = ?auto_668570 ?auto_668573 ) ) ( not ( = ?auto_668570 ?auto_668574 ) ) ( not ( = ?auto_668570 ?auto_668575 ) ) ( not ( = ?auto_668570 ?auto_668576 ) ) ( not ( = ?auto_668570 ?auto_668577 ) ) ( not ( = ?auto_668570 ?auto_668578 ) ) ( not ( = ?auto_668570 ?auto_668579 ) ) ( not ( = ?auto_668570 ?auto_668580 ) ) ( not ( = ?auto_668570 ?auto_668581 ) ) ( not ( = ?auto_668570 ?auto_668582 ) ) ( not ( = ?auto_668570 ?auto_668583 ) ) ( not ( = ?auto_668570 ?auto_668584 ) ) ( not ( = ?auto_668571 ?auto_668572 ) ) ( not ( = ?auto_668571 ?auto_668573 ) ) ( not ( = ?auto_668571 ?auto_668574 ) ) ( not ( = ?auto_668571 ?auto_668575 ) ) ( not ( = ?auto_668571 ?auto_668576 ) ) ( not ( = ?auto_668571 ?auto_668577 ) ) ( not ( = ?auto_668571 ?auto_668578 ) ) ( not ( = ?auto_668571 ?auto_668579 ) ) ( not ( = ?auto_668571 ?auto_668580 ) ) ( not ( = ?auto_668571 ?auto_668581 ) ) ( not ( = ?auto_668571 ?auto_668582 ) ) ( not ( = ?auto_668571 ?auto_668583 ) ) ( not ( = ?auto_668571 ?auto_668584 ) ) ( not ( = ?auto_668572 ?auto_668573 ) ) ( not ( = ?auto_668572 ?auto_668574 ) ) ( not ( = ?auto_668572 ?auto_668575 ) ) ( not ( = ?auto_668572 ?auto_668576 ) ) ( not ( = ?auto_668572 ?auto_668577 ) ) ( not ( = ?auto_668572 ?auto_668578 ) ) ( not ( = ?auto_668572 ?auto_668579 ) ) ( not ( = ?auto_668572 ?auto_668580 ) ) ( not ( = ?auto_668572 ?auto_668581 ) ) ( not ( = ?auto_668572 ?auto_668582 ) ) ( not ( = ?auto_668572 ?auto_668583 ) ) ( not ( = ?auto_668572 ?auto_668584 ) ) ( not ( = ?auto_668573 ?auto_668574 ) ) ( not ( = ?auto_668573 ?auto_668575 ) ) ( not ( = ?auto_668573 ?auto_668576 ) ) ( not ( = ?auto_668573 ?auto_668577 ) ) ( not ( = ?auto_668573 ?auto_668578 ) ) ( not ( = ?auto_668573 ?auto_668579 ) ) ( not ( = ?auto_668573 ?auto_668580 ) ) ( not ( = ?auto_668573 ?auto_668581 ) ) ( not ( = ?auto_668573 ?auto_668582 ) ) ( not ( = ?auto_668573 ?auto_668583 ) ) ( not ( = ?auto_668573 ?auto_668584 ) ) ( not ( = ?auto_668574 ?auto_668575 ) ) ( not ( = ?auto_668574 ?auto_668576 ) ) ( not ( = ?auto_668574 ?auto_668577 ) ) ( not ( = ?auto_668574 ?auto_668578 ) ) ( not ( = ?auto_668574 ?auto_668579 ) ) ( not ( = ?auto_668574 ?auto_668580 ) ) ( not ( = ?auto_668574 ?auto_668581 ) ) ( not ( = ?auto_668574 ?auto_668582 ) ) ( not ( = ?auto_668574 ?auto_668583 ) ) ( not ( = ?auto_668574 ?auto_668584 ) ) ( not ( = ?auto_668575 ?auto_668576 ) ) ( not ( = ?auto_668575 ?auto_668577 ) ) ( not ( = ?auto_668575 ?auto_668578 ) ) ( not ( = ?auto_668575 ?auto_668579 ) ) ( not ( = ?auto_668575 ?auto_668580 ) ) ( not ( = ?auto_668575 ?auto_668581 ) ) ( not ( = ?auto_668575 ?auto_668582 ) ) ( not ( = ?auto_668575 ?auto_668583 ) ) ( not ( = ?auto_668575 ?auto_668584 ) ) ( not ( = ?auto_668576 ?auto_668577 ) ) ( not ( = ?auto_668576 ?auto_668578 ) ) ( not ( = ?auto_668576 ?auto_668579 ) ) ( not ( = ?auto_668576 ?auto_668580 ) ) ( not ( = ?auto_668576 ?auto_668581 ) ) ( not ( = ?auto_668576 ?auto_668582 ) ) ( not ( = ?auto_668576 ?auto_668583 ) ) ( not ( = ?auto_668576 ?auto_668584 ) ) ( not ( = ?auto_668577 ?auto_668578 ) ) ( not ( = ?auto_668577 ?auto_668579 ) ) ( not ( = ?auto_668577 ?auto_668580 ) ) ( not ( = ?auto_668577 ?auto_668581 ) ) ( not ( = ?auto_668577 ?auto_668582 ) ) ( not ( = ?auto_668577 ?auto_668583 ) ) ( not ( = ?auto_668577 ?auto_668584 ) ) ( not ( = ?auto_668578 ?auto_668579 ) ) ( not ( = ?auto_668578 ?auto_668580 ) ) ( not ( = ?auto_668578 ?auto_668581 ) ) ( not ( = ?auto_668578 ?auto_668582 ) ) ( not ( = ?auto_668578 ?auto_668583 ) ) ( not ( = ?auto_668578 ?auto_668584 ) ) ( not ( = ?auto_668579 ?auto_668580 ) ) ( not ( = ?auto_668579 ?auto_668581 ) ) ( not ( = ?auto_668579 ?auto_668582 ) ) ( not ( = ?auto_668579 ?auto_668583 ) ) ( not ( = ?auto_668579 ?auto_668584 ) ) ( not ( = ?auto_668580 ?auto_668581 ) ) ( not ( = ?auto_668580 ?auto_668582 ) ) ( not ( = ?auto_668580 ?auto_668583 ) ) ( not ( = ?auto_668580 ?auto_668584 ) ) ( not ( = ?auto_668581 ?auto_668582 ) ) ( not ( = ?auto_668581 ?auto_668583 ) ) ( not ( = ?auto_668581 ?auto_668584 ) ) ( not ( = ?auto_668582 ?auto_668583 ) ) ( not ( = ?auto_668582 ?auto_668584 ) ) ( not ( = ?auto_668583 ?auto_668584 ) ) ( CLEAR ?auto_668581 ) ( ON ?auto_668582 ?auto_668583 ) ( CLEAR ?auto_668582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_668570 ?auto_668571 ?auto_668572 ?auto_668573 ?auto_668574 ?auto_668575 ?auto_668576 ?auto_668577 ?auto_668578 ?auto_668579 ?auto_668580 ?auto_668581 ?auto_668582 )
      ( MAKE-14PILE ?auto_668570 ?auto_668571 ?auto_668572 ?auto_668573 ?auto_668574 ?auto_668575 ?auto_668576 ?auto_668577 ?auto_668578 ?auto_668579 ?auto_668580 ?auto_668581 ?auto_668582 ?auto_668583 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668628 - BLOCK
      ?auto_668629 - BLOCK
      ?auto_668630 - BLOCK
      ?auto_668631 - BLOCK
      ?auto_668632 - BLOCK
      ?auto_668633 - BLOCK
      ?auto_668634 - BLOCK
      ?auto_668635 - BLOCK
      ?auto_668636 - BLOCK
      ?auto_668637 - BLOCK
      ?auto_668638 - BLOCK
      ?auto_668639 - BLOCK
      ?auto_668640 - BLOCK
      ?auto_668641 - BLOCK
    )
    :vars
    (
      ?auto_668642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668641 ?auto_668642 ) ( ON-TABLE ?auto_668628 ) ( ON ?auto_668629 ?auto_668628 ) ( ON ?auto_668630 ?auto_668629 ) ( ON ?auto_668631 ?auto_668630 ) ( ON ?auto_668632 ?auto_668631 ) ( ON ?auto_668633 ?auto_668632 ) ( ON ?auto_668634 ?auto_668633 ) ( ON ?auto_668635 ?auto_668634 ) ( ON ?auto_668636 ?auto_668635 ) ( ON ?auto_668637 ?auto_668636 ) ( ON ?auto_668638 ?auto_668637 ) ( not ( = ?auto_668628 ?auto_668629 ) ) ( not ( = ?auto_668628 ?auto_668630 ) ) ( not ( = ?auto_668628 ?auto_668631 ) ) ( not ( = ?auto_668628 ?auto_668632 ) ) ( not ( = ?auto_668628 ?auto_668633 ) ) ( not ( = ?auto_668628 ?auto_668634 ) ) ( not ( = ?auto_668628 ?auto_668635 ) ) ( not ( = ?auto_668628 ?auto_668636 ) ) ( not ( = ?auto_668628 ?auto_668637 ) ) ( not ( = ?auto_668628 ?auto_668638 ) ) ( not ( = ?auto_668628 ?auto_668639 ) ) ( not ( = ?auto_668628 ?auto_668640 ) ) ( not ( = ?auto_668628 ?auto_668641 ) ) ( not ( = ?auto_668628 ?auto_668642 ) ) ( not ( = ?auto_668629 ?auto_668630 ) ) ( not ( = ?auto_668629 ?auto_668631 ) ) ( not ( = ?auto_668629 ?auto_668632 ) ) ( not ( = ?auto_668629 ?auto_668633 ) ) ( not ( = ?auto_668629 ?auto_668634 ) ) ( not ( = ?auto_668629 ?auto_668635 ) ) ( not ( = ?auto_668629 ?auto_668636 ) ) ( not ( = ?auto_668629 ?auto_668637 ) ) ( not ( = ?auto_668629 ?auto_668638 ) ) ( not ( = ?auto_668629 ?auto_668639 ) ) ( not ( = ?auto_668629 ?auto_668640 ) ) ( not ( = ?auto_668629 ?auto_668641 ) ) ( not ( = ?auto_668629 ?auto_668642 ) ) ( not ( = ?auto_668630 ?auto_668631 ) ) ( not ( = ?auto_668630 ?auto_668632 ) ) ( not ( = ?auto_668630 ?auto_668633 ) ) ( not ( = ?auto_668630 ?auto_668634 ) ) ( not ( = ?auto_668630 ?auto_668635 ) ) ( not ( = ?auto_668630 ?auto_668636 ) ) ( not ( = ?auto_668630 ?auto_668637 ) ) ( not ( = ?auto_668630 ?auto_668638 ) ) ( not ( = ?auto_668630 ?auto_668639 ) ) ( not ( = ?auto_668630 ?auto_668640 ) ) ( not ( = ?auto_668630 ?auto_668641 ) ) ( not ( = ?auto_668630 ?auto_668642 ) ) ( not ( = ?auto_668631 ?auto_668632 ) ) ( not ( = ?auto_668631 ?auto_668633 ) ) ( not ( = ?auto_668631 ?auto_668634 ) ) ( not ( = ?auto_668631 ?auto_668635 ) ) ( not ( = ?auto_668631 ?auto_668636 ) ) ( not ( = ?auto_668631 ?auto_668637 ) ) ( not ( = ?auto_668631 ?auto_668638 ) ) ( not ( = ?auto_668631 ?auto_668639 ) ) ( not ( = ?auto_668631 ?auto_668640 ) ) ( not ( = ?auto_668631 ?auto_668641 ) ) ( not ( = ?auto_668631 ?auto_668642 ) ) ( not ( = ?auto_668632 ?auto_668633 ) ) ( not ( = ?auto_668632 ?auto_668634 ) ) ( not ( = ?auto_668632 ?auto_668635 ) ) ( not ( = ?auto_668632 ?auto_668636 ) ) ( not ( = ?auto_668632 ?auto_668637 ) ) ( not ( = ?auto_668632 ?auto_668638 ) ) ( not ( = ?auto_668632 ?auto_668639 ) ) ( not ( = ?auto_668632 ?auto_668640 ) ) ( not ( = ?auto_668632 ?auto_668641 ) ) ( not ( = ?auto_668632 ?auto_668642 ) ) ( not ( = ?auto_668633 ?auto_668634 ) ) ( not ( = ?auto_668633 ?auto_668635 ) ) ( not ( = ?auto_668633 ?auto_668636 ) ) ( not ( = ?auto_668633 ?auto_668637 ) ) ( not ( = ?auto_668633 ?auto_668638 ) ) ( not ( = ?auto_668633 ?auto_668639 ) ) ( not ( = ?auto_668633 ?auto_668640 ) ) ( not ( = ?auto_668633 ?auto_668641 ) ) ( not ( = ?auto_668633 ?auto_668642 ) ) ( not ( = ?auto_668634 ?auto_668635 ) ) ( not ( = ?auto_668634 ?auto_668636 ) ) ( not ( = ?auto_668634 ?auto_668637 ) ) ( not ( = ?auto_668634 ?auto_668638 ) ) ( not ( = ?auto_668634 ?auto_668639 ) ) ( not ( = ?auto_668634 ?auto_668640 ) ) ( not ( = ?auto_668634 ?auto_668641 ) ) ( not ( = ?auto_668634 ?auto_668642 ) ) ( not ( = ?auto_668635 ?auto_668636 ) ) ( not ( = ?auto_668635 ?auto_668637 ) ) ( not ( = ?auto_668635 ?auto_668638 ) ) ( not ( = ?auto_668635 ?auto_668639 ) ) ( not ( = ?auto_668635 ?auto_668640 ) ) ( not ( = ?auto_668635 ?auto_668641 ) ) ( not ( = ?auto_668635 ?auto_668642 ) ) ( not ( = ?auto_668636 ?auto_668637 ) ) ( not ( = ?auto_668636 ?auto_668638 ) ) ( not ( = ?auto_668636 ?auto_668639 ) ) ( not ( = ?auto_668636 ?auto_668640 ) ) ( not ( = ?auto_668636 ?auto_668641 ) ) ( not ( = ?auto_668636 ?auto_668642 ) ) ( not ( = ?auto_668637 ?auto_668638 ) ) ( not ( = ?auto_668637 ?auto_668639 ) ) ( not ( = ?auto_668637 ?auto_668640 ) ) ( not ( = ?auto_668637 ?auto_668641 ) ) ( not ( = ?auto_668637 ?auto_668642 ) ) ( not ( = ?auto_668638 ?auto_668639 ) ) ( not ( = ?auto_668638 ?auto_668640 ) ) ( not ( = ?auto_668638 ?auto_668641 ) ) ( not ( = ?auto_668638 ?auto_668642 ) ) ( not ( = ?auto_668639 ?auto_668640 ) ) ( not ( = ?auto_668639 ?auto_668641 ) ) ( not ( = ?auto_668639 ?auto_668642 ) ) ( not ( = ?auto_668640 ?auto_668641 ) ) ( not ( = ?auto_668640 ?auto_668642 ) ) ( not ( = ?auto_668641 ?auto_668642 ) ) ( ON ?auto_668640 ?auto_668641 ) ( CLEAR ?auto_668638 ) ( ON ?auto_668639 ?auto_668640 ) ( CLEAR ?auto_668639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_668628 ?auto_668629 ?auto_668630 ?auto_668631 ?auto_668632 ?auto_668633 ?auto_668634 ?auto_668635 ?auto_668636 ?auto_668637 ?auto_668638 ?auto_668639 )
      ( MAKE-14PILE ?auto_668628 ?auto_668629 ?auto_668630 ?auto_668631 ?auto_668632 ?auto_668633 ?auto_668634 ?auto_668635 ?auto_668636 ?auto_668637 ?auto_668638 ?auto_668639 ?auto_668640 ?auto_668641 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668686 - BLOCK
      ?auto_668687 - BLOCK
      ?auto_668688 - BLOCK
      ?auto_668689 - BLOCK
      ?auto_668690 - BLOCK
      ?auto_668691 - BLOCK
      ?auto_668692 - BLOCK
      ?auto_668693 - BLOCK
      ?auto_668694 - BLOCK
      ?auto_668695 - BLOCK
      ?auto_668696 - BLOCK
      ?auto_668697 - BLOCK
      ?auto_668698 - BLOCK
      ?auto_668699 - BLOCK
    )
    :vars
    (
      ?auto_668700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668699 ?auto_668700 ) ( ON-TABLE ?auto_668686 ) ( ON ?auto_668687 ?auto_668686 ) ( ON ?auto_668688 ?auto_668687 ) ( ON ?auto_668689 ?auto_668688 ) ( ON ?auto_668690 ?auto_668689 ) ( ON ?auto_668691 ?auto_668690 ) ( ON ?auto_668692 ?auto_668691 ) ( ON ?auto_668693 ?auto_668692 ) ( ON ?auto_668694 ?auto_668693 ) ( ON ?auto_668695 ?auto_668694 ) ( not ( = ?auto_668686 ?auto_668687 ) ) ( not ( = ?auto_668686 ?auto_668688 ) ) ( not ( = ?auto_668686 ?auto_668689 ) ) ( not ( = ?auto_668686 ?auto_668690 ) ) ( not ( = ?auto_668686 ?auto_668691 ) ) ( not ( = ?auto_668686 ?auto_668692 ) ) ( not ( = ?auto_668686 ?auto_668693 ) ) ( not ( = ?auto_668686 ?auto_668694 ) ) ( not ( = ?auto_668686 ?auto_668695 ) ) ( not ( = ?auto_668686 ?auto_668696 ) ) ( not ( = ?auto_668686 ?auto_668697 ) ) ( not ( = ?auto_668686 ?auto_668698 ) ) ( not ( = ?auto_668686 ?auto_668699 ) ) ( not ( = ?auto_668686 ?auto_668700 ) ) ( not ( = ?auto_668687 ?auto_668688 ) ) ( not ( = ?auto_668687 ?auto_668689 ) ) ( not ( = ?auto_668687 ?auto_668690 ) ) ( not ( = ?auto_668687 ?auto_668691 ) ) ( not ( = ?auto_668687 ?auto_668692 ) ) ( not ( = ?auto_668687 ?auto_668693 ) ) ( not ( = ?auto_668687 ?auto_668694 ) ) ( not ( = ?auto_668687 ?auto_668695 ) ) ( not ( = ?auto_668687 ?auto_668696 ) ) ( not ( = ?auto_668687 ?auto_668697 ) ) ( not ( = ?auto_668687 ?auto_668698 ) ) ( not ( = ?auto_668687 ?auto_668699 ) ) ( not ( = ?auto_668687 ?auto_668700 ) ) ( not ( = ?auto_668688 ?auto_668689 ) ) ( not ( = ?auto_668688 ?auto_668690 ) ) ( not ( = ?auto_668688 ?auto_668691 ) ) ( not ( = ?auto_668688 ?auto_668692 ) ) ( not ( = ?auto_668688 ?auto_668693 ) ) ( not ( = ?auto_668688 ?auto_668694 ) ) ( not ( = ?auto_668688 ?auto_668695 ) ) ( not ( = ?auto_668688 ?auto_668696 ) ) ( not ( = ?auto_668688 ?auto_668697 ) ) ( not ( = ?auto_668688 ?auto_668698 ) ) ( not ( = ?auto_668688 ?auto_668699 ) ) ( not ( = ?auto_668688 ?auto_668700 ) ) ( not ( = ?auto_668689 ?auto_668690 ) ) ( not ( = ?auto_668689 ?auto_668691 ) ) ( not ( = ?auto_668689 ?auto_668692 ) ) ( not ( = ?auto_668689 ?auto_668693 ) ) ( not ( = ?auto_668689 ?auto_668694 ) ) ( not ( = ?auto_668689 ?auto_668695 ) ) ( not ( = ?auto_668689 ?auto_668696 ) ) ( not ( = ?auto_668689 ?auto_668697 ) ) ( not ( = ?auto_668689 ?auto_668698 ) ) ( not ( = ?auto_668689 ?auto_668699 ) ) ( not ( = ?auto_668689 ?auto_668700 ) ) ( not ( = ?auto_668690 ?auto_668691 ) ) ( not ( = ?auto_668690 ?auto_668692 ) ) ( not ( = ?auto_668690 ?auto_668693 ) ) ( not ( = ?auto_668690 ?auto_668694 ) ) ( not ( = ?auto_668690 ?auto_668695 ) ) ( not ( = ?auto_668690 ?auto_668696 ) ) ( not ( = ?auto_668690 ?auto_668697 ) ) ( not ( = ?auto_668690 ?auto_668698 ) ) ( not ( = ?auto_668690 ?auto_668699 ) ) ( not ( = ?auto_668690 ?auto_668700 ) ) ( not ( = ?auto_668691 ?auto_668692 ) ) ( not ( = ?auto_668691 ?auto_668693 ) ) ( not ( = ?auto_668691 ?auto_668694 ) ) ( not ( = ?auto_668691 ?auto_668695 ) ) ( not ( = ?auto_668691 ?auto_668696 ) ) ( not ( = ?auto_668691 ?auto_668697 ) ) ( not ( = ?auto_668691 ?auto_668698 ) ) ( not ( = ?auto_668691 ?auto_668699 ) ) ( not ( = ?auto_668691 ?auto_668700 ) ) ( not ( = ?auto_668692 ?auto_668693 ) ) ( not ( = ?auto_668692 ?auto_668694 ) ) ( not ( = ?auto_668692 ?auto_668695 ) ) ( not ( = ?auto_668692 ?auto_668696 ) ) ( not ( = ?auto_668692 ?auto_668697 ) ) ( not ( = ?auto_668692 ?auto_668698 ) ) ( not ( = ?auto_668692 ?auto_668699 ) ) ( not ( = ?auto_668692 ?auto_668700 ) ) ( not ( = ?auto_668693 ?auto_668694 ) ) ( not ( = ?auto_668693 ?auto_668695 ) ) ( not ( = ?auto_668693 ?auto_668696 ) ) ( not ( = ?auto_668693 ?auto_668697 ) ) ( not ( = ?auto_668693 ?auto_668698 ) ) ( not ( = ?auto_668693 ?auto_668699 ) ) ( not ( = ?auto_668693 ?auto_668700 ) ) ( not ( = ?auto_668694 ?auto_668695 ) ) ( not ( = ?auto_668694 ?auto_668696 ) ) ( not ( = ?auto_668694 ?auto_668697 ) ) ( not ( = ?auto_668694 ?auto_668698 ) ) ( not ( = ?auto_668694 ?auto_668699 ) ) ( not ( = ?auto_668694 ?auto_668700 ) ) ( not ( = ?auto_668695 ?auto_668696 ) ) ( not ( = ?auto_668695 ?auto_668697 ) ) ( not ( = ?auto_668695 ?auto_668698 ) ) ( not ( = ?auto_668695 ?auto_668699 ) ) ( not ( = ?auto_668695 ?auto_668700 ) ) ( not ( = ?auto_668696 ?auto_668697 ) ) ( not ( = ?auto_668696 ?auto_668698 ) ) ( not ( = ?auto_668696 ?auto_668699 ) ) ( not ( = ?auto_668696 ?auto_668700 ) ) ( not ( = ?auto_668697 ?auto_668698 ) ) ( not ( = ?auto_668697 ?auto_668699 ) ) ( not ( = ?auto_668697 ?auto_668700 ) ) ( not ( = ?auto_668698 ?auto_668699 ) ) ( not ( = ?auto_668698 ?auto_668700 ) ) ( not ( = ?auto_668699 ?auto_668700 ) ) ( ON ?auto_668698 ?auto_668699 ) ( ON ?auto_668697 ?auto_668698 ) ( CLEAR ?auto_668695 ) ( ON ?auto_668696 ?auto_668697 ) ( CLEAR ?auto_668696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_668686 ?auto_668687 ?auto_668688 ?auto_668689 ?auto_668690 ?auto_668691 ?auto_668692 ?auto_668693 ?auto_668694 ?auto_668695 ?auto_668696 )
      ( MAKE-14PILE ?auto_668686 ?auto_668687 ?auto_668688 ?auto_668689 ?auto_668690 ?auto_668691 ?auto_668692 ?auto_668693 ?auto_668694 ?auto_668695 ?auto_668696 ?auto_668697 ?auto_668698 ?auto_668699 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668744 - BLOCK
      ?auto_668745 - BLOCK
      ?auto_668746 - BLOCK
      ?auto_668747 - BLOCK
      ?auto_668748 - BLOCK
      ?auto_668749 - BLOCK
      ?auto_668750 - BLOCK
      ?auto_668751 - BLOCK
      ?auto_668752 - BLOCK
      ?auto_668753 - BLOCK
      ?auto_668754 - BLOCK
      ?auto_668755 - BLOCK
      ?auto_668756 - BLOCK
      ?auto_668757 - BLOCK
    )
    :vars
    (
      ?auto_668758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668757 ?auto_668758 ) ( ON-TABLE ?auto_668744 ) ( ON ?auto_668745 ?auto_668744 ) ( ON ?auto_668746 ?auto_668745 ) ( ON ?auto_668747 ?auto_668746 ) ( ON ?auto_668748 ?auto_668747 ) ( ON ?auto_668749 ?auto_668748 ) ( ON ?auto_668750 ?auto_668749 ) ( ON ?auto_668751 ?auto_668750 ) ( ON ?auto_668752 ?auto_668751 ) ( not ( = ?auto_668744 ?auto_668745 ) ) ( not ( = ?auto_668744 ?auto_668746 ) ) ( not ( = ?auto_668744 ?auto_668747 ) ) ( not ( = ?auto_668744 ?auto_668748 ) ) ( not ( = ?auto_668744 ?auto_668749 ) ) ( not ( = ?auto_668744 ?auto_668750 ) ) ( not ( = ?auto_668744 ?auto_668751 ) ) ( not ( = ?auto_668744 ?auto_668752 ) ) ( not ( = ?auto_668744 ?auto_668753 ) ) ( not ( = ?auto_668744 ?auto_668754 ) ) ( not ( = ?auto_668744 ?auto_668755 ) ) ( not ( = ?auto_668744 ?auto_668756 ) ) ( not ( = ?auto_668744 ?auto_668757 ) ) ( not ( = ?auto_668744 ?auto_668758 ) ) ( not ( = ?auto_668745 ?auto_668746 ) ) ( not ( = ?auto_668745 ?auto_668747 ) ) ( not ( = ?auto_668745 ?auto_668748 ) ) ( not ( = ?auto_668745 ?auto_668749 ) ) ( not ( = ?auto_668745 ?auto_668750 ) ) ( not ( = ?auto_668745 ?auto_668751 ) ) ( not ( = ?auto_668745 ?auto_668752 ) ) ( not ( = ?auto_668745 ?auto_668753 ) ) ( not ( = ?auto_668745 ?auto_668754 ) ) ( not ( = ?auto_668745 ?auto_668755 ) ) ( not ( = ?auto_668745 ?auto_668756 ) ) ( not ( = ?auto_668745 ?auto_668757 ) ) ( not ( = ?auto_668745 ?auto_668758 ) ) ( not ( = ?auto_668746 ?auto_668747 ) ) ( not ( = ?auto_668746 ?auto_668748 ) ) ( not ( = ?auto_668746 ?auto_668749 ) ) ( not ( = ?auto_668746 ?auto_668750 ) ) ( not ( = ?auto_668746 ?auto_668751 ) ) ( not ( = ?auto_668746 ?auto_668752 ) ) ( not ( = ?auto_668746 ?auto_668753 ) ) ( not ( = ?auto_668746 ?auto_668754 ) ) ( not ( = ?auto_668746 ?auto_668755 ) ) ( not ( = ?auto_668746 ?auto_668756 ) ) ( not ( = ?auto_668746 ?auto_668757 ) ) ( not ( = ?auto_668746 ?auto_668758 ) ) ( not ( = ?auto_668747 ?auto_668748 ) ) ( not ( = ?auto_668747 ?auto_668749 ) ) ( not ( = ?auto_668747 ?auto_668750 ) ) ( not ( = ?auto_668747 ?auto_668751 ) ) ( not ( = ?auto_668747 ?auto_668752 ) ) ( not ( = ?auto_668747 ?auto_668753 ) ) ( not ( = ?auto_668747 ?auto_668754 ) ) ( not ( = ?auto_668747 ?auto_668755 ) ) ( not ( = ?auto_668747 ?auto_668756 ) ) ( not ( = ?auto_668747 ?auto_668757 ) ) ( not ( = ?auto_668747 ?auto_668758 ) ) ( not ( = ?auto_668748 ?auto_668749 ) ) ( not ( = ?auto_668748 ?auto_668750 ) ) ( not ( = ?auto_668748 ?auto_668751 ) ) ( not ( = ?auto_668748 ?auto_668752 ) ) ( not ( = ?auto_668748 ?auto_668753 ) ) ( not ( = ?auto_668748 ?auto_668754 ) ) ( not ( = ?auto_668748 ?auto_668755 ) ) ( not ( = ?auto_668748 ?auto_668756 ) ) ( not ( = ?auto_668748 ?auto_668757 ) ) ( not ( = ?auto_668748 ?auto_668758 ) ) ( not ( = ?auto_668749 ?auto_668750 ) ) ( not ( = ?auto_668749 ?auto_668751 ) ) ( not ( = ?auto_668749 ?auto_668752 ) ) ( not ( = ?auto_668749 ?auto_668753 ) ) ( not ( = ?auto_668749 ?auto_668754 ) ) ( not ( = ?auto_668749 ?auto_668755 ) ) ( not ( = ?auto_668749 ?auto_668756 ) ) ( not ( = ?auto_668749 ?auto_668757 ) ) ( not ( = ?auto_668749 ?auto_668758 ) ) ( not ( = ?auto_668750 ?auto_668751 ) ) ( not ( = ?auto_668750 ?auto_668752 ) ) ( not ( = ?auto_668750 ?auto_668753 ) ) ( not ( = ?auto_668750 ?auto_668754 ) ) ( not ( = ?auto_668750 ?auto_668755 ) ) ( not ( = ?auto_668750 ?auto_668756 ) ) ( not ( = ?auto_668750 ?auto_668757 ) ) ( not ( = ?auto_668750 ?auto_668758 ) ) ( not ( = ?auto_668751 ?auto_668752 ) ) ( not ( = ?auto_668751 ?auto_668753 ) ) ( not ( = ?auto_668751 ?auto_668754 ) ) ( not ( = ?auto_668751 ?auto_668755 ) ) ( not ( = ?auto_668751 ?auto_668756 ) ) ( not ( = ?auto_668751 ?auto_668757 ) ) ( not ( = ?auto_668751 ?auto_668758 ) ) ( not ( = ?auto_668752 ?auto_668753 ) ) ( not ( = ?auto_668752 ?auto_668754 ) ) ( not ( = ?auto_668752 ?auto_668755 ) ) ( not ( = ?auto_668752 ?auto_668756 ) ) ( not ( = ?auto_668752 ?auto_668757 ) ) ( not ( = ?auto_668752 ?auto_668758 ) ) ( not ( = ?auto_668753 ?auto_668754 ) ) ( not ( = ?auto_668753 ?auto_668755 ) ) ( not ( = ?auto_668753 ?auto_668756 ) ) ( not ( = ?auto_668753 ?auto_668757 ) ) ( not ( = ?auto_668753 ?auto_668758 ) ) ( not ( = ?auto_668754 ?auto_668755 ) ) ( not ( = ?auto_668754 ?auto_668756 ) ) ( not ( = ?auto_668754 ?auto_668757 ) ) ( not ( = ?auto_668754 ?auto_668758 ) ) ( not ( = ?auto_668755 ?auto_668756 ) ) ( not ( = ?auto_668755 ?auto_668757 ) ) ( not ( = ?auto_668755 ?auto_668758 ) ) ( not ( = ?auto_668756 ?auto_668757 ) ) ( not ( = ?auto_668756 ?auto_668758 ) ) ( not ( = ?auto_668757 ?auto_668758 ) ) ( ON ?auto_668756 ?auto_668757 ) ( ON ?auto_668755 ?auto_668756 ) ( ON ?auto_668754 ?auto_668755 ) ( CLEAR ?auto_668752 ) ( ON ?auto_668753 ?auto_668754 ) ( CLEAR ?auto_668753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_668744 ?auto_668745 ?auto_668746 ?auto_668747 ?auto_668748 ?auto_668749 ?auto_668750 ?auto_668751 ?auto_668752 ?auto_668753 )
      ( MAKE-14PILE ?auto_668744 ?auto_668745 ?auto_668746 ?auto_668747 ?auto_668748 ?auto_668749 ?auto_668750 ?auto_668751 ?auto_668752 ?auto_668753 ?auto_668754 ?auto_668755 ?auto_668756 ?auto_668757 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668802 - BLOCK
      ?auto_668803 - BLOCK
      ?auto_668804 - BLOCK
      ?auto_668805 - BLOCK
      ?auto_668806 - BLOCK
      ?auto_668807 - BLOCK
      ?auto_668808 - BLOCK
      ?auto_668809 - BLOCK
      ?auto_668810 - BLOCK
      ?auto_668811 - BLOCK
      ?auto_668812 - BLOCK
      ?auto_668813 - BLOCK
      ?auto_668814 - BLOCK
      ?auto_668815 - BLOCK
    )
    :vars
    (
      ?auto_668816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668815 ?auto_668816 ) ( ON-TABLE ?auto_668802 ) ( ON ?auto_668803 ?auto_668802 ) ( ON ?auto_668804 ?auto_668803 ) ( ON ?auto_668805 ?auto_668804 ) ( ON ?auto_668806 ?auto_668805 ) ( ON ?auto_668807 ?auto_668806 ) ( ON ?auto_668808 ?auto_668807 ) ( ON ?auto_668809 ?auto_668808 ) ( not ( = ?auto_668802 ?auto_668803 ) ) ( not ( = ?auto_668802 ?auto_668804 ) ) ( not ( = ?auto_668802 ?auto_668805 ) ) ( not ( = ?auto_668802 ?auto_668806 ) ) ( not ( = ?auto_668802 ?auto_668807 ) ) ( not ( = ?auto_668802 ?auto_668808 ) ) ( not ( = ?auto_668802 ?auto_668809 ) ) ( not ( = ?auto_668802 ?auto_668810 ) ) ( not ( = ?auto_668802 ?auto_668811 ) ) ( not ( = ?auto_668802 ?auto_668812 ) ) ( not ( = ?auto_668802 ?auto_668813 ) ) ( not ( = ?auto_668802 ?auto_668814 ) ) ( not ( = ?auto_668802 ?auto_668815 ) ) ( not ( = ?auto_668802 ?auto_668816 ) ) ( not ( = ?auto_668803 ?auto_668804 ) ) ( not ( = ?auto_668803 ?auto_668805 ) ) ( not ( = ?auto_668803 ?auto_668806 ) ) ( not ( = ?auto_668803 ?auto_668807 ) ) ( not ( = ?auto_668803 ?auto_668808 ) ) ( not ( = ?auto_668803 ?auto_668809 ) ) ( not ( = ?auto_668803 ?auto_668810 ) ) ( not ( = ?auto_668803 ?auto_668811 ) ) ( not ( = ?auto_668803 ?auto_668812 ) ) ( not ( = ?auto_668803 ?auto_668813 ) ) ( not ( = ?auto_668803 ?auto_668814 ) ) ( not ( = ?auto_668803 ?auto_668815 ) ) ( not ( = ?auto_668803 ?auto_668816 ) ) ( not ( = ?auto_668804 ?auto_668805 ) ) ( not ( = ?auto_668804 ?auto_668806 ) ) ( not ( = ?auto_668804 ?auto_668807 ) ) ( not ( = ?auto_668804 ?auto_668808 ) ) ( not ( = ?auto_668804 ?auto_668809 ) ) ( not ( = ?auto_668804 ?auto_668810 ) ) ( not ( = ?auto_668804 ?auto_668811 ) ) ( not ( = ?auto_668804 ?auto_668812 ) ) ( not ( = ?auto_668804 ?auto_668813 ) ) ( not ( = ?auto_668804 ?auto_668814 ) ) ( not ( = ?auto_668804 ?auto_668815 ) ) ( not ( = ?auto_668804 ?auto_668816 ) ) ( not ( = ?auto_668805 ?auto_668806 ) ) ( not ( = ?auto_668805 ?auto_668807 ) ) ( not ( = ?auto_668805 ?auto_668808 ) ) ( not ( = ?auto_668805 ?auto_668809 ) ) ( not ( = ?auto_668805 ?auto_668810 ) ) ( not ( = ?auto_668805 ?auto_668811 ) ) ( not ( = ?auto_668805 ?auto_668812 ) ) ( not ( = ?auto_668805 ?auto_668813 ) ) ( not ( = ?auto_668805 ?auto_668814 ) ) ( not ( = ?auto_668805 ?auto_668815 ) ) ( not ( = ?auto_668805 ?auto_668816 ) ) ( not ( = ?auto_668806 ?auto_668807 ) ) ( not ( = ?auto_668806 ?auto_668808 ) ) ( not ( = ?auto_668806 ?auto_668809 ) ) ( not ( = ?auto_668806 ?auto_668810 ) ) ( not ( = ?auto_668806 ?auto_668811 ) ) ( not ( = ?auto_668806 ?auto_668812 ) ) ( not ( = ?auto_668806 ?auto_668813 ) ) ( not ( = ?auto_668806 ?auto_668814 ) ) ( not ( = ?auto_668806 ?auto_668815 ) ) ( not ( = ?auto_668806 ?auto_668816 ) ) ( not ( = ?auto_668807 ?auto_668808 ) ) ( not ( = ?auto_668807 ?auto_668809 ) ) ( not ( = ?auto_668807 ?auto_668810 ) ) ( not ( = ?auto_668807 ?auto_668811 ) ) ( not ( = ?auto_668807 ?auto_668812 ) ) ( not ( = ?auto_668807 ?auto_668813 ) ) ( not ( = ?auto_668807 ?auto_668814 ) ) ( not ( = ?auto_668807 ?auto_668815 ) ) ( not ( = ?auto_668807 ?auto_668816 ) ) ( not ( = ?auto_668808 ?auto_668809 ) ) ( not ( = ?auto_668808 ?auto_668810 ) ) ( not ( = ?auto_668808 ?auto_668811 ) ) ( not ( = ?auto_668808 ?auto_668812 ) ) ( not ( = ?auto_668808 ?auto_668813 ) ) ( not ( = ?auto_668808 ?auto_668814 ) ) ( not ( = ?auto_668808 ?auto_668815 ) ) ( not ( = ?auto_668808 ?auto_668816 ) ) ( not ( = ?auto_668809 ?auto_668810 ) ) ( not ( = ?auto_668809 ?auto_668811 ) ) ( not ( = ?auto_668809 ?auto_668812 ) ) ( not ( = ?auto_668809 ?auto_668813 ) ) ( not ( = ?auto_668809 ?auto_668814 ) ) ( not ( = ?auto_668809 ?auto_668815 ) ) ( not ( = ?auto_668809 ?auto_668816 ) ) ( not ( = ?auto_668810 ?auto_668811 ) ) ( not ( = ?auto_668810 ?auto_668812 ) ) ( not ( = ?auto_668810 ?auto_668813 ) ) ( not ( = ?auto_668810 ?auto_668814 ) ) ( not ( = ?auto_668810 ?auto_668815 ) ) ( not ( = ?auto_668810 ?auto_668816 ) ) ( not ( = ?auto_668811 ?auto_668812 ) ) ( not ( = ?auto_668811 ?auto_668813 ) ) ( not ( = ?auto_668811 ?auto_668814 ) ) ( not ( = ?auto_668811 ?auto_668815 ) ) ( not ( = ?auto_668811 ?auto_668816 ) ) ( not ( = ?auto_668812 ?auto_668813 ) ) ( not ( = ?auto_668812 ?auto_668814 ) ) ( not ( = ?auto_668812 ?auto_668815 ) ) ( not ( = ?auto_668812 ?auto_668816 ) ) ( not ( = ?auto_668813 ?auto_668814 ) ) ( not ( = ?auto_668813 ?auto_668815 ) ) ( not ( = ?auto_668813 ?auto_668816 ) ) ( not ( = ?auto_668814 ?auto_668815 ) ) ( not ( = ?auto_668814 ?auto_668816 ) ) ( not ( = ?auto_668815 ?auto_668816 ) ) ( ON ?auto_668814 ?auto_668815 ) ( ON ?auto_668813 ?auto_668814 ) ( ON ?auto_668812 ?auto_668813 ) ( ON ?auto_668811 ?auto_668812 ) ( CLEAR ?auto_668809 ) ( ON ?auto_668810 ?auto_668811 ) ( CLEAR ?auto_668810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_668802 ?auto_668803 ?auto_668804 ?auto_668805 ?auto_668806 ?auto_668807 ?auto_668808 ?auto_668809 ?auto_668810 )
      ( MAKE-14PILE ?auto_668802 ?auto_668803 ?auto_668804 ?auto_668805 ?auto_668806 ?auto_668807 ?auto_668808 ?auto_668809 ?auto_668810 ?auto_668811 ?auto_668812 ?auto_668813 ?auto_668814 ?auto_668815 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668860 - BLOCK
      ?auto_668861 - BLOCK
      ?auto_668862 - BLOCK
      ?auto_668863 - BLOCK
      ?auto_668864 - BLOCK
      ?auto_668865 - BLOCK
      ?auto_668866 - BLOCK
      ?auto_668867 - BLOCK
      ?auto_668868 - BLOCK
      ?auto_668869 - BLOCK
      ?auto_668870 - BLOCK
      ?auto_668871 - BLOCK
      ?auto_668872 - BLOCK
      ?auto_668873 - BLOCK
    )
    :vars
    (
      ?auto_668874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668873 ?auto_668874 ) ( ON-TABLE ?auto_668860 ) ( ON ?auto_668861 ?auto_668860 ) ( ON ?auto_668862 ?auto_668861 ) ( ON ?auto_668863 ?auto_668862 ) ( ON ?auto_668864 ?auto_668863 ) ( ON ?auto_668865 ?auto_668864 ) ( ON ?auto_668866 ?auto_668865 ) ( not ( = ?auto_668860 ?auto_668861 ) ) ( not ( = ?auto_668860 ?auto_668862 ) ) ( not ( = ?auto_668860 ?auto_668863 ) ) ( not ( = ?auto_668860 ?auto_668864 ) ) ( not ( = ?auto_668860 ?auto_668865 ) ) ( not ( = ?auto_668860 ?auto_668866 ) ) ( not ( = ?auto_668860 ?auto_668867 ) ) ( not ( = ?auto_668860 ?auto_668868 ) ) ( not ( = ?auto_668860 ?auto_668869 ) ) ( not ( = ?auto_668860 ?auto_668870 ) ) ( not ( = ?auto_668860 ?auto_668871 ) ) ( not ( = ?auto_668860 ?auto_668872 ) ) ( not ( = ?auto_668860 ?auto_668873 ) ) ( not ( = ?auto_668860 ?auto_668874 ) ) ( not ( = ?auto_668861 ?auto_668862 ) ) ( not ( = ?auto_668861 ?auto_668863 ) ) ( not ( = ?auto_668861 ?auto_668864 ) ) ( not ( = ?auto_668861 ?auto_668865 ) ) ( not ( = ?auto_668861 ?auto_668866 ) ) ( not ( = ?auto_668861 ?auto_668867 ) ) ( not ( = ?auto_668861 ?auto_668868 ) ) ( not ( = ?auto_668861 ?auto_668869 ) ) ( not ( = ?auto_668861 ?auto_668870 ) ) ( not ( = ?auto_668861 ?auto_668871 ) ) ( not ( = ?auto_668861 ?auto_668872 ) ) ( not ( = ?auto_668861 ?auto_668873 ) ) ( not ( = ?auto_668861 ?auto_668874 ) ) ( not ( = ?auto_668862 ?auto_668863 ) ) ( not ( = ?auto_668862 ?auto_668864 ) ) ( not ( = ?auto_668862 ?auto_668865 ) ) ( not ( = ?auto_668862 ?auto_668866 ) ) ( not ( = ?auto_668862 ?auto_668867 ) ) ( not ( = ?auto_668862 ?auto_668868 ) ) ( not ( = ?auto_668862 ?auto_668869 ) ) ( not ( = ?auto_668862 ?auto_668870 ) ) ( not ( = ?auto_668862 ?auto_668871 ) ) ( not ( = ?auto_668862 ?auto_668872 ) ) ( not ( = ?auto_668862 ?auto_668873 ) ) ( not ( = ?auto_668862 ?auto_668874 ) ) ( not ( = ?auto_668863 ?auto_668864 ) ) ( not ( = ?auto_668863 ?auto_668865 ) ) ( not ( = ?auto_668863 ?auto_668866 ) ) ( not ( = ?auto_668863 ?auto_668867 ) ) ( not ( = ?auto_668863 ?auto_668868 ) ) ( not ( = ?auto_668863 ?auto_668869 ) ) ( not ( = ?auto_668863 ?auto_668870 ) ) ( not ( = ?auto_668863 ?auto_668871 ) ) ( not ( = ?auto_668863 ?auto_668872 ) ) ( not ( = ?auto_668863 ?auto_668873 ) ) ( not ( = ?auto_668863 ?auto_668874 ) ) ( not ( = ?auto_668864 ?auto_668865 ) ) ( not ( = ?auto_668864 ?auto_668866 ) ) ( not ( = ?auto_668864 ?auto_668867 ) ) ( not ( = ?auto_668864 ?auto_668868 ) ) ( not ( = ?auto_668864 ?auto_668869 ) ) ( not ( = ?auto_668864 ?auto_668870 ) ) ( not ( = ?auto_668864 ?auto_668871 ) ) ( not ( = ?auto_668864 ?auto_668872 ) ) ( not ( = ?auto_668864 ?auto_668873 ) ) ( not ( = ?auto_668864 ?auto_668874 ) ) ( not ( = ?auto_668865 ?auto_668866 ) ) ( not ( = ?auto_668865 ?auto_668867 ) ) ( not ( = ?auto_668865 ?auto_668868 ) ) ( not ( = ?auto_668865 ?auto_668869 ) ) ( not ( = ?auto_668865 ?auto_668870 ) ) ( not ( = ?auto_668865 ?auto_668871 ) ) ( not ( = ?auto_668865 ?auto_668872 ) ) ( not ( = ?auto_668865 ?auto_668873 ) ) ( not ( = ?auto_668865 ?auto_668874 ) ) ( not ( = ?auto_668866 ?auto_668867 ) ) ( not ( = ?auto_668866 ?auto_668868 ) ) ( not ( = ?auto_668866 ?auto_668869 ) ) ( not ( = ?auto_668866 ?auto_668870 ) ) ( not ( = ?auto_668866 ?auto_668871 ) ) ( not ( = ?auto_668866 ?auto_668872 ) ) ( not ( = ?auto_668866 ?auto_668873 ) ) ( not ( = ?auto_668866 ?auto_668874 ) ) ( not ( = ?auto_668867 ?auto_668868 ) ) ( not ( = ?auto_668867 ?auto_668869 ) ) ( not ( = ?auto_668867 ?auto_668870 ) ) ( not ( = ?auto_668867 ?auto_668871 ) ) ( not ( = ?auto_668867 ?auto_668872 ) ) ( not ( = ?auto_668867 ?auto_668873 ) ) ( not ( = ?auto_668867 ?auto_668874 ) ) ( not ( = ?auto_668868 ?auto_668869 ) ) ( not ( = ?auto_668868 ?auto_668870 ) ) ( not ( = ?auto_668868 ?auto_668871 ) ) ( not ( = ?auto_668868 ?auto_668872 ) ) ( not ( = ?auto_668868 ?auto_668873 ) ) ( not ( = ?auto_668868 ?auto_668874 ) ) ( not ( = ?auto_668869 ?auto_668870 ) ) ( not ( = ?auto_668869 ?auto_668871 ) ) ( not ( = ?auto_668869 ?auto_668872 ) ) ( not ( = ?auto_668869 ?auto_668873 ) ) ( not ( = ?auto_668869 ?auto_668874 ) ) ( not ( = ?auto_668870 ?auto_668871 ) ) ( not ( = ?auto_668870 ?auto_668872 ) ) ( not ( = ?auto_668870 ?auto_668873 ) ) ( not ( = ?auto_668870 ?auto_668874 ) ) ( not ( = ?auto_668871 ?auto_668872 ) ) ( not ( = ?auto_668871 ?auto_668873 ) ) ( not ( = ?auto_668871 ?auto_668874 ) ) ( not ( = ?auto_668872 ?auto_668873 ) ) ( not ( = ?auto_668872 ?auto_668874 ) ) ( not ( = ?auto_668873 ?auto_668874 ) ) ( ON ?auto_668872 ?auto_668873 ) ( ON ?auto_668871 ?auto_668872 ) ( ON ?auto_668870 ?auto_668871 ) ( ON ?auto_668869 ?auto_668870 ) ( ON ?auto_668868 ?auto_668869 ) ( CLEAR ?auto_668866 ) ( ON ?auto_668867 ?auto_668868 ) ( CLEAR ?auto_668867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_668860 ?auto_668861 ?auto_668862 ?auto_668863 ?auto_668864 ?auto_668865 ?auto_668866 ?auto_668867 )
      ( MAKE-14PILE ?auto_668860 ?auto_668861 ?auto_668862 ?auto_668863 ?auto_668864 ?auto_668865 ?auto_668866 ?auto_668867 ?auto_668868 ?auto_668869 ?auto_668870 ?auto_668871 ?auto_668872 ?auto_668873 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668918 - BLOCK
      ?auto_668919 - BLOCK
      ?auto_668920 - BLOCK
      ?auto_668921 - BLOCK
      ?auto_668922 - BLOCK
      ?auto_668923 - BLOCK
      ?auto_668924 - BLOCK
      ?auto_668925 - BLOCK
      ?auto_668926 - BLOCK
      ?auto_668927 - BLOCK
      ?auto_668928 - BLOCK
      ?auto_668929 - BLOCK
      ?auto_668930 - BLOCK
      ?auto_668931 - BLOCK
    )
    :vars
    (
      ?auto_668932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668931 ?auto_668932 ) ( ON-TABLE ?auto_668918 ) ( ON ?auto_668919 ?auto_668918 ) ( ON ?auto_668920 ?auto_668919 ) ( ON ?auto_668921 ?auto_668920 ) ( ON ?auto_668922 ?auto_668921 ) ( ON ?auto_668923 ?auto_668922 ) ( not ( = ?auto_668918 ?auto_668919 ) ) ( not ( = ?auto_668918 ?auto_668920 ) ) ( not ( = ?auto_668918 ?auto_668921 ) ) ( not ( = ?auto_668918 ?auto_668922 ) ) ( not ( = ?auto_668918 ?auto_668923 ) ) ( not ( = ?auto_668918 ?auto_668924 ) ) ( not ( = ?auto_668918 ?auto_668925 ) ) ( not ( = ?auto_668918 ?auto_668926 ) ) ( not ( = ?auto_668918 ?auto_668927 ) ) ( not ( = ?auto_668918 ?auto_668928 ) ) ( not ( = ?auto_668918 ?auto_668929 ) ) ( not ( = ?auto_668918 ?auto_668930 ) ) ( not ( = ?auto_668918 ?auto_668931 ) ) ( not ( = ?auto_668918 ?auto_668932 ) ) ( not ( = ?auto_668919 ?auto_668920 ) ) ( not ( = ?auto_668919 ?auto_668921 ) ) ( not ( = ?auto_668919 ?auto_668922 ) ) ( not ( = ?auto_668919 ?auto_668923 ) ) ( not ( = ?auto_668919 ?auto_668924 ) ) ( not ( = ?auto_668919 ?auto_668925 ) ) ( not ( = ?auto_668919 ?auto_668926 ) ) ( not ( = ?auto_668919 ?auto_668927 ) ) ( not ( = ?auto_668919 ?auto_668928 ) ) ( not ( = ?auto_668919 ?auto_668929 ) ) ( not ( = ?auto_668919 ?auto_668930 ) ) ( not ( = ?auto_668919 ?auto_668931 ) ) ( not ( = ?auto_668919 ?auto_668932 ) ) ( not ( = ?auto_668920 ?auto_668921 ) ) ( not ( = ?auto_668920 ?auto_668922 ) ) ( not ( = ?auto_668920 ?auto_668923 ) ) ( not ( = ?auto_668920 ?auto_668924 ) ) ( not ( = ?auto_668920 ?auto_668925 ) ) ( not ( = ?auto_668920 ?auto_668926 ) ) ( not ( = ?auto_668920 ?auto_668927 ) ) ( not ( = ?auto_668920 ?auto_668928 ) ) ( not ( = ?auto_668920 ?auto_668929 ) ) ( not ( = ?auto_668920 ?auto_668930 ) ) ( not ( = ?auto_668920 ?auto_668931 ) ) ( not ( = ?auto_668920 ?auto_668932 ) ) ( not ( = ?auto_668921 ?auto_668922 ) ) ( not ( = ?auto_668921 ?auto_668923 ) ) ( not ( = ?auto_668921 ?auto_668924 ) ) ( not ( = ?auto_668921 ?auto_668925 ) ) ( not ( = ?auto_668921 ?auto_668926 ) ) ( not ( = ?auto_668921 ?auto_668927 ) ) ( not ( = ?auto_668921 ?auto_668928 ) ) ( not ( = ?auto_668921 ?auto_668929 ) ) ( not ( = ?auto_668921 ?auto_668930 ) ) ( not ( = ?auto_668921 ?auto_668931 ) ) ( not ( = ?auto_668921 ?auto_668932 ) ) ( not ( = ?auto_668922 ?auto_668923 ) ) ( not ( = ?auto_668922 ?auto_668924 ) ) ( not ( = ?auto_668922 ?auto_668925 ) ) ( not ( = ?auto_668922 ?auto_668926 ) ) ( not ( = ?auto_668922 ?auto_668927 ) ) ( not ( = ?auto_668922 ?auto_668928 ) ) ( not ( = ?auto_668922 ?auto_668929 ) ) ( not ( = ?auto_668922 ?auto_668930 ) ) ( not ( = ?auto_668922 ?auto_668931 ) ) ( not ( = ?auto_668922 ?auto_668932 ) ) ( not ( = ?auto_668923 ?auto_668924 ) ) ( not ( = ?auto_668923 ?auto_668925 ) ) ( not ( = ?auto_668923 ?auto_668926 ) ) ( not ( = ?auto_668923 ?auto_668927 ) ) ( not ( = ?auto_668923 ?auto_668928 ) ) ( not ( = ?auto_668923 ?auto_668929 ) ) ( not ( = ?auto_668923 ?auto_668930 ) ) ( not ( = ?auto_668923 ?auto_668931 ) ) ( not ( = ?auto_668923 ?auto_668932 ) ) ( not ( = ?auto_668924 ?auto_668925 ) ) ( not ( = ?auto_668924 ?auto_668926 ) ) ( not ( = ?auto_668924 ?auto_668927 ) ) ( not ( = ?auto_668924 ?auto_668928 ) ) ( not ( = ?auto_668924 ?auto_668929 ) ) ( not ( = ?auto_668924 ?auto_668930 ) ) ( not ( = ?auto_668924 ?auto_668931 ) ) ( not ( = ?auto_668924 ?auto_668932 ) ) ( not ( = ?auto_668925 ?auto_668926 ) ) ( not ( = ?auto_668925 ?auto_668927 ) ) ( not ( = ?auto_668925 ?auto_668928 ) ) ( not ( = ?auto_668925 ?auto_668929 ) ) ( not ( = ?auto_668925 ?auto_668930 ) ) ( not ( = ?auto_668925 ?auto_668931 ) ) ( not ( = ?auto_668925 ?auto_668932 ) ) ( not ( = ?auto_668926 ?auto_668927 ) ) ( not ( = ?auto_668926 ?auto_668928 ) ) ( not ( = ?auto_668926 ?auto_668929 ) ) ( not ( = ?auto_668926 ?auto_668930 ) ) ( not ( = ?auto_668926 ?auto_668931 ) ) ( not ( = ?auto_668926 ?auto_668932 ) ) ( not ( = ?auto_668927 ?auto_668928 ) ) ( not ( = ?auto_668927 ?auto_668929 ) ) ( not ( = ?auto_668927 ?auto_668930 ) ) ( not ( = ?auto_668927 ?auto_668931 ) ) ( not ( = ?auto_668927 ?auto_668932 ) ) ( not ( = ?auto_668928 ?auto_668929 ) ) ( not ( = ?auto_668928 ?auto_668930 ) ) ( not ( = ?auto_668928 ?auto_668931 ) ) ( not ( = ?auto_668928 ?auto_668932 ) ) ( not ( = ?auto_668929 ?auto_668930 ) ) ( not ( = ?auto_668929 ?auto_668931 ) ) ( not ( = ?auto_668929 ?auto_668932 ) ) ( not ( = ?auto_668930 ?auto_668931 ) ) ( not ( = ?auto_668930 ?auto_668932 ) ) ( not ( = ?auto_668931 ?auto_668932 ) ) ( ON ?auto_668930 ?auto_668931 ) ( ON ?auto_668929 ?auto_668930 ) ( ON ?auto_668928 ?auto_668929 ) ( ON ?auto_668927 ?auto_668928 ) ( ON ?auto_668926 ?auto_668927 ) ( ON ?auto_668925 ?auto_668926 ) ( CLEAR ?auto_668923 ) ( ON ?auto_668924 ?auto_668925 ) ( CLEAR ?auto_668924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_668918 ?auto_668919 ?auto_668920 ?auto_668921 ?auto_668922 ?auto_668923 ?auto_668924 )
      ( MAKE-14PILE ?auto_668918 ?auto_668919 ?auto_668920 ?auto_668921 ?auto_668922 ?auto_668923 ?auto_668924 ?auto_668925 ?auto_668926 ?auto_668927 ?auto_668928 ?auto_668929 ?auto_668930 ?auto_668931 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_668976 - BLOCK
      ?auto_668977 - BLOCK
      ?auto_668978 - BLOCK
      ?auto_668979 - BLOCK
      ?auto_668980 - BLOCK
      ?auto_668981 - BLOCK
      ?auto_668982 - BLOCK
      ?auto_668983 - BLOCK
      ?auto_668984 - BLOCK
      ?auto_668985 - BLOCK
      ?auto_668986 - BLOCK
      ?auto_668987 - BLOCK
      ?auto_668988 - BLOCK
      ?auto_668989 - BLOCK
    )
    :vars
    (
      ?auto_668990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_668989 ?auto_668990 ) ( ON-TABLE ?auto_668976 ) ( ON ?auto_668977 ?auto_668976 ) ( ON ?auto_668978 ?auto_668977 ) ( ON ?auto_668979 ?auto_668978 ) ( ON ?auto_668980 ?auto_668979 ) ( not ( = ?auto_668976 ?auto_668977 ) ) ( not ( = ?auto_668976 ?auto_668978 ) ) ( not ( = ?auto_668976 ?auto_668979 ) ) ( not ( = ?auto_668976 ?auto_668980 ) ) ( not ( = ?auto_668976 ?auto_668981 ) ) ( not ( = ?auto_668976 ?auto_668982 ) ) ( not ( = ?auto_668976 ?auto_668983 ) ) ( not ( = ?auto_668976 ?auto_668984 ) ) ( not ( = ?auto_668976 ?auto_668985 ) ) ( not ( = ?auto_668976 ?auto_668986 ) ) ( not ( = ?auto_668976 ?auto_668987 ) ) ( not ( = ?auto_668976 ?auto_668988 ) ) ( not ( = ?auto_668976 ?auto_668989 ) ) ( not ( = ?auto_668976 ?auto_668990 ) ) ( not ( = ?auto_668977 ?auto_668978 ) ) ( not ( = ?auto_668977 ?auto_668979 ) ) ( not ( = ?auto_668977 ?auto_668980 ) ) ( not ( = ?auto_668977 ?auto_668981 ) ) ( not ( = ?auto_668977 ?auto_668982 ) ) ( not ( = ?auto_668977 ?auto_668983 ) ) ( not ( = ?auto_668977 ?auto_668984 ) ) ( not ( = ?auto_668977 ?auto_668985 ) ) ( not ( = ?auto_668977 ?auto_668986 ) ) ( not ( = ?auto_668977 ?auto_668987 ) ) ( not ( = ?auto_668977 ?auto_668988 ) ) ( not ( = ?auto_668977 ?auto_668989 ) ) ( not ( = ?auto_668977 ?auto_668990 ) ) ( not ( = ?auto_668978 ?auto_668979 ) ) ( not ( = ?auto_668978 ?auto_668980 ) ) ( not ( = ?auto_668978 ?auto_668981 ) ) ( not ( = ?auto_668978 ?auto_668982 ) ) ( not ( = ?auto_668978 ?auto_668983 ) ) ( not ( = ?auto_668978 ?auto_668984 ) ) ( not ( = ?auto_668978 ?auto_668985 ) ) ( not ( = ?auto_668978 ?auto_668986 ) ) ( not ( = ?auto_668978 ?auto_668987 ) ) ( not ( = ?auto_668978 ?auto_668988 ) ) ( not ( = ?auto_668978 ?auto_668989 ) ) ( not ( = ?auto_668978 ?auto_668990 ) ) ( not ( = ?auto_668979 ?auto_668980 ) ) ( not ( = ?auto_668979 ?auto_668981 ) ) ( not ( = ?auto_668979 ?auto_668982 ) ) ( not ( = ?auto_668979 ?auto_668983 ) ) ( not ( = ?auto_668979 ?auto_668984 ) ) ( not ( = ?auto_668979 ?auto_668985 ) ) ( not ( = ?auto_668979 ?auto_668986 ) ) ( not ( = ?auto_668979 ?auto_668987 ) ) ( not ( = ?auto_668979 ?auto_668988 ) ) ( not ( = ?auto_668979 ?auto_668989 ) ) ( not ( = ?auto_668979 ?auto_668990 ) ) ( not ( = ?auto_668980 ?auto_668981 ) ) ( not ( = ?auto_668980 ?auto_668982 ) ) ( not ( = ?auto_668980 ?auto_668983 ) ) ( not ( = ?auto_668980 ?auto_668984 ) ) ( not ( = ?auto_668980 ?auto_668985 ) ) ( not ( = ?auto_668980 ?auto_668986 ) ) ( not ( = ?auto_668980 ?auto_668987 ) ) ( not ( = ?auto_668980 ?auto_668988 ) ) ( not ( = ?auto_668980 ?auto_668989 ) ) ( not ( = ?auto_668980 ?auto_668990 ) ) ( not ( = ?auto_668981 ?auto_668982 ) ) ( not ( = ?auto_668981 ?auto_668983 ) ) ( not ( = ?auto_668981 ?auto_668984 ) ) ( not ( = ?auto_668981 ?auto_668985 ) ) ( not ( = ?auto_668981 ?auto_668986 ) ) ( not ( = ?auto_668981 ?auto_668987 ) ) ( not ( = ?auto_668981 ?auto_668988 ) ) ( not ( = ?auto_668981 ?auto_668989 ) ) ( not ( = ?auto_668981 ?auto_668990 ) ) ( not ( = ?auto_668982 ?auto_668983 ) ) ( not ( = ?auto_668982 ?auto_668984 ) ) ( not ( = ?auto_668982 ?auto_668985 ) ) ( not ( = ?auto_668982 ?auto_668986 ) ) ( not ( = ?auto_668982 ?auto_668987 ) ) ( not ( = ?auto_668982 ?auto_668988 ) ) ( not ( = ?auto_668982 ?auto_668989 ) ) ( not ( = ?auto_668982 ?auto_668990 ) ) ( not ( = ?auto_668983 ?auto_668984 ) ) ( not ( = ?auto_668983 ?auto_668985 ) ) ( not ( = ?auto_668983 ?auto_668986 ) ) ( not ( = ?auto_668983 ?auto_668987 ) ) ( not ( = ?auto_668983 ?auto_668988 ) ) ( not ( = ?auto_668983 ?auto_668989 ) ) ( not ( = ?auto_668983 ?auto_668990 ) ) ( not ( = ?auto_668984 ?auto_668985 ) ) ( not ( = ?auto_668984 ?auto_668986 ) ) ( not ( = ?auto_668984 ?auto_668987 ) ) ( not ( = ?auto_668984 ?auto_668988 ) ) ( not ( = ?auto_668984 ?auto_668989 ) ) ( not ( = ?auto_668984 ?auto_668990 ) ) ( not ( = ?auto_668985 ?auto_668986 ) ) ( not ( = ?auto_668985 ?auto_668987 ) ) ( not ( = ?auto_668985 ?auto_668988 ) ) ( not ( = ?auto_668985 ?auto_668989 ) ) ( not ( = ?auto_668985 ?auto_668990 ) ) ( not ( = ?auto_668986 ?auto_668987 ) ) ( not ( = ?auto_668986 ?auto_668988 ) ) ( not ( = ?auto_668986 ?auto_668989 ) ) ( not ( = ?auto_668986 ?auto_668990 ) ) ( not ( = ?auto_668987 ?auto_668988 ) ) ( not ( = ?auto_668987 ?auto_668989 ) ) ( not ( = ?auto_668987 ?auto_668990 ) ) ( not ( = ?auto_668988 ?auto_668989 ) ) ( not ( = ?auto_668988 ?auto_668990 ) ) ( not ( = ?auto_668989 ?auto_668990 ) ) ( ON ?auto_668988 ?auto_668989 ) ( ON ?auto_668987 ?auto_668988 ) ( ON ?auto_668986 ?auto_668987 ) ( ON ?auto_668985 ?auto_668986 ) ( ON ?auto_668984 ?auto_668985 ) ( ON ?auto_668983 ?auto_668984 ) ( ON ?auto_668982 ?auto_668983 ) ( CLEAR ?auto_668980 ) ( ON ?auto_668981 ?auto_668982 ) ( CLEAR ?auto_668981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_668976 ?auto_668977 ?auto_668978 ?auto_668979 ?auto_668980 ?auto_668981 )
      ( MAKE-14PILE ?auto_668976 ?auto_668977 ?auto_668978 ?auto_668979 ?auto_668980 ?auto_668981 ?auto_668982 ?auto_668983 ?auto_668984 ?auto_668985 ?auto_668986 ?auto_668987 ?auto_668988 ?auto_668989 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_669034 - BLOCK
      ?auto_669035 - BLOCK
      ?auto_669036 - BLOCK
      ?auto_669037 - BLOCK
      ?auto_669038 - BLOCK
      ?auto_669039 - BLOCK
      ?auto_669040 - BLOCK
      ?auto_669041 - BLOCK
      ?auto_669042 - BLOCK
      ?auto_669043 - BLOCK
      ?auto_669044 - BLOCK
      ?auto_669045 - BLOCK
      ?auto_669046 - BLOCK
      ?auto_669047 - BLOCK
    )
    :vars
    (
      ?auto_669048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669047 ?auto_669048 ) ( ON-TABLE ?auto_669034 ) ( ON ?auto_669035 ?auto_669034 ) ( ON ?auto_669036 ?auto_669035 ) ( ON ?auto_669037 ?auto_669036 ) ( not ( = ?auto_669034 ?auto_669035 ) ) ( not ( = ?auto_669034 ?auto_669036 ) ) ( not ( = ?auto_669034 ?auto_669037 ) ) ( not ( = ?auto_669034 ?auto_669038 ) ) ( not ( = ?auto_669034 ?auto_669039 ) ) ( not ( = ?auto_669034 ?auto_669040 ) ) ( not ( = ?auto_669034 ?auto_669041 ) ) ( not ( = ?auto_669034 ?auto_669042 ) ) ( not ( = ?auto_669034 ?auto_669043 ) ) ( not ( = ?auto_669034 ?auto_669044 ) ) ( not ( = ?auto_669034 ?auto_669045 ) ) ( not ( = ?auto_669034 ?auto_669046 ) ) ( not ( = ?auto_669034 ?auto_669047 ) ) ( not ( = ?auto_669034 ?auto_669048 ) ) ( not ( = ?auto_669035 ?auto_669036 ) ) ( not ( = ?auto_669035 ?auto_669037 ) ) ( not ( = ?auto_669035 ?auto_669038 ) ) ( not ( = ?auto_669035 ?auto_669039 ) ) ( not ( = ?auto_669035 ?auto_669040 ) ) ( not ( = ?auto_669035 ?auto_669041 ) ) ( not ( = ?auto_669035 ?auto_669042 ) ) ( not ( = ?auto_669035 ?auto_669043 ) ) ( not ( = ?auto_669035 ?auto_669044 ) ) ( not ( = ?auto_669035 ?auto_669045 ) ) ( not ( = ?auto_669035 ?auto_669046 ) ) ( not ( = ?auto_669035 ?auto_669047 ) ) ( not ( = ?auto_669035 ?auto_669048 ) ) ( not ( = ?auto_669036 ?auto_669037 ) ) ( not ( = ?auto_669036 ?auto_669038 ) ) ( not ( = ?auto_669036 ?auto_669039 ) ) ( not ( = ?auto_669036 ?auto_669040 ) ) ( not ( = ?auto_669036 ?auto_669041 ) ) ( not ( = ?auto_669036 ?auto_669042 ) ) ( not ( = ?auto_669036 ?auto_669043 ) ) ( not ( = ?auto_669036 ?auto_669044 ) ) ( not ( = ?auto_669036 ?auto_669045 ) ) ( not ( = ?auto_669036 ?auto_669046 ) ) ( not ( = ?auto_669036 ?auto_669047 ) ) ( not ( = ?auto_669036 ?auto_669048 ) ) ( not ( = ?auto_669037 ?auto_669038 ) ) ( not ( = ?auto_669037 ?auto_669039 ) ) ( not ( = ?auto_669037 ?auto_669040 ) ) ( not ( = ?auto_669037 ?auto_669041 ) ) ( not ( = ?auto_669037 ?auto_669042 ) ) ( not ( = ?auto_669037 ?auto_669043 ) ) ( not ( = ?auto_669037 ?auto_669044 ) ) ( not ( = ?auto_669037 ?auto_669045 ) ) ( not ( = ?auto_669037 ?auto_669046 ) ) ( not ( = ?auto_669037 ?auto_669047 ) ) ( not ( = ?auto_669037 ?auto_669048 ) ) ( not ( = ?auto_669038 ?auto_669039 ) ) ( not ( = ?auto_669038 ?auto_669040 ) ) ( not ( = ?auto_669038 ?auto_669041 ) ) ( not ( = ?auto_669038 ?auto_669042 ) ) ( not ( = ?auto_669038 ?auto_669043 ) ) ( not ( = ?auto_669038 ?auto_669044 ) ) ( not ( = ?auto_669038 ?auto_669045 ) ) ( not ( = ?auto_669038 ?auto_669046 ) ) ( not ( = ?auto_669038 ?auto_669047 ) ) ( not ( = ?auto_669038 ?auto_669048 ) ) ( not ( = ?auto_669039 ?auto_669040 ) ) ( not ( = ?auto_669039 ?auto_669041 ) ) ( not ( = ?auto_669039 ?auto_669042 ) ) ( not ( = ?auto_669039 ?auto_669043 ) ) ( not ( = ?auto_669039 ?auto_669044 ) ) ( not ( = ?auto_669039 ?auto_669045 ) ) ( not ( = ?auto_669039 ?auto_669046 ) ) ( not ( = ?auto_669039 ?auto_669047 ) ) ( not ( = ?auto_669039 ?auto_669048 ) ) ( not ( = ?auto_669040 ?auto_669041 ) ) ( not ( = ?auto_669040 ?auto_669042 ) ) ( not ( = ?auto_669040 ?auto_669043 ) ) ( not ( = ?auto_669040 ?auto_669044 ) ) ( not ( = ?auto_669040 ?auto_669045 ) ) ( not ( = ?auto_669040 ?auto_669046 ) ) ( not ( = ?auto_669040 ?auto_669047 ) ) ( not ( = ?auto_669040 ?auto_669048 ) ) ( not ( = ?auto_669041 ?auto_669042 ) ) ( not ( = ?auto_669041 ?auto_669043 ) ) ( not ( = ?auto_669041 ?auto_669044 ) ) ( not ( = ?auto_669041 ?auto_669045 ) ) ( not ( = ?auto_669041 ?auto_669046 ) ) ( not ( = ?auto_669041 ?auto_669047 ) ) ( not ( = ?auto_669041 ?auto_669048 ) ) ( not ( = ?auto_669042 ?auto_669043 ) ) ( not ( = ?auto_669042 ?auto_669044 ) ) ( not ( = ?auto_669042 ?auto_669045 ) ) ( not ( = ?auto_669042 ?auto_669046 ) ) ( not ( = ?auto_669042 ?auto_669047 ) ) ( not ( = ?auto_669042 ?auto_669048 ) ) ( not ( = ?auto_669043 ?auto_669044 ) ) ( not ( = ?auto_669043 ?auto_669045 ) ) ( not ( = ?auto_669043 ?auto_669046 ) ) ( not ( = ?auto_669043 ?auto_669047 ) ) ( not ( = ?auto_669043 ?auto_669048 ) ) ( not ( = ?auto_669044 ?auto_669045 ) ) ( not ( = ?auto_669044 ?auto_669046 ) ) ( not ( = ?auto_669044 ?auto_669047 ) ) ( not ( = ?auto_669044 ?auto_669048 ) ) ( not ( = ?auto_669045 ?auto_669046 ) ) ( not ( = ?auto_669045 ?auto_669047 ) ) ( not ( = ?auto_669045 ?auto_669048 ) ) ( not ( = ?auto_669046 ?auto_669047 ) ) ( not ( = ?auto_669046 ?auto_669048 ) ) ( not ( = ?auto_669047 ?auto_669048 ) ) ( ON ?auto_669046 ?auto_669047 ) ( ON ?auto_669045 ?auto_669046 ) ( ON ?auto_669044 ?auto_669045 ) ( ON ?auto_669043 ?auto_669044 ) ( ON ?auto_669042 ?auto_669043 ) ( ON ?auto_669041 ?auto_669042 ) ( ON ?auto_669040 ?auto_669041 ) ( ON ?auto_669039 ?auto_669040 ) ( CLEAR ?auto_669037 ) ( ON ?auto_669038 ?auto_669039 ) ( CLEAR ?auto_669038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_669034 ?auto_669035 ?auto_669036 ?auto_669037 ?auto_669038 )
      ( MAKE-14PILE ?auto_669034 ?auto_669035 ?auto_669036 ?auto_669037 ?auto_669038 ?auto_669039 ?auto_669040 ?auto_669041 ?auto_669042 ?auto_669043 ?auto_669044 ?auto_669045 ?auto_669046 ?auto_669047 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_669092 - BLOCK
      ?auto_669093 - BLOCK
      ?auto_669094 - BLOCK
      ?auto_669095 - BLOCK
      ?auto_669096 - BLOCK
      ?auto_669097 - BLOCK
      ?auto_669098 - BLOCK
      ?auto_669099 - BLOCK
      ?auto_669100 - BLOCK
      ?auto_669101 - BLOCK
      ?auto_669102 - BLOCK
      ?auto_669103 - BLOCK
      ?auto_669104 - BLOCK
      ?auto_669105 - BLOCK
    )
    :vars
    (
      ?auto_669106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669105 ?auto_669106 ) ( ON-TABLE ?auto_669092 ) ( ON ?auto_669093 ?auto_669092 ) ( ON ?auto_669094 ?auto_669093 ) ( not ( = ?auto_669092 ?auto_669093 ) ) ( not ( = ?auto_669092 ?auto_669094 ) ) ( not ( = ?auto_669092 ?auto_669095 ) ) ( not ( = ?auto_669092 ?auto_669096 ) ) ( not ( = ?auto_669092 ?auto_669097 ) ) ( not ( = ?auto_669092 ?auto_669098 ) ) ( not ( = ?auto_669092 ?auto_669099 ) ) ( not ( = ?auto_669092 ?auto_669100 ) ) ( not ( = ?auto_669092 ?auto_669101 ) ) ( not ( = ?auto_669092 ?auto_669102 ) ) ( not ( = ?auto_669092 ?auto_669103 ) ) ( not ( = ?auto_669092 ?auto_669104 ) ) ( not ( = ?auto_669092 ?auto_669105 ) ) ( not ( = ?auto_669092 ?auto_669106 ) ) ( not ( = ?auto_669093 ?auto_669094 ) ) ( not ( = ?auto_669093 ?auto_669095 ) ) ( not ( = ?auto_669093 ?auto_669096 ) ) ( not ( = ?auto_669093 ?auto_669097 ) ) ( not ( = ?auto_669093 ?auto_669098 ) ) ( not ( = ?auto_669093 ?auto_669099 ) ) ( not ( = ?auto_669093 ?auto_669100 ) ) ( not ( = ?auto_669093 ?auto_669101 ) ) ( not ( = ?auto_669093 ?auto_669102 ) ) ( not ( = ?auto_669093 ?auto_669103 ) ) ( not ( = ?auto_669093 ?auto_669104 ) ) ( not ( = ?auto_669093 ?auto_669105 ) ) ( not ( = ?auto_669093 ?auto_669106 ) ) ( not ( = ?auto_669094 ?auto_669095 ) ) ( not ( = ?auto_669094 ?auto_669096 ) ) ( not ( = ?auto_669094 ?auto_669097 ) ) ( not ( = ?auto_669094 ?auto_669098 ) ) ( not ( = ?auto_669094 ?auto_669099 ) ) ( not ( = ?auto_669094 ?auto_669100 ) ) ( not ( = ?auto_669094 ?auto_669101 ) ) ( not ( = ?auto_669094 ?auto_669102 ) ) ( not ( = ?auto_669094 ?auto_669103 ) ) ( not ( = ?auto_669094 ?auto_669104 ) ) ( not ( = ?auto_669094 ?auto_669105 ) ) ( not ( = ?auto_669094 ?auto_669106 ) ) ( not ( = ?auto_669095 ?auto_669096 ) ) ( not ( = ?auto_669095 ?auto_669097 ) ) ( not ( = ?auto_669095 ?auto_669098 ) ) ( not ( = ?auto_669095 ?auto_669099 ) ) ( not ( = ?auto_669095 ?auto_669100 ) ) ( not ( = ?auto_669095 ?auto_669101 ) ) ( not ( = ?auto_669095 ?auto_669102 ) ) ( not ( = ?auto_669095 ?auto_669103 ) ) ( not ( = ?auto_669095 ?auto_669104 ) ) ( not ( = ?auto_669095 ?auto_669105 ) ) ( not ( = ?auto_669095 ?auto_669106 ) ) ( not ( = ?auto_669096 ?auto_669097 ) ) ( not ( = ?auto_669096 ?auto_669098 ) ) ( not ( = ?auto_669096 ?auto_669099 ) ) ( not ( = ?auto_669096 ?auto_669100 ) ) ( not ( = ?auto_669096 ?auto_669101 ) ) ( not ( = ?auto_669096 ?auto_669102 ) ) ( not ( = ?auto_669096 ?auto_669103 ) ) ( not ( = ?auto_669096 ?auto_669104 ) ) ( not ( = ?auto_669096 ?auto_669105 ) ) ( not ( = ?auto_669096 ?auto_669106 ) ) ( not ( = ?auto_669097 ?auto_669098 ) ) ( not ( = ?auto_669097 ?auto_669099 ) ) ( not ( = ?auto_669097 ?auto_669100 ) ) ( not ( = ?auto_669097 ?auto_669101 ) ) ( not ( = ?auto_669097 ?auto_669102 ) ) ( not ( = ?auto_669097 ?auto_669103 ) ) ( not ( = ?auto_669097 ?auto_669104 ) ) ( not ( = ?auto_669097 ?auto_669105 ) ) ( not ( = ?auto_669097 ?auto_669106 ) ) ( not ( = ?auto_669098 ?auto_669099 ) ) ( not ( = ?auto_669098 ?auto_669100 ) ) ( not ( = ?auto_669098 ?auto_669101 ) ) ( not ( = ?auto_669098 ?auto_669102 ) ) ( not ( = ?auto_669098 ?auto_669103 ) ) ( not ( = ?auto_669098 ?auto_669104 ) ) ( not ( = ?auto_669098 ?auto_669105 ) ) ( not ( = ?auto_669098 ?auto_669106 ) ) ( not ( = ?auto_669099 ?auto_669100 ) ) ( not ( = ?auto_669099 ?auto_669101 ) ) ( not ( = ?auto_669099 ?auto_669102 ) ) ( not ( = ?auto_669099 ?auto_669103 ) ) ( not ( = ?auto_669099 ?auto_669104 ) ) ( not ( = ?auto_669099 ?auto_669105 ) ) ( not ( = ?auto_669099 ?auto_669106 ) ) ( not ( = ?auto_669100 ?auto_669101 ) ) ( not ( = ?auto_669100 ?auto_669102 ) ) ( not ( = ?auto_669100 ?auto_669103 ) ) ( not ( = ?auto_669100 ?auto_669104 ) ) ( not ( = ?auto_669100 ?auto_669105 ) ) ( not ( = ?auto_669100 ?auto_669106 ) ) ( not ( = ?auto_669101 ?auto_669102 ) ) ( not ( = ?auto_669101 ?auto_669103 ) ) ( not ( = ?auto_669101 ?auto_669104 ) ) ( not ( = ?auto_669101 ?auto_669105 ) ) ( not ( = ?auto_669101 ?auto_669106 ) ) ( not ( = ?auto_669102 ?auto_669103 ) ) ( not ( = ?auto_669102 ?auto_669104 ) ) ( not ( = ?auto_669102 ?auto_669105 ) ) ( not ( = ?auto_669102 ?auto_669106 ) ) ( not ( = ?auto_669103 ?auto_669104 ) ) ( not ( = ?auto_669103 ?auto_669105 ) ) ( not ( = ?auto_669103 ?auto_669106 ) ) ( not ( = ?auto_669104 ?auto_669105 ) ) ( not ( = ?auto_669104 ?auto_669106 ) ) ( not ( = ?auto_669105 ?auto_669106 ) ) ( ON ?auto_669104 ?auto_669105 ) ( ON ?auto_669103 ?auto_669104 ) ( ON ?auto_669102 ?auto_669103 ) ( ON ?auto_669101 ?auto_669102 ) ( ON ?auto_669100 ?auto_669101 ) ( ON ?auto_669099 ?auto_669100 ) ( ON ?auto_669098 ?auto_669099 ) ( ON ?auto_669097 ?auto_669098 ) ( ON ?auto_669096 ?auto_669097 ) ( CLEAR ?auto_669094 ) ( ON ?auto_669095 ?auto_669096 ) ( CLEAR ?auto_669095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_669092 ?auto_669093 ?auto_669094 ?auto_669095 )
      ( MAKE-14PILE ?auto_669092 ?auto_669093 ?auto_669094 ?auto_669095 ?auto_669096 ?auto_669097 ?auto_669098 ?auto_669099 ?auto_669100 ?auto_669101 ?auto_669102 ?auto_669103 ?auto_669104 ?auto_669105 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_669150 - BLOCK
      ?auto_669151 - BLOCK
      ?auto_669152 - BLOCK
      ?auto_669153 - BLOCK
      ?auto_669154 - BLOCK
      ?auto_669155 - BLOCK
      ?auto_669156 - BLOCK
      ?auto_669157 - BLOCK
      ?auto_669158 - BLOCK
      ?auto_669159 - BLOCK
      ?auto_669160 - BLOCK
      ?auto_669161 - BLOCK
      ?auto_669162 - BLOCK
      ?auto_669163 - BLOCK
    )
    :vars
    (
      ?auto_669164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669163 ?auto_669164 ) ( ON-TABLE ?auto_669150 ) ( ON ?auto_669151 ?auto_669150 ) ( not ( = ?auto_669150 ?auto_669151 ) ) ( not ( = ?auto_669150 ?auto_669152 ) ) ( not ( = ?auto_669150 ?auto_669153 ) ) ( not ( = ?auto_669150 ?auto_669154 ) ) ( not ( = ?auto_669150 ?auto_669155 ) ) ( not ( = ?auto_669150 ?auto_669156 ) ) ( not ( = ?auto_669150 ?auto_669157 ) ) ( not ( = ?auto_669150 ?auto_669158 ) ) ( not ( = ?auto_669150 ?auto_669159 ) ) ( not ( = ?auto_669150 ?auto_669160 ) ) ( not ( = ?auto_669150 ?auto_669161 ) ) ( not ( = ?auto_669150 ?auto_669162 ) ) ( not ( = ?auto_669150 ?auto_669163 ) ) ( not ( = ?auto_669150 ?auto_669164 ) ) ( not ( = ?auto_669151 ?auto_669152 ) ) ( not ( = ?auto_669151 ?auto_669153 ) ) ( not ( = ?auto_669151 ?auto_669154 ) ) ( not ( = ?auto_669151 ?auto_669155 ) ) ( not ( = ?auto_669151 ?auto_669156 ) ) ( not ( = ?auto_669151 ?auto_669157 ) ) ( not ( = ?auto_669151 ?auto_669158 ) ) ( not ( = ?auto_669151 ?auto_669159 ) ) ( not ( = ?auto_669151 ?auto_669160 ) ) ( not ( = ?auto_669151 ?auto_669161 ) ) ( not ( = ?auto_669151 ?auto_669162 ) ) ( not ( = ?auto_669151 ?auto_669163 ) ) ( not ( = ?auto_669151 ?auto_669164 ) ) ( not ( = ?auto_669152 ?auto_669153 ) ) ( not ( = ?auto_669152 ?auto_669154 ) ) ( not ( = ?auto_669152 ?auto_669155 ) ) ( not ( = ?auto_669152 ?auto_669156 ) ) ( not ( = ?auto_669152 ?auto_669157 ) ) ( not ( = ?auto_669152 ?auto_669158 ) ) ( not ( = ?auto_669152 ?auto_669159 ) ) ( not ( = ?auto_669152 ?auto_669160 ) ) ( not ( = ?auto_669152 ?auto_669161 ) ) ( not ( = ?auto_669152 ?auto_669162 ) ) ( not ( = ?auto_669152 ?auto_669163 ) ) ( not ( = ?auto_669152 ?auto_669164 ) ) ( not ( = ?auto_669153 ?auto_669154 ) ) ( not ( = ?auto_669153 ?auto_669155 ) ) ( not ( = ?auto_669153 ?auto_669156 ) ) ( not ( = ?auto_669153 ?auto_669157 ) ) ( not ( = ?auto_669153 ?auto_669158 ) ) ( not ( = ?auto_669153 ?auto_669159 ) ) ( not ( = ?auto_669153 ?auto_669160 ) ) ( not ( = ?auto_669153 ?auto_669161 ) ) ( not ( = ?auto_669153 ?auto_669162 ) ) ( not ( = ?auto_669153 ?auto_669163 ) ) ( not ( = ?auto_669153 ?auto_669164 ) ) ( not ( = ?auto_669154 ?auto_669155 ) ) ( not ( = ?auto_669154 ?auto_669156 ) ) ( not ( = ?auto_669154 ?auto_669157 ) ) ( not ( = ?auto_669154 ?auto_669158 ) ) ( not ( = ?auto_669154 ?auto_669159 ) ) ( not ( = ?auto_669154 ?auto_669160 ) ) ( not ( = ?auto_669154 ?auto_669161 ) ) ( not ( = ?auto_669154 ?auto_669162 ) ) ( not ( = ?auto_669154 ?auto_669163 ) ) ( not ( = ?auto_669154 ?auto_669164 ) ) ( not ( = ?auto_669155 ?auto_669156 ) ) ( not ( = ?auto_669155 ?auto_669157 ) ) ( not ( = ?auto_669155 ?auto_669158 ) ) ( not ( = ?auto_669155 ?auto_669159 ) ) ( not ( = ?auto_669155 ?auto_669160 ) ) ( not ( = ?auto_669155 ?auto_669161 ) ) ( not ( = ?auto_669155 ?auto_669162 ) ) ( not ( = ?auto_669155 ?auto_669163 ) ) ( not ( = ?auto_669155 ?auto_669164 ) ) ( not ( = ?auto_669156 ?auto_669157 ) ) ( not ( = ?auto_669156 ?auto_669158 ) ) ( not ( = ?auto_669156 ?auto_669159 ) ) ( not ( = ?auto_669156 ?auto_669160 ) ) ( not ( = ?auto_669156 ?auto_669161 ) ) ( not ( = ?auto_669156 ?auto_669162 ) ) ( not ( = ?auto_669156 ?auto_669163 ) ) ( not ( = ?auto_669156 ?auto_669164 ) ) ( not ( = ?auto_669157 ?auto_669158 ) ) ( not ( = ?auto_669157 ?auto_669159 ) ) ( not ( = ?auto_669157 ?auto_669160 ) ) ( not ( = ?auto_669157 ?auto_669161 ) ) ( not ( = ?auto_669157 ?auto_669162 ) ) ( not ( = ?auto_669157 ?auto_669163 ) ) ( not ( = ?auto_669157 ?auto_669164 ) ) ( not ( = ?auto_669158 ?auto_669159 ) ) ( not ( = ?auto_669158 ?auto_669160 ) ) ( not ( = ?auto_669158 ?auto_669161 ) ) ( not ( = ?auto_669158 ?auto_669162 ) ) ( not ( = ?auto_669158 ?auto_669163 ) ) ( not ( = ?auto_669158 ?auto_669164 ) ) ( not ( = ?auto_669159 ?auto_669160 ) ) ( not ( = ?auto_669159 ?auto_669161 ) ) ( not ( = ?auto_669159 ?auto_669162 ) ) ( not ( = ?auto_669159 ?auto_669163 ) ) ( not ( = ?auto_669159 ?auto_669164 ) ) ( not ( = ?auto_669160 ?auto_669161 ) ) ( not ( = ?auto_669160 ?auto_669162 ) ) ( not ( = ?auto_669160 ?auto_669163 ) ) ( not ( = ?auto_669160 ?auto_669164 ) ) ( not ( = ?auto_669161 ?auto_669162 ) ) ( not ( = ?auto_669161 ?auto_669163 ) ) ( not ( = ?auto_669161 ?auto_669164 ) ) ( not ( = ?auto_669162 ?auto_669163 ) ) ( not ( = ?auto_669162 ?auto_669164 ) ) ( not ( = ?auto_669163 ?auto_669164 ) ) ( ON ?auto_669162 ?auto_669163 ) ( ON ?auto_669161 ?auto_669162 ) ( ON ?auto_669160 ?auto_669161 ) ( ON ?auto_669159 ?auto_669160 ) ( ON ?auto_669158 ?auto_669159 ) ( ON ?auto_669157 ?auto_669158 ) ( ON ?auto_669156 ?auto_669157 ) ( ON ?auto_669155 ?auto_669156 ) ( ON ?auto_669154 ?auto_669155 ) ( ON ?auto_669153 ?auto_669154 ) ( CLEAR ?auto_669151 ) ( ON ?auto_669152 ?auto_669153 ) ( CLEAR ?auto_669152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_669150 ?auto_669151 ?auto_669152 )
      ( MAKE-14PILE ?auto_669150 ?auto_669151 ?auto_669152 ?auto_669153 ?auto_669154 ?auto_669155 ?auto_669156 ?auto_669157 ?auto_669158 ?auto_669159 ?auto_669160 ?auto_669161 ?auto_669162 ?auto_669163 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_669208 - BLOCK
      ?auto_669209 - BLOCK
      ?auto_669210 - BLOCK
      ?auto_669211 - BLOCK
      ?auto_669212 - BLOCK
      ?auto_669213 - BLOCK
      ?auto_669214 - BLOCK
      ?auto_669215 - BLOCK
      ?auto_669216 - BLOCK
      ?auto_669217 - BLOCK
      ?auto_669218 - BLOCK
      ?auto_669219 - BLOCK
      ?auto_669220 - BLOCK
      ?auto_669221 - BLOCK
    )
    :vars
    (
      ?auto_669222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669221 ?auto_669222 ) ( ON-TABLE ?auto_669208 ) ( not ( = ?auto_669208 ?auto_669209 ) ) ( not ( = ?auto_669208 ?auto_669210 ) ) ( not ( = ?auto_669208 ?auto_669211 ) ) ( not ( = ?auto_669208 ?auto_669212 ) ) ( not ( = ?auto_669208 ?auto_669213 ) ) ( not ( = ?auto_669208 ?auto_669214 ) ) ( not ( = ?auto_669208 ?auto_669215 ) ) ( not ( = ?auto_669208 ?auto_669216 ) ) ( not ( = ?auto_669208 ?auto_669217 ) ) ( not ( = ?auto_669208 ?auto_669218 ) ) ( not ( = ?auto_669208 ?auto_669219 ) ) ( not ( = ?auto_669208 ?auto_669220 ) ) ( not ( = ?auto_669208 ?auto_669221 ) ) ( not ( = ?auto_669208 ?auto_669222 ) ) ( not ( = ?auto_669209 ?auto_669210 ) ) ( not ( = ?auto_669209 ?auto_669211 ) ) ( not ( = ?auto_669209 ?auto_669212 ) ) ( not ( = ?auto_669209 ?auto_669213 ) ) ( not ( = ?auto_669209 ?auto_669214 ) ) ( not ( = ?auto_669209 ?auto_669215 ) ) ( not ( = ?auto_669209 ?auto_669216 ) ) ( not ( = ?auto_669209 ?auto_669217 ) ) ( not ( = ?auto_669209 ?auto_669218 ) ) ( not ( = ?auto_669209 ?auto_669219 ) ) ( not ( = ?auto_669209 ?auto_669220 ) ) ( not ( = ?auto_669209 ?auto_669221 ) ) ( not ( = ?auto_669209 ?auto_669222 ) ) ( not ( = ?auto_669210 ?auto_669211 ) ) ( not ( = ?auto_669210 ?auto_669212 ) ) ( not ( = ?auto_669210 ?auto_669213 ) ) ( not ( = ?auto_669210 ?auto_669214 ) ) ( not ( = ?auto_669210 ?auto_669215 ) ) ( not ( = ?auto_669210 ?auto_669216 ) ) ( not ( = ?auto_669210 ?auto_669217 ) ) ( not ( = ?auto_669210 ?auto_669218 ) ) ( not ( = ?auto_669210 ?auto_669219 ) ) ( not ( = ?auto_669210 ?auto_669220 ) ) ( not ( = ?auto_669210 ?auto_669221 ) ) ( not ( = ?auto_669210 ?auto_669222 ) ) ( not ( = ?auto_669211 ?auto_669212 ) ) ( not ( = ?auto_669211 ?auto_669213 ) ) ( not ( = ?auto_669211 ?auto_669214 ) ) ( not ( = ?auto_669211 ?auto_669215 ) ) ( not ( = ?auto_669211 ?auto_669216 ) ) ( not ( = ?auto_669211 ?auto_669217 ) ) ( not ( = ?auto_669211 ?auto_669218 ) ) ( not ( = ?auto_669211 ?auto_669219 ) ) ( not ( = ?auto_669211 ?auto_669220 ) ) ( not ( = ?auto_669211 ?auto_669221 ) ) ( not ( = ?auto_669211 ?auto_669222 ) ) ( not ( = ?auto_669212 ?auto_669213 ) ) ( not ( = ?auto_669212 ?auto_669214 ) ) ( not ( = ?auto_669212 ?auto_669215 ) ) ( not ( = ?auto_669212 ?auto_669216 ) ) ( not ( = ?auto_669212 ?auto_669217 ) ) ( not ( = ?auto_669212 ?auto_669218 ) ) ( not ( = ?auto_669212 ?auto_669219 ) ) ( not ( = ?auto_669212 ?auto_669220 ) ) ( not ( = ?auto_669212 ?auto_669221 ) ) ( not ( = ?auto_669212 ?auto_669222 ) ) ( not ( = ?auto_669213 ?auto_669214 ) ) ( not ( = ?auto_669213 ?auto_669215 ) ) ( not ( = ?auto_669213 ?auto_669216 ) ) ( not ( = ?auto_669213 ?auto_669217 ) ) ( not ( = ?auto_669213 ?auto_669218 ) ) ( not ( = ?auto_669213 ?auto_669219 ) ) ( not ( = ?auto_669213 ?auto_669220 ) ) ( not ( = ?auto_669213 ?auto_669221 ) ) ( not ( = ?auto_669213 ?auto_669222 ) ) ( not ( = ?auto_669214 ?auto_669215 ) ) ( not ( = ?auto_669214 ?auto_669216 ) ) ( not ( = ?auto_669214 ?auto_669217 ) ) ( not ( = ?auto_669214 ?auto_669218 ) ) ( not ( = ?auto_669214 ?auto_669219 ) ) ( not ( = ?auto_669214 ?auto_669220 ) ) ( not ( = ?auto_669214 ?auto_669221 ) ) ( not ( = ?auto_669214 ?auto_669222 ) ) ( not ( = ?auto_669215 ?auto_669216 ) ) ( not ( = ?auto_669215 ?auto_669217 ) ) ( not ( = ?auto_669215 ?auto_669218 ) ) ( not ( = ?auto_669215 ?auto_669219 ) ) ( not ( = ?auto_669215 ?auto_669220 ) ) ( not ( = ?auto_669215 ?auto_669221 ) ) ( not ( = ?auto_669215 ?auto_669222 ) ) ( not ( = ?auto_669216 ?auto_669217 ) ) ( not ( = ?auto_669216 ?auto_669218 ) ) ( not ( = ?auto_669216 ?auto_669219 ) ) ( not ( = ?auto_669216 ?auto_669220 ) ) ( not ( = ?auto_669216 ?auto_669221 ) ) ( not ( = ?auto_669216 ?auto_669222 ) ) ( not ( = ?auto_669217 ?auto_669218 ) ) ( not ( = ?auto_669217 ?auto_669219 ) ) ( not ( = ?auto_669217 ?auto_669220 ) ) ( not ( = ?auto_669217 ?auto_669221 ) ) ( not ( = ?auto_669217 ?auto_669222 ) ) ( not ( = ?auto_669218 ?auto_669219 ) ) ( not ( = ?auto_669218 ?auto_669220 ) ) ( not ( = ?auto_669218 ?auto_669221 ) ) ( not ( = ?auto_669218 ?auto_669222 ) ) ( not ( = ?auto_669219 ?auto_669220 ) ) ( not ( = ?auto_669219 ?auto_669221 ) ) ( not ( = ?auto_669219 ?auto_669222 ) ) ( not ( = ?auto_669220 ?auto_669221 ) ) ( not ( = ?auto_669220 ?auto_669222 ) ) ( not ( = ?auto_669221 ?auto_669222 ) ) ( ON ?auto_669220 ?auto_669221 ) ( ON ?auto_669219 ?auto_669220 ) ( ON ?auto_669218 ?auto_669219 ) ( ON ?auto_669217 ?auto_669218 ) ( ON ?auto_669216 ?auto_669217 ) ( ON ?auto_669215 ?auto_669216 ) ( ON ?auto_669214 ?auto_669215 ) ( ON ?auto_669213 ?auto_669214 ) ( ON ?auto_669212 ?auto_669213 ) ( ON ?auto_669211 ?auto_669212 ) ( ON ?auto_669210 ?auto_669211 ) ( CLEAR ?auto_669208 ) ( ON ?auto_669209 ?auto_669210 ) ( CLEAR ?auto_669209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_669208 ?auto_669209 )
      ( MAKE-14PILE ?auto_669208 ?auto_669209 ?auto_669210 ?auto_669211 ?auto_669212 ?auto_669213 ?auto_669214 ?auto_669215 ?auto_669216 ?auto_669217 ?auto_669218 ?auto_669219 ?auto_669220 ?auto_669221 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_669266 - BLOCK
      ?auto_669267 - BLOCK
      ?auto_669268 - BLOCK
      ?auto_669269 - BLOCK
      ?auto_669270 - BLOCK
      ?auto_669271 - BLOCK
      ?auto_669272 - BLOCK
      ?auto_669273 - BLOCK
      ?auto_669274 - BLOCK
      ?auto_669275 - BLOCK
      ?auto_669276 - BLOCK
      ?auto_669277 - BLOCK
      ?auto_669278 - BLOCK
      ?auto_669279 - BLOCK
    )
    :vars
    (
      ?auto_669280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669279 ?auto_669280 ) ( not ( = ?auto_669266 ?auto_669267 ) ) ( not ( = ?auto_669266 ?auto_669268 ) ) ( not ( = ?auto_669266 ?auto_669269 ) ) ( not ( = ?auto_669266 ?auto_669270 ) ) ( not ( = ?auto_669266 ?auto_669271 ) ) ( not ( = ?auto_669266 ?auto_669272 ) ) ( not ( = ?auto_669266 ?auto_669273 ) ) ( not ( = ?auto_669266 ?auto_669274 ) ) ( not ( = ?auto_669266 ?auto_669275 ) ) ( not ( = ?auto_669266 ?auto_669276 ) ) ( not ( = ?auto_669266 ?auto_669277 ) ) ( not ( = ?auto_669266 ?auto_669278 ) ) ( not ( = ?auto_669266 ?auto_669279 ) ) ( not ( = ?auto_669266 ?auto_669280 ) ) ( not ( = ?auto_669267 ?auto_669268 ) ) ( not ( = ?auto_669267 ?auto_669269 ) ) ( not ( = ?auto_669267 ?auto_669270 ) ) ( not ( = ?auto_669267 ?auto_669271 ) ) ( not ( = ?auto_669267 ?auto_669272 ) ) ( not ( = ?auto_669267 ?auto_669273 ) ) ( not ( = ?auto_669267 ?auto_669274 ) ) ( not ( = ?auto_669267 ?auto_669275 ) ) ( not ( = ?auto_669267 ?auto_669276 ) ) ( not ( = ?auto_669267 ?auto_669277 ) ) ( not ( = ?auto_669267 ?auto_669278 ) ) ( not ( = ?auto_669267 ?auto_669279 ) ) ( not ( = ?auto_669267 ?auto_669280 ) ) ( not ( = ?auto_669268 ?auto_669269 ) ) ( not ( = ?auto_669268 ?auto_669270 ) ) ( not ( = ?auto_669268 ?auto_669271 ) ) ( not ( = ?auto_669268 ?auto_669272 ) ) ( not ( = ?auto_669268 ?auto_669273 ) ) ( not ( = ?auto_669268 ?auto_669274 ) ) ( not ( = ?auto_669268 ?auto_669275 ) ) ( not ( = ?auto_669268 ?auto_669276 ) ) ( not ( = ?auto_669268 ?auto_669277 ) ) ( not ( = ?auto_669268 ?auto_669278 ) ) ( not ( = ?auto_669268 ?auto_669279 ) ) ( not ( = ?auto_669268 ?auto_669280 ) ) ( not ( = ?auto_669269 ?auto_669270 ) ) ( not ( = ?auto_669269 ?auto_669271 ) ) ( not ( = ?auto_669269 ?auto_669272 ) ) ( not ( = ?auto_669269 ?auto_669273 ) ) ( not ( = ?auto_669269 ?auto_669274 ) ) ( not ( = ?auto_669269 ?auto_669275 ) ) ( not ( = ?auto_669269 ?auto_669276 ) ) ( not ( = ?auto_669269 ?auto_669277 ) ) ( not ( = ?auto_669269 ?auto_669278 ) ) ( not ( = ?auto_669269 ?auto_669279 ) ) ( not ( = ?auto_669269 ?auto_669280 ) ) ( not ( = ?auto_669270 ?auto_669271 ) ) ( not ( = ?auto_669270 ?auto_669272 ) ) ( not ( = ?auto_669270 ?auto_669273 ) ) ( not ( = ?auto_669270 ?auto_669274 ) ) ( not ( = ?auto_669270 ?auto_669275 ) ) ( not ( = ?auto_669270 ?auto_669276 ) ) ( not ( = ?auto_669270 ?auto_669277 ) ) ( not ( = ?auto_669270 ?auto_669278 ) ) ( not ( = ?auto_669270 ?auto_669279 ) ) ( not ( = ?auto_669270 ?auto_669280 ) ) ( not ( = ?auto_669271 ?auto_669272 ) ) ( not ( = ?auto_669271 ?auto_669273 ) ) ( not ( = ?auto_669271 ?auto_669274 ) ) ( not ( = ?auto_669271 ?auto_669275 ) ) ( not ( = ?auto_669271 ?auto_669276 ) ) ( not ( = ?auto_669271 ?auto_669277 ) ) ( not ( = ?auto_669271 ?auto_669278 ) ) ( not ( = ?auto_669271 ?auto_669279 ) ) ( not ( = ?auto_669271 ?auto_669280 ) ) ( not ( = ?auto_669272 ?auto_669273 ) ) ( not ( = ?auto_669272 ?auto_669274 ) ) ( not ( = ?auto_669272 ?auto_669275 ) ) ( not ( = ?auto_669272 ?auto_669276 ) ) ( not ( = ?auto_669272 ?auto_669277 ) ) ( not ( = ?auto_669272 ?auto_669278 ) ) ( not ( = ?auto_669272 ?auto_669279 ) ) ( not ( = ?auto_669272 ?auto_669280 ) ) ( not ( = ?auto_669273 ?auto_669274 ) ) ( not ( = ?auto_669273 ?auto_669275 ) ) ( not ( = ?auto_669273 ?auto_669276 ) ) ( not ( = ?auto_669273 ?auto_669277 ) ) ( not ( = ?auto_669273 ?auto_669278 ) ) ( not ( = ?auto_669273 ?auto_669279 ) ) ( not ( = ?auto_669273 ?auto_669280 ) ) ( not ( = ?auto_669274 ?auto_669275 ) ) ( not ( = ?auto_669274 ?auto_669276 ) ) ( not ( = ?auto_669274 ?auto_669277 ) ) ( not ( = ?auto_669274 ?auto_669278 ) ) ( not ( = ?auto_669274 ?auto_669279 ) ) ( not ( = ?auto_669274 ?auto_669280 ) ) ( not ( = ?auto_669275 ?auto_669276 ) ) ( not ( = ?auto_669275 ?auto_669277 ) ) ( not ( = ?auto_669275 ?auto_669278 ) ) ( not ( = ?auto_669275 ?auto_669279 ) ) ( not ( = ?auto_669275 ?auto_669280 ) ) ( not ( = ?auto_669276 ?auto_669277 ) ) ( not ( = ?auto_669276 ?auto_669278 ) ) ( not ( = ?auto_669276 ?auto_669279 ) ) ( not ( = ?auto_669276 ?auto_669280 ) ) ( not ( = ?auto_669277 ?auto_669278 ) ) ( not ( = ?auto_669277 ?auto_669279 ) ) ( not ( = ?auto_669277 ?auto_669280 ) ) ( not ( = ?auto_669278 ?auto_669279 ) ) ( not ( = ?auto_669278 ?auto_669280 ) ) ( not ( = ?auto_669279 ?auto_669280 ) ) ( ON ?auto_669278 ?auto_669279 ) ( ON ?auto_669277 ?auto_669278 ) ( ON ?auto_669276 ?auto_669277 ) ( ON ?auto_669275 ?auto_669276 ) ( ON ?auto_669274 ?auto_669275 ) ( ON ?auto_669273 ?auto_669274 ) ( ON ?auto_669272 ?auto_669273 ) ( ON ?auto_669271 ?auto_669272 ) ( ON ?auto_669270 ?auto_669271 ) ( ON ?auto_669269 ?auto_669270 ) ( ON ?auto_669268 ?auto_669269 ) ( ON ?auto_669267 ?auto_669268 ) ( ON ?auto_669266 ?auto_669267 ) ( CLEAR ?auto_669266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_669266 )
      ( MAKE-14PILE ?auto_669266 ?auto_669267 ?auto_669268 ?auto_669269 ?auto_669270 ?auto_669271 ?auto_669272 ?auto_669273 ?auto_669274 ?auto_669275 ?auto_669276 ?auto_669277 ?auto_669278 ?auto_669279 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669325 - BLOCK
      ?auto_669326 - BLOCK
      ?auto_669327 - BLOCK
      ?auto_669328 - BLOCK
      ?auto_669329 - BLOCK
      ?auto_669330 - BLOCK
      ?auto_669331 - BLOCK
      ?auto_669332 - BLOCK
      ?auto_669333 - BLOCK
      ?auto_669334 - BLOCK
      ?auto_669335 - BLOCK
      ?auto_669336 - BLOCK
      ?auto_669337 - BLOCK
      ?auto_669338 - BLOCK
      ?auto_669339 - BLOCK
    )
    :vars
    (
      ?auto_669340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_669338 ) ( ON ?auto_669339 ?auto_669340 ) ( CLEAR ?auto_669339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_669325 ) ( ON ?auto_669326 ?auto_669325 ) ( ON ?auto_669327 ?auto_669326 ) ( ON ?auto_669328 ?auto_669327 ) ( ON ?auto_669329 ?auto_669328 ) ( ON ?auto_669330 ?auto_669329 ) ( ON ?auto_669331 ?auto_669330 ) ( ON ?auto_669332 ?auto_669331 ) ( ON ?auto_669333 ?auto_669332 ) ( ON ?auto_669334 ?auto_669333 ) ( ON ?auto_669335 ?auto_669334 ) ( ON ?auto_669336 ?auto_669335 ) ( ON ?auto_669337 ?auto_669336 ) ( ON ?auto_669338 ?auto_669337 ) ( not ( = ?auto_669325 ?auto_669326 ) ) ( not ( = ?auto_669325 ?auto_669327 ) ) ( not ( = ?auto_669325 ?auto_669328 ) ) ( not ( = ?auto_669325 ?auto_669329 ) ) ( not ( = ?auto_669325 ?auto_669330 ) ) ( not ( = ?auto_669325 ?auto_669331 ) ) ( not ( = ?auto_669325 ?auto_669332 ) ) ( not ( = ?auto_669325 ?auto_669333 ) ) ( not ( = ?auto_669325 ?auto_669334 ) ) ( not ( = ?auto_669325 ?auto_669335 ) ) ( not ( = ?auto_669325 ?auto_669336 ) ) ( not ( = ?auto_669325 ?auto_669337 ) ) ( not ( = ?auto_669325 ?auto_669338 ) ) ( not ( = ?auto_669325 ?auto_669339 ) ) ( not ( = ?auto_669325 ?auto_669340 ) ) ( not ( = ?auto_669326 ?auto_669327 ) ) ( not ( = ?auto_669326 ?auto_669328 ) ) ( not ( = ?auto_669326 ?auto_669329 ) ) ( not ( = ?auto_669326 ?auto_669330 ) ) ( not ( = ?auto_669326 ?auto_669331 ) ) ( not ( = ?auto_669326 ?auto_669332 ) ) ( not ( = ?auto_669326 ?auto_669333 ) ) ( not ( = ?auto_669326 ?auto_669334 ) ) ( not ( = ?auto_669326 ?auto_669335 ) ) ( not ( = ?auto_669326 ?auto_669336 ) ) ( not ( = ?auto_669326 ?auto_669337 ) ) ( not ( = ?auto_669326 ?auto_669338 ) ) ( not ( = ?auto_669326 ?auto_669339 ) ) ( not ( = ?auto_669326 ?auto_669340 ) ) ( not ( = ?auto_669327 ?auto_669328 ) ) ( not ( = ?auto_669327 ?auto_669329 ) ) ( not ( = ?auto_669327 ?auto_669330 ) ) ( not ( = ?auto_669327 ?auto_669331 ) ) ( not ( = ?auto_669327 ?auto_669332 ) ) ( not ( = ?auto_669327 ?auto_669333 ) ) ( not ( = ?auto_669327 ?auto_669334 ) ) ( not ( = ?auto_669327 ?auto_669335 ) ) ( not ( = ?auto_669327 ?auto_669336 ) ) ( not ( = ?auto_669327 ?auto_669337 ) ) ( not ( = ?auto_669327 ?auto_669338 ) ) ( not ( = ?auto_669327 ?auto_669339 ) ) ( not ( = ?auto_669327 ?auto_669340 ) ) ( not ( = ?auto_669328 ?auto_669329 ) ) ( not ( = ?auto_669328 ?auto_669330 ) ) ( not ( = ?auto_669328 ?auto_669331 ) ) ( not ( = ?auto_669328 ?auto_669332 ) ) ( not ( = ?auto_669328 ?auto_669333 ) ) ( not ( = ?auto_669328 ?auto_669334 ) ) ( not ( = ?auto_669328 ?auto_669335 ) ) ( not ( = ?auto_669328 ?auto_669336 ) ) ( not ( = ?auto_669328 ?auto_669337 ) ) ( not ( = ?auto_669328 ?auto_669338 ) ) ( not ( = ?auto_669328 ?auto_669339 ) ) ( not ( = ?auto_669328 ?auto_669340 ) ) ( not ( = ?auto_669329 ?auto_669330 ) ) ( not ( = ?auto_669329 ?auto_669331 ) ) ( not ( = ?auto_669329 ?auto_669332 ) ) ( not ( = ?auto_669329 ?auto_669333 ) ) ( not ( = ?auto_669329 ?auto_669334 ) ) ( not ( = ?auto_669329 ?auto_669335 ) ) ( not ( = ?auto_669329 ?auto_669336 ) ) ( not ( = ?auto_669329 ?auto_669337 ) ) ( not ( = ?auto_669329 ?auto_669338 ) ) ( not ( = ?auto_669329 ?auto_669339 ) ) ( not ( = ?auto_669329 ?auto_669340 ) ) ( not ( = ?auto_669330 ?auto_669331 ) ) ( not ( = ?auto_669330 ?auto_669332 ) ) ( not ( = ?auto_669330 ?auto_669333 ) ) ( not ( = ?auto_669330 ?auto_669334 ) ) ( not ( = ?auto_669330 ?auto_669335 ) ) ( not ( = ?auto_669330 ?auto_669336 ) ) ( not ( = ?auto_669330 ?auto_669337 ) ) ( not ( = ?auto_669330 ?auto_669338 ) ) ( not ( = ?auto_669330 ?auto_669339 ) ) ( not ( = ?auto_669330 ?auto_669340 ) ) ( not ( = ?auto_669331 ?auto_669332 ) ) ( not ( = ?auto_669331 ?auto_669333 ) ) ( not ( = ?auto_669331 ?auto_669334 ) ) ( not ( = ?auto_669331 ?auto_669335 ) ) ( not ( = ?auto_669331 ?auto_669336 ) ) ( not ( = ?auto_669331 ?auto_669337 ) ) ( not ( = ?auto_669331 ?auto_669338 ) ) ( not ( = ?auto_669331 ?auto_669339 ) ) ( not ( = ?auto_669331 ?auto_669340 ) ) ( not ( = ?auto_669332 ?auto_669333 ) ) ( not ( = ?auto_669332 ?auto_669334 ) ) ( not ( = ?auto_669332 ?auto_669335 ) ) ( not ( = ?auto_669332 ?auto_669336 ) ) ( not ( = ?auto_669332 ?auto_669337 ) ) ( not ( = ?auto_669332 ?auto_669338 ) ) ( not ( = ?auto_669332 ?auto_669339 ) ) ( not ( = ?auto_669332 ?auto_669340 ) ) ( not ( = ?auto_669333 ?auto_669334 ) ) ( not ( = ?auto_669333 ?auto_669335 ) ) ( not ( = ?auto_669333 ?auto_669336 ) ) ( not ( = ?auto_669333 ?auto_669337 ) ) ( not ( = ?auto_669333 ?auto_669338 ) ) ( not ( = ?auto_669333 ?auto_669339 ) ) ( not ( = ?auto_669333 ?auto_669340 ) ) ( not ( = ?auto_669334 ?auto_669335 ) ) ( not ( = ?auto_669334 ?auto_669336 ) ) ( not ( = ?auto_669334 ?auto_669337 ) ) ( not ( = ?auto_669334 ?auto_669338 ) ) ( not ( = ?auto_669334 ?auto_669339 ) ) ( not ( = ?auto_669334 ?auto_669340 ) ) ( not ( = ?auto_669335 ?auto_669336 ) ) ( not ( = ?auto_669335 ?auto_669337 ) ) ( not ( = ?auto_669335 ?auto_669338 ) ) ( not ( = ?auto_669335 ?auto_669339 ) ) ( not ( = ?auto_669335 ?auto_669340 ) ) ( not ( = ?auto_669336 ?auto_669337 ) ) ( not ( = ?auto_669336 ?auto_669338 ) ) ( not ( = ?auto_669336 ?auto_669339 ) ) ( not ( = ?auto_669336 ?auto_669340 ) ) ( not ( = ?auto_669337 ?auto_669338 ) ) ( not ( = ?auto_669337 ?auto_669339 ) ) ( not ( = ?auto_669337 ?auto_669340 ) ) ( not ( = ?auto_669338 ?auto_669339 ) ) ( not ( = ?auto_669338 ?auto_669340 ) ) ( not ( = ?auto_669339 ?auto_669340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_669339 ?auto_669340 )
      ( !STACK ?auto_669339 ?auto_669338 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669387 - BLOCK
      ?auto_669388 - BLOCK
      ?auto_669389 - BLOCK
      ?auto_669390 - BLOCK
      ?auto_669391 - BLOCK
      ?auto_669392 - BLOCK
      ?auto_669393 - BLOCK
      ?auto_669394 - BLOCK
      ?auto_669395 - BLOCK
      ?auto_669396 - BLOCK
      ?auto_669397 - BLOCK
      ?auto_669398 - BLOCK
      ?auto_669399 - BLOCK
      ?auto_669400 - BLOCK
      ?auto_669401 - BLOCK
    )
    :vars
    (
      ?auto_669402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669401 ?auto_669402 ) ( ON-TABLE ?auto_669387 ) ( ON ?auto_669388 ?auto_669387 ) ( ON ?auto_669389 ?auto_669388 ) ( ON ?auto_669390 ?auto_669389 ) ( ON ?auto_669391 ?auto_669390 ) ( ON ?auto_669392 ?auto_669391 ) ( ON ?auto_669393 ?auto_669392 ) ( ON ?auto_669394 ?auto_669393 ) ( ON ?auto_669395 ?auto_669394 ) ( ON ?auto_669396 ?auto_669395 ) ( ON ?auto_669397 ?auto_669396 ) ( ON ?auto_669398 ?auto_669397 ) ( ON ?auto_669399 ?auto_669398 ) ( not ( = ?auto_669387 ?auto_669388 ) ) ( not ( = ?auto_669387 ?auto_669389 ) ) ( not ( = ?auto_669387 ?auto_669390 ) ) ( not ( = ?auto_669387 ?auto_669391 ) ) ( not ( = ?auto_669387 ?auto_669392 ) ) ( not ( = ?auto_669387 ?auto_669393 ) ) ( not ( = ?auto_669387 ?auto_669394 ) ) ( not ( = ?auto_669387 ?auto_669395 ) ) ( not ( = ?auto_669387 ?auto_669396 ) ) ( not ( = ?auto_669387 ?auto_669397 ) ) ( not ( = ?auto_669387 ?auto_669398 ) ) ( not ( = ?auto_669387 ?auto_669399 ) ) ( not ( = ?auto_669387 ?auto_669400 ) ) ( not ( = ?auto_669387 ?auto_669401 ) ) ( not ( = ?auto_669387 ?auto_669402 ) ) ( not ( = ?auto_669388 ?auto_669389 ) ) ( not ( = ?auto_669388 ?auto_669390 ) ) ( not ( = ?auto_669388 ?auto_669391 ) ) ( not ( = ?auto_669388 ?auto_669392 ) ) ( not ( = ?auto_669388 ?auto_669393 ) ) ( not ( = ?auto_669388 ?auto_669394 ) ) ( not ( = ?auto_669388 ?auto_669395 ) ) ( not ( = ?auto_669388 ?auto_669396 ) ) ( not ( = ?auto_669388 ?auto_669397 ) ) ( not ( = ?auto_669388 ?auto_669398 ) ) ( not ( = ?auto_669388 ?auto_669399 ) ) ( not ( = ?auto_669388 ?auto_669400 ) ) ( not ( = ?auto_669388 ?auto_669401 ) ) ( not ( = ?auto_669388 ?auto_669402 ) ) ( not ( = ?auto_669389 ?auto_669390 ) ) ( not ( = ?auto_669389 ?auto_669391 ) ) ( not ( = ?auto_669389 ?auto_669392 ) ) ( not ( = ?auto_669389 ?auto_669393 ) ) ( not ( = ?auto_669389 ?auto_669394 ) ) ( not ( = ?auto_669389 ?auto_669395 ) ) ( not ( = ?auto_669389 ?auto_669396 ) ) ( not ( = ?auto_669389 ?auto_669397 ) ) ( not ( = ?auto_669389 ?auto_669398 ) ) ( not ( = ?auto_669389 ?auto_669399 ) ) ( not ( = ?auto_669389 ?auto_669400 ) ) ( not ( = ?auto_669389 ?auto_669401 ) ) ( not ( = ?auto_669389 ?auto_669402 ) ) ( not ( = ?auto_669390 ?auto_669391 ) ) ( not ( = ?auto_669390 ?auto_669392 ) ) ( not ( = ?auto_669390 ?auto_669393 ) ) ( not ( = ?auto_669390 ?auto_669394 ) ) ( not ( = ?auto_669390 ?auto_669395 ) ) ( not ( = ?auto_669390 ?auto_669396 ) ) ( not ( = ?auto_669390 ?auto_669397 ) ) ( not ( = ?auto_669390 ?auto_669398 ) ) ( not ( = ?auto_669390 ?auto_669399 ) ) ( not ( = ?auto_669390 ?auto_669400 ) ) ( not ( = ?auto_669390 ?auto_669401 ) ) ( not ( = ?auto_669390 ?auto_669402 ) ) ( not ( = ?auto_669391 ?auto_669392 ) ) ( not ( = ?auto_669391 ?auto_669393 ) ) ( not ( = ?auto_669391 ?auto_669394 ) ) ( not ( = ?auto_669391 ?auto_669395 ) ) ( not ( = ?auto_669391 ?auto_669396 ) ) ( not ( = ?auto_669391 ?auto_669397 ) ) ( not ( = ?auto_669391 ?auto_669398 ) ) ( not ( = ?auto_669391 ?auto_669399 ) ) ( not ( = ?auto_669391 ?auto_669400 ) ) ( not ( = ?auto_669391 ?auto_669401 ) ) ( not ( = ?auto_669391 ?auto_669402 ) ) ( not ( = ?auto_669392 ?auto_669393 ) ) ( not ( = ?auto_669392 ?auto_669394 ) ) ( not ( = ?auto_669392 ?auto_669395 ) ) ( not ( = ?auto_669392 ?auto_669396 ) ) ( not ( = ?auto_669392 ?auto_669397 ) ) ( not ( = ?auto_669392 ?auto_669398 ) ) ( not ( = ?auto_669392 ?auto_669399 ) ) ( not ( = ?auto_669392 ?auto_669400 ) ) ( not ( = ?auto_669392 ?auto_669401 ) ) ( not ( = ?auto_669392 ?auto_669402 ) ) ( not ( = ?auto_669393 ?auto_669394 ) ) ( not ( = ?auto_669393 ?auto_669395 ) ) ( not ( = ?auto_669393 ?auto_669396 ) ) ( not ( = ?auto_669393 ?auto_669397 ) ) ( not ( = ?auto_669393 ?auto_669398 ) ) ( not ( = ?auto_669393 ?auto_669399 ) ) ( not ( = ?auto_669393 ?auto_669400 ) ) ( not ( = ?auto_669393 ?auto_669401 ) ) ( not ( = ?auto_669393 ?auto_669402 ) ) ( not ( = ?auto_669394 ?auto_669395 ) ) ( not ( = ?auto_669394 ?auto_669396 ) ) ( not ( = ?auto_669394 ?auto_669397 ) ) ( not ( = ?auto_669394 ?auto_669398 ) ) ( not ( = ?auto_669394 ?auto_669399 ) ) ( not ( = ?auto_669394 ?auto_669400 ) ) ( not ( = ?auto_669394 ?auto_669401 ) ) ( not ( = ?auto_669394 ?auto_669402 ) ) ( not ( = ?auto_669395 ?auto_669396 ) ) ( not ( = ?auto_669395 ?auto_669397 ) ) ( not ( = ?auto_669395 ?auto_669398 ) ) ( not ( = ?auto_669395 ?auto_669399 ) ) ( not ( = ?auto_669395 ?auto_669400 ) ) ( not ( = ?auto_669395 ?auto_669401 ) ) ( not ( = ?auto_669395 ?auto_669402 ) ) ( not ( = ?auto_669396 ?auto_669397 ) ) ( not ( = ?auto_669396 ?auto_669398 ) ) ( not ( = ?auto_669396 ?auto_669399 ) ) ( not ( = ?auto_669396 ?auto_669400 ) ) ( not ( = ?auto_669396 ?auto_669401 ) ) ( not ( = ?auto_669396 ?auto_669402 ) ) ( not ( = ?auto_669397 ?auto_669398 ) ) ( not ( = ?auto_669397 ?auto_669399 ) ) ( not ( = ?auto_669397 ?auto_669400 ) ) ( not ( = ?auto_669397 ?auto_669401 ) ) ( not ( = ?auto_669397 ?auto_669402 ) ) ( not ( = ?auto_669398 ?auto_669399 ) ) ( not ( = ?auto_669398 ?auto_669400 ) ) ( not ( = ?auto_669398 ?auto_669401 ) ) ( not ( = ?auto_669398 ?auto_669402 ) ) ( not ( = ?auto_669399 ?auto_669400 ) ) ( not ( = ?auto_669399 ?auto_669401 ) ) ( not ( = ?auto_669399 ?auto_669402 ) ) ( not ( = ?auto_669400 ?auto_669401 ) ) ( not ( = ?auto_669400 ?auto_669402 ) ) ( not ( = ?auto_669401 ?auto_669402 ) ) ( CLEAR ?auto_669399 ) ( ON ?auto_669400 ?auto_669401 ) ( CLEAR ?auto_669400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_669387 ?auto_669388 ?auto_669389 ?auto_669390 ?auto_669391 ?auto_669392 ?auto_669393 ?auto_669394 ?auto_669395 ?auto_669396 ?auto_669397 ?auto_669398 ?auto_669399 ?auto_669400 )
      ( MAKE-15PILE ?auto_669387 ?auto_669388 ?auto_669389 ?auto_669390 ?auto_669391 ?auto_669392 ?auto_669393 ?auto_669394 ?auto_669395 ?auto_669396 ?auto_669397 ?auto_669398 ?auto_669399 ?auto_669400 ?auto_669401 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669449 - BLOCK
      ?auto_669450 - BLOCK
      ?auto_669451 - BLOCK
      ?auto_669452 - BLOCK
      ?auto_669453 - BLOCK
      ?auto_669454 - BLOCK
      ?auto_669455 - BLOCK
      ?auto_669456 - BLOCK
      ?auto_669457 - BLOCK
      ?auto_669458 - BLOCK
      ?auto_669459 - BLOCK
      ?auto_669460 - BLOCK
      ?auto_669461 - BLOCK
      ?auto_669462 - BLOCK
      ?auto_669463 - BLOCK
    )
    :vars
    (
      ?auto_669464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669463 ?auto_669464 ) ( ON-TABLE ?auto_669449 ) ( ON ?auto_669450 ?auto_669449 ) ( ON ?auto_669451 ?auto_669450 ) ( ON ?auto_669452 ?auto_669451 ) ( ON ?auto_669453 ?auto_669452 ) ( ON ?auto_669454 ?auto_669453 ) ( ON ?auto_669455 ?auto_669454 ) ( ON ?auto_669456 ?auto_669455 ) ( ON ?auto_669457 ?auto_669456 ) ( ON ?auto_669458 ?auto_669457 ) ( ON ?auto_669459 ?auto_669458 ) ( ON ?auto_669460 ?auto_669459 ) ( not ( = ?auto_669449 ?auto_669450 ) ) ( not ( = ?auto_669449 ?auto_669451 ) ) ( not ( = ?auto_669449 ?auto_669452 ) ) ( not ( = ?auto_669449 ?auto_669453 ) ) ( not ( = ?auto_669449 ?auto_669454 ) ) ( not ( = ?auto_669449 ?auto_669455 ) ) ( not ( = ?auto_669449 ?auto_669456 ) ) ( not ( = ?auto_669449 ?auto_669457 ) ) ( not ( = ?auto_669449 ?auto_669458 ) ) ( not ( = ?auto_669449 ?auto_669459 ) ) ( not ( = ?auto_669449 ?auto_669460 ) ) ( not ( = ?auto_669449 ?auto_669461 ) ) ( not ( = ?auto_669449 ?auto_669462 ) ) ( not ( = ?auto_669449 ?auto_669463 ) ) ( not ( = ?auto_669449 ?auto_669464 ) ) ( not ( = ?auto_669450 ?auto_669451 ) ) ( not ( = ?auto_669450 ?auto_669452 ) ) ( not ( = ?auto_669450 ?auto_669453 ) ) ( not ( = ?auto_669450 ?auto_669454 ) ) ( not ( = ?auto_669450 ?auto_669455 ) ) ( not ( = ?auto_669450 ?auto_669456 ) ) ( not ( = ?auto_669450 ?auto_669457 ) ) ( not ( = ?auto_669450 ?auto_669458 ) ) ( not ( = ?auto_669450 ?auto_669459 ) ) ( not ( = ?auto_669450 ?auto_669460 ) ) ( not ( = ?auto_669450 ?auto_669461 ) ) ( not ( = ?auto_669450 ?auto_669462 ) ) ( not ( = ?auto_669450 ?auto_669463 ) ) ( not ( = ?auto_669450 ?auto_669464 ) ) ( not ( = ?auto_669451 ?auto_669452 ) ) ( not ( = ?auto_669451 ?auto_669453 ) ) ( not ( = ?auto_669451 ?auto_669454 ) ) ( not ( = ?auto_669451 ?auto_669455 ) ) ( not ( = ?auto_669451 ?auto_669456 ) ) ( not ( = ?auto_669451 ?auto_669457 ) ) ( not ( = ?auto_669451 ?auto_669458 ) ) ( not ( = ?auto_669451 ?auto_669459 ) ) ( not ( = ?auto_669451 ?auto_669460 ) ) ( not ( = ?auto_669451 ?auto_669461 ) ) ( not ( = ?auto_669451 ?auto_669462 ) ) ( not ( = ?auto_669451 ?auto_669463 ) ) ( not ( = ?auto_669451 ?auto_669464 ) ) ( not ( = ?auto_669452 ?auto_669453 ) ) ( not ( = ?auto_669452 ?auto_669454 ) ) ( not ( = ?auto_669452 ?auto_669455 ) ) ( not ( = ?auto_669452 ?auto_669456 ) ) ( not ( = ?auto_669452 ?auto_669457 ) ) ( not ( = ?auto_669452 ?auto_669458 ) ) ( not ( = ?auto_669452 ?auto_669459 ) ) ( not ( = ?auto_669452 ?auto_669460 ) ) ( not ( = ?auto_669452 ?auto_669461 ) ) ( not ( = ?auto_669452 ?auto_669462 ) ) ( not ( = ?auto_669452 ?auto_669463 ) ) ( not ( = ?auto_669452 ?auto_669464 ) ) ( not ( = ?auto_669453 ?auto_669454 ) ) ( not ( = ?auto_669453 ?auto_669455 ) ) ( not ( = ?auto_669453 ?auto_669456 ) ) ( not ( = ?auto_669453 ?auto_669457 ) ) ( not ( = ?auto_669453 ?auto_669458 ) ) ( not ( = ?auto_669453 ?auto_669459 ) ) ( not ( = ?auto_669453 ?auto_669460 ) ) ( not ( = ?auto_669453 ?auto_669461 ) ) ( not ( = ?auto_669453 ?auto_669462 ) ) ( not ( = ?auto_669453 ?auto_669463 ) ) ( not ( = ?auto_669453 ?auto_669464 ) ) ( not ( = ?auto_669454 ?auto_669455 ) ) ( not ( = ?auto_669454 ?auto_669456 ) ) ( not ( = ?auto_669454 ?auto_669457 ) ) ( not ( = ?auto_669454 ?auto_669458 ) ) ( not ( = ?auto_669454 ?auto_669459 ) ) ( not ( = ?auto_669454 ?auto_669460 ) ) ( not ( = ?auto_669454 ?auto_669461 ) ) ( not ( = ?auto_669454 ?auto_669462 ) ) ( not ( = ?auto_669454 ?auto_669463 ) ) ( not ( = ?auto_669454 ?auto_669464 ) ) ( not ( = ?auto_669455 ?auto_669456 ) ) ( not ( = ?auto_669455 ?auto_669457 ) ) ( not ( = ?auto_669455 ?auto_669458 ) ) ( not ( = ?auto_669455 ?auto_669459 ) ) ( not ( = ?auto_669455 ?auto_669460 ) ) ( not ( = ?auto_669455 ?auto_669461 ) ) ( not ( = ?auto_669455 ?auto_669462 ) ) ( not ( = ?auto_669455 ?auto_669463 ) ) ( not ( = ?auto_669455 ?auto_669464 ) ) ( not ( = ?auto_669456 ?auto_669457 ) ) ( not ( = ?auto_669456 ?auto_669458 ) ) ( not ( = ?auto_669456 ?auto_669459 ) ) ( not ( = ?auto_669456 ?auto_669460 ) ) ( not ( = ?auto_669456 ?auto_669461 ) ) ( not ( = ?auto_669456 ?auto_669462 ) ) ( not ( = ?auto_669456 ?auto_669463 ) ) ( not ( = ?auto_669456 ?auto_669464 ) ) ( not ( = ?auto_669457 ?auto_669458 ) ) ( not ( = ?auto_669457 ?auto_669459 ) ) ( not ( = ?auto_669457 ?auto_669460 ) ) ( not ( = ?auto_669457 ?auto_669461 ) ) ( not ( = ?auto_669457 ?auto_669462 ) ) ( not ( = ?auto_669457 ?auto_669463 ) ) ( not ( = ?auto_669457 ?auto_669464 ) ) ( not ( = ?auto_669458 ?auto_669459 ) ) ( not ( = ?auto_669458 ?auto_669460 ) ) ( not ( = ?auto_669458 ?auto_669461 ) ) ( not ( = ?auto_669458 ?auto_669462 ) ) ( not ( = ?auto_669458 ?auto_669463 ) ) ( not ( = ?auto_669458 ?auto_669464 ) ) ( not ( = ?auto_669459 ?auto_669460 ) ) ( not ( = ?auto_669459 ?auto_669461 ) ) ( not ( = ?auto_669459 ?auto_669462 ) ) ( not ( = ?auto_669459 ?auto_669463 ) ) ( not ( = ?auto_669459 ?auto_669464 ) ) ( not ( = ?auto_669460 ?auto_669461 ) ) ( not ( = ?auto_669460 ?auto_669462 ) ) ( not ( = ?auto_669460 ?auto_669463 ) ) ( not ( = ?auto_669460 ?auto_669464 ) ) ( not ( = ?auto_669461 ?auto_669462 ) ) ( not ( = ?auto_669461 ?auto_669463 ) ) ( not ( = ?auto_669461 ?auto_669464 ) ) ( not ( = ?auto_669462 ?auto_669463 ) ) ( not ( = ?auto_669462 ?auto_669464 ) ) ( not ( = ?auto_669463 ?auto_669464 ) ) ( ON ?auto_669462 ?auto_669463 ) ( CLEAR ?auto_669460 ) ( ON ?auto_669461 ?auto_669462 ) ( CLEAR ?auto_669461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_669449 ?auto_669450 ?auto_669451 ?auto_669452 ?auto_669453 ?auto_669454 ?auto_669455 ?auto_669456 ?auto_669457 ?auto_669458 ?auto_669459 ?auto_669460 ?auto_669461 )
      ( MAKE-15PILE ?auto_669449 ?auto_669450 ?auto_669451 ?auto_669452 ?auto_669453 ?auto_669454 ?auto_669455 ?auto_669456 ?auto_669457 ?auto_669458 ?auto_669459 ?auto_669460 ?auto_669461 ?auto_669462 ?auto_669463 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669511 - BLOCK
      ?auto_669512 - BLOCK
      ?auto_669513 - BLOCK
      ?auto_669514 - BLOCK
      ?auto_669515 - BLOCK
      ?auto_669516 - BLOCK
      ?auto_669517 - BLOCK
      ?auto_669518 - BLOCK
      ?auto_669519 - BLOCK
      ?auto_669520 - BLOCK
      ?auto_669521 - BLOCK
      ?auto_669522 - BLOCK
      ?auto_669523 - BLOCK
      ?auto_669524 - BLOCK
      ?auto_669525 - BLOCK
    )
    :vars
    (
      ?auto_669526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669525 ?auto_669526 ) ( ON-TABLE ?auto_669511 ) ( ON ?auto_669512 ?auto_669511 ) ( ON ?auto_669513 ?auto_669512 ) ( ON ?auto_669514 ?auto_669513 ) ( ON ?auto_669515 ?auto_669514 ) ( ON ?auto_669516 ?auto_669515 ) ( ON ?auto_669517 ?auto_669516 ) ( ON ?auto_669518 ?auto_669517 ) ( ON ?auto_669519 ?auto_669518 ) ( ON ?auto_669520 ?auto_669519 ) ( ON ?auto_669521 ?auto_669520 ) ( not ( = ?auto_669511 ?auto_669512 ) ) ( not ( = ?auto_669511 ?auto_669513 ) ) ( not ( = ?auto_669511 ?auto_669514 ) ) ( not ( = ?auto_669511 ?auto_669515 ) ) ( not ( = ?auto_669511 ?auto_669516 ) ) ( not ( = ?auto_669511 ?auto_669517 ) ) ( not ( = ?auto_669511 ?auto_669518 ) ) ( not ( = ?auto_669511 ?auto_669519 ) ) ( not ( = ?auto_669511 ?auto_669520 ) ) ( not ( = ?auto_669511 ?auto_669521 ) ) ( not ( = ?auto_669511 ?auto_669522 ) ) ( not ( = ?auto_669511 ?auto_669523 ) ) ( not ( = ?auto_669511 ?auto_669524 ) ) ( not ( = ?auto_669511 ?auto_669525 ) ) ( not ( = ?auto_669511 ?auto_669526 ) ) ( not ( = ?auto_669512 ?auto_669513 ) ) ( not ( = ?auto_669512 ?auto_669514 ) ) ( not ( = ?auto_669512 ?auto_669515 ) ) ( not ( = ?auto_669512 ?auto_669516 ) ) ( not ( = ?auto_669512 ?auto_669517 ) ) ( not ( = ?auto_669512 ?auto_669518 ) ) ( not ( = ?auto_669512 ?auto_669519 ) ) ( not ( = ?auto_669512 ?auto_669520 ) ) ( not ( = ?auto_669512 ?auto_669521 ) ) ( not ( = ?auto_669512 ?auto_669522 ) ) ( not ( = ?auto_669512 ?auto_669523 ) ) ( not ( = ?auto_669512 ?auto_669524 ) ) ( not ( = ?auto_669512 ?auto_669525 ) ) ( not ( = ?auto_669512 ?auto_669526 ) ) ( not ( = ?auto_669513 ?auto_669514 ) ) ( not ( = ?auto_669513 ?auto_669515 ) ) ( not ( = ?auto_669513 ?auto_669516 ) ) ( not ( = ?auto_669513 ?auto_669517 ) ) ( not ( = ?auto_669513 ?auto_669518 ) ) ( not ( = ?auto_669513 ?auto_669519 ) ) ( not ( = ?auto_669513 ?auto_669520 ) ) ( not ( = ?auto_669513 ?auto_669521 ) ) ( not ( = ?auto_669513 ?auto_669522 ) ) ( not ( = ?auto_669513 ?auto_669523 ) ) ( not ( = ?auto_669513 ?auto_669524 ) ) ( not ( = ?auto_669513 ?auto_669525 ) ) ( not ( = ?auto_669513 ?auto_669526 ) ) ( not ( = ?auto_669514 ?auto_669515 ) ) ( not ( = ?auto_669514 ?auto_669516 ) ) ( not ( = ?auto_669514 ?auto_669517 ) ) ( not ( = ?auto_669514 ?auto_669518 ) ) ( not ( = ?auto_669514 ?auto_669519 ) ) ( not ( = ?auto_669514 ?auto_669520 ) ) ( not ( = ?auto_669514 ?auto_669521 ) ) ( not ( = ?auto_669514 ?auto_669522 ) ) ( not ( = ?auto_669514 ?auto_669523 ) ) ( not ( = ?auto_669514 ?auto_669524 ) ) ( not ( = ?auto_669514 ?auto_669525 ) ) ( not ( = ?auto_669514 ?auto_669526 ) ) ( not ( = ?auto_669515 ?auto_669516 ) ) ( not ( = ?auto_669515 ?auto_669517 ) ) ( not ( = ?auto_669515 ?auto_669518 ) ) ( not ( = ?auto_669515 ?auto_669519 ) ) ( not ( = ?auto_669515 ?auto_669520 ) ) ( not ( = ?auto_669515 ?auto_669521 ) ) ( not ( = ?auto_669515 ?auto_669522 ) ) ( not ( = ?auto_669515 ?auto_669523 ) ) ( not ( = ?auto_669515 ?auto_669524 ) ) ( not ( = ?auto_669515 ?auto_669525 ) ) ( not ( = ?auto_669515 ?auto_669526 ) ) ( not ( = ?auto_669516 ?auto_669517 ) ) ( not ( = ?auto_669516 ?auto_669518 ) ) ( not ( = ?auto_669516 ?auto_669519 ) ) ( not ( = ?auto_669516 ?auto_669520 ) ) ( not ( = ?auto_669516 ?auto_669521 ) ) ( not ( = ?auto_669516 ?auto_669522 ) ) ( not ( = ?auto_669516 ?auto_669523 ) ) ( not ( = ?auto_669516 ?auto_669524 ) ) ( not ( = ?auto_669516 ?auto_669525 ) ) ( not ( = ?auto_669516 ?auto_669526 ) ) ( not ( = ?auto_669517 ?auto_669518 ) ) ( not ( = ?auto_669517 ?auto_669519 ) ) ( not ( = ?auto_669517 ?auto_669520 ) ) ( not ( = ?auto_669517 ?auto_669521 ) ) ( not ( = ?auto_669517 ?auto_669522 ) ) ( not ( = ?auto_669517 ?auto_669523 ) ) ( not ( = ?auto_669517 ?auto_669524 ) ) ( not ( = ?auto_669517 ?auto_669525 ) ) ( not ( = ?auto_669517 ?auto_669526 ) ) ( not ( = ?auto_669518 ?auto_669519 ) ) ( not ( = ?auto_669518 ?auto_669520 ) ) ( not ( = ?auto_669518 ?auto_669521 ) ) ( not ( = ?auto_669518 ?auto_669522 ) ) ( not ( = ?auto_669518 ?auto_669523 ) ) ( not ( = ?auto_669518 ?auto_669524 ) ) ( not ( = ?auto_669518 ?auto_669525 ) ) ( not ( = ?auto_669518 ?auto_669526 ) ) ( not ( = ?auto_669519 ?auto_669520 ) ) ( not ( = ?auto_669519 ?auto_669521 ) ) ( not ( = ?auto_669519 ?auto_669522 ) ) ( not ( = ?auto_669519 ?auto_669523 ) ) ( not ( = ?auto_669519 ?auto_669524 ) ) ( not ( = ?auto_669519 ?auto_669525 ) ) ( not ( = ?auto_669519 ?auto_669526 ) ) ( not ( = ?auto_669520 ?auto_669521 ) ) ( not ( = ?auto_669520 ?auto_669522 ) ) ( not ( = ?auto_669520 ?auto_669523 ) ) ( not ( = ?auto_669520 ?auto_669524 ) ) ( not ( = ?auto_669520 ?auto_669525 ) ) ( not ( = ?auto_669520 ?auto_669526 ) ) ( not ( = ?auto_669521 ?auto_669522 ) ) ( not ( = ?auto_669521 ?auto_669523 ) ) ( not ( = ?auto_669521 ?auto_669524 ) ) ( not ( = ?auto_669521 ?auto_669525 ) ) ( not ( = ?auto_669521 ?auto_669526 ) ) ( not ( = ?auto_669522 ?auto_669523 ) ) ( not ( = ?auto_669522 ?auto_669524 ) ) ( not ( = ?auto_669522 ?auto_669525 ) ) ( not ( = ?auto_669522 ?auto_669526 ) ) ( not ( = ?auto_669523 ?auto_669524 ) ) ( not ( = ?auto_669523 ?auto_669525 ) ) ( not ( = ?auto_669523 ?auto_669526 ) ) ( not ( = ?auto_669524 ?auto_669525 ) ) ( not ( = ?auto_669524 ?auto_669526 ) ) ( not ( = ?auto_669525 ?auto_669526 ) ) ( ON ?auto_669524 ?auto_669525 ) ( ON ?auto_669523 ?auto_669524 ) ( CLEAR ?auto_669521 ) ( ON ?auto_669522 ?auto_669523 ) ( CLEAR ?auto_669522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_669511 ?auto_669512 ?auto_669513 ?auto_669514 ?auto_669515 ?auto_669516 ?auto_669517 ?auto_669518 ?auto_669519 ?auto_669520 ?auto_669521 ?auto_669522 )
      ( MAKE-15PILE ?auto_669511 ?auto_669512 ?auto_669513 ?auto_669514 ?auto_669515 ?auto_669516 ?auto_669517 ?auto_669518 ?auto_669519 ?auto_669520 ?auto_669521 ?auto_669522 ?auto_669523 ?auto_669524 ?auto_669525 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669573 - BLOCK
      ?auto_669574 - BLOCK
      ?auto_669575 - BLOCK
      ?auto_669576 - BLOCK
      ?auto_669577 - BLOCK
      ?auto_669578 - BLOCK
      ?auto_669579 - BLOCK
      ?auto_669580 - BLOCK
      ?auto_669581 - BLOCK
      ?auto_669582 - BLOCK
      ?auto_669583 - BLOCK
      ?auto_669584 - BLOCK
      ?auto_669585 - BLOCK
      ?auto_669586 - BLOCK
      ?auto_669587 - BLOCK
    )
    :vars
    (
      ?auto_669588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669587 ?auto_669588 ) ( ON-TABLE ?auto_669573 ) ( ON ?auto_669574 ?auto_669573 ) ( ON ?auto_669575 ?auto_669574 ) ( ON ?auto_669576 ?auto_669575 ) ( ON ?auto_669577 ?auto_669576 ) ( ON ?auto_669578 ?auto_669577 ) ( ON ?auto_669579 ?auto_669578 ) ( ON ?auto_669580 ?auto_669579 ) ( ON ?auto_669581 ?auto_669580 ) ( ON ?auto_669582 ?auto_669581 ) ( not ( = ?auto_669573 ?auto_669574 ) ) ( not ( = ?auto_669573 ?auto_669575 ) ) ( not ( = ?auto_669573 ?auto_669576 ) ) ( not ( = ?auto_669573 ?auto_669577 ) ) ( not ( = ?auto_669573 ?auto_669578 ) ) ( not ( = ?auto_669573 ?auto_669579 ) ) ( not ( = ?auto_669573 ?auto_669580 ) ) ( not ( = ?auto_669573 ?auto_669581 ) ) ( not ( = ?auto_669573 ?auto_669582 ) ) ( not ( = ?auto_669573 ?auto_669583 ) ) ( not ( = ?auto_669573 ?auto_669584 ) ) ( not ( = ?auto_669573 ?auto_669585 ) ) ( not ( = ?auto_669573 ?auto_669586 ) ) ( not ( = ?auto_669573 ?auto_669587 ) ) ( not ( = ?auto_669573 ?auto_669588 ) ) ( not ( = ?auto_669574 ?auto_669575 ) ) ( not ( = ?auto_669574 ?auto_669576 ) ) ( not ( = ?auto_669574 ?auto_669577 ) ) ( not ( = ?auto_669574 ?auto_669578 ) ) ( not ( = ?auto_669574 ?auto_669579 ) ) ( not ( = ?auto_669574 ?auto_669580 ) ) ( not ( = ?auto_669574 ?auto_669581 ) ) ( not ( = ?auto_669574 ?auto_669582 ) ) ( not ( = ?auto_669574 ?auto_669583 ) ) ( not ( = ?auto_669574 ?auto_669584 ) ) ( not ( = ?auto_669574 ?auto_669585 ) ) ( not ( = ?auto_669574 ?auto_669586 ) ) ( not ( = ?auto_669574 ?auto_669587 ) ) ( not ( = ?auto_669574 ?auto_669588 ) ) ( not ( = ?auto_669575 ?auto_669576 ) ) ( not ( = ?auto_669575 ?auto_669577 ) ) ( not ( = ?auto_669575 ?auto_669578 ) ) ( not ( = ?auto_669575 ?auto_669579 ) ) ( not ( = ?auto_669575 ?auto_669580 ) ) ( not ( = ?auto_669575 ?auto_669581 ) ) ( not ( = ?auto_669575 ?auto_669582 ) ) ( not ( = ?auto_669575 ?auto_669583 ) ) ( not ( = ?auto_669575 ?auto_669584 ) ) ( not ( = ?auto_669575 ?auto_669585 ) ) ( not ( = ?auto_669575 ?auto_669586 ) ) ( not ( = ?auto_669575 ?auto_669587 ) ) ( not ( = ?auto_669575 ?auto_669588 ) ) ( not ( = ?auto_669576 ?auto_669577 ) ) ( not ( = ?auto_669576 ?auto_669578 ) ) ( not ( = ?auto_669576 ?auto_669579 ) ) ( not ( = ?auto_669576 ?auto_669580 ) ) ( not ( = ?auto_669576 ?auto_669581 ) ) ( not ( = ?auto_669576 ?auto_669582 ) ) ( not ( = ?auto_669576 ?auto_669583 ) ) ( not ( = ?auto_669576 ?auto_669584 ) ) ( not ( = ?auto_669576 ?auto_669585 ) ) ( not ( = ?auto_669576 ?auto_669586 ) ) ( not ( = ?auto_669576 ?auto_669587 ) ) ( not ( = ?auto_669576 ?auto_669588 ) ) ( not ( = ?auto_669577 ?auto_669578 ) ) ( not ( = ?auto_669577 ?auto_669579 ) ) ( not ( = ?auto_669577 ?auto_669580 ) ) ( not ( = ?auto_669577 ?auto_669581 ) ) ( not ( = ?auto_669577 ?auto_669582 ) ) ( not ( = ?auto_669577 ?auto_669583 ) ) ( not ( = ?auto_669577 ?auto_669584 ) ) ( not ( = ?auto_669577 ?auto_669585 ) ) ( not ( = ?auto_669577 ?auto_669586 ) ) ( not ( = ?auto_669577 ?auto_669587 ) ) ( not ( = ?auto_669577 ?auto_669588 ) ) ( not ( = ?auto_669578 ?auto_669579 ) ) ( not ( = ?auto_669578 ?auto_669580 ) ) ( not ( = ?auto_669578 ?auto_669581 ) ) ( not ( = ?auto_669578 ?auto_669582 ) ) ( not ( = ?auto_669578 ?auto_669583 ) ) ( not ( = ?auto_669578 ?auto_669584 ) ) ( not ( = ?auto_669578 ?auto_669585 ) ) ( not ( = ?auto_669578 ?auto_669586 ) ) ( not ( = ?auto_669578 ?auto_669587 ) ) ( not ( = ?auto_669578 ?auto_669588 ) ) ( not ( = ?auto_669579 ?auto_669580 ) ) ( not ( = ?auto_669579 ?auto_669581 ) ) ( not ( = ?auto_669579 ?auto_669582 ) ) ( not ( = ?auto_669579 ?auto_669583 ) ) ( not ( = ?auto_669579 ?auto_669584 ) ) ( not ( = ?auto_669579 ?auto_669585 ) ) ( not ( = ?auto_669579 ?auto_669586 ) ) ( not ( = ?auto_669579 ?auto_669587 ) ) ( not ( = ?auto_669579 ?auto_669588 ) ) ( not ( = ?auto_669580 ?auto_669581 ) ) ( not ( = ?auto_669580 ?auto_669582 ) ) ( not ( = ?auto_669580 ?auto_669583 ) ) ( not ( = ?auto_669580 ?auto_669584 ) ) ( not ( = ?auto_669580 ?auto_669585 ) ) ( not ( = ?auto_669580 ?auto_669586 ) ) ( not ( = ?auto_669580 ?auto_669587 ) ) ( not ( = ?auto_669580 ?auto_669588 ) ) ( not ( = ?auto_669581 ?auto_669582 ) ) ( not ( = ?auto_669581 ?auto_669583 ) ) ( not ( = ?auto_669581 ?auto_669584 ) ) ( not ( = ?auto_669581 ?auto_669585 ) ) ( not ( = ?auto_669581 ?auto_669586 ) ) ( not ( = ?auto_669581 ?auto_669587 ) ) ( not ( = ?auto_669581 ?auto_669588 ) ) ( not ( = ?auto_669582 ?auto_669583 ) ) ( not ( = ?auto_669582 ?auto_669584 ) ) ( not ( = ?auto_669582 ?auto_669585 ) ) ( not ( = ?auto_669582 ?auto_669586 ) ) ( not ( = ?auto_669582 ?auto_669587 ) ) ( not ( = ?auto_669582 ?auto_669588 ) ) ( not ( = ?auto_669583 ?auto_669584 ) ) ( not ( = ?auto_669583 ?auto_669585 ) ) ( not ( = ?auto_669583 ?auto_669586 ) ) ( not ( = ?auto_669583 ?auto_669587 ) ) ( not ( = ?auto_669583 ?auto_669588 ) ) ( not ( = ?auto_669584 ?auto_669585 ) ) ( not ( = ?auto_669584 ?auto_669586 ) ) ( not ( = ?auto_669584 ?auto_669587 ) ) ( not ( = ?auto_669584 ?auto_669588 ) ) ( not ( = ?auto_669585 ?auto_669586 ) ) ( not ( = ?auto_669585 ?auto_669587 ) ) ( not ( = ?auto_669585 ?auto_669588 ) ) ( not ( = ?auto_669586 ?auto_669587 ) ) ( not ( = ?auto_669586 ?auto_669588 ) ) ( not ( = ?auto_669587 ?auto_669588 ) ) ( ON ?auto_669586 ?auto_669587 ) ( ON ?auto_669585 ?auto_669586 ) ( ON ?auto_669584 ?auto_669585 ) ( CLEAR ?auto_669582 ) ( ON ?auto_669583 ?auto_669584 ) ( CLEAR ?auto_669583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_669573 ?auto_669574 ?auto_669575 ?auto_669576 ?auto_669577 ?auto_669578 ?auto_669579 ?auto_669580 ?auto_669581 ?auto_669582 ?auto_669583 )
      ( MAKE-15PILE ?auto_669573 ?auto_669574 ?auto_669575 ?auto_669576 ?auto_669577 ?auto_669578 ?auto_669579 ?auto_669580 ?auto_669581 ?auto_669582 ?auto_669583 ?auto_669584 ?auto_669585 ?auto_669586 ?auto_669587 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669635 - BLOCK
      ?auto_669636 - BLOCK
      ?auto_669637 - BLOCK
      ?auto_669638 - BLOCK
      ?auto_669639 - BLOCK
      ?auto_669640 - BLOCK
      ?auto_669641 - BLOCK
      ?auto_669642 - BLOCK
      ?auto_669643 - BLOCK
      ?auto_669644 - BLOCK
      ?auto_669645 - BLOCK
      ?auto_669646 - BLOCK
      ?auto_669647 - BLOCK
      ?auto_669648 - BLOCK
      ?auto_669649 - BLOCK
    )
    :vars
    (
      ?auto_669650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669649 ?auto_669650 ) ( ON-TABLE ?auto_669635 ) ( ON ?auto_669636 ?auto_669635 ) ( ON ?auto_669637 ?auto_669636 ) ( ON ?auto_669638 ?auto_669637 ) ( ON ?auto_669639 ?auto_669638 ) ( ON ?auto_669640 ?auto_669639 ) ( ON ?auto_669641 ?auto_669640 ) ( ON ?auto_669642 ?auto_669641 ) ( ON ?auto_669643 ?auto_669642 ) ( not ( = ?auto_669635 ?auto_669636 ) ) ( not ( = ?auto_669635 ?auto_669637 ) ) ( not ( = ?auto_669635 ?auto_669638 ) ) ( not ( = ?auto_669635 ?auto_669639 ) ) ( not ( = ?auto_669635 ?auto_669640 ) ) ( not ( = ?auto_669635 ?auto_669641 ) ) ( not ( = ?auto_669635 ?auto_669642 ) ) ( not ( = ?auto_669635 ?auto_669643 ) ) ( not ( = ?auto_669635 ?auto_669644 ) ) ( not ( = ?auto_669635 ?auto_669645 ) ) ( not ( = ?auto_669635 ?auto_669646 ) ) ( not ( = ?auto_669635 ?auto_669647 ) ) ( not ( = ?auto_669635 ?auto_669648 ) ) ( not ( = ?auto_669635 ?auto_669649 ) ) ( not ( = ?auto_669635 ?auto_669650 ) ) ( not ( = ?auto_669636 ?auto_669637 ) ) ( not ( = ?auto_669636 ?auto_669638 ) ) ( not ( = ?auto_669636 ?auto_669639 ) ) ( not ( = ?auto_669636 ?auto_669640 ) ) ( not ( = ?auto_669636 ?auto_669641 ) ) ( not ( = ?auto_669636 ?auto_669642 ) ) ( not ( = ?auto_669636 ?auto_669643 ) ) ( not ( = ?auto_669636 ?auto_669644 ) ) ( not ( = ?auto_669636 ?auto_669645 ) ) ( not ( = ?auto_669636 ?auto_669646 ) ) ( not ( = ?auto_669636 ?auto_669647 ) ) ( not ( = ?auto_669636 ?auto_669648 ) ) ( not ( = ?auto_669636 ?auto_669649 ) ) ( not ( = ?auto_669636 ?auto_669650 ) ) ( not ( = ?auto_669637 ?auto_669638 ) ) ( not ( = ?auto_669637 ?auto_669639 ) ) ( not ( = ?auto_669637 ?auto_669640 ) ) ( not ( = ?auto_669637 ?auto_669641 ) ) ( not ( = ?auto_669637 ?auto_669642 ) ) ( not ( = ?auto_669637 ?auto_669643 ) ) ( not ( = ?auto_669637 ?auto_669644 ) ) ( not ( = ?auto_669637 ?auto_669645 ) ) ( not ( = ?auto_669637 ?auto_669646 ) ) ( not ( = ?auto_669637 ?auto_669647 ) ) ( not ( = ?auto_669637 ?auto_669648 ) ) ( not ( = ?auto_669637 ?auto_669649 ) ) ( not ( = ?auto_669637 ?auto_669650 ) ) ( not ( = ?auto_669638 ?auto_669639 ) ) ( not ( = ?auto_669638 ?auto_669640 ) ) ( not ( = ?auto_669638 ?auto_669641 ) ) ( not ( = ?auto_669638 ?auto_669642 ) ) ( not ( = ?auto_669638 ?auto_669643 ) ) ( not ( = ?auto_669638 ?auto_669644 ) ) ( not ( = ?auto_669638 ?auto_669645 ) ) ( not ( = ?auto_669638 ?auto_669646 ) ) ( not ( = ?auto_669638 ?auto_669647 ) ) ( not ( = ?auto_669638 ?auto_669648 ) ) ( not ( = ?auto_669638 ?auto_669649 ) ) ( not ( = ?auto_669638 ?auto_669650 ) ) ( not ( = ?auto_669639 ?auto_669640 ) ) ( not ( = ?auto_669639 ?auto_669641 ) ) ( not ( = ?auto_669639 ?auto_669642 ) ) ( not ( = ?auto_669639 ?auto_669643 ) ) ( not ( = ?auto_669639 ?auto_669644 ) ) ( not ( = ?auto_669639 ?auto_669645 ) ) ( not ( = ?auto_669639 ?auto_669646 ) ) ( not ( = ?auto_669639 ?auto_669647 ) ) ( not ( = ?auto_669639 ?auto_669648 ) ) ( not ( = ?auto_669639 ?auto_669649 ) ) ( not ( = ?auto_669639 ?auto_669650 ) ) ( not ( = ?auto_669640 ?auto_669641 ) ) ( not ( = ?auto_669640 ?auto_669642 ) ) ( not ( = ?auto_669640 ?auto_669643 ) ) ( not ( = ?auto_669640 ?auto_669644 ) ) ( not ( = ?auto_669640 ?auto_669645 ) ) ( not ( = ?auto_669640 ?auto_669646 ) ) ( not ( = ?auto_669640 ?auto_669647 ) ) ( not ( = ?auto_669640 ?auto_669648 ) ) ( not ( = ?auto_669640 ?auto_669649 ) ) ( not ( = ?auto_669640 ?auto_669650 ) ) ( not ( = ?auto_669641 ?auto_669642 ) ) ( not ( = ?auto_669641 ?auto_669643 ) ) ( not ( = ?auto_669641 ?auto_669644 ) ) ( not ( = ?auto_669641 ?auto_669645 ) ) ( not ( = ?auto_669641 ?auto_669646 ) ) ( not ( = ?auto_669641 ?auto_669647 ) ) ( not ( = ?auto_669641 ?auto_669648 ) ) ( not ( = ?auto_669641 ?auto_669649 ) ) ( not ( = ?auto_669641 ?auto_669650 ) ) ( not ( = ?auto_669642 ?auto_669643 ) ) ( not ( = ?auto_669642 ?auto_669644 ) ) ( not ( = ?auto_669642 ?auto_669645 ) ) ( not ( = ?auto_669642 ?auto_669646 ) ) ( not ( = ?auto_669642 ?auto_669647 ) ) ( not ( = ?auto_669642 ?auto_669648 ) ) ( not ( = ?auto_669642 ?auto_669649 ) ) ( not ( = ?auto_669642 ?auto_669650 ) ) ( not ( = ?auto_669643 ?auto_669644 ) ) ( not ( = ?auto_669643 ?auto_669645 ) ) ( not ( = ?auto_669643 ?auto_669646 ) ) ( not ( = ?auto_669643 ?auto_669647 ) ) ( not ( = ?auto_669643 ?auto_669648 ) ) ( not ( = ?auto_669643 ?auto_669649 ) ) ( not ( = ?auto_669643 ?auto_669650 ) ) ( not ( = ?auto_669644 ?auto_669645 ) ) ( not ( = ?auto_669644 ?auto_669646 ) ) ( not ( = ?auto_669644 ?auto_669647 ) ) ( not ( = ?auto_669644 ?auto_669648 ) ) ( not ( = ?auto_669644 ?auto_669649 ) ) ( not ( = ?auto_669644 ?auto_669650 ) ) ( not ( = ?auto_669645 ?auto_669646 ) ) ( not ( = ?auto_669645 ?auto_669647 ) ) ( not ( = ?auto_669645 ?auto_669648 ) ) ( not ( = ?auto_669645 ?auto_669649 ) ) ( not ( = ?auto_669645 ?auto_669650 ) ) ( not ( = ?auto_669646 ?auto_669647 ) ) ( not ( = ?auto_669646 ?auto_669648 ) ) ( not ( = ?auto_669646 ?auto_669649 ) ) ( not ( = ?auto_669646 ?auto_669650 ) ) ( not ( = ?auto_669647 ?auto_669648 ) ) ( not ( = ?auto_669647 ?auto_669649 ) ) ( not ( = ?auto_669647 ?auto_669650 ) ) ( not ( = ?auto_669648 ?auto_669649 ) ) ( not ( = ?auto_669648 ?auto_669650 ) ) ( not ( = ?auto_669649 ?auto_669650 ) ) ( ON ?auto_669648 ?auto_669649 ) ( ON ?auto_669647 ?auto_669648 ) ( ON ?auto_669646 ?auto_669647 ) ( ON ?auto_669645 ?auto_669646 ) ( CLEAR ?auto_669643 ) ( ON ?auto_669644 ?auto_669645 ) ( CLEAR ?auto_669644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_669635 ?auto_669636 ?auto_669637 ?auto_669638 ?auto_669639 ?auto_669640 ?auto_669641 ?auto_669642 ?auto_669643 ?auto_669644 )
      ( MAKE-15PILE ?auto_669635 ?auto_669636 ?auto_669637 ?auto_669638 ?auto_669639 ?auto_669640 ?auto_669641 ?auto_669642 ?auto_669643 ?auto_669644 ?auto_669645 ?auto_669646 ?auto_669647 ?auto_669648 ?auto_669649 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669697 - BLOCK
      ?auto_669698 - BLOCK
      ?auto_669699 - BLOCK
      ?auto_669700 - BLOCK
      ?auto_669701 - BLOCK
      ?auto_669702 - BLOCK
      ?auto_669703 - BLOCK
      ?auto_669704 - BLOCK
      ?auto_669705 - BLOCK
      ?auto_669706 - BLOCK
      ?auto_669707 - BLOCK
      ?auto_669708 - BLOCK
      ?auto_669709 - BLOCK
      ?auto_669710 - BLOCK
      ?auto_669711 - BLOCK
    )
    :vars
    (
      ?auto_669712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669711 ?auto_669712 ) ( ON-TABLE ?auto_669697 ) ( ON ?auto_669698 ?auto_669697 ) ( ON ?auto_669699 ?auto_669698 ) ( ON ?auto_669700 ?auto_669699 ) ( ON ?auto_669701 ?auto_669700 ) ( ON ?auto_669702 ?auto_669701 ) ( ON ?auto_669703 ?auto_669702 ) ( ON ?auto_669704 ?auto_669703 ) ( not ( = ?auto_669697 ?auto_669698 ) ) ( not ( = ?auto_669697 ?auto_669699 ) ) ( not ( = ?auto_669697 ?auto_669700 ) ) ( not ( = ?auto_669697 ?auto_669701 ) ) ( not ( = ?auto_669697 ?auto_669702 ) ) ( not ( = ?auto_669697 ?auto_669703 ) ) ( not ( = ?auto_669697 ?auto_669704 ) ) ( not ( = ?auto_669697 ?auto_669705 ) ) ( not ( = ?auto_669697 ?auto_669706 ) ) ( not ( = ?auto_669697 ?auto_669707 ) ) ( not ( = ?auto_669697 ?auto_669708 ) ) ( not ( = ?auto_669697 ?auto_669709 ) ) ( not ( = ?auto_669697 ?auto_669710 ) ) ( not ( = ?auto_669697 ?auto_669711 ) ) ( not ( = ?auto_669697 ?auto_669712 ) ) ( not ( = ?auto_669698 ?auto_669699 ) ) ( not ( = ?auto_669698 ?auto_669700 ) ) ( not ( = ?auto_669698 ?auto_669701 ) ) ( not ( = ?auto_669698 ?auto_669702 ) ) ( not ( = ?auto_669698 ?auto_669703 ) ) ( not ( = ?auto_669698 ?auto_669704 ) ) ( not ( = ?auto_669698 ?auto_669705 ) ) ( not ( = ?auto_669698 ?auto_669706 ) ) ( not ( = ?auto_669698 ?auto_669707 ) ) ( not ( = ?auto_669698 ?auto_669708 ) ) ( not ( = ?auto_669698 ?auto_669709 ) ) ( not ( = ?auto_669698 ?auto_669710 ) ) ( not ( = ?auto_669698 ?auto_669711 ) ) ( not ( = ?auto_669698 ?auto_669712 ) ) ( not ( = ?auto_669699 ?auto_669700 ) ) ( not ( = ?auto_669699 ?auto_669701 ) ) ( not ( = ?auto_669699 ?auto_669702 ) ) ( not ( = ?auto_669699 ?auto_669703 ) ) ( not ( = ?auto_669699 ?auto_669704 ) ) ( not ( = ?auto_669699 ?auto_669705 ) ) ( not ( = ?auto_669699 ?auto_669706 ) ) ( not ( = ?auto_669699 ?auto_669707 ) ) ( not ( = ?auto_669699 ?auto_669708 ) ) ( not ( = ?auto_669699 ?auto_669709 ) ) ( not ( = ?auto_669699 ?auto_669710 ) ) ( not ( = ?auto_669699 ?auto_669711 ) ) ( not ( = ?auto_669699 ?auto_669712 ) ) ( not ( = ?auto_669700 ?auto_669701 ) ) ( not ( = ?auto_669700 ?auto_669702 ) ) ( not ( = ?auto_669700 ?auto_669703 ) ) ( not ( = ?auto_669700 ?auto_669704 ) ) ( not ( = ?auto_669700 ?auto_669705 ) ) ( not ( = ?auto_669700 ?auto_669706 ) ) ( not ( = ?auto_669700 ?auto_669707 ) ) ( not ( = ?auto_669700 ?auto_669708 ) ) ( not ( = ?auto_669700 ?auto_669709 ) ) ( not ( = ?auto_669700 ?auto_669710 ) ) ( not ( = ?auto_669700 ?auto_669711 ) ) ( not ( = ?auto_669700 ?auto_669712 ) ) ( not ( = ?auto_669701 ?auto_669702 ) ) ( not ( = ?auto_669701 ?auto_669703 ) ) ( not ( = ?auto_669701 ?auto_669704 ) ) ( not ( = ?auto_669701 ?auto_669705 ) ) ( not ( = ?auto_669701 ?auto_669706 ) ) ( not ( = ?auto_669701 ?auto_669707 ) ) ( not ( = ?auto_669701 ?auto_669708 ) ) ( not ( = ?auto_669701 ?auto_669709 ) ) ( not ( = ?auto_669701 ?auto_669710 ) ) ( not ( = ?auto_669701 ?auto_669711 ) ) ( not ( = ?auto_669701 ?auto_669712 ) ) ( not ( = ?auto_669702 ?auto_669703 ) ) ( not ( = ?auto_669702 ?auto_669704 ) ) ( not ( = ?auto_669702 ?auto_669705 ) ) ( not ( = ?auto_669702 ?auto_669706 ) ) ( not ( = ?auto_669702 ?auto_669707 ) ) ( not ( = ?auto_669702 ?auto_669708 ) ) ( not ( = ?auto_669702 ?auto_669709 ) ) ( not ( = ?auto_669702 ?auto_669710 ) ) ( not ( = ?auto_669702 ?auto_669711 ) ) ( not ( = ?auto_669702 ?auto_669712 ) ) ( not ( = ?auto_669703 ?auto_669704 ) ) ( not ( = ?auto_669703 ?auto_669705 ) ) ( not ( = ?auto_669703 ?auto_669706 ) ) ( not ( = ?auto_669703 ?auto_669707 ) ) ( not ( = ?auto_669703 ?auto_669708 ) ) ( not ( = ?auto_669703 ?auto_669709 ) ) ( not ( = ?auto_669703 ?auto_669710 ) ) ( not ( = ?auto_669703 ?auto_669711 ) ) ( not ( = ?auto_669703 ?auto_669712 ) ) ( not ( = ?auto_669704 ?auto_669705 ) ) ( not ( = ?auto_669704 ?auto_669706 ) ) ( not ( = ?auto_669704 ?auto_669707 ) ) ( not ( = ?auto_669704 ?auto_669708 ) ) ( not ( = ?auto_669704 ?auto_669709 ) ) ( not ( = ?auto_669704 ?auto_669710 ) ) ( not ( = ?auto_669704 ?auto_669711 ) ) ( not ( = ?auto_669704 ?auto_669712 ) ) ( not ( = ?auto_669705 ?auto_669706 ) ) ( not ( = ?auto_669705 ?auto_669707 ) ) ( not ( = ?auto_669705 ?auto_669708 ) ) ( not ( = ?auto_669705 ?auto_669709 ) ) ( not ( = ?auto_669705 ?auto_669710 ) ) ( not ( = ?auto_669705 ?auto_669711 ) ) ( not ( = ?auto_669705 ?auto_669712 ) ) ( not ( = ?auto_669706 ?auto_669707 ) ) ( not ( = ?auto_669706 ?auto_669708 ) ) ( not ( = ?auto_669706 ?auto_669709 ) ) ( not ( = ?auto_669706 ?auto_669710 ) ) ( not ( = ?auto_669706 ?auto_669711 ) ) ( not ( = ?auto_669706 ?auto_669712 ) ) ( not ( = ?auto_669707 ?auto_669708 ) ) ( not ( = ?auto_669707 ?auto_669709 ) ) ( not ( = ?auto_669707 ?auto_669710 ) ) ( not ( = ?auto_669707 ?auto_669711 ) ) ( not ( = ?auto_669707 ?auto_669712 ) ) ( not ( = ?auto_669708 ?auto_669709 ) ) ( not ( = ?auto_669708 ?auto_669710 ) ) ( not ( = ?auto_669708 ?auto_669711 ) ) ( not ( = ?auto_669708 ?auto_669712 ) ) ( not ( = ?auto_669709 ?auto_669710 ) ) ( not ( = ?auto_669709 ?auto_669711 ) ) ( not ( = ?auto_669709 ?auto_669712 ) ) ( not ( = ?auto_669710 ?auto_669711 ) ) ( not ( = ?auto_669710 ?auto_669712 ) ) ( not ( = ?auto_669711 ?auto_669712 ) ) ( ON ?auto_669710 ?auto_669711 ) ( ON ?auto_669709 ?auto_669710 ) ( ON ?auto_669708 ?auto_669709 ) ( ON ?auto_669707 ?auto_669708 ) ( ON ?auto_669706 ?auto_669707 ) ( CLEAR ?auto_669704 ) ( ON ?auto_669705 ?auto_669706 ) ( CLEAR ?auto_669705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_669697 ?auto_669698 ?auto_669699 ?auto_669700 ?auto_669701 ?auto_669702 ?auto_669703 ?auto_669704 ?auto_669705 )
      ( MAKE-15PILE ?auto_669697 ?auto_669698 ?auto_669699 ?auto_669700 ?auto_669701 ?auto_669702 ?auto_669703 ?auto_669704 ?auto_669705 ?auto_669706 ?auto_669707 ?auto_669708 ?auto_669709 ?auto_669710 ?auto_669711 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669759 - BLOCK
      ?auto_669760 - BLOCK
      ?auto_669761 - BLOCK
      ?auto_669762 - BLOCK
      ?auto_669763 - BLOCK
      ?auto_669764 - BLOCK
      ?auto_669765 - BLOCK
      ?auto_669766 - BLOCK
      ?auto_669767 - BLOCK
      ?auto_669768 - BLOCK
      ?auto_669769 - BLOCK
      ?auto_669770 - BLOCK
      ?auto_669771 - BLOCK
      ?auto_669772 - BLOCK
      ?auto_669773 - BLOCK
    )
    :vars
    (
      ?auto_669774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669773 ?auto_669774 ) ( ON-TABLE ?auto_669759 ) ( ON ?auto_669760 ?auto_669759 ) ( ON ?auto_669761 ?auto_669760 ) ( ON ?auto_669762 ?auto_669761 ) ( ON ?auto_669763 ?auto_669762 ) ( ON ?auto_669764 ?auto_669763 ) ( ON ?auto_669765 ?auto_669764 ) ( not ( = ?auto_669759 ?auto_669760 ) ) ( not ( = ?auto_669759 ?auto_669761 ) ) ( not ( = ?auto_669759 ?auto_669762 ) ) ( not ( = ?auto_669759 ?auto_669763 ) ) ( not ( = ?auto_669759 ?auto_669764 ) ) ( not ( = ?auto_669759 ?auto_669765 ) ) ( not ( = ?auto_669759 ?auto_669766 ) ) ( not ( = ?auto_669759 ?auto_669767 ) ) ( not ( = ?auto_669759 ?auto_669768 ) ) ( not ( = ?auto_669759 ?auto_669769 ) ) ( not ( = ?auto_669759 ?auto_669770 ) ) ( not ( = ?auto_669759 ?auto_669771 ) ) ( not ( = ?auto_669759 ?auto_669772 ) ) ( not ( = ?auto_669759 ?auto_669773 ) ) ( not ( = ?auto_669759 ?auto_669774 ) ) ( not ( = ?auto_669760 ?auto_669761 ) ) ( not ( = ?auto_669760 ?auto_669762 ) ) ( not ( = ?auto_669760 ?auto_669763 ) ) ( not ( = ?auto_669760 ?auto_669764 ) ) ( not ( = ?auto_669760 ?auto_669765 ) ) ( not ( = ?auto_669760 ?auto_669766 ) ) ( not ( = ?auto_669760 ?auto_669767 ) ) ( not ( = ?auto_669760 ?auto_669768 ) ) ( not ( = ?auto_669760 ?auto_669769 ) ) ( not ( = ?auto_669760 ?auto_669770 ) ) ( not ( = ?auto_669760 ?auto_669771 ) ) ( not ( = ?auto_669760 ?auto_669772 ) ) ( not ( = ?auto_669760 ?auto_669773 ) ) ( not ( = ?auto_669760 ?auto_669774 ) ) ( not ( = ?auto_669761 ?auto_669762 ) ) ( not ( = ?auto_669761 ?auto_669763 ) ) ( not ( = ?auto_669761 ?auto_669764 ) ) ( not ( = ?auto_669761 ?auto_669765 ) ) ( not ( = ?auto_669761 ?auto_669766 ) ) ( not ( = ?auto_669761 ?auto_669767 ) ) ( not ( = ?auto_669761 ?auto_669768 ) ) ( not ( = ?auto_669761 ?auto_669769 ) ) ( not ( = ?auto_669761 ?auto_669770 ) ) ( not ( = ?auto_669761 ?auto_669771 ) ) ( not ( = ?auto_669761 ?auto_669772 ) ) ( not ( = ?auto_669761 ?auto_669773 ) ) ( not ( = ?auto_669761 ?auto_669774 ) ) ( not ( = ?auto_669762 ?auto_669763 ) ) ( not ( = ?auto_669762 ?auto_669764 ) ) ( not ( = ?auto_669762 ?auto_669765 ) ) ( not ( = ?auto_669762 ?auto_669766 ) ) ( not ( = ?auto_669762 ?auto_669767 ) ) ( not ( = ?auto_669762 ?auto_669768 ) ) ( not ( = ?auto_669762 ?auto_669769 ) ) ( not ( = ?auto_669762 ?auto_669770 ) ) ( not ( = ?auto_669762 ?auto_669771 ) ) ( not ( = ?auto_669762 ?auto_669772 ) ) ( not ( = ?auto_669762 ?auto_669773 ) ) ( not ( = ?auto_669762 ?auto_669774 ) ) ( not ( = ?auto_669763 ?auto_669764 ) ) ( not ( = ?auto_669763 ?auto_669765 ) ) ( not ( = ?auto_669763 ?auto_669766 ) ) ( not ( = ?auto_669763 ?auto_669767 ) ) ( not ( = ?auto_669763 ?auto_669768 ) ) ( not ( = ?auto_669763 ?auto_669769 ) ) ( not ( = ?auto_669763 ?auto_669770 ) ) ( not ( = ?auto_669763 ?auto_669771 ) ) ( not ( = ?auto_669763 ?auto_669772 ) ) ( not ( = ?auto_669763 ?auto_669773 ) ) ( not ( = ?auto_669763 ?auto_669774 ) ) ( not ( = ?auto_669764 ?auto_669765 ) ) ( not ( = ?auto_669764 ?auto_669766 ) ) ( not ( = ?auto_669764 ?auto_669767 ) ) ( not ( = ?auto_669764 ?auto_669768 ) ) ( not ( = ?auto_669764 ?auto_669769 ) ) ( not ( = ?auto_669764 ?auto_669770 ) ) ( not ( = ?auto_669764 ?auto_669771 ) ) ( not ( = ?auto_669764 ?auto_669772 ) ) ( not ( = ?auto_669764 ?auto_669773 ) ) ( not ( = ?auto_669764 ?auto_669774 ) ) ( not ( = ?auto_669765 ?auto_669766 ) ) ( not ( = ?auto_669765 ?auto_669767 ) ) ( not ( = ?auto_669765 ?auto_669768 ) ) ( not ( = ?auto_669765 ?auto_669769 ) ) ( not ( = ?auto_669765 ?auto_669770 ) ) ( not ( = ?auto_669765 ?auto_669771 ) ) ( not ( = ?auto_669765 ?auto_669772 ) ) ( not ( = ?auto_669765 ?auto_669773 ) ) ( not ( = ?auto_669765 ?auto_669774 ) ) ( not ( = ?auto_669766 ?auto_669767 ) ) ( not ( = ?auto_669766 ?auto_669768 ) ) ( not ( = ?auto_669766 ?auto_669769 ) ) ( not ( = ?auto_669766 ?auto_669770 ) ) ( not ( = ?auto_669766 ?auto_669771 ) ) ( not ( = ?auto_669766 ?auto_669772 ) ) ( not ( = ?auto_669766 ?auto_669773 ) ) ( not ( = ?auto_669766 ?auto_669774 ) ) ( not ( = ?auto_669767 ?auto_669768 ) ) ( not ( = ?auto_669767 ?auto_669769 ) ) ( not ( = ?auto_669767 ?auto_669770 ) ) ( not ( = ?auto_669767 ?auto_669771 ) ) ( not ( = ?auto_669767 ?auto_669772 ) ) ( not ( = ?auto_669767 ?auto_669773 ) ) ( not ( = ?auto_669767 ?auto_669774 ) ) ( not ( = ?auto_669768 ?auto_669769 ) ) ( not ( = ?auto_669768 ?auto_669770 ) ) ( not ( = ?auto_669768 ?auto_669771 ) ) ( not ( = ?auto_669768 ?auto_669772 ) ) ( not ( = ?auto_669768 ?auto_669773 ) ) ( not ( = ?auto_669768 ?auto_669774 ) ) ( not ( = ?auto_669769 ?auto_669770 ) ) ( not ( = ?auto_669769 ?auto_669771 ) ) ( not ( = ?auto_669769 ?auto_669772 ) ) ( not ( = ?auto_669769 ?auto_669773 ) ) ( not ( = ?auto_669769 ?auto_669774 ) ) ( not ( = ?auto_669770 ?auto_669771 ) ) ( not ( = ?auto_669770 ?auto_669772 ) ) ( not ( = ?auto_669770 ?auto_669773 ) ) ( not ( = ?auto_669770 ?auto_669774 ) ) ( not ( = ?auto_669771 ?auto_669772 ) ) ( not ( = ?auto_669771 ?auto_669773 ) ) ( not ( = ?auto_669771 ?auto_669774 ) ) ( not ( = ?auto_669772 ?auto_669773 ) ) ( not ( = ?auto_669772 ?auto_669774 ) ) ( not ( = ?auto_669773 ?auto_669774 ) ) ( ON ?auto_669772 ?auto_669773 ) ( ON ?auto_669771 ?auto_669772 ) ( ON ?auto_669770 ?auto_669771 ) ( ON ?auto_669769 ?auto_669770 ) ( ON ?auto_669768 ?auto_669769 ) ( ON ?auto_669767 ?auto_669768 ) ( CLEAR ?auto_669765 ) ( ON ?auto_669766 ?auto_669767 ) ( CLEAR ?auto_669766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_669759 ?auto_669760 ?auto_669761 ?auto_669762 ?auto_669763 ?auto_669764 ?auto_669765 ?auto_669766 )
      ( MAKE-15PILE ?auto_669759 ?auto_669760 ?auto_669761 ?auto_669762 ?auto_669763 ?auto_669764 ?auto_669765 ?auto_669766 ?auto_669767 ?auto_669768 ?auto_669769 ?auto_669770 ?auto_669771 ?auto_669772 ?auto_669773 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669821 - BLOCK
      ?auto_669822 - BLOCK
      ?auto_669823 - BLOCK
      ?auto_669824 - BLOCK
      ?auto_669825 - BLOCK
      ?auto_669826 - BLOCK
      ?auto_669827 - BLOCK
      ?auto_669828 - BLOCK
      ?auto_669829 - BLOCK
      ?auto_669830 - BLOCK
      ?auto_669831 - BLOCK
      ?auto_669832 - BLOCK
      ?auto_669833 - BLOCK
      ?auto_669834 - BLOCK
      ?auto_669835 - BLOCK
    )
    :vars
    (
      ?auto_669836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669835 ?auto_669836 ) ( ON-TABLE ?auto_669821 ) ( ON ?auto_669822 ?auto_669821 ) ( ON ?auto_669823 ?auto_669822 ) ( ON ?auto_669824 ?auto_669823 ) ( ON ?auto_669825 ?auto_669824 ) ( ON ?auto_669826 ?auto_669825 ) ( not ( = ?auto_669821 ?auto_669822 ) ) ( not ( = ?auto_669821 ?auto_669823 ) ) ( not ( = ?auto_669821 ?auto_669824 ) ) ( not ( = ?auto_669821 ?auto_669825 ) ) ( not ( = ?auto_669821 ?auto_669826 ) ) ( not ( = ?auto_669821 ?auto_669827 ) ) ( not ( = ?auto_669821 ?auto_669828 ) ) ( not ( = ?auto_669821 ?auto_669829 ) ) ( not ( = ?auto_669821 ?auto_669830 ) ) ( not ( = ?auto_669821 ?auto_669831 ) ) ( not ( = ?auto_669821 ?auto_669832 ) ) ( not ( = ?auto_669821 ?auto_669833 ) ) ( not ( = ?auto_669821 ?auto_669834 ) ) ( not ( = ?auto_669821 ?auto_669835 ) ) ( not ( = ?auto_669821 ?auto_669836 ) ) ( not ( = ?auto_669822 ?auto_669823 ) ) ( not ( = ?auto_669822 ?auto_669824 ) ) ( not ( = ?auto_669822 ?auto_669825 ) ) ( not ( = ?auto_669822 ?auto_669826 ) ) ( not ( = ?auto_669822 ?auto_669827 ) ) ( not ( = ?auto_669822 ?auto_669828 ) ) ( not ( = ?auto_669822 ?auto_669829 ) ) ( not ( = ?auto_669822 ?auto_669830 ) ) ( not ( = ?auto_669822 ?auto_669831 ) ) ( not ( = ?auto_669822 ?auto_669832 ) ) ( not ( = ?auto_669822 ?auto_669833 ) ) ( not ( = ?auto_669822 ?auto_669834 ) ) ( not ( = ?auto_669822 ?auto_669835 ) ) ( not ( = ?auto_669822 ?auto_669836 ) ) ( not ( = ?auto_669823 ?auto_669824 ) ) ( not ( = ?auto_669823 ?auto_669825 ) ) ( not ( = ?auto_669823 ?auto_669826 ) ) ( not ( = ?auto_669823 ?auto_669827 ) ) ( not ( = ?auto_669823 ?auto_669828 ) ) ( not ( = ?auto_669823 ?auto_669829 ) ) ( not ( = ?auto_669823 ?auto_669830 ) ) ( not ( = ?auto_669823 ?auto_669831 ) ) ( not ( = ?auto_669823 ?auto_669832 ) ) ( not ( = ?auto_669823 ?auto_669833 ) ) ( not ( = ?auto_669823 ?auto_669834 ) ) ( not ( = ?auto_669823 ?auto_669835 ) ) ( not ( = ?auto_669823 ?auto_669836 ) ) ( not ( = ?auto_669824 ?auto_669825 ) ) ( not ( = ?auto_669824 ?auto_669826 ) ) ( not ( = ?auto_669824 ?auto_669827 ) ) ( not ( = ?auto_669824 ?auto_669828 ) ) ( not ( = ?auto_669824 ?auto_669829 ) ) ( not ( = ?auto_669824 ?auto_669830 ) ) ( not ( = ?auto_669824 ?auto_669831 ) ) ( not ( = ?auto_669824 ?auto_669832 ) ) ( not ( = ?auto_669824 ?auto_669833 ) ) ( not ( = ?auto_669824 ?auto_669834 ) ) ( not ( = ?auto_669824 ?auto_669835 ) ) ( not ( = ?auto_669824 ?auto_669836 ) ) ( not ( = ?auto_669825 ?auto_669826 ) ) ( not ( = ?auto_669825 ?auto_669827 ) ) ( not ( = ?auto_669825 ?auto_669828 ) ) ( not ( = ?auto_669825 ?auto_669829 ) ) ( not ( = ?auto_669825 ?auto_669830 ) ) ( not ( = ?auto_669825 ?auto_669831 ) ) ( not ( = ?auto_669825 ?auto_669832 ) ) ( not ( = ?auto_669825 ?auto_669833 ) ) ( not ( = ?auto_669825 ?auto_669834 ) ) ( not ( = ?auto_669825 ?auto_669835 ) ) ( not ( = ?auto_669825 ?auto_669836 ) ) ( not ( = ?auto_669826 ?auto_669827 ) ) ( not ( = ?auto_669826 ?auto_669828 ) ) ( not ( = ?auto_669826 ?auto_669829 ) ) ( not ( = ?auto_669826 ?auto_669830 ) ) ( not ( = ?auto_669826 ?auto_669831 ) ) ( not ( = ?auto_669826 ?auto_669832 ) ) ( not ( = ?auto_669826 ?auto_669833 ) ) ( not ( = ?auto_669826 ?auto_669834 ) ) ( not ( = ?auto_669826 ?auto_669835 ) ) ( not ( = ?auto_669826 ?auto_669836 ) ) ( not ( = ?auto_669827 ?auto_669828 ) ) ( not ( = ?auto_669827 ?auto_669829 ) ) ( not ( = ?auto_669827 ?auto_669830 ) ) ( not ( = ?auto_669827 ?auto_669831 ) ) ( not ( = ?auto_669827 ?auto_669832 ) ) ( not ( = ?auto_669827 ?auto_669833 ) ) ( not ( = ?auto_669827 ?auto_669834 ) ) ( not ( = ?auto_669827 ?auto_669835 ) ) ( not ( = ?auto_669827 ?auto_669836 ) ) ( not ( = ?auto_669828 ?auto_669829 ) ) ( not ( = ?auto_669828 ?auto_669830 ) ) ( not ( = ?auto_669828 ?auto_669831 ) ) ( not ( = ?auto_669828 ?auto_669832 ) ) ( not ( = ?auto_669828 ?auto_669833 ) ) ( not ( = ?auto_669828 ?auto_669834 ) ) ( not ( = ?auto_669828 ?auto_669835 ) ) ( not ( = ?auto_669828 ?auto_669836 ) ) ( not ( = ?auto_669829 ?auto_669830 ) ) ( not ( = ?auto_669829 ?auto_669831 ) ) ( not ( = ?auto_669829 ?auto_669832 ) ) ( not ( = ?auto_669829 ?auto_669833 ) ) ( not ( = ?auto_669829 ?auto_669834 ) ) ( not ( = ?auto_669829 ?auto_669835 ) ) ( not ( = ?auto_669829 ?auto_669836 ) ) ( not ( = ?auto_669830 ?auto_669831 ) ) ( not ( = ?auto_669830 ?auto_669832 ) ) ( not ( = ?auto_669830 ?auto_669833 ) ) ( not ( = ?auto_669830 ?auto_669834 ) ) ( not ( = ?auto_669830 ?auto_669835 ) ) ( not ( = ?auto_669830 ?auto_669836 ) ) ( not ( = ?auto_669831 ?auto_669832 ) ) ( not ( = ?auto_669831 ?auto_669833 ) ) ( not ( = ?auto_669831 ?auto_669834 ) ) ( not ( = ?auto_669831 ?auto_669835 ) ) ( not ( = ?auto_669831 ?auto_669836 ) ) ( not ( = ?auto_669832 ?auto_669833 ) ) ( not ( = ?auto_669832 ?auto_669834 ) ) ( not ( = ?auto_669832 ?auto_669835 ) ) ( not ( = ?auto_669832 ?auto_669836 ) ) ( not ( = ?auto_669833 ?auto_669834 ) ) ( not ( = ?auto_669833 ?auto_669835 ) ) ( not ( = ?auto_669833 ?auto_669836 ) ) ( not ( = ?auto_669834 ?auto_669835 ) ) ( not ( = ?auto_669834 ?auto_669836 ) ) ( not ( = ?auto_669835 ?auto_669836 ) ) ( ON ?auto_669834 ?auto_669835 ) ( ON ?auto_669833 ?auto_669834 ) ( ON ?auto_669832 ?auto_669833 ) ( ON ?auto_669831 ?auto_669832 ) ( ON ?auto_669830 ?auto_669831 ) ( ON ?auto_669829 ?auto_669830 ) ( ON ?auto_669828 ?auto_669829 ) ( CLEAR ?auto_669826 ) ( ON ?auto_669827 ?auto_669828 ) ( CLEAR ?auto_669827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_669821 ?auto_669822 ?auto_669823 ?auto_669824 ?auto_669825 ?auto_669826 ?auto_669827 )
      ( MAKE-15PILE ?auto_669821 ?auto_669822 ?auto_669823 ?auto_669824 ?auto_669825 ?auto_669826 ?auto_669827 ?auto_669828 ?auto_669829 ?auto_669830 ?auto_669831 ?auto_669832 ?auto_669833 ?auto_669834 ?auto_669835 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669883 - BLOCK
      ?auto_669884 - BLOCK
      ?auto_669885 - BLOCK
      ?auto_669886 - BLOCK
      ?auto_669887 - BLOCK
      ?auto_669888 - BLOCK
      ?auto_669889 - BLOCK
      ?auto_669890 - BLOCK
      ?auto_669891 - BLOCK
      ?auto_669892 - BLOCK
      ?auto_669893 - BLOCK
      ?auto_669894 - BLOCK
      ?auto_669895 - BLOCK
      ?auto_669896 - BLOCK
      ?auto_669897 - BLOCK
    )
    :vars
    (
      ?auto_669898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669897 ?auto_669898 ) ( ON-TABLE ?auto_669883 ) ( ON ?auto_669884 ?auto_669883 ) ( ON ?auto_669885 ?auto_669884 ) ( ON ?auto_669886 ?auto_669885 ) ( ON ?auto_669887 ?auto_669886 ) ( not ( = ?auto_669883 ?auto_669884 ) ) ( not ( = ?auto_669883 ?auto_669885 ) ) ( not ( = ?auto_669883 ?auto_669886 ) ) ( not ( = ?auto_669883 ?auto_669887 ) ) ( not ( = ?auto_669883 ?auto_669888 ) ) ( not ( = ?auto_669883 ?auto_669889 ) ) ( not ( = ?auto_669883 ?auto_669890 ) ) ( not ( = ?auto_669883 ?auto_669891 ) ) ( not ( = ?auto_669883 ?auto_669892 ) ) ( not ( = ?auto_669883 ?auto_669893 ) ) ( not ( = ?auto_669883 ?auto_669894 ) ) ( not ( = ?auto_669883 ?auto_669895 ) ) ( not ( = ?auto_669883 ?auto_669896 ) ) ( not ( = ?auto_669883 ?auto_669897 ) ) ( not ( = ?auto_669883 ?auto_669898 ) ) ( not ( = ?auto_669884 ?auto_669885 ) ) ( not ( = ?auto_669884 ?auto_669886 ) ) ( not ( = ?auto_669884 ?auto_669887 ) ) ( not ( = ?auto_669884 ?auto_669888 ) ) ( not ( = ?auto_669884 ?auto_669889 ) ) ( not ( = ?auto_669884 ?auto_669890 ) ) ( not ( = ?auto_669884 ?auto_669891 ) ) ( not ( = ?auto_669884 ?auto_669892 ) ) ( not ( = ?auto_669884 ?auto_669893 ) ) ( not ( = ?auto_669884 ?auto_669894 ) ) ( not ( = ?auto_669884 ?auto_669895 ) ) ( not ( = ?auto_669884 ?auto_669896 ) ) ( not ( = ?auto_669884 ?auto_669897 ) ) ( not ( = ?auto_669884 ?auto_669898 ) ) ( not ( = ?auto_669885 ?auto_669886 ) ) ( not ( = ?auto_669885 ?auto_669887 ) ) ( not ( = ?auto_669885 ?auto_669888 ) ) ( not ( = ?auto_669885 ?auto_669889 ) ) ( not ( = ?auto_669885 ?auto_669890 ) ) ( not ( = ?auto_669885 ?auto_669891 ) ) ( not ( = ?auto_669885 ?auto_669892 ) ) ( not ( = ?auto_669885 ?auto_669893 ) ) ( not ( = ?auto_669885 ?auto_669894 ) ) ( not ( = ?auto_669885 ?auto_669895 ) ) ( not ( = ?auto_669885 ?auto_669896 ) ) ( not ( = ?auto_669885 ?auto_669897 ) ) ( not ( = ?auto_669885 ?auto_669898 ) ) ( not ( = ?auto_669886 ?auto_669887 ) ) ( not ( = ?auto_669886 ?auto_669888 ) ) ( not ( = ?auto_669886 ?auto_669889 ) ) ( not ( = ?auto_669886 ?auto_669890 ) ) ( not ( = ?auto_669886 ?auto_669891 ) ) ( not ( = ?auto_669886 ?auto_669892 ) ) ( not ( = ?auto_669886 ?auto_669893 ) ) ( not ( = ?auto_669886 ?auto_669894 ) ) ( not ( = ?auto_669886 ?auto_669895 ) ) ( not ( = ?auto_669886 ?auto_669896 ) ) ( not ( = ?auto_669886 ?auto_669897 ) ) ( not ( = ?auto_669886 ?auto_669898 ) ) ( not ( = ?auto_669887 ?auto_669888 ) ) ( not ( = ?auto_669887 ?auto_669889 ) ) ( not ( = ?auto_669887 ?auto_669890 ) ) ( not ( = ?auto_669887 ?auto_669891 ) ) ( not ( = ?auto_669887 ?auto_669892 ) ) ( not ( = ?auto_669887 ?auto_669893 ) ) ( not ( = ?auto_669887 ?auto_669894 ) ) ( not ( = ?auto_669887 ?auto_669895 ) ) ( not ( = ?auto_669887 ?auto_669896 ) ) ( not ( = ?auto_669887 ?auto_669897 ) ) ( not ( = ?auto_669887 ?auto_669898 ) ) ( not ( = ?auto_669888 ?auto_669889 ) ) ( not ( = ?auto_669888 ?auto_669890 ) ) ( not ( = ?auto_669888 ?auto_669891 ) ) ( not ( = ?auto_669888 ?auto_669892 ) ) ( not ( = ?auto_669888 ?auto_669893 ) ) ( not ( = ?auto_669888 ?auto_669894 ) ) ( not ( = ?auto_669888 ?auto_669895 ) ) ( not ( = ?auto_669888 ?auto_669896 ) ) ( not ( = ?auto_669888 ?auto_669897 ) ) ( not ( = ?auto_669888 ?auto_669898 ) ) ( not ( = ?auto_669889 ?auto_669890 ) ) ( not ( = ?auto_669889 ?auto_669891 ) ) ( not ( = ?auto_669889 ?auto_669892 ) ) ( not ( = ?auto_669889 ?auto_669893 ) ) ( not ( = ?auto_669889 ?auto_669894 ) ) ( not ( = ?auto_669889 ?auto_669895 ) ) ( not ( = ?auto_669889 ?auto_669896 ) ) ( not ( = ?auto_669889 ?auto_669897 ) ) ( not ( = ?auto_669889 ?auto_669898 ) ) ( not ( = ?auto_669890 ?auto_669891 ) ) ( not ( = ?auto_669890 ?auto_669892 ) ) ( not ( = ?auto_669890 ?auto_669893 ) ) ( not ( = ?auto_669890 ?auto_669894 ) ) ( not ( = ?auto_669890 ?auto_669895 ) ) ( not ( = ?auto_669890 ?auto_669896 ) ) ( not ( = ?auto_669890 ?auto_669897 ) ) ( not ( = ?auto_669890 ?auto_669898 ) ) ( not ( = ?auto_669891 ?auto_669892 ) ) ( not ( = ?auto_669891 ?auto_669893 ) ) ( not ( = ?auto_669891 ?auto_669894 ) ) ( not ( = ?auto_669891 ?auto_669895 ) ) ( not ( = ?auto_669891 ?auto_669896 ) ) ( not ( = ?auto_669891 ?auto_669897 ) ) ( not ( = ?auto_669891 ?auto_669898 ) ) ( not ( = ?auto_669892 ?auto_669893 ) ) ( not ( = ?auto_669892 ?auto_669894 ) ) ( not ( = ?auto_669892 ?auto_669895 ) ) ( not ( = ?auto_669892 ?auto_669896 ) ) ( not ( = ?auto_669892 ?auto_669897 ) ) ( not ( = ?auto_669892 ?auto_669898 ) ) ( not ( = ?auto_669893 ?auto_669894 ) ) ( not ( = ?auto_669893 ?auto_669895 ) ) ( not ( = ?auto_669893 ?auto_669896 ) ) ( not ( = ?auto_669893 ?auto_669897 ) ) ( not ( = ?auto_669893 ?auto_669898 ) ) ( not ( = ?auto_669894 ?auto_669895 ) ) ( not ( = ?auto_669894 ?auto_669896 ) ) ( not ( = ?auto_669894 ?auto_669897 ) ) ( not ( = ?auto_669894 ?auto_669898 ) ) ( not ( = ?auto_669895 ?auto_669896 ) ) ( not ( = ?auto_669895 ?auto_669897 ) ) ( not ( = ?auto_669895 ?auto_669898 ) ) ( not ( = ?auto_669896 ?auto_669897 ) ) ( not ( = ?auto_669896 ?auto_669898 ) ) ( not ( = ?auto_669897 ?auto_669898 ) ) ( ON ?auto_669896 ?auto_669897 ) ( ON ?auto_669895 ?auto_669896 ) ( ON ?auto_669894 ?auto_669895 ) ( ON ?auto_669893 ?auto_669894 ) ( ON ?auto_669892 ?auto_669893 ) ( ON ?auto_669891 ?auto_669892 ) ( ON ?auto_669890 ?auto_669891 ) ( ON ?auto_669889 ?auto_669890 ) ( CLEAR ?auto_669887 ) ( ON ?auto_669888 ?auto_669889 ) ( CLEAR ?auto_669888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_669883 ?auto_669884 ?auto_669885 ?auto_669886 ?auto_669887 ?auto_669888 )
      ( MAKE-15PILE ?auto_669883 ?auto_669884 ?auto_669885 ?auto_669886 ?auto_669887 ?auto_669888 ?auto_669889 ?auto_669890 ?auto_669891 ?auto_669892 ?auto_669893 ?auto_669894 ?auto_669895 ?auto_669896 ?auto_669897 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_669945 - BLOCK
      ?auto_669946 - BLOCK
      ?auto_669947 - BLOCK
      ?auto_669948 - BLOCK
      ?auto_669949 - BLOCK
      ?auto_669950 - BLOCK
      ?auto_669951 - BLOCK
      ?auto_669952 - BLOCK
      ?auto_669953 - BLOCK
      ?auto_669954 - BLOCK
      ?auto_669955 - BLOCK
      ?auto_669956 - BLOCK
      ?auto_669957 - BLOCK
      ?auto_669958 - BLOCK
      ?auto_669959 - BLOCK
    )
    :vars
    (
      ?auto_669960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_669959 ?auto_669960 ) ( ON-TABLE ?auto_669945 ) ( ON ?auto_669946 ?auto_669945 ) ( ON ?auto_669947 ?auto_669946 ) ( ON ?auto_669948 ?auto_669947 ) ( not ( = ?auto_669945 ?auto_669946 ) ) ( not ( = ?auto_669945 ?auto_669947 ) ) ( not ( = ?auto_669945 ?auto_669948 ) ) ( not ( = ?auto_669945 ?auto_669949 ) ) ( not ( = ?auto_669945 ?auto_669950 ) ) ( not ( = ?auto_669945 ?auto_669951 ) ) ( not ( = ?auto_669945 ?auto_669952 ) ) ( not ( = ?auto_669945 ?auto_669953 ) ) ( not ( = ?auto_669945 ?auto_669954 ) ) ( not ( = ?auto_669945 ?auto_669955 ) ) ( not ( = ?auto_669945 ?auto_669956 ) ) ( not ( = ?auto_669945 ?auto_669957 ) ) ( not ( = ?auto_669945 ?auto_669958 ) ) ( not ( = ?auto_669945 ?auto_669959 ) ) ( not ( = ?auto_669945 ?auto_669960 ) ) ( not ( = ?auto_669946 ?auto_669947 ) ) ( not ( = ?auto_669946 ?auto_669948 ) ) ( not ( = ?auto_669946 ?auto_669949 ) ) ( not ( = ?auto_669946 ?auto_669950 ) ) ( not ( = ?auto_669946 ?auto_669951 ) ) ( not ( = ?auto_669946 ?auto_669952 ) ) ( not ( = ?auto_669946 ?auto_669953 ) ) ( not ( = ?auto_669946 ?auto_669954 ) ) ( not ( = ?auto_669946 ?auto_669955 ) ) ( not ( = ?auto_669946 ?auto_669956 ) ) ( not ( = ?auto_669946 ?auto_669957 ) ) ( not ( = ?auto_669946 ?auto_669958 ) ) ( not ( = ?auto_669946 ?auto_669959 ) ) ( not ( = ?auto_669946 ?auto_669960 ) ) ( not ( = ?auto_669947 ?auto_669948 ) ) ( not ( = ?auto_669947 ?auto_669949 ) ) ( not ( = ?auto_669947 ?auto_669950 ) ) ( not ( = ?auto_669947 ?auto_669951 ) ) ( not ( = ?auto_669947 ?auto_669952 ) ) ( not ( = ?auto_669947 ?auto_669953 ) ) ( not ( = ?auto_669947 ?auto_669954 ) ) ( not ( = ?auto_669947 ?auto_669955 ) ) ( not ( = ?auto_669947 ?auto_669956 ) ) ( not ( = ?auto_669947 ?auto_669957 ) ) ( not ( = ?auto_669947 ?auto_669958 ) ) ( not ( = ?auto_669947 ?auto_669959 ) ) ( not ( = ?auto_669947 ?auto_669960 ) ) ( not ( = ?auto_669948 ?auto_669949 ) ) ( not ( = ?auto_669948 ?auto_669950 ) ) ( not ( = ?auto_669948 ?auto_669951 ) ) ( not ( = ?auto_669948 ?auto_669952 ) ) ( not ( = ?auto_669948 ?auto_669953 ) ) ( not ( = ?auto_669948 ?auto_669954 ) ) ( not ( = ?auto_669948 ?auto_669955 ) ) ( not ( = ?auto_669948 ?auto_669956 ) ) ( not ( = ?auto_669948 ?auto_669957 ) ) ( not ( = ?auto_669948 ?auto_669958 ) ) ( not ( = ?auto_669948 ?auto_669959 ) ) ( not ( = ?auto_669948 ?auto_669960 ) ) ( not ( = ?auto_669949 ?auto_669950 ) ) ( not ( = ?auto_669949 ?auto_669951 ) ) ( not ( = ?auto_669949 ?auto_669952 ) ) ( not ( = ?auto_669949 ?auto_669953 ) ) ( not ( = ?auto_669949 ?auto_669954 ) ) ( not ( = ?auto_669949 ?auto_669955 ) ) ( not ( = ?auto_669949 ?auto_669956 ) ) ( not ( = ?auto_669949 ?auto_669957 ) ) ( not ( = ?auto_669949 ?auto_669958 ) ) ( not ( = ?auto_669949 ?auto_669959 ) ) ( not ( = ?auto_669949 ?auto_669960 ) ) ( not ( = ?auto_669950 ?auto_669951 ) ) ( not ( = ?auto_669950 ?auto_669952 ) ) ( not ( = ?auto_669950 ?auto_669953 ) ) ( not ( = ?auto_669950 ?auto_669954 ) ) ( not ( = ?auto_669950 ?auto_669955 ) ) ( not ( = ?auto_669950 ?auto_669956 ) ) ( not ( = ?auto_669950 ?auto_669957 ) ) ( not ( = ?auto_669950 ?auto_669958 ) ) ( not ( = ?auto_669950 ?auto_669959 ) ) ( not ( = ?auto_669950 ?auto_669960 ) ) ( not ( = ?auto_669951 ?auto_669952 ) ) ( not ( = ?auto_669951 ?auto_669953 ) ) ( not ( = ?auto_669951 ?auto_669954 ) ) ( not ( = ?auto_669951 ?auto_669955 ) ) ( not ( = ?auto_669951 ?auto_669956 ) ) ( not ( = ?auto_669951 ?auto_669957 ) ) ( not ( = ?auto_669951 ?auto_669958 ) ) ( not ( = ?auto_669951 ?auto_669959 ) ) ( not ( = ?auto_669951 ?auto_669960 ) ) ( not ( = ?auto_669952 ?auto_669953 ) ) ( not ( = ?auto_669952 ?auto_669954 ) ) ( not ( = ?auto_669952 ?auto_669955 ) ) ( not ( = ?auto_669952 ?auto_669956 ) ) ( not ( = ?auto_669952 ?auto_669957 ) ) ( not ( = ?auto_669952 ?auto_669958 ) ) ( not ( = ?auto_669952 ?auto_669959 ) ) ( not ( = ?auto_669952 ?auto_669960 ) ) ( not ( = ?auto_669953 ?auto_669954 ) ) ( not ( = ?auto_669953 ?auto_669955 ) ) ( not ( = ?auto_669953 ?auto_669956 ) ) ( not ( = ?auto_669953 ?auto_669957 ) ) ( not ( = ?auto_669953 ?auto_669958 ) ) ( not ( = ?auto_669953 ?auto_669959 ) ) ( not ( = ?auto_669953 ?auto_669960 ) ) ( not ( = ?auto_669954 ?auto_669955 ) ) ( not ( = ?auto_669954 ?auto_669956 ) ) ( not ( = ?auto_669954 ?auto_669957 ) ) ( not ( = ?auto_669954 ?auto_669958 ) ) ( not ( = ?auto_669954 ?auto_669959 ) ) ( not ( = ?auto_669954 ?auto_669960 ) ) ( not ( = ?auto_669955 ?auto_669956 ) ) ( not ( = ?auto_669955 ?auto_669957 ) ) ( not ( = ?auto_669955 ?auto_669958 ) ) ( not ( = ?auto_669955 ?auto_669959 ) ) ( not ( = ?auto_669955 ?auto_669960 ) ) ( not ( = ?auto_669956 ?auto_669957 ) ) ( not ( = ?auto_669956 ?auto_669958 ) ) ( not ( = ?auto_669956 ?auto_669959 ) ) ( not ( = ?auto_669956 ?auto_669960 ) ) ( not ( = ?auto_669957 ?auto_669958 ) ) ( not ( = ?auto_669957 ?auto_669959 ) ) ( not ( = ?auto_669957 ?auto_669960 ) ) ( not ( = ?auto_669958 ?auto_669959 ) ) ( not ( = ?auto_669958 ?auto_669960 ) ) ( not ( = ?auto_669959 ?auto_669960 ) ) ( ON ?auto_669958 ?auto_669959 ) ( ON ?auto_669957 ?auto_669958 ) ( ON ?auto_669956 ?auto_669957 ) ( ON ?auto_669955 ?auto_669956 ) ( ON ?auto_669954 ?auto_669955 ) ( ON ?auto_669953 ?auto_669954 ) ( ON ?auto_669952 ?auto_669953 ) ( ON ?auto_669951 ?auto_669952 ) ( ON ?auto_669950 ?auto_669951 ) ( CLEAR ?auto_669948 ) ( ON ?auto_669949 ?auto_669950 ) ( CLEAR ?auto_669949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_669945 ?auto_669946 ?auto_669947 ?auto_669948 ?auto_669949 )
      ( MAKE-15PILE ?auto_669945 ?auto_669946 ?auto_669947 ?auto_669948 ?auto_669949 ?auto_669950 ?auto_669951 ?auto_669952 ?auto_669953 ?auto_669954 ?auto_669955 ?auto_669956 ?auto_669957 ?auto_669958 ?auto_669959 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_670007 - BLOCK
      ?auto_670008 - BLOCK
      ?auto_670009 - BLOCK
      ?auto_670010 - BLOCK
      ?auto_670011 - BLOCK
      ?auto_670012 - BLOCK
      ?auto_670013 - BLOCK
      ?auto_670014 - BLOCK
      ?auto_670015 - BLOCK
      ?auto_670016 - BLOCK
      ?auto_670017 - BLOCK
      ?auto_670018 - BLOCK
      ?auto_670019 - BLOCK
      ?auto_670020 - BLOCK
      ?auto_670021 - BLOCK
    )
    :vars
    (
      ?auto_670022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670021 ?auto_670022 ) ( ON-TABLE ?auto_670007 ) ( ON ?auto_670008 ?auto_670007 ) ( ON ?auto_670009 ?auto_670008 ) ( not ( = ?auto_670007 ?auto_670008 ) ) ( not ( = ?auto_670007 ?auto_670009 ) ) ( not ( = ?auto_670007 ?auto_670010 ) ) ( not ( = ?auto_670007 ?auto_670011 ) ) ( not ( = ?auto_670007 ?auto_670012 ) ) ( not ( = ?auto_670007 ?auto_670013 ) ) ( not ( = ?auto_670007 ?auto_670014 ) ) ( not ( = ?auto_670007 ?auto_670015 ) ) ( not ( = ?auto_670007 ?auto_670016 ) ) ( not ( = ?auto_670007 ?auto_670017 ) ) ( not ( = ?auto_670007 ?auto_670018 ) ) ( not ( = ?auto_670007 ?auto_670019 ) ) ( not ( = ?auto_670007 ?auto_670020 ) ) ( not ( = ?auto_670007 ?auto_670021 ) ) ( not ( = ?auto_670007 ?auto_670022 ) ) ( not ( = ?auto_670008 ?auto_670009 ) ) ( not ( = ?auto_670008 ?auto_670010 ) ) ( not ( = ?auto_670008 ?auto_670011 ) ) ( not ( = ?auto_670008 ?auto_670012 ) ) ( not ( = ?auto_670008 ?auto_670013 ) ) ( not ( = ?auto_670008 ?auto_670014 ) ) ( not ( = ?auto_670008 ?auto_670015 ) ) ( not ( = ?auto_670008 ?auto_670016 ) ) ( not ( = ?auto_670008 ?auto_670017 ) ) ( not ( = ?auto_670008 ?auto_670018 ) ) ( not ( = ?auto_670008 ?auto_670019 ) ) ( not ( = ?auto_670008 ?auto_670020 ) ) ( not ( = ?auto_670008 ?auto_670021 ) ) ( not ( = ?auto_670008 ?auto_670022 ) ) ( not ( = ?auto_670009 ?auto_670010 ) ) ( not ( = ?auto_670009 ?auto_670011 ) ) ( not ( = ?auto_670009 ?auto_670012 ) ) ( not ( = ?auto_670009 ?auto_670013 ) ) ( not ( = ?auto_670009 ?auto_670014 ) ) ( not ( = ?auto_670009 ?auto_670015 ) ) ( not ( = ?auto_670009 ?auto_670016 ) ) ( not ( = ?auto_670009 ?auto_670017 ) ) ( not ( = ?auto_670009 ?auto_670018 ) ) ( not ( = ?auto_670009 ?auto_670019 ) ) ( not ( = ?auto_670009 ?auto_670020 ) ) ( not ( = ?auto_670009 ?auto_670021 ) ) ( not ( = ?auto_670009 ?auto_670022 ) ) ( not ( = ?auto_670010 ?auto_670011 ) ) ( not ( = ?auto_670010 ?auto_670012 ) ) ( not ( = ?auto_670010 ?auto_670013 ) ) ( not ( = ?auto_670010 ?auto_670014 ) ) ( not ( = ?auto_670010 ?auto_670015 ) ) ( not ( = ?auto_670010 ?auto_670016 ) ) ( not ( = ?auto_670010 ?auto_670017 ) ) ( not ( = ?auto_670010 ?auto_670018 ) ) ( not ( = ?auto_670010 ?auto_670019 ) ) ( not ( = ?auto_670010 ?auto_670020 ) ) ( not ( = ?auto_670010 ?auto_670021 ) ) ( not ( = ?auto_670010 ?auto_670022 ) ) ( not ( = ?auto_670011 ?auto_670012 ) ) ( not ( = ?auto_670011 ?auto_670013 ) ) ( not ( = ?auto_670011 ?auto_670014 ) ) ( not ( = ?auto_670011 ?auto_670015 ) ) ( not ( = ?auto_670011 ?auto_670016 ) ) ( not ( = ?auto_670011 ?auto_670017 ) ) ( not ( = ?auto_670011 ?auto_670018 ) ) ( not ( = ?auto_670011 ?auto_670019 ) ) ( not ( = ?auto_670011 ?auto_670020 ) ) ( not ( = ?auto_670011 ?auto_670021 ) ) ( not ( = ?auto_670011 ?auto_670022 ) ) ( not ( = ?auto_670012 ?auto_670013 ) ) ( not ( = ?auto_670012 ?auto_670014 ) ) ( not ( = ?auto_670012 ?auto_670015 ) ) ( not ( = ?auto_670012 ?auto_670016 ) ) ( not ( = ?auto_670012 ?auto_670017 ) ) ( not ( = ?auto_670012 ?auto_670018 ) ) ( not ( = ?auto_670012 ?auto_670019 ) ) ( not ( = ?auto_670012 ?auto_670020 ) ) ( not ( = ?auto_670012 ?auto_670021 ) ) ( not ( = ?auto_670012 ?auto_670022 ) ) ( not ( = ?auto_670013 ?auto_670014 ) ) ( not ( = ?auto_670013 ?auto_670015 ) ) ( not ( = ?auto_670013 ?auto_670016 ) ) ( not ( = ?auto_670013 ?auto_670017 ) ) ( not ( = ?auto_670013 ?auto_670018 ) ) ( not ( = ?auto_670013 ?auto_670019 ) ) ( not ( = ?auto_670013 ?auto_670020 ) ) ( not ( = ?auto_670013 ?auto_670021 ) ) ( not ( = ?auto_670013 ?auto_670022 ) ) ( not ( = ?auto_670014 ?auto_670015 ) ) ( not ( = ?auto_670014 ?auto_670016 ) ) ( not ( = ?auto_670014 ?auto_670017 ) ) ( not ( = ?auto_670014 ?auto_670018 ) ) ( not ( = ?auto_670014 ?auto_670019 ) ) ( not ( = ?auto_670014 ?auto_670020 ) ) ( not ( = ?auto_670014 ?auto_670021 ) ) ( not ( = ?auto_670014 ?auto_670022 ) ) ( not ( = ?auto_670015 ?auto_670016 ) ) ( not ( = ?auto_670015 ?auto_670017 ) ) ( not ( = ?auto_670015 ?auto_670018 ) ) ( not ( = ?auto_670015 ?auto_670019 ) ) ( not ( = ?auto_670015 ?auto_670020 ) ) ( not ( = ?auto_670015 ?auto_670021 ) ) ( not ( = ?auto_670015 ?auto_670022 ) ) ( not ( = ?auto_670016 ?auto_670017 ) ) ( not ( = ?auto_670016 ?auto_670018 ) ) ( not ( = ?auto_670016 ?auto_670019 ) ) ( not ( = ?auto_670016 ?auto_670020 ) ) ( not ( = ?auto_670016 ?auto_670021 ) ) ( not ( = ?auto_670016 ?auto_670022 ) ) ( not ( = ?auto_670017 ?auto_670018 ) ) ( not ( = ?auto_670017 ?auto_670019 ) ) ( not ( = ?auto_670017 ?auto_670020 ) ) ( not ( = ?auto_670017 ?auto_670021 ) ) ( not ( = ?auto_670017 ?auto_670022 ) ) ( not ( = ?auto_670018 ?auto_670019 ) ) ( not ( = ?auto_670018 ?auto_670020 ) ) ( not ( = ?auto_670018 ?auto_670021 ) ) ( not ( = ?auto_670018 ?auto_670022 ) ) ( not ( = ?auto_670019 ?auto_670020 ) ) ( not ( = ?auto_670019 ?auto_670021 ) ) ( not ( = ?auto_670019 ?auto_670022 ) ) ( not ( = ?auto_670020 ?auto_670021 ) ) ( not ( = ?auto_670020 ?auto_670022 ) ) ( not ( = ?auto_670021 ?auto_670022 ) ) ( ON ?auto_670020 ?auto_670021 ) ( ON ?auto_670019 ?auto_670020 ) ( ON ?auto_670018 ?auto_670019 ) ( ON ?auto_670017 ?auto_670018 ) ( ON ?auto_670016 ?auto_670017 ) ( ON ?auto_670015 ?auto_670016 ) ( ON ?auto_670014 ?auto_670015 ) ( ON ?auto_670013 ?auto_670014 ) ( ON ?auto_670012 ?auto_670013 ) ( ON ?auto_670011 ?auto_670012 ) ( CLEAR ?auto_670009 ) ( ON ?auto_670010 ?auto_670011 ) ( CLEAR ?auto_670010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_670007 ?auto_670008 ?auto_670009 ?auto_670010 )
      ( MAKE-15PILE ?auto_670007 ?auto_670008 ?auto_670009 ?auto_670010 ?auto_670011 ?auto_670012 ?auto_670013 ?auto_670014 ?auto_670015 ?auto_670016 ?auto_670017 ?auto_670018 ?auto_670019 ?auto_670020 ?auto_670021 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_670069 - BLOCK
      ?auto_670070 - BLOCK
      ?auto_670071 - BLOCK
      ?auto_670072 - BLOCK
      ?auto_670073 - BLOCK
      ?auto_670074 - BLOCK
      ?auto_670075 - BLOCK
      ?auto_670076 - BLOCK
      ?auto_670077 - BLOCK
      ?auto_670078 - BLOCK
      ?auto_670079 - BLOCK
      ?auto_670080 - BLOCK
      ?auto_670081 - BLOCK
      ?auto_670082 - BLOCK
      ?auto_670083 - BLOCK
    )
    :vars
    (
      ?auto_670084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670083 ?auto_670084 ) ( ON-TABLE ?auto_670069 ) ( ON ?auto_670070 ?auto_670069 ) ( not ( = ?auto_670069 ?auto_670070 ) ) ( not ( = ?auto_670069 ?auto_670071 ) ) ( not ( = ?auto_670069 ?auto_670072 ) ) ( not ( = ?auto_670069 ?auto_670073 ) ) ( not ( = ?auto_670069 ?auto_670074 ) ) ( not ( = ?auto_670069 ?auto_670075 ) ) ( not ( = ?auto_670069 ?auto_670076 ) ) ( not ( = ?auto_670069 ?auto_670077 ) ) ( not ( = ?auto_670069 ?auto_670078 ) ) ( not ( = ?auto_670069 ?auto_670079 ) ) ( not ( = ?auto_670069 ?auto_670080 ) ) ( not ( = ?auto_670069 ?auto_670081 ) ) ( not ( = ?auto_670069 ?auto_670082 ) ) ( not ( = ?auto_670069 ?auto_670083 ) ) ( not ( = ?auto_670069 ?auto_670084 ) ) ( not ( = ?auto_670070 ?auto_670071 ) ) ( not ( = ?auto_670070 ?auto_670072 ) ) ( not ( = ?auto_670070 ?auto_670073 ) ) ( not ( = ?auto_670070 ?auto_670074 ) ) ( not ( = ?auto_670070 ?auto_670075 ) ) ( not ( = ?auto_670070 ?auto_670076 ) ) ( not ( = ?auto_670070 ?auto_670077 ) ) ( not ( = ?auto_670070 ?auto_670078 ) ) ( not ( = ?auto_670070 ?auto_670079 ) ) ( not ( = ?auto_670070 ?auto_670080 ) ) ( not ( = ?auto_670070 ?auto_670081 ) ) ( not ( = ?auto_670070 ?auto_670082 ) ) ( not ( = ?auto_670070 ?auto_670083 ) ) ( not ( = ?auto_670070 ?auto_670084 ) ) ( not ( = ?auto_670071 ?auto_670072 ) ) ( not ( = ?auto_670071 ?auto_670073 ) ) ( not ( = ?auto_670071 ?auto_670074 ) ) ( not ( = ?auto_670071 ?auto_670075 ) ) ( not ( = ?auto_670071 ?auto_670076 ) ) ( not ( = ?auto_670071 ?auto_670077 ) ) ( not ( = ?auto_670071 ?auto_670078 ) ) ( not ( = ?auto_670071 ?auto_670079 ) ) ( not ( = ?auto_670071 ?auto_670080 ) ) ( not ( = ?auto_670071 ?auto_670081 ) ) ( not ( = ?auto_670071 ?auto_670082 ) ) ( not ( = ?auto_670071 ?auto_670083 ) ) ( not ( = ?auto_670071 ?auto_670084 ) ) ( not ( = ?auto_670072 ?auto_670073 ) ) ( not ( = ?auto_670072 ?auto_670074 ) ) ( not ( = ?auto_670072 ?auto_670075 ) ) ( not ( = ?auto_670072 ?auto_670076 ) ) ( not ( = ?auto_670072 ?auto_670077 ) ) ( not ( = ?auto_670072 ?auto_670078 ) ) ( not ( = ?auto_670072 ?auto_670079 ) ) ( not ( = ?auto_670072 ?auto_670080 ) ) ( not ( = ?auto_670072 ?auto_670081 ) ) ( not ( = ?auto_670072 ?auto_670082 ) ) ( not ( = ?auto_670072 ?auto_670083 ) ) ( not ( = ?auto_670072 ?auto_670084 ) ) ( not ( = ?auto_670073 ?auto_670074 ) ) ( not ( = ?auto_670073 ?auto_670075 ) ) ( not ( = ?auto_670073 ?auto_670076 ) ) ( not ( = ?auto_670073 ?auto_670077 ) ) ( not ( = ?auto_670073 ?auto_670078 ) ) ( not ( = ?auto_670073 ?auto_670079 ) ) ( not ( = ?auto_670073 ?auto_670080 ) ) ( not ( = ?auto_670073 ?auto_670081 ) ) ( not ( = ?auto_670073 ?auto_670082 ) ) ( not ( = ?auto_670073 ?auto_670083 ) ) ( not ( = ?auto_670073 ?auto_670084 ) ) ( not ( = ?auto_670074 ?auto_670075 ) ) ( not ( = ?auto_670074 ?auto_670076 ) ) ( not ( = ?auto_670074 ?auto_670077 ) ) ( not ( = ?auto_670074 ?auto_670078 ) ) ( not ( = ?auto_670074 ?auto_670079 ) ) ( not ( = ?auto_670074 ?auto_670080 ) ) ( not ( = ?auto_670074 ?auto_670081 ) ) ( not ( = ?auto_670074 ?auto_670082 ) ) ( not ( = ?auto_670074 ?auto_670083 ) ) ( not ( = ?auto_670074 ?auto_670084 ) ) ( not ( = ?auto_670075 ?auto_670076 ) ) ( not ( = ?auto_670075 ?auto_670077 ) ) ( not ( = ?auto_670075 ?auto_670078 ) ) ( not ( = ?auto_670075 ?auto_670079 ) ) ( not ( = ?auto_670075 ?auto_670080 ) ) ( not ( = ?auto_670075 ?auto_670081 ) ) ( not ( = ?auto_670075 ?auto_670082 ) ) ( not ( = ?auto_670075 ?auto_670083 ) ) ( not ( = ?auto_670075 ?auto_670084 ) ) ( not ( = ?auto_670076 ?auto_670077 ) ) ( not ( = ?auto_670076 ?auto_670078 ) ) ( not ( = ?auto_670076 ?auto_670079 ) ) ( not ( = ?auto_670076 ?auto_670080 ) ) ( not ( = ?auto_670076 ?auto_670081 ) ) ( not ( = ?auto_670076 ?auto_670082 ) ) ( not ( = ?auto_670076 ?auto_670083 ) ) ( not ( = ?auto_670076 ?auto_670084 ) ) ( not ( = ?auto_670077 ?auto_670078 ) ) ( not ( = ?auto_670077 ?auto_670079 ) ) ( not ( = ?auto_670077 ?auto_670080 ) ) ( not ( = ?auto_670077 ?auto_670081 ) ) ( not ( = ?auto_670077 ?auto_670082 ) ) ( not ( = ?auto_670077 ?auto_670083 ) ) ( not ( = ?auto_670077 ?auto_670084 ) ) ( not ( = ?auto_670078 ?auto_670079 ) ) ( not ( = ?auto_670078 ?auto_670080 ) ) ( not ( = ?auto_670078 ?auto_670081 ) ) ( not ( = ?auto_670078 ?auto_670082 ) ) ( not ( = ?auto_670078 ?auto_670083 ) ) ( not ( = ?auto_670078 ?auto_670084 ) ) ( not ( = ?auto_670079 ?auto_670080 ) ) ( not ( = ?auto_670079 ?auto_670081 ) ) ( not ( = ?auto_670079 ?auto_670082 ) ) ( not ( = ?auto_670079 ?auto_670083 ) ) ( not ( = ?auto_670079 ?auto_670084 ) ) ( not ( = ?auto_670080 ?auto_670081 ) ) ( not ( = ?auto_670080 ?auto_670082 ) ) ( not ( = ?auto_670080 ?auto_670083 ) ) ( not ( = ?auto_670080 ?auto_670084 ) ) ( not ( = ?auto_670081 ?auto_670082 ) ) ( not ( = ?auto_670081 ?auto_670083 ) ) ( not ( = ?auto_670081 ?auto_670084 ) ) ( not ( = ?auto_670082 ?auto_670083 ) ) ( not ( = ?auto_670082 ?auto_670084 ) ) ( not ( = ?auto_670083 ?auto_670084 ) ) ( ON ?auto_670082 ?auto_670083 ) ( ON ?auto_670081 ?auto_670082 ) ( ON ?auto_670080 ?auto_670081 ) ( ON ?auto_670079 ?auto_670080 ) ( ON ?auto_670078 ?auto_670079 ) ( ON ?auto_670077 ?auto_670078 ) ( ON ?auto_670076 ?auto_670077 ) ( ON ?auto_670075 ?auto_670076 ) ( ON ?auto_670074 ?auto_670075 ) ( ON ?auto_670073 ?auto_670074 ) ( ON ?auto_670072 ?auto_670073 ) ( CLEAR ?auto_670070 ) ( ON ?auto_670071 ?auto_670072 ) ( CLEAR ?auto_670071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_670069 ?auto_670070 ?auto_670071 )
      ( MAKE-15PILE ?auto_670069 ?auto_670070 ?auto_670071 ?auto_670072 ?auto_670073 ?auto_670074 ?auto_670075 ?auto_670076 ?auto_670077 ?auto_670078 ?auto_670079 ?auto_670080 ?auto_670081 ?auto_670082 ?auto_670083 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_670131 - BLOCK
      ?auto_670132 - BLOCK
      ?auto_670133 - BLOCK
      ?auto_670134 - BLOCK
      ?auto_670135 - BLOCK
      ?auto_670136 - BLOCK
      ?auto_670137 - BLOCK
      ?auto_670138 - BLOCK
      ?auto_670139 - BLOCK
      ?auto_670140 - BLOCK
      ?auto_670141 - BLOCK
      ?auto_670142 - BLOCK
      ?auto_670143 - BLOCK
      ?auto_670144 - BLOCK
      ?auto_670145 - BLOCK
    )
    :vars
    (
      ?auto_670146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670145 ?auto_670146 ) ( ON-TABLE ?auto_670131 ) ( not ( = ?auto_670131 ?auto_670132 ) ) ( not ( = ?auto_670131 ?auto_670133 ) ) ( not ( = ?auto_670131 ?auto_670134 ) ) ( not ( = ?auto_670131 ?auto_670135 ) ) ( not ( = ?auto_670131 ?auto_670136 ) ) ( not ( = ?auto_670131 ?auto_670137 ) ) ( not ( = ?auto_670131 ?auto_670138 ) ) ( not ( = ?auto_670131 ?auto_670139 ) ) ( not ( = ?auto_670131 ?auto_670140 ) ) ( not ( = ?auto_670131 ?auto_670141 ) ) ( not ( = ?auto_670131 ?auto_670142 ) ) ( not ( = ?auto_670131 ?auto_670143 ) ) ( not ( = ?auto_670131 ?auto_670144 ) ) ( not ( = ?auto_670131 ?auto_670145 ) ) ( not ( = ?auto_670131 ?auto_670146 ) ) ( not ( = ?auto_670132 ?auto_670133 ) ) ( not ( = ?auto_670132 ?auto_670134 ) ) ( not ( = ?auto_670132 ?auto_670135 ) ) ( not ( = ?auto_670132 ?auto_670136 ) ) ( not ( = ?auto_670132 ?auto_670137 ) ) ( not ( = ?auto_670132 ?auto_670138 ) ) ( not ( = ?auto_670132 ?auto_670139 ) ) ( not ( = ?auto_670132 ?auto_670140 ) ) ( not ( = ?auto_670132 ?auto_670141 ) ) ( not ( = ?auto_670132 ?auto_670142 ) ) ( not ( = ?auto_670132 ?auto_670143 ) ) ( not ( = ?auto_670132 ?auto_670144 ) ) ( not ( = ?auto_670132 ?auto_670145 ) ) ( not ( = ?auto_670132 ?auto_670146 ) ) ( not ( = ?auto_670133 ?auto_670134 ) ) ( not ( = ?auto_670133 ?auto_670135 ) ) ( not ( = ?auto_670133 ?auto_670136 ) ) ( not ( = ?auto_670133 ?auto_670137 ) ) ( not ( = ?auto_670133 ?auto_670138 ) ) ( not ( = ?auto_670133 ?auto_670139 ) ) ( not ( = ?auto_670133 ?auto_670140 ) ) ( not ( = ?auto_670133 ?auto_670141 ) ) ( not ( = ?auto_670133 ?auto_670142 ) ) ( not ( = ?auto_670133 ?auto_670143 ) ) ( not ( = ?auto_670133 ?auto_670144 ) ) ( not ( = ?auto_670133 ?auto_670145 ) ) ( not ( = ?auto_670133 ?auto_670146 ) ) ( not ( = ?auto_670134 ?auto_670135 ) ) ( not ( = ?auto_670134 ?auto_670136 ) ) ( not ( = ?auto_670134 ?auto_670137 ) ) ( not ( = ?auto_670134 ?auto_670138 ) ) ( not ( = ?auto_670134 ?auto_670139 ) ) ( not ( = ?auto_670134 ?auto_670140 ) ) ( not ( = ?auto_670134 ?auto_670141 ) ) ( not ( = ?auto_670134 ?auto_670142 ) ) ( not ( = ?auto_670134 ?auto_670143 ) ) ( not ( = ?auto_670134 ?auto_670144 ) ) ( not ( = ?auto_670134 ?auto_670145 ) ) ( not ( = ?auto_670134 ?auto_670146 ) ) ( not ( = ?auto_670135 ?auto_670136 ) ) ( not ( = ?auto_670135 ?auto_670137 ) ) ( not ( = ?auto_670135 ?auto_670138 ) ) ( not ( = ?auto_670135 ?auto_670139 ) ) ( not ( = ?auto_670135 ?auto_670140 ) ) ( not ( = ?auto_670135 ?auto_670141 ) ) ( not ( = ?auto_670135 ?auto_670142 ) ) ( not ( = ?auto_670135 ?auto_670143 ) ) ( not ( = ?auto_670135 ?auto_670144 ) ) ( not ( = ?auto_670135 ?auto_670145 ) ) ( not ( = ?auto_670135 ?auto_670146 ) ) ( not ( = ?auto_670136 ?auto_670137 ) ) ( not ( = ?auto_670136 ?auto_670138 ) ) ( not ( = ?auto_670136 ?auto_670139 ) ) ( not ( = ?auto_670136 ?auto_670140 ) ) ( not ( = ?auto_670136 ?auto_670141 ) ) ( not ( = ?auto_670136 ?auto_670142 ) ) ( not ( = ?auto_670136 ?auto_670143 ) ) ( not ( = ?auto_670136 ?auto_670144 ) ) ( not ( = ?auto_670136 ?auto_670145 ) ) ( not ( = ?auto_670136 ?auto_670146 ) ) ( not ( = ?auto_670137 ?auto_670138 ) ) ( not ( = ?auto_670137 ?auto_670139 ) ) ( not ( = ?auto_670137 ?auto_670140 ) ) ( not ( = ?auto_670137 ?auto_670141 ) ) ( not ( = ?auto_670137 ?auto_670142 ) ) ( not ( = ?auto_670137 ?auto_670143 ) ) ( not ( = ?auto_670137 ?auto_670144 ) ) ( not ( = ?auto_670137 ?auto_670145 ) ) ( not ( = ?auto_670137 ?auto_670146 ) ) ( not ( = ?auto_670138 ?auto_670139 ) ) ( not ( = ?auto_670138 ?auto_670140 ) ) ( not ( = ?auto_670138 ?auto_670141 ) ) ( not ( = ?auto_670138 ?auto_670142 ) ) ( not ( = ?auto_670138 ?auto_670143 ) ) ( not ( = ?auto_670138 ?auto_670144 ) ) ( not ( = ?auto_670138 ?auto_670145 ) ) ( not ( = ?auto_670138 ?auto_670146 ) ) ( not ( = ?auto_670139 ?auto_670140 ) ) ( not ( = ?auto_670139 ?auto_670141 ) ) ( not ( = ?auto_670139 ?auto_670142 ) ) ( not ( = ?auto_670139 ?auto_670143 ) ) ( not ( = ?auto_670139 ?auto_670144 ) ) ( not ( = ?auto_670139 ?auto_670145 ) ) ( not ( = ?auto_670139 ?auto_670146 ) ) ( not ( = ?auto_670140 ?auto_670141 ) ) ( not ( = ?auto_670140 ?auto_670142 ) ) ( not ( = ?auto_670140 ?auto_670143 ) ) ( not ( = ?auto_670140 ?auto_670144 ) ) ( not ( = ?auto_670140 ?auto_670145 ) ) ( not ( = ?auto_670140 ?auto_670146 ) ) ( not ( = ?auto_670141 ?auto_670142 ) ) ( not ( = ?auto_670141 ?auto_670143 ) ) ( not ( = ?auto_670141 ?auto_670144 ) ) ( not ( = ?auto_670141 ?auto_670145 ) ) ( not ( = ?auto_670141 ?auto_670146 ) ) ( not ( = ?auto_670142 ?auto_670143 ) ) ( not ( = ?auto_670142 ?auto_670144 ) ) ( not ( = ?auto_670142 ?auto_670145 ) ) ( not ( = ?auto_670142 ?auto_670146 ) ) ( not ( = ?auto_670143 ?auto_670144 ) ) ( not ( = ?auto_670143 ?auto_670145 ) ) ( not ( = ?auto_670143 ?auto_670146 ) ) ( not ( = ?auto_670144 ?auto_670145 ) ) ( not ( = ?auto_670144 ?auto_670146 ) ) ( not ( = ?auto_670145 ?auto_670146 ) ) ( ON ?auto_670144 ?auto_670145 ) ( ON ?auto_670143 ?auto_670144 ) ( ON ?auto_670142 ?auto_670143 ) ( ON ?auto_670141 ?auto_670142 ) ( ON ?auto_670140 ?auto_670141 ) ( ON ?auto_670139 ?auto_670140 ) ( ON ?auto_670138 ?auto_670139 ) ( ON ?auto_670137 ?auto_670138 ) ( ON ?auto_670136 ?auto_670137 ) ( ON ?auto_670135 ?auto_670136 ) ( ON ?auto_670134 ?auto_670135 ) ( ON ?auto_670133 ?auto_670134 ) ( CLEAR ?auto_670131 ) ( ON ?auto_670132 ?auto_670133 ) ( CLEAR ?auto_670132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_670131 ?auto_670132 )
      ( MAKE-15PILE ?auto_670131 ?auto_670132 ?auto_670133 ?auto_670134 ?auto_670135 ?auto_670136 ?auto_670137 ?auto_670138 ?auto_670139 ?auto_670140 ?auto_670141 ?auto_670142 ?auto_670143 ?auto_670144 ?auto_670145 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_670193 - BLOCK
      ?auto_670194 - BLOCK
      ?auto_670195 - BLOCK
      ?auto_670196 - BLOCK
      ?auto_670197 - BLOCK
      ?auto_670198 - BLOCK
      ?auto_670199 - BLOCK
      ?auto_670200 - BLOCK
      ?auto_670201 - BLOCK
      ?auto_670202 - BLOCK
      ?auto_670203 - BLOCK
      ?auto_670204 - BLOCK
      ?auto_670205 - BLOCK
      ?auto_670206 - BLOCK
      ?auto_670207 - BLOCK
    )
    :vars
    (
      ?auto_670208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670207 ?auto_670208 ) ( not ( = ?auto_670193 ?auto_670194 ) ) ( not ( = ?auto_670193 ?auto_670195 ) ) ( not ( = ?auto_670193 ?auto_670196 ) ) ( not ( = ?auto_670193 ?auto_670197 ) ) ( not ( = ?auto_670193 ?auto_670198 ) ) ( not ( = ?auto_670193 ?auto_670199 ) ) ( not ( = ?auto_670193 ?auto_670200 ) ) ( not ( = ?auto_670193 ?auto_670201 ) ) ( not ( = ?auto_670193 ?auto_670202 ) ) ( not ( = ?auto_670193 ?auto_670203 ) ) ( not ( = ?auto_670193 ?auto_670204 ) ) ( not ( = ?auto_670193 ?auto_670205 ) ) ( not ( = ?auto_670193 ?auto_670206 ) ) ( not ( = ?auto_670193 ?auto_670207 ) ) ( not ( = ?auto_670193 ?auto_670208 ) ) ( not ( = ?auto_670194 ?auto_670195 ) ) ( not ( = ?auto_670194 ?auto_670196 ) ) ( not ( = ?auto_670194 ?auto_670197 ) ) ( not ( = ?auto_670194 ?auto_670198 ) ) ( not ( = ?auto_670194 ?auto_670199 ) ) ( not ( = ?auto_670194 ?auto_670200 ) ) ( not ( = ?auto_670194 ?auto_670201 ) ) ( not ( = ?auto_670194 ?auto_670202 ) ) ( not ( = ?auto_670194 ?auto_670203 ) ) ( not ( = ?auto_670194 ?auto_670204 ) ) ( not ( = ?auto_670194 ?auto_670205 ) ) ( not ( = ?auto_670194 ?auto_670206 ) ) ( not ( = ?auto_670194 ?auto_670207 ) ) ( not ( = ?auto_670194 ?auto_670208 ) ) ( not ( = ?auto_670195 ?auto_670196 ) ) ( not ( = ?auto_670195 ?auto_670197 ) ) ( not ( = ?auto_670195 ?auto_670198 ) ) ( not ( = ?auto_670195 ?auto_670199 ) ) ( not ( = ?auto_670195 ?auto_670200 ) ) ( not ( = ?auto_670195 ?auto_670201 ) ) ( not ( = ?auto_670195 ?auto_670202 ) ) ( not ( = ?auto_670195 ?auto_670203 ) ) ( not ( = ?auto_670195 ?auto_670204 ) ) ( not ( = ?auto_670195 ?auto_670205 ) ) ( not ( = ?auto_670195 ?auto_670206 ) ) ( not ( = ?auto_670195 ?auto_670207 ) ) ( not ( = ?auto_670195 ?auto_670208 ) ) ( not ( = ?auto_670196 ?auto_670197 ) ) ( not ( = ?auto_670196 ?auto_670198 ) ) ( not ( = ?auto_670196 ?auto_670199 ) ) ( not ( = ?auto_670196 ?auto_670200 ) ) ( not ( = ?auto_670196 ?auto_670201 ) ) ( not ( = ?auto_670196 ?auto_670202 ) ) ( not ( = ?auto_670196 ?auto_670203 ) ) ( not ( = ?auto_670196 ?auto_670204 ) ) ( not ( = ?auto_670196 ?auto_670205 ) ) ( not ( = ?auto_670196 ?auto_670206 ) ) ( not ( = ?auto_670196 ?auto_670207 ) ) ( not ( = ?auto_670196 ?auto_670208 ) ) ( not ( = ?auto_670197 ?auto_670198 ) ) ( not ( = ?auto_670197 ?auto_670199 ) ) ( not ( = ?auto_670197 ?auto_670200 ) ) ( not ( = ?auto_670197 ?auto_670201 ) ) ( not ( = ?auto_670197 ?auto_670202 ) ) ( not ( = ?auto_670197 ?auto_670203 ) ) ( not ( = ?auto_670197 ?auto_670204 ) ) ( not ( = ?auto_670197 ?auto_670205 ) ) ( not ( = ?auto_670197 ?auto_670206 ) ) ( not ( = ?auto_670197 ?auto_670207 ) ) ( not ( = ?auto_670197 ?auto_670208 ) ) ( not ( = ?auto_670198 ?auto_670199 ) ) ( not ( = ?auto_670198 ?auto_670200 ) ) ( not ( = ?auto_670198 ?auto_670201 ) ) ( not ( = ?auto_670198 ?auto_670202 ) ) ( not ( = ?auto_670198 ?auto_670203 ) ) ( not ( = ?auto_670198 ?auto_670204 ) ) ( not ( = ?auto_670198 ?auto_670205 ) ) ( not ( = ?auto_670198 ?auto_670206 ) ) ( not ( = ?auto_670198 ?auto_670207 ) ) ( not ( = ?auto_670198 ?auto_670208 ) ) ( not ( = ?auto_670199 ?auto_670200 ) ) ( not ( = ?auto_670199 ?auto_670201 ) ) ( not ( = ?auto_670199 ?auto_670202 ) ) ( not ( = ?auto_670199 ?auto_670203 ) ) ( not ( = ?auto_670199 ?auto_670204 ) ) ( not ( = ?auto_670199 ?auto_670205 ) ) ( not ( = ?auto_670199 ?auto_670206 ) ) ( not ( = ?auto_670199 ?auto_670207 ) ) ( not ( = ?auto_670199 ?auto_670208 ) ) ( not ( = ?auto_670200 ?auto_670201 ) ) ( not ( = ?auto_670200 ?auto_670202 ) ) ( not ( = ?auto_670200 ?auto_670203 ) ) ( not ( = ?auto_670200 ?auto_670204 ) ) ( not ( = ?auto_670200 ?auto_670205 ) ) ( not ( = ?auto_670200 ?auto_670206 ) ) ( not ( = ?auto_670200 ?auto_670207 ) ) ( not ( = ?auto_670200 ?auto_670208 ) ) ( not ( = ?auto_670201 ?auto_670202 ) ) ( not ( = ?auto_670201 ?auto_670203 ) ) ( not ( = ?auto_670201 ?auto_670204 ) ) ( not ( = ?auto_670201 ?auto_670205 ) ) ( not ( = ?auto_670201 ?auto_670206 ) ) ( not ( = ?auto_670201 ?auto_670207 ) ) ( not ( = ?auto_670201 ?auto_670208 ) ) ( not ( = ?auto_670202 ?auto_670203 ) ) ( not ( = ?auto_670202 ?auto_670204 ) ) ( not ( = ?auto_670202 ?auto_670205 ) ) ( not ( = ?auto_670202 ?auto_670206 ) ) ( not ( = ?auto_670202 ?auto_670207 ) ) ( not ( = ?auto_670202 ?auto_670208 ) ) ( not ( = ?auto_670203 ?auto_670204 ) ) ( not ( = ?auto_670203 ?auto_670205 ) ) ( not ( = ?auto_670203 ?auto_670206 ) ) ( not ( = ?auto_670203 ?auto_670207 ) ) ( not ( = ?auto_670203 ?auto_670208 ) ) ( not ( = ?auto_670204 ?auto_670205 ) ) ( not ( = ?auto_670204 ?auto_670206 ) ) ( not ( = ?auto_670204 ?auto_670207 ) ) ( not ( = ?auto_670204 ?auto_670208 ) ) ( not ( = ?auto_670205 ?auto_670206 ) ) ( not ( = ?auto_670205 ?auto_670207 ) ) ( not ( = ?auto_670205 ?auto_670208 ) ) ( not ( = ?auto_670206 ?auto_670207 ) ) ( not ( = ?auto_670206 ?auto_670208 ) ) ( not ( = ?auto_670207 ?auto_670208 ) ) ( ON ?auto_670206 ?auto_670207 ) ( ON ?auto_670205 ?auto_670206 ) ( ON ?auto_670204 ?auto_670205 ) ( ON ?auto_670203 ?auto_670204 ) ( ON ?auto_670202 ?auto_670203 ) ( ON ?auto_670201 ?auto_670202 ) ( ON ?auto_670200 ?auto_670201 ) ( ON ?auto_670199 ?auto_670200 ) ( ON ?auto_670198 ?auto_670199 ) ( ON ?auto_670197 ?auto_670198 ) ( ON ?auto_670196 ?auto_670197 ) ( ON ?auto_670195 ?auto_670196 ) ( ON ?auto_670194 ?auto_670195 ) ( ON ?auto_670193 ?auto_670194 ) ( CLEAR ?auto_670193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_670193 )
      ( MAKE-15PILE ?auto_670193 ?auto_670194 ?auto_670195 ?auto_670196 ?auto_670197 ?auto_670198 ?auto_670199 ?auto_670200 ?auto_670201 ?auto_670202 ?auto_670203 ?auto_670204 ?auto_670205 ?auto_670206 ?auto_670207 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670256 - BLOCK
      ?auto_670257 - BLOCK
      ?auto_670258 - BLOCK
      ?auto_670259 - BLOCK
      ?auto_670260 - BLOCK
      ?auto_670261 - BLOCK
      ?auto_670262 - BLOCK
      ?auto_670263 - BLOCK
      ?auto_670264 - BLOCK
      ?auto_670265 - BLOCK
      ?auto_670266 - BLOCK
      ?auto_670267 - BLOCK
      ?auto_670268 - BLOCK
      ?auto_670269 - BLOCK
      ?auto_670270 - BLOCK
      ?auto_670271 - BLOCK
    )
    :vars
    (
      ?auto_670272 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_670270 ) ( ON ?auto_670271 ?auto_670272 ) ( CLEAR ?auto_670271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_670256 ) ( ON ?auto_670257 ?auto_670256 ) ( ON ?auto_670258 ?auto_670257 ) ( ON ?auto_670259 ?auto_670258 ) ( ON ?auto_670260 ?auto_670259 ) ( ON ?auto_670261 ?auto_670260 ) ( ON ?auto_670262 ?auto_670261 ) ( ON ?auto_670263 ?auto_670262 ) ( ON ?auto_670264 ?auto_670263 ) ( ON ?auto_670265 ?auto_670264 ) ( ON ?auto_670266 ?auto_670265 ) ( ON ?auto_670267 ?auto_670266 ) ( ON ?auto_670268 ?auto_670267 ) ( ON ?auto_670269 ?auto_670268 ) ( ON ?auto_670270 ?auto_670269 ) ( not ( = ?auto_670256 ?auto_670257 ) ) ( not ( = ?auto_670256 ?auto_670258 ) ) ( not ( = ?auto_670256 ?auto_670259 ) ) ( not ( = ?auto_670256 ?auto_670260 ) ) ( not ( = ?auto_670256 ?auto_670261 ) ) ( not ( = ?auto_670256 ?auto_670262 ) ) ( not ( = ?auto_670256 ?auto_670263 ) ) ( not ( = ?auto_670256 ?auto_670264 ) ) ( not ( = ?auto_670256 ?auto_670265 ) ) ( not ( = ?auto_670256 ?auto_670266 ) ) ( not ( = ?auto_670256 ?auto_670267 ) ) ( not ( = ?auto_670256 ?auto_670268 ) ) ( not ( = ?auto_670256 ?auto_670269 ) ) ( not ( = ?auto_670256 ?auto_670270 ) ) ( not ( = ?auto_670256 ?auto_670271 ) ) ( not ( = ?auto_670256 ?auto_670272 ) ) ( not ( = ?auto_670257 ?auto_670258 ) ) ( not ( = ?auto_670257 ?auto_670259 ) ) ( not ( = ?auto_670257 ?auto_670260 ) ) ( not ( = ?auto_670257 ?auto_670261 ) ) ( not ( = ?auto_670257 ?auto_670262 ) ) ( not ( = ?auto_670257 ?auto_670263 ) ) ( not ( = ?auto_670257 ?auto_670264 ) ) ( not ( = ?auto_670257 ?auto_670265 ) ) ( not ( = ?auto_670257 ?auto_670266 ) ) ( not ( = ?auto_670257 ?auto_670267 ) ) ( not ( = ?auto_670257 ?auto_670268 ) ) ( not ( = ?auto_670257 ?auto_670269 ) ) ( not ( = ?auto_670257 ?auto_670270 ) ) ( not ( = ?auto_670257 ?auto_670271 ) ) ( not ( = ?auto_670257 ?auto_670272 ) ) ( not ( = ?auto_670258 ?auto_670259 ) ) ( not ( = ?auto_670258 ?auto_670260 ) ) ( not ( = ?auto_670258 ?auto_670261 ) ) ( not ( = ?auto_670258 ?auto_670262 ) ) ( not ( = ?auto_670258 ?auto_670263 ) ) ( not ( = ?auto_670258 ?auto_670264 ) ) ( not ( = ?auto_670258 ?auto_670265 ) ) ( not ( = ?auto_670258 ?auto_670266 ) ) ( not ( = ?auto_670258 ?auto_670267 ) ) ( not ( = ?auto_670258 ?auto_670268 ) ) ( not ( = ?auto_670258 ?auto_670269 ) ) ( not ( = ?auto_670258 ?auto_670270 ) ) ( not ( = ?auto_670258 ?auto_670271 ) ) ( not ( = ?auto_670258 ?auto_670272 ) ) ( not ( = ?auto_670259 ?auto_670260 ) ) ( not ( = ?auto_670259 ?auto_670261 ) ) ( not ( = ?auto_670259 ?auto_670262 ) ) ( not ( = ?auto_670259 ?auto_670263 ) ) ( not ( = ?auto_670259 ?auto_670264 ) ) ( not ( = ?auto_670259 ?auto_670265 ) ) ( not ( = ?auto_670259 ?auto_670266 ) ) ( not ( = ?auto_670259 ?auto_670267 ) ) ( not ( = ?auto_670259 ?auto_670268 ) ) ( not ( = ?auto_670259 ?auto_670269 ) ) ( not ( = ?auto_670259 ?auto_670270 ) ) ( not ( = ?auto_670259 ?auto_670271 ) ) ( not ( = ?auto_670259 ?auto_670272 ) ) ( not ( = ?auto_670260 ?auto_670261 ) ) ( not ( = ?auto_670260 ?auto_670262 ) ) ( not ( = ?auto_670260 ?auto_670263 ) ) ( not ( = ?auto_670260 ?auto_670264 ) ) ( not ( = ?auto_670260 ?auto_670265 ) ) ( not ( = ?auto_670260 ?auto_670266 ) ) ( not ( = ?auto_670260 ?auto_670267 ) ) ( not ( = ?auto_670260 ?auto_670268 ) ) ( not ( = ?auto_670260 ?auto_670269 ) ) ( not ( = ?auto_670260 ?auto_670270 ) ) ( not ( = ?auto_670260 ?auto_670271 ) ) ( not ( = ?auto_670260 ?auto_670272 ) ) ( not ( = ?auto_670261 ?auto_670262 ) ) ( not ( = ?auto_670261 ?auto_670263 ) ) ( not ( = ?auto_670261 ?auto_670264 ) ) ( not ( = ?auto_670261 ?auto_670265 ) ) ( not ( = ?auto_670261 ?auto_670266 ) ) ( not ( = ?auto_670261 ?auto_670267 ) ) ( not ( = ?auto_670261 ?auto_670268 ) ) ( not ( = ?auto_670261 ?auto_670269 ) ) ( not ( = ?auto_670261 ?auto_670270 ) ) ( not ( = ?auto_670261 ?auto_670271 ) ) ( not ( = ?auto_670261 ?auto_670272 ) ) ( not ( = ?auto_670262 ?auto_670263 ) ) ( not ( = ?auto_670262 ?auto_670264 ) ) ( not ( = ?auto_670262 ?auto_670265 ) ) ( not ( = ?auto_670262 ?auto_670266 ) ) ( not ( = ?auto_670262 ?auto_670267 ) ) ( not ( = ?auto_670262 ?auto_670268 ) ) ( not ( = ?auto_670262 ?auto_670269 ) ) ( not ( = ?auto_670262 ?auto_670270 ) ) ( not ( = ?auto_670262 ?auto_670271 ) ) ( not ( = ?auto_670262 ?auto_670272 ) ) ( not ( = ?auto_670263 ?auto_670264 ) ) ( not ( = ?auto_670263 ?auto_670265 ) ) ( not ( = ?auto_670263 ?auto_670266 ) ) ( not ( = ?auto_670263 ?auto_670267 ) ) ( not ( = ?auto_670263 ?auto_670268 ) ) ( not ( = ?auto_670263 ?auto_670269 ) ) ( not ( = ?auto_670263 ?auto_670270 ) ) ( not ( = ?auto_670263 ?auto_670271 ) ) ( not ( = ?auto_670263 ?auto_670272 ) ) ( not ( = ?auto_670264 ?auto_670265 ) ) ( not ( = ?auto_670264 ?auto_670266 ) ) ( not ( = ?auto_670264 ?auto_670267 ) ) ( not ( = ?auto_670264 ?auto_670268 ) ) ( not ( = ?auto_670264 ?auto_670269 ) ) ( not ( = ?auto_670264 ?auto_670270 ) ) ( not ( = ?auto_670264 ?auto_670271 ) ) ( not ( = ?auto_670264 ?auto_670272 ) ) ( not ( = ?auto_670265 ?auto_670266 ) ) ( not ( = ?auto_670265 ?auto_670267 ) ) ( not ( = ?auto_670265 ?auto_670268 ) ) ( not ( = ?auto_670265 ?auto_670269 ) ) ( not ( = ?auto_670265 ?auto_670270 ) ) ( not ( = ?auto_670265 ?auto_670271 ) ) ( not ( = ?auto_670265 ?auto_670272 ) ) ( not ( = ?auto_670266 ?auto_670267 ) ) ( not ( = ?auto_670266 ?auto_670268 ) ) ( not ( = ?auto_670266 ?auto_670269 ) ) ( not ( = ?auto_670266 ?auto_670270 ) ) ( not ( = ?auto_670266 ?auto_670271 ) ) ( not ( = ?auto_670266 ?auto_670272 ) ) ( not ( = ?auto_670267 ?auto_670268 ) ) ( not ( = ?auto_670267 ?auto_670269 ) ) ( not ( = ?auto_670267 ?auto_670270 ) ) ( not ( = ?auto_670267 ?auto_670271 ) ) ( not ( = ?auto_670267 ?auto_670272 ) ) ( not ( = ?auto_670268 ?auto_670269 ) ) ( not ( = ?auto_670268 ?auto_670270 ) ) ( not ( = ?auto_670268 ?auto_670271 ) ) ( not ( = ?auto_670268 ?auto_670272 ) ) ( not ( = ?auto_670269 ?auto_670270 ) ) ( not ( = ?auto_670269 ?auto_670271 ) ) ( not ( = ?auto_670269 ?auto_670272 ) ) ( not ( = ?auto_670270 ?auto_670271 ) ) ( not ( = ?auto_670270 ?auto_670272 ) ) ( not ( = ?auto_670271 ?auto_670272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_670271 ?auto_670272 )
      ( !STACK ?auto_670271 ?auto_670270 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670322 - BLOCK
      ?auto_670323 - BLOCK
      ?auto_670324 - BLOCK
      ?auto_670325 - BLOCK
      ?auto_670326 - BLOCK
      ?auto_670327 - BLOCK
      ?auto_670328 - BLOCK
      ?auto_670329 - BLOCK
      ?auto_670330 - BLOCK
      ?auto_670331 - BLOCK
      ?auto_670332 - BLOCK
      ?auto_670333 - BLOCK
      ?auto_670334 - BLOCK
      ?auto_670335 - BLOCK
      ?auto_670336 - BLOCK
      ?auto_670337 - BLOCK
    )
    :vars
    (
      ?auto_670338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670337 ?auto_670338 ) ( ON-TABLE ?auto_670322 ) ( ON ?auto_670323 ?auto_670322 ) ( ON ?auto_670324 ?auto_670323 ) ( ON ?auto_670325 ?auto_670324 ) ( ON ?auto_670326 ?auto_670325 ) ( ON ?auto_670327 ?auto_670326 ) ( ON ?auto_670328 ?auto_670327 ) ( ON ?auto_670329 ?auto_670328 ) ( ON ?auto_670330 ?auto_670329 ) ( ON ?auto_670331 ?auto_670330 ) ( ON ?auto_670332 ?auto_670331 ) ( ON ?auto_670333 ?auto_670332 ) ( ON ?auto_670334 ?auto_670333 ) ( ON ?auto_670335 ?auto_670334 ) ( not ( = ?auto_670322 ?auto_670323 ) ) ( not ( = ?auto_670322 ?auto_670324 ) ) ( not ( = ?auto_670322 ?auto_670325 ) ) ( not ( = ?auto_670322 ?auto_670326 ) ) ( not ( = ?auto_670322 ?auto_670327 ) ) ( not ( = ?auto_670322 ?auto_670328 ) ) ( not ( = ?auto_670322 ?auto_670329 ) ) ( not ( = ?auto_670322 ?auto_670330 ) ) ( not ( = ?auto_670322 ?auto_670331 ) ) ( not ( = ?auto_670322 ?auto_670332 ) ) ( not ( = ?auto_670322 ?auto_670333 ) ) ( not ( = ?auto_670322 ?auto_670334 ) ) ( not ( = ?auto_670322 ?auto_670335 ) ) ( not ( = ?auto_670322 ?auto_670336 ) ) ( not ( = ?auto_670322 ?auto_670337 ) ) ( not ( = ?auto_670322 ?auto_670338 ) ) ( not ( = ?auto_670323 ?auto_670324 ) ) ( not ( = ?auto_670323 ?auto_670325 ) ) ( not ( = ?auto_670323 ?auto_670326 ) ) ( not ( = ?auto_670323 ?auto_670327 ) ) ( not ( = ?auto_670323 ?auto_670328 ) ) ( not ( = ?auto_670323 ?auto_670329 ) ) ( not ( = ?auto_670323 ?auto_670330 ) ) ( not ( = ?auto_670323 ?auto_670331 ) ) ( not ( = ?auto_670323 ?auto_670332 ) ) ( not ( = ?auto_670323 ?auto_670333 ) ) ( not ( = ?auto_670323 ?auto_670334 ) ) ( not ( = ?auto_670323 ?auto_670335 ) ) ( not ( = ?auto_670323 ?auto_670336 ) ) ( not ( = ?auto_670323 ?auto_670337 ) ) ( not ( = ?auto_670323 ?auto_670338 ) ) ( not ( = ?auto_670324 ?auto_670325 ) ) ( not ( = ?auto_670324 ?auto_670326 ) ) ( not ( = ?auto_670324 ?auto_670327 ) ) ( not ( = ?auto_670324 ?auto_670328 ) ) ( not ( = ?auto_670324 ?auto_670329 ) ) ( not ( = ?auto_670324 ?auto_670330 ) ) ( not ( = ?auto_670324 ?auto_670331 ) ) ( not ( = ?auto_670324 ?auto_670332 ) ) ( not ( = ?auto_670324 ?auto_670333 ) ) ( not ( = ?auto_670324 ?auto_670334 ) ) ( not ( = ?auto_670324 ?auto_670335 ) ) ( not ( = ?auto_670324 ?auto_670336 ) ) ( not ( = ?auto_670324 ?auto_670337 ) ) ( not ( = ?auto_670324 ?auto_670338 ) ) ( not ( = ?auto_670325 ?auto_670326 ) ) ( not ( = ?auto_670325 ?auto_670327 ) ) ( not ( = ?auto_670325 ?auto_670328 ) ) ( not ( = ?auto_670325 ?auto_670329 ) ) ( not ( = ?auto_670325 ?auto_670330 ) ) ( not ( = ?auto_670325 ?auto_670331 ) ) ( not ( = ?auto_670325 ?auto_670332 ) ) ( not ( = ?auto_670325 ?auto_670333 ) ) ( not ( = ?auto_670325 ?auto_670334 ) ) ( not ( = ?auto_670325 ?auto_670335 ) ) ( not ( = ?auto_670325 ?auto_670336 ) ) ( not ( = ?auto_670325 ?auto_670337 ) ) ( not ( = ?auto_670325 ?auto_670338 ) ) ( not ( = ?auto_670326 ?auto_670327 ) ) ( not ( = ?auto_670326 ?auto_670328 ) ) ( not ( = ?auto_670326 ?auto_670329 ) ) ( not ( = ?auto_670326 ?auto_670330 ) ) ( not ( = ?auto_670326 ?auto_670331 ) ) ( not ( = ?auto_670326 ?auto_670332 ) ) ( not ( = ?auto_670326 ?auto_670333 ) ) ( not ( = ?auto_670326 ?auto_670334 ) ) ( not ( = ?auto_670326 ?auto_670335 ) ) ( not ( = ?auto_670326 ?auto_670336 ) ) ( not ( = ?auto_670326 ?auto_670337 ) ) ( not ( = ?auto_670326 ?auto_670338 ) ) ( not ( = ?auto_670327 ?auto_670328 ) ) ( not ( = ?auto_670327 ?auto_670329 ) ) ( not ( = ?auto_670327 ?auto_670330 ) ) ( not ( = ?auto_670327 ?auto_670331 ) ) ( not ( = ?auto_670327 ?auto_670332 ) ) ( not ( = ?auto_670327 ?auto_670333 ) ) ( not ( = ?auto_670327 ?auto_670334 ) ) ( not ( = ?auto_670327 ?auto_670335 ) ) ( not ( = ?auto_670327 ?auto_670336 ) ) ( not ( = ?auto_670327 ?auto_670337 ) ) ( not ( = ?auto_670327 ?auto_670338 ) ) ( not ( = ?auto_670328 ?auto_670329 ) ) ( not ( = ?auto_670328 ?auto_670330 ) ) ( not ( = ?auto_670328 ?auto_670331 ) ) ( not ( = ?auto_670328 ?auto_670332 ) ) ( not ( = ?auto_670328 ?auto_670333 ) ) ( not ( = ?auto_670328 ?auto_670334 ) ) ( not ( = ?auto_670328 ?auto_670335 ) ) ( not ( = ?auto_670328 ?auto_670336 ) ) ( not ( = ?auto_670328 ?auto_670337 ) ) ( not ( = ?auto_670328 ?auto_670338 ) ) ( not ( = ?auto_670329 ?auto_670330 ) ) ( not ( = ?auto_670329 ?auto_670331 ) ) ( not ( = ?auto_670329 ?auto_670332 ) ) ( not ( = ?auto_670329 ?auto_670333 ) ) ( not ( = ?auto_670329 ?auto_670334 ) ) ( not ( = ?auto_670329 ?auto_670335 ) ) ( not ( = ?auto_670329 ?auto_670336 ) ) ( not ( = ?auto_670329 ?auto_670337 ) ) ( not ( = ?auto_670329 ?auto_670338 ) ) ( not ( = ?auto_670330 ?auto_670331 ) ) ( not ( = ?auto_670330 ?auto_670332 ) ) ( not ( = ?auto_670330 ?auto_670333 ) ) ( not ( = ?auto_670330 ?auto_670334 ) ) ( not ( = ?auto_670330 ?auto_670335 ) ) ( not ( = ?auto_670330 ?auto_670336 ) ) ( not ( = ?auto_670330 ?auto_670337 ) ) ( not ( = ?auto_670330 ?auto_670338 ) ) ( not ( = ?auto_670331 ?auto_670332 ) ) ( not ( = ?auto_670331 ?auto_670333 ) ) ( not ( = ?auto_670331 ?auto_670334 ) ) ( not ( = ?auto_670331 ?auto_670335 ) ) ( not ( = ?auto_670331 ?auto_670336 ) ) ( not ( = ?auto_670331 ?auto_670337 ) ) ( not ( = ?auto_670331 ?auto_670338 ) ) ( not ( = ?auto_670332 ?auto_670333 ) ) ( not ( = ?auto_670332 ?auto_670334 ) ) ( not ( = ?auto_670332 ?auto_670335 ) ) ( not ( = ?auto_670332 ?auto_670336 ) ) ( not ( = ?auto_670332 ?auto_670337 ) ) ( not ( = ?auto_670332 ?auto_670338 ) ) ( not ( = ?auto_670333 ?auto_670334 ) ) ( not ( = ?auto_670333 ?auto_670335 ) ) ( not ( = ?auto_670333 ?auto_670336 ) ) ( not ( = ?auto_670333 ?auto_670337 ) ) ( not ( = ?auto_670333 ?auto_670338 ) ) ( not ( = ?auto_670334 ?auto_670335 ) ) ( not ( = ?auto_670334 ?auto_670336 ) ) ( not ( = ?auto_670334 ?auto_670337 ) ) ( not ( = ?auto_670334 ?auto_670338 ) ) ( not ( = ?auto_670335 ?auto_670336 ) ) ( not ( = ?auto_670335 ?auto_670337 ) ) ( not ( = ?auto_670335 ?auto_670338 ) ) ( not ( = ?auto_670336 ?auto_670337 ) ) ( not ( = ?auto_670336 ?auto_670338 ) ) ( not ( = ?auto_670337 ?auto_670338 ) ) ( CLEAR ?auto_670335 ) ( ON ?auto_670336 ?auto_670337 ) ( CLEAR ?auto_670336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_670322 ?auto_670323 ?auto_670324 ?auto_670325 ?auto_670326 ?auto_670327 ?auto_670328 ?auto_670329 ?auto_670330 ?auto_670331 ?auto_670332 ?auto_670333 ?auto_670334 ?auto_670335 ?auto_670336 )
      ( MAKE-16PILE ?auto_670322 ?auto_670323 ?auto_670324 ?auto_670325 ?auto_670326 ?auto_670327 ?auto_670328 ?auto_670329 ?auto_670330 ?auto_670331 ?auto_670332 ?auto_670333 ?auto_670334 ?auto_670335 ?auto_670336 ?auto_670337 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670388 - BLOCK
      ?auto_670389 - BLOCK
      ?auto_670390 - BLOCK
      ?auto_670391 - BLOCK
      ?auto_670392 - BLOCK
      ?auto_670393 - BLOCK
      ?auto_670394 - BLOCK
      ?auto_670395 - BLOCK
      ?auto_670396 - BLOCK
      ?auto_670397 - BLOCK
      ?auto_670398 - BLOCK
      ?auto_670399 - BLOCK
      ?auto_670400 - BLOCK
      ?auto_670401 - BLOCK
      ?auto_670402 - BLOCK
      ?auto_670403 - BLOCK
    )
    :vars
    (
      ?auto_670404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670403 ?auto_670404 ) ( ON-TABLE ?auto_670388 ) ( ON ?auto_670389 ?auto_670388 ) ( ON ?auto_670390 ?auto_670389 ) ( ON ?auto_670391 ?auto_670390 ) ( ON ?auto_670392 ?auto_670391 ) ( ON ?auto_670393 ?auto_670392 ) ( ON ?auto_670394 ?auto_670393 ) ( ON ?auto_670395 ?auto_670394 ) ( ON ?auto_670396 ?auto_670395 ) ( ON ?auto_670397 ?auto_670396 ) ( ON ?auto_670398 ?auto_670397 ) ( ON ?auto_670399 ?auto_670398 ) ( ON ?auto_670400 ?auto_670399 ) ( not ( = ?auto_670388 ?auto_670389 ) ) ( not ( = ?auto_670388 ?auto_670390 ) ) ( not ( = ?auto_670388 ?auto_670391 ) ) ( not ( = ?auto_670388 ?auto_670392 ) ) ( not ( = ?auto_670388 ?auto_670393 ) ) ( not ( = ?auto_670388 ?auto_670394 ) ) ( not ( = ?auto_670388 ?auto_670395 ) ) ( not ( = ?auto_670388 ?auto_670396 ) ) ( not ( = ?auto_670388 ?auto_670397 ) ) ( not ( = ?auto_670388 ?auto_670398 ) ) ( not ( = ?auto_670388 ?auto_670399 ) ) ( not ( = ?auto_670388 ?auto_670400 ) ) ( not ( = ?auto_670388 ?auto_670401 ) ) ( not ( = ?auto_670388 ?auto_670402 ) ) ( not ( = ?auto_670388 ?auto_670403 ) ) ( not ( = ?auto_670388 ?auto_670404 ) ) ( not ( = ?auto_670389 ?auto_670390 ) ) ( not ( = ?auto_670389 ?auto_670391 ) ) ( not ( = ?auto_670389 ?auto_670392 ) ) ( not ( = ?auto_670389 ?auto_670393 ) ) ( not ( = ?auto_670389 ?auto_670394 ) ) ( not ( = ?auto_670389 ?auto_670395 ) ) ( not ( = ?auto_670389 ?auto_670396 ) ) ( not ( = ?auto_670389 ?auto_670397 ) ) ( not ( = ?auto_670389 ?auto_670398 ) ) ( not ( = ?auto_670389 ?auto_670399 ) ) ( not ( = ?auto_670389 ?auto_670400 ) ) ( not ( = ?auto_670389 ?auto_670401 ) ) ( not ( = ?auto_670389 ?auto_670402 ) ) ( not ( = ?auto_670389 ?auto_670403 ) ) ( not ( = ?auto_670389 ?auto_670404 ) ) ( not ( = ?auto_670390 ?auto_670391 ) ) ( not ( = ?auto_670390 ?auto_670392 ) ) ( not ( = ?auto_670390 ?auto_670393 ) ) ( not ( = ?auto_670390 ?auto_670394 ) ) ( not ( = ?auto_670390 ?auto_670395 ) ) ( not ( = ?auto_670390 ?auto_670396 ) ) ( not ( = ?auto_670390 ?auto_670397 ) ) ( not ( = ?auto_670390 ?auto_670398 ) ) ( not ( = ?auto_670390 ?auto_670399 ) ) ( not ( = ?auto_670390 ?auto_670400 ) ) ( not ( = ?auto_670390 ?auto_670401 ) ) ( not ( = ?auto_670390 ?auto_670402 ) ) ( not ( = ?auto_670390 ?auto_670403 ) ) ( not ( = ?auto_670390 ?auto_670404 ) ) ( not ( = ?auto_670391 ?auto_670392 ) ) ( not ( = ?auto_670391 ?auto_670393 ) ) ( not ( = ?auto_670391 ?auto_670394 ) ) ( not ( = ?auto_670391 ?auto_670395 ) ) ( not ( = ?auto_670391 ?auto_670396 ) ) ( not ( = ?auto_670391 ?auto_670397 ) ) ( not ( = ?auto_670391 ?auto_670398 ) ) ( not ( = ?auto_670391 ?auto_670399 ) ) ( not ( = ?auto_670391 ?auto_670400 ) ) ( not ( = ?auto_670391 ?auto_670401 ) ) ( not ( = ?auto_670391 ?auto_670402 ) ) ( not ( = ?auto_670391 ?auto_670403 ) ) ( not ( = ?auto_670391 ?auto_670404 ) ) ( not ( = ?auto_670392 ?auto_670393 ) ) ( not ( = ?auto_670392 ?auto_670394 ) ) ( not ( = ?auto_670392 ?auto_670395 ) ) ( not ( = ?auto_670392 ?auto_670396 ) ) ( not ( = ?auto_670392 ?auto_670397 ) ) ( not ( = ?auto_670392 ?auto_670398 ) ) ( not ( = ?auto_670392 ?auto_670399 ) ) ( not ( = ?auto_670392 ?auto_670400 ) ) ( not ( = ?auto_670392 ?auto_670401 ) ) ( not ( = ?auto_670392 ?auto_670402 ) ) ( not ( = ?auto_670392 ?auto_670403 ) ) ( not ( = ?auto_670392 ?auto_670404 ) ) ( not ( = ?auto_670393 ?auto_670394 ) ) ( not ( = ?auto_670393 ?auto_670395 ) ) ( not ( = ?auto_670393 ?auto_670396 ) ) ( not ( = ?auto_670393 ?auto_670397 ) ) ( not ( = ?auto_670393 ?auto_670398 ) ) ( not ( = ?auto_670393 ?auto_670399 ) ) ( not ( = ?auto_670393 ?auto_670400 ) ) ( not ( = ?auto_670393 ?auto_670401 ) ) ( not ( = ?auto_670393 ?auto_670402 ) ) ( not ( = ?auto_670393 ?auto_670403 ) ) ( not ( = ?auto_670393 ?auto_670404 ) ) ( not ( = ?auto_670394 ?auto_670395 ) ) ( not ( = ?auto_670394 ?auto_670396 ) ) ( not ( = ?auto_670394 ?auto_670397 ) ) ( not ( = ?auto_670394 ?auto_670398 ) ) ( not ( = ?auto_670394 ?auto_670399 ) ) ( not ( = ?auto_670394 ?auto_670400 ) ) ( not ( = ?auto_670394 ?auto_670401 ) ) ( not ( = ?auto_670394 ?auto_670402 ) ) ( not ( = ?auto_670394 ?auto_670403 ) ) ( not ( = ?auto_670394 ?auto_670404 ) ) ( not ( = ?auto_670395 ?auto_670396 ) ) ( not ( = ?auto_670395 ?auto_670397 ) ) ( not ( = ?auto_670395 ?auto_670398 ) ) ( not ( = ?auto_670395 ?auto_670399 ) ) ( not ( = ?auto_670395 ?auto_670400 ) ) ( not ( = ?auto_670395 ?auto_670401 ) ) ( not ( = ?auto_670395 ?auto_670402 ) ) ( not ( = ?auto_670395 ?auto_670403 ) ) ( not ( = ?auto_670395 ?auto_670404 ) ) ( not ( = ?auto_670396 ?auto_670397 ) ) ( not ( = ?auto_670396 ?auto_670398 ) ) ( not ( = ?auto_670396 ?auto_670399 ) ) ( not ( = ?auto_670396 ?auto_670400 ) ) ( not ( = ?auto_670396 ?auto_670401 ) ) ( not ( = ?auto_670396 ?auto_670402 ) ) ( not ( = ?auto_670396 ?auto_670403 ) ) ( not ( = ?auto_670396 ?auto_670404 ) ) ( not ( = ?auto_670397 ?auto_670398 ) ) ( not ( = ?auto_670397 ?auto_670399 ) ) ( not ( = ?auto_670397 ?auto_670400 ) ) ( not ( = ?auto_670397 ?auto_670401 ) ) ( not ( = ?auto_670397 ?auto_670402 ) ) ( not ( = ?auto_670397 ?auto_670403 ) ) ( not ( = ?auto_670397 ?auto_670404 ) ) ( not ( = ?auto_670398 ?auto_670399 ) ) ( not ( = ?auto_670398 ?auto_670400 ) ) ( not ( = ?auto_670398 ?auto_670401 ) ) ( not ( = ?auto_670398 ?auto_670402 ) ) ( not ( = ?auto_670398 ?auto_670403 ) ) ( not ( = ?auto_670398 ?auto_670404 ) ) ( not ( = ?auto_670399 ?auto_670400 ) ) ( not ( = ?auto_670399 ?auto_670401 ) ) ( not ( = ?auto_670399 ?auto_670402 ) ) ( not ( = ?auto_670399 ?auto_670403 ) ) ( not ( = ?auto_670399 ?auto_670404 ) ) ( not ( = ?auto_670400 ?auto_670401 ) ) ( not ( = ?auto_670400 ?auto_670402 ) ) ( not ( = ?auto_670400 ?auto_670403 ) ) ( not ( = ?auto_670400 ?auto_670404 ) ) ( not ( = ?auto_670401 ?auto_670402 ) ) ( not ( = ?auto_670401 ?auto_670403 ) ) ( not ( = ?auto_670401 ?auto_670404 ) ) ( not ( = ?auto_670402 ?auto_670403 ) ) ( not ( = ?auto_670402 ?auto_670404 ) ) ( not ( = ?auto_670403 ?auto_670404 ) ) ( ON ?auto_670402 ?auto_670403 ) ( CLEAR ?auto_670400 ) ( ON ?auto_670401 ?auto_670402 ) ( CLEAR ?auto_670401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_670388 ?auto_670389 ?auto_670390 ?auto_670391 ?auto_670392 ?auto_670393 ?auto_670394 ?auto_670395 ?auto_670396 ?auto_670397 ?auto_670398 ?auto_670399 ?auto_670400 ?auto_670401 )
      ( MAKE-16PILE ?auto_670388 ?auto_670389 ?auto_670390 ?auto_670391 ?auto_670392 ?auto_670393 ?auto_670394 ?auto_670395 ?auto_670396 ?auto_670397 ?auto_670398 ?auto_670399 ?auto_670400 ?auto_670401 ?auto_670402 ?auto_670403 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670454 - BLOCK
      ?auto_670455 - BLOCK
      ?auto_670456 - BLOCK
      ?auto_670457 - BLOCK
      ?auto_670458 - BLOCK
      ?auto_670459 - BLOCK
      ?auto_670460 - BLOCK
      ?auto_670461 - BLOCK
      ?auto_670462 - BLOCK
      ?auto_670463 - BLOCK
      ?auto_670464 - BLOCK
      ?auto_670465 - BLOCK
      ?auto_670466 - BLOCK
      ?auto_670467 - BLOCK
      ?auto_670468 - BLOCK
      ?auto_670469 - BLOCK
    )
    :vars
    (
      ?auto_670470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670469 ?auto_670470 ) ( ON-TABLE ?auto_670454 ) ( ON ?auto_670455 ?auto_670454 ) ( ON ?auto_670456 ?auto_670455 ) ( ON ?auto_670457 ?auto_670456 ) ( ON ?auto_670458 ?auto_670457 ) ( ON ?auto_670459 ?auto_670458 ) ( ON ?auto_670460 ?auto_670459 ) ( ON ?auto_670461 ?auto_670460 ) ( ON ?auto_670462 ?auto_670461 ) ( ON ?auto_670463 ?auto_670462 ) ( ON ?auto_670464 ?auto_670463 ) ( ON ?auto_670465 ?auto_670464 ) ( not ( = ?auto_670454 ?auto_670455 ) ) ( not ( = ?auto_670454 ?auto_670456 ) ) ( not ( = ?auto_670454 ?auto_670457 ) ) ( not ( = ?auto_670454 ?auto_670458 ) ) ( not ( = ?auto_670454 ?auto_670459 ) ) ( not ( = ?auto_670454 ?auto_670460 ) ) ( not ( = ?auto_670454 ?auto_670461 ) ) ( not ( = ?auto_670454 ?auto_670462 ) ) ( not ( = ?auto_670454 ?auto_670463 ) ) ( not ( = ?auto_670454 ?auto_670464 ) ) ( not ( = ?auto_670454 ?auto_670465 ) ) ( not ( = ?auto_670454 ?auto_670466 ) ) ( not ( = ?auto_670454 ?auto_670467 ) ) ( not ( = ?auto_670454 ?auto_670468 ) ) ( not ( = ?auto_670454 ?auto_670469 ) ) ( not ( = ?auto_670454 ?auto_670470 ) ) ( not ( = ?auto_670455 ?auto_670456 ) ) ( not ( = ?auto_670455 ?auto_670457 ) ) ( not ( = ?auto_670455 ?auto_670458 ) ) ( not ( = ?auto_670455 ?auto_670459 ) ) ( not ( = ?auto_670455 ?auto_670460 ) ) ( not ( = ?auto_670455 ?auto_670461 ) ) ( not ( = ?auto_670455 ?auto_670462 ) ) ( not ( = ?auto_670455 ?auto_670463 ) ) ( not ( = ?auto_670455 ?auto_670464 ) ) ( not ( = ?auto_670455 ?auto_670465 ) ) ( not ( = ?auto_670455 ?auto_670466 ) ) ( not ( = ?auto_670455 ?auto_670467 ) ) ( not ( = ?auto_670455 ?auto_670468 ) ) ( not ( = ?auto_670455 ?auto_670469 ) ) ( not ( = ?auto_670455 ?auto_670470 ) ) ( not ( = ?auto_670456 ?auto_670457 ) ) ( not ( = ?auto_670456 ?auto_670458 ) ) ( not ( = ?auto_670456 ?auto_670459 ) ) ( not ( = ?auto_670456 ?auto_670460 ) ) ( not ( = ?auto_670456 ?auto_670461 ) ) ( not ( = ?auto_670456 ?auto_670462 ) ) ( not ( = ?auto_670456 ?auto_670463 ) ) ( not ( = ?auto_670456 ?auto_670464 ) ) ( not ( = ?auto_670456 ?auto_670465 ) ) ( not ( = ?auto_670456 ?auto_670466 ) ) ( not ( = ?auto_670456 ?auto_670467 ) ) ( not ( = ?auto_670456 ?auto_670468 ) ) ( not ( = ?auto_670456 ?auto_670469 ) ) ( not ( = ?auto_670456 ?auto_670470 ) ) ( not ( = ?auto_670457 ?auto_670458 ) ) ( not ( = ?auto_670457 ?auto_670459 ) ) ( not ( = ?auto_670457 ?auto_670460 ) ) ( not ( = ?auto_670457 ?auto_670461 ) ) ( not ( = ?auto_670457 ?auto_670462 ) ) ( not ( = ?auto_670457 ?auto_670463 ) ) ( not ( = ?auto_670457 ?auto_670464 ) ) ( not ( = ?auto_670457 ?auto_670465 ) ) ( not ( = ?auto_670457 ?auto_670466 ) ) ( not ( = ?auto_670457 ?auto_670467 ) ) ( not ( = ?auto_670457 ?auto_670468 ) ) ( not ( = ?auto_670457 ?auto_670469 ) ) ( not ( = ?auto_670457 ?auto_670470 ) ) ( not ( = ?auto_670458 ?auto_670459 ) ) ( not ( = ?auto_670458 ?auto_670460 ) ) ( not ( = ?auto_670458 ?auto_670461 ) ) ( not ( = ?auto_670458 ?auto_670462 ) ) ( not ( = ?auto_670458 ?auto_670463 ) ) ( not ( = ?auto_670458 ?auto_670464 ) ) ( not ( = ?auto_670458 ?auto_670465 ) ) ( not ( = ?auto_670458 ?auto_670466 ) ) ( not ( = ?auto_670458 ?auto_670467 ) ) ( not ( = ?auto_670458 ?auto_670468 ) ) ( not ( = ?auto_670458 ?auto_670469 ) ) ( not ( = ?auto_670458 ?auto_670470 ) ) ( not ( = ?auto_670459 ?auto_670460 ) ) ( not ( = ?auto_670459 ?auto_670461 ) ) ( not ( = ?auto_670459 ?auto_670462 ) ) ( not ( = ?auto_670459 ?auto_670463 ) ) ( not ( = ?auto_670459 ?auto_670464 ) ) ( not ( = ?auto_670459 ?auto_670465 ) ) ( not ( = ?auto_670459 ?auto_670466 ) ) ( not ( = ?auto_670459 ?auto_670467 ) ) ( not ( = ?auto_670459 ?auto_670468 ) ) ( not ( = ?auto_670459 ?auto_670469 ) ) ( not ( = ?auto_670459 ?auto_670470 ) ) ( not ( = ?auto_670460 ?auto_670461 ) ) ( not ( = ?auto_670460 ?auto_670462 ) ) ( not ( = ?auto_670460 ?auto_670463 ) ) ( not ( = ?auto_670460 ?auto_670464 ) ) ( not ( = ?auto_670460 ?auto_670465 ) ) ( not ( = ?auto_670460 ?auto_670466 ) ) ( not ( = ?auto_670460 ?auto_670467 ) ) ( not ( = ?auto_670460 ?auto_670468 ) ) ( not ( = ?auto_670460 ?auto_670469 ) ) ( not ( = ?auto_670460 ?auto_670470 ) ) ( not ( = ?auto_670461 ?auto_670462 ) ) ( not ( = ?auto_670461 ?auto_670463 ) ) ( not ( = ?auto_670461 ?auto_670464 ) ) ( not ( = ?auto_670461 ?auto_670465 ) ) ( not ( = ?auto_670461 ?auto_670466 ) ) ( not ( = ?auto_670461 ?auto_670467 ) ) ( not ( = ?auto_670461 ?auto_670468 ) ) ( not ( = ?auto_670461 ?auto_670469 ) ) ( not ( = ?auto_670461 ?auto_670470 ) ) ( not ( = ?auto_670462 ?auto_670463 ) ) ( not ( = ?auto_670462 ?auto_670464 ) ) ( not ( = ?auto_670462 ?auto_670465 ) ) ( not ( = ?auto_670462 ?auto_670466 ) ) ( not ( = ?auto_670462 ?auto_670467 ) ) ( not ( = ?auto_670462 ?auto_670468 ) ) ( not ( = ?auto_670462 ?auto_670469 ) ) ( not ( = ?auto_670462 ?auto_670470 ) ) ( not ( = ?auto_670463 ?auto_670464 ) ) ( not ( = ?auto_670463 ?auto_670465 ) ) ( not ( = ?auto_670463 ?auto_670466 ) ) ( not ( = ?auto_670463 ?auto_670467 ) ) ( not ( = ?auto_670463 ?auto_670468 ) ) ( not ( = ?auto_670463 ?auto_670469 ) ) ( not ( = ?auto_670463 ?auto_670470 ) ) ( not ( = ?auto_670464 ?auto_670465 ) ) ( not ( = ?auto_670464 ?auto_670466 ) ) ( not ( = ?auto_670464 ?auto_670467 ) ) ( not ( = ?auto_670464 ?auto_670468 ) ) ( not ( = ?auto_670464 ?auto_670469 ) ) ( not ( = ?auto_670464 ?auto_670470 ) ) ( not ( = ?auto_670465 ?auto_670466 ) ) ( not ( = ?auto_670465 ?auto_670467 ) ) ( not ( = ?auto_670465 ?auto_670468 ) ) ( not ( = ?auto_670465 ?auto_670469 ) ) ( not ( = ?auto_670465 ?auto_670470 ) ) ( not ( = ?auto_670466 ?auto_670467 ) ) ( not ( = ?auto_670466 ?auto_670468 ) ) ( not ( = ?auto_670466 ?auto_670469 ) ) ( not ( = ?auto_670466 ?auto_670470 ) ) ( not ( = ?auto_670467 ?auto_670468 ) ) ( not ( = ?auto_670467 ?auto_670469 ) ) ( not ( = ?auto_670467 ?auto_670470 ) ) ( not ( = ?auto_670468 ?auto_670469 ) ) ( not ( = ?auto_670468 ?auto_670470 ) ) ( not ( = ?auto_670469 ?auto_670470 ) ) ( ON ?auto_670468 ?auto_670469 ) ( ON ?auto_670467 ?auto_670468 ) ( CLEAR ?auto_670465 ) ( ON ?auto_670466 ?auto_670467 ) ( CLEAR ?auto_670466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_670454 ?auto_670455 ?auto_670456 ?auto_670457 ?auto_670458 ?auto_670459 ?auto_670460 ?auto_670461 ?auto_670462 ?auto_670463 ?auto_670464 ?auto_670465 ?auto_670466 )
      ( MAKE-16PILE ?auto_670454 ?auto_670455 ?auto_670456 ?auto_670457 ?auto_670458 ?auto_670459 ?auto_670460 ?auto_670461 ?auto_670462 ?auto_670463 ?auto_670464 ?auto_670465 ?auto_670466 ?auto_670467 ?auto_670468 ?auto_670469 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670520 - BLOCK
      ?auto_670521 - BLOCK
      ?auto_670522 - BLOCK
      ?auto_670523 - BLOCK
      ?auto_670524 - BLOCK
      ?auto_670525 - BLOCK
      ?auto_670526 - BLOCK
      ?auto_670527 - BLOCK
      ?auto_670528 - BLOCK
      ?auto_670529 - BLOCK
      ?auto_670530 - BLOCK
      ?auto_670531 - BLOCK
      ?auto_670532 - BLOCK
      ?auto_670533 - BLOCK
      ?auto_670534 - BLOCK
      ?auto_670535 - BLOCK
    )
    :vars
    (
      ?auto_670536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670535 ?auto_670536 ) ( ON-TABLE ?auto_670520 ) ( ON ?auto_670521 ?auto_670520 ) ( ON ?auto_670522 ?auto_670521 ) ( ON ?auto_670523 ?auto_670522 ) ( ON ?auto_670524 ?auto_670523 ) ( ON ?auto_670525 ?auto_670524 ) ( ON ?auto_670526 ?auto_670525 ) ( ON ?auto_670527 ?auto_670526 ) ( ON ?auto_670528 ?auto_670527 ) ( ON ?auto_670529 ?auto_670528 ) ( ON ?auto_670530 ?auto_670529 ) ( not ( = ?auto_670520 ?auto_670521 ) ) ( not ( = ?auto_670520 ?auto_670522 ) ) ( not ( = ?auto_670520 ?auto_670523 ) ) ( not ( = ?auto_670520 ?auto_670524 ) ) ( not ( = ?auto_670520 ?auto_670525 ) ) ( not ( = ?auto_670520 ?auto_670526 ) ) ( not ( = ?auto_670520 ?auto_670527 ) ) ( not ( = ?auto_670520 ?auto_670528 ) ) ( not ( = ?auto_670520 ?auto_670529 ) ) ( not ( = ?auto_670520 ?auto_670530 ) ) ( not ( = ?auto_670520 ?auto_670531 ) ) ( not ( = ?auto_670520 ?auto_670532 ) ) ( not ( = ?auto_670520 ?auto_670533 ) ) ( not ( = ?auto_670520 ?auto_670534 ) ) ( not ( = ?auto_670520 ?auto_670535 ) ) ( not ( = ?auto_670520 ?auto_670536 ) ) ( not ( = ?auto_670521 ?auto_670522 ) ) ( not ( = ?auto_670521 ?auto_670523 ) ) ( not ( = ?auto_670521 ?auto_670524 ) ) ( not ( = ?auto_670521 ?auto_670525 ) ) ( not ( = ?auto_670521 ?auto_670526 ) ) ( not ( = ?auto_670521 ?auto_670527 ) ) ( not ( = ?auto_670521 ?auto_670528 ) ) ( not ( = ?auto_670521 ?auto_670529 ) ) ( not ( = ?auto_670521 ?auto_670530 ) ) ( not ( = ?auto_670521 ?auto_670531 ) ) ( not ( = ?auto_670521 ?auto_670532 ) ) ( not ( = ?auto_670521 ?auto_670533 ) ) ( not ( = ?auto_670521 ?auto_670534 ) ) ( not ( = ?auto_670521 ?auto_670535 ) ) ( not ( = ?auto_670521 ?auto_670536 ) ) ( not ( = ?auto_670522 ?auto_670523 ) ) ( not ( = ?auto_670522 ?auto_670524 ) ) ( not ( = ?auto_670522 ?auto_670525 ) ) ( not ( = ?auto_670522 ?auto_670526 ) ) ( not ( = ?auto_670522 ?auto_670527 ) ) ( not ( = ?auto_670522 ?auto_670528 ) ) ( not ( = ?auto_670522 ?auto_670529 ) ) ( not ( = ?auto_670522 ?auto_670530 ) ) ( not ( = ?auto_670522 ?auto_670531 ) ) ( not ( = ?auto_670522 ?auto_670532 ) ) ( not ( = ?auto_670522 ?auto_670533 ) ) ( not ( = ?auto_670522 ?auto_670534 ) ) ( not ( = ?auto_670522 ?auto_670535 ) ) ( not ( = ?auto_670522 ?auto_670536 ) ) ( not ( = ?auto_670523 ?auto_670524 ) ) ( not ( = ?auto_670523 ?auto_670525 ) ) ( not ( = ?auto_670523 ?auto_670526 ) ) ( not ( = ?auto_670523 ?auto_670527 ) ) ( not ( = ?auto_670523 ?auto_670528 ) ) ( not ( = ?auto_670523 ?auto_670529 ) ) ( not ( = ?auto_670523 ?auto_670530 ) ) ( not ( = ?auto_670523 ?auto_670531 ) ) ( not ( = ?auto_670523 ?auto_670532 ) ) ( not ( = ?auto_670523 ?auto_670533 ) ) ( not ( = ?auto_670523 ?auto_670534 ) ) ( not ( = ?auto_670523 ?auto_670535 ) ) ( not ( = ?auto_670523 ?auto_670536 ) ) ( not ( = ?auto_670524 ?auto_670525 ) ) ( not ( = ?auto_670524 ?auto_670526 ) ) ( not ( = ?auto_670524 ?auto_670527 ) ) ( not ( = ?auto_670524 ?auto_670528 ) ) ( not ( = ?auto_670524 ?auto_670529 ) ) ( not ( = ?auto_670524 ?auto_670530 ) ) ( not ( = ?auto_670524 ?auto_670531 ) ) ( not ( = ?auto_670524 ?auto_670532 ) ) ( not ( = ?auto_670524 ?auto_670533 ) ) ( not ( = ?auto_670524 ?auto_670534 ) ) ( not ( = ?auto_670524 ?auto_670535 ) ) ( not ( = ?auto_670524 ?auto_670536 ) ) ( not ( = ?auto_670525 ?auto_670526 ) ) ( not ( = ?auto_670525 ?auto_670527 ) ) ( not ( = ?auto_670525 ?auto_670528 ) ) ( not ( = ?auto_670525 ?auto_670529 ) ) ( not ( = ?auto_670525 ?auto_670530 ) ) ( not ( = ?auto_670525 ?auto_670531 ) ) ( not ( = ?auto_670525 ?auto_670532 ) ) ( not ( = ?auto_670525 ?auto_670533 ) ) ( not ( = ?auto_670525 ?auto_670534 ) ) ( not ( = ?auto_670525 ?auto_670535 ) ) ( not ( = ?auto_670525 ?auto_670536 ) ) ( not ( = ?auto_670526 ?auto_670527 ) ) ( not ( = ?auto_670526 ?auto_670528 ) ) ( not ( = ?auto_670526 ?auto_670529 ) ) ( not ( = ?auto_670526 ?auto_670530 ) ) ( not ( = ?auto_670526 ?auto_670531 ) ) ( not ( = ?auto_670526 ?auto_670532 ) ) ( not ( = ?auto_670526 ?auto_670533 ) ) ( not ( = ?auto_670526 ?auto_670534 ) ) ( not ( = ?auto_670526 ?auto_670535 ) ) ( not ( = ?auto_670526 ?auto_670536 ) ) ( not ( = ?auto_670527 ?auto_670528 ) ) ( not ( = ?auto_670527 ?auto_670529 ) ) ( not ( = ?auto_670527 ?auto_670530 ) ) ( not ( = ?auto_670527 ?auto_670531 ) ) ( not ( = ?auto_670527 ?auto_670532 ) ) ( not ( = ?auto_670527 ?auto_670533 ) ) ( not ( = ?auto_670527 ?auto_670534 ) ) ( not ( = ?auto_670527 ?auto_670535 ) ) ( not ( = ?auto_670527 ?auto_670536 ) ) ( not ( = ?auto_670528 ?auto_670529 ) ) ( not ( = ?auto_670528 ?auto_670530 ) ) ( not ( = ?auto_670528 ?auto_670531 ) ) ( not ( = ?auto_670528 ?auto_670532 ) ) ( not ( = ?auto_670528 ?auto_670533 ) ) ( not ( = ?auto_670528 ?auto_670534 ) ) ( not ( = ?auto_670528 ?auto_670535 ) ) ( not ( = ?auto_670528 ?auto_670536 ) ) ( not ( = ?auto_670529 ?auto_670530 ) ) ( not ( = ?auto_670529 ?auto_670531 ) ) ( not ( = ?auto_670529 ?auto_670532 ) ) ( not ( = ?auto_670529 ?auto_670533 ) ) ( not ( = ?auto_670529 ?auto_670534 ) ) ( not ( = ?auto_670529 ?auto_670535 ) ) ( not ( = ?auto_670529 ?auto_670536 ) ) ( not ( = ?auto_670530 ?auto_670531 ) ) ( not ( = ?auto_670530 ?auto_670532 ) ) ( not ( = ?auto_670530 ?auto_670533 ) ) ( not ( = ?auto_670530 ?auto_670534 ) ) ( not ( = ?auto_670530 ?auto_670535 ) ) ( not ( = ?auto_670530 ?auto_670536 ) ) ( not ( = ?auto_670531 ?auto_670532 ) ) ( not ( = ?auto_670531 ?auto_670533 ) ) ( not ( = ?auto_670531 ?auto_670534 ) ) ( not ( = ?auto_670531 ?auto_670535 ) ) ( not ( = ?auto_670531 ?auto_670536 ) ) ( not ( = ?auto_670532 ?auto_670533 ) ) ( not ( = ?auto_670532 ?auto_670534 ) ) ( not ( = ?auto_670532 ?auto_670535 ) ) ( not ( = ?auto_670532 ?auto_670536 ) ) ( not ( = ?auto_670533 ?auto_670534 ) ) ( not ( = ?auto_670533 ?auto_670535 ) ) ( not ( = ?auto_670533 ?auto_670536 ) ) ( not ( = ?auto_670534 ?auto_670535 ) ) ( not ( = ?auto_670534 ?auto_670536 ) ) ( not ( = ?auto_670535 ?auto_670536 ) ) ( ON ?auto_670534 ?auto_670535 ) ( ON ?auto_670533 ?auto_670534 ) ( ON ?auto_670532 ?auto_670533 ) ( CLEAR ?auto_670530 ) ( ON ?auto_670531 ?auto_670532 ) ( CLEAR ?auto_670531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_670520 ?auto_670521 ?auto_670522 ?auto_670523 ?auto_670524 ?auto_670525 ?auto_670526 ?auto_670527 ?auto_670528 ?auto_670529 ?auto_670530 ?auto_670531 )
      ( MAKE-16PILE ?auto_670520 ?auto_670521 ?auto_670522 ?auto_670523 ?auto_670524 ?auto_670525 ?auto_670526 ?auto_670527 ?auto_670528 ?auto_670529 ?auto_670530 ?auto_670531 ?auto_670532 ?auto_670533 ?auto_670534 ?auto_670535 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670586 - BLOCK
      ?auto_670587 - BLOCK
      ?auto_670588 - BLOCK
      ?auto_670589 - BLOCK
      ?auto_670590 - BLOCK
      ?auto_670591 - BLOCK
      ?auto_670592 - BLOCK
      ?auto_670593 - BLOCK
      ?auto_670594 - BLOCK
      ?auto_670595 - BLOCK
      ?auto_670596 - BLOCK
      ?auto_670597 - BLOCK
      ?auto_670598 - BLOCK
      ?auto_670599 - BLOCK
      ?auto_670600 - BLOCK
      ?auto_670601 - BLOCK
    )
    :vars
    (
      ?auto_670602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670601 ?auto_670602 ) ( ON-TABLE ?auto_670586 ) ( ON ?auto_670587 ?auto_670586 ) ( ON ?auto_670588 ?auto_670587 ) ( ON ?auto_670589 ?auto_670588 ) ( ON ?auto_670590 ?auto_670589 ) ( ON ?auto_670591 ?auto_670590 ) ( ON ?auto_670592 ?auto_670591 ) ( ON ?auto_670593 ?auto_670592 ) ( ON ?auto_670594 ?auto_670593 ) ( ON ?auto_670595 ?auto_670594 ) ( not ( = ?auto_670586 ?auto_670587 ) ) ( not ( = ?auto_670586 ?auto_670588 ) ) ( not ( = ?auto_670586 ?auto_670589 ) ) ( not ( = ?auto_670586 ?auto_670590 ) ) ( not ( = ?auto_670586 ?auto_670591 ) ) ( not ( = ?auto_670586 ?auto_670592 ) ) ( not ( = ?auto_670586 ?auto_670593 ) ) ( not ( = ?auto_670586 ?auto_670594 ) ) ( not ( = ?auto_670586 ?auto_670595 ) ) ( not ( = ?auto_670586 ?auto_670596 ) ) ( not ( = ?auto_670586 ?auto_670597 ) ) ( not ( = ?auto_670586 ?auto_670598 ) ) ( not ( = ?auto_670586 ?auto_670599 ) ) ( not ( = ?auto_670586 ?auto_670600 ) ) ( not ( = ?auto_670586 ?auto_670601 ) ) ( not ( = ?auto_670586 ?auto_670602 ) ) ( not ( = ?auto_670587 ?auto_670588 ) ) ( not ( = ?auto_670587 ?auto_670589 ) ) ( not ( = ?auto_670587 ?auto_670590 ) ) ( not ( = ?auto_670587 ?auto_670591 ) ) ( not ( = ?auto_670587 ?auto_670592 ) ) ( not ( = ?auto_670587 ?auto_670593 ) ) ( not ( = ?auto_670587 ?auto_670594 ) ) ( not ( = ?auto_670587 ?auto_670595 ) ) ( not ( = ?auto_670587 ?auto_670596 ) ) ( not ( = ?auto_670587 ?auto_670597 ) ) ( not ( = ?auto_670587 ?auto_670598 ) ) ( not ( = ?auto_670587 ?auto_670599 ) ) ( not ( = ?auto_670587 ?auto_670600 ) ) ( not ( = ?auto_670587 ?auto_670601 ) ) ( not ( = ?auto_670587 ?auto_670602 ) ) ( not ( = ?auto_670588 ?auto_670589 ) ) ( not ( = ?auto_670588 ?auto_670590 ) ) ( not ( = ?auto_670588 ?auto_670591 ) ) ( not ( = ?auto_670588 ?auto_670592 ) ) ( not ( = ?auto_670588 ?auto_670593 ) ) ( not ( = ?auto_670588 ?auto_670594 ) ) ( not ( = ?auto_670588 ?auto_670595 ) ) ( not ( = ?auto_670588 ?auto_670596 ) ) ( not ( = ?auto_670588 ?auto_670597 ) ) ( not ( = ?auto_670588 ?auto_670598 ) ) ( not ( = ?auto_670588 ?auto_670599 ) ) ( not ( = ?auto_670588 ?auto_670600 ) ) ( not ( = ?auto_670588 ?auto_670601 ) ) ( not ( = ?auto_670588 ?auto_670602 ) ) ( not ( = ?auto_670589 ?auto_670590 ) ) ( not ( = ?auto_670589 ?auto_670591 ) ) ( not ( = ?auto_670589 ?auto_670592 ) ) ( not ( = ?auto_670589 ?auto_670593 ) ) ( not ( = ?auto_670589 ?auto_670594 ) ) ( not ( = ?auto_670589 ?auto_670595 ) ) ( not ( = ?auto_670589 ?auto_670596 ) ) ( not ( = ?auto_670589 ?auto_670597 ) ) ( not ( = ?auto_670589 ?auto_670598 ) ) ( not ( = ?auto_670589 ?auto_670599 ) ) ( not ( = ?auto_670589 ?auto_670600 ) ) ( not ( = ?auto_670589 ?auto_670601 ) ) ( not ( = ?auto_670589 ?auto_670602 ) ) ( not ( = ?auto_670590 ?auto_670591 ) ) ( not ( = ?auto_670590 ?auto_670592 ) ) ( not ( = ?auto_670590 ?auto_670593 ) ) ( not ( = ?auto_670590 ?auto_670594 ) ) ( not ( = ?auto_670590 ?auto_670595 ) ) ( not ( = ?auto_670590 ?auto_670596 ) ) ( not ( = ?auto_670590 ?auto_670597 ) ) ( not ( = ?auto_670590 ?auto_670598 ) ) ( not ( = ?auto_670590 ?auto_670599 ) ) ( not ( = ?auto_670590 ?auto_670600 ) ) ( not ( = ?auto_670590 ?auto_670601 ) ) ( not ( = ?auto_670590 ?auto_670602 ) ) ( not ( = ?auto_670591 ?auto_670592 ) ) ( not ( = ?auto_670591 ?auto_670593 ) ) ( not ( = ?auto_670591 ?auto_670594 ) ) ( not ( = ?auto_670591 ?auto_670595 ) ) ( not ( = ?auto_670591 ?auto_670596 ) ) ( not ( = ?auto_670591 ?auto_670597 ) ) ( not ( = ?auto_670591 ?auto_670598 ) ) ( not ( = ?auto_670591 ?auto_670599 ) ) ( not ( = ?auto_670591 ?auto_670600 ) ) ( not ( = ?auto_670591 ?auto_670601 ) ) ( not ( = ?auto_670591 ?auto_670602 ) ) ( not ( = ?auto_670592 ?auto_670593 ) ) ( not ( = ?auto_670592 ?auto_670594 ) ) ( not ( = ?auto_670592 ?auto_670595 ) ) ( not ( = ?auto_670592 ?auto_670596 ) ) ( not ( = ?auto_670592 ?auto_670597 ) ) ( not ( = ?auto_670592 ?auto_670598 ) ) ( not ( = ?auto_670592 ?auto_670599 ) ) ( not ( = ?auto_670592 ?auto_670600 ) ) ( not ( = ?auto_670592 ?auto_670601 ) ) ( not ( = ?auto_670592 ?auto_670602 ) ) ( not ( = ?auto_670593 ?auto_670594 ) ) ( not ( = ?auto_670593 ?auto_670595 ) ) ( not ( = ?auto_670593 ?auto_670596 ) ) ( not ( = ?auto_670593 ?auto_670597 ) ) ( not ( = ?auto_670593 ?auto_670598 ) ) ( not ( = ?auto_670593 ?auto_670599 ) ) ( not ( = ?auto_670593 ?auto_670600 ) ) ( not ( = ?auto_670593 ?auto_670601 ) ) ( not ( = ?auto_670593 ?auto_670602 ) ) ( not ( = ?auto_670594 ?auto_670595 ) ) ( not ( = ?auto_670594 ?auto_670596 ) ) ( not ( = ?auto_670594 ?auto_670597 ) ) ( not ( = ?auto_670594 ?auto_670598 ) ) ( not ( = ?auto_670594 ?auto_670599 ) ) ( not ( = ?auto_670594 ?auto_670600 ) ) ( not ( = ?auto_670594 ?auto_670601 ) ) ( not ( = ?auto_670594 ?auto_670602 ) ) ( not ( = ?auto_670595 ?auto_670596 ) ) ( not ( = ?auto_670595 ?auto_670597 ) ) ( not ( = ?auto_670595 ?auto_670598 ) ) ( not ( = ?auto_670595 ?auto_670599 ) ) ( not ( = ?auto_670595 ?auto_670600 ) ) ( not ( = ?auto_670595 ?auto_670601 ) ) ( not ( = ?auto_670595 ?auto_670602 ) ) ( not ( = ?auto_670596 ?auto_670597 ) ) ( not ( = ?auto_670596 ?auto_670598 ) ) ( not ( = ?auto_670596 ?auto_670599 ) ) ( not ( = ?auto_670596 ?auto_670600 ) ) ( not ( = ?auto_670596 ?auto_670601 ) ) ( not ( = ?auto_670596 ?auto_670602 ) ) ( not ( = ?auto_670597 ?auto_670598 ) ) ( not ( = ?auto_670597 ?auto_670599 ) ) ( not ( = ?auto_670597 ?auto_670600 ) ) ( not ( = ?auto_670597 ?auto_670601 ) ) ( not ( = ?auto_670597 ?auto_670602 ) ) ( not ( = ?auto_670598 ?auto_670599 ) ) ( not ( = ?auto_670598 ?auto_670600 ) ) ( not ( = ?auto_670598 ?auto_670601 ) ) ( not ( = ?auto_670598 ?auto_670602 ) ) ( not ( = ?auto_670599 ?auto_670600 ) ) ( not ( = ?auto_670599 ?auto_670601 ) ) ( not ( = ?auto_670599 ?auto_670602 ) ) ( not ( = ?auto_670600 ?auto_670601 ) ) ( not ( = ?auto_670600 ?auto_670602 ) ) ( not ( = ?auto_670601 ?auto_670602 ) ) ( ON ?auto_670600 ?auto_670601 ) ( ON ?auto_670599 ?auto_670600 ) ( ON ?auto_670598 ?auto_670599 ) ( ON ?auto_670597 ?auto_670598 ) ( CLEAR ?auto_670595 ) ( ON ?auto_670596 ?auto_670597 ) ( CLEAR ?auto_670596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_670586 ?auto_670587 ?auto_670588 ?auto_670589 ?auto_670590 ?auto_670591 ?auto_670592 ?auto_670593 ?auto_670594 ?auto_670595 ?auto_670596 )
      ( MAKE-16PILE ?auto_670586 ?auto_670587 ?auto_670588 ?auto_670589 ?auto_670590 ?auto_670591 ?auto_670592 ?auto_670593 ?auto_670594 ?auto_670595 ?auto_670596 ?auto_670597 ?auto_670598 ?auto_670599 ?auto_670600 ?auto_670601 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670652 - BLOCK
      ?auto_670653 - BLOCK
      ?auto_670654 - BLOCK
      ?auto_670655 - BLOCK
      ?auto_670656 - BLOCK
      ?auto_670657 - BLOCK
      ?auto_670658 - BLOCK
      ?auto_670659 - BLOCK
      ?auto_670660 - BLOCK
      ?auto_670661 - BLOCK
      ?auto_670662 - BLOCK
      ?auto_670663 - BLOCK
      ?auto_670664 - BLOCK
      ?auto_670665 - BLOCK
      ?auto_670666 - BLOCK
      ?auto_670667 - BLOCK
    )
    :vars
    (
      ?auto_670668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670667 ?auto_670668 ) ( ON-TABLE ?auto_670652 ) ( ON ?auto_670653 ?auto_670652 ) ( ON ?auto_670654 ?auto_670653 ) ( ON ?auto_670655 ?auto_670654 ) ( ON ?auto_670656 ?auto_670655 ) ( ON ?auto_670657 ?auto_670656 ) ( ON ?auto_670658 ?auto_670657 ) ( ON ?auto_670659 ?auto_670658 ) ( ON ?auto_670660 ?auto_670659 ) ( not ( = ?auto_670652 ?auto_670653 ) ) ( not ( = ?auto_670652 ?auto_670654 ) ) ( not ( = ?auto_670652 ?auto_670655 ) ) ( not ( = ?auto_670652 ?auto_670656 ) ) ( not ( = ?auto_670652 ?auto_670657 ) ) ( not ( = ?auto_670652 ?auto_670658 ) ) ( not ( = ?auto_670652 ?auto_670659 ) ) ( not ( = ?auto_670652 ?auto_670660 ) ) ( not ( = ?auto_670652 ?auto_670661 ) ) ( not ( = ?auto_670652 ?auto_670662 ) ) ( not ( = ?auto_670652 ?auto_670663 ) ) ( not ( = ?auto_670652 ?auto_670664 ) ) ( not ( = ?auto_670652 ?auto_670665 ) ) ( not ( = ?auto_670652 ?auto_670666 ) ) ( not ( = ?auto_670652 ?auto_670667 ) ) ( not ( = ?auto_670652 ?auto_670668 ) ) ( not ( = ?auto_670653 ?auto_670654 ) ) ( not ( = ?auto_670653 ?auto_670655 ) ) ( not ( = ?auto_670653 ?auto_670656 ) ) ( not ( = ?auto_670653 ?auto_670657 ) ) ( not ( = ?auto_670653 ?auto_670658 ) ) ( not ( = ?auto_670653 ?auto_670659 ) ) ( not ( = ?auto_670653 ?auto_670660 ) ) ( not ( = ?auto_670653 ?auto_670661 ) ) ( not ( = ?auto_670653 ?auto_670662 ) ) ( not ( = ?auto_670653 ?auto_670663 ) ) ( not ( = ?auto_670653 ?auto_670664 ) ) ( not ( = ?auto_670653 ?auto_670665 ) ) ( not ( = ?auto_670653 ?auto_670666 ) ) ( not ( = ?auto_670653 ?auto_670667 ) ) ( not ( = ?auto_670653 ?auto_670668 ) ) ( not ( = ?auto_670654 ?auto_670655 ) ) ( not ( = ?auto_670654 ?auto_670656 ) ) ( not ( = ?auto_670654 ?auto_670657 ) ) ( not ( = ?auto_670654 ?auto_670658 ) ) ( not ( = ?auto_670654 ?auto_670659 ) ) ( not ( = ?auto_670654 ?auto_670660 ) ) ( not ( = ?auto_670654 ?auto_670661 ) ) ( not ( = ?auto_670654 ?auto_670662 ) ) ( not ( = ?auto_670654 ?auto_670663 ) ) ( not ( = ?auto_670654 ?auto_670664 ) ) ( not ( = ?auto_670654 ?auto_670665 ) ) ( not ( = ?auto_670654 ?auto_670666 ) ) ( not ( = ?auto_670654 ?auto_670667 ) ) ( not ( = ?auto_670654 ?auto_670668 ) ) ( not ( = ?auto_670655 ?auto_670656 ) ) ( not ( = ?auto_670655 ?auto_670657 ) ) ( not ( = ?auto_670655 ?auto_670658 ) ) ( not ( = ?auto_670655 ?auto_670659 ) ) ( not ( = ?auto_670655 ?auto_670660 ) ) ( not ( = ?auto_670655 ?auto_670661 ) ) ( not ( = ?auto_670655 ?auto_670662 ) ) ( not ( = ?auto_670655 ?auto_670663 ) ) ( not ( = ?auto_670655 ?auto_670664 ) ) ( not ( = ?auto_670655 ?auto_670665 ) ) ( not ( = ?auto_670655 ?auto_670666 ) ) ( not ( = ?auto_670655 ?auto_670667 ) ) ( not ( = ?auto_670655 ?auto_670668 ) ) ( not ( = ?auto_670656 ?auto_670657 ) ) ( not ( = ?auto_670656 ?auto_670658 ) ) ( not ( = ?auto_670656 ?auto_670659 ) ) ( not ( = ?auto_670656 ?auto_670660 ) ) ( not ( = ?auto_670656 ?auto_670661 ) ) ( not ( = ?auto_670656 ?auto_670662 ) ) ( not ( = ?auto_670656 ?auto_670663 ) ) ( not ( = ?auto_670656 ?auto_670664 ) ) ( not ( = ?auto_670656 ?auto_670665 ) ) ( not ( = ?auto_670656 ?auto_670666 ) ) ( not ( = ?auto_670656 ?auto_670667 ) ) ( not ( = ?auto_670656 ?auto_670668 ) ) ( not ( = ?auto_670657 ?auto_670658 ) ) ( not ( = ?auto_670657 ?auto_670659 ) ) ( not ( = ?auto_670657 ?auto_670660 ) ) ( not ( = ?auto_670657 ?auto_670661 ) ) ( not ( = ?auto_670657 ?auto_670662 ) ) ( not ( = ?auto_670657 ?auto_670663 ) ) ( not ( = ?auto_670657 ?auto_670664 ) ) ( not ( = ?auto_670657 ?auto_670665 ) ) ( not ( = ?auto_670657 ?auto_670666 ) ) ( not ( = ?auto_670657 ?auto_670667 ) ) ( not ( = ?auto_670657 ?auto_670668 ) ) ( not ( = ?auto_670658 ?auto_670659 ) ) ( not ( = ?auto_670658 ?auto_670660 ) ) ( not ( = ?auto_670658 ?auto_670661 ) ) ( not ( = ?auto_670658 ?auto_670662 ) ) ( not ( = ?auto_670658 ?auto_670663 ) ) ( not ( = ?auto_670658 ?auto_670664 ) ) ( not ( = ?auto_670658 ?auto_670665 ) ) ( not ( = ?auto_670658 ?auto_670666 ) ) ( not ( = ?auto_670658 ?auto_670667 ) ) ( not ( = ?auto_670658 ?auto_670668 ) ) ( not ( = ?auto_670659 ?auto_670660 ) ) ( not ( = ?auto_670659 ?auto_670661 ) ) ( not ( = ?auto_670659 ?auto_670662 ) ) ( not ( = ?auto_670659 ?auto_670663 ) ) ( not ( = ?auto_670659 ?auto_670664 ) ) ( not ( = ?auto_670659 ?auto_670665 ) ) ( not ( = ?auto_670659 ?auto_670666 ) ) ( not ( = ?auto_670659 ?auto_670667 ) ) ( not ( = ?auto_670659 ?auto_670668 ) ) ( not ( = ?auto_670660 ?auto_670661 ) ) ( not ( = ?auto_670660 ?auto_670662 ) ) ( not ( = ?auto_670660 ?auto_670663 ) ) ( not ( = ?auto_670660 ?auto_670664 ) ) ( not ( = ?auto_670660 ?auto_670665 ) ) ( not ( = ?auto_670660 ?auto_670666 ) ) ( not ( = ?auto_670660 ?auto_670667 ) ) ( not ( = ?auto_670660 ?auto_670668 ) ) ( not ( = ?auto_670661 ?auto_670662 ) ) ( not ( = ?auto_670661 ?auto_670663 ) ) ( not ( = ?auto_670661 ?auto_670664 ) ) ( not ( = ?auto_670661 ?auto_670665 ) ) ( not ( = ?auto_670661 ?auto_670666 ) ) ( not ( = ?auto_670661 ?auto_670667 ) ) ( not ( = ?auto_670661 ?auto_670668 ) ) ( not ( = ?auto_670662 ?auto_670663 ) ) ( not ( = ?auto_670662 ?auto_670664 ) ) ( not ( = ?auto_670662 ?auto_670665 ) ) ( not ( = ?auto_670662 ?auto_670666 ) ) ( not ( = ?auto_670662 ?auto_670667 ) ) ( not ( = ?auto_670662 ?auto_670668 ) ) ( not ( = ?auto_670663 ?auto_670664 ) ) ( not ( = ?auto_670663 ?auto_670665 ) ) ( not ( = ?auto_670663 ?auto_670666 ) ) ( not ( = ?auto_670663 ?auto_670667 ) ) ( not ( = ?auto_670663 ?auto_670668 ) ) ( not ( = ?auto_670664 ?auto_670665 ) ) ( not ( = ?auto_670664 ?auto_670666 ) ) ( not ( = ?auto_670664 ?auto_670667 ) ) ( not ( = ?auto_670664 ?auto_670668 ) ) ( not ( = ?auto_670665 ?auto_670666 ) ) ( not ( = ?auto_670665 ?auto_670667 ) ) ( not ( = ?auto_670665 ?auto_670668 ) ) ( not ( = ?auto_670666 ?auto_670667 ) ) ( not ( = ?auto_670666 ?auto_670668 ) ) ( not ( = ?auto_670667 ?auto_670668 ) ) ( ON ?auto_670666 ?auto_670667 ) ( ON ?auto_670665 ?auto_670666 ) ( ON ?auto_670664 ?auto_670665 ) ( ON ?auto_670663 ?auto_670664 ) ( ON ?auto_670662 ?auto_670663 ) ( CLEAR ?auto_670660 ) ( ON ?auto_670661 ?auto_670662 ) ( CLEAR ?auto_670661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_670652 ?auto_670653 ?auto_670654 ?auto_670655 ?auto_670656 ?auto_670657 ?auto_670658 ?auto_670659 ?auto_670660 ?auto_670661 )
      ( MAKE-16PILE ?auto_670652 ?auto_670653 ?auto_670654 ?auto_670655 ?auto_670656 ?auto_670657 ?auto_670658 ?auto_670659 ?auto_670660 ?auto_670661 ?auto_670662 ?auto_670663 ?auto_670664 ?auto_670665 ?auto_670666 ?auto_670667 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670718 - BLOCK
      ?auto_670719 - BLOCK
      ?auto_670720 - BLOCK
      ?auto_670721 - BLOCK
      ?auto_670722 - BLOCK
      ?auto_670723 - BLOCK
      ?auto_670724 - BLOCK
      ?auto_670725 - BLOCK
      ?auto_670726 - BLOCK
      ?auto_670727 - BLOCK
      ?auto_670728 - BLOCK
      ?auto_670729 - BLOCK
      ?auto_670730 - BLOCK
      ?auto_670731 - BLOCK
      ?auto_670732 - BLOCK
      ?auto_670733 - BLOCK
    )
    :vars
    (
      ?auto_670734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670733 ?auto_670734 ) ( ON-TABLE ?auto_670718 ) ( ON ?auto_670719 ?auto_670718 ) ( ON ?auto_670720 ?auto_670719 ) ( ON ?auto_670721 ?auto_670720 ) ( ON ?auto_670722 ?auto_670721 ) ( ON ?auto_670723 ?auto_670722 ) ( ON ?auto_670724 ?auto_670723 ) ( ON ?auto_670725 ?auto_670724 ) ( not ( = ?auto_670718 ?auto_670719 ) ) ( not ( = ?auto_670718 ?auto_670720 ) ) ( not ( = ?auto_670718 ?auto_670721 ) ) ( not ( = ?auto_670718 ?auto_670722 ) ) ( not ( = ?auto_670718 ?auto_670723 ) ) ( not ( = ?auto_670718 ?auto_670724 ) ) ( not ( = ?auto_670718 ?auto_670725 ) ) ( not ( = ?auto_670718 ?auto_670726 ) ) ( not ( = ?auto_670718 ?auto_670727 ) ) ( not ( = ?auto_670718 ?auto_670728 ) ) ( not ( = ?auto_670718 ?auto_670729 ) ) ( not ( = ?auto_670718 ?auto_670730 ) ) ( not ( = ?auto_670718 ?auto_670731 ) ) ( not ( = ?auto_670718 ?auto_670732 ) ) ( not ( = ?auto_670718 ?auto_670733 ) ) ( not ( = ?auto_670718 ?auto_670734 ) ) ( not ( = ?auto_670719 ?auto_670720 ) ) ( not ( = ?auto_670719 ?auto_670721 ) ) ( not ( = ?auto_670719 ?auto_670722 ) ) ( not ( = ?auto_670719 ?auto_670723 ) ) ( not ( = ?auto_670719 ?auto_670724 ) ) ( not ( = ?auto_670719 ?auto_670725 ) ) ( not ( = ?auto_670719 ?auto_670726 ) ) ( not ( = ?auto_670719 ?auto_670727 ) ) ( not ( = ?auto_670719 ?auto_670728 ) ) ( not ( = ?auto_670719 ?auto_670729 ) ) ( not ( = ?auto_670719 ?auto_670730 ) ) ( not ( = ?auto_670719 ?auto_670731 ) ) ( not ( = ?auto_670719 ?auto_670732 ) ) ( not ( = ?auto_670719 ?auto_670733 ) ) ( not ( = ?auto_670719 ?auto_670734 ) ) ( not ( = ?auto_670720 ?auto_670721 ) ) ( not ( = ?auto_670720 ?auto_670722 ) ) ( not ( = ?auto_670720 ?auto_670723 ) ) ( not ( = ?auto_670720 ?auto_670724 ) ) ( not ( = ?auto_670720 ?auto_670725 ) ) ( not ( = ?auto_670720 ?auto_670726 ) ) ( not ( = ?auto_670720 ?auto_670727 ) ) ( not ( = ?auto_670720 ?auto_670728 ) ) ( not ( = ?auto_670720 ?auto_670729 ) ) ( not ( = ?auto_670720 ?auto_670730 ) ) ( not ( = ?auto_670720 ?auto_670731 ) ) ( not ( = ?auto_670720 ?auto_670732 ) ) ( not ( = ?auto_670720 ?auto_670733 ) ) ( not ( = ?auto_670720 ?auto_670734 ) ) ( not ( = ?auto_670721 ?auto_670722 ) ) ( not ( = ?auto_670721 ?auto_670723 ) ) ( not ( = ?auto_670721 ?auto_670724 ) ) ( not ( = ?auto_670721 ?auto_670725 ) ) ( not ( = ?auto_670721 ?auto_670726 ) ) ( not ( = ?auto_670721 ?auto_670727 ) ) ( not ( = ?auto_670721 ?auto_670728 ) ) ( not ( = ?auto_670721 ?auto_670729 ) ) ( not ( = ?auto_670721 ?auto_670730 ) ) ( not ( = ?auto_670721 ?auto_670731 ) ) ( not ( = ?auto_670721 ?auto_670732 ) ) ( not ( = ?auto_670721 ?auto_670733 ) ) ( not ( = ?auto_670721 ?auto_670734 ) ) ( not ( = ?auto_670722 ?auto_670723 ) ) ( not ( = ?auto_670722 ?auto_670724 ) ) ( not ( = ?auto_670722 ?auto_670725 ) ) ( not ( = ?auto_670722 ?auto_670726 ) ) ( not ( = ?auto_670722 ?auto_670727 ) ) ( not ( = ?auto_670722 ?auto_670728 ) ) ( not ( = ?auto_670722 ?auto_670729 ) ) ( not ( = ?auto_670722 ?auto_670730 ) ) ( not ( = ?auto_670722 ?auto_670731 ) ) ( not ( = ?auto_670722 ?auto_670732 ) ) ( not ( = ?auto_670722 ?auto_670733 ) ) ( not ( = ?auto_670722 ?auto_670734 ) ) ( not ( = ?auto_670723 ?auto_670724 ) ) ( not ( = ?auto_670723 ?auto_670725 ) ) ( not ( = ?auto_670723 ?auto_670726 ) ) ( not ( = ?auto_670723 ?auto_670727 ) ) ( not ( = ?auto_670723 ?auto_670728 ) ) ( not ( = ?auto_670723 ?auto_670729 ) ) ( not ( = ?auto_670723 ?auto_670730 ) ) ( not ( = ?auto_670723 ?auto_670731 ) ) ( not ( = ?auto_670723 ?auto_670732 ) ) ( not ( = ?auto_670723 ?auto_670733 ) ) ( not ( = ?auto_670723 ?auto_670734 ) ) ( not ( = ?auto_670724 ?auto_670725 ) ) ( not ( = ?auto_670724 ?auto_670726 ) ) ( not ( = ?auto_670724 ?auto_670727 ) ) ( not ( = ?auto_670724 ?auto_670728 ) ) ( not ( = ?auto_670724 ?auto_670729 ) ) ( not ( = ?auto_670724 ?auto_670730 ) ) ( not ( = ?auto_670724 ?auto_670731 ) ) ( not ( = ?auto_670724 ?auto_670732 ) ) ( not ( = ?auto_670724 ?auto_670733 ) ) ( not ( = ?auto_670724 ?auto_670734 ) ) ( not ( = ?auto_670725 ?auto_670726 ) ) ( not ( = ?auto_670725 ?auto_670727 ) ) ( not ( = ?auto_670725 ?auto_670728 ) ) ( not ( = ?auto_670725 ?auto_670729 ) ) ( not ( = ?auto_670725 ?auto_670730 ) ) ( not ( = ?auto_670725 ?auto_670731 ) ) ( not ( = ?auto_670725 ?auto_670732 ) ) ( not ( = ?auto_670725 ?auto_670733 ) ) ( not ( = ?auto_670725 ?auto_670734 ) ) ( not ( = ?auto_670726 ?auto_670727 ) ) ( not ( = ?auto_670726 ?auto_670728 ) ) ( not ( = ?auto_670726 ?auto_670729 ) ) ( not ( = ?auto_670726 ?auto_670730 ) ) ( not ( = ?auto_670726 ?auto_670731 ) ) ( not ( = ?auto_670726 ?auto_670732 ) ) ( not ( = ?auto_670726 ?auto_670733 ) ) ( not ( = ?auto_670726 ?auto_670734 ) ) ( not ( = ?auto_670727 ?auto_670728 ) ) ( not ( = ?auto_670727 ?auto_670729 ) ) ( not ( = ?auto_670727 ?auto_670730 ) ) ( not ( = ?auto_670727 ?auto_670731 ) ) ( not ( = ?auto_670727 ?auto_670732 ) ) ( not ( = ?auto_670727 ?auto_670733 ) ) ( not ( = ?auto_670727 ?auto_670734 ) ) ( not ( = ?auto_670728 ?auto_670729 ) ) ( not ( = ?auto_670728 ?auto_670730 ) ) ( not ( = ?auto_670728 ?auto_670731 ) ) ( not ( = ?auto_670728 ?auto_670732 ) ) ( not ( = ?auto_670728 ?auto_670733 ) ) ( not ( = ?auto_670728 ?auto_670734 ) ) ( not ( = ?auto_670729 ?auto_670730 ) ) ( not ( = ?auto_670729 ?auto_670731 ) ) ( not ( = ?auto_670729 ?auto_670732 ) ) ( not ( = ?auto_670729 ?auto_670733 ) ) ( not ( = ?auto_670729 ?auto_670734 ) ) ( not ( = ?auto_670730 ?auto_670731 ) ) ( not ( = ?auto_670730 ?auto_670732 ) ) ( not ( = ?auto_670730 ?auto_670733 ) ) ( not ( = ?auto_670730 ?auto_670734 ) ) ( not ( = ?auto_670731 ?auto_670732 ) ) ( not ( = ?auto_670731 ?auto_670733 ) ) ( not ( = ?auto_670731 ?auto_670734 ) ) ( not ( = ?auto_670732 ?auto_670733 ) ) ( not ( = ?auto_670732 ?auto_670734 ) ) ( not ( = ?auto_670733 ?auto_670734 ) ) ( ON ?auto_670732 ?auto_670733 ) ( ON ?auto_670731 ?auto_670732 ) ( ON ?auto_670730 ?auto_670731 ) ( ON ?auto_670729 ?auto_670730 ) ( ON ?auto_670728 ?auto_670729 ) ( ON ?auto_670727 ?auto_670728 ) ( CLEAR ?auto_670725 ) ( ON ?auto_670726 ?auto_670727 ) ( CLEAR ?auto_670726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_670718 ?auto_670719 ?auto_670720 ?auto_670721 ?auto_670722 ?auto_670723 ?auto_670724 ?auto_670725 ?auto_670726 )
      ( MAKE-16PILE ?auto_670718 ?auto_670719 ?auto_670720 ?auto_670721 ?auto_670722 ?auto_670723 ?auto_670724 ?auto_670725 ?auto_670726 ?auto_670727 ?auto_670728 ?auto_670729 ?auto_670730 ?auto_670731 ?auto_670732 ?auto_670733 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670784 - BLOCK
      ?auto_670785 - BLOCK
      ?auto_670786 - BLOCK
      ?auto_670787 - BLOCK
      ?auto_670788 - BLOCK
      ?auto_670789 - BLOCK
      ?auto_670790 - BLOCK
      ?auto_670791 - BLOCK
      ?auto_670792 - BLOCK
      ?auto_670793 - BLOCK
      ?auto_670794 - BLOCK
      ?auto_670795 - BLOCK
      ?auto_670796 - BLOCK
      ?auto_670797 - BLOCK
      ?auto_670798 - BLOCK
      ?auto_670799 - BLOCK
    )
    :vars
    (
      ?auto_670800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670799 ?auto_670800 ) ( ON-TABLE ?auto_670784 ) ( ON ?auto_670785 ?auto_670784 ) ( ON ?auto_670786 ?auto_670785 ) ( ON ?auto_670787 ?auto_670786 ) ( ON ?auto_670788 ?auto_670787 ) ( ON ?auto_670789 ?auto_670788 ) ( ON ?auto_670790 ?auto_670789 ) ( not ( = ?auto_670784 ?auto_670785 ) ) ( not ( = ?auto_670784 ?auto_670786 ) ) ( not ( = ?auto_670784 ?auto_670787 ) ) ( not ( = ?auto_670784 ?auto_670788 ) ) ( not ( = ?auto_670784 ?auto_670789 ) ) ( not ( = ?auto_670784 ?auto_670790 ) ) ( not ( = ?auto_670784 ?auto_670791 ) ) ( not ( = ?auto_670784 ?auto_670792 ) ) ( not ( = ?auto_670784 ?auto_670793 ) ) ( not ( = ?auto_670784 ?auto_670794 ) ) ( not ( = ?auto_670784 ?auto_670795 ) ) ( not ( = ?auto_670784 ?auto_670796 ) ) ( not ( = ?auto_670784 ?auto_670797 ) ) ( not ( = ?auto_670784 ?auto_670798 ) ) ( not ( = ?auto_670784 ?auto_670799 ) ) ( not ( = ?auto_670784 ?auto_670800 ) ) ( not ( = ?auto_670785 ?auto_670786 ) ) ( not ( = ?auto_670785 ?auto_670787 ) ) ( not ( = ?auto_670785 ?auto_670788 ) ) ( not ( = ?auto_670785 ?auto_670789 ) ) ( not ( = ?auto_670785 ?auto_670790 ) ) ( not ( = ?auto_670785 ?auto_670791 ) ) ( not ( = ?auto_670785 ?auto_670792 ) ) ( not ( = ?auto_670785 ?auto_670793 ) ) ( not ( = ?auto_670785 ?auto_670794 ) ) ( not ( = ?auto_670785 ?auto_670795 ) ) ( not ( = ?auto_670785 ?auto_670796 ) ) ( not ( = ?auto_670785 ?auto_670797 ) ) ( not ( = ?auto_670785 ?auto_670798 ) ) ( not ( = ?auto_670785 ?auto_670799 ) ) ( not ( = ?auto_670785 ?auto_670800 ) ) ( not ( = ?auto_670786 ?auto_670787 ) ) ( not ( = ?auto_670786 ?auto_670788 ) ) ( not ( = ?auto_670786 ?auto_670789 ) ) ( not ( = ?auto_670786 ?auto_670790 ) ) ( not ( = ?auto_670786 ?auto_670791 ) ) ( not ( = ?auto_670786 ?auto_670792 ) ) ( not ( = ?auto_670786 ?auto_670793 ) ) ( not ( = ?auto_670786 ?auto_670794 ) ) ( not ( = ?auto_670786 ?auto_670795 ) ) ( not ( = ?auto_670786 ?auto_670796 ) ) ( not ( = ?auto_670786 ?auto_670797 ) ) ( not ( = ?auto_670786 ?auto_670798 ) ) ( not ( = ?auto_670786 ?auto_670799 ) ) ( not ( = ?auto_670786 ?auto_670800 ) ) ( not ( = ?auto_670787 ?auto_670788 ) ) ( not ( = ?auto_670787 ?auto_670789 ) ) ( not ( = ?auto_670787 ?auto_670790 ) ) ( not ( = ?auto_670787 ?auto_670791 ) ) ( not ( = ?auto_670787 ?auto_670792 ) ) ( not ( = ?auto_670787 ?auto_670793 ) ) ( not ( = ?auto_670787 ?auto_670794 ) ) ( not ( = ?auto_670787 ?auto_670795 ) ) ( not ( = ?auto_670787 ?auto_670796 ) ) ( not ( = ?auto_670787 ?auto_670797 ) ) ( not ( = ?auto_670787 ?auto_670798 ) ) ( not ( = ?auto_670787 ?auto_670799 ) ) ( not ( = ?auto_670787 ?auto_670800 ) ) ( not ( = ?auto_670788 ?auto_670789 ) ) ( not ( = ?auto_670788 ?auto_670790 ) ) ( not ( = ?auto_670788 ?auto_670791 ) ) ( not ( = ?auto_670788 ?auto_670792 ) ) ( not ( = ?auto_670788 ?auto_670793 ) ) ( not ( = ?auto_670788 ?auto_670794 ) ) ( not ( = ?auto_670788 ?auto_670795 ) ) ( not ( = ?auto_670788 ?auto_670796 ) ) ( not ( = ?auto_670788 ?auto_670797 ) ) ( not ( = ?auto_670788 ?auto_670798 ) ) ( not ( = ?auto_670788 ?auto_670799 ) ) ( not ( = ?auto_670788 ?auto_670800 ) ) ( not ( = ?auto_670789 ?auto_670790 ) ) ( not ( = ?auto_670789 ?auto_670791 ) ) ( not ( = ?auto_670789 ?auto_670792 ) ) ( not ( = ?auto_670789 ?auto_670793 ) ) ( not ( = ?auto_670789 ?auto_670794 ) ) ( not ( = ?auto_670789 ?auto_670795 ) ) ( not ( = ?auto_670789 ?auto_670796 ) ) ( not ( = ?auto_670789 ?auto_670797 ) ) ( not ( = ?auto_670789 ?auto_670798 ) ) ( not ( = ?auto_670789 ?auto_670799 ) ) ( not ( = ?auto_670789 ?auto_670800 ) ) ( not ( = ?auto_670790 ?auto_670791 ) ) ( not ( = ?auto_670790 ?auto_670792 ) ) ( not ( = ?auto_670790 ?auto_670793 ) ) ( not ( = ?auto_670790 ?auto_670794 ) ) ( not ( = ?auto_670790 ?auto_670795 ) ) ( not ( = ?auto_670790 ?auto_670796 ) ) ( not ( = ?auto_670790 ?auto_670797 ) ) ( not ( = ?auto_670790 ?auto_670798 ) ) ( not ( = ?auto_670790 ?auto_670799 ) ) ( not ( = ?auto_670790 ?auto_670800 ) ) ( not ( = ?auto_670791 ?auto_670792 ) ) ( not ( = ?auto_670791 ?auto_670793 ) ) ( not ( = ?auto_670791 ?auto_670794 ) ) ( not ( = ?auto_670791 ?auto_670795 ) ) ( not ( = ?auto_670791 ?auto_670796 ) ) ( not ( = ?auto_670791 ?auto_670797 ) ) ( not ( = ?auto_670791 ?auto_670798 ) ) ( not ( = ?auto_670791 ?auto_670799 ) ) ( not ( = ?auto_670791 ?auto_670800 ) ) ( not ( = ?auto_670792 ?auto_670793 ) ) ( not ( = ?auto_670792 ?auto_670794 ) ) ( not ( = ?auto_670792 ?auto_670795 ) ) ( not ( = ?auto_670792 ?auto_670796 ) ) ( not ( = ?auto_670792 ?auto_670797 ) ) ( not ( = ?auto_670792 ?auto_670798 ) ) ( not ( = ?auto_670792 ?auto_670799 ) ) ( not ( = ?auto_670792 ?auto_670800 ) ) ( not ( = ?auto_670793 ?auto_670794 ) ) ( not ( = ?auto_670793 ?auto_670795 ) ) ( not ( = ?auto_670793 ?auto_670796 ) ) ( not ( = ?auto_670793 ?auto_670797 ) ) ( not ( = ?auto_670793 ?auto_670798 ) ) ( not ( = ?auto_670793 ?auto_670799 ) ) ( not ( = ?auto_670793 ?auto_670800 ) ) ( not ( = ?auto_670794 ?auto_670795 ) ) ( not ( = ?auto_670794 ?auto_670796 ) ) ( not ( = ?auto_670794 ?auto_670797 ) ) ( not ( = ?auto_670794 ?auto_670798 ) ) ( not ( = ?auto_670794 ?auto_670799 ) ) ( not ( = ?auto_670794 ?auto_670800 ) ) ( not ( = ?auto_670795 ?auto_670796 ) ) ( not ( = ?auto_670795 ?auto_670797 ) ) ( not ( = ?auto_670795 ?auto_670798 ) ) ( not ( = ?auto_670795 ?auto_670799 ) ) ( not ( = ?auto_670795 ?auto_670800 ) ) ( not ( = ?auto_670796 ?auto_670797 ) ) ( not ( = ?auto_670796 ?auto_670798 ) ) ( not ( = ?auto_670796 ?auto_670799 ) ) ( not ( = ?auto_670796 ?auto_670800 ) ) ( not ( = ?auto_670797 ?auto_670798 ) ) ( not ( = ?auto_670797 ?auto_670799 ) ) ( not ( = ?auto_670797 ?auto_670800 ) ) ( not ( = ?auto_670798 ?auto_670799 ) ) ( not ( = ?auto_670798 ?auto_670800 ) ) ( not ( = ?auto_670799 ?auto_670800 ) ) ( ON ?auto_670798 ?auto_670799 ) ( ON ?auto_670797 ?auto_670798 ) ( ON ?auto_670796 ?auto_670797 ) ( ON ?auto_670795 ?auto_670796 ) ( ON ?auto_670794 ?auto_670795 ) ( ON ?auto_670793 ?auto_670794 ) ( ON ?auto_670792 ?auto_670793 ) ( CLEAR ?auto_670790 ) ( ON ?auto_670791 ?auto_670792 ) ( CLEAR ?auto_670791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_670784 ?auto_670785 ?auto_670786 ?auto_670787 ?auto_670788 ?auto_670789 ?auto_670790 ?auto_670791 )
      ( MAKE-16PILE ?auto_670784 ?auto_670785 ?auto_670786 ?auto_670787 ?auto_670788 ?auto_670789 ?auto_670790 ?auto_670791 ?auto_670792 ?auto_670793 ?auto_670794 ?auto_670795 ?auto_670796 ?auto_670797 ?auto_670798 ?auto_670799 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670850 - BLOCK
      ?auto_670851 - BLOCK
      ?auto_670852 - BLOCK
      ?auto_670853 - BLOCK
      ?auto_670854 - BLOCK
      ?auto_670855 - BLOCK
      ?auto_670856 - BLOCK
      ?auto_670857 - BLOCK
      ?auto_670858 - BLOCK
      ?auto_670859 - BLOCK
      ?auto_670860 - BLOCK
      ?auto_670861 - BLOCK
      ?auto_670862 - BLOCK
      ?auto_670863 - BLOCK
      ?auto_670864 - BLOCK
      ?auto_670865 - BLOCK
    )
    :vars
    (
      ?auto_670866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670865 ?auto_670866 ) ( ON-TABLE ?auto_670850 ) ( ON ?auto_670851 ?auto_670850 ) ( ON ?auto_670852 ?auto_670851 ) ( ON ?auto_670853 ?auto_670852 ) ( ON ?auto_670854 ?auto_670853 ) ( ON ?auto_670855 ?auto_670854 ) ( not ( = ?auto_670850 ?auto_670851 ) ) ( not ( = ?auto_670850 ?auto_670852 ) ) ( not ( = ?auto_670850 ?auto_670853 ) ) ( not ( = ?auto_670850 ?auto_670854 ) ) ( not ( = ?auto_670850 ?auto_670855 ) ) ( not ( = ?auto_670850 ?auto_670856 ) ) ( not ( = ?auto_670850 ?auto_670857 ) ) ( not ( = ?auto_670850 ?auto_670858 ) ) ( not ( = ?auto_670850 ?auto_670859 ) ) ( not ( = ?auto_670850 ?auto_670860 ) ) ( not ( = ?auto_670850 ?auto_670861 ) ) ( not ( = ?auto_670850 ?auto_670862 ) ) ( not ( = ?auto_670850 ?auto_670863 ) ) ( not ( = ?auto_670850 ?auto_670864 ) ) ( not ( = ?auto_670850 ?auto_670865 ) ) ( not ( = ?auto_670850 ?auto_670866 ) ) ( not ( = ?auto_670851 ?auto_670852 ) ) ( not ( = ?auto_670851 ?auto_670853 ) ) ( not ( = ?auto_670851 ?auto_670854 ) ) ( not ( = ?auto_670851 ?auto_670855 ) ) ( not ( = ?auto_670851 ?auto_670856 ) ) ( not ( = ?auto_670851 ?auto_670857 ) ) ( not ( = ?auto_670851 ?auto_670858 ) ) ( not ( = ?auto_670851 ?auto_670859 ) ) ( not ( = ?auto_670851 ?auto_670860 ) ) ( not ( = ?auto_670851 ?auto_670861 ) ) ( not ( = ?auto_670851 ?auto_670862 ) ) ( not ( = ?auto_670851 ?auto_670863 ) ) ( not ( = ?auto_670851 ?auto_670864 ) ) ( not ( = ?auto_670851 ?auto_670865 ) ) ( not ( = ?auto_670851 ?auto_670866 ) ) ( not ( = ?auto_670852 ?auto_670853 ) ) ( not ( = ?auto_670852 ?auto_670854 ) ) ( not ( = ?auto_670852 ?auto_670855 ) ) ( not ( = ?auto_670852 ?auto_670856 ) ) ( not ( = ?auto_670852 ?auto_670857 ) ) ( not ( = ?auto_670852 ?auto_670858 ) ) ( not ( = ?auto_670852 ?auto_670859 ) ) ( not ( = ?auto_670852 ?auto_670860 ) ) ( not ( = ?auto_670852 ?auto_670861 ) ) ( not ( = ?auto_670852 ?auto_670862 ) ) ( not ( = ?auto_670852 ?auto_670863 ) ) ( not ( = ?auto_670852 ?auto_670864 ) ) ( not ( = ?auto_670852 ?auto_670865 ) ) ( not ( = ?auto_670852 ?auto_670866 ) ) ( not ( = ?auto_670853 ?auto_670854 ) ) ( not ( = ?auto_670853 ?auto_670855 ) ) ( not ( = ?auto_670853 ?auto_670856 ) ) ( not ( = ?auto_670853 ?auto_670857 ) ) ( not ( = ?auto_670853 ?auto_670858 ) ) ( not ( = ?auto_670853 ?auto_670859 ) ) ( not ( = ?auto_670853 ?auto_670860 ) ) ( not ( = ?auto_670853 ?auto_670861 ) ) ( not ( = ?auto_670853 ?auto_670862 ) ) ( not ( = ?auto_670853 ?auto_670863 ) ) ( not ( = ?auto_670853 ?auto_670864 ) ) ( not ( = ?auto_670853 ?auto_670865 ) ) ( not ( = ?auto_670853 ?auto_670866 ) ) ( not ( = ?auto_670854 ?auto_670855 ) ) ( not ( = ?auto_670854 ?auto_670856 ) ) ( not ( = ?auto_670854 ?auto_670857 ) ) ( not ( = ?auto_670854 ?auto_670858 ) ) ( not ( = ?auto_670854 ?auto_670859 ) ) ( not ( = ?auto_670854 ?auto_670860 ) ) ( not ( = ?auto_670854 ?auto_670861 ) ) ( not ( = ?auto_670854 ?auto_670862 ) ) ( not ( = ?auto_670854 ?auto_670863 ) ) ( not ( = ?auto_670854 ?auto_670864 ) ) ( not ( = ?auto_670854 ?auto_670865 ) ) ( not ( = ?auto_670854 ?auto_670866 ) ) ( not ( = ?auto_670855 ?auto_670856 ) ) ( not ( = ?auto_670855 ?auto_670857 ) ) ( not ( = ?auto_670855 ?auto_670858 ) ) ( not ( = ?auto_670855 ?auto_670859 ) ) ( not ( = ?auto_670855 ?auto_670860 ) ) ( not ( = ?auto_670855 ?auto_670861 ) ) ( not ( = ?auto_670855 ?auto_670862 ) ) ( not ( = ?auto_670855 ?auto_670863 ) ) ( not ( = ?auto_670855 ?auto_670864 ) ) ( not ( = ?auto_670855 ?auto_670865 ) ) ( not ( = ?auto_670855 ?auto_670866 ) ) ( not ( = ?auto_670856 ?auto_670857 ) ) ( not ( = ?auto_670856 ?auto_670858 ) ) ( not ( = ?auto_670856 ?auto_670859 ) ) ( not ( = ?auto_670856 ?auto_670860 ) ) ( not ( = ?auto_670856 ?auto_670861 ) ) ( not ( = ?auto_670856 ?auto_670862 ) ) ( not ( = ?auto_670856 ?auto_670863 ) ) ( not ( = ?auto_670856 ?auto_670864 ) ) ( not ( = ?auto_670856 ?auto_670865 ) ) ( not ( = ?auto_670856 ?auto_670866 ) ) ( not ( = ?auto_670857 ?auto_670858 ) ) ( not ( = ?auto_670857 ?auto_670859 ) ) ( not ( = ?auto_670857 ?auto_670860 ) ) ( not ( = ?auto_670857 ?auto_670861 ) ) ( not ( = ?auto_670857 ?auto_670862 ) ) ( not ( = ?auto_670857 ?auto_670863 ) ) ( not ( = ?auto_670857 ?auto_670864 ) ) ( not ( = ?auto_670857 ?auto_670865 ) ) ( not ( = ?auto_670857 ?auto_670866 ) ) ( not ( = ?auto_670858 ?auto_670859 ) ) ( not ( = ?auto_670858 ?auto_670860 ) ) ( not ( = ?auto_670858 ?auto_670861 ) ) ( not ( = ?auto_670858 ?auto_670862 ) ) ( not ( = ?auto_670858 ?auto_670863 ) ) ( not ( = ?auto_670858 ?auto_670864 ) ) ( not ( = ?auto_670858 ?auto_670865 ) ) ( not ( = ?auto_670858 ?auto_670866 ) ) ( not ( = ?auto_670859 ?auto_670860 ) ) ( not ( = ?auto_670859 ?auto_670861 ) ) ( not ( = ?auto_670859 ?auto_670862 ) ) ( not ( = ?auto_670859 ?auto_670863 ) ) ( not ( = ?auto_670859 ?auto_670864 ) ) ( not ( = ?auto_670859 ?auto_670865 ) ) ( not ( = ?auto_670859 ?auto_670866 ) ) ( not ( = ?auto_670860 ?auto_670861 ) ) ( not ( = ?auto_670860 ?auto_670862 ) ) ( not ( = ?auto_670860 ?auto_670863 ) ) ( not ( = ?auto_670860 ?auto_670864 ) ) ( not ( = ?auto_670860 ?auto_670865 ) ) ( not ( = ?auto_670860 ?auto_670866 ) ) ( not ( = ?auto_670861 ?auto_670862 ) ) ( not ( = ?auto_670861 ?auto_670863 ) ) ( not ( = ?auto_670861 ?auto_670864 ) ) ( not ( = ?auto_670861 ?auto_670865 ) ) ( not ( = ?auto_670861 ?auto_670866 ) ) ( not ( = ?auto_670862 ?auto_670863 ) ) ( not ( = ?auto_670862 ?auto_670864 ) ) ( not ( = ?auto_670862 ?auto_670865 ) ) ( not ( = ?auto_670862 ?auto_670866 ) ) ( not ( = ?auto_670863 ?auto_670864 ) ) ( not ( = ?auto_670863 ?auto_670865 ) ) ( not ( = ?auto_670863 ?auto_670866 ) ) ( not ( = ?auto_670864 ?auto_670865 ) ) ( not ( = ?auto_670864 ?auto_670866 ) ) ( not ( = ?auto_670865 ?auto_670866 ) ) ( ON ?auto_670864 ?auto_670865 ) ( ON ?auto_670863 ?auto_670864 ) ( ON ?auto_670862 ?auto_670863 ) ( ON ?auto_670861 ?auto_670862 ) ( ON ?auto_670860 ?auto_670861 ) ( ON ?auto_670859 ?auto_670860 ) ( ON ?auto_670858 ?auto_670859 ) ( ON ?auto_670857 ?auto_670858 ) ( CLEAR ?auto_670855 ) ( ON ?auto_670856 ?auto_670857 ) ( CLEAR ?auto_670856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_670850 ?auto_670851 ?auto_670852 ?auto_670853 ?auto_670854 ?auto_670855 ?auto_670856 )
      ( MAKE-16PILE ?auto_670850 ?auto_670851 ?auto_670852 ?auto_670853 ?auto_670854 ?auto_670855 ?auto_670856 ?auto_670857 ?auto_670858 ?auto_670859 ?auto_670860 ?auto_670861 ?auto_670862 ?auto_670863 ?auto_670864 ?auto_670865 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670916 - BLOCK
      ?auto_670917 - BLOCK
      ?auto_670918 - BLOCK
      ?auto_670919 - BLOCK
      ?auto_670920 - BLOCK
      ?auto_670921 - BLOCK
      ?auto_670922 - BLOCK
      ?auto_670923 - BLOCK
      ?auto_670924 - BLOCK
      ?auto_670925 - BLOCK
      ?auto_670926 - BLOCK
      ?auto_670927 - BLOCK
      ?auto_670928 - BLOCK
      ?auto_670929 - BLOCK
      ?auto_670930 - BLOCK
      ?auto_670931 - BLOCK
    )
    :vars
    (
      ?auto_670932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670931 ?auto_670932 ) ( ON-TABLE ?auto_670916 ) ( ON ?auto_670917 ?auto_670916 ) ( ON ?auto_670918 ?auto_670917 ) ( ON ?auto_670919 ?auto_670918 ) ( ON ?auto_670920 ?auto_670919 ) ( not ( = ?auto_670916 ?auto_670917 ) ) ( not ( = ?auto_670916 ?auto_670918 ) ) ( not ( = ?auto_670916 ?auto_670919 ) ) ( not ( = ?auto_670916 ?auto_670920 ) ) ( not ( = ?auto_670916 ?auto_670921 ) ) ( not ( = ?auto_670916 ?auto_670922 ) ) ( not ( = ?auto_670916 ?auto_670923 ) ) ( not ( = ?auto_670916 ?auto_670924 ) ) ( not ( = ?auto_670916 ?auto_670925 ) ) ( not ( = ?auto_670916 ?auto_670926 ) ) ( not ( = ?auto_670916 ?auto_670927 ) ) ( not ( = ?auto_670916 ?auto_670928 ) ) ( not ( = ?auto_670916 ?auto_670929 ) ) ( not ( = ?auto_670916 ?auto_670930 ) ) ( not ( = ?auto_670916 ?auto_670931 ) ) ( not ( = ?auto_670916 ?auto_670932 ) ) ( not ( = ?auto_670917 ?auto_670918 ) ) ( not ( = ?auto_670917 ?auto_670919 ) ) ( not ( = ?auto_670917 ?auto_670920 ) ) ( not ( = ?auto_670917 ?auto_670921 ) ) ( not ( = ?auto_670917 ?auto_670922 ) ) ( not ( = ?auto_670917 ?auto_670923 ) ) ( not ( = ?auto_670917 ?auto_670924 ) ) ( not ( = ?auto_670917 ?auto_670925 ) ) ( not ( = ?auto_670917 ?auto_670926 ) ) ( not ( = ?auto_670917 ?auto_670927 ) ) ( not ( = ?auto_670917 ?auto_670928 ) ) ( not ( = ?auto_670917 ?auto_670929 ) ) ( not ( = ?auto_670917 ?auto_670930 ) ) ( not ( = ?auto_670917 ?auto_670931 ) ) ( not ( = ?auto_670917 ?auto_670932 ) ) ( not ( = ?auto_670918 ?auto_670919 ) ) ( not ( = ?auto_670918 ?auto_670920 ) ) ( not ( = ?auto_670918 ?auto_670921 ) ) ( not ( = ?auto_670918 ?auto_670922 ) ) ( not ( = ?auto_670918 ?auto_670923 ) ) ( not ( = ?auto_670918 ?auto_670924 ) ) ( not ( = ?auto_670918 ?auto_670925 ) ) ( not ( = ?auto_670918 ?auto_670926 ) ) ( not ( = ?auto_670918 ?auto_670927 ) ) ( not ( = ?auto_670918 ?auto_670928 ) ) ( not ( = ?auto_670918 ?auto_670929 ) ) ( not ( = ?auto_670918 ?auto_670930 ) ) ( not ( = ?auto_670918 ?auto_670931 ) ) ( not ( = ?auto_670918 ?auto_670932 ) ) ( not ( = ?auto_670919 ?auto_670920 ) ) ( not ( = ?auto_670919 ?auto_670921 ) ) ( not ( = ?auto_670919 ?auto_670922 ) ) ( not ( = ?auto_670919 ?auto_670923 ) ) ( not ( = ?auto_670919 ?auto_670924 ) ) ( not ( = ?auto_670919 ?auto_670925 ) ) ( not ( = ?auto_670919 ?auto_670926 ) ) ( not ( = ?auto_670919 ?auto_670927 ) ) ( not ( = ?auto_670919 ?auto_670928 ) ) ( not ( = ?auto_670919 ?auto_670929 ) ) ( not ( = ?auto_670919 ?auto_670930 ) ) ( not ( = ?auto_670919 ?auto_670931 ) ) ( not ( = ?auto_670919 ?auto_670932 ) ) ( not ( = ?auto_670920 ?auto_670921 ) ) ( not ( = ?auto_670920 ?auto_670922 ) ) ( not ( = ?auto_670920 ?auto_670923 ) ) ( not ( = ?auto_670920 ?auto_670924 ) ) ( not ( = ?auto_670920 ?auto_670925 ) ) ( not ( = ?auto_670920 ?auto_670926 ) ) ( not ( = ?auto_670920 ?auto_670927 ) ) ( not ( = ?auto_670920 ?auto_670928 ) ) ( not ( = ?auto_670920 ?auto_670929 ) ) ( not ( = ?auto_670920 ?auto_670930 ) ) ( not ( = ?auto_670920 ?auto_670931 ) ) ( not ( = ?auto_670920 ?auto_670932 ) ) ( not ( = ?auto_670921 ?auto_670922 ) ) ( not ( = ?auto_670921 ?auto_670923 ) ) ( not ( = ?auto_670921 ?auto_670924 ) ) ( not ( = ?auto_670921 ?auto_670925 ) ) ( not ( = ?auto_670921 ?auto_670926 ) ) ( not ( = ?auto_670921 ?auto_670927 ) ) ( not ( = ?auto_670921 ?auto_670928 ) ) ( not ( = ?auto_670921 ?auto_670929 ) ) ( not ( = ?auto_670921 ?auto_670930 ) ) ( not ( = ?auto_670921 ?auto_670931 ) ) ( not ( = ?auto_670921 ?auto_670932 ) ) ( not ( = ?auto_670922 ?auto_670923 ) ) ( not ( = ?auto_670922 ?auto_670924 ) ) ( not ( = ?auto_670922 ?auto_670925 ) ) ( not ( = ?auto_670922 ?auto_670926 ) ) ( not ( = ?auto_670922 ?auto_670927 ) ) ( not ( = ?auto_670922 ?auto_670928 ) ) ( not ( = ?auto_670922 ?auto_670929 ) ) ( not ( = ?auto_670922 ?auto_670930 ) ) ( not ( = ?auto_670922 ?auto_670931 ) ) ( not ( = ?auto_670922 ?auto_670932 ) ) ( not ( = ?auto_670923 ?auto_670924 ) ) ( not ( = ?auto_670923 ?auto_670925 ) ) ( not ( = ?auto_670923 ?auto_670926 ) ) ( not ( = ?auto_670923 ?auto_670927 ) ) ( not ( = ?auto_670923 ?auto_670928 ) ) ( not ( = ?auto_670923 ?auto_670929 ) ) ( not ( = ?auto_670923 ?auto_670930 ) ) ( not ( = ?auto_670923 ?auto_670931 ) ) ( not ( = ?auto_670923 ?auto_670932 ) ) ( not ( = ?auto_670924 ?auto_670925 ) ) ( not ( = ?auto_670924 ?auto_670926 ) ) ( not ( = ?auto_670924 ?auto_670927 ) ) ( not ( = ?auto_670924 ?auto_670928 ) ) ( not ( = ?auto_670924 ?auto_670929 ) ) ( not ( = ?auto_670924 ?auto_670930 ) ) ( not ( = ?auto_670924 ?auto_670931 ) ) ( not ( = ?auto_670924 ?auto_670932 ) ) ( not ( = ?auto_670925 ?auto_670926 ) ) ( not ( = ?auto_670925 ?auto_670927 ) ) ( not ( = ?auto_670925 ?auto_670928 ) ) ( not ( = ?auto_670925 ?auto_670929 ) ) ( not ( = ?auto_670925 ?auto_670930 ) ) ( not ( = ?auto_670925 ?auto_670931 ) ) ( not ( = ?auto_670925 ?auto_670932 ) ) ( not ( = ?auto_670926 ?auto_670927 ) ) ( not ( = ?auto_670926 ?auto_670928 ) ) ( not ( = ?auto_670926 ?auto_670929 ) ) ( not ( = ?auto_670926 ?auto_670930 ) ) ( not ( = ?auto_670926 ?auto_670931 ) ) ( not ( = ?auto_670926 ?auto_670932 ) ) ( not ( = ?auto_670927 ?auto_670928 ) ) ( not ( = ?auto_670927 ?auto_670929 ) ) ( not ( = ?auto_670927 ?auto_670930 ) ) ( not ( = ?auto_670927 ?auto_670931 ) ) ( not ( = ?auto_670927 ?auto_670932 ) ) ( not ( = ?auto_670928 ?auto_670929 ) ) ( not ( = ?auto_670928 ?auto_670930 ) ) ( not ( = ?auto_670928 ?auto_670931 ) ) ( not ( = ?auto_670928 ?auto_670932 ) ) ( not ( = ?auto_670929 ?auto_670930 ) ) ( not ( = ?auto_670929 ?auto_670931 ) ) ( not ( = ?auto_670929 ?auto_670932 ) ) ( not ( = ?auto_670930 ?auto_670931 ) ) ( not ( = ?auto_670930 ?auto_670932 ) ) ( not ( = ?auto_670931 ?auto_670932 ) ) ( ON ?auto_670930 ?auto_670931 ) ( ON ?auto_670929 ?auto_670930 ) ( ON ?auto_670928 ?auto_670929 ) ( ON ?auto_670927 ?auto_670928 ) ( ON ?auto_670926 ?auto_670927 ) ( ON ?auto_670925 ?auto_670926 ) ( ON ?auto_670924 ?auto_670925 ) ( ON ?auto_670923 ?auto_670924 ) ( ON ?auto_670922 ?auto_670923 ) ( CLEAR ?auto_670920 ) ( ON ?auto_670921 ?auto_670922 ) ( CLEAR ?auto_670921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_670916 ?auto_670917 ?auto_670918 ?auto_670919 ?auto_670920 ?auto_670921 )
      ( MAKE-16PILE ?auto_670916 ?auto_670917 ?auto_670918 ?auto_670919 ?auto_670920 ?auto_670921 ?auto_670922 ?auto_670923 ?auto_670924 ?auto_670925 ?auto_670926 ?auto_670927 ?auto_670928 ?auto_670929 ?auto_670930 ?auto_670931 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_670982 - BLOCK
      ?auto_670983 - BLOCK
      ?auto_670984 - BLOCK
      ?auto_670985 - BLOCK
      ?auto_670986 - BLOCK
      ?auto_670987 - BLOCK
      ?auto_670988 - BLOCK
      ?auto_670989 - BLOCK
      ?auto_670990 - BLOCK
      ?auto_670991 - BLOCK
      ?auto_670992 - BLOCK
      ?auto_670993 - BLOCK
      ?auto_670994 - BLOCK
      ?auto_670995 - BLOCK
      ?auto_670996 - BLOCK
      ?auto_670997 - BLOCK
    )
    :vars
    (
      ?auto_670998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_670997 ?auto_670998 ) ( ON-TABLE ?auto_670982 ) ( ON ?auto_670983 ?auto_670982 ) ( ON ?auto_670984 ?auto_670983 ) ( ON ?auto_670985 ?auto_670984 ) ( not ( = ?auto_670982 ?auto_670983 ) ) ( not ( = ?auto_670982 ?auto_670984 ) ) ( not ( = ?auto_670982 ?auto_670985 ) ) ( not ( = ?auto_670982 ?auto_670986 ) ) ( not ( = ?auto_670982 ?auto_670987 ) ) ( not ( = ?auto_670982 ?auto_670988 ) ) ( not ( = ?auto_670982 ?auto_670989 ) ) ( not ( = ?auto_670982 ?auto_670990 ) ) ( not ( = ?auto_670982 ?auto_670991 ) ) ( not ( = ?auto_670982 ?auto_670992 ) ) ( not ( = ?auto_670982 ?auto_670993 ) ) ( not ( = ?auto_670982 ?auto_670994 ) ) ( not ( = ?auto_670982 ?auto_670995 ) ) ( not ( = ?auto_670982 ?auto_670996 ) ) ( not ( = ?auto_670982 ?auto_670997 ) ) ( not ( = ?auto_670982 ?auto_670998 ) ) ( not ( = ?auto_670983 ?auto_670984 ) ) ( not ( = ?auto_670983 ?auto_670985 ) ) ( not ( = ?auto_670983 ?auto_670986 ) ) ( not ( = ?auto_670983 ?auto_670987 ) ) ( not ( = ?auto_670983 ?auto_670988 ) ) ( not ( = ?auto_670983 ?auto_670989 ) ) ( not ( = ?auto_670983 ?auto_670990 ) ) ( not ( = ?auto_670983 ?auto_670991 ) ) ( not ( = ?auto_670983 ?auto_670992 ) ) ( not ( = ?auto_670983 ?auto_670993 ) ) ( not ( = ?auto_670983 ?auto_670994 ) ) ( not ( = ?auto_670983 ?auto_670995 ) ) ( not ( = ?auto_670983 ?auto_670996 ) ) ( not ( = ?auto_670983 ?auto_670997 ) ) ( not ( = ?auto_670983 ?auto_670998 ) ) ( not ( = ?auto_670984 ?auto_670985 ) ) ( not ( = ?auto_670984 ?auto_670986 ) ) ( not ( = ?auto_670984 ?auto_670987 ) ) ( not ( = ?auto_670984 ?auto_670988 ) ) ( not ( = ?auto_670984 ?auto_670989 ) ) ( not ( = ?auto_670984 ?auto_670990 ) ) ( not ( = ?auto_670984 ?auto_670991 ) ) ( not ( = ?auto_670984 ?auto_670992 ) ) ( not ( = ?auto_670984 ?auto_670993 ) ) ( not ( = ?auto_670984 ?auto_670994 ) ) ( not ( = ?auto_670984 ?auto_670995 ) ) ( not ( = ?auto_670984 ?auto_670996 ) ) ( not ( = ?auto_670984 ?auto_670997 ) ) ( not ( = ?auto_670984 ?auto_670998 ) ) ( not ( = ?auto_670985 ?auto_670986 ) ) ( not ( = ?auto_670985 ?auto_670987 ) ) ( not ( = ?auto_670985 ?auto_670988 ) ) ( not ( = ?auto_670985 ?auto_670989 ) ) ( not ( = ?auto_670985 ?auto_670990 ) ) ( not ( = ?auto_670985 ?auto_670991 ) ) ( not ( = ?auto_670985 ?auto_670992 ) ) ( not ( = ?auto_670985 ?auto_670993 ) ) ( not ( = ?auto_670985 ?auto_670994 ) ) ( not ( = ?auto_670985 ?auto_670995 ) ) ( not ( = ?auto_670985 ?auto_670996 ) ) ( not ( = ?auto_670985 ?auto_670997 ) ) ( not ( = ?auto_670985 ?auto_670998 ) ) ( not ( = ?auto_670986 ?auto_670987 ) ) ( not ( = ?auto_670986 ?auto_670988 ) ) ( not ( = ?auto_670986 ?auto_670989 ) ) ( not ( = ?auto_670986 ?auto_670990 ) ) ( not ( = ?auto_670986 ?auto_670991 ) ) ( not ( = ?auto_670986 ?auto_670992 ) ) ( not ( = ?auto_670986 ?auto_670993 ) ) ( not ( = ?auto_670986 ?auto_670994 ) ) ( not ( = ?auto_670986 ?auto_670995 ) ) ( not ( = ?auto_670986 ?auto_670996 ) ) ( not ( = ?auto_670986 ?auto_670997 ) ) ( not ( = ?auto_670986 ?auto_670998 ) ) ( not ( = ?auto_670987 ?auto_670988 ) ) ( not ( = ?auto_670987 ?auto_670989 ) ) ( not ( = ?auto_670987 ?auto_670990 ) ) ( not ( = ?auto_670987 ?auto_670991 ) ) ( not ( = ?auto_670987 ?auto_670992 ) ) ( not ( = ?auto_670987 ?auto_670993 ) ) ( not ( = ?auto_670987 ?auto_670994 ) ) ( not ( = ?auto_670987 ?auto_670995 ) ) ( not ( = ?auto_670987 ?auto_670996 ) ) ( not ( = ?auto_670987 ?auto_670997 ) ) ( not ( = ?auto_670987 ?auto_670998 ) ) ( not ( = ?auto_670988 ?auto_670989 ) ) ( not ( = ?auto_670988 ?auto_670990 ) ) ( not ( = ?auto_670988 ?auto_670991 ) ) ( not ( = ?auto_670988 ?auto_670992 ) ) ( not ( = ?auto_670988 ?auto_670993 ) ) ( not ( = ?auto_670988 ?auto_670994 ) ) ( not ( = ?auto_670988 ?auto_670995 ) ) ( not ( = ?auto_670988 ?auto_670996 ) ) ( not ( = ?auto_670988 ?auto_670997 ) ) ( not ( = ?auto_670988 ?auto_670998 ) ) ( not ( = ?auto_670989 ?auto_670990 ) ) ( not ( = ?auto_670989 ?auto_670991 ) ) ( not ( = ?auto_670989 ?auto_670992 ) ) ( not ( = ?auto_670989 ?auto_670993 ) ) ( not ( = ?auto_670989 ?auto_670994 ) ) ( not ( = ?auto_670989 ?auto_670995 ) ) ( not ( = ?auto_670989 ?auto_670996 ) ) ( not ( = ?auto_670989 ?auto_670997 ) ) ( not ( = ?auto_670989 ?auto_670998 ) ) ( not ( = ?auto_670990 ?auto_670991 ) ) ( not ( = ?auto_670990 ?auto_670992 ) ) ( not ( = ?auto_670990 ?auto_670993 ) ) ( not ( = ?auto_670990 ?auto_670994 ) ) ( not ( = ?auto_670990 ?auto_670995 ) ) ( not ( = ?auto_670990 ?auto_670996 ) ) ( not ( = ?auto_670990 ?auto_670997 ) ) ( not ( = ?auto_670990 ?auto_670998 ) ) ( not ( = ?auto_670991 ?auto_670992 ) ) ( not ( = ?auto_670991 ?auto_670993 ) ) ( not ( = ?auto_670991 ?auto_670994 ) ) ( not ( = ?auto_670991 ?auto_670995 ) ) ( not ( = ?auto_670991 ?auto_670996 ) ) ( not ( = ?auto_670991 ?auto_670997 ) ) ( not ( = ?auto_670991 ?auto_670998 ) ) ( not ( = ?auto_670992 ?auto_670993 ) ) ( not ( = ?auto_670992 ?auto_670994 ) ) ( not ( = ?auto_670992 ?auto_670995 ) ) ( not ( = ?auto_670992 ?auto_670996 ) ) ( not ( = ?auto_670992 ?auto_670997 ) ) ( not ( = ?auto_670992 ?auto_670998 ) ) ( not ( = ?auto_670993 ?auto_670994 ) ) ( not ( = ?auto_670993 ?auto_670995 ) ) ( not ( = ?auto_670993 ?auto_670996 ) ) ( not ( = ?auto_670993 ?auto_670997 ) ) ( not ( = ?auto_670993 ?auto_670998 ) ) ( not ( = ?auto_670994 ?auto_670995 ) ) ( not ( = ?auto_670994 ?auto_670996 ) ) ( not ( = ?auto_670994 ?auto_670997 ) ) ( not ( = ?auto_670994 ?auto_670998 ) ) ( not ( = ?auto_670995 ?auto_670996 ) ) ( not ( = ?auto_670995 ?auto_670997 ) ) ( not ( = ?auto_670995 ?auto_670998 ) ) ( not ( = ?auto_670996 ?auto_670997 ) ) ( not ( = ?auto_670996 ?auto_670998 ) ) ( not ( = ?auto_670997 ?auto_670998 ) ) ( ON ?auto_670996 ?auto_670997 ) ( ON ?auto_670995 ?auto_670996 ) ( ON ?auto_670994 ?auto_670995 ) ( ON ?auto_670993 ?auto_670994 ) ( ON ?auto_670992 ?auto_670993 ) ( ON ?auto_670991 ?auto_670992 ) ( ON ?auto_670990 ?auto_670991 ) ( ON ?auto_670989 ?auto_670990 ) ( ON ?auto_670988 ?auto_670989 ) ( ON ?auto_670987 ?auto_670988 ) ( CLEAR ?auto_670985 ) ( ON ?auto_670986 ?auto_670987 ) ( CLEAR ?auto_670986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_670982 ?auto_670983 ?auto_670984 ?auto_670985 ?auto_670986 )
      ( MAKE-16PILE ?auto_670982 ?auto_670983 ?auto_670984 ?auto_670985 ?auto_670986 ?auto_670987 ?auto_670988 ?auto_670989 ?auto_670990 ?auto_670991 ?auto_670992 ?auto_670993 ?auto_670994 ?auto_670995 ?auto_670996 ?auto_670997 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_671048 - BLOCK
      ?auto_671049 - BLOCK
      ?auto_671050 - BLOCK
      ?auto_671051 - BLOCK
      ?auto_671052 - BLOCK
      ?auto_671053 - BLOCK
      ?auto_671054 - BLOCK
      ?auto_671055 - BLOCK
      ?auto_671056 - BLOCK
      ?auto_671057 - BLOCK
      ?auto_671058 - BLOCK
      ?auto_671059 - BLOCK
      ?auto_671060 - BLOCK
      ?auto_671061 - BLOCK
      ?auto_671062 - BLOCK
      ?auto_671063 - BLOCK
    )
    :vars
    (
      ?auto_671064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671063 ?auto_671064 ) ( ON-TABLE ?auto_671048 ) ( ON ?auto_671049 ?auto_671048 ) ( ON ?auto_671050 ?auto_671049 ) ( not ( = ?auto_671048 ?auto_671049 ) ) ( not ( = ?auto_671048 ?auto_671050 ) ) ( not ( = ?auto_671048 ?auto_671051 ) ) ( not ( = ?auto_671048 ?auto_671052 ) ) ( not ( = ?auto_671048 ?auto_671053 ) ) ( not ( = ?auto_671048 ?auto_671054 ) ) ( not ( = ?auto_671048 ?auto_671055 ) ) ( not ( = ?auto_671048 ?auto_671056 ) ) ( not ( = ?auto_671048 ?auto_671057 ) ) ( not ( = ?auto_671048 ?auto_671058 ) ) ( not ( = ?auto_671048 ?auto_671059 ) ) ( not ( = ?auto_671048 ?auto_671060 ) ) ( not ( = ?auto_671048 ?auto_671061 ) ) ( not ( = ?auto_671048 ?auto_671062 ) ) ( not ( = ?auto_671048 ?auto_671063 ) ) ( not ( = ?auto_671048 ?auto_671064 ) ) ( not ( = ?auto_671049 ?auto_671050 ) ) ( not ( = ?auto_671049 ?auto_671051 ) ) ( not ( = ?auto_671049 ?auto_671052 ) ) ( not ( = ?auto_671049 ?auto_671053 ) ) ( not ( = ?auto_671049 ?auto_671054 ) ) ( not ( = ?auto_671049 ?auto_671055 ) ) ( not ( = ?auto_671049 ?auto_671056 ) ) ( not ( = ?auto_671049 ?auto_671057 ) ) ( not ( = ?auto_671049 ?auto_671058 ) ) ( not ( = ?auto_671049 ?auto_671059 ) ) ( not ( = ?auto_671049 ?auto_671060 ) ) ( not ( = ?auto_671049 ?auto_671061 ) ) ( not ( = ?auto_671049 ?auto_671062 ) ) ( not ( = ?auto_671049 ?auto_671063 ) ) ( not ( = ?auto_671049 ?auto_671064 ) ) ( not ( = ?auto_671050 ?auto_671051 ) ) ( not ( = ?auto_671050 ?auto_671052 ) ) ( not ( = ?auto_671050 ?auto_671053 ) ) ( not ( = ?auto_671050 ?auto_671054 ) ) ( not ( = ?auto_671050 ?auto_671055 ) ) ( not ( = ?auto_671050 ?auto_671056 ) ) ( not ( = ?auto_671050 ?auto_671057 ) ) ( not ( = ?auto_671050 ?auto_671058 ) ) ( not ( = ?auto_671050 ?auto_671059 ) ) ( not ( = ?auto_671050 ?auto_671060 ) ) ( not ( = ?auto_671050 ?auto_671061 ) ) ( not ( = ?auto_671050 ?auto_671062 ) ) ( not ( = ?auto_671050 ?auto_671063 ) ) ( not ( = ?auto_671050 ?auto_671064 ) ) ( not ( = ?auto_671051 ?auto_671052 ) ) ( not ( = ?auto_671051 ?auto_671053 ) ) ( not ( = ?auto_671051 ?auto_671054 ) ) ( not ( = ?auto_671051 ?auto_671055 ) ) ( not ( = ?auto_671051 ?auto_671056 ) ) ( not ( = ?auto_671051 ?auto_671057 ) ) ( not ( = ?auto_671051 ?auto_671058 ) ) ( not ( = ?auto_671051 ?auto_671059 ) ) ( not ( = ?auto_671051 ?auto_671060 ) ) ( not ( = ?auto_671051 ?auto_671061 ) ) ( not ( = ?auto_671051 ?auto_671062 ) ) ( not ( = ?auto_671051 ?auto_671063 ) ) ( not ( = ?auto_671051 ?auto_671064 ) ) ( not ( = ?auto_671052 ?auto_671053 ) ) ( not ( = ?auto_671052 ?auto_671054 ) ) ( not ( = ?auto_671052 ?auto_671055 ) ) ( not ( = ?auto_671052 ?auto_671056 ) ) ( not ( = ?auto_671052 ?auto_671057 ) ) ( not ( = ?auto_671052 ?auto_671058 ) ) ( not ( = ?auto_671052 ?auto_671059 ) ) ( not ( = ?auto_671052 ?auto_671060 ) ) ( not ( = ?auto_671052 ?auto_671061 ) ) ( not ( = ?auto_671052 ?auto_671062 ) ) ( not ( = ?auto_671052 ?auto_671063 ) ) ( not ( = ?auto_671052 ?auto_671064 ) ) ( not ( = ?auto_671053 ?auto_671054 ) ) ( not ( = ?auto_671053 ?auto_671055 ) ) ( not ( = ?auto_671053 ?auto_671056 ) ) ( not ( = ?auto_671053 ?auto_671057 ) ) ( not ( = ?auto_671053 ?auto_671058 ) ) ( not ( = ?auto_671053 ?auto_671059 ) ) ( not ( = ?auto_671053 ?auto_671060 ) ) ( not ( = ?auto_671053 ?auto_671061 ) ) ( not ( = ?auto_671053 ?auto_671062 ) ) ( not ( = ?auto_671053 ?auto_671063 ) ) ( not ( = ?auto_671053 ?auto_671064 ) ) ( not ( = ?auto_671054 ?auto_671055 ) ) ( not ( = ?auto_671054 ?auto_671056 ) ) ( not ( = ?auto_671054 ?auto_671057 ) ) ( not ( = ?auto_671054 ?auto_671058 ) ) ( not ( = ?auto_671054 ?auto_671059 ) ) ( not ( = ?auto_671054 ?auto_671060 ) ) ( not ( = ?auto_671054 ?auto_671061 ) ) ( not ( = ?auto_671054 ?auto_671062 ) ) ( not ( = ?auto_671054 ?auto_671063 ) ) ( not ( = ?auto_671054 ?auto_671064 ) ) ( not ( = ?auto_671055 ?auto_671056 ) ) ( not ( = ?auto_671055 ?auto_671057 ) ) ( not ( = ?auto_671055 ?auto_671058 ) ) ( not ( = ?auto_671055 ?auto_671059 ) ) ( not ( = ?auto_671055 ?auto_671060 ) ) ( not ( = ?auto_671055 ?auto_671061 ) ) ( not ( = ?auto_671055 ?auto_671062 ) ) ( not ( = ?auto_671055 ?auto_671063 ) ) ( not ( = ?auto_671055 ?auto_671064 ) ) ( not ( = ?auto_671056 ?auto_671057 ) ) ( not ( = ?auto_671056 ?auto_671058 ) ) ( not ( = ?auto_671056 ?auto_671059 ) ) ( not ( = ?auto_671056 ?auto_671060 ) ) ( not ( = ?auto_671056 ?auto_671061 ) ) ( not ( = ?auto_671056 ?auto_671062 ) ) ( not ( = ?auto_671056 ?auto_671063 ) ) ( not ( = ?auto_671056 ?auto_671064 ) ) ( not ( = ?auto_671057 ?auto_671058 ) ) ( not ( = ?auto_671057 ?auto_671059 ) ) ( not ( = ?auto_671057 ?auto_671060 ) ) ( not ( = ?auto_671057 ?auto_671061 ) ) ( not ( = ?auto_671057 ?auto_671062 ) ) ( not ( = ?auto_671057 ?auto_671063 ) ) ( not ( = ?auto_671057 ?auto_671064 ) ) ( not ( = ?auto_671058 ?auto_671059 ) ) ( not ( = ?auto_671058 ?auto_671060 ) ) ( not ( = ?auto_671058 ?auto_671061 ) ) ( not ( = ?auto_671058 ?auto_671062 ) ) ( not ( = ?auto_671058 ?auto_671063 ) ) ( not ( = ?auto_671058 ?auto_671064 ) ) ( not ( = ?auto_671059 ?auto_671060 ) ) ( not ( = ?auto_671059 ?auto_671061 ) ) ( not ( = ?auto_671059 ?auto_671062 ) ) ( not ( = ?auto_671059 ?auto_671063 ) ) ( not ( = ?auto_671059 ?auto_671064 ) ) ( not ( = ?auto_671060 ?auto_671061 ) ) ( not ( = ?auto_671060 ?auto_671062 ) ) ( not ( = ?auto_671060 ?auto_671063 ) ) ( not ( = ?auto_671060 ?auto_671064 ) ) ( not ( = ?auto_671061 ?auto_671062 ) ) ( not ( = ?auto_671061 ?auto_671063 ) ) ( not ( = ?auto_671061 ?auto_671064 ) ) ( not ( = ?auto_671062 ?auto_671063 ) ) ( not ( = ?auto_671062 ?auto_671064 ) ) ( not ( = ?auto_671063 ?auto_671064 ) ) ( ON ?auto_671062 ?auto_671063 ) ( ON ?auto_671061 ?auto_671062 ) ( ON ?auto_671060 ?auto_671061 ) ( ON ?auto_671059 ?auto_671060 ) ( ON ?auto_671058 ?auto_671059 ) ( ON ?auto_671057 ?auto_671058 ) ( ON ?auto_671056 ?auto_671057 ) ( ON ?auto_671055 ?auto_671056 ) ( ON ?auto_671054 ?auto_671055 ) ( ON ?auto_671053 ?auto_671054 ) ( ON ?auto_671052 ?auto_671053 ) ( CLEAR ?auto_671050 ) ( ON ?auto_671051 ?auto_671052 ) ( CLEAR ?auto_671051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_671048 ?auto_671049 ?auto_671050 ?auto_671051 )
      ( MAKE-16PILE ?auto_671048 ?auto_671049 ?auto_671050 ?auto_671051 ?auto_671052 ?auto_671053 ?auto_671054 ?auto_671055 ?auto_671056 ?auto_671057 ?auto_671058 ?auto_671059 ?auto_671060 ?auto_671061 ?auto_671062 ?auto_671063 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_671114 - BLOCK
      ?auto_671115 - BLOCK
      ?auto_671116 - BLOCK
      ?auto_671117 - BLOCK
      ?auto_671118 - BLOCK
      ?auto_671119 - BLOCK
      ?auto_671120 - BLOCK
      ?auto_671121 - BLOCK
      ?auto_671122 - BLOCK
      ?auto_671123 - BLOCK
      ?auto_671124 - BLOCK
      ?auto_671125 - BLOCK
      ?auto_671126 - BLOCK
      ?auto_671127 - BLOCK
      ?auto_671128 - BLOCK
      ?auto_671129 - BLOCK
    )
    :vars
    (
      ?auto_671130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671129 ?auto_671130 ) ( ON-TABLE ?auto_671114 ) ( ON ?auto_671115 ?auto_671114 ) ( not ( = ?auto_671114 ?auto_671115 ) ) ( not ( = ?auto_671114 ?auto_671116 ) ) ( not ( = ?auto_671114 ?auto_671117 ) ) ( not ( = ?auto_671114 ?auto_671118 ) ) ( not ( = ?auto_671114 ?auto_671119 ) ) ( not ( = ?auto_671114 ?auto_671120 ) ) ( not ( = ?auto_671114 ?auto_671121 ) ) ( not ( = ?auto_671114 ?auto_671122 ) ) ( not ( = ?auto_671114 ?auto_671123 ) ) ( not ( = ?auto_671114 ?auto_671124 ) ) ( not ( = ?auto_671114 ?auto_671125 ) ) ( not ( = ?auto_671114 ?auto_671126 ) ) ( not ( = ?auto_671114 ?auto_671127 ) ) ( not ( = ?auto_671114 ?auto_671128 ) ) ( not ( = ?auto_671114 ?auto_671129 ) ) ( not ( = ?auto_671114 ?auto_671130 ) ) ( not ( = ?auto_671115 ?auto_671116 ) ) ( not ( = ?auto_671115 ?auto_671117 ) ) ( not ( = ?auto_671115 ?auto_671118 ) ) ( not ( = ?auto_671115 ?auto_671119 ) ) ( not ( = ?auto_671115 ?auto_671120 ) ) ( not ( = ?auto_671115 ?auto_671121 ) ) ( not ( = ?auto_671115 ?auto_671122 ) ) ( not ( = ?auto_671115 ?auto_671123 ) ) ( not ( = ?auto_671115 ?auto_671124 ) ) ( not ( = ?auto_671115 ?auto_671125 ) ) ( not ( = ?auto_671115 ?auto_671126 ) ) ( not ( = ?auto_671115 ?auto_671127 ) ) ( not ( = ?auto_671115 ?auto_671128 ) ) ( not ( = ?auto_671115 ?auto_671129 ) ) ( not ( = ?auto_671115 ?auto_671130 ) ) ( not ( = ?auto_671116 ?auto_671117 ) ) ( not ( = ?auto_671116 ?auto_671118 ) ) ( not ( = ?auto_671116 ?auto_671119 ) ) ( not ( = ?auto_671116 ?auto_671120 ) ) ( not ( = ?auto_671116 ?auto_671121 ) ) ( not ( = ?auto_671116 ?auto_671122 ) ) ( not ( = ?auto_671116 ?auto_671123 ) ) ( not ( = ?auto_671116 ?auto_671124 ) ) ( not ( = ?auto_671116 ?auto_671125 ) ) ( not ( = ?auto_671116 ?auto_671126 ) ) ( not ( = ?auto_671116 ?auto_671127 ) ) ( not ( = ?auto_671116 ?auto_671128 ) ) ( not ( = ?auto_671116 ?auto_671129 ) ) ( not ( = ?auto_671116 ?auto_671130 ) ) ( not ( = ?auto_671117 ?auto_671118 ) ) ( not ( = ?auto_671117 ?auto_671119 ) ) ( not ( = ?auto_671117 ?auto_671120 ) ) ( not ( = ?auto_671117 ?auto_671121 ) ) ( not ( = ?auto_671117 ?auto_671122 ) ) ( not ( = ?auto_671117 ?auto_671123 ) ) ( not ( = ?auto_671117 ?auto_671124 ) ) ( not ( = ?auto_671117 ?auto_671125 ) ) ( not ( = ?auto_671117 ?auto_671126 ) ) ( not ( = ?auto_671117 ?auto_671127 ) ) ( not ( = ?auto_671117 ?auto_671128 ) ) ( not ( = ?auto_671117 ?auto_671129 ) ) ( not ( = ?auto_671117 ?auto_671130 ) ) ( not ( = ?auto_671118 ?auto_671119 ) ) ( not ( = ?auto_671118 ?auto_671120 ) ) ( not ( = ?auto_671118 ?auto_671121 ) ) ( not ( = ?auto_671118 ?auto_671122 ) ) ( not ( = ?auto_671118 ?auto_671123 ) ) ( not ( = ?auto_671118 ?auto_671124 ) ) ( not ( = ?auto_671118 ?auto_671125 ) ) ( not ( = ?auto_671118 ?auto_671126 ) ) ( not ( = ?auto_671118 ?auto_671127 ) ) ( not ( = ?auto_671118 ?auto_671128 ) ) ( not ( = ?auto_671118 ?auto_671129 ) ) ( not ( = ?auto_671118 ?auto_671130 ) ) ( not ( = ?auto_671119 ?auto_671120 ) ) ( not ( = ?auto_671119 ?auto_671121 ) ) ( not ( = ?auto_671119 ?auto_671122 ) ) ( not ( = ?auto_671119 ?auto_671123 ) ) ( not ( = ?auto_671119 ?auto_671124 ) ) ( not ( = ?auto_671119 ?auto_671125 ) ) ( not ( = ?auto_671119 ?auto_671126 ) ) ( not ( = ?auto_671119 ?auto_671127 ) ) ( not ( = ?auto_671119 ?auto_671128 ) ) ( not ( = ?auto_671119 ?auto_671129 ) ) ( not ( = ?auto_671119 ?auto_671130 ) ) ( not ( = ?auto_671120 ?auto_671121 ) ) ( not ( = ?auto_671120 ?auto_671122 ) ) ( not ( = ?auto_671120 ?auto_671123 ) ) ( not ( = ?auto_671120 ?auto_671124 ) ) ( not ( = ?auto_671120 ?auto_671125 ) ) ( not ( = ?auto_671120 ?auto_671126 ) ) ( not ( = ?auto_671120 ?auto_671127 ) ) ( not ( = ?auto_671120 ?auto_671128 ) ) ( not ( = ?auto_671120 ?auto_671129 ) ) ( not ( = ?auto_671120 ?auto_671130 ) ) ( not ( = ?auto_671121 ?auto_671122 ) ) ( not ( = ?auto_671121 ?auto_671123 ) ) ( not ( = ?auto_671121 ?auto_671124 ) ) ( not ( = ?auto_671121 ?auto_671125 ) ) ( not ( = ?auto_671121 ?auto_671126 ) ) ( not ( = ?auto_671121 ?auto_671127 ) ) ( not ( = ?auto_671121 ?auto_671128 ) ) ( not ( = ?auto_671121 ?auto_671129 ) ) ( not ( = ?auto_671121 ?auto_671130 ) ) ( not ( = ?auto_671122 ?auto_671123 ) ) ( not ( = ?auto_671122 ?auto_671124 ) ) ( not ( = ?auto_671122 ?auto_671125 ) ) ( not ( = ?auto_671122 ?auto_671126 ) ) ( not ( = ?auto_671122 ?auto_671127 ) ) ( not ( = ?auto_671122 ?auto_671128 ) ) ( not ( = ?auto_671122 ?auto_671129 ) ) ( not ( = ?auto_671122 ?auto_671130 ) ) ( not ( = ?auto_671123 ?auto_671124 ) ) ( not ( = ?auto_671123 ?auto_671125 ) ) ( not ( = ?auto_671123 ?auto_671126 ) ) ( not ( = ?auto_671123 ?auto_671127 ) ) ( not ( = ?auto_671123 ?auto_671128 ) ) ( not ( = ?auto_671123 ?auto_671129 ) ) ( not ( = ?auto_671123 ?auto_671130 ) ) ( not ( = ?auto_671124 ?auto_671125 ) ) ( not ( = ?auto_671124 ?auto_671126 ) ) ( not ( = ?auto_671124 ?auto_671127 ) ) ( not ( = ?auto_671124 ?auto_671128 ) ) ( not ( = ?auto_671124 ?auto_671129 ) ) ( not ( = ?auto_671124 ?auto_671130 ) ) ( not ( = ?auto_671125 ?auto_671126 ) ) ( not ( = ?auto_671125 ?auto_671127 ) ) ( not ( = ?auto_671125 ?auto_671128 ) ) ( not ( = ?auto_671125 ?auto_671129 ) ) ( not ( = ?auto_671125 ?auto_671130 ) ) ( not ( = ?auto_671126 ?auto_671127 ) ) ( not ( = ?auto_671126 ?auto_671128 ) ) ( not ( = ?auto_671126 ?auto_671129 ) ) ( not ( = ?auto_671126 ?auto_671130 ) ) ( not ( = ?auto_671127 ?auto_671128 ) ) ( not ( = ?auto_671127 ?auto_671129 ) ) ( not ( = ?auto_671127 ?auto_671130 ) ) ( not ( = ?auto_671128 ?auto_671129 ) ) ( not ( = ?auto_671128 ?auto_671130 ) ) ( not ( = ?auto_671129 ?auto_671130 ) ) ( ON ?auto_671128 ?auto_671129 ) ( ON ?auto_671127 ?auto_671128 ) ( ON ?auto_671126 ?auto_671127 ) ( ON ?auto_671125 ?auto_671126 ) ( ON ?auto_671124 ?auto_671125 ) ( ON ?auto_671123 ?auto_671124 ) ( ON ?auto_671122 ?auto_671123 ) ( ON ?auto_671121 ?auto_671122 ) ( ON ?auto_671120 ?auto_671121 ) ( ON ?auto_671119 ?auto_671120 ) ( ON ?auto_671118 ?auto_671119 ) ( ON ?auto_671117 ?auto_671118 ) ( CLEAR ?auto_671115 ) ( ON ?auto_671116 ?auto_671117 ) ( CLEAR ?auto_671116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_671114 ?auto_671115 ?auto_671116 )
      ( MAKE-16PILE ?auto_671114 ?auto_671115 ?auto_671116 ?auto_671117 ?auto_671118 ?auto_671119 ?auto_671120 ?auto_671121 ?auto_671122 ?auto_671123 ?auto_671124 ?auto_671125 ?auto_671126 ?auto_671127 ?auto_671128 ?auto_671129 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_671180 - BLOCK
      ?auto_671181 - BLOCK
      ?auto_671182 - BLOCK
      ?auto_671183 - BLOCK
      ?auto_671184 - BLOCK
      ?auto_671185 - BLOCK
      ?auto_671186 - BLOCK
      ?auto_671187 - BLOCK
      ?auto_671188 - BLOCK
      ?auto_671189 - BLOCK
      ?auto_671190 - BLOCK
      ?auto_671191 - BLOCK
      ?auto_671192 - BLOCK
      ?auto_671193 - BLOCK
      ?auto_671194 - BLOCK
      ?auto_671195 - BLOCK
    )
    :vars
    (
      ?auto_671196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671195 ?auto_671196 ) ( ON-TABLE ?auto_671180 ) ( not ( = ?auto_671180 ?auto_671181 ) ) ( not ( = ?auto_671180 ?auto_671182 ) ) ( not ( = ?auto_671180 ?auto_671183 ) ) ( not ( = ?auto_671180 ?auto_671184 ) ) ( not ( = ?auto_671180 ?auto_671185 ) ) ( not ( = ?auto_671180 ?auto_671186 ) ) ( not ( = ?auto_671180 ?auto_671187 ) ) ( not ( = ?auto_671180 ?auto_671188 ) ) ( not ( = ?auto_671180 ?auto_671189 ) ) ( not ( = ?auto_671180 ?auto_671190 ) ) ( not ( = ?auto_671180 ?auto_671191 ) ) ( not ( = ?auto_671180 ?auto_671192 ) ) ( not ( = ?auto_671180 ?auto_671193 ) ) ( not ( = ?auto_671180 ?auto_671194 ) ) ( not ( = ?auto_671180 ?auto_671195 ) ) ( not ( = ?auto_671180 ?auto_671196 ) ) ( not ( = ?auto_671181 ?auto_671182 ) ) ( not ( = ?auto_671181 ?auto_671183 ) ) ( not ( = ?auto_671181 ?auto_671184 ) ) ( not ( = ?auto_671181 ?auto_671185 ) ) ( not ( = ?auto_671181 ?auto_671186 ) ) ( not ( = ?auto_671181 ?auto_671187 ) ) ( not ( = ?auto_671181 ?auto_671188 ) ) ( not ( = ?auto_671181 ?auto_671189 ) ) ( not ( = ?auto_671181 ?auto_671190 ) ) ( not ( = ?auto_671181 ?auto_671191 ) ) ( not ( = ?auto_671181 ?auto_671192 ) ) ( not ( = ?auto_671181 ?auto_671193 ) ) ( not ( = ?auto_671181 ?auto_671194 ) ) ( not ( = ?auto_671181 ?auto_671195 ) ) ( not ( = ?auto_671181 ?auto_671196 ) ) ( not ( = ?auto_671182 ?auto_671183 ) ) ( not ( = ?auto_671182 ?auto_671184 ) ) ( not ( = ?auto_671182 ?auto_671185 ) ) ( not ( = ?auto_671182 ?auto_671186 ) ) ( not ( = ?auto_671182 ?auto_671187 ) ) ( not ( = ?auto_671182 ?auto_671188 ) ) ( not ( = ?auto_671182 ?auto_671189 ) ) ( not ( = ?auto_671182 ?auto_671190 ) ) ( not ( = ?auto_671182 ?auto_671191 ) ) ( not ( = ?auto_671182 ?auto_671192 ) ) ( not ( = ?auto_671182 ?auto_671193 ) ) ( not ( = ?auto_671182 ?auto_671194 ) ) ( not ( = ?auto_671182 ?auto_671195 ) ) ( not ( = ?auto_671182 ?auto_671196 ) ) ( not ( = ?auto_671183 ?auto_671184 ) ) ( not ( = ?auto_671183 ?auto_671185 ) ) ( not ( = ?auto_671183 ?auto_671186 ) ) ( not ( = ?auto_671183 ?auto_671187 ) ) ( not ( = ?auto_671183 ?auto_671188 ) ) ( not ( = ?auto_671183 ?auto_671189 ) ) ( not ( = ?auto_671183 ?auto_671190 ) ) ( not ( = ?auto_671183 ?auto_671191 ) ) ( not ( = ?auto_671183 ?auto_671192 ) ) ( not ( = ?auto_671183 ?auto_671193 ) ) ( not ( = ?auto_671183 ?auto_671194 ) ) ( not ( = ?auto_671183 ?auto_671195 ) ) ( not ( = ?auto_671183 ?auto_671196 ) ) ( not ( = ?auto_671184 ?auto_671185 ) ) ( not ( = ?auto_671184 ?auto_671186 ) ) ( not ( = ?auto_671184 ?auto_671187 ) ) ( not ( = ?auto_671184 ?auto_671188 ) ) ( not ( = ?auto_671184 ?auto_671189 ) ) ( not ( = ?auto_671184 ?auto_671190 ) ) ( not ( = ?auto_671184 ?auto_671191 ) ) ( not ( = ?auto_671184 ?auto_671192 ) ) ( not ( = ?auto_671184 ?auto_671193 ) ) ( not ( = ?auto_671184 ?auto_671194 ) ) ( not ( = ?auto_671184 ?auto_671195 ) ) ( not ( = ?auto_671184 ?auto_671196 ) ) ( not ( = ?auto_671185 ?auto_671186 ) ) ( not ( = ?auto_671185 ?auto_671187 ) ) ( not ( = ?auto_671185 ?auto_671188 ) ) ( not ( = ?auto_671185 ?auto_671189 ) ) ( not ( = ?auto_671185 ?auto_671190 ) ) ( not ( = ?auto_671185 ?auto_671191 ) ) ( not ( = ?auto_671185 ?auto_671192 ) ) ( not ( = ?auto_671185 ?auto_671193 ) ) ( not ( = ?auto_671185 ?auto_671194 ) ) ( not ( = ?auto_671185 ?auto_671195 ) ) ( not ( = ?auto_671185 ?auto_671196 ) ) ( not ( = ?auto_671186 ?auto_671187 ) ) ( not ( = ?auto_671186 ?auto_671188 ) ) ( not ( = ?auto_671186 ?auto_671189 ) ) ( not ( = ?auto_671186 ?auto_671190 ) ) ( not ( = ?auto_671186 ?auto_671191 ) ) ( not ( = ?auto_671186 ?auto_671192 ) ) ( not ( = ?auto_671186 ?auto_671193 ) ) ( not ( = ?auto_671186 ?auto_671194 ) ) ( not ( = ?auto_671186 ?auto_671195 ) ) ( not ( = ?auto_671186 ?auto_671196 ) ) ( not ( = ?auto_671187 ?auto_671188 ) ) ( not ( = ?auto_671187 ?auto_671189 ) ) ( not ( = ?auto_671187 ?auto_671190 ) ) ( not ( = ?auto_671187 ?auto_671191 ) ) ( not ( = ?auto_671187 ?auto_671192 ) ) ( not ( = ?auto_671187 ?auto_671193 ) ) ( not ( = ?auto_671187 ?auto_671194 ) ) ( not ( = ?auto_671187 ?auto_671195 ) ) ( not ( = ?auto_671187 ?auto_671196 ) ) ( not ( = ?auto_671188 ?auto_671189 ) ) ( not ( = ?auto_671188 ?auto_671190 ) ) ( not ( = ?auto_671188 ?auto_671191 ) ) ( not ( = ?auto_671188 ?auto_671192 ) ) ( not ( = ?auto_671188 ?auto_671193 ) ) ( not ( = ?auto_671188 ?auto_671194 ) ) ( not ( = ?auto_671188 ?auto_671195 ) ) ( not ( = ?auto_671188 ?auto_671196 ) ) ( not ( = ?auto_671189 ?auto_671190 ) ) ( not ( = ?auto_671189 ?auto_671191 ) ) ( not ( = ?auto_671189 ?auto_671192 ) ) ( not ( = ?auto_671189 ?auto_671193 ) ) ( not ( = ?auto_671189 ?auto_671194 ) ) ( not ( = ?auto_671189 ?auto_671195 ) ) ( not ( = ?auto_671189 ?auto_671196 ) ) ( not ( = ?auto_671190 ?auto_671191 ) ) ( not ( = ?auto_671190 ?auto_671192 ) ) ( not ( = ?auto_671190 ?auto_671193 ) ) ( not ( = ?auto_671190 ?auto_671194 ) ) ( not ( = ?auto_671190 ?auto_671195 ) ) ( not ( = ?auto_671190 ?auto_671196 ) ) ( not ( = ?auto_671191 ?auto_671192 ) ) ( not ( = ?auto_671191 ?auto_671193 ) ) ( not ( = ?auto_671191 ?auto_671194 ) ) ( not ( = ?auto_671191 ?auto_671195 ) ) ( not ( = ?auto_671191 ?auto_671196 ) ) ( not ( = ?auto_671192 ?auto_671193 ) ) ( not ( = ?auto_671192 ?auto_671194 ) ) ( not ( = ?auto_671192 ?auto_671195 ) ) ( not ( = ?auto_671192 ?auto_671196 ) ) ( not ( = ?auto_671193 ?auto_671194 ) ) ( not ( = ?auto_671193 ?auto_671195 ) ) ( not ( = ?auto_671193 ?auto_671196 ) ) ( not ( = ?auto_671194 ?auto_671195 ) ) ( not ( = ?auto_671194 ?auto_671196 ) ) ( not ( = ?auto_671195 ?auto_671196 ) ) ( ON ?auto_671194 ?auto_671195 ) ( ON ?auto_671193 ?auto_671194 ) ( ON ?auto_671192 ?auto_671193 ) ( ON ?auto_671191 ?auto_671192 ) ( ON ?auto_671190 ?auto_671191 ) ( ON ?auto_671189 ?auto_671190 ) ( ON ?auto_671188 ?auto_671189 ) ( ON ?auto_671187 ?auto_671188 ) ( ON ?auto_671186 ?auto_671187 ) ( ON ?auto_671185 ?auto_671186 ) ( ON ?auto_671184 ?auto_671185 ) ( ON ?auto_671183 ?auto_671184 ) ( ON ?auto_671182 ?auto_671183 ) ( CLEAR ?auto_671180 ) ( ON ?auto_671181 ?auto_671182 ) ( CLEAR ?auto_671181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_671180 ?auto_671181 )
      ( MAKE-16PILE ?auto_671180 ?auto_671181 ?auto_671182 ?auto_671183 ?auto_671184 ?auto_671185 ?auto_671186 ?auto_671187 ?auto_671188 ?auto_671189 ?auto_671190 ?auto_671191 ?auto_671192 ?auto_671193 ?auto_671194 ?auto_671195 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_671246 - BLOCK
      ?auto_671247 - BLOCK
      ?auto_671248 - BLOCK
      ?auto_671249 - BLOCK
      ?auto_671250 - BLOCK
      ?auto_671251 - BLOCK
      ?auto_671252 - BLOCK
      ?auto_671253 - BLOCK
      ?auto_671254 - BLOCK
      ?auto_671255 - BLOCK
      ?auto_671256 - BLOCK
      ?auto_671257 - BLOCK
      ?auto_671258 - BLOCK
      ?auto_671259 - BLOCK
      ?auto_671260 - BLOCK
      ?auto_671261 - BLOCK
    )
    :vars
    (
      ?auto_671262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671261 ?auto_671262 ) ( not ( = ?auto_671246 ?auto_671247 ) ) ( not ( = ?auto_671246 ?auto_671248 ) ) ( not ( = ?auto_671246 ?auto_671249 ) ) ( not ( = ?auto_671246 ?auto_671250 ) ) ( not ( = ?auto_671246 ?auto_671251 ) ) ( not ( = ?auto_671246 ?auto_671252 ) ) ( not ( = ?auto_671246 ?auto_671253 ) ) ( not ( = ?auto_671246 ?auto_671254 ) ) ( not ( = ?auto_671246 ?auto_671255 ) ) ( not ( = ?auto_671246 ?auto_671256 ) ) ( not ( = ?auto_671246 ?auto_671257 ) ) ( not ( = ?auto_671246 ?auto_671258 ) ) ( not ( = ?auto_671246 ?auto_671259 ) ) ( not ( = ?auto_671246 ?auto_671260 ) ) ( not ( = ?auto_671246 ?auto_671261 ) ) ( not ( = ?auto_671246 ?auto_671262 ) ) ( not ( = ?auto_671247 ?auto_671248 ) ) ( not ( = ?auto_671247 ?auto_671249 ) ) ( not ( = ?auto_671247 ?auto_671250 ) ) ( not ( = ?auto_671247 ?auto_671251 ) ) ( not ( = ?auto_671247 ?auto_671252 ) ) ( not ( = ?auto_671247 ?auto_671253 ) ) ( not ( = ?auto_671247 ?auto_671254 ) ) ( not ( = ?auto_671247 ?auto_671255 ) ) ( not ( = ?auto_671247 ?auto_671256 ) ) ( not ( = ?auto_671247 ?auto_671257 ) ) ( not ( = ?auto_671247 ?auto_671258 ) ) ( not ( = ?auto_671247 ?auto_671259 ) ) ( not ( = ?auto_671247 ?auto_671260 ) ) ( not ( = ?auto_671247 ?auto_671261 ) ) ( not ( = ?auto_671247 ?auto_671262 ) ) ( not ( = ?auto_671248 ?auto_671249 ) ) ( not ( = ?auto_671248 ?auto_671250 ) ) ( not ( = ?auto_671248 ?auto_671251 ) ) ( not ( = ?auto_671248 ?auto_671252 ) ) ( not ( = ?auto_671248 ?auto_671253 ) ) ( not ( = ?auto_671248 ?auto_671254 ) ) ( not ( = ?auto_671248 ?auto_671255 ) ) ( not ( = ?auto_671248 ?auto_671256 ) ) ( not ( = ?auto_671248 ?auto_671257 ) ) ( not ( = ?auto_671248 ?auto_671258 ) ) ( not ( = ?auto_671248 ?auto_671259 ) ) ( not ( = ?auto_671248 ?auto_671260 ) ) ( not ( = ?auto_671248 ?auto_671261 ) ) ( not ( = ?auto_671248 ?auto_671262 ) ) ( not ( = ?auto_671249 ?auto_671250 ) ) ( not ( = ?auto_671249 ?auto_671251 ) ) ( not ( = ?auto_671249 ?auto_671252 ) ) ( not ( = ?auto_671249 ?auto_671253 ) ) ( not ( = ?auto_671249 ?auto_671254 ) ) ( not ( = ?auto_671249 ?auto_671255 ) ) ( not ( = ?auto_671249 ?auto_671256 ) ) ( not ( = ?auto_671249 ?auto_671257 ) ) ( not ( = ?auto_671249 ?auto_671258 ) ) ( not ( = ?auto_671249 ?auto_671259 ) ) ( not ( = ?auto_671249 ?auto_671260 ) ) ( not ( = ?auto_671249 ?auto_671261 ) ) ( not ( = ?auto_671249 ?auto_671262 ) ) ( not ( = ?auto_671250 ?auto_671251 ) ) ( not ( = ?auto_671250 ?auto_671252 ) ) ( not ( = ?auto_671250 ?auto_671253 ) ) ( not ( = ?auto_671250 ?auto_671254 ) ) ( not ( = ?auto_671250 ?auto_671255 ) ) ( not ( = ?auto_671250 ?auto_671256 ) ) ( not ( = ?auto_671250 ?auto_671257 ) ) ( not ( = ?auto_671250 ?auto_671258 ) ) ( not ( = ?auto_671250 ?auto_671259 ) ) ( not ( = ?auto_671250 ?auto_671260 ) ) ( not ( = ?auto_671250 ?auto_671261 ) ) ( not ( = ?auto_671250 ?auto_671262 ) ) ( not ( = ?auto_671251 ?auto_671252 ) ) ( not ( = ?auto_671251 ?auto_671253 ) ) ( not ( = ?auto_671251 ?auto_671254 ) ) ( not ( = ?auto_671251 ?auto_671255 ) ) ( not ( = ?auto_671251 ?auto_671256 ) ) ( not ( = ?auto_671251 ?auto_671257 ) ) ( not ( = ?auto_671251 ?auto_671258 ) ) ( not ( = ?auto_671251 ?auto_671259 ) ) ( not ( = ?auto_671251 ?auto_671260 ) ) ( not ( = ?auto_671251 ?auto_671261 ) ) ( not ( = ?auto_671251 ?auto_671262 ) ) ( not ( = ?auto_671252 ?auto_671253 ) ) ( not ( = ?auto_671252 ?auto_671254 ) ) ( not ( = ?auto_671252 ?auto_671255 ) ) ( not ( = ?auto_671252 ?auto_671256 ) ) ( not ( = ?auto_671252 ?auto_671257 ) ) ( not ( = ?auto_671252 ?auto_671258 ) ) ( not ( = ?auto_671252 ?auto_671259 ) ) ( not ( = ?auto_671252 ?auto_671260 ) ) ( not ( = ?auto_671252 ?auto_671261 ) ) ( not ( = ?auto_671252 ?auto_671262 ) ) ( not ( = ?auto_671253 ?auto_671254 ) ) ( not ( = ?auto_671253 ?auto_671255 ) ) ( not ( = ?auto_671253 ?auto_671256 ) ) ( not ( = ?auto_671253 ?auto_671257 ) ) ( not ( = ?auto_671253 ?auto_671258 ) ) ( not ( = ?auto_671253 ?auto_671259 ) ) ( not ( = ?auto_671253 ?auto_671260 ) ) ( not ( = ?auto_671253 ?auto_671261 ) ) ( not ( = ?auto_671253 ?auto_671262 ) ) ( not ( = ?auto_671254 ?auto_671255 ) ) ( not ( = ?auto_671254 ?auto_671256 ) ) ( not ( = ?auto_671254 ?auto_671257 ) ) ( not ( = ?auto_671254 ?auto_671258 ) ) ( not ( = ?auto_671254 ?auto_671259 ) ) ( not ( = ?auto_671254 ?auto_671260 ) ) ( not ( = ?auto_671254 ?auto_671261 ) ) ( not ( = ?auto_671254 ?auto_671262 ) ) ( not ( = ?auto_671255 ?auto_671256 ) ) ( not ( = ?auto_671255 ?auto_671257 ) ) ( not ( = ?auto_671255 ?auto_671258 ) ) ( not ( = ?auto_671255 ?auto_671259 ) ) ( not ( = ?auto_671255 ?auto_671260 ) ) ( not ( = ?auto_671255 ?auto_671261 ) ) ( not ( = ?auto_671255 ?auto_671262 ) ) ( not ( = ?auto_671256 ?auto_671257 ) ) ( not ( = ?auto_671256 ?auto_671258 ) ) ( not ( = ?auto_671256 ?auto_671259 ) ) ( not ( = ?auto_671256 ?auto_671260 ) ) ( not ( = ?auto_671256 ?auto_671261 ) ) ( not ( = ?auto_671256 ?auto_671262 ) ) ( not ( = ?auto_671257 ?auto_671258 ) ) ( not ( = ?auto_671257 ?auto_671259 ) ) ( not ( = ?auto_671257 ?auto_671260 ) ) ( not ( = ?auto_671257 ?auto_671261 ) ) ( not ( = ?auto_671257 ?auto_671262 ) ) ( not ( = ?auto_671258 ?auto_671259 ) ) ( not ( = ?auto_671258 ?auto_671260 ) ) ( not ( = ?auto_671258 ?auto_671261 ) ) ( not ( = ?auto_671258 ?auto_671262 ) ) ( not ( = ?auto_671259 ?auto_671260 ) ) ( not ( = ?auto_671259 ?auto_671261 ) ) ( not ( = ?auto_671259 ?auto_671262 ) ) ( not ( = ?auto_671260 ?auto_671261 ) ) ( not ( = ?auto_671260 ?auto_671262 ) ) ( not ( = ?auto_671261 ?auto_671262 ) ) ( ON ?auto_671260 ?auto_671261 ) ( ON ?auto_671259 ?auto_671260 ) ( ON ?auto_671258 ?auto_671259 ) ( ON ?auto_671257 ?auto_671258 ) ( ON ?auto_671256 ?auto_671257 ) ( ON ?auto_671255 ?auto_671256 ) ( ON ?auto_671254 ?auto_671255 ) ( ON ?auto_671253 ?auto_671254 ) ( ON ?auto_671252 ?auto_671253 ) ( ON ?auto_671251 ?auto_671252 ) ( ON ?auto_671250 ?auto_671251 ) ( ON ?auto_671249 ?auto_671250 ) ( ON ?auto_671248 ?auto_671249 ) ( ON ?auto_671247 ?auto_671248 ) ( ON ?auto_671246 ?auto_671247 ) ( CLEAR ?auto_671246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_671246 )
      ( MAKE-16PILE ?auto_671246 ?auto_671247 ?auto_671248 ?auto_671249 ?auto_671250 ?auto_671251 ?auto_671252 ?auto_671253 ?auto_671254 ?auto_671255 ?auto_671256 ?auto_671257 ?auto_671258 ?auto_671259 ?auto_671260 ?auto_671261 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671313 - BLOCK
      ?auto_671314 - BLOCK
      ?auto_671315 - BLOCK
      ?auto_671316 - BLOCK
      ?auto_671317 - BLOCK
      ?auto_671318 - BLOCK
      ?auto_671319 - BLOCK
      ?auto_671320 - BLOCK
      ?auto_671321 - BLOCK
      ?auto_671322 - BLOCK
      ?auto_671323 - BLOCK
      ?auto_671324 - BLOCK
      ?auto_671325 - BLOCK
      ?auto_671326 - BLOCK
      ?auto_671327 - BLOCK
      ?auto_671328 - BLOCK
      ?auto_671329 - BLOCK
    )
    :vars
    (
      ?auto_671330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_671328 ) ( ON ?auto_671329 ?auto_671330 ) ( CLEAR ?auto_671329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_671313 ) ( ON ?auto_671314 ?auto_671313 ) ( ON ?auto_671315 ?auto_671314 ) ( ON ?auto_671316 ?auto_671315 ) ( ON ?auto_671317 ?auto_671316 ) ( ON ?auto_671318 ?auto_671317 ) ( ON ?auto_671319 ?auto_671318 ) ( ON ?auto_671320 ?auto_671319 ) ( ON ?auto_671321 ?auto_671320 ) ( ON ?auto_671322 ?auto_671321 ) ( ON ?auto_671323 ?auto_671322 ) ( ON ?auto_671324 ?auto_671323 ) ( ON ?auto_671325 ?auto_671324 ) ( ON ?auto_671326 ?auto_671325 ) ( ON ?auto_671327 ?auto_671326 ) ( ON ?auto_671328 ?auto_671327 ) ( not ( = ?auto_671313 ?auto_671314 ) ) ( not ( = ?auto_671313 ?auto_671315 ) ) ( not ( = ?auto_671313 ?auto_671316 ) ) ( not ( = ?auto_671313 ?auto_671317 ) ) ( not ( = ?auto_671313 ?auto_671318 ) ) ( not ( = ?auto_671313 ?auto_671319 ) ) ( not ( = ?auto_671313 ?auto_671320 ) ) ( not ( = ?auto_671313 ?auto_671321 ) ) ( not ( = ?auto_671313 ?auto_671322 ) ) ( not ( = ?auto_671313 ?auto_671323 ) ) ( not ( = ?auto_671313 ?auto_671324 ) ) ( not ( = ?auto_671313 ?auto_671325 ) ) ( not ( = ?auto_671313 ?auto_671326 ) ) ( not ( = ?auto_671313 ?auto_671327 ) ) ( not ( = ?auto_671313 ?auto_671328 ) ) ( not ( = ?auto_671313 ?auto_671329 ) ) ( not ( = ?auto_671313 ?auto_671330 ) ) ( not ( = ?auto_671314 ?auto_671315 ) ) ( not ( = ?auto_671314 ?auto_671316 ) ) ( not ( = ?auto_671314 ?auto_671317 ) ) ( not ( = ?auto_671314 ?auto_671318 ) ) ( not ( = ?auto_671314 ?auto_671319 ) ) ( not ( = ?auto_671314 ?auto_671320 ) ) ( not ( = ?auto_671314 ?auto_671321 ) ) ( not ( = ?auto_671314 ?auto_671322 ) ) ( not ( = ?auto_671314 ?auto_671323 ) ) ( not ( = ?auto_671314 ?auto_671324 ) ) ( not ( = ?auto_671314 ?auto_671325 ) ) ( not ( = ?auto_671314 ?auto_671326 ) ) ( not ( = ?auto_671314 ?auto_671327 ) ) ( not ( = ?auto_671314 ?auto_671328 ) ) ( not ( = ?auto_671314 ?auto_671329 ) ) ( not ( = ?auto_671314 ?auto_671330 ) ) ( not ( = ?auto_671315 ?auto_671316 ) ) ( not ( = ?auto_671315 ?auto_671317 ) ) ( not ( = ?auto_671315 ?auto_671318 ) ) ( not ( = ?auto_671315 ?auto_671319 ) ) ( not ( = ?auto_671315 ?auto_671320 ) ) ( not ( = ?auto_671315 ?auto_671321 ) ) ( not ( = ?auto_671315 ?auto_671322 ) ) ( not ( = ?auto_671315 ?auto_671323 ) ) ( not ( = ?auto_671315 ?auto_671324 ) ) ( not ( = ?auto_671315 ?auto_671325 ) ) ( not ( = ?auto_671315 ?auto_671326 ) ) ( not ( = ?auto_671315 ?auto_671327 ) ) ( not ( = ?auto_671315 ?auto_671328 ) ) ( not ( = ?auto_671315 ?auto_671329 ) ) ( not ( = ?auto_671315 ?auto_671330 ) ) ( not ( = ?auto_671316 ?auto_671317 ) ) ( not ( = ?auto_671316 ?auto_671318 ) ) ( not ( = ?auto_671316 ?auto_671319 ) ) ( not ( = ?auto_671316 ?auto_671320 ) ) ( not ( = ?auto_671316 ?auto_671321 ) ) ( not ( = ?auto_671316 ?auto_671322 ) ) ( not ( = ?auto_671316 ?auto_671323 ) ) ( not ( = ?auto_671316 ?auto_671324 ) ) ( not ( = ?auto_671316 ?auto_671325 ) ) ( not ( = ?auto_671316 ?auto_671326 ) ) ( not ( = ?auto_671316 ?auto_671327 ) ) ( not ( = ?auto_671316 ?auto_671328 ) ) ( not ( = ?auto_671316 ?auto_671329 ) ) ( not ( = ?auto_671316 ?auto_671330 ) ) ( not ( = ?auto_671317 ?auto_671318 ) ) ( not ( = ?auto_671317 ?auto_671319 ) ) ( not ( = ?auto_671317 ?auto_671320 ) ) ( not ( = ?auto_671317 ?auto_671321 ) ) ( not ( = ?auto_671317 ?auto_671322 ) ) ( not ( = ?auto_671317 ?auto_671323 ) ) ( not ( = ?auto_671317 ?auto_671324 ) ) ( not ( = ?auto_671317 ?auto_671325 ) ) ( not ( = ?auto_671317 ?auto_671326 ) ) ( not ( = ?auto_671317 ?auto_671327 ) ) ( not ( = ?auto_671317 ?auto_671328 ) ) ( not ( = ?auto_671317 ?auto_671329 ) ) ( not ( = ?auto_671317 ?auto_671330 ) ) ( not ( = ?auto_671318 ?auto_671319 ) ) ( not ( = ?auto_671318 ?auto_671320 ) ) ( not ( = ?auto_671318 ?auto_671321 ) ) ( not ( = ?auto_671318 ?auto_671322 ) ) ( not ( = ?auto_671318 ?auto_671323 ) ) ( not ( = ?auto_671318 ?auto_671324 ) ) ( not ( = ?auto_671318 ?auto_671325 ) ) ( not ( = ?auto_671318 ?auto_671326 ) ) ( not ( = ?auto_671318 ?auto_671327 ) ) ( not ( = ?auto_671318 ?auto_671328 ) ) ( not ( = ?auto_671318 ?auto_671329 ) ) ( not ( = ?auto_671318 ?auto_671330 ) ) ( not ( = ?auto_671319 ?auto_671320 ) ) ( not ( = ?auto_671319 ?auto_671321 ) ) ( not ( = ?auto_671319 ?auto_671322 ) ) ( not ( = ?auto_671319 ?auto_671323 ) ) ( not ( = ?auto_671319 ?auto_671324 ) ) ( not ( = ?auto_671319 ?auto_671325 ) ) ( not ( = ?auto_671319 ?auto_671326 ) ) ( not ( = ?auto_671319 ?auto_671327 ) ) ( not ( = ?auto_671319 ?auto_671328 ) ) ( not ( = ?auto_671319 ?auto_671329 ) ) ( not ( = ?auto_671319 ?auto_671330 ) ) ( not ( = ?auto_671320 ?auto_671321 ) ) ( not ( = ?auto_671320 ?auto_671322 ) ) ( not ( = ?auto_671320 ?auto_671323 ) ) ( not ( = ?auto_671320 ?auto_671324 ) ) ( not ( = ?auto_671320 ?auto_671325 ) ) ( not ( = ?auto_671320 ?auto_671326 ) ) ( not ( = ?auto_671320 ?auto_671327 ) ) ( not ( = ?auto_671320 ?auto_671328 ) ) ( not ( = ?auto_671320 ?auto_671329 ) ) ( not ( = ?auto_671320 ?auto_671330 ) ) ( not ( = ?auto_671321 ?auto_671322 ) ) ( not ( = ?auto_671321 ?auto_671323 ) ) ( not ( = ?auto_671321 ?auto_671324 ) ) ( not ( = ?auto_671321 ?auto_671325 ) ) ( not ( = ?auto_671321 ?auto_671326 ) ) ( not ( = ?auto_671321 ?auto_671327 ) ) ( not ( = ?auto_671321 ?auto_671328 ) ) ( not ( = ?auto_671321 ?auto_671329 ) ) ( not ( = ?auto_671321 ?auto_671330 ) ) ( not ( = ?auto_671322 ?auto_671323 ) ) ( not ( = ?auto_671322 ?auto_671324 ) ) ( not ( = ?auto_671322 ?auto_671325 ) ) ( not ( = ?auto_671322 ?auto_671326 ) ) ( not ( = ?auto_671322 ?auto_671327 ) ) ( not ( = ?auto_671322 ?auto_671328 ) ) ( not ( = ?auto_671322 ?auto_671329 ) ) ( not ( = ?auto_671322 ?auto_671330 ) ) ( not ( = ?auto_671323 ?auto_671324 ) ) ( not ( = ?auto_671323 ?auto_671325 ) ) ( not ( = ?auto_671323 ?auto_671326 ) ) ( not ( = ?auto_671323 ?auto_671327 ) ) ( not ( = ?auto_671323 ?auto_671328 ) ) ( not ( = ?auto_671323 ?auto_671329 ) ) ( not ( = ?auto_671323 ?auto_671330 ) ) ( not ( = ?auto_671324 ?auto_671325 ) ) ( not ( = ?auto_671324 ?auto_671326 ) ) ( not ( = ?auto_671324 ?auto_671327 ) ) ( not ( = ?auto_671324 ?auto_671328 ) ) ( not ( = ?auto_671324 ?auto_671329 ) ) ( not ( = ?auto_671324 ?auto_671330 ) ) ( not ( = ?auto_671325 ?auto_671326 ) ) ( not ( = ?auto_671325 ?auto_671327 ) ) ( not ( = ?auto_671325 ?auto_671328 ) ) ( not ( = ?auto_671325 ?auto_671329 ) ) ( not ( = ?auto_671325 ?auto_671330 ) ) ( not ( = ?auto_671326 ?auto_671327 ) ) ( not ( = ?auto_671326 ?auto_671328 ) ) ( not ( = ?auto_671326 ?auto_671329 ) ) ( not ( = ?auto_671326 ?auto_671330 ) ) ( not ( = ?auto_671327 ?auto_671328 ) ) ( not ( = ?auto_671327 ?auto_671329 ) ) ( not ( = ?auto_671327 ?auto_671330 ) ) ( not ( = ?auto_671328 ?auto_671329 ) ) ( not ( = ?auto_671328 ?auto_671330 ) ) ( not ( = ?auto_671329 ?auto_671330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_671329 ?auto_671330 )
      ( !STACK ?auto_671329 ?auto_671328 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671348 - BLOCK
      ?auto_671349 - BLOCK
      ?auto_671350 - BLOCK
      ?auto_671351 - BLOCK
      ?auto_671352 - BLOCK
      ?auto_671353 - BLOCK
      ?auto_671354 - BLOCK
      ?auto_671355 - BLOCK
      ?auto_671356 - BLOCK
      ?auto_671357 - BLOCK
      ?auto_671358 - BLOCK
      ?auto_671359 - BLOCK
      ?auto_671360 - BLOCK
      ?auto_671361 - BLOCK
      ?auto_671362 - BLOCK
      ?auto_671363 - BLOCK
      ?auto_671364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_671363 ) ( ON-TABLE ?auto_671364 ) ( CLEAR ?auto_671364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_671348 ) ( ON ?auto_671349 ?auto_671348 ) ( ON ?auto_671350 ?auto_671349 ) ( ON ?auto_671351 ?auto_671350 ) ( ON ?auto_671352 ?auto_671351 ) ( ON ?auto_671353 ?auto_671352 ) ( ON ?auto_671354 ?auto_671353 ) ( ON ?auto_671355 ?auto_671354 ) ( ON ?auto_671356 ?auto_671355 ) ( ON ?auto_671357 ?auto_671356 ) ( ON ?auto_671358 ?auto_671357 ) ( ON ?auto_671359 ?auto_671358 ) ( ON ?auto_671360 ?auto_671359 ) ( ON ?auto_671361 ?auto_671360 ) ( ON ?auto_671362 ?auto_671361 ) ( ON ?auto_671363 ?auto_671362 ) ( not ( = ?auto_671348 ?auto_671349 ) ) ( not ( = ?auto_671348 ?auto_671350 ) ) ( not ( = ?auto_671348 ?auto_671351 ) ) ( not ( = ?auto_671348 ?auto_671352 ) ) ( not ( = ?auto_671348 ?auto_671353 ) ) ( not ( = ?auto_671348 ?auto_671354 ) ) ( not ( = ?auto_671348 ?auto_671355 ) ) ( not ( = ?auto_671348 ?auto_671356 ) ) ( not ( = ?auto_671348 ?auto_671357 ) ) ( not ( = ?auto_671348 ?auto_671358 ) ) ( not ( = ?auto_671348 ?auto_671359 ) ) ( not ( = ?auto_671348 ?auto_671360 ) ) ( not ( = ?auto_671348 ?auto_671361 ) ) ( not ( = ?auto_671348 ?auto_671362 ) ) ( not ( = ?auto_671348 ?auto_671363 ) ) ( not ( = ?auto_671348 ?auto_671364 ) ) ( not ( = ?auto_671349 ?auto_671350 ) ) ( not ( = ?auto_671349 ?auto_671351 ) ) ( not ( = ?auto_671349 ?auto_671352 ) ) ( not ( = ?auto_671349 ?auto_671353 ) ) ( not ( = ?auto_671349 ?auto_671354 ) ) ( not ( = ?auto_671349 ?auto_671355 ) ) ( not ( = ?auto_671349 ?auto_671356 ) ) ( not ( = ?auto_671349 ?auto_671357 ) ) ( not ( = ?auto_671349 ?auto_671358 ) ) ( not ( = ?auto_671349 ?auto_671359 ) ) ( not ( = ?auto_671349 ?auto_671360 ) ) ( not ( = ?auto_671349 ?auto_671361 ) ) ( not ( = ?auto_671349 ?auto_671362 ) ) ( not ( = ?auto_671349 ?auto_671363 ) ) ( not ( = ?auto_671349 ?auto_671364 ) ) ( not ( = ?auto_671350 ?auto_671351 ) ) ( not ( = ?auto_671350 ?auto_671352 ) ) ( not ( = ?auto_671350 ?auto_671353 ) ) ( not ( = ?auto_671350 ?auto_671354 ) ) ( not ( = ?auto_671350 ?auto_671355 ) ) ( not ( = ?auto_671350 ?auto_671356 ) ) ( not ( = ?auto_671350 ?auto_671357 ) ) ( not ( = ?auto_671350 ?auto_671358 ) ) ( not ( = ?auto_671350 ?auto_671359 ) ) ( not ( = ?auto_671350 ?auto_671360 ) ) ( not ( = ?auto_671350 ?auto_671361 ) ) ( not ( = ?auto_671350 ?auto_671362 ) ) ( not ( = ?auto_671350 ?auto_671363 ) ) ( not ( = ?auto_671350 ?auto_671364 ) ) ( not ( = ?auto_671351 ?auto_671352 ) ) ( not ( = ?auto_671351 ?auto_671353 ) ) ( not ( = ?auto_671351 ?auto_671354 ) ) ( not ( = ?auto_671351 ?auto_671355 ) ) ( not ( = ?auto_671351 ?auto_671356 ) ) ( not ( = ?auto_671351 ?auto_671357 ) ) ( not ( = ?auto_671351 ?auto_671358 ) ) ( not ( = ?auto_671351 ?auto_671359 ) ) ( not ( = ?auto_671351 ?auto_671360 ) ) ( not ( = ?auto_671351 ?auto_671361 ) ) ( not ( = ?auto_671351 ?auto_671362 ) ) ( not ( = ?auto_671351 ?auto_671363 ) ) ( not ( = ?auto_671351 ?auto_671364 ) ) ( not ( = ?auto_671352 ?auto_671353 ) ) ( not ( = ?auto_671352 ?auto_671354 ) ) ( not ( = ?auto_671352 ?auto_671355 ) ) ( not ( = ?auto_671352 ?auto_671356 ) ) ( not ( = ?auto_671352 ?auto_671357 ) ) ( not ( = ?auto_671352 ?auto_671358 ) ) ( not ( = ?auto_671352 ?auto_671359 ) ) ( not ( = ?auto_671352 ?auto_671360 ) ) ( not ( = ?auto_671352 ?auto_671361 ) ) ( not ( = ?auto_671352 ?auto_671362 ) ) ( not ( = ?auto_671352 ?auto_671363 ) ) ( not ( = ?auto_671352 ?auto_671364 ) ) ( not ( = ?auto_671353 ?auto_671354 ) ) ( not ( = ?auto_671353 ?auto_671355 ) ) ( not ( = ?auto_671353 ?auto_671356 ) ) ( not ( = ?auto_671353 ?auto_671357 ) ) ( not ( = ?auto_671353 ?auto_671358 ) ) ( not ( = ?auto_671353 ?auto_671359 ) ) ( not ( = ?auto_671353 ?auto_671360 ) ) ( not ( = ?auto_671353 ?auto_671361 ) ) ( not ( = ?auto_671353 ?auto_671362 ) ) ( not ( = ?auto_671353 ?auto_671363 ) ) ( not ( = ?auto_671353 ?auto_671364 ) ) ( not ( = ?auto_671354 ?auto_671355 ) ) ( not ( = ?auto_671354 ?auto_671356 ) ) ( not ( = ?auto_671354 ?auto_671357 ) ) ( not ( = ?auto_671354 ?auto_671358 ) ) ( not ( = ?auto_671354 ?auto_671359 ) ) ( not ( = ?auto_671354 ?auto_671360 ) ) ( not ( = ?auto_671354 ?auto_671361 ) ) ( not ( = ?auto_671354 ?auto_671362 ) ) ( not ( = ?auto_671354 ?auto_671363 ) ) ( not ( = ?auto_671354 ?auto_671364 ) ) ( not ( = ?auto_671355 ?auto_671356 ) ) ( not ( = ?auto_671355 ?auto_671357 ) ) ( not ( = ?auto_671355 ?auto_671358 ) ) ( not ( = ?auto_671355 ?auto_671359 ) ) ( not ( = ?auto_671355 ?auto_671360 ) ) ( not ( = ?auto_671355 ?auto_671361 ) ) ( not ( = ?auto_671355 ?auto_671362 ) ) ( not ( = ?auto_671355 ?auto_671363 ) ) ( not ( = ?auto_671355 ?auto_671364 ) ) ( not ( = ?auto_671356 ?auto_671357 ) ) ( not ( = ?auto_671356 ?auto_671358 ) ) ( not ( = ?auto_671356 ?auto_671359 ) ) ( not ( = ?auto_671356 ?auto_671360 ) ) ( not ( = ?auto_671356 ?auto_671361 ) ) ( not ( = ?auto_671356 ?auto_671362 ) ) ( not ( = ?auto_671356 ?auto_671363 ) ) ( not ( = ?auto_671356 ?auto_671364 ) ) ( not ( = ?auto_671357 ?auto_671358 ) ) ( not ( = ?auto_671357 ?auto_671359 ) ) ( not ( = ?auto_671357 ?auto_671360 ) ) ( not ( = ?auto_671357 ?auto_671361 ) ) ( not ( = ?auto_671357 ?auto_671362 ) ) ( not ( = ?auto_671357 ?auto_671363 ) ) ( not ( = ?auto_671357 ?auto_671364 ) ) ( not ( = ?auto_671358 ?auto_671359 ) ) ( not ( = ?auto_671358 ?auto_671360 ) ) ( not ( = ?auto_671358 ?auto_671361 ) ) ( not ( = ?auto_671358 ?auto_671362 ) ) ( not ( = ?auto_671358 ?auto_671363 ) ) ( not ( = ?auto_671358 ?auto_671364 ) ) ( not ( = ?auto_671359 ?auto_671360 ) ) ( not ( = ?auto_671359 ?auto_671361 ) ) ( not ( = ?auto_671359 ?auto_671362 ) ) ( not ( = ?auto_671359 ?auto_671363 ) ) ( not ( = ?auto_671359 ?auto_671364 ) ) ( not ( = ?auto_671360 ?auto_671361 ) ) ( not ( = ?auto_671360 ?auto_671362 ) ) ( not ( = ?auto_671360 ?auto_671363 ) ) ( not ( = ?auto_671360 ?auto_671364 ) ) ( not ( = ?auto_671361 ?auto_671362 ) ) ( not ( = ?auto_671361 ?auto_671363 ) ) ( not ( = ?auto_671361 ?auto_671364 ) ) ( not ( = ?auto_671362 ?auto_671363 ) ) ( not ( = ?auto_671362 ?auto_671364 ) ) ( not ( = ?auto_671363 ?auto_671364 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_671364 )
      ( !STACK ?auto_671364 ?auto_671363 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671382 - BLOCK
      ?auto_671383 - BLOCK
      ?auto_671384 - BLOCK
      ?auto_671385 - BLOCK
      ?auto_671386 - BLOCK
      ?auto_671387 - BLOCK
      ?auto_671388 - BLOCK
      ?auto_671389 - BLOCK
      ?auto_671390 - BLOCK
      ?auto_671391 - BLOCK
      ?auto_671392 - BLOCK
      ?auto_671393 - BLOCK
      ?auto_671394 - BLOCK
      ?auto_671395 - BLOCK
      ?auto_671396 - BLOCK
      ?auto_671397 - BLOCK
      ?auto_671398 - BLOCK
    )
    :vars
    (
      ?auto_671399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671398 ?auto_671399 ) ( ON-TABLE ?auto_671382 ) ( ON ?auto_671383 ?auto_671382 ) ( ON ?auto_671384 ?auto_671383 ) ( ON ?auto_671385 ?auto_671384 ) ( ON ?auto_671386 ?auto_671385 ) ( ON ?auto_671387 ?auto_671386 ) ( ON ?auto_671388 ?auto_671387 ) ( ON ?auto_671389 ?auto_671388 ) ( ON ?auto_671390 ?auto_671389 ) ( ON ?auto_671391 ?auto_671390 ) ( ON ?auto_671392 ?auto_671391 ) ( ON ?auto_671393 ?auto_671392 ) ( ON ?auto_671394 ?auto_671393 ) ( ON ?auto_671395 ?auto_671394 ) ( ON ?auto_671396 ?auto_671395 ) ( not ( = ?auto_671382 ?auto_671383 ) ) ( not ( = ?auto_671382 ?auto_671384 ) ) ( not ( = ?auto_671382 ?auto_671385 ) ) ( not ( = ?auto_671382 ?auto_671386 ) ) ( not ( = ?auto_671382 ?auto_671387 ) ) ( not ( = ?auto_671382 ?auto_671388 ) ) ( not ( = ?auto_671382 ?auto_671389 ) ) ( not ( = ?auto_671382 ?auto_671390 ) ) ( not ( = ?auto_671382 ?auto_671391 ) ) ( not ( = ?auto_671382 ?auto_671392 ) ) ( not ( = ?auto_671382 ?auto_671393 ) ) ( not ( = ?auto_671382 ?auto_671394 ) ) ( not ( = ?auto_671382 ?auto_671395 ) ) ( not ( = ?auto_671382 ?auto_671396 ) ) ( not ( = ?auto_671382 ?auto_671397 ) ) ( not ( = ?auto_671382 ?auto_671398 ) ) ( not ( = ?auto_671382 ?auto_671399 ) ) ( not ( = ?auto_671383 ?auto_671384 ) ) ( not ( = ?auto_671383 ?auto_671385 ) ) ( not ( = ?auto_671383 ?auto_671386 ) ) ( not ( = ?auto_671383 ?auto_671387 ) ) ( not ( = ?auto_671383 ?auto_671388 ) ) ( not ( = ?auto_671383 ?auto_671389 ) ) ( not ( = ?auto_671383 ?auto_671390 ) ) ( not ( = ?auto_671383 ?auto_671391 ) ) ( not ( = ?auto_671383 ?auto_671392 ) ) ( not ( = ?auto_671383 ?auto_671393 ) ) ( not ( = ?auto_671383 ?auto_671394 ) ) ( not ( = ?auto_671383 ?auto_671395 ) ) ( not ( = ?auto_671383 ?auto_671396 ) ) ( not ( = ?auto_671383 ?auto_671397 ) ) ( not ( = ?auto_671383 ?auto_671398 ) ) ( not ( = ?auto_671383 ?auto_671399 ) ) ( not ( = ?auto_671384 ?auto_671385 ) ) ( not ( = ?auto_671384 ?auto_671386 ) ) ( not ( = ?auto_671384 ?auto_671387 ) ) ( not ( = ?auto_671384 ?auto_671388 ) ) ( not ( = ?auto_671384 ?auto_671389 ) ) ( not ( = ?auto_671384 ?auto_671390 ) ) ( not ( = ?auto_671384 ?auto_671391 ) ) ( not ( = ?auto_671384 ?auto_671392 ) ) ( not ( = ?auto_671384 ?auto_671393 ) ) ( not ( = ?auto_671384 ?auto_671394 ) ) ( not ( = ?auto_671384 ?auto_671395 ) ) ( not ( = ?auto_671384 ?auto_671396 ) ) ( not ( = ?auto_671384 ?auto_671397 ) ) ( not ( = ?auto_671384 ?auto_671398 ) ) ( not ( = ?auto_671384 ?auto_671399 ) ) ( not ( = ?auto_671385 ?auto_671386 ) ) ( not ( = ?auto_671385 ?auto_671387 ) ) ( not ( = ?auto_671385 ?auto_671388 ) ) ( not ( = ?auto_671385 ?auto_671389 ) ) ( not ( = ?auto_671385 ?auto_671390 ) ) ( not ( = ?auto_671385 ?auto_671391 ) ) ( not ( = ?auto_671385 ?auto_671392 ) ) ( not ( = ?auto_671385 ?auto_671393 ) ) ( not ( = ?auto_671385 ?auto_671394 ) ) ( not ( = ?auto_671385 ?auto_671395 ) ) ( not ( = ?auto_671385 ?auto_671396 ) ) ( not ( = ?auto_671385 ?auto_671397 ) ) ( not ( = ?auto_671385 ?auto_671398 ) ) ( not ( = ?auto_671385 ?auto_671399 ) ) ( not ( = ?auto_671386 ?auto_671387 ) ) ( not ( = ?auto_671386 ?auto_671388 ) ) ( not ( = ?auto_671386 ?auto_671389 ) ) ( not ( = ?auto_671386 ?auto_671390 ) ) ( not ( = ?auto_671386 ?auto_671391 ) ) ( not ( = ?auto_671386 ?auto_671392 ) ) ( not ( = ?auto_671386 ?auto_671393 ) ) ( not ( = ?auto_671386 ?auto_671394 ) ) ( not ( = ?auto_671386 ?auto_671395 ) ) ( not ( = ?auto_671386 ?auto_671396 ) ) ( not ( = ?auto_671386 ?auto_671397 ) ) ( not ( = ?auto_671386 ?auto_671398 ) ) ( not ( = ?auto_671386 ?auto_671399 ) ) ( not ( = ?auto_671387 ?auto_671388 ) ) ( not ( = ?auto_671387 ?auto_671389 ) ) ( not ( = ?auto_671387 ?auto_671390 ) ) ( not ( = ?auto_671387 ?auto_671391 ) ) ( not ( = ?auto_671387 ?auto_671392 ) ) ( not ( = ?auto_671387 ?auto_671393 ) ) ( not ( = ?auto_671387 ?auto_671394 ) ) ( not ( = ?auto_671387 ?auto_671395 ) ) ( not ( = ?auto_671387 ?auto_671396 ) ) ( not ( = ?auto_671387 ?auto_671397 ) ) ( not ( = ?auto_671387 ?auto_671398 ) ) ( not ( = ?auto_671387 ?auto_671399 ) ) ( not ( = ?auto_671388 ?auto_671389 ) ) ( not ( = ?auto_671388 ?auto_671390 ) ) ( not ( = ?auto_671388 ?auto_671391 ) ) ( not ( = ?auto_671388 ?auto_671392 ) ) ( not ( = ?auto_671388 ?auto_671393 ) ) ( not ( = ?auto_671388 ?auto_671394 ) ) ( not ( = ?auto_671388 ?auto_671395 ) ) ( not ( = ?auto_671388 ?auto_671396 ) ) ( not ( = ?auto_671388 ?auto_671397 ) ) ( not ( = ?auto_671388 ?auto_671398 ) ) ( not ( = ?auto_671388 ?auto_671399 ) ) ( not ( = ?auto_671389 ?auto_671390 ) ) ( not ( = ?auto_671389 ?auto_671391 ) ) ( not ( = ?auto_671389 ?auto_671392 ) ) ( not ( = ?auto_671389 ?auto_671393 ) ) ( not ( = ?auto_671389 ?auto_671394 ) ) ( not ( = ?auto_671389 ?auto_671395 ) ) ( not ( = ?auto_671389 ?auto_671396 ) ) ( not ( = ?auto_671389 ?auto_671397 ) ) ( not ( = ?auto_671389 ?auto_671398 ) ) ( not ( = ?auto_671389 ?auto_671399 ) ) ( not ( = ?auto_671390 ?auto_671391 ) ) ( not ( = ?auto_671390 ?auto_671392 ) ) ( not ( = ?auto_671390 ?auto_671393 ) ) ( not ( = ?auto_671390 ?auto_671394 ) ) ( not ( = ?auto_671390 ?auto_671395 ) ) ( not ( = ?auto_671390 ?auto_671396 ) ) ( not ( = ?auto_671390 ?auto_671397 ) ) ( not ( = ?auto_671390 ?auto_671398 ) ) ( not ( = ?auto_671390 ?auto_671399 ) ) ( not ( = ?auto_671391 ?auto_671392 ) ) ( not ( = ?auto_671391 ?auto_671393 ) ) ( not ( = ?auto_671391 ?auto_671394 ) ) ( not ( = ?auto_671391 ?auto_671395 ) ) ( not ( = ?auto_671391 ?auto_671396 ) ) ( not ( = ?auto_671391 ?auto_671397 ) ) ( not ( = ?auto_671391 ?auto_671398 ) ) ( not ( = ?auto_671391 ?auto_671399 ) ) ( not ( = ?auto_671392 ?auto_671393 ) ) ( not ( = ?auto_671392 ?auto_671394 ) ) ( not ( = ?auto_671392 ?auto_671395 ) ) ( not ( = ?auto_671392 ?auto_671396 ) ) ( not ( = ?auto_671392 ?auto_671397 ) ) ( not ( = ?auto_671392 ?auto_671398 ) ) ( not ( = ?auto_671392 ?auto_671399 ) ) ( not ( = ?auto_671393 ?auto_671394 ) ) ( not ( = ?auto_671393 ?auto_671395 ) ) ( not ( = ?auto_671393 ?auto_671396 ) ) ( not ( = ?auto_671393 ?auto_671397 ) ) ( not ( = ?auto_671393 ?auto_671398 ) ) ( not ( = ?auto_671393 ?auto_671399 ) ) ( not ( = ?auto_671394 ?auto_671395 ) ) ( not ( = ?auto_671394 ?auto_671396 ) ) ( not ( = ?auto_671394 ?auto_671397 ) ) ( not ( = ?auto_671394 ?auto_671398 ) ) ( not ( = ?auto_671394 ?auto_671399 ) ) ( not ( = ?auto_671395 ?auto_671396 ) ) ( not ( = ?auto_671395 ?auto_671397 ) ) ( not ( = ?auto_671395 ?auto_671398 ) ) ( not ( = ?auto_671395 ?auto_671399 ) ) ( not ( = ?auto_671396 ?auto_671397 ) ) ( not ( = ?auto_671396 ?auto_671398 ) ) ( not ( = ?auto_671396 ?auto_671399 ) ) ( not ( = ?auto_671397 ?auto_671398 ) ) ( not ( = ?auto_671397 ?auto_671399 ) ) ( not ( = ?auto_671398 ?auto_671399 ) ) ( CLEAR ?auto_671396 ) ( ON ?auto_671397 ?auto_671398 ) ( CLEAR ?auto_671397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_671382 ?auto_671383 ?auto_671384 ?auto_671385 ?auto_671386 ?auto_671387 ?auto_671388 ?auto_671389 ?auto_671390 ?auto_671391 ?auto_671392 ?auto_671393 ?auto_671394 ?auto_671395 ?auto_671396 ?auto_671397 )
      ( MAKE-17PILE ?auto_671382 ?auto_671383 ?auto_671384 ?auto_671385 ?auto_671386 ?auto_671387 ?auto_671388 ?auto_671389 ?auto_671390 ?auto_671391 ?auto_671392 ?auto_671393 ?auto_671394 ?auto_671395 ?auto_671396 ?auto_671397 ?auto_671398 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671417 - BLOCK
      ?auto_671418 - BLOCK
      ?auto_671419 - BLOCK
      ?auto_671420 - BLOCK
      ?auto_671421 - BLOCK
      ?auto_671422 - BLOCK
      ?auto_671423 - BLOCK
      ?auto_671424 - BLOCK
      ?auto_671425 - BLOCK
      ?auto_671426 - BLOCK
      ?auto_671427 - BLOCK
      ?auto_671428 - BLOCK
      ?auto_671429 - BLOCK
      ?auto_671430 - BLOCK
      ?auto_671431 - BLOCK
      ?auto_671432 - BLOCK
      ?auto_671433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671433 ) ( ON-TABLE ?auto_671417 ) ( ON ?auto_671418 ?auto_671417 ) ( ON ?auto_671419 ?auto_671418 ) ( ON ?auto_671420 ?auto_671419 ) ( ON ?auto_671421 ?auto_671420 ) ( ON ?auto_671422 ?auto_671421 ) ( ON ?auto_671423 ?auto_671422 ) ( ON ?auto_671424 ?auto_671423 ) ( ON ?auto_671425 ?auto_671424 ) ( ON ?auto_671426 ?auto_671425 ) ( ON ?auto_671427 ?auto_671426 ) ( ON ?auto_671428 ?auto_671427 ) ( ON ?auto_671429 ?auto_671428 ) ( ON ?auto_671430 ?auto_671429 ) ( ON ?auto_671431 ?auto_671430 ) ( not ( = ?auto_671417 ?auto_671418 ) ) ( not ( = ?auto_671417 ?auto_671419 ) ) ( not ( = ?auto_671417 ?auto_671420 ) ) ( not ( = ?auto_671417 ?auto_671421 ) ) ( not ( = ?auto_671417 ?auto_671422 ) ) ( not ( = ?auto_671417 ?auto_671423 ) ) ( not ( = ?auto_671417 ?auto_671424 ) ) ( not ( = ?auto_671417 ?auto_671425 ) ) ( not ( = ?auto_671417 ?auto_671426 ) ) ( not ( = ?auto_671417 ?auto_671427 ) ) ( not ( = ?auto_671417 ?auto_671428 ) ) ( not ( = ?auto_671417 ?auto_671429 ) ) ( not ( = ?auto_671417 ?auto_671430 ) ) ( not ( = ?auto_671417 ?auto_671431 ) ) ( not ( = ?auto_671417 ?auto_671432 ) ) ( not ( = ?auto_671417 ?auto_671433 ) ) ( not ( = ?auto_671418 ?auto_671419 ) ) ( not ( = ?auto_671418 ?auto_671420 ) ) ( not ( = ?auto_671418 ?auto_671421 ) ) ( not ( = ?auto_671418 ?auto_671422 ) ) ( not ( = ?auto_671418 ?auto_671423 ) ) ( not ( = ?auto_671418 ?auto_671424 ) ) ( not ( = ?auto_671418 ?auto_671425 ) ) ( not ( = ?auto_671418 ?auto_671426 ) ) ( not ( = ?auto_671418 ?auto_671427 ) ) ( not ( = ?auto_671418 ?auto_671428 ) ) ( not ( = ?auto_671418 ?auto_671429 ) ) ( not ( = ?auto_671418 ?auto_671430 ) ) ( not ( = ?auto_671418 ?auto_671431 ) ) ( not ( = ?auto_671418 ?auto_671432 ) ) ( not ( = ?auto_671418 ?auto_671433 ) ) ( not ( = ?auto_671419 ?auto_671420 ) ) ( not ( = ?auto_671419 ?auto_671421 ) ) ( not ( = ?auto_671419 ?auto_671422 ) ) ( not ( = ?auto_671419 ?auto_671423 ) ) ( not ( = ?auto_671419 ?auto_671424 ) ) ( not ( = ?auto_671419 ?auto_671425 ) ) ( not ( = ?auto_671419 ?auto_671426 ) ) ( not ( = ?auto_671419 ?auto_671427 ) ) ( not ( = ?auto_671419 ?auto_671428 ) ) ( not ( = ?auto_671419 ?auto_671429 ) ) ( not ( = ?auto_671419 ?auto_671430 ) ) ( not ( = ?auto_671419 ?auto_671431 ) ) ( not ( = ?auto_671419 ?auto_671432 ) ) ( not ( = ?auto_671419 ?auto_671433 ) ) ( not ( = ?auto_671420 ?auto_671421 ) ) ( not ( = ?auto_671420 ?auto_671422 ) ) ( not ( = ?auto_671420 ?auto_671423 ) ) ( not ( = ?auto_671420 ?auto_671424 ) ) ( not ( = ?auto_671420 ?auto_671425 ) ) ( not ( = ?auto_671420 ?auto_671426 ) ) ( not ( = ?auto_671420 ?auto_671427 ) ) ( not ( = ?auto_671420 ?auto_671428 ) ) ( not ( = ?auto_671420 ?auto_671429 ) ) ( not ( = ?auto_671420 ?auto_671430 ) ) ( not ( = ?auto_671420 ?auto_671431 ) ) ( not ( = ?auto_671420 ?auto_671432 ) ) ( not ( = ?auto_671420 ?auto_671433 ) ) ( not ( = ?auto_671421 ?auto_671422 ) ) ( not ( = ?auto_671421 ?auto_671423 ) ) ( not ( = ?auto_671421 ?auto_671424 ) ) ( not ( = ?auto_671421 ?auto_671425 ) ) ( not ( = ?auto_671421 ?auto_671426 ) ) ( not ( = ?auto_671421 ?auto_671427 ) ) ( not ( = ?auto_671421 ?auto_671428 ) ) ( not ( = ?auto_671421 ?auto_671429 ) ) ( not ( = ?auto_671421 ?auto_671430 ) ) ( not ( = ?auto_671421 ?auto_671431 ) ) ( not ( = ?auto_671421 ?auto_671432 ) ) ( not ( = ?auto_671421 ?auto_671433 ) ) ( not ( = ?auto_671422 ?auto_671423 ) ) ( not ( = ?auto_671422 ?auto_671424 ) ) ( not ( = ?auto_671422 ?auto_671425 ) ) ( not ( = ?auto_671422 ?auto_671426 ) ) ( not ( = ?auto_671422 ?auto_671427 ) ) ( not ( = ?auto_671422 ?auto_671428 ) ) ( not ( = ?auto_671422 ?auto_671429 ) ) ( not ( = ?auto_671422 ?auto_671430 ) ) ( not ( = ?auto_671422 ?auto_671431 ) ) ( not ( = ?auto_671422 ?auto_671432 ) ) ( not ( = ?auto_671422 ?auto_671433 ) ) ( not ( = ?auto_671423 ?auto_671424 ) ) ( not ( = ?auto_671423 ?auto_671425 ) ) ( not ( = ?auto_671423 ?auto_671426 ) ) ( not ( = ?auto_671423 ?auto_671427 ) ) ( not ( = ?auto_671423 ?auto_671428 ) ) ( not ( = ?auto_671423 ?auto_671429 ) ) ( not ( = ?auto_671423 ?auto_671430 ) ) ( not ( = ?auto_671423 ?auto_671431 ) ) ( not ( = ?auto_671423 ?auto_671432 ) ) ( not ( = ?auto_671423 ?auto_671433 ) ) ( not ( = ?auto_671424 ?auto_671425 ) ) ( not ( = ?auto_671424 ?auto_671426 ) ) ( not ( = ?auto_671424 ?auto_671427 ) ) ( not ( = ?auto_671424 ?auto_671428 ) ) ( not ( = ?auto_671424 ?auto_671429 ) ) ( not ( = ?auto_671424 ?auto_671430 ) ) ( not ( = ?auto_671424 ?auto_671431 ) ) ( not ( = ?auto_671424 ?auto_671432 ) ) ( not ( = ?auto_671424 ?auto_671433 ) ) ( not ( = ?auto_671425 ?auto_671426 ) ) ( not ( = ?auto_671425 ?auto_671427 ) ) ( not ( = ?auto_671425 ?auto_671428 ) ) ( not ( = ?auto_671425 ?auto_671429 ) ) ( not ( = ?auto_671425 ?auto_671430 ) ) ( not ( = ?auto_671425 ?auto_671431 ) ) ( not ( = ?auto_671425 ?auto_671432 ) ) ( not ( = ?auto_671425 ?auto_671433 ) ) ( not ( = ?auto_671426 ?auto_671427 ) ) ( not ( = ?auto_671426 ?auto_671428 ) ) ( not ( = ?auto_671426 ?auto_671429 ) ) ( not ( = ?auto_671426 ?auto_671430 ) ) ( not ( = ?auto_671426 ?auto_671431 ) ) ( not ( = ?auto_671426 ?auto_671432 ) ) ( not ( = ?auto_671426 ?auto_671433 ) ) ( not ( = ?auto_671427 ?auto_671428 ) ) ( not ( = ?auto_671427 ?auto_671429 ) ) ( not ( = ?auto_671427 ?auto_671430 ) ) ( not ( = ?auto_671427 ?auto_671431 ) ) ( not ( = ?auto_671427 ?auto_671432 ) ) ( not ( = ?auto_671427 ?auto_671433 ) ) ( not ( = ?auto_671428 ?auto_671429 ) ) ( not ( = ?auto_671428 ?auto_671430 ) ) ( not ( = ?auto_671428 ?auto_671431 ) ) ( not ( = ?auto_671428 ?auto_671432 ) ) ( not ( = ?auto_671428 ?auto_671433 ) ) ( not ( = ?auto_671429 ?auto_671430 ) ) ( not ( = ?auto_671429 ?auto_671431 ) ) ( not ( = ?auto_671429 ?auto_671432 ) ) ( not ( = ?auto_671429 ?auto_671433 ) ) ( not ( = ?auto_671430 ?auto_671431 ) ) ( not ( = ?auto_671430 ?auto_671432 ) ) ( not ( = ?auto_671430 ?auto_671433 ) ) ( not ( = ?auto_671431 ?auto_671432 ) ) ( not ( = ?auto_671431 ?auto_671433 ) ) ( not ( = ?auto_671432 ?auto_671433 ) ) ( CLEAR ?auto_671431 ) ( ON ?auto_671432 ?auto_671433 ) ( CLEAR ?auto_671432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_671417 ?auto_671418 ?auto_671419 ?auto_671420 ?auto_671421 ?auto_671422 ?auto_671423 ?auto_671424 ?auto_671425 ?auto_671426 ?auto_671427 ?auto_671428 ?auto_671429 ?auto_671430 ?auto_671431 ?auto_671432 )
      ( MAKE-17PILE ?auto_671417 ?auto_671418 ?auto_671419 ?auto_671420 ?auto_671421 ?auto_671422 ?auto_671423 ?auto_671424 ?auto_671425 ?auto_671426 ?auto_671427 ?auto_671428 ?auto_671429 ?auto_671430 ?auto_671431 ?auto_671432 ?auto_671433 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671451 - BLOCK
      ?auto_671452 - BLOCK
      ?auto_671453 - BLOCK
      ?auto_671454 - BLOCK
      ?auto_671455 - BLOCK
      ?auto_671456 - BLOCK
      ?auto_671457 - BLOCK
      ?auto_671458 - BLOCK
      ?auto_671459 - BLOCK
      ?auto_671460 - BLOCK
      ?auto_671461 - BLOCK
      ?auto_671462 - BLOCK
      ?auto_671463 - BLOCK
      ?auto_671464 - BLOCK
      ?auto_671465 - BLOCK
      ?auto_671466 - BLOCK
      ?auto_671467 - BLOCK
    )
    :vars
    (
      ?auto_671468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671467 ?auto_671468 ) ( ON-TABLE ?auto_671451 ) ( ON ?auto_671452 ?auto_671451 ) ( ON ?auto_671453 ?auto_671452 ) ( ON ?auto_671454 ?auto_671453 ) ( ON ?auto_671455 ?auto_671454 ) ( ON ?auto_671456 ?auto_671455 ) ( ON ?auto_671457 ?auto_671456 ) ( ON ?auto_671458 ?auto_671457 ) ( ON ?auto_671459 ?auto_671458 ) ( ON ?auto_671460 ?auto_671459 ) ( ON ?auto_671461 ?auto_671460 ) ( ON ?auto_671462 ?auto_671461 ) ( ON ?auto_671463 ?auto_671462 ) ( ON ?auto_671464 ?auto_671463 ) ( not ( = ?auto_671451 ?auto_671452 ) ) ( not ( = ?auto_671451 ?auto_671453 ) ) ( not ( = ?auto_671451 ?auto_671454 ) ) ( not ( = ?auto_671451 ?auto_671455 ) ) ( not ( = ?auto_671451 ?auto_671456 ) ) ( not ( = ?auto_671451 ?auto_671457 ) ) ( not ( = ?auto_671451 ?auto_671458 ) ) ( not ( = ?auto_671451 ?auto_671459 ) ) ( not ( = ?auto_671451 ?auto_671460 ) ) ( not ( = ?auto_671451 ?auto_671461 ) ) ( not ( = ?auto_671451 ?auto_671462 ) ) ( not ( = ?auto_671451 ?auto_671463 ) ) ( not ( = ?auto_671451 ?auto_671464 ) ) ( not ( = ?auto_671451 ?auto_671465 ) ) ( not ( = ?auto_671451 ?auto_671466 ) ) ( not ( = ?auto_671451 ?auto_671467 ) ) ( not ( = ?auto_671451 ?auto_671468 ) ) ( not ( = ?auto_671452 ?auto_671453 ) ) ( not ( = ?auto_671452 ?auto_671454 ) ) ( not ( = ?auto_671452 ?auto_671455 ) ) ( not ( = ?auto_671452 ?auto_671456 ) ) ( not ( = ?auto_671452 ?auto_671457 ) ) ( not ( = ?auto_671452 ?auto_671458 ) ) ( not ( = ?auto_671452 ?auto_671459 ) ) ( not ( = ?auto_671452 ?auto_671460 ) ) ( not ( = ?auto_671452 ?auto_671461 ) ) ( not ( = ?auto_671452 ?auto_671462 ) ) ( not ( = ?auto_671452 ?auto_671463 ) ) ( not ( = ?auto_671452 ?auto_671464 ) ) ( not ( = ?auto_671452 ?auto_671465 ) ) ( not ( = ?auto_671452 ?auto_671466 ) ) ( not ( = ?auto_671452 ?auto_671467 ) ) ( not ( = ?auto_671452 ?auto_671468 ) ) ( not ( = ?auto_671453 ?auto_671454 ) ) ( not ( = ?auto_671453 ?auto_671455 ) ) ( not ( = ?auto_671453 ?auto_671456 ) ) ( not ( = ?auto_671453 ?auto_671457 ) ) ( not ( = ?auto_671453 ?auto_671458 ) ) ( not ( = ?auto_671453 ?auto_671459 ) ) ( not ( = ?auto_671453 ?auto_671460 ) ) ( not ( = ?auto_671453 ?auto_671461 ) ) ( not ( = ?auto_671453 ?auto_671462 ) ) ( not ( = ?auto_671453 ?auto_671463 ) ) ( not ( = ?auto_671453 ?auto_671464 ) ) ( not ( = ?auto_671453 ?auto_671465 ) ) ( not ( = ?auto_671453 ?auto_671466 ) ) ( not ( = ?auto_671453 ?auto_671467 ) ) ( not ( = ?auto_671453 ?auto_671468 ) ) ( not ( = ?auto_671454 ?auto_671455 ) ) ( not ( = ?auto_671454 ?auto_671456 ) ) ( not ( = ?auto_671454 ?auto_671457 ) ) ( not ( = ?auto_671454 ?auto_671458 ) ) ( not ( = ?auto_671454 ?auto_671459 ) ) ( not ( = ?auto_671454 ?auto_671460 ) ) ( not ( = ?auto_671454 ?auto_671461 ) ) ( not ( = ?auto_671454 ?auto_671462 ) ) ( not ( = ?auto_671454 ?auto_671463 ) ) ( not ( = ?auto_671454 ?auto_671464 ) ) ( not ( = ?auto_671454 ?auto_671465 ) ) ( not ( = ?auto_671454 ?auto_671466 ) ) ( not ( = ?auto_671454 ?auto_671467 ) ) ( not ( = ?auto_671454 ?auto_671468 ) ) ( not ( = ?auto_671455 ?auto_671456 ) ) ( not ( = ?auto_671455 ?auto_671457 ) ) ( not ( = ?auto_671455 ?auto_671458 ) ) ( not ( = ?auto_671455 ?auto_671459 ) ) ( not ( = ?auto_671455 ?auto_671460 ) ) ( not ( = ?auto_671455 ?auto_671461 ) ) ( not ( = ?auto_671455 ?auto_671462 ) ) ( not ( = ?auto_671455 ?auto_671463 ) ) ( not ( = ?auto_671455 ?auto_671464 ) ) ( not ( = ?auto_671455 ?auto_671465 ) ) ( not ( = ?auto_671455 ?auto_671466 ) ) ( not ( = ?auto_671455 ?auto_671467 ) ) ( not ( = ?auto_671455 ?auto_671468 ) ) ( not ( = ?auto_671456 ?auto_671457 ) ) ( not ( = ?auto_671456 ?auto_671458 ) ) ( not ( = ?auto_671456 ?auto_671459 ) ) ( not ( = ?auto_671456 ?auto_671460 ) ) ( not ( = ?auto_671456 ?auto_671461 ) ) ( not ( = ?auto_671456 ?auto_671462 ) ) ( not ( = ?auto_671456 ?auto_671463 ) ) ( not ( = ?auto_671456 ?auto_671464 ) ) ( not ( = ?auto_671456 ?auto_671465 ) ) ( not ( = ?auto_671456 ?auto_671466 ) ) ( not ( = ?auto_671456 ?auto_671467 ) ) ( not ( = ?auto_671456 ?auto_671468 ) ) ( not ( = ?auto_671457 ?auto_671458 ) ) ( not ( = ?auto_671457 ?auto_671459 ) ) ( not ( = ?auto_671457 ?auto_671460 ) ) ( not ( = ?auto_671457 ?auto_671461 ) ) ( not ( = ?auto_671457 ?auto_671462 ) ) ( not ( = ?auto_671457 ?auto_671463 ) ) ( not ( = ?auto_671457 ?auto_671464 ) ) ( not ( = ?auto_671457 ?auto_671465 ) ) ( not ( = ?auto_671457 ?auto_671466 ) ) ( not ( = ?auto_671457 ?auto_671467 ) ) ( not ( = ?auto_671457 ?auto_671468 ) ) ( not ( = ?auto_671458 ?auto_671459 ) ) ( not ( = ?auto_671458 ?auto_671460 ) ) ( not ( = ?auto_671458 ?auto_671461 ) ) ( not ( = ?auto_671458 ?auto_671462 ) ) ( not ( = ?auto_671458 ?auto_671463 ) ) ( not ( = ?auto_671458 ?auto_671464 ) ) ( not ( = ?auto_671458 ?auto_671465 ) ) ( not ( = ?auto_671458 ?auto_671466 ) ) ( not ( = ?auto_671458 ?auto_671467 ) ) ( not ( = ?auto_671458 ?auto_671468 ) ) ( not ( = ?auto_671459 ?auto_671460 ) ) ( not ( = ?auto_671459 ?auto_671461 ) ) ( not ( = ?auto_671459 ?auto_671462 ) ) ( not ( = ?auto_671459 ?auto_671463 ) ) ( not ( = ?auto_671459 ?auto_671464 ) ) ( not ( = ?auto_671459 ?auto_671465 ) ) ( not ( = ?auto_671459 ?auto_671466 ) ) ( not ( = ?auto_671459 ?auto_671467 ) ) ( not ( = ?auto_671459 ?auto_671468 ) ) ( not ( = ?auto_671460 ?auto_671461 ) ) ( not ( = ?auto_671460 ?auto_671462 ) ) ( not ( = ?auto_671460 ?auto_671463 ) ) ( not ( = ?auto_671460 ?auto_671464 ) ) ( not ( = ?auto_671460 ?auto_671465 ) ) ( not ( = ?auto_671460 ?auto_671466 ) ) ( not ( = ?auto_671460 ?auto_671467 ) ) ( not ( = ?auto_671460 ?auto_671468 ) ) ( not ( = ?auto_671461 ?auto_671462 ) ) ( not ( = ?auto_671461 ?auto_671463 ) ) ( not ( = ?auto_671461 ?auto_671464 ) ) ( not ( = ?auto_671461 ?auto_671465 ) ) ( not ( = ?auto_671461 ?auto_671466 ) ) ( not ( = ?auto_671461 ?auto_671467 ) ) ( not ( = ?auto_671461 ?auto_671468 ) ) ( not ( = ?auto_671462 ?auto_671463 ) ) ( not ( = ?auto_671462 ?auto_671464 ) ) ( not ( = ?auto_671462 ?auto_671465 ) ) ( not ( = ?auto_671462 ?auto_671466 ) ) ( not ( = ?auto_671462 ?auto_671467 ) ) ( not ( = ?auto_671462 ?auto_671468 ) ) ( not ( = ?auto_671463 ?auto_671464 ) ) ( not ( = ?auto_671463 ?auto_671465 ) ) ( not ( = ?auto_671463 ?auto_671466 ) ) ( not ( = ?auto_671463 ?auto_671467 ) ) ( not ( = ?auto_671463 ?auto_671468 ) ) ( not ( = ?auto_671464 ?auto_671465 ) ) ( not ( = ?auto_671464 ?auto_671466 ) ) ( not ( = ?auto_671464 ?auto_671467 ) ) ( not ( = ?auto_671464 ?auto_671468 ) ) ( not ( = ?auto_671465 ?auto_671466 ) ) ( not ( = ?auto_671465 ?auto_671467 ) ) ( not ( = ?auto_671465 ?auto_671468 ) ) ( not ( = ?auto_671466 ?auto_671467 ) ) ( not ( = ?auto_671466 ?auto_671468 ) ) ( not ( = ?auto_671467 ?auto_671468 ) ) ( ON ?auto_671466 ?auto_671467 ) ( CLEAR ?auto_671464 ) ( ON ?auto_671465 ?auto_671466 ) ( CLEAR ?auto_671465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_671451 ?auto_671452 ?auto_671453 ?auto_671454 ?auto_671455 ?auto_671456 ?auto_671457 ?auto_671458 ?auto_671459 ?auto_671460 ?auto_671461 ?auto_671462 ?auto_671463 ?auto_671464 ?auto_671465 )
      ( MAKE-17PILE ?auto_671451 ?auto_671452 ?auto_671453 ?auto_671454 ?auto_671455 ?auto_671456 ?auto_671457 ?auto_671458 ?auto_671459 ?auto_671460 ?auto_671461 ?auto_671462 ?auto_671463 ?auto_671464 ?auto_671465 ?auto_671466 ?auto_671467 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671486 - BLOCK
      ?auto_671487 - BLOCK
      ?auto_671488 - BLOCK
      ?auto_671489 - BLOCK
      ?auto_671490 - BLOCK
      ?auto_671491 - BLOCK
      ?auto_671492 - BLOCK
      ?auto_671493 - BLOCK
      ?auto_671494 - BLOCK
      ?auto_671495 - BLOCK
      ?auto_671496 - BLOCK
      ?auto_671497 - BLOCK
      ?auto_671498 - BLOCK
      ?auto_671499 - BLOCK
      ?auto_671500 - BLOCK
      ?auto_671501 - BLOCK
      ?auto_671502 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671502 ) ( ON-TABLE ?auto_671486 ) ( ON ?auto_671487 ?auto_671486 ) ( ON ?auto_671488 ?auto_671487 ) ( ON ?auto_671489 ?auto_671488 ) ( ON ?auto_671490 ?auto_671489 ) ( ON ?auto_671491 ?auto_671490 ) ( ON ?auto_671492 ?auto_671491 ) ( ON ?auto_671493 ?auto_671492 ) ( ON ?auto_671494 ?auto_671493 ) ( ON ?auto_671495 ?auto_671494 ) ( ON ?auto_671496 ?auto_671495 ) ( ON ?auto_671497 ?auto_671496 ) ( ON ?auto_671498 ?auto_671497 ) ( ON ?auto_671499 ?auto_671498 ) ( not ( = ?auto_671486 ?auto_671487 ) ) ( not ( = ?auto_671486 ?auto_671488 ) ) ( not ( = ?auto_671486 ?auto_671489 ) ) ( not ( = ?auto_671486 ?auto_671490 ) ) ( not ( = ?auto_671486 ?auto_671491 ) ) ( not ( = ?auto_671486 ?auto_671492 ) ) ( not ( = ?auto_671486 ?auto_671493 ) ) ( not ( = ?auto_671486 ?auto_671494 ) ) ( not ( = ?auto_671486 ?auto_671495 ) ) ( not ( = ?auto_671486 ?auto_671496 ) ) ( not ( = ?auto_671486 ?auto_671497 ) ) ( not ( = ?auto_671486 ?auto_671498 ) ) ( not ( = ?auto_671486 ?auto_671499 ) ) ( not ( = ?auto_671486 ?auto_671500 ) ) ( not ( = ?auto_671486 ?auto_671501 ) ) ( not ( = ?auto_671486 ?auto_671502 ) ) ( not ( = ?auto_671487 ?auto_671488 ) ) ( not ( = ?auto_671487 ?auto_671489 ) ) ( not ( = ?auto_671487 ?auto_671490 ) ) ( not ( = ?auto_671487 ?auto_671491 ) ) ( not ( = ?auto_671487 ?auto_671492 ) ) ( not ( = ?auto_671487 ?auto_671493 ) ) ( not ( = ?auto_671487 ?auto_671494 ) ) ( not ( = ?auto_671487 ?auto_671495 ) ) ( not ( = ?auto_671487 ?auto_671496 ) ) ( not ( = ?auto_671487 ?auto_671497 ) ) ( not ( = ?auto_671487 ?auto_671498 ) ) ( not ( = ?auto_671487 ?auto_671499 ) ) ( not ( = ?auto_671487 ?auto_671500 ) ) ( not ( = ?auto_671487 ?auto_671501 ) ) ( not ( = ?auto_671487 ?auto_671502 ) ) ( not ( = ?auto_671488 ?auto_671489 ) ) ( not ( = ?auto_671488 ?auto_671490 ) ) ( not ( = ?auto_671488 ?auto_671491 ) ) ( not ( = ?auto_671488 ?auto_671492 ) ) ( not ( = ?auto_671488 ?auto_671493 ) ) ( not ( = ?auto_671488 ?auto_671494 ) ) ( not ( = ?auto_671488 ?auto_671495 ) ) ( not ( = ?auto_671488 ?auto_671496 ) ) ( not ( = ?auto_671488 ?auto_671497 ) ) ( not ( = ?auto_671488 ?auto_671498 ) ) ( not ( = ?auto_671488 ?auto_671499 ) ) ( not ( = ?auto_671488 ?auto_671500 ) ) ( not ( = ?auto_671488 ?auto_671501 ) ) ( not ( = ?auto_671488 ?auto_671502 ) ) ( not ( = ?auto_671489 ?auto_671490 ) ) ( not ( = ?auto_671489 ?auto_671491 ) ) ( not ( = ?auto_671489 ?auto_671492 ) ) ( not ( = ?auto_671489 ?auto_671493 ) ) ( not ( = ?auto_671489 ?auto_671494 ) ) ( not ( = ?auto_671489 ?auto_671495 ) ) ( not ( = ?auto_671489 ?auto_671496 ) ) ( not ( = ?auto_671489 ?auto_671497 ) ) ( not ( = ?auto_671489 ?auto_671498 ) ) ( not ( = ?auto_671489 ?auto_671499 ) ) ( not ( = ?auto_671489 ?auto_671500 ) ) ( not ( = ?auto_671489 ?auto_671501 ) ) ( not ( = ?auto_671489 ?auto_671502 ) ) ( not ( = ?auto_671490 ?auto_671491 ) ) ( not ( = ?auto_671490 ?auto_671492 ) ) ( not ( = ?auto_671490 ?auto_671493 ) ) ( not ( = ?auto_671490 ?auto_671494 ) ) ( not ( = ?auto_671490 ?auto_671495 ) ) ( not ( = ?auto_671490 ?auto_671496 ) ) ( not ( = ?auto_671490 ?auto_671497 ) ) ( not ( = ?auto_671490 ?auto_671498 ) ) ( not ( = ?auto_671490 ?auto_671499 ) ) ( not ( = ?auto_671490 ?auto_671500 ) ) ( not ( = ?auto_671490 ?auto_671501 ) ) ( not ( = ?auto_671490 ?auto_671502 ) ) ( not ( = ?auto_671491 ?auto_671492 ) ) ( not ( = ?auto_671491 ?auto_671493 ) ) ( not ( = ?auto_671491 ?auto_671494 ) ) ( not ( = ?auto_671491 ?auto_671495 ) ) ( not ( = ?auto_671491 ?auto_671496 ) ) ( not ( = ?auto_671491 ?auto_671497 ) ) ( not ( = ?auto_671491 ?auto_671498 ) ) ( not ( = ?auto_671491 ?auto_671499 ) ) ( not ( = ?auto_671491 ?auto_671500 ) ) ( not ( = ?auto_671491 ?auto_671501 ) ) ( not ( = ?auto_671491 ?auto_671502 ) ) ( not ( = ?auto_671492 ?auto_671493 ) ) ( not ( = ?auto_671492 ?auto_671494 ) ) ( not ( = ?auto_671492 ?auto_671495 ) ) ( not ( = ?auto_671492 ?auto_671496 ) ) ( not ( = ?auto_671492 ?auto_671497 ) ) ( not ( = ?auto_671492 ?auto_671498 ) ) ( not ( = ?auto_671492 ?auto_671499 ) ) ( not ( = ?auto_671492 ?auto_671500 ) ) ( not ( = ?auto_671492 ?auto_671501 ) ) ( not ( = ?auto_671492 ?auto_671502 ) ) ( not ( = ?auto_671493 ?auto_671494 ) ) ( not ( = ?auto_671493 ?auto_671495 ) ) ( not ( = ?auto_671493 ?auto_671496 ) ) ( not ( = ?auto_671493 ?auto_671497 ) ) ( not ( = ?auto_671493 ?auto_671498 ) ) ( not ( = ?auto_671493 ?auto_671499 ) ) ( not ( = ?auto_671493 ?auto_671500 ) ) ( not ( = ?auto_671493 ?auto_671501 ) ) ( not ( = ?auto_671493 ?auto_671502 ) ) ( not ( = ?auto_671494 ?auto_671495 ) ) ( not ( = ?auto_671494 ?auto_671496 ) ) ( not ( = ?auto_671494 ?auto_671497 ) ) ( not ( = ?auto_671494 ?auto_671498 ) ) ( not ( = ?auto_671494 ?auto_671499 ) ) ( not ( = ?auto_671494 ?auto_671500 ) ) ( not ( = ?auto_671494 ?auto_671501 ) ) ( not ( = ?auto_671494 ?auto_671502 ) ) ( not ( = ?auto_671495 ?auto_671496 ) ) ( not ( = ?auto_671495 ?auto_671497 ) ) ( not ( = ?auto_671495 ?auto_671498 ) ) ( not ( = ?auto_671495 ?auto_671499 ) ) ( not ( = ?auto_671495 ?auto_671500 ) ) ( not ( = ?auto_671495 ?auto_671501 ) ) ( not ( = ?auto_671495 ?auto_671502 ) ) ( not ( = ?auto_671496 ?auto_671497 ) ) ( not ( = ?auto_671496 ?auto_671498 ) ) ( not ( = ?auto_671496 ?auto_671499 ) ) ( not ( = ?auto_671496 ?auto_671500 ) ) ( not ( = ?auto_671496 ?auto_671501 ) ) ( not ( = ?auto_671496 ?auto_671502 ) ) ( not ( = ?auto_671497 ?auto_671498 ) ) ( not ( = ?auto_671497 ?auto_671499 ) ) ( not ( = ?auto_671497 ?auto_671500 ) ) ( not ( = ?auto_671497 ?auto_671501 ) ) ( not ( = ?auto_671497 ?auto_671502 ) ) ( not ( = ?auto_671498 ?auto_671499 ) ) ( not ( = ?auto_671498 ?auto_671500 ) ) ( not ( = ?auto_671498 ?auto_671501 ) ) ( not ( = ?auto_671498 ?auto_671502 ) ) ( not ( = ?auto_671499 ?auto_671500 ) ) ( not ( = ?auto_671499 ?auto_671501 ) ) ( not ( = ?auto_671499 ?auto_671502 ) ) ( not ( = ?auto_671500 ?auto_671501 ) ) ( not ( = ?auto_671500 ?auto_671502 ) ) ( not ( = ?auto_671501 ?auto_671502 ) ) ( ON ?auto_671501 ?auto_671502 ) ( CLEAR ?auto_671499 ) ( ON ?auto_671500 ?auto_671501 ) ( CLEAR ?auto_671500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_671486 ?auto_671487 ?auto_671488 ?auto_671489 ?auto_671490 ?auto_671491 ?auto_671492 ?auto_671493 ?auto_671494 ?auto_671495 ?auto_671496 ?auto_671497 ?auto_671498 ?auto_671499 ?auto_671500 )
      ( MAKE-17PILE ?auto_671486 ?auto_671487 ?auto_671488 ?auto_671489 ?auto_671490 ?auto_671491 ?auto_671492 ?auto_671493 ?auto_671494 ?auto_671495 ?auto_671496 ?auto_671497 ?auto_671498 ?auto_671499 ?auto_671500 ?auto_671501 ?auto_671502 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671520 - BLOCK
      ?auto_671521 - BLOCK
      ?auto_671522 - BLOCK
      ?auto_671523 - BLOCK
      ?auto_671524 - BLOCK
      ?auto_671525 - BLOCK
      ?auto_671526 - BLOCK
      ?auto_671527 - BLOCK
      ?auto_671528 - BLOCK
      ?auto_671529 - BLOCK
      ?auto_671530 - BLOCK
      ?auto_671531 - BLOCK
      ?auto_671532 - BLOCK
      ?auto_671533 - BLOCK
      ?auto_671534 - BLOCK
      ?auto_671535 - BLOCK
      ?auto_671536 - BLOCK
    )
    :vars
    (
      ?auto_671537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671536 ?auto_671537 ) ( ON-TABLE ?auto_671520 ) ( ON ?auto_671521 ?auto_671520 ) ( ON ?auto_671522 ?auto_671521 ) ( ON ?auto_671523 ?auto_671522 ) ( ON ?auto_671524 ?auto_671523 ) ( ON ?auto_671525 ?auto_671524 ) ( ON ?auto_671526 ?auto_671525 ) ( ON ?auto_671527 ?auto_671526 ) ( ON ?auto_671528 ?auto_671527 ) ( ON ?auto_671529 ?auto_671528 ) ( ON ?auto_671530 ?auto_671529 ) ( ON ?auto_671531 ?auto_671530 ) ( ON ?auto_671532 ?auto_671531 ) ( not ( = ?auto_671520 ?auto_671521 ) ) ( not ( = ?auto_671520 ?auto_671522 ) ) ( not ( = ?auto_671520 ?auto_671523 ) ) ( not ( = ?auto_671520 ?auto_671524 ) ) ( not ( = ?auto_671520 ?auto_671525 ) ) ( not ( = ?auto_671520 ?auto_671526 ) ) ( not ( = ?auto_671520 ?auto_671527 ) ) ( not ( = ?auto_671520 ?auto_671528 ) ) ( not ( = ?auto_671520 ?auto_671529 ) ) ( not ( = ?auto_671520 ?auto_671530 ) ) ( not ( = ?auto_671520 ?auto_671531 ) ) ( not ( = ?auto_671520 ?auto_671532 ) ) ( not ( = ?auto_671520 ?auto_671533 ) ) ( not ( = ?auto_671520 ?auto_671534 ) ) ( not ( = ?auto_671520 ?auto_671535 ) ) ( not ( = ?auto_671520 ?auto_671536 ) ) ( not ( = ?auto_671520 ?auto_671537 ) ) ( not ( = ?auto_671521 ?auto_671522 ) ) ( not ( = ?auto_671521 ?auto_671523 ) ) ( not ( = ?auto_671521 ?auto_671524 ) ) ( not ( = ?auto_671521 ?auto_671525 ) ) ( not ( = ?auto_671521 ?auto_671526 ) ) ( not ( = ?auto_671521 ?auto_671527 ) ) ( not ( = ?auto_671521 ?auto_671528 ) ) ( not ( = ?auto_671521 ?auto_671529 ) ) ( not ( = ?auto_671521 ?auto_671530 ) ) ( not ( = ?auto_671521 ?auto_671531 ) ) ( not ( = ?auto_671521 ?auto_671532 ) ) ( not ( = ?auto_671521 ?auto_671533 ) ) ( not ( = ?auto_671521 ?auto_671534 ) ) ( not ( = ?auto_671521 ?auto_671535 ) ) ( not ( = ?auto_671521 ?auto_671536 ) ) ( not ( = ?auto_671521 ?auto_671537 ) ) ( not ( = ?auto_671522 ?auto_671523 ) ) ( not ( = ?auto_671522 ?auto_671524 ) ) ( not ( = ?auto_671522 ?auto_671525 ) ) ( not ( = ?auto_671522 ?auto_671526 ) ) ( not ( = ?auto_671522 ?auto_671527 ) ) ( not ( = ?auto_671522 ?auto_671528 ) ) ( not ( = ?auto_671522 ?auto_671529 ) ) ( not ( = ?auto_671522 ?auto_671530 ) ) ( not ( = ?auto_671522 ?auto_671531 ) ) ( not ( = ?auto_671522 ?auto_671532 ) ) ( not ( = ?auto_671522 ?auto_671533 ) ) ( not ( = ?auto_671522 ?auto_671534 ) ) ( not ( = ?auto_671522 ?auto_671535 ) ) ( not ( = ?auto_671522 ?auto_671536 ) ) ( not ( = ?auto_671522 ?auto_671537 ) ) ( not ( = ?auto_671523 ?auto_671524 ) ) ( not ( = ?auto_671523 ?auto_671525 ) ) ( not ( = ?auto_671523 ?auto_671526 ) ) ( not ( = ?auto_671523 ?auto_671527 ) ) ( not ( = ?auto_671523 ?auto_671528 ) ) ( not ( = ?auto_671523 ?auto_671529 ) ) ( not ( = ?auto_671523 ?auto_671530 ) ) ( not ( = ?auto_671523 ?auto_671531 ) ) ( not ( = ?auto_671523 ?auto_671532 ) ) ( not ( = ?auto_671523 ?auto_671533 ) ) ( not ( = ?auto_671523 ?auto_671534 ) ) ( not ( = ?auto_671523 ?auto_671535 ) ) ( not ( = ?auto_671523 ?auto_671536 ) ) ( not ( = ?auto_671523 ?auto_671537 ) ) ( not ( = ?auto_671524 ?auto_671525 ) ) ( not ( = ?auto_671524 ?auto_671526 ) ) ( not ( = ?auto_671524 ?auto_671527 ) ) ( not ( = ?auto_671524 ?auto_671528 ) ) ( not ( = ?auto_671524 ?auto_671529 ) ) ( not ( = ?auto_671524 ?auto_671530 ) ) ( not ( = ?auto_671524 ?auto_671531 ) ) ( not ( = ?auto_671524 ?auto_671532 ) ) ( not ( = ?auto_671524 ?auto_671533 ) ) ( not ( = ?auto_671524 ?auto_671534 ) ) ( not ( = ?auto_671524 ?auto_671535 ) ) ( not ( = ?auto_671524 ?auto_671536 ) ) ( not ( = ?auto_671524 ?auto_671537 ) ) ( not ( = ?auto_671525 ?auto_671526 ) ) ( not ( = ?auto_671525 ?auto_671527 ) ) ( not ( = ?auto_671525 ?auto_671528 ) ) ( not ( = ?auto_671525 ?auto_671529 ) ) ( not ( = ?auto_671525 ?auto_671530 ) ) ( not ( = ?auto_671525 ?auto_671531 ) ) ( not ( = ?auto_671525 ?auto_671532 ) ) ( not ( = ?auto_671525 ?auto_671533 ) ) ( not ( = ?auto_671525 ?auto_671534 ) ) ( not ( = ?auto_671525 ?auto_671535 ) ) ( not ( = ?auto_671525 ?auto_671536 ) ) ( not ( = ?auto_671525 ?auto_671537 ) ) ( not ( = ?auto_671526 ?auto_671527 ) ) ( not ( = ?auto_671526 ?auto_671528 ) ) ( not ( = ?auto_671526 ?auto_671529 ) ) ( not ( = ?auto_671526 ?auto_671530 ) ) ( not ( = ?auto_671526 ?auto_671531 ) ) ( not ( = ?auto_671526 ?auto_671532 ) ) ( not ( = ?auto_671526 ?auto_671533 ) ) ( not ( = ?auto_671526 ?auto_671534 ) ) ( not ( = ?auto_671526 ?auto_671535 ) ) ( not ( = ?auto_671526 ?auto_671536 ) ) ( not ( = ?auto_671526 ?auto_671537 ) ) ( not ( = ?auto_671527 ?auto_671528 ) ) ( not ( = ?auto_671527 ?auto_671529 ) ) ( not ( = ?auto_671527 ?auto_671530 ) ) ( not ( = ?auto_671527 ?auto_671531 ) ) ( not ( = ?auto_671527 ?auto_671532 ) ) ( not ( = ?auto_671527 ?auto_671533 ) ) ( not ( = ?auto_671527 ?auto_671534 ) ) ( not ( = ?auto_671527 ?auto_671535 ) ) ( not ( = ?auto_671527 ?auto_671536 ) ) ( not ( = ?auto_671527 ?auto_671537 ) ) ( not ( = ?auto_671528 ?auto_671529 ) ) ( not ( = ?auto_671528 ?auto_671530 ) ) ( not ( = ?auto_671528 ?auto_671531 ) ) ( not ( = ?auto_671528 ?auto_671532 ) ) ( not ( = ?auto_671528 ?auto_671533 ) ) ( not ( = ?auto_671528 ?auto_671534 ) ) ( not ( = ?auto_671528 ?auto_671535 ) ) ( not ( = ?auto_671528 ?auto_671536 ) ) ( not ( = ?auto_671528 ?auto_671537 ) ) ( not ( = ?auto_671529 ?auto_671530 ) ) ( not ( = ?auto_671529 ?auto_671531 ) ) ( not ( = ?auto_671529 ?auto_671532 ) ) ( not ( = ?auto_671529 ?auto_671533 ) ) ( not ( = ?auto_671529 ?auto_671534 ) ) ( not ( = ?auto_671529 ?auto_671535 ) ) ( not ( = ?auto_671529 ?auto_671536 ) ) ( not ( = ?auto_671529 ?auto_671537 ) ) ( not ( = ?auto_671530 ?auto_671531 ) ) ( not ( = ?auto_671530 ?auto_671532 ) ) ( not ( = ?auto_671530 ?auto_671533 ) ) ( not ( = ?auto_671530 ?auto_671534 ) ) ( not ( = ?auto_671530 ?auto_671535 ) ) ( not ( = ?auto_671530 ?auto_671536 ) ) ( not ( = ?auto_671530 ?auto_671537 ) ) ( not ( = ?auto_671531 ?auto_671532 ) ) ( not ( = ?auto_671531 ?auto_671533 ) ) ( not ( = ?auto_671531 ?auto_671534 ) ) ( not ( = ?auto_671531 ?auto_671535 ) ) ( not ( = ?auto_671531 ?auto_671536 ) ) ( not ( = ?auto_671531 ?auto_671537 ) ) ( not ( = ?auto_671532 ?auto_671533 ) ) ( not ( = ?auto_671532 ?auto_671534 ) ) ( not ( = ?auto_671532 ?auto_671535 ) ) ( not ( = ?auto_671532 ?auto_671536 ) ) ( not ( = ?auto_671532 ?auto_671537 ) ) ( not ( = ?auto_671533 ?auto_671534 ) ) ( not ( = ?auto_671533 ?auto_671535 ) ) ( not ( = ?auto_671533 ?auto_671536 ) ) ( not ( = ?auto_671533 ?auto_671537 ) ) ( not ( = ?auto_671534 ?auto_671535 ) ) ( not ( = ?auto_671534 ?auto_671536 ) ) ( not ( = ?auto_671534 ?auto_671537 ) ) ( not ( = ?auto_671535 ?auto_671536 ) ) ( not ( = ?auto_671535 ?auto_671537 ) ) ( not ( = ?auto_671536 ?auto_671537 ) ) ( ON ?auto_671535 ?auto_671536 ) ( ON ?auto_671534 ?auto_671535 ) ( CLEAR ?auto_671532 ) ( ON ?auto_671533 ?auto_671534 ) ( CLEAR ?auto_671533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_671520 ?auto_671521 ?auto_671522 ?auto_671523 ?auto_671524 ?auto_671525 ?auto_671526 ?auto_671527 ?auto_671528 ?auto_671529 ?auto_671530 ?auto_671531 ?auto_671532 ?auto_671533 )
      ( MAKE-17PILE ?auto_671520 ?auto_671521 ?auto_671522 ?auto_671523 ?auto_671524 ?auto_671525 ?auto_671526 ?auto_671527 ?auto_671528 ?auto_671529 ?auto_671530 ?auto_671531 ?auto_671532 ?auto_671533 ?auto_671534 ?auto_671535 ?auto_671536 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671555 - BLOCK
      ?auto_671556 - BLOCK
      ?auto_671557 - BLOCK
      ?auto_671558 - BLOCK
      ?auto_671559 - BLOCK
      ?auto_671560 - BLOCK
      ?auto_671561 - BLOCK
      ?auto_671562 - BLOCK
      ?auto_671563 - BLOCK
      ?auto_671564 - BLOCK
      ?auto_671565 - BLOCK
      ?auto_671566 - BLOCK
      ?auto_671567 - BLOCK
      ?auto_671568 - BLOCK
      ?auto_671569 - BLOCK
      ?auto_671570 - BLOCK
      ?auto_671571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671571 ) ( ON-TABLE ?auto_671555 ) ( ON ?auto_671556 ?auto_671555 ) ( ON ?auto_671557 ?auto_671556 ) ( ON ?auto_671558 ?auto_671557 ) ( ON ?auto_671559 ?auto_671558 ) ( ON ?auto_671560 ?auto_671559 ) ( ON ?auto_671561 ?auto_671560 ) ( ON ?auto_671562 ?auto_671561 ) ( ON ?auto_671563 ?auto_671562 ) ( ON ?auto_671564 ?auto_671563 ) ( ON ?auto_671565 ?auto_671564 ) ( ON ?auto_671566 ?auto_671565 ) ( ON ?auto_671567 ?auto_671566 ) ( not ( = ?auto_671555 ?auto_671556 ) ) ( not ( = ?auto_671555 ?auto_671557 ) ) ( not ( = ?auto_671555 ?auto_671558 ) ) ( not ( = ?auto_671555 ?auto_671559 ) ) ( not ( = ?auto_671555 ?auto_671560 ) ) ( not ( = ?auto_671555 ?auto_671561 ) ) ( not ( = ?auto_671555 ?auto_671562 ) ) ( not ( = ?auto_671555 ?auto_671563 ) ) ( not ( = ?auto_671555 ?auto_671564 ) ) ( not ( = ?auto_671555 ?auto_671565 ) ) ( not ( = ?auto_671555 ?auto_671566 ) ) ( not ( = ?auto_671555 ?auto_671567 ) ) ( not ( = ?auto_671555 ?auto_671568 ) ) ( not ( = ?auto_671555 ?auto_671569 ) ) ( not ( = ?auto_671555 ?auto_671570 ) ) ( not ( = ?auto_671555 ?auto_671571 ) ) ( not ( = ?auto_671556 ?auto_671557 ) ) ( not ( = ?auto_671556 ?auto_671558 ) ) ( not ( = ?auto_671556 ?auto_671559 ) ) ( not ( = ?auto_671556 ?auto_671560 ) ) ( not ( = ?auto_671556 ?auto_671561 ) ) ( not ( = ?auto_671556 ?auto_671562 ) ) ( not ( = ?auto_671556 ?auto_671563 ) ) ( not ( = ?auto_671556 ?auto_671564 ) ) ( not ( = ?auto_671556 ?auto_671565 ) ) ( not ( = ?auto_671556 ?auto_671566 ) ) ( not ( = ?auto_671556 ?auto_671567 ) ) ( not ( = ?auto_671556 ?auto_671568 ) ) ( not ( = ?auto_671556 ?auto_671569 ) ) ( not ( = ?auto_671556 ?auto_671570 ) ) ( not ( = ?auto_671556 ?auto_671571 ) ) ( not ( = ?auto_671557 ?auto_671558 ) ) ( not ( = ?auto_671557 ?auto_671559 ) ) ( not ( = ?auto_671557 ?auto_671560 ) ) ( not ( = ?auto_671557 ?auto_671561 ) ) ( not ( = ?auto_671557 ?auto_671562 ) ) ( not ( = ?auto_671557 ?auto_671563 ) ) ( not ( = ?auto_671557 ?auto_671564 ) ) ( not ( = ?auto_671557 ?auto_671565 ) ) ( not ( = ?auto_671557 ?auto_671566 ) ) ( not ( = ?auto_671557 ?auto_671567 ) ) ( not ( = ?auto_671557 ?auto_671568 ) ) ( not ( = ?auto_671557 ?auto_671569 ) ) ( not ( = ?auto_671557 ?auto_671570 ) ) ( not ( = ?auto_671557 ?auto_671571 ) ) ( not ( = ?auto_671558 ?auto_671559 ) ) ( not ( = ?auto_671558 ?auto_671560 ) ) ( not ( = ?auto_671558 ?auto_671561 ) ) ( not ( = ?auto_671558 ?auto_671562 ) ) ( not ( = ?auto_671558 ?auto_671563 ) ) ( not ( = ?auto_671558 ?auto_671564 ) ) ( not ( = ?auto_671558 ?auto_671565 ) ) ( not ( = ?auto_671558 ?auto_671566 ) ) ( not ( = ?auto_671558 ?auto_671567 ) ) ( not ( = ?auto_671558 ?auto_671568 ) ) ( not ( = ?auto_671558 ?auto_671569 ) ) ( not ( = ?auto_671558 ?auto_671570 ) ) ( not ( = ?auto_671558 ?auto_671571 ) ) ( not ( = ?auto_671559 ?auto_671560 ) ) ( not ( = ?auto_671559 ?auto_671561 ) ) ( not ( = ?auto_671559 ?auto_671562 ) ) ( not ( = ?auto_671559 ?auto_671563 ) ) ( not ( = ?auto_671559 ?auto_671564 ) ) ( not ( = ?auto_671559 ?auto_671565 ) ) ( not ( = ?auto_671559 ?auto_671566 ) ) ( not ( = ?auto_671559 ?auto_671567 ) ) ( not ( = ?auto_671559 ?auto_671568 ) ) ( not ( = ?auto_671559 ?auto_671569 ) ) ( not ( = ?auto_671559 ?auto_671570 ) ) ( not ( = ?auto_671559 ?auto_671571 ) ) ( not ( = ?auto_671560 ?auto_671561 ) ) ( not ( = ?auto_671560 ?auto_671562 ) ) ( not ( = ?auto_671560 ?auto_671563 ) ) ( not ( = ?auto_671560 ?auto_671564 ) ) ( not ( = ?auto_671560 ?auto_671565 ) ) ( not ( = ?auto_671560 ?auto_671566 ) ) ( not ( = ?auto_671560 ?auto_671567 ) ) ( not ( = ?auto_671560 ?auto_671568 ) ) ( not ( = ?auto_671560 ?auto_671569 ) ) ( not ( = ?auto_671560 ?auto_671570 ) ) ( not ( = ?auto_671560 ?auto_671571 ) ) ( not ( = ?auto_671561 ?auto_671562 ) ) ( not ( = ?auto_671561 ?auto_671563 ) ) ( not ( = ?auto_671561 ?auto_671564 ) ) ( not ( = ?auto_671561 ?auto_671565 ) ) ( not ( = ?auto_671561 ?auto_671566 ) ) ( not ( = ?auto_671561 ?auto_671567 ) ) ( not ( = ?auto_671561 ?auto_671568 ) ) ( not ( = ?auto_671561 ?auto_671569 ) ) ( not ( = ?auto_671561 ?auto_671570 ) ) ( not ( = ?auto_671561 ?auto_671571 ) ) ( not ( = ?auto_671562 ?auto_671563 ) ) ( not ( = ?auto_671562 ?auto_671564 ) ) ( not ( = ?auto_671562 ?auto_671565 ) ) ( not ( = ?auto_671562 ?auto_671566 ) ) ( not ( = ?auto_671562 ?auto_671567 ) ) ( not ( = ?auto_671562 ?auto_671568 ) ) ( not ( = ?auto_671562 ?auto_671569 ) ) ( not ( = ?auto_671562 ?auto_671570 ) ) ( not ( = ?auto_671562 ?auto_671571 ) ) ( not ( = ?auto_671563 ?auto_671564 ) ) ( not ( = ?auto_671563 ?auto_671565 ) ) ( not ( = ?auto_671563 ?auto_671566 ) ) ( not ( = ?auto_671563 ?auto_671567 ) ) ( not ( = ?auto_671563 ?auto_671568 ) ) ( not ( = ?auto_671563 ?auto_671569 ) ) ( not ( = ?auto_671563 ?auto_671570 ) ) ( not ( = ?auto_671563 ?auto_671571 ) ) ( not ( = ?auto_671564 ?auto_671565 ) ) ( not ( = ?auto_671564 ?auto_671566 ) ) ( not ( = ?auto_671564 ?auto_671567 ) ) ( not ( = ?auto_671564 ?auto_671568 ) ) ( not ( = ?auto_671564 ?auto_671569 ) ) ( not ( = ?auto_671564 ?auto_671570 ) ) ( not ( = ?auto_671564 ?auto_671571 ) ) ( not ( = ?auto_671565 ?auto_671566 ) ) ( not ( = ?auto_671565 ?auto_671567 ) ) ( not ( = ?auto_671565 ?auto_671568 ) ) ( not ( = ?auto_671565 ?auto_671569 ) ) ( not ( = ?auto_671565 ?auto_671570 ) ) ( not ( = ?auto_671565 ?auto_671571 ) ) ( not ( = ?auto_671566 ?auto_671567 ) ) ( not ( = ?auto_671566 ?auto_671568 ) ) ( not ( = ?auto_671566 ?auto_671569 ) ) ( not ( = ?auto_671566 ?auto_671570 ) ) ( not ( = ?auto_671566 ?auto_671571 ) ) ( not ( = ?auto_671567 ?auto_671568 ) ) ( not ( = ?auto_671567 ?auto_671569 ) ) ( not ( = ?auto_671567 ?auto_671570 ) ) ( not ( = ?auto_671567 ?auto_671571 ) ) ( not ( = ?auto_671568 ?auto_671569 ) ) ( not ( = ?auto_671568 ?auto_671570 ) ) ( not ( = ?auto_671568 ?auto_671571 ) ) ( not ( = ?auto_671569 ?auto_671570 ) ) ( not ( = ?auto_671569 ?auto_671571 ) ) ( not ( = ?auto_671570 ?auto_671571 ) ) ( ON ?auto_671570 ?auto_671571 ) ( ON ?auto_671569 ?auto_671570 ) ( CLEAR ?auto_671567 ) ( ON ?auto_671568 ?auto_671569 ) ( CLEAR ?auto_671568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_671555 ?auto_671556 ?auto_671557 ?auto_671558 ?auto_671559 ?auto_671560 ?auto_671561 ?auto_671562 ?auto_671563 ?auto_671564 ?auto_671565 ?auto_671566 ?auto_671567 ?auto_671568 )
      ( MAKE-17PILE ?auto_671555 ?auto_671556 ?auto_671557 ?auto_671558 ?auto_671559 ?auto_671560 ?auto_671561 ?auto_671562 ?auto_671563 ?auto_671564 ?auto_671565 ?auto_671566 ?auto_671567 ?auto_671568 ?auto_671569 ?auto_671570 ?auto_671571 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671589 - BLOCK
      ?auto_671590 - BLOCK
      ?auto_671591 - BLOCK
      ?auto_671592 - BLOCK
      ?auto_671593 - BLOCK
      ?auto_671594 - BLOCK
      ?auto_671595 - BLOCK
      ?auto_671596 - BLOCK
      ?auto_671597 - BLOCK
      ?auto_671598 - BLOCK
      ?auto_671599 - BLOCK
      ?auto_671600 - BLOCK
      ?auto_671601 - BLOCK
      ?auto_671602 - BLOCK
      ?auto_671603 - BLOCK
      ?auto_671604 - BLOCK
      ?auto_671605 - BLOCK
    )
    :vars
    (
      ?auto_671606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671605 ?auto_671606 ) ( ON-TABLE ?auto_671589 ) ( ON ?auto_671590 ?auto_671589 ) ( ON ?auto_671591 ?auto_671590 ) ( ON ?auto_671592 ?auto_671591 ) ( ON ?auto_671593 ?auto_671592 ) ( ON ?auto_671594 ?auto_671593 ) ( ON ?auto_671595 ?auto_671594 ) ( ON ?auto_671596 ?auto_671595 ) ( ON ?auto_671597 ?auto_671596 ) ( ON ?auto_671598 ?auto_671597 ) ( ON ?auto_671599 ?auto_671598 ) ( ON ?auto_671600 ?auto_671599 ) ( not ( = ?auto_671589 ?auto_671590 ) ) ( not ( = ?auto_671589 ?auto_671591 ) ) ( not ( = ?auto_671589 ?auto_671592 ) ) ( not ( = ?auto_671589 ?auto_671593 ) ) ( not ( = ?auto_671589 ?auto_671594 ) ) ( not ( = ?auto_671589 ?auto_671595 ) ) ( not ( = ?auto_671589 ?auto_671596 ) ) ( not ( = ?auto_671589 ?auto_671597 ) ) ( not ( = ?auto_671589 ?auto_671598 ) ) ( not ( = ?auto_671589 ?auto_671599 ) ) ( not ( = ?auto_671589 ?auto_671600 ) ) ( not ( = ?auto_671589 ?auto_671601 ) ) ( not ( = ?auto_671589 ?auto_671602 ) ) ( not ( = ?auto_671589 ?auto_671603 ) ) ( not ( = ?auto_671589 ?auto_671604 ) ) ( not ( = ?auto_671589 ?auto_671605 ) ) ( not ( = ?auto_671589 ?auto_671606 ) ) ( not ( = ?auto_671590 ?auto_671591 ) ) ( not ( = ?auto_671590 ?auto_671592 ) ) ( not ( = ?auto_671590 ?auto_671593 ) ) ( not ( = ?auto_671590 ?auto_671594 ) ) ( not ( = ?auto_671590 ?auto_671595 ) ) ( not ( = ?auto_671590 ?auto_671596 ) ) ( not ( = ?auto_671590 ?auto_671597 ) ) ( not ( = ?auto_671590 ?auto_671598 ) ) ( not ( = ?auto_671590 ?auto_671599 ) ) ( not ( = ?auto_671590 ?auto_671600 ) ) ( not ( = ?auto_671590 ?auto_671601 ) ) ( not ( = ?auto_671590 ?auto_671602 ) ) ( not ( = ?auto_671590 ?auto_671603 ) ) ( not ( = ?auto_671590 ?auto_671604 ) ) ( not ( = ?auto_671590 ?auto_671605 ) ) ( not ( = ?auto_671590 ?auto_671606 ) ) ( not ( = ?auto_671591 ?auto_671592 ) ) ( not ( = ?auto_671591 ?auto_671593 ) ) ( not ( = ?auto_671591 ?auto_671594 ) ) ( not ( = ?auto_671591 ?auto_671595 ) ) ( not ( = ?auto_671591 ?auto_671596 ) ) ( not ( = ?auto_671591 ?auto_671597 ) ) ( not ( = ?auto_671591 ?auto_671598 ) ) ( not ( = ?auto_671591 ?auto_671599 ) ) ( not ( = ?auto_671591 ?auto_671600 ) ) ( not ( = ?auto_671591 ?auto_671601 ) ) ( not ( = ?auto_671591 ?auto_671602 ) ) ( not ( = ?auto_671591 ?auto_671603 ) ) ( not ( = ?auto_671591 ?auto_671604 ) ) ( not ( = ?auto_671591 ?auto_671605 ) ) ( not ( = ?auto_671591 ?auto_671606 ) ) ( not ( = ?auto_671592 ?auto_671593 ) ) ( not ( = ?auto_671592 ?auto_671594 ) ) ( not ( = ?auto_671592 ?auto_671595 ) ) ( not ( = ?auto_671592 ?auto_671596 ) ) ( not ( = ?auto_671592 ?auto_671597 ) ) ( not ( = ?auto_671592 ?auto_671598 ) ) ( not ( = ?auto_671592 ?auto_671599 ) ) ( not ( = ?auto_671592 ?auto_671600 ) ) ( not ( = ?auto_671592 ?auto_671601 ) ) ( not ( = ?auto_671592 ?auto_671602 ) ) ( not ( = ?auto_671592 ?auto_671603 ) ) ( not ( = ?auto_671592 ?auto_671604 ) ) ( not ( = ?auto_671592 ?auto_671605 ) ) ( not ( = ?auto_671592 ?auto_671606 ) ) ( not ( = ?auto_671593 ?auto_671594 ) ) ( not ( = ?auto_671593 ?auto_671595 ) ) ( not ( = ?auto_671593 ?auto_671596 ) ) ( not ( = ?auto_671593 ?auto_671597 ) ) ( not ( = ?auto_671593 ?auto_671598 ) ) ( not ( = ?auto_671593 ?auto_671599 ) ) ( not ( = ?auto_671593 ?auto_671600 ) ) ( not ( = ?auto_671593 ?auto_671601 ) ) ( not ( = ?auto_671593 ?auto_671602 ) ) ( not ( = ?auto_671593 ?auto_671603 ) ) ( not ( = ?auto_671593 ?auto_671604 ) ) ( not ( = ?auto_671593 ?auto_671605 ) ) ( not ( = ?auto_671593 ?auto_671606 ) ) ( not ( = ?auto_671594 ?auto_671595 ) ) ( not ( = ?auto_671594 ?auto_671596 ) ) ( not ( = ?auto_671594 ?auto_671597 ) ) ( not ( = ?auto_671594 ?auto_671598 ) ) ( not ( = ?auto_671594 ?auto_671599 ) ) ( not ( = ?auto_671594 ?auto_671600 ) ) ( not ( = ?auto_671594 ?auto_671601 ) ) ( not ( = ?auto_671594 ?auto_671602 ) ) ( not ( = ?auto_671594 ?auto_671603 ) ) ( not ( = ?auto_671594 ?auto_671604 ) ) ( not ( = ?auto_671594 ?auto_671605 ) ) ( not ( = ?auto_671594 ?auto_671606 ) ) ( not ( = ?auto_671595 ?auto_671596 ) ) ( not ( = ?auto_671595 ?auto_671597 ) ) ( not ( = ?auto_671595 ?auto_671598 ) ) ( not ( = ?auto_671595 ?auto_671599 ) ) ( not ( = ?auto_671595 ?auto_671600 ) ) ( not ( = ?auto_671595 ?auto_671601 ) ) ( not ( = ?auto_671595 ?auto_671602 ) ) ( not ( = ?auto_671595 ?auto_671603 ) ) ( not ( = ?auto_671595 ?auto_671604 ) ) ( not ( = ?auto_671595 ?auto_671605 ) ) ( not ( = ?auto_671595 ?auto_671606 ) ) ( not ( = ?auto_671596 ?auto_671597 ) ) ( not ( = ?auto_671596 ?auto_671598 ) ) ( not ( = ?auto_671596 ?auto_671599 ) ) ( not ( = ?auto_671596 ?auto_671600 ) ) ( not ( = ?auto_671596 ?auto_671601 ) ) ( not ( = ?auto_671596 ?auto_671602 ) ) ( not ( = ?auto_671596 ?auto_671603 ) ) ( not ( = ?auto_671596 ?auto_671604 ) ) ( not ( = ?auto_671596 ?auto_671605 ) ) ( not ( = ?auto_671596 ?auto_671606 ) ) ( not ( = ?auto_671597 ?auto_671598 ) ) ( not ( = ?auto_671597 ?auto_671599 ) ) ( not ( = ?auto_671597 ?auto_671600 ) ) ( not ( = ?auto_671597 ?auto_671601 ) ) ( not ( = ?auto_671597 ?auto_671602 ) ) ( not ( = ?auto_671597 ?auto_671603 ) ) ( not ( = ?auto_671597 ?auto_671604 ) ) ( not ( = ?auto_671597 ?auto_671605 ) ) ( not ( = ?auto_671597 ?auto_671606 ) ) ( not ( = ?auto_671598 ?auto_671599 ) ) ( not ( = ?auto_671598 ?auto_671600 ) ) ( not ( = ?auto_671598 ?auto_671601 ) ) ( not ( = ?auto_671598 ?auto_671602 ) ) ( not ( = ?auto_671598 ?auto_671603 ) ) ( not ( = ?auto_671598 ?auto_671604 ) ) ( not ( = ?auto_671598 ?auto_671605 ) ) ( not ( = ?auto_671598 ?auto_671606 ) ) ( not ( = ?auto_671599 ?auto_671600 ) ) ( not ( = ?auto_671599 ?auto_671601 ) ) ( not ( = ?auto_671599 ?auto_671602 ) ) ( not ( = ?auto_671599 ?auto_671603 ) ) ( not ( = ?auto_671599 ?auto_671604 ) ) ( not ( = ?auto_671599 ?auto_671605 ) ) ( not ( = ?auto_671599 ?auto_671606 ) ) ( not ( = ?auto_671600 ?auto_671601 ) ) ( not ( = ?auto_671600 ?auto_671602 ) ) ( not ( = ?auto_671600 ?auto_671603 ) ) ( not ( = ?auto_671600 ?auto_671604 ) ) ( not ( = ?auto_671600 ?auto_671605 ) ) ( not ( = ?auto_671600 ?auto_671606 ) ) ( not ( = ?auto_671601 ?auto_671602 ) ) ( not ( = ?auto_671601 ?auto_671603 ) ) ( not ( = ?auto_671601 ?auto_671604 ) ) ( not ( = ?auto_671601 ?auto_671605 ) ) ( not ( = ?auto_671601 ?auto_671606 ) ) ( not ( = ?auto_671602 ?auto_671603 ) ) ( not ( = ?auto_671602 ?auto_671604 ) ) ( not ( = ?auto_671602 ?auto_671605 ) ) ( not ( = ?auto_671602 ?auto_671606 ) ) ( not ( = ?auto_671603 ?auto_671604 ) ) ( not ( = ?auto_671603 ?auto_671605 ) ) ( not ( = ?auto_671603 ?auto_671606 ) ) ( not ( = ?auto_671604 ?auto_671605 ) ) ( not ( = ?auto_671604 ?auto_671606 ) ) ( not ( = ?auto_671605 ?auto_671606 ) ) ( ON ?auto_671604 ?auto_671605 ) ( ON ?auto_671603 ?auto_671604 ) ( ON ?auto_671602 ?auto_671603 ) ( CLEAR ?auto_671600 ) ( ON ?auto_671601 ?auto_671602 ) ( CLEAR ?auto_671601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_671589 ?auto_671590 ?auto_671591 ?auto_671592 ?auto_671593 ?auto_671594 ?auto_671595 ?auto_671596 ?auto_671597 ?auto_671598 ?auto_671599 ?auto_671600 ?auto_671601 )
      ( MAKE-17PILE ?auto_671589 ?auto_671590 ?auto_671591 ?auto_671592 ?auto_671593 ?auto_671594 ?auto_671595 ?auto_671596 ?auto_671597 ?auto_671598 ?auto_671599 ?auto_671600 ?auto_671601 ?auto_671602 ?auto_671603 ?auto_671604 ?auto_671605 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671624 - BLOCK
      ?auto_671625 - BLOCK
      ?auto_671626 - BLOCK
      ?auto_671627 - BLOCK
      ?auto_671628 - BLOCK
      ?auto_671629 - BLOCK
      ?auto_671630 - BLOCK
      ?auto_671631 - BLOCK
      ?auto_671632 - BLOCK
      ?auto_671633 - BLOCK
      ?auto_671634 - BLOCK
      ?auto_671635 - BLOCK
      ?auto_671636 - BLOCK
      ?auto_671637 - BLOCK
      ?auto_671638 - BLOCK
      ?auto_671639 - BLOCK
      ?auto_671640 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671640 ) ( ON-TABLE ?auto_671624 ) ( ON ?auto_671625 ?auto_671624 ) ( ON ?auto_671626 ?auto_671625 ) ( ON ?auto_671627 ?auto_671626 ) ( ON ?auto_671628 ?auto_671627 ) ( ON ?auto_671629 ?auto_671628 ) ( ON ?auto_671630 ?auto_671629 ) ( ON ?auto_671631 ?auto_671630 ) ( ON ?auto_671632 ?auto_671631 ) ( ON ?auto_671633 ?auto_671632 ) ( ON ?auto_671634 ?auto_671633 ) ( ON ?auto_671635 ?auto_671634 ) ( not ( = ?auto_671624 ?auto_671625 ) ) ( not ( = ?auto_671624 ?auto_671626 ) ) ( not ( = ?auto_671624 ?auto_671627 ) ) ( not ( = ?auto_671624 ?auto_671628 ) ) ( not ( = ?auto_671624 ?auto_671629 ) ) ( not ( = ?auto_671624 ?auto_671630 ) ) ( not ( = ?auto_671624 ?auto_671631 ) ) ( not ( = ?auto_671624 ?auto_671632 ) ) ( not ( = ?auto_671624 ?auto_671633 ) ) ( not ( = ?auto_671624 ?auto_671634 ) ) ( not ( = ?auto_671624 ?auto_671635 ) ) ( not ( = ?auto_671624 ?auto_671636 ) ) ( not ( = ?auto_671624 ?auto_671637 ) ) ( not ( = ?auto_671624 ?auto_671638 ) ) ( not ( = ?auto_671624 ?auto_671639 ) ) ( not ( = ?auto_671624 ?auto_671640 ) ) ( not ( = ?auto_671625 ?auto_671626 ) ) ( not ( = ?auto_671625 ?auto_671627 ) ) ( not ( = ?auto_671625 ?auto_671628 ) ) ( not ( = ?auto_671625 ?auto_671629 ) ) ( not ( = ?auto_671625 ?auto_671630 ) ) ( not ( = ?auto_671625 ?auto_671631 ) ) ( not ( = ?auto_671625 ?auto_671632 ) ) ( not ( = ?auto_671625 ?auto_671633 ) ) ( not ( = ?auto_671625 ?auto_671634 ) ) ( not ( = ?auto_671625 ?auto_671635 ) ) ( not ( = ?auto_671625 ?auto_671636 ) ) ( not ( = ?auto_671625 ?auto_671637 ) ) ( not ( = ?auto_671625 ?auto_671638 ) ) ( not ( = ?auto_671625 ?auto_671639 ) ) ( not ( = ?auto_671625 ?auto_671640 ) ) ( not ( = ?auto_671626 ?auto_671627 ) ) ( not ( = ?auto_671626 ?auto_671628 ) ) ( not ( = ?auto_671626 ?auto_671629 ) ) ( not ( = ?auto_671626 ?auto_671630 ) ) ( not ( = ?auto_671626 ?auto_671631 ) ) ( not ( = ?auto_671626 ?auto_671632 ) ) ( not ( = ?auto_671626 ?auto_671633 ) ) ( not ( = ?auto_671626 ?auto_671634 ) ) ( not ( = ?auto_671626 ?auto_671635 ) ) ( not ( = ?auto_671626 ?auto_671636 ) ) ( not ( = ?auto_671626 ?auto_671637 ) ) ( not ( = ?auto_671626 ?auto_671638 ) ) ( not ( = ?auto_671626 ?auto_671639 ) ) ( not ( = ?auto_671626 ?auto_671640 ) ) ( not ( = ?auto_671627 ?auto_671628 ) ) ( not ( = ?auto_671627 ?auto_671629 ) ) ( not ( = ?auto_671627 ?auto_671630 ) ) ( not ( = ?auto_671627 ?auto_671631 ) ) ( not ( = ?auto_671627 ?auto_671632 ) ) ( not ( = ?auto_671627 ?auto_671633 ) ) ( not ( = ?auto_671627 ?auto_671634 ) ) ( not ( = ?auto_671627 ?auto_671635 ) ) ( not ( = ?auto_671627 ?auto_671636 ) ) ( not ( = ?auto_671627 ?auto_671637 ) ) ( not ( = ?auto_671627 ?auto_671638 ) ) ( not ( = ?auto_671627 ?auto_671639 ) ) ( not ( = ?auto_671627 ?auto_671640 ) ) ( not ( = ?auto_671628 ?auto_671629 ) ) ( not ( = ?auto_671628 ?auto_671630 ) ) ( not ( = ?auto_671628 ?auto_671631 ) ) ( not ( = ?auto_671628 ?auto_671632 ) ) ( not ( = ?auto_671628 ?auto_671633 ) ) ( not ( = ?auto_671628 ?auto_671634 ) ) ( not ( = ?auto_671628 ?auto_671635 ) ) ( not ( = ?auto_671628 ?auto_671636 ) ) ( not ( = ?auto_671628 ?auto_671637 ) ) ( not ( = ?auto_671628 ?auto_671638 ) ) ( not ( = ?auto_671628 ?auto_671639 ) ) ( not ( = ?auto_671628 ?auto_671640 ) ) ( not ( = ?auto_671629 ?auto_671630 ) ) ( not ( = ?auto_671629 ?auto_671631 ) ) ( not ( = ?auto_671629 ?auto_671632 ) ) ( not ( = ?auto_671629 ?auto_671633 ) ) ( not ( = ?auto_671629 ?auto_671634 ) ) ( not ( = ?auto_671629 ?auto_671635 ) ) ( not ( = ?auto_671629 ?auto_671636 ) ) ( not ( = ?auto_671629 ?auto_671637 ) ) ( not ( = ?auto_671629 ?auto_671638 ) ) ( not ( = ?auto_671629 ?auto_671639 ) ) ( not ( = ?auto_671629 ?auto_671640 ) ) ( not ( = ?auto_671630 ?auto_671631 ) ) ( not ( = ?auto_671630 ?auto_671632 ) ) ( not ( = ?auto_671630 ?auto_671633 ) ) ( not ( = ?auto_671630 ?auto_671634 ) ) ( not ( = ?auto_671630 ?auto_671635 ) ) ( not ( = ?auto_671630 ?auto_671636 ) ) ( not ( = ?auto_671630 ?auto_671637 ) ) ( not ( = ?auto_671630 ?auto_671638 ) ) ( not ( = ?auto_671630 ?auto_671639 ) ) ( not ( = ?auto_671630 ?auto_671640 ) ) ( not ( = ?auto_671631 ?auto_671632 ) ) ( not ( = ?auto_671631 ?auto_671633 ) ) ( not ( = ?auto_671631 ?auto_671634 ) ) ( not ( = ?auto_671631 ?auto_671635 ) ) ( not ( = ?auto_671631 ?auto_671636 ) ) ( not ( = ?auto_671631 ?auto_671637 ) ) ( not ( = ?auto_671631 ?auto_671638 ) ) ( not ( = ?auto_671631 ?auto_671639 ) ) ( not ( = ?auto_671631 ?auto_671640 ) ) ( not ( = ?auto_671632 ?auto_671633 ) ) ( not ( = ?auto_671632 ?auto_671634 ) ) ( not ( = ?auto_671632 ?auto_671635 ) ) ( not ( = ?auto_671632 ?auto_671636 ) ) ( not ( = ?auto_671632 ?auto_671637 ) ) ( not ( = ?auto_671632 ?auto_671638 ) ) ( not ( = ?auto_671632 ?auto_671639 ) ) ( not ( = ?auto_671632 ?auto_671640 ) ) ( not ( = ?auto_671633 ?auto_671634 ) ) ( not ( = ?auto_671633 ?auto_671635 ) ) ( not ( = ?auto_671633 ?auto_671636 ) ) ( not ( = ?auto_671633 ?auto_671637 ) ) ( not ( = ?auto_671633 ?auto_671638 ) ) ( not ( = ?auto_671633 ?auto_671639 ) ) ( not ( = ?auto_671633 ?auto_671640 ) ) ( not ( = ?auto_671634 ?auto_671635 ) ) ( not ( = ?auto_671634 ?auto_671636 ) ) ( not ( = ?auto_671634 ?auto_671637 ) ) ( not ( = ?auto_671634 ?auto_671638 ) ) ( not ( = ?auto_671634 ?auto_671639 ) ) ( not ( = ?auto_671634 ?auto_671640 ) ) ( not ( = ?auto_671635 ?auto_671636 ) ) ( not ( = ?auto_671635 ?auto_671637 ) ) ( not ( = ?auto_671635 ?auto_671638 ) ) ( not ( = ?auto_671635 ?auto_671639 ) ) ( not ( = ?auto_671635 ?auto_671640 ) ) ( not ( = ?auto_671636 ?auto_671637 ) ) ( not ( = ?auto_671636 ?auto_671638 ) ) ( not ( = ?auto_671636 ?auto_671639 ) ) ( not ( = ?auto_671636 ?auto_671640 ) ) ( not ( = ?auto_671637 ?auto_671638 ) ) ( not ( = ?auto_671637 ?auto_671639 ) ) ( not ( = ?auto_671637 ?auto_671640 ) ) ( not ( = ?auto_671638 ?auto_671639 ) ) ( not ( = ?auto_671638 ?auto_671640 ) ) ( not ( = ?auto_671639 ?auto_671640 ) ) ( ON ?auto_671639 ?auto_671640 ) ( ON ?auto_671638 ?auto_671639 ) ( ON ?auto_671637 ?auto_671638 ) ( CLEAR ?auto_671635 ) ( ON ?auto_671636 ?auto_671637 ) ( CLEAR ?auto_671636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_671624 ?auto_671625 ?auto_671626 ?auto_671627 ?auto_671628 ?auto_671629 ?auto_671630 ?auto_671631 ?auto_671632 ?auto_671633 ?auto_671634 ?auto_671635 ?auto_671636 )
      ( MAKE-17PILE ?auto_671624 ?auto_671625 ?auto_671626 ?auto_671627 ?auto_671628 ?auto_671629 ?auto_671630 ?auto_671631 ?auto_671632 ?auto_671633 ?auto_671634 ?auto_671635 ?auto_671636 ?auto_671637 ?auto_671638 ?auto_671639 ?auto_671640 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671658 - BLOCK
      ?auto_671659 - BLOCK
      ?auto_671660 - BLOCK
      ?auto_671661 - BLOCK
      ?auto_671662 - BLOCK
      ?auto_671663 - BLOCK
      ?auto_671664 - BLOCK
      ?auto_671665 - BLOCK
      ?auto_671666 - BLOCK
      ?auto_671667 - BLOCK
      ?auto_671668 - BLOCK
      ?auto_671669 - BLOCK
      ?auto_671670 - BLOCK
      ?auto_671671 - BLOCK
      ?auto_671672 - BLOCK
      ?auto_671673 - BLOCK
      ?auto_671674 - BLOCK
    )
    :vars
    (
      ?auto_671675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671674 ?auto_671675 ) ( ON-TABLE ?auto_671658 ) ( ON ?auto_671659 ?auto_671658 ) ( ON ?auto_671660 ?auto_671659 ) ( ON ?auto_671661 ?auto_671660 ) ( ON ?auto_671662 ?auto_671661 ) ( ON ?auto_671663 ?auto_671662 ) ( ON ?auto_671664 ?auto_671663 ) ( ON ?auto_671665 ?auto_671664 ) ( ON ?auto_671666 ?auto_671665 ) ( ON ?auto_671667 ?auto_671666 ) ( ON ?auto_671668 ?auto_671667 ) ( not ( = ?auto_671658 ?auto_671659 ) ) ( not ( = ?auto_671658 ?auto_671660 ) ) ( not ( = ?auto_671658 ?auto_671661 ) ) ( not ( = ?auto_671658 ?auto_671662 ) ) ( not ( = ?auto_671658 ?auto_671663 ) ) ( not ( = ?auto_671658 ?auto_671664 ) ) ( not ( = ?auto_671658 ?auto_671665 ) ) ( not ( = ?auto_671658 ?auto_671666 ) ) ( not ( = ?auto_671658 ?auto_671667 ) ) ( not ( = ?auto_671658 ?auto_671668 ) ) ( not ( = ?auto_671658 ?auto_671669 ) ) ( not ( = ?auto_671658 ?auto_671670 ) ) ( not ( = ?auto_671658 ?auto_671671 ) ) ( not ( = ?auto_671658 ?auto_671672 ) ) ( not ( = ?auto_671658 ?auto_671673 ) ) ( not ( = ?auto_671658 ?auto_671674 ) ) ( not ( = ?auto_671658 ?auto_671675 ) ) ( not ( = ?auto_671659 ?auto_671660 ) ) ( not ( = ?auto_671659 ?auto_671661 ) ) ( not ( = ?auto_671659 ?auto_671662 ) ) ( not ( = ?auto_671659 ?auto_671663 ) ) ( not ( = ?auto_671659 ?auto_671664 ) ) ( not ( = ?auto_671659 ?auto_671665 ) ) ( not ( = ?auto_671659 ?auto_671666 ) ) ( not ( = ?auto_671659 ?auto_671667 ) ) ( not ( = ?auto_671659 ?auto_671668 ) ) ( not ( = ?auto_671659 ?auto_671669 ) ) ( not ( = ?auto_671659 ?auto_671670 ) ) ( not ( = ?auto_671659 ?auto_671671 ) ) ( not ( = ?auto_671659 ?auto_671672 ) ) ( not ( = ?auto_671659 ?auto_671673 ) ) ( not ( = ?auto_671659 ?auto_671674 ) ) ( not ( = ?auto_671659 ?auto_671675 ) ) ( not ( = ?auto_671660 ?auto_671661 ) ) ( not ( = ?auto_671660 ?auto_671662 ) ) ( not ( = ?auto_671660 ?auto_671663 ) ) ( not ( = ?auto_671660 ?auto_671664 ) ) ( not ( = ?auto_671660 ?auto_671665 ) ) ( not ( = ?auto_671660 ?auto_671666 ) ) ( not ( = ?auto_671660 ?auto_671667 ) ) ( not ( = ?auto_671660 ?auto_671668 ) ) ( not ( = ?auto_671660 ?auto_671669 ) ) ( not ( = ?auto_671660 ?auto_671670 ) ) ( not ( = ?auto_671660 ?auto_671671 ) ) ( not ( = ?auto_671660 ?auto_671672 ) ) ( not ( = ?auto_671660 ?auto_671673 ) ) ( not ( = ?auto_671660 ?auto_671674 ) ) ( not ( = ?auto_671660 ?auto_671675 ) ) ( not ( = ?auto_671661 ?auto_671662 ) ) ( not ( = ?auto_671661 ?auto_671663 ) ) ( not ( = ?auto_671661 ?auto_671664 ) ) ( not ( = ?auto_671661 ?auto_671665 ) ) ( not ( = ?auto_671661 ?auto_671666 ) ) ( not ( = ?auto_671661 ?auto_671667 ) ) ( not ( = ?auto_671661 ?auto_671668 ) ) ( not ( = ?auto_671661 ?auto_671669 ) ) ( not ( = ?auto_671661 ?auto_671670 ) ) ( not ( = ?auto_671661 ?auto_671671 ) ) ( not ( = ?auto_671661 ?auto_671672 ) ) ( not ( = ?auto_671661 ?auto_671673 ) ) ( not ( = ?auto_671661 ?auto_671674 ) ) ( not ( = ?auto_671661 ?auto_671675 ) ) ( not ( = ?auto_671662 ?auto_671663 ) ) ( not ( = ?auto_671662 ?auto_671664 ) ) ( not ( = ?auto_671662 ?auto_671665 ) ) ( not ( = ?auto_671662 ?auto_671666 ) ) ( not ( = ?auto_671662 ?auto_671667 ) ) ( not ( = ?auto_671662 ?auto_671668 ) ) ( not ( = ?auto_671662 ?auto_671669 ) ) ( not ( = ?auto_671662 ?auto_671670 ) ) ( not ( = ?auto_671662 ?auto_671671 ) ) ( not ( = ?auto_671662 ?auto_671672 ) ) ( not ( = ?auto_671662 ?auto_671673 ) ) ( not ( = ?auto_671662 ?auto_671674 ) ) ( not ( = ?auto_671662 ?auto_671675 ) ) ( not ( = ?auto_671663 ?auto_671664 ) ) ( not ( = ?auto_671663 ?auto_671665 ) ) ( not ( = ?auto_671663 ?auto_671666 ) ) ( not ( = ?auto_671663 ?auto_671667 ) ) ( not ( = ?auto_671663 ?auto_671668 ) ) ( not ( = ?auto_671663 ?auto_671669 ) ) ( not ( = ?auto_671663 ?auto_671670 ) ) ( not ( = ?auto_671663 ?auto_671671 ) ) ( not ( = ?auto_671663 ?auto_671672 ) ) ( not ( = ?auto_671663 ?auto_671673 ) ) ( not ( = ?auto_671663 ?auto_671674 ) ) ( not ( = ?auto_671663 ?auto_671675 ) ) ( not ( = ?auto_671664 ?auto_671665 ) ) ( not ( = ?auto_671664 ?auto_671666 ) ) ( not ( = ?auto_671664 ?auto_671667 ) ) ( not ( = ?auto_671664 ?auto_671668 ) ) ( not ( = ?auto_671664 ?auto_671669 ) ) ( not ( = ?auto_671664 ?auto_671670 ) ) ( not ( = ?auto_671664 ?auto_671671 ) ) ( not ( = ?auto_671664 ?auto_671672 ) ) ( not ( = ?auto_671664 ?auto_671673 ) ) ( not ( = ?auto_671664 ?auto_671674 ) ) ( not ( = ?auto_671664 ?auto_671675 ) ) ( not ( = ?auto_671665 ?auto_671666 ) ) ( not ( = ?auto_671665 ?auto_671667 ) ) ( not ( = ?auto_671665 ?auto_671668 ) ) ( not ( = ?auto_671665 ?auto_671669 ) ) ( not ( = ?auto_671665 ?auto_671670 ) ) ( not ( = ?auto_671665 ?auto_671671 ) ) ( not ( = ?auto_671665 ?auto_671672 ) ) ( not ( = ?auto_671665 ?auto_671673 ) ) ( not ( = ?auto_671665 ?auto_671674 ) ) ( not ( = ?auto_671665 ?auto_671675 ) ) ( not ( = ?auto_671666 ?auto_671667 ) ) ( not ( = ?auto_671666 ?auto_671668 ) ) ( not ( = ?auto_671666 ?auto_671669 ) ) ( not ( = ?auto_671666 ?auto_671670 ) ) ( not ( = ?auto_671666 ?auto_671671 ) ) ( not ( = ?auto_671666 ?auto_671672 ) ) ( not ( = ?auto_671666 ?auto_671673 ) ) ( not ( = ?auto_671666 ?auto_671674 ) ) ( not ( = ?auto_671666 ?auto_671675 ) ) ( not ( = ?auto_671667 ?auto_671668 ) ) ( not ( = ?auto_671667 ?auto_671669 ) ) ( not ( = ?auto_671667 ?auto_671670 ) ) ( not ( = ?auto_671667 ?auto_671671 ) ) ( not ( = ?auto_671667 ?auto_671672 ) ) ( not ( = ?auto_671667 ?auto_671673 ) ) ( not ( = ?auto_671667 ?auto_671674 ) ) ( not ( = ?auto_671667 ?auto_671675 ) ) ( not ( = ?auto_671668 ?auto_671669 ) ) ( not ( = ?auto_671668 ?auto_671670 ) ) ( not ( = ?auto_671668 ?auto_671671 ) ) ( not ( = ?auto_671668 ?auto_671672 ) ) ( not ( = ?auto_671668 ?auto_671673 ) ) ( not ( = ?auto_671668 ?auto_671674 ) ) ( not ( = ?auto_671668 ?auto_671675 ) ) ( not ( = ?auto_671669 ?auto_671670 ) ) ( not ( = ?auto_671669 ?auto_671671 ) ) ( not ( = ?auto_671669 ?auto_671672 ) ) ( not ( = ?auto_671669 ?auto_671673 ) ) ( not ( = ?auto_671669 ?auto_671674 ) ) ( not ( = ?auto_671669 ?auto_671675 ) ) ( not ( = ?auto_671670 ?auto_671671 ) ) ( not ( = ?auto_671670 ?auto_671672 ) ) ( not ( = ?auto_671670 ?auto_671673 ) ) ( not ( = ?auto_671670 ?auto_671674 ) ) ( not ( = ?auto_671670 ?auto_671675 ) ) ( not ( = ?auto_671671 ?auto_671672 ) ) ( not ( = ?auto_671671 ?auto_671673 ) ) ( not ( = ?auto_671671 ?auto_671674 ) ) ( not ( = ?auto_671671 ?auto_671675 ) ) ( not ( = ?auto_671672 ?auto_671673 ) ) ( not ( = ?auto_671672 ?auto_671674 ) ) ( not ( = ?auto_671672 ?auto_671675 ) ) ( not ( = ?auto_671673 ?auto_671674 ) ) ( not ( = ?auto_671673 ?auto_671675 ) ) ( not ( = ?auto_671674 ?auto_671675 ) ) ( ON ?auto_671673 ?auto_671674 ) ( ON ?auto_671672 ?auto_671673 ) ( ON ?auto_671671 ?auto_671672 ) ( ON ?auto_671670 ?auto_671671 ) ( CLEAR ?auto_671668 ) ( ON ?auto_671669 ?auto_671670 ) ( CLEAR ?auto_671669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_671658 ?auto_671659 ?auto_671660 ?auto_671661 ?auto_671662 ?auto_671663 ?auto_671664 ?auto_671665 ?auto_671666 ?auto_671667 ?auto_671668 ?auto_671669 )
      ( MAKE-17PILE ?auto_671658 ?auto_671659 ?auto_671660 ?auto_671661 ?auto_671662 ?auto_671663 ?auto_671664 ?auto_671665 ?auto_671666 ?auto_671667 ?auto_671668 ?auto_671669 ?auto_671670 ?auto_671671 ?auto_671672 ?auto_671673 ?auto_671674 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671693 - BLOCK
      ?auto_671694 - BLOCK
      ?auto_671695 - BLOCK
      ?auto_671696 - BLOCK
      ?auto_671697 - BLOCK
      ?auto_671698 - BLOCK
      ?auto_671699 - BLOCK
      ?auto_671700 - BLOCK
      ?auto_671701 - BLOCK
      ?auto_671702 - BLOCK
      ?auto_671703 - BLOCK
      ?auto_671704 - BLOCK
      ?auto_671705 - BLOCK
      ?auto_671706 - BLOCK
      ?auto_671707 - BLOCK
      ?auto_671708 - BLOCK
      ?auto_671709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671709 ) ( ON-TABLE ?auto_671693 ) ( ON ?auto_671694 ?auto_671693 ) ( ON ?auto_671695 ?auto_671694 ) ( ON ?auto_671696 ?auto_671695 ) ( ON ?auto_671697 ?auto_671696 ) ( ON ?auto_671698 ?auto_671697 ) ( ON ?auto_671699 ?auto_671698 ) ( ON ?auto_671700 ?auto_671699 ) ( ON ?auto_671701 ?auto_671700 ) ( ON ?auto_671702 ?auto_671701 ) ( ON ?auto_671703 ?auto_671702 ) ( not ( = ?auto_671693 ?auto_671694 ) ) ( not ( = ?auto_671693 ?auto_671695 ) ) ( not ( = ?auto_671693 ?auto_671696 ) ) ( not ( = ?auto_671693 ?auto_671697 ) ) ( not ( = ?auto_671693 ?auto_671698 ) ) ( not ( = ?auto_671693 ?auto_671699 ) ) ( not ( = ?auto_671693 ?auto_671700 ) ) ( not ( = ?auto_671693 ?auto_671701 ) ) ( not ( = ?auto_671693 ?auto_671702 ) ) ( not ( = ?auto_671693 ?auto_671703 ) ) ( not ( = ?auto_671693 ?auto_671704 ) ) ( not ( = ?auto_671693 ?auto_671705 ) ) ( not ( = ?auto_671693 ?auto_671706 ) ) ( not ( = ?auto_671693 ?auto_671707 ) ) ( not ( = ?auto_671693 ?auto_671708 ) ) ( not ( = ?auto_671693 ?auto_671709 ) ) ( not ( = ?auto_671694 ?auto_671695 ) ) ( not ( = ?auto_671694 ?auto_671696 ) ) ( not ( = ?auto_671694 ?auto_671697 ) ) ( not ( = ?auto_671694 ?auto_671698 ) ) ( not ( = ?auto_671694 ?auto_671699 ) ) ( not ( = ?auto_671694 ?auto_671700 ) ) ( not ( = ?auto_671694 ?auto_671701 ) ) ( not ( = ?auto_671694 ?auto_671702 ) ) ( not ( = ?auto_671694 ?auto_671703 ) ) ( not ( = ?auto_671694 ?auto_671704 ) ) ( not ( = ?auto_671694 ?auto_671705 ) ) ( not ( = ?auto_671694 ?auto_671706 ) ) ( not ( = ?auto_671694 ?auto_671707 ) ) ( not ( = ?auto_671694 ?auto_671708 ) ) ( not ( = ?auto_671694 ?auto_671709 ) ) ( not ( = ?auto_671695 ?auto_671696 ) ) ( not ( = ?auto_671695 ?auto_671697 ) ) ( not ( = ?auto_671695 ?auto_671698 ) ) ( not ( = ?auto_671695 ?auto_671699 ) ) ( not ( = ?auto_671695 ?auto_671700 ) ) ( not ( = ?auto_671695 ?auto_671701 ) ) ( not ( = ?auto_671695 ?auto_671702 ) ) ( not ( = ?auto_671695 ?auto_671703 ) ) ( not ( = ?auto_671695 ?auto_671704 ) ) ( not ( = ?auto_671695 ?auto_671705 ) ) ( not ( = ?auto_671695 ?auto_671706 ) ) ( not ( = ?auto_671695 ?auto_671707 ) ) ( not ( = ?auto_671695 ?auto_671708 ) ) ( not ( = ?auto_671695 ?auto_671709 ) ) ( not ( = ?auto_671696 ?auto_671697 ) ) ( not ( = ?auto_671696 ?auto_671698 ) ) ( not ( = ?auto_671696 ?auto_671699 ) ) ( not ( = ?auto_671696 ?auto_671700 ) ) ( not ( = ?auto_671696 ?auto_671701 ) ) ( not ( = ?auto_671696 ?auto_671702 ) ) ( not ( = ?auto_671696 ?auto_671703 ) ) ( not ( = ?auto_671696 ?auto_671704 ) ) ( not ( = ?auto_671696 ?auto_671705 ) ) ( not ( = ?auto_671696 ?auto_671706 ) ) ( not ( = ?auto_671696 ?auto_671707 ) ) ( not ( = ?auto_671696 ?auto_671708 ) ) ( not ( = ?auto_671696 ?auto_671709 ) ) ( not ( = ?auto_671697 ?auto_671698 ) ) ( not ( = ?auto_671697 ?auto_671699 ) ) ( not ( = ?auto_671697 ?auto_671700 ) ) ( not ( = ?auto_671697 ?auto_671701 ) ) ( not ( = ?auto_671697 ?auto_671702 ) ) ( not ( = ?auto_671697 ?auto_671703 ) ) ( not ( = ?auto_671697 ?auto_671704 ) ) ( not ( = ?auto_671697 ?auto_671705 ) ) ( not ( = ?auto_671697 ?auto_671706 ) ) ( not ( = ?auto_671697 ?auto_671707 ) ) ( not ( = ?auto_671697 ?auto_671708 ) ) ( not ( = ?auto_671697 ?auto_671709 ) ) ( not ( = ?auto_671698 ?auto_671699 ) ) ( not ( = ?auto_671698 ?auto_671700 ) ) ( not ( = ?auto_671698 ?auto_671701 ) ) ( not ( = ?auto_671698 ?auto_671702 ) ) ( not ( = ?auto_671698 ?auto_671703 ) ) ( not ( = ?auto_671698 ?auto_671704 ) ) ( not ( = ?auto_671698 ?auto_671705 ) ) ( not ( = ?auto_671698 ?auto_671706 ) ) ( not ( = ?auto_671698 ?auto_671707 ) ) ( not ( = ?auto_671698 ?auto_671708 ) ) ( not ( = ?auto_671698 ?auto_671709 ) ) ( not ( = ?auto_671699 ?auto_671700 ) ) ( not ( = ?auto_671699 ?auto_671701 ) ) ( not ( = ?auto_671699 ?auto_671702 ) ) ( not ( = ?auto_671699 ?auto_671703 ) ) ( not ( = ?auto_671699 ?auto_671704 ) ) ( not ( = ?auto_671699 ?auto_671705 ) ) ( not ( = ?auto_671699 ?auto_671706 ) ) ( not ( = ?auto_671699 ?auto_671707 ) ) ( not ( = ?auto_671699 ?auto_671708 ) ) ( not ( = ?auto_671699 ?auto_671709 ) ) ( not ( = ?auto_671700 ?auto_671701 ) ) ( not ( = ?auto_671700 ?auto_671702 ) ) ( not ( = ?auto_671700 ?auto_671703 ) ) ( not ( = ?auto_671700 ?auto_671704 ) ) ( not ( = ?auto_671700 ?auto_671705 ) ) ( not ( = ?auto_671700 ?auto_671706 ) ) ( not ( = ?auto_671700 ?auto_671707 ) ) ( not ( = ?auto_671700 ?auto_671708 ) ) ( not ( = ?auto_671700 ?auto_671709 ) ) ( not ( = ?auto_671701 ?auto_671702 ) ) ( not ( = ?auto_671701 ?auto_671703 ) ) ( not ( = ?auto_671701 ?auto_671704 ) ) ( not ( = ?auto_671701 ?auto_671705 ) ) ( not ( = ?auto_671701 ?auto_671706 ) ) ( not ( = ?auto_671701 ?auto_671707 ) ) ( not ( = ?auto_671701 ?auto_671708 ) ) ( not ( = ?auto_671701 ?auto_671709 ) ) ( not ( = ?auto_671702 ?auto_671703 ) ) ( not ( = ?auto_671702 ?auto_671704 ) ) ( not ( = ?auto_671702 ?auto_671705 ) ) ( not ( = ?auto_671702 ?auto_671706 ) ) ( not ( = ?auto_671702 ?auto_671707 ) ) ( not ( = ?auto_671702 ?auto_671708 ) ) ( not ( = ?auto_671702 ?auto_671709 ) ) ( not ( = ?auto_671703 ?auto_671704 ) ) ( not ( = ?auto_671703 ?auto_671705 ) ) ( not ( = ?auto_671703 ?auto_671706 ) ) ( not ( = ?auto_671703 ?auto_671707 ) ) ( not ( = ?auto_671703 ?auto_671708 ) ) ( not ( = ?auto_671703 ?auto_671709 ) ) ( not ( = ?auto_671704 ?auto_671705 ) ) ( not ( = ?auto_671704 ?auto_671706 ) ) ( not ( = ?auto_671704 ?auto_671707 ) ) ( not ( = ?auto_671704 ?auto_671708 ) ) ( not ( = ?auto_671704 ?auto_671709 ) ) ( not ( = ?auto_671705 ?auto_671706 ) ) ( not ( = ?auto_671705 ?auto_671707 ) ) ( not ( = ?auto_671705 ?auto_671708 ) ) ( not ( = ?auto_671705 ?auto_671709 ) ) ( not ( = ?auto_671706 ?auto_671707 ) ) ( not ( = ?auto_671706 ?auto_671708 ) ) ( not ( = ?auto_671706 ?auto_671709 ) ) ( not ( = ?auto_671707 ?auto_671708 ) ) ( not ( = ?auto_671707 ?auto_671709 ) ) ( not ( = ?auto_671708 ?auto_671709 ) ) ( ON ?auto_671708 ?auto_671709 ) ( ON ?auto_671707 ?auto_671708 ) ( ON ?auto_671706 ?auto_671707 ) ( ON ?auto_671705 ?auto_671706 ) ( CLEAR ?auto_671703 ) ( ON ?auto_671704 ?auto_671705 ) ( CLEAR ?auto_671704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_671693 ?auto_671694 ?auto_671695 ?auto_671696 ?auto_671697 ?auto_671698 ?auto_671699 ?auto_671700 ?auto_671701 ?auto_671702 ?auto_671703 ?auto_671704 )
      ( MAKE-17PILE ?auto_671693 ?auto_671694 ?auto_671695 ?auto_671696 ?auto_671697 ?auto_671698 ?auto_671699 ?auto_671700 ?auto_671701 ?auto_671702 ?auto_671703 ?auto_671704 ?auto_671705 ?auto_671706 ?auto_671707 ?auto_671708 ?auto_671709 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671727 - BLOCK
      ?auto_671728 - BLOCK
      ?auto_671729 - BLOCK
      ?auto_671730 - BLOCK
      ?auto_671731 - BLOCK
      ?auto_671732 - BLOCK
      ?auto_671733 - BLOCK
      ?auto_671734 - BLOCK
      ?auto_671735 - BLOCK
      ?auto_671736 - BLOCK
      ?auto_671737 - BLOCK
      ?auto_671738 - BLOCK
      ?auto_671739 - BLOCK
      ?auto_671740 - BLOCK
      ?auto_671741 - BLOCK
      ?auto_671742 - BLOCK
      ?auto_671743 - BLOCK
    )
    :vars
    (
      ?auto_671744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671743 ?auto_671744 ) ( ON-TABLE ?auto_671727 ) ( ON ?auto_671728 ?auto_671727 ) ( ON ?auto_671729 ?auto_671728 ) ( ON ?auto_671730 ?auto_671729 ) ( ON ?auto_671731 ?auto_671730 ) ( ON ?auto_671732 ?auto_671731 ) ( ON ?auto_671733 ?auto_671732 ) ( ON ?auto_671734 ?auto_671733 ) ( ON ?auto_671735 ?auto_671734 ) ( ON ?auto_671736 ?auto_671735 ) ( not ( = ?auto_671727 ?auto_671728 ) ) ( not ( = ?auto_671727 ?auto_671729 ) ) ( not ( = ?auto_671727 ?auto_671730 ) ) ( not ( = ?auto_671727 ?auto_671731 ) ) ( not ( = ?auto_671727 ?auto_671732 ) ) ( not ( = ?auto_671727 ?auto_671733 ) ) ( not ( = ?auto_671727 ?auto_671734 ) ) ( not ( = ?auto_671727 ?auto_671735 ) ) ( not ( = ?auto_671727 ?auto_671736 ) ) ( not ( = ?auto_671727 ?auto_671737 ) ) ( not ( = ?auto_671727 ?auto_671738 ) ) ( not ( = ?auto_671727 ?auto_671739 ) ) ( not ( = ?auto_671727 ?auto_671740 ) ) ( not ( = ?auto_671727 ?auto_671741 ) ) ( not ( = ?auto_671727 ?auto_671742 ) ) ( not ( = ?auto_671727 ?auto_671743 ) ) ( not ( = ?auto_671727 ?auto_671744 ) ) ( not ( = ?auto_671728 ?auto_671729 ) ) ( not ( = ?auto_671728 ?auto_671730 ) ) ( not ( = ?auto_671728 ?auto_671731 ) ) ( not ( = ?auto_671728 ?auto_671732 ) ) ( not ( = ?auto_671728 ?auto_671733 ) ) ( not ( = ?auto_671728 ?auto_671734 ) ) ( not ( = ?auto_671728 ?auto_671735 ) ) ( not ( = ?auto_671728 ?auto_671736 ) ) ( not ( = ?auto_671728 ?auto_671737 ) ) ( not ( = ?auto_671728 ?auto_671738 ) ) ( not ( = ?auto_671728 ?auto_671739 ) ) ( not ( = ?auto_671728 ?auto_671740 ) ) ( not ( = ?auto_671728 ?auto_671741 ) ) ( not ( = ?auto_671728 ?auto_671742 ) ) ( not ( = ?auto_671728 ?auto_671743 ) ) ( not ( = ?auto_671728 ?auto_671744 ) ) ( not ( = ?auto_671729 ?auto_671730 ) ) ( not ( = ?auto_671729 ?auto_671731 ) ) ( not ( = ?auto_671729 ?auto_671732 ) ) ( not ( = ?auto_671729 ?auto_671733 ) ) ( not ( = ?auto_671729 ?auto_671734 ) ) ( not ( = ?auto_671729 ?auto_671735 ) ) ( not ( = ?auto_671729 ?auto_671736 ) ) ( not ( = ?auto_671729 ?auto_671737 ) ) ( not ( = ?auto_671729 ?auto_671738 ) ) ( not ( = ?auto_671729 ?auto_671739 ) ) ( not ( = ?auto_671729 ?auto_671740 ) ) ( not ( = ?auto_671729 ?auto_671741 ) ) ( not ( = ?auto_671729 ?auto_671742 ) ) ( not ( = ?auto_671729 ?auto_671743 ) ) ( not ( = ?auto_671729 ?auto_671744 ) ) ( not ( = ?auto_671730 ?auto_671731 ) ) ( not ( = ?auto_671730 ?auto_671732 ) ) ( not ( = ?auto_671730 ?auto_671733 ) ) ( not ( = ?auto_671730 ?auto_671734 ) ) ( not ( = ?auto_671730 ?auto_671735 ) ) ( not ( = ?auto_671730 ?auto_671736 ) ) ( not ( = ?auto_671730 ?auto_671737 ) ) ( not ( = ?auto_671730 ?auto_671738 ) ) ( not ( = ?auto_671730 ?auto_671739 ) ) ( not ( = ?auto_671730 ?auto_671740 ) ) ( not ( = ?auto_671730 ?auto_671741 ) ) ( not ( = ?auto_671730 ?auto_671742 ) ) ( not ( = ?auto_671730 ?auto_671743 ) ) ( not ( = ?auto_671730 ?auto_671744 ) ) ( not ( = ?auto_671731 ?auto_671732 ) ) ( not ( = ?auto_671731 ?auto_671733 ) ) ( not ( = ?auto_671731 ?auto_671734 ) ) ( not ( = ?auto_671731 ?auto_671735 ) ) ( not ( = ?auto_671731 ?auto_671736 ) ) ( not ( = ?auto_671731 ?auto_671737 ) ) ( not ( = ?auto_671731 ?auto_671738 ) ) ( not ( = ?auto_671731 ?auto_671739 ) ) ( not ( = ?auto_671731 ?auto_671740 ) ) ( not ( = ?auto_671731 ?auto_671741 ) ) ( not ( = ?auto_671731 ?auto_671742 ) ) ( not ( = ?auto_671731 ?auto_671743 ) ) ( not ( = ?auto_671731 ?auto_671744 ) ) ( not ( = ?auto_671732 ?auto_671733 ) ) ( not ( = ?auto_671732 ?auto_671734 ) ) ( not ( = ?auto_671732 ?auto_671735 ) ) ( not ( = ?auto_671732 ?auto_671736 ) ) ( not ( = ?auto_671732 ?auto_671737 ) ) ( not ( = ?auto_671732 ?auto_671738 ) ) ( not ( = ?auto_671732 ?auto_671739 ) ) ( not ( = ?auto_671732 ?auto_671740 ) ) ( not ( = ?auto_671732 ?auto_671741 ) ) ( not ( = ?auto_671732 ?auto_671742 ) ) ( not ( = ?auto_671732 ?auto_671743 ) ) ( not ( = ?auto_671732 ?auto_671744 ) ) ( not ( = ?auto_671733 ?auto_671734 ) ) ( not ( = ?auto_671733 ?auto_671735 ) ) ( not ( = ?auto_671733 ?auto_671736 ) ) ( not ( = ?auto_671733 ?auto_671737 ) ) ( not ( = ?auto_671733 ?auto_671738 ) ) ( not ( = ?auto_671733 ?auto_671739 ) ) ( not ( = ?auto_671733 ?auto_671740 ) ) ( not ( = ?auto_671733 ?auto_671741 ) ) ( not ( = ?auto_671733 ?auto_671742 ) ) ( not ( = ?auto_671733 ?auto_671743 ) ) ( not ( = ?auto_671733 ?auto_671744 ) ) ( not ( = ?auto_671734 ?auto_671735 ) ) ( not ( = ?auto_671734 ?auto_671736 ) ) ( not ( = ?auto_671734 ?auto_671737 ) ) ( not ( = ?auto_671734 ?auto_671738 ) ) ( not ( = ?auto_671734 ?auto_671739 ) ) ( not ( = ?auto_671734 ?auto_671740 ) ) ( not ( = ?auto_671734 ?auto_671741 ) ) ( not ( = ?auto_671734 ?auto_671742 ) ) ( not ( = ?auto_671734 ?auto_671743 ) ) ( not ( = ?auto_671734 ?auto_671744 ) ) ( not ( = ?auto_671735 ?auto_671736 ) ) ( not ( = ?auto_671735 ?auto_671737 ) ) ( not ( = ?auto_671735 ?auto_671738 ) ) ( not ( = ?auto_671735 ?auto_671739 ) ) ( not ( = ?auto_671735 ?auto_671740 ) ) ( not ( = ?auto_671735 ?auto_671741 ) ) ( not ( = ?auto_671735 ?auto_671742 ) ) ( not ( = ?auto_671735 ?auto_671743 ) ) ( not ( = ?auto_671735 ?auto_671744 ) ) ( not ( = ?auto_671736 ?auto_671737 ) ) ( not ( = ?auto_671736 ?auto_671738 ) ) ( not ( = ?auto_671736 ?auto_671739 ) ) ( not ( = ?auto_671736 ?auto_671740 ) ) ( not ( = ?auto_671736 ?auto_671741 ) ) ( not ( = ?auto_671736 ?auto_671742 ) ) ( not ( = ?auto_671736 ?auto_671743 ) ) ( not ( = ?auto_671736 ?auto_671744 ) ) ( not ( = ?auto_671737 ?auto_671738 ) ) ( not ( = ?auto_671737 ?auto_671739 ) ) ( not ( = ?auto_671737 ?auto_671740 ) ) ( not ( = ?auto_671737 ?auto_671741 ) ) ( not ( = ?auto_671737 ?auto_671742 ) ) ( not ( = ?auto_671737 ?auto_671743 ) ) ( not ( = ?auto_671737 ?auto_671744 ) ) ( not ( = ?auto_671738 ?auto_671739 ) ) ( not ( = ?auto_671738 ?auto_671740 ) ) ( not ( = ?auto_671738 ?auto_671741 ) ) ( not ( = ?auto_671738 ?auto_671742 ) ) ( not ( = ?auto_671738 ?auto_671743 ) ) ( not ( = ?auto_671738 ?auto_671744 ) ) ( not ( = ?auto_671739 ?auto_671740 ) ) ( not ( = ?auto_671739 ?auto_671741 ) ) ( not ( = ?auto_671739 ?auto_671742 ) ) ( not ( = ?auto_671739 ?auto_671743 ) ) ( not ( = ?auto_671739 ?auto_671744 ) ) ( not ( = ?auto_671740 ?auto_671741 ) ) ( not ( = ?auto_671740 ?auto_671742 ) ) ( not ( = ?auto_671740 ?auto_671743 ) ) ( not ( = ?auto_671740 ?auto_671744 ) ) ( not ( = ?auto_671741 ?auto_671742 ) ) ( not ( = ?auto_671741 ?auto_671743 ) ) ( not ( = ?auto_671741 ?auto_671744 ) ) ( not ( = ?auto_671742 ?auto_671743 ) ) ( not ( = ?auto_671742 ?auto_671744 ) ) ( not ( = ?auto_671743 ?auto_671744 ) ) ( ON ?auto_671742 ?auto_671743 ) ( ON ?auto_671741 ?auto_671742 ) ( ON ?auto_671740 ?auto_671741 ) ( ON ?auto_671739 ?auto_671740 ) ( ON ?auto_671738 ?auto_671739 ) ( CLEAR ?auto_671736 ) ( ON ?auto_671737 ?auto_671738 ) ( CLEAR ?auto_671737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_671727 ?auto_671728 ?auto_671729 ?auto_671730 ?auto_671731 ?auto_671732 ?auto_671733 ?auto_671734 ?auto_671735 ?auto_671736 ?auto_671737 )
      ( MAKE-17PILE ?auto_671727 ?auto_671728 ?auto_671729 ?auto_671730 ?auto_671731 ?auto_671732 ?auto_671733 ?auto_671734 ?auto_671735 ?auto_671736 ?auto_671737 ?auto_671738 ?auto_671739 ?auto_671740 ?auto_671741 ?auto_671742 ?auto_671743 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671762 - BLOCK
      ?auto_671763 - BLOCK
      ?auto_671764 - BLOCK
      ?auto_671765 - BLOCK
      ?auto_671766 - BLOCK
      ?auto_671767 - BLOCK
      ?auto_671768 - BLOCK
      ?auto_671769 - BLOCK
      ?auto_671770 - BLOCK
      ?auto_671771 - BLOCK
      ?auto_671772 - BLOCK
      ?auto_671773 - BLOCK
      ?auto_671774 - BLOCK
      ?auto_671775 - BLOCK
      ?auto_671776 - BLOCK
      ?auto_671777 - BLOCK
      ?auto_671778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671778 ) ( ON-TABLE ?auto_671762 ) ( ON ?auto_671763 ?auto_671762 ) ( ON ?auto_671764 ?auto_671763 ) ( ON ?auto_671765 ?auto_671764 ) ( ON ?auto_671766 ?auto_671765 ) ( ON ?auto_671767 ?auto_671766 ) ( ON ?auto_671768 ?auto_671767 ) ( ON ?auto_671769 ?auto_671768 ) ( ON ?auto_671770 ?auto_671769 ) ( ON ?auto_671771 ?auto_671770 ) ( not ( = ?auto_671762 ?auto_671763 ) ) ( not ( = ?auto_671762 ?auto_671764 ) ) ( not ( = ?auto_671762 ?auto_671765 ) ) ( not ( = ?auto_671762 ?auto_671766 ) ) ( not ( = ?auto_671762 ?auto_671767 ) ) ( not ( = ?auto_671762 ?auto_671768 ) ) ( not ( = ?auto_671762 ?auto_671769 ) ) ( not ( = ?auto_671762 ?auto_671770 ) ) ( not ( = ?auto_671762 ?auto_671771 ) ) ( not ( = ?auto_671762 ?auto_671772 ) ) ( not ( = ?auto_671762 ?auto_671773 ) ) ( not ( = ?auto_671762 ?auto_671774 ) ) ( not ( = ?auto_671762 ?auto_671775 ) ) ( not ( = ?auto_671762 ?auto_671776 ) ) ( not ( = ?auto_671762 ?auto_671777 ) ) ( not ( = ?auto_671762 ?auto_671778 ) ) ( not ( = ?auto_671763 ?auto_671764 ) ) ( not ( = ?auto_671763 ?auto_671765 ) ) ( not ( = ?auto_671763 ?auto_671766 ) ) ( not ( = ?auto_671763 ?auto_671767 ) ) ( not ( = ?auto_671763 ?auto_671768 ) ) ( not ( = ?auto_671763 ?auto_671769 ) ) ( not ( = ?auto_671763 ?auto_671770 ) ) ( not ( = ?auto_671763 ?auto_671771 ) ) ( not ( = ?auto_671763 ?auto_671772 ) ) ( not ( = ?auto_671763 ?auto_671773 ) ) ( not ( = ?auto_671763 ?auto_671774 ) ) ( not ( = ?auto_671763 ?auto_671775 ) ) ( not ( = ?auto_671763 ?auto_671776 ) ) ( not ( = ?auto_671763 ?auto_671777 ) ) ( not ( = ?auto_671763 ?auto_671778 ) ) ( not ( = ?auto_671764 ?auto_671765 ) ) ( not ( = ?auto_671764 ?auto_671766 ) ) ( not ( = ?auto_671764 ?auto_671767 ) ) ( not ( = ?auto_671764 ?auto_671768 ) ) ( not ( = ?auto_671764 ?auto_671769 ) ) ( not ( = ?auto_671764 ?auto_671770 ) ) ( not ( = ?auto_671764 ?auto_671771 ) ) ( not ( = ?auto_671764 ?auto_671772 ) ) ( not ( = ?auto_671764 ?auto_671773 ) ) ( not ( = ?auto_671764 ?auto_671774 ) ) ( not ( = ?auto_671764 ?auto_671775 ) ) ( not ( = ?auto_671764 ?auto_671776 ) ) ( not ( = ?auto_671764 ?auto_671777 ) ) ( not ( = ?auto_671764 ?auto_671778 ) ) ( not ( = ?auto_671765 ?auto_671766 ) ) ( not ( = ?auto_671765 ?auto_671767 ) ) ( not ( = ?auto_671765 ?auto_671768 ) ) ( not ( = ?auto_671765 ?auto_671769 ) ) ( not ( = ?auto_671765 ?auto_671770 ) ) ( not ( = ?auto_671765 ?auto_671771 ) ) ( not ( = ?auto_671765 ?auto_671772 ) ) ( not ( = ?auto_671765 ?auto_671773 ) ) ( not ( = ?auto_671765 ?auto_671774 ) ) ( not ( = ?auto_671765 ?auto_671775 ) ) ( not ( = ?auto_671765 ?auto_671776 ) ) ( not ( = ?auto_671765 ?auto_671777 ) ) ( not ( = ?auto_671765 ?auto_671778 ) ) ( not ( = ?auto_671766 ?auto_671767 ) ) ( not ( = ?auto_671766 ?auto_671768 ) ) ( not ( = ?auto_671766 ?auto_671769 ) ) ( not ( = ?auto_671766 ?auto_671770 ) ) ( not ( = ?auto_671766 ?auto_671771 ) ) ( not ( = ?auto_671766 ?auto_671772 ) ) ( not ( = ?auto_671766 ?auto_671773 ) ) ( not ( = ?auto_671766 ?auto_671774 ) ) ( not ( = ?auto_671766 ?auto_671775 ) ) ( not ( = ?auto_671766 ?auto_671776 ) ) ( not ( = ?auto_671766 ?auto_671777 ) ) ( not ( = ?auto_671766 ?auto_671778 ) ) ( not ( = ?auto_671767 ?auto_671768 ) ) ( not ( = ?auto_671767 ?auto_671769 ) ) ( not ( = ?auto_671767 ?auto_671770 ) ) ( not ( = ?auto_671767 ?auto_671771 ) ) ( not ( = ?auto_671767 ?auto_671772 ) ) ( not ( = ?auto_671767 ?auto_671773 ) ) ( not ( = ?auto_671767 ?auto_671774 ) ) ( not ( = ?auto_671767 ?auto_671775 ) ) ( not ( = ?auto_671767 ?auto_671776 ) ) ( not ( = ?auto_671767 ?auto_671777 ) ) ( not ( = ?auto_671767 ?auto_671778 ) ) ( not ( = ?auto_671768 ?auto_671769 ) ) ( not ( = ?auto_671768 ?auto_671770 ) ) ( not ( = ?auto_671768 ?auto_671771 ) ) ( not ( = ?auto_671768 ?auto_671772 ) ) ( not ( = ?auto_671768 ?auto_671773 ) ) ( not ( = ?auto_671768 ?auto_671774 ) ) ( not ( = ?auto_671768 ?auto_671775 ) ) ( not ( = ?auto_671768 ?auto_671776 ) ) ( not ( = ?auto_671768 ?auto_671777 ) ) ( not ( = ?auto_671768 ?auto_671778 ) ) ( not ( = ?auto_671769 ?auto_671770 ) ) ( not ( = ?auto_671769 ?auto_671771 ) ) ( not ( = ?auto_671769 ?auto_671772 ) ) ( not ( = ?auto_671769 ?auto_671773 ) ) ( not ( = ?auto_671769 ?auto_671774 ) ) ( not ( = ?auto_671769 ?auto_671775 ) ) ( not ( = ?auto_671769 ?auto_671776 ) ) ( not ( = ?auto_671769 ?auto_671777 ) ) ( not ( = ?auto_671769 ?auto_671778 ) ) ( not ( = ?auto_671770 ?auto_671771 ) ) ( not ( = ?auto_671770 ?auto_671772 ) ) ( not ( = ?auto_671770 ?auto_671773 ) ) ( not ( = ?auto_671770 ?auto_671774 ) ) ( not ( = ?auto_671770 ?auto_671775 ) ) ( not ( = ?auto_671770 ?auto_671776 ) ) ( not ( = ?auto_671770 ?auto_671777 ) ) ( not ( = ?auto_671770 ?auto_671778 ) ) ( not ( = ?auto_671771 ?auto_671772 ) ) ( not ( = ?auto_671771 ?auto_671773 ) ) ( not ( = ?auto_671771 ?auto_671774 ) ) ( not ( = ?auto_671771 ?auto_671775 ) ) ( not ( = ?auto_671771 ?auto_671776 ) ) ( not ( = ?auto_671771 ?auto_671777 ) ) ( not ( = ?auto_671771 ?auto_671778 ) ) ( not ( = ?auto_671772 ?auto_671773 ) ) ( not ( = ?auto_671772 ?auto_671774 ) ) ( not ( = ?auto_671772 ?auto_671775 ) ) ( not ( = ?auto_671772 ?auto_671776 ) ) ( not ( = ?auto_671772 ?auto_671777 ) ) ( not ( = ?auto_671772 ?auto_671778 ) ) ( not ( = ?auto_671773 ?auto_671774 ) ) ( not ( = ?auto_671773 ?auto_671775 ) ) ( not ( = ?auto_671773 ?auto_671776 ) ) ( not ( = ?auto_671773 ?auto_671777 ) ) ( not ( = ?auto_671773 ?auto_671778 ) ) ( not ( = ?auto_671774 ?auto_671775 ) ) ( not ( = ?auto_671774 ?auto_671776 ) ) ( not ( = ?auto_671774 ?auto_671777 ) ) ( not ( = ?auto_671774 ?auto_671778 ) ) ( not ( = ?auto_671775 ?auto_671776 ) ) ( not ( = ?auto_671775 ?auto_671777 ) ) ( not ( = ?auto_671775 ?auto_671778 ) ) ( not ( = ?auto_671776 ?auto_671777 ) ) ( not ( = ?auto_671776 ?auto_671778 ) ) ( not ( = ?auto_671777 ?auto_671778 ) ) ( ON ?auto_671777 ?auto_671778 ) ( ON ?auto_671776 ?auto_671777 ) ( ON ?auto_671775 ?auto_671776 ) ( ON ?auto_671774 ?auto_671775 ) ( ON ?auto_671773 ?auto_671774 ) ( CLEAR ?auto_671771 ) ( ON ?auto_671772 ?auto_671773 ) ( CLEAR ?auto_671772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_671762 ?auto_671763 ?auto_671764 ?auto_671765 ?auto_671766 ?auto_671767 ?auto_671768 ?auto_671769 ?auto_671770 ?auto_671771 ?auto_671772 )
      ( MAKE-17PILE ?auto_671762 ?auto_671763 ?auto_671764 ?auto_671765 ?auto_671766 ?auto_671767 ?auto_671768 ?auto_671769 ?auto_671770 ?auto_671771 ?auto_671772 ?auto_671773 ?auto_671774 ?auto_671775 ?auto_671776 ?auto_671777 ?auto_671778 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671796 - BLOCK
      ?auto_671797 - BLOCK
      ?auto_671798 - BLOCK
      ?auto_671799 - BLOCK
      ?auto_671800 - BLOCK
      ?auto_671801 - BLOCK
      ?auto_671802 - BLOCK
      ?auto_671803 - BLOCK
      ?auto_671804 - BLOCK
      ?auto_671805 - BLOCK
      ?auto_671806 - BLOCK
      ?auto_671807 - BLOCK
      ?auto_671808 - BLOCK
      ?auto_671809 - BLOCK
      ?auto_671810 - BLOCK
      ?auto_671811 - BLOCK
      ?auto_671812 - BLOCK
    )
    :vars
    (
      ?auto_671813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671812 ?auto_671813 ) ( ON-TABLE ?auto_671796 ) ( ON ?auto_671797 ?auto_671796 ) ( ON ?auto_671798 ?auto_671797 ) ( ON ?auto_671799 ?auto_671798 ) ( ON ?auto_671800 ?auto_671799 ) ( ON ?auto_671801 ?auto_671800 ) ( ON ?auto_671802 ?auto_671801 ) ( ON ?auto_671803 ?auto_671802 ) ( ON ?auto_671804 ?auto_671803 ) ( not ( = ?auto_671796 ?auto_671797 ) ) ( not ( = ?auto_671796 ?auto_671798 ) ) ( not ( = ?auto_671796 ?auto_671799 ) ) ( not ( = ?auto_671796 ?auto_671800 ) ) ( not ( = ?auto_671796 ?auto_671801 ) ) ( not ( = ?auto_671796 ?auto_671802 ) ) ( not ( = ?auto_671796 ?auto_671803 ) ) ( not ( = ?auto_671796 ?auto_671804 ) ) ( not ( = ?auto_671796 ?auto_671805 ) ) ( not ( = ?auto_671796 ?auto_671806 ) ) ( not ( = ?auto_671796 ?auto_671807 ) ) ( not ( = ?auto_671796 ?auto_671808 ) ) ( not ( = ?auto_671796 ?auto_671809 ) ) ( not ( = ?auto_671796 ?auto_671810 ) ) ( not ( = ?auto_671796 ?auto_671811 ) ) ( not ( = ?auto_671796 ?auto_671812 ) ) ( not ( = ?auto_671796 ?auto_671813 ) ) ( not ( = ?auto_671797 ?auto_671798 ) ) ( not ( = ?auto_671797 ?auto_671799 ) ) ( not ( = ?auto_671797 ?auto_671800 ) ) ( not ( = ?auto_671797 ?auto_671801 ) ) ( not ( = ?auto_671797 ?auto_671802 ) ) ( not ( = ?auto_671797 ?auto_671803 ) ) ( not ( = ?auto_671797 ?auto_671804 ) ) ( not ( = ?auto_671797 ?auto_671805 ) ) ( not ( = ?auto_671797 ?auto_671806 ) ) ( not ( = ?auto_671797 ?auto_671807 ) ) ( not ( = ?auto_671797 ?auto_671808 ) ) ( not ( = ?auto_671797 ?auto_671809 ) ) ( not ( = ?auto_671797 ?auto_671810 ) ) ( not ( = ?auto_671797 ?auto_671811 ) ) ( not ( = ?auto_671797 ?auto_671812 ) ) ( not ( = ?auto_671797 ?auto_671813 ) ) ( not ( = ?auto_671798 ?auto_671799 ) ) ( not ( = ?auto_671798 ?auto_671800 ) ) ( not ( = ?auto_671798 ?auto_671801 ) ) ( not ( = ?auto_671798 ?auto_671802 ) ) ( not ( = ?auto_671798 ?auto_671803 ) ) ( not ( = ?auto_671798 ?auto_671804 ) ) ( not ( = ?auto_671798 ?auto_671805 ) ) ( not ( = ?auto_671798 ?auto_671806 ) ) ( not ( = ?auto_671798 ?auto_671807 ) ) ( not ( = ?auto_671798 ?auto_671808 ) ) ( not ( = ?auto_671798 ?auto_671809 ) ) ( not ( = ?auto_671798 ?auto_671810 ) ) ( not ( = ?auto_671798 ?auto_671811 ) ) ( not ( = ?auto_671798 ?auto_671812 ) ) ( not ( = ?auto_671798 ?auto_671813 ) ) ( not ( = ?auto_671799 ?auto_671800 ) ) ( not ( = ?auto_671799 ?auto_671801 ) ) ( not ( = ?auto_671799 ?auto_671802 ) ) ( not ( = ?auto_671799 ?auto_671803 ) ) ( not ( = ?auto_671799 ?auto_671804 ) ) ( not ( = ?auto_671799 ?auto_671805 ) ) ( not ( = ?auto_671799 ?auto_671806 ) ) ( not ( = ?auto_671799 ?auto_671807 ) ) ( not ( = ?auto_671799 ?auto_671808 ) ) ( not ( = ?auto_671799 ?auto_671809 ) ) ( not ( = ?auto_671799 ?auto_671810 ) ) ( not ( = ?auto_671799 ?auto_671811 ) ) ( not ( = ?auto_671799 ?auto_671812 ) ) ( not ( = ?auto_671799 ?auto_671813 ) ) ( not ( = ?auto_671800 ?auto_671801 ) ) ( not ( = ?auto_671800 ?auto_671802 ) ) ( not ( = ?auto_671800 ?auto_671803 ) ) ( not ( = ?auto_671800 ?auto_671804 ) ) ( not ( = ?auto_671800 ?auto_671805 ) ) ( not ( = ?auto_671800 ?auto_671806 ) ) ( not ( = ?auto_671800 ?auto_671807 ) ) ( not ( = ?auto_671800 ?auto_671808 ) ) ( not ( = ?auto_671800 ?auto_671809 ) ) ( not ( = ?auto_671800 ?auto_671810 ) ) ( not ( = ?auto_671800 ?auto_671811 ) ) ( not ( = ?auto_671800 ?auto_671812 ) ) ( not ( = ?auto_671800 ?auto_671813 ) ) ( not ( = ?auto_671801 ?auto_671802 ) ) ( not ( = ?auto_671801 ?auto_671803 ) ) ( not ( = ?auto_671801 ?auto_671804 ) ) ( not ( = ?auto_671801 ?auto_671805 ) ) ( not ( = ?auto_671801 ?auto_671806 ) ) ( not ( = ?auto_671801 ?auto_671807 ) ) ( not ( = ?auto_671801 ?auto_671808 ) ) ( not ( = ?auto_671801 ?auto_671809 ) ) ( not ( = ?auto_671801 ?auto_671810 ) ) ( not ( = ?auto_671801 ?auto_671811 ) ) ( not ( = ?auto_671801 ?auto_671812 ) ) ( not ( = ?auto_671801 ?auto_671813 ) ) ( not ( = ?auto_671802 ?auto_671803 ) ) ( not ( = ?auto_671802 ?auto_671804 ) ) ( not ( = ?auto_671802 ?auto_671805 ) ) ( not ( = ?auto_671802 ?auto_671806 ) ) ( not ( = ?auto_671802 ?auto_671807 ) ) ( not ( = ?auto_671802 ?auto_671808 ) ) ( not ( = ?auto_671802 ?auto_671809 ) ) ( not ( = ?auto_671802 ?auto_671810 ) ) ( not ( = ?auto_671802 ?auto_671811 ) ) ( not ( = ?auto_671802 ?auto_671812 ) ) ( not ( = ?auto_671802 ?auto_671813 ) ) ( not ( = ?auto_671803 ?auto_671804 ) ) ( not ( = ?auto_671803 ?auto_671805 ) ) ( not ( = ?auto_671803 ?auto_671806 ) ) ( not ( = ?auto_671803 ?auto_671807 ) ) ( not ( = ?auto_671803 ?auto_671808 ) ) ( not ( = ?auto_671803 ?auto_671809 ) ) ( not ( = ?auto_671803 ?auto_671810 ) ) ( not ( = ?auto_671803 ?auto_671811 ) ) ( not ( = ?auto_671803 ?auto_671812 ) ) ( not ( = ?auto_671803 ?auto_671813 ) ) ( not ( = ?auto_671804 ?auto_671805 ) ) ( not ( = ?auto_671804 ?auto_671806 ) ) ( not ( = ?auto_671804 ?auto_671807 ) ) ( not ( = ?auto_671804 ?auto_671808 ) ) ( not ( = ?auto_671804 ?auto_671809 ) ) ( not ( = ?auto_671804 ?auto_671810 ) ) ( not ( = ?auto_671804 ?auto_671811 ) ) ( not ( = ?auto_671804 ?auto_671812 ) ) ( not ( = ?auto_671804 ?auto_671813 ) ) ( not ( = ?auto_671805 ?auto_671806 ) ) ( not ( = ?auto_671805 ?auto_671807 ) ) ( not ( = ?auto_671805 ?auto_671808 ) ) ( not ( = ?auto_671805 ?auto_671809 ) ) ( not ( = ?auto_671805 ?auto_671810 ) ) ( not ( = ?auto_671805 ?auto_671811 ) ) ( not ( = ?auto_671805 ?auto_671812 ) ) ( not ( = ?auto_671805 ?auto_671813 ) ) ( not ( = ?auto_671806 ?auto_671807 ) ) ( not ( = ?auto_671806 ?auto_671808 ) ) ( not ( = ?auto_671806 ?auto_671809 ) ) ( not ( = ?auto_671806 ?auto_671810 ) ) ( not ( = ?auto_671806 ?auto_671811 ) ) ( not ( = ?auto_671806 ?auto_671812 ) ) ( not ( = ?auto_671806 ?auto_671813 ) ) ( not ( = ?auto_671807 ?auto_671808 ) ) ( not ( = ?auto_671807 ?auto_671809 ) ) ( not ( = ?auto_671807 ?auto_671810 ) ) ( not ( = ?auto_671807 ?auto_671811 ) ) ( not ( = ?auto_671807 ?auto_671812 ) ) ( not ( = ?auto_671807 ?auto_671813 ) ) ( not ( = ?auto_671808 ?auto_671809 ) ) ( not ( = ?auto_671808 ?auto_671810 ) ) ( not ( = ?auto_671808 ?auto_671811 ) ) ( not ( = ?auto_671808 ?auto_671812 ) ) ( not ( = ?auto_671808 ?auto_671813 ) ) ( not ( = ?auto_671809 ?auto_671810 ) ) ( not ( = ?auto_671809 ?auto_671811 ) ) ( not ( = ?auto_671809 ?auto_671812 ) ) ( not ( = ?auto_671809 ?auto_671813 ) ) ( not ( = ?auto_671810 ?auto_671811 ) ) ( not ( = ?auto_671810 ?auto_671812 ) ) ( not ( = ?auto_671810 ?auto_671813 ) ) ( not ( = ?auto_671811 ?auto_671812 ) ) ( not ( = ?auto_671811 ?auto_671813 ) ) ( not ( = ?auto_671812 ?auto_671813 ) ) ( ON ?auto_671811 ?auto_671812 ) ( ON ?auto_671810 ?auto_671811 ) ( ON ?auto_671809 ?auto_671810 ) ( ON ?auto_671808 ?auto_671809 ) ( ON ?auto_671807 ?auto_671808 ) ( ON ?auto_671806 ?auto_671807 ) ( CLEAR ?auto_671804 ) ( ON ?auto_671805 ?auto_671806 ) ( CLEAR ?auto_671805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_671796 ?auto_671797 ?auto_671798 ?auto_671799 ?auto_671800 ?auto_671801 ?auto_671802 ?auto_671803 ?auto_671804 ?auto_671805 )
      ( MAKE-17PILE ?auto_671796 ?auto_671797 ?auto_671798 ?auto_671799 ?auto_671800 ?auto_671801 ?auto_671802 ?auto_671803 ?auto_671804 ?auto_671805 ?auto_671806 ?auto_671807 ?auto_671808 ?auto_671809 ?auto_671810 ?auto_671811 ?auto_671812 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671831 - BLOCK
      ?auto_671832 - BLOCK
      ?auto_671833 - BLOCK
      ?auto_671834 - BLOCK
      ?auto_671835 - BLOCK
      ?auto_671836 - BLOCK
      ?auto_671837 - BLOCK
      ?auto_671838 - BLOCK
      ?auto_671839 - BLOCK
      ?auto_671840 - BLOCK
      ?auto_671841 - BLOCK
      ?auto_671842 - BLOCK
      ?auto_671843 - BLOCK
      ?auto_671844 - BLOCK
      ?auto_671845 - BLOCK
      ?auto_671846 - BLOCK
      ?auto_671847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671847 ) ( ON-TABLE ?auto_671831 ) ( ON ?auto_671832 ?auto_671831 ) ( ON ?auto_671833 ?auto_671832 ) ( ON ?auto_671834 ?auto_671833 ) ( ON ?auto_671835 ?auto_671834 ) ( ON ?auto_671836 ?auto_671835 ) ( ON ?auto_671837 ?auto_671836 ) ( ON ?auto_671838 ?auto_671837 ) ( ON ?auto_671839 ?auto_671838 ) ( not ( = ?auto_671831 ?auto_671832 ) ) ( not ( = ?auto_671831 ?auto_671833 ) ) ( not ( = ?auto_671831 ?auto_671834 ) ) ( not ( = ?auto_671831 ?auto_671835 ) ) ( not ( = ?auto_671831 ?auto_671836 ) ) ( not ( = ?auto_671831 ?auto_671837 ) ) ( not ( = ?auto_671831 ?auto_671838 ) ) ( not ( = ?auto_671831 ?auto_671839 ) ) ( not ( = ?auto_671831 ?auto_671840 ) ) ( not ( = ?auto_671831 ?auto_671841 ) ) ( not ( = ?auto_671831 ?auto_671842 ) ) ( not ( = ?auto_671831 ?auto_671843 ) ) ( not ( = ?auto_671831 ?auto_671844 ) ) ( not ( = ?auto_671831 ?auto_671845 ) ) ( not ( = ?auto_671831 ?auto_671846 ) ) ( not ( = ?auto_671831 ?auto_671847 ) ) ( not ( = ?auto_671832 ?auto_671833 ) ) ( not ( = ?auto_671832 ?auto_671834 ) ) ( not ( = ?auto_671832 ?auto_671835 ) ) ( not ( = ?auto_671832 ?auto_671836 ) ) ( not ( = ?auto_671832 ?auto_671837 ) ) ( not ( = ?auto_671832 ?auto_671838 ) ) ( not ( = ?auto_671832 ?auto_671839 ) ) ( not ( = ?auto_671832 ?auto_671840 ) ) ( not ( = ?auto_671832 ?auto_671841 ) ) ( not ( = ?auto_671832 ?auto_671842 ) ) ( not ( = ?auto_671832 ?auto_671843 ) ) ( not ( = ?auto_671832 ?auto_671844 ) ) ( not ( = ?auto_671832 ?auto_671845 ) ) ( not ( = ?auto_671832 ?auto_671846 ) ) ( not ( = ?auto_671832 ?auto_671847 ) ) ( not ( = ?auto_671833 ?auto_671834 ) ) ( not ( = ?auto_671833 ?auto_671835 ) ) ( not ( = ?auto_671833 ?auto_671836 ) ) ( not ( = ?auto_671833 ?auto_671837 ) ) ( not ( = ?auto_671833 ?auto_671838 ) ) ( not ( = ?auto_671833 ?auto_671839 ) ) ( not ( = ?auto_671833 ?auto_671840 ) ) ( not ( = ?auto_671833 ?auto_671841 ) ) ( not ( = ?auto_671833 ?auto_671842 ) ) ( not ( = ?auto_671833 ?auto_671843 ) ) ( not ( = ?auto_671833 ?auto_671844 ) ) ( not ( = ?auto_671833 ?auto_671845 ) ) ( not ( = ?auto_671833 ?auto_671846 ) ) ( not ( = ?auto_671833 ?auto_671847 ) ) ( not ( = ?auto_671834 ?auto_671835 ) ) ( not ( = ?auto_671834 ?auto_671836 ) ) ( not ( = ?auto_671834 ?auto_671837 ) ) ( not ( = ?auto_671834 ?auto_671838 ) ) ( not ( = ?auto_671834 ?auto_671839 ) ) ( not ( = ?auto_671834 ?auto_671840 ) ) ( not ( = ?auto_671834 ?auto_671841 ) ) ( not ( = ?auto_671834 ?auto_671842 ) ) ( not ( = ?auto_671834 ?auto_671843 ) ) ( not ( = ?auto_671834 ?auto_671844 ) ) ( not ( = ?auto_671834 ?auto_671845 ) ) ( not ( = ?auto_671834 ?auto_671846 ) ) ( not ( = ?auto_671834 ?auto_671847 ) ) ( not ( = ?auto_671835 ?auto_671836 ) ) ( not ( = ?auto_671835 ?auto_671837 ) ) ( not ( = ?auto_671835 ?auto_671838 ) ) ( not ( = ?auto_671835 ?auto_671839 ) ) ( not ( = ?auto_671835 ?auto_671840 ) ) ( not ( = ?auto_671835 ?auto_671841 ) ) ( not ( = ?auto_671835 ?auto_671842 ) ) ( not ( = ?auto_671835 ?auto_671843 ) ) ( not ( = ?auto_671835 ?auto_671844 ) ) ( not ( = ?auto_671835 ?auto_671845 ) ) ( not ( = ?auto_671835 ?auto_671846 ) ) ( not ( = ?auto_671835 ?auto_671847 ) ) ( not ( = ?auto_671836 ?auto_671837 ) ) ( not ( = ?auto_671836 ?auto_671838 ) ) ( not ( = ?auto_671836 ?auto_671839 ) ) ( not ( = ?auto_671836 ?auto_671840 ) ) ( not ( = ?auto_671836 ?auto_671841 ) ) ( not ( = ?auto_671836 ?auto_671842 ) ) ( not ( = ?auto_671836 ?auto_671843 ) ) ( not ( = ?auto_671836 ?auto_671844 ) ) ( not ( = ?auto_671836 ?auto_671845 ) ) ( not ( = ?auto_671836 ?auto_671846 ) ) ( not ( = ?auto_671836 ?auto_671847 ) ) ( not ( = ?auto_671837 ?auto_671838 ) ) ( not ( = ?auto_671837 ?auto_671839 ) ) ( not ( = ?auto_671837 ?auto_671840 ) ) ( not ( = ?auto_671837 ?auto_671841 ) ) ( not ( = ?auto_671837 ?auto_671842 ) ) ( not ( = ?auto_671837 ?auto_671843 ) ) ( not ( = ?auto_671837 ?auto_671844 ) ) ( not ( = ?auto_671837 ?auto_671845 ) ) ( not ( = ?auto_671837 ?auto_671846 ) ) ( not ( = ?auto_671837 ?auto_671847 ) ) ( not ( = ?auto_671838 ?auto_671839 ) ) ( not ( = ?auto_671838 ?auto_671840 ) ) ( not ( = ?auto_671838 ?auto_671841 ) ) ( not ( = ?auto_671838 ?auto_671842 ) ) ( not ( = ?auto_671838 ?auto_671843 ) ) ( not ( = ?auto_671838 ?auto_671844 ) ) ( not ( = ?auto_671838 ?auto_671845 ) ) ( not ( = ?auto_671838 ?auto_671846 ) ) ( not ( = ?auto_671838 ?auto_671847 ) ) ( not ( = ?auto_671839 ?auto_671840 ) ) ( not ( = ?auto_671839 ?auto_671841 ) ) ( not ( = ?auto_671839 ?auto_671842 ) ) ( not ( = ?auto_671839 ?auto_671843 ) ) ( not ( = ?auto_671839 ?auto_671844 ) ) ( not ( = ?auto_671839 ?auto_671845 ) ) ( not ( = ?auto_671839 ?auto_671846 ) ) ( not ( = ?auto_671839 ?auto_671847 ) ) ( not ( = ?auto_671840 ?auto_671841 ) ) ( not ( = ?auto_671840 ?auto_671842 ) ) ( not ( = ?auto_671840 ?auto_671843 ) ) ( not ( = ?auto_671840 ?auto_671844 ) ) ( not ( = ?auto_671840 ?auto_671845 ) ) ( not ( = ?auto_671840 ?auto_671846 ) ) ( not ( = ?auto_671840 ?auto_671847 ) ) ( not ( = ?auto_671841 ?auto_671842 ) ) ( not ( = ?auto_671841 ?auto_671843 ) ) ( not ( = ?auto_671841 ?auto_671844 ) ) ( not ( = ?auto_671841 ?auto_671845 ) ) ( not ( = ?auto_671841 ?auto_671846 ) ) ( not ( = ?auto_671841 ?auto_671847 ) ) ( not ( = ?auto_671842 ?auto_671843 ) ) ( not ( = ?auto_671842 ?auto_671844 ) ) ( not ( = ?auto_671842 ?auto_671845 ) ) ( not ( = ?auto_671842 ?auto_671846 ) ) ( not ( = ?auto_671842 ?auto_671847 ) ) ( not ( = ?auto_671843 ?auto_671844 ) ) ( not ( = ?auto_671843 ?auto_671845 ) ) ( not ( = ?auto_671843 ?auto_671846 ) ) ( not ( = ?auto_671843 ?auto_671847 ) ) ( not ( = ?auto_671844 ?auto_671845 ) ) ( not ( = ?auto_671844 ?auto_671846 ) ) ( not ( = ?auto_671844 ?auto_671847 ) ) ( not ( = ?auto_671845 ?auto_671846 ) ) ( not ( = ?auto_671845 ?auto_671847 ) ) ( not ( = ?auto_671846 ?auto_671847 ) ) ( ON ?auto_671846 ?auto_671847 ) ( ON ?auto_671845 ?auto_671846 ) ( ON ?auto_671844 ?auto_671845 ) ( ON ?auto_671843 ?auto_671844 ) ( ON ?auto_671842 ?auto_671843 ) ( ON ?auto_671841 ?auto_671842 ) ( CLEAR ?auto_671839 ) ( ON ?auto_671840 ?auto_671841 ) ( CLEAR ?auto_671840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_671831 ?auto_671832 ?auto_671833 ?auto_671834 ?auto_671835 ?auto_671836 ?auto_671837 ?auto_671838 ?auto_671839 ?auto_671840 )
      ( MAKE-17PILE ?auto_671831 ?auto_671832 ?auto_671833 ?auto_671834 ?auto_671835 ?auto_671836 ?auto_671837 ?auto_671838 ?auto_671839 ?auto_671840 ?auto_671841 ?auto_671842 ?auto_671843 ?auto_671844 ?auto_671845 ?auto_671846 ?auto_671847 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671865 - BLOCK
      ?auto_671866 - BLOCK
      ?auto_671867 - BLOCK
      ?auto_671868 - BLOCK
      ?auto_671869 - BLOCK
      ?auto_671870 - BLOCK
      ?auto_671871 - BLOCK
      ?auto_671872 - BLOCK
      ?auto_671873 - BLOCK
      ?auto_671874 - BLOCK
      ?auto_671875 - BLOCK
      ?auto_671876 - BLOCK
      ?auto_671877 - BLOCK
      ?auto_671878 - BLOCK
      ?auto_671879 - BLOCK
      ?auto_671880 - BLOCK
      ?auto_671881 - BLOCK
    )
    :vars
    (
      ?auto_671882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671881 ?auto_671882 ) ( ON-TABLE ?auto_671865 ) ( ON ?auto_671866 ?auto_671865 ) ( ON ?auto_671867 ?auto_671866 ) ( ON ?auto_671868 ?auto_671867 ) ( ON ?auto_671869 ?auto_671868 ) ( ON ?auto_671870 ?auto_671869 ) ( ON ?auto_671871 ?auto_671870 ) ( ON ?auto_671872 ?auto_671871 ) ( not ( = ?auto_671865 ?auto_671866 ) ) ( not ( = ?auto_671865 ?auto_671867 ) ) ( not ( = ?auto_671865 ?auto_671868 ) ) ( not ( = ?auto_671865 ?auto_671869 ) ) ( not ( = ?auto_671865 ?auto_671870 ) ) ( not ( = ?auto_671865 ?auto_671871 ) ) ( not ( = ?auto_671865 ?auto_671872 ) ) ( not ( = ?auto_671865 ?auto_671873 ) ) ( not ( = ?auto_671865 ?auto_671874 ) ) ( not ( = ?auto_671865 ?auto_671875 ) ) ( not ( = ?auto_671865 ?auto_671876 ) ) ( not ( = ?auto_671865 ?auto_671877 ) ) ( not ( = ?auto_671865 ?auto_671878 ) ) ( not ( = ?auto_671865 ?auto_671879 ) ) ( not ( = ?auto_671865 ?auto_671880 ) ) ( not ( = ?auto_671865 ?auto_671881 ) ) ( not ( = ?auto_671865 ?auto_671882 ) ) ( not ( = ?auto_671866 ?auto_671867 ) ) ( not ( = ?auto_671866 ?auto_671868 ) ) ( not ( = ?auto_671866 ?auto_671869 ) ) ( not ( = ?auto_671866 ?auto_671870 ) ) ( not ( = ?auto_671866 ?auto_671871 ) ) ( not ( = ?auto_671866 ?auto_671872 ) ) ( not ( = ?auto_671866 ?auto_671873 ) ) ( not ( = ?auto_671866 ?auto_671874 ) ) ( not ( = ?auto_671866 ?auto_671875 ) ) ( not ( = ?auto_671866 ?auto_671876 ) ) ( not ( = ?auto_671866 ?auto_671877 ) ) ( not ( = ?auto_671866 ?auto_671878 ) ) ( not ( = ?auto_671866 ?auto_671879 ) ) ( not ( = ?auto_671866 ?auto_671880 ) ) ( not ( = ?auto_671866 ?auto_671881 ) ) ( not ( = ?auto_671866 ?auto_671882 ) ) ( not ( = ?auto_671867 ?auto_671868 ) ) ( not ( = ?auto_671867 ?auto_671869 ) ) ( not ( = ?auto_671867 ?auto_671870 ) ) ( not ( = ?auto_671867 ?auto_671871 ) ) ( not ( = ?auto_671867 ?auto_671872 ) ) ( not ( = ?auto_671867 ?auto_671873 ) ) ( not ( = ?auto_671867 ?auto_671874 ) ) ( not ( = ?auto_671867 ?auto_671875 ) ) ( not ( = ?auto_671867 ?auto_671876 ) ) ( not ( = ?auto_671867 ?auto_671877 ) ) ( not ( = ?auto_671867 ?auto_671878 ) ) ( not ( = ?auto_671867 ?auto_671879 ) ) ( not ( = ?auto_671867 ?auto_671880 ) ) ( not ( = ?auto_671867 ?auto_671881 ) ) ( not ( = ?auto_671867 ?auto_671882 ) ) ( not ( = ?auto_671868 ?auto_671869 ) ) ( not ( = ?auto_671868 ?auto_671870 ) ) ( not ( = ?auto_671868 ?auto_671871 ) ) ( not ( = ?auto_671868 ?auto_671872 ) ) ( not ( = ?auto_671868 ?auto_671873 ) ) ( not ( = ?auto_671868 ?auto_671874 ) ) ( not ( = ?auto_671868 ?auto_671875 ) ) ( not ( = ?auto_671868 ?auto_671876 ) ) ( not ( = ?auto_671868 ?auto_671877 ) ) ( not ( = ?auto_671868 ?auto_671878 ) ) ( not ( = ?auto_671868 ?auto_671879 ) ) ( not ( = ?auto_671868 ?auto_671880 ) ) ( not ( = ?auto_671868 ?auto_671881 ) ) ( not ( = ?auto_671868 ?auto_671882 ) ) ( not ( = ?auto_671869 ?auto_671870 ) ) ( not ( = ?auto_671869 ?auto_671871 ) ) ( not ( = ?auto_671869 ?auto_671872 ) ) ( not ( = ?auto_671869 ?auto_671873 ) ) ( not ( = ?auto_671869 ?auto_671874 ) ) ( not ( = ?auto_671869 ?auto_671875 ) ) ( not ( = ?auto_671869 ?auto_671876 ) ) ( not ( = ?auto_671869 ?auto_671877 ) ) ( not ( = ?auto_671869 ?auto_671878 ) ) ( not ( = ?auto_671869 ?auto_671879 ) ) ( not ( = ?auto_671869 ?auto_671880 ) ) ( not ( = ?auto_671869 ?auto_671881 ) ) ( not ( = ?auto_671869 ?auto_671882 ) ) ( not ( = ?auto_671870 ?auto_671871 ) ) ( not ( = ?auto_671870 ?auto_671872 ) ) ( not ( = ?auto_671870 ?auto_671873 ) ) ( not ( = ?auto_671870 ?auto_671874 ) ) ( not ( = ?auto_671870 ?auto_671875 ) ) ( not ( = ?auto_671870 ?auto_671876 ) ) ( not ( = ?auto_671870 ?auto_671877 ) ) ( not ( = ?auto_671870 ?auto_671878 ) ) ( not ( = ?auto_671870 ?auto_671879 ) ) ( not ( = ?auto_671870 ?auto_671880 ) ) ( not ( = ?auto_671870 ?auto_671881 ) ) ( not ( = ?auto_671870 ?auto_671882 ) ) ( not ( = ?auto_671871 ?auto_671872 ) ) ( not ( = ?auto_671871 ?auto_671873 ) ) ( not ( = ?auto_671871 ?auto_671874 ) ) ( not ( = ?auto_671871 ?auto_671875 ) ) ( not ( = ?auto_671871 ?auto_671876 ) ) ( not ( = ?auto_671871 ?auto_671877 ) ) ( not ( = ?auto_671871 ?auto_671878 ) ) ( not ( = ?auto_671871 ?auto_671879 ) ) ( not ( = ?auto_671871 ?auto_671880 ) ) ( not ( = ?auto_671871 ?auto_671881 ) ) ( not ( = ?auto_671871 ?auto_671882 ) ) ( not ( = ?auto_671872 ?auto_671873 ) ) ( not ( = ?auto_671872 ?auto_671874 ) ) ( not ( = ?auto_671872 ?auto_671875 ) ) ( not ( = ?auto_671872 ?auto_671876 ) ) ( not ( = ?auto_671872 ?auto_671877 ) ) ( not ( = ?auto_671872 ?auto_671878 ) ) ( not ( = ?auto_671872 ?auto_671879 ) ) ( not ( = ?auto_671872 ?auto_671880 ) ) ( not ( = ?auto_671872 ?auto_671881 ) ) ( not ( = ?auto_671872 ?auto_671882 ) ) ( not ( = ?auto_671873 ?auto_671874 ) ) ( not ( = ?auto_671873 ?auto_671875 ) ) ( not ( = ?auto_671873 ?auto_671876 ) ) ( not ( = ?auto_671873 ?auto_671877 ) ) ( not ( = ?auto_671873 ?auto_671878 ) ) ( not ( = ?auto_671873 ?auto_671879 ) ) ( not ( = ?auto_671873 ?auto_671880 ) ) ( not ( = ?auto_671873 ?auto_671881 ) ) ( not ( = ?auto_671873 ?auto_671882 ) ) ( not ( = ?auto_671874 ?auto_671875 ) ) ( not ( = ?auto_671874 ?auto_671876 ) ) ( not ( = ?auto_671874 ?auto_671877 ) ) ( not ( = ?auto_671874 ?auto_671878 ) ) ( not ( = ?auto_671874 ?auto_671879 ) ) ( not ( = ?auto_671874 ?auto_671880 ) ) ( not ( = ?auto_671874 ?auto_671881 ) ) ( not ( = ?auto_671874 ?auto_671882 ) ) ( not ( = ?auto_671875 ?auto_671876 ) ) ( not ( = ?auto_671875 ?auto_671877 ) ) ( not ( = ?auto_671875 ?auto_671878 ) ) ( not ( = ?auto_671875 ?auto_671879 ) ) ( not ( = ?auto_671875 ?auto_671880 ) ) ( not ( = ?auto_671875 ?auto_671881 ) ) ( not ( = ?auto_671875 ?auto_671882 ) ) ( not ( = ?auto_671876 ?auto_671877 ) ) ( not ( = ?auto_671876 ?auto_671878 ) ) ( not ( = ?auto_671876 ?auto_671879 ) ) ( not ( = ?auto_671876 ?auto_671880 ) ) ( not ( = ?auto_671876 ?auto_671881 ) ) ( not ( = ?auto_671876 ?auto_671882 ) ) ( not ( = ?auto_671877 ?auto_671878 ) ) ( not ( = ?auto_671877 ?auto_671879 ) ) ( not ( = ?auto_671877 ?auto_671880 ) ) ( not ( = ?auto_671877 ?auto_671881 ) ) ( not ( = ?auto_671877 ?auto_671882 ) ) ( not ( = ?auto_671878 ?auto_671879 ) ) ( not ( = ?auto_671878 ?auto_671880 ) ) ( not ( = ?auto_671878 ?auto_671881 ) ) ( not ( = ?auto_671878 ?auto_671882 ) ) ( not ( = ?auto_671879 ?auto_671880 ) ) ( not ( = ?auto_671879 ?auto_671881 ) ) ( not ( = ?auto_671879 ?auto_671882 ) ) ( not ( = ?auto_671880 ?auto_671881 ) ) ( not ( = ?auto_671880 ?auto_671882 ) ) ( not ( = ?auto_671881 ?auto_671882 ) ) ( ON ?auto_671880 ?auto_671881 ) ( ON ?auto_671879 ?auto_671880 ) ( ON ?auto_671878 ?auto_671879 ) ( ON ?auto_671877 ?auto_671878 ) ( ON ?auto_671876 ?auto_671877 ) ( ON ?auto_671875 ?auto_671876 ) ( ON ?auto_671874 ?auto_671875 ) ( CLEAR ?auto_671872 ) ( ON ?auto_671873 ?auto_671874 ) ( CLEAR ?auto_671873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_671865 ?auto_671866 ?auto_671867 ?auto_671868 ?auto_671869 ?auto_671870 ?auto_671871 ?auto_671872 ?auto_671873 )
      ( MAKE-17PILE ?auto_671865 ?auto_671866 ?auto_671867 ?auto_671868 ?auto_671869 ?auto_671870 ?auto_671871 ?auto_671872 ?auto_671873 ?auto_671874 ?auto_671875 ?auto_671876 ?auto_671877 ?auto_671878 ?auto_671879 ?auto_671880 ?auto_671881 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671900 - BLOCK
      ?auto_671901 - BLOCK
      ?auto_671902 - BLOCK
      ?auto_671903 - BLOCK
      ?auto_671904 - BLOCK
      ?auto_671905 - BLOCK
      ?auto_671906 - BLOCK
      ?auto_671907 - BLOCK
      ?auto_671908 - BLOCK
      ?auto_671909 - BLOCK
      ?auto_671910 - BLOCK
      ?auto_671911 - BLOCK
      ?auto_671912 - BLOCK
      ?auto_671913 - BLOCK
      ?auto_671914 - BLOCK
      ?auto_671915 - BLOCK
      ?auto_671916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671916 ) ( ON-TABLE ?auto_671900 ) ( ON ?auto_671901 ?auto_671900 ) ( ON ?auto_671902 ?auto_671901 ) ( ON ?auto_671903 ?auto_671902 ) ( ON ?auto_671904 ?auto_671903 ) ( ON ?auto_671905 ?auto_671904 ) ( ON ?auto_671906 ?auto_671905 ) ( ON ?auto_671907 ?auto_671906 ) ( not ( = ?auto_671900 ?auto_671901 ) ) ( not ( = ?auto_671900 ?auto_671902 ) ) ( not ( = ?auto_671900 ?auto_671903 ) ) ( not ( = ?auto_671900 ?auto_671904 ) ) ( not ( = ?auto_671900 ?auto_671905 ) ) ( not ( = ?auto_671900 ?auto_671906 ) ) ( not ( = ?auto_671900 ?auto_671907 ) ) ( not ( = ?auto_671900 ?auto_671908 ) ) ( not ( = ?auto_671900 ?auto_671909 ) ) ( not ( = ?auto_671900 ?auto_671910 ) ) ( not ( = ?auto_671900 ?auto_671911 ) ) ( not ( = ?auto_671900 ?auto_671912 ) ) ( not ( = ?auto_671900 ?auto_671913 ) ) ( not ( = ?auto_671900 ?auto_671914 ) ) ( not ( = ?auto_671900 ?auto_671915 ) ) ( not ( = ?auto_671900 ?auto_671916 ) ) ( not ( = ?auto_671901 ?auto_671902 ) ) ( not ( = ?auto_671901 ?auto_671903 ) ) ( not ( = ?auto_671901 ?auto_671904 ) ) ( not ( = ?auto_671901 ?auto_671905 ) ) ( not ( = ?auto_671901 ?auto_671906 ) ) ( not ( = ?auto_671901 ?auto_671907 ) ) ( not ( = ?auto_671901 ?auto_671908 ) ) ( not ( = ?auto_671901 ?auto_671909 ) ) ( not ( = ?auto_671901 ?auto_671910 ) ) ( not ( = ?auto_671901 ?auto_671911 ) ) ( not ( = ?auto_671901 ?auto_671912 ) ) ( not ( = ?auto_671901 ?auto_671913 ) ) ( not ( = ?auto_671901 ?auto_671914 ) ) ( not ( = ?auto_671901 ?auto_671915 ) ) ( not ( = ?auto_671901 ?auto_671916 ) ) ( not ( = ?auto_671902 ?auto_671903 ) ) ( not ( = ?auto_671902 ?auto_671904 ) ) ( not ( = ?auto_671902 ?auto_671905 ) ) ( not ( = ?auto_671902 ?auto_671906 ) ) ( not ( = ?auto_671902 ?auto_671907 ) ) ( not ( = ?auto_671902 ?auto_671908 ) ) ( not ( = ?auto_671902 ?auto_671909 ) ) ( not ( = ?auto_671902 ?auto_671910 ) ) ( not ( = ?auto_671902 ?auto_671911 ) ) ( not ( = ?auto_671902 ?auto_671912 ) ) ( not ( = ?auto_671902 ?auto_671913 ) ) ( not ( = ?auto_671902 ?auto_671914 ) ) ( not ( = ?auto_671902 ?auto_671915 ) ) ( not ( = ?auto_671902 ?auto_671916 ) ) ( not ( = ?auto_671903 ?auto_671904 ) ) ( not ( = ?auto_671903 ?auto_671905 ) ) ( not ( = ?auto_671903 ?auto_671906 ) ) ( not ( = ?auto_671903 ?auto_671907 ) ) ( not ( = ?auto_671903 ?auto_671908 ) ) ( not ( = ?auto_671903 ?auto_671909 ) ) ( not ( = ?auto_671903 ?auto_671910 ) ) ( not ( = ?auto_671903 ?auto_671911 ) ) ( not ( = ?auto_671903 ?auto_671912 ) ) ( not ( = ?auto_671903 ?auto_671913 ) ) ( not ( = ?auto_671903 ?auto_671914 ) ) ( not ( = ?auto_671903 ?auto_671915 ) ) ( not ( = ?auto_671903 ?auto_671916 ) ) ( not ( = ?auto_671904 ?auto_671905 ) ) ( not ( = ?auto_671904 ?auto_671906 ) ) ( not ( = ?auto_671904 ?auto_671907 ) ) ( not ( = ?auto_671904 ?auto_671908 ) ) ( not ( = ?auto_671904 ?auto_671909 ) ) ( not ( = ?auto_671904 ?auto_671910 ) ) ( not ( = ?auto_671904 ?auto_671911 ) ) ( not ( = ?auto_671904 ?auto_671912 ) ) ( not ( = ?auto_671904 ?auto_671913 ) ) ( not ( = ?auto_671904 ?auto_671914 ) ) ( not ( = ?auto_671904 ?auto_671915 ) ) ( not ( = ?auto_671904 ?auto_671916 ) ) ( not ( = ?auto_671905 ?auto_671906 ) ) ( not ( = ?auto_671905 ?auto_671907 ) ) ( not ( = ?auto_671905 ?auto_671908 ) ) ( not ( = ?auto_671905 ?auto_671909 ) ) ( not ( = ?auto_671905 ?auto_671910 ) ) ( not ( = ?auto_671905 ?auto_671911 ) ) ( not ( = ?auto_671905 ?auto_671912 ) ) ( not ( = ?auto_671905 ?auto_671913 ) ) ( not ( = ?auto_671905 ?auto_671914 ) ) ( not ( = ?auto_671905 ?auto_671915 ) ) ( not ( = ?auto_671905 ?auto_671916 ) ) ( not ( = ?auto_671906 ?auto_671907 ) ) ( not ( = ?auto_671906 ?auto_671908 ) ) ( not ( = ?auto_671906 ?auto_671909 ) ) ( not ( = ?auto_671906 ?auto_671910 ) ) ( not ( = ?auto_671906 ?auto_671911 ) ) ( not ( = ?auto_671906 ?auto_671912 ) ) ( not ( = ?auto_671906 ?auto_671913 ) ) ( not ( = ?auto_671906 ?auto_671914 ) ) ( not ( = ?auto_671906 ?auto_671915 ) ) ( not ( = ?auto_671906 ?auto_671916 ) ) ( not ( = ?auto_671907 ?auto_671908 ) ) ( not ( = ?auto_671907 ?auto_671909 ) ) ( not ( = ?auto_671907 ?auto_671910 ) ) ( not ( = ?auto_671907 ?auto_671911 ) ) ( not ( = ?auto_671907 ?auto_671912 ) ) ( not ( = ?auto_671907 ?auto_671913 ) ) ( not ( = ?auto_671907 ?auto_671914 ) ) ( not ( = ?auto_671907 ?auto_671915 ) ) ( not ( = ?auto_671907 ?auto_671916 ) ) ( not ( = ?auto_671908 ?auto_671909 ) ) ( not ( = ?auto_671908 ?auto_671910 ) ) ( not ( = ?auto_671908 ?auto_671911 ) ) ( not ( = ?auto_671908 ?auto_671912 ) ) ( not ( = ?auto_671908 ?auto_671913 ) ) ( not ( = ?auto_671908 ?auto_671914 ) ) ( not ( = ?auto_671908 ?auto_671915 ) ) ( not ( = ?auto_671908 ?auto_671916 ) ) ( not ( = ?auto_671909 ?auto_671910 ) ) ( not ( = ?auto_671909 ?auto_671911 ) ) ( not ( = ?auto_671909 ?auto_671912 ) ) ( not ( = ?auto_671909 ?auto_671913 ) ) ( not ( = ?auto_671909 ?auto_671914 ) ) ( not ( = ?auto_671909 ?auto_671915 ) ) ( not ( = ?auto_671909 ?auto_671916 ) ) ( not ( = ?auto_671910 ?auto_671911 ) ) ( not ( = ?auto_671910 ?auto_671912 ) ) ( not ( = ?auto_671910 ?auto_671913 ) ) ( not ( = ?auto_671910 ?auto_671914 ) ) ( not ( = ?auto_671910 ?auto_671915 ) ) ( not ( = ?auto_671910 ?auto_671916 ) ) ( not ( = ?auto_671911 ?auto_671912 ) ) ( not ( = ?auto_671911 ?auto_671913 ) ) ( not ( = ?auto_671911 ?auto_671914 ) ) ( not ( = ?auto_671911 ?auto_671915 ) ) ( not ( = ?auto_671911 ?auto_671916 ) ) ( not ( = ?auto_671912 ?auto_671913 ) ) ( not ( = ?auto_671912 ?auto_671914 ) ) ( not ( = ?auto_671912 ?auto_671915 ) ) ( not ( = ?auto_671912 ?auto_671916 ) ) ( not ( = ?auto_671913 ?auto_671914 ) ) ( not ( = ?auto_671913 ?auto_671915 ) ) ( not ( = ?auto_671913 ?auto_671916 ) ) ( not ( = ?auto_671914 ?auto_671915 ) ) ( not ( = ?auto_671914 ?auto_671916 ) ) ( not ( = ?auto_671915 ?auto_671916 ) ) ( ON ?auto_671915 ?auto_671916 ) ( ON ?auto_671914 ?auto_671915 ) ( ON ?auto_671913 ?auto_671914 ) ( ON ?auto_671912 ?auto_671913 ) ( ON ?auto_671911 ?auto_671912 ) ( ON ?auto_671910 ?auto_671911 ) ( ON ?auto_671909 ?auto_671910 ) ( CLEAR ?auto_671907 ) ( ON ?auto_671908 ?auto_671909 ) ( CLEAR ?auto_671908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_671900 ?auto_671901 ?auto_671902 ?auto_671903 ?auto_671904 ?auto_671905 ?auto_671906 ?auto_671907 ?auto_671908 )
      ( MAKE-17PILE ?auto_671900 ?auto_671901 ?auto_671902 ?auto_671903 ?auto_671904 ?auto_671905 ?auto_671906 ?auto_671907 ?auto_671908 ?auto_671909 ?auto_671910 ?auto_671911 ?auto_671912 ?auto_671913 ?auto_671914 ?auto_671915 ?auto_671916 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671934 - BLOCK
      ?auto_671935 - BLOCK
      ?auto_671936 - BLOCK
      ?auto_671937 - BLOCK
      ?auto_671938 - BLOCK
      ?auto_671939 - BLOCK
      ?auto_671940 - BLOCK
      ?auto_671941 - BLOCK
      ?auto_671942 - BLOCK
      ?auto_671943 - BLOCK
      ?auto_671944 - BLOCK
      ?auto_671945 - BLOCK
      ?auto_671946 - BLOCK
      ?auto_671947 - BLOCK
      ?auto_671948 - BLOCK
      ?auto_671949 - BLOCK
      ?auto_671950 - BLOCK
    )
    :vars
    (
      ?auto_671951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_671950 ?auto_671951 ) ( ON-TABLE ?auto_671934 ) ( ON ?auto_671935 ?auto_671934 ) ( ON ?auto_671936 ?auto_671935 ) ( ON ?auto_671937 ?auto_671936 ) ( ON ?auto_671938 ?auto_671937 ) ( ON ?auto_671939 ?auto_671938 ) ( ON ?auto_671940 ?auto_671939 ) ( not ( = ?auto_671934 ?auto_671935 ) ) ( not ( = ?auto_671934 ?auto_671936 ) ) ( not ( = ?auto_671934 ?auto_671937 ) ) ( not ( = ?auto_671934 ?auto_671938 ) ) ( not ( = ?auto_671934 ?auto_671939 ) ) ( not ( = ?auto_671934 ?auto_671940 ) ) ( not ( = ?auto_671934 ?auto_671941 ) ) ( not ( = ?auto_671934 ?auto_671942 ) ) ( not ( = ?auto_671934 ?auto_671943 ) ) ( not ( = ?auto_671934 ?auto_671944 ) ) ( not ( = ?auto_671934 ?auto_671945 ) ) ( not ( = ?auto_671934 ?auto_671946 ) ) ( not ( = ?auto_671934 ?auto_671947 ) ) ( not ( = ?auto_671934 ?auto_671948 ) ) ( not ( = ?auto_671934 ?auto_671949 ) ) ( not ( = ?auto_671934 ?auto_671950 ) ) ( not ( = ?auto_671934 ?auto_671951 ) ) ( not ( = ?auto_671935 ?auto_671936 ) ) ( not ( = ?auto_671935 ?auto_671937 ) ) ( not ( = ?auto_671935 ?auto_671938 ) ) ( not ( = ?auto_671935 ?auto_671939 ) ) ( not ( = ?auto_671935 ?auto_671940 ) ) ( not ( = ?auto_671935 ?auto_671941 ) ) ( not ( = ?auto_671935 ?auto_671942 ) ) ( not ( = ?auto_671935 ?auto_671943 ) ) ( not ( = ?auto_671935 ?auto_671944 ) ) ( not ( = ?auto_671935 ?auto_671945 ) ) ( not ( = ?auto_671935 ?auto_671946 ) ) ( not ( = ?auto_671935 ?auto_671947 ) ) ( not ( = ?auto_671935 ?auto_671948 ) ) ( not ( = ?auto_671935 ?auto_671949 ) ) ( not ( = ?auto_671935 ?auto_671950 ) ) ( not ( = ?auto_671935 ?auto_671951 ) ) ( not ( = ?auto_671936 ?auto_671937 ) ) ( not ( = ?auto_671936 ?auto_671938 ) ) ( not ( = ?auto_671936 ?auto_671939 ) ) ( not ( = ?auto_671936 ?auto_671940 ) ) ( not ( = ?auto_671936 ?auto_671941 ) ) ( not ( = ?auto_671936 ?auto_671942 ) ) ( not ( = ?auto_671936 ?auto_671943 ) ) ( not ( = ?auto_671936 ?auto_671944 ) ) ( not ( = ?auto_671936 ?auto_671945 ) ) ( not ( = ?auto_671936 ?auto_671946 ) ) ( not ( = ?auto_671936 ?auto_671947 ) ) ( not ( = ?auto_671936 ?auto_671948 ) ) ( not ( = ?auto_671936 ?auto_671949 ) ) ( not ( = ?auto_671936 ?auto_671950 ) ) ( not ( = ?auto_671936 ?auto_671951 ) ) ( not ( = ?auto_671937 ?auto_671938 ) ) ( not ( = ?auto_671937 ?auto_671939 ) ) ( not ( = ?auto_671937 ?auto_671940 ) ) ( not ( = ?auto_671937 ?auto_671941 ) ) ( not ( = ?auto_671937 ?auto_671942 ) ) ( not ( = ?auto_671937 ?auto_671943 ) ) ( not ( = ?auto_671937 ?auto_671944 ) ) ( not ( = ?auto_671937 ?auto_671945 ) ) ( not ( = ?auto_671937 ?auto_671946 ) ) ( not ( = ?auto_671937 ?auto_671947 ) ) ( not ( = ?auto_671937 ?auto_671948 ) ) ( not ( = ?auto_671937 ?auto_671949 ) ) ( not ( = ?auto_671937 ?auto_671950 ) ) ( not ( = ?auto_671937 ?auto_671951 ) ) ( not ( = ?auto_671938 ?auto_671939 ) ) ( not ( = ?auto_671938 ?auto_671940 ) ) ( not ( = ?auto_671938 ?auto_671941 ) ) ( not ( = ?auto_671938 ?auto_671942 ) ) ( not ( = ?auto_671938 ?auto_671943 ) ) ( not ( = ?auto_671938 ?auto_671944 ) ) ( not ( = ?auto_671938 ?auto_671945 ) ) ( not ( = ?auto_671938 ?auto_671946 ) ) ( not ( = ?auto_671938 ?auto_671947 ) ) ( not ( = ?auto_671938 ?auto_671948 ) ) ( not ( = ?auto_671938 ?auto_671949 ) ) ( not ( = ?auto_671938 ?auto_671950 ) ) ( not ( = ?auto_671938 ?auto_671951 ) ) ( not ( = ?auto_671939 ?auto_671940 ) ) ( not ( = ?auto_671939 ?auto_671941 ) ) ( not ( = ?auto_671939 ?auto_671942 ) ) ( not ( = ?auto_671939 ?auto_671943 ) ) ( not ( = ?auto_671939 ?auto_671944 ) ) ( not ( = ?auto_671939 ?auto_671945 ) ) ( not ( = ?auto_671939 ?auto_671946 ) ) ( not ( = ?auto_671939 ?auto_671947 ) ) ( not ( = ?auto_671939 ?auto_671948 ) ) ( not ( = ?auto_671939 ?auto_671949 ) ) ( not ( = ?auto_671939 ?auto_671950 ) ) ( not ( = ?auto_671939 ?auto_671951 ) ) ( not ( = ?auto_671940 ?auto_671941 ) ) ( not ( = ?auto_671940 ?auto_671942 ) ) ( not ( = ?auto_671940 ?auto_671943 ) ) ( not ( = ?auto_671940 ?auto_671944 ) ) ( not ( = ?auto_671940 ?auto_671945 ) ) ( not ( = ?auto_671940 ?auto_671946 ) ) ( not ( = ?auto_671940 ?auto_671947 ) ) ( not ( = ?auto_671940 ?auto_671948 ) ) ( not ( = ?auto_671940 ?auto_671949 ) ) ( not ( = ?auto_671940 ?auto_671950 ) ) ( not ( = ?auto_671940 ?auto_671951 ) ) ( not ( = ?auto_671941 ?auto_671942 ) ) ( not ( = ?auto_671941 ?auto_671943 ) ) ( not ( = ?auto_671941 ?auto_671944 ) ) ( not ( = ?auto_671941 ?auto_671945 ) ) ( not ( = ?auto_671941 ?auto_671946 ) ) ( not ( = ?auto_671941 ?auto_671947 ) ) ( not ( = ?auto_671941 ?auto_671948 ) ) ( not ( = ?auto_671941 ?auto_671949 ) ) ( not ( = ?auto_671941 ?auto_671950 ) ) ( not ( = ?auto_671941 ?auto_671951 ) ) ( not ( = ?auto_671942 ?auto_671943 ) ) ( not ( = ?auto_671942 ?auto_671944 ) ) ( not ( = ?auto_671942 ?auto_671945 ) ) ( not ( = ?auto_671942 ?auto_671946 ) ) ( not ( = ?auto_671942 ?auto_671947 ) ) ( not ( = ?auto_671942 ?auto_671948 ) ) ( not ( = ?auto_671942 ?auto_671949 ) ) ( not ( = ?auto_671942 ?auto_671950 ) ) ( not ( = ?auto_671942 ?auto_671951 ) ) ( not ( = ?auto_671943 ?auto_671944 ) ) ( not ( = ?auto_671943 ?auto_671945 ) ) ( not ( = ?auto_671943 ?auto_671946 ) ) ( not ( = ?auto_671943 ?auto_671947 ) ) ( not ( = ?auto_671943 ?auto_671948 ) ) ( not ( = ?auto_671943 ?auto_671949 ) ) ( not ( = ?auto_671943 ?auto_671950 ) ) ( not ( = ?auto_671943 ?auto_671951 ) ) ( not ( = ?auto_671944 ?auto_671945 ) ) ( not ( = ?auto_671944 ?auto_671946 ) ) ( not ( = ?auto_671944 ?auto_671947 ) ) ( not ( = ?auto_671944 ?auto_671948 ) ) ( not ( = ?auto_671944 ?auto_671949 ) ) ( not ( = ?auto_671944 ?auto_671950 ) ) ( not ( = ?auto_671944 ?auto_671951 ) ) ( not ( = ?auto_671945 ?auto_671946 ) ) ( not ( = ?auto_671945 ?auto_671947 ) ) ( not ( = ?auto_671945 ?auto_671948 ) ) ( not ( = ?auto_671945 ?auto_671949 ) ) ( not ( = ?auto_671945 ?auto_671950 ) ) ( not ( = ?auto_671945 ?auto_671951 ) ) ( not ( = ?auto_671946 ?auto_671947 ) ) ( not ( = ?auto_671946 ?auto_671948 ) ) ( not ( = ?auto_671946 ?auto_671949 ) ) ( not ( = ?auto_671946 ?auto_671950 ) ) ( not ( = ?auto_671946 ?auto_671951 ) ) ( not ( = ?auto_671947 ?auto_671948 ) ) ( not ( = ?auto_671947 ?auto_671949 ) ) ( not ( = ?auto_671947 ?auto_671950 ) ) ( not ( = ?auto_671947 ?auto_671951 ) ) ( not ( = ?auto_671948 ?auto_671949 ) ) ( not ( = ?auto_671948 ?auto_671950 ) ) ( not ( = ?auto_671948 ?auto_671951 ) ) ( not ( = ?auto_671949 ?auto_671950 ) ) ( not ( = ?auto_671949 ?auto_671951 ) ) ( not ( = ?auto_671950 ?auto_671951 ) ) ( ON ?auto_671949 ?auto_671950 ) ( ON ?auto_671948 ?auto_671949 ) ( ON ?auto_671947 ?auto_671948 ) ( ON ?auto_671946 ?auto_671947 ) ( ON ?auto_671945 ?auto_671946 ) ( ON ?auto_671944 ?auto_671945 ) ( ON ?auto_671943 ?auto_671944 ) ( ON ?auto_671942 ?auto_671943 ) ( CLEAR ?auto_671940 ) ( ON ?auto_671941 ?auto_671942 ) ( CLEAR ?auto_671941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_671934 ?auto_671935 ?auto_671936 ?auto_671937 ?auto_671938 ?auto_671939 ?auto_671940 ?auto_671941 )
      ( MAKE-17PILE ?auto_671934 ?auto_671935 ?auto_671936 ?auto_671937 ?auto_671938 ?auto_671939 ?auto_671940 ?auto_671941 ?auto_671942 ?auto_671943 ?auto_671944 ?auto_671945 ?auto_671946 ?auto_671947 ?auto_671948 ?auto_671949 ?auto_671950 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_671969 - BLOCK
      ?auto_671970 - BLOCK
      ?auto_671971 - BLOCK
      ?auto_671972 - BLOCK
      ?auto_671973 - BLOCK
      ?auto_671974 - BLOCK
      ?auto_671975 - BLOCK
      ?auto_671976 - BLOCK
      ?auto_671977 - BLOCK
      ?auto_671978 - BLOCK
      ?auto_671979 - BLOCK
      ?auto_671980 - BLOCK
      ?auto_671981 - BLOCK
      ?auto_671982 - BLOCK
      ?auto_671983 - BLOCK
      ?auto_671984 - BLOCK
      ?auto_671985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_671985 ) ( ON-TABLE ?auto_671969 ) ( ON ?auto_671970 ?auto_671969 ) ( ON ?auto_671971 ?auto_671970 ) ( ON ?auto_671972 ?auto_671971 ) ( ON ?auto_671973 ?auto_671972 ) ( ON ?auto_671974 ?auto_671973 ) ( ON ?auto_671975 ?auto_671974 ) ( not ( = ?auto_671969 ?auto_671970 ) ) ( not ( = ?auto_671969 ?auto_671971 ) ) ( not ( = ?auto_671969 ?auto_671972 ) ) ( not ( = ?auto_671969 ?auto_671973 ) ) ( not ( = ?auto_671969 ?auto_671974 ) ) ( not ( = ?auto_671969 ?auto_671975 ) ) ( not ( = ?auto_671969 ?auto_671976 ) ) ( not ( = ?auto_671969 ?auto_671977 ) ) ( not ( = ?auto_671969 ?auto_671978 ) ) ( not ( = ?auto_671969 ?auto_671979 ) ) ( not ( = ?auto_671969 ?auto_671980 ) ) ( not ( = ?auto_671969 ?auto_671981 ) ) ( not ( = ?auto_671969 ?auto_671982 ) ) ( not ( = ?auto_671969 ?auto_671983 ) ) ( not ( = ?auto_671969 ?auto_671984 ) ) ( not ( = ?auto_671969 ?auto_671985 ) ) ( not ( = ?auto_671970 ?auto_671971 ) ) ( not ( = ?auto_671970 ?auto_671972 ) ) ( not ( = ?auto_671970 ?auto_671973 ) ) ( not ( = ?auto_671970 ?auto_671974 ) ) ( not ( = ?auto_671970 ?auto_671975 ) ) ( not ( = ?auto_671970 ?auto_671976 ) ) ( not ( = ?auto_671970 ?auto_671977 ) ) ( not ( = ?auto_671970 ?auto_671978 ) ) ( not ( = ?auto_671970 ?auto_671979 ) ) ( not ( = ?auto_671970 ?auto_671980 ) ) ( not ( = ?auto_671970 ?auto_671981 ) ) ( not ( = ?auto_671970 ?auto_671982 ) ) ( not ( = ?auto_671970 ?auto_671983 ) ) ( not ( = ?auto_671970 ?auto_671984 ) ) ( not ( = ?auto_671970 ?auto_671985 ) ) ( not ( = ?auto_671971 ?auto_671972 ) ) ( not ( = ?auto_671971 ?auto_671973 ) ) ( not ( = ?auto_671971 ?auto_671974 ) ) ( not ( = ?auto_671971 ?auto_671975 ) ) ( not ( = ?auto_671971 ?auto_671976 ) ) ( not ( = ?auto_671971 ?auto_671977 ) ) ( not ( = ?auto_671971 ?auto_671978 ) ) ( not ( = ?auto_671971 ?auto_671979 ) ) ( not ( = ?auto_671971 ?auto_671980 ) ) ( not ( = ?auto_671971 ?auto_671981 ) ) ( not ( = ?auto_671971 ?auto_671982 ) ) ( not ( = ?auto_671971 ?auto_671983 ) ) ( not ( = ?auto_671971 ?auto_671984 ) ) ( not ( = ?auto_671971 ?auto_671985 ) ) ( not ( = ?auto_671972 ?auto_671973 ) ) ( not ( = ?auto_671972 ?auto_671974 ) ) ( not ( = ?auto_671972 ?auto_671975 ) ) ( not ( = ?auto_671972 ?auto_671976 ) ) ( not ( = ?auto_671972 ?auto_671977 ) ) ( not ( = ?auto_671972 ?auto_671978 ) ) ( not ( = ?auto_671972 ?auto_671979 ) ) ( not ( = ?auto_671972 ?auto_671980 ) ) ( not ( = ?auto_671972 ?auto_671981 ) ) ( not ( = ?auto_671972 ?auto_671982 ) ) ( not ( = ?auto_671972 ?auto_671983 ) ) ( not ( = ?auto_671972 ?auto_671984 ) ) ( not ( = ?auto_671972 ?auto_671985 ) ) ( not ( = ?auto_671973 ?auto_671974 ) ) ( not ( = ?auto_671973 ?auto_671975 ) ) ( not ( = ?auto_671973 ?auto_671976 ) ) ( not ( = ?auto_671973 ?auto_671977 ) ) ( not ( = ?auto_671973 ?auto_671978 ) ) ( not ( = ?auto_671973 ?auto_671979 ) ) ( not ( = ?auto_671973 ?auto_671980 ) ) ( not ( = ?auto_671973 ?auto_671981 ) ) ( not ( = ?auto_671973 ?auto_671982 ) ) ( not ( = ?auto_671973 ?auto_671983 ) ) ( not ( = ?auto_671973 ?auto_671984 ) ) ( not ( = ?auto_671973 ?auto_671985 ) ) ( not ( = ?auto_671974 ?auto_671975 ) ) ( not ( = ?auto_671974 ?auto_671976 ) ) ( not ( = ?auto_671974 ?auto_671977 ) ) ( not ( = ?auto_671974 ?auto_671978 ) ) ( not ( = ?auto_671974 ?auto_671979 ) ) ( not ( = ?auto_671974 ?auto_671980 ) ) ( not ( = ?auto_671974 ?auto_671981 ) ) ( not ( = ?auto_671974 ?auto_671982 ) ) ( not ( = ?auto_671974 ?auto_671983 ) ) ( not ( = ?auto_671974 ?auto_671984 ) ) ( not ( = ?auto_671974 ?auto_671985 ) ) ( not ( = ?auto_671975 ?auto_671976 ) ) ( not ( = ?auto_671975 ?auto_671977 ) ) ( not ( = ?auto_671975 ?auto_671978 ) ) ( not ( = ?auto_671975 ?auto_671979 ) ) ( not ( = ?auto_671975 ?auto_671980 ) ) ( not ( = ?auto_671975 ?auto_671981 ) ) ( not ( = ?auto_671975 ?auto_671982 ) ) ( not ( = ?auto_671975 ?auto_671983 ) ) ( not ( = ?auto_671975 ?auto_671984 ) ) ( not ( = ?auto_671975 ?auto_671985 ) ) ( not ( = ?auto_671976 ?auto_671977 ) ) ( not ( = ?auto_671976 ?auto_671978 ) ) ( not ( = ?auto_671976 ?auto_671979 ) ) ( not ( = ?auto_671976 ?auto_671980 ) ) ( not ( = ?auto_671976 ?auto_671981 ) ) ( not ( = ?auto_671976 ?auto_671982 ) ) ( not ( = ?auto_671976 ?auto_671983 ) ) ( not ( = ?auto_671976 ?auto_671984 ) ) ( not ( = ?auto_671976 ?auto_671985 ) ) ( not ( = ?auto_671977 ?auto_671978 ) ) ( not ( = ?auto_671977 ?auto_671979 ) ) ( not ( = ?auto_671977 ?auto_671980 ) ) ( not ( = ?auto_671977 ?auto_671981 ) ) ( not ( = ?auto_671977 ?auto_671982 ) ) ( not ( = ?auto_671977 ?auto_671983 ) ) ( not ( = ?auto_671977 ?auto_671984 ) ) ( not ( = ?auto_671977 ?auto_671985 ) ) ( not ( = ?auto_671978 ?auto_671979 ) ) ( not ( = ?auto_671978 ?auto_671980 ) ) ( not ( = ?auto_671978 ?auto_671981 ) ) ( not ( = ?auto_671978 ?auto_671982 ) ) ( not ( = ?auto_671978 ?auto_671983 ) ) ( not ( = ?auto_671978 ?auto_671984 ) ) ( not ( = ?auto_671978 ?auto_671985 ) ) ( not ( = ?auto_671979 ?auto_671980 ) ) ( not ( = ?auto_671979 ?auto_671981 ) ) ( not ( = ?auto_671979 ?auto_671982 ) ) ( not ( = ?auto_671979 ?auto_671983 ) ) ( not ( = ?auto_671979 ?auto_671984 ) ) ( not ( = ?auto_671979 ?auto_671985 ) ) ( not ( = ?auto_671980 ?auto_671981 ) ) ( not ( = ?auto_671980 ?auto_671982 ) ) ( not ( = ?auto_671980 ?auto_671983 ) ) ( not ( = ?auto_671980 ?auto_671984 ) ) ( not ( = ?auto_671980 ?auto_671985 ) ) ( not ( = ?auto_671981 ?auto_671982 ) ) ( not ( = ?auto_671981 ?auto_671983 ) ) ( not ( = ?auto_671981 ?auto_671984 ) ) ( not ( = ?auto_671981 ?auto_671985 ) ) ( not ( = ?auto_671982 ?auto_671983 ) ) ( not ( = ?auto_671982 ?auto_671984 ) ) ( not ( = ?auto_671982 ?auto_671985 ) ) ( not ( = ?auto_671983 ?auto_671984 ) ) ( not ( = ?auto_671983 ?auto_671985 ) ) ( not ( = ?auto_671984 ?auto_671985 ) ) ( ON ?auto_671984 ?auto_671985 ) ( ON ?auto_671983 ?auto_671984 ) ( ON ?auto_671982 ?auto_671983 ) ( ON ?auto_671981 ?auto_671982 ) ( ON ?auto_671980 ?auto_671981 ) ( ON ?auto_671979 ?auto_671980 ) ( ON ?auto_671978 ?auto_671979 ) ( ON ?auto_671977 ?auto_671978 ) ( CLEAR ?auto_671975 ) ( ON ?auto_671976 ?auto_671977 ) ( CLEAR ?auto_671976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_671969 ?auto_671970 ?auto_671971 ?auto_671972 ?auto_671973 ?auto_671974 ?auto_671975 ?auto_671976 )
      ( MAKE-17PILE ?auto_671969 ?auto_671970 ?auto_671971 ?auto_671972 ?auto_671973 ?auto_671974 ?auto_671975 ?auto_671976 ?auto_671977 ?auto_671978 ?auto_671979 ?auto_671980 ?auto_671981 ?auto_671982 ?auto_671983 ?auto_671984 ?auto_671985 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672003 - BLOCK
      ?auto_672004 - BLOCK
      ?auto_672005 - BLOCK
      ?auto_672006 - BLOCK
      ?auto_672007 - BLOCK
      ?auto_672008 - BLOCK
      ?auto_672009 - BLOCK
      ?auto_672010 - BLOCK
      ?auto_672011 - BLOCK
      ?auto_672012 - BLOCK
      ?auto_672013 - BLOCK
      ?auto_672014 - BLOCK
      ?auto_672015 - BLOCK
      ?auto_672016 - BLOCK
      ?auto_672017 - BLOCK
      ?auto_672018 - BLOCK
      ?auto_672019 - BLOCK
    )
    :vars
    (
      ?auto_672020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672019 ?auto_672020 ) ( ON-TABLE ?auto_672003 ) ( ON ?auto_672004 ?auto_672003 ) ( ON ?auto_672005 ?auto_672004 ) ( ON ?auto_672006 ?auto_672005 ) ( ON ?auto_672007 ?auto_672006 ) ( ON ?auto_672008 ?auto_672007 ) ( not ( = ?auto_672003 ?auto_672004 ) ) ( not ( = ?auto_672003 ?auto_672005 ) ) ( not ( = ?auto_672003 ?auto_672006 ) ) ( not ( = ?auto_672003 ?auto_672007 ) ) ( not ( = ?auto_672003 ?auto_672008 ) ) ( not ( = ?auto_672003 ?auto_672009 ) ) ( not ( = ?auto_672003 ?auto_672010 ) ) ( not ( = ?auto_672003 ?auto_672011 ) ) ( not ( = ?auto_672003 ?auto_672012 ) ) ( not ( = ?auto_672003 ?auto_672013 ) ) ( not ( = ?auto_672003 ?auto_672014 ) ) ( not ( = ?auto_672003 ?auto_672015 ) ) ( not ( = ?auto_672003 ?auto_672016 ) ) ( not ( = ?auto_672003 ?auto_672017 ) ) ( not ( = ?auto_672003 ?auto_672018 ) ) ( not ( = ?auto_672003 ?auto_672019 ) ) ( not ( = ?auto_672003 ?auto_672020 ) ) ( not ( = ?auto_672004 ?auto_672005 ) ) ( not ( = ?auto_672004 ?auto_672006 ) ) ( not ( = ?auto_672004 ?auto_672007 ) ) ( not ( = ?auto_672004 ?auto_672008 ) ) ( not ( = ?auto_672004 ?auto_672009 ) ) ( not ( = ?auto_672004 ?auto_672010 ) ) ( not ( = ?auto_672004 ?auto_672011 ) ) ( not ( = ?auto_672004 ?auto_672012 ) ) ( not ( = ?auto_672004 ?auto_672013 ) ) ( not ( = ?auto_672004 ?auto_672014 ) ) ( not ( = ?auto_672004 ?auto_672015 ) ) ( not ( = ?auto_672004 ?auto_672016 ) ) ( not ( = ?auto_672004 ?auto_672017 ) ) ( not ( = ?auto_672004 ?auto_672018 ) ) ( not ( = ?auto_672004 ?auto_672019 ) ) ( not ( = ?auto_672004 ?auto_672020 ) ) ( not ( = ?auto_672005 ?auto_672006 ) ) ( not ( = ?auto_672005 ?auto_672007 ) ) ( not ( = ?auto_672005 ?auto_672008 ) ) ( not ( = ?auto_672005 ?auto_672009 ) ) ( not ( = ?auto_672005 ?auto_672010 ) ) ( not ( = ?auto_672005 ?auto_672011 ) ) ( not ( = ?auto_672005 ?auto_672012 ) ) ( not ( = ?auto_672005 ?auto_672013 ) ) ( not ( = ?auto_672005 ?auto_672014 ) ) ( not ( = ?auto_672005 ?auto_672015 ) ) ( not ( = ?auto_672005 ?auto_672016 ) ) ( not ( = ?auto_672005 ?auto_672017 ) ) ( not ( = ?auto_672005 ?auto_672018 ) ) ( not ( = ?auto_672005 ?auto_672019 ) ) ( not ( = ?auto_672005 ?auto_672020 ) ) ( not ( = ?auto_672006 ?auto_672007 ) ) ( not ( = ?auto_672006 ?auto_672008 ) ) ( not ( = ?auto_672006 ?auto_672009 ) ) ( not ( = ?auto_672006 ?auto_672010 ) ) ( not ( = ?auto_672006 ?auto_672011 ) ) ( not ( = ?auto_672006 ?auto_672012 ) ) ( not ( = ?auto_672006 ?auto_672013 ) ) ( not ( = ?auto_672006 ?auto_672014 ) ) ( not ( = ?auto_672006 ?auto_672015 ) ) ( not ( = ?auto_672006 ?auto_672016 ) ) ( not ( = ?auto_672006 ?auto_672017 ) ) ( not ( = ?auto_672006 ?auto_672018 ) ) ( not ( = ?auto_672006 ?auto_672019 ) ) ( not ( = ?auto_672006 ?auto_672020 ) ) ( not ( = ?auto_672007 ?auto_672008 ) ) ( not ( = ?auto_672007 ?auto_672009 ) ) ( not ( = ?auto_672007 ?auto_672010 ) ) ( not ( = ?auto_672007 ?auto_672011 ) ) ( not ( = ?auto_672007 ?auto_672012 ) ) ( not ( = ?auto_672007 ?auto_672013 ) ) ( not ( = ?auto_672007 ?auto_672014 ) ) ( not ( = ?auto_672007 ?auto_672015 ) ) ( not ( = ?auto_672007 ?auto_672016 ) ) ( not ( = ?auto_672007 ?auto_672017 ) ) ( not ( = ?auto_672007 ?auto_672018 ) ) ( not ( = ?auto_672007 ?auto_672019 ) ) ( not ( = ?auto_672007 ?auto_672020 ) ) ( not ( = ?auto_672008 ?auto_672009 ) ) ( not ( = ?auto_672008 ?auto_672010 ) ) ( not ( = ?auto_672008 ?auto_672011 ) ) ( not ( = ?auto_672008 ?auto_672012 ) ) ( not ( = ?auto_672008 ?auto_672013 ) ) ( not ( = ?auto_672008 ?auto_672014 ) ) ( not ( = ?auto_672008 ?auto_672015 ) ) ( not ( = ?auto_672008 ?auto_672016 ) ) ( not ( = ?auto_672008 ?auto_672017 ) ) ( not ( = ?auto_672008 ?auto_672018 ) ) ( not ( = ?auto_672008 ?auto_672019 ) ) ( not ( = ?auto_672008 ?auto_672020 ) ) ( not ( = ?auto_672009 ?auto_672010 ) ) ( not ( = ?auto_672009 ?auto_672011 ) ) ( not ( = ?auto_672009 ?auto_672012 ) ) ( not ( = ?auto_672009 ?auto_672013 ) ) ( not ( = ?auto_672009 ?auto_672014 ) ) ( not ( = ?auto_672009 ?auto_672015 ) ) ( not ( = ?auto_672009 ?auto_672016 ) ) ( not ( = ?auto_672009 ?auto_672017 ) ) ( not ( = ?auto_672009 ?auto_672018 ) ) ( not ( = ?auto_672009 ?auto_672019 ) ) ( not ( = ?auto_672009 ?auto_672020 ) ) ( not ( = ?auto_672010 ?auto_672011 ) ) ( not ( = ?auto_672010 ?auto_672012 ) ) ( not ( = ?auto_672010 ?auto_672013 ) ) ( not ( = ?auto_672010 ?auto_672014 ) ) ( not ( = ?auto_672010 ?auto_672015 ) ) ( not ( = ?auto_672010 ?auto_672016 ) ) ( not ( = ?auto_672010 ?auto_672017 ) ) ( not ( = ?auto_672010 ?auto_672018 ) ) ( not ( = ?auto_672010 ?auto_672019 ) ) ( not ( = ?auto_672010 ?auto_672020 ) ) ( not ( = ?auto_672011 ?auto_672012 ) ) ( not ( = ?auto_672011 ?auto_672013 ) ) ( not ( = ?auto_672011 ?auto_672014 ) ) ( not ( = ?auto_672011 ?auto_672015 ) ) ( not ( = ?auto_672011 ?auto_672016 ) ) ( not ( = ?auto_672011 ?auto_672017 ) ) ( not ( = ?auto_672011 ?auto_672018 ) ) ( not ( = ?auto_672011 ?auto_672019 ) ) ( not ( = ?auto_672011 ?auto_672020 ) ) ( not ( = ?auto_672012 ?auto_672013 ) ) ( not ( = ?auto_672012 ?auto_672014 ) ) ( not ( = ?auto_672012 ?auto_672015 ) ) ( not ( = ?auto_672012 ?auto_672016 ) ) ( not ( = ?auto_672012 ?auto_672017 ) ) ( not ( = ?auto_672012 ?auto_672018 ) ) ( not ( = ?auto_672012 ?auto_672019 ) ) ( not ( = ?auto_672012 ?auto_672020 ) ) ( not ( = ?auto_672013 ?auto_672014 ) ) ( not ( = ?auto_672013 ?auto_672015 ) ) ( not ( = ?auto_672013 ?auto_672016 ) ) ( not ( = ?auto_672013 ?auto_672017 ) ) ( not ( = ?auto_672013 ?auto_672018 ) ) ( not ( = ?auto_672013 ?auto_672019 ) ) ( not ( = ?auto_672013 ?auto_672020 ) ) ( not ( = ?auto_672014 ?auto_672015 ) ) ( not ( = ?auto_672014 ?auto_672016 ) ) ( not ( = ?auto_672014 ?auto_672017 ) ) ( not ( = ?auto_672014 ?auto_672018 ) ) ( not ( = ?auto_672014 ?auto_672019 ) ) ( not ( = ?auto_672014 ?auto_672020 ) ) ( not ( = ?auto_672015 ?auto_672016 ) ) ( not ( = ?auto_672015 ?auto_672017 ) ) ( not ( = ?auto_672015 ?auto_672018 ) ) ( not ( = ?auto_672015 ?auto_672019 ) ) ( not ( = ?auto_672015 ?auto_672020 ) ) ( not ( = ?auto_672016 ?auto_672017 ) ) ( not ( = ?auto_672016 ?auto_672018 ) ) ( not ( = ?auto_672016 ?auto_672019 ) ) ( not ( = ?auto_672016 ?auto_672020 ) ) ( not ( = ?auto_672017 ?auto_672018 ) ) ( not ( = ?auto_672017 ?auto_672019 ) ) ( not ( = ?auto_672017 ?auto_672020 ) ) ( not ( = ?auto_672018 ?auto_672019 ) ) ( not ( = ?auto_672018 ?auto_672020 ) ) ( not ( = ?auto_672019 ?auto_672020 ) ) ( ON ?auto_672018 ?auto_672019 ) ( ON ?auto_672017 ?auto_672018 ) ( ON ?auto_672016 ?auto_672017 ) ( ON ?auto_672015 ?auto_672016 ) ( ON ?auto_672014 ?auto_672015 ) ( ON ?auto_672013 ?auto_672014 ) ( ON ?auto_672012 ?auto_672013 ) ( ON ?auto_672011 ?auto_672012 ) ( ON ?auto_672010 ?auto_672011 ) ( CLEAR ?auto_672008 ) ( ON ?auto_672009 ?auto_672010 ) ( CLEAR ?auto_672009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_672003 ?auto_672004 ?auto_672005 ?auto_672006 ?auto_672007 ?auto_672008 ?auto_672009 )
      ( MAKE-17PILE ?auto_672003 ?auto_672004 ?auto_672005 ?auto_672006 ?auto_672007 ?auto_672008 ?auto_672009 ?auto_672010 ?auto_672011 ?auto_672012 ?auto_672013 ?auto_672014 ?auto_672015 ?auto_672016 ?auto_672017 ?auto_672018 ?auto_672019 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672038 - BLOCK
      ?auto_672039 - BLOCK
      ?auto_672040 - BLOCK
      ?auto_672041 - BLOCK
      ?auto_672042 - BLOCK
      ?auto_672043 - BLOCK
      ?auto_672044 - BLOCK
      ?auto_672045 - BLOCK
      ?auto_672046 - BLOCK
      ?auto_672047 - BLOCK
      ?auto_672048 - BLOCK
      ?auto_672049 - BLOCK
      ?auto_672050 - BLOCK
      ?auto_672051 - BLOCK
      ?auto_672052 - BLOCK
      ?auto_672053 - BLOCK
      ?auto_672054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672054 ) ( ON-TABLE ?auto_672038 ) ( ON ?auto_672039 ?auto_672038 ) ( ON ?auto_672040 ?auto_672039 ) ( ON ?auto_672041 ?auto_672040 ) ( ON ?auto_672042 ?auto_672041 ) ( ON ?auto_672043 ?auto_672042 ) ( not ( = ?auto_672038 ?auto_672039 ) ) ( not ( = ?auto_672038 ?auto_672040 ) ) ( not ( = ?auto_672038 ?auto_672041 ) ) ( not ( = ?auto_672038 ?auto_672042 ) ) ( not ( = ?auto_672038 ?auto_672043 ) ) ( not ( = ?auto_672038 ?auto_672044 ) ) ( not ( = ?auto_672038 ?auto_672045 ) ) ( not ( = ?auto_672038 ?auto_672046 ) ) ( not ( = ?auto_672038 ?auto_672047 ) ) ( not ( = ?auto_672038 ?auto_672048 ) ) ( not ( = ?auto_672038 ?auto_672049 ) ) ( not ( = ?auto_672038 ?auto_672050 ) ) ( not ( = ?auto_672038 ?auto_672051 ) ) ( not ( = ?auto_672038 ?auto_672052 ) ) ( not ( = ?auto_672038 ?auto_672053 ) ) ( not ( = ?auto_672038 ?auto_672054 ) ) ( not ( = ?auto_672039 ?auto_672040 ) ) ( not ( = ?auto_672039 ?auto_672041 ) ) ( not ( = ?auto_672039 ?auto_672042 ) ) ( not ( = ?auto_672039 ?auto_672043 ) ) ( not ( = ?auto_672039 ?auto_672044 ) ) ( not ( = ?auto_672039 ?auto_672045 ) ) ( not ( = ?auto_672039 ?auto_672046 ) ) ( not ( = ?auto_672039 ?auto_672047 ) ) ( not ( = ?auto_672039 ?auto_672048 ) ) ( not ( = ?auto_672039 ?auto_672049 ) ) ( not ( = ?auto_672039 ?auto_672050 ) ) ( not ( = ?auto_672039 ?auto_672051 ) ) ( not ( = ?auto_672039 ?auto_672052 ) ) ( not ( = ?auto_672039 ?auto_672053 ) ) ( not ( = ?auto_672039 ?auto_672054 ) ) ( not ( = ?auto_672040 ?auto_672041 ) ) ( not ( = ?auto_672040 ?auto_672042 ) ) ( not ( = ?auto_672040 ?auto_672043 ) ) ( not ( = ?auto_672040 ?auto_672044 ) ) ( not ( = ?auto_672040 ?auto_672045 ) ) ( not ( = ?auto_672040 ?auto_672046 ) ) ( not ( = ?auto_672040 ?auto_672047 ) ) ( not ( = ?auto_672040 ?auto_672048 ) ) ( not ( = ?auto_672040 ?auto_672049 ) ) ( not ( = ?auto_672040 ?auto_672050 ) ) ( not ( = ?auto_672040 ?auto_672051 ) ) ( not ( = ?auto_672040 ?auto_672052 ) ) ( not ( = ?auto_672040 ?auto_672053 ) ) ( not ( = ?auto_672040 ?auto_672054 ) ) ( not ( = ?auto_672041 ?auto_672042 ) ) ( not ( = ?auto_672041 ?auto_672043 ) ) ( not ( = ?auto_672041 ?auto_672044 ) ) ( not ( = ?auto_672041 ?auto_672045 ) ) ( not ( = ?auto_672041 ?auto_672046 ) ) ( not ( = ?auto_672041 ?auto_672047 ) ) ( not ( = ?auto_672041 ?auto_672048 ) ) ( not ( = ?auto_672041 ?auto_672049 ) ) ( not ( = ?auto_672041 ?auto_672050 ) ) ( not ( = ?auto_672041 ?auto_672051 ) ) ( not ( = ?auto_672041 ?auto_672052 ) ) ( not ( = ?auto_672041 ?auto_672053 ) ) ( not ( = ?auto_672041 ?auto_672054 ) ) ( not ( = ?auto_672042 ?auto_672043 ) ) ( not ( = ?auto_672042 ?auto_672044 ) ) ( not ( = ?auto_672042 ?auto_672045 ) ) ( not ( = ?auto_672042 ?auto_672046 ) ) ( not ( = ?auto_672042 ?auto_672047 ) ) ( not ( = ?auto_672042 ?auto_672048 ) ) ( not ( = ?auto_672042 ?auto_672049 ) ) ( not ( = ?auto_672042 ?auto_672050 ) ) ( not ( = ?auto_672042 ?auto_672051 ) ) ( not ( = ?auto_672042 ?auto_672052 ) ) ( not ( = ?auto_672042 ?auto_672053 ) ) ( not ( = ?auto_672042 ?auto_672054 ) ) ( not ( = ?auto_672043 ?auto_672044 ) ) ( not ( = ?auto_672043 ?auto_672045 ) ) ( not ( = ?auto_672043 ?auto_672046 ) ) ( not ( = ?auto_672043 ?auto_672047 ) ) ( not ( = ?auto_672043 ?auto_672048 ) ) ( not ( = ?auto_672043 ?auto_672049 ) ) ( not ( = ?auto_672043 ?auto_672050 ) ) ( not ( = ?auto_672043 ?auto_672051 ) ) ( not ( = ?auto_672043 ?auto_672052 ) ) ( not ( = ?auto_672043 ?auto_672053 ) ) ( not ( = ?auto_672043 ?auto_672054 ) ) ( not ( = ?auto_672044 ?auto_672045 ) ) ( not ( = ?auto_672044 ?auto_672046 ) ) ( not ( = ?auto_672044 ?auto_672047 ) ) ( not ( = ?auto_672044 ?auto_672048 ) ) ( not ( = ?auto_672044 ?auto_672049 ) ) ( not ( = ?auto_672044 ?auto_672050 ) ) ( not ( = ?auto_672044 ?auto_672051 ) ) ( not ( = ?auto_672044 ?auto_672052 ) ) ( not ( = ?auto_672044 ?auto_672053 ) ) ( not ( = ?auto_672044 ?auto_672054 ) ) ( not ( = ?auto_672045 ?auto_672046 ) ) ( not ( = ?auto_672045 ?auto_672047 ) ) ( not ( = ?auto_672045 ?auto_672048 ) ) ( not ( = ?auto_672045 ?auto_672049 ) ) ( not ( = ?auto_672045 ?auto_672050 ) ) ( not ( = ?auto_672045 ?auto_672051 ) ) ( not ( = ?auto_672045 ?auto_672052 ) ) ( not ( = ?auto_672045 ?auto_672053 ) ) ( not ( = ?auto_672045 ?auto_672054 ) ) ( not ( = ?auto_672046 ?auto_672047 ) ) ( not ( = ?auto_672046 ?auto_672048 ) ) ( not ( = ?auto_672046 ?auto_672049 ) ) ( not ( = ?auto_672046 ?auto_672050 ) ) ( not ( = ?auto_672046 ?auto_672051 ) ) ( not ( = ?auto_672046 ?auto_672052 ) ) ( not ( = ?auto_672046 ?auto_672053 ) ) ( not ( = ?auto_672046 ?auto_672054 ) ) ( not ( = ?auto_672047 ?auto_672048 ) ) ( not ( = ?auto_672047 ?auto_672049 ) ) ( not ( = ?auto_672047 ?auto_672050 ) ) ( not ( = ?auto_672047 ?auto_672051 ) ) ( not ( = ?auto_672047 ?auto_672052 ) ) ( not ( = ?auto_672047 ?auto_672053 ) ) ( not ( = ?auto_672047 ?auto_672054 ) ) ( not ( = ?auto_672048 ?auto_672049 ) ) ( not ( = ?auto_672048 ?auto_672050 ) ) ( not ( = ?auto_672048 ?auto_672051 ) ) ( not ( = ?auto_672048 ?auto_672052 ) ) ( not ( = ?auto_672048 ?auto_672053 ) ) ( not ( = ?auto_672048 ?auto_672054 ) ) ( not ( = ?auto_672049 ?auto_672050 ) ) ( not ( = ?auto_672049 ?auto_672051 ) ) ( not ( = ?auto_672049 ?auto_672052 ) ) ( not ( = ?auto_672049 ?auto_672053 ) ) ( not ( = ?auto_672049 ?auto_672054 ) ) ( not ( = ?auto_672050 ?auto_672051 ) ) ( not ( = ?auto_672050 ?auto_672052 ) ) ( not ( = ?auto_672050 ?auto_672053 ) ) ( not ( = ?auto_672050 ?auto_672054 ) ) ( not ( = ?auto_672051 ?auto_672052 ) ) ( not ( = ?auto_672051 ?auto_672053 ) ) ( not ( = ?auto_672051 ?auto_672054 ) ) ( not ( = ?auto_672052 ?auto_672053 ) ) ( not ( = ?auto_672052 ?auto_672054 ) ) ( not ( = ?auto_672053 ?auto_672054 ) ) ( ON ?auto_672053 ?auto_672054 ) ( ON ?auto_672052 ?auto_672053 ) ( ON ?auto_672051 ?auto_672052 ) ( ON ?auto_672050 ?auto_672051 ) ( ON ?auto_672049 ?auto_672050 ) ( ON ?auto_672048 ?auto_672049 ) ( ON ?auto_672047 ?auto_672048 ) ( ON ?auto_672046 ?auto_672047 ) ( ON ?auto_672045 ?auto_672046 ) ( CLEAR ?auto_672043 ) ( ON ?auto_672044 ?auto_672045 ) ( CLEAR ?auto_672044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_672038 ?auto_672039 ?auto_672040 ?auto_672041 ?auto_672042 ?auto_672043 ?auto_672044 )
      ( MAKE-17PILE ?auto_672038 ?auto_672039 ?auto_672040 ?auto_672041 ?auto_672042 ?auto_672043 ?auto_672044 ?auto_672045 ?auto_672046 ?auto_672047 ?auto_672048 ?auto_672049 ?auto_672050 ?auto_672051 ?auto_672052 ?auto_672053 ?auto_672054 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672072 - BLOCK
      ?auto_672073 - BLOCK
      ?auto_672074 - BLOCK
      ?auto_672075 - BLOCK
      ?auto_672076 - BLOCK
      ?auto_672077 - BLOCK
      ?auto_672078 - BLOCK
      ?auto_672079 - BLOCK
      ?auto_672080 - BLOCK
      ?auto_672081 - BLOCK
      ?auto_672082 - BLOCK
      ?auto_672083 - BLOCK
      ?auto_672084 - BLOCK
      ?auto_672085 - BLOCK
      ?auto_672086 - BLOCK
      ?auto_672087 - BLOCK
      ?auto_672088 - BLOCK
    )
    :vars
    (
      ?auto_672089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672088 ?auto_672089 ) ( ON-TABLE ?auto_672072 ) ( ON ?auto_672073 ?auto_672072 ) ( ON ?auto_672074 ?auto_672073 ) ( ON ?auto_672075 ?auto_672074 ) ( ON ?auto_672076 ?auto_672075 ) ( not ( = ?auto_672072 ?auto_672073 ) ) ( not ( = ?auto_672072 ?auto_672074 ) ) ( not ( = ?auto_672072 ?auto_672075 ) ) ( not ( = ?auto_672072 ?auto_672076 ) ) ( not ( = ?auto_672072 ?auto_672077 ) ) ( not ( = ?auto_672072 ?auto_672078 ) ) ( not ( = ?auto_672072 ?auto_672079 ) ) ( not ( = ?auto_672072 ?auto_672080 ) ) ( not ( = ?auto_672072 ?auto_672081 ) ) ( not ( = ?auto_672072 ?auto_672082 ) ) ( not ( = ?auto_672072 ?auto_672083 ) ) ( not ( = ?auto_672072 ?auto_672084 ) ) ( not ( = ?auto_672072 ?auto_672085 ) ) ( not ( = ?auto_672072 ?auto_672086 ) ) ( not ( = ?auto_672072 ?auto_672087 ) ) ( not ( = ?auto_672072 ?auto_672088 ) ) ( not ( = ?auto_672072 ?auto_672089 ) ) ( not ( = ?auto_672073 ?auto_672074 ) ) ( not ( = ?auto_672073 ?auto_672075 ) ) ( not ( = ?auto_672073 ?auto_672076 ) ) ( not ( = ?auto_672073 ?auto_672077 ) ) ( not ( = ?auto_672073 ?auto_672078 ) ) ( not ( = ?auto_672073 ?auto_672079 ) ) ( not ( = ?auto_672073 ?auto_672080 ) ) ( not ( = ?auto_672073 ?auto_672081 ) ) ( not ( = ?auto_672073 ?auto_672082 ) ) ( not ( = ?auto_672073 ?auto_672083 ) ) ( not ( = ?auto_672073 ?auto_672084 ) ) ( not ( = ?auto_672073 ?auto_672085 ) ) ( not ( = ?auto_672073 ?auto_672086 ) ) ( not ( = ?auto_672073 ?auto_672087 ) ) ( not ( = ?auto_672073 ?auto_672088 ) ) ( not ( = ?auto_672073 ?auto_672089 ) ) ( not ( = ?auto_672074 ?auto_672075 ) ) ( not ( = ?auto_672074 ?auto_672076 ) ) ( not ( = ?auto_672074 ?auto_672077 ) ) ( not ( = ?auto_672074 ?auto_672078 ) ) ( not ( = ?auto_672074 ?auto_672079 ) ) ( not ( = ?auto_672074 ?auto_672080 ) ) ( not ( = ?auto_672074 ?auto_672081 ) ) ( not ( = ?auto_672074 ?auto_672082 ) ) ( not ( = ?auto_672074 ?auto_672083 ) ) ( not ( = ?auto_672074 ?auto_672084 ) ) ( not ( = ?auto_672074 ?auto_672085 ) ) ( not ( = ?auto_672074 ?auto_672086 ) ) ( not ( = ?auto_672074 ?auto_672087 ) ) ( not ( = ?auto_672074 ?auto_672088 ) ) ( not ( = ?auto_672074 ?auto_672089 ) ) ( not ( = ?auto_672075 ?auto_672076 ) ) ( not ( = ?auto_672075 ?auto_672077 ) ) ( not ( = ?auto_672075 ?auto_672078 ) ) ( not ( = ?auto_672075 ?auto_672079 ) ) ( not ( = ?auto_672075 ?auto_672080 ) ) ( not ( = ?auto_672075 ?auto_672081 ) ) ( not ( = ?auto_672075 ?auto_672082 ) ) ( not ( = ?auto_672075 ?auto_672083 ) ) ( not ( = ?auto_672075 ?auto_672084 ) ) ( not ( = ?auto_672075 ?auto_672085 ) ) ( not ( = ?auto_672075 ?auto_672086 ) ) ( not ( = ?auto_672075 ?auto_672087 ) ) ( not ( = ?auto_672075 ?auto_672088 ) ) ( not ( = ?auto_672075 ?auto_672089 ) ) ( not ( = ?auto_672076 ?auto_672077 ) ) ( not ( = ?auto_672076 ?auto_672078 ) ) ( not ( = ?auto_672076 ?auto_672079 ) ) ( not ( = ?auto_672076 ?auto_672080 ) ) ( not ( = ?auto_672076 ?auto_672081 ) ) ( not ( = ?auto_672076 ?auto_672082 ) ) ( not ( = ?auto_672076 ?auto_672083 ) ) ( not ( = ?auto_672076 ?auto_672084 ) ) ( not ( = ?auto_672076 ?auto_672085 ) ) ( not ( = ?auto_672076 ?auto_672086 ) ) ( not ( = ?auto_672076 ?auto_672087 ) ) ( not ( = ?auto_672076 ?auto_672088 ) ) ( not ( = ?auto_672076 ?auto_672089 ) ) ( not ( = ?auto_672077 ?auto_672078 ) ) ( not ( = ?auto_672077 ?auto_672079 ) ) ( not ( = ?auto_672077 ?auto_672080 ) ) ( not ( = ?auto_672077 ?auto_672081 ) ) ( not ( = ?auto_672077 ?auto_672082 ) ) ( not ( = ?auto_672077 ?auto_672083 ) ) ( not ( = ?auto_672077 ?auto_672084 ) ) ( not ( = ?auto_672077 ?auto_672085 ) ) ( not ( = ?auto_672077 ?auto_672086 ) ) ( not ( = ?auto_672077 ?auto_672087 ) ) ( not ( = ?auto_672077 ?auto_672088 ) ) ( not ( = ?auto_672077 ?auto_672089 ) ) ( not ( = ?auto_672078 ?auto_672079 ) ) ( not ( = ?auto_672078 ?auto_672080 ) ) ( not ( = ?auto_672078 ?auto_672081 ) ) ( not ( = ?auto_672078 ?auto_672082 ) ) ( not ( = ?auto_672078 ?auto_672083 ) ) ( not ( = ?auto_672078 ?auto_672084 ) ) ( not ( = ?auto_672078 ?auto_672085 ) ) ( not ( = ?auto_672078 ?auto_672086 ) ) ( not ( = ?auto_672078 ?auto_672087 ) ) ( not ( = ?auto_672078 ?auto_672088 ) ) ( not ( = ?auto_672078 ?auto_672089 ) ) ( not ( = ?auto_672079 ?auto_672080 ) ) ( not ( = ?auto_672079 ?auto_672081 ) ) ( not ( = ?auto_672079 ?auto_672082 ) ) ( not ( = ?auto_672079 ?auto_672083 ) ) ( not ( = ?auto_672079 ?auto_672084 ) ) ( not ( = ?auto_672079 ?auto_672085 ) ) ( not ( = ?auto_672079 ?auto_672086 ) ) ( not ( = ?auto_672079 ?auto_672087 ) ) ( not ( = ?auto_672079 ?auto_672088 ) ) ( not ( = ?auto_672079 ?auto_672089 ) ) ( not ( = ?auto_672080 ?auto_672081 ) ) ( not ( = ?auto_672080 ?auto_672082 ) ) ( not ( = ?auto_672080 ?auto_672083 ) ) ( not ( = ?auto_672080 ?auto_672084 ) ) ( not ( = ?auto_672080 ?auto_672085 ) ) ( not ( = ?auto_672080 ?auto_672086 ) ) ( not ( = ?auto_672080 ?auto_672087 ) ) ( not ( = ?auto_672080 ?auto_672088 ) ) ( not ( = ?auto_672080 ?auto_672089 ) ) ( not ( = ?auto_672081 ?auto_672082 ) ) ( not ( = ?auto_672081 ?auto_672083 ) ) ( not ( = ?auto_672081 ?auto_672084 ) ) ( not ( = ?auto_672081 ?auto_672085 ) ) ( not ( = ?auto_672081 ?auto_672086 ) ) ( not ( = ?auto_672081 ?auto_672087 ) ) ( not ( = ?auto_672081 ?auto_672088 ) ) ( not ( = ?auto_672081 ?auto_672089 ) ) ( not ( = ?auto_672082 ?auto_672083 ) ) ( not ( = ?auto_672082 ?auto_672084 ) ) ( not ( = ?auto_672082 ?auto_672085 ) ) ( not ( = ?auto_672082 ?auto_672086 ) ) ( not ( = ?auto_672082 ?auto_672087 ) ) ( not ( = ?auto_672082 ?auto_672088 ) ) ( not ( = ?auto_672082 ?auto_672089 ) ) ( not ( = ?auto_672083 ?auto_672084 ) ) ( not ( = ?auto_672083 ?auto_672085 ) ) ( not ( = ?auto_672083 ?auto_672086 ) ) ( not ( = ?auto_672083 ?auto_672087 ) ) ( not ( = ?auto_672083 ?auto_672088 ) ) ( not ( = ?auto_672083 ?auto_672089 ) ) ( not ( = ?auto_672084 ?auto_672085 ) ) ( not ( = ?auto_672084 ?auto_672086 ) ) ( not ( = ?auto_672084 ?auto_672087 ) ) ( not ( = ?auto_672084 ?auto_672088 ) ) ( not ( = ?auto_672084 ?auto_672089 ) ) ( not ( = ?auto_672085 ?auto_672086 ) ) ( not ( = ?auto_672085 ?auto_672087 ) ) ( not ( = ?auto_672085 ?auto_672088 ) ) ( not ( = ?auto_672085 ?auto_672089 ) ) ( not ( = ?auto_672086 ?auto_672087 ) ) ( not ( = ?auto_672086 ?auto_672088 ) ) ( not ( = ?auto_672086 ?auto_672089 ) ) ( not ( = ?auto_672087 ?auto_672088 ) ) ( not ( = ?auto_672087 ?auto_672089 ) ) ( not ( = ?auto_672088 ?auto_672089 ) ) ( ON ?auto_672087 ?auto_672088 ) ( ON ?auto_672086 ?auto_672087 ) ( ON ?auto_672085 ?auto_672086 ) ( ON ?auto_672084 ?auto_672085 ) ( ON ?auto_672083 ?auto_672084 ) ( ON ?auto_672082 ?auto_672083 ) ( ON ?auto_672081 ?auto_672082 ) ( ON ?auto_672080 ?auto_672081 ) ( ON ?auto_672079 ?auto_672080 ) ( ON ?auto_672078 ?auto_672079 ) ( CLEAR ?auto_672076 ) ( ON ?auto_672077 ?auto_672078 ) ( CLEAR ?auto_672077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_672072 ?auto_672073 ?auto_672074 ?auto_672075 ?auto_672076 ?auto_672077 )
      ( MAKE-17PILE ?auto_672072 ?auto_672073 ?auto_672074 ?auto_672075 ?auto_672076 ?auto_672077 ?auto_672078 ?auto_672079 ?auto_672080 ?auto_672081 ?auto_672082 ?auto_672083 ?auto_672084 ?auto_672085 ?auto_672086 ?auto_672087 ?auto_672088 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672107 - BLOCK
      ?auto_672108 - BLOCK
      ?auto_672109 - BLOCK
      ?auto_672110 - BLOCK
      ?auto_672111 - BLOCK
      ?auto_672112 - BLOCK
      ?auto_672113 - BLOCK
      ?auto_672114 - BLOCK
      ?auto_672115 - BLOCK
      ?auto_672116 - BLOCK
      ?auto_672117 - BLOCK
      ?auto_672118 - BLOCK
      ?auto_672119 - BLOCK
      ?auto_672120 - BLOCK
      ?auto_672121 - BLOCK
      ?auto_672122 - BLOCK
      ?auto_672123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672123 ) ( ON-TABLE ?auto_672107 ) ( ON ?auto_672108 ?auto_672107 ) ( ON ?auto_672109 ?auto_672108 ) ( ON ?auto_672110 ?auto_672109 ) ( ON ?auto_672111 ?auto_672110 ) ( not ( = ?auto_672107 ?auto_672108 ) ) ( not ( = ?auto_672107 ?auto_672109 ) ) ( not ( = ?auto_672107 ?auto_672110 ) ) ( not ( = ?auto_672107 ?auto_672111 ) ) ( not ( = ?auto_672107 ?auto_672112 ) ) ( not ( = ?auto_672107 ?auto_672113 ) ) ( not ( = ?auto_672107 ?auto_672114 ) ) ( not ( = ?auto_672107 ?auto_672115 ) ) ( not ( = ?auto_672107 ?auto_672116 ) ) ( not ( = ?auto_672107 ?auto_672117 ) ) ( not ( = ?auto_672107 ?auto_672118 ) ) ( not ( = ?auto_672107 ?auto_672119 ) ) ( not ( = ?auto_672107 ?auto_672120 ) ) ( not ( = ?auto_672107 ?auto_672121 ) ) ( not ( = ?auto_672107 ?auto_672122 ) ) ( not ( = ?auto_672107 ?auto_672123 ) ) ( not ( = ?auto_672108 ?auto_672109 ) ) ( not ( = ?auto_672108 ?auto_672110 ) ) ( not ( = ?auto_672108 ?auto_672111 ) ) ( not ( = ?auto_672108 ?auto_672112 ) ) ( not ( = ?auto_672108 ?auto_672113 ) ) ( not ( = ?auto_672108 ?auto_672114 ) ) ( not ( = ?auto_672108 ?auto_672115 ) ) ( not ( = ?auto_672108 ?auto_672116 ) ) ( not ( = ?auto_672108 ?auto_672117 ) ) ( not ( = ?auto_672108 ?auto_672118 ) ) ( not ( = ?auto_672108 ?auto_672119 ) ) ( not ( = ?auto_672108 ?auto_672120 ) ) ( not ( = ?auto_672108 ?auto_672121 ) ) ( not ( = ?auto_672108 ?auto_672122 ) ) ( not ( = ?auto_672108 ?auto_672123 ) ) ( not ( = ?auto_672109 ?auto_672110 ) ) ( not ( = ?auto_672109 ?auto_672111 ) ) ( not ( = ?auto_672109 ?auto_672112 ) ) ( not ( = ?auto_672109 ?auto_672113 ) ) ( not ( = ?auto_672109 ?auto_672114 ) ) ( not ( = ?auto_672109 ?auto_672115 ) ) ( not ( = ?auto_672109 ?auto_672116 ) ) ( not ( = ?auto_672109 ?auto_672117 ) ) ( not ( = ?auto_672109 ?auto_672118 ) ) ( not ( = ?auto_672109 ?auto_672119 ) ) ( not ( = ?auto_672109 ?auto_672120 ) ) ( not ( = ?auto_672109 ?auto_672121 ) ) ( not ( = ?auto_672109 ?auto_672122 ) ) ( not ( = ?auto_672109 ?auto_672123 ) ) ( not ( = ?auto_672110 ?auto_672111 ) ) ( not ( = ?auto_672110 ?auto_672112 ) ) ( not ( = ?auto_672110 ?auto_672113 ) ) ( not ( = ?auto_672110 ?auto_672114 ) ) ( not ( = ?auto_672110 ?auto_672115 ) ) ( not ( = ?auto_672110 ?auto_672116 ) ) ( not ( = ?auto_672110 ?auto_672117 ) ) ( not ( = ?auto_672110 ?auto_672118 ) ) ( not ( = ?auto_672110 ?auto_672119 ) ) ( not ( = ?auto_672110 ?auto_672120 ) ) ( not ( = ?auto_672110 ?auto_672121 ) ) ( not ( = ?auto_672110 ?auto_672122 ) ) ( not ( = ?auto_672110 ?auto_672123 ) ) ( not ( = ?auto_672111 ?auto_672112 ) ) ( not ( = ?auto_672111 ?auto_672113 ) ) ( not ( = ?auto_672111 ?auto_672114 ) ) ( not ( = ?auto_672111 ?auto_672115 ) ) ( not ( = ?auto_672111 ?auto_672116 ) ) ( not ( = ?auto_672111 ?auto_672117 ) ) ( not ( = ?auto_672111 ?auto_672118 ) ) ( not ( = ?auto_672111 ?auto_672119 ) ) ( not ( = ?auto_672111 ?auto_672120 ) ) ( not ( = ?auto_672111 ?auto_672121 ) ) ( not ( = ?auto_672111 ?auto_672122 ) ) ( not ( = ?auto_672111 ?auto_672123 ) ) ( not ( = ?auto_672112 ?auto_672113 ) ) ( not ( = ?auto_672112 ?auto_672114 ) ) ( not ( = ?auto_672112 ?auto_672115 ) ) ( not ( = ?auto_672112 ?auto_672116 ) ) ( not ( = ?auto_672112 ?auto_672117 ) ) ( not ( = ?auto_672112 ?auto_672118 ) ) ( not ( = ?auto_672112 ?auto_672119 ) ) ( not ( = ?auto_672112 ?auto_672120 ) ) ( not ( = ?auto_672112 ?auto_672121 ) ) ( not ( = ?auto_672112 ?auto_672122 ) ) ( not ( = ?auto_672112 ?auto_672123 ) ) ( not ( = ?auto_672113 ?auto_672114 ) ) ( not ( = ?auto_672113 ?auto_672115 ) ) ( not ( = ?auto_672113 ?auto_672116 ) ) ( not ( = ?auto_672113 ?auto_672117 ) ) ( not ( = ?auto_672113 ?auto_672118 ) ) ( not ( = ?auto_672113 ?auto_672119 ) ) ( not ( = ?auto_672113 ?auto_672120 ) ) ( not ( = ?auto_672113 ?auto_672121 ) ) ( not ( = ?auto_672113 ?auto_672122 ) ) ( not ( = ?auto_672113 ?auto_672123 ) ) ( not ( = ?auto_672114 ?auto_672115 ) ) ( not ( = ?auto_672114 ?auto_672116 ) ) ( not ( = ?auto_672114 ?auto_672117 ) ) ( not ( = ?auto_672114 ?auto_672118 ) ) ( not ( = ?auto_672114 ?auto_672119 ) ) ( not ( = ?auto_672114 ?auto_672120 ) ) ( not ( = ?auto_672114 ?auto_672121 ) ) ( not ( = ?auto_672114 ?auto_672122 ) ) ( not ( = ?auto_672114 ?auto_672123 ) ) ( not ( = ?auto_672115 ?auto_672116 ) ) ( not ( = ?auto_672115 ?auto_672117 ) ) ( not ( = ?auto_672115 ?auto_672118 ) ) ( not ( = ?auto_672115 ?auto_672119 ) ) ( not ( = ?auto_672115 ?auto_672120 ) ) ( not ( = ?auto_672115 ?auto_672121 ) ) ( not ( = ?auto_672115 ?auto_672122 ) ) ( not ( = ?auto_672115 ?auto_672123 ) ) ( not ( = ?auto_672116 ?auto_672117 ) ) ( not ( = ?auto_672116 ?auto_672118 ) ) ( not ( = ?auto_672116 ?auto_672119 ) ) ( not ( = ?auto_672116 ?auto_672120 ) ) ( not ( = ?auto_672116 ?auto_672121 ) ) ( not ( = ?auto_672116 ?auto_672122 ) ) ( not ( = ?auto_672116 ?auto_672123 ) ) ( not ( = ?auto_672117 ?auto_672118 ) ) ( not ( = ?auto_672117 ?auto_672119 ) ) ( not ( = ?auto_672117 ?auto_672120 ) ) ( not ( = ?auto_672117 ?auto_672121 ) ) ( not ( = ?auto_672117 ?auto_672122 ) ) ( not ( = ?auto_672117 ?auto_672123 ) ) ( not ( = ?auto_672118 ?auto_672119 ) ) ( not ( = ?auto_672118 ?auto_672120 ) ) ( not ( = ?auto_672118 ?auto_672121 ) ) ( not ( = ?auto_672118 ?auto_672122 ) ) ( not ( = ?auto_672118 ?auto_672123 ) ) ( not ( = ?auto_672119 ?auto_672120 ) ) ( not ( = ?auto_672119 ?auto_672121 ) ) ( not ( = ?auto_672119 ?auto_672122 ) ) ( not ( = ?auto_672119 ?auto_672123 ) ) ( not ( = ?auto_672120 ?auto_672121 ) ) ( not ( = ?auto_672120 ?auto_672122 ) ) ( not ( = ?auto_672120 ?auto_672123 ) ) ( not ( = ?auto_672121 ?auto_672122 ) ) ( not ( = ?auto_672121 ?auto_672123 ) ) ( not ( = ?auto_672122 ?auto_672123 ) ) ( ON ?auto_672122 ?auto_672123 ) ( ON ?auto_672121 ?auto_672122 ) ( ON ?auto_672120 ?auto_672121 ) ( ON ?auto_672119 ?auto_672120 ) ( ON ?auto_672118 ?auto_672119 ) ( ON ?auto_672117 ?auto_672118 ) ( ON ?auto_672116 ?auto_672117 ) ( ON ?auto_672115 ?auto_672116 ) ( ON ?auto_672114 ?auto_672115 ) ( ON ?auto_672113 ?auto_672114 ) ( CLEAR ?auto_672111 ) ( ON ?auto_672112 ?auto_672113 ) ( CLEAR ?auto_672112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_672107 ?auto_672108 ?auto_672109 ?auto_672110 ?auto_672111 ?auto_672112 )
      ( MAKE-17PILE ?auto_672107 ?auto_672108 ?auto_672109 ?auto_672110 ?auto_672111 ?auto_672112 ?auto_672113 ?auto_672114 ?auto_672115 ?auto_672116 ?auto_672117 ?auto_672118 ?auto_672119 ?auto_672120 ?auto_672121 ?auto_672122 ?auto_672123 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672141 - BLOCK
      ?auto_672142 - BLOCK
      ?auto_672143 - BLOCK
      ?auto_672144 - BLOCK
      ?auto_672145 - BLOCK
      ?auto_672146 - BLOCK
      ?auto_672147 - BLOCK
      ?auto_672148 - BLOCK
      ?auto_672149 - BLOCK
      ?auto_672150 - BLOCK
      ?auto_672151 - BLOCK
      ?auto_672152 - BLOCK
      ?auto_672153 - BLOCK
      ?auto_672154 - BLOCK
      ?auto_672155 - BLOCK
      ?auto_672156 - BLOCK
      ?auto_672157 - BLOCK
    )
    :vars
    (
      ?auto_672158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672157 ?auto_672158 ) ( ON-TABLE ?auto_672141 ) ( ON ?auto_672142 ?auto_672141 ) ( ON ?auto_672143 ?auto_672142 ) ( ON ?auto_672144 ?auto_672143 ) ( not ( = ?auto_672141 ?auto_672142 ) ) ( not ( = ?auto_672141 ?auto_672143 ) ) ( not ( = ?auto_672141 ?auto_672144 ) ) ( not ( = ?auto_672141 ?auto_672145 ) ) ( not ( = ?auto_672141 ?auto_672146 ) ) ( not ( = ?auto_672141 ?auto_672147 ) ) ( not ( = ?auto_672141 ?auto_672148 ) ) ( not ( = ?auto_672141 ?auto_672149 ) ) ( not ( = ?auto_672141 ?auto_672150 ) ) ( not ( = ?auto_672141 ?auto_672151 ) ) ( not ( = ?auto_672141 ?auto_672152 ) ) ( not ( = ?auto_672141 ?auto_672153 ) ) ( not ( = ?auto_672141 ?auto_672154 ) ) ( not ( = ?auto_672141 ?auto_672155 ) ) ( not ( = ?auto_672141 ?auto_672156 ) ) ( not ( = ?auto_672141 ?auto_672157 ) ) ( not ( = ?auto_672141 ?auto_672158 ) ) ( not ( = ?auto_672142 ?auto_672143 ) ) ( not ( = ?auto_672142 ?auto_672144 ) ) ( not ( = ?auto_672142 ?auto_672145 ) ) ( not ( = ?auto_672142 ?auto_672146 ) ) ( not ( = ?auto_672142 ?auto_672147 ) ) ( not ( = ?auto_672142 ?auto_672148 ) ) ( not ( = ?auto_672142 ?auto_672149 ) ) ( not ( = ?auto_672142 ?auto_672150 ) ) ( not ( = ?auto_672142 ?auto_672151 ) ) ( not ( = ?auto_672142 ?auto_672152 ) ) ( not ( = ?auto_672142 ?auto_672153 ) ) ( not ( = ?auto_672142 ?auto_672154 ) ) ( not ( = ?auto_672142 ?auto_672155 ) ) ( not ( = ?auto_672142 ?auto_672156 ) ) ( not ( = ?auto_672142 ?auto_672157 ) ) ( not ( = ?auto_672142 ?auto_672158 ) ) ( not ( = ?auto_672143 ?auto_672144 ) ) ( not ( = ?auto_672143 ?auto_672145 ) ) ( not ( = ?auto_672143 ?auto_672146 ) ) ( not ( = ?auto_672143 ?auto_672147 ) ) ( not ( = ?auto_672143 ?auto_672148 ) ) ( not ( = ?auto_672143 ?auto_672149 ) ) ( not ( = ?auto_672143 ?auto_672150 ) ) ( not ( = ?auto_672143 ?auto_672151 ) ) ( not ( = ?auto_672143 ?auto_672152 ) ) ( not ( = ?auto_672143 ?auto_672153 ) ) ( not ( = ?auto_672143 ?auto_672154 ) ) ( not ( = ?auto_672143 ?auto_672155 ) ) ( not ( = ?auto_672143 ?auto_672156 ) ) ( not ( = ?auto_672143 ?auto_672157 ) ) ( not ( = ?auto_672143 ?auto_672158 ) ) ( not ( = ?auto_672144 ?auto_672145 ) ) ( not ( = ?auto_672144 ?auto_672146 ) ) ( not ( = ?auto_672144 ?auto_672147 ) ) ( not ( = ?auto_672144 ?auto_672148 ) ) ( not ( = ?auto_672144 ?auto_672149 ) ) ( not ( = ?auto_672144 ?auto_672150 ) ) ( not ( = ?auto_672144 ?auto_672151 ) ) ( not ( = ?auto_672144 ?auto_672152 ) ) ( not ( = ?auto_672144 ?auto_672153 ) ) ( not ( = ?auto_672144 ?auto_672154 ) ) ( not ( = ?auto_672144 ?auto_672155 ) ) ( not ( = ?auto_672144 ?auto_672156 ) ) ( not ( = ?auto_672144 ?auto_672157 ) ) ( not ( = ?auto_672144 ?auto_672158 ) ) ( not ( = ?auto_672145 ?auto_672146 ) ) ( not ( = ?auto_672145 ?auto_672147 ) ) ( not ( = ?auto_672145 ?auto_672148 ) ) ( not ( = ?auto_672145 ?auto_672149 ) ) ( not ( = ?auto_672145 ?auto_672150 ) ) ( not ( = ?auto_672145 ?auto_672151 ) ) ( not ( = ?auto_672145 ?auto_672152 ) ) ( not ( = ?auto_672145 ?auto_672153 ) ) ( not ( = ?auto_672145 ?auto_672154 ) ) ( not ( = ?auto_672145 ?auto_672155 ) ) ( not ( = ?auto_672145 ?auto_672156 ) ) ( not ( = ?auto_672145 ?auto_672157 ) ) ( not ( = ?auto_672145 ?auto_672158 ) ) ( not ( = ?auto_672146 ?auto_672147 ) ) ( not ( = ?auto_672146 ?auto_672148 ) ) ( not ( = ?auto_672146 ?auto_672149 ) ) ( not ( = ?auto_672146 ?auto_672150 ) ) ( not ( = ?auto_672146 ?auto_672151 ) ) ( not ( = ?auto_672146 ?auto_672152 ) ) ( not ( = ?auto_672146 ?auto_672153 ) ) ( not ( = ?auto_672146 ?auto_672154 ) ) ( not ( = ?auto_672146 ?auto_672155 ) ) ( not ( = ?auto_672146 ?auto_672156 ) ) ( not ( = ?auto_672146 ?auto_672157 ) ) ( not ( = ?auto_672146 ?auto_672158 ) ) ( not ( = ?auto_672147 ?auto_672148 ) ) ( not ( = ?auto_672147 ?auto_672149 ) ) ( not ( = ?auto_672147 ?auto_672150 ) ) ( not ( = ?auto_672147 ?auto_672151 ) ) ( not ( = ?auto_672147 ?auto_672152 ) ) ( not ( = ?auto_672147 ?auto_672153 ) ) ( not ( = ?auto_672147 ?auto_672154 ) ) ( not ( = ?auto_672147 ?auto_672155 ) ) ( not ( = ?auto_672147 ?auto_672156 ) ) ( not ( = ?auto_672147 ?auto_672157 ) ) ( not ( = ?auto_672147 ?auto_672158 ) ) ( not ( = ?auto_672148 ?auto_672149 ) ) ( not ( = ?auto_672148 ?auto_672150 ) ) ( not ( = ?auto_672148 ?auto_672151 ) ) ( not ( = ?auto_672148 ?auto_672152 ) ) ( not ( = ?auto_672148 ?auto_672153 ) ) ( not ( = ?auto_672148 ?auto_672154 ) ) ( not ( = ?auto_672148 ?auto_672155 ) ) ( not ( = ?auto_672148 ?auto_672156 ) ) ( not ( = ?auto_672148 ?auto_672157 ) ) ( not ( = ?auto_672148 ?auto_672158 ) ) ( not ( = ?auto_672149 ?auto_672150 ) ) ( not ( = ?auto_672149 ?auto_672151 ) ) ( not ( = ?auto_672149 ?auto_672152 ) ) ( not ( = ?auto_672149 ?auto_672153 ) ) ( not ( = ?auto_672149 ?auto_672154 ) ) ( not ( = ?auto_672149 ?auto_672155 ) ) ( not ( = ?auto_672149 ?auto_672156 ) ) ( not ( = ?auto_672149 ?auto_672157 ) ) ( not ( = ?auto_672149 ?auto_672158 ) ) ( not ( = ?auto_672150 ?auto_672151 ) ) ( not ( = ?auto_672150 ?auto_672152 ) ) ( not ( = ?auto_672150 ?auto_672153 ) ) ( not ( = ?auto_672150 ?auto_672154 ) ) ( not ( = ?auto_672150 ?auto_672155 ) ) ( not ( = ?auto_672150 ?auto_672156 ) ) ( not ( = ?auto_672150 ?auto_672157 ) ) ( not ( = ?auto_672150 ?auto_672158 ) ) ( not ( = ?auto_672151 ?auto_672152 ) ) ( not ( = ?auto_672151 ?auto_672153 ) ) ( not ( = ?auto_672151 ?auto_672154 ) ) ( not ( = ?auto_672151 ?auto_672155 ) ) ( not ( = ?auto_672151 ?auto_672156 ) ) ( not ( = ?auto_672151 ?auto_672157 ) ) ( not ( = ?auto_672151 ?auto_672158 ) ) ( not ( = ?auto_672152 ?auto_672153 ) ) ( not ( = ?auto_672152 ?auto_672154 ) ) ( not ( = ?auto_672152 ?auto_672155 ) ) ( not ( = ?auto_672152 ?auto_672156 ) ) ( not ( = ?auto_672152 ?auto_672157 ) ) ( not ( = ?auto_672152 ?auto_672158 ) ) ( not ( = ?auto_672153 ?auto_672154 ) ) ( not ( = ?auto_672153 ?auto_672155 ) ) ( not ( = ?auto_672153 ?auto_672156 ) ) ( not ( = ?auto_672153 ?auto_672157 ) ) ( not ( = ?auto_672153 ?auto_672158 ) ) ( not ( = ?auto_672154 ?auto_672155 ) ) ( not ( = ?auto_672154 ?auto_672156 ) ) ( not ( = ?auto_672154 ?auto_672157 ) ) ( not ( = ?auto_672154 ?auto_672158 ) ) ( not ( = ?auto_672155 ?auto_672156 ) ) ( not ( = ?auto_672155 ?auto_672157 ) ) ( not ( = ?auto_672155 ?auto_672158 ) ) ( not ( = ?auto_672156 ?auto_672157 ) ) ( not ( = ?auto_672156 ?auto_672158 ) ) ( not ( = ?auto_672157 ?auto_672158 ) ) ( ON ?auto_672156 ?auto_672157 ) ( ON ?auto_672155 ?auto_672156 ) ( ON ?auto_672154 ?auto_672155 ) ( ON ?auto_672153 ?auto_672154 ) ( ON ?auto_672152 ?auto_672153 ) ( ON ?auto_672151 ?auto_672152 ) ( ON ?auto_672150 ?auto_672151 ) ( ON ?auto_672149 ?auto_672150 ) ( ON ?auto_672148 ?auto_672149 ) ( ON ?auto_672147 ?auto_672148 ) ( ON ?auto_672146 ?auto_672147 ) ( CLEAR ?auto_672144 ) ( ON ?auto_672145 ?auto_672146 ) ( CLEAR ?auto_672145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_672141 ?auto_672142 ?auto_672143 ?auto_672144 ?auto_672145 )
      ( MAKE-17PILE ?auto_672141 ?auto_672142 ?auto_672143 ?auto_672144 ?auto_672145 ?auto_672146 ?auto_672147 ?auto_672148 ?auto_672149 ?auto_672150 ?auto_672151 ?auto_672152 ?auto_672153 ?auto_672154 ?auto_672155 ?auto_672156 ?auto_672157 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672176 - BLOCK
      ?auto_672177 - BLOCK
      ?auto_672178 - BLOCK
      ?auto_672179 - BLOCK
      ?auto_672180 - BLOCK
      ?auto_672181 - BLOCK
      ?auto_672182 - BLOCK
      ?auto_672183 - BLOCK
      ?auto_672184 - BLOCK
      ?auto_672185 - BLOCK
      ?auto_672186 - BLOCK
      ?auto_672187 - BLOCK
      ?auto_672188 - BLOCK
      ?auto_672189 - BLOCK
      ?auto_672190 - BLOCK
      ?auto_672191 - BLOCK
      ?auto_672192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672192 ) ( ON-TABLE ?auto_672176 ) ( ON ?auto_672177 ?auto_672176 ) ( ON ?auto_672178 ?auto_672177 ) ( ON ?auto_672179 ?auto_672178 ) ( not ( = ?auto_672176 ?auto_672177 ) ) ( not ( = ?auto_672176 ?auto_672178 ) ) ( not ( = ?auto_672176 ?auto_672179 ) ) ( not ( = ?auto_672176 ?auto_672180 ) ) ( not ( = ?auto_672176 ?auto_672181 ) ) ( not ( = ?auto_672176 ?auto_672182 ) ) ( not ( = ?auto_672176 ?auto_672183 ) ) ( not ( = ?auto_672176 ?auto_672184 ) ) ( not ( = ?auto_672176 ?auto_672185 ) ) ( not ( = ?auto_672176 ?auto_672186 ) ) ( not ( = ?auto_672176 ?auto_672187 ) ) ( not ( = ?auto_672176 ?auto_672188 ) ) ( not ( = ?auto_672176 ?auto_672189 ) ) ( not ( = ?auto_672176 ?auto_672190 ) ) ( not ( = ?auto_672176 ?auto_672191 ) ) ( not ( = ?auto_672176 ?auto_672192 ) ) ( not ( = ?auto_672177 ?auto_672178 ) ) ( not ( = ?auto_672177 ?auto_672179 ) ) ( not ( = ?auto_672177 ?auto_672180 ) ) ( not ( = ?auto_672177 ?auto_672181 ) ) ( not ( = ?auto_672177 ?auto_672182 ) ) ( not ( = ?auto_672177 ?auto_672183 ) ) ( not ( = ?auto_672177 ?auto_672184 ) ) ( not ( = ?auto_672177 ?auto_672185 ) ) ( not ( = ?auto_672177 ?auto_672186 ) ) ( not ( = ?auto_672177 ?auto_672187 ) ) ( not ( = ?auto_672177 ?auto_672188 ) ) ( not ( = ?auto_672177 ?auto_672189 ) ) ( not ( = ?auto_672177 ?auto_672190 ) ) ( not ( = ?auto_672177 ?auto_672191 ) ) ( not ( = ?auto_672177 ?auto_672192 ) ) ( not ( = ?auto_672178 ?auto_672179 ) ) ( not ( = ?auto_672178 ?auto_672180 ) ) ( not ( = ?auto_672178 ?auto_672181 ) ) ( not ( = ?auto_672178 ?auto_672182 ) ) ( not ( = ?auto_672178 ?auto_672183 ) ) ( not ( = ?auto_672178 ?auto_672184 ) ) ( not ( = ?auto_672178 ?auto_672185 ) ) ( not ( = ?auto_672178 ?auto_672186 ) ) ( not ( = ?auto_672178 ?auto_672187 ) ) ( not ( = ?auto_672178 ?auto_672188 ) ) ( not ( = ?auto_672178 ?auto_672189 ) ) ( not ( = ?auto_672178 ?auto_672190 ) ) ( not ( = ?auto_672178 ?auto_672191 ) ) ( not ( = ?auto_672178 ?auto_672192 ) ) ( not ( = ?auto_672179 ?auto_672180 ) ) ( not ( = ?auto_672179 ?auto_672181 ) ) ( not ( = ?auto_672179 ?auto_672182 ) ) ( not ( = ?auto_672179 ?auto_672183 ) ) ( not ( = ?auto_672179 ?auto_672184 ) ) ( not ( = ?auto_672179 ?auto_672185 ) ) ( not ( = ?auto_672179 ?auto_672186 ) ) ( not ( = ?auto_672179 ?auto_672187 ) ) ( not ( = ?auto_672179 ?auto_672188 ) ) ( not ( = ?auto_672179 ?auto_672189 ) ) ( not ( = ?auto_672179 ?auto_672190 ) ) ( not ( = ?auto_672179 ?auto_672191 ) ) ( not ( = ?auto_672179 ?auto_672192 ) ) ( not ( = ?auto_672180 ?auto_672181 ) ) ( not ( = ?auto_672180 ?auto_672182 ) ) ( not ( = ?auto_672180 ?auto_672183 ) ) ( not ( = ?auto_672180 ?auto_672184 ) ) ( not ( = ?auto_672180 ?auto_672185 ) ) ( not ( = ?auto_672180 ?auto_672186 ) ) ( not ( = ?auto_672180 ?auto_672187 ) ) ( not ( = ?auto_672180 ?auto_672188 ) ) ( not ( = ?auto_672180 ?auto_672189 ) ) ( not ( = ?auto_672180 ?auto_672190 ) ) ( not ( = ?auto_672180 ?auto_672191 ) ) ( not ( = ?auto_672180 ?auto_672192 ) ) ( not ( = ?auto_672181 ?auto_672182 ) ) ( not ( = ?auto_672181 ?auto_672183 ) ) ( not ( = ?auto_672181 ?auto_672184 ) ) ( not ( = ?auto_672181 ?auto_672185 ) ) ( not ( = ?auto_672181 ?auto_672186 ) ) ( not ( = ?auto_672181 ?auto_672187 ) ) ( not ( = ?auto_672181 ?auto_672188 ) ) ( not ( = ?auto_672181 ?auto_672189 ) ) ( not ( = ?auto_672181 ?auto_672190 ) ) ( not ( = ?auto_672181 ?auto_672191 ) ) ( not ( = ?auto_672181 ?auto_672192 ) ) ( not ( = ?auto_672182 ?auto_672183 ) ) ( not ( = ?auto_672182 ?auto_672184 ) ) ( not ( = ?auto_672182 ?auto_672185 ) ) ( not ( = ?auto_672182 ?auto_672186 ) ) ( not ( = ?auto_672182 ?auto_672187 ) ) ( not ( = ?auto_672182 ?auto_672188 ) ) ( not ( = ?auto_672182 ?auto_672189 ) ) ( not ( = ?auto_672182 ?auto_672190 ) ) ( not ( = ?auto_672182 ?auto_672191 ) ) ( not ( = ?auto_672182 ?auto_672192 ) ) ( not ( = ?auto_672183 ?auto_672184 ) ) ( not ( = ?auto_672183 ?auto_672185 ) ) ( not ( = ?auto_672183 ?auto_672186 ) ) ( not ( = ?auto_672183 ?auto_672187 ) ) ( not ( = ?auto_672183 ?auto_672188 ) ) ( not ( = ?auto_672183 ?auto_672189 ) ) ( not ( = ?auto_672183 ?auto_672190 ) ) ( not ( = ?auto_672183 ?auto_672191 ) ) ( not ( = ?auto_672183 ?auto_672192 ) ) ( not ( = ?auto_672184 ?auto_672185 ) ) ( not ( = ?auto_672184 ?auto_672186 ) ) ( not ( = ?auto_672184 ?auto_672187 ) ) ( not ( = ?auto_672184 ?auto_672188 ) ) ( not ( = ?auto_672184 ?auto_672189 ) ) ( not ( = ?auto_672184 ?auto_672190 ) ) ( not ( = ?auto_672184 ?auto_672191 ) ) ( not ( = ?auto_672184 ?auto_672192 ) ) ( not ( = ?auto_672185 ?auto_672186 ) ) ( not ( = ?auto_672185 ?auto_672187 ) ) ( not ( = ?auto_672185 ?auto_672188 ) ) ( not ( = ?auto_672185 ?auto_672189 ) ) ( not ( = ?auto_672185 ?auto_672190 ) ) ( not ( = ?auto_672185 ?auto_672191 ) ) ( not ( = ?auto_672185 ?auto_672192 ) ) ( not ( = ?auto_672186 ?auto_672187 ) ) ( not ( = ?auto_672186 ?auto_672188 ) ) ( not ( = ?auto_672186 ?auto_672189 ) ) ( not ( = ?auto_672186 ?auto_672190 ) ) ( not ( = ?auto_672186 ?auto_672191 ) ) ( not ( = ?auto_672186 ?auto_672192 ) ) ( not ( = ?auto_672187 ?auto_672188 ) ) ( not ( = ?auto_672187 ?auto_672189 ) ) ( not ( = ?auto_672187 ?auto_672190 ) ) ( not ( = ?auto_672187 ?auto_672191 ) ) ( not ( = ?auto_672187 ?auto_672192 ) ) ( not ( = ?auto_672188 ?auto_672189 ) ) ( not ( = ?auto_672188 ?auto_672190 ) ) ( not ( = ?auto_672188 ?auto_672191 ) ) ( not ( = ?auto_672188 ?auto_672192 ) ) ( not ( = ?auto_672189 ?auto_672190 ) ) ( not ( = ?auto_672189 ?auto_672191 ) ) ( not ( = ?auto_672189 ?auto_672192 ) ) ( not ( = ?auto_672190 ?auto_672191 ) ) ( not ( = ?auto_672190 ?auto_672192 ) ) ( not ( = ?auto_672191 ?auto_672192 ) ) ( ON ?auto_672191 ?auto_672192 ) ( ON ?auto_672190 ?auto_672191 ) ( ON ?auto_672189 ?auto_672190 ) ( ON ?auto_672188 ?auto_672189 ) ( ON ?auto_672187 ?auto_672188 ) ( ON ?auto_672186 ?auto_672187 ) ( ON ?auto_672185 ?auto_672186 ) ( ON ?auto_672184 ?auto_672185 ) ( ON ?auto_672183 ?auto_672184 ) ( ON ?auto_672182 ?auto_672183 ) ( ON ?auto_672181 ?auto_672182 ) ( CLEAR ?auto_672179 ) ( ON ?auto_672180 ?auto_672181 ) ( CLEAR ?auto_672180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_672176 ?auto_672177 ?auto_672178 ?auto_672179 ?auto_672180 )
      ( MAKE-17PILE ?auto_672176 ?auto_672177 ?auto_672178 ?auto_672179 ?auto_672180 ?auto_672181 ?auto_672182 ?auto_672183 ?auto_672184 ?auto_672185 ?auto_672186 ?auto_672187 ?auto_672188 ?auto_672189 ?auto_672190 ?auto_672191 ?auto_672192 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672210 - BLOCK
      ?auto_672211 - BLOCK
      ?auto_672212 - BLOCK
      ?auto_672213 - BLOCK
      ?auto_672214 - BLOCK
      ?auto_672215 - BLOCK
      ?auto_672216 - BLOCK
      ?auto_672217 - BLOCK
      ?auto_672218 - BLOCK
      ?auto_672219 - BLOCK
      ?auto_672220 - BLOCK
      ?auto_672221 - BLOCK
      ?auto_672222 - BLOCK
      ?auto_672223 - BLOCK
      ?auto_672224 - BLOCK
      ?auto_672225 - BLOCK
      ?auto_672226 - BLOCK
    )
    :vars
    (
      ?auto_672227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672226 ?auto_672227 ) ( ON-TABLE ?auto_672210 ) ( ON ?auto_672211 ?auto_672210 ) ( ON ?auto_672212 ?auto_672211 ) ( not ( = ?auto_672210 ?auto_672211 ) ) ( not ( = ?auto_672210 ?auto_672212 ) ) ( not ( = ?auto_672210 ?auto_672213 ) ) ( not ( = ?auto_672210 ?auto_672214 ) ) ( not ( = ?auto_672210 ?auto_672215 ) ) ( not ( = ?auto_672210 ?auto_672216 ) ) ( not ( = ?auto_672210 ?auto_672217 ) ) ( not ( = ?auto_672210 ?auto_672218 ) ) ( not ( = ?auto_672210 ?auto_672219 ) ) ( not ( = ?auto_672210 ?auto_672220 ) ) ( not ( = ?auto_672210 ?auto_672221 ) ) ( not ( = ?auto_672210 ?auto_672222 ) ) ( not ( = ?auto_672210 ?auto_672223 ) ) ( not ( = ?auto_672210 ?auto_672224 ) ) ( not ( = ?auto_672210 ?auto_672225 ) ) ( not ( = ?auto_672210 ?auto_672226 ) ) ( not ( = ?auto_672210 ?auto_672227 ) ) ( not ( = ?auto_672211 ?auto_672212 ) ) ( not ( = ?auto_672211 ?auto_672213 ) ) ( not ( = ?auto_672211 ?auto_672214 ) ) ( not ( = ?auto_672211 ?auto_672215 ) ) ( not ( = ?auto_672211 ?auto_672216 ) ) ( not ( = ?auto_672211 ?auto_672217 ) ) ( not ( = ?auto_672211 ?auto_672218 ) ) ( not ( = ?auto_672211 ?auto_672219 ) ) ( not ( = ?auto_672211 ?auto_672220 ) ) ( not ( = ?auto_672211 ?auto_672221 ) ) ( not ( = ?auto_672211 ?auto_672222 ) ) ( not ( = ?auto_672211 ?auto_672223 ) ) ( not ( = ?auto_672211 ?auto_672224 ) ) ( not ( = ?auto_672211 ?auto_672225 ) ) ( not ( = ?auto_672211 ?auto_672226 ) ) ( not ( = ?auto_672211 ?auto_672227 ) ) ( not ( = ?auto_672212 ?auto_672213 ) ) ( not ( = ?auto_672212 ?auto_672214 ) ) ( not ( = ?auto_672212 ?auto_672215 ) ) ( not ( = ?auto_672212 ?auto_672216 ) ) ( not ( = ?auto_672212 ?auto_672217 ) ) ( not ( = ?auto_672212 ?auto_672218 ) ) ( not ( = ?auto_672212 ?auto_672219 ) ) ( not ( = ?auto_672212 ?auto_672220 ) ) ( not ( = ?auto_672212 ?auto_672221 ) ) ( not ( = ?auto_672212 ?auto_672222 ) ) ( not ( = ?auto_672212 ?auto_672223 ) ) ( not ( = ?auto_672212 ?auto_672224 ) ) ( not ( = ?auto_672212 ?auto_672225 ) ) ( not ( = ?auto_672212 ?auto_672226 ) ) ( not ( = ?auto_672212 ?auto_672227 ) ) ( not ( = ?auto_672213 ?auto_672214 ) ) ( not ( = ?auto_672213 ?auto_672215 ) ) ( not ( = ?auto_672213 ?auto_672216 ) ) ( not ( = ?auto_672213 ?auto_672217 ) ) ( not ( = ?auto_672213 ?auto_672218 ) ) ( not ( = ?auto_672213 ?auto_672219 ) ) ( not ( = ?auto_672213 ?auto_672220 ) ) ( not ( = ?auto_672213 ?auto_672221 ) ) ( not ( = ?auto_672213 ?auto_672222 ) ) ( not ( = ?auto_672213 ?auto_672223 ) ) ( not ( = ?auto_672213 ?auto_672224 ) ) ( not ( = ?auto_672213 ?auto_672225 ) ) ( not ( = ?auto_672213 ?auto_672226 ) ) ( not ( = ?auto_672213 ?auto_672227 ) ) ( not ( = ?auto_672214 ?auto_672215 ) ) ( not ( = ?auto_672214 ?auto_672216 ) ) ( not ( = ?auto_672214 ?auto_672217 ) ) ( not ( = ?auto_672214 ?auto_672218 ) ) ( not ( = ?auto_672214 ?auto_672219 ) ) ( not ( = ?auto_672214 ?auto_672220 ) ) ( not ( = ?auto_672214 ?auto_672221 ) ) ( not ( = ?auto_672214 ?auto_672222 ) ) ( not ( = ?auto_672214 ?auto_672223 ) ) ( not ( = ?auto_672214 ?auto_672224 ) ) ( not ( = ?auto_672214 ?auto_672225 ) ) ( not ( = ?auto_672214 ?auto_672226 ) ) ( not ( = ?auto_672214 ?auto_672227 ) ) ( not ( = ?auto_672215 ?auto_672216 ) ) ( not ( = ?auto_672215 ?auto_672217 ) ) ( not ( = ?auto_672215 ?auto_672218 ) ) ( not ( = ?auto_672215 ?auto_672219 ) ) ( not ( = ?auto_672215 ?auto_672220 ) ) ( not ( = ?auto_672215 ?auto_672221 ) ) ( not ( = ?auto_672215 ?auto_672222 ) ) ( not ( = ?auto_672215 ?auto_672223 ) ) ( not ( = ?auto_672215 ?auto_672224 ) ) ( not ( = ?auto_672215 ?auto_672225 ) ) ( not ( = ?auto_672215 ?auto_672226 ) ) ( not ( = ?auto_672215 ?auto_672227 ) ) ( not ( = ?auto_672216 ?auto_672217 ) ) ( not ( = ?auto_672216 ?auto_672218 ) ) ( not ( = ?auto_672216 ?auto_672219 ) ) ( not ( = ?auto_672216 ?auto_672220 ) ) ( not ( = ?auto_672216 ?auto_672221 ) ) ( not ( = ?auto_672216 ?auto_672222 ) ) ( not ( = ?auto_672216 ?auto_672223 ) ) ( not ( = ?auto_672216 ?auto_672224 ) ) ( not ( = ?auto_672216 ?auto_672225 ) ) ( not ( = ?auto_672216 ?auto_672226 ) ) ( not ( = ?auto_672216 ?auto_672227 ) ) ( not ( = ?auto_672217 ?auto_672218 ) ) ( not ( = ?auto_672217 ?auto_672219 ) ) ( not ( = ?auto_672217 ?auto_672220 ) ) ( not ( = ?auto_672217 ?auto_672221 ) ) ( not ( = ?auto_672217 ?auto_672222 ) ) ( not ( = ?auto_672217 ?auto_672223 ) ) ( not ( = ?auto_672217 ?auto_672224 ) ) ( not ( = ?auto_672217 ?auto_672225 ) ) ( not ( = ?auto_672217 ?auto_672226 ) ) ( not ( = ?auto_672217 ?auto_672227 ) ) ( not ( = ?auto_672218 ?auto_672219 ) ) ( not ( = ?auto_672218 ?auto_672220 ) ) ( not ( = ?auto_672218 ?auto_672221 ) ) ( not ( = ?auto_672218 ?auto_672222 ) ) ( not ( = ?auto_672218 ?auto_672223 ) ) ( not ( = ?auto_672218 ?auto_672224 ) ) ( not ( = ?auto_672218 ?auto_672225 ) ) ( not ( = ?auto_672218 ?auto_672226 ) ) ( not ( = ?auto_672218 ?auto_672227 ) ) ( not ( = ?auto_672219 ?auto_672220 ) ) ( not ( = ?auto_672219 ?auto_672221 ) ) ( not ( = ?auto_672219 ?auto_672222 ) ) ( not ( = ?auto_672219 ?auto_672223 ) ) ( not ( = ?auto_672219 ?auto_672224 ) ) ( not ( = ?auto_672219 ?auto_672225 ) ) ( not ( = ?auto_672219 ?auto_672226 ) ) ( not ( = ?auto_672219 ?auto_672227 ) ) ( not ( = ?auto_672220 ?auto_672221 ) ) ( not ( = ?auto_672220 ?auto_672222 ) ) ( not ( = ?auto_672220 ?auto_672223 ) ) ( not ( = ?auto_672220 ?auto_672224 ) ) ( not ( = ?auto_672220 ?auto_672225 ) ) ( not ( = ?auto_672220 ?auto_672226 ) ) ( not ( = ?auto_672220 ?auto_672227 ) ) ( not ( = ?auto_672221 ?auto_672222 ) ) ( not ( = ?auto_672221 ?auto_672223 ) ) ( not ( = ?auto_672221 ?auto_672224 ) ) ( not ( = ?auto_672221 ?auto_672225 ) ) ( not ( = ?auto_672221 ?auto_672226 ) ) ( not ( = ?auto_672221 ?auto_672227 ) ) ( not ( = ?auto_672222 ?auto_672223 ) ) ( not ( = ?auto_672222 ?auto_672224 ) ) ( not ( = ?auto_672222 ?auto_672225 ) ) ( not ( = ?auto_672222 ?auto_672226 ) ) ( not ( = ?auto_672222 ?auto_672227 ) ) ( not ( = ?auto_672223 ?auto_672224 ) ) ( not ( = ?auto_672223 ?auto_672225 ) ) ( not ( = ?auto_672223 ?auto_672226 ) ) ( not ( = ?auto_672223 ?auto_672227 ) ) ( not ( = ?auto_672224 ?auto_672225 ) ) ( not ( = ?auto_672224 ?auto_672226 ) ) ( not ( = ?auto_672224 ?auto_672227 ) ) ( not ( = ?auto_672225 ?auto_672226 ) ) ( not ( = ?auto_672225 ?auto_672227 ) ) ( not ( = ?auto_672226 ?auto_672227 ) ) ( ON ?auto_672225 ?auto_672226 ) ( ON ?auto_672224 ?auto_672225 ) ( ON ?auto_672223 ?auto_672224 ) ( ON ?auto_672222 ?auto_672223 ) ( ON ?auto_672221 ?auto_672222 ) ( ON ?auto_672220 ?auto_672221 ) ( ON ?auto_672219 ?auto_672220 ) ( ON ?auto_672218 ?auto_672219 ) ( ON ?auto_672217 ?auto_672218 ) ( ON ?auto_672216 ?auto_672217 ) ( ON ?auto_672215 ?auto_672216 ) ( ON ?auto_672214 ?auto_672215 ) ( CLEAR ?auto_672212 ) ( ON ?auto_672213 ?auto_672214 ) ( CLEAR ?auto_672213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_672210 ?auto_672211 ?auto_672212 ?auto_672213 )
      ( MAKE-17PILE ?auto_672210 ?auto_672211 ?auto_672212 ?auto_672213 ?auto_672214 ?auto_672215 ?auto_672216 ?auto_672217 ?auto_672218 ?auto_672219 ?auto_672220 ?auto_672221 ?auto_672222 ?auto_672223 ?auto_672224 ?auto_672225 ?auto_672226 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672245 - BLOCK
      ?auto_672246 - BLOCK
      ?auto_672247 - BLOCK
      ?auto_672248 - BLOCK
      ?auto_672249 - BLOCK
      ?auto_672250 - BLOCK
      ?auto_672251 - BLOCK
      ?auto_672252 - BLOCK
      ?auto_672253 - BLOCK
      ?auto_672254 - BLOCK
      ?auto_672255 - BLOCK
      ?auto_672256 - BLOCK
      ?auto_672257 - BLOCK
      ?auto_672258 - BLOCK
      ?auto_672259 - BLOCK
      ?auto_672260 - BLOCK
      ?auto_672261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672261 ) ( ON-TABLE ?auto_672245 ) ( ON ?auto_672246 ?auto_672245 ) ( ON ?auto_672247 ?auto_672246 ) ( not ( = ?auto_672245 ?auto_672246 ) ) ( not ( = ?auto_672245 ?auto_672247 ) ) ( not ( = ?auto_672245 ?auto_672248 ) ) ( not ( = ?auto_672245 ?auto_672249 ) ) ( not ( = ?auto_672245 ?auto_672250 ) ) ( not ( = ?auto_672245 ?auto_672251 ) ) ( not ( = ?auto_672245 ?auto_672252 ) ) ( not ( = ?auto_672245 ?auto_672253 ) ) ( not ( = ?auto_672245 ?auto_672254 ) ) ( not ( = ?auto_672245 ?auto_672255 ) ) ( not ( = ?auto_672245 ?auto_672256 ) ) ( not ( = ?auto_672245 ?auto_672257 ) ) ( not ( = ?auto_672245 ?auto_672258 ) ) ( not ( = ?auto_672245 ?auto_672259 ) ) ( not ( = ?auto_672245 ?auto_672260 ) ) ( not ( = ?auto_672245 ?auto_672261 ) ) ( not ( = ?auto_672246 ?auto_672247 ) ) ( not ( = ?auto_672246 ?auto_672248 ) ) ( not ( = ?auto_672246 ?auto_672249 ) ) ( not ( = ?auto_672246 ?auto_672250 ) ) ( not ( = ?auto_672246 ?auto_672251 ) ) ( not ( = ?auto_672246 ?auto_672252 ) ) ( not ( = ?auto_672246 ?auto_672253 ) ) ( not ( = ?auto_672246 ?auto_672254 ) ) ( not ( = ?auto_672246 ?auto_672255 ) ) ( not ( = ?auto_672246 ?auto_672256 ) ) ( not ( = ?auto_672246 ?auto_672257 ) ) ( not ( = ?auto_672246 ?auto_672258 ) ) ( not ( = ?auto_672246 ?auto_672259 ) ) ( not ( = ?auto_672246 ?auto_672260 ) ) ( not ( = ?auto_672246 ?auto_672261 ) ) ( not ( = ?auto_672247 ?auto_672248 ) ) ( not ( = ?auto_672247 ?auto_672249 ) ) ( not ( = ?auto_672247 ?auto_672250 ) ) ( not ( = ?auto_672247 ?auto_672251 ) ) ( not ( = ?auto_672247 ?auto_672252 ) ) ( not ( = ?auto_672247 ?auto_672253 ) ) ( not ( = ?auto_672247 ?auto_672254 ) ) ( not ( = ?auto_672247 ?auto_672255 ) ) ( not ( = ?auto_672247 ?auto_672256 ) ) ( not ( = ?auto_672247 ?auto_672257 ) ) ( not ( = ?auto_672247 ?auto_672258 ) ) ( not ( = ?auto_672247 ?auto_672259 ) ) ( not ( = ?auto_672247 ?auto_672260 ) ) ( not ( = ?auto_672247 ?auto_672261 ) ) ( not ( = ?auto_672248 ?auto_672249 ) ) ( not ( = ?auto_672248 ?auto_672250 ) ) ( not ( = ?auto_672248 ?auto_672251 ) ) ( not ( = ?auto_672248 ?auto_672252 ) ) ( not ( = ?auto_672248 ?auto_672253 ) ) ( not ( = ?auto_672248 ?auto_672254 ) ) ( not ( = ?auto_672248 ?auto_672255 ) ) ( not ( = ?auto_672248 ?auto_672256 ) ) ( not ( = ?auto_672248 ?auto_672257 ) ) ( not ( = ?auto_672248 ?auto_672258 ) ) ( not ( = ?auto_672248 ?auto_672259 ) ) ( not ( = ?auto_672248 ?auto_672260 ) ) ( not ( = ?auto_672248 ?auto_672261 ) ) ( not ( = ?auto_672249 ?auto_672250 ) ) ( not ( = ?auto_672249 ?auto_672251 ) ) ( not ( = ?auto_672249 ?auto_672252 ) ) ( not ( = ?auto_672249 ?auto_672253 ) ) ( not ( = ?auto_672249 ?auto_672254 ) ) ( not ( = ?auto_672249 ?auto_672255 ) ) ( not ( = ?auto_672249 ?auto_672256 ) ) ( not ( = ?auto_672249 ?auto_672257 ) ) ( not ( = ?auto_672249 ?auto_672258 ) ) ( not ( = ?auto_672249 ?auto_672259 ) ) ( not ( = ?auto_672249 ?auto_672260 ) ) ( not ( = ?auto_672249 ?auto_672261 ) ) ( not ( = ?auto_672250 ?auto_672251 ) ) ( not ( = ?auto_672250 ?auto_672252 ) ) ( not ( = ?auto_672250 ?auto_672253 ) ) ( not ( = ?auto_672250 ?auto_672254 ) ) ( not ( = ?auto_672250 ?auto_672255 ) ) ( not ( = ?auto_672250 ?auto_672256 ) ) ( not ( = ?auto_672250 ?auto_672257 ) ) ( not ( = ?auto_672250 ?auto_672258 ) ) ( not ( = ?auto_672250 ?auto_672259 ) ) ( not ( = ?auto_672250 ?auto_672260 ) ) ( not ( = ?auto_672250 ?auto_672261 ) ) ( not ( = ?auto_672251 ?auto_672252 ) ) ( not ( = ?auto_672251 ?auto_672253 ) ) ( not ( = ?auto_672251 ?auto_672254 ) ) ( not ( = ?auto_672251 ?auto_672255 ) ) ( not ( = ?auto_672251 ?auto_672256 ) ) ( not ( = ?auto_672251 ?auto_672257 ) ) ( not ( = ?auto_672251 ?auto_672258 ) ) ( not ( = ?auto_672251 ?auto_672259 ) ) ( not ( = ?auto_672251 ?auto_672260 ) ) ( not ( = ?auto_672251 ?auto_672261 ) ) ( not ( = ?auto_672252 ?auto_672253 ) ) ( not ( = ?auto_672252 ?auto_672254 ) ) ( not ( = ?auto_672252 ?auto_672255 ) ) ( not ( = ?auto_672252 ?auto_672256 ) ) ( not ( = ?auto_672252 ?auto_672257 ) ) ( not ( = ?auto_672252 ?auto_672258 ) ) ( not ( = ?auto_672252 ?auto_672259 ) ) ( not ( = ?auto_672252 ?auto_672260 ) ) ( not ( = ?auto_672252 ?auto_672261 ) ) ( not ( = ?auto_672253 ?auto_672254 ) ) ( not ( = ?auto_672253 ?auto_672255 ) ) ( not ( = ?auto_672253 ?auto_672256 ) ) ( not ( = ?auto_672253 ?auto_672257 ) ) ( not ( = ?auto_672253 ?auto_672258 ) ) ( not ( = ?auto_672253 ?auto_672259 ) ) ( not ( = ?auto_672253 ?auto_672260 ) ) ( not ( = ?auto_672253 ?auto_672261 ) ) ( not ( = ?auto_672254 ?auto_672255 ) ) ( not ( = ?auto_672254 ?auto_672256 ) ) ( not ( = ?auto_672254 ?auto_672257 ) ) ( not ( = ?auto_672254 ?auto_672258 ) ) ( not ( = ?auto_672254 ?auto_672259 ) ) ( not ( = ?auto_672254 ?auto_672260 ) ) ( not ( = ?auto_672254 ?auto_672261 ) ) ( not ( = ?auto_672255 ?auto_672256 ) ) ( not ( = ?auto_672255 ?auto_672257 ) ) ( not ( = ?auto_672255 ?auto_672258 ) ) ( not ( = ?auto_672255 ?auto_672259 ) ) ( not ( = ?auto_672255 ?auto_672260 ) ) ( not ( = ?auto_672255 ?auto_672261 ) ) ( not ( = ?auto_672256 ?auto_672257 ) ) ( not ( = ?auto_672256 ?auto_672258 ) ) ( not ( = ?auto_672256 ?auto_672259 ) ) ( not ( = ?auto_672256 ?auto_672260 ) ) ( not ( = ?auto_672256 ?auto_672261 ) ) ( not ( = ?auto_672257 ?auto_672258 ) ) ( not ( = ?auto_672257 ?auto_672259 ) ) ( not ( = ?auto_672257 ?auto_672260 ) ) ( not ( = ?auto_672257 ?auto_672261 ) ) ( not ( = ?auto_672258 ?auto_672259 ) ) ( not ( = ?auto_672258 ?auto_672260 ) ) ( not ( = ?auto_672258 ?auto_672261 ) ) ( not ( = ?auto_672259 ?auto_672260 ) ) ( not ( = ?auto_672259 ?auto_672261 ) ) ( not ( = ?auto_672260 ?auto_672261 ) ) ( ON ?auto_672260 ?auto_672261 ) ( ON ?auto_672259 ?auto_672260 ) ( ON ?auto_672258 ?auto_672259 ) ( ON ?auto_672257 ?auto_672258 ) ( ON ?auto_672256 ?auto_672257 ) ( ON ?auto_672255 ?auto_672256 ) ( ON ?auto_672254 ?auto_672255 ) ( ON ?auto_672253 ?auto_672254 ) ( ON ?auto_672252 ?auto_672253 ) ( ON ?auto_672251 ?auto_672252 ) ( ON ?auto_672250 ?auto_672251 ) ( ON ?auto_672249 ?auto_672250 ) ( CLEAR ?auto_672247 ) ( ON ?auto_672248 ?auto_672249 ) ( CLEAR ?auto_672248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_672245 ?auto_672246 ?auto_672247 ?auto_672248 )
      ( MAKE-17PILE ?auto_672245 ?auto_672246 ?auto_672247 ?auto_672248 ?auto_672249 ?auto_672250 ?auto_672251 ?auto_672252 ?auto_672253 ?auto_672254 ?auto_672255 ?auto_672256 ?auto_672257 ?auto_672258 ?auto_672259 ?auto_672260 ?auto_672261 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672279 - BLOCK
      ?auto_672280 - BLOCK
      ?auto_672281 - BLOCK
      ?auto_672282 - BLOCK
      ?auto_672283 - BLOCK
      ?auto_672284 - BLOCK
      ?auto_672285 - BLOCK
      ?auto_672286 - BLOCK
      ?auto_672287 - BLOCK
      ?auto_672288 - BLOCK
      ?auto_672289 - BLOCK
      ?auto_672290 - BLOCK
      ?auto_672291 - BLOCK
      ?auto_672292 - BLOCK
      ?auto_672293 - BLOCK
      ?auto_672294 - BLOCK
      ?auto_672295 - BLOCK
    )
    :vars
    (
      ?auto_672296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672295 ?auto_672296 ) ( ON-TABLE ?auto_672279 ) ( ON ?auto_672280 ?auto_672279 ) ( not ( = ?auto_672279 ?auto_672280 ) ) ( not ( = ?auto_672279 ?auto_672281 ) ) ( not ( = ?auto_672279 ?auto_672282 ) ) ( not ( = ?auto_672279 ?auto_672283 ) ) ( not ( = ?auto_672279 ?auto_672284 ) ) ( not ( = ?auto_672279 ?auto_672285 ) ) ( not ( = ?auto_672279 ?auto_672286 ) ) ( not ( = ?auto_672279 ?auto_672287 ) ) ( not ( = ?auto_672279 ?auto_672288 ) ) ( not ( = ?auto_672279 ?auto_672289 ) ) ( not ( = ?auto_672279 ?auto_672290 ) ) ( not ( = ?auto_672279 ?auto_672291 ) ) ( not ( = ?auto_672279 ?auto_672292 ) ) ( not ( = ?auto_672279 ?auto_672293 ) ) ( not ( = ?auto_672279 ?auto_672294 ) ) ( not ( = ?auto_672279 ?auto_672295 ) ) ( not ( = ?auto_672279 ?auto_672296 ) ) ( not ( = ?auto_672280 ?auto_672281 ) ) ( not ( = ?auto_672280 ?auto_672282 ) ) ( not ( = ?auto_672280 ?auto_672283 ) ) ( not ( = ?auto_672280 ?auto_672284 ) ) ( not ( = ?auto_672280 ?auto_672285 ) ) ( not ( = ?auto_672280 ?auto_672286 ) ) ( not ( = ?auto_672280 ?auto_672287 ) ) ( not ( = ?auto_672280 ?auto_672288 ) ) ( not ( = ?auto_672280 ?auto_672289 ) ) ( not ( = ?auto_672280 ?auto_672290 ) ) ( not ( = ?auto_672280 ?auto_672291 ) ) ( not ( = ?auto_672280 ?auto_672292 ) ) ( not ( = ?auto_672280 ?auto_672293 ) ) ( not ( = ?auto_672280 ?auto_672294 ) ) ( not ( = ?auto_672280 ?auto_672295 ) ) ( not ( = ?auto_672280 ?auto_672296 ) ) ( not ( = ?auto_672281 ?auto_672282 ) ) ( not ( = ?auto_672281 ?auto_672283 ) ) ( not ( = ?auto_672281 ?auto_672284 ) ) ( not ( = ?auto_672281 ?auto_672285 ) ) ( not ( = ?auto_672281 ?auto_672286 ) ) ( not ( = ?auto_672281 ?auto_672287 ) ) ( not ( = ?auto_672281 ?auto_672288 ) ) ( not ( = ?auto_672281 ?auto_672289 ) ) ( not ( = ?auto_672281 ?auto_672290 ) ) ( not ( = ?auto_672281 ?auto_672291 ) ) ( not ( = ?auto_672281 ?auto_672292 ) ) ( not ( = ?auto_672281 ?auto_672293 ) ) ( not ( = ?auto_672281 ?auto_672294 ) ) ( not ( = ?auto_672281 ?auto_672295 ) ) ( not ( = ?auto_672281 ?auto_672296 ) ) ( not ( = ?auto_672282 ?auto_672283 ) ) ( not ( = ?auto_672282 ?auto_672284 ) ) ( not ( = ?auto_672282 ?auto_672285 ) ) ( not ( = ?auto_672282 ?auto_672286 ) ) ( not ( = ?auto_672282 ?auto_672287 ) ) ( not ( = ?auto_672282 ?auto_672288 ) ) ( not ( = ?auto_672282 ?auto_672289 ) ) ( not ( = ?auto_672282 ?auto_672290 ) ) ( not ( = ?auto_672282 ?auto_672291 ) ) ( not ( = ?auto_672282 ?auto_672292 ) ) ( not ( = ?auto_672282 ?auto_672293 ) ) ( not ( = ?auto_672282 ?auto_672294 ) ) ( not ( = ?auto_672282 ?auto_672295 ) ) ( not ( = ?auto_672282 ?auto_672296 ) ) ( not ( = ?auto_672283 ?auto_672284 ) ) ( not ( = ?auto_672283 ?auto_672285 ) ) ( not ( = ?auto_672283 ?auto_672286 ) ) ( not ( = ?auto_672283 ?auto_672287 ) ) ( not ( = ?auto_672283 ?auto_672288 ) ) ( not ( = ?auto_672283 ?auto_672289 ) ) ( not ( = ?auto_672283 ?auto_672290 ) ) ( not ( = ?auto_672283 ?auto_672291 ) ) ( not ( = ?auto_672283 ?auto_672292 ) ) ( not ( = ?auto_672283 ?auto_672293 ) ) ( not ( = ?auto_672283 ?auto_672294 ) ) ( not ( = ?auto_672283 ?auto_672295 ) ) ( not ( = ?auto_672283 ?auto_672296 ) ) ( not ( = ?auto_672284 ?auto_672285 ) ) ( not ( = ?auto_672284 ?auto_672286 ) ) ( not ( = ?auto_672284 ?auto_672287 ) ) ( not ( = ?auto_672284 ?auto_672288 ) ) ( not ( = ?auto_672284 ?auto_672289 ) ) ( not ( = ?auto_672284 ?auto_672290 ) ) ( not ( = ?auto_672284 ?auto_672291 ) ) ( not ( = ?auto_672284 ?auto_672292 ) ) ( not ( = ?auto_672284 ?auto_672293 ) ) ( not ( = ?auto_672284 ?auto_672294 ) ) ( not ( = ?auto_672284 ?auto_672295 ) ) ( not ( = ?auto_672284 ?auto_672296 ) ) ( not ( = ?auto_672285 ?auto_672286 ) ) ( not ( = ?auto_672285 ?auto_672287 ) ) ( not ( = ?auto_672285 ?auto_672288 ) ) ( not ( = ?auto_672285 ?auto_672289 ) ) ( not ( = ?auto_672285 ?auto_672290 ) ) ( not ( = ?auto_672285 ?auto_672291 ) ) ( not ( = ?auto_672285 ?auto_672292 ) ) ( not ( = ?auto_672285 ?auto_672293 ) ) ( not ( = ?auto_672285 ?auto_672294 ) ) ( not ( = ?auto_672285 ?auto_672295 ) ) ( not ( = ?auto_672285 ?auto_672296 ) ) ( not ( = ?auto_672286 ?auto_672287 ) ) ( not ( = ?auto_672286 ?auto_672288 ) ) ( not ( = ?auto_672286 ?auto_672289 ) ) ( not ( = ?auto_672286 ?auto_672290 ) ) ( not ( = ?auto_672286 ?auto_672291 ) ) ( not ( = ?auto_672286 ?auto_672292 ) ) ( not ( = ?auto_672286 ?auto_672293 ) ) ( not ( = ?auto_672286 ?auto_672294 ) ) ( not ( = ?auto_672286 ?auto_672295 ) ) ( not ( = ?auto_672286 ?auto_672296 ) ) ( not ( = ?auto_672287 ?auto_672288 ) ) ( not ( = ?auto_672287 ?auto_672289 ) ) ( not ( = ?auto_672287 ?auto_672290 ) ) ( not ( = ?auto_672287 ?auto_672291 ) ) ( not ( = ?auto_672287 ?auto_672292 ) ) ( not ( = ?auto_672287 ?auto_672293 ) ) ( not ( = ?auto_672287 ?auto_672294 ) ) ( not ( = ?auto_672287 ?auto_672295 ) ) ( not ( = ?auto_672287 ?auto_672296 ) ) ( not ( = ?auto_672288 ?auto_672289 ) ) ( not ( = ?auto_672288 ?auto_672290 ) ) ( not ( = ?auto_672288 ?auto_672291 ) ) ( not ( = ?auto_672288 ?auto_672292 ) ) ( not ( = ?auto_672288 ?auto_672293 ) ) ( not ( = ?auto_672288 ?auto_672294 ) ) ( not ( = ?auto_672288 ?auto_672295 ) ) ( not ( = ?auto_672288 ?auto_672296 ) ) ( not ( = ?auto_672289 ?auto_672290 ) ) ( not ( = ?auto_672289 ?auto_672291 ) ) ( not ( = ?auto_672289 ?auto_672292 ) ) ( not ( = ?auto_672289 ?auto_672293 ) ) ( not ( = ?auto_672289 ?auto_672294 ) ) ( not ( = ?auto_672289 ?auto_672295 ) ) ( not ( = ?auto_672289 ?auto_672296 ) ) ( not ( = ?auto_672290 ?auto_672291 ) ) ( not ( = ?auto_672290 ?auto_672292 ) ) ( not ( = ?auto_672290 ?auto_672293 ) ) ( not ( = ?auto_672290 ?auto_672294 ) ) ( not ( = ?auto_672290 ?auto_672295 ) ) ( not ( = ?auto_672290 ?auto_672296 ) ) ( not ( = ?auto_672291 ?auto_672292 ) ) ( not ( = ?auto_672291 ?auto_672293 ) ) ( not ( = ?auto_672291 ?auto_672294 ) ) ( not ( = ?auto_672291 ?auto_672295 ) ) ( not ( = ?auto_672291 ?auto_672296 ) ) ( not ( = ?auto_672292 ?auto_672293 ) ) ( not ( = ?auto_672292 ?auto_672294 ) ) ( not ( = ?auto_672292 ?auto_672295 ) ) ( not ( = ?auto_672292 ?auto_672296 ) ) ( not ( = ?auto_672293 ?auto_672294 ) ) ( not ( = ?auto_672293 ?auto_672295 ) ) ( not ( = ?auto_672293 ?auto_672296 ) ) ( not ( = ?auto_672294 ?auto_672295 ) ) ( not ( = ?auto_672294 ?auto_672296 ) ) ( not ( = ?auto_672295 ?auto_672296 ) ) ( ON ?auto_672294 ?auto_672295 ) ( ON ?auto_672293 ?auto_672294 ) ( ON ?auto_672292 ?auto_672293 ) ( ON ?auto_672291 ?auto_672292 ) ( ON ?auto_672290 ?auto_672291 ) ( ON ?auto_672289 ?auto_672290 ) ( ON ?auto_672288 ?auto_672289 ) ( ON ?auto_672287 ?auto_672288 ) ( ON ?auto_672286 ?auto_672287 ) ( ON ?auto_672285 ?auto_672286 ) ( ON ?auto_672284 ?auto_672285 ) ( ON ?auto_672283 ?auto_672284 ) ( ON ?auto_672282 ?auto_672283 ) ( CLEAR ?auto_672280 ) ( ON ?auto_672281 ?auto_672282 ) ( CLEAR ?auto_672281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_672279 ?auto_672280 ?auto_672281 )
      ( MAKE-17PILE ?auto_672279 ?auto_672280 ?auto_672281 ?auto_672282 ?auto_672283 ?auto_672284 ?auto_672285 ?auto_672286 ?auto_672287 ?auto_672288 ?auto_672289 ?auto_672290 ?auto_672291 ?auto_672292 ?auto_672293 ?auto_672294 ?auto_672295 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672314 - BLOCK
      ?auto_672315 - BLOCK
      ?auto_672316 - BLOCK
      ?auto_672317 - BLOCK
      ?auto_672318 - BLOCK
      ?auto_672319 - BLOCK
      ?auto_672320 - BLOCK
      ?auto_672321 - BLOCK
      ?auto_672322 - BLOCK
      ?auto_672323 - BLOCK
      ?auto_672324 - BLOCK
      ?auto_672325 - BLOCK
      ?auto_672326 - BLOCK
      ?auto_672327 - BLOCK
      ?auto_672328 - BLOCK
      ?auto_672329 - BLOCK
      ?auto_672330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672330 ) ( ON-TABLE ?auto_672314 ) ( ON ?auto_672315 ?auto_672314 ) ( not ( = ?auto_672314 ?auto_672315 ) ) ( not ( = ?auto_672314 ?auto_672316 ) ) ( not ( = ?auto_672314 ?auto_672317 ) ) ( not ( = ?auto_672314 ?auto_672318 ) ) ( not ( = ?auto_672314 ?auto_672319 ) ) ( not ( = ?auto_672314 ?auto_672320 ) ) ( not ( = ?auto_672314 ?auto_672321 ) ) ( not ( = ?auto_672314 ?auto_672322 ) ) ( not ( = ?auto_672314 ?auto_672323 ) ) ( not ( = ?auto_672314 ?auto_672324 ) ) ( not ( = ?auto_672314 ?auto_672325 ) ) ( not ( = ?auto_672314 ?auto_672326 ) ) ( not ( = ?auto_672314 ?auto_672327 ) ) ( not ( = ?auto_672314 ?auto_672328 ) ) ( not ( = ?auto_672314 ?auto_672329 ) ) ( not ( = ?auto_672314 ?auto_672330 ) ) ( not ( = ?auto_672315 ?auto_672316 ) ) ( not ( = ?auto_672315 ?auto_672317 ) ) ( not ( = ?auto_672315 ?auto_672318 ) ) ( not ( = ?auto_672315 ?auto_672319 ) ) ( not ( = ?auto_672315 ?auto_672320 ) ) ( not ( = ?auto_672315 ?auto_672321 ) ) ( not ( = ?auto_672315 ?auto_672322 ) ) ( not ( = ?auto_672315 ?auto_672323 ) ) ( not ( = ?auto_672315 ?auto_672324 ) ) ( not ( = ?auto_672315 ?auto_672325 ) ) ( not ( = ?auto_672315 ?auto_672326 ) ) ( not ( = ?auto_672315 ?auto_672327 ) ) ( not ( = ?auto_672315 ?auto_672328 ) ) ( not ( = ?auto_672315 ?auto_672329 ) ) ( not ( = ?auto_672315 ?auto_672330 ) ) ( not ( = ?auto_672316 ?auto_672317 ) ) ( not ( = ?auto_672316 ?auto_672318 ) ) ( not ( = ?auto_672316 ?auto_672319 ) ) ( not ( = ?auto_672316 ?auto_672320 ) ) ( not ( = ?auto_672316 ?auto_672321 ) ) ( not ( = ?auto_672316 ?auto_672322 ) ) ( not ( = ?auto_672316 ?auto_672323 ) ) ( not ( = ?auto_672316 ?auto_672324 ) ) ( not ( = ?auto_672316 ?auto_672325 ) ) ( not ( = ?auto_672316 ?auto_672326 ) ) ( not ( = ?auto_672316 ?auto_672327 ) ) ( not ( = ?auto_672316 ?auto_672328 ) ) ( not ( = ?auto_672316 ?auto_672329 ) ) ( not ( = ?auto_672316 ?auto_672330 ) ) ( not ( = ?auto_672317 ?auto_672318 ) ) ( not ( = ?auto_672317 ?auto_672319 ) ) ( not ( = ?auto_672317 ?auto_672320 ) ) ( not ( = ?auto_672317 ?auto_672321 ) ) ( not ( = ?auto_672317 ?auto_672322 ) ) ( not ( = ?auto_672317 ?auto_672323 ) ) ( not ( = ?auto_672317 ?auto_672324 ) ) ( not ( = ?auto_672317 ?auto_672325 ) ) ( not ( = ?auto_672317 ?auto_672326 ) ) ( not ( = ?auto_672317 ?auto_672327 ) ) ( not ( = ?auto_672317 ?auto_672328 ) ) ( not ( = ?auto_672317 ?auto_672329 ) ) ( not ( = ?auto_672317 ?auto_672330 ) ) ( not ( = ?auto_672318 ?auto_672319 ) ) ( not ( = ?auto_672318 ?auto_672320 ) ) ( not ( = ?auto_672318 ?auto_672321 ) ) ( not ( = ?auto_672318 ?auto_672322 ) ) ( not ( = ?auto_672318 ?auto_672323 ) ) ( not ( = ?auto_672318 ?auto_672324 ) ) ( not ( = ?auto_672318 ?auto_672325 ) ) ( not ( = ?auto_672318 ?auto_672326 ) ) ( not ( = ?auto_672318 ?auto_672327 ) ) ( not ( = ?auto_672318 ?auto_672328 ) ) ( not ( = ?auto_672318 ?auto_672329 ) ) ( not ( = ?auto_672318 ?auto_672330 ) ) ( not ( = ?auto_672319 ?auto_672320 ) ) ( not ( = ?auto_672319 ?auto_672321 ) ) ( not ( = ?auto_672319 ?auto_672322 ) ) ( not ( = ?auto_672319 ?auto_672323 ) ) ( not ( = ?auto_672319 ?auto_672324 ) ) ( not ( = ?auto_672319 ?auto_672325 ) ) ( not ( = ?auto_672319 ?auto_672326 ) ) ( not ( = ?auto_672319 ?auto_672327 ) ) ( not ( = ?auto_672319 ?auto_672328 ) ) ( not ( = ?auto_672319 ?auto_672329 ) ) ( not ( = ?auto_672319 ?auto_672330 ) ) ( not ( = ?auto_672320 ?auto_672321 ) ) ( not ( = ?auto_672320 ?auto_672322 ) ) ( not ( = ?auto_672320 ?auto_672323 ) ) ( not ( = ?auto_672320 ?auto_672324 ) ) ( not ( = ?auto_672320 ?auto_672325 ) ) ( not ( = ?auto_672320 ?auto_672326 ) ) ( not ( = ?auto_672320 ?auto_672327 ) ) ( not ( = ?auto_672320 ?auto_672328 ) ) ( not ( = ?auto_672320 ?auto_672329 ) ) ( not ( = ?auto_672320 ?auto_672330 ) ) ( not ( = ?auto_672321 ?auto_672322 ) ) ( not ( = ?auto_672321 ?auto_672323 ) ) ( not ( = ?auto_672321 ?auto_672324 ) ) ( not ( = ?auto_672321 ?auto_672325 ) ) ( not ( = ?auto_672321 ?auto_672326 ) ) ( not ( = ?auto_672321 ?auto_672327 ) ) ( not ( = ?auto_672321 ?auto_672328 ) ) ( not ( = ?auto_672321 ?auto_672329 ) ) ( not ( = ?auto_672321 ?auto_672330 ) ) ( not ( = ?auto_672322 ?auto_672323 ) ) ( not ( = ?auto_672322 ?auto_672324 ) ) ( not ( = ?auto_672322 ?auto_672325 ) ) ( not ( = ?auto_672322 ?auto_672326 ) ) ( not ( = ?auto_672322 ?auto_672327 ) ) ( not ( = ?auto_672322 ?auto_672328 ) ) ( not ( = ?auto_672322 ?auto_672329 ) ) ( not ( = ?auto_672322 ?auto_672330 ) ) ( not ( = ?auto_672323 ?auto_672324 ) ) ( not ( = ?auto_672323 ?auto_672325 ) ) ( not ( = ?auto_672323 ?auto_672326 ) ) ( not ( = ?auto_672323 ?auto_672327 ) ) ( not ( = ?auto_672323 ?auto_672328 ) ) ( not ( = ?auto_672323 ?auto_672329 ) ) ( not ( = ?auto_672323 ?auto_672330 ) ) ( not ( = ?auto_672324 ?auto_672325 ) ) ( not ( = ?auto_672324 ?auto_672326 ) ) ( not ( = ?auto_672324 ?auto_672327 ) ) ( not ( = ?auto_672324 ?auto_672328 ) ) ( not ( = ?auto_672324 ?auto_672329 ) ) ( not ( = ?auto_672324 ?auto_672330 ) ) ( not ( = ?auto_672325 ?auto_672326 ) ) ( not ( = ?auto_672325 ?auto_672327 ) ) ( not ( = ?auto_672325 ?auto_672328 ) ) ( not ( = ?auto_672325 ?auto_672329 ) ) ( not ( = ?auto_672325 ?auto_672330 ) ) ( not ( = ?auto_672326 ?auto_672327 ) ) ( not ( = ?auto_672326 ?auto_672328 ) ) ( not ( = ?auto_672326 ?auto_672329 ) ) ( not ( = ?auto_672326 ?auto_672330 ) ) ( not ( = ?auto_672327 ?auto_672328 ) ) ( not ( = ?auto_672327 ?auto_672329 ) ) ( not ( = ?auto_672327 ?auto_672330 ) ) ( not ( = ?auto_672328 ?auto_672329 ) ) ( not ( = ?auto_672328 ?auto_672330 ) ) ( not ( = ?auto_672329 ?auto_672330 ) ) ( ON ?auto_672329 ?auto_672330 ) ( ON ?auto_672328 ?auto_672329 ) ( ON ?auto_672327 ?auto_672328 ) ( ON ?auto_672326 ?auto_672327 ) ( ON ?auto_672325 ?auto_672326 ) ( ON ?auto_672324 ?auto_672325 ) ( ON ?auto_672323 ?auto_672324 ) ( ON ?auto_672322 ?auto_672323 ) ( ON ?auto_672321 ?auto_672322 ) ( ON ?auto_672320 ?auto_672321 ) ( ON ?auto_672319 ?auto_672320 ) ( ON ?auto_672318 ?auto_672319 ) ( ON ?auto_672317 ?auto_672318 ) ( CLEAR ?auto_672315 ) ( ON ?auto_672316 ?auto_672317 ) ( CLEAR ?auto_672316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_672314 ?auto_672315 ?auto_672316 )
      ( MAKE-17PILE ?auto_672314 ?auto_672315 ?auto_672316 ?auto_672317 ?auto_672318 ?auto_672319 ?auto_672320 ?auto_672321 ?auto_672322 ?auto_672323 ?auto_672324 ?auto_672325 ?auto_672326 ?auto_672327 ?auto_672328 ?auto_672329 ?auto_672330 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672348 - BLOCK
      ?auto_672349 - BLOCK
      ?auto_672350 - BLOCK
      ?auto_672351 - BLOCK
      ?auto_672352 - BLOCK
      ?auto_672353 - BLOCK
      ?auto_672354 - BLOCK
      ?auto_672355 - BLOCK
      ?auto_672356 - BLOCK
      ?auto_672357 - BLOCK
      ?auto_672358 - BLOCK
      ?auto_672359 - BLOCK
      ?auto_672360 - BLOCK
      ?auto_672361 - BLOCK
      ?auto_672362 - BLOCK
      ?auto_672363 - BLOCK
      ?auto_672364 - BLOCK
    )
    :vars
    (
      ?auto_672365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672364 ?auto_672365 ) ( ON-TABLE ?auto_672348 ) ( not ( = ?auto_672348 ?auto_672349 ) ) ( not ( = ?auto_672348 ?auto_672350 ) ) ( not ( = ?auto_672348 ?auto_672351 ) ) ( not ( = ?auto_672348 ?auto_672352 ) ) ( not ( = ?auto_672348 ?auto_672353 ) ) ( not ( = ?auto_672348 ?auto_672354 ) ) ( not ( = ?auto_672348 ?auto_672355 ) ) ( not ( = ?auto_672348 ?auto_672356 ) ) ( not ( = ?auto_672348 ?auto_672357 ) ) ( not ( = ?auto_672348 ?auto_672358 ) ) ( not ( = ?auto_672348 ?auto_672359 ) ) ( not ( = ?auto_672348 ?auto_672360 ) ) ( not ( = ?auto_672348 ?auto_672361 ) ) ( not ( = ?auto_672348 ?auto_672362 ) ) ( not ( = ?auto_672348 ?auto_672363 ) ) ( not ( = ?auto_672348 ?auto_672364 ) ) ( not ( = ?auto_672348 ?auto_672365 ) ) ( not ( = ?auto_672349 ?auto_672350 ) ) ( not ( = ?auto_672349 ?auto_672351 ) ) ( not ( = ?auto_672349 ?auto_672352 ) ) ( not ( = ?auto_672349 ?auto_672353 ) ) ( not ( = ?auto_672349 ?auto_672354 ) ) ( not ( = ?auto_672349 ?auto_672355 ) ) ( not ( = ?auto_672349 ?auto_672356 ) ) ( not ( = ?auto_672349 ?auto_672357 ) ) ( not ( = ?auto_672349 ?auto_672358 ) ) ( not ( = ?auto_672349 ?auto_672359 ) ) ( not ( = ?auto_672349 ?auto_672360 ) ) ( not ( = ?auto_672349 ?auto_672361 ) ) ( not ( = ?auto_672349 ?auto_672362 ) ) ( not ( = ?auto_672349 ?auto_672363 ) ) ( not ( = ?auto_672349 ?auto_672364 ) ) ( not ( = ?auto_672349 ?auto_672365 ) ) ( not ( = ?auto_672350 ?auto_672351 ) ) ( not ( = ?auto_672350 ?auto_672352 ) ) ( not ( = ?auto_672350 ?auto_672353 ) ) ( not ( = ?auto_672350 ?auto_672354 ) ) ( not ( = ?auto_672350 ?auto_672355 ) ) ( not ( = ?auto_672350 ?auto_672356 ) ) ( not ( = ?auto_672350 ?auto_672357 ) ) ( not ( = ?auto_672350 ?auto_672358 ) ) ( not ( = ?auto_672350 ?auto_672359 ) ) ( not ( = ?auto_672350 ?auto_672360 ) ) ( not ( = ?auto_672350 ?auto_672361 ) ) ( not ( = ?auto_672350 ?auto_672362 ) ) ( not ( = ?auto_672350 ?auto_672363 ) ) ( not ( = ?auto_672350 ?auto_672364 ) ) ( not ( = ?auto_672350 ?auto_672365 ) ) ( not ( = ?auto_672351 ?auto_672352 ) ) ( not ( = ?auto_672351 ?auto_672353 ) ) ( not ( = ?auto_672351 ?auto_672354 ) ) ( not ( = ?auto_672351 ?auto_672355 ) ) ( not ( = ?auto_672351 ?auto_672356 ) ) ( not ( = ?auto_672351 ?auto_672357 ) ) ( not ( = ?auto_672351 ?auto_672358 ) ) ( not ( = ?auto_672351 ?auto_672359 ) ) ( not ( = ?auto_672351 ?auto_672360 ) ) ( not ( = ?auto_672351 ?auto_672361 ) ) ( not ( = ?auto_672351 ?auto_672362 ) ) ( not ( = ?auto_672351 ?auto_672363 ) ) ( not ( = ?auto_672351 ?auto_672364 ) ) ( not ( = ?auto_672351 ?auto_672365 ) ) ( not ( = ?auto_672352 ?auto_672353 ) ) ( not ( = ?auto_672352 ?auto_672354 ) ) ( not ( = ?auto_672352 ?auto_672355 ) ) ( not ( = ?auto_672352 ?auto_672356 ) ) ( not ( = ?auto_672352 ?auto_672357 ) ) ( not ( = ?auto_672352 ?auto_672358 ) ) ( not ( = ?auto_672352 ?auto_672359 ) ) ( not ( = ?auto_672352 ?auto_672360 ) ) ( not ( = ?auto_672352 ?auto_672361 ) ) ( not ( = ?auto_672352 ?auto_672362 ) ) ( not ( = ?auto_672352 ?auto_672363 ) ) ( not ( = ?auto_672352 ?auto_672364 ) ) ( not ( = ?auto_672352 ?auto_672365 ) ) ( not ( = ?auto_672353 ?auto_672354 ) ) ( not ( = ?auto_672353 ?auto_672355 ) ) ( not ( = ?auto_672353 ?auto_672356 ) ) ( not ( = ?auto_672353 ?auto_672357 ) ) ( not ( = ?auto_672353 ?auto_672358 ) ) ( not ( = ?auto_672353 ?auto_672359 ) ) ( not ( = ?auto_672353 ?auto_672360 ) ) ( not ( = ?auto_672353 ?auto_672361 ) ) ( not ( = ?auto_672353 ?auto_672362 ) ) ( not ( = ?auto_672353 ?auto_672363 ) ) ( not ( = ?auto_672353 ?auto_672364 ) ) ( not ( = ?auto_672353 ?auto_672365 ) ) ( not ( = ?auto_672354 ?auto_672355 ) ) ( not ( = ?auto_672354 ?auto_672356 ) ) ( not ( = ?auto_672354 ?auto_672357 ) ) ( not ( = ?auto_672354 ?auto_672358 ) ) ( not ( = ?auto_672354 ?auto_672359 ) ) ( not ( = ?auto_672354 ?auto_672360 ) ) ( not ( = ?auto_672354 ?auto_672361 ) ) ( not ( = ?auto_672354 ?auto_672362 ) ) ( not ( = ?auto_672354 ?auto_672363 ) ) ( not ( = ?auto_672354 ?auto_672364 ) ) ( not ( = ?auto_672354 ?auto_672365 ) ) ( not ( = ?auto_672355 ?auto_672356 ) ) ( not ( = ?auto_672355 ?auto_672357 ) ) ( not ( = ?auto_672355 ?auto_672358 ) ) ( not ( = ?auto_672355 ?auto_672359 ) ) ( not ( = ?auto_672355 ?auto_672360 ) ) ( not ( = ?auto_672355 ?auto_672361 ) ) ( not ( = ?auto_672355 ?auto_672362 ) ) ( not ( = ?auto_672355 ?auto_672363 ) ) ( not ( = ?auto_672355 ?auto_672364 ) ) ( not ( = ?auto_672355 ?auto_672365 ) ) ( not ( = ?auto_672356 ?auto_672357 ) ) ( not ( = ?auto_672356 ?auto_672358 ) ) ( not ( = ?auto_672356 ?auto_672359 ) ) ( not ( = ?auto_672356 ?auto_672360 ) ) ( not ( = ?auto_672356 ?auto_672361 ) ) ( not ( = ?auto_672356 ?auto_672362 ) ) ( not ( = ?auto_672356 ?auto_672363 ) ) ( not ( = ?auto_672356 ?auto_672364 ) ) ( not ( = ?auto_672356 ?auto_672365 ) ) ( not ( = ?auto_672357 ?auto_672358 ) ) ( not ( = ?auto_672357 ?auto_672359 ) ) ( not ( = ?auto_672357 ?auto_672360 ) ) ( not ( = ?auto_672357 ?auto_672361 ) ) ( not ( = ?auto_672357 ?auto_672362 ) ) ( not ( = ?auto_672357 ?auto_672363 ) ) ( not ( = ?auto_672357 ?auto_672364 ) ) ( not ( = ?auto_672357 ?auto_672365 ) ) ( not ( = ?auto_672358 ?auto_672359 ) ) ( not ( = ?auto_672358 ?auto_672360 ) ) ( not ( = ?auto_672358 ?auto_672361 ) ) ( not ( = ?auto_672358 ?auto_672362 ) ) ( not ( = ?auto_672358 ?auto_672363 ) ) ( not ( = ?auto_672358 ?auto_672364 ) ) ( not ( = ?auto_672358 ?auto_672365 ) ) ( not ( = ?auto_672359 ?auto_672360 ) ) ( not ( = ?auto_672359 ?auto_672361 ) ) ( not ( = ?auto_672359 ?auto_672362 ) ) ( not ( = ?auto_672359 ?auto_672363 ) ) ( not ( = ?auto_672359 ?auto_672364 ) ) ( not ( = ?auto_672359 ?auto_672365 ) ) ( not ( = ?auto_672360 ?auto_672361 ) ) ( not ( = ?auto_672360 ?auto_672362 ) ) ( not ( = ?auto_672360 ?auto_672363 ) ) ( not ( = ?auto_672360 ?auto_672364 ) ) ( not ( = ?auto_672360 ?auto_672365 ) ) ( not ( = ?auto_672361 ?auto_672362 ) ) ( not ( = ?auto_672361 ?auto_672363 ) ) ( not ( = ?auto_672361 ?auto_672364 ) ) ( not ( = ?auto_672361 ?auto_672365 ) ) ( not ( = ?auto_672362 ?auto_672363 ) ) ( not ( = ?auto_672362 ?auto_672364 ) ) ( not ( = ?auto_672362 ?auto_672365 ) ) ( not ( = ?auto_672363 ?auto_672364 ) ) ( not ( = ?auto_672363 ?auto_672365 ) ) ( not ( = ?auto_672364 ?auto_672365 ) ) ( ON ?auto_672363 ?auto_672364 ) ( ON ?auto_672362 ?auto_672363 ) ( ON ?auto_672361 ?auto_672362 ) ( ON ?auto_672360 ?auto_672361 ) ( ON ?auto_672359 ?auto_672360 ) ( ON ?auto_672358 ?auto_672359 ) ( ON ?auto_672357 ?auto_672358 ) ( ON ?auto_672356 ?auto_672357 ) ( ON ?auto_672355 ?auto_672356 ) ( ON ?auto_672354 ?auto_672355 ) ( ON ?auto_672353 ?auto_672354 ) ( ON ?auto_672352 ?auto_672353 ) ( ON ?auto_672351 ?auto_672352 ) ( ON ?auto_672350 ?auto_672351 ) ( CLEAR ?auto_672348 ) ( ON ?auto_672349 ?auto_672350 ) ( CLEAR ?auto_672349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672348 ?auto_672349 )
      ( MAKE-17PILE ?auto_672348 ?auto_672349 ?auto_672350 ?auto_672351 ?auto_672352 ?auto_672353 ?auto_672354 ?auto_672355 ?auto_672356 ?auto_672357 ?auto_672358 ?auto_672359 ?auto_672360 ?auto_672361 ?auto_672362 ?auto_672363 ?auto_672364 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672383 - BLOCK
      ?auto_672384 - BLOCK
      ?auto_672385 - BLOCK
      ?auto_672386 - BLOCK
      ?auto_672387 - BLOCK
      ?auto_672388 - BLOCK
      ?auto_672389 - BLOCK
      ?auto_672390 - BLOCK
      ?auto_672391 - BLOCK
      ?auto_672392 - BLOCK
      ?auto_672393 - BLOCK
      ?auto_672394 - BLOCK
      ?auto_672395 - BLOCK
      ?auto_672396 - BLOCK
      ?auto_672397 - BLOCK
      ?auto_672398 - BLOCK
      ?auto_672399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672399 ) ( ON-TABLE ?auto_672383 ) ( not ( = ?auto_672383 ?auto_672384 ) ) ( not ( = ?auto_672383 ?auto_672385 ) ) ( not ( = ?auto_672383 ?auto_672386 ) ) ( not ( = ?auto_672383 ?auto_672387 ) ) ( not ( = ?auto_672383 ?auto_672388 ) ) ( not ( = ?auto_672383 ?auto_672389 ) ) ( not ( = ?auto_672383 ?auto_672390 ) ) ( not ( = ?auto_672383 ?auto_672391 ) ) ( not ( = ?auto_672383 ?auto_672392 ) ) ( not ( = ?auto_672383 ?auto_672393 ) ) ( not ( = ?auto_672383 ?auto_672394 ) ) ( not ( = ?auto_672383 ?auto_672395 ) ) ( not ( = ?auto_672383 ?auto_672396 ) ) ( not ( = ?auto_672383 ?auto_672397 ) ) ( not ( = ?auto_672383 ?auto_672398 ) ) ( not ( = ?auto_672383 ?auto_672399 ) ) ( not ( = ?auto_672384 ?auto_672385 ) ) ( not ( = ?auto_672384 ?auto_672386 ) ) ( not ( = ?auto_672384 ?auto_672387 ) ) ( not ( = ?auto_672384 ?auto_672388 ) ) ( not ( = ?auto_672384 ?auto_672389 ) ) ( not ( = ?auto_672384 ?auto_672390 ) ) ( not ( = ?auto_672384 ?auto_672391 ) ) ( not ( = ?auto_672384 ?auto_672392 ) ) ( not ( = ?auto_672384 ?auto_672393 ) ) ( not ( = ?auto_672384 ?auto_672394 ) ) ( not ( = ?auto_672384 ?auto_672395 ) ) ( not ( = ?auto_672384 ?auto_672396 ) ) ( not ( = ?auto_672384 ?auto_672397 ) ) ( not ( = ?auto_672384 ?auto_672398 ) ) ( not ( = ?auto_672384 ?auto_672399 ) ) ( not ( = ?auto_672385 ?auto_672386 ) ) ( not ( = ?auto_672385 ?auto_672387 ) ) ( not ( = ?auto_672385 ?auto_672388 ) ) ( not ( = ?auto_672385 ?auto_672389 ) ) ( not ( = ?auto_672385 ?auto_672390 ) ) ( not ( = ?auto_672385 ?auto_672391 ) ) ( not ( = ?auto_672385 ?auto_672392 ) ) ( not ( = ?auto_672385 ?auto_672393 ) ) ( not ( = ?auto_672385 ?auto_672394 ) ) ( not ( = ?auto_672385 ?auto_672395 ) ) ( not ( = ?auto_672385 ?auto_672396 ) ) ( not ( = ?auto_672385 ?auto_672397 ) ) ( not ( = ?auto_672385 ?auto_672398 ) ) ( not ( = ?auto_672385 ?auto_672399 ) ) ( not ( = ?auto_672386 ?auto_672387 ) ) ( not ( = ?auto_672386 ?auto_672388 ) ) ( not ( = ?auto_672386 ?auto_672389 ) ) ( not ( = ?auto_672386 ?auto_672390 ) ) ( not ( = ?auto_672386 ?auto_672391 ) ) ( not ( = ?auto_672386 ?auto_672392 ) ) ( not ( = ?auto_672386 ?auto_672393 ) ) ( not ( = ?auto_672386 ?auto_672394 ) ) ( not ( = ?auto_672386 ?auto_672395 ) ) ( not ( = ?auto_672386 ?auto_672396 ) ) ( not ( = ?auto_672386 ?auto_672397 ) ) ( not ( = ?auto_672386 ?auto_672398 ) ) ( not ( = ?auto_672386 ?auto_672399 ) ) ( not ( = ?auto_672387 ?auto_672388 ) ) ( not ( = ?auto_672387 ?auto_672389 ) ) ( not ( = ?auto_672387 ?auto_672390 ) ) ( not ( = ?auto_672387 ?auto_672391 ) ) ( not ( = ?auto_672387 ?auto_672392 ) ) ( not ( = ?auto_672387 ?auto_672393 ) ) ( not ( = ?auto_672387 ?auto_672394 ) ) ( not ( = ?auto_672387 ?auto_672395 ) ) ( not ( = ?auto_672387 ?auto_672396 ) ) ( not ( = ?auto_672387 ?auto_672397 ) ) ( not ( = ?auto_672387 ?auto_672398 ) ) ( not ( = ?auto_672387 ?auto_672399 ) ) ( not ( = ?auto_672388 ?auto_672389 ) ) ( not ( = ?auto_672388 ?auto_672390 ) ) ( not ( = ?auto_672388 ?auto_672391 ) ) ( not ( = ?auto_672388 ?auto_672392 ) ) ( not ( = ?auto_672388 ?auto_672393 ) ) ( not ( = ?auto_672388 ?auto_672394 ) ) ( not ( = ?auto_672388 ?auto_672395 ) ) ( not ( = ?auto_672388 ?auto_672396 ) ) ( not ( = ?auto_672388 ?auto_672397 ) ) ( not ( = ?auto_672388 ?auto_672398 ) ) ( not ( = ?auto_672388 ?auto_672399 ) ) ( not ( = ?auto_672389 ?auto_672390 ) ) ( not ( = ?auto_672389 ?auto_672391 ) ) ( not ( = ?auto_672389 ?auto_672392 ) ) ( not ( = ?auto_672389 ?auto_672393 ) ) ( not ( = ?auto_672389 ?auto_672394 ) ) ( not ( = ?auto_672389 ?auto_672395 ) ) ( not ( = ?auto_672389 ?auto_672396 ) ) ( not ( = ?auto_672389 ?auto_672397 ) ) ( not ( = ?auto_672389 ?auto_672398 ) ) ( not ( = ?auto_672389 ?auto_672399 ) ) ( not ( = ?auto_672390 ?auto_672391 ) ) ( not ( = ?auto_672390 ?auto_672392 ) ) ( not ( = ?auto_672390 ?auto_672393 ) ) ( not ( = ?auto_672390 ?auto_672394 ) ) ( not ( = ?auto_672390 ?auto_672395 ) ) ( not ( = ?auto_672390 ?auto_672396 ) ) ( not ( = ?auto_672390 ?auto_672397 ) ) ( not ( = ?auto_672390 ?auto_672398 ) ) ( not ( = ?auto_672390 ?auto_672399 ) ) ( not ( = ?auto_672391 ?auto_672392 ) ) ( not ( = ?auto_672391 ?auto_672393 ) ) ( not ( = ?auto_672391 ?auto_672394 ) ) ( not ( = ?auto_672391 ?auto_672395 ) ) ( not ( = ?auto_672391 ?auto_672396 ) ) ( not ( = ?auto_672391 ?auto_672397 ) ) ( not ( = ?auto_672391 ?auto_672398 ) ) ( not ( = ?auto_672391 ?auto_672399 ) ) ( not ( = ?auto_672392 ?auto_672393 ) ) ( not ( = ?auto_672392 ?auto_672394 ) ) ( not ( = ?auto_672392 ?auto_672395 ) ) ( not ( = ?auto_672392 ?auto_672396 ) ) ( not ( = ?auto_672392 ?auto_672397 ) ) ( not ( = ?auto_672392 ?auto_672398 ) ) ( not ( = ?auto_672392 ?auto_672399 ) ) ( not ( = ?auto_672393 ?auto_672394 ) ) ( not ( = ?auto_672393 ?auto_672395 ) ) ( not ( = ?auto_672393 ?auto_672396 ) ) ( not ( = ?auto_672393 ?auto_672397 ) ) ( not ( = ?auto_672393 ?auto_672398 ) ) ( not ( = ?auto_672393 ?auto_672399 ) ) ( not ( = ?auto_672394 ?auto_672395 ) ) ( not ( = ?auto_672394 ?auto_672396 ) ) ( not ( = ?auto_672394 ?auto_672397 ) ) ( not ( = ?auto_672394 ?auto_672398 ) ) ( not ( = ?auto_672394 ?auto_672399 ) ) ( not ( = ?auto_672395 ?auto_672396 ) ) ( not ( = ?auto_672395 ?auto_672397 ) ) ( not ( = ?auto_672395 ?auto_672398 ) ) ( not ( = ?auto_672395 ?auto_672399 ) ) ( not ( = ?auto_672396 ?auto_672397 ) ) ( not ( = ?auto_672396 ?auto_672398 ) ) ( not ( = ?auto_672396 ?auto_672399 ) ) ( not ( = ?auto_672397 ?auto_672398 ) ) ( not ( = ?auto_672397 ?auto_672399 ) ) ( not ( = ?auto_672398 ?auto_672399 ) ) ( ON ?auto_672398 ?auto_672399 ) ( ON ?auto_672397 ?auto_672398 ) ( ON ?auto_672396 ?auto_672397 ) ( ON ?auto_672395 ?auto_672396 ) ( ON ?auto_672394 ?auto_672395 ) ( ON ?auto_672393 ?auto_672394 ) ( ON ?auto_672392 ?auto_672393 ) ( ON ?auto_672391 ?auto_672392 ) ( ON ?auto_672390 ?auto_672391 ) ( ON ?auto_672389 ?auto_672390 ) ( ON ?auto_672388 ?auto_672389 ) ( ON ?auto_672387 ?auto_672388 ) ( ON ?auto_672386 ?auto_672387 ) ( ON ?auto_672385 ?auto_672386 ) ( CLEAR ?auto_672383 ) ( ON ?auto_672384 ?auto_672385 ) ( CLEAR ?auto_672384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_672383 ?auto_672384 )
      ( MAKE-17PILE ?auto_672383 ?auto_672384 ?auto_672385 ?auto_672386 ?auto_672387 ?auto_672388 ?auto_672389 ?auto_672390 ?auto_672391 ?auto_672392 ?auto_672393 ?auto_672394 ?auto_672395 ?auto_672396 ?auto_672397 ?auto_672398 ?auto_672399 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672417 - BLOCK
      ?auto_672418 - BLOCK
      ?auto_672419 - BLOCK
      ?auto_672420 - BLOCK
      ?auto_672421 - BLOCK
      ?auto_672422 - BLOCK
      ?auto_672423 - BLOCK
      ?auto_672424 - BLOCK
      ?auto_672425 - BLOCK
      ?auto_672426 - BLOCK
      ?auto_672427 - BLOCK
      ?auto_672428 - BLOCK
      ?auto_672429 - BLOCK
      ?auto_672430 - BLOCK
      ?auto_672431 - BLOCK
      ?auto_672432 - BLOCK
      ?auto_672433 - BLOCK
    )
    :vars
    (
      ?auto_672434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_672433 ?auto_672434 ) ( not ( = ?auto_672417 ?auto_672418 ) ) ( not ( = ?auto_672417 ?auto_672419 ) ) ( not ( = ?auto_672417 ?auto_672420 ) ) ( not ( = ?auto_672417 ?auto_672421 ) ) ( not ( = ?auto_672417 ?auto_672422 ) ) ( not ( = ?auto_672417 ?auto_672423 ) ) ( not ( = ?auto_672417 ?auto_672424 ) ) ( not ( = ?auto_672417 ?auto_672425 ) ) ( not ( = ?auto_672417 ?auto_672426 ) ) ( not ( = ?auto_672417 ?auto_672427 ) ) ( not ( = ?auto_672417 ?auto_672428 ) ) ( not ( = ?auto_672417 ?auto_672429 ) ) ( not ( = ?auto_672417 ?auto_672430 ) ) ( not ( = ?auto_672417 ?auto_672431 ) ) ( not ( = ?auto_672417 ?auto_672432 ) ) ( not ( = ?auto_672417 ?auto_672433 ) ) ( not ( = ?auto_672417 ?auto_672434 ) ) ( not ( = ?auto_672418 ?auto_672419 ) ) ( not ( = ?auto_672418 ?auto_672420 ) ) ( not ( = ?auto_672418 ?auto_672421 ) ) ( not ( = ?auto_672418 ?auto_672422 ) ) ( not ( = ?auto_672418 ?auto_672423 ) ) ( not ( = ?auto_672418 ?auto_672424 ) ) ( not ( = ?auto_672418 ?auto_672425 ) ) ( not ( = ?auto_672418 ?auto_672426 ) ) ( not ( = ?auto_672418 ?auto_672427 ) ) ( not ( = ?auto_672418 ?auto_672428 ) ) ( not ( = ?auto_672418 ?auto_672429 ) ) ( not ( = ?auto_672418 ?auto_672430 ) ) ( not ( = ?auto_672418 ?auto_672431 ) ) ( not ( = ?auto_672418 ?auto_672432 ) ) ( not ( = ?auto_672418 ?auto_672433 ) ) ( not ( = ?auto_672418 ?auto_672434 ) ) ( not ( = ?auto_672419 ?auto_672420 ) ) ( not ( = ?auto_672419 ?auto_672421 ) ) ( not ( = ?auto_672419 ?auto_672422 ) ) ( not ( = ?auto_672419 ?auto_672423 ) ) ( not ( = ?auto_672419 ?auto_672424 ) ) ( not ( = ?auto_672419 ?auto_672425 ) ) ( not ( = ?auto_672419 ?auto_672426 ) ) ( not ( = ?auto_672419 ?auto_672427 ) ) ( not ( = ?auto_672419 ?auto_672428 ) ) ( not ( = ?auto_672419 ?auto_672429 ) ) ( not ( = ?auto_672419 ?auto_672430 ) ) ( not ( = ?auto_672419 ?auto_672431 ) ) ( not ( = ?auto_672419 ?auto_672432 ) ) ( not ( = ?auto_672419 ?auto_672433 ) ) ( not ( = ?auto_672419 ?auto_672434 ) ) ( not ( = ?auto_672420 ?auto_672421 ) ) ( not ( = ?auto_672420 ?auto_672422 ) ) ( not ( = ?auto_672420 ?auto_672423 ) ) ( not ( = ?auto_672420 ?auto_672424 ) ) ( not ( = ?auto_672420 ?auto_672425 ) ) ( not ( = ?auto_672420 ?auto_672426 ) ) ( not ( = ?auto_672420 ?auto_672427 ) ) ( not ( = ?auto_672420 ?auto_672428 ) ) ( not ( = ?auto_672420 ?auto_672429 ) ) ( not ( = ?auto_672420 ?auto_672430 ) ) ( not ( = ?auto_672420 ?auto_672431 ) ) ( not ( = ?auto_672420 ?auto_672432 ) ) ( not ( = ?auto_672420 ?auto_672433 ) ) ( not ( = ?auto_672420 ?auto_672434 ) ) ( not ( = ?auto_672421 ?auto_672422 ) ) ( not ( = ?auto_672421 ?auto_672423 ) ) ( not ( = ?auto_672421 ?auto_672424 ) ) ( not ( = ?auto_672421 ?auto_672425 ) ) ( not ( = ?auto_672421 ?auto_672426 ) ) ( not ( = ?auto_672421 ?auto_672427 ) ) ( not ( = ?auto_672421 ?auto_672428 ) ) ( not ( = ?auto_672421 ?auto_672429 ) ) ( not ( = ?auto_672421 ?auto_672430 ) ) ( not ( = ?auto_672421 ?auto_672431 ) ) ( not ( = ?auto_672421 ?auto_672432 ) ) ( not ( = ?auto_672421 ?auto_672433 ) ) ( not ( = ?auto_672421 ?auto_672434 ) ) ( not ( = ?auto_672422 ?auto_672423 ) ) ( not ( = ?auto_672422 ?auto_672424 ) ) ( not ( = ?auto_672422 ?auto_672425 ) ) ( not ( = ?auto_672422 ?auto_672426 ) ) ( not ( = ?auto_672422 ?auto_672427 ) ) ( not ( = ?auto_672422 ?auto_672428 ) ) ( not ( = ?auto_672422 ?auto_672429 ) ) ( not ( = ?auto_672422 ?auto_672430 ) ) ( not ( = ?auto_672422 ?auto_672431 ) ) ( not ( = ?auto_672422 ?auto_672432 ) ) ( not ( = ?auto_672422 ?auto_672433 ) ) ( not ( = ?auto_672422 ?auto_672434 ) ) ( not ( = ?auto_672423 ?auto_672424 ) ) ( not ( = ?auto_672423 ?auto_672425 ) ) ( not ( = ?auto_672423 ?auto_672426 ) ) ( not ( = ?auto_672423 ?auto_672427 ) ) ( not ( = ?auto_672423 ?auto_672428 ) ) ( not ( = ?auto_672423 ?auto_672429 ) ) ( not ( = ?auto_672423 ?auto_672430 ) ) ( not ( = ?auto_672423 ?auto_672431 ) ) ( not ( = ?auto_672423 ?auto_672432 ) ) ( not ( = ?auto_672423 ?auto_672433 ) ) ( not ( = ?auto_672423 ?auto_672434 ) ) ( not ( = ?auto_672424 ?auto_672425 ) ) ( not ( = ?auto_672424 ?auto_672426 ) ) ( not ( = ?auto_672424 ?auto_672427 ) ) ( not ( = ?auto_672424 ?auto_672428 ) ) ( not ( = ?auto_672424 ?auto_672429 ) ) ( not ( = ?auto_672424 ?auto_672430 ) ) ( not ( = ?auto_672424 ?auto_672431 ) ) ( not ( = ?auto_672424 ?auto_672432 ) ) ( not ( = ?auto_672424 ?auto_672433 ) ) ( not ( = ?auto_672424 ?auto_672434 ) ) ( not ( = ?auto_672425 ?auto_672426 ) ) ( not ( = ?auto_672425 ?auto_672427 ) ) ( not ( = ?auto_672425 ?auto_672428 ) ) ( not ( = ?auto_672425 ?auto_672429 ) ) ( not ( = ?auto_672425 ?auto_672430 ) ) ( not ( = ?auto_672425 ?auto_672431 ) ) ( not ( = ?auto_672425 ?auto_672432 ) ) ( not ( = ?auto_672425 ?auto_672433 ) ) ( not ( = ?auto_672425 ?auto_672434 ) ) ( not ( = ?auto_672426 ?auto_672427 ) ) ( not ( = ?auto_672426 ?auto_672428 ) ) ( not ( = ?auto_672426 ?auto_672429 ) ) ( not ( = ?auto_672426 ?auto_672430 ) ) ( not ( = ?auto_672426 ?auto_672431 ) ) ( not ( = ?auto_672426 ?auto_672432 ) ) ( not ( = ?auto_672426 ?auto_672433 ) ) ( not ( = ?auto_672426 ?auto_672434 ) ) ( not ( = ?auto_672427 ?auto_672428 ) ) ( not ( = ?auto_672427 ?auto_672429 ) ) ( not ( = ?auto_672427 ?auto_672430 ) ) ( not ( = ?auto_672427 ?auto_672431 ) ) ( not ( = ?auto_672427 ?auto_672432 ) ) ( not ( = ?auto_672427 ?auto_672433 ) ) ( not ( = ?auto_672427 ?auto_672434 ) ) ( not ( = ?auto_672428 ?auto_672429 ) ) ( not ( = ?auto_672428 ?auto_672430 ) ) ( not ( = ?auto_672428 ?auto_672431 ) ) ( not ( = ?auto_672428 ?auto_672432 ) ) ( not ( = ?auto_672428 ?auto_672433 ) ) ( not ( = ?auto_672428 ?auto_672434 ) ) ( not ( = ?auto_672429 ?auto_672430 ) ) ( not ( = ?auto_672429 ?auto_672431 ) ) ( not ( = ?auto_672429 ?auto_672432 ) ) ( not ( = ?auto_672429 ?auto_672433 ) ) ( not ( = ?auto_672429 ?auto_672434 ) ) ( not ( = ?auto_672430 ?auto_672431 ) ) ( not ( = ?auto_672430 ?auto_672432 ) ) ( not ( = ?auto_672430 ?auto_672433 ) ) ( not ( = ?auto_672430 ?auto_672434 ) ) ( not ( = ?auto_672431 ?auto_672432 ) ) ( not ( = ?auto_672431 ?auto_672433 ) ) ( not ( = ?auto_672431 ?auto_672434 ) ) ( not ( = ?auto_672432 ?auto_672433 ) ) ( not ( = ?auto_672432 ?auto_672434 ) ) ( not ( = ?auto_672433 ?auto_672434 ) ) ( ON ?auto_672432 ?auto_672433 ) ( ON ?auto_672431 ?auto_672432 ) ( ON ?auto_672430 ?auto_672431 ) ( ON ?auto_672429 ?auto_672430 ) ( ON ?auto_672428 ?auto_672429 ) ( ON ?auto_672427 ?auto_672428 ) ( ON ?auto_672426 ?auto_672427 ) ( ON ?auto_672425 ?auto_672426 ) ( ON ?auto_672424 ?auto_672425 ) ( ON ?auto_672423 ?auto_672424 ) ( ON ?auto_672422 ?auto_672423 ) ( ON ?auto_672421 ?auto_672422 ) ( ON ?auto_672420 ?auto_672421 ) ( ON ?auto_672419 ?auto_672420 ) ( ON ?auto_672418 ?auto_672419 ) ( ON ?auto_672417 ?auto_672418 ) ( CLEAR ?auto_672417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672417 )
      ( MAKE-17PILE ?auto_672417 ?auto_672418 ?auto_672419 ?auto_672420 ?auto_672421 ?auto_672422 ?auto_672423 ?auto_672424 ?auto_672425 ?auto_672426 ?auto_672427 ?auto_672428 ?auto_672429 ?auto_672430 ?auto_672431 ?auto_672432 ?auto_672433 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672452 - BLOCK
      ?auto_672453 - BLOCK
      ?auto_672454 - BLOCK
      ?auto_672455 - BLOCK
      ?auto_672456 - BLOCK
      ?auto_672457 - BLOCK
      ?auto_672458 - BLOCK
      ?auto_672459 - BLOCK
      ?auto_672460 - BLOCK
      ?auto_672461 - BLOCK
      ?auto_672462 - BLOCK
      ?auto_672463 - BLOCK
      ?auto_672464 - BLOCK
      ?auto_672465 - BLOCK
      ?auto_672466 - BLOCK
      ?auto_672467 - BLOCK
      ?auto_672468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_672468 ) ( not ( = ?auto_672452 ?auto_672453 ) ) ( not ( = ?auto_672452 ?auto_672454 ) ) ( not ( = ?auto_672452 ?auto_672455 ) ) ( not ( = ?auto_672452 ?auto_672456 ) ) ( not ( = ?auto_672452 ?auto_672457 ) ) ( not ( = ?auto_672452 ?auto_672458 ) ) ( not ( = ?auto_672452 ?auto_672459 ) ) ( not ( = ?auto_672452 ?auto_672460 ) ) ( not ( = ?auto_672452 ?auto_672461 ) ) ( not ( = ?auto_672452 ?auto_672462 ) ) ( not ( = ?auto_672452 ?auto_672463 ) ) ( not ( = ?auto_672452 ?auto_672464 ) ) ( not ( = ?auto_672452 ?auto_672465 ) ) ( not ( = ?auto_672452 ?auto_672466 ) ) ( not ( = ?auto_672452 ?auto_672467 ) ) ( not ( = ?auto_672452 ?auto_672468 ) ) ( not ( = ?auto_672453 ?auto_672454 ) ) ( not ( = ?auto_672453 ?auto_672455 ) ) ( not ( = ?auto_672453 ?auto_672456 ) ) ( not ( = ?auto_672453 ?auto_672457 ) ) ( not ( = ?auto_672453 ?auto_672458 ) ) ( not ( = ?auto_672453 ?auto_672459 ) ) ( not ( = ?auto_672453 ?auto_672460 ) ) ( not ( = ?auto_672453 ?auto_672461 ) ) ( not ( = ?auto_672453 ?auto_672462 ) ) ( not ( = ?auto_672453 ?auto_672463 ) ) ( not ( = ?auto_672453 ?auto_672464 ) ) ( not ( = ?auto_672453 ?auto_672465 ) ) ( not ( = ?auto_672453 ?auto_672466 ) ) ( not ( = ?auto_672453 ?auto_672467 ) ) ( not ( = ?auto_672453 ?auto_672468 ) ) ( not ( = ?auto_672454 ?auto_672455 ) ) ( not ( = ?auto_672454 ?auto_672456 ) ) ( not ( = ?auto_672454 ?auto_672457 ) ) ( not ( = ?auto_672454 ?auto_672458 ) ) ( not ( = ?auto_672454 ?auto_672459 ) ) ( not ( = ?auto_672454 ?auto_672460 ) ) ( not ( = ?auto_672454 ?auto_672461 ) ) ( not ( = ?auto_672454 ?auto_672462 ) ) ( not ( = ?auto_672454 ?auto_672463 ) ) ( not ( = ?auto_672454 ?auto_672464 ) ) ( not ( = ?auto_672454 ?auto_672465 ) ) ( not ( = ?auto_672454 ?auto_672466 ) ) ( not ( = ?auto_672454 ?auto_672467 ) ) ( not ( = ?auto_672454 ?auto_672468 ) ) ( not ( = ?auto_672455 ?auto_672456 ) ) ( not ( = ?auto_672455 ?auto_672457 ) ) ( not ( = ?auto_672455 ?auto_672458 ) ) ( not ( = ?auto_672455 ?auto_672459 ) ) ( not ( = ?auto_672455 ?auto_672460 ) ) ( not ( = ?auto_672455 ?auto_672461 ) ) ( not ( = ?auto_672455 ?auto_672462 ) ) ( not ( = ?auto_672455 ?auto_672463 ) ) ( not ( = ?auto_672455 ?auto_672464 ) ) ( not ( = ?auto_672455 ?auto_672465 ) ) ( not ( = ?auto_672455 ?auto_672466 ) ) ( not ( = ?auto_672455 ?auto_672467 ) ) ( not ( = ?auto_672455 ?auto_672468 ) ) ( not ( = ?auto_672456 ?auto_672457 ) ) ( not ( = ?auto_672456 ?auto_672458 ) ) ( not ( = ?auto_672456 ?auto_672459 ) ) ( not ( = ?auto_672456 ?auto_672460 ) ) ( not ( = ?auto_672456 ?auto_672461 ) ) ( not ( = ?auto_672456 ?auto_672462 ) ) ( not ( = ?auto_672456 ?auto_672463 ) ) ( not ( = ?auto_672456 ?auto_672464 ) ) ( not ( = ?auto_672456 ?auto_672465 ) ) ( not ( = ?auto_672456 ?auto_672466 ) ) ( not ( = ?auto_672456 ?auto_672467 ) ) ( not ( = ?auto_672456 ?auto_672468 ) ) ( not ( = ?auto_672457 ?auto_672458 ) ) ( not ( = ?auto_672457 ?auto_672459 ) ) ( not ( = ?auto_672457 ?auto_672460 ) ) ( not ( = ?auto_672457 ?auto_672461 ) ) ( not ( = ?auto_672457 ?auto_672462 ) ) ( not ( = ?auto_672457 ?auto_672463 ) ) ( not ( = ?auto_672457 ?auto_672464 ) ) ( not ( = ?auto_672457 ?auto_672465 ) ) ( not ( = ?auto_672457 ?auto_672466 ) ) ( not ( = ?auto_672457 ?auto_672467 ) ) ( not ( = ?auto_672457 ?auto_672468 ) ) ( not ( = ?auto_672458 ?auto_672459 ) ) ( not ( = ?auto_672458 ?auto_672460 ) ) ( not ( = ?auto_672458 ?auto_672461 ) ) ( not ( = ?auto_672458 ?auto_672462 ) ) ( not ( = ?auto_672458 ?auto_672463 ) ) ( not ( = ?auto_672458 ?auto_672464 ) ) ( not ( = ?auto_672458 ?auto_672465 ) ) ( not ( = ?auto_672458 ?auto_672466 ) ) ( not ( = ?auto_672458 ?auto_672467 ) ) ( not ( = ?auto_672458 ?auto_672468 ) ) ( not ( = ?auto_672459 ?auto_672460 ) ) ( not ( = ?auto_672459 ?auto_672461 ) ) ( not ( = ?auto_672459 ?auto_672462 ) ) ( not ( = ?auto_672459 ?auto_672463 ) ) ( not ( = ?auto_672459 ?auto_672464 ) ) ( not ( = ?auto_672459 ?auto_672465 ) ) ( not ( = ?auto_672459 ?auto_672466 ) ) ( not ( = ?auto_672459 ?auto_672467 ) ) ( not ( = ?auto_672459 ?auto_672468 ) ) ( not ( = ?auto_672460 ?auto_672461 ) ) ( not ( = ?auto_672460 ?auto_672462 ) ) ( not ( = ?auto_672460 ?auto_672463 ) ) ( not ( = ?auto_672460 ?auto_672464 ) ) ( not ( = ?auto_672460 ?auto_672465 ) ) ( not ( = ?auto_672460 ?auto_672466 ) ) ( not ( = ?auto_672460 ?auto_672467 ) ) ( not ( = ?auto_672460 ?auto_672468 ) ) ( not ( = ?auto_672461 ?auto_672462 ) ) ( not ( = ?auto_672461 ?auto_672463 ) ) ( not ( = ?auto_672461 ?auto_672464 ) ) ( not ( = ?auto_672461 ?auto_672465 ) ) ( not ( = ?auto_672461 ?auto_672466 ) ) ( not ( = ?auto_672461 ?auto_672467 ) ) ( not ( = ?auto_672461 ?auto_672468 ) ) ( not ( = ?auto_672462 ?auto_672463 ) ) ( not ( = ?auto_672462 ?auto_672464 ) ) ( not ( = ?auto_672462 ?auto_672465 ) ) ( not ( = ?auto_672462 ?auto_672466 ) ) ( not ( = ?auto_672462 ?auto_672467 ) ) ( not ( = ?auto_672462 ?auto_672468 ) ) ( not ( = ?auto_672463 ?auto_672464 ) ) ( not ( = ?auto_672463 ?auto_672465 ) ) ( not ( = ?auto_672463 ?auto_672466 ) ) ( not ( = ?auto_672463 ?auto_672467 ) ) ( not ( = ?auto_672463 ?auto_672468 ) ) ( not ( = ?auto_672464 ?auto_672465 ) ) ( not ( = ?auto_672464 ?auto_672466 ) ) ( not ( = ?auto_672464 ?auto_672467 ) ) ( not ( = ?auto_672464 ?auto_672468 ) ) ( not ( = ?auto_672465 ?auto_672466 ) ) ( not ( = ?auto_672465 ?auto_672467 ) ) ( not ( = ?auto_672465 ?auto_672468 ) ) ( not ( = ?auto_672466 ?auto_672467 ) ) ( not ( = ?auto_672466 ?auto_672468 ) ) ( not ( = ?auto_672467 ?auto_672468 ) ) ( ON ?auto_672467 ?auto_672468 ) ( ON ?auto_672466 ?auto_672467 ) ( ON ?auto_672465 ?auto_672466 ) ( ON ?auto_672464 ?auto_672465 ) ( ON ?auto_672463 ?auto_672464 ) ( ON ?auto_672462 ?auto_672463 ) ( ON ?auto_672461 ?auto_672462 ) ( ON ?auto_672460 ?auto_672461 ) ( ON ?auto_672459 ?auto_672460 ) ( ON ?auto_672458 ?auto_672459 ) ( ON ?auto_672457 ?auto_672458 ) ( ON ?auto_672456 ?auto_672457 ) ( ON ?auto_672455 ?auto_672456 ) ( ON ?auto_672454 ?auto_672455 ) ( ON ?auto_672453 ?auto_672454 ) ( ON ?auto_672452 ?auto_672453 ) ( CLEAR ?auto_672452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_672452 )
      ( MAKE-17PILE ?auto_672452 ?auto_672453 ?auto_672454 ?auto_672455 ?auto_672456 ?auto_672457 ?auto_672458 ?auto_672459 ?auto_672460 ?auto_672461 ?auto_672462 ?auto_672463 ?auto_672464 ?auto_672465 ?auto_672466 ?auto_672467 ?auto_672468 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_672486 - BLOCK
      ?auto_672487 - BLOCK
      ?auto_672488 - BLOCK
      ?auto_672489 - BLOCK
      ?auto_672490 - BLOCK
      ?auto_672491 - BLOCK
      ?auto_672492 - BLOCK
      ?auto_672493 - BLOCK
      ?auto_672494 - BLOCK
      ?auto_672495 - BLOCK
      ?auto_672496 - BLOCK
      ?auto_672497 - BLOCK
      ?auto_672498 - BLOCK
      ?auto_672499 - BLOCK
      ?auto_672500 - BLOCK
      ?auto_672501 - BLOCK
      ?auto_672502 - BLOCK
    )
    :vars
    (
      ?auto_672503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_672486 ?auto_672487 ) ) ( not ( = ?auto_672486 ?auto_672488 ) ) ( not ( = ?auto_672486 ?auto_672489 ) ) ( not ( = ?auto_672486 ?auto_672490 ) ) ( not ( = ?auto_672486 ?auto_672491 ) ) ( not ( = ?auto_672486 ?auto_672492 ) ) ( not ( = ?auto_672486 ?auto_672493 ) ) ( not ( = ?auto_672486 ?auto_672494 ) ) ( not ( = ?auto_672486 ?auto_672495 ) ) ( not ( = ?auto_672486 ?auto_672496 ) ) ( not ( = ?auto_672486 ?auto_672497 ) ) ( not ( = ?auto_672486 ?auto_672498 ) ) ( not ( = ?auto_672486 ?auto_672499 ) ) ( not ( = ?auto_672486 ?auto_672500 ) ) ( not ( = ?auto_672486 ?auto_672501 ) ) ( not ( = ?auto_672486 ?auto_672502 ) ) ( not ( = ?auto_672487 ?auto_672488 ) ) ( not ( = ?auto_672487 ?auto_672489 ) ) ( not ( = ?auto_672487 ?auto_672490 ) ) ( not ( = ?auto_672487 ?auto_672491 ) ) ( not ( = ?auto_672487 ?auto_672492 ) ) ( not ( = ?auto_672487 ?auto_672493 ) ) ( not ( = ?auto_672487 ?auto_672494 ) ) ( not ( = ?auto_672487 ?auto_672495 ) ) ( not ( = ?auto_672487 ?auto_672496 ) ) ( not ( = ?auto_672487 ?auto_672497 ) ) ( not ( = ?auto_672487 ?auto_672498 ) ) ( not ( = ?auto_672487 ?auto_672499 ) ) ( not ( = ?auto_672487 ?auto_672500 ) ) ( not ( = ?auto_672487 ?auto_672501 ) ) ( not ( = ?auto_672487 ?auto_672502 ) ) ( not ( = ?auto_672488 ?auto_672489 ) ) ( not ( = ?auto_672488 ?auto_672490 ) ) ( not ( = ?auto_672488 ?auto_672491 ) ) ( not ( = ?auto_672488 ?auto_672492 ) ) ( not ( = ?auto_672488 ?auto_672493 ) ) ( not ( = ?auto_672488 ?auto_672494 ) ) ( not ( = ?auto_672488 ?auto_672495 ) ) ( not ( = ?auto_672488 ?auto_672496 ) ) ( not ( = ?auto_672488 ?auto_672497 ) ) ( not ( = ?auto_672488 ?auto_672498 ) ) ( not ( = ?auto_672488 ?auto_672499 ) ) ( not ( = ?auto_672488 ?auto_672500 ) ) ( not ( = ?auto_672488 ?auto_672501 ) ) ( not ( = ?auto_672488 ?auto_672502 ) ) ( not ( = ?auto_672489 ?auto_672490 ) ) ( not ( = ?auto_672489 ?auto_672491 ) ) ( not ( = ?auto_672489 ?auto_672492 ) ) ( not ( = ?auto_672489 ?auto_672493 ) ) ( not ( = ?auto_672489 ?auto_672494 ) ) ( not ( = ?auto_672489 ?auto_672495 ) ) ( not ( = ?auto_672489 ?auto_672496 ) ) ( not ( = ?auto_672489 ?auto_672497 ) ) ( not ( = ?auto_672489 ?auto_672498 ) ) ( not ( = ?auto_672489 ?auto_672499 ) ) ( not ( = ?auto_672489 ?auto_672500 ) ) ( not ( = ?auto_672489 ?auto_672501 ) ) ( not ( = ?auto_672489 ?auto_672502 ) ) ( not ( = ?auto_672490 ?auto_672491 ) ) ( not ( = ?auto_672490 ?auto_672492 ) ) ( not ( = ?auto_672490 ?auto_672493 ) ) ( not ( = ?auto_672490 ?auto_672494 ) ) ( not ( = ?auto_672490 ?auto_672495 ) ) ( not ( = ?auto_672490 ?auto_672496 ) ) ( not ( = ?auto_672490 ?auto_672497 ) ) ( not ( = ?auto_672490 ?auto_672498 ) ) ( not ( = ?auto_672490 ?auto_672499 ) ) ( not ( = ?auto_672490 ?auto_672500 ) ) ( not ( = ?auto_672490 ?auto_672501 ) ) ( not ( = ?auto_672490 ?auto_672502 ) ) ( not ( = ?auto_672491 ?auto_672492 ) ) ( not ( = ?auto_672491 ?auto_672493 ) ) ( not ( = ?auto_672491 ?auto_672494 ) ) ( not ( = ?auto_672491 ?auto_672495 ) ) ( not ( = ?auto_672491 ?auto_672496 ) ) ( not ( = ?auto_672491 ?auto_672497 ) ) ( not ( = ?auto_672491 ?auto_672498 ) ) ( not ( = ?auto_672491 ?auto_672499 ) ) ( not ( = ?auto_672491 ?auto_672500 ) ) ( not ( = ?auto_672491 ?auto_672501 ) ) ( not ( = ?auto_672491 ?auto_672502 ) ) ( not ( = ?auto_672492 ?auto_672493 ) ) ( not ( = ?auto_672492 ?auto_672494 ) ) ( not ( = ?auto_672492 ?auto_672495 ) ) ( not ( = ?auto_672492 ?auto_672496 ) ) ( not ( = ?auto_672492 ?auto_672497 ) ) ( not ( = ?auto_672492 ?auto_672498 ) ) ( not ( = ?auto_672492 ?auto_672499 ) ) ( not ( = ?auto_672492 ?auto_672500 ) ) ( not ( = ?auto_672492 ?auto_672501 ) ) ( not ( = ?auto_672492 ?auto_672502 ) ) ( not ( = ?auto_672493 ?auto_672494 ) ) ( not ( = ?auto_672493 ?auto_672495 ) ) ( not ( = ?auto_672493 ?auto_672496 ) ) ( not ( = ?auto_672493 ?auto_672497 ) ) ( not ( = ?auto_672493 ?auto_672498 ) ) ( not ( = ?auto_672493 ?auto_672499 ) ) ( not ( = ?auto_672493 ?auto_672500 ) ) ( not ( = ?auto_672493 ?auto_672501 ) ) ( not ( = ?auto_672493 ?auto_672502 ) ) ( not ( = ?auto_672494 ?auto_672495 ) ) ( not ( = ?auto_672494 ?auto_672496 ) ) ( not ( = ?auto_672494 ?auto_672497 ) ) ( not ( = ?auto_672494 ?auto_672498 ) ) ( not ( = ?auto_672494 ?auto_672499 ) ) ( not ( = ?auto_672494 ?auto_672500 ) ) ( not ( = ?auto_672494 ?auto_672501 ) ) ( not ( = ?auto_672494 ?auto_672502 ) ) ( not ( = ?auto_672495 ?auto_672496 ) ) ( not ( = ?auto_672495 ?auto_672497 ) ) ( not ( = ?auto_672495 ?auto_672498 ) ) ( not ( = ?auto_672495 ?auto_672499 ) ) ( not ( = ?auto_672495 ?auto_672500 ) ) ( not ( = ?auto_672495 ?auto_672501 ) ) ( not ( = ?auto_672495 ?auto_672502 ) ) ( not ( = ?auto_672496 ?auto_672497 ) ) ( not ( = ?auto_672496 ?auto_672498 ) ) ( not ( = ?auto_672496 ?auto_672499 ) ) ( not ( = ?auto_672496 ?auto_672500 ) ) ( not ( = ?auto_672496 ?auto_672501 ) ) ( not ( = ?auto_672496 ?auto_672502 ) ) ( not ( = ?auto_672497 ?auto_672498 ) ) ( not ( = ?auto_672497 ?auto_672499 ) ) ( not ( = ?auto_672497 ?auto_672500 ) ) ( not ( = ?auto_672497 ?auto_672501 ) ) ( not ( = ?auto_672497 ?auto_672502 ) ) ( not ( = ?auto_672498 ?auto_672499 ) ) ( not ( = ?auto_672498 ?auto_672500 ) ) ( not ( = ?auto_672498 ?auto_672501 ) ) ( not ( = ?auto_672498 ?auto_672502 ) ) ( not ( = ?auto_672499 ?auto_672500 ) ) ( not ( = ?auto_672499 ?auto_672501 ) ) ( not ( = ?auto_672499 ?auto_672502 ) ) ( not ( = ?auto_672500 ?auto_672501 ) ) ( not ( = ?auto_672500 ?auto_672502 ) ) ( not ( = ?auto_672501 ?auto_672502 ) ) ( ON ?auto_672486 ?auto_672503 ) ( not ( = ?auto_672502 ?auto_672503 ) ) ( not ( = ?auto_672501 ?auto_672503 ) ) ( not ( = ?auto_672500 ?auto_672503 ) ) ( not ( = ?auto_672499 ?auto_672503 ) ) ( not ( = ?auto_672498 ?auto_672503 ) ) ( not ( = ?auto_672497 ?auto_672503 ) ) ( not ( = ?auto_672496 ?auto_672503 ) ) ( not ( = ?auto_672495 ?auto_672503 ) ) ( not ( = ?auto_672494 ?auto_672503 ) ) ( not ( = ?auto_672493 ?auto_672503 ) ) ( not ( = ?auto_672492 ?auto_672503 ) ) ( not ( = ?auto_672491 ?auto_672503 ) ) ( not ( = ?auto_672490 ?auto_672503 ) ) ( not ( = ?auto_672489 ?auto_672503 ) ) ( not ( = ?auto_672488 ?auto_672503 ) ) ( not ( = ?auto_672487 ?auto_672503 ) ) ( not ( = ?auto_672486 ?auto_672503 ) ) ( ON ?auto_672487 ?auto_672486 ) ( ON ?auto_672488 ?auto_672487 ) ( ON ?auto_672489 ?auto_672488 ) ( ON ?auto_672490 ?auto_672489 ) ( ON ?auto_672491 ?auto_672490 ) ( ON ?auto_672492 ?auto_672491 ) ( ON ?auto_672493 ?auto_672492 ) ( ON ?auto_672494 ?auto_672493 ) ( ON ?auto_672495 ?auto_672494 ) ( ON ?auto_672496 ?auto_672495 ) ( ON ?auto_672497 ?auto_672496 ) ( ON ?auto_672498 ?auto_672497 ) ( ON ?auto_672499 ?auto_672498 ) ( ON ?auto_672500 ?auto_672499 ) ( ON ?auto_672501 ?auto_672500 ) ( ON ?auto_672502 ?auto_672501 ) ( CLEAR ?auto_672502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_672502 ?auto_672501 ?auto_672500 ?auto_672499 ?auto_672498 ?auto_672497 ?auto_672496 ?auto_672495 ?auto_672494 ?auto_672493 ?auto_672492 ?auto_672491 ?auto_672490 ?auto_672489 ?auto_672488 ?auto_672487 ?auto_672486 )
      ( MAKE-17PILE ?auto_672486 ?auto_672487 ?auto_672488 ?auto_672489 ?auto_672490 ?auto_672491 ?auto_672492 ?auto_672493 ?auto_672494 ?auto_672495 ?auto_672496 ?auto_672497 ?auto_672498 ?auto_672499 ?auto_672500 ?auto_672501 ?auto_672502 ) )
  )

)

