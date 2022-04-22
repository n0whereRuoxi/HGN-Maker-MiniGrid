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
      ?auto_4196 - BLOCK
    )
    :vars
    (
      ?auto_4197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4196 ?auto_4197 ) ( CLEAR ?auto_4196 ) ( HAND-EMPTY ) ( not ( = ?auto_4196 ?auto_4197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4196 ?auto_4197 )
      ( !PUTDOWN ?auto_4196 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4203 - BLOCK
      ?auto_4204 - BLOCK
    )
    :vars
    (
      ?auto_4205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4203 ) ( ON ?auto_4204 ?auto_4205 ) ( CLEAR ?auto_4204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4203 ) ( not ( = ?auto_4203 ?auto_4204 ) ) ( not ( = ?auto_4203 ?auto_4205 ) ) ( not ( = ?auto_4204 ?auto_4205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4204 ?auto_4205 )
      ( !STACK ?auto_4204 ?auto_4203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4213 - BLOCK
      ?auto_4214 - BLOCK
    )
    :vars
    (
      ?auto_4215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4214 ?auto_4215 ) ( not ( = ?auto_4213 ?auto_4214 ) ) ( not ( = ?auto_4213 ?auto_4215 ) ) ( not ( = ?auto_4214 ?auto_4215 ) ) ( ON ?auto_4213 ?auto_4214 ) ( CLEAR ?auto_4213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4213 )
      ( MAKE-2PILE ?auto_4213 ?auto_4214 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4224 - BLOCK
      ?auto_4225 - BLOCK
      ?auto_4226 - BLOCK
    )
    :vars
    (
      ?auto_4227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4225 ) ( ON ?auto_4226 ?auto_4227 ) ( CLEAR ?auto_4226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4224 ) ( ON ?auto_4225 ?auto_4224 ) ( not ( = ?auto_4224 ?auto_4225 ) ) ( not ( = ?auto_4224 ?auto_4226 ) ) ( not ( = ?auto_4224 ?auto_4227 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( not ( = ?auto_4225 ?auto_4227 ) ) ( not ( = ?auto_4226 ?auto_4227 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4226 ?auto_4227 )
      ( !STACK ?auto_4226 ?auto_4225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4238 - BLOCK
      ?auto_4239 - BLOCK
      ?auto_4240 - BLOCK
    )
    :vars
    (
      ?auto_4241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4240 ?auto_4241 ) ( ON-TABLE ?auto_4238 ) ( not ( = ?auto_4238 ?auto_4239 ) ) ( not ( = ?auto_4238 ?auto_4240 ) ) ( not ( = ?auto_4238 ?auto_4241 ) ) ( not ( = ?auto_4239 ?auto_4240 ) ) ( not ( = ?auto_4239 ?auto_4241 ) ) ( not ( = ?auto_4240 ?auto_4241 ) ) ( CLEAR ?auto_4238 ) ( ON ?auto_4239 ?auto_4240 ) ( CLEAR ?auto_4239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4238 ?auto_4239 )
      ( MAKE-3PILE ?auto_4238 ?auto_4239 ?auto_4240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4252 - BLOCK
      ?auto_4253 - BLOCK
      ?auto_4254 - BLOCK
    )
    :vars
    (
      ?auto_4255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4254 ?auto_4255 ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4254 ) ) ( not ( = ?auto_4252 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( ON ?auto_4253 ?auto_4254 ) ( ON ?auto_4252 ?auto_4253 ) ( CLEAR ?auto_4252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4252 )
      ( MAKE-3PILE ?auto_4252 ?auto_4253 ?auto_4254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4267 - BLOCK
      ?auto_4268 - BLOCK
      ?auto_4269 - BLOCK
      ?auto_4270 - BLOCK
    )
    :vars
    (
      ?auto_4271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4269 ) ( ON ?auto_4270 ?auto_4271 ) ( CLEAR ?auto_4270 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4267 ) ( ON ?auto_4268 ?auto_4267 ) ( ON ?auto_4269 ?auto_4268 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( not ( = ?auto_4267 ?auto_4269 ) ) ( not ( = ?auto_4267 ?auto_4270 ) ) ( not ( = ?auto_4267 ?auto_4271 ) ) ( not ( = ?auto_4268 ?auto_4269 ) ) ( not ( = ?auto_4268 ?auto_4270 ) ) ( not ( = ?auto_4268 ?auto_4271 ) ) ( not ( = ?auto_4269 ?auto_4270 ) ) ( not ( = ?auto_4269 ?auto_4271 ) ) ( not ( = ?auto_4270 ?auto_4271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4270 ?auto_4271 )
      ( !STACK ?auto_4270 ?auto_4269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4276 - BLOCK
      ?auto_4277 - BLOCK
      ?auto_4278 - BLOCK
      ?auto_4279 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4278 ) ( ON-TABLE ?auto_4279 ) ( CLEAR ?auto_4279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4276 ) ( ON ?auto_4277 ?auto_4276 ) ( ON ?auto_4278 ?auto_4277 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4279 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4279 )
      ( !STACK ?auto_4279 ?auto_4278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4284 - BLOCK
      ?auto_4285 - BLOCK
      ?auto_4286 - BLOCK
      ?auto_4287 - BLOCK
    )
    :vars
    (
      ?auto_4288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4287 ?auto_4288 ) ( ON-TABLE ?auto_4284 ) ( ON ?auto_4285 ?auto_4284 ) ( not ( = ?auto_4284 ?auto_4285 ) ) ( not ( = ?auto_4284 ?auto_4286 ) ) ( not ( = ?auto_4284 ?auto_4287 ) ) ( not ( = ?auto_4284 ?auto_4288 ) ) ( not ( = ?auto_4285 ?auto_4286 ) ) ( not ( = ?auto_4285 ?auto_4287 ) ) ( not ( = ?auto_4285 ?auto_4288 ) ) ( not ( = ?auto_4286 ?auto_4287 ) ) ( not ( = ?auto_4286 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( CLEAR ?auto_4285 ) ( ON ?auto_4286 ?auto_4287 ) ( CLEAR ?auto_4286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4284 ?auto_4285 ?auto_4286 )
      ( MAKE-4PILE ?auto_4284 ?auto_4285 ?auto_4286 ?auto_4287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4293 - BLOCK
      ?auto_4294 - BLOCK
      ?auto_4295 - BLOCK
      ?auto_4296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4296 ) ( ON-TABLE ?auto_4293 ) ( ON ?auto_4294 ?auto_4293 ) ( not ( = ?auto_4293 ?auto_4294 ) ) ( not ( = ?auto_4293 ?auto_4295 ) ) ( not ( = ?auto_4293 ?auto_4296 ) ) ( not ( = ?auto_4294 ?auto_4295 ) ) ( not ( = ?auto_4294 ?auto_4296 ) ) ( not ( = ?auto_4295 ?auto_4296 ) ) ( CLEAR ?auto_4294 ) ( ON ?auto_4295 ?auto_4296 ) ( CLEAR ?auto_4295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4293 ?auto_4294 ?auto_4295 )
      ( MAKE-4PILE ?auto_4293 ?auto_4294 ?auto_4295 ?auto_4296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4301 - BLOCK
      ?auto_4302 - BLOCK
      ?auto_4303 - BLOCK
      ?auto_4304 - BLOCK
    )
    :vars
    (
      ?auto_4305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4304 ?auto_4305 ) ( ON-TABLE ?auto_4301 ) ( not ( = ?auto_4301 ?auto_4302 ) ) ( not ( = ?auto_4301 ?auto_4303 ) ) ( not ( = ?auto_4301 ?auto_4304 ) ) ( not ( = ?auto_4301 ?auto_4305 ) ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4302 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( ON ?auto_4303 ?auto_4304 ) ( CLEAR ?auto_4301 ) ( ON ?auto_4302 ?auto_4303 ) ( CLEAR ?auto_4302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4301 ?auto_4302 )
      ( MAKE-4PILE ?auto_4301 ?auto_4302 ?auto_4303 ?auto_4304 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4310 - BLOCK
      ?auto_4311 - BLOCK
      ?auto_4312 - BLOCK
      ?auto_4313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4313 ) ( ON-TABLE ?auto_4310 ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( ON ?auto_4312 ?auto_4313 ) ( CLEAR ?auto_4310 ) ( ON ?auto_4311 ?auto_4312 ) ( CLEAR ?auto_4311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4310 ?auto_4311 )
      ( MAKE-4PILE ?auto_4310 ?auto_4311 ?auto_4312 ?auto_4313 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4318 - BLOCK
      ?auto_4319 - BLOCK
      ?auto_4320 - BLOCK
      ?auto_4321 - BLOCK
    )
    :vars
    (
      ?auto_4322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4321 ?auto_4322 ) ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4318 ?auto_4322 ) ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4319 ?auto_4322 ) ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( not ( = ?auto_4320 ?auto_4322 ) ) ( not ( = ?auto_4321 ?auto_4322 ) ) ( ON ?auto_4320 ?auto_4321 ) ( ON ?auto_4319 ?auto_4320 ) ( ON ?auto_4318 ?auto_4319 ) ( CLEAR ?auto_4318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4318 )
      ( MAKE-4PILE ?auto_4318 ?auto_4319 ?auto_4320 ?auto_4321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4327 - BLOCK
      ?auto_4328 - BLOCK
      ?auto_4329 - BLOCK
      ?auto_4330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4330 ) ( not ( = ?auto_4327 ?auto_4328 ) ) ( not ( = ?auto_4327 ?auto_4329 ) ) ( not ( = ?auto_4327 ?auto_4330 ) ) ( not ( = ?auto_4328 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( ON ?auto_4329 ?auto_4330 ) ( ON ?auto_4328 ?auto_4329 ) ( ON ?auto_4327 ?auto_4328 ) ( CLEAR ?auto_4327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4327 )
      ( MAKE-4PILE ?auto_4327 ?auto_4328 ?auto_4329 ?auto_4330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4335 - BLOCK
      ?auto_4336 - BLOCK
      ?auto_4337 - BLOCK
      ?auto_4338 - BLOCK
    )
    :vars
    (
      ?auto_4339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4335 ?auto_4336 ) ) ( not ( = ?auto_4335 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4338 ) ) ( not ( = ?auto_4336 ?auto_4337 ) ) ( not ( = ?auto_4336 ?auto_4338 ) ) ( not ( = ?auto_4337 ?auto_4338 ) ) ( ON ?auto_4335 ?auto_4339 ) ( not ( = ?auto_4338 ?auto_4339 ) ) ( not ( = ?auto_4337 ?auto_4339 ) ) ( not ( = ?auto_4336 ?auto_4339 ) ) ( not ( = ?auto_4335 ?auto_4339 ) ) ( ON ?auto_4336 ?auto_4335 ) ( ON ?auto_4337 ?auto_4336 ) ( ON ?auto_4338 ?auto_4337 ) ( CLEAR ?auto_4338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4338 ?auto_4337 ?auto_4336 ?auto_4335 )
      ( MAKE-4PILE ?auto_4335 ?auto_4336 ?auto_4337 ?auto_4338 ) )
  )

)

