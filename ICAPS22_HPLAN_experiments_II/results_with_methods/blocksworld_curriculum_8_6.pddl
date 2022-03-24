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
      ?auto_36163 - BLOCK
    )
    :vars
    (
      ?auto_36164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36163 ?auto_36164 ) ( CLEAR ?auto_36163 ) ( HAND-EMPTY ) ( not ( = ?auto_36163 ?auto_36164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36163 ?auto_36164 )
      ( !PUTDOWN ?auto_36163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_36166 - BLOCK
    )
    :vars
    (
      ?auto_36167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36166 ?auto_36167 ) ( CLEAR ?auto_36166 ) ( HAND-EMPTY ) ( not ( = ?auto_36166 ?auto_36167 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36166 ?auto_36167 )
      ( !PUTDOWN ?auto_36166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36170 - BLOCK
      ?auto_36171 - BLOCK
    )
    :vars
    (
      ?auto_36172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36170 ) ( ON ?auto_36171 ?auto_36172 ) ( CLEAR ?auto_36171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36170 ) ( not ( = ?auto_36170 ?auto_36171 ) ) ( not ( = ?auto_36170 ?auto_36172 ) ) ( not ( = ?auto_36171 ?auto_36172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36171 ?auto_36172 )
      ( !STACK ?auto_36171 ?auto_36170 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36175 - BLOCK
      ?auto_36176 - BLOCK
    )
    :vars
    (
      ?auto_36177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36175 ) ( ON ?auto_36176 ?auto_36177 ) ( CLEAR ?auto_36176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36175 ) ( not ( = ?auto_36175 ?auto_36176 ) ) ( not ( = ?auto_36175 ?auto_36177 ) ) ( not ( = ?auto_36176 ?auto_36177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36176 ?auto_36177 )
      ( !STACK ?auto_36176 ?auto_36175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36180 - BLOCK
      ?auto_36181 - BLOCK
    )
    :vars
    (
      ?auto_36182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36181 ?auto_36182 ) ( not ( = ?auto_36180 ?auto_36181 ) ) ( not ( = ?auto_36180 ?auto_36182 ) ) ( not ( = ?auto_36181 ?auto_36182 ) ) ( ON ?auto_36180 ?auto_36181 ) ( CLEAR ?auto_36180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36180 )
      ( MAKE-2PILE ?auto_36180 ?auto_36181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_36185 - BLOCK
      ?auto_36186 - BLOCK
    )
    :vars
    (
      ?auto_36187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36186 ?auto_36187 ) ( not ( = ?auto_36185 ?auto_36186 ) ) ( not ( = ?auto_36185 ?auto_36187 ) ) ( not ( = ?auto_36186 ?auto_36187 ) ) ( ON ?auto_36185 ?auto_36186 ) ( CLEAR ?auto_36185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36185 )
      ( MAKE-2PILE ?auto_36185 ?auto_36186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36191 - BLOCK
      ?auto_36192 - BLOCK
      ?auto_36193 - BLOCK
    )
    :vars
    (
      ?auto_36194 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36192 ) ( ON ?auto_36193 ?auto_36194 ) ( CLEAR ?auto_36193 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36191 ) ( ON ?auto_36192 ?auto_36191 ) ( not ( = ?auto_36191 ?auto_36192 ) ) ( not ( = ?auto_36191 ?auto_36193 ) ) ( not ( = ?auto_36191 ?auto_36194 ) ) ( not ( = ?auto_36192 ?auto_36193 ) ) ( not ( = ?auto_36192 ?auto_36194 ) ) ( not ( = ?auto_36193 ?auto_36194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36193 ?auto_36194 )
      ( !STACK ?auto_36193 ?auto_36192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36198 - BLOCK
      ?auto_36199 - BLOCK
      ?auto_36200 - BLOCK
    )
    :vars
    (
      ?auto_36201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36199 ) ( ON ?auto_36200 ?auto_36201 ) ( CLEAR ?auto_36200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36198 ) ( ON ?auto_36199 ?auto_36198 ) ( not ( = ?auto_36198 ?auto_36199 ) ) ( not ( = ?auto_36198 ?auto_36200 ) ) ( not ( = ?auto_36198 ?auto_36201 ) ) ( not ( = ?auto_36199 ?auto_36200 ) ) ( not ( = ?auto_36199 ?auto_36201 ) ) ( not ( = ?auto_36200 ?auto_36201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36200 ?auto_36201 )
      ( !STACK ?auto_36200 ?auto_36199 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36205 - BLOCK
      ?auto_36206 - BLOCK
      ?auto_36207 - BLOCK
    )
    :vars
    (
      ?auto_36208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36207 ?auto_36208 ) ( ON-TABLE ?auto_36205 ) ( not ( = ?auto_36205 ?auto_36206 ) ) ( not ( = ?auto_36205 ?auto_36207 ) ) ( not ( = ?auto_36205 ?auto_36208 ) ) ( not ( = ?auto_36206 ?auto_36207 ) ) ( not ( = ?auto_36206 ?auto_36208 ) ) ( not ( = ?auto_36207 ?auto_36208 ) ) ( CLEAR ?auto_36205 ) ( ON ?auto_36206 ?auto_36207 ) ( CLEAR ?auto_36206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36205 ?auto_36206 )
      ( MAKE-3PILE ?auto_36205 ?auto_36206 ?auto_36207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36212 - BLOCK
      ?auto_36213 - BLOCK
      ?auto_36214 - BLOCK
    )
    :vars
    (
      ?auto_36215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36214 ?auto_36215 ) ( ON-TABLE ?auto_36212 ) ( not ( = ?auto_36212 ?auto_36213 ) ) ( not ( = ?auto_36212 ?auto_36214 ) ) ( not ( = ?auto_36212 ?auto_36215 ) ) ( not ( = ?auto_36213 ?auto_36214 ) ) ( not ( = ?auto_36213 ?auto_36215 ) ) ( not ( = ?auto_36214 ?auto_36215 ) ) ( CLEAR ?auto_36212 ) ( ON ?auto_36213 ?auto_36214 ) ( CLEAR ?auto_36213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36212 ?auto_36213 )
      ( MAKE-3PILE ?auto_36212 ?auto_36213 ?auto_36214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36219 - BLOCK
      ?auto_36220 - BLOCK
      ?auto_36221 - BLOCK
    )
    :vars
    (
      ?auto_36222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36221 ?auto_36222 ) ( not ( = ?auto_36219 ?auto_36220 ) ) ( not ( = ?auto_36219 ?auto_36221 ) ) ( not ( = ?auto_36219 ?auto_36222 ) ) ( not ( = ?auto_36220 ?auto_36221 ) ) ( not ( = ?auto_36220 ?auto_36222 ) ) ( not ( = ?auto_36221 ?auto_36222 ) ) ( ON ?auto_36220 ?auto_36221 ) ( ON ?auto_36219 ?auto_36220 ) ( CLEAR ?auto_36219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36219 )
      ( MAKE-3PILE ?auto_36219 ?auto_36220 ?auto_36221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_36226 - BLOCK
      ?auto_36227 - BLOCK
      ?auto_36228 - BLOCK
    )
    :vars
    (
      ?auto_36229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36228 ?auto_36229 ) ( not ( = ?auto_36226 ?auto_36227 ) ) ( not ( = ?auto_36226 ?auto_36228 ) ) ( not ( = ?auto_36226 ?auto_36229 ) ) ( not ( = ?auto_36227 ?auto_36228 ) ) ( not ( = ?auto_36227 ?auto_36229 ) ) ( not ( = ?auto_36228 ?auto_36229 ) ) ( ON ?auto_36227 ?auto_36228 ) ( ON ?auto_36226 ?auto_36227 ) ( CLEAR ?auto_36226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36226 )
      ( MAKE-3PILE ?auto_36226 ?auto_36227 ?auto_36228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36234 - BLOCK
      ?auto_36235 - BLOCK
      ?auto_36236 - BLOCK
      ?auto_36237 - BLOCK
    )
    :vars
    (
      ?auto_36238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36236 ) ( ON ?auto_36237 ?auto_36238 ) ( CLEAR ?auto_36237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36234 ) ( ON ?auto_36235 ?auto_36234 ) ( ON ?auto_36236 ?auto_36235 ) ( not ( = ?auto_36234 ?auto_36235 ) ) ( not ( = ?auto_36234 ?auto_36236 ) ) ( not ( = ?auto_36234 ?auto_36237 ) ) ( not ( = ?auto_36234 ?auto_36238 ) ) ( not ( = ?auto_36235 ?auto_36236 ) ) ( not ( = ?auto_36235 ?auto_36237 ) ) ( not ( = ?auto_36235 ?auto_36238 ) ) ( not ( = ?auto_36236 ?auto_36237 ) ) ( not ( = ?auto_36236 ?auto_36238 ) ) ( not ( = ?auto_36237 ?auto_36238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36237 ?auto_36238 )
      ( !STACK ?auto_36237 ?auto_36236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36243 - BLOCK
      ?auto_36244 - BLOCK
      ?auto_36245 - BLOCK
      ?auto_36246 - BLOCK
    )
    :vars
    (
      ?auto_36247 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36245 ) ( ON ?auto_36246 ?auto_36247 ) ( CLEAR ?auto_36246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36243 ) ( ON ?auto_36244 ?auto_36243 ) ( ON ?auto_36245 ?auto_36244 ) ( not ( = ?auto_36243 ?auto_36244 ) ) ( not ( = ?auto_36243 ?auto_36245 ) ) ( not ( = ?auto_36243 ?auto_36246 ) ) ( not ( = ?auto_36243 ?auto_36247 ) ) ( not ( = ?auto_36244 ?auto_36245 ) ) ( not ( = ?auto_36244 ?auto_36246 ) ) ( not ( = ?auto_36244 ?auto_36247 ) ) ( not ( = ?auto_36245 ?auto_36246 ) ) ( not ( = ?auto_36245 ?auto_36247 ) ) ( not ( = ?auto_36246 ?auto_36247 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36246 ?auto_36247 )
      ( !STACK ?auto_36246 ?auto_36245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36252 - BLOCK
      ?auto_36253 - BLOCK
      ?auto_36254 - BLOCK
      ?auto_36255 - BLOCK
    )
    :vars
    (
      ?auto_36256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36255 ?auto_36256 ) ( ON-TABLE ?auto_36252 ) ( ON ?auto_36253 ?auto_36252 ) ( not ( = ?auto_36252 ?auto_36253 ) ) ( not ( = ?auto_36252 ?auto_36254 ) ) ( not ( = ?auto_36252 ?auto_36255 ) ) ( not ( = ?auto_36252 ?auto_36256 ) ) ( not ( = ?auto_36253 ?auto_36254 ) ) ( not ( = ?auto_36253 ?auto_36255 ) ) ( not ( = ?auto_36253 ?auto_36256 ) ) ( not ( = ?auto_36254 ?auto_36255 ) ) ( not ( = ?auto_36254 ?auto_36256 ) ) ( not ( = ?auto_36255 ?auto_36256 ) ) ( CLEAR ?auto_36253 ) ( ON ?auto_36254 ?auto_36255 ) ( CLEAR ?auto_36254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36252 ?auto_36253 ?auto_36254 )
      ( MAKE-4PILE ?auto_36252 ?auto_36253 ?auto_36254 ?auto_36255 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36261 - BLOCK
      ?auto_36262 - BLOCK
      ?auto_36263 - BLOCK
      ?auto_36264 - BLOCK
    )
    :vars
    (
      ?auto_36265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36264 ?auto_36265 ) ( ON-TABLE ?auto_36261 ) ( ON ?auto_36262 ?auto_36261 ) ( not ( = ?auto_36261 ?auto_36262 ) ) ( not ( = ?auto_36261 ?auto_36263 ) ) ( not ( = ?auto_36261 ?auto_36264 ) ) ( not ( = ?auto_36261 ?auto_36265 ) ) ( not ( = ?auto_36262 ?auto_36263 ) ) ( not ( = ?auto_36262 ?auto_36264 ) ) ( not ( = ?auto_36262 ?auto_36265 ) ) ( not ( = ?auto_36263 ?auto_36264 ) ) ( not ( = ?auto_36263 ?auto_36265 ) ) ( not ( = ?auto_36264 ?auto_36265 ) ) ( CLEAR ?auto_36262 ) ( ON ?auto_36263 ?auto_36264 ) ( CLEAR ?auto_36263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36261 ?auto_36262 ?auto_36263 )
      ( MAKE-4PILE ?auto_36261 ?auto_36262 ?auto_36263 ?auto_36264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36270 - BLOCK
      ?auto_36271 - BLOCK
      ?auto_36272 - BLOCK
      ?auto_36273 - BLOCK
    )
    :vars
    (
      ?auto_36274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36273 ?auto_36274 ) ( ON-TABLE ?auto_36270 ) ( not ( = ?auto_36270 ?auto_36271 ) ) ( not ( = ?auto_36270 ?auto_36272 ) ) ( not ( = ?auto_36270 ?auto_36273 ) ) ( not ( = ?auto_36270 ?auto_36274 ) ) ( not ( = ?auto_36271 ?auto_36272 ) ) ( not ( = ?auto_36271 ?auto_36273 ) ) ( not ( = ?auto_36271 ?auto_36274 ) ) ( not ( = ?auto_36272 ?auto_36273 ) ) ( not ( = ?auto_36272 ?auto_36274 ) ) ( not ( = ?auto_36273 ?auto_36274 ) ) ( ON ?auto_36272 ?auto_36273 ) ( CLEAR ?auto_36270 ) ( ON ?auto_36271 ?auto_36272 ) ( CLEAR ?auto_36271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36270 ?auto_36271 )
      ( MAKE-4PILE ?auto_36270 ?auto_36271 ?auto_36272 ?auto_36273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36279 - BLOCK
      ?auto_36280 - BLOCK
      ?auto_36281 - BLOCK
      ?auto_36282 - BLOCK
    )
    :vars
    (
      ?auto_36283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36282 ?auto_36283 ) ( ON-TABLE ?auto_36279 ) ( not ( = ?auto_36279 ?auto_36280 ) ) ( not ( = ?auto_36279 ?auto_36281 ) ) ( not ( = ?auto_36279 ?auto_36282 ) ) ( not ( = ?auto_36279 ?auto_36283 ) ) ( not ( = ?auto_36280 ?auto_36281 ) ) ( not ( = ?auto_36280 ?auto_36282 ) ) ( not ( = ?auto_36280 ?auto_36283 ) ) ( not ( = ?auto_36281 ?auto_36282 ) ) ( not ( = ?auto_36281 ?auto_36283 ) ) ( not ( = ?auto_36282 ?auto_36283 ) ) ( ON ?auto_36281 ?auto_36282 ) ( CLEAR ?auto_36279 ) ( ON ?auto_36280 ?auto_36281 ) ( CLEAR ?auto_36280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36279 ?auto_36280 )
      ( MAKE-4PILE ?auto_36279 ?auto_36280 ?auto_36281 ?auto_36282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36288 - BLOCK
      ?auto_36289 - BLOCK
      ?auto_36290 - BLOCK
      ?auto_36291 - BLOCK
    )
    :vars
    (
      ?auto_36292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36291 ?auto_36292 ) ( not ( = ?auto_36288 ?auto_36289 ) ) ( not ( = ?auto_36288 ?auto_36290 ) ) ( not ( = ?auto_36288 ?auto_36291 ) ) ( not ( = ?auto_36288 ?auto_36292 ) ) ( not ( = ?auto_36289 ?auto_36290 ) ) ( not ( = ?auto_36289 ?auto_36291 ) ) ( not ( = ?auto_36289 ?auto_36292 ) ) ( not ( = ?auto_36290 ?auto_36291 ) ) ( not ( = ?auto_36290 ?auto_36292 ) ) ( not ( = ?auto_36291 ?auto_36292 ) ) ( ON ?auto_36290 ?auto_36291 ) ( ON ?auto_36289 ?auto_36290 ) ( ON ?auto_36288 ?auto_36289 ) ( CLEAR ?auto_36288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36288 )
      ( MAKE-4PILE ?auto_36288 ?auto_36289 ?auto_36290 ?auto_36291 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_36297 - BLOCK
      ?auto_36298 - BLOCK
      ?auto_36299 - BLOCK
      ?auto_36300 - BLOCK
    )
    :vars
    (
      ?auto_36301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36300 ?auto_36301 ) ( not ( = ?auto_36297 ?auto_36298 ) ) ( not ( = ?auto_36297 ?auto_36299 ) ) ( not ( = ?auto_36297 ?auto_36300 ) ) ( not ( = ?auto_36297 ?auto_36301 ) ) ( not ( = ?auto_36298 ?auto_36299 ) ) ( not ( = ?auto_36298 ?auto_36300 ) ) ( not ( = ?auto_36298 ?auto_36301 ) ) ( not ( = ?auto_36299 ?auto_36300 ) ) ( not ( = ?auto_36299 ?auto_36301 ) ) ( not ( = ?auto_36300 ?auto_36301 ) ) ( ON ?auto_36299 ?auto_36300 ) ( ON ?auto_36298 ?auto_36299 ) ( ON ?auto_36297 ?auto_36298 ) ( CLEAR ?auto_36297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36297 )
      ( MAKE-4PILE ?auto_36297 ?auto_36298 ?auto_36299 ?auto_36300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36307 - BLOCK
      ?auto_36308 - BLOCK
      ?auto_36309 - BLOCK
      ?auto_36310 - BLOCK
      ?auto_36311 - BLOCK
    )
    :vars
    (
      ?auto_36312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36310 ) ( ON ?auto_36311 ?auto_36312 ) ( CLEAR ?auto_36311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36307 ) ( ON ?auto_36308 ?auto_36307 ) ( ON ?auto_36309 ?auto_36308 ) ( ON ?auto_36310 ?auto_36309 ) ( not ( = ?auto_36307 ?auto_36308 ) ) ( not ( = ?auto_36307 ?auto_36309 ) ) ( not ( = ?auto_36307 ?auto_36310 ) ) ( not ( = ?auto_36307 ?auto_36311 ) ) ( not ( = ?auto_36307 ?auto_36312 ) ) ( not ( = ?auto_36308 ?auto_36309 ) ) ( not ( = ?auto_36308 ?auto_36310 ) ) ( not ( = ?auto_36308 ?auto_36311 ) ) ( not ( = ?auto_36308 ?auto_36312 ) ) ( not ( = ?auto_36309 ?auto_36310 ) ) ( not ( = ?auto_36309 ?auto_36311 ) ) ( not ( = ?auto_36309 ?auto_36312 ) ) ( not ( = ?auto_36310 ?auto_36311 ) ) ( not ( = ?auto_36310 ?auto_36312 ) ) ( not ( = ?auto_36311 ?auto_36312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36311 ?auto_36312 )
      ( !STACK ?auto_36311 ?auto_36310 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36318 - BLOCK
      ?auto_36319 - BLOCK
      ?auto_36320 - BLOCK
      ?auto_36321 - BLOCK
      ?auto_36322 - BLOCK
    )
    :vars
    (
      ?auto_36323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36321 ) ( ON ?auto_36322 ?auto_36323 ) ( CLEAR ?auto_36322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36318 ) ( ON ?auto_36319 ?auto_36318 ) ( ON ?auto_36320 ?auto_36319 ) ( ON ?auto_36321 ?auto_36320 ) ( not ( = ?auto_36318 ?auto_36319 ) ) ( not ( = ?auto_36318 ?auto_36320 ) ) ( not ( = ?auto_36318 ?auto_36321 ) ) ( not ( = ?auto_36318 ?auto_36322 ) ) ( not ( = ?auto_36318 ?auto_36323 ) ) ( not ( = ?auto_36319 ?auto_36320 ) ) ( not ( = ?auto_36319 ?auto_36321 ) ) ( not ( = ?auto_36319 ?auto_36322 ) ) ( not ( = ?auto_36319 ?auto_36323 ) ) ( not ( = ?auto_36320 ?auto_36321 ) ) ( not ( = ?auto_36320 ?auto_36322 ) ) ( not ( = ?auto_36320 ?auto_36323 ) ) ( not ( = ?auto_36321 ?auto_36322 ) ) ( not ( = ?auto_36321 ?auto_36323 ) ) ( not ( = ?auto_36322 ?auto_36323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36322 ?auto_36323 )
      ( !STACK ?auto_36322 ?auto_36321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36329 - BLOCK
      ?auto_36330 - BLOCK
      ?auto_36331 - BLOCK
      ?auto_36332 - BLOCK
      ?auto_36333 - BLOCK
    )
    :vars
    (
      ?auto_36334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36333 ?auto_36334 ) ( ON-TABLE ?auto_36329 ) ( ON ?auto_36330 ?auto_36329 ) ( ON ?auto_36331 ?auto_36330 ) ( not ( = ?auto_36329 ?auto_36330 ) ) ( not ( = ?auto_36329 ?auto_36331 ) ) ( not ( = ?auto_36329 ?auto_36332 ) ) ( not ( = ?auto_36329 ?auto_36333 ) ) ( not ( = ?auto_36329 ?auto_36334 ) ) ( not ( = ?auto_36330 ?auto_36331 ) ) ( not ( = ?auto_36330 ?auto_36332 ) ) ( not ( = ?auto_36330 ?auto_36333 ) ) ( not ( = ?auto_36330 ?auto_36334 ) ) ( not ( = ?auto_36331 ?auto_36332 ) ) ( not ( = ?auto_36331 ?auto_36333 ) ) ( not ( = ?auto_36331 ?auto_36334 ) ) ( not ( = ?auto_36332 ?auto_36333 ) ) ( not ( = ?auto_36332 ?auto_36334 ) ) ( not ( = ?auto_36333 ?auto_36334 ) ) ( CLEAR ?auto_36331 ) ( ON ?auto_36332 ?auto_36333 ) ( CLEAR ?auto_36332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36329 ?auto_36330 ?auto_36331 ?auto_36332 )
      ( MAKE-5PILE ?auto_36329 ?auto_36330 ?auto_36331 ?auto_36332 ?auto_36333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36340 - BLOCK
      ?auto_36341 - BLOCK
      ?auto_36342 - BLOCK
      ?auto_36343 - BLOCK
      ?auto_36344 - BLOCK
    )
    :vars
    (
      ?auto_36345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36344 ?auto_36345 ) ( ON-TABLE ?auto_36340 ) ( ON ?auto_36341 ?auto_36340 ) ( ON ?auto_36342 ?auto_36341 ) ( not ( = ?auto_36340 ?auto_36341 ) ) ( not ( = ?auto_36340 ?auto_36342 ) ) ( not ( = ?auto_36340 ?auto_36343 ) ) ( not ( = ?auto_36340 ?auto_36344 ) ) ( not ( = ?auto_36340 ?auto_36345 ) ) ( not ( = ?auto_36341 ?auto_36342 ) ) ( not ( = ?auto_36341 ?auto_36343 ) ) ( not ( = ?auto_36341 ?auto_36344 ) ) ( not ( = ?auto_36341 ?auto_36345 ) ) ( not ( = ?auto_36342 ?auto_36343 ) ) ( not ( = ?auto_36342 ?auto_36344 ) ) ( not ( = ?auto_36342 ?auto_36345 ) ) ( not ( = ?auto_36343 ?auto_36344 ) ) ( not ( = ?auto_36343 ?auto_36345 ) ) ( not ( = ?auto_36344 ?auto_36345 ) ) ( CLEAR ?auto_36342 ) ( ON ?auto_36343 ?auto_36344 ) ( CLEAR ?auto_36343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36340 ?auto_36341 ?auto_36342 ?auto_36343 )
      ( MAKE-5PILE ?auto_36340 ?auto_36341 ?auto_36342 ?auto_36343 ?auto_36344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36351 - BLOCK
      ?auto_36352 - BLOCK
      ?auto_36353 - BLOCK
      ?auto_36354 - BLOCK
      ?auto_36355 - BLOCK
    )
    :vars
    (
      ?auto_36356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36355 ?auto_36356 ) ( ON-TABLE ?auto_36351 ) ( ON ?auto_36352 ?auto_36351 ) ( not ( = ?auto_36351 ?auto_36352 ) ) ( not ( = ?auto_36351 ?auto_36353 ) ) ( not ( = ?auto_36351 ?auto_36354 ) ) ( not ( = ?auto_36351 ?auto_36355 ) ) ( not ( = ?auto_36351 ?auto_36356 ) ) ( not ( = ?auto_36352 ?auto_36353 ) ) ( not ( = ?auto_36352 ?auto_36354 ) ) ( not ( = ?auto_36352 ?auto_36355 ) ) ( not ( = ?auto_36352 ?auto_36356 ) ) ( not ( = ?auto_36353 ?auto_36354 ) ) ( not ( = ?auto_36353 ?auto_36355 ) ) ( not ( = ?auto_36353 ?auto_36356 ) ) ( not ( = ?auto_36354 ?auto_36355 ) ) ( not ( = ?auto_36354 ?auto_36356 ) ) ( not ( = ?auto_36355 ?auto_36356 ) ) ( ON ?auto_36354 ?auto_36355 ) ( CLEAR ?auto_36352 ) ( ON ?auto_36353 ?auto_36354 ) ( CLEAR ?auto_36353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36351 ?auto_36352 ?auto_36353 )
      ( MAKE-5PILE ?auto_36351 ?auto_36352 ?auto_36353 ?auto_36354 ?auto_36355 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36362 - BLOCK
      ?auto_36363 - BLOCK
      ?auto_36364 - BLOCK
      ?auto_36365 - BLOCK
      ?auto_36366 - BLOCK
    )
    :vars
    (
      ?auto_36367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36366 ?auto_36367 ) ( ON-TABLE ?auto_36362 ) ( ON ?auto_36363 ?auto_36362 ) ( not ( = ?auto_36362 ?auto_36363 ) ) ( not ( = ?auto_36362 ?auto_36364 ) ) ( not ( = ?auto_36362 ?auto_36365 ) ) ( not ( = ?auto_36362 ?auto_36366 ) ) ( not ( = ?auto_36362 ?auto_36367 ) ) ( not ( = ?auto_36363 ?auto_36364 ) ) ( not ( = ?auto_36363 ?auto_36365 ) ) ( not ( = ?auto_36363 ?auto_36366 ) ) ( not ( = ?auto_36363 ?auto_36367 ) ) ( not ( = ?auto_36364 ?auto_36365 ) ) ( not ( = ?auto_36364 ?auto_36366 ) ) ( not ( = ?auto_36364 ?auto_36367 ) ) ( not ( = ?auto_36365 ?auto_36366 ) ) ( not ( = ?auto_36365 ?auto_36367 ) ) ( not ( = ?auto_36366 ?auto_36367 ) ) ( ON ?auto_36365 ?auto_36366 ) ( CLEAR ?auto_36363 ) ( ON ?auto_36364 ?auto_36365 ) ( CLEAR ?auto_36364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36362 ?auto_36363 ?auto_36364 )
      ( MAKE-5PILE ?auto_36362 ?auto_36363 ?auto_36364 ?auto_36365 ?auto_36366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36373 - BLOCK
      ?auto_36374 - BLOCK
      ?auto_36375 - BLOCK
      ?auto_36376 - BLOCK
      ?auto_36377 - BLOCK
    )
    :vars
    (
      ?auto_36378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36377 ?auto_36378 ) ( ON-TABLE ?auto_36373 ) ( not ( = ?auto_36373 ?auto_36374 ) ) ( not ( = ?auto_36373 ?auto_36375 ) ) ( not ( = ?auto_36373 ?auto_36376 ) ) ( not ( = ?auto_36373 ?auto_36377 ) ) ( not ( = ?auto_36373 ?auto_36378 ) ) ( not ( = ?auto_36374 ?auto_36375 ) ) ( not ( = ?auto_36374 ?auto_36376 ) ) ( not ( = ?auto_36374 ?auto_36377 ) ) ( not ( = ?auto_36374 ?auto_36378 ) ) ( not ( = ?auto_36375 ?auto_36376 ) ) ( not ( = ?auto_36375 ?auto_36377 ) ) ( not ( = ?auto_36375 ?auto_36378 ) ) ( not ( = ?auto_36376 ?auto_36377 ) ) ( not ( = ?auto_36376 ?auto_36378 ) ) ( not ( = ?auto_36377 ?auto_36378 ) ) ( ON ?auto_36376 ?auto_36377 ) ( ON ?auto_36375 ?auto_36376 ) ( CLEAR ?auto_36373 ) ( ON ?auto_36374 ?auto_36375 ) ( CLEAR ?auto_36374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36373 ?auto_36374 )
      ( MAKE-5PILE ?auto_36373 ?auto_36374 ?auto_36375 ?auto_36376 ?auto_36377 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36384 - BLOCK
      ?auto_36385 - BLOCK
      ?auto_36386 - BLOCK
      ?auto_36387 - BLOCK
      ?auto_36388 - BLOCK
    )
    :vars
    (
      ?auto_36389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36388 ?auto_36389 ) ( ON-TABLE ?auto_36384 ) ( not ( = ?auto_36384 ?auto_36385 ) ) ( not ( = ?auto_36384 ?auto_36386 ) ) ( not ( = ?auto_36384 ?auto_36387 ) ) ( not ( = ?auto_36384 ?auto_36388 ) ) ( not ( = ?auto_36384 ?auto_36389 ) ) ( not ( = ?auto_36385 ?auto_36386 ) ) ( not ( = ?auto_36385 ?auto_36387 ) ) ( not ( = ?auto_36385 ?auto_36388 ) ) ( not ( = ?auto_36385 ?auto_36389 ) ) ( not ( = ?auto_36386 ?auto_36387 ) ) ( not ( = ?auto_36386 ?auto_36388 ) ) ( not ( = ?auto_36386 ?auto_36389 ) ) ( not ( = ?auto_36387 ?auto_36388 ) ) ( not ( = ?auto_36387 ?auto_36389 ) ) ( not ( = ?auto_36388 ?auto_36389 ) ) ( ON ?auto_36387 ?auto_36388 ) ( ON ?auto_36386 ?auto_36387 ) ( CLEAR ?auto_36384 ) ( ON ?auto_36385 ?auto_36386 ) ( CLEAR ?auto_36385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36384 ?auto_36385 )
      ( MAKE-5PILE ?auto_36384 ?auto_36385 ?auto_36386 ?auto_36387 ?auto_36388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36395 - BLOCK
      ?auto_36396 - BLOCK
      ?auto_36397 - BLOCK
      ?auto_36398 - BLOCK
      ?auto_36399 - BLOCK
    )
    :vars
    (
      ?auto_36400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36399 ?auto_36400 ) ( not ( = ?auto_36395 ?auto_36396 ) ) ( not ( = ?auto_36395 ?auto_36397 ) ) ( not ( = ?auto_36395 ?auto_36398 ) ) ( not ( = ?auto_36395 ?auto_36399 ) ) ( not ( = ?auto_36395 ?auto_36400 ) ) ( not ( = ?auto_36396 ?auto_36397 ) ) ( not ( = ?auto_36396 ?auto_36398 ) ) ( not ( = ?auto_36396 ?auto_36399 ) ) ( not ( = ?auto_36396 ?auto_36400 ) ) ( not ( = ?auto_36397 ?auto_36398 ) ) ( not ( = ?auto_36397 ?auto_36399 ) ) ( not ( = ?auto_36397 ?auto_36400 ) ) ( not ( = ?auto_36398 ?auto_36399 ) ) ( not ( = ?auto_36398 ?auto_36400 ) ) ( not ( = ?auto_36399 ?auto_36400 ) ) ( ON ?auto_36398 ?auto_36399 ) ( ON ?auto_36397 ?auto_36398 ) ( ON ?auto_36396 ?auto_36397 ) ( ON ?auto_36395 ?auto_36396 ) ( CLEAR ?auto_36395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36395 )
      ( MAKE-5PILE ?auto_36395 ?auto_36396 ?auto_36397 ?auto_36398 ?auto_36399 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_36406 - BLOCK
      ?auto_36407 - BLOCK
      ?auto_36408 - BLOCK
      ?auto_36409 - BLOCK
      ?auto_36410 - BLOCK
    )
    :vars
    (
      ?auto_36411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36410 ?auto_36411 ) ( not ( = ?auto_36406 ?auto_36407 ) ) ( not ( = ?auto_36406 ?auto_36408 ) ) ( not ( = ?auto_36406 ?auto_36409 ) ) ( not ( = ?auto_36406 ?auto_36410 ) ) ( not ( = ?auto_36406 ?auto_36411 ) ) ( not ( = ?auto_36407 ?auto_36408 ) ) ( not ( = ?auto_36407 ?auto_36409 ) ) ( not ( = ?auto_36407 ?auto_36410 ) ) ( not ( = ?auto_36407 ?auto_36411 ) ) ( not ( = ?auto_36408 ?auto_36409 ) ) ( not ( = ?auto_36408 ?auto_36410 ) ) ( not ( = ?auto_36408 ?auto_36411 ) ) ( not ( = ?auto_36409 ?auto_36410 ) ) ( not ( = ?auto_36409 ?auto_36411 ) ) ( not ( = ?auto_36410 ?auto_36411 ) ) ( ON ?auto_36409 ?auto_36410 ) ( ON ?auto_36408 ?auto_36409 ) ( ON ?auto_36407 ?auto_36408 ) ( ON ?auto_36406 ?auto_36407 ) ( CLEAR ?auto_36406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36406 )
      ( MAKE-5PILE ?auto_36406 ?auto_36407 ?auto_36408 ?auto_36409 ?auto_36410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36418 - BLOCK
      ?auto_36419 - BLOCK
      ?auto_36420 - BLOCK
      ?auto_36421 - BLOCK
      ?auto_36422 - BLOCK
      ?auto_36423 - BLOCK
    )
    :vars
    (
      ?auto_36424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36422 ) ( ON ?auto_36423 ?auto_36424 ) ( CLEAR ?auto_36423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36418 ) ( ON ?auto_36419 ?auto_36418 ) ( ON ?auto_36420 ?auto_36419 ) ( ON ?auto_36421 ?auto_36420 ) ( ON ?auto_36422 ?auto_36421 ) ( not ( = ?auto_36418 ?auto_36419 ) ) ( not ( = ?auto_36418 ?auto_36420 ) ) ( not ( = ?auto_36418 ?auto_36421 ) ) ( not ( = ?auto_36418 ?auto_36422 ) ) ( not ( = ?auto_36418 ?auto_36423 ) ) ( not ( = ?auto_36418 ?auto_36424 ) ) ( not ( = ?auto_36419 ?auto_36420 ) ) ( not ( = ?auto_36419 ?auto_36421 ) ) ( not ( = ?auto_36419 ?auto_36422 ) ) ( not ( = ?auto_36419 ?auto_36423 ) ) ( not ( = ?auto_36419 ?auto_36424 ) ) ( not ( = ?auto_36420 ?auto_36421 ) ) ( not ( = ?auto_36420 ?auto_36422 ) ) ( not ( = ?auto_36420 ?auto_36423 ) ) ( not ( = ?auto_36420 ?auto_36424 ) ) ( not ( = ?auto_36421 ?auto_36422 ) ) ( not ( = ?auto_36421 ?auto_36423 ) ) ( not ( = ?auto_36421 ?auto_36424 ) ) ( not ( = ?auto_36422 ?auto_36423 ) ) ( not ( = ?auto_36422 ?auto_36424 ) ) ( not ( = ?auto_36423 ?auto_36424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36423 ?auto_36424 )
      ( !STACK ?auto_36423 ?auto_36422 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36431 - BLOCK
      ?auto_36432 - BLOCK
      ?auto_36433 - BLOCK
      ?auto_36434 - BLOCK
      ?auto_36435 - BLOCK
      ?auto_36436 - BLOCK
    )
    :vars
    (
      ?auto_36437 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36435 ) ( ON ?auto_36436 ?auto_36437 ) ( CLEAR ?auto_36436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36431 ) ( ON ?auto_36432 ?auto_36431 ) ( ON ?auto_36433 ?auto_36432 ) ( ON ?auto_36434 ?auto_36433 ) ( ON ?auto_36435 ?auto_36434 ) ( not ( = ?auto_36431 ?auto_36432 ) ) ( not ( = ?auto_36431 ?auto_36433 ) ) ( not ( = ?auto_36431 ?auto_36434 ) ) ( not ( = ?auto_36431 ?auto_36435 ) ) ( not ( = ?auto_36431 ?auto_36436 ) ) ( not ( = ?auto_36431 ?auto_36437 ) ) ( not ( = ?auto_36432 ?auto_36433 ) ) ( not ( = ?auto_36432 ?auto_36434 ) ) ( not ( = ?auto_36432 ?auto_36435 ) ) ( not ( = ?auto_36432 ?auto_36436 ) ) ( not ( = ?auto_36432 ?auto_36437 ) ) ( not ( = ?auto_36433 ?auto_36434 ) ) ( not ( = ?auto_36433 ?auto_36435 ) ) ( not ( = ?auto_36433 ?auto_36436 ) ) ( not ( = ?auto_36433 ?auto_36437 ) ) ( not ( = ?auto_36434 ?auto_36435 ) ) ( not ( = ?auto_36434 ?auto_36436 ) ) ( not ( = ?auto_36434 ?auto_36437 ) ) ( not ( = ?auto_36435 ?auto_36436 ) ) ( not ( = ?auto_36435 ?auto_36437 ) ) ( not ( = ?auto_36436 ?auto_36437 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36436 ?auto_36437 )
      ( !STACK ?auto_36436 ?auto_36435 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36444 - BLOCK
      ?auto_36445 - BLOCK
      ?auto_36446 - BLOCK
      ?auto_36447 - BLOCK
      ?auto_36448 - BLOCK
      ?auto_36449 - BLOCK
    )
    :vars
    (
      ?auto_36450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36449 ?auto_36450 ) ( ON-TABLE ?auto_36444 ) ( ON ?auto_36445 ?auto_36444 ) ( ON ?auto_36446 ?auto_36445 ) ( ON ?auto_36447 ?auto_36446 ) ( not ( = ?auto_36444 ?auto_36445 ) ) ( not ( = ?auto_36444 ?auto_36446 ) ) ( not ( = ?auto_36444 ?auto_36447 ) ) ( not ( = ?auto_36444 ?auto_36448 ) ) ( not ( = ?auto_36444 ?auto_36449 ) ) ( not ( = ?auto_36444 ?auto_36450 ) ) ( not ( = ?auto_36445 ?auto_36446 ) ) ( not ( = ?auto_36445 ?auto_36447 ) ) ( not ( = ?auto_36445 ?auto_36448 ) ) ( not ( = ?auto_36445 ?auto_36449 ) ) ( not ( = ?auto_36445 ?auto_36450 ) ) ( not ( = ?auto_36446 ?auto_36447 ) ) ( not ( = ?auto_36446 ?auto_36448 ) ) ( not ( = ?auto_36446 ?auto_36449 ) ) ( not ( = ?auto_36446 ?auto_36450 ) ) ( not ( = ?auto_36447 ?auto_36448 ) ) ( not ( = ?auto_36447 ?auto_36449 ) ) ( not ( = ?auto_36447 ?auto_36450 ) ) ( not ( = ?auto_36448 ?auto_36449 ) ) ( not ( = ?auto_36448 ?auto_36450 ) ) ( not ( = ?auto_36449 ?auto_36450 ) ) ( CLEAR ?auto_36447 ) ( ON ?auto_36448 ?auto_36449 ) ( CLEAR ?auto_36448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36444 ?auto_36445 ?auto_36446 ?auto_36447 ?auto_36448 )
      ( MAKE-6PILE ?auto_36444 ?auto_36445 ?auto_36446 ?auto_36447 ?auto_36448 ?auto_36449 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36457 - BLOCK
      ?auto_36458 - BLOCK
      ?auto_36459 - BLOCK
      ?auto_36460 - BLOCK
      ?auto_36461 - BLOCK
      ?auto_36462 - BLOCK
    )
    :vars
    (
      ?auto_36463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36462 ?auto_36463 ) ( ON-TABLE ?auto_36457 ) ( ON ?auto_36458 ?auto_36457 ) ( ON ?auto_36459 ?auto_36458 ) ( ON ?auto_36460 ?auto_36459 ) ( not ( = ?auto_36457 ?auto_36458 ) ) ( not ( = ?auto_36457 ?auto_36459 ) ) ( not ( = ?auto_36457 ?auto_36460 ) ) ( not ( = ?auto_36457 ?auto_36461 ) ) ( not ( = ?auto_36457 ?auto_36462 ) ) ( not ( = ?auto_36457 ?auto_36463 ) ) ( not ( = ?auto_36458 ?auto_36459 ) ) ( not ( = ?auto_36458 ?auto_36460 ) ) ( not ( = ?auto_36458 ?auto_36461 ) ) ( not ( = ?auto_36458 ?auto_36462 ) ) ( not ( = ?auto_36458 ?auto_36463 ) ) ( not ( = ?auto_36459 ?auto_36460 ) ) ( not ( = ?auto_36459 ?auto_36461 ) ) ( not ( = ?auto_36459 ?auto_36462 ) ) ( not ( = ?auto_36459 ?auto_36463 ) ) ( not ( = ?auto_36460 ?auto_36461 ) ) ( not ( = ?auto_36460 ?auto_36462 ) ) ( not ( = ?auto_36460 ?auto_36463 ) ) ( not ( = ?auto_36461 ?auto_36462 ) ) ( not ( = ?auto_36461 ?auto_36463 ) ) ( not ( = ?auto_36462 ?auto_36463 ) ) ( CLEAR ?auto_36460 ) ( ON ?auto_36461 ?auto_36462 ) ( CLEAR ?auto_36461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36457 ?auto_36458 ?auto_36459 ?auto_36460 ?auto_36461 )
      ( MAKE-6PILE ?auto_36457 ?auto_36458 ?auto_36459 ?auto_36460 ?auto_36461 ?auto_36462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36470 - BLOCK
      ?auto_36471 - BLOCK
      ?auto_36472 - BLOCK
      ?auto_36473 - BLOCK
      ?auto_36474 - BLOCK
      ?auto_36475 - BLOCK
    )
    :vars
    (
      ?auto_36476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36475 ?auto_36476 ) ( ON-TABLE ?auto_36470 ) ( ON ?auto_36471 ?auto_36470 ) ( ON ?auto_36472 ?auto_36471 ) ( not ( = ?auto_36470 ?auto_36471 ) ) ( not ( = ?auto_36470 ?auto_36472 ) ) ( not ( = ?auto_36470 ?auto_36473 ) ) ( not ( = ?auto_36470 ?auto_36474 ) ) ( not ( = ?auto_36470 ?auto_36475 ) ) ( not ( = ?auto_36470 ?auto_36476 ) ) ( not ( = ?auto_36471 ?auto_36472 ) ) ( not ( = ?auto_36471 ?auto_36473 ) ) ( not ( = ?auto_36471 ?auto_36474 ) ) ( not ( = ?auto_36471 ?auto_36475 ) ) ( not ( = ?auto_36471 ?auto_36476 ) ) ( not ( = ?auto_36472 ?auto_36473 ) ) ( not ( = ?auto_36472 ?auto_36474 ) ) ( not ( = ?auto_36472 ?auto_36475 ) ) ( not ( = ?auto_36472 ?auto_36476 ) ) ( not ( = ?auto_36473 ?auto_36474 ) ) ( not ( = ?auto_36473 ?auto_36475 ) ) ( not ( = ?auto_36473 ?auto_36476 ) ) ( not ( = ?auto_36474 ?auto_36475 ) ) ( not ( = ?auto_36474 ?auto_36476 ) ) ( not ( = ?auto_36475 ?auto_36476 ) ) ( ON ?auto_36474 ?auto_36475 ) ( CLEAR ?auto_36472 ) ( ON ?auto_36473 ?auto_36474 ) ( CLEAR ?auto_36473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36470 ?auto_36471 ?auto_36472 ?auto_36473 )
      ( MAKE-6PILE ?auto_36470 ?auto_36471 ?auto_36472 ?auto_36473 ?auto_36474 ?auto_36475 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36483 - BLOCK
      ?auto_36484 - BLOCK
      ?auto_36485 - BLOCK
      ?auto_36486 - BLOCK
      ?auto_36487 - BLOCK
      ?auto_36488 - BLOCK
    )
    :vars
    (
      ?auto_36489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36488 ?auto_36489 ) ( ON-TABLE ?auto_36483 ) ( ON ?auto_36484 ?auto_36483 ) ( ON ?auto_36485 ?auto_36484 ) ( not ( = ?auto_36483 ?auto_36484 ) ) ( not ( = ?auto_36483 ?auto_36485 ) ) ( not ( = ?auto_36483 ?auto_36486 ) ) ( not ( = ?auto_36483 ?auto_36487 ) ) ( not ( = ?auto_36483 ?auto_36488 ) ) ( not ( = ?auto_36483 ?auto_36489 ) ) ( not ( = ?auto_36484 ?auto_36485 ) ) ( not ( = ?auto_36484 ?auto_36486 ) ) ( not ( = ?auto_36484 ?auto_36487 ) ) ( not ( = ?auto_36484 ?auto_36488 ) ) ( not ( = ?auto_36484 ?auto_36489 ) ) ( not ( = ?auto_36485 ?auto_36486 ) ) ( not ( = ?auto_36485 ?auto_36487 ) ) ( not ( = ?auto_36485 ?auto_36488 ) ) ( not ( = ?auto_36485 ?auto_36489 ) ) ( not ( = ?auto_36486 ?auto_36487 ) ) ( not ( = ?auto_36486 ?auto_36488 ) ) ( not ( = ?auto_36486 ?auto_36489 ) ) ( not ( = ?auto_36487 ?auto_36488 ) ) ( not ( = ?auto_36487 ?auto_36489 ) ) ( not ( = ?auto_36488 ?auto_36489 ) ) ( ON ?auto_36487 ?auto_36488 ) ( CLEAR ?auto_36485 ) ( ON ?auto_36486 ?auto_36487 ) ( CLEAR ?auto_36486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36483 ?auto_36484 ?auto_36485 ?auto_36486 )
      ( MAKE-6PILE ?auto_36483 ?auto_36484 ?auto_36485 ?auto_36486 ?auto_36487 ?auto_36488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36496 - BLOCK
      ?auto_36497 - BLOCK
      ?auto_36498 - BLOCK
      ?auto_36499 - BLOCK
      ?auto_36500 - BLOCK
      ?auto_36501 - BLOCK
    )
    :vars
    (
      ?auto_36502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36501 ?auto_36502 ) ( ON-TABLE ?auto_36496 ) ( ON ?auto_36497 ?auto_36496 ) ( not ( = ?auto_36496 ?auto_36497 ) ) ( not ( = ?auto_36496 ?auto_36498 ) ) ( not ( = ?auto_36496 ?auto_36499 ) ) ( not ( = ?auto_36496 ?auto_36500 ) ) ( not ( = ?auto_36496 ?auto_36501 ) ) ( not ( = ?auto_36496 ?auto_36502 ) ) ( not ( = ?auto_36497 ?auto_36498 ) ) ( not ( = ?auto_36497 ?auto_36499 ) ) ( not ( = ?auto_36497 ?auto_36500 ) ) ( not ( = ?auto_36497 ?auto_36501 ) ) ( not ( = ?auto_36497 ?auto_36502 ) ) ( not ( = ?auto_36498 ?auto_36499 ) ) ( not ( = ?auto_36498 ?auto_36500 ) ) ( not ( = ?auto_36498 ?auto_36501 ) ) ( not ( = ?auto_36498 ?auto_36502 ) ) ( not ( = ?auto_36499 ?auto_36500 ) ) ( not ( = ?auto_36499 ?auto_36501 ) ) ( not ( = ?auto_36499 ?auto_36502 ) ) ( not ( = ?auto_36500 ?auto_36501 ) ) ( not ( = ?auto_36500 ?auto_36502 ) ) ( not ( = ?auto_36501 ?auto_36502 ) ) ( ON ?auto_36500 ?auto_36501 ) ( ON ?auto_36499 ?auto_36500 ) ( CLEAR ?auto_36497 ) ( ON ?auto_36498 ?auto_36499 ) ( CLEAR ?auto_36498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36496 ?auto_36497 ?auto_36498 )
      ( MAKE-6PILE ?auto_36496 ?auto_36497 ?auto_36498 ?auto_36499 ?auto_36500 ?auto_36501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36509 - BLOCK
      ?auto_36510 - BLOCK
      ?auto_36511 - BLOCK
      ?auto_36512 - BLOCK
      ?auto_36513 - BLOCK
      ?auto_36514 - BLOCK
    )
    :vars
    (
      ?auto_36515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36514 ?auto_36515 ) ( ON-TABLE ?auto_36509 ) ( ON ?auto_36510 ?auto_36509 ) ( not ( = ?auto_36509 ?auto_36510 ) ) ( not ( = ?auto_36509 ?auto_36511 ) ) ( not ( = ?auto_36509 ?auto_36512 ) ) ( not ( = ?auto_36509 ?auto_36513 ) ) ( not ( = ?auto_36509 ?auto_36514 ) ) ( not ( = ?auto_36509 ?auto_36515 ) ) ( not ( = ?auto_36510 ?auto_36511 ) ) ( not ( = ?auto_36510 ?auto_36512 ) ) ( not ( = ?auto_36510 ?auto_36513 ) ) ( not ( = ?auto_36510 ?auto_36514 ) ) ( not ( = ?auto_36510 ?auto_36515 ) ) ( not ( = ?auto_36511 ?auto_36512 ) ) ( not ( = ?auto_36511 ?auto_36513 ) ) ( not ( = ?auto_36511 ?auto_36514 ) ) ( not ( = ?auto_36511 ?auto_36515 ) ) ( not ( = ?auto_36512 ?auto_36513 ) ) ( not ( = ?auto_36512 ?auto_36514 ) ) ( not ( = ?auto_36512 ?auto_36515 ) ) ( not ( = ?auto_36513 ?auto_36514 ) ) ( not ( = ?auto_36513 ?auto_36515 ) ) ( not ( = ?auto_36514 ?auto_36515 ) ) ( ON ?auto_36513 ?auto_36514 ) ( ON ?auto_36512 ?auto_36513 ) ( CLEAR ?auto_36510 ) ( ON ?auto_36511 ?auto_36512 ) ( CLEAR ?auto_36511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36509 ?auto_36510 ?auto_36511 )
      ( MAKE-6PILE ?auto_36509 ?auto_36510 ?auto_36511 ?auto_36512 ?auto_36513 ?auto_36514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36522 - BLOCK
      ?auto_36523 - BLOCK
      ?auto_36524 - BLOCK
      ?auto_36525 - BLOCK
      ?auto_36526 - BLOCK
      ?auto_36527 - BLOCK
    )
    :vars
    (
      ?auto_36528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36527 ?auto_36528 ) ( ON-TABLE ?auto_36522 ) ( not ( = ?auto_36522 ?auto_36523 ) ) ( not ( = ?auto_36522 ?auto_36524 ) ) ( not ( = ?auto_36522 ?auto_36525 ) ) ( not ( = ?auto_36522 ?auto_36526 ) ) ( not ( = ?auto_36522 ?auto_36527 ) ) ( not ( = ?auto_36522 ?auto_36528 ) ) ( not ( = ?auto_36523 ?auto_36524 ) ) ( not ( = ?auto_36523 ?auto_36525 ) ) ( not ( = ?auto_36523 ?auto_36526 ) ) ( not ( = ?auto_36523 ?auto_36527 ) ) ( not ( = ?auto_36523 ?auto_36528 ) ) ( not ( = ?auto_36524 ?auto_36525 ) ) ( not ( = ?auto_36524 ?auto_36526 ) ) ( not ( = ?auto_36524 ?auto_36527 ) ) ( not ( = ?auto_36524 ?auto_36528 ) ) ( not ( = ?auto_36525 ?auto_36526 ) ) ( not ( = ?auto_36525 ?auto_36527 ) ) ( not ( = ?auto_36525 ?auto_36528 ) ) ( not ( = ?auto_36526 ?auto_36527 ) ) ( not ( = ?auto_36526 ?auto_36528 ) ) ( not ( = ?auto_36527 ?auto_36528 ) ) ( ON ?auto_36526 ?auto_36527 ) ( ON ?auto_36525 ?auto_36526 ) ( ON ?auto_36524 ?auto_36525 ) ( CLEAR ?auto_36522 ) ( ON ?auto_36523 ?auto_36524 ) ( CLEAR ?auto_36523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36522 ?auto_36523 )
      ( MAKE-6PILE ?auto_36522 ?auto_36523 ?auto_36524 ?auto_36525 ?auto_36526 ?auto_36527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36535 - BLOCK
      ?auto_36536 - BLOCK
      ?auto_36537 - BLOCK
      ?auto_36538 - BLOCK
      ?auto_36539 - BLOCK
      ?auto_36540 - BLOCK
    )
    :vars
    (
      ?auto_36541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36540 ?auto_36541 ) ( ON-TABLE ?auto_36535 ) ( not ( = ?auto_36535 ?auto_36536 ) ) ( not ( = ?auto_36535 ?auto_36537 ) ) ( not ( = ?auto_36535 ?auto_36538 ) ) ( not ( = ?auto_36535 ?auto_36539 ) ) ( not ( = ?auto_36535 ?auto_36540 ) ) ( not ( = ?auto_36535 ?auto_36541 ) ) ( not ( = ?auto_36536 ?auto_36537 ) ) ( not ( = ?auto_36536 ?auto_36538 ) ) ( not ( = ?auto_36536 ?auto_36539 ) ) ( not ( = ?auto_36536 ?auto_36540 ) ) ( not ( = ?auto_36536 ?auto_36541 ) ) ( not ( = ?auto_36537 ?auto_36538 ) ) ( not ( = ?auto_36537 ?auto_36539 ) ) ( not ( = ?auto_36537 ?auto_36540 ) ) ( not ( = ?auto_36537 ?auto_36541 ) ) ( not ( = ?auto_36538 ?auto_36539 ) ) ( not ( = ?auto_36538 ?auto_36540 ) ) ( not ( = ?auto_36538 ?auto_36541 ) ) ( not ( = ?auto_36539 ?auto_36540 ) ) ( not ( = ?auto_36539 ?auto_36541 ) ) ( not ( = ?auto_36540 ?auto_36541 ) ) ( ON ?auto_36539 ?auto_36540 ) ( ON ?auto_36538 ?auto_36539 ) ( ON ?auto_36537 ?auto_36538 ) ( CLEAR ?auto_36535 ) ( ON ?auto_36536 ?auto_36537 ) ( CLEAR ?auto_36536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36535 ?auto_36536 )
      ( MAKE-6PILE ?auto_36535 ?auto_36536 ?auto_36537 ?auto_36538 ?auto_36539 ?auto_36540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36548 - BLOCK
      ?auto_36549 - BLOCK
      ?auto_36550 - BLOCK
      ?auto_36551 - BLOCK
      ?auto_36552 - BLOCK
      ?auto_36553 - BLOCK
    )
    :vars
    (
      ?auto_36554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36553 ?auto_36554 ) ( not ( = ?auto_36548 ?auto_36549 ) ) ( not ( = ?auto_36548 ?auto_36550 ) ) ( not ( = ?auto_36548 ?auto_36551 ) ) ( not ( = ?auto_36548 ?auto_36552 ) ) ( not ( = ?auto_36548 ?auto_36553 ) ) ( not ( = ?auto_36548 ?auto_36554 ) ) ( not ( = ?auto_36549 ?auto_36550 ) ) ( not ( = ?auto_36549 ?auto_36551 ) ) ( not ( = ?auto_36549 ?auto_36552 ) ) ( not ( = ?auto_36549 ?auto_36553 ) ) ( not ( = ?auto_36549 ?auto_36554 ) ) ( not ( = ?auto_36550 ?auto_36551 ) ) ( not ( = ?auto_36550 ?auto_36552 ) ) ( not ( = ?auto_36550 ?auto_36553 ) ) ( not ( = ?auto_36550 ?auto_36554 ) ) ( not ( = ?auto_36551 ?auto_36552 ) ) ( not ( = ?auto_36551 ?auto_36553 ) ) ( not ( = ?auto_36551 ?auto_36554 ) ) ( not ( = ?auto_36552 ?auto_36553 ) ) ( not ( = ?auto_36552 ?auto_36554 ) ) ( not ( = ?auto_36553 ?auto_36554 ) ) ( ON ?auto_36552 ?auto_36553 ) ( ON ?auto_36551 ?auto_36552 ) ( ON ?auto_36550 ?auto_36551 ) ( ON ?auto_36549 ?auto_36550 ) ( ON ?auto_36548 ?auto_36549 ) ( CLEAR ?auto_36548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36548 )
      ( MAKE-6PILE ?auto_36548 ?auto_36549 ?auto_36550 ?auto_36551 ?auto_36552 ?auto_36553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_36561 - BLOCK
      ?auto_36562 - BLOCK
      ?auto_36563 - BLOCK
      ?auto_36564 - BLOCK
      ?auto_36565 - BLOCK
      ?auto_36566 - BLOCK
    )
    :vars
    (
      ?auto_36567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36566 ?auto_36567 ) ( not ( = ?auto_36561 ?auto_36562 ) ) ( not ( = ?auto_36561 ?auto_36563 ) ) ( not ( = ?auto_36561 ?auto_36564 ) ) ( not ( = ?auto_36561 ?auto_36565 ) ) ( not ( = ?auto_36561 ?auto_36566 ) ) ( not ( = ?auto_36561 ?auto_36567 ) ) ( not ( = ?auto_36562 ?auto_36563 ) ) ( not ( = ?auto_36562 ?auto_36564 ) ) ( not ( = ?auto_36562 ?auto_36565 ) ) ( not ( = ?auto_36562 ?auto_36566 ) ) ( not ( = ?auto_36562 ?auto_36567 ) ) ( not ( = ?auto_36563 ?auto_36564 ) ) ( not ( = ?auto_36563 ?auto_36565 ) ) ( not ( = ?auto_36563 ?auto_36566 ) ) ( not ( = ?auto_36563 ?auto_36567 ) ) ( not ( = ?auto_36564 ?auto_36565 ) ) ( not ( = ?auto_36564 ?auto_36566 ) ) ( not ( = ?auto_36564 ?auto_36567 ) ) ( not ( = ?auto_36565 ?auto_36566 ) ) ( not ( = ?auto_36565 ?auto_36567 ) ) ( not ( = ?auto_36566 ?auto_36567 ) ) ( ON ?auto_36565 ?auto_36566 ) ( ON ?auto_36564 ?auto_36565 ) ( ON ?auto_36563 ?auto_36564 ) ( ON ?auto_36562 ?auto_36563 ) ( ON ?auto_36561 ?auto_36562 ) ( CLEAR ?auto_36561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36561 )
      ( MAKE-6PILE ?auto_36561 ?auto_36562 ?auto_36563 ?auto_36564 ?auto_36565 ?auto_36566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36575 - BLOCK
      ?auto_36576 - BLOCK
      ?auto_36577 - BLOCK
      ?auto_36578 - BLOCK
      ?auto_36579 - BLOCK
      ?auto_36580 - BLOCK
      ?auto_36581 - BLOCK
    )
    :vars
    (
      ?auto_36582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36580 ) ( ON ?auto_36581 ?auto_36582 ) ( CLEAR ?auto_36581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36575 ) ( ON ?auto_36576 ?auto_36575 ) ( ON ?auto_36577 ?auto_36576 ) ( ON ?auto_36578 ?auto_36577 ) ( ON ?auto_36579 ?auto_36578 ) ( ON ?auto_36580 ?auto_36579 ) ( not ( = ?auto_36575 ?auto_36576 ) ) ( not ( = ?auto_36575 ?auto_36577 ) ) ( not ( = ?auto_36575 ?auto_36578 ) ) ( not ( = ?auto_36575 ?auto_36579 ) ) ( not ( = ?auto_36575 ?auto_36580 ) ) ( not ( = ?auto_36575 ?auto_36581 ) ) ( not ( = ?auto_36575 ?auto_36582 ) ) ( not ( = ?auto_36576 ?auto_36577 ) ) ( not ( = ?auto_36576 ?auto_36578 ) ) ( not ( = ?auto_36576 ?auto_36579 ) ) ( not ( = ?auto_36576 ?auto_36580 ) ) ( not ( = ?auto_36576 ?auto_36581 ) ) ( not ( = ?auto_36576 ?auto_36582 ) ) ( not ( = ?auto_36577 ?auto_36578 ) ) ( not ( = ?auto_36577 ?auto_36579 ) ) ( not ( = ?auto_36577 ?auto_36580 ) ) ( not ( = ?auto_36577 ?auto_36581 ) ) ( not ( = ?auto_36577 ?auto_36582 ) ) ( not ( = ?auto_36578 ?auto_36579 ) ) ( not ( = ?auto_36578 ?auto_36580 ) ) ( not ( = ?auto_36578 ?auto_36581 ) ) ( not ( = ?auto_36578 ?auto_36582 ) ) ( not ( = ?auto_36579 ?auto_36580 ) ) ( not ( = ?auto_36579 ?auto_36581 ) ) ( not ( = ?auto_36579 ?auto_36582 ) ) ( not ( = ?auto_36580 ?auto_36581 ) ) ( not ( = ?auto_36580 ?auto_36582 ) ) ( not ( = ?auto_36581 ?auto_36582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36581 ?auto_36582 )
      ( !STACK ?auto_36581 ?auto_36580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36590 - BLOCK
      ?auto_36591 - BLOCK
      ?auto_36592 - BLOCK
      ?auto_36593 - BLOCK
      ?auto_36594 - BLOCK
      ?auto_36595 - BLOCK
      ?auto_36596 - BLOCK
    )
    :vars
    (
      ?auto_36597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36595 ) ( ON ?auto_36596 ?auto_36597 ) ( CLEAR ?auto_36596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36590 ) ( ON ?auto_36591 ?auto_36590 ) ( ON ?auto_36592 ?auto_36591 ) ( ON ?auto_36593 ?auto_36592 ) ( ON ?auto_36594 ?auto_36593 ) ( ON ?auto_36595 ?auto_36594 ) ( not ( = ?auto_36590 ?auto_36591 ) ) ( not ( = ?auto_36590 ?auto_36592 ) ) ( not ( = ?auto_36590 ?auto_36593 ) ) ( not ( = ?auto_36590 ?auto_36594 ) ) ( not ( = ?auto_36590 ?auto_36595 ) ) ( not ( = ?auto_36590 ?auto_36596 ) ) ( not ( = ?auto_36590 ?auto_36597 ) ) ( not ( = ?auto_36591 ?auto_36592 ) ) ( not ( = ?auto_36591 ?auto_36593 ) ) ( not ( = ?auto_36591 ?auto_36594 ) ) ( not ( = ?auto_36591 ?auto_36595 ) ) ( not ( = ?auto_36591 ?auto_36596 ) ) ( not ( = ?auto_36591 ?auto_36597 ) ) ( not ( = ?auto_36592 ?auto_36593 ) ) ( not ( = ?auto_36592 ?auto_36594 ) ) ( not ( = ?auto_36592 ?auto_36595 ) ) ( not ( = ?auto_36592 ?auto_36596 ) ) ( not ( = ?auto_36592 ?auto_36597 ) ) ( not ( = ?auto_36593 ?auto_36594 ) ) ( not ( = ?auto_36593 ?auto_36595 ) ) ( not ( = ?auto_36593 ?auto_36596 ) ) ( not ( = ?auto_36593 ?auto_36597 ) ) ( not ( = ?auto_36594 ?auto_36595 ) ) ( not ( = ?auto_36594 ?auto_36596 ) ) ( not ( = ?auto_36594 ?auto_36597 ) ) ( not ( = ?auto_36595 ?auto_36596 ) ) ( not ( = ?auto_36595 ?auto_36597 ) ) ( not ( = ?auto_36596 ?auto_36597 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36596 ?auto_36597 )
      ( !STACK ?auto_36596 ?auto_36595 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36605 - BLOCK
      ?auto_36606 - BLOCK
      ?auto_36607 - BLOCK
      ?auto_36608 - BLOCK
      ?auto_36609 - BLOCK
      ?auto_36610 - BLOCK
      ?auto_36611 - BLOCK
    )
    :vars
    (
      ?auto_36612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36611 ?auto_36612 ) ( ON-TABLE ?auto_36605 ) ( ON ?auto_36606 ?auto_36605 ) ( ON ?auto_36607 ?auto_36606 ) ( ON ?auto_36608 ?auto_36607 ) ( ON ?auto_36609 ?auto_36608 ) ( not ( = ?auto_36605 ?auto_36606 ) ) ( not ( = ?auto_36605 ?auto_36607 ) ) ( not ( = ?auto_36605 ?auto_36608 ) ) ( not ( = ?auto_36605 ?auto_36609 ) ) ( not ( = ?auto_36605 ?auto_36610 ) ) ( not ( = ?auto_36605 ?auto_36611 ) ) ( not ( = ?auto_36605 ?auto_36612 ) ) ( not ( = ?auto_36606 ?auto_36607 ) ) ( not ( = ?auto_36606 ?auto_36608 ) ) ( not ( = ?auto_36606 ?auto_36609 ) ) ( not ( = ?auto_36606 ?auto_36610 ) ) ( not ( = ?auto_36606 ?auto_36611 ) ) ( not ( = ?auto_36606 ?auto_36612 ) ) ( not ( = ?auto_36607 ?auto_36608 ) ) ( not ( = ?auto_36607 ?auto_36609 ) ) ( not ( = ?auto_36607 ?auto_36610 ) ) ( not ( = ?auto_36607 ?auto_36611 ) ) ( not ( = ?auto_36607 ?auto_36612 ) ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36610 ) ) ( not ( = ?auto_36608 ?auto_36611 ) ) ( not ( = ?auto_36608 ?auto_36612 ) ) ( not ( = ?auto_36609 ?auto_36610 ) ) ( not ( = ?auto_36609 ?auto_36611 ) ) ( not ( = ?auto_36609 ?auto_36612 ) ) ( not ( = ?auto_36610 ?auto_36611 ) ) ( not ( = ?auto_36610 ?auto_36612 ) ) ( not ( = ?auto_36611 ?auto_36612 ) ) ( CLEAR ?auto_36609 ) ( ON ?auto_36610 ?auto_36611 ) ( CLEAR ?auto_36610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36605 ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36609 ?auto_36610 )
      ( MAKE-7PILE ?auto_36605 ?auto_36606 ?auto_36607 ?auto_36608 ?auto_36609 ?auto_36610 ?auto_36611 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36620 - BLOCK
      ?auto_36621 - BLOCK
      ?auto_36622 - BLOCK
      ?auto_36623 - BLOCK
      ?auto_36624 - BLOCK
      ?auto_36625 - BLOCK
      ?auto_36626 - BLOCK
    )
    :vars
    (
      ?auto_36627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36626 ?auto_36627 ) ( ON-TABLE ?auto_36620 ) ( ON ?auto_36621 ?auto_36620 ) ( ON ?auto_36622 ?auto_36621 ) ( ON ?auto_36623 ?auto_36622 ) ( ON ?auto_36624 ?auto_36623 ) ( not ( = ?auto_36620 ?auto_36621 ) ) ( not ( = ?auto_36620 ?auto_36622 ) ) ( not ( = ?auto_36620 ?auto_36623 ) ) ( not ( = ?auto_36620 ?auto_36624 ) ) ( not ( = ?auto_36620 ?auto_36625 ) ) ( not ( = ?auto_36620 ?auto_36626 ) ) ( not ( = ?auto_36620 ?auto_36627 ) ) ( not ( = ?auto_36621 ?auto_36622 ) ) ( not ( = ?auto_36621 ?auto_36623 ) ) ( not ( = ?auto_36621 ?auto_36624 ) ) ( not ( = ?auto_36621 ?auto_36625 ) ) ( not ( = ?auto_36621 ?auto_36626 ) ) ( not ( = ?auto_36621 ?auto_36627 ) ) ( not ( = ?auto_36622 ?auto_36623 ) ) ( not ( = ?auto_36622 ?auto_36624 ) ) ( not ( = ?auto_36622 ?auto_36625 ) ) ( not ( = ?auto_36622 ?auto_36626 ) ) ( not ( = ?auto_36622 ?auto_36627 ) ) ( not ( = ?auto_36623 ?auto_36624 ) ) ( not ( = ?auto_36623 ?auto_36625 ) ) ( not ( = ?auto_36623 ?auto_36626 ) ) ( not ( = ?auto_36623 ?auto_36627 ) ) ( not ( = ?auto_36624 ?auto_36625 ) ) ( not ( = ?auto_36624 ?auto_36626 ) ) ( not ( = ?auto_36624 ?auto_36627 ) ) ( not ( = ?auto_36625 ?auto_36626 ) ) ( not ( = ?auto_36625 ?auto_36627 ) ) ( not ( = ?auto_36626 ?auto_36627 ) ) ( CLEAR ?auto_36624 ) ( ON ?auto_36625 ?auto_36626 ) ( CLEAR ?auto_36625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36620 ?auto_36621 ?auto_36622 ?auto_36623 ?auto_36624 ?auto_36625 )
      ( MAKE-7PILE ?auto_36620 ?auto_36621 ?auto_36622 ?auto_36623 ?auto_36624 ?auto_36625 ?auto_36626 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36635 - BLOCK
      ?auto_36636 - BLOCK
      ?auto_36637 - BLOCK
      ?auto_36638 - BLOCK
      ?auto_36639 - BLOCK
      ?auto_36640 - BLOCK
      ?auto_36641 - BLOCK
    )
    :vars
    (
      ?auto_36642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36641 ?auto_36642 ) ( ON-TABLE ?auto_36635 ) ( ON ?auto_36636 ?auto_36635 ) ( ON ?auto_36637 ?auto_36636 ) ( ON ?auto_36638 ?auto_36637 ) ( not ( = ?auto_36635 ?auto_36636 ) ) ( not ( = ?auto_36635 ?auto_36637 ) ) ( not ( = ?auto_36635 ?auto_36638 ) ) ( not ( = ?auto_36635 ?auto_36639 ) ) ( not ( = ?auto_36635 ?auto_36640 ) ) ( not ( = ?auto_36635 ?auto_36641 ) ) ( not ( = ?auto_36635 ?auto_36642 ) ) ( not ( = ?auto_36636 ?auto_36637 ) ) ( not ( = ?auto_36636 ?auto_36638 ) ) ( not ( = ?auto_36636 ?auto_36639 ) ) ( not ( = ?auto_36636 ?auto_36640 ) ) ( not ( = ?auto_36636 ?auto_36641 ) ) ( not ( = ?auto_36636 ?auto_36642 ) ) ( not ( = ?auto_36637 ?auto_36638 ) ) ( not ( = ?auto_36637 ?auto_36639 ) ) ( not ( = ?auto_36637 ?auto_36640 ) ) ( not ( = ?auto_36637 ?auto_36641 ) ) ( not ( = ?auto_36637 ?auto_36642 ) ) ( not ( = ?auto_36638 ?auto_36639 ) ) ( not ( = ?auto_36638 ?auto_36640 ) ) ( not ( = ?auto_36638 ?auto_36641 ) ) ( not ( = ?auto_36638 ?auto_36642 ) ) ( not ( = ?auto_36639 ?auto_36640 ) ) ( not ( = ?auto_36639 ?auto_36641 ) ) ( not ( = ?auto_36639 ?auto_36642 ) ) ( not ( = ?auto_36640 ?auto_36641 ) ) ( not ( = ?auto_36640 ?auto_36642 ) ) ( not ( = ?auto_36641 ?auto_36642 ) ) ( ON ?auto_36640 ?auto_36641 ) ( CLEAR ?auto_36638 ) ( ON ?auto_36639 ?auto_36640 ) ( CLEAR ?auto_36639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36635 ?auto_36636 ?auto_36637 ?auto_36638 ?auto_36639 )
      ( MAKE-7PILE ?auto_36635 ?auto_36636 ?auto_36637 ?auto_36638 ?auto_36639 ?auto_36640 ?auto_36641 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36650 - BLOCK
      ?auto_36651 - BLOCK
      ?auto_36652 - BLOCK
      ?auto_36653 - BLOCK
      ?auto_36654 - BLOCK
      ?auto_36655 - BLOCK
      ?auto_36656 - BLOCK
    )
    :vars
    (
      ?auto_36657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36656 ?auto_36657 ) ( ON-TABLE ?auto_36650 ) ( ON ?auto_36651 ?auto_36650 ) ( ON ?auto_36652 ?auto_36651 ) ( ON ?auto_36653 ?auto_36652 ) ( not ( = ?auto_36650 ?auto_36651 ) ) ( not ( = ?auto_36650 ?auto_36652 ) ) ( not ( = ?auto_36650 ?auto_36653 ) ) ( not ( = ?auto_36650 ?auto_36654 ) ) ( not ( = ?auto_36650 ?auto_36655 ) ) ( not ( = ?auto_36650 ?auto_36656 ) ) ( not ( = ?auto_36650 ?auto_36657 ) ) ( not ( = ?auto_36651 ?auto_36652 ) ) ( not ( = ?auto_36651 ?auto_36653 ) ) ( not ( = ?auto_36651 ?auto_36654 ) ) ( not ( = ?auto_36651 ?auto_36655 ) ) ( not ( = ?auto_36651 ?auto_36656 ) ) ( not ( = ?auto_36651 ?auto_36657 ) ) ( not ( = ?auto_36652 ?auto_36653 ) ) ( not ( = ?auto_36652 ?auto_36654 ) ) ( not ( = ?auto_36652 ?auto_36655 ) ) ( not ( = ?auto_36652 ?auto_36656 ) ) ( not ( = ?auto_36652 ?auto_36657 ) ) ( not ( = ?auto_36653 ?auto_36654 ) ) ( not ( = ?auto_36653 ?auto_36655 ) ) ( not ( = ?auto_36653 ?auto_36656 ) ) ( not ( = ?auto_36653 ?auto_36657 ) ) ( not ( = ?auto_36654 ?auto_36655 ) ) ( not ( = ?auto_36654 ?auto_36656 ) ) ( not ( = ?auto_36654 ?auto_36657 ) ) ( not ( = ?auto_36655 ?auto_36656 ) ) ( not ( = ?auto_36655 ?auto_36657 ) ) ( not ( = ?auto_36656 ?auto_36657 ) ) ( ON ?auto_36655 ?auto_36656 ) ( CLEAR ?auto_36653 ) ( ON ?auto_36654 ?auto_36655 ) ( CLEAR ?auto_36654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36650 ?auto_36651 ?auto_36652 ?auto_36653 ?auto_36654 )
      ( MAKE-7PILE ?auto_36650 ?auto_36651 ?auto_36652 ?auto_36653 ?auto_36654 ?auto_36655 ?auto_36656 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36665 - BLOCK
      ?auto_36666 - BLOCK
      ?auto_36667 - BLOCK
      ?auto_36668 - BLOCK
      ?auto_36669 - BLOCK
      ?auto_36670 - BLOCK
      ?auto_36671 - BLOCK
    )
    :vars
    (
      ?auto_36672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36671 ?auto_36672 ) ( ON-TABLE ?auto_36665 ) ( ON ?auto_36666 ?auto_36665 ) ( ON ?auto_36667 ?auto_36666 ) ( not ( = ?auto_36665 ?auto_36666 ) ) ( not ( = ?auto_36665 ?auto_36667 ) ) ( not ( = ?auto_36665 ?auto_36668 ) ) ( not ( = ?auto_36665 ?auto_36669 ) ) ( not ( = ?auto_36665 ?auto_36670 ) ) ( not ( = ?auto_36665 ?auto_36671 ) ) ( not ( = ?auto_36665 ?auto_36672 ) ) ( not ( = ?auto_36666 ?auto_36667 ) ) ( not ( = ?auto_36666 ?auto_36668 ) ) ( not ( = ?auto_36666 ?auto_36669 ) ) ( not ( = ?auto_36666 ?auto_36670 ) ) ( not ( = ?auto_36666 ?auto_36671 ) ) ( not ( = ?auto_36666 ?auto_36672 ) ) ( not ( = ?auto_36667 ?auto_36668 ) ) ( not ( = ?auto_36667 ?auto_36669 ) ) ( not ( = ?auto_36667 ?auto_36670 ) ) ( not ( = ?auto_36667 ?auto_36671 ) ) ( not ( = ?auto_36667 ?auto_36672 ) ) ( not ( = ?auto_36668 ?auto_36669 ) ) ( not ( = ?auto_36668 ?auto_36670 ) ) ( not ( = ?auto_36668 ?auto_36671 ) ) ( not ( = ?auto_36668 ?auto_36672 ) ) ( not ( = ?auto_36669 ?auto_36670 ) ) ( not ( = ?auto_36669 ?auto_36671 ) ) ( not ( = ?auto_36669 ?auto_36672 ) ) ( not ( = ?auto_36670 ?auto_36671 ) ) ( not ( = ?auto_36670 ?auto_36672 ) ) ( not ( = ?auto_36671 ?auto_36672 ) ) ( ON ?auto_36670 ?auto_36671 ) ( ON ?auto_36669 ?auto_36670 ) ( CLEAR ?auto_36667 ) ( ON ?auto_36668 ?auto_36669 ) ( CLEAR ?auto_36668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36665 ?auto_36666 ?auto_36667 ?auto_36668 )
      ( MAKE-7PILE ?auto_36665 ?auto_36666 ?auto_36667 ?auto_36668 ?auto_36669 ?auto_36670 ?auto_36671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36680 - BLOCK
      ?auto_36681 - BLOCK
      ?auto_36682 - BLOCK
      ?auto_36683 - BLOCK
      ?auto_36684 - BLOCK
      ?auto_36685 - BLOCK
      ?auto_36686 - BLOCK
    )
    :vars
    (
      ?auto_36687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36686 ?auto_36687 ) ( ON-TABLE ?auto_36680 ) ( ON ?auto_36681 ?auto_36680 ) ( ON ?auto_36682 ?auto_36681 ) ( not ( = ?auto_36680 ?auto_36681 ) ) ( not ( = ?auto_36680 ?auto_36682 ) ) ( not ( = ?auto_36680 ?auto_36683 ) ) ( not ( = ?auto_36680 ?auto_36684 ) ) ( not ( = ?auto_36680 ?auto_36685 ) ) ( not ( = ?auto_36680 ?auto_36686 ) ) ( not ( = ?auto_36680 ?auto_36687 ) ) ( not ( = ?auto_36681 ?auto_36682 ) ) ( not ( = ?auto_36681 ?auto_36683 ) ) ( not ( = ?auto_36681 ?auto_36684 ) ) ( not ( = ?auto_36681 ?auto_36685 ) ) ( not ( = ?auto_36681 ?auto_36686 ) ) ( not ( = ?auto_36681 ?auto_36687 ) ) ( not ( = ?auto_36682 ?auto_36683 ) ) ( not ( = ?auto_36682 ?auto_36684 ) ) ( not ( = ?auto_36682 ?auto_36685 ) ) ( not ( = ?auto_36682 ?auto_36686 ) ) ( not ( = ?auto_36682 ?auto_36687 ) ) ( not ( = ?auto_36683 ?auto_36684 ) ) ( not ( = ?auto_36683 ?auto_36685 ) ) ( not ( = ?auto_36683 ?auto_36686 ) ) ( not ( = ?auto_36683 ?auto_36687 ) ) ( not ( = ?auto_36684 ?auto_36685 ) ) ( not ( = ?auto_36684 ?auto_36686 ) ) ( not ( = ?auto_36684 ?auto_36687 ) ) ( not ( = ?auto_36685 ?auto_36686 ) ) ( not ( = ?auto_36685 ?auto_36687 ) ) ( not ( = ?auto_36686 ?auto_36687 ) ) ( ON ?auto_36685 ?auto_36686 ) ( ON ?auto_36684 ?auto_36685 ) ( CLEAR ?auto_36682 ) ( ON ?auto_36683 ?auto_36684 ) ( CLEAR ?auto_36683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36680 ?auto_36681 ?auto_36682 ?auto_36683 )
      ( MAKE-7PILE ?auto_36680 ?auto_36681 ?auto_36682 ?auto_36683 ?auto_36684 ?auto_36685 ?auto_36686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36695 - BLOCK
      ?auto_36696 - BLOCK
      ?auto_36697 - BLOCK
      ?auto_36698 - BLOCK
      ?auto_36699 - BLOCK
      ?auto_36700 - BLOCK
      ?auto_36701 - BLOCK
    )
    :vars
    (
      ?auto_36702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36701 ?auto_36702 ) ( ON-TABLE ?auto_36695 ) ( ON ?auto_36696 ?auto_36695 ) ( not ( = ?auto_36695 ?auto_36696 ) ) ( not ( = ?auto_36695 ?auto_36697 ) ) ( not ( = ?auto_36695 ?auto_36698 ) ) ( not ( = ?auto_36695 ?auto_36699 ) ) ( not ( = ?auto_36695 ?auto_36700 ) ) ( not ( = ?auto_36695 ?auto_36701 ) ) ( not ( = ?auto_36695 ?auto_36702 ) ) ( not ( = ?auto_36696 ?auto_36697 ) ) ( not ( = ?auto_36696 ?auto_36698 ) ) ( not ( = ?auto_36696 ?auto_36699 ) ) ( not ( = ?auto_36696 ?auto_36700 ) ) ( not ( = ?auto_36696 ?auto_36701 ) ) ( not ( = ?auto_36696 ?auto_36702 ) ) ( not ( = ?auto_36697 ?auto_36698 ) ) ( not ( = ?auto_36697 ?auto_36699 ) ) ( not ( = ?auto_36697 ?auto_36700 ) ) ( not ( = ?auto_36697 ?auto_36701 ) ) ( not ( = ?auto_36697 ?auto_36702 ) ) ( not ( = ?auto_36698 ?auto_36699 ) ) ( not ( = ?auto_36698 ?auto_36700 ) ) ( not ( = ?auto_36698 ?auto_36701 ) ) ( not ( = ?auto_36698 ?auto_36702 ) ) ( not ( = ?auto_36699 ?auto_36700 ) ) ( not ( = ?auto_36699 ?auto_36701 ) ) ( not ( = ?auto_36699 ?auto_36702 ) ) ( not ( = ?auto_36700 ?auto_36701 ) ) ( not ( = ?auto_36700 ?auto_36702 ) ) ( not ( = ?auto_36701 ?auto_36702 ) ) ( ON ?auto_36700 ?auto_36701 ) ( ON ?auto_36699 ?auto_36700 ) ( ON ?auto_36698 ?auto_36699 ) ( CLEAR ?auto_36696 ) ( ON ?auto_36697 ?auto_36698 ) ( CLEAR ?auto_36697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36695 ?auto_36696 ?auto_36697 )
      ( MAKE-7PILE ?auto_36695 ?auto_36696 ?auto_36697 ?auto_36698 ?auto_36699 ?auto_36700 ?auto_36701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36710 - BLOCK
      ?auto_36711 - BLOCK
      ?auto_36712 - BLOCK
      ?auto_36713 - BLOCK
      ?auto_36714 - BLOCK
      ?auto_36715 - BLOCK
      ?auto_36716 - BLOCK
    )
    :vars
    (
      ?auto_36717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36716 ?auto_36717 ) ( ON-TABLE ?auto_36710 ) ( ON ?auto_36711 ?auto_36710 ) ( not ( = ?auto_36710 ?auto_36711 ) ) ( not ( = ?auto_36710 ?auto_36712 ) ) ( not ( = ?auto_36710 ?auto_36713 ) ) ( not ( = ?auto_36710 ?auto_36714 ) ) ( not ( = ?auto_36710 ?auto_36715 ) ) ( not ( = ?auto_36710 ?auto_36716 ) ) ( not ( = ?auto_36710 ?auto_36717 ) ) ( not ( = ?auto_36711 ?auto_36712 ) ) ( not ( = ?auto_36711 ?auto_36713 ) ) ( not ( = ?auto_36711 ?auto_36714 ) ) ( not ( = ?auto_36711 ?auto_36715 ) ) ( not ( = ?auto_36711 ?auto_36716 ) ) ( not ( = ?auto_36711 ?auto_36717 ) ) ( not ( = ?auto_36712 ?auto_36713 ) ) ( not ( = ?auto_36712 ?auto_36714 ) ) ( not ( = ?auto_36712 ?auto_36715 ) ) ( not ( = ?auto_36712 ?auto_36716 ) ) ( not ( = ?auto_36712 ?auto_36717 ) ) ( not ( = ?auto_36713 ?auto_36714 ) ) ( not ( = ?auto_36713 ?auto_36715 ) ) ( not ( = ?auto_36713 ?auto_36716 ) ) ( not ( = ?auto_36713 ?auto_36717 ) ) ( not ( = ?auto_36714 ?auto_36715 ) ) ( not ( = ?auto_36714 ?auto_36716 ) ) ( not ( = ?auto_36714 ?auto_36717 ) ) ( not ( = ?auto_36715 ?auto_36716 ) ) ( not ( = ?auto_36715 ?auto_36717 ) ) ( not ( = ?auto_36716 ?auto_36717 ) ) ( ON ?auto_36715 ?auto_36716 ) ( ON ?auto_36714 ?auto_36715 ) ( ON ?auto_36713 ?auto_36714 ) ( CLEAR ?auto_36711 ) ( ON ?auto_36712 ?auto_36713 ) ( CLEAR ?auto_36712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36710 ?auto_36711 ?auto_36712 )
      ( MAKE-7PILE ?auto_36710 ?auto_36711 ?auto_36712 ?auto_36713 ?auto_36714 ?auto_36715 ?auto_36716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36725 - BLOCK
      ?auto_36726 - BLOCK
      ?auto_36727 - BLOCK
      ?auto_36728 - BLOCK
      ?auto_36729 - BLOCK
      ?auto_36730 - BLOCK
      ?auto_36731 - BLOCK
    )
    :vars
    (
      ?auto_36732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36731 ?auto_36732 ) ( ON-TABLE ?auto_36725 ) ( not ( = ?auto_36725 ?auto_36726 ) ) ( not ( = ?auto_36725 ?auto_36727 ) ) ( not ( = ?auto_36725 ?auto_36728 ) ) ( not ( = ?auto_36725 ?auto_36729 ) ) ( not ( = ?auto_36725 ?auto_36730 ) ) ( not ( = ?auto_36725 ?auto_36731 ) ) ( not ( = ?auto_36725 ?auto_36732 ) ) ( not ( = ?auto_36726 ?auto_36727 ) ) ( not ( = ?auto_36726 ?auto_36728 ) ) ( not ( = ?auto_36726 ?auto_36729 ) ) ( not ( = ?auto_36726 ?auto_36730 ) ) ( not ( = ?auto_36726 ?auto_36731 ) ) ( not ( = ?auto_36726 ?auto_36732 ) ) ( not ( = ?auto_36727 ?auto_36728 ) ) ( not ( = ?auto_36727 ?auto_36729 ) ) ( not ( = ?auto_36727 ?auto_36730 ) ) ( not ( = ?auto_36727 ?auto_36731 ) ) ( not ( = ?auto_36727 ?auto_36732 ) ) ( not ( = ?auto_36728 ?auto_36729 ) ) ( not ( = ?auto_36728 ?auto_36730 ) ) ( not ( = ?auto_36728 ?auto_36731 ) ) ( not ( = ?auto_36728 ?auto_36732 ) ) ( not ( = ?auto_36729 ?auto_36730 ) ) ( not ( = ?auto_36729 ?auto_36731 ) ) ( not ( = ?auto_36729 ?auto_36732 ) ) ( not ( = ?auto_36730 ?auto_36731 ) ) ( not ( = ?auto_36730 ?auto_36732 ) ) ( not ( = ?auto_36731 ?auto_36732 ) ) ( ON ?auto_36730 ?auto_36731 ) ( ON ?auto_36729 ?auto_36730 ) ( ON ?auto_36728 ?auto_36729 ) ( ON ?auto_36727 ?auto_36728 ) ( CLEAR ?auto_36725 ) ( ON ?auto_36726 ?auto_36727 ) ( CLEAR ?auto_36726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36725 ?auto_36726 )
      ( MAKE-7PILE ?auto_36725 ?auto_36726 ?auto_36727 ?auto_36728 ?auto_36729 ?auto_36730 ?auto_36731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36740 - BLOCK
      ?auto_36741 - BLOCK
      ?auto_36742 - BLOCK
      ?auto_36743 - BLOCK
      ?auto_36744 - BLOCK
      ?auto_36745 - BLOCK
      ?auto_36746 - BLOCK
    )
    :vars
    (
      ?auto_36747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36746 ?auto_36747 ) ( ON-TABLE ?auto_36740 ) ( not ( = ?auto_36740 ?auto_36741 ) ) ( not ( = ?auto_36740 ?auto_36742 ) ) ( not ( = ?auto_36740 ?auto_36743 ) ) ( not ( = ?auto_36740 ?auto_36744 ) ) ( not ( = ?auto_36740 ?auto_36745 ) ) ( not ( = ?auto_36740 ?auto_36746 ) ) ( not ( = ?auto_36740 ?auto_36747 ) ) ( not ( = ?auto_36741 ?auto_36742 ) ) ( not ( = ?auto_36741 ?auto_36743 ) ) ( not ( = ?auto_36741 ?auto_36744 ) ) ( not ( = ?auto_36741 ?auto_36745 ) ) ( not ( = ?auto_36741 ?auto_36746 ) ) ( not ( = ?auto_36741 ?auto_36747 ) ) ( not ( = ?auto_36742 ?auto_36743 ) ) ( not ( = ?auto_36742 ?auto_36744 ) ) ( not ( = ?auto_36742 ?auto_36745 ) ) ( not ( = ?auto_36742 ?auto_36746 ) ) ( not ( = ?auto_36742 ?auto_36747 ) ) ( not ( = ?auto_36743 ?auto_36744 ) ) ( not ( = ?auto_36743 ?auto_36745 ) ) ( not ( = ?auto_36743 ?auto_36746 ) ) ( not ( = ?auto_36743 ?auto_36747 ) ) ( not ( = ?auto_36744 ?auto_36745 ) ) ( not ( = ?auto_36744 ?auto_36746 ) ) ( not ( = ?auto_36744 ?auto_36747 ) ) ( not ( = ?auto_36745 ?auto_36746 ) ) ( not ( = ?auto_36745 ?auto_36747 ) ) ( not ( = ?auto_36746 ?auto_36747 ) ) ( ON ?auto_36745 ?auto_36746 ) ( ON ?auto_36744 ?auto_36745 ) ( ON ?auto_36743 ?auto_36744 ) ( ON ?auto_36742 ?auto_36743 ) ( CLEAR ?auto_36740 ) ( ON ?auto_36741 ?auto_36742 ) ( CLEAR ?auto_36741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36740 ?auto_36741 )
      ( MAKE-7PILE ?auto_36740 ?auto_36741 ?auto_36742 ?auto_36743 ?auto_36744 ?auto_36745 ?auto_36746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36755 - BLOCK
      ?auto_36756 - BLOCK
      ?auto_36757 - BLOCK
      ?auto_36758 - BLOCK
      ?auto_36759 - BLOCK
      ?auto_36760 - BLOCK
      ?auto_36761 - BLOCK
    )
    :vars
    (
      ?auto_36762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36761 ?auto_36762 ) ( not ( = ?auto_36755 ?auto_36756 ) ) ( not ( = ?auto_36755 ?auto_36757 ) ) ( not ( = ?auto_36755 ?auto_36758 ) ) ( not ( = ?auto_36755 ?auto_36759 ) ) ( not ( = ?auto_36755 ?auto_36760 ) ) ( not ( = ?auto_36755 ?auto_36761 ) ) ( not ( = ?auto_36755 ?auto_36762 ) ) ( not ( = ?auto_36756 ?auto_36757 ) ) ( not ( = ?auto_36756 ?auto_36758 ) ) ( not ( = ?auto_36756 ?auto_36759 ) ) ( not ( = ?auto_36756 ?auto_36760 ) ) ( not ( = ?auto_36756 ?auto_36761 ) ) ( not ( = ?auto_36756 ?auto_36762 ) ) ( not ( = ?auto_36757 ?auto_36758 ) ) ( not ( = ?auto_36757 ?auto_36759 ) ) ( not ( = ?auto_36757 ?auto_36760 ) ) ( not ( = ?auto_36757 ?auto_36761 ) ) ( not ( = ?auto_36757 ?auto_36762 ) ) ( not ( = ?auto_36758 ?auto_36759 ) ) ( not ( = ?auto_36758 ?auto_36760 ) ) ( not ( = ?auto_36758 ?auto_36761 ) ) ( not ( = ?auto_36758 ?auto_36762 ) ) ( not ( = ?auto_36759 ?auto_36760 ) ) ( not ( = ?auto_36759 ?auto_36761 ) ) ( not ( = ?auto_36759 ?auto_36762 ) ) ( not ( = ?auto_36760 ?auto_36761 ) ) ( not ( = ?auto_36760 ?auto_36762 ) ) ( not ( = ?auto_36761 ?auto_36762 ) ) ( ON ?auto_36760 ?auto_36761 ) ( ON ?auto_36759 ?auto_36760 ) ( ON ?auto_36758 ?auto_36759 ) ( ON ?auto_36757 ?auto_36758 ) ( ON ?auto_36756 ?auto_36757 ) ( ON ?auto_36755 ?auto_36756 ) ( CLEAR ?auto_36755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36755 )
      ( MAKE-7PILE ?auto_36755 ?auto_36756 ?auto_36757 ?auto_36758 ?auto_36759 ?auto_36760 ?auto_36761 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_36770 - BLOCK
      ?auto_36771 - BLOCK
      ?auto_36772 - BLOCK
      ?auto_36773 - BLOCK
      ?auto_36774 - BLOCK
      ?auto_36775 - BLOCK
      ?auto_36776 - BLOCK
    )
    :vars
    (
      ?auto_36777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36776 ?auto_36777 ) ( not ( = ?auto_36770 ?auto_36771 ) ) ( not ( = ?auto_36770 ?auto_36772 ) ) ( not ( = ?auto_36770 ?auto_36773 ) ) ( not ( = ?auto_36770 ?auto_36774 ) ) ( not ( = ?auto_36770 ?auto_36775 ) ) ( not ( = ?auto_36770 ?auto_36776 ) ) ( not ( = ?auto_36770 ?auto_36777 ) ) ( not ( = ?auto_36771 ?auto_36772 ) ) ( not ( = ?auto_36771 ?auto_36773 ) ) ( not ( = ?auto_36771 ?auto_36774 ) ) ( not ( = ?auto_36771 ?auto_36775 ) ) ( not ( = ?auto_36771 ?auto_36776 ) ) ( not ( = ?auto_36771 ?auto_36777 ) ) ( not ( = ?auto_36772 ?auto_36773 ) ) ( not ( = ?auto_36772 ?auto_36774 ) ) ( not ( = ?auto_36772 ?auto_36775 ) ) ( not ( = ?auto_36772 ?auto_36776 ) ) ( not ( = ?auto_36772 ?auto_36777 ) ) ( not ( = ?auto_36773 ?auto_36774 ) ) ( not ( = ?auto_36773 ?auto_36775 ) ) ( not ( = ?auto_36773 ?auto_36776 ) ) ( not ( = ?auto_36773 ?auto_36777 ) ) ( not ( = ?auto_36774 ?auto_36775 ) ) ( not ( = ?auto_36774 ?auto_36776 ) ) ( not ( = ?auto_36774 ?auto_36777 ) ) ( not ( = ?auto_36775 ?auto_36776 ) ) ( not ( = ?auto_36775 ?auto_36777 ) ) ( not ( = ?auto_36776 ?auto_36777 ) ) ( ON ?auto_36775 ?auto_36776 ) ( ON ?auto_36774 ?auto_36775 ) ( ON ?auto_36773 ?auto_36774 ) ( ON ?auto_36772 ?auto_36773 ) ( ON ?auto_36771 ?auto_36772 ) ( ON ?auto_36770 ?auto_36771 ) ( CLEAR ?auto_36770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_36770 )
      ( MAKE-7PILE ?auto_36770 ?auto_36771 ?auto_36772 ?auto_36773 ?auto_36774 ?auto_36775 ?auto_36776 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36786 - BLOCK
      ?auto_36787 - BLOCK
      ?auto_36788 - BLOCK
      ?auto_36789 - BLOCK
      ?auto_36790 - BLOCK
      ?auto_36791 - BLOCK
      ?auto_36792 - BLOCK
      ?auto_36793 - BLOCK
    )
    :vars
    (
      ?auto_36794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36792 ) ( ON ?auto_36793 ?auto_36794 ) ( CLEAR ?auto_36793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36786 ) ( ON ?auto_36787 ?auto_36786 ) ( ON ?auto_36788 ?auto_36787 ) ( ON ?auto_36789 ?auto_36788 ) ( ON ?auto_36790 ?auto_36789 ) ( ON ?auto_36791 ?auto_36790 ) ( ON ?auto_36792 ?auto_36791 ) ( not ( = ?auto_36786 ?auto_36787 ) ) ( not ( = ?auto_36786 ?auto_36788 ) ) ( not ( = ?auto_36786 ?auto_36789 ) ) ( not ( = ?auto_36786 ?auto_36790 ) ) ( not ( = ?auto_36786 ?auto_36791 ) ) ( not ( = ?auto_36786 ?auto_36792 ) ) ( not ( = ?auto_36786 ?auto_36793 ) ) ( not ( = ?auto_36786 ?auto_36794 ) ) ( not ( = ?auto_36787 ?auto_36788 ) ) ( not ( = ?auto_36787 ?auto_36789 ) ) ( not ( = ?auto_36787 ?auto_36790 ) ) ( not ( = ?auto_36787 ?auto_36791 ) ) ( not ( = ?auto_36787 ?auto_36792 ) ) ( not ( = ?auto_36787 ?auto_36793 ) ) ( not ( = ?auto_36787 ?auto_36794 ) ) ( not ( = ?auto_36788 ?auto_36789 ) ) ( not ( = ?auto_36788 ?auto_36790 ) ) ( not ( = ?auto_36788 ?auto_36791 ) ) ( not ( = ?auto_36788 ?auto_36792 ) ) ( not ( = ?auto_36788 ?auto_36793 ) ) ( not ( = ?auto_36788 ?auto_36794 ) ) ( not ( = ?auto_36789 ?auto_36790 ) ) ( not ( = ?auto_36789 ?auto_36791 ) ) ( not ( = ?auto_36789 ?auto_36792 ) ) ( not ( = ?auto_36789 ?auto_36793 ) ) ( not ( = ?auto_36789 ?auto_36794 ) ) ( not ( = ?auto_36790 ?auto_36791 ) ) ( not ( = ?auto_36790 ?auto_36792 ) ) ( not ( = ?auto_36790 ?auto_36793 ) ) ( not ( = ?auto_36790 ?auto_36794 ) ) ( not ( = ?auto_36791 ?auto_36792 ) ) ( not ( = ?auto_36791 ?auto_36793 ) ) ( not ( = ?auto_36791 ?auto_36794 ) ) ( not ( = ?auto_36792 ?auto_36793 ) ) ( not ( = ?auto_36792 ?auto_36794 ) ) ( not ( = ?auto_36793 ?auto_36794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_36793 ?auto_36794 )
      ( !STACK ?auto_36793 ?auto_36792 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36803 - BLOCK
      ?auto_36804 - BLOCK
      ?auto_36805 - BLOCK
      ?auto_36806 - BLOCK
      ?auto_36807 - BLOCK
      ?auto_36808 - BLOCK
      ?auto_36809 - BLOCK
      ?auto_36810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_36809 ) ( ON-TABLE ?auto_36810 ) ( CLEAR ?auto_36810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_36803 ) ( ON ?auto_36804 ?auto_36803 ) ( ON ?auto_36805 ?auto_36804 ) ( ON ?auto_36806 ?auto_36805 ) ( ON ?auto_36807 ?auto_36806 ) ( ON ?auto_36808 ?auto_36807 ) ( ON ?auto_36809 ?auto_36808 ) ( not ( = ?auto_36803 ?auto_36804 ) ) ( not ( = ?auto_36803 ?auto_36805 ) ) ( not ( = ?auto_36803 ?auto_36806 ) ) ( not ( = ?auto_36803 ?auto_36807 ) ) ( not ( = ?auto_36803 ?auto_36808 ) ) ( not ( = ?auto_36803 ?auto_36809 ) ) ( not ( = ?auto_36803 ?auto_36810 ) ) ( not ( = ?auto_36804 ?auto_36805 ) ) ( not ( = ?auto_36804 ?auto_36806 ) ) ( not ( = ?auto_36804 ?auto_36807 ) ) ( not ( = ?auto_36804 ?auto_36808 ) ) ( not ( = ?auto_36804 ?auto_36809 ) ) ( not ( = ?auto_36804 ?auto_36810 ) ) ( not ( = ?auto_36805 ?auto_36806 ) ) ( not ( = ?auto_36805 ?auto_36807 ) ) ( not ( = ?auto_36805 ?auto_36808 ) ) ( not ( = ?auto_36805 ?auto_36809 ) ) ( not ( = ?auto_36805 ?auto_36810 ) ) ( not ( = ?auto_36806 ?auto_36807 ) ) ( not ( = ?auto_36806 ?auto_36808 ) ) ( not ( = ?auto_36806 ?auto_36809 ) ) ( not ( = ?auto_36806 ?auto_36810 ) ) ( not ( = ?auto_36807 ?auto_36808 ) ) ( not ( = ?auto_36807 ?auto_36809 ) ) ( not ( = ?auto_36807 ?auto_36810 ) ) ( not ( = ?auto_36808 ?auto_36809 ) ) ( not ( = ?auto_36808 ?auto_36810 ) ) ( not ( = ?auto_36809 ?auto_36810 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_36810 )
      ( !STACK ?auto_36810 ?auto_36809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36819 - BLOCK
      ?auto_36820 - BLOCK
      ?auto_36821 - BLOCK
      ?auto_36822 - BLOCK
      ?auto_36823 - BLOCK
      ?auto_36824 - BLOCK
      ?auto_36825 - BLOCK
      ?auto_36826 - BLOCK
    )
    :vars
    (
      ?auto_36827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36826 ?auto_36827 ) ( ON-TABLE ?auto_36819 ) ( ON ?auto_36820 ?auto_36819 ) ( ON ?auto_36821 ?auto_36820 ) ( ON ?auto_36822 ?auto_36821 ) ( ON ?auto_36823 ?auto_36822 ) ( ON ?auto_36824 ?auto_36823 ) ( not ( = ?auto_36819 ?auto_36820 ) ) ( not ( = ?auto_36819 ?auto_36821 ) ) ( not ( = ?auto_36819 ?auto_36822 ) ) ( not ( = ?auto_36819 ?auto_36823 ) ) ( not ( = ?auto_36819 ?auto_36824 ) ) ( not ( = ?auto_36819 ?auto_36825 ) ) ( not ( = ?auto_36819 ?auto_36826 ) ) ( not ( = ?auto_36819 ?auto_36827 ) ) ( not ( = ?auto_36820 ?auto_36821 ) ) ( not ( = ?auto_36820 ?auto_36822 ) ) ( not ( = ?auto_36820 ?auto_36823 ) ) ( not ( = ?auto_36820 ?auto_36824 ) ) ( not ( = ?auto_36820 ?auto_36825 ) ) ( not ( = ?auto_36820 ?auto_36826 ) ) ( not ( = ?auto_36820 ?auto_36827 ) ) ( not ( = ?auto_36821 ?auto_36822 ) ) ( not ( = ?auto_36821 ?auto_36823 ) ) ( not ( = ?auto_36821 ?auto_36824 ) ) ( not ( = ?auto_36821 ?auto_36825 ) ) ( not ( = ?auto_36821 ?auto_36826 ) ) ( not ( = ?auto_36821 ?auto_36827 ) ) ( not ( = ?auto_36822 ?auto_36823 ) ) ( not ( = ?auto_36822 ?auto_36824 ) ) ( not ( = ?auto_36822 ?auto_36825 ) ) ( not ( = ?auto_36822 ?auto_36826 ) ) ( not ( = ?auto_36822 ?auto_36827 ) ) ( not ( = ?auto_36823 ?auto_36824 ) ) ( not ( = ?auto_36823 ?auto_36825 ) ) ( not ( = ?auto_36823 ?auto_36826 ) ) ( not ( = ?auto_36823 ?auto_36827 ) ) ( not ( = ?auto_36824 ?auto_36825 ) ) ( not ( = ?auto_36824 ?auto_36826 ) ) ( not ( = ?auto_36824 ?auto_36827 ) ) ( not ( = ?auto_36825 ?auto_36826 ) ) ( not ( = ?auto_36825 ?auto_36827 ) ) ( not ( = ?auto_36826 ?auto_36827 ) ) ( CLEAR ?auto_36824 ) ( ON ?auto_36825 ?auto_36826 ) ( CLEAR ?auto_36825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_36819 ?auto_36820 ?auto_36821 ?auto_36822 ?auto_36823 ?auto_36824 ?auto_36825 )
      ( MAKE-8PILE ?auto_36819 ?auto_36820 ?auto_36821 ?auto_36822 ?auto_36823 ?auto_36824 ?auto_36825 ?auto_36826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36836 - BLOCK
      ?auto_36837 - BLOCK
      ?auto_36838 - BLOCK
      ?auto_36839 - BLOCK
      ?auto_36840 - BLOCK
      ?auto_36841 - BLOCK
      ?auto_36842 - BLOCK
      ?auto_36843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36843 ) ( ON-TABLE ?auto_36836 ) ( ON ?auto_36837 ?auto_36836 ) ( ON ?auto_36838 ?auto_36837 ) ( ON ?auto_36839 ?auto_36838 ) ( ON ?auto_36840 ?auto_36839 ) ( ON ?auto_36841 ?auto_36840 ) ( not ( = ?auto_36836 ?auto_36837 ) ) ( not ( = ?auto_36836 ?auto_36838 ) ) ( not ( = ?auto_36836 ?auto_36839 ) ) ( not ( = ?auto_36836 ?auto_36840 ) ) ( not ( = ?auto_36836 ?auto_36841 ) ) ( not ( = ?auto_36836 ?auto_36842 ) ) ( not ( = ?auto_36836 ?auto_36843 ) ) ( not ( = ?auto_36837 ?auto_36838 ) ) ( not ( = ?auto_36837 ?auto_36839 ) ) ( not ( = ?auto_36837 ?auto_36840 ) ) ( not ( = ?auto_36837 ?auto_36841 ) ) ( not ( = ?auto_36837 ?auto_36842 ) ) ( not ( = ?auto_36837 ?auto_36843 ) ) ( not ( = ?auto_36838 ?auto_36839 ) ) ( not ( = ?auto_36838 ?auto_36840 ) ) ( not ( = ?auto_36838 ?auto_36841 ) ) ( not ( = ?auto_36838 ?auto_36842 ) ) ( not ( = ?auto_36838 ?auto_36843 ) ) ( not ( = ?auto_36839 ?auto_36840 ) ) ( not ( = ?auto_36839 ?auto_36841 ) ) ( not ( = ?auto_36839 ?auto_36842 ) ) ( not ( = ?auto_36839 ?auto_36843 ) ) ( not ( = ?auto_36840 ?auto_36841 ) ) ( not ( = ?auto_36840 ?auto_36842 ) ) ( not ( = ?auto_36840 ?auto_36843 ) ) ( not ( = ?auto_36841 ?auto_36842 ) ) ( not ( = ?auto_36841 ?auto_36843 ) ) ( not ( = ?auto_36842 ?auto_36843 ) ) ( CLEAR ?auto_36841 ) ( ON ?auto_36842 ?auto_36843 ) ( CLEAR ?auto_36842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_36836 ?auto_36837 ?auto_36838 ?auto_36839 ?auto_36840 ?auto_36841 ?auto_36842 )
      ( MAKE-8PILE ?auto_36836 ?auto_36837 ?auto_36838 ?auto_36839 ?auto_36840 ?auto_36841 ?auto_36842 ?auto_36843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36852 - BLOCK
      ?auto_36853 - BLOCK
      ?auto_36854 - BLOCK
      ?auto_36855 - BLOCK
      ?auto_36856 - BLOCK
      ?auto_36857 - BLOCK
      ?auto_36858 - BLOCK
      ?auto_36859 - BLOCK
    )
    :vars
    (
      ?auto_36860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36859 ?auto_36860 ) ( ON-TABLE ?auto_36852 ) ( ON ?auto_36853 ?auto_36852 ) ( ON ?auto_36854 ?auto_36853 ) ( ON ?auto_36855 ?auto_36854 ) ( ON ?auto_36856 ?auto_36855 ) ( not ( = ?auto_36852 ?auto_36853 ) ) ( not ( = ?auto_36852 ?auto_36854 ) ) ( not ( = ?auto_36852 ?auto_36855 ) ) ( not ( = ?auto_36852 ?auto_36856 ) ) ( not ( = ?auto_36852 ?auto_36857 ) ) ( not ( = ?auto_36852 ?auto_36858 ) ) ( not ( = ?auto_36852 ?auto_36859 ) ) ( not ( = ?auto_36852 ?auto_36860 ) ) ( not ( = ?auto_36853 ?auto_36854 ) ) ( not ( = ?auto_36853 ?auto_36855 ) ) ( not ( = ?auto_36853 ?auto_36856 ) ) ( not ( = ?auto_36853 ?auto_36857 ) ) ( not ( = ?auto_36853 ?auto_36858 ) ) ( not ( = ?auto_36853 ?auto_36859 ) ) ( not ( = ?auto_36853 ?auto_36860 ) ) ( not ( = ?auto_36854 ?auto_36855 ) ) ( not ( = ?auto_36854 ?auto_36856 ) ) ( not ( = ?auto_36854 ?auto_36857 ) ) ( not ( = ?auto_36854 ?auto_36858 ) ) ( not ( = ?auto_36854 ?auto_36859 ) ) ( not ( = ?auto_36854 ?auto_36860 ) ) ( not ( = ?auto_36855 ?auto_36856 ) ) ( not ( = ?auto_36855 ?auto_36857 ) ) ( not ( = ?auto_36855 ?auto_36858 ) ) ( not ( = ?auto_36855 ?auto_36859 ) ) ( not ( = ?auto_36855 ?auto_36860 ) ) ( not ( = ?auto_36856 ?auto_36857 ) ) ( not ( = ?auto_36856 ?auto_36858 ) ) ( not ( = ?auto_36856 ?auto_36859 ) ) ( not ( = ?auto_36856 ?auto_36860 ) ) ( not ( = ?auto_36857 ?auto_36858 ) ) ( not ( = ?auto_36857 ?auto_36859 ) ) ( not ( = ?auto_36857 ?auto_36860 ) ) ( not ( = ?auto_36858 ?auto_36859 ) ) ( not ( = ?auto_36858 ?auto_36860 ) ) ( not ( = ?auto_36859 ?auto_36860 ) ) ( ON ?auto_36858 ?auto_36859 ) ( CLEAR ?auto_36856 ) ( ON ?auto_36857 ?auto_36858 ) ( CLEAR ?auto_36857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36852 ?auto_36853 ?auto_36854 ?auto_36855 ?auto_36856 ?auto_36857 )
      ( MAKE-8PILE ?auto_36852 ?auto_36853 ?auto_36854 ?auto_36855 ?auto_36856 ?auto_36857 ?auto_36858 ?auto_36859 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36869 - BLOCK
      ?auto_36870 - BLOCK
      ?auto_36871 - BLOCK
      ?auto_36872 - BLOCK
      ?auto_36873 - BLOCK
      ?auto_36874 - BLOCK
      ?auto_36875 - BLOCK
      ?auto_36876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36876 ) ( ON-TABLE ?auto_36869 ) ( ON ?auto_36870 ?auto_36869 ) ( ON ?auto_36871 ?auto_36870 ) ( ON ?auto_36872 ?auto_36871 ) ( ON ?auto_36873 ?auto_36872 ) ( not ( = ?auto_36869 ?auto_36870 ) ) ( not ( = ?auto_36869 ?auto_36871 ) ) ( not ( = ?auto_36869 ?auto_36872 ) ) ( not ( = ?auto_36869 ?auto_36873 ) ) ( not ( = ?auto_36869 ?auto_36874 ) ) ( not ( = ?auto_36869 ?auto_36875 ) ) ( not ( = ?auto_36869 ?auto_36876 ) ) ( not ( = ?auto_36870 ?auto_36871 ) ) ( not ( = ?auto_36870 ?auto_36872 ) ) ( not ( = ?auto_36870 ?auto_36873 ) ) ( not ( = ?auto_36870 ?auto_36874 ) ) ( not ( = ?auto_36870 ?auto_36875 ) ) ( not ( = ?auto_36870 ?auto_36876 ) ) ( not ( = ?auto_36871 ?auto_36872 ) ) ( not ( = ?auto_36871 ?auto_36873 ) ) ( not ( = ?auto_36871 ?auto_36874 ) ) ( not ( = ?auto_36871 ?auto_36875 ) ) ( not ( = ?auto_36871 ?auto_36876 ) ) ( not ( = ?auto_36872 ?auto_36873 ) ) ( not ( = ?auto_36872 ?auto_36874 ) ) ( not ( = ?auto_36872 ?auto_36875 ) ) ( not ( = ?auto_36872 ?auto_36876 ) ) ( not ( = ?auto_36873 ?auto_36874 ) ) ( not ( = ?auto_36873 ?auto_36875 ) ) ( not ( = ?auto_36873 ?auto_36876 ) ) ( not ( = ?auto_36874 ?auto_36875 ) ) ( not ( = ?auto_36874 ?auto_36876 ) ) ( not ( = ?auto_36875 ?auto_36876 ) ) ( ON ?auto_36875 ?auto_36876 ) ( CLEAR ?auto_36873 ) ( ON ?auto_36874 ?auto_36875 ) ( CLEAR ?auto_36874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_36869 ?auto_36870 ?auto_36871 ?auto_36872 ?auto_36873 ?auto_36874 )
      ( MAKE-8PILE ?auto_36869 ?auto_36870 ?auto_36871 ?auto_36872 ?auto_36873 ?auto_36874 ?auto_36875 ?auto_36876 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36885 - BLOCK
      ?auto_36886 - BLOCK
      ?auto_36887 - BLOCK
      ?auto_36888 - BLOCK
      ?auto_36889 - BLOCK
      ?auto_36890 - BLOCK
      ?auto_36891 - BLOCK
      ?auto_36892 - BLOCK
    )
    :vars
    (
      ?auto_36893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36892 ?auto_36893 ) ( ON-TABLE ?auto_36885 ) ( ON ?auto_36886 ?auto_36885 ) ( ON ?auto_36887 ?auto_36886 ) ( ON ?auto_36888 ?auto_36887 ) ( not ( = ?auto_36885 ?auto_36886 ) ) ( not ( = ?auto_36885 ?auto_36887 ) ) ( not ( = ?auto_36885 ?auto_36888 ) ) ( not ( = ?auto_36885 ?auto_36889 ) ) ( not ( = ?auto_36885 ?auto_36890 ) ) ( not ( = ?auto_36885 ?auto_36891 ) ) ( not ( = ?auto_36885 ?auto_36892 ) ) ( not ( = ?auto_36885 ?auto_36893 ) ) ( not ( = ?auto_36886 ?auto_36887 ) ) ( not ( = ?auto_36886 ?auto_36888 ) ) ( not ( = ?auto_36886 ?auto_36889 ) ) ( not ( = ?auto_36886 ?auto_36890 ) ) ( not ( = ?auto_36886 ?auto_36891 ) ) ( not ( = ?auto_36886 ?auto_36892 ) ) ( not ( = ?auto_36886 ?auto_36893 ) ) ( not ( = ?auto_36887 ?auto_36888 ) ) ( not ( = ?auto_36887 ?auto_36889 ) ) ( not ( = ?auto_36887 ?auto_36890 ) ) ( not ( = ?auto_36887 ?auto_36891 ) ) ( not ( = ?auto_36887 ?auto_36892 ) ) ( not ( = ?auto_36887 ?auto_36893 ) ) ( not ( = ?auto_36888 ?auto_36889 ) ) ( not ( = ?auto_36888 ?auto_36890 ) ) ( not ( = ?auto_36888 ?auto_36891 ) ) ( not ( = ?auto_36888 ?auto_36892 ) ) ( not ( = ?auto_36888 ?auto_36893 ) ) ( not ( = ?auto_36889 ?auto_36890 ) ) ( not ( = ?auto_36889 ?auto_36891 ) ) ( not ( = ?auto_36889 ?auto_36892 ) ) ( not ( = ?auto_36889 ?auto_36893 ) ) ( not ( = ?auto_36890 ?auto_36891 ) ) ( not ( = ?auto_36890 ?auto_36892 ) ) ( not ( = ?auto_36890 ?auto_36893 ) ) ( not ( = ?auto_36891 ?auto_36892 ) ) ( not ( = ?auto_36891 ?auto_36893 ) ) ( not ( = ?auto_36892 ?auto_36893 ) ) ( ON ?auto_36891 ?auto_36892 ) ( ON ?auto_36890 ?auto_36891 ) ( CLEAR ?auto_36888 ) ( ON ?auto_36889 ?auto_36890 ) ( CLEAR ?auto_36889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36885 ?auto_36886 ?auto_36887 ?auto_36888 ?auto_36889 )
      ( MAKE-8PILE ?auto_36885 ?auto_36886 ?auto_36887 ?auto_36888 ?auto_36889 ?auto_36890 ?auto_36891 ?auto_36892 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36902 - BLOCK
      ?auto_36903 - BLOCK
      ?auto_36904 - BLOCK
      ?auto_36905 - BLOCK
      ?auto_36906 - BLOCK
      ?auto_36907 - BLOCK
      ?auto_36908 - BLOCK
      ?auto_36909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36909 ) ( ON-TABLE ?auto_36902 ) ( ON ?auto_36903 ?auto_36902 ) ( ON ?auto_36904 ?auto_36903 ) ( ON ?auto_36905 ?auto_36904 ) ( not ( = ?auto_36902 ?auto_36903 ) ) ( not ( = ?auto_36902 ?auto_36904 ) ) ( not ( = ?auto_36902 ?auto_36905 ) ) ( not ( = ?auto_36902 ?auto_36906 ) ) ( not ( = ?auto_36902 ?auto_36907 ) ) ( not ( = ?auto_36902 ?auto_36908 ) ) ( not ( = ?auto_36902 ?auto_36909 ) ) ( not ( = ?auto_36903 ?auto_36904 ) ) ( not ( = ?auto_36903 ?auto_36905 ) ) ( not ( = ?auto_36903 ?auto_36906 ) ) ( not ( = ?auto_36903 ?auto_36907 ) ) ( not ( = ?auto_36903 ?auto_36908 ) ) ( not ( = ?auto_36903 ?auto_36909 ) ) ( not ( = ?auto_36904 ?auto_36905 ) ) ( not ( = ?auto_36904 ?auto_36906 ) ) ( not ( = ?auto_36904 ?auto_36907 ) ) ( not ( = ?auto_36904 ?auto_36908 ) ) ( not ( = ?auto_36904 ?auto_36909 ) ) ( not ( = ?auto_36905 ?auto_36906 ) ) ( not ( = ?auto_36905 ?auto_36907 ) ) ( not ( = ?auto_36905 ?auto_36908 ) ) ( not ( = ?auto_36905 ?auto_36909 ) ) ( not ( = ?auto_36906 ?auto_36907 ) ) ( not ( = ?auto_36906 ?auto_36908 ) ) ( not ( = ?auto_36906 ?auto_36909 ) ) ( not ( = ?auto_36907 ?auto_36908 ) ) ( not ( = ?auto_36907 ?auto_36909 ) ) ( not ( = ?auto_36908 ?auto_36909 ) ) ( ON ?auto_36908 ?auto_36909 ) ( ON ?auto_36907 ?auto_36908 ) ( CLEAR ?auto_36905 ) ( ON ?auto_36906 ?auto_36907 ) ( CLEAR ?auto_36906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_36902 ?auto_36903 ?auto_36904 ?auto_36905 ?auto_36906 )
      ( MAKE-8PILE ?auto_36902 ?auto_36903 ?auto_36904 ?auto_36905 ?auto_36906 ?auto_36907 ?auto_36908 ?auto_36909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36918 - BLOCK
      ?auto_36919 - BLOCK
      ?auto_36920 - BLOCK
      ?auto_36921 - BLOCK
      ?auto_36922 - BLOCK
      ?auto_36923 - BLOCK
      ?auto_36924 - BLOCK
      ?auto_36925 - BLOCK
    )
    :vars
    (
      ?auto_36926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36925 ?auto_36926 ) ( ON-TABLE ?auto_36918 ) ( ON ?auto_36919 ?auto_36918 ) ( ON ?auto_36920 ?auto_36919 ) ( not ( = ?auto_36918 ?auto_36919 ) ) ( not ( = ?auto_36918 ?auto_36920 ) ) ( not ( = ?auto_36918 ?auto_36921 ) ) ( not ( = ?auto_36918 ?auto_36922 ) ) ( not ( = ?auto_36918 ?auto_36923 ) ) ( not ( = ?auto_36918 ?auto_36924 ) ) ( not ( = ?auto_36918 ?auto_36925 ) ) ( not ( = ?auto_36918 ?auto_36926 ) ) ( not ( = ?auto_36919 ?auto_36920 ) ) ( not ( = ?auto_36919 ?auto_36921 ) ) ( not ( = ?auto_36919 ?auto_36922 ) ) ( not ( = ?auto_36919 ?auto_36923 ) ) ( not ( = ?auto_36919 ?auto_36924 ) ) ( not ( = ?auto_36919 ?auto_36925 ) ) ( not ( = ?auto_36919 ?auto_36926 ) ) ( not ( = ?auto_36920 ?auto_36921 ) ) ( not ( = ?auto_36920 ?auto_36922 ) ) ( not ( = ?auto_36920 ?auto_36923 ) ) ( not ( = ?auto_36920 ?auto_36924 ) ) ( not ( = ?auto_36920 ?auto_36925 ) ) ( not ( = ?auto_36920 ?auto_36926 ) ) ( not ( = ?auto_36921 ?auto_36922 ) ) ( not ( = ?auto_36921 ?auto_36923 ) ) ( not ( = ?auto_36921 ?auto_36924 ) ) ( not ( = ?auto_36921 ?auto_36925 ) ) ( not ( = ?auto_36921 ?auto_36926 ) ) ( not ( = ?auto_36922 ?auto_36923 ) ) ( not ( = ?auto_36922 ?auto_36924 ) ) ( not ( = ?auto_36922 ?auto_36925 ) ) ( not ( = ?auto_36922 ?auto_36926 ) ) ( not ( = ?auto_36923 ?auto_36924 ) ) ( not ( = ?auto_36923 ?auto_36925 ) ) ( not ( = ?auto_36923 ?auto_36926 ) ) ( not ( = ?auto_36924 ?auto_36925 ) ) ( not ( = ?auto_36924 ?auto_36926 ) ) ( not ( = ?auto_36925 ?auto_36926 ) ) ( ON ?auto_36924 ?auto_36925 ) ( ON ?auto_36923 ?auto_36924 ) ( ON ?auto_36922 ?auto_36923 ) ( CLEAR ?auto_36920 ) ( ON ?auto_36921 ?auto_36922 ) ( CLEAR ?auto_36921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36918 ?auto_36919 ?auto_36920 ?auto_36921 )
      ( MAKE-8PILE ?auto_36918 ?auto_36919 ?auto_36920 ?auto_36921 ?auto_36922 ?auto_36923 ?auto_36924 ?auto_36925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36935 - BLOCK
      ?auto_36936 - BLOCK
      ?auto_36937 - BLOCK
      ?auto_36938 - BLOCK
      ?auto_36939 - BLOCK
      ?auto_36940 - BLOCK
      ?auto_36941 - BLOCK
      ?auto_36942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36942 ) ( ON-TABLE ?auto_36935 ) ( ON ?auto_36936 ?auto_36935 ) ( ON ?auto_36937 ?auto_36936 ) ( not ( = ?auto_36935 ?auto_36936 ) ) ( not ( = ?auto_36935 ?auto_36937 ) ) ( not ( = ?auto_36935 ?auto_36938 ) ) ( not ( = ?auto_36935 ?auto_36939 ) ) ( not ( = ?auto_36935 ?auto_36940 ) ) ( not ( = ?auto_36935 ?auto_36941 ) ) ( not ( = ?auto_36935 ?auto_36942 ) ) ( not ( = ?auto_36936 ?auto_36937 ) ) ( not ( = ?auto_36936 ?auto_36938 ) ) ( not ( = ?auto_36936 ?auto_36939 ) ) ( not ( = ?auto_36936 ?auto_36940 ) ) ( not ( = ?auto_36936 ?auto_36941 ) ) ( not ( = ?auto_36936 ?auto_36942 ) ) ( not ( = ?auto_36937 ?auto_36938 ) ) ( not ( = ?auto_36937 ?auto_36939 ) ) ( not ( = ?auto_36937 ?auto_36940 ) ) ( not ( = ?auto_36937 ?auto_36941 ) ) ( not ( = ?auto_36937 ?auto_36942 ) ) ( not ( = ?auto_36938 ?auto_36939 ) ) ( not ( = ?auto_36938 ?auto_36940 ) ) ( not ( = ?auto_36938 ?auto_36941 ) ) ( not ( = ?auto_36938 ?auto_36942 ) ) ( not ( = ?auto_36939 ?auto_36940 ) ) ( not ( = ?auto_36939 ?auto_36941 ) ) ( not ( = ?auto_36939 ?auto_36942 ) ) ( not ( = ?auto_36940 ?auto_36941 ) ) ( not ( = ?auto_36940 ?auto_36942 ) ) ( not ( = ?auto_36941 ?auto_36942 ) ) ( ON ?auto_36941 ?auto_36942 ) ( ON ?auto_36940 ?auto_36941 ) ( ON ?auto_36939 ?auto_36940 ) ( CLEAR ?auto_36937 ) ( ON ?auto_36938 ?auto_36939 ) ( CLEAR ?auto_36938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_36935 ?auto_36936 ?auto_36937 ?auto_36938 )
      ( MAKE-8PILE ?auto_36935 ?auto_36936 ?auto_36937 ?auto_36938 ?auto_36939 ?auto_36940 ?auto_36941 ?auto_36942 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36951 - BLOCK
      ?auto_36952 - BLOCK
      ?auto_36953 - BLOCK
      ?auto_36954 - BLOCK
      ?auto_36955 - BLOCK
      ?auto_36956 - BLOCK
      ?auto_36957 - BLOCK
      ?auto_36958 - BLOCK
    )
    :vars
    (
      ?auto_36959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36958 ?auto_36959 ) ( ON-TABLE ?auto_36951 ) ( ON ?auto_36952 ?auto_36951 ) ( not ( = ?auto_36951 ?auto_36952 ) ) ( not ( = ?auto_36951 ?auto_36953 ) ) ( not ( = ?auto_36951 ?auto_36954 ) ) ( not ( = ?auto_36951 ?auto_36955 ) ) ( not ( = ?auto_36951 ?auto_36956 ) ) ( not ( = ?auto_36951 ?auto_36957 ) ) ( not ( = ?auto_36951 ?auto_36958 ) ) ( not ( = ?auto_36951 ?auto_36959 ) ) ( not ( = ?auto_36952 ?auto_36953 ) ) ( not ( = ?auto_36952 ?auto_36954 ) ) ( not ( = ?auto_36952 ?auto_36955 ) ) ( not ( = ?auto_36952 ?auto_36956 ) ) ( not ( = ?auto_36952 ?auto_36957 ) ) ( not ( = ?auto_36952 ?auto_36958 ) ) ( not ( = ?auto_36952 ?auto_36959 ) ) ( not ( = ?auto_36953 ?auto_36954 ) ) ( not ( = ?auto_36953 ?auto_36955 ) ) ( not ( = ?auto_36953 ?auto_36956 ) ) ( not ( = ?auto_36953 ?auto_36957 ) ) ( not ( = ?auto_36953 ?auto_36958 ) ) ( not ( = ?auto_36953 ?auto_36959 ) ) ( not ( = ?auto_36954 ?auto_36955 ) ) ( not ( = ?auto_36954 ?auto_36956 ) ) ( not ( = ?auto_36954 ?auto_36957 ) ) ( not ( = ?auto_36954 ?auto_36958 ) ) ( not ( = ?auto_36954 ?auto_36959 ) ) ( not ( = ?auto_36955 ?auto_36956 ) ) ( not ( = ?auto_36955 ?auto_36957 ) ) ( not ( = ?auto_36955 ?auto_36958 ) ) ( not ( = ?auto_36955 ?auto_36959 ) ) ( not ( = ?auto_36956 ?auto_36957 ) ) ( not ( = ?auto_36956 ?auto_36958 ) ) ( not ( = ?auto_36956 ?auto_36959 ) ) ( not ( = ?auto_36957 ?auto_36958 ) ) ( not ( = ?auto_36957 ?auto_36959 ) ) ( not ( = ?auto_36958 ?auto_36959 ) ) ( ON ?auto_36957 ?auto_36958 ) ( ON ?auto_36956 ?auto_36957 ) ( ON ?auto_36955 ?auto_36956 ) ( ON ?auto_36954 ?auto_36955 ) ( CLEAR ?auto_36952 ) ( ON ?auto_36953 ?auto_36954 ) ( CLEAR ?auto_36953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36951 ?auto_36952 ?auto_36953 )
      ( MAKE-8PILE ?auto_36951 ?auto_36952 ?auto_36953 ?auto_36954 ?auto_36955 ?auto_36956 ?auto_36957 ?auto_36958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36968 - BLOCK
      ?auto_36969 - BLOCK
      ?auto_36970 - BLOCK
      ?auto_36971 - BLOCK
      ?auto_36972 - BLOCK
      ?auto_36973 - BLOCK
      ?auto_36974 - BLOCK
      ?auto_36975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_36975 ) ( ON-TABLE ?auto_36968 ) ( ON ?auto_36969 ?auto_36968 ) ( not ( = ?auto_36968 ?auto_36969 ) ) ( not ( = ?auto_36968 ?auto_36970 ) ) ( not ( = ?auto_36968 ?auto_36971 ) ) ( not ( = ?auto_36968 ?auto_36972 ) ) ( not ( = ?auto_36968 ?auto_36973 ) ) ( not ( = ?auto_36968 ?auto_36974 ) ) ( not ( = ?auto_36968 ?auto_36975 ) ) ( not ( = ?auto_36969 ?auto_36970 ) ) ( not ( = ?auto_36969 ?auto_36971 ) ) ( not ( = ?auto_36969 ?auto_36972 ) ) ( not ( = ?auto_36969 ?auto_36973 ) ) ( not ( = ?auto_36969 ?auto_36974 ) ) ( not ( = ?auto_36969 ?auto_36975 ) ) ( not ( = ?auto_36970 ?auto_36971 ) ) ( not ( = ?auto_36970 ?auto_36972 ) ) ( not ( = ?auto_36970 ?auto_36973 ) ) ( not ( = ?auto_36970 ?auto_36974 ) ) ( not ( = ?auto_36970 ?auto_36975 ) ) ( not ( = ?auto_36971 ?auto_36972 ) ) ( not ( = ?auto_36971 ?auto_36973 ) ) ( not ( = ?auto_36971 ?auto_36974 ) ) ( not ( = ?auto_36971 ?auto_36975 ) ) ( not ( = ?auto_36972 ?auto_36973 ) ) ( not ( = ?auto_36972 ?auto_36974 ) ) ( not ( = ?auto_36972 ?auto_36975 ) ) ( not ( = ?auto_36973 ?auto_36974 ) ) ( not ( = ?auto_36973 ?auto_36975 ) ) ( not ( = ?auto_36974 ?auto_36975 ) ) ( ON ?auto_36974 ?auto_36975 ) ( ON ?auto_36973 ?auto_36974 ) ( ON ?auto_36972 ?auto_36973 ) ( ON ?auto_36971 ?auto_36972 ) ( CLEAR ?auto_36969 ) ( ON ?auto_36970 ?auto_36971 ) ( CLEAR ?auto_36970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_36968 ?auto_36969 ?auto_36970 )
      ( MAKE-8PILE ?auto_36968 ?auto_36969 ?auto_36970 ?auto_36971 ?auto_36972 ?auto_36973 ?auto_36974 ?auto_36975 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_36984 - BLOCK
      ?auto_36985 - BLOCK
      ?auto_36986 - BLOCK
      ?auto_36987 - BLOCK
      ?auto_36988 - BLOCK
      ?auto_36989 - BLOCK
      ?auto_36990 - BLOCK
      ?auto_36991 - BLOCK
    )
    :vars
    (
      ?auto_36992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36991 ?auto_36992 ) ( ON-TABLE ?auto_36984 ) ( not ( = ?auto_36984 ?auto_36985 ) ) ( not ( = ?auto_36984 ?auto_36986 ) ) ( not ( = ?auto_36984 ?auto_36987 ) ) ( not ( = ?auto_36984 ?auto_36988 ) ) ( not ( = ?auto_36984 ?auto_36989 ) ) ( not ( = ?auto_36984 ?auto_36990 ) ) ( not ( = ?auto_36984 ?auto_36991 ) ) ( not ( = ?auto_36984 ?auto_36992 ) ) ( not ( = ?auto_36985 ?auto_36986 ) ) ( not ( = ?auto_36985 ?auto_36987 ) ) ( not ( = ?auto_36985 ?auto_36988 ) ) ( not ( = ?auto_36985 ?auto_36989 ) ) ( not ( = ?auto_36985 ?auto_36990 ) ) ( not ( = ?auto_36985 ?auto_36991 ) ) ( not ( = ?auto_36985 ?auto_36992 ) ) ( not ( = ?auto_36986 ?auto_36987 ) ) ( not ( = ?auto_36986 ?auto_36988 ) ) ( not ( = ?auto_36986 ?auto_36989 ) ) ( not ( = ?auto_36986 ?auto_36990 ) ) ( not ( = ?auto_36986 ?auto_36991 ) ) ( not ( = ?auto_36986 ?auto_36992 ) ) ( not ( = ?auto_36987 ?auto_36988 ) ) ( not ( = ?auto_36987 ?auto_36989 ) ) ( not ( = ?auto_36987 ?auto_36990 ) ) ( not ( = ?auto_36987 ?auto_36991 ) ) ( not ( = ?auto_36987 ?auto_36992 ) ) ( not ( = ?auto_36988 ?auto_36989 ) ) ( not ( = ?auto_36988 ?auto_36990 ) ) ( not ( = ?auto_36988 ?auto_36991 ) ) ( not ( = ?auto_36988 ?auto_36992 ) ) ( not ( = ?auto_36989 ?auto_36990 ) ) ( not ( = ?auto_36989 ?auto_36991 ) ) ( not ( = ?auto_36989 ?auto_36992 ) ) ( not ( = ?auto_36990 ?auto_36991 ) ) ( not ( = ?auto_36990 ?auto_36992 ) ) ( not ( = ?auto_36991 ?auto_36992 ) ) ( ON ?auto_36990 ?auto_36991 ) ( ON ?auto_36989 ?auto_36990 ) ( ON ?auto_36988 ?auto_36989 ) ( ON ?auto_36987 ?auto_36988 ) ( ON ?auto_36986 ?auto_36987 ) ( CLEAR ?auto_36984 ) ( ON ?auto_36985 ?auto_36986 ) ( CLEAR ?auto_36985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_36984 ?auto_36985 )
      ( MAKE-8PILE ?auto_36984 ?auto_36985 ?auto_36986 ?auto_36987 ?auto_36988 ?auto_36989 ?auto_36990 ?auto_36991 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37001 - BLOCK
      ?auto_37002 - BLOCK
      ?auto_37003 - BLOCK
      ?auto_37004 - BLOCK
      ?auto_37005 - BLOCK
      ?auto_37006 - BLOCK
      ?auto_37007 - BLOCK
      ?auto_37008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37008 ) ( ON-TABLE ?auto_37001 ) ( not ( = ?auto_37001 ?auto_37002 ) ) ( not ( = ?auto_37001 ?auto_37003 ) ) ( not ( = ?auto_37001 ?auto_37004 ) ) ( not ( = ?auto_37001 ?auto_37005 ) ) ( not ( = ?auto_37001 ?auto_37006 ) ) ( not ( = ?auto_37001 ?auto_37007 ) ) ( not ( = ?auto_37001 ?auto_37008 ) ) ( not ( = ?auto_37002 ?auto_37003 ) ) ( not ( = ?auto_37002 ?auto_37004 ) ) ( not ( = ?auto_37002 ?auto_37005 ) ) ( not ( = ?auto_37002 ?auto_37006 ) ) ( not ( = ?auto_37002 ?auto_37007 ) ) ( not ( = ?auto_37002 ?auto_37008 ) ) ( not ( = ?auto_37003 ?auto_37004 ) ) ( not ( = ?auto_37003 ?auto_37005 ) ) ( not ( = ?auto_37003 ?auto_37006 ) ) ( not ( = ?auto_37003 ?auto_37007 ) ) ( not ( = ?auto_37003 ?auto_37008 ) ) ( not ( = ?auto_37004 ?auto_37005 ) ) ( not ( = ?auto_37004 ?auto_37006 ) ) ( not ( = ?auto_37004 ?auto_37007 ) ) ( not ( = ?auto_37004 ?auto_37008 ) ) ( not ( = ?auto_37005 ?auto_37006 ) ) ( not ( = ?auto_37005 ?auto_37007 ) ) ( not ( = ?auto_37005 ?auto_37008 ) ) ( not ( = ?auto_37006 ?auto_37007 ) ) ( not ( = ?auto_37006 ?auto_37008 ) ) ( not ( = ?auto_37007 ?auto_37008 ) ) ( ON ?auto_37007 ?auto_37008 ) ( ON ?auto_37006 ?auto_37007 ) ( ON ?auto_37005 ?auto_37006 ) ( ON ?auto_37004 ?auto_37005 ) ( ON ?auto_37003 ?auto_37004 ) ( CLEAR ?auto_37001 ) ( ON ?auto_37002 ?auto_37003 ) ( CLEAR ?auto_37002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_37001 ?auto_37002 )
      ( MAKE-8PILE ?auto_37001 ?auto_37002 ?auto_37003 ?auto_37004 ?auto_37005 ?auto_37006 ?auto_37007 ?auto_37008 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37017 - BLOCK
      ?auto_37018 - BLOCK
      ?auto_37019 - BLOCK
      ?auto_37020 - BLOCK
      ?auto_37021 - BLOCK
      ?auto_37022 - BLOCK
      ?auto_37023 - BLOCK
      ?auto_37024 - BLOCK
    )
    :vars
    (
      ?auto_37025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_37024 ?auto_37025 ) ( not ( = ?auto_37017 ?auto_37018 ) ) ( not ( = ?auto_37017 ?auto_37019 ) ) ( not ( = ?auto_37017 ?auto_37020 ) ) ( not ( = ?auto_37017 ?auto_37021 ) ) ( not ( = ?auto_37017 ?auto_37022 ) ) ( not ( = ?auto_37017 ?auto_37023 ) ) ( not ( = ?auto_37017 ?auto_37024 ) ) ( not ( = ?auto_37017 ?auto_37025 ) ) ( not ( = ?auto_37018 ?auto_37019 ) ) ( not ( = ?auto_37018 ?auto_37020 ) ) ( not ( = ?auto_37018 ?auto_37021 ) ) ( not ( = ?auto_37018 ?auto_37022 ) ) ( not ( = ?auto_37018 ?auto_37023 ) ) ( not ( = ?auto_37018 ?auto_37024 ) ) ( not ( = ?auto_37018 ?auto_37025 ) ) ( not ( = ?auto_37019 ?auto_37020 ) ) ( not ( = ?auto_37019 ?auto_37021 ) ) ( not ( = ?auto_37019 ?auto_37022 ) ) ( not ( = ?auto_37019 ?auto_37023 ) ) ( not ( = ?auto_37019 ?auto_37024 ) ) ( not ( = ?auto_37019 ?auto_37025 ) ) ( not ( = ?auto_37020 ?auto_37021 ) ) ( not ( = ?auto_37020 ?auto_37022 ) ) ( not ( = ?auto_37020 ?auto_37023 ) ) ( not ( = ?auto_37020 ?auto_37024 ) ) ( not ( = ?auto_37020 ?auto_37025 ) ) ( not ( = ?auto_37021 ?auto_37022 ) ) ( not ( = ?auto_37021 ?auto_37023 ) ) ( not ( = ?auto_37021 ?auto_37024 ) ) ( not ( = ?auto_37021 ?auto_37025 ) ) ( not ( = ?auto_37022 ?auto_37023 ) ) ( not ( = ?auto_37022 ?auto_37024 ) ) ( not ( = ?auto_37022 ?auto_37025 ) ) ( not ( = ?auto_37023 ?auto_37024 ) ) ( not ( = ?auto_37023 ?auto_37025 ) ) ( not ( = ?auto_37024 ?auto_37025 ) ) ( ON ?auto_37023 ?auto_37024 ) ( ON ?auto_37022 ?auto_37023 ) ( ON ?auto_37021 ?auto_37022 ) ( ON ?auto_37020 ?auto_37021 ) ( ON ?auto_37019 ?auto_37020 ) ( ON ?auto_37018 ?auto_37019 ) ( ON ?auto_37017 ?auto_37018 ) ( CLEAR ?auto_37017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37017 )
      ( MAKE-8PILE ?auto_37017 ?auto_37018 ?auto_37019 ?auto_37020 ?auto_37021 ?auto_37022 ?auto_37023 ?auto_37024 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37034 - BLOCK
      ?auto_37035 - BLOCK
      ?auto_37036 - BLOCK
      ?auto_37037 - BLOCK
      ?auto_37038 - BLOCK
      ?auto_37039 - BLOCK
      ?auto_37040 - BLOCK
      ?auto_37041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_37041 ) ( not ( = ?auto_37034 ?auto_37035 ) ) ( not ( = ?auto_37034 ?auto_37036 ) ) ( not ( = ?auto_37034 ?auto_37037 ) ) ( not ( = ?auto_37034 ?auto_37038 ) ) ( not ( = ?auto_37034 ?auto_37039 ) ) ( not ( = ?auto_37034 ?auto_37040 ) ) ( not ( = ?auto_37034 ?auto_37041 ) ) ( not ( = ?auto_37035 ?auto_37036 ) ) ( not ( = ?auto_37035 ?auto_37037 ) ) ( not ( = ?auto_37035 ?auto_37038 ) ) ( not ( = ?auto_37035 ?auto_37039 ) ) ( not ( = ?auto_37035 ?auto_37040 ) ) ( not ( = ?auto_37035 ?auto_37041 ) ) ( not ( = ?auto_37036 ?auto_37037 ) ) ( not ( = ?auto_37036 ?auto_37038 ) ) ( not ( = ?auto_37036 ?auto_37039 ) ) ( not ( = ?auto_37036 ?auto_37040 ) ) ( not ( = ?auto_37036 ?auto_37041 ) ) ( not ( = ?auto_37037 ?auto_37038 ) ) ( not ( = ?auto_37037 ?auto_37039 ) ) ( not ( = ?auto_37037 ?auto_37040 ) ) ( not ( = ?auto_37037 ?auto_37041 ) ) ( not ( = ?auto_37038 ?auto_37039 ) ) ( not ( = ?auto_37038 ?auto_37040 ) ) ( not ( = ?auto_37038 ?auto_37041 ) ) ( not ( = ?auto_37039 ?auto_37040 ) ) ( not ( = ?auto_37039 ?auto_37041 ) ) ( not ( = ?auto_37040 ?auto_37041 ) ) ( ON ?auto_37040 ?auto_37041 ) ( ON ?auto_37039 ?auto_37040 ) ( ON ?auto_37038 ?auto_37039 ) ( ON ?auto_37037 ?auto_37038 ) ( ON ?auto_37036 ?auto_37037 ) ( ON ?auto_37035 ?auto_37036 ) ( ON ?auto_37034 ?auto_37035 ) ( CLEAR ?auto_37034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_37034 )
      ( MAKE-8PILE ?auto_37034 ?auto_37035 ?auto_37036 ?auto_37037 ?auto_37038 ?auto_37039 ?auto_37040 ?auto_37041 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_37050 - BLOCK
      ?auto_37051 - BLOCK
      ?auto_37052 - BLOCK
      ?auto_37053 - BLOCK
      ?auto_37054 - BLOCK
      ?auto_37055 - BLOCK
      ?auto_37056 - BLOCK
      ?auto_37057 - BLOCK
    )
    :vars
    (
      ?auto_37058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_37050 ?auto_37051 ) ) ( not ( = ?auto_37050 ?auto_37052 ) ) ( not ( = ?auto_37050 ?auto_37053 ) ) ( not ( = ?auto_37050 ?auto_37054 ) ) ( not ( = ?auto_37050 ?auto_37055 ) ) ( not ( = ?auto_37050 ?auto_37056 ) ) ( not ( = ?auto_37050 ?auto_37057 ) ) ( not ( = ?auto_37051 ?auto_37052 ) ) ( not ( = ?auto_37051 ?auto_37053 ) ) ( not ( = ?auto_37051 ?auto_37054 ) ) ( not ( = ?auto_37051 ?auto_37055 ) ) ( not ( = ?auto_37051 ?auto_37056 ) ) ( not ( = ?auto_37051 ?auto_37057 ) ) ( not ( = ?auto_37052 ?auto_37053 ) ) ( not ( = ?auto_37052 ?auto_37054 ) ) ( not ( = ?auto_37052 ?auto_37055 ) ) ( not ( = ?auto_37052 ?auto_37056 ) ) ( not ( = ?auto_37052 ?auto_37057 ) ) ( not ( = ?auto_37053 ?auto_37054 ) ) ( not ( = ?auto_37053 ?auto_37055 ) ) ( not ( = ?auto_37053 ?auto_37056 ) ) ( not ( = ?auto_37053 ?auto_37057 ) ) ( not ( = ?auto_37054 ?auto_37055 ) ) ( not ( = ?auto_37054 ?auto_37056 ) ) ( not ( = ?auto_37054 ?auto_37057 ) ) ( not ( = ?auto_37055 ?auto_37056 ) ) ( not ( = ?auto_37055 ?auto_37057 ) ) ( not ( = ?auto_37056 ?auto_37057 ) ) ( ON ?auto_37050 ?auto_37058 ) ( not ( = ?auto_37057 ?auto_37058 ) ) ( not ( = ?auto_37056 ?auto_37058 ) ) ( not ( = ?auto_37055 ?auto_37058 ) ) ( not ( = ?auto_37054 ?auto_37058 ) ) ( not ( = ?auto_37053 ?auto_37058 ) ) ( not ( = ?auto_37052 ?auto_37058 ) ) ( not ( = ?auto_37051 ?auto_37058 ) ) ( not ( = ?auto_37050 ?auto_37058 ) ) ( ON ?auto_37051 ?auto_37050 ) ( ON ?auto_37052 ?auto_37051 ) ( ON ?auto_37053 ?auto_37052 ) ( ON ?auto_37054 ?auto_37053 ) ( ON ?auto_37055 ?auto_37054 ) ( ON ?auto_37056 ?auto_37055 ) ( ON ?auto_37057 ?auto_37056 ) ( CLEAR ?auto_37057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_37057 ?auto_37056 ?auto_37055 ?auto_37054 ?auto_37053 ?auto_37052 ?auto_37051 ?auto_37050 )
      ( MAKE-8PILE ?auto_37050 ?auto_37051 ?auto_37052 ?auto_37053 ?auto_37054 ?auto_37055 ?auto_37056 ?auto_37057 ) )
  )

)

