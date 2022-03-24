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
      ?auto_71041 - BLOCK
    )
    :vars
    (
      ?auto_71042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71041 ?auto_71042 ) ( CLEAR ?auto_71041 ) ( HAND-EMPTY ) ( not ( = ?auto_71041 ?auto_71042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71041 ?auto_71042 )
      ( !PUTDOWN ?auto_71041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71048 - BLOCK
      ?auto_71049 - BLOCK
    )
    :vars
    (
      ?auto_71050 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71048 ) ( ON ?auto_71049 ?auto_71050 ) ( CLEAR ?auto_71049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71048 ) ( not ( = ?auto_71048 ?auto_71049 ) ) ( not ( = ?auto_71048 ?auto_71050 ) ) ( not ( = ?auto_71049 ?auto_71050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71049 ?auto_71050 )
      ( !STACK ?auto_71049 ?auto_71048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71058 - BLOCK
      ?auto_71059 - BLOCK
    )
    :vars
    (
      ?auto_71060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71059 ?auto_71060 ) ( not ( = ?auto_71058 ?auto_71059 ) ) ( not ( = ?auto_71058 ?auto_71060 ) ) ( not ( = ?auto_71059 ?auto_71060 ) ) ( ON ?auto_71058 ?auto_71059 ) ( CLEAR ?auto_71058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71058 )
      ( MAKE-2PILE ?auto_71058 ?auto_71059 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71069 - BLOCK
      ?auto_71070 - BLOCK
      ?auto_71071 - BLOCK
    )
    :vars
    (
      ?auto_71072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71070 ) ( ON ?auto_71071 ?auto_71072 ) ( CLEAR ?auto_71071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71069 ) ( ON ?auto_71070 ?auto_71069 ) ( not ( = ?auto_71069 ?auto_71070 ) ) ( not ( = ?auto_71069 ?auto_71071 ) ) ( not ( = ?auto_71069 ?auto_71072 ) ) ( not ( = ?auto_71070 ?auto_71071 ) ) ( not ( = ?auto_71070 ?auto_71072 ) ) ( not ( = ?auto_71071 ?auto_71072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71071 ?auto_71072 )
      ( !STACK ?auto_71071 ?auto_71070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71083 - BLOCK
      ?auto_71084 - BLOCK
      ?auto_71085 - BLOCK
    )
    :vars
    (
      ?auto_71086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71085 ?auto_71086 ) ( ON-TABLE ?auto_71083 ) ( not ( = ?auto_71083 ?auto_71084 ) ) ( not ( = ?auto_71083 ?auto_71085 ) ) ( not ( = ?auto_71083 ?auto_71086 ) ) ( not ( = ?auto_71084 ?auto_71085 ) ) ( not ( = ?auto_71084 ?auto_71086 ) ) ( not ( = ?auto_71085 ?auto_71086 ) ) ( CLEAR ?auto_71083 ) ( ON ?auto_71084 ?auto_71085 ) ( CLEAR ?auto_71084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71083 ?auto_71084 )
      ( MAKE-3PILE ?auto_71083 ?auto_71084 ?auto_71085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71097 - BLOCK
      ?auto_71098 - BLOCK
      ?auto_71099 - BLOCK
    )
    :vars
    (
      ?auto_71100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71099 ?auto_71100 ) ( not ( = ?auto_71097 ?auto_71098 ) ) ( not ( = ?auto_71097 ?auto_71099 ) ) ( not ( = ?auto_71097 ?auto_71100 ) ) ( not ( = ?auto_71098 ?auto_71099 ) ) ( not ( = ?auto_71098 ?auto_71100 ) ) ( not ( = ?auto_71099 ?auto_71100 ) ) ( ON ?auto_71098 ?auto_71099 ) ( ON ?auto_71097 ?auto_71098 ) ( CLEAR ?auto_71097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71097 )
      ( MAKE-3PILE ?auto_71097 ?auto_71098 ?auto_71099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71112 - BLOCK
      ?auto_71113 - BLOCK
      ?auto_71114 - BLOCK
      ?auto_71115 - BLOCK
    )
    :vars
    (
      ?auto_71116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71114 ) ( ON ?auto_71115 ?auto_71116 ) ( CLEAR ?auto_71115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71112 ) ( ON ?auto_71113 ?auto_71112 ) ( ON ?auto_71114 ?auto_71113 ) ( not ( = ?auto_71112 ?auto_71113 ) ) ( not ( = ?auto_71112 ?auto_71114 ) ) ( not ( = ?auto_71112 ?auto_71115 ) ) ( not ( = ?auto_71112 ?auto_71116 ) ) ( not ( = ?auto_71113 ?auto_71114 ) ) ( not ( = ?auto_71113 ?auto_71115 ) ) ( not ( = ?auto_71113 ?auto_71116 ) ) ( not ( = ?auto_71114 ?auto_71115 ) ) ( not ( = ?auto_71114 ?auto_71116 ) ) ( not ( = ?auto_71115 ?auto_71116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71115 ?auto_71116 )
      ( !STACK ?auto_71115 ?auto_71114 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71130 - BLOCK
      ?auto_71131 - BLOCK
      ?auto_71132 - BLOCK
      ?auto_71133 - BLOCK
    )
    :vars
    (
      ?auto_71134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71133 ?auto_71134 ) ( ON-TABLE ?auto_71130 ) ( ON ?auto_71131 ?auto_71130 ) ( not ( = ?auto_71130 ?auto_71131 ) ) ( not ( = ?auto_71130 ?auto_71132 ) ) ( not ( = ?auto_71130 ?auto_71133 ) ) ( not ( = ?auto_71130 ?auto_71134 ) ) ( not ( = ?auto_71131 ?auto_71132 ) ) ( not ( = ?auto_71131 ?auto_71133 ) ) ( not ( = ?auto_71131 ?auto_71134 ) ) ( not ( = ?auto_71132 ?auto_71133 ) ) ( not ( = ?auto_71132 ?auto_71134 ) ) ( not ( = ?auto_71133 ?auto_71134 ) ) ( CLEAR ?auto_71131 ) ( ON ?auto_71132 ?auto_71133 ) ( CLEAR ?auto_71132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71130 ?auto_71131 ?auto_71132 )
      ( MAKE-4PILE ?auto_71130 ?auto_71131 ?auto_71132 ?auto_71133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71148 - BLOCK
      ?auto_71149 - BLOCK
      ?auto_71150 - BLOCK
      ?auto_71151 - BLOCK
    )
    :vars
    (
      ?auto_71152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71151 ?auto_71152 ) ( ON-TABLE ?auto_71148 ) ( not ( = ?auto_71148 ?auto_71149 ) ) ( not ( = ?auto_71148 ?auto_71150 ) ) ( not ( = ?auto_71148 ?auto_71151 ) ) ( not ( = ?auto_71148 ?auto_71152 ) ) ( not ( = ?auto_71149 ?auto_71150 ) ) ( not ( = ?auto_71149 ?auto_71151 ) ) ( not ( = ?auto_71149 ?auto_71152 ) ) ( not ( = ?auto_71150 ?auto_71151 ) ) ( not ( = ?auto_71150 ?auto_71152 ) ) ( not ( = ?auto_71151 ?auto_71152 ) ) ( ON ?auto_71150 ?auto_71151 ) ( CLEAR ?auto_71148 ) ( ON ?auto_71149 ?auto_71150 ) ( CLEAR ?auto_71149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71148 ?auto_71149 )
      ( MAKE-4PILE ?auto_71148 ?auto_71149 ?auto_71150 ?auto_71151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71166 - BLOCK
      ?auto_71167 - BLOCK
      ?auto_71168 - BLOCK
      ?auto_71169 - BLOCK
    )
    :vars
    (
      ?auto_71170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71169 ?auto_71170 ) ( not ( = ?auto_71166 ?auto_71167 ) ) ( not ( = ?auto_71166 ?auto_71168 ) ) ( not ( = ?auto_71166 ?auto_71169 ) ) ( not ( = ?auto_71166 ?auto_71170 ) ) ( not ( = ?auto_71167 ?auto_71168 ) ) ( not ( = ?auto_71167 ?auto_71169 ) ) ( not ( = ?auto_71167 ?auto_71170 ) ) ( not ( = ?auto_71168 ?auto_71169 ) ) ( not ( = ?auto_71168 ?auto_71170 ) ) ( not ( = ?auto_71169 ?auto_71170 ) ) ( ON ?auto_71168 ?auto_71169 ) ( ON ?auto_71167 ?auto_71168 ) ( ON ?auto_71166 ?auto_71167 ) ( CLEAR ?auto_71166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71166 )
      ( MAKE-4PILE ?auto_71166 ?auto_71167 ?auto_71168 ?auto_71169 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71185 - BLOCK
      ?auto_71186 - BLOCK
      ?auto_71187 - BLOCK
      ?auto_71188 - BLOCK
      ?auto_71189 - BLOCK
    )
    :vars
    (
      ?auto_71190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71188 ) ( ON ?auto_71189 ?auto_71190 ) ( CLEAR ?auto_71189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71185 ) ( ON ?auto_71186 ?auto_71185 ) ( ON ?auto_71187 ?auto_71186 ) ( ON ?auto_71188 ?auto_71187 ) ( not ( = ?auto_71185 ?auto_71186 ) ) ( not ( = ?auto_71185 ?auto_71187 ) ) ( not ( = ?auto_71185 ?auto_71188 ) ) ( not ( = ?auto_71185 ?auto_71189 ) ) ( not ( = ?auto_71185 ?auto_71190 ) ) ( not ( = ?auto_71186 ?auto_71187 ) ) ( not ( = ?auto_71186 ?auto_71188 ) ) ( not ( = ?auto_71186 ?auto_71189 ) ) ( not ( = ?auto_71186 ?auto_71190 ) ) ( not ( = ?auto_71187 ?auto_71188 ) ) ( not ( = ?auto_71187 ?auto_71189 ) ) ( not ( = ?auto_71187 ?auto_71190 ) ) ( not ( = ?auto_71188 ?auto_71189 ) ) ( not ( = ?auto_71188 ?auto_71190 ) ) ( not ( = ?auto_71189 ?auto_71190 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71189 ?auto_71190 )
      ( !STACK ?auto_71189 ?auto_71188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71207 - BLOCK
      ?auto_71208 - BLOCK
      ?auto_71209 - BLOCK
      ?auto_71210 - BLOCK
      ?auto_71211 - BLOCK
    )
    :vars
    (
      ?auto_71212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71211 ?auto_71212 ) ( ON-TABLE ?auto_71207 ) ( ON ?auto_71208 ?auto_71207 ) ( ON ?auto_71209 ?auto_71208 ) ( not ( = ?auto_71207 ?auto_71208 ) ) ( not ( = ?auto_71207 ?auto_71209 ) ) ( not ( = ?auto_71207 ?auto_71210 ) ) ( not ( = ?auto_71207 ?auto_71211 ) ) ( not ( = ?auto_71207 ?auto_71212 ) ) ( not ( = ?auto_71208 ?auto_71209 ) ) ( not ( = ?auto_71208 ?auto_71210 ) ) ( not ( = ?auto_71208 ?auto_71211 ) ) ( not ( = ?auto_71208 ?auto_71212 ) ) ( not ( = ?auto_71209 ?auto_71210 ) ) ( not ( = ?auto_71209 ?auto_71211 ) ) ( not ( = ?auto_71209 ?auto_71212 ) ) ( not ( = ?auto_71210 ?auto_71211 ) ) ( not ( = ?auto_71210 ?auto_71212 ) ) ( not ( = ?auto_71211 ?auto_71212 ) ) ( CLEAR ?auto_71209 ) ( ON ?auto_71210 ?auto_71211 ) ( CLEAR ?auto_71210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71207 ?auto_71208 ?auto_71209 ?auto_71210 )
      ( MAKE-5PILE ?auto_71207 ?auto_71208 ?auto_71209 ?auto_71210 ?auto_71211 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71229 - BLOCK
      ?auto_71230 - BLOCK
      ?auto_71231 - BLOCK
      ?auto_71232 - BLOCK
      ?auto_71233 - BLOCK
    )
    :vars
    (
      ?auto_71234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71233 ?auto_71234 ) ( ON-TABLE ?auto_71229 ) ( ON ?auto_71230 ?auto_71229 ) ( not ( = ?auto_71229 ?auto_71230 ) ) ( not ( = ?auto_71229 ?auto_71231 ) ) ( not ( = ?auto_71229 ?auto_71232 ) ) ( not ( = ?auto_71229 ?auto_71233 ) ) ( not ( = ?auto_71229 ?auto_71234 ) ) ( not ( = ?auto_71230 ?auto_71231 ) ) ( not ( = ?auto_71230 ?auto_71232 ) ) ( not ( = ?auto_71230 ?auto_71233 ) ) ( not ( = ?auto_71230 ?auto_71234 ) ) ( not ( = ?auto_71231 ?auto_71232 ) ) ( not ( = ?auto_71231 ?auto_71233 ) ) ( not ( = ?auto_71231 ?auto_71234 ) ) ( not ( = ?auto_71232 ?auto_71233 ) ) ( not ( = ?auto_71232 ?auto_71234 ) ) ( not ( = ?auto_71233 ?auto_71234 ) ) ( ON ?auto_71232 ?auto_71233 ) ( CLEAR ?auto_71230 ) ( ON ?auto_71231 ?auto_71232 ) ( CLEAR ?auto_71231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71229 ?auto_71230 ?auto_71231 )
      ( MAKE-5PILE ?auto_71229 ?auto_71230 ?auto_71231 ?auto_71232 ?auto_71233 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71251 - BLOCK
      ?auto_71252 - BLOCK
      ?auto_71253 - BLOCK
      ?auto_71254 - BLOCK
      ?auto_71255 - BLOCK
    )
    :vars
    (
      ?auto_71256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71255 ?auto_71256 ) ( ON-TABLE ?auto_71251 ) ( not ( = ?auto_71251 ?auto_71252 ) ) ( not ( = ?auto_71251 ?auto_71253 ) ) ( not ( = ?auto_71251 ?auto_71254 ) ) ( not ( = ?auto_71251 ?auto_71255 ) ) ( not ( = ?auto_71251 ?auto_71256 ) ) ( not ( = ?auto_71252 ?auto_71253 ) ) ( not ( = ?auto_71252 ?auto_71254 ) ) ( not ( = ?auto_71252 ?auto_71255 ) ) ( not ( = ?auto_71252 ?auto_71256 ) ) ( not ( = ?auto_71253 ?auto_71254 ) ) ( not ( = ?auto_71253 ?auto_71255 ) ) ( not ( = ?auto_71253 ?auto_71256 ) ) ( not ( = ?auto_71254 ?auto_71255 ) ) ( not ( = ?auto_71254 ?auto_71256 ) ) ( not ( = ?auto_71255 ?auto_71256 ) ) ( ON ?auto_71254 ?auto_71255 ) ( ON ?auto_71253 ?auto_71254 ) ( CLEAR ?auto_71251 ) ( ON ?auto_71252 ?auto_71253 ) ( CLEAR ?auto_71252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71251 ?auto_71252 )
      ( MAKE-5PILE ?auto_71251 ?auto_71252 ?auto_71253 ?auto_71254 ?auto_71255 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71273 - BLOCK
      ?auto_71274 - BLOCK
      ?auto_71275 - BLOCK
      ?auto_71276 - BLOCK
      ?auto_71277 - BLOCK
    )
    :vars
    (
      ?auto_71278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71277 ?auto_71278 ) ( not ( = ?auto_71273 ?auto_71274 ) ) ( not ( = ?auto_71273 ?auto_71275 ) ) ( not ( = ?auto_71273 ?auto_71276 ) ) ( not ( = ?auto_71273 ?auto_71277 ) ) ( not ( = ?auto_71273 ?auto_71278 ) ) ( not ( = ?auto_71274 ?auto_71275 ) ) ( not ( = ?auto_71274 ?auto_71276 ) ) ( not ( = ?auto_71274 ?auto_71277 ) ) ( not ( = ?auto_71274 ?auto_71278 ) ) ( not ( = ?auto_71275 ?auto_71276 ) ) ( not ( = ?auto_71275 ?auto_71277 ) ) ( not ( = ?auto_71275 ?auto_71278 ) ) ( not ( = ?auto_71276 ?auto_71277 ) ) ( not ( = ?auto_71276 ?auto_71278 ) ) ( not ( = ?auto_71277 ?auto_71278 ) ) ( ON ?auto_71276 ?auto_71277 ) ( ON ?auto_71275 ?auto_71276 ) ( ON ?auto_71274 ?auto_71275 ) ( ON ?auto_71273 ?auto_71274 ) ( CLEAR ?auto_71273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71273 )
      ( MAKE-5PILE ?auto_71273 ?auto_71274 ?auto_71275 ?auto_71276 ?auto_71277 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71296 - BLOCK
      ?auto_71297 - BLOCK
      ?auto_71298 - BLOCK
      ?auto_71299 - BLOCK
      ?auto_71300 - BLOCK
      ?auto_71301 - BLOCK
    )
    :vars
    (
      ?auto_71302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71300 ) ( ON ?auto_71301 ?auto_71302 ) ( CLEAR ?auto_71301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71296 ) ( ON ?auto_71297 ?auto_71296 ) ( ON ?auto_71298 ?auto_71297 ) ( ON ?auto_71299 ?auto_71298 ) ( ON ?auto_71300 ?auto_71299 ) ( not ( = ?auto_71296 ?auto_71297 ) ) ( not ( = ?auto_71296 ?auto_71298 ) ) ( not ( = ?auto_71296 ?auto_71299 ) ) ( not ( = ?auto_71296 ?auto_71300 ) ) ( not ( = ?auto_71296 ?auto_71301 ) ) ( not ( = ?auto_71296 ?auto_71302 ) ) ( not ( = ?auto_71297 ?auto_71298 ) ) ( not ( = ?auto_71297 ?auto_71299 ) ) ( not ( = ?auto_71297 ?auto_71300 ) ) ( not ( = ?auto_71297 ?auto_71301 ) ) ( not ( = ?auto_71297 ?auto_71302 ) ) ( not ( = ?auto_71298 ?auto_71299 ) ) ( not ( = ?auto_71298 ?auto_71300 ) ) ( not ( = ?auto_71298 ?auto_71301 ) ) ( not ( = ?auto_71298 ?auto_71302 ) ) ( not ( = ?auto_71299 ?auto_71300 ) ) ( not ( = ?auto_71299 ?auto_71301 ) ) ( not ( = ?auto_71299 ?auto_71302 ) ) ( not ( = ?auto_71300 ?auto_71301 ) ) ( not ( = ?auto_71300 ?auto_71302 ) ) ( not ( = ?auto_71301 ?auto_71302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71301 ?auto_71302 )
      ( !STACK ?auto_71301 ?auto_71300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71322 - BLOCK
      ?auto_71323 - BLOCK
      ?auto_71324 - BLOCK
      ?auto_71325 - BLOCK
      ?auto_71326 - BLOCK
      ?auto_71327 - BLOCK
    )
    :vars
    (
      ?auto_71328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71327 ?auto_71328 ) ( ON-TABLE ?auto_71322 ) ( ON ?auto_71323 ?auto_71322 ) ( ON ?auto_71324 ?auto_71323 ) ( ON ?auto_71325 ?auto_71324 ) ( not ( = ?auto_71322 ?auto_71323 ) ) ( not ( = ?auto_71322 ?auto_71324 ) ) ( not ( = ?auto_71322 ?auto_71325 ) ) ( not ( = ?auto_71322 ?auto_71326 ) ) ( not ( = ?auto_71322 ?auto_71327 ) ) ( not ( = ?auto_71322 ?auto_71328 ) ) ( not ( = ?auto_71323 ?auto_71324 ) ) ( not ( = ?auto_71323 ?auto_71325 ) ) ( not ( = ?auto_71323 ?auto_71326 ) ) ( not ( = ?auto_71323 ?auto_71327 ) ) ( not ( = ?auto_71323 ?auto_71328 ) ) ( not ( = ?auto_71324 ?auto_71325 ) ) ( not ( = ?auto_71324 ?auto_71326 ) ) ( not ( = ?auto_71324 ?auto_71327 ) ) ( not ( = ?auto_71324 ?auto_71328 ) ) ( not ( = ?auto_71325 ?auto_71326 ) ) ( not ( = ?auto_71325 ?auto_71327 ) ) ( not ( = ?auto_71325 ?auto_71328 ) ) ( not ( = ?auto_71326 ?auto_71327 ) ) ( not ( = ?auto_71326 ?auto_71328 ) ) ( not ( = ?auto_71327 ?auto_71328 ) ) ( CLEAR ?auto_71325 ) ( ON ?auto_71326 ?auto_71327 ) ( CLEAR ?auto_71326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71322 ?auto_71323 ?auto_71324 ?auto_71325 ?auto_71326 )
      ( MAKE-6PILE ?auto_71322 ?auto_71323 ?auto_71324 ?auto_71325 ?auto_71326 ?auto_71327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71348 - BLOCK
      ?auto_71349 - BLOCK
      ?auto_71350 - BLOCK
      ?auto_71351 - BLOCK
      ?auto_71352 - BLOCK
      ?auto_71353 - BLOCK
    )
    :vars
    (
      ?auto_71354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71353 ?auto_71354 ) ( ON-TABLE ?auto_71348 ) ( ON ?auto_71349 ?auto_71348 ) ( ON ?auto_71350 ?auto_71349 ) ( not ( = ?auto_71348 ?auto_71349 ) ) ( not ( = ?auto_71348 ?auto_71350 ) ) ( not ( = ?auto_71348 ?auto_71351 ) ) ( not ( = ?auto_71348 ?auto_71352 ) ) ( not ( = ?auto_71348 ?auto_71353 ) ) ( not ( = ?auto_71348 ?auto_71354 ) ) ( not ( = ?auto_71349 ?auto_71350 ) ) ( not ( = ?auto_71349 ?auto_71351 ) ) ( not ( = ?auto_71349 ?auto_71352 ) ) ( not ( = ?auto_71349 ?auto_71353 ) ) ( not ( = ?auto_71349 ?auto_71354 ) ) ( not ( = ?auto_71350 ?auto_71351 ) ) ( not ( = ?auto_71350 ?auto_71352 ) ) ( not ( = ?auto_71350 ?auto_71353 ) ) ( not ( = ?auto_71350 ?auto_71354 ) ) ( not ( = ?auto_71351 ?auto_71352 ) ) ( not ( = ?auto_71351 ?auto_71353 ) ) ( not ( = ?auto_71351 ?auto_71354 ) ) ( not ( = ?auto_71352 ?auto_71353 ) ) ( not ( = ?auto_71352 ?auto_71354 ) ) ( not ( = ?auto_71353 ?auto_71354 ) ) ( ON ?auto_71352 ?auto_71353 ) ( CLEAR ?auto_71350 ) ( ON ?auto_71351 ?auto_71352 ) ( CLEAR ?auto_71351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71348 ?auto_71349 ?auto_71350 ?auto_71351 )
      ( MAKE-6PILE ?auto_71348 ?auto_71349 ?auto_71350 ?auto_71351 ?auto_71352 ?auto_71353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71374 - BLOCK
      ?auto_71375 - BLOCK
      ?auto_71376 - BLOCK
      ?auto_71377 - BLOCK
      ?auto_71378 - BLOCK
      ?auto_71379 - BLOCK
    )
    :vars
    (
      ?auto_71380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71379 ?auto_71380 ) ( ON-TABLE ?auto_71374 ) ( ON ?auto_71375 ?auto_71374 ) ( not ( = ?auto_71374 ?auto_71375 ) ) ( not ( = ?auto_71374 ?auto_71376 ) ) ( not ( = ?auto_71374 ?auto_71377 ) ) ( not ( = ?auto_71374 ?auto_71378 ) ) ( not ( = ?auto_71374 ?auto_71379 ) ) ( not ( = ?auto_71374 ?auto_71380 ) ) ( not ( = ?auto_71375 ?auto_71376 ) ) ( not ( = ?auto_71375 ?auto_71377 ) ) ( not ( = ?auto_71375 ?auto_71378 ) ) ( not ( = ?auto_71375 ?auto_71379 ) ) ( not ( = ?auto_71375 ?auto_71380 ) ) ( not ( = ?auto_71376 ?auto_71377 ) ) ( not ( = ?auto_71376 ?auto_71378 ) ) ( not ( = ?auto_71376 ?auto_71379 ) ) ( not ( = ?auto_71376 ?auto_71380 ) ) ( not ( = ?auto_71377 ?auto_71378 ) ) ( not ( = ?auto_71377 ?auto_71379 ) ) ( not ( = ?auto_71377 ?auto_71380 ) ) ( not ( = ?auto_71378 ?auto_71379 ) ) ( not ( = ?auto_71378 ?auto_71380 ) ) ( not ( = ?auto_71379 ?auto_71380 ) ) ( ON ?auto_71378 ?auto_71379 ) ( ON ?auto_71377 ?auto_71378 ) ( CLEAR ?auto_71375 ) ( ON ?auto_71376 ?auto_71377 ) ( CLEAR ?auto_71376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71374 ?auto_71375 ?auto_71376 )
      ( MAKE-6PILE ?auto_71374 ?auto_71375 ?auto_71376 ?auto_71377 ?auto_71378 ?auto_71379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71400 - BLOCK
      ?auto_71401 - BLOCK
      ?auto_71402 - BLOCK
      ?auto_71403 - BLOCK
      ?auto_71404 - BLOCK
      ?auto_71405 - BLOCK
    )
    :vars
    (
      ?auto_71406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71405 ?auto_71406 ) ( ON-TABLE ?auto_71400 ) ( not ( = ?auto_71400 ?auto_71401 ) ) ( not ( = ?auto_71400 ?auto_71402 ) ) ( not ( = ?auto_71400 ?auto_71403 ) ) ( not ( = ?auto_71400 ?auto_71404 ) ) ( not ( = ?auto_71400 ?auto_71405 ) ) ( not ( = ?auto_71400 ?auto_71406 ) ) ( not ( = ?auto_71401 ?auto_71402 ) ) ( not ( = ?auto_71401 ?auto_71403 ) ) ( not ( = ?auto_71401 ?auto_71404 ) ) ( not ( = ?auto_71401 ?auto_71405 ) ) ( not ( = ?auto_71401 ?auto_71406 ) ) ( not ( = ?auto_71402 ?auto_71403 ) ) ( not ( = ?auto_71402 ?auto_71404 ) ) ( not ( = ?auto_71402 ?auto_71405 ) ) ( not ( = ?auto_71402 ?auto_71406 ) ) ( not ( = ?auto_71403 ?auto_71404 ) ) ( not ( = ?auto_71403 ?auto_71405 ) ) ( not ( = ?auto_71403 ?auto_71406 ) ) ( not ( = ?auto_71404 ?auto_71405 ) ) ( not ( = ?auto_71404 ?auto_71406 ) ) ( not ( = ?auto_71405 ?auto_71406 ) ) ( ON ?auto_71404 ?auto_71405 ) ( ON ?auto_71403 ?auto_71404 ) ( ON ?auto_71402 ?auto_71403 ) ( CLEAR ?auto_71400 ) ( ON ?auto_71401 ?auto_71402 ) ( CLEAR ?auto_71401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71400 ?auto_71401 )
      ( MAKE-6PILE ?auto_71400 ?auto_71401 ?auto_71402 ?auto_71403 ?auto_71404 ?auto_71405 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71426 - BLOCK
      ?auto_71427 - BLOCK
      ?auto_71428 - BLOCK
      ?auto_71429 - BLOCK
      ?auto_71430 - BLOCK
      ?auto_71431 - BLOCK
    )
    :vars
    (
      ?auto_71432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71431 ?auto_71432 ) ( not ( = ?auto_71426 ?auto_71427 ) ) ( not ( = ?auto_71426 ?auto_71428 ) ) ( not ( = ?auto_71426 ?auto_71429 ) ) ( not ( = ?auto_71426 ?auto_71430 ) ) ( not ( = ?auto_71426 ?auto_71431 ) ) ( not ( = ?auto_71426 ?auto_71432 ) ) ( not ( = ?auto_71427 ?auto_71428 ) ) ( not ( = ?auto_71427 ?auto_71429 ) ) ( not ( = ?auto_71427 ?auto_71430 ) ) ( not ( = ?auto_71427 ?auto_71431 ) ) ( not ( = ?auto_71427 ?auto_71432 ) ) ( not ( = ?auto_71428 ?auto_71429 ) ) ( not ( = ?auto_71428 ?auto_71430 ) ) ( not ( = ?auto_71428 ?auto_71431 ) ) ( not ( = ?auto_71428 ?auto_71432 ) ) ( not ( = ?auto_71429 ?auto_71430 ) ) ( not ( = ?auto_71429 ?auto_71431 ) ) ( not ( = ?auto_71429 ?auto_71432 ) ) ( not ( = ?auto_71430 ?auto_71431 ) ) ( not ( = ?auto_71430 ?auto_71432 ) ) ( not ( = ?auto_71431 ?auto_71432 ) ) ( ON ?auto_71430 ?auto_71431 ) ( ON ?auto_71429 ?auto_71430 ) ( ON ?auto_71428 ?auto_71429 ) ( ON ?auto_71427 ?auto_71428 ) ( ON ?auto_71426 ?auto_71427 ) ( CLEAR ?auto_71426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71426 )
      ( MAKE-6PILE ?auto_71426 ?auto_71427 ?auto_71428 ?auto_71429 ?auto_71430 ?auto_71431 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71453 - BLOCK
      ?auto_71454 - BLOCK
      ?auto_71455 - BLOCK
      ?auto_71456 - BLOCK
      ?auto_71457 - BLOCK
      ?auto_71458 - BLOCK
      ?auto_71459 - BLOCK
    )
    :vars
    (
      ?auto_71460 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71458 ) ( ON ?auto_71459 ?auto_71460 ) ( CLEAR ?auto_71459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71453 ) ( ON ?auto_71454 ?auto_71453 ) ( ON ?auto_71455 ?auto_71454 ) ( ON ?auto_71456 ?auto_71455 ) ( ON ?auto_71457 ?auto_71456 ) ( ON ?auto_71458 ?auto_71457 ) ( not ( = ?auto_71453 ?auto_71454 ) ) ( not ( = ?auto_71453 ?auto_71455 ) ) ( not ( = ?auto_71453 ?auto_71456 ) ) ( not ( = ?auto_71453 ?auto_71457 ) ) ( not ( = ?auto_71453 ?auto_71458 ) ) ( not ( = ?auto_71453 ?auto_71459 ) ) ( not ( = ?auto_71453 ?auto_71460 ) ) ( not ( = ?auto_71454 ?auto_71455 ) ) ( not ( = ?auto_71454 ?auto_71456 ) ) ( not ( = ?auto_71454 ?auto_71457 ) ) ( not ( = ?auto_71454 ?auto_71458 ) ) ( not ( = ?auto_71454 ?auto_71459 ) ) ( not ( = ?auto_71454 ?auto_71460 ) ) ( not ( = ?auto_71455 ?auto_71456 ) ) ( not ( = ?auto_71455 ?auto_71457 ) ) ( not ( = ?auto_71455 ?auto_71458 ) ) ( not ( = ?auto_71455 ?auto_71459 ) ) ( not ( = ?auto_71455 ?auto_71460 ) ) ( not ( = ?auto_71456 ?auto_71457 ) ) ( not ( = ?auto_71456 ?auto_71458 ) ) ( not ( = ?auto_71456 ?auto_71459 ) ) ( not ( = ?auto_71456 ?auto_71460 ) ) ( not ( = ?auto_71457 ?auto_71458 ) ) ( not ( = ?auto_71457 ?auto_71459 ) ) ( not ( = ?auto_71457 ?auto_71460 ) ) ( not ( = ?auto_71458 ?auto_71459 ) ) ( not ( = ?auto_71458 ?auto_71460 ) ) ( not ( = ?auto_71459 ?auto_71460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71459 ?auto_71460 )
      ( !STACK ?auto_71459 ?auto_71458 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71483 - BLOCK
      ?auto_71484 - BLOCK
      ?auto_71485 - BLOCK
      ?auto_71486 - BLOCK
      ?auto_71487 - BLOCK
      ?auto_71488 - BLOCK
      ?auto_71489 - BLOCK
    )
    :vars
    (
      ?auto_71490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71489 ?auto_71490 ) ( ON-TABLE ?auto_71483 ) ( ON ?auto_71484 ?auto_71483 ) ( ON ?auto_71485 ?auto_71484 ) ( ON ?auto_71486 ?auto_71485 ) ( ON ?auto_71487 ?auto_71486 ) ( not ( = ?auto_71483 ?auto_71484 ) ) ( not ( = ?auto_71483 ?auto_71485 ) ) ( not ( = ?auto_71483 ?auto_71486 ) ) ( not ( = ?auto_71483 ?auto_71487 ) ) ( not ( = ?auto_71483 ?auto_71488 ) ) ( not ( = ?auto_71483 ?auto_71489 ) ) ( not ( = ?auto_71483 ?auto_71490 ) ) ( not ( = ?auto_71484 ?auto_71485 ) ) ( not ( = ?auto_71484 ?auto_71486 ) ) ( not ( = ?auto_71484 ?auto_71487 ) ) ( not ( = ?auto_71484 ?auto_71488 ) ) ( not ( = ?auto_71484 ?auto_71489 ) ) ( not ( = ?auto_71484 ?auto_71490 ) ) ( not ( = ?auto_71485 ?auto_71486 ) ) ( not ( = ?auto_71485 ?auto_71487 ) ) ( not ( = ?auto_71485 ?auto_71488 ) ) ( not ( = ?auto_71485 ?auto_71489 ) ) ( not ( = ?auto_71485 ?auto_71490 ) ) ( not ( = ?auto_71486 ?auto_71487 ) ) ( not ( = ?auto_71486 ?auto_71488 ) ) ( not ( = ?auto_71486 ?auto_71489 ) ) ( not ( = ?auto_71486 ?auto_71490 ) ) ( not ( = ?auto_71487 ?auto_71488 ) ) ( not ( = ?auto_71487 ?auto_71489 ) ) ( not ( = ?auto_71487 ?auto_71490 ) ) ( not ( = ?auto_71488 ?auto_71489 ) ) ( not ( = ?auto_71488 ?auto_71490 ) ) ( not ( = ?auto_71489 ?auto_71490 ) ) ( CLEAR ?auto_71487 ) ( ON ?auto_71488 ?auto_71489 ) ( CLEAR ?auto_71488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71483 ?auto_71484 ?auto_71485 ?auto_71486 ?auto_71487 ?auto_71488 )
      ( MAKE-7PILE ?auto_71483 ?auto_71484 ?auto_71485 ?auto_71486 ?auto_71487 ?auto_71488 ?auto_71489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71513 - BLOCK
      ?auto_71514 - BLOCK
      ?auto_71515 - BLOCK
      ?auto_71516 - BLOCK
      ?auto_71517 - BLOCK
      ?auto_71518 - BLOCK
      ?auto_71519 - BLOCK
    )
    :vars
    (
      ?auto_71520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71519 ?auto_71520 ) ( ON-TABLE ?auto_71513 ) ( ON ?auto_71514 ?auto_71513 ) ( ON ?auto_71515 ?auto_71514 ) ( ON ?auto_71516 ?auto_71515 ) ( not ( = ?auto_71513 ?auto_71514 ) ) ( not ( = ?auto_71513 ?auto_71515 ) ) ( not ( = ?auto_71513 ?auto_71516 ) ) ( not ( = ?auto_71513 ?auto_71517 ) ) ( not ( = ?auto_71513 ?auto_71518 ) ) ( not ( = ?auto_71513 ?auto_71519 ) ) ( not ( = ?auto_71513 ?auto_71520 ) ) ( not ( = ?auto_71514 ?auto_71515 ) ) ( not ( = ?auto_71514 ?auto_71516 ) ) ( not ( = ?auto_71514 ?auto_71517 ) ) ( not ( = ?auto_71514 ?auto_71518 ) ) ( not ( = ?auto_71514 ?auto_71519 ) ) ( not ( = ?auto_71514 ?auto_71520 ) ) ( not ( = ?auto_71515 ?auto_71516 ) ) ( not ( = ?auto_71515 ?auto_71517 ) ) ( not ( = ?auto_71515 ?auto_71518 ) ) ( not ( = ?auto_71515 ?auto_71519 ) ) ( not ( = ?auto_71515 ?auto_71520 ) ) ( not ( = ?auto_71516 ?auto_71517 ) ) ( not ( = ?auto_71516 ?auto_71518 ) ) ( not ( = ?auto_71516 ?auto_71519 ) ) ( not ( = ?auto_71516 ?auto_71520 ) ) ( not ( = ?auto_71517 ?auto_71518 ) ) ( not ( = ?auto_71517 ?auto_71519 ) ) ( not ( = ?auto_71517 ?auto_71520 ) ) ( not ( = ?auto_71518 ?auto_71519 ) ) ( not ( = ?auto_71518 ?auto_71520 ) ) ( not ( = ?auto_71519 ?auto_71520 ) ) ( ON ?auto_71518 ?auto_71519 ) ( CLEAR ?auto_71516 ) ( ON ?auto_71517 ?auto_71518 ) ( CLEAR ?auto_71517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71513 ?auto_71514 ?auto_71515 ?auto_71516 ?auto_71517 )
      ( MAKE-7PILE ?auto_71513 ?auto_71514 ?auto_71515 ?auto_71516 ?auto_71517 ?auto_71518 ?auto_71519 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71543 - BLOCK
      ?auto_71544 - BLOCK
      ?auto_71545 - BLOCK
      ?auto_71546 - BLOCK
      ?auto_71547 - BLOCK
      ?auto_71548 - BLOCK
      ?auto_71549 - BLOCK
    )
    :vars
    (
      ?auto_71550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71549 ?auto_71550 ) ( ON-TABLE ?auto_71543 ) ( ON ?auto_71544 ?auto_71543 ) ( ON ?auto_71545 ?auto_71544 ) ( not ( = ?auto_71543 ?auto_71544 ) ) ( not ( = ?auto_71543 ?auto_71545 ) ) ( not ( = ?auto_71543 ?auto_71546 ) ) ( not ( = ?auto_71543 ?auto_71547 ) ) ( not ( = ?auto_71543 ?auto_71548 ) ) ( not ( = ?auto_71543 ?auto_71549 ) ) ( not ( = ?auto_71543 ?auto_71550 ) ) ( not ( = ?auto_71544 ?auto_71545 ) ) ( not ( = ?auto_71544 ?auto_71546 ) ) ( not ( = ?auto_71544 ?auto_71547 ) ) ( not ( = ?auto_71544 ?auto_71548 ) ) ( not ( = ?auto_71544 ?auto_71549 ) ) ( not ( = ?auto_71544 ?auto_71550 ) ) ( not ( = ?auto_71545 ?auto_71546 ) ) ( not ( = ?auto_71545 ?auto_71547 ) ) ( not ( = ?auto_71545 ?auto_71548 ) ) ( not ( = ?auto_71545 ?auto_71549 ) ) ( not ( = ?auto_71545 ?auto_71550 ) ) ( not ( = ?auto_71546 ?auto_71547 ) ) ( not ( = ?auto_71546 ?auto_71548 ) ) ( not ( = ?auto_71546 ?auto_71549 ) ) ( not ( = ?auto_71546 ?auto_71550 ) ) ( not ( = ?auto_71547 ?auto_71548 ) ) ( not ( = ?auto_71547 ?auto_71549 ) ) ( not ( = ?auto_71547 ?auto_71550 ) ) ( not ( = ?auto_71548 ?auto_71549 ) ) ( not ( = ?auto_71548 ?auto_71550 ) ) ( not ( = ?auto_71549 ?auto_71550 ) ) ( ON ?auto_71548 ?auto_71549 ) ( ON ?auto_71547 ?auto_71548 ) ( CLEAR ?auto_71545 ) ( ON ?auto_71546 ?auto_71547 ) ( CLEAR ?auto_71546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71543 ?auto_71544 ?auto_71545 ?auto_71546 )
      ( MAKE-7PILE ?auto_71543 ?auto_71544 ?auto_71545 ?auto_71546 ?auto_71547 ?auto_71548 ?auto_71549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71573 - BLOCK
      ?auto_71574 - BLOCK
      ?auto_71575 - BLOCK
      ?auto_71576 - BLOCK
      ?auto_71577 - BLOCK
      ?auto_71578 - BLOCK
      ?auto_71579 - BLOCK
    )
    :vars
    (
      ?auto_71580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71579 ?auto_71580 ) ( ON-TABLE ?auto_71573 ) ( ON ?auto_71574 ?auto_71573 ) ( not ( = ?auto_71573 ?auto_71574 ) ) ( not ( = ?auto_71573 ?auto_71575 ) ) ( not ( = ?auto_71573 ?auto_71576 ) ) ( not ( = ?auto_71573 ?auto_71577 ) ) ( not ( = ?auto_71573 ?auto_71578 ) ) ( not ( = ?auto_71573 ?auto_71579 ) ) ( not ( = ?auto_71573 ?auto_71580 ) ) ( not ( = ?auto_71574 ?auto_71575 ) ) ( not ( = ?auto_71574 ?auto_71576 ) ) ( not ( = ?auto_71574 ?auto_71577 ) ) ( not ( = ?auto_71574 ?auto_71578 ) ) ( not ( = ?auto_71574 ?auto_71579 ) ) ( not ( = ?auto_71574 ?auto_71580 ) ) ( not ( = ?auto_71575 ?auto_71576 ) ) ( not ( = ?auto_71575 ?auto_71577 ) ) ( not ( = ?auto_71575 ?auto_71578 ) ) ( not ( = ?auto_71575 ?auto_71579 ) ) ( not ( = ?auto_71575 ?auto_71580 ) ) ( not ( = ?auto_71576 ?auto_71577 ) ) ( not ( = ?auto_71576 ?auto_71578 ) ) ( not ( = ?auto_71576 ?auto_71579 ) ) ( not ( = ?auto_71576 ?auto_71580 ) ) ( not ( = ?auto_71577 ?auto_71578 ) ) ( not ( = ?auto_71577 ?auto_71579 ) ) ( not ( = ?auto_71577 ?auto_71580 ) ) ( not ( = ?auto_71578 ?auto_71579 ) ) ( not ( = ?auto_71578 ?auto_71580 ) ) ( not ( = ?auto_71579 ?auto_71580 ) ) ( ON ?auto_71578 ?auto_71579 ) ( ON ?auto_71577 ?auto_71578 ) ( ON ?auto_71576 ?auto_71577 ) ( CLEAR ?auto_71574 ) ( ON ?auto_71575 ?auto_71576 ) ( CLEAR ?auto_71575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71573 ?auto_71574 ?auto_71575 )
      ( MAKE-7PILE ?auto_71573 ?auto_71574 ?auto_71575 ?auto_71576 ?auto_71577 ?auto_71578 ?auto_71579 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71603 - BLOCK
      ?auto_71604 - BLOCK
      ?auto_71605 - BLOCK
      ?auto_71606 - BLOCK
      ?auto_71607 - BLOCK
      ?auto_71608 - BLOCK
      ?auto_71609 - BLOCK
    )
    :vars
    (
      ?auto_71610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71609 ?auto_71610 ) ( ON-TABLE ?auto_71603 ) ( not ( = ?auto_71603 ?auto_71604 ) ) ( not ( = ?auto_71603 ?auto_71605 ) ) ( not ( = ?auto_71603 ?auto_71606 ) ) ( not ( = ?auto_71603 ?auto_71607 ) ) ( not ( = ?auto_71603 ?auto_71608 ) ) ( not ( = ?auto_71603 ?auto_71609 ) ) ( not ( = ?auto_71603 ?auto_71610 ) ) ( not ( = ?auto_71604 ?auto_71605 ) ) ( not ( = ?auto_71604 ?auto_71606 ) ) ( not ( = ?auto_71604 ?auto_71607 ) ) ( not ( = ?auto_71604 ?auto_71608 ) ) ( not ( = ?auto_71604 ?auto_71609 ) ) ( not ( = ?auto_71604 ?auto_71610 ) ) ( not ( = ?auto_71605 ?auto_71606 ) ) ( not ( = ?auto_71605 ?auto_71607 ) ) ( not ( = ?auto_71605 ?auto_71608 ) ) ( not ( = ?auto_71605 ?auto_71609 ) ) ( not ( = ?auto_71605 ?auto_71610 ) ) ( not ( = ?auto_71606 ?auto_71607 ) ) ( not ( = ?auto_71606 ?auto_71608 ) ) ( not ( = ?auto_71606 ?auto_71609 ) ) ( not ( = ?auto_71606 ?auto_71610 ) ) ( not ( = ?auto_71607 ?auto_71608 ) ) ( not ( = ?auto_71607 ?auto_71609 ) ) ( not ( = ?auto_71607 ?auto_71610 ) ) ( not ( = ?auto_71608 ?auto_71609 ) ) ( not ( = ?auto_71608 ?auto_71610 ) ) ( not ( = ?auto_71609 ?auto_71610 ) ) ( ON ?auto_71608 ?auto_71609 ) ( ON ?auto_71607 ?auto_71608 ) ( ON ?auto_71606 ?auto_71607 ) ( ON ?auto_71605 ?auto_71606 ) ( CLEAR ?auto_71603 ) ( ON ?auto_71604 ?auto_71605 ) ( CLEAR ?auto_71604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71603 ?auto_71604 )
      ( MAKE-7PILE ?auto_71603 ?auto_71604 ?auto_71605 ?auto_71606 ?auto_71607 ?auto_71608 ?auto_71609 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_71633 - BLOCK
      ?auto_71634 - BLOCK
      ?auto_71635 - BLOCK
      ?auto_71636 - BLOCK
      ?auto_71637 - BLOCK
      ?auto_71638 - BLOCK
      ?auto_71639 - BLOCK
    )
    :vars
    (
      ?auto_71640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71639 ?auto_71640 ) ( not ( = ?auto_71633 ?auto_71634 ) ) ( not ( = ?auto_71633 ?auto_71635 ) ) ( not ( = ?auto_71633 ?auto_71636 ) ) ( not ( = ?auto_71633 ?auto_71637 ) ) ( not ( = ?auto_71633 ?auto_71638 ) ) ( not ( = ?auto_71633 ?auto_71639 ) ) ( not ( = ?auto_71633 ?auto_71640 ) ) ( not ( = ?auto_71634 ?auto_71635 ) ) ( not ( = ?auto_71634 ?auto_71636 ) ) ( not ( = ?auto_71634 ?auto_71637 ) ) ( not ( = ?auto_71634 ?auto_71638 ) ) ( not ( = ?auto_71634 ?auto_71639 ) ) ( not ( = ?auto_71634 ?auto_71640 ) ) ( not ( = ?auto_71635 ?auto_71636 ) ) ( not ( = ?auto_71635 ?auto_71637 ) ) ( not ( = ?auto_71635 ?auto_71638 ) ) ( not ( = ?auto_71635 ?auto_71639 ) ) ( not ( = ?auto_71635 ?auto_71640 ) ) ( not ( = ?auto_71636 ?auto_71637 ) ) ( not ( = ?auto_71636 ?auto_71638 ) ) ( not ( = ?auto_71636 ?auto_71639 ) ) ( not ( = ?auto_71636 ?auto_71640 ) ) ( not ( = ?auto_71637 ?auto_71638 ) ) ( not ( = ?auto_71637 ?auto_71639 ) ) ( not ( = ?auto_71637 ?auto_71640 ) ) ( not ( = ?auto_71638 ?auto_71639 ) ) ( not ( = ?auto_71638 ?auto_71640 ) ) ( not ( = ?auto_71639 ?auto_71640 ) ) ( ON ?auto_71638 ?auto_71639 ) ( ON ?auto_71637 ?auto_71638 ) ( ON ?auto_71636 ?auto_71637 ) ( ON ?auto_71635 ?auto_71636 ) ( ON ?auto_71634 ?auto_71635 ) ( ON ?auto_71633 ?auto_71634 ) ( CLEAR ?auto_71633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71633 )
      ( MAKE-7PILE ?auto_71633 ?auto_71634 ?auto_71635 ?auto_71636 ?auto_71637 ?auto_71638 ?auto_71639 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71664 - BLOCK
      ?auto_71665 - BLOCK
      ?auto_71666 - BLOCK
      ?auto_71667 - BLOCK
      ?auto_71668 - BLOCK
      ?auto_71669 - BLOCK
      ?auto_71670 - BLOCK
      ?auto_71671 - BLOCK
    )
    :vars
    (
      ?auto_71672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71670 ) ( ON ?auto_71671 ?auto_71672 ) ( CLEAR ?auto_71671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71664 ) ( ON ?auto_71665 ?auto_71664 ) ( ON ?auto_71666 ?auto_71665 ) ( ON ?auto_71667 ?auto_71666 ) ( ON ?auto_71668 ?auto_71667 ) ( ON ?auto_71669 ?auto_71668 ) ( ON ?auto_71670 ?auto_71669 ) ( not ( = ?auto_71664 ?auto_71665 ) ) ( not ( = ?auto_71664 ?auto_71666 ) ) ( not ( = ?auto_71664 ?auto_71667 ) ) ( not ( = ?auto_71664 ?auto_71668 ) ) ( not ( = ?auto_71664 ?auto_71669 ) ) ( not ( = ?auto_71664 ?auto_71670 ) ) ( not ( = ?auto_71664 ?auto_71671 ) ) ( not ( = ?auto_71664 ?auto_71672 ) ) ( not ( = ?auto_71665 ?auto_71666 ) ) ( not ( = ?auto_71665 ?auto_71667 ) ) ( not ( = ?auto_71665 ?auto_71668 ) ) ( not ( = ?auto_71665 ?auto_71669 ) ) ( not ( = ?auto_71665 ?auto_71670 ) ) ( not ( = ?auto_71665 ?auto_71671 ) ) ( not ( = ?auto_71665 ?auto_71672 ) ) ( not ( = ?auto_71666 ?auto_71667 ) ) ( not ( = ?auto_71666 ?auto_71668 ) ) ( not ( = ?auto_71666 ?auto_71669 ) ) ( not ( = ?auto_71666 ?auto_71670 ) ) ( not ( = ?auto_71666 ?auto_71671 ) ) ( not ( = ?auto_71666 ?auto_71672 ) ) ( not ( = ?auto_71667 ?auto_71668 ) ) ( not ( = ?auto_71667 ?auto_71669 ) ) ( not ( = ?auto_71667 ?auto_71670 ) ) ( not ( = ?auto_71667 ?auto_71671 ) ) ( not ( = ?auto_71667 ?auto_71672 ) ) ( not ( = ?auto_71668 ?auto_71669 ) ) ( not ( = ?auto_71668 ?auto_71670 ) ) ( not ( = ?auto_71668 ?auto_71671 ) ) ( not ( = ?auto_71668 ?auto_71672 ) ) ( not ( = ?auto_71669 ?auto_71670 ) ) ( not ( = ?auto_71669 ?auto_71671 ) ) ( not ( = ?auto_71669 ?auto_71672 ) ) ( not ( = ?auto_71670 ?auto_71671 ) ) ( not ( = ?auto_71670 ?auto_71672 ) ) ( not ( = ?auto_71671 ?auto_71672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71671 ?auto_71672 )
      ( !STACK ?auto_71671 ?auto_71670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71698 - BLOCK
      ?auto_71699 - BLOCK
      ?auto_71700 - BLOCK
      ?auto_71701 - BLOCK
      ?auto_71702 - BLOCK
      ?auto_71703 - BLOCK
      ?auto_71704 - BLOCK
      ?auto_71705 - BLOCK
    )
    :vars
    (
      ?auto_71706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71705 ?auto_71706 ) ( ON-TABLE ?auto_71698 ) ( ON ?auto_71699 ?auto_71698 ) ( ON ?auto_71700 ?auto_71699 ) ( ON ?auto_71701 ?auto_71700 ) ( ON ?auto_71702 ?auto_71701 ) ( ON ?auto_71703 ?auto_71702 ) ( not ( = ?auto_71698 ?auto_71699 ) ) ( not ( = ?auto_71698 ?auto_71700 ) ) ( not ( = ?auto_71698 ?auto_71701 ) ) ( not ( = ?auto_71698 ?auto_71702 ) ) ( not ( = ?auto_71698 ?auto_71703 ) ) ( not ( = ?auto_71698 ?auto_71704 ) ) ( not ( = ?auto_71698 ?auto_71705 ) ) ( not ( = ?auto_71698 ?auto_71706 ) ) ( not ( = ?auto_71699 ?auto_71700 ) ) ( not ( = ?auto_71699 ?auto_71701 ) ) ( not ( = ?auto_71699 ?auto_71702 ) ) ( not ( = ?auto_71699 ?auto_71703 ) ) ( not ( = ?auto_71699 ?auto_71704 ) ) ( not ( = ?auto_71699 ?auto_71705 ) ) ( not ( = ?auto_71699 ?auto_71706 ) ) ( not ( = ?auto_71700 ?auto_71701 ) ) ( not ( = ?auto_71700 ?auto_71702 ) ) ( not ( = ?auto_71700 ?auto_71703 ) ) ( not ( = ?auto_71700 ?auto_71704 ) ) ( not ( = ?auto_71700 ?auto_71705 ) ) ( not ( = ?auto_71700 ?auto_71706 ) ) ( not ( = ?auto_71701 ?auto_71702 ) ) ( not ( = ?auto_71701 ?auto_71703 ) ) ( not ( = ?auto_71701 ?auto_71704 ) ) ( not ( = ?auto_71701 ?auto_71705 ) ) ( not ( = ?auto_71701 ?auto_71706 ) ) ( not ( = ?auto_71702 ?auto_71703 ) ) ( not ( = ?auto_71702 ?auto_71704 ) ) ( not ( = ?auto_71702 ?auto_71705 ) ) ( not ( = ?auto_71702 ?auto_71706 ) ) ( not ( = ?auto_71703 ?auto_71704 ) ) ( not ( = ?auto_71703 ?auto_71705 ) ) ( not ( = ?auto_71703 ?auto_71706 ) ) ( not ( = ?auto_71704 ?auto_71705 ) ) ( not ( = ?auto_71704 ?auto_71706 ) ) ( not ( = ?auto_71705 ?auto_71706 ) ) ( CLEAR ?auto_71703 ) ( ON ?auto_71704 ?auto_71705 ) ( CLEAR ?auto_71704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71698 ?auto_71699 ?auto_71700 ?auto_71701 ?auto_71702 ?auto_71703 ?auto_71704 )
      ( MAKE-8PILE ?auto_71698 ?auto_71699 ?auto_71700 ?auto_71701 ?auto_71702 ?auto_71703 ?auto_71704 ?auto_71705 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71732 - BLOCK
      ?auto_71733 - BLOCK
      ?auto_71734 - BLOCK
      ?auto_71735 - BLOCK
      ?auto_71736 - BLOCK
      ?auto_71737 - BLOCK
      ?auto_71738 - BLOCK
      ?auto_71739 - BLOCK
    )
    :vars
    (
      ?auto_71740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71739 ?auto_71740 ) ( ON-TABLE ?auto_71732 ) ( ON ?auto_71733 ?auto_71732 ) ( ON ?auto_71734 ?auto_71733 ) ( ON ?auto_71735 ?auto_71734 ) ( ON ?auto_71736 ?auto_71735 ) ( not ( = ?auto_71732 ?auto_71733 ) ) ( not ( = ?auto_71732 ?auto_71734 ) ) ( not ( = ?auto_71732 ?auto_71735 ) ) ( not ( = ?auto_71732 ?auto_71736 ) ) ( not ( = ?auto_71732 ?auto_71737 ) ) ( not ( = ?auto_71732 ?auto_71738 ) ) ( not ( = ?auto_71732 ?auto_71739 ) ) ( not ( = ?auto_71732 ?auto_71740 ) ) ( not ( = ?auto_71733 ?auto_71734 ) ) ( not ( = ?auto_71733 ?auto_71735 ) ) ( not ( = ?auto_71733 ?auto_71736 ) ) ( not ( = ?auto_71733 ?auto_71737 ) ) ( not ( = ?auto_71733 ?auto_71738 ) ) ( not ( = ?auto_71733 ?auto_71739 ) ) ( not ( = ?auto_71733 ?auto_71740 ) ) ( not ( = ?auto_71734 ?auto_71735 ) ) ( not ( = ?auto_71734 ?auto_71736 ) ) ( not ( = ?auto_71734 ?auto_71737 ) ) ( not ( = ?auto_71734 ?auto_71738 ) ) ( not ( = ?auto_71734 ?auto_71739 ) ) ( not ( = ?auto_71734 ?auto_71740 ) ) ( not ( = ?auto_71735 ?auto_71736 ) ) ( not ( = ?auto_71735 ?auto_71737 ) ) ( not ( = ?auto_71735 ?auto_71738 ) ) ( not ( = ?auto_71735 ?auto_71739 ) ) ( not ( = ?auto_71735 ?auto_71740 ) ) ( not ( = ?auto_71736 ?auto_71737 ) ) ( not ( = ?auto_71736 ?auto_71738 ) ) ( not ( = ?auto_71736 ?auto_71739 ) ) ( not ( = ?auto_71736 ?auto_71740 ) ) ( not ( = ?auto_71737 ?auto_71738 ) ) ( not ( = ?auto_71737 ?auto_71739 ) ) ( not ( = ?auto_71737 ?auto_71740 ) ) ( not ( = ?auto_71738 ?auto_71739 ) ) ( not ( = ?auto_71738 ?auto_71740 ) ) ( not ( = ?auto_71739 ?auto_71740 ) ) ( ON ?auto_71738 ?auto_71739 ) ( CLEAR ?auto_71736 ) ( ON ?auto_71737 ?auto_71738 ) ( CLEAR ?auto_71737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71732 ?auto_71733 ?auto_71734 ?auto_71735 ?auto_71736 ?auto_71737 )
      ( MAKE-8PILE ?auto_71732 ?auto_71733 ?auto_71734 ?auto_71735 ?auto_71736 ?auto_71737 ?auto_71738 ?auto_71739 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71766 - BLOCK
      ?auto_71767 - BLOCK
      ?auto_71768 - BLOCK
      ?auto_71769 - BLOCK
      ?auto_71770 - BLOCK
      ?auto_71771 - BLOCK
      ?auto_71772 - BLOCK
      ?auto_71773 - BLOCK
    )
    :vars
    (
      ?auto_71774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71773 ?auto_71774 ) ( ON-TABLE ?auto_71766 ) ( ON ?auto_71767 ?auto_71766 ) ( ON ?auto_71768 ?auto_71767 ) ( ON ?auto_71769 ?auto_71768 ) ( not ( = ?auto_71766 ?auto_71767 ) ) ( not ( = ?auto_71766 ?auto_71768 ) ) ( not ( = ?auto_71766 ?auto_71769 ) ) ( not ( = ?auto_71766 ?auto_71770 ) ) ( not ( = ?auto_71766 ?auto_71771 ) ) ( not ( = ?auto_71766 ?auto_71772 ) ) ( not ( = ?auto_71766 ?auto_71773 ) ) ( not ( = ?auto_71766 ?auto_71774 ) ) ( not ( = ?auto_71767 ?auto_71768 ) ) ( not ( = ?auto_71767 ?auto_71769 ) ) ( not ( = ?auto_71767 ?auto_71770 ) ) ( not ( = ?auto_71767 ?auto_71771 ) ) ( not ( = ?auto_71767 ?auto_71772 ) ) ( not ( = ?auto_71767 ?auto_71773 ) ) ( not ( = ?auto_71767 ?auto_71774 ) ) ( not ( = ?auto_71768 ?auto_71769 ) ) ( not ( = ?auto_71768 ?auto_71770 ) ) ( not ( = ?auto_71768 ?auto_71771 ) ) ( not ( = ?auto_71768 ?auto_71772 ) ) ( not ( = ?auto_71768 ?auto_71773 ) ) ( not ( = ?auto_71768 ?auto_71774 ) ) ( not ( = ?auto_71769 ?auto_71770 ) ) ( not ( = ?auto_71769 ?auto_71771 ) ) ( not ( = ?auto_71769 ?auto_71772 ) ) ( not ( = ?auto_71769 ?auto_71773 ) ) ( not ( = ?auto_71769 ?auto_71774 ) ) ( not ( = ?auto_71770 ?auto_71771 ) ) ( not ( = ?auto_71770 ?auto_71772 ) ) ( not ( = ?auto_71770 ?auto_71773 ) ) ( not ( = ?auto_71770 ?auto_71774 ) ) ( not ( = ?auto_71771 ?auto_71772 ) ) ( not ( = ?auto_71771 ?auto_71773 ) ) ( not ( = ?auto_71771 ?auto_71774 ) ) ( not ( = ?auto_71772 ?auto_71773 ) ) ( not ( = ?auto_71772 ?auto_71774 ) ) ( not ( = ?auto_71773 ?auto_71774 ) ) ( ON ?auto_71772 ?auto_71773 ) ( ON ?auto_71771 ?auto_71772 ) ( CLEAR ?auto_71769 ) ( ON ?auto_71770 ?auto_71771 ) ( CLEAR ?auto_71770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71766 ?auto_71767 ?auto_71768 ?auto_71769 ?auto_71770 )
      ( MAKE-8PILE ?auto_71766 ?auto_71767 ?auto_71768 ?auto_71769 ?auto_71770 ?auto_71771 ?auto_71772 ?auto_71773 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71800 - BLOCK
      ?auto_71801 - BLOCK
      ?auto_71802 - BLOCK
      ?auto_71803 - BLOCK
      ?auto_71804 - BLOCK
      ?auto_71805 - BLOCK
      ?auto_71806 - BLOCK
      ?auto_71807 - BLOCK
    )
    :vars
    (
      ?auto_71808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71807 ?auto_71808 ) ( ON-TABLE ?auto_71800 ) ( ON ?auto_71801 ?auto_71800 ) ( ON ?auto_71802 ?auto_71801 ) ( not ( = ?auto_71800 ?auto_71801 ) ) ( not ( = ?auto_71800 ?auto_71802 ) ) ( not ( = ?auto_71800 ?auto_71803 ) ) ( not ( = ?auto_71800 ?auto_71804 ) ) ( not ( = ?auto_71800 ?auto_71805 ) ) ( not ( = ?auto_71800 ?auto_71806 ) ) ( not ( = ?auto_71800 ?auto_71807 ) ) ( not ( = ?auto_71800 ?auto_71808 ) ) ( not ( = ?auto_71801 ?auto_71802 ) ) ( not ( = ?auto_71801 ?auto_71803 ) ) ( not ( = ?auto_71801 ?auto_71804 ) ) ( not ( = ?auto_71801 ?auto_71805 ) ) ( not ( = ?auto_71801 ?auto_71806 ) ) ( not ( = ?auto_71801 ?auto_71807 ) ) ( not ( = ?auto_71801 ?auto_71808 ) ) ( not ( = ?auto_71802 ?auto_71803 ) ) ( not ( = ?auto_71802 ?auto_71804 ) ) ( not ( = ?auto_71802 ?auto_71805 ) ) ( not ( = ?auto_71802 ?auto_71806 ) ) ( not ( = ?auto_71802 ?auto_71807 ) ) ( not ( = ?auto_71802 ?auto_71808 ) ) ( not ( = ?auto_71803 ?auto_71804 ) ) ( not ( = ?auto_71803 ?auto_71805 ) ) ( not ( = ?auto_71803 ?auto_71806 ) ) ( not ( = ?auto_71803 ?auto_71807 ) ) ( not ( = ?auto_71803 ?auto_71808 ) ) ( not ( = ?auto_71804 ?auto_71805 ) ) ( not ( = ?auto_71804 ?auto_71806 ) ) ( not ( = ?auto_71804 ?auto_71807 ) ) ( not ( = ?auto_71804 ?auto_71808 ) ) ( not ( = ?auto_71805 ?auto_71806 ) ) ( not ( = ?auto_71805 ?auto_71807 ) ) ( not ( = ?auto_71805 ?auto_71808 ) ) ( not ( = ?auto_71806 ?auto_71807 ) ) ( not ( = ?auto_71806 ?auto_71808 ) ) ( not ( = ?auto_71807 ?auto_71808 ) ) ( ON ?auto_71806 ?auto_71807 ) ( ON ?auto_71805 ?auto_71806 ) ( ON ?auto_71804 ?auto_71805 ) ( CLEAR ?auto_71802 ) ( ON ?auto_71803 ?auto_71804 ) ( CLEAR ?auto_71803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71800 ?auto_71801 ?auto_71802 ?auto_71803 )
      ( MAKE-8PILE ?auto_71800 ?auto_71801 ?auto_71802 ?auto_71803 ?auto_71804 ?auto_71805 ?auto_71806 ?auto_71807 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71834 - BLOCK
      ?auto_71835 - BLOCK
      ?auto_71836 - BLOCK
      ?auto_71837 - BLOCK
      ?auto_71838 - BLOCK
      ?auto_71839 - BLOCK
      ?auto_71840 - BLOCK
      ?auto_71841 - BLOCK
    )
    :vars
    (
      ?auto_71842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71841 ?auto_71842 ) ( ON-TABLE ?auto_71834 ) ( ON ?auto_71835 ?auto_71834 ) ( not ( = ?auto_71834 ?auto_71835 ) ) ( not ( = ?auto_71834 ?auto_71836 ) ) ( not ( = ?auto_71834 ?auto_71837 ) ) ( not ( = ?auto_71834 ?auto_71838 ) ) ( not ( = ?auto_71834 ?auto_71839 ) ) ( not ( = ?auto_71834 ?auto_71840 ) ) ( not ( = ?auto_71834 ?auto_71841 ) ) ( not ( = ?auto_71834 ?auto_71842 ) ) ( not ( = ?auto_71835 ?auto_71836 ) ) ( not ( = ?auto_71835 ?auto_71837 ) ) ( not ( = ?auto_71835 ?auto_71838 ) ) ( not ( = ?auto_71835 ?auto_71839 ) ) ( not ( = ?auto_71835 ?auto_71840 ) ) ( not ( = ?auto_71835 ?auto_71841 ) ) ( not ( = ?auto_71835 ?auto_71842 ) ) ( not ( = ?auto_71836 ?auto_71837 ) ) ( not ( = ?auto_71836 ?auto_71838 ) ) ( not ( = ?auto_71836 ?auto_71839 ) ) ( not ( = ?auto_71836 ?auto_71840 ) ) ( not ( = ?auto_71836 ?auto_71841 ) ) ( not ( = ?auto_71836 ?auto_71842 ) ) ( not ( = ?auto_71837 ?auto_71838 ) ) ( not ( = ?auto_71837 ?auto_71839 ) ) ( not ( = ?auto_71837 ?auto_71840 ) ) ( not ( = ?auto_71837 ?auto_71841 ) ) ( not ( = ?auto_71837 ?auto_71842 ) ) ( not ( = ?auto_71838 ?auto_71839 ) ) ( not ( = ?auto_71838 ?auto_71840 ) ) ( not ( = ?auto_71838 ?auto_71841 ) ) ( not ( = ?auto_71838 ?auto_71842 ) ) ( not ( = ?auto_71839 ?auto_71840 ) ) ( not ( = ?auto_71839 ?auto_71841 ) ) ( not ( = ?auto_71839 ?auto_71842 ) ) ( not ( = ?auto_71840 ?auto_71841 ) ) ( not ( = ?auto_71840 ?auto_71842 ) ) ( not ( = ?auto_71841 ?auto_71842 ) ) ( ON ?auto_71840 ?auto_71841 ) ( ON ?auto_71839 ?auto_71840 ) ( ON ?auto_71838 ?auto_71839 ) ( ON ?auto_71837 ?auto_71838 ) ( CLEAR ?auto_71835 ) ( ON ?auto_71836 ?auto_71837 ) ( CLEAR ?auto_71836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71834 ?auto_71835 ?auto_71836 )
      ( MAKE-8PILE ?auto_71834 ?auto_71835 ?auto_71836 ?auto_71837 ?auto_71838 ?auto_71839 ?auto_71840 ?auto_71841 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71868 - BLOCK
      ?auto_71869 - BLOCK
      ?auto_71870 - BLOCK
      ?auto_71871 - BLOCK
      ?auto_71872 - BLOCK
      ?auto_71873 - BLOCK
      ?auto_71874 - BLOCK
      ?auto_71875 - BLOCK
    )
    :vars
    (
      ?auto_71876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71875 ?auto_71876 ) ( ON-TABLE ?auto_71868 ) ( not ( = ?auto_71868 ?auto_71869 ) ) ( not ( = ?auto_71868 ?auto_71870 ) ) ( not ( = ?auto_71868 ?auto_71871 ) ) ( not ( = ?auto_71868 ?auto_71872 ) ) ( not ( = ?auto_71868 ?auto_71873 ) ) ( not ( = ?auto_71868 ?auto_71874 ) ) ( not ( = ?auto_71868 ?auto_71875 ) ) ( not ( = ?auto_71868 ?auto_71876 ) ) ( not ( = ?auto_71869 ?auto_71870 ) ) ( not ( = ?auto_71869 ?auto_71871 ) ) ( not ( = ?auto_71869 ?auto_71872 ) ) ( not ( = ?auto_71869 ?auto_71873 ) ) ( not ( = ?auto_71869 ?auto_71874 ) ) ( not ( = ?auto_71869 ?auto_71875 ) ) ( not ( = ?auto_71869 ?auto_71876 ) ) ( not ( = ?auto_71870 ?auto_71871 ) ) ( not ( = ?auto_71870 ?auto_71872 ) ) ( not ( = ?auto_71870 ?auto_71873 ) ) ( not ( = ?auto_71870 ?auto_71874 ) ) ( not ( = ?auto_71870 ?auto_71875 ) ) ( not ( = ?auto_71870 ?auto_71876 ) ) ( not ( = ?auto_71871 ?auto_71872 ) ) ( not ( = ?auto_71871 ?auto_71873 ) ) ( not ( = ?auto_71871 ?auto_71874 ) ) ( not ( = ?auto_71871 ?auto_71875 ) ) ( not ( = ?auto_71871 ?auto_71876 ) ) ( not ( = ?auto_71872 ?auto_71873 ) ) ( not ( = ?auto_71872 ?auto_71874 ) ) ( not ( = ?auto_71872 ?auto_71875 ) ) ( not ( = ?auto_71872 ?auto_71876 ) ) ( not ( = ?auto_71873 ?auto_71874 ) ) ( not ( = ?auto_71873 ?auto_71875 ) ) ( not ( = ?auto_71873 ?auto_71876 ) ) ( not ( = ?auto_71874 ?auto_71875 ) ) ( not ( = ?auto_71874 ?auto_71876 ) ) ( not ( = ?auto_71875 ?auto_71876 ) ) ( ON ?auto_71874 ?auto_71875 ) ( ON ?auto_71873 ?auto_71874 ) ( ON ?auto_71872 ?auto_71873 ) ( ON ?auto_71871 ?auto_71872 ) ( ON ?auto_71870 ?auto_71871 ) ( CLEAR ?auto_71868 ) ( ON ?auto_71869 ?auto_71870 ) ( CLEAR ?auto_71869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71868 ?auto_71869 )
      ( MAKE-8PILE ?auto_71868 ?auto_71869 ?auto_71870 ?auto_71871 ?auto_71872 ?auto_71873 ?auto_71874 ?auto_71875 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_71902 - BLOCK
      ?auto_71903 - BLOCK
      ?auto_71904 - BLOCK
      ?auto_71905 - BLOCK
      ?auto_71906 - BLOCK
      ?auto_71907 - BLOCK
      ?auto_71908 - BLOCK
      ?auto_71909 - BLOCK
    )
    :vars
    (
      ?auto_71910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71909 ?auto_71910 ) ( not ( = ?auto_71902 ?auto_71903 ) ) ( not ( = ?auto_71902 ?auto_71904 ) ) ( not ( = ?auto_71902 ?auto_71905 ) ) ( not ( = ?auto_71902 ?auto_71906 ) ) ( not ( = ?auto_71902 ?auto_71907 ) ) ( not ( = ?auto_71902 ?auto_71908 ) ) ( not ( = ?auto_71902 ?auto_71909 ) ) ( not ( = ?auto_71902 ?auto_71910 ) ) ( not ( = ?auto_71903 ?auto_71904 ) ) ( not ( = ?auto_71903 ?auto_71905 ) ) ( not ( = ?auto_71903 ?auto_71906 ) ) ( not ( = ?auto_71903 ?auto_71907 ) ) ( not ( = ?auto_71903 ?auto_71908 ) ) ( not ( = ?auto_71903 ?auto_71909 ) ) ( not ( = ?auto_71903 ?auto_71910 ) ) ( not ( = ?auto_71904 ?auto_71905 ) ) ( not ( = ?auto_71904 ?auto_71906 ) ) ( not ( = ?auto_71904 ?auto_71907 ) ) ( not ( = ?auto_71904 ?auto_71908 ) ) ( not ( = ?auto_71904 ?auto_71909 ) ) ( not ( = ?auto_71904 ?auto_71910 ) ) ( not ( = ?auto_71905 ?auto_71906 ) ) ( not ( = ?auto_71905 ?auto_71907 ) ) ( not ( = ?auto_71905 ?auto_71908 ) ) ( not ( = ?auto_71905 ?auto_71909 ) ) ( not ( = ?auto_71905 ?auto_71910 ) ) ( not ( = ?auto_71906 ?auto_71907 ) ) ( not ( = ?auto_71906 ?auto_71908 ) ) ( not ( = ?auto_71906 ?auto_71909 ) ) ( not ( = ?auto_71906 ?auto_71910 ) ) ( not ( = ?auto_71907 ?auto_71908 ) ) ( not ( = ?auto_71907 ?auto_71909 ) ) ( not ( = ?auto_71907 ?auto_71910 ) ) ( not ( = ?auto_71908 ?auto_71909 ) ) ( not ( = ?auto_71908 ?auto_71910 ) ) ( not ( = ?auto_71909 ?auto_71910 ) ) ( ON ?auto_71908 ?auto_71909 ) ( ON ?auto_71907 ?auto_71908 ) ( ON ?auto_71906 ?auto_71907 ) ( ON ?auto_71905 ?auto_71906 ) ( ON ?auto_71904 ?auto_71905 ) ( ON ?auto_71903 ?auto_71904 ) ( ON ?auto_71902 ?auto_71903 ) ( CLEAR ?auto_71902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71902 )
      ( MAKE-8PILE ?auto_71902 ?auto_71903 ?auto_71904 ?auto_71905 ?auto_71906 ?auto_71907 ?auto_71908 ?auto_71909 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71937 - BLOCK
      ?auto_71938 - BLOCK
      ?auto_71939 - BLOCK
      ?auto_71940 - BLOCK
      ?auto_71941 - BLOCK
      ?auto_71942 - BLOCK
      ?auto_71943 - BLOCK
      ?auto_71944 - BLOCK
      ?auto_71945 - BLOCK
    )
    :vars
    (
      ?auto_71946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71944 ) ( ON ?auto_71945 ?auto_71946 ) ( CLEAR ?auto_71945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71937 ) ( ON ?auto_71938 ?auto_71937 ) ( ON ?auto_71939 ?auto_71938 ) ( ON ?auto_71940 ?auto_71939 ) ( ON ?auto_71941 ?auto_71940 ) ( ON ?auto_71942 ?auto_71941 ) ( ON ?auto_71943 ?auto_71942 ) ( ON ?auto_71944 ?auto_71943 ) ( not ( = ?auto_71937 ?auto_71938 ) ) ( not ( = ?auto_71937 ?auto_71939 ) ) ( not ( = ?auto_71937 ?auto_71940 ) ) ( not ( = ?auto_71937 ?auto_71941 ) ) ( not ( = ?auto_71937 ?auto_71942 ) ) ( not ( = ?auto_71937 ?auto_71943 ) ) ( not ( = ?auto_71937 ?auto_71944 ) ) ( not ( = ?auto_71937 ?auto_71945 ) ) ( not ( = ?auto_71937 ?auto_71946 ) ) ( not ( = ?auto_71938 ?auto_71939 ) ) ( not ( = ?auto_71938 ?auto_71940 ) ) ( not ( = ?auto_71938 ?auto_71941 ) ) ( not ( = ?auto_71938 ?auto_71942 ) ) ( not ( = ?auto_71938 ?auto_71943 ) ) ( not ( = ?auto_71938 ?auto_71944 ) ) ( not ( = ?auto_71938 ?auto_71945 ) ) ( not ( = ?auto_71938 ?auto_71946 ) ) ( not ( = ?auto_71939 ?auto_71940 ) ) ( not ( = ?auto_71939 ?auto_71941 ) ) ( not ( = ?auto_71939 ?auto_71942 ) ) ( not ( = ?auto_71939 ?auto_71943 ) ) ( not ( = ?auto_71939 ?auto_71944 ) ) ( not ( = ?auto_71939 ?auto_71945 ) ) ( not ( = ?auto_71939 ?auto_71946 ) ) ( not ( = ?auto_71940 ?auto_71941 ) ) ( not ( = ?auto_71940 ?auto_71942 ) ) ( not ( = ?auto_71940 ?auto_71943 ) ) ( not ( = ?auto_71940 ?auto_71944 ) ) ( not ( = ?auto_71940 ?auto_71945 ) ) ( not ( = ?auto_71940 ?auto_71946 ) ) ( not ( = ?auto_71941 ?auto_71942 ) ) ( not ( = ?auto_71941 ?auto_71943 ) ) ( not ( = ?auto_71941 ?auto_71944 ) ) ( not ( = ?auto_71941 ?auto_71945 ) ) ( not ( = ?auto_71941 ?auto_71946 ) ) ( not ( = ?auto_71942 ?auto_71943 ) ) ( not ( = ?auto_71942 ?auto_71944 ) ) ( not ( = ?auto_71942 ?auto_71945 ) ) ( not ( = ?auto_71942 ?auto_71946 ) ) ( not ( = ?auto_71943 ?auto_71944 ) ) ( not ( = ?auto_71943 ?auto_71945 ) ) ( not ( = ?auto_71943 ?auto_71946 ) ) ( not ( = ?auto_71944 ?auto_71945 ) ) ( not ( = ?auto_71944 ?auto_71946 ) ) ( not ( = ?auto_71945 ?auto_71946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71945 ?auto_71946 )
      ( !STACK ?auto_71945 ?auto_71944 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71956 - BLOCK
      ?auto_71957 - BLOCK
      ?auto_71958 - BLOCK
      ?auto_71959 - BLOCK
      ?auto_71960 - BLOCK
      ?auto_71961 - BLOCK
      ?auto_71962 - BLOCK
      ?auto_71963 - BLOCK
      ?auto_71964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71963 ) ( ON-TABLE ?auto_71964 ) ( CLEAR ?auto_71964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71956 ) ( ON ?auto_71957 ?auto_71956 ) ( ON ?auto_71958 ?auto_71957 ) ( ON ?auto_71959 ?auto_71958 ) ( ON ?auto_71960 ?auto_71959 ) ( ON ?auto_71961 ?auto_71960 ) ( ON ?auto_71962 ?auto_71961 ) ( ON ?auto_71963 ?auto_71962 ) ( not ( = ?auto_71956 ?auto_71957 ) ) ( not ( = ?auto_71956 ?auto_71958 ) ) ( not ( = ?auto_71956 ?auto_71959 ) ) ( not ( = ?auto_71956 ?auto_71960 ) ) ( not ( = ?auto_71956 ?auto_71961 ) ) ( not ( = ?auto_71956 ?auto_71962 ) ) ( not ( = ?auto_71956 ?auto_71963 ) ) ( not ( = ?auto_71956 ?auto_71964 ) ) ( not ( = ?auto_71957 ?auto_71958 ) ) ( not ( = ?auto_71957 ?auto_71959 ) ) ( not ( = ?auto_71957 ?auto_71960 ) ) ( not ( = ?auto_71957 ?auto_71961 ) ) ( not ( = ?auto_71957 ?auto_71962 ) ) ( not ( = ?auto_71957 ?auto_71963 ) ) ( not ( = ?auto_71957 ?auto_71964 ) ) ( not ( = ?auto_71958 ?auto_71959 ) ) ( not ( = ?auto_71958 ?auto_71960 ) ) ( not ( = ?auto_71958 ?auto_71961 ) ) ( not ( = ?auto_71958 ?auto_71962 ) ) ( not ( = ?auto_71958 ?auto_71963 ) ) ( not ( = ?auto_71958 ?auto_71964 ) ) ( not ( = ?auto_71959 ?auto_71960 ) ) ( not ( = ?auto_71959 ?auto_71961 ) ) ( not ( = ?auto_71959 ?auto_71962 ) ) ( not ( = ?auto_71959 ?auto_71963 ) ) ( not ( = ?auto_71959 ?auto_71964 ) ) ( not ( = ?auto_71960 ?auto_71961 ) ) ( not ( = ?auto_71960 ?auto_71962 ) ) ( not ( = ?auto_71960 ?auto_71963 ) ) ( not ( = ?auto_71960 ?auto_71964 ) ) ( not ( = ?auto_71961 ?auto_71962 ) ) ( not ( = ?auto_71961 ?auto_71963 ) ) ( not ( = ?auto_71961 ?auto_71964 ) ) ( not ( = ?auto_71962 ?auto_71963 ) ) ( not ( = ?auto_71962 ?auto_71964 ) ) ( not ( = ?auto_71963 ?auto_71964 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_71964 )
      ( !STACK ?auto_71964 ?auto_71963 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71974 - BLOCK
      ?auto_71975 - BLOCK
      ?auto_71976 - BLOCK
      ?auto_71977 - BLOCK
      ?auto_71978 - BLOCK
      ?auto_71979 - BLOCK
      ?auto_71980 - BLOCK
      ?auto_71981 - BLOCK
      ?auto_71982 - BLOCK
    )
    :vars
    (
      ?auto_71983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71982 ?auto_71983 ) ( ON-TABLE ?auto_71974 ) ( ON ?auto_71975 ?auto_71974 ) ( ON ?auto_71976 ?auto_71975 ) ( ON ?auto_71977 ?auto_71976 ) ( ON ?auto_71978 ?auto_71977 ) ( ON ?auto_71979 ?auto_71978 ) ( ON ?auto_71980 ?auto_71979 ) ( not ( = ?auto_71974 ?auto_71975 ) ) ( not ( = ?auto_71974 ?auto_71976 ) ) ( not ( = ?auto_71974 ?auto_71977 ) ) ( not ( = ?auto_71974 ?auto_71978 ) ) ( not ( = ?auto_71974 ?auto_71979 ) ) ( not ( = ?auto_71974 ?auto_71980 ) ) ( not ( = ?auto_71974 ?auto_71981 ) ) ( not ( = ?auto_71974 ?auto_71982 ) ) ( not ( = ?auto_71974 ?auto_71983 ) ) ( not ( = ?auto_71975 ?auto_71976 ) ) ( not ( = ?auto_71975 ?auto_71977 ) ) ( not ( = ?auto_71975 ?auto_71978 ) ) ( not ( = ?auto_71975 ?auto_71979 ) ) ( not ( = ?auto_71975 ?auto_71980 ) ) ( not ( = ?auto_71975 ?auto_71981 ) ) ( not ( = ?auto_71975 ?auto_71982 ) ) ( not ( = ?auto_71975 ?auto_71983 ) ) ( not ( = ?auto_71976 ?auto_71977 ) ) ( not ( = ?auto_71976 ?auto_71978 ) ) ( not ( = ?auto_71976 ?auto_71979 ) ) ( not ( = ?auto_71976 ?auto_71980 ) ) ( not ( = ?auto_71976 ?auto_71981 ) ) ( not ( = ?auto_71976 ?auto_71982 ) ) ( not ( = ?auto_71976 ?auto_71983 ) ) ( not ( = ?auto_71977 ?auto_71978 ) ) ( not ( = ?auto_71977 ?auto_71979 ) ) ( not ( = ?auto_71977 ?auto_71980 ) ) ( not ( = ?auto_71977 ?auto_71981 ) ) ( not ( = ?auto_71977 ?auto_71982 ) ) ( not ( = ?auto_71977 ?auto_71983 ) ) ( not ( = ?auto_71978 ?auto_71979 ) ) ( not ( = ?auto_71978 ?auto_71980 ) ) ( not ( = ?auto_71978 ?auto_71981 ) ) ( not ( = ?auto_71978 ?auto_71982 ) ) ( not ( = ?auto_71978 ?auto_71983 ) ) ( not ( = ?auto_71979 ?auto_71980 ) ) ( not ( = ?auto_71979 ?auto_71981 ) ) ( not ( = ?auto_71979 ?auto_71982 ) ) ( not ( = ?auto_71979 ?auto_71983 ) ) ( not ( = ?auto_71980 ?auto_71981 ) ) ( not ( = ?auto_71980 ?auto_71982 ) ) ( not ( = ?auto_71980 ?auto_71983 ) ) ( not ( = ?auto_71981 ?auto_71982 ) ) ( not ( = ?auto_71981 ?auto_71983 ) ) ( not ( = ?auto_71982 ?auto_71983 ) ) ( CLEAR ?auto_71980 ) ( ON ?auto_71981 ?auto_71982 ) ( CLEAR ?auto_71981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_71974 ?auto_71975 ?auto_71976 ?auto_71977 ?auto_71978 ?auto_71979 ?auto_71980 ?auto_71981 )
      ( MAKE-9PILE ?auto_71974 ?auto_71975 ?auto_71976 ?auto_71977 ?auto_71978 ?auto_71979 ?auto_71980 ?auto_71981 ?auto_71982 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_71993 - BLOCK
      ?auto_71994 - BLOCK
      ?auto_71995 - BLOCK
      ?auto_71996 - BLOCK
      ?auto_71997 - BLOCK
      ?auto_71998 - BLOCK
      ?auto_71999 - BLOCK
      ?auto_72000 - BLOCK
      ?auto_72001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72001 ) ( ON-TABLE ?auto_71993 ) ( ON ?auto_71994 ?auto_71993 ) ( ON ?auto_71995 ?auto_71994 ) ( ON ?auto_71996 ?auto_71995 ) ( ON ?auto_71997 ?auto_71996 ) ( ON ?auto_71998 ?auto_71997 ) ( ON ?auto_71999 ?auto_71998 ) ( not ( = ?auto_71993 ?auto_71994 ) ) ( not ( = ?auto_71993 ?auto_71995 ) ) ( not ( = ?auto_71993 ?auto_71996 ) ) ( not ( = ?auto_71993 ?auto_71997 ) ) ( not ( = ?auto_71993 ?auto_71998 ) ) ( not ( = ?auto_71993 ?auto_71999 ) ) ( not ( = ?auto_71993 ?auto_72000 ) ) ( not ( = ?auto_71993 ?auto_72001 ) ) ( not ( = ?auto_71994 ?auto_71995 ) ) ( not ( = ?auto_71994 ?auto_71996 ) ) ( not ( = ?auto_71994 ?auto_71997 ) ) ( not ( = ?auto_71994 ?auto_71998 ) ) ( not ( = ?auto_71994 ?auto_71999 ) ) ( not ( = ?auto_71994 ?auto_72000 ) ) ( not ( = ?auto_71994 ?auto_72001 ) ) ( not ( = ?auto_71995 ?auto_71996 ) ) ( not ( = ?auto_71995 ?auto_71997 ) ) ( not ( = ?auto_71995 ?auto_71998 ) ) ( not ( = ?auto_71995 ?auto_71999 ) ) ( not ( = ?auto_71995 ?auto_72000 ) ) ( not ( = ?auto_71995 ?auto_72001 ) ) ( not ( = ?auto_71996 ?auto_71997 ) ) ( not ( = ?auto_71996 ?auto_71998 ) ) ( not ( = ?auto_71996 ?auto_71999 ) ) ( not ( = ?auto_71996 ?auto_72000 ) ) ( not ( = ?auto_71996 ?auto_72001 ) ) ( not ( = ?auto_71997 ?auto_71998 ) ) ( not ( = ?auto_71997 ?auto_71999 ) ) ( not ( = ?auto_71997 ?auto_72000 ) ) ( not ( = ?auto_71997 ?auto_72001 ) ) ( not ( = ?auto_71998 ?auto_71999 ) ) ( not ( = ?auto_71998 ?auto_72000 ) ) ( not ( = ?auto_71998 ?auto_72001 ) ) ( not ( = ?auto_71999 ?auto_72000 ) ) ( not ( = ?auto_71999 ?auto_72001 ) ) ( not ( = ?auto_72000 ?auto_72001 ) ) ( CLEAR ?auto_71999 ) ( ON ?auto_72000 ?auto_72001 ) ( CLEAR ?auto_72000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_71993 ?auto_71994 ?auto_71995 ?auto_71996 ?auto_71997 ?auto_71998 ?auto_71999 ?auto_72000 )
      ( MAKE-9PILE ?auto_71993 ?auto_71994 ?auto_71995 ?auto_71996 ?auto_71997 ?auto_71998 ?auto_71999 ?auto_72000 ?auto_72001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72011 - BLOCK
      ?auto_72012 - BLOCK
      ?auto_72013 - BLOCK
      ?auto_72014 - BLOCK
      ?auto_72015 - BLOCK
      ?auto_72016 - BLOCK
      ?auto_72017 - BLOCK
      ?auto_72018 - BLOCK
      ?auto_72019 - BLOCK
    )
    :vars
    (
      ?auto_72020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72019 ?auto_72020 ) ( ON-TABLE ?auto_72011 ) ( ON ?auto_72012 ?auto_72011 ) ( ON ?auto_72013 ?auto_72012 ) ( ON ?auto_72014 ?auto_72013 ) ( ON ?auto_72015 ?auto_72014 ) ( ON ?auto_72016 ?auto_72015 ) ( not ( = ?auto_72011 ?auto_72012 ) ) ( not ( = ?auto_72011 ?auto_72013 ) ) ( not ( = ?auto_72011 ?auto_72014 ) ) ( not ( = ?auto_72011 ?auto_72015 ) ) ( not ( = ?auto_72011 ?auto_72016 ) ) ( not ( = ?auto_72011 ?auto_72017 ) ) ( not ( = ?auto_72011 ?auto_72018 ) ) ( not ( = ?auto_72011 ?auto_72019 ) ) ( not ( = ?auto_72011 ?auto_72020 ) ) ( not ( = ?auto_72012 ?auto_72013 ) ) ( not ( = ?auto_72012 ?auto_72014 ) ) ( not ( = ?auto_72012 ?auto_72015 ) ) ( not ( = ?auto_72012 ?auto_72016 ) ) ( not ( = ?auto_72012 ?auto_72017 ) ) ( not ( = ?auto_72012 ?auto_72018 ) ) ( not ( = ?auto_72012 ?auto_72019 ) ) ( not ( = ?auto_72012 ?auto_72020 ) ) ( not ( = ?auto_72013 ?auto_72014 ) ) ( not ( = ?auto_72013 ?auto_72015 ) ) ( not ( = ?auto_72013 ?auto_72016 ) ) ( not ( = ?auto_72013 ?auto_72017 ) ) ( not ( = ?auto_72013 ?auto_72018 ) ) ( not ( = ?auto_72013 ?auto_72019 ) ) ( not ( = ?auto_72013 ?auto_72020 ) ) ( not ( = ?auto_72014 ?auto_72015 ) ) ( not ( = ?auto_72014 ?auto_72016 ) ) ( not ( = ?auto_72014 ?auto_72017 ) ) ( not ( = ?auto_72014 ?auto_72018 ) ) ( not ( = ?auto_72014 ?auto_72019 ) ) ( not ( = ?auto_72014 ?auto_72020 ) ) ( not ( = ?auto_72015 ?auto_72016 ) ) ( not ( = ?auto_72015 ?auto_72017 ) ) ( not ( = ?auto_72015 ?auto_72018 ) ) ( not ( = ?auto_72015 ?auto_72019 ) ) ( not ( = ?auto_72015 ?auto_72020 ) ) ( not ( = ?auto_72016 ?auto_72017 ) ) ( not ( = ?auto_72016 ?auto_72018 ) ) ( not ( = ?auto_72016 ?auto_72019 ) ) ( not ( = ?auto_72016 ?auto_72020 ) ) ( not ( = ?auto_72017 ?auto_72018 ) ) ( not ( = ?auto_72017 ?auto_72019 ) ) ( not ( = ?auto_72017 ?auto_72020 ) ) ( not ( = ?auto_72018 ?auto_72019 ) ) ( not ( = ?auto_72018 ?auto_72020 ) ) ( not ( = ?auto_72019 ?auto_72020 ) ) ( ON ?auto_72018 ?auto_72019 ) ( CLEAR ?auto_72016 ) ( ON ?auto_72017 ?auto_72018 ) ( CLEAR ?auto_72017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72011 ?auto_72012 ?auto_72013 ?auto_72014 ?auto_72015 ?auto_72016 ?auto_72017 )
      ( MAKE-9PILE ?auto_72011 ?auto_72012 ?auto_72013 ?auto_72014 ?auto_72015 ?auto_72016 ?auto_72017 ?auto_72018 ?auto_72019 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72030 - BLOCK
      ?auto_72031 - BLOCK
      ?auto_72032 - BLOCK
      ?auto_72033 - BLOCK
      ?auto_72034 - BLOCK
      ?auto_72035 - BLOCK
      ?auto_72036 - BLOCK
      ?auto_72037 - BLOCK
      ?auto_72038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72038 ) ( ON-TABLE ?auto_72030 ) ( ON ?auto_72031 ?auto_72030 ) ( ON ?auto_72032 ?auto_72031 ) ( ON ?auto_72033 ?auto_72032 ) ( ON ?auto_72034 ?auto_72033 ) ( ON ?auto_72035 ?auto_72034 ) ( not ( = ?auto_72030 ?auto_72031 ) ) ( not ( = ?auto_72030 ?auto_72032 ) ) ( not ( = ?auto_72030 ?auto_72033 ) ) ( not ( = ?auto_72030 ?auto_72034 ) ) ( not ( = ?auto_72030 ?auto_72035 ) ) ( not ( = ?auto_72030 ?auto_72036 ) ) ( not ( = ?auto_72030 ?auto_72037 ) ) ( not ( = ?auto_72030 ?auto_72038 ) ) ( not ( = ?auto_72031 ?auto_72032 ) ) ( not ( = ?auto_72031 ?auto_72033 ) ) ( not ( = ?auto_72031 ?auto_72034 ) ) ( not ( = ?auto_72031 ?auto_72035 ) ) ( not ( = ?auto_72031 ?auto_72036 ) ) ( not ( = ?auto_72031 ?auto_72037 ) ) ( not ( = ?auto_72031 ?auto_72038 ) ) ( not ( = ?auto_72032 ?auto_72033 ) ) ( not ( = ?auto_72032 ?auto_72034 ) ) ( not ( = ?auto_72032 ?auto_72035 ) ) ( not ( = ?auto_72032 ?auto_72036 ) ) ( not ( = ?auto_72032 ?auto_72037 ) ) ( not ( = ?auto_72032 ?auto_72038 ) ) ( not ( = ?auto_72033 ?auto_72034 ) ) ( not ( = ?auto_72033 ?auto_72035 ) ) ( not ( = ?auto_72033 ?auto_72036 ) ) ( not ( = ?auto_72033 ?auto_72037 ) ) ( not ( = ?auto_72033 ?auto_72038 ) ) ( not ( = ?auto_72034 ?auto_72035 ) ) ( not ( = ?auto_72034 ?auto_72036 ) ) ( not ( = ?auto_72034 ?auto_72037 ) ) ( not ( = ?auto_72034 ?auto_72038 ) ) ( not ( = ?auto_72035 ?auto_72036 ) ) ( not ( = ?auto_72035 ?auto_72037 ) ) ( not ( = ?auto_72035 ?auto_72038 ) ) ( not ( = ?auto_72036 ?auto_72037 ) ) ( not ( = ?auto_72036 ?auto_72038 ) ) ( not ( = ?auto_72037 ?auto_72038 ) ) ( ON ?auto_72037 ?auto_72038 ) ( CLEAR ?auto_72035 ) ( ON ?auto_72036 ?auto_72037 ) ( CLEAR ?auto_72036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72030 ?auto_72031 ?auto_72032 ?auto_72033 ?auto_72034 ?auto_72035 ?auto_72036 )
      ( MAKE-9PILE ?auto_72030 ?auto_72031 ?auto_72032 ?auto_72033 ?auto_72034 ?auto_72035 ?auto_72036 ?auto_72037 ?auto_72038 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72048 - BLOCK
      ?auto_72049 - BLOCK
      ?auto_72050 - BLOCK
      ?auto_72051 - BLOCK
      ?auto_72052 - BLOCK
      ?auto_72053 - BLOCK
      ?auto_72054 - BLOCK
      ?auto_72055 - BLOCK
      ?auto_72056 - BLOCK
    )
    :vars
    (
      ?auto_72057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72056 ?auto_72057 ) ( ON-TABLE ?auto_72048 ) ( ON ?auto_72049 ?auto_72048 ) ( ON ?auto_72050 ?auto_72049 ) ( ON ?auto_72051 ?auto_72050 ) ( ON ?auto_72052 ?auto_72051 ) ( not ( = ?auto_72048 ?auto_72049 ) ) ( not ( = ?auto_72048 ?auto_72050 ) ) ( not ( = ?auto_72048 ?auto_72051 ) ) ( not ( = ?auto_72048 ?auto_72052 ) ) ( not ( = ?auto_72048 ?auto_72053 ) ) ( not ( = ?auto_72048 ?auto_72054 ) ) ( not ( = ?auto_72048 ?auto_72055 ) ) ( not ( = ?auto_72048 ?auto_72056 ) ) ( not ( = ?auto_72048 ?auto_72057 ) ) ( not ( = ?auto_72049 ?auto_72050 ) ) ( not ( = ?auto_72049 ?auto_72051 ) ) ( not ( = ?auto_72049 ?auto_72052 ) ) ( not ( = ?auto_72049 ?auto_72053 ) ) ( not ( = ?auto_72049 ?auto_72054 ) ) ( not ( = ?auto_72049 ?auto_72055 ) ) ( not ( = ?auto_72049 ?auto_72056 ) ) ( not ( = ?auto_72049 ?auto_72057 ) ) ( not ( = ?auto_72050 ?auto_72051 ) ) ( not ( = ?auto_72050 ?auto_72052 ) ) ( not ( = ?auto_72050 ?auto_72053 ) ) ( not ( = ?auto_72050 ?auto_72054 ) ) ( not ( = ?auto_72050 ?auto_72055 ) ) ( not ( = ?auto_72050 ?auto_72056 ) ) ( not ( = ?auto_72050 ?auto_72057 ) ) ( not ( = ?auto_72051 ?auto_72052 ) ) ( not ( = ?auto_72051 ?auto_72053 ) ) ( not ( = ?auto_72051 ?auto_72054 ) ) ( not ( = ?auto_72051 ?auto_72055 ) ) ( not ( = ?auto_72051 ?auto_72056 ) ) ( not ( = ?auto_72051 ?auto_72057 ) ) ( not ( = ?auto_72052 ?auto_72053 ) ) ( not ( = ?auto_72052 ?auto_72054 ) ) ( not ( = ?auto_72052 ?auto_72055 ) ) ( not ( = ?auto_72052 ?auto_72056 ) ) ( not ( = ?auto_72052 ?auto_72057 ) ) ( not ( = ?auto_72053 ?auto_72054 ) ) ( not ( = ?auto_72053 ?auto_72055 ) ) ( not ( = ?auto_72053 ?auto_72056 ) ) ( not ( = ?auto_72053 ?auto_72057 ) ) ( not ( = ?auto_72054 ?auto_72055 ) ) ( not ( = ?auto_72054 ?auto_72056 ) ) ( not ( = ?auto_72054 ?auto_72057 ) ) ( not ( = ?auto_72055 ?auto_72056 ) ) ( not ( = ?auto_72055 ?auto_72057 ) ) ( not ( = ?auto_72056 ?auto_72057 ) ) ( ON ?auto_72055 ?auto_72056 ) ( ON ?auto_72054 ?auto_72055 ) ( CLEAR ?auto_72052 ) ( ON ?auto_72053 ?auto_72054 ) ( CLEAR ?auto_72053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72048 ?auto_72049 ?auto_72050 ?auto_72051 ?auto_72052 ?auto_72053 )
      ( MAKE-9PILE ?auto_72048 ?auto_72049 ?auto_72050 ?auto_72051 ?auto_72052 ?auto_72053 ?auto_72054 ?auto_72055 ?auto_72056 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72067 - BLOCK
      ?auto_72068 - BLOCK
      ?auto_72069 - BLOCK
      ?auto_72070 - BLOCK
      ?auto_72071 - BLOCK
      ?auto_72072 - BLOCK
      ?auto_72073 - BLOCK
      ?auto_72074 - BLOCK
      ?auto_72075 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72075 ) ( ON-TABLE ?auto_72067 ) ( ON ?auto_72068 ?auto_72067 ) ( ON ?auto_72069 ?auto_72068 ) ( ON ?auto_72070 ?auto_72069 ) ( ON ?auto_72071 ?auto_72070 ) ( not ( = ?auto_72067 ?auto_72068 ) ) ( not ( = ?auto_72067 ?auto_72069 ) ) ( not ( = ?auto_72067 ?auto_72070 ) ) ( not ( = ?auto_72067 ?auto_72071 ) ) ( not ( = ?auto_72067 ?auto_72072 ) ) ( not ( = ?auto_72067 ?auto_72073 ) ) ( not ( = ?auto_72067 ?auto_72074 ) ) ( not ( = ?auto_72067 ?auto_72075 ) ) ( not ( = ?auto_72068 ?auto_72069 ) ) ( not ( = ?auto_72068 ?auto_72070 ) ) ( not ( = ?auto_72068 ?auto_72071 ) ) ( not ( = ?auto_72068 ?auto_72072 ) ) ( not ( = ?auto_72068 ?auto_72073 ) ) ( not ( = ?auto_72068 ?auto_72074 ) ) ( not ( = ?auto_72068 ?auto_72075 ) ) ( not ( = ?auto_72069 ?auto_72070 ) ) ( not ( = ?auto_72069 ?auto_72071 ) ) ( not ( = ?auto_72069 ?auto_72072 ) ) ( not ( = ?auto_72069 ?auto_72073 ) ) ( not ( = ?auto_72069 ?auto_72074 ) ) ( not ( = ?auto_72069 ?auto_72075 ) ) ( not ( = ?auto_72070 ?auto_72071 ) ) ( not ( = ?auto_72070 ?auto_72072 ) ) ( not ( = ?auto_72070 ?auto_72073 ) ) ( not ( = ?auto_72070 ?auto_72074 ) ) ( not ( = ?auto_72070 ?auto_72075 ) ) ( not ( = ?auto_72071 ?auto_72072 ) ) ( not ( = ?auto_72071 ?auto_72073 ) ) ( not ( = ?auto_72071 ?auto_72074 ) ) ( not ( = ?auto_72071 ?auto_72075 ) ) ( not ( = ?auto_72072 ?auto_72073 ) ) ( not ( = ?auto_72072 ?auto_72074 ) ) ( not ( = ?auto_72072 ?auto_72075 ) ) ( not ( = ?auto_72073 ?auto_72074 ) ) ( not ( = ?auto_72073 ?auto_72075 ) ) ( not ( = ?auto_72074 ?auto_72075 ) ) ( ON ?auto_72074 ?auto_72075 ) ( ON ?auto_72073 ?auto_72074 ) ( CLEAR ?auto_72071 ) ( ON ?auto_72072 ?auto_72073 ) ( CLEAR ?auto_72072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72067 ?auto_72068 ?auto_72069 ?auto_72070 ?auto_72071 ?auto_72072 )
      ( MAKE-9PILE ?auto_72067 ?auto_72068 ?auto_72069 ?auto_72070 ?auto_72071 ?auto_72072 ?auto_72073 ?auto_72074 ?auto_72075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72085 - BLOCK
      ?auto_72086 - BLOCK
      ?auto_72087 - BLOCK
      ?auto_72088 - BLOCK
      ?auto_72089 - BLOCK
      ?auto_72090 - BLOCK
      ?auto_72091 - BLOCK
      ?auto_72092 - BLOCK
      ?auto_72093 - BLOCK
    )
    :vars
    (
      ?auto_72094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72093 ?auto_72094 ) ( ON-TABLE ?auto_72085 ) ( ON ?auto_72086 ?auto_72085 ) ( ON ?auto_72087 ?auto_72086 ) ( ON ?auto_72088 ?auto_72087 ) ( not ( = ?auto_72085 ?auto_72086 ) ) ( not ( = ?auto_72085 ?auto_72087 ) ) ( not ( = ?auto_72085 ?auto_72088 ) ) ( not ( = ?auto_72085 ?auto_72089 ) ) ( not ( = ?auto_72085 ?auto_72090 ) ) ( not ( = ?auto_72085 ?auto_72091 ) ) ( not ( = ?auto_72085 ?auto_72092 ) ) ( not ( = ?auto_72085 ?auto_72093 ) ) ( not ( = ?auto_72085 ?auto_72094 ) ) ( not ( = ?auto_72086 ?auto_72087 ) ) ( not ( = ?auto_72086 ?auto_72088 ) ) ( not ( = ?auto_72086 ?auto_72089 ) ) ( not ( = ?auto_72086 ?auto_72090 ) ) ( not ( = ?auto_72086 ?auto_72091 ) ) ( not ( = ?auto_72086 ?auto_72092 ) ) ( not ( = ?auto_72086 ?auto_72093 ) ) ( not ( = ?auto_72086 ?auto_72094 ) ) ( not ( = ?auto_72087 ?auto_72088 ) ) ( not ( = ?auto_72087 ?auto_72089 ) ) ( not ( = ?auto_72087 ?auto_72090 ) ) ( not ( = ?auto_72087 ?auto_72091 ) ) ( not ( = ?auto_72087 ?auto_72092 ) ) ( not ( = ?auto_72087 ?auto_72093 ) ) ( not ( = ?auto_72087 ?auto_72094 ) ) ( not ( = ?auto_72088 ?auto_72089 ) ) ( not ( = ?auto_72088 ?auto_72090 ) ) ( not ( = ?auto_72088 ?auto_72091 ) ) ( not ( = ?auto_72088 ?auto_72092 ) ) ( not ( = ?auto_72088 ?auto_72093 ) ) ( not ( = ?auto_72088 ?auto_72094 ) ) ( not ( = ?auto_72089 ?auto_72090 ) ) ( not ( = ?auto_72089 ?auto_72091 ) ) ( not ( = ?auto_72089 ?auto_72092 ) ) ( not ( = ?auto_72089 ?auto_72093 ) ) ( not ( = ?auto_72089 ?auto_72094 ) ) ( not ( = ?auto_72090 ?auto_72091 ) ) ( not ( = ?auto_72090 ?auto_72092 ) ) ( not ( = ?auto_72090 ?auto_72093 ) ) ( not ( = ?auto_72090 ?auto_72094 ) ) ( not ( = ?auto_72091 ?auto_72092 ) ) ( not ( = ?auto_72091 ?auto_72093 ) ) ( not ( = ?auto_72091 ?auto_72094 ) ) ( not ( = ?auto_72092 ?auto_72093 ) ) ( not ( = ?auto_72092 ?auto_72094 ) ) ( not ( = ?auto_72093 ?auto_72094 ) ) ( ON ?auto_72092 ?auto_72093 ) ( ON ?auto_72091 ?auto_72092 ) ( ON ?auto_72090 ?auto_72091 ) ( CLEAR ?auto_72088 ) ( ON ?auto_72089 ?auto_72090 ) ( CLEAR ?auto_72089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72085 ?auto_72086 ?auto_72087 ?auto_72088 ?auto_72089 )
      ( MAKE-9PILE ?auto_72085 ?auto_72086 ?auto_72087 ?auto_72088 ?auto_72089 ?auto_72090 ?auto_72091 ?auto_72092 ?auto_72093 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72104 - BLOCK
      ?auto_72105 - BLOCK
      ?auto_72106 - BLOCK
      ?auto_72107 - BLOCK
      ?auto_72108 - BLOCK
      ?auto_72109 - BLOCK
      ?auto_72110 - BLOCK
      ?auto_72111 - BLOCK
      ?auto_72112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72112 ) ( ON-TABLE ?auto_72104 ) ( ON ?auto_72105 ?auto_72104 ) ( ON ?auto_72106 ?auto_72105 ) ( ON ?auto_72107 ?auto_72106 ) ( not ( = ?auto_72104 ?auto_72105 ) ) ( not ( = ?auto_72104 ?auto_72106 ) ) ( not ( = ?auto_72104 ?auto_72107 ) ) ( not ( = ?auto_72104 ?auto_72108 ) ) ( not ( = ?auto_72104 ?auto_72109 ) ) ( not ( = ?auto_72104 ?auto_72110 ) ) ( not ( = ?auto_72104 ?auto_72111 ) ) ( not ( = ?auto_72104 ?auto_72112 ) ) ( not ( = ?auto_72105 ?auto_72106 ) ) ( not ( = ?auto_72105 ?auto_72107 ) ) ( not ( = ?auto_72105 ?auto_72108 ) ) ( not ( = ?auto_72105 ?auto_72109 ) ) ( not ( = ?auto_72105 ?auto_72110 ) ) ( not ( = ?auto_72105 ?auto_72111 ) ) ( not ( = ?auto_72105 ?auto_72112 ) ) ( not ( = ?auto_72106 ?auto_72107 ) ) ( not ( = ?auto_72106 ?auto_72108 ) ) ( not ( = ?auto_72106 ?auto_72109 ) ) ( not ( = ?auto_72106 ?auto_72110 ) ) ( not ( = ?auto_72106 ?auto_72111 ) ) ( not ( = ?auto_72106 ?auto_72112 ) ) ( not ( = ?auto_72107 ?auto_72108 ) ) ( not ( = ?auto_72107 ?auto_72109 ) ) ( not ( = ?auto_72107 ?auto_72110 ) ) ( not ( = ?auto_72107 ?auto_72111 ) ) ( not ( = ?auto_72107 ?auto_72112 ) ) ( not ( = ?auto_72108 ?auto_72109 ) ) ( not ( = ?auto_72108 ?auto_72110 ) ) ( not ( = ?auto_72108 ?auto_72111 ) ) ( not ( = ?auto_72108 ?auto_72112 ) ) ( not ( = ?auto_72109 ?auto_72110 ) ) ( not ( = ?auto_72109 ?auto_72111 ) ) ( not ( = ?auto_72109 ?auto_72112 ) ) ( not ( = ?auto_72110 ?auto_72111 ) ) ( not ( = ?auto_72110 ?auto_72112 ) ) ( not ( = ?auto_72111 ?auto_72112 ) ) ( ON ?auto_72111 ?auto_72112 ) ( ON ?auto_72110 ?auto_72111 ) ( ON ?auto_72109 ?auto_72110 ) ( CLEAR ?auto_72107 ) ( ON ?auto_72108 ?auto_72109 ) ( CLEAR ?auto_72108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72104 ?auto_72105 ?auto_72106 ?auto_72107 ?auto_72108 )
      ( MAKE-9PILE ?auto_72104 ?auto_72105 ?auto_72106 ?auto_72107 ?auto_72108 ?auto_72109 ?auto_72110 ?auto_72111 ?auto_72112 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72122 - BLOCK
      ?auto_72123 - BLOCK
      ?auto_72124 - BLOCK
      ?auto_72125 - BLOCK
      ?auto_72126 - BLOCK
      ?auto_72127 - BLOCK
      ?auto_72128 - BLOCK
      ?auto_72129 - BLOCK
      ?auto_72130 - BLOCK
    )
    :vars
    (
      ?auto_72131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72130 ?auto_72131 ) ( ON-TABLE ?auto_72122 ) ( ON ?auto_72123 ?auto_72122 ) ( ON ?auto_72124 ?auto_72123 ) ( not ( = ?auto_72122 ?auto_72123 ) ) ( not ( = ?auto_72122 ?auto_72124 ) ) ( not ( = ?auto_72122 ?auto_72125 ) ) ( not ( = ?auto_72122 ?auto_72126 ) ) ( not ( = ?auto_72122 ?auto_72127 ) ) ( not ( = ?auto_72122 ?auto_72128 ) ) ( not ( = ?auto_72122 ?auto_72129 ) ) ( not ( = ?auto_72122 ?auto_72130 ) ) ( not ( = ?auto_72122 ?auto_72131 ) ) ( not ( = ?auto_72123 ?auto_72124 ) ) ( not ( = ?auto_72123 ?auto_72125 ) ) ( not ( = ?auto_72123 ?auto_72126 ) ) ( not ( = ?auto_72123 ?auto_72127 ) ) ( not ( = ?auto_72123 ?auto_72128 ) ) ( not ( = ?auto_72123 ?auto_72129 ) ) ( not ( = ?auto_72123 ?auto_72130 ) ) ( not ( = ?auto_72123 ?auto_72131 ) ) ( not ( = ?auto_72124 ?auto_72125 ) ) ( not ( = ?auto_72124 ?auto_72126 ) ) ( not ( = ?auto_72124 ?auto_72127 ) ) ( not ( = ?auto_72124 ?auto_72128 ) ) ( not ( = ?auto_72124 ?auto_72129 ) ) ( not ( = ?auto_72124 ?auto_72130 ) ) ( not ( = ?auto_72124 ?auto_72131 ) ) ( not ( = ?auto_72125 ?auto_72126 ) ) ( not ( = ?auto_72125 ?auto_72127 ) ) ( not ( = ?auto_72125 ?auto_72128 ) ) ( not ( = ?auto_72125 ?auto_72129 ) ) ( not ( = ?auto_72125 ?auto_72130 ) ) ( not ( = ?auto_72125 ?auto_72131 ) ) ( not ( = ?auto_72126 ?auto_72127 ) ) ( not ( = ?auto_72126 ?auto_72128 ) ) ( not ( = ?auto_72126 ?auto_72129 ) ) ( not ( = ?auto_72126 ?auto_72130 ) ) ( not ( = ?auto_72126 ?auto_72131 ) ) ( not ( = ?auto_72127 ?auto_72128 ) ) ( not ( = ?auto_72127 ?auto_72129 ) ) ( not ( = ?auto_72127 ?auto_72130 ) ) ( not ( = ?auto_72127 ?auto_72131 ) ) ( not ( = ?auto_72128 ?auto_72129 ) ) ( not ( = ?auto_72128 ?auto_72130 ) ) ( not ( = ?auto_72128 ?auto_72131 ) ) ( not ( = ?auto_72129 ?auto_72130 ) ) ( not ( = ?auto_72129 ?auto_72131 ) ) ( not ( = ?auto_72130 ?auto_72131 ) ) ( ON ?auto_72129 ?auto_72130 ) ( ON ?auto_72128 ?auto_72129 ) ( ON ?auto_72127 ?auto_72128 ) ( ON ?auto_72126 ?auto_72127 ) ( CLEAR ?auto_72124 ) ( ON ?auto_72125 ?auto_72126 ) ( CLEAR ?auto_72125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72122 ?auto_72123 ?auto_72124 ?auto_72125 )
      ( MAKE-9PILE ?auto_72122 ?auto_72123 ?auto_72124 ?auto_72125 ?auto_72126 ?auto_72127 ?auto_72128 ?auto_72129 ?auto_72130 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72141 - BLOCK
      ?auto_72142 - BLOCK
      ?auto_72143 - BLOCK
      ?auto_72144 - BLOCK
      ?auto_72145 - BLOCK
      ?auto_72146 - BLOCK
      ?auto_72147 - BLOCK
      ?auto_72148 - BLOCK
      ?auto_72149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72149 ) ( ON-TABLE ?auto_72141 ) ( ON ?auto_72142 ?auto_72141 ) ( ON ?auto_72143 ?auto_72142 ) ( not ( = ?auto_72141 ?auto_72142 ) ) ( not ( = ?auto_72141 ?auto_72143 ) ) ( not ( = ?auto_72141 ?auto_72144 ) ) ( not ( = ?auto_72141 ?auto_72145 ) ) ( not ( = ?auto_72141 ?auto_72146 ) ) ( not ( = ?auto_72141 ?auto_72147 ) ) ( not ( = ?auto_72141 ?auto_72148 ) ) ( not ( = ?auto_72141 ?auto_72149 ) ) ( not ( = ?auto_72142 ?auto_72143 ) ) ( not ( = ?auto_72142 ?auto_72144 ) ) ( not ( = ?auto_72142 ?auto_72145 ) ) ( not ( = ?auto_72142 ?auto_72146 ) ) ( not ( = ?auto_72142 ?auto_72147 ) ) ( not ( = ?auto_72142 ?auto_72148 ) ) ( not ( = ?auto_72142 ?auto_72149 ) ) ( not ( = ?auto_72143 ?auto_72144 ) ) ( not ( = ?auto_72143 ?auto_72145 ) ) ( not ( = ?auto_72143 ?auto_72146 ) ) ( not ( = ?auto_72143 ?auto_72147 ) ) ( not ( = ?auto_72143 ?auto_72148 ) ) ( not ( = ?auto_72143 ?auto_72149 ) ) ( not ( = ?auto_72144 ?auto_72145 ) ) ( not ( = ?auto_72144 ?auto_72146 ) ) ( not ( = ?auto_72144 ?auto_72147 ) ) ( not ( = ?auto_72144 ?auto_72148 ) ) ( not ( = ?auto_72144 ?auto_72149 ) ) ( not ( = ?auto_72145 ?auto_72146 ) ) ( not ( = ?auto_72145 ?auto_72147 ) ) ( not ( = ?auto_72145 ?auto_72148 ) ) ( not ( = ?auto_72145 ?auto_72149 ) ) ( not ( = ?auto_72146 ?auto_72147 ) ) ( not ( = ?auto_72146 ?auto_72148 ) ) ( not ( = ?auto_72146 ?auto_72149 ) ) ( not ( = ?auto_72147 ?auto_72148 ) ) ( not ( = ?auto_72147 ?auto_72149 ) ) ( not ( = ?auto_72148 ?auto_72149 ) ) ( ON ?auto_72148 ?auto_72149 ) ( ON ?auto_72147 ?auto_72148 ) ( ON ?auto_72146 ?auto_72147 ) ( ON ?auto_72145 ?auto_72146 ) ( CLEAR ?auto_72143 ) ( ON ?auto_72144 ?auto_72145 ) ( CLEAR ?auto_72144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72141 ?auto_72142 ?auto_72143 ?auto_72144 )
      ( MAKE-9PILE ?auto_72141 ?auto_72142 ?auto_72143 ?auto_72144 ?auto_72145 ?auto_72146 ?auto_72147 ?auto_72148 ?auto_72149 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72159 - BLOCK
      ?auto_72160 - BLOCK
      ?auto_72161 - BLOCK
      ?auto_72162 - BLOCK
      ?auto_72163 - BLOCK
      ?auto_72164 - BLOCK
      ?auto_72165 - BLOCK
      ?auto_72166 - BLOCK
      ?auto_72167 - BLOCK
    )
    :vars
    (
      ?auto_72168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72167 ?auto_72168 ) ( ON-TABLE ?auto_72159 ) ( ON ?auto_72160 ?auto_72159 ) ( not ( = ?auto_72159 ?auto_72160 ) ) ( not ( = ?auto_72159 ?auto_72161 ) ) ( not ( = ?auto_72159 ?auto_72162 ) ) ( not ( = ?auto_72159 ?auto_72163 ) ) ( not ( = ?auto_72159 ?auto_72164 ) ) ( not ( = ?auto_72159 ?auto_72165 ) ) ( not ( = ?auto_72159 ?auto_72166 ) ) ( not ( = ?auto_72159 ?auto_72167 ) ) ( not ( = ?auto_72159 ?auto_72168 ) ) ( not ( = ?auto_72160 ?auto_72161 ) ) ( not ( = ?auto_72160 ?auto_72162 ) ) ( not ( = ?auto_72160 ?auto_72163 ) ) ( not ( = ?auto_72160 ?auto_72164 ) ) ( not ( = ?auto_72160 ?auto_72165 ) ) ( not ( = ?auto_72160 ?auto_72166 ) ) ( not ( = ?auto_72160 ?auto_72167 ) ) ( not ( = ?auto_72160 ?auto_72168 ) ) ( not ( = ?auto_72161 ?auto_72162 ) ) ( not ( = ?auto_72161 ?auto_72163 ) ) ( not ( = ?auto_72161 ?auto_72164 ) ) ( not ( = ?auto_72161 ?auto_72165 ) ) ( not ( = ?auto_72161 ?auto_72166 ) ) ( not ( = ?auto_72161 ?auto_72167 ) ) ( not ( = ?auto_72161 ?auto_72168 ) ) ( not ( = ?auto_72162 ?auto_72163 ) ) ( not ( = ?auto_72162 ?auto_72164 ) ) ( not ( = ?auto_72162 ?auto_72165 ) ) ( not ( = ?auto_72162 ?auto_72166 ) ) ( not ( = ?auto_72162 ?auto_72167 ) ) ( not ( = ?auto_72162 ?auto_72168 ) ) ( not ( = ?auto_72163 ?auto_72164 ) ) ( not ( = ?auto_72163 ?auto_72165 ) ) ( not ( = ?auto_72163 ?auto_72166 ) ) ( not ( = ?auto_72163 ?auto_72167 ) ) ( not ( = ?auto_72163 ?auto_72168 ) ) ( not ( = ?auto_72164 ?auto_72165 ) ) ( not ( = ?auto_72164 ?auto_72166 ) ) ( not ( = ?auto_72164 ?auto_72167 ) ) ( not ( = ?auto_72164 ?auto_72168 ) ) ( not ( = ?auto_72165 ?auto_72166 ) ) ( not ( = ?auto_72165 ?auto_72167 ) ) ( not ( = ?auto_72165 ?auto_72168 ) ) ( not ( = ?auto_72166 ?auto_72167 ) ) ( not ( = ?auto_72166 ?auto_72168 ) ) ( not ( = ?auto_72167 ?auto_72168 ) ) ( ON ?auto_72166 ?auto_72167 ) ( ON ?auto_72165 ?auto_72166 ) ( ON ?auto_72164 ?auto_72165 ) ( ON ?auto_72163 ?auto_72164 ) ( ON ?auto_72162 ?auto_72163 ) ( CLEAR ?auto_72160 ) ( ON ?auto_72161 ?auto_72162 ) ( CLEAR ?auto_72161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72159 ?auto_72160 ?auto_72161 )
      ( MAKE-9PILE ?auto_72159 ?auto_72160 ?auto_72161 ?auto_72162 ?auto_72163 ?auto_72164 ?auto_72165 ?auto_72166 ?auto_72167 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72178 - BLOCK
      ?auto_72179 - BLOCK
      ?auto_72180 - BLOCK
      ?auto_72181 - BLOCK
      ?auto_72182 - BLOCK
      ?auto_72183 - BLOCK
      ?auto_72184 - BLOCK
      ?auto_72185 - BLOCK
      ?auto_72186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72186 ) ( ON-TABLE ?auto_72178 ) ( ON ?auto_72179 ?auto_72178 ) ( not ( = ?auto_72178 ?auto_72179 ) ) ( not ( = ?auto_72178 ?auto_72180 ) ) ( not ( = ?auto_72178 ?auto_72181 ) ) ( not ( = ?auto_72178 ?auto_72182 ) ) ( not ( = ?auto_72178 ?auto_72183 ) ) ( not ( = ?auto_72178 ?auto_72184 ) ) ( not ( = ?auto_72178 ?auto_72185 ) ) ( not ( = ?auto_72178 ?auto_72186 ) ) ( not ( = ?auto_72179 ?auto_72180 ) ) ( not ( = ?auto_72179 ?auto_72181 ) ) ( not ( = ?auto_72179 ?auto_72182 ) ) ( not ( = ?auto_72179 ?auto_72183 ) ) ( not ( = ?auto_72179 ?auto_72184 ) ) ( not ( = ?auto_72179 ?auto_72185 ) ) ( not ( = ?auto_72179 ?auto_72186 ) ) ( not ( = ?auto_72180 ?auto_72181 ) ) ( not ( = ?auto_72180 ?auto_72182 ) ) ( not ( = ?auto_72180 ?auto_72183 ) ) ( not ( = ?auto_72180 ?auto_72184 ) ) ( not ( = ?auto_72180 ?auto_72185 ) ) ( not ( = ?auto_72180 ?auto_72186 ) ) ( not ( = ?auto_72181 ?auto_72182 ) ) ( not ( = ?auto_72181 ?auto_72183 ) ) ( not ( = ?auto_72181 ?auto_72184 ) ) ( not ( = ?auto_72181 ?auto_72185 ) ) ( not ( = ?auto_72181 ?auto_72186 ) ) ( not ( = ?auto_72182 ?auto_72183 ) ) ( not ( = ?auto_72182 ?auto_72184 ) ) ( not ( = ?auto_72182 ?auto_72185 ) ) ( not ( = ?auto_72182 ?auto_72186 ) ) ( not ( = ?auto_72183 ?auto_72184 ) ) ( not ( = ?auto_72183 ?auto_72185 ) ) ( not ( = ?auto_72183 ?auto_72186 ) ) ( not ( = ?auto_72184 ?auto_72185 ) ) ( not ( = ?auto_72184 ?auto_72186 ) ) ( not ( = ?auto_72185 ?auto_72186 ) ) ( ON ?auto_72185 ?auto_72186 ) ( ON ?auto_72184 ?auto_72185 ) ( ON ?auto_72183 ?auto_72184 ) ( ON ?auto_72182 ?auto_72183 ) ( ON ?auto_72181 ?auto_72182 ) ( CLEAR ?auto_72179 ) ( ON ?auto_72180 ?auto_72181 ) ( CLEAR ?auto_72180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72178 ?auto_72179 ?auto_72180 )
      ( MAKE-9PILE ?auto_72178 ?auto_72179 ?auto_72180 ?auto_72181 ?auto_72182 ?auto_72183 ?auto_72184 ?auto_72185 ?auto_72186 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72196 - BLOCK
      ?auto_72197 - BLOCK
      ?auto_72198 - BLOCK
      ?auto_72199 - BLOCK
      ?auto_72200 - BLOCK
      ?auto_72201 - BLOCK
      ?auto_72202 - BLOCK
      ?auto_72203 - BLOCK
      ?auto_72204 - BLOCK
    )
    :vars
    (
      ?auto_72205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72204 ?auto_72205 ) ( ON-TABLE ?auto_72196 ) ( not ( = ?auto_72196 ?auto_72197 ) ) ( not ( = ?auto_72196 ?auto_72198 ) ) ( not ( = ?auto_72196 ?auto_72199 ) ) ( not ( = ?auto_72196 ?auto_72200 ) ) ( not ( = ?auto_72196 ?auto_72201 ) ) ( not ( = ?auto_72196 ?auto_72202 ) ) ( not ( = ?auto_72196 ?auto_72203 ) ) ( not ( = ?auto_72196 ?auto_72204 ) ) ( not ( = ?auto_72196 ?auto_72205 ) ) ( not ( = ?auto_72197 ?auto_72198 ) ) ( not ( = ?auto_72197 ?auto_72199 ) ) ( not ( = ?auto_72197 ?auto_72200 ) ) ( not ( = ?auto_72197 ?auto_72201 ) ) ( not ( = ?auto_72197 ?auto_72202 ) ) ( not ( = ?auto_72197 ?auto_72203 ) ) ( not ( = ?auto_72197 ?auto_72204 ) ) ( not ( = ?auto_72197 ?auto_72205 ) ) ( not ( = ?auto_72198 ?auto_72199 ) ) ( not ( = ?auto_72198 ?auto_72200 ) ) ( not ( = ?auto_72198 ?auto_72201 ) ) ( not ( = ?auto_72198 ?auto_72202 ) ) ( not ( = ?auto_72198 ?auto_72203 ) ) ( not ( = ?auto_72198 ?auto_72204 ) ) ( not ( = ?auto_72198 ?auto_72205 ) ) ( not ( = ?auto_72199 ?auto_72200 ) ) ( not ( = ?auto_72199 ?auto_72201 ) ) ( not ( = ?auto_72199 ?auto_72202 ) ) ( not ( = ?auto_72199 ?auto_72203 ) ) ( not ( = ?auto_72199 ?auto_72204 ) ) ( not ( = ?auto_72199 ?auto_72205 ) ) ( not ( = ?auto_72200 ?auto_72201 ) ) ( not ( = ?auto_72200 ?auto_72202 ) ) ( not ( = ?auto_72200 ?auto_72203 ) ) ( not ( = ?auto_72200 ?auto_72204 ) ) ( not ( = ?auto_72200 ?auto_72205 ) ) ( not ( = ?auto_72201 ?auto_72202 ) ) ( not ( = ?auto_72201 ?auto_72203 ) ) ( not ( = ?auto_72201 ?auto_72204 ) ) ( not ( = ?auto_72201 ?auto_72205 ) ) ( not ( = ?auto_72202 ?auto_72203 ) ) ( not ( = ?auto_72202 ?auto_72204 ) ) ( not ( = ?auto_72202 ?auto_72205 ) ) ( not ( = ?auto_72203 ?auto_72204 ) ) ( not ( = ?auto_72203 ?auto_72205 ) ) ( not ( = ?auto_72204 ?auto_72205 ) ) ( ON ?auto_72203 ?auto_72204 ) ( ON ?auto_72202 ?auto_72203 ) ( ON ?auto_72201 ?auto_72202 ) ( ON ?auto_72200 ?auto_72201 ) ( ON ?auto_72199 ?auto_72200 ) ( ON ?auto_72198 ?auto_72199 ) ( CLEAR ?auto_72196 ) ( ON ?auto_72197 ?auto_72198 ) ( CLEAR ?auto_72197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72196 ?auto_72197 )
      ( MAKE-9PILE ?auto_72196 ?auto_72197 ?auto_72198 ?auto_72199 ?auto_72200 ?auto_72201 ?auto_72202 ?auto_72203 ?auto_72204 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72215 - BLOCK
      ?auto_72216 - BLOCK
      ?auto_72217 - BLOCK
      ?auto_72218 - BLOCK
      ?auto_72219 - BLOCK
      ?auto_72220 - BLOCK
      ?auto_72221 - BLOCK
      ?auto_72222 - BLOCK
      ?auto_72223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72223 ) ( ON-TABLE ?auto_72215 ) ( not ( = ?auto_72215 ?auto_72216 ) ) ( not ( = ?auto_72215 ?auto_72217 ) ) ( not ( = ?auto_72215 ?auto_72218 ) ) ( not ( = ?auto_72215 ?auto_72219 ) ) ( not ( = ?auto_72215 ?auto_72220 ) ) ( not ( = ?auto_72215 ?auto_72221 ) ) ( not ( = ?auto_72215 ?auto_72222 ) ) ( not ( = ?auto_72215 ?auto_72223 ) ) ( not ( = ?auto_72216 ?auto_72217 ) ) ( not ( = ?auto_72216 ?auto_72218 ) ) ( not ( = ?auto_72216 ?auto_72219 ) ) ( not ( = ?auto_72216 ?auto_72220 ) ) ( not ( = ?auto_72216 ?auto_72221 ) ) ( not ( = ?auto_72216 ?auto_72222 ) ) ( not ( = ?auto_72216 ?auto_72223 ) ) ( not ( = ?auto_72217 ?auto_72218 ) ) ( not ( = ?auto_72217 ?auto_72219 ) ) ( not ( = ?auto_72217 ?auto_72220 ) ) ( not ( = ?auto_72217 ?auto_72221 ) ) ( not ( = ?auto_72217 ?auto_72222 ) ) ( not ( = ?auto_72217 ?auto_72223 ) ) ( not ( = ?auto_72218 ?auto_72219 ) ) ( not ( = ?auto_72218 ?auto_72220 ) ) ( not ( = ?auto_72218 ?auto_72221 ) ) ( not ( = ?auto_72218 ?auto_72222 ) ) ( not ( = ?auto_72218 ?auto_72223 ) ) ( not ( = ?auto_72219 ?auto_72220 ) ) ( not ( = ?auto_72219 ?auto_72221 ) ) ( not ( = ?auto_72219 ?auto_72222 ) ) ( not ( = ?auto_72219 ?auto_72223 ) ) ( not ( = ?auto_72220 ?auto_72221 ) ) ( not ( = ?auto_72220 ?auto_72222 ) ) ( not ( = ?auto_72220 ?auto_72223 ) ) ( not ( = ?auto_72221 ?auto_72222 ) ) ( not ( = ?auto_72221 ?auto_72223 ) ) ( not ( = ?auto_72222 ?auto_72223 ) ) ( ON ?auto_72222 ?auto_72223 ) ( ON ?auto_72221 ?auto_72222 ) ( ON ?auto_72220 ?auto_72221 ) ( ON ?auto_72219 ?auto_72220 ) ( ON ?auto_72218 ?auto_72219 ) ( ON ?auto_72217 ?auto_72218 ) ( CLEAR ?auto_72215 ) ( ON ?auto_72216 ?auto_72217 ) ( CLEAR ?auto_72216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72215 ?auto_72216 )
      ( MAKE-9PILE ?auto_72215 ?auto_72216 ?auto_72217 ?auto_72218 ?auto_72219 ?auto_72220 ?auto_72221 ?auto_72222 ?auto_72223 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72233 - BLOCK
      ?auto_72234 - BLOCK
      ?auto_72235 - BLOCK
      ?auto_72236 - BLOCK
      ?auto_72237 - BLOCK
      ?auto_72238 - BLOCK
      ?auto_72239 - BLOCK
      ?auto_72240 - BLOCK
      ?auto_72241 - BLOCK
    )
    :vars
    (
      ?auto_72242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72241 ?auto_72242 ) ( not ( = ?auto_72233 ?auto_72234 ) ) ( not ( = ?auto_72233 ?auto_72235 ) ) ( not ( = ?auto_72233 ?auto_72236 ) ) ( not ( = ?auto_72233 ?auto_72237 ) ) ( not ( = ?auto_72233 ?auto_72238 ) ) ( not ( = ?auto_72233 ?auto_72239 ) ) ( not ( = ?auto_72233 ?auto_72240 ) ) ( not ( = ?auto_72233 ?auto_72241 ) ) ( not ( = ?auto_72233 ?auto_72242 ) ) ( not ( = ?auto_72234 ?auto_72235 ) ) ( not ( = ?auto_72234 ?auto_72236 ) ) ( not ( = ?auto_72234 ?auto_72237 ) ) ( not ( = ?auto_72234 ?auto_72238 ) ) ( not ( = ?auto_72234 ?auto_72239 ) ) ( not ( = ?auto_72234 ?auto_72240 ) ) ( not ( = ?auto_72234 ?auto_72241 ) ) ( not ( = ?auto_72234 ?auto_72242 ) ) ( not ( = ?auto_72235 ?auto_72236 ) ) ( not ( = ?auto_72235 ?auto_72237 ) ) ( not ( = ?auto_72235 ?auto_72238 ) ) ( not ( = ?auto_72235 ?auto_72239 ) ) ( not ( = ?auto_72235 ?auto_72240 ) ) ( not ( = ?auto_72235 ?auto_72241 ) ) ( not ( = ?auto_72235 ?auto_72242 ) ) ( not ( = ?auto_72236 ?auto_72237 ) ) ( not ( = ?auto_72236 ?auto_72238 ) ) ( not ( = ?auto_72236 ?auto_72239 ) ) ( not ( = ?auto_72236 ?auto_72240 ) ) ( not ( = ?auto_72236 ?auto_72241 ) ) ( not ( = ?auto_72236 ?auto_72242 ) ) ( not ( = ?auto_72237 ?auto_72238 ) ) ( not ( = ?auto_72237 ?auto_72239 ) ) ( not ( = ?auto_72237 ?auto_72240 ) ) ( not ( = ?auto_72237 ?auto_72241 ) ) ( not ( = ?auto_72237 ?auto_72242 ) ) ( not ( = ?auto_72238 ?auto_72239 ) ) ( not ( = ?auto_72238 ?auto_72240 ) ) ( not ( = ?auto_72238 ?auto_72241 ) ) ( not ( = ?auto_72238 ?auto_72242 ) ) ( not ( = ?auto_72239 ?auto_72240 ) ) ( not ( = ?auto_72239 ?auto_72241 ) ) ( not ( = ?auto_72239 ?auto_72242 ) ) ( not ( = ?auto_72240 ?auto_72241 ) ) ( not ( = ?auto_72240 ?auto_72242 ) ) ( not ( = ?auto_72241 ?auto_72242 ) ) ( ON ?auto_72240 ?auto_72241 ) ( ON ?auto_72239 ?auto_72240 ) ( ON ?auto_72238 ?auto_72239 ) ( ON ?auto_72237 ?auto_72238 ) ( ON ?auto_72236 ?auto_72237 ) ( ON ?auto_72235 ?auto_72236 ) ( ON ?auto_72234 ?auto_72235 ) ( ON ?auto_72233 ?auto_72234 ) ( CLEAR ?auto_72233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72233 )
      ( MAKE-9PILE ?auto_72233 ?auto_72234 ?auto_72235 ?auto_72236 ?auto_72237 ?auto_72238 ?auto_72239 ?auto_72240 ?auto_72241 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72252 - BLOCK
      ?auto_72253 - BLOCK
      ?auto_72254 - BLOCK
      ?auto_72255 - BLOCK
      ?auto_72256 - BLOCK
      ?auto_72257 - BLOCK
      ?auto_72258 - BLOCK
      ?auto_72259 - BLOCK
      ?auto_72260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72260 ) ( not ( = ?auto_72252 ?auto_72253 ) ) ( not ( = ?auto_72252 ?auto_72254 ) ) ( not ( = ?auto_72252 ?auto_72255 ) ) ( not ( = ?auto_72252 ?auto_72256 ) ) ( not ( = ?auto_72252 ?auto_72257 ) ) ( not ( = ?auto_72252 ?auto_72258 ) ) ( not ( = ?auto_72252 ?auto_72259 ) ) ( not ( = ?auto_72252 ?auto_72260 ) ) ( not ( = ?auto_72253 ?auto_72254 ) ) ( not ( = ?auto_72253 ?auto_72255 ) ) ( not ( = ?auto_72253 ?auto_72256 ) ) ( not ( = ?auto_72253 ?auto_72257 ) ) ( not ( = ?auto_72253 ?auto_72258 ) ) ( not ( = ?auto_72253 ?auto_72259 ) ) ( not ( = ?auto_72253 ?auto_72260 ) ) ( not ( = ?auto_72254 ?auto_72255 ) ) ( not ( = ?auto_72254 ?auto_72256 ) ) ( not ( = ?auto_72254 ?auto_72257 ) ) ( not ( = ?auto_72254 ?auto_72258 ) ) ( not ( = ?auto_72254 ?auto_72259 ) ) ( not ( = ?auto_72254 ?auto_72260 ) ) ( not ( = ?auto_72255 ?auto_72256 ) ) ( not ( = ?auto_72255 ?auto_72257 ) ) ( not ( = ?auto_72255 ?auto_72258 ) ) ( not ( = ?auto_72255 ?auto_72259 ) ) ( not ( = ?auto_72255 ?auto_72260 ) ) ( not ( = ?auto_72256 ?auto_72257 ) ) ( not ( = ?auto_72256 ?auto_72258 ) ) ( not ( = ?auto_72256 ?auto_72259 ) ) ( not ( = ?auto_72256 ?auto_72260 ) ) ( not ( = ?auto_72257 ?auto_72258 ) ) ( not ( = ?auto_72257 ?auto_72259 ) ) ( not ( = ?auto_72257 ?auto_72260 ) ) ( not ( = ?auto_72258 ?auto_72259 ) ) ( not ( = ?auto_72258 ?auto_72260 ) ) ( not ( = ?auto_72259 ?auto_72260 ) ) ( ON ?auto_72259 ?auto_72260 ) ( ON ?auto_72258 ?auto_72259 ) ( ON ?auto_72257 ?auto_72258 ) ( ON ?auto_72256 ?auto_72257 ) ( ON ?auto_72255 ?auto_72256 ) ( ON ?auto_72254 ?auto_72255 ) ( ON ?auto_72253 ?auto_72254 ) ( ON ?auto_72252 ?auto_72253 ) ( CLEAR ?auto_72252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72252 )
      ( MAKE-9PILE ?auto_72252 ?auto_72253 ?auto_72254 ?auto_72255 ?auto_72256 ?auto_72257 ?auto_72258 ?auto_72259 ?auto_72260 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_72270 - BLOCK
      ?auto_72271 - BLOCK
      ?auto_72272 - BLOCK
      ?auto_72273 - BLOCK
      ?auto_72274 - BLOCK
      ?auto_72275 - BLOCK
      ?auto_72276 - BLOCK
      ?auto_72277 - BLOCK
      ?auto_72278 - BLOCK
    )
    :vars
    (
      ?auto_72279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72270 ?auto_72271 ) ) ( not ( = ?auto_72270 ?auto_72272 ) ) ( not ( = ?auto_72270 ?auto_72273 ) ) ( not ( = ?auto_72270 ?auto_72274 ) ) ( not ( = ?auto_72270 ?auto_72275 ) ) ( not ( = ?auto_72270 ?auto_72276 ) ) ( not ( = ?auto_72270 ?auto_72277 ) ) ( not ( = ?auto_72270 ?auto_72278 ) ) ( not ( = ?auto_72271 ?auto_72272 ) ) ( not ( = ?auto_72271 ?auto_72273 ) ) ( not ( = ?auto_72271 ?auto_72274 ) ) ( not ( = ?auto_72271 ?auto_72275 ) ) ( not ( = ?auto_72271 ?auto_72276 ) ) ( not ( = ?auto_72271 ?auto_72277 ) ) ( not ( = ?auto_72271 ?auto_72278 ) ) ( not ( = ?auto_72272 ?auto_72273 ) ) ( not ( = ?auto_72272 ?auto_72274 ) ) ( not ( = ?auto_72272 ?auto_72275 ) ) ( not ( = ?auto_72272 ?auto_72276 ) ) ( not ( = ?auto_72272 ?auto_72277 ) ) ( not ( = ?auto_72272 ?auto_72278 ) ) ( not ( = ?auto_72273 ?auto_72274 ) ) ( not ( = ?auto_72273 ?auto_72275 ) ) ( not ( = ?auto_72273 ?auto_72276 ) ) ( not ( = ?auto_72273 ?auto_72277 ) ) ( not ( = ?auto_72273 ?auto_72278 ) ) ( not ( = ?auto_72274 ?auto_72275 ) ) ( not ( = ?auto_72274 ?auto_72276 ) ) ( not ( = ?auto_72274 ?auto_72277 ) ) ( not ( = ?auto_72274 ?auto_72278 ) ) ( not ( = ?auto_72275 ?auto_72276 ) ) ( not ( = ?auto_72275 ?auto_72277 ) ) ( not ( = ?auto_72275 ?auto_72278 ) ) ( not ( = ?auto_72276 ?auto_72277 ) ) ( not ( = ?auto_72276 ?auto_72278 ) ) ( not ( = ?auto_72277 ?auto_72278 ) ) ( ON ?auto_72270 ?auto_72279 ) ( not ( = ?auto_72278 ?auto_72279 ) ) ( not ( = ?auto_72277 ?auto_72279 ) ) ( not ( = ?auto_72276 ?auto_72279 ) ) ( not ( = ?auto_72275 ?auto_72279 ) ) ( not ( = ?auto_72274 ?auto_72279 ) ) ( not ( = ?auto_72273 ?auto_72279 ) ) ( not ( = ?auto_72272 ?auto_72279 ) ) ( not ( = ?auto_72271 ?auto_72279 ) ) ( not ( = ?auto_72270 ?auto_72279 ) ) ( ON ?auto_72271 ?auto_72270 ) ( ON ?auto_72272 ?auto_72271 ) ( ON ?auto_72273 ?auto_72272 ) ( ON ?auto_72274 ?auto_72273 ) ( ON ?auto_72275 ?auto_72274 ) ( ON ?auto_72276 ?auto_72275 ) ( ON ?auto_72277 ?auto_72276 ) ( ON ?auto_72278 ?auto_72277 ) ( CLEAR ?auto_72278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_72278 ?auto_72277 ?auto_72276 ?auto_72275 ?auto_72274 ?auto_72273 ?auto_72272 ?auto_72271 ?auto_72270 )
      ( MAKE-9PILE ?auto_72270 ?auto_72271 ?auto_72272 ?auto_72273 ?auto_72274 ?auto_72275 ?auto_72276 ?auto_72277 ?auto_72278 ) )
  )

)

