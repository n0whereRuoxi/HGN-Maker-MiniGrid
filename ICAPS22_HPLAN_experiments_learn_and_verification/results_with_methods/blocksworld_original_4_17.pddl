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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16229 - BLOCK
      ?auto_16230 - BLOCK
      ?auto_16231 - BLOCK
      ?auto_16232 - BLOCK
    )
    :vars
    (
      ?auto_16233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16233 ?auto_16232 ) ( CLEAR ?auto_16233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16229 ) ( ON ?auto_16230 ?auto_16229 ) ( ON ?auto_16231 ?auto_16230 ) ( ON ?auto_16232 ?auto_16231 ) ( not ( = ?auto_16229 ?auto_16230 ) ) ( not ( = ?auto_16229 ?auto_16231 ) ) ( not ( = ?auto_16229 ?auto_16232 ) ) ( not ( = ?auto_16229 ?auto_16233 ) ) ( not ( = ?auto_16230 ?auto_16231 ) ) ( not ( = ?auto_16230 ?auto_16232 ) ) ( not ( = ?auto_16230 ?auto_16233 ) ) ( not ( = ?auto_16231 ?auto_16232 ) ) ( not ( = ?auto_16231 ?auto_16233 ) ) ( not ( = ?auto_16232 ?auto_16233 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16233 ?auto_16232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16235 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16235 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16236 - BLOCK
    )
    :vars
    (
      ?auto_16237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16236 ?auto_16237 ) ( CLEAR ?auto_16236 ) ( HAND-EMPTY ) ( not ( = ?auto_16236 ?auto_16237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16236 ?auto_16237 )
      ( MAKE-1PILE ?auto_16236 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16241 - BLOCK
      ?auto_16242 - BLOCK
      ?auto_16243 - BLOCK
    )
    :vars
    (
      ?auto_16244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16244 ?auto_16243 ) ( CLEAR ?auto_16244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16241 ) ( ON ?auto_16242 ?auto_16241 ) ( ON ?auto_16243 ?auto_16242 ) ( not ( = ?auto_16241 ?auto_16242 ) ) ( not ( = ?auto_16241 ?auto_16243 ) ) ( not ( = ?auto_16241 ?auto_16244 ) ) ( not ( = ?auto_16242 ?auto_16243 ) ) ( not ( = ?auto_16242 ?auto_16244 ) ) ( not ( = ?auto_16243 ?auto_16244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16244 ?auto_16243 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16245 - BLOCK
      ?auto_16246 - BLOCK
      ?auto_16247 - BLOCK
    )
    :vars
    (
      ?auto_16248 - BLOCK
      ?auto_16249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16248 ?auto_16247 ) ( CLEAR ?auto_16248 ) ( ON-TABLE ?auto_16245 ) ( ON ?auto_16246 ?auto_16245 ) ( ON ?auto_16247 ?auto_16246 ) ( not ( = ?auto_16245 ?auto_16246 ) ) ( not ( = ?auto_16245 ?auto_16247 ) ) ( not ( = ?auto_16245 ?auto_16248 ) ) ( not ( = ?auto_16246 ?auto_16247 ) ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( HOLDING ?auto_16249 ) ( not ( = ?auto_16245 ?auto_16249 ) ) ( not ( = ?auto_16246 ?auto_16249 ) ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( not ( = ?auto_16248 ?auto_16249 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16249 )
      ( MAKE-3PILE ?auto_16245 ?auto_16246 ?auto_16247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16250 - BLOCK
      ?auto_16251 - BLOCK
      ?auto_16252 - BLOCK
    )
    :vars
    (
      ?auto_16253 - BLOCK
      ?auto_16254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16253 ?auto_16252 ) ( ON-TABLE ?auto_16250 ) ( ON ?auto_16251 ?auto_16250 ) ( ON ?auto_16252 ?auto_16251 ) ( not ( = ?auto_16250 ?auto_16251 ) ) ( not ( = ?auto_16250 ?auto_16252 ) ) ( not ( = ?auto_16250 ?auto_16253 ) ) ( not ( = ?auto_16251 ?auto_16252 ) ) ( not ( = ?auto_16251 ?auto_16253 ) ) ( not ( = ?auto_16252 ?auto_16253 ) ) ( not ( = ?auto_16250 ?auto_16254 ) ) ( not ( = ?auto_16251 ?auto_16254 ) ) ( not ( = ?auto_16252 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( ON ?auto_16254 ?auto_16253 ) ( CLEAR ?auto_16254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16250 ?auto_16251 ?auto_16252 ?auto_16253 )
      ( MAKE-3PILE ?auto_16250 ?auto_16251 ?auto_16252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16257 - BLOCK
      ?auto_16258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16258 ) ( CLEAR ?auto_16257 ) ( ON-TABLE ?auto_16257 ) ( not ( = ?auto_16257 ?auto_16258 ) ) )
    :subtasks
    ( ( !STACK ?auto_16258 ?auto_16257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16259 - BLOCK
      ?auto_16260 - BLOCK
    )
    :vars
    (
      ?auto_16261 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16259 ) ( ON-TABLE ?auto_16259 ) ( not ( = ?auto_16259 ?auto_16260 ) ) ( ON ?auto_16260 ?auto_16261 ) ( CLEAR ?auto_16260 ) ( HAND-EMPTY ) ( not ( = ?auto_16259 ?auto_16261 ) ) ( not ( = ?auto_16260 ?auto_16261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16260 ?auto_16261 )
      ( MAKE-2PILE ?auto_16259 ?auto_16260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16262 - BLOCK
      ?auto_16263 - BLOCK
    )
    :vars
    (
      ?auto_16264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16262 ?auto_16263 ) ) ( ON ?auto_16263 ?auto_16264 ) ( CLEAR ?auto_16263 ) ( not ( = ?auto_16262 ?auto_16264 ) ) ( not ( = ?auto_16263 ?auto_16264 ) ) ( HOLDING ?auto_16262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16262 )
      ( MAKE-2PILE ?auto_16262 ?auto_16263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16265 - BLOCK
      ?auto_16266 - BLOCK
    )
    :vars
    (
      ?auto_16267 - BLOCK
      ?auto_16269 - BLOCK
      ?auto_16268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16265 ?auto_16266 ) ) ( ON ?auto_16266 ?auto_16267 ) ( not ( = ?auto_16265 ?auto_16267 ) ) ( not ( = ?auto_16266 ?auto_16267 ) ) ( ON ?auto_16265 ?auto_16266 ) ( CLEAR ?auto_16265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16269 ) ( ON ?auto_16268 ?auto_16269 ) ( ON ?auto_16267 ?auto_16268 ) ( not ( = ?auto_16269 ?auto_16268 ) ) ( not ( = ?auto_16269 ?auto_16267 ) ) ( not ( = ?auto_16269 ?auto_16266 ) ) ( not ( = ?auto_16269 ?auto_16265 ) ) ( not ( = ?auto_16268 ?auto_16267 ) ) ( not ( = ?auto_16268 ?auto_16266 ) ) ( not ( = ?auto_16268 ?auto_16265 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16269 ?auto_16268 ?auto_16267 ?auto_16266 )
      ( MAKE-2PILE ?auto_16265 ?auto_16266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16272 - BLOCK
      ?auto_16273 - BLOCK
    )
    :vars
    (
      ?auto_16274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16274 ?auto_16273 ) ( CLEAR ?auto_16274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16272 ) ( ON ?auto_16273 ?auto_16272 ) ( not ( = ?auto_16272 ?auto_16273 ) ) ( not ( = ?auto_16272 ?auto_16274 ) ) ( not ( = ?auto_16273 ?auto_16274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16274 ?auto_16273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16275 - BLOCK
      ?auto_16276 - BLOCK
    )
    :vars
    (
      ?auto_16277 - BLOCK
      ?auto_16278 - BLOCK
      ?auto_16279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16277 ?auto_16276 ) ( CLEAR ?auto_16277 ) ( ON-TABLE ?auto_16275 ) ( ON ?auto_16276 ?auto_16275 ) ( not ( = ?auto_16275 ?auto_16276 ) ) ( not ( = ?auto_16275 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( HOLDING ?auto_16278 ) ( CLEAR ?auto_16279 ) ( not ( = ?auto_16275 ?auto_16278 ) ) ( not ( = ?auto_16275 ?auto_16279 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16278 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( not ( = ?auto_16278 ?auto_16279 ) ) )
    :subtasks
    ( ( !STACK ?auto_16278 ?auto_16279 )
      ( MAKE-2PILE ?auto_16275 ?auto_16276 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16280 - BLOCK
      ?auto_16281 - BLOCK
    )
    :vars
    (
      ?auto_16284 - BLOCK
      ?auto_16283 - BLOCK
      ?auto_16282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16284 ?auto_16281 ) ( ON-TABLE ?auto_16280 ) ( ON ?auto_16281 ?auto_16280 ) ( not ( = ?auto_16280 ?auto_16281 ) ) ( not ( = ?auto_16280 ?auto_16284 ) ) ( not ( = ?auto_16281 ?auto_16284 ) ) ( CLEAR ?auto_16283 ) ( not ( = ?auto_16280 ?auto_16282 ) ) ( not ( = ?auto_16280 ?auto_16283 ) ) ( not ( = ?auto_16281 ?auto_16282 ) ) ( not ( = ?auto_16281 ?auto_16283 ) ) ( not ( = ?auto_16284 ?auto_16282 ) ) ( not ( = ?auto_16284 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( ON ?auto_16282 ?auto_16284 ) ( CLEAR ?auto_16282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16280 ?auto_16281 ?auto_16284 )
      ( MAKE-2PILE ?auto_16280 ?auto_16281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16285 - BLOCK
      ?auto_16286 - BLOCK
    )
    :vars
    (
      ?auto_16289 - BLOCK
      ?auto_16287 - BLOCK
      ?auto_16288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16289 ?auto_16286 ) ( ON-TABLE ?auto_16285 ) ( ON ?auto_16286 ?auto_16285 ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16289 ) ) ( not ( = ?auto_16286 ?auto_16289 ) ) ( not ( = ?auto_16285 ?auto_16287 ) ) ( not ( = ?auto_16285 ?auto_16288 ) ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16287 ) ) ( not ( = ?auto_16289 ?auto_16288 ) ) ( not ( = ?auto_16287 ?auto_16288 ) ) ( ON ?auto_16287 ?auto_16289 ) ( CLEAR ?auto_16287 ) ( HOLDING ?auto_16288 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16288 )
      ( MAKE-2PILE ?auto_16285 ?auto_16286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16290 - BLOCK
      ?auto_16291 - BLOCK
    )
    :vars
    (
      ?auto_16294 - BLOCK
      ?auto_16292 - BLOCK
      ?auto_16293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16294 ?auto_16291 ) ( ON-TABLE ?auto_16290 ) ( ON ?auto_16291 ?auto_16290 ) ( not ( = ?auto_16290 ?auto_16291 ) ) ( not ( = ?auto_16290 ?auto_16294 ) ) ( not ( = ?auto_16291 ?auto_16294 ) ) ( not ( = ?auto_16290 ?auto_16292 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( not ( = ?auto_16291 ?auto_16292 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16294 ?auto_16292 ) ) ( not ( = ?auto_16294 ?auto_16293 ) ) ( not ( = ?auto_16292 ?auto_16293 ) ) ( ON ?auto_16292 ?auto_16294 ) ( ON ?auto_16293 ?auto_16292 ) ( CLEAR ?auto_16293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16290 ?auto_16291 ?auto_16294 ?auto_16292 )
      ( MAKE-2PILE ?auto_16290 ?auto_16291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16298 - BLOCK
      ?auto_16299 - BLOCK
      ?auto_16300 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16300 ) ( CLEAR ?auto_16299 ) ( ON-TABLE ?auto_16298 ) ( ON ?auto_16299 ?auto_16298 ) ( not ( = ?auto_16298 ?auto_16299 ) ) ( not ( = ?auto_16298 ?auto_16300 ) ) ( not ( = ?auto_16299 ?auto_16300 ) ) )
    :subtasks
    ( ( !STACK ?auto_16300 ?auto_16299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16301 - BLOCK
      ?auto_16302 - BLOCK
      ?auto_16303 - BLOCK
    )
    :vars
    (
      ?auto_16304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16302 ) ( ON-TABLE ?auto_16301 ) ( ON ?auto_16302 ?auto_16301 ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16303 ) ) ( not ( = ?auto_16302 ?auto_16303 ) ) ( ON ?auto_16303 ?auto_16304 ) ( CLEAR ?auto_16303 ) ( HAND-EMPTY ) ( not ( = ?auto_16301 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16303 ?auto_16304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16303 ?auto_16304 )
      ( MAKE-3PILE ?auto_16301 ?auto_16302 ?auto_16303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16305 - BLOCK
      ?auto_16306 - BLOCK
      ?auto_16307 - BLOCK
    )
    :vars
    (
      ?auto_16308 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16305 ) ( not ( = ?auto_16305 ?auto_16306 ) ) ( not ( = ?auto_16305 ?auto_16307 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( ON ?auto_16307 ?auto_16308 ) ( CLEAR ?auto_16307 ) ( not ( = ?auto_16305 ?auto_16308 ) ) ( not ( = ?auto_16306 ?auto_16308 ) ) ( not ( = ?auto_16307 ?auto_16308 ) ) ( HOLDING ?auto_16306 ) ( CLEAR ?auto_16305 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16305 ?auto_16306 )
      ( MAKE-3PILE ?auto_16305 ?auto_16306 ?auto_16307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16309 - BLOCK
      ?auto_16310 - BLOCK
      ?auto_16311 - BLOCK
    )
    :vars
    (
      ?auto_16312 - BLOCK
      ?auto_16313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16309 ) ( not ( = ?auto_16309 ?auto_16310 ) ) ( not ( = ?auto_16309 ?auto_16311 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( ON ?auto_16311 ?auto_16312 ) ( not ( = ?auto_16309 ?auto_16312 ) ) ( not ( = ?auto_16310 ?auto_16312 ) ) ( not ( = ?auto_16311 ?auto_16312 ) ) ( CLEAR ?auto_16309 ) ( ON ?auto_16310 ?auto_16311 ) ( CLEAR ?auto_16310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16313 ) ( ON ?auto_16312 ?auto_16313 ) ( not ( = ?auto_16313 ?auto_16312 ) ) ( not ( = ?auto_16313 ?auto_16311 ) ) ( not ( = ?auto_16313 ?auto_16310 ) ) ( not ( = ?auto_16309 ?auto_16313 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16313 ?auto_16312 ?auto_16311 )
      ( MAKE-3PILE ?auto_16309 ?auto_16310 ?auto_16311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16314 - BLOCK
      ?auto_16315 - BLOCK
      ?auto_16316 - BLOCK
    )
    :vars
    (
      ?auto_16317 - BLOCK
      ?auto_16318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16314 ?auto_16315 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16315 ?auto_16316 ) ) ( ON ?auto_16316 ?auto_16317 ) ( not ( = ?auto_16314 ?auto_16317 ) ) ( not ( = ?auto_16315 ?auto_16317 ) ) ( not ( = ?auto_16316 ?auto_16317 ) ) ( ON ?auto_16315 ?auto_16316 ) ( CLEAR ?auto_16315 ) ( ON-TABLE ?auto_16318 ) ( ON ?auto_16317 ?auto_16318 ) ( not ( = ?auto_16318 ?auto_16317 ) ) ( not ( = ?auto_16318 ?auto_16316 ) ) ( not ( = ?auto_16318 ?auto_16315 ) ) ( not ( = ?auto_16314 ?auto_16318 ) ) ( HOLDING ?auto_16314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16314 )
      ( MAKE-3PILE ?auto_16314 ?auto_16315 ?auto_16316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16319 - BLOCK
      ?auto_16320 - BLOCK
      ?auto_16321 - BLOCK
    )
    :vars
    (
      ?auto_16322 - BLOCK
      ?auto_16323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16319 ?auto_16320 ) ) ( not ( = ?auto_16319 ?auto_16321 ) ) ( not ( = ?auto_16320 ?auto_16321 ) ) ( ON ?auto_16321 ?auto_16322 ) ( not ( = ?auto_16319 ?auto_16322 ) ) ( not ( = ?auto_16320 ?auto_16322 ) ) ( not ( = ?auto_16321 ?auto_16322 ) ) ( ON ?auto_16320 ?auto_16321 ) ( ON-TABLE ?auto_16323 ) ( ON ?auto_16322 ?auto_16323 ) ( not ( = ?auto_16323 ?auto_16322 ) ) ( not ( = ?auto_16323 ?auto_16321 ) ) ( not ( = ?auto_16323 ?auto_16320 ) ) ( not ( = ?auto_16319 ?auto_16323 ) ) ( ON ?auto_16319 ?auto_16320 ) ( CLEAR ?auto_16319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16323 ?auto_16322 ?auto_16321 ?auto_16320 )
      ( MAKE-3PILE ?auto_16319 ?auto_16320 ?auto_16321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16325 - BLOCK
    )
    :vars
    (
      ?auto_16326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16326 ?auto_16325 ) ( CLEAR ?auto_16326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16325 ) ( not ( = ?auto_16325 ?auto_16326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16326 ?auto_16325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16327 - BLOCK
    )
    :vars
    (
      ?auto_16328 - BLOCK
      ?auto_16329 - BLOCK
      ?auto_16330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16328 ?auto_16327 ) ( CLEAR ?auto_16328 ) ( ON-TABLE ?auto_16327 ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( HOLDING ?auto_16329 ) ( CLEAR ?auto_16330 ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16327 ?auto_16330 ) ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16330 ) ) ( not ( = ?auto_16329 ?auto_16330 ) ) )
    :subtasks
    ( ( !STACK ?auto_16329 ?auto_16330 )
      ( MAKE-1PILE ?auto_16327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16331 - BLOCK
    )
    :vars
    (
      ?auto_16334 - BLOCK
      ?auto_16333 - BLOCK
      ?auto_16332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16334 ?auto_16331 ) ( ON-TABLE ?auto_16331 ) ( not ( = ?auto_16331 ?auto_16334 ) ) ( CLEAR ?auto_16333 ) ( not ( = ?auto_16331 ?auto_16332 ) ) ( not ( = ?auto_16331 ?auto_16333 ) ) ( not ( = ?auto_16334 ?auto_16332 ) ) ( not ( = ?auto_16334 ?auto_16333 ) ) ( not ( = ?auto_16332 ?auto_16333 ) ) ( ON ?auto_16332 ?auto_16334 ) ( CLEAR ?auto_16332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16331 ?auto_16334 )
      ( MAKE-1PILE ?auto_16331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16335 - BLOCK
    )
    :vars
    (
      ?auto_16336 - BLOCK
      ?auto_16337 - BLOCK
      ?auto_16338 - BLOCK
      ?auto_16339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16336 ?auto_16335 ) ( ON-TABLE ?auto_16335 ) ( not ( = ?auto_16335 ?auto_16336 ) ) ( not ( = ?auto_16335 ?auto_16337 ) ) ( not ( = ?auto_16335 ?auto_16338 ) ) ( not ( = ?auto_16336 ?auto_16337 ) ) ( not ( = ?auto_16336 ?auto_16338 ) ) ( not ( = ?auto_16337 ?auto_16338 ) ) ( ON ?auto_16337 ?auto_16336 ) ( CLEAR ?auto_16337 ) ( HOLDING ?auto_16338 ) ( CLEAR ?auto_16339 ) ( ON-TABLE ?auto_16339 ) ( not ( = ?auto_16339 ?auto_16338 ) ) ( not ( = ?auto_16335 ?auto_16339 ) ) ( not ( = ?auto_16336 ?auto_16339 ) ) ( not ( = ?auto_16337 ?auto_16339 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16339 ?auto_16338 )
      ( MAKE-1PILE ?auto_16335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16340 - BLOCK
    )
    :vars
    (
      ?auto_16344 - BLOCK
      ?auto_16341 - BLOCK
      ?auto_16342 - BLOCK
      ?auto_16343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16344 ?auto_16340 ) ( ON-TABLE ?auto_16340 ) ( not ( = ?auto_16340 ?auto_16344 ) ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16344 ?auto_16341 ) ) ( not ( = ?auto_16344 ?auto_16342 ) ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( ON ?auto_16341 ?auto_16344 ) ( CLEAR ?auto_16343 ) ( ON-TABLE ?auto_16343 ) ( not ( = ?auto_16343 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16344 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( ON ?auto_16342 ?auto_16341 ) ( CLEAR ?auto_16342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16340 ?auto_16344 ?auto_16341 )
      ( MAKE-1PILE ?auto_16340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16345 - BLOCK
    )
    :vars
    (
      ?auto_16348 - BLOCK
      ?auto_16347 - BLOCK
      ?auto_16349 - BLOCK
      ?auto_16346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16348 ?auto_16345 ) ( ON-TABLE ?auto_16345 ) ( not ( = ?auto_16345 ?auto_16348 ) ) ( not ( = ?auto_16345 ?auto_16347 ) ) ( not ( = ?auto_16345 ?auto_16349 ) ) ( not ( = ?auto_16348 ?auto_16347 ) ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( ON ?auto_16347 ?auto_16348 ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( not ( = ?auto_16345 ?auto_16346 ) ) ( not ( = ?auto_16348 ?auto_16346 ) ) ( not ( = ?auto_16347 ?auto_16346 ) ) ( ON ?auto_16349 ?auto_16347 ) ( CLEAR ?auto_16349 ) ( HOLDING ?auto_16346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16346 )
      ( MAKE-1PILE ?auto_16345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16350 - BLOCK
    )
    :vars
    (
      ?auto_16351 - BLOCK
      ?auto_16353 - BLOCK
      ?auto_16354 - BLOCK
      ?auto_16352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16351 ?auto_16350 ) ( ON-TABLE ?auto_16350 ) ( not ( = ?auto_16350 ?auto_16351 ) ) ( not ( = ?auto_16350 ?auto_16353 ) ) ( not ( = ?auto_16350 ?auto_16354 ) ) ( not ( = ?auto_16351 ?auto_16353 ) ) ( not ( = ?auto_16351 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( ON ?auto_16353 ?auto_16351 ) ( not ( = ?auto_16352 ?auto_16354 ) ) ( not ( = ?auto_16350 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16352 ) ) ( not ( = ?auto_16353 ?auto_16352 ) ) ( ON ?auto_16354 ?auto_16353 ) ( ON ?auto_16352 ?auto_16354 ) ( CLEAR ?auto_16352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16350 ?auto_16351 ?auto_16353 ?auto_16354 )
      ( MAKE-1PILE ?auto_16350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16359 - BLOCK
      ?auto_16360 - BLOCK
      ?auto_16361 - BLOCK
      ?auto_16362 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16362 ) ( CLEAR ?auto_16361 ) ( ON-TABLE ?auto_16359 ) ( ON ?auto_16360 ?auto_16359 ) ( ON ?auto_16361 ?auto_16360 ) ( not ( = ?auto_16359 ?auto_16360 ) ) ( not ( = ?auto_16359 ?auto_16361 ) ) ( not ( = ?auto_16359 ?auto_16362 ) ) ( not ( = ?auto_16360 ?auto_16361 ) ) ( not ( = ?auto_16360 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16362 ) ) )
    :subtasks
    ( ( !STACK ?auto_16362 ?auto_16361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16363 - BLOCK
      ?auto_16364 - BLOCK
      ?auto_16365 - BLOCK
      ?auto_16366 - BLOCK
    )
    :vars
    (
      ?auto_16367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16365 ) ( ON-TABLE ?auto_16363 ) ( ON ?auto_16364 ?auto_16363 ) ( ON ?auto_16365 ?auto_16364 ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( not ( = ?auto_16363 ?auto_16365 ) ) ( not ( = ?auto_16363 ?auto_16366 ) ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16366 ) ) ( not ( = ?auto_16365 ?auto_16366 ) ) ( ON ?auto_16366 ?auto_16367 ) ( CLEAR ?auto_16366 ) ( HAND-EMPTY ) ( not ( = ?auto_16363 ?auto_16367 ) ) ( not ( = ?auto_16364 ?auto_16367 ) ) ( not ( = ?auto_16365 ?auto_16367 ) ) ( not ( = ?auto_16366 ?auto_16367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16366 ?auto_16367 )
      ( MAKE-4PILE ?auto_16363 ?auto_16364 ?auto_16365 ?auto_16366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16368 - BLOCK
      ?auto_16369 - BLOCK
      ?auto_16370 - BLOCK
      ?auto_16371 - BLOCK
    )
    :vars
    (
      ?auto_16372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16368 ) ( ON ?auto_16369 ?auto_16368 ) ( not ( = ?auto_16368 ?auto_16369 ) ) ( not ( = ?auto_16368 ?auto_16370 ) ) ( not ( = ?auto_16368 ?auto_16371 ) ) ( not ( = ?auto_16369 ?auto_16370 ) ) ( not ( = ?auto_16369 ?auto_16371 ) ) ( not ( = ?auto_16370 ?auto_16371 ) ) ( ON ?auto_16371 ?auto_16372 ) ( CLEAR ?auto_16371 ) ( not ( = ?auto_16368 ?auto_16372 ) ) ( not ( = ?auto_16369 ?auto_16372 ) ) ( not ( = ?auto_16370 ?auto_16372 ) ) ( not ( = ?auto_16371 ?auto_16372 ) ) ( HOLDING ?auto_16370 ) ( CLEAR ?auto_16369 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16368 ?auto_16369 ?auto_16370 )
      ( MAKE-4PILE ?auto_16368 ?auto_16369 ?auto_16370 ?auto_16371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16373 - BLOCK
      ?auto_16374 - BLOCK
      ?auto_16375 - BLOCK
      ?auto_16376 - BLOCK
    )
    :vars
    (
      ?auto_16377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16373 ) ( ON ?auto_16374 ?auto_16373 ) ( not ( = ?auto_16373 ?auto_16374 ) ) ( not ( = ?auto_16373 ?auto_16375 ) ) ( not ( = ?auto_16373 ?auto_16376 ) ) ( not ( = ?auto_16374 ?auto_16375 ) ) ( not ( = ?auto_16374 ?auto_16376 ) ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( ON ?auto_16376 ?auto_16377 ) ( not ( = ?auto_16373 ?auto_16377 ) ) ( not ( = ?auto_16374 ?auto_16377 ) ) ( not ( = ?auto_16375 ?auto_16377 ) ) ( not ( = ?auto_16376 ?auto_16377 ) ) ( CLEAR ?auto_16374 ) ( ON ?auto_16375 ?auto_16376 ) ( CLEAR ?auto_16375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16377 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16377 ?auto_16376 )
      ( MAKE-4PILE ?auto_16373 ?auto_16374 ?auto_16375 ?auto_16376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16378 - BLOCK
      ?auto_16379 - BLOCK
      ?auto_16380 - BLOCK
      ?auto_16381 - BLOCK
    )
    :vars
    (
      ?auto_16382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16378 ) ( not ( = ?auto_16378 ?auto_16379 ) ) ( not ( = ?auto_16378 ?auto_16380 ) ) ( not ( = ?auto_16378 ?auto_16381 ) ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16379 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16381 ) ) ( ON ?auto_16381 ?auto_16382 ) ( not ( = ?auto_16378 ?auto_16382 ) ) ( not ( = ?auto_16379 ?auto_16382 ) ) ( not ( = ?auto_16380 ?auto_16382 ) ) ( not ( = ?auto_16381 ?auto_16382 ) ) ( ON ?auto_16380 ?auto_16381 ) ( CLEAR ?auto_16380 ) ( ON-TABLE ?auto_16382 ) ( HOLDING ?auto_16379 ) ( CLEAR ?auto_16378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16378 ?auto_16379 )
      ( MAKE-4PILE ?auto_16378 ?auto_16379 ?auto_16380 ?auto_16381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16383 - BLOCK
      ?auto_16384 - BLOCK
      ?auto_16385 - BLOCK
      ?auto_16386 - BLOCK
    )
    :vars
    (
      ?auto_16387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16383 ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16383 ?auto_16385 ) ) ( not ( = ?auto_16383 ?auto_16386 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16386 ) ) ( not ( = ?auto_16385 ?auto_16386 ) ) ( ON ?auto_16386 ?auto_16387 ) ( not ( = ?auto_16383 ?auto_16387 ) ) ( not ( = ?auto_16384 ?auto_16387 ) ) ( not ( = ?auto_16385 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16387 ) ) ( ON ?auto_16385 ?auto_16386 ) ( ON-TABLE ?auto_16387 ) ( CLEAR ?auto_16383 ) ( ON ?auto_16384 ?auto_16385 ) ( CLEAR ?auto_16384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16387 ?auto_16386 ?auto_16385 )
      ( MAKE-4PILE ?auto_16383 ?auto_16384 ?auto_16385 ?auto_16386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16388 - BLOCK
      ?auto_16389 - BLOCK
      ?auto_16390 - BLOCK
      ?auto_16391 - BLOCK
    )
    :vars
    (
      ?auto_16392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16388 ?auto_16389 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) ( not ( = ?auto_16388 ?auto_16391 ) ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( not ( = ?auto_16389 ?auto_16391 ) ) ( not ( = ?auto_16390 ?auto_16391 ) ) ( ON ?auto_16391 ?auto_16392 ) ( not ( = ?auto_16388 ?auto_16392 ) ) ( not ( = ?auto_16389 ?auto_16392 ) ) ( not ( = ?auto_16390 ?auto_16392 ) ) ( not ( = ?auto_16391 ?auto_16392 ) ) ( ON ?auto_16390 ?auto_16391 ) ( ON-TABLE ?auto_16392 ) ( ON ?auto_16389 ?auto_16390 ) ( CLEAR ?auto_16389 ) ( HOLDING ?auto_16388 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16388 )
      ( MAKE-4PILE ?auto_16388 ?auto_16389 ?auto_16390 ?auto_16391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16393 - BLOCK
      ?auto_16394 - BLOCK
      ?auto_16395 - BLOCK
      ?auto_16396 - BLOCK
    )
    :vars
    (
      ?auto_16397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16393 ?auto_16394 ) ) ( not ( = ?auto_16393 ?auto_16395 ) ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16394 ?auto_16395 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( ON ?auto_16396 ?auto_16397 ) ( not ( = ?auto_16393 ?auto_16397 ) ) ( not ( = ?auto_16394 ?auto_16397 ) ) ( not ( = ?auto_16395 ?auto_16397 ) ) ( not ( = ?auto_16396 ?auto_16397 ) ) ( ON ?auto_16395 ?auto_16396 ) ( ON-TABLE ?auto_16397 ) ( ON ?auto_16394 ?auto_16395 ) ( ON ?auto_16393 ?auto_16394 ) ( CLEAR ?auto_16393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16397 ?auto_16396 ?auto_16395 ?auto_16394 )
      ( MAKE-4PILE ?auto_16393 ?auto_16394 ?auto_16395 ?auto_16396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16401 - BLOCK
      ?auto_16402 - BLOCK
      ?auto_16403 - BLOCK
    )
    :vars
    (
      ?auto_16404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16404 ?auto_16403 ) ( CLEAR ?auto_16404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16401 ) ( ON ?auto_16402 ?auto_16401 ) ( ON ?auto_16403 ?auto_16402 ) ( not ( = ?auto_16401 ?auto_16402 ) ) ( not ( = ?auto_16401 ?auto_16403 ) ) ( not ( = ?auto_16401 ?auto_16404 ) ) ( not ( = ?auto_16402 ?auto_16403 ) ) ( not ( = ?auto_16402 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16404 ?auto_16403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16414 - BLOCK
      ?auto_16415 - BLOCK
      ?auto_16416 - BLOCK
    )
    :vars
    (
      ?auto_16417 - BLOCK
      ?auto_16418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16414 ) ( ON ?auto_16415 ?auto_16414 ) ( not ( = ?auto_16414 ?auto_16415 ) ) ( not ( = ?auto_16414 ?auto_16416 ) ) ( not ( = ?auto_16414 ?auto_16417 ) ) ( not ( = ?auto_16415 ?auto_16416 ) ) ( not ( = ?auto_16415 ?auto_16417 ) ) ( not ( = ?auto_16416 ?auto_16417 ) ) ( ON ?auto_16417 ?auto_16418 ) ( CLEAR ?auto_16417 ) ( not ( = ?auto_16414 ?auto_16418 ) ) ( not ( = ?auto_16415 ?auto_16418 ) ) ( not ( = ?auto_16416 ?auto_16418 ) ) ( not ( = ?auto_16417 ?auto_16418 ) ) ( HOLDING ?auto_16416 ) ( CLEAR ?auto_16415 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16414 ?auto_16415 ?auto_16416 ?auto_16417 )
      ( MAKE-3PILE ?auto_16414 ?auto_16415 ?auto_16416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16419 - BLOCK
      ?auto_16420 - BLOCK
      ?auto_16421 - BLOCK
    )
    :vars
    (
      ?auto_16423 - BLOCK
      ?auto_16422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16419 ) ( ON ?auto_16420 ?auto_16419 ) ( not ( = ?auto_16419 ?auto_16420 ) ) ( not ( = ?auto_16419 ?auto_16421 ) ) ( not ( = ?auto_16419 ?auto_16423 ) ) ( not ( = ?auto_16420 ?auto_16421 ) ) ( not ( = ?auto_16420 ?auto_16423 ) ) ( not ( = ?auto_16421 ?auto_16423 ) ) ( ON ?auto_16423 ?auto_16422 ) ( not ( = ?auto_16419 ?auto_16422 ) ) ( not ( = ?auto_16420 ?auto_16422 ) ) ( not ( = ?auto_16421 ?auto_16422 ) ) ( not ( = ?auto_16423 ?auto_16422 ) ) ( CLEAR ?auto_16420 ) ( ON ?auto_16421 ?auto_16423 ) ( CLEAR ?auto_16421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16422 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16422 ?auto_16423 )
      ( MAKE-3PILE ?auto_16419 ?auto_16420 ?auto_16421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16424 - BLOCK
      ?auto_16425 - BLOCK
      ?auto_16426 - BLOCK
    )
    :vars
    (
      ?auto_16428 - BLOCK
      ?auto_16427 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16424 ) ( not ( = ?auto_16424 ?auto_16425 ) ) ( not ( = ?auto_16424 ?auto_16426 ) ) ( not ( = ?auto_16424 ?auto_16428 ) ) ( not ( = ?auto_16425 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16428 ) ) ( not ( = ?auto_16426 ?auto_16428 ) ) ( ON ?auto_16428 ?auto_16427 ) ( not ( = ?auto_16424 ?auto_16427 ) ) ( not ( = ?auto_16425 ?auto_16427 ) ) ( not ( = ?auto_16426 ?auto_16427 ) ) ( not ( = ?auto_16428 ?auto_16427 ) ) ( ON ?auto_16426 ?auto_16428 ) ( CLEAR ?auto_16426 ) ( ON-TABLE ?auto_16427 ) ( HOLDING ?auto_16425 ) ( CLEAR ?auto_16424 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16424 ?auto_16425 )
      ( MAKE-3PILE ?auto_16424 ?auto_16425 ?auto_16426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16429 - BLOCK
      ?auto_16430 - BLOCK
      ?auto_16431 - BLOCK
    )
    :vars
    (
      ?auto_16432 - BLOCK
      ?auto_16433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16429 ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16431 ) ) ( not ( = ?auto_16429 ?auto_16432 ) ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16430 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( ON ?auto_16432 ?auto_16433 ) ( not ( = ?auto_16429 ?auto_16433 ) ) ( not ( = ?auto_16430 ?auto_16433 ) ) ( not ( = ?auto_16431 ?auto_16433 ) ) ( not ( = ?auto_16432 ?auto_16433 ) ) ( ON ?auto_16431 ?auto_16432 ) ( ON-TABLE ?auto_16433 ) ( CLEAR ?auto_16429 ) ( ON ?auto_16430 ?auto_16431 ) ( CLEAR ?auto_16430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16433 ?auto_16432 ?auto_16431 )
      ( MAKE-3PILE ?auto_16429 ?auto_16430 ?auto_16431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16434 - BLOCK
      ?auto_16435 - BLOCK
      ?auto_16436 - BLOCK
    )
    :vars
    (
      ?auto_16438 - BLOCK
      ?auto_16437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16434 ?auto_16435 ) ) ( not ( = ?auto_16434 ?auto_16436 ) ) ( not ( = ?auto_16434 ?auto_16438 ) ) ( not ( = ?auto_16435 ?auto_16436 ) ) ( not ( = ?auto_16435 ?auto_16438 ) ) ( not ( = ?auto_16436 ?auto_16438 ) ) ( ON ?auto_16438 ?auto_16437 ) ( not ( = ?auto_16434 ?auto_16437 ) ) ( not ( = ?auto_16435 ?auto_16437 ) ) ( not ( = ?auto_16436 ?auto_16437 ) ) ( not ( = ?auto_16438 ?auto_16437 ) ) ( ON ?auto_16436 ?auto_16438 ) ( ON-TABLE ?auto_16437 ) ( ON ?auto_16435 ?auto_16436 ) ( CLEAR ?auto_16435 ) ( HOLDING ?auto_16434 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16434 )
      ( MAKE-3PILE ?auto_16434 ?auto_16435 ?auto_16436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16439 - BLOCK
      ?auto_16440 - BLOCK
      ?auto_16441 - BLOCK
    )
    :vars
    (
      ?auto_16443 - BLOCK
      ?auto_16442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16439 ?auto_16440 ) ) ( not ( = ?auto_16439 ?auto_16441 ) ) ( not ( = ?auto_16439 ?auto_16443 ) ) ( not ( = ?auto_16440 ?auto_16441 ) ) ( not ( = ?auto_16440 ?auto_16443 ) ) ( not ( = ?auto_16441 ?auto_16443 ) ) ( ON ?auto_16443 ?auto_16442 ) ( not ( = ?auto_16439 ?auto_16442 ) ) ( not ( = ?auto_16440 ?auto_16442 ) ) ( not ( = ?auto_16441 ?auto_16442 ) ) ( not ( = ?auto_16443 ?auto_16442 ) ) ( ON ?auto_16441 ?auto_16443 ) ( ON-TABLE ?auto_16442 ) ( ON ?auto_16440 ?auto_16441 ) ( ON ?auto_16439 ?auto_16440 ) ( CLEAR ?auto_16439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16442 ?auto_16443 ?auto_16441 ?auto_16440 )
      ( MAKE-3PILE ?auto_16439 ?auto_16440 ?auto_16441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16445 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16446 - BLOCK
    )
    :vars
    (
      ?auto_16447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16446 ?auto_16447 ) ( CLEAR ?auto_16446 ) ( HAND-EMPTY ) ( not ( = ?auto_16446 ?auto_16447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16446 ?auto_16447 )
      ( MAKE-1PILE ?auto_16446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16448 - BLOCK
    )
    :vars
    (
      ?auto_16449 - BLOCK
      ?auto_16450 - BLOCK
      ?auto_16451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16448 ?auto_16449 ) ) ( HOLDING ?auto_16448 ) ( CLEAR ?auto_16449 ) ( ON-TABLE ?auto_16450 ) ( ON ?auto_16451 ?auto_16450 ) ( ON ?auto_16449 ?auto_16451 ) ( not ( = ?auto_16450 ?auto_16451 ) ) ( not ( = ?auto_16450 ?auto_16449 ) ) ( not ( = ?auto_16450 ?auto_16448 ) ) ( not ( = ?auto_16451 ?auto_16449 ) ) ( not ( = ?auto_16451 ?auto_16448 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16450 ?auto_16451 ?auto_16449 ?auto_16448 )
      ( MAKE-1PILE ?auto_16448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16452 - BLOCK
    )
    :vars
    (
      ?auto_16453 - BLOCK
      ?auto_16455 - BLOCK
      ?auto_16454 - BLOCK
      ?auto_16456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16452 ?auto_16453 ) ) ( CLEAR ?auto_16453 ) ( ON-TABLE ?auto_16455 ) ( ON ?auto_16454 ?auto_16455 ) ( ON ?auto_16453 ?auto_16454 ) ( not ( = ?auto_16455 ?auto_16454 ) ) ( not ( = ?auto_16455 ?auto_16453 ) ) ( not ( = ?auto_16455 ?auto_16452 ) ) ( not ( = ?auto_16454 ?auto_16453 ) ) ( not ( = ?auto_16454 ?auto_16452 ) ) ( ON ?auto_16452 ?auto_16456 ) ( CLEAR ?auto_16452 ) ( HAND-EMPTY ) ( not ( = ?auto_16452 ?auto_16456 ) ) ( not ( = ?auto_16453 ?auto_16456 ) ) ( not ( = ?auto_16455 ?auto_16456 ) ) ( not ( = ?auto_16454 ?auto_16456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16452 ?auto_16456 )
      ( MAKE-1PILE ?auto_16452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16457 - BLOCK
    )
    :vars
    (
      ?auto_16458 - BLOCK
      ?auto_16460 - BLOCK
      ?auto_16459 - BLOCK
      ?auto_16461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16457 ?auto_16458 ) ) ( ON-TABLE ?auto_16460 ) ( ON ?auto_16459 ?auto_16460 ) ( not ( = ?auto_16460 ?auto_16459 ) ) ( not ( = ?auto_16460 ?auto_16458 ) ) ( not ( = ?auto_16460 ?auto_16457 ) ) ( not ( = ?auto_16459 ?auto_16458 ) ) ( not ( = ?auto_16459 ?auto_16457 ) ) ( ON ?auto_16457 ?auto_16461 ) ( CLEAR ?auto_16457 ) ( not ( = ?auto_16457 ?auto_16461 ) ) ( not ( = ?auto_16458 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16459 ?auto_16461 ) ) ( HOLDING ?auto_16458 ) ( CLEAR ?auto_16459 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16460 ?auto_16459 ?auto_16458 )
      ( MAKE-1PILE ?auto_16457 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16462 - BLOCK
    )
    :vars
    (
      ?auto_16463 - BLOCK
      ?auto_16466 - BLOCK
      ?auto_16464 - BLOCK
      ?auto_16465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16462 ?auto_16463 ) ) ( ON-TABLE ?auto_16466 ) ( ON ?auto_16464 ?auto_16466 ) ( not ( = ?auto_16466 ?auto_16464 ) ) ( not ( = ?auto_16466 ?auto_16463 ) ) ( not ( = ?auto_16466 ?auto_16462 ) ) ( not ( = ?auto_16464 ?auto_16463 ) ) ( not ( = ?auto_16464 ?auto_16462 ) ) ( ON ?auto_16462 ?auto_16465 ) ( not ( = ?auto_16462 ?auto_16465 ) ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( not ( = ?auto_16466 ?auto_16465 ) ) ( not ( = ?auto_16464 ?auto_16465 ) ) ( CLEAR ?auto_16464 ) ( ON ?auto_16463 ?auto_16462 ) ( CLEAR ?auto_16463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16465 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16465 ?auto_16462 )
      ( MAKE-1PILE ?auto_16462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16467 - BLOCK
    )
    :vars
    (
      ?auto_16470 - BLOCK
      ?auto_16469 - BLOCK
      ?auto_16468 - BLOCK
      ?auto_16471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16467 ?auto_16470 ) ) ( ON-TABLE ?auto_16469 ) ( not ( = ?auto_16469 ?auto_16468 ) ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( not ( = ?auto_16469 ?auto_16467 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16467 ) ) ( ON ?auto_16467 ?auto_16471 ) ( not ( = ?auto_16467 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16471 ) ) ( not ( = ?auto_16468 ?auto_16471 ) ) ( ON ?auto_16470 ?auto_16467 ) ( CLEAR ?auto_16470 ) ( ON-TABLE ?auto_16471 ) ( HOLDING ?auto_16468 ) ( CLEAR ?auto_16469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16469 ?auto_16468 )
      ( MAKE-1PILE ?auto_16467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16472 - BLOCK
    )
    :vars
    (
      ?auto_16473 - BLOCK
      ?auto_16475 - BLOCK
      ?auto_16474 - BLOCK
      ?auto_16476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16472 ?auto_16473 ) ) ( ON-TABLE ?auto_16475 ) ( not ( = ?auto_16475 ?auto_16474 ) ) ( not ( = ?auto_16475 ?auto_16473 ) ) ( not ( = ?auto_16475 ?auto_16472 ) ) ( not ( = ?auto_16474 ?auto_16473 ) ) ( not ( = ?auto_16474 ?auto_16472 ) ) ( ON ?auto_16472 ?auto_16476 ) ( not ( = ?auto_16472 ?auto_16476 ) ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( not ( = ?auto_16475 ?auto_16476 ) ) ( not ( = ?auto_16474 ?auto_16476 ) ) ( ON ?auto_16473 ?auto_16472 ) ( ON-TABLE ?auto_16476 ) ( CLEAR ?auto_16475 ) ( ON ?auto_16474 ?auto_16473 ) ( CLEAR ?auto_16474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16476 ?auto_16472 ?auto_16473 )
      ( MAKE-1PILE ?auto_16472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16477 - BLOCK
    )
    :vars
    (
      ?auto_16479 - BLOCK
      ?auto_16481 - BLOCK
      ?auto_16478 - BLOCK
      ?auto_16480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16477 ?auto_16479 ) ) ( not ( = ?auto_16481 ?auto_16478 ) ) ( not ( = ?auto_16481 ?auto_16479 ) ) ( not ( = ?auto_16481 ?auto_16477 ) ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16477 ) ) ( ON ?auto_16477 ?auto_16480 ) ( not ( = ?auto_16477 ?auto_16480 ) ) ( not ( = ?auto_16479 ?auto_16480 ) ) ( not ( = ?auto_16481 ?auto_16480 ) ) ( not ( = ?auto_16478 ?auto_16480 ) ) ( ON ?auto_16479 ?auto_16477 ) ( ON-TABLE ?auto_16480 ) ( ON ?auto_16478 ?auto_16479 ) ( CLEAR ?auto_16478 ) ( HOLDING ?auto_16481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16481 )
      ( MAKE-1PILE ?auto_16477 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16482 - BLOCK
    )
    :vars
    (
      ?auto_16483 - BLOCK
      ?auto_16485 - BLOCK
      ?auto_16486 - BLOCK
      ?auto_16484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16482 ?auto_16483 ) ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( not ( = ?auto_16485 ?auto_16483 ) ) ( not ( = ?auto_16485 ?auto_16482 ) ) ( not ( = ?auto_16486 ?auto_16483 ) ) ( not ( = ?auto_16486 ?auto_16482 ) ) ( ON ?auto_16482 ?auto_16484 ) ( not ( = ?auto_16482 ?auto_16484 ) ) ( not ( = ?auto_16483 ?auto_16484 ) ) ( not ( = ?auto_16485 ?auto_16484 ) ) ( not ( = ?auto_16486 ?auto_16484 ) ) ( ON ?auto_16483 ?auto_16482 ) ( ON-TABLE ?auto_16484 ) ( ON ?auto_16486 ?auto_16483 ) ( ON ?auto_16485 ?auto_16486 ) ( CLEAR ?auto_16485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16484 ?auto_16482 ?auto_16483 ?auto_16486 )
      ( MAKE-1PILE ?auto_16482 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16489 - BLOCK
      ?auto_16490 - BLOCK
    )
    :vars
    (
      ?auto_16491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16491 ?auto_16490 ) ( CLEAR ?auto_16491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16489 ) ( ON ?auto_16490 ?auto_16489 ) ( not ( = ?auto_16489 ?auto_16490 ) ) ( not ( = ?auto_16489 ?auto_16491 ) ) ( not ( = ?auto_16490 ?auto_16491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16491 ?auto_16490 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16492 - BLOCK
      ?auto_16493 - BLOCK
    )
    :vars
    (
      ?auto_16494 - BLOCK
      ?auto_16495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16494 ?auto_16493 ) ( CLEAR ?auto_16494 ) ( ON-TABLE ?auto_16492 ) ( ON ?auto_16493 ?auto_16492 ) ( not ( = ?auto_16492 ?auto_16493 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16493 ?auto_16494 ) ) ( HOLDING ?auto_16495 ) ( not ( = ?auto_16492 ?auto_16495 ) ) ( not ( = ?auto_16493 ?auto_16495 ) ) ( not ( = ?auto_16494 ?auto_16495 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16495 )
      ( MAKE-2PILE ?auto_16492 ?auto_16493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16496 - BLOCK
      ?auto_16497 - BLOCK
    )
    :vars
    (
      ?auto_16499 - BLOCK
      ?auto_16498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16499 ?auto_16497 ) ( ON-TABLE ?auto_16496 ) ( ON ?auto_16497 ?auto_16496 ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16499 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16497 ?auto_16498 ) ) ( not ( = ?auto_16499 ?auto_16498 ) ) ( ON ?auto_16498 ?auto_16499 ) ( CLEAR ?auto_16498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16496 ?auto_16497 ?auto_16499 )
      ( MAKE-2PILE ?auto_16496 ?auto_16497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16500 - BLOCK
      ?auto_16501 - BLOCK
    )
    :vars
    (
      ?auto_16502 - BLOCK
      ?auto_16503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16502 ?auto_16501 ) ( ON-TABLE ?auto_16500 ) ( ON ?auto_16501 ?auto_16500 ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( not ( = ?auto_16500 ?auto_16503 ) ) ( not ( = ?auto_16501 ?auto_16503 ) ) ( not ( = ?auto_16502 ?auto_16503 ) ) ( HOLDING ?auto_16503 ) ( CLEAR ?auto_16502 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16500 ?auto_16501 ?auto_16502 ?auto_16503 )
      ( MAKE-2PILE ?auto_16500 ?auto_16501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16504 - BLOCK
      ?auto_16505 - BLOCK
    )
    :vars
    (
      ?auto_16506 - BLOCK
      ?auto_16507 - BLOCK
      ?auto_16508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16506 ?auto_16505 ) ( ON-TABLE ?auto_16504 ) ( ON ?auto_16505 ?auto_16504 ) ( not ( = ?auto_16504 ?auto_16505 ) ) ( not ( = ?auto_16504 ?auto_16506 ) ) ( not ( = ?auto_16505 ?auto_16506 ) ) ( not ( = ?auto_16504 ?auto_16507 ) ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( CLEAR ?auto_16506 ) ( ON ?auto_16507 ?auto_16508 ) ( CLEAR ?auto_16507 ) ( HAND-EMPTY ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16505 ?auto_16508 ) ) ( not ( = ?auto_16506 ?auto_16508 ) ) ( not ( = ?auto_16507 ?auto_16508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16507 ?auto_16508 )
      ( MAKE-2PILE ?auto_16504 ?auto_16505 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16519 - BLOCK
      ?auto_16520 - BLOCK
    )
    :vars
    (
      ?auto_16523 - BLOCK
      ?auto_16521 - BLOCK
      ?auto_16522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16519 ) ( not ( = ?auto_16519 ?auto_16520 ) ) ( not ( = ?auto_16519 ?auto_16523 ) ) ( not ( = ?auto_16520 ?auto_16523 ) ) ( not ( = ?auto_16519 ?auto_16521 ) ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16523 ?auto_16521 ) ) ( ON ?auto_16521 ?auto_16522 ) ( not ( = ?auto_16519 ?auto_16522 ) ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( not ( = ?auto_16523 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( ON ?auto_16523 ?auto_16521 ) ( CLEAR ?auto_16523 ) ( HOLDING ?auto_16520 ) ( CLEAR ?auto_16519 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16519 ?auto_16520 ?auto_16523 )
      ( MAKE-2PILE ?auto_16519 ?auto_16520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16524 - BLOCK
      ?auto_16525 - BLOCK
    )
    :vars
    (
      ?auto_16527 - BLOCK
      ?auto_16528 - BLOCK
      ?auto_16526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16524 ) ( not ( = ?auto_16524 ?auto_16525 ) ) ( not ( = ?auto_16524 ?auto_16527 ) ) ( not ( = ?auto_16525 ?auto_16527 ) ) ( not ( = ?auto_16524 ?auto_16528 ) ) ( not ( = ?auto_16525 ?auto_16528 ) ) ( not ( = ?auto_16527 ?auto_16528 ) ) ( ON ?auto_16528 ?auto_16526 ) ( not ( = ?auto_16524 ?auto_16526 ) ) ( not ( = ?auto_16525 ?auto_16526 ) ) ( not ( = ?auto_16527 ?auto_16526 ) ) ( not ( = ?auto_16528 ?auto_16526 ) ) ( ON ?auto_16527 ?auto_16528 ) ( CLEAR ?auto_16524 ) ( ON ?auto_16525 ?auto_16527 ) ( CLEAR ?auto_16525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16526 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16526 ?auto_16528 ?auto_16527 )
      ( MAKE-2PILE ?auto_16524 ?auto_16525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16529 - BLOCK
      ?auto_16530 - BLOCK
    )
    :vars
    (
      ?auto_16532 - BLOCK
      ?auto_16533 - BLOCK
      ?auto_16531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16529 ?auto_16532 ) ) ( not ( = ?auto_16530 ?auto_16532 ) ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( not ( = ?auto_16530 ?auto_16533 ) ) ( not ( = ?auto_16532 ?auto_16533 ) ) ( ON ?auto_16533 ?auto_16531 ) ( not ( = ?auto_16529 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16532 ?auto_16531 ) ) ( not ( = ?auto_16533 ?auto_16531 ) ) ( ON ?auto_16532 ?auto_16533 ) ( ON ?auto_16530 ?auto_16532 ) ( CLEAR ?auto_16530 ) ( ON-TABLE ?auto_16531 ) ( HOLDING ?auto_16529 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16529 )
      ( MAKE-2PILE ?auto_16529 ?auto_16530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16534 - BLOCK
      ?auto_16535 - BLOCK
    )
    :vars
    (
      ?auto_16536 - BLOCK
      ?auto_16538 - BLOCK
      ?auto_16537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16534 ?auto_16535 ) ) ( not ( = ?auto_16534 ?auto_16536 ) ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16534 ?auto_16538 ) ) ( not ( = ?auto_16535 ?auto_16538 ) ) ( not ( = ?auto_16536 ?auto_16538 ) ) ( ON ?auto_16538 ?auto_16537 ) ( not ( = ?auto_16534 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) ( not ( = ?auto_16536 ?auto_16537 ) ) ( not ( = ?auto_16538 ?auto_16537 ) ) ( ON ?auto_16536 ?auto_16538 ) ( ON ?auto_16535 ?auto_16536 ) ( ON-TABLE ?auto_16537 ) ( ON ?auto_16534 ?auto_16535 ) ( CLEAR ?auto_16534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16537 ?auto_16538 ?auto_16536 ?auto_16535 )
      ( MAKE-2PILE ?auto_16534 ?auto_16535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16541 - BLOCK
      ?auto_16542 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16542 ) ( CLEAR ?auto_16541 ) ( ON-TABLE ?auto_16541 ) ( not ( = ?auto_16541 ?auto_16542 ) ) )
    :subtasks
    ( ( !STACK ?auto_16542 ?auto_16541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16543 - BLOCK
      ?auto_16544 - BLOCK
    )
    :vars
    (
      ?auto_16545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16543 ) ( ON-TABLE ?auto_16543 ) ( not ( = ?auto_16543 ?auto_16544 ) ) ( ON ?auto_16544 ?auto_16545 ) ( CLEAR ?auto_16544 ) ( HAND-EMPTY ) ( not ( = ?auto_16543 ?auto_16545 ) ) ( not ( = ?auto_16544 ?auto_16545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16544 ?auto_16545 )
      ( MAKE-2PILE ?auto_16543 ?auto_16544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16546 - BLOCK
      ?auto_16547 - BLOCK
    )
    :vars
    (
      ?auto_16548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16546 ?auto_16547 ) ) ( ON ?auto_16547 ?auto_16548 ) ( CLEAR ?auto_16547 ) ( not ( = ?auto_16546 ?auto_16548 ) ) ( not ( = ?auto_16547 ?auto_16548 ) ) ( HOLDING ?auto_16546 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16546 )
      ( MAKE-2PILE ?auto_16546 ?auto_16547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16549 - BLOCK
      ?auto_16550 - BLOCK
    )
    :vars
    (
      ?auto_16551 - BLOCK
      ?auto_16552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16549 ?auto_16550 ) ) ( ON ?auto_16550 ?auto_16551 ) ( not ( = ?auto_16549 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16551 ) ) ( ON ?auto_16549 ?auto_16550 ) ( CLEAR ?auto_16549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16552 ) ( ON ?auto_16551 ?auto_16552 ) ( not ( = ?auto_16552 ?auto_16551 ) ) ( not ( = ?auto_16552 ?auto_16550 ) ) ( not ( = ?auto_16552 ?auto_16549 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16552 ?auto_16551 ?auto_16550 )
      ( MAKE-2PILE ?auto_16549 ?auto_16550 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16553 - BLOCK
      ?auto_16554 - BLOCK
    )
    :vars
    (
      ?auto_16556 - BLOCK
      ?auto_16555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16553 ?auto_16554 ) ) ( ON ?auto_16554 ?auto_16556 ) ( not ( = ?auto_16553 ?auto_16556 ) ) ( not ( = ?auto_16554 ?auto_16556 ) ) ( ON-TABLE ?auto_16555 ) ( ON ?auto_16556 ?auto_16555 ) ( not ( = ?auto_16555 ?auto_16556 ) ) ( not ( = ?auto_16555 ?auto_16554 ) ) ( not ( = ?auto_16555 ?auto_16553 ) ) ( HOLDING ?auto_16553 ) ( CLEAR ?auto_16554 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16555 ?auto_16556 ?auto_16554 ?auto_16553 )
      ( MAKE-2PILE ?auto_16553 ?auto_16554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16557 - BLOCK
      ?auto_16558 - BLOCK
    )
    :vars
    (
      ?auto_16559 - BLOCK
      ?auto_16560 - BLOCK
      ?auto_16561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16557 ?auto_16558 ) ) ( ON ?auto_16558 ?auto_16559 ) ( not ( = ?auto_16557 ?auto_16559 ) ) ( not ( = ?auto_16558 ?auto_16559 ) ) ( ON-TABLE ?auto_16560 ) ( ON ?auto_16559 ?auto_16560 ) ( not ( = ?auto_16560 ?auto_16559 ) ) ( not ( = ?auto_16560 ?auto_16558 ) ) ( not ( = ?auto_16560 ?auto_16557 ) ) ( CLEAR ?auto_16558 ) ( ON ?auto_16557 ?auto_16561 ) ( CLEAR ?auto_16557 ) ( HAND-EMPTY ) ( not ( = ?auto_16557 ?auto_16561 ) ) ( not ( = ?auto_16558 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16561 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16557 ?auto_16561 )
      ( MAKE-2PILE ?auto_16557 ?auto_16558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16562 - BLOCK
      ?auto_16563 - BLOCK
    )
    :vars
    (
      ?auto_16566 - BLOCK
      ?auto_16565 - BLOCK
      ?auto_16564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16562 ?auto_16563 ) ) ( not ( = ?auto_16562 ?auto_16566 ) ) ( not ( = ?auto_16563 ?auto_16566 ) ) ( ON-TABLE ?auto_16565 ) ( ON ?auto_16566 ?auto_16565 ) ( not ( = ?auto_16565 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16563 ) ) ( not ( = ?auto_16565 ?auto_16562 ) ) ( ON ?auto_16562 ?auto_16564 ) ( CLEAR ?auto_16562 ) ( not ( = ?auto_16562 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16566 ?auto_16564 ) ) ( not ( = ?auto_16565 ?auto_16564 ) ) ( HOLDING ?auto_16563 ) ( CLEAR ?auto_16566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16565 ?auto_16566 ?auto_16563 )
      ( MAKE-2PILE ?auto_16562 ?auto_16563 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16567 - BLOCK
      ?auto_16568 - BLOCK
    )
    :vars
    (
      ?auto_16571 - BLOCK
      ?auto_16570 - BLOCK
      ?auto_16569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16567 ?auto_16568 ) ) ( not ( = ?auto_16567 ?auto_16571 ) ) ( not ( = ?auto_16568 ?auto_16571 ) ) ( ON-TABLE ?auto_16570 ) ( ON ?auto_16571 ?auto_16570 ) ( not ( = ?auto_16570 ?auto_16571 ) ) ( not ( = ?auto_16570 ?auto_16568 ) ) ( not ( = ?auto_16570 ?auto_16567 ) ) ( ON ?auto_16567 ?auto_16569 ) ( not ( = ?auto_16567 ?auto_16569 ) ) ( not ( = ?auto_16568 ?auto_16569 ) ) ( not ( = ?auto_16571 ?auto_16569 ) ) ( not ( = ?auto_16570 ?auto_16569 ) ) ( CLEAR ?auto_16571 ) ( ON ?auto_16568 ?auto_16567 ) ( CLEAR ?auto_16568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16569 ?auto_16567 )
      ( MAKE-2PILE ?auto_16567 ?auto_16568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16572 - BLOCK
      ?auto_16573 - BLOCK
    )
    :vars
    (
      ?auto_16576 - BLOCK
      ?auto_16575 - BLOCK
      ?auto_16574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16572 ?auto_16576 ) ) ( not ( = ?auto_16573 ?auto_16576 ) ) ( ON-TABLE ?auto_16575 ) ( not ( = ?auto_16575 ?auto_16576 ) ) ( not ( = ?auto_16575 ?auto_16573 ) ) ( not ( = ?auto_16575 ?auto_16572 ) ) ( ON ?auto_16572 ?auto_16574 ) ( not ( = ?auto_16572 ?auto_16574 ) ) ( not ( = ?auto_16573 ?auto_16574 ) ) ( not ( = ?auto_16576 ?auto_16574 ) ) ( not ( = ?auto_16575 ?auto_16574 ) ) ( ON ?auto_16573 ?auto_16572 ) ( CLEAR ?auto_16573 ) ( ON-TABLE ?auto_16574 ) ( HOLDING ?auto_16576 ) ( CLEAR ?auto_16575 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16575 ?auto_16576 )
      ( MAKE-2PILE ?auto_16572 ?auto_16573 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16577 - BLOCK
      ?auto_16578 - BLOCK
    )
    :vars
    (
      ?auto_16579 - BLOCK
      ?auto_16580 - BLOCK
      ?auto_16581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16577 ?auto_16578 ) ) ( not ( = ?auto_16577 ?auto_16579 ) ) ( not ( = ?auto_16578 ?auto_16579 ) ) ( ON-TABLE ?auto_16580 ) ( not ( = ?auto_16580 ?auto_16579 ) ) ( not ( = ?auto_16580 ?auto_16578 ) ) ( not ( = ?auto_16580 ?auto_16577 ) ) ( ON ?auto_16577 ?auto_16581 ) ( not ( = ?auto_16577 ?auto_16581 ) ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( not ( = ?auto_16580 ?auto_16581 ) ) ( ON ?auto_16578 ?auto_16577 ) ( ON-TABLE ?auto_16581 ) ( CLEAR ?auto_16580 ) ( ON ?auto_16579 ?auto_16578 ) ( CLEAR ?auto_16579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16581 ?auto_16577 ?auto_16578 )
      ( MAKE-2PILE ?auto_16577 ?auto_16578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16582 - BLOCK
      ?auto_16583 - BLOCK
    )
    :vars
    (
      ?auto_16585 - BLOCK
      ?auto_16584 - BLOCK
      ?auto_16586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16582 ?auto_16583 ) ) ( not ( = ?auto_16582 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16583 ) ) ( not ( = ?auto_16584 ?auto_16582 ) ) ( ON ?auto_16582 ?auto_16586 ) ( not ( = ?auto_16582 ?auto_16586 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16586 ) ) ( not ( = ?auto_16584 ?auto_16586 ) ) ( ON ?auto_16583 ?auto_16582 ) ( ON-TABLE ?auto_16586 ) ( ON ?auto_16585 ?auto_16583 ) ( CLEAR ?auto_16585 ) ( HOLDING ?auto_16584 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16584 )
      ( MAKE-2PILE ?auto_16582 ?auto_16583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16587 - BLOCK
      ?auto_16588 - BLOCK
    )
    :vars
    (
      ?auto_16591 - BLOCK
      ?auto_16590 - BLOCK
      ?auto_16589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16587 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16591 ) ) ( not ( = ?auto_16588 ?auto_16591 ) ) ( not ( = ?auto_16590 ?auto_16591 ) ) ( not ( = ?auto_16590 ?auto_16588 ) ) ( not ( = ?auto_16590 ?auto_16587 ) ) ( ON ?auto_16587 ?auto_16589 ) ( not ( = ?auto_16587 ?auto_16589 ) ) ( not ( = ?auto_16588 ?auto_16589 ) ) ( not ( = ?auto_16591 ?auto_16589 ) ) ( not ( = ?auto_16590 ?auto_16589 ) ) ( ON ?auto_16588 ?auto_16587 ) ( ON-TABLE ?auto_16589 ) ( ON ?auto_16591 ?auto_16588 ) ( ON ?auto_16590 ?auto_16591 ) ( CLEAR ?auto_16590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16589 ?auto_16587 ?auto_16588 ?auto_16591 )
      ( MAKE-2PILE ?auto_16587 ?auto_16588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16593 - BLOCK
    )
    :vars
    (
      ?auto_16594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16594 ?auto_16593 ) ( CLEAR ?auto_16594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16593 ) ( not ( = ?auto_16593 ?auto_16594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16594 ?auto_16593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16595 - BLOCK
    )
    :vars
    (
      ?auto_16596 - BLOCK
      ?auto_16597 - BLOCK
      ?auto_16598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16596 ?auto_16595 ) ( CLEAR ?auto_16596 ) ( ON-TABLE ?auto_16595 ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( HOLDING ?auto_16597 ) ( CLEAR ?auto_16598 ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16598 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16598 ) ) ( not ( = ?auto_16597 ?auto_16598 ) ) )
    :subtasks
    ( ( !STACK ?auto_16597 ?auto_16598 )
      ( MAKE-1PILE ?auto_16595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16599 - BLOCK
    )
    :vars
    (
      ?auto_16602 - BLOCK
      ?auto_16600 - BLOCK
      ?auto_16601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16602 ?auto_16599 ) ( ON-TABLE ?auto_16599 ) ( not ( = ?auto_16599 ?auto_16602 ) ) ( CLEAR ?auto_16600 ) ( not ( = ?auto_16599 ?auto_16601 ) ) ( not ( = ?auto_16599 ?auto_16600 ) ) ( not ( = ?auto_16602 ?auto_16601 ) ) ( not ( = ?auto_16602 ?auto_16600 ) ) ( not ( = ?auto_16601 ?auto_16600 ) ) ( ON ?auto_16601 ?auto_16602 ) ( CLEAR ?auto_16601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16599 ?auto_16602 )
      ( MAKE-1PILE ?auto_16599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16603 - BLOCK
    )
    :vars
    (
      ?auto_16605 - BLOCK
      ?auto_16604 - BLOCK
      ?auto_16606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16605 ?auto_16603 ) ( ON-TABLE ?auto_16603 ) ( not ( = ?auto_16603 ?auto_16605 ) ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16603 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16604 ) ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( ON ?auto_16604 ?auto_16605 ) ( CLEAR ?auto_16604 ) ( HOLDING ?auto_16606 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16606 )
      ( MAKE-1PILE ?auto_16603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16607 - BLOCK
    )
    :vars
    (
      ?auto_16610 - BLOCK
      ?auto_16609 - BLOCK
      ?auto_16608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16610 ?auto_16607 ) ( ON-TABLE ?auto_16607 ) ( not ( = ?auto_16607 ?auto_16610 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16610 ?auto_16609 ) ) ( not ( = ?auto_16610 ?auto_16608 ) ) ( not ( = ?auto_16609 ?auto_16608 ) ) ( ON ?auto_16609 ?auto_16610 ) ( ON ?auto_16608 ?auto_16609 ) ( CLEAR ?auto_16608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16607 ?auto_16610 ?auto_16609 )
      ( MAKE-1PILE ?auto_16607 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16611 - BLOCK
    )
    :vars
    (
      ?auto_16612 - BLOCK
      ?auto_16614 - BLOCK
      ?auto_16613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16612 ?auto_16611 ) ( ON-TABLE ?auto_16611 ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16614 ) ) ( not ( = ?auto_16611 ?auto_16613 ) ) ( not ( = ?auto_16612 ?auto_16614 ) ) ( not ( = ?auto_16612 ?auto_16613 ) ) ( not ( = ?auto_16614 ?auto_16613 ) ) ( ON ?auto_16614 ?auto_16612 ) ( HOLDING ?auto_16613 ) ( CLEAR ?auto_16614 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16611 ?auto_16612 ?auto_16614 ?auto_16613 )
      ( MAKE-1PILE ?auto_16611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16615 - BLOCK
    )
    :vars
    (
      ?auto_16618 - BLOCK
      ?auto_16616 - BLOCK
      ?auto_16617 - BLOCK
      ?auto_16619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16618 ?auto_16615 ) ( ON-TABLE ?auto_16615 ) ( not ( = ?auto_16615 ?auto_16618 ) ) ( not ( = ?auto_16615 ?auto_16616 ) ) ( not ( = ?auto_16615 ?auto_16617 ) ) ( not ( = ?auto_16618 ?auto_16616 ) ) ( not ( = ?auto_16618 ?auto_16617 ) ) ( not ( = ?auto_16616 ?auto_16617 ) ) ( ON ?auto_16616 ?auto_16618 ) ( CLEAR ?auto_16616 ) ( ON ?auto_16617 ?auto_16619 ) ( CLEAR ?auto_16617 ) ( HAND-EMPTY ) ( not ( = ?auto_16615 ?auto_16619 ) ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( not ( = ?auto_16616 ?auto_16619 ) ) ( not ( = ?auto_16617 ?auto_16619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16617 ?auto_16619 )
      ( MAKE-1PILE ?auto_16615 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16620 - BLOCK
    )
    :vars
    (
      ?auto_16624 - BLOCK
      ?auto_16621 - BLOCK
      ?auto_16622 - BLOCK
      ?auto_16623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16624 ?auto_16620 ) ( ON-TABLE ?auto_16620 ) ( not ( = ?auto_16620 ?auto_16624 ) ) ( not ( = ?auto_16620 ?auto_16621 ) ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( not ( = ?auto_16624 ?auto_16621 ) ) ( not ( = ?auto_16624 ?auto_16622 ) ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( ON ?auto_16622 ?auto_16623 ) ( CLEAR ?auto_16622 ) ( not ( = ?auto_16620 ?auto_16623 ) ) ( not ( = ?auto_16624 ?auto_16623 ) ) ( not ( = ?auto_16621 ?auto_16623 ) ) ( not ( = ?auto_16622 ?auto_16623 ) ) ( HOLDING ?auto_16621 ) ( CLEAR ?auto_16624 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16620 ?auto_16624 ?auto_16621 )
      ( MAKE-1PILE ?auto_16620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16625 - BLOCK
    )
    :vars
    (
      ?auto_16627 - BLOCK
      ?auto_16629 - BLOCK
      ?auto_16626 - BLOCK
      ?auto_16628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16627 ?auto_16625 ) ( ON-TABLE ?auto_16625 ) ( not ( = ?auto_16625 ?auto_16627 ) ) ( not ( = ?auto_16625 ?auto_16629 ) ) ( not ( = ?auto_16625 ?auto_16626 ) ) ( not ( = ?auto_16627 ?auto_16629 ) ) ( not ( = ?auto_16627 ?auto_16626 ) ) ( not ( = ?auto_16629 ?auto_16626 ) ) ( ON ?auto_16626 ?auto_16628 ) ( not ( = ?auto_16625 ?auto_16628 ) ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( not ( = ?auto_16629 ?auto_16628 ) ) ( not ( = ?auto_16626 ?auto_16628 ) ) ( CLEAR ?auto_16627 ) ( ON ?auto_16629 ?auto_16626 ) ( CLEAR ?auto_16629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16628 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16628 ?auto_16626 )
      ( MAKE-1PILE ?auto_16625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16640 - BLOCK
    )
    :vars
    (
      ?auto_16643 - BLOCK
      ?auto_16642 - BLOCK
      ?auto_16641 - BLOCK
      ?auto_16644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16640 ?auto_16643 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( not ( = ?auto_16643 ?auto_16642 ) ) ( not ( = ?auto_16643 ?auto_16641 ) ) ( not ( = ?auto_16642 ?auto_16641 ) ) ( ON ?auto_16641 ?auto_16644 ) ( not ( = ?auto_16640 ?auto_16644 ) ) ( not ( = ?auto_16643 ?auto_16644 ) ) ( not ( = ?auto_16642 ?auto_16644 ) ) ( not ( = ?auto_16641 ?auto_16644 ) ) ( ON ?auto_16642 ?auto_16641 ) ( ON-TABLE ?auto_16644 ) ( ON ?auto_16643 ?auto_16642 ) ( CLEAR ?auto_16643 ) ( HOLDING ?auto_16640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16640 ?auto_16643 )
      ( MAKE-1PILE ?auto_16640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16645 - BLOCK
    )
    :vars
    (
      ?auto_16649 - BLOCK
      ?auto_16646 - BLOCK
      ?auto_16648 - BLOCK
      ?auto_16647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16645 ?auto_16649 ) ) ( not ( = ?auto_16645 ?auto_16646 ) ) ( not ( = ?auto_16645 ?auto_16648 ) ) ( not ( = ?auto_16649 ?auto_16646 ) ) ( not ( = ?auto_16649 ?auto_16648 ) ) ( not ( = ?auto_16646 ?auto_16648 ) ) ( ON ?auto_16648 ?auto_16647 ) ( not ( = ?auto_16645 ?auto_16647 ) ) ( not ( = ?auto_16649 ?auto_16647 ) ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( not ( = ?auto_16648 ?auto_16647 ) ) ( ON ?auto_16646 ?auto_16648 ) ( ON-TABLE ?auto_16647 ) ( ON ?auto_16649 ?auto_16646 ) ( ON ?auto_16645 ?auto_16649 ) ( CLEAR ?auto_16645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16647 ?auto_16648 ?auto_16646 ?auto_16649 )
      ( MAKE-1PILE ?auto_16645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16653 - BLOCK
      ?auto_16654 - BLOCK
      ?auto_16655 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16655 ) ( CLEAR ?auto_16654 ) ( ON-TABLE ?auto_16653 ) ( ON ?auto_16654 ?auto_16653 ) ( not ( = ?auto_16653 ?auto_16654 ) ) ( not ( = ?auto_16653 ?auto_16655 ) ) ( not ( = ?auto_16654 ?auto_16655 ) ) )
    :subtasks
    ( ( !STACK ?auto_16655 ?auto_16654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16656 - BLOCK
      ?auto_16657 - BLOCK
      ?auto_16658 - BLOCK
    )
    :vars
    (
      ?auto_16659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16657 ) ( ON-TABLE ?auto_16656 ) ( ON ?auto_16657 ?auto_16656 ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16658 ) ) ( ON ?auto_16658 ?auto_16659 ) ( CLEAR ?auto_16658 ) ( HAND-EMPTY ) ( not ( = ?auto_16656 ?auto_16659 ) ) ( not ( = ?auto_16657 ?auto_16659 ) ) ( not ( = ?auto_16658 ?auto_16659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16658 ?auto_16659 )
      ( MAKE-3PILE ?auto_16656 ?auto_16657 ?auto_16658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16660 - BLOCK
      ?auto_16661 - BLOCK
      ?auto_16662 - BLOCK
    )
    :vars
    (
      ?auto_16663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16660 ) ( not ( = ?auto_16660 ?auto_16661 ) ) ( not ( = ?auto_16660 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( ON ?auto_16662 ?auto_16663 ) ( CLEAR ?auto_16662 ) ( not ( = ?auto_16660 ?auto_16663 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( HOLDING ?auto_16661 ) ( CLEAR ?auto_16660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16660 ?auto_16661 )
      ( MAKE-3PILE ?auto_16660 ?auto_16661 ?auto_16662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16664 - BLOCK
      ?auto_16665 - BLOCK
      ?auto_16666 - BLOCK
    )
    :vars
    (
      ?auto_16667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16664 ) ( not ( = ?auto_16664 ?auto_16665 ) ) ( not ( = ?auto_16664 ?auto_16666 ) ) ( not ( = ?auto_16665 ?auto_16666 ) ) ( ON ?auto_16666 ?auto_16667 ) ( not ( = ?auto_16664 ?auto_16667 ) ) ( not ( = ?auto_16665 ?auto_16667 ) ) ( not ( = ?auto_16666 ?auto_16667 ) ) ( CLEAR ?auto_16664 ) ( ON ?auto_16665 ?auto_16666 ) ( CLEAR ?auto_16665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16667 ?auto_16666 )
      ( MAKE-3PILE ?auto_16664 ?auto_16665 ?auto_16666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16668 - BLOCK
      ?auto_16669 - BLOCK
      ?auto_16670 - BLOCK
    )
    :vars
    (
      ?auto_16671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16668 ?auto_16669 ) ) ( not ( = ?auto_16668 ?auto_16670 ) ) ( not ( = ?auto_16669 ?auto_16670 ) ) ( ON ?auto_16670 ?auto_16671 ) ( not ( = ?auto_16668 ?auto_16671 ) ) ( not ( = ?auto_16669 ?auto_16671 ) ) ( not ( = ?auto_16670 ?auto_16671 ) ) ( ON ?auto_16669 ?auto_16670 ) ( CLEAR ?auto_16669 ) ( ON-TABLE ?auto_16671 ) ( HOLDING ?auto_16668 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16668 )
      ( MAKE-3PILE ?auto_16668 ?auto_16669 ?auto_16670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16672 - BLOCK
      ?auto_16673 - BLOCK
      ?auto_16674 - BLOCK
    )
    :vars
    (
      ?auto_16675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16672 ?auto_16673 ) ) ( not ( = ?auto_16672 ?auto_16674 ) ) ( not ( = ?auto_16673 ?auto_16674 ) ) ( ON ?auto_16674 ?auto_16675 ) ( not ( = ?auto_16672 ?auto_16675 ) ) ( not ( = ?auto_16673 ?auto_16675 ) ) ( not ( = ?auto_16674 ?auto_16675 ) ) ( ON ?auto_16673 ?auto_16674 ) ( ON-TABLE ?auto_16675 ) ( ON ?auto_16672 ?auto_16673 ) ( CLEAR ?auto_16672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16675 ?auto_16674 ?auto_16673 )
      ( MAKE-3PILE ?auto_16672 ?auto_16673 ?auto_16674 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16676 - BLOCK
      ?auto_16677 - BLOCK
      ?auto_16678 - BLOCK
    )
    :vars
    (
      ?auto_16679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16676 ?auto_16677 ) ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( ON ?auto_16678 ?auto_16679 ) ( not ( = ?auto_16676 ?auto_16679 ) ) ( not ( = ?auto_16677 ?auto_16679 ) ) ( not ( = ?auto_16678 ?auto_16679 ) ) ( ON ?auto_16677 ?auto_16678 ) ( ON-TABLE ?auto_16679 ) ( HOLDING ?auto_16676 ) ( CLEAR ?auto_16677 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16679 ?auto_16678 ?auto_16677 ?auto_16676 )
      ( MAKE-3PILE ?auto_16676 ?auto_16677 ?auto_16678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16680 - BLOCK
      ?auto_16681 - BLOCK
      ?auto_16682 - BLOCK
    )
    :vars
    (
      ?auto_16683 - BLOCK
      ?auto_16684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16680 ?auto_16681 ) ) ( not ( = ?auto_16680 ?auto_16682 ) ) ( not ( = ?auto_16681 ?auto_16682 ) ) ( ON ?auto_16682 ?auto_16683 ) ( not ( = ?auto_16680 ?auto_16683 ) ) ( not ( = ?auto_16681 ?auto_16683 ) ) ( not ( = ?auto_16682 ?auto_16683 ) ) ( ON ?auto_16681 ?auto_16682 ) ( ON-TABLE ?auto_16683 ) ( CLEAR ?auto_16681 ) ( ON ?auto_16680 ?auto_16684 ) ( CLEAR ?auto_16680 ) ( HAND-EMPTY ) ( not ( = ?auto_16680 ?auto_16684 ) ) ( not ( = ?auto_16681 ?auto_16684 ) ) ( not ( = ?auto_16682 ?auto_16684 ) ) ( not ( = ?auto_16683 ?auto_16684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16680 ?auto_16684 )
      ( MAKE-3PILE ?auto_16680 ?auto_16681 ?auto_16682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16685 - BLOCK
      ?auto_16686 - BLOCK
      ?auto_16687 - BLOCK
    )
    :vars
    (
      ?auto_16689 - BLOCK
      ?auto_16688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16685 ?auto_16686 ) ) ( not ( = ?auto_16685 ?auto_16687 ) ) ( not ( = ?auto_16686 ?auto_16687 ) ) ( ON ?auto_16687 ?auto_16689 ) ( not ( = ?auto_16685 ?auto_16689 ) ) ( not ( = ?auto_16686 ?auto_16689 ) ) ( not ( = ?auto_16687 ?auto_16689 ) ) ( ON-TABLE ?auto_16689 ) ( ON ?auto_16685 ?auto_16688 ) ( CLEAR ?auto_16685 ) ( not ( = ?auto_16685 ?auto_16688 ) ) ( not ( = ?auto_16686 ?auto_16688 ) ) ( not ( = ?auto_16687 ?auto_16688 ) ) ( not ( = ?auto_16689 ?auto_16688 ) ) ( HOLDING ?auto_16686 ) ( CLEAR ?auto_16687 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16689 ?auto_16687 ?auto_16686 )
      ( MAKE-3PILE ?auto_16685 ?auto_16686 ?auto_16687 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16690 - BLOCK
      ?auto_16691 - BLOCK
      ?auto_16692 - BLOCK
    )
    :vars
    (
      ?auto_16693 - BLOCK
      ?auto_16694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( ON ?auto_16692 ?auto_16693 ) ( not ( = ?auto_16690 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( ON-TABLE ?auto_16693 ) ( ON ?auto_16690 ?auto_16694 ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( CLEAR ?auto_16692 ) ( ON ?auto_16691 ?auto_16690 ) ( CLEAR ?auto_16691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16694 ?auto_16690 )
      ( MAKE-3PILE ?auto_16690 ?auto_16691 ?auto_16692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16695 - BLOCK
      ?auto_16696 - BLOCK
      ?auto_16697 - BLOCK
    )
    :vars
    (
      ?auto_16698 - BLOCK
      ?auto_16699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16695 ?auto_16696 ) ) ( not ( = ?auto_16695 ?auto_16697 ) ) ( not ( = ?auto_16696 ?auto_16697 ) ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16696 ?auto_16698 ) ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( ON-TABLE ?auto_16698 ) ( ON ?auto_16695 ?auto_16699 ) ( not ( = ?auto_16695 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( ON ?auto_16696 ?auto_16695 ) ( CLEAR ?auto_16696 ) ( ON-TABLE ?auto_16699 ) ( HOLDING ?auto_16697 ) ( CLEAR ?auto_16698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16698 ?auto_16697 )
      ( MAKE-3PILE ?auto_16695 ?auto_16696 ?auto_16697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16700 - BLOCK
      ?auto_16701 - BLOCK
      ?auto_16702 - BLOCK
    )
    :vars
    (
      ?auto_16704 - BLOCK
      ?auto_16703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16700 ?auto_16701 ) ) ( not ( = ?auto_16700 ?auto_16702 ) ) ( not ( = ?auto_16701 ?auto_16702 ) ) ( not ( = ?auto_16700 ?auto_16704 ) ) ( not ( = ?auto_16701 ?auto_16704 ) ) ( not ( = ?auto_16702 ?auto_16704 ) ) ( ON-TABLE ?auto_16704 ) ( ON ?auto_16700 ?auto_16703 ) ( not ( = ?auto_16700 ?auto_16703 ) ) ( not ( = ?auto_16701 ?auto_16703 ) ) ( not ( = ?auto_16702 ?auto_16703 ) ) ( not ( = ?auto_16704 ?auto_16703 ) ) ( ON ?auto_16701 ?auto_16700 ) ( ON-TABLE ?auto_16703 ) ( CLEAR ?auto_16704 ) ( ON ?auto_16702 ?auto_16701 ) ( CLEAR ?auto_16702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16703 ?auto_16700 ?auto_16701 )
      ( MAKE-3PILE ?auto_16700 ?auto_16701 ?auto_16702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16705 - BLOCK
      ?auto_16706 - BLOCK
      ?auto_16707 - BLOCK
    )
    :vars
    (
      ?auto_16708 - BLOCK
      ?auto_16709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16705 ?auto_16706 ) ) ( not ( = ?auto_16705 ?auto_16707 ) ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( not ( = ?auto_16705 ?auto_16708 ) ) ( not ( = ?auto_16706 ?auto_16708 ) ) ( not ( = ?auto_16707 ?auto_16708 ) ) ( ON ?auto_16705 ?auto_16709 ) ( not ( = ?auto_16705 ?auto_16709 ) ) ( not ( = ?auto_16706 ?auto_16709 ) ) ( not ( = ?auto_16707 ?auto_16709 ) ) ( not ( = ?auto_16708 ?auto_16709 ) ) ( ON ?auto_16706 ?auto_16705 ) ( ON-TABLE ?auto_16709 ) ( ON ?auto_16707 ?auto_16706 ) ( CLEAR ?auto_16707 ) ( HOLDING ?auto_16708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16708 )
      ( MAKE-3PILE ?auto_16705 ?auto_16706 ?auto_16707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16710 - BLOCK
      ?auto_16711 - BLOCK
      ?auto_16712 - BLOCK
    )
    :vars
    (
      ?auto_16713 - BLOCK
      ?auto_16714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16713 ) ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16713 ) ) ( ON ?auto_16710 ?auto_16714 ) ( not ( = ?auto_16710 ?auto_16714 ) ) ( not ( = ?auto_16711 ?auto_16714 ) ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( ON ?auto_16711 ?auto_16710 ) ( ON-TABLE ?auto_16714 ) ( ON ?auto_16712 ?auto_16711 ) ( ON ?auto_16713 ?auto_16712 ) ( CLEAR ?auto_16713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16714 ?auto_16710 ?auto_16711 ?auto_16712 )
      ( MAKE-3PILE ?auto_16710 ?auto_16711 ?auto_16712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16719 - BLOCK
      ?auto_16720 - BLOCK
      ?auto_16721 - BLOCK
      ?auto_16722 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16722 ) ( CLEAR ?auto_16721 ) ( ON-TABLE ?auto_16719 ) ( ON ?auto_16720 ?auto_16719 ) ( ON ?auto_16721 ?auto_16720 ) ( not ( = ?auto_16719 ?auto_16720 ) ) ( not ( = ?auto_16719 ?auto_16721 ) ) ( not ( = ?auto_16719 ?auto_16722 ) ) ( not ( = ?auto_16720 ?auto_16721 ) ) ( not ( = ?auto_16720 ?auto_16722 ) ) ( not ( = ?auto_16721 ?auto_16722 ) ) )
    :subtasks
    ( ( !STACK ?auto_16722 ?auto_16721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16723 - BLOCK
      ?auto_16724 - BLOCK
      ?auto_16725 - BLOCK
      ?auto_16726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16725 ) ( ON-TABLE ?auto_16723 ) ( ON ?auto_16724 ?auto_16723 ) ( ON ?auto_16725 ?auto_16724 ) ( not ( = ?auto_16723 ?auto_16724 ) ) ( not ( = ?auto_16723 ?auto_16725 ) ) ( not ( = ?auto_16723 ?auto_16726 ) ) ( not ( = ?auto_16724 ?auto_16725 ) ) ( not ( = ?auto_16724 ?auto_16726 ) ) ( not ( = ?auto_16725 ?auto_16726 ) ) ( ON-TABLE ?auto_16726 ) ( CLEAR ?auto_16726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_16726 )
      ( MAKE-4PILE ?auto_16723 ?auto_16724 ?auto_16725 ?auto_16726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16727 - BLOCK
      ?auto_16728 - BLOCK
      ?auto_16729 - BLOCK
      ?auto_16730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16727 ) ( ON ?auto_16728 ?auto_16727 ) ( not ( = ?auto_16727 ?auto_16728 ) ) ( not ( = ?auto_16727 ?auto_16729 ) ) ( not ( = ?auto_16727 ?auto_16730 ) ) ( not ( = ?auto_16728 ?auto_16729 ) ) ( not ( = ?auto_16728 ?auto_16730 ) ) ( not ( = ?auto_16729 ?auto_16730 ) ) ( ON-TABLE ?auto_16730 ) ( CLEAR ?auto_16730 ) ( HOLDING ?auto_16729 ) ( CLEAR ?auto_16728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16727 ?auto_16728 ?auto_16729 )
      ( MAKE-4PILE ?auto_16727 ?auto_16728 ?auto_16729 ?auto_16730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16731 - BLOCK
      ?auto_16732 - BLOCK
      ?auto_16733 - BLOCK
      ?auto_16734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16731 ) ( ON ?auto_16732 ?auto_16731 ) ( not ( = ?auto_16731 ?auto_16732 ) ) ( not ( = ?auto_16731 ?auto_16733 ) ) ( not ( = ?auto_16731 ?auto_16734 ) ) ( not ( = ?auto_16732 ?auto_16733 ) ) ( not ( = ?auto_16732 ?auto_16734 ) ) ( not ( = ?auto_16733 ?auto_16734 ) ) ( ON-TABLE ?auto_16734 ) ( CLEAR ?auto_16732 ) ( ON ?auto_16733 ?auto_16734 ) ( CLEAR ?auto_16733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16734 )
      ( MAKE-4PILE ?auto_16731 ?auto_16732 ?auto_16733 ?auto_16734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16735 - BLOCK
      ?auto_16736 - BLOCK
      ?auto_16737 - BLOCK
      ?auto_16738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16735 ) ( not ( = ?auto_16735 ?auto_16736 ) ) ( not ( = ?auto_16735 ?auto_16737 ) ) ( not ( = ?auto_16735 ?auto_16738 ) ) ( not ( = ?auto_16736 ?auto_16737 ) ) ( not ( = ?auto_16736 ?auto_16738 ) ) ( not ( = ?auto_16737 ?auto_16738 ) ) ( ON-TABLE ?auto_16738 ) ( ON ?auto_16737 ?auto_16738 ) ( CLEAR ?auto_16737 ) ( HOLDING ?auto_16736 ) ( CLEAR ?auto_16735 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16735 ?auto_16736 )
      ( MAKE-4PILE ?auto_16735 ?auto_16736 ?auto_16737 ?auto_16738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16739 - BLOCK
      ?auto_16740 - BLOCK
      ?auto_16741 - BLOCK
      ?auto_16742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16739 ) ( not ( = ?auto_16739 ?auto_16740 ) ) ( not ( = ?auto_16739 ?auto_16741 ) ) ( not ( = ?auto_16739 ?auto_16742 ) ) ( not ( = ?auto_16740 ?auto_16741 ) ) ( not ( = ?auto_16740 ?auto_16742 ) ) ( not ( = ?auto_16741 ?auto_16742 ) ) ( ON-TABLE ?auto_16742 ) ( ON ?auto_16741 ?auto_16742 ) ( CLEAR ?auto_16739 ) ( ON ?auto_16740 ?auto_16741 ) ( CLEAR ?auto_16740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16742 ?auto_16741 )
      ( MAKE-4PILE ?auto_16739 ?auto_16740 ?auto_16741 ?auto_16742 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16743 - BLOCK
      ?auto_16744 - BLOCK
      ?auto_16745 - BLOCK
      ?auto_16746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16743 ?auto_16744 ) ) ( not ( = ?auto_16743 ?auto_16745 ) ) ( not ( = ?auto_16743 ?auto_16746 ) ) ( not ( = ?auto_16744 ?auto_16745 ) ) ( not ( = ?auto_16744 ?auto_16746 ) ) ( not ( = ?auto_16745 ?auto_16746 ) ) ( ON-TABLE ?auto_16746 ) ( ON ?auto_16745 ?auto_16746 ) ( ON ?auto_16744 ?auto_16745 ) ( CLEAR ?auto_16744 ) ( HOLDING ?auto_16743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16743 )
      ( MAKE-4PILE ?auto_16743 ?auto_16744 ?auto_16745 ?auto_16746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16747 - BLOCK
      ?auto_16748 - BLOCK
      ?auto_16749 - BLOCK
      ?auto_16750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16747 ?auto_16748 ) ) ( not ( = ?auto_16747 ?auto_16749 ) ) ( not ( = ?auto_16747 ?auto_16750 ) ) ( not ( = ?auto_16748 ?auto_16749 ) ) ( not ( = ?auto_16748 ?auto_16750 ) ) ( not ( = ?auto_16749 ?auto_16750 ) ) ( ON-TABLE ?auto_16750 ) ( ON ?auto_16749 ?auto_16750 ) ( ON ?auto_16748 ?auto_16749 ) ( ON ?auto_16747 ?auto_16748 ) ( CLEAR ?auto_16747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16750 ?auto_16749 ?auto_16748 )
      ( MAKE-4PILE ?auto_16747 ?auto_16748 ?auto_16749 ?auto_16750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16751 - BLOCK
      ?auto_16752 - BLOCK
      ?auto_16753 - BLOCK
      ?auto_16754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16751 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( ON-TABLE ?auto_16754 ) ( ON ?auto_16753 ?auto_16754 ) ( ON ?auto_16752 ?auto_16753 ) ( HOLDING ?auto_16751 ) ( CLEAR ?auto_16752 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16754 ?auto_16753 ?auto_16752 ?auto_16751 )
      ( MAKE-4PILE ?auto_16751 ?auto_16752 ?auto_16753 ?auto_16754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16755 - BLOCK
      ?auto_16756 - BLOCK
      ?auto_16757 - BLOCK
      ?auto_16758 - BLOCK
    )
    :vars
    (
      ?auto_16759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16755 ?auto_16756 ) ) ( not ( = ?auto_16755 ?auto_16757 ) ) ( not ( = ?auto_16755 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( ON-TABLE ?auto_16758 ) ( ON ?auto_16757 ?auto_16758 ) ( ON ?auto_16756 ?auto_16757 ) ( CLEAR ?auto_16756 ) ( ON ?auto_16755 ?auto_16759 ) ( CLEAR ?auto_16755 ) ( HAND-EMPTY ) ( not ( = ?auto_16755 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16755 ?auto_16759 )
      ( MAKE-4PILE ?auto_16755 ?auto_16756 ?auto_16757 ?auto_16758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16760 - BLOCK
      ?auto_16761 - BLOCK
      ?auto_16762 - BLOCK
      ?auto_16763 - BLOCK
    )
    :vars
    (
      ?auto_16764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16760 ?auto_16761 ) ) ( not ( = ?auto_16760 ?auto_16762 ) ) ( not ( = ?auto_16760 ?auto_16763 ) ) ( not ( = ?auto_16761 ?auto_16762 ) ) ( not ( = ?auto_16761 ?auto_16763 ) ) ( not ( = ?auto_16762 ?auto_16763 ) ) ( ON-TABLE ?auto_16763 ) ( ON ?auto_16762 ?auto_16763 ) ( ON ?auto_16760 ?auto_16764 ) ( CLEAR ?auto_16760 ) ( not ( = ?auto_16760 ?auto_16764 ) ) ( not ( = ?auto_16761 ?auto_16764 ) ) ( not ( = ?auto_16762 ?auto_16764 ) ) ( not ( = ?auto_16763 ?auto_16764 ) ) ( HOLDING ?auto_16761 ) ( CLEAR ?auto_16762 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16763 ?auto_16762 ?auto_16761 )
      ( MAKE-4PILE ?auto_16760 ?auto_16761 ?auto_16762 ?auto_16763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16765 - BLOCK
      ?auto_16766 - BLOCK
      ?auto_16767 - BLOCK
      ?auto_16768 - BLOCK
    )
    :vars
    (
      ?auto_16769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16765 ?auto_16766 ) ) ( not ( = ?auto_16765 ?auto_16767 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16767 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( ON-TABLE ?auto_16768 ) ( ON ?auto_16767 ?auto_16768 ) ( ON ?auto_16765 ?auto_16769 ) ( not ( = ?auto_16765 ?auto_16769 ) ) ( not ( = ?auto_16766 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( CLEAR ?auto_16767 ) ( ON ?auto_16766 ?auto_16765 ) ( CLEAR ?auto_16766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16769 ?auto_16765 )
      ( MAKE-4PILE ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16770 - BLOCK
      ?auto_16771 - BLOCK
      ?auto_16772 - BLOCK
      ?auto_16773 - BLOCK
    )
    :vars
    (
      ?auto_16774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16771 ?auto_16772 ) ) ( not ( = ?auto_16771 ?auto_16773 ) ) ( not ( = ?auto_16772 ?auto_16773 ) ) ( ON-TABLE ?auto_16773 ) ( ON ?auto_16770 ?auto_16774 ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( not ( = ?auto_16772 ?auto_16774 ) ) ( not ( = ?auto_16773 ?auto_16774 ) ) ( ON ?auto_16771 ?auto_16770 ) ( CLEAR ?auto_16771 ) ( ON-TABLE ?auto_16774 ) ( HOLDING ?auto_16772 ) ( CLEAR ?auto_16773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16773 ?auto_16772 )
      ( MAKE-4PILE ?auto_16770 ?auto_16771 ?auto_16772 ?auto_16773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16775 - BLOCK
      ?auto_16776 - BLOCK
      ?auto_16777 - BLOCK
      ?auto_16778 - BLOCK
    )
    :vars
    (
      ?auto_16779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16775 ?auto_16778 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( ON-TABLE ?auto_16778 ) ( ON ?auto_16775 ?auto_16779 ) ( not ( = ?auto_16775 ?auto_16779 ) ) ( not ( = ?auto_16776 ?auto_16779 ) ) ( not ( = ?auto_16777 ?auto_16779 ) ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( ON ?auto_16776 ?auto_16775 ) ( ON-TABLE ?auto_16779 ) ( CLEAR ?auto_16778 ) ( ON ?auto_16777 ?auto_16776 ) ( CLEAR ?auto_16777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16779 ?auto_16775 ?auto_16776 )
      ( MAKE-4PILE ?auto_16775 ?auto_16776 ?auto_16777 ?auto_16778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16780 - BLOCK
      ?auto_16781 - BLOCK
      ?auto_16782 - BLOCK
      ?auto_16783 - BLOCK
    )
    :vars
    (
      ?auto_16784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16780 ?auto_16781 ) ) ( not ( = ?auto_16780 ?auto_16782 ) ) ( not ( = ?auto_16780 ?auto_16783 ) ) ( not ( = ?auto_16781 ?auto_16782 ) ) ( not ( = ?auto_16781 ?auto_16783 ) ) ( not ( = ?auto_16782 ?auto_16783 ) ) ( ON ?auto_16780 ?auto_16784 ) ( not ( = ?auto_16780 ?auto_16784 ) ) ( not ( = ?auto_16781 ?auto_16784 ) ) ( not ( = ?auto_16782 ?auto_16784 ) ) ( not ( = ?auto_16783 ?auto_16784 ) ) ( ON ?auto_16781 ?auto_16780 ) ( ON-TABLE ?auto_16784 ) ( ON ?auto_16782 ?auto_16781 ) ( CLEAR ?auto_16782 ) ( HOLDING ?auto_16783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16783 )
      ( MAKE-4PILE ?auto_16780 ?auto_16781 ?auto_16782 ?auto_16783 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16785 - BLOCK
      ?auto_16786 - BLOCK
      ?auto_16787 - BLOCK
      ?auto_16788 - BLOCK
    )
    :vars
    (
      ?auto_16789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16785 ?auto_16786 ) ) ( not ( = ?auto_16785 ?auto_16787 ) ) ( not ( = ?auto_16785 ?auto_16788 ) ) ( not ( = ?auto_16786 ?auto_16787 ) ) ( not ( = ?auto_16786 ?auto_16788 ) ) ( not ( = ?auto_16787 ?auto_16788 ) ) ( ON ?auto_16785 ?auto_16789 ) ( not ( = ?auto_16785 ?auto_16789 ) ) ( not ( = ?auto_16786 ?auto_16789 ) ) ( not ( = ?auto_16787 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( ON ?auto_16786 ?auto_16785 ) ( ON-TABLE ?auto_16789 ) ( ON ?auto_16787 ?auto_16786 ) ( ON ?auto_16788 ?auto_16787 ) ( CLEAR ?auto_16788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16789 ?auto_16785 ?auto_16786 ?auto_16787 )
      ( MAKE-4PILE ?auto_16785 ?auto_16786 ?auto_16787 ?auto_16788 ) )
  )

)

