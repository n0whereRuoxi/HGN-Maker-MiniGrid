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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5257 - BLOCK
      ?auto_5258 - BLOCK
      ?auto_5259 - BLOCK
    )
    :vars
    (
      ?auto_5260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5260 ?auto_5259 ) ( CLEAR ?auto_5260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5257 ) ( ON ?auto_5258 ?auto_5257 ) ( ON ?auto_5259 ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5258 ) ) ( not ( = ?auto_5257 ?auto_5259 ) ) ( not ( = ?auto_5257 ?auto_5260 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5260 ) ) ( not ( = ?auto_5259 ?auto_5260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5260 ?auto_5259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5262 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5262 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5263 - BLOCK
    )
    :vars
    (
      ?auto_5264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5263 ?auto_5264 ) ( CLEAR ?auto_5263 ) ( HAND-EMPTY ) ( not ( = ?auto_5263 ?auto_5264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5263 ?auto_5264 )
      ( MAKE-1PILE ?auto_5263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5267 - BLOCK
      ?auto_5268 - BLOCK
    )
    :vars
    (
      ?auto_5269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5269 ?auto_5268 ) ( CLEAR ?auto_5269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5267 ) ( ON ?auto_5268 ?auto_5267 ) ( not ( = ?auto_5267 ?auto_5268 ) ) ( not ( = ?auto_5267 ?auto_5269 ) ) ( not ( = ?auto_5268 ?auto_5269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5269 ?auto_5268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5270 - BLOCK
      ?auto_5271 - BLOCK
    )
    :vars
    (
      ?auto_5272 - BLOCK
      ?auto_5273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5272 ?auto_5271 ) ( CLEAR ?auto_5272 ) ( ON-TABLE ?auto_5270 ) ( ON ?auto_5271 ?auto_5270 ) ( not ( = ?auto_5270 ?auto_5271 ) ) ( not ( = ?auto_5270 ?auto_5272 ) ) ( not ( = ?auto_5271 ?auto_5272 ) ) ( HOLDING ?auto_5273 ) ( not ( = ?auto_5270 ?auto_5273 ) ) ( not ( = ?auto_5271 ?auto_5273 ) ) ( not ( = ?auto_5272 ?auto_5273 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5273 )
      ( MAKE-2PILE ?auto_5270 ?auto_5271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5274 - BLOCK
      ?auto_5275 - BLOCK
    )
    :vars
    (
      ?auto_5276 - BLOCK
      ?auto_5277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5276 ?auto_5275 ) ( ON-TABLE ?auto_5274 ) ( ON ?auto_5275 ?auto_5274 ) ( not ( = ?auto_5274 ?auto_5275 ) ) ( not ( = ?auto_5274 ?auto_5276 ) ) ( not ( = ?auto_5275 ?auto_5276 ) ) ( not ( = ?auto_5274 ?auto_5277 ) ) ( not ( = ?auto_5275 ?auto_5277 ) ) ( not ( = ?auto_5276 ?auto_5277 ) ) ( ON ?auto_5277 ?auto_5276 ) ( CLEAR ?auto_5277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5274 ?auto_5275 ?auto_5276 )
      ( MAKE-2PILE ?auto_5274 ?auto_5275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5280 - BLOCK
      ?auto_5281 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5281 ) ( CLEAR ?auto_5280 ) ( ON-TABLE ?auto_5280 ) ( not ( = ?auto_5280 ?auto_5281 ) ) )
    :subtasks
    ( ( !STACK ?auto_5281 ?auto_5280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5282 - BLOCK
      ?auto_5283 - BLOCK
    )
    :vars
    (
      ?auto_5284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5282 ) ( ON-TABLE ?auto_5282 ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( ON ?auto_5283 ?auto_5284 ) ( CLEAR ?auto_5283 ) ( HAND-EMPTY ) ( not ( = ?auto_5282 ?auto_5284 ) ) ( not ( = ?auto_5283 ?auto_5284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5283 ?auto_5284 )
      ( MAKE-2PILE ?auto_5282 ?auto_5283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5285 - BLOCK
      ?auto_5286 - BLOCK
    )
    :vars
    (
      ?auto_5287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5285 ?auto_5286 ) ) ( ON ?auto_5286 ?auto_5287 ) ( CLEAR ?auto_5286 ) ( not ( = ?auto_5285 ?auto_5287 ) ) ( not ( = ?auto_5286 ?auto_5287 ) ) ( HOLDING ?auto_5285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5285 )
      ( MAKE-2PILE ?auto_5285 ?auto_5286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5288 - BLOCK
      ?auto_5289 - BLOCK
    )
    :vars
    (
      ?auto_5290 - BLOCK
      ?auto_5291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5288 ?auto_5289 ) ) ( ON ?auto_5289 ?auto_5290 ) ( not ( = ?auto_5288 ?auto_5290 ) ) ( not ( = ?auto_5289 ?auto_5290 ) ) ( ON ?auto_5288 ?auto_5289 ) ( CLEAR ?auto_5288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5291 ) ( ON ?auto_5290 ?auto_5291 ) ( not ( = ?auto_5291 ?auto_5290 ) ) ( not ( = ?auto_5291 ?auto_5289 ) ) ( not ( = ?auto_5291 ?auto_5288 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5291 ?auto_5290 ?auto_5289 )
      ( MAKE-2PILE ?auto_5288 ?auto_5289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5293 - BLOCK
    )
    :vars
    (
      ?auto_5294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5294 ?auto_5293 ) ( CLEAR ?auto_5294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5293 ) ( not ( = ?auto_5293 ?auto_5294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5294 ?auto_5293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5295 - BLOCK
    )
    :vars
    (
      ?auto_5296 - BLOCK
      ?auto_5297 - BLOCK
      ?auto_5298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5296 ?auto_5295 ) ( CLEAR ?auto_5296 ) ( ON-TABLE ?auto_5295 ) ( not ( = ?auto_5295 ?auto_5296 ) ) ( HOLDING ?auto_5297 ) ( CLEAR ?auto_5298 ) ( not ( = ?auto_5295 ?auto_5297 ) ) ( not ( = ?auto_5295 ?auto_5298 ) ) ( not ( = ?auto_5296 ?auto_5297 ) ) ( not ( = ?auto_5296 ?auto_5298 ) ) ( not ( = ?auto_5297 ?auto_5298 ) ) )
    :subtasks
    ( ( !STACK ?auto_5297 ?auto_5298 )
      ( MAKE-1PILE ?auto_5295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5385 - BLOCK
    )
    :vars
    (
      ?auto_5386 - BLOCK
      ?auto_5387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5386 ?auto_5385 ) ( ON-TABLE ?auto_5385 ) ( not ( = ?auto_5385 ?auto_5386 ) ) ( not ( = ?auto_5385 ?auto_5387 ) ) ( not ( = ?auto_5386 ?auto_5387 ) ) ( ON ?auto_5387 ?auto_5386 ) ( CLEAR ?auto_5387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5385 ?auto_5386 )
      ( MAKE-1PILE ?auto_5385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5303 - BLOCK
    )
    :vars
    (
      ?auto_5306 - BLOCK
      ?auto_5304 - BLOCK
      ?auto_5305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5306 ?auto_5303 ) ( ON-TABLE ?auto_5303 ) ( not ( = ?auto_5303 ?auto_5306 ) ) ( not ( = ?auto_5303 ?auto_5304 ) ) ( not ( = ?auto_5303 ?auto_5305 ) ) ( not ( = ?auto_5306 ?auto_5304 ) ) ( not ( = ?auto_5306 ?auto_5305 ) ) ( not ( = ?auto_5304 ?auto_5305 ) ) ( ON ?auto_5304 ?auto_5306 ) ( CLEAR ?auto_5304 ) ( HOLDING ?auto_5305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5305 )
      ( MAKE-1PILE ?auto_5303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5307 - BLOCK
    )
    :vars
    (
      ?auto_5308 - BLOCK
      ?auto_5309 - BLOCK
      ?auto_5310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5308 ?auto_5307 ) ( ON-TABLE ?auto_5307 ) ( not ( = ?auto_5307 ?auto_5308 ) ) ( not ( = ?auto_5307 ?auto_5309 ) ) ( not ( = ?auto_5307 ?auto_5310 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5310 ) ) ( not ( = ?auto_5309 ?auto_5310 ) ) ( ON ?auto_5309 ?auto_5308 ) ( ON ?auto_5310 ?auto_5309 ) ( CLEAR ?auto_5310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5307 ?auto_5308 ?auto_5309 )
      ( MAKE-1PILE ?auto_5307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5314 - BLOCK
      ?auto_5315 - BLOCK
      ?auto_5316 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5316 ) ( CLEAR ?auto_5315 ) ( ON-TABLE ?auto_5314 ) ( ON ?auto_5315 ?auto_5314 ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5314 ?auto_5316 ) ) ( not ( = ?auto_5315 ?auto_5316 ) ) )
    :subtasks
    ( ( !STACK ?auto_5316 ?auto_5315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5317 - BLOCK
      ?auto_5318 - BLOCK
      ?auto_5319 - BLOCK
    )
    :vars
    (
      ?auto_5320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5318 ) ( ON-TABLE ?auto_5317 ) ( ON ?auto_5318 ?auto_5317 ) ( not ( = ?auto_5317 ?auto_5318 ) ) ( not ( = ?auto_5317 ?auto_5319 ) ) ( not ( = ?auto_5318 ?auto_5319 ) ) ( ON ?auto_5319 ?auto_5320 ) ( CLEAR ?auto_5319 ) ( HAND-EMPTY ) ( not ( = ?auto_5317 ?auto_5320 ) ) ( not ( = ?auto_5318 ?auto_5320 ) ) ( not ( = ?auto_5319 ?auto_5320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5319 ?auto_5320 )
      ( MAKE-3PILE ?auto_5317 ?auto_5318 ?auto_5319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5321 - BLOCK
      ?auto_5322 - BLOCK
      ?auto_5323 - BLOCK
    )
    :vars
    (
      ?auto_5324 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5321 ) ( not ( = ?auto_5321 ?auto_5322 ) ) ( not ( = ?auto_5321 ?auto_5323 ) ) ( not ( = ?auto_5322 ?auto_5323 ) ) ( ON ?auto_5323 ?auto_5324 ) ( CLEAR ?auto_5323 ) ( not ( = ?auto_5321 ?auto_5324 ) ) ( not ( = ?auto_5322 ?auto_5324 ) ) ( not ( = ?auto_5323 ?auto_5324 ) ) ( HOLDING ?auto_5322 ) ( CLEAR ?auto_5321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5321 ?auto_5322 )
      ( MAKE-3PILE ?auto_5321 ?auto_5322 ?auto_5323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5325 - BLOCK
      ?auto_5326 - BLOCK
      ?auto_5327 - BLOCK
    )
    :vars
    (
      ?auto_5328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5325 ) ( not ( = ?auto_5325 ?auto_5326 ) ) ( not ( = ?auto_5325 ?auto_5327 ) ) ( not ( = ?auto_5326 ?auto_5327 ) ) ( ON ?auto_5327 ?auto_5328 ) ( not ( = ?auto_5325 ?auto_5328 ) ) ( not ( = ?auto_5326 ?auto_5328 ) ) ( not ( = ?auto_5327 ?auto_5328 ) ) ( CLEAR ?auto_5325 ) ( ON ?auto_5326 ?auto_5327 ) ( CLEAR ?auto_5326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5328 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5328 ?auto_5327 )
      ( MAKE-3PILE ?auto_5325 ?auto_5326 ?auto_5327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5329 - BLOCK
      ?auto_5330 - BLOCK
      ?auto_5331 - BLOCK
    )
    :vars
    (
      ?auto_5332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5329 ?auto_5330 ) ) ( not ( = ?auto_5329 ?auto_5331 ) ) ( not ( = ?auto_5330 ?auto_5331 ) ) ( ON ?auto_5331 ?auto_5332 ) ( not ( = ?auto_5329 ?auto_5332 ) ) ( not ( = ?auto_5330 ?auto_5332 ) ) ( not ( = ?auto_5331 ?auto_5332 ) ) ( ON ?auto_5330 ?auto_5331 ) ( CLEAR ?auto_5330 ) ( ON-TABLE ?auto_5332 ) ( HOLDING ?auto_5329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5329 )
      ( MAKE-3PILE ?auto_5329 ?auto_5330 ?auto_5331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5333 - BLOCK
      ?auto_5334 - BLOCK
      ?auto_5335 - BLOCK
    )
    :vars
    (
      ?auto_5336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5333 ?auto_5334 ) ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( not ( = ?auto_5334 ?auto_5335 ) ) ( ON ?auto_5335 ?auto_5336 ) ( not ( = ?auto_5333 ?auto_5336 ) ) ( not ( = ?auto_5334 ?auto_5336 ) ) ( not ( = ?auto_5335 ?auto_5336 ) ) ( ON ?auto_5334 ?auto_5335 ) ( ON-TABLE ?auto_5336 ) ( ON ?auto_5333 ?auto_5334 ) ( CLEAR ?auto_5333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5336 ?auto_5335 ?auto_5334 )
      ( MAKE-3PILE ?auto_5333 ?auto_5334 ?auto_5335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5363 - BLOCK
    )
    :vars
    (
      ?auto_5364 - BLOCK
      ?auto_5365 - BLOCK
      ?auto_5366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5363 ?auto_5364 ) ( CLEAR ?auto_5363 ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( HOLDING ?auto_5365 ) ( CLEAR ?auto_5366 ) ( not ( = ?auto_5363 ?auto_5365 ) ) ( not ( = ?auto_5363 ?auto_5366 ) ) ( not ( = ?auto_5364 ?auto_5365 ) ) ( not ( = ?auto_5364 ?auto_5366 ) ) ( not ( = ?auto_5365 ?auto_5366 ) ) )
    :subtasks
    ( ( !STACK ?auto_5365 ?auto_5366 )
      ( MAKE-1PILE ?auto_5363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5367 - BLOCK
    )
    :vars
    (
      ?auto_5369 - BLOCK
      ?auto_5368 - BLOCK
      ?auto_5370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5367 ?auto_5369 ) ( not ( = ?auto_5367 ?auto_5369 ) ) ( CLEAR ?auto_5368 ) ( not ( = ?auto_5367 ?auto_5370 ) ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( not ( = ?auto_5369 ?auto_5370 ) ) ( not ( = ?auto_5369 ?auto_5368 ) ) ( not ( = ?auto_5370 ?auto_5368 ) ) ( ON ?auto_5370 ?auto_5367 ) ( CLEAR ?auto_5370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5369 ?auto_5367 )
      ( MAKE-1PILE ?auto_5367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5371 - BLOCK
    )
    :vars
    (
      ?auto_5372 - BLOCK
      ?auto_5374 - BLOCK
      ?auto_5373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5371 ?auto_5372 ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( not ( = ?auto_5371 ?auto_5374 ) ) ( not ( = ?auto_5371 ?auto_5373 ) ) ( not ( = ?auto_5372 ?auto_5374 ) ) ( not ( = ?auto_5372 ?auto_5373 ) ) ( not ( = ?auto_5374 ?auto_5373 ) ) ( ON ?auto_5374 ?auto_5371 ) ( CLEAR ?auto_5374 ) ( ON-TABLE ?auto_5372 ) ( HOLDING ?auto_5373 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5373 )
      ( MAKE-1PILE ?auto_5371 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5375 - BLOCK
    )
    :vars
    (
      ?auto_5376 - BLOCK
      ?auto_5378 - BLOCK
      ?auto_5377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5375 ?auto_5376 ) ( not ( = ?auto_5375 ?auto_5376 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5377 ) ) ( not ( = ?auto_5376 ?auto_5378 ) ) ( not ( = ?auto_5376 ?auto_5377 ) ) ( not ( = ?auto_5378 ?auto_5377 ) ) ( ON ?auto_5378 ?auto_5375 ) ( ON-TABLE ?auto_5376 ) ( ON ?auto_5377 ?auto_5378 ) ( CLEAR ?auto_5377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5376 ?auto_5375 ?auto_5378 )
      ( MAKE-1PILE ?auto_5375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5382 - BLOCK
    )
    :vars
    (
      ?auto_5383 - BLOCK
      ?auto_5384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5383 ?auto_5382 ) ( CLEAR ?auto_5383 ) ( ON-TABLE ?auto_5382 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( HOLDING ?auto_5384 ) ( not ( = ?auto_5382 ?auto_5384 ) ) ( not ( = ?auto_5383 ?auto_5384 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5384 )
      ( MAKE-1PILE ?auto_5382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5407 - BLOCK
      ?auto_5408 - BLOCK
    )
    :vars
    (
      ?auto_5409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5407 ?auto_5408 ) ) ( ON ?auto_5408 ?auto_5409 ) ( not ( = ?auto_5407 ?auto_5409 ) ) ( not ( = ?auto_5408 ?auto_5409 ) ) ( ON ?auto_5407 ?auto_5408 ) ( CLEAR ?auto_5407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5409 ?auto_5408 )
      ( MAKE-2PILE ?auto_5407 ?auto_5408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5412 - BLOCK
      ?auto_5413 - BLOCK
    )
    :vars
    (
      ?auto_5414 - BLOCK
      ?auto_5415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5412 ?auto_5413 ) ) ( ON ?auto_5413 ?auto_5414 ) ( CLEAR ?auto_5413 ) ( not ( = ?auto_5412 ?auto_5414 ) ) ( not ( = ?auto_5413 ?auto_5414 ) ) ( ON ?auto_5412 ?auto_5415 ) ( CLEAR ?auto_5412 ) ( HAND-EMPTY ) ( not ( = ?auto_5412 ?auto_5415 ) ) ( not ( = ?auto_5413 ?auto_5415 ) ) ( not ( = ?auto_5414 ?auto_5415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5412 ?auto_5415 )
      ( MAKE-2PILE ?auto_5412 ?auto_5413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5416 - BLOCK
      ?auto_5417 - BLOCK
    )
    :vars
    (
      ?auto_5419 - BLOCK
      ?auto_5418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5416 ?auto_5417 ) ) ( not ( = ?auto_5416 ?auto_5419 ) ) ( not ( = ?auto_5417 ?auto_5419 ) ) ( ON ?auto_5416 ?auto_5418 ) ( CLEAR ?auto_5416 ) ( not ( = ?auto_5416 ?auto_5418 ) ) ( not ( = ?auto_5417 ?auto_5418 ) ) ( not ( = ?auto_5419 ?auto_5418 ) ) ( HOLDING ?auto_5417 ) ( CLEAR ?auto_5419 ) ( ON-TABLE ?auto_5419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5419 ?auto_5417 )
      ( MAKE-2PILE ?auto_5416 ?auto_5417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5420 - BLOCK
      ?auto_5421 - BLOCK
    )
    :vars
    (
      ?auto_5422 - BLOCK
      ?auto_5423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5420 ?auto_5421 ) ) ( not ( = ?auto_5420 ?auto_5422 ) ) ( not ( = ?auto_5421 ?auto_5422 ) ) ( ON ?auto_5420 ?auto_5423 ) ( not ( = ?auto_5420 ?auto_5423 ) ) ( not ( = ?auto_5421 ?auto_5423 ) ) ( not ( = ?auto_5422 ?auto_5423 ) ) ( CLEAR ?auto_5422 ) ( ON-TABLE ?auto_5422 ) ( ON ?auto_5421 ?auto_5420 ) ( CLEAR ?auto_5421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5423 ?auto_5420 )
      ( MAKE-2PILE ?auto_5420 ?auto_5421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5424 - BLOCK
      ?auto_5425 - BLOCK
    )
    :vars
    (
      ?auto_5426 - BLOCK
      ?auto_5427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5424 ?auto_5425 ) ) ( not ( = ?auto_5424 ?auto_5426 ) ) ( not ( = ?auto_5425 ?auto_5426 ) ) ( ON ?auto_5424 ?auto_5427 ) ( not ( = ?auto_5424 ?auto_5427 ) ) ( not ( = ?auto_5425 ?auto_5427 ) ) ( not ( = ?auto_5426 ?auto_5427 ) ) ( ON ?auto_5425 ?auto_5424 ) ( CLEAR ?auto_5425 ) ( ON-TABLE ?auto_5427 ) ( HOLDING ?auto_5426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5426 )
      ( MAKE-2PILE ?auto_5424 ?auto_5425 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5428 - BLOCK
      ?auto_5429 - BLOCK
    )
    :vars
    (
      ?auto_5430 - BLOCK
      ?auto_5431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5428 ?auto_5429 ) ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( not ( = ?auto_5429 ?auto_5430 ) ) ( ON ?auto_5428 ?auto_5431 ) ( not ( = ?auto_5428 ?auto_5431 ) ) ( not ( = ?auto_5429 ?auto_5431 ) ) ( not ( = ?auto_5430 ?auto_5431 ) ) ( ON ?auto_5429 ?auto_5428 ) ( ON-TABLE ?auto_5431 ) ( ON ?auto_5430 ?auto_5429 ) ( CLEAR ?auto_5430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5431 ?auto_5428 ?auto_5429 )
      ( MAKE-2PILE ?auto_5428 ?auto_5429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5438 - BLOCK
      ?auto_5439 - BLOCK
      ?auto_5440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5439 ) ( ON-TABLE ?auto_5438 ) ( ON ?auto_5439 ?auto_5438 ) ( not ( = ?auto_5438 ?auto_5439 ) ) ( not ( = ?auto_5438 ?auto_5440 ) ) ( not ( = ?auto_5439 ?auto_5440 ) ) ( ON-TABLE ?auto_5440 ) ( CLEAR ?auto_5440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5440 )
      ( MAKE-3PILE ?auto_5438 ?auto_5439 ?auto_5440 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5441 - BLOCK
      ?auto_5442 - BLOCK
      ?auto_5443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5441 ) ( not ( = ?auto_5441 ?auto_5442 ) ) ( not ( = ?auto_5441 ?auto_5443 ) ) ( not ( = ?auto_5442 ?auto_5443 ) ) ( ON-TABLE ?auto_5443 ) ( CLEAR ?auto_5443 ) ( HOLDING ?auto_5442 ) ( CLEAR ?auto_5441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5441 ?auto_5442 )
      ( MAKE-3PILE ?auto_5441 ?auto_5442 ?auto_5443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5444 - BLOCK
      ?auto_5445 - BLOCK
      ?auto_5446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5444 ) ( not ( = ?auto_5444 ?auto_5445 ) ) ( not ( = ?auto_5444 ?auto_5446 ) ) ( not ( = ?auto_5445 ?auto_5446 ) ) ( ON-TABLE ?auto_5446 ) ( CLEAR ?auto_5444 ) ( ON ?auto_5445 ?auto_5446 ) ( CLEAR ?auto_5445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5446 )
      ( MAKE-3PILE ?auto_5444 ?auto_5445 ?auto_5446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5447 - BLOCK
      ?auto_5448 - BLOCK
      ?auto_5449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5447 ?auto_5448 ) ) ( not ( = ?auto_5447 ?auto_5449 ) ) ( not ( = ?auto_5448 ?auto_5449 ) ) ( ON-TABLE ?auto_5449 ) ( ON ?auto_5448 ?auto_5449 ) ( CLEAR ?auto_5448 ) ( HOLDING ?auto_5447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5447 )
      ( MAKE-3PILE ?auto_5447 ?auto_5448 ?auto_5449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5450 - BLOCK
      ?auto_5451 - BLOCK
      ?auto_5452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5450 ?auto_5451 ) ) ( not ( = ?auto_5450 ?auto_5452 ) ) ( not ( = ?auto_5451 ?auto_5452 ) ) ( ON-TABLE ?auto_5452 ) ( ON ?auto_5451 ?auto_5452 ) ( ON ?auto_5450 ?auto_5451 ) ( CLEAR ?auto_5450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5452 ?auto_5451 )
      ( MAKE-3PILE ?auto_5450 ?auto_5451 ?auto_5452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5456 - BLOCK
      ?auto_5457 - BLOCK
      ?auto_5458 - BLOCK
    )
    :vars
    (
      ?auto_5459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5456 ?auto_5457 ) ) ( not ( = ?auto_5456 ?auto_5458 ) ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( ON-TABLE ?auto_5458 ) ( ON ?auto_5457 ?auto_5458 ) ( CLEAR ?auto_5457 ) ( ON ?auto_5456 ?auto_5459 ) ( CLEAR ?auto_5456 ) ( HAND-EMPTY ) ( not ( = ?auto_5456 ?auto_5459 ) ) ( not ( = ?auto_5457 ?auto_5459 ) ) ( not ( = ?auto_5458 ?auto_5459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5456 ?auto_5459 )
      ( MAKE-3PILE ?auto_5456 ?auto_5457 ?auto_5458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5460 - BLOCK
      ?auto_5461 - BLOCK
      ?auto_5462 - BLOCK
    )
    :vars
    (
      ?auto_5463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5460 ?auto_5461 ) ) ( not ( = ?auto_5460 ?auto_5462 ) ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( ON-TABLE ?auto_5462 ) ( ON ?auto_5460 ?auto_5463 ) ( CLEAR ?auto_5460 ) ( not ( = ?auto_5460 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( not ( = ?auto_5462 ?auto_5463 ) ) ( HOLDING ?auto_5461 ) ( CLEAR ?auto_5462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5462 ?auto_5461 )
      ( MAKE-3PILE ?auto_5460 ?auto_5461 ?auto_5462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5464 - BLOCK
      ?auto_5465 - BLOCK
      ?auto_5466 - BLOCK
    )
    :vars
    (
      ?auto_5467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5464 ?auto_5465 ) ) ( not ( = ?auto_5464 ?auto_5466 ) ) ( not ( = ?auto_5465 ?auto_5466 ) ) ( ON-TABLE ?auto_5466 ) ( ON ?auto_5464 ?auto_5467 ) ( not ( = ?auto_5464 ?auto_5467 ) ) ( not ( = ?auto_5465 ?auto_5467 ) ) ( not ( = ?auto_5466 ?auto_5467 ) ) ( CLEAR ?auto_5466 ) ( ON ?auto_5465 ?auto_5464 ) ( CLEAR ?auto_5465 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5467 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5467 ?auto_5464 )
      ( MAKE-3PILE ?auto_5464 ?auto_5465 ?auto_5466 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5468 - BLOCK
      ?auto_5469 - BLOCK
      ?auto_5470 - BLOCK
    )
    :vars
    (
      ?auto_5471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5468 ?auto_5470 ) ) ( not ( = ?auto_5469 ?auto_5470 ) ) ( ON ?auto_5468 ?auto_5471 ) ( not ( = ?auto_5468 ?auto_5471 ) ) ( not ( = ?auto_5469 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( ON ?auto_5469 ?auto_5468 ) ( CLEAR ?auto_5469 ) ( ON-TABLE ?auto_5471 ) ( HOLDING ?auto_5470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5470 )
      ( MAKE-3PILE ?auto_5468 ?auto_5469 ?auto_5470 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5472 - BLOCK
      ?auto_5473 - BLOCK
      ?auto_5474 - BLOCK
    )
    :vars
    (
      ?auto_5475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5472 ?auto_5473 ) ) ( not ( = ?auto_5472 ?auto_5474 ) ) ( not ( = ?auto_5473 ?auto_5474 ) ) ( ON ?auto_5472 ?auto_5475 ) ( not ( = ?auto_5472 ?auto_5475 ) ) ( not ( = ?auto_5473 ?auto_5475 ) ) ( not ( = ?auto_5474 ?auto_5475 ) ) ( ON ?auto_5473 ?auto_5472 ) ( ON-TABLE ?auto_5475 ) ( ON ?auto_5474 ?auto_5473 ) ( CLEAR ?auto_5474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5475 ?auto_5472 ?auto_5473 )
      ( MAKE-3PILE ?auto_5472 ?auto_5473 ?auto_5474 ) )
  )

)

